out("Loading troy_mythic_monsters_selection.lua")


mythic_monster_selection = {
	unlock_turn = 20,
	panel = "monster_selection",
	select_button = "btn_select",
	anchor_buttons = {
		btn_overview = "container_overview",
		btn_battle_stats = "container_battle_stats",
		btn_battle_abilities = "container_battle_abilities",
		btn_campaign_abilities = "container_campaign_abilities",
		btn_unit_roster = "container_unit_roster",
		btn_buildings = "container_buildings",
	},
	monsters = {
		[1] = { name = "griffin", pos = "left"},
		[2] = { name = "cerberus", pos = "mid"},
		[3] = { name = "hydra", pos = "right"},
	},
	names = {
		griffin = "ui_text_replacements_localised_text_hp_title_unit_griffin",
		cerberus = "ui_text_replacements_localised_text_hp_title_unit_cerberus",
		hydra = "ui_text_replacements_localised_text_hp_title_unit_hydra",
	},
	card_front = {
		images = {
			griffin = "UI/skins/default/troy_mth_frontend_art_circle_griffin.png",
			cerberus = "UI/skins/default/troy_mth_frontend_art_circle_cerberus.png",
			hydra = "UI/skins/default/troy_mth_frontend_art_circle_hydra.png",
		},
		flavour_text = {
			griffin = "ui_text_replacements_localised_text_hp_desc_unit_griffin",
			cerberus = "ui_text_replacements_localised_text_hp_desc_unit_cerberus",
			hydra = "ui_text_replacements_localised_text_hp_desc_unit_hydra",
		},
	},
	card_back = {
		sections_overviews = {
			griffin = {
				battle_abilities = "ui_text_replacements_localised_text_troy_mth_monster_selection_griffin_battle_abilities",
				campaign_abilities = "ui_text_replacements_localised_text_troy_mth_monster_selection_griffin_campaign_actions",
				units = "ui_text_replacements_localised_text_troy_mth_monster_selection_griffin_units",
				buildings = "ui_text_replacements_localised_text_troy_mth_monster_selection_griffin_buildings",
			},
			cerberus = {
				battle_abilities = "ui_text_replacements_localised_text_troy_mth_monster_selection_cerberus_battle_abilities",
				campaign_abilities = "ui_text_replacements_localised_text_troy_mth_monster_selection_cerberus_campaign_actions",
				units = "ui_text_replacements_localised_text_troy_mth_monster_selection_cerberus_units",
				buildings = "ui_text_replacements_localised_text_troy_mth_monster_selection_cerberus_buildings",
			},
			hydra = {
				battle_abilities = "ui_text_replacements_localised_text_troy_mth_monster_selection_hydra_battle_abilities",
				campaign_abilities = "ui_text_replacements_localised_text_troy_mth_monster_selection_hydra_campaign_actions",
				units = "ui_text_replacements_localised_text_troy_mth_monster_selection_hydra_units",
				buildings = "ui_text_replacements_localised_text_troy_mth_monster_selection_hydra_buildings",
			},
		},
		overview_panel = {
			griffin = mythic_monster_griffin_config.overview_panel,
			cerberus = cerberus_config.overview_panel,
			hydra = mythic_monster_hydra_config.overview_panel,
		},
		agent_subtypes = {
			griffin = mythic_monster_griffin_config.agent_subtype,
			cerberus = cerberus_config.agent_subtype,
			hydra = mythic_monster_hydra_config.agent_subtype,
		},
		unit_keys = {
			griffin = mythic_monster_griffin_config.unit_key,
			cerberus = cerberus_config.unit_key,
			hydra = mythic_monster_hydra_config.unit_key,
		},
		battle_abilities = {
			hydra = mythic_monster_hydra_config.battle_skills,
			cerberus = cerberus_config.battle_skills,
			griffin = mythic_monster_griffin_config.battle_skills,
		},
		unlockable_units = {
			griffin = mythic_monster_griffin_config.unlockable_units,
			cerberus = cerberus_config.unlockable_units,
			hydra = mythic_monster_hydra_config.unlockable_units,
		},
		monster_configs = {
			griffin = mythic_monster_griffin_config,
			cerberus = cerberus_config,
			hydra = mythic_monster_hydra_config,
		},
	},
}

-- The function parameter hover_locked, if set to true, would make the function return a value that would indicate a locked state.
-- This is done so that all the locked states are enclosed in this function, instead of scattered around the code.
mythic_monster_selection.get_monster_locked_by = function(monster_key, hover_locked)
	if hover_locked == true then
		return "antagonist"	-- This state would do the work of the card looking locked. If this changes, a new state would be required.
	end

	local monster_id = mythic_monsters_common:monster_key_to_id(monster_key)
	if antagonist.mythic_monster == monster_id then
		return "antagonist"
	end

	local human_faction_keys = cm:get_human_factions()
	for _, human_faction_key in ipairs(human_faction_keys) do
		-- No need to check agains the local faction, as being here means that it has no active expedition and has not unlocked a monster.
		if mythic_monsters_expeditions.has_expedition_data(human_faction_key, monster_key) or mythic_monsters_common:is_monster_unlocked(monster_id, human_faction_key) then
			return "multiplayer"
		end
	end
	return nil
end

-- Set some components in respective states so that the card is locked.
mythic_monster_selection.refresh_monster_card_lock = function(card, locked_by)
	local component_card_front = card:SequentialFind("monster_card_front")
	if component_card_front then
		component_card_front:SetState(locked_by or "NewState")

		local component_portrait_frame = component_card_front:SequentialFind("portrait_frame")
		if component_portrait_frame then
			component_portrait_frame:SetState(locked_by and "inactive" or "active")

			local component_portrait_image = component_portrait_frame:SequentialFind("portrait_image")
			if component_portrait_image then
				component_portrait_image:SetState(locked_by or "NewState")
			end
		end

		local component_footer = component_card_front:SequentialFind("footer")
		if component_footer then
			component_footer:SetState(locked_by or "NewState")

			local component_button_select = component_footer:SequentialFind("btn_select")
			if component_button_select then
				component_button_select:SetState(locked_by or "active")
			end
		end
	end

	local component_card_back = card:SequentialFind("monster_card_back")
	if component_card_back then
		component_card_back:SetState(locked_by or "NewState")

		local component_footer = component_card_back:SequentialFind("footer")
		if component_footer then
			component_footer:SetState(locked_by or "NewState")

			local component_button_select = component_footer:SequentialFind("btn_select")
			if component_button_select then
				component_button_select:SetState(locked_by or "active")
			end
		end
	end
end

core:add_listener(
	"monster_selection_panel_listener",
	"PanelOpenedCampaign",
	function(context)
		if context.string == mythic_monster_selection.panel then
			return true
		end
	end,
	function(context)
		local panel =  core:get_ui_root():SequentialFind(mythic_monster_selection.panel)
		local cards = {}

		for id, monster_data in ipairs(mythic_monster_selection.monsters) do
			local monster = monster_data.name
			panel:InterfaceFunction("create_monster_card", monster, monster_data.pos)
			local card = panel:SequentialFind(monster)
			if card then
				card:SetProperty("monster", monster)

				-- card front
				local front_name = card:SequentialFind("monster_card_front", "dy_monster_title")
				if front_name then
					front_name:SetText(common.get_localised_string(mythic_monster_selection.names[monster]))
				end

				local back_name = card:SequentialFind("monster_card_back", "dy_monster_title")
				if back_name then
					back_name:SetText(common.get_localised_string(mythic_monster_selection.names[monster]))
				end

				local flavour_text = card:SequentialFind("monster_card_front", "dy_flavour_text")
				if flavour_text then
					flavour_text:SetText(common.get_localised_string(mythic_monster_selection.card_front.flavour_text[monster]))
				end

				-- monster image is waiting on images from ui team.
				local image = card:SequentialFind("monster_card_front", "portrait_image")
				if image then
					image:SetImagePath(mythic_monster_selection.card_front.images[monster])
				end

				-- card back
				-- set overview
				for id, feature in pairs(mythic_monster_selection.card_back.overview_panel[monster]) do
					card:InterfaceFunction("set_feature", id)
					local title = card:SequentialFind(id, "dy_feature_title")
					if title then
						title:SetText(common.get_localised_string(feature.title))
					end

					local text = card:SequentialFind(id, "dy_feature_info_text")
					if text then
						text:SetText(common.get_localised_string(feature.infotext))
					end
				end

				-- set battle stats
				card:InterfaceFunction("set_monster_stats", mythic_monster_selection.card_back.unit_keys[monster])

				-- battle skills
				local battle_skills_overview = card:SequentialFind("container_battle_abilities", "dy_overview")
				if battle_skills_overview then
					battle_skills_overview:SetText(common.get_localised_string(mythic_monster_selection.card_back.sections_overviews[monster].battle_abilities))
				end
				for id, skill_key in ipairs(mythic_monster_selection.card_back.battle_abilities[monster]) do
					local comp_id = monster .. "_skill_" .. id
					card:InterfaceFunction("set_ability", comp_id, skill_key)
				end

				local campaign_skills_overview = card:SequentialFind("container_campaign_abilities", "dy_overview")
				if campaign_skills_overview then
					campaign_skills_overview:SetText(common.get_localised_string(mythic_monster_selection.card_back.sections_overviews[monster].campaign_abilities))
				end

				--campaign skills
				card:InterfaceFunction("set_campaign_abilities", "wizard", mythic_monster_selection.card_back.agent_subtypes[monster], cm:get_local_faction_name(true))

				-- units
				local units_overview = card:SequentialFind("container_unit_roster", "dy_overview")
				if units_overview then
					units_overview:SetText(common.get_localised_string(mythic_monster_selection.card_back.sections_overviews[monster].units))
				end
				for _, unit_data in ipairs(mythic_monster_selection.card_back.unlockable_units[monster]) do
					card:InterfaceFunction("set_unit", unit_data.key)
				end

				-- buildings
				local buildings_overview = card:SequentialFind("container_buildings", "dy_overview")
				if buildings_overview then
					buildings_overview:SetText(common.get_localised_string(mythic_monster_selection.card_back.sections_overviews[monster].buildings))
				end

				local display_buildings = mythic_monsters_common:get_display_buildings_for_faction(cm:get_local_faction_name(true), mythic_monster_selection.card_back.monster_configs[monster])
				for _, building_data in ipairs(display_buildings) do
					card:InterfaceFunction("set_building", building_data.building_level_key, building_data.culture_variant_key, cm:get_local_faction_name(true))
				end

				local front_button = card:SequentialFind("monster_card_front", mythic_monster_selection.select_button)
				if front_button then
					front_button:SetProperty("monster", monster)
				end
				local back_button = card:SequentialFind("monster_card_back", mythic_monster_selection.select_button)
				if back_button then
					back_button:SetProperty("monster", monster)
				end

				-- add anchors
				for button, container in pairs(mythic_monster_selection.anchor_buttons) do
					card:InterfaceFunction("add_anchor_button", button, container)
				end

				local locked_by = mythic_monster_selection.get_monster_locked_by(monster_data.name)
				mythic_monster_selection.refresh_monster_card_lock(card, locked_by)

				table.insert(cards, card)
			end
		end

		core:add_listener(
			"monster_selection_component_mouse_on_select_button_listener",
			"ComponentMouseOn",
			function(ctx)
			   return context.string == mythic_monster_selection.select_button
			end,
			function(ctx)
				local component_button_select = UIComponent(ctx.component)
				if component_button_select then
					local selected_monster = component_button_select:GetProperty("monster")
					for _, card in ipairs(cards) do
						local card_monster = card:GetProperty("monster")
						if card_monster ~= selected_monster then
							local locked_by = mythic_monster_selection.get_monster_locked_by(card_monster, true)
							mythic_monster_selection.refresh_monster_card_lock(card, locked_by)
						end
					end
				end
			end,
			true
		)

		core:add_listener(
			"monster_selection_component_mouse_off_select_button_listener",
			"ComponentMouseOff",
			function(ctx)
			   return context.string == mythic_monster_selection.select_button
			end,
			function(ctx)
				local component_button_select = UIComponent(ctx.component)
				if component_button_select then
					local selected_monster = component_button_select:GetProperty("monster")
					for _, card in ipairs(cards) do
						local card_monster = card:GetProperty("monster")
						if card_monster ~= selected_monster then
							local locked_by = mythic_monster_selection.get_monster_locked_by(card_monster)
							mythic_monster_selection.refresh_monster_card_lock(card, locked_by)
						end
					end
				end
			end,
			true
		)

		core:add_listener(
			"monster_selection_lclick_listener",
			"ComponentLClickUp",
			function(ctx)
			   return true
			end,
			function(ctx)
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local comp = UIComponent(ctx.component)
				if comp and context.string == mythic_monster_selection.select_button then
					local selected_monster = comp:GetProperty("monster")
					CampaignUI.TriggerCampaignScriptEvent(faction:command_queue_index(), "select_monster_" .. selected_monster .. ";" .. faction:name())
					panel:InterfaceFunction("close_panel")
				end

				if comp and context.string == "button_ok" then
					panel:InterfaceFunction("close_panel")
				end
			end,
			true
		)

	end,
	true
)

core:add_listener(
	"monster_selection_panel_listener_closed",
	"PanelClosedCampaign",
	function(context)
		if context.string == mythic_monster_selection.panel then
			return true
		end
	end,
	function(context)
		core:remove_listener("monster_selection_component_mouse_on_select_button_listener")
		core:remove_listener("monster_selection_component_mouse_off_select_button_listener")
		core:remove_listener("monster_selection_lclick_listener")
	end,
	true
)

core:add_listener(
	"monster_selection_select_monster_listener",
	"UITriggerScriptEvent",
	function(context)
		return string.find(context:trigger(), "select_monster_") ~= nil
	end,
	function(context)
		local text_data = string.gsub(context:trigger(), "select_monster_", "", 1)
		local event_data = {}
		 for w in (text_data .. ";"):gmatch("([^;]*);") do
			table.insert(event_data, w)
		end

		local selected_monster = event_data[1]
		local faction = event_data[2]
		mythic_monsters_expeditions.set_selected_monster(faction, selected_monster, true)  -- fix not to use local faction use the key
	end,
	true
)