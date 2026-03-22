out("Loading phar_ancient_legacy_atreus.lua")

require("phar_ancient_legacy_atreus_config")

ancient_legacy_atreus = {
	config = ancient_legacy_atreus_config,
	
	persistent = {
		atreus_faction_key = "",	-- This will be set to the faction key of the Atreus legacy faction.

		--[[ Objectives per faction, with a key the faction key/name. Once Atreus legacy faction gets into a war with a faction, the objectives for that faction get generated. Those have the following structure:
			faction_key = {
				objective_methods = {
					{
						completed = true/false,
						reward = dominance_amount,	-- This is the base reward value. Use ancient_legacy_atreus:get_objective_reward to get the value after possible changes!
					},
				},
			},
		--]]
		faction_objectives = {
		},

		--[[ This is in the following form:
			faction_key = 5,	-- The number of objectives completed against this faction.
		--]]
		achieved_total_dominance_against = {
		},
	},
}

-- This should have been ui.config, but it will be too much work to change it when transitioning to Pharaoh.
ancient_legacy_atreus.ui = {
	component_ids = {
		legacy_panel_button = "button_fm_phar_atreus",
	},
	panel_name = "map_legacy_atreus",
	dominance_bar = {
		background = "dom_bar_container",
		marker = "marker_pos",
		current_amount = "dy_dom_current",
	},
	faction_list = {
		container = "container_at_war",
		property_faction_key = "faction_key",
		sort_arrows = "sort_arrows",
		initial_sort_by_arrow = "sort_objectives",
		empty = "empty_list",
		view = "list_view",
		list = "list_box",
		template = "row_template",
		template_instance_prefix = "faction_instance_",
		info_holder = "info_holder",
		info_holder_states = { collapsed = "selected", expanded = "unselected", },
		emblem = "mon",
		name = "name",
		balance_of_power = { component = "bop_bar", rank = "label_strength_rank", player = "player", enemy = "enemy", },
		status = "pip_status",
		status_state = { war = "war", neutral = "0", defensive_alliance = "allied", military_alliance = "allied_military" },
		attitude = "attitude",
		objectives_count = "dy_objectives",
		dominated = "tx_dominated",
		destroyed = "tx_subjugated",
	},
	objectives = {
		panel = "objectives_panel",	-- The use of this component is obsolete in the new layout. We sipmly ensure it is not visible.
		holder = "objectives_holder",
		dominated = "faction_dominated",
		dead = "faction_dead",
		at_peace = "faction_at_peace",
		template = "template_row",
		template_instance_prefix = "objective_instance_",
		template_total_dominance_id = "objective_total_dominance",
		template_states = { active = "active", completed = "completed", impossible = "locked", },
		text = "dy_objective_text",
		text_states = { active = "active", completed = "completed", impossible = "locked", },
		bullet = "bullet",
		bullet_states = { active = "active", completed = "completed", impossible = "locked", },
		reward = "dy_reward_text",
		ancillary_rewaord = "reward_ancillary",
		target = "dy_target_template",
		target_states = { not_currently_possible = "invalid", },
		target_name = "dy_target_name",
		target_icon = "icon_complete",
		target_icon_states = { active = "incomplete", completed = "complete", impossible = "impossible", },
	},
	auto_select_active_faction = true,
	ruler_dominance = {
		crown_panel_name = "pharaohs_crown",
		button = "button_ruler_dominance",
		event = "ruler_dominance_activated",	-- Used for both the local and CCQ events.
		coo_tooltip_id = "atreus_pharaoh_crown_ruler_dominance_tooltip",
	},
	mechanic_redirections = {
		diplomacy = { "portrait_diplomacy", "diplomacy_button", },
		court = { "portrait_court", "court_button", },
		pharaohs_crown = { "portrait_phar_crown", "poc_button", },
	},
}

ancient_legacy_atreus.on_legacy_claimed = function(self, faction_key)
	local faction = cm:get_faction(faction_key)
	if (not faction) or faction:is_null_interface() then
		script_error("AL Atreus: Trying to claim legacy on a non existing faction: " .. tostring(faction_key))
		return
	end

	self.persistent.atreus_faction_key = faction_key

	-- Start with a predefined amount of dominance.
	cm:faction_add_pooled_resource(self.persistent.atreus_faction_key, self.config.resource_key, self.config.factor_key, self.config.resource_starting_amount)

	-- Allow the Atreus faction to use dominance in diplomacy
	cm:force_diplomacy("faction:" .. faction_key, "all", "dominance", true, true, false)

	-- Generate a closure of the objectives methods table with this legacy object/instance bound in its functions.
	-- NOTE: This is not part of the persistent data, but needs to be generated every time the legacy is claimed or a game is loaded.
	self.objectives_methods = self:objectives_methods_generator()

	self:add_listeners()	-- Start the listeners for this legacy object.

	local factions_at_war_with = faction:factions_at_war_with()
	for i = 0, factions_at_war_with:num_items() - 1 do
		self:generate_objectives(factions_at_war_with:item_at(i))
	end

	local local_faction_name = cm:get_local_faction_name(true)
	if local_faction_name == faction_key then
		aegean_political_states:activate_button(ancient_legacy_atreus.ui.component_ids.legacy_panel_button, true)

		local ui_override = uim:override("hide_resource_" .. self.config.resource_key, true)
		if ui_override then
			ui_override:unlock(true)
		end
	end
end

ancient_legacy_atreus.is_ruler_dominance_active = function(self)
	local atreus_faction = cm:get_faction(self.persistent.atreus_faction_key)
	local legitimacy_object = legitimacy_choice:get_unlocked_legitimacy(self.persistent.atreus_faction_key)	-- This should be valid, as the legacy should not be claimed without a valid legitimacy object.
	local legitimacy_resource_key = legitimacy_object.config.resource_key
	local legitimacy_resource = atreus_faction:pooled_resource(legitimacy_resource_key)
	if not legitimacy_resource or legitimacy_resource:is_null_interface() then
		script_error("AL Atreus: Error, legitimacy resource " .. legitimacy_resource_key .. " not found for faction " .. self.persistent.atreus_faction_key)
		return false
	end

	local legitimacy_factors = legitimacy_resource:factors()
	for i = 0, legitimacy_factors:num_items() - 1 do
		local factor = legitimacy_factors:item_at(i)
		local factor_key = factor:factor_key()
		if factor_key == ancient_legacy_atreus.config.ruler_dominance.factor_key then
			return factor:value() > 0
		end
	end

	return false
end

ancient_legacy_atreus.is_pretender_in_legitimacy_war = function(self)
	local legitimacy_object = legitimacy_choice:get_unlocked_legitimacy(self.persistent.atreus_faction_key)	-- This should be valid, as the legacy should not be claimed without a valid legitimacy object.
	local political_states_object = legitimacy_object.political_states_system
	local is_legitimacy_war = political_states_object:political_state() == "legitimacy_war"
	return is_legitimacy_war and table_contains(political_states_object.persistent.pretenders, self.persistent.atreus_faction_key)
end

-- Returns the ruler dominance resource cost object and whether the faction can afford it or not.
ancient_legacy_atreus.get_ruler_dominance_resource_cost = function(self)
	local atreus_faction = cm:get_faction(self.persistent.atreus_faction_key)
	local resource_cost_obj = cm:create_new_custom_resource_cost()
	resource_cost_obj:get_cost_from_record(self.config.ruler_dominance.dominance_resource_cost_key)
	local can_afford = atreus_faction:can_afford_resource_cost_object(resource_cost_obj)
	return resource_cost_obj, can_afford
end

ancient_legacy_atreus.get_ruler_dominance_legitimacy_cost_key = function(self, legitimacy_object)
	local legitimacy_resource_key = legitimacy_object.config.resource_key
	return self.config.ruler_dominance.legitimacy_resource_cost_keys[legitimacy_resource_key]
end

-- Returns the amount of legitimacy that the ruler dominance will provide.
ancient_legacy_atreus.get_ruler_dominance_legitimacy_amount = function(self, legitimacy_object)
	local legitimacy_resource_cost_key = self:get_ruler_dominance_legitimacy_cost_key(legitimacy_object)
	local legitimacy_resource_cost = cm:create_new_custom_resource_cost()
	legitimacy_resource_cost:get_cost_from_record(legitimacy_resource_cost_key)
	local legitimacy_resource_cost_as_table = legitimacy_resource_cost:resources()
	for _, pooled_resource_cost in ipairs(legitimacy_resource_cost_as_table) do
		if pooled_resource_cost[1] == legitimacy_object.config.resource_key then
			return pooled_resource_cost[2]
		end
	end
	script_error("AL Atreus: Trying to get the ruler dominance legitimacy amount, but it is not present in the respective legitimacy resource cost: " .. legitimacy_resource_cost_key)
	return 0
end

ancient_legacy_atreus.activate_ruler_dominance = function(self)
	if self:is_ruler_dominance_active() then
		script_error("AL Atreus: Trying to activate ruler dominance, but it is already active for faction: " .. self.persistent.atreus_faction_key)
		return
	end

	if not self:is_pretender_in_legitimacy_war() then
		script_error("AL Atreus: Trying to activate ruler dominance, but Atreus faction is not a pretender in a Legitimacy war. Faction: " .. self.persistent.atreus_faction_key)
		return
	end

	local cost_obj, can_afford = self:get_ruler_dominance_resource_cost()
	if not can_afford then
		script_error("AL Atreus: Trying to activate ruler dominance, but it is not affordable for faction: " .. self.persistent.atreus_faction_key)
		return
	end

	local atreus_faction = cm:get_faction(self.persistent.atreus_faction_key)
	cm:faction_apply_resource_transaction(atreus_faction, cost_obj)

	local legitimacy_object = legitimacy_choice:get_unlocked_legitimacy(self.persistent.atreus_faction_key)	-- This should be valid, as the legacy should not be claimed without a valid legitimacy object.
	local legitimacy_amount = self:get_ruler_dominance_legitimacy_amount(legitimacy_object)
	legitimacy_object:add_legitimacy(self.persistent.atreus_faction_key, ancient_legacy_atreus.config.ruler_dominance.factor_key, legitimacy_amount)

	if self.persistent.atreus_faction_key == cm:get_local_faction_name(true) then
		local crown_panel = find_uicomponent(core:get_ui_root(), ancient_legacy_atreus.ui.ruler_dominance.crown_panel_name)
		if crown_panel then
			ancient_legacy_atreus.ui.crown_panel_update_ruler_dominance_button(crown_panel)
		end
	end
end

ancient_legacy_atreus.deactivate_ruler_dominance = function(self)
	if not self:is_ruler_dominance_active() then
		script_error("AL Atreus: Trying to deactivate ruler dominance, but it is not active for faction: " .. self.persistent.atreus_faction_key)
		return
	end

	local legitimacy_object = legitimacy_choice:get_unlocked_legitimacy(self.persistent.atreus_faction_key)	-- This should be valid, as the legacy should not be claimed without a valid legitimacy object.
	local legitimacy_amount = self:get_ruler_dominance_legitimacy_amount(legitimacy_object)
	legitimacy_object:add_legitimacy(self.persistent.atreus_faction_key, ancient_legacy_atreus.config.ruler_dominance.factor_key, -legitimacy_amount)
end

ancient_legacy_atreus.check_battle_side_for_battle_dominance_conditions = function(self, battle_result, main_general, reinforcing_generals)
	if is_table(self.config.battle_dominance.allowed_battle_results) and not table_contains(self.config.battle_dominance.allowed_battle_results, battle_result) then
		return false
	end
	return reinforcing_generals:is_empty() and self:is_atreus_faction_among(main_general)
end

ancient_legacy_atreus.process_battle_for_battle_dominance = function(self, battle)
	local atreus_func_index, enemy_func_index = nil, nil
	local attacking_general, attacking_reinforcing_generals = battle:attacker(), battle:secondary_attackers()
	local defending_general, defending_reinforcing_generals = battle:defender(), battle:secondary_defenders()
	if self:check_battle_side_for_battle_dominance_conditions(battle:attacker_battle_result(), attacking_general, attacking_reinforcing_generals) then
		atreus_func_index, enemy_func_index = 1, 2
	elseif self:check_battle_side_for_battle_dominance_conditions(battle:defender_battle_result(), defending_general, defending_reinforcing_generals) then
		atreus_func_index, enemy_func_index = 2, 1
	else
		return	-- The battle does not fulfill the conditions for battle dominance.
	end

	local func_num_participants = { cm.pending_battle_cache_num_attackers, cm.pending_battle_cache_num_defenders }
	local func_num_participant_units = { cm.pending_battle_cache_num_attacker_units, cm.pending_battle_cache_num_defender_units }
	local func_get_participant_unit = { cm.pending_battle_cache_get_attacker_unit, cm.pending_battle_cache_get_defender_unit }

	local calculate_side_units_value = function(func_index)
		local total_value = 0
		local num_participants = func_num_participants[func_index](cm)
		for i = 1, num_participants do
			local num_units = func_num_participant_units[func_index](cm, i)
			for j = 1, num_units do
				local _, unit_key = func_get_participant_unit[func_index](cm, i, j)
				local unit_record_cco = cco("CcoMainUnitRecord", unit_key)
				local unit_value = unit_record_cco and unit_record_cco:Call("Cost") or 0
				total_value = total_value + unit_value
			end
		end
		return total_value
	end

	local atreus_units_value = calculate_side_units_value(atreus_func_index)
	local enemy_units_value = calculate_side_units_value(enemy_func_index)
	local units_value_delta = enemy_units_value - atreus_units_value
	local units_value_dominance = math.ceil(math.max(0, units_value_delta) * self.config.battle_dominance.unit_value_multiplier)
	if units_value_dominance <= 0 and not self.config.battle_dominance.reward_variance_if_unit_value_is_negative then
		return	-- If the enemy units value is not higher than the Atreus units value, no dominance is gained, including no dominance from variance..
	end

	local variance = cm:model():random_int(self.config.battle_dominance.variance_min, self.config.battle_dominance.variance_max)
	local reward = units_value_dominance + variance
	if reward > 0 then
		cm:faction_add_post_battle_looted_resource(self.persistent.atreus_faction_key, self.config.resource_key, self.config.factor_key, reward)
	end
end

ancient_legacy_atreus.get_objectives_count = function(self, faction_key, include_completed, include_uncompleted, include_currently_impossible)
	local count = 0
	for methods, objectives in pairs(self.persistent.faction_objectives[faction_key]) do
		for _, objective in ipairs(objectives) do
			if objective.completed then
				if include_completed then
					count = count + 1
				end
			elseif include_uncompleted then
				if include_currently_impossible then	-- Simplify the flow by not checking if the condition is currently possible as we would include it anyway.
					count = count + 1
				else
					-- Checks only if the objective is currently possible, as if it is impossible in general, it will also be currently impossible.
					local _, is_currently_possible = true, true
					local objective_methods = self.objectives_methods[methods]
					if objective_methods.get_is_possible_and_target then
						_, is_currently_possible = objective_methods.get_is_possible_and_target(objective, cm:get_faction(faction_key))
					end
					if is_currently_possible then
						count = count + 1
					end
				end
			end
		end
	end
	return count
end

ancient_legacy_atreus.get_all_objectives_count = function(self, faction_key)
	return self:get_objectives_count(faction_key, true, true, true)
end

ancient_legacy_atreus.get_completed_objectives_count = function(self, faction_key)
	return self:get_objectives_count(faction_key, true, false, false)
end

ancient_legacy_atreus.get_active_objectives_count = function(self, faction_key)
	return self:get_objectives_count(faction_key, false, true, true)
end

ancient_legacy_atreus.get_possible_objectives_count = function(self, faction_key)
	return self:get_objectives_count(faction_key, false, true, false)
end

ancient_legacy_atreus.get_active_objective = function(self, faction, objective_methods, objective_condition)	-- Returns the first active objective that fulfills the conditions.
	local faction_key = faction:name()
	if self:has_achieved_total_dominance_against(faction_key) then
		return nil	-- Total dominance has been achieved against this faction, so all objectives are inactive.
	end

	if self.persistent.faction_objectives[faction_key] and self.persistent.faction_objectives[faction_key][objective_methods] and faction:at_war_with(cm:get_faction(self.persistent.atreus_faction_key)) then
		for _, o in ipairs(self.persistent.faction_objectives[faction_key][objective_methods]) do
			if not o.completed and (not objective_condition or objective_condition(o)) then
				return o
			end
		end
	end
	return nil
end

ancient_legacy_atreus.get_objective_reward = function(self, faction_objective, objective_methods)
	local result = faction_objective.reward
	return result
end

ancient_legacy_atreus.complete_objective = function(self, faction_objective, objective_methods, objective_target_faction_name)
	faction_objective.completed = true
	local reward = self:get_objective_reward(faction_objective, objective_methods)
	cm:faction_add_pooled_resource(self.persistent.atreus_faction_key, self.config.resource_key, self.config.factor_key, reward) 
	self:trigger_event(self.persistent.atreus_faction_key, "dominance_gained", objective_methods, reward, 0, 0, objective_target_faction_name)

	self:check_for_achieved_total_dominance_against(objective_target_faction_name)
end

ancient_legacy_atreus.is_atreus_faction_among = function(self, character, characters_list)
	if character and not character:is_null_interface() and character:faction():name() == self.persistent.atreus_faction_key then
		return true
	end
	if is_characterlist(characters_list) then
		for i = 0, characters_list:num_items() - 1 do
			local list_character = characters_list:item_at(i)
			if not list_character:is_null_interface() and list_character:faction():name() == self.persistent.atreus_faction_key then
				return true
			end
		end
	end
	return false
end

ancient_legacy_atreus.check_objective_for_character = function(self, character, character_check, objective_methods, objective_check)
	if character and not character:is_null_interface() and (not character_check or character_check(character)) then
		local objective_check_wrapper = objective_check and function(faction_objective) return objective_check(faction_objective, character) end
		local char_faction = character:faction()
		local active_objective = self:get_active_objective(char_faction, objective_methods, objective_check_wrapper)
		if active_objective then
			self:complete_objective(active_objective, objective_methods, char_faction:name())
		end
	end
end

ancient_legacy_atreus.check_objective_for_characters = function(self, character, characters_list, character_check, objective_methods, objective_check)
	self:check_objective_for_character(character, character_check, objective_methods, objective_check)
	for i = 0, characters_list:num_items() - 1 do
		self:check_objective_for_character(characters_list:item_at(i), character_check, objective_methods, objective_check)
	end
end

-- As we need the legacy object/instance bound in the functions of the objectives, we generate a closure instance of the table.
-- Hence this function is a generator for the objectives methods.
ancient_legacy_atreus.objectives_methods_generator = function(self)
	methods = {}

	methods.defeat_faction_leader = {
		listeners = {
			{
				event = "BattleConflictFinished",
				filter = true,
				body = function(context)
					local objective_methods = "defeat_faction_leader"
					local is_faction_leader = function(general) return not general:is_null_interface() and general:is_faction_leader() end
					local battle = context:pending_battle()
					local attacking_general, attacking_reinforcing_generals = battle:attacker(), battle:secondary_attackers()
					local defending_general, defending_reinforcing_generals = battle:defender(), battle:secondary_defenders()
					if battle:attacker_battle_result():ends_with("victory") and self:is_atreus_faction_among(attacking_general, attacking_reinforcing_generals) then
						self:check_objective_for_characters(defending_general, defending_reinforcing_generals, is_faction_leader, objective_methods)
					elseif battle:defender_battle_result():ends_with("victory") and self:is_atreus_faction_among(defending_general, defending_reinforcing_generals) then
						self:check_objective_for_characters(attacking_general, attacking_reinforcing_generals, is_faction_leader, objective_methods)
					end
				end,
			},
		},

		get_is_possible_and_target = function(faction_objective, faction)
			local faction_leader = faction:has_faction_leader() and faction:faction_leader()
			return true, faction_leader and not faction_leader:is_wounded(), "family_member_cqi", not faction_objective.completed and faction_leader and faction_leader:family_member():command_queue_index()
		end,
	}

	methods.conquer_capital = {
		listeners = {
			{
				event = "CharacterPerformsSettlementOccupationDecisionBeforeOutcomeApplication",
				filter = function(context)
					local option = context:occupation_decision_option()
					return (option == "occupation_decision_occupy" or option == "occupation_decision_loot") and context:character():faction():name() == self.persistent.atreus_faction_key
				end,
				body = function(context)
					local objective_methods = "conquer_capital"
					local region = context:garrison_residence():region()
					local faction = region:owning_faction()
					local active_objective = (faction:has_home_region() and region:name() == faction:home_region():name()) and self:get_active_objective(faction, objective_methods)
					if active_objective then
						self:complete_objective(active_objective, objective_methods, faction:name())
					end
				end,
			},
		},

		get_is_possible_and_target = function(faction_objective, faction)
			return true, faction:has_home_region(), "region_key", not faction_objective.completed and faction:has_home_region() and faction:home_region():name()
		end,
	}

	methods.raid_resources = {
		generator = function(objective, faction)
			local resources = {}
			local regions = faction:region_list()
			for i = 0, regions:num_items() - 1 do
				local settlement = regions:item_at(i):settlement()
				if not settlement:is_null_interface() then
					table_add_unique(resources, settlement:production_type())
				end
			end
			table_erase_if(resources, function(e) return not objective.production_types[e] end)
			if #resources <= 0 then
				return nil
			end
			local model = faction:model()
			local data = objective.production_types[resources[model:random_int(1, #resources)]]
			local objective = {
				resource_key = data.resource_key,
				target_amount = data.amount_per_step * math.floor(model:turn_number() / objective.turns_per_step) + data.amount_base,
				current_amount = 0,
			}
			return { objective }
		end,

		listeners = {
			{
				event = "LandTradeRouteRaided",
				filter = function(context)
					local character = context:character()
					return character:has_region() and character:faction():name() == self.persistent.atreus_faction_key
				end,
				body = function(context)
					local objective_methods = "raid_resources"
					local objective_faction = context:character():region():owning_faction()
					local active_objective = self:get_active_objective(objective_faction, objective_methods)
					if active_objective then
						local resources = context:resources()
						active_objective.current_amount = active_objective.current_amount + (resources[active_objective.resource_key] or 0)
						if active_objective.current_amount >= active_objective.target_amount then
							self:complete_objective(active_objective, objective_methods, objective_faction:name())
						end
					end
				end,
			},
		},

		ui_details = function(faction_objective, faction)
			return faction_objective.current_amount, faction_objective.target_amount, faction:pooled_resource(faction_objective.resource_key):icon(), faction:pooled_resource_display_name(faction_objective.resource_key)
		end,
	}

	methods.raid_or_sack_resource_settlement = {
		generator = function(objective, faction)
			if not objective.production_types or #objective.production_types <= 0 then
				out("AL Atreus: Error, no settlement production types provided for objective " .. objective.methods)
				return nil
			end

			local regions_by_type = {}
			for i, pt in ipairs(objective.production_types) do
				regions_by_type[i] = {}
			end
			local regions = faction:region_list()
			for i = 0, regions:num_items() - 1 do
				local region = regions:item_at(i)
				local settlement = region:settlement()
				if not settlement:is_null_interface() then
					local production_type = settlement:production_type()
					for i = 1, #objective.production_types do
						if production_type == objective.production_types[i] then
							table.insert(regions_by_type[i], region)
							break
						end
					end
				end
			end

			table_erase_if(regions_by_type, function(e) return #e <= 0 end)
			regions_by_type = table_stable_sort(regions_by_type, function(a, b) return #a < #b end)
			if not objective.allow_selecting_capital and #regions_by_type >= 1 and #regions_by_type[1] == 1 and regions_by_type[1][1]:name() == faction:home_region():name() then
				table.remove(regions_by_type, 1)
			end
			if #regions_by_type <= 0 or #regions_by_type[1] <= 0 then
				return nil
			end
			local fewest_regions_count = #regions_by_type[1]
			table_erase_if(regions_by_type, function(e) return #e > fewest_regions_count end)
			local model = faction:model()
			repeat
				local type_index = model:random_int(1, #regions_by_type)
				local region_index = model:random_int(1, #regions_by_type[type_index])
				if objective.allow_selecting_capital or regions_by_type[type_index][region_index]:name() ~= faction:home_region():name() then
					return { { region_key = regions_by_type[type_index][region_index]:name() } }
				end
				table.remove(regions_by_type[type_index], region_index)
				if #regions_by_type[type_index] <= 0 then
					table.remove(regions_by_type, type_index)
				end
			until #regions_by_type <= 0
			return nil
		end,

		listeners = {
			{
				event = "CharacterPerformsSettlementOccupationDecisionBeforeOutcomeApplication",
				filter = function(context)
					local option = context:occupation_decision_option()
					return (option == "occupation_decision_sack" or option == "occupation_decision_raze_without_occupy") and context:character():faction():name() == self.persistent.atreus_faction_key
				end,
				body = function(context)
					local objective_methods = "raid_or_sack_resource_settlement"
					local region = context:garrison_residence():region()
					local objective_faction = region:owning_faction()
					local active_objective = self:get_active_objective(objective_faction, objective_methods, function(faction_objective) return faction_objective.region_key == region:name() end)
					if active_objective then
						self:complete_objective(active_objective, objective_methods, objective_faction:name())
					end
				end,
			},
		},

		get_is_possible_and_target = function(faction_objective, faction)
			local region = cm:get_region(faction_objective.region_key)
			return true, region and region:owning_faction():name() == faction:name(), "region_key", faction_objective.region_key
		end,
	}

	methods.raze_region_slot = {
		generator = function(objective, faction)
			local region_slots = {}
			local faction_key = faction:name()
			local regions = faction:model():world():region_manager():region_list()
			for i = 0, regions:num_items() - 1 do
				local region = regions:item_at(i)
				local slots = region:slot_list()
				for j = 0, slots:num_items() - 1 do
					local slot = slots:item_at(j)
					if slot:is_infrastructure_slot() and slot:has_building() and slot:faction():name() == faction_key then
						table.insert(region_slots, { slot_key = slot:slot_key(), building_key = slot:building():name(), })
					end
				end
			end

			if #region_slots <= 0 then
				return nil
			end

			return { region_slots[faction:model():random_int(1, #region_slots)] }
		end,

		listeners = {
			{
				event = "CharacterPerformsRegionSlotOccupationDecisionBeforeOutcomeApplication",
				filter = function(context)
					local option = context:occupation_decision_option()
					return (option == "occupation_decision_ers_raze_without_occupy") and context:character():faction():name() == self.persistent.atreus_faction_key
				end,
				body = function(context)
					local objective_methods = "raze_region_slot"
					local region_slot = context:region_slot()
					local objective_faction = region_slot:faction()
					local objective_matches_region_slot = function(faction_objective)
						return faction_objective.slot_key == region_slot:slot_key() and faction_objective.building_key == region_slot:building():name()
					end

					local active_objective = self:get_active_objective(objective_faction, objective_methods, objective_matches_region_slot)
					if active_objective then
						self:complete_objective(active_objective, objective_methods, objective_faction:name())
					end
				end,
			},
		},

		get_is_possible_and_target = function(faction_objective, faction)
			local slot = faction:model():world():region_manager():slot_by_key(faction_objective.slot_key)
			local is_currently_possible = not slot:is_null_interface() and slot:has_building() and
				slot:building():name() == faction_objective.building_key and slot:faction():name() == faction:name()
			return true, is_currently_possible, "slot_key", faction_objective.slot_key, faction_objective.building_key
		end,
	}

	methods.kill_general = {
		generator = function(objective, faction)
			local highest_rank = 0
			local generals = {}
			local characters = faction:character_list()
			for i = 0, characters:num_items() - 1 do
				local character = characters:item_at(i)
				if not character:is_null_interface() and character:character_type("general") and character:has_military_force() and (objective.allow_selecting_faction_leader or not character:is_faction_leader()) then
					table.insert(generals, character)
					highest_rank = math.max(highest_rank, character:rank())
				end
			end
			table_erase_if(generals, function(e) return e:rank() < highest_rank end)
			if #generals <= 0 then
				return nil
			end
			return { { general_family_member_cqi = generals[faction:model():random_int(1, #generals)]:family_member():command_queue_index() } }
		end,

		listeners = {
			{
				event = "CharacterKilledOtherCharacter",
				filter = function(context)
					return context:character():faction():name() == self.persistent.atreus_faction_key
				end,
				body = function(context)
					local objective_methods = "kill_general"
					local other_character = context:other_character()
					local other_character_faction = other_character:faction()
					local active_objective = self:get_active_objective(other_character_faction, objective_methods, function(faction_objective) return faction_objective.general_family_member_cqi == other_character:family_member():command_queue_index() end)
					if active_objective then
						self:complete_objective(active_objective, objective_methods, other_character_faction:name())
					end
				end,
			},
		},

		get_is_possible_and_target = function(faction_objective, faction)
			local family_member = faction:model():family_member_for_command_queue_index(faction_objective.general_family_member_cqi)
			return not family_member:is_null_interface() and family_member:is_alive(), not family_member:is_null_interface() and not family_member:is_convalescing(), "family_member_cqi", faction_objective.general_family_member_cqi
		end,
	}

	methods.ambush_enemy = {
		listeners = {
			{
				event = "BattleConflictFinished",
				filter = true,
				body = function(context)
					local objective_methods = "ambush_enemy"
					local battle = context:pending_battle()
					if battle:ambush_battle() and not battle:failed_ambush_battle() and battle:attacker_battle_result():ends_with("victory") and battle:attacker_faction():name() == self.persistent.atreus_faction_key then
						local defender_faction = battle:defender_faction()
						local active_objective = self:get_active_objective(defender_faction, objective_methods)
						if active_objective then
							self:complete_objective(active_objective, objective_methods, defender_faction:name())
						end
					end
				end,
			},
		},
	}

	methods.break_alliances = {
		generator = function(objective, faction)
			return faction:num_allies() >= 1 and {{}} or nil
		end,

		listeners = {
			{
				event = "PositiveDiplomaticEvent",
				filter = function(context)
					return context:character():faction():name() == self.persistent.atreus_faction_key
				end,
				body = function(context)
					local objective_methods = "break_alliances"
					local break_alliance_with = context:proposer():name() == self.persistent.atreus_faction_key and context:break_alliance_with_demanded() or context:break_alliance_with_offered()
					for i = 1, #break_alliance_with do
						local current_faction = cm:get_faction(break_alliance_with[i])
						local active_objective = self:get_active_objective(current_faction, objective_methods)
						if active_objective then
							self:complete_objective(active_objective, objective_methods, current_faction:name())
						end
					end
				end,
			},
		},

		get_is_possible_and_target = function(faction_objective, faction)
			return true, faction:num_allies() >= 1
		end,
	}

	methods.raze_specific_settlement = {
		generator = function(objective, faction)
			local objectives = {}
			for _, region_key in ipairs(objective.region_keys) do
				local region = cm:get_region(region_key)
				if region and region:owning_faction():name() == faction:name() then
					table.insert(objectives, { region_key = region_key })
				end
			end
			return #objectives >= 1 and objectives or nil
		end,

		listeners = {
			{
				event = "CharacterPerformsSettlementOccupationDecisionBeforeOutcomeApplication",
				filter = function(context)
					return context:occupation_decision_option() == "occupation_decision_raze_without_occupy" and context:character():faction():name() == self.persistent.atreus_faction_key
				end,
				body = function(context)
					local objective_methods = "raze_specific_settlement"
					local region = context:garrison_residence():region()
					local faction = region:owning_faction()
					local active_objective = self:get_active_objective(faction, objective_methods, function(faction_objective) return faction_objective.region_key == region:name() end)
					if active_objective then
						self:complete_objective(active_objective, objective_methods, faction:name())
					end
				end,
			},
		},

		get_is_possible_and_target = function(faction_objective, faction)
			local region = cm:get_region(faction_objective.region_key)
			return true, region and region:owning_faction():name() == faction:name(), "region_key", faction_objective.region_key
		end,
	}

	methods.horde_defeat_general = {
		generator = function(objective, faction)
			local objectives = {}
			local characters = faction:character_list()
			for i = 0, characters:num_items() - 1 do
				local character = characters:item_at(i)
				if not character:is_null_interface() and character:character_type("general") and character:has_military_force() and (objective.allow_selecting_faction_leader or not character:is_faction_leader()) then
					table.insert(objectives, { general_family_member_cqi = character:family_member():command_queue_index() })
				end
			end
			return #objectives >= 1 and objectives or nil
		end,

		listeners = {
			{
				event = "BattleConflictFinished",
				filter = true,
				body = function(context)
					local objective_methods = "horde_defeat_general"
					local is_objective_character = function(faction_objective, character) return faction_objective.general_family_member_cqi == character:family_member():command_queue_index() end
					local battle = context:pending_battle()
					local attacking_general, attacking_reinforcing_generals = battle:attacker(), battle:secondary_attackers()
					local defending_general, defending_reinforcing_generals = battle:defender(), battle:secondary_defenders()
					if battle:attacker_battle_result():ends_with("victory") and self:is_atreus_faction_among(attacking_general, attacking_reinforcing_generals) then
						self:check_objective_for_characters(defending_general, defending_reinforcing_generals, nil, objective_methods, is_objective_character)
					elseif battle:defender_battle_result():ends_with("victory") and self:is_atreus_faction_among(defending_general, defending_reinforcing_generals) then
						self:check_objective_for_characters(attacking_general, attacking_reinforcing_generals, nil, objective_methods, is_objective_character)
					end
				end,
			},
		},

		get_is_possible_and_target = function(faction_objective, faction)
			local family_member = faction:model():family_member_for_command_queue_index(faction_objective.general_family_member_cqi)
			return not family_member:is_null_interface() and family_member:is_alive(), not family_member:is_null_interface() and not family_member:is_convalescing(), "family_member_cqi", faction_objective.general_family_member_cqi
		end,
	}

	methods.succeed_court_plot = {
		generator = function(objective, faction)
			local faction_name = faction:name()
			local target_faction_court = court.util_functions.get_faction_court_for_faction(faction_name)
			local own_faction_court = court.util_functions.get_faction_court_for_faction(self.persistent.atreus_faction_key)
			if target_faction_court ~= own_faction_court then
				-- the two factions are in different courts
				return
			end
			local faction_data = court.util_functions.get_faction_persistent_data(faction_name)
			if not faction_data.owned_positions or #faction_data.owned_positions <= 0 then
				return nil	-- The target faction has no positions to plot against.
			end

			local random_index = faction:model():random_int(1, #faction_data.owned_positions)
			local target_position_str = faction_data.owned_positions[random_index]

			return { { target_position_str = target_position_str }, }
		end,

		listeners = {
			{
				event = "ScriptEventCourtPlotSucceeded",
				filter = function(context)
					return context.stored_table.plot_persistent_data.plotting_faction == self.persistent.atreus_faction_key
				end,
				body = function(context)
					local objective_methods = "succeed_court_plot"
					local plot_persistent_data = context.stored_table.plot_persistent_data
					local faction_court_obj = court.util_functions.get_faction_court_for_faction(plot_persistent_data.plotting_faction)
					local position_obj = court.util_functions.get_court_position(faction_court_obj, plot_persistent_data.targeted_position)
					local is_same_position = function(faction_objective)
						return faction_objective.target_position_str == position_obj.name or faction_objective.target_position_str == position_obj.alt_name
					end
					local active_objective = self:get_active_objective(cm:get_faction(position_obj.persistent.current_holder_faction), objective_methods, is_same_position)
					if active_objective then
						self:complete_objective(active_objective, objective_methods, position_obj.persistent.current_holder_faction)
					end
				end,
			},
		},

		get_is_possible_and_target = function(faction_objective, faction)
			local faction_data = court.util_functions.get_faction_persistent_data(faction:name())
			local is_currently_possible = is_table(faction_data) and table_contains(faction_data.owned_positions, faction_objective.target_position_str)

			local faction_name = faction:name()
			local target_faction_court = court.util_functions.get_faction_court_for_faction(faction_name)
			local own_faction_court = court.util_functions.get_faction_court_for_faction(self.persistent.atreus_faction_key)
			if target_faction_court ~= own_faction_court then
				-- the two factions are in different courts
				is_currently_possible = false
			end
			return true, is_currently_possible, "court_position_str", faction_objective.target_position_str
		end,
	}

	return methods
end

ancient_legacy_atreus.vary_rewards = function(self, faction, objectives)
	if not objectives or #objectives < 2 then return end
	local model = faction:model()

	-- Determine which objectives would increase their reward and which would decrease it.
	local increased_index, decreased_index = model:random_int(1, #objectives), model:random_int(1, #objectives)
	if increased_index == decreased_index then
		increased_index = increased_index == 1 and increased_index + 1 or increased_index - 1
	end
	local increased_objectives, decreased_objectives = {}, {}
	for i, o in ipairs(objectives) do
		if i == increased_index or (i ~= decreased_index and model:random_int(1, 2) == 1) then
			table.insert(increased_objectives, o)
		else
			table.insert(decreased_objectives, o)
		end
	end

	-- Calculate the total variance in rewards. It is capped by the amound that can be deducted from the objectives with decreased rewards so that those do not go below the allowed minimum.
	local total_decreased_objectives_reward = table_accumulate(decreased_objectives, 0, function(value, objective) return value + objective.reward end)
	local variance = model:random_int(ancient_legacy_atreus.config.reward_variance_minimum_steps, ancient_legacy_atreus.config.reward_variance_maximum_steps) * ancient_legacy_atreus.config.reward_variance_step_value
	variance = math.min(variance, total_decreased_objectives_reward - ancient_legacy_atreus.config.reward_variance_minimum_reward * #decreased_objectives)
	variance = math.floor(variance / ancient_legacy_atreus.config.reward_variance_step_value)

	-- Distribute the increases and respective decreases in objective rewards, one step at a time.
	for s = 1, variance do
		increased_index = model:random_int(1, #increased_objectives)
		increased_objectives[increased_index].reward = increased_objectives[increased_index].reward + ancient_legacy_atreus.config.reward_variance_step_value

		decreased_index = model:random_int(1, #decreased_objectives)
		while decreased_objectives[decreased_index].reward - ancient_legacy_atreus.config.reward_variance_step_value < ancient_legacy_atreus.config.reward_variance_minimum_reward do
			table.remove(decreased_objectives, decreased_index)
			decreased_index = model:random_int(1, #decreased_objectives)
		end
		decreased_objectives[decreased_index].reward = decreased_objectives[decreased_index].reward - ancient_legacy_atreus.config.reward_variance_step_value
	end
end

ancient_legacy_atreus.ensure_minimum_rewards = function(self, faction_objectives)
	for methods, objectives in pairs(faction_objectives) do
		for _, objective in ipairs(objectives) do
			if objective.faction_reward_minimum then
				objective.reward = math.max(objective.reward, objective.faction_reward_minimum)
				objective.faction_reward_minimum = nil	-- Remove this, as it won't be needed anymore and therefore we do not want to put it in the game save.
			end
		end
	end
end

ancient_legacy_atreus.generate_objectives = function(self, faction)
	local faction_key = faction:name()
	-- Do not make objectives for the rebel faction or a faction that has its objectives already generated.
	if faction:is_rebel() or self.persistent.faction_objectives[faction_key] then
		return
	end

	local is_horde = not faction:is_allowed_to_capture_territory()
	local vary_rewards = ((is_horde and ancient_legacy_atreus.config.reward_variance_apply_for_hordes) or (not is_horde and ancient_legacy_atreus.config.reward_variance_apply_for_non_hordes)) and {}
	self.persistent.faction_objectives[faction_key] = {}
	local faction_objectives = self.persistent.faction_objectives[faction_key]
	for _, objective in ipairs(ancient_legacy_atreus.config.objectives) do
		for _, definition in ipairs(objective.definitions) do
			local skip = definition.excluded_factions and table_contains(definition.excluded_factions, faction_key)
			if not skip and ((is_horde and definition.is_for_hordes) or (not is_horde and definition.is_for_non_hordes)) then
				local methods = self.objectives_methods[objective.methods]
				local new_faction_objectives = not methods.generator and {{}} or methods.generator(definition, faction)
				if is_table(new_faction_objectives) then
					faction_objectives[objective.methods] = faction_objectives[objective.methods] or {}
					for _, faction_objective in ipairs(new_faction_objectives) do
						faction_objective.completed = false
						faction_objective.reward = definition.base_reward
						table.insert(faction_objectives[objective.methods], faction_objective)
						-- Temporary add the per faction reward minimum, if there is one.
						faction_objective.faction_reward_minimum = definition.faction_reward_minimums and definition.faction_reward_minimums[faction_key]
						if vary_rewards and definition.vary_reward then
							table.insert(vary_rewards, faction_objective)
						end
					end
				end
			end
		end
	end

	self:process_generated_objectives(faction, faction_objectives, vary_rewards)

	if vary_rewards then
		self:vary_rewards(faction, vary_rewards)
	end
	self:ensure_minimum_rewards(faction_objectives)
end

ancient_legacy_atreus.process_generated_objectives = function(self, faction, faction_objectives, vary_rewards)
	-- Delete objectives that are for the same region as raze_specific_settlement objective.
	local raze_specific_settlement_config = table_find(ancient_legacy_atreus.config.objectives, function(o) return o.methods == "raze_specific_settlement" end)
	local raze_specific_settlement_objectives = faction_objectives.raze_specific_settlement
	if raze_specific_settlement_objectives and raze_specific_settlement_config and raze_specific_settlement_config.delete_same_region_objectives then
		for _, raze_specific_settlement_objective in ipairs(raze_specific_settlement_objectives) do
			if table_contains(raze_specific_settlement_config.delete_same_region_objectives, "conquer_capital") then
				if faction_objectives.conquer_capital and faction:has_home_region() and faction:home_region():name() == raze_specific_settlement_objective.region_key then
					table_erase(vary_rewards, faction_objectives.conquer_capital[1])
					faction_objectives.conquer_capital = nil
				end
			end

			if table_contains(raze_specific_settlement_config.delete_same_region_objectives, "raid_or_sack_resource_settlement") then
				if faction_objectives.raid_or_sack_resource_settlement and faction_objectives.raid_or_sack_resource_settlement[1].region_key == raze_specific_settlement_objective.region_key then
					table_erase(vary_rewards, faction_objectives.raid_or_sack_resource_settlement[1])
					faction_objectives.raid_or_sack_resource_settlement = nil
				end
			end
		end
	end
end

ancient_legacy_atreus.get_total_dominance_tier = function(self, completed_objectives_count)
	local tier_index = 0
	for i, tier in ipairs(self.config.total_dominance.tiers) do
		if completed_objectives_count < tier.completed_objectives_lower_bound then
			return self.config.total_dominance.tiers[i - 1]
		end
	end
	return self.config.total_dominance.tiers[#self.config.total_dominance.tiers]
end

-- Returns a boolean, whether total dominance has been achieved against the given faction, and a number - with how many completed objectives was total dominance achieved (0 if it isn't yet).
ancient_legacy_atreus.has_achieved_total_dominance_against = function(self, faction_key)
	local was_achieved = to_bool(self.persistent.achieved_total_dominance_against[faction_key])
	return was_achieved, was_achieved and self.persistent.achieved_total_dominance_against[faction_key] or 0
end

ancient_legacy_atreus.check_for_achieved_total_dominance_against = function(self, faction_key)
	local active_objectives_count = self:get_possible_objectives_count(faction_key)
	if active_objectives_count > 0 then
		return false
	end

	local completed_objectives_count = self:get_completed_objectives_count(faction_key)
	self.persistent.achieved_total_dominance_against[faction_key] = completed_objectives_count

	-- Give rewards for achieving total dominance.
	local tier = self:get_total_dominance_tier(completed_objectives_count)
	if not is_table(tier) or tier.no_reward then
		return true
	end

	if is_number(tier.dominance_reward) and tier.dominance_reward > 0 then
		cm:faction_add_pooled_resource(self.persistent.atreus_faction_key, self.config.resource_key, self.config.factor_key, tier.dominance_reward) 
	end

	if is_table(tier.ancillary) then
		local ancillaries_list = nil
		if is_table(tier.ancillary.list) then
			ancillaries_list = tier.ancillary.list
		elseif tier.ancillary.rarity == "unique" then
			ancillaries_list = get_all_unique_ancillaries()
		elseif tier.ancillary.rarity == "rare" then
			ancillaries_list = get_all_rare_ancillaries()
		--elseif tier.ancillary.rarity == "common" then
		else	-- Assume "common"
			ancillaries_list = get_all_common_ancillaries(true)
		end

		while not is_empty_table(ancillaries_list) do
			local index = cm:model():random_int(1, #ancillaries_list)
			local ancillary_key = ancillaries_list[index]
			local ancillary_category = cm:get_ancillary_category(ancillary_key)
			if ancillary_category == tier.ancillary.category then
				cm:add_ancillary_to_faction(self.persistent.atreus_faction_key, ancillary_key, true)
				break
			end
			table.remove(ancillaries_list, index)
		end

		if is_empty_table(ancillaries_list) then
			out("AL Atreus: Could not find an ancillary of category " .. tier.ancillary.category .. " for total dominance reward!")
		end
	end

	return true
end

ancient_legacy_atreus.is_faction_weaker = function(self, atreus_faction, other_faction)
	if not atreus_faction or atreus_faction:is_null_interface() or not other_faction or other_faction:is_null_interface() then
			out("AL Atreus: Atreus or other faction is invalid!")
			return false
	end
	return atreus_faction:strength() >= other_faction:strength() * ancient_legacy_atreus.config.weaker_faction_threshold
end

ancient_legacy_atreus.get_diplomatic_action_dominance_cost = function(self, is_confederation, is_underling)
	local cost = cm:model():get_campaign_variable_by_name("diplomatic_action_dominance_cost")
	if is_confederation then
		cost = cost + cm:model():get_campaign_variable_by_name("diplomatic_action_dominance_confederation_additional_cost")
	end
	if is_underling then
		cost = cost + cm:model():get_campaign_variable_by_name("diplomatic_action_dominance_underling_additional_cost")
	end
	return cost
end

ancient_legacy_atreus.is_diplomatic_action_proposed = function(self, diplomacy_panel, action, search_in)
	search_in = search_in and search_in or "all"
	return is_component(diplomacy_panel:InterfaceFunction('find_diplomacy_offer_by_type', action, search_in))
end

ancient_legacy_atreus.is_dominance_action_proposed = function(self, diplomacy_panel)
	return self:is_diplomatic_action_proposed(diplomacy_panel, "diplomatic_option_dominance")
end

ancient_legacy_atreus.configure_dominance_button = function(self, context, diplomacy_panel)
	local dominance_button = diplomacy_panel:InterfaceFunction('find_diplomacy_button_by_type', "diplomatic_option_dominance")
	dominance_button = dominance_button and UIComponent(dominance_button) or nil
	if dominance_button then
		local button_state, button_tooltip_error = "active", nil
		local is_diplomatic_action_proposed_wrapper = function(result, action) return result or self:is_diplomatic_action_proposed(diplomacy_panel, action) end
		local atreus_faction, other_faction = cm:get_faction(self.persistent.atreus_faction_key), cm:get_faction(context.string)
		if not atreus_faction:is_null_interface() and not other_faction:is_null_interface() and atreus_faction:is_human() and other_faction:is_human() then
			button_state, button_tooltip_error = "inactive", "troy_adi_diomedes_diplomatic_action_dominance_inactive_reason_not_working_with_player"
		elseif table_accumulate(ancient_legacy_atreus.config.dominance_incompatible_diplomatic_actions, false, is_diplomatic_action_proposed_wrapper) then
			button_state, button_tooltip_error = "inactive", "troy_adi_diomedes_diplomatic_action_dominance_inactive_reason_not_compatible"
		elseif not self:is_faction_weaker(atreus_faction, other_faction) then
			button_state, button_tooltip_error = "inactive", "troy_adi_diomedes_diplomatic_action_dominance_inactive_reason_not_weaker_faction"
		else
			local is_confederation = self:is_diplomatic_action_proposed(diplomacy_panel, "diplomatic_option_confederation")
			local is_underling = self:is_diplomatic_action_proposed(diplomacy_panel, "diplomatic_option_vassal") or
								 self:is_diplomatic_action_proposed(diplomacy_panel, "diplomatic_option_subjugate") or
								 self:is_diplomatic_action_proposed(diplomacy_panel, "diplomatic_option_client_state")
			if cm:get_faction(self.persistent.atreus_faction_key):pooled_resource(ancient_legacy_atreus.config.resource_key):value() < self:get_diplomatic_action_dominance_cost(is_confederation, is_underling) then
				button_state, button_tooltip_error = "inactive", "troy_adi_diomedes_diplomatic_action_dominance_inactive_reason_not_enough_resource"
			end
		end

		dominance_button:SetState(button_state)
		local tooltip_text = nil						
		if button_tooltip_error and button_tooltip_error ~= '' then
			dominance_button:AppendTooltipText(button_tooltip_error, true)
		end					
	end
end

ancient_legacy_atreus.configure_additional_cost_buttons = function(self, context, diplomacy_panel)
	if not self:is_dominance_action_proposed(diplomacy_panel) then
		return
	end

	local available_dominance = cm:get_faction(self.persistent.atreus_faction_key):pooled_resource(ancient_legacy_atreus.config.resource_key):value()
	local confederation_cost = self:get_diplomatic_action_dominance_cost(true, false)
	local underling_cost = self:get_diplomatic_action_dominance_cost(false, true)

	local configure_additional_cost_button = function(diplomatic_action, final_cost)
		local additional_cost_button = diplomacy_panel:InterfaceFunction('find_diplomacy_button_by_type', diplomatic_action)
		additional_cost_button = additional_cost_button and UIComponent(additional_cost_button)
		if additional_cost_button then
			if available_dominance < final_cost then
				additional_cost_button:SetState("inactive")
				additional_cost_button:AppendTooltipText("troy_adi_diomedes_diplomatic_action_dominance_inactive_reason_not_enough_resource", true)
			end
		end
	end

	configure_additional_cost_button("diplomatic_option_confederation", confederation_cost)
	configure_additional_cost_button("diplomatic_option_vassal", underling_cost)
	configure_additional_cost_button("diplomatic_option_subjugate", underling_cost)
	configure_additional_cost_button("diplomatic_option_client_state", underling_cost)
end

ancient_legacy_atreus.configure_incompatible_button = function(self, context, diplomacy_panel, button_type)
	local button = diplomacy_panel:InterfaceFunction('find_diplomacy_button_by_type', button_type)
	button = button and UIComponent(button) or nil
	if button then
		button:SetState("inactive")
		button:AppendTooltipText("troy_adi_diomedes_diplomatic_action_dominance_inactive_reason_not_compatible", true)
	end
end

ancient_legacy_atreus.configure_all_incompatible_buttons = function(self, context, diplomacy_panel)
	if not self:is_dominance_action_proposed(diplomacy_panel) then
		return
	end
	for _, action in ipairs(ancient_legacy_atreus.config.dominance_incompatible_diplomatic_actions) do
		self:configure_incompatible_button(context, diplomacy_panel, action)
	end
end

ancient_legacy_atreus.configure_strength_balance = function(self, context, diplomacy_panel)
	local offers_panel = diplomacy_panel:SequentialFind("faction_right_status_panel")
	local atreus_faction, other_faction = cm:get_faction(self.persistent.atreus_faction_key), cm:get_faction(context.string)
	local is_faction_weaker = self:is_faction_weaker(atreus_faction, other_faction)

	local component_strength_balance = offers_panel and offers_panel:SequentialFind("strength_balance_bar")
	if component_strength_balance then
		component_strength_balance:SetState(is_faction_weaker and "Dominance" or "Default")
	end

	local component_indicator = offers_panel and offers_panel:SequentialFind("dominance_indicator")
	if component_indicator then
		component_indicator:SetVisible(true)
		component_indicator:SetState(is_faction_weaker and "Strong" or "Weak")	-- Note that the states refer to whether atreus' faction is strong or weak.
	end

	local component_threshold = offers_panel and offers_panel:SequentialFind("treshold_template")
	if component_threshold and component_strength_balance and ancient_legacy_atreus.config.weaker_faction_threshold >= 0 then
		local threshold = ancient_legacy_atreus.config.weaker_faction_threshold / (ancient_legacy_atreus.config.weaker_faction_threshold + 1)
		local offset_x, offset_y = component_threshold:GetDockOffset()
		component_threshold:SetDockOffset(threshold * component_strength_balance:Width(), offset_y)
		component_threshold:SetVisible(true)
	end
end

ancient_legacy_atreus.configure_agree_button = function(self, context, diplomacy_panel)
	local their_offers = diplomacy_panel:InterfaceFunction("get_all_diplomacy_offers", "their")
	local common_offers = diplomacy_panel:InterfaceFunction("get_all_diplomacy_offers", "common")
	if not is_empty_table(their_offers) or not is_empty_table(common_offers) then
		return	-- Something is proposed, so do not disable the agree button.
	end

	local your_offers = diplomacy_panel:InterfaceFunction("get_all_diplomacy_offers", "your")
	local is_dominance_proposed = false
	for action, _ in pairs(your_offers) do
		if action ~= "diplomatic_option_dominance" then
			return
		end
		is_dominance_proposed = true
	end

	if is_dominance_proposed then
		local component_agree = diplomacy_panel:SequentialFind("button_agree")
		if component_agree then
			component_agree:SetState("inactive")
			component_agree:AppendTooltipText("diplomacy_panel_agree_button_tooltip_add_offer", true)
		end
	end
end

ancient_legacy_atreus.ui.panel_open = function(context)
	local ui_context = UIComponent(context.component)
	local component_objectives_panel = ui_context:SequentialFind(ancient_legacy_atreus.ui.objectives.panel)
	if component_objectives_panel then
		component_objectives_panel:SetVisible(false)
	end

	ancient_legacy_atreus.ui.create_dominance_bar(ui_context)
	ancient_legacy_atreus.ui.create_factions_lists(ui_context)

	core:add_listener(
		"ancient_legacy_atreus_component_lclick",
		"ComponentLClickUp",
		true,
		ancient_legacy_atreus.ui.on_lclick,
		true
	)

	core:add_listener(
		"ancient_legacy_atreus_component_ldblclick",
		"ComponentLDBLClickUp",
		true,
		ancient_legacy_atreus.ui.on_ldblclick,
		true
	)

	core:add_listener(
		"ancient_legacy_atreus_panel_closed",
		"PanelClosedCampaign",
		function(context) return context.string == ancient_legacy_atreus.ui.panel_name end,
		function(context)
			core:remove_listener("ancient_legacy_atreus_component_lclick")
			core:remove_listener("ancient_legacy_atreus_component_ldblclick")
		end,
		false
	)
end

ancient_legacy_atreus.ui.create_dominance_bar = function(ui_context)
	local atreus_faction = cm:get_faction(ancient_legacy_atreus.ui.legacy_object.persistent.atreus_faction_key)
	local resource_manager = atreus_faction:pooled_resource(ancient_legacy_atreus.config.resource_key)
	local current_dominance = not resource_manager:is_null_interface() and resource_manager:value() or 0
	local maximum_dominance = not resource_manager:is_null_interface() and resource_manager:maximum_value() or 0

	local component_background = ui_context:SequentialFind(ancient_legacy_atreus.ui.dominance_bar.background)
	local component_marker = ui_context:SequentialFind(ancient_legacy_atreus.ui.dominance_bar.marker)
	if component_background and component_marker then
		local current_dominance_fraction = math.min(current_dominance, maximum_dominance) / maximum_dominance
		component_marker:Resize(component_marker:Width(), math.max(current_dominance_fraction * component_background:Height(), 1))
	end

	local component_current_amount = ui_context:SequentialFind(ancient_legacy_atreus.ui.dominance_bar.current_amount)
	if component_current_amount then
		local text_current_amount = tostring(current_dominance) .. " / " .. tostring(maximum_dominance)
		component_current_amount:SetText(text_current_amount)
	end

	local cco_tooltip_dominance_id = "atreus_tooltip_dominance"
	ancient_legacy_atreus.ui.create_dominance_bar_tooltip_cco(cco_tooltip_dominance_id, current_dominance)
	component_background:SetProperty("script_id", cco_tooltip_dominance_id)
end

ancient_legacy_atreus.ui.create_dominance_bar_tooltip_cco = function(cco_id, current_dominance)
	local cco_tooltip_dominance = {
		Tiers = {}
	}

	local create_cco_entry_for_tier = function(tier_config, current_dominance, next_tier_config)
		return {
			Title = common:get_localised_string(tier_config.title),
			Description = common:get_localised_string(tier_config.description),
			CurrentDominance = current_dominance,
			RequiredDominance = tier_config.cost,
			IsActive = current_dominance >= tier_config.cost,
			NextTierActive = to_bool(next_tier_config and current_dominance >= next_tier_config.cost),
			IsLastTier = to_bool(not next_tier_config)
		}
	end

	for index = 1, #ancient_legacy_atreus.config.dominance_tiers do
		local tier_config = ancient_legacy_atreus.config.dominance_tiers[index]
		local next_tier_config = ancient_legacy_atreus.config.dominance_tiers[index + 1]
		table.insert(cco_tooltip_dominance.Tiers, create_cco_entry_for_tier(tier_config, current_dominance, next_tier_config))
	end

	common.set_context_value(cco_id, cco_tooltip_dominance)
end

ancient_legacy_atreus.ui.create_factions_lists = function(ui_context)
	local atreus_faction = cm:get_faction(ancient_legacy_atreus.ui.legacy_object.persistent.atreus_faction_key)

	-- Get all factions with objectives against them, sorted by power rank.
	-- Note that we want to show the power rank in the whole world, similar to the diplomacy screen.
	-- In order to get the power rank in the whole world, we first get all factions and sort them by strength and just then filter out the factions we don't want to show.
	local faction_list, factions_all = {}, atreus_faction:model():world():faction_list()
	for i = 0, factions_all:num_items() - 1 do
		local faction = factions_all:item_at(i)
		if not faction:is_rebel() then
			local faction_data = {
				faction = faction,
				strength = faction:strength(),
				key = faction:name(),
			}
			table.insert(faction_list, faction_data)
		end
	end
	faction_list = table_stable_sort(faction_list, function(lhs, rhs) return lhs.strength > rhs.strength end)
	for i, faction_data in ipairs(faction_list) do
		faction_data.rank = i
	end
	table_erase_if(faction_list, function(faction_data) return not ancient_legacy_atreus.ui.legacy_object.persistent.faction_objectives[faction_data.key] end)

	local component_factions_list = ancient_legacy_atreus.ui.create_faction_list(ui_context, ancient_legacy_atreus.ui.faction_list.container, atreus_faction, faction_list)

	if ancient_legacy_atreus.ui.auto_select_active_faction and component_factions_list and component_factions_list:ChildCount() > 0 then
		ancient_legacy_atreus.ui.toggle_objectives_visibility(UIComponent(component_factions_list:Find(0)))
	end
end

ancient_legacy_atreus.ui.create_faction_list = function(ui_context, list_name, atreus_faction, faction_list)
	local component_empty, component_sorting_arrows = ui_context:SequentialFind(list_name, ancient_legacy_atreus.ui.faction_list.empty), ui_context:SequentialFind(list_name, ancient_legacy_atreus.ui.faction_list.sort_arrows)
	if component_empty then
		component_empty:SetVisible(#faction_list <= 0)
	end
	if component_sorting_arrows then
		component_sorting_arrows:SetVisible(#faction_list > 0)
	end

	local component_view = ui_context:SequentialFind(list_name, ancient_legacy_atreus.ui.faction_list.view)
	if not component_view then
		return nil
	end
	component_view:SetVisible(#faction_list > 0)

	local component_list = ui_context:SequentialFind(list_name, ancient_legacy_atreus.ui.faction_list.list)
	if not component_list then
		return nil
	end

	local component_template = component_list:SequentialFind(ancient_legacy_atreus.ui.faction_list.template)
	if not component_template then
		return nil
	end

	if #faction_list > 0 then
		component_list:Divorce(component_template:Address())
		component_list:StallLayouts(true)

		for i, faction_data in ipairs(faction_list) do
			ancient_legacy_atreus.ui.add_faction_to_list(component_list, component_template, atreus_faction, faction_data.faction, faction_data.rank)
		end

		component_list:StallLayouts(false)
		component_list:Layout()
	end

	-- Initially we want to sort by something, so we simulate a click on one of the sort arrows.
	local component_initial_sort_by_arrow = component_sorting_arrows and component_sorting_arrows:SequentialFind(ancient_legacy_atreus.ui.faction_list.initial_sort_by_arrow)
	if component_initial_sort_by_arrow then
		component_initial_sort_by_arrow:SimulateLClick()
	end

	return component_list
end

ancient_legacy_atreus.ui.add_faction_to_list = function(component_list, component_template, atreus_faction, faction, faction_rank)
	local faction_name, is_dead = faction:name(), faction:is_dead()
	local has_achieved_total_dominance = ancient_legacy_atreus.ui.legacy_object:has_achieved_total_dominance_against(faction_name)

	local component_faction = UIComponent(component_list:CreateFromComponent(component_template:Address(), ancient_legacy_atreus.ui.get_faction_component_id(faction_name)))
	component_faction:SetProperty(ancient_legacy_atreus.ui.faction_list.property_faction_key, faction_name)
	component_faction:SetContextObject(cco("CcoCampaignFaction", faction_name))

	local component_emblem = component_faction:SequentialFind(ancient_legacy_atreus.ui.faction_list.emblem)
	if component_emblem then
		component_emblem:SetImagePath(faction:flag_path() .. "\\mon_24.png")
		component_emblem:SetProperty("sort_value", table_accumulate({faction:subculture():byte(1, -1)}, 0))	-- Set this for sorting purposes.
	end

	local component_name = component_faction:SequentialFind(ancient_legacy_atreus.ui.faction_list.name)
	if component_name then
		component_name:SetText(common.get_localised_string("factions_screen_name_" .. faction_name), "factions_screen_name_" .. faction_name)
	end

	local component_power = component_faction:SequentialFind(ancient_legacy_atreus.ui.faction_list.balance_of_power.component)
	if component_power then
		component_power:SetVisible(not has_achieved_total_dominance and not is_dead)
		local component_rank = component_faction:SequentialFind(ancient_legacy_atreus.ui.faction_list.balance_of_power.rank)
		if component_rank then
			component_rank:SetText(tostring(faction_rank))
			component_rank:SetProperty("sort_value", faction_rank)
		end
		if not has_achieved_total_dominance and not is_dead then
			local component_player, component_enemy = component_faction:SequentialFind(ancient_legacy_atreus.ui.faction_list.balance_of_power.player), component_faction:SequentialFind(ancient_legacy_atreus.ui.faction_list.balance_of_power.enemy)
			if component_player and component_enemy then
				local atreus_strength, faction_strength = atreus_faction:strength(), faction:strength()
				local total_strength = faction_strength + atreus_strength
				local relative_strength = total_strength > 0 and atreus_strength / total_strength or total_strength
				component_player:Resize(math.max(relative_strength * component_enemy:Width(), 1), component_player:Height())
			end
		end
	end

	local component_status = component_faction:SequentialFind(ancient_legacy_atreus.ui.faction_list.status)
	if component_status then
		component_status:SetVisible(not has_achieved_total_dominance and not is_dead)
		if is_dead or faction:at_war_with(atreus_faction) then
			component_status:SetState(ancient_legacy_atreus.ui.faction_list.status_state.war)
		elseif faction:defensive_allies_with(atreus_faction) then
			component_status:SetState(ancient_legacy_atreus.ui.faction_list.status_state.defensive_alliance)
		elseif faction:military_allies_with(atreus_faction) then
			component_status:SetState(ancient_legacy_atreus.ui.faction_list.status_state.military_alliance)
		else
			component_status:SetState(ancient_legacy_atreus.ui.faction_list.status_state.neutral)
		end
	end

	local component_attitude = component_faction:SequentialFind(ancient_legacy_atreus.ui.faction_list.attitude)
	if component_attitude then
		component_attitude:SetVisible(not has_achieved_total_dominance and not is_dead)
		component_attitude:SetProperty("sort_value", is_dead and 0 or faction:attitude_with(ancient_legacy_atreus.ui.legacy_object.persistent.atreus_faction_key))
		component_attitude:SetState(faction:attitude_category_with(ancient_legacy_atreus.ui.legacy_object.persistent.atreus_faction_key))
		component_attitude:InterfaceFunction("set_faction", faction_name)
	end

	local component_objectives_count = component_faction:SequentialFind(ancient_legacy_atreus.ui.faction_list.objectives_count)
	if component_objectives_count then
		component_objectives_count:SetVisible(not has_achieved_total_dominance and not is_dead)
		local objectives_count = ancient_legacy_atreus.ui.legacy_object:get_active_objectives_count(faction_name)
		component_objectives_count:SetText(tostring(objectives_count))

		-- When sorting by number of active objectives, order the factions so that first are factions that Atreus' faction is at war with, followed by those at peace and lastly the dead factions.
		-- In order to achieve this, we add to the objectives count 1000 if the faction is at war with Atreus' faction, 100 if it is at peace and 0 if it is dead.
		-- Then we inverse the sign in order to put more objectives at the top. This could probably be achieved more elegently by sorting params, but this works too.
		local status_addition = (faction:is_dead() and 0) or (faction:at_war_with(atreus_faction) and 1000) or 100
		component_objectives_count:SetProperty("sort_value", -1 * (objectives_count + status_addition))
	end

	local component_dominated = component_faction:SequentialFind(ancient_legacy_atreus.ui.faction_list.dominated)
	if component_dominated then
		component_dominated:SetVisible(has_achieved_total_dominance)
	end

	local component_destroyed = component_faction:SequentialFind(ancient_legacy_atreus.ui.faction_list.destroyed)
	if component_destroyed then
		component_destroyed:SetVisible(not has_achieved_total_dominance and is_dead)
	end

	local component_objectives_holder = component_faction:SequentialFind(ancient_legacy_atreus.ui.objectives.holder)
	if component_objectives_holder then
		ancient_legacy_atreus.ui.create_objectives(component_objectives_holder, faction_name)

		component_objectives_holder:SetVisible(false)	-- By default all objectives are collapsed. Exceptions are handled separately later.
	end

	component_faction:SetVisible(true)
end

ancient_legacy_atreus.ui.get_faction_component_id = function(faction_name)
	return ancient_legacy_atreus.ui.faction_list.template_instance_prefix .. faction_name
end

ancient_legacy_atreus.ui.toggle_objectives_visibility = function(component_faction)
	local component_objectives_holder = component_faction:SequentialFind(ancient_legacy_atreus.ui.objectives.holder)
	if (not component_objectives_holder) then
		return	-- An essential component is missing, so we cannot proceed.
	end

	local is_expanded = component_objectives_holder:Visible()
	component_objectives_holder:SetVisible(not is_expanded)

	local component_info_holder = component_faction:SequentialFind(ancient_legacy_atreus.ui.faction_list.info_holder)
	if component_info_holder then
		component_info_holder:SetState(is_expanded and ancient_legacy_atreus.ui.faction_list.info_holder_states.collapsed or ancient_legacy_atreus.ui.faction_list.info_holder_states.expanded)
	end
end

ancient_legacy_atreus.ui.create_objectives = function(component_list, faction_name)
	local has_achieved_total_dominance = ancient_legacy_atreus.ui.legacy_object:has_achieved_total_dominance_against(faction_name)
	local faction = cm:get_faction(faction_name)
	if has_achieved_total_dominance then
		local component_dominated = component_list:SequentialFind(ancient_legacy_atreus.ui.objectives.dominated)
		if component_dominated then
			component_dominated:SetVisible(true)
		end
	elseif faction:is_dead() then
		local component_dead = component_list:SequentialFind(ancient_legacy_atreus.ui.objectives.dead)
		if component_dead then
			component_dead:SetVisible(true)
		end
	elseif not faction:at_war_with(cm:get_faction(ancient_legacy_atreus.ui.legacy_object.persistent.atreus_faction_key)) then
		local component_at_peace = component_list:SequentialFind(ancient_legacy_atreus.ui.objectives.at_peace)
		if component_at_peace then
			component_at_peace:SetVisible(true)
		end
	end

	local component_template = component_list:SequentialFind(ancient_legacy_atreus.ui.objectives.template)
	if not component_template then
		return
	end

	local displayed_objectives = {}
	for _, objective in ipairs(ancient_legacy_atreus.config.objectives) do
		local methods = objective.methods
		if not displayed_objectives[methods] then
			displayed_objectives[methods] = true
			if ancient_legacy_atreus.ui.legacy_object.persistent.faction_objectives[faction_name][methods] then
				for index, faction_objective in ipairs(ancient_legacy_atreus.ui.legacy_object.persistent.faction_objectives[faction_name][methods]) do
					ancient_legacy_atreus.ui.add_objective_to_list(component_list, objective, index, faction_objective, faction, component_template)
				end
			end
		end
	end

	ancient_legacy_atreus.ui.add_total_dominance_to_list(component_list, faction, component_template)

	component_template:Destroy()
end

ancient_legacy_atreus.ui.add_objective_to_list = function(component_list, objective, index, faction_objective, faction, objective_template)
	local objective_methods = ancient_legacy_atreus.ui.legacy_object.objectives_methods[objective.methods]

	local objective_id = ancient_legacy_atreus.ui.objectives.template_instance_prefix .. objective.methods .. "_" .. tostring(index)
	local component_objective = UIComponent(component_list:CreateFromComponent(objective_template:Address(), objective_id))
	component_objective:SetProperty("objective_id", objective_id)

	local component_reward = component_objective:SequentialFind(ancient_legacy_atreus.ui.objectives.reward)
	if component_reward then
		component_reward:SetText(tostring(ancient_legacy_atreus:get_objective_reward(faction_objective, objective.methods)))
	end

	-- Get some objective details, like is it possible and its target and type of target.
	local is_possible, is_currently_possible, target_type, target_detail, target_secondary_detail = true, true, nil, nil, nil
	if objective_methods.get_is_possible_and_target then
		is_possible, is_currently_possible, target_type, target_detail, target_secondary_detail = objective_methods.get_is_possible_and_target(faction_objective, faction)
	end

	local objective_state, text_state = ancient_legacy_atreus.ui.objectives.template_states.active, ancient_legacy_atreus.ui.objectives.text_states.active
	local bullet_state, target_icon_state = ancient_legacy_atreus.ui.objectives.bullet_states.active, ancient_legacy_atreus.ui.objectives.target_icon_states.active
	local impossible_tooltip = nil
	if faction_objective.completed then
		objective_state, text_state = ancient_legacy_atreus.ui.objectives.template_states.completed, ancient_legacy_atreus.ui.objectives.text_states.completed
		bullet_state, target_icon_state = ancient_legacy_atreus.ui.objectives.bullet_states.completed, ancient_legacy_atreus.ui.objectives.target_icon_states.completed
	elseif not is_possible then
		objective_state, text_state = ancient_legacy_atreus.ui.objectives.template_states.impossible, ancient_legacy_atreus.ui.objectives.text_states.impossible
		bullet_state, target_icon_state = ancient_legacy_atreus.ui.objectives.bullet_states.impossible, ancient_legacy_atreus.ui.objectives.target_icon_states.impossible
		impossible_tooltip = objective.reason_permanently_impossible
	elseif not is_currently_possible then
		objective_state, text_state = ancient_legacy_atreus.ui.objectives.template_states.impossible, ancient_legacy_atreus.ui.objectives.text_states.impossible
		bullet_state = ancient_legacy_atreus.ui.objectives.bullet_states.impossible
		impossible_tooltip = objective.reason_currently_impossible
	end

	component_objective:SetState(objective_state)

	local component_text = component_objective:SequentialFind(ancient_legacy_atreus.ui.objectives.text)
	if component_text then
		component_text:SetState(text_state)
		local details = objective_methods.ui_details and {objective_methods.ui_details(faction_objective, faction)} or {}
		component_text:SetText(string.format(common.get_localised_string(objective.ui_text), unpack(details)), objective.ui_text)
	end

	local component_bullet = component_objective:SequentialFind(ancient_legacy_atreus.ui.objectives.bullet)
	if component_bullet then
		component_bullet:SetState(bullet_state)
		if impossible_tooltip then
			component_bullet:SetInteractive(true)	-- The component in the UIEd is a template instance that is set to not interactive, therefore make it interactive here.
			component_bullet:SetTooltipText(common.get_localised_string(impossible_tooltip), impossible_tooltip, true)
		end
	end

	local component_target = component_objective:SequentialFind(ancient_legacy_atreus.ui.objectives.target)
	if component_target then
		component_target:SetVisible(not not (target_type and target_detail))
		if impossible_tooltip then
			component_target:SetTooltipText(common.get_localised_string(impossible_tooltip), impossible_tooltip, true)
		end
		if target_type and target_detail then
			component_target:SetProperty("target_type", target_type)
			component_target:SetProperty("target_detail", tostring(target_detail))
			if not is_currently_possible then
				component_target:SetState(ancient_legacy_atreus.ui.objectives.target_states.not_currently_possible)
			end

			local component_target_icon = component_target:SequentialFind(ancient_legacy_atreus.ui.objectives.target_icon)
			if component_target_icon then
				component_target_icon:SetState(target_icon_state)
				component_target_icon:SetVisible(true)
			end

			local component_target_name = component_target:SequentialFind(ancient_legacy_atreus.ui.objectives.target_name)
			if component_target_name then
				if target_type == "region_key" then
					component_target_name:SetText(common.get_localised_string("regions_onscreen_" .. target_detail), "regions_onscreen_" .. target_detail)
				elseif target_type == "slot_key" then
					local building_level_record_cco = cco("CcoBuildingLevelRecord", target_secondary_detail)
					local cco_call_str = "FactionVariantRecordContext(FindContext(\"CcoFactionRecord\", \"" .. faction:name() .. "\")).Name"
					local building_name = building_level_record_cco and building_level_record_cco:Call(cco_call_str) or "Missing building: " .. target_secondary_detail
					component_target_name:SetText(building_name)
				elseif target_type == "family_member_cqi" then
					local family_member = faction:model():family_member_for_command_queue_index(target_detail)
					if not family_member:is_null_interface() then
						local forename_source, surname_source = family_member:get_forename(), family_member:get_surname()
						local forename = forename_source ~= "" and common.get_localised_string(forename_source) or ""
						local surname = surname_source ~= "" and common.get_localised_string(surname_source) or ""
						local full_name = forename .. ((forename ~= "" and surname ~= "" and " ") or "") .. surname
						component_target_name:SetText(full_name, forename_source ~= "" and forename_source or surname_source)

						if is_possible and is_currently_possible then
							local character = family_member:character()
							if character:is_null_interface() or not character:is_visible_to_faction(ancient_legacy_atreus.ui.legacy_object.persistent.atreus_faction_key) then
								component_target:SetState(ancient_legacy_atreus.ui.objectives.target_states.not_currently_possible)	-- This is the same button state as the not currently possible state.
								component_target:SetTooltipText(common.get_localised_string(ancient_legacy_atreus.config.text.target_general_not_visible), ancient_legacy_atreus.config.text.target_general_not_visible, true)
							end
						end
					end
				elseif target_type == "court_position_str" then
					local faction_court_obj = court.util_functions.get_faction_court_for_faction(faction:name())
					local target_position_obj = court.util_functions.get_court_position(faction_court_obj, target_detail)
					local position_loc_key = court.position_functions.get_position_name_localization_key(target_position_obj, faction_court_obj)
					local position_loc_text = common.get_localised_string(position_loc_key)
					component_target_name:SetText(position_loc_text, position_loc_key)
				end
			end
		end
	end

	component_objective:SetVisible(true)
end

ancient_legacy_atreus.ui.add_total_dominance_to_list = function(component_list, faction, objective_template)
	local faction_key = faction:name()
	local has_achieved_total_dominance, completed_objectives_count = ancient_legacy_atreus.ui.legacy_object:has_achieved_total_dominance_against(faction_key)
	if not has_achieved_total_dominance then
		-- If the total dominance has not been achieved, then show the tier that will be achieved if all currently possible objectives are completed.
		-- NOTE: The counting of objectives could be done via a single call to get_objectives_count, but for debugging purposes it is done via two separate calls.
		local currently_completed_objectives_count = ancient_legacy_atreus.ui.legacy_object:get_completed_objectives_count(faction_key)
		local currently_possible_objectives_count = ancient_legacy_atreus.ui.legacy_object:get_possible_objectives_count(faction_key)
		completed_objectives_count = currently_completed_objectives_count + currently_possible_objectives_count
	end

	local total_dominance_tier = ancient_legacy_atreus:get_total_dominance_tier(completed_objectives_count)
	if not total_dominance_tier or total_dominance_tier.no_reward then
		return	-- There is no total dominance reward, so don't instance it at all.
	end

	local objective_id = ancient_legacy_atreus.ui.objectives.template_total_dominance_id
	local component_objective = UIComponent(component_list:CreateFromComponent(objective_template:Address(), objective_id))
	component_objective:SetProperty("objective_id", objective_id)

	local objective_state = has_achieved_total_dominance and ancient_legacy_atreus.ui.objectives.template_states.completed or ancient_legacy_atreus.ui.objectives.template_states.active
	component_objective:SetState(objective_state)

	local component_text = component_objective:SequentialFind(ancient_legacy_atreus.ui.objectives.text)
	if component_text then
		local text_state = has_achieved_total_dominance and ancient_legacy_atreus.ui.objectives.text_states.completed or ancient_legacy_atreus.ui.objectives.text_states.active
		component_text:SetState(text_state)
		component_text:SetText(common.get_localised_string(ancient_legacy_atreus.config.total_dominance.ui_text), ancient_legacy_atreus.config.total_dominance.ui_text)
	end

	local component_reward = component_objective:SequentialFind(ancient_legacy_atreus.ui.objectives.reward)
	if component_reward then
		component_reward:SetText(tostring(total_dominance_tier.dominance_reward))
	end

	local component_ancillary_reward = component_objective:SequentialFind(ancient_legacy_atreus.ui.objectives.ancillary_rewaord)
	if component_ancillary_reward then
		component_ancillary_reward:SetState(total_dominance_tier.ancillary.rarity)
		component_ancillary_reward:SetVisible(true)
	end

	local component_bullet = component_objective:SequentialFind(ancient_legacy_atreus.ui.objectives.bullet)
	if component_bullet then
		local bullet_state = has_achieved_total_dominance and ancient_legacy_atreus.ui.objectives.bullet_states.completed or ancient_legacy_atreus.ui.objectives.bullet_states.active
		component_bullet:SetState(bullet_state)
	end

	local component_target = component_objective:SequentialFind(ancient_legacy_atreus.ui.objectives.target)
	if component_target then
		component_target:SetVisible(false)
	end

	component_objective:SetVisible(true)
end

ancient_legacy_atreus.ui.close_panel = function()
	local panel = find_uicomponent(core:get_ui_root(), ancient_legacy_atreus.ui.panel_name)
	if panel and panel:Visible() then
		panel:InterfaceFunction("close_panel")
	end
end

ancient_legacy_atreus.ui.move_camera = function(ui_context)
	local target_type, target_detail = ui_context:GetProperty("target_type"), ui_context:GetProperty("target_detail")
	if target_type == "region_key" then
		ancient_legacy_atreus.ui.close_panel()
		cm:scroll_camera_to_settlement(target_detail)
	elseif target_type == "slot_key" then
		ancient_legacy_atreus.ui.close_panel()
		cm:scroll_camera_to_region_slot(target_detail)
	elseif target_type == "family_member_cqi" then
		local family_member = cm:model():family_member_for_command_queue_index(tonumber(target_detail))
		local character = not family_member:is_null_interface() and family_member:character()
		if character and not character:is_null_interface() then
			ancient_legacy_atreus.ui.close_panel()
			cm:scroll_camera_to_character(character:command_queue_index())
		end
	elseif target_type == "court_position_str" then
		common.toggle_fm_panel("court")
	end
end

ancient_legacy_atreus.ui.on_lclick = function(context)
	local ui_context = UIComponent(context.component)
	local click_id = ui_context:Id();
	if click_id == ancient_legacy_atreus.ui.faction_list.info_holder then	-- An item in the faction list was clicked.
		ancient_legacy_atreus.ui.toggle_objectives_visibility(UIComponent(ui_context:Parent()))
	elseif click_id == ancient_legacy_atreus.ui.objectives.target then
		ancient_legacy_atreus.ui.move_camera(ui_context)
	else
		-- Check for redirections.
		for mechanic, components in pairs(ancient_legacy_atreus.ui.mechanic_redirections) do
			if table_contains(components, click_id) then
				ancient_legacy_atreus.ui.close_panel()
				if mechanic == "diplomacy" then
					CampaignUI.OpenDiplomacyFactionList()
				else
					common.toggle_fm_panel(mechanic)
				end
				break
			end
		end
	end
end

ancient_legacy_atreus.ui.on_ldblclick = function(context)
	local ui_context = UIComponent(context.component)
	local click_id = ui_context:Id()
	if click_id == ancient_legacy_atreus.ui.faction_list.info_holder then
		local faction_name = UIComponent(ui_context:Parent()):GetProperty(ancient_legacy_atreus.ui.faction_list.property_faction_key)
		if faction_name ~= "" then
			local root_panel = core:get_ui_root():SequentialFind(ancient_legacy_atreus.ui.panel_name)
			root_panel:InterfaceFunction("open_diplomacy_with", faction_name)
		end
	end
end

ancient_legacy_atreus.ui.crown_panel_open = function(context)
	local ui_context = UIComponent(context.component)
	ancient_legacy_atreus.ui.crown_panel_update_ruler_dominance_button(ui_context)

	core:add_listener(
		"ancient_legacy_atreus_crown_panel_context_trigger_event",
		"ContextTriggerEvent",
		true,
		function(context)
			local splits = context.string:split(":")
			local event = splits[1]

			if event == ancient_legacy_atreus.ui.ruler_dominance.event then
				local description_localised = common:get_localised_string(ancient_legacy_atreus.config.ruler_dominance.texts.confirm_activation_key)
				
				create_confirmation_box_with_text_from_script(
					"confirm_atreus_ruler_dominance_activation",
					description_localised,
					ancient_legacy_atreus.config.ruler_dominance.texts.confirm_activation_key,
					--Confirm
					function()
						local calling_faction_key = cm:get_local_faction_name(true)
						local faction = cm:get_faction(calling_faction_key)
						local faction_cqi = faction:command_queue_index()
						local param_str = ancient_legacy_atreus.ui.ruler_dominance.event
						CampaignUI.TriggerCampaignScriptEvent(faction_cqi, param_str)
					end,
					--Cancel
					nil
				)
			end
		end,
		true
	)

	core:add_listener(
		"ancient_legacy_atreus_panel_closed",
		"PanelClosedCampaign",
		function(context) return context.string == ancient_legacy_atreus.ui.ruler_dominance.crown_panel_name end,
		function(context)
			core:remove_listener("ancient_legacy_atreus_crown_panel_context_trigger_event")
		end,
		false
	)
end

ancient_legacy_atreus.ui.crown_panel_update_ruler_dominance_button = function(crown_panel)
	local component_ruler_dominance_button = crown_panel:SequentialFind(ancient_legacy_atreus.ui.ruler_dominance.button)
	if not component_ruler_dominance_button then
		return
	end

	local is_active = ancient_legacy_atreus.ui.legacy_object:is_ruler_dominance_active()
	local is_atreus_pretender = ancient_legacy_atreus.ui.legacy_object:is_pretender_in_legitimacy_war()
	local cost_obj, can_afford = ancient_legacy_atreus.ui.legacy_object:get_ruler_dominance_resource_cost()
	local button_state = is_active and "selected" or ((is_atreus_pretender and can_afford) and "active" or "inactive")
	component_ruler_dominance_button:SetState(button_state)
	component_ruler_dominance_button:SetVisible(true)

	-- Setup the tooltip using a CCO.
	local legitimacy_object = legitimacy_choice:get_unlocked_legitimacy(ancient_legacy_atreus.ui.legacy_object.persistent.atreus_faction_key)	-- This should be valid, as the legacy should not be claimed without a valid legitimacy object.

	local cco_ruler_dominance_tooltip_table = {
		Title = common.get_localised_string(ancient_legacy_atreus.config.ruler_dominance.texts.tooltip_title_key),
		RewardRecordKey = ancient_legacy_atreus.ui.legacy_object:get_ruler_dominance_legitimacy_cost_key(legitimacy_object),
		CostRecordKey = ancient_legacy_atreus.config.ruler_dominance.dominance_resource_cost_key,
		DurationText = common.get_localised_string(ancient_legacy_atreus.config.ruler_dominance.texts.tooltip_duration_key),
		ShowDurationIcon = false,
	}

	if is_active then
		cco_ruler_dominance_tooltip_table.Warning = common.get_localised_string(ancient_legacy_atreus.config.ruler_dominance.texts.tooltip_warning_already_active_key)
	elseif not is_atreus_pretender then
		cco_ruler_dominance_tooltip_table.Warning = common.get_localised_string(ancient_legacy_atreus.config.ruler_dominance.texts.tooltip_warning_not_pretender_key)
	elseif not can_afford then
		cco_ruler_dominance_tooltip_table.Warning = common.get_localised_string(ancient_legacy_atreus.config.ruler_dominance.texts.tooltip_warning_cant_afford_key)
	else
		cco_ruler_dominance_tooltip_table.Action = common.get_localised_string(ancient_legacy_atreus.config.ruler_dominance.texts.tooltip_action_key)
	end

	common.set_context_value(ancient_legacy_atreus.ui.ruler_dominance.coo_tooltip_id, cco_ruler_dominance_tooltip_table)
	component_ruler_dominance_button:SetProperty("script_id", ancient_legacy_atreus.ui.ruler_dominance.coo_tooltip_id)
	component_ruler_dominance_button:SetTooltipText("{{tt:ui/common ui/tooltip_title_description_warning}}", true)
end

ancient_legacy_atreus.trigger_event = function(self, faction_key, event_id, sec_detail_key, param1, param2, param3, second_faction_name)
	local event = self.config.dominance_event_feed_messages[event_id]

	local event_title = event.title
	local primary_detail = event.primary_detail
	local secondary_detail = not sec_detail_key and event.sec_detail
	if sec_detail_key then
		-- Special case for the objectives. Extract the secondarey detail from their configuration.
		local objective = table_find(self.config.objectives, function(objective) return objective.methods == sec_detail_key end)
		secondary_detail = objective and objective.event_message_detail
	end

	local event_pic = event.event_pic
	param1 = param1 or event.args[1]
	param2 = param2 or event.args[2]
	param3 = param3 or event.args[3]

	local str_param_1
	local str_param_2
	local str_param_3

	if second_faction_name and	event.event_pic == 2104 then
		str_param_1 = "factions_screen_name_" .. second_faction_name		
	end

	if event.not_on_screen == true then
		cm:show_configurable_message_event(faction_key, event_title, primary_detail, secondary_detail, event_pic, param1, param2, param3, str_param_1, str_param_2, str_param_3)
	else
		cm:show_message_event(faction_key, event_title, primary_detail, secondary_detail, true, event_pic, nil, nil, true, param1, param2, param3)
	end
end

ancient_legacy_atreus.is_dominance_full = function(self, faction_key)
	if faction_key == self.persistent.atreus_faction_key then
		local faction = cm:get_faction(faction_key)
		if faction then
			local dominance_resource = faction:pooled_resource(self.config.resource_key)
			if not dominance_resource:is_null_interface() and dominance_resource:value() >= dominance_resource:maximum_value() then
				return true, self.config.text.end_turn_notification_text_key
			end
		end
	end
	return false
end

-- This Ancient Legacy does not use the common Ancient legacy system for installing listeners, as it is adapted from a Troy mechanic.
-- It will be more work to rework it to use the common system and it would probably introduce unnecessary bugs.
ancient_legacy_atreus.add_listeners = function(self)
	core:add_listener(
		"ancient_legacy_atreus_diplomacy_negotiation_initialised_for_" .. self.persistent.atreus_faction_key,
		"DiplomacyNegotiationInitialised",
		function(context) return cm:get_local_faction_name(true) == self.persistent.atreus_faction_key end,
		function(context)
			local diplomacy_panel = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown")
			if diplomacy_panel then
				self:configure_dominance_button(context, diplomacy_panel)
				self:configure_additional_cost_buttons(context, diplomacy_panel)
				self:configure_all_incompatible_buttons(context, diplomacy_panel)
				self:configure_strength_balance(context, diplomacy_panel)
				self:configure_agree_button(context, diplomacy_panel)
			end
		end, 
		true
	)

	-- Responsible for making the mechanic's button visible in the HUD upon loading a save game.
	core:add_listener(
		"ancient_legacy_atreus_ui_reloaded_for_" .. self.persistent.atreus_faction_key,
		"FirstTickAfterWorldCreated",
		function(context) return cm:get_local_faction_name(true) == self.persistent.atreus_faction_key end,
		function(context)
			aegean_political_states:activate_button(ancient_legacy_atreus.ui.component_ids.legacy_panel_button)
		end,
		false
	)

	-- Responsible for making the mechanic's button visible in the HUD upon reloading the UI. Only for development purposes.
	core:add_listener(
		"ancient_legacy_atreus_ui_reloaded_for_" .. self.persistent.atreus_faction_key,
		"UIReloaded",
		function(context) return cm:get_local_faction_name(true) == self.persistent.atreus_faction_key end,
		function(context)
			aegean_political_states:activate_button(ancient_legacy_atreus.ui.component_ids.legacy_panel_button)
		end,
		true
	)

	core:add_listener(
		"ancient_legacy_atreus_panel_opened_for_" .. self.persistent.atreus_faction_key,
		"PanelOpenedCampaign",
		function(context) return context.string == ancient_legacy_atreus.ui.panel_name and cm:get_local_faction_name(true) == self.persistent.atreus_faction_key end,
		function(context)
			ancient_legacy_atreus.ui.legacy_object = self	-- No need to set this to nil upon closing the panel as the UI would always be for that legacy object.
			ancient_legacy_atreus.ui.panel_open(context)
		end,
		true
	)

	core:add_listener(
		"ancient_legacy_atreus_crown_panel_opened_for_" .. self.persistent.atreus_faction_key,
		"PanelOpenedCampaign",
		function(context) return context.string == ancient_legacy_atreus.ui.ruler_dominance.crown_panel_name and cm:get_local_faction_name(true) == self.persistent.atreus_faction_key end,
		function(context)
			ancient_legacy_atreus.ui.legacy_object = self	-- No need to set this to nil upon closing the panel as the UI would always be for that legacy object.
			ancient_legacy_atreus.ui.crown_panel_open(context)
		end,
		true
	)

	core:add_listener(
		"ancient_legacy_atreus_ui_trigger_script_event_for_" .. self.persistent.atreus_faction_key,
		"UITriggerScriptEvent",
		function(context)
			local faction_cqi = context:faction_cqi()
			local faction = cm:model():faction_for_command_queue_index(faction_cqi)	
			if not faction or faction:is_null_interface() then
				return false
			end
	
			local faction_key = faction:name()	
			return faction_key == self.persistent.atreus_faction_key
		end,
		function(context)
			local splits = context:trigger():split(":")
			local event = splits[1]

			if event == self.ui.ruler_dominance.event then
				self:activate_ruler_dominance()
			end
		end,
		true
	)

	core:add_listener(
		"ancient_legacy_atreus_legitimacy_war_ended_for_" .. self.persistent.atreus_faction_key,
		"ScriptEventLegitimacyWarEnded",
		true,
		function(context)
			local legitimacy_object = legitimacy_choice:get_unlocked_legitimacy(self.persistent.atreus_faction_key)	-- This should be valid, as the legacy should not be claimed without a valid legitimacy object.
			if legitimacy_object.config.id ~= context.stored_table.legitimacy_path_id then
				return	-- This event is not for Atreus' legacy object.
			end

			if self:is_ruler_dominance_active() then
				self:deactivate_ruler_dominance()
			end
		end,
		true
	)

	core:add_listener(
		"ancient_legacy_atreus_declare_war_for_" .. self.persistent.atreus_faction_key,
		"NegativeDiplomaticEvent",
		function(context) return context:is_war() and context:character():faction():name() == self.persistent.atreus_faction_key end,
		function(context)
			local other_faction = context:proposer()
			if other_faction:name() == self.persistent.atreus_faction_key then
				other_faction = context:recipient()
			end
			self:generate_objectives(other_faction)
		end, 
		true
	)

	core:add_listener(
		"ancient_legacy_atreus_dominance_threshold_reached_for_" .. self.persistent.atreus_faction_key,
		"PooledResourceTransactionEvent",
		function(context) return context:resource():key() == ancient_legacy_atreus.config.resource_key and context:faction():name() == self.persistent.atreus_faction_key end,
		function(context)
			local resource = context:resource()
			local court_action_cost = court.config.demand_dominance_cost
			local diplomatic_action_cost = self:get_diplomatic_action_dominance_cost(false)
			local confederation_cost = self:get_diplomatic_action_dominance_cost(true)
			-- Currently, underling cost is the same as confederation cost. If that changes, add a separate event for reaching that.
			local current_value = resource:value()
			local previous_value = current_value - context:amount()
			
			if current_value >= confederation_cost and previous_value < confederation_cost then
				self:trigger_event(context:faction():name(), "dominance_reached_confederation_threshold")
			elseif current_value >= diplomatic_action_cost and previous_value < diplomatic_action_cost then
				self:trigger_event(context:faction():name(), "dominance_reached_diplomatic_action_threshold")
			elseif current_value >= court_action_cost and previous_value < court_action_cost then
				self:trigger_event(context:faction():name(), "dominance_reached_court_action_threshold")
			end
		end, 
		true
	)

	core:add_listener(
		"ancient_legacy_atreus_battle_dominance_for_" .. self.persistent.atreus_faction_key,
		"BattleConflictFinished",
		true,
		function(context)
			self:process_battle_for_battle_dominance(context:pending_battle())
		end, 
		true
	)

	-- Start all objective listeners. For each methods type start a single listener.
	local added_listeners = {}
	for i = 1, #ancient_legacy_atreus.config.objectives do
		local methods = ancient_legacy_atreus.config.objectives[i].methods
		if not added_listeners[methods] then
			added_listeners[methods] = true
			local listeners = self.objectives_methods[methods].listeners
			for j = 1, #listeners do
				core:add_listener(
					"ancient_legacy_atreus_" .. ancient_legacy_atreus.config.objectives[i].methods .. "_" .. listeners[j].event .. "_" .. tostring(j) .. "_for_" .. self.persistent.atreus_faction_key,
					listeners[j].event,
					listeners[j].filter,
					listeners[j].body, 
					true
				)
			end
		end
	end
end

--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------

-- Persistent data is already loaded by ancient_legacy_common, we are just informed we are loaded.
ancient_legacy_atreus.on_loading_game = function(self, faction_key)
	if not is_table(self.persistent.achieved_total_dominance_against) then
		self.persistent.achieved_total_dominance_against = {}
	end

	-- Generate a closure of the objectives methods table with this legacy object/instance bound in its functions.
	-- NOTE: This is not part of the persistent data, but needs to be generated every time the legacy is claimed or a game is loaded.
	self.objectives_methods = self:objectives_methods_generator()

	self:add_listeners()	-- Start the listeners for this legacy object.
end

return ancient_legacy_atreus