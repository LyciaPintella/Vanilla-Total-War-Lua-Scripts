out("Loading lib_campaign_anouncement.lua")

campaign_anouncement = 
{
	config = 
	{
		activation_layout = "UI/Campaign UI/sea_announcement_popup",
		-- all the items below are components in the activation_layout
		icon_component = "dy_icon",
		title_component = "dy_title",
		text_component = "dy_text",
		acting_character_component = "ally_hero_template",
		target_character_component = "enemy_hero_template",
		portrait_component = "portraits",
		faction_emblem_component = "faction_emblem",

		-- time before we destroy the component
		layout_exist_duration_seconds = 5,
		-- when there is a display active and we want to show another - we wait this amount of seconds before retrying
		layout_retry_seconds = 1,
	},

	-- this uses *activation_setup* - a config for the notification to show. it is a table that should contain:
		--		icon
		--		title
		--		text_success
		--		text_failure - optional

	-- the instantiated layout we are showing right now
	currently_shown_indicator = nil,

	-- a queue of notifications to show once the currently shown notification completes
	pending_indicators = 
	{
		-- each notification item should have
		-- 	activation_setup
		--	is_action_successful		- optional, if not provided the action is considered successful by default
		--	performing_character		- optional
		--	other_character				- optional
		--	performing_character_state	- optional
		--	target_character_state		- optional
	},

	--- @function display_announcement
	--- @desc shows an indicator layout with dynamic data
	--- @p table activation_setup: table with icon, title, text
	--- @p [opt=true] bool is_action_successful - if the action was successfully executed, used when choosing which text to show
	--- @p [opt=nil] character_script_interface performing_character - the character executing the action
	--- @p [opt=nil] character_script_interface other_character - the character targeted by the action
	--- @p [opt="default"] string performing_character_state - could be default/disabled/wounded - the state to set to the character portrait compoennt 
	--- @p [opt="default"] string target_character_state - could be default/disabled/wounded - the state to set to the character portrait compoennt 
	display_announcement = function(self, activation_setup, is_action_successful, performing_character, other_character, performing_character_state, target_character_state)
		if is_action_successful == nil then
			is_action_successful = true
		end

		if performing_character_state == nil then
			performing_character_state = "default"
		end

		if target_character_state == nil then
			target_character_state = "default"
		end

		local performing_character_data = campaign_anouncement.get_character_portrait_data(performing_character, performing_character_state)
		local other_character_data = campaign_anouncement.get_character_portrait_data(other_character, target_character_state)

		campaign_anouncement:display_announcement_internal(activation_setup,
			is_action_successful,
			performing_character_data,
			other_character_data)
	end,

	display_announcement_internal = function(self, activation_setup, is_action_successful, performing_character_data, other_character_data)
		if self.currently_shown_indicator then
			-- we are already showing an indicator - we need to save this and try to show it later
			local pending_indicator = {}
			pending_indicator.activation_setup = activation_setup
			pending_indicator.is_action_successful = is_action_successful
			pending_indicator.performing_character_data = performing_character_data
			pending_indicator.other_character_data = other_character_data

			table.insert(campaign_anouncement.pending_indicators, pending_indicator)
			cm:callback(
				function()
					if (not campaign_anouncement.pending_indicators) or #campaign_anouncement.pending_indicators < 0 then
						return
					end
					local pending_indicator = campaign_anouncement.pending_indicators[1]
					table.remove(campaign_anouncement.pending_indicators, 1)
					campaign_anouncement:display_announcement_internal(pending_indicator.activation_setup,
						pending_indicator.is_action_successful,
						pending_indicator.performing_character_data,
						pending_indicator.other_character_data)
				end,
				campaign_anouncement.config.layout_retry_seconds, -- time we wait until we try to show the indicator again
				"campaign_anouncement_pending_indicator"
			)
			return
		end

		campaign_anouncement.currently_shown_indicator = core:get_or_create_component("campaign_anouncement_popup", campaign_anouncement.config.activation_layout)
		local icon_component = campaign_anouncement.currently_shown_indicator:SequentialFind(campaign_anouncement.config.icon_component)
		if icon_component then
			icon_component:SetImagePath(activation_setup.icon)
		end

		local title_component = campaign_anouncement.currently_shown_indicator:SequentialFind(campaign_anouncement.config.title_component)
		if title_component then
			local ui_info = common.get_localised_string(activation_setup.title)
			title_component:SetText(ui_info, activation_setup.title)
		end

		local text_component = campaign_anouncement.currently_shown_indicator:SequentialFind(campaign_anouncement.config.text_component)
		if text_component then
			local text_source = ""
			if is_action_successful then
				text_source = activation_setup.text_success or activation_setup.text
			else
				text_source = activation_setup.text_failure
			end
			local ui_info = common.get_localised_string(text_source)
			text_component:SetText(ui_info, text_source)
		end

		campaign_anouncement.display_character_portrait(campaign_anouncement.config.acting_character_component, performing_character_data)
		campaign_anouncement.display_character_portrait(campaign_anouncement.config.target_character_component, other_character_data)

		-- we destroy the component after some more time
		cm:callback(
			function()
				if campaign_anouncement.currently_shown_indicator then
					campaign_anouncement.currently_shown_indicator:Destroy()
					campaign_anouncement.currently_shown_indicator = nil
				end
			end,
			campaign_anouncement.config.layout_exist_duration_seconds,
			"sea_people_power_destroy_indicator"
		)
	end,

	get_character_portrait_data = function(character_object, character_state)
		if not character_object then
			return nil
		end

		local character_portrait_data = {}
		local family_member = character_object:family_member()
		character_portrait_data.character_portait_path = family_member:round_portrait_path()
		character_portrait_data.character_state = character_state
		local faction_obj = character_object:faction()
		if faction_obj 
			and (not faction_obj:is_null_interface())
			and (not faction_obj:is_dead())
			and (not faction_obj:is_rebel())
		then
			character_portrait_data.faction_portait_path = faction_obj:flag_path() .. "\\mon_24.png"
		end

		return character_portrait_data
	end,

	display_character_portrait = function(character_component_name, character_portrait_data)
		if not character_portrait_data then
			return
		end
		
		local character_component = campaign_anouncement.currently_shown_indicator:SequentialFind(character_component_name)
		if not character_component then
			return
		end

		local portrait_component = character_component:SequentialFind(campaign_anouncement.config.portrait_component)
		if not portrait_component then
			return
		end

		local faction_component = character_component:SequentialFind(campaign_anouncement.config.faction_emblem_component)
		if not faction_component then
			return
		end

		character_component:SetVisible(true)
		portrait_component:SetImagePath(character_portrait_data.character_portait_path)
		portrait_component:SetState(character_portrait_data.character_state)

		if is_string(character_portrait_data.faction_portait_path) then
			faction_component:SetImagePath(character_portrait_data.faction_portait_path)
			faction_component:SetVisible(true)
		else
			faction_component:SetVisible(false)
		end
	end,
}