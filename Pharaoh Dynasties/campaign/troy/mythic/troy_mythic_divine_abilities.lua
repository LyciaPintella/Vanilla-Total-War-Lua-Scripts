
divine_abilities = {}

-- configuration
divine_abilities.MIN_TIER = 1

-- values in effect_bundles should start from index 1 and should be consecutive, each index represents tier = MIN_TIER + index - 1
divine_abilities.ai_god_abilities = {
	[1] = {
		army_special_ability = "troy_mth_boon_aphrodite_disarming_beauty",
		god = "aphrodite",
		weight = 100,
		effect_bundles = {
			[1] = "troy_mth_ai_usage_boon_aphrodite_disarming_beauty_tier1",
			[2] = "troy_mth_ai_usage_boon_aphrodite_disarming_beauty_tier2",
			[3] = "troy_mth_ai_usage_boon_aphrodite_disarming_beauty_tier3",
		},
	},
	[2] = {
		army_special_ability = "troy_mth_boon_apollo_healing_light",
		god = "apollo",
		weight = 150,
		effect_bundles = {
			[1] = "troy_mth_ai_usage_boon_apollo_healing_light_tier1",
			[2] = "troy_mth_ai_usage_boon_apollo_healing_light_tier2",
			[3] = "troy_mth_ai_usage_boon_apollo_healing_light_tier3",
		},
	},
	[3] = {
		army_special_ability = "troy_mth_boon_ares_bloodthirsty_god",
		god = "ares",
		weight = 0,
		effect_bundles = {
			[1] = "troy_mth_ai_usage_boon_ares_bloodthirsty_god_tier1",
			[2] = "troy_mth_ai_usage_boon_ares_bloodthirsty_god_tier2",
			[3] = "troy_mth_ai_usage_boon_ares_bloodthirsty_god_tier3",
		},
	},
	[4] = {
		army_special_ability = "troy_mth_boon_ares_cry_of_phobos",
		god = "ares",
		weight = 0,
		effect_bundles = {
			[1] = "troy_mth_ai_usage_boon_ares_cry_of_phobos_tier1",
			[2] = "troy_mth_ai_usage_boon_ares_cry_of_phobos_tier2",
			[3] = "troy_mth_ai_usage_boon_ares_cry_of_phobos_tier3",
		},
	},
	[5] = {
		army_special_ability = "troy_mth_boon_artemis_wild_hunt",
		god = "artemis",
		weight = 50,
		effect_bundles = {
			[1] = "troy_mth_ai_usage_boon_artemis_wild_hunt_tier1",
			[2] = "troy_mth_ai_usage_boon_artemis_wild_hunt_tier2",
			[3] = "troy_mth_ai_usage_boon_artemis_wild_hunt_tier3",
		},
	},
	[6] = {
		army_special_ability = "troy_mth_boon_athena_aegis_pallas",
		god = "athena",
		weight = 200,
		effect_bundles = {
			[1] = "troy_mth_ai_usage_boon_athena_aegis_pallas_tier1",
			[2] = "troy_mth_ai_usage_boon_athena_aegis_pallas_tier2",
			[3] = "troy_mth_ai_usage_boon_athena_aegis_pallas_tier3",
		},
	},
	[7] = {
		army_special_ability = "troy_mth_boon_hephaestus_armament_for_gods",
		god = "hephaestus",
		weight = 200,
		effect_bundles = {
			[1] = "troy_mth_ai_usage_boon_hephaestus_armament_for_gods_tier1",
			[2] = "troy_mth_ai_usage_boon_hephaestus_armament_for_gods_tier2",
			[3] = "troy_mth_ai_usage_boon_hephaestus_armament_for_gods_tier3",
		},
	},
	[8] = {
		army_special_ability = "troy_mth_boon_hera_wrath_of_the_goddess",
		god = "hera",
		weight = 100,
		effect_bundles = {
			[1] = "troy_mth_ai_usage_boon_hera_wrath_of_the_goddess_tier1",
			[2] = "troy_mth_ai_usage_boon_hera_wrath_of_the_goddess_tier2",
			[3] = "troy_mth_ai_usage_boon_hera_wrath_of_the_goddess_tier3",
		},
	},
	[9] = {
		army_special_ability = "troy_mth_boon_poseidon_tidal_wave",
		god = "poseidon",
		weight = 500,
		effect_bundles = {
			[1] = "troy_mth_ai_usage_boon_poseidon_tidal_wave_tier1",
			[2] = "troy_mth_ai_usage_boon_poseidon_tidal_wave_tier2",
			[3] = "troy_mth_ai_usage_boon_poseidon_tidal_wave_tier3",
		},
	},
	[10] = {
		army_special_ability = "troy_mth_boon_zeus_thunderbolt",
		god = "zeus",
		weight = 450,
		effect_bundles = {
			[1] = "troy_mth_ai_usage_boon_zeus_thunderbolt_tier1",
			[2] = "troy_mth_ai_usage_boon_zeus_thunderbolt_tier2",
			[3] = "troy_mth_ai_usage_boon_zeus_thunderbolt_tier3",
		},
	},
}

-- a map that dictates which building triggers which incident the first time it's constructed
-- this will be used to provide factions with the ability to use the corresponding boon for a limited time upon construction their first temple
divine_abilities.building_to_first_construction_incidents = {
	["troy_amazons_penthesilea_horde_religion_aphrodite_2"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_amazons_penthesilea_horde_religion_aphrodite_3"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_amazons_penthesilea_horde_religion_aphrodite_5"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_amazons_penthesilea_horde_religion_apollo_2"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_amazons_penthesilea_horde_religion_apollo_3"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_amazons_penthesilea_horde_religion_apollo_5"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_amazons_penthesilea_horde_religion_ares_2"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_amazons_penthesilea_horde_religion_ares_3"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_amazons_penthesilea_horde_religion_ares_5"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_amazons_penthesilea_horde_religion_artemis_2"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_amazons_penthesilea_horde_religion_artemis_3"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_amazons_penthesilea_horde_religion_artemis_5"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_amazons_penthesilea_horde_religion_athena_2"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_amazons_penthesilea_horde_religion_athena_3"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_amazons_penthesilea_horde_religion_athena_5"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_amazons_penthesilea_horde_religion_hera_2"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_amazons_penthesilea_horde_religion_hera_3"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_amazons_penthesilea_horde_religion_hera_5"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_amazons_penthesilea_horde_religion_poseidon_2"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_amazons_penthesilea_horde_religion_poseidon_3"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_amazons_penthesilea_horde_religion_poseidon_5"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_amazons_penthesilea_horde_religion_zeus_2"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_amazons_penthesilea_horde_religion_zeus_3"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_amazons_penthesilea_horde_religion_zeus_5"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_hep_amazons_penthesilea_horde_religion_hephaestus_2"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_hep_amazons_penthesilea_horde_religion_hephaestus_3"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_hep_amazons_penthesilea_horde_religion_hephaestus_5"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_hep_religion_hephaestus_2"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_hep_religion_hephaestus_3"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_hep_religion_hephaestus_4"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_main_religion_aphrodite_2"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_main_religion_aphrodite_3"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_main_religion_aphrodite_4"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_main_religion_aphrodite_5"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_main_religion_apollo_2"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_main_religion_apollo_3"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_main_religion_apollo_4"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_main_religion_apollo_5"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_main_religion_ares_2"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_main_religion_ares_3"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_main_religion_ares_4"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_main_religion_ares_5"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_main_religion_artemis_2"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_main_religion_artemis_3"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_main_religion_artemis_4"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_main_religion_athens_2"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_main_religion_athens_3"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_main_religion_athens_4"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_main_religion_athens_5"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_main_religion_hera_2"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_main_religion_hera_3"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_main_religion_hera_4"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_main_religion_hera_5"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_main_religion_poseidon_2"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_main_religion_poseidon_3"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_main_religion_poseidon_4"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_main_religion_poseidon_5"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_main_religion_zeus_2"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_main_religion_zeus_3"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_main_religion_zeus_4"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_main_religion_zeus_5"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_rem_aethiopia_horde_religion_aphrodite_2"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_rem_aethiopia_horde_religion_aphrodite_3"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_rem_aethiopia_horde_religion_aphrodite_5"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_rem_aethiopia_horde_religion_apollo_2"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_rem_aethiopia_horde_religion_apollo_3"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_rem_aethiopia_horde_religion_apollo_5"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_rem_aethiopia_horde_religion_ares_2"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_rem_aethiopia_horde_religion_ares_3"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_rem_aethiopia_horde_religion_ares_5"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_rem_aethiopia_horde_religion_artemis_2"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_rem_aethiopia_horde_religion_artemis_3"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_rem_aethiopia_horde_religion_artemis_5"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_rem_aethiopia_horde_religion_athena_2"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_rem_aethiopia_horde_religion_athena_3"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_rem_aethiopia_horde_religion_athena_5"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_rem_aethiopia_horde_religion_haphaestus_2"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_rem_aethiopia_horde_religion_haphaestus_3"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_rem_aethiopia_horde_religion_haphaestus_5"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_rem_aethiopia_horde_religion_hera_2"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_rem_aethiopia_horde_religion_hera_3"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_rem_aethiopia_horde_religion_hera_5"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_rem_aethiopia_horde_religion_poseidon_2"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_rem_aethiopia_horde_religion_poseidon_3"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_rem_aethiopia_horde_religion_poseidon_5"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_rem_aethiopia_horde_religion_zeus_2"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_rem_aethiopia_horde_religion_zeus_3"] = "troy_mth_incident_temple_first_construction_bonus",
	["troy_rem_aethiopia_horde_religion_zeus_5"] = "troy_mth_incident_temple_first_construction_bonus",
}

--------------------------------------------------------------
----------- Implementation below. ----------------------------
--------------------------------------------------------------

-- AI saves selected ability, the selected ability changes under following conditions:
--  * a god has been raised to MIN tier
--  * a god has lost MIN tier and currently selected ability originates from the god
--  * a god tier has changed up or down but hasn't dropped below MIN tier (aiming to change ability bundle ) 
--  * battle was fought

divine_abilities.ai_factions_selected_abilities = {
	-- map faction key to made choice
	--	faction_name = {
	--		army_special_ability_key,
	--		effect_bundle_key,
	--		god_key,
	-- }
}

-- save/loaded table of which factions have obtained their bonus for constructing a building for the first time
divine_abilities.factions_obtained_first_construction_bonus = {
	-- faction_name = true,
	-- other_faction_name = true
}

divine_abilities.ai_god_abilities.get_effect_bundle_index = function(god_tier)
	return god_tier - divine_abilities.MIN_TIER + 1
end

divine_abilities.get_random_ability = function(faction)

	-- collect faction's gods which have set effect bundle for current tier
	local weighted_gods = weighted_list:new()
	local gods = cm:model():world():god_manager():gods()

	for i = 0, gods:num_items() - 1 do
		local god = gods:item_at(i)
		local god_key = god:name()
		local current_god_tier = faction:attitude_tier_for_god(god_key)

		if current_god_tier >= divine_abilities.MIN_TIER then
			for _, ai_god_ability in ipairs(divine_abilities.ai_god_abilities) do
				local tier_effect_bundle = ai_god_ability.effect_bundles[divine_abilities.ai_god_abilities.get_effect_bundle_index(current_god_tier)]
				if tier_effect_bundle and tier_effect_bundle ~= "" and ai_god_ability.god == god_key and ai_god_ability.weight > 0 then
					weighted_gods:add_item({
						army_special_ability_key = ai_god_ability.army_special_ability,
						effect_bundle_key = tier_effect_bundle,
						god_key = ai_god_ability.god }, ai_god_ability.weight)
				end
			end
		end
	end

	local selected_ability = nil
	if #weighted_gods.items > 0 then
		selected_ability = weighted_gods:weighted_select()
	end
	
	return selected_ability
end

divine_abilities.revoke_current_ability = function(ability, faction)
	cm:remove_effect_bundle(ability.effect_bundle_key, faction:name())
	divine_abilities.ai_factions_selected_abilities[faction:name()] = nil
end

divine_abilities.get_selected_ability = function(faction)
	return divine_abilities.ai_factions_selected_abilities[faction:name()]
end

divine_abilities.set_selected_ability = function(ability, faction)
	local effect_bundle = cm:create_new_custom_effect_bundle(ability.effect_bundle_key)
	cm:apply_custom_effect_bundle_to_faction(effect_bundle, faction)
	divine_abilities.ai_factions_selected_abilities[faction:name()] = ability
end

divine_abilities.select_random_ability = function(faction)
	local new_selected_ability = divine_abilities.get_random_ability(faction)
	if new_selected_ability then
		divine_abilities.set_selected_ability(new_selected_ability, faction)
	end
end

divine_abilities.selected_ability_change_tier = function(faction, new_tier)
	-- remove current ability
	local old_selected_ability = divine_abilities.get_selected_ability(faction)
	divine_abilities.revoke_current_ability(old_selected_ability, faction)

	-- find the same god ability but of new tier
	local new_selected_ability = nil
	for _, ai_god_ability in ipairs(divine_abilities.ai_god_abilities) do
		if old_selected_ability.god_key == ai_god_ability.god and old_selected_ability.army_special_ability_key == ai_god_ability.army_special_ability then
			local tier_effect_bundle = ai_god_ability.effect_bundles[divine_abilities.ai_god_abilities.get_effect_bundle_index(new_tier)]
			if tier_effect_bundle and tier_effect_bundle ~= "" then
				new_selected_ability = {
					army_special_ability_key = ai_god_ability.army_special_ability,
					effect_bundle_key = tier_effect_bundle,
					god_key = ai_god_ability.god
				}
			end
		end
	end

	if new_selected_ability then
		divine_abilities.set_selected_ability(new_selected_ability, faction)
	else
		out("divine_abilities.selected_ability_change_tier couldn't change tier of god " .. old_selected_ability.god_key .. " with ability " .. old_selected_ability.army_special_ability_key .. " to tier " .. new_tier)
	end
end

divine_abilities.get_ai_factions_from_battle = function(pending_battle)
	
	local try_add_ai_faction = function(ai_factions, faction)
		if not faction or faction:is_null_interface() or faction:is_human() then
			return nil
		end

		local found_data = table_find(ai_factions, function(it_faction) return it_faction:name() == faction:name() end)
		if not found_data then
			table.insert(ai_factions, faction)
		end
	end

	local ai_factions = {}
	try_add_ai_faction(ai_factions, pending_battle:attacker_faction())
	try_add_ai_faction(ai_factions, pending_battle:defender_faction())

	local secondary_attackers = pending_battle:secondary_attackers()
	for i = 0, secondary_attackers:num_items() - 1 do
		try_add_ai_faction(ai_factions, secondary_attackers:item_at(i):faction())
	end
	
	local secondary_defenders = pending_battle:secondary_defenders()
	for i = 0, secondary_defenders:num_items() - 1 do
		try_add_ai_faction(ai_factions, secondary_defenders:item_at(i):faction())
	end

	return ai_factions
end

divine_abilities.has_faction_obtained_first_construction_bonus = function(faction)
	return divine_abilities.factions_obtained_first_construction_bonus and divine_abilities.factions_obtained_first_construction_bonus[faction:name()]
end

divine_abilities.apply_first_construction_bonus_for_faction = function(faction,building)
	local building_name = building:name()
	local faction_name = faction:name()
	local incident = divine_abilities.building_to_first_construction_incidents[building_name] or ""
	if incidednt ~= "" then 
		cm:trigger_incident(faction_name, incident, true)
		divine_abilities.factions_obtained_first_construction_bonus[faction_name] = true
	end	
end

core:add_listener(
	"divine_abilities_faction_god_attitude_tier_change",
	"FactionGodAttitudeTierChange",
	function(context) return not context:faction():is_human() end,
	function(context)
		local faction = context:faction()
		local selected_ability = divine_abilities.get_selected_ability(faction)

		if context:new_tier() >= divine_abilities.MIN_TIER and context:old_tier() < divine_abilities.MIN_TIER then
			-- if tier has raised to MIN tier or higher then we have a new ability in the "pool", re-roll currently selected ability because it may end up being the new one
			if selected_ability then
				divine_abilities.revoke_current_ability(selected_ability, faction)
			end

			divine_abilities.select_random_ability(faction)
		elseif selected_ability and selected_ability.god_key == context:god():name() then
			if context:new_tier() >= divine_abilities.MIN_TIER then
				-- different tiers have different bundles so we have to update it with newest bundle
				divine_abilities.selected_ability_change_tier(faction, context:new_tier())
			else
				-- tier has dropped below MIN tier so we lose this ability and we have to re-roll to pick a new one
				divine_abilities.revoke_current_ability(selected_ability, faction)
				divine_abilities.select_random_ability(faction)
			end
		end
	end,
	true
)

core:add_listener(
	"divine_abilities_pending_battle_created",
	"PendingBattleCreated",
	true,
	function(context)
		-- make selection of ability in pending battle object
		local ai_factions = divine_abilities.get_ai_factions_from_battle(context:pending_battle())
		for _, faction in ipairs(ai_factions) do
			local selected_ability = divine_abilities.get_selected_ability(faction)
			if selected_ability then
				cm:pending_battle_select_divine_ability(selected_ability.army_special_ability_key, faction:name())
			end
		end
	end,
	true
)

core:add_listener(
	"divine_abilities_battle_conflict_finished",
	"BattleConflictFinished",
	true,
	function(context)
		-- we don't want ai to use the same ability every time so select new random ability
		local ai_factions = divine_abilities.get_ai_factions_from_battle(context:pending_battle())
		for _, faction in ipairs(ai_factions) do
			local selected_ability = divine_abilities.get_selected_ability(faction)
			if selected_ability then
				divine_abilities.revoke_current_ability(selected_ability, faction)
				divine_abilities.select_random_ability(faction)
			end
		end
	end,
	true
)

core:add_listener(
	"divine_abilities_building_constructed_listener", 
	"BuildingCompleted", 
	function(context)
		return not divine_abilities.has_faction_obtained_first_construction_bonus(context:garrison_residence():faction())
	end, 
	function(context)
		divine_abilities.apply_first_construction_bonus_for_faction(context:garrison_residence():faction(), context:building())
	end, 
	true
)

core:add_listener(
	"divine_abilities_character_building_constructed_listener", 
	"CharacterMilitaryForceBuildingCompleted", 
	function(context)
		return not divine_abilities.has_faction_obtained_first_construction_bonus(context:building():faction())
	end, 
	function(context)
		local building = context:building()
		divine_abilities.apply_first_construction_bonus_for_faction(building:faction(), building)
	end, 
	true
)


----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------

cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("TROY_MYTHIC_DIVINE_ABILITIES_AI_SELECTED", divine_abilities.ai_factions_selected_abilities, context)
		cm:save_named_value("TROY_MYTHIC_DIVINE_ABILITIES_FACTIONS_OBTAINED_FIRST_CONSTRUCTION_BONUS", divine_abilities.factions_obtained_first_construction_bonus, context)
	end
)

cm:add_loading_game_callback(
	function(context)
		divine_abilities.ai_factions_selected_abilities = cm:load_named_value("TROY_MYTHIC_DIVINE_ABILITIES_AI_SELECTED", divine_abilities.ai_factions_selected_abilities, context)
		divine_abilities.factions_obtained_first_construction_bonus = cm:load_named_value("TROY_MYTHIC_DIVINE_ABILITIES_FACTIONS_OBTAINED_FIRST_CONSTRUCTION_BONUS", divine_abilities.factions_obtained_first_construction_bonus, context)
	end
)