out("Loading victory_objectives_config_utils.lua")

-- System accessible config
-- having amount of specific pooled resource
conditions_have_pooled_resource_amount = {
	-- type = "have_pooled_resource_amount",
	unique_pooled_resource_keys = {},
	activation = {},
	completion = {}
}

--  discovering a region
conditions_discover_any_region_of_list = {
	-- type = "discover_any_region_of_list"
	activation = {},
	completion = {}
}

-- unlocking a specific ancient legacy
conditions_unlock_ancient_legacy = {
	-- type = "unlock_ancient_legacy"
	activation = {},
	completion = {}
}

-- having max favour with a number of gods
conditions_have_max_favour_with_gods = {
	-- type = "have_max_favour_with_gods"
	activation = {},
	completion = {}
}

-- having amount of favour with any god
conditions_have_favour_amount_with_any_god = {
	-- type = "have_favour_amount_with_any_god"
	activation = {},
	completion = {}
}

-- having amount of instances of a building chain, optionally we can choose the buildings we are interested in to be max leveled
-- the design had to be changed, but we shouldn't rename it to avoid breaking existing saves, due to conditions using the type to form their ids
conditions_have_amount_of_max_level_of_building_chain = {
	-- type = "have_amount_of_max_level_of_building_chain"
	unique_building_chain_keys = {},
	activation = {},
	completion = {}
}

-- choosing a specific legitimacy path
conditions_choose_legitimacy_path = {
	-- type = "choose_legitimacy_path"
	activation = {},
	completion = {}
}

-- when sea people invasion starts
conditions_sea_people_invasion_started = {
	-- type = "sea_people_invasion_started"
	activation = {},
	completion = {}
}

-- controling a specific region
-- If the condition has the optional field: should_consider_razed_regions_as_under_control = true, 
-- then regions that are currently razed, no matter by which faction, will be considered as owned by the condition owner
conditions_control_region = {
	-- type = "control_region"
	activation = {},
	completion = {}
}

-- razing a specific region
conditions_raze_region = {
	-- type = "raze_region"
	activation = {},
	completion = {}
}

-- razing specified number of regions
conditions_raze_n_regions = {
	-- type = "raze_n_regions"
	activation = {},
	completion = {}
}

-- have amount of tudhaliya assigned princes to vassals
conditions_have_tudhaliya_princes = {
	-- type = "have_tudhaliya_princes"
	activation = {},
	completion = {}
}

-- reaching end of sea people invasion
conditions_sea_people_invasion_ended = {
	-- type = "sea_people_invasion_ended"
	activation = {},
	completion = {}
}

-- reaching campaign turn
conditions_reach_campaign_turn = {
	-- type = "reach_campaign_turn"
	activation = {},
	completion = {}
}

-- maintain faction as ruler, can be either egyptian, or hatti
conditions_maintain_be_ruler = {
	-- type = "maintain_be_ruler"
	activation = {},
	completion = {}
}

conditions_spend_pooled_resource_amount = {
	-- type = "spend_pooled_resource_amount"
	unique_pooled_resource_keys = {},
	activation = {},
	completion = {}
}

conditions_spend_turns_in_civilization_level = {
	-- type = "spend_turns_in_civilization_level"
	activation = {},
	completion = {}
}

conditions_spend_turns_in_any_tribe_category = {
	-- type = "spend_turns_in_any_tribe_category"
	activation = {},
	completion = {}
}

-- loot_resources_from_settlements
conditions_loot_resources_from_settlements = {
	-- type = loot_resources_from_settlements
	activation = {},
	completion = {}
}

conditions_maintain_muwatalli_gratitude_per_turn = {
	-- type = maintain_muwatalli_gratitude_per_turn
	activation = {},
	completion = {}
}

conditions_have_hammurabi_laws = {
	-- type = have_hammurabi_laws
	activation = {},
	completion = {}
}

conditions_hatshepsut_cash_out_ancillary_or_effect_bundle = {
	-- type = hatshepsut_cash_out_ancillary_or_effect_bundle
	activation = {},
	completion = {}
}

conditions_recruit_units = {
	-- type = recruit_units
	activation = {},
	completion = {}
}

conditions_unlock_forge_path = {
	-- type = "unlock_forge_path"
	activation = {},
	completion = {}
}

conditions_use_eminence_obedience = {
	-- type = use_eminence_obedience
	activation = {},
	completion = {}
}

conditions_maintain_equipped_ancillaries = {
	-- type = maintain_equipped_ancillaries
	unique_ancillary_type_keys = {},
	activation = {},
	completion = {}
}

conditions_capture_settlements_with_thutmose_culmination = {
	-- type = capture_settlements_with_thutmose_culmination
	activation = {},
	completion = {}
}

conditions_complete_ambitions = {
	-- type = complete_ambitions
	activation = {},
	completion = {}
}

-- use template instances to create the actual victory objectives
for _, template_instance in ipairs(victory_objectives_template_instances) do

	if is_string(template_instance.uid) and is_table(template_instance.template) then
		local victory_objective = table_deep_copy(template_instance.template)

		for property_key, value in pairs(template_instance) do
			if property_key ~= "template" then
				-- we need to deep copy tables because tables such as activation_conditions and completion_conditions will be modified, to be safe do it for every table
				if is_table(value) then
					victory_objective[property_key] = table_deep_copy(value)
				else
					victory_objective[property_key] = value
				end
			end
		end
	
		table.insert(victory_objectives_data, victory_objective) 
	else
		script_error("VICTORY OBJECTIVES CONFIG: Tried to create victory objective from template instance without id or template")
	end
end

for _, objective in ipairs(victory_objectives_data) do

	local add_condition_to_proper_container = function(objective, condition, is_activation_condition)
		local type = condition.type
		if type == "have_pooled_resource_amount" then
			for _, pooled_resource_key in ipairs(condition.allowed_pooled_resources) do
				if not table_contains(conditions_have_pooled_resource_amount.unique_pooled_resource_keys, pooled_resource_key) then
					table.insert(conditions_have_pooled_resource_amount.unique_pooled_resource_keys, pooled_resource_key)
				end

				local conditions_container = is_activation_condition and conditions_have_pooled_resource_amount.activation or conditions_have_pooled_resource_amount.completion
				if not conditions_container[pooled_resource_key] then
					conditions_container[pooled_resource_key] = {}
				end
				
				table.insert(conditions_container[pooled_resource_key], condition)
			end
		elseif type == "discover_any_region_of_list" then
			local conditions_container = is_activation_condition and conditions_discover_any_region_of_list.activation or conditions_discover_any_region_of_list.completion

			for _, region_key in ipairs(condition.region_keys) do
				if not conditions_container[region_key] then
					conditions_container[region_key] = {}
				end

				table.insert(conditions_container[region_key], condition)
			end
		elseif type == "unlock_ancient_legacy" then
			local ancient_legacy_name = condition.ancient_legacy_name
			local conditions_container = is_activation_condition and conditions_unlock_ancient_legacy.activation or conditions_unlock_ancient_legacy.completion
			if not conditions_container[ancient_legacy_name] then
				conditions_container[ancient_legacy_name] = {}
			end

			table.insert(conditions_container[ancient_legacy_name], condition)
		elseif type == "have_max_favour_with_gods" then
			local conditions_container = is_activation_condition and conditions_have_max_favour_with_gods.activation or conditions_have_max_favour_with_gods.completion
			table.insert(conditions_container, condition)
		elseif type == "have_favour_amount_with_any_god" then
			local conditions_container = is_activation_condition and conditions_have_favour_amount_with_any_god.activation or conditions_have_favour_amount_with_any_god.completion
			table.insert(conditions_container, condition)
		elseif type == "have_amount_of_max_level_of_building_chain" then
			local conditions_container = is_activation_condition and conditions_have_amount_of_max_level_of_building_chain.activation or conditions_have_amount_of_max_level_of_building_chain.completion

			for _, building_chain_key in ipairs(condition.building_chain_keys) do
				if not table_contains(conditions_have_amount_of_max_level_of_building_chain.unique_building_chain_keys, building_chain_key) then
					table.insert(conditions_have_amount_of_max_level_of_building_chain.unique_building_chain_keys, building_chain_key)
				end

				if not conditions_container[building_chain_key] then
					conditions_container[building_chain_key] = {}
				end

				table.insert(conditions_container[building_chain_key], condition)
			end
		elseif type == "choose_legitimacy_path" then
			local conditions_container = is_activation_condition and conditions_choose_legitimacy_path.activation or conditions_choose_legitimacy_path.completion
			table.insert(conditions_container, condition)
		elseif type == "sea_people_invasion_started" then
			local conditions_container = is_activation_condition and conditions_sea_people_invasion_started.activation or conditions_sea_people_invasion_started.completion
			table.insert(conditions_container, condition)
		elseif type == "control_region" then
			local region_key = condition.region_key
			local conditions_container = is_activation_condition and conditions_control_region.activation or conditions_control_region.completion
			if not conditions_container[region_key] then
				conditions_container[region_key] = {}
			end

			table.insert(conditions_container[region_key], condition)
		elseif type == "raze_region" then
			local region_key = condition.region_key
			local conditions_container = is_activation_condition and conditions_raze_region.activation or conditions_raze_region.completion
			if not conditions_container[region_key] then
				conditions_container[region_key] = {}
			end

			table.insert(conditions_container[region_key], condition)	
		elseif type == "raze_n_regions" then
			local conditions_container = is_activation_condition and conditions_raze_n_regions.activation or conditions_raze_n_regions.completion
			table.insert(conditions_container, condition)		
		elseif type == "have_tudhaliya_princes" then
			local conditions_container = is_activation_condition and conditions_have_tudhaliya_princes.activation or conditions_have_tudhaliya_princes.completion
			table.insert(conditions_container, condition)
		elseif type == "sea_people_invasion_ended" then
			local conditions_container = is_activation_condition and conditions_sea_people_invasion_ended.activation or conditions_sea_people_invasion_ended.completion
			table.insert(conditions_container, condition)
		elseif type == "reach_campaign_turn" then
			local conditions_container = is_activation_condition and conditions_reach_campaign_turn.activation or conditions_reach_campaign_turn.completion
			table.insert(conditions_container, condition)
		elseif type == "maintain_be_ruler" then
			local conditions_container = is_activation_condition and conditions_maintain_be_ruler.activation or conditions_maintain_be_ruler.completion
			table.insert(conditions_container, condition)
		elseif type == "spend_pooled_resource_amount" then
			local pooled_resource_key = condition.pooled_resource_key
			if not table_contains(conditions_spend_pooled_resource_amount.unique_pooled_resource_keys, pooled_resource_key) then
				table.insert(conditions_spend_pooled_resource_amount.unique_pooled_resource_keys, pooled_resource_key)
			end

			local conditions_container = is_activation_condition and conditions_spend_pooled_resource_amount.activation or conditions_spend_pooled_resource_amount.completion
			if not conditions_container[pooled_resource_key] then
				conditions_container[pooled_resource_key] = {}
			end
			
			table.insert(conditions_container[pooled_resource_key], condition)
		elseif type == "spend_turns_in_civilization_level" then
			local conditions_container = is_activation_condition and conditions_spend_turns_in_civilization_level.activation or conditions_spend_turns_in_civilization_level.completion
			table.insert(conditions_container, condition)
		elseif type == "spend_turns_in_any_tribe_category" then
			local conditions_container = is_activation_condition and conditions_spend_turns_in_any_tribe_category.activation or conditions_spend_turns_in_any_tribe_category.completion
			table.insert(conditions_container, condition)
		elseif type == "loot_resources_from_settlements" then

			for _, pooled_resource_key in ipairs(condition.allowed_pooled_resources) do
				local conditions_container = is_activation_condition and conditions_loot_resources_from_settlements.activation or conditions_loot_resources_from_settlements.completion
				if not conditions_container[pooled_resource_key] then
					conditions_container[pooled_resource_key] = {}
				end

				table.insert(conditions_container[pooled_resource_key], condition)
			end
		elseif type == "maintain_muwatalli_gratitude_per_turn" then
			local conditions_container = is_activation_condition and conditions_maintain_muwatalli_gratitude_per_turn.activation or conditions_maintain_muwatalli_gratitude_per_turn.completion
			table.insert(conditions_container, condition)
		elseif type == "have_hammurabi_laws" then
			local conditions_container = is_activation_condition and conditions_have_hammurabi_laws.activation or conditions_have_hammurabi_laws.completion
			table.insert(conditions_container, condition)
		elseif type == "hatshepsut_cash_out_ancillary_or_effect_bundle" then
			local conditions_container = is_activation_condition and conditions_hatshepsut_cash_out_ancillary_or_effect_bundle.activation or conditions_hatshepsut_cash_out_ancillary_or_effect_bundle.completion
			table.insert(conditions_container, condition)
		elseif type == "recruit_units" then
			local conditions_container = is_activation_condition and conditions_recruit_units.activation or conditions_recruit_units.completion
			table.insert(conditions_container, condition)
		elseif type == "unlock_forge_path" then
			local conditions_container = is_activation_condition and conditions_unlock_forge_path.activation or conditions_unlock_forge_path.completion
			table.insert(conditions_container, condition)
		elseif type == "use_eminence_obedience" then
			local conditions_container = is_activation_condition and conditions_use_eminence_obedience.activation or conditions_use_eminence_obedience.completion
			table.insert(conditions_container, condition)
		elseif type == "maintain_equipped_ancillaries" then
			local conditions_container = is_activation_condition and conditions_maintain_equipped_ancillaries.activation or conditions_maintain_equipped_ancillaries.completion
			table.insert(conditions_container, condition)
		elseif type == "capture_settlements_with_thutmose_culmination" then
			local conditions_container = is_activation_condition and conditions_capture_settlements_with_thutmose_culmination.activation or conditions_capture_settlements_with_thutmose_culmination.completion
			table.insert(conditions_container, condition)
		elseif type == "complete_ambitions" then
			local conditions_container = is_activation_condition and conditions_complete_ambitions.activation or conditions_complete_ambitions.completion
			table.insert(conditions_container, condition)
		end
	end

	-- generate id of condition by type, should be safe for adding/deleting and modifying an existing condition
	local activation_conditions_ids = {}
	local completion_conditions_ids = {}

	for _, condition in ipairs(objective.activation_conditions) do
		if not activation_conditions_ids[condition.type] then
			activation_conditions_ids[condition.type] = 0
		end

		condition.objective_uid = objective.uid
		condition.id = "activation_" .. condition.type .. activation_conditions_ids[condition.type]
		activation_conditions_ids[condition.type] = activation_conditions_ids[condition.type] + 1

		add_condition_to_proper_container(objective, condition, true)
	end

	for _, condition in ipairs(objective.completion_conditions) do
		if not completion_conditions_ids[condition.type] then
			completion_conditions_ids[condition.type] = 0
		end

		condition.objective_uid = objective.uid
		condition.id = "completion_" .. condition.type .. completion_conditions_ids[condition.type]
		completion_conditions_ids[condition.type] = completion_conditions_ids[condition.type] + 1

		add_condition_to_proper_container(objective, condition, false)
	end
end
