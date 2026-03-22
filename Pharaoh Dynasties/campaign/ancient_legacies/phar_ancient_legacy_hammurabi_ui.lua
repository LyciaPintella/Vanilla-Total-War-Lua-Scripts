out("Loading phar_ancient_legacy_hammurabi_ui.lua")

ancient_legacy_hammurabi_ui = 
{
	config = 
	{
		panel_name = "map_legacy_hammurabi",

		component_ids = 
		{
			legacy_panel_button = "button_fm_phar_hammurabi",
			
			main_screen = {
				container = "main_page_holder",
				law_list_container = "law_holder",
				law_list = "law_list",
				law_list_slider = "vslider",
				justice_points_container = "points_holder",
				justice_points_text_value = "dy_value",
				law_browsing_mode_buttons_container = "default_view_buttons",
				law_removing_mode_buttons_container = "remove_view_buttons",
				divine_law_making_mode_buttons_container = "divine_law_view_buttons",
				button_open_law_creator = "button_create_law",
				button_remove_law_being_researched = "button_cancel_researched_law",
				button_switch_to_law_removing_mode = "button_remove_law",
				button_confirm_laws_removing = "button_confirm_remove",
				button_exit_laws_removing = "button_cancel_remove",
				laws_removing_available_count_text = "dy_counter",
				button_switch_to_divine_making_mode = "button_divine_law",
				button_confirm_divine_making = "button_confirm_divine",
				button_exit_divine_making = "button_cancel_divine",
				divine_making_cost_text = "cost",

				button_civil_category = "civilian_cat_button",
				button_military_category = "military_cat_button",
				category_level_text = "dy_rank",
				category_level_up_container = "rank_available",
				category_content_container = "category_content_container",
				category_level_up_cost_container = "rank_cost",
				category_level_up_cost_text = "dy_value",
				button_category_level_up = "button_level_up",
				sub_categories_buttons_container = "tab_buttons",
				effect_types_container = "effects_list",
				effect_types_instances_container = "list_box",

				button_action_research_any_technology = "button_target_decree",

				active_law_slot = {
					category_icon = "category_icon",
					title_text = "title",
					effects_container = "effects_container",
					illustration = "illustration",
					subcategory_icons_container = "law_symbols",
					content_container = "default_view",
				},

				empty_law_slot = {
					locked_container = "locked",
					available_container = "available",
					in_progress_container = "in_progress",
					in_progress_turns_text = "dy_turns_value",
				},
			},

			-- component that contains everything about the law creating process, hidden by default
			law_creator_screen = {
				container = "law_creation_container",
				-- category selector components
				category_selector = {
					container = "category_selection",
					button_back = "button_back",
					button_select_civil = "button_select_civilian",
					button_select_military = "button_select_military",
				},
				effects_selector = {
					container = "law_editor_holder",
					button_back = "button_editor_back",
					category_name = "dy_category",
					category_icon = "dy_icon",
					category_level = "dy_rank",
					filled_in_effect_slots_text = "dy_counter",
					law_name_input_field = "law_name_input",
					button_law_name_clear = "button_clear_name",
					law_description_input_field = "flavour_text_input",
					button_law_description_clear = "button_clear_description",
					law_cost_container = "law_cost_container",
					law_cost_text = "dy_cost",
					law_turn_cost_text = "dy_turn_cost",
					button_create_law = "button_establish_law",
					button_generate_random_effect = "button_randomize",
					effect_slots_container = "effect_slots_container",
					effect_slot_effect_container = "effect_components",
					effect_slot_empty_text = "empty_text",
					effect_slot_bonus_text = "dy_effect",
					effect_slot_scope_text = "dy_scope",
					effect_slot_designator_text = "dy_designator",
					effect_slot_designator_colon = "dy_colon_separator",
					effect_slot_condition_text = "dy_condition",
					effect_slot_value_text = "dy_value",
					effect_slot_cuneiform_icon = "dy_law_symbol",
					effect_slot_cost_text = "dy_cost",
					effect_slot_button_clear = "button_clear",
					sub_categories_container = "tab_buttons",
					sub_categories_name_text = "dy_subcategory_name",
					sub_categories_flavour_text = "dy_flavour_tx",
					effect_types_container = "effects_list_holder",
					effect_types_instances_container = "list_instances",
					parameters_container = "properties_list_holder",
					parameters_middle_container = "properties_list",
					parameters_instances_container = "list_box",
					parameters_warning_text = "effect_prompt_text",
					parameter_name_text = "dy_property_name",
					parameter_locked_container = "locked_effect_indicator",
					parameter_locked_requirement_text = "dy_rank_value",
					values_container = "values_list_holder",
					values_instances_container = "list_instances",
					values_no_values_text = "no_values_tx",
					value_amount_text = "dy_value",
					value_cost = "label_cost",
					value_locked_requirement_text = "value_locked",
				},
			},

			common = {
				effect_type_icon = "dy_effect_icon",
				effect_type_name_text = "dy_effect_name",
				effect_type_locked_container = "locked_effect_indicator",
				effect_type_locked_requirement_text = "dy_rank_value",
			},
		},

		template_ids = 
		{
			main_screen = {
				active_law = "law_card_template",
				active_law_effect = "template_effect_row",
				empty_law = "slot_template",
				sub_category_button = "subcategory_button_template",
				effect_type = "template_effect_entry",
			},

			law_creator_screen = {
				effect_slot = "template_effect_slot",
				button_sub_category = "subcategory_button_template",
				effect_type = "template_effect_entry",
				parameter = "template_property_entry",
				value = "template_value_button",
			},
		},

		id_prefixes = 
		{
			main_screen = {
				active_law_slot = {
					subcategory_icon = "slot_"
				},
			},
			law_creator_screen = {
				effect_slot = "slot_"
			},
		},

		cco_ids = {
			main_screen = {
				remove_law_button_tooltip = "hammurabi_remove_law_button_tooltip",
				law_in_progress_slot_tooltip = "hammurabi_law_in_progress_slot_tooltip",
			},

			technology_panel_instant_research_technology_button_tooltip = "hammurabi_technology_panel_instant_research_technology_button_tooltip"
		},

		cco_ids_prefixes =
		{
			main_screen = {
				active_law_slot = {
					tooltip = "hammurabi_law_filled_slot_tooltip_",
				},
			},
		},

		texts = {
			main_screen = {
				confirm_box_remove_law_being_researched = {
					title = "ui_text_replacements_localised_text_phar_map_hammurabi_remove_law_being_researched_confirm_box_title",
					description = "ui_text_replacements_localised_text_phar_map_hammurabi_remove_law_being_researched_confirm_box_description"
				},

				remove_law_tooltip = {
					title = "ui_text_replacements_localised_text_phar_map_hammurabi_remove_law_tooltip_title",
					type = "ui_text_replacements_localised_text_phar_map_hammurabi_remove_law_tooltip_type",
					description = "ui_text_replacements_localised_text_phar_map_hammurabi_remove_law_tooltip_description",
					flavour = "ui_text_replacements_localised_text_phar_map_hammurabi_remove_law_tooltip_flavour",
				},

				action_research_any_technology_tooltip = {
					title = "ui_text_replacements_localised_text_phar_map_hammurabi_action_research_any_technology_tooltip_title",
					type = "ui_text_replacements_localised_text_phar_map_hammurabi_action_research_any_technology_tooltip_type",
					description = "ui_text_replacements_localised_text_phar_map_hammurabi_action_research_any_technology_tooltip_description",
					flavour = "ui_text_replacements_localised_text_phar_map_hammurabi_action_research_any_technology_tooltip_flavour",
				},

				law_tooltip = {
					flavour = "ui_text_replacements_localised_text_phar_map_hammurabi_law_tooltip_flavour",
					in_progress = "ui_text_replacements_localised_text_phar_map_hammurabi_law_tooltip_in_progress",
					make_divine_law = {
						action = "random_localisation_strings_string_phar_map_al_hammurabi_divine_flow_select_tooltip",
						warning = {
							law_being_created = "random_localisation_strings_string_phar_map_al_hammurabi_divine_flow_unable_in_progress_tooltip",
							law_already_divine = "random_localisation_strings_string_phar_map_al_hammurabi_divine_flow_unable_already_divine_tooltip",
						},
					},
					remove_law = {
						action = "random_localisation_strings_string_phar_map_al_hammurabi_remove_flow_select_tooltip",
						warning_law_is_divine = "random_localisation_strings_string_phar_map_al_hammurabi_remove_flow_unable_divine",
					},
				},

				confirm_box_remove_law = {
					title = "ui_text_replacements_localised_text_phar_map_al_hammurabi_remove_law_confirm_box_title",
					description = "ui_text_replacements_localised_text_phar_map_al_hammurabi_remove_law_confirm_box_description"
				},

				confirm_box_divine_law_created = {
					title = "ui_text_replacements_localised_text_phar_map_al_hammurabi_divine_law_confirm_box_title",
					description = "ui_text_replacements_localised_text_phar_map_al_hammurabi_divine_law_confirm_box_description"
				},
			},

			law_creator_screen = {
				effect_slot_cost_tooltip = "ui_text_replacements_localised_text_phar_map_al_hammurabi_cost_adjusted_tooltip_desc",
			},
		},

		min_slots = 9,
		slots_per_row = 3,
	},

	ui_instance = 
	{
		--[[
			faction_key = "",
			legacy_object = nil,
			panel_component,
		--]]
	},

	on_panel_opened = function(self, legacy_object, faction_key, panel_component)
		self.ui_instance.faction_key = faction_key
		self.ui_instance.legacy_object = legacy_object
		self.ui_instance.panel_component = panel_component

		self:cache_templates()

		self:add_panel_listeners()
		self:initialise_panel()

		legacy_object.persistent.ui.show_newly_activated_law_notification = false
		self:update_hud_button(self.ui_instance.legacy_object)
	end,

	on_panel_closed = function(self)
		-- we don't want to spam with event listeners so we listen for ui events only when the panel is opened
		self:remove_panel_listeners()

		for _, template_component in pairs(self.ui_instance.template_components) do
			template_component:Destroy()
		end

		self.ui_instance = {}
	end,

	cache_templates = function(self)
		self.ui_instance.template_components = {}

		local law_list_component = self.ui_instance.panel_component:SequentialFind(self.config.component_ids.main_screen.law_list)
		self.ui_instance.template_components.active_law = law_list_component:SequentialFind(self.config.template_ids.main_screen.active_law)
		self.ui_instance.template_components.active_law:DivorceFromParent()

		self.ui_instance.template_components.active_law_effect_row = self.ui_instance.template_components.active_law:SequentialFind(self.config.template_ids.main_screen.active_law_effect)
		self.ui_instance.template_components.active_law_effect_row:DivorceFromParent()

		-- NOTE: this template also covers the case where we have a law that is currently being researched
		self.ui_instance.template_components.empty_law = law_list_component:SequentialFind(self.config.template_ids.main_screen.empty_law)
		self.ui_instance.template_components.empty_law:DivorceFromParent()

		local category_content_container = self.ui_instance.panel_component:SequentialFind(self.config.component_ids.main_screen.category_content_container)
		self.ui_instance.template_components.sub_category_button = category_content_container:SequentialFind(self.config.template_ids.main_screen.sub_category_button)
		self.ui_instance.template_components.sub_category_button:DivorceFromParent()

		self.ui_instance.template_components.effect_type = category_content_container:SequentialFind(self.config.template_ids.main_screen.effect_type)
		self.ui_instance.template_components.effect_type:DivorceFromParent()

		local effects_selector_container = self.ui_instance.panel_component:SequentialFind(self.config.component_ids.law_creator_screen.effects_selector.container)
		self.ui_instance.template_components.law_creator_effect_slot = effects_selector_container:SequentialFind(self.config.template_ids.law_creator_screen.effect_slot)
		self.ui_instance.template_components.law_creator_effect_slot:DivorceFromParent()

		self.ui_instance.template_components.law_creator_button_sub_category = effects_selector_container:SequentialFind(self.config.template_ids.law_creator_screen.button_sub_category)
		self.ui_instance.template_components.law_creator_button_sub_category:DivorceFromParent()

		local effect_types_container_component = effects_selector_container:SequentialFind(self.config.component_ids.law_creator_screen.effects_selector.effect_types_container)
		self.ui_instance.template_components.law_creator_effect_type = effect_types_container_component:SequentialFind(self.config.template_ids.law_creator_screen.effect_type)
		self.ui_instance.template_components.law_creator_effect_type:DivorceFromParent()

		local parameters_container_component = effects_selector_container:SequentialFind(self.config.component_ids.law_creator_screen.effects_selector.parameters_container)
		self.ui_instance.template_components.law_creator_parameter = parameters_container_component:SequentialFind(self.config.template_ids.law_creator_screen.parameter)
		self.ui_instance.template_components.law_creator_parameter:DivorceFromParent()

		local values_container_component = effects_selector_container:SequentialFind(self.config.component_ids.law_creator_screen.effects_selector.values_container)
		self.ui_instance.template_components.law_creator_value = values_container_component:SequentialFind(self.config.template_ids.law_creator_screen.value)
		self.ui_instance.template_components.law_creator_value:DivorceFromParent()
	end,

	initialise_panel = function(self)
		self:open_main_screen()
	end,

	open_main_screen = function(self)
		self:set_ui_component_visibility(self.config.component_ids.main_screen.container, true)

		self:initialise_slots_data()
		self:setup_slots()

		local slider = self.ui_instance.panel_component:SequentialFind(self.config.component_ids.main_screen.law_list_slider)
		slider:InterfaceFunction("set_value", slider:InterfaceFunction("get_max_value"))

		self:switch_to_law_browsing_mode()
		self:refresh_main_screen()
	end,

	close_main_screen = function(self)
		self:set_ui_component_visibility(self.config.component_ids.main_screen.container, false)
	end,

	refresh_main_screen = function(self, refresh_slots_data)
		self:setup_justice_points_container()
		self:setup_categories_buttons()
		self:setup_mode_components()

		if refresh_slots_data then
			local slider = self.ui_instance.panel_component:SequentialFind(self.config.component_ids.main_screen.law_list_slider)
			local slider_value = slider:InterfaceFunction("get_value")
			self:initialise_slots_data()
			self:setup_slots()

			slider:InterfaceFunction("set_value", slider_value)
		else
			self:setup_slots()
		end

		if self.ui_instance.category_selection then
			self:setup_category_container(self.ui_instance.category_selection.category)
		end
	end,

	switch_to_law_browsing_mode = function(self)
		self.ui_instance.law_removing = nil
		self.ui_instance.divine_making = nil

		self:setup_slots()
		self:setup_mode_components()
	end,

	switch_to_law_removing_mode = function(self)
		self.ui_instance.law_removing = { selected_laws = {} }
		self.ui_instance.divine_making = nil

		-- we need to refresh the slots UI
		self:setup_slots()
		self:setup_mode_components()
	end,

	switch_to_divine_making_mode = function(self)
		self.ui_instance.divine_making = { selected_laws = {} }
		self.ui_instance.law_removing = nil

		-- we need to refresh the slots UI
		self:setup_slots()
		self:setup_mode_components()
	end,

	setup_mode_components = function(self)
		local legacy_object = self.ui_instance.legacy_object
		local panel_component = self.ui_instance.panel_component
		local main_screen_config = self.config.component_ids.main_screen

		local is_divine_making_mode = to_bool(self.ui_instance.divine_making)
		local is_law_removing_mode = to_bool(self.ui_instance.law_removing)
		local law_browsing_mode_buttons_container = panel_component:SequentialFind(main_screen_config.law_browsing_mode_buttons_container)
		law_browsing_mode_buttons_container:SetVisible(not (is_divine_making_mode or is_law_removing_mode))

		local law_removing_mode_buttons_container = panel_component:SequentialFind(main_screen_config.law_removing_mode_buttons_container)
		law_removing_mode_buttons_container:SetVisible(is_law_removing_mode)

		local divine_law_making_mode_buttons_container = panel_component:SequentialFind(main_screen_config.divine_law_making_mode_buttons_container)
		divine_law_making_mode_buttons_container:SetVisible(is_divine_making_mode)

		if is_divine_making_mode then
			local selected_laws = self.ui_instance.divine_making.selected_laws
			local total_justice_cost = 0
			for _, law_id in ipairs(selected_laws) do
				local justice_cost = legacy_object:calculate_justice_cost_for_divine_law_making(law_id)
				total_justice_cost = total_justice_cost + justice_cost
			end

			local justice_points = self.ui_instance.legacy_object:get_justice_points()
			local can_afford = total_justice_cost <= justice_points
			local button_confirm_divine_making = divine_law_making_mode_buttons_container:SequentialFind(main_screen_config.button_confirm_divine_making)
			button_confirm_divine_making:SetState((can_afford and #selected_laws > 0) and "active" or "inactive")
			
			local cost_text = divine_law_making_mode_buttons_container:SequentialFind(main_screen_config.divine_making_cost_text)
			cost_text:SetText(total_justice_cost)
			cost_text:SetState(can_afford and "default" or "insufficient")
		elseif is_law_removing_mode then
			local law_removals_count = legacy_object:get_law_removals_count()
			local button_confirm_laws_removing = law_removing_mode_buttons_container:SequentialFind(main_screen_config.button_confirm_laws_removing)
			button_confirm_laws_removing:SetState((#self.ui_instance.law_removing.selected_laws > 0 and #self.ui_instance.law_removing.selected_laws <= law_removals_count) and "active" or "inactive")

			local laws_removing_available_count_text = law_removing_mode_buttons_container:SequentialFind(main_screen_config.laws_removing_available_count_text)
			laws_removing_available_count_text:SetText(#self.ui_instance.law_removing.selected_laws .. " / " .. law_removals_count)
		else
			local button_open_law_creator = law_browsing_mode_buttons_container:SequentialFind(main_screen_config.button_open_law_creator)
			button_open_law_creator:SetState(legacy_object:get_active_laws_count() < legacy_object.config.max_laws_count and "active" or "inactive")

			local button_remove_law_being_researched = law_browsing_mode_buttons_container:SequentialFind(main_screen_config.button_remove_law_being_researched)
			if legacy_object:is_researching_law() then
				button_open_law_creator:SetVisible(false)
				button_remove_law_being_researched:SetVisible(true)
			else
				button_open_law_creator:SetVisible(true)
				button_remove_law_being_researched:SetVisible(false)
			end

			local law_removals_count = legacy_object:get_law_removals_count()
			local button_switch_to_law_removing_mode = law_browsing_mode_buttons_container:SequentialFind(main_screen_config.button_switch_to_law_removing_mode)
			button_switch_to_law_removing_mode:SetState(law_removals_count > 0 and "active" or "inactive")

			local cco_remove_law_tooltip_id = self.config.cco_ids.main_screen.remove_law_button_tooltip
			common.set_context_value(cco_remove_law_tooltip_id, {
				Title = common.get_localised_string(self.config.texts.main_screen.remove_law_tooltip.title),
				Type = common.get_localised_string(self.config.texts.main_screen.remove_law_tooltip.type),
				Description = common.get_localised_string(self.config.texts.main_screen.remove_law_tooltip.description),
				Flavour = common.get_localised_string(self.config.texts.main_screen.remove_law_tooltip.flavour),
				RemovalsCountText = law_removals_count
			})

			button_switch_to_law_removing_mode:SetProperty("script_id", cco_remove_law_tooltip_id)
		end
	end,

	initialise_slots_data = function(self)

		-- clear previously created components
		if self.ui_instance.slots_data then
			for _, slot_data in ipairs(self.ui_instance.slots_data) do
				if slot_data.active_law_ui_component then
					slot_data.active_law_ui_component:Destroy()
					slot_data.active_law_ui_component = nil
				end

				if slot_data.empty_law_ui_component then
					slot_data.empty_law_ui_component:Destroy()
					slot_data.empty_law_ui_component = nil
				end
			end
		end

		self.ui_instance.slots_data = {}
		local legacy_object = self.ui_instance.legacy_object
		local active_laws_count = legacy_object:get_active_laws_count()

		local has_created_data_for_law_being_researched = false
		local current_max_laws = math.max(legacy_object.config.max_laws_count, active_laws_count) -- in case config is changed and we can have less max laws
		local target_slots_data_count = active_laws_count
		-- add slot data for "available" slot
		if active_laws_count < legacy_object.config.max_laws_count then
			target_slots_data_count = target_slots_data_count + 1
		end

		-- whenever we fill all rows we want the next row to be filled entirely with slots
		if target_slots_data_count > self.config.min_slots and (target_slots_data_count % self.config.slots_per_row) > 0 then
			local fill_row_count = self.config.slots_per_row - (target_slots_data_count % self.config.slots_per_row)
			target_slots_data_count = target_slots_data_count + fill_row_count
		end

		local visible_slots = math.clamp(target_slots_data_count, self.config.min_slots, current_max_laws)
		for slot_index = 1, visible_slots do
			local law_id = -1
			local active_law = legacy_object.persistent.active_laws[slot_index]
			if active_law then
				law_id = active_law.id
			elseif not has_created_data_for_law_being_researched and legacy_object:is_researching_law() then
				law_id = legacy_object:get_id_of_law_being_researched()
				has_created_data_for_law_being_researched = true
			end

			table.insert(self.ui_instance.slots_data, { law_id = law_id, index = slot_index, active_law_ui_component = nil, empty_law_ui_component = nil })
		end
	end,

	setup_slots = function(self)

		local slider = self.ui_instance.panel_component:SequentialFind(self.config.component_ids.main_screen.law_list_slider)
		local slider_value = slider:InterfaceFunction("get_value")

		local should_sort = false
		local law_list_component = self.ui_instance.panel_component:SequentialFind(self.config.component_ids.main_screen.law_list)
		for slot_index, slot_data in ipairs(self.ui_instance.slots_data) do
			local active_law = self.ui_instance.legacy_object:get_active_law(slot_data.law_id)

			local current_ui_component = slot_data.active_law_ui_component or slot_data.empty_law_ui_component
			local create_new_component = true
			if current_ui_component then
				local current_is_active_law_ui_component = slot_data.active_law_ui_component ~= nil
				create_new_component = current_is_active_law_ui_component ~= to_bool(active_law)

				if create_new_component then
					current_ui_component:Destroy()
					slot_data.active_law_ui_component = nil
					slot_data.empty_law_ui_component = nil
				end
			end

			if create_new_component then
				should_sort = true

				local use_active_law_component = to_bool(active_law)
				local ui_component_template = use_active_law_component and self.ui_instance.template_components.active_law or self.ui_instance.template_components.empty_law
				local ui_component = UIComponent(law_list_component:CreateFromComponent(ui_component_template:Address(), law_list_component:ChildCount()))
				ui_component:SetProperty("law_id", active_law and slot_data.law_id or -1)
				ui_component:SetProperty("ui_order", slot_index)

				if use_active_law_component then
					slot_data.active_law_ui_component = ui_component
				else
					slot_data.empty_law_ui_component = ui_component
				end
			end
		end

		if should_sort then
			law_list_component:SortChildrenByProperties({"ui_order", true})

			-- sorting the children will reset the scroll so we need to set it to where it was
			slider:InterfaceFunction("set_value", slider_value)
		end

		for _, slot_data in ipairs(self.ui_instance.slots_data) do
			if slot_data.active_law_ui_component then
				self:setup_active_law_slot(slot_data, slot_data.active_law_ui_component)
			elseif slot_data.empty_law_ui_component then
				self:setup_empty_law_slot(slot_data, slot_data.empty_law_ui_component)
			end
		end
	end,

	select_law = function(self, law_id)
		if not (self.ui_instance.divine_making or self.ui_instance.law_removing) then
			return
		end

		-- both law removing and divine making can't change a divine law
		local active_law = self.ui_instance.legacy_object:get_active_law(law_id)
		if active_law.is_divine then
			return
		end

		local selected_laws = self.ui_instance.divine_making and self.ui_instance.divine_making.selected_laws or self.ui_instance.law_removing.selected_laws
		if table_find(selected_laws, law_id) then
			table_erase(selected_laws, law_id)
		else
			table.insert(selected_laws, law_id)
		end

		self:setup_slots()
		self:setup_mode_components()
	end,

	setup_active_law_slot = function(self, slot_data, ui_component)
		local legacy_object = self.ui_instance.legacy_object
		local active_law = legacy_object:get_active_law(slot_data.law_id)
		local category_config = legacy_object.utility.get_category_config(active_law.category_id)
		
		local is_divine_law = to_bool(active_law.is_divine)
		local component_state = is_divine_law and "divine_default" or "default"
		local is_selected_for_divine_making = self.ui_instance.divine_making and table_contains(self.ui_instance.divine_making.selected_laws, slot_data.law_id)
		if not is_divine_law then
			if self.ui_instance.divine_making then
				if is_selected_for_divine_making then
					component_state = ui_component:IsMouseOverChildren() and "divine_flow_selected_hover" or "divine_flow_selected"
				else
					component_state = ui_component:IsMouseOverChildren() and "divine_flow_hover" or "divine_flow_active"
				end
			elseif self.ui_instance.law_removing then
				local is_added_for_law_removing = table_contains(self.ui_instance.law_removing.selected_laws, slot_data.law_id)
				if is_added_for_law_removing then
					component_state = ui_component:IsMouseOverChildren() and "destroy_selected_hover" or "destroy_selected"
				else
					component_state = ui_component:IsMouseOverChildren() and "destroy_hover" or "destroy_active"
				end
			end
		end

		ui_component:SetState(component_state)

		local illustration_component = ui_component:SequentialFind(self.config.component_ids.main_screen.active_law_slot.illustration)
		illustration_component:SetState(category_config.ui.illustration_state_name)

		local subcategory_icons_container_component = ui_component:SequentialFind(self.config.component_ids.main_screen.active_law_slot.subcategory_icons_container)

		local effects_plain_data = active_law.effects_plain_data
		for i = 1, legacy_object.config.max_effects_per_law do
			local subcategory_icon_component = subcategory_icons_container_component:SequentialFind(self.config.id_prefixes.main_screen.active_law_slot.subcategory_icon .. i)
			local effect_plain_data = effects_plain_data[i]
			if effect_plain_data then
				subcategory_icon_component:SetVisible(true)

				local sub_category_config = legacy_object.utility.get_effect_type_config(effect_plain_data.effect_type).sub_category
				subcategory_icon_component:SetState(active_law.is_divine and "divine_law" or "default_law")
				subcategory_icon_component:SetImagePath(sub_category_config.ui.cuneiform_icon_path)
			else
				subcategory_icon_component:SetVisible(false)
			end
		end

		local category_icon_component = ui_component:SequentialFind(self.config.component_ids.main_screen.active_law_slot.category_icon)
		category_icon_component:SetState(category_config.ui.icon_state_name)

		local title_component = ui_component:SequentialFind(self.config.component_ids.main_screen.active_law_slot.title_text)
		local law_name = self:get_law_name(active_law)
		title_component:SetText(law_name)

		local effects_container_component = ui_component:SequentialFind(self.config.component_ids.main_screen.active_law_slot.effects_container)
		effects_container_component:DestroyChildren()

		legacy_object.utility.iterate_effects_plain_data(active_law.effects_plain_data, function(effect_full_config, effect_plain_data)
			local effect_row = UIComponent(effects_container_component:CreateFromComponent(self.ui_instance.template_components.active_law_effect_row:Address(), effects_container_component:ChildCount()))
			local parameter_config = effect_full_config.parameter_config
			local value_config = effect_full_config.value_config
			local bonus_value_cco = cco("CcoEffectRecord", parameter_config.effect_key):Call("CampaignEffects(\"" .. parameter_config.scope_key .. "\"," .. value_config.amount .. ", PlayersFaction.FactionRecordContext).EffectsAlt.FirstContext.Groups.FirstContext.Bonuses.FirstContext")

			local effect_type_icon_path = bonus_value_cco:Call("IconPath")
			if effect_type_icon_path then
				local effect_icon_component = effect_row:SequentialFind("icon")
				effect_icon_component:SetImagePath(effect_type_icon_path)
			end

			local name = bonus_value_cco:Call("Name") or ""
			local effect_name_component = effect_row:SequentialFind("effect_name")
			effect_name_component:SetText(name)

			local value_component = effect_row:SequentialFind("effect_value")
			local show_value = to_bool(bonus_value_cco:Call("ShowValue"))
			value_component:SetVisible(show_value)
			local formatted_value = bonus_value_cco:Call("Value") or ""
			local is_positive = to_bool(bonus_value_cco:Call("IsPositive"))
			value_component:SetState(is_positive and "positive" or "negative")
			value_component:SetText(formatted_value)

			if is_selected_for_divine_making then
				local next_best_value = legacy_object.utility.find_next_best_value(effect_plain_data.value, parameter_config)

				if show_value and next_best_value then
					local bonus_value_next_cco = cco("CcoEffectRecord", parameter_config.effect_key):Call("CampaignEffects(\"" .. parameter_config.scope_key .. "\"," .. next_best_value.amount .. ", PlayersFaction.FactionRecordContext).EffectsAlt.FirstContext.Groups.FirstContext.Bonuses.FirstContext")
					local formatted_next_value = bonus_value_next_cco:Call("Value") or ""
					local next_value_component = effect_row:SequentialFind("dy_projection")

					-- whenever we make it divine we improve it and can turn positive from a negative, so that's why we shouldn't reuse variable is_positive
					local is_next_value_positive = to_bool(bonus_value_next_cco:Call("IsPositive"))
					next_value_component:SetState(is_next_value_positive and "positive" or "negative")
					next_value_component:SetText(formatted_next_value)
					next_value_component:SetVisible(true)
				end
			end
		end)

		local action = ""
		local warning = ""
		if self.ui_instance.divine_making then
			action = (not is_divine_law) and self.config.texts.main_screen.law_tooltip.make_divine_law.action or ""
			warning = is_divine_law and self.config.texts.main_screen.law_tooltip.make_divine_law.warning.law_already_divine or ""
		elseif self.ui_instance.law_removing then
			action = (not is_divine_law) and self.config.texts.main_screen.law_tooltip.remove_law.action or ""
			warning = is_divine_law and self.config.texts.main_screen.law_tooltip.remove_law.warning_law_is_divine or ""
		end

		local law_description = self:get_law_description(active_law)
		local tooltip_cco_id = self.config.cco_ids_prefixes.main_screen.active_law_slot.tooltip .. active_law.id
		self:create_law_tooltip_cco(tooltip_cco_id, slot_data.law_id, law_name, law_description, category_config, "", active_law.effect_bundle_key, false, action, warning)
		ui_component:SetProperty("script_id", tooltip_cco_id)
	end,

	setup_empty_law_slot = function(self, slot_data, ui_component)
		local legacy_object = self.ui_instance.legacy_object

		local locked_container_component = ui_component:SequentialFind(self.config.component_ids.main_screen.empty_law_slot.locked_container)
		local available_container_component = ui_component:SequentialFind(self.config.component_ids.main_screen.empty_law_slot.available_container)
		local in_progress_container_component = ui_component:SequentialFind(self.config.component_ids.main_screen.empty_law_slot.in_progress_container)

		local is_researching_law = legacy_object:is_researching_law()
		-- available slot shows the next slot that will be filled in with an active law, but isn't shown if currently a law is being researched
		local is_available = false
		if not is_researching_law and slot_data.law_id < 0 then
			is_available = slot_data.index == legacy_object:get_active_laws_count() + 1
		end

		if is_researching_law and legacy_object:get_id_of_law_being_researched() == slot_data.law_id then
			locked_container_component:SetVisible(false)
			available_container_component:SetVisible(false)
			in_progress_container_component:SetVisible(true)

			local turns_component = in_progress_container_component:SequentialFind(self.config.component_ids.main_screen.empty_law_slot.in_progress_turns_text)
			local law_being_researched = legacy_object.persistent.law_being_researched
			local turns_component = in_progress_container_component:SequentialFind(self.config.component_ids.main_screen.empty_law_slot.in_progress_turns_text)
			turns_component:SetText(law_being_researched.remaining_turns)

			local tooltip_cco_id = self.config.cco_ids.main_screen.law_in_progress_slot_tooltip
			ui_component:SetTooltipText("{{tt:ui/campaign ui/tooltip_map_al_hammurabi_law}}", true)

			local category_config = legacy_object.utility.get_category_config(law_being_researched.category_id)
			local text_in_progress = common.string_safe_format(common.get_localised_string(self.config.texts.main_screen.law_tooltip.in_progress), law_being_researched.remaining_turns)
			local law_name = self:get_law_name(law_being_researched)
			local law_description = self:get_law_description(law_being_researched)
			local warning = self.ui_instance.divine_making and self.config.texts.main_screen.law_tooltip.make_divine_law.warning.law_being_created or ""
			self:create_law_tooltip_cco(tooltip_cco_id, slot_data.law_id, law_name, law_description, category_config, text_in_progress, "", true, "", warning)
			ui_component:SetProperty("script_id", tooltip_cco_id)
		elseif is_available then
			locked_container_component:SetVisible(false)
			available_container_component:SetVisible(true)
			in_progress_container_component:SetVisible(false)
		else
			locked_container_component:SetVisible(true)
			available_container_component:SetVisible(false)
			in_progress_container_component:SetVisible(false)
		end

	end,

	setup_justice_points_container = function(self)
		local panel_component = self.ui_instance.panel_component
		local justice_points_container_component = panel_component:SequentialFind(self.config.component_ids.main_screen.justice_points_container)
		local justice_points_text_value_component = justice_points_container_component:SequentialFind(self.config.component_ids.main_screen.justice_points_text_value)

		local justice_points = self.ui_instance.legacy_object:get_justice_points()
		justice_points_text_value_component:SetText(justice_points)
	end,

	select_category = function(self, category_config)
		if category_config then
			local first_sub_category = table_find_extremum(category_config.sub_categories, function(lhs, rhs) return lhs.ui.order < rhs.ui.order end) 
			self.ui_instance.category_selection = { category = category_config, sub_category = first_sub_category }
		else
			self.ui_instance.category_selection = nil
		end

		local is_selected = category_config ~= nil
		self:set_ui_component_visibility(self.config.component_ids.main_screen.category_content_container, is_selected)

		if is_selected then
			self:setup_category_container(category_config)
		end

		local category_id = category_config and category_config.id or ""
		for _, it_category_config in ipairs(self.ui_instance.legacy_object.config.categories) do
			local button = self:get_category_button(it_category_config.id)
			button:SetState(it_category_config.id == category_id and "selected" or "active")
		end
	end,

	select_sub_category = function(self, sub_category_config)
		self.ui_instance.category_selection.sub_category = sub_category_config
		self:setup_sub_categories_button(sub_category_config)
		self:setup_sub_category_effects(sub_category_config)
	end,

	setup_categories_buttons = function(self)
		local legacy_object = self.ui_instance.legacy_object
		for _, category_config in ipairs(self.ui_instance.legacy_object.config.categories) do
			self:setup_category_button(category_config)
		end
	end,

	setup_category_button = function(self, category_config)
		local legacy_object = self.ui_instance.legacy_object
		local main_screen_config = self.config.component_ids.main_screen
		local button_component = self:get_category_button(category_config.id)
		button_component:SetProperty("config_id", category_config.id)

		local level = legacy_object:get_level_for_category(category_config.id)
		local level_component = button_component:SequentialFind(main_screen_config.category_level_text)
		level_component:SetText(level)

		local show_level_up_indicator = false
		local next_level_config = legacy_object.utility.get_category_level_config(category_config, level + 1)
		if next_level_config then
			show_level_up_indicator = next_level_config.justice_cost <= legacy_object:get_justice_points()
		end

		local level_up_container = button_component:SequentialFind(main_screen_config.category_level_up_container)
		level_up_container:SetVisible(show_level_up_indicator)
	end,

	setup_sub_categories_button = function(self, sub_category_config)
		local legacy_object = self.ui_instance.legacy_object
		local category_id = sub_category_config.category.id
		local category_level = legacy_object:get_level_for_category(category_id)

		for _, button_component in ipairs(self.ui_instance.category_selection.sub_categories_buttons) do
			local it_config_id = button_component:GetProperty("config_id")
			local is_selected = sub_category_config.id == it_config_id
			button_component:SetState(is_selected and "selected" or "active")

			local it_sub_category_config = legacy_object.utility.get_sub_category_config(category_id, it_config_id)
			if is_selected and legacy_object:has_sub_category_level_up_notification(it_sub_category_config) then
				legacy_object:remove_sub_category_level_up_notification(it_sub_category_config)
			end

			local has_notification = legacy_object:has_sub_category_level_up_notification(it_sub_category_config)
			local notification = button_component:SequentialFind("holder_alert_icon")
			notification:SetVisible(has_notification)
		end
	end,

	setup_category_container = function(self, category_config)
		local legacy_object = self.ui_instance.legacy_object
		local panel_component = self.ui_instance.panel_component
		local main_screen_config = self.config.component_ids.main_screen
		local content_container = panel_component:SequentialFind(main_screen_config.category_content_container)

		local level_up_cost_container = content_container:SequentialFind(main_screen_config.category_level_up_cost_container)
		local level = legacy_object:get_level_for_category(category_config.id)
		local next_level_config = legacy_object.utility.get_category_level_config(category_config, level + 1)
		local can_afford_cost = false
		if next_level_config then
			level_up_cost_container:SetVisible(true)

			local level_up_cost_text = level_up_cost_container:SequentialFind(main_screen_config.category_level_up_cost_text)
			local justice_cost = next_level_config.justice_cost
			can_afford_cost = justice_cost <= legacy_object:get_justice_points()
			level_up_cost_text:SetText(justice_cost)
			level_up_cost_text:SetState(can_afford_cost and "default" or "insufficient")
		else
			level_up_cost_container:SetVisible(false)
		end

		local button_level_up = content_container:SequentialFind(main_screen_config.button_category_level_up)
		button_level_up:SetState((can_afford_cost and to_bool(next_level_config)) and "active" or "inactive")
		button_level_up:SetVisible(to_bool(next_level_config))

		self.ui_instance.category_selection.sub_categories_buttons = {}
		local buttons_container = content_container:SequentialFind(main_screen_config.sub_categories_buttons_container)
		buttons_container:DestroyChildren()

		local sorted_sub_categories = {}
		table_append(sorted_sub_categories, category_config.sub_categories)
		sorted_sub_categories = table_stable_sort(sorted_sub_categories, function(lhs, rhs) return lhs.ui.order < rhs.ui.order end)

		for _, sub_category_config in ipairs(sorted_sub_categories) do
			local sub_category_button = UIComponent(buttons_container:CreateFromComponent(self.ui_instance.template_components.sub_category_button:Address(), buttons_container:ChildCount()))
			sub_category_button:SetProperty("config_id", sub_category_config.id)
			sub_category_button:SetImagePath(sub_category_config.ui.icon_path, 0)
			sub_category_button:SetTooltipText(common.get_localised_string(sub_category_config.ui.title), true)
			table.insert(self.ui_instance.category_selection.sub_categories_buttons, sub_category_button)
		end

		local selected_sub_category = self.ui_instance.category_selection.sub_category
		self:setup_sub_categories_button(selected_sub_category)
		self:setup_sub_category_effects(selected_sub_category)
	end,

	setup_sub_category_effects = function(self, sub_category_config)
		local panel_component = self.ui_instance.panel_component
		local main_screen_config = self.config.component_ids.main_screen
		local content_container = panel_component:SequentialFind(main_screen_config.category_content_container)

		local effect_types_container = content_container:SequentialFind(main_screen_config.effect_types_container)
		local effect_types_instances_container = effect_types_container:SequentialFind(main_screen_config.effect_types_instances_container)
		effect_types_instances_container:DestroyChildren()

		local sorted_effect_types = {}
		table_append(sorted_effect_types, sub_category_config.effect_types)
		sorted_effect_types = table_stable_sort(sorted_effect_types, function(lhs, rhs) return lhs.level_requirement < rhs.level_requirement end)

		for _, effect_type_config in ipairs(sorted_effect_types) do
			local effect_type_component = UIComponent(effect_types_instances_container:CreateFromComponent(self.ui_instance.template_components.effect_type:Address(), effect_types_instances_container:ChildCount()))
			local is_level_met = self.ui_instance.legacy_object:is_level_requirement_met(sub_category_config.category.id, effect_type_config.level_requirement)
			self:common_setup_effect_type_component(effect_type_component, effect_type_config, is_level_met)
		end
	end,

	create_law_tooltip_cco = function(self, cco_id, law_id, title, description, category_config, text_in_progress, effect_bundle_key, is_in_progress, action, warning)
		common.set_context_value(cco_id, {
			LawId = law_id,
			Title = title,
			Type = common.get_localised_string(category_config.ui.title),
			Description = description,
			Flavour = common.get_localised_string(self.config.texts.main_screen.law_tooltip.flavour),
			IconStateName = category_config.ui.icon_state_name,
			TextInProgress = text_in_progress,
			EffectBundleKey = effect_bundle_key,
			IsInProgress = is_in_progress,
			Action = (action and #action > 0) and common.get_localised_string(action) or "",
			Warning = (warning and #warning > 0) and common.get_localised_string(warning) or "",
		})
	end,

	get_category_button = function(self, category_id)
		local panel_component = self.ui_instance.panel_component
		local main_screen_config = self.config.component_ids.main_screen
		local button_id = category_id == self.ui_instance.legacy_object.config.categories.civil.id and main_screen_config.button_civil_category or main_screen_config.button_military_category
		return panel_component:SequentialFind(button_id)
	end,

	set_ui_component_visibility = function(self, id, is_visible)
		local panel_component = self.ui_instance.panel_component
		local ui_component = panel_component:SequentialFind(id)
		ui_component:SetVisible(is_visible)
	end,

	show_confirmation_box = function(self, title_key, description_key, confirm_callback)
		
		local title_localised = common:get_localised_string(title_key)
		local description_localised = common:get_localised_string(description_key)

		create_confirmation_box_with_text_from_script("confirmation_box",
			description_localised,
			description_key,
			--Confirm
			function()
				confirm_callback()
			end,
			--Cancel
			nil,
			nil,
			title_localised,
			title_key
		)
	end,

	level_up_selected_category = function(self)
		if not self.ui_instance.category_selection then
			script_error("Hammurabi UI: tried to level up a category but there is none selected.")
			return
		end

		local faction_obj = cm:get_faction(self.ui_instance.faction_key)
		local faction_cqi = faction_obj:command_queue_index()
		local param_str = "hammurabi_level_up_category:" .. self.ui_instance.category_selection.category.id
		CampaignUI.TriggerCampaignScriptEvent(faction_cqi, param_str)
	end,

	remove_law_being_researched = function(self)
		local faction_obj = cm:get_faction(self.ui_instance.faction_key)
		local faction_cqi = faction_obj:command_queue_index()
		CampaignUI.TriggerCampaignScriptEvent(faction_cqi, "hammurabi_remove_law_being_researched")
	end,

	remove_selected_laws = function(self)
		if not self.ui_instance.law_removing then
			return
		end

		local param_str = "hammurabi_remove_active_laws:" .. #self.ui_instance.law_removing.selected_laws
		for _, law_id in ipairs(self.ui_instance.law_removing.selected_laws) do
			param_str = param_str .. ":" .. law_id
		end

		local faction_obj = cm:get_faction(self.ui_instance.faction_key)
		local faction_cqi = faction_obj:command_queue_index()
		CampaignUI.TriggerCampaignScriptEvent(faction_cqi, param_str)
	end,

	make_selected_laws_divine = function(self)
		if not self.ui_instance.divine_making then
			return
		end

		local param_str = "hammurabi_make_divine_laws:" .. #self.ui_instance.divine_making.selected_laws
		for _, law_id in ipairs(self.ui_instance.divine_making.selected_laws) do
			param_str = param_str .. ":" .. law_id
		end

		local faction_obj = cm:get_faction(self.ui_instance.faction_key)
		local faction_cqi = faction_obj:command_queue_index()
		CampaignUI.TriggerCampaignScriptEvent(faction_cqi, param_str)
	end,

	handle_main_screen_button_click = function(self, event_params)
		local button_data_type = event_params[3]
		if button_data_type == "Id" then
			local button_id = event_params[4]
			local main_screen_ids_config = self.config.component_ids.main_screen
			if button_id == main_screen_ids_config.button_open_law_creator then
				self:close_main_screen()
				self:open_law_creator_category_selector()
			elseif button_id == main_screen_ids_config.button_remove_law_being_researched then
				local texts_config = self.config.texts.main_screen.confirm_box_remove_law_being_researched
				self:show_confirmation_box(texts_config.title, texts_config.description, function() self:remove_law_being_researched() end)
			elseif button_id == main_screen_ids_config.button_switch_to_law_removing_mode then
				self:switch_to_law_removing_mode()
			elseif button_id == main_screen_ids_config.button_confirm_laws_removing then
				local texts_config = self.config.texts.main_screen.confirm_box_remove_law
				local confirm_callback = function()
					self:remove_selected_laws()
					self:switch_to_law_browsing_mode()
				end
				self:show_confirmation_box(texts_config.title, texts_config.description, confirm_callback)
			elseif button_id == main_screen_ids_config.button_exit_laws_removing then
				self:switch_to_law_browsing_mode()
			elseif button_id == main_screen_ids_config.button_switch_to_divine_making_mode then
				self:switch_to_divine_making_mode()
			elseif button_id == main_screen_ids_config.button_confirm_divine_making then
				local texts_config = self.config.texts.main_screen.confirm_box_divine_law_created
				local confirm_callback = function()
					self:make_selected_laws_divine()
					self:switch_to_law_browsing_mode()
				end
				self:show_confirmation_box(texts_config.title, texts_config.description, confirm_callback)
			elseif button_id == main_screen_ids_config.button_exit_divine_making then
				self:switch_to_law_browsing_mode()
			elseif button_id == main_screen_ids_config.button_category_level_up then
				self:level_up_selected_category()
			elseif button_id == main_screen_ids_config.button_action_research_any_technology then
				common.toggle_fm_panel("technology_panel")
			end
		elseif button_data_type == "Templated" then
			local button_type = event_params[4]
			if button_type == "Law" then
				local law_id = tonumber(event_params[5])
				self:select_law(law_id)
			elseif button_type == "CategoryClicked" then
				local category_id = event_params[5]
				local category_config = self.ui_instance.legacy_object.utility.get_category_config(category_id)
				
				if self.ui_instance.category_selection and self.ui_instance.category_selection.category == category_config then
					self:select_category(nil)
				else
					self:select_category(category_config)
				end
			elseif button_type == "SubCategoryClicked" then
				local sub_category_id = event_params[5]
				local sub_category_config = self.ui_instance.category_selection.category.sub_categories[sub_category_id]
				self:select_sub_category(sub_category_config)
			end
		end
	end,

-- --------------------------------------------------------- MAIN SCREEN END ---------------------------------------------------------

	common_setup_effect_type_component = function(self, ui_component, effect_type_config, is_level_met)
		local common_config = self.config.component_ids.common

		-- we need effect key because of name and icon of bonus values, all of the parameters configured effects should have the same bonus value by design!
		local first_parameter = effect_type_config.parameters[1]
		local scope_key = first_parameter.scope_key
		local bonus_value_cco = cco("CcoEffectRecord", first_parameter.effect_key):Call("CampaignEffects(\"" .. scope_key .. "\", 1, PlayersFaction.FactionRecordContext).EffectsAlt.FirstContext.Groups.FirstContext.Bonuses.FirstContext")

		local effect_type_icon_path = bonus_value_cco:Call("IconPath")
		if effect_type_icon_path then
			local icon_component = ui_component:SequentialFind(common_config.effect_type_icon)
			icon_component:SetImagePath(effect_type_icon_path)
		end

		local effect_type_name = effect_type_config.name and common.get_localised_string(effect_type_config.name) or ""
		if #effect_type_name <= 0 then
			effect_type_name = bonus_value_cco:Call("Name")
		end 

		if effect_type_name then
			local name_component = ui_component:SequentialFind(common_config.effect_type_name_text)
			name_component:SetText(effect_type_name)
			name_component:SetState(is_level_met and "default" or "locked")
		end

		local locked_container_component = ui_component:SequentialFind(common_config.effect_type_locked_container)
		if not is_level_met then
			locked_container_component:SetVisible(true)
			local locked_requirement_component = locked_container_component:SequentialFind(common_config.effect_type_locked_requirement_text)
			locked_requirement_component:SetText(effect_type_config.level_requirement)
		else
			locked_container_component:SetVisible(false)
		end

		local affected_unit_ability_cco = bonus_value_cco:Call("AffectedUnitAbility")
		local affected_unit_attribute_cco = bonus_value_cco:Call("AffectedUnitAttribute")

		if affected_unit_ability_cco ~= nil then
			ui_component:SetTooltipText("{{tt:ui/common ui/tooltip_battle_ability}}", true)
			ui_component:SetContextObject(affected_unit_ability_cco)
		elseif affected_unit_attribute_cco ~= nil then
			ui_component:SetTooltipText("{{tt:ui/common ui/tooltip_title_description_warning}}", true)
			ui_component:SetContextObject(affected_unit_attribute_cco)
		else
			ui_component:SetTooltipText(effect_type_name, true)
		end
	end,

	filter_player_input_text = function(self, input_text)
		local result = ""
		for i = 1, #input_text do
			local char = string.sub(input_text, i, i)
			if char ~= ":" then
				result = result .. char
			end
		end

		result = common.filter_profanity(result)

		return result
	end,

	get_law_name = function(self, law)
		local category_config = self.ui_instance.legacy_object.utility.get_category_config(law.category_id)
		if not table_contains(category_config.titles, law.name) then
			return law.name
		end

		local hammurabi_config = self.ui_instance.legacy_object.config

		local historical_year = law.historical_year
		local date_string_key = historical_year >= 0 and hammurabi_config.ad_text or hammurabi_config.bc_text
		local date_string = common.get_localised_string(date_string_key)
		local name = common.get_localised_string(law.name)
		return common.string_safe_format(name, math.abs(historical_year), date_string)
	end,

	get_law_description = function(self, law)
		if #law.description > 0 then
			return law.description
		end

		local hammurabi_config = self.ui_instance.legacy_object.config

		local family_member = cm:model():family_member_for_command_queue_index(law.faction_leader_cqi)
		local facion_leader_name = common.get_localised_string(family_member:get_forename())

		local historical_year = law.historical_year or 0
		local date_string_key = historical_year >= 0 and hammurabi_config.ad_text or hammurabi_config.bc_text
		local date_string = common.get_localised_string(date_string_key)
		local law_default_description = common.get_localised_string(hammurabi_config.law_default_description)
		return common.string_safe_format(law_default_description, math.abs(historical_year), date_string, facion_leader_name)
	end,

-- ----------------------------------------------------------- LAW CREATOR -----------------------------------------------------------

	open_law_creator_category_selector = function(self)
		self:set_ui_component_visibility(self.config.component_ids.law_creator_screen.container, true)

		self.ui_instance.law_creator = {}

		self:set_ui_component_visibility(self.config.component_ids.law_creator_screen.category_selector.container, true)
		self:set_ui_component_visibility(self.config.component_ids.law_creator_screen.effects_selector.container, false)
	end,

	open_law_creator_effects_selector = function(self, category_config)
		local law_creator_screen_config = self.config.component_ids.law_creator_screen
		self:set_ui_component_visibility(law_creator_screen_config.category_selector.container, false)
		self:set_ui_component_visibility(law_creator_screen_config.effects_selector.container, true)

		local effects_selector_container = self.ui_instance.panel_component:SequentialFind(law_creator_screen_config.effects_selector.container)

		local category_name_component = effects_selector_container:SequentialFind(law_creator_screen_config.effects_selector.category_name)
		category_name_component:SetText(common.get_localised_string(category_config.ui.title))

		local category_icon_component = effects_selector_container:SequentialFind(law_creator_screen_config.effects_selector.category_icon)
		category_icon_component:SetState(category_config.ui.icon_state_name)

		local category_level_component = effects_selector_container:SequentialFind(law_creator_screen_config.effects_selector.category_level)
		local category_level = self.ui_instance.legacy_object:get_level_for_category(category_config.id)
		category_level_component:SetText(category_level)

		local next_law_id = self.ui_instance.legacy_object:generate_next_law_id()
		local predefined_law_name, predefined_law_name_key = self.ui_instance.legacy_object.utility.create_predefined_law_name(next_law_id, category_config.id, false)
		local predefined_law_description = self.ui_instance.legacy_object.utility.create_predefined_law_description(self.ui_instance.faction_key)
		predefined_law_description = string.sub(predefined_law_description, 1, math.min(100, #predefined_law_description)) -- limit text up to 100 due to TextInput callback's limitations

		self.ui_instance.law_creator.name = predefined_law_name
		self.ui_instance.law_creator.predefined_law_name = predefined_law_name
		self.ui_instance.law_creator.predefined_law_name_key = predefined_law_name_key
		self.ui_instance.law_creator.description = predefined_law_description
		self.ui_instance.law_creator.predefined_law_description = predefined_law_description
		self.ui_instance.law_creator.category = category_config
		self.ui_instance.law_creator.selected_effect_slot = 1
		local first_sub_category = table_find_extremum(category_config.sub_categories, function(lhs, rhs) return lhs.ui.order < rhs.ui.order end) 
		self.ui_instance.law_creator.sub_category = first_sub_category

		self:law_creator_initialise_effects_slots_data()
		self:law_creator_create_sub_categories_filter_buttons(category_config)
		self:law_creator_create_effect_types_components(self.ui_instance.law_creator.sub_category)
		self:law_creator_create_parameters_components(nil)
		self:law_creator_create_values_components(nil)

		self:law_creator_refresh_effects_selector()
	end,

	law_creator_start_law_researching = function(self)
		local param_str = "hammurabi_research_law:"

		-- if the player hasn't changed the predefined name we need to pass the key to the predefined name because we have multiple predefined names to choose from
		local is_predefined_name = self.ui_instance.law_creator.predefined_law_name == self.ui_instance.law_creator.name
		param_str = param_str .. (is_predefined_name and self.ui_instance.law_creator.predefined_law_name_key or self.ui_instance.law_creator.name) .. ":"

		-- if the player hasn't changed the predefined description then we pass an empty string and the UI will know to show the predefined string
		local is_predefined_description = self.ui_instance.law_creator.predefined_law_description == self.ui_instance.law_creator.description
		param_str = param_str .. (is_predefined_description and "" or self.ui_instance.law_creator.description) .. ":"
		param_str = param_str ..  self:law_creator_filled_effect_slots_count()

		for _, effect_slot_data in ipairs(self.ui_instance.law_creator.effect_slots_data) do
			if self:law_creator_is_effect_slot_filled(effect_slot_data) then
				param_str = param_str .. ":"
				param_str = param_str .. effect_slot_data.effect_type.id .. ";"
				param_str = param_str .. effect_slot_data.parameter.id .. ";"
				param_str = param_str .. effect_slot_data.value.id .. ";"
			end
		end

		local faction_obj = cm:get_faction(self.ui_instance.faction_key)
		local faction_cqi = faction_obj:command_queue_index()
		CampaignUI.TriggerCampaignScriptEvent(faction_cqi, param_str)
	end,

	law_creator_refresh_effects_selector = function(self)
		self:law_creator_setup_effect_slots()
		self:law_creator_setup_sub_categories()
		self:law_creator_setup_effect_types()
		self:law_creator_setup_parameters()
		self:law_creator_setup_values()

		self:law_creator_setup_law()
	end,

	law_creator_initialise_effects_slots_data = function(self)
		self.ui_instance.law_creator.effect_slots_data = {}

		local effects_selector_config = self.config.component_ids.law_creator_screen.effects_selector
		local effects_selector_container = self.ui_instance.panel_component:SequentialFind(effects_selector_config.container)
		local effect_slots_container_component = effects_selector_container:SequentialFind(effects_selector_config.effect_slots_container)
		effect_slots_container_component:DestroyChildren()

		for i = 1, self.ui_instance.legacy_object.config.max_effects_per_law do
			local effect_slot_component = UIComponent(effect_slots_container_component:CreateFromComponent(self.ui_instance.template_components.law_creator_effect_slot:Address(), effect_slots_container_component:ChildCount()))
			effect_slot_component:SetProperty("effect_slot_index", i)
			local button_clear_component = effect_slot_component:SequentialFind(effects_selector_config.effect_slot_button_clear)
			button_clear_component:SetProperty("effect_slot_index", i)

			table.insert(self.ui_instance.law_creator.effect_slots_data, { ui_component = effect_slot_component, effect_type = nil, parameter = nil, value = nil })
		end
	end,

	law_creator_select_effect_slot = function(self, effect_slot_index)
		self.ui_instance.law_creator.selected_effect_slot = effect_slot_index

		local selected_effect_slot_data = self:law_creator_get_selected_effect_slot_data()
		local selected_effect_type_sub_category = nil
		if selected_effect_slot_data.effect_type then
			selected_effect_type_sub_category = selected_effect_slot_data.effect_type.sub_category
		end

		-- if we have selected anything in this slot we must show that sub category and the choices made
		if selected_effect_type_sub_category and selected_effect_type_sub_category ~= self.ui_instance.law_creator.sub_category then
			self.ui_instance.law_creator.sub_category = selected_effect_type_sub_category
			self:law_creator_create_effect_types_components(selected_effect_type_sub_category)
		end

		-- effect types are always visible because they appear when sub category is picked,
		-- so we need to try and recreate parameters and values for the slot picked effect type and parameter,
		-- if they aren't picked their containers will be empty
		self:law_creator_create_parameters_components(selected_effect_slot_data.effect_type)
		self:law_creator_create_values_components(selected_effect_slot_data.parameter)

		self:law_creator_refresh_effects_selector()
	end,

	law_creator_clear_effect_slot = function(self, effect_slot_index)
		local effect_slot_data = self.ui_instance.law_creator.effect_slots_data[effect_slot_index]
		effect_slot_data.effect_type = nil
		effect_slot_data.parameter = nil
		effect_slot_data.value = nil

		-- slot will lose everything, but the effect types will still be visible because they appear when sub category is picked,
		-- so we need to clear only parameters and values
		self:law_creator_create_parameters_components(nil)
		self:law_creator_create_values_components(nil)

		self:law_creator_refresh_effects_selector()
	end,

	law_creator_select_sub_category = function(self, sub_category_config)
		if self.ui_instance.law_creator.sub_category == sub_category_config then
			return
		end

		self.ui_instance.law_creator.sub_category = sub_category_config

		local selected_effect_slot_data = self:law_creator_get_selected_effect_slot_data()
		local selected_effect_type_sub_category = nil
		if selected_effect_slot_data.effect_type then
			selected_effect_type_sub_category = selected_effect_slot_data.effect_type.sub_category
		end

		-- we want the player to be able to look through the sub categories without clearing what they have already selected
		self:law_creator_create_effect_types_components(sub_category_config)
		if selected_effect_type_sub_category == sub_category_config then
			self:law_creator_create_parameters_components(selected_effect_slot_data.effect_type)
			self:law_creator_create_values_components(selected_effect_slot_data.parameter)
		else
			self:law_creator_create_parameters_components(nil)
			self:law_creator_create_values_components(nil)
		end

		self:law_creator_refresh_effects_selector()
	end,

	law_creator_select_effect_type = function(self, effect_type_config)
		local selected_effect_slot_data = self:law_creator_get_selected_effect_slot_data()
		if selected_effect_slot_data.effect_type == effect_type_config then
			return
		end

		selected_effect_slot_data.effect_type = effect_type_config
		selected_effect_slot_data.parameter = nil
		selected_effect_slot_data.value = nil

		-- change of effect type will cause parameters to be created for our new effect types, so due to no selected parameter - values container should be empty
		self:law_creator_create_parameters_components(effect_type_config)
		self:law_creator_create_values_components(nil)
		self:law_creator_refresh_effects_selector()
	end,

	law_creator_select_parameter = function(self, parameter_config)
		local selected_effect_slot_data = self:law_creator_get_selected_effect_slot_data()
		if selected_effect_slot_data.parameter == parameter_config then
			return
		end

		selected_effect_slot_data.parameter = parameter_config

		if parameter_config.is_boolean then
			selected_effect_slot_data.value = parameter_config.values[1]
		else
			selected_effect_slot_data.value = nil
		end

		self:law_creator_create_values_components(parameter_config)
		self:law_creator_refresh_effects_selector()
	end,

	law_creator_select_value = function(self, value_config)
		local selected_effect_slot_data = self:law_creator_get_selected_effect_slot_data()
		if selected_effect_slot_data.value == value_config then
			return
		end

		selected_effect_slot_data.value = value_config
		self:law_creator_refresh_effects_selector()
	end,

	law_creator_create_sub_categories_filter_buttons = function(self, category_config)
		local effects_selector_config = self.config.component_ids.law_creator_screen.effects_selector
		local effects_selector_container = self.ui_instance.panel_component:SequentialFind(effects_selector_config.container)
		local sub_categories_container_component = effects_selector_container:SequentialFind(effects_selector_config.sub_categories_container)
		sub_categories_container_component:DestroyChildren()

		self.ui_instance.law_creator.sub_categories_filter_buttons = {}

		local sorted_sub_categories = {}
		table_append(sorted_sub_categories, category_config.sub_categories)
		sorted_sub_categories = table_stable_sort(sorted_sub_categories, function(lhs, rhs) return lhs.ui.order < rhs.ui.order end)

		for _, sub_category_config in ipairs(sorted_sub_categories) do
			local sub_category_button = UIComponent(sub_categories_container_component:CreateFromComponent(self.ui_instance.template_components.law_creator_button_sub_category:Address(), sub_categories_container_component:ChildCount()))
			sub_category_button:SetProperty("config_id", sub_category_config.id)
			sub_category_button:SetImagePath(sub_category_config.ui.icon_path, 0)
			sub_category_button:SetTooltipText(common.get_localised_string(sub_category_config.ui.title), true)
			table.insert(self.ui_instance.law_creator.sub_categories_filter_buttons, sub_category_button)
		end
	end,

	law_creator_create_effect_types_components = function(self, sub_category_config)
		local effects_selector_config = self.config.component_ids.law_creator_screen.effects_selector
		local effects_selector_container = self.ui_instance.panel_component:SequentialFind(effects_selector_config.container)
		local effect_types_container_component = effects_selector_container:SequentialFind(effects_selector_config.effect_types_container)
		local effect_types_instances_container_component = effect_types_container_component:SequentialFind(effects_selector_config.effect_types_instances_container)
		effect_types_instances_container_component:DestroyChildren()

		self.ui_instance.law_creator.effect_types_buttons = {}

		local sorted_effect_types = {}
		table_append(sorted_effect_types, sub_category_config.effect_types)
		sorted_effect_types = table_stable_sort(sorted_effect_types, function(lhs, rhs) return lhs.level_requirement < rhs.level_requirement end)

		for _, effect_type_config in ipairs(sorted_effect_types) do
			local effect_type_component = UIComponent(effect_types_instances_container_component:CreateFromComponent(self.ui_instance.template_components.law_creator_effect_type:Address(), effect_types_instances_container_component:ChildCount()))
			effect_type_component:SetProperty("config_id", effect_type_config.id)
			
			local is_level_met = self.ui_instance.legacy_object:is_level_requirement_met(self.ui_instance.law_creator.category.id, effect_type_config.level_requirement)
			effect_type_component:SetState(is_level_met and "default" or "inactive")

			self:common_setup_effect_type_component(effect_type_component, effect_type_config, is_level_met)

			table.insert(self.ui_instance.law_creator.effect_types_buttons, effect_type_component)
		end
	end,

	law_creator_create_parameters_components = function(self, effect_type_config)
		local effects_selector_config = self.config.component_ids.law_creator_screen.effects_selector
		local effects_selector_container = self.ui_instance.panel_component:SequentialFind(effects_selector_config.container)
		local parameters_container_component = effects_selector_container:SequentialFind(effects_selector_config.parameters_container)
		local parameters_instances_container_component = parameters_container_component:SequentialFind(effects_selector_config.parameters_instances_container)
		parameters_instances_container_component:DestroyChildren()

		local parameters_middle_container_component = parameters_container_component:SequentialFind(effects_selector_config.parameters_middle_container)
		local parameters_warning_text_component = parameters_container_component:SequentialFind(effects_selector_config.parameters_warning_text)
		self.ui_instance.law_creator.parameters_buttons = {}

		if effect_type_config then
			parameters_middle_container_component:SetVisible(true)
			parameters_warning_text_component:SetVisible(false)

			local sorted_parameters = {}
			table_append(sorted_parameters, effect_type_config.parameters)
			sorted_parameters = table_stable_sort(sorted_parameters, function(lhs, rhs) return lhs.level_requirement < rhs.level_requirement end)

			for _, parameter_config in ipairs(sorted_parameters) do
				local parameter_component = UIComponent(parameters_instances_container_component:CreateFromComponent(self.ui_instance.template_components.law_creator_parameter:Address(), parameters_instances_container_component:ChildCount()))
				parameter_component:SetProperty("config_id", parameter_config.id)

				local is_level_met = self.ui_instance.legacy_object:is_level_requirement_met(self.ui_instance.law_creator.category.id, parameter_config.level_requirement)
				parameter_component:SetState(is_level_met and "default" or "inactive")

				local scope_key = parameter_config.scope_key
				local parameter_name = parameter_config.name and common.get_localised_string(parameter_config.name) or ""
				if #parameter_name <= 0 then
					parameter_name = cco("CcoEffectRecord", parameter_config.effect_key):Call("CampaignEffects(\"" .. scope_key .. "\", 1, PlayersFaction.FactionRecordContext).EffectsAlt.FirstContext.Groups.FirstContext.ConditionsBundles.FirstContext.DesignatorsAndConditions.FirstContext.Second")
				end 
				
				if parameter_name then
					local name_component = parameter_component:SequentialFind(effects_selector_config.parameter_name_text)
					name_component:SetText(parameter_name)
					name_component:SetState(is_level_met and "default" or "locked")
				end

				local locked_container_component = parameter_component:SequentialFind(effects_selector_config.parameter_locked_container)
				if not is_level_met then
					locked_container_component:SetVisible(true)
					local locked_requirement_component = locked_container_component:SequentialFind(effects_selector_config.parameter_locked_requirement_text)
					locked_requirement_component:SetText(parameter_config.level_requirement)
				else
					locked_container_component:SetVisible(false)
				end

				table.insert(self.ui_instance.law_creator.parameters_buttons, parameter_component)
			end
		else
			parameters_middle_container_component:SetVisible(false)
			parameters_warning_text_component:SetVisible(true)
		end
	end,

	law_creator_create_values_components = function(self, parameter_config)
		local effects_selector_config = self.config.component_ids.law_creator_screen.effects_selector
		local effects_selector_container = self.ui_instance.panel_component:SequentialFind(effects_selector_config.container)
		local values_container_component = effects_selector_container:SequentialFind(effects_selector_config.values_container)
		local values_instances_container_component = values_container_component:SequentialFind(effects_selector_config.values_instances_container)
		values_instances_container_component:DestroyChildren()

		self.ui_instance.law_creator.values_buttons = {}

		if not parameter_config then
			return
		end

		-- first show non beneficial values, then show beneficial ones
		local sorted_values = {}
		table_append(sorted_values, parameter_config.values)
		sorted_values = table_stable_sort(sorted_values, function(lhs, rhs)
			local is_lhs_beneficial_value = self.ui_instance.legacy_object.utility.is_beneficial_parameter_value(parameter_config, lhs)
			local is_rhs_beneficial_value = self.ui_instance.legacy_object.utility.is_beneficial_parameter_value(parameter_config, rhs)
			if is_lhs_beneficial_value ~= is_rhs_beneficial_value then
				return is_rhs_beneficial_value
			end

			-- beneficials should rise from left to right in the UI, but after the non beneficial
			if is_lhs_beneficial_value then
				return math.abs(lhs.amount) < math.abs(rhs.amount)
			end

			-- non beneficial should be shown from worst, to less worse
			return math.abs(lhs.amount) > math.abs(rhs.amount)
		end)

		for _, value_config in ipairs(sorted_values) do
			local value_component = UIComponent(values_instances_container_component:CreateFromComponent(self.ui_instance.template_components.law_creator_value:Address(), values_instances_container_component:ChildCount()))
			value_component:SetProperty("config_id", value_config.id)

			local is_level_met = self.ui_instance.legacy_object:is_level_requirement_met(self.ui_instance.law_creator.category.id, value_config.level_requirement)
			value_component:SetState(is_level_met and "active" or "inactive")

			local amount_component = value_component:SequentialFind(effects_selector_config.value_amount_text)
			local cco_bonus_value = cco("CcoEffectRecord", parameter_config.effect_key):Call("CampaignEffects(\"" .. parameter_config.scope_key .. "\", " .. value_config.amount .. ", PlayersFaction.FactionRecordContext).EffectsAlt.FirstContext.Groups.FirstContext.Bonuses.FirstContext")

			local amount_text = cco_bonus_value:Call("Value") or ""
			amount_component:SetText(amount_text)
			amount_component:SetState(cco_bonus_value:Call("IsPositive") and "positive" or "negative")

			local cost_component = value_component:SequentialFind(effects_selector_config.value_cost)
			cost_component:SetText(value_config.time_cost)

			local locked_requirement_component = value_component:SequentialFind(effects_selector_config.value_locked_requirement_text)
			if not is_level_met then
				cost_component:SetVisible(false)
				locked_requirement_component:SetVisible(true)
				locked_requirement_component:SetText(value_config.level_requirement)
			else
				cost_component:SetVisible(true)
			end

			table.insert(self.ui_instance.law_creator.values_buttons, value_component)
		end
	end,

	law_creator_setup_law = function(self)
		local legacy_object = self.ui_instance.legacy_object
		local effects_selector_config = self.config.component_ids.law_creator_screen.effects_selector
		local effects_selector_container = self.ui_instance.panel_component:SequentialFind(effects_selector_config.container)

		local filled_in_effect_slots_component = effects_selector_container:SequentialFind(effects_selector_config.filled_in_effect_slots_text)
		local filled_in_effect_slots_count = self:law_creator_filled_effect_slots_count()
		filled_in_effect_slots_component:SetText(filled_in_effect_slots_count .. "/" .. legacy_object.config.max_effects_per_law)

		local can_afford_cost = false
		local law_cost_container_component = effects_selector_container:SequentialFind(effects_selector_config.law_cost_container)
		local law_cost_text_component = law_cost_container_component:SequentialFind(effects_selector_config.law_cost_text)
		local law_turn_cost_text_component = law_cost_container_component:SequentialFind(effects_selector_config.law_turn_cost_text)

		local effects = {}
		for _, effect_slot_data in ipairs(self.ui_instance.law_creator.effect_slots_data) do
			if self:law_creator_is_effect_slot_filled(effect_slot_data) then
				table.insert(effects, { effect_type_config = effect_slot_data.effect_type, parameter_config = effect_slot_data.parameter, value_config = effect_slot_data.value })
			end
		end

		if #effects > 0 then
			local total_turns_cost, turns_abs_value = legacy_object:calculate_turns_cost_for_effects(effects)
			local resource_cost_plain_data = legacy_object.utility.create_cost_plain_data(self.ui_instance.law_creator.category, turns_abs_value)
			local resource_cost_object = legacy_object.utility.create_cost_object(resource_cost_plain_data, false)

			local active_faction = cm:get_faction(self.ui_instance.faction_key)
			can_afford_cost = active_faction:can_afford_resource_cost_object(resource_cost_object)
			law_cost_text_component:SetState(can_afford_cost and "default" or "insufficient")

			local positive_resource_cost_object = legacy_object.utility.create_cost_object(resource_cost_plain_data, true)
			local resource_cost_string = positive_resource_cost_object:to_string()
			law_cost_text_component:SetText(resource_cost_string)
			law_turn_cost_text_component:SetText(total_turns_cost)
		else
			law_cost_text_component:SetState("default")
			law_cost_text_component:SetText("-")
			law_turn_cost_text_component:SetText("-")
		end
		
		local name_input = effects_selector_container:SequentialFind(effects_selector_config.law_name_input_field)
		local name_input_text = name_input:InterfaceFunction("GetValue")
		if name_input_text ~= self.ui_instance.law_creator.name then
			name_input:SetText(self.ui_instance.law_creator.name)
		end

		local button_law_name_clear = name_input:SequentialFind(effects_selector_config.button_law_name_clear)
		button_law_name_clear:SetVisible(self.ui_instance.law_creator.predefined_law_name ~= self.ui_instance.law_creator.name)

		local description_input = effects_selector_container:SequentialFind(effects_selector_config.law_description_input_field)
		local description_input_text = name_input:InterfaceFunction("GetValue")
		if description_input_text ~= self.ui_instance.law_creator.description then
			description_input:SetText(self.ui_instance.law_creator.description)
		end

		local button_law_description_clear = description_input:SequentialFind(effects_selector_config.button_law_description_clear)
		button_law_description_clear:SetVisible(self.ui_instance.law_creator.predefined_law_description ~= self.ui_instance.law_creator.description)

		local has_filled_texts = #self.ui_instance.law_creator.name > 0 and #self.ui_instance.law_creator.description > 0
		local button_create_law_component = effects_selector_container:SequentialFind(effects_selector_config.button_create_law)
		button_create_law_component:SetState((#effects > 0 and can_afford_cost and has_filled_texts) and "active" or "inactive")
	end,

	law_creator_setup_effect_slots = function(self)
		 for index, effect_slot_data in ipairs(self.ui_instance.law_creator.effect_slots_data) do
			self:law_creator_setup_effect_slot(effect_slot_data, index)
		end
	end,

	law_creator_setup_effect_slot = function(self, effect_slot_data, index)
		local ui_component = effect_slot_data.ui_component
		local is_selected = index == self.ui_instance.law_creator.selected_effect_slot
		local has_selected_effect_type = effect_slot_data.effect_type ~= nil
		local show_slot_content = to_bool(has_selected_effect_type or is_selected) -- at least effect type has to be filled because the rest can't be filled in without it
		local legacy_object = self.ui_instance.legacy_object

		local effects_selector_config = self.config.component_ids.law_creator_screen.effects_selector
		local effect_container_component = ui_component:SequentialFind(effects_selector_config.effect_slot_effect_container)
		effect_container_component:SetVisible(show_slot_content)

		local empty_text_component = ui_component:SequentialFind(effects_selector_config.effect_slot_empty_text)
		empty_text_component:SetVisible(not show_slot_content)

		local button_clear_component = ui_component:SequentialFind(effects_selector_config.effect_slot_button_clear)
		button_clear_component:SetVisible(has_selected_effect_type)

		local slot_state = ""
		local is_filled_in = self:law_creator_is_effect_slot_filled(effect_slot_data)
		if is_selected then
			slot_state = is_filled_in and "selected_complete" or "selected"
		else
			slot_state = is_filled_in and "default_complete" or "default"
		end
		ui_component:SetState(slot_state)

		if not show_slot_content then
			return
		end

		local effect_key = nil
		local scope_key = nil
		if effect_slot_data.parameter then
			effect_key = effect_slot_data.parameter.effect_key
			scope_key = effect_slot_data.parameter.scope_key
		elseif effect_slot_data.effect_type then
			effect_key = effect_slot_data.effect_type.parameters[1].effect_key
			scope_key = effect_slot_data.effect_type.parameters[1].scope_key
		end

		local bonus_cco = nil
		local designator_name = nil
		local condition_name = nil
		if effect_key and scope_key then
			local value_amount = effect_slot_data.value and effect_slot_data.value.amount or 1
			local bonus_group_cco = cco("CcoEffectRecord", effect_key):Call("CampaignEffects(\"" .. scope_key .. "\", " .. value_amount .. ", PlayersFaction.FactionRecordContext).EffectsAlt.FirstContext.Groups.FirstContext")
			bonus_cco = bonus_group_cco and bonus_group_cco:Call("Bonuses.FirstContext") or nil
			designator_name = bonus_group_cco and bonus_group_cco:Call("ConditionsBundles.FirstContext.DesignatorsAndConditions.FirstContext.First") or nil

			condition_name = (effect_slot_data.parameter and effect_slot_data.parameter.name) and common.get_localised_string(effect_slot_data.parameter.name) or ""
			if #condition_name <= 0 then
				condition_name = bonus_group_cco and bonus_group_cco:Call("ConditionsBundles.FirstContext.DesignatorsAndConditions.FirstContext.Second") or nil
			end
		end

		local bonus_component = ui_component:SequentialFind(effects_selector_config.effect_slot_bonus_text)
		bonus_component:SetState(has_selected_effect_type and "default" or "prompt")
		if has_selected_effect_type and bonus_cco then
			local effect_type_config = effect_slot_data.effect_type
			local effect_type_name = effect_type_config.name and common.get_localised_string(effect_type_config.name) or ""
			if #effect_type_name <= 0 then
				effect_type_name = bonus_cco:Call("Name")
			end 

			bonus_component:SetStateText(effect_type_name or "")
		end

		local scope_component = ui_component:SequentialFind(effects_selector_config.effect_slot_scope_text)
		scope_component:SetState(has_selected_effect_type and "default" or "inactive")
		if has_selected_effect_type and bonus_cco then
			local scope_name = bonus_cco:Call("Scope")
			scope_component:SetStateText(scope_name or "")
		end

		local has_selected_parameter = effect_slot_data.parameter ~= nil
		local designator_component = ui_component:SequentialFind(effects_selector_config.effect_slot_designator_text)
		designator_component:SetState(has_selected_parameter and "default" or "prompt") -- the final implementation is supposed to have a 3rd state "inactive" to cover this case

		-- it's possible that we don't have a designator name when the parameter's name comes from hammurabi's configuration
		local is_designator_visible = (has_selected_parameter or has_selected_effect_type) and to_bool(designator_name)
		local designator_colon_component = ui_component:SequentialFind(effects_selector_config.effect_slot_designator_colon)
		designator_component:SetVisible(is_designator_visible)
		designator_colon_component:SetVisible(is_designator_visible)
		if has_selected_parameter and designator_name then
			designator_component:SetStateText(designator_name)
		end

		local condition_component = ui_component:SequentialFind(effects_selector_config.effect_slot_condition_text)
		condition_component:SetState(has_selected_parameter and "active" or "inactive")
		if has_selected_parameter and condition_name then
			condition_component:SetStateText(condition_name)
		end

		local has_selected_value = effect_slot_data.value ~= nil
		local value_component = ui_component:SequentialFind(effects_selector_config.effect_slot_value_text)
		local value_state = "inactive"
		if has_selected_parameter then
			if has_selected_value then
				local is_positive = bonus_cco and bonus_cco:Call("IsPositive") or nil
				value_state = is_positive and "default" or "negative"
			else
				value_state = "prompt"
			end
		end

		value_component:SetVisible(not (effect_slot_data.parameter and to_bool(effect_slot_data.parameter.is_boolean)))
		value_component:SetState(value_state)
		if has_selected_value and bonus_cco then
			local value_text = bonus_cco:Call("Value")
			value_component:SetStateText(value_text or "")
		end

		local cost_component = ui_component:SequentialFind(effects_selector_config.effect_slot_cost_text)
		cost_component:SetState(has_selected_value and "default" or "inactive")
		if has_selected_value then
			local effect_time_cost, cost_changed_due_to_repetitive_effects = legacy_object:calculate_effect_time_cost(effect_slot_data.effect_type, effect_slot_data.parameter, effect_slot_data.value)
			cost_component:SetStateText(effect_time_cost)

			local slot_tooltip_text = cost_changed_due_to_repetitive_effects and common:get_localised_string(self.config.texts.law_creator_screen.effect_slot_cost_tooltip) or ""
			cost_component:SetTooltipText(slot_tooltip_text, true)
		end

		local cuneiform_icon_component = ui_component:SequentialFind(effects_selector_config.effect_slot_cuneiform_icon)
		cuneiform_icon_component:SetVisible(has_selected_effect_type)
		if has_selected_effect_type then
			local sub_category_config = effect_slot_data.effect_type.sub_category
			cuneiform_icon_component:SetImagePath(sub_category_config.ui.cuneiform_icon_path)
		end
	end,

	law_creator_setup_sub_categories = function(self)
		local sub_category = self.ui_instance.law_creator.sub_category
		if not sub_category then
			return
		end

		for _, button_component in ipairs(self.ui_instance.law_creator.sub_categories_filter_buttons) do
			button_component:SetState(sub_category.id == button_component:GetProperty("config_id") and "selected" or "active")
		end

		local effects_selector_config = self.config.component_ids.law_creator_screen.effects_selector
		local effects_selector_container = self.ui_instance.panel_component:SequentialFind(effects_selector_config.container)
		local effect_types_container_component = effects_selector_container:SequentialFind(effects_selector_config.effect_types_container)

		local sub_categories_name_component = effect_types_container_component:SequentialFind(effects_selector_config.sub_categories_name_text)
		sub_categories_name_component:SetText(common.get_localised_string(sub_category.ui.title))

		local sub_categories_flavour_component = effect_types_container_component:SequentialFind(effects_selector_config.sub_categories_flavour_text)
		sub_categories_flavour_component:SetText(common.get_localised_string(sub_category.ui.flavour))
	end,

	law_creator_setup_effect_types = function(self)
		local legacy_object = self.ui_instance.legacy_object
		local selected_effect_slot_data = self:law_creator_get_selected_effect_slot_data()
		local effect_type = selected_effect_slot_data and selected_effect_slot_data.effect_type or nil
		local effect_slots_effect_types = self:law_creator_get_effect_slots_effect_types()
		
		for _, button_component in ipairs(self.ui_instance.law_creator.effect_types_buttons) do
			local effect_type_id = button_component:GetProperty("config_id")
			local effect_type_config = legacy_object.utility.get_effect_type_config(effect_type_id)
			local is_level_met = legacy_object:is_level_requirement_met(self.ui_instance.law_creator.category.id, effect_type_config.level_requirement)
			local already_used_effect_type = table_contains(effect_slots_effect_types, effect_type_id)

			local button_non_selected_state = (is_level_met and not already_used_effect_type) and "default" or "inactive"
			local is_selected_effect_type = effect_type and effect_type.id == effect_type_id
			button_component:SetState(is_selected_effect_type and "selected" or button_non_selected_state)

			local name_component = button_component:SequentialFind(self.config.component_ids.common.effect_type_name_text)
			local name_non_selected_state = "inactive"
			if not already_used_effect_type then
				name_non_selected_state = is_level_met and "default" or "locked"
			end

			name_component:SetState(is_selected_effect_type and "selected" or name_non_selected_state)
		end
	end,
	
	law_creator_setup_parameters = function(self)
		local legacy_object = self.ui_instance.legacy_object
		local selected_effect_slot_data = self:law_creator_get_selected_effect_slot_data()
		local parameter = selected_effect_slot_data.parameter

		for _, button_component in ipairs(self.ui_instance.law_creator.parameters_buttons) do
			local parameter_id = button_component:GetProperty("config_id")
			local parameter_config = legacy_object.utility.get_parameter_config(selected_effect_slot_data.effect_type, parameter_id)
			local is_level_met = legacy_object:is_level_requirement_met(self.ui_instance.law_creator.category.id, parameter_config.level_requirement)

			local button_non_selected_state = is_level_met and "default" or "inactive"
			local is_selected_parameter = parameter and parameter.id == parameter_id
			button_component:SetState(is_selected_parameter and "selected" or button_non_selected_state)

			local name_component = button_component:SequentialFind(self.config.component_ids.law_creator_screen.effects_selector.parameter_name_text)
			local name_non_selected_state = is_level_met and "default" or "locked"
			name_component:SetState(is_selected_parameter and "selected" or name_non_selected_state)
		end
	end,
	
	law_creator_setup_values = function(self)
		local selected_effect_slot_data = self:law_creator_get_selected_effect_slot_data()

		local effects_selector_config = self.config.component_ids.law_creator_screen.effects_selector
		local effects_selector_container = self.ui_instance.panel_component:SequentialFind(effects_selector_config.container)
		local values_container_component = effects_selector_container:SequentialFind(effects_selector_config.values_container)
		local values_instances_container_component = values_container_component:SequentialFind(effects_selector_config.values_instances_container)
		local no_values_text_component = values_container_component:SequentialFind(effects_selector_config.values_no_values_text)

		local selected_parameter = selected_effect_slot_data.parameter
		if selected_parameter and selected_parameter.is_boolean then
			values_instances_container_component:SetVisible(false)
			no_values_text_component:SetVisible(true)
		else
			values_instances_container_component:SetVisible(true)
			no_values_text_component:SetVisible(false)

			local legacy_object = self.ui_instance.legacy_object
			local value = selected_effect_slot_data.value
			for _, button_component in ipairs(self.ui_instance.law_creator.values_buttons) do
				local value_id = button_component:GetProperty("config_id")
				local value_config = legacy_object.utility.get_value_config(selected_parameter, value_id)
				local is_level_met = legacy_object:is_level_requirement_met(self.ui_instance.law_creator.category.id, value_config.level_requirement)
	
				local button_non_selected_state = is_level_met and "active" or "inactive"
				local is_selected_value = value and value.id == value_id
				button_component:SetState(is_selected_value and "selected" or button_non_selected_state)
			end
		end
	end,

	close_law_creator = function(self)
		self:set_ui_component_visibility(self.config.component_ids.law_creator_screen.container, false)
		self.ui_instance.law_creator = nil
	end,

	law_creator_get_selected_effect_slot_data = function(self)
		return self.ui_instance.law_creator.effect_slots_data[self.ui_instance.law_creator.selected_effect_slot]
	end,

	law_creator_is_effect_slot_filled = function(self, effect_slot_data)
		return to_bool(effect_slot_data.effect_type and effect_slot_data.parameter and effect_slot_data.value)
	end,

	law_creator_filled_effect_slots_count = function(self)
		local filled_effect_slots_count = 0
		for _, effect_slot_data in ipairs(self.ui_instance.law_creator.effect_slots_data) do
			if self:law_creator_is_effect_slot_filled(effect_slot_data) then
				filled_effect_slots_count = filled_effect_slots_count + 1
			end
		end

		return filled_effect_slots_count
	end,

	law_creator_get_effect_slots_effect_types = function(self)
		local effect_type_ids = {}
		for _, effect_slot_data in ipairs(self.ui_instance.law_creator.effect_slots_data) do
			if effect_slot_data.effect_type then
				table.insert(effect_type_ids, effect_slot_data.effect_type.id)
			end
		end

		return effect_type_ids
	end,

	law_creator_generate_random_effect_for_selected_slot = function(self)
		local selected_effect_slot_data = self:law_creator_get_selected_effect_slot_data()
		if not selected_effect_slot_data then
			return
		end

		local legacy_object = self.ui_instance.legacy_object
		local effect_slots_effect_types = self:law_creator_get_effect_slots_effect_types()
		local selected_effect_type_id = selected_effect_slot_data.effect_type and selected_effect_slot_data.effect_type.id or ""
		table_erase(effect_slots_effect_types, selected_effect_type_id)

		local viable_random_effects = legacy_object:build_viable_random_effects(self.ui_instance.law_creator.category, false, {}, effect_slots_effect_types)
		local effect = legacy_object:generate_random_effect(false, viable_random_effects)
		if not effect then
			return
		end

		local new_sub_category = effect.effect_type_config.sub_category
		self.ui_instance.law_creator.sub_category = new_sub_category
		selected_effect_slot_data.effect_type = effect.effect_type_config
		selected_effect_slot_data.parameter = effect.parameter_config
		selected_effect_slot_data.value = effect.value_config

		self:law_creator_create_effect_types_components(effect.effect_type_config.sub_category)
		self:law_creator_create_parameters_components(effect.effect_type_config)
		self:law_creator_create_values_components(effect.parameter_config)
		self:law_creator_refresh_effects_selector()
	end,

	handle_law_creator_screen_button_click = function(self, event_params)
		-- 3rd parameter can be a component id or type of button pressed
		local button_data_type = event_params[3]
		if button_data_type == "Id" then
			local button_id = event_params[4]
			local law_creator_screen_config = self.config.component_ids.law_creator_screen
			if button_id == law_creator_screen_config.category_selector.button_back then
				self:close_law_creator()
				self:open_main_screen()
			elseif button_id == law_creator_screen_config.category_selector.button_select_civil then
				self:open_law_creator_effects_selector(self.ui_instance.legacy_object.config.categories.civil)
			elseif button_id == law_creator_screen_config.category_selector.button_select_military then
				self:open_law_creator_effects_selector(self.ui_instance.legacy_object.config.categories.military)
			elseif button_id == law_creator_screen_config.effects_selector.button_back then
				self:open_law_creator_category_selector()
			elseif button_id == law_creator_screen_config.effects_selector.button_create_law then
				self:law_creator_start_law_researching()
				self:close_law_creator()
				self:open_main_screen()
			elseif button_id == law_creator_screen_config.effects_selector.button_generate_random_effect then
				self:law_creator_generate_random_effect_for_selected_slot()
			elseif button_id == law_creator_screen_config.effects_selector.button_law_name_clear then
				self.ui_instance.law_creator.name = self.ui_instance.law_creator.predefined_law_name
				self:law_creator_setup_law()
			elseif button_id == law_creator_screen_config.effects_selector.button_law_description_clear then
				self.ui_instance.law_creator.description = self.ui_instance.law_creator.predefined_law_description
				self:law_creator_setup_law()
			end
		elseif button_data_type == "Templated" then
			local button_type = event_params[4]
			local legacy_object = self.ui_instance.legacy_object

			if button_type == "EffectSlotSelect" then
				local effect_slot_index = tonumber(event_params[5])
				self:law_creator_select_effect_slot(effect_slot_index)
			elseif button_type == "EffectSlotClear" then
				local effect_slot_index = tonumber(event_params[5])
				self:law_creator_clear_effect_slot(effect_slot_index)
			elseif button_type == "SubCategorySelect" then
				local sub_category_id = event_params[5]
				local sub_category_config = legacy_object.utility.get_sub_category_config(self.ui_instance.law_creator.category.id, sub_category_id)
				self:law_creator_select_sub_category(sub_category_config)
			elseif button_type == "EffectTypeSelect" then
				local effect_type_id = event_params[5]
				self:law_creator_select_effect_type(legacy_object.utility.get_effect_type_config(effect_type_id))
			elseif button_type == "ParameterSelect" then
				local paremeter_id = event_params[5]
				local selected_effect_slot_data = self:law_creator_get_selected_effect_slot_data()
				self:law_creator_select_parameter(legacy_object.utility.get_parameter_config(selected_effect_slot_data.effect_type, paremeter_id))
			elseif button_type == "ValueSelect" then
				local value_id = event_params[5]
				local selected_effect_slot_data = self:law_creator_get_selected_effect_slot_data()
				self:law_creator_select_value(legacy_object.utility.get_value_config(selected_effect_slot_data.parameter, value_id))
			end
		end
	end,
-- --------------------------------------------------------- LAW CREATOR END ---------------------------------------------------------

-- ___________________________________________________________________________________________________________________________________

-- --------------------------------------------------------- EVENT HANDLING ----------------------------------------------------------

	add_panel_listeners = function(self)
		core:add_listener (
			"Hammurabi_UI_HammurabiButtonEvent",
			"ContextTriggerEvent",
			function(context)
				return context.string:split(":")[1] == "HammurabiButton"
			end,
			function(context)
				local params = context.string:split(":")
				local screen_type = params[2]
				if screen_type == "MainScreen" then
					self:handle_main_screen_button_click(params)
				elseif screen_type == "LawCreator" then
					self:handle_law_creator_screen_button_click(params)
				end
			end,
			true
		)

		core:add_listener (
			"Hammurabi_UI_MouseOn",
			"ContextTriggerEvent",
			function(context)
				return context.string:split(":")[1] == "HammurabiMouseOn"
			end,
			function(context)
				local params = context.string:split(":")
				local component_type = params[2]
				local main_screen_ids_config = self.config.component_ids.main_screen

				if component_type == "LawActiveSlot" then
					local component = UIComponent(context.component)
					local content_container = component:SequentialFind(main_screen_ids_config.active_law_slot.content_container)
					if content_container then
						content_container:SetVisible(false)
					end
				end
			end,
			true
		)

		core:add_listener (
			"Hammurabi_UI_MouseOff",
			"ContextTriggerEvent",
			function(context)
				return context.string:split(":")[1] == "HammurabiMouseOff"
			end,
			function(context)
				local params = context.string:split(":")
				local component_type = params[2]
				local main_screen_ids_config = self.config.component_ids.main_screen

				if component_type == "LawActiveSlot" then
					local component = UIComponent(context.component)
					local content_container = component:SequentialFind(main_screen_ids_config.active_law_slot.content_container)
					if content_container then
						content_container:SetVisible(true)
					end
				end
			end,
			true
		)

		core:add_listener (
			"Hammurabi_UI_TextInputFieldChanged",
			"ContextTriggerEvent",
			function(context)
				return context.string:split(":")[1] == "HammurabiTextInputChanged"
			end,
			function(context)
				local component = UIComponent(context.component)
				local ids_config = self.config.component_ids

				if component:Id() == ids_config.law_creator_screen.effects_selector.law_name_input_field then
					local input_field_text = component:InterfaceFunction("GetValue")
					if input_field_text ~= self.ui_instance.law_creator.name then
						self.ui_instance.law_creator.name = self:filter_player_input_text(input_field_text)
						self:law_creator_setup_law()
					end
				elseif component:Id() == ids_config.law_creator_screen.effects_selector.law_description_input_field then
					local input_field_text = component:InterfaceFunction("GetValue")
					if input_field_text ~= self.ui_instance.law_creator.description then
						self.ui_instance.law_creator.description = self:filter_player_input_text(input_field_text)
						self:law_creator_setup_law()
					end
				end
			end,
			true
		)

		core:add_listener (
			"Hammurabi_UI_LawSlotTooltipCreated",
			"ContextTriggerEvent",
			function(context)
				return context.string:split(":")[1] == "HammurabiLawSlotTooltipCreated"
			end,
			function(context)
				local component = UIComponent(context.component)
				local law_id = tonumber(context.string:split(":")[2])

				local legacy_object = self.ui_instance.legacy_object
				local law_being_researched = legacy_object.persistent.law_being_researched
				if law_being_researched and law_id == law_being_researched.id then
					local effect_bundle_key = legacy_object.utility.get_effect_bundle_key_for_law(law_being_researched.id)
					local custom_effect_bundle = legacy_object.utility.create_custom_effect_bundle(effect_bundle_key, law_being_researched.effects_plain_data)
					component:InterfaceFunction("set_cco_effect_bundle_from_custom_bundle", custom_effect_bundle)
				elseif self.ui_instance.divine_making then
					local is_selected_for_divine_making = self.ui_instance.divine_making and table_contains(self.ui_instance.divine_making.selected_laws, law_id)
					if is_selected_for_divine_making then
						local effect_bundle_key = legacy_object.utility.get_effect_bundle_key_for_law(law_id)
						local divine_effects_plain_data = legacy_object:create_effects_plain_data_for_divine_version_of_law(law_id)
						local custom_effect_bundle = legacy_object.utility.create_custom_effect_bundle(effect_bundle_key, divine_effects_plain_data)
						component:InterfaceFunction("set_cco_effect_bundle_from_custom_bundle", custom_effect_bundle)
					end
				end
			end,
			true
		)

		core:add_listener (
			"Hammurabi_UI_PooledResourceTransactionEvent",
			"PooledResourceTransactionEvent",
			function(context)
				return context:resource():key() == self.ui_instance.legacy_object.config.resource_key
			end,
			function(context)
				self:refresh_main_screen()
			end,
			true
		)

		core:add_listener (
			"Hammurabi_UI_ScriptEventHammurabiRemovedActiveLaws",
			"ScriptEventHammurabiRemovedActiveLaws",
			function(context)
				return context.stored_table.faction_name == self.ui_instance.faction_key
			end,
			function(context)
				self:refresh_main_screen(true)
			end,
			true
		)

		core:add_listener (
			"Hammurabi_UI_ScriptEventHammurabiRemovedLawBeingResearched",
			"ScriptEventHammurabiRemovedLawBeingResearched",
			function(context)
				return context.stored_table.faction_name == self.ui_instance.faction_key
			end,
			function(context)
				self:refresh_main_screen(true)
				self:update_hud_button(self.ui_instance.legacy_object)
			end,
			true
		)

		core:add_listener (
			"Hammurabi_UI_ScriptEventHammurabiResearchingLaw",
			"ScriptEventHammurabiResearchingLaw",
			function(context)
				return context.stored_table.faction_name == self.ui_instance.faction_key
			end,
			function(context)
				self:refresh_main_screen(true)
				self:update_hud_button(self.ui_instance.legacy_object)
			end,
			true
		)

		core:add_listener (
			"Hammurabi_UI_ScriptEventHammurabiActivatedLaw",
			"ScriptEventHammurabiActivatedLaw",
			function(context)
				return context.stored_table.faction_name == self.ui_instance.faction_key
			end,
			function(context)
				self:refresh_main_screen(true) -- refresh slots data due to possibility of new available slot
			end,
			true
		)

		core:add_listener (
			"Hammurabi_UI_ScriptEventHammurabiCategoryLevelUp",
			"ScriptEventHammurabiCategoryLevelUp",
			function(context)
				return context.stored_table.faction_name == self.ui_instance.faction_key
			end,
			function(context)
				self:refresh_main_screen()
			end,
			true
		)

		core:add_listener (
			"Hammurabi_UI_ScriptEventHammurabiLawRemovalsIncreased",
			"ScriptEventHammurabiLawRemovalsIncreased",
			function(context)
				return context.stored_table.faction_name == self.ui_instance.faction_key
			end,
			function(context)
				self:refresh_main_screen()
			end,
			true
		)

		core:add_listener (
			"Hammurabi_UI_ScriptEventHammurabiMadeDivineLaws",
			"ScriptEventHammurabiMadeDivineLaws",
			function(context)
				return context.stored_table.faction_name == self.ui_instance.faction_key
			end,
			function(context)
				self:refresh_main_screen()
			end,
			true
		)
	end,

	remove_panel_listeners = function(self)
		core:remove_listener("Hammurabi_UI_HammurabiButtonEvent")
		core:remove_listener("Hammurabi_UI_MouseOn")
		core:remove_listener("Hammurabi_UI_MouseOff")
		core:remove_listener("Hammurabi_UI_TextInputFieldChanged")
		core:remove_listener("Hammurabi_UI_LawTooltipCreated")
		core:remove_listener("Hammurabi_UI_PooledResourceTransactionEvent")
		core:remove_listener("Hammurabi_UI_ScriptEventHammurabiRemovedActiveLaws")
		core:remove_listener("Hammurabi_UI_ScriptEventHammurabiRemovedLawBeingResearched")
		core:remove_listener("Hammurabi_UI_ScriptEventHammurabiResearchingLaw")
		core:remove_listener("Hammurabi_UI_ScriptEventHammurabiActivatedLaw")
		core:remove_listener("Hammurabi_UI_ScriptEventHammurabiCategoryLevelUp")
		core:remove_listener("Hammurabi_UI_ScriptEventHammurabiLawRemovalsIncreased")
		core:remove_listener("Hammurabi_UI_ScriptEventHammurabiMadeDivineLaws")
	end,

	-- persistent listeners that listen all the time, not only when the panel is open
	add_listeners = function(self, legacy_object)
		core:add_listener (
			"Hammurabi_UI_Global_ContextTriggerEvent",
			"ContextTriggerEvent",
			function(context)
				return context.string:split(":")[1] == "HammurabiButtonMouseOn"
			end,
			function(context)
				local params = context.string:split(":")
				local button_type = params[2]
				if button_type == "TechnologyPanelFinishCurrentlyResearchedTechnology" then
					local component = UIComponent(context.component)
					local technology_key = component:GetProperty("technology_key")
					local cco_id = self.config.cco_ids.technology_panel_instant_research_technology_button_tooltip
					self:create_instant_research_technology_button_tooltip_cco(cco_id, technology_key)
					component:SetProperty("script_id", cco_id)
				end
			end,
			true
		)

		core:add_listener (
			"Hammurabi_UI_Global_ScriptEventHammurabiActivatedLaw",
			"ScriptEventHammurabiActivatedLaw",
			function(context)
				return context.stored_table.faction_name == legacy_object.persistent.faction_key
			end,
			function(context)
				legacy_object.persistent.ui.show_newly_activated_law_notification = true
				self:update_hud_button(legacy_object)
			end,
			true
		)

		core:add_listener (
			"Hammurabi_UI_Global_ScriptEventHammurabiAdvancedLawBeingResearched",
			"ScriptEventHammurabiAdvancedLawBeingResearched",
			function(context)
				return context.stored_table.faction_name == legacy_object.persistent.faction_key
			end,
			function(context)
				self:update_hud_button(legacy_object)
			end,
			true
		)

		core:add_listener (
			"Hammurabi_UI_Global_ScriptEventHammurabiCategoryLevelUp",
			"ScriptEventHammurabiCategoryLevelUp",
			function(context)
				return context.stored_table.faction_name == legacy_object.persistent.faction_key
			end,
			function(context)
				legacy_object:add_sub_categories_level_up_notification(context.stored_table.category_id)
			end,
			true
		)
	end,

	create_instant_research_technology_button_tooltip_cco = function(self, cco_id, technology_key)
		local local_faction = cm:get_local_faction(true)
		if not local_faction or local_faction:is_null_interface() then
			return
		end

		local tooltip_texts_config = self.config.texts.main_screen.action_research_any_technology_tooltip
		local justice_cost = ancient_legacy_hammurabi.utility.calculate_justice_cost_research_any_technology_action(local_faction, technology_key)
		local justice_points = local_faction:pooled_resource(ancient_legacy_hammurabi.config.resource_key):value()

		common.set_context_value(cco_id, {
			Cost = justice_cost,
			CanAfford = justice_cost <= justice_points,
			Title = common.get_localised_string(tooltip_texts_config.title),
			Type = common.get_localised_string(tooltip_texts_config.type),
			Description = common.get_localised_string(tooltip_texts_config.description),
			Flavour = common.get_localised_string(tooltip_texts_config.flavour),
		})
	end,

	update_hud_button = function(self, legacy_object)
		local notification = core:get_ui_root():SequentialFind("fm_phar_hammurabi_container", "holder_alert_icon")
		notification:SetVisible(legacy_object.persistent.ui.show_newly_activated_law_notification)

		local is_researching_law = legacy_object:is_researching_law()
		local turns_icon = core:get_ui_root():SequentialFind("fm_phar_hammurabi_container", "turns_icon")
		turns_icon:SetVisible(is_researching_law)
		if is_researching_law then
			local law_being_researched = legacy_object.persistent.law_being_researched
			turns_icon:SetText(law_being_researched.remaining_turns)
		end
	end,

}