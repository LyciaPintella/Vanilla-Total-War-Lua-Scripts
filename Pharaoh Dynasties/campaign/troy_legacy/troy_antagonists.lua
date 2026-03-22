-- Configuration for the Antagonist system. Note: The Antagonist system works only in single-player campaigns!
antagonist =
{
	selection_latest_turn = 60,						 -- An antagonist is selected at this turn even if the player is not ready
	selection_second_pick_cooldown = 20,				-- After the 1st antagonist has been destroyed, wait this amount of turns, then unconditionally pick a second one.
	--diplomatic_standing_threshold = 0,				-- Only factions with lower than this standing with the player will be considered for antagonists.
	--readiness_min_imperium_level = 6,				 -- | Readiness criteria for the player's faction for an antagonist to be selected.
	--readiness_min_treasury = 22000,				   -- | These are checked in conjunction (all conditions must be met).
	--readiness_min_epic_hero_rank = 7,				 -- |
	readiness_min_regions = 40,							-- only regions condition now.
	readiness_min_turn = 50,							-- player is considered "not ready" if turn is =<70
	effect_bundle_key = "effect_bundle_antagonist_bundle",  -- The key of an effect bundle record to use for the antagonist's buffs
	latest_turn_to_reveal = 75,						 -- used to determine the latest turn the antagonist is shown to the player. Used if the Antagonist has been defeated before he's revealed to the player.
	monster_exp_per_turn = 2000,						-- extra experience for mythos monsters
	forbidden_antagonist_cultures_for_faction = {		-- By default the antagonist faction is from any other culture. You can add faction keys in this table and specify a list of forbidden cultures for their antagonist
		troy_rem_trj_thrace = {"troy_main_clt_trojans", "troy_rem_clt_hordes_aethiopians"},
		troy_rem_horde_aethiopians = {"troy_main_clt_trojans", "troy_rem_clt_thraco_phrygians"},
		troy_amazons_trj_penthesilea = {"troy_main_clt_trojans", "troy_rem_clt_hordes_aethiopians", "troy_rem_clt_thraco_phrygians"}
	},
	forbidden_antagonist_factions_for_culture = {		-- By default the antagonist faction is from any other culture. You can add culture keys in this table and specify a list of forbidden factions for their antagonist
		troy_main_clt_trojans = {
			"troy_rem_trj_thrace",
			"troy_rem_horde_aethiopians", 
			"troy_amazons_trj_penthesilea"
		},
		troy_rem_clt_hordes_aethiopians = {
			"troy_amazons_trj_penthesilea",
			"troy_rem_trj_thrace",
		},
		troy_rem_clt_thraco_phrygians = {
			"troy_rem_horde_aethiopians", 
			"troy_amazons_trj_penthesilea",
		},
	}
}


-- Definitions for the AI behaviours used in the Antagonist system.
-- Flavour texts for the Antagonist system's UI panel use the prefix "antagonist_behaviour_panel_text_" + the key of the behaviour.
-- Flavour texts for the Antagonist system's event messages use the prefix "antagonist_behaviour_event_text_" + the key of the behaviour.
antagonist.behaviours = {
	raiding = {
		ai_personality = "troy_antagonist_aggressive_raider",
		duration = 5,
		next_behaviour_weights = { outmaneuver = 5, annihilation = 2, conquest = 2, onslaught = 5, harassment = 1 },
		effects = {
			{effect_key = "troy_effect_campaign_ai_confederation_boost", 					scope_key = "faction_to_faction_own_unseen", value = 25 },
			{ effect_key = "troy_effect_army_effect_morale_mod_all_own", 					scope_key = "faction_to_force_own_factionwide", value = 30 },
			{ effect_key = "troy_effect_technology_income_from_raiding", 					scope_key = "faction_to_force_own_factionwide", value = 50 },
			{ effect_key = "troy_effect_army_armour_piercing_all_armies_inland_open_field", scope_key = "faction_to_force_own_factionwide", value = 25 },
			{ effect_key = "troy_effect_agent_envoy_fatigue_resistance_mod_stamina",		scope_key = "faction_to_force_own_factionwide", value = 70 },
			{ effect_key = "troy_effect_campaign_ai_unit_upgrading",						scope_key = "faction_to_faction_own_unseen"   , value = -50 }
		}
	},
	harassment = {
		ai_personality = "troy_antagonist_aggressive_harrasser",
		duration = 8,
		next_behaviour_weights = { development = 10, recruitment = 10, defend_and_subvert = 2 },
		effects = {
			{effect_key = "troy_effect_campaign_ai_confederation_boost", 			scope_key = "faction_to_faction_own_unseen", value = 25 },
			{ effect_key = "troy_effect_army_effect_morale_mod_all_own", 			scope_key = "faction_to_force_own_factionwide", value = 25 },
			{ effect_key = "troy_effect_army_campaign_movement_mod_armies", 		scope_key = "faction_to_force_own_factionwide", value = 25 },
			{ effect_key = "troy_effect_army_melee_attack_mod_all", 				scope_key = "faction_to_force_own_factionwide", value = 25 },
			{ effect_key = "troy_effect_army_melee_defence_mod_all", 				scope_key = "faction_to_force_own_factionwide", value = 25 },
			{ effect_key = "troy_effect_campaign_ai_unit_upgrading",				scope_key = "faction_to_faction_own_unseen"   , value = -50 }
		}
	},
	onslaught = {
		ai_personality = "troy_antagonist_aggressive_onslaught",
		duration = 6,
		next_behaviour_weights = { conquest = 2 },
		effects = {
			{effect_key = "troy_effect_campaign_ai_confederation_boost", 			scope_key = "faction_to_faction_own_unseen", value = 25 },
			{ effect_key = "troy_effect_army_effect_morale_mod_all_own", 			scope_key = "faction_to_force_own_factionwide", value = 25 },
			{ effect_key = "troy_effect_army_melee_attack_mod_all", 				scope_key = "faction_to_force_own_factionwide", value = 25 },
			{ effect_key = "troy_effect_army_melee_defence_mod_all", 				scope_key = "faction_to_force_own_factionwide", value = 25 },
			{ effect_key = "troy_effect_agent_envoy_piercing_damage", 				scope_key = "faction_to_force_own_factionwide", value = 25 },
			{ effect_key = "troy_effect_campaign_ai_unit_upgrading",				scope_key = "faction_to_faction_own_unseen"   , value = -50 }
		}
	},
	conquest = {
		ai_personality = "troy_antagonist_aggressive_conqueror",
		duration = 8,
		next_behaviour_weights = { onslaught = 2 },
		effects = {
			{effect_key = "troy_effect_campaign_ai_confederation_boost", 			scope_key = "faction_to_faction_own_unseen", value = 25 },
			{ effect_key = "troy_effect_army_effect_morale_mod_all_own", 			scope_key = "faction_to_force_own_factionwide", value = 25 },
			{ effect_key = "troy_effect_army_replenishment_rate_all", 				scope_key = "faction_to_force_own_factionwide", value = 20 },
			{ effect_key = "troy_effect_army_melee_defence_mod_all", 				scope_key = "faction_to_force_own_factionwide", value = 25 },
			{ effect_key = "troy_effect_agent_envoy_piercing_damage", 				scope_key = "faction_to_force_own_factionwide", value = 25 },
			{ effect_key = "troy_effect_campaign_ai_region_resistance_mod", 		scope_key = "faction_to_faction_own"		  , value = 25 },
			{ effect_key = "troy_effect_campaign_ai_unit_upgrading",				scope_key = "faction_to_faction_own_unseen"   , value = -50 }
		}
	},
	annihilation = {
		ai_personality = "troy_antagonist_aggressive_destroyer",
		duration = 6,
		next_behaviour_weights = { outmaneuver = 5, conquest = 2, onslaught = 2, harassment = 5, raiding = 1 },
		effects = {
			{effect_key = "troy_effect_campaign_ai_confederation_boost", 			scope_key = "faction_to_faction_own_unseen", value = 25 },
			{ effect_key = "troy_effect_army_effect_morale_mod_all_own", 			scope_key = "faction_to_force_own_factionwide", value = 25 },
			{ effect_key = "troy_effect_army_melee_attack_mod_all", 				scope_key = "faction_to_force_own_factionwide", value = 25 },
			{ effect_key = "troy_effect_army_melee_defence_mod_all",				scope_key = "faction_to_force_own_factionwide", value = 25 },
			{ effect_key = "troy_effect_agent_envoy_piercing_damage", 				scope_key = "faction_to_force_own_factionwide", value = 25 },
			{ effect_key = "troy_effect_campaign_ai_unit_upgrading",				scope_key = "faction_to_faction_own_unseen"   , value = -50 }
		}
	},
	outmaneuver = {
		ai_personality = "troy_antagonist_aggressive_outmaneuver",
		duration = 10,
		next_behaviour_weights = { annihilation = 5, conquest = 2, onslaught = 2, harassment = 5, raiding = 1 },
		effects = {
			{effect_key = "troy_effect_campaign_ai_confederation_boost", 			scope_key = "faction_to_faction_own_unseen", value = 25 },
			{ effect_key = "troy_effect_army_effect_morale_mod_all_own", 			scope_key = "faction_to_force_own_factionwide", value = 25 },
			{ effect_key = "troy_effect_army_campaign_movement_mod_armies", 		scope_key = "faction_to_force_own_factionwide", value = 25 },
			{ effect_key = "troy_effect_army_melee_attack_mod_all", 				scope_key = "faction_to_force_own_factionwide", value = 25 },
			{ effect_key = "troy_effect_army_melee_defence_mod_all", 				scope_key = "faction_to_force_own_factionwide", value = 25 },
			{ effect_key = "troy_effect_campaign_ai_unit_upgrading",				scope_key = "faction_to_faction_own_unseen"   , value = -50 }
		}
	},
	defend_and_subvert = {
		ai_personality = "troy_antagonist_aggressive_defensive_subvert",
		duration = 10,
		next_behaviour_weights = { conquest = 5, onslaught = 5 },
		effects = {
			{effect_key = "troy_effect_campaign_ai_confederation_boost", 			scope_key = "faction_to_faction_own_unseen", value = 25 },
			{ effect_key = "troy_effect_army_effect_morale_mod_all_own", 			scope_key = "faction_to_force_own_factionwide", value = 25 },
			{ effect_key = "troy_effect_agent_spy_damage_resistance_for_own_army", 	scope_key = "faction_to_force_own_factionwide", value = 10 },
			{ effect_key = "troy_effect_army_melee_attack_mod_all", 				scope_key = "faction_to_force_own_factionwide", value = 25 },
			{ effect_key = "troy_effect_army_melee_defence_mod_all", 				scope_key = "faction_to_force_own_factionwide", value = 25 },
			{ effect_key = "troy_effect_campaign_ai_unit_upgrading",				scope_key = "faction_to_faction_own_unseen"   , value = -50 }
		}
	},
	development = {
		ai_personality = "troy_antagonist_passive_developer",
		duration = 5,
		next_behaviour_weights = { conquest = 5, onslaught = 5 },
		effects = {
			{ effect_key = "troy_effect_campaign_ai_confederation_boost", 				scope_key = "faction_to_faction_own_unseen"	, value = 25 },
			{ effect_key = "troy_effect_building_cost_mod_all", 						scope_key = "faction_to_region_own"				, value = 50 },
			{ effect_key = "troy_effect_campaign_ai_mod_build_time_percentage_hidden",	scope_key = "faction_to_region_own"				, value = -50},
			{ effect_key = "troy_effect_army_replenishment_rate_all", 					scope_key = "faction_to_force_own_factionwide"	, value = 20 },
			{ effect_key = "troy_effect_economy_mod_all_resources", 					scope_key = "faction_to_faction_own"			, value = 30 },
			{ effect_key = "troy_effect_campaign_ai_unit_upgrading",				 	scope_key = "faction_to_faction_own_unseen"	 , value = -50 }
		}
	},
	diplomacy = {
		ai_personality = "troy_antagonist_passive_diplomatic",
		duration = 5,
		next_behaviour_weights = { defend_and_subvert = 8, development = 6 , recruitment = 5 },
		effects = {
			{ effect_key = "troy_effect_campaign_ai_confederation_boost", 				scope_key = "faction_to_faction_own_unseen"	, value = 25 },
			{ effect_key = "troy_effect_building_cost_mod_all", 						scope_key = "faction_to_region_own"				, value = 50 },
			{ effect_key = "troy_effect_campaign_ai_mod_build_time_percentage_hidden", 	scope_key = "faction_to_region_own"				, value = -50},
			{ effect_key = "troy_effect_army_replenishment_rate_all", 					scope_key = "faction_to_force_own_factionwide"	, value = 20 },
			{ effect_key = "troy_effect_economy_mod_all_resources", 					scope_key = "faction_to_faction_own"			, value = 30 },
			{ effect_key = "troy_effect_campaign_ai_unit_upgrading",					scope_key = "faction_to_faction_own_unseen"	 , value = -50 }
		}
	},
	recruitment = {
		ai_personality = "troy_antagonist_passive_recruiter",
		duration = 5,
		next_behaviour_weights = { conquest = 5, onslaught = 5 },
		effects = {
			{ effect_key = "troy_effect_campaign_ai_confederation_boost", 			scope_key = "faction_to_faction_own_unseen", value = 25 	},
			{ effect_key = "troy_effect_faction_unit_recruitment_points", 			scope_key = "faction_to_province_own"		  , value = 4 	},
			{ effect_key = "troy_effect_army_recruitment_cost_mod_all_army_units", 	scope_key = "faction_to_force_own_factionwide", value = -50 },
			{ effect_key = "troy_effect_army_replenishment_rate_all", 				scope_key = "faction_to_force_own_factionwide", value = 20	},
			{ effect_key = "troy_effect_army_campaign_upkeep", 						scope_key = "faction_to_force_own_factionwide", value = -50 },
			{ effect_key = "troy_effect_campaign_ai_unit_upgrading",				scope_key = "faction_to_faction_own_unseen"   , value = -50 }
		}
	},
}

antagonist.behaviours_vs_horde = {
	outmaneuver = {
		ai_personality = "troy_antagonist_aggressive_outmaneuver",
		duration = 10,
		next_behaviour_weights = { development = 5, defend_and_subvert = 3, recruitment = 8 },
		effects = {
			{ effect_key = "troy_effect_campaign_ai_confederation_boost", 			scope_key = "faction_to_faction_own_unseen", value = 25 },
			{ effect_key = "troy_effect_army_effect_morale_mod_all_own", 			scope_key = "faction_to_force_own_factionwide", value = 25 },
			{ effect_key = "troy_effect_army_campaign_movement_mod_armies", 		scope_key = "faction_to_force_own_factionwide", value = 25 },
			{ effect_key = "troy_effect_army_melee_attack_mod_all", 				scope_key = "faction_to_force_own_factionwide", value = 25 },
			{ effect_key = "troy_effect_army_melee_defence_mod_all", 				scope_key = "faction_to_force_own_factionwide", value = 25 },
			{ effect_key = "troy_effect_campaign_ai_unit_upgrading",				scope_key = "faction_to_faction_own_unseen"   , value = -50 }
		}
	},
	defend_and_subvert = {
		ai_personality = "troy_antagonist_aggressive_defensive_subvert",
		duration = 10,
		next_behaviour_weights = { recruitment = 5, development = 8 },
		effects = {
			{ effect_key = "troy_effect_campaign_ai_confederation_boost", 			scope_key = "faction_to_faction_own_unseen", value = 25 },
			{ effect_key = "troy_effect_army_effect_morale_mod_all_own", 			scope_key = "faction_to_force_own_factionwide", value = 25 },
			{ effect_key = "troy_effect_agent_spy_damage_resistance_for_own_army", 	scope_key = "faction_to_force_own_factionwide", value = 10 },
			{ effect_key = "troy_effect_army_melee_attack_mod_all", 				scope_key = "faction_to_force_own_factionwide", value = 25 },
			{ effect_key = "troy_effect_army_melee_defence_mod_all", 				scope_key = "faction_to_force_own_factionwide", value = 25 },
			{ effect_key = "troy_effect_campaign_ai_unit_upgrading",				scope_key = "faction_to_faction_own_unseen"   , value = -50 }
		}
	},
	development = {
		ai_personality = "troy_antagonist_passive_developer",
		duration = 5,
		next_behaviour_weights = { diplomacy = 5, recruitment = 7, defend_and_subvert = 3 },
		effects = {
			{ effect_key = "troy_effect_campaign_ai_confederation_boost", 				scope_key = "faction_to_faction_own_unseen"	, value = 25 },
			{ effect_key = "troy_effect_building_cost_mod_all", 						scope_key = "faction_to_region_own"				, value = 50 },
			{ effect_key = "troy_effect_campaign_ai_mod_build_time_percentage_hidden",	scope_key = "faction_to_region_own"				, value = -50},
			{ effect_key = "troy_effect_army_replenishment_rate_all", 					scope_key = "faction_to_force_own_factionwide"	, value = 20 },
			{ effect_key = "troy_effect_economy_mod_all_resources", 					scope_key = "faction_to_faction_own"			, value = 30 },
			{ effect_key = "troy_effect_campaign_ai_unit_upgrading",				 	scope_key = "faction_to_faction_own_unseen"	 , value = -50 }
		}
	},
	diplomacy = {
		ai_personality = "troy_antagonist_passive_diplomatic",
		duration = 5,
		next_behaviour_weights = { development = 8, defend_and_subvert = 3, outmaneuver = 2 },
		effects = {
			{ effect_key = "troy_effect_campaign_ai_confederation_boost", 				scope_key = "faction_to_faction_own_unseen"	, value = 25 },
			{ effect_key = "troy_effect_building_cost_mod_all", 						scope_key = "faction_to_region_own"				, value = 50 },
			{ effect_key = "troy_effect_campaign_ai_mod_build_time_percentage_hidden", 	scope_key = "faction_to_region_own"				, value = -50},
			{ effect_key = "troy_effect_army_replenishment_rate_all", 					scope_key = "faction_to_force_own_factionwide"	, value = 20 },
			{ effect_key = "troy_effect_economy_mod_all_resources", 					scope_key = "faction_to_faction_own"			, value = 30 },
			{ effect_key = "troy_effect_campaign_ai_unit_upgrading",					scope_key = "faction_to_faction_own_unseen"	 , value = -50 }
		}
	},
	recruitment = {
		ai_personality = "troy_antagonist_passive_recruiter",
		duration = 5,
		next_behaviour_weights = { diplomacy = 3, development = 5 },
		effects = {
			{ effect_key = "troy_effect_campaign_ai_confederation_boost", 			scope_key = "faction_to_faction_own_unseen", value = 25 	},
			{ effect_key = "troy_effect_faction_unit_recruitment_points", 			scope_key = "faction_to_province_own"		  , value = 4 	},
			{ effect_key = "troy_effect_army_recruitment_cost_mod_all_army_units", 	scope_key = "faction_to_force_own_factionwide", value = -50 },
			{ effect_key = "troy_effect_army_replenishment_rate_all", 				scope_key = "faction_to_force_own_factionwide", value = 20	},
			{ effect_key = "troy_effect_army_campaign_upkeep", 						scope_key = "faction_to_force_own_factionwide", value = -50 },
			{ effect_key = "troy_effect_campaign_ai_unit_upgrading",				scope_key = "faction_to_faction_own_unseen"   , value = -50 }
		}
	},
}


-- Run-time variables used to track the state of the Antagonist system
antagonist.queue = ""				   -- Current queue of potential antagonists
antagonist.current = ""				 -- The currently active antagonist action
antagonist.previous = ""				-- The previous antagonist faction; set when the first one is destroyed
antagonist.turns_to_second_pick = -1	-- Used to track a cooldown before selecting a second antagonist
antagonist.current_behaviour_key = ""   -- Key in the antagonoist_behaviours table
antagonist.current_behaviour_start = 0  -- Turn number when the current behaviour was activated
antagonist.revealed_to_player = false 	-- Have we revealed to the player who his antagonist is
antagonist.panel_auto_opened = false 	-- Have we opened the Antagonist panel automatically already
antagonist.turn_picked = 0				-- On what turn was the antagonist picked
antagonist.mythic_monster = ""			-- The mythic monster that the antagonist received. It becomes blocked for the player. Only applicable to the mythic campaign.
antagonist.initializing = false		 -- If we're currently initializing the antagonist from a save game


function antagonist.is_player_faction_ready()
	local player_faction_key = cm:get_local_faction_name()
	local player_faction = cm:model():world():faction_by_key(player_faction_key)
	--local imperium_level = player_faction:imperium_level()
	--local wealth = player_faction:treasury()
	--local hero_rank = player_faction:has_faction_leader() and player_faction:faction_leader():rank() or 0
	local num_regions = player_faction:num_regions()
	local turn_num = cm:model():turn_number()

	if 	--imperium_level > antagonist.readiness_min_imperium_level and
		--wealth > antagonist.readiness_min_treasury and
		--hero_rank > antagonist.readiness_min_epic_hero_rank 
		num_regions >= antagonist.readiness_min_regions and
		turn_num >= antagonist.readiness_min_turn
	then
		return true
	end

	return false
end

function antagonist.is_antagonist_current_valid()
	if antagonist.current ~= "" then
		local antagonist_faction = cm:model():world():faction_by_key(antagonist.current)
		if not antagonist_faction:is_null_interface() and not antagonist_faction:is_dead() then
			if antagonist_faction:has_faction_leader() then
				return true
			end
		end
		return false
	end
	return true
end

function antagonist.should_pick_antagonist()
	if antagonist.current ~= "" then
		-- If there is an acting antagonist at this time, no need to pick a new one
		return false
	elseif antagonist.previous ~= "" then 
		-- If the first antagonist has been destroyed, wait for the cooldown before creating the second one. No readiness check, the player should be strong enough at this time.
		return antagonist.turns_to_second_pick == 0
	else
		-- First antagonist: if the turn threshold is exceeded, an antagonist has to be selected regardless of player faction's readiness, o.w. check for readiness.
		return cm:turn_number() >= antagonist.selection_latest_turn or antagonist.is_player_faction_ready()
	end
end


function antagonist.update_queue()
	local player_faction_key = cm:get_local_faction_name()
	local player_faction = cm:model():world():faction_by_key(player_faction_key)
	local player_culture = player_faction:culture()
	local faction_list = cm:model():world():faction_list();
	local matching_major_factions_list = {}
	local matching_minor_factions_list = {}

	antagonist.queue = ""

	-- Scan the current faction list to find potential antagonists
	-- out("[Antagonist system] Forming queue:")
	--[[ for i = 0, faction_list:num_items() - 1 do
		local faction = faction_list:item_at(i)
		local faction_key = faction:name()

		if  not (faction:is_rebel() or faction:is_horde() or faction:is_vassal() or faction:is_subject() or faction:is_dead() or faction:is_human())
			and faction:diplomatic_standing_with(player_faction) <= antagonist.diplomatic_standing_threshold
		then
			local faction_entry = {
				faction_key = faction_key,
				strength = faction:strength(),
				has_opposite_culture = faction:culture() ~= player_culture,
				is_major = faction:is_major()
			}
			table.insert(new_queue, faction_entry)
			-- out("	Added faction " .. faction_key .. ", CUL = " .. faction:culture() .. ", STR =  " .. tostring(faction:strength()))
		end
	end

	-- Criteria priority: 1. having culture opposite to the player; 2. being a major faction; 2. faction strength
	table.sort(
		new_queue,
		function(a, b)
			if a.has_opposite_culture ~= b.has_opposite_culture then return b.has_opposite_culture end
			if b.is_major ~= b.is_major then return b.is_major end
			return a.strength < b.strength
		end
	)

	antagonist.queue = new_queue
	]]
	-- Updated logic : Populate lists of potential Antagonists
	for i = 0, faction_list:num_items() - 1 do 
		local curr_faction = faction_list:item_at(i)
		if not (curr_faction:is_rebel() or (curr_faction:is_allowed_to_capture_territory() == false) or curr_faction:is_vassal() or curr_faction:is_subject() or curr_faction:is_dead() or curr_faction:is_human() or curr_faction:is_quest_battle_faction() or antagonist.previous == curr_faction:name()) then
			if curr_faction:is_major() and not player_faction:allied_with(curr_faction) then
				local faction_entry = {
					faction_key = curr_faction:name(),
					strength = curr_faction:strength(),
					is_of_preferred_culture = antagonist.is_of_preferred_culture(curr_faction),
				}
				table.insert(matching_major_factions_list, faction_entry)
			elseif not player_faction:allied_with(curr_faction) then
				local faction_entry = {
					faction_key = curr_faction:name(),
					strength = curr_faction:strength(),
					is_of_preferred_culture = antagonist.is_of_preferred_culture(curr_faction),
				}
				table.insert(matching_minor_factions_list, faction_entry)
			end
		end
	end

	if #matching_major_factions_list ~= 0 then
		table.sort(
			matching_major_factions_list,
			function(a,b)
				return a.strength > b.strength
			end
		)
		for _, data in ipairs(matching_major_factions_list) do
			if data.is_of_preferred_culture then
				antagonist.queue = data.faction_key
				return
			end
		end

		antagonist.queue = matching_major_factions_list[1].faction_key
		return
	elseif #matching_minor_factions_list ~= 0 then
		table.sort(
			matching_minor_factions_list,
			function(a,b)
				return a.strength > b.strength
			end
		)

		antagonist.queue = matching_minor_factions_list[1].faction_key
		return
	else
		script_error("ERROR: antagonist.update_queue() called but both lists of candidates are empty!")
	end

end


function antagonist.is_of_preferred_culture(antagonist_faction)
	local player_faction_key = cm:get_local_faction_name()
	local player_faction = cm:model():world():faction_by_key(player_faction_key)
	local player_culture = player_faction:culture()

	-- checking if Ajax is on the Trojan side, if so give him an antagonist from his culture.
	if player_faction_key == troy_adi_ajax_renown_export_data.defs.faction_key and troy_adi_ajax_renown_export_data.progress.with_trojans then 
		return antagonist_faction:culture() == player_culture and 
			not table_contains(antagonist.forbidden_antagonist_cultures_for_faction[player_faction_key] or {}, antagonist_faction:culture()) and
			not table_contains(antagonist.forbidden_antagonist_factions_for_culture[player_culture] or {}, antagonist_faction:name())
	else
		return antagonist_faction:culture() ~= player_culture and 
			not table_contains(antagonist.forbidden_antagonist_cultures_for_faction[player_faction_key] or {}, antagonist_faction:culture()) and
			not table_contains(antagonist.forbidden_antagonist_factions_for_culture[player_culture] or {}, antagonist_faction:name())
	end
end

function antagonist.pick_antagonist()
	-- Currently, just form a queue and select the best option from it
	antagonist.update_queue()

	if antagonist.queue == "" then
		out("[Antagonist system] Could not find any suitable candidates for the antagonist.")
		return
	end

	antagonist.current = antagonist.queue--antagonist.queue[#antagonist.queue].faction_key
	if antagonist.turns_to_second_pick == 0 then
		antagonist.turns_to_second_pick = -1
	end

	out("[Antagonist system] Picked the antagonist faction: " .. antagonist.current)

	-- Pick an entirely random starting behaviour
	--[[ local behaviour_keys = {}
	for k, _ in pairs(antagonist.behaviours) do table.insert(behaviour_keys, k) end ]]

	local turn_number = cm:turn_number()

	-- Make sure we note down when we picked
	antagonist.turn_picked = turn_number
	antagonist.setup_antagonist()
end

function antagonist.setup_antagonist()
	-- Make all AI factions of the antagonist's culture improve their strategic stance towards the antagonist
	local antagonist_faction = cm:model():world():faction_by_key(antagonist.current)
	local antagonist_culture = antagonist_faction:culture() 
	local player_faction_key = cm:get_local_faction_name()
	local faction_list = cm:model():world():faction_list();

	-- Make it impossible for the player to make the antagonist like them
	cm:cai_strategic_stance_manager_promote_specified_stance_towards_target_faction(antagonist.current, player_faction_key, "CAI_STRATEGIC_STANCE_BITTER_ENEMIES")

	-- Prevent the antagonist faction from being confederated (it can confederate other factions)
	cm:force_diplomacy("all", "faction:"..antagonist.current, "form confederation", false, true, false)

	for i = 0, faction_list:num_items() - 1 do
		local faction = faction_list:item_at(i)
		local faction_key = faction:name()

		if faction:culture() == antagonist_culture and faction_key ~= player_faction_key and faction_key ~= antagonist.current then
			--cm:cai_strategic_stance_manager_promote_specified_stance_towards_target_faction(faction_key, antagonist.current, "CAI_STRATEGIC_STANCE_BEST_FRIENDS")
			--[[ cm:cai_strategic_stance_manager_set_stance_promotion_between_factions_for_a_given_stance(
				faction_key,
				antagonist.current,
				"CAI_STRATEGIC_STANCE_BEST_FRIENDS",
				turn_number,
				100,
				turn_number + 5,
				100
			) ]]

			cm:cai_strategic_stance_manager_promote_specified_stance_towards_target_faction(
				faction_key, 
				antagonist.current, 
				"CAI_STRATEGIC_STANCE_BEST_FRIENDS"
			)

			--[[ cm:cai_strategic_stance_manager_set_stance_promotion_between_factions_for_a_given_stance(
				antagonist.current,
				faction_key,
				"CAI_STRATEGIC_STANCE_BEST_FRIENDS",
				turn_number,
				100,
				turn_number + 5,
				100
			) ]]
			cm:cai_strategic_stance_manager_promote_specified_stance_towards_target_faction(
				antagonist.current,
				faction_key,
				"CAI_STRATEGIC_STANCE_BEST_FRIENDS"
			)

			cm:cai_strategic_stance_manager_force_stance_update_between_factions(
				"yes",
				antagonist.current,
				faction_key
			)
			cm:cai_strategic_stance_manager_force_stance_update_between_factions(
				"yes",
				faction_key,
				antagonist.current				
			)
		end
	end

	--[[ cm:show_message_event(
		player_faction_key,
		"event_feed_strings_text_troy_scripted_event_antagonist_picked_title",
		"factions_screen_name_" .. antagonist.current,
		"campaign_localised_strings_string_" .. antagonist.flavour_text_key(),
		true,
		1051) ]]

	--antagonist.setup_behaviour(behaviour_keys[cm:model():random_int(1, #behaviour_keys)])
	if antagonist.current_behaviour_key ~= "" then
		antagonist.setup_behaviour(antagonist.current_behaviour_key) 
	else
		if cm:get_faction(player_faction_key):is_allowed_to_capture_territory() then
			antagonist.setup_behaviour("harassment")
		else
			antagonist.setup_behaviour("outmaneuver")
		end
	end
	-- Enable opening the Antagonist panel in the campaign UI
	--antagonist.update_button()
end

function antagonist.get_antagonist_behaviour_table()
	local player_faction_key = cm:get_local_faction_name()
	local player_faction = cm:model():world():faction_by_key(player_faction_key)
	if not player_faction:is_allowed_to_capture_territory() then
		-- Check if we're on an old save and return the old table if we're on a behaviour that we don't have in the new setup.
		if antagonist.current_behaviour_key ~= "" and not antagonist.behaviours_vs_horde[antagonist.current_behaviour_key] then
			return antagonist.behaviours
		end
		return antagonist.behaviours_vs_horde
	end
	return antagonist.behaviours
end

function antagonist.should_pick_next_behaviour()
	if antagonist.current == "" then return false end
	local behaviours_table = antagonist.get_antagonist_behaviour_table()
	return cm:turn_number() - antagonist.current_behaviour_start >= behaviours_table[antagonist.current_behaviour_key].duration
end


function antagonist.pick_next_behaviour()
	local player_faction_key = cm:get_local_faction_name()
	local player_faction = cm:model():world():faction_by_key(player_faction_key)

	if not antagonist.revealed_to_player then
		if player_faction:is_allowed_to_capture_territory() then
			antagonist.setup_behaviour("harassment")
		else
			antagonist.setup_behaviour("outmaneuver")
		end
	end
	local behaviours_table = antagonist.get_antagonist_behaviour_table()
	local weights_table = behaviours_table[antagonist.current_behaviour_key].next_behaviour_weights
	local total_weight = 0
	for k, v in pairs(weights_table) do total_weight = total_weight + v end
	
	local choice = cm:model():random_int(1, total_weight)
	local behaviour_key = ""
	for k, v in pairs(weights_table) do
		if choice <= v then
			antagonist.setup_behaviour(k)
			return
		else
			choice = choice - v
		end
	end
end


function antagonist.setup_behaviour(behaviour_key)
	local antagonist_faction = cm:model():world():faction_by_key(antagonist.current)

	antagonist.current_behaviour_key = behaviour_key
	antagonist.current_behaviour_start = cm:turn_number()

	out("[Antagonist system] Setting up behaviour: " .. behaviour_key)
	-- Select and set the correct AI personality key according to the difficulty setting
	local behaviours_table = antagonist.get_antagonist_behaviour_table()
	local behaviour_data = behaviours_table[behaviour_key]
	local ai_personality = behaviour_data.ai_personality
	local difficulty = cm:get_difficulty(false)
	if difficulty == 1 then
		ai_personality = ai_personality .. "_easy"
	elseif difficulty >= 4 then
		ai_personality = ai_personality .. "_hard"
	end

	out("[Antagonist system] Selected AI personality: " .. ai_personality)
	cm:force_change_cai_faction_personality(antagonist.current, ai_personality)

	-- Create a custom effect bundle to accompany the selected personality
	local antagonist_bundle = cm:create_new_custom_effect_bundle(antagonist.effect_bundle_key)

	for _, v in ipairs(behaviour_data.effects) do
		antagonist_bundle:add_effect(v.effect_key, v.scope_key, v.value)
	end

	cm:apply_custom_effect_bundle_to_faction(antagonist_bundle, antagonist_faction)
	out("[Antagonist system] Successfuly switched antagonist behaviour.")

	if antagonist.revealed_to_player and not antagonist.initializing then
		cm:show_message_event(
			cm:get_local_faction_name(),
			"event_feed_strings_text_troy_scripted_event_antagonist_changed_plans_title",
			"factions_screen_name_" .. antagonist.current,
			"campaign_localised_strings_string_antagonist_behaviour_event_text_" .. antagonist.current_behaviour_key,
			true,
			1049
		)
	end
end


function antagonist.flavour_text_key()
	local player_faction_key = cm:get_local_faction_name()
	local player_faction = cm:model():world():faction_by_key(player_faction_key)
	local player_culture = player_faction:culture()
	local antagonist_faction = cm:model():world():faction_by_key(antagonist.current)
	if not is_faction(antagonist_faction) then
		script_error("ERROR: antagonist.flavour_text_key(), but a faction interface for curret Antagonist " ..tostring(antagonist.current) .. "could not be fetched from the world!")
		return
	end
	local antagonist_culture = antagonist_faction:culture()
	local key = ""

	-- Select a flavour text for the reasoning of the antagonist
	if	 antagonist.current == "troy_main_dan_achilles" and player_faction_key == "troy_main_trj_hector" then key = "achilles_hector"
	elseif antagonist.current == "troy_main_dan_achilles" then key = "achilles_generic"
	elseif antagonist.current == "troy_main_dan_mycenae" then key = "agamemnon_generic"
	elseif antagonist.current == "troy_main_dan_sparta" and player_faction_key == "troy_main_trj_paris" then key = "menelaus_paris"
	elseif antagonist.current == "troy_main_dan_sparta" then key = "menelaus_generic"
	elseif antagonist.current == "troy_main_dan_ithaca" then key = "odysseus_generic"
	elseif antagonist.current == "troy_main_dan_salamis" and player_faction_key == "troy_main_trj_hector" then key = "ajax_hector"	
	elseif antagonist.current == "troy_main_dan_salamis" then key = "ajax_generic"
	elseif antagonist.current == "troy_main_dan_argos" and player_faction_key == "troy_main_trj_dardania" then key = "diomedes_aeneas"	
	elseif antagonist.current == "troy_main_dan_argos" then key = "diomedes_generic"
	elseif antagonist.current == "troy_main_trj_dardania" and player_faction_key == "troy_main_dan_argos" then key = "aeneas_diomedes"	
	elseif antagonist.current == "troy_main_trj_dardania" then key = "aeneas_generic"
	elseif antagonist.current == "troy_main_trj_hector" and player_faction_key == "troy_main_dan_achilles" then key = "hector_achilles"
	elseif antagonist.current == "troy_main_trj_hector" and player_faction_key == "troy_main_dan_salamis" then key = "hector_ajax"	
	elseif antagonist.current == "troy_main_trj_hector" then key = "hector_generic"
	elseif antagonist.current == "troy_main_trj_paris" and player_faction_key == "troy_main_dan_sparta" then key = "paris_menelaus"
	elseif antagonist.current == "troy_main_trj_paris" then key = "paris_generic"
	elseif antagonist.current == "troy_main_trj_lycia" then key = "sarpedon_generic"
	elseif antagonist.current == "troy_amazons_trj_hippolyta" then key = "hippolyta_generic"
	elseif antagonist.current == "troy_rem_trj_thrace" then key = "rhesus_generic"	
	elseif antagonist_culture == "troy_main_clt_danaans" then key = "achaean_generic"
	elseif antagonist_culture == "troy_main_clt_trojans" then key = "trojan_generic"
	elseif antagonist_culture == "troy_rem_clt_thraco_phrygians" then key = "trojan_generic"
	end

	return "antagonist_reason_" .. key
end


function antagonist.update_button()
	if not antagonist.revealed_to_player then
		return
	end
	local ui_root = core:get_ui_root()
	local antagonist_container = find_uicomponent(ui_root, "hud_campaign", "faction_widget_holder", "faction_widget", "main_buttons", "main_buttons_container", "antagonist_container")
	if not antagonist_container then return end

	local container_visible = antagonist.current ~= "" and antagonist.is_antagonist_current_valid()
	antagonist_container:SetVisible(container_visible)
	if not container_visible then return end

	local strat_hud_layout = find_uicomponent(ui_root, "hud_campaign")
	if strat_hud_layout then
		-- force layout to determine new position of resources and administration containers since antagonist button may end up overlapping resources
		strat_hud_layout:InterfaceFunction("LuaAdjustFactionWidgetContainersPosition")
	end

	if antagonist.revealed_to_player and antagonist.current ~= "" then
		local antagonist_button_actual = find_uicomponent(core:get_ui_root(), "hud_campaign","main_buttons","main_buttons_container","antagonist_container","button_antagonist")
		antagonist_button_actual:SetProperty("antagonist_shown", "shown")
	end
	if not antagonist.panel_auto_opened and antagonist.current ~= "" and antagonist.revealed_to_player then
		cm:callback(
			function()
				local antagonist_panel = find_uicomponent(core:get_ui_root(), "end_game_escalation")
				if not antagonist_panel or (is_uicomponent(antagonist_panel) and not antagonist_panel:Visible()) then
					local antagonist_button_actual = find_uicomponent(core:get_ui_root(), "hud_campaign","main_buttons","main_buttons_container","antagonist_container","button_antagonist")
					antagonist_button_actual:SimulateLClick()
					antagonist.panel_auto_opened = true

					if antagonist.revealed_to_player then
						antagonist_button_actual:SetProperty("antagonist_shown", "shown")
					end
				end
			end,
			0.5
		)
	end
end

function antagonist.reveal_to_player()
	cm:show_message_event(
		cm:get_local_faction_name(),
		"event_feed_strings_text_troy_scripted_event_antagonist_picked_title",
		"factions_screen_name_" .. antagonist.current,
		"campaign_localised_strings_string_" .. antagonist.flavour_text_key(),
		true,
		1051
	)
	antagonist.revealed_to_player = true
	cm:force_diplomacy(
		"faction:"..antagonist.current,
		"faction:"..cm:get_local_faction_name(),
		"all",
		false,
		false,
		true,
		true
	)
	if cm:get_campaign_name() == "troy_mythic" then
		antagonist.unlock_mythic_monster()
	end
	antagonist.update_button()
end

function antagonist.unlock_mythic_monster()
	-- Choose a monster only for the first antagonist. Subsequent antagonists receive the same monster.
	if antagonist.previous == "" and antagonist.mythic_monster == "" then
		-- Choose a monster for the antagonist at random, excluding the currently unlocked or selected monster by the player.
		local local_faction_key = cm:get_local_faction_name()
		local selected_monster_id = mythic_monsters_common:monster_key_to_id(mythic_monsters_expeditions.get_selected_monster(local_faction_key))
		local monster_ids = {}
		for _, monster in ipairs(mythic_monsters_common.monsters) do
			if not mythic_monsters_common:is_monster_unlocked(monster.config.id, local_faction_key) and (monster.config.id ~= selected_monster_id) then
				table.insert(monster_ids, monster.config.id)
			end
		end

		if #monster_ids >= 1 then
			monster_ids = cm:random_sort(monster_ids)
			antagonist.mythic_monster = monster_ids[1]
		end
	end

	if antagonist.mythic_monster ~= "" then
		for _, monster in ipairs(mythic_monsters_common.monsters) do
			if antagonist.mythic_monster == monster.config.id then
				mythic_monsters_common:unlock_monster(monster.config.id, antagonist.current)

				local antagonist_faction = cm:get_faction(antagonist.current)
				for _, unit_data in ipairs(monster.config.unlockable_units) do
					if unit_data.antagonist then
						cm:add_unit_to_faction_mercenary_pool(antagonist_faction, unit_data.key, unit_data.antagonist.initial_count, unit_data.antagonist.replenish_chance_perc, 100, 1, 0, "", "", "")
					end
				end
				break
			end
		end
	end
end

core:add_listener(
	"antagonist_reveal",
	"FactionTurnStart",
	function(context)
		return antagonist.current ~= "" and not antagonist.revealed_to_player and not cm:is_multiplayer() and context:faction():name() == cm:get_local_faction_name()
	end,
	function(context)
		local player_faction = context:faction()
		local antagonist_faction = cm:get_faction(antagonist.current)
		local player_strenth = player_faction:strength()
		local antagonist_strength = antagonist_faction:strength()
		local current_turn = cm:model():turn_number()
		local are_at_war = player_faction:at_war_with(antagonist_faction)

		if antagonist_strength/player_strenth > 0.8 and are_at_war then
			antagonist.reveal_to_player()
			return
		end

		if (current_turn >= antagonist.turn_picked + 15) or (current_turn >= antagonist.latest_turn_to_reveal) then
			if not are_at_war then
				cm:force_declare_war(antagonist.current, player_faction:name() , true , true, true)
			end
			antagonist.reveal_to_player()
			return	
		end
	end,
	true
)


core:add_listener(
	"FactionTurnStart_antagonist_system",
	"FactionTurnStart",
	function(context) return not cm:is_multiplayer() and context:faction():name() == cm:get_local_faction_name() end,
	function(context)

		-- let's check if this antagonist is valid
		if not antagonist.is_antagonist_current_valid() then
			antagonist.previous = antagonist.current
			antagonist.turn_picked = 0
			antagonist.current = ""
			antagonist.update_button()
			antagonist.revealed_to_player = false
			if antagonist.turns_to_second_pick < 0 then
				antagonist.turns_to_second_pick = 0
			end
		end

		-- Update the Antagonist system: pick an antagonist, switch behaviour of the current antagonist, or advance a cooldown timer to the next choice of antagonist
		if antagonist.should_pick_antagonist() then
			antagonist.pick_antagonist()
		elseif antagonist.should_pick_next_behaviour()  then
			antagonist.pick_next_behaviour()
		else
			if antagonist.previous ~= "" and antagonist.turns_to_second_pick > 0 then
				antagonist.turns_to_second_pick = antagonist.turns_to_second_pick - 1
			end
		end
	end,
	true
)


core:add_listener(
	"FactionDestroyed_antagonist_system",
	"FactionDestroyed",
	function(context)
		return context:faction():name() == antagonist.current
	end,
	function(context)
		antagonist.update_button()
		
		-- The player has destroyed the antagonist faction
		if antagonist.revealed_to_player == true then
			cm:show_message_event(
				cm:get_local_faction_name(),
				"event_feed_strings_text_troy_scripted_event_antagonist_destroyed_title",
				"factions_screen_name_" .. antagonist.current,
				"event_feed_strings_text_troy_scripted_event_antagonist_destroyed_description",
				true,
				1050)
		
			core:trigger_event("ScriptEventFactionDefeatsAntagonist",cm:model():world():faction_by_key(cm:get_local_faction_name()))
			if antagonist.previous == "" then
				-- This was the first antagonist in this campaign; start the countdown to selecting the second one
				antagonist.turns_to_second_pick = antagonist.selection_second_pick_cooldown
			end
		else
			antagonist.turns_to_second_pick = 0
		end
		antagonist.previous = antagonist.current
		antagonist.turn_picked = 0
		antagonist.current = ""
		antagonist.update_button()
		antagonist.revealed_to_player = false

		if antagonist.should_pick_antagonist() then 
			antagonist.pick_antagonist()
		end
	end,
	true
)


core:add_listener(
	"FirstTickAfterWorldCreated_antagonist_system",
	"FirstTickAfterWorldCreated",
	true,
	function(context)
		antagonist.update_button()
	end
)


core:add_listener(
	"PanelOpenedCampaign_antagonist_system",
	"PanelOpenedCampaign",
	function(context) return context.string == "end_game_escalation" end,
	function()
		local panel = find_uicomponent(core:get_ui_root(), "end_game_escalation")
		if panel and panel:Visible() then
			panel:InterfaceFunction("set_antagonist_faction_details", antagonist.current, antagonist.flavour_text_key(), "antagonist_behaviour_panel_text_" .. antagonist.current_behaviour_key)
		end
	end,
	true
)


core:add_listener(
	"PanelOpenedCampaign_antagonist_system_treasury_open",
	"PanelOpenedCampaign",
	function(context) return context.string == "treasury_panel" end,
	function()
		 core:add_listener(
			"troy_antagonist_clicked_expired_barters",
			"ComponentLClickUp",
			true,
			function(context)
				local uic = UIComponent(context.component);
				local click_id = uic:Id();
				if click_id ~= "button_history" then
					return
				end
				local root_panel = core:get_ui_root():SequentialFind("treasury_panel")
				local list = root_panel:SequentialFind("container_recently_expired", "list_box")
				if not root_panel or not list then
					return
				end
				for i = 0, list:ChildCount() - 1 do
					local uic_child = UIComponent(list:Find(i))
					if not uic_child then
						return
					end
					if uic_child:Id() == antagonist.current then
						local button = uic_child:SequentialFind("renew_agreement_button");
						if not button then
							return
						end
						button:SetVisible(false)
					end

				end
			end,
			true
		)
	end,
	true
)

core:add_listener(
	"PanelOpenedCampaign_antagonist_system_treasury_close",
	"PanelClosedCampaign",
	function(context) return context.string == "treasury_panel" end,
	function()
		core:remove_listener("troy_antagonist_clicked_expired_barters")
	end,
	true
)

core:add_listener(
	"FactionTurnStart_Antagonist_monster_exp",
	"FactionTurnStart",
	function(context)
		return context:faction():name() == antagonist.current and cm:get_campaign_name() == "troy_mythic" 
	end,
	function(context)
		local char_list = context:faction():character_list()
		for i = 0, char_list:num_items() - 1 do 
			local curr_char = char_list:item_at(i)
			if curr_char:character_type("wizard") then
				cm:add_agent_experience(cm:char_lookup_str(curr_char:command_queue_index()),antagonist.monster_exp_per_turn)
			end
		end
	end,
	true
)

--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------

cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("ANTAGONIST_CURRENT", antagonist.current, context)
		cm:save_named_value("ANTAGONIST_PREVIOUS", antagonist.previous, context)
		cm:save_named_value("ANTAGONIST_TURNS_TO_SECOND_PICK", antagonist.turns_to_second_pick, context)
		cm:save_named_value("ANTAGONIST_CURRENT_BEHAVIOUR_KEY", antagonist.current_behaviour_key, context)
		cm:save_named_value("ANTAGONIST_CURRENT_BEHAVIOUR_START", antagonist.current_behaviour_start, context)
		cm:save_named_value("ANTAGONIST_REVEALED_TO_PLAYER_BOOL", antagonist.revealed_to_player, context)
		cm:save_named_value("ANTAGONIST_TURN_PICKED", antagonist.turn_picked, context)
		cm:save_named_value("ANTAGONIST_MYTHIC_MONSTER", antagonist.mythic_monster, context)
		cm:save_named_value("ANTAGONIST_AUTO_OPEN", antagonist.panel_auto_opened, context)
	end
)

cm:add_loading_game_callback(
	function(context)
		antagonist.current = cm:load_named_value("ANTAGONIST_CURRENT", antagonist.current, context)
		antagonist.previous = cm:load_named_value("ANTAGONIST_PREVIOUS", antagonist.previous, context)
		antagonist.turns_to_second_pick = cm:load_named_value("ANTAGONIST_TURNS_TO_SECOND_PICK", antagonist.turns_to_second_pick, context)
		antagonist.current_behaviour_key = cm:load_named_value("ANTAGONIST_CURRENT_BEHAVIOUR_KEY", antagonist.current_behaviour_key, context)
		antagonist.current_behaviour_start = cm:load_named_value("ANTAGONIST_CURRENT_BEHAVIOUR_START", antagonist.current_behaviour_start, context)
		antagonist.revealed_to_player = cm:load_named_value("ANTAGONIST_REVEALED_TO_PLAYER_BOOL", antagonist.revealed_to_player, context)
		antagonist.turn_picked = cm:load_named_value("ANTAGONIST_TURN_PICKED", antagonist.turn_picked, context)
		antagonist.mythic_monster = cm:load_named_value("ANTAGONIST_MYTHIC_MONSTER", antagonist.mythic_monster, context)
		antagonist.panel_auto_opened = cm:load_named_value("ANTAGONIST_AUTO_OPEN", antagonist.panel_auto_opened, context)
	end
)

cm:add_first_tick_callback(
	function()
		if antagonist.current ~= "" then
			if not antagonist.is_antagonist_current_valid() then
				antagonist.previous = antagonist.current
				antagonist.turn_picked = 0
				antagonist.current = ""
				antagonist.update_button()
				antagonist.revealed_to_player = false
				if antagonist.turns_to_second_pick < 0 then
					antagonist.turns_to_second_pick = 0
				end
				if antagonist.should_pick_antagonist() then
					antagonist.pick_antagonist()
				end
			else
				antagonist.initializing = true
				antagonist.setup_antagonist()
				antagonist.initializing = false
			end
		end
	end
)