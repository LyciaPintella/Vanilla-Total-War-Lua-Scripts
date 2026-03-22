out("Loading troy_campaign_achievements.lua")

---------------------------- DESIGN
-- TODO: Pull the achievements table into troy_achievement_config.lua when we needed.
achievements = {

	-- achievements based on completed missions
	mission_succeeded = {

		by_mission_key = {

			troy_main_achievement_any_tbtm_tw_victory = {
				campaign = "main_troy",
				missions = { "troy_main_total_victory" },
			},
	
			troy_mth_achievement_any_myth_tw_victory = {
				campaign = "troy_mythic",
				missions = { "troy_main_total_victory" },
			},
	
			troy_hist_achievement_any_hist_tw_victory = {
				campaign = "troy_historical",
				missions = { "troy_main_total_victory" },
			},
	
			troy_adi_achievement_ajax_win_homeric = {
				missions = { "troy_adi_personal_victory_salamis" },
			},
	
			troy_main_achievement_achilles_win_homeric = {
				missions = {"troy_main_personal_victory_achilles" },
			},
	
			troy_main_achievement_aeneas_win_homeric = {
				missions = { "troy_main_personal_victory_dardania" },
			},
	
			troy_main_achievement_agamemnon_win_homeric = {
				missions = { "troy_main_personal_victory_mycenae" },
			 },
			 
			troy_adi_achievement_dio_win_homeric = {
				missions = { "troy_adi_personal_victory_argos" },
			},
			
			troy_main_achievement_hector_win_homeric = {
				missions = { "troy_main_personal_victory_hector" },
			},
	
			troy_dlc1_achievement_hippolyta_win_homeric = {
				missions = {"troy_amazons_personal_victory_hippolyta" }, 
			},
	
			troy_main_achievement_menelaus_win_homeric = {
				missions = { "troy_main_personal_victory_sparta" },
			},
	
			troy_main_achievement_odysseus_win_homeric = {
				missions = { "troy_main_personal_victory_ithaca" },
			},
	
			troy_main_achievement_paris_win_homeric = {
				missions = { "troy_main_personal_victory_paris" },
			},
	
			troy_dlc1_achievement_penthesilea_win_homeric = {
				missions = { "troy_amazons_personal_victory_penthesilea" },
			},
			
			troy_main_achievement_sarpedon_win_homeric = {
				missions = { "troy_main_personal_victory_lycia" },
			},
			
			troy_rem_achievement_rhes_win_homeric = {
				missions = { "troy_rem_personal_victory_rhesus" },
			},

			troy_rem_achievement_mem_win_homeric = {
				missions = { "troy_rem_personal_victory_memnon" },
			},
	
			troy_main_achievement_any_complete_all_realms = {
				missions = {
					"troy_main_realm_mission_attica",
					"troy_main_realm_mission_boeotia",
					"troy_main_realm_mission_crete",
					"troy_main_realm_mission_cyclades",
					"troy_main_realm_mission_euboea",
					"troy_main_realm_mission_miletus",
					"troy_main_realm_mission_mycenae",
					"troy_main_realm_mission_propontis",
					"troy_main_realm_mission_rhodes",
					"troy_main_realm_mission_thessalia",
					"troy_main_realm_mission_troad",
				},
			},
		},

		by_issuer_key = {
			troy_main_achievement_aeneas_divine_mission_for_every_god = {
				faction = "troy_main_trj_dardania",
				issuers = { "APHRODITE", "APOLLO", "ARES", "ARTEMIS", "ATHENA", "HEPHAESTUS", "HERA", "POSEIDON", "ZEUS" },
			},
		},
	},

	-- achievements based on character max level
	character_rank_up = {
		-- level = { subtype = achievement }
		-- [2] = {

		-- 	-- faction leaders
		-- 	troy_agamemnon = "TROY_ACHIEVEMENTS_HERO_REACH_MAXIMUM_LEVEL_AGAMEMNON",
		-- 	troy_menelaus = "TROY_ACHIEVEMENTS_HERO_REACH_MAXIMUM_LEVEL_MENELAUS",
		-- 	troy_odysseus = "TROY_ACHIEVEMENTS_HERO_REACH_MAXIMUM_LEVEL_ODYSSEUS",
		-- 	troy_achilles = "TROY_ACHIEVEMENTS_HERO_REACH_MAXIMUM_LEVEL_ACHILLES",
		-- 	troy_hector = "TROY_ACHIEVEMENTS_HERO_REACH_MAXIMUM_LEVEL_HECTOR",
		-- 	troy_paris = "TROY_ACHIEVEMENTS_HERO_REACH_MAXIMUM_LEVEL_PARIS",
		-- 	troy_aeneas = "TROY_ACHIEVEMENTS_HERO_REACH_MAXIMUM_LEVEL_AENEAS",
		-- 	troy_sarpedon = "TROY_ACHIEVEMENTS_HERO_REACH_MAXIMUM_LEVEL_SARPEDON",
			
		-- 	-- archers
		-- 	troy_archer_skirmisher = "TROY_ACHIEVEMENTS_HERO_REACH_MAXIMUM_LEVEL_ARCHER",
		-- 	troy_archer_trickster = "TROY_ACHIEVEMENTS_HERO_REACH_MAXIMUM_LEVEL_ARCHER",

		-- 	-- defenders
		-- 	troy_defender_aggro = "TROY_ACHIEVEMENTS_HERO_REACH_MAXIMUM_LEVEL_DEFENDER",
		-- 	troy_defender_quick = "TROY_ACHIEVEMENTS_HERO_REACH_MAXIMUM_LEVEL_DEFENDER",
		-- 	troy_defender_tank = "TROY_ACHIEVEMENTS_HERO_REACH_MAXIMUM_LEVEL_DEFENDER",

		-- 	-- fighters
		-- 	troy_fighter_balanced = "TROY_ACHIEVEMENTS_HERO_REACH_MAXIMUM_LEVEL_FIGHTER",
		-- 	troy_fighter_disruptor = "TROY_ACHIEVEMENTS_HERO_REACH_MAXIMUM_LEVEL_FIGHTER",
		-- 	troy_fighter_killer = "TROY_ACHIEVEMENTS_HERO_REACH_MAXIMUM_LEVEL_FIGHTER",

		-- 	-- warlords
		-- 	troy_warlord_tactician = "TROY_ACHIEVEMENTS_HERO_REACH_MAXIMUM_LEVEL_WARLORD",
		-- 	troy_warlord_utility = "TROY_ACHIEVEMENTS_HERO_REACH_MAXIMUM_LEVEL_WARLORD",
		-- 	troy_warlord_warmonger = "TROY_ACHIEVEMENTS_HERO_REACH_MAXIMUM_LEVEL_WARLORD",

		-- 	-- agents
		-- 	troy_agent_spy = "TROY_ACHIEVEMENTS_AGENT_REACH_MAXIMUM_LEVEL_SPY",
		-- 	troy_agent_envoy = "TROY_ACHIEVEMENTS_AGENT_REACH_MAXIMUM_LEVEL_ENVOY",
		-- 	troy_agent_priest = "TROY_ACHIEVEMENTS_AGENT_REACH_MAXIMUM_LEVEL_PRIESTESS",
		-- },
	},

	-- achievements based on researched technologies
	research_completed = {

		-- achievement = { tech1, and tech2, and tech3, and {tech4, or tech 5, or tech6}, ... }
		-- TROY_ACHIEVEMENTS_DECREES_COMPLETE_ALL_DECREES_FOOD = {
		-- 	"troy_tech_1_public_service", 
		-- 	"troy_tech_2_salves_herbs", 
		-- 	"troy_tech_3_rationing", 
		-- 	"troy_tech_4_battle_rituals", 
		-- 	"troy_tech_5_epic_resilience", 
		-- 	"troy_tech_6_glory_share",
		-- 	"troy_tech_7_chirons_wisdom",
		-- 	"troy_tech_9_royal_granaries",
		-- },

		-- TROY_ACHIEVEMENTS_DECREES_COMPLETE_ALL_DECREES_WOOD = {
		-- 	"troy_tech_19_royal_timber",
		-- 	"troy_tech_20_skirmisher_endurance_training",
		-- 	"troy_tech_21_skirmisher_accuracy_training",
		-- 	"troy_tech_22_master_builders",
		-- 	"troy_tech_23_master_architects",
		-- 	"troy_tech_24_skirmisher_speed_training",
		-- 	"troy_tech_25_the_peoples_feast",
		-- 	"troy_tech_26_beast_of_war",
		-- 	"troy_tech_27_the_way_of_the_skirmisher",
		-- },

		-- TROY_ACHIEVEMENTS_DECREES_COMPLETE_ALL_DECREES_STONE = {
		-- 	"troy_tech_37_skirmisher_rituals",
		-- 	"troy_tech_38_divine_architects",
		-- 	"troy_tech_39_divine_builders",
		-- 	"troy_tech_40_military_advisors",
		-- 	"troy_tech_41_raid_discipline",
		-- 	"troy_tech_42_royal_stone",
		-- 	"troy_tech_43_cadence_drills",
		-- 	"troy_tech_44_marching_drills",
		-- 	"troy_tech_45_blockade_drills",
		-- },

		-- TROY_ACHIEVEMENTS_DECREES_COMPLETE_ALL_DECREES_BRONZE = {
		-- 	"troy_tech_28_military_architects",
		-- 	"troy_tech_29_military_builders",
		-- 	"troy_tech_30_royal_bronze",
		-- 	"troy_tech_31_agents_of_the_throne",
		-- 	"troy_tech_32_master_armourers",
		-- 	"troy_tech_33_royal_hunters",
		-- 	"troy_tech_34_bronze_trade",
		-- 	"troy_tech_35_royal_warriors",
		-- 	"troy_tech_36_spearmen_rituals",
		-- },

		-- TROY_ACHIEVEMENTS_DECREES_COMPLETE_ALL_DECREES_GOLD = {
		-- 	"troy_tech_10_songs_of_the_age",
		-- 	"troy_tech_11_foreign_trade",
		-- 	"troy_tech_12_oath_of_allegiance",
		-- 	"troy_tech_13_royal_spears",
		-- 	"troy_tech_14_treasure_hall",
		-- 	"troy_tech_15_the_way_of_the_warrior",
		-- 	"troy_tech_16_the_way_of_the_spear",
		-- 	"troy_tech_17_divine_rule",
		-- 	{"troy_tech_18_honouring_blood", "troy_tech_18_honouring_blood_Trojans"},
		-- },

		-- TROY_ACHIEVEMENTS_DECREES_COMPLETE_ALL_DECREES = {
		-- 	"TROY_ACHIEVEMENTS_DECREES_COMPLETE_ALL_DECREES_FOOD",
		-- 	"TROY_ACHIEVEMENTS_DECREES_COMPLETE_ALL_DECREES_WOOD",
		-- 	"TROY_ACHIEVEMENTS_DECREES_COMPLETE_ALL_DECREES_STONE",
		-- 	"TROY_ACHIEVEMENTS_DECREES_COMPLETE_ALL_DECREES_BRONZE",
		-- 	"TROY_ACHIEVEMENTS_DECREES_COMPLETE_ALL_DECREES_GOLD",
		-- },
	},

	-- achievements based on created characters
	character_created = {
		-- character_subtype = achievement
		-- troy_agent_seer = "TROY_ACHIEVEMENTS_AGENT_RECRUIT_SEER",
		-- troy_agent_gorgon = "TROY_ACHIEVEMENTS_AGENT_RECRUIT_GORGON",
		-- troy_agent_satyr = "TROY_ACHIEVEMENTS_AGENT_RECRUIT_SATYR",

		-- combined -> all listed should present in faction
		combined = {
			-- achievement = { character_subtype1, character_subtype2, character_subtype3, ... }
			-- TROY_ACHIEVEMENTS_AGENT_HAVE_ALL_TYPES_OF_EPIC_AGENTS_AT_THE_SAME_TIME = {"troy_agent_seer", "troy_agent_gorgon", "troy_agent_satyr", },
		},
	},

	-- achievements based on character performed successful agent action
	character_performed_successful_agent_action = {
		-- type = {	achievement = count}
		hinder_character = {
			-- TROY_ACHIEVEMENTS_AGENT_PERFORM_N_SUCCESSFUL_ACTIONS_VS_CHARACTER_IN_ONE_CAMPAIGN = 1,
		},

		hinder_settlement = {
			-- TROY_ACHIEVEMENTS_AGENT_PERFORM_N_SUCCESSFUL_ACTIONS_VS_FOREIGN_SETTLEMENTS_IN_ONE_CAMPAIGN = 1,
		},

		assist_settlement = {
			-- TROY_ACHIEVEMENTS_AGENT_PERFORM_N_SUCCESSFUL_ACTIONS_AT_OWN_SETTLEMENTS_IN_ONE_CAMPAIGN = 1,
		},

		hinder_army = {
			-- TROY_ACHIEVEMENTS_AGENT_PERFORM_N_SUCCESSFUL_ACTIONS_VS_ARMY_IN_ONE_CAMPAIGN = 1,
		},

		-- all actions combined from the list should exceed count
		combined = {
			-- achievement = { count = number, type = { type1, type2, type3, ... } } 
			-- TROY_ACHIEVEMENTS_AGENT_PERFORM_N_SUCCESSFUL_ACTIONS = {
			-- 	count = 1,
			-- 	type = {"hinder_character", "hinder_settlement", "assist_settlement", "hinder_army", },
			-- },
		}
	},


	-- achievements based on attitude tier for god
	attitude_tier_for_god = {
		-- required_tier = {
			--achievement = {
			--	[{god1, god2, god3, god4, ... }] = count  - count of gods that have at least required_tier from the list at the left
			--	[{god5, god6, god7, god8, ... }] = count2  - or count2 of gods that have at least required_tier from the list at the left
			--}
		--}

		[3] = {
			troy_main_achievement_any_divine_will_max_favour_athena = { [{"athena"}] = 1 },
			troy_main_achievement_any_divine_will_max_favour_zeus = { [{"zeus"}] = 1 },
			troy_main_achievement_any_divine_will_max_favour_aphrodite = { [{"aphrodite"}] = 1 },
			troy_main_achievement_any_divine_will_max_favour_poseidon = { [{"poseidon"}] = 1 },
			troy_main_achievement_any_divine_will_max_favour_hera = { [{"hera"}] = 1 },
			troy_main_achievement_any_divine_will_max_favour_apollo = { [{"apollo"}] = 1 },
			troy_main_achievement_any_divine_will_max_favour_ares = { [{"ares"}] = 1 },
			troy_main_achievement_any_divine_will_max_favour_artemis = { [{"artemis"}] = 1 },
			troy_main_achievement_any_divine_will_max_favour_hephaestus = { [{"hephaestus"}] = 1 },

			-- TROY_ACHIEVEMENTS_GODS_REACH_HIGHEST_TIER_WITH_N_GODS_AT_THE_SAME_TIME = { [{"zeus", "athena", "aphrodite", "poseidon", "hera"}] = 2, },
			-- TROY_ACHIEVEMENTS_GODS_REACH_HIGHEST_TIER_WITH_N1_GODS_AT_THE_SAME_TIME = { [{"zeus", "athena", "aphrodite", "poseidon", "hera"}] = 2, },
		},
	},

	-- achievements based on region faction change event
	region_faction_change_event = {

		production_type = {

			--achievement = {
			--	production_type1 = count	- have count regions producing production_type1
			--	production_type1 = count2	- and count2 regions producing production_type2
			--	...
			--}

			-- TROY_ACHIEVEMENTS_SETTLEMENTS_OWN_N_STONE_PRODUCING_AT_THE_SAME_TIME = { troy_main_settlement_stone = 1 },
			-- TROY_ACHIEVEMENTS_SETTLEMENTS_OWN_N_GOLD_PRODUCING_AT_THE_SAME_TIME = { troy_main_settlement_gold = 1 },
			-- TROY_ACHIEVEMENTS_SETTLEMENTS_OWN_N_BRONZE_PRODUCING_AT_THE_SAME_TIME = { troy_main_settlement_bronze = 1 },
			
			-- combined (all of them should be true)
			-- TROY_ACHIEVEMENTS_SETTLEMENTS_OWN_ALL_TYPES_AT_THE_SAME_TIME = {
			-- 	troy_main_settlement_bronze = 1,
			-- 	troy_main_settlement_coastal = 1,
			-- 	troy_main_settlement_farm = 1,
			-- 	troy_main_settlement_forest = 1,
			-- 	troy_main_settlement_gold = 1,
			-- 	troy_main_settlement_major = 1,
			-- 	troy_main_settlement_mountain = 1,
			-- 	troy_main_settlement_stone = 1,
			-- },
		},

		region_name = {
			--achievement = {
			--	{region1, region2, ... }	- have all of these regions
			--}

			troy_main_achievement_any_conquer_cyclops_island = { "troy_main_thrinacia_trinacria" },
			-- TROY_ACHIEVEMENTS_SETTLEMENTS_OWN_ALL_FOR_RECRUITMENT_OF_MINOTAURS_IN_ONE_CAMPAIGN = {"troy_main_ida_knossos"},
			-- TROY_ACHIEVEMENTS_SETTLEMENTS_OWN_ALL_FOR_RECRUITMENT_OF_CYCLOPS_IN_ONE_CAMPAIGN = {"troy_main_thrinacia_trinacria", "troy_main_lemnos_myrina", "troy_main_rhodes_ialysos"},
			-- TROY_ACHIEVEMENTS_SETTLEMENTS_OWN_ALL_FOR_RECRUITMENT_OF_CENTAURS_IN_ONE_CAMPAIGN = {"troy_main_messenia_tegea", "troy_main_magnesia_meliboea", "troy_main_isthmos_kaunos"},
			-- TROY_ACHIEVEMENTS_SETTLEMENTS_OWN_ALL_FOR_RECRUITMENT_OF_GIANTS_IN_ONE_CAMPAIGN = {"troy_main_euboea_chalcis", "troy_main_melamphylos_dolyche", "troy_main_phrygia_medra"},
		},

		dynamic_regions = {
			--achievement = {
			-- get_region_name - function that returns which region is required
			-- faction - name of faction the player has to be
			--}
			troy_main_achievement_menelaus_win_battle_helen_settlement = {
				get_region_name = function() return paris_helen.current_location end,
				faction = "troy_main_dan_sparta",
			}
		},

		realms = {
			--achievement = count -- if player has count of realms at the same time
			-- TROY_ACHIEVEMENTS_SETTLEMENTS_HAVE_N_COMPLETE_REALM_IN_ONE_CAMPAIGN = 1,
			-- TROY_ACHIEVEMENTS_SETTLEMENTS_HAVE_ALL_COMPLETE_REALMS_IN_ONE_CAMPAIGN = 11,
		},

		remote_colonisation = {
			--achievement = count
			-- TROY_ACHIEVEMENTS_MECHANICS_MENELAUS_COLONISE_N_SETTLEMENTS_IN_ONE_CAMPAIGN = 15,
		},
	},

	-- achievements based on diplomacy

	-- defined diplomacy groups
	diplomacy_groups = {
		all = {},
		danaans = {"troy_main_dan_mycenae", "troy_main_dan_sparta", "troy_main_dan_ithaca", "troy_main_dan_achilles"},
		trojans = {"troy_main_trj_hector", "troy_main_trj_paris", "troy_main_trj_dardania", "troy_main_trj_lycia"},
	},

	diplomacy = {
		all = {
			destroy_factions = {
				-- achievement = count
				-- TROY_ACHIEVEMENTS_DIPLOMACY_ELIMINATE_N_FACTIONS_IN_ONE_CAMPAIGN = 10,
			},
		},

		danaans = {
			military_allies_with = {
				-- achievement = {
				--   group1 = count1
				--	 and [group2 = count2]
				--}

				-- TROY_ACHIEVEMENTS_DIPLOMACY_AS_DANAAN_MILITARY_ALLIANCE_WITH_ALL_PLAYABLE_DANAANS_AT_THE_SAME_TIME = {
				-- 	danaans = 3,
				-- },

				-- TROY_ACHIEVEMENTS_DIPLOMACY_AS_DANAAN_MILITARY_ALLIANCE_WITH_N_PLAYABLE_TROJAN = {
				-- 	trojans = 1,
				-- },
			},
		},

		trojans = {
			military_allies_with = {
				-- achievement = {
				--   group1 = count1
				--	 and [group2 = count2]
				--}

				-- TROY_ACHIEVEMENTS_DIPLOMACY_AS_TROJAN_MILITARY_ALLIANCE_WITH_ALL_PLAYABLE_TROJANS_AT_THE_SAME_TIME = {
				-- 	trojans = 3,
				-- },

				-- TROY_ACHIEVEMENTS_DIPLOMACY_AS_TROJAN_MILITARY_ALLIANCE_WITH_N_PLAYABLE_DANAAN = {
				-- 	danaans = 1,
				-- },
			},
		},
	},

	-- achievements based on achilles faction
	achilles = {
		mood_diversity = {
			-- achievement = { mood1, mood2, mood3} -> fired when current mood was all of the listed
			-- TROY_ACHIEVEMENTS_MECHANICS_ACHILLES_BE_IN_ALL_MOODS_IN_ONE_CAMPAIGN = {"enraged", "insulted", "depressed"},
			--TROY_ACHIEVEMENTS_MECHANICS_ACHILLES_BE_IN_ALL_MOODS_IN_ONE_CAMPAIGN = {"enraged"},
		},

		mood_consistency = {
			-- achievement = { 
			--   mood1 = turns1
			--	 or mood2 = turns2 ...	
			-- } 

			-- TROY_ACHIEVEMENTS_MECHANICS_ACHILLES_BE_IN_ENRAGED_MOOD_FOR_N_TURNS_IN_ONE_CAMPAIGN = {
			-- 	enraged = 25,
			-- },
		},

		mood_inconsistency = {
			troy_main_achievement_achilles_spend_turns_enraged = {
				enraged = 25
			}
		},
	},

	-- achievements based on diomedes faction
	diomedes = {
		military_strategist = {
			confederate_using_dominance = "troy_adi_achievement_dio_confederate_using_dominance",
		},
	},

	-- achievements based on ajax faction
	ajax = {
		champion_challenge = {
			defeat_all_paragons = "troy_adi_achievement_ajax_challenge_and_defeat_all_paragons",
		},
	},

	-- achievements based on agamemnon faction
	agamemnon = {
		-- achievements based on faction ministerial posts changed
		ministerial_posts_changed = {
			-- achievement = { 
			--   tier = posts occupied
			--	 and tier = posts occupied
			-- } 
	
			troy_main_achievement_agamemnon_fill_king_of_men = {
				[1] = 1,
				[2] = 3,
				[3] = 5,
			},
		},

		ministerial_post_to_character = {
			-- achievement = { 
			--   tier = post occupied
			--	 character_unit_set = unit set that character unit belongs to
			-- } 

			troy_main_achievement_agamemnon_appoint_achilles_or_ajax_as_lawagetas = {
				tier = 1,
				characters_unit_set = { "troy_mth_achilles_hero_variants_set", "troy_mth_ajax_hero_variants_set" },
			},
		},
	},

	-- achievements based on hector faction
	hector = {
		-- achievement = trojan alliance level
		trojan_alliance = {
			troy_main_achievement_hector_max_trojan_alliance = 5,
		},
	},

	-- achievements based on penthesilea faction
	penthesilea = {
		capture_bonuses = {
			troy_dlc1_achievement_penthesilea_get_war_spoils_for_every_god = { "aphrodite", "apollo", "ares", "artemis", "athena", "hephaestus", "hera", "poseidon", "zeus" },
		},
	},

	-- achievements based on paris faction
	paris = {
		favour_with_goddesses = "troy_main_achievement_paris_favour_with_the_goddesses"
	},

	-- achievements based on odysseus faction
	odysseus = {
		conquer_troy_and_return_to_ithaca = "troy_main_achievement_odysseus_round_trip_to_troy"
	},

	-- achievements based on rhesus faction
	rhesus = {
		spend_devotion = {
			troy_rem_achievement_rhes_spend_devotion = 100	
		},
		num_countless_armies_alive = {
			troy_rem_achievement_rhes_countless_hosts = 6
		}
	},

	memnon = {
		sherden_warriors_key = "troy_rem_aeth_mem_sherden_warriors",
		sherden_warriors = {
			troy_rem_achievement_mem_sherden_warriors = 10	
		},
		capture_bonus_larger_buckets_collected = {
			troy_rem_achievement_mem_fame_war_spoils = 10
		},
	},

	-- achievements based on foreign slot building complete event
	foreign_slot_building_complete_event = {
		-- achievement = { 
		--   [{building1, building2, etc}] = count - at least count buildings from listed types
		--	 and ...
		-- } 

		-- TROY_ACHIEVEMENTS_MECHANICS_ODYSSEUS_CREATE_N_SUPPLY_BASES = {
		-- 	[{"troy_main_supply_base_1", "troy_main_supply_base_2", "troy_main_supply_base_3", "troy_main_supply_base_4", "troy_main_supply_base_5", "troy_main_supply_base_6", }] = 15,
		-- },
	},

	-- achievements based on unit_upgraded
	unit_upgraded = {
		max_tier = {
			-- achievement = count  - at least count unit upgrades to max tier
			-- TROY_ACHIEVEMENTS_MECHANICS_AMAZONS_UPGRADE_N_UNITS_TO_HIGHEST_TIER_IN_ONE_CAMPAIGN = 40,
		},
	},

	-- achievements based on benevolence_finish
	benevolence = {
		finish = {
			-- achievement = faction
			-- TROY_ACHIEVEMENTS_MECHANICS_HECTOR_WIN_PRIAM_BENEVOLENCE_MAXIMUM_TIER = "troy_main_trj_hector",
			-- TROY_ACHIEVEMENTS_MECHANICS_PARIS_WIN_PRIAM_BENEVOLENCE_MAXIMUM_TIER = "troy_main_trj_paris",
		},
	},

	--
	-- achievements based on speak to the dead
	speak_to_the_dead = {
		diversity = {
			-- achievement = count - speak with at least count different members
			-- TROY_ACHIEVEMENTS_MECHANICS_AENEAS_TALK_TO_ALL_DEAD = 10,
		},

		unlock_all = "troy_main_achievement_aeneas_speak_to_the_dead_unlock_all",
	},

	-- achievements based on barters
	barters = {
		break_agreement = {
			-- achievement = count - break at least count barter agreements
			troy_main_achievement_sarpedon_break_barters = 5,
		},

		steal_agreement = {
			-- achievement = count - steal at least count barter agreements
			troy_main_achievement_sarpedon_steal_barters = 5,
		},

		collect_total = {
			-- achievement = { [pooled res key] = count } - collect minimum of given resources includes single barter and barter agreement
			troy_main_achievement_any_trade_food = {
				troy_food = 100000,
			},
		},
	},

	-- achievements based on feats
	feats = {
		combined = {
			-- achievement = count - break at least count barter agreements
			-- TROY_ACHIEVEMENTS_MECHANICS_HIPPOLYTA_PERFORM_N_FEATS_IN_ONE_CAMPAIGN = 40,
		},
	},

	-- achievements based on monsters
	monsters = {
		-- monster key = achievement
		captured = {
			cerberus = "troy_mth_achievement_any_capture_monster_cerberus",
			hydra = "troy_mth_achievement_any_capture_monster_hydra",
			griffin = "troy_mth_achievement_any_capture_monster_griffin",
		},
		
		-- achievement key = battle completed by turn N 
		battle = {
			troy_mth_achievement_any_speedrun_quest_battle = 50
		},

		pet_cerberus = "troy_mth_achievement_any_pet_the_cerberus"
	},

	-- achievements based on battles
	battle = {
		win = { -- win battle
			troy_main_achievement_any_win_battle_troy_using_palladium = {
				region = "troy_main_ilion_troy", -- region where battle is being fought
				battle_for_settlement = true, -- is battle fought at the settlement in the region
				attacking_side = true, -- should faction be on the attacking side
				prerequisite_mission = "troy_adi_mission_stealing_the_palladium", -- should specific mission be completed before the battle
			},
			troy_main_achievement_any_achaean_win_earthquake_troy = {
				region = "troy_main_ilion_troy", -- region where battle is being fought
				culture = "troy_main_clt_danaans", -- faction should be of specific culture
				battle_for_settlement = true, -- is battle fought at the settlement in the region
				attacking_side = true, -- should faction be on the attacking side
				evaluate_state_func = function(human_faction_data, battle, battle_results)
					return wrath_of_posseidon_earthquake_incident_has_fired
				end,
			},
			troy_main_achievement_any_achaean_win_ruse_troy = {
				region = "troy_main_ilion_troy", -- region where battle is being fought
				culture = "troy_main_clt_danaans", -- faction should be of specific culture
				battle_for_settlement = true, -- is battle fought at the settlement in the region
				attacking_side = true, -- should faction be on the attacking side
				evaluate_state_func = function(human_faction_data, battle, battle_results)
					return odysseus_ruse_is_active and cm:model():turn_number() >= odysseus_ruse_turn_to_allow
				end,
			},
			troy_dlc1_achievement_hippolyta_penthesilea_win_battle_athens = {
				faction = { "troy_amazons_trj_hippolyta", "troy_amazons_trj_penthesilea" }, -- player has to be playing with one of the listed factions
				region = "troy_main_attica_athens", -- region where battle is being fought
				battle_for_settlement = true, -- is battle fought at the settlement in the region
				attacking_side = true, -- should faction be on the attacking side
			},
			troy_dlc1_achievement_hippolyta_penthesilea_win_battle_using_max_upgrade_army = {
				faction = { "troy_amazons_trj_hippolyta", "troy_amazons_trj_penthesilea" }, -- player has to be playing with one of the listed factions
				army_func = function(character)
					return 19 <= unit_count_meet_condition(character, function(unit) return not unit:has_unit_commander() and not unit:has_upgrades() end)
				end,
			},
			troy_dlc1_achievement_hippolyta_penthesilea_win_battle_using_mounted_only = {
				faction = { "troy_amazons_trj_hippolyta", "troy_amazons_trj_penthesilea" }, -- player has to be playing with one of the listed factions
				army_func = function(character)
					return 19 <= unit_count_meet_condition(character, function(unit) return not unit:has_unit_commander() and unit:unit_category() == "cavalry" end)
				end,
			},
			troy_main_achievement_menelaus_win_battle_using_only_foreign_units = {
				faction = { "troy_main_dan_sparta" }, -- player has to be playing with one of the listed factions
				army_func = function(character)
					return 19 <= unit_count_meet_condition(character, function(unit) return not unit:has_unit_commander() and unit:belongs_to_unit_set("troy_all_but_menelaus") end)
				end,
			},
			troy_main_achievement_achilles_wound_hector = {
				faction = { "troy_main_dan_achilles" }, -- player has to be playing with one of the listed factions
				army_func = function(character)
					return 1 <= unit_count_meet_condition(character, function(unit) return unit:has_unit_commander() and unit:belongs_to_unit_set("troy_mth_achilles_hero_variants_set") end)
				end,
				evaluate_state_func = function(human_faction_data, battle, battle_results)
					return battle_results:side_has_dead_unit_of_set(cm:model(), not human_faction_data.is_attacker, "troy_mth_hector_hero_variants_set")
				end,
			},
			troy_main_achievement_paris_wound_achilles = {
				faction = { "troy_main_trj_paris" }, -- player has to be playing with one of the listed factions
				army_func = function(character)
					return 1 <= unit_count_meet_condition(character, function(unit) return unit:has_unit_commander() and unit:belongs_to_unit_set("troy_mth_paris_hero_variants_set") end)
				end,
				evaluate_state_func = function(human_faction_data, battle, battle_results)
					return battle_results:side_has_dead_unit_of_set(cm:model(), not human_faction_data.is_attacker, "troy_mth_achilles_hero_variants_set")
				end,
			},
		},
	},

	-- achievements campaign victory
	campaign_victory = {
		hector_paris_declared_war_turn_one = "troy_main_achievement_hector_paris_dow_brother_turn_one",
		win_game_without_treaties = "troy_main_achievement_any_win_without_signing_treaties",
	},

	ancillaries = {
		equipped_bodyguards = {
			troy_hist_achievement_any_bodyguard_max = {
				unit_set = "troy_hist_elite_bodyguards",
			},
		},
	},

	blood_markers = {
		blood_totem_added = "troy_dlc3_achievement_any_tropaion",
		blood_river_added = "troy_dlc3_achievement_any_river_of_blood",
	},
}

---------------------------- CODE IMPLEMENTATION ---------------------------- 


local debug = false
local function output_debug_string(string)
	if debug then
		out("troy_campaign_achievements (debug): " .. string)
	end
end

local function output_string(string)
	out("troy_campaign_achievements: " .. string)
end


--
local function is_in_diplomacy_group(faction, group)
	local faction_name = faction:name()

	--
	if faction_name == group then return true end

	-- not found
	local group_data = achievements.diplomacy_groups[group]
	if group_data == nil or not is_table(group_data) then 
		return false 
	end

	-- all
	if #group_data == 0 then return true end

	for index, name in ipairs(group_data) do
		if name == faction_name then return true end
	end

	return false
end

local function get_diplomacy_group(group)

	local group_data = achievements.diplomacy_groups[group]
	if group_data ~= nil  then 
		return group_data
	end

	return {group}
end

-- helper functions

local function any_army_meets_conditions(characters, army_func)
	for index, character in ipairs(characters) do
		if army_func(character) then
			return true
		end
	end

	return false
end

-- functions handling events

-- achievements based on character max level
local function character_rank_up_achievement_filter(context)
	return context:character():faction():is_human()
end

local function character_rank_up_achievement(context)
	local character = context:character()
	local faction = character:faction()
	local rank = character:rank()
	local entry = achievements.character_rank_up[rank]

	if not entry then
		output_debug_string("character_rank_up_achievement: achievement not defined for character rank: " .. rank)
		return 
	end

	if not is_table(entry) then
		output_string("character_rank_up_achievement: table expected for achievements defined at rank: " .. rank)
		return 
	end

	local achievement = entry[character:character_subtype_key()]
	if not achievement then
		output_debug_string("character_rank_up_achievement: achievement not defined for rank: " .. rank .. ", character subtype: " .. character:character_subtype_key())
		return
	end

	--
	achievement_unlock(faction, achievement)
end

-- achievements based on researched technologies
local function research_completed_achievements_init()
	-- create cache for all included technologies

	output_debug_string("research_completed_achievements_init")

	local cache = {}
	for achievement, technologies in pairs(achievements.research_completed) do
		--output_debug_string("processing top level achievement: " .. achievement)

		if is_table(technologies) then
			-- create cache for technologies array
			technologies.cache = {}
			local process_func = nil

			process_func = function(technology_entry)
				-- we have list of technologies
				if is_table(technology_entry) then
					--output_debug_string("found array of technologies")
					for index, technology in ipairs(technology_entry) do
						--output_debug_string("processing #" .. index)
						process_func(technology)
					end
				else
					-- check if we have key to top level technologies
					if achievements.research_completed[technology_entry] ~= nil then
						--output_debug_string("found top level entry (" .. technology_entry .. ")")

						--
						for index, top_technology_entry in ipairs(achievements.research_completed[technology_entry]) do
							--output_debug_string("processing top level entry (" .. technology_entry .. ") #" .. index)
							process_func(top_technology_entry)
						end

					else
						-- register
						--output_debug_string("registering (" .. technology_entry .. ")")
						technologies.cache[technology_entry] = true
						cache[technology_entry] = true
					end
				end
			end

			--
			for index, technology_entry in ipairs(technologies) do
				--output_debug_string("processing entry #" .. index)
				process_func(technology_entry)
			end
		else
			-- remove entry
			output_string("research_completed_achievements_init: table expected for achievements.research_completed top level entries")
		end
	end

	-- dump local caches
	if debug and false then
		-- 
		for achievement, technologies in pairs(achievements.research_completed) do
			output_debug_string("dumping cache for achievement: " .. achievement)
			if technologies.cache ~= nil then
				for entry, _ in pairs(technologies.cache) do
					output_debug_string(entry)
				end
			end
		end
	end

	--
	achievements.research_completed.cache = cache

	if debug and false then
		output_debug_string("dumping top level cache:")

		for entry, _ in pairs(achievements.research_completed.cache) do
			output_debug_string(entry)
		end
	end

end

-- TODO change check for local faction with is_human(), problematic because of achievements.research_completed.cache ?!?
local function research_completed_achievement_filter(context)
	return context:faction():model():faction_is_local(context:faction():name()) and achievements.research_completed.cache[context:technology()] == true
end

local function research_completed_achievement(context)
	local faction = context:faction()
	local completed_technology = context:technology()

	output_debug_string("research_completed_achievement: faction: " .. faction:name() .. ", " .. completed_technology)

	-- enumerate all achievements
	for achievement, technologies in pairs(achievements.research_completed) do
		-- 
		if technologies.cache ~= nil and technologies.cache[completed_technology] == true then

			local process_func = nil
			local unlock_achievement = true

			process_func = function(technology_entry)

				local has_all_technologies = true

				if is_table(technology_entry) then
					local has_one_technology = false
					for index, technology in ipairs(technology_entry) do
						if faction:has_technology(technology) then
							has_one_technology = true
							break
						end
					end

					if not has_one_technology then 
						has_all_technologies = false
					end

				else
					-- check if we have key to top level technologies
					if achievements.research_completed[technology_entry] ~= nil then
						--
						for index, top_technology_entry in ipairs(achievements.research_completed[technology_entry]) do
							if not process_func(top_technology_entry) then
								has_all_technologies = false
								break
							end
						end
					else
						if not faction:has_technology(technology_entry) then
							output_debug_string("does not have technology: " .. technology_entry .. ", achievement will not trigger")
							has_all_technologies = false
						end
					end
				end

				return has_all_technologies
			end

			--
			for index, technology_entry in ipairs(technologies) do
				if not process_func(technology_entry) then 
					unlock_achievement = false
					break
				end
			end

			--
			if unlock_achievement then
				achievement_unlock(faction, achievement)
			end
		else
			output_debug_string("not presenting in cache for achievement: " .. achievement)
		end
	end
end


-- achievements based on created characters
local function character_created_achievement_filter(context)
	return context:character():faction():is_human()
end

local function character_created_achievement(context)
	local character = context:character()
	local faction = character:faction()
	if not faction or faction:is_null_interface() then 
		output_string("character_created_achievement: invalid faction")
		return 
	end

	-- 
	local achievement = achievements.character_created[character:character_subtype_key()]
	if achievement ~= nil then
		achievement_unlock(faction, achievement)
	else
		output_debug_string("character_created_achievement: achievement not defined for character subtype: " .. character:character_subtype_key())
	end


	-- check combined
	data = achievements.character_created.combined
	if data and is_table(data) then
		for achievement, achievement_data in pairs(data) do
			if is_table(achievement_data) then

				local present = {}
				local present_count = 0

				for index, type in ipairs(achievement_data) do
					if present[type] == nil then 
						present_count = present_count + 1
					end

					present[type] = false
				end

				--
				output_debug_string("character_created_achievement: seeking for " .. present_count .. " agents for achievement:  " .. achievement)

				-- enumerate all characters
				local characters = faction:character_list()
				for index = 0, characters:num_items() - 1 do
					local character = characters:item_at(index)
					local type = character:character_subtype_key()

					-- register
					if present[type] == false then
						present[type] = true
						present_count = present_count - 1

						if present_count == 0 then
							achievement_unlock(faction, achievement)
							break
						end
					end
				end
			else
				output_string("character_created_achievement: achievements.character_created.combined[" .. achievement .. "] is not a table as expected")
			end
		end
	else
		output_string("character_created_achievement: achievements.character_created.combined is missing (or is not a table as expected)")
	end
end

-- achievements based on character performed successful agent action
local function character_performed_successful_agent_action_achievement_filter(context)
	return context:character():faction():is_human()
end

local function character_performed_successful_agent_action_achievement(context)
	local character = context:character()
	local type = context:type()

	local faction = character:faction()
	if not faction or faction:is_null_interface() then 
		output_string("character_performed_successful_agent_action: invalid faction")
		return 
	end

	if not type then 
		output_string("character_performed_successful_agent_action: action type is not defined")
		return 
	end

	local func_get_action_key = function(action_type) return "character_performed_successful_agent_action_" .. action_type end

	-- register
	local successful_agent_actions = track_achievement_progress(faction, func_get_action_key(type), true)

	-- 
	local data = achievements.character_performed_successful_agent_action[type]
	if data and is_table(data) then
		for achievement, count in pairs(data) do
			if successful_agent_actions >= count then
				achievement_unlock(faction, achievement)
			end
		end
	else
		output_string("character_performed_successful_agent_action_achievement: achievement not defined in achievements.character_performed_successful_agent_action (or entry is not a table as expected) for action type: " .. type)
	end

	-- check combined
	data = achievements.character_performed_successful_agent_action.combined
	if data and is_table(data) then
		for achievement, achievement_data in pairs(data) do
			if is_table(achievement_data) then
				local count = achievement_data.count
				local types = achievement_data.type
				if count ~= nil and is_number(count) and types ~= nil and is_table(types) then

					local successful_agent_actions_combined = 0

					for index, type in ipairs(types) do
						successful_agent_actions_combined = successful_agent_actions_combined + track_achievement_progress(faction, func_get_action_key(type), false)
					end
				
					if successful_agent_actions_combined >= count then
						achievement_unlock(faction, achievement)
					end

				else
					output_string("character_performed_successful_agent_action_achievement: achievements.character_performed_successful_agent_action.combined[" .. achievement .. "].count (.type) are either not defined or are not a number and table respectively")
				end
			else
				output_string("character_performed_successful_agent_action_achievement: achievements.character_performed_successful_agent_action.combined[" .. achievement .. "] is not a table as expected")
			end
		end
	else
		output_string("character_performed_successful_agent_action_achievement: achievements.character_performed_successful_agent_action.combined is missing (or is not a table as expected)")
	end
end

-- achievements based on attitude tier for god
local function god_attitude_tier_change_achievement_filter(context)
	return context:faction():is_human()
end

local function god_attitude_tier_change_achievement(context)
	local faction = context:faction()
	local god = context:god()
	if god == nil or god:is_null_interface() then
		output_debug_string("god_attitude_tier_change_achievement: no god found in event data")
		return 
	end

	god = god:name()

	local tier = faction:attitude_tier_for_god(god)
	if tier > 0 then
		local achievement_tier_data = achievements.attitude_tier_for_god[tier]
		if achievement_tier_data then
			for achievement, achievement_data in pairs(achievement_tier_data) do
				if is_table(achievement_data) then
					local entry = 1
					local unlock = false
					for gods, count in pairs(achievement_data) do
						if is_table(gods) and is_number(count) and count > 0 then
							for index, god in ipairs(gods) do
								local attitude = faction:attitude_tier_for_god(god)
								if attitude >= tier then
									count = count - 1
									if count <= 0 then
										unlock = true
										break 
									end
								end
							end
						else
							output_string("god_attitude_tier_change_achievement: table and count > 0 expected for tier: " .. tier .. ", achievement: " .. achievement, "entry: " .. entry)
						end

						if unlock == true then
							achievement_unlock(faction, achievement)
							break
						end

						entry = entry + 1
					end
				else
					output_string("god_attitude_tier_change_achievement: table expected for tier: " .. tier .. ", achievement: " .. achievement)
				end
			end
		else
			output_debug_string("god_attitude_tier_change_achievement: no data defined for god: " .. god .. ", tier: " .. tier)
		end
	else
		output_string("god_attitude_tier_change_achievement: no tier defined for god: " .. god)
	end

	if faction:name() == "troy_main_trj_paris" then
		if is_table(achievements.paris) then
			if faction:attitude_tier_for_god("aphrodite") == 0 and (faction:attitude_tier_for_god("hera") >= 3 or faction:attitude_tier_for_god("athena") >= 3) then
				achievement_unlock(faction, achievements.paris.favour_with_goddesses)
			end
		end
	end
end


-- achievements based on region faction change event
local function region_faction_change_event_filter(context)
	return context:region():owning_faction():is_human()
end

local function region_faction_change_event(context)
	local region = context:region()
	local faction = region:owning_faction()
	local reason = context:reason()

	--test
	--achievements.benevolence.func_finish(cm:model():world():faction_by_key("troy_main_trj_hector"))
	--achievements.benevolence.func_finish(cm:model():world():faction_by_key("troy_main_trj_paris"))
	--achievements.barters.func_barter_interrupted(cm:get_faction(sarpedon_faction), false)
	--achievements.barters.func_barter_interrupted(cm:get_faction(sarpedon_faction), true)

	if faction:name() == odysseus_faction and region:name() == "troy_main_ilion_troy" then
		persist_achievement_data(faction, odysseus_faction .. "_owned_" .. "troy_main_ilion_troy", true)
	end

	-- cache 
	local production_types_cache = {}
	local regions_cache = {}

	local region_list = faction:region_list()

	--		
	for i = 0, region_list:num_items() - 1 do
		local region = region_list:item_at(i)
		local production_type = region:settlement():production_type()
		if production_type ~= nil then
			if production_types_cache[production_type] == nil then
				production_types_cache[production_type] = 1
			else
				production_types_cache[production_type] = production_types_cache[production_type] + 1
			end
		end

		--
		regions_cache[region:name()] = true
	end

	-- production type
	for achievement, achievement_data in pairs(achievements.region_faction_change_event.production_type) do
		--output_debug_string("region_faction_change_event: processing achievement: " .. achievement .. " in achievements.region_faction_change_event.production_type")

		if is_table(achievement_data) then
			local unlock = true
			for production_type, count in pairs(achievement_data) do
				if production_types_cache[production_type] == nil or production_types_cache[production_type] < count then
					unlock = false
					break;
				end
			end

			if unlock == true then
				achievement_unlock(faction, achievement)
			end
		else
			output_string("region_faction_change_event: no table defined for achievement: " .. achievement .. " in achievements.region_faction_change_event.production_type")
		end
	end

	-- regions
	for achievement, achievement_data in pairs(achievements.region_faction_change_event.region_name) do
		--output_debug_string("region_faction_change_event: processing achievement: " .. achievement .. " in achievements.region_faction_change_event.region_name")

		if is_table(achievement_data) then
			local unlock = true
			for index, region in ipairs(achievement_data) do
				if regions_cache[region] == nil then
					unlock = false
					break;
				end
			end

			if unlock == true then
				achievement_unlock(faction, achievement)
			end
		else
			output_string("region_faction_change_event: no table defined for achievement: " .. achievement .. " in achievements.region_faction_change_event.region_name")
		end
	end

	-- dynamic regions
	for achievement, achievement_data in pairs(achievements.region_faction_change_event.dynamic_regions) do
		if is_table(achievement_data) then
			if achievement_data.get_region_name ~= nil and achievement_data.faction ~= nil then
				if faction:name() == achievement_data.faction and context:region():name() == achievement_data.get_region_name() then
					achievement_unlock(faction, achievement)
				end
			end
		else
			output_string("region_faction_change_event: no table defined for achievement: " .. achievement .. " in achievements.region_faction_change_event.dynamic_regions")
		end
	end

	-- realms

	-- cache realms
	local realms_count = 0

	for realm, realm_data in pairs(troy_realms) do
		if realm_data.regions ~= nil and is_table(realm_data.regions) then
			local owns = true

			for index, region in ipairs(realm_data.regions) do
				if regions_cache[region] == nil then
					owns = false
					break
				end
			end

			if owns == true then
				realms_count = realms_count + 1
				-- todo - cache region here if needed for achievements connected with concrete realms
			end

		else
			output_string("region_faction_change_event: no table defined for realm_data.regions[" .. realm .. "]" .. achievement .. " in achievements.region_faction_change_event.region_name")
		end
	end

	--
	output_debug_string("region_faction_change_event: faction ownes: " .. realms_count .. " realms")

	for achievement, count in pairs(achievements.region_faction_change_event.realms) do
		if is_number(count) then
			if realms_count >= count then
				achievement_unlock(faction, achievement)
			end
		else
			output_string("region_faction_change_event: no number defined for achievement: " .. achievement)
		end
	end

	--
	if reason == "remote colonisation" then
		local remote_colonisations  = track_achievement_progress(faction, "region_faction_change_event_remote_colonisation", true)

		for achievement, count in pairs(achievements.region_faction_change_event.remote_colonisation) do
			if is_number(count) then
				if remote_colonisations >= count then
					achievement_unlock(faction, achievement)
				end
			else
				output_string("region_faction_change_event: no number defined for achievement: " .. achievement)
			end
		end
	end
end



-- achievements based on faction destroys other faction
local function faction_destroys_other_faction_filter(context)
	return context:faction():is_human()
end

local function faction_destroys_other_faction(context)
	local faction = context:faction()

	output_debug_string("faction_destroys_other_faction trigger: for faction: " .. faction:name())
	local destroyed_factions = track_achievement_progress(faction, "faction_destroys_other_faction", true)

	for group, group_data in pairs(achievements.diplomacy) do
		output_debug_string("faction_destroys_other_faction: processing achievements.diplomacy." .. group)

		if is_in_diplomacy_group(faction, group) and group_data.destroy_factions ~= nil and is_table(group_data.destroy_factions) then
			for achievement, count in pairs(group_data.destroy_factions) do
				if is_number(count) and destroyed_factions >= count then
					achievement_unlock(faction, achievement)
				end
			end
		end
	end
end

local function barter_update_resources(faction, bought_resources)
	for resource_key, bought_amount in pairs(bought_resources) do
		local current_bought_amount = get_persist_achievement_data(faction, "barter_resource_bought_" .. resource_key) or 0
		
		local new_bought_amount = current_bought_amount + bought_amount
		persist_achievement_data(faction, "barter_resource_bought_" .. resource_key, new_bought_amount)

		-- we try to unlock achievement only if there is achievement that depends on this resource
		for achievement_key, required_resources in pairs(achievements.barters.collect_total) do
			if is_table(required_resources) then
				if required_resources[resource_key] ~= nil then
					local unlock = true

					for required_resource_key, required_amount in pairs(required_resources) do
						local current_amount = get_persist_achievement_data(faction, "barter_resource_bought_" .. required_resource_key) or 0
						if current_amount < required_amount then
							unlock = false
							break
						end
					end

					if unlock then
						achievement_unlock(faction, achievement_key)
					end
				end
			else
				output_string("barter_update_resources: no table defined for achievements.barters.collect_total." .. achievement_key)
			end
		end
	end
end

-- achievements based on positive diplomatic event
local function positive_diplomatic_event_filter(context)
	return context:character():faction():is_human()
end

local function positive_diplomatic_event(context)
	local faction = context:character():faction()
	local other_faction

	--
	if context:proposer():name() == faction:name() then
		other_faction = context:recipient()
	else
		other_faction = context:proposer()
	end

	
	if not get_persist_achievement_data(faction, "has_made_treaties") and
	 	(context:is_military_alliance() or context:is_defensive_alliance() or context:is_military_access() or context:is_non_aggression_pact() or context:is_trade_agreement() or context:is_vassalage() or context:is_subjugation()) then
		persist_achievement_data(faction, "has_made_treaties", true)
	end


	--output_debug_string("positive_diplomatic_event: other faction is: " .. other_faction:name())

	if context:is_military_alliance() then
		for group, group_data in pairs(achievements.diplomacy) do
			--output_debug_string("positive_diplomatic_event: processing group: " .. group)
			if is_in_diplomacy_group(faction, group) and group_data.military_allies_with ~= nil and is_table(group_data.military_allies_with) then
				for achievement, achievement_data in pairs(group_data.military_allies_with) do

					--output_debug_string("positive_diplomatic_event: processing achievements.diplomacy." .. group .. ".military_allies_with." .. achievement)

					if is_table(achievement_data) then
						local unlock = true
						for military_group, count in pairs(achievement_data) do
							local military_group_factions = get_diplomacy_group(military_group)

							--output_debug_string("positive_diplomatic_event: processing " .. military_group)

							-- all
							if #military_group_factions == 0 then
								local list = faction:factions_military_alliance_with()
								-- + 1, because in time when this is fired -> faction still does not have military aliance with other faction
								--output_debug_string("positive_diplomatic_event: military_alliance_with: list:num_items(): " .. list:num_items())
								if list:num_items() + 1 < count then 
									--output_debug_string("positive_diplomatic_event: military_alliance_with: " .. list:num_items() .. ", required: " ..  count .. ", unlock failed")
									unlock = false
									break
								end
							-- listed
							else
								local list_count = 0
								for index, faction_in_group in ipairs(military_group_factions) do
									if faction_in_group == other_faction:name() or faction:military_allies_with(faction:model():world():faction_by_key(faction_in_group)) then
										list_count = list_count + 1
										break
									end
								end

								if list_count < count then
									--output_debug_string("positive_diplomatic_event: military_alliance_with: " .. list_count .. ", required: " ..  count .. ", unlock failed")
									unlock = false
									break
								end
							end
						end

						if unlock == true then
							achievement_unlock(faction, achievement)
						end
					else
						output_string("positive_diplomatic_event: no table defined for achievements.diplomacy." .. group .. ".military_allies_with." .. achievement)
					end
				end
			end
		end
	elseif context:is_single_barter() then
		-- barter agreements are handled separately in barter_ticked_event
		if achievements.barters ~= nil and is_table(achievements.barters) and achievements.barters.collect_total ~= nil and is_table(achievements.barters.collect_total) then
			local bought_resources = {}
		
			if context:proposer() == faction then
				bought_resources = context:single_barter_bought_resources()
			else
				bought_resources = context:single_barter_sold_resources()
			end
	
			barter_update_resources(faction, bought_resources)
		else
			output_string("positive_diplomatic_event: no table defined for achievements.barters.collect_total")
		end
	elseif context:is_confederation() then
		if faction:name() == military_strategy.diomedes_faction_key and context:is_dominance_used() then
			if achievements.diomedes ~= nil and is_table(achievements.diomedes) and
			 achievements.diomedes.military_strategist ~= nil and is_table(achievements.diomedes.military_strategist) and
			 achievements.diomedes.military_strategist.confederate_using_dominance ~= nil then
				achievement_unlock(faction, achievements.diomedes.military_strategist.confederate_using_dominance)
			end
		end
	end
end

local function negative_diplomatic_event_filter(context)
	local proposer = context:proposer()
	local human_proposer = nil
	if not proposer:is_null_interface() and proposer:is_human() then 
		human_proposer = proposer
	end

	local recipient = context:recipient()
	local human_recipient = nil
	if not recipient:is_null_interface() and recipient:is_human() then 
		human_recipient = recipient
	end
	
	return human_proposer or human_recipient
end

local function negative_diplomatic_event(context)

	local proposer = context:proposer()
	local recipient = context:recipient()
	if context:is_war() then
		if not proposer:is_null_interface() and not recipient:is_null_interface() then
			if cm:model():turn_number() == 1 and 
			((proposer:name() == "troy_main_trj_hector" and recipient:name() == "troy_main_trj_paris") or (proposer:name() == "troy_main_trj_paris" and recipient:name() == "troy_main_trj_hector")) then
				
				-- it is possible that this is a multiplayer game so we check individually for human faction
				if proposer:is_human() then
					persist_achievement_data(proposer, "hector_paris_declared_war_turn_one", true)
				end
				
				if recipient:is_human() then
					persist_achievement_data(recipient, "hector_paris_declared_war_turn_one", true)
				end
			end
		end
	end
end

local function barter_ticked_event_filter(context)
	return context:faction():is_human()
end

local function barter_ticked_event(context)
	if achievements.barters ~= nil and is_table(achievements.barters) and achievements.barters.collect_total ~= nil and is_table(achievements.barters.collect_total) then
		barter_update_resources(context:faction(), context:bought_resources())
	else
		output_string("barter_ticked_event: no table defined for achievements.barters.collect_total")
	end
end

-- achievements based on faction turn start
local function faction_turn_start_filter(context)
	return context:faction():is_human()
end

local function faction_turn_start(context)
	local faction = context:faction()

	-- achilles
	--increase_achilles_mood_value("enraged", 100, "war_declarations")

	if faction:name() == achilles_faction then
		-- mood_consistency
		if achievements.achilles ~= nil and is_table(achievements.achilles) and achievements.achilles.mood_consistency ~= nil and is_table(achievements.achilles.mood_consistency) then

			--
			local achilles_current_mood = get_persist_achievement_data(faction, "achilles_current_mood") or TROY_ACHILLES_DEFAULT_MOOD

			local old_mood = persist_achievement_data(faction, "achilles_latest_mood_at_start_turn", achilles_current_mood)
			if old_mood ~= nil and old_mood ~= achilles_current_mood then
				remove_achievement_progress(faction, "achilles_latest_mood_turns")
			end

			local achilles_latest_mood_turns = track_achievement_progress(faction, "achilles_latest_mood_turns", true)
			for achievement, achievement_data in pairs(achievements.achilles.mood_consistency) do
				if is_table(achievement_data) then
					local unlock = false
					for mood, turns in pairs(achievement_data) do
						if mood == achilles_current_mood and achilles_latest_mood_turns >= turns then
							unlock = true
							break
						end
					end

					if unlock then
						achievement_unlock(faction, achievement)
					end
				else
					output_string("faction_turn_start: no table defined for achievements.achilles.mood_consistency." .. achievement)
				end
			end
		else
			output_string("faction_turn_start: no table defined for achievements.achilles.mood_consistency")
		end

		if achievements.achilles ~= nil and is_table(achievements.achilles) and achievements.achilles.mood_inconsistency ~= nil and is_table(achievements.achilles.mood_inconsistency) then

			local achilles_current_mood = get_persist_achievement_data(faction, "achilles_current_mood") or TROY_ACHILLES_DEFAULT_MOOD
			local turns_active = track_achievement_progress(faction, "achilles_mood_turns_" .. achilles_current_mood, true)

			for achievement, achievement_data in pairs(achievements.achilles.mood_inconsistency) do
				if is_table(achievement_data) then
					local unlock = false
					for mood, turns in pairs(achievement_data) do
						if mood == achilles_current_mood and turns_active >= turns then
							unlock = true
							break
						end
					end

					if unlock then
						achievement_unlock(faction, achievement)
					end
				else
					output_string("faction_turn_start: no table defined for achievements.achilles.mood_inconsistency." .. achievement)
				end
			end
		else
			output_string("faction_turn_start: no table defined for achievements.achilles.mood_inconsistency")
		end
	end
end


-- achievements based on faction ministerial posts changed
local function faction_ministerial_posts_changed_filter(context)
	return context:faction():is_human()
end

local function faction_ministerial_posts_changed(context)
	local faction = context:faction()

	if achievements.agamemnon ~= nil and is_table(achievements.agamemnon) and achievements.agamemnon.ministerial_posts_changed ~= nil and is_table(achievements.agamemnon.ministerial_posts_changed) then
		for achievement, achievement_data in pairs(achievements.agamemnon.ministerial_posts_changed) do
			if is_table(achievement_data) then
				local unlock = true
				for tier, posts in ipairs(achievement_data) do
					if tier ~= nil then
						local posts_taken = cm:politics_get_ministerial_posts(faction:name(), tier, true) or 0
						if posts_taken < posts then
							unlock = false
							break
						end
					end
				end

				if unlock then
					achievement_unlock(faction, achievement)
				end
			else
				output_string("faction_ministerial_posts_changed: no table defined for achievements.agamemnon.ministerial_posts_changed." .. achievement)
			end
		end
	else
		output_string("faction_ministerial_posts_changed: no table defined for achievements.agamemnon.ministerial_posts_changed")
	end
end

local function character_assigned_to_post_filter(context)
	return not context:character():is_null_interface() and not context:character():faction():is_null_interface() and context:character():faction():is_human()
end

local function character_assigned_to_post(context)

	local faction = context:character():faction()
	if faction:is_null_interface() or faction:name() ~= "troy_main_dan_mycenae" then
		return nil
	end

	local character_unit = context:character():commanded_unit()
	if character_unit:is_null_interface() then
		return nil
	end

	if achievements.agamemnon ~= nil and is_table(achievements.agamemnon) and achievements.agamemnon.ministerial_post_to_character ~= nil and is_table(achievements.agamemnon.ministerial_post_to_character) then

		for achievement, achievement_data in pairs(achievements.agamemnon.ministerial_post_to_character) do
			if is_table(achievement_data) then

				local unlock = false
				for key, character_unit_set in pairs(achievement_data.characters_unit_set) do
					if achievement_data.tier == context:tier() and character_unit:belongs_to_unit_set(character_unit_set) then
						unlock = true
						break
					end
				end

				if unlock then
					achievement_unlock(faction, achievement)
				end
			else
				output_string("character_assigned_to_post: no table defined for achievements.agamemnon.ministerial_post_to_character." .. achievement)
			end
		end

	else
		output_string("character_assigned_to_post: no table defined for achievements.agamemnon.ministerial_post_to_character")
	end

end

-- achievements based on foreign slot building complete event
local function foreign_slot_building_complete_event_filter(context)
	return context:slot_owner():is_human()
end


local function foreign_slot_building_complete_event(context)
	local faction = context:slot_owner()
	local building = context:building()

	local func_get_building_key = function(key) return "foreign_slot_building_complete_event_" .. key end

	-- register
	track_achievement_progress(faction, func_get_building_key(building), true)

	if achievements.foreign_slot_building_complete_event ~= nil and is_table(achievements.foreign_slot_building_complete_event) then
		for achievement, achievement_data in pairs(achievements.foreign_slot_building_complete_event) do
			if is_table(achievement_data) then
				local unlock = true
				for building_list, count in pairs(achievement_data) do 
					local total_count = 0
					for index, key in ipairs(building_list) do
						total_count = total_count + track_achievement_progress(faction, func_get_building_key(key), false)
					end

					if total_count < count then
						unlock = false
						break
					end
				end

				if unlock == true then
					achievement_unlock(faction, achievement)
				end
			else
				output_string("faction_ministerial_posts_changed: no table defined for achievements.foreign_slot_building_complete_event." .. achievement)
			end
		end
	else
		output_string("faction_ministerial_posts_changed: no table defined for achievements.foreign_slot_building_complete_event")
	end
end

-- achievements based on unit upgrade event
local function unit_upgraded_filter(context)
	return context:unit():faction():is_human() and not context:unit():has_upgrades() 
end

local function unit_upgraded(context)
	local unit = context:unit()
	local faction = unit:faction()

	-- register
	total_count = track_achievement_progress(faction, "unit_upgraded_max_level", true)

	if achievements.unit_upgraded ~= nil and is_table(achievements.unit_upgraded) and achievements.unit_upgraded.max_tier ~= nil and is_table(achievements.unit_upgraded.max_tier) then
		for achievement, count in pairs(achievements.unit_upgraded.max_tier) do
			if total_count >= count then
 				achievement_unlock(faction, achievement)
				break
			end
		end
	else
		output_string("unit_upgraded: no table defined for achievements.unit_upgraded.max_tier")
	end
end

local function pet_cerberus(context)
	local faction_name = context:trigger():split(":")[2]
	if faction_name ~= "" then
		local faction = cm:get_faction(faction_name)
		if faction ~= nil then
			achievement_unlock(faction, achievements.monsters.pet_cerberus)
		end
	end
end

local function faction_achieved_victory_filter(context)
	return context:faction():is_human()
end

local function faction_achieved_victory(context)

	-- achievement hector_paris_war_declared_turn_one
	local faction = context:faction()
	if faction:name() == "troy_main_trj_hector" or faction:name() == "troy_main_trj_paris" then
		if get_persist_achievement_data(faction, "hector_paris_declared_war_turn_one") then
			achievement_unlock(faction, achievements.campaign_victory.hector_paris_declared_war_turn_one)
		end
	end

	if not get_persist_achievement_data(faction, "has_made_treaties") then
		achievement_unlock(faction, achievements.campaign_victory.win_game_without_treaties)
	end

end

local function faction_turn_end_filter(context)
	return context:faction():is_human()
end

local function faction_turn_end(context)

	local faction = context:faction()
	if faction:name() == odysseus_faction then
		local faction_leader = faction:faction_leader()
		if faction_leader then
			local region = faction_leader:region()
			if region then
				if region:name() == "troy_main_cephallenia_ithaca" and get_persist_achievement_data(faction, odysseus_faction .. "_owned_" .. "troy_main_ilion_troy") then
					achievement_unlock(faction, achievements.odysseus.conquer_troy_and_return_to_ithaca)
				end
			end
		end
	end

end

local function character_ancillary_gained_filter(context)
	return context:character():faction():is_human()
end

local function character_ancillary_gained(context)
	local ancillary = context:ancillary_object()
	local faction = context:character():faction()

	if is_table(achievements.ancillaries) and is_table(achievements.ancillaries.equipped_bodyguards) then
		for achievement_key, achievement_data in pairs(achievements.ancillaries.equipped_bodyguards) do
			if not ancillary:is_null_interface() then
				if ancillary:has_bodyguard_unit(achievement_data.unit_set) then
					achievement_unlock(faction, achievement_key)
				end
			end
		end
	else
		output_string("character_ancillary_gained: no table defined for achievements.ancillaries.equipped_bodyguards")
	end

end

local function callback_ajax_challenge_champion_defeated()
	-- checking whether faction is human probably isn't needed, but just in case
	local ajax_faction = cm:get_faction(ajax_challenge_cofiguration.faction_name)
	if ajax_faction == nil or ajax_faction:is_null_interface() or not ajax_faction:is_human() then
		return
	end

	local total_champions = 0
	for _ in pairs(_ajax_challenge_existing_champions) do
		total_champions = total_champions + 1
	end

	if #_ajax_defeated_champions_global >= total_champions then
		achievement_unlock(ajax_faction, achievements.ajax.champion_challenge.defeat_all_paragons)
	end
end

local function callback_rhesus_spend_devotion(devotion_resource)
	local total_amount = devotion_resource:playthrough_total_expenditure_all()

	local rhesus_faction = cm:get_faction(thracian_rituals.faction_key)
	if not rhesus_faction or rhesus_faction:is_null_interface() or not rhesus_faction:is_human() then
		return
	end

	if is_table(achievements.rhesus) and is_table(achievements.rhesus.spend_devotion) then
		for achievement, amount in pairs(achievements.rhesus.spend_devotion) do
			if total_amount >= amount then
				achievement_unlock(rhesus_faction, achievement)
			end
		end
	else
		output_string("callback_rhesus_spend_devotion: no table defined for achievements.rhesus.spend_devotion")
	end
end

local function callback_rhesus_countless_host_army_created(num_countless_armies_alive)
	local rhesus_faction = cm:get_faction(thracian_rituals.faction_key)
	if not rhesus_faction or rhesus_faction:is_null_interface() or not rhesus_faction:is_human() then
		return
	end

	if is_table(achievements.rhesus) and is_table(achievements.rhesus.num_countless_armies_alive) then
		for achievement, amount in pairs(achievements.rhesus.num_countless_armies_alive) do
			if num_countless_armies_alive >= amount then
				achievement_unlock(rhesus_faction, achievement)
			end
		end
	else
		output_string("callback_rhesus_countless_host_army_created: no table defined for achievements.rhesus.num_countless_armies_alive")
	end
end

local function callback_memnon_unit_created(unit_created)
	if not is_table(achievements.memnon) or not is_table(achievements.memnon.sherden_warriors) then
		output_string("callback_memnon_unit_created: no table defined for achievements.memnon.sherden_warriors")
		return
	end
	if unit_created:unit_key() ~= achievements.memnon.sherden_warriors_key then
		return
	end

	local memnon_faction = cm:get_faction(exotic_strategist.faction_key)
	if not memnon_faction or memnon_faction:is_null_interface() or not memnon_faction:is_human() then
		return
	end

	local num_sherden_warriors_recruited = 1 -- count the current unit because it is not yet in the force

	local forces = memnon_faction:military_force_list()
	local num_forces = forces:num_items()
	for i = 0, num_forces - 1 do
		local force = forces:item_at(i)

		local units = force:unit_list()
		local num_units = units:num_items()
		for j = 0, num_units - 1 do
			local unit = units:item_at(j)
			if unit:unit_key() == achievements.memnon.sherden_warriors_key then
				num_sherden_warriors_recruited = num_sherden_warriors_recruited + 1
			end
		end
	end

	for achievement, amount in pairs(achievements.memnon.sherden_warriors) do
		if num_sherden_warriors_recruited >= amount then
			achievement_unlock(memnon_faction, achievement)
		end
	end
end

local function callback_memnon_capture_bonus_larger_buckets_collected(playthrough_total_larger_buckets_bonus_collected)
	if not is_table(achievements.memnon) or not is_table(achievements.memnon.capture_bonus_larger_buckets_collected) then
		output_string("callback_memnon_capture_bonus_larger_buckets_collected: no table defined for achievements.memnon.capture_bonus_larger_buckets_collected")
		return
	end

	local memnon_faction = cm:get_faction(pharaohs_servant.faction_key)
	if not memnon_faction or memnon_faction:is_null_interface() or not memnon_faction:is_human() then
		return
	end

	for achievement, amount in pairs(achievements.memnon.capture_bonus_larger_buckets_collected) do
		if playthrough_total_larger_buckets_bonus_collected >= amount then
			achievement_unlock(memnon_faction, achievement)
		end
	end
end


-- callbacks

-- achievements based on achilles's mood
local function callback_achilles_mood_changed()
	local faction = cm:model():world():faction_by_key(achilles_faction)

	if faction == nil or faction:is_null_interface() or not faction:is_human() then return end

	local func_get_mood_key = function(mood) return "achilles_mood_" .. mood end
		
	-- 
	track_achievement_progress(faction, func_get_mood_key(troy_achilles_current_mood), true)
	persist_achievement_data(faction, "achilles_current_mood", troy_achilles_current_mood)


	-- mood_diversity
	if achievements.achilles ~= nil and is_table(achievements.achilles) and achievements.achilles.mood_diversity ~= nil and is_table(achievements.achilles.mood_diversity) then
		for achievement, achievement_data in pairs(achievements.achilles.mood_diversity) do
			if is_table(achievement_data) then
				local unlock = true
				for index, mood in ipairs(achievement_data) do
					if track_achievement_progress(faction, func_get_mood_key(mood), false) == 0 then
						unlock = false
						break
					end
				end

				if unlock then
					achievement_unlock(faction, achievement)
				end
			else
				output_string("achilles_mood_changed: no table defined for achievements.achilles.mood_diversity." .. achievement)
			end
		end
	else
		output_string("achilles_mood_changed: no table defined for achievements.achilles.mood_diversity")
	end
end


-- achievements based on benevolence
local function callback_benevolence_finish(faction)
	if faction == nil or faction:is_null_interface() or not faction:is_human() then return end

	if achievements.benevolence ~= nil and is_table(achievements.benevolence) and achievements.benevolence.finish ~= nil and is_table(achievements.benevolence.finish) then
		for achievement, faction_name in pairs(achievements.benevolence.finish) do
			if is_string(faction_name) then
				if faction_name == faction:name() then
					achievement_unlock(faction, achievement)
				end
			else
				output_string("callback_benevolence_finish: no string defined for achievements.benevolence.finish." .. achievement)
			end
		end
	else
		output_string("callback_benevolence_finish: no table defined for achievements.benevolence.finish")
	end
end

-- achievements based on speak_to_the_dead
local function callback_speak_to_the_dead_completed(faction, family_member_cqi)
	if family_member_cqi == nil or not is_number(family_member_cqi) or faction == nil or faction:is_null_interface() or not faction:is_human() then return end

	--
	if track_achievement_progress(faction, "callback_speak_to_the_dead_completed_" .. family_member_cqi, true) == 1 then
		local total_count = track_achievement_progress(faction, "callback_speak_to_the_dead_completed_all", true)
		--
		if achievements.speak_to_the_dead ~= nil and is_table(achievements.speak_to_the_dead) and achievements.speak_to_the_dead.diversity ~= nil and is_table(achievements.speak_to_the_dead.diversity) then
			for achievement, count in pairs(achievements.speak_to_the_dead.diversity) do
				if is_number(count) then
					if total_count >= count then
						achievement_unlock(faction, achievement)
					end
				else
					output_string("callback_speak_to_the_dead_completed: no number defined for achievements.speak_to_the_dead.diversity." .. achievement)
				end
			end
		else
			output_string("callback_speak_to_the_dead_completed: no table defined for achievements.speak_to_the_dead.diversity")
		end
	end
end

local function callback_speak_to_the_dead_entry_unlocked()

	local aeneas_faction = cm:get_faction(Aeneas_faction)
	if aeneas_faction == nil or aeneas_faction:is_null_interface() or not aeneas_faction:is_human() then
		return
	end

	if achievements.speak_to_the_dead ~= nil and is_table(achievements.speak_to_the_dead) and achievements.speak_to_the_dead.unlock_all ~= nil then
		local total_unlocked = 0

		for key, entry in pairs(speak_to_the_dead_entries) do
			if not entry.locked then
				total_unlocked = total_unlocked + 1
			end
		end
	
		if total_unlocked >= #speak_to_the_dead_entries then
			achievement_unlock(aeneas_faction, achievements.speak_to_the_dead.unlock_all)
		end 
	end
end

-- achievements based on barters
local function callback_barter_interrupted(faction, steal)
	if faction == nil or faction:is_null_interface() or not faction:is_human() then return end

	if achievements.barters ~= nil and is_table(achievements.barters) then
		local barters_interrupted = 0
		local defs = nil

		if steal then 
			barters_interrupted = track_achievement_progress(faction, "callback_barters_interrupted_steal", true)
			defs = achievements.barters.steal_agreement
		else
			barters_interrupted = track_achievement_progress(faction, "callback_barters_interrupted_break", true)
			defs = achievements.barters.break_agreement
		end

		if defs ~= nil and is_table(defs) then
			for achievement, count in pairs(defs) do
				if is_number(count) then
					if barters_interrupted >= count then
						achievement_unlock(faction, achievement)
					end
				else
					output_string("callback_barters_interrupted: no number defined for achievements.barters.steal_agreement/break_agreement." .. achievement)
				end
			end
		else
			output_string("callback_barters_interrupted: no table defined for achievements.barters.steal_agreement/break_agreement")
		end
	else
		output_string("callback_barters_interrupted: no table defined for achievements.barters")
	end
end

-- achievements based on feats
local function callback_feat_execute(faction)
	if faction == nil or faction:is_null_interface() or not faction:is_human() then return end

	local total_count = track_achievement_progress(faction, "callback_feat_execute_total", true)
	if achievements.feats ~= nil and is_table(achievements.feats) and achievements.feats.combined ~= nil and is_table(achievements.feats.combined) then
		for achievement, count in pairs(achievements.feats.combined) do
			if is_number(count) then
				if total_count >= count then
					achievement_unlock(faction, achievement)
				end
			else
				output_string("callback_feat_execute: no number defined for achievements.feats.combined." .. achievement)
			end
		end
	else
		output_string("callback_feat_execute: no table defined for achievements.feats.combined")
	end
end

local function callback_monster_captured(faction, monster_key)
	if faction == nil or faction:is_null_interface() or not faction:is_human() then
		return
	end

	if achievements.monsters ~= nil and is_table(achievements.monsters) and achievements.monsters.captured ~= nil and is_table(achievements.monsters.captured) then
		local achievement = achievements.monsters.captured[monster_key]
		if achievement ~= nil then
			achievement_unlock(faction, achievement)
		else
			output_debug_string("callback_monster_captured: achievement not defined for monster: " .. monster_key)
		end
	else
		output_string("callback_monster_captured: no table defined for achievements.monsters.captured")
	end
end

local function callback_monster_quest_battle_completed(faction)
	if faction == nil or faction:is_null_interface() or not faction:is_human() then
		return
	end

	if is_table(achievements.monsters) and is_table(achievements.monsters.battle) then
		for achievement, turn_completion in pairs(achievements.monsters.battle) do
			if turn_completion >= cm:model():turn_number() then
				achievement_unlock(faction, achievement)
			end
		end
	else
		output_string("callback_monster_captured: no table defined for achievements.monsters.battle")
	end
end

local function callback_hector_trojan_alliance_level_changed(new_level)

	local hector_faction = cm:get_faction(hector_faction)
	if hector_faction == nil or hector_faction:is_null_interface() or not hector_faction:is_human() then
		return
	end

	if achievements.hector ~= nil and is_table(achievements.hector) and achievements.hector.trojan_alliance ~= nil and is_table(achievements.hector.trojan_alliance) then
		for achievement, trojan_alliance_level in pairs(achievements.hector.trojan_alliance) do
			if new_level >= trojan_alliance_level then
				achievement_unlock(hector_faction, achievement)
			end
		end
	else
		output_string("callback_hector_trojan_alliance_level_changed: no table defined for achievements.hector.trojan_alliance")
	end
end

local function callback_penthesilea_capture_bonuses_captured(faction_key, captured_bonus_god_key)
	
	local faction = cm:get_faction(faction_key)
	if faction == nil or faction:is_null_interface() or not faction:is_human() then
		return
	end

	-- this system will be used for other factions as well so we have to check for penthesilea
	if faction_key == "troy_amazons_trj_penthesilea" then
		-- add god as already "gained"
		persist_achievement_data(faction, "penthesilea_captured_bonus_god_" .. captured_bonus_god_key, true)

		if achievements.penthesilea ~= nil and is_table(achievements.penthesilea) and achievements.penthesilea.capture_bonuses ~= nil and is_table(achievements.penthesilea.capture_bonuses) then
			for achievement, gods in pairs(achievements.penthesilea.capture_bonuses) do
				-- check if all required gods are "gained"
				if is_table(gods) then
					local unlock = true
					for key, god_key in pairs(gods) do
						if not get_persist_achievement_data(faction, "penthesilea_captured_bonus_god_" .. god_key) then
							unlock = false
							break
						end
					end
		
					if unlock then
						achievement_unlock(faction, achievement)
					end
				end
			end
		else
			output_string("callback_penthesilea_capture_bonuses_captured: no table defined for achievements.penthesilea.capture_bonuses")
		end
	end
end

local function callback_blood_markers_add_blood_totem(battle)
	local human_factions_data = get_battle_human_winners(battle)

	if #human_factions_data > 0 then
		if is_table(achievements.blood_markers) then
			for index, human_faction_data in ipairs(human_factions_data) do
				achievement_unlock(human_faction_data.faction, achievements.blood_markers.blood_totem_added)
			end
		end
	end

end

local function callback_blood_markers_add_blood_river(battle)
	local human_factions_data = get_battle_human_winners(battle)

	if #human_factions_data > 0 then
		if is_table(achievements.blood_markers) then
			for index, human_faction_data in ipairs(human_factions_data) do
				achievement_unlock(human_faction_data.faction, achievements.blood_markers.blood_river_added)
			end
		end
	end
end

local function achievements_init()
	output_debug_string("init")

	research_completed_achievements_init()

	-- callbacks setup
	achievements.achilles.func_mood_changed = callback_achilles_mood_changed
	achievements.benevolence.func_finish = callback_benevolence_finish
	achievements.speak_to_the_dead.func_speak_completed = callback_speak_to_the_dead_completed
	achievements.speak_to_the_dead.func_entry_unlocked = callback_speak_to_the_dead_entry_unlocked
	achievements.barters.func_barter_interrupted = callback_barter_interrupted
	achievements.feats.func_execute = callback_feat_execute
	achievements.monsters.func_monster_captured = callback_monster_captured
	achievements.monsters.func_monster_quest_battle_completed = callback_monster_quest_battle_completed
	achievements.hector.func_trojan_alliance_level_changed = callback_hector_trojan_alliance_level_changed
	achievements.penthesilea.func_capture_bonuses_captured = callback_penthesilea_capture_bonuses_captured
	achievements.blood_markers.func_add_blood_totem = callback_blood_markers_add_blood_totem
	achievements.blood_markers.func_add_blood_river = callback_blood_markers_add_blood_river
	achievements.ajax.func_challenge_champion_defeated = callback_ajax_challenge_champion_defeated
	achievements.rhesus.func_spend_devotion = callback_rhesus_spend_devotion
	achievements.rhesus.func_countless_host_army_created = callback_rhesus_countless_host_army_created
	achievements.memnon.func_memnon_unit_created = callback_memnon_unit_created
	achievements.memnon.func_memnon_capture_bonus_larger_buckets_collected = callback_memnon_capture_bonus_larger_buckets_collected
end

-- characters rank up
core:add_listener (
	"troy_campaign_achievements_character_rank_up",
	"CharacterRankUp",
	character_rank_up_achievement_filter,
	character_rank_up_achievement,
	true
)

--technologies
core:add_listener (
	"troy_campaign_achievements_research_completed",
	"ResearchCompleted",
	research_completed_achievement_filter,
	research_completed_achievement,
	true
)

-- characters created
core:add_listener (
	"troy_campaign_achievements_character_created",
	"CharacterCreated",
	character_created_achievement_filter,
	character_created_achievement,
	true
)

-- character performed successful agent action
core:add_listener (
	"troy_campaign_achievements_character_performed_successful_agent_action",
	"CharacterPerformedSuccessfulAgentAction",
	character_performed_successful_agent_action_achievement_filter,
	character_performed_successful_agent_action_achievement,
	true
)

-- attitude tier for god
core:add_listener (
	"troy_campaign_achievements_god_attitude_tier_change",
	"FactionGodAttitudeTierChange",
	god_attitude_tier_change_achievement_filter,
	god_attitude_tier_change_achievement,
	true
)

-- region faction change event
core:add_listener (
	"troy_campaign_achievements_region_faction_change_event",
	"RegionFactionChangeEvent",
	region_faction_change_event_filter,
	region_faction_change_event,
	true
)

-- faction destroys other faction
core:add_listener (
	"troy_campaign_achievements_faction_destroys_other_faction",
	"FactionDestroysOtherFaction",
	faction_destroys_other_faction_filter,
	faction_destroys_other_faction,
	true
)

-- positive diplomatic event
core:add_listener(
	"troy_campaign_achievements_positive_diplomatic_event",
	"PositiveDiplomaticEvent",
	positive_diplomatic_event_filter,
	positive_diplomatic_event,
	true
)

-- negative diplomatic event
core:add_listener(
	"troy_campaign_achievements_negative_diplomatic_event",
	"NegativeDiplomaticEvent",
	negative_diplomatic_event_filter,
	negative_diplomatic_event,
	true
)

-- barter ticked event
core:add_listener(
	"troy_campaign_achievements_barter_ticked_event",
	"FactionBarterAgreementTicked",
	barter_ticked_event_filter,
	barter_ticked_event,
	true
)

-- faction turn start
core:add_listener(
	"troy_campaign_achievements_faction_turn_start",
	"FactionTurnStart",
	faction_turn_start_filter,
	faction_turn_start,
	true
)

-- faction ministerial posts changed
core:add_listener(
	"troy_campaign_achievements_faction_ministerial_posts_changed", 
	"FactionMinisterialPostsChanged", 
	faction_ministerial_posts_changed_filter,
	faction_ministerial_posts_changed,
	true)

-- faction ministerial posts changed
core:add_listener(
	"troy_campaign_achievements_character_assigned_to_post", 
	"CharacterAssignedToPost", 
	character_assigned_to_post_filter,
	character_assigned_to_post,
	true)

-- foreign slot building complete event
core:add_listener(
	"troy_campaign_achievements_foreign_slot_building_complete_event", 
	"ForeignSlotBuildingCompleteEvent", 
	foreign_slot_building_complete_event_filter,
	foreign_slot_building_complete_event,
	true)

-- unit upgraded
core:add_listener(
	"troy_campaign_achievements_unit_upgraded_event", 
	"UnitUpgraded", 
	unit_upgraded_filter,
	unit_upgraded,
	true)

-- pet cerberus event
core:add_listener(
	"troy_campaign_achievements_pet_cerberus_event",
	"UITriggerScriptEvent",
	function(context)
		local trgr = context:trigger()
		if not trgr then
			return false
		end
		return string.find(tostring(trgr), "AchievementPetCerberus") ~= nil
	end,
	pet_cerberus,
	true
)

-- battle comppleted event
core:add_listener(
	"troy_campaign_achievements_faction_achieved_victory_event", 
	"FactionAchievedVictoryEvent", 
	faction_achieved_victory_filter,
	faction_achieved_victory,
	true
)

-- faction turn end event
core:add_listener(
	"troy_campaign_achievements_faction_turn_end_event", 
	"FactionTurnEnd", 
	faction_turn_end_filter,
	faction_turn_end,
	true
)

-- character ancillary gained event
core:add_listener(
	"troy_campaign_achievements_character_ancillary_gained_event", 
	"CharacterAncillaryGained", 
	character_ancillary_gained_filter,
	character_ancillary_gained,
	true
)

--
achievements_init()