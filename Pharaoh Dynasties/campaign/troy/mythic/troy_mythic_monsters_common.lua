out("Loading troy_mythic_monsters_common.lua")

------------------------------------
--
--    troy_mythic_monsters_common
--
------------------------------------
mythic_monsters_files = {
	[1] = "troy_mythic_monsters_cerberus",
	[2] = "troy_mythic_monsters_hydra",
	[3] = "troy_mythic_monsters_griffin"
}


mythic_monsters_common = {
	monsters = 	{
		-- populated in require_files using mythic_monsters_files
	},

	require_files = function()
		for _, v in ipairs(mythic_monsters_files) do
			local monster_def = require(v)
			if monster_def and is_table(monster_def) then
				table.insert(mythic_monsters_common.monsters, monster_def)
			end
		end
	end,

	config = {
		id = "MYTHIC_MONSTERS_COMMON",
		persistent_suffix = "_PERSISTENT_DATA",

		recruit_cooldown_turns = 3,
		-- UI
		monster_panel = "monster_progression",
		mythic_monster_button_slot = "fm_mythic_monster",
		monster_panel_button = "button_fm_mythic_monster_progression",
		monster_selection_button = "button_fm_mythic_monster_selection",
		monster_expedition_button = "button_fm_mythic_monster_expedition",

		--text
		monster_skill_confirmation_dialogue_text = "ui_text_replacements_localised_text_troy_mth_monster_progression_screen_choose_skill_tooltip",

		xp_bar_config = {
			[1] = {
				bar_start = 0.01,
				bar_end = 0.25
			},
			[2] = {
				bar_start = 0.25,
				bar_end = 0.5
			},
			[3] = {
				bar_start = 0.5,
				bar_end = 0.75
			},
			[4] = {
				bar_start = 0.75,
				bar_end = 1,
			},
			[5] = {
				bar_start = 1,
				bar_end = 1,
			}
		},
	},

	persistent = {
		version = 2,

		-- unlocked monsters per faction
		unlocked = {
			-- [faction_key] = { [monster_id] = true, [monster_id] = true },
		},
		monster_wounded = {
			-- [faction_key] = { [monster_id] = {wounded = true, turn_wounded = 20}, [monster_id] = {wounde = false, turn_wounded = 20} },
		},

	},

	events = {
		CharacterRankUp = function(self, context)
			local unlocked_monster = self:unlocked_monster(context:character():faction():name())
			if not unlocked_monster then
				return
			end
			if unlocked_monster.persistent.monster_cqi ~= context:character():family_member():command_queue_index() then
				return
			end
			unlocked_monster:on_level_up(context)
		end,

		FactionCharacterDiedOrWounded = function(self, context)
			local unlocked_monster = self:unlocked_monster(context:faction():name())
			if not unlocked_monster then
				return
			end

			if unlocked_monster.persistent.monster_cqi ~= context:family_member():command_queue_index() then
				return
			end

			local faction = context:faction()
			if faction:is_dead() then
				return	-- The faction is dying, so there is no need to overwrite the monster death.
			end

			-- Wound the agent with convalescence type "old age", so that no wounded event is triggered for them and they do not appear in the character roster.
			cm:wound_character(cm:char_lookup_str(context:family_member():character()), 30000, false, true)
			out('WOUNDED MONSTER WITH CQI ' ..  context:family_member():command_queue_index() .. ' for faction ' .. faction:name())
			self.persistent.monster_wounded[faction:name()] = { wounded = true, turn_wounded = cm:model():turn_number() }

			---------------------------
			-- UI manipulation code
			--------------------------
			
			-- showing/hiding exclamation mark on monster button
			self:ui_refresh_monster_recruitment_availability(faction:name())
		end,

		FactionTurnStart = function(self, context)		
			local faction_key = context:faction():name()

			---------------------------
			-- UI manipulation code
			--------------------------
			
			-- showing/hiding exclamation mark on monster button
			self:ui_refresh_monster_recruitment_availability(faction_key)
		end,

		-- fill the common UI part and pass the event to monsters
		PanelOpenedCampaign = function(self, context)
			if context.string == "agent_options" then
				self:on_agent_panel_opened(context)
				return
			end

			if context.string == "character_panel" then
				local panel = UIComponent(context.component)
				local wizard_agent_button = panel:SequentialFind("wizard")

				if wizard_agent_button and wizard_agent_button:Visible() then
					wizard_agent_button:SetVisible(false)
				end

				return
			end

			if not is_table(self.config) or
				not self.config.monster_panel or
				context.string ~= self.config.monster_panel then
				return
			end

			local unlocked_monster = nil
			for _, monster in ipairs(self.monsters) do
				if is_table(monster) and self:is_monster_unlocked(monster:id(), cm:get_local_faction_name(true)) then
					unlocked_monster = monster
				end
			end
			if not unlocked_monster then
				out("Monster panel opened, but there is no unlocked monster!")
				return
			end
			-- fill the UI
			local panel = core:get_ui_root():SequentialFind(context.string)
			if not panel then
				out("Monster panel: " .. context.string .. " not found!")
				return
			end

			-- Set the state, then renotify the sound system of the panel open event again in order to properly trigger the sounds for the monster states.
			panel:SetState(unlocked_monster.config.key)
			panel:InterfaceFunction("renotify_sound_panel_open")

			local character_family_member = cm:model():family_member_for_command_queue_index(unlocked_monster.persistent.monster_cqi)
			if character_family_member:is_null_interface() then out("Family member with CQI " .. unlocked_monster.persistent.monster_cqi .. " does not exist!") return end

			local character = character_family_member:character()
			if character:is_null_interface() then out("Monster with family member with CQI " .. unlocked_monster.persistent.monster_cqi .. " has no character!") return end

			panel:InterfaceFunction("set_monster_stats", character) -- must be called before set_ability, as it depends on it.
			panel:InterfaceFunction("set_recruitment_and_upkeep_costs", unlocked_monster.config.unit_key, unlocked_monster.config.agent_resource_cost)
			panel:InterfaceFunction("set_character_rank", character)

			local tab_details = panel:SequentialFind("tab_details")
			if tab_details then
				tab_details:SimulateLClick()
			end

			local tab_recruit = panel:SequentialFind("tab_recruit")
			if tab_recruit then
				if is_table(self.persistent.monster_wounded) and self.persistent.monster_wounded[cm:get_local_faction_name(true)] and self.persistent.monster_wounded[cm:get_local_faction_name(true)].wounded then
					tab_recruit:SetState("active")
				else
					tab_recruit:SetState("inactive")
				end

				local container_settlements = tab_recruit:SequentialFind("container_settlements")
				local container_armies = tab_recruit:SequentialFind("container_armies")
				local monster_faction = cm:get_faction(cm:get_local_faction_name(true))
				local header = tab_recruit:SequentialFind("header_recruit", "title")
				if monster_faction:home_region():is_null_interface() then
					if container_settlements and container_armies then
						container_settlements:SetVisible(false)
						container_armies:SetVisible(true)
						if header then
							header:SetState("army")
						end
					end
				end
				panel:InterfaceFunction("set_recruitment_armies_for_horde")

				local settlement_list = container_settlements:SequentialFind("list_view", "list_box")
				local army_list = container_armies:SequentialFind("list_view", "list_box")

				if monster_faction:home_region():is_null_interface() then
					for i = 0, army_list:ChildCount() - 1 do
						local army_row = UIComponent(army_list:Find(i))
						local army_cqi = army_row:GetProperty("cqi")
						local army = cm:get_character_by_cqi(army_cqi)
						if army then
							out("army " .. army_cqi)
							local x, y = self:get_spawn_position_character(cm:get_local_faction_name(true), army)
							if x < 0 or y < 0 then
								out(x .. " " .. y)

								army_row:SetState("invalid")
							end
						end
					end
				else
					for i = 0, settlement_list:ChildCount() - 1 do
						local settlement_row = UIComponent(settlement_list:Find(i))
						local region = cm:get_region(settlement_row:Id())
						if region then
							local x, y = self:get_spawn_position_region(cm:get_local_faction_name(true), settlement_row:Id())

							if x < 0 or y < 0 then
								settlement_row:SetState("invalid")
								settlement_row:SetInteractive(false)
								settlement_row:SetDisabled(true)
								local button_zoom = settlement_row:SequentialFind("button_zoom_location")
								local tx_region = settlement_row:SequentialFind("tx_region_title")
								local tx_province = settlement_row:SequentialFind("tx_province_title")

								if button_zoom and tx_region and tx_province then
									button_zoom:SetState("inactive")
									tx_province:SetState("invalid")
									tx_region:SetState("invalid")
								end
							end
						end
					end
				end
			end

			local recruit_turns = panel:SequentialFind("tab_recruit", "available_in", "dy_available_in")
			local btn_recruit = panel:SequentialFind("tab_recruit", "btn_recruit")

			if recruit_turns and btn_recruit and is_table(self.persistent.monster_wounded) and self.persistent.monster_wounded[cm:get_local_faction_name(true)] and self.persistent.monster_wounded[cm:get_local_faction_name(true)].wounded then
				local left_turns = self.persistent.monster_wounded[cm:get_local_faction_name(true)].turn_wounded + self.config.recruit_cooldown_turns - cm:model():turn_number()
				left_turns = math.max(left_turns, 0)
				btn_recruit:SetState("inactive")
				recruit_turns:SetStateText(left_turns)
			end

			local subtype = panel:SequentialFind("character_subtype")
			if subtype then
				subtype:SetText(common.get_localised_string(character:get_forename()))
			end

			local unit_category_icon = panel:SequentialFind("unit_category_icon")
			if unit_category_icon then
				unit_category_icon:SetImagePath(unlocked_monster.config.unit_category_icon)
			end

			panel:InterfaceFunction("set_ability", "template_ability_icon_1", self:get_current_skill_upgrade_for_base_skill(unlocked_monster.config, unlocked_monster.config.battle_skills[1], character, unlocked_monster))
			panel:InterfaceFunction("set_ability", "template_ability_icon_2", self:get_current_skill_upgrade_for_base_skill(unlocked_monster.config, unlocked_monster.config.battle_skills[2], character, unlocked_monster))
			panel:InterfaceFunction("set_ability", "template_ability_icon_3", self:get_current_skill_upgrade_for_base_skill(unlocked_monster.config, unlocked_monster.config.battle_skills[3], character, unlocked_monster))

			local unlocked_monster_progression_data = self:get_monster_progression_for_faction(character:faction(), unlocked_monster)
			for _, node in ipairs(unlocked_monster_progression_data) do
				panel:InterfaceFunction("set_progression_node", node.node_id)
				for _, skill_key in ipairs(node.skills) do
					panel:InterfaceFunction("set_skill_for_node", node.node_id, skill_key, character)
				end
			end

			if unlocked_monster.persistent.unlocked_tiers ~= nil then
				for rank, data in pairs(unlocked_monster.persistent.unlocked_tiers) do
					if data.state == "unlocked" then
						local node_btn = panel:SequentialFind(data.node.node_id, "skill_button")
						if node_btn then
							node_btn:SetState("unlocked")
						end
					elseif data.state == "complete" then
						local skill_node = nil
						for _, node in ipairs(unlocked_monster_progression_data) do
							if skill_node then break end
							for _, skill in ipairs(node.skills) do
								if skill == data.skill then
									skill_node = node
									break
								end
							end
						end

						panel:InterfaceFunction("set_node_skill_pick", skill_node.node_id, data.skill, character)
					end
				end
			end

			panel:InterfaceFunction("set_xp_bar_tooltip", character);
			local xp_bar = panel:SequentialFind("progression_bar", "bar", "bar_base")
			local xp_bar_frame = panel:SequentialFind("progression_bar", "bar", "bar_frame_top")
			if xp_bar and xp_bar_frame then
				xp_bar:SetCanResizeWidth(true)

				local rank = character:rank()
				local xp_config = self.config.xp_bar_config[rank]
				if not xp_config then
					xp_config = self.config.xp_bar_config[#self.config.xp_bar_config]
				end
				local xp_percent = character:current_xp_in_percent()
				local xp_to_next_rank = character:experience_required_for_rank_up()
				if xp_percent == 0 and xp_to_next_rank ~= 0 then
					xp_bar:Resize(xp_config.bar_start * xp_bar_frame:Width(), xp_bar:Height())
				elseif xp_percent == 0 and xp_to_next_rank == 0 then
					xp_bar:Resize(xp_bar_frame:Width() * xp_config.bar_end, xp_bar:Height())
				else
					local width_start = xp_bar_frame:Width() * xp_config.bar_start
					local width_end = xp_bar_frame:Width() * xp_config.bar_end
					local resize_width = width_start + ((width_end - width_start) * xp_percent)
					xp_bar:Resize(resize_width, xp_bar:Height())
				end
			end

			for id, feature in pairs(unlocked_monster.config.overview_panel) do
				panel:InterfaceFunction("set_feature", id)
				local title = panel:SequentialFind(id, "dy_feature_title")
				if title then
					title:SetText(common.get_localised_string(feature.title))
				end

				local text = panel:SequentialFind(id, "dy_feature_info_text")
				if text then
					text:SetText(common.get_localised_string(feature.infotext))
				end
			end

			for _, unit_data in ipairs(unlocked_monster.config.unlockable_units) do
				panel:InterfaceFunction("set_unit", unit_data.key)
			end

			local display_buildings = mythic_monsters_common:get_display_buildings_for_faction(character:faction():name(), unlocked_monster.config)
			for _, building_data in ipairs(display_buildings) do
				panel:InterfaceFunction("set_building", building_data.building_level_key, building_data.culture_variant_key, character:faction():name())
			end

			panel:InterfaceFunction("set_agent_actions", character)

			local unit_overview = panel:SequentialFind("container_unit_roaster", "dy_overview")
			local key = self:monster_id_to_key(unlocked_monster:id())
			if unit_overview and key then
				unit_overview:SetText(common.get_localised_string(mythic_monster_selection.card_back.sections_overviews[key].units))
			end

			local title_name = panel:SequentialFind("title_bar", "panel_header", "monster_name")
			if title_name and key then
				title_name:SetState(key)
			end

			local building_overview = panel:SequentialFind("container_buildings", "dy_overview")
			if building_overview and key then
				building_overview:SetText(common.get_localised_string(mythic_monster_selection.card_back.sections_overviews[key].buildings))
			end
			local shown_progression_tree = ""
			self:add_monster_panel_click_handler(context, panel, unlocked_monster, character, shown_progression_tree)
			self:add_monster_panel_hover_handler(l_context, panel, unlocked_monster)
			self:add_component_mouse_off_handler()
			-- pass a bite to the monsters :)
			unlocked_monster:on_monster_panel_opened(context)
		end,

		PanelClosedCampaign = function(self, context)
			if not is_table(self.config) or
				not self.config.monster_panel or
				context.string ~= self.config.monster_panel then

				return
			end

			-- clean up the common UI part
			core:remove_listener("monster_panel_lclickup_listener")
			core:remove_listener("monster_progression_skill_hover_listener")
			core:remove_listener("monster_progression_skill_hover_off_listener")
			-- pass a bite to the monsters :)
			self:call_monsters("on_monster_panel_closed", context)
		end,
		UITriggerScriptEvent = function(self, context)
			if string.find(context:trigger(), "mythic_monster_learn_skill_event_") ~= nil then
				self:learn_monster_skill_event(context)
			elseif string.find(context:trigger(), "mythic_monster_spawn_monster_event_") ~= nil then
				self:spawn_monster_event(context)
			end
		end,

		CharacterSkillPointAllocated = function(self, context)
			local character = context:character()
			local skill = context:skill_point_spent_on()

			local unlocked_monster = nil
			for _, monster in ipairs(self.monsters) do
				if is_table(monster) and self:is_monster_unlocked(monster:id(), character:faction():name()) then
					unlocked_monster = monster
				end
			end

			if unlocked_monster == nil then
				out("Could not find unlocked monster.")
				return
			end

			if character:character_subtype_key() ~= unlocked_monster.config.agent_subtype then 
				-- we need to guarantee that we trigger this for the monsters and not for other characters.
				return
			end

			local node_rank_req = nil
			for _, node in ipairs(self:get_monster_progression_for_faction(character:faction(), unlocked_monster)) do
				for _, progression_skill in ipairs(node.skills) do
					if progression_skill == skill then
						node_rank_req = node.rank_req
					end
				end
			end

			if node_rank_req == nil then
				out("Could not find skill " .. skill .. " for unlocked monster.")
				return
			end
			out(unlocked_monster:id() .. " NODE RANK REQ " .. node_rank_req)
			unlocked_monster.persistent.unlocked_tiers[tonumber(node_rank_req)].state = "complete"
			unlocked_monster.persistent.unlocked_tiers[tonumber(node_rank_req)].skill = skill
			if is_function(unlocked_monster.on_skill_point_picked) then
				unlocked_monster:on_skill_point_picked(skill, context)
			end

			local refresh_panel = function()
				-- If the progression panel is opened, refresh it in case some stats or abilities have changed.
				local panel = core:get_ui_root():SequentialFind(self.config.monster_panel)
				if panel then
					panel:InterfaceFunction("set_monster_stats", character) -- must be called before set_ability, as it depends on it.

					panel:InterfaceFunction("set_ability", "template_ability_icon_1", self:get_current_skill_upgrade_for_base_skill(unlocked_monster.config, unlocked_monster.config.battle_skills[1], character, unlocked_monster))
					panel:InterfaceFunction("set_ability", "template_ability_icon_2", self:get_current_skill_upgrade_for_base_skill(unlocked_monster.config, unlocked_monster.config.battle_skills[2], character, unlocked_monster))
					panel:InterfaceFunction("set_ability", "template_ability_icon_3", self:get_current_skill_upgrade_for_base_skill(unlocked_monster.config, unlocked_monster.config.battle_skills[3], character, unlocked_monster))
				end
			end
			cm:callback(refresh_panel, 0.1)
		end,

		RegionFactionChangeEvent = function(self, context)
			local region = context:region()
			local current_owner_name = region:owning_faction():name()
			for _, monster in ipairs(self.monsters) do
				-- checking to see if the current monster is unlocked for the faction. If it is, skip it.
				if not self:is_monster_unlocked(monster.id, current_owner_name) then
					local unlockable_buildings = mythic_monsters_common:get_unlockable_buildings_for_faction(faction_key, monster.config)
					for _, building_data in ipairs(unlockable_buildings) do
						local slot_list = region:slot_list()
						-- see if any of the other monsters buildings are constructed here
						if slot_list:buliding_type_exists(building_data.building_level_key) then
							for i = 0, slot_list:num_items() - 1 do 
								local current_slot = slot_list:item_at(i)
								-- if it's constructed, find the exact slot it's constructed in
								if current_slot:has_building() and current_slot:building():name() == building_data.building_level_key then
									cm:instantly_dismantle_building_in_region(region:name(), i)
								end
							end
						end
					end
				end
			end
		end,
	},

	spawn_monster_event = function(self, ctx)
		local context = ctx
		local event_data = self:extract_event_params_table("mythic_monster_spawn_monster_event_", context:trigger())
		local faction_key = event_data[1]
		local x = tonumber(event_data[2])
		local y = tonumber(event_data[3])

		local unlocked_monster = self:unlocked_monster(faction_key)
		if not unlocked_monster then
			return
		end
		self:recruit_monster(faction_key, unlocked_monster, x, y)
		self.persistent.monster_wounded[faction_key] = {wounded = false}
		
		---------------------------
		-- UI manipulation code
		--------------------------
		
		-- showing/hiding exclamation mark on monster button
		self:ui_refresh_monster_recruitment_availability(faction_key)
	end,

	learn_monster_skill_event = function(self, ctx)
		local context = ctx
		local event_data = self:extract_event_params_table("mythic_monster_learn_skill_event_", context:trigger())

		local skill_key = event_data[1]
		local faction_key = event_data[2]
		local node_rank_req = tonumber(event_data[3])

		local unlocked_monster = nil
		for _, monster in ipairs(self.monsters) do
			if is_table(monster) and self:is_monster_unlocked(monster:id(), faction_key) then
				unlocked_monster = monster
			end
		end
		if unlocked_monster == nil then
			out("Could not find unlocked monster to learn skill on.")
			return
		end

		local character_family_member = cm:model():family_member_for_command_queue_index(unlocked_monster.persistent.monster_cqi)
		if character_family_member:is_null_interface() then out("Family member with CQI " .. unlocked_monster.persistent.monster_cqi .. " does not exist!") return end

		local character = character_family_member:character()
		if character:is_null_interface() then out("Monster with family member with CQI " .. unlocked_monster.persistent.monster_cqi .. " has no character!") return end
		local lookup_str = "character_cqi:"..tostring(character:command_queue_index())

		if mythic_monster_skills.config.skill_data[skill_key] ~= nil then
			mythic_monster_skills:add_listeners_for_monster_skill(unlocked_monster, skill_key, false)
		end
		out("LEARNING " .. skill_key)
		cm:force_add_skill(lookup_str, skill_key, false, false)
	end,

	-- showing/hiding exclamation mark on monster button
	ui_refresh_monster_recruitment_availability = function(self, faction_key)
		-- out("ui_refresh_monster_recruitment_availability")
		if faction_key ~= cm:get_local_faction_name(true) then
			return
		end

		local b_available_for_recruit = false
		local unlocked_monster = self:unlocked_monster(faction_key)
		if unlocked_monster then
			if self.persistent.monster_wounded and self.persistent.monster_wounded[faction_key] and self.persistent.monster_wounded[faction_key].wounded then
				local left_turns = self.persistent.monster_wounded[faction_key].turn_wounded + self.config.recruit_cooldown_turns - cm:model():turn_number()
				if left_turns <= 0 then
					b_available_for_recruit = true
				end
			end
		end

		local recruitable_alert_icon = core:get_ui_root():SequentialFind("faction_widget", "main_buttons", "fm_mythic_monster", "recruitable_alert_icon")
		if recruitable_alert_icon then
			recruitable_alert_icon:SetVisible(b_available_for_recruit)
		end
		
		
	end,

	add_monster_panel_hover_handler = function(self, context, panel, unlocked_monster)
		core:add_listener(
			"monster_progression_skill_hover_listener",
			"ComponentMouseOn",
			function(ctx)
				return true
			end,
			function(ctx)
				local comp = UIComponent(ctx.component)
				local button_skill = UIComponent(comp:Parent())
				local skill_flyout = UIComponent(button_skill:Parent())
				local parent_node = UIComponent(skill_flyout:Parent())

				if parent_node == nil or skill_flyout == nil or button_skill == nil or parent_node:Id() == nil then
					return
				end

				if skill_flyout:Id() ~= "skill_flyout" or parent_node:GetProperty("state") == "complete" then
					return
				end

				for i = 0, skill_flyout:ChildCount() - 1 do
					local component = UIComponent(skill_flyout:Find(i))
					local component_button = component and component:SequentialFind("skill_button")
					if component:Id() ~= button_skill:Id() then
						component_button:SetState("unavailable")
					else
						component_button:SetState("available")
					end
				end
			end,
			true
		)
	end,

	add_component_mouse_off_handler = function(self)
		core:add_listener(
			"monster_progression_skill_hover_off_listener",
			"ComponentMouseOff",
			function(ctx)
				return true
			end,
			function(ctx)
				local comp = UIComponent(ctx.component)
				local button_skill = UIComponent(comp:Parent())
				local skill_flyout = UIComponent(button_skill:Parent())
				local parent_node = UIComponent(skill_flyout:Parent())

				if parent_node == nil or skill_flyout == nil or button_skill == nil or parent_node:Id() == nil then
					return
				end

				if skill_flyout:Id() ~= "skill_flyout" or parent_node:GetProperty("state") == "complete" then
					return
				end

				for i = 0, skill_flyout:ChildCount() - 1 do
					local component = UIComponent(skill_flyout:Find(i))
					local component_button = component and component:SequentialFind("skill_button")
					if component and component:CurrentState() ~= "complete" then
						component_button:SetState("available")
					end
				end
			end,
			true
		)
	end,

	has_enough_resource_for_recruit = function(self, faction, monster)
		if faction and monster and monster.config and monster.config.agent_resource_cost and not faction:is_null_interface() then
			return faction:can_afford_resource_cost(monster.config.agent_resource_cost)
		end
		out("Err: has_enough_resource_for_recruit - invalid faction, monster or monster config")
		return false
	end,

	add_monster_panel_click_handler = function(self, context, panel, unlocked_monster, character, shown_progression_tree)
		local l_context = context
		core:add_listener(
			"monster_panel_lclickup_listener",
			"ComponentLClickUp",
			function(ctx)
				return true
			end,
			function(ctx)
				local comp = UIComponent(ctx.component)
				local uic_parent = UIComponent(comp:Parent())
				local local_faction = cm:get_faction(cm:get_local_faction_name(true))

				if not comp or not uic_parent or local_faction:is_null_interface() then
					out("There was an error with the ui component or there was no local faction for monster panel. Aborting lclick...")
					return
				end

				-- if clicked on node - show/hide skills
				local is_node = false
				for _, node in ipairs(self:get_monster_progression_for_faction(local_faction, unlocked_monster)) do
					if node.node_id == uic_parent:Id() then
						is_node = true
						break
					end
				end

				if is_node then
					if shown_progression_tree == "" then
						shown_progression_tree = uic_parent:Id()
						uic_parent:PropagateVisibility(true);
					else

						if uic_parent:Id() ~= shown_progression_tree then
							local shown = panel:SequentialFind(shown_progression_tree)
							local skill_flyout = shown:SequentialFind("skill_flyout")
							if shown then
								if skill_flyout then
									skill_flyout:PropagateVisibility(false)
								end
							end
							shown_progression_tree = uic_parent:Id()
							uic_parent:PropagateVisibility(true);
						else
							shown_progression_tree = ""
							local skill_flyout = uic_parent:SequentialFind("skill_flyout")
							if skill_flyout then
								skill_flyout:PropagateVisibility(false)
							end
						end
					end
					return
				end

				-- if skill, hide the skill list, learn the skill
				for _, node in ipairs(self:get_monster_progression_for_faction(local_faction, unlocked_monster)) do
					if uic_parent:Id() ~= nil then
						if string.match(uic_parent:Id(), node.node_id) then
							-- hide skills
							local shown = panel:SequentialFind(shown_progression_tree)
							if shown then
								local skill_flyout = shown:SequentialFind("skill_flyout")
								if skill_flyout then
									skill_flyout:PropagateVisibility(false)
								end
							end
							shown_progression_tree = ""

							local skill_key = uic_parent:GetProperty("skill")
							local node_uic_id = uic_parent:GetProperty("node")
							if not node_uic_id or not skill_key then
								out("Skill button does not have 'skill' and/or 'node' user properties. aborting...")
								return
							end
							local button = panel:SequentialFind("progression_bar", node_uic_id, "skill_button")
							if button and button:CurrentState() == "complete" or button:CurrentState() == "locked" then
								return
							end

							local confirmation_box_id = ctx.string .. "_confirmation_box"
							-- local confirmation_box = UIComponent(core:get_ui_root():CreateComponent(confirmation_box_id, "ui/Common UI/dialogue_box"))
							-- confirmation_box:RegisterTopMost()
							-- confirmation_box:SetVisible(true)
							-- confirmation_box:LockPriority()
							-- find_child_uicomponent(confirmation_box, "ok_group"):SetVisible(false)
							-- set text here
							-- local dy_text = find_uicomponent(confirmation_box, "DY_text")
							-- dy_text:SetStateText(common.get_localised_string(self.config.monster_skill_confirmation_dialogue_text), self.config.monster_skill_confirmation_dialogue_text)
							create_confirmation_box(confirmation_box_id, self.config.monster_skill_confirmation_dialogue_text, 
								function(context)
									--learn skills
									CampaignUI.TriggerCampaignScriptEvent(local_faction:command_queue_index(), "mythic_monster_learn_skill_event_" .. skill_key .. ";" .. local_faction:name() .. ";" .. node.rank_req)
									panel:InterfaceFunction("set_node_skill_pick", node_uic_id, skill_key, character)
								end,
								function(context)
								end,
								core:get_ui_root()
								)
							return
						end
					end
				end

				local recruit_turns = panel:SequentialFind("tab_recruit", "available_in", "dy_available_in")
				local btn_recruit = panel:SequentialFind("tab_recruit", "btn_recruit")

				-- we need to update btn_recruit, only if the monster is wounded or ready for recruit

				if self.persistent.monster_wounded and self.persistent.monster_wounded[cm:get_local_faction_name(true)] and self.persistent.monster_wounded[cm:get_local_faction_name(true)].wounded then
					-- clicked on army
					if string.find(comp:Id(), "character_row_") ~= nil then
						local left_turns = self.persistent.monster_wounded[cm:get_local_faction_name(true)].turn_wounded + self.config.recruit_cooldown_turns - cm:model():turn_number()
						if left_turns < 0 then
							left_turns = 0
							btn_recruit:SetState("active")
						elseif left_turns > 0 then
							btn_recruit:SetState("inactive")
						else
							btn_recruit:SetState("active")
						end
					end

					-- clicked on settlement
					if string.find(comp:Id(), "troy_") ~= nil then
						local left_turns = self.persistent.monster_wounded[cm:get_local_faction_name(true)].turn_wounded + self.config.recruit_cooldown_turns - cm:model():turn_number()
						if left_turns < 0 then
							left_turns = 0
							btn_recruit:SetState("active")
						elseif left_turns > 0 then
							btn_recruit:SetState("inactive")
						else
							btn_recruit:SetState("active")
						end
					end
				end

				local can_afford = self:has_enough_resource_for_recruit(local_faction, unlocked_monster)
				if not can_afford then
					btn_recruit:SetState("inactive")
				end

				if comp:Id() == "btn_recruit" then
					local selected_region = comp:GetProperty("selected_region")
					local selected_army = comp:GetProperty("selected_army")
					if selected_region then
						local x, y = self:get_spawn_position_region(local_faction:name(), selected_region)
						CampaignUI.TriggerCampaignScriptEvent(local_faction:command_queue_index(), "mythic_monster_spawn_monster_event_" .. local_faction:name() .. ";" .. x .. ";" .. y)

					elseif selected_army then
						local char = cm:model():character_for_command_queue_index(tonumber(selected_army))
						local x, y = self:get_spawn_position_character(local_faction:name(), char)
						CampaignUI.TriggerCampaignScriptEvent(local_faction:command_queue_index(), "mythic_monster_spawn_monster_event_" .. local_faction:name() .. ";" .. x .. ";" .. y)
					end
					local close = panel:SequentialFind("title_bar", "button_ok")
					close:SimulateLClick()
				end

				-- if anywhere else, hide skills
				if shown_progression_tree ~= "" then
					local shown = panel:SequentialFind(shown_progression_tree)
					if shown then
						local skill_flyout = shown:SequentialFind("skill_flyout")
						if skill_flyout then
							skill_flyout:PropagateVisibility(false)
						end
					end
					shown_progression_tree = ""
				end
			end,
			true
		)
	end,

	reset_monster = function(self, monster_id, faction_key)
		for _, monster in ipairs(self.monsters) do
			if is_table(monster) and is_function(monster.id) and is_function(monster.reset_persistent) and monster:id() == monster_id then
				monster:reset_persistent()
			end
		end
	end,

	refresh_unlocked_monsters = function(self)
		for faction_key, data in pairs(self.persistent.unlocked) do
			local faction = cm:get_faction(faction_key)
			if faction:is_dead() then
				for monster_id, unlocked in pairs(data) do
					if unlocked then
						self:reset_monster(monster_id, faction_key)
						self.persistent.unlocked[faction_key][monster_id] = false
					end
				end
			end
		end
	end,

	is_monster_unlocked_in_world = function(self, monster)
		if not monster.persistent.monster_cqi then
			return false
		end
		
		local monster_id = monster:id()
		for faction_key, data in pairs(self.persistent.unlocked) do
			local faction = cm:get_faction(faction_key)
			if data[monster_id] and is_faction(faction) and not faction:is_dead() then
				--out("Monster ".. monster_id .. " is unlocked for " .. faction_key)
				return true
			end
		end

		return false
	end,

	-- monster state for faction
	is_monster_unlocked = function(self, monster_id, faction_key)
		return is_table(self.persistent) and 
				is_table(self.persistent.unlocked) and 
				is_table(self.persistent.unlocked[faction_key]) and 
				self.persistent.unlocked[faction_key][monster_id] or false
	end,

	unlock_monster = function(self, monster_id, faction_key)
		if not is_table(self.persistent) or not is_table(self.persistent.unlocked) then
			return
		end
		
		if not is_table(self.persistent.unlocked[faction_key]) then
			self.persistent.unlocked[faction_key] = {}
		end
		self:refresh_unlocked_monsters()
		self.persistent.unlocked[faction_key][monster_id] = true
		out(tostring(self.persistent.unlocked[faction_key][monster_id]) .. " " .. faction_key .. " " .. monster_id)
		for _, monster in ipairs(mythic_monsters_common.monsters) do
			if monster.config and monster.config.id == monster_id and monster.on_monster_unlocked and is_function(monster.on_monster_unlocked) then
				monster:on_monster_unlocked(faction_key)
				self:create_monster(faction_key, monster)

				if not monster.persistent.monster_cqi then out("!!!FAILED TO CREATE THE MOSTER!!! ") return end

				-- show the mythic monster panel, since we now have a monster
				self:activate_progression_button(faction_key)
				local monster_button = core:get_ui_root():SequentialFind(self.config.monster_panel_button)
				if monster_button and cm:model():faction_is_local(faction_key) then
					monster_button:SetImagePath(monster.config.monster_button_icon)
				end
				
				local character_family_member = cm:model():family_member_for_command_queue_index(monster.persistent.monster_cqi)
				if character_family_member:is_null_interface() then out("Monster with Family member with CQI " .. monster.persistent.monster_cqi .. " does not exist!") return end

				local character = character_family_member:character()
				if character:is_null_interface() then out("Monster with family member with CQI " .. monster.persistent.monster_cqi .. " has no character!") return end

				local immortality_bundle = cm:create_new_custom_effect_bundle("effect_bundle_dummy_immortality")
				cm:apply_custom_effect_bundle_to_character(immortality_bundle, character)

				--unlock buildings
				local buildings_to_unlock = {}
				local unlockable_buildings = mythic_monsters_common:get_unlockable_buildings_for_faction(faction_key, monster.config)
				for _, building_data in ipairs(unlockable_buildings) do
					table.insert(buildings_to_unlock, building_data.building_level_key)
				end
				cm:restrict_buildings_for_faction(faction_key, buildings_to_unlock, false)
				core:trigger_event("ScriptEventMythicMonsterUnlocked", monster_id, cm:get_faction(faction_key))
			end
		end
	end,

	--call from model only
	create_monster = function(self, faction_key, monster)
		local faction = cm:get_faction(faction_key)
		local x, y = nil, nil
		local faction_leader = faction:has_faction_leader() and faction:faction_leader()
		faction_leader = faction_leader and not faction_leader:is_null_interface() and faction_leader
		if faction_leader and faction_leader:has_military_force() then
			x, y = self:get_spawn_position_character(faction_key, faction_leader)
		elseif faction:has_home_region() then
			x, y = self:get_spawn_position_region(faction_key, faction:home_region():name())
		else
			-- Find any of the active armies of the faction.
			local military_forces = faction:military_force_list()
			if military_forces:num_items() <= 0 then
				out("There was no suitable force or region to spawn the monster next to!")
				return false
			end
			local military_force = military_forces:item_at(0)
			local general = military_force:has_general() and military_force:general_character()
			if not general or general:is_null_interface() then
				out("There was no suitable force or region to spawn the monster next to!")
				return false
			end
			x, y = self:get_spawn_position_character(faction_key, general)
		end

		cm:create_agent(
			faction_key,
			monster.config.agent_type,
			monster.config.agent_subtype,
			x,
			y,
			function(cqi)
				local char = cm:get_character_by_cqi(cqi)
				monster.persistent.monster_cqi = char:family_member():command_queue_index();
				out("Created monster with char cqi: " .. cqi .. " and family_member cqi: " .. char:family_member():command_queue_index());
				if monster.on_monster_created and is_function(monster.on_monster_created) then
					monster:on_monster_created(char)
				end
			end
		)
		return true
	end,

	recruit_monster = function(self, faction_key, monster, x, y)
		local character_family_member = cm:model():family_member_for_command_queue_index(monster.persistent.monster_cqi)
		if character_family_member:is_null_interface() then out("Family member with CQI " .. monster.persistent.monster_cqi .. " does not exist!") return end

		local character = character_family_member:character()
		if character:is_null_interface() then out("Monster with family member with CQI " .. monster.persistent.monster_cqi .. " has no character!") return end

		if not self:has_enough_resource_for_recruit(character:faction(), monster) then
			out("not enough resource to recruit")
			return
		end

		local faction = cm:get_faction(faction_key)

		local resource_cost = cm:create_new_custom_resource_cost()
		resource_cost:get_cost_from_record(monster.config.agent_resource_cost)
		cm:faction_apply_resource_transaction(character:faction(), resource_cost)

		--update_supply_points_for_unit

		cm:respawn_convalescing_agent(
			faction_key,
			x,
			y,
			cm:char_lookup_str(character),
			function(cqi)
				local char = cm:get_character_by_cqi(cqi)
				out("Respawned monster with char cqi: " .. cqi .. " and family_member cqi: " .. char:family_member():command_queue_index());
				monster.persistent.monster_cqi = char:family_member():command_queue_index();
				if monster.on_monster_recruited and is_function(monster.on_monster_recruited) then
					monster:on_monster_recruited(char)
				end
			end
		)
	end,

	get_current_skill_upgrade_for_base_skill = function(self, monster_config, base_skill, character, unlocked_monster)
		if not monster_config.skill_upgrades or not monster_config.skill_upgrades[base_skill] then
			return base_skill
		end

		local best_match_skill, best_match_priority = base_skill, 0
		local griffin_skill = nil
		-- just making sure we've got the tables needed.
		if mythic_monster_griffin_config and mythic_monster_griffin_config.battle_skills then
			for k, skill in ipairs(mythic_monster_griffin_config.battle_skills) do
				if base_skill == skill then
					griffin_skill = base_skill
				end
			end
		end
		for skill, skill_upgrade in pairs(monster_config.skill_upgrades[base_skill]) do
			local fulfills_prerequisites = false
			if griffin_skill then
				if skill_upgrade.harmony_side then
					fulfills_prerequisites = skill_upgrade.priority > best_match_priority and is_function(unlocked_monster.get_harmony_state) and unlocked_monster:get_harmony_state() == skill_upgrade.harmony_side
				else
					fulfills_prerequisites = skill_upgrade.priority > best_match_priority
				end
			else
				fulfills_prerequisites = skill_upgrade.priority > best_match_priority
			end
			if fulfills_prerequisites and skill_upgrade.prerequisites then
				for _, prerequisite in ipairs(skill_upgrade.prerequisites) do
					if not character:has_skill(prerequisite) then
						fulfills_prerequisites = false
						break
					end
				end
			end

			if fulfills_prerequisites then
				best_match_skill = skill
				best_match_priority = skill_upgrade.priority
			end
		end

		return best_match_skill
	end,

	activate_button = function(self, button_to_activate, click_button)
		for slot_id, buttons in pairs(mythic_faction_mechanics_containers) do
			if slot_id == self.config.mythic_monster_button_slot then
				local slot_component = core:get_ui_root():SequentialFind(slot_id)
				if slot_component then
					slot_component:SetVisible(true)
				end
				for _, button in ipairs(buttons) do
					local button_component = core:get_ui_root():SequentialFind(button)
					if button == button_to_activate then
						if button_component then
							button_component:SetVisible(true)

							if click_button then
								button_component:SimulateLClick()
							end
						end
					else
						if button_component then
							button_component:SetVisible(false)
						end
					end
				end
			end
		end

		local strat_hud_layout = find_uicomponent(core:get_ui_root(), "hud_campaign")
		if strat_hud_layout then
			-- Force layout to determine new position of resources and administration containers since a new button may end up overlapping the resources.
			strat_hud_layout:InterfaceFunction("LuaAdjustFactionWidgetContainersPosition")
			strat_hud_layout:InterfaceFunction("LuaAddShortcutToMythicButton", button_to_activate)
		end
	end,

	activate_selection_button = function(self, faction_key, click_button)
		if faction_key == cm:get_local_faction_name(true) then
			self:activate_button(self.config.monster_selection_button, click_button)
		end
	end,

	activate_progression_button = function(self, faction_key, click_button)
		if faction_key == cm:get_local_faction_name(true) then
			self:activate_button(self.config.monster_panel_button, click_button)
		end
	end,

	activate_expedition_button = function(self, faction_key, click_button)
		if faction_key == cm:get_local_faction_name(true) then
			self:activate_button(self.config.monster_expedition_button, click_button)
		end
	end,

	-- events
	-- on new game started - called once on new campaign
	on_new_game_started = function(self, context)
		self:call_monsters("on_new_game_started", context)
		-- local faction_key = cm:get_local_faction_name(true) -- we need to restrict the buildings for each faction, not just the player. 
		-- For that we go through each faction in the campaign as different factions may have different buildings for each monster.
		local campaign_factions_list = cm:model():world():faction_list() 
		for i = 0, campaign_factions_list:num_items() - 1 do 
			local faction_key = campaign_factions_list:item_at(i):name()
			for _, monster in ipairs(self.monsters) do
				--lock buildings
				local buildings_to_lock = {}
				local unlockable_buildings = mythic_monsters_common:get_unlockable_buildings_for_faction(faction_key, monster.config)
				for _, building_data in ipairs(unlockable_buildings) do
					table.insert(buildings_to_lock, building_data.building_level_key)
				end

				cm:restrict_buildings_for_faction(faction_key, buildings_to_lock, true)
			end
		end
	end,

	on_first_tick = function(self, context)
		-- add listeners for my/common events

		if is_table(self.events) then
			for event_id, callback_func in pairs(self.events) do
				if is_function(callback_func) and is_function(self.id) then
					self.add_listener_for_event(self, event_id)
				end
			end
		end

		-- processing monsters
		local faction_key = cm:get_local_faction_name(true)
		if is_table(self.monsters) then
			local unlocked_monster = false
			for _, monster in ipairs(self.monsters) do
				local add_monster_listeners = false

				-- call monster on_new_game_started
				if is_table(monster) and is_function(monster.on_first_tick) then
					add_monster_listeners = monster:on_first_tick(context)
				end

				-- add listeners fo monster specific events
				if add_monster_listeners and is_table(monster.events) then
					for event_id, callback_func in pairs(monster.events) do
						if is_function(callback_func) and is_function(monster.id) then
							self.add_listener_for_event(monster, event_id)
						end
					end
				end

				if is_table(mythic_monster_skills) and self:is_monster_unlocked_in_world(monster) then
					mythic_monster_skills:on_first_tick(context, monster)
				end

				-- only UI update/refresh code is valid here (!!! NO MODEL CODE - WILL DESYNC)
				if self:is_monster_unlocked(monster:id(), faction_key) then
					unlocked_monster = true
					self:activate_progression_button(faction_key)
					local monster_button = core:get_ui_root():SequentialFind(self.config.monster_panel_button)
					if monster_button then
						monster_button:SetImagePath(monster.config.monster_button_icon)
					end
				end
			end

			if not unlocked_monster then
				mythic_monsters_expeditions.ui.activate_selection_or_expedition_buttons(faction_key)
			end
		end

		---------------------------
		-- UI manipulation code
		--------------------------
		
		-- showing/hiding exclamation mark on monster button
		self:ui_refresh_monster_recruitment_availability(faction_key)
	end,

	-- save persistent data
	on_saving_game = function(self, context)
		if not is_table(self.config) or not self.config.persistent_suffix or self.config.persistent_suffix == "" then return end

		-- save my/common persistent data
		if is_table(self.persistent) and is_function(self.id) then
			cm:save_named_value(self:id(self.config.persistent_suffix), self.persistent, context)
		end

		if is_table(mythic_monster_skills) then
			cm:save_named_value(mythic_monster_skills.config.id, mythic_monster_skills.persistent, context)
		end

		-- save monsters persistent data
		if is_table(self.monsters) then
			for _, monster in ipairs(self.monsters) do
				if is_table(monster) and is_table(monster.persistent) and is_function(monster.id) then
					cm:save_named_value(monster:id(self.config.persistent_suffix), monster.persistent, context)
				end
			end
		end


		-- call the monsters
		self:call_monsters("on_saving_game", context)
	end,

	-- load persistent data
	on_loading_game = function(self, context)
		if not is_table(self.config) or not self.config.persistent_suffix or self.config.persistent_suffix == "" then return end

		-- load my/common persistent data

		if is_table(self.persistent) and is_function(self.id) then
			self.persistent = cm:load_named_value(self:id(self.config.persistent_suffix), self.persistent, context)
		end
		if is_table(mythic_monster_skills) then
			mythic_monster_skills.persistent = cm:load_named_value(mythic_monster_skills.config.id, mythic_monster_skills.persistent, context)
		end
		-- load monsters persistent data
		if is_table(self.monsters) then
			for _, monster in ipairs(self.monsters) do
				if is_table(monster) and is_table(monster.persistent) and is_function(monster.id) then
					monster.persistent = cm:load_named_value(monster:id(self.config.persistent_suffix), monster.persistent, context)
				end
			end
		end


		-- call the monsters
		self:call_monsters("on_loading_game", context)
	end,

	add_listener_for_event = function(self, event_id)
		if not is_table(self.events) or not is_function(self.id) or not is_function(self.events[event_id]) then return end

		local register_id = self:id(event_id)

		core:add_listener(
			register_id,
			event_id,
			function(context) self.events[event_id](self, context) return false end,
			function(context) end,
			true
		)
	end,

	unlocked_monster = function(self, faction_key)
		for _, monster in ipairs(self.monsters) do
			if is_table(monster) and self:is_monster_unlocked(monster:id(), faction_key) then
				return monster
			end
		end
		return nil
	end,

	get_spawn_position_region = function(self, faction_key, selected_region)
		return cm:find_valid_spawn_location_for_character_from_settlement(faction_key, selected_region, false, true, 3)
	end,

	get_spawn_position_character = function(self, faction_key, character)
		return cm:find_valid_spawn_location_for_character_from_character(faction_key, cm:char_lookup_str(character), true)
	end,

	-- can be extended if needed
	call_monsters = function(self, function_name, context)
		if not is_table(self.monsters) then return end
		for _, monster in ipairs(self.monsters) do
			if is_table(monster) and is_function(monster[function_name]) then
				monster[function_name](monster, context)
			end
		end
	end,

	on_agent_panel_opened = function(self, context)
		local panel = UIComponent(context.component)
		local component_actions_list = panel:SequentialFind("options_panel", "method_list")
		if component_actions_list then
			for i = 0, component_actions_list:ChildCount() - 1 do
				local component_action = UIComponent(component_actions_list:Find(i))
				local component_button = component_action and component_action:SequentialFind("button_method")
				local action_id = component_button:GetProperty("action_id")
				for _, monster in ipairs(self.monsters) do
					if is_table(monster.config.agent_actions) then
						for __, agent_action in ipairs (monster.config.agent_actions) do
							if agent_action.id == action_id and is_table(agent_action.agent_options_panel_customization) then
								if is_string(agent_action.agent_options_panel_customization.cost_tooltip) then
									local component_cost = panel:SequentialFind("tx_income")
									if component_cost then
										component_cost:SetTooltipText(common.get_localised_string(agent_action.agent_options_panel_customization.cost_tooltip), agent_action.agent_options_panel_customization.cost_tooltip, true)
									end
								end
							end
						end
					end
				end
			end
		end
	end
}

-- returns a simple or composite ID
mythic_monsters_common.id = function(self, suff) 
	if not is_table(self.config) or not self.config.id then
		err("Missing common ID")
		return
	end
	return suff and suff ~= "" and self.config.id.."_"..suff or self.config.id 
end

-- Convert from "long" monster IDs (like "MYTHIC_MONSTER_CERBERUS") to "short" monster keys (like "cerberus").
mythic_monsters_common.monster_id_to_key = function(self, monster_id)
	for _, monster in ipairs(self.monsters) do
		if monster.config.id == monster_id then
			return monster.config.key
		end
	end
	return nil
end

-- Convert from "short" monster keys (like "cerberus") to "long" monster IDs (like "MYTHIC_MONSTER_CERBERUS").
mythic_monsters_common.monster_key_to_id = function(self, monster_key)
	for _, monster in ipairs(self.monsters) do
		if monster.config.key == monster_key then
			return monster.config.id
		end
	end
	return nil
end

mythic_monsters_common.extract_event_params_table = function(self, event_name, trigger)
	local text_data = string.gsub(trigger, event_name, "", 1)
	local event_data = {}
	for w in (text_data .. ";"):gmatch("([^;]*);") do
		table.insert(event_data, w)
	end
	return event_data
end

-- This function returns the monster progression for specified faction.
-- If there is an override for the provided faction (if any, allowing for no faction given), return it. Otherwise, return the default one.
mythic_monsters_common.get_monster_progression_for_faction = function(self, faction, unlocked_monster)

	if not unlocked_monster then 
		script_error("mythic_monsters_common.get_monster_progression_for_faction() was called but provided unlocked_monster is not valid.")
		return
	end


	if faction and not faction:is_null_interface() then 
		local faction_name = faction:name()
		
		if unlocked_monster.config.monster_progression and unlocked_monster.config.monster_progression[faction_name] then
			return unlocked_monster.config.monster_progression[faction_name]
		end

	end

	return unlocked_monster.config.monster_progression.default

end

mythic_monsters_common.get_unlockable_buildings_for_faction = function(self, faction_key, monster_config)
	if not is_table(monster_config) then 
		script_error("mythic_monsters_common.get_unlockable_buildings_for_faction() was called with invalid parameter monster_config.")
		return
	end

	if faction_key and faction_key ~= "" then
		if is_table(monster_config.unlockable_buildings) and monster_config.unlockable_buildings[faction_key] then
			return monster_config.unlockable_buildings[faction_key]
		end
	end

	return monster_config.unlockable_buildings.default
end

mythic_monsters_common.get_display_buildings_for_faction = function(self, faction_key, monster_config)
	if not is_table(monster_config) then 
		script_error("mythic_monsters_common.get_display_buildings_for_faction() was called with invalid parameter monster_config.")
		return
	end

	if faction_key and faction_key ~= "" then
		if is_table(monster_config.display_buildings) and monster_config.display_buildings[faction_key] then
			return monster_config.display_buildings[faction_key]
		end
	end

	return monster_config.display_buildings.default
end

mythic_monsters_common.require_files()

--------------------------------------------------------------
-------------------- INIT / SAVING / LOADING -----------------
--------------------------------------------------------------
cm:add_first_tick_callback_new(function(context) mythic_monsters_common:on_new_game_started(context) end)
cm:add_first_tick_callback(function(context) mythic_monsters_common:on_first_tick(context) end)
cm:add_saving_game_callback(function(context) mythic_monsters_common:on_saving_game(context) end)
cm:add_loading_game_callback(function(context) mythic_monsters_common:on_loading_game(context) end)

function dump(o)
	if type(o) == 'table' then
		local s = '{ '
		local skip_comma = true
		for k,v in pairs(o) do
			if skip_comma then skip_comma = false else s = s..', ' end
			if type(k) ~= 'number' then k = '"'..tostring(k)..'"' end
			s = s..'['..k..'] = '..dump(v)
		end
		return s .. '} '
	else
		return tostring(o)
	end
end

----TEST CODE ----
	-- hide mythic monster panel. it will be trigged by corresponding script
	-- if cm:get_campaign_name() == "troy_mythic" then
	-- 	mythic_monsters_common:activate_selection_button(cm:get_local_faction_name(true))
	-- end
-- mythic_monsters_common:unlock_monster("MYTHIC_MONSTER_GRIFFIN", cm:get_local_faction_name(true))
-- mythic_monsters_common:unlock_monster("MYTHIC_MONSTER_CERBERUS", cm:get_local_faction_name(true))
--mythic_monsters_common:activate_selection_button("troy_main_dan_achilles")