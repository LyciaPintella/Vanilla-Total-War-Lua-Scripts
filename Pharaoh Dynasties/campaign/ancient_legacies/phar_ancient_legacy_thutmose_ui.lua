out("Loading phar_ancient_legacy_thutmose_ui.lua")

local function output(str)
	if str then
		out("<<>> _ANCIENT LEGACY THUTMOSE UI<<>>: " .. str)
	end
end

ancient_legacy_thutmose.ui = 
{
	config = 
	{
		panel_name = "legacy_thutmose",
		-- because there may be more components using the same name we get the root using the tag
		panel_tag = "legacy_thutmose_root",

		-- all components here will be automatically placed in the ancient_legacy_thutmose.ui.components.referenced_components table with the same id
		-- this is done in init_referenced_components
		referenced_component_ids =
		{
			start_button = "button_start_conquest",
			culmination_button = "conquest_culmination_button",
			abandon_button = "button_abandon_conquest",
			expand_button = "btn_expand_target",
			cancel_button = "btn_close",
			expand_button_text = "expand_button_txt",
			zoom_button = "button_go_to_location",

			progress_bar_fill = "bar_base", -- the element we scale to signify progress
			progress_bar_background = "bar_frame_top", -- the element whose size is taken as bar completely filled
			actions_holder = "button_list_holder", -- the element we put the actions in
			sabotage_holder = "sabotage_counter", -- holds many elements displaying the sabotage value
			support_holder = "native_counter", -- holds many elements displaying the support value
			sum_holder = "overall_counter", -- holds text fields for current and final Sabotage and Native Support values
			sabotage_bar = "bar_sabotage", -- scaled up or down to show progress for sabotage
			support_bar = "bar_native_support", -- scaled up or down to show progress for sabotage

			progress_bar = "bar_base", -- scaled up or down to show progress for actions taken

			target_name_text = "dy_selected_city",

			city_holder = "city_selection_holder",
			map_holder = "map_holder",
			padding_1 = "padding_left",
			padding_2 = "padding_right",
			targets_list = "available_cities",

			target_owner_holder = "current_owner",
			public_order_holder = "public_order_holder",
			selected_settlement_ruins = "selected_settlement_ruins",

			garrison_holder = "garrison",
			garrison_count_holder = "garrison_count",
			reinforcement_holder = "right_holder",
			effects_left_holder = "left_holder",
			reinforcement_count_holder = "reinforcements_count",
			already_spawned_indicator = "already_spawned_text",
			reinforcements_empty_indicator = "reinforcements_empty_list",
			effects_holder = "effects_holder",
			effects_empty_indicator = "effects_empty_list",
			your_faction_title_sabotage = "your_faction_title_sabotage",
			your_faction_title_support = "your_faction_title_support",
			complete_conquest_text = "complete_conquest_tx",
			target_city = "target_city",

			no_target_flavour_text = "no_target_flavour_text",
			settlement_ruins_flavour_text = "settlement_ruins_flavour_text",
		},
		
		-- all components here will be automatically placed in the ancient_legacy_thutmose.ui.components.templates table with the same id
		-- this is done in init_ui_templates
		-- note: they need to be in a different format from referenced_component_ids and component_ids because the order they are iterated through matters
		-- if there are nested templates we need to find and handle the internal one before the external one
		-- otherwise when the external one is divorced form the parent we can't find the internal one, it is not part of the components tree
		template_component_ids = 
		{
			--action_flyout
			{
				id = "action_flyout",
				name = "skill_flyout_element",
			},
			--action_slot_template
			{
				id = "action_slot_template",
				name = "skill_template",
			},
			-- unit_card_template/land_unit_card
			{
				id = "unit_card_template",
				name = "land_unit_card",
			},
			-- template_city_entry
			{
				id = "template_city_entry",
				name = "template_city_entry",
			},
		},

		-- components we want to search for or use in a specific way, not simply as referenced or template components
		-- e.g. specific items in templates
		component_ids =
		{
			flyout_list = "skill_flyout", 			-- element in the action list where we show potential actions the user can choose
			action_button = "skill_button", 		-- element in the action_slot_template that actually shows the action state and details
			action_type_indicator = "affinity_gem",	-- element showing the type of the action - sabotage, support or balanced
			sabotage_support_text_field = "dy_value", 
			sum_current_text_field = "dy_value",	-- element holding the current sum for sabotage and support
			sum_total_text_field = "max_value",		-- element holding the final sum after all actions are taken

			-- element inside garrison_holder and reinforcement_holder that should be shown/hidden in click
			-- and where the templates of the unit cards should be instantiated
			units_holder = "units_holder",
			units_list = "units_list",
			-- element inside garrison_count_holder and reinforcement_count_holder that should display the number itself
			units_count = "value",
			garrison = "dy_garrison",
			effects_list = "effects_list",
			list_separator = "list_separator",
			tier_element = "tier_",
			action_slot = "action_slot_",
			city_name = "dy_city_name",
		},

		-- this is a template in the UIEd sense, not a component from the layout we manually duplicate
		effects_container_path = "UI/templates/effects_container",
		effect_bundle_container_path = "UI/templates/effects_list",

		-- components for the pins in the map are named with this prefix and the name of the region
		pin_component_prefix = "pin_",
		-- buttons for possible targets are named with this prefix and the name of the region
		button_component_prefix = "button_region_",

		localization_keys = 
		{
			no_target_slot_tooltip = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_no_target_slot_tooltip",
			locked_slot_tooltip = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_locked_slot_tooltip",
			actions_limit_tooltip = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_actions_limit_tooltip",
			unlocked_slot_tooltip = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_unlocked_slot_tooltip",
			abandon_target_prompt = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_abandon_target_prompt",
			confirm_target_title = "ui_text_replacements_localised_text_legacy_thutmose_start_conquest_confirm_title",
			confirm_target_body = "ui_text_replacements_localised_text_legacy_thutmose_start_conquest_confirm_body", 
			insufficient_resources_for_action = "ui_text_replacements_localised_text_legacy_thutmose_insufficient_resources_for_action", 

			-- bonuses
			sabotage_value = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_sabotage_value",
			support_value = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_support_value",

			post_capture_rewards_header = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_post_capture_rewards_header",
			unit_reinforcements_header = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_unit_reinforcements_header",
			unit_rewards_header = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_unit_rewards_header",
			unit_rewards_notarget = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_unit_rewards_notarget",
			-- maybe use the description from the actual bonus
			replenishment = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_replenishment",
			-- maybe use the description from the actual bonus
			happiness_param = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_happiness_param",
			-- this is displayed before we have a target
			happiness = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_happiness",
			force_sally_description = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_force_sally_description",
			force_surrender_description = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_force_surrender_description",
			force_surrender_ui_description = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_force_surrender_ui_description",

			-- placed next to the units list, if all were spawned
			already_spawned = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_already_spawned",
			-- placed next to the units list, if some were spawned and some are available for spawning
			some_already_spawned = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_some_already_spawned",

			next_action_discount = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_next_action_discount",
			rebellion_units = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_rebellion_units",
			damage_buildings = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_damage_buildings",
			damage_ers = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_damage_ers",
			reveal_garrison_units = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_reveal_garrison_units",
			reveal_garrison_proportion_half = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_reveal_garrison_proportion_half",
			reveal_garrison_proportion_full = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_reveal_garrison_proportion_full",
			-- this one is hard to make pretty and should not need to be used
			reveal_garrison_proportion_fallback = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_reveal_garrison_proportion_fallback",
			grant_visibility = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_grant_visibility",

			target_city_note = "ui_text_replacements_localised_text_phar_main_al_thutmose_target_city_desc",
			conquest_action = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_conquest_action",
			initiate_conquest = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_initiate_conquest",
			choose_settlement = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_choose_settlement",
			cost_tooltip = "ui_text_replacements_localised_text_phar_main_al_thutmose_tooltip_cost",
			conquest_culmination = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_conquest_culmination",
			provides_tooltip = "ui_text_replacements_localised_text_phar_main_al_thutmose_tooltip_provides",
			army_tooltip = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_army_tooltip",
			province_tooltip = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_province_tooltip",
			sabotage_hint = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_sabotage_hint",
			support_hint = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_support_hint",

			conquest_tier_title = "ui_text_replacements_localised_text_phar_local_deities_favour_income_tier_",

			action_history_tooltip = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_action_history_tooltip",
			conquest_history_header = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_conquest_history_header",
			conquest_history_tooltip = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_conquest_history_tooltip",

			reinforcement_history_text = "ui_text_replacements_localised_text_phar_main_al_thutmose_ui_reinforcement_history",
		},
	},

	components = 
	{
		-- specific components we get once and manipulate (hide/show) later
		-- filled from referenced_component_ids table and accessed by name
		referenced_components = {},

		-- a place to keep the original components we use to create multiple copies
		-- filled with items from template_component_ids and accessed by name
		templates = {},

		-- a place to keep the original parents of template components, in case we need them
		-- filled with items from template_component_ids plus "_parent" and accessed by name
		templates_original_parents = {},

		-- components instantiated from the templates - 
		-- no key used, just a list. used to delete them when refreshing data
		instantiated_templates = {},
	},

	-- for things that do not require saving, but need to persist between calls
	data = 
	{
		legacy_object = nil, -- the ancient_legacy_thutmose object for this faction
		panel_component = nil,
		action_slots = {},
		map_shown = nil,
		map_data = {
			--[region_key] = 
			--{
			-- pin_component = []
			-- button_component = []
			--}
		}
	},

	-- initialization
	--{
		-- looks for components with names in ancient_legacy_thutmose.ui.config.referenced_component_ids
		-- then sets them in ancient_legacy_thutmose.ui.components.referenced_components with the same name
		init_referenced_components = function(self)
			local panel_component_pointer = core:get_ui_root():FindByScriptTag(self.config.panel_tag)
			local panel_component = UIComponent(panel_component_pointer)

			if panel_component then
				self.components.referenced_components.panel = panel_component
			else
				script_error("ERROR: ancient_legacy_thutmose " .. self.config.panel_name .. " not found!")
				-- with no root panel we can't do anything in this menu
				return
			end

			for component_id, component_name in pairs(self.config.referenced_component_ids) do
				local referenced_component = panel_component:SequentialFind(component_name)

				if referenced_component then
					self.components.referenced_components[component_id] = referenced_component
				else
					script_error("ERROR: ancient_legacy_thutmose " .. component_id .. " not found!");
				end
			end
		end,

		-- looks for components with names in ancient_legacy_thutmose.ui.config.template_component_ids
		-- then and sets them in ancient_legacy_thutmose.ui.components.templates with the same name
		init_ui_templates = function(self)
			for _, component_config in ipairs(self.config.template_component_ids) do
				local component_id = component_config.id
				local component_name = component_config.name
				-- if one component was set up, they all were
				if self.components.templates[component_id] then
					return
				end

				local template_component = self.components.referenced_components.panel:SequentialFind(component_name)

				if template_component then
					local parent_id = component_id .. "_parent"
					self.components.templates_original_parents[parent_id] = UIComponent(template_component:Parent())
					template_component:DivorceFromParent()
					self.components.templates[component_id] = template_component
				else
					script_error("ERROR: ancient_legacy_thutmose " .. component_id .. " not found!");
				end
			end
		end,

		delete_referenced_components = function(self)
			self.components.referenced_components = {}
		end,

		delete_ui_templates = function(self)
			for name, template in pairs(self.components.templates) do
				template:Destroy()
			end
			self.components.templates = {}
		end,

		delete_instanced_components = function(self)
			for name, instanced_template in pairs(self.components.instantiated_templates) do
				instanced_template:Destroy()
			end
			self.components.instantiated_templates = {}
			self.data.action_slots = {}
		end,
	--}

	-- panel open, refresh and hide all
	--{
		on_panel_opened = function(self, legacy_object)
			self.data.legacy_object = legacy_object
			self.data.local_faction_name = cm:get_local_faction_name(true)

			self:init_referenced_components()
			self:init_ui_templates()
			
			self:display_sabotage_support_values()
			self:display_resource_rewards()
			self:display_start_button()
			self:display_effects("sabotage", self.components.referenced_components.your_faction_title_sabotage)
			self:display_combined_effects()
			self:display_action_slots()

			self:display_target_details()
			self:display_target_garrison()
			self:display_reinforcements()
			self:display_effects("support", self.components.referenced_components.your_faction_title_support)

			-- in case something was left open from the last time the panel was opened
			self:hide_all_panels()
			self.components.referenced_components.cancel_button:SetVisible(false)
		end,

		on_panel_closed = function(self)
			if self.data.map_shown then
				self:hide_targets_map()
			end

			ancient_legacy_thutmose.ui:delete_ui_templates()
			ancient_legacy_thutmose.ui:delete_referenced_components()
			ancient_legacy_thutmose.ui.data = {}
			self.data.legacy_object = nil
			self.data.force_surrender_sent = nil
		end,

		refresh_ui = function(self)
			-- some events may cause the UI to refresh even though the menu is not opened
			if not self.data.legacy_object then
				return
			end

			self:delete_instanced_components()
			self:display_sabotage_support_values()
			self:display_resource_rewards()
			self:display_start_button()
			self:display_effects("sabotage", self.components.referenced_components.your_faction_title_sabotage)
			self:display_combined_effects()
			self:display_action_slots()

			self:display_target_garrison()
			self:display_target_details()
			self:display_reinforcements()
			self:display_effects("support", self.components.referenced_components.your_faction_title_support)
		end,

		hide_all_panels = function(self)
			self:hide_targets_map()
		end,

	--},

	-- displaying/hiding data about the bespoke resources - Sabotage/Native Support
	--{
		-- displays the fill bar with the actions taken and available to take
		display_sabotage_support_values = function(self)
			local sabotage_component = self.components.referenced_components.sabotage_holder
			self:display_bespoke_value(sabotage_component, self.data.legacy_object.data.sabotage_gained)
			
			local support_component = self.components.referenced_components.support_holder
			self:display_bespoke_value(support_component, self.data.legacy_object.data.native_support_gained)

			local sum_holder_component = self.components.referenced_components.sum_holder
			if sum_holder_component then
				local current_sum_text_component = sum_holder_component:SequentialFind(self.config.component_ids.sum_current_text_field)
				if current_sum_text_component then
					current_sum_text_component:SetText(self.data.legacy_object.data.sabotage_gained + self.data.legacy_object.data.native_support_gained)
				end
				local total_sum_text_component = sum_holder_component:SequentialFind(self.config.component_ids.sum_total_text_field)
				if total_sum_text_component then
					total_sum_text_component:SetText(self.data.legacy_object.config.final_sabotage_support_sum)
				end
			end

			local sabotage_bar_component = self.components.referenced_components.sabotage_bar
			if sabotage_bar_component then
				self:display_bespoke_progress_bar(sabotage_bar_component, self.data.legacy_object.data.sabotage_gained)
			end

			local support_bar_component = self.components.referenced_components.support_bar
			if support_bar_component then
				self:display_bespoke_progress_bar(support_bar_component, self.data.legacy_object.data.native_support_gained)
			end
		end,

		-- used for the large indicators in the center of the UI - for both resources
		display_bespoke_value = function(self, component, value)
			local sabotage_component = self.components.referenced_components.sabotage_holder
			if not component then
				return
			end
			local text_component = component:SequentialFind(self.config.component_ids.sabotage_support_text_field)
			if not text_component then
				return
			end

			text_component:SetText(value)
		end,

		-- used to display the bars for Sabotage and Native Support
		display_bespoke_progress_bar = function(self, bar_component, value)
			-- we get the width we would be if we have max possible value
			local parent = bar_component:Parent()
			local parent_component = UIComponent(parent);
			local total_width, height = parent_component:Dimensions()
			-- we need to decrease the width due to the docking (effectively margins at the start and end)
			local dock_x, dock_y = bar_component:GetDockOffset()
			-- one bar has negative dock, the other has positive. we are interested in the absolute value
			-- we double it because we need to decrease the element size at the start and end
			local dock_decrease = math.abs(dock_x) * 2
			total_width = total_width - dock_decrease

			-- this is the proportion of the max value we could have
			local proportion = value / self.data.legacy_object.config.final_sabotage_support_sum

			-- this should be already fixed, but just in case...
			if proportion > 1 then
				proportion = 1
			end

			local progress_size = total_width * proportion
			-- we need a minimum of 1 or the element will not display properly
			if progress_size < 1 then
				progress_size = 1
			end
			bar_component:Resize(progress_size, height)
		end,

		prepare_tier_bounds_string = function(self, index, rewards)
			local bounds_string = ""
			local final_sum = self.data.legacy_object.config.final_sabotage_support_sum
			if index < #rewards then
				local lower_bound = final_sum / 100 * rewards[index].resource_percent_needed
				local higher_bound = final_sum / 100 * rewards[index + 1].resource_percent_needed - 1
				bounds_string = " (" .. lower_bound .. "-" .. higher_bound .. ")"
			else
				-- The last reward demands 100 percent, but making sure we are still calculating it as the data can change
				local bound = final_sum / 100 * rewards[index].resource_percent_needed
				if bound == final_sum then
					bounds_string = " (" .. bound .. ")"
				else
					bounds_string = " (" .. bound .. "-" .. final_sum .. ")"
				end
			end
			return bounds_string
		end,

		display_resource_rewards = function(self)
			local cco_table = {}
			local sabotage_gained = self.data.legacy_object.data.sabotage_gained
			local sabotage_rewards = self.data.legacy_object.config.sabotage_rewards
			local _, sabotage_reward_index = self.data.legacy_object:get_reward_and_index(sabotage_gained, sabotage_rewards)
			cco_table.sabotage_reward_index = sabotage_reward_index

			for index, reward_level in ipairs(sabotage_rewards) do
				local sabotage_reward_hint = ""
				if not self.data.legacy_object.semi_persistent_data.conquered_target and (not sabotage_reward_index or index > sabotage_reward_index) then
					sabotage_reward_hint = sabotage_reward_hint .. "\n\n" .. common.get_localised_string(self.config.localization_keys.sabotage_hint)
				end

				local tooltip_string = common.get_localised_string(self.config.localization_keys.conquest_tier_title .. index) .. self:prepare_tier_bounds_string(index, sabotage_rewards) .. "||\n" .. self:get_resource_level_tooltip_string(reward_level) .. sabotage_reward_hint
				local tooltip_key = "sabotage_tooltip_" .. index
				cco_table[tooltip_key] = tooltip_string
			end
			
			local support_gained = self.data.legacy_object.data.native_support_gained
			local support_rewards = self.data.legacy_object.config.native_support_rewards
			local _, support_reward_index = self.data.legacy_object:get_reward_and_index(support_gained, support_rewards)
			cco_table.support_reward_index = support_reward_index
			common.set_context_value("thutmose_resource_rewards", cco_table)

			local native_unit_rewards = self.data.legacy_object.config.native_support_unit_rewards
			-- native_support_unit_rewards also give units, but without a target we don't know which they will be
			local target = self.data.legacy_object.semi_persistent_data.conquered_target or self.data.legacy_object.persistent.current_target
			local target_unit_rewards = target and native_unit_rewards[target]

			local tooltip_script_id = "support_tier_"
			for index, reward_level in ipairs(support_rewards) do
				local tooltip_title = common.get_localised_string(self.config.localization_keys.conquest_tier_title .. index) .. self:prepare_tier_bounds_string(index, support_rewards)
				local reward = self:get_resource_level_tooltip_string(reward_level)
				local support_holder = self.components.referenced_components.support_holder

				local support_reward_hint = ""
				if not self.data.legacy_object.semi_persistent_data.conquered_target and (not support_reward_index or index > support_reward_index) then
					support_reward_hint = support_reward_hint .. "\n\n" ..  common.get_localised_string(self.config.localization_keys.support_hint)
				end

				if not target then
					-- We need to build up a normal tooltip when we don't have a target
					local tooltip_string = tooltip_title .. "||\n"
					local no_target_for_units = common.get_localised_string(self.config.localization_keys.unit_rewards_notarget)
					tooltip_string = tooltip_string .. no_target_for_units .. "\n\n"
					tooltip_string = tooltip_string .. reward .. support_reward_hint

					local tier_element = support_holder:SequentialFind(self.config.component_ids.tier_element .. index)
					tier_element:SetTooltipText(tooltip_string, true)
				else
					local tier_element = support_holder:SequentialFind(self.config.component_ids.tier_element .. index)
					tier_element:SetTooltipText("{{tt:" .. self.config.effects_container_path .. "}}", true)

					local units_cco_table = {}
					units_cco_table.Name = tooltip_title
					if target_unit_rewards and target_unit_rewards[index] then
						self:add_units_rewards_to_cco_table(target_unit_rewards[index], units_cco_table, false)
					end
					units_cco_table.Action = reward .. support_reward_hint
					units_cco_table.support_reward_index = support_reward_index
					common.set_context_value(tooltip_script_id .. index, units_cco_table)
				end
			end
		end,

		get_resource_level_tooltip_string = function(self, reward_level)

			local tooltip_string = ""

			if reward_level.replenishment_rate then
				local replenish_bonus_str = common.get_localised_string(self.config.localization_keys.army_tooltip) .. "\n" .. common.get_localised_string(self.config.localization_keys.replenishment)
				replenish_bonus_str = string.format(replenish_bonus_str, reward_level.replenishment_rate)
				tooltip_string = tooltip_string .. replenish_bonus_str .. "\n\n"
			end

			if reward_level.resource_reward_record then
				tooltip_string = tooltip_string .. common.get_localised_string(self.config.localization_keys.provides_tooltip) .. " "
				local cost_obj = cm:create_new_custom_resource_cost()
				cost_obj:get_cost_from_record(reward_level.resource_reward_record)
				local local_faction_key = cm:get_local_faction_name(true)
				local ui_info_str = cost_obj:to_string(local_faction_key)
				if ui_info_str ~= "0" then
					tooltip_string = tooltip_string .. ui_info_str
				end
			end

			if reward_level.happiness then
				local province_header = common.get_localised_string(self.config.localization_keys.province_tooltip) .. "\n"
				local happiness_bonus_str = province_header .. common.get_localised_string(self.config.localization_keys.happiness)
				if self.data.legacy_object.persistent.current_target then
					happiness_bonus_str = province_header .. common.get_localised_string(self.config.localization_keys.happiness_param)
					local region_script_interface = cm:get_region(self.data.legacy_object.persistent.current_target)
					if (not region_script_interface) or region_script_interface:is_null_interface() then
						output("Error: Could not find Thutmose target region of '" .. self.data.legacy_object.persistent.current_target .. "'!")
						return
					end
					local province_name = region_script_interface:localised_display_name()
					happiness_bonus_str = string.format(happiness_bonus_str, province_name, reward_level.happiness)
				else
					happiness_bonus_str = string.format(happiness_bonus_str, reward_level.happiness)
				end
				tooltip_string = tooltip_string .. happiness_bonus_str
			end

			if not self.data.legacy_object.semi_persistent_data.conquered_target then
				tooltip_string = tooltip_string .. "\n\n" .. common.get_localised_string(self.config.localization_keys.post_capture_rewards_header)
			end
			return tooltip_string
		end,

		-- TODO: replace this method with proper unit list tooltip like the garrison
		get_units_reward_tooltip_string = function(self, units_table)
			local result = ""
			for index, unit_group in ipairs(units_table) do
				-- extremely placeholder
				result = result .. unit_group.amount .. " * " .. unit_group.unit_key .. "\n"
			end
			return result
		end,

		-- the units can be reinforcements in battle or mercenaries rewarded after the battle - controlled via are_reinforcements
		add_units_rewards_to_cco_table = function(self, units_table, cco_table, are_reinforcements)
			if are_reinforcements then
				cco_table.UnitsTitle = common.get_localised_string(self.config.localization_keys.unit_reinforcements_header)
			else
				cco_table.UnitsTitle = common.get_localised_string(self.config.localization_keys.unit_rewards_header)
			end
			cco_table.FactionKey = self.data.legacy_object.persistent.active_faction
			cco_table.UnitKeys = {}
			cco_table.Units = {}
			for index, unit_group in ipairs(units_table) do
				for i = 1, unit_group.amount do
					table.insert(cco_table.UnitKeys, unit_group.unit_key)
				end
			end
		end,
	--}

	-- displaying/hiding action data
	--{
		-- sets the states and interactability of the start button and dropdown 
		display_start_button = function(self)
			local has_target = self.data.legacy_object.persistent.current_target
			local start_button_component = self.components.referenced_components.start_button
			if has_target then
				start_button_component:SetState("started")
			elseif self.data.legacy_object.semi_persistent_data.conquered_target then
				start_button_component:SetState("inactive")
				local tooltip_text = common.get_localised_string(self.config.localization_keys.conquest_history_header) .. "||" .. common.get_localised_string(self.config.localization_keys.conquest_history_tooltip)
				start_button_component:SetTooltipText(tooltip_text, true)
			else
				local can_choose_target = self.data.legacy_object:can_faction_choose_target()
				if can_choose_target and self.data.legacy_object.semi_persistent_data.preliminary_target then
					local region_obj = cm:get_region(self.data.legacy_object.semi_persistent_data.preliminary_target)
					if self.data.legacy_object:can_target_be_chosen(region_obj) then
						start_button_component:SetState("active")
					else
						-- TODO: get the reason the target is not suitable and set it as tooltip
						start_button_component:SetState("inactive")
					end
				else
					start_button_component:SetState("inactive")
				end

				local tooltip_text = common.get_localised_string(self.config.localization_keys.initiate_conquest) .. "||"
				local local_faction_key = cm:get_local_faction_name(true)
				local cost_obj = self.data.legacy_object:get_choose_target_cost_obj()
				cost_obj:multiply_by(-1)
				local ui_info_str = cost_obj:to_string(local_faction_key)
				-- empty costs should be hidden
				if ui_info_str ~= "0" then 
					tooltip_text = tooltip_text .. common.get_localised_string(self.config.localization_keys.cost_tooltip) .. " " .. ui_info_str .. "\n\n"
				end
				tooltip_text = tooltip_text .. common.get_localised_string(self.config.localization_keys.choose_settlement)
				start_button_component:SetTooltipText(tooltip_text, true)
			end
		end,

		-- displays the fill bar with the actions taken and available to take
		display_action_slots = function(self)
			local action_slot_template = self.components.templates.action_slot_template
			if not action_slot_template then
				output("Error: missing action_slot_template")
				return nil
			end

			local actions_needed = ancient_legacy_thutmose.config.actions_before_culmination

			local total_width, height = self.components.referenced_components.progress_bar_background:Dimensions()

			local action_width, height = action_slot_template:Dimensions()
			-- to calculate the spacing betwen the elements we need to remove the size taken by the elements
			-- we have actions_needed, but half the start_button and culmination elements are in the bar, so we add 1
			local elements_total_width = (actions_needed + 1) * action_width
			-- this is how much of the size will be left for spacings
			local total_spacing_size = total_width - elements_total_width
			-- we have actions_needed elements in the middle of the bar, plus the start_button and culmination which are not counted
			-- this means we have a total of (actions_needed + 2) elements. Since we need one less spacings than elements we use (actions_needed + 1)
			local spacing = total_spacing_size / (actions_needed + 1)
			self.components.referenced_components.actions_holder:SetSpacing(spacing, 0)

			local taken_action_wrappers = self.data.legacy_object:get_taken_action_wrappers()
			for i = 1, actions_needed do
				-- actions not yet chosen are nil here, and this is intended
				local action_wrapper = taken_action_wrappers[i]
				self:display_action_slot(action_wrapper, i)
			end

			self:display_culmination_action()

			-- we also display the progress bar between the actions
			local progress_component = self.components.referenced_components.progress_bar
			if self.data.legacy_object.persistent.current_target == nil then
				progress_component:Resize(1, height)
			else
				local taken_actions = #taken_action_wrappers
				-- we need the progress bar from the start to the first unlocked (but not taken) action, so (taken_actions + 1)
				-- when all actions are taken, the progress bar need to be the same size as total_width, thus (actions_needed + 1)
				local progress_size = total_width * (taken_actions + 1) / (actions_needed + 1)
				progress_component:Resize(progress_size, height)
			end
		end,

		-- displays an action slot along the actions fill bar
		display_action_slot = function(self, action_wrapper, index)
			local holder_component = self.components.referenced_components.actions_holder
			if not holder_component then 
				output("Could not find element '" .. self.config.referenced_component_ids.actions_holder .. "'")
				return
			end

			local new_element = nil
			
			if action_wrapper then
				-- we create an instance showing a taken action
				new_element = self:create_action_slot(holder_component, index, action_wrapper.action_obj, action_wrapper.action_type, action_wrapper.randomizer)
			else
				-- we show an empty slot - either unlocked or locked
				new_element = self:create_action_slot(holder_component, index, nil, nil, nil)

				local button_component = new_element:SequentialFind(self.config.component_ids.action_button)
				if not button_component then
					output("Could not find element '" .. self.config.component_ids.action_button .. "'")
					return
				end

				local tooltip_text = ""
				if self.data.legacy_object.semi_persistent_data.conquered_target then
					button_component:SetState("locked")
					tooltip_text = common.get_localised_string(self.config.localization_keys.conquest_history_header) .. "||" .. common.get_localised_string(self.config.localization_keys.action_history_tooltip)
				else
					tooltip_text = common.get_localised_string(self.config.localization_keys.conquest_action) .. " " .. index .. "||"
					local has_target = self.data.legacy_object.persistent.current_target
					if has_target then
						if index - 1 == #self.data.legacy_object.persistent.taken_action_wrappers then
							local actions_limit = self.data.legacy_object.config.actions_per_turn
							local actions_taken = self.data.legacy_object.persistent.actions_this_turn
							local actions_limit_reached = actions_taken ~= nil and actions_taken >= actions_limit
							if actions_limit_reached then 
								button_component:SetState("locked")
								tooltip_text = tooltip_text .. common.get_localised_string(self.config.localization_keys.actions_limit_tooltip)
							else
								button_component:SetState("unlocked")
								tooltip_text = tooltip_text .. common.get_localised_string(self.config.localization_keys.unlocked_slot_tooltip)
							end
						else
							button_component:SetState("locked")
							tooltip_text = tooltip_text .. common.get_localised_string(self.config.localization_keys.locked_slot_tooltip)
						end
					else
						button_component:SetState("locked")
						tooltip_text = tooltip_text .. common.get_localised_string(self.config.localization_keys.no_target_slot_tooltip)
					end
				end
				button_component:SetTooltipText(tooltip_text, true)
			end

			table.insert(self.components.instantiated_templates, new_element)
			
			if not ancient_legacy_thutmose.ui.data.action_slots then
				ancient_legacy_thutmose.ui.data.action_slots = {}
			end
			table.insert(ancient_legacy_thutmose.ui.data.action_slots, new_element)
		end,

		-- shows the pending actions (available for choosing) in a panel over the first empty slot (the unlocked slot)
		display_available_actions = function(self, action_slot_component)
			local flyover_element = action_slot_component:SequentialFind(self.config.component_ids.flyout_list)
			if not flyover_element then
				output("Error: flyover element '" .. self.config.component_ids.flyout_list .. "' not found")
				return
			end

			flyover_element:DestroyChildren()
			local flyover_template = self.components.templates.action_flyout
			if not flyover_template then
				return
			end

			flyover_element:SetVisible(true)

			local pending_action_wrappers = self.data.legacy_object.persistent.pending_actions

			for i = 1, #pending_action_wrappers do
				local action_obj = pending_action_wrappers[i].action_obj
				local action_type = pending_action_wrappers[i].action_type
				local randomizer = pending_action_wrappers[i].randomizer
				self:create_hover_action(flyover_element, i, action_obj, action_type, randomizer)
			end
		end,

		hide_available_actions = function(self, action_slot_component)
			if not action_slot_component then
				local slot_index = #self.data.legacy_object.persistent.taken_action_wrappers
				action_slot_component = self.data.action_slots[slot_index + 1]
			end

			local flyover_element = action_slot_component:SequentialFind(self.config.component_ids.flyout_list)
			if not flyover_element then
				return
			end

			self.data.selected_action_index = nil
			flyover_element:SetVisible(false)
		end,

		display_culmination_action = function(self)
			local culmination_component = self.components.referenced_components.culmination_button
			local conquered_target = self.data.legacy_object.semi_persistent_data.conquered_target
			local reached_culmination_key = self.data.legacy_object.persistent.reached_culmination_key
			local reached_culmination_suffix_index = 1
			if conquered_target then
				for _, taken_city in ipairs(self.data.legacy_object.persistent.taken_cities) do
					if taken_city.target_key == conquered_target then
						reached_culmination_key = taken_city.reached_culmination_key
						reached_culmination_suffix_index = taken_city.reached_culmination_suffix_index
						break
					end
				end
			end

			if not reached_culmination_key then
				local tooltip_text = ""
				if conquered_target then
					tooltip_text = common.get_localised_string(self.config.localization_keys.conquest_history_header) .. "||" .. common.get_localised_string(self.config.localization_keys.action_history_tooltip)
				else
					tooltip_text = common.get_localised_string(self.config.localization_keys.conquest_culmination) .. "||"
					if self.data.legacy_object.persistent.current_target == nil then
						tooltip_text = tooltip_text .. common.get_localised_string(self.config.localization_keys.no_target_slot_tooltip)
					else
						tooltip_text = tooltip_text .. common.get_localised_string(self.config.localization_keys.locked_slot_tooltip)
					end
				end

				-- setting the state for the tooltip to work only on this state
				culmination_component:SetState("locked_hover")
				culmination_component:SetTooltipText(tooltip_text, false)
				culmination_component:SetState("locked")

				self:display_action_type_indicator(culmination_component, nil)
				self.components.referenced_components.complete_conquest_text:SetVisible(false)
				return
			end

			local cco_table = {}
			culmination_component:SetState("unlocked_available")
			cco_table.action_key = reached_culmination_key
			local reached_culmination_obj = self.data.legacy_object:get_culmination_by_key(reached_culmination_key)
			cco_table.Name = common.get_localised_string(reached_culmination_obj.ui_data.name_localization_key)

			if not conquered_target then
				reached_culmination_suffix_index = self.data.legacy_object.persistent.reached_culmination_suffix_index
			end

			cco_table.Action = common.get_localised_string(reached_culmination_obj.ui_data.description_localization_key .. "_" .. reached_culmination_suffix_index)

			local effects_str = ""
			if reached_culmination_obj.allow_force_sally_out then
				if effects_str ~= "" then
					effects_str = effects_str .. "\n"
				end
				effects_str = effects_str .. common.get_localised_string(self.config.localization_keys.force_sally_description)
			end

			if reached_culmination_obj.allow_force_surrender then
				if effects_str ~= "" then
					effects_str = effects_str .. "\n"
				end
				effects_str = effects_str .. common.get_localised_string(self.config.localization_keys.force_surrender_description)
				if self:can_force_surrender_from_ui() then
					effects_str = effects_str .. "\n" .. common.get_localised_string(self.config.localization_keys.force_surrender_ui_description)
				end
			end

			if reached_culmination_obj.action_type == "support" then
				local culmination_provided_units = self.data.legacy_object.config.native_support_units_provided.culmination_support
				local target = self.data.legacy_object.semi_persistent_data.conquered_target or self.data.legacy_object.persistent.current_target
				local target_unit_rewards = culmination_provided_units[target]
				if target_unit_rewards then
					self:add_units_rewards_to_cco_table(target_unit_rewards, cco_table, true)
				end
			end

			cco_table.Flavor = effects_str
			cco_table.EffectBundleKey = reached_culmination_obj.instant_effect_bundle
			if not reached_culmination_obj.instant_effect_bundle and reached_culmination_obj.reinforcement_army_bundle then
				cco_table.EffectBundleKey = reached_culmination_obj.reinforcement_army_bundle
			end

			if not conquered_target then
				self.components.referenced_components.complete_conquest_text:SetVisible(true)
			end
			common.set_context_value("thutmose_culmination", cco_table)
			self:display_action_type_indicator(culmination_component, reached_culmination_obj.action_type)
		end,

		-- common method used for slots with taken actions and empty ones, instantiates a new element from the template and does some initial setup
		create_action_slot = function(self, parent_component, index, action_obj, action_type, randomizer)
			-- Using action_slot component name as script id and vice versa, one less string to worry about
			local script_id = self.config.component_ids.action_slot .. index
			local action_slot_template = self.components.templates.action_slot_template
			action_slot_template:SetProperty("script_id", script_id)

			local cco_table = self:create_action_cco_table(index, action_obj, action_type, randomizer)
			local new_action_component = UIComponent(parent_component:CreateFromComponent(action_slot_template:Address(), string.format(script_id)))
			new_action_component:SetVisible(true)
			common.set_context_value(script_id, cco_table)
			if not action_obj then
				-- this happens for empty action slots (unlocked and locked)
				return new_action_component
			end

			-- some elements have a separate action button, but all templates should display the same tooltip
			local button_component = new_action_component:SequentialFind(self.config.component_ids.action_button)
			if button_component then
				self:display_action_button_visuals(button_component, action_obj)
			else
				output("Error: action button not found!")
			end

			self:display_action_type_indicator(new_action_component, action_type)
			return new_action_component
		end,

		create_action_cco_table = function(self, index, action_obj, action_type, randomizer)
			local cco_table = {}
			cco_table.index = string.format(index)

			if not action_obj then
				return cco_table
			end

			cco_table.action_key = action_obj.action_key
			cco_table.Name = common.get_localised_string(action_obj.ui_data.name_localization_key)
			cco_table.Type, cco_table.Warning = self:get_action_cost_strings(action_obj)
			local native_unit_rewards = self.data.legacy_object.config.native_support_units_provided[action_obj.action_key]
			-- We have to show history on the city, so we have to switch targets
			local target = self.data.legacy_object.semi_persistent_data.conquered_target or self.data.legacy_object.persistent.current_target
			if native_unit_rewards then
				local target_unit_rewards = native_unit_rewards[target]
				self:add_units_rewards_to_cco_table(target_unit_rewards, cco_table, true)
			end
			cco_table.Action = common.get_localised_string(action_obj.ui_data.description_localization_key)
			cco_table.EffectBundleKey = action_obj.instant_effect_bundle
			if action_obj.instant_effect_bundle and action_obj.display_enemy_city_notification then
				cco_table.Text = common.get_localised_string(self.config.localization_keys.target_city_note)
			end

			return cco_table
		end,

		-- method for the pending actions that can be chosen, instantiates a new element from the template and does some initial setup
		create_hover_action = function(self, parent_component, index, action_obj, action_type, randomizer)
			local cco_table = self:create_action_cco_table(index, action_obj, action_type, randomizer)
			local script_id = "hover_action_" .. index
			common.set_context_value(script_id, cco_table)

			local action_template = self.components.templates.action_flyout
			action_template:SetProperty("script_id", script_id)

			local new_action_component = UIComponent(parent_component:CreateFromComponent(action_template:Address(), string.format(index)))
			new_action_component:SetVisible(true)
			local local_faction_key = cm:get_local_faction_name(true)
			if self.data.legacy_object:can_pay_for_action(local_faction_key, action_obj) then
				new_action_component:SetState("available")
			else
				new_action_component:SetState("locked")
			end
			self:display_action_button_visuals(new_action_component, action_obj)
			self:display_action_type_indicator(new_action_component, action_type)
			return new_action_component
		end,

		display_action_type_indicator = function(self, action_component, action_type)
			local indicator_component = action_component:SequentialFind(self.config.component_ids.action_type_indicator)
			if not indicator_component then
				return
			end

			if action_type then
				indicator_component:SetVisible(true)
				if action_type == "sabotage" then
					indicator_component:SetState("sabotage")
				elseif action_type == "support" then
					indicator_component:SetState("native_support")
				else
					indicator_component:SetState("balanced")
				end
			else
				indicator_component:SetVisible(false)
			end
		end,

		-- we set this directly, instead of using CCO, because it messes up ones in locked state
		display_action_button_visuals = function(self, action_button_component, action_obj)
			local image_path = action_obj.ui_data.icon_path
			if image_path then
				-- get user property icon_index, cast to number
				local icon_index_str = action_button_component:GetProperty("icon_index")
				local icon_index = tonumber(icon_index_str)
				action_button_component:SetImagePath(image_path, icon_index)
			end
		end,

		message_append = function(self, message, addition)
			if message ~= "" then
				message = message .. "\n"
			end
			message = message .. addition
			return message
		end,

		get_action_cost_strings = function(self, action_obj)
			local cost_text = ""
			local warning_text = ""
			local local_faction_key = cm:get_local_faction_name(true)
			local local_faction = cm:get_local_faction(true)
			local cost_obj = self.data.legacy_object:get_action_cost_obj(action_obj)
			if not local_faction:can_afford_resource_cost_object(cost_obj) then
				warning_text = common.get_localised_string(self.config.localization_keys.insufficient_resources_for_action)
			end
			local ui_info_str = cost_obj:to_string(local_faction, true)
			local cost_visible = false
			-- empty costs should be hidden
			if ui_info_str ~= "0" then
				cost_visible = true
				cost_text = common.get_localised_string(self.config.localization_keys.cost_tooltip) .. " " .. ui_info_str
			end

			local gain_obj = self.data.legacy_object:get_action_gain_obj(action_obj)
			if gain_obj then
				ui_info_str = gain_obj:to_string(local_faction_key)
				-- empty gains should be hidden
				if ui_info_str ~= "0" then
					if cost_visible then
						-- new line breaks the template so I am adding spaces
						cost_text = cost_text .. "    "
					end
					cost_text = cost_text .. common.get_localised_string(self.config.localization_keys.provides_tooltip) .. " " .. ui_info_str
				end
			end

			return cost_text, warning_text
		end,
	--}

	-- displaying/hiding map and possible targets
	--{
		display_targets_map = function(self)
			if self.data.map_shown then
				return
			end
			self.components.referenced_components.target_city:SetState("default")
			if not self.data.legacy_object.persistent.current_target
				and not self.data.legacy_object.semi_persistent_data.preliminary_target
				and not self.data.legacy_object.semi_persistent_data.conquered_target
			then
				self.components.referenced_components.no_target_flavour_text:SetVisible(true)
			end
			self:process_valid_targets_visuals()
			self:attach_map_node_listener()
			self.components.referenced_components.map_holder:SetVisible(true)
			self.components.referenced_components.city_holder:SetState("expanded")
			self.components.referenced_components.padding_1:SetState("expanded")
			self.components.referenced_components.padding_2:SetState("expanded")
			self.components.referenced_components.cancel_button:SetVisible(true)

			cm:steal_escape_key_with_callback(
				"hide_thutmose_map",
				function()
					self:hide_targets_map()
				end
			);
			self.data.map_shown = true
		end,

		process_valid_targets_visuals = function(self)
			if not self.data.map_data then
				self.data.map_data = {}
			end
			local active_faction_key = self.data.legacy_object.persistent.active_faction
			local map_component = self.components.referenced_components.map_holder
			local pin_count = map_component:ChildCount()
			local has_target = (self.data.legacy_object.persistent.current_target ~= nil)
			self.components.referenced_components.targets_list:SetVisible(not has_target)

			local pins = {}
			-- we make sure the pins are in the self.data.map_data helper table
			-- and add them to the pins to check later for pins without a valid target
			for i = 0, pin_count - 1 do
				local uic_child = UIComponent(map_component:Find(i))
				local pin_name = uic_child:Id()
				-- we remove the prefix part
				local region_name = string.sub(pin_name, #self.config.pin_component_prefix + 1)
				if not self.data.map_data[region_name] then
					self.data.map_data[region_name] = 
					{
						pin_component = uic_child,
					}
				end
				pins[region_name] = self.data.map_data[region_name]
			end

			-- we get the valid targets and sort them alphabetically as designers requested
			local valid_targets = self.data.legacy_object:get_valid_target_regions(true)
			-- TODO: check if we need to sort them in C as this may not handle utf8 properly
			valid_targets = table_stable_sort(valid_targets, function(region_a, region_b)
				local name_a = region_a:localised_display_name()
				local name_b = region_b:localised_display_name()
				return tostring(name_a) < tostring(name_b)
			end)
			-- we match regions with pins, and create the buttons for them
			for k, region_interface in ipairs(valid_targets) do
				if not region_interface:is_null_interface() then
					local region_name = region_interface:name()
					local map_data_region = self.data.map_data[region_name]
					if map_data_region then
						local pin_component = map_data_region.pin_component
						local target_button_component = self:get_target_button(region_interface)
						map_data_region.button_component = target_button_component
						-- we mark the pin as processed, so we can see any pins left over unprocessed
						pins[region_name] = nil

						if region_interface:owning_faction():name() == active_faction_key then
							if region_name == self.data.legacy_object.semi_persistent_data.preliminary_target then
								target_button_component:SetState("completed_selected")
								pin_component:SetState("completed_selected")
							else
								target_button_component:SetState("completed")
								pin_component:SetState("completed")
							end
						elseif region_name == (self.data.legacy_object.semi_persistent_data.interacted_target
							or self.data.legacy_object.persistent.current_target
							or self.data.legacy_object.semi_persistent_data.preliminary_target)
						then
							if region_interface:is_abandoned() then
								pin_component:SetState("ruined_selected")
							else
								pin_component:SetState("selected")
							end
							target_button_component:SetState("selected")
						else
							if region_interface:is_abandoned() then
								pin_component:SetState("ruined")
							else
								pin_component:SetState("default")
							end
							target_button_component:SetState("default")
						end

						if region_interface:is_abandoned() then
							target_button_component:SequentialFind(self.config.component_ids.city_name):SetState("greyed_out")
						end
					else
						output("ERROR: valid target '" .. region_name .. "' does not have a pin in the UI!!")
					end
				end
			end

			for region_key, valid_target in pairs(pins) do
				output("ERROR: pin '" .. region_key .. "' is not a valid target for Thutmose!!")
			end
		end,

		populate_garrison_size = function(self, garrison_holder_component, region_interface)
			local garrison_count = garrison_holder_component:SequentialFind(self.config.component_ids.garrison)
			if not garrison_count then
				output("Could not find '" .. self.config.component_ids.garrison .. "' component in garrison holder")
				return
			end
			local local_faction = cm:get_faction(self.data.legacy_object.persistent.active_faction)
			local garrison_interface = region_interface:garrison_residence()
			if local_faction:is_garrison_residence_position_visible_to_shroud(garrison_interface) == false then
				garrison_count:SetText("?")
			else
				local garrison_size = 0;
				local garrison_force = cm:get_armed_citizenry_from_garrison(garrison_interface)
				if garrison_force then
					garrison_size = garrison_force:unit_list():num_items()
				end
				garrison_count:SetText(garrison_size)
			end
		end,

		get_target_button = function(self, region_inerface)
			if not self.data.map_data then
				self.data.map_data = {}
			end

			if self.data.map_data[region_inerface:name()] 
				and self.data.map_data[region_inerface:name()].button_component 
			then
				return self.data.map_data[region_inerface:name()].button_component
			end

			local template_city_entry = self.components.templates.template_city_entry
			if not template_city_entry then
				return
			end

			local template_city_entry_parent = self.components.templates_original_parents.template_city_entry_parent
			if not template_city_entry_parent then
				return
			end

			local new_component_name = self.config.button_component_prefix .. string.format(region_inerface:name())
			local new_target_component = UIComponent(template_city_entry_parent:CreateFromComponent(template_city_entry:Address(), new_component_name))
			self:populate_garrison_size(new_target_component, region_inerface)
			local settlement_script_interface = region_inerface:settlement()
			local cqi_string = tostring(settlement_script_interface:command_queue_index())
			new_target_component:SetContextObject(cco("CcoCampaignSettlement", cqi_string))
			return new_target_component
		end,

		attach_map_node_listener = function(self)
			core:add_listener(
				"thutmose_panel_clicked_on_node",
				"ComponentLClickUp",
				function(context)
					return string.starts_with(context.string, self.config.pin_component_prefix)
				end,
				function(context)
					if self.data.legacy_object.persistent.current_target then
						-- if we already have a target we don't choose a new target
						return
					end

					-- we remove the prefix part of the name
					local region_name = string.sub(context.string, #self.config.pin_component_prefix + 1)
					ancient_legacy_thutmose.ui:on_target_changed(region_name)
				end,
				true
			)

			core:add_listener(
				"thutmose_panel_clicked_on_button",
				"ComponentLClickUp",
				function(context)
					return string.starts_with(context.string, self.config.button_component_prefix)
				end,
				function(context)
					if self.data.legacy_object.persistent.current_target then
						-- if we already have a target we don't choose a new target
						return
					end

					-- we remove the prefix part of the name
					local region_name = string.sub(context.string, #self.config.button_component_prefix + 1)
					ancient_legacy_thutmose.ui:on_target_changed(region_name)
				end,
				true
			)
		end,

		hide_targets_map = function(self, confirm_selection)
			if not self.data.map_shown then
				return
			end

			if confirm_selection then
				self.data.legacy_object.semi_persistent_data.preliminary_target = self.data.legacy_object.semi_persistent_data.interacted_target
			end
			self.data.legacy_object.semi_persistent_data.interacted_target = nil
			self:display_target_details()

			if not self.data.legacy_object.persistent.current_target
				and not self.data.legacy_object.semi_persistent_data.preliminary_target
				and not self.data.legacy_object.semi_persistent_data.conquered_target
			then
				self.components.referenced_components.target_city:SetState("no_target")
				self.components.referenced_components.no_target_flavour_text:SetVisible(false)
			end

			self.components.referenced_components.map_holder:SetVisible(false)
			self.components.referenced_components.targets_list:SetVisible(false)
			self.components.referenced_components.city_holder:SetState("default")
			self.components.referenced_components.padding_1:SetState("collapsed")
			self.components.referenced_components.padding_2:SetState("collapsed")
			core:remove_listener("thutmose_panel_clicked_on_node")
			core:remove_listener("thutmose_panel_clicked_on_button")
			cm:release_escape_key_with_callback("hide_thutmose_map")
			self.data.map_shown = nil
			self.components.referenced_components.cancel_button:SetVisible(false)
			self:display_start_button()
		end,
	--}

	-- displaying/hiding other data
	--{
		display_target_details = function(self)
			-- we check if there is a locked or unlocked target to show
			local shown_target_key = self.data.legacy_object.persistent.current_target
			if shown_target_key then
				self.components.referenced_components.expand_button:SetState("inactive")
				-- It seems it is more consistent to set text to change_inactve as we have a target shown
				self.components.referenced_components.expand_button_text:SetState("change_inactive")
				self.components.referenced_components.zoom_button:SetVisible(true)
			else
				shown_target_key = self.data.legacy_object.semi_persistent_data.interacted_target 
					or self.data.legacy_object.semi_persistent_data.preliminary_target
					or self.data.legacy_object.semi_persistent_data.conquered_target

				if not shown_target_key then
					-- we don't have preliminary_target either
					-- we could check if we have valid targets by calling self.data.legacy_object:get_valid_target_regions()
					-- but I think it's better for the player to be able to open the list and see for themselves
					self.components.referenced_components.expand_button_text:SetState("select_active")
					self.components.referenced_components.zoom_button:SetVisible(false)
				else
					self.components.referenced_components.expand_button_text:SetState("change_active")
					self.components.referenced_components.zoom_button:SetVisible(true)
				end
				self.components.referenced_components.expand_button:SetState("active")
			end

			local region_obj = shown_target_key and cm:get_region(shown_target_key)
			local target_name_component = self.components.referenced_components.target_name_text
			local owner_holder_comp = self.components.referenced_components.target_owner_holder
			local target_city_comp = self.components.referenced_components.target_city
			if region_obj and (not region_obj:is_null_interface()) then
				-- we do not check if the target is valid here - we depend on it being removed on events
				local owner_faction = region_obj:owning_faction()
				if owner_holder_comp then
					if owner_faction
						and (not owner_faction:is_null_interface())
						and (not region_obj:is_abandoned())
					then
						target_city_comp:SetState("default")
						owner_holder_comp:SetVisible(true)
						local cqi_string = tostring(region_obj:settlement():command_queue_index())
						-- providing cco settlement for faction cco to be able to properly handle rebels
						owner_holder_comp:SetContextObject(cco("CcoCampaignSettlement", cqi_string))
					else
						owner_holder_comp:SetVisible(false)
					end
				end

				if target_name_component then
					local string_key = "regions_onscreen_" .. region_obj:name()
					local localized_string = common.get_localised_string(string_key)
					target_name_component:SetText(localized_string)
					if region_obj:is_abandoned() then
						target_name_component:SetState("greyed_out")
					else
						target_name_component:SetState("default")
					end
				end
				self.components.referenced_components.no_target_flavour_text:SetVisible(false)
			else
				target_city_comp:SetState("no_target")
				if target_name_component then
					target_name_component:SetText("----")
				end
				if owner_holder_comp then
					owner_holder_comp:SetVisible(false)
				end
			end

			self:display_target_happiness(shown_target_key)
			local has_target = (self.data.legacy_object.persistent.current_target ~= nil)
			self.components.referenced_components.abandon_button:SetVisible(has_target)
		end,

		display_target_happiness = function(self, target_region_key)
			self.components.referenced_components.selected_settlement_ruins:SetVisible(false)
			self.components.referenced_components.settlement_ruins_flavour_text:SetVisible(false)
			local public_order_component = self.components.referenced_components.public_order_holder
			if not public_order_component then 
				return
			end

			if not target_region_key then
				public_order_component:SetVisible(false)
				return
			end

			local region_obj = cm:get_region(target_region_key)
			if not region_obj or region_obj:is_null_interface() or region_obj:is_abandoned() then
				if region_obj:is_abandoned() then
					self.components.referenced_components.selected_settlement_ruins:SetVisible(true)
					self.components.referenced_components.settlement_ruins_flavour_text:SetVisible(true)
				end

				public_order_component:SetVisible(false)
				return
			end

			public_order_component:SetVisible(true)
			public_order_component:InterfaceFunction("set_cco_campaign_faction_province_manager", target_region_key)
			self:populate_garrison_size(public_order_component, region_obj)
		end,

		display_target_garrison = function(self)
			-- here we setup the data, on_garrison_interacted later just shows/hides it

			local garrison_count_holder = self.components.referenced_components.garrison_count_holder
			local count_text_component = garrison_count_holder:SequentialFind(self.config.component_ids.units_count)
			if not count_text_component then
				output("Could not find '" .. self.config.component_ids.units_count .. "' component in garrison")
				return
			end

			local number_of_revealed_units = self.data.legacy_object:get_number_of_revealed_garrion_units()
			if number_of_revealed_units <= 0 then
				self.components.referenced_components.garrison_holder:SetVisible(false)
				return
			end

			self.components.referenced_components.garrison_holder:SetVisible(true)
			local target_region_interface = cm:get_region(self.data.legacy_object.persistent.current_target)
			if not target_region_interface or target_region_interface:is_null_interface() then
				output("Could not find target region of " .. self.data.legacy_object.persistent.current_target)
				return
			end

			local current_target_garrison = target_region_interface:garrison_residence()
			local garrison_force = cm:get_armed_citizenry_from_garrison(current_target_garrison)
			if not garrison_force or garrison_force:is_null_interface() then
				output("No garrison found for " .. self.data.legacy_object.persistent.current_target)
				return
			end
			local units_list = garrison_force:unit_list()

			local garrison_holder = self.components.referenced_components.garrison_holder
			local units_list_component = garrison_holder:SequentialFind(self.config.component_ids.units_holder)
			if not units_list_component then
				output("Could not find unit holder component")
				return
			end

			local unit_card_template = self.components.templates.unit_card_template

			local garrison_size = units_list:num_items()
			count_text_component:SetText(garrison_size)
			for i = 0, units_list:num_items() - 1 do
				local current_unit = units_list:item_at(i);

				local new_card_component = UIComponent(units_list_component:CreateFromComponent(unit_card_template:Address(), string.format(i)))
				if number_of_revealed_units >= i then
					new_card_component:InterfaceFunction("set_unit", current_unit:unit_key())
				end
				new_card_component:SetVisible(true)
				table.insert(self.components.instantiated_templates, new_card_component)
			end
		end,

		display_reinforcements = function(self)
			-- here we setup the data, on_reinforcements_interacted later just shows/hides it

			local has_reinfocements = false
			local reinforcements_count_holder = self.components.referenced_components.reinforcement_count_holder
			local count_text_component = reinforcements_count_holder:SequentialFind(self.config.component_ids.units_count)
			if not count_text_component then
				output("Could not find '" .. self.config.component_ids.units_count .. "' component in reinforcements")
				return
			end

			local used_up_army = self.data.legacy_object.data.used_up_army
			local reinforcing_army = self.data.legacy_object.data.reinforcing_army
			if ((not reinforcing_army) or (#reinforcing_army <= 0))
				and ((not used_up_army) or (#used_up_army <= 0))
			then
				-- there are no armies to show, either ready to reinforce nor already used up
				count_text_component:SetText(0)
			end

			local reinforcement_holder = self.components.referenced_components.reinforcement_holder
			local units_list_component = reinforcement_holder:SequentialFind(self.config.component_ids.units_list)
			if not units_list_component then
				output("Could not find unit list component in reinforcements")
				return
			end

			local spawned_indicator = self.components.referenced_components.already_spawned_indicator
			if self.data.legacy_object.semi_persistent_data.conquered_target then 
				spawned_indicator:SetText(common.get_localised_string(self.config.localization_keys.reinforcement_history_text))
				spawned_indicator:SetVisible(true)
			elseif self.data.legacy_object.data.used_up_army
				and not is_empty_table(self.data.legacy_object.data.used_up_army)
			then
				local already_spawned_text
				if self.data.legacy_object.data.reinforcing_army
					and not is_empty_table(self.data.legacy_object.data.reinforcing_army)
				then
					already_spawned_text = common.get_localised_string(self.config.localization_keys.some_already_spawned)
				else
					already_spawned_text = common.get_localised_string(self.config.localization_keys.already_spawned)
				end
				
				-- we also show it in the panel itself
				if spawned_indicator then
					-- we show it in the title plate
					spawned_indicator:SetText(already_spawned_text)
					spawned_indicator:SetVisible(true)
				end
			else
				if spawned_indicator then
					spawned_indicator:SetVisible(false)
				end
			end

			local unit_card_template = self.components.templates.unit_card_template

			for _, element in ipairs(used_up_army) do
				for i = 1, element.amount do
					local new_card_component = UIComponent(units_list_component:CreateFromComponent(unit_card_template:Address(), string.format(i)))
					new_card_component:InterfaceFunction("set_unit", element.unit_key)
					new_card_component:SetVisible(true)
					new_card_component:SetState("locked")
					table.insert(self.components.instantiated_templates, new_card_component)
					has_reinfocements = true
				end
			end

			local reinforcement_units_count = 0
			for _, element in ipairs(reinforcing_army) do
				reinforcement_units_count = reinforcement_units_count + element.amount
				for i = 1, element.amount do
					local new_card_component = UIComponent(units_list_component:CreateFromComponent(unit_card_template:Address(), string.format(i)))
					new_card_component:InterfaceFunction("set_unit", element.unit_key)
					new_card_component:SetVisible(true)
					table.insert(self.components.instantiated_templates, new_card_component)
					has_reinfocements = true
				end
			end

			count_text_component:SetText(reinforcement_units_count)

			local reinforcements_empty_indicator = self.components.referenced_components.reinforcements_empty_indicator
			reinforcements_empty_indicator:SetVisible(not has_reinfocements)

			local separator = reinforcement_holder:SequentialFind(self.config.component_ids.list_separator)
			-- if we have reinforcements, we will have support actions chosen, so we can draw the line
			separator:SetVisible(has_reinfocements)
		end,

		display_effects = function(self, effect_type, list_title)
			local list_component = UIComponent(list_title:Parent())

			local has_effects = false
			local taken_action_wrappers = self.data.legacy_object:get_taken_action_wrappers()
			-- here we setup the data, on_effects_interacted later just shows/hides it
			for index, taken_action_wrapper in ipairs(taken_action_wrappers) do
				if taken_action_wrapper.action_type == effect_type or taken_action_wrapper.action_type == "balanced" then
					local script_id = "thutmose_effect_" .. index
					local cco_table = self:create_action_cco_table(index, taken_action_wrapper.action_obj, taken_action_wrapper.action_type, taken_action_wrapper.randomizer)
					-- the panel is a bit different from the tooltip, so it needs some extra work

					local new_instanced_template_component = core:get_or_create_component(script_id, ancient_legacy_thutmose.ui.config.effects_container_path, list_component)
					table.insert(self.components.instantiated_templates, new_instanced_template_component)
					new_instanced_template_component:SetProperty("script_id", script_id)
					common.set_context_value(script_id, cco_table)
					has_effects = true
				end
			end

			local reached_culmination_key = self.data.legacy_object.persistent.reached_culmination_key
			if reached_culmination_key then
				local script_id = "thutmose_culmination"
				local new_instanced_template_component = core:get_or_create_component(script_id, ancient_legacy_thutmose.ui.config.effects_container_path, list_component)
				table.insert(self.components.instantiated_templates, new_instanced_template_component)
				-- this will not display properly if this is called after display_culmination_action(...), so if something breaks - checkl the order
				new_instanced_template_component:SetProperty("script_id", script_id)
				has_effects = true
			end

			if effect_type == "sabotage" then
				local effects_empty_indicator = self.components.referenced_components.effects_empty_indicator
				effects_empty_indicator:SetVisible(not has_effects)
			end
		end,

		display_combined_effects = function(self)
			effects_left_holder = self.components.referenced_components.effects_left_holder
			local effects_list_component = effects_left_holder:SequentialFind(self.config.component_ids.effects_list)
			if not effects_list_component then
				output("Could not find effects list component")
				return
			end

			-- will populate effects in this bundle, they should be automatically combined by the category
			local combined_custom_effect_bundle = nil

			local taken_action_wrappers = self.data.legacy_object:get_taken_action_wrappers()
			local index = 0
			for _, taken_action_wrapper in ipairs(taken_action_wrappers) do
				local bundle = taken_action_wrapper.action_obj.instant_effect_bundle
				if bundle ~= "" then
					if not combined_custom_effect_bundle then
						combined_custom_effect_bundle = cm:create_new_custom_effect_bundle(bundle)
						if combined_custom_effect_bundle:is_null_interface() then
							output("Error: Unable to init combined custom effect bundle from bundle" .. tostring(bundle))
						end
					else
						local temp_custom_effect_bundle = cm:create_new_custom_effect_bundle(bundle)
						if temp_custom_effect_bundle and not temp_custom_effect_bundle:is_null_interface() then
							for i = 0, temp_custom_effect_bundle:effects():num_items() - 1 do
								local effect = temp_custom_effect_bundle:effects():item_at(i)
								combined_custom_effect_bundle:add_effect(effect:key(), effect:scope(), effect:value())
							end
						else
							output("Error: Unable to find effect bundle" .. tostring(bundle))
						end
					end
				end
			end

			local has_effects = false
			if combined_custom_effect_bundle and not combined_custom_effect_bundle:is_null_interface() then
				local new_effect_component = core:get_or_create_component("effect_bundles_template", ancient_legacy_thutmose.ui.config.effect_bundle_container_path, effects_list_component)
				table.insert(self.components.instantiated_templates, new_effect_component)

				effects_list_component:InterfaceFunction("set_cco_effect_bundle_from_custom_bundle", combined_custom_effect_bundle)
				has_effects = true
			end

			local separator = effects_left_holder:SequentialFind(self.config.component_ids.list_separator)
			separator:SetVisible(has_effects)
		end,
	--}

	-- handling user interaction with UI elements
	--interaction = 
	--{
		-- returns if the target was successfully set
		on_target_changed = function(self, new_region_key)
			local region_interface = cm:get_region(new_region_key)
			if not region_interface or region_interface:is_null_interface() then
				return false
			end
			local active_faction_key = self.data.legacy_object.persistent.active_faction

			if region_interface:owning_faction():name() == active_faction_key then
				self.data.legacy_object.semi_persistent_data.conquered_target = new_region_key
			else
				self.data.legacy_object.semi_persistent_data.conquered_target = nil
			end

			self.data.legacy_object.semi_persistent_data.interacted_target = new_region_key
			self.data.legacy_object:refresh_cached_data()
			self:delete_instanced_components()
			self:display_sabotage_support_values()
			self:display_resource_rewards()
			self:display_effects("sabotage", self.components.referenced_components.your_faction_title_sabotage)
			self:display_target_garrison()
			self:display_reinforcements()
			self:display_effects("support", self.components.referenced_components.your_faction_title_support)
			self:display_action_slots()
			self:display_combined_effects()

			self:process_valid_targets_visuals()
			self:display_target_details()
			return true
		end,

		zoom_to_target = function(self)
			local shown_target_key = self.data.legacy_object.persistent.current_target
			if not shown_target_key then
				shown_target_key = self.data.legacy_object.semi_persistent_data.preliminary_target 
				or self.data.legacy_object.semi_persistent_data.conquered_target
				or self.data.legacy_object.semi_persistent_data.interacted_target
			end
			local region_obj = cm:get_region(shown_target_key)
			if (not region_obj) or region_obj:is_null_interface() then
				script_error("Missing region for key " .. shown_target_key)
				return
			end

			self.components.referenced_components.panel:InterfaceFunction("close_panel")
			cm:scroll_camera_to_settlement(shown_target_key)
		end,

		on_target_confirmed = function(self, params)
			-- if we already have a target we can't confirm it twice
			if self.data.legacy_object.persistent.current_target then
				return
			end

			local preliminary_target = self.data.legacy_object.semi_persistent_data.preliminary_target
			-- if we don't have a preliminary_target we can't confirm it
			if not preliminary_target then
				return
			end

			local region_obj = cm:get_region(preliminary_target)
			if (not region_obj) or region_obj:is_null_interface() then
				script_error("Missing region for key " .. preliminary_target)
				return
			end

			local can_choose_target = self.data.legacy_object:can_faction_choose_target()
			local target_is_valid = self.data.legacy_object:can_target_be_chosen(region_obj)
			if (not can_choose_target) or (not target_is_valid) then
				return
			end

			local description_source = self.config.localization_keys.confirm_target_body
			local description_localised = common:get_localised_string(description_source)
			local title_source = self.config.localization_keys.confirm_target_title
			local title_localised = common:get_localised_string(title_source)

			create_confirmation_box_with_text_from_script(
				"thutmose_confirm_target_prompt",
				description_localised,
				description_source,
				--Confirm
				function()
					self.components.referenced_components.start_button:SetState("started")

					local local_faction_name = self.data.local_faction_name
					local local_faction_obj = cm:get_faction(local_faction_name)
					local local_faction_cqi = local_faction_obj:command_queue_index()
		
					local param_str = "thutmose_action:choose_target_region:" .. local_faction_name .. ":" .. preliminary_target
					CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, param_str)
				end,
				--Cancel
				function()
					self.components.referenced_components.start_button:SetState("active")
				end,
				nil, title_localised, title_source
			)
		end,

		on_target_abandoned = function(self, params)
			if not self.data.legacy_object.persistent.current_target then
				-- no target, this should not even be called
				return
			end

			-- perhaps not call for confirmation if there is no progress
			create_confirmation_box(
				"thutmose_abandon_target_prompt",
				self.config.localization_keys.abandon_target_prompt,
				function()
					local calling_faction_key = self.data.legacy_object.persistent.active_faction
					local local_faction_obj = cm:get_faction(calling_faction_key)
					local local_faction_cqi = local_faction_obj:command_queue_index()

					local param_str = "thutmose_action:abandon_target_region:" .. calling_faction_key
					CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, param_str)
			end
			)
		end,

		-- these are the always visible elements on the progress bar
		on_action_slot_interacted = function(self, params)
			if self.data.legacy_object.semi_persistent_data.conquered_target then
				return
			end
			local index_str = params[1]
			local slot_index = tonumber(index_str)

			local action_slot_component = self.data.action_slots[slot_index]

			if self.data.selected_action_index then
				local old_active_index = self.data.selected_action_index
				local old_action_slot_component = self.data.action_slots[old_active_index]
				self:hide_available_actions(old_action_slot_component)

				-- selecting the same slot twice deselects it, otherwise we select the new one
				if old_active_index == slot_index or not slot_index then
					return
				end
			end

			self.data.selected_action_index = slot_index

			if slot_index == #self.data.legacy_object.persistent.taken_action_wrappers + 1 then
				self:display_available_actions(action_slot_component)
			end
		end,

		-- these are the potential actions that appear over the unlocked action slot
		on_flyover_action_interacted = function(self, params)
			local action_index = params[1]
			local slot_index = #self.data.legacy_object.persistent.taken_action_wrappers
			local component = ancient_legacy_thutmose.ui.data.action_slots[slot_index + 1]
			ancient_legacy_thutmose.ui:hide_available_actions(component)
			local local_faction_name = self.data.local_faction_name
			local local_faction_obj = cm:get_faction(local_faction_name)
			local local_faction_cqi = local_faction_obj:command_queue_index()

			local param_str = "thutmose_action:take_action:" .. local_faction_name .. ":" .. action_index
			CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, param_str)
		end,

		can_force_surrender_from_ui = function(self)
			local reached_culmination_key = self.data.legacy_object.persistent.reached_culmination_key
			if not reached_culmination_key then
				return false
			end

			local reached_culmination_obj = self.data.legacy_object:get_culmination_by_key(reached_culmination_key)
			if not reached_culmination_obj.allow_force_surrender then
				return false
			end
			
			local local_faction_obj = cm:get_faction(self.data.legacy_object.persistent.active_faction)
			local region_script_interface = cm:get_region(self.data.legacy_object.persistent.current_target)
			local owning_faction = region_script_interface:owning_faction()

			if owning_faction and local_faction_obj:at_war_with(owning_faction) then
				-- if you are at war with the target faction you need to siege the settlement to force surrender
				return false
			end

			-- you can only force surrender if you are a peace with them (and have the allow_force_surrender culmination)
			return true
		end,

		on_culmination_interacted = function(self, params)
			if self.data.force_surrender_sent then
				return
			end

			if not self.data.legacy_object then
				-- this can happen when the on_panel_closed is called but the culmination component is still shown and is clicked
				return
			end

			if not self:can_force_surrender_from_ui() then
				return
			end

			local local_faction_obj = cm:get_faction(self.data.legacy_object.persistent.active_faction)
			local local_faction_cqi = local_faction_obj:command_queue_index()
			CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "thutmose_action:force_surrender")
			-- we want to prevent the UI from sending the event twice with all the issues coming from that
			-- so we mark that the event is sent already
			self.data.force_surrender_sent = true
			-- we close this menu and take you to look at your new possession
			self:zoom_to_target()
			-- open some event?
		end,

		-- show/hide the garrison units
		on_garrison_interacted = function(self)
			local number_of_revealed_units = self.data.legacy_object:get_number_of_revealed_garrion_units()
			if number_of_revealed_units <= 0 then
				return
			end

			local garrison_holder = self.components.referenced_components.garrison_holder
			local units_list_component = garrison_holder:SequentialFind(self.config.component_ids.units_holder)
			if not units_list_component then
				output("Could not find unit holder component in garrison")
				return
			end

			if self.data.shown_garrison == nil then
				self.data.shown_garrison = false
			end
			self.data.shown_garrison = not self.data.shown_garrison
			units_list_component:SetVisible(self.data.shown_garrison)
		end,

		-- show/hide the reinforcing army units, the setup itself is in display_reinforcements
		on_reinforcements_interacted = function(self)
			local reinforcement_holder = self.components.referenced_components.reinforcement_holder
			local units_list_component = reinforcement_holder:SequentialFind(self.config.component_ids.units_holder)
			if not units_list_component then
				output("Could not find unit holder component in reinforcements")
				return
			end

			if self.data.shown_reinforcement == nil then
				self.data.shown_reinforcement = false
			end
			self.data.shown_reinforcement = not self.data.shown_reinforcement
			units_list_component:SetVisible(self.data.shown_reinforcement)
		end,

		-- show/hide the effects
		on_effects_interacted = function(self)
			local effects_holder = self.components.referenced_components.effects_holder
			if not effects_holder then
				return
			end

			if self.data.shown_effects == nil then
				self.data.shown_effects = false
			end
			self.data.shown_effects = not self.data.shown_effects
			effects_holder:SetVisible(self.data.shown_effects)
		end,
	--},

	-- cheat_interactions - handling user interaction with Dev UI elements (cheat buttons)
	--{
	--},
}

-- ThutmoseButton_ContextTriggerEvent
-- interactions with menu buttons - local events, not model changes, so no need to be MP safe
core:add_listener (
	"ThutmoseButton_ContextTriggerEvent",
	"ContextTriggerEvent",
	function(context)
		return context.string:split(":")[1] == "ThutmoseButton"
	end,
	function(context)
		local params = context.string:split(":")
		local button_key = params[2]
		table.remove(params, 1)
		table.remove(params, 1)
		if button_key == "ActionSlotInteracted" then
			ancient_legacy_thutmose.ui:on_action_slot_interacted(params)
		elseif button_key == "ActionInteracted" then
			ancient_legacy_thutmose.ui:on_flyover_action_interacted(params)
		elseif button_key == "CulminationInteracted" then
			ancient_legacy_thutmose.ui:on_culmination_interacted(params)
		elseif button_key == "ToggleMap" then
			if ancient_legacy_thutmose.ui.data.map_shown then
				local confirm_choice = params[1] == "confirm_target"
				ancient_legacy_thutmose.ui:hide_targets_map(confirm_choice)
			else
				ancient_legacy_thutmose.ui:display_targets_map(params)
			end
		elseif button_key == "TargetConfirmed" then
			ancient_legacy_thutmose.ui:on_target_confirmed(params)
		elseif button_key == "TargetAbandon" then
			ancient_legacy_thutmose.ui:on_target_abandoned(params)
		elseif button_key == "ZoomToTarget" then
			ancient_legacy_thutmose.ui:zoom_to_target(params)
		elseif button_key == "ToggleGarrisonUI" then
			ancient_legacy_thutmose.ui:on_garrison_interacted(params)
		elseif button_key == "ToggleReinforcementsUI" then
			ancient_legacy_thutmose.ui:on_reinforcements_interacted(params)
		elseif button_key == "ToggleEffectsUI" then
			ancient_legacy_thutmose.ui:on_effects_interacted(params)
		else
			output("Error: unknown button '".. button_key .. "'")
		end
	end,
	true
)