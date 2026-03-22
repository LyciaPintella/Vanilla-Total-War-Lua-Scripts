out("=================================================")
out("================ Loading Tutorial ===============")
out("== phar_main_ramesses_tutorial_start.lua Loaded =")
out("=================================================")

tutorial_dev_mode = true

cm:set_saved_value("bool_is_tutorial_mode", true)

local checkpoint_str = common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_title")
cm:set_checkpoint_prefix(checkpoint_str)


--------------------------------------------------------------------------------------------------
-- List of tutorial files - they will be loaded at the bottom of this file
--------------------------------------------------------------------------------------------------

local files_to_load = {
	"_tutorial_1",
	"_tutorial_2",
	"_tutorial_3",
	"_tutorial_4",
	"_tutorial_5",
	"_tutorial_6",
	"_tutorial_7",
	"_tutorial_8",
	"_tutorial_next_turns",
	"_tutorial_additional"
}


--------------------------------------------------------------------------------------------------
-- FIRST TICK: start from checkpoint
---------------------------------------------------------------------------------------------------

cm:add_first_tick_callback_sp_each(
	function()
		cm:start_from_checkpoint()
	end
)


--------------------------------------------------------------------------------------------------
-- Tutorial data declaration
---------------------------------------------------------------------------------------------------

tut = {}

if tutorial_dev_mode then
	tut.SHOULD_SAVE_EVERY_CHECKPOINT_START_END = false						-- save at every checkpoint at the star or end of a turn?
	tut.SHOULD_SAVE_EVERY_CHECKPOINT_MID = true						-- save at every checkpoint for everything else?
	tut.ALWAYS_GENERATE_NAMED_SAVEGAMES = true					-- generate named savegames instead of autosaving when reaching checkpoints
	cm:set_checkpoint_names_use_checkpoint_id(false)			-- checkpoint id is embedded in the names of savegame
end


tut.player_faction_key = "phar_main_ramesses"
tut.merneptah_faction_key = "phar_main_merneptah"
tut.pi_ramesses_faction_key = "phar_main_pi_ramesses"
tut.sukhot_faction_key = "phar_main_sukhot"
tut.per_amun_faction_key = "phar_main_per_amun"

tut.seti_faction_key = "phar_main_seti"
tut.tausret_faction_key = "phar_main_tausret"
tut.amenmesse_faction_key = "phar_main_amenmesse"
tut.kurunta_faction_key = "phar_main_kurunta"
tut.suppiluliuma_faction_key = "phar_main_suppiluliuma"

tut.beersheba_faction_key = "phar_main_beersheba"
tut.timna_faction_key = "phar_main_timna"
tut.hetch_faction_key = "phar_main_hetch"
tut.buhen_faction_key = "phar_main_buhen"
tut.kawa_faction_key = "phar_main_kawa"
tut.mes_faction_key = "phar_main_mes"


--tut.player_faction_leader_fm_cqi = cm:get_saved_value("player_faction_leader_fm_cqi")

if not tut.player_faction_leader_fm_cqi then
	tut.player_faction_leader_fm_cqi = cm:get_local_faction():faction_leader():family_member():command_queue_index()
	--cm:set_saved_value("player_faction_leader_fm_cqi", tut.player_faction_leader_fm_cqi)
end

if not tut.player_faction_leader_mf_cqi then
	tut.player_faction_leader_mf_cqi = cm:get_local_faction():faction_leader():military_force():command_queue_index()
end

if not tut.player_faction_leader_cqi then
	tut.player_faction_leader_cqi = cm:get_local_faction():faction_leader():command_queue_index()
end

tut.player_faction_recruited_hero_cqi = cm:get_saved_value("player_faction_recruited_hero_cqi")

tut.sukkot_hero_1_fm_cqi = cm:get_saved_value("sukkot_hero_1_fm_cqi")
tut.sukkot_hero_2_fm_cqi = cm:get_saved_value("sukkot_hero_2_fm_cqi")
tut.sukkot_hero_3_fm_cqi = cm:get_saved_value("sukkot_hero_3_fm_cqi")
tut.sukkot_hero_4_fm_cqi = cm:get_saved_value("sukkot_hero_4_fm_cqi")
tut.sukkot_hero_5_fm_cqi = cm:get_saved_value("sukkot_hero_5_fm_cqi")

tut.nekhel = "phar_main_north_sinai_nekhel"
tut.north_sinai_province = cm:get_region(tut.nekhel):province():name()
tut.neb_gehes = "phar_main_north_sinai_neb_gehes"
tut.sukkot = "phar_main_north_sinai_sukkot"
tut.per_amun = "phar_main_pi_ramesses_per_amun"
tut.azzati = "phar_main_north_sinai_azzati"

tut.ADVICE_DURATION_S = 8
tut.NEXT_ADVICE_DELAY_S = 0.5
tut.TEXT_POINTER_DURATION_S = 20
tut.INFO_TEXT_DURATION_S = 30
tut.HIGHLIGHT_CALLBACK_DELAY_S = 2
tut.SCROLL_CAMERA_DURATION_S = 4
tut.OBJECTIVE_REMOVE_DELAY = 3

tut.info_overlay_opened = false
tut.next_step_started = false
tut.next_step_started_check_time = 12

tut.advisor_texts = {}
tut.add = {}

tut.advisor_texts.turn_0 = {
	v2_campaign_start_1_mern = {
		advice_key = "phar_main_tutorial_v2_campaign_start_1_mern",
	},
	v2_campaign_start_2_ram = {
		advice_key = "phar_main_tutorial_v2_campaign_start_2_ram",
	},
	v2_campaign_start_3_mern = {
		advice_key = "phar_main_tutorial_v2_campaign_start_3_mern"
	},
	v2_ramesses_on_focus_ram = {
		advice_key = "phar_main_tutorial_v2_ramesses_on_focus_ram"
	},
}

tut.advisor_texts.turn_1 = {	
	--Flyby
	v2_campaign_start_1_mern = {
		advice_key = "phar_main_tutorial_v2_campaign_start_1_mern",
	},
	v2_campaign_start_2_ram = {
		advice_key = "phar_main_tutorial_v2_campaign_start_2_ram",
	},
	v2_start_3_mern = {
		advice_key = "phar_main_tutorial_v2_campaign_start_3_mern",
	},
	v2_ramesses_on_focus_ram = {
		advice_key = "phar_main_tutorial_v2_ramesses_on_focus_ram",
	},
	--End of Flyby

	v2_character_introduction_pract = {
		advice_key = "phar_main_tutorial_v2_character_introduction_pract",
	},
	v2_hero_selection_ram = {
		advice_key = "phar_main_tutorial_v2_hero_selection_ram",
		objective_key = "phar_tutorial_ramesses_army_select_obj_01",
		infotext = {
			"phar_tutorial_camp_ramesses_hero_selection_info_00",
			"phar_tutorial_camp_ramesses_hero_selection_info_01",
			"phar_tutorial_camp_ramesses_hero_selection_info_02",
			"phar_tutorial_camp_ramesses_hero_selection_info_03"
		}
	},
	v2_hero_ui_movement_bar_pract = {
		advice_key = "phar_main_tutorial_v2_hero_ui_movement_bar_pract",
	},
	v2_hero_movement_pract = {
		advice_key = "phar_main_tutorial_v2_hero_movement_pract",
		objective_key = "phar_tutorial_ramesses_army_select_obj_02",
	},
	v2_advisor_arrive_mern = {
		advice_key = "phar_main_tutorial_v2_city_demolished_mern",
	},
	v2_advisor_button_1_mern = {
		advice_key = "phar_main_tutorial_v2_advisor_button_1_mern",
		objective_key = "phar_tutorial_ramesses_advisor_button_obj_01",
		infotext = {
			"phar_tutorial_camp_ramesses_advisor_button_info_00",
			"phar_tutorial_camp_ramesses_advisor_button_info_01",
			"phar_tutorial_camp_ramesses_advisor_button_info_02"
		}
	},
	v2_advisor_button_2_pract = {
		advice_key = "phar_main_tutorial_v2_advisor_button_2_pract",
	},
	v2_end_turn_pract = {
		advice_key = "phar_main_tutorial_v2_end_turn_pract",
		objective_key = "phar_tutorial_ramesses_end_turn_obj_01",
		infotext = {
			"phar_tutorial_camp_ramesses_turns_info_00",
			"phar_tutorial_camp_ramesses_turns_info_01",
			"phar_tutorial_camp_ramesses_turns_info_02",
			"phar_tutorial_camp_ramesses_turns_info_03"
		}
	},	
}

tut.advisor_texts.turn_2 = {
	v2_camera_controls_1_mern = {
		advice_key = "phar_main_tutorial_v2_camera_controls_1_mern",
	},
	v2_camera_controls_2_ram = {
		advice_key = "phar_main_tutorial_v2_camera_controls_2_ram",
		objective_key = "phar_tutorial_ramesses_explore_the_land_obj_01",
		infotext = {
			"phar_tutorial_camp_ramesses_camera_controls_info_01",
			"phar_tutorial_camp_ramesses_camera_controls_info_02",
			"phar_tutorial_camp_ramesses_camera_controls_info_03"
		}
	},
	v2_camera_controls_3_mern = {
		advice_key = "phar_main_tutorial_v2_camera_controls_3_mern",
	},
	v2_camera_controls_4_pract = {
		advice_key = "phar_main_tutorial_v2_camera_controls_4_pract",
	},
	v2_city_in_distress_1_pract = {
		advice_key = "phar_main_tutorial_v2_city_in_distress_1_pract",
		infotext = {
			"phar_tutorial_camp_ramesses_city_in_distress_info_00",
			"phar_tutorial_camp_ramesses_city_in_distress_info_01",
			"phar_tutorial_camp_ramesses_city_in_distress_info_02",
			"phar_tutorial_camp_ramesses_city_in_distress_info_03"
		}
	},
	v2_city_in_distress_1_1_pract = {
		advice_key = "phar_main_tutorial_v2_city_in_distress_1_1_pract"
	},
	v2_city_in_distress_2_mern = {
		advice_key = "phar_main_tutorial_v2_city_in_distress_2_mern",
		selection_objective_key = "phar_tutorial_ramesses_reach_nekhel_obj_01",
		movement_objective_key = "phar_tutorial_ramesses_reach_nekhel_obj_02"
	},
	v2_city_in_distress_3_pract = {
		advice_key = "phar_main_tutorial_v2_city_in_distress_3_pract",
	},
	v2_pre_advanced_tutorial_mern = {
		advice_key = "phar_main_tutorial_v2_pre_advanced_tutorial_mern",
	},
	v2_post_advanced_tutorial_1_mern = {
		advice_key = "phar_main_tutorial_v2_post_advanced_tutorial_1_mern",
		infotext = {
			"phar_tutorial_camp_ramesses_post_battle_info_00",
			"phar_tutorial_camp_ramesses_post_battle_info_01",
			"phar_tutorial_camp_ramesses_post_battle_info_02",
			"phar_tutorial_camp_ramesses_post_battle_info_03"
		}
	},
	v2_post_advanced_tutorial_2_pract = {
		advice_key = "phar_main_tutorial_v2_post_advanced_tutorial_2_pract",
	}
}

tut.advisor_texts.turn_3 = {
	v2_city_restoration_1_ram = {
		advice_key = "phar_main_tutorial_v2_city_restoration_1_ram"
	},
	v2_city_restoration_2_mern = {
		advice_key = "phar_main_tutorial_v2_city_restoration_2_mern"
	},
	v2_city_restoration_3_ram = {
		advice_key = "phar_main_tutorial_v2_city_restoration_3_ram",
		infotext = {
			"phar_tutorial_camp_ramesses_city_restoration_info_00",
			"phar_tutorial_camp_ramesses_city_restoration_info_01",
			"phar_tutorial_camp_ramesses_city_restoration_info_02",
			"phar_tutorial_camp_ramesses_city_restoration_info_03"
		},
		select_nekhel_objective = "phar_tutorial_ramesses_select_nekhel_obj_01",
		repair_building_objective = "phar_tutorial_ramesses_repair_building_objective_obj_01"
	},
	v2_city_repair_pract = {
		advice_key = "phar_main_tutorial_v2_city_repair_pract"
	},
	v2_resource_panel_1_pract = {
		advice_key = "phar_main_tutorial_v2_resource_panel_1_pract"
	},
	v2_resource_panel_2_ram   = {
		advice_key = "phar_main_tutorial_v2_resource_panel_2_ram"
	},
	v2_city_construction_1_pract = {
		advice_key = "phar_main_tutorial_v2_city_construction_1_pract",
		infotext = {
			"phar_camp_info_buildings_01",
			"phar_tutorial_camp_ramesses_city_construction_info_01",
			"phar_tutorial_camp_ramesses_city_construction_info_02",
			"phar_tutorial_camp_ramesses_city_construction_info_03",
			"phar_tutorial_camp_ramesses_city_construction_info_04"
		},
		build_objective = "phar_tutorial_ramesses_build_a_building_obj_01"
	},
	v2_city_construction_2_pract = {
		advice_key = "phar_main_tutorial_v2_city_construction_2_pract"
	},
	v2_threat_elimination_ram = {
		advice_key = "phar_main_tutorial_v2_threat_elimination_ram"
	},
	v2_ambitions_mern = {
		advice_key = "phar_main_tutorial_v2_ambitions_mern",
		infotext = {
			"phar_camp_info_ambitions_01",
			"phar_tutorial_camp_ramesses_ambitions_info_01",
			"phar_tutorial_camp_ramesses_ambitions_info_02",
			"phar_tutorial_camp_ramesses_ambitions_info_03"
		}
	},
	v2_chase_the_enemy_1_ram = {
		advice_key = "phar_main_tutorial_v2_chase_the_enemy_1_ram",
		selection_objective = "phar_tutorial_ramesses_army_select_obj_01",
	},
	v2_chase_the_enemy_2_pract = {
		advice_key = "phar_main_tutorial_v2_chase_the_enemy_2_pract",
		infotext = {
			"phar_tutorial_camp_ramesses_attack_info_00",
			"phar_tutorial_camp_ramesses_attack_info_01",
			"phar_tutorial_camp_ramesses_attack_info_02",
			"phar_tutorial_camp_ramesses_attack_info_03"
		},
		eliminate_general_objective = "phar_tutorial_ramesses_eliminate_enemy_general_obj_01"
	},
	v2_sukkot_army_2_stands_their_ground_ram = {
		advice_key = "phar_main_tutorial_v2_sukhot_army_2_stands_their_ground_ram"
	},
	v2_sukhot_army_2_flee_ram ={
		advice_key = "phar_main_tutorial_v2_sukhot_army_2_flee_ram"
	},
	v2_recruitment_pract = {
		advice_key = "phar_main_tutorial_v2_recruitment_pract",
		infotext = {
			"troy_camp_info_unit_recruitment_01",
			"phar_tutorial_camp_ramesses_recruitment_info_01",
			"phar_tutorial_camp_ramesses_recruitment_info_02"
		},
		selection_objective = "troy_tutorial_camp_agamemnon_army_select_obj_01",
		panel_objective = "troy_tutorial_camp_agamemnon_recruitment_obj_01", -- Open the Recruitment panel.
		recruitment_objective = "troy_tutorial_camp_agamemnon_recruitment_obj_02", -- Recruit additional Units
		recruitment_limit = 2,
		--end_advice = "phar_main_tutorial_v2_recruitment_issued_pract", -- A most excellent choice! These brave men will serve you well. They will need time to arrive and in the meantime your army will be unable to move away..
		initial_infotext = {
			--"troy_tutorial_camp_agamemnon_recruitment_info_01",	--You will need additional units.
			--"troy_tutorial_camp_agamemnon_recruitment_info_02"	--You can order your army to recruit them.
		},
		unit_card_infotext = {
			--"troy_tutorial_camp_agamemnon_recruitment_info_03",	--These are the units available for recruitment.
			--"troy_tutorial_camp_agamemnon_recruitment_info_04"	--Left-click on a unit card to recruit the unit.
		}
	},
	v2_scripter_tours_pract = {
		advice_key = "phar_main_tutorial_v2_scripter_tours_pract",
		infotext = {
			"phar_tutorial_camp_ramesses_in_game_help_info_00",
			"phar_tutorial_camp_ramesses_in_game_help_info_01",
			"phar_tutorial_camp_ramesses_in_game_help_info_02",
			"phar_tutorial_camp_ramesses_in_game_help_info_03"
		},
		overlay_objective = "phar_tutorial_ramesses_overlay_obj_01"
	},
	v2_end_turn_3_pract = {
		advice_key = "phar_main_tutorial_v2_end_turn_3_pract"
	},
}

tut.advisor_texts.turn_4 = {
	v2_continue_the_attack_mern = {
		advice_key =  "phar_main_tutorial_v2_continue_the_attack_mern",
		infotext = {
			"phar_main_st_battle_fundamentals_0070",
			"phar_tutorial_camp_ramesses_reinforcements_info_01",
			"phar_tutorial_camp_ramesses_reinforcements_info_02"
		},
		selection_objective = "phar_tutorial_ramesses_army_select_obj_01",
		attack_objective = "phar_tutorial_ramesses_attack_obj_01",
	},
	v2_auto_resolve_pract = {
		advice_key =  "phar_main_tutorial_v2_auto_resolve_pract"
	},
	v2_capture_region_ambition_1_mern = {
		advice_key =  "phar_main_tutorial_v2_capture_region_ambition_1_mern"
	},
	v2_capture_region_ambition_2_pract = {
		advice_key =  "phar_main_tutorial_v2_capture_region_ambition_2_pract"
	},
	v2_capture_region_3_mern = {
		advice_key =  "phar_main_tutorial_v2_capture_region_3_mern",
		infotext = {
			"phar_tutorial_camp_ramesses_capture_settlement_info_00",
			"phar_tutorial_camp_ramesses_capture_settlement_info_01",
			"phar_tutorial_camp_ramesses_capture_settlement_info_03"
		},
		capture_sukkot_objective = "phar_tutorial_ramesses_capture_sukkot_obj_01"
	},
	v2_settlement_captured_pract = {
		advice_key =  "phar_main_tutorial_v2_settlement_captured_pract",
		infotext = {
			"phar_tutorial_camp_ramesses_capture_settlement_info_10",
			"phar_tutorial_camp_ramesses_capture_settlement_info_11",
			"phar_tutorial_camp_ramesses_capture_settlement_info_12"
		}
	},
	v2_sukhot_army_2_battle_won_pract = {
		advice_key = "phar_main_tutorial_v2_sukhot_army_2_battle_won_pract"
	},
	v2_rest_of_turn_1_mern = {
		advice_key =  "phar_main_tutorial_v2_rest_of_turn_1_mern",
		infotext = {
			"phar_tutorial_camp_ramesses_rest_of_turn_info_00",
			"phar_tutorial_camp_ramesses_rest_of_turn_info_01",
			"phar_tutorial_camp_ramesses_rest_of_turn_info_02"
		}
	},
	v2_rest_of_turn_2_ram = {
		advice_key =  "phar_main_tutorial_v2_rest_of_turn_2_ram"
	},
	v2_rest_of_turn_3_mern = {
		advice_key =  "phar_main_tutorial_v2_rest_of_turn_3_mern"
	},
	v2_diplomatic_offer_1_ram = {
		advice_key =  "phar_main_tutorial_v2_diplomatic_offer_1_ram",
		infotext = {
			"phar_tutorial_camp_ramesses_diplomacy_info_00",
			"phar_tutorial_camp_ramesses_diplomacy_info_01",
			"phar_tutorial_camp_ramesses_diplomacy_info_02"
		}
	},
	v2_diplomatic_offer_2_mern = {
		advice_key =  "phar_main_tutorial_v2_diplomatic_offer_2_mern"
	},
}

tut.advisor_texts.turn_5 = {
	v2_enemy_born_mern = {
		advice_key = "phar_main_tutorial_v2_enemy_born_mern",
	},
	v2_no_trust_mern = {
		advice_key = "phar_main_tutorial_v2_no_trust_mern",
	},
	v2_pi_ramesses_mern = {
		advice_key = "phar_main_tutorial_v2_pi_ramesses_mern",
	},
	v2_worry_mern = {
		advice_key = "phar_main_tutorial_v2_worry_mern",
	},
	v2_worry_not_ram = {
		advice_key = "phar_main_tutorial_v2_worry_not_ram",
	},
	v2_province_management_pract = {
		advice_key = "phar_main_tutorial_v2_province_management_pract",
		open_province_panel_objective = "phar_tutorial_ramesses_province_management_obj_01",
		check_province_management_objective = "phar_tutorial_ramesses_check_province_management_obj_01",
		infotext = {
			"phar_tutorial_camp_ramesses_province_management_info_00",
			"phar_tutorial_camp_ramesses_province_management_info_01",
			"phar_tutorial_camp_ramesses_province_management_info_02"
		}
	},
	v2_province_management_happiness_pract = {
		advice_key = "phar_main_tutorial_v2_province_management_happiness_pract",
	},
	v2_province_management_workforce_pract = {
		advice_key = "phar_main_tutorial_v2_province_management_workforce_pract",
	},
	v2_province_management_production_pract = {
		advice_key = "phar_main_tutorial_v2_province_management_production_pract",
	},
	v2_ambition_increase_happiness_pract = {
		advice_key = "phar_main_tutorial_v2_ambition_increase_happiness_pract",
		increase_happiness_objective = "phar_tutorial_ramesses_increase_happiness_obj_01",
		infotext = {
			"phar_tutorial_camp_ramesses_increase_happiness_info_00",
			"phar_tutorial_camp_ramesses_increase_happiness_info_01"
		}
	},
	v2_hero_recruitment_1_mern = {
		advice_key = "phar_main_tutorial_v2_hero_recruitment_1_mern",
		select_settlement_objective = "phar_tutorial_ramesses_hero_recruitment_obj_01",
	},
	v2_hero_recruitment_2_pract = {
		advice_key = "phar_main_tutorial_v2_hero_recruitment_2_pract",
		open_list_of_heroes_objective = "phar_tutorial_ramesses_hero_recruitment_obj_02",
	},
	v2_hero_recruitment_3_pract = {
		advice_key = "phar_main_tutorial_v2_hero_recruitment_3_pract",
		recruit_hero_objective = "phar_tutorial_ramesses_hero_recruitment_obj_03"
	},
}

tut.advisor_texts.turn_6 = {
	v2_crossing_the_desert_mern = {
		advice_key =  "phar_main_tutorial_v2_crossing_the_desert_mern",
		colonize_neb_gehes_objective = "phar_tutorial_ramesses_colonize_neb_gehes"
	},
	v2_resurrecting_neb_gehes_ram = {
		advice_key =  "phar_main_tutorial_v2_resurrecting_neb_gehes_ram"
	},
	v2_great_idea_mern = {
		advice_key =  "phar_main_tutorial_v2_great_idea_mern"
	},
	v2_end_turn_warnings_1_mern = {
		advice_key =  "phar_main_tutorial_v2_end_turn_warnings_1_mern"
	},
	v2_end_turn_warnings_2_ram = {
		advice_key =  "phar_main_tutorial_v2_end_turn_warnings_2_ram"
	},
}

tut.advisor_texts.turn_7 = {
	v2_technology_select_mern = {
		advice_key =  "phar_main_tutorial_v2_technology_select_mern",
		infotext = {
			"phar_camp_info_decrees_01",
			"phar_tutorial_camp_ramesses_royal_decrees_info_01",
			"phar_tutorial_camp_ramesses_royal_decrees_info_02"
		},
		tech_panel_open_objective = "phar_tutorial_ramesses_royal_decrees_obj_01"
	},
	v2_technology_chosen_pract = {
		advice_key =  "phar_main_tutorial_v2_technology_chosen_pract",
		tech_objective = "phar_tutorial_ramesses_royal_decrees_obj_02"
	},
	v2_technology_close_mern = {
		advice_key =  "phar_main_tutorial_v2_technology_close_mern",
	},
	v2_rest_of_turn_7 = {
		"phar_main_tutorial_v2_rest_of_turn_7"
	}
}


tut.advisor_texts.turn_8 = {
	v2_friendly_ers_pract = {
		advice_key =  "phar_main_tutorial_v2_friendly_ers_pract",
		infotext = {
			"phar_tutorial_camp_ramesses_friend_ers_info_00",
			"phar_camp_info_ers_intro_02",
			"phar_camp_info_ers_intro_03"
		}
	},
	v2_enemy_ers_pract = {
		advice_key =  "phar_main_tutorial_v2_enemy_ers_pract",
		infotext = {
			"phar_tutorial_camp_ramesses_enemy_ers_info_00",
			"phar_tutorial_camp_ramesses_enemy_ers_info_01",
			"phar_tutorial_camp_ramesses_enemy_ers_info_02"
		}
	},
	v2_cadmean_victory_pract = {
		advice_key =  "phar_main_tutorial_v2_cadmean_victory_pract",
	},
}




tut.advisor_texts.next_turns = {

	phar_main_tutorial_v2_ramesses_respawned_ram = {
		advice_key =  "phar_main_tutorial_v2_ramesses_respawned_ram"
	},
	
	v2_practical_advisor_siege = {
		advice_key =  "phar_main_tutorial_practical_advisor_siege"
	},
	v2_practical_advisor_siege_equipment = {
		advice_key =  "phar_main_tutorial_practical_advisor_siege_equipment"
	},
	v2_practical_advisor_siege_equipment_in_construction_advice = {
		advice_key =  "phar_main_tutorial_practical_advisor_siege_equipment"
	},
	v2_colonize_1_mern = {
		advice_key =  "phar_main_tutorial_v2_colonize_1_mern"
	},
	v2_colonize_2_pract = {
		advice_key =  "phar_main_tutorial_v2_colonize_2_pract"
	},
	v2_colonize_3_ram = {
		advice_key =  "phar_main_tutorial_v2_colonize_3_ram"
	},
	v2_merneptah_conquered_first_settlement = {
		advice_key =  "phar_main_tutorial_merneptah_conquered_first_settlement"
	},
	v2_merneptah_conquered_first_major_settlement = {
		advice_key =  "phar_main_tutorial_merneptah_conquered_first_major_settlement"
	},
	merneptah_advisor_legitimacy_1 = {
		advice_key =  "phar_main_tutorial_merneptah_legitimacy_1",
		infotext = {
			"phar_tutorial_camp_ramesses_legitimacy_info_00",
			"phar_tutorial_camp_ramesses_legitimacy_info_01",
			"phar_tutorial_camp_ramesses_legitimacy_info_02",
			"phar_tutorial_camp_ramesses_legitimacy_info_03"
		},
		open_legitimacy_objective = "phar_tutorial_ramesses_legitimacy_obj_01"
	},
	merneptah_advisor_legitimacy_2 = {
		advice_key =  "phar_main_tutorial_merneptah_legitimacy_2",
		choose_legitimacy_objective = "phar_tutorial_ramesses_legitimacy_obj_02"
	},
	practical_advisor_legitimacy_info_overlay = {
		advice_key =  "phar_main_tutorial_practical_advisor_legitimacy_info_overlay",
	},
	v2_merneptah_advisor_own_settlements = {
		advice_key = "phar_main_tutorial_merneptah_own_multiple_regions",
		own_settlements_objective = "phar_tutorial_ramesses_own_settlements_obj_01"
	},
	practical_advisor_legitimacy_war_1 = {
		advice_key =  "phar_main_tutorial_practical_advisor_legitimacy_war_1",
		open_crown_panel_objective = "phar_tutorial_ramesses_legitimacy_war_obj_01"
	},
	ramesses_legitimacy_war_2 = {
		advice_key =  "phar_main_tutorial_ramesses_legitimacy_war_2",
		join_legitimacy_war_objective = "phar_tutorial_ramesses_legitimacy_war_obj_02"
	},
	practical_advisor_legitimacy_war_3 = {
		advice_key =  "phar_main_tutorial_practical_advisor_legitimacy_war_3"
	},
	ramesses_legitimacy_war_4 = {
		advice_key =  "phar_main_tutorial_ramesses_legitimacy_war_4"
	},

	v2_conquer_per_amun = {
		objective = "phar_tutorial_ramesses_conquer_per_amun_obj_01"
	}
}

-- end of tutorial data declaration








--------------------------------------------------------------------------------------------------
-- Common tutorial functions
--------------------------------------------------------------------------------------------------

function set_next_step_started(started)
	if started then
		tut.next_step_started = true
		cm:callback(
			function() 
				tut.next_step_started = false
			end,
			tut.next_step_started_check_time + 1
		)
	else
		tut.next_step_started = false
	end
end


function tut_add_infotext(t)
	if is_table(t) and #t > 0 then
		cm:add_infotext_with_leader(unpack(t))
	end;
end

function tut_add_infotext_clear(t)
	if is_table(t) and #t > 0 then
		cm:add_infotext_with_leader(unpack(t))
		cm:set_infotext_auto_clear_timer(tut.INFO_TEXT_DURATION_S)
	end;
end


function info_overlay_cheat_sheet_and_highlight(info_overlay_opened_callback, completion_callback)
	core:hide_fullscreen_highlight()

	local ui_root = core:get_ui_root()
	local text_pointer_parent = nil 
	for i = ui_root:ChildCount() - 1, 0, -1 do
		local uic = UIComponent(ui_root:Find(i))
		if uic:Id() == "text_pointer_parent" then
			text_pointer_parent = uic
			break
		end
	end

	if text_pointer_parent then
		for i = 0, text_pointer_parent:ChildCount() - 1 do
			UIComponent(text_pointer_parent:Find(i)):Destroy()
		end
	end

	show_info_overlay_cheat_sheet(true)

	local button_help_overlay = find_uicomponent(core:get_ui_root(), "menu_bar", "button_help_overlay")
	local button_help_overlay_diplomacy = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown", "diplomacy_hud_overlays", "button_help_overlay_diplomacy")
	if button_help_overlay and button_help_overlay:Visible() then
		button_help_overlay:Highlight(true, false, 0, true) --highlight_component(true, false, "menu_bar", "button_help_overlay")
	elseif button_help_overlay_diplomacy and button_help_overlay_diplomacy:Visible() then
		button_help_overlay_diplomacy:Highlight(true, false, 0, true)
	end

	-- tut.info_overlay_opened = false
	-- core:add_listener(
    --     "info_overlays_shortcut_f1",
    --     "ShortcutPressed",
    --     function(context) return context.string == "script_F1_button_overlays" end,
    --     function(context)
	-- 		hide_advisor_cheat_sheet_and_highlights()
	-- 		if tut.info_overlay_opened == true then
	-- 			if not tut.next_step_started then
	-- 				set_next_step_started(true)
	-- 				core:remove_listener("info_overlays_button_clicked")
	-- 				core:remove_listener("info_overlays_shortcut_f1")
	-- 				core:remove_listener("info_overlays_shortcut_esc")

	-- 				if is_function(completion_callback) then
	-- 					completion_callback()
	-- 				end
	-- 			end
	-- 		else
	-- 			if is_function(info_overlay_opened_callback) then
	-- 				info_overlay_opened_callback()
	-- 			end
	-- 		end
	-- 		tut.info_overlay_opened = true
    --     end,
    --     true
    -- )
	-- core:add_listener(
    --     "info_overlays_button_clicked",
    --     "ComponentLClickUp",
    --     function(context) return context.string == "button_help_overlay" or context.string == "button_help_overlay_diplomacy" end,
    --     function(context)
	-- 		hide_advisor_cheat_sheet_and_highlights()
	-- 		if tut.info_overlay_opened == true then
	-- 			if not tut.next_step_started then
	-- 				set_next_step_started(true)
	-- 				core:remove_listener("info_overlays_shortcut_f1")
	-- 				core:remove_listener("info_overlays_button_clicked")
	-- 				core:remove_listener("scripted_tour_finished")

	-- 				if is_function(completion_callback) then
	-- 					completion_callback()
	-- 				end
	-- 			end
	-- 		else
	-- 			if is_function(info_overlay_opened_callback) then
	-- 				info_overlay_opened_callback()
	-- 			end
	-- 		end
	-- 		tut.info_overlay_opened = true
    --     end,
    --     true
    -- )
	core:add_listener(
        "scripted_tour_finished",
        "ScriptEventScriptedTourCompleted",
        function(context) return true end,
        function(context)
			hide_advisor_cheat_sheet_and_highlights()
			--if tut.info_overlay_opened == true then
				-- if not tut.next_step_started then
				-- 	set_next_step_started(true)
				-- 	core:remove_listener("info_overlays_button_clicked")
				-- 	core:remove_listener("info_overlays_shortcut_f1")
				-- 	core:remove_listener("info_overlays_shortcut_esc")
					if is_function(completion_callback) then
						completion_callback()
					end
				-- end
			--end
        end,
        false
    )
	core:add_listener(
        "info_overlays_opened",
        "ScriptEventInfoOverlayToggled",
        function(context) return context.bool == true end,
        function(context)
			hide_advisor_cheat_sheet_and_highlights()
			if is_function(info_overlay_opened_callback) then
				info_overlay_opened_callback()
			end
        end,
        false
    )
	core:add_listener(
        "info_overlays_closed",
        "ScriptEventInfoOverlayToggled",
        function(context) return context.bool == false and not core:get_active_scripted_tour() end,
        function(context)
			hide_advisor_cheat_sheet_and_highlights()
			if is_function(completion_callback) then
				completion_callback()
			end
        end,
        false
    )
	
	-- cm:callback(
	-- 	function()
	-- 		if not tut.next_step_started then
	-- 			set_next_step_started(true)
	-- 			hide_advisor_cheat_sheet_and_highlights()
	-- 			core:remove_listener("info_overlays_button_clicked")
	-- 			core:remove_listener("info_overlays_shortcut_f1")
	-- 			core:remove_listener("info_overlays_shortcut_esc")

	-- 			if is_function(completion_callback) then
	-- 				completion_callback()
	-- 			end
	-- 		end
	-- 	end,
	-- 	60
	-- )
end

function hide_advisor_cheat_sheet_and_highlights()
	show_info_overlay_cheat_sheet(false)
	uim:unhighlight_all_for_tooltips(true)

	if find_uicomponent(core:get_ui_root(), "menu_bar", "button_help_overlay") then
		highlight_component(false, false, "menu_bar", "button_help_overlay")
	elseif find_uicomponent(core:get_ui_root(), "diplomacy_dropdown", "button_help_overlay_diplomacy") then
		highlight_component(false, false, "diplomacy_dropdown ", "button_help_overlay_diplomacy")
	end

	cm:clear_infotext()
	cm:dismiss_advice()
end

function show_campaign_controls_cheat_sheet(show)
	local panel, was_created_now = core:get_or_create_component("cheat_sheet_panel", "ui/common ui/cheat_sheet", core:get_ui_root())
	if show then
		if was_created_now then
			move_cheat_sheet_to_default_position(panel)

			local minimise_button = panel:SequentialFind("button_minimise")
			if minimise_button then
				core:add_listener(
					"cheet_sheet_on_button_minimise",
					"ComponentLClickUp",
					function(context) return context.string == "button_minimise" end,
					function(context)
						local listview = panel:SequentialFind("listview")
						if listview then
							listview:SetVisible(not listview:Visible())
						end
					end,
					true
				)
			end
		end
	else
		if panel then
			panel:Destroy()
		end
	end

	panel:InterfaceFunction("add_info_text_entry", "troy.help.page.controls_cheat_sheet.001", "header")
	panel:InterfaceFunction("add_info_text_entry", "troy.help.page.controls_cheat_sheet.002", "prelude_controls_campaign_camera")
	panel:InterfaceFunction("add_info_text_entry", "troy.help.page.controls_cheat_sheet.003", "prelude_controls_campaign_camera_alt")
	panel:InterfaceFunction("add_info_text_entry", "troy.help.page.controls_cheat_sheet.004", "prelude_controls_campaign_camera_altitude")
	panel:InterfaceFunction("add_info_text_entry", "troy.help.page.controls_cheat_sheet.005", "prelude_controls_campaign_camera_facing")
end

function show_info_overlay_cheat_sheet(show)
	local panel, was_created_now = core:get_or_create_component("cheat_sheet_panel", "ui/common ui/cheat_sheet", core:get_ui_root())
	if show then
		if was_created_now then
			move_cheat_sheet_to_default_position(panel)

			local minimise_button = panel:SequentialFind("button_minimise")
			if minimise_button then
				core:add_listener(
					"cheet_sheet_on_button_minimise",
					"ComponentLClickUp",
					function(context) return context.string == "button_minimise" end,
					function(context)
						local listview = panel:SequentialFind("listview")
						if listview then
							listview:SetVisible(not listview:Visible())
						end
					end,
					true
				)
			end
		end
	
		panel:InterfaceFunction("add_info_text_entry", "phar_main_tutorial_cheat_sheet_info_overlay_toggle_header", "header")
		panel:InterfaceFunction("add_info_text_entry", "phar_main_tutorial_cheat_sheet_info_overlay_toggle_button", "prelude_controls_campaign_info_overlay")
	else
		if panel then
			panel:Destroy()
		end
	end

end

function move_cheat_sheet_to_default_position(panel)
	local screen_x, screen_y = core:get_screen_resolution()
	local panel_size_x, panel_size_y = panel:Bounds()

	local x_offset = 50
	local y_offset = 50

	local options_buttons = core:get_ui_root():SequentialFind("menu_bar", "buttongroup")
	if options_buttons then
		y_offset = y_offset + options_buttons:Height()
	end

	--Put the cheat sheet on the right side of the screen
	panel:MoveTo(screen_x - panel_size_x - x_offset, y_offset)
end



function highlight_pre_battle_options()
	local pre_battle_options_ui = find_uicomponent(core:get_ui_root(), "popup_pre_battle")
	if pre_battle_options_ui and pre_battle_options_ui:Visible() then
		uim:highlight_pre_battle_options(true)
	end
end

function lock_end_turn()
	local end_turn_button = find_uicomponent(core:get_ui_root(), "hud_campaign", "faction_buttons_docker","end_turn_docker", "button_end_turn")
	if end_turn_button then
		pulse_uicomponent(end_turn_button, false)
		highlight_component(false, false, "faction_buttons_docker","end_turn_docker", "button_end_turn")
	end
	uim:override("end_turn"):lock()
	if not cm:get_saved_value("unlock_hide_faction_widget_buttons") then
		uim:override("hide_faction_widget_buttons"):lock()
	end
end

function end_turn_highlight(first_time, start_highlight_s, stop_highlight_s)
	set_next_step_started(true)
	uim:override("end_turn"):unlock()
	uim:override("journal"):unlock()
	uim:override("hide_faction_buttons_docker"):unlock()

	local end_turn_button

	-- -- Uncomment this if you want an active pointer for the end_turn button
	-- local ap = active_pointer:new(
	-- 	"show_end_turn_button",
	-- 	"bottomleft",
	-- 	function()
	-- 		return find_uicomponent(core:get_ui_root(), "hud_campaign", "button_end_turn");
	-- 	end,
	-- 	"ui_text_replacements_localised_text_phar_text_pointer_end_turn",
	-- 	0,
	-- 	0,
	-- 	nil,
	-- 	true
	-- )
	-- cm:callback(
	-- 	function()
	-- 		if cm:turn_number() == 1 and end_turn_button then
	-- 			ap:show_when_ready()
	-- 		end
	-- 	end,
	-- 	1
	-- )

	if not start_highlight_s then
		start_highlight_s = 1
	end

    cm:callback(
		function()
			if cm:is_local_players_turn() then
				end_turn_button = find_uicomponent(core:get_ui_root(), "hud_campaign", "faction_buttons_docker","end_turn_docker", "button_end_turn")
				if end_turn_button then
					pulse_uicomponent(end_turn_button, true)
					if first_time then
						end_turn_button:Highlight(true,true, 0, true)
					else
						end_turn_button:Highlight(true,true)
					end
				end
			end
		end,
		start_highlight_s
	)
	if stop_highlight_s then
		cm:callback(
			function()
				local end_turn_button = find_uicomponent(core:get_ui_root(), "hud_campaign", "faction_buttons_docker","end_turn_docker", "button_end_turn")
				if end_turn_button then
					pulse_uicomponent(end_turn_button, false)
					end_turn_button:Highlight(false)
				end
			end,
			stop_highlight_s
		)
	end

	core:add_listener(
        "FTUE_end_turn_clear_advice",
        "FactionAboutToEndTurn",
        function(context) return context:faction():name() == tut.player_faction_key end,
        function(context)
			end_turn_button = find_uicomponent(core:get_ui_root(), "hud_campaign", "faction_buttons_docker","end_turn_docker", "button_end_turn")
			if end_turn_button then
				pulse_uicomponent(end_turn_button, false)
				highlight_component(false, false, "faction_buttons_docker","end_turn_docker", "button_end_turn")
			end

			-- hide_advisor_cheat_sheet_and_highlights()
        end,
        true
    )
end


-- Set skip-all-but-player's-turn behaviour
local function tut_update_skip_all_but_player_turns()
	local should_skip = not not cm:get_saved_value("skip_all_but_player_turns")
	cm:set_skip_all_but_faction(cm:get_faction(tut.player_faction_key), should_skip)
end


function tut_skip_all_but_player_turns(should_skip)
	cm:set_saved_value("skip_all_but_player_turns", should_skip)
	tut_update_skip_all_but_player_turns()
end


-- Set skip-specific-faction's-turn behaviour
local function tut_update_skip_faction_turn(faction_key)
	local faction = cm:get_faction(faction_key)
	if faction then
		local should_skip = cm:get_saved_value("skip_turn_" .. faction_key) and not cm:get_saved_value("skip_turn_blocked_" .. faction_key)
		cm:set_skip_for_faction(faction, should_skip)
	end
end;


local function tut_skip_faction_turns(faction_key, should_skip)
	cm:set_saved_value("skip_turn_" .. faction_key, should_skip);
end;

function tut_skip_sukhot_faction_turns(should_skip)
	tut_skip_faction_turns(tut.sukhot_faction_key, should_skip)
	tut_update_skip_faction_turn(tut.sukhot_faction_key)
end

function tut_set_skip_faction_turns(faction_key, should_skip)
	tut_skip_faction_turns(faction_key, should_skip)
	tut_update_skip_faction_turn(faction_key)
end

function tut_block_skipping_faction_turns(faction_key, should_block)
	cm:set_saved_value("skip_turn_blocked_" .. faction_key, should_block)
	tut_update_skip_faction_turn(faction_key)
end

function tut_block_skipping_sukhot_faction_turns(should_block)
	return tut_block_skipping_faction_turns(tut.sukhot_faction_key, should_block)
end


-- Restore skipping-turn behaviour on load
function tut_restore_skipping_state_on_load()
	tut_update_skip_all_but_player_turns()
	tut_update_skip_faction_turn(tut.sukhot_faction_key)
end


function tut_set_legitimacy_onboarding_turn_for_tutorial(legitimacy_onboarding_turn)
	for _, feature in ipairs(feature_unlock.config["phar_main_ramesses"] or {}) do
		if feature.feature == feature_ids_config.pharaohs_crown then
			feature.unlock_turn = legitimacy_onboarding_turn
			break
		end
	end
end

function tut_skip_fill_initial_gods()
	deities.should_fill_initial_gods = false
end

function tut_show_ap(name, orientation, uic_identifier, display_text, x_proportion, y_proportion, width)
	local uic

	if is_uicomponent(uic_identifier) then
		uic = uic_identifier
	elseif is_function(uic_identifier) then
		uic = uic_identifier()
		if not is_uicomponent(uic) then
			script_error("WARNING: tut_show_ap() could not find target uicomponent for active pointer with name [" .. tostring(name) .. "]. The uicomponent was supposed to be generated by a function. The active pointer will not be shown.")
			return false
		end
	elseif is_table_of_strings(uic_identifier) then
		uic = find_uicomponent_from_table(core:get_ui_root(), uic_identifier, true)
		if not uic then
			script_error("WARNING: tut_show_ap() could not find target uicomponent for active pointer with name [" .. tostring(name) .. "] from component path [" .. table.concat(uic_identifier, ", ") .. "]. The active pointer will not be shown.")
			return false
		end
	else
		script_error("WARNING: tut_show_ap() could not recognise uic_identifier [" .. tostring(uic_identifier) .. "]. The active pointer will not be shown.")
		return false
	end

	local ap = active_pointer:new(
		name,
		orientation,
		uic,
		display_text,
		x_proportion,
		y_proportion,
		width,
		true							-- disregard advice history
	)

	ap:set_auto_hide_time(tut.TEXT_POINTER_DURATION_S)
	ap:show_when_ready()

	return ap
end


function tut_complete_active_intervention()
	local inv = cm:get_active_intervention();
	if inv then
		inv:complete();
	else
		script_error("WARNING: tut_complete_active_intervention() called but could not find an active intervention?");
	end;
end;


function tut_highlight_pre_battle_attack(highlight)
	local attack_uic = find_uicomponent(core:get_ui_root(), "popup_pre_battle", "mid", "battle_deployment", "regular_deployment", "button_set_attack", "button_attack_container", "button_attack")
	local siege_attack_uic = find_uicomponent(core:get_ui_root(), "popup_pre_battle", "mid", "battle_deployment", "regular_deployment", "button_set_siege", "button_attack")
	
	if attack_uic and attack_uic:Visible() then
		pulse_uicomponent(attack_uic, highlight, 10)
	end
	if siege_attack_uic and siege_attack_uic:Visible() then
		pulse_uicomponent(siege_attack_uic, highlight, 10)
	end
end

function tut_highlight_pre_battle_autoresolve(highlight)
	local auto_resolve_uic = find_uicomponent(core:get_ui_root(), "popup_pre_battle", "mid", "battle_deployment", "regular_deployment", "button_set_attack", "button_autoresolve")
	local siege_auto_resolve_uic = find_uicomponent(core:get_ui_root(), "popup_pre_battle", "mid", "battle_deployment", "regular_deployment", "button_set_siege", "button_autoresolve")
	
	if auto_resolve_uic and auto_resolve_uic:Visible() then
		pulse_uicomponent(auto_resolve_uic, highlight, 10)
	end
	if siege_auto_resolve_uic and siege_auto_resolve_uic:Visible() then
		pulse_uicomponent(siege_auto_resolve_uic, highlight, 10)
	end
end


function tut_complete_and_remove_objective(objective_key)
	cm:complete_objective(objective_key)
	cm:callback(
		function()
			cm:remove_objective(objective_key)
		end,
		tut.OBJECTIVE_REMOVE_DELAY
	)
end



-- cm:add_saving_game_callback(
-- 	function(context)
-- 		cm:save_named_value("tut", tut, context)
-- 	end
-- )
-- cm:add_loading_game_callback(
-- 	function(context)
-- 		tut = cm:load_named_value("tut", tut, context)
-- 	end
-- )

function tut_ambitions_highlight(name)
	cm:repeat_real_callback(
		function()
			local ambitions_background = find_uicomponent("ambitions")
			if ambitions_background then
				-- remove past confirm button highlights on start, as this action can't be execute on ambition dimissal
				local button_select = find_uicomponent(core:get_ui_root(), "ambitions","button_select_ambition")
				if button_select then
					button_select:Highlight(false, true)
				end
				core:progress_on_uicomponent_animation_finished(
					ambitions_background,
					function()
						local ambition_list = find_uicomponent(ambitions_background, "ambitions_list")
						if ambition_list then
							highlight_all_visible_children(ambition_list)
							cm:remove_real_callback(name)
						end
					end
				)
			end;
		end,
		100,
		name
	)

	core:add_listener(
		"FTUE_AmbitionClicked",
		"ComponentLClickUp",
		function(context)
			return find_uicomponent(core:get_ui_root(), "ambitions", "ambitions_list", context.string)
		end,
		function(context)
			unhighlight_all_visible_children()
			local button_select = find_uicomponent(core:get_ui_root(), "ambitions","button_select_ambition")
			if button_select then
				button_select:Highlight(true, true)
			end
		end,
		false
	)
end

--------------------------------------------------------------------------------------------------
-- Load in all tutorial files now that data is declared
---------------------------------------------------------------------------------------------------

for i = 1, #files_to_load do
	cm:load_local_faction_script(files_to_load[i])
end