out("Loading phar_ancient_legacy_thutmose.lua")

local function output(str)
	if str then
		out("<<>> _ANCIENT LEGACY THUTMOSE <<>>: " .. str)
	end
end

ancient_legacy_thutmose = 
{
	config = 
	{
		-- normally the Pillars of Civilization are the intended targets, but regions in this list are added as valid targets
		targets_added = 
		{
			--[["phar_main_akhmim_mefka_qes",]]
		},

		-- normally the Pillars of Civilization are the intended targets, but regions in this list are removed as valid targets
		targets_excluded = 
		{
			"phar_main_amarna_amarna",
		},

		-- the player can choose a number of actions before the culmination - the final, most powerful action (it is not chosen or paid)
		actions_before_culmination = 6,
		-- how many actions the faction can purchase per turn
		actions_per_turn = 1,
		max_sabotage_support_difference_for_custom_balanced_action = 10,
		final_sabotage_support_sum = 300,
		default_action_weight = 1, -- can be set to 0 to force specific actions, if all actions have 0 weight the first is taken
		default_building_damage = 50,
		max_units_provided = 19, -- how many units the feature can provide for the reinforcing army. Don't forget the reinforcing army will need a general, so leave 1 unit for that!
		
		-- BONUSES AND BUNDLES
		after_conquest_bonus_duration = 5, -- how long the post-conquest effects last
		after_conquest_effects_bundle = "phar_main_effect_bundle_al_thutmose_post_conquest", -- effect bundle that will be applied after taking over the settlement
		replenishment_effect = "phar_main_replenishment_percentage_bonus_basic",
		happiness_effect = "phar_main_province_public_order_happiness_events_factor",

		-- when choosing a target the player needs to pay this
		target_resource_costs_record = "phar_main_al_thutmose_select_target_cost",
		-- for testing, used only when target_resource_costs_record is not available
		target_test_cost = 
		{
			{"troy_gold", -350},
		},

		-- units provided to the reinforcement army, split by action key and then region
		native_support_units_provided = 
		{
			sup_meet_local_gift_warlord = 
			{
				phar_main_memphis_memphis = 
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_spear_militia", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_low_lower_egyptian_militia_slingers", 
						amount = 2,
					},
				},
				phar_main_heliopolis_heliopolis = 
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_spear_militia", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_low_lower_egyptian_militia_slingers", 
						amount = 2,
					},
				},
				phar_main_hermopolis_hermopolis = 
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_spear_militia", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_low_lower_egyptian_militia_slingers", 
						amount = 2,
					},
				},
				phar_main_abydos_abydos = 
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_militia_clubmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_militia_slingers", 
						amount = 2,
					},
				},
				phar_main_thebes_thebes = 
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_militia_clubmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_militia_slingers", 
						amount = 2,
					},
				},
				phar_main_kom_ombo_kom_ombo = 
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_militia_clubmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_militia_slingers", 
						amount = 2,
					},
				},
				phar_main_kawa_kawa = 
				{
					{
						unit_key = "phar_main_nat_nub_nubian_recruits", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_nub_nubian_bowmen", 
						amount = 2,
					},
				},
				phar_main_buhen_buhen = 
				{
					{
						unit_key = "phar_main_nat_nub_nubian_recruits", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_nub_nubian_bowmen", 
						amount = 2,
					},
				},
				phar_main_north_nubia_miam = 
				{
					{
						unit_key = "phar_main_nat_nub_nubian_recruits", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_nub_nubian_bowmen", 
						amount = 2,
					},
				},
				phar_main_damascus_damascus = 
				{
					{
						unit_key = "phar_main_nat_sin_habiru_militia", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_sin_habiru_archers", 
						amount = 2,
					},
				},
				phar_main_emar_emar = 
				{
					{
						unit_key = "phar_main_nat_sin_habiru_militia", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_sin_habiru_archers", 
						amount = 2,
					},
				},
				phar_main_ashkelon_ashkelon = 
				{
					{
						unit_key = "phar_main_nat_sin_habiru_militia", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_sin_habiru_archers", 
						amount = 2,
					},
				},
				phar_main_tyre_byblos = 
				{
					{
						unit_key = "phar_main_nat_fen_canaanite_recruits", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_fen_canaanite_rock_throwers", 
						amount = 2,
					},
				},
				phar_main_carchemish_carchemish = 
				{
					{
						unit_key = "phar_main_nat_fen_canaanite_recruits", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_fen_canaanite_rock_throwers", 
						amount = 2,
					},
				},
				phar_main_ugarit_ugarit = 
				{
					{
						unit_key = "phar_main_nat_fen_canaanite_recruits", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_fen_canaanite_rock_throwers", 
						amount = 2,
					},
				},
				phar_main_malidiya_malidiya = 
				{
					{
						unit_key = "phar_main_nat_isu_isuwan_militia", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_isu_isuwan_slingers", 
						amount = 2,
					},
				},
				phar_main_south_hatti_tarhuntassa = 
				{
					{
						unit_key = "phar_main_nat_isu_isuwan_militia", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_isu_isuwan_slingers", 
						amount = 2,
					},
				},
				phar_main_west_hatti_gordion = 
				{
					{
						unit_key = "phar_main_nat_hig_anatolian_militia", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_hig_kaskian_tribesmen", 
						amount = 2,
					},
				},
				phar_main_hattussa_hattussa = 
				{
					{
						unit_key = "phar_main_nat_hig_anatolian_militia", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_hig_kaskian_tribesmen", 
						amount = 2,
					},
				},
				phar_map_aranzah_assur = 
				{
					{
						unit_key = "phar_map_nat_assur_akkadian_farmers", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_assur_akkadian_hunters", 
						amount = 2,
					},
				},
				phar_map_bit_peri_amurru_dur_kurigalzu = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_farmers", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_tamti_akkadian_archers", 
						amount = 1,
					},
				},
				phar_map_northern_elam_susa = 
				{
					{
						unit_key = "phar_map_nat_halt_elamite_hillmen", 
						amount = 4,
					},
				},
				phar_map_kan_digirak_babylon = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_farmers", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_tamti_akkadian_archers", 
						amount = 1,
					},
				},
				phar_map_karduniash_ishtananu_nippur = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_farmers", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_tamti_akkadian_archers", 
						amount = 1,
					},
				},
				phar_map_kretes_knossos = 
				{
					{
						unit_key = "phar_map_nat_ach_young_spears", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_ach_achaean_stoneslingers", 
						amount = 2,
					},
				},
				phar_map_mycenaeca_mycenae = 
				{
					{
						unit_key = "phar_map_nat_ach_young_spears", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_ach_achaean_stoneslingers", 
						amount = 2,
					},
				},
				phar_map_sinticobisaltia_siris = 
				{
					{
						unit_key = "phar_map_nat_thr_mountaineers", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_thr_forest_skirmishers", 
						amount = 2,
					},
				},
				phar_map_ilion_troy = 
				{
					{
						unit_key = "phar_map_nat_wil_trojan_warriors", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_wil_trojan_slingers", 
						amount = 2,
					},
				},
				phar_map_isthmos_cibyra = 
				{
					{
						unit_key = "phar_map_nat_wil_trojan_warriors", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_wil_trojan_slingers", 
						amount = 2,
					},
				},
			},
			sup_meet_local_gift_warlord_2 = 
			{
				phar_main_memphis_memphis = 
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_spear_militia", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_low_lower_egyptian_militia", 
						amount = 2,
					},
				},
				phar_main_heliopolis_heliopolis = 
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_spear_militia", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_low_lower_egyptian_militia", 
						amount = 2,
					},
				},
				phar_main_hermopolis_hermopolis = 
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_spear_militia", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_low_lower_egyptian_militia", 
						amount = 2,
					},
				},
				phar_main_abydos_abydos = 
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_militia_clubmen", 
						amount = 3,
					},
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_militia_slingers", 
						amount = 1,
					},
				},
				phar_main_thebes_thebes = 
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_militia_clubmen", 
						amount = 3,
					},
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_militia_slingers", 
						amount = 1,
					},
				},
				phar_main_kom_ombo_kom_ombo = 
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_militia_clubmen", 
						amount = 3,
					},
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_militia_slingers", 
						amount = 1,
					},
				},
				phar_main_kawa_kawa = 
				{
					{
						unit_key = "phar_main_nat_nub_nubian_recruits", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_nub_nubian_hunters", 
						amount = 2,
					},
				},
				phar_main_buhen_buhen = 
				{
					{
						unit_key = "phar_main_nat_nub_nubian_recruits", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_nub_nubian_hunters", 
						amount = 2,
					},
				},
				phar_main_north_nubia_miam = 
				{
					{
						unit_key = "phar_main_nat_nub_nubian_recruits", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_nub_nubian_hunters", 
						amount = 2,
					},
				},
				phar_main_damascus_damascus = 
				{
					{
						unit_key = "phar_main_nat_sin_habiru_militia", 
						amount = 3,
					},
					{
						unit_key = "phar_main_nat_sin_habiru_archers", 
						amount = 1,
					},
				},
				phar_main_emar_emar = 
				{
					{
						unit_key = "phar_main_nat_sin_habiru_militia", 
						amount = 3,
					},
					{
						unit_key = "phar_main_nat_sin_habiru_archers", 
						amount = 1,
					},
				},
				phar_main_ashkelon_ashkelon = 
				{
					{
						unit_key = "phar_main_nat_sin_habiru_militia", 
						amount = 3,
					},
					{
						unit_key = "phar_main_nat_sin_habiru_archers", 
						amount = 1,
					},
				},
				phar_main_tyre_byblos = 
				{
					{
						unit_key = "phar_main_nat_fen_canaanite_recruits", 
						amount = 3,
					},
					{
						unit_key = "phar_main_nat_fen_canaanite_rock_throwers", 
						amount = 1,
					},
				},
				phar_main_carchemish_carchemish = 
				{
					{
						unit_key = "phar_main_nat_fen_canaanite_recruits", 
						amount = 3,
					},
					{
						unit_key = "phar_main_nat_fen_canaanite_rock_throwers", 
						amount = 1,
					},
				},
				phar_main_ugarit_ugarit = 
				{
					{
						unit_key = "phar_main_nat_fen_canaanite_recruits", 
						amount = 3,
					},
					{
						unit_key = "phar_main_nat_fen_canaanite_rock_throwers", 
						amount = 1,
					},
				},
				phar_main_malidiya_malidiya = 
				{
					{
						unit_key = "phar_main_nat_isu_isuwan_militia", 
						amount = 3,
					},
					{
						unit_key = "phar_main_nat_isu_isuwan_slingers", 
						amount = 1,
					},
				},
				phar_main_south_hatti_tarhuntassa = 
				{
					{
						unit_key = "phar_main_nat_isu_isuwan_militia", 
						amount = 3,
					},
					{
						unit_key = "phar_main_nat_isu_isuwan_slingers", 
						amount = 1,
					},
				},
				phar_main_west_hatti_gordion = 
				{
					{
						unit_key = "phar_main_nat_hig_anatolian_militia", 
						amount = 3,
					},
					{
						unit_key = "phar_main_nat_hig_kaskian_javelin_throwers", 
						amount = 1,
					},
				},
				phar_main_hattussa_hattussa = 
				{
					{
						unit_key = "phar_main_nat_hig_anatolian_militia", 
						amount = 3,
					},
					{
						unit_key = "phar_main_nat_hig_kaskian_javelin_throwers", 
						amount = 1,
					},
				},
				phar_map_aranzah_assur = 
				{
					{
						unit_key = "phar_map_nat_assur_akkadian_farmers", 
						amount = 3,
					},
					{
						unit_key = "phar_map_nat_assur_akkadian_hunters", 
						amount = 1,
					},
				},
				phar_map_bit_peri_amurru_dur_kurigalzu = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_farmers", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_tamti_akkadian_archers", 
						amount = 1,
					},
				},
				phar_map_northern_elam_susa = 
				{
					{
						unit_key = "phar_map_nat_halt_elamite_hillmen", 
						amount = 4,
					},
				},
				phar_map_kan_digirak_babylon = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_farmers", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_tamti_akkadian_archers", 
						amount = 1,
					},
				},
				phar_map_karduniash_ishtananu_nippur = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_farmers", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_tamti_akkadian_archers", 
						amount = 1,
					},
				},
				phar_map_kretes_knossos = 
				{
					{
						unit_key = "phar_map_nat_ach_young_spears", 
						amount = 3,
					},
					{
						unit_key = "phar_map_nat_ach_achaean_stoneslingers", 
						amount = 1,
					},
				},
				phar_map_mycenaeca_mycenae = 
				{
					{
						unit_key = "phar_map_nat_ach_young_spears", 
						amount = 3,
					},
					{
						unit_key = "phar_map_nat_ach_achaean_stoneslingers", 
						amount = 1,
					},
				},
				phar_map_sinticobisaltia_siris = 
				{
					{
						unit_key = "phar_map_nat_thr_mountaineers", 
						amount = 3,
					},
					{
						unit_key = "phar_map_nat_thr_forest_skirmishers", 
						amount = 1,
					},
				},
				phar_map_ilion_troy = 
				{
					{
						unit_key = "phar_map_nat_wil_trojan_warriors", 
						amount = 3,
					},
					{
						unit_key = "phar_map_nat_wil_trojan_slingers", 
						amount = 1,
					},
				},
				phar_map_isthmos_cibyra = 
				{
					{
						unit_key = "phar_map_nat_wil_trojan_warriors", 
						amount = 3,
					},
					{
						unit_key = "phar_map_nat_wil_trojan_slingers", 
						amount = 1,
					},
				},
			},
			sup_meet_local_rouse_warriors = 
			{
				phar_main_memphis_memphis = 
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_axe_conscripts", 
						amount = 2,
					},
				},
				phar_main_heliopolis_heliopolis =
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_axe_conscripts", 
						amount = 2,
					},
				},
				phar_main_hermopolis_hermopolis =
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_axe_conscripts", 
						amount = 2,
					},
				},
				phar_main_abydos_abydos = 
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_conscripted_axemen", 
						amount = 2,
					},
				},
				phar_main_thebes_thebes = 
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_conscripted_axemen", 
						amount = 2,
					},
				},
				phar_main_kom_ombo_kom_ombo = 
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_conscripted_axemen", 
						amount = 2,
					},
				},
				phar_main_kawa_kawa = 
				{
					{
						unit_key = "phar_main_nat_nub_kushite_archers", 
						amount = 2,
					},
				},
				phar_main_buhen_buhen = 
				{
					{
						unit_key = "phar_main_nat_nub_kushite_archers", 
						amount = 2,
					},
				},
				phar_main_north_nubia_miam = 
				{
					{
						unit_key = "phar_main_nat_nub_kushite_archers", 
						amount = 2,
					},
				},
				phar_main_damascus_damascus = 
				{
					{
						unit_key = "phar_main_nat_sin_habiru_raiders", 
						amount = 2,
					},
				},
				phar_main_emar_emar = 
				{
					{
						unit_key = "phar_main_nat_sin_habiru_raiders", 
						amount = 2,
					},
				},
				phar_main_ashkelon_ashkelon = 
				{
					{
						unit_key = "phar_main_nat_sin_habiru_raiders", 
						amount = 2,
					},
				},
				phar_main_tyre_byblos = 
				{
					{
						unit_key = "phar_main_nat_fen_canaanite_sellswords", 
						amount = 2,
					},
				},
				phar_main_carchemish_carchemish = 
				{
					{
						unit_key = "phar_main_nat_fen_canaanite_sellswords", 
						amount = 2,
					},
				},
				phar_main_ugarit_ugarit = 
				{
					{
						unit_key = "phar_main_nat_fen_canaanite_sellswords", 
						amount = 2,
					},
				},
				phar_main_malidiya_malidiya = 
				{
					{
						unit_key = "phar_main_nat_isu_luwian_swordsmen", 
						amount = 2,
					},
				},
				phar_main_south_hatti_tarhuntassa = 
				{
					{
						unit_key = "phar_main_nat_isu_luwian_swordsmen", 
						amount = 2,
					},
				},
				phar_main_west_hatti_gordion = 
				{
					{
						unit_key = "phar_main_nat_hig_kaskian_axemen", 
						amount = 2,
					},
				},
				phar_main_hattussa_hattussa = 
				{
					{
						unit_key = "phar_main_nat_hig_kaskian_axemen", 
						amount = 2,
					},
				},
				phar_map_aranzah_assur = 
				{
					{
						unit_key = "phar_map_nat_assur_akkadian_militia", 
						amount = 2,
					},
				},
				phar_map_bit_peri_amurru_dur_kurigalzu = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_militia", 
						amount = 2,
					},
				},
				phar_map_northern_elam_susa = 
				{
					{
						unit_key = "phar_map_nat_halt_elamite_warriors", 
						amount = 2,
					},
				},
				phar_map_kan_digirak_babylon = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_militia", 
						amount = 2,
					},
				},
				phar_map_karduniash_ishtananu_nippur = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_militia", 
						amount = 2,
					},
				},
				phar_map_kretes_knossos = 
				{
					{
						unit_key = "phar_map_nat_ach_achaean_islanders", 
						amount = 2,
					},
				},
				phar_map_mycenaeca_mycenae = 
				{
					{
						unit_key = "phar_map_nat_ach_achaean_islanders", 
						amount = 2,
					},
				},
				phar_map_sinticobisaltia_siris = 
				{
					{
						unit_key = "phar_map_nat_thr_plainsmen", 
						amount = 2,
					},
				},
				phar_map_ilion_troy = 
				{
					{
						unit_key = "phar_map_nat_wil_coastal_club_fighters", 
						amount = 2,
					},
				},
				phar_map_isthmos_cibyra = 
				{
					{
						unit_key = "phar_map_nat_wil_coastal_club_fighters", 
						amount = 2,
					},
				},
			},
			sup_meet_local_rouse_warriors_2 = 
			{
				phar_main_memphis_memphis = 
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_archers", 
						amount = 2,
					},
				},
				phar_main_heliopolis_heliopolis =
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_archers", 
						amount = 2,
					},
				},
				phar_main_hermopolis_hermopolis =
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_archers", 
						amount = 2,
					},
				},
				phar_main_abydos_abydos = 
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_archers", 
						amount = 2,
					},
				},
				phar_main_thebes_thebes = 
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_archers", 
						amount = 2,
					},
				},
				phar_main_kom_ombo_kom_ombo = 
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_archers", 
						amount = 2,
					},
				},
				phar_main_kawa_kawa = 
				{
					{
						unit_key = "phar_main_nat_nub_kushite_spearmen_recruits", 
						amount = 2,
					},
				},
				phar_main_buhen_buhen = 
				{
					{
						unit_key = "phar_main_nat_nub_kushite_spearmen_recruits", 
						amount = 2,
					},
				},
				phar_main_north_nubia_miam = 
				{
					{
						unit_key = "phar_main_nat_nub_kushite_spearmen_recruits", 
						amount = 2,
					},
				},
				phar_main_damascus_damascus = 
				{
					{
						unit_key = "phar_main_nat_sin_shasu_tribesmen", 
						amount = 2,
					},
				},
				phar_main_emar_emar = 
				{
					{
						unit_key = "phar_main_nat_sin_shasu_tribesmen", 
						amount = 2,
					},
				},
				phar_main_ashkelon_ashkelon = 
				{
					{
						unit_key = "phar_main_nat_sin_shasu_tribesmen", 
						amount = 2,
					},
				},
				phar_main_tyre_byblos = 
				{
					{
						unit_key = "phar_main_nat_fen_canaanite_skirmishers", 
						amount = 2,
					},
				},
				phar_main_carchemish_carchemish = 
				{
					{
						unit_key = "phar_main_nat_fen_canaanite_skirmishers", 
						amount = 2,
					},
				},
				phar_main_ugarit_ugarit = 
				{
					{
						unit_key = "phar_main_nat_fen_canaanite_skirmishers", 
						amount = 2,
					},
				},
				phar_main_malidiya_malidiya = 
				{
					{
						unit_key = "phar_main_nat_isu_luwian_spearmen", 
						amount = 2,
					},
				},
				phar_main_south_hatti_tarhuntassa = 
				{
					{
						unit_key = "phar_main_nat_isu_luwian_spearmen", 
						amount = 2,
					},
				},
				phar_main_west_hatti_gordion = 
				{
					{
						unit_key = "phar_main_nat_hig_phrygian_spearmen", 
						amount = 2,
					},
				},
				phar_main_hattussa_hattussa = 
				{
					{
						unit_key = "phar_main_nat_hig_phrygian_spearmen", 
						amount = 2,
					},
				},
				phar_map_aranzah_assur = 
				{
					{
						unit_key = "phar_map_fac_ash_assur_levies", 
						amount = 2,
					},
				},
				phar_map_bit_peri_amurru_dur_kurigalzu = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_archers", 
						amount = 2,
					},
				},
				phar_map_northern_elam_susa = 
				{
					{
						unit_key = "phar_map_nat_halt_elamite_slingers", 
						amount = 1,
					},
					{
						unit_key = "phar_map_nat_halt_elamite_bowmen", 
						amount = 1,
					},
				},
				phar_map_kan_digirak_babylon = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_archers", 
						amount = 2,
					},
				},
				phar_map_karduniash_ishtananu_nippur = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_archers", 
						amount = 2,
					},
				},
				phar_map_kretes_knossos = 
				{
					{
						unit_key = "phar_map_nat_ach_achaean_bowmen", 
						amount = 2,
					},
				},
				phar_map_mycenaeca_mycenae = 
				{
					{
						unit_key = "phar_map_nat_ach_achaean_bowmen", 
						amount = 2,
					},
				},
				phar_map_sinticobisaltia_siris = 
				{
					{
						unit_key = "phar_map_nat_thr_thracian_hunters", 
						amount = 2,
					},
				},
				phar_map_ilion_troy = 
				{
					{
						unit_key = "phar_map_nat_wil_trojan_archers", 
						amount = 2,
					},
				},
				phar_map_isthmos_cibyra = 
				{
					{
						unit_key = "phar_map_nat_wil_trojan_archers", 
						amount = 2,
					},
				},
			},
			bal_rebellion_encourage_deserters = 
			{
				phar_main_memphis_memphis = 
				{
					{
						unit_key = "phar_main_nat_low_armoured_lower_egyptian_archers", 
						amount = 2,
					},
				},
				phar_main_heliopolis_heliopolis =
				{
					{
						unit_key = "phar_main_nat_low_armoured_lower_egyptian_archers", 
						amount = 2,
					},
				},
				phar_main_hermopolis_hermopolis =
				{
					{
						unit_key = "phar_main_nat_low_armoured_lower_egyptian_archers", 
						amount = 2,
					},
				},
				phar_main_abydos_abydos = 
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_swordsmen", 
						amount = 2,
					},
				},
				phar_main_thebes_thebes = 
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_swordsmen", 
						amount = 2,
					},
				},
				phar_main_kom_ombo_kom_ombo = 
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_swordsmen", 
						amount = 2,
					},
				},
				phar_main_kawa_kawa = 
				{
					{
						unit_key = "phar_main_nat_nub_kushite_spearmen", 
						amount = 2,
					},
				},
				phar_main_buhen_buhen = 
				{
					{
						unit_key = "phar_main_nat_nub_kushite_spearmen", 
						amount = 2,
					},
				},
				phar_main_north_nubia_miam = 
				{
					{
						unit_key = "phar_main_nat_nub_kushite_spearmen", 
						amount = 2,
					},
				},
				phar_main_damascus_damascus = 
				{
					{
						unit_key = "phar_main_nat_sin_habiru_skirmishers", 
						amount = 2,
					},
				},
				phar_main_emar_emar = 
				{
					{
						unit_key = "phar_main_nat_sin_habiru_skirmishers", 
						amount = 2,
					},
				},
				phar_main_ashkelon_ashkelon = 
				{
					{
						unit_key = "phar_main_nat_sin_habiru_skirmishers", 
						amount = 2,
					},
				},
				phar_main_tyre_byblos = 
				{
					{
						unit_key = "phar_main_nat_fen_veteran_canaanite_swordsmen", 
						amount = 2,
					},
				},
				phar_main_carchemish_carchemish = 
				{
					{
						unit_key = "phar_main_nat_fen_veteran_canaanite_swordsmen", 
						amount = 2,
					},
				},
				phar_main_ugarit_ugarit = 
				{
					{
						unit_key = "phar_main_nat_fen_veteran_canaanite_swordsmen", 
						amount = 2,
					},
				},
				phar_main_malidiya_malidiya = 
				{
					{
						unit_key = "phar_main_nat_isu_isuwan_axemen", 
						amount = 2,
					},
				},
				phar_main_south_hatti_tarhuntassa = 
				{
					{
						unit_key = "phar_main_nat_isu_isuwan_axemen", 
						amount = 2,
					},
				},
				phar_main_west_hatti_gordion = 
				{
					{
						unit_key = "phar_main_nat_hig_kaskian_chargers", 
						amount = 2,
					},
				},
				phar_main_hattussa_hattussa = 
				{
					{
						unit_key = "phar_main_nat_hig_kaskian_chargers", 
						amount = 2,
					},
				},
				phar_map_aranzah_assur = 
				{
					{
						unit_key = "phar_map_fac_ash_assur_levies", 
						amount = 2,
					},
				},
				phar_map_bit_peri_amurru_dur_kurigalzu = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_archers", 
						amount = 2,
					},
				},
				phar_map_northern_elam_susa = 
				{
					{
						unit_key = "phar_map_nat_halt_elamite_slingers", 
						amount = 1,
					},
					{
						unit_key = "phar_map_nat_halt_elamite_bowmen", 
						amount = 1,
					},
				},
				phar_map_kan_digirak_babylon = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_archers", 
						amount = 2,
					},
				},
				phar_map_karduniash_ishtananu_nippur = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_archers", 
						amount = 2,
					},
				},
				phar_map_kretes_knossos = 
				{
					{
						unit_key = "phar_map_nat_ach_achaean_bowmen", 
						amount = 2,
					},
				},
				phar_map_mycenaeca_mycenae = 
				{
					{
						unit_key = "phar_map_nat_ach_achaean_bowmen", 
						amount = 2,
					},
				},
				phar_map_sinticobisaltia_siris = 
				{
					{
						unit_key = "phar_map_nat_thr_thracian_hunters", 
						amount = 2,
					},
				},
				phar_map_ilion_troy = 
				{
					{
						unit_key = "phar_map_nat_wil_trojan_archers", 
						amount = 2,
					},
				},
				phar_map_isthmos_cibyra = 
				{
					{
						unit_key = "phar_map_nat_wil_trojan_archers", 
						amount = 2,
					},
				},
			},
			sup_meet_local_summit_elders = 
			{
				phar_main_memphis_memphis = 
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_axe_conscripts", 
						amount = 2,
					},
				},
				phar_main_heliopolis_heliopolis =
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_axe_conscripts", 
						amount = 2,
					},
				},
				phar_main_hermopolis_hermopolis =
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_axe_conscripts", 
						amount = 2,
					},
				},
				phar_main_abydos_abydos = 
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_conscripted_axemen", 
						amount = 2,
					},
				},
				phar_main_thebes_thebes = 
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_conscripted_axemen", 
						amount = 2,
					},
				},
				phar_main_kom_ombo_kom_ombo = 
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_conscripted_axemen", 
						amount = 2,
					},
				},
				phar_main_kawa_kawa = 
				{
					{
						unit_key = "phar_main_nat_nub_kushite_archers", 
						amount = 2,
					},
				},
				phar_main_buhen_buhen = 
				{
					{
						unit_key = "phar_main_nat_nub_kushite_archers", 
						amount = 2,
					},
				},
				phar_main_north_nubia_miam = 
				{
					{
						unit_key = "phar_main_nat_nub_kushite_archers", 
						amount = 2,
					},
				},
				phar_main_damascus_damascus = 
				{
					{
						unit_key = "phar_main_nat_sin_habiru_raiders", 
						amount = 2,
					},
				},
				phar_main_emar_emar = 
				{
					{
						unit_key = "phar_main_nat_sin_habiru_raiders", 
						amount = 2,
					},
				},
				phar_main_ashkelon_ashkelon = 
				{
					{
						unit_key = "phar_main_nat_sin_habiru_raiders", 
						amount = 2,
					},
				},
				phar_main_tyre_byblos = 
				{
					{
						unit_key = "phar_main_nat_fen_canaanite_sellswords", 
						amount = 2,
					},
				},
				phar_main_carchemish_carchemish = 
				{
					{
						unit_key = "phar_main_nat_fen_canaanite_sellswords", 
						amount = 2,
					},
				},
				phar_main_ugarit_ugarit = 
				{
					{
						unit_key = "phar_main_nat_fen_canaanite_sellswords", 
						amount = 2,
					},
				},
				phar_main_malidiya_malidiya = 
				{
					{
						unit_key = "phar_main_nat_isu_luwian_swordsmen", 
						amount = 2,
					},
				},
				phar_main_south_hatti_tarhuntassa = 
				{
					{
						unit_key = "phar_main_nat_isu_luwian_swordsmen", 
						amount = 2,
					},
				},
				phar_main_west_hatti_gordion = 
				{
					{
						unit_key = "phar_main_nat_hig_kaskian_axemen", 
						amount = 2,
					},
				},
				phar_main_hattussa_hattussa = 
				{
					{
						unit_key = "phar_main_nat_hig_kaskian_axemen", 
						amount = 2,
					},
				},
				phar_map_aranzah_assur = 
				{
					{
						unit_key = "phar_map_nat_assur_akkadian_militia", 
						amount = 2,
					},
				},
				phar_map_bit_peri_amurru_dur_kurigalzu = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_militia", 
						amount = 2,
					},
				},
				phar_map_northern_elam_susa = 
				{
					{
						unit_key = "phar_map_nat_halt_elamite_warriors", 
						amount = 2,
					},
				},
				phar_map_kan_digirak_babylon = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_militia", 
						amount = 2,
					},
				},
				phar_map_karduniash_ishtananu_nippur = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_militia", 
						amount = 2,
					},
				},
				phar_map_kretes_knossos = 
				{
					{
						unit_key = "phar_map_nat_ach_achaean_islanders", 
						amount = 2,
					},
				},
				phar_map_mycenaeca_mycenae = 
				{
					{
						unit_key = "phar_map_nat_ach_achaean_islanders", 
						amount = 2,
					},
				},
				phar_map_sinticobisaltia_siris = 
				{
					{
						unit_key = "phar_map_nat_thr_plainsmen", 
						amount = 2,
					},
				},
				phar_map_ilion_troy = 
				{
					{
						unit_key = "phar_map_nat_wil_coastal_club_fighters", 
						amount = 2,
					},
				},
				phar_map_isthmos_cibyra = 
				{
					{
						unit_key = "phar_map_nat_wil_coastal_club_fighters", 
						amount = 2,
					},
				},
			},
			sup_meet_local_summit_elders_2 = 
			{
				phar_main_memphis_memphis = 
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_archers", 
						amount = 2,
					},
				},
				phar_main_heliopolis_heliopolis =
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_archers", 
						amount = 2,
					},
				},
				phar_main_hermopolis_hermopolis =
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_archers", 
						amount = 2,
					},
				},
				phar_main_abydos_abydos = 
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_archers", 
						amount = 2,
					},
				},
				phar_main_thebes_thebes = 
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_archers", 
						amount = 2,
					},
				},
				phar_main_kom_ombo_kom_ombo = 
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_archers", 
						amount = 2,
					},
				},
				phar_main_kawa_kawa = 
				{
					{
						unit_key = "phar_main_nat_nub_kushite_spearmen_recruits", 
						amount = 2,
					},
				},
				phar_main_buhen_buhen = 
				{
					{
						unit_key = "phar_main_nat_nub_kushite_spearmen_recruits", 
						amount = 2,
					},
				},
				phar_main_north_nubia_miam = 
				{
					{
						unit_key = "phar_main_nat_nub_kushite_spearmen_recruits", 
						amount = 2,
					},
				},
				phar_main_damascus_damascus = 
				{
					{
						unit_key = "phar_main_nat_sin_shasu_tribesmen", 
						amount = 2,
					},
				},
				phar_main_emar_emar = 
				{
					{
						unit_key = "phar_main_nat_sin_shasu_tribesmen", 
						amount = 2,
					},
				},
				phar_main_ashkelon_ashkelon = 
				{
					{
						unit_key = "phar_main_nat_sin_shasu_tribesmen", 
						amount = 2,
					},
				},
				phar_main_tyre_byblos = 
				{
					{
						unit_key = "phar_main_nat_fen_canaanite_skirmishers", 
						amount = 2,
					},
				},
				phar_main_carchemish_carchemish = 
				{
					{
						unit_key = "phar_main_nat_fen_canaanite_skirmishers", 
						amount = 2,
					},
				},
				phar_main_ugarit_ugarit = 
				{
					{
						unit_key = "phar_main_nat_fen_canaanite_skirmishers", 
						amount = 2,
					},
				},
				phar_main_malidiya_malidiya = 
				{
					{
						unit_key = "phar_main_nat_isu_luwian_spearmen", 
						amount = 2,
					},
				},
				phar_main_south_hatti_tarhuntassa = 
				{
					{
						unit_key = "phar_main_nat_isu_luwian_spearmen", 
						amount = 2,
					},
				},
				phar_main_west_hatti_gordion = 
				{
					{
						unit_key = "phar_main_nat_hig_phrygian_spearmen", 
						amount = 2,
					},
				},
				phar_main_hattussa_hattussa = 
				{
					{
						unit_key = "phar_main_nat_hig_phrygian_spearmen", 
						amount = 2,
					},
				},
				phar_map_aranzah_assur = 
				{
					{
						unit_key = "phar_map_fac_ash_assur_levies", 
						amount = 2,
					},
				},
				phar_map_bit_peri_amurru_dur_kurigalzu = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_archers", 
						amount = 2,
					},
				},
				phar_map_northern_elam_susa = 
				{
					{
						unit_key = "phar_map_nat_halt_elamite_slingers", 
						amount = 1,
					},
					{
						unit_key = "phar_map_nat_halt_elamite_bowmen", 
						amount = 1,
					},
				},
				phar_map_kan_digirak_babylon = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_archers", 
						amount = 2,
					},
				},
				phar_map_karduniash_ishtananu_nippur = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_archers", 
						amount = 2,
					},
				},
				phar_map_kretes_knossos = 
				{
					{
						unit_key = "phar_map_nat_ach_achaean_bowmen", 
						amount = 2,
					},
				},
				phar_map_mycenaeca_mycenae = 
				{
					{
						unit_key = "phar_map_nat_ach_achaean_bowmen", 
						amount = 2,
					},
				},
				phar_map_sinticobisaltia_siris = 
				{
					{
						unit_key = "phar_map_nat_thr_thracian_hunters", 
						amount = 2,
					},
				},
				phar_map_ilion_troy = 
				{
					{
						unit_key = "phar_map_nat_wil_trojan_archers", 
						amount = 2,
					},
				},
				phar_map_isthmos_cibyra = 
				{
					{
						unit_key = "phar_map_nat_wil_trojan_archers", 
						amount = 2,
					},
				},
			},
			sup_meet_local_follow_patrols = 
			{
				phar_main_memphis_memphis = 
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_axe_conscripts", 
						amount = 1,
					},
				},
				phar_main_heliopolis_heliopolis =
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_axe_conscripts", 
						amount = 1,
					},
				},
				phar_main_hermopolis_hermopolis =
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_axe_conscripts", 
						amount = 1,
					},
				},
				phar_main_abydos_abydos = 
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_conscripted_axemen", 
						amount = 1,
					},
				},
				phar_main_thebes_thebes = 
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_conscripted_axemen", 
						amount = 1,
					},
				},
				phar_main_kom_ombo_kom_ombo = 
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_conscripted_axemen", 
						amount = 1,
					},
				},
				phar_main_kawa_kawa = 
				{
					{
						unit_key = "phar_main_nat_nub_kushite_archers", 
						amount = 1,
					},
				},
				phar_main_buhen_buhen = 
				{
					{
						unit_key = "phar_main_nat_nub_kushite_archers", 
						amount = 1,
					},
				},
				phar_main_north_nubia_miam = 
				{
					{
						unit_key = "phar_main_nat_nub_kushite_archers", 
						amount = 1,
					},
				},
				phar_main_damascus_damascus = 
				{
					{
						unit_key = "phar_main_nat_sin_habiru_raiders", 
						amount = 1,
					},
				},
				phar_main_emar_emar = 
				{
					{
						unit_key = "phar_main_nat_sin_habiru_raiders", 
						amount = 1,
					},
				},
				phar_main_ashkelon_ashkelon = 
				{
					{
						unit_key = "phar_main_nat_sin_habiru_raiders", 
						amount = 1,
					},
				},
				phar_main_tyre_byblos = 
				{
					{
						unit_key = "phar_main_nat_fen_canaanite_sellswords", 
						amount = 1,
					},
				},
				phar_main_carchemish_carchemish = 
				{
					{
						unit_key = "phar_main_nat_fen_canaanite_sellswords", 
						amount = 1,
					},
				},
				phar_main_ugarit_ugarit = 
				{
					{
						unit_key = "phar_main_nat_fen_canaanite_sellswords", 
						amount = 1,
					},
				},
				phar_main_malidiya_malidiya = 
				{
					{
						unit_key = "phar_main_nat_isu_luwian_swordsmen", 
						amount = 1,
					},
				},
				phar_main_south_hatti_tarhuntassa = 
				{
					{
						unit_key = "phar_main_nat_isu_luwian_swordsmen", 
						amount = 1,
					},
				},
				phar_main_west_hatti_gordion = 
				{
					{
						unit_key = "phar_main_nat_hig_kaskian_axemen", 
						amount = 1,
					},
				},
				phar_main_hattussa_hattussa = 
				{
					{
						unit_key = "phar_main_nat_hig_kaskian_axemen", 
						amount = 1,
					},
				},
				phar_map_aranzah_assur = 
				{
					{
						unit_key = "phar_map_nat_assur_akkadian_militia", 
						amount = 1,
					},
				},
				phar_map_bit_peri_amurru_dur_kurigalzu = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_militia", 
						amount = 1,
					},
				},
				phar_map_northern_elam_susa = 
				{
					{
						unit_key = "phar_map_nat_halt_elamite_warriors", 
						amount = 1,
					},
				},
				phar_map_kan_digirak_babylon = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_militia", 
						amount = 1,
					},
				},
				phar_map_karduniash_ishtananu_nippur = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_militia", 
						amount = 1,
					},
				},
				phar_map_kretes_knossos = 
				{
					{
						unit_key = "phar_map_nat_ach_achaean_islanders", 
						amount = 1,
					},
				},
				phar_map_mycenaeca_mycenae = 
				{
					{
						unit_key = "phar_map_nat_ach_achaean_islanders", 
						amount = 1,
					},
				},
				phar_map_sinticobisaltia_siris = 
				{
					{
						unit_key = "phar_map_nat_thr_plainsmen", 
						amount = 1,
					},
				},
				phar_map_ilion_troy = 
				{
					{
						unit_key = "phar_map_nat_wil_coastal_club_fighters", 
						amount = 1,
					},
				},
				phar_map_isthmos_cibyra = 
				{
					{
						unit_key = "phar_map_nat_wil_coastal_club_fighters", 
						amount = 1,
					},
				},
			},
			bal_rec_garrison_bribe_infantry = 
			{
				phar_main_memphis_memphis = 
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_veteran_swordsmen", 
						amount = 1,
					},
				},
				phar_main_heliopolis_heliopolis =
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_veteran_swordsmen", 
						amount = 1,
					},
				},
				phar_main_hermopolis_hermopolis =
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_veteran_swordsmen", 
						amount = 1,
					},
				},
				phar_main_abydos_abydos = 
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_swordsmen", 
						amount = 1,
					},
				},
				phar_main_thebes_thebes = 
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_swordsmen", 
						amount = 1,
					},
				},
				phar_main_kom_ombo_kom_ombo = 
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_swordsmen", 
						amount = 1,
					},
				},
				phar_main_kawa_kawa = 
				{
					{
						unit_key = "phar_main_nat_nub_kushite_spearmen", 
						amount = 1,
					},
				},
				phar_main_buhen_buhen = 
				{
					{
						unit_key = "phar_main_nat_nub_kushite_spearmen", 
						amount = 1,
					},
				},
				phar_main_north_nubia_miam = 
				{
					{
						unit_key = "phar_main_nat_nub_kushite_spearmen", 
						amount = 1,
					},
				},
				phar_main_damascus_damascus = 
				{
					{
						unit_key = "phar_main_nat_sin_shasu_warriors", 
						amount = 1,
					},
				},
				phar_main_emar_emar = 
				{
					{
						unit_key = "phar_main_nat_sin_shasu_warriors", 
						amount = 1,
					},
				},
				phar_main_ashkelon_ashkelon = 
				{
					{
						unit_key = "phar_main_nat_sin_shasu_warriors", 
						amount = 1,
					},
				},
				phar_main_tyre_byblos = 
				{
					{
						unit_key = "phar_main_nat_fen_veteran_canaanite_swordsmen", 
						amount = 1,
					},
				},
				phar_main_carchemish_carchemish = 
				{
					{
						unit_key = "phar_main_nat_fen_veteran_canaanite_swordsmen", 
						amount = 1,
					},
				},
				phar_main_ugarit_ugarit = 
				{
					{
						unit_key = "phar_main_nat_fen_veteran_canaanite_swordsmen", 
						amount = 1,
					},
				},
				phar_main_malidiya_malidiya = 
				{
					{
						unit_key = "phar_main_nat_isu_isuwan_axemen", 
						amount = 1,
					},
				},
				phar_main_south_hatti_tarhuntassa = 
				{
					{
						unit_key = "phar_main_nat_isu_isuwan_axemen", 
						amount = 1,
					},
				},
				phar_main_west_hatti_gordion = 
				{
					{
						unit_key = "phar_main_nat_hig_kaskian_chargers", 
						amount = 1,
					},
				},
				phar_main_hattussa_hattussa = 
				{
					{
						unit_key = "phar_main_nat_hig_kaskian_chargers", 
						amount = 1,
					},
				},
				phar_map_aranzah_assur = 
				{
					{
						unit_key = "phar_map_nat_assur_akkadian_clubmen", 
						amount = 1,
					},
				},
				phar_map_bit_peri_amurru_dur_kurigalzu = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_axemen", 
						amount = 1,
					},
				},
				phar_map_northern_elam_susa = 
				{
					{
						unit_key = "phar_map_nat_halt_elamite_vanguard", 
						amount = 1,
					},
				},
				phar_map_kan_digirak_babylon = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_axemen", 
						amount = 1,
					},
				},
				phar_map_karduniash_ishtananu_nippur = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_axemen", 
						amount = 1,
					},
				},
				phar_map_kretes_knossos = 
				{
					{
						unit_key = "phar_map_nat_ach_laconian_hillmen", 
						amount = 1,
					},
				},
				phar_map_mycenaeca_mycenae = 
				{
					{
						unit_key = "phar_map_nat_ach_laconian_hillmen", 
						amount = 1,
					},
				},
				phar_map_sinticobisaltia_siris = 
				{
					{
						unit_key = "phar_map_nat_thr_plainsmen", 
						amount = 1,
					},
				},
				phar_map_ilion_troy = 
				{
					{
						unit_key = "phar_map_nat_wil_coastal_club_fighters", 
						amount = 1,
					},
				},
				phar_map_isthmos_cibyra = 
				{
					{
						unit_key = "phar_map_nat_wil_coastal_club_fighters", 
						amount = 1,
					},
				},
			},
			bal_rec_garrison_bribe_archers = 
			{
				phar_main_memphis_memphis = 
				{
					{
						unit_key = "phar_main_nat_low_armoured_lower_egyptian_archers", 
						amount = 1,
					},
				},
				phar_main_heliopolis_heliopolis =
				{
					{
						unit_key = "phar_main_nat_low_armoured_lower_egyptian_archers", 
						amount = 1,
					},
				},
				phar_main_hermopolis_hermopolis =
				{
					{
						unit_key = "phar_main_nat_low_armoured_lower_egyptian_archers", 
						amount = 1,
					},
				},
				phar_main_abydos_abydos = 
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_javelin_throwers", 
						amount = 1,
					},
				},
				phar_main_thebes_thebes = 
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_javelin_throwers", 
						amount = 1,
					},
				},
				phar_main_kom_ombo_kom_ombo = 
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_javelin_throwers", 
						amount = 1,
					},
				},
				phar_main_kawa_kawa = 
				{
					{
						unit_key = "phar_main_nat_nub_nubian_longbowmen", 
						amount = 1,
					},
				},
				phar_main_buhen_buhen = 
				{
					{
						unit_key = "phar_main_nat_nub_nubian_longbowmen", 
						amount = 1,
					},
				},
				phar_main_north_nubia_miam = 
				{
					{
						unit_key = "phar_main_nat_nub_nubian_longbowmen", 
						amount = 1,
					},
				},
				phar_main_damascus_damascus = 
				{
					{
						unit_key = "phar_main_nat_sin_shasu_archers", 
						amount = 1,
					},
				},
				phar_main_emar_emar = 
				{
					{
						unit_key = "phar_main_nat_sin_shasu_archers", 
						amount = 1,
					},
				},
				phar_main_ashkelon_ashkelon = 
				{
					{
						unit_key = "phar_main_nat_sin_shasu_archers", 
						amount = 1,
					},
				},
				phar_main_tyre_byblos = 
				{
					{
						unit_key = "phar_main_nat_fen_light_syrian_archers", 
						amount = 1,
					},
				},
				phar_main_carchemish_carchemish = 
				{
					{
						unit_key = "phar_main_nat_fen_light_syrian_archers", 
						amount = 1,
					},
				},
				phar_main_ugarit_ugarit = 
				{
					{
						unit_key = "phar_main_nat_fen_light_syrian_archers", 
						amount = 1,
					},
				},
				phar_main_malidiya_malidiya = 
				{
					{
						unit_key = "phar_main_nat_isu_hittite_archers", 
						amount = 1,
					},
				},
				phar_main_south_hatti_tarhuntassa = 
				{
					{
						unit_key = "phar_main_nat_isu_hittite_archers", 
						amount = 1,
					},
				},
				phar_main_west_hatti_gordion = 
				{
					{
						unit_key = "phar_main_nat_hig_phrygian_skirmishers", 
						amount = 1,
					},
				},
				phar_main_hattussa_hattussa = 
				{
					{
						unit_key = "phar_main_nat_hig_phrygian_skirmishers", 
						amount = 1,
					},
				},
				phar_map_aranzah_assur = 
				{
					{
						unit_key = "phar_map_nat_assur_akkadian_skirmishers", 
						amount = 1,
					},
				},
				phar_map_bit_peri_amurru_dur_kurigalzu = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_warriors", 
						amount = 1,
					},
				},
				phar_map_northern_elam_susa = 
				{
					{
						unit_key = "phar_map_nat_halt_elamite_vanguard", 
						amount = 1,
					},
				},
				phar_map_kan_digirak_babylon = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_warriors", 
						amount = 1,
					},
				},
				phar_map_karduniash_ishtananu_nippur = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_warriors", 
						amount = 1,
					},
				},
				phar_map_kretes_knossos = 
				{
					{
						unit_key = "phar_map_nat_ach_veteran_achaean_slingers", 
						amount = 1,
					},
				},
				phar_map_mycenaeca_mycenae = 
				{
					{
						unit_key = "phar_map_nat_ach_achaean_javelinmen", 
						amount = 1,
					},
				},
				phar_map_sinticobisaltia_siris = 
				{
					{
						unit_key = "phar_map_nat_thr_thracian_hunters", 
						amount = 2,
					},
				},
				phar_map_ilion_troy = 
				{
					{
						unit_key = "phar_map_nat_wil_veteran_trojan_slingers", 
						amount = 1,
					},
				},
				phar_map_isthmos_cibyra = 
				{
					{
						unit_key = "phar_map_nat_wil_veteran_trojan_slingers", 
						amount = 1,
					},
				},
			},
			sup_meet_local_hire_champion = 
			{
				phar_main_memphis_memphis = 
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_veteran_swordsmen", 
						amount = 1,
					},
				},
				phar_main_heliopolis_heliopolis =
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_veteran_swordsmen", 
						amount = 1,
					},
				},
				phar_main_hermopolis_hermopolis =
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_veteran_swordsmen", 
						amount = 1,
					},
				},
				phar_main_abydos_abydos =
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_khopesh_warriors", 
						amount = 1,
					},
				},
				phar_main_thebes_thebes =
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_khopesh_warriors", 
						amount = 1,
					},
				},
				phar_main_kom_ombo_kom_ombo =
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_khopesh_warriors", 
						amount = 1,
					},
				},
				phar_main_kawa_kawa = 
				{
					{
						unit_key = "phar_main_nat_nub_renowned_nubian_longbowmen", 
						amount = 1,
					},
				},
				phar_main_buhen_buhen = 
				{
					{
						unit_key = "phar_main_nat_nub_renowned_nubian_longbowmen", 
						amount = 1,
					},
				},
				phar_main_north_nubia_miam = 
				{
					{
						unit_key = "phar_main_nat_nub_renowned_nubian_longbowmen", 
						amount = 1,
					},
				},
				phar_main_damascus_damascus = 
				{
					{
						unit_key = "phar_main_nat_sin_renowned_habiru_slingers", 
						amount = 1,
					},
				},
				phar_main_emar_emar = 
				{
					{
						unit_key = "phar_main_nat_sin_renowned_habiru_slingers", 
						amount = 1,
					},
				},
				phar_main_ashkelon_ashkelon = 
				{
					{
						unit_key = "phar_main_nat_sin_renowned_habiru_slingers", 
						amount = 1,
					},
				},
				phar_main_tyre_byblos = 
				{
					{
						unit_key = "phar_main_nat_fen_armoured_syrian_archers", 
						amount = 1,
					},
				},
				phar_main_carchemish_carchemish = 
				{
					{
						unit_key = "phar_main_nat_fen_armoured_syrian_archers", 
						amount = 1,
					},
				},
				phar_main_ugarit_ugarit = 
				{
					{
						unit_key = "phar_main_nat_fen_armoured_syrian_archers", 
						amount = 1,
					},
				},
				phar_main_malidiya_malidiya = 
				{
					{
						unit_key = "phar_main_nat_isu_armoured_anatolian_swordsmen", 
						amount = 1,
					},
				},
				phar_main_south_hatti_tarhuntassa = 
				{
					{
						unit_key = "phar_main_nat_isu_armoured_anatolian_swordsmen", 
						amount = 1,
					},
				},
				phar_main_west_hatti_gordion = 
				{
					{
						unit_key = "phar_main_nat_hig_kaskian_raiders", 
						amount = 1,
					},
				},
				phar_main_hattussa_hattussa = 
				{
					{
						unit_key = "phar_main_nat_hig_kaskian_raiders", 
						amount = 1,
					},
				},
				phar_map_aranzah_assur = 
				{
					{
						unit_key = "phar_map_nat_assur_akkadian_defenders", 
						amount = 1,
					},
				},
				phar_map_bit_peri_amurru_dur_kurigalzu = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_armoured_archers", 
						amount = 1,
					},
				},
				phar_map_northern_elam_susa = 
				{
					{
						unit_key = "phar_map_nat_halt_elamite_veterans", 
						amount = 1,
					},
				},
				phar_map_kan_digirak_babylon = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_armoured_archers", 
						amount = 1,
					},
				},
				phar_map_karduniash_ishtananu_nippur = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_armoured_archers", 
						amount = 1,
					},
				},
				phar_map_kretes_knossos = 
				{
					{
						unit_key = "phar_map_nat_ach_shielded_spearmen", 
						amount = 1,
					},
				},
				phar_map_mycenaeca_mycenae = 
				{
					{
						unit_key = "phar_map_nat_ach_argive_axemen", 
						amount = 1,
					},
				},
				phar_map_sinticobisaltia_siris = 
				{
					{
						unit_key = "phar_map_nat_thr_thracian_guard", 
						amount = 1,
					},
				},
				phar_map_ilion_troy = 
				{
					{
						unit_key = "phar_map_nat_wil_heavy_trojan_spearmen", 
						amount = 1,
					},
				},
				phar_map_isthmos_cibyra = 
				{
					{
						unit_key = "phar_map_nat_wil_armoured_lycian_archers", 
						amount = 1,
					},
				},
			},
			sup_meet_local_hire_champion_2 = 
			{
				phar_main_memphis_memphis = 
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_veteran_spearmen", 
						amount = 1,
					},
				},
				phar_main_heliopolis_heliopolis =
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_veteran_spearmen", 
						amount = 1,
					},
				},
				phar_main_hermopolis_hermopolis =
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_veteran_spearmen", 
						amount = 1,
					},
				},
				phar_main_abydos_abydos =
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_mace_axe_warriors", 
						amount = 1,
					},
				},
				phar_main_thebes_thebes =
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_mace_axe_warriors", 
						amount = 1,
					},
				},
				phar_main_kom_ombo_kom_ombo =
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_mace_axe_warriors", 
						amount = 1,
					},
				},
				phar_main_kawa_kawa = 
				{
					{
						unit_key = "phar_main_nat_nub_renowned_kushite_archers", 
						amount = 1,
					},
				},
				phar_main_buhen_buhen = 
				{
					{
						unit_key = "phar_main_nat_nub_renowned_kushite_archers", 
						amount = 1,
					},
				},
				phar_main_north_nubia_miam = 
				{
					{
						unit_key = "phar_main_nat_nub_renowned_kushite_archers", 
						amount = 1,
					},
				},
				phar_main_damascus_damascus = 
				{
					{
						unit_key = "phar_main_nat_sin_habiru_mercenaries", 
						amount = 1,
					},
				},
				phar_main_emar_emar = 
				{
					{
						unit_key = "phar_main_nat_sin_habiru_mercenaries", 
						amount = 1,
					},
				},
				phar_main_ashkelon_ashkelon = 
				{
					{
						unit_key = "phar_main_nat_sin_habiru_mercenaries", 
						amount = 1,
					},
				},
				phar_main_tyre_byblos = 
				{
					{
						unit_key = "phar_main_nat_fen_veteran_canaanite_shieldbearers", 
						amount = 1,
					},
				},
				phar_main_carchemish_carchemish = 
				{
					{
						unit_key = "phar_main_nat_fen_veteran_canaanite_shieldbearers", 
						amount = 1,
					},
				},
				phar_main_ugarit_ugarit = 
				{
					{
						unit_key = "phar_main_nat_fen_veteran_canaanite_shieldbearers", 
						amount = 1,
					},
				},
				phar_main_malidiya_malidiya = 
				{
					{
						unit_key = "phar_main_nat_isu_renowned_isuwan_axemen", 
						amount = 1,
					},
				},
				phar_main_south_hatti_tarhuntassa = 
				{
					{
						unit_key = "phar_main_nat_isu_renowned_isuwan_axemen", 
						amount = 1,
					},
				},
				phar_main_west_hatti_gordion = 
				{
					{
						unit_key = "phar_main_nat_hig_renowned_phrygian_javelin_throwers", 
						amount = 1,
					},
				},
				phar_main_hattussa_hattussa = 
				{
					{
						unit_key = "phar_main_nat_hig_renowned_phrygian_javelin_throwers", 
						amount = 1,
					},
				},
				phar_map_aranzah_assur = 
				{
					{
						unit_key = "phar_map_nat_assur_akkadian_defenders", 
						amount = 1,
					},
				},
				phar_map_bit_peri_amurru_dur_kurigalzu = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_armoured_archers", 
						amount = 1,
					},
				},
				phar_map_northern_elam_susa = 
				{
					{
						unit_key = "phar_map_nat_halt_elamite_veteran_vanguard", 
						amount = 1,
					},
				},
				phar_map_kan_digirak_babylon = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_armoured_archers", 
						amount = 1,
					},
				},
				phar_map_karduniash_ishtananu_nippur = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_armoured_archers", 
						amount = 1,
					},
				},
				phar_map_kretes_knossos = 
				{
					{
						unit_key = "phar_map_nat_ach_shielded_spearmen", 
						amount = 1,
					},
				},
				phar_map_mycenaeca_mycenae = 
				{
					{
						unit_key = "phar_map_nat_ach_shielded_spearmen", 
						amount = 1,
					},
				},
				phar_map_sinticobisaltia_siris = 
				{
					{
						unit_key = "phar_map_nat_thr_thracian_archers", 
						amount = 1,
					},
				},
				phar_map_ilion_troy = 
				{
					{
						unit_key = "phar_map_nat_wil_heavy_shock_spears", 
						amount = 1,
					},
				},
				phar_map_isthmos_cibyra = 
				{
					{
						unit_key = "phar_map_nat_wil_heavy_trojan_spearmen", 
						amount = 1,
					},
				},
			},
			sup_befr_local_hire_warlord = 
			{
				phar_main_memphis_memphis = 
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_veteran_spearmen", 
						amount = 1,
					},
					{
						unit_key = "phar_main_nat_low_armoured_lower_egyptian_archers", 
						amount = 2,
					},
				},
				phar_main_heliopolis_heliopolis =
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_veteran_spearmen", 
						amount = 1,
					},
					{
						unit_key = "phar_main_nat_low_armoured_lower_egyptian_archers", 
						amount = 2,
					},
				},
				phar_main_hermopolis_hermopolis =
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_veteran_spearmen", 
						amount = 1,
					},
					{
						unit_key = "phar_main_nat_low_armoured_lower_egyptian_archers", 
						amount = 2,
					},
				},
				phar_main_abydos_abydos =
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_renowned_archers", 
						amount = 1,
					},
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_javelin_throwers", 
						amount = 2,
					},
				},
				phar_main_thebes_thebes =
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_renowned_archers", 
						amount = 1,
					},
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_javelin_throwers", 
						amount = 2,
					},
				},
				phar_main_kom_ombo_kom_ombo =
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_renowned_archers", 
						amount = 1,
					},
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_javelin_throwers", 
						amount = 2,
					},
				},
				phar_main_kawa_kawa = 
				{
					{
						unit_key = "phar_main_nat_nub_renowned_kushite_archers", 
						amount = 1,
					},
					{
						unit_key = "phar_main_nat_nub_nubian_clubmen", 
						amount = 2,
					},
				},
				phar_main_buhen_buhen = 
				{
					{
						unit_key = "phar_main_nat_nub_renowned_kushite_archers", 
						amount = 1,
					},
					{
						unit_key = "phar_main_nat_nub_nubian_clubmen", 
						amount = 2,
					},
				},
				phar_main_north_nubia_miam = 
				{
					{
						unit_key = "phar_main_nat_nub_renowned_kushite_archers", 
						amount = 1,
					},
					{
						unit_key = "phar_main_nat_nub_nubian_clubmen", 
						amount = 2,
					},
				},
				phar_main_damascus_damascus = 
				{
					{
						unit_key = "phar_main_nat_sin_habiru_mercenaries", 
						amount = 1,
					},
					{
						unit_key = "phar_main_nat_sin_shasu_archers", 
						amount = 2,
					},
				},
				phar_main_emar_emar = 
				{
					{
						unit_key = "phar_main_nat_sin_habiru_mercenaries", 
						amount = 1,
					},
					{
						unit_key = "phar_main_nat_sin_shasu_archers", 
						amount = 2,
					},
				},
				phar_main_ashkelon_ashkelon = 
				{
					{
						unit_key = "phar_main_nat_sin_habiru_mercenaries", 
						amount = 1,
					},
					{
						unit_key = "phar_main_nat_sin_shasu_archers", 
						amount = 2,
					},
				},
				phar_main_tyre_byblos = 
				{
					{
						unit_key = "phar_main_nat_fen_veteran_canaanite_shieldbearers", 
						amount = 1,
					},
					{
						unit_key = "phar_main_nat_fen_light_syrian_archers", 
						amount = 2,
					},
				},
				phar_main_carchemish_carchemish = 
				{
					{
						unit_key = "phar_main_nat_fen_veteran_canaanite_shieldbearers", 
						amount = 1,
					},
					{
						unit_key = "phar_main_nat_fen_light_syrian_archers", 
						amount = 2,
					},
				},
				phar_main_ugarit_ugarit = 
				{
					{
						unit_key = "phar_main_nat_fen_veteran_canaanite_shieldbearers", 
						amount = 1,
					},
					{
						unit_key = "phar_main_nat_fen_light_syrian_archers", 
						amount = 2,
					},
				},
				phar_main_malidiya_malidiya = 
				{
					{
						unit_key = "phar_main_nat_isu_renowned_isuwan_axemen", 
						amount = 1,
					},
					{
						unit_key = "phar_main_nat_isu_hittite_archers", 
						amount = 2,
					},
				},
				phar_main_south_hatti_tarhuntassa = 
				{
					{
						unit_key = "phar_main_nat_isu_renowned_isuwan_axemen", 
						amount = 1,
					},
					{
						unit_key = "phar_main_nat_isu_hittite_archers", 
						amount = 2,
					},
				},
				phar_main_west_hatti_gordion = 
				{
					{
						unit_key = "phar_main_nat_hig_renowned_phrygian_javelin_throwers", 
						amount = 1,
					},
					{
						unit_key = "phar_main_nat_hig_phrygian_skirmishers", 
						amount = 2,
					},
				},
				phar_main_hattussa_hattussa = 
				{
					{
						unit_key = "phar_main_nat_hig_renowned_phrygian_javelin_throwers", 
						amount = 1,
					},
					{
						unit_key = "phar_main_nat_hig_phrygian_skirmishers", 
						amount = 2,
					},
				},
				phar_map_aranzah_assur = 
				{
					{
						unit_key = "phar_map_nat_assur_akkadian_clubmen", 
						amount = 1,
					},
					{
						unit_key = "phar_map_nat_assur_akkadian_skirmishers", 
						amount = 2,
					},
				},
				phar_map_bit_peri_amurru_dur_kurigalzu = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_axemen", 
						amount = 3,
					},
				},
				phar_map_northern_elam_susa = 
				{
					{
						unit_key = "phar_map_nat_halt_elamite_vanguard", 
						amount = 3,
					},
				},
				phar_map_kan_digirak_babylon = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_axemen", 
						amount = 3,
					},
				},
				phar_map_karduniash_ishtananu_nippur = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_axemen", 
						amount = 3,
					},
				},
				phar_map_kretes_knossos = 
				{
					{
						unit_key = "phar_map_nat_ach_laconian_hillmen", 
						amount = 1,
					},
					{
						unit_key = "phar_map_nat_ach_veteran_achaean_slingers", 
						amount = 2,
					},
				},
				phar_map_mycenaeca_mycenae = 
				{
					{
						unit_key = "phar_map_nat_ach_laconian_hillmen", 
						amount = 1,
					},
					{
						unit_key = "phar_map_nat_ach_achaean_javelinmen", 
						amount = 2,
					},
				},
				phar_map_sinticobisaltia_siris = 
				{
					{
						unit_key = "phar_map_nat_thr_plainsmen", 
						amount = 1,
					},
					{
						unit_key = "phar_map_nat_thr_thracian_hunters", 
						amount = 3,
					},
				},
				phar_map_ilion_troy = 
				{
					{
						unit_key = "phar_map_nat_wil_coastal_club_fighters", 
						amount = 1,
					},
					{
						unit_key = "phar_map_nat_wil_veteran_trojan_slingers", 
						amount = 2,
					},
				},
				phar_map_isthmos_cibyra = 
				{
					{
						unit_key = "phar_map_nat_wil_coastal_club_fighters", 
						amount = 1,
					},
					{
						unit_key = "phar_map_nat_wil_veteran_trojan_slingers", 
						amount = 2,
					},
				},
			},
			culmination_support = 
			{
				phar_main_memphis_memphis = 
				{
					{
						unit_key = "phar_main_nat_low_egyptian_chariots", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_low_lower_egyptian_veteran_swordsmen", 
						amount = 2,
					},
				},
				phar_main_heliopolis_heliopolis =
				{
					{
						unit_key = "phar_main_nat_low_egyptian_chariots", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_low_lower_egyptian_veteran_swordsmen", 
						amount = 2,
					},
				},
				phar_main_hermopolis_hermopolis = 
				{
					{
						unit_key = "phar_main_nat_low_egyptian_chariots", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_low_lower_egyptian_veteran_swordsmen", 
						amount = 2,
					},
				},
				phar_main_abydos_abydos = 
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_khopesh_warriors", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_renowned_archers", 
						amount = 2,
					},
				},
				phar_main_thebes_thebes = 
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_khopesh_warriors", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_renowned_archers", 
						amount = 2,
					},
				},
				phar_main_kom_ombo_kom_ombo = 
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_khopesh_warriors", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_renowned_archers", 
						amount = 2,
					},
				},
				phar_main_kawa_kawa = 
				{
					{
						unit_key = "phar_main_nat_nub_renowned_kushite_archers", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_nub_renowned_nubian_longbowmen", 
						amount = 2,
					},
				},
				phar_main_buhen_buhen = 
				{
					{
						unit_key = "phar_main_nat_nub_renowned_kushite_archers", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_nub_renowned_nubian_longbowmen", 
						amount = 2,
					},
				},
				phar_main_north_nubia_miam = 
				{
					{
						unit_key = "phar_main_nat_nub_renowned_kushite_archers", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_nub_renowned_nubian_longbowmen", 
						amount = 2,
					},
				},
				phar_main_damascus_damascus = 
				{
					{
						unit_key = "phar_main_nat_sin_habiru_mercenaries", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_sin_renowned_habiru_slingers", 
						amount = 2,
					},
				},
				phar_main_emar_emar = 
				{
					{
						unit_key = "phar_main_nat_sin_habiru_mercenaries", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_sin_renowned_habiru_slingers", 
						amount = 2,
					},
				},
				phar_main_ashkelon_ashkelon = 
				{
					{
						unit_key = "phar_main_nat_sin_habiru_mercenaries", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_sin_renowned_habiru_slingers", 
						amount = 2,
					},
				},
				phar_main_tyre_byblos = 
				{
					{
						unit_key = "phar_main_nat_fen_renowned_canaanite_swordsmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_fen_armoured_syrian_archers", 
						amount = 2,
					},
				},
				phar_main_carchemish_carchemish = 
				{
					{
						unit_key = "phar_main_nat_fen_renowned_canaanite_swordsmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_fen_armoured_syrian_archers", 
						amount = 2,
					},
				},
				phar_main_ugarit_ugarit = 
				{
					{
						unit_key = "phar_main_nat_fen_renowned_canaanite_swordsmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_fen_armoured_syrian_archers", 
						amount = 2,
					},
				},
				phar_main_malidiya_malidiya = 
				{
					{
						unit_key = "phar_main_nat_isu_heavy_anatolian_chariots", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_isu_renowned_isuwan_axemen", 
						amount = 2,
					},
				},
				phar_main_south_hatti_tarhuntassa = 
				{
					{
						unit_key = "phar_main_nat_isu_heavy_anatolian_chariots", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_isu_renowned_isuwan_axemen", 
						amount = 2,
					},
				},
				phar_main_west_hatti_gordion = 
				{
					{
						unit_key = "phar_main_nat_hig_renowned_phrygian_javelin_throwers", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_hig_kaskian_raiders", 
						amount = 2,
					},
				},
				phar_main_hattussa_hattussa = 
				{
					{
						unit_key = "phar_main_nat_hig_renowned_phrygian_javelin_throwers", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_hig_kaskian_raiders", 
						amount = 2,
					},
				},
				phar_map_aranzah_assur = 
				{
					{
						unit_key = "phar_map_nat_assur_akkadian_defenders", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_assur_akkadian_chargers", 
						amount = 3,
					},
				},
				phar_map_bit_peri_amurru_dur_kurigalzu = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_armoured_archers", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_tamti_akkadian_axemen", 
						amount = 3,
					},
				},
				phar_map_northern_elam_susa = 
				{
					{
						unit_key = "phar_map_nat_halt_elamite_veterans", 
						amount = 1,
					},
					{
						unit_key = "phar_map_nat_halt_elamite_veteran_vanguard", 
						amount = 1,
					},
					{
						unit_key = "phar_map_nat_halt_elamite_veteran_slingers", 
						amount = 1,
					},
					{
						unit_key = "phar_map_nat_halt_elamite_veteran_archers", 
						amount = 1,
					},
				},
				phar_map_kan_digirak_babylon = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_armoured_archers", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_tamti_akkadian_warriors", 
						amount = 3,
					},
				},
				phar_map_karduniash_ishtananu_nippur = 
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_armoured_archers", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_tamti_akkadian_axemen", 
						amount = 3,
					},
				},
				phar_map_kretes_knossos = 
				{
					{
						unit_key = "phar_map_nat_ach_shielded_spearmen", 
						amount = 1,
					},
					{
						unit_key = "phar_map_nat_ach_veteran_achaean_slingers", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_ach_achaean_chariots", 
						amount = 2,
					},
				},
				phar_map_mycenaeca_mycenae = 
				{
					{
						unit_key = "phar_map_nat_ach_argive_axemen", 
						amount = 1,
					},
					{
						unit_key = "phar_map_nat_ach_achaean_chariots", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_ach_achaean_javelinmen", 
						amount = 2,
					},
				},
				phar_map_sinticobisaltia_siris = 
				{
					{
						unit_key = "phar_map_nat_thr_thracian_guard", 
						amount = 1,
					},
					{
						unit_key = "phar_map_nat_thr_thorns_of_thrace", 
						amount = 1,
					},
					{
						unit_key = "phar_map_nat_thr_thracian_archers", 
						amount = 2,
					},
				},
				phar_map_ilion_troy = 
				{
					{
						unit_key = "phar_map_nat_wil_heavy_trojan_spearmen", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_wil_archer_chariots", 
						amount = 2,
					},
				},
				phar_map_isthmos_cibyra = 
				{
					{
						unit_key = "phar_map_nat_wil_armoured_lycian_archers", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_wil_archer_chariots", 
						amount = 2,
					},
				},
			},
		},

		-- units given into special recruitment (mercenaries) after taking over the settlement
		-- split by region and then level of support, should match the ones in config.native_support_rewards
		native_support_unit_rewards = 
		{
			phar_main_memphis_memphis = 
			{
				-- 20%, 2 x Tier 2
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_axe_conscripts", 
						amount = 2,
					},
				},
				-- 40%, 4 x Tier 2
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_axe_conscripts", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_low_lower_egyptian_archers", 
						amount = 2,
					},
				},
				-- 60%, 2 x Tier 2, 2 x Tier 3
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_axe_conscripts", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_low_armoured_lower_egyptian_archers", 
						amount = 2,
					},
				},
				-- 80%, 4 x Tier 3
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_veteran_spearmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_low_armoured_lower_egyptian_archers", 
						amount = 2,
					},
				},
				-- 100%, 2 x Tier 3, 2 x Tier 4
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_veteran_spearmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_low_egyptian_chariots", 
						amount = 2,
					},
				},
			},
			phar_main_heliopolis_heliopolis =
			{
				-- 20%, 2 x Tier 2
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_axe_conscripts", 
						amount = 2,
					},
				},
				-- 40%, 4 x Tier 2
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_axe_conscripts", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_low_lower_egyptian_archers", 
						amount = 2,
					},
				},
				-- 60%, 2 x Tier 2, 2 x Tier 3
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_axe_conscripts", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_low_armoured_lower_egyptian_archers", 
						amount = 2,
					},
				},
				-- 80%, 4 x Tier 3
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_veteran_spearmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_low_armoured_lower_egyptian_archers", 
						amount = 2,
					},
				},
				-- 100%, 2 x Tier 3, 2 x Tier 4
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_veteran_spearmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_low_egyptian_chariots", 
						amount = 2,
					},
				},
			},
			phar_main_hermopolis_hermopolis = 
			{
				-- 20%, 2 x Tier 2
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_axe_conscripts", 
						amount = 2,
					},
				},
				-- 40%, 4 x Tier 2
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_axe_conscripts", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_low_lower_egyptian_archers", 
						amount = 2,
					},
				},
				-- 60%, 2 x Tier 2, 2 x Tier 3
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_axe_conscripts", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_low_armoured_lower_egyptian_archers", 
						amount = 2,
					},
				},
				-- 80%, 4 x Tier 3
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_veteran_spearmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_low_armoured_lower_egyptian_archers", 
						amount = 2,
					},
				},
				-- 100%, 2 x Tier 3, 2 x Tier 4
				{
					{
						unit_key = "phar_main_nat_low_lower_egyptian_veteran_spearmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_low_egyptian_chariots", 
						amount = 2,
					},
				},
			},
			phar_main_abydos_abydos = 
			{
				-- 20%, 2 x Tier 2
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_conscripted_axemen", 
						amount = 2,
					},
				},
				-- 40%, 4 x Tier 2
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_conscripted_axemen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_archers", 
						amount = 2,
					},
				},
				-- 60%, 2 x Tier 2, 2 x Tier 3
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_conscripted_axemen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_javelin_throwers", 
						amount = 2,
					},
				},
				-- 80%, 4 x Tier 3
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_swordsmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_javelin_throwers", 
						amount = 2,
					},
				},
				-- 100%, 2 x Tier 3, 2 x Tier 4
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_javelin_throwers", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_khopesh_warriors", 
						amount = 2,
					},
				},
			},
			phar_main_thebes_thebes = 
			{
				-- 20%, 2 x Tier 2
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_conscripted_axemen", 
						amount = 2,
					},
				},
				-- 40%, 4 x Tier 2
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_conscripted_axemen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_archers", 
						amount = 2,
					},
				},
				-- 60%, 2 x Tier 2, 2 x Tier 3
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_conscripted_axemen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_javelin_throwers", 
						amount = 2,
					},
				},
				-- 80%, 4 x Tier 3
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_swordsmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_javelin_throwers", 
						amount = 2,
					},
				},
				-- 100%, 2 x Tier 3, 2 x Tier 4
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_javelin_throwers", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_khopesh_warriors", 
						amount = 2,
					},
				},
			},
			phar_main_kom_ombo_kom_ombo = 
			{
				-- 20%, 2 x Tier 2
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_conscripted_axemen", 
						amount = 2,
					},
				},
				-- 40%, 4 x Tier 2
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_conscripted_axemen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_archers", 
						amount = 2,
					},
				},
				-- 60%, 2 x Tier 2, 2 x Tier 3
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_conscripted_axemen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_javelin_throwers", 
						amount = 2,
					},
				},
				-- 80%, 4 x Tier 3
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_swordsmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_javelin_throwers", 
						amount = 2,
					},
				},
				-- 100%, 2 x Tier 3, 2 x Tier 4
				{
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_javelin_throwers", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_upp_upper_egyptian_khopesh_warriors", 
						amount = 2,
					},
				},
			},
			phar_main_kawa_kawa = 
			{
				-- 20%, 2 x Tier 2
				{
					{
						unit_key = "phar_main_nat_nub_kushite_spearmen_recruits", 
						amount = 2,
						veterancy = 3,
					},
				},
				-- 40%, 4 x Tier 2
				{
					{
						unit_key = "phar_main_nat_nub_kushite_spearmen_recruits", 
						amount = 2,
						veterancy = 3,
					},
					{
						unit_key = "phar_main_nat_nub_kushite_archers", 
						amount = 2,
						veterancy = 5,
					},
				},
				-- 60%, 2 x Tier 2, 2 x Tier 3
				{
					{
						unit_key = "phar_main_nat_nub_kushite_spearmen_recruits", 
						amount = 2,
						veterancy = 3,
					},
					{
						unit_key = "phar_main_nat_nub_nubian_longbowmen", 
						amount = 2,
						veterancy = 5,
					},
				},
				-- 80%, 4 x Tier 3
				{
					{
						unit_key = "phar_main_nat_nub_kushite_spearmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_nub_nubian_longbowmen", 
						amount = 2,
					},
				},
				-- 100%, 2 x Tier 3, 2 x Tier 4
				{
					{
						unit_key = "phar_main_nat_nub_kushite_spearmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_nub_renowned_kushite_archers", 
						amount = 2,
					},
				},
			},
			phar_main_buhen_buhen = 
			{
				-- 20%, 2 x Tier 2
				{
					{
						unit_key = "phar_main_nat_nub_kushite_spearmen_recruits", 
						amount = 2,
					},
				},
				-- 40%, 4 x Tier 2
				{
					{
						unit_key = "phar_main_nat_nub_kushite_spearmen_recruits", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_nub_kushite_archers", 
						amount = 2,
					},
				},
				-- 60%, 2 x Tier 2, 2 x Tier 3
				{
					{
						unit_key = "phar_main_nat_nub_kushite_spearmen_recruits", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_nub_nubian_longbowmen", 
						amount = 2,
					},
				},
				-- 80%, 4 x Tier 3
				{
					{
						unit_key = "phar_main_nat_nub_kushite_spearmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_nub_nubian_longbowmen", 
						amount = 2,
					},
				},
				-- 100%, 2 x Tier 3, 2 x Tier 4
				{
					{
						unit_key = "phar_main_nat_nub_kushite_spearmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_nub_renowned_kushite_archers", 
						amount = 2,
					},
				},
			},
			phar_main_north_nubia_miam = 
			{
				-- 20%, 2 x Tier 2
				{
					{
						unit_key = "phar_main_nat_nub_kushite_spearmen_recruits", 
						amount = 2,
					},
				},
				-- 40%, 4 x Tier 2
				{
					{
						unit_key = "phar_main_nat_nub_kushite_spearmen_recruits", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_nub_kushite_archers", 
						amount = 2,
					},
				},
				-- 60%, 2 x Tier 2, 2 x Tier 3
				{
					{
						unit_key = "phar_main_nat_nub_kushite_spearmen_recruits", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_nub_nubian_longbowmen", 
						amount = 2,
					},
				},
				-- 80%, 4 x Tier 3
				{
					{
						unit_key = "phar_main_nat_nub_kushite_spearmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_nub_nubian_longbowmen", 
						amount = 2,
					},
				},
				-- 100%, 2 x Tier 3, 2 x Tier 4
				{
					{
						unit_key = "phar_main_nat_nub_kushite_spearmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_nub_renowned_kushite_archers", 
						amount = 2,
					},
				},
			},
			phar_main_damascus_damascus = 
			{
				-- 20%, 2 x Tier 2
				{
					{
						unit_key = "phar_main_nat_sin_habiru_raiders", 
						amount = 2,
					},
				},
				-- 40%, 4 x Tier 2
				{
					{
						unit_key = "phar_main_nat_sin_habiru_raiders", 
						amount = 4,
					},
				},
				-- 60%, 2 x Tier 2, 2 x Tier 3
				{
					{
						unit_key = "phar_main_nat_sin_habiru_raiders", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_sin_shasu_archers", 
						amount = 2,
					},
				},
				-- 80%, 4 x Tier 3
				{
					{
						unit_key = "phar_main_nat_sin_shasu_warriors", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_sin_shasu_archers", 
						amount = 2,
					},
				},
				-- 100%, 2 x Tier 3, 2 x Tier 4
				{
					{
						unit_key = "phar_main_nat_sin_habiru_mercenaries", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_sin_shasu_archers", 
						amount = 2,
					},
				},
			},
			phar_main_emar_emar = 
			{
				-- 20%, 2 x Tier 2
				{
					{
						unit_key = "phar_main_nat_sin_habiru_raiders", 
						amount = 2,
					},
				},
				-- 40%, 4 x Tier 2
				{
					{
						unit_key = "phar_main_nat_sin_habiru_raiders", 
						amount = 4,
					},
				},
				-- 60%, 2 x Tier 2, 2 x Tier 3
				{
					{
						unit_key = "phar_main_nat_sin_habiru_raiders", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_sin_shasu_archers", 
						amount = 2,
					},
				},
				-- 80%, 4 x Tier 3
				{
					{
						unit_key = "phar_main_nat_sin_shasu_warriors", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_sin_shasu_archers", 
						amount = 2,
					},
				},
				-- 100%, 2 x Tier 3, 2 x Tier 4
				{
					{
						unit_key = "phar_main_nat_sin_habiru_mercenaries", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_sin_shasu_archers", 
						amount = 2,
					},
				},
			},
			phar_main_ashkelon_ashkelon = 
			{
				-- 20%, 2 x Tier 2
				{
					{
						unit_key = "phar_main_nat_sin_habiru_raiders", 
						amount = 2,
					},
				},
				-- 40%, 4 x Tier 2
				{
					{
						unit_key = "phar_main_nat_sin_habiru_raiders", 
						amount = 4,
					},
				},
				-- 60%, 2 x Tier 2, 2 x Tier 3
				{
					{
						unit_key = "phar_main_nat_sin_habiru_raiders", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_sin_shasu_archers", 
						amount = 2,
					},
				},
				-- 80%, 4 x Tier 3
				{
					{
						unit_key = "phar_main_nat_sin_shasu_warriors", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_sin_shasu_archers", 
						amount = 2,
					},
				},
				-- 100%, 2 x Tier 3, 2 x Tier 4
				{
					{
						unit_key = "phar_main_nat_sin_habiru_mercenaries", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_sin_shasu_archers", 
						amount = 2,
					},
				},
			},
			phar_main_tyre_byblos = 
			{
				-- 20%, 2 x Tier 2
				{
					{
						unit_key = "phar_main_nat_fen_canaanite_sellswords", 
						amount = 2,
					},
				},
				-- 40%, 4 x Tier 2
				{
					{
						unit_key = "phar_main_nat_fen_canaanite_sellswords", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_fen_canaanite_skirmishers", 
						amount = 2,
					},
				},
				-- 60%, 2 x Tier 2, 2 x Tier 3
				{
					{
						unit_key = "phar_main_nat_fen_veteran_canaanite_swordsmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_fen_canaanite_skirmishers", 
						amount = 2,
					},
				},
				-- 80%, 4 x Tier 3
				{
					{
						unit_key = "phar_main_nat_fen_veteran_canaanite_swordsmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_fen_light_syrian_archers", 
						amount = 2,
					},
				},
				-- 100%, 2 x Tier 3, 2 x Tier 4
				{
					{
						unit_key = "phar_main_nat_fen_renowned_canaanite_swordsmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_fen_light_syrian_archers", 
						amount = 2,
					},
				},
			},
			phar_main_carchemish_carchemish = 
			{
				-- 20%, 2 x Tier 2
				{
					{
						unit_key = "phar_main_nat_fen_canaanite_sellswords", 
						amount = 2,
					},
				},
				-- 40%, 4 x Tier 2
				{
					{
						unit_key = "phar_main_nat_fen_canaanite_sellswords", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_fen_canaanite_skirmishers", 
						amount = 2,
					},
				},
				-- 60%, 2 x Tier 2, 2 x Tier 3
				{
					{
						unit_key = "phar_main_nat_fen_veteran_canaanite_swordsmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_fen_canaanite_skirmishers", 
						amount = 2,
					},
				},
				-- 80%, 4 x Tier 3
				{
					{
						unit_key = "phar_main_nat_fen_veteran_canaanite_swordsmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_fen_light_syrian_archers", 
						amount = 2,
					},
				},
				-- 100%, 2 x Tier 3, 2 x Tier 4
				{
					{
						unit_key = "phar_main_nat_fen_renowned_canaanite_swordsmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_fen_light_syrian_archers", 
						amount = 2,
					},
				},
			},
			phar_main_ugarit_ugarit = 
			{
				-- 20%, 2 x Tier 2
				{
					{
						unit_key = "phar_main_nat_fen_canaanite_sellswords", 
						amount = 2,
					},
				},
				-- 40%, 4 x Tier 2
				{
					{
						unit_key = "phar_main_nat_fen_canaanite_sellswords", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_fen_canaanite_skirmishers", 
						amount = 2,
					},
				},
				-- 60%, 2 x Tier 2, 2 x Tier 3
				{
					{
						unit_key = "phar_main_nat_fen_veteran_canaanite_swordsmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_fen_canaanite_skirmishers", 
						amount = 2,
					},
				},
				-- 80%, 4 x Tier 3
				{
					{
						unit_key = "phar_main_nat_fen_veteran_canaanite_swordsmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_fen_light_syrian_archers", 
						amount = 2,
					},
				},
				-- 100%, 2 x Tier 3, 2 x Tier 4
				{
					{
						unit_key = "phar_main_nat_fen_renowned_canaanite_swordsmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_fen_light_syrian_archers", 
						amount = 2,
					},
				},
			},
			phar_main_malidiya_malidiya = 
			{
				-- 20%, 2 x Tier 2
				{
					{
						unit_key = "phar_main_nat_isu_luwian_swordsmen", 
						amount = 2,
					},
				},
				-- 40%, 4 x Tier 2
				{
					{
						unit_key = "phar_main_nat_isu_luwian_swordsmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_isu_luwian_spearmen", 
						amount = 2,
					},
				},
				-- 60%, 2 x Tier 2, 2 x Tier 3
				{
					{
						unit_key = "phar_main_nat_isu_luwian_swordsmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_isu_hittite_archers", 
						amount = 2,
					},
				},
				-- 80%, 4 x Tier 3
				{
					{
						unit_key = "phar_main_nat_isu_armoured_anatolian_swordsmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_isu_hittite_archers", 
						amount = 2,
					},
				},
				-- 100%, 2 x Tier 3, 2 x Tier 4
				{
					{
						unit_key = "phar_main_nat_isu_renowned_isuwan_axemen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_isu_hittite_archers", 
						amount = 2,
					},
				},
			},
			phar_main_south_hatti_tarhuntassa = 
			{
				-- 20%, 2 x Tier 2
				{
					{
						unit_key = "phar_main_nat_isu_luwian_swordsmen", 
						amount = 2,
					},
				},
				-- 40%, 4 x Tier 2
				{
					{
						unit_key = "phar_main_nat_isu_luwian_swordsmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_isu_luwian_spearmen", 
						amount = 2,
					},
				},
				-- 60%, 2 x Tier 2, 2 x Tier 3
				{
					{
						unit_key = "phar_main_nat_isu_luwian_swordsmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_isu_hittite_archers", 
						amount = 2,
					},
				},
				-- 80%, 4 x Tier 3
				{
					{
						unit_key = "phar_main_nat_isu_armoured_anatolian_swordsmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_isu_hittite_archers", 
						amount = 2,
					},
				},
				-- 100%, 2 x Tier 3, 2 x Tier 4
				{
					{
						unit_key = "phar_main_nat_isu_renowned_isuwan_axemen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_isu_hittite_archers", 
						amount = 2,
					},
				},
			},
			phar_main_west_hatti_gordion = 
			{
				-- 20%, 2 x Tier 2
				{
					{
						unit_key = "phar_main_nat_hig_kaskian_axemen", 
						amount = 2,
					},
				},
				-- 40%, 4 x Tier 2
				{
					{
						unit_key = "phar_main_nat_hig_kaskian_axemen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_hig_phrygian_spearmen", 
						amount = 2,
					},
				},
				-- 60%, 2 x Tier 2, 2 x Tier 3
				{
					{
						unit_key = "phar_main_nat_hig_phrygian_spearmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_hig_kaskian_chargers", 
						amount = 2,
					},
				},
				-- 80%, 4 x Tier 3
				{
					{
						unit_key = "phar_main_nat_hig_kaskian_chargers", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_hig_phrygian_skirmishers", 
						amount = 2,
					},
				},
				-- 100%, 2 x Tier 3, 2 x Tier 4
				{
					{
						unit_key = "phar_main_nat_hig_kaskian_raiders", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_hig_phrygian_skirmishers", 
						amount = 2,
					},
				},
			},
			phar_main_hattussa_hattussa = 
			{
				-- 20%, 2 x Tier 2
				{
					{
						unit_key = "phar_main_nat_hig_kaskian_axemen", 
						amount = 2,
					},
				},
				-- 40%, 4 x Tier 2
				{
					{
						unit_key = "phar_main_nat_hig_kaskian_axemen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_hig_phrygian_spearmen", 
						amount = 2,
					},
				},
				-- 60%, 2 x Tier 2, 2 x Tier 3
				{
					{
						unit_key = "phar_main_nat_hig_phrygian_spearmen", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_hig_kaskian_chargers", 
						amount = 2,
					},
				},
				-- 80%, 4 x Tier 3
				{
					{
						unit_key = "phar_main_nat_hig_kaskian_chargers", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_hig_phrygian_skirmishers", 
						amount = 2,
					},
				},
				-- 100%, 2 x Tier 3, 2 x Tier 4
				{
					{
						unit_key = "phar_main_nat_hig_kaskian_raiders", 
						amount = 2,
					},
					{
						unit_key = "phar_main_nat_hig_phrygian_skirmishers", 
						amount = 2,
					},
				},
			},
			phar_map_aranzah_assur = 
			{
				-- 20%, 2 x Tier 2
				{
					{
						unit_key = "phar_map_nat_assur_akkadian_militia", 
						amount = 2,
					},
				},
				-- 40%, 4 x Tier 2
				{
					{
						unit_key = "phar_map_nat_assur_akkadian_militia", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_assur_akkadian_militia_spearmen", 
						amount = 2,
					},
				},
				-- 60%, 2 x Tier 2, 2 x Tier 3
				{
					{
						unit_key = "phar_map_nat_assur_akkadian_militia_spearmen", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_assur_akkadian_chargers", 
						amount = 2,
					},
				},
				-- 80%, 4 x Tier 3
				{
					{
						unit_key = "phar_map_nat_assur_akkadian_clubmen", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_assur_akkadian_skirmishers", 
						amount = 2,
					},
				},
				-- 100%, 2 x Tier 3, 2 x Tier 4
				{
					{
						unit_key = "phar_map_nat_assur_akkadian_chargers", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_assur_akkadian_defenders", 
						amount = 2,
					},
				},
			},
			phar_map_bit_peri_amurru_dur_kurigalzu = 
			{
				-- 20%, 2 x Tier 2
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_militia", 
						amount = 2,
					},
				},
				-- 40%, 4 x Tier 2
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_militia_spearmen", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_tamti_akkadian_archers", 
						amount = 2,
					},
				},
				-- 60%, 2 x Tier 2, 2 x Tier 3
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_archers", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_tamti_akkadian_warriors", 
						amount = 2,
					},
				},
				-- 80%, 4 x Tier 3
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_axemen", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_tamti_akkadian_horsemen", 
						amount = 2,
					},
				},
				-- 100%, 2 x Tier 3, 2 x Tier 4
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_warriors", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_tamti_akkadian_armoured_archers", 
						amount = 2,
					},
				},
			},
			phar_map_northern_elam_susa = 
			{
				-- 20%, 2 x Tier 2
				{
					{
						unit_key = "phar_map_nat_halt_elamite_warriors", 
						amount = 2,
					},
				},
				-- 40%, 4 x Tier 2
				{
					{
						unit_key = "phar_map_nat_halt_elamite_defenders", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_halt_elamite_bowmen", 
						amount = 2,
					},
				},
				-- 60%, 2 x Tier 2, 2 x Tier 3
				{
					{
						unit_key = "phar_map_nat_halt_elamite_slingers", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_halt_elamite_vanguard", 
						amount = 2,
					},
				},
				-- 80%, 4 x Tier 3
				{
					{
						unit_key = "phar_map_nat_halt_elamite_vanguard", 
						amount = 4,
					},
				},
				-- 100%, 2 x Tier 3, 2 x Tier 4
				{
					{
						unit_key = "phar_map_nat_halt_elamite_vanguard", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_halt_elamite_veteran_archers", 
						amount = 1,
					},
					{
						unit_key = "phar_map_nat_halt_elamite_veteran_slingers", 
						amount = 1,
					},
				},
			},
			phar_map_kan_digirak_babylon = 
			{
				-- 20%, 2 x Tier 2
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_militia", 
						amount = 2,
					},
				},
				-- 40%, 4 x Tier 2
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_militia_spearmen", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_tamti_akkadian_archers", 
						amount = 2,
					},
				},
				-- 60%, 2 x Tier 2, 2 x Tier 3
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_archers", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_tamti_akkadian_warriors", 
						amount = 2,
					},
				},
				-- 80%, 4 x Tier 3
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_axemen", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_tamti_akkadian_horsemen", 
						amount = 2,
					},
				},
				-- 100%, 2 x Tier 3, 2 x Tier 4
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_warriors", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_tamti_akkadian_armoured_archers", 
						amount = 2,
					},
				},
			},
			phar_map_karduniash_ishtananu_nippur = 
			{
				-- 20%, 2 x Tier 2
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_militia", 
						amount = 2,
					},
				},
				-- 40%, 4 x Tier 2
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_militia_spearmen", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_tamti_akkadian_archers", 
						amount = 2,
					},
				},
				-- 60%, 2 x Tier 2, 2 x Tier 3
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_archers", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_tamti_akkadian_warriors", 
						amount = 2,
					},
				},
				-- 80%, 4 x Tier 3
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_axemen", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_tamti_akkadian_horsemen", 
						amount = 2,
					},
				},
				-- 100%, 2 x Tier 3, 2 x Tier 4
				{
					{
						unit_key = "phar_map_nat_tamti_akkadian_warriors", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_tamti_akkadian_armoured_archers", 
						amount = 2,
					},
				},
			},
			phar_map_kretes_knossos = 
			{
				-- 20%, 2 x Tier 2
				{
					{
						unit_key = "phar_map_nat_ach_achaean_islanders", 
						amount = 2,
					},
				},
				-- 40%, 4 x Tier 2
				{
					{
						unit_key = "phar_map_nat_ach_achaean_spearmen", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_ach_achaean_bowmen", 
						amount = 2,
					},
				},
				-- 60%, 2 x Tier 2, 2 x Tier 3
				{
					{
						unit_key = "phar_map_nat_ach_achaean_islanders", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_ach_veteran_achaean_slingers", 
						amount = 2,
					},
				},
				-- 80%, 4 x Tier 3
				{
					{
						unit_key = "phar_map_nat_ach_aeginian_runners", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_ach_achaean_chariots", 
						amount = 2,
					},
				},
				-- 100%, 2 x Tier 3, 2 x Tier 4
				{
					{
						unit_key = "phar_map_nat_ach_veteran_achaean_slingers", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_ach_shielded_spearmen", 
						amount = 2,
					},
				},
			},
			phar_map_mycenaeca_mycenae = 
			{
				-- 20%, 2 x Tier 2
				{
					{
						unit_key = "phar_map_nat_ach_achaean_spearmen", 
						amount = 2,
					},
				},
				-- 40%, 4 x Tier 2
				{
					{
						unit_key = "phar_map_nat_ach_achaean_spearmen", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_ach_achaean_bowmen", 
						amount = 2,
					},
				},
				-- 60%, 2 x Tier 2, 2 x Tier 3
				{
					{
						unit_key = "phar_map_nat_ach_achaean_spearmen", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_ach_laconian_hillmen", 
						amount = 2,
					},
				},
				-- 80%, 4 x Tier 3
				{
					{
						unit_key = "phar_map_nat_ach_laconian_hillmen", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_ach_achaean_javelinmen", 
						amount = 2,
					},
				},
				-- 100%, 2 x Tier 3, 2 x Tier 4
				{
					{
						unit_key = "phar_map_nat_ach_achaean_javelinmen", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_ach_argive_axemen", 
						amount = 2,
					},
				},
			},
			phar_map_sinticobisaltia_siris = 
			{
				-- 20%, 2 x Tier 2
				{
					{
						unit_key = "phar_map_nat_thr_plainsmen", 
						amount = 2,
					},
				},
				-- 40%, 4 x Tier 2
				{
					{
						unit_key = "phar_map_nat_thr_plainsmen", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_thr_thracian_light_chariots", 
						amount = 2,
					},
				},
				-- 60%, 2 x Tier 2, 2 x Tier 3
				{
					{
						unit_key = "phar_map_nat_thr_thracian_hunters", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_thr_worshippers_of_pan", 
						amount = 2,
					},
				},
				-- 80%, 4 x Tier 3
				{
					{
						unit_key = "phar_map_nat_thr_thracian_spearmen", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_thr_thracian_chariots", 
						amount = 2,
					},
				},
				-- 100%, 2 x Tier 3, 2 x Tier 4
				{
					{
						unit_key = "phar_map_nat_thr_worshippers_of_pan", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_thr_thorns_of_thrace", 
						amount = 2,
					},
				},
			},
			phar_map_ilion_troy = 
			{
				-- 20%, 2 x Tier 2
				{
					{
						unit_key = "phar_map_nat_wil_coastal_club_fighters", 
						amount = 2,
					},
				},
				-- 40%, 4 x Tier 2
				{
					{
						unit_key = "phar_map_nat_wil_coastal_club_fighters", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_wil_trojan_archers", 
						amount = 2,
					},
				},
				-- 60%, 2 x Tier 2, 2 x Tier 3
				{
					{
						unit_key = "phar_map_nat_wil_coastal_club_fighters", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_wil_veteran_trojan_slingers", 
						amount = 2,
					},
				},
				-- 80%, 4 x Tier 3
				{
					{
						unit_key = "phar_map_nat_wil_trojan_chariots", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_wil_veteran_trojan_slingers", 
						amount = 2,
					},
				},
				-- 100%, 2 x Tier 3, 2 x Tier 4
				{
					{
						unit_key = "phar_map_nat_wil_veteran_trojan_slingers", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_wil_heavy_trojan_spearmen", 
						amount = 2,
					},
				},
			},
			phar_map_isthmos_cibyra = 
			{
				-- 20%, 2 x Tier 2
				{
					{
						unit_key = "phar_map_nat_wil_eastern_spearmen", 
						amount = 2,
					},
				},
				-- 40%, 4 x Tier 2
				{
					{
						unit_key = "phar_map_nat_wil_eastern_spearmen", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_wil_trojan_archers", 
						amount = 2,
					},
				},
				-- 60%, 2 x Tier 2, 2 x Tier 3
				{
					{
						unit_key = "phar_map_nat_wil_eastern_spearmen", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_wil_anatolian_swords", 
						amount = 2,
					},
				},
				-- 80%, 4 x Tier 3
				{
					{
						unit_key = "phar_map_nat_wil_anatolian_swords", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_wil_trojan_chariots", 
						amount = 2,
					},
				},
				-- 100%, 2 x Tier 3, 2 x Tier 4
				{
					{
						unit_key = "phar_map_nat_wil_anatolian_swords", 
						amount = 2,
					},
					{
						unit_key = "phar_map_nat_wil_archer_chariots", 
						amount = 1,
					},
					{
						unit_key = "phar_map_nat_wil_armoured_lycian_archers", 
						amount = 1,
					},
				},
			},
		},

		-- actions have the following structure:
		--{
			--	action_key = "embed_saboteur",

			--	optional, a parameter to change how likely it is to happen, the default value is default_action_weight
			--	chance_weight = 1,

			--	ui_data = 
			--	{
			--		name_localization_key = "Embed Saboteur",
			--		description_localization_key = "Reduce Hold-Out Time by 1 turn",
			--	},

			-- display_enemy_city_notification = true
			-- optional, will show a description above the effect bundle, used for negative effect bundles that that are applied to the target city

			--	-- the main way costs are supposed to be used
			--	resource_costs_record = "phar_main_court_intrigue_assist_1",
			--	-- for testing, used only when resource_costs_record is not available
			--	test_cost = 
			--	{
			--		{"troy_gold", -350},
			--	},

			--	optional, if none of the actions list are chosen, this action will not be available to come up at random
			--	one chosen action is enough to unlock this one
			--	requires_actions = {},

			--	optional, if there is at least one action in the list that was chosen, this action will not be available to come up at random
			--	locked_by_actions = {},

			--	optional, if this action won't appear as an option if one of the listed actions is also chosen as the current action
			--	incompatible_actions = {},

			----------------------------------------
			--	--	EFFECTS

			--	-- effects that should be applied immediately when action is taken
			--	-- e.g. own_units bonuses, enemy units bonuses, enemy settlement bonuses (e.g. reduced siege)
			--	instant_effect_bundle = "phar_main_court_vizier_faction_bundle",
			-- -- optional, these bundles will be applied to the reinforcing army when it spawns
			--	reinforcement_army_bundle_list = {"phar_main_court_vizier_faction_bundle", }

			--	-- optional, decreasing the resource cost for the next action, in %
			--	next_action_discount = 50,

			--	-- optional, if it exists the action will immediately spawn a rebellion with this many units
			--	rebellion_units_spawned = 3,

			--	-- optional, if it exists the action will immediately damage this number of buildings in the settlement
			--	-- buildings are chosen at random and dealt building_damage each
			--	settlement_buildings_damaged = 2,
			
			--	-- optional, locks the action for regions without one of these types of ERS building
			--	-- will deal building_damage damage
			--	ers_type_damage = {"outpost", },
			--	-- optional, allows damaging of more ERS buildings, if they are available. 1 by default
			--	ers_buildings_damaged = 1,
	
			--	-- optional, the damage dealt to the buildings, measured in %, 
			--	-- default_building_damage used if not specified in the action
			--	building_damage = 50,

			--	-- optional, if it exists the action will immediately damage the garrison
			--	-- measured in %
			--	garrison_damage = 30,

			--	-- optional, will reveal a portion of the garrison, rounded up, 1 here means reveal the entire garrison
			--	reveal_garrison_proportion = 0.5,

			--	-- optional, will reveal several garrison units
			--	reveal_garrison_units = 3,

			--	-- optional, will grant visibility to the entire region
			--	grants_visibility = true,
		--},

		-- when used in the game they come in an action_wrapper with the following structure:
		--{
			--	action_obj, -- the table with the action config
			--	action_type, -- either 'sabotage', 'support' or 'balanced', depending on where it was obtained from
			--	randomizer, -- element from sabotage_support_randomizers or balanced_randomizers modifying the values of the bespoke resources provided (Native Support or Sabotage)
		--},

		base_sabotage_support_values = 
		{
			-- sabotage and support actions provide only their respective resources (though by a randomizer they can decrease the other value)
			sabotage_support_base_value = 50,
			-- balanced actions provide both (though a randomizer may cause them to provide one more than the other)
			balanced_base_value = 25,
		},

		-- randomizers are attached to an action to change the base values and have the following structure
		--{
		--	primary_resource_deviation, --(Native Support or Sabotage from their respective actions)
		--	secondary_resource_change, -- optional parameter, which changes the value of the opposite resource relative to the base value of the action
		--},
		sabotage_support_randomizers = 
		{
			{
				primary_resource_deviation = -0.4,
			},
			{
				primary_resource_deviation = -0.3,
			},
			{
				primary_resource_deviation = -0.2,
			},
			{
				primary_resource_deviation = -0.1,
			},
			{
				primary_resource_deviation = 0,
			},
			{
				primary_resource_deviation = 0.2,
			},
			{
				primary_resource_deviation = 0.3,
			},
			{
				primary_resource_deviation = 0.4,
			},
			{
				primary_resource_deviation = 0.6,
				secondary_resource_multiplier = -0.2,
			},
			{
				primary_resource_deviation = 0.8,
				secondary_resource_multiplier = -0.4,
			},
		},

		-- balanced randomizers don't have a primary resource, so they have sabotage_resource_deviation and support_resource_deviation
		balanced_randomizers = 
		{
			{
				sabotage_resource_deviation = -0.4,
				support_resource_deviation = -0.4,
			},
			{
				sabotage_resource_deviation = -0.4,
				support_resource_deviation = 0,
			},
			{
				sabotage_resource_deviation = 0,
				support_resource_deviation = -0.4,
			},
			{
				sabotage_resource_deviation = 0.4,
				support_resource_deviation = 0.0,
			},
			{
				sabotage_resource_deviation = 0.0,
				support_resource_deviation = 0.4,
			},
			{
				sabotage_resource_deviation = 0.4,
				support_resource_deviation = 0.4,
			},
		},

		-- sabotage actions are used to weaken the city with direct debuffing effects, use flavour of clandestine action against the city, such as arson, assassinations, coercion of the guards and such;
		-- identified with red in the UI
		sabotage_actions = 
		{
			actions_type = "sabotage",
			--sab_inf_city_send_in_deserter
			{
				action_key = "sab_inf_city_send_in_deserter",
				chance_weight = 1,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_inf_city_send_in_deserter_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_inf_city_send_in_deserter_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sab_inf_city_send_in_deserter.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_inf_city_send_in_deserter_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_inf_city_send_in_deserter",
				display_enemy_city_notification = true,
				incompatible_actions = {
					"sab_inf_city_send_in_deserter_2"
				},
			},

			--sab_inf_city_send_in_deserter_2
			{
				action_key = "sab_inf_city_send_in_deserter_2",
				chance_weight = 1,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_inf_city_send_in_deserter_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_inf_city_send_in_deserter_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sab_inf_city_send_in_deserter.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_inf_city_send_in_deserter_cost_2",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},				
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_inf_city_send_in_deserter_2",
				display_enemy_city_notification = true,
				incompatible_actions = {
					"sab_inf_city_send_in_deserter"
				},
			},

			--sab_inf_city_find_route_night
			{
				action_key = "sab_inf_city_find_route_night",
				chance_weight = 1,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_inf_city_find_route_night_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_inf_city_find_route_night_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sab_inf_city_find_route_night.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_inf_city_find_route_night_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_inf_city_find_route_night",
				display_enemy_city_notification = true,
				grants_visibility = true,
				incompatible_actions = {
					"sab_inf_city_find_route_night_2",
					"sab_inf_city_find_route_night_3"
				},
			},

			--sab_inf_city_find_route_night_2
			{
				action_key = "sab_inf_city_find_route_night_2",
				chance_weight = 1,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_inf_city_find_route_night_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_inf_city_find_route_night_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sab_inf_city_find_route_night.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_inf_city_find_route_night_cost_2",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_inf_city_find_route_night_2",
				display_enemy_city_notification = true,
				grants_visibility = true,
				incompatible_actions = {
					"sab_inf_city_find_route_night",
					"sab_inf_city_find_route_night_3"
				},
			},

			--sab_inf_city_find_route_night_3
			{
				action_key = "sab_inf_city_find_route_night_3",
				chance_weight = 1,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_inf_city_find_route_night_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_inf_city_find_route_night_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sab_inf_city_find_route_night.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_inf_city_find_route_night_cost_3",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_inf_city_find_route_night_3",
				display_enemy_city_notification = true,
				grants_visibility = true,
				incompatible_actions = {
					"sab_inf_city_find_route_night",
					"sab_inf_city_find_route_night_2"
				},
			},

			--hide_in_merchant_caravan
			--[[
			{
				action_key = "sab_inf_city_hide_caravan",
				chance_weight = 1,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_inf_city_hide_caravan_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_inf_city_hide_caravan_desc",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_inf_city_hide_caravan_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_inf_city_hide_caravan",
			},
			]]
			
			--sab_raid_out_raid_caravan
			{
				action_key = "sab_raid_out_raid_caravan",
				chance_weight = 1,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_raid_out_raid_caravan_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_raid_out_raid_caravan_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sab_raid_out_raid_caravan.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_raid_out_raid_caravan_cost",
				-- We need a separate entry for the resource gain, due to CUSTOM_RESOURCE_COST_SCRIPT_INTERFACE interface design and the way resource cost is already handled here
				resource_gains_record = "phar_main_al_thutmose_sab_raid_out_raid_caravan_gain",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_raid_out_raid_caravan",
				display_enemy_city_notification = true,
				grants_visibility = true,
				incompatible_actions = {
					"sab_raid_out_raid_caravan_2"
				},
			},

			--sab_raid_out_raid_caravan_2
			{
				action_key = "sab_raid_out_raid_caravan_2",
				chance_weight = 0.5,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_raid_out_raid_caravan_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_raid_out_raid_caravan_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sab_raid_out_raid_caravan.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_raid_out_raid_caravan_cost_2",
				-- We need a separate entry for the resource gain, due to CUSTOM_RESOURCE_COST_SCRIPT_INTERFACE interface design and the way resource cost is already handled here
				resource_gains_record = "phar_main_al_thutmose_sab_raid_out_raid_caravan_gain_2",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_raid_out_raid_caravan_2",
				display_enemy_city_notification = true,
				grants_visibility = true,
				incompatible_actions = {
					"sab_raid_out_raid_caravan"
				},
			},

			--sab_raid_out_attack_water
			{
				action_key = "sab_raid_out_attack_water",
				chance_weight = 1,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_raid_out_attack_water_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_raid_out_attack_water_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sab_raid_out_attack_water.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_raid_out_attack_water_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_raid_out_attack_water",
				display_enemy_city_notification = true,
				incompatible_actions = {
					"sab_raid_out_attack_water_2"
				},
			},

			--sab_raid_out_attack_water_2
			{
				action_key = "sab_raid_out_attack_water_2",
				chance_weight = 0.5,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_raid_out_attack_water_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_raid_out_attack_water_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sab_raid_out_attack_water.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_raid_out_attack_water_cost_2",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_raid_out_attack_water_2",
				display_enemy_city_notification = true,
				incompatible_actions = {
					"sab_raid_out_attack_water"
				},
			},

			--sab_raid_out_harass_patrol
			{
				action_key = "sab_raid_out_harass_patrol",
				chance_weight = 1,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_raid_out_harass_patrol_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_raid_out_harass_patrol_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sab_raid_out_harass_patrol.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_raid_out_harass_patrol_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_raid_out_harass_patrol",
				display_enemy_city_notification = true,
				incompatible_actions = {
					"sab_raid_out_harass_patrol_2",
					"sab_raid_out_harass_patrol_3"
				},
			},

			--sab_raid_out_harass_patrol_2
			{
				action_key = "sab_raid_out_harass_patrol_2",
				chance_weight = 1,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_raid_out_harass_patrol_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_raid_out_harass_patrol_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sab_raid_out_harass_patrol.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_raid_out_harass_patrol_cost_2",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_raid_out_harass_patrol_2",
				display_enemy_city_notification = true,
				incompatible_actions = {
					"sab_raid_out_harass_patrol",
					"sab_raid_out_harass_patrol_3"
				},
			},

			--sab_raid_out_harass_patrol_3
			{
				action_key = "sab_raid_out_harass_patrol_3",
				chance_weight = 1,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_raid_out_harass_patrol_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_raid_out_harass_patrol_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sab_raid_out_harass_patrol.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_raid_out_harass_patrol_cost_3",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_raid_out_harass_patrol_3",
				display_enemy_city_notification = true,
				incompatible_actions = {
					"sab_raid_out_harass_patrol",
					"sab_raid_out_harass_patrol_2"
				},
			},

			--sab_garrison_arson
			{
				action_key = "sab_garrison_arson",
				chance_weight = 1,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_garrison_arson_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_garrison_arson_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sab_garrison_arson.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_garrison_arson_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_garrison_arson",
				display_enemy_city_notification = true,
				requires_actions = {"sab_inf_city_send_in_deserter", "sab_inf_city_send_in_deserter_2", "sab_inf_city_find_route_night", "sab_inf_city_find_route_night_2", "sab_inf_city_find_route_night_3", "bal_inf_city_send_in_emissary"},
				settlement_buildings_damaged = 2,
				building_damage = 80,
				incompatible_actions = {
					"sab_garrison_arson_2",
				},
			},

			--sab_garrison_arson_2
			{
				action_key = "sab_garrison_arson_2",
				chance_weight = 0.5,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_garrison_arson_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_garrison_arson_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sab_garrison_arson.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_garrison_arson_cost_2",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_garrison_arson_2",
				display_enemy_city_notification = true,
				requires_actions = {"sab_inf_city_send_in_deserter", "sab_inf_city_send_in_deserter_2", "sab_inf_city_find_route_night", "sab_inf_city_find_route_night_2", "sab_inf_city_find_route_night_3", "bal_inf_city_send_in_emissary"},
				settlement_buildings_damaged = 4,
				building_damage = 80,
				incompatible_actions = {
					"sab_garrison_arson",
				},
			},

			--sab_garrison_assassinate_captain
			{
				action_key = "sab_garrison_assassinate_captain",
				chance_weight = 1,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_garrison_assassinate_captain_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_garrison_assassinate_captain_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sab_garrison_assassinate_captain.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_garrison_assassinate_captain_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_garrison_assassinate_captain",
				display_enemy_city_notification = true,
				requires_actions = {"sab_inf_city_send_in_deserter", "sab_inf_city_send_in_deserter_2", "sab_inf_city_find_route_night", "sab_inf_city_find_route_night_2", "sab_inf_city_find_route_night_3", "bal_inf_city_send_in_emissary"},
			},
			--[[
			--sab_garrison_attack_stray
			{
				action_key = "sab_garrison_attack_stray",
				chance_weight = 1,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_garrison_attack_stray_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_garrison_attack_stray_desc",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_garrison_attack_stray_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_garrison_attack_stray",
				requires_actions = {"sab_inf_city_send_in_deserter", "sab_inf_city_send_in_deserter_2", "sab_inf_city_find_route_night", "sab_inf_city_find_route_night_2", "sab_inf_city_find_route_night_3", "sab_inf_city_hide_caravan", "bal_inf_city_send_in_emissary"},
			},
			]]

			--sab_garrison_burn_ammo
			{
				action_key = "sab_garrison_burn_ammo",
				chance_weight = 1.5,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_garrison_burn_ammo_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_garrison_burn_ammo_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sab_garrison_burn_ammo.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_garrison_burn_ammo_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_garrison_burn_ammo",
				display_enemy_city_notification = true,
				requires_actions = {"sab_inf_city_send_in_deserter", "sab_inf_city_send_in_deserter_2", "sab_inf_city_find_route_night", "sab_inf_city_find_route_night_2", "sab_inf_city_find_route_night_3", "bal_inf_city_send_in_emissary"},
				settlement_buildings_damaged = 1,
				building_damage = 80,
				incompatible_actions = {
					"sab_garrison_burn_ammo_2",
				},
			},

			--sab_garrison_burn_ammo_2
			{
				action_key = "sab_garrison_burn_ammo_2",
				chance_weight = 1,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_garrison_burn_ammo_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_garrison_burn_ammo_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sab_garrison_burn_ammo.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_garrison_burn_ammo_cost_2",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_garrison_burn_ammo_2",
				display_enemy_city_notification = true,
				requires_actions = {"sab_inf_city_send_in_deserter", "sab_inf_city_send_in_deserter_2", "sab_inf_city_find_route_night", "sab_inf_city_find_route_night_2", "sab_inf_city_find_route_night_3", "bal_inf_city_send_in_emissary"},
				settlement_buildings_damaged = 2,
				building_damage = 80,
				incompatible_actions = {
					"sab_garrison_burn_ammo",
				},
			},

			--sab_garrison_damage_armour
			{
				action_key = "sab_garrison_damage_armour",
				chance_weight = 1.5,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_garrison_damage_armour_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_garrison_damage_armour_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sab_garrison_damage_armour.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_garrison_damage_armour_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_garrison_damage_armour",
				display_enemy_city_notification = true,
				requires_actions = {"sab_inf_city_send_in_deserter", "sab_inf_city_send_in_deserter_2", "sab_inf_city_find_route_night", "sab_inf_city_find_route_night_2", "sab_inf_city_find_route_night_3", "bal_inf_city_send_in_emissary"},
				settlement_buildings_damaged = 1,
				building_damage = 80,
				incompatible_actions = {
					"sab_garrison_damage_armour_2",
				},
			},

			--sab_garrison_damage_armour_2
			{
				action_key = "sab_garrison_damage_armour_2",
				chance_weight = 1,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_garrison_damage_armour_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_garrison_damage_armour_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sab_garrison_damage_armour.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_garrison_damage_armour_cost_2",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_garrison_damage_armour_2",
				display_enemy_city_notification = true,
				requires_actions = {"sab_inf_city_send_in_deserter", "sab_inf_city_send_in_deserter_2", "sab_inf_city_find_route_night", "sab_inf_city_find_route_night_2", "sab_inf_city_find_route_night_3", "bal_inf_city_send_in_emissary"},
				settlement_buildings_damaged = 2,
				building_damage = 80,
				incompatible_actions = {
					"sab_garrison_damage_armour",
				},
			},

			--sab_garrison_damage_weapons
			{
				action_key = "sab_garrison_damage_weapons",
				chance_weight = 1.5,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_garrison_damage_weapons_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_garrison_damage_weapons_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sab_garrison_damage_weapons.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_garrison_damage_weapons_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_garrison_damage_weapons",
				display_enemy_city_notification = true,
				requires_actions = {"sab_inf_city_send_in_deserter", "sab_inf_city_send_in_deserter_2", "sab_inf_city_find_route_night", "sab_inf_city_find_route_night_2", "sab_inf_city_find_route_night_3", "bal_inf_city_send_in_emissary"},
				settlement_buildings_damaged = 1,
				building_damage = 80,
				incompatible_actions = {
					"sab_garrison_damage_weapons_2",
				},
			},

			--sab_garrison_damage_weapons_2
			{
				action_key = "sab_garrison_damage_weapons_2",
				chance_weight = 1,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_garrison_damage_weapons_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_garrison_damage_weapons_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sab_garrison_damage_weapons.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_garrison_damage_weapons_cost_2",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_garrison_damage_weapons_2",
				display_enemy_city_notification = true,
				requires_actions = {"sab_inf_city_send_in_deserter", "sab_inf_city_send_in_deserter_2", "sab_inf_city_find_route_night", "sab_inf_city_find_route_night_2", "sab_inf_city_find_route_night_3", "bal_inf_city_send_in_emissary"},
				settlement_buildings_damaged = 2,
				building_damage = 80,
				incompatible_actions = {
					"sab_garrison_damage_weapons",
				},
			},

			--sab_garrison_poison_rations
			{
				action_key = "sab_garrison_poison_rations",
				chance_weight = 2,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_garrison_poison_rations_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_garrison_poison_rations_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sab_garrison_poison_rations.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_garrison_poison_rations_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_garrison_poison_rations",
				display_enemy_city_notification = true,
				requires_actions = {"sab_inf_city_send_in_deserter", "sab_inf_city_send_in_deserter_2", "sab_inf_city_find_route_night", "sab_inf_city_find_route_night_2", "sab_inf_city_find_route_night_3", "bal_inf_city_send_in_emissary"},
				garrison_damage = 20,
			},

			--sab_impr_raid_deploy_ambush
			{
				action_key = "sab_impr_raid_deploy_ambush",
				chance_weight = 1.5,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_impr_raid_deploy_ambush_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_impr_raid_deploy_ambush_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sab_impr_raid_deploy_ambush.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_impr_raid_deploy_ambush_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_impr_raid_deploy_ambush",
				display_enemy_city_notification = true,
				requires_actions = {"sab_raid_out_raid_caravan", "sab_raid_out_raid_caravan_2", "sab_raid_out_attack_water", "sab_raid_out_attack_water_2", "sab_raid_out_harass_patrol", "sab_raid_out_harass_patrol_2", "sab_raid_out_harass_patrol_3"},
			},

			--sab_impr_raid_sack_monument
			{
				action_key = "sab_impr_raid_sack_monument",
				chance_weight = 2,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_impr_raid_sack_monument_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_impr_raid_sack_monument_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sab_impr_raid_sack_outpost.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_impr_raid_sack_monument_cost",
				-- We need a separate entry for the resource gain, due to CUSTOM_RESOURCE_COST_SCRIPT_INTERFACE interface design and the way resource cost is already handled here
				resource_gains_record = "phar_main_al_thutmose_sab_impr_raid_sack_monument_gain",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_impr_raid_sack_monument",
				display_enemy_city_notification = true,
				requires_actions = {"sab_raid_out_raid_caravan", "sab_raid_out_raid_caravan_2", "sab_raid_out_attack_water", "sab_raid_out_attack_water_2", "sab_raid_out_harass_patrol", "sab_raid_out_harass_patrol_2", "sab_raid_out_harass_patrol_3"},
				ers_type_damage = {"phar_main_ers_monument", },
				building_damage = 80,
			},

			--sab_impr_raid_sack_outpost
			{
				action_key = "sab_impr_raid_sack_outpost",
				chance_weight = 2,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_impr_raid_sack_outpost_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_impr_raid_sack_outpost_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sab_impr_raid_sack_outpost.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_impr_raid_sack_outpost_cost",
				-- We need a separate entry for the resource gain, due to CUSTOM_RESOURCE_COST_SCRIPT_INTERFACE interface design and the way resource cost is already handled here
				resource_gains_record = "phar_main_al_thutmose_sab_impr_raid_sack_outpost_gain",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_impr_raid_sack_outpost",
				display_enemy_city_notification = true,
				requires_actions = {"sab_raid_out_raid_caravan", "sab_raid_out_raid_caravan_2", "sab_raid_out_attack_water", "sab_raid_out_attack_water_2", "sab_raid_out_harass_patrol", "sab_raid_out_harass_patrol_2", "sab_raid_out_harass_patrol_3"},
				ers_type_damage = {"phar_main_ers_outpost", },
				building_damage = 80,
			},

			--sab_impr_raid_sack_shrine
			{
				action_key = "sab_impr_raid_sack_shrine",
				chance_weight = 2,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_impr_raid_sack_shrine_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_impr_raid_sack_shrine_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sab_impr_raid_sack_outpost.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_impr_raid_sack_shrine_cost",
				-- We need a separate entry for the resource gain, due to CUSTOM_RESOURCE_COST_SCRIPT_INTERFACE interface design and the way resource cost is already handled here
				resource_gains_record = "phar_main_al_thutmose_sab_impr_raid_sack_shrine_gain",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_impr_raid_sack_shrine",
				display_enemy_city_notification = true,
				requires_actions = {"sab_raid_out_raid_caravan", "sab_raid_out_raid_caravan_2", "sab_raid_out_attack_water", "sab_raid_out_attack_water_2", "sab_raid_out_harass_patrol", "sab_raid_out_harass_patrol_2", "sab_raid_out_harass_patrol_3"},
				ers_type_damage = {"phar_main_ers_shrine", },
				building_damage = 80,
			},

			--sab_impr_raid_sack_staging_ground
			{
				action_key = "sab_impr_raid_sack_staging_ground",
				chance_weight = 2,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_impr_raid_sack_staging_ground_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_impr_raid_sack_staging_ground_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sab_impr_raid_sack_outpost.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_impr_raid_sack_staging_ground_cost",
				-- We need a separate entry for the resource gain, due to CUSTOM_RESOURCE_COST_SCRIPT_INTERFACE interface design and the way resource cost is already handled here
				resource_gains_record = "phar_main_al_thutmose_sab_impr_raid_sack_staging_ground_gain",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_impr_raid_sack_staging_ground",
				display_enemy_city_notification = true,
				requires_actions = {"sab_raid_out_raid_caravan", "sab_raid_out_raid_caravan_2", "sab_raid_out_attack_water", "sab_raid_out_attack_water_2", "sab_raid_out_harass_patrol", "sab_raid_out_harass_patrol_2", "sab_raid_out_harass_patrol_3"},
				ers_type_damage = {"phar_main_ers_staging_ground", },
				ers_buildings_damaged = 1,
				building_damage = 80,
			},

			--sab_impr_raid_sack_trading_post
			{
				action_key = "sab_impr_raid_sack_trading_post",
				chance_weight = 2,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_impr_raid_sack_trading_post_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_impr_raid_sack_trading_post_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sab_impr_raid_sack_outpost.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_impr_raid_sack_trading_post_cost",
				-- We need a separate entry for the resource gain, due to CUSTOM_RESOURCE_COST_SCRIPT_INTERFACE interface design and the way resource cost is already handled here
				resource_gains_record = "phar_main_al_thutmose_sab_impr_raid_sack_trading_post_gain",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_impr_raid_sack_trading_post",
				display_enemy_city_notification = true,
				requires_actions = {"sab_raid_out_raid_caravan", "sab_raid_out_raid_caravan_2", "sab_raid_out_attack_water", "sab_raid_out_attack_water_2", "sab_raid_out_harass_patrol", "sab_raid_out_harass_patrol_2", "sab_raid_out_harass_patrol_3"},
				ers_type_damage = {"phar_main_ers_trading_post", },
				building_damage = 80,
			},

			--sab_impr_raid_sack_waystation
			{
				action_key = "sab_impr_raid_sack_waystation",
				chance_weight = 2,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_impr_raid_sack_waystation_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_impr_raid_sack_waystation_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sab_impr_raid_sack_outpost.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_impr_raid_sack_waystation_cost",
				-- We need a separate entry for the resource gain, due to CUSTOM_RESOURCE_COST_SCRIPT_INTERFACE interface design and the way resource cost is already handled here
				resource_gains_record = "phar_main_al_thutmose_sab_impr_raid_sack_waystation_gain",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_impr_raid_sack_waystation",
				display_enemy_city_notification = true,
				requires_actions = {"sab_raid_out_raid_caravan", "sab_raid_out_raid_caravan_2", "sab_raid_out_attack_water", "sab_raid_out_attack_water_2", "sab_raid_out_harass_patrol", "sab_raid_out_harass_patrol_2", "sab_raid_out_harass_patrol_3"},
				ers_type_damage = {"phar_main_ers_waystation", },
				building_damage = 80,
			},

			--sab_impr_raid_scare_tactics
			{
				action_key = "sab_impr_raid_scare_tactics",
				chance_weight = 1.5,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_impr_raid_scare_tactics_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_impr_raid_scare_tactics_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sab_impr_raid_scare_tactics.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_impr_raid_scare_tactics_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_impr_raid_scare_tactics",
				display_enemy_city_notification = true,
				requires_actions = {"sab_raid_out_raid_caravan", "sab_raid_out_raid_caravan_2", "sab_raid_out_attack_water", "sab_raid_out_attack_water_2", "sab_raid_out_harass_patrol", "sab_raid_out_harass_patrol_2", "sab_raid_out_harass_patrol_3"},
				incompatible_actions = {
					"sab_impr_raid_scare_tactics_2",
					"sab_impr_raid_scare_tactics_3",
				},
			},

			--sab_impr_raid_scare_tactics_2
			{
				action_key = "sab_impr_raid_scare_tactics_2",
				chance_weight = 1,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_impr_raid_scare_tactics_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_impr_raid_scare_tactics_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sab_impr_raid_scare_tactics.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_impr_raid_scare_tactics_cost_2",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_impr_raid_scare_tactics_2",
				display_enemy_city_notification = true,
				requires_actions = {"sab_raid_out_raid_caravan", "sab_raid_out_raid_caravan_2", "sab_raid_out_attack_water", "sab_raid_out_attack_water_2", "sab_raid_out_harass_patrol", "sab_raid_out_harass_patrol_2", "sab_raid_out_harass_patrol_3"},
				incompatible_actions = {
					"sab_impr_raid_scare_tactics",
					"sab_impr_raid_scare_tactics_3",
				},
			},

			--sab_impr_raid_scare_tactics_3
			{
				action_key = "sab_impr_raid_scare_tactics_3",
				chance_weight = 1,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_impr_raid_scare_tactics_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sab_impr_raid_scare_tactics_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sab_impr_raid_scare_tactics.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sab_impr_raid_scare_tactics_cost_3",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sab_impr_raid_scare_tactics_3",
				display_enemy_city_notification = true,
				requires_actions = {"sab_raid_out_raid_caravan", "sab_raid_out_raid_caravan_2", "sab_raid_out_attack_water", "sab_raid_out_attack_water_2", "sab_raid_out_harass_patrol", "sab_raid_out_harass_patrol_2", "sab_raid_out_harass_patrol_3"},
				incompatible_actions = {
					"sab_impr_raid_scare_tactics",
					"sab_impr_raid_scare_tactics_2",
				},
			},
		},

		-- support actions are used to buff the player and prepare a reinforcing army
		-- identified with blue in the UI
		support_actions = 
		{
			--sup_meet_local_follow_patrols
			{
				action_key = "sup_meet_local_follow_patrols",
				chance_weight = 1,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_meet_local_follow_patrols_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_meet_local_follow_patrols_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sup_meet_local_follow_patrols.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sup_meet_local_follow_patrols_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sup_meet_local_follow_patrols",
				reinforcement_army_bundle_list = { "phar_main_effect_bundle_al_thutmose_sup_meet_local_follow_patrols_army" },
				grants_visibility = true,
				incompatible_actions = {
					"sup_meet_local_follow_patrols_2",
				}
			},

			--sup_meet_local_follow_patrols_2
			{
				action_key = "sup_meet_local_follow_patrols_2",
				chance_weight = 0.5,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_meet_local_follow_patrols_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_meet_local_follow_patrols_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sup_meet_local_follow_patrols.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sup_meet_local_follow_patrols_cost_2",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sup_meet_local_follow_patrols_2",
				reinforcement_army_bundle_list = { "phar_main_effect_bundle_al_thutmose_sup_meet_local_follow_patrols_army_2" },
				grants_visibility = true,
				incompatible_actions = {
					"sup_meet_local_follow_patrols",
				},
			},

			--sup_meet_local_gift_warlord
			{
				action_key = "sup_meet_local_gift_warlord",
				chance_weight = 2,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_meet_local_gift_warlord_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_meet_local_gift_warlord_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sup_meet_local_gift_warlord.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sup_meet_local_gift_warlord_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sup_meet_local_gift_warlord",
				incompatible_actions = {
					"sup_meet_local_gift_warlord_2",
				},
			},

			--sup_meet_local_gift_warlord_2
			{
				action_key = "sup_meet_local_gift_warlord_2",
				chance_weight = 2,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_meet_local_gift_warlord_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_meet_local_gift_warlord_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sup_meet_local_gift_warlord.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sup_meet_local_gift_warlord_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sup_meet_local_gift_warlord",
				incompatible_actions = {
					"sup_meet_local_gift_warlord",
				},
			},

			--sup_meet_local_hire_champion
			{
				action_key = "sup_meet_local_hire_champion",
				chance_weight = 1,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_meet_local_hire_champion_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_meet_local_hire_champion_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sup_meet_local_hire_champion.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sup_meet_local_hire_champion_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sup_meet_local_hire_champion",
				incompatible_actions = {
					"sup_meet_local_hire_champion_2",
				},
			},

			--sup_meet_local_hire_champion_2
			{
				action_key = "sup_meet_local_hire_champion_2",
				chance_weight = 1,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_meet_local_hire_champion_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_meet_local_hire_champion_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sup_meet_local_hire_champion.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sup_meet_local_hire_champion_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sup_meet_local_hire_champion",
				incompatible_actions = {
					"sup_meet_local_hire_champion",
				},
			},

			--sup_meet_local_rouse_warriors
			{
				action_key = "sup_meet_local_rouse_warriors",
				chance_weight = 2,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_meet_local_rouse_warriors_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_meet_local_rouse_warriors_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sup_meet_local_rouse_warriors.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sup_meet_local_rouse_warriors_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sup_meet_local_rouse_warriors",
				reinforcement_army_bundle_list = { "phar_main_effect_bundle_al_thutmose_sup_meet_local_rouse_warriors_army" },
				requires_actions = {"sup_meet_local_follow_patrols", "sup_meet_local_follow_patrols_2", "sup_meet_local_gift_warlord", "sup_meet_local_gift_warlord_2", "sup_meet_local_hire_champion", "sup_meet_local_hire_champion_2", "sup_meet_local_summit_elders", "sup_meet_local_summit_elders_2"},
				incompatible_actions = {
					"sup_meet_local_rouse_warriors_2",
				},
			},

			--sup_meet_local_rouse_warriors_2
			{
				action_key = "sup_meet_local_rouse_warriors_2",
				chance_weight = 2,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_meet_local_rouse_warriors_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_meet_local_rouse_warriors_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sup_meet_local_rouse_warriors.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sup_meet_local_rouse_warriors_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sup_meet_local_rouse_warriors",
				reinforcement_army_bundle_list = { "phar_main_effect_bundle_al_thutmose_sup_meet_local_rouse_warriors_army" },
				requires_actions = {"sup_meet_local_follow_patrols", "sup_meet_local_follow_patrols_2", "sup_meet_local_gift_warlord", "sup_meet_local_gift_warlord_2", "sup_meet_local_hire_champion", "sup_meet_local_hire_champion_2", "sup_meet_local_summit_elders", "sup_meet_local_summit_elders_2"},
				incompatible_actions = {
					"sup_meet_local_rouse_warriors",
				},
			},

			--[[
			--sup_scout_out_establish_routes
			{
				action_key = "sup_scout_out_establish_routes",
				chance_weight = 1,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_scout_out_establish_routes_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_scout_out_establish_routes_desc",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sup_scout_out_establish_routes_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sup_scout_out_establish_routes",
				requires_actions = {"sup_meet_local_follow_patrols", "sup_meet_local_follow_patrols_2", "sup_meet_local_gift_warlord", "sup_meet_local_gift_warlord_2", "sup_meet_local_hire_champion", "sup_meet_local_hire_champion_2", "sup_meet_local_summit_elders", "sup_meet_local_summit_elders_2"},
			},
			]]

			--sup_meet_local_summit_elders
			{
				action_key = "sup_meet_local_summit_elders",
				chance_weight = 1,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_meet_local_summit_elders_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_meet_local_summit_elders_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sup_meet_local_summit_elders.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sup_meet_local_summit_elders_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sup_meet_local_summit_elders",
				reinforcement_army_bundle_list = { "phar_main_effect_bundle_al_thutmose_sup_meet_local_summit_elders_army" },
				next_action_discount = 50,
				incompatible_actions = {
					"sup_meet_local_summit_elders_2",
				},
			},

			--sup_meet_local_summit_elders_2
			{
				action_key = "sup_meet_local_summit_elders_2",
				chance_weight = 1,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_meet_local_summit_elders_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_meet_local_summit_elders_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sup_meet_local_summit_elders.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sup_meet_local_summit_elders_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sup_meet_local_summit_elders",
				reinforcement_army_bundle_list = { "phar_main_effect_bundle_al_thutmose_sup_meet_local_summit_elders_army" },
				next_action_discount = 50,
				incompatible_actions = {
					"sup_meet_local_summit_elders",
				},
			},

			--sup_befr_local_hire_warlord
			{
				action_key = "sup_befr_local_hire_warlord",
				chance_weight = 2,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_befr_local_hire_warlord_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_befr_local_hire_warlord_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sup_befr_local_hire_warlord.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sup_befr_local_hire_warlord_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sup_befr_local_hire_warlord",
				reinforcement_army_bundle_list = { "phar_main_effect_bundle_al_thutmose_sup_befr_local_hire_warlord_army" },
				requires_actions = {"sup_meet_local_follow_patrols", "sup_meet_local_follow_patrols_2", "sup_meet_local_gift_warlord", "sup_meet_local_gift_warlord_2", "sup_meet_local_hire_champion", "sup_meet_local_hire_champion_2", "sup_meet_local_summit_elders", "sup_meet_local_summit_elders_2"},
			},

			--sup_befr_local_local_healers
			{
				action_key = "sup_befr_local_local_healers",
				chance_weight = 2,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_befr_local_local_healers_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_befr_local_local_healers_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sup_befr_local_local_healers.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sup_befr_local_local_healers_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sup_befr_local_local_healers",
				reinforcement_army_bundle_list = { "phar_main_effect_bundle_al_thutmose_sup_befr_local_local_healers_army" },
				requires_actions = {"sup_meet_local_follow_patrols", "sup_meet_local_follow_patrols_2", "sup_meet_local_gift_warlord", "sup_meet_local_gift_warlord_2", "sup_meet_local_hire_champion", "sup_meet_local_hire_champion_2", "sup_meet_local_summit_elders", "sup_meet_local_summit_elders_2"},
			},
			--[[
			--sup_befr_local_local_priest
			{
				action_key = "sup_befr_local_local_priest",
				chance_weight = 1,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_befr_local_local_priest_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_befr_local_local_priest_desc",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sup_befr_local_local_priest_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sup_befr_local_local_priest",
				requires_actions = {"sup_meet_local_gift_warlord", "sup_meet_local_hire_champion", "sup_meet_local_rouse_warriors", "sup_meet_local_summit_elders"},
			},
			]]
			--sup_befr_local_train_natives
			{
				action_key = "sup_befr_local_train_natives",
				chance_weight = 1,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_befr_local_train_natives_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_befr_local_train_natives_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sup_befr_local_train_natives.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sup_befr_local_train_natives_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sup_befr_local_train_natives",
				reinforcement_army_bundle_list = { "phar_main_effect_bundle_al_thutmose_sup_befr_local_train_natives_army" },
				requires_actions = {"sup_meet_local_follow_patrols", "sup_meet_local_follow_patrols_2", "sup_meet_local_gift_warlord", "sup_meet_local_gift_warlord_2", "sup_meet_local_hire_champion", "sup_meet_local_hire_champion_2", "sup_meet_local_summit_elders", "sup_meet_local_summit_elders_2"},
				incompatible_actions = {
					"sup_befr_local_train_natives_2",
					"sup_befr_local_train_natives_3",
				},
			},

			--sup_befr_local_train_natives_2
			{
				action_key = "sup_befr_local_train_natives_2",
				chance_weight = 1,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_befr_local_train_natives_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_befr_local_train_natives_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sup_befr_local_train_natives.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sup_befr_local_train_natives_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sup_befr_local_train_natives_2",
				reinforcement_army_bundle_list = { "phar_main_effect_bundle_al_thutmose_sup_befr_local_train_natives_army_2" },
				requires_actions = {"sup_meet_local_follow_patrols", "sup_meet_local_follow_patrols_2", "sup_meet_local_gift_warlord", "sup_meet_local_gift_warlord_2", "sup_meet_local_hire_champion", "sup_meet_local_hire_champion_2", "sup_meet_local_summit_elders", "sup_meet_local_summit_elders_2"},
				incompatible_actions = {
					"sup_befr_local_train_natives",
					"sup_befr_local_train_natives_3"
				},
			},

			--sup_befr_local_train_natives_3
			{
				action_key = "sup_befr_local_train_natives_3",
				chance_weight = 1,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_befr_local_train_natives_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_sup_befr_local_train_natives_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_sup_befr_local_train_natives.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_sup_befr_local_train_natives_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sup_befr_local_train_natives_3",
				reinforcement_army_bundle_list = { "phar_main_effect_bundle_al_thutmose_sup_befr_local_train_natives_army_3" },
				requires_actions = {"sup_meet_local_follow_patrols", "sup_meet_local_follow_patrols_2", "sup_meet_local_gift_warlord", "sup_meet_local_gift_warlord_2", "sup_meet_local_hire_champion", "sup_meet_local_hire_champion_2", "sup_meet_local_summit_elders", "sup_meet_local_summit_elders_2"},
				incompatible_actions = {
					"sup_befr_local_train_natives",
					"sup_befr_local_train_natives_2"
				},
			},
		},

		-- balanced actions give effects from both sabotage and support actions
		-- identified with purple in the UI
		balanced_actions = 
		{
			actions_type = "balanced",
			--send_in_as_emissary
			{
				action_key = "bal_inf_city_send_in_emissary",
				chance_weight = 2,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_bal_inf_city_send_in_emissary_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_bal_inf_city_send_in_emissary_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_bal_inf_city_send_in_emissary.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_bal_inf_city_send_in_emissary_cost",
				-- We need a separate entry for the resource gain, due to CUSTOM_RESOURCE_COST_SCRIPT_INTERFACE interface design and the way resource cost is already handled here
				resource_gains_record = "phar_main_al_thutmose_bal_inf_city_send_in_emissary_gain",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_bal_inf_city_send_in_emissary",
				display_enemy_city_notification = true,
				grants_visibility = true,
			},

			--bal_inf_as_local_send_in_envoy
			{
				action_key = "bal_inf_as_local_send_in_envoy",
				chance_weight = 10,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_bal_inf_as_local_send_in_envoy_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_bal_inf_as_local_send_in_envoy_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_bal_inf_as_local_send_in_envoy.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_bal_inf_as_local_send_in_envoy_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_bal_inf_as_local_send_in_envoy",
				display_enemy_city_notification = true,
				requires_actions = {"sup_meet_local_gift_warlord", "sup_meet_local_gift_warlord_2"},
				next_action_discount = 50,
			},

			--bal_inf_as_local_send_in_merchant
			{
				action_key = "bal_inf_as_local_send_in_merchant",
				chance_weight = 2,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_bal_inf_as_local_send_in_merchant_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_bal_inf_as_local_send_in_merchant_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_bal_inf_as_local_send_in_merchant.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_bal_inf_as_local_send_in_merchant_cost",
				-- We need a separate entry for the resource gain, due to CUSTOM_RESOURCE_COST_SCRIPT_INTERFACE interface design and the way resource cost is already handled here
				resource_gains_record = "phar_main_al_thutmose_bal_inf_as_local_send_in_merchant_gain",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_bal_inf_as_local_send_in_merchant",
				display_enemy_city_notification = true,
				requires_actions = {"sup_meet_local_gift_warlord", "sup_meet_local_gift_warlord_2", "sup_meet_local_hire_champion", "sup_meet_local_hire_champion_2", "sup_meet_local_summit_elders", "sup_meet_local_summit_elders_2"},
				next_action_discount = 50,
			},
			--[[
			--bal_rebellion_charge_garrison
			{
				action_key = "bal_rebellion_charge_garrison",
				chance_weight = 1,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_bal_rebellion_charge_garrison_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_bal_rebellion_charge_garrison_desc",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_bal_rebellion_charge_garrison_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_bal_rebellion_charge_garrison",
				requires_actions = {"bal_inf_as_local_send_in_envoy", "bal_inf_as_local_send_in_merchant", "sab_inf_city_send_in_deserter", "sab_inf_city_find_route_night", "sab_inf_city_hide_caravan", "bal_inf_city_send_in_emissary"},
			},
			]]
			--bal_rebellion_encourage_deserters
			{
				action_key = "bal_rebellion_encourage_deserters",
				chance_weight = 5,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_bal_rebellion_encourage_deserters_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_bal_rebellion_encourage_deserters_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_bal_rebellion_encourage_deserters.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_bal_rebellion_encourage_deserters_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_bal_rebellion_encourage_deserters",
				display_enemy_city_notification = true,
				requires_actions = {"bal_inf_as_local_send_in_envoy", "bal_inf_as_local_send_in_merchant", "sab_garrison_arson", "sab_garrison_arson_2", "sab_garrison_assassinate_captain", "sab_garrison_burn_ammo", "sab_garrison_burn_ammo_2", "sab_garrison_damage_armour", "sab_garrison_damage_armour_2", "sab_garrison_damage_weapons", "sab_garrison_damage_weapons_2", "sab_garrison_poison_rations"},
				garrison_damage = 10,
			},

			--bal_rebellion_incite_uprising
			{
				action_key = "bal_rebellion_incite_uprising",
				chance_weight = 3,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_bal_rebellion_incite_uprising_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_bal_rebellion_incite_uprising_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_bal_rebellion_incite_uprising.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_bal_rebellion_incite_uprising_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_bal_rebellion_incite_uprising",
				display_enemy_city_notification = true,
				requires_actions = {"bal_inf_as_local_send_in_envoy", "bal_inf_as_local_send_in_merchant", "sab_garrison_arson", "sab_garrison_arson_2", "sab_garrison_assassinate_captain", "sab_garrison_burn_ammo", "sab_garrison_burn_ammo_2", "sab_garrison_damage_armour", "sab_garrison_damage_armour_2", "sab_garrison_damage_weapons", "sab_garrison_damage_weapons_2", "sab_garrison_poison_rations"},
				garrison_damage = 10,
			},

			--bal_rebellion_market_riot
			{
				action_key = "bal_rebellion_market_riot",
				chance_weight = 2,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_bal_rebellion_market_riot_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_bal_rebellion_market_riot_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_bal_rebellion_market_riot.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_bal_rebellion_market_riot_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_bal_rebellion_market_riot",
				display_enemy_city_notification = true,
				requires_actions = {"bal_inf_as_local_send_in_envoy", "bal_inf_as_local_send_in_merchant", "sab_garrison_arson", "sab_garrison_arson_2", "sab_garrison_assassinate_captain", "sab_garrison_burn_ammo", "sab_garrison_burn_ammo_2", "sab_garrison_damage_armour", "sab_garrison_damage_armour_2", "sab_garrison_damage_weapons", "sab_garrison_damage_weapons_2", "sab_garrison_poison_rations"},
				settlement_buildings_damaged = 3,
				building_damage = 80,
			},

			--bal_rebellion_study_guards
			{
				action_key = "bal_rebellion_study_guards",
				chance_weight = 3,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_bal_rebellion_study_guards_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_bal_rebellion_study_guards_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_bal_rebellion_study_guards.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_bal_rebellion_study_guards_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_bal_rebellion_study_guards",
				display_enemy_city_notification = true,
				requires_actions = {"bal_inf_as_local_send_in_envoy", "bal_inf_as_local_send_in_merchant", "sab_garrison_arson", "sab_garrison_arson_2", "sab_garrison_assassinate_captain", "sab_garrison_burn_ammo", "sab_garrison_burn_ammo_2", "sab_garrison_damage_armour", "sab_garrison_damage_armour_2", "sab_garrison_damage_weapons", "sab_garrison_damage_weapons_2", "sab_garrison_poison_rations"},
			},

			--bal_rec_garrison_bribe_archers
			{
				action_key = "bal_rec_garrison_bribe_archers",
				chance_weight = 5,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_bal_rec_garrison_bribe_archers_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_bal_rec_garrison_bribe_archers_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_bal_rec_garrison_bribe_archers.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_bal_rec_garrison_bribe_archers_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_bal_rec_garrison_bribe_archers",
				display_enemy_city_notification = true,
				requires_actions = {"bal_inf_as_local_send_in_envoy", "bal_inf_as_local_send_in_merchant", "sab_garrison_arson", "sab_garrison_arson_2", "sab_garrison_assassinate_captain", "sab_garrison_burn_ammo", "sab_garrison_burn_ammo_2", "sab_garrison_damage_armour", "sab_garrison_damage_armour_2", "sab_garrison_damage_weapons", "sab_garrison_damage_weapons_2", "sab_garrison_poison_rations"},
			},

			--bal_rec_garrison_bribe_infantry
			{
				action_key = "bal_rec_garrison_bribe_infantry",
				chance_weight = 5,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_bal_rec_garrison_bribe_infantry_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_bal_rec_garrison_bribe_infantry_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_bal_rec_garrison_bribe_infantry.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_bal_rec_garrison_bribe_infantry_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_bal_rec_garrison_bribe_infantry",
				display_enemy_city_notification = true,
				requires_actions = {"bal_inf_as_local_send_in_envoy", "bal_inf_as_local_send_in_merchant", "sab_garrison_arson", "sab_garrison_arson_2", "sab_garrison_assassinate_captain", "sab_garrison_burn_ammo", "sab_garrison_burn_ammo_2", "sab_garrison_damage_armour", "sab_garrison_damage_armour_2", "sab_garrison_damage_weapons", "sab_garrison_damage_weapons_2", "sab_garrison_poison_rations"},
			},

			--bal_impr_raid_stage_prophecy
			{
				action_key = "bal_befr_local_stage_prophecy",
				chance_weight = 2,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_bal_befr_local_stage_prophecy_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_bal_befr_local_stage_prophecy_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_bal_befr_local_stage_prophecy.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_bal_befr_local_stage_prophecy_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_bal_befr_local_stage_prophecy",
				display_enemy_city_notification = true,
				requires_actions = {"sup_meet_local_follow_patrols", "sup_meet_local_follow_patrols_2", "sup_meet_local_gift_warlord", "sup_meet_local_gift_warlord_2", "sup_meet_local_hire_champion", "sup_meet_local_hire_champion_2", "sup_meet_local_summit_elders", "sup_meet_local_summit_elders_2"},
			},

			--bal_befr_local_local_engineers
			{
				action_key = "bal_befr_local_local_engineers",
				chance_weight = 2,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_bal_befr_local_local_engineers_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_bal_befr_local_local_engineers_desc",
					icon_path = "ui\\skins\\default\\legacy_thutmose\\phar_main_al_thutmose_bal_befr_local_local_engineers.png",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_bal_befr_local_local_engineers_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_bal_befr_local_local_engineers",
				display_enemy_city_notification = true,
				requires_actions = {"sup_meet_local_follow_patrols", "sup_meet_local_follow_patrols_2", "sup_meet_local_gift_warlord", "sup_meet_local_gift_warlord_2", "sup_meet_local_hire_champion", "sup_meet_local_hire_champion_2", "sup_meet_local_summit_elders", "sup_meet_local_summit_elders_2"},
				settlement_buildings_damaged = 2,
				building_damage = 80,
			},
			--[[
			--bal_scout_out_map_out
			{
				action_key = "bal_scout_out_map_out",
				chance_weight = 1,
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_bal_scout_out_map_out_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_bal_scout_out_map_out_desc",
				},
				-- the main way costs are supposed to be used
				resource_costs_record = "phar_main_al_thutmose_bal_scout_out_map_out_cost",
				-- for testing, used only when resource_costs_record is not available
				test_cost = 
				{
					{"troy_gold", -350},
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_bal_scout_out_follow_patrols",
			},
			]]
		},

		-- culmination actions are a bit different from regular actions
		-- they don't have randomizers or wrappers, but keep their type inside
		culmination_actions = 
		{
			-- culmination_sabotage
			{
				action_key = "culmination_sabotage",
				action_type = "sabotage",
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_culm_sab_sally_out_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_culm_sab_sally_out_desc",
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_culm_sab_sally_out",
				allow_force_sally_out = true,
			},

			-- culmination_support
			{
				action_key = "culmination_support",
				action_type = "support",
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_culm_sup_local_army_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_culm_sup_local_army_desc",
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_culm_sup_local_army",
			},

			-- culmination_balanced
			{
				action_key = "culmination_balanced",
				action_type = "balanced",
				ui_data = 
				{
					name_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_culm_bal_force_surrender_title",
					description_localization_key = "ui_text_replacements_localised_text_phar_main_al_thutmose_culm_bal_force_surrender_desc",
				},
				instant_effect_bundle = "phar_main_effect_bundle_al_thutmose_sup_meet_local_summit_elders",
				allow_force_surrender = true,
			},
		},

		-- Used as a ceiling for culmination description strings concatenation. Every culmination type has a variety of descriptions, the all start with _1 suffix and contiguously go up to _10
		culmination_actions_description_suffixes_number = 10,

		-- both rewards types have resource_percent_needed

		-- these rewards give:
		-- resource_reward_record - flat sum given to the faction on taking over the settlement
		-- replenishment_rate - (in %?) 	- phar_main_replenishment_percentage_bonus_basic
		--	should be applied after region is taken, to region, for 1 turn
		sabotage_rewards = 
		{
			-- 20 reward
			{
				resource_percent_needed = 20,
				resource_reward_record = "phar_main_al_thutmose_sabotage_reward_1",
				replenishment_rate = 2,
			},
			-- 40 reward
			{
				resource_percent_needed = 40,
				resource_reward_record = "phar_main_al_thutmose_sabotage_reward_2",
				replenishment_rate = 4,
			},
			-- 60 reward
			{
				resource_percent_needed = 60,
				resource_reward_record = "phar_main_al_thutmose_sabotage_reward_3",
				replenishment_rate = 6,
			},
			-- 80 reward
			{
				resource_percent_needed = 80,
				resource_reward_record = "phar_main_al_thutmose_sabotage_reward_4",
				replenishment_rate = 8,
			},
			-- 100 reward
			{
				resource_percent_needed = 100,
				resource_reward_record = "phar_main_al_thutmose_sabotage_reward_5",
				replenishment_rate = 10,
			},
		},

		event_data_conquest_extra_resources = 
		{
			title = "ui_text_replacements_localised_text_phar_main_al_thutmose_sabotage_reward_message_title",
			primary_detail = "ui_text_replacements_localised_text_phar_main_al_thutmose_sabotage_reward_message_desc",
			secondary_detail = "event_feed_strings_text_phar_main_al_thutmose_event_feed_resource_reward_secondary_details",
			pic = 2135,
		},

		-- these rewards give:
		-- happiness - applied in the province after taking over
		-- they also give native units specified in native_support_unit_rewards
		-- the level of the reward matches the tier of the unit group in the config
		-- the units are given as special recruitment (mercenaries) after the battle
		native_support_rewards = 
		{
			-- 20 reward
			{
				resource_percent_needed = 20,
				happiness = 6,
			},
			-- 40 reward
			{
				resource_percent_needed = 40,
				happiness = 7,
			},
			-- 60 reward
			{
				resource_percent_needed = 60,
				happiness = 8,
			},
			-- 80 reward
			{
				resource_percent_needed = 80,
				happiness = 9,
			},
			-- 100 reward
			{
				resource_percent_needed = 100,
				happiness = 10,
			},
		},

		-- displayed on the city_info_bar to show it is a Thutmose target
		target_indication = 
		{
			component_name = "placeholder_thutmose_target",
			icon_path = "UI/skins/default/settlement_id/phar_main_icon_thutmose_target.png",
			tooltip_key = "phar_main_al_thutmose_target_tooltip",-- this is in the campaign_localized_strings table
		},
	},

	-- non-persistent data that can be recalculated and doesn't need to be saved, but is cleared when panel is closed
	data = 
	{
		-- sabotage_gained
		-- native_support_gained
		-- reinforcing_army - units that can be used as reinforcements: by key and amount
		-- used_up_army - units that were already used as reinforcements: by key and amount
		-- units_from_actions_num - number of units provided by actions only - used to restrict other actions
		-- units_from_support_culmination_num - number of units provided by the support culmination. stored even if the culmination is not reached, or another culmination is chosen!
	},

	-- this is not saved, but not cleared when panel is closed
	semi_persistent_data =
	{
		interacted_target = nil, -- the key for the region the player clicked on, but hasn't confirmed yet
		preliminary_target = nil, -- the key for the region the player selected, but hasn't paid to start using actions yet
		conquered_target = nil, -- the key for the region player already conquered
	},

	persistent = 
	{
		active_faction = nil, -- the key of the faction with this legacy

		--------------------------------------
		-- data for the current target
		current_target = nil, 				-- the key of the region selected as target, if any
		-- these will need to hold action key for the save, in case the actions change
		taken_action_wrappers = {}, 	-- list of action wrappers already taken
		reached_culmination_key = nil, 		-- culminations are different from normal actions, e.g. they don't have randomizers
		reached_culmination_suffix_index = nil, -- required to select a flavor text, saving it to keep strings consistent inbetween saves
		pending_actions = nil, 				-- the 3 valid actions if we have an unlocked action slot
		revealed_garrison_proportion = nil,	-- proportion of the garrison that is visible to the faction, 1 or more means the entire garrison is visible
		revealed_garrison_units = nil, 		-- the number of units revealed, added to the proportion
		next_action_discount = nil,			-- discount for the next action, in %
		visibility_granted = nil,				-- gives the faction visibility over the target region
		-- end of data for the current target
		-------------------

		taken_cities = {} -- list with all the cities taken this way, and actions used for that
	},

	-- handling model-changing events, potentially from remote machines
	--{
		on_target_chosen = function(self, params)
			if not self:can_faction_choose_target() then
				return
			end

			local faction_key = params[1]
			local region_key = params[2]
			local region = cm:get_region(region_key)
			if not region then
				output("Error: invalid region targeted: " .. region_key)
				return
			end

			if region:owning_faction():name() == self.persistent.active_faction then
				output("Error: Thutmose can't target a region they own!")
				return
			end

			local target_cost_obj = self:get_choose_target_cost_obj()
			local faction_obj = cm:get_faction(faction_key)
			cm:faction_apply_resource_transaction(faction_obj, target_cost_obj)

			self.persistent.current_target = region_key
			self:generate_pending_actions()
			cm:make_region_seen_in_shroud(self.persistent.active_faction, self.persistent.current_target)

			local local_faction_name = cm:get_local_faction_name(true)
			if faction_key == local_faction_name then
				self:add_target_settlement_icon()
			end
			self:send_target_set_event()

			-- Cleaning up previous history, we no longer need it
			for index, taken_city in ipairs(self.persistent.taken_cities) do
				if taken_city.target_key == region_key then
					table.remove(self.persistent.taken_cities, index)
					break
				end
			end
		end,

		on_target_abandoned = function(self, params)
			local faction_key = params[1]
			self.semi_persistent_data.conquered_target = nil
			self:clear_progress()
		end,

		on_action_taken = function(self, params)
			local faction_key = params[1]
			local action_index_str = params[2]
			local action_index = tonumber(action_index_str)
			
			local actions_taken_this_turn = self.persistent.actions_this_turn
			if not actions_taken_this_turn then
				actions_taken_this_turn = 0
			end

			local action_wrapper = self.persistent.pending_actions[action_index]
			if not self:pay_for_action(faction_key, action_wrapper.action_obj) then
				output("Error: faction '" .. faction_key .. "' can not afford action '" .. action_wrapper.action_obj.action_key .. "'")
				return
			else
				self:gain_for_action(faction_key, action_wrapper.action_obj)
			end

			if actions_taken_this_turn >= self.config.actions_per_turn then
				output("Error: faction '" .. faction_key .. "' already took '" .. actions_taken_this_turn .. "' actions this turn")
				return
			end

			table.insert(self.persistent.taken_action_wrappers, action_wrapper)
			self.persistent.actions_this_turn = actions_taken_this_turn + 1

			self:apply_action_effects(action_wrapper.action_obj, action_wrapper.action_type, action_wrapper.randomizer)
			-- these are calculated at the end of the event, but we need the resources refreshed early so we can filter the pending actions properly
			self:refresh_cached_data()
			self:generate_pending_actions()
			self:send_performed_action_event(action_wrapper)
		end,

		on_target_taken = function(self)
			self:apply_settlement_taken_effects()

			if not self.persistent.taken_cities then
				self.persistent.taken_cities = {}
			end

			local sabotage_used = false
			local support_used = false
			local balanced_used = false

			for _, taken_action_wrapper in ipairs(self.persistent.taken_action_wrappers) do
				if taken_action_wrapper.action_type == "sabotage" then
					sabotage_used = true
				elseif taken_action_wrapper.action_type == "support" then
					support_used = true
				elseif taken_action_wrapper.action_type == "balanced" then
					balanced_used = true
				end
			end

			if sabotage_used and support_used and balanced_used then
				core:trigger_event("ScriptEventThutmoseConqueredWithEachActionType", { faction = cm:get_faction(self.persistent.active_faction) })
			end

			local target_record = {
				target_key = self.persistent.current_target,
				taken_action_wrappers = self.persistent.taken_action_wrappers,
				reached_culmination_key = self.persistent.reached_culmination_key,
				-- We won't be able to tell what flavor text player had without saving index, will lead to inconsistent behavior
				reached_culmination_suffix_index = self.persistent.reached_culmination_suffix_index,
			}
			table.insert(self.persistent.taken_cities, target_record)

			local culmination_sabotage_used = false
			local culmination_support_used = false
			local culmination_balanced_used = false

			for _, taken_city in ipairs(self.persistent.taken_cities) do
				if taken_city.reached_culmination_key == "culmination_sabotage" then
					culmination_sabotage_used = true
				elseif taken_city.reached_culmination_key == "culmination_support" then
					culmination_support_used = true
				elseif taken_city.reached_culmination_key == "culmination_balanced" then
					culmination_balanced_used = true
				end
			end

			if self.persistent.reached_culmination_key then
				core:trigger_event("ScriptEventThutmoseConqueredCityWithCulmination", { faction_key = self.persistent.active_faction, culmination = self.persistent.reached_culmination_key })
			end

			if culmination_sabotage_used and culmination_support_used and culmination_balanced_used then
				core:trigger_event("ScriptEventThutmoseConqueredCitiesWithEachCulmination", { faction = cm:get_faction(self.persistent.active_faction) })
			end

			self.semi_persistent_data.conquered_target = self.persistent.current_target
			self:clear_progress()
			self:refresh_cached_data()
		end,
	--}

	--generic_methods = 
	--{
		-- returns a list of REGION_SCRIPT_INTERFACE for the valid regions
		get_valid_target_regions = function(self, include_owned_regions)
			local valid_regions = {}
			for _, pillar_region_key in ipairs(pillars_civilization.config.regions) do
				local result = table_find(self.config.targets_excluded, function(e) return e == pillar_region_key end)
				-- we only want regions that are NOT in the targets_excluded table
				if not result then
					local region = cm:get_region(pillar_region_key)
					if not region then
						output("Error: can't find a region with key: " .. pillar_region_key)
					else
						local owning_faction = region:owning_faction()
						if (include_owned_regions or owning_faction:name() ~= self.persistent.active_faction) then
							table.insert(valid_regions, region)
						end
					end
				end
			end

			for _, region_key in ipairs(self.config.targets_added) do
				local region = cm:get_region(region_key)
				if not region then
					output("Error: can't find a region with key: " .. region_key)
				else
					if include_owned_regions 
						or region:owning_faction():name() ~= self.persistent.active_faction
					then
						table.insert(valid_regions, region)
					end
				end
			end

			return valid_regions
		end,

		-- checks if the faction can choose any target - no current target, affordability
		can_faction_choose_target = function(self)
			if self.persistent.current_target ~= nil then
				return false
			end
			local base_cost_obj = self:get_choose_target_cost_obj()
			local faction_key = self.persistent.active_faction
			local faction_obj = cm:get_faction(faction_key)
			if not faction_obj then
				output("Error: can not find faction '" .. faction_key .. "'")
				return false
			end

			local can_pay = faction_obj:can_afford_resource_cost_object(base_cost_obj)
			return can_pay
		end,

		-- TODO: should return a second parameter with list of reasons the target can not be chosen to display as a tooltip
		-- possibly rename to is_target_valid
		can_target_be_chosen = function(self, region_obj)
			if (not region_obj) 
				or region_obj:is_null_interface()
			then
				return false
			end

			if region_obj:is_abandoned() then
				-- is ruins
				return false
			end

			if region_obj:owning_faction():name() == self.persistent.active_faction then
				return false
			end

			local settlement = region_obj:settlement()
			local slot_list = settlement:slot_list()
			local slot = slot_list:item_at(0)
			local building = slot:building()
			local level = building:level()
			if level == 0 then
				-- ruins should be caught in the upper condition, but just in case
				return false
			end

			return true
		end,

		get_choose_target_cost_obj = function(self)
			local base_cost_obj = cm:create_new_custom_resource_cost()
			-- this is the main way to set up costs
			if self.config.target_resource_costs_record then
				base_cost_obj:get_cost_from_record(self.config.target_resource_costs_record)
			elseif self.config.target_test_cost then
				-- this is meant for testing, only used if the main cost is removed or commented
				for _, resource_info in ipairs(self.config.target_test_cost) do
					base_cost_obj:add_resource_cost(resource_info[1], court.config.court_resource_factor, resource_info[2])
				end
			end

			return base_cost_obj
		end,

		refresh_cached_data = function(self)
			self:refresh_total_sabotage_support()
			self:refresh_reinforcement_army()
		end,

		refresh_total_sabotage_support = function(self)
			local total_sabotage = 0
			local total_support = 0

			local taken_action_wrappers = self:get_taken_action_wrappers()
			for i = 1, #taken_action_wrappers do
				local action_wrapper = taken_action_wrappers[i]
				local sabotage_value, support_value = self:get_sabotage_support_values_for_wrapper(action_wrapper.action_type, action_wrapper.randomizer)
				total_sabotage = total_sabotage + sabotage_value
				total_support = total_support + support_value
			end

			self.data.sabotage_gained = total_sabotage
			self.data.native_support_gained = total_support
		end,

		-- returns the reward that should be given, as well as its index
		get_reward_and_index = function(self, resource_gained, rewards_table)
			local resource_gained_percent = resource_gained * 100 / self.config.final_sabotage_support_sum
			local reached_index = 0
			for index, reward in ipairs(rewards_table) do
				if reward.resource_percent_needed <= resource_gained_percent then
					reached_index = index
				else
					break
				end
			end
			if reached_index > 0 then
				return rewards_table[reached_index], reached_index
			end

			return nil
		end,
	--}

	--region_change_related_methods = 
	--{
		apply_settlement_taken_effects = function(self)
			local sabotage_gained = self.data.sabotage_gained
			local sabotage_rewards = self.config.sabotage_rewards
			local sabotage_reward = self:get_reward_and_index(sabotage_gained, sabotage_rewards)

			if sabotage_reward and sabotage_reward.resource_reward_record then
				local cost_obj = cm:create_new_custom_resource_cost()
				cost_obj:get_cost_from_record(sabotage_reward.resource_reward_record)
				local faction_obj = cm:get_faction(self.persistent.active_faction)
				cm:faction_apply_resource_transaction(faction_obj, cost_obj)

				self:send_conquest_resource_event(cost_obj)
			end

			local replenishment_bonus = 0
			if sabotage_reward and sabotage_reward.replenishment_rate then
				replenishment_bonus = sabotage_reward.replenishment_rate
			end

			local support_gained = self.data.native_support_gained
			local support_rewards = self.config.native_support_rewards
			local support_reward, reward_index = self:get_reward_and_index(support_gained, support_rewards)

			local happiness_bonus = 0
			if support_reward and support_reward.happiness then
				happiness_bonus = support_reward.happiness
			end

			if replenishment_bonus ~= 0 or happiness_bonus ~= 0 then
				local bundle = cm:create_new_custom_effect_bundle(self.config.after_conquest_effects_bundle)
				if replenishment_bonus ~= 0 then
					bundle:add_effect(self.config.replenishment_effect, "region_to_force_own", replenishment_bonus)
				end

				if happiness_bonus ~= 0 then
					bundle:add_effect(self.config.happiness_effect, "region_to_province_own_text_provincewide", happiness_bonus)
				end

				local target_region_interface = cm:get_region(self.persistent.current_target)
				cm:apply_custom_effect_bundle_to_region(bundle, target_region_interface)
				bundle:set_duration(self.config.after_conquest_bonus_duration)
			end

			-- we check for units from the native support level
			local native_unit_rewards = self.config.native_support_unit_rewards
			if reward_index and reward_index > 0 then
				local target_unit_rewards = native_unit_rewards[self.persistent.current_target]
				local current_level_units = target_unit_rewards[reward_index]
				self:give_post_conquest_mercenaries(current_level_units)
			end
		end,

		give_post_conquest_mercenaries = function(self, current_level_units)
			local active_faction_obj = cm:get_faction(self.persistent.active_faction)
			for _, unit_table in ipairs(current_level_units) do
				cm:add_unit_to_faction_mercenary_pool(active_faction_obj, 
					unit_table.unit_key,	-- unit to add to Special Recruitment/merceneries
					unit_table.amount,		-- number of units to add
					0,						-- replenishment chance
					unit_table.amount,		-- max amount of units in the pool
					0,						-- max amount of units that can be replenished in the pool per turn
					unit_table.veterancy or 0,	-- xp level
					"", "", "")				-- custom params may be empty
			end
		end,

		clear_progress = function(self)
			-- TODO: remove visibility from self.persistent.current_target specifically
			cm:reset_shroud_visibility(self.persistent.active_faction)

			-- removing bundles given by taken actions
			for _, taken_action_wrapper in ipairs(self.persistent.taken_action_wrappers) do
				local bundle = taken_action_wrapper.action_obj.instant_effect_bundle
				if bundle then
					cm:remove_effect_bundle_from_region(bundle, self.persistent.current_target)
				end
			end

			if self.persistent.current_target then
				self:set_target_settlement_icon_visibility(false)
			end

			self.persistent.current_target = nil
			self.persistent.pending_actions = {}
			self.persistent.taken_action_wrappers = {}
			self.persistent.reached_culmination_key = nil
			self.persistent.revealed_garrison_units = 0
			self.persistent.revealed_garrison_proportion = 0
			self.persistent.next_action_discount = nil
			-- if the user spawned the reinforcement army, we store the index of the last purchased action here
			-- this way we can check which parts of the reinforcerment army were already spawned and which are yet to spawn
			self.persistent.army_spawned_at_index = nil
			-- this one is called when the user fights using the reinforcement army
			-- if the player spawns the army, but refuses to use it, we disband the army and set army_spawned_at_index to army_used_up_at_index
			-- indicating the units can be used again
			-- if the user fights, he uses the units, and thus we must set army_used_up_at_index to army_spawned_at_index
			self.persistent.army_used_up_at_index = nil
			self.persistent.actions_this_turn = 0
		end,
	--},

	--action generation = 
	--{
		-- fills pending_actions with 3 actions 
		-- unless all actions slots are taken, then it fills reached_culmination_key
		generate_pending_actions = function(self)
			if #self.persistent.taken_action_wrappers > ancient_legacy_thutmose.config.actions_before_culmination 
				or self.persistent.reached_culmination_key then
				-- all the actions are taken, including the culmination
				output("Error: trying to generate valid actions, but all actions are taken!")
				return
			end

			if #self.persistent.taken_action_wrappers == ancient_legacy_thutmose.config.actions_before_culmination 
				and not self.persistent.reached_culmination_key then
				local reached_culmination = self:choose_culmination()
				self.persistent.reached_culmination_key = reached_culmination.action_key
				self.persistent.reached_culmination_suffix_index = cm:model():random_int(1, ancient_legacy_thutmose.config.culmination_actions_description_suffixes_number)
				-- Used for the campaign interventions
				core:trigger_custom_event("ScriptedEventThutmoseCulminationReached", {culmination_key = reached_culmination.action_key, faction_key = self.persistent.active_faction})
				return
			end

			self.persistent.pending_actions = {}

			local sabotage_action_wrapper = self:generate_action_wrapper("sabotage")
			if sabotage_action_wrapper then
				table.insert(self.persistent.pending_actions, sabotage_action_wrapper)
			end
			local support_action_wrapper = self:generate_action_wrapper("support")
			if support_action_wrapper then
				table.insert(self.persistent.pending_actions, support_action_wrapper)
			end

			if (#self.persistent.taken_action_wrappers < (ancient_legacy_thutmose.config.actions_before_culmination - 1)) then
				local final_action = self:generate_normal_final_action()
				table.insert(self.persistent.pending_actions, final_action)
			else
				-- the last action before the culmination has more custom logic
				local final_action = self:generate_last_slot_final_action()
				if final_action then
					table.insert(self.persistent.pending_actions, final_action)
				end
			end
		end,

		-- the final pending action in a slot (other than the last one!) is picked at random from the three lists
		generate_normal_final_action = function(self)
			local valid_actions = {}
			if self:can_take_any_action(self.config.sabotage_actions) then
				table.insert(valid_actions, "sabotage")
			end
			if self:can_take_any_action(self.config.support_actions) then
				table.insert(valid_actions, "support")
			end
			if self:can_take_any_action(self.config.balanced_actions) then
				table.insert(valid_actions, "balanced")
			end
			local final_action = nil
			if #valid_actions == 0 then
				output("There are no actions to pick, we cannot provide final action")
				return final_action
			end
			local random_index = cm:model():random_int(1, #valid_actions)
			final_action =  self:generate_action_wrapper(valid_actions[random_index])

			return final_action
		end,

		-- the final action in the last slot before a culmination has specific logic
		-- if the difference between sabotage and support is less than max_sabotage_support_difference_for_custom_balanced_action
		-- we set up a custom balanced action, otherwise we just pick the normal way
		generate_last_slot_final_action = function(self)
			local abs_difference = math.abs(self.data.sabotage_gained - self.data.native_support_gained)
			if abs_difference > self.config.max_sabotage_support_difference_for_custom_balanced_action then
				return self:generate_normal_final_action()
			end

			local balanced_action_obj = self:get_random_valid_action_from_list(self.config.balanced_actions)
			local final_action_wrapper = {
				action_type = "balanced",
				action_obj = balanced_action_obj,
			}

			-- we need to set up a custom randomizer that would make the action give equal results for sabotage_gained and native_support_gained
			-- to calculate the final score the deviation is multiplied by the base value. Since here we have the differences between the base values, to get the deviation we need to divide by the base value
			-- but first we need to check if it is 0 for a sanity check
			local needed_deviation_difference = 0
			local sabotage_deviation = 0
			local support_deviation = 0
			local balanced_base_value = self.config.base_sabotage_support_values.balanced_base_value
			if balanced_base_value == 0 then
				output("Error: balanced_base_value should not be 0, there is no way to fix the final action cost!")
			else
				-- this is how much sabotage and native support we need to have after this action
				local final_resource = self.config.final_sabotage_support_sum / 2
				-- then it's easy to calculate how much this action needs to give to reach it
				local needed_sabotage = final_resource - self.data.sabotage_gained
				local needed_support = final_resource - self.data.native_support_gained
				
				-- we calculate the deviation from a given value (usually the math is in the other direction)
				sabotage_deviation = (needed_sabotage / balanced_base_value) - 1
				support_deviation = (needed_support / balanced_base_value) - 1
			end

			local custom_randomizer = {
				sabotage_resource_deviation = sabotage_deviation,
				support_resource_deviation = support_deviation,
			}

			final_action_wrapper.randomizer = custom_randomizer
			return final_action_wrapper 
		end,

		choose_culmination = function(self)
			if self.data.sabotage_gained > self.data.native_support_gained then
				return self.config.culmination_actions[1]
			elseif self.data.sabotage_gained < self.data.native_support_gained then
				return self.config.culmination_actions[2]
			end

			return self.config.culmination_actions[3]
		end,

		-- generates an action wrapper with a random action and randomizer (randomizers alter the sabortage/support given by actions)
		-- actions in the last slot have custom randomizers so the sum of the resources is fixed after all actions are taken
		generate_action_wrapper = function(self, action_type)
			local action_wrapper = {}
			local actions_list = self.config.balanced_actions
			local randomizer_list = self.config.balanced_randomizers
			if action_type == "sabotage" then
				actions_list = self.config.sabotage_actions
				randomizer_list = {}
				for _, randomizer in ipairs(self.config.sabotage_support_randomizers) do
					-- for sabotage actions sabotage_gained is the primary resource and native_support_gained is the secondary
					if self:can_use_sabotage_support_randomizer(randomizer, self.data.sabotage_gained, self.data.native_support_gained) then
						table.insert(randomizer_list, randomizer)
					end
				end
			elseif action_type == "support" then
				actions_list = self.config.support_actions
				randomizer_list = {}
				for _, randomizer in ipairs(self.config.sabotage_support_randomizers) do
					-- for support actions native_support_gained is the primary resource and sabotage_gained is the secondary
					if self:can_use_sabotage_support_randomizer(randomizer, self.data.native_support_gained, self.data.sabotage_gained) then
						table.insert(randomizer_list, randomizer)
					end
				end
			end

			action_wrapper.action_type = action_type
			action_wrapper.action_obj = self:get_random_valid_action_from_list(actions_list)

			if (#self.persistent.taken_action_wrappers < (ancient_legacy_thutmose.config.actions_before_culmination - 1)) then
				if #randomizer_list == 0 then
					output("Error: did not find suitable randomizers for action type '" .. action_type .. "', probably hitting the resource max")
					return nil
				end
				-- choose one from the valid randomizers provided
				local randomizer_index = cm:model():random_int(1, #randomizer_list)
				action_wrapper.randomizer = randomizer_list[randomizer_index]
			else
				local custom_randomizer = self:get_last_slot_randomizer(action_type)
				action_wrapper.randomizer = custom_randomizer
			end

			return action_wrapper
		end,

		-- checks if the randomizer will cause one of the resources to go out of bounds (negative or over final_sabotage_support_sum)
		can_use_sabotage_support_randomizer = function(self, randomizer, primary_resource, secondary_resource)
			local primary_base_value = self.config.base_sabotage_support_values.sabotage_support_base_value
			local primary_value_change = primary_base_value + primary_base_value * randomizer.primary_resource_deviation
			if primary_resource + primary_value_change > self.config.final_sabotage_support_sum then
				return false
			end

			if not randomizer.secondary_resource_multiplier then
				return true
			end

			-- this should be negative because secondary_resource_multiplier is usually negative
			local secondary_value_change = randomizer.secondary_resource_multiplier * self.config.base_sabotage_support_values.sabotage_support_base_value
			if secondary_value_change + secondary_resource < 0 then
				return false
			end
			return true
		end,

		-- generates an action wrapper with a random action and randomizer (randomizers alter the sabortage/support given by actions)
		-- in this case we want the generated Sabotage and Supply to add with the old ones up to final_sabotage_support_sum
		get_last_slot_randomizer = function(self, action_type)
			-- the sum of the resources after taking this action must be final_sabotage_support_sum
			-- so the sum of resources it gives must be the final sum minus the current resources
			local needed_sum = self.config.final_sabotage_support_sum - self.data.sabotage_gained - self.data.native_support_gained

			if action_type == "balanced" then
				-- the sum should be split between the support and sabotage resource, because this is a balanced action
				local needed_sabotage = needed_sum / 2
				local needed_support = needed_sum / 2

				-- if the sum is an odd number we do some tweaking to make the splitted numbers whole, but add up to the number we need
				if needed_sum % 2 == 1 then
					needed_sabotage = math.ceil(needed_sabotage)
					needed_support = math.floor(needed_support)
				end

				local sabotage_deviation = 0
				local support_deviation = 0
				local balanced_base_value = self.config.base_sabotage_support_values.balanced_base_value
				if balanced_base_value == 0 then
					output("Error: balanced_base_value should not be 0, there is no way to fix the final action cost!")
				else
					sabotage_deviation = needed_sabotage / balanced_base_value - 1
					sabotage_deviation = needed_support / balanced_base_value - 1
				end

				local custom_randomizer = {
					sabotage_resource_deviation = sabotage_deviation,
					support_resource_deviation = sabotage_deviation,
				}

				return custom_randomizer 
			end

			local primary_deviation = 0
			local secondary_deviation = 0
			if self.config.base_sabotage_support_values.sabotage_support_base_value == 0 then
				output("Error: sabotage_support_base_value should not be 0, there is no way to fix the final action cost!")
			else
				-- we can't simply use abs_difference, as we need the pure difference with its sign
				primary_deviation = (needed_sum / self.config.base_sabotage_support_values.sabotage_support_base_value) - 1
			end

			local custom_randomizer = {
				primary_resource_deviation = primary_deviation,
				secondary_resource_multiplier = secondary_deviation,
			}

			return custom_randomizer 
		end,

		get_random_valid_action_from_list = function(self, actions_list)
			local weighted_actions_list = weighted_list:new()
			for i = 1, #actions_list do
				local potential_action = actions_list[i]

				if self:can_take_action(potential_action) then
					local weight = self.config.default_action_weight
					if potential_action.chance_weight then
						weight = potential_action.chance_weight
					end
					weighted_actions_list:add_item(potential_action, weight)
				end
			end

			if #weighted_actions_list.items <= 0 then
				output("there are no valid actions, adding an invalid one!!!")
				return actions_list[1]
			end

			local choice, _ = weighted_actions_list:weighted_select()
			-- this can happen if all items have weight 0, we take the first
			if not choice then 
				return weighted_actions_list.items[1].item
			end
			return choice
		end,
	--}

	--action utility methods = 
	--{
		can_take_any_action = function(self, actions_list)
			for i, potential_action in ipairs(actions_list) do
				if self:can_take_action(potential_action) then
					return true
				end
			end
			return false
		end,

		can_take_action = function(self, potential_action)
			for i = 1, #self.persistent.taken_action_wrappers do
				local taken_action_wrapper = self.persistent.taken_action_wrappers[i]
				if taken_action_wrapper.action_obj.action_key == potential_action.action_key then
					-- we already took this action
					return false
				end

				if taken_action_wrapper.action_obj.incompatible_actions then
					local incompatible_action = table_find(taken_action_wrapper.action_obj.incompatible_actions, function(e) return e == potential_action.action_key end)
					if incompatible_action then
						return false
					end
				end

				if potential_action.incompatible_actions then
					local incompatible_action = table_find(potential_action.incompatible_actions, function(e) return e == taken_action_wrapper.action_obj.action_key end)
					if incompatible_action then
						return false
					end
				end
			end

			for i = 1, #self.persistent.pending_actions do
				local pending_action = self.persistent.pending_actions[i]
				if pending_action.action_obj.action_key == potential_action.action_key then
					-- this action is chosen as pending, we can't show it again
					return false
				end

				if potential_action.incompatible_actions then
					local incompatible_action = table_find(potential_action.incompatible_actions, function(e) return e == pending_action.action_obj.action_key end)
					if incompatible_action then
						-- have another action that is incompativle with this one
						return false
					end
				end

				if pending_action.action_obj.incompatible_actions then
					local incompatible_action = table_find(pending_action.action_obj.incompatible_actions, function(e) return e == potential_action.action_key end)
					if incompatible_action then
						-- one of the other pending actions is incompatible with this one
						return false
					end
				end
			end

			if potential_action.requires_actions then
				local found_required_action = false
				for i = 1, #potential_action.requires_actions do
					local required_action_key = potential_action.requires_actions[i]
					local taken_action = table_find(self.persistent.taken_action_wrappers, function(e) return e.action_obj.action_key == required_action_key end)
					if taken_action then
						found_required_action = true
						break
					end
				end
				if not found_required_action then
					-- we need at least one other action to unlock this one, and we don't have it
					return false
				end
			end

			if potential_action.locked_by_actions then
				for i = 1, #potential_action.locked_by_actions do
					local locking_action_name = potential_action.locked_by_actions[i]
					for i = 1, #self.persistent.taken_action_wrappers do
						local taken_action_wrapper = self.persistent.taken_action_wrappers[i]
						if taken_action_wrapper.action_obj.action_key == locking_action_name then
							-- we took another action that disables this one
							return false
						end
					end
				end
			end

			-- if it provides units, we must check if the total number of units provided by support culmination and actions will not surpass the max allowed
			local potential_reinforcement = self.config.native_support_units_provided[potential_action.action_key]
			if self.persistent.current_target and potential_reinforcement then
				local target_unit_rewards = potential_reinforcement[self.persistent.current_target]
				if target_unit_rewards then
					local throwaway_table = {}
					local units_added_num = self:add_units_to_army(throwaway_table, target_unit_rewards)
					local reserved_num = self.data.units_from_actions_num + self.data.units_from_support_culmination_num
					if self.config.max_units_provided < units_added_num + reserved_num then
						return false
					end
				end
			end

			-- if the action targets an ERS building of a specific type, we must check if the target has this building 
			local ers_damage = potential_action.ers_type_damage
			if is_table(ers_damage) and (not is_empty_table(ers_damage)) then
				local found_correct_ers = false
				local target_region_interface = cm:get_region(self.persistent.current_target)
				local slot_list = target_region_interface:slot_list()
				for j = 0, slot_list:num_items() - 1 do
					local slot = slot_list:item_at(j)
					if slot:is_infrastructure_slot() and slot:has_building() then
						local current_building_interface = slot:building()
						local building_chain_name = current_building_interface:chain()
						local ers_found = table_find(ers_damage, function(e) return string.starts_with(building_chain_name, e) end)
						if ers_found then
							found_correct_ers = true
							break
						end
					end
				end
				if not found_correct_ers then
					return false
				end
			end
			return true
		end,

		get_action_by_name = function(self, action_key)
			local action = self:find_action_in_list(self.config.sabotage_actions, action_key)
			if action then
				return action
			end

			action = self:find_action_in_list(self.config.support_actions, action_key)
			if action then
				return action
			end

			action = self:find_action_in_list(self.config.balanced_actions, action_key)
			return action
		end,

		find_action_in_list = function(self, actions_list, action_key)
			for i = 1, #actions_list do
				local action = actions_list[i]
				if action.action_key == action_key then
					return action
				end
			end

			return nil
		end,

		-- we return the bespoke resources provided by the combination of the action and its randomizer
		-- the resources being Sabotage and Native Support, in this order
		get_sabotage_support_values_for_wrapper = function(self, action_type, randomizer)
			if action_type == "balanced" then
				local sabotage_value = self.config.base_sabotage_support_values.balanced_base_value
				sabotage_value = sabotage_value + sabotage_value * randomizer.sabotage_resource_deviation

				local support_value = self.config.base_sabotage_support_values.balanced_base_value
				support_value = support_value + support_value * randomizer.support_resource_deviation

				return sabotage_value, support_value
			end

			local primary_base_value = self.config.base_sabotage_support_values.sabotage_support_base_value
			local primary_value = primary_base_value + primary_base_value * randomizer.primary_resource_deviation

			local secondary_value = 0
			if randomizer.secondary_resource_multiplier then
				-- the second value given is a proportion of the primary value, not a deviation of it
				-- or more correctly - taken, as with the curent design secondary_resource_multiplier is negative
				secondary_value = primary_base_value * randomizer.secondary_resource_multiplier
			end

			if action_type == "sabotage" then
				-- for sabotage actions, sabotage is the primary value, so we return it first
				return primary_value, secondary_value
			end

			-- for support actions, sabotage is the secondary value, so we return it first
			return secondary_value, primary_value
		end,

		-- the faction here is needed if there is an effect reducing action costs
		get_action_cost_obj = function(self, action_obj)
			local base_cost_obj = cm:create_new_custom_resource_cost()
			-- this is the main way to set up costs
			if action_obj.resource_costs_record then
				base_cost_obj:get_cost_from_record(action_obj.resource_costs_record)
			elseif action_obj.test_cost then
				-- this is meant for testing, only used if the main cost is removed or commented
				for _, resource_info in ipairs(action_obj.test_cost) do
					base_cost_obj:add_resource_cost(resource_info[1], court.config.court_resource_factor, resource_info[2])
				end
			end

			-- altering cost, if needed
			if action_obj.taken_discount then
				-- If taken discount is present, it means we are showing action taken from a save state
				base_cost_obj:decrease_by_percent(action_obj.taken_discount)
			elseif self.persistent.next_action_discount then
				base_cost_obj:decrease_by_percent(self.persistent.next_action_discount)
			end

			return base_cost_obj
		end,

		get_action_gain_obj = function(self, action_obj)
			-- this is the main way to handle resource_cost type
			if action_obj.resource_gains_record then
				local resource_cost_obj = cm:create_new_custom_resource_cost()
				resource_cost_obj:get_cost_from_record(action_obj.resource_gains_record)
				return resource_cost_obj
			end

			return nil
		end,

		can_pay_for_action = function(self, faction_key, action_obj)
			if not faction_key then
				output("Error: no faction_key provided to can_pay_for_action ")
				return false
			end

			local base_cost_obj = self:get_action_cost_obj(action_obj)
			local faction_obj = cm:get_faction(faction_key)
			if not faction_obj then
				output("Error: can not find faction '" .. faction_key .. "'")
				return false
			end

			local can_pay = faction_obj:can_afford_resource_cost_object(base_cost_obj)
			return can_pay
		end,

		pay_for_action = function(self, faction_key, action_obj)
			if not self:can_pay_for_action(faction_key, action_obj) then
				return false
			end

			local base_cost_obj = self:get_action_cost_obj(action_obj)

			local faction_obj = cm:get_faction(faction_key)
			cm:faction_apply_resource_transaction(faction_obj, base_cost_obj)
			if self.persistent.next_action_discount then
				-- We will use the applied discount to show correct cost paid in action history
				action_obj.taken_discount = self.persistent.next_action_discount
			else
				-- This is still needed as an indication that we want to avoid applying current discount
				action_obj.taken_discount = 0
			end

			-- no matter if there was a discount or not, it should be gone now
			self.persistent.next_action_discount = nil
			return true
		end,

		gain_for_action = function(self, faction_key, action_obj)
			local gain_obj = self:get_action_gain_obj(action_obj)

			if gain_obj then
				local faction_obj = cm:get_faction(faction_key)
				cm:faction_apply_resource_transaction(faction_obj, gain_obj)
			end
		end,

		get_number_of_revealed_garrion_units = function(self)
			if not self.persistent.current_target then
				return 0
			end
			local target_region_interface = cm:get_region(self.persistent.current_target)
			if not target_region_interface or target_region_interface:is_null_interface() then
				output("Could not find target region of " .. self.persistent.current_target)
				return 0
			end
			local current_target_garrison = target_region_interface:garrison_residence()
			local garrison_force = cm:get_armed_citizenry_from_garrison(current_target_garrison)
			if not garrison_force or garrison_force:is_null_interface() then
				output("No garrison found for " .. self.persistent.current_target)
				return 0
			end
			local units_list = garrison_force:unit_list()
			local number_of_units = units_list:num_items()

			local revealed_units = 0
			if self.persistent.revealed_garrison_proportion then
				revealed_units = number_of_units * self.persistent.revealed_garrison_proportion
				revealed_units = math.ceil(revealed_units)
			end
			if self.persistent.revealed_garrison_units then
				revealed_units = revealed_units + self.persistent.revealed_garrison_units
			end

			if revealed_units > number_of_units then 
				revealed_units = number_of_units
			end
			return revealed_units
		end,

		get_culmination_by_key = function(self, action_key)
			local action = self:find_action_in_list(self.config.culmination_actions, action_key)
			return action
		end,

		has_faction_action_available = function(self, faction_key)
			local actions_taken_this_turn = self.persistent.actions_this_turn or 0
			if actions_taken_this_turn >= self.config.actions_per_turn then
				return false
			end

			if not self.persistent.pending_actions then
				return false
			end
			
			for _, action_wrapper in ipairs(self.persistent.pending_actions) do
				if self:can_pay_for_action(faction_key, action_wrapper.action_obj) then
					return true
				end
			end

			return false
		end,
	--},

	-- Helper function that needs to be used when we have to considered history from taken cities
	get_taken_action_wrappers = function(self)
		local taken_action_wrappers = self.persistent.taken_action_wrappers
		-- we need to switch taken_action_wrappers only if we currently have conquered_target selected
		local target_key = self.semi_persistent_data.conquered_target
		if target_key then
			for _, taken_city in ipairs(self.persistent.taken_cities) do
				if taken_city.target_key == target_key then
					taken_action_wrappers = taken_city.taken_action_wrappers
					break
				end
			end
		end

		return taken_action_wrappers
	end,

	-- reinforcement army methods
	--{
		-- recalculates the units provided to the reinforcement army
		-- then stores them into reinforcing_army
		-- then does the same with used_up_army
		refresh_reinforcement_army = function(self)
			local reinforcement_army = {}
			local used_up_army = {}
			self.data.units_from_actions_num = 0

			-- first we gather the units from the taken actions
			local taken_action_wrappers = self:get_taken_action_wrappers()
			local current_target = self.semi_persistent_data.conquered_target or self.persistent.current_target
			for action_index, taken_action_wrapper in ipairs(taken_action_wrappers) do
				local action_reinforcement = self.config.native_support_units_provided[taken_action_wrapper.action_obj.action_key]
				if action_reinforcement then
					local target_unit_rewards = action_reinforcement[current_target]
					if target_unit_rewards then
						if self.persistent.army_used_up_at_index and self.persistent.army_used_up_at_index >= action_index then
							-- these units were already used
							self:add_units_to_army(used_up_army, target_unit_rewards)
						else
							local units_added_num = self:add_units_to_army(reinforcement_army, target_unit_rewards)
							self.data.units_from_actions_num = self.data.units_from_actions_num + units_added_num
						end
					end
				end
			end

			self.data.units_from_support_culmination_num = 0
			if current_target then
				-- we check for units from the culmination, even if it wasn't reached, to filter actions
				local culmination_provided_units = self.config.native_support_units_provided.culmination_support
				local target_unit_rewards = culmination_provided_units[current_target]
				if target_unit_rewards then
					local reached_culmination_key = self.persistent.reached_culmination_key
					if self.semi_persistent_data.conquered_target then
						for _, taken_city in ipairs(self.persistent.taken_cities) do
							if taken_city.target_key == current_target then
								reached_culmination_key = taken_city.reached_culmination_key
								break
							end
						end
					end
					local reached_culmination_obj = self:get_culmination_by_key(reached_culmination_key)
					if reached_culmination_obj and reached_culmination_obj.action_type == "support" then
						if self.persistent.army_used_up_at_index and self.persistent.army_used_up_at_index >= self.config.actions_before_culmination then
							-- we already used up all the reinforcements from all the actions
							self.data.units_from_support_culmination_num = self:add_units_to_army(used_up_army, target_unit_rewards)
						else
							self.data.units_from_support_culmination_num = self:add_units_to_army(reinforcement_army, target_unit_rewards)
						end
					else
						-- if we have not reached the culmination we should not be adding its units to the army
						-- but we should still calculate how many it would give, so we don't go over the limit
						local throwaway_table = {}
						self.data.units_from_support_culmination_num = self:add_units_to_army(throwaway_table, target_unit_rewards)
					end
				end
			end

			self.data.reinforcing_army = reinforcement_army
			self.data.used_up_army = used_up_army
		end,

		-- we add the units from unit_set into reinforcement_army
		-- returns the number of units added, for convenience
		add_units_to_army = function(self, reinforcement_army, unit_set)
			local number_of_added_units = 0
			for _, new_unit_group in ipairs(unit_set) do
				number_of_added_units = number_of_added_units + new_unit_group.amount
				local old_unit_group = table_find(reinforcement_army, function(e) return e.unit_key == new_unit_group.unit_key end)
				if old_unit_group then
					old_unit_group.amount = old_unit_group.amount + new_unit_group.amount
				else
					-- unit_set and thus new_unit_group probably came by reference from the config
					-- ! inserting new_unit_group instead of a copy will change the table from the config the next time the same unit type is added !
					-- ! we need to add a copy by value, not reference !
					-- don't ask how long it took to find out why the config kept changing -_-
					table.insert(reinforcement_army, table_deep_copy(new_unit_group))
				end
			end

			return number_of_added_units
		end,
	--}

	--action effect methods = 
	--{
		-- once the action is taken, we apply the immediate effect bundles and bespoke logic
		apply_action_effects = function(self, action_obj, action_type, randomizer)
			local region_name = self.persistent.current_target
			local target_region_interface = cm:get_region(region_name)
			local settlement = target_region_interface:settlement()

			if action_obj.instant_effect_bundle then
				-- 0 here means no turn limit. we will remove the effect once we take the region or abandon it as a goal
				cm:apply_effect_bundle_to_region(action_obj.instant_effect_bundle, region_name, 0)
			end

			if action_obj.next_action_discount then
				self.persistent.next_action_discount = action_obj.next_action_discount
			end

			if action_obj.grants_visibility then
				self.persistent.visibility_granted = true
				cm:make_region_visible_in_shroud(self.persistent.active_faction, self.persistent.current_target)
			end

			if action_obj.reveal_garrison_proportion then
				if not self.persistent.revealed_garrison_proportion then
					self.persistent.revealed_garrison_proportion = 0
				end
				self.persistent.revealed_garrison_proportion = self.persistent.revealed_garrison_proportion + action_obj.reveal_garrison_proportion
			end

			if action_obj.reveal_garrison_units then
				if not self.persistent.revealed_garrison_units then
					self.persistent.revealed_garrison_units = 0
				end
				self.persistent.revealed_garrison_units = self.persistent.revealed_garrison_units + action_obj.reveal_garrison_units
			end

			if action_obj.settlement_buildings_damaged and is_number(action_obj.settlement_buildings_damaged) then
				self:damage_settlement_buildings(action_obj)
			end

			if action_obj.ers_type_damage and action_obj.ers_type_damage ~= "" then
				self:damage_ers_buildings(action_obj)
			end

			if action_obj.rebellion_units_spawned and is_number(action_obj.rebellion_units_spawned) then
				-- 0, 0 here are coordinates and mean the game should find a suitable position by itself
				cm:force_rebellion_in_region(region_name, action_obj.rebellion_units_spawned, 0, 0, false)
			end

			if action_obj.garrison_damage and is_number(action_obj.garrison_damage) then
				cm:damage_garrison_units(region_name, action_obj.garrison_damage)
			end
		end,

		damage_settlement_buildings = function(self, action_obj)
			local target_region_interface = cm:get_region(self.persistent.current_target)
			local settlement = target_region_interface:settlement()
			local buildings_list_interface = settlement:building_list()
			local num_buildings = buildings_list_interface:num_items()
			-- buildings_list_interface is of type BUILDING_LIST_SCRIPT_INTERFACE,
			-- we filter it and change it into a Lua list for easier handling
			local viable_buildings_list = {}
			for i = 0, num_buildings - 1 do
				local current_building_interface = buildings_list_interface:item_at(i)
				local slot_interface = current_building_interface:slot()
				
				if not slot_interface:is_infrastructure_slot() -- we are not interested in ERS buildings
					and current_building_interface:can_be_damaged () -- we are not interested in buildings that can not be damaged
				then
					table.insert(viable_buildings_list, current_building_interface)
				end
			end

			for i = 1, action_obj.settlement_buildings_damaged do
				if #viable_buildings_list == 0 then
					output("Warning: There are not enough buildings to damage!")
					return
				end

				local building_index = cm:model():random_int(1, #viable_buildings_list)
				local building_interface = viable_buildings_list[building_index]
				-- we remove the element from the list, so it does not come again
				table.remove(viable_buildings_list, building_index)

				local building_name = building_interface:name()
				local old_health = building_interface:percent_health()

				local settlement_building_damage = action_obj.building_damage
				if not settlement_building_damage then 
					settlement_building_damage = self.config.default_building_damage
				end
				local new_health = old_health - settlement_building_damage
				if new_health < 0 then 
					new_health = 0
				end

				cm:instant_set_building_health_percent(self.persistent.current_target, building_name, new_health)
			end
		end,

		damage_ers_buildings = function(self, action_obj)
			local viable_building_interface_list = {}
			local target_region_interface = cm:get_region(self.persistent.current_target)
			local slot_list = target_region_interface:slot_list()
			for j = 0, slot_list:num_items() - 1 do
				local slot = slot_list:item_at(j)
				if slot:is_infrastructure_slot() and slot:has_building() then
					local current_building_interface = slot:building()
					local building_chain_name = current_building_interface:chain()
					local ers_found = table_find(action_obj.ers_type_damage, function(e) return string.starts_with(building_chain_name, e) end)
					if ers_found then
						table.insert(viable_building_interface_list, current_building_interface)
					end
				end
			end

			local ers_buildings_to_damage = action_obj.ers_buildings_damaged or 1
			if #viable_building_interface_list == 0 then
				output("Warning: There are not enough ERS buildings to damage!")
				return
			end
			for i = 1, ers_buildings_to_damage do
				-- we remove elements from the list in the cycle, this check serves a purpose
				if #viable_building_interface_list == 0 then
					return
				end

				local building_index = cm:model():random_int(1, #viable_building_interface_list)
				local current_building_interface = viable_building_interface_list[building_index]
				-- we remove the element from the list, so it does not come again
				table.remove(viable_building_interface_list, building_index)

				local old_health = current_building_interface:percent_health()
				local ers_building_damage = action_obj.building_damage
				if not ers_building_damage then 
					ers_building_damage = self.config.default_building_damage
				end
				local new_health = old_health - ers_building_damage
				if new_health < 0 then 
					new_health = 0
				end
				local building_name = current_building_interface:name()
				cm:instant_set_building_health_percent(self.persistent.current_target, building_name, new_health)
			end
		end,

		force_surrender = function(self)
			cm:force_pending_battle_complete()
			if self.persistent.reinforcement_general_cqi then
				self:destroy_reinforcing_army(true)
			end
			cm:change_region_owner(self.persistent.current_target, self.persistent.active_faction)
		end,

		-- we use a structure for the units, with unit_key and amount
		-- for spawning they need a list of unit keys
		get_reinforcing_units_string_for_spawning = function(self)
			-- we need to refresh the army from the actions/culmination
			self:refresh_reinforcement_army()

			-- if there is no army, there is nothing to spawn
			if not self.data.reinforcing_army then
				return ""
			end

			local result = ""
			for _, element in ipairs(self.data.reinforcing_army) do
				for i = 1, element.amount do
					if result ~= "" then
						result = result .. ","
					end
					result = result .. element.unit_key
				end
			end
			return result
		end,

		spawn_reinforcing_army = function(self)
			local units_list_string = self:get_reinforcing_units_string_for_spawning()
			-- if there is no army to spawn we just do nothing
			if units_list_string == "" then
				output("ERROR: trying to force reinforcements, but no reinforcements to spawn")
				return
			end

			local region_key = self.persistent.current_target
			local active_faction = self.persistent.active_faction
			local spawn_pos_x, spawn_pos_y = cm:find_valid_spawn_location_for_character_from_settlement(active_faction, region_key, false, false, 0)
			cm:create_force(active_faction, 
				units_list_string, 
				region_key, spawn_pos_x, spawn_pos_y, true,
				function(cqi) self:on_reinforcement_army_spawned(cqi) end, 
				true)

			-- we mark that the army has already spawned, so we do not spawn it again
			self.persistent.army_spawned_at_index = #self.persistent.taken_action_wrappers
		end,

		destroy_reinforcing_army = function(self, should_reset_army_spawned)
			local reinforcement_general_cqi = self.persistent.reinforcement_general_cqi
			if not reinforcement_general_cqi then
				return
			end

			local general = cm:model():character_for_command_queue_index(reinforcement_general_cqi)
			if (not general) or general:is_null_interface() then
				return
			end

			cm:kill_character_and_commanded_unit(cm:char_lookup_str(general), true)
			self.persistent.reinforcement_general_cqi = nil

			if should_reset_army_spawned then
				-- the player refused to use the reinforcements, we release them back to the used up point
				self.persistent.army_spawned_at_index = self.persistent.army_used_up_at_index
			else
				-- the player used up the reinforcements, we mark them as used
				self.persistent.army_used_up_at_index = self.persistent.army_spawned_at_index
			end
			self:refresh_reinforcement_army()
		end,

		on_reinforcement_army_spawned = function(self, reinforcement_general_cqi)
			self.persistent.reinforcement_general_cqi = reinforcement_general_cqi

			local general_lookup_str = cm:char_lookup_str(reinforcement_general_cqi)
			local character_interface = cm:get_character(general_lookup_str)
			local military_force = character_interface:military_force()
			local force_cqi = military_force:command_queue_index()
			for _, taken_action_wrapper in ipairs(self.persistent.taken_action_wrappers) do
				local reinforcements_bundles = taken_action_wrapper.action_obj.reinforcement_army_bundle_list
				if is_table(reinforcements_bundles) then
					for _, bundle_key in ipairs(reinforcements_bundles) do
						cm:apply_effect_bundle_to_force(bundle_key, force_cqi, 0)
					end
				end
			end

			local reached_culmination_key = self.persistent.reached_culmination_key
			if reached_culmination_key then
				local reached_culmination_obj = self:get_culmination_by_key(reached_culmination_key)
				if reached_culmination_obj then
					local reinforcements_bundle = reached_culmination_obj.reinforcement_army_bundle
					if reinforcements_bundle then
						cm:apply_effect_bundle_to_force(reinforcements_bundle, force_cqi, 0)
					end
				end
			end

			-- This is a hacky way to prevent updating some faction stats like generals recruited / killed and also to no receive event feed events about character dying
			cm:character_forced_invisible(general_lookup_str, true)
			cm:convert_force_to_type(character_interface, eminence.config.obedience.spawned_army_force_type)

			-- when this army is removed, the supply points script will remove the supply score of this army
			-- but since it is spawned, not trained, it will not add the supply score
			-- therefore we need to add the supply manually, so after the army is spawned and destroyed the supply score of the faction remains as it was originally
			if is_supply_points_applicable(character_interface:faction()) then
				local unit_list = military_force:unit_list()
				for i = 0, unit_list:num_items() - 1 do
					local unit = unit_list:item_at(i)
					-- commanders are handled in the supply_points_unit_created listener
					-- the normal units are not
					if not unit:has_unit_commander() then
						supply_points.update_supply_points_for_unit(unit, true, supply_points_factors.units)
					end
				end

				supply_points.apply_effects_for_faction(character_interface:faction():name())
			end
		end,

		force_sally_out = function(self, params)
			-- we remove the default battlefield
			cm:remove_custom_battlefield("generic")
			-- we add a new, custom one. 
			-- it should be the same as the one in add_battle_script_override
			-- except for "true -- force a siege battle to be fought"
			cm:add_custom_battlefield(
				"thutmose_legacy_sally_enemy",						-- string identifier
				0,													-- x co-ord
				0,													-- y co-ord
				5000,												-- radius around position
				false,												-- will campaign be dumped
				"",													-- loading override
				"script/battle/campaign_battle/battle_start.lua",	-- script override
				"",													-- entire battle override
				0,													-- human alliance when battle override
				false,												-- launch battle immediately
				true,												-- is land battle (only for launch battle immediately)
				false,												-- force application of autoresolver result
				true,												-- force a siege battle to be fought outside the settlement as a land battle
				false												-- disable fortification towers (for siege battles)
			)

			-- we get the force from the CQI in the params
			local our_force_cqi_str = params[1]
			local our_force_cqi = tonumber(our_force_cqi_str)
			local force = cm:model():military_force_for_command_queue_index(our_force_cqi)
			if not force:is_null_interface() then
				-- if there was siege equipment we need to remove it, it is not a siege battle any more
				cm:force_remove_siege_equipment(force)
			end
		end,

		remove_effects_after_battle = function(self)
			local reached_culmination_key = self.persistent.reached_culmination_key
			local reached_culmination_obj = self:get_culmination_by_key(reached_culmination_key)

			if reached_culmination_obj and reached_culmination_obj.allow_force_sally_out then
				cm:remove_custom_battlefield("thutmose_legacy_sally_enemy")
				add_battle_script_override() -- restore generic battle override
			end
		end,
	--},

	--ui_methods = -- phar_ancient_legacy_thutmose_ui takes care of the Thutmose panel, we have to do the rest here
	--{
		on_pre_battle_popup_opened = function(self, context)
			local pb = cm:model():pending_battle()
			if not pb:siege_battle() then
				return
			end

			local garrison = pb:contested_garrison()
			if (not garrison)
				or garrison:is_null_interface()
				or (not garrison:is_settlement())
			then
				return false
			end
			local region = garrison:region()
			if (not region)
				or region:is_null_interface()
			then
				-- this may happen if the battle is in water. it's not the one we need anyway
				return
			end

			local region_name = region:name()
			if region_name ~= self.persistent.current_target then
				return
			end

			local attacker = pb:attacker()
			if (not attacker)
				or attacker:is_null_interface()
				or attacker:faction():name() ~= self.persistent.active_faction
					then
				return
			end

			local reached_culmination_key = self.persistent.reached_culmination_key
			if not reached_culmination_key then
				return
			end

			local reached_culmination_obj = self:get_culmination_by_key(reached_culmination_key)
			if not reached_culmination_obj then
				output("ERROR: Could not find culmination action from key:".. reached_culmination_key)
				return
			end

			if reached_culmination_obj.allow_force_surrender then
				local root_component = nil
				-- if this is a quicksave during a siege, the panel is opened before the loading is complete
				-- the event we catch does not carry the proper component, so we try again to find it
				if context.component then
					root_component = UIComponent(context.component)
				else
					root_component = core:get_ui_root()
				end
				local force_surrender_button = find_uicomponent(root_component,"button_set_siege","button_force_surrender")
				if force_surrender_button then
					force_surrender_button:SetVisible(true)
				end
			end
			
			if reached_culmination_obj.allow_force_sally_out then
				local root_component = nil
				-- if this is a quicksave during a siege, the panel is opened before the loading is complete
				-- the event we catch does not carry the proper component, so we try again to find it
				if context.component then
					root_component = UIComponent(context.component)
				else
					root_component = core:get_ui_root()
				end
				local force_sally_button = find_uicomponent(root_component,"button_set_siege","button_force_sally")
				if force_sally_button then
					force_sally_button:SetVisible(true)
				end
			end
		end,

		send_target_set_event = function(self)
			cm:add_event_feed_event("ancient_legacy_thutmose_target", self.persistent.active_faction, 0, 
				self.persistent.current_target)
		end,

		send_performed_action_event = function(self, action_wrapper)
			cm:add_event_feed_event("ancient_legacy_thutmose_action", self.persistent.active_faction, 0, 
				self.persistent.current_target, action_wrapper.action_obj.ui_data.name_localization_key)
		end,

		send_conquest_resource_event = function(self, cost_obj)
			local ui_info_str = cost_obj:to_string()
			if ui_info_str ~= "0" then
				local event_data = self.config.event_data_conquest_extra_resources
				local ui_info_parts = string.split(ui_info_str, ",")
				local image_token = "/img]]"
				if #ui_info_parts == 2 then
					local image_cost_first = string.split(ui_info_parts[1], image_token)
					local image_cost_second = string.split(ui_info_parts[2], image_token)
				
					cm:show_configurable_message_event(self.persistent.active_faction,
						event_data.title,
						event_data.primary_detail,
						event_data.secondary_detail,
						event_data.pic,
						tonumber(image_cost_first[2]),
						tonumber(image_cost_second[2]),
						nil,
						image_cost_first[1] .. image_token,
						image_cost_second[1] .. image_token)

				elseif #ui_info_parts == 1 then
					image_cost = string.split(ui_info_parts[1], image_token)

					cm:show_configurable_message_event(self.persistent.active_faction,
						event_data.title,
						event_data.primary_detail,
						event_data.secondary_detail,
						event_data.pic,
						tonumber(image_cost[2]),
						nil,
						nil,
						image_cost[1] .. image_token)

				else
					output("ERROR: Unexpected number of resources was received, event feed message won't be fired")
				end
			end
		end,

		add_target_settlement_icon = function(self)
			if not self.persistent.current_target then
				return
			end
			local target_indication = self.config.target_indication

			cm:set_custom_settlement_info_icon(self.persistent.current_target, 
				target_indication.component_name,
				target_indication.icon_path,
				target_indication.tooltip_key
				)

			self:set_target_settlement_icon_visibility(true)
		end,

		set_target_settlement_icon_visibility = function(self, visible)
			if not self.persistent.current_target then
				return
			end
			local target_indication = self.config.target_indication

			-- to see the icon in strategic zoom we need something similar to CampaignCityInfoBar::m_strategic_view_capital_icon, and a new element in city_info_bar.twui.xml
			-- I think it would be better, but design does not want it for now
			cm:set_custom_settlement_info_icon_visibility(self.persistent.current_target, 
				target_indication.component_name, 
				visible)
			CampaignUI.UpdateSettlementEffectIcons()
		end,
	--}

	--utility methods and system events
	--{
		on_legacy_claimed = function(self, faction_key)
			local local_faction_name = cm:get_local_faction_name(true)

			self.persistent.active_faction = faction_key
			-- set faction realm
			local faction = cm:get_faction(faction_key)
			self.persistent.active_faction_cqi = faction:command_queue_index()

			-- we need to initialize the cached data to a new table, otherwise it will fallback to the one in the legacy template
			-- which would result in all thutmose legacies using data pointing to one table

			self.data = {}
			-- there is no data yet, but we need to set it to 0s, not nil
			self:refresh_cached_data()

			if local_faction_name == faction_key then 
				egypt_political_states:activate_button("button_fm_phar_thutmose", true)
			end

			self.semi_persistent_data = {}
		end,

		-- persistent data is already loaded by ancient_legacy_common, we are just informed we are loaded
		on_loading_game = function(self, faction_title)
			if not self.persistent.taken_action_wrappers then
				self.persistent.taken_action_wrappers = {}
			end

			if self.persistent.reached_culmination_key and (not self.persistent.reached_culmination_suffix_index) then
				self.persistent.reached_culmination_suffix_index = 1
			end

			-- we need to initialize the cached data to a new table, otherwise it will fallback to the one in the legacy template
			-- which would result in all thutmose legacies using data pointing to one table

			self.data = {}
			self.semi_persistent_data = {}
			-- we rebuild the cached items so they are ready on all machines
			self:refresh_cached_data()
		end,

		get_listeners = function(self)
			output("ANCIENT LEGACIES THUTMOSE ADD LISTENERS()")
	
			return {
				--FirstTickAfterWorldCreated
				{
					event = "FirstTickAfterWorldCreated",
					auto_check_faction = false,
					condition = function(self, context) 
									local local_faction = cm:get_local_faction_name(true)
									return local_faction == self.persistent.active_faction
								end,
					callback = function(self, context)
						egypt_political_states:activate_button("button_fm_phar_thutmose")
						if self.persistent.current_target ~= nil then
							if self.persistent.visibility_granted then
								cm:make_region_visible_in_shroud(self.persistent.active_faction, self.persistent.current_target)
							else
								cm:make_region_seen_in_shroud(self.persistent.active_faction, self.persistent.current_target)
							end

							self:add_target_settlement_icon()
						end
					end,
				},

				-- reinforcing_army: PendingBattleAboutToBeCreated
				{
					event = "PendingBattleAboutToBeCreated",
					auto_check_faction = false,
					condition = true,
					callback = function(self, context)
						local attacker = context:character()
						local attacker_faction_name = attacker:faction():name()
						local garrison = context:target_garrison()

						local battle_type = context:battle_type()
						-- for sally out we need to flip the target and main character
						if battle_type == "settlement_sally" then
							garrison = attacker:garrison_residence()
							attacker = context:target_character()
							if attacker and (not attacker:is_null_interface()) then
								attacker_faction_name = attacker:faction():name()
							end
						end

						if attacker_faction_name ~= self.persistent.active_faction then
							return
						end

						if (not garrison)
							or garrison:is_null_interface()
							or (not garrison:is_settlement())
						then
							return
						end

						local region_name = garrison:region():name()
						if region_name ~= self.persistent.current_target then
							return
						end

						local reinforcements_string = self:get_reinforcing_units_string_for_spawning()
						if reinforcements_string ~= ""
						then
							self:spawn_reinforcing_army()
						end
					end,
				},

				-- reinforcing_army: BattleConflictFinished
				{
					event = "BattleConflictFinished",
					auto_check_faction = false,
					condition = true,
					callback = function(self, context)
						local pb = cm:model():pending_battle()
						local garrison = pb:contested_garrison()
						if (not garrison)
							or garrison:is_null_interface()
							or (not garrison:is_settlement())
						then
							return
						end

						local region = garrison:region()
						if (not region) 
							or region:is_null_interface()
						then
							-- this may happen if the battle is in water. it's not the one we need anyway
							return
						end

						local region_name = region:name()
						if region_name ~= self.persistent.current_target then
							return
						end

						-- if the enemies sallied out, the active faction is the defender
						local attacker_faction_key = pb:attacker_faction():name()
						local defender_faction_key = pb:defender_faction():name()
						if attacker_faction_key ~= self.persistent.active_faction
							and defender_faction_key~= self.persistent.active_faction
						then
							return
						end

						if self.persistent.reinforcement_general_cqi then
							self:destroy_reinforcing_army(false)
						end
					end,
				},

				-- reinforcing_army: CharacterWithdrewFromBattle
				{
					event = "CharacterWithdrewFromBattle",
					auto_check_faction = false,
					condition = true,
					callback = function(self, context)
						local pb = cm:model():pending_battle()
						local garrison = pb:contested_garrison()
						if (not garrison)
							or garrison:is_null_interface()
							or (not garrison:is_settlement())
						then
							return
						end

						local region = garrison:region()
						if (not region) 
							or region:is_null_interface()
						then
							-- this may happen if the battle is in water. it's not the one we need anyway
							return
						end

						local region_name = region:name()
						if region_name ~= self.persistent.current_target then
							return
						end

						-- if the enemies sallied out, the active faction is the defender
						local attacker_faction_key = pb:attacker_faction():name()
						local defender_faction_key = pb:defender_faction():name()
						if attacker_faction_key ~= self.persistent.active_faction
							and defender_faction_key~= self.persistent.active_faction
						then
							return
						end

						if self.persistent.reinforcement_general_cqi then
							self:destroy_reinforcing_army(true)
						end
					end,
				},

				-- reinforcing_army: CharacterMaintainsSiege
				{
					event = "CharacterMaintainsSiege",
					auto_check_faction = false,
					condition = function(self, context)
						local pb = cm:model():pending_battle()
						local attacker_faction_key = pb:attacker_faction():name()
						local character_faction_key = context:character():faction():name()
						local garrison = pb:contested_garrison()

						if (not garrison)
							or garrison:is_null_interface()
							or (not garrison:is_settlement())
						then
							return false
						end

						local region = garrison:region()
						if (not region) 
							or region:is_null_interface()
						then
							-- this may happen if the battle is in water. it's not the one we need anyway
							return false
						end

						local region_name = region:name()

						return attacker_faction_key == self.persistent.active_faction and 
							character_faction_key == self.persistent.active_faction and
							region_name == self.persistent.current_target
					end,
					callback = function(self, context)
						if self.persistent.reinforcement_general_cqi then
							self:destroy_reinforcing_army(true)
						end
					end,
				},

				--PanelOpenedCampaign
				{
					event = "PanelOpenedCampaign",
					auto_check_faction = true,
					condition = function(self, context)
						-- the pre-battle panel can be opened before loading is finished
						if not cm.game_is_running then
							return false
						end
						-- all the factions with the legacy get this event, but we need this sent only to the player
						local local_faction_name = cm:get_local_faction_name(true)
						if self.persistent.active_faction ~= local_faction_name then
							return false
						end
						return true
					end,
					callback = function(self, context)
						if context.string == ancient_legacy_thutmose.ui.config.panel_name then
							ancient_legacy_thutmose.ui:on_panel_opened(self)
						elseif context.string == "popup_pre_battle" then
							self:on_pre_battle_popup_opened(context)
						end
					end,
				},

				--PanelClosedCampaign
				{
					event = "PanelClosedCampaign",
					auto_check_faction = true,
					condition = function(self, context) 
							return context.string == ancient_legacy_thutmose.ui.config.panel_name
						end,
					callback = function(self, context)
						ancient_legacy_thutmose.ui:on_panel_closed()
					end,
				},

				--UITriggerScriptEvent
				-- model-changing interactions that are sent to all machines
				{
					event = "UITriggerScriptEvent",
					auto_check_faction = true,
					condition = function(self, context) 
						local trigger = context:trigger()
						return trigger:split(":")[1] == "thutmose_action"
					end,
					callback = function(self, context)
						-- do not do early returns here, we need to call refresh_cached_data at the end!
						local local_faction_name = cm:get_local_faction_name(true)
						local params = context:trigger():split(":")
						local action_type = params[2]
						-- we remove all the params we used up, and pass on the remainder
						table.remove(params, 1)
						table.remove(params, 1)

						if action_type == "take_action" then
							self:on_action_taken(params)
						elseif action_type == "choose_target_region" then
							self:on_target_chosen(params)
						elseif action_type == "abandon_target_region" then
							self:on_target_abandoned(params)
						elseif action_type == "force_surrender" then
							self:force_surrender(params)
						elseif action_type == "force_sally_out" then
							self:force_sally_out(params)
							-- once we setup the sally out, we start the battle by simulating a click on the attack button
							-- but only if we were the one to trigger the event (so the pre-battle menu is open)
							if self.persistent.active_faction == local_faction_name then
								local attack_button_component = find_uicomponent(core:get_ui_root(),"button_set_siege","button_attack")
								if attack_button_component then
									-- this has issues in MP
									-- TODO: test and fix
									attack_button_component:SetState("active")
									attack_button_component:SimulateLClick()
								else
									output("ERROR: could not start an attack after setting up sally out, because 'button_attack' was not found!")
								end
							end
						else
							output("Error: unknown thutmose action: '".. action_type .. "'")
						end

						self:refresh_cached_data()
						if self.persistent.active_faction == local_faction_name then
							ancient_legacy_thutmose.ui:refresh_ui()
						end
					end,
				},

				-- BattleConflictFinished - after the battle has finished, but before effects are applied
				{
					event = "BattleConflictFinished",
					auto_check_faction = true,
					condition = function(self, context) 
						local pb = context:pending_battle()
						local garrison = pb:contested_garrison()
						if (not garrison)
							or garrison:is_null_interface()
							or (not garrison:is_settlement())
						then
							return false
						end
						local region = garrison:region()
						if (not region) 
							or region:is_null_interface()
						then
							-- this may happen if the battle is in water. it's not the one we need anyway
							return false
						end
						local region_name = region:name()
						if region_name ~= self.persistent.current_target then
							return false
						end

						local attacker = pb:attacker()
						if not (attacker and not attacker:is_null_interface() and attacker:faction():name() == self.persistent.active_faction) then
							return false
						end

						return true
					end,
					callback = function(self, context)
						local pb = context:pending_battle()
						local reached_culmination_key = self.persistent.reached_culmination_key
						local reached_culmination_obj = self:get_culmination_by_key(reached_culmination_key)

						if reached_culmination_obj and reached_culmination_obj.allow_force_sally_out then
							cm:remove_custom_battlefield("thutmose_legacy_sally_enemy")
							add_battle_script_override() -- restore generic battle override
						end
					end,
				},

				--RegionFactionChangeEvent
				{
					event = "RegionFactionChangeEvent",
					auto_check_faction = false,
					condition = true,
					callback = function(self, context)
						local region_name = context:region():name()
						local taken_by_faction = context:region():owning_faction():name() == self.persistent.active_faction
						if not taken_by_faction then
							if region_name == self.semi_persistent_data.conquered_target then
								self.semi_persistent_data.conquered_target = nil
							end
							return
						end

						local is_target = region_name == self.persistent.current_target
						if is_target then
							self:on_target_taken()
						elseif region_name == self.semi_persistent_data.preliminary_target then
							self.semi_persistent_data.preliminary_target = nil
						end
					end,
				},

				--CharacterPerformsSettlementOccupationDecision
				{
					event = "CharacterPerformsSettlementOccupationDecision",
					auto_check_faction = false,
					condition = true,
					callback = function(self, context)
						local region_obj = context:garrison_residence():region()
						local region_name = region_obj:name()
						-- if the region is not a target or at least preliminary target (selected but not confirmed/locked)
						-- we don't need to do anything
						if self.persistent.current_target ~= region_name and self.semi_persistent_data.preliminary_target ~= region_name then
							return
						end

						-- if after the occupation decision the target is still valid for selection we don't need to do anything
						if self:can_target_be_chosen(region_obj) then
							return
						end

						-- we need to deselect the target - it is no longer valid - e.g. is ruins, abandoned, etc.
						if self.persistent.current_target then
							-- TODO: send an event message explaining why the target and progress is lost
							self.semi_persistent_data.conquered_target = nil
							self:clear_progress()
						end

						if self.semi_persistent_data.preliminary_target then
							self.semi_persistent_data.preliminary_target = nil
						end
					end,
				},

				--ComponentLClickUp - for handling PreBattleOptions button interaction
				{
					event = "ComponentLClickUp",
					auto_check_faction = true,
					condition = function(self, context)
						if context.string ~= "button_force_surrender"
							and context.string ~= "button_spawn_native_reinforcements"
							and context.string ~= "button_force_sally"
						then
							return false
						end

						return true
					end,
					callback = function(self, context)
						local local_faction_obj = cm:get_faction(self.persistent.active_faction)
						local local_faction_cqi = local_faction_obj:command_queue_index()
						local param_str = ""
						if context.string == "button_force_surrender" then
							param_str = "thutmose_action:force_surrender"
						elseif context.string == "button_force_sally" then
							-- we need to send the attacking force CQI so the sally out code can remove the siege equipment
							local pending_battle = cm:model():pending_battle()
							local attacking_force = pending_battle:attacker():military_force()
							local attacking_force_cqi = attacking_force:command_queue_index()
							param_str = "thutmose_action:force_sally_out:"..attacking_force_cqi
						end

						if param_str == "" then
							output("ERROR: there is a mismatch between the pre-battle options event filter and body, no action found!")
							return
						end
						CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, param_str)
					end,
				},

				--RoundStart - for resetting actions_this_turn
				{
					event = "RoundStart",
					auto_check_faction = true,
					condition = true,
					callback = function(self, context)
						self.persistent.actions_this_turn = 0
					end,
				},

				--FirstTickAfterWorldCreated - if popup_pre_battle was opened before loading is finished
				{
					event = "FirstTickAfterWorldCreated",
					auto_check_faction = true,
					condition = true,
					callback = function(self, context)
						if cm:get_campaign_ui_manager():is_panel_open("popup_pre_battle") then
							self:on_pre_battle_popup_opened(context)
						end
					end,
				},
			}
		end,
	--}
}

return ancient_legacy_thutmose