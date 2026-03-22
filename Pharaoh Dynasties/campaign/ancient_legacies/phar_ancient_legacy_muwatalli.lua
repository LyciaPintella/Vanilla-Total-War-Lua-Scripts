out("Loading phar_ancient_legacy_muwatalli.lua")

require("phar_ancient_legacy_muwatalli_config")

ancient_legacy_muwatalli = {
	config = muwatalli_config,
	persistent = {
		faction_key = "",
		active_effect_bundle_key = "",
		gained_ancillaries_this_turn = {}
	},

	utility = {
		get_public_order_gratitude_threshold_index = function(public_order)
			local result_threshold_index = #muwatalli_config.public_order_gratitude_thresholds
			for i, public_order_gratitude_threshold in ipairs(muwatalli_config.public_order_gratitude_thresholds) do 
				if public_order_gratitude_threshold.public_order_lower_bound <= public_order then
					result_threshold_index = i
				end
			end
			return result_threshold_index
		end,

		get_vassal_gratitude_max_threshold = function()
			return muwatalli_config.vassal_gratitude_thresholds[#muwatalli_config.vassal_gratitude_thresholds]
		end,

		get_threshold_config_by_gratitude = function(gratitude, max_gratitude)
			for index, threshold_config in ipairs(muwatalli_config.gratitude_thresholds) do
				local next_threshold = muwatalli_config.gratitude_thresholds[index + 1]
				local higher_bound = next_threshold and next_threshold.lower_bound or max_gratitude
	
				if threshold_config.lower_bound <= gratitude and gratitude <= higher_bound then
					return threshold_config
				end
			end

			return nil
		end,
	},

	--------------------------------------------------------------------
	-------------------------- Public Methods --------------------------
	------------ These methods have parameter error checking -----------
	--------- Or are meant to be called from outside the script --------
	--------------------------------------------------------------------

	-- public function
	calculate_average_public_order_for_faction = function(self, faction)
		if not faction or faction:is_null_interface() then
			script_error("Muwatalli: (calculate_average_public_order_for_faction) invalid faction")
			return 0
		end

		local total_public_order = 0
		local province_list = faction:province_list()
		local total_owned_provinces = province_list:num_items()
		for i = 0, total_owned_provinces - 1 do
			local province = province_list:item_at(i)
			if province and (not province:is_null_interface()) then
				total_public_order = total_public_order + province:public_order(faction:name())
			end
		end

		local faction_average_public_order = 0
		if total_owned_provinces > 0 then
			faction_average_public_order = math.ceil(total_public_order / total_owned_provinces)
		end

		return faction_average_public_order
	end,

	-- public function
	calculate_gratitude_from_public_order = function(self, faction)
		if not faction or faction:is_null_interface() then
			script_error("Muwatalli: (calculate_gratitude_from_public_order) invalid faction")
			return 0
		end

		if not self.config.public_order_gratitude_thresholds or table.is_empty(self.config.public_order_gratitude_thresholds) then
			script_error("Muwatalli: (calculate_gratitude_from_public_order) missing configuration for table public_order_gratitude_thresholds")
			return 0
		end

		local faction_average_public_order = self:calculate_average_public_order_for_faction(faction)
		local threshold_index = self.utility.get_public_order_gratitude_threshold_index(faction_average_public_order)
		if threshold_index <= 0 then
			return 0
		end

		return self.config.public_order_gratitude_thresholds[threshold_index].gratitude
	end,

	-- public function
	calculate_per_turn_gratitude = function(self, faction)
		if faction:is_null_interface() then
			script_error("Muwatalli: (calculate_per_turn_gratitude) passed invalid faction.")
			return 0
		end

		local gratitude_from_public_order = self:calculate_gratitude_from_public_order(faction)
		local gratitude_from_vassals = self:calculate_gratitude_from_vassals(faction)
		return gratitude_from_public_order + gratitude_from_vassals
	end,

	--------------------------------------------------------------------
	------------------------- Private Methods --------------------------
	-------- These methods do NOT have parameter error checking --------
	------ Or aren't meant to be called from outside this script -------
	--------------------------------------------------------------------

	-- private function
	on_legacy_claimed = function(self, faction_key)

		local local_faction_name = cm:get_local_faction_name(true)

		local faction = cm:get_faction(faction_key)
		if (not faction) or faction:is_null_interface() then
			script_error("Muwatalli: Trying to claim legacy on a non existing faction: " .. tostring(faction_key))
			return
		end

		self.persistent = {
			faction_key = faction_key,
			active_effect_bundle_key = "",
			gained_ancillaries_this_turn = {}
		}

		-- start with predefined amount of gratitude
		cm:faction_add_pooled_resource(self.persistent.faction_key, self.config.resource_key, self.config.resource_factor_reward, self.config.starting_gratitude)

		self:update_gratitude_threshold_active_effect_bundle()

		if local_faction_name == faction_key then
			egypt_political_states:activate_button(ancient_legacy_muwatalli.ui.config.component_ids.legacy_panel_button, true)
		end
	end,

	--------------------------------------------------------------------
	------------------ Generating gratitude functions ------------------
	--------------------------------------------------------------------
	-- private function
	calculate_gratitude_from_vassal = function(self, active_faction, vassal_faction)

		if not self.config.vassal_gratitude_thresholds or table.is_empty(self.config.vassal_gratitude_thresholds) then
			script_error("Muwatalli: (calculate_gratitude_from_vassal) missing configuration for table vassal_gratitude_thresholds.")
			return 0
		end

		local attitude = vassal_faction:diplomatic_attitude_towards(active_faction:name())

		-- by design we don't want to change gratitude when attitude is negative ( think about moving this as a separate threshold )
		if attitude < 0 then
			return 0
		end

		local result_threshold_index = #self.config.vassal_gratitude_thresholds
		for i, vassal_gratitude_threshold in ipairs(self.config.vassal_gratitude_thresholds) do 
			if vassal_gratitude_threshold.attitude_lower_bound <= attitude then
				result_threshold_index = i
			end
		end

		return self.config.vassal_gratitude_thresholds[result_threshold_index].gratitude
	end,

	-- private function
	calculate_gratitude_from_vassals = function(self, active_faction)

		local sum_vassals_gratitude = function(vassals_list)
			local gratitude_sum = 0
			
			for i = 0, vassals_list:num_items() - 1 do
				local vassal_faction = vassals_list:item_at(i)
				if vassal_faction and (not vassal_faction:is_null_interface()) then
					gratitude_sum = gratitude_sum + self:calculate_gratitude_from_vassal(active_faction, vassal_faction)
				end
			end

			return gratitude_sum
		end

		-- sum gratitude from both vassal systems in case we decide to switch between the implementations
		local total_gratitude = sum_vassals_gratitude(active_faction:factions_master_of()) + sum_vassals_gratitude(active_faction:factions_sovereign_of())
		return total_gratitude
	end,

	-- private function
	add_gratitude = function(self, total_gratitude)
		if total_gratitude == 0 then
			return
		end
		-- no need to clamp gratitude since this is already done through the pooled resource record min/max property
		cm:faction_add_pooled_resource(self.persistent.faction_key, self.config.resource_key, self.config.resource_factor_reward, total_gratitude)
	end,

	--------------------------------------------------------------------
	------------------- Actions (Tokens of Gratitude) ------------------
	--------------------------------------------------------------------

	-- private function
	gain_ancillary_action = function(self)

		if not self.config.actions.gain_ancillary.ancillaries_list or table.is_empty(self.config.actions.gain_ancillary.ancillaries_list) then
			script_error("Muwatalli: (gain_ancillary_action) missing configuration for table actions.gain_ancillary.ancillaries_list.")
			return false
		end

		local faction_obj = cm:get_faction(self.persistent.faction_key)
		local weighted_ancillaries_list = weighted_list:new()
		for _, ancillary_entry in ipairs(self.config.actions.gain_ancillary.ancillaries_list) do
			if faction_obj:can_equip_ancillary(ancillary_entry.key) then
				weighted_ancillaries_list:add_item(ancillary_entry.key, ancillary_entry.weight)
			end
		end

		if #weighted_ancillaries_list.items <= 0 then
			script_error("Muwatalli: (gain_ancillary_action) no ancillaries to give.")
			return
		end

		local random_ancillary = weighted_ancillaries_list:weighted_select()
		if not random_ancillary or #random_ancillary <= 0 then
			script_error("Muwatalli: (gain_ancillary_action) invalid ancillary key.")
			return false
		end

		cm:add_ancillary_to_faction(self.persistent.faction_key, random_ancillary, true)
		table.insert(self.persistent.gained_ancillaries_this_turn, random_ancillary)
		return true
	end,

	-- private function
	gain_free_instant_construction_action = function(self)

		if not is_number(self.config.actions.free_instant_construction.amount_gained_per_use) then
			script_error("Muwatalli: (gain_free_instant_construction_action) missing configuration for table actions.free_instant_construction.amount_gained_per_use")
			return false
		end

		local active_faction = cm:get_faction(self.persistent.faction_key)
		if active_faction:is_null_interface() then
			script_error("Muwatalli: (gain_free_instant_construction_action) can't find owner faction.")
			return false
		end

		local current_free_instant_constructions = active_faction:free_instant_constructions()
		local new_free_instant_constructions = current_free_instant_constructions + self.config.actions.free_instant_construction.amount_gained_per_use
		cm:faction_set_free_instant_constructions(active_faction:name(), new_free_instant_constructions)
		return true
	end,

	-- private function
	gain_free_embed_informant_action = function(self)

		if not is_number(self.config.actions.free_embed_informant.amount_gained_per_use) then
			script_error("Muwatalli: (gain_free_embed_informant_action) missing configuration for table actions.free_embed_informant.amount_gained_per_use")
			return false
		end

		local active_faction = cm:get_faction(self.persistent.faction_key)
		if active_faction:is_null_interface() then
			script_error("Muwatalli: (gain_free_embed_informant_action) can't find owner faction.")
			return false
		end

		local current_free_embed_informants = active_faction:free_embed_informants()
		local new_free_embed_informants = current_free_embed_informants + self.config.actions.free_embed_informant.amount_gained_per_use
		cm:get_game_interface():faction_set_free_embed_informants(active_faction:name(), new_free_embed_informants)
		return true
	end,

	-- private function
	gain_extra_court_action_action = function(self)

		if not self.persistent.faction_key or #self.persistent.faction_key <= 0 then
			script_error("Muwatalli: (gain_extra_court_action_action) no owning faction.")
			return false
		end

		if not is_number(self.config.actions.extra_court_action.amount_gained_per_use) then
			script_error("Muwatalli: (gain_extra_court_action_action) missing configuration for table actions.extra_court_action.amount_gained_per_use")
			return false
		end

		court.util_functions.add_court_extra_actions_for_faction(self.persistent.faction_key, self.config.actions.extra_court_action.amount_gained_per_use)
		return true
	end,

	-- private function
	gain_unit_experience_action = function(self)

		local action_config = self.config.actions.unit_experience
		if not is_string(action_config.effect_bundle_key) or not is_number(action_config.effect_bundle_duration) then
			script_error("Muwatalli: (gain_unit_experience_action) missing configuration one or more of the following: effect_bundle_key/effect_bundle_duration.")
			return false
		end

		local active_faction = cm:get_faction(self.persistent.faction_key)
		if active_faction:is_null_interface() then
			script_error("Muwatalli: (gain_unit_experience_action) can't find owner faction.")
			return false
		end

		local effect_bundle = active_faction:get_effect_bundle(self.config.actions.unit_experience.effect_bundle_key)
		local existing_effect_bundle_duration = not effect_bundle:is_null_interface() and effect_bundle:duration() or 0

		-- apply_custom_effect_bundle_to_faction internally replaces the effect bundle if it already exists, so no need to remove it manually from here
		local bundle_to_apply = cm:create_new_custom_effect_bundle(action_config.effect_bundle_key)
		-- NOTE: each use of the action will reset the duration
		bundle_to_apply:set_duration(existing_effect_bundle_duration + action_config.effect_bundle_duration)
		cm:apply_custom_effect_bundle_to_faction(bundle_to_apply, active_faction)

		return true
	end,

	-- private function
	update_gratitude_threshold_active_effect_bundle = function(self)
		local active_faction = cm:get_faction(self.persistent.faction_key)
		if active_faction:is_null_interface() then
			script_error("Muwatalli: (update_gratitude_threshold_active_effect_bundle) can't find active faction with key: " .. self.persistent.faction_key)
			return
		end

		local active_effect_bundle_key = self.persistent.active_effect_bundle_key
		local threshold_config = self:get_gratitude_active_threshold_config(active_faction)
		local threshold_effect_bundle_key = threshold_config and threshold_config.effect_bundle_key or ""

		if threshold_effect_bundle_key ~= active_effect_bundle_key then
			if active_effect_bundle_key ~= "" then
				cm:remove_effect_bundle(active_effect_bundle_key, self.persistent.faction_key)
			end

			if threshold_effect_bundle_key ~= "" then
				cm:apply_effect_bundle(threshold_effect_bundle_key, self.persistent.faction_key, 0)
			end

			self.persistent.active_effect_bundle_key = threshold_effect_bundle_key
		end
	end,

	-- private function
	get_gratitude_active_threshold_config = function(self, active_faction)
		local pooled_resource = active_faction:pooled_resource(self.config.resource_key)
		if pooled_resource:is_null_interface() then
			return nil
		end

		local pooled_resource_amount = pooled_resource:value()
		if pooled_resource_amount < 0 then
			return nil
		end

		local result_threshold_index = #muwatalli_config.gratitude_thresholds
		for i, gratitude_threshold in ipairs(muwatalli_config.gratitude_thresholds) do 
			if gratitude_threshold.lower_bound <= pooled_resource_amount then
				result_threshold_index = i
			end
		end
		
		return muwatalli_config.gratitude_thresholds[result_threshold_index]
	end,

	get_listeners = function(_)
		return {
			{
				event = "FirstTickAfterWorldCreated",
				auto_check_faction = false,
				condition = function(self, context) 
					return cm:get_local_faction_name(true) == self.persistent.faction_key
				end,
				callback = function(self, context)
					-- activating the button should at some point be a common code for all ancient legacies
					egypt_political_states:activate_button(ancient_legacy_muwatalli.ui.config.component_ids.legacy_panel_button)
				end,
			},

			{
				event = "FactionTurnStart",
				auto_check_faction = true,
				condition = true,
				callback = function(self, context)
					self.persistent.gained_ancillaries_this_turn = {}

					local active_faction = cm:get_faction(self.persistent.faction_key)
					local gratitude = self:calculate_per_turn_gratitude(active_faction)
					self:add_gratitude(gratitude)

					core:trigger_event("ScriptEventMuwatalliStartedTurnWithGratitude", { faction = active_faction, gratitude = gratitude })
				end
			},

			{
				event = "PooledResourceTransactionEvent",
				auto_check_faction = true,
				condition = function(self, context)
					return context:resource():key() == self.config.resource_key
				end,
				callback = function(self, context)
					self:update_gratitude_threshold_active_effect_bundle()
				end
			},

			{
				event = "UITriggerScriptEvent",
				auto_check_faction = true,
				condition = true,
				callback = function(self, context)
					local params = context:trigger():split(":")
					if params[1] ~= "muwatalli_action" then
						return
					end

					local action_id = params[2]
					local action_config = self.config.actions[action_id]
					if not action_config then
						script_error("Muwatalli: (UITriggerScriptEvent(muwatalli_action)) can't find action with id: " .. action_id)
						return
					end

					local active_faction = cm:get_faction(self.persistent.faction_key)
					if active_faction:is_null_interface() then
						script_error("Muwatalli: (UITriggerScriptEvent(muwatalli_action)) can't find active faction with key: " .. self.persistent.faction_key)
						return
					end

					if action_config.cost > 0 then
						script_error("Muwatalli: (UITriggerScriptEvent(muwatalli_action)) cost should be a negative value")
						return
					end

					local pooled_resource = active_faction:pooled_resource(self.config.resource_key)
					if pooled_resource:is_null_interface() then
						script_error("Muwatalli: (UITriggerScriptEvent(muwatalli_action)) faction doesn't have pooled resource: " .. self.config.resource_key)
						return
					end

					local resource_amount = pooled_resource:value()
					if resource_amount < math.abs(action_config.cost) then
						script_error("Muwatalli: (UITriggerScriptEvent(muwatalli_action)) not enough pooled resource: " .. self.config.resource_key)
						return
					end

					cm:faction_add_pooled_resource(self.persistent.faction_key, self.config.resource_key, self.config.resource_factor_consumed_by_action, action_config.cost)

					local action_gained = false
					if action_id == self.config.actions.free_instant_construction.id then
						action_gained = self:gain_free_instant_construction_action()
					elseif action_id == self.config.actions.gain_ancillary.id then
						action_gained = self:gain_ancillary_action()
					elseif action_id == self.config.actions.free_embed_informant.id then
						action_gained = self:gain_free_embed_informant_action()
					elseif action_id == self.config.actions.extra_court_action.id then
						action_gained = self:gain_extra_court_action_action()
					elseif action_id == self.config.actions.unit_experience.id then
						action_gained = self:gain_unit_experience_action()
					end

					if action_gained and self.persistent.faction_key == cm:get_local_faction_name(true) then
						cm:notify_muwatalli_token_of_gratitude_gained(self.persistent.faction_key, action_id)
					end

					if self.config.gratitude_spent_event then
						local action_localised_key = "campaign_localised_strings_string_" .. action_config.ui_data.title_key
						cm:add_event_feed_event(
							self.config.gratitude_spent_event.event_key,
							self.persistent.faction_key,
							0,
							action_localised_key
						)
					end
					
					core:trigger_event("ScriptEventMuwatalliActionPurchased", { faction_name = self.persistent.faction_key })
				end,
			},

			{
				event = "PanelOpenedCampaign",
				auto_check_faction = true,
				condition = function(self, context)
					if context.string ~= ancient_legacy_muwatalli.ui.config.panel_name then
						return false
					end
					
					local local_faction_name = cm:get_local_faction_name(true)
					return self.persistent.faction_key == local_faction_name
				end,
				callback = function(self, context)
					local panel_component = UIComponent(context:panel_component())
					ancient_legacy_muwatalli.ui:on_panel_opened(self, self.persistent.faction_key, panel_component)
				end
			},
			
			{
				event = "PanelClosedCampaign",
				auto_check_faction = true,
				condition = function(self, context) 
					return context.string == ancient_legacy_muwatalli.ui.config.panel_name
				end,
				callback = function(self, context)
					ancient_legacy_muwatalli.ui:on_panel_closed()
				end,
			},

			-- Only for development
			{
				event = "UIReloaded",
				auto_check_faction = true,
				condition = true,
				callback = function(self, context)
					local local_faction_name = cm:get_local_faction_name(true)
					if local_faction_name == self.persistent.faction_key then
						egypt_political_states:activate_button(ancient_legacy_muwatalli.ui.config.component_ids.legacy_panel_button)
					end
				end,
			},
		}
	end,

	-- persistent data is already loaded by ancient_legacy_common, we are just informed we are loaded
	on_loading_game = function(self, faction_key)
		if not self.persistent.gained_ancillaries_this_turn then
			self.persistent.gained_ancillaries_this_turn = {}
		end
	end,
}

return ancient_legacy_muwatalli
