
journal_victory_objective_ui = {
	config = {
		journal_panel_name = "journal",

		-- TODO: delete this after all the configuration is setup
		default_category = {
			title_key = "campaign_localised_strings_string_phar_main_victory_objectives_category_conquest",
			priority = 0,
			total_victory_points = 100
		},

		buildings_category = victory_objectives_ui_categories.victory_objectives_category_buildings,

		categories_without_objectives = {
			-- amibtions_category
			victory_objectives_ui_categories.victory_objectives_category_ambitions,
		},

		condition_types_description_key = {
			["building_based_objectives"] = "building_based_objectives_description",
		},

		templates_id = {
			objective_prefix = "victory_objective_instance_"
		},

		conditions_texts = {
			click_to_zoom = "tooltip_victory_objective_zoom_to_location"
		},

		texts = {
			undiscovered = "campaign_localised_strings_string_victory_objectives_category_undiscovered_amount",
			category_locked_warning = "campaign_localised_strings_string_victory_objectives_category_locked_warning",
			multiplayer_h2h = "campaign_localised_strings_string_victory_objectives_h2h_destroy_enemy"
		}
	},

	template_components = {
		template_category_component = nil,
		template_category_no_objectives = nil
	},

	add_listeners = function(self)
		core:add_listener(
			"journal_panel_opened",
			"PanelOpenedCampaign",
			function(context)
				return context.string == self.config.journal_panel_name
			end,
			function(context)
				local journal_component = core:get_ui_root():SequentialFind(self.config.journal_panel_name)
				local victory_objectives_component = journal_component:SequentialFind("victory_objectives")

				self.template_components.template_category_component = victory_objectives_component:SequentialFind("template_category")
				self.template_components.template_category_component:DivorceFromParent()

				self.template_components.template_category_no_objectives = victory_objectives_component:SequentialFind("template_category_no_objectives")
				self.template_components.template_category_no_objectives:DivorceFromParent()

				if cm:model():campaign_type_string() == "mp_vs_normal" then 
					self:initialise_journal_screen_for_mp_head_to_head()
				else
					self:initialise_journal_screen()
				end
				
				core:add_listener (
					"journal_panel_ComponentLClickUp",
					"ComponentLClickUp",
					true,
					function(context)
						if string.find(context.string, self.config.templates_id.objective_prefix) then
							self:on_victory_objective_clicked(context)
						end
					end,
					true
				)
			end,
			true
		)

		core:add_listener(
			"journal_panel_closed",
			"PanelClosedCampaign",
			function(context)
				return context.string == self.config.journal_panel_name
			end,
			function(context)
				for _, template_component in pairs(self.template_components) do
					template_component:Destroy()
				end

				self.template_components = {}

				core:remove_listener("journal_panel_ComponentLClickUp")
			end,
			true
		)
	end,

	initialise_journal_screen_for_mp_head_to_head = function(self)
		local victory_objectives_uic = core:get_ui_root():SequentialFind(self.config.journal_panel_name, "victory_objectives")
		local journal_uic_description_sp = core:get_ui_root():SequentialFind(self.config.journal_panel_name, "description_tx")
		local journal_uic_description_mp = core:get_ui_root():SequentialFind(self.config.journal_panel_name, "multiplayer_description_tx")
		local journal_uic_text_mp = core:get_ui_root():SequentialFind(self.config.journal_panel_name, "multiplayer_description_tx", "text")
		local human_factions = cm:get_human_factions()
		local enemy_faction_key = ""

		victory_objectives_uic:SetVisible(false)
		journal_uic_description_sp:SetVisible(false)
		journal_uic_description_mp:SetVisible(true)

		for _, human_faction_key in ipairs(human_factions) do
			if human_faction_key ~= cm:get_local_faction_name(true) then 			
				enemy_faction_key = human_faction_key
			end
		end
		journal_uic_text_mp:SetText(common.string_safe_format(common.get_localised_string(self.config.texts.multiplayer_h2h), common.get_localised_string("factions_screen_name_" .. enemy_faction_key)),self.config.texts.multiplayer_h2h)		
	end,

	initialise_journal_screen = function(self)
		local objectives_ui_data = {}
		table_append(objectives_ui_data, self:create_ui_data_for_victory_objectives_system_based_objectives())
		table_append(objectives_ui_data, self:create_ui_data_for_building_based_objectives())

		self:initialise_categories_ui(objectives_ui_data)
		self:initialise_victory_points_progress_bar()
	end,

	-- here scripted means those that are handled by the "objectives system" (victory_objectives.lua / victory_objectives_core.lua / victory_objectives_config.lua )
	create_ui_data_for_victory_objectives_system_based_objectives = function(self)
		local objectives_ui_data = {}

		local local_faction = cm:get_local_faction(true)
		local local_faction_key = local_faction:name()
		local faction_victory_condition = victory_conditions_core.get_faction_condition_by_script_key(local_faction_key, "point_victory")
		for _, objective_uid in ipairs(faction_victory_condition.activated_objectives) do
			local objective_config = table_find(victory_objectives_data, function(e) return e.uid == objective_uid end)
			if objective_config then
				local objective_ui_data = {}
				table.insert(objectives_ui_data, objective_ui_data)

				objective_ui_data.id = objective_uid
				objective_ui_data.conditions_progress_by_type = {}
				objective_ui_data.victory_points = objective_config.vp_reward
				objective_ui_data.is_completed = victory_conditions_core.is_objective_completed(local_faction_key, objective_uid)
				objective_ui_data.category = objective_config.category or self.config.default_category
				objective_ui_data.sub_category = objective_config.sub_category
				objective_ui_data.can_be_clicked = false
				objective_ui_data.disable_progress_bar = objective_config.disable_progress_bar
				objective_ui_data.disable_bullet_points = objective_config.disable_bullet_points
				objective_ui_data.actions = {}

				local title = objective_config.title_key and common.get_localised_string(objective_config.title_key) or ("missing title for: " .. objective_uid)
				objective_ui_data.title =  title

				local description = objective_config.description_key and common.get_localised_string(objective_config.description_key) or ("missing description for: " .. objective_uid)
				objective_ui_data.description =  description

				for _, completion_condition_config in ipairs(objective_config.completion_conditions) do
					local condition_progress = victory_conditions_core.get_objective_completion_condition_progress(local_faction_key, objective_uid, completion_condition_config.id)
					local condition_is_completed = condition_progress and condition_progress.is_completed or false
					local type = completion_condition_config.type
					if not objective_ui_data.conditions_progress_by_type[type] then
						objective_ui_data.conditions_progress_by_type[type] = {}
					end

					if type == "have_pooled_resource_amount" then
						self:create_ui_data_for_condition_have_pooled_resource_amount(objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
					elseif type == "control_region" then
						self:create_ui_data_for_condition_control_region(objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
					elseif type == "raze_region" then
						self:create_ui_data_for_condition_raze_region(objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
					elseif type == "raze_n_regions" then
						self:create_ui_data_for_condition_raze_n_regions(objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
					elseif type == "have_tudhaliya_princes" then
						self:create_ui_data_for_condition_have_tudhaliya_princes(objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
					elseif type == "have_max_favour_with_gods" then
						self:create_ui_data_for_condition_have_max_favour_with_gods(objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
					elseif type == "have_favour_amount_with_any_god" then
						self:create_ui_data_for_condition_have_favour_amount_with_any_god(objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
					elseif type == "have_amount_of_max_level_of_building_chain" then
						self:create_ui_data_for_condition_have_amount_of_max_level_of_building_chain(objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
					elseif type == "spend_pooled_resource_amount" then
						self:create_ui_data_for_condition_spend_pooled_resource_amount(objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
					elseif type == "spend_turns_in_civilization_level" then
						self:create_ui_data_for_condition_spend_turns_in_civilization_level(objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
					elseif type == "spend_turns_in_any_tribe_category" then
						self:create_ui_data_for_condition_spend_turns_in_any_tribe_category(objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
					elseif type == "loot_resources_from_settlements" then
						self:create_ui_data_for_condition_loot_resources_from_settlements(objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
					elseif type == "maintain_muwatalli_gratitude_per_turn" then
						self:create_ui_data_for_condition_maintain_muwatalli_gratitude_per_turn(objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
					elseif type == "have_hammurabi_laws" then
						self:create_ui_data_for_condition_have_hammurabi_laws(objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
					elseif type == "hatshepsut_cash_out_ancillary_or_effect_bundle" then
						self:create_ui_data_for_condition_hatshepsut_cash_out_ancillary_or_effect_bundle(objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
					elseif type == "recruit_units" then
						self:create_ui_data_for_condition_recruit_units(objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
					elseif type == "use_eminence_obedience" then
						self:create_ui_data_for_condition_use_eminence_obedience(objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
					elseif type == "maintain_equipped_ancillaries" then
						self:create_ui_data_for_condition_maintain_equipped_ancillaries(objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
					elseif type == "capture_settlements_with_thutmose_culmination" then
						self:create_ui_data_for_condition_capture_settlements_with_thutmose_culmination(objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
					elseif type == "complete_ambitions" then
						self:create_ui_data_for_condition_complete_ambitions(objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
					else
						self:create_ui_data_for_non_specific_condition(objective_ui_data, completion_condition_config, condition_is_completed)
					end
				end
			end
		end

		return objectives_ui_data
	end,

	create_ui_data_for_building_based_objectives = function(self)

		local objectives_ui_data = {}

		local create_objective_ui_data = function(building, victory_points)
			local building_level_key = building:name()
			local building_level_record_cco = cco("CcoBuildingLevelRecord", building_level_key)
			local building_name = building_level_record_cco and building_level_record_cco:Call("PlayerVariantRecordContext.Name") or "Missing building: " .. building_level_key
			local description = building_level_record_cco and building_level_record_cco:Call("PlayerVariantRecordContext.ShortDescription") or "Missing building: " .. building_level_key

			return {
				id = building_level_key,
				victory_points = victory_points,
				is_completed = true,
				title = building_name,
				description = description,
				category = self.config.buildings_category,
				conditions_progress_by_type = {
					["building_based_objectives"] = { { progress_text = building_name, progress = { amount = 1, max = 1 }, is_completed = true } }
				},
				actions = {},
				disable_progress_bar = true,
				disable_bullet_points = false
			}
		end

		local local_faction = cm:get_local_faction(true)
		local region_list = local_faction:region_list()
		for i = 0, region_list:num_items() - 1 do
			local region = region_list:item_at(i)

			local slot_list = region:slot_list()
			for j = 0, slot_list:num_items() - 1 do
				local slot = slot_list:item_at(j)
				if slot:has_building() then
					local building = slot:building()
					local victory_points = scripted_bonus_values.check_building_for_scripted_bonus_value(building, scripted_bonus_values.bonus_value_keys.victory_points_from_buildings)
					if victory_points ~= 0 then
						local objective_ui_data = create_objective_ui_data(building, victory_points)
						table.insert(objectives_ui_data, objective_ui_data)
					end
				end
			end
		end

		-- horde's are a special case since their buildings are in the military force
		local military_force_list = local_faction:military_force_list()
		for i = 0, military_force_list:num_items() - 1 do
			local military_force = military_force_list:item_at(i)
			local building_list = military_force:buildings()
			if building_list then 
	
				for j = 0, building_list:num_items() - 1 do
					local building = building_list:item_at(j)
					local victory_points = scripted_bonus_values.check_building_for_scripted_bonus_value(building, scripted_bonus_values.bonus_value_keys.victory_points_from_buildings)
					if victory_points ~= 0 then
						local objective_ui_data = create_objective_ui_data(building, victory_points)
						table.insert(objectives_ui_data, objective_ui_data)
					end
				end
			end
		end

		return objectives_ui_data
	end,
	
	initialise_categories_ui = function(self, objectives_ui_data)

		local journal_component = core:get_ui_root():SequentialFind(self.config.journal_panel_name)
		local victory_objectives_component = journal_component:SequentialFind("victory_objectives")
		local categories_container = victory_objectives_component:SequentialFind("list_box")

		local categories_ui_data = self:create_categories_ui_data(objectives_ui_data)
		for _, category_ui_data in ipairs(categories_ui_data) do
			if not category_ui_data.is_objectiveless then
				self:initialise_category_with_objectives(categories_container, category_ui_data)
			else
				self:initialise_objectiveless_category(categories_container, category_ui_data)
			end
		end
	end,

	initialise_category_ui = function(self, category_component, objectives_container_id, category_ui_data)
		local header = category_component:SequentialFind("header")
		local title_key = category_ui_data.category.title_key
		header:SetText(common.get_localised_string(title_key), title_key)
		-- setting of header state (toggle button for the expanding list) should go through callback ExpandingListHeader, otherwise hide/show and button state logic breaks
		category_component:InterfaceFunction("expand_list_header", category_ui_data.is_unlocked)
		header:SetState(category_ui_data.is_unlocked and header:CurrentState() or "inactive")

		local cco_category_tooltip_id = "victory_objective_category_tooltip_" .. category_ui_data.category.id
		self:create_category_cco(category_ui_data, cco_category_tooltip_id)
		header:SetProperty("script_id", cco_category_tooltip_id)

		local value_component = header:SequentialFind("value")
		if value_component then
			value_component:SetVisible(true)
			value_component:SetText(category_ui_data.gained_victory_points .. "/" .. category_ui_data.total_victory_points)

			local cco_category_points_tooltip_id = "victory_objective_category_points_tooltip_" .. category_ui_data.category.id
			self:create_category_points_cco(category_ui_data, cco_category_points_tooltip_id)
			value_component:SetProperty("script_id", cco_category_points_tooltip_id) -- TODO: possibly change to the holder of the value?!
		end

		local objectives_container = category_component:SequentialFind(objectives_container_id)
		objectives_container:SetVisible(#category_ui_data.objectives > 0)

		if #category_ui_data.objectives > 0 then
			self:initialise_category_objectives_ui(objectives_container, category_ui_data.objectives, category_ui_data.category.description_key)
		end

		local objectives_list = objectives_container:SequentialFind("objectives_list")
		local template_undiscovered = objectives_list:SequentialFind("template_undiscovered")
		if template_undiscovered then
			local undiscovered_objectives = category_ui_data.total_objectives - #category_ui_data.objectives
			if undiscovered_objectives > 0 then
				local undiscovered_component = UIComponent(objectives_list:CreateFromComponent(template_undiscovered:Address(), "undiscovered"))
				undiscovered_component:SequentialFind("dy_text"):SetText("+" .. undiscovered_objectives .. " " .. common.get_localised_string(self.config.texts.undiscovered), self.config.texts.undiscovered)
			end

			template_undiscovered:SetVisible(false)
		end
	end,

	initialise_category_objectives_ui = function(self, objectives_container, objectives_ui_data, category_decription_key)

		local category_description_component = objectives_container:SequentialFind("category_description")
		if category_decription_key then
			category_description_component:SetText(common.get_localised_string(category_decription_key), category_decription_key)
		else
			category_description_component:SetVisible(false)
		end

		local objectives_list = objectives_container:SequentialFind("objectives_list")
		local template_objective = objectives_list:SequentialFind("template_objective")

		for _, objective_ui_data in ipairs(objectives_ui_data) do
			local component_id = string.format(self.config.templates_id.objective_prefix .. objectives_list:ChildCount())
			local objective_component = UIComponent(objectives_list:CreateFromComponent(template_objective:Address(), component_id))
			objective_component:SetProperty("objective_uid", objective_ui_data.id)

			local component_state = objective_ui_data.is_completed and "achieved" or "to_do"
			if objective_ui_data.can_be_clicked then
				component_state = component_state .. "_clickable"
			end

			objective_component:SetState(component_state)

			local title_component = objective_component:SequentialFind("dy_text")
			title_component:SetText(objective_ui_data.title)

			local icon_complete = objective_component:SequentialFind("icon_complete")
			icon_complete:SetState(objective_ui_data.is_completed and "active" or "inactive")

			local cco_id = "victory_objective_" .. objective_ui_data.id
			objective_component:SetProperty("script_id", cco_id)

			-- Override component states for control or raze conditions
			if objective_ui_data.use_special_occupation_states then
				self:set_special_occupation_states_for_objective(objective_ui_data, objective_component)
			end

			local victory_objective_cco = self:create_victory_objective_cco(objective_ui_data, cco_id)
			local objective_progress_component = objective_component:SequentialFind("objective_progress")
			local objective_progress = victory_objective_cco.ProgressAmount / victory_objective_cco.ProgressMax
			objective_progress_component:ResizeCurrentStateImage(1, objective_progress_component:Width() * objective_progress, objective_progress_component:Height())
		end

		template_objective:SetVisible(false)
	end,

	set_special_occupation_states_for_objective = function(self, objective_ui_data, objective_component)
		-- objective component
		objective_component:SetState("occupied_razed_to_do_clickable")

		-- objective frame
		local objective_frame = objective_component:SequentialFind("objective_frame")
		objective_frame:SetState("occupied_razed")

		-- icon_complete
		local icon_complete_state = ""
		if objective_ui_data.num_owned_regions > 0 and objective_ui_data.num_razed_regions > 0 then
			icon_complete_state = "occupied_razed"
		elseif objective_ui_data.num_owned_regions > 0 then
			icon_complete_state = "occupied"
		elseif objective_ui_data.num_razed_regions > 0 then
			icon_complete_state = "razed"
		end

		if #icon_complete_state == 0 then
			icon_complete_state = "occupied_razed_default"
		else
			icon_complete_state = string.format("%s_%s", icon_complete_state, objective_ui_data.is_completed and "active" or "inactive")
		end

		local icon_complete = objective_component:SequentialFind("icon_complete")
		icon_complete:SetState(icon_complete_state)
	end,

	create_victory_objective_cco = function(self, objective_ui_data, cco_id)
		local conditions_progress_by_type = {}
		local total_conditions = 0
		local total_completed_conditions = 0
		if objective_ui_data.conditions_progress_by_type then
			for condition_type, type_conditions_progress in pairs(objective_ui_data.conditions_progress_by_type) do
				local cco_type_conditions_progress = {}
				cco_type_conditions_progress.DescriptionKey = ""
				cco_type_conditions_progress.ConditionsProgress = {}

				if self.config.condition_types_description_key[condition_type] then
					cco_type_conditions_progress.DescriptionKey = self.config.condition_types_description_key[condition_type]
				end

				for _, condition_progress in ipairs(type_conditions_progress) do
					total_conditions = total_conditions + 1
					if condition_progress.is_completed then
						total_completed_conditions = total_completed_conditions + 1
					end

					table.insert(cco_type_conditions_progress.ConditionsProgress, { Text = condition_progress.progress_text, 
																					Progress = condition_progress.progress, 
																					IsCompleted = condition_progress.is_completed, 
																					UseSpecialOccupationStates = condition_progress.special_occupation_state and #condition_progress.special_occupation_state > 0,
																					SpecialOccupationState = condition_progress.special_occupation_state or ""})
				end

				table.insert(conditions_progress_by_type, cco_type_conditions_progress)
			end
		end

		local progress_amount = 0
		local progress_max = 0
		-- if we have one condition then lets use that condition's progress for the whole objective
		if #conditions_progress_by_type == 1 and #conditions_progress_by_type[1].ConditionsProgress == 1 then
			progress_amount = conditions_progress_by_type[1].ConditionsProgress[1].Progress.amount
			progress_max = conditions_progress_by_type[1].ConditionsProgress[1].Progress.max
		else
			progress_amount = total_completed_conditions
			progress_max = total_conditions
		end

		local victory_objective_cco = {
			Title = objective_ui_data.title,
			Description = objective_ui_data.description,
			VictoryPoints = objective_ui_data.victory_points,
			ProgressAmount = progress_amount,
			ProgressMax = progress_max,
			DisableProgressBar = objective_ui_data.disable_progress_bar or false,
			DisableBulletPoints = objective_ui_data.disable_bullet_points or false,
			ConditionsProgressByType = conditions_progress_by_type,
			Alerts = {},
			Warnings = {},
			Actions = objective_ui_data.actions
		}
		common.set_context_value(cco_id, victory_objective_cco)

		return victory_objective_cco
	end,

	create_category_cco = function(self, category_ui_data, cco_id)
		common.set_context_value(cco_id, {
			Title = common.get_localised_string(category_ui_data.category.title_key),
			TooltipDescription = category_ui_data.category.tooltip_description_key and common.get_localised_string(category_ui_data.category.tooltip_description_key) or "",
			Warnings = category_ui_data.is_unlocked and {} or { common.get_localised_string(self.config.texts.category_locked_warning) }
		})
	end,
	
	create_category_points_cco = function(self, category_ui_data, cco_id)
		local cco_category_points = { GainedVictoryPoints = category_ui_data.gained_victory_points, Sources = {} }
		for _, sub_category_ui_data in ipairs(category_ui_data.sub_categories) do
			table.insert(cco_category_points.Sources, { Title = common.get_localised_string(sub_category_ui_data.category.title_key), VictoryPoints = sub_category_ui_data.gained_victory_points })
		end

		common.set_context_value(cco_id, cco_category_points)
	end,

	initialise_category_with_objectives = function(self, categories_container, category_ui_data)
		local category_component = UIComponent(categories_container:CreateFromComponent(self.template_components.template_category_component:Address(), categories_container:ChildCount()))
		self:initialise_category_ui(category_component, "objectives_container", category_ui_data)

		local sub_categories_container = category_component:SequentialFind("sub_categories")
		sub_categories_container:SetVisible(category_ui_data.is_unlocked and #category_ui_data.sub_categories > 0)

		local template_sub_category = category_component:SequentialFind("template_sub_category")

		for _, sub_category_ui_data in ipairs(category_ui_data.sub_categories) do
			local sub_category_component = UIComponent(sub_categories_container:CreateFromComponent(template_sub_category:Address(), sub_categories_container:ChildCount()))
			self:initialise_category_ui(sub_category_component, "sub_category_objectives_container", sub_category_ui_data)
		end

		template_sub_category:SetVisible(false)
	end,

	initialise_objectiveless_category = function(self, categories_container, category_ui_data)
		local category_component = UIComponent(categories_container:CreateFromComponent(self.template_components.template_category_no_objectives:Address(), categories_container:ChildCount()))

		local category_config = category_ui_data.category
		local title_key = category_config.title_key
		local gained_victory_points = self:get_victory_points_by_factor(category_config.factor_id)

		local header = category_component:SequentialFind("header")
		if header then
			header:SetText(common.get_localised_string(title_key), title_key)
			-- setting of header state (toggle button for the expanding list) should go through callback ExpandingListHeader, otherwise hide/show and button state logic breaks
			category_component:InterfaceFunction("expand_list_header", gained_victory_points > 0)
			header:SetState(gained_victory_points > 0 and header:CurrentState() or "inactive")

			local cco_category_tooltip_id = "victory_objective_category_tooltip_" .. category_ui_data.category.id
			self:create_category_cco(category_ui_data, cco_category_tooltip_id)
			header:SetProperty("script_id", cco_category_tooltip_id)
		end

		-- objectiveless categories have no way to show amount of gaiven victory points, so we show them instead of total victory points
		local value_component = header:SequentialFind("value")
		if value_component then
			value_component:SetVisible(gained_victory_points > 0)
			value_component:SetText(category_ui_data.gained_victory_points)

			local cco_category_points_tooltip_id = "victory_objective_category_points_tooltip_" .. category_ui_data.category.id
			self:create_category_points_cco(category_ui_data, cco_category_points_tooltip_id)
			value_component:SetProperty("script_id", cco_category_points_tooltip_id) -- TODO: possibly change to the holder of the value?!
		end
	end,

	initialise_victory_points_progress_bar = function(self)
		local journal_component = core:get_ui_root():SequentialFind(self.config.journal_panel_name)
		local victory_objectives_component = journal_component:SequentialFind("victory_objectives")
		local total_victory_points_container = victory_objectives_component:SequentialFind("total_victory_points_container")

		local local_faction = cm:get_local_faction(true)
		local gained_victory_points = local_faction:pooled_resource(victory_points_mechanic.config.victory_points_key):value()
		local victory_types = victory_points_mechanic.get_victory_types_for_campaign_type()
		local full_bar_victory_points = victory_types[#victory_types].victory_points
		local total_victory_points_progress = math.clamp(gained_victory_points / full_bar_victory_points, 0, 1)

		local progress_bar = total_victory_points_container:SequentialFind("progress_bar")
		if progress_bar then
			local cco_id = "victory_points_progress"
			common.set_context_value(cco_id, { VictoryPointsProgress = total_victory_points_progress })
			progress_bar:SetProperty("script_id", cco_id)
		end

		local victory_types_container = total_victory_points_container:SequentialFind("victory_types_container")
		if victory_types_container then
			local begin_label = victory_types_container:SequentialFind("begin_label")
			begin_label:SetVisible(true)
			local middle_label = victory_types_container:SequentialFind("middle_label")
			middle_label:SetVisible(true)
			local end_label = victory_types_container:SequentialFind("end_label")
			end_label:SetVisible(true)

			for i, victory_type in ipairs(victory_types) do
				local label = nil
				if i == 1 then
					label = begin_label
				elseif i == 2 then
					label = middle_label
				else
					label = end_label
				end

				local previous_victory_type_points = i > 1 and victory_types[i - 1].victory_points or 0
				local victory_points_in_section = victory_type.victory_points - previous_victory_type_points
				local section_ratio = math.clamp(victory_points_in_section / full_bar_victory_points, 0, 1)
				label:Resize(victory_types_container:Width() * section_ratio, label:Height())

				local dy_victory_points = label:SequentialFind("dy_victory_points")
				if dy_victory_points then
					local is_active_section = previous_victory_type_points <= gained_victory_points and gained_victory_points < victory_type.victory_points
					if is_active_section then
						dy_victory_points:SetText(gained_victory_points .. "/" .. victory_type.victory_points)
					else
						dy_victory_points:SetText(victory_type.victory_points)
					end
				end

				local cco_id = "victory_type_tooltip_" .. i
				label:SetProperty("script_id", cco_id)
				common.set_context_value(cco_id, {
					Title = common.get_localised_string(victory_type.name_key),
					Description = common.get_localised_string(victory_type.description_key),
					VictoryPoints = victory_type.victory_points
				})
			end
		end
	end,

	create_categories_ui_data = function(self, objectives_ui_data)
		local get_or_create_category_ui_data = function(categories_ui_data, category, is_unlocked, is_objectiveless)
			local category_ui_data = table_find(categories_ui_data, function(e) return e.category.id == category.id end)
			if not category_ui_data then
				category_ui_data = { 
					category = category,
					sub_categories = {},
					objectives = {},
					is_unlocked = is_unlocked,
					is_objectiveless = is_objectiveless,
					total_objectives = 0
				}
				table.insert(categories_ui_data, category_ui_data)
			end

			return category_ui_data
		end

		local add_vp_to_category = function(total_victory_points_by_categories, category, victory_points)
			local category_id = category.id
			if not total_victory_points_by_categories[category_id] then
				total_victory_points_by_categories[category_id] = 0
			end
			
			total_victory_points_by_categories[category_id] = total_victory_points_by_categories[category_id] + victory_points
		end

		local categories_ui_data = {}
		local total_victory_points_by_categories = {}
		for _, objective_ui_data in ipairs(objectives_ui_data) do
			if objective_ui_data.category then
				local category_ui_data = get_or_create_category_ui_data(categories_ui_data, objective_ui_data.category, true, false)

				if objective_ui_data.sub_category then
					local sub_category_ui_data = get_or_create_category_ui_data(category_ui_data.sub_categories, objective_ui_data.sub_category, true, false)
					table.insert(sub_category_ui_data.objectives, objective_ui_data)
				else
					table.insert(category_ui_data.objectives, objective_ui_data)
				end
			end
		end

		-- add categories which are "objectiveless"
		for _, category_config in ipairs(self.config.categories_without_objectives) do
			local gained_victory_points = self:get_victory_points_by_factor(category_config.factor_id)
			get_or_create_category_ui_data(categories_ui_data, category_config, gained_victory_points > 0, true)
			total_victory_points_by_categories[category_config.id] = category_config.total_victory_points
		end

		-- add categories that aren't unlocked yet, but are available to the faction, so we can show to the player that there is more

		-- buildings category isn't among the victory objectives config, so we do it separately
		total_victory_points_by_categories[self.config.buildings_category.id] = self.config.buildings_category.total_victory_points

		if not table_find(categories_ui_data, function(e) return e.category.id == self.config.buildings_category.id end) then
			get_or_create_category_ui_data(categories_ui_data, self.config.buildings_category, false, false)
		end

		local local_faction = cm:get_local_faction(true)
		for _, objective_config in ipairs(victory_objectives_data) do
			if victory_conditions_core.is_objective_available_to_faction(local_faction, objective_config.uid) then
				if objective_config.category then		
					local category_ui_data = table_find(categories_ui_data, function(e) return e.category.id == objective_config.category.id end)
					if not category_ui_data then
						category_ui_data = get_or_create_category_ui_data(categories_ui_data, objective_config.category, false, false)
					end

					local sub_category_config = objective_config.sub_category
					if sub_category_config then
						add_vp_to_category(total_victory_points_by_categories, sub_category_config, objective_config.vp_reward)

						local sub_category_ui_data = table_find(category_ui_data.sub_categories, function(e) return e.category.id == sub_category_config.id end)
						if not sub_category_ui_data then
							sub_category_ui_data = get_or_create_category_ui_data(category_ui_data.sub_categories, sub_category_config, false, false)
						end

						sub_category_ui_data.total_objectives = sub_category_ui_data.total_objectives + 1
					else
						add_vp_to_category(total_victory_points_by_categories, objective_config.category, objective_config.vp_reward)
						category_ui_data.total_objectives = category_ui_data.total_objectives + 1
					end
				end
			end
		end

		for _, category_ui_data in ipairs(categories_ui_data) do
			self:calculate_and_store_victory_points(category_ui_data, total_victory_points_by_categories)
		end

		local sort_category_lambda = function(a, b)
			if a.is_unlocked ~= b.is_unlocked then
				return a.is_unlocked
			end

			if a.is_objectiveless ~= b.is_objectiveless then
				return not a.is_objectiveless
			end

			if not a.category.priority then
				return true
			end

			if not b.category.priority then
				return false
			end

			return a.category.priority < b.category.priority
		end

		categories_ui_data = table_stable_sort(categories_ui_data, sort_category_lambda)

		for _, category_ui_data in ipairs(categories_ui_data) do
			category_ui_data.sub_categories = table_stable_sort(category_ui_data.sub_categories, sort_category_lambda)
		end

		return categories_ui_data
	end,

	calculate_and_store_victory_points = function(self, category_ui_data, victory_points_by_categories)
		local gained_victory_points = 0
		local total_victory_points = victory_points_by_categories[category_ui_data.category.id] or 0

		for _, sub_category_ui_data in ipairs(category_ui_data.sub_categories) do
			self:calculate_and_store_victory_points(sub_category_ui_data, victory_points_by_categories)
			gained_victory_points = gained_victory_points + sub_category_ui_data.gained_victory_points
			total_victory_points = total_victory_points + sub_category_ui_data.total_victory_points
		end

		if not category_ui_data.is_objectiveless then
			for _, objective_ui_data in ipairs(category_ui_data.objectives) do
				gained_victory_points = gained_victory_points + (objective_ui_data.is_completed and objective_ui_data.victory_points or 0)
			end
		else
			gained_victory_points = self:get_victory_points_by_factor(category_ui_data.category.factor_id)
		end

		category_ui_data.gained_victory_points = gained_victory_points
		category_ui_data.total_victory_points = total_victory_points
	end,

	get_victory_points_by_factor = function(self, factor_id)
		local local_faction = cm:get_local_faction(true)
		local victory_points_pooled_resource = local_faction:pooled_resource(victory_points_mechanic.config.victory_points_key)
		local factors = victory_points_pooled_resource:factors()

		for i = 0, factors:num_items() - 1 do
			local factor = factors:item_at(i)
			if factor:factor_id() == factor_id then
				return factor:value()
			end
		end

		return 0
	end,

	on_victory_objective_clicked = function(self, context)
		local victory_objective_component = UIComponent(context.component)
		if not victory_objective_component then
			return
		end

		local objective_uid = victory_objective_component:GetProperty("objective_uid")
		local objective_config = table_find(victory_objectives_data, function(e) return e.uid == objective_uid end)
		if not objective_config then
			return
		end

		-- right now the only interactable objective is one that has at least one "control_region" condition
		local regions = {}
		for _, completion_condition_config in ipairs(objective_config.completion_conditions) do
			local type = completion_condition_config.type

			if type == "control_region" or type == "raze_region" then
				table.insert(regions, completion_condition_config.region_key)
			end
		end

		local closest_distance_squared = 1000000
		local closest_region_key = nil
		local camera_x, camera_y, camera_distance = cm:get_camera_position()
		for _, region_key in ipairs(regions) do
			local settlement_x, settlement_y = cm:settlement_display_pos("settlement:" .. region_key)
			local camera_to_settlement_distance_squared = distance_squared(camera_x, camera_y, settlement_x, settlement_y)
			if camera_to_settlement_distance_squared < closest_distance_squared then
				closest_distance_squared = camera_to_settlement_distance_squared
				closest_region_key = region_key
			end
		end

		if closest_region_key then
			cm:scroll_camera_to_settlement(closest_region_key)
		end
	end,

	create_ui_data_for_non_specific_condition = function(self, objective_ui_data, completion_condition_config, condition_is_completed)
		local progress_text = ""
		if completion_condition_config.ui and completion_condition_config.ui.custom_description then
			progress_text = common.get_localised_string(completion_condition_config.ui.custom_description)
		end

		local type = completion_condition_config.type
		local progress = { amount = condition_is_completed and 1 or 0, max = 1 }
		table.insert(objective_ui_data.conditions_progress_by_type[type], { progress_text = progress_text, progress = progress, is_completed = condition_is_completed })
	end,

	create_ui_data_for_condition_have_pooled_resource_amount = function(self, objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
		local local_faction = cm:get_local_faction(true)
		local resource_amount, max_pooled_resource_key = calculate_progress_on_have_pooled_resource_amount(local_faction, completion_condition_config)

		-- make sure that current progress doesn't go over the maximum
		local progress_amount = math.min(resource_amount, completion_condition_config.amount)

		local progress_text = ""
		if completion_condition_config.ui and completion_condition_config.ui.custom_description then
			progress_text = common.get_localised_string(completion_condition_config.ui.custom_description)
		else
			local localised_name = ""
			if completion_condition_config.sum_resources then
				for _, pooled_resource_key in ipairs(completion_condition_config.allowed_pooled_resources) do
					if #completion_condition_config.allowed_pooled_resources > 1 then
						if #localised_name == 0 then
							localised_name = common.get_localised_string("campaign_localised_strings_string_phar_sea_victory_objectives_common_any_type_of_resources")
						else
							localised_name = localised_name .. ", "
						end
					end
					local screen_name = journal_victory_objective_ui.get_localised_name_for_pooled_resource(pooled_resource_key)
					localised_name = localised_name .. screen_name
				end
			else
				local screen_name = journal_victory_objective_ui.get_localised_name_for_pooled_resource(max_pooled_resource_key)
				localised_name = localised_name .. screen_name
			end

			progress_text = localised_name .. ": " .. progress_amount .. "/" .. completion_condition_config.amount
		end

		local type = completion_condition_config.type
		local progress = { amount = progress_amount, max = completion_condition_config.amount }
		table.insert(objective_ui_data.conditions_progress_by_type[type], { progress_text = progress_text, progress = progress, is_completed = condition_is_completed })
	end,

	create_ui_data_for_condition_control_region = function(self, objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
		objective_ui_data.can_be_clicked = true

		local progress_text = ""
		if completion_condition_config.ui and completion_condition_config.ui.custom_description then
			progress_text = common.get_localised_string(completion_condition_config.ui.custom_description)
		else
			local region_key = completion_condition_config.region_key
			local screen_name_key = cco("CcoRegionRecord", region_key):Call("OnScreenNameKey")
			if screen_name_key then
				progress_text = common.get_localised_string(screen_name_key)
			else
				progress_text = "Missing region: " .. region_key
			end
		end

		local special_occupation_state = ""

		if completion_condition_config.should_consider_razed_regions_as_under_control then
			objective_ui_data.use_special_occupation_states = true

			objective_ui_data.num_owned_regions = objective_ui_data.num_owned_regions or 0
			objective_ui_data.num_razed_regions = objective_ui_data.num_razed_regions or 0

			local region = cm:get_region(completion_condition_config.region_key)
			if region then
				local faction_owning_region = region:owning_faction()
				if faction_owning_region:name() == cm:get_local_faction_name(true) 
						or faction_owning_region:is_ally_vassal_subject_or_client_state_of(cm:get_local_faction(true)) then
					objective_ui_data.num_owned_regions = objective_ui_data.num_owned_regions + 1
					special_occupation_state = "occupied"
				elseif region:is_abandoned() then
					objective_ui_data.num_razed_regions = objective_ui_data.num_razed_regions + 1
					special_occupation_state = "razed"
				end
			end 
		end

		local type = completion_condition_config.type
		local progress = { amount = condition_is_completed and 1 or 0, max = 1 }
		table.insert(objective_ui_data.conditions_progress_by_type[type], { progress_text = progress_text, progress = progress, is_completed = condition_is_completed, special_occupation_state = special_occupation_state })
	
		table_add_unique(objective_ui_data.actions, self.config.conditions_texts.click_to_zoom)
	end,

	create_ui_data_for_condition_raze_region = function(self, objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
		self:create_ui_data_for_condition_control_region(objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
	end,

	create_ui_data_for_condition_raze_n_regions = function(self, objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
		local num_razed_regions = math.min(condition_progress and condition_progress.num_razed_regions or 0, completion_condition_config.amount)

		local progress_text = ""
		if completion_condition_config.ui and completion_condition_config.ui.custom_description then
			progress_text = common.get_localised_string(completion_condition_config.ui.custom_description)
		else
			progress_text = string.format("%s%d/%d", common.get_localised_string("campaign_localised_strings_string_phar_sea_victory_objectives_common_razed_settlements"), num_razed_regions, completion_condition_config.amount)
		end

		local type = completion_condition_config.type
		local progress = { amount = num_razed_regions, max = completion_condition_config.amount }
		table.insert(objective_ui_data.conditions_progress_by_type[type], { progress_text = progress_text, progress = progress, is_completed = condition_is_completed })
	end,

	create_ui_data_for_condition_have_tudhaliya_princes = function(self, objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
		
		local progress_text = ""
		local assigned_princes = condition_progress and condition_progress.assigned_count or 0
		-- make sure that current progress doesn't go over the maximum
		local progress_amount = math.min(assigned_princes, completion_condition_config.amount)

		if completion_condition_config.ui and completion_condition_config.ui.custom_description then
			progress_text = common.get_localised_string(completion_condition_config.ui.custom_description)
		else
			-- TODO: fix localisation?
			progress_text = progress_amount .. "/" .. completion_condition_config.amount
		end

		local type = completion_condition_config.type
		local progress = { amount = progress_amount, max = completion_condition_config.amount }
		table.insert(objective_ui_data.conditions_progress_by_type[type], { progress_text = progress_text, progress = progress, is_completed = condition_is_completed })
	end,

	create_ui_data_for_condition_have_max_favour_with_gods = function(self, objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
		
		local max_favoured_gods = condition_progress and condition_progress.max_favoured_gods or {}
		local requires_unique_cultures = completion_condition_config.unique_cultures_amount and completion_condition_config.unique_cultures_amount > 1
		local current_unique_cultures = {}
		if requires_unique_cultures then
			for _, god_key in ipairs(max_favoured_gods) do
				local god = deities.get_god(god_key)
				if god.culture and not table_contains(current_unique_cultures, god.culture) then
					table.insert(current_unique_cultures, god.culture)
				end
			end
		end

		local progress_text = ""
		if completion_condition_config.ui and completion_condition_config.ui.custom_description then
			progress_text = common.get_localised_string(completion_condition_config.ui.custom_description)
		else
			-- TODO: fix localisation
			progress_text = "Gods: " .. #max_favoured_gods .. "/" .. completion_condition_config.gods_amount

			if requires_unique_cultures then
				progress_text = progress_text .. "\n" .. "Cultures: " .. #current_unique_cultures .. "/" .. completion_condition_config.unique_cultures_amount
			end
		end

		local progress_amount = 0
		local progress_max = 0

		-- cultures would be at least the number of gods, so we show progress based on unique cultures
		if requires_unique_cultures then
			progress_amount = #current_unique_cultures
			progress_max = completion_condition_config.unique_cultures_amount
		else
			progress_amount = #max_favoured_gods
			progress_max = completion_condition_config.gods_amount
		end

		-- make sure that current progress doesn't go over the maximum
		progress_amount = math.min(progress_amount, progress_max)

		local type = completion_condition_config.type
		local progress = { amount = progress_amount, max = progress_max }
		table.insert(objective_ui_data.conditions_progress_by_type[type], { progress_text = progress_text, progress = progress, is_completed = condition_is_completed })
	end,

	create_ui_data_for_condition_have_favour_amount_with_any_god = function(self, objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
		local favour_with_gods = condition_progress and condition_progress.favour_with_gods or {}
		local max_favour = 0
		for _, it_favour in pairs(favour_with_gods) do
			if max_favour < it_favour then
				max_favour = it_favour
			end
		end

		-- make sure that current progress doesn't go over the maximum
		local progress_amount = math.min(max_favour, completion_condition_config.amount)

		local progress_text = ""
		if completion_condition_config.ui and completion_condition_config.ui.custom_description then
			progress_text = common.get_localised_string(completion_condition_config.ui.custom_description)
		else
			-- TODO: fix localisation?
			progress_text = progress_amount .. "/" .. completion_condition_config.amount
		end

		local type = completion_condition_config.type
		local progress = { amount = progress_amount, max = completion_condition_config.amount }
		table.insert(objective_ui_data.conditions_progress_by_type[type], { progress_text = progress_text, progress = progress, is_completed = condition_is_completed })
	end,
	
	create_ui_data_for_condition_have_amount_of_max_level_of_building_chain = function(self, objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
		local buildings_amount = 0
		local buildings_progress = condition_progress and condition_progress.buildings_progress or {}
		for building_chain_key, amount  in pairs(buildings_progress) do
			buildings_amount = buildings_amount + amount
		end

		-- make sure that current progress doesn't go over the maximum
		local progress_amount = math.min(buildings_amount, completion_condition_config.amount)

		local progress_text = ""
		if completion_condition_config.ui and completion_condition_config.ui.custom_description then
			progress_text = common.get_localised_string(completion_condition_config.ui.custom_description)
		elseif #completion_condition_config.building_chain_keys == 1 then
			local building_chain_key = completion_condition_config.building_chain_keys[1]
			local screen_name = cco("CcoBuildingChainRecord", building_chain_key):Call("MaxBuildingLevelContext.PlayerVariantRecordContext.Name")
			if screen_name then
				progress_text = screen_name
			else
				progress_text = "Missing building chain: " .. building_chain_key
			end

			if completion_condition_config.amount > 1 then
				progress_text = progress_text .. ": " .. progress_amount .. "/" .. completion_condition_config.amount
			end
		end

		local type = completion_condition_config.type
		local progress = { amount = progress_amount, max = completion_condition_config.amount }
		table.insert(objective_ui_data.conditions_progress_by_type[type], { progress_text = progress_text, progress = progress, is_completed = condition_is_completed })
	end,

	create_ui_data_for_condition_spend_pooled_resource_amount = function(self, objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
		local pooled_resource_key = completion_condition_config.pooled_resource_key

		-- make sure that current progress doesn't go over the maximum
		local total_spend = condition_progress and condition_progress.total_spend or 0
		local progress_amount = math.min(total_spend, completion_condition_config.amount)

		local progress_text = ""
		if completion_condition_config.ui and completion_condition_config.ui.custom_description then
			progress_text = common.get_localised_string(completion_condition_config.ui.custom_description)
		else
			local localised_resource_name = journal_victory_objective_ui.get_localised_name_for_pooled_resource(pooled_resource_key)
			progress_text = localised_resource_name .. ": " .. progress_amount .. "/" .. completion_condition_config.amount
		end

		local type = completion_condition_config.type
		local progress = { amount = progress_amount, max = completion_condition_config.amount }
		table.insert(objective_ui_data.conditions_progress_by_type[type], { progress_text = progress_text, progress = progress, is_completed = condition_is_completed })
	end,

	create_ui_data_for_condition_spend_turns_in_civilization_level = function(self, objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
		local target_civilization_level = completion_condition_config.civilization_level

		-- make sure that current progress doesn't go over the maximum
		local turns_spent = condition_progress and condition_progress[target_civilization_level] or 0
		local progress_amount = math.min(turns_spent, completion_condition_config.turns)

		local progress_text = ""
		if completion_condition_config.ui and completion_condition_config.ui.custom_description then
			progress_text = common.get_localised_string(completion_condition_config.ui.custom_description)
		else
			local localised_name = pillars_civilization.get_localized_civilization_level_name_text_and_source(target_civilization_level)
			progress_text = localised_name .. ": " .. progress_amount .. "/" .. completion_condition_config.turns
		end

		local type = completion_condition_config.type
		local progress = { amount = progress_amount, max = completion_condition_config.turns }
		table.insert(objective_ui_data.conditions_progress_by_type[type], { progress_text = progress_text, progress = progress, is_completed = condition_is_completed })
	end,

	create_ui_data_for_condition_spend_turns_in_any_tribe_category = function(self, objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
		local turns_spent = 0
		local top_category = ""
		-- since we have multiple categories that may complete the condition - take the one closer to completing
		local categories_turns = condition_progress and condition_progress.categories_turns or {}
		for category, turns in pairs(categories_turns) do
			if turns_spent < turns then
				turns_spent = turns
				top_category = category
			end
		end

		-- make sure that current progress doesn't go over the maximum
		local progress_amount = math.min(turns_spent, completion_condition_config.turns)

		local progress_text = ""
		if completion_condition_config.ui and completion_condition_config.ui.custom_description then
			progress_text = common.get_localised_string(completion_condition_config.ui.custom_description)
		else
			local localised_name = tribes_privileges.ui.get_localized_cell_category_text_and_source(top_category)
			progress_text = localised_name .. ": " .. progress_amount .. "/" .. completion_condition_config.turns
		end

		local type = completion_condition_config.type
		local progress = { amount = progress_amount, max = completion_condition_config.turns }
		table.insert(objective_ui_data.conditions_progress_by_type[type], { progress_text = progress_text, progress = progress, is_completed = condition_is_completed })
	end,

	create_ui_data_for_condition_loot_resources_from_settlements = function(self, objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)

		-- make sure that current progress doesn't go over the maximum
		local total_looted = condition_progress and condition_progress.total_looted or 0
		local progress_amount = math.min(total_looted, completion_condition_config.amount)

		local localised_name = ""
		for idx, pooled_resource_key in ipairs(completion_condition_config.allowed_pooled_resources) do
			if #completion_condition_config.allowed_pooled_resources > 1 then
				if #localised_name == 0 then
					localised_name = common.get_localised_string("campaign_localised_strings_string_phar_sea_victory_objectives_common_any_type_of_resources")
				else
					localised_name = localised_name .. ", "
				end
			end
			local screen_name = journal_victory_objective_ui.get_localised_name_for_pooled_resource(pooled_resource_key)
			localised_name = localised_name .. screen_name
		end

		local progress_text = localised_name .. ": " .. progress_amount .. "/" .. completion_condition_config.amount

		local type = completion_condition_config.type
		local progress = { amount = progress_amount, max = completion_condition_config.amount }
		table.insert(objective_ui_data.conditions_progress_by_type[type], { progress_text = progress_text, progress = progress, is_completed = condition_is_completed })
	end,

	create_ui_data_for_condition_maintain_muwatalli_gratitude_per_turn = function(self, objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)

		-- make sure that current progress doesn't go over the maximum
		local gratitude_per_turn = condition_progress and condition_progress.current_amount or 0
		local progress_amount = math.min(gratitude_per_turn, completion_condition_config.amount)

		local progress_text = ""
		if completion_condition_config.ui and completion_condition_config.ui.custom_description then
			progress_text = common.get_localised_string(completion_condition_config.ui.custom_description)
		else
			progress_text = progress_amount .. "/" .. completion_condition_config.amount
		end

		local type = completion_condition_config.type
		local progress = { amount = progress_amount, max = completion_condition_config.amount }
		table.insert(objective_ui_data.conditions_progress_by_type[type], { progress_text = progress_text, progress = progress, is_completed = condition_is_completed })
	end,

	create_ui_data_for_condition_have_hammurabi_laws = function(self, objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
		
		local progress_text = ""
		local laws_count = condition_progress and condition_progress.gained_count or 0
		-- make sure that current progress doesn't go over the maximum
		local progress_amount = math.min(laws_count, completion_condition_config.amount)

		if completion_condition_config.ui and completion_condition_config.ui.custom_description then
			progress_text = common.get_localised_string(completion_condition_config.ui.custom_description)
		else
			progress_text = progress_amount .. "/" .. completion_condition_config.amount
		end

		local type = completion_condition_config.type
		local progress = { amount = progress_amount, max = completion_condition_config.amount }
		table.insert(objective_ui_data.conditions_progress_by_type[type], { progress_text = progress_text, progress = progress, is_completed = condition_is_completed })
	end,

	create_ui_data_for_condition_hatshepsut_cash_out_ancillary_or_effect_bundle = function(self, objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
		
		local progress_text = ""
		local total_cashed_out = condition_progress and condition_progress.total_cashed_out or 0
		-- make sure that current progress doesn't go over the maximum
		local progress_amount = math.min(total_cashed_out, completion_condition_config.amount)

		if completion_condition_config.ui and completion_condition_config.ui.custom_description then
			progress_text = common.get_localised_string(completion_condition_config.ui.custom_description)
		else
			progress_text = progress_amount .. "/" .. completion_condition_config.amount
		end

		local type = completion_condition_config.type
		local progress = { amount = progress_amount, max = completion_condition_config.amount }
		table.insert(objective_ui_data.conditions_progress_by_type[type], { progress_text = progress_text, progress = progress, is_completed = condition_is_completed })
	end,

	create_ui_data_for_condition_recruit_units = function(self, objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
		
		local progress_text = ""
		local recruited_amount = condition_progress and condition_progress.recruited_amount or 0
		-- make sure that current progress doesn't go over the maximum
		local progress_amount = math.min(recruited_amount, completion_condition_config.amount)

		if completion_condition_config.ui and completion_condition_config.ui.custom_description then
			progress_text = common.get_localised_string(completion_condition_config.ui.custom_description)
		else
			progress_text = progress_amount .. "/" .. completion_condition_config.amount
		end

		local type = completion_condition_config.type
		local progress = { amount = progress_amount, max = completion_condition_config.amount }
		table.insert(objective_ui_data.conditions_progress_by_type[type], { progress_text = progress_text, progress = progress, is_completed = condition_is_completed })
	end,

	create_ui_data_for_condition_use_eminence_obedience = function(self, objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
		
		local progress_text = ""
		local used_amount = condition_progress and condition_progress.used_amount or 0
		-- make sure that current progress doesn't go over the maximum
		local progress_amount = math.min(used_amount, completion_condition_config.amount)

		if completion_condition_config.ui and completion_condition_config.ui.custom_description then
			progress_text = common.get_localised_string(completion_condition_config.ui.custom_description)
		else
			progress_text = progress_amount .. "/" .. completion_condition_config.amount
		end

		local type = completion_condition_config.type
		local progress = { amount = progress_amount, max = completion_condition_config.amount }
		table.insert(objective_ui_data.conditions_progress_by_type[type], { progress_text = progress_text, progress = progress, is_completed = condition_is_completed })
	end,

	create_ui_data_for_condition_maintain_equipped_ancillaries = function(self, objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)
		
		local progress_text = ""
		local total_equipped = condition_progress and condition_progress.total_equipped or 0
		-- make sure that current progress doesn't go over the maximum
		local progress_amount = math.min(total_equipped, completion_condition_config.amount)

		if completion_condition_config.ui and completion_condition_config.ui.custom_description then
			progress_text = common.get_localised_string(completion_condition_config.ui.custom_description)
		else
			progress_text = progress_amount .. "/" .. completion_condition_config.amount
		end

		local type = completion_condition_config.type
		local progress = { amount = progress_amount, max = completion_condition_config.amount }
		table.insert(objective_ui_data.conditions_progress_by_type[type], { progress_text = progress_text, progress = progress, is_completed = condition_is_completed })
	end,

	create_ui_data_for_condition_capture_settlements_with_thutmose_culmination = function(self, objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)

		local progress_text = ""
		local culminations_amount = condition_progress and condition_progress.culminations_amount or 0
		-- make sure that current progress doesn't go over the maximum
		local progress_amount = math.min(culminations_amount, completion_condition_config.amount)

		if completion_condition_config.ui and completion_condition_config.ui.custom_description then
			progress_text = common.get_localised_string(completion_condition_config.ui.custom_description)
		else
			progress_text = progress_amount .. "/" .. completion_condition_config.amount
		end

		local type = completion_condition_config.type
		local progress = { amount = progress_amount, max = completion_condition_config.amount }
		table.insert(objective_ui_data.conditions_progress_by_type[type], { progress_text = progress_text, progress = progress, is_completed = condition_is_completed })
	end,

	create_ui_data_for_condition_complete_ambitions = function(self, objective_ui_data, condition_progress, completion_condition_config, condition_is_completed)

		local progress_text = ""
		local completed_amount = condition_progress and condition_progress.completed_amount or 0
		-- make sure that current progress doesn't go over the maximum
		local progress_amount = math.min(completed_amount, completion_condition_config.amount)

		if completion_condition_config.ui and completion_condition_config.ui.custom_description then
			progress_text = common.get_localised_string(completion_condition_config.ui.custom_description)
		else
			progress_text = progress_amount .. "/" .. completion_condition_config.amount
		end

		local type = completion_condition_config.type
		local progress = { amount = progress_amount, max = completion_condition_config.amount }
		table.insert(objective_ui_data.conditions_progress_by_type[type], { progress_text = progress_text, progress = progress, is_completed = condition_is_completed })
	end,

	-- utility functions
	get_localised_name_for_pooled_resource = function(pooled_resource_key)
		local screen_name = cco("CcoPooledResourceRecord", pooled_resource_key):Call("Name")
		if not screen_name then
			screen_name = "Missing resource: " .. pooled_resource_key
		end

		return screen_name
	end,
}

cm:add_first_tick_callback(
	function() 
		journal_victory_objective_ui.add_listeners(journal_victory_objective_ui)
	end
)