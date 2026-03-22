out("Loading troy_diomedes_champions.lua")

dio_champions = {
	diomedes_faction = "troy_main_dan_argos",
	ui = {
		dio_champions_confirmation_box_decline = "campaign_localised_strings_string_troy_adi_fm_diomedes_champions_cancel_training_message",
		dio_champions_panel_information_text_key = "",
		dio_champions_teacher_unlock_key = "campaign_localised_strings_string_troy_adi_diomedes_champions_strategos_unlock",
		settlement_icon_path = "UI/skins/default/ic_troy_adi_sp_dio_epigoni.png",
		settlement_icon_tooltip_key = "city_info_bar_adi_diomedes_strategos",
	},

	incidents = {
		start_training = {
			title_key = "campaign_localised_strings_string_troy_adi_fm_diomedes_champions_start_training_title",
			secondary_detail = "campaign_localised_strings_string_troy_adi_fm_diomedes_champions_start_training_text",
			event_pic_index = 1112,
		},
		finished_training = {
			title_key = "campaign_localised_strings_string_troy_adi_fm_diomedes_champions_training_complete_title",
			secondary_detail = "campaign_localised_strings_string_troy_adi_fm_diomedes_champions_training_complete_text",
			event_pic_index = 1113,
		},
		teacher_unlocked = {
			title_key = "campaign_localised_strings_string_troy_adi_fm_diomedes_champions_strategos_found_title",
			secondary_detail = "campaign_localised_strings_string_troy_adi_fm_diomedes_champions_strategos_found_text",
			event_pic_index = 1111,
		},
	},

	ai_config = {
		spawn_interval_low = 6,
		spawn_interval_high = 8,
		spawn_begin = 5,
		early_game_turn_begin = 0,
		early_game_turn_end = 35,
		mid_game_turn_begin = 36,
		mid_game_turn_end = 85,
	},

	teacher_keys = {
		"sthenelos_teacher",
		"euryalos_teacher",
		"promachos_teacher",
		"alcmaeon_teacher",
		"polydoros_teacher",
		"amphilochos_teacher",
		"koronos_teacher",
	},

	teachers = {
		sthenelos_teacher = {
			ui_icon = "UI/Portraits/diomedes_champions/troy_adi_strategos_sthenelos.png",
			name_key = "campaign_localised_strings_string_troy_adi_diomedes_champions_strategos_sthenelos",
			description_text_key = "campaign_localised_strings_string_troy_adi_diomedes_champions_strategos_sthenelos_description",
			unit_name_prefix_key = "campaign_localised_strings_string_troy_adi_diomedes_champions_strategos_sthenelos_unit_prefix",
			unlock_region = "troy_main_argolis_argos",
			train_duration = 4,
			effect_bundle_toolip_key = "troy_adi_effect_bundle_dummy_sthenelos",
			percent_cost_increase_for_tier_1 = 50,
			percent_cost_increase_for_tier_2 = 50,
			percent_cost_increase_for_tier_3 = 50,
			percent_upkeep_increase_for_tier_1 = 20,
			percent_upkeep_increase_for_tier_2 = 20,
			percent_upkeep_increase_for_tier_3 = 20,
			starting_xp = 5,

			stats_tier_1 = {
				charge_mod = 60,
				speed_mod = 20,
			},
			stats_tier_2 = {
				charge_mod = 60,
				speed_mod = 20,
			},
			stats_tier_3 = {
				charge_mod = 60,
				speed_mod = 20,
			},
			attributes = {
				"fatigue_res",
			},

			land_officer_vmd_keys = {
				troy_achaean_bowmen = "troy_adi_champion_dio_sthenelos_bow",

				troy_achaean_stoneslingers = "troy_adi_champion_dio_sthenelos_sling",
				troy_adi_dio_argive_slingers = "troy_adi_champion_dio_sthenelos_sling",
				troy_adi_dio_armoured_argive_slingers = "troy_adi_champion_dio_sthenelos_sling",

				troy_adi_dio_argive_axemen = "troy_adi_champion_dio_sthenelos_sword_shield",
				troy_achaean_spearmen = "troy_adi_champion_dio_sthenelos_sword_shield",
				troy_adi_dio_argive_night_runners = "troy_adi_champion_dio_sthenelos_sword_shield",
				troy_adi_dio_argive_swordsmen = "troy_adi_champion_dio_sthenelos_sword_shield",
				troy_adi_dio_renowned_argive_axemen = "troy_adi_champion_dio_sthenelos_sword_shield",
				troy_adi_dio_warriors_argos = "troy_adi_champion_dio_sthenelos_sword_shield",
				troy_club_warriors = "troy_adi_champion_dio_sthenelos_sword_shield",
				troy_dendra_spearmen = "troy_adi_champion_dio_sthenelos_sword_shield",
				troy_greek_militia = "troy_adi_champion_dio_sthenelos_sword_shield",
				troy_light_spearmen = "troy_adi_champion_dio_sthenelos_sword_shield",
				troy_spearmen = "troy_adi_champion_dio_sthenelos_sword_shield",

				troy_adi_dio_argive_raiders = "troy_adi_champion_dio_sthenelos_2handed",
				troy_adi_dio_diomedes_axe_runners = "troy_adi_champion_dio_sthenelos_2handed",
				troy_dendra_chargers = "troy_adi_champion_dio_sthenelos_2handed",
				
				troy_ach_chariots = "troy_adi_champion_dio_sthenelos_chariot_light",
				troy_ach_heavy_reinforced_chariots = "troy_adi_champion_dio_sthenelos_chariot_reinforced",
			},
		},
		euryalos_teacher = {
			ui_icon = "UI/Portraits/diomedes_champions/troy_adi_strategos_euryalos.png",
			name_key = "campaign_localised_strings_string_troy_adi_diomedes_champions_strategos_euryalos",
			description_text_key = "campaign_localised_strings_string_troy_adi_diomedes_champions_strategos_euryalos_description",
			unit_name_prefix_key = "campaign_localised_strings_string_troy_adi_diomedes_champions_strategos_euryalos_unit_prefix",
			unlock_region = "troy_main_malis_trachis",
			train_duration = 5,
			effect_bundle_toolip_key = "troy_adi_effect_bundle_dummy_euryalos",
			percent_cost_increase_for_tier_1 = 45,
			percent_cost_increase_for_tier_2 = 45,
			percent_cost_increase_for_tier_3 = 45,
			percent_upkeep_increase_for_tier_1 = 20,
			percent_upkeep_increase_for_tier_2 = 20,
			percent_upkeep_increase_for_tier_3 = 20,
			starting_xp = 5,

			stats_tier_1 = {
				armour_mod = 30,
				weapon_mod = 40,
			},
			stats_tier_2 = {
				armour_mod = 30,
				weapon_mod = 40,
			},
			stats_tier_3 = {
				armour_mod = 30,
				weapon_mod = 40,
			},
			attributes = {
				"flanking_attack_improved",
			},

			land_officer_vmd_keys = {
				troy_achaean_bowmen = "troy_adi_champion_dio_euryalos_bow",

				troy_achaean_stoneslingers = "troy_adi_champion_dio_euryalos_sling",
				troy_adi_dio_argive_slingers = "troy_adi_champion_dio_euryalos_sling",
				troy_adi_dio_armoured_argive_slingers = "troy_adi_champion_dio_euryalos_sling",

				troy_adi_dio_argive_axemen = "troy_adi_champion_dio_euryalos_sword_shield",
				troy_achaean_spearmen = "troy_adi_champion_dio_euryalos_sword_shield",
				troy_adi_dio_argive_night_runners = "troy_adi_champion_dio_euryalos_sword_shield",
				troy_adi_dio_argive_swordsmen = "troy_adi_champion_dio_euryalos_sword_shield",
				troy_adi_dio_renowned_argive_axemen = "troy_adi_champion_dio_euryalos_sword_shield",
				troy_adi_dio_warriors_argos = "troy_adi_champion_dio_euryalos_sword_shield",
				troy_club_warriors = "troy_adi_champion_dio_euryalos_sword_shield",
				troy_dendra_spearmen = "troy_adi_champion_dio_euryalos_sword_shield",
				troy_greek_militia = "troy_adi_champion_dio_euryalos_sword_shield",
				troy_light_spearmen = "troy_adi_champion_dio_euryalos_sword_shield",
				troy_spearmen = "troy_adi_champion_dio_euryalos_sword_shield",

				troy_adi_dio_argive_raiders = "troy_adi_champion_dio_euryalos_2handed",
				troy_adi_dio_diomedes_axe_runners = "troy_adi_champion_dio_euryalos_2handed",
				troy_dendra_chargers = "troy_adi_champion_dio_euryalos_2handed",
				
				troy_ach_chariots = "troy_adi_champion_dio_euryalos_chariot_light",
				troy_ach_heavy_reinforced_chariots = "troy_adi_champion_dio_euryalos_chariot_reinforced",
			},
		},
		promachos_teacher = {
			ui_icon = "UI/Portraits/diomedes_champions/troy_adi_strategos_promachos.png",
			name_key = "campaign_localised_strings_string_troy_adi_diomedes_champions_strategos_promachos",
			description_text_key = "campaign_localised_strings_string_troy_adi_diomedes_champions_strategos_promachos_description",
			unit_name_prefix_key = "campaign_localised_strings_string_troy_adi_diomedes_champions_strategos_promachos_unit_prefix",
			unlock_region = "troy_main_messenia_mantineia",
			train_duration = 5,
			effect_bundle_toolip_key = "troy_adi_effect_bundle_dummy_promachos",
			percent_cost_increase_for_tier_1 = 40,
			percent_cost_increase_for_tier_2 = 40,
			percent_cost_increase_for_tier_3 = 40,
			percent_upkeep_increase_for_tier_1 = 20,
			percent_upkeep_increase_for_tier_2 = 20,
			percent_upkeep_increase_for_tier_3 = 20,
			starting_xp = 5,

			stats_tier_1 = {
				defence_mod = 60,
			},
			stats_tier_2 = {
				defence_mod = 60,
			},
			stats_tier_3 = {
				defence_mod = 60,
			},
			attributes = {
				"flanking_defence_improved",
			},

			land_officer_vmd_keys = {
				troy_achaean_bowmen = "troy_adi_champion_dio_promachos_bow",

				troy_achaean_stoneslingers = "troy_adi_champion_dio_promachos_sling",
				troy_adi_dio_argive_slingers = "troy_adi_champion_dio_promachos_sling",
				troy_adi_dio_armoured_argive_slingers = "troy_adi_champion_dio_promachos_sling",

				troy_adi_dio_argive_axemen = "troy_adi_champion_dio_promachos_sword_shield",
				troy_achaean_spearmen = "troy_adi_champion_dio_promachos_sword_shield",
				troy_adi_dio_argive_night_runners = "troy_adi_champion_dio_promachos_sword_shield",
				troy_adi_dio_argive_swordsmen = "troy_adi_champion_dio_promachos_sword_shield",
				troy_adi_dio_renowned_argive_axemen = "troy_adi_champion_dio_promachos_sword_shield",
				troy_adi_dio_warriors_argos = "troy_adi_champion_dio_promachos_sword_shield",
				troy_club_warriors = "troy_adi_champion_dio_promachos_sword_shield",
				troy_dendra_spearmen = "troy_adi_champion_dio_promachos_sword_shield",
				troy_greek_militia = "troy_adi_champion_dio_promachos_sword_shield",
				troy_light_spearmen = "troy_adi_champion_dio_promachos_sword_shield",
				troy_spearmen = "troy_adi_champion_dio_promachos_sword_shield",

				troy_adi_dio_argive_raiders = "troy_adi_champion_dio_promachos_2handed",
				troy_adi_dio_diomedes_axe_runners = "troy_adi_champion_dio_promachos_2handed",
				troy_dendra_chargers = "troy_adi_champion_dio_promachos_2handed",
				
				troy_ach_chariots = "troy_adi_champion_dio_promachos_chariot_light",
				troy_ach_heavy_reinforced_chariots = "troy_adi_champion_dio_promachos_chariot_reinforced",
			},
		},
		alcmaeon_teacher = {
			ui_icon = "UI/Portraits/diomedes_champions/troy_adi_strategos_alcmaeon.png",
			name_key = "campaign_localised_strings_string_troy_adi_diomedes_champions_strategos_alcmaeon",
			description_text_key = "campaign_localised_strings_string_troy_adi_diomedes_champions_strategos_alcmaeon_description",
			unit_name_prefix_key = "campaign_localised_strings_string_troy_adi_diomedes_champions_strategos_alcmaeon_unit_prefix",
			unlock_region = "troy_main_aetolia_astakos",
			train_duration = 4,
			effect_bundle_toolip_key = "troy_adi_effect_bundle_dummy_alcmaeon",
			percent_cost_increase_for_tier_1 = 35,
			percent_cost_increase_for_tier_2 = 35,
			percent_cost_increase_for_tier_3 = 35,
			percent_upkeep_increase_for_tier_1 = 20,
			percent_upkeep_increase_for_tier_2 = 20,
			percent_upkeep_increase_for_tier_3 = 20,
			starting_xp = 5,

			stats_tier_1 = {
				attack_mod = 50,
			},
			stats_tier_2 = {
				attack_mod = 50,
			},
			stats_tier_3 = {
				attack_mod = 50,
			},
			attributes = {
				"causes_fear",
			},

			land_officer_vmd_keys = {
				troy_achaean_bowmen = "troy_adi_champion_dio_alcmaeon_bow",

				troy_achaean_stoneslingers = "troy_adi_champion_dio_alcmaeon_sling",
				troy_adi_dio_argive_slingers = "troy_adi_champion_dio_alcmaeon_sling",
				troy_adi_dio_armoured_argive_slingers = "troy_adi_champion_dio_alcmaeon_sling",

				troy_adi_dio_argive_axemen = "troy_adi_champion_dio_alcmaeon_sword_shield",
				troy_achaean_spearmen = "troy_adi_champion_dio_alcmaeon_sword_shield",
				troy_adi_dio_argive_night_runners = "troy_adi_champion_dio_alcmaeon_sword_shield",
				troy_adi_dio_argive_swordsmen = "troy_adi_champion_dio_alcmaeon_sword_shield",
				troy_adi_dio_renowned_argive_axemen = "troy_adi_champion_dio_alcmaeon_sword_shield",
				troy_adi_dio_warriors_argos = "troy_adi_champion_dio_alcmaeon_sword_shield",
				troy_club_warriors = "troy_adi_champion_dio_alcmaeon_sword_shield",
				troy_dendra_spearmen = "troy_adi_champion_dio_alcmaeon_sword_shield",
				troy_greek_militia = "troy_adi_champion_dio_alcmaeon_sword_shield",
				troy_light_spearmen = "troy_adi_champion_dio_alcmaeon_sword_shield",
				troy_spearmen = "troy_adi_champion_dio_alcmaeon_sword_shield",

				troy_adi_dio_argive_raiders = "troy_adi_champion_dio_alcmaeon_2handed",
				troy_adi_dio_diomedes_axe_runners = "troy_adi_champion_dio_alcmaeon_2handed",
				troy_dendra_chargers = "troy_adi_champion_dio_alcmaeon_2handed",
				
				troy_ach_chariots = "troy_adi_champion_dio_alcmaeon_chariot_light",
				troy_ach_heavy_reinforced_chariots = "troy_adi_champion_dio_alcmaeon_chariot_reinforced",
			},
		},
		polydoros_teacher = {
			ui_icon = "UI/Portraits/diomedes_champions/troy_adi_strategos_polydoros.png",
			name_key = "campaign_localised_strings_string_troy_adi_diomedes_champions_strategos_polydoros",
			description_text_key = "campaign_localised_strings_string_troy_adi_diomedes_champions_strategos_polydoros_description",
			unit_name_prefix_key = "campaign_localised_strings_string_troy_adi_diomedes_champions_strategos_polydoros_unit_prefix",
			unlock_region = "troy_main_argolis_thyrea",
			train_duration = 5,
			effect_bundle_toolip_key = "troy_adi_effect_bundle_dummy_polydoros",
			percent_cost_increase_for_tier_1 = 50,
			percent_cost_increase_for_tier_2 = 50,
			percent_cost_increase_for_tier_3 = 50,
			percent_upkeep_increase_for_tier_1 = 20,
			percent_upkeep_increase_for_tier_2 = 20,
			percent_upkeep_increase_for_tier_3 = 20,
			starting_xp = 5,

			stats_tier_1 = {
				weapon_mod = 50,
				morale_mod = 30,
			},
			stats_tier_2 = {
				weapon_mod = 50,
				morale_mod = 30,
			},
			stats_tier_3 = {
				weapon_mod = 50,
				morale_mod = 30,
			},
			attributes = {
				"field_bandaging",
			},

			land_officer_vmd_keys = {
				troy_achaean_bowmen = "troy_adi_champion_dio_polydoros_bow",

				troy_achaean_stoneslingers = "troy_adi_champion_dio_polydoros_sling",
				troy_adi_dio_argive_slingers = "troy_adi_champion_dio_polydoros_sling",
				troy_adi_dio_armoured_argive_slingers = "troy_adi_champion_dio_polydoros_sling",

				troy_adi_dio_argive_axemen = "troy_adi_champion_dio_polydoros_sword_shield",
				troy_achaean_spearmen = "troy_adi_champion_dio_polydoros_sword_shield",
				troy_adi_dio_argive_night_runners = "troy_adi_champion_dio_polydoros_sword_shield",
				troy_adi_dio_argive_swordsmen = "troy_adi_champion_dio_polydoros_sword_shield",
				troy_adi_dio_renowned_argive_axemen = "troy_adi_champion_dio_polydoros_sword_shield",
				troy_adi_dio_warriors_argos = "troy_adi_champion_dio_polydoros_sword_shield",
				troy_club_warriors = "troy_adi_champion_dio_polydoros_sword_shield",
				troy_dendra_spearmen = "troy_adi_champion_dio_polydoros_sword_shield",
				troy_greek_militia = "troy_adi_champion_dio_polydoros_sword_shield",
				troy_light_spearmen = "troy_adi_champion_dio_polydoros_sword_shield",
				troy_spearmen = "troy_adi_champion_dio_polydoros_sword_shield",

				troy_adi_dio_argive_raiders = "troy_adi_champion_dio_polydoros_2handed",
				troy_adi_dio_diomedes_axe_runners = "troy_adi_champion_dio_polydoros_2handed",
				troy_dendra_chargers = "troy_adi_champion_dio_polydoros_2handed",
				
				troy_ach_chariots = "troy_adi_champion_dio_polydoros_chariot_light",
				troy_ach_heavy_reinforced_chariots = "troy_adi_champion_dio_polydoros_chariot_reinforced",
			},
		},
		amphilochos_teacher = {
			ui_icon = "UI/Portraits/diomedes_champions/troy_adi_strategos_amphilochos.png",
			name_key = "campaign_localised_strings_string_troy_adi_diomedes_champions_strategos_amphilochos",
			description_text_key = "campaign_localised_strings_string_troy_adi_diomedes_champions_strategos_amphilochos_description",
			unit_name_prefix_key = "campaign_localised_strings_string_troy_adi_diomedes_champions_strategos_amphilochos_unit_prefix",
			unlock_region = "troy_main_arachthos_ambracos",
			train_duration = 4,
			effect_bundle_toolip_key = "troy_adi_effect_bundle_dummy_amphilochos",
			percent_cost_increase_for_tier_1 = 60,
			percent_cost_increase_for_tier_2 = 60,
			percent_cost_increase_for_tier_3 = 60,
			percent_upkeep_increase_for_tier_1 = 20,
			percent_upkeep_increase_for_tier_2 = 20,
			percent_upkeep_increase_for_tier_3 = 20,
			starting_xp = 5,

			stats_tier_1 = {
				weapon_mod = 100,
			},
			stats_tier_2 = {
				weapon_mod = 100,
			},
			stats_tier_3 = {
				weapon_mod = 100,
			},
			attributes = {
				"immune_to_psychology",
			},

			land_officer_vmd_keys = {
				troy_achaean_bowmen = "troy_adi_champion_dio_amphilochos_bow",

				troy_achaean_stoneslingers = "troy_adi_champion_dio_amphilochos_sling",
				troy_adi_dio_argive_slingers = "troy_adi_champion_dio_amphilochos_sling",
				troy_adi_dio_armoured_argive_slingers = "troy_adi_champion_dio_amphilochos_sling",

				troy_adi_dio_argive_axemen = "troy_adi_champion_dio_amphilochos_sword_shield",
				troy_achaean_spearmen = "troy_adi_champion_dio_amphilochos_sword_shield",
				troy_adi_dio_argive_night_runners = "troy_adi_champion_dio_amphilochos_sword_shield",
				troy_adi_dio_argive_swordsmen = "troy_adi_champion_dio_amphilochos_sword_shield",
				troy_adi_dio_renowned_argive_axemen = "troy_adi_champion_dio_amphilochos_sword_shield",
				troy_adi_dio_warriors_argos = "troy_adi_champion_dio_amphilochos_sword_shield",
				troy_club_warriors = "troy_adi_champion_dio_amphilochos_sword_shield",
				troy_dendra_spearmen = "troy_adi_champion_dio_amphilochos_sword_shield",
				troy_greek_militia = "troy_adi_champion_dio_amphilochos_sword_shield",
				troy_light_spearmen = "troy_adi_champion_dio_amphilochos_sword_shield",
				troy_spearmen = "troy_adi_champion_dio_amphilochos_sword_shield",

				troy_adi_dio_argive_raiders = "troy_adi_champion_dio_amphilochos_2handed",
				troy_adi_dio_diomedes_axe_runners = "troy_adi_champion_dio_amphilochos_2handed",
				troy_dendra_chargers = "troy_adi_champion_dio_amphilochos_2handed",
				
				troy_ach_chariots = "troy_adi_champion_dio_amphilochos_chariot_light",
				troy_ach_heavy_reinforced_chariots = "troy_adi_champion_dio_amphilochos_chariot_reinforced",
			},
		},
		koronos_teacher = {
			ui_icon = "UI/Portraits/diomedes_champions/troy_adi_strategos_koronos.png",
			name_key = "campaign_localised_strings_string_troy_adi_diomedes_champions_strategos_koronos",
			description_text_key = "campaign_localised_strings_string_troy_adi_diomedes_champions_strategos_koronos_description",
			unit_name_prefix_key = "campaign_localised_strings_string_troy_adi_diomedes_champions_strategos_koronos_unit_prefix",
			unlock_region = "troy_main_boeotia_thebes",
			train_duration = 6,
			effect_bundle_toolip_key = "troy_adi_effect_bundle_dummy_koronos",
			percent_cost_increase_for_tier_1 = 45,
			percent_cost_increase_for_tier_2 = 45,
			percent_cost_increase_for_tier_3 = 45,
			percent_upkeep_increase_for_tier_1 = 20,
			percent_upkeep_increase_for_tier_2 = 20,
			percent_upkeep_increase_for_tier_3 = 20,
			starting_xp = 5,

			stats_tier_1 = {
				charge_mod = 50,
			},
			stats_tier_2 = {
				charge_mod = 50,
			},
			stats_tier_3 = {
				charge_mod = 50,
			},
			attributes = {
				"stalk"
			},

			land_officer_vmd_keys = {
				troy_achaean_bowmen = "troy_adi_champion_dio_koronos_bow",

				troy_achaean_stoneslingers = "troy_adi_champion_dio_koronos_sling",
				troy_adi_dio_argive_slingers = "troy_adi_champion_dio_koronos_sling",
				troy_adi_dio_armoured_argive_slingers = "troy_adi_champion_dio_koronos_sling",

				troy_adi_dio_argive_axemen = "troy_adi_champion_dio_koronos_sword_shield",
				troy_achaean_spearmen = "troy_adi_champion_dio_koronos_sword_shield",
				troy_adi_dio_argive_night_runners = "troy_adi_champion_dio_koronos_sword_shield",
				troy_adi_dio_argive_swordsmen = "troy_adi_champion_dio_koronos_sword_shield",
				troy_adi_dio_renowned_argive_axemen = "troy_adi_champion_dio_koronos_sword_shield",
				troy_adi_dio_warriors_argos = "troy_adi_champion_dio_koronos_sword_shield",
				troy_club_warriors = "troy_adi_champion_dio_koronos_sword_shield",
				troy_dendra_spearmen = "troy_adi_champion_dio_koronos_sword_shield",
				troy_greek_militia = "troy_adi_champion_dio_koronos_sword_shield",
				troy_light_spearmen = "troy_adi_champion_dio_koronos_sword_shield",
				troy_spearmen = "troy_adi_champion_dio_koronos_sword_shield",

				troy_adi_dio_argive_raiders = "troy_adi_champion_dio_koronos_2handed",
				troy_adi_dio_diomedes_axe_runners = "troy_adi_champion_dio_koronos_2handed",
				troy_dendra_chargers = "troy_adi_champion_dio_koronos_2handed",
				
				troy_ach_chariots = "troy_adi_champion_dio_koronos_chariot_light",
				troy_ach_heavy_reinforced_chariots = "troy_adi_champion_dio_koronos_chariot_reinforced",
			},
		},
	},
	-- internal tables, do not touch.
	champion_unit_training = {
		selected_teacher = "",
		selected_unit = "",
		selected_unit_uic_id = "",
		turns_to_train = -1,
		is_training = false,
		recruit_turn = 0,
	},

	champions_unlocked_teachers = {
		sthenelos_teacher = true,
		polydoros_teacher = true,
	},

	ai = {
		last_spawned = -1,
		next_spawn = -1,
	},

}

dio_champions.ai_config.listener = {
	event = "FactionTurnStart",
	filter = function(context)
	   return context:faction():name() == dio_champions.diomedes_faction
	end,
	body =  function(context)
		local diomedes = cm:get_faction(dio_champions.diomedes_faction)
		local turn_number = cm:model():turn_number()
		if dio_champions.ai.next_spawn < 0 then
			dio_champions.ai.next_spawn = dio_champions.ai_config.spawn_begin + cm:model():random_int(dio_champions.ai_config.spawn_interval_low, dio_champions.ai_config.spawn_interval_high)
		end
	 -- if diomedes ai and we are past spawn turn and last spawn was before this turn and the current spawn is nigh
		if not diomedes:is_human() and turn_number >= dio_champions.ai_config.spawn_begin and dio_champions.ai.next_spawn == turn_number then
			local unit_key = ""
			--early
			if turn_number >= dio_champions.ai_config.early_game_turn_begin and turn_number <= dio_champions.ai_config.early_game_turn_end then
			   unit_key = dio_champions.get_random_unit_from_tier(1)
			end

			--mid
			if turn_number >= dio_champions.ai_config.mid_game_turn_begin and turn_number <= dio_champions.ai_config.mid_game_turn_end then
			   unit_key = dio_champions.get_random_unit_from_tier(2)
			end

			--late
			if turn_number > dio_champions.ai_config.mid_game_turn_end then
			   unit_key = dio_champions.get_random_unit_from_tier(3)
			end

			if unit_key then
				local teacher_key = dio_champions.ui.get_random_teacher()
				dio_champions.add_champion_to_mercenary_pool(diomedes, unit_key, dio_champions.teachers[teacher_key], teacher_key)
				dio_champions.ai.last_spawned = turn_number
				dio_champions.ai.next_spawn = turn_number + cm:model():random_int(dio_champions.ai_config.spawn_interval_low, dio_champions.ai_config.spawn_interval_high)
			else
				-- sometimes unit from requred tier could not be found - reschedule spawning for next turn
				dio_champions.ai.last_spawned = turn_number
				dio_champions.ai.next_spawn = turn_number + 1
			end
		end
	end,
}

dio_champions.ui.get_random_teacher = function()
	local result = ""
	repeat
		local teacher_idx = cm:model():random_int(1, #dio_champions.teachers)
		local teacher_key = dio_champions.teacher_keys[teacher_idx]
		if dio_champions.champions_unlocked_teachers[teacher_key] then
			result = teacher_key
		end
	until (result ~= "")
	return result
end

dio_champions.ui.update_city_infobars = function()
	if cm:get_local_faction_name(true) ~= dio_champions.diomedes_faction then return end
	for k, v in pairs(dio_champions.teachers) do
		if not dio_champions.champions_unlocked_teachers[k] then
			cm:set_custom_settlement_info_icon(v.unlock_region, "icon_dio_champions_teacher", dio_champions.ui.settlement_icon_path, dio_champions.ui.settlement_icon_tooltip_key)
		else
			cm:set_custom_settlement_info_icon_visibility(v.unlock_region, "icon_dio_champions_teacher", false)
		end
	end
	CampaignUI.UpdateSettlementEffectIcons()
end

dio_champions.trigger_event = function(event_id, teacher_name_key)
	local event = dio_champions.incidents[event_id]
	if not event then
		out("Event id " .. event_id .. " is invalid key.")
		return
	end
	cm:show_message_event(dio_champions.diomedes_faction, event.title_key, teacher_name_key, event.secondary_detail, true, event.event_pic_index)
end

dio_champions.add_champion_to_mercenary_pool = function(faction, unit_key, teacher, teacher_key)
	out("Adding champion ..." .. unit_key .. " " .. teacher_key)
	local custom_unit = dio_champions.create_champion_custom_unit(faction, unit_key, teacher, teacher_key)

	cm:add_custom_unit_to_faction_mercenary_pool(
		faction:name(),
		custom_unit
	)

	if faction:is_human() then
		dio_champions.trigger_event("finished_training", teacher.name_key)
		core:trigger_event("ScriptEventDiomedesChampionTrained")
	end
end

dio_champions.create_champion_custom_unit = function(faction, unit_key, teacher, teacher_key)
	local custom_unit = cm:create_custom_unit_from_key(unit_key)
	if custom_unit:is_null_interface() then
		out("Failed to create custom unit for " .. unit_key .. " key")
		return
	end

	local custom_id = unit_key .. "_" .. teacher_key
	custom_unit:add_custom_id(custom_id)
	custom_unit:add_custom_attributes(teacher.attributes)
	custom_unit:add_name_prefix(teacher.unit_name_prefix_key)

	if teacher.land_officer_vmd_keys[unit_key] then
		custom_unit:add_custom_officer_vmd(teacher.land_officer_vmd_keys[unit_key])
	else
		out("Custom VMD for unit " .. unit_key .. " is not supported.")
	end

	local resource_cost = cm:create_new_custom_resource_cost()
	local upkeep = cm:create_new_custom_resource_cost()
	resource_cost:get_cost_from_unit(unit_key)
	upkeep:get_upkeep_from_unit(unit_key)

	if custom_unit:base_unit_tier() == 1 then
		custom_unit:add_stat_bonuses(teacher.stats_tier_1)
		resource_cost:increase_by_percent(teacher.percent_cost_increase_for_tier_1)
		upkeep:increase_by_percent(teacher.percent_upkeep_increase_for_tier_1)
	elseif custom_unit:base_unit_tier() == 2 then
		custom_unit:add_stat_bonuses(teacher.stats_tier_2)
		resource_cost:increase_by_percent(teacher.percent_cost_increase_for_tier_2)
		upkeep:increase_by_percent(teacher.percent_upkeep_increase_for_tier_2)
	elseif custom_unit:base_unit_tier() == 3 then
		custom_unit:add_stat_bonuses(teacher.stats_tier_3)
		resource_cost:increase_by_percent(teacher.percent_cost_increase_for_tier_3)
		upkeep:increase_by_percent(teacher.percent_upkeep_increase_for_tier_3)
	end
	custom_unit:add_custom_recruitment_cost(resource_cost)
	custom_unit:add_custom_upkeep_cost(upkeep)

	local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction:command_queue_index(), dio_champions.champion_unit_training.selected_unit, custom_id)
	unit_ammount = unit_ammount + 1

	custom_unit:set_champion_flag()
	custom_unit:add_mercenary_recruit_data(
		unit_ammount,
		0, -- replenish
		unit_ammount, -- max_count
		0, -- max_replenish
		teacher.starting_xp, -- experience
		"", -- FACTION_RECORD faction_restricted_record
		"", -- SUBCULTURE_RECORD subculture_restricted_record
		"" -- TECHNOLOGY_RECORD tech_restricted_recor
	)
	return custom_unit
end

dio_champions.ui.select_teacher = function(teacher, panel)
	local train_teacher_name = panel:SequentialFind("unit_in_training", "teacher", "container", "name_tx")
	local txt_no_teacher = panel:SequentialFind("unit_in_training", "teacher", "container", "txt_no_selected_unit")
	if txt_no_teacher and train_teacher_name then
		for k, v in pairs(dio_champions.teachers) do
			if k == teacher then
				local teacher_uic = panel:SequentialFind(k)
				if teacher_uic then
					teacher_uic:SetState("selected")
				end
				dio_champions.champion_unit_training.selected_teacher = teacher
				txt_no_teacher:SetVisible(false)
				train_teacher_name:SetText(common.get_localised_string(dio_champions.teachers[teacher].name_key))
				train_teacher_name:SetVisible(true)
			end
		end
	end
end

dio_champions.ui.deselect_teacher = function(teacher, panel)
 local train_teacher_name = panel:SequentialFind("unit_in_training", "teacher", "container", "name_tx")
	local txt_no_teacher = panel:SequentialFind("unit_in_training", "teacher", "container", "txt_no_selected_unit")
	if txt_no_teacher and train_teacher_name then
		for k, v in pairs(dio_champions.teachers) do
			if k == teacher then
				local teacher_uic = panel:SequentialFind(k)
				if teacher_uic then
					teacher_uic:SetState("active")
				end
				dio_champions.champion_unit_training.selected_teacher = "";
				train_teacher_name:SetVisible(false)
				txt_no_teacher:SetVisible(true)
				panel:InterfaceFunction("remove_unit_in_training")
				panel:InterfaceFunction("set_unit_in_training", dio_champions.champion_unit_training.selected_unit)
			end
		end
	end
end

dio_champions.ui.show_cancel_confirmation = function(yes_callback, no_callback)
	create_confirmation_box("btn_cancel_training_confirmation_box", dio_champions.ui.dio_champions_confirmation_box_decline, 
		yes_callback,
		no_callback,
		core:get_ui_root()
	)
end

dio_champions.ui.dio_champions_onclick = function(context)
	local l_context = context
	local root_panel = core:get_ui_root():SequentialFind("fm_dio_1")
	local uic = UIComponent(l_context.component);
	local train_teacher_name = root_panel:SequentialFind("unit_in_training", "teacher", "container", "name_tx")
	local txt_no_teacher = root_panel:SequentialFind("unit_in_training", "teacher", "container", "txt_no_selected_unit")
	local txt_no_unit = root_panel:SequentialFind("unit_in_training", "unit", "container", "txt_no_selected_unit")
	local btn_start_training = root_panel:SequentialFind("unit_in_training", "teacher", "footer", "btn_start_training")
	local btn_cancel_training = root_panel:SequentialFind("unit_in_training", "teacher", "footer", "btn_cancel_training")
	local turns_to_train = root_panel:SequentialFind("unit_in_training", "teacher", "text_container", "text_num_turns")
	local turns_to_train_container = root_panel:SequentialFind("unit_in_training", "teacher", "text_container")
	local train_panel = root_panel:SequentialFind("unit_in_training")

	local click_id = uic:Id();

	if click_id == "button_zoom_location" then
		local uic_parent = UIComponent(uic:Parent())
		uic_parent:InterfaceFunction("zoom_to_location", dio_champions.teachers[uic_parent:Id()].unlock_region)
	end

	if string.find(click_id, "_recruitable") then
		-- clicked the unit in training, bail out
		local is_unit_in_train = root_panel:SequentialFind("unit_in_training", "container", "list_clip", click_id)
		if is_unit_in_train and uic == is_unit_in_train then return end

		--clicked another unit
		if not dio_champions.champion_unit_training.is_training then
			--deselect
			if dio_champions.champion_unit_training.selected_unit_uic_id == click_id then
				root_panel:InterfaceFunction("remove_unit_in_training")
				dio_champions.champion_unit_training.selected_unit = "";
				dio_champions.champion_unit_training.selected_unit_uic_id = "";
				uic:SetState("active")
			else -- select
				local old_border = root_panel:SequentialFind(dio_champions.champion_unit_training.selected_unit_uic_id)
				if old_border then
					old_border:SetState("active")
				end
				local recruitment_name = string.gsub(click_id, "_recruitable", "", 1)
				dio_champions.champion_unit_training.selected_unit = recruitment_name;
				dio_champions.champion_unit_training.selected_unit_uic_id = click_id;
				root_panel:InterfaceFunction("remove_unit_in_training")
				root_panel:InterfaceFunction("set_unit_in_training", recruitment_name)
				uic:SetState("selected")
			end
		end
	end

	if btn_start_training and btn_cancel_training then
		if click_id == "btn_start_training" then
			if not dio_champions.champion_unit_training.is_training then
				-- show cancel button, begin training
				btn_start_training:SetVisible(false)
				btn_cancel_training:SetVisible(true)
				dio_champions.champion_unit_training.is_training = true
				turns_to_train_container:SetVisible(true)
				turns_to_train:SetText(dio_champions.teachers[dio_champions.champion_unit_training.selected_teacher].train_duration)

				local diomedes = cm:get_faction(dio_champions.diomedes_faction)
				CampaignUI.TriggerCampaignScriptEvent(diomedes:command_queue_index(), "diomedes_champions_start_training_" .. dio_champions.champion_unit_training.selected_teacher)

				local bonus_from_effect = dio_champions.faction_get_effect_value("troy_adi_effect_army_champions_training_time")
				dio_champions.champion_unit_training.turns_to_train = dio_champions.teachers[dio_champions.champion_unit_training.selected_teacher].train_duration + bonus_from_effect
				dio_champions.ui.toggle_train_indicator(true, dio_champions.champion_unit_training.turns_to_train)

				local info = dio_champions.champion_unit_training.selected_unit .. ";" .. dio_champions.champion_unit_training.selected_teacher
				CampaignUI.TriggerCampaignScriptEvent(diomedes:command_queue_index(), "diomedes_champions_recruit_event_" .. info)
			end
		end

		if click_id == "btn_cancel_training" then
			if dio_champions.champion_unit_training.is_training then
				dio_champions.ui.show_cancel_confirmation(function()
					 -- show start training button, stop training
					btn_start_training:SetVisible(true)
					btn_cancel_training:SetVisible(false)
					turns_to_train_container:SetVisible(false)
					dio_champions.ui.deselect_teacher(dio_champions.champion_unit_training.selected_teacher, root_panel)
					local unit_frame = root_panel:SequentialFind(dio_champions.champion_unit_training.selected_unit_uic_id)
					unit_frame:SetState("active")
					txt_no_unit:SetVisible(true)
					train_panel:SetVisible(false)
					dio_champions.ui.toggle_train_indicator(false)
					root_panel:InterfaceFunction("remove_unit_in_training")
					root_panel:InterfaceFunction("cancel_training")
					local diomedes = cm:get_faction(dio_champions.diomedes_faction)
					CampaignUI.TriggerCampaignScriptEvent(diomedes:command_queue_index(), "diomedes_champions_cancel_recruit_event")
				end)
			end
		end
	end

	-- clicked on teacher
	if dio_champions.teachers[click_id] and train_teacher_name and txt_no_teacher and turns_to_train then
		if not dio_champions.champion_unit_training.is_training then
			if dio_champions.champion_unit_training.selected_teacher ~= click_id then
				--unselect old one
				dio_champions.ui.deselect_teacher(dio_champions.champion_unit_training.selected_teacher, root_panel)
				--select new one
				dio_champions.ui.select_teacher(click_id, root_panel)
			else
				dio_champions.ui.deselect_teacher(click_id, root_panel)
			end
		else
			if dio_champions.champion_unit_training.selected_teacher ~= click_id then
				local train_teacher = dio_champions.champion_unit_training.selected_teacher
				dio_champions.ui.deselect_teacher(click_id, root_panel)
				dio_champions.ui.select_teacher(train_teacher, root_panel)
				local custom_unit = dio_champions.create_champion_custom_unit(cm:get_faction(dio_champions.diomedes_faction), dio_champions.champion_unit_training.selected_unit, dio_champions.teachers[dio_champions.champion_unit_training.selected_teacher], dio_champions.champion_unit_training.selected_teacher)
				root_panel:InterfaceFunction("set_teacher_stats", custom_unit)
				root_panel:InterfaceFunction("set_unit_in_training", dio_champions.champion_unit_training.selected_unit)
			end
		end
	end

	if (dio_champions.champion_unit_training.selected_teacher ~= "" or dio_champions.champion_unit_training.selected_unit ~= "") and not dio_champions.champion_unit_training.is_training then
		train_panel:SetVisible(true)
		btn_start_training:SetVisible(true)
		btn_start_training:SetState("inactive")

	elseif dio_champions.champion_unit_training.selected_teacher == "" and dio_champions.champion_unit_training.selected_unit == "" and not dio_champions.champion_unit_training.is_training then
		train_panel:SetVisible(false)
		btn_start_training:SetState("inactive")
	end

	if dio_champions.champion_unit_training.selected_teacher ~= "" and dio_champions.champion_unit_training.selected_unit ~= "" and not dio_champions.champion_unit_training.is_training and turns_to_train and btn_start_training then
		btn_start_training:SetVisible(true)
		btn_start_training:SetState("active")
		local custom_unit = dio_champions.create_champion_custom_unit(cm:get_faction(dio_champions.diomedes_faction), dio_champions.champion_unit_training.selected_unit, dio_champions.teachers[dio_champions.champion_unit_training.selected_teacher], dio_champions.champion_unit_training.selected_teacher)
		root_panel:InterfaceFunction("set_teacher_stats", custom_unit)
		root_panel:InterfaceFunction("set_unit_in_training", dio_champions.champion_unit_training.selected_unit)
	end
end

dio_champions.ui.refresh_teachers_unlock = function()
	for k, v in pairs(dio_champions.teachers) do
		if not dio_champions.champions_unlocked_teachers[k] then
			dio_champions.champions_unlocked_teachers[k] = false
		end
	end
end

dio_champions.ui.toggle_train_indicator = function(visible, turns_to_train)
	local train_indicator = core:get_ui_root():SequentialFind("turns_icon_dio_champions")
	if not train_indicator then
		out("dio_champions.ui.toggle_train_indicator FAILED TO FIND turns_icon_dio_champions component. ")
		return
	end
	if visible then
		train_indicator:SetVisible(true)
	else
		train_indicator:SetVisible(false)
	end

	if turns_to_train then
		train_indicator:SetStateText(turns_to_train)
	end
end

dio_champions.add_training_listener = function()
	core:add_listener(
		"troy_dio_champions_turn_start_scripted_event",
		"FactionTurnStart",
		function(context)
		   return context:faction():name() == dio_champions.diomedes_faction and cm:model():turn_number() == dio_champions.champion_unit_training.recruit_turn
		end,
		function(context)
			 dio_champions.add_champion_to_mercenary_pool(cm:get_faction(dio_champions.diomedes_faction), dio_champions.champion_unit_training.selected_unit, dio_champions.teachers[dio_champions.champion_unit_training.selected_teacher], dio_champions.champion_unit_training.selected_teacher)
			dio_champions.champion_unit_training.turns_to_train = -1
			dio_champions.champion_unit_training.selected_unit = ""
			dio_champions.champion_unit_training.selected_unit_uic_id = ""
			dio_champions.champion_unit_training.selected_teacher = ""
			dio_champions.champion_unit_training.is_training = false
			dio_champions.ui.toggle_train_indicator(false)
		end,
		false
	)
end

dio_champions.get_random_unit_from_tier = function(tier)
	local unit_list = cm:get_unit_keys_from_faction_pool(dio_champions.diomedes_faction)
	local units_for_tier = {}
	for k, v in ipairs(unit_list) do
		local unit = cm:create_custom_unit_from_key(v)
		if unit:base_unit_tier() == tier then
			table.insert(units_for_tier, v)
		end
	end
	return units_for_tier[cm:model():random_int(1, #units_for_tier)]
end

dio_champions.faction_get_effect_value = function(input_effect)
	local diomedes = cm:get_faction(dio_champions.diomedes_faction)
	local effect_bundles = diomedes:effect_bundles()
	for i=0, effect_bundles:num_items() -1 do
		local bundle = effect_bundles:item_at(i)
		for j=0, bundle:effects():num_items() -1 do
			local effect = bundle:effects():item_at(j)
			if effect:key() == input_effect then
				return effect:value()
			end
		end
	end
	return 0
end

function dio_champions_add_listeners()

	if core:is_loading_screen_visible() and not core:is_loading_screen_being_dismissed_this_tick() then
		out("a loading screen is visible, waiting until it is dismissed");
		core:progress_on_loading_screen_dismissed(function()
			if dio_champions.champion_unit_training.is_training and dio_champions.champion_unit_training.turns_to_train > 0 then
				dio_champions.ui.toggle_train_indicator(true, dio_champions.champion_unit_training.turns_to_train)
			else
				dio_champions.ui.toggle_train_indicator(false)
			end
		end)
	end

	core:add_listener(
		"troy_dio_champions_turn_start_ai_dio",
		dio_champions.ai_config.listener.event,
		dio_champions.ai_config.listener.filter,
		dio_champions.ai_config.listener.body,
		true
	)

	if dio_champions.champion_unit_training.is_training then
		dio_champions.add_training_listener()
	end

	core:add_listener(
		"test_dio_champiuons_region_captured",
		"RegionFactionChangeEvent",
		function(context)
		   return context:region():owning_faction():name() == dio_champions.diomedes_faction and context:region():owning_faction():is_human()
		end,
		function(context)
			for k, v in pairs(dio_champions.teachers) do
				if context:region():name() == v.unlock_region then
					if not dio_champions.champions_unlocked_teachers[k] then
						dio_champions.champions_unlocked_teachers[k] = true
						dio_champions.trigger_event("teacher_unlocked", v.name_key)
					end
				end
			end
			dio_champions.ui.refresh_teachers_unlock()
			dio_champions.ui.update_city_infobars()
		end,
		true
	)


	core:add_listener(
		"test_dio_champiuons_region_captured_for_ai",
		"RegionFactionChangeEvent",
		function(context)
		   return context:region():owning_faction():name() == dio_champions.diomedes_faction and not context:region():owning_faction():is_human()
		end,
		function(context)
			for k, v in pairs(dio_champions.teachers) do
				if context:region():name() == v.unlock_region then
					if not dio_champions.champions_unlocked_teachers[k] then
						dio_champions.champions_unlocked_teachers[k] = true
					end
				end
			end
			dio_champions.ui.refresh_teachers_unlock()
		end,
		true
	)

	core:add_listener(
		"troy_dio_champions_scripted_evet_start_recruitment_event",
		"UITriggerScriptEvent",
		function(context)
			return string.find(context:trigger(), "diomedes_champions_start_training_") ~= nil
		end,
		function(context)
			local _, j = string.find(context:trigger(), "diomedes_champions_start_training_")
			local selected_teacher = string.sub(context:trigger(), j + 1) -- because the j is on the "_" of the substring, we do + 1 to skip it
			dio_champions.trigger_event("start_training", dio_champions.teachers[selected_teacher].name_key)
		end,
		true
	)

	 core:add_listener(
		"troy_dio_champions_scripted_event_cancel_recruitment",
		"UITriggerScriptEvent",
		function(context)
			return context:trigger() == "diomedes_champions_cancel_recruit_event"
		end,
		function(context)
			dio_champions.champion_unit_training.turns_to_train = -1
			dio_champions.champion_unit_training.selected_unit = ""
			dio_champions.champion_unit_training.selected_unit_uic_id = ""
			dio_champions.champion_unit_training.selected_teacher = ""
			dio_champions.champion_unit_training.is_training = false
			core:remove_listener("troy_dio_champions_turn_start_scripted_event")
		end,
		true
	)

	core:add_listener(
		"troy_dio_champions_scripted_event_start_recruitment",
		"UITriggerScriptEvent",
		function(context)
			return string.find(context:trigger(), "diomedes_champions_recruit_event_") ~= nil
		end,
		function(context)
			local text_data = string.gsub(context:trigger(), "diomedes_champions_recruit_event_", "", 1)
			local event_data = {}
			 for w in (text_data .. ";"):gmatch("([^;]*);") do
				table.insert(event_data, w)
			end

			local turn_number = cm:model():turn_number()
			local teacher = dio_champions.teachers[event_data[2]]
			local bonus_from_effect = dio_champions.faction_get_effect_value("troy_adi_effect_army_champions_training_time")
			dio_champions.champion_unit_training.turns_to_train = teacher.train_duration + bonus_from_effect
			dio_champions.champion_unit_training.selected_unit = event_data[1]
			dio_champions.champion_unit_training.selected_teacher = event_data[2]
			dio_champions.champion_unit_training.is_training = true
			dio_champions.champion_unit_training.recruit_turn = turn_number + dio_champions.champion_unit_training.turns_to_train

			dio_champions.add_training_listener()
		
			local panel = core:get_ui_root():SequentialFind("fm_dio_1")
			if panel then
				panel:InterfaceFunction("close_panel")
			end
		end,
		true
	)

	core:progress_on_loading_screen_dismissed(function()
		dio_champions.ui.update_city_infobars()
		dio_champions.ui.toggle_train_indicator(false)
		if dio_champions.champion_unit_training.is_training and dio_champions.champion_unit_training.turns_to_train > 0 then
			dio_champions.ui.toggle_train_indicator(true, dio_champions.champion_unit_training.turns_to_train)
		end
	end)

	core:add_listener(
		"troy_dio_champions_turn_start",
		"FactionTurnStart",
		function(context)
		   return context:faction():name() == dio_champions.diomedes_faction
		end,
		function(context)
			dio_champions.ui.update_city_infobars()
			dio_champions.ui.toggle_train_indicator(false)
			if dio_champions.champion_unit_training.is_training and dio_champions.champion_unit_training.turns_to_train > 0 then
				dio_champions.champion_unit_training.turns_to_train = dio_champions.champion_unit_training.turns_to_train - 1
				dio_champions.ui.toggle_train_indicator(true, dio_champions.champion_unit_training.turns_to_train)
			end
		end,
		true
	)

	core:add_listener(
		"troy_diomedes_champions_panel_opened_listener",
		"PanelOpenedCampaign",
		function(context) return context.string == "fm_dio_1" end,
		function(context)
			local panel = core:get_ui_root():SequentialFind("fm_dio_1")
			local region_manager = cm:model():world():region_manager()
			local bonus_from_effect = dio_champions.faction_get_effect_value("troy_adi_effect_army_champions_training_time")
			-- fill teachers ui
			dio_champions.ui.refresh_teachers_unlock()
			for k, v in pairs(dio_champions.teachers) do
				panel:InterfaceFunction("add_teacher_entry", v.train_duration + bonus_from_effect, not dio_champions.champions_unlocked_teachers[k], k, v.name_key, dio_champions.ui.dio_champions_teacher_unlock_key, v.description_text_key, v.effect_bundle_toolip_key, v.unlock_region)
				local new_entry = panel:SequentialFind(k)
				if new_entry then
					new_entry:SetImagePath(v.ui_icon)
					if not dio_champions.champions_unlocked_teachers[k] then
						local button_zoom = new_entry:SequentialFind("button_zoom_location")
						button_zoom:SetVisible(true)
					else
						 local button_zoom = new_entry:SequentialFind("button_zoom_location")
						button_zoom:SetVisible(false)
					end
				end
			end

			panel:InterfaceFunction("sort_teachers")

			local train_teacher_name = panel:SequentialFind("unit_in_training", "teacher", "container", "name_tx")
			local txt_no_teacher = panel:SequentialFind("unit_in_training", "teacher", "container", "txt_no_selected_unit")
			if txt_no_teacher and train_teacher_name then
				train_teacher_name:SetVisible(false)
				txt_no_teacher:SetVisible(true)
			end

			local btn_start_training = panel:SequentialFind("unit_in_training", "teacher", "footer", "btn_start_training")
			local btn_cancel_training = panel:SequentialFind("unit_in_training", "teacher", "footer", "btn_cancel_training")
			local turns_to_train = panel:SequentialFind("unit_in_training", "teacher", "text_container", "text_num_turns")
			local turns_to_train_container = panel:SequentialFind("unit_in_training", "teacher", "text_container")
			local train_panel = panel:SequentialFind("unit_in_training")

			if turns_to_train and btn_cancel_training and btn_start_training and train_panel then
				if dio_champions.champion_unit_training.is_training then
					train_panel:SetVisible(true)
					btn_start_training:SetState("inactive")
					btn_start_training:SetVisible(false)
					btn_cancel_training:SetVisible(true)
					btn_cancel_training:SetState("active")
					turns_to_train_container:SetVisible(true)
					turns_to_train:SetText(dio_champions.champion_unit_training.turns_to_train)
					local uic = panel:SequentialFind(dio_champions.champion_unit_training.selected_unit_uic_id)
					if uic then
						uic:SetState("selected")
					end
					local custom_unit = dio_champions.create_champion_custom_unit(cm:get_faction(dio_champions.diomedes_faction), dio_champions.champion_unit_training.selected_unit, dio_champions.teachers[dio_champions.champion_unit_training.selected_teacher], dio_champions.champion_unit_training.selected_teacher)
					panel:InterfaceFunction("set_teacher_stats", custom_unit)
					panel:InterfaceFunction("set_unit_in_training", dio_champions.champion_unit_training.selected_unit)
					dio_champions.ui.select_teacher(dio_champions.champion_unit_training.selected_teacher, panel)
				else
					btn_start_training:SetState("inactive")
					btn_cancel_training:SetState("inactive")
					train_panel:SetVisible(false)
					turns_to_train_container:SetVisible(false)
				end
			end

			core:add_listener(
				"troy_dio_champions_component_lclick",
				"ComponentLClickUp",
				true,
				function(context)
					dio_champions.ui.dio_champions_onclick(context)
				end,
				true
			)

		end,
		true
	)

	core:add_listener(
		"troy_diomedes_champions_panel_closed_listener",
		"PanelClosedCampaign",
		function(context) return context.string == "fm_dio_1" end,
		function(context)
			core:remove_listener("troy_dio_champions_component_lclick")
			 if not dio_champions.champion_unit_training.is_training then

				dio_champions.champion_unit_training.selected_teacher = ""
				dio_champions.champion_unit_training.selected_unit = ""
				dio_champions.champion_unit_training.selected_unit_uic_id = "" 

			 end
		end,
		true
	)
end


--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------

cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("DIO_CHAMPIONS_SELECTED_TEACHER",dio_champions.champion_unit_training.selected_teacher,context)
		cm:save_named_value("DIO_CHAMPIONS_SELECTED_UNIT",dio_champions.champion_unit_training.selected_unit,context)
		cm:save_named_value("DIO_CHAMPIONS_SELECTED_UNIT_ID",dio_champions.champion_unit_training.selected_unit_uic_id,context)
		cm:save_named_value("DIO_CHAMPIONS_TURNS_TO_TRAIN",dio_champions.champion_unit_training.turns_to_train,context)
		cm:save_named_value("DIO_CHAMPIONS_RECRUIT_TURN",dio_champions.champion_unit_training.recruit_turn,context)
		cm:save_named_value("DIO_CHAMPIONS_IS_TRAINING",dio_champions.champion_unit_training.is_training,context)
		cm:save_named_value("DIO_CHAMPUIONS_UNLOCKED_TEACHERS",dio_champions.champions_unlocked_teachers,context)
		cm:save_named_value("DIO_CHAMPUIONS_AI",dio_champions.ai,context)
	end
)

cm:add_loading_game_callback(
	function(context)
		dio_champions.champion_unit_training.selected_teacher = cm:load_named_value("DIO_CHAMPIONS_SELECTED_TEACHER",dio_champions.champion_unit_training.selected_teacher,context)
		dio_champions.champion_unit_training.selected_unit = cm:load_named_value("DIO_CHAMPIONS_SELECTED_UNIT",dio_champions.champion_unit_training.selected_unit,context)
		dio_champions.champion_unit_training.selected_unit_uic_id = cm:load_named_value("DIO_CHAMPIONS_SELECTED_UNIT_ID",dio_champions.champion_unit_training.selected_unit_uic_id,context)
		dio_champions.champion_unit_training.turns_to_train = cm:load_named_value("DIO_CHAMPIONS_TURNS_TO_TRAIN",dio_champions.champion_unit_training.turns_to_train,context)
		dio_champions.champion_unit_training.recruit_turn = cm:load_named_value("DIO_CHAMPIONS_RECRUIT_TURN",dio_champions.champion_unit_training.recruit_turn,context)
		dio_champions.champion_unit_training.is_training = cm:load_named_value("DIO_CHAMPIONS_IS_TRAINING",dio_champions.champion_unit_training.is_training,context)
		dio_champions.champions_unlocked_teachers = cm:load_named_value("DIO_CHAMPUIONS_UNLOCKED_TEACHERS",dio_champions.champions_unlocked_teachers,context)
		dio_champions.ai = cm:load_named_value("DIO_CHAMPUIONS_AI",dio_champions.ai,context)
	end
)
