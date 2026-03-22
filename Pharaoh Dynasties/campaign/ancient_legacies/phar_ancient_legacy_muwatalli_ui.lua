out("Loading phar_ancient_legacy_muwatalli_ui.lua")

ancient_legacy_muwatalli.ui = 
{
	config = 
	{
		panel_name = "legacy_muwatalli",

		component_ids = 
		{
			activate_action = "button_activate_action",
			legacy_panel_button = "button_fm_phar_muwatalli",
			actions_container = "action_buttons",
			vassals_gratitude_list = "vassals_gratitude_list",
			no_vassals_text = "no_vassals_tx",
			public_order_list = "public_order_list",
			current_threshold_effect_bundle_container = "current_effect_holder",
			gratitude_bar_container = "gratitude_bar",
		},

		component_user_properties =
		{
			selected_action_id = "selected_action_id",
		},

		cco_ids_prefixes =
		{
			action_name = "muwatalli_action_"
		},
		
		cco_ids =
		{
			common = "muwatalli_common",
			vassals_gratitude_list = "muwatalli_vassals_gratitude_list",
			public_order_gratitude = "muwatalli_public_order_gratitude",
			gratitude_thresholds = "muwatalli_gratitude_thresholds",
		},
	},

	legacy_object_data = 
	{
		--[[
		faction_key = "",
		legacy_object = nil,
		panel_component,
		--]]
	},

	on_panel_opened = function(self, legacy_object, faction_key, panel_component)
		self.legacy_object_data.faction_key = faction_key
		self.legacy_object_data.legacy_object = legacy_object
		self.legacy_object_data.panel_component = panel_component

		-- we don't want to spam with event listeners so we listen for ui events only when the panel is opened
		self:add_listeners()

		self:set_common_context_objects()
		self:set_action_buttons_context_objects()
		self:set_vassal_gratitude_context_objects()
		self:set_public_order_gratitude_context_objects()
		self:set_gratitude_thresholds_context_objects()
	end,

	on_panel_closed = function(self)
		self.legacy_object_data = {}
		-- we don't want to spam with event listeners so we listen for ui events only when the panel is opened
		self:remove_listeners()
	end,

	set_common_context_objects = function(self)
		local panel_component = self.legacy_object_data.panel_component
		local active_faction = cm:get_faction(self.legacy_object_data.faction_key)
		local gratitude_per_turn = self.legacy_object_data.legacy_object:calculate_per_turn_gratitude(active_faction)
		local pooled_resource = active_faction:pooled_resource(muwatalli_config.resource_key)
		local pooled_resource_amount = 0
		local pooled_resource_max = 0
		if not pooled_resource:is_null_interface() then
			pooled_resource_amount = pooled_resource:value()
			pooled_resource_max = pooled_resource:maximum_value()
		end
		local projected_pooled_resource_amount = pooled_resource_amount + gratitude_per_turn
		local projected_next_turn_threshold = ancient_legacy_muwatalli.utility.get_threshold_config_by_gratitude(projected_pooled_resource_amount, pooled_resource_max)

		local cco_common = 
		{
			GratitudePerTurn = gratitude_per_turn,
			ProjectedNextTurnEffectBundleKey = projected_next_turn_threshold and projected_next_turn_threshold.effect_bundle_key or ""
		}

		local cco_id = self.config.cco_ids.common
		panel_component:SetProperty("script_id", cco_id)

		-- create the context object after we have set property "script_id", since ContextInitScriptObject will pickup that such a cco has been changed
		-- thus refreshing in our case initializing the component
		common.set_context_value(cco_id, cco_common)
	end,

	set_action_buttons_context_objects = function(self)
		local panel_component = self.legacy_object_data.panel_component
		local actions_container = panel_component:SequentialFind(self.config.component_ids.actions_container)
		if not actions_container then
			return
		end
		
		local active_faction = cm:get_faction(self.legacy_object_data.faction_key)
		local pooled_resource = active_faction:pooled_resource(muwatalli_config.resource_key)
		local pooled_resource_max = 0
		local pooled_resource_amount = 0
		if not pooled_resource:is_null_interface() then
			pooled_resource_amount = pooled_resource:value()
			pooled_resource_max = pooled_resource:maximum_value()
		end

		for index, action_config in ipairs(muwatalli_config.actions) do
			local component_index = index - 1
			if component_index >= actions_container:ChildCount() then
				break
			end

			local projected_pooled_resource_amount = pooled_resource_amount + action_config.cost
			local projected_threshold_after_purchase = ancient_legacy_muwatalli.utility.get_threshold_config_by_gratitude(projected_pooled_resource_amount, pooled_resource_max)
			local current_reward_count = self:get_action_current_reward_count(active_faction, action_config.id)

			local cco_action = 
			{
				Id = action_config.id,
				TitleKey = action_config.ui_data.title_key,
				DescriptionKey = action_config.ui_data.description_key,
				FlavourKey = action_config.ui_data.flavour_key,
				IconPath = action_config.ui_data.icon_path,
				Cost = math.abs(action_config.cost), -- take absolute value since cost contains a negative value,
				ProjectedAfterPurchaseEffectBundleKey = projected_threshold_after_purchase and projected_threshold_after_purchase.effect_bundle_key or "",
				CurrentRewardCount = current_reward_count,
				GainedAncillariesThisTurn = action_config.id == muwatalli_config.actions.gain_ancillary.id and self.legacy_object_data.legacy_object.persistent.gained_ancillaries_this_turn or {},
				ProvidedEffectBundleKey = action_config.id == muwatalli_config.actions.unit_experience.id and muwatalli_config.actions.unit_experience.effect_bundle_key or ""
			}

			local cco_id = self.config.cco_ids_prefixes.action_name .. action_config.id
			local action_button = UIComponent(actions_container:Find(component_index))
			action_button:SetProperty("script_id", cco_id)

			-- create the context object after we have set property "script_id", since ContextInitScriptObject will pickup that such a cco has been changed
			-- thus refreshing in our case initializing the component
			common.set_context_value(cco_id, cco_action)
		end
	end,

	set_vassal_gratitude_context_objects = function(self)
		local panel_component = self.legacy_object_data.panel_component
		local vassals_gratitude_list_component = panel_component:SequentialFind(self.config.component_ids.vassals_gratitude_list)
		local no_vassals_text_component = panel_component:SequentialFind(self.config.component_ids.no_vassals_text)
		if not (vassals_gratitude_list_component and no_vassals_text_component)  then
			return
		end

		local create_vassal_gratitude_context_objects = function(vassals_list, active_faction)
			local vassal_gratitude_context_objects = {}
			for i = 0, vassals_list:num_items() - 1 do
				local vassal_faction = vassals_list:item_at(i)
				if vassal_faction and (not vassal_faction:is_null_interface()) then
					local gratitude = self.legacy_object_data.legacy_object:calculate_gratitude_from_vassal(active_faction, vassal_faction)
					table.insert(vassal_gratitude_context_objects, { FactionName = vassal_faction:name(), Gratitude = gratitude })
				end
			end

			return vassal_gratitude_context_objects
		end

		if vassals_gratitude_list_component then
			vassals_gratitude_list_component:SetProperty("script_id", self.config.cco_ids.vassals_gratitude_list)
		end

		if no_vassals_text_component then
			no_vassals_text_component:SetProperty("script_id", self.config.cco_ids.vassals_gratitude_list)
		end

		local vassals_list_cco = {}
		local active_faction = cm:get_faction(self.legacy_object_data.faction_key)
		table_append(vassals_list_cco, create_vassal_gratitude_context_objects(active_faction:factions_master_of(), active_faction))
		table_append(vassals_list_cco, create_vassal_gratitude_context_objects(active_faction:factions_sovereign_of(), active_faction))

		-- create the context object after we have set property "script_id", since ContextInitScriptObject will pickup that such a cco has been changed
		-- thus refreshing in our case initializing the component
		common.set_context_value(self.config.cco_ids.vassals_gratitude_list, vassals_list_cco)
	end,

	set_public_order_gratitude_context_objects = function(self)
		local panel_component = self.legacy_object_data.panel_component
		local public_order_list = panel_component:SequentialFind(self.config.component_ids.public_order_list)
		if not public_order_list then
			return
		end

		public_order_list:SetProperty("script_id", self.config.cco_ids.public_order_gratitude)

		local legacy_object = self.legacy_object_data.legacy_object
		local active_faction = cm:get_faction(self.legacy_object_data.faction_key)
		local faction_average_public_order = legacy_object:calculate_average_public_order_for_faction(active_faction)
		local threshold_index = ancient_legacy_muwatalli.utility.get_public_order_gratitude_threshold_index(faction_average_public_order)
		if threshold_index <= 0 then
			return
		end

		local threshold = legacy_object.config.public_order_gratitude_thresholds[threshold_index]
		local threshold_max = threshold.public_order_lower_bound
		local next_threshold_index = threshold_index + 1
		if next_threshold_index <= #legacy_object.config.public_order_gratitude_thresholds then
			local next_threshold = legacy_object.config.public_order_gratitude_thresholds[next_threshold_index]
			threshold_max = next_threshold.public_order_lower_bound
		else
			threshold_max = 100
		end

		local gratitude_from_public_order = legacy_object:calculate_gratitude_from_public_order(active_faction)
		local public_order_gratitude_cco = 
		{
			ThresholdTitleKey = threshold.title_key,
			ThresholdMin = threshold.public_order_lower_bound,
			ThresholdMax = threshold_max,
			Gratitude = gratitude_from_public_order,
			AveragePublicOrder = faction_average_public_order
		}

		-- create the context object after we have set property "script_id", since ContextInitScriptObject will pickup that such a cco has been changed
		-- thus refreshing in our case initializing the component
		common.set_context_value(self.config.cco_ids.public_order_gratitude, public_order_gratitude_cco)
	end,

	set_gratitude_thresholds_context_objects = function(self)
		local panel_component = self.legacy_object_data.panel_component
		local current_threshold_effect_bundle_container = panel_component:SequentialFind(self.config.component_ids.current_threshold_effect_bundle_container)
		if current_threshold_effect_bundle_container then
			current_threshold_effect_bundle_container:SetProperty("script_id", self.config.cco_ids.gratitude_thresholds)
		end

		local gratitude_bar_container = panel_component:SequentialFind(self.config.component_ids.gratitude_bar_container)
		if gratitude_bar_container then
			gratitude_bar_container:SetProperty("script_id", self.config.cco_ids.gratitude_thresholds)
		end

		local active_faction = cm:get_faction(self.legacy_object_data.faction_key)
		local pooled_resource = active_faction:pooled_resource(muwatalli_config.resource_key)
		local pooled_resource_max = 0
		if not pooled_resource:is_null_interface() then
			pooled_resource_max = pooled_resource:maximum_value()
		end

		local gratitude_thresholds_cco = {}
		for index, threshold_config in ipairs(muwatalli_config.gratitude_thresholds) do
			local next_threshold = muwatalli_config.gratitude_thresholds[index + 1]
			local higher_bound = 0
			if next_threshold then
				higher_bound = next_threshold.lower_bound - 1
			else
				higher_bound = pooled_resource_max
			end

			table.insert(gratitude_thresholds_cco,
				{
					LowerBound = threshold_config.lower_bound,
					HigherBound = higher_bound,
					EffectBundleKey = threshold_config.effect_bundle_key,
					TitleKey = threshold_config.title_key,
					IconPath = threshold_config.icon_path
				})
		end

		-- create the context object after we have set property "script_id", since ContextInitScriptObject will pickup that such a cco has been changed
		-- thus refreshing in our case initializing the component
		common.set_context_value(self.config.cco_ids.gratitude_thresholds, gratitude_thresholds_cco)
	end,

	-- returns a number telling the player the amount of "something" they have that is awarded by the given action
	get_action_current_reward_count = function(self, active_faction, action_id)
		if action_id == muwatalli_config.actions.free_instant_construction.id then
			return active_faction:free_instant_constructions()
		elseif action_id == muwatalli_config.actions.free_embed_informant.id then
			return active_faction:free_embed_informants()
		elseif action_id == muwatalli_config.actions.extra_court_action.id then
			return court.util_functions.get_available_court_actions(self.legacy_object_data.faction_key)
		elseif action_id == muwatalli_config.actions.unit_experience.id then
			local effect_bundle = active_faction:get_effect_bundle(muwatalli_config.actions.unit_experience.effect_bundle_key)
			return not effect_bundle:is_null_interface() and effect_bundle:duration() or 0
		end

		return -1
	end,

	add_listeners = function(self)
		core:add_listener(
			"Muwatalli_ComponentLClickUp",
			"ComponentLClickUp",
			function(context)
				local ui_component = UIComponent(context.component)
				return ui_component:Id() == self.config.component_ids.activate_action and uicomponent_descended_from(ui_component, self.config.panel_name)
			end,
			function(context)
				local ui_component = UIComponent(context.component)
				local selected_action_id = ui_component:GetProperty(self.config.component_user_properties.selected_action_id)
				if selected_action_id == "" then
					script_error("ERROR: No selected action")
					return
				end

				local local_faction_name = cm:get_local_faction_name(true)
				local local_faction_obj = cm:get_faction(local_faction_name)
				local local_faction_cqi = local_faction_obj:command_queue_index()
				
				local param_str = "muwatalli_action:" .. selected_action_id
				CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, param_str)
			end,
			true
		)

		core:add_listener (
			"Muwatalli_ScriptEventMuwatalliActionPurchased",
			"ScriptEventMuwatalliActionPurchased",
			function(context)
				return context.stored_table.faction_name == self.legacy_object_data.faction_key
			end,
			function(context)
				-- first refresh the data, then we send ui message, that way the components will be working with the latest data
				self:set_common_context_objects()
				self:set_action_buttons_context_objects()
				common.send_ui_update_message("muwatalli_action_purchased")
			end,
			true
		)
	end,

	remove_listeners = function(self)
		core:remove_listener("Muwatalli_ComponentLClickUp")
	end,
}