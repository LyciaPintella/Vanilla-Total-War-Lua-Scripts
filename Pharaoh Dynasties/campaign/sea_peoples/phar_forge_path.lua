out("Loading phar_forge_path.lua")

local function output(str)
	if str then
		out("*** phar_forge_path ***: " .. str)
	end
end


forge_path = {
	config = {
		systems = {
			{
				name = "eminence",
				panel_name = "sea_eminence_panel",
				num_razed_regions_required_to_unlock = 1,

				on_lock_callback = function(faction_key)
						local faction = cm:get_faction(faction_key)
						cm:set_script_state(faction, "is_eminence_unlocked", false)

						if faction_key == cm:get_local_faction_name(true) then
							uim:override("hide_resource_phar_eminence"):lock()
						end
					end,
				on_unlock_callback = function(faction_key, called_from_load)
						local faction = cm:get_faction(faction_key)
						cm:set_script_state(faction, "is_eminence_unlocked", true)

						cm:apply_effect_bundle("phar_sea_pooled_resource_eminence_cap_increase_bundle", faction_key, 0)

						if faction_key == cm:get_local_faction_name(true) then
							uim:override("hide_resource_phar_eminence"):unlock()
						end
					end,

				ui = {
					button_container_component = "fm_sea_eminence_container",
					localization_keys = {
						title = "phar_sea_eminence_title",
						card_info = "phar_sea_eminence_card_info",
						unlock_requirement = "phar_sea_eminence_first_unlock_requirement_text",
						flavor_text = "phar_sea_forge_path_detailed_info_eminence_flavor_text",
						preview_texts = {
							"phar_sea_forge_path_detailed_info_eminence_preview_text_first",
							"phar_sea_forge_path_detailed_info_eminence_preview_text_second",
							"phar_sea_forge_path_detailed_info_eminence_preview_text_third",
						},
						select_path_tooltip_title = "phar_sea_forge_path_select_path_tooltip_title",
						tooltip_unlock = "phar_sea_forge_path_select_path_tooltip_eminence_text",
						tooltip_cannot_unlock = "phar_sea_forge_path_select_path_tooltip_cannot_unlock_eminence_reason",
					},

					icon_paths = {
						card_art = "UI/skins/default/pharaohs_crown/eminence_illustration.png",
						preview_arts = {
							"UI/skins/default/pharaohs_crown/path_preview/eminence_preview_1_forge_path.png",
							"UI/skins/default/pharaohs_crown/path_preview/eminence_preview_2_forge_path.png",
							"UI/skins/default/pharaohs_crown/path_preview/eminence_preview_3_forge_path.png",
						},
					},
				},
			},
			{
				name = "tribes_privileges",
				panel_name = "sea_tribes_privileges",
				technology_key_required_to_unlock = "phar_sea_civil_7_enables_settlement_occupation",

				on_lock_callback = function(faction_key)
					local faction = cm:get_faction(faction_key)
					cm:set_script_state(faction, "tribes_and_privileges_unlocked", false)

					tribes_privileges:set_enable_model_listeners(false)

					tribes_privileges.apply_effects_to_forces_of_faction(faction, false)

					if faction_key == cm:get_local_faction_name(true) then
						tribes_privileges.ui.set_enable_ui(false)
					end
				end,

				on_unlock_callback = function(faction_key, called_from_load)
					local faction = cm:get_faction(faction_key)
					cm:set_script_state(faction, "tribes_and_privileges_unlocked", true)

					cm:apply_effect_bundle("phar_sea_effect_bundle_pooled_resource_dwelling_points_cap", faction_key, 0)
					cm:apply_effect_bundle("phar_sea_effect_bundle_pooled_resource_blades_points_cap", faction_key, 0)

					tribes_privileges:set_enable_model_listeners(true)
					if not called_from_load then
						tribes_privileges.on_turn_start(faction_key)
						tribes_privileges.apply_effects_to_forces_of_faction(faction, true)
					end

					if faction_key == cm:get_local_faction_name(true) then
						tribes_privileges.ui.set_enable_ui(true)
					end
				end,

				ui = {
					button_container_component = "fm_sea_tribes_privileges_container",
					localization_keys = {
						title = "phar_sea_tribes_and_privileges_title",
						card_info = "phar_sea_tribes_and_privileges_card_info",
						unlock_requirement = "phar_sea_tribes_and_privileges_first_unlock_requirement_text",
						flavor_text = "phar_sea_forge_path_detailed_info_tribes_and_privileges_flavor_text",
						preview_texts = {
							"phar_sea_forge_path_detailed_info_tribes_and_privileges_preview_text_first",
							"phar_sea_forge_path_detailed_info_tribes_and_privileges_preview_text_second",
							"phar_sea_forge_path_detailed_info_tribes_and_privileges_preview_text_third",
						},
						select_path_tooltip_title = "phar_sea_forge_path_select_path_tooltip_title",
						tooltip_unlock = "phar_sea_forge_path_select_path_tooltip_tribes_and_privileges_text",
						tooltip_cannot_unlock = "phar_sea_forge_path_select_path_tooltip_cannot_unlock_tribes_and_privileges_reason",
					},

					icon_paths = {
						card_art = "UI/skins/default/pharaohs_crown/tribes_privileges_illustration.png",
						preview_arts = {
							"UI/skins/default/pharaohs_crown/path_preview/tribes_privileges_preview_1_forge_path.png",
							"UI/skins/default/pharaohs_crown/path_preview/tribes_privileges_preview_2_forge_path.png",
							"UI/skins/default/pharaohs_crown/path_preview/tribes_privileges_preview_3_forge_path.png",
						},
					},
				},
			},
		},--forge_path.config.systems

		ui = {
			panel_name = "pharaohs_crown",
			info_card_name_prefix = "forge_path_card_",

			select_path_button_tooltip_layout_path = "UI/Common UI/tooltip_title_description_warning",

			component_ids = {
				features_locked_by_forge_path_containers = {
					court_button_container = "phar_court_container",
					pharaohs_crown_button_container = "fm_phar_pharaoh_crown_container",
					ancient_legacies_button_container = "fm_phar_ancient_legacies_container",
				},

				egypt_land = "egypt_land",
				hittite_land = "hittite_land",

				info_card = "forge_path_card",
				info_card_notification = "notification_holder",

				panel = "forge_path_detailed_info",

				cards_holder = "list_box_legacy_cards_holder",
				card_template = "legacy_card_template",
				card_title = "dy_path",
				card_art = "legacy_art",
				card_requirements_list_holder = "path_requirements_list",
				card_requirement_template = "template_target",
				card_requirement_checkbox = "icon_complete",
				card_requirement_text = "dy_target_name",
				card_flavor_info = "dy_path_info",
				card_read_more_button = "button_read_more",

				path_detailed_info = "path_detailed_info",
				path_detailed_info_header = "header_holder",
				path_detailed_info_header_title = "dy_path_name",
				path_detailed_info_previous_button = "previous_button",
				path_detailed_info_next_button = "next_button",
				path_detailed_info_flavor_info = "sub_header",
				path_detailed_info_card_holder = "card_holder",
				path_detailed_info_card_info_template = "card_info_template",
				path_detailed_info_card_info_art = "legacy_art",
				path_detailed_info_card_info_text = "card_text",
				path_detailed_info_select_path_button = "button_select_path",

				select_path_button_tooltip_title = "dy_title",
				select_path_button_tooltip_warning_text = "dy_warning",
				select_path_button_tooltip_action_text = "dy_action",
			},

			component_states = {
				active = "active",
				inactive = "inactive",
			},

			colour_codes = {
				active = "dark_g",
				inactive = "red",
			},
		},--forge_path.config.ui
	},--forge_path.config

	persistent = {
		system_unlocks = {
			--example format:
			--["phar_sea_sherden"] = {"eminence", "tribes_privileges",},	-- faction "phar_sea_sherden" has unlocked 2 systems (currently  -8-Sep-2023 - design doesn't allow this - only one path can be chosen)
			--["phar_main_ramesses"] = {"eminence"},
		},
		num_razed_regions = {
			--example format:
			--["phar_main_ramesses"] = 2,
			--["phar_main_kurunta"] = 0,
			--["phar_sea_sherden"] = 4,
		},
	},

	system_name_property = "system_name",


	-------------
	--- FUNCTIONS

	get_system_index = function(system_name)
		return table_find(forge_path.config.systems, function(e) return e.name == system_name end, true)
	end,

	get_system_by_index = function(target_system_index)
		return forge_path.config.systems[target_system_index]
	end,

	is_valid_system = function(system_name)
		for _, system_config in ipairs(forge_path.config.systems) do
			if system_config.name == system_name then
				return true
			end
		end

		return false
	end,

	get_system_config_by_name = function(system_name)
		if not forge_path.is_valid_system(system_name) then
			output("ERROR: Invalid system name!")
			return
		end

		for _, system_config in ipairs(forge_path.config.systems) do
			if system_config.name == system_name then
				return system_config
			end
		end

		return
	end,

	is_system_available_to_faction = function(system_name, faction_key)
		if system_name == "eminence" then
			return true
		elseif system_name == "tribes_privileges" then
			return table_contains(sea_peoples_playable_faction_keys, faction_key)
		end

		return false
	end,

	--- @function can_system_be_unlocked_by_faction
	--- @param system_config : a config entry of forge_path.config.systems
	--- @param faction_key : the db key of the faction in question
	--- @return bool whether the specified system can be unlocked for the faction
	can_system_be_unlocked_by_faction = function(system_config, faction_key)
		if not feature_unlock.is_feature_unlocked_for_faction(faction_key, feature_ids_config.pharaohs_crown) then
			return false
		end

		local unlocked_legitimacy = legitimacy_choice:get_unlocked_legitimacy(faction_key)
		if is_table(unlocked_legitimacy) then
			return false
		end

		local system_name = system_config.name
		if not forge_path.is_system_available_to_faction(system_name, faction_key) then
			return false
		end

		if system_name == "eminence" then
			return (forge_path.persistent.num_razed_regions[faction_key] and forge_path.persistent.num_razed_regions[faction_key] >= system_config.num_razed_regions_required_to_unlock) or false
		elseif system_name == "tribes_privileges" then
			return cm:get_faction(faction_key):has_technology(system_config.technology_key_required_to_unlock)
		end

		return false
	end,

	--- @function get_num_unlockable_systems
	--- @param faction_key : the db key of the faction in question
	--- @return returns the amount of Forge your own Path systems that can be unlocked by faction_key, or false if there  are no such systems
	get_num_unlockable_systems = function(faction_key)
		local num_unlockable_systems = 0

		for _, system_config in ipairs(forge_path.config.systems) do
			if forge_path.can_system_be_unlocked_by_faction(system_config, faction_key) then
				num_unlockable_systems = num_unlockable_systems + 1
			end
		end

		return num_unlockable_systems
	end,

	unlock_system_for_faction = function(system_name, faction_key)
		if forge_path.is_system_unlocked_by_faction(system_name, faction_key) then
			output("ERROR: Invalid system name!")
			return
		end

		if not forge_path.persistent.system_unlocks[faction_key] then
			forge_path.persistent.system_unlocks[faction_key] = {}
		end
		table.insert(forge_path.persistent.system_unlocks[faction_key], system_name)

		local system_config = forge_path.get_system_config_by_name(system_name)
		if system_config.on_unlock_callback then
			system_config.on_unlock_callback(faction_key)
		end

		local faction = cm:get_faction(faction_key)
		cm:set_script_state(faction, "forge_path_unlocked", true)

		core:trigger_event("ForgePathUnlocked", { faction_key = faction_key, path_id = system_name })

		return true
	end,

	--- @function is_system_unlocked_by_faction
	--- @param system_name : must be a string in forge_path.config.systems
	--- @param faction_key : the db key of the faction in question
	--- @return bool whether the specified system_name is unlocked for the faction
	is_system_unlocked_by_faction = function(system_name, faction_key)
		if not forge_path.is_valid_system(system_name) then
			return false
		end

		if not forge_path.persistent.system_unlocks[faction_key] then
			return false
		end

		return table_contains(forge_path.persistent.system_unlocks[faction_key], system_name)
	end,

	is_any_system_unlocked = function(faction_key)
		for _, system_config in ipairs(forge_path.config.systems) do
			if forge_path.is_system_unlocked_by_faction(system_config.name, faction_key) then
				return true
			end
		end

		return false
	end,

	initialise_system_states = function()
		local human_factions = cm:get_human_factions()
		for _, faction_key in ipairs(human_factions) do
			local has_unlocked_system = false

			for _, system_config in ipairs(forge_path.config.systems) do
				local is_system_unlocked = forge_path.is_system_unlocked_by_faction(system_config.name, faction_key)
				if is_system_unlocked then
					has_unlocked_system = true
					if system_config.on_unlock_callback then
						system_config.on_unlock_callback(faction_key, true)
					end
				elseif system_config.on_lock_callback then
					system_config.on_lock_callback(faction_key)
				end
			end

			local faction = cm:get_faction(faction_key)
			cm:set_script_state(faction, "forge_path_unlocked", has_unlocked_system)
		end
	end,

	cheat_unlock_system = function(system_name)
		local faction_key = cm:get_local_faction_name(true)
		forge_path.unlock_system_for_faction(system_name, faction_key)
		forge_path.ui.arrange_faction_buttons(cm:get_local_faction_name(true))
	end,

	----------------
	--- UI FUNCTIONS
	ui = {
		populate_info_panel_cards = function()
			if not core.ui_is_created or not is_function(core.get_ui_root) then
				output("ERROR @ forge_path.ui.populate_info_panel_cards() - ui hasn't been created yet!")
				return
			end

			local pharaohs_crown_panel_component = core:get_ui_root():SequentialFind(forge_path.config.ui.panel_name)
			if not pharaohs_crown_panel_component then
				output("ERROR @ Pharaoh's Crown panel not found!")
				return
			end

			forge_path.ui.set_land_components_interactivity(false)

			local forge_path_subpanel_component = pharaohs_crown_panel_component:SequentialFind(forge_path.config.ui.component_ids.panel)
			local cards_holder_component = forge_path_subpanel_component:SequentialFind(forge_path.config.ui.component_ids.cards_holder)
			local card_template_component = forge_path_subpanel_component:SequentialFind(forge_path.config.ui.component_ids.card_template)
			card_template_component:SetVisible(false)
			cards_holder_component:DestroyChildren()

			for _, system_config in ipairs(forge_path.config.systems) do
				local system_name = system_config.name
				local component_name = forge_path.config.ui.info_card_name_prefix .. system_name
				local card_component = UIComponent(cards_holder_component:CreateFromComponent(card_template_component:Address(), component_name))

				local local_faction_key = cm:get_local_faction_name(true)
				local is_available = forge_path.is_system_available_to_faction(system_name, local_faction_key)
				card_component:SetVisible(is_available)
				if is_available then
					forge_path.ui.populate_path_card(local_faction_key, card_component, system_config)
				end
			end
		end,

		populate_path_card = function(faction_key, card_component, system_config)
			local system_name = system_config.name

			-- title
			local title_localized_text, title_localized_source = get_localised_random_string_and_source(system_config.ui.localization_keys.title)
			local card_title_component = card_component:SequentialFind(forge_path.config.ui.component_ids.card_title)
			card_title_component:SetText(title_localized_text, title_localized_source)

			-- icon
			local card_art_component = card_component:SequentialFind(forge_path.config.ui.component_ids.card_art)
			card_art_component:SetImagePath(system_config.ui.icon_paths.card_art)

			-- requirements
			local requirements_holder_component = card_component:SequentialFind(forge_path.config.ui.component_ids.card_requirements_list_holder)
			local requirement_template_component = card_component:SequentialFind(forge_path.config.ui.component_ids.card_requirement_template)
			requirement_template_component:SetVisible(false)
			requirements_holder_component:DestroyChildren()

			local component_name = system_name .. "_card_requirement_".. system_name
			local requirement_component = UIComponent(requirements_holder_component:CreateFromComponent(requirement_template_component:Address(), component_name))
			requirement_component:SetVisible(true)

			local can_be_unlocked = forge_path.can_system_be_unlocked_by_faction(system_config, faction_key)
			local component_state_name = (can_be_unlocked and forge_path.config.ui.component_states.active) or forge_path.config.ui.component_states.inactive

			local requirement_checkbox_component = requirement_component:SequentialFind(forge_path.config.ui.component_ids.card_requirement_checkbox)
			requirement_checkbox_component:SetState(component_state_name)

			local colour_code = forge_path.config.ui.colour_codes[component_state_name]

			local localised_requirement_text, localised_requirement_text_source
			if system_name == "eminence" then
				local current_amount = forge_path.persistent.num_razed_regions[faction_key] or 0
				local required_amount = system_config.num_razed_regions_required_to_unlock
				localised_requirement_text, localised_requirement_text_source = get_localised_random_string_and_source_safe_formatted(system_config.ui.localization_keys.unlock_requirement, colour_code, current_amount, required_amount)
			elseif system_name == "tribes_privileges" then
				local localized_technology_name = common.get_localised_string("technologies_onscreen_name_" .. system_config.technology_key_required_to_unlock)
				localised_requirement_text, localised_requirement_text_source = get_localised_random_string_and_source_safe_formatted(system_config.ui.localization_keys.unlock_requirement, colour_code, localized_technology_name)
			end

			local requirement_text_component = requirement_component:SequentialFind(forge_path.config.ui.component_ids.card_requirement_text)
			requirement_text_component:SetText(localised_requirement_text, localised_requirement_text_source)

			-- description
			local card_flavor_info_localized_text, card_flavor_info_localized_source = get_localised_random_string_and_source(system_config.ui.localization_keys.card_info)
			local card_flavor_info_component = card_component:SequentialFind(forge_path.config.ui.component_ids.card_flavor_info)
			card_flavor_info_component:SetText(card_flavor_info_localized_text, card_flavor_info_localized_source)

			-- button
			local card_read_more_button_component = card_component:SequentialFind(forge_path.config.ui.component_ids.card_read_more_button)
			card_read_more_button_component:SetProperty(forge_path.system_name_property, system_name)
		end,

		display_previous_system_detailed_info_path = function(currently_open_system_name)
			local num_systems = #forge_path.config.systems
			local target_system_index = forge_path.get_system_index(currently_open_system_name) - 1
			if target_system_index == 0 then
				target_system_index = num_systems
			end

			local system_config = forge_path.config.systems[target_system_index]
			forge_path.ui.open_system_detailed_info_path(system_config)
		end,

		display_next_system_detailed_info_path = function(currently_open_system_name)
			local num_systems = #forge_path.config.systems
			local target_system_index = forge_path.get_system_index(currently_open_system_name) + 1
			if target_system_index > num_systems then
				target_system_index = 1
			end

			local system_config = forge_path.config.systems[target_system_index]
			forge_path.ui.open_system_detailed_info_path(system_config)
		end,

		open_system_detailed_info_path = function(system_config)
			local pharaohs_crown_panel_component = core:get_ui_root():SequentialFind(forge_path.config.ui.panel_name)
			if not pharaohs_crown_panel_component then
				output("ERROR @ Pharaoh's Crown panel not found!")
				return
			end

			local system_name = system_config.name

			local forge_path_subpanel_component = pharaohs_crown_panel_component:SequentialFind(forge_path.config.ui.component_ids.panel)
			local path_detailed_info_component = forge_path_subpanel_component:SequentialFind(forge_path.config.ui.component_ids.path_detailed_info)
			path_detailed_info_component:SetVisible(true)
			local path_detailed_info_header_component = path_detailed_info_component:SequentialFind(forge_path.config.ui.component_ids.path_detailed_info_header)

			-- title bar
			local system_title_key = system_config.ui.localization_keys.title
			local title_localized_text, title_localized_source = get_localised_random_string_and_source(system_title_key)
			local path_detailed_info_header_title_component = path_detailed_info_header_component:SequentialFind(forge_path.config.ui.component_ids.path_detailed_info_header_title)
			path_detailed_info_header_title_component:SetText(title_localized_text, title_localized_source)

			-- previous & next buttons
			local local_faction_key = cm:get_local_faction_name(true)
			local path_detailed_info_previous_button_component = path_detailed_info_component:SequentialFind(forge_path.config.ui.component_ids.path_detailed_info_previous_button)
			local path_detailed_info_next_button_component = path_detailed_info_component:SequentialFind(forge_path.config.ui.component_ids.path_detailed_info_next_button)
			path_detailed_info_previous_button_component:SetProperty(forge_path.system_name_property, system_name)
			path_detailed_info_next_button_component:SetProperty(forge_path.system_name_property, system_name)

			local system_index = forge_path.get_system_index(system_name)
			local previous_system_config = forge_path.get_system_by_index(system_index - 1)
			local next_system_config = forge_path.get_system_by_index(system_index + 1)
			path_detailed_info_previous_button_component:SetVisible(previous_system_config and forge_path.is_system_available_to_faction(previous_system_config.name, local_faction_key) or false)
			path_detailed_info_next_button_component:SetVisible(next_system_config and forge_path.is_system_available_to_faction(next_system_config.name, local_faction_key) or false)

			-- detailed flavor text
			local flavor_text_key = system_config.ui.localization_keys.flavor_text
			local flavor_localized_text, flavor_localized_source = get_localised_random_string_and_source(flavor_text_key)
			local path_detailed_info_flavor_info_component = path_detailed_info_component:SequentialFind(forge_path.config.ui.component_ids.path_detailed_info_flavor_info)
			path_detailed_info_flavor_info_component:SetText(flavor_localized_text, flavor_localized_source)

			-- populate 3 cards with their art icons & description texts
			local detailed_info_card_holder_component = forge_path_subpanel_component:SequentialFind(forge_path.config.ui.component_ids.path_detailed_info_card_holder)
			local detailed_info_card_template_component = forge_path_subpanel_component:SequentialFind(forge_path.config.ui.component_ids.path_detailed_info_card_info_template)
			detailed_info_card_template_component:SetVisible(false)
			detailed_info_card_holder_component:DestroyChildren()

			local preview_art_table = system_config.ui.icon_paths.preview_arts
			local preview_texts = system_config.ui.localization_keys.preview_texts
			local num_cards = #preview_texts
			for i = 1, num_cards do
				local component_name = system_name .. "_detailed_info_card_" .. tostring(i)
				local detailed_info_card_component = UIComponent(detailed_info_card_holder_component:CreateFromComponent(detailed_info_card_template_component:Address(), component_name))
				detailed_info_card_component:SetVisible(true)

				local detailed_info_card_art_component = detailed_info_card_component:SequentialFind(forge_path.config.ui.component_ids.path_detailed_info_card_info_art)
				local card_preview_art_icon_path = preview_art_table[i]
				detailed_info_card_art_component:SetImagePath(card_preview_art_icon_path)

				local preview_text_localization_key = preview_texts[i]
				local card_preview_localized_text, card_preview_localized_source = get_localised_random_string_and_source(preview_text_localization_key)
				local detailed_info_card_text_component = detailed_info_card_component:SequentialFind(forge_path.config.ui.component_ids.path_detailed_info_card_info_text)
				detailed_info_card_text_component:SetText(card_preview_localized_text, card_preview_localized_source)
			end

			-- select path button
			local detailed_info_select_path_button_component = forge_path_subpanel_component:SequentialFind(forge_path.config.ui.component_ids.path_detailed_info_select_path_button)

			local can_be_unlocked = forge_path.can_system_be_unlocked_by_faction(system_config, local_faction_key)
			detailed_info_select_path_button_component:SetTooltipText("{{tt:" .. forge_path.config.ui.select_path_button_tooltip_layout_path .. "}}", "", true)
			local component_state_name = (can_be_unlocked and forge_path.config.ui.component_states.active) or forge_path.config.ui.component_states.inactive
			detailed_info_select_path_button_component:SetState(component_state_name)

			detailed_info_select_path_button_component:SetProperty(forge_path.system_name_property, system_name)

			forge_path:set_enable_tooltip_listener(true)
		end,

		-- the function below is called to bypass a rare but harmless visual glitch which may occur with the "empty_card_front" component, when the forge path sub-panels are visible
		set_land_components_interactivity = function(should_make_interactive)
			local pharaohs_crown_panel_component = core:get_ui_root():SequentialFind(forge_path.config.ui.panel_name)
			if not pharaohs_crown_panel_component then
				output("ERROR @ Pharaoh's Crown panel not found!")
				return
			end

			local egypt_land_component = pharaohs_crown_panel_component:SequentialFind(forge_path.config.ui.component_ids.egypt_land)
			local hittite_land_component = pharaohs_crown_panel_component:SequentialFind(forge_path.config.ui.component_ids.hittite_land)
			if egypt_land_component and hittite_land_component then
				egypt_land_component:SetInteractive(should_make_interactive)
				hittite_land_component:SetInteractive(should_make_interactive)
			end
		end,

		arrange_faction_buttons = function(faction_key)
			local ui_root_component = core:get_ui_root()
			if not ui_root_component then
				output("ERROR @ ui is not ready!")
				return
			end


			local any_forge_system_unlocked = false
			for _, system_config in ipairs(forge_path.config.systems) do
				local is_system_unlocked = forge_path.is_system_unlocked_by_faction(system_config.name, faction_key)
				local system_faction_button_component = ui_root_component:SequentialFind(system_config.ui.button_container_component)
				if system_faction_button_component then
					system_faction_button_component:SetVisible(is_system_unlocked)
					if is_system_unlocked then
						any_forge_system_unlocked = true
					end
				end
			end

			-- TODO: come up with a better way for locking features?
			if any_forge_system_unlocked then
				for _, container_id in pairs(forge_path.config.ui.component_ids.features_locked_by_forge_path_containers) do
					local component =  ui_root_component:SequentialFind(container_id)
					if component then
						component:SetVisible(false)
					end
				end
			end
		end,
	},
}


-----------------
--- SERIALIZATION
cm:add_saving_game_callback(
	function(context)
		if not is_table(forge_path.persistent) then
			script_error("forge_path.persistent table is invalid!")
			return
		end

		cm:save_named_value("forge_path", forge_path.persistent, context)
	end
)

cm:add_loading_game_callback(
	function(context)
		if not is_table(forge_path.persistent) then
			script_error("forge_path.persistent table is invalid!")
			return
		end

		forge_path.persistent = cm:load_named_value("forge_path", forge_path.persistent, context)

		if forge_path.persistent.system_unlocks == nil then
			forge_path.persistent.system_unlocks = {}
		end

		if forge_path.persistent.num_razed_regions == nil then
			forge_path.persistent.num_razed_regions = {}
		end
	end
)


-------------
--- LISTENERS
core:add_listener(
	"forge_path_FirstTickAfterWorldCreated",
	"FirstTickAfterWorldCreated",
	true,
	function(context)
		forge_path.initialise_system_states()

		local local_faction_key = cm:get_local_faction_name(true)
		forge_path.ui.arrange_faction_buttons(local_faction_key)
	end,
	false
)

core:add_listener(
	"forge_path_CharacterPerformsSettlementOccupationDecision",
	"CharacterPerformsSettlementOccupationDecision",
	true,
	function(context)
		local occupation_decision = context:occupation_decision_option()
		local garrison_residence = context:garrison_residence()
		if not war_spoils.is_raze_settlement_decision(occupation_decision, garrison_residence) then
			return
		end

		local faction_key = context:character():faction():name()
		if not forge_path.persistent.num_razed_regions[faction_key] then
			forge_path.persistent.num_razed_regions[faction_key] = 0
		end
		forge_path.persistent.num_razed_regions[faction_key] = forge_path.persistent.num_razed_regions[faction_key] + 1
	end,
	true,
	true
)

-- ui listener
core:add_listener(
	"forge_path_PanelOpenedCampaign",
	"PanelOpenedCampaign",
	function(context)
		return context.string == forge_path.config.ui.panel_name
	end,
	function(context)
		local pharaohs_crown_panel_component = core:get_ui_root():SequentialFind(forge_path.config.ui.panel_name)
		if not pharaohs_crown_panel_component then
			output("ERROR @ Pharaoh's Crown panel not found!")
			return
		end

		local local_faction_key = cm:get_local_faction_name(true)
		local should_enable_notify_component = forge_path.get_num_unlockable_systems(local_faction_key)
		if should_enable_notify_component > 0 then
			pharaohs_crown_panel_component:SequentialFind(forge_path.config.ui.component_ids.info_card):SequentialFind(forge_path.config.ui.component_ids.info_card_notification):SetVisible(true)
		end
	end,
	true,
	true
)

-- ui listener
core:add_listener(
	"forge_path_PanelClosedCampaign",
	"PanelClosedCampaign",
	function(context)
		return context.string == forge_path.config.ui.panel_name
	end,
	function(context)
		forge_path:set_enable_tooltip_listener(false)
	end,
	true,
	true
)

-- ui listener, reponding to TriggerLocalContextEvent()/CONTEXT_TRIGGER_EVENT
core:add_listener(
	"forge_path_ContextTriggerEvent",
	"ContextTriggerEvent",
	function(context)
		return string.find(context.string, "ForgePathContextEvent")
	end,
	function(context)
		local split_tokens = string.split(context.string, ":")
		local event_action = split_tokens[2]

		local get_attached_component = function()
			return UIComponent(context.component)
		end

		if event_action == "ShowAvailableSystemCards" then
			forge_path.ui.populate_info_panel_cards()
		elseif event_action == "PreviousButton" then
			local component = get_attached_component()
			local currently_open_system_name = component:GetProperty(forge_path.system_name_property)
			if forge_path.is_valid_system(currently_open_system_name) then
				forge_path.ui.display_previous_system_detailed_info_path(currently_open_system_name)
			end
		elseif event_action == "NextButton" then
			local component = get_attached_component()
			local currently_open_system_name = component:GetProperty(forge_path.system_name_property)
			if forge_path.is_valid_system(currently_open_system_name) then
				forge_path.ui.display_next_system_detailed_info_path(currently_open_system_name)
			end
		elseif event_action == "PathSelectionBackButton" then
			forge_path.ui.set_land_components_interactivity(true)
		elseif event_action == "SelectPath" then
			local pharaohs_crown_panel_name = forge_path.config.ui.panel_name
			local pharaohs_crown_panel_component = core:get_ui_root():SequentialFind(pharaohs_crown_panel_name)
			local button_component = pharaohs_crown_panel_component:SequentialFind(forge_path.config.ui.component_ids.panel):SequentialFind(forge_path.config.ui.component_ids.path_detailed_info_select_path_button)
			local system_name = button_component:GetProperty(forge_path.system_name_property)

			local local_faction_cqi = commands.get_local_faction():command_queue_index()
			local param_str = "ForgePathContextEvent:SelectPath:" .. system_name

			CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, param_str)
		elseif event_action == "ReadMore" then
			local component = get_attached_component()
			local system_name = component:GetProperty(forge_path.system_name_property)
			local system_config = forge_path.get_system_config_by_name(system_name)
			if system_config then
				forge_path.ui.open_system_detailed_info_path(system_config)
			end
		end
	end,
	true
)

-- ui listener, reponding to TriggerScriptEvent()/UI_TRIGGER_SCRIPT_EVENT
core:add_listener(
	"forge_path_UITriggerScriptEvent",
	"UITriggerScriptEvent",
	function(context)
		return string.find(context:trigger(), "ForgePathContextEvent")
	end,
	function(context)
		local event_split = context:trigger():split(":")
		local event_action = event_split[2]

		if event_action == "SelectPath" then
			local faction = cm:model():faction_for_command_queue_index(context:faction_cqi())
			local faction_key = faction:name()

			local pharaohs_crown_panel_name = forge_path.config.ui.panel_name
			local system_name = event_split[3]
			local is_system_unlocked = forge_path.unlock_system_for_faction(system_name, faction_key)

			if faction_key == cm:get_local_faction_name(true) and is_system_unlocked then
				-- close down the old panel and open up the new unlocked one right away
				common.toggle_fm_panel(pharaohs_crown_panel_name)

				forge_path.ui.arrange_faction_buttons(cm:get_local_faction_name(true))

				-- Properly disable the crown button, as forge_path.ui.arrange_faction_buttons() only hides its container
				-- The button needs to be disabled, so that its shortcut doesn't trigger
				cm:override_ui("disable_crown", true);

				local system_config = forge_path.get_system_config_by_name(system_name)
				common.toggle_fm_panel(system_config.panel_name)
			end
		end
	end,
	true
)

function forge_path:set_enable_tooltip_listener(should_enable)
	if should_enable then
		-- ui listener
		-- setting up tooltip for select_path button[no need for ScriptPopulatedTooltip anymore (which doesn't support nested tooltips)]
		core:add_listener(
			"forge_path_ComponentOnTooltipShow",
			"ComponentOnTooltipShow",
			true,
			function(context)
				local component = UIComponent(context.component)
				if component:Id() ~= forge_path.config.ui.component_ids.path_detailed_info_select_path_button then
					return
				end

				local system_name = component:GetProperty(forge_path.system_name_property)
				local system_config = forge_path.get_system_config_by_name(system_name)
				if not system_config then
					return
				end

				local tooltip_parent_component = UIComponent(context:tooltip_object())
				tooltip_parent_component:SetVisible(true)

				local localization_argument
				if system_name == "eminence" then
					localization_argument = system_config.num_razed_regions_required_to_unlock
				elseif system_name == "tribes_privileges" then
					localization_argument = common.get_localised_string("technologies_onscreen_name_" .. system_config.technology_key_required_to_unlock)
				end

				local tooltip_title_component = tooltip_parent_component:SequentialFind(forge_path.config.ui.component_ids.select_path_button_tooltip_title)
				local tooltip_title_localized_text, tooltip_title_localized_source = get_localised_random_string_and_source(system_config.ui.localization_keys.select_path_tooltip_title)
				tooltip_title_component:SetText(tooltip_title_localized_text, tooltip_title_localized_source)

				local can_be_unlocked = forge_path.can_system_be_unlocked_by_faction(system_config, cm:get_local_faction_name(true))

				local tooltip_description_component = tooltip_parent_component:SequentialFind(can_be_unlocked and forge_path.config.ui.component_ids.select_path_button_tooltip_action_text or forge_path.config.ui.component_ids.select_path_button_tooltip_warning_text)
				local text_key = (can_be_unlocked and system_config.ui.localization_keys.tooltip_unlock) or system_config.ui.localization_keys.tooltip_cannot_unlock
				local tooltip_description_localized_text, tooltip_description_localized_source = get_localised_random_string_and_source_safe_formatted(text_key, localization_argument)
				tooltip_description_component:SetVisible(true)
				tooltip_description_component:SetText(tooltip_description_localized_text, tooltip_description_localized_source)
			end,
			true,
			false
		)
	else
		core:remove_listener("forge_path_ComponentOnTooltipShow")
	end
end