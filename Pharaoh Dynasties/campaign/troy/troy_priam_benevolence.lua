out("Loading troy_priam_benevolence.lua")

priam_benevolence_hector_faction_key = "troy_main_trj_hector"
priam_benevolence_paris_faction_key = "troy_main_trj_paris"
priam_benevolence_troy_faction_key = "troy_main_trj_troy"

priam_benevolence_troy_region_key = "troy_main_ilion_troy"
priam_benevolence_priam_forename_key = "428032053"

priam_benevolence_pooled_resource_key = "troy_priam_benevolence"
priam_benevolence_factor_faction_key = "troy_resource_factor_faction"

priam_benevolence_on_finish_remove_bundles = {
	hector = "effect_bundle_hero_trait_hector",
	paris = "effect_bundle_hero_trait_paris"
}

priam_benevolence_number_of_objectives_to_swap_on_milestone_reached = 2

priam_benevolence_missions = {
	troy_sieged = { mission_key = "troy_main_fm_priam_troy_under_siege", benevolence_reward = 30 },	-- The payload is the provided amount of benevolence.
	first_turn_to_issue_mission = 5,
	mission_keys = { 
		"troy_main_fm_priam_mission_alliance_small",
		"troy_main_fm_priam_mission_buildings_happiness_level_3",
		"troy_main_fm_priam_mission_buildings_happiness_level_4",
		"troy_main_fm_priam_mission_buildings_influence_level_3",
		"troy_main_fm_priam_mission_buildings_influence_level_4",
		"troy_main_fm_priam_mission_buildings_religion_aphrodite_2",
		"troy_main_fm_priam_mission_buildings_religion_aphrodite_3",
		"troy_main_fm_priam_mission_buildings_religion_aphrodite_4",
		"troy_main_fm_priam_mission_buildings_religion_apollo_2",
		"troy_main_fm_priam_mission_buildings_religion_apollo_3",
		"troy_main_fm_priam_mission_buildings_religion_apollo_4",
		"troy_main_fm_priam_mission_buildings_religion_ares_2",
		"troy_main_fm_priam_mission_buildings_religion_ares_3",
		"troy_main_fm_priam_mission_buildings_religion_ares_4",
		"troy_main_fm_priam_mission_buildings_religion_athena_2",
		"troy_main_fm_priam_mission_buildings_religion_athena_3",
		"troy_main_fm_priam_mission_buildings_religion_athena_4",
		"troy_main_fm_priam_mission_buildings_religion_hera_2",
		"troy_main_fm_priam_mission_buildings_religion_hera_3",
		"troy_main_fm_priam_mission_buildings_religion_hera_4",
		"troy_main_fm_priam_mission_buildings_religion_poseidon_2",
		"troy_main_fm_priam_mission_buildings_religion_poseidon_3",
		"troy_main_fm_priam_mission_buildings_religion_poseidon_4",
		"troy_main_fm_priam_mission_buildings_religion_zeus_2",
		"troy_main_fm_priam_mission_buildings_religion_zeus_3",
		"troy_main_fm_priam_mission_buildings_religion_zeus_4",
		"troy_main_fm_priam_mission_conquest_large",
		"troy_main_fm_priam_mission_conquest_large_far",
		"troy_main_fm_priam_mission_conquest_medium",
		"troy_main_fm_priam_mission_conquest_medium_far",
		"troy_main_fm_priam_mission_conquest_small",
		"troy_main_fm_priam_mission_conquest_small_far",
		"troy_main_fm_priam_mission_defeat_hero_high_rank",
		"troy_main_fm_priam_mission_defeat_hero_large",
		"troy_main_fm_priam_mission_defeat_hero_medium",
		"troy_main_fm_priam_mission_defeat_hero_small",
		--"troy_main_fm_priam_mission_move_to_troy_hector",
		--"troy_main_fm_priam_mission_move_to_troy_paris",
		"troy_main_fm_priam_mission_raze_or_sack_large",
		"troy_main_fm_priam_mission_raze_or_sack_medium",
		"troy_main_fm_priam_mission_raze_or_sack_small",
		"troy_main_fm_priam_mission_recruit_chariots",
		"troy_main_fm_priam_mission_recruit_chariots_large",
		"troy_main_fm_priam_mission_recruit_myth_centaur_2_archers",
		"troy_main_fm_priam_mission_recruit_myth_centaur_2_outrider",
		"troy_main_fm_priam_mission_recruit_myth_centaur_3_champion",
		"troy_main_fm_priam_mission_recruit_myth_centaur_3_elder",
		"troy_main_fm_priam_mission_recruit_myth_giant_2_bowmen",
		"troy_main_fm_priam_mission_recruit_myth_giant_2_warriors",
		"troy_main_fm_priam_mission_recruit_myth_giant_3_champions",
		--"troy_main_fm_priam_mission_recruit_myth_knossos",
		"troy_fm_priam_mission_buildings_religion_artemis_2",
		"troy_fm_priam_mission_buildings_religion_artemis_3",
		"troy_fm_priam_mission_buildings_religion_artemis_4",
		"troy_hep_fm_priam_mission_buildings_religion_hephaestus_2",
		"troy_hep_fm_priam_mission_buildings_religion_hephaestus_3",
		"troy_hep_fm_priam_mission_buildings_religion_hephaestus_4",
		"troy_mth_fm_priam_mission_recruit_myth_centaur_2_archers",
		"troy_mth_fm_priam_mission_recruit_myth_centaur_2_outrider",
		"troy_mth_fm_priam_mission_recruit_myth_centaur_3_champion",
		"troy_mth_fm_priam_mission_recruit_myth_centaur_3_elder",
		"troy_mth_fm_priam_mission_recruit_myth_giant_2_bowmen",
		"troy_mth_fm_priam_mission_recruit_myth_giant_2_warriors",
		"troy_mth_fm_priam_mission_recruit_myth_giant_3_champions",
		--"troy_mth_fm_priam_mission_recruit_myth_knossos"
	}
}

priam_benevolence_mission_type_title_key  = {
	troy_sieged = "campaign_localised_strings_string_troy_main_fm_priam_benevolence_missions_troy_sieged",
	mission_keys = "campaign_localised_strings_string_troy_main_fm_priam_benevolence_missions_priam_whims"
}

priam_benevolence_objectives = {
	[1] = {
		callbacks = "gain_favour_with_apollo",
		apollo_attitude_pooled_resource_key = "troy_god_attitude_apollo",
		apollo_attitude_per_benevolence_point = 5,	-- The value for a positive attitude. The value for a negative attitude is the inverse.

		-- Set used_for_* to true if you want this objective to be active for the respective brother upon campaign start.
		used_for_hector = true,
		used_for_paris = true,

		conditions_strings_args = {
			[1] = {1, 5}
		}
	},

	[2] = {
		callbacks = "build_armies",
		character_type = "general",
		army_units_threshold = 10,
		character_rank_threshold = 10,
		benevolence_per_army = 5,
		benevolence_per_character = 5,

		-- Set used_for_* to true if you want this objective to be active for the respective brother upon campaign start.
		used_for_hector = false,
		used_for_paris = false,

		conditions_strings_args = {
			[1] = {5, 10},
			[2] = {5, 10}
		}
	},

	[3] = {
		callbacks = "complete_quest",
		quest_stages_hector = {
			troy_main_epic_hector_step_1_mission = { benevolence = 10 },
			troy_main_epic_hector_step_2_mission = { benevolence = 10 },
			troy_main_epic_hector_step_3_mission = { benevolence = 10 },
			troy_main_epic_hector_step_4_mission = { benevolence = 10 },
			troy_main_epic_hector_step_7_mission = { benevolence = 10 },
			troy_main_epic_hector_step_8_mission = { benevolence = 10 },
			troy_main_epic_hector_step_11_mission = { benevolence = 10 }
		},
		quest_stages_paris = {
			troy_main_epic_paris_step_1_mission = { benevolence = 10 },
			troy_main_epic_paris_step_3_mission = { benevolence = 10 },
			troy_main_epic_paris_step_4_mission = { benevolence = 10 },
			troy_main_epic_paris_step_5_mission = { benevolence = 10 },
			troy_main_epic_paris_step_6_mission = { benevolence = 10 },
			troy_main_epic_paris_step_7_mission = { benevolence = 10 },
			troy_main_epic_paris_step_9_mission = { benevolence = 10 },
			troy_main_epic_paris_step_11_mission = { benevolence = 10 }
		},
		allowed_to_deactivate_for_hector = false,
		allowed_to_deactivate_for_paris = false,

		-- Set used_for_* to true if you want this objective to be active for the respective brother upon campaign start.
		used_for_hector = true,
		used_for_paris = true,

		conditions_strings_args = {
			[1] = {10}
		}
	},

	[4] = {
		callbacks = "fighting_achaeans",
		enemy_subculture_key = "troy_main_sbc_danaan_achaeans",
		include_military_allies_of_enemy = true,
		benevolence_per_battle_with_non_faction_leader = 1,	-- The value for a victory. The value for a loss is the inverse.
		benevolence_per_battle_with_faction_leader = 3,		-- The value for a victory. The value for a loss is the inverse.

		-- Set used_for_* to true if you want this objective to be active for the respective brother upon campaign start.
		used_for_hector = true,
		used_for_paris = true,

		conditions_strings_args = {
			[1] = {1},
			[2] = {3},
			[3] = {-1},
			[4] = {-3}
		}
	},

	[5] = {
		callbacks = "conquer_the_adriatic_sea",
		province_keys_granting_benevolence = { "troy_main_lemnos", "troy_main_zerynthia_nesoi", "troy_main_lesbos", "troy_main_ophioussa", "troy_main_sporades", "troy_main_epagris", "troy_main_syrmata", "troy_main_cyclades" },
		benevolence_per_region = 5,

		-- Set used_for_* to true if you want this objective to be active for the respective brother upon campaign start.
		used_for_hector = false,
		used_for_paris = false,

		conditions_strings_args = {
			[1] = {5},
		}
	},

	[6] = {
		callbacks = "support_your_brother",
		benevolence_per_victory = 2,
		benevolence_per_destroyed_faction = 10,
		declaring_war_on_brother = -30,

		-- Set used_for_* to true if you want this objective to be active for the respective brother upon campaign start.
		used_for_hector = true,
		used_for_paris = true,

		conditions_strings_args = {
			[1] = {2},
			[2] = {10},
			[3] = {-30},
		}
	},

	[7] = {
		callbacks = "provide_for_the_people",
		requires_ownership_of_whole_province = false,
		resource_key = "troy_food",
		resource_income_threshold = 400,
		happiness_threshold = 20,
		benevolence_per_resource_income_province = 10,	-- The value for a province over the threshold. The value for a province under the inverse threshold is the inverse.
		benevolence_per_happiness_province = 10,		-- The value for a province over the threshold. The value for a province under the inverse threshold is the inverse.
		is_enabled_for_positive_value = true,			-- Enables or disables the effect of the objective for positive income of resource and happiness
		is_enabled_for_negative_value = false,			-- Enables or disables the effect of the objective for negative income of resource and happiness

		-- Set used_for_* to true if you want this objective to be active for the respective brother upon campaign start.
		used_for_hector = true,
		used_for_paris = true,

		conditions_strings_args = {
			[1] = {10, 400},
			[2] = {10, 20},
			--[3] = {-10, 10},
			--[4] = {-10, -10},
		}
	},

	[8] = {
		callbacks = "build_relations",
		subculture_keys_granting_benevolence = { "troy_main_sbc_trojan_leleges", "troy_main_sbc_trojan_maeonians", "troy_main_sbc_trojan_pelasgians", "troy_main_sbc_trojan_thracians" },
		diplomatic_attitude_threshold = 100,
		benevolence_per_relation = 5,

		-- Set used_for_* to true if you want this objective to be active for the respective brother upon campaign start.
		used_for_hector = false,
		used_for_paris = false,

		conditions_strings_args = {
			[1] = {5, 100}
		}
	},

	[9] = {
		callbacks = "gifts_to_troy",
		gift_resource_key = "troy_gold",
		gift_amount_per_benevolence_point = 50,
		gift_total_by_hector = 0,
		gift_total_by_paris = 0,

		-- Set used_for_* to true if you want this objective to be active for the respective brother upon campaign start.
		used_for_hector = true,
		used_for_paris = true,

		conditions_strings_args = {
			[1] = {1, 50},
			[2] = {}
		}
	},

	[10] = {
		callbacks = "crush_the_enemy",
		enemy_subculture_key = "troy_main_sbc_danaan_achaeans",
		benevolence_per_enemy_settlement = 2,
		special_settlement_region_keys = { "troy_main_mycenaeca_mycenae" },
		benevolence_per_special_settlement = 50,

		-- Set used_for_* to true if you want this objective to be active for the respective brother upon campaign start.
		used_for_hector = false,
		used_for_paris = false,

		conditions_strings_args = {
			[1] = {2},
			[2] = {50},
		}
	},

	[11] = {
		callbacks = "build_palaces",
		requires_province_capital = true,
		buildings = {
			troy_main_trj_settlement_major_3 = { benevolence = 2, previous_building = nil },
			troy_main_trj_settlement_major_4 = { benevolence = 3, previous_building = "troy_main_trj_settlement_major_3" },
			troy_main_trj_settlement_major_5 = { benevolence = 5, previous_building = "troy_main_trj_settlement_major_4" },
			troy_main_trj_settlement_major_sea_3 = { benevolence = 2, previous_building = nil },
			troy_main_trj_settlement_major_sea_4 = { benevolence = 3, previous_building = "troy_main_trj_settlement_major_sea_3" },
			troy_main_trj_settlement_major_sea_5 = { benevolence = 5, previous_building = "troy_main_trj_settlement_major_sea_4" }
		},

		-- Set used_for_* to true if you want this objective to be active for the respective brother upon campaign start.
		used_for_hector = false,
		used_for_paris = false,

		conditions_strings_args = {
			[1] = {2},
			[2] = {5},
			[3] = {10},
		}
	},

	[12] = {
		callbacks = "spread_your_agents",
		character_types = { "dignitary", "champion", "spy" },
		character_rank_threshold = 8,
		benevolence_per_character = 5,

		-- Set used_for_* to true if you want this objective to be active for the respective brother upon campaign start.
		used_for_hector = false,
		used_for_paris = false,

		conditions_strings_args = {
			[1] = {5, 8},
		}
	}
}

priam_benevolence_milestones = {
	[1] = {
		callbacks = "give_general",
		required_benevolence = 100,
		reward_faction_leader_trait = { trait = "troy_main_fm_hector_paris_milestone_won", points = 1 },
		reward_general = {
			agent_type = "general",	agent_subtype = "troy_fighter_killer", rank = 8,
			name_key = "names_name_75345994", surname_key = "", clan_name_key = "", other_name_key = "",
			is_male = true, age = 20, is_immortal = false,
			traits = {
				[1] = { trait = "troy_main_trait_lone_wolf", points = 1 },
				[2] = { trait = "troy_trait_loyalty_servile", points = 1 },
				[3] = { trait = "troy_main_trait_homeric", points =1 }
			},
			army = { "troy_trojan_militia" }	-- Array of units. Must NOT be empty!
		}
	},

	[2] = {
		callbacks = "give_general",
		required_benevolence = 200,
		reward_faction_leader_trait = { trait = "troy_main_fm_hector_paris_milestone_won", points = 1 },
		reward_general = {
			agent_type = "general",	agent_subtype = "troy_defender_quick", rank = 10,
			name_key = "names_name_198653942", surname_key = "", clan_name_key = "", other_name_key = "",
			is_male = true, age = 20, is_immortal = false,
			traits = {
				[1] = { trait = "troy_main_trait_defending_victory", points = 10 },
				[2] = { trait = "troy_trait_loyalty_valorous", points = 1 }
			},
			army = { "troy_trojan_militia" }	-- Array of units. Must NOT be empty!
		}
	},

	[3] = {
		callbacks = "give_general",
		required_benevolence = 300,
		reward_faction_leader_trait = { trait = "troy_main_fm_hector_paris_milestone_won", points = 1 },
		reward_general = {
			agent_type = "general",	agent_subtype = "troy_warlord_tactician", rank = 12,
			name_key = "names_name_1118261946", surname_key = "", clan_name_key = "", other_name_key = "",
			is_male = true, age = 20, is_immortal = false,
			traits = {
				[1] = { trait = "troy_main_trait_wins", points = 4 },
				[2] = { trait = "troy_trait_loyalty_trooper", points = 1 }
			},
			army = { "troy_trojan_militia" }	-- Array of units. Must NOT be empty!
		}
	},

	[4] = {
		callbacks = "confederate_troy_and_other_brother",
		required_benevolence = 400,
		reward_faction_leader_trait = { trait = "troy_main_fm_priam_race_winner", points = 1 },
		is_final = true	-- The milestone with the lowest required benevolence that is marked as final will signal the end of the race.
	}
}

priam_benevolence_sabotages = {
	[1] = {
		callbacks = "accusation_of_greed",
		required_resources_amount_surplus = 300,
		tooltip_args = {300},
		resource = "troy_gold",

		value = -10,
		cooldown = 10
	},

	[2] = {
		callbacks = "accusation_of_weakness",
		value = -10,
		cooldown = 10,
		tooltip_args = {}
	},

	[3] = {
		callbacks = "test_of_skills",
		value = -10,
		cooldown = 10,
		tooltip_args = {}
	}
}

-- How much benevolence the player loses if they raid Troy's regions
priam_benevolence_loss_raiding = -30

priam_benevolence_ai = {
	-- The mean amount of benevolence gained per round would be the target value, divided by the number of rounds to achieve it.
	[1] = {
		target_value = 430,
		final_round_target = 135,
		final_round_spread = 5,
		per_round_spread = 2,
		per_round_post_target = 10
	},

	[2] = {
		target_value = 430,
		final_round_target = 120,
		final_round_spread = 5,
		per_round_spread = 2,
		per_round_post_target = 10
	},

	[3] = {
		target_value = 430,
		final_round_target = 105,
		final_round_spread = 5,
		per_round_spread = 2,
		per_round_post_target = 10
	},

	[4] = {
		target_value = 430,
		final_round_target = 90,
		final_round_spread = 5,
		per_round_spread = 2,
		per_round_post_target = 10
	},

	[5] = {
		target_value = 430,
		final_round_target = 75,
		final_round_spread = 5,
		per_round_spread = 2,
		per_round_post_target = 10
	}
}

priam_benevolence_human_and_ai_brothers = {
	war_between_brothers = {
		dilemmas = {
			[1] = { rounds_at_war = 1, dilemma_key = "troy_main_fm_priam_brothers_fighting", peace_choice = 0 },
			[2] = { rounds_at_war = 2, dilemma_key = "troy_main_fm_priam_brothers_fighting_again", peace_choice = 0, war_with_troy_choice = 1 }
		},
		declare_war_incident = { rounds_at_war = 3, incident_key = "troy_fm_priam_war_on_both_brothers" },	-- In case of war of that amount of rounds or greater, war is declared automatically.
		disable_war_for_ai_brother_turns = 10,	-- Number of turns that war would be disabled for the AI brother after a forceful peace between the two brothers.
		enable_war_for_ai_brother_at_turn = 0,	-- The turn at which war would be enabled again for the AI brother again. If set to a positive number, the AI brother won't be able to declare war until that turn.
		rounds_at_war = 0
	},

	not_participating = {
		required_ai_benevolence_lead = 100,
		dilemma_keys_for_hector = { "troy_main_fm_priam_gift", "troy_main_fm_priam_help_paris" },
		dilemma_keys_for_paris = { "troy_main_fm_priam_gift", "troy_main_fm_priam_help_hector" },
		cooldown = 20
	},

	priam_benevolence_sabotage_penalty = {
		effect_bundle_key = "effect_bundle_fm_priam_brothers_hate",
		effect_for_hector_key = "troy_effect_faction_diplomacy_paris",
		effect_for_paris_key = "troy_effect_faction_diplomacy_paris",
		scope = "faction_to_faction_own_unseen",
		val_effect = -20,
		increase_per_use = -10,
		bundle_duration = 6
	}
}

-- UI element names for the faction mechanic.
priam_benevolence_ui = {
	root_panel = "fm_priams_benevolence",
	objectives = {
		root = "list_objectives",
		list = "list_box",
		template = "objective_template",
		button = "objective_row_button",
		title = "dy_objective_title",
		benevolence = { box = "benevolence_count", states = { to_be_replaced = "to_be_replaced", not_to_be_replaced = "not_to_be_replaced" }, number = "dy_benevolence" },
		conditions = { list = "objective_conditions", template = "condition_template" }
	},
	bar = {
		root = "benevolence_bar_holder",
		hector = "bar_hector",
		paris = "bar_paris",
		milestones = {id = "milestone_", states = {available = "available", hector = "hector", paris = "paris"}},
		other_brother_tooltip = "campaign_localised_strings_string_troy_main_fm_priam_benevolence_other_brother"
	},
	treachery = {
		list = "treachery_button_list",
		template = "treachery_button_template",
		cooldown = "cooldown",
		icons = {
			accusation_of_greed = "ui/skins/default/icon_accuse_of_greed.png ",
			accusation_of_weakness = "ui/skins/default/icon_accuse_of_weakness.png ",
			test_of_skills = "ui/skins/default/icon_pull_rank.png "
		}
	},
	missions = {
		root = "priam_whim_listview",
		list = "list_box",
		template = "mission_template",
		mission_type = "tx_mission_type",
		mission_completed = "tx_mission_completed",
		mission_button = "mission_button",
		mission_details = "mission_details"
	},
	background = {
		root = "background",
		states = {
			hector = "hector_wins",
			paris = "paris_wins",
			war = "priam_war",
			enemy = "troy_fallen",
		}
	}
}

priam_benevolence_factors = {
	sabotages = "troy_main_fm_priam_obj_sabotage_factor",
	missions = "troy_main_fm_priam_obj_missions_factor",
	dilemmas = "troy_main_fm_priam_obj_events_factor",
	objectives = function(objective) return "troy_main_fm_priam_obj_" .. objective.callbacks .. "_factor" end
}

priam_benevolence_event_feed_messages = {
	benevolence_gained = {
		title = "event_feed_strings_text_troy_main_fm_priam_event_message_title",
		primary_detail = "event_feed_strings_text_troy_main_fm_priam_event_message_benevolence_gain_primary_details",
		sec_detail = {
			fighting_achaeans = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_fighting_achaeans_title",
			gifts_to_troy = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_gifts_to_troy_title",
			complete_quest = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_complete_quest_title",
			gain_favour_with_apollo = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_gain_favour_with_apollo_title",
			conquer_the_adriatic_sea = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_conquer_the_aegean_sea_title",
			support_your_brother = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_support_your_brother_title",
			provide_for_the_people = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_provide_for_the_people_title",
			build_relations = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_build_relations_title",
			build_armies = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_build_armies_title",
			crush_the_enemy = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_crush_the_enemy_title",
			build_palaces = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_build_palaces_title",
			spread_your_agents = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_spread_your_agents_title",
		},
		event_pic = 1070,
		args = {}, -- up to 3 numeric arguments
		not_on_screen = true
	},

	benevolence_lost = {
		title = "event_feed_strings_text_troy_main_fm_priam_event_message_title",
		primary_detail = "event_feed_strings_text_troy_main_fm_priam_event_message_benevolence_lost_primary_details",
		sec_detail = {
			fighting_achaeans = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_fighting_achaeans_title",
			gifts_to_troy = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_gifts_to_troy_title",
			complete_quest = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_complete_quest_title",
			gain_favour_with_apollo = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_gain_favour_with_apollo_title",
			conquer_the_adriatic_sea = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_conquer_the_aegean_sea_title",
			support_your_brother = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_support_your_brother_title",
			provide_for_the_people = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_provide_for_the_people_title",
			build_relations = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_build_relations_title",
			build_armies = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_build_armies_title",
			crush_the_enemy = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_crush_the_enemy_title",
			build_palaces = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_build_palaces_title",
			spread_your_agents = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_spread_your_agents_title",
		},
		event_pic = 1071,
		args = {}, -- up to 3 numeric arguments
		not_on_screen = true
	},

	benevolence_brother_gained = {
		title = "event_feed_strings_text_troy_main_fm_priam_event_message_title",
		primary_detail = "event_feed_strings_text_troy_main_fm_priam_event_message_benevolence_gain_primary_details",
		sec_detail = {
			fighting_achaeans = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_fighting_achaeans_title",
			gifts_to_troy = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_gifts_to_troy_title",
			complete_quest = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_complete_quest_title",
			gain_favour_with_apollo = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_gain_favour_with_apollo_title",
			conquer_the_adriatic_sea = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_conquer_the_aegean_sea_title",
			support_your_brother = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_support_your_brother_title",
			provide_for_the_people = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_provide_for_the_people_title",
			build_relations = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_build_relations_title",
			build_armies = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_build_armies_title",
			crush_the_enemy = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_crush_the_enemy_title",
			build_palaces = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_build_palaces_title",
			spread_your_agents = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_spread_your_agents_title",
		},
		event_pic = 1059,
		args = {}, -- up to 3 numeric arguments
		not_on_screen = true
	},

	benevolence_brother_lost = {
		title = "event_feed_strings_text_troy_main_fm_priam_event_message_title",
		primary_detail = "event_feed_strings_text_troy_main_fm_priam_event_message_benevolence_lost_primary_details",
		sec_detail = {
			fighting_achaeans = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_fighting_achaeans_title",
			gifts_to_troy = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_gifts_to_troy_title",
			complete_quest = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_complete_quest_title",
			gain_favour_with_apollo = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_gain_favour_with_apollo_title",
			conquer_the_adriatic_sea = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_conquer_the_aegean_sea_title",
			support_your_brother = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_support_your_brother_title",
			provide_for_the_people = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_provide_for_the_people_title",
			build_relations = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_build_relations_title",
			build_armies = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_build_armies_title",
			crush_the_enemy = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_crush_the_enemy_title",
			build_palaces = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_build_palaces_title",
			spread_your_agents = "ui_text_replacements_localised_text_troy_main_fm_priam_obj_spread_your_agents_title",
		},
		event_pic = 1060,
		args = {}, -- up to 3 numeric arguments
		not_on_screen = true
	},

	benevolence_changed = {
		title = "event_feed_strings_text_troy_main_fm_priam_event_message_title",
		primary_detail = "event_feed_strings_text_troy_main_fm_priam_event_message_benevolence_changed_primary_details",
		sec_detail = "event_feed_strings_text_troy_event_feed_string_all_null", -- handled in db (this param is not used),
		event_pic = 1069,
		args = {}, -- up to 3 numeric arguments
		not_on_screen = true
	},

	milestone_won_troy_main_trj_hector = {
		title = "event_feed_strings_text_troy_main_fm_priam_event_message_title",
		primary_detail = "event_feed_strings_text_troy_main_fm_priam_event_message_milestone_won_primary_details",
		sec_detail = "event_feed_strings_text_troy_event_feed_string_all_null", -- handled in db (this param is not used),
		event_pic = 1053,
		args = {} -- up to 3 numeric arguments
	},

	milestone_won_troy_main_trj_paris = {
		title = "event_feed_strings_text_troy_main_fm_priam_event_message_title",
		primary_detail = "event_feed_strings_text_troy_main_fm_priam_event_message_milestone_won_primary_details",
		sec_detail = "event_feed_strings_text_troy_event_feed_string_all_null", -- handled in db (this param is not used),
		event_pic = 1093,
		args = {} -- up to 3 numeric arguments
	},

	milestone_lost_troy_main_trj_hector = {
		title = "event_feed_strings_text_troy_main_fm_priam_event_message_title",
		primary_detail = "event_feed_strings_text_troy_main_fm_priam_event_message_milestone_lost_primary_details",
		sec_detail = "event_feed_strings_text_troy_event_feed_string_all_null", -- handled in db (this param is not used),
		event_pic = 1054,
		args = {} -- up to 3 numeric arguments
	},

	milestone_lost_troy_main_trj_paris = {
		title = "event_feed_strings_text_troy_main_fm_priam_event_message_title",
		primary_detail = "event_feed_strings_text_troy_main_fm_priam_event_message_milestone_lost_primary_details",
		sec_detail = "event_feed_strings_text_troy_event_feed_string_all_null", -- handled in db (this param is not used),
		event_pic = 1094,
		args = {} -- up to 3 numeric arguments
	},

	milestone_tied = {
		title = "event_feed_strings_text_troy_main_fm_priam_event_message_title",
		primary_detail = "event_feed_strings_text_troy_main_fm_priam_event_message_benevolence_tied_primary_details",
		sec_detail = "event_feed_strings_text_troy_event_feed_string_all_null", -- handled in db (this param is not used),
		event_pic = 1081,
		args = {} -- up to 3 numeric arguments
	},

	race_over_win_troy_main_trj_hector = {
		title = "event_feed_strings_text_troy_main_fm_priam_event_message_title",
		primary_detail = "event_feed_strings_text_troy_main_fm_priam_event_message_race_won_primary_details",
		sec_detail = "event_feed_strings_text_troy_event_feed_string_all_null", -- handled in db (this param is not used),
		event_pic = 1061,
		args = {} -- up to 3 numeric arguments
	},

	race_over_win_troy_main_trj_paris = {
		title = "event_feed_strings_text_troy_main_fm_priam_event_message_title",
		primary_detail = "event_feed_strings_text_troy_main_fm_priam_event_message_race_won_primary_details",
		sec_detail = "event_feed_strings_text_troy_event_feed_string_all_null", -- handled in db (this param is not used),
		event_pic = 1084,
		args = {} -- up to 3 numeric arguments
	},

	race_over_lost_by_brother_troy_main_trj_hector = {
		title = "event_feed_strings_text_troy_main_fm_priam_event_message_title",
		primary_detail = "event_feed_strings_text_troy_main_fm_priam_event_message_race_lost_primary_details",
		sec_detail = "event_feed_strings_text_troy_event_feed_string_all_null", -- handled in db (this param is not used),
		event_pic = 1083,
		args = {} -- up to 3 numeric arguments
	},

	race_over_lost_by_brother_troy_main_trj_paris = {
		title = "event_feed_strings_text_troy_main_fm_priam_event_message_title",
		primary_detail = "event_feed_strings_text_troy_main_fm_priam_event_message_race_lost_primary_details",
		sec_detail = "event_feed_strings_text_troy_event_feed_string_all_null", -- handled in db (this param is not used),
		event_pic = 1062,
		args = {} -- up to 3 numeric arguments
	},

	race_over_lost_by_enemy_troy_main_trj_hector = {
		title = "event_feed_strings_text_troy_main_fm_priam_event_message_title",
		primary_detail = "event_feed_strings_text_troy_main_fm_priam_event_message_race_lost_by_enemy_primary_details",
		sec_detail = "event_feed_strings_text_troy_event_feed_string_all_null", -- handled in db (this param is not used),
		event_pic = 1086,
		args = {} -- up to 3 numeric arguments
	},

	race_over_lost_by_enemy_troy_main_trj_paris = {
		title = "event_feed_strings_text_troy_main_fm_priam_event_message_title",
		primary_detail = "event_feed_strings_text_troy_main_fm_priam_event_message_race_lost_by_enemy_primary_details",
		sec_detail = "event_feed_strings_text_troy_event_feed_string_all_null", -- handled in db (this param is not used),
		event_pic = 1092,
		args = {} -- up to 3 numeric arguments
	},

	raiding_troy_benevolence_loss = {
		title = "event_feed_strings_text_troy_main_fm_priam_event_message_title",
		primary_detail = "event_feed_strings_text_troy_main_fm_priam_raiding_troy_benevolence_loss_primary_details",
		sec_detail = "event_feed_strings_text_troy_event_feed_string_all_null", -- handled in db (this param is not used),
		event_pic = 1082,
		args = {} -- up to 3 numeric arguments
	},

	sabotage_accusation_of_greed_source = {
		title = "event_feed_strings_text_troy_main_fm_priam_event_message_title",
		primary_detail = "event_feed_strings_text_troy_main_fm_priam_event_message_sabotage_greedy_primary_details",
		sec_detail = "event_feed_strings_text_troy_event_feed_string_all_null", -- handled in db (this param is not used),
		event_pic = 1066,
		args = {} -- up to 3 numeric arguments
	},

	sabotage_accusation_of_greed_target = {
		title = "event_feed_strings_text_troy_main_fm_priam_event_message_title",
		primary_detail = "event_feed_strings_text_troy_main_fm_priam_event_message_sabotage_greedy_primary_details",
		sec_detail = "event_feed_strings_text_troy_event_feed_string_all_null", -- handled in db (this param is not used),
		event_pic = 1072,
		args = {} -- up to 3 numeric arguments
	},

	sabotage_accusation_of_weakness_source = {
		title = "event_feed_strings_text_troy_main_fm_priam_event_message_title",
		primary_detail = "event_feed_strings_text_troy_main_fm_priam_event_message_sabotage_wounded_primary_details",
		sec_detail = "event_feed_strings_text_troy_event_feed_string_all_null", -- handled in db (this param is not used),
		event_pic = 1067,
		args = {} -- up to 3 numeric arguments
	},

	sabotage_accusation_of_weakness_target = {
		title = "event_feed_strings_text_troy_main_fm_priam_event_message_title",
		primary_detail = "event_feed_strings_text_troy_main_fm_priam_event_message_sabotage_wounded_primary_details",
		sec_detail = "event_feed_strings_text_troy_event_feed_string_all_null", -- handled in db (this param is not used),
		event_pic = 1073,
		args = {} -- up to 3 numeric arguments
	},

	sabotage_test_of_skills_source = {
		title = "event_feed_strings_text_troy_main_fm_priam_event_message_title",
		primary_detail = "event_feed_strings_text_troy_main_fm_priam_event_message_sabotage_rank_primary_details",
		sec_detail = "event_feed_strings_text_troy_event_feed_string_all_null", -- handled in db (this param is not used),
		event_pic = 1068,
		args = {} -- up to 3 numeric arguments
	},

	sabotage_test_of_skills_target = {
		title = "event_feed_strings_text_troy_main_fm_priam_event_message_title",
		primary_detail = "event_feed_strings_text_troy_main_fm_priam_event_message_sabotage_rank_primary_details",
		sec_detail = "event_feed_strings_text_troy_event_feed_string_all_null", -- handled in db (this param is not used),
		event_pic = 1074,
		args = {} -- up to 3 numeric arguments
	},

	troy_burns = {
		title = "event_feed_strings_text_troy_main_fm_priam_event_message_title",
		primary_detail = "event_feed_strings_text_troy_main_fm_priam_event_message_troy_burns_primary_details",
		sec_detail = "event_feed_strings_text_troy_event_feed_string_all_null", -- handled in db (this param is not used),
		event_pic = 1098,
		args = {} -- up to 3 numeric arguments
	}
}

-- index_in_sec_detail must be nil if sec_detail is static string for the selected event (instead of table for some events)
-- param1, param2, param3 are optional. If they are just configuration, set them in priam_benevolence_event_feed_messages[<id>].args
function priam_benevolence_trigger_event(faction_key, event_id, index_in_sec_detail, param1, param2, param3)
	local event = priam_benevolence_event_feed_messages[event_id]

	local event_title = event.title
	local primary_detail = event.primary_detail
	local secondary_detail = not index_in_sec_detail and event.sec_detail or event.sec_detail[index_in_sec_detail] -- if sec_detail is static for the selected event or it is a table
	local event_pic = event.event_pic
	param1 = param1 or event.args[1]
	param2 = param2 or event.args[2]
	param3 = param3 or event.args[3]

	if event.not_on_screen == true then
		cm:show_configurable_message_event(faction_key, event_title, primary_detail, secondary_detail, event_pic, param1, param2, param3)
	else
		cm:show_message_event(faction_key, event_title, primary_detail, secondary_detail, true, event_pic, nil, nil, true, param1, param2, param3)
	end
end

function priam_benevolence_is_brother_faction(faction_name)
	return faction_name == priam_benevolence_hector_faction_key or faction_name == priam_benevolence_paris_faction_key
end

function priam_benevolence_get_brother_name(faction_name)
	if faction_name == priam_benevolence_hector_faction_key then
		return "hector"
	elseif faction_name == priam_benevolence_paris_faction_key then
		return "paris"
	else
		return nil
	end
end

function priam_benevolence_get_other_brother_faction_name(faction_name)
	if faction_name == priam_benevolence_hector_faction_key then
		return priam_benevolence_paris_faction_key
	elseif faction_name == priam_benevolence_paris_faction_key then
		return priam_benevolence_hector_faction_key
	else
		return nil
	end
end

function priam_benevolence_get_other_brother_faction(faction_name)
	local other_brother_faction_name = priam_benevolence_get_other_brother_faction_name(faction_name)
	return cm:model():world():faction_by_key(other_brother_faction_name)
end

function priam_benevolence_get_faction_name_by_brother_name(brother_name)
	if brother_name == "hector" then
		return priam_benevolence_hector_faction_key
	elseif brother_name == "paris" then
		return priam_benevolence_paris_faction_key
	else
		return nil
	end
end

function priam_benevolence_are_both_brothers_alive(brother_faction, other_brother_faction)
	brother_faction = brother_faction and brother_faction or cm:model():world():faction_by_key(priam_benevolence_hector_faction_key)
	other_brother_faction = other_brother_faction and other_brother_faction or priam_benevolence_get_other_brother_faction(brother_faction:name())
	return not brother_faction:is_dead() and not other_brother_faction:is_dead()
end

function priam_benevolence_is_other_brother_winning(brother_faction_name)
	local final_milestone = table_find(priam_benevolence_milestones, function(milestone) return milestone.is_final end)
	if final_milestone then
		local brother_faction = cm:get_faction(brother_faction_name)
		local other_brother_faction = priam_benevolence_get_other_brother_faction(brother_faction:name())
		local brother_benevolence, other_brother_benevolence = brother_faction:pooled_resource(priam_benevolence_pooled_resource_key):value(), other_brother_faction:pooled_resource(priam_benevolence_pooled_resource_key):value()
		if other_brother_benevolence > brother_benevolence and other_brother_benevolence >= final_milestone.required_benevolence then
			return true, other_brother_faction:faction_leader()
		end
	end
	return false
end

function priam_benevolence_missions_on_turn_start(faction)
	local faction_name = faction:name()
	local active_mission_for_key = "active_mission_for_" .. priam_benevolence_get_brother_name(faction_name)
	if not priam_benevolence_missions[active_mission_for_key] then
		local indices = {}
		for i = 1, #priam_benevolence_missions.mission_keys do
			if not (cm:get_campaign_name() == "troy_historical" and string.find(priam_benevolence_missions.mission_keys[i],"myth")) then
				table.insert(indices, i)
			end
		end
		indices = cm:random_sort(indices)
		for i = 1, #indices do
			if cm:trigger_mission(faction_name, priam_benevolence_missions.mission_keys[indices[i]], true) then
				priam_benevolence_missions[active_mission_for_key] = priam_benevolence_missions.mission_keys[indices[i]]
				break
			end
		end
	end
end

function priam_benevolence_missions_start(faction)
	local faction_name = faction:name()
	local active_mission_for_key = "active_mission_for_" .. priam_benevolence_get_brother_name(faction_name)
	core:add_listener(
		"priam_benevolence_missions_faction_turn_start_event_" .. faction_name,
		"FactionTurnStart",
		function(context) return context:faction():name() == faction_name and faction:model():turn_number() >= priam_benevolence_missions.first_turn_to_issue_mission end,
		function(context) priam_benevolence_missions_on_turn_start(faction) end,
		true
	)

	core:add_listener(
		"priam_benevolence_missions_mission_succeeded_event_" .. faction_name,
		"MissionSucceeded",
		function(context) return context:faction():name() == faction_name and context:mission():mission_record_key() == priam_benevolence_missions[active_mission_for_key] end,
		function(context) priam_benevolence_missions[active_mission_for_key] = nil end,
		true
	)

	core:add_listener(
		"priam_benevolence_missions_mission_failed_event_" .. faction_name,
		"MissionFailed",
		function(context) return context:faction():name() == faction_name and context:mission():mission_record_key() == priam_benevolence_missions[active_mission_for_key] end,
		function(context) priam_benevolence_missions[active_mission_for_key] = nil end,
		true
	)

	core:add_listener(
		"priam_benevolence_missions_mission_cancelled_event_" .. faction_name,
		"MissionCancelled",
		function(context) return context:faction():name() == faction_name and context:mission():mission_record_key() == priam_benevolence_missions[active_mission_for_key] end,
		function(context) priam_benevolence_missions[active_mission_for_key] = nil end,
		true
	)
end

function priam_benevolence_missions_stop(faction)
	local faction_name = faction:name()
	core:remove_listener("priam_benevolence_missions_faction_turn_start_event_" .. faction_name)
	core:remove_listener("priam_benevolence_missions_mission_succeeded_event_" .. faction_name)
	core:remove_listener("priam_benevolence_missions_mission_failed_event_" .. faction_name)
	core:remove_listener("priam_benevolence_missions_mission_cancelled_event_" .. faction_name)

	local active_mission_for_key = "active_mission_for_" .. priam_benevolence_get_brother_name(faction_name)
	if priam_benevolence_missions[active_mission_for_key] then
		cm:cancel_mission(faction_name, priam_benevolence_missions[active_mission_for_key])
		priam_benevolence_missions[active_mission_for_key] = nil
	end
end

function priam_benevolence_listen_for_troy_siege_change(faction_name)
	core:add_listener(
		"priam_benevolence_troy_siege_mission_succeeded_event_" .. faction_name,
		"MissionSucceeded",
		function(context) return context:faction():name() == faction_name and context:mission():mission_record_key() == priam_benevolence_missions.troy_sieged.mission_key end,
		function(context)
			core:remove_listener("priam_benevolence_troy_siege_ended_event_" .. faction_name)
		end,
		false
	)

	core:add_listener(
		"priam_benevolence_troy_siege_ended_event_" .. faction_name,
		"CharacterEndsBesiegingSettlement",
		function(context) return context:region():name() == priam_benevolence_troy_region_key end,
		function(context)
			core:remove_listener("priam_benevolence_troy_siege_mission_succeeded_event_" .. faction_name)
			cm:cancel_mission(faction_name, priam_benevolence_missions.troy_sieged.mission_key)
		end,
		false
	)
end

function priam_benevolence_missions_troy_siege_start(faction_name, sieging_force_cqi)
	local key = "for_" .. faction_name
	local payload = "faction_pooled_resource_transaction{resource " .. priam_benevolence_pooled_resource_key .. ";factor " .. priam_benevolence_factor_faction_key .. ";amount " .. tostring(priam_benevolence_missions.troy_sieged.benevolence_reward) .. ";}"
	priam_benevolence_missions.troy_sieged[key] = mission_manager:new(faction_name, priam_benevolence_missions.troy_sieged.mission_key)
	priam_benevolence_missions.troy_sieged[key]:add_new_objective("ENGAGE_FORCE")
	priam_benevolence_missions.troy_sieged[key]:add_condition("cqi " .. tostring(sieging_force_cqi))
	priam_benevolence_missions.troy_sieged[key]:add_condition("requires_victory")
	priam_benevolence_missions.troy_sieged[key]:add_payload(payload);
	priam_benevolence_missions.troy_sieged[key]:trigger()

	priam_benevolence_listen_for_troy_siege_change(faction_name)
end

priam_benevolence_objectives_metatable = {
	fighting_achaeans = {
		activate = function(objective, faction)
			core:add_listener(
				"priam_benevolence_fighting_achaeans_event_" .. faction:name(),
				"BattleConflictFinished",
				true,	-- As the logic that determines the awarded benevolence includes whether the event should be handled, always fire the target callback and let it handle everything.
				function(context)
					local battle = context:pending_battle()
					local faction_name = faction:name()
					local attacker_faction, defender_faction = battle:attacker_faction(), battle:defender_faction()
					local is_attacker_brother, is_defender_brother = attacker_faction:name() == faction_name, defender_faction:name() == faction_name
					local secondary_attackers = battle:secondary_attackers()
					local secondary_defenders = battle:secondary_defenders()

					for i = 0 , secondary_attackers:num_items() - 1 do
						local curr_secondary_attacker = secondary_attackers:item_at(i)
						if curr_secondary_attacker and not curr_secondary_attacker:is_null_interface() and curr_secondary_attacker:faction():name() == faction_name then
							is_attacker_brother = true
							break
						end
					end

					for i = 0 , secondary_defenders:num_items() - 1 do
						local curr_secondary_defender = secondary_defenders:item_at(i)
						if curr_secondary_defender and not curr_secondary_defender:is_null_interface() and curr_secondary_defender:faction():name() == faction_name then
							is_defender_brother = true
							break
						end
					end

					local calculate_fighting_achaeans_based_benevolence = function(brother_result, enemy, enemy_character)
						local is_enemy_achaeans_or_their_ally = enemy:subculture() == objective.enemy_subculture_key
						if not is_enemy_achaeans_or_their_ally and objective.include_military_allies_of_enemy then
							local enemy_military_allies = enemy:factions_military_alliance_with()
							for i = 0, enemy_military_allies:num_items() - 1 do
								if enemy_military_allies:item_at(i):subculture() == objective.enemy_subculture_key then
									is_enemy_achaeans_or_their_ally = true
									break
								end
							end
						end
						if is_enemy_achaeans_or_their_ally then
							local benevolence = objective.benevolence_per_battle_with_non_faction_leader
							if enemy_character and enemy_character:is_faction_leader() then
								benevolence = objective.benevolence_per_battle_with_faction_leader
							end
							if brother_result:ends_with("victory") then
								return benevolence
							else
								return -benevolence
							end
						else
							return 0
						end
					end
					local awarded_benevolence = 0
					if is_attacker_brother then
						awarded_benevolence = calculate_fighting_achaeans_based_benevolence(battle:attacker_battle_result(), defender_faction, battle:has_defender() and battle:defender())
						-- as requested by design, these now stack if reinforcements are eligable to provide benevolance for this objective
						for i = 0, secondary_defenders:num_items() - 1 do
							local curr_secondary_defender = secondary_defenders:item_at(i)
							if curr_secondary_defender and not curr_secondary_defender:is_null_interface() then
								awarded_benevolence = awarded_benevolence + calculate_fighting_achaeans_based_benevolence(battle:attacker_battle_result(), curr_secondary_defender:faction(), curr_secondary_defender)
							end
						end
					elseif is_defender_brother then
						awarded_benevolence = calculate_fighting_achaeans_based_benevolence(battle:defender_battle_result(), attacker_faction, battle:has_attacker() and battle:attacker())
						-- as requested by design, these now stack if reinforcements are eligable to provide benevolance for this objective
						for i = 0, secondary_attackers:num_items() - 1 do
							local curr_secondary_attacker = secondary_attackers:item_at(i)
							if curr_secondary_attacker and not curr_secondary_attacker:is_null_interface() then
								awarded_benevolence = awarded_benevolence + calculate_fighting_achaeans_based_benevolence(battle:attacker_battle_result(), curr_secondary_attacker:faction(), curr_secondary_attacker)
							end
						end
					end
					if awarded_benevolence ~= 0 then
						objective:award_benevolence(faction:name(), awarded_benevolence)
					end
				end,
				true
			)
		end,

		deactivate = function(objective, faction)
			core:remove_listener("priam_benevolence_fighting_achaeans_event_" .. faction:name())
		end
	},

	gifts_to_troy = {
		save = function(objective, save_to_objective)
			local save_for_brother = function(brother_name)
				save_to_objective["gift_total_by_" .. brother_name] = objective["gift_total_by_" .. brother_name]
			end
			save_for_brother("hector")
			save_for_brother("paris")
		end,

		load = function(objective, load_from_objective)
			local load_for_brother = function(brother_name)
				local key = "gift_total_by_" .. brother_name
				objective[key] = load_from_objective[key] and load_from_objective[key] or objective[key]
			end
			load_for_brother("hector")
			load_for_brother("paris")
		end,

		activate = function(objective, faction)
			-- Helper function for calculating gifts based benevolence, as it may grant negative values.
			local calculate_gifts_to_troy_based_benevolence = function(gift_total, gift_amount_per_benevolence_point)
				if gift_total >= 0 then
					return math.floor(gift_total / gift_amount_per_benevolence_point)
				else
					return -math.floor(-gift_total / gift_amount_per_benevolence_point)
				end
			end

			local faction_name = faction:name()
			local brother_name = priam_benevolence_get_brother_name(faction_name)
			local key = "gift_total_by_" .. brother_name
			core:add_listener(
				"priam_benevolence_gifts_to_troy_positive_diplomatic_event_" .. faction_name,
				"PositiveDiplomaticEvent",
				function(context) return context:is_gift() and context:character():faction():name() == faction_name end,
				function(context)
					local resources = nil
					if context:proposer():name() == faction_name and context:recipient():name() == priam_benevolence_troy_faction_key then
						resources = context:single_barter_sold_resources()
					elseif context:proposer():name() == priam_benevolence_troy_faction_key and context:recipient():name() == faction_name then
						resources = context:single_barter_bought_resources()
					end
					if not resources or not resources[objective.gift_resource_key] then
						return
					end
					objective[key] = objective[key] + resources[objective.gift_resource_key]
					local previous_benevolence = objective["accumulated_benevolence_for_" .. brother_name]
					local awarded_benevolence = calculate_gifts_to_troy_based_benevolence(objective[key], objective.gift_amount_per_benevolence_point) - previous_benevolence
					if awarded_benevolence ~= 0 then
						objective:award_benevolence(faction_name, awarded_benevolence)
					end
				end,
				true
			)
			
			core:add_listener(
				"priam_benevolence_gifts_to_troy_barter_agreement_ticked_event_" .. faction_name,
				"FactionBarterAgreementTicked",
				function(context) return context:is_gift() and context:is_one_sided_offer() and context:faction():name() == faction_name and context:other_faction():name() == priam_benevolence_troy_faction_key end,
				function(context)
					local resources = context:sold_resources()
					local gift_amount = resources[objective.gift_resource_key] and resources[objective.gift_resource_key] or 0
					objective[key] = objective[key] + gift_amount
					local previous_benevolence = objective["accumulated_benevolence_for_" .. brother_name]
					local awarded_benevolence = calculate_gifts_to_troy_based_benevolence(objective[key], objective.gift_amount_per_benevolence_point) - previous_benevolence
					if awarded_benevolence ~= 0 then
						objective:award_benevolence(faction_name, awarded_benevolence)
					end
				end,
				true
			)
		end,

		deactivate = function(objective, faction)
			local faction_name = faction:name()
			core:remove_listener("priam_benevolence_gifts_to_troy_positive_diplomatic_event_" .. faction_name)
			core:remove_listener("priam_benevolence_gifts_to_troy_barter_agreement_ticked_event_" .. faction_name)
		end
	},

	complete_quest = {
		save = function(objective, save_to_objective)
			local save_for_brother = function(brother_name)
				save_to_objective["allowed_to_deactivate_for_" .. brother_name] = objective["allowed_to_deactivate_for_" .. brother_name]
				save_to_objective["quest_stages_" .. brother_name] = {}
				for k, v in pairs(objective["quest_stages_" .. brother_name]) do
					save_to_objective["quest_stages_" .. brother_name][k] = v.completed
				end
			end
			save_for_brother("hector")
			save_for_brother("paris")
		end,

		load = function(objective, load_from_objective)
			local load_for_brother = function(brother_name)
				objective["allowed_to_deactivate_for_" .. brother_name] = load_from_objective["allowed_to_deactivate_for_" .. brother_name] and load_from_objective["allowed_to_deactivate_for_" .. brother_name] or objective["allowed_to_deactivate_for_" .. brother_name]
				if load_from_objective["quest_stages_" .. brother_name] then
					for k, v in pairs(load_from_objective["quest_stages_" .. brother_name]) do
						objective["quest_stages_" .. brother_name][k].completed = v
					end
				end
			end
			load_for_brother("hector")
			load_for_brother("paris")
		end,

		activate = function(objective, faction)
			local faction_name = faction:name()
			core:add_listener(
				"priam_benevolence_complete_quest_event_" .. faction_name,
				"MissionSucceeded",
				function(context) return context:faction():name() == faction_name end,
				function(context)
					local brother_name = priam_benevolence_get_brother_name(faction_name)
					for k, v in pairs(objective["quest_stages_" .. brother_name]) do
						if context:mission():mission_record_key() == k then
							v.completed = true
							objective:award_benevolence(faction_name, v.benevolence)
							break
						end
					end
					local all_completed = true
					for _, v in pairs(objective["quest_stages_" .. brother_name]) do
						if not v.completed then
							all_completed = false
							break
						end
					end
					if all_completed then
						objective["allowed_to_deactivate_for_" .. brother_name] = true
					end
				end,
				true
			)
		end,

		deactivate = function(objective, faction)
			core:remove_listener("priam_benevolence_complete_quest_event_" .. faction:name())
		end
	},

	gain_favour_with_apollo = {
		activate = function(objective, faction)
			-- Helper function for calculating apollo attitude based benevolence, as it may grant negative values.
			local calculate_apollo_attitude_based_benevolence = function(apollo_attitude, apollo_attitude_per_benevolence_point)
				if apollo_attitude >= 0 then
					return math.floor(apollo_attitude / apollo_attitude_per_benevolence_point)
				else
					return -math.floor(-apollo_attitude / apollo_attitude_per_benevolence_point)
				end
			end

			local faction_name = faction:name()
			if not objective["active_for_" .. priam_benevolence_get_brother_name(faction_name)] then	-- Is this the first time of activation.
				local current_apollo_attitude = faction:pooled_resource(objective.apollo_attitude_pooled_resource_key):value()
				local awarded_benevolence = calculate_apollo_attitude_based_benevolence(current_apollo_attitude, objective.apollo_attitude_per_benevolence_point)
				if awarded_benevolence ~= 0 then
					objective:award_benevolence(faction_name, awarded_benevolence)
				end
			end

			core:add_listener(
				"priam_benevolence_gain_favour_with_apollo_event_" .. faction_name,
				"PooledResourceTransactionEvent",
				function(context)
					if context:amount() ~= 0 and context:resource():key() == objective.apollo_attitude_pooled_resource_key then
						return context:faction():name() == faction_name
					end
					return false
				end,
				function(context)
					local current_apollo_attitude = context:resource():value()
					local previous_apollo_attitude = current_apollo_attitude - context:amount()
					local current_benevolence = calculate_apollo_attitude_based_benevolence(current_apollo_attitude, objective.apollo_attitude_per_benevolence_point)
					local previous_benevolence = calculate_apollo_attitude_based_benevolence(previous_apollo_attitude, objective.apollo_attitude_per_benevolence_point)
					local awarded_benevolence = current_benevolence - previous_benevolence
					if awarded_benevolence ~= 0 then
						objective:award_benevolence(faction_name, awarded_benevolence)
					end
				end,
				true
			)
		end,

		deactivate = function(objective, faction)
			core:remove_listener("priam_benevolence_gain_favour_with_apollo_event_" .. faction:name())
		end
	},

	conquer_the_adriatic_sea = {
		activate = function(objective, faction)
			local faction_name = faction:name()
			if not objective["active_for_" .. priam_benevolence_get_brother_name(faction_name)] then	-- Is this the first time of activation.
				local awarded_benevolence = 0
				local regions = faction:region_list()
				local num_regions = regions:num_items()
				for i = 0, num_regions - 1 do
					local region = regions:item_at(i)
					if table_contains(objective.province_keys_granting_benevolence, region:province_name()) then
						awarded_benevolence = awarded_benevolence + objective.benevolence_per_region
					end
				end
				if awarded_benevolence ~= 0 then
					objective:award_benevolence(faction_name, awarded_benevolence)
				end
			end

			core:add_listener(
				"priam_benevolence_conquer_the_adriatic_sea_region_faction_change_event_" .. faction_name,
				"RegionFactionChangeEvent",
				function(context)
					local region = context:region()
					return table_contains(objective.province_keys_granting_benevolence, region:province_name())
				end,
				function(context)
					local previous_owner_name = context:previous_faction():name()
					if previous_owner_name == faction_name then
						objective:award_benevolence(previous_owner_name, -objective.benevolence_per_region)
					end
					local current_owner_name = context:region():owning_faction():name()
					if current_owner_name == faction_name then
						objective:award_benevolence(current_owner_name, objective.benevolence_per_region)
					end
				end,
				true
			)

			core:add_listener(
				"priam_benevolence_conquer_the_adriatic_sea_razed_settlement_event_" .. faction_name,
				"CharacterRazedSettlement",
				function(context)
					local region = context:garrison_residence():region()
					return region:owning_faction():name() == faction_name and table_contains(objective.province_keys_granting_benevolence, region:province_name())
				end,
				function(context)
					objective:award_benevolence(previous_owner_name, -objective.benevolence_per_region)
				end,
				true
			)
		end,

		deactivate = function(objective, faction)
			core:remove_listener("priam_benevolence_conquer_the_adriatic_sea_region_faction_change_event_" .. faction:name())
			core:remove_listener("priam_benevolence_conquer_the_adriatic_sea_razed_settlement_event_" .. faction:name())
		end
	},

	support_your_brother = {
		activate = function(objective, faction)
			local faction_name = faction:name()
			core:add_listener(
				"priam_benevolence_support_your_brother_victory_event_" .. faction_name,
				"BattleConflictFinished",
				function(context)
					local battle = context:pending_battle()
					local attacker_faction, defender_faction = battle:attacker_faction(), battle:defender_faction()
					attacker_faction, defender_faction = not attacker_faction:is_null_interface() and attacker_faction, not defender_faction:is_null_interface() and defender_faction
					local is_supporting_your_brother = function(own_faction, enemy, is_victory)
						if is_victory and own_faction:name() == faction_name then
							local brother_faction = priam_benevolence_get_other_brother_faction(own_faction:name())
							return enemy:at_war_with(brother_faction)
						end
						return false
					end
					
					local is_attacker_victory = battle:attacker_battle_result():ends_with("victory")
					local is_defender_victory = battle:defender_battle_result():ends_with("victory")

					if is_supporting_your_brother(attacker_faction, defender_faction, is_attacker_victory) or is_supporting_your_brother(defender_faction, attacker_faction, is_defender_victory) then 
						return true
					end

					local secondary_attackers = battle:secondary_attackers()
					local secondary_defenders = battle:secondary_defenders()

					if is_attacker_victory then
						local found_attacker = attacker_faction:name() == faction_name and attacker_faction
						if not found_attacker then
							for i = 0 , secondary_attackers:num_items() - 1 do
								local curr_secondary_attacker = secondary_attackers:item_at(i)
								if curr_secondary_attacker and not curr_secondary_attacker:is_null_interface() and curr_secondary_attacker:faction():name() == faction_name then
									found_attacker = curr_secondary_attacker:faction()
									break
								end
							end
						end
						if not found_attacker then	-- if no brother found - return
							return false
						end
						if is_supporting_your_brother(found_attacker, defender_faction, is_attacker_victory) then
							return true
						end
						for i = 0 , secondary_defenders:num_items() - 1 do
							local curr_secondary_defender = secondary_defenders:item_at(i)
							if curr_secondary_defender and not curr_secondary_defender:is_null_interface() and is_supporting_your_brother(found_attacker, curr_secondary_defender:faction(), true) then
								return true
							end
						end
					elseif is_defender_victory then
						local found_defender = defender_faction:name() == faction_name and defender_faction
						if not found_defender then 
							for i = 0 , secondary_defenders:num_items() - 1 do
								local curr_secondary_defender = secondary_defenders:item_at(i)
								if curr_secondary_defender and not curr_secondary_defender:is_null_interface() and curr_secondary_defender:faction():name() == faction_name then
									found_defender = curr_secondary_defender:faction()
									break
								end
							end
						end
						if not found_defender then	-- if no brother found - return
							return false
						end
						if is_supporting_your_brother(found_defender, attacker_faction, is_defender_victory) then
							return true
						end
						for i = 0 , secondary_attackers:num_items() - 1 do
							local curr_secondary_attacker = secondary_attackers:item_at(i)
							if curr_secondary_attacker and not curr_secondary_attacker:is_null_interface() and is_supporting_your_brother(found_defender, curr_secondary_attacker:faction(), true) then
								return true
							end
						end
					end
					return false
				end,
				function(context)
					objective:award_benevolence(faction_name, objective.benevolence_per_victory)
				end,
				true
			)

			core:add_listener(
				"priam_benevolence_support_your_brother_destroy_faction_event_" .. faction_name,
				"FactionDestroysOtherFaction",
				function(context)
					return context:faction():name() == faction_name and context:other_faction():at_war_with(priam_benevolence_get_other_brother_faction(faction_name))
				end,
				function(context)
					objective:award_benevolence(faction_name, objective.benevolence_per_destroyed_faction)
				end,
				true
			)

			core:add_listener(
				"priam_benevolence_support_your_brother_declare_war_on_brother_event_" .. faction_name,
				"FactionLeaderDeclaresWar",
				function(context)
					local brother_faction = priam_benevolence_get_other_brother_faction(faction_name)
					local faction_declaring_war = context:character():faction()
					return faction_declaring_war:name() == faction_name and faction_declaring_war:at_war_with(brother_faction)
				end,
				function(context)
					objective:award_benevolence(faction_name, objective.declaring_war_on_brother)
				end,
				true
			)
		end,

		deactivate = function(objective, faction)
			local faction_name = faction:name()
			core:remove_listener("priam_benevolence_support_your_brother_victory_event_" .. faction_name)
			core:remove_listener("priam_benevolence_support_your_brother_destroy_faction_event_" .. faction_name)
			core:remove_listener("priam_benevolence_support_your_brother_declare_war_on_brother_event_" .. faction_name)
		end
	},

	provide_for_the_people = {
		activate = function(objective, faction)
			local faction_name = faction:name()
			local calculate_and_change_provide_for_the_people_benevolence = function()
				local provinces = {}
				local regions = faction:region_list()
				for i = 0, regions:num_items() - 1 do
					local region = regions:item_at(i)
					local province_name = region:province_name()
					if not provinces[province_name] then
						provinces[province_name] = { happiness = region:public_order(), resource_income = region:province_pooled_resource_income(objective.resource_key) }
					end
				end
				local current_benevolence = 0
				for k, p in pairs(provinces) do
					if not objective.requires_ownership_of_whole_province or faction:holds_entire_province(k, false) then
						if objective.is_enabled_for_positive_value then
							if p.resource_income >= objective.resource_income_threshold then
								current_benevolence = current_benevolence + objective.benevolence_per_resource_income_province
							end
							if p.happiness >= objective.happiness_threshold then
								current_benevolence = current_benevolence + objective.benevolence_per_happiness_province
							end
						end

						if objective.is_enabled_for_negative_value then
							if p.resource_income <= -objective.resource_income_threshold then
								current_benevolence = current_benevolence - objective.benevolence_per_resource_income_province
							end
							if p.happiness <= -objective.happiness_threshold then
								current_benevolence = current_benevolence - objective.benevolence_per_happiness_province
							end
						end
					end
				end
				local brother_name = priam_benevolence_get_brother_name(faction_name)
				local previous_benevolence = objective["accumulated_benevolence_for_" .. brother_name]
				local awarded_benevolence = current_benevolence - previous_benevolence
				if awarded_benevolence ~= 0 then
					objective:award_benevolence(faction_name, awarded_benevolence)
				end
			end

			core:add_listener(
				"priam_benevolence_provide_for_the_people_event_" .. faction_name,
				"FactionTurnStart",
				function(context) return context:faction():name() == faction_name end,
				function(context) calculate_and_change_provide_for_the_people_benevolence() end,
				true
			)
		end,

		deactivate = function(objective, faction)
			core:remove_listener("priam_benevolence_provide_for_the_people_event_" .. faction:name())
		end
	},

	build_relations = {
		activate = function(objective, faction)
			local faction_name = faction:name()
			local calculate_and_change_build_relations_benevolence = function()
				local current_benevolence = 0
				local factions_met = faction:factions_met()
				for i = 0, factions_met:num_items() - 1 do
					local other_faction = factions_met:item_at(i)
					local attitude = other_faction:diplomatic_standing_with(faction_name)
					if attitude >= objective.diplomatic_attitude_threshold and table_contains(objective.subculture_keys_granting_benevolence, other_faction:subculture()) then
						current_benevolence = current_benevolence + objective.benevolence_per_relation
					end
				end
				local brother_name = priam_benevolence_get_brother_name(faction_name)
				local previous_benevolence = objective["accumulated_benevolence_for_" .. brother_name]
				local awarded_benevolence = current_benevolence - previous_benevolence
				if awarded_benevolence ~= 0 then
					objective:award_benevolence(faction_name, awarded_benevolence)
				end
			end

			core:add_listener(
				"priam_benevolence_build_relations_event_" .. faction_name,
				"FactionTurnStart",
				function(context) return context:faction():name() == faction_name end,
				function(context) calculate_and_change_build_relations_benevolence() end,
				true
			)
		end,

		deactivate = function(objective, faction)
			core:remove_listener("priam_benevolence_build_relations_event_" .. faction:name())
		end
	},

	build_armies = {
		save = function(objective, save_to_objective)
			local save_for_brother = function(brother_name)
				save_to_objective["forces_reached_threshold_for_" .. brother_name] = objective["forces_reached_threshold_for_" .. brother_name]
				save_to_objective["characters_reached_threshold_for_" .. brother_name] = objective["characters_reached_threshold_for_" .. brother_name]
			end
			save_for_brother("hector")
			save_for_brother("paris")
		end,

		load = function(objective, load_from_objective)
			local load_for_brother = function(brother_name)
				objective["forces_reached_threshold_for_" .. brother_name] = load_from_objective["forces_reached_threshold_for_" .. brother_name]
				objective["characters_reached_threshold_for_" .. brother_name] = load_from_objective["characters_reached_threshold_for_" .. brother_name]
			end
			load_for_brother("hector")
			load_for_brother("paris")
		end,
		
		activate = function(objective, faction)
			local faction_name = faction:name()
			local brother_name = priam_benevolence_get_brother_name(faction_name)
			if not objective["active_for_" .. brother_name] then	-- Is this the first time of activation.
				local awarded_benevolence = 0

				if not objective["forces_reached_threshold_for_" .. brother_name] then
					objective["forces_reached_threshold_for_" .. brother_name] = {}
				end
				local forces = faction:military_force_list()
				local num_forces = forces:num_items()
				for i = 0, num_forces - 1 do
					local force = forces:item_at(i)
					if not force:is_armed_citizenry() and force:unit_list():num_items() >= objective.army_units_threshold then
						table.insert(objective["forces_reached_threshold_for_" .. brother_name], force:command_queue_index())
						awarded_benevolence = awarded_benevolence + objective.benevolence_per_army
					end
				end

				if not objective["characters_reached_threshold_for_" .. brother_name] then
					objective["characters_reached_threshold_for_" .. brother_name] = {}
				end
				local characters = faction:character_list()
				local num_characters = characters:num_items()
				for i = 0, num_characters - 1 do
					local character = characters:item_at(i)
					local family_member = character:family_member()
					if family_member:rank() >= objective.character_rank_threshold and character:character_type(objective.character_type) and table_add_unique(objective["characters_reached_threshold_for_" .. brother_name], family_member:command_queue_index()) then
						awarded_benevolence = awarded_benevolence + objective.benevolence_per_character
					end
				end
				local characters_in_pool = faction:character_recruitment_pool_list(objective.character_type)
				local num_characters_in_pool = characters_in_pool:num_items()
				for i = 0, num_characters_in_pool - 1 do
					local family_member = characters_in_pool:item_at(i)
					if family_member:rank() >= objective.character_rank_threshold and table_add_unique(objective["characters_reached_threshold_for_" .. brother_name], family_member:command_queue_index()) then
						awarded_benevolence = awarded_benevolence + objective.benevolence_per_character
					end
				end
				
				if awarded_benevolence ~= 0 then
					objective:award_benevolence(faction_name, awarded_benevolence)
				end
			end

			-- Army listeners.
			local check_force_reaching_threshold = function(context)
				local force = context:unit():military_force()
				return force:faction():name() == faction_name and not force:is_armed_citizenry() and force:unit_list():num_items() >= objective.army_units_threshold and table_add_unique(objective["forces_reached_threshold_for_" .. brother_name], force:command_queue_index())
			end
			local force_reached_threshold = function(context)
				objective:award_benevolence(faction_name, objective.benevolence_per_army)
			end

			local check_force_going_below_threshold = function(context)
				local unit = context:unit()
				local force = unit:military_force()
				return not force:is_null_interface() and unit:faction():name() == faction_name and not force:is_armed_citizenry() and force:unit_list():num_items() <= objective.army_units_threshold and table_erase(objective["forces_reached_threshold_for_" .. brother_name], force:command_queue_index())
			end
			local force_went_below_threshold = function(context)
				objective:award_benevolence(faction_name, -objective.benevolence_per_army)
			end

			core:add_listener(
				"priam_benevolence_build_armies_unit_trained_event_" .. faction_name,
				"UnitTrained",
				check_force_reaching_threshold,
				force_reached_threshold,
				true
			)

			core:add_listener(
				"priam_benevolence_build_armies_unit_transferred_event_" .. faction_name,
				"UnitTransferred",
				function(context)
					return context:unit():faction():name() == faction_name
				end,
				function(context)
					local awarded_benevolence = 0
					local old_force = context:old_military_force()
					if not old_force:is_armed_citizenry() and old_force:unit_list():num_items() < objective.army_units_threshold and table_erase(objective["forces_reached_threshold_for_" .. brother_name], old_force:command_queue_index()) then
						awarded_benevolence = awarded_benevolence - objective.benevolence_per_army
					end
					local new_force = context:unit():military_force()
					if not new_force:is_armed_citizenry() and new_force:unit_list():num_items() >= objective.army_units_threshold and table_add_unique(objective["forces_reached_threshold_for_" .. brother_name], new_force:command_queue_index()) then
						awarded_benevolence = awarded_benevolence + objective.benevolence_per_army
					end
					if awarded_benevolence ~= 0 then
						objective:award_benevolence(faction_name, awarded_benevolence)
					end
				end,
				true
			)

			core:add_listener(
				"priam_benevolence_build_armies_unit_destroyed_event_" .. faction_name,
				"UnitDestroyed",
				check_force_going_below_threshold,
				force_went_below_threshold,
				true
			)

			core:add_listener(
				"priam_benevolence_build_armies_unit_disbanded_event_" .. faction_name,
				"UnitDisbanded",
				check_force_going_below_threshold,
				force_went_below_threshold,
				true
			)

			core:add_listener(
				"priam_benevolence_build_armies_unit_merged_and_destroyed_event_" .. faction_name,
				"UnitMergedAndDestroyed",
				check_force_going_below_threshold,
				force_went_below_threshold,
				true
			)

			-- Character listeners.
			local check_character_reaching_threshold = function(context)
				local character = context:character()
				return character:faction():name() == faction_name and character:rank() >= objective.character_rank_threshold and character:character_type(objective.character_type) and objective["characters_reached_threshold_for_" .. brother_name] and
					table_add_unique(objective["characters_reached_threshold_for_" .. brother_name], character:family_member():command_queue_index())
			end
			local character_reached_threshold = function(context)
				objective:award_benevolence(faction_name, objective.benevolence_per_character)
			end

			core:add_listener(
				"priam_benevolence_build_armies_character_created_event_" .. faction_name,
				"CharacterCreated",
				check_character_reaching_threshold,
				character_reached_threshold,
				true
			)
			
			core:add_listener(
				"priam_benevolence_build_armies_character_rank_up_event_" .. faction_name,
				"CharacterRankUp",
				check_character_reaching_threshold,
				character_reached_threshold,
				true
			)
			
			core:add_listener(
				"priam_benevolence_build_armies_new_character_entered_recruitment_pool_event_" .. faction_name,
				"NewCharacterEnteredRecruitmentPool",
				function(context)
					local character_details = context:character_details()
					if character_details:faction():name() == faction_name then
						local family_member = character_details:family_member()
						return not family_member:is_null_interface() and family_member:rank() >= objective.character_rank_threshold and family_member:character_type_key() == objective.character_type and
							table_add_unique(objective["characters_reached_threshold_for_" .. brother_name], family_member:command_queue_index())
					end 
					return false
				end,
				function(context)
					objective:award_benevolence(faction_name, objective.benevolence_per_character)
				end,
				true
			)

			core:add_listener(
				"priam_benevolence_build_armies_character_died_event_" .. faction_name,
				"FactionCharacterDiedOrWounded",
				function(context)
					if context:faction():name() == faction_name then
						local family_member = context:family_member()
						return not family_member:is_alive() and family_member:rank() >= objective.character_rank_threshold and family_member:character_type_key() == objective.character_type and table_erase(objective["characters_reached_threshold_for_" .. brother_name], family_member:command_queue_index())
					end 
					return false
				end,
				function(context)
					objective:award_benevolence(faction_name, -objective.benevolence_per_character)
				end,
				true
			)

			-- Civil war listeners.
			core:add_listener(
				"priam_benevolence_build_armies_civil_war_occured_event_" .. faction_name,
				"FactionCivilWarOccured",
				function(context) return context:faction():name() == faction_name end,
				function(context)
					local lost_benevolence = 0
					local opponent_faction = context:opponent()
					local characters = opponent_faction:character_list()
					for i = 0, characters:num_items() - 1 do
						local character = characters:item_at(i)
						if table_erase(objective["characters_reached_threshold_for_" .. brother_name], character:family_member():command_queue_index()) then
							lost_benevolence = lost_benevolence - objective.benevolence_per_character
						end
						if character:has_military_force() and table_erase(objective["forces_reached_threshold_for_" .. brother_name], character:military_force():command_queue_index()) then
							lost_benevolence = lost_benevolence - objective.benevolence_per_army
						end
					end
					if lost_benevolence < 0 then
						objective:award_benevolence(faction_name, lost_benevolence)
					end
				end,
				true
			)
		end,

		deactivate = function(objective, faction)
			local faction_name = faction:name()
			core:remove_listener("priam_benevolence_build_armies_unit_trained_event_" .. faction_name)
			core:remove_listener("priam_benevolence_build_armies_unit_transferred_event_" .. faction_name)
			core:remove_listener("priam_benevolence_build_armies_unit_destroyed_event_" .. faction_name)
			core:remove_listener("priam_benevolence_build_armies_unit_disbanded_event_" .. faction_name)
			core:remove_listener("priam_benevolence_build_armies_unit_merged_and_destroyed_event_" .. faction_name)
			core:remove_listener("priam_benevolence_build_armies_character_created_event_" .. faction_name)
			core:remove_listener("priam_benevolence_build_armies_character_rank_up_event_" .. faction_name)
			core:remove_listener("priam_benevolence_build_armies_new_character_entered_recruitment_pool_event_" .. faction_name)
			core:remove_listener("priam_benevolence_build_armies_character_died_event_" .. faction_name)
			core:remove_listener("priam_benevolence_build_armies_civil_war_occured_event_" .. faction_name)
		end
	},

	crush_the_enemy = {
		save = function(objective, save_to_objective)
			save_to_objective.special_settlement_region_keys = objective.special_settlement_region_keys
		end,

		load = function(objective, load_from_objective)
			objective.special_settlement_region_keys = load_from_objective.special_settlement_region_keys and load_from_objective.special_settlement_region_keys or objective.special_settlement_region_keys
		end,

		activate = function(objective, faction)
			local faction_name = faction:name()
			local is_raze_decision = function(decision)
				return decision == "occupation_decision_raze" or decision == "occupation_decision_raze_without_occupy"
			end

			core:add_listener(
				"priam_benevolence_crush_the_enemy_event_" .. faction_name,
				"CharacterPerformsSettlementOccupationDecisionBeforeOutcomeApplication",
				function(context) 
					return context:character():faction():name() == faction_name and is_raze_decision(context:occupation_decision_option())
				end,
				function(context)
					local garrison_residence = context:garrison_residence()
					if garrison_residence:is_settlement() then
						local region_name = garrison_residence:region():name()
						if table_erase(objective.special_settlement_region_keys, region_name) then
							objective:award_benevolence(faction_name, objective.benevolence_per_special_settlement)
						elseif garrison_residence:faction():subculture() == objective.enemy_subculture_key then
							objective:award_benevolence(faction_name, objective.benevolence_per_enemy_settlement)
						end
					end
				end,
				true
			)
		end,

		deactivate = function(objective, faction)
			core:remove_listener("priam_benevolence_crush_the_enemy_event_" .. faction:name())
		end
	},

	build_palaces = {
		activate = function(objective, faction)
			local faction_name = faction:name()
			local brother_name = priam_benevolence_get_brother_name(faction_name)

			local calculate_benevolence_for_building = function(building_name)
				local benevolence = 0
				while building_name and objective.buildings[building_name] do
					benevolence = benevolence + objective.buildings[building_name].benevolence
					if building_name == objective.buildings[building_name].previous_building then
						out("Error: " .. objective.callbacks .. " objective building " .. building_name .. " has itself as previous building!")
						break	-- Avoid loops!
					end
					building_name = objective.buildings[building_name].previous_building
				end
				return benevolence
			end

			local calculate_benevolence_for_region = function(region)
				local benevolence = 0
				local slots = region:slot_list()
				for i = 0, slots:num_items() - 1 do
					local building = slots:item_at(i):building()
					if not building:is_null_interface() then
						local building_name = building:name()
						benevolence = benevolence + calculate_benevolence_for_building(building_name)
					end
				end
				return benevolence
			end

			local calculate_and_change_build_palaces_benevolence = function()
				local awarded_benevolence = 0
				local regions = faction:region_list()
				for i = 0, regions:num_items() - 1 do
					local region = regions:item_at(i)
					if not objective.requires_province_capital or region:is_province_capital() then
						awarded_benevolence = awarded_benevolence + calculate_benevolence_for_region(region)
					end
				end
				awarded_benevolence = awarded_benevolence - objective["accumulated_benevolence_for_" .. brother_name]
				if awarded_benevolence ~= 0 then
					objective:award_benevolence(faction_name, awarded_benevolence)
				end
			end

			if not objective["active_for_" .. brother_name] then	-- Is this the first time of activation.
				calculate_and_change_build_palaces_benevolence()
			end

			core:add_listener(
				"priam_benevolence_build_palaces_building_completed_event_" .. faction_name,
				"BuildingCompleted",
				function(context)
					return context:building():faction():name() == faction_name and (not objective.requires_province_capital or context:garrison_residence():region():is_province_capital())
				end,
				function(context)
					local building_name = context:building():name()
					if objective.buildings[building_name] then
						-- Do not award the full chain benevolence, as the benevolence for the previous level is already awarded.
						objective:award_benevolence(faction_name, objective.buildings[building_name].benevolence)
					end
				end,
				true
			)

			core:add_listener(
				"priam_benevolence_build_palaces_building_demolished_event_" .. faction_name,
				"BuildingDemolished",
				function(context)
					return context:building():faction():name() == faction_name and (not objective.requires_province_capital or context:garrison_residence():region():is_province_capital())
				end,
				function(context)
					local awarded_benevolence = -calculate_benevolence_for_building(context:building():name())
					if awarded_benevolence ~= 0 then
						objective:award_benevolence(faction_name, awarded_benevolence)
					end
				end,
				true
			)

			core:add_listener(
				"priam_benevolence_build_palaces_battle_completed_event_" .. faction_name,
				"BattleCompleted",
				function(context)
					local battle = context:pending_battle()
					return battle:has_contested_garrison() and (battle:attacker_faction():name() == faction_name or battle:defender_faction():name() == faction_name) and (not objective.requires_province_capital or battle:contested_garrison():region():is_province_capital())
				end,
				function(future_context) calculate_and_change_build_palaces_benevolence() end,
				true
			)

			core:add_listener(
				"priam_benevolence_build_palaces_region_faction_change_event_" .. faction_name,
				"RegionFactionChangeEvent",
				function(context)
					local region = context:region()
					return (region:owning_faction():name() == faction_name or context:previous_faction():name() == faction_name) and (not objective.requires_province_capital or context:region():is_province_capital())
				end,
				function(context)
					-- Subscribe for the next RegionFactionChangePostBuildingConversionEvent and recalculate the whole benevolence granted by this objective.
					core:add_listener(
						"priam_benevolence_build_palaces_region_faction_change_post_building_conversion_event_" .. faction_name,
						"RegionFactionChangePostBuildingConversionEvent",
						true,
						function(future_context) calculate_and_change_build_palaces_benevolence() end,
						false
					)
				end,
				true
			)
		end,

		deactivate = function(objective, faction)
			local faction_name = faction:name()
			core:remove_listener("priam_benevolence_build_palaces_building_completed_event_" .. faction_name)
			core:remove_listener("priam_benevolence_build_palaces_building_demolished_event_" .. faction_name)
			core:remove_listener("priam_benevolence_build_palaces_battle_completed_event_" .. faction_name)
			core:remove_listener("priam_benevolence_build_palaces_region_faction_change_event_" .. faction_name)
		end
	},

	spread_your_agents = {
		save = function(objective, save_to_objective)
			local save_for_brother = function(brother_name)
				save_to_objective["characters_reached_threshold_for_" .. brother_name] = objective["characters_reached_threshold_for_" .. brother_name]
			end
			save_for_brother("hector")
			save_for_brother("paris")
		end,

		load = function(objective, load_from_objective)
			local load_for_brother = function(brother_name)
				objective["characters_reached_threshold_for_" .. brother_name] = load_from_objective["characters_reached_threshold_for_" .. brother_name]
			end
			load_for_brother("hector")
			load_for_brother("paris")
		end,
		
		activate = function(objective, faction)
			local faction_name = faction:name()
			local brother_name = priam_benevolence_get_brother_name(faction_name)
			if not objective["active_for_" .. brother_name] then	-- Is this the first time of activation.
				local awarded_benevolence = 0

				if not objective["characters_reached_threshold_for_" .. brother_name] then
					objective["characters_reached_threshold_for_" .. brother_name] = {}
				end
				local characters = faction:character_list()
				local num_characters = characters:num_items()
				for i = 0, num_characters - 1 do
					local character = characters:item_at(i)
					local family_member = character:family_member()
					if family_member:rank() >= objective.character_rank_threshold and table_contains(objective.character_types, character:character_type_key()) and table_add_unique(objective["characters_reached_threshold_for_" .. brother_name], family_member:command_queue_index()) then
						awarded_benevolence = awarded_benevolence + objective.benevolence_per_character
					end
				end
				for _, ct in ipairs(objective.character_types) do
					local characters_in_pool = faction:character_recruitment_pool_list(ct)
					local num_characters_in_pool = characters_in_pool:num_items()
					for i = 0, num_characters_in_pool - 1 do
						local family_member = characters_in_pool:item_at(i)
						if family_member:rank() >= objective.character_rank_threshold and table_add_unique(objective["characters_reached_threshold_for_" .. brother_name], family_member:command_queue_index()) then
							awarded_benevolence = awarded_benevolence + objective.benevolence_per_character
						end
					end
				end
				
				if awarded_benevolence ~= 0 then
					objective:award_benevolence(faction_name, awarded_benevolence)
				end
			end

			local check_character_reaching_threshold = function(context)
				local character = context:character()
				return character:faction():name() == faction_name and character:rank() >= objective.character_rank_threshold and table_contains(objective.character_types, character:character_type_key()) and objective["characters_reached_threshold_for_" .. brother_name] and
					table_add_unique(objective["characters_reached_threshold_for_" .. brother_name], character:family_member():command_queue_index())
			end
			local character_reached_threshold = function(context)
				objective:award_benevolence(faction_name, objective.benevolence_per_character)
			end

			core:add_listener(
				"priam_benevolence_spread_your_agents_character_created_event_" .. faction_name,
				"CharacterCreated",
				check_character_reaching_threshold,
				character_reached_threshold,
				true
			)
			
			core:add_listener(
				"priam_benevolence_spread_your_agents_character_rank_up_event_" .. faction_name,
				"CharacterRankUp",
				check_character_reaching_threshold,
				character_reached_threshold,
				true
			)
			
			core:add_listener(
				"priam_benevolence_spread_your_agents_new_character_entered_recruitment_pool_event_" .. faction_name,
				"NewCharacterEnteredRecruitmentPool",
				function(context)
					local character_details = context:character_details()
					if character_details:faction():name() == faction_name then
						local family_member = character_details:family_member()
						return not family_member:is_null_interface() and family_member:rank() >= objective.character_rank_threshold and table_contains(objective.character_types, family_member:character_type_key()) and
							table_add_unique(objective["characters_reached_threshold_for_" .. brother_name], family_member:command_queue_index())
					end 
					return false
				end,
				function(context)
					objective:award_benevolence(faction_name, objective.benevolence_per_character)
				end,
				true
			)

			core:add_listener(
				"priam_benevolence_spread_your_agents_character_died_event_" .. faction_name,
				"FactionCharacterDiedOrWounded",
				function(context)
					if context:faction():name() == faction_name then
						local family_member = context:family_member()
						return not family_member:is_alive() and family_member:rank() >= objective.character_rank_threshold and table_contains(objective.character_types, family_member:character_type_key()) and table_erase(objective["characters_reached_threshold_for_" .. brother_name], family_member:command_queue_index())
					end 
					return false
				end,
				function(context)
					objective:award_benevolence(faction_name, -objective.benevolence_per_character)
				end,
				true
			)
		end,

		deactivate = function(objective, faction)
			local faction_name = faction:name()
			core:remove_listener("priam_benevolence_spread_your_agents_character_created_event_" .. faction_name)
			core:remove_listener("priam_benevolence_spread_your_agents_character_rank_up_event_" .. faction_name)
			core:remove_listener("priam_benevolence_spread_your_agents_new_character_entered_recruitment_pool_event_" .. faction_name)
			core:remove_listener("priam_benevolence_spread_your_agents_character_died_event_" .. faction_name)
		end
	},

	-- These are the metatable data entries.	
	active_for_hector = false,
	active_for_paris = false,
	accumulated_benevolence_for_hector = 0,
	accumulated_benevolence_for_paris = 0,
	allowed_to_deactivate_for_hector = true,
	allowed_to_deactivate_for_paris = true,

	-- These are the metatable methods. Do not use them for actual objectives.
	activate = function(objective, faction)
		out("priam_benevolence activate objective " .. objective.callbacks .. " for " .. priam_benevolence_get_brother_name(faction:name()))
		priam_benevolence_objectives_metatable[objective.callbacks].activate(objective, faction)
	end,

	deactivate = function(objective, faction)
		out("priam_benevolence deactivate objective " .. objective.callbacks .. " for " .. priam_benevolence_get_brother_name(faction:name()))
		priam_benevolence_objectives_metatable[objective.callbacks].deactivate(objective, faction)
	end,

	award_benevolence = function(objective, faction_name, awarded_benevolence)
		out("priam_benevolence awarded " .. tostring(awarded_benevolence) .. " benevolence to " .. faction_name .. " by objective: " .. objective.callbacks)

		local event_suffix = awarded_benevolence > 0 and "gained" or "lost"
		priam_benevolence_trigger_event(faction_name, "benevolence_" .. event_suffix, objective.callbacks, awarded_benevolence)
		priam_benevolence_trigger_event(priam_benevolence_get_other_brother_faction_name(faction_name), "benevolence_brother_" .. event_suffix, objective.callbacks, awarded_benevolence)

		local brother_name = priam_benevolence_get_brother_name(faction_name)
		objective["accumulated_benevolence_for_" .. brother_name] = objective["accumulated_benevolence_for_" .. brother_name] + awarded_benevolence

		cm:callback(
			function() 
				cm:faction_add_pooled_resource(faction_name, priam_benevolence_pooled_resource_key, priam_benevolence_factors.objectives(objective), awarded_benevolence) 
			end, 
			0.1
		)
	end
}

-- Set the metatable for the objectives.
priam_benevolence_objectives_metatable.__index = priam_benevolence_objectives_metatable
for _, o in ipairs(priam_benevolence_objectives) do
	setmetatable(o, priam_benevolence_objectives_metatable)
end

priam_benevolence_milestones_callbacks = {
	give_general = function(milestone, faction)
		if faction:has_home_region() then
			local faction_name = faction:name()
			local home_region = faction:home_region()
			local general = milestone.reward_general
			local callback = function(cqi)
				cm:rank_up_agent(cqi, general.rank)
				local character_lookup_string = "character_cqi:" .. tostring(cqi)
				for _, t in ipairs(general.traits) do
					cm:force_add_trait(character_lookup_string, t.trait, true, t.points)
				end
			end
			local x, y = cm:find_valid_spawn_location_for_character_from_settlement(faction_name, home_region:name(), false, true, 3)
			if x ~= -1 and y ~= -1 then
				cm:create_force_with_general(faction_name, table.concat(general.army, ","), home_region:name(), x, y, general.agent_type, general.agent_subtype, general.name_key, general.clan_name_key, general.surname_key, general.other_name_key, false, callback, "", true)
			end
		end
	end,

	confederate_troy_and_other_brother = function (milestone, faction)
		-- early return if both brothers are CAI controlled and they're dead/confederated
		if faction:is_dead() then 
			return 
		end
		
		local faction_name = faction:name()
		local troy_faction = cm:get_faction(priam_benevolence_troy_faction_key)
		if not troy_faction:is_dead() then 
			cm:force_confederation(faction_name, priam_benevolence_troy_faction_key)
		end
	
		local other_brother = priam_benevolence_get_other_brother_faction(faction_name)
		if not other_brother:is_human() and not other_brother:is_dead() then
			cm:force_confederation(faction_name, other_brother:name())
		end
	end,

	-- These are the metatable data entries.
	unlocked_by = nil,
	is_final = false,

	-- These are the metatable methods. Do not use them for actual milestones.
	achieve = function(milestone, faction)
		if milestone.reward_faction_leader_trait and faction:has_faction_leader() then
			local cqi = faction:faction_leader():command_queue_index()
			cm:force_add_trait("character_cqi:" .. tostring(cqi), milestone.reward_faction_leader_trait.trait, true, milestone.reward_faction_leader_trait.points)
		end
		
		if milestone.is_final then
			priam_benevolence_finish(faction)

			--
			--achievements.benevolence.func_finish(faction)
		else
			priam_benevolence_deactivate_old_objectives_for_both_brothers(faction)
			priam_benevolence_activate_new_objectives_for_both_brothers(faction)

			priam_benevolence_trigger_event(faction:name(), "milestone_won_" .. faction:name())
			priam_benevolence_trigger_event(priam_benevolence_get_other_brother_faction_name(faction:name()), "milestone_lost_" .. priam_benevolence_get_other_brother_faction_name(faction:name()))
		end
		priam_benevolence_milestones_callbacks[milestone.callbacks](milestone, faction)
	end
}

-- Set the metatable for the milestones.
priam_benevolence_milestones_callbacks.__index = priam_benevolence_milestones_callbacks
for _, m in ipairs(priam_benevolence_milestones) do
	setmetatable(m, priam_benevolence_milestones_callbacks)
end

priam_benevolence_sabotages_callbacks = {
	accusation_of_greed = function(sabotage, faction)
		local required_surplus = sabotage.required_resources_amount_surplus
		local other_brother_faction = priam_benevolence_get_other_brother_faction(faction:name())
		local resource_own = faction:pooled_resource(sabotage.resource)
		local resource_brother = other_brother_faction:pooled_resource(sabotage.resource)
		--local resources = other_brother_faction:pooled_resources()

		if resource_own:is_economy_resource() and faction:has_pooled_resource(sabotage.resource) then
			if resource_brother:value() - required_surplus < resource_own:value() then
				return false
			end
		end

		return true
	end,

	accusation_of_weakness = function(sabotage, faction)
		local other_brother_faction = priam_benevolence_get_other_brother_faction(faction:name())
		local faction_leader, other_faction_leader = faction:faction_leader():family_member(), other_brother_faction:faction_leader():family_member()
		return (not faction_leader:is_convalescing() or faction_leader:is_in_transit()) and other_faction_leader:is_convalescing() and not other_faction_leader:is_in_transit()
	end,

	test_of_skills = function(sabotage, faction)
		local other_brother_faction = priam_benevolence_get_other_brother_faction(faction:name())
		local faction_leader, other_faction_leader = faction:faction_leader(), other_brother_faction:faction_leader()
		return faction_leader:rank() > other_faction_leader:rank() and
			faction_leader:has_military_force() and
			other_faction_leader:has_military_force() and
			not faction_leader:region():is_null_interface() and
			not other_faction_leader:region():is_null_interface() and
			faction_leader:region():name() == other_faction_leader:region():name()
	end,

	-- These are the metatable data entries.
	last_use_turn_for_hector = -9999,
	last_use_turn_for_paris = -9999,

	-- These are the metatable methods. Do not use them for actual sabotages.
	is_on_cooldown = function(sabotage, faction)
		return sabotage["last_use_turn_for_" .. priam_benevolence_get_brother_name(faction:name())] + sabotage.cooldown > faction:model():turn_number()
	end,

	current_cooldown = function(sabotage, faction)
		return math.clamp(sabotage["last_use_turn_for_" .. priam_benevolence_get_brother_name(faction:name())] + sabotage.cooldown - faction:model():turn_number(), 0, 1000)
	end,

	is_possible = function(sabotage, faction)
		return priam_benevolence_are_both_brothers_alive(faction)
	end,

	is_available = function(sabotage, faction)
		return sabotage:is_possible(faction) and not sabotage:is_on_cooldown(faction) and priam_benevolence_sabotages_callbacks[sabotage.callbacks](sabotage, faction)
	end,

	undergo = function(sabotage, faction)
		if not sabotage:is_available(faction) then
			out("Error: Priam Benevolence invalid attempt for sabotage " .. sabotage.callbacks .. " by faction " .. faction:name() .. "!")
			return
		end

		local faction_name = faction:name()
		local other_brother_faction_name = priam_benevolence_get_other_brother_faction_name(faction_name)
		out("priam_benevolence " .. faction_name .. " sabotaged " .. other_brother_faction_name .. " using " .. sabotage.callbacks .. " for " .. tostring(sabotage.value) .. " benevolence")
		cm:faction_add_pooled_resource(other_brother_faction_name, priam_benevolence_pooled_resource_key, priam_benevolence_factors.sabotages, sabotage.value)
		if faction:is_human() then
			local sab_table = priam_benevolence_human_and_ai_brothers.priam_benevolence_sabotage_penalty
			local penalty_bundle = cm:create_new_custom_effect_bundle(sab_table.effect_bundle_key)
			if faction_name == priam_benevolence_hector_faction_key then
				penalty_bundle:add_effect(sab_table.effect_for_hector_key, sab_table.scope, sab_table.val_effect)
			else
				penalty_bundle:add_effect(sab_table.effect_for_paris_key, sab_table.scope, sab_table.val_effect)
			end
			sab_table.val_effect = sab_table.val_effect + sab_table.increase_per_use
			penalty_bundle:set_duration(sab_table.bundle_duration)
			cm:apply_custom_effect_bundle_to_faction(penalty_bundle, faction)
		end

		priam_benevolence_trigger_event(faction_name, "sabotage_" .. sabotage.callbacks .. "_source", nil, sabotage.value)
		priam_benevolence_trigger_event(priam_benevolence_get_other_brother_faction_name(faction_name), "sabotage_" .. sabotage.callbacks .. "_target", nil, sabotage.value)

		sabotage["last_use_turn_for_" .. priam_benevolence_get_brother_name(faction_name)] = faction:model():turn_number()
	end
}

-- Set the metatable for the sabotages.
priam_benevolence_sabotages_callbacks.__index = priam_benevolence_sabotages_callbacks
for _, s in ipairs(priam_benevolence_sabotages) do
	setmetatable(s, priam_benevolence_sabotages_callbacks)
end

function priam_benevolence_deactivate_old_objectives_for_both_brothers(brother_faction)
	local deactivate_old_objectives_for_brother = function(faction)
		if not faction:is_human() then
			return
		end
		local brother_name = priam_benevolence_get_brother_name(faction:name())
		local benevolence_key = "accumulated_benevolence_for_" .. brother_name
		local allowed_to_deactivate_key = "allowed_to_deactivate_for_" .. brother_name
		local active_for_key = "active_for_" .. brother_name
		local indices = {}
		for i = 1, #priam_benevolence_objectives do
			table.insert(indices, i)
		end
		indices = table_stable_sort(indices, function(i1, i2) return priam_benevolence_objectives[i1][benevolence_key] > priam_benevolence_objectives[i2][benevolence_key] end)
		for j = 1, priam_benevolence_number_of_objectives_to_swap_on_milestone_reached do
			for i = 1, #indices do
				if priam_benevolence_objectives[indices[i]][active_for_key] and priam_benevolence_objectives[indices[i]][allowed_to_deactivate_key] then
					priam_benevolence_objectives[indices[i]]:deactivate(faction)
					priam_benevolence_objectives[indices[i]][active_for_key] = false
					break
				end
			end
		end
	end

	deactivate_old_objectives_for_brother(brother_faction)
	deactivate_old_objectives_for_brother(priam_benevolence_get_other_brother_faction(brother_faction:name()))
end

function priam_benevolence_activate_new_objectives_for_both_brothers(brother_faction)
	local indices = {}
	for i = 1, #priam_benevolence_objectives do
		table.insert(indices, i)
	end
	indices = cm:random_sort(indices)

	local activate_new_objectives_for_brother = function(faction, indices)
		if not faction:is_human() then
			return
		end
		local brother_name = priam_benevolence_get_brother_name(faction:name())
		local used_for_key = "used_for_" .. brother_name
		local active_for_key = "active_for_" .. brother_name
		for j = 1, priam_benevolence_number_of_objectives_to_swap_on_milestone_reached do
			for i = 1, #indices do
				if not priam_benevolence_objectives[indices[i]][used_for_key] then
					priam_benevolence_objectives[indices[i]]:activate(faction)
					priam_benevolence_objectives[indices[i]][active_for_key] = true
					priam_benevolence_objectives[indices[i]][used_for_key] = true
					break
				end
			end
		end
	end

	-- If the starting objectives are the same and objectives are not activated in another way except from here, the new objectives for both brothers would be the same.
	activate_new_objectives_for_brother(brother_faction, indices)
	activate_new_objectives_for_brother(priam_benevolence_get_other_brother_faction(brother_faction:name()), indices)
end

function priam_benevolence_finish(brother_faction, unlocked_by)
	local model = brother_faction:model()
	local winning_faction = nil
	for _, m in ipairs(priam_benevolence_milestones) do
		if m.is_final then
			if unlocked_by then
				m.unlocked_by = unlocked_by
			end
			winning_faction = priam_benevolence_get_faction_name_by_brother_name(m.unlocked_by)
			break
		end
	end

	local finish_for_brother = function(faction)
		local faction_name = faction:name()
		local brother_name = priam_benevolence_get_brother_name(faction_name)
		if faction:is_human() then
			priam_benevolence_missions_stop(faction)

			core:remove_listener("priam_benevolence_troy_siege_started_event_" .. faction_name)
			core:remove_listener("priam_benevolence_raiding_troy_regions_" .. faction_name)
			if cm:get_region(priam_benevolence_troy_region_key):garrison_residence():is_under_siege() then
				core:remove_listener("priam_benevolence_troy_siege_mission_succeeded_event_" .. faction_name)
				core:remove_listener("priam_benevolence_troy_siege_ended_event_" .. faction_name)
			end

			local human_factions = cm:get_human_factions()
			for _, human_faction_name in ipairs(human_factions) do
				if human_faction_name ~= faction_name and model:are_factions_coop_allies(faction_name, human_faction_name) then
					cm:force_diplomacy("faction:" .. human_faction_name, "faction:" .. priam_benevolence_troy_faction_key, "war", true, true, true)
					cm:force_diplomacy("faction:" .. human_faction_name, "faction:" .. priam_benevolence_troy_faction_key, "form confederation", true, true, true)
				end
			end
		else
			core:remove_listener("priam_benevolence_ai_faction_turn_start_event_" .. faction_name)
			core:remove_listener("priam_benevolence_ai_faction_turn_end_event_" .. faction_name)
			if priam_benevolence_human_and_ai_brothers.war_between_brothers.enable_war_for_ai_brother_at_turn >= model:turn_number() then
				priam_benevolence_enable_war_for_ai_brother(faction_name, brother_name)
			end
		end

		if unlocked_by ~= "enemy" then
			cm:remove_effect_bundle(priam_benevolence_on_finish_remove_bundles[brother_name], faction_name)
		end

		cm:force_diplomacy("faction:" .. faction_name, "faction:" .. priam_benevolence_troy_faction_key, "peace", false, false, true)

		local active_for_key = "active_for_" .. brother_name
		for i = 1, #priam_benevolence_objectives do
			if priam_benevolence_objectives[i][active_for_key] then
				priam_benevolence_objectives[i]:deactivate(faction)
				priam_benevolence_objectives[i][active_for_key] = false
			end
		end
	end

	local other_brother_faction = priam_benevolence_get_other_brother_faction(brother_faction:name())
	finish_for_brother(brother_faction)
	finish_for_brother(other_brother_faction)

	core:remove_listener("priam_benevolence_check_for_achieved_milestone")
	core:remove_listener("priam_benevolence_check_for_enemy_conquering_troy_region_faction_change_event")
	core:remove_listener("priam_benevolence_check_for_enemy_conquering_troy_character_razed_settlement_event")
	--core:remove_listener("priam_benevolence_troy_confederated_event")	-- Do not remove this listener, as the mechanic finishes before the last prize is given.

	if brother_faction:is_human() ~= other_brother_faction:is_human() then
		core:remove_listener("priam_benevolence_human_and_ai_brothers_human_turn_start")
	end

	if winning_faction then
		priam_benevolence_trigger_event(winning_faction, "race_over_win_" .. winning_faction)
		priam_benevolence_trigger_event(priam_benevolence_get_other_brother_faction_name(winning_faction), "race_over_lost_by_brother_" .. winning_faction)
	elseif unlocked_by == "enemy" then
		priam_benevolence_trigger_event(brother_faction:name(), "troy_burns")
		priam_benevolence_trigger_event(other_brother_faction:name(), "troy_burns")
	end
end

function priam_benevolence_check_for_antagonist(context)
	if antagonist.current == priam_benevolence_troy_faction_key then
		local hector_faction = context:model():world():faction_by_key(priam_benevolence_hector_faction_key)
		priam_benevolence_finish(hector_faction, "priam")
		cm:force_confederation(priam_benevolence_troy_faction_key, priam_benevolence_hector_faction_key)
		cm:force_confederation(priam_benevolence_troy_faction_key, priam_benevolence_paris_faction_key)
		cm:force_diplomacy("faction:" .. priam_benevolence_troy_faction_key, "all", "regions", true, true, true)
		return true
	elseif antagonist.current == priam_benevolence_hector_faction_key then
		local hector_faction = context:model():world():faction_by_key(priam_benevolence_hector_faction_key)
		priam_benevolence_finish(hector_faction, "hector")
		cm:force_confederation(priam_benevolence_hector_faction_key, priam_benevolence_troy_faction_key)
		cm:force_confederation(priam_benevolence_hector_faction_key, priam_benevolence_paris_faction_key)
		return true
	elseif antagonist.current == priam_benevolence_paris_faction_key then
		local paris_faction = context:model():world():faction_by_key(priam_benevolence_paris_faction_key)
		priam_benevolence_finish(paris_faction, "paris")
		cm:force_confederation(priam_benevolence_paris_faction_key, priam_benevolence_troy_faction_key)
		cm:force_confederation(priam_benevolence_paris_faction_key, priam_benevolence_hector_faction_key)
		return true
	end
	return false
end

function priam_benevolence_check_for_achieved_milestone(context)
	if priam_benevolence_check_for_antagonist(context) then
		return
	end

	local highest_unlocked_milestone = 0
	for i, m in ipairs(priam_benevolence_milestones) do
		if m["unlocked_by"] then
			highest_unlocked_milestone = i
		end
	end
	if highest_unlocked_milestone < #priam_benevolence_milestones then
		local next_milestone = highest_unlocked_milestone + 1	
		local hector_faction, paris_faction = cm:get_faction(priam_benevolence_hector_faction_key), cm:get_faction(priam_benevolence_paris_faction_key)
		if hector_faction and paris_faction then
			local hector_benevolence, paris_benevolence = hector_faction:pooled_resource(priam_benevolence_pooled_resource_key):value(), paris_faction:pooled_resource(priam_benevolence_pooled_resource_key):value()
			-- Only trigger the achieving of a milestone if there is a clear winner. Otherwise continue looking for a winner on every round start.
			if hector_benevolence ~= paris_benevolence then
				if hector_benevolence > paris_benevolence then
					if hector_benevolence >= priam_benevolence_milestones[next_milestone].required_benevolence then
						priam_benevolence_milestones[next_milestone].unlocked_by = "hector"
						priam_benevolence_milestones[next_milestone]:achieve(hector_faction)
					end
				else
					if paris_benevolence >= priam_benevolence_milestones[next_milestone].required_benevolence then
						priam_benevolence_milestones[next_milestone].unlocked_by = "paris"
						priam_benevolence_milestones[next_milestone]:achieve(paris_faction)
					end
				end
			elseif hector_benevolence >= priam_benevolence_milestones[next_milestone].required_benevolence then
				priam_benevolence_trigger_event(hector_faction:name(), "milestone_tied")
				priam_benevolence_trigger_event(paris_faction:name(), "milestone_tied")
			end
		end
	end
end

function priam_benevolence_enable_war_for_ai_brother(ai_faction_name, human_faction_name)
	priam_benevolence_human_and_ai_brothers.war_between_brothers.enable_war_for_ai_brother_at_turn = 0
	cm:force_diplomacy("faction:" .. ai_faction_name, "faction:" .. priam_benevolence_get_other_brother_faction_name(ai_faction_name), "war", true, true, false)
	core:remove_listener("priam_benevolence_human_and_ai_brothers_enable_war_for_ai_brother_start_turn_event")
end

function priam_benevolence_disable_war_for_ai_brother(ai_faction_name, human_faction_name)
	cm:force_diplomacy("faction:" .. ai_faction_name, "faction:" .. human_faction_name, "war", false, false, false)
	core:add_listener(
		"priam_benevolence_human_and_ai_brothers_enable_war_for_ai_brother_start_turn_event",
		"FactionTurnStart",
		function(context)
			local faction = context:faction()
			return faction:name() == ai_faction_name and faction:model():turn_number() >= priam_benevolence_human_and_ai_brothers.war_between_brothers.enable_war_for_ai_brother_at_turn
		end,
		function(context)
			priam_benevolence_enable_war_for_ai_brother(ai_faction_name, human_faction_name)
		end,
		true
	)
end

function priam_benevolence_human_and_ai_brothers_human_turn_start(context)
	local human_faction = context:faction()
	local human_faction_name = human_faction:name()
	local ai_faction = priam_benevolence_get_other_brother_faction(human_faction_name)

	if not ai_faction:is_dead() and ai_faction:at_war_with(human_faction) then
		local war_between_brothers = priam_benevolence_human_and_ai_brothers.war_between_brothers
		war_between_brothers.rounds_at_war = war_between_brothers.rounds_at_war + 1
		local troy_declare_war_on_brothers = function()
			priam_benevolence_finish(human_faction, "war")
			cm:force_declare_war(priam_benevolence_troy_faction_key, priam_benevolence_hector_faction_key, false, false, true)
			cm:force_declare_war(priam_benevolence_troy_faction_key, priam_benevolence_paris_faction_key, false, false, true)
		end
		if war_between_brothers.rounds_at_war >= war_between_brothers.declare_war_incident.rounds_at_war then
			troy_declare_war_on_brothers()
			cm:trigger_incident(human_faction_name, war_between_brothers.declare_war_incident.incident_key, true)
			return
		end
		for _, d in ipairs(war_between_brothers.dilemmas) do
			if d.rounds_at_war == war_between_brothers.rounds_at_war then
				core:add_listener (
					"priam_benevolence_human_and_ai_brothers_at_war_dilemma_choice_made_event",
					"DilemmaChoiceMadeEvent",
					true,
					function(context)
						local choice = context:choice()
						if d.peace_choice and d.peace_choice == choice then
							local ai_faction_name = priam_benevolence_get_other_brother_faction_name(human_faction_name)
							cm:force_make_peace(human_faction_name, ai_faction_name, true)
							priam_benevolence_human_and_ai_brothers.war_between_brothers.enable_war_for_ai_brother_at_turn = ai_faction:model():turn_number() + priam_benevolence_human_and_ai_brothers.war_between_brothers.disable_war_for_ai_brother_turns
							priam_benevolence_disable_war_for_ai_brother(ai_faction_name, human_faction_name)
						elseif d.war_with_troy_choice and d.war_with_troy_choice == choice then
							troy_declare_war_on_brothers()
						end
					end,
					false
				)

				cm:trigger_dilemma(human_faction_name, d.dilemma_key)
				return
			end
		end
	end

	if not ai_faction:is_dead() and ai_faction:pooled_resource(priam_benevolence_pooled_resource_key):value() >= human_faction:pooled_resource(priam_benevolence_pooled_resource_key):value() + priam_benevolence_human_and_ai_brothers.not_participating.required_ai_benevolence_lead then
		local model = human_faction:model()
		local round = model:turn_number()
		if not priam_benevolence_human_and_ai_brothers.not_participating.last_dilemma_issued_round or priam_benevolence_human_and_ai_brothers.not_participating.last_dilemma_issued_round + priam_benevolence_human_and_ai_brothers.not_participating.cooldown <= round then
			local dilemmas = priam_benevolence_human_and_ai_brothers.not_participating["dilemma_keys_for_" .. priam_benevolence_get_brother_name(human_faction_name)]
			if #dilemmas > 0 then
				if cm:trigger_dilemma(human_faction_name, dilemmas[model:random_int(1, #dilemmas)]) then
					priam_benevolence_human_and_ai_brothers.not_participating.last_dilemma_issued_round = round
				end
			end
		end
	end
end

function priam_benevolence_generate_benevolence_rounds_for_ai(faction_name, model)
	local difficulty_level = cm:get_difficulty()
	if difficulty_level > #priam_benevolence_ai then
		out("Error: No AI data set for difficulty level " .. tostring(difficulty_level) .. " for Priam Benevolence!")
		return
	end

	local difficulty = priam_benevolence_ai[difficulty_level]
	local final_round = model:random_int(difficulty.final_round_target - difficulty.final_round_spread, difficulty.final_round_target + difficulty.final_round_spread)
	final_round = final_round > 0 and final_round or 1
	local benevolence_per_round = math.floor(difficulty.target_value / final_round)
	local modulo = math.floor(difficulty.target_value) - (benevolence_per_round * final_round)
	local rounds_for_key = "rounds_for_" .. priam_benevolence_get_brother_name(faction_name)
	priam_benevolence_ai[rounds_for_key] = {}
	if final_round % 2 == 1 then
		table.insert(priam_benevolence_ai[rounds_for_key], benevolence_per_round)
	end
	for i = 1, math.floor(final_round / 2) do
		local round_spread = model:random_int(0, difficulty.per_round_spread)
		table.insert(priam_benevolence_ai[rounds_for_key], benevolence_per_round + round_spread)
		table.insert(priam_benevolence_ai[rounds_for_key], benevolence_per_round - round_spread)
	end
	for i = 1, modulo do
		priam_benevolence_ai[rounds_for_key][i] = priam_benevolence_ai[rounds_for_key][i] + 1
	end
	priam_benevolence_ai[rounds_for_key] = cm:random_sort(priam_benevolence_ai[rounds_for_key])
end

function priam_benevolence_grant_benevolence_per_round_for_ai(context)
	local faction = context:faction()
	local faction_name = faction:name()
	local rounds_for_key = "rounds_for_" .. priam_benevolence_get_brother_name(faction_name)
	local round = faction:model():turn_number()
	local benevolence = round <= #priam_benevolence_ai[rounds_for_key] and priam_benevolence_ai[rounds_for_key][round] or priam_benevolence_ai[cm:get_difficulty()].per_round_post_target
	if benevolence ~= 0 then
		cm:faction_add_pooled_resource(faction_name, priam_benevolence_pooled_resource_key, priam_benevolence_factor_faction_key, benevolence)
		priam_benevolence_trigger_event(priam_benevolence_get_other_brother_faction_name(faction_name), "benevolence_changed", nil, benevolence)
	end
end

function priam_benevolence_ai_attempt_sabotages(context)
	local faction = context:faction()
	for _, s in ipairs(priam_benevolence_sabotages) do
		if s:is_available(faction) then
			s:undergo(faction)
		end
	end
end

function priam_benevolence_ai_turn_start(context)
	priam_benevolence_grant_benevolence_per_round_for_ai(context)
	priam_benevolence_ai_attempt_sabotages(context)
end

function priam_benevolence_ai_turn_end(context)
	priam_benevolence_ai_attempt_sabotages(context)
end

function priam_benevolence_initialize(context)
	local initialize_for_brother = function(faction)
		if faction:is_null_interface() then
			return
		end
		local faction_name = faction:name()
		if faction:is_human() then
			-- Do initial activation of the objectives.
			local brother_name = priam_benevolence_get_brother_name(faction_name)
			local used_for_key = "used_for_" .. brother_name
			local active_for_key = "active_for_" .. brother_name
			for _, o in ipairs(priam_benevolence_objectives) do
				if o[used_for_key] then
					o:activate(faction)
					o[active_for_key] = true
				end
			end
		end
	end

	local world = context:model():world()
	local hector_faction, paris_faction = world:faction_by_key(priam_benevolence_hector_faction_key), world:faction_by_key(priam_benevolence_paris_faction_key)
	initialize_for_brother(hector_faction)
	initialize_for_brother(paris_faction)

	-- Priam is very old and should not lead armies. He is still a faction leader though. So convalesce him for a huge amount of turns, so that he does not get recruited as a general.
	cm:wound_character("faction:" .. priam_benevolence_troy_faction_key .. ",forename:" .. priam_benevolence_priam_forename_key, 30000, true, true)

	priam_benevolence_objectives_activated_by_initialization = true	-- Intentionally global and no need to persist this, as it is only related to avoid reactivation.
end

function priam_benevolence_on_world_created(context)
	priam_benevolence_add_sabotage_button_clicked_listeners()

	core:add_listener(
		"priam_benevolence_check_for_achieved_milestone",
		"RoundStart",
		true,
		priam_benevolence_check_for_achieved_milestone,
		true
	)

	local world = context:world()
	local model = world:model()
	local hector_faction, paris_faction = world:faction_by_key(priam_benevolence_hector_faction_key), world:faction_by_key(priam_benevolence_paris_faction_key)

	core:add_listener(
		"priam_benevolence_check_for_enemy_conquering_troy_region_faction_change_event",
		"RegionFactionChangeEvent",
		function(context) return context:region():name() == priam_benevolence_troy_region_key and context:previous_faction():name() == priam_benevolence_troy_faction_key end,
		function(context) priam_benevolence_finish(hector_faction, "enemy") end,
		true
	)

	core:add_listener(
		"priam_benevolence_check_for_enemy_conquering_troy_character_razed_settlement_event",
		"CharacterRazedSettlement",
		function(context)
			local region = context:garrison_residence():region()
			return region:name() == priam_benevolence_troy_region_key and region:owning_faction():name() == priam_benevolence_troy_faction_key
		end,
		function(context) priam_benevolence_finish(hector_faction, "enemy") end,
		true
	)

	core:add_listener(
		"priam_benevolence_troy_confederated_event",
		"FactionJoinsConfederation",
		function(context) return context:faction():name() == priam_benevolence_troy_faction_key end,
		function(context)
			-- Remove Priam from the characters of the faction by killing him permanently.
			local priam_lookup = "faction:" .. context:confederation():name() .. ",forename:" .. priam_benevolence_priam_forename_key
			cm:set_character_immortality(priam_lookup, false)
			cm:set_ignore_immortality_by_trait(priam_lookup, true)
			cm.get_game_interface():kill_character(priam_lookup, false)
		end,
		false
	)
	
	if not hector_faction:is_null_interface() and not paris_faction:is_null_interface() and hector_faction:is_human() ~= paris_faction:is_human() then
		local human_faction_name = not hector_faction:is_null_interface() and not paris_faction:is_null_interface() and hector_faction:is_human() and hector_faction:name() or paris_faction:name()
		core:add_listener(
			"priam_benevolence_human_and_ai_brothers_human_turn_start",
			"FactionTurnStart",
			function(context) return context:faction():name() == human_faction_name end,
			priam_benevolence_human_and_ai_brothers_human_turn_start,
			true
		)
	end

	local on_world_created_for_brother = function(faction)
		if faction:is_null_interface() then
			return
		end
		local faction_name = faction:name()
		cm:force_diplomacy("faction:" .. faction_name, "faction:" .. priam_benevolence_troy_faction_key, "war", false, false, true)
		cm:force_diplomacy("faction:" .. faction_name, "faction:" .. priam_benevolence_troy_faction_key, "form confederation", false, false, true)

		if faction:is_human() then
			local human_factions = cm:get_human_factions()
			for _, human_faction_name in ipairs(human_factions) do
				if human_faction_name ~= faction_name and model:are_factions_coop_allies(faction_name, human_faction_name) then
					cm:force_diplomacy("faction:" .. human_faction_name, "faction:" .. priam_benevolence_troy_faction_key, "war", false, false, true)
					cm:force_diplomacy("faction:" .. human_faction_name, "faction:" .. priam_benevolence_troy_faction_key, "form confederation", false, false, true)
				end
			end

			if not priam_benevolence_objectives_activated_by_initialization then
				-- Do secondary activation of the objectives. I.e. only register for listeners.
				local active_for_key = "active_for_" .. priam_benevolence_get_brother_name(faction_name)
				for _, o in ipairs(priam_benevolence_objectives) do
					if o[active_for_key] then
						o:activate(faction)
					end
				end
			end

			priam_benevolence_missions_start(faction)

			core:add_listener(
				"priam_benevolence_troy_siege_started_event_" .. faction_name,
				"CharacterBesiegesSettlement",
				function(context) return context:region():name() == priam_benevolence_troy_region_key end,
				function(context)
					local sieging_force_cqi = context:character():military_force():command_queue_index()
					priam_benevolence_missions_troy_siege_start(faction_name, sieging_force_cqi)
				end,
				true
			)
			if cm:get_region(priam_benevolence_troy_region_key):garrison_residence():is_under_siege() then
				priam_benevolence_listen_for_troy_siege_change(faction_name)
			end

			core:add_listener (
				"priam_benevolence_raiding_troy_regions_" .. faction_name,
				"FactionTurnStart",
				function(context)
					local event_faction = context:faction()
					if event_faction:name() == faction_name then
						local char_list = context:faction():character_list()
						for i = 0, char_list:num_items() - 1 do
							local character = char_list:item_at(i)
							if is_character(character) and 
								character:has_region() and 
								character:has_military_force() and
								character:military_force():active_stance() == "MILITARY_FORCE_ACTIVE_STANCE_TYPE_LAND_RAID" then
								return char_list:item_at(i):region():owning_faction():name() == "troy_main_trj_troy"
							end
						end
					end
					return false
				end,
				function(context)
					out("priam_benevolence awarded " .. tostring(priam_benevolence_loss_raiding) .. " benevolence to " .. faction_name .. " due to raiding Troy's regions.")
					cm:faction_add_pooled_resource(faction_name, priam_benevolence_pooled_resource_key, priam_benevolence_factors.dilemmas, priam_benevolence_loss_raiding)
					priam_benevolence_trigger_event(faction_name, "raiding_troy_benevolence_loss", nil, priam_benevolence_loss_raiding)
				end,
				true
			)
		else
			local rounds_for_key = "rounds_for_" .. priam_benevolence_get_brother_name(faction_name)
			if not priam_benevolence_ai[rounds_for_key] then	-- Generate the benevolence rounds as they have not been generated before.
				priam_benevolence_generate_benevolence_rounds_for_ai(faction_name, model)
			end

			core:add_listener (
				"priam_benevolence_ai_faction_turn_start_event_" .. faction_name,
				"FactionTurnStart",
				function(context) return context:faction():name() == faction_name end,
				priam_benevolence_ai_turn_start,
				true
			)

			core:add_listener (
				"priam_benevolence_ai_faction_turn_end_event_" .. faction_name,
				"FactionTurnEnd",
				function(context) return context:faction():name() == faction_name end,
				priam_benevolence_ai_turn_end,
				true
			)

			if model:turn_number() <= priam_benevolence_human_and_ai_brothers.war_between_brothers.enable_war_for_ai_brother_at_turn then
				priam_benevolence_disable_war_for_ai_brother(faction_name, priam_benevolence_get_other_brother_faction_name(faction_name))
			end
		end
	end

	on_world_created_for_brother(hector_faction)
	on_world_created_for_brother(paris_faction)

	cm:force_diplomacy("faction:" .. priam_benevolence_troy_faction_key, "all", "regions", false, false, true)
end

table_stable_sort(priam_benevolence_milestones, function(m1, m2) return m1.required_benevolence < m2.required_benevolence end)	-- Call this again if changing the table!

function priam_benevolence_has_finished()
	for _, m in ipairs(priam_benevolence_milestones) do
		if m.is_final then
			return m.unlocked_by
		end
	end
	return false
end

core:add_listener(
	"priam_benevolence_new_campaign_started",
	"NewCampaignStarted",
	true,
	priam_benevolence_initialize,
	false
)

core:add_listener (
	"priam_benevolence_first_tick_after_world_created",
	"FirstTickAfterWorldCreated",
	true,
	function(context)
		add_priam_benevolence_listeners()

		if not priam_benevolence_has_finished() then
			priam_benevolence_on_world_created(context)
		end
	end,
	false
)

function add_priam_benevolence_listeners()
	out("Listeners for Priam Benevolence started")

	core:add_listener(
		"priam_benevolence_panel_opened_campaign",
		"PanelOpenedCampaign",
		function(context) return context.string == priam_benevolence_ui.root_panel end,
		priam_benevolence_panel_open,
		true
	)

	if not priam_benevolence_has_finished() then
		core:add_listener(
			"priam_benevolence_brother_faction_destroyed",
			"FactionDestroysOtherFaction",
			function(context) 
				return (context:other_faction():name() == priam_benevolence_paris_faction_key or
					   context:other_faction():name() == priam_benevolence_hector_faction_key) and
					   not priam_benevolence_has_finished()
			end,
			function(context)
				local other_faction = context:other_faction():name()
				local brother_faction = priam_benevolence_get_other_brother_faction(other_faction)

				if brother_faction:is_human() then
					priam_benevolence_trigger_event(brother_faction:name(), "race_over_lost_by_enemy_" .. brother_faction:name())
				end
			end,
			false
		)
	end
end

-- Returns the indexes of the 2 objectives with biggest benevolence that will be changed
-- This function is used only in the UI.
function priam_benevolence_objectives_to_be_changed(brother_name)
	local active_for_key = "active_for_" .. brother_name
	local benevolence_for_key = "accumulated_benevolence_for_" .. brother_name

	local indices = {}
	local num_objectives = #priam_benevolence_objectives
	local num_active_objectives = 0

	for i = 1, num_objectives do
		if priam_benevolence_objectives[i][active_for_key] then
			table.insert(indices, i)
			num_active_objectives = num_active_objectives + 1
		end
	end

	compare = function(i1, i2) 
				return priam_benevolence_objectives[i1][benevolence_for_key] > priam_benevolence_objectives[i2][benevolence_for_key] 
			end

	local res = {}

	indices = table_stable_sort(indices, compare)

	-- Priam's Heir > The numbers showing benevolence gained through objectives are color coded inconsistently
	-- Suggestion:
	-- A good fix for this would be to only show the top two objectives if they have the highest values.
	-- 1. If three or more objectives are tied for first, none of them are displayed as having the most. When it is time to rotate objectives, the script picks at random from the tied objectives;
	-- 2. If two objectives are tied for first, they are shown as top two;
	-- 3. If there is a first objective and two or more objectives are tied for second, there is only one objective shown as top. When it is time to rotate objectives, the script picks at random from the tied objectives.

	if num_active_objectives >= 3 and 
		priam_benevolence_objectives[indices[1]][benevolence_for_key] == priam_benevolence_objectives[indices[2]][benevolence_for_key] and 
		priam_benevolence_objectives[indices[2]][benevolence_for_key] == priam_benevolence_objectives[indices[3]][benevolence_for_key] 
	then
		res = {}
	elseif num_active_objectives >= 2 and priam_benevolence_objectives[indices[1]][benevolence_for_key] == priam_benevolence_objectives[indices[2]][benevolence_for_key] then
		res[1] = indices[1]
		res[2] = indices[2]
	else
		res[1] = indices[1]
		if indices[2] then 
			if not indices[3] or priam_benevolence_objectives[indices[2]][benevolence_for_key] ~= priam_benevolence_objectives[indices[3]][benevolence_for_key] then
				res[2] = indices[2]
			end
		end
	end
	return res
end

function priam_benevolence_initialize_objectives(ui, brother_name)
	local objectives_root = ui:SequentialFind(priam_benevolence_ui.objectives.root)
	local objectives_list = objectives_root:SequentialFind(priam_benevolence_ui.objectives.list)

	local objective_template = objectives_list:SequentialFind(priam_benevolence_ui.objectives.template)
	local condition_template = objectives_list:SequentialFind(priam_benevolence_ui.objectives.conditions.template)

	local active_for_key = "active_for_" .. brother_name
	local used_for_key = "used_for_" .. brother_name
	local benevolence_for_key = "accumulated_benevolence_for_" .. brother_name

	local objectives_to_be_swapped = priam_benevolence_objectives_to_be_changed(brother_name)

	for index, o in ipairs(priam_benevolence_objectives) do

		if o[active_for_key] or o[used_for_key] then
			-- Create entry for the objective if it doesn't exist
			local objective_entry = objectives_list:SequentialFind("objective_entry" .. o.callbacks)
			if not objective_entry then
				objective_entry = UIComponent(objectives_list:CreateFromComponent(objective_template:Address(), "objective_entry" .. o.callbacks))
			end

			local objective_entry_state = o[active_for_key] and "active" or "inactive"

			local key_title = string.format("campaign_localised_strings_string_troy_main_fm_priam_obj_%s_title", o.callbacks)
			objective_entry:SequentialFind(priam_benevolence_ui.objectives.title):SetText(common.get_localised_string(key_title), key_title)

			-- Change the state of the 2 objectives that will be changed
			local benevolance_state = table_contains(objectives_to_be_swapped, index) and priam_benevolence_ui.objectives.benevolence.states.to_be_replaced or priam_benevolence_ui.objectives.benevolence.states.not_to_be_replaced
			local benevolence = objective_entry:SequentialFind(priam_benevolence_ui.objectives.benevolence.box)
			benevolence:SetState(benevolance_state)
			local benevolence_number = benevolence:SequentialFind(priam_benevolence_ui.objectives.benevolence.number)
			benevolence_number:SetText(string.format("%d", o[benevolence_for_key]))
			benevolence_number:SetState(o[benevolence_for_key] >= 0 and "positive" or "negative")
			

			-- Populate conditions for the current objectives
			local conditions_list = objective_entry:SequentialFind(priam_benevolence_ui.objectives.conditions.list)
			conditions_list:DestroyChildren()

			for k = 1, #o.conditions_strings_args do
				local condition = UIComponent(conditions_list:CreateFromComponent(condition_template:Address(), o.callbacks .. "_condition_" .. k))
				ui:InterfaceFunction("set_condition_text", o.callbacks .. "_condition_" .. k, string.format("troy_main_fm_priam_obj_%s_condition_%d", o.callbacks, k), unpack(o.conditions_strings_args[k]))
			end

			ui:InterfaceFunction("add_item_to_list_header", "objective_entry" .. o.callbacks, "objective_conditions", objective_entry_state)
		end
	end

	objective_template:SetVisible(false)
end

function priam_benevolence_initialize_benevolence_bar(ui, brother_name)
	local benevolance_bar_root = ui:SequentialFind(priam_benevolence_ui.bar.root)
	local bar_hector = ui:SequentialFind(priam_benevolence_ui.bar.hector)
	local bar_paris = ui:SequentialFind(priam_benevolence_ui.bar.paris)

	local max_benevolence = priam_benevolence_milestones[#priam_benevolence_milestones].required_benevolence

	local hector_benevolence = cm:model():world():faction_by_key(priam_benevolence_hector_faction_key):pooled_resource(priam_benevolence_pooled_resource_key):value()
	local hector_benevolance_clamped = math.clamp(hector_benevolence, 0, max_benevolence)
	local paris_benevolance = cm:model():world():faction_by_key(priam_benevolence_paris_faction_key):pooled_resource(priam_benevolence_pooled_resource_key):value()
	local paris_benevolance_clamped = math.clamp(paris_benevolance, 0, max_benevolence)

	local bar_hector_height = hector_benevolance_clamped / max_benevolence * benevolance_bar_root:Height() + 1
	local bar_paris_height = paris_benevolance_clamped / max_benevolence * benevolance_bar_root:Height() + 1
	
	bar_hector:Resize(bar_hector:Width(), bar_hector_height)	
	bar_paris:Resize(bar_paris:Width(), bar_paris_height)

	for i, m in ipairs(priam_benevolence_milestones) do
		local milestone_id = priam_benevolence_ui.bar.milestones.id .. i
		local title_key = string.format("troy_main_fm_priam_benevolence_milestone_%d_title", i)
		local desc_key = string.format("troy_main_fm_priam_benevolence_milestone_%d_desc", i)
		local new_state = m.unlocked_by or priam_benevolence_ui.bar.milestones.states.available

		ui:InterfaceFunction("set_milestone_tooltip", milestone_id, title_key, desc_key, new_state, m.required_benevolence)
	end

	ui:InterfaceFunction("set_benevolence_bar_tooltip", brother_name)

	local other_brother_bar_tooltip = benevolance_bar_root:SequentialFind(brother_name == "paris" and priam_benevolence_ui.bar.hector .. "_tooltip" or priam_benevolence_ui.bar.paris .. "_tooltip")
	local other_brother_benevolence = brother_name == "paris" and hector_benevolence or paris_benevolance
	other_brother_bar_tooltip:SetTooltipText(common.get_localised_string(priam_benevolence_ui.bar.other_brother_tooltip) .. other_brother_benevolence, priam_benevolence_ui.bar.other_brother_tooltip, true)
end

function priam_benevolence_initialize_treachery(ui, faction_key)
	local treachery_list = ui:SequentialFind(priam_benevolence_ui.treachery.list)
	local treachery_template = treachery_list:SequentialFind(priam_benevolence_ui.treachery.template)

	local faction = cm:model():world():faction_by_key(faction_key)

	for idx, t in ipairs(priam_benevolence_sabotages) do
		local ui_entry = treachery_list:SequentialFind("treachery:" .. t.callbacks)
		if not ui_entry then
			ui_entry = UIComponent(treachery_list:CreateFromComponent(treachery_template:Address(), "treachery:" .. t.callbacks))
		end

		ui_entry:SetImagePath(priam_benevolence_ui.treachery.icons[t.callbacks])

		local ui_cooldown = ui_entry:SequentialFind(priam_benevolence_ui.treachery.cooldown)

		local is_available = not priam_benevolence_has_finished() and t:is_available(faction) 
		local cooldown = priam_benevolence_has_finished() and 0 or t:current_cooldown(faction)

		ui_cooldown:SetVisible(cooldown > 0)
		ui_entry:SetState(is_available and "active" or "inactive")

		if cooldown > 0 then
			ui_cooldown:SetStateText(tostring(cooldown))
		end

		local title_key = string.format("troy_main_fm_priam_sabotage_%s_title", t.callbacks)
		local desc_key = string.format("troy_main_fm_priam_sabotage_%s_desc", t.callbacks)
		ui:InterfaceFunction("set_treachery_tooltip", "treachery:" .. t.callbacks, title_key, desc_key, -t.value, unpack(t.tooltip_args))
	end

	treachery_template:SetVisible(false)
end

function priam_benevolence_initialize_missions(ui, brother_name)
	local missions_list = ui:SequentialFind(priam_benevolence_ui.missions.root):SequentialFind(priam_benevolence_ui.missions.list)
	local mission_template = missions_list:SequentialFind(priam_benevolence_ui.missions.template)
	local is_mission_set = false

	active_mission_for_key = "active_mission_for_" .. brother_name

	if priam_benevolence_missions[active_mission_for_key] then
		local mission_entry = missions_list:SequentialFind("mission_" .. priam_benevolence_missions[active_mission_for_key])
		if not mission_entry then
			mission_entry = UIComponent(missions_list:CreateFromComponent(mission_template:Address(), "mission_" .. priam_benevolence_missions[active_mission_for_key]))
		end
	
		is_mission_set = ui:InterfaceFunction("set_priam_mission", mission_entry:Id(), priam_benevolence_missions[active_mission_for_key])
		if not is_mission_set then
			mission_entry:SetVisible(false)	-- For some reason the mission was not initialized properly, so hide the element.
		end

		local key_type = priam_benevolence_mission_type_title_key.mission_keys
		mission_entry:SequentialFind(priam_benevolence_ui.missions.mission_type):SetStateText(common.get_localised_string(key_type), key_type)
	end
	if not is_mission_set then
		local mission_entry = missions_list:SequentialFind("mission_completed")
		if not mission_entry then
			mission_entry = UIComponent(missions_list:CreateFromComponent(mission_template:Address(), "mission_completed"))
		end

		local key_type = priam_benevolence_mission_type_title_key.mission_keys
		mission_entry:SequentialFind(priam_benevolence_ui.missions.mission_type):SetStateText(common.get_localised_string(key_type), key_type)
		mission_entry:SequentialFind(priam_benevolence_ui.missions.mission_completed):SetVisible(true)
		mission_entry:SequentialFind(priam_benevolence_ui.missions.mission_button):SetVisible(false)
		mission_entry:SequentialFind(priam_benevolence_ui.missions.mission_details):SetVisible(false)
	end

	if cm:get_region(priam_benevolence_troy_region_key):garrison_residence():is_under_siege() then
		local mission_entry = missions_list:SequentialFind("mission_" .. priam_benevolence_missions.troy_sieged.mission_key)
		if not mission_entry then
			mission_entry = UIComponent(missions_list:CreateFromComponent(mission_template:Address(), "mission_" .. priam_benevolence_missions.troy_sieged.mission_key))
		end
		
		ui:InterfaceFunction("set_priam_mission", mission_entry:Id(), priam_benevolence_missions.troy_sieged.mission_key)

		local key_type = priam_benevolence_mission_type_title_key.troy_sieged
		mission_entry:SequentialFind(priam_benevolence_ui.missions.mission_type):SetStateText(common.get_localised_string(key_type), key_type)
	end

	mission_template:SetVisible(false)
end

function priam_benevolence_panel_open(context)
	priam_benevolence_refresh_panel()
end

function priam_benevolence_refresh_panel()
	local root_panel = core:get_ui_root():SequentialFind(priam_benevolence_ui.root_panel)
	local faction_name = cm:get_local_faction_name(true)

	priam_benevolence_initialize_objectives(root_panel, priam_benevolence_get_brother_name(faction_name))
	priam_benevolence_initialize_benevolence_bar(root_panel, priam_benevolence_get_brother_name(faction_name))
	priam_benevolence_initialize_treachery(root_panel, faction_name)

	if priam_benevolence_has_finished() then
		local unlocked_by = priam_benevolence_has_finished()

		local background = root_panel:SequentialFind(priam_benevolence_ui.background.root)
		local background_state = priam_benevolence_ui.background.states[unlocked_by]
		background:SetState(background_state)

		local missions = root_panel:SequentialFind(priam_benevolence_ui.missions.root)
		missions:SetVisible(false)
	else
		priam_benevolence_initialize_missions(root_panel, priam_benevolence_get_brother_name(faction_name))
	end

	root_panel:InterfaceFunction("finish_panel_initialization")
	root_panel:Layout()
end

function priam_benevolence_get_sabotage_by_id(callbacks_id)
	for idx, t in ipairs(priam_benevolence_sabotages) do
		if t.callbacks == callbacks_id then 
			return t 
		end
	end

	out("Error: " .. "sabotage with id " .. callbacks_id .. " not found!")
	return nil
end

function priam_benevolence_add_sabotage_button_clicked_listeners()
	-- add listeners for UI sabotage button clicked that will trigger model event that will be executed on all machines
	for idx, t in ipairs(priam_benevolence_sabotages) do
		core:add_listener(
			"priam_benevolence_on_click_" .. t.callbacks,
			"ComponentLClickUp",
			function(context) return context.string == "treachery:" .. t.callbacks end,
			function(context)
				local sabotage_callbacks_id = context.string:split(":")[2]
				local local_faction_cqi = cm:get_faction(cm:get_local_faction_name(true)):command_queue_index()

				CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "priam_benevolence_undergo_sabotage:" .. sabotage_callbacks_id)
			end,
			true
		)
	end

	core:add_listener(
		"priam_benevolence_undergo_sabotage",
		"UITriggerScriptEvent",
		function(context)
			return context:trigger():split(":")[1] == "priam_benevolence_undergo_sabotage"
		end,
		function(context)
			local sabotage_callbacks_id = context:trigger():split(":")[2]
			local sabotage = priam_benevolence_get_sabotage_by_id(sabotage_callbacks_id)

			local faction = cm:model():faction_for_command_queue_index(context:faction_cqi())
				
			if sabotage then
				sabotage:undergo(faction)

				if faction:name() == cm:get_local_faction_name(true) then
					priam_benevolence_refresh_panel()
				end
			end
		end,
		true
	)
end

function priam_benevolence_activate_objective(objective_callbacks, faction_name)
	for _, o in ipairs(priam_benevolence_objectives) do
		if o.callbacks == objective_callbacks then
			local brother_name = priam_benevolence_get_brother_name(faction_name)
			if not o["active_for_" .. brother_name] then
				local faction = cm:get_faction(faction_name)
				o:activate(faction)
				o["active_for_" .. brother_name] = true
				o["used_for_" .. brother_name] = true
			end
			return
		end
	end
end

function priam_benevolence_activate_objective_for_brother(objective_callbacks, brother_name)
	priam_benevolence_activate_objective(objective_callbacks, priam_benevolence_get_faction_name_by_brother_name(brother_name))
end

function priam_benevolence_deactivate_objective(objective_callbacks, faction_name)
	local brother_name = priam_benevolence_get_brother_name(faction_name)
	for _, o in ipairs(priam_benevolence_objectives) do
		if o.callbacks == objective_callbacks then
			if o["active_for_" .. brother_name] then
				local faction = cm:get_faction(faction_name)
				o:deactivate(faction)
				o["active_for_" .. brother_name] = false
			end
			return
		end
	end
end

function priam_benevolence_deactivate_objective_for_brother(objective_callbacks, brother_name)
	priam_benevolence_deactivate_objective(objective_callbacks, priam_benevolence_get_faction_name_by_brother_name(brother_name))
end

--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------

cm:add_saving_game_callback(
	function(context)
		local milestones = {}
		for i, m in ipairs(priam_benevolence_milestones) do
			milestones[i] = {}
			milestones[i].unlocked_by = m.unlocked_by
		end
		cm:save_named_value("TROY_PRIAM_BENEVOLENCE_MILESTONES", milestones, context)
		
		local objectives = {}
		for i, o in ipairs(priam_benevolence_objectives) do
			objectives[i] = {}
			objectives[i].used_for_hector = o.used_for_hector
			objectives[i].used_for_paris = o.used_for_paris
			objectives[i].active_for_hector = o.active_for_hector
			objectives[i].active_for_paris = o.active_for_paris
			objectives[i].accumulated_benevolence_for_hector = o.accumulated_benevolence_for_hector
			objectives[i].accumulated_benevolence_for_paris = o.accumulated_benevolence_for_paris

			if priam_benevolence_objectives_metatable[o.callbacks].save then
				priam_benevolence_objectives_metatable[o.callbacks].save(o, objectives[i])
			end
		end
		cm:save_named_value("TROY_PRIAM_BENEVOLENCE_OBJECTIVES", objectives, context)

		local missions = { active_mission_for_hector = priam_benevolence_missions.active_mission_for_hector, active_mission_for_paris = priam_benevolence_missions.active_mission_for_paris }
		cm:save_named_value("TROY_PRIAM_BENEVOLENCE_MISSIONS", missions, context)

		local sabotages = {}
		for i, s in ipairs(priam_benevolence_sabotages) do
			sabotages[i] = {}
			sabotages[i].last_use_turn_for_hector = s.last_use_turn_for_hector
			sabotages[i].last_use_turn_for_paris = s.last_use_turn_for_paris
		end
		cm:save_named_value("TROY_PRIAM_BENEVOLENCE_SABOTAGES", sabotages, context)

		local ai = { rounds_for_hector = priam_benevolence_ai.rounds_for_hector, rounds_for_paris = priam_benevolence_ai.rounds_for_paris }
		cm:save_named_value("TROY_PRIAM_BENEVOLENCE_AI", ai, context)

		local human_and_ai_brothers = {}
		human_and_ai_brothers.not_participating_last_dilemma_issued_round = priam_benevolence_human_and_ai_brothers.not_participating.last_dilemma_issued_round
		human_and_ai_brothers.war_between_brothers_rounds_at_war = priam_benevolence_human_and_ai_brothers.war_between_brothers.rounds_at_war
		human_and_ai_brothers.enable_war_for_ai_brother_at_turn = priam_benevolence_human_and_ai_brothers.war_between_brothers.enable_war_for_ai_brother_at_turn
		human_and_ai_brothers.val_effect = priam_benevolence_human_and_ai_brothers.priam_benevolence_sabotage_penalty.val_effect
		cm:save_named_value("TROY_PRIAM_BENEVOLENCE_HUMAN_AND_AI_BROTHERS", human_and_ai_brothers, context)
	end
)

cm:add_loading_game_callback(
	function(context)
		local milestones = {}
		milestones = cm:load_named_value("TROY_PRIAM_BENEVOLENCE_MILESTONES", milestones, context)
		for i, m in ipairs(milestones) do
			priam_benevolence_milestones[i].unlocked_by = m.unlocked_by
		end

		local objectives = {}
		objectives = cm:load_named_value("TROY_PRIAM_BENEVOLENCE_OBJECTIVES", objectives, context)
		for i, o in ipairs(objectives) do
			priam_benevolence_objectives[i].used_for_hector = o.used_for_hector
			priam_benevolence_objectives[i].used_for_paris = o.used_for_paris
			priam_benevolence_objectives[i].active_for_hector = o.active_for_hector
			priam_benevolence_objectives[i].active_for_paris = o.active_for_paris
			priam_benevolence_objectives[i].accumulated_benevolence_for_hector = o.accumulated_benevolence_for_hector
			priam_benevolence_objectives[i].accumulated_benevolence_for_paris = o.accumulated_benevolence_for_paris

			if priam_benevolence_objectives_metatable[priam_benevolence_objectives[i].callbacks].load then
				priam_benevolence_objectives_metatable[priam_benevolence_objectives[i].callbacks].load(priam_benevolence_objectives[i], o)
			end
		end

		local missions = {}
		missions = cm:load_named_value("TROY_PRIAM_BENEVOLENCE_MISSIONS", missions, context)
		priam_benevolence_missions.active_mission_for_hector = missions.active_mission_for_hector
		priam_benevolence_missions.active_mission_for_paris = missions.active_mission_for_paris

		local sabotages = {}
		sabotages = cm:load_named_value("TROY_PRIAM_BENEVOLENCE_SABOTAGES", sabotages, context)
		for i, s in ipairs(sabotages) do
			priam_benevolence_sabotages[i].last_use_turn_for_hector = s.last_use_turn_for_hector
			priam_benevolence_sabotages[i].last_use_turn_for_paris = s.last_use_turn_for_paris
		end

		local ai = {}
		ai = cm:load_named_value("TROY_PRIAM_BENEVOLENCE_AI", ai, context)
		priam_benevolence_ai.rounds_for_hector = ai.rounds_for_hector
		priam_benevolence_ai.rounds_for_paris = ai.rounds_for_paris

		local human_and_ai_brothers = {}
		human_and_ai_brothers = cm:load_named_value("TROY_PRIAM_BENEVOLENCE_HUMAN_AND_AI_BROTHERS", human_and_ai_brothers, context)
		priam_benevolence_human_and_ai_brothers.not_participating.last_dilemma_issued_round = human_and_ai_brothers.not_participating_last_dilemma_issued_round or priam_benevolence_human_and_ai_brothers.not_participating.last_dilemma_issued_round
		priam_benevolence_human_and_ai_brothers.war_between_brothers.rounds_at_war = human_and_ai_brothers.war_between_brothers_rounds_at_war or priam_benevolence_human_and_ai_brothers.war_between_brothers.rounds_at_war
		priam_benevolence_human_and_ai_brothers.war_between_brothers.enable_war_for_ai_brother_at_turn = human_and_ai_brothers.enable_war_for_ai_brother_at_turn or priam_benevolence_human_and_ai_brothers.war_between_brothers.enable_war_for_ai_brother_at_turn
		priam_benevolence_human_and_ai_brothers.priam_benevolence_sabotage_penalty.val_effect = human_and_ai_brothers.val_effect or priam_benevolence_human_and_ai_brothers.priam_benevolence_sabotage_penalty.val_effect
	end
)