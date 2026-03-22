TRAIT_LORDS_RECORDS = {}


TRAIT_EXCLUSIONS = {
	["culture"] = {
--		["<trait_key>"] = {"<culture_1_key>", "<culture_1_key>", ...},
	},
	["subculture"] = {
--		["<trait_key>"] = {"<subculture_1_key>", "<subculture_1_key>", ...},
	},
	["faction"] = {
--		["trait_key"] = {"<faction_1_key>", "<faction_2_key>", ...}
	}
}

EPIC_HERO_DEFEATED_TRAITS = {
	["troy_achilles"] = "troy_main_trait_defeated_achilles", 						-- Achilles
	["troy_aeneas"] = "troy_main_trait_defeated_aeneas",							-- Aeneas
	["troy_agamemnon"] = "troy_main_trait_defeated_agamemnon", 						-- Agamemnon
	["troy_hector"] = "troy_main_trait_defeated_hector", 							-- Hector
	["troy_menelaus"] = "troy_main_trait_defeated_menelaus", 						-- Menelaus
	["troy_odysseus"] = "troy_main_trait_defeated_odysseus", 						-- Odysseus
	["troy_paris"] = "troy_main_trait_defeated_paris", 								-- Paris
	["troy_sarpedon"] = "troy_main_trait_defeated_sarpedon",						-- Sarpedon
	["troy_hippolyta"] = "troy_main_trait_defeated_hippolyta",						-- Hippolyta
	["troy_penthesilea"] = "troy_main_trait_defeated_penthesilea", 					-- Penthesilea
	["troy_adi_ajax"] = "troy_adi_trait_defeated_ajax",								-- Ajax
	["troy_adi_diomedes"] = "troy_adi_trait_defeated_diomedes",						-- Diomedes
	["troy_rem_rhesus"] = "troy_rem_trait_defeated_rhesus",							-- Rhesus
	["troy_rem_memnon"] = "troy_rem_trait_defeated_memnon"							-- Memnon
}
TROY_ADI_EPIC_HERO_DEFEATED_TRAITS = {
	["troy_achilles"] = "troy_adi_trait_defeated_achilles", 						-- Achilles
	["troy_aeneas"] = "troy_adi_trait_defeated_aeneas",								-- Aeneas
	["troy_agamemnon"] = "troy_adi_trait_defeated_agamemnon", 						-- Agamemnon
	["troy_hector"] = "troy_adi_trait_defeated_hector", 							-- Hector
	["troy_menelaus"] = "troy_adi_trait_defeated_menelaus", 						-- Menelaus
	["troy_odysseus"] = "troy_adi_trait_defeated_odysseus", 						-- Odysseus
	["troy_paris"] = "troy_adi_trait_defeated_paris", 								-- Paris
	["troy_sarpedon"] = "troy_adi_trait_defeated_sarpedon",							-- Sarpedon
	["troy_hippolyta"] = "troy_adi_trait_defeated_hippolyta",						-- Hippolyta
	["troy_penthesilea"] = "troy_adi_trait_defeated_penthesilea", 					-- Penthesilea
	["troy_adi_ajax"] = "troy_adi_trait_defeated_ajax",								-- Ajax
	["troy_adi_diomedes"] = "troy_adi_trait_defeated_diomedes_ajax",				-- Diomedes
	["troy_rem_rhesus"] = "troy_rem_adi_trait_defeated_rhesus",						-- Rhesus
	["troy_rem_memnon"] = "troy_rem_adi_trait_defeated_memnon"						-- Memnon
}

DEFEAT_AND_LAZY_TRAITS = {
	[1] = "troy_main_trait_attacking_close_defeat",
	[2] = "troy_main_trait_attacking_crushing_defeat",
	[3] = "troy_main_trait_attacking_decisive_defeat",
	[4] = "troy_main_trait_melee_close_defeat",
	[5] = "troy_main_trait_melee_crushing_defeat",
	[6] = "troy_main_trait_melee_decisive_defeat",
	[7] = "troy_main_trait_no_melee_close_defeat",
	[8] = "troy_main_trait_no_melee_crushing_defeat",
	[9] = "troy_main_trait_no_melee_decisive_defeat",
	[10] = "troy_main_trait_at_sea_close_defeat",
	[11] = "troy_main_trait_at_sea_crushing_defeat",
	[12] = "troy_main_trait_at_sea_decisive_defeat",
	[13] = "troy_main_trait_defending_close_defeat",
	[14] = "troy_main_trait_defending_crushing_defeat",
	[15] = "troy_main_trait_defending_decisive_defeat",
	[16] = "troy_main_trait_siege_close_defeat",
	[17] = "troy_main_trait_siege_crushing_defeat",
	[18] = "troy_main_trait_siege_decisive_defeat",
	[19] = "troy_main_trait_bad_lazy",
	[20] = "troy_main_trait_bad_procrastinator",
	[21] = "troy_main_trait_escaped_death_1",
	[22] = "troy_main_trait_tormented_1"
}

VICTORY_IN_BATTLE_TRAITS = {
	["troy_main_trait_heroic_victory"] = true,
	["troy_main_trait_attacking_victory"] = true,
	["troy_main_trait_defending_victory"] = true,
	["troy_main_trait_siege_victory"] = true,
	["troy_main_trait_wins_at_sea"] = true,
	["troy_main_trait_lone_wolf"] = true,
	["troy_main_trait_wins"] = true,
	["troy_main_trait_fighter"] = true,
	["troy_trait_achilles_conf_outraged"] = true,
	["troy_main_trait_defeated_achilles"] = true,
	["troy_main_trait_defeated_aeneas"] = true,
	["troy_main_trait_defeated_agamemnon"] = true,
	["troy_main_trait_defeated_hector"] = true,
	["troy_main_trait_defeated_menelaus"] = true,
	["troy_main_trait_defeated_odysseus"] = true,
	["troy_main_trait_defeated_paris"] = true,
	["troy_rem_trait_defeated_rhesus"] = true,
	["troy_rem_trait_defeated_memnon"] = true,
	["troy_main_trait_defeated_sarpedon"] = true
}

REGIONS_FOR_TRAITS = {
	["troy_main_ilion_troy"] = "troy_main_trait_conquered_troy",
	["troy_main_mycenaeca_mycenae"] = "troy_main_trait_conquered_mycenae"
}


SUBCULTURES_TRAIT_KEYS = {
	["troy_main_sbc_trojan_thracians"] = "tracians",
	["troy_main_sbc_trojan_pelasgians"] = "pelasgians",
	["troy_main_sbc_trojan_maeonians"] = "maeonians",
	["troy_main_sbc_trojan_leleges"] = "leleges",
	["troy_main_sbc_danaan_ionians"] = "ionians",
	["troy_main_sbc_danaan_dorians"] = "dorians",
	["troy_main_sbc_danaan_aeolians"] = "aeolians",
	["troy_main_sbc_danaan_achaeans"] = "achaeans",
	["troy_amazons_sbc_horde_amazons"] = "horde_amazons",
	["troy_amazons_sbc_trojan_amazons"] = "trojan_amazons"
}

ACTION_KEY_TO_ACTION = {
	["troy_agent_action_record_spy_assassinate_character"] = "Assassinate Rival", 
	["troy_agent_action_record_spy_damage_garrison_enemy_settlement"] = "Murmurs of Sedition", 
	["troy_agent_action_record_spy_poison_enemy_army"] = "Poison the Well", 
	["troy_agent_action_record_assist_settlement_production"] = "Venerate the Ancestors", 
	["troy_agent_action_record_make_them_retreat"] = "Oration of Dread", 
	["troy_agent_action_record_block_points_replenishment"] = "Prophecy of Doom", 
	["troy_agent_action_record_envoy_influence_enemy_settlement"] = "Seeds of Dissent", 
	["troy_agent_action_record_incite_rebellion"] = "Fan the Flames", 
	["troy_agent_action_record_hinder_enemy_movement"] = "Lead Astray",  
	["troy_agent_action_record_own_settlement_replenishment"] = "Foster the Wounded", 
	["troy_agent_priest_pursuade_agent"] = "Reveal Transgression", 
	["troy_agent_action_record_ritual_enemy"] = "Ritual of Ruination", 
	["troy_agent_action_record_ritual_own"] = "Ritual of Exaltation", 
	["troy_agent_action_record_sacrifice"] = "Sacrificial Offering",
	["troy_agent_envoy_arrests_agent"] = "Denounce Treachery", 
	["troy_agent_action_record_less_agent_range"] = "Stall Agent", 
}

ACTION_TO_TRAIT = {
	["Assassinate Rival"] = {
		{trait_key = "troy_trait_selfish", rand_chance = 2, success_only = true, crit_success_only = true, fail_only = false},
		{trait_key = "troy_trait_liar", rand_chance = 5, success_only = false, crit_success_only = false, fail_only = true},
		{trait_key = "troy_trait_stupid", rand_chance = 5, success_only = false, crit_success_only = false, fail_only = true},
		{trait_key = "troy_trait_loyalty_feuder", rand_chance = 20, success_only = true, crit_success_only = true, fail_only = false},
	},
	["Murmurs of Sedition"] = {
		{trait_key = "troy_trait_poisoner", rand_chance = 5, success_only = true, crit_success_only = true, fail_only = false},
		{trait_key = "troy_trait_selfish", rand_chance = 2, success_only = true, crit_success_only = true, fail_only = false},
		{trait_key = "troy_trait_liar", rand_chance = 5, success_only = false, crit_success_only = false, fail_only = true},
		{trait_key = "troy_trait_stupid", rand_chance = 5, success_only = false, crit_success_only = false, fail_only = true},
	},
	["Poison the Well"] = {
		{trait_key = "troy_trait_poisoner", rand_chance = 5, success_only = true, crit_success_only = true, fail_only = false},
		{trait_key = "troy_trait_selfish", rand_chance = 2, success_only = true, crit_success_only = true, fail_only = false},
		{trait_key = "troy_trait_liar", rand_chance = 5, success_only = false, crit_success_only = false, fail_only = true},
		{trait_key = "troy_trait_stupid", rand_chance = 5, success_only = false, crit_success_only = false, fail_only = true},
	},
	["Venerate the Ancestors"] = {
		{trait_key = "troy_trait_selfish", rand_chance = 2, success_only = true, crit_success_only = true, fail_only = false},
		{trait_key = "troy_trait_liar", rand_chance = 5, success_only = false, crit_success_only = false, fail_only = true},
		{trait_key = "troy_trait_stupid", rand_chance = 5, success_only = false, crit_success_only = false, fail_only = true},
	},
	["Prophecy of Doom"] = {
		{trait_key = "troy_trait_selfish", rand_chance = 2, success_only = true, crit_success_only = true, fail_only = false},
		{trait_key = "troy_trait_liar", rand_chance = 5, success_only = false, crit_success_only = false, fail_only = true},
		{trait_key = "troy_trait_stupid", rand_chance = 5, success_only = false, crit_success_only = false, fail_only = true},
	},
	["Seeds of Dissent"] = {
		{trait_key = "troy_trait_selfish", rand_chance = 2, success_only = true, crit_success_only = true, fail_only = false},
		{trait_key = "troy_trait_liar", rand_chance = 5, success_only = false, crit_success_only = false, fail_only = true},
		{trait_key = "troy_trait_stupid", rand_chance = 5, success_only = false, crit_success_only = false, fail_only = true},
	},
	["Fan the Flames"] = {
		{trait_key = "troy_trait_selfish", rand_chance = 2, success_only = true, crit_success_only = true, fail_only = false},
		{trait_key = "troy_trait_liar", rand_chance = 5, success_only = false, crit_success_only = false, fail_only = true},
		{trait_key = "troy_trait_stupid", rand_chance = 5, success_only = false, crit_success_only = false, fail_only = true},
	},
	["Lead Astray"] = {
		{trait_key = "troy_trait_selfish", rand_chance = 2, success_only = true, crit_success_only = true, fail_only = false},
		{trait_key = "troy_trait_liar", rand_chance = 5, success_only = false, crit_success_only = false, fail_only = true},
		{trait_key = "troy_trait_stupid", rand_chance = 5, success_only = false, crit_success_only = false, fail_only = true},
	},
	["Foster the Wounded"] = {
		{trait_key = "troy_trait_selfish", rand_chance = 2, success_only = true, crit_success_only = true, fail_only = false},
		{trait_key = "troy_trait_liar", rand_chance = 5, success_only = false, crit_success_only = false, fail_only = true},
		{trait_key = "troy_trait_stupid", rand_chance = 5, success_only = false, crit_success_only = false, fail_only = true},
	},
	["Reveal Transgression"] = {
		{trait_key = "troy_trait_selfish", rand_chance = 2, success_only = true, crit_success_only = true, fail_only = false},
		{trait_key = "troy_trait_liar", rand_chance = 5, success_only = false, crit_success_only = false, fail_only = true},
		{trait_key = "troy_trait_stupid", rand_chance = 5, success_only = false, crit_success_only = false, fail_only = true},
	},
	["Ritual of Ruination"] = {
		{trait_key = "troy_trait_loyalty_devoted", rand_chance = 5, success_only = true, crit_success_only = true, fail_only = false},
		{trait_key = "troy_trait_loyalty_clairvoyant", rand_chance = 20, success_only = false, crit_success_only = true, fail_only = false},
		{trait_key = "troy_trait_selfish", rand_chance = 2, success_only = true, crit_success_only = true, fail_only = false},
		{trait_key = "troy_trait_liar", rand_chance = 5, success_only = false, crit_success_only = false, fail_only = true},
		{trait_key = "troy_trait_stupid", rand_chance = 5, success_only = false, crit_success_only = false, fail_only = true},
	},
	["Oration of Dread"] = {
		{trait_key = "troy_trait_selfish", rand_chance = 2, success_only = true, crit_success_only = true, fail_only = false},
		{trait_key = "troy_trait_liar", rand_chance = 5, success_only = false, crit_success_only = false, fail_only = true},
		{trait_key = "troy_trait_stupid", rand_chance = 5, success_only = false, crit_success_only = false, fail_only = true},
	},
	["Ritual of Exaltation"] = {	
		{trait_key = "troy_trait_loyalty_devoted", rand_chance = 5, success_only = true, crit_success_only = true, fail_only = false},
		{trait_key = "troy_trait_loyalty_clairvoyant", rand_chance = 20, success_only = false, crit_success_only = true, fail_only = false},
		{trait_key = "troy_trait_selfish", rand_chance = 2, success_only = true, crit_success_only = true, fail_only = false},
		{trait_key = "troy_trait_liar", rand_chance = 5, success_only = false, crit_success_only = false, fail_only = true},
		{trait_key = "troy_trait_stupid", rand_chance = 5, success_only = false, crit_success_only = false, fail_only = true},
	},
	["Sacrificial Offering"] = {
		{trait_key = "troy_trait_selfish", rand_chance = 2, success_only = true, crit_success_only = true, fail_only = false},
		{trait_key = "troy_trait_liar", rand_chance = 5, success_only = false, crit_success_only = false, fail_only = true},
		{trait_key = "troy_trait_stupid", rand_chance = 5, success_only = false, crit_success_only = false, fail_only = true},
	},
	["Denounce Treachery"] = {
		{trait_key = "troy_trait_selfish", rand_chance = 2, success_only = true, crit_success_only = true, fail_only = false},
		{trait_key = "troy_trait_liar", rand_chance = 5, success_only = false, crit_success_only = false, fail_only = true},
		{trait_key = "troy_trait_stupid", rand_chance = 5, success_only = false, crit_success_only = false, fail_only = true},
	},
	["Stall Agent"] = {
		{trait_key = "troy_trait_selfish", rand_chance = 2, success_only = true, crit_success_only = true, fail_only = false},
		{trait_key = "troy_trait_liar", rand_chance = 5, success_only = false, crit_success_only = false, fail_only = true},
		{trait_key = "troy_trait_stupid", rand_chance = 5, success_only = false, crit_success_only = false, fail_only = true},
	},
}

-- Industrialist
INDUSTRY_BUILDING_CHAINS = {
	-- example: ["building_chain_key"] = true,
	["troy_main_settlement_bronze"] = true,
	["troy_main_settlement_bronze_sea"] = true,
	["troy_main_settlement_coastal"] = true,
	["troy_main_settlement_coastal_sea"] = true,
	["troy_main_settlement_farm"] = true,
	["troy_main_settlement_farm_sea"] = true,
	["troy_main_settlement_forest"] = true,
	["troy_main_settlement_forest_sea"] = true,
	["troy_main_settlement_gold"] = true,
	["troy_main_settlement_gold_sea"] = true,
	["troy_main_settlement_major"] = true,
	["troy_main_settlement_major_sea"] = true,
	["troy_main_settlement_mountain"] = true,
	["troy_main_settlement_mountain_sea"] = true,
	["troy_main_settlement_stone"] = true,
	["troy_main_settlement_stone_sea"] = true
}

-- Agriculturalist
FARM_BUILDING_CHAINS = {
	-- example: ["building_chain_key"] = true,
	["troy_main_production_food"] = true,
}

-- Paranoid
PARANOID_AGENT_ACTIONS_KEY = {
	-- example: ["agent_actions_unique_id"] = true,
	["troy_agent_action_record_spy_assassinate_character"] =  true,
}

-- Strict / Severe / Authoritarian
LOW_PUBLIC_ORDER_THRESHOLD = -20
HIGH_PUBLIC_ORDER_THRESHOLD = 40
TURNS_FOR_LAZY_TRAIT = 3
TURNS_FOR_AGENT_LAZY_TRAITS = 5

-- Confederated Achilles' Indignant
has_confederated_achilles_fought = false
confederated_achilles_active_trait = false

priestess_recruitment_traits = { -- Priest traits upon recruitment
	"troy_main_trait_gof_aphrodite_favoured", 
	"troy_main_trait_gof_apollo_favoured",
	"troy_main_trait_gof_ares_favoured", 
	"troy_main_trait_gof_athena_favoured", 
	"troy_main_trait_gof_hera_favoured", 
	"troy_main_trait_gof_poseidon_favoured", 
	"troy_main_trait_gof_zeus_favoured",
	"troy_main_trait_gof_artemis_favoured",
	"troy_hep_trait_gof_hephaestus_favoured"
}

envoy_recruitment_traits = { -- Envoy traits upon recruitment
	{ key = "troy_trait_loyalty_administrator", horde_applicable = true }, 
	{ key = "troy_trait_loyalty_loyalist", horde_applicable = false }, 
	{ key = "troy_trait_loyalty_sceptic", horde_applicable = true },
	{ key = "troy_trait_loyalty_slave_trader", horde_applicable = false },
	{ key = "troy_trait_loyalty_ambitious", horde_applicable = true },
	{ key = "troy_trait_loyalty_coward", horde_applicable = true },
	{ key = "troy_trait_loyalty_coy", horde_applicable = true },
	{ key = "troy_trait_loyalty_romantic", horde_applicable = true }
}

spy_recruitment_traits = { -- Envoy traits upon recruitment
	"troy_trait_loyalty_ambitious", 
	"troy_trait_loyalty_coward",
	"troy_trait_loyalty_coy", 
	"troy_trait_loyalty_romantic", 
	"troy_trait_loyalty_despondent", 
	"troy_trait_loyalty_menelaus_pioneer", 
	"troy_trait_loyalty_sentinel"
}

agent_rank_up_traits_in_region = {
	["troy_agent_priest"] = 
	{
		{trait_key = "troy_trait_loyalty_achilles_affectionate", rand_chance = 5, own_region = true, is_allied_region = false  },
		{trait_key = "troy_trait_loyalty_reverent", rand_chance = 5, own_region = true, is_allied_region = false  },
	},
	["troy_agent_spy"] = 
	{
		{trait_key = "troy_trait_loyalty_odysseus_smuggler", rand_chance = 10, own_region = false, is_allied_region = false  },
	},
}

envoy_rank_up_buildings_to_traits = {  --- Collects traits for Envoy
	["troy_main_settlement_bronze"] = {
		{ trait = "troy_main_trait_owns_resource_bronze", rand_chance = 10 }
	},
	["troy_main_settlement_bronze_sea"] = {
		{ trait = "troy_main_trait_owns_resource_bronze", rand_chance = 10 }
	},
	["troy_main_settlement_farm"] = {
		{ trait = "troy_main_trait_owns_resource_food", rand_chance = 10 }
	},
	["troy_main_settlement_farm_sea"] = {
		{ trait = "troy_main_trait_owns_resource_food", rand_chance = 10 }
	},
	["troy_main_settlement_forest"] = {
		{ trait = "troy_main_trait_owns_resource_wood", rand_chance = 10 }
	},
	["troy_main_settlement_forest_sea"] = {
		{ trait = "troy_main_trait_owns_resource_wood", rand_chance = 10 }
	},
	["troy_main_settlement_gold"] = {
		{ trait = "troy_main_trait_owns_resource_gold", rand_chance = 10 }
	},
	["troy_main_settlement_gold_sea"] = {
		{ trait = "troy_main_trait_owns_resource_gold", rand_chance = 10 }
	},
	["troy_main_settlement_stone"] = {
		{ trait = "troy_main_trait_owns_resource_stone", rand_chance = 10 }
	},
	["troy_main_settlement_stone_sea"] = {
		{ trait = "troy_main_trait_owns_resource_stone", rand_chance = 10 }
	},
}

--while in region with X production
agent_in_region_with_production = {
	["troy_agent_priest"] = 
	{
		{trait_key = "troy_trait_loyalty_merchant", rand_chance = 2, production_needed = 300 },
		{trait_key = "troy_trait_loyalty_sarpedon_lucrative", rand_chance = 2, production_needed = 300 },
	},
	["troy_agent_spy"] = 
	{
		{trait_key = "troy_trait_loyalty_merchant", rand_chance = 2, production_needed = 300 },
		{trait_key = "troy_trait_loyalty_sarpedon_lucrative", rand_chance = 2, production_needed = 300 },
	},
	["troy_agent_envoy"] = 
	{
		{trait_key = "troy_trait_loyalty_merchant", rand_chance = 2, production_needed = 300 },
		{trait_key = "troy_trait_loyalty_sarpedon_lucrative", rand_chance = 2, production_needed = 300 },
	},
}

-- Diomedes Strategy camp building to trait table
strategy_camp_building_to_trait = {
	["troy_adi_special_diomedes_military_camp_2"] = {
		{trait = "troy_adi_trait_diomedes_building_trait", points = 1, own_faction_only = true}
	},
	["troy_adi_special_diomedes_military_camp_3"] = {
		{trait ="troy_adi_trait_diomedes_building_trait", points = 2, own_faction_only = true}
	},
	["troy_adi_special_diomedes_military_camp_4"] = {
		{trait ="troy_adi_trait_diomedes_building_trait", points = 3, own_faction_only = true}
	}
}
-- Diomedes Strategy camp trait turns to acquire
DIO_STRATEGY_CAMP_TRAIT_TURNS = 3

-------------------------------------
------ Function that checks if  -----
------  the supplied character is ---
-----   either Ajax or Teucer -------
-------------------------------------
function ajax_teucer_check(character)
	adi_characters = {
		--ajax
		names_name_648162272 = true,

		--teucer
		names_name_121567699 = true,
	}
	return character ~= nil and not character:is_null_interface() and character:get_forename() ~= "" and adi_characters[character:get_forename()] == true
end
------------------------------------------------------------------------------
---- Function: Gives points in a trait to a Lord, with an optional chance ----
------------------------------------------------------------------------------
function Give_Trait(character, trait, _points, _chance)
	local chance = _chance or 100
	local points = _points or 1
	local char_str = cm:char_lookup_str(character:command_queue_index())
	--local trait_level = nil
	
	if character == nil then
		out("TRAIT ERROR: Tried to give trait to a character that was not specified!")
		return false
	end

	if character:is_null_interface() == true then
		out("TRAIT ERROR: Tried to give trait to a character that was a null interface!")
		return false
	end

	if character:has_military_force() then
		if character:military_force():is_armed_citizenry() then
			return false
		end
	end
	
	--[[ if Check_Exclusion(trait, character) then
		return false
	end ]]
	
	if cm:model():random_percent(chance) == false then
		return false
	end

	--[[ for i = 1, points do
		if i == 1 then
			cm:force_add_trait(char_str, trait, true)
		else
			cm:force_add_trait(char_str, trait, false)
		end
	end ]]

	cm:force_add_trait(char_str, trait, true, points)

	return true
end

function Remove_Trait(character, trait)
	local char_str = cm:char_lookup_str(character:command_queue_index())
	if character == nil then
		return false
	end

	if character:is_null_interface() == true then
		return false
	end

	cm:force_remove_trait(char_str, trait)
	return true
end

--[[function Remove_Single_Negative_Trait(character)
	local negative_traits = {unpack(DEFEAT_AND_LAZY_TRAITS)}
	cm:random_sort(negative_traits)
	for i = 1, #negative_traits do
		if character:has_trait(negative_traits[i]) then
			Remove_Trait(character, negative_traits[i])
			return
		end
	end
end]]

function GiveVictoryTrait(character, trait, _points, _chance)
	local trait_level = character:trait_level(trait)

	Give_Trait(character, trait, _points, _chance)

	if trait_level < character:trait_level(trait) then
		local negative_traits = cm:random_sort_copy(DEFEAT_AND_LAZY_TRAITS)
		for i = 1, #negative_traits do
			if character:has_trait(negative_traits[i]) and character:trait_level(negative_traits[i]) ~= -1  then
				Remove_Trait(character, negative_traits[i])
				break
			end
		end
	end
end

function Check_Exclusion(trait, character)
	local char_faction = character:faction()
	local char_culture = char_faction:culture()
	local char_subculture = char_faction:subculture()
	local char_faction_name = char_faction:name()

	local culture_exclusions = TRAIT_EXCLUSIONS["culture"][trait]
	local subculture_exclusions = TRAIT_EXCLUSIONS["subculture"][trait]
	local faction_exclusions = TRAIT_EXCLUSIONS["faction"][trait]
	
	if culture_exclusions ~= nil then
		for i = 1, #culture_exclusions do
			if culture_exclusions[i] == char_culture then
				return true
			end
		end
	end
	if subculture_exclusions ~= nil then
		for i = 1, #subculture_exclusions do
			if subculture_exclusions[i] == char_subculture then
				return true
			end
		end
	end
	if faction_exclusions ~= nil then
		for i = 1, #faction_exclusions do
			if faction_exclusions[i] == char_faction_name then
				return true
			end
		end
	end
	if character:character_type("colonel") or char_faction:is_quest_battle_faction() then
		return true
	end
	return false
end

-------------------------------------------------------------------
---- Function: Retrieves a piece of recorded data about a Lord ----
-------------------------------------------------------------------
function Get_Lord_Record(character, stat_key)
	if not character:is_null_interface() then
		local char_cqi = character:command_queue_index()
		local val = TRAIT_LORDS_RECORDS[tostring(char_cqi).."_"..stat_key]
		return val
	end
end

-------------------------------------------------------------------------
---- Function: Records a piece of custom data associated with a Lord ----
-------------------------------------------------------------------------
function Set_Lord_Record(character, stat_key, value)
	if character:is_null_interface() == false then
		local char_cqi = character:command_queue_index()
		TRAIT_LORDS_RECORDS[tostring(char_cqi).."_"..stat_key] = value
	end
end

-------------------------------
---- DEFEATING EPIC HEROES ----
-------------------------------
function Award_Epic_Hero_Trait(context)
	local character = context:character()
	local battle = context:pending_battle()
	local side = Get_Character_Side_In_Last_Battle(character)

	if character:has_military_force() and character:won_battle() then 
		if battle:night_battle() and side == "Attacker" then
			local def_char_subtype = battle:defender():character_subtype_key()
			local trait_to_give = EPIC_HERO_DEFEATED_TRAITS[def_char_subtype]
			if ajax_teucer_check(character) then 
				trait_to_give = TROY_ADI_EPIC_HERO_DEFEATED_TRAITS[def_char_subtype]
			end
			if trait_to_give ~= nil then 
				Give_Trait(character,trait_to_give)
			end
		elseif battle:night_battle() and side == "Defender" then
			local att_char_subtype = battle:attacker():character_subtype_key()
			local trait_to_give = EPIC_HERO_DEFEATED_TRAITS[att_char_subtype]
			if ajax_teucer_check(character) then 
				trait_to_give = TROY_ADI_EPIC_HERO_DEFEATED_TRAITS[att_char_subtype]
			end
			if trait_to_give ~= nil then 
				Give_Trait(character,trait_to_give)
			end
		else
			local epic_hero_enemies = Find_Enemy_Epic_Heroes_In_Last_battle(character)

			for i=1, #epic_hero_enemies do 
				local trait_to_give = EPIC_HERO_DEFEATED_TRAITS[epic_hero_enemies[i]]
				if ajax_teucer_check(character) then 
					trait_to_give = TROY_ADI_EPIC_HERO_DEFEATED_TRAITS[epic_hero_enemies[i]]
				end
				if trait_to_give ~= nil then 
					Give_Trait(character,trait_to_give)
				end
			end
		end
	end
end

function Find_Enemy_Epic_Heroes_In_Last_battle(character) 
	local Epic_heroes_attackers = {}
	local Epic_heroes_defenders = {}
	local was_attacker = false

	for i=1, cm:pending_battle_cache_num_attackers() do
		local this_char_cqi = cm:pending_battle_cache_get_attacker(i)
		local char_object = cm:model():character_for_command_queue_index(this_char_cqi)
		if this_char_cqi == character:command_queue_index() then 
			was_attacker = true
			break
		end

		if not char_object:is_null_interface() then 
			local char_subtype = char_object:character_subtype_key()
			if EPIC_HERO_DEFEATED_TRAITS[char_subtype] ~= nil then 
				table.insert(Epic_heroes_attackers,char_subtype)
			end
		end
	end 

	if not was_attacker then 
		return Epic_heroes_attackers
	end

	for i=1, cm:pending_battle_cache_num_defenders() do
		local this_char_cqi = cm:pending_battle_cache_get_defender(i)
		local char_object = cm:model():character_for_command_queue_index(this_char_cqi)

		if not char_object:is_null_interface() then 
			local char_subtype = char_object:character_subtype_key()
			if EPIC_HERO_DEFEATED_TRAITS[char_subtype] ~= nil then 
				table.insert(Epic_heroes_defenders,char_subtype)
			end
		end
	end 

	return Epic_heroes_defenders
end

core:add_listener (
	"Troy_epic_hero_defeated_traits",
	"CharacterCompletedBattle",
	function(context)
		return EPIC_HERO_DEFEATED_TRAITS[context:character():character_subtype_key()]
	end,
	function(context) Award_Epic_Hero_Trait(context) end,
	true
)
--[[ 
-------------------------------------------------------------------------------------------------------------------------------------------------------------	
----	This section has been commented out because we're not currently using it and this way there is no chance of something unwanted to trigger.
----	Uncomment if you want to use these. 
-------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------
---- AGENT ACTIONS AGAINST SUBCULTURES ----
-------------------------------------------
function Character_Character_Target_Action(context)
	if context:ability() ~= "assist_army" and (context:mission_result_success() or context:mission_result_critial_success()) then
		local subculture = context:target_character():faction():subculture()
		local own_subculture = context:character():faction():subculture()
		
		if subculture ~= own_subculture and SUBCULTURES_TRAIT_KEYS[subculture] ~= nil then
			Give_Trait(context:character(), "troy_main_trait_agent_actions_against_"..SUBCULTURES_TRAIT_KEYS[subculture])
		end
	end
end

function Character_Garrison_Target_Action(context)
	if context:mission_result_success() or context:mission_result_critial_success() then
		local subculture = context:garrison_residence():faction():subculture()
		
		if SUBCULTURES_TRAIT_KEYS[subculture] ~= nil then
			Give_Trait(context:character(), "troy_main_trait_agent_actions_against_"..SUBCULTURES_TRAIT_KEYS[subculture])
		end
	end
end

core:add_listener (
	"Troy_agent_actions_against_character_subcultures",
	"CharacterCharacterTargetAction",
	true,
	function(context) Character_Character_Target_Action(context) end,
	true
)
core:add_listener (
	"Troy_agent_actions_against_garrison_subcultures",
	"CharacterGarrisonTargetAction",
	true,
	function(context) Character_Garrison_Target_Action(context) end,
	true
)
]]
------------------------
---- BATTLES FOUGHT ----
------------------------
function character_battles_fought(context)
	local character = context:character()
	local battle = context:pending_battle()
	local side = Get_Character_Side_In_Last_Battle(character)
	local num_battles_won = character:battles_won()
	local num_battles_lost_or_draws = character:battles_fought() - num_battles_won
	local offensive_siege_battles_fought = character:offensive_sieges_fought()
	local offensive_siege_battles_won = character:offensive_sieges_won()
	local defensive_siege_battles_fought = character:defensive_sieges_fought()
	local defensive_siege_battles_won = character:defensive_sieges_won()
	local battle_outcome = ""
	local stance = character:military_force():active_stance()

	if side == "Attacker" then
		battle_outcome = battle:attacker_battle_result()
	elseif side == "Defender" then
		battle_outcome = battle:defender_battle_result()
	end
	
	if character:won_battle() then
		if not ajax_teucer_check(character) then
			GiveVictoryTrait(character, "troy_main_trait_wins")	
		else 
			GiveVictoryTrait(character, "troy_adi_trait_wins")
		end

		if battle:seige_battle() then
			if not ajax_teucer_check(character) then
				GiveVictoryTrait(character, "troy_main_trait_siege_victory", 1 , 75)
			else
				GiveVictoryTrait(character, "troy_adi_trait_siege_victory", 1 , 75)
			end
		end

		if character:is_at_sea() then
			if not ajax_teucer_check(character) then
				GiveVictoryTrait(character, "troy_main_trait_wins_at_sea", 1 , 50)
			else
				GiveVictoryTrait(character, "troy_adi_trait_wins_at_sea", 1 , 50)
			end
		end

		if stance == "MILITARY_FORCE_ACTIVE_STANCE_TYPE_LAND_RAID" or stance == "MILITARY_FORCE_ACTIVE_STANCE_TYPE_SET_CAMP_RAIDING" then
			GiveVictoryTrait(character, "troy_main_trait_bad_raider")
		end
		if battle:ambush_battle() and not battle:failed_ambush_battle() then
			GiveVictoryTrait(character, "troy_main_trait_stance_ambushing", 1 , 50)
		end
		if side == "Attacker" then
			if battle:secondary_attackers():is_empty() then
				GiveVictoryTrait(character, "troy_main_trait_lone_wolf", 1 , 50)
			end
			--Special Trait for confederated Achilles
			if character:character_subtype("troy_achilles") and character:is_faction_leader() == false then
				if confederated_achilles_active_trait ~= "troy_trait_achilles_conf_outraged" and character:has_trait(confederated_achilles_active_trait) then
					Remove_Trait(character, confederated_achilles_active_trait)
				end
				GiveVictoryTrait(character, "troy_trait_achilles_conf_outraged")
				confederated_achilles_active_trait = "troy_trait_achilles_conf_outraged"
			end

			if not ajax_teucer_check(character) then
				GiveVictoryTrait(character, "troy_main_trait_attacking_victory", 1 , 50)
			else
				GiveVictoryTrait(character, "troy_adi_trait_attacking_victory", 1 , 50)
			end
		elseif side == "Defender" then
			if battle:secondary_defenders():is_empty() then
				GiveVictoryTrait(character, "troy_main_trait_lone_wolf", 1 , 50)
			end

			if not ajax_teucer_check(character) then
				GiveVictoryTrait(character, "troy_main_trait_defending_victory", 1 , 50)
			else
				GiveVictoryTrait(character, "troy_adi_trait_defending_victory", 1 , 50)
			end
		end
	else
		if battle:seige_battle() then
			Give_Trait(character, "troy_main_trait_siege_" .. battle_outcome , 1 , 50)
		end
		if character:is_at_sea() then
			Give_Trait(character, "troy_main_trait_at_sea_" .. battle_outcome , 1 , 50)
		end
		if side == "Attacker" then
			if battle:attacker_commander_fought_in_melee() then
				Give_Trait(character, "troy_main_trait_melee_" .. battle_outcome , 1 , 50)
			else
				Give_Trait(character, "troy_main_trait_no_melee_" .. battle_outcome , 1 , 50)
			end
			Give_Trait(character, "troy_main_trait_attacking_" .. battle_outcome , 1 , 50)
		elseif side == "Defender" then
			if battle:defender_commander_fought_in_melee() then
				Give_Trait(character, "troy_main_trait_melee_" .. battle_outcome , 1 , 50)
			else
				Give_Trait(character, "troy_main_trait_no_melee_" .. battle_outcome , 1 , 50)
			end
			Give_Trait(character, "troy_main_trait_defending_" .. battle_outcome , 1 , 50)
		end
	end

	if battle_outcome == "heroic_victory" then
		if not ajax_teucer_check(character) then
			GiveVictoryTrait(character, "troy_main_trait_heroic_victory")
		else
			GiveVictoryTrait(character, "troy_adi_trait_heroic_victory")
		end
	end

	if character:is_wounded() then
		Give_Trait(character, "troy_main_trait_agent_target_success", 1 , 50)
	end
end

core:add_listener(
	"Troy_character_battles_fought",
	"CharacterCompletedBattle",
	true,
	character_battles_fought,
	true
)

-------------------------------------
---- BATTLES AGAINST SUBCULTURES ----
-------------------------------------
function Character_Battles_Against_Subcultures(context)
	local character = context:character()
	local side = Get_Character_Side_In_Last_Battle(character)
	local enemy_culture = ""
	local enemy_subculture = ""
	
	if side == "Attacker" then
		local char_cqi, fm_cqi, mf_cqi, faction_name = cm:pending_battle_cache_get_defender(1)
		local world = cm:model():world()
		
		if world:faction_exists(faction_name) then
			local faction = world:faction_by_key(faction_name)
			enemy_culture = faction:culture()
			enemy_subculture = faction:subculture()
		end
	elseif side == "Defender" then
		local char_cqi, fm_cqi, mf_cqi, faction_name = cm:pending_battle_cache_get_attacker(1)
		local world = cm:model():world()
		
		if world:faction_exists(faction_name) then
			local faction = world:faction_by_key(faction_name)
			enemy_culture = faction:culture()
			enemy_subculture = faction:subculture()
		end
	end
	
	if character:faction():subculture() ~= enemy_subculture and SUBCULTURES_TRAIT_KEYS[enemy_subculture] ~= nil then
		if character:won_battle() == true then
			--Give_Trait(context:character(), "troy_main_trait_wins_against_"..SUBCULTURES_TRAIT_KEYS[enemy_subculture])
		else
			--Give_Trait(context:character(), "troy_main_trait_defeats_against_"..SUBCULTURES_TRAIT_KEYS[enemy_subculture])
		end
	elseif enemy_culture == "troy_main_rogue" then
		--Give_Trait(context:character(), "troy_main_trait_wins_against_rogue_armies")
	end
end

function Get_Character_Side_In_Last_Battle(character)
	for i = 1, cm:pending_battle_cache_num_attackers() do
		local char_cqi = cm:pending_battle_cache_get_attacker(i)
		
		if char_cqi == character:command_queue_index() then
			return "Attacker"
		end
	end
	for i = 1, cm:pending_battle_cache_num_defenders() do
		local char_cqi = cm:pending_battle_cache_get_defender(i)
		
		if char_cqi == character:command_queue_index() then
			return "Defender"
		end
	end
	return ""
end

core:add_listener (
	"Troy_character_battles_against_subcultures",
	"CharacterCompletedBattle",
	true,
	function(context) Character_Battles_Against_Subcultures(context) end,
	true
)

core:add_listener (
	"Troy_character_battles_against_subcultures_reinforcing",
	"CharacterParticipatedAsSecondaryGeneralInBattle",
	true,
	function(context) Character_Battles_Against_Subcultures(context) end,
	true
)

------------------------------
---- FOUGHT NAVAL BATTLES ----
------------------------------
--[[ function Character_Fought_Naval_Battles(context)
	local character = context:character()
	
	if character:is_at_sea() == true then
		if character:won_battle() == true then
			Give_Trait(character, "troy_main_trait_wins_at_sea")
		else
			Give_Trait(character, "troy_main_trait_defeats_at_sea")
		end
	end
end

core:add_listener (
	"Troy_character_fought_naval_battles",
	"CharacterCompletedBattle",
	true,
	function(context) Character_Fought_Naval_Battles(context) end,
	true
) ]]

---------------------------------
---- REINFORCING SUBCULTURES ----
---------------------------------
function battle_conflict_finished_award_reinforcement_traits(context)
	local battle = context:pending_battle()
	if battle:has_attacker() then
		award_reinforcement_traits(battle:attacker_faction(), battle:secondary_attackers())
	end
	if battle:has_defender() then
		award_reinforcement_traits(battle:defender_faction(), battle:secondary_defenders())
	end
end

function award_reinforcement_traits(faction, secondary_participants)
	if secondary_participants:is_empty() then return end
	local primary_subculture = faction:subculture()

	for i = 0, secondary_participants:num_items() - 1 do
		local character = secondary_participants:item_at(i)
		--if character:faction():subculture() == primary_subculture then
			-- Reinforced the same subculture
			if character:won_battle() then
				if not ajax_teucer_check(character) then 
					Give_Trait(character, "troy_main_trait_saviour", 1 , 50)
				else
					Give_Trait(character, "troy_adi_trait_saviour", 1 , 50)
				end
			end
			Give_Trait(character, "troy_main_trait_reinforcing", 1 , 50)
		--elseif SUBCULTURES_TRAIT_KEYS[primary_subculture] ~= nil then
			-- Reinforced another subculture
			--local trait = "troy_main_trait_reinforcing_" .. SUBCULTURES_TRAIT_KEYS[primary_subculture]
			--Give_Trait(character, trait)
		--end
	end
end

core:add_listener(
	"Troy_character_reinforcing",
	"BattleConflictFinished",
	true,
	function(context)
		battle_conflict_finished_award_reinforcement_traits(context)
	end,
	true
)

--------------------------------
---- TURNS WITHOUT A BATTLE ----
--------------------------------
--[[
core:add_listener (
	"Troy_character_turns_without_a_battle",
	"CharacterTurnStart",
	true,
	function(context)
		local character = context:character()
		if cm:char_is_general_with_army(character) then
			Give_Trait(character, "troy_main_trait_pacifist")
		end
	end,
	true
)

core:add_listener (
	"Troy_character_reset_turns_without_a_battle",
	"CharacterCompletedBattle",
	true,
	function(context)
		local character = context:character()
		if cm:char_is_general_with_army(character) then
			Remove_Trait(character, "troy_main_trait_pacifist")
		end
	end,
	true
)
]]
--------------------------------
---- TURNS IN ENEMY REGIONS ----
--------------------------------
--[[function Character_Turns_In_Enemy_Regions(context)
	local character = context:character()

	if character:faction():is_horde() == false then
		if cm:char_is_general_with_army(character) and character:has_region() and not character:region():is_abandoned() then
			if character:turns_in_enemy_regions() >= 20 then
				if character:trait_points("troy_main_trait_lone_wolf") == 2 then
					Give_Trait(character, "troy_main_trait_lone_wolf")
				end
			elseif character:turns_in_enemy_regions() >= 15 then
				if character:trait_points("troy_main_trait_lone_wolf") == 1 then
					Give_Trait(character, "troy_main_trait_lone_wolf")
				end
			elseif character:turns_in_enemy_regions() >= 10 then
				if character:trait_points("troy_main_trait_lone_wolf") == 0 then
					Give_Trait(character, "troy_main_trait_lone_wolf")
				end
			end
		end
	end
end

core:add_listener (
	"Troy_character_turns_in_enemy_regions",
	"CharacterTurnStart",
	true,
	function(context) Character_Turns_In_Enemy_Regions(context) end,
	true
)
]]
----------------------------
---- TURNS SPENT AT SEA ----
----------------------------
function Character_Turns_Spent_At_Sea(context)
	local character = context:character()

	if character:is_at_sea() and cm:char_is_general_with_army(character) then
		Give_Trait(character, "troy_main_trait_sea_legs")
	end
end

core:add_listener (
	"Troy_character_turns_spent_at_sea",
	"CharacterTurnStart",
	true,
	function(context) Character_Turns_Spent_At_Sea(context) end,
	true
)
-------------------------
---- TIME IN STANCES ----
-------------------------
function Character_Time_In_Stances(context)
	local character = context:character()
	
	if cm:char_is_general_with_army(character) and character:has_military_force() then
		local stance = character:military_force():active_stance()
		--local culture = character:faction():culture()
		
		-- RAIDING
		if stance == "MILITARY_FORCE_ACTIVE_STANCE_TYPE_LAND_RAID" or stance == "MILITARY_FORCE_ACTIVE_STANCE_TYPE_SET_CAMP_RAIDING" then
			Give_Trait(character, "troy_main_trait_stance_raiding", 1 , 50)
		-- FORCED MARCH
		elseif stance == "MILITARY_FORCE_ACTIVE_STANCE_TYPE_MARCH" then
			Give_Trait(character, "troy_main_trait_stance_forced_march", 1 , 50)
		-- RECRUITING
		elseif stance == "MILITARY_FORCE_ACTIVE_STANCE_TYPE_MUSTER" then
			Give_Trait(character, "troy_main_trait_stance_recruiting", 1 , 50)
		end
	end
end

core:add_listener (
	"Troy_character_time_in_stances",
	"CharacterTurnEnd",
	true,
	function(context) Character_Time_In_Stances(context) end,
	true
)

-----------------------------
---- SACKING SETTLEMENTS ----
-----------------------------
function Character_Sacked_Settlement(context)
	if cm:char_is_general_with_army(context:character()) then
		Give_Trait(context:character(), "troy_main_trait_sacking", 1 , 75)
	end
end

core:add_listener (
	"Troy_character_sacked_settlement",
	"CharacterSackedSettlement",
	true,
	function(context) Character_Sacked_Settlement(context) end,
	true
)

-----------------------------
---- RAZING SETTLEMENTS ----
-----------------------------
function Character_Razed_Settlement(context)
	if cm:char_is_general_with_army(context:character()) then
		Give_Trait(context:character(), "troy_main_trait_razing")
	end
end

core:add_listener (
	"Troy_character_razed_settlement",
	"CharacterRazedSettlement",
	true,
	function(context) Character_Razed_Settlement(context) end,
	true
)

--------------------------
---- ROUTED IN BATTLE ----
--------------------------
--[[ function Character_Routed_In_Battle(context)
	if cm:char_is_general_with_army(context:character()) then
		if context:character():routed_in_battle() and context:character():won_battle() == false then
			Give_Trait(context:character(), "troy_main_trait_routed")
		elseif context:character():routed_in_battle() == false and context:character():won_battle() == true and context:character():fought_in_battle() then
			Give_Trait(context:character(), "troy_main_trait_fighter", 1 , 50)
		end
	end
end

core:add_listener (
	"Troy_character_routed_in_battle",
	"CharacterCompletedBattle",
	true,
	function(context) Character_Routed_In_Battle(context) end,
	true
) ]]

-------------------------------
---- POST-BATTLE RANSOMING ----
-------------------------------
function Character_Post_Battle_Release(context)
	if cm:char_is_general_with_army(context:character()) then
		Give_Trait(context:character(), "troy_main_trait_post_battle_ransom")
	end
end

core:add_listener (
	"Troy_character_post_battle_release",
	"CharacterPostBattleRelease",
	true,
	function(context) Character_Post_Battle_Release(context) end,
	true
)

-------------------------------
---- POST-BATTLE EXECUTING ----
-------------------------------
function Character_Post_Battle_Executing(context)
	if cm:char_is_general_with_army(context:character()) and not context:is_automatically_selected() then
		Give_Trait(context:character(), "troy_main_trait_post_battle_execute")
	end
end

core:add_listener (
	"Troy_character_post_battle_executing",
	"CharacterPostBattleSlaughter",
	true,
	function(context) Character_Post_Battle_Executing(context) end,
	true
)

---------------------------------
---- FOUGHT FAR FROM CAPITAL ----
---------------------------------
--[[ function Character_Far_From_Capital(context)
	local character = context:character()

	if character:faction():is_horde() == false then
		if cm:char_is_general_with_army(character) and character:faction():has_home_region() then
			local home = character:faction():home_region():settlement()
			if distance_squared(character:logical_position_x(), character:logical_position_y(), home:logical_position_x(), home:logical_position_y()) >= 1500 then
				Give_Trait(character, "troy_main_trait_far_from_capital")
			end 
		end
	end
end

core:add_listener (
	"Troy_character_far_from_capital",
	"CharacterCompletedBattle",
	true,
	function(context) Character_Far_From_Capital(context) end,
	true
) ]]
--------------------------------------
---- IN OWNED SETTLEMENT TOO LONG ----
--------------------------------------
function Character_Being_Lazy(context)
	local character = context:character()

	if character:faction():is_allowed_to_capture_territory() then
		if character:faction():is_human() and cm:char_is_general_with_army(character) and character:has_region() then
			if character:has_region() and character:region():public_order() >= HIGH_PUBLIC_ORDER_THRESHOLD and character:military_force():active_stance() ~= "MILITARY_FORCE_ACTIVE_STANCE_TYPE_MUSTER" then
				local char_turns_being_lazy = Get_Lord_Record(character, "turns_lazy") or 0
				char_turns_being_lazy = char_turns_being_lazy + 1
				out("CHAR TURNS BEING LAZY = "..tostring(char_turns_being_lazy))
				
				if char_turns_being_lazy >= TURNS_FOR_LAZY_TRAIT then
					if context:character():region():settlement():production_type()  == "troy_main_settlement_major" then
						Give_Trait(character, "troy_main_trait_bad_lazy")
					else
						Give_Trait(character, "troy_main_trait_bad_procrastinator")
					end
					Set_Lord_Record(character, "turns_lazy", 0)
				else
					Set_Lord_Record(character, "turns_lazy", char_turns_being_lazy)
				end
			else
				Set_Lord_Record(character, "turns_lazy", 0)
			end
		end
	end
end

core:add_listener (
	"Troy_character_being_lazy",
	"CharacterTurnStart",
	function(context)
		local character = context:character()
		return character:has_region() and character:faction():name() == character:region():owning_faction():name()
	end,
	function(context) Character_Being_Lazy(context) end,
	true
)

---------------------------------------------
---- IN SETTLEMENT WITH LOW PUBLIC ORDER ----
---------------------------------------------
function Character_Garrisoned_Low_Happiness(context)
	local character = context:character()
	
	if cm:char_is_general_with_army(character) and character:has_region() and character:region():public_order() <= LOW_PUBLIC_ORDER_THRESHOLD then
		if character:region():owning_faction():name() == character:faction():name() and character:in_settlement() == true then
			Give_Trait(character, "troy_main_trait_public_order")
		end
	end
end

core:add_listener (
	"Troy_character_garrisoned_low_happiness",
	"CharacterTurnStart",
	true,
	function(context) Character_Garrisoned_Low_Happiness(context) end,
	true
)

---------------------------------------------
--------------- UNDER SIEGE -----------------
---------------------------------------------

core:add_listener (
	"Troy_character_under_siege",
	"CharacterTurnStart",
	function(context)
		local character = context:character()
		if character:has_region() and character:region():owning_faction():name() == character:faction():name() and character:in_settlement() == true then
			return character:garrison_residence():is_under_siege()
		end
	end,
	function(context) 
		local character = context:character()
		if cm:char_is_general_with_army(character) and character:has_region() then
			Give_Trait(character, "troy_main_trait_lazy", 1 , 50)
		end 
	end,
	true
)

---------------------------------------------
------ CONFEDERATED ACHILLES INDIGNANT ------
---------------------------------------------

core:add_listener (
	"Troy_character_conf_achilles_indignant",
	"CharacterTurnStart",
	function(context)
		local character = context:character()
		if character:is_faction_leader() ~= true and character:character_subtype("troy_achilles") then
			if has_confederated_achilles_fought then
				has_confederated_achilles_fought = false
				return false
			else
				return true
			end			
		end
	end,
	function(context) 
		local character = context:character()
		if cm:char_is_general_with_army(character) and character:has_region() then
			if confederated_achilles_active_trait ~= "troy_trait_achilles_conf_indignant" and character:has_trait(confederated_achilles_active_trait) then
				Remove_Trait(character, confederated_achilles_active_trait)
			end
			Give_Trait(character, "troy_trait_achilles_conf_indignant")
			confederated_achilles_active_trait = "troy_trait_achilles_conf_indignant"
		end 
	end,
	true
)

core:add_listener (
		"Troy_confederated_achilles_participated_in_battle",
		"CharacterCompletedBattle",
		function(context)
			local character = context:character()
			return character:character_subtype("troy_achilles") and character:is_faction_leader() ~= true
		end,
		function(context)
			has_confederated_achilles_fought = true
		end,
		true
		)

--------------------------------------------
---- IN REGION WHEN BUILDINGS ARE BUILT ----
--------------------------------------------
function Character_Builder(context)
	if context:building():faction():character_list():num_items() > 1 then
		for i = 0, context:building():faction():character_list():num_items() - 1 do
			local builder = context:building():faction():character_list():item_at(i)
			
			if builder:has_region() and cm:char_is_general_with_army(builder) and builder:region():name() == context:building():region():name() then
				Give_Trait(builder, "troy_main_trait_builder", 1 , 50)
			end
		end
	end
end

core:add_listener (
	"Troy_character_builder",
	"BuildingCompleted",
	true,
	function(context) Character_Builder(context) end,
	true
)

------------------------------------------------
---- ARMY SUFFERS HIGH CASUALTIES IN BATTLE ----
------------------------------------------------
function Character_Force_High_Casualties(context)
	local character = context:character()
	local side = Get_Character_Side_In_Last_Battle(character)
	local battle = context:pending_battle()

	if side == "Attacker" then
		battle_outcome = battle:attacker_battle_result()
	elseif side == "Defender" then
		battle_outcome = battle:defender_battle_result()
	end
	
	if cm:char_is_general_with_army(character) then
		local losses = character:percentage_of_own_alliance_killed()
		
		if losses >= 0.6 then
			if character:character_subtype("troy_achilles") and character:is_faction_leader() == false then
				if confederated_achilles_active_trait ~= "troy_trait_achilles_conf_grieving" and character:has_trait(confederated_achilles_active_trait) then
					Remove_Trait(character, confederated_achilles_active_trait)
				end
				Give_Trait(character, "troy_trait_achilles_conf_grieving")
			end
			if battle_outcome == "decisive_defeat" then
				Give_Trait(character, "troy_main_trait_escaped_death_1", 1, 50)
			end
			if battle_outcome == "crushing_defeat" then
				Give_Trait(character, "troy_main_trait_tormented_1", 1, 50)
			end
			Give_Trait(character, "troy_main_trait_casualties")
		end
	end
end

core:add_listener (
	"Troy_character_force_high_casualties",
	"CharacterCompletedBattle",
	true,
	function(context) Character_Force_High_Casualties(context) end,
	true
)

------------------------------------------------
---------- CONQUER MYCENAE OR TROY -------------
------------------------------------------------
function Character_Conquered_Famous_Region(context)
	local character = context:character()
	local region_name = context:garrison_residence():region():name()
	Give_Trait(character, REGIONS_FOR_TRAITS[region_name])
end

core:add_listener (
	"Troy_conquered_famous_region",
	"CharacterPerformsSettlementOccupationDecision",
	function(context)
		local post_battle_option = context:occupation_decision_option()
		if post_battle_option == "occupation_decision_occupy" or post_battle_option == "occupation_decision_loot" then
			local region_name = context:garrison_residence():region():name()
			if context:character():is_faction_leader() then
				return REGIONS_FOR_TRAITS[region_name]
			end
		end
	end,
	function(context) Character_Conquered_Famous_Region(context) end,
	true
)

-----------------------------------------
---- AGENT ACTIONS AGAINST CHARACTER ----
-----------------------------------------
function Agent_Action_Against_Character(context)
	local target = context:target_character()
	
	if context:ability() == "assist_army" or context:ability() == "assist_province" or context:ability() == "command_force" or context:ability() == "passive_ability" then
		return false
	end
	
	if context:mission_result_success() == true or context:mission_result_critial_success() == true then
	
		if target:is_null_interface() == false then
			--Give_Trait(target, "troy_main_trait_agent_target_success")

			-- Character trait Paranoid
			if PARANOID_AGENT_ACTIONS_KEY[context:agent_action_key()] ~= nil then
				Give_Trait(target, "troy_main_trait_agent_target_success", 1 , 50)
			end
		end
	elseif context:mission_result_opportune_failure() == true or context:mission_result_failure() == true or context:mission_result_critial_failure() == true then
		if target:is_null_interface() == false then
			Give_Trait(target, "troy_main_trait_agent_target_fail", 1 , 50)
		end
	end
end

core:add_listener (
	"Troy_agent_action_against_character",
	"CharacterCharacterTargetAction",
	function(context) return context:target_character():character_type_key() == "general" end,
	function(context) Agent_Action_Against_Character(context) end,
	true
)

-------------------------------
---- IN REGION WITH SLAVES ----
-------------------------------
--[[ events.CharacterTurnStart[#events.CharacterTurnStart+1] =
function (context)
	local character = context:character();
	
	if character:has_region() and character:in_settlement() and character:region():has_faction_province_slaves() then
		if character:region():percentage_faction_province_slaves() > 99 and character:region():num_faction_province_slaves() >= 300 then
			Give_Trait(character, "troy_main_trait_slaver");
		end
	end
end ]]

-----------------------------
---- AGENT ACTION TRAITS ----
-----------------------------
function Agent_Action_Traits(context)
	--if context:mission_result_critial_success() or context:mission_result_success() then
	--	local trait_key = ACTION_TO_TRAIT[ACTION_KEY_TO_ACTION[context:agent_action_key()]]
	--	if trait_key ~= nil then
	--		Give_Trait(context:character(), trait_key)
	--	end
	--end

	local is_crit_success = context:mission_result_critial_success()
	local is_success = context:mission_result_success()
	local is_fail = context:mission_result_failure()
	local is_op_fail = context:mission_result_opportune_failure()
	local is_crit_fail = context:mission_result_critial_failure()
	local action_traits_info = ACTION_TO_TRAIT[ACTION_KEY_TO_ACTION[context:agent_action_key()]]
	if action_traits_info and type(action_traits_info) == "table" then
		for _, info in ipairs(action_traits_info) do
			local rand = cm:model():random_int(1,100)
			if is_crit_success and info.crit_success_only then
				if rand <= info.rand_chance then
					Give_Trait(context:character(), info.trait_key)
				end
			elseif (is_fail or is_op_fail or is_crit_fail) and info.fail_only then
				if rand <= info.rand_chance then
					Give_Trait(context:character(), info.trait_key)	
				end
			end
		end
	end
end

core:add_listener (
	"Troy_agent_action_traits",
	"CharacterCharacterTargetAction",
	true,
	Agent_Action_Traits,
	true
)

function Agent_Action_Traits_Garrison(context)
	--if context:mission_result_critial_success() or context:mission_result_success() then
	--	local trait_key = ACTION_TO_TRAIT[ACTION_KEY_TO_ACTION[context:agent_action_key()]]
	--	if trait_key ~= nil then
	--		Give_Trait(context:character(), trait_key)
	--	end
	--end
	local is_crit_success = context:mission_result_critial_success()
	local is_success = context:mission_result_success()
	local is_fail = context:mission_result_failure()
	local is_op_fail = context:mission_result_opportune_failure()
	local is_crit_fail = context:mission_result_critial_failure()
	local action_traits_info = ACTION_TO_TRAIT[ACTION_KEY_TO_ACTION[context:agent_action_key()]]
	if action_traits_info and type(action_traits_info) == "table" then
		for _, info in ipairs(action_traits_info) do
			local rand = cm:model():random_int(1,100)
			if is_crit_success and info.crit_success_only then
				if rand <= info.rand_chance then
					Give_Trait(context:character(), info.trait_key)
				end
			elseif (is_fail or is_op_fail or is_crit_fail) and info.fail_only then
				if rand <= info.rand_chance then
					Give_Trait(context:character(), info.trait_key)	
				end
			end
		end
	end
end

core:add_listener (
	"Troy_agent_action_traits_garrison",
	"CharacterGarrisonTargetAction",
	true,
	Agent_Action_Traits_Garrison,
	true
)

-------------------------
---- Agriculturalist ----
-------------------------
--[[ function character_agriculturalist(context)
	local is_farm_building = FARM_BUILDING_CHAINS[context:building():chain()] ~= nil

	if is_farm_building then
		local builder_faction = context:building():faction()
		
		if not builder_faction:is_null_interface() and context:building():faction():character_list():num_items() > 1 then
			for i = 0, builder_faction:character_list():num_items() - 1 do
				local builder = builder_faction:character_list():item_at(i)
				local char_str = cm:char_lookup_str(builder)
				
				if builder:has_region() and cm:char_is_general_with_army(builder) and builder:region():name() == context:building():region():name() then
					cm:force_add_trait(char_str, "troy_main_trait_good_farming", true)
				end
			end
		end
	end
end ]]

core:add_listener(
	"Character_in_farm_settlement",
	"CharacterTurnStart",
	function(context)
		local character = context:character()
		return character:has_region() and character:region():settlement():production_type() == "troy_main_settlement_farm"
	end,
	function(context)
		if cm:char_is_general_with_army(context:character()) then
			Give_Trait(context:character(), "troy_main_trait_good_farming", 1 , 50)
		end
	end,
	true
);

-----------------------
---- Industrialist ----
-----------------------
--[[function character_industrialist(context)
	local is_industry_building = INDUSTRY_BUILDING_CHAINS[context:building():chain()] ~= nil

	if is_industry_building and context:building():faction():character_list():num_items() > 1 then
		for i = 0, context:building():faction():character_list():num_items() - 1 do
			local builder = context:building():faction():character_list():item_at(i)
			local char_str = cm:char_lookup_str(builder)
			
			if builder:has_region() and cm:char_is_general_with_army(builder) and builder:region():name() == context:building():region():name() then
				cm:force_add_trait(char_str, "troy_main_trait_good_industry", true)
			end
		end
	end
end]]

core:add_listener(
	"Character_in_bronze_settlement",
	"CharacterTurnStart",
	function(context)
		local character = context:character()
		return character:has_region() and character:region():settlement():production_type() == "troy_main_settlement_bronze"
	end,
	function(context)
		if cm:char_is_general_with_army(context:character()) then
			Give_Trait(context:character(), "troy_main_trait_good_industry", 1 , 50)
		end
	end,
	true
)

----------------
---- Coward ----
----------------
--[[ function character_coward(context)
	if cm:char_is_general_with_army(context:character()) then
		local char_str = cm:char_lookup_str(context:character())

		cm:force_add_trait(char_str, "troy_main_trait_bad_coward", true)
	end
end

core:add_listener(
	"character_completed_battle_coward_trait",
	"CharacterWithdrewFromBattle",
	true,
	character_coward,
	true
) ]]

------------------------------------
---- Priestess upon recruitment ----
------------------------------------
function priestess_recruited(context, char)
	if not char or char:is_null_interface() then
		return
	end	
	
	local random_trait = cm:model():random_int(1, #priestess_recruitment_traits)
	local found = false
	for _, god_trait in pairs(priestess_recruitment_traits) do
		if char:has_trait(god_trait) then
			found = true
		end
	end
	
	if not found then
		cm:add_trait_to_character_by_family_member(char:family_member():command_queue_index(), priestess_recruitment_traits[random_trait])
	end
end


core:add_listener(
	"priestess_recruited_god_trait",
	"NewCharacterEnteredRecruitmentPool",
	function(context)
		return context:character_details():character_subtype_key() == "troy_agent_priest"
	end,
	function(context)
		local char = context:character_details()
		priestess_recruited(context, char)
	end,
	true
)

core:add_listener(
	"priestess_spawned_god_trait",
	"CharacterCreated",
	function(context)
		return context:character():character_subtype_key() == "troy_agent_priest"
	end,
	function(context)
		local char = context:character()
		priestess_recruited(context, char)
	end,
	true
)

--------------------------------
---- Envoy upon recruitment ----
--------------------------------
function envoy_recruited(context, char)
	if not char or char:is_null_interface() then
		return
	end

	local applicable_traits = {}
	local is_horde = char:faction():is_allowed_to_capture_territory() == false;
	for _, trait_info in pairs(envoy_recruitment_traits) do
		if char:has_trait(trait_info.key) then
			return
		elseif not is_horde or (trait_info.horde_applicable and is_horde) then 
			table.insert(applicable_traits,trait_info.key)			
		end
	end
	
	if #applicable_traits > 0 then 
		cm:add_trait_to_character_by_family_member(char:family_member():command_queue_index(), applicable_traits[cm:model():random_int(1,#applicable_traits)])
	end
end


core:add_listener(
	"envoy_recruited_trait",
	"NewCharacterEnteredRecruitmentPool",
	function(context)
		return context:character_details():character_subtype_key() == "troy_agent_envoy"
	end,
	function(context)
		local char = context:character_details()
		envoy_recruited(context, char)
	end,
	true
)

core:add_listener(
	"envoy_spawned_trait",
	"CharacterCreated",
	function(context)
		return context:character():character_subtype_key() == "troy_agent_envoy"
	end,
	function(context)
		local char = context:character()
		envoy_recruited(context, char)
	end,
	true
)
------------------------------
---- Spy upon recruitment ----
------------------------------
function spy_recruited(context, char)
	if not char or char:is_null_interface() then
		return
	end

	local random_trait = cm:model():random_int(1, #spy_recruitment_traits)
	local found = false
	for _, trait in pairs(spy_recruitment_traits) do
		if char:has_trait(trait) then
			found = true
		end
	end
			
	if not found then
		cm:add_trait_to_character_by_family_member(char:family_member():command_queue_index(), spy_recruitment_traits[random_trait])
	end
end


core:add_listener(
	"spy_recruited_trait",
	"NewCharacterEnteredRecruitmentPool",
	function(context)
		return context:character_details():character_subtype_key() == "troy_agent_spy"
	end,
	function(context)
		local char = context:character_details()
		spy_recruited(context, char)
	end,
	true
)

core:add_listener(
	"spy_spawned_trait",
	"CharacterCreated",
	function(context)
		return context:character():character_subtype_key() == "troy_agent_spy"
	end,
	function(context)
		local char = context:character()
		spy_recruited(context, char)
	end,
	true
)

---------------------------
---- Collects resource ----
---------------------------
function character_collects_resource(context)
	local character = context:character()
	local character_region = context:character():region()
	local faction = context:character():faction()
	
	if character:has_region() and faction:is_allowed_to_capture_territory() then
		local rand_num = cm:model():random_int()
		local settlement = character_region:settlement()
		if settlement:building_list():num_items() >= 1 then
			for i = 0, settlement:building_list():num_items() - 1 do
				local sett_building = settlement:building_list():item_at(i):chain()
				local data = envoy_rank_up_buildings_to_traits[sett_building] 
				
				if data and type(data) == "table" then 
					for k,v in ipairs(data) do
						if rand_num <= v.rand_chance then
							Give_Trait(character, v.trait)
						end
					end
				end
			end
		end
	end
end

core:add_listener(
	"character_collect_resource_trait",
	"CharacterRankUp",
	function(context)
		return context:character():character_subtype_key() == "troy_agent_envoy"
	end,
	character_collects_resource,
	true
)

----------------------------------
---- Rank up in region traits ----
----------------------------------
function character_rank_up_region(context)
	local character = context:character()
	local character_type = context:character():character_subtype_key()
	local character_region = context:character():region()
	local faction = context:character():faction()
	
	if character:has_region() then
		local rand_num = cm:model():random_int()
		local rank_up_table = agent_rank_up_traits_in_region[character_type] 
		if rank_up_table and type(rank_up_table) == "table" then
			for k,v in ipairs(rank_up_table) do
				if character_region:owning_faction() == faction and v.own_region then
					if rand_num <= v.rand_chance then
						Give_Trait(character, v.trait_key)
					end
				elseif character_region:owning_faction() ~= faction and not v.own_region then
					if rand_num <= v.rand_chance then
						Give_Trait(character, v.trait_key)
					end
				end
			end
		end
	end
end

core:add_listener(
	"character_rank_up_region_trait",
	"CharacterRankUp",
	function(context)
		return context:character():character_subtype_key() == "troy_agent_priest" or context:character():character_subtype_key() == "troy_agent_spy"
	end,
	character_rank_up_region,
	true
)

---------------------------
---- Sentimental trait ----
---------------------------
function character_rank_up_sentimental(context)
	local character = context:character()
	local character_type = context:character():character_subtype_key()
	local character_region = context:character():region()
	local faction = context:character():faction()
	
	if character:has_region() and character_region:owning_faction() ~= faction and not faction:allied_with(character_region:owning_faction()) then
		Give_Trait(character, "troy_trait_loyalty_paris_sentimental", 1, 5)
	end
end

core:add_listener(
	"character_rank_up_sentimental_trait",
	"CharacterRankUp",
	function(context)
		return context:character():character_subtype_key() == "troy_agent_priest" or context:character():character_subtype_key() == "troy_agent_spy" or context:character():character_subtype_key() == "troy_agent_envoy" 
	end,
	character_rank_up_sentimental,
	true
)

--------------------------------------------------
---- Rank up in region with production traits ----
--------------------------------------------------
function character_rank_up_region_production(context)
	local character = context:character()
	local character_type = context:character():character_subtype_key()
	local character_region = context:character():region()
	local faction = context:character():faction()
	
	if character:has_region() and character_region:owning_faction() == faction then
		local production_table = agent_in_region_with_production[character_type] 
		if production_table and type(production_table) == "table" then
			for k,v in ipairs(production_table) do
				local rand_num = cm:model():random_int()
				local food = character_region:pooled_resource_income("troy_food")
				local wood = character_region:pooled_resource_income("troy_wood")
				local stone = character_region:pooled_resource_income("troy_stones")
				local bronze = character_region:pooled_resource_income("troy_bronze")
				local gold = character_region:pooled_resource_income("troy_gold")
				local total_produced = food + wood + stone + bronze + gold

				if total_produced >= v.production_needed then
					if rand_num <= v.rand_chance then
						Give_Trait(character, v.trait_key)
					end
				end
			end
		end
	end
end

core:add_listener(
	"character_rank_up_region_with_production_trait",
	"CharacterRankUp",
	function(context)
		return context:character():character_subtype_key() == "troy_agent_priest" or context:character():character_subtype_key() == "troy_agent_spy" or context:character():character_subtype_key() == "troy_agent_envoy"
	end,
	character_rank_up_region_production,
	true
)

---------------------------
---- Independent trait ----
---------------------------
function character_rank_up_region_is_empty(context)
	local character = context:character()
	local region = context:character():region()
	local faction = context:character():faction()
	if character:has_region() and character:sea_region():is_null_interface() then
		if region:characters_in_region():num_items() > 0 then
			local total_chars_in_region = region:characters_in_region():num_items()
			local char_cqi = context:character():cqi()
			for i = 0, region:characters_in_region():num_items() - 1 do 
				local char_in_region = region:characters_in_region():item_at(i)
				if char_in_region:cqi() == char_cqi or char_in_region:has_garrison_residence() then 
					total_chars_in_region = total_chars_in_region - 1
				end
			end
			if total_chars_in_region <= 0 then
				Give_Trait(character, "troy_trait_loyalty_independent", 1, 10 )
			end
		end
	end
end

core:add_listener(
	"character_rank_up_region_is_empty_trait",
	"CharacterRankUp",
	function(context)
		return context:character():character_subtype_key() == "troy_agent_priest" or context:character():character_subtype_key() == "troy_agent_spy" or context:character():character_subtype_key() == "troy_agent_envoy"
	end,
	character_rank_up_region_is_empty,
	true
)

---------------------------
---- Independent trait ----
---------------------------
function character_host_army_won(context)
	local character = context:character()
	if character:has_military_force() and character:won_battle() then 
		local characters_in_army = character:military_force():character_list()
		if characters_in_army:num_items() > 1 then
			for i = 0, characters_in_army:num_items() - 1 do
				local curr_char = characters_in_army:item_at(i)
				if curr_char:character_subtype_key() == "troy_agent_envoy" or curr_char:character_subtype_key() == "troy_agent_priest" or curr_char:character_subtype_key() == "troy_agent_spy" then 
					Give_Trait(curr_char, "troy_trait_loyalty_agamemnon_militarist", 1, 10 )
				end
			end
		end
	end
end

core:add_listener (
	"troy_character_host_army_won",
	"CharacterCompletedBattle",
	true,
	character_host_army_won,
	true
)

------------------------
---- Vengeful trait ----
------------------------
function loser_character_vengeful(context)
	local target_char = context:target_character()
	if (context:mission_result_critial_success() or context:mission_result_success()) and target_char:character_subtype_key() == "troy_agent_spy" then 
		Give_Trait(target_char, "troy_trait_loyalty_achilles_vengeful", 1, 20 )
	end
end

core:add_listener (
	"troy_loser_character_vengeful",
	"CharacterCharacterTargetAction",
	true,
	loser_character_vengeful,
	true
)

-----------------------
---- Seasick trait ----
-----------------------
function agent_seasick(context)
	local char = context:character()
	if (char:character_subtype_key() == "troy_agent_spy" or char:character_subtype_key() == "troy_agent_priest" or char:character_subtype_key() == "troy_agent_envoy") and char:region_data():is_sea() then 
		Give_Trait(char, "troy_trait_loyalty_seasick", 1, 5 )
	end
end

core:add_listener (
	"troy_agent_seasick",
	"CharacterTurnEnd",
	true,
	agent_seasick,
	true
)

----------------------
---- Torpid trait ----
----------------------
function agent_trait_lazy(context)
	local character = context:character()
	local character_type = character:character_subtype_key()
	
	if  not (character:performed_action_this_turn() or character:is_embedded_in_military_force()) then
		local agent_turns_being_lazy = Get_Lord_Record(character, "no_turn_action") or 0
		agent_turns_being_lazy = agent_turns_being_lazy + 1
		out("AGENT TURNS BEING LAZY = "..tostring(agent_turns_being_lazy))
		if agent_turns_being_lazy >= TURNS_FOR_AGENT_LAZY_TRAITS then
			Give_Trait(character, "troy_trait_loyalty_lazy", 1, 5 )
			Set_Lord_Record(character, "no_turn_action", 0)
		else
			Set_Lord_Record(character, "no_turn_action", agent_turns_being_lazy)
		end
	else
		Set_Lord_Record(character, "no_turn_action", 0)
	end
end

core:add_listener (
	"troy_agent_lazy",
	"CharacterTurnEnd",
	function(context)
		local character = context:character()
		local character_type = character:character_subtype_key()
		return  (character:has_region() or character:is_at_sea()) and (character_type == "troy_agent_spy" or character_type == "troy_agent_priest" or character_type == "troy_agent_envoy")
	end,
	agent_trait_lazy,
	true
)

-----------------------
---- Dawdler trait ----
-----------------------
function agent_trait_procastinator(context)
	local character = context:character()
	local character_type = context:character():character_subtype_key()
	
	if (character_type == "troy_agent_spy" or character_type == "troy_agent_priest" or character_type == "troy_agent_envoy") and character:action_points_remaining_percent() >= 99 then
		local agent_turns_being_procastinator = Get_Lord_Record(character, "no_agent_movement") or 0
		agent_turns_being_procastinator = agent_turns_being_procastinator + 1
		out("AGENT TURNS BEING A PROCASTINATOR = "..tostring(agent_turns_being_procastinator))
		if agent_turns_being_procastinator >= TURNS_FOR_AGENT_LAZY_TRAITS then
			Give_Trait(character, "troy_trait_loyalty_procastinator", 1, 5 )
			Set_Lord_Record(character, "no_agent_movement", 0)
		else
			Set_Lord_Record(character, "no_agent_movement", agent_turns_being_procastinator)
		end
	else 
		if character_type == "troy_agent_spy" or character_type == "troy_agent_priest" or character_type == "troy_agent_envoy" then
			Set_Lord_Record(character, "no_agent_movement", 0)
		end
	end
end

core:add_listener (
	"troy_agent_procastinator",
	"CharacterTurnEnd",
	true,
	agent_trait_procastinator,
	true
)

-----------------------------------------
---- Horde Mentor/Bloodthirsty trait ----
-----------------------------------------
function horde_agent_trait_mentor_bloodthirsty(context)
	local character = context:character()
	local faction = context:character():faction()
	if not faction:is_allowed_to_capture_territory() and character:has_military_force() and character:won_battle() then 
		local characters_in_army = character:military_force():character_list()
		if characters_in_army:num_items() > 1 then
			for i = 0, characters_in_army:num_items() - 1 do
				local curr_char = characters_in_army:item_at(i)
				if curr_char:character_subtype_key() == "troy_agent_envoy" then 
					Give_Trait(curr_char, "troy_trait_loyalty_hippolyta_mentor", 1, 10 )
				elseif curr_char:character_subtype_key() == "troy_agent_priest" then 
					Give_Trait(curr_char, "troy_trait_bloodthirsty", 1, 15 )
				end
			end
		end
	end
end

core:add_listener (
	"troy_horde_agent_trait_mentor_bloodthirsty",
	"CharacterCompletedBattle",
	true,
	horde_agent_trait_mentor_bloodthirsty,
	true
)

--------------------------------
---- Horde Honourable trait ----
--------------------------------
function horde_agent_trait_honourable(context)
	local character = context:character()
	if character:has_military_force() and character:won_battle() then 
		local characters_in_army = character:military_force():character_list()
		if characters_in_army:num_items() > 1 then
			for i = 0, characters_in_army:num_items() - 1 do
				local curr_char = characters_in_army:item_at(i)
				if curr_char:character_subtype_key() == "troy_agent_envoy" or curr_char:character_subtype_key() == "troy_agent_priest" or curr_char:character_subtype_key() == "troy_agent_spy" then 
					Give_Trait(curr_char, "troy_trait_honourable", 1, 15 )
				end
			end
		end
	end
end

core:add_listener (
	"troy_horde_agent_trait_honourable",
	"CharacterCompletedBattle",
	true,
	horde_agent_trait_honourable,
	true
)

------------------------------
---- Horde Sea Wolf trait ----
------------------------------
function horde_agent_seawolf(context)
	local char = context:character()
	local faction = context:character():faction()
	if not faction:is_allowed_to_capture_territory() and char:character_subtype_key() == "troy_agent_envoy" and char:region_data():is_sea() then 
		Give_Trait(char, "troy_trait_loyalty_odysseus_sea_wolf", 1, 10 )
	end
end

core:add_listener (
	"troy_horde_agent_seawolf",
	"CharacterTurnEnd",
	true,
	horde_agent_seawolf,
	true
)

---------------------------
---- Horde Mason trait ----
---------------------------
function horde_agent_mason(context)
	local military_force = context:building():military_force()
	local faction = context:building():faction()
	local characters_in_army = military_force:character_list()
	if not faction:is_allowed_to_capture_territory() and characters_in_army:num_items() > 1 then
		for i = 0, characters_in_army:num_items() - 1 do
			local curr_char = characters_in_army:item_at(i)
			if curr_char:character_subtype_key() == "troy_agent_envoy" then 
				Give_Trait(curr_char, "troy_trait_loyalty_mason", 1, 15 )
			end
		end
	end
end

core:add_listener (
	"troy_horde_agent_mason",
	"CharacterMilitaryForceBuildingCompleted",
	true,
	horde_agent_mason,
	true
)

---------------------------------
---- Horde Camp Leader trait ----
---------------------------------
function horde_agent_camp_leader(context)
	local military_force = context:unit():military_force()
	local faction = context:unit():faction()
	local characters_in_army = military_force:character_list()
	if not faction:is_allowed_to_capture_territory() and characters_in_army:num_items() > 1 then
		for i = 0, characters_in_army:num_items() - 1 do
			local curr_char = characters_in_army:item_at(i)
			if curr_char:character_subtype_key() == "troy_agent_envoy" then 
				Give_Trait(curr_char, "troy_trait_loyalty_camp_leader", 1, 5 )
			end
		end
	end
end

core:add_listener (
	"troy_horde_agent_camp_leader",
	"UnitTrained",
	true,
	horde_agent_camp_leader,
	true
)

----------------------------
---- Horde Greedy trait ----
----------------------------
function horde_agent_greedy(context)
	local char = context:character()
	local faction = context:character():faction()
	local mil_force = context:character():military_force()
	if not faction:is_allowed_to_capture_territory() and char:has_military_force() then
		if mil_force:active_stance() == "MILITARY_FORCE_ACTIVE_STANCE_TYPE_LAND_RAID" and mil_force:character_list():num_items() > 1 then
			for i = 0, mil_force:character_list():num_items() - 1 do
				local curr_char = mil_force:character_list():item_at(i)
				if curr_char:character_subtype_key() == "troy_agent_envoy" or curr_char:character_subtype_key() == "troy_agent_spy" or curr_char:character_subtype_key() == "troy_agent_priest" then 
					Give_Trait(curr_char, "troy_trait_greedy", 1, 15 )
				end
			end
		end
	end
end

core:add_listener (
	"troy_horde_agent_greedy",
	"CharacterTurnEnd",
	true,
	horde_agent_greedy,
	true
)

---------------------------------------------------
---- Penthesilea Immortal and Cannot Reinforce trait ----
---------------------------------------------------

core:add_listener (
	"troy_penthesilea_hero_cannot_reinforce_and_immortal",
	"NewCharacterRecruited",
	function(context)
		local char = context:character()
		local faction = char:faction()
		return char:has_military_force() and faction:name() == penthesilea_faction
	end,
	function(context)
		local char = context:character()
		Give_Trait(char, "troy_dlc1_trait_horde_cannot_reinforce_and_immortal")
		cm:set_character_immortality(cm:char_lookup_str(char), true)
		--#MILITARY_FORCE_TYPE_INTEGRATION_TODO: This should be handled by the force type. You could make an override method if you like too.
		--cm:set_horde_save_buildings(cm:char_lookup_str(char), true)
	end,
	true
)

---------------------------------------------------
---- Memnon Cannot Reinforce trait ----------------
---------------------------------------------------

core:add_listener (
	"troy_rem_memnon_hero_cannot_reinforce_and_immortal",
	"NewCharacterRecruited",
	function(context)
		local char = context:character()
		local faction = char:faction()
		return char:has_military_force() and faction:name() == pharaohs_servant.faction_key
	end,
	function(context)
		local char = context:character()
		Give_Trait(char, "troy_rem_trait_horde_cannot_reinforce_memnon")
	end,
	true
)


------------------------------------------------
---- Diomedes Strategy Camp building chain  ----
------------------------------------------------

-- function which accepts a character as it's input, which returns the correct table if the character is in a region with the correct building
function dio_strategy_camp_present(char)
	local region = char:region()
	if not region:is_null_interface() then 
		if not string.find(region:name(), "_sea_") then 
			local settlement = region:settlement()
			if settlement:building_list():num_items() >= 1 then
				for i = 0, settlement:building_list():num_items() - 1 do
					local sett_building = settlement:building_list():item_at(i):name()
					local data = strategy_camp_building_to_trait[sett_building]
					if data and type(data) == "table" then
						for k, v in ipairs(data) do
							if not v.own_faction_only then
								return data
							elseif char:faction() == region:owning_faction() then
								return data
							else
								return false
							end
						end
					end
				end
			end
		end
	end
end


core:add_listener (
	"troy_adi_diomedes_strategy_camp_building_chain_trait",
	"NewCharacterRecruited",
	function(context)
		local char = context:character()
		return char:has_military_force()
	end,
	function(context)
		local char = context:character()
		local data = dio_strategy_camp_present(char)
		if data and type(data) == "table" then
			for k, v in ipairs(data) do
				local difference =  v.points - char:trait_points(v.trait)
				if difference > 0 then 
					Give_Trait(char, v.trait, difference)
				end
			end
		end
	end,
	true
)

core:add_listener (
	"troy_adi_diomedes_strategy_camp_building_chain_trait_waiting",
	"CharacterTurnEnd",
	function(context)
		local character = context:character()
		return character:character_type_key() == "general" and character:has_region()
	end,
	function(context) 
		local character = context:character()
		local data = dio_strategy_camp_present(character)
		if data and type(data) == "table" then
			local dio_char_turns_in_region = Get_Lord_Record(character, "dio_turns_for_building_trait") or 0
			dio_char_turns_in_region = dio_char_turns_in_region + 1
			out("DIO CHAR TURNS IN REGION WITH BUILDING = "..tostring(dio_char_turns_in_region))
			
			if dio_char_turns_in_region >= DIO_STRATEGY_CAMP_TRAIT_TURNS then
				for k, v in ipairs(data) do
					local difference =  v.points - character:trait_points(v.trait)
					if difference > 0 then 
						Give_Trait(character, v.trait, difference)
					end
				end
				Set_Lord_Record(character, "dio_turns_for_building_trait", 0)
			else
				Set_Lord_Record(character, "dio_turns_for_building_trait", dio_char_turns_in_region)
			end
		else
			Set_Lord_Record(character, "dio_turns_for_building_trait", 0)
		end
	 end,
	true
)
--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------
cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("TRAIT_LORDS_RECORDS", TRAIT_LORDS_RECORDS, context)
		cm:save_named_value("has_confederated_achilles_fought", has_confederated_achilles_fought, context)
		cm:save_named_value("confederated_achilles_active_trait", confederated_achilles_active_trait, context)
	end
)

cm:add_loading_game_callback(
	function(context)
		TRAIT_LORDS_RECORDS = cm:load_named_value("TRAIT_LORDS_RECORDS", {}, context)
		has_confederated_achilles_fought = cm:load_named_value("has_confederated_achilles_fought", has_confederated_achilles_fought, context)
		confederated_achilles_active_trait = cm:load_named_value("confederated_achilles_active_trait", confederated_achilles_active_trait, context)
	end
)
