out("Loading phar_achievements_config.lua")

achievements = {
	-- achievements based on Sea People Invasion
	sea_peoples_invasion = {
		survive_sea_peoples_invasion_key = "phar_main_ach_survive_sea_people",
	},

	-- achievements based on completed missions
	mission_succeeded = {

		by_mission_key = {

			phar_main_ach_ult_victory_ramesses = {
				missions = { "phar_main_campaign_victory_ultimate_ramesses" },
			},

			phar_main_ach_ult_victory_seti = {
				missions = { "phar_main_campaign_victory_ultimate_seti" },
			},

			phar_main_ach_ult_victory_tausret = {
				missions = { "phar_main_campaign_victory_ultimate_tausret" },
			},

			phar_main_ach_ult_victory_amenmesse = {
				missions = { "phar_main_campaign_victory_ultimate_amenmesse" },
			},

			phar_main_ach_ult_victory_irsu = {
				missions = { "phar_main_campaign_victory_ultimate_irsu" },
			},

			phar_main_ach_ult_victory_bay = {
				missions = { "phar_main_campaign_victory_ultimate_bay" },
			},

			phar_main_ach_ult_victory_suppiluliuma = {
				missions = { "phar_main_campaign_victory_ultimate_suppiluliuma" },
			},

			phar_main_ach_ult_victory_kurunta = {
				missions = { "phar_main_campaign_victory_ultimate_kurunta" },
			},

			phar_sea_ach_ult_victory_iolaos = {
				missions = { "phar_sea_campaign_victory_ultimate_sherden" },
			},

			phar_sea_ach_ult_victory_walwetes = {
				missions = { "phar_sea_campaign_victory_ultimate_peleset" },
			},

		},

	},

	-- achievements based on campaign victory
	campaign_victory = {
		win_game_without_treaties = "phar_main_ach_no_treaty",
	},

	-- achievements based on diplomacy
	diplomacy = {
		defeat_two_old_allies_bay = "phar_main_ach_bay_backstab",
		acquire_four_vassals_bay = "phar_main_ach_bay_vassals",

		military_allies_with = {
			phar_sea_ach_sea_people_coalition = {
				play_with_factions = { "phar_sea_sherden", "phar_sea_peleset" }, -- player has to be playing with one of the listed factions
				allied_with_factions = { "phar_sea_denyen",
										"phar_sea_ekwesh",
										"phar_sea_lukka",
										"phar_sea_peleset",
										"phar_sea_shekelesh",
										"phar_sea_sherden",
										"phar_sea_teresh",
										"phar_sea_tjeker",
										"phar_sea_weshesh" },
			},
		},

		make_peace_with = {
			phar_sea_ach_sea_diplomat = {
				play_with_factions = { "phar_sea_sherden", "phar_sea_peleset" },
				factions_to_ignore_prefix = "phar_sea",
				count = 5,
			}
		},
	},

	-- achievements based on vassalising
	vassalise_factions = {
		phar_main_ach_taus_vassal_seti = {
			play_with_faction = "phar_main_tausret",
			vassalised_faction = "phar_main_seti",
		},
	},

	-- achievements based on destroying other factions
	destroy_factions = {
		phar_main_ach_amen_kill_seti = {
			play_with_faction = "phar_main_amenmesse",
			destroyed_faction = "phar_main_seti",
		},
		phar_main_ach_seti_kill_amenmesse = {
			play_with_faction = "phar_main_seti",
			destroyed_faction = "phar_main_amenmesse",
		},
		phar_main_ach_kur_kill_suppi = {
			play_with_faction = "phar_main_kurunta",
			destroyed_faction = "phar_main_suppiluliuma",
		},
		phar_main_ach_sup_kill_kurunta = {
			play_with_faction = "phar_main_suppiluliuma",
			destroyed_faction = "phar_main_kurunta",
			by_turn = 25,
		},
	},

	-- achievements based on gaining pooled resources
	gain_pooled_resources = {
		phar_main_ach_irsu_gold = {
			play_with_faction = "phar_main_irsu",
			resource_key = "troy_gold",
			resource_value = 20000,
		},
	},

	-- achievements based on getting bad attitude from their whole subculture
	bad_attitude_from_their_whole_subculture = {
		phar_main_ach_kur_hate_hittite = {
			play_with_faction = "phar_main_kurunta",
			attitude_threshold = -25, -- -40 is the start of the unfriendliness attitude
		},
	},

	-- achievements based on being at war with the a list of major factions
	at_war_with_major_factions = {
		phar_main_ach_seti_war_egypt = {
			play_with_faction = "phar_main_seti",
			factions_list = {"phar_main_amenmesse", "phar_main_ramesses", "phar_main_tausret", "phar_main_merneptah", "phar_main_setnakhte"},
		},
	},

	-- achievements based on controlling all ports of one port type
	control_all_ports = {
		phar_main_ach_amen_conquer_nile = {
			play_with_faction = "phar_main_amenmesse",
			port_template_key = "phar_main_port_nile",
		},
	},

	-- achievements based on winning a co-op game
	win_coop_game = {
		phar_main_ach_taus_seti_coop = {
			first_faction = "phar_main_seti",
			second_faction = "phar_main_tausret",
		},
	},

	-- achievements based on razing a number of settlements
	raze_settlements = {
		phar_main_ach_irsu_raze_cult_centre = {
			faction = { "phar_main_irsu" },
			slot_template_key_prefix = "phar_main_major_poc_",
			count = 5,
			version = 0, -- DON'T TOUCH THIS
		},
		phar_sea_ach_pleasures_of_war = {
			faction = { "phar_sea_sherden", "phar_sea_peleset" }, -- player has to be playing with one of the listed factions
			slot_template_key_prefix = "phar_main_",
			count = 10,
			only_track_spoils_of_war = true;
		},
		phar_sea_ach_sea_prevail = {
			faction = { "phar_sea_sherden", "phar_sea_peleset" },
			slot_template_key_prefix = "phar_main_",
			count = 25,
		},
		phar_sea_ach_isul_reigns = {
			faction = { "phar_sea_sherden", "phar_sea_peleset" },
			slot_template_key_prefix = "phar_main_",
			count = 50,
		},
	},

	-- achievements based on occupying a number of ERSs (the occupation_decision could either be "occupation_decision_ers_raze_without_occupy" or "occupation_decision_ers_sack")
	occupy_ers = {
		phar_main_ach_irsu_raze_ers = {
			play_with_faction = "phar_main_irsu",
			occupation_decision = "occupation_decision_ers_raze_without_occupy",
			count = 20, 
		},
	},

	-- achievements based on battles
	battle = {
		win = { -- win battle
			phar_main_ach_ram_sea_people = {
				faction = { "phar_main_ramesses" }, -- player has to be playing with one of the listed factions
				losing_faction_culture = "phar_main_clt_sea_peoples", -- losing faction has to be part of this culture
				number_of_battles_won = 8,  -- player has to win this number of battles
			},
			phar_main_ach_battle_fire = {
				evaluate_state_func = function(human_faction_data, battle, battle_results)
					return human_faction_data.is_attacker and not battle:autoresolve_selected() and battle_results:burnt_buildings_in_battle_number() >= 350 
				end,
			},
		},
	},

	-- achievements based on having a number of provinces, each with a minimum growth
	have_provinces = {
		phar_main_ach_sup_province_growth = {
			play_with_faction = "phar_main_suppiluliuma",
			count = 8, 
			minimum_growth = 70, 
		},
	},

	-- achievements based on winning a game while in a specific civilization level (Maat state)
	win_game_with_specific_civilization_level = {
		phar_main_ach_maat_collapse = {
			civilization_level = "collapse",
		},
		phar_main_ach_maat_prosper = {
			civilization_level = "prosperity",
		},
		phar_main_ach_maat_crisis = {
			civilization_level = "crisis",
		},
	},

	-- achievements based on surviving a certain amount of turns with specific conditions
	survive_certain_amount = {
		with_specific_civilization_level = {
			phar_sea_ach_others_demise = {
				faction = { "phar_sea_sherden", "phar_sea_peleset" }, -- player has to be playing with one of the listed factions
				civilization_level = "collapse",
				turn_count = 20,
			},
		},

		with_specific_tribal_category = {
			phar_sea_ach_tribal_unity = {
				tribe_categories = { "phar_sea_effect_bundle_town_privileges_herdsmen", "phar_sea_effect_bundle_town_privileges_farmers", "phar_sea_effect_bundle_town_privileges_raiders", "phar_sea_effect_bundle_town_privileges_craftsmen" },
				turn_count = 25,
			},

			phar_sea_ach_tribal_excellence = {
				tribe_categories = { "phar_sea_effect_bundle_town_privileges_shepherds", "phar_sea_effect_bundle_town_privileges_agriculturalists", "phar_sea_effect_bundle_town_privileges_ravagers", "phar_sea_effect_bundle_town_privileges_artisans" },
				turn_count = 20,
			},
		},
	},

	-- achievements based on triggering eminence options
	trigger_eminence_options = {
		display_of_power = {
			phar_sea_ach_display_of_power = {
				trigger_count = 3,
			},
		},
		obedience = {
			phar_sea_ach_obedience = {
				trigger_count = 3,
			},
		},
		change_allegiance = {
			phar_sea_ach_change_allegiance = {
				trigger_count = 3,
			},
		},
		raze_and_exterminate = {
			phar_sea_ach_raze_and_exterminate = {
				trigger_count = 3,
			},
		},
	},

	-- achievements based on becoming a great king or a pharaoh
	become_great_king_or_pharaoh = {
		phar_main_ach_ram_become_pharaoh = {
			play_with_faction = "phar_main_ramesses",
			become_pharaoh = true,
		},
		phar_main_ach_seti_become_pharaoh = {
			play_with_faction = "phar_main_seti",
			become_pharaoh = true,
		},
		phar_main_ach_become_pharaoh = {
			become_pharaoh = true,
		},
		phar_main_ach_become_great_king = {
			become_pharaoh = false,
		},
	},

	-- achievements based gaining an ancillary
	gain_ancillary = {
		phar_main_ach_ram_pschent = {
			play_with_faction = "phar_main_ramesses",
			ancillary_key = "phar_main_crown_pschent",
		},
	},

	-- achievements based completing a number of ambitions
	complete_ambitions = {
		phar_main_ach_ambitions = {
			count = 20, 
		},
	},

	-- achievements based on assigning a number of princes in Tudhaliya ancient legacy
	assign_princes = {
		phar_main_ach_al_tudhaliya_princes = {
			count = 5, 
		},
	},

	-- achievements based on discovering realms
	discover_realms = {
		phar_main_ach_discover_realms_all = {
		},
		phar_main_ach_discover_realms_canaan = {
			realm_name_prefix = "canaanite",
		},
		phar_main_ach_discover_realms_hatti = {
			realm_name_prefix = "hittite",
		},
		phar_main_ach_discover_realms_egypt = {
			realm_name_prefix = "egyptian",
		},
	},

	-- achievements based on trading with every realm with Hatshepsut's Ancient Legacy
	have_trades_hatshepsut = {
		phar_main_ach_al_hatshepsut_realms = {
		},
	},

	-- achievements based on capturing Amarna (Akhetaten) cult centre with Akhenaten's ancient legacy
	capture_amarna_akhenaten = {
		phar_main_ach_al_akhenaten_amarna = {
		},
	},

	-- achievements based on completing every wonder-building with Khufu's Ancient Legacy
	complete_wonders_khufu = {
		phar_main_ach_al_khufu_all_wonders = {
		},
	},

	-- achievements based on conquering a settlement with the Thutmose's Ancient Legacy using every action type action (sabotage, support, and balanced)
	conquer_settlements_with_each_action_type_thutmose = {
		phar_main_ach_al_thutmose_conquest = {
		},
	},

	-- achievements based on conquering settlements
	conquer_settlements = {
		-- achievements based on conquering certain number of settlements
		conquer_specific_number_of_settlements = {
			phar_sea_ach_settled_horde = {
				faction = { "phar_sea_sherden", "phar_sea_peleset" }, -- player has to be playing with one of the listed factions
				count = 1,
			},
		},

		-- achievements based on conquering specific settlements as a faction to create their historical homeland
		conquer_specific_settlements = {
			phar_sea_ach_philistia = {
				play_with_faction = "phar_sea_peleset",
				settlements_to_conquer = { "phar_main_megiddo_yapo", "phar_main_megiddo_megiddo", "phar_main_ashkelon_ashkelon", "phar_main_ashkelon_urushalim" },
			},
		},
	},

	-- achievements based on losing settlements
	lose_settlements = {
		-- achievements based on losing all settlements
		lose_all_settlements = {
			phar_sea_ach_to_the_sea = {
				play_with_factions = { "phar_sea_sherden", "phar_sea_peleset" },
				requires_horde_force = true
			},
		},
	},

	-- achievement based on building tribal outpost in every outpost slot in a foreign or razed province (not owned)
	become_sea_nomad_as_sea_peoples_faction = {
		phar_sea_ach_sea_people_nomad = {
			faction = { "phar_sea_sherden", "phar_sea_peleset" }, -- player has to be playing with one of the listed factions
			nomad_outpost_ers_building_set = "phar_sea_nomad_ers"
		},
	},

	-- achievements based on having a number of vassals whole gratitude is maxed out with Muwatalli's Ancient Legacy
	vassals_maxed_out_gratitude_muwatalli = {
		phar_main_ach_al_muwatalli_vassals = {
			count = 3, 
		},
	},

	-- achievements based on reaching max tier for a number of local deities gods
	reach_gods_max_tier = {
		phar_main_ach_al_akhenaten_max = {
			god_keys = { "aten" }, -- You can only set god_key when count isn't defined
		},
		phar_main_ach_local_deities_max_2 = {
			count = 2,
		},
		phar_main_ach_local_deities_max_3 = {
			count = 3,
		},
		phar_sea_ach_hail_the_sherden_gods = {
			play_with_faction = "phar_sea_sherden",
			god_keys = { "alpanu", "isul", "larun" },
		},
		phar_sea_ach_hail_the_peleset_gods = {
			play_with_faction = "phar_sea_peleset",
			god_keys = { "kuvava", "levs", "alpanu" },
		},
	},

	-- achievements based on force annexation another faction
	force_annex_faction = {
		phar_main_ach_sup_annex_kurunta	= {
			play_with_faction = "phar_main_suppiluliuma",
			annexed_faction_key = "phar_main_kurunta",
		},
	},

	-- achievements based on using Corvee Labour to develop a number of settlements
	use_corvee_labour = {
		phar_main_ach_taus_corvee_labour = {
			play_with_faction = "phar_main_tausret",
			count = 1,
		},
	},

	-- achievements based on gaining court positions
	gain_court_positions = {
		phar_main_ach_bay_court_full = {
			play_with_faction = "phar_main_bay",
			court_name = "egyptian_court", -- Possible value "hittite_court" or "egyptian_court" or don't court_name to remove the constraint
			become_great_king = false,
			become_pharaoh = true,
			fill_all_positions = true, -- Instead you can define "count" for the number of positions required
		},
		phar_main_ach_kur_court_full = {
			play_with_faction = "phar_main_kurunta",
			court_name = "hittite_court", -- Possible value "hittite_court" or "egyptian_court" or don't court_name to remove the constraint.
			become_great_king = true,
			become_pharaoh = false,
			fill_all_positions = true, -- Instead you can define "count" for the number of positions required
		},
	},

	-- achievements based on using a number of intrigues in a specific court
	use_court_intrigue = {
		phar_main_ach_bay_court_hittites = {
			play_with_faction = "phar_main_bay",
			court_name = "hittite_court", -- Possible value "hittite_court" or "egyptian_court"
			count = 10, 
		},
	},

	-- achievements based on using a number of court actions
	use_court_actions = {
		phar_main_ach_taus_court = {
			play_with_faction = "phar_main_tausret",
			count = 10, 
		},
	},


	-- achievements based on confederating a number of factions
	confederate_factions = {
		phar_main_ach_amen_conf_any_faction = {
			play_with_faction = "phar_main_amenmesse",
			count = 5, 
		},
	},

}
