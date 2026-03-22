out("Loading phar_war_spoils.lua")

local function output(str)
	if str then
		out("*** phar_war_spoils ***: " .. str)
	end
end


war_spoils = {
	config = war_spoils_config,

	persistent = {
		-- associated per-faction table, which holds the current faction's war-spoils related level
		-- the higher the level of a faction the more horde-ish the faction is regarded and as such the better the war spoil rewards/profits will be
		levels = {
			-- example format:
			-- ["phar_sea_sherden"] = 5,
			-- ["phar_sea_peleset"] = 2,
		},

		-- associated per-faction table, which holds the currently active war spoils region cooldowns
		region_cooldowns = {
		-- example format:
		-- ["phar_sea_sherden"] = {
		--	region1_key = 20,
		--	region2_key = 3,
		-- },
		},

		-- associated per-faction table, which holds the currently visible realms to a faction and the number of turns they'll be visible for
		realm_vision_cooldowns = {
		-- example format:
		-- ["phar_sea_sherden"] = {
		--	realm1_key = 3,
		--	realm2_key = 10,
		-- },
		},

		-- associated per-faction table, which holds info on whether the faction has extra level(s) coming from commands (phar_commands.lua)
		extra_levels_from_commands = {
			-- example format:
			-- ["phar_sea_sherden"] = { levels = 1, last_turn = 52, increase_max_level = true },
		},
	},

	selected_character_cqi = nil,
	component_cache = {},
	ui_non_mre_benefit_selected = "",
	ui_mre_benefit_selected = "",
	temporary_garrison_region_key = "",

	-------------
	--- FUNCTIONS

	is_faction_applicable = function(faction_key)
		return table_contains(sea_peoples_playable_faction_keys, faction_key) and cm:get_faction(faction_key):is_human()
	end,

	is_region_valid = function(region_key)
		return (war_spoils.config.regions[region_key] and true) or false
	end,

	get_benefit_config = function(benefit_key)
		return war_spoils.config.benefits[benefit_key]
	end,

	is_region_benefit_applicable_to_faction = function(region_benefit, faction_key)
		if not region_benefit or not region_benefit.factions then
			return false
		end
		return table_contains(region_benefit.factions, faction_key)
	end,

	is_region_benefit_applicable_to_campaign = function(region_benefit)
		if not region_benefit or not region_benefit.campaigns then
			return false
		end
		return table_contains(region_benefit.campaigns, cm:get_campaign_name())
	end,

	is_region_benefit_applicable = function(region_key, faction_key, region_benefit)
		return war_spoils.is_region_valid(region_key) and war_spoils.is_region_benefit_applicable_to_faction(region_benefit, faction_key) and war_spoils.is_region_benefit_applicable_to_campaign(region_benefit)
	end,

	get_region_config = function(region_key)
		return war_spoils.config.regions[region_key]
	end,

	get_region_config_benefit_by_key = function(faction_key, region_key, benefit_key)
		local region_config = war_spoils.get_region_config(region_key)
		if not region_config then
			return nil
		end

		return table_find(region_config, function(element) return element.benefit_key == benefit_key end)
	end,

	get_region_config_first_benefit_key = function(region_key)
		local region_config = war_spoils.get_region_config(region_key)
		if not region_config then
			return nil
		end

		return region_config[1].benefit_key
	end,

	is_resource_benefit = function(benefit_config)
		return (benefit_config and benefit_config.resource_key and true) or false
	end,

	has_non_resource_benefit = function(faction_key, region_key)
		local region_config = war_spoils.get_region_config(region_key)
		if not region_config then
			return false
		end

		for _, region_benefit in ipairs(region_config) do
			local benefit_config = war_spoils.get_benefit_config(region_benefit.benefit_key)
			if not war_spoils.is_resource_benefit(benefit_config) then
				return true
			end
		end

		return false
	end,

	get_num_mre_benefits = function()
		local num_mre_benefits = 0
		for _, benefit_config in pairs(war_spoils.config.benefits) do
			if war_spoils.is_resource_benefit(benefit_config) then
				num_mre_benefits = num_mre_benefits + 1
			end
		end

		return num_mre_benefits
	end,

	get_num_non_mre_benefits = function()
		return (table_size(war_spoils.config.benefits) - war_spoils.get_num_mre_benefits())
	end,

	get_region_cooldown = function(faction_key, region_key)
		if not war_spoils.is_region_valid(region_key) then
			return nil
		end

		local faction_cooldowns = war_spoils.persistent.region_cooldowns[faction_key]
		if not faction_cooldowns or not faction_cooldowns[region_key] then
			return 0
		end

		return faction_cooldowns[region_key]
	end,

	set_region_cooldown = function(faction_key, region_key, cooldown)
		war_spoils.persistent.region_cooldowns[faction_key] = war_spoils.persistent.region_cooldowns[faction_key] or {}
		war_spoils.persistent.region_cooldowns[faction_key][region_key] = cooldown
	end,

	advance_cooldowns_for_faction = function(faction_key)
		local region_cooldowns = war_spoils.persistent.region_cooldowns[faction_key]
		if not region_cooldowns then
			return
		end

		for region_key, region_cooldown in pairs(region_cooldowns) do
			local new_region_cooldown = math.max(0, region_cooldown - 1)
			if new_region_cooldown == 0 then
				war_spoils.persistent.region_cooldowns[faction_key][region_key] = nil
			else
				war_spoils.persistent.region_cooldowns[faction_key][region_key] = new_region_cooldown
			end
		end
	end,

	set_realm_vision_cooldown = function(faction_key, realm_key, cooldown)
		war_spoils.persistent.realm_vision_cooldowns[faction_key] = war_spoils.persistent.realm_vision_cooldowns[faction_key] or {}
		war_spoils.persistent.realm_vision_cooldowns[faction_key][realm_key] = cooldown
	end,

	process_vision_of_realms = function(faction_key)
		local realm_vision_cooldowns = war_spoils.persistent.realm_vision_cooldowns[faction_key]
		if not realm_vision_cooldowns then
			return
		end

		local vision_benefit_config = war_spoils.get_benefit_config("vision")
		local vision_effect_bundle_key = vision_benefit_config.effect_bundle_key
		if not vision_effect_bundle_key then
			script_error("Incorrect war spoil benefit acquired!")
		end

		for realm_key, remaining_turns in dpairs(realm_vision_cooldowns) do
			local new_remaining_turns = math.max(0, remaining_turns - 1)
			war_spoils.persistent.realm_vision_cooldowns[faction_key][realm_key] = new_remaining_turns

			if new_remaining_turns > 0 then
				local region_keys = phar_realms.get_regions_for_realm(realm_key)
				for i = 1, #region_keys do
					local region_key = region_keys[i]
					local region = cm:get_region(region_key)

					if not region:has_effect_bundle(vision_effect_bundle_key) then	-- reapplying the bundle in case the region has changed ownership (in which case the effect bundle would have been removed)
						cm:apply_effect_bundle_to_region(vision_effect_bundle_key, region_key, new_remaining_turns)
					end
					cm:make_region_visible_in_shroud(faction_key, region_key)
				end
			else
				war_spoils.persistent.realm_vision_cooldowns[faction_key][realm_key] = nil
			end
		end
	end,

	get_faction_level = function(faction_key)
		return war_spoils.persistent.levels[faction_key]
	end,

	get_maximum_faction_level = function(faction_key)
		return war_spoils.config.max_faction_level_override[faction_key] or war_spoils.config.max_faction_level
	end,

	get_num_faction_levels = function()
		return table_size(war_spoils.config.num_regions_lower_bound_for_level)
	end,

	get_max_owned_settlements_granting_benefits = function()
		return war_spoils.config.num_regions_lower_bound_for_level[1]
	end,

	calculate_faction_level = function(faction_key)
		local num_owned_regions = cm:get_faction(faction_key):region_list():num_items()

		local faction_level = war_spoils.get_num_faction_levels()
		for level, num_regions_lower_bound in ipairs_reverse(war_spoils.config.num_regions_lower_bound_for_level) do
			if num_regions_lower_bound <= num_owned_regions then
				faction_level = level
			else
				break
			end
		end

		local turn_number = cm:turn_number()

		local extra_levels_from_commands = war_spoils.persistent.extra_levels_from_commands[faction_key]
		if extra_levels_from_commands then
			local last_turn = extra_levels_from_commands.last_turn ~= -1 and extra_levels_from_commands.last_turn
			local extra_levels = extra_levels_from_commands.levels
			if (not last_turn or turn_number <= last_turn) and
				(extra_levels_from_commands.increase_max_level or faction_level + extra_levels <= war_spoils.get_num_faction_levels())
			then
				faction_level = faction_level + extra_levels
			end
		end

		if turn_number ~= 1 and faction_level ~= war_spoils.persistent.levels[faction_key] then
			cm:notify_war_spoils_faction_level_changes(war_spoils.persistent.levels[faction_key], faction_level, turn_number)
		end

		war_spoils.persistent.levels[faction_key] = faction_level
	end,

	is_raze_settlement_decision = function(decision, garrison_residence)
		return garrison_residence:is_settlement() and (decision == "occupation_decision_raze" or decision == "occupation_decision_raze_without_occupy" or decision == "occupation_decision_raze_and_exterminate")
	end,

	-- returns the main building of the region (if it exists)
	get_main_building_of_region = function(region_key)
		local region = cm:get_region(region_key)
		if not region or region:is_null_interface() then
			script_error("Invalid region!")
			return nil
		end

		local building = region:settlement():slot_list():item_at(0):building()
		return not building:is_null_interface() and building
	end,

	get_main_building_level_of_region = function(region_key)
		local main_building = war_spoils.get_main_building_of_region(region_key)
		return main_building and main_building:level() or 0
	end,

	-- unused function
	randomly_give_ancillaries = function(how_many, character, ancillary_list)
		local i = 0
		while i < how_many do
			local random_index = cm:model():random_int(1, #ancillary_list)

			local ancillary_key_selected = ancillary_list[random_index]

			cm:force_add_ancillary(cm:char_lookup_str(character), ancillary_key_selected)

			i = i + 1
		end
	end,

	randomly_give_ancillaries_no_duplicates = function(how_many, character, ancillary_list, max_tries_input)
		local max_tries = 100
		if is_number(max_tries_input) then
			max_tries = max_tries_input
		end

		local granted_ancillary_indices = {}
		local i = 0
		while i < how_many do
			local random_index
			local tries = 0
			repeat
				random_index = cm:model():random_int(1, #ancillary_list)
				tries = tries + 1
			until (not table_contains(granted_ancillary_indices, random_index) or tries > max_tries)
			table.insert(granted_ancillary_indices, random_index)

			local ancillary_key_selected = ancillary_list[random_index]

			cm:force_add_ancillary(cm:char_lookup_str(character), ancillary_key_selected)

			i = i + 1
		end
	end,

	on_benefit_granted = function(faction_key, region_key, benefit_config, benefit_key)
		cm:notify_war_spoils_acquired_benefits(benefit_key)

		local main_building_level = war_spoils.get_main_building_level_of_region(region_key)
		cm:notify_war_spoils_settlement_building_levels(main_building_level)

		if war_spoils.is_resource_benefit(benefit_config) then
			local faction_level = war_spoils.get_faction_level(faction_key)
			local resource_amount = benefit_config.levels[faction_level][main_building_level]
			cm:notify_war_spoils_resource_amounts_of_acquired_mre_benefits(benefit_key, resource_amount)
		end
	end,

	settle_raze_occcupation_decision = function(character, faction_key, region_key)
		local is_horde = tribes_privileges.is_horde_type(character:military_force())
		if not is_horde then
			return
		end

		local region_config = war_spoils.get_region_config(region_key)
		if not region_config then
			return
		end

		local any_benefits_granted = false
		for _, region_benefit in ipairs(region_config) do
			local region_cooldown = war_spoils.get_region_cooldown(faction_key, region_key)
			if region_benefit and is_number(region_cooldown) and region_cooldown == 0
				and war_spoils.is_region_benefit_applicable(region_key, faction_key, region_benefit)
			then
				local benefit_config = war_spoils.get_benefit_config(region_benefit.benefit_key)
				local benefit_granted, debug_msg = benefit_config:apply(character, region_key)
				output(debug_msg)

				if benefit_granted then
					any_benefits_granted = benefit_granted
					war_spoils.ui.emit_event_feed_message_war_spoil_granted(faction_key, region_key, benefit_config)
					war_spoils.on_benefit_granted(faction_key, region_key, benefit_config, region_benefit.benefit_key)
				end
			end
		end

		if any_benefits_granted then
			local cooldown = war_spoils.has_non_resource_benefit(faction_key, region_key) and war_spoils.config.cooldown_for_non_resource_benefit or war_spoils.config.cooldown_for_resource_benefit
			war_spoils.set_region_cooldown(faction_key, region_key, cooldown)
		end
	end,

	log_faction_stats = function(faction_key)
		local level = war_spoils.get_faction_level(faction_key)
		output("War Spoils tier for '" .. faction_key .. "' = " .. tostring(level) .. "." )
	end,

	set_extra_levels_from_commands = function(faction_key, levels, last_turn, increase_max_level)
		if not levels or levels == 0 then
			war_spoils.persistent.extra_levels_from_commands[faction_key] = nil
		else
			war_spoils.persistent.extra_levels_from_commands[faction_key] = {
				levels = levels,
				last_turn = last_turn,
				increase_max_level = increase_max_level
			}
		end

		war_spoils.calculate_faction_level(faction_key)
	end,


	----------------
	--- UI FUNCTIONS
	ui = {
		emit_event_feed_message_war_spoil_granted = function(faction_key, region_key, benefit_config)
			cm:add_event_feed_event("sea_peoples_war_spoils_benefit_acquired", faction_key, 0, region_key, benefit_config.ui.title_localization_key)
		end,

		set_enable_ui = function(should_enable)
			if should_enable then
				uim:override("hide_war_spoils"):unlock(true)
			else
				uim:override("hide_war_spoils"):lock(true)
			end

			local war_spoils_faction_button_container_component = core:get_ui_root():SequentialFind(war_spoils.config.ui.component_ids.war_spoils_faction_button_container)
			if war_spoils_faction_button_container_component then
				war_spoils_faction_button_container_component:SetVisible(should_enable)
			end
		end,

		--- @function get_closest_region_key_with_benefit
		--- @desc	returns the region_key, which is located closest to selected own-faction character, which has war spoil benefit specified by benefit_key that is available to be acquired by applicable faction_key on this turn
		--- @			and -optionally- with specified target_main_building_level
		--- @		if no such character is selected then returns the region_key with war spoil closest to the first available own-faction character
		--- @		if there's still no such character available then returns the region_key with war spoil closest to the faction's home region
		--- @p string faction_key : the db key of the faction that performs the query
		--- @p string benefit_key : the required war spoil benefit that can be acquired by the region
		--- @p [opt=nil] number target_main_building_level : the region's main building level required
		--- @p [opt=nil] bool should_exclude_owned : whether to exclude regions owned by faction_key from the search
		--- @p [opt=nil] bool should_exclude_razed : whether to exclude razed regions from the search
		--- @return string the closest region_key that meets the requirements, or nil if no such region is found
		get_closest_region_key_with_benefit = function(faction_key, benefit_key, target_main_building_level, should_exclude_owned, should_exclude_razed)
			if not is_string(faction_key) or faction_key == "" or not is_string(benefit_key) or benefit_key == "" then
				script_error("invalid arguments!")
				return
			end

			local selected_x = nil
			local selected_y = nil

			local selected_character = war_spoils.selected_character_cqi and cm:get_character_by_cqi(war_spoils.selected_character_cqi) or nil
			if selected_character and not selected_character:is_null_interface() and not selected_character:is_wounded() then
				selected_x = selected_character:display_position_x()
				selected_y = selected_character:display_position_y()
			else
				local faction = cm:get_faction(faction_key)
				local character_list = faction:character_list()
				if character_list:is_empty() then
					local home_settlement = faction:home_region():settlement()
					selected_x = home_settlement:display_position_x()
					selected_y = home_settlement:display_position_y()
				else
					local find_first_active_general = function()
						local last_character_index = character_list:num_items() - 1
						for i = 0, last_character_index do
							local character = character_list:item_at(i)
							if character and not character:is_null_interface() and not character:is_wounded() and character:has_military_force() then
								return character
							end
						end
					end

					local first_active_general = find_first_active_general()
					selected_x = first_active_general:display_position_x()
					selected_y = first_active_general:display_position_y()
				end
			end

			local closest_region_key = nil
			local closest_settlement_distance = 999999999
			local region_list = cm:model():world():region_manager():region_list()
			for i = 0, region_list:num_items() - 1 do
				local region = region_list:item_at(i)
				local region_key = region:name()

				if (is_nil(should_exclude_owned) or (should_exclude_owned == true and region:owning_faction():name() ~= faction_key))
					and (is_nil(should_exclude_razed) or (should_exclude_razed == true and not region:is_abandoned()))
				then
					local region_config = war_spoils.get_region_config(region_key)
					if region_config then
						for _, region_benefit in ipairs(region_config) do
							local region_cooldown = war_spoils.get_region_cooldown(faction_key, region_key)
							if is_number(region_cooldown) and region_cooldown == 0
								and benefit_key == region_benefit.benefit_key
								and war_spoils.is_region_benefit_applicable(region_key, faction_key, region_benefit)
								and (is_nil(target_main_building_level) or (target_main_building_level == war_spoils.get_main_building_level_of_region(region_key) and target_main_building_level > 0))
							then
								local settlement = region:settlement()
								local distance = distance_squared(settlement:display_position_x(), settlement:display_position_y(), selected_x, selected_y)

								if distance < closest_settlement_distance then
									closest_region_key = region_key
									closest_settlement_distance = distance
								end
							end
						end
					end
				end
			end

			return closest_region_key
		end,

		scroll_camera_to_closest_settlement_with_war_spoil = function(faction_key, benefit_key, target_main_building_level, should_exclude_owned, should_exclude_razed)
			local closest_region_key = war_spoils.ui.get_closest_region_key_with_benefit(faction_key, benefit_key, target_main_building_level, should_exclude_owned, should_exclude_razed)
			if closest_region_key then
				cm:scroll_camera_to_settlement(closest_region_key)
			end
		end,

		refresh_main_panel = function()
			if not core.ui_is_created or not is_function(core.get_ui_root) then
				script_error("ui hasn't been created yet!")
				return
			end

			local main_panel_component = core:get_ui_root():SequentialFind(war_spoils.config.ui.panel_name)
			if not main_panel_component then
				script_error("War Spoils main panel component not found!")
				return
			end

			local local_faction_key = cm:get_local_faction_name(true)
			local illustration_holder_component = main_panel_component:SequentialFind(war_spoils.config.ui.component_ids.illustration_holder)
			if illustration_holder_component then
				local state_name = war_spoils.config.ui.component_states.illustration_holder[war_spoils.get_faction_level(local_faction_key)] or "rank_1"
				illustration_holder_component:SetState(state_name)
			end

			local leader_portrait_component = main_panel_component:SequentialFind(war_spoils.config.ui.component_ids.leader_portrait)
			if leader_portrait_component then
				local portrait_component_state_name = war_spoils.config.ui.component_states.leader_portraits[local_faction_key] or ""
				leader_portrait_component:SetState(portrait_component_state_name)
			end
			
			local rank_bar_holder_component = illustration_holder_component:SequentialFind(war_spoils.config.ui.component_ids.rank_bar_holder)

			war_spoils.ui.setup_panel_rank_progress_bar(rank_bar_holder_component, local_faction_key)

			local non_resource_holder_component = illustration_holder_component:SequentialFind(war_spoils.config.ui.component_ids.non_mre_holder_parent)
			local resource_holder_component = illustration_holder_component:SequentialFind(war_spoils.config.ui.component_ids.mre_holder_parent)
			local non_resource_spoils_info_component = non_resource_holder_component:SequentialFind(war_spoils.config.ui.component_ids.spoils_info)
			local resource_spoils_info_component = resource_holder_component:SequentialFind(war_spoils.config.ui.component_ids.spoils_info)
			non_resource_spoils_info_component:SetVisible(false)
			resource_spoils_info_component:SetVisible(false)

			war_spoils.component_cache.non_resource_holder_component = non_resource_holder_component
			war_spoils.component_cache.resource_holder_component = resource_holder_component
			war_spoils.component_cache.non_resource_spoils_info_component = non_resource_spoils_info_component
			war_spoils.component_cache.resource_spoils_info_component = resource_spoils_info_component

			-- setup tooltips for war spoil benefit buttons
			-- non-mre buttons
			for i = 1, war_spoils.get_num_non_mre_benefits() do
				local panel_benefit_button_component = non_resource_holder_component:SequentialFind(war_spoils.config.ui.component_ids.spoils_button_prefix .. tostring(i))
				war_spoils.ui.setup_panel_benefit_button_tooltip(local_faction_key, panel_benefit_button_component, false)
			end
			-- mre buttons
			for i = 1, war_spoils.get_num_mre_benefits() do
				local panel_benefit_button_component = resource_holder_component:SequentialFind(war_spoils.config.ui.component_ids.spoils_button_prefix .. tostring(i))
				war_spoils.ui.setup_panel_benefit_button_tooltip(local_faction_key, panel_benefit_button_component, true)
			end

			-- show the first/left-most benefit button for each benefit category
			war_spoils.ui.update_panel_non_mre_info(local_faction_key, non_resource_holder_component:SequentialFind(war_spoils.config.ui.component_ids.spoils_button_prefix .. "1"))
			war_spoils.ui.update_panel_mre_info(local_faction_key, resource_holder_component:SequentialFind(war_spoils.config.ui.component_ids.spoils_button_prefix .. "1"))
		end,

		get_benefit_key_from_button_component = function(component, is_mre_section)
			local component_id = component:Id()
			local benefit_key = ""
			local benefit_order_table = is_mre_section and war_spoils.config.ui.mre_benefit_button_order or war_spoils.config.ui.non_mre_benefit_button_order
			local max_index = math.max(war_spoils.get_num_non_mre_benefits(), war_spoils.get_num_mre_benefits())
			for i = 1, max_index do
				if component_id == war_spoils.config.ui.component_ids.spoils_button_prefix .. tostring(i) then
					benefit_key = benefit_order_table[i]
					break
				end
			end

			if benefit_key == "" then
				script_error("Invalid war spoil benefit button pressed!")
				return
			end

			return benefit_key
		end,

		get_button_component_from_benefit_key = function(benefit_key, is_mre_section)
			if not is_string(benefit_key) or benefit_key == "" then
				return
			end

			local button_parent_component
			local component_index
			if is_mre_section then
				component_index = table_find(war_spoils.config.ui.mre_benefit_button_order, benefit_key, true)
				button_parent_component = war_spoils.component_cache.resource_holder_component
			else
				component_index = table_find(war_spoils.config.ui.non_mre_benefit_button_order, benefit_key, true)
				button_parent_component = war_spoils.component_cache.non_resource_holder_component
			end

			local component_id = war_spoils.config.ui.component_ids.spoils_button_prefix .. tostring(component_index)
			return button_parent_component:SequentialFind(component_id)
		end,

		reset_previous_button = function(previous_benefit_key, is_mre_section)
			local button_component = war_spoils.ui.get_button_component_from_benefit_key(previous_benefit_key, is_mre_section)
			if button_component and button_component:CurrentState() == war_spoils.config.ui.component_states.selected then
				button_component:SetState(war_spoils.config.ui.component_states.active)
			end
		end,

		setup_panel_benefit_button_tooltip = function(faction_key, button_component, is_mre_section)
			local benefit_key = war_spoils.ui.get_benefit_key_from_button_component(button_component, is_mre_section)
			local benefit_config = war_spoils.get_benefit_config(benefit_key)
			local icon_path = benefit_config.ui.icon_path
			button_component:SetImagePath(icon_path)

			local cco_table = {
				LocalizedTitle = get_localised_text_replacement(benefit_config.ui.title_localization_key),
				IconPath = icon_path,
				Cooldown = tostring(-1),
				Rank = tostring(war_spoils.get_faction_level(faction_key)),
				IsSettledCharacterSelected = false,
				IsResourceBenefit = war_spoils.is_resource_benefit(benefit_config),
				LocalizedRewardText = "",
				LocalizedWarningText = "",
				IsForPanel = true,
			}

			button_component:SetTooltipText("{{tt:" .. war_spoils.config.ui.benefit_tooltip_layout_path .. "}}", "", true)
			local cco_id = "panel_war_spoil_benefit" .. benefit_key .. "_cco_id"
			button_component:SetProperty("script_id", cco_id)
			common.set_context_value(cco_id, cco_table)
		end,

		setup_panel_rank_progress_bar = function(rank_bar_holder_component, faction_key)
			local settlements_rank_text_component = rank_bar_holder_component:SequentialFind(war_spoils.config.ui.component_ids.rank_value)
			local current_faction_rank = war_spoils.get_faction_level(faction_key)
			settlements_rank_text_component:SetText(tostring(current_faction_rank))

			local settlements_count_text_component = rank_bar_holder_component:SequentialFind(war_spoils.config.ui.component_ids.num_owned_settlements)
			local num_owned_settlements = cm:get_faction(faction_key):region_list():num_items()
			settlements_count_text_component:SetText(tostring(num_owned_settlements))

			local threshold_holder_component = rank_bar_holder_component:SequentialFind(war_spoils.config.ui.component_ids.threshold_holder)
			local threshold_template_component = rank_bar_holder_component:SequentialFind(war_spoils.config.ui.component_ids.template_threshold)
			threshold_holder_component:DestroyChildren()
			threshold_template_component:SetVisible(false)

			local total_width = threshold_holder_component:Width()
			local num_gradations = war_spoils.get_maximum_faction_level(faction_key)
			local modifier = total_width / num_gradations	-- multiplier for offsetting the vertical lines along the progress bar

			-- create vertical separator lines/tiers/thresholds along the horizontal bar
			for i = 1, num_gradations do
				local threshold_component = UIComponent(threshold_holder_component:CreateFromComponent(threshold_template_component:Address(), string.format("tier_%d", i)))
				threshold_component:SetVisible(true)

				if i == num_gradations then
					-- last tier line should be invisible
					threshold_component:SetVisible(false)
				end

				local x, y = threshold_component:GetDockOffset()
				x = modifier * i
				threshold_component:SetDockOffset(x, y)
			end

			war_spoils.ui.setup_panel_rank_progress_bar_tooltip(threshold_holder_component, faction_key)

			-- set the progress bar's fill
			local progress_bar_fill_component = rank_bar_holder_component:SequentialFind(war_spoils.config.ui.component_ids.progress_bar_fill)
			if progress_bar_fill_component then
				local cco_table = {
					RankBarProgress = math.clamp(current_faction_rank / num_gradations, 0, 1)
				}

				local cco_id = "war_spoils_progress_bar_rank_cco_id"
				progress_bar_fill_component:SetProperty("script_id", cco_id)
				common.set_context_value(cco_id, cco_table)
			end
		end,

		--- @function get_benefit_localized_reward_text_and_source
		--- @p string faction_key : database key
		--- @p string benefit_key : database key
		--- @p number target_faction_rank : we target faction level we want to query the benefit's rewards (may be different than `faction_key`s actual faction rank/level)
		--- @p string region_key : the target region_key where the benefit lies
		--- @p [opt=nil] bool is_for_panel : whether the reward text will be displaying on the main war spoils panel
		--- @p [opt=nil] character_script_interface selected_character : the character - needed for bonuses
		get_benefit_localized_reward_text_and_source = function(faction_key, benefit_key, target_faction_rank, region_key, is_for_panel, selected_character)
			local benefit_config = war_spoils.get_benefit_config(benefit_key)

			if target_faction_rank == 1 then
				return get_localised_text_replacement_and_source(war_spoils.config.ui.localization_keys.panel_reward_ancillary_none)
			end

			if war_spoils.is_resource_benefit(benefit_config) then
				local main_building_level = war_spoils.get_main_building_level_of_region(region_key)
				local amount = benefit_config.levels[target_faction_rank][math.max(main_building_level, 1)]
				if selected_character then
					local military_force = selected_character:military_force()
					if military_force then
						local change_perc = military_force:bonus_values():scripted_value("scripted_war_spoils_mre_mod", "value")
						local change = (amount * change_perc) / 100
						amount = amount + change
					end
				end
				return get_localised_text_replacement_and_source_safe_formatted(benefit_config.ui.tooltip_localization_key, tostring(amount), get_localised_text_replacement(benefit_config.ui.resource_localization_key))
			else
				if benefit_key == "ancillaries" then
					local common_config = benefit_config.levels[target_faction_rank]["common"]
					num_commons = common_config[1]
					local rare_config = benefit_config.levels[target_faction_rank]["rare"]
					num_rares = rare_config[1]
					local unique_config = benefit_config.levels[target_faction_rank]["unique"]
					num_uniques = unique_config[1]
					if num_uniques ~= 0 then
						unique_chance = unique_config[2]
						return get_localised_text_replacement_and_source_safe_formatted(war_spoils.config.ui.localization_keys.panel_reward_ancillary_unique, num_rares, unique_chance, num_uniques)
					elseif num_rares ~= 0 then
						return get_localised_text_replacement_and_source_safe_formatted(war_spoils.config.ui.localization_keys.panel_reward_ancillary_uncommon, num_rares)
					elseif num_commons ~= 0 then
						return get_localised_text_replacement_and_source_safe_formatted(war_spoils.config.ui.localization_keys.panel_reward_ancillary_common, num_commons)
					end
				elseif benefit_key == "development_points" then
					local development_points = benefit_config.levels[target_faction_rank]
					return get_localised_text_replacement_and_source_safe_formatted(war_spoils.config.ui.localization_keys.panel_reward_development_points, development_points)
				elseif benefit_key == "native_units" then
					local region_benefit_config = war_spoils.get_region_config_benefit_by_key(faction_key, region_key, benefit_key)
					local num_units = #region_benefit_config.levels[target_faction_rank]
					return get_localised_text_replacement_and_source_safe_formatted(benefit_config.ui.tooltip_localization_key, num_units)
				elseif benefit_key == "vision" then
					local num_turns_in_effect = benefit_config.levels[target_faction_rank]
					return get_localised_text_replacement_and_source_safe_formatted(benefit_config.ui.tooltip_localization_key, num_turns_in_effect)
				elseif benefit_key == "experience" then
					local experience_points = benefit_config.levels[target_faction_rank]
					return get_localised_text_replacement_and_source_safe_formatted(benefit_config.ui.tooltip_localization_key, experience_points)
				elseif benefit_key == "effects" then
					if is_for_panel then
						local level_config = benefit_config.levels[target_faction_rank]
						local effect_bundle_key = level_config[1]
						local duration = level_config[2]

						local get_icon_from_temporary_bundle = function(key)
							cm:apply_effect_bundle_to_region(key, region_key, duration)
							local effect_bundle = cm:get_region(region_key):get_effect_bundle(key)
							local effect_bundle_icon
							if effect_bundle and not effect_bundle:is_null_interface() then
								effect_bundle_icon = "[[img:" .. "UI/Campaign UI/Effect_bundles/" .. effect_bundle:icon_path()  .. "]][[/img]]"
							end
							cm:remove_effect_bundle_from_region(key, region_key)
							return effect_bundle_icon
						end

						local localized_effect_bundle_name = common.get_localised_string("effect_bundles_localised_title_" .. effect_bundle_key)
						local localized_reward_text = get_localised_text_replacement_safe_formatted(benefit_config.ui.tooltip_localization_key, localized_effect_bundle_name, get_icon_from_temporary_bundle(effect_bundle_key), duration)
						local color_code = (target_faction_rank == war_spoils.get_faction_level(faction_key) and war_spoils.config.ui.colour_codes.green) or war_spoils.config.ui.colour_codes.white

						return "[[tooltip:{{tt:" .. war_spoils.config.ui.effect_bundle_tooltip_layout_path .. ":FindContext(\"CcoEffectBundle\", TableValue.EffectBundleKey)}}]][[b]][[col:" .. color_code .. "]]" ..  localized_reward_text .. "[[/col]][[/b]][[/tooltip]]"
							, effect_bundle_key
					else
						return "", ""
					end
				end
			end
		end,

		update_panel_non_mre_info = function(faction_key, component)
			local benefit_key = war_spoils.ui.get_benefit_key_from_button_component(component, false)

			war_spoils.ui.reset_previous_button(war_spoils.ui_non_mre_benefit_selected, false)

			local spoils_info_component = war_spoils.component_cache.non_resource_spoils_info_component
			if war_spoils.ui_non_mre_benefit_selected ~= benefit_key then
				spoils_info_component:SetVisible(true)
				war_spoils.ui_non_mre_benefit_selected = benefit_key
			end

			local benefit_config = war_spoils.get_benefit_config(benefit_key)

			local spoil_name_component = spoils_info_component:SequentialFind(war_spoils.config.ui.component_ids.spoils_info_spoil_name)
			local benefit_localized_title, benefit_localized_source = get_localised_text_replacement_and_source(benefit_config.ui.title_localization_key)
			spoil_name_component:SetText(benefit_localized_title, benefit_localized_source)
			local spoil_icon_component = spoils_info_component:SequentialFind(war_spoils.config.ui.component_ids.spoils_info_spoil_icon)
			spoil_icon_component:SetImagePath(benefit_config.ui.icon_path)

			local rank_holder_component = spoils_info_component:SequentialFind(war_spoils.config.ui.component_ids.mre_rank_holder)
			local rank_template_component = spoils_info_component:SequentialFind(war_spoils.config.ui.component_ids.non_mre_rank_template)
			local separator_template_component = spoils_info_component:SequentialFind(war_spoils.config.ui.component_ids.mre_rank_template_separator)
			rank_template_component:SetVisible(false)
			separator_template_component:SetVisible(false)
			rank_holder_component:DestroyChildren()

			local region_key = war_spoils.ui.get_closest_region_key_with_benefit(faction_key, benefit_key)

			local current_faction_level = war_spoils.get_faction_level(faction_key)
			local num_rows = war_spoils.get_maximum_faction_level(faction_key)
			for i = 1, num_rows do
				local level_str = tostring(i)
				local rank_component_id = "non_mre_rank_component_" .. level_str
				local non_mre_rank_component = UIComponent(rank_holder_component:CreateFromComponent(rank_template_component:Address(), rank_component_id))
				non_mre_rank_component:SetVisible(true)
				local separator_component_id = "separator_" .. level_str
				local separator_component = UIComponent(rank_holder_component:CreateFromComponent(separator_template_component:Address(), separator_component_id))
				separator_component:SetVisible(true)

				local rank_text_component = non_mre_rank_component:SequentialFind(war_spoils.config.ui.component_ids.mre_rank_template_rank)
				rank_text_component:SetText(level_str, "")
				local state_name = (i == current_faction_level) and war_spoils.config.ui.component_states.active or war_spoils.config.ui.component_states.default
				rank_text_component:SetState(state_name)

				local non_mre_rank_reward_component = non_mre_rank_component:SequentialFind(war_spoils.config.ui.component_ids.non_mre_rank_template_reward)
				non_mre_rank_reward_component:SetState(state_name)

				local localized_reward_text, localized_reward_source = war_spoils.ui.get_benefit_localized_reward_text_and_source(faction_key, benefit_key, i, region_key, true)

				local should_be_interactive = (benefit_key == "effects" and i ~= 1)
				non_mre_rank_reward_component:SetInteractive(should_be_interactive)
				if should_be_interactive then
					local cco_table = {
						EffectBundleKey = localized_reward_source,
					}

					local cco_id = "_war_spoils_effects_benefit_text_tagged_tooltip_" .. tostring(i)
					non_mre_rank_reward_component:SetProperty("script_id", cco_id)
					common.set_context_value(cco_id, cco_table)

					non_mre_rank_reward_component:SetText(localized_reward_text)
				else
					non_mre_rank_reward_component:SetText(localized_reward_text, localized_reward_source)
				end
			end
		end,

		update_panel_mre_info = function(faction_key, component)
			local benefit_key = war_spoils.ui.get_benefit_key_from_button_component(component, true)

			war_spoils.ui.reset_previous_button(war_spoils.ui_mre_benefit_selected, true)

			local spoils_info_component = war_spoils.component_cache.resource_spoils_info_component
			if war_spoils.ui_mre_benefit_selected ~= benefit_key then
				spoils_info_component:SetVisible(true)
				war_spoils.ui_mre_benefit_selected = benefit_key
			end

			local benefit_config = war_spoils.get_benefit_config(benefit_key)

			local spoil_name_component = spoils_info_component:SequentialFind(war_spoils.config.ui.component_ids.spoils_info_spoil_name)
			local benefit_localized_title, benefit_localized_source = get_localised_text_replacement_and_source(benefit_config.ui.title_localization_key)
			spoil_name_component:SetText(benefit_localized_title, benefit_localized_source)
			local spoil_icon_component = spoils_info_component:SequentialFind(war_spoils.config.ui.component_ids.spoils_info_spoil_icon)
			spoil_icon_component:SetImagePath(benefit_config.ui.icon_path)

			local rank_holder_component = spoils_info_component:SequentialFind(war_spoils.config.ui.component_ids.mre_rank_holder)
			local rank_template_component = spoils_info_component:SequentialFind(war_spoils.config.ui.component_ids.mre_rank_template)
			local separator_template_component = spoils_info_component:SequentialFind(war_spoils.config.ui.component_ids.mre_rank_template_separator)
			rank_template_component:SetVisible(false)
			separator_template_component:SetVisible(false)
			rank_holder_component:DestroyChildren()

			local current_faction_level = war_spoils.get_faction_level(faction_key)
			local num_rows = war_spoils.get_maximum_faction_level(faction_key)
			for i = 1, num_rows do
				local level_str = tostring(i)
				local rank_component_id = "mre_rank_component_" .. level_str
				local mre_rank_component = UIComponent(rank_holder_component:CreateFromComponent(rank_template_component:Address(), rank_component_id))
				mre_rank_component:SetVisible(true)
				local separator_component_id = "separator_" .. level_str
				local separator_component = UIComponent(rank_holder_component:CreateFromComponent(separator_template_component:Address(), separator_component_id))
				separator_component:SetVisible(true)

				local rank_text_component = mre_rank_component:SequentialFind(war_spoils.config.ui.component_ids.mre_rank_template_rank)
				rank_text_component:SetText(level_str, "")
				local state_name = (i == current_faction_level) and war_spoils.config.ui.component_states.active or war_spoils.config.ui.component_states.default
				rank_text_component:SetState(state_name)

				local resource_amounts = benefit_config.levels[i]
				local max_resource_level = #benefit_config.levels[i]
				for i = 1, max_resource_level do
					local resource_amount_text_component = mre_rank_component:SequentialFind(war_spoils.config.ui.component_ids.mre_rank_mplate_mre_amount_lvl_prefix .. tostring(i))
					resource_amount_text_component:SetText(resource_amounts[i])
					resource_amount_text_component:SetState(state_name)
				end
			end
		end,

		setup_panel_rank_progress_bar_tooltip = function(progress_bar_component, faction_key)
			local cco_table = {
				Rank = tostring(war_spoils.get_faction_level(faction_key))
			}

			progress_bar_component:SetTooltipText("{{tt:" .. war_spoils.config.ui.panel_rank_progress_bar_tooltip_layout_path .. "}}", "", true)
			local cco_id = "war_spoils_faction_rank_progress_bar_cco_id"
			progress_bar_component:SetProperty("script_id", cco_id)
			common.set_context_value(cco_id, cco_table)
		end,

		setup_panel_rank_progress_bar_tooltip_templates = function(faction_key, component)
			local cco_table = {}

			local is_iolaos_faction_leader = faction_key == "phar_sea_sherden"
			local current_faction_rank = war_spoils.get_faction_level(faction_key)
			local maximum_faction_rank = war_spoils.get_maximum_faction_level(faction_key)
			for i = 1, maximum_faction_rank do
				local num_settlements_required = war_spoils.config.num_regions_lower_bound_for_level[i]
					or war_spoils.config.num_regions_lower_bound_for_level[#war_spoils.config.num_regions_lower_bound_for_level]	-- for factions that have maximum_faction_rank larger than #war_spoils.config.num_regions_lower_bound_for_level

				local rank_requirement = ""
				if i == 1 then
					rank_requirement = get_localised_text_replacement_and_source_safe_formatted(war_spoils.config.ui.localization_keys.tooltip_rank_requirement_one_or_more, num_settlements_required)
				elseif i == maximum_faction_rank and is_iolaos_faction_leader == true then
					rank_requirement = get_localised_text_replacement_and_source_safe_formatted(war_spoils.config.ui.localization_keys.tooltip_rank_requirement_iolaos, num_settlements_required)
				elseif (i == maximum_faction_rank - 1 and is_iolaos_faction_leader == true) or (i == maximum_faction_rank and is_iolaos_faction_leader == false) then
					rank_requirement = get_localised_text_replacement_and_source_safe_formatted(war_spoils.config.ui.localization_keys.tooltip_rank_requirement_zero, num_settlements_required)
				else
					local num_settlements_required_for_previous_level = war_spoils.config.num_regions_lower_bound_for_level[i - 1] - 1
					rank_requirement = get_localised_text_replacement_and_source_safe_formatted(war_spoils.config.ui.localization_keys.tooltip_rank_requirement_one_to_another, num_settlements_required, num_settlements_required_for_previous_level)
				end

				local cco_sub_table = {
					TemplateRank = i,
					IsCurrentRank = current_faction_rank == i,
					RankRequirement = rank_requirement,
				}
				table.insert(cco_table, cco_sub_table)
			end

			local cco_id = "war_spoils_faction_rank_holder_cco_id"
			component:SetProperty("script_id", cco_id)
			common.set_context_value(cco_id, cco_table)
		end,

		setup_benefit_icon_and_tooltip = function(target_component, faction_key, region_key, is_for_settlement_nameplate)
			local benefit_key = war_spoils.get_region_config_first_benefit_key(region_key)
			local benefit_config = war_spoils.get_benefit_config(benefit_key)
			local region_cooldown = war_spoils.get_region_cooldown(faction_key, region_key)
			local faction_level = war_spoils.get_faction_level(faction_key)
			local selected_character = nil
			if war_spoils.selected_character_cqi then
				selected_character = cm:get_character_by_cqi(war_spoils.selected_character_cqi)
			end

			local localized_reward_text, _ = war_spoils.ui.get_benefit_localized_reward_text_and_source(faction_key, benefit_key, faction_level, region_key, false, selected_character)

			local should_grey_out = false
			local max_owned_settlements_granting_benefits = war_spoils.get_max_owned_settlements_granting_benefits()

			local localized_warning_text = ""
			local is_settled_character_selected = false
			if region_cooldown > 0 then
				localized_warning_text = get_localised_text_replacement_and_source_safe_formatted(war_spoils.config.ui.localization_keys.tooltip_warning_cooldown_text, region_cooldown)
				should_grey_out = true
			elseif cm:get_faction(faction_key):region_list():num_items() >= max_owned_settlements_granting_benefits then
				localized_warning_text = get_localised_text_replacement_and_source_safe_formatted(war_spoils.config.ui.localization_keys.tooltip_warning_max_settlements_text, max_owned_settlements_granting_benefits)
				should_grey_out = true
			elseif cm:get_region(region_key):is_abandoned() then
				localized_warning_text = get_localised_text_replacement(war_spoils.config.ui.localization_keys.tooltip_warning_ruins)
				should_grey_out = true
			elseif selected_character and not selected_character:is_null_interface() and not tribes_privileges.is_horde_type(selected_character:military_force()) then
				localized_warning_text = get_localised_text_replacement(war_spoils.config.ui.localization_keys.tooltip_warning_text)
				should_grey_out = true
				is_settled_character_selected = true
			end

			local cco_table = {
				LocalizedTitle = get_localised_text_replacement(benefit_config.ui.title_localization_key),
				IconPath = benefit_config.ui.icon_path,
				Cooldown = tostring(region_cooldown),
				Rank = tostring(faction_level),
				IsSettledCharacterSelected = is_settled_character_selected,
				IsResourceBenefit = war_spoils.is_resource_benefit(benefit_config),
				LocalizedRewardText = localized_reward_text,
				LocalizedWarningText = localized_warning_text,
				IsForPanel = false,
			}

			local benefit_icon_path = (region_cooldown == 0 and benefit_config.ui.icon_path) or war_spoils.config.ui.icons.nameplate_cooldown_icon_path
			if is_for_settlement_nameplate then
				--target_component:SetTooltipText("{{tt:" .. war_spoils.config.ui.benefit_tooltip_layout_path .. "}}", "", true) -- setup in the ui layout itself
				local cco_id = "settlement_nameplate_war_spoils_" .. region_key .. "_cco_id"
				target_component:SetProperty("script_id", cco_id)
				common.set_context_value(cco_id, cco_table)

				target_component:SetState(should_grey_out and war_spoils.config.ui.component_states.icon_greyed_out or war_spoils.config.ui.component_states.icon_default)

				-- setup icon component
				target_component:SetImagePath(benefit_icon_path, 1)

				local settlement_cooldown_component = target_component:SequentialFind(war_spoils.config.ui.component_ids.settlement_cooldown)
				settlement_cooldown_component:SetVisible(region_cooldown > 0)
				settlement_cooldown_component:SetText(region_cooldown)
			else
				target_component:SetTooltipText("{{tt:" .. war_spoils.config.ui.benefit_tooltip_layout_path .. "}}", "script", true)
				local cco_id = "settlement_captured_war_spoils_" .. region_key .. "_cco_id"
				target_component:SetProperty("script_id", cco_id)
				common.set_context_value(cco_id, cco_table)

				-- setup icon component
				local indicator_icon_component = target_component:SequentialFind(war_spoils.config.ui.component_ids.settlement_captured_war_spoil_indicator_icon)
				indicator_icon_component:SetImagePath(benefit_icon_path)
			end
		end,

		update_visible_settlement_nameplates = function(faction_key)
			local component_predicate = function(uic)
				local split_tokens = uic:Id():split(":")
				return #split_tokens == 2 and split_tokens[1] == "label_settlement" and true or false
			end

			local label_settlements_parent_component = core:get_ui_root():SequentialFind("3d_ui_parent")
			local valid_children = find_children_uicomponents(label_settlements_parent_component, component_predicate)
			for _, component in ipairs(valid_children) do
				local region_key = component:Id():split(":")[2]
				if war_spoils.is_region_valid(region_key) then
					war_spoils.ui.setup_benefit_icon_and_tooltip(component:SequentialFind(war_spoils.config.ui.component_ids.settlement_nameplate_icon), faction_key, region_key, true)
				end
			end
		end,

		on_benefit_tooltip_show = function(faction_key, tooltip_component, region_key)
			local effect_component = tooltip_component:SequentialFind(war_spoils.config.ui.component_ids.tooltip_effect_bundle_holder)
			local region_config_benefit = war_spoils.get_region_config_benefit_by_key(faction_key, region_key, "effects")
			if not region_config_benefit then
				effect_component:SetVisible(false)
				return
			end

			local benefit_config = war_spoils.get_benefit_config("effects")
			local level_config = benefit_config.levels[war_spoils.get_faction_level(faction_key)]
			local effect_bundle_key = level_config[1]
			local is_valid_bundle_key = effect_bundle_key ~= ""

			effect_component:SetVisible(is_valid_bundle_key)
			if is_valid_bundle_key then
				effect_component:SetContextObject(cco("CcoEffectBundle", effect_bundle_key))
			end
		end,

		update_settlement_nameplate_icons = function(should_be_visible)
			for region_key, _ in pairs(war_spoils.config.regions) do
				if should_be_visible and war_spoils.is_region_valid(region_key) then
					-- Find the settlement nameplate icon component (it will exist only if the settlement is visible) and update it
					local war_spoils_icon_nameplate_component = core:get_ui_root():SequentialFind("label_settlement:" .. region_key)
					if war_spoils_icon_nameplate_component then
						war_spoils.ui.setup_benefit_icon_and_tooltip(war_spoils_icon_nameplate_component:SequentialFind(war_spoils.config.ui.component_ids.settlement_nameplate_icon), cm:get_local_faction_name(true), region_key, true)
					end
				end

				war_spoils.ui.set_war_spoils_settlement_nameplate_icon_visibility(region_key, should_be_visible)
			end
		end,

		set_war_spoils_settlement_nameplate_icon_visibility = function(region_key, should_be_visible)
			cm:set_custom_settlement_info_icon_visibility(region_key, war_spoils.config.ui.component_ids.settlement_nameplate_icon, should_be_visible)
			CampaignUI.UpdateSettlementEffectIcons()
		end,

		clear_component_cache = function()
			war_spoils.component_cache = {}
		end,
	},
}-- war_spoils


-- each benefit config contains an apply function, which is used to apply the benefit
for benefit_key, benefit in pairs(war_spoils.config.benefits) do
	if benefit.resource_key then-- MRE resource benefits
		benefit.apply = function(war_spoil_benefit, character, region_key)
			local resource_key = war_spoil_benefit.resource_key
			local faction_key = character:faction():name()
	
			local main_building_level = war_spoils.get_main_building_level_of_region(region_key)
			if main_building_level == 0 then
				return false, string.format("No war spoil '%s' resources were granted because there's no main building built in the region '%s'.", resource_key, region_key)
			end
	
			local faction_level = war_spoils.get_faction_level(faction_key)
			local amount = war_spoil_benefit.levels[faction_level][main_building_level]
			if amount == 0 then
				return false, string.format("No war spoil '%s' resources were granted.", resource_key)
			end
	
			local military_force = character:military_force()
			if military_force then
				local change_perc = military_force:bonus_values():scripted_value("scripted_war_spoils_mre_mod", "value")
				local change = (amount * change_perc) / 100
				amount = amount + change
			end
			cm:faction_add_pooled_resource(faction_key, resource_key, war_spoils.config.resource_factor, amount)
	
			return true, string.format("War Spoil granted. Given an amount of %d - '%s' resource, to the faction '%s'.", amount, resource_key, faction_key)
		end
	elseif benefit_key == "vision" then
		benefit.apply = function(self, character, region_key)
			local faction_key = character:faction():name()
			local faction_level = war_spoils.get_faction_level(faction_key)
			local num_turns = self.levels[faction_level]

			local realm_key = phar_realms.get_realm_for_region(region_key)
			if not realm_key then
				return false, string.format("ERROR: region '%s' does not belong to a realm.", region_key)
			end

			local effect_bundle_key = self.effect_bundle_key
			local region_keys = phar_realms.get_regions_for_realm(realm_key)
			for i = 1, #region_keys do
				local region_key = region_keys[i]
				cm:apply_effect_bundle_to_region(effect_bundle_key, region_key, num_turns)
			end

			cm:make_regions_visible_in_shroud_for_faction(faction_key, region_keys)
			war_spoils.set_realm_vision_cooldown(faction_key, realm_key, num_turns)

			return true, string.format("War Spoil granted. Vision of realm '%s' has been granted to faction '%s' for %d turns.", realm_key, faction_key, num_turns)
		end
	elseif benefit_key == "native_units" then
		benefit.apply = function(self, character, region_key)
			local faction = character:faction()
			local faction_key = faction:name()
			local region_benefit_config = war_spoils.get_region_config_benefit_by_key(faction_key, region_key, "native_units")

			local faction_level = war_spoils.get_faction_level(faction_key)
			if not region_benefit_config.levels then
				return false, string.format("ERROR: The region's '%s' \"native_units\" benefit doesn't have a `levels` table configured with the native units to grant.", region_key)
			end

			local units = region_benefit_config.levels[faction_level]
			for _, unit_key in ipairs(units) do
				local amount = cm:num_units_in_faction_mercenary_pool(faction:command_queue_index(), unit_key) + 1

				cm:add_unit_to_faction_mercenary_pool(faction,	-- faction script interface
					unit_key,									-- unit key
					amount,										-- amount
					0,											-- number replenishment chance percentage
					amount,										-- max amount
					0,											-- max units replenished per turn
					0,											-- xp level
					"",											-- string faction restricted record
					"",											-- string subculture restricted record
					"")											-- string tech restricted record
			end

			return true, string.format("War Spoil granted. %d native units have been added to '%s' faction's mercenary pool.", #units, faction_key)
		end
	elseif benefit_key == "experience" then
		benefit.apply = function(self, character, region_key)
			local char_str = cm:char_lookup_str(character:command_queue_index())

			local faction_key = character:faction():name()
			local faction_level = war_spoils.get_faction_level(faction_key)
			local amount = self.levels[faction_level]

			if amount == 0 then
				return false, "No experience was granted."
			end

			cm:add_agent_experience(char_str, amount)

			return true, string.format("War Spoil granted. Given %d experience, to horde general '%s', of faction '%s'.", amount, char_str, faction_key)
		end
	elseif benefit_key == "development_points" then
		benefit.apply = function(self, character, region_key)
			if not cm:char_is_general_with_army(character) then
				return false, string.format("ERROR: Invalid horde general detected when attempting to grant development points War Spoil!")
			end

			local military_force_cqi = character:military_force():command_queue_index()

			local faction_key = character:faction():name()
			local faction_level = war_spoils.get_faction_level(faction_key)
			local amount = self.levels[faction_level]
			if amount == 0 then
				return false, "No development points were granted."
			end

			cm:add_development_points_to_horde_military_force(military_force_cqi, amount)

			return true, string.format("War Spoil granted. Given %d development points to horde army with cqi %d, of faction '%s'.", amount, military_force_cqi, faction_key)
		end
	elseif benefit_key == "ancillaries" then
		benefit.apply = function(self, character, region_key)
			local realm_key = phar_realms.get_realm_for_region(region_key)
			local ancillary_lists = {
				["common"] = phar_common_ancillaries,
				["rare"] = get_all_rare_ancillaries_of_realm(realm_key),
				["unique"] = get_all_unique_ancillaries_of_realm(realm_key),
			}

			local faction_key = character:faction():name()
			local faction_level = war_spoils.get_faction_level(faction_key)
			local ancillary_level_config = self.levels[faction_level]
			local num_ancillaries_granted = 0
			for rarity, rarity_config in dpairs(ancillary_level_config) do
				local how_many = rarity_config[1]
				local chance = rarity_config[2]

				local roll = cm:model():random_int(1, 100)
				if roll <= chance then
					war_spoils.randomly_give_ancillaries_no_duplicates(how_many, character, ancillary_lists[rarity])
					num_ancillaries_granted = num_ancillaries_granted + how_many
				end
			end

			if num_ancillaries_granted == 0 then
				return false, "No ancillaries were granted."
			end

			return true, string.format("War Spoil granted. Given %d ancillaries to horde army with cqi '%d', of faction '%s'.", num_ancillaries_granted, character:military_force():command_queue_index(), faction_key)
		end
	elseif benefit_key == "effects" then
		benefit.apply = function(self, character, region_key)
			local faction_key = character:faction():name()
			local force_cqi = character:military_force():command_queue_index()

			local faction_level = war_spoils.get_faction_level(faction_key)
			local level_config = self.levels[faction_level]
			local effect_bundle_key = level_config[1]
			local turns = level_config[2]

			if effect_bundle_key == "" or turns < 0 then
				return false, "No army buffs were granted."
			end

			cm:apply_effect_bundle_to_force(effect_bundle_key, force_cqi, turns)

			return true, string.format("War Spoil granted. Applied effect bundle with key '%s', to horde army with cqi %d, of faction '%s'.", effect_bundle_key, force_cqi, faction_key)
		end
	end
end


-----------------
--- SERIALIZATION
cm:add_saving_game_callback(
	function(context)
		if not is_table(war_spoils.persistent) then
			script_error("war_spoils.persistent table is invalid!")
			return
		end

		cm:save_named_value("war_spoils", war_spoils.persistent, context)
	end
)

cm:add_loading_game_callback(
	function(context)
		if not is_table(war_spoils.persistent) then
			script_error("war_spoils.persistent table is invalid!")
			return
		end

		war_spoils.persistent = cm:load_named_value("war_spoils", war_spoils.persistent, context)

		if war_spoils.persistent.levels == nil or table.is_empty(war_spoils.persistent.levels) then
			war_spoils.persistent.levels = {}
			for i = 1, #sea_peoples_playable_faction_keys do
				local faction_key = sea_peoples_playable_faction_keys[i]
				war_spoils.persistent.levels[faction_key] = war_spoils.get_num_faction_levels()
			end
		end

		if war_spoils.persistent.region_cooldowns == nil or table.is_empty(war_spoils.persistent.region_cooldowns) then
			war_spoils.persistent.region_cooldowns = {}
			for i = 1, #sea_peoples_playable_faction_keys do
				local faction_key = sea_peoples_playable_faction_keys[i]
				war_spoils.persistent.region_cooldowns[faction_key] = {}
			end
		end

		if war_spoils.persistent.realm_vision_cooldowns == nil or table.is_empty(war_spoils.persistent.realm_vision_cooldowns) then
			war_spoils.persistent.realm_vision_cooldowns = {}
			for i = 1, #sea_peoples_playable_faction_keys do
				local faction_key = sea_peoples_playable_faction_keys[i]
				war_spoils.persistent.realm_vision_cooldowns[faction_key] = {}
			end
		end

		if not war_spoils.persistent.extra_levels_from_commands then
			war_spoils.persistent.extra_levels_from_commands = {}
		end
	end
)


-------------
--- LISTENERS
core:add_listener(
	"war_spoils_FirstTickAfterWorldCreated",
	"FirstTickAfterWorldCreated",
	true,
	function(context)
		-- conditionally enable model listeners if there's any war-spoils-applicable playerS
		local should_enable_model_listeners = false
		local player_factions = cm:get_human_factions()
		for _, faction_key in ipairs(player_factions) do
			local is_applicable = war_spoils.is_faction_applicable(faction_key)
			cm:set_script_state(cm:get_faction(faction_key), "is_war_spoils_unlocked_by_faction", is_applicable)
			should_enable_model_listeners = should_enable_model_listeners or is_applicable
		end
		war_spoils:set_enable_model_listeners(should_enable_model_listeners)

		-- conditionally enable UI if the local player is present & war-spoils-applicable
		if not cm:has_local_faction() then
			war_spoils.ui.set_enable_ui(false)
			return
		end

		local local_faction_key = cm:get_local_faction_name(true)
		local is_applicable = war_spoils.is_faction_applicable(local_faction_key)

		war_spoils:enable_ui_listeners(is_applicable)
		war_spoils.ui.set_enable_ui(is_applicable)
		war_spoils.ui.update_settlement_nameplate_icons(is_applicable)
	end,
	false
)

function war_spoils:set_enable_model_listeners(should_enable)
	if should_enable then
		core:add_listener(
			"war_spoils_FactionTurnStart",
			"FactionTurnStart",
			true,
			function(context)
				local faction_key = context:faction():name()
				if not war_spoils.is_faction_applicable(faction_key) then
					return
				end

				war_spoils.calculate_faction_level(faction_key)
				war_spoils.advance_cooldowns_for_faction(faction_key)
				war_spoils.process_vision_of_realms(faction_key)

				war_spoils.log_faction_stats(faction_key)

				war_spoils.ui.update_visible_settlement_nameplates(faction_key)
			end,
			true,
			false
		)

		core:add_listener(
			"war_spoils_CharacterPerformsSettlementOccupationDecisionBeforeOutcomeApplication",
			"CharacterPerformsSettlementOccupationDecisionBeforeOutcomeApplication",
			true,
			function(context)
				local occupation_decision = context:occupation_decision_option()
				local garrison_residence = context:garrison_residence()
				if not war_spoils.is_raze_settlement_decision(occupation_decision, garrison_residence) then
					return
				end

				-- this was a raze kind of occupation decision, so grant war spoil benefits
				local character = context:character()
				war_spoils.settle_raze_occcupation_decision(character, character:faction():name(), garrison_residence:region():name())
			end,
			true,
			false
		)

		core:add_listener(
			"war_spoils_ScriptEventEminenceObediencePerformed",
			"ScriptEventEminenceObediencePerformed",
			true,
			function(context)
				-- a special raze occupation decision has been performed using the pre-battle option "Obedience"/"Domination"
				war_spoils.settle_raze_occcupation_decision(context.stored_table.character, context.stored_table.faction_key, context.stored_table.region_key)
			end,
			true,
			false
		)
	else
		core:remove_listener("war_spoils_FactionTurnStart")
		core:remove_listener("war_spoils_CharacterPerformsSettlementOccupationDecisionBeforeOutcomeApplication")
		core:remove_listener("war_spoils_ScriptEventEminenceObediencePerformed")
	end
end

function war_spoils:enable_ui_listeners(should_enable)
	if should_enable then
		-- This is a model event but used only for UI for now. If you add model code here, move the listener to set_enable_model_listeners() and shield the UI part of it
		core:add_listener(
			"war_spoils_BattleConflictFinished",
			"BattleConflictFinished",
			true,
			function(context)
				local battle = context:pending_battle()
				local garrison = battle:contested_garrison()
				if not garrison or garrison:is_null_interface() or not garrison:is_settlement() then
					return
				end

				war_spoils.temporary_garrison_region_key = garrison:region():name()
			end,
			true,
			false
		)

		-- This is a model event but used only for UI for now. If you add model code here, move the listener to set_enable_model_listeners() and shield the UI part of it
		core:add_listener(
			"war_spoils_BattleCompleted",
			"BattleCompleted",
			true,
			function(context)
				war_spoils.temporary_garrison_region_key = ""
				war_spoils.ui.update_visible_settlement_nameplates(cm:get_local_faction_name(true))
			end,
			true,
			false
		)

		core:add_listener(
			"war_spoils_CharacterSelected",
			"CharacterSelected",
			true,
			function(context)
				local character = context:character()
				if not character:has_military_force() then
					script_error("selected character has no military force - something is amiss..")
					return
				end

				war_spoils.selected_character_cqi = character:command_queue_index()
				war_spoils.ui.update_visible_settlement_nameplates(cm:get_local_faction_name(true))
			end,
			true,
			false
		)

		core:add_listener(
			"war_spoils_CharacterDeselected",
			"CharacterDeselected",
			true,
			function(context)
				war_spoils.selected_character_cqi = nil
				war_spoils.ui.update_visible_settlement_nameplates(cm:get_local_faction_name(true))
			end,
			true,
			false
		)

		-- ui listener
		core:add_listener(
			"war_spoils_PanelOpenedCampaign",
			"PanelOpenedCampaign",
			function(context)
				return context.string == war_spoils.config.ui.panel_name
			end,
			function(context)
				war_spoils.ui.refresh_main_panel()
			end,
			true,
			false
		)

		-- ui listener
		core:add_listener(
			"war_spoils_PanelOpenedCampaign_" .. war_spoils.config.ui.settlement_occupation_options_panel_name,
			"PanelOpenedCampaign",
			function(context)
				return context.string == war_spoils.config.ui.settlement_occupation_options_panel_name
			end,
			function(context)
				if not war_spoils.is_region_valid(war_spoils.temporary_garrison_region_key) then
					return
				end

				local component_predicate = function(uic)
					local war_spoil_indicator_component = uic:SequentialFind(war_spoils.config.ui.component_ids.settlement_captured_war_spoil_indicator)
					return war_spoil_indicator_component and war_spoil_indicator_component:Visible() or false
				end

				local uic = UIComponent(context.component)
				local template_holder_component = uic:SequentialFind(war_spoils.config.ui.component_ids.settlement_captured_template_holder)
				local valid_children = find_children_uicomponents(template_holder_component, component_predicate)
				for _, component in ipairs(valid_children) do
					war_spoils.ui.setup_benefit_icon_and_tooltip(component:SequentialFind(war_spoils.config.ui.component_ids.settlement_captured_war_spoil_indicator), cm:get_local_faction_name(true), war_spoils.temporary_garrison_region_key, false)
				end
			end,
			true,
			false
		)

		-- ui listener
		core:add_listener(
			"war_spoils_CharacterCapturedSettlementUnopposed",
			"CharacterCapturedSettlementUnopposed",
			true,
			function(context)
				local garrison = context:garrison_residence()
				if garrison and not garrison:is_null_interface() then
					war_spoils.temporary_garrison_region_key = garrison:region():name()
				end
			end,
			true,
			false
		)

		-- ui listener
		core:add_listener(
			"war_spoils_PanelClosedCampaign",
			"PanelClosedCampaign",
			function(context)
				return context.string == war_spoils.config.ui.panel_name
			end,
			function(context)
				war_spoils.selected_character_cqi = nil
				war_spoils.ui_non_mre_benefit_selected = ""
				war_spoils.ui_mre_benefit_selected = ""
				war_spoils.ui.clear_component_cache()
			end,
			true,
			false
		)

		-- ui listener
		core:add_listener(
			"war_spoils_CampaignCityInfoBarCreated",
			"CampaignCityInfoBarCreated",
			true,
			function(context)
				if not cm:is_game_running() then
					return	-- at the very start of the campaign this listener is triggered and cm:get_local_faction_name below errors out
				end

				local split_tokens = context.string:split(":")
				local region_key = split_tokens[2] or nil
				if not war_spoils.is_region_valid(region_key) then
					return
				end

				local war_spoils_icon_nameplate_component = UIComponent(context.component)
				war_spoils.ui.setup_benefit_icon_and_tooltip(war_spoils_icon_nameplate_component:SequentialFind(war_spoils.config.ui.component_ids.settlement_nameplate_icon), cm:get_local_faction_name(true), region_key, true)
			end,
			true,
			false
		)

		-- ui listener
		core:add_listener(
			"war_spoils_ContextTriggerEvent",
			"ContextTriggerEvent",
			function(context)
				return string.find(context.string, "WarSpoilsContextEvent")
			end,
			function(context)
				local split_tokens = string.split(context.string, ":")
				local command = split_tokens[2]

				local get_attached_component = function()
					return UIComponent(context.component)
				end

				local local_faction_key = cm:get_local_faction_name(true)
				if command == "NonResourceButtonClick" then
					local uic = get_attached_component()
					war_spoils.ui.update_panel_non_mre_info(local_faction_key, uic)
				elseif command == "ResourceButtonClick" then
					local uic = get_attached_component()
					war_spoils.ui.update_panel_mre_info(local_faction_key, uic)
				elseif command == "GetRanksTable" then
					local uic = get_attached_component()
					war_spoils.ui.setup_panel_rank_progress_bar_tooltip_templates(local_faction_key, uic)
				elseif command == "FindClosestSettlementWithNonMreSpoil" then
					war_spoils.ui.scroll_camera_to_closest_settlement_with_war_spoil(local_faction_key, war_spoils.ui_non_mre_benefit_selected, nil, true, true)
					common.toggle_fm_panel(war_spoils.config.ui.panel_name)
				elseif command == "FindClosestSettlementWithMreSpoil" then
					war_spoils.ui.scroll_camera_to_closest_settlement_with_war_spoil(local_faction_key, war_spoils.ui_mre_benefit_selected, nil, true, true)
					common.toggle_fm_panel(war_spoils.config.ui.panel_name)
				end
			end,
			true,
			false
		)

		-- ui listener
		core:add_listener(
			"war_spoils_ComponentOnTooltipShow",
			"ComponentOnTooltipShow",
			true,
			function(context)
				local component = UIComponent(context.component)
				if component:Id() ~= war_spoils.config.ui.component_ids.settlement_nameplate_icon
					and component:Id() ~= war_spoils.config.ui.component_ids.settlement_captured_war_spoil_indicator
				then
					return
				end

				local region_key = ""
				if war_spoils.temporary_garrison_region_key ~= "" then
					region_key = war_spoils.temporary_garrison_region_key
				else
					local war_spoils_icon_nameplate_component = uicomponent_find_up(component, 
						function (component) 
							local split_tokens = component:Id():split(":")
							return #split_tokens == 2 and split_tokens[1] == "label_settlement" and true or false
						end)

					if war_spoils_icon_nameplate_component then
						region_key = war_spoils_icon_nameplate_component:Id():split(":")[2]
					end
				end

				if not war_spoils.is_region_valid(region_key) then
					return
				end

				war_spoils.ui.on_benefit_tooltip_show(cm:get_local_faction_name(true), UIComponent(context:tooltip_object()), region_key)
			end,
			true,
			false
		)
	else
		core:remove_listener("war_spoils_BattleConflictFinished")
		core:remove_listener("war_spoils_BattleCompleted")
		core:remove_listener("war_spoils_CharacterSelected")
		core:remove_listener("war_spoils_CharacterDeselected")
		core:remove_listener("war_spoils_PanelOpenedCampaign")
		core:remove_listener("war_spoils_PanelOpenedCampaign_" .. war_spoils.config.ui.settlement_occupation_options_panel_name)
		core:remove_listener("war_spoils_CharacterCapturedSettlementUnopposed")
		core:remove_listener("war_spoils_PanelClosedCampaign")
		core:remove_listener("war_spoils_CampaignCityInfoBarCreated")
		core:remove_listener("war_spoils_ContextTriggerEvent")
		core:remove_listener("war_spoils_ComponentOnTooltipShow")
	end
end


---------------
--- FOR TESTING
function war_spoils:test()
	for i = 1, #sea_peoples_playable_faction_keys do
		local faction_key = sea_peoples_playable_faction_keys[i]
		output("faction level of " .. faction_key .. " = " .. tostring(war_spoils.get_faction_level(faction_key)) .. ".")
	end
end