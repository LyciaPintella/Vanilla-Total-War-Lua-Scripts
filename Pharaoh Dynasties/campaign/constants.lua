
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	REPOSITORY FOR STRINGS AND OTHER GLOBAL DATA TO BE LOADED ACROSS CAMPAIGN
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

sacred_egypt_lands_settlement_bar_icon = {
	icon_id = "icon_phar_sacred_egypt_lands",
	icon_path = "UI/skins/default/campaign_overlays/icon_overlay_sacred_egyptian_lands.png",
	tooltip_key = "phar_main_sacred_egypt_land_city_info_bar_tooltip",
}

-- Do NOT iterate with the pairs() method, only ipairs(). Will get every region twice and in the wrong order with pairs()
sacred_egypt_lands = {
	"phar_main_kerma_kerma",
	"phar_main_kerma_mu_sh",
	"phar_main_kerma_nu_abu",
	"phar_main_kerma_uab_khu",
	"phar_main_per_ramesses_meri_amon_hap_sh",
	"phar_main_per_ramesses_meri_amon_khet_pa",
	"phar_main_per_ramesses_meri_amon_per_ramesses_meri_amon",
	"phar_main_buhen_buhen",
	"phar_main_buhen_hap_au",
	"phar_main_buhen_her_hetem",
	"phar_main_buhen_shesp_ma",
	-- region not found in factions table, probably renamed
	"phar_main_north_nubia_miam",
	"phar_main_north_nubia_mu_ua",
	"phar_main_north_nubia_res_pa",
	"phar_main_kurkur_oasis_kurkur_oasis",
	"phar_main_kurkur_oasis_sen_hetem",
	"phar_main_kurkur_oasis_tcheba_ua",
	"phar_main_elephantine_elephantine",
	"phar_main_elephantine_hierakonpolis",
	"phar_main_elephantine_mes",
	"phar_main_elephantine_tep_hetem",
	"phar_main_kom_ombo_kha_sba",
	"phar_main_kom_ombo_kom_ombo",
	"phar_main_kom_ombo_tchu_ua",
	"phar_main_thebes_kha_ti",
	"phar_main_thebes_sma_ua",
	"phar_main_thebes_thebes",
	"phar_main_abydos_aakh_ner",
	"phar_main_abydos_abydos",
	"phar_main_abydos_tin",
	"phar_main_kharga_oasis_kharga_oasis",
	"phar_main_kharga_oasis_shesp_net",
	"phar_main_kharga_oasis_tebh",
	"phar_main_akhmim_akhmim",
	"phar_main_akhmim_mefka_qes",
	"phar_main_akhmim_ur_men",
	"phar_main_asyut_asyut",
	"phar_main_asyut_kep_un",
	"phar_main_asyut_tem_khus",
	"phar_main_amarna_amarna",
	"phar_main_hermopolis_hermopolis",
	"phar_main_hermopolis_ti_ar",
	"phar_main_hardai_hardai",
	"phar_main_hardai_tep_aha",
	"phar_main_hardai_ur_gem",
	"phar_main_herakleopolis_herakleopolis",
	"phar_main_herakleopolis_sheps_khu",
	-- regions not found in factions table, probably renamed
	"phar_main_faiyum_dahshur",
	"phar_main_faiyum_faiyum",
	"phar_main_faiyum_khem",
	"phar_main_memphis_helwan",
	"phar_main_memphis_memphis",
	"phar_main_memphis_petpeh",
	"phar_main_heliopolis_heliopolis",
	"phar_main_heliopolis_qes",
	"phar_main_pi_ramesses_per_amun",
	"phar_main_pi_ramesses_pi_ramesses",
	"phar_main_pi_ramesses_tjaru",
	"phar_main_buto_buto",
	"phar_main_buto_paiuenamun",
	"phar_main_buto_sais",
	"phar_main_rhacotis_khan_aha",
	"phar_main_rhacotis_qema",
	"phar_main_rhacotis_rhacotis",
	"phar_main_north_sinai_azzati",
	"phar_main_north_sinai_neb_gehes",
	"phar_main_north_sinai_nekhel",
	"phar_main_north_sinai_sukkot",
}

for _, region_key in ipairs(sacred_egypt_lands) do
	sacred_egypt_lands[region_key] = true
end

sacred_hatti_lands_settlement_bar_icon = {
	icon_id = "icon_phar_sacred_egypt_lands",
	icon_path = "UI/skins/default/campaign_overlays/icon_overlay_sacred_hittite_lands.png",
	tooltip_key = "phar_main_sacred_hatti_land_city_info_bar_tooltip",
}

-- Do NOT iterate with the pairs() method, only ipairs(). Will get every region twice and in the wrong order with pairs()
sacred_hatti_lands = {
	"phar_main_zippalanda_amaseia",
	"phar_main_zippalanda_nerik",
	"phar_main_zippalanda_sapinuwa",
	"phar_main_zippalanda_zippalanda",
	"phar_main_hattussa_ankuwa",
	"phar_main_hattussa_arinna",
	"phar_main_hattussa_corniaspa",
	"phar_main_hattussa_hattussa",
	"phar_main_ancyra_ancyra",
	"phar_main_ancyra_aspona",
	"phar_main_ancyra_lagania",
	"phar_main_purushanda_mokissos",
	"phar_main_purushanda_nyssa",
	"phar_main_purushanda_purushanda",
	"phar_main_central_hatti_koropissos",
	"phar_main_central_hatti_larawanda",
	"phar_main_central_hatti_pegella",
	"phar_main_south_hatti_cibyra",
	"phar_main_south_hatti_lystra",
	"phar_main_south_hatti_tarhuntassa",
	"phar_main_tuwana_cybistra",
	"phar_main_tuwana_hubishna",
	"phar_main_tuwana_kelenderis",
	"phar_main_tuwana_tuwana",
	"phar_main_tarsus_adana",
	"phar_main_tarsus_kyinda",
	"phar_main_tarsus_tarsus",
	"phar_main_kanesh_kanesh",
	"phar_main_kanesh_kummanni",
	"phar_main_kanesh_saricha",
	"phar_main_malidiya_malidiya",
	"phar_main_malidiya_samuha",
	"phar_main_malidiya_tegarama",
	"phar_main_malidiya_zara",

}

for _, region_key in ipairs(sacred_hatti_lands) do
	sacred_hatti_lands[region_key] = true
end

sacred_aeg_lands_settlement_bar_icon = {
	icon_id = "icon_sacred_aegean_lands",
	icon_path = "UI/skins/default/campaign_overlays/icon_overlay_sacred_aegean_lands.png",
	tooltip_key = "phar_map_sacred_aeg_land_city_info_bar_tooltip",
}

-- Do NOT iterate with the pairs() method, only ipairs(). Will get every region twice and in the wrong order with pairs()
sacred_aeg_lands = {
	"phar_map_almopia_apsalos",
	"phar_map_almopia_dion",
	"phar_map_macedonia_cassope",
	"phar_map_macedonia_arnissa",
	"phar_map_macedonia_dolopeis",
	"phar_map_aeolia_pteleon",
	"phar_map_aeolia_pharsalos",
	"phar_map_aeolia_iolcos",
	"phar_map_boeotia_thebes",
	"phar_map_boeotia_cyparissos",
	"phar_map_boeotia_calydon",
	"phar_map_attica_athens",
	"phar_map_attica_carystos",
	"phar_map_attica_eretria",
	"phar_map_cephallenia_ithaca",
	"phar_map_cephallenia_hyrie",
	"phar_map_cephallenia_lefcas",
	"phar_map_mycenaeca_mycenae",
	"phar_map_mycenaeca_aegion",
	"phar_map_mycenaeca_corinth",
	"phar_map_mycenaeca_tiryns",
	"phar_map_lacedaemon_sparta",
	"phar_map_lacedaemon_pylos",
	"phar_map_lacedaemon_cythera",
	"phar_map_lacedaemon_altis",
	"phar_map_kretes_knossos",
	"phar_map_kretes_kydonia",
	"phar_map_kretes_phaestos",
	"phar_map_kretes_setaea",
	"phar_map_cyclades_naxos",
	"phar_map_cyclades_andros",
	"phar_map_cyclades_melos",
	"phar_map_cyclades_minoa",
	"phar_map_teythrania_eressos",
	"phar_map_teythrania_volissos",
	"phar_map_latmos_dolyche",
	"phar_map_teythrania_kyme",
	"phar_map_maeonia_erythrae",
	"phar_map_teythrania_pelopia",
	"phar_map_maeonia_milethus",
	"phar_map_maeonia_ephesos",
	"phar_map_maeonia_eyanthia",
	"phar_map_rhodes_lindos",
	"phar_map_rhodes_arcasia",
	"phar_map_rhodes_ialysos",
	"phar_map_zerynthia_nesoi_myrina",
	"phar_map_zerynthia_nesoi_skyros",
	"phar_map_zerynthia_nesoi_imbrasos",
	"phar_map_caria_halicarnassos",
	"phar_map_caria_knidos",
	"phar_map_lycia_balbura",
	"phar_map_isthmos_cibyra",
	"phar_map_isthmos_mobolla",
	"phar_map_isthmos_kaunos",
	"phar_map_lycia_telmessos",
	"phar_map_lycia_phellos",
	"phar_map_lycia_peraia",
	"phar_map_parha_myra",
	"phar_map_kuwaliya_kuwaliya",
	"phar_map_kuwaliya_ninoe",
	"phar_map_kuwaliya_appawiya",
	"phar_map_kuwaliya_walna",
	"phar_map_ilion_zeleia",
	"phar_map_ilion_troy",
	"phar_map_ilion_percote",
	"phar_map_ilion_adresteia",
}

for _, region_key in ipairs(sacred_aeg_lands) do
	sacred_aeg_lands[region_key] = true
end

sacred_meso_lands_settlement_bar_icon = {
	icon_id = "icon_sacred_akkadian_lands",
	icon_path = "UI/skins/default/campaign_overlays/icon_overlay_sacred_akkadian_lands.png",
	tooltip_key = "phar_map_sacred_meso_land_city_info_bar_tooltip",
}

-- Do NOT iterate with the pairs() method, only ipairs(). Will get every region twice and in the wrong order with pairs()
sacred_meso_lands = {
	"phar_map_aranzah_assur",
	"phar_map_aranzah_karana",
	"phar_map_aranzah_nimrud",
	"phar_map_aranzah_nineveh",
	"phar_map_ashnunnak_der",
	"phar_map_ashnunnak_diniktum",
	"phar_map_ashnunnak_eshnunna",
	"phar_map_ashnunnak_tutub",
	"phar_map_azalzi_amasakku",
	"phar_map_azalzi_kahat",
	"phar_map_azalzi_shudu",
	"phar_map_azalzi_zakhiku",
	"phar_map_bit_peri_amurru_agade",
	"phar_map_bit_peri_amurru_dur_kurigalzu",
	"phar_map_bit_peri_amurru_sur_marrati",
	"phar_map_hanigalbat_dur_katlimmu",
	"phar_map_hanigalbat_sangaritu",
	"phar_map_hanigalbat_shadikanni",
	"phar_map_hanigalbat_washukanni",
	"phar_map_kan_digirak_babylon",
	"phar_map_karduniash_ishtananu_lagash",
	"phar_map_karduniash_ishtananu_larak",
	"phar_map_karduniash_ishtananu_malgu",
	"phar_map_karduniash_ishtananu_nippur",
	"phar_map_karduniash_shutaiu_borsippa",
	"phar_map_karduniash_shutaiu_ur",
	"phar_map_karduniash_shutaiu_uruk",
	"phar_map_mari_duara",
	"phar_map_mari_mari",
	"phar_map_mari_supru",
	"phar_map_mari_terqa",
	"phar_map_northern_elam_kabnak",
	"phar_map_northern_elam_madaktu",
	"phar_map_northern_elam_pashime",
	"phar_map_northern_elam_susa",
	"phar_map_radanu_admannu",
	"phar_map_radanu_arrapha",
	"phar_map_radanu_lubdu",
	"phar_map_suhum_elu_anat",
	"phar_map_suhum_elu_haradu",
	"phar_map_suhum_elu_sapiratum",
	"phar_map_suhum_shaplu_idu",
	"phar_map_suhum_shaplu_rapiku",
	"phar_map_suhum_shaplu_sippar_amnamun",
}

for _, region_key in ipairs(sacred_meso_lands) do
	sacred_meso_lands[region_key] = true
end

province_info_panel_ui_component_path = {"BL_parent", "info_panel_holder", "primary_info_panel_holder", "info_panel_background", "ProvinceInfoPopup"}
---------------------
---Gods and favour---
---------------------

-------------------------------
-- See troy_favour for usage --
-------------------------------
gods_effects =
{
	--"troy_gods_favour_mod_zeus" -- effects are made by taking the pooled resource key of the god and replacing attitude with favour mod
								  -- see start_new_game_all_factions() for how the table is populated
} -- table of effect keys (see effects table) used by buildings to grant a one-time favour transaction
gods_factors =
{
	agents 				= "troy_god_attitude_factor_agents",
	battles 			= "troy_god_attitude_factor_battles",
	buildings 			= "troy_god_attitude_factor_buildings",
	campaign_adventures = "troy_god_attitude_factor_campaign_adventures",
	conflict 			= "troy_god_attitude_factor_conflict",
	temples 			= "troy_god_attitude_factor_temples",
	faction 			= "troy_god_attitude_factor_faction"

} -- table of pooled resource factors for distributing favour. Used to keep a history and track some data.
character_wounded_favour = 5 -- amount of favour granted after battle in case the other general was wounded
epic_hero_vs_favour = 20 -- amount of favour granted to winner of battle between epic heroes
victory_favour = 6 -- amount of favour granted to the victor in battle (generic)
naval_battle_favour = 8 -- amount of favour granted to the victor in battle (naval)
pyrrhic_victory_favour = 6 -- amount of favour granted to the victor in battle (pyrrhic)
decisive_victory_favour = 6 -- amount of favour granted to the victor in battle (decisive)
defeat_favour = -12 -- amount of favour substracted from loser in battle (generic)
defeat_naval_battle_favour = -12 -- amount of favour substracted from loser in battle (naval)
close_defeat_favour = -12 -- amount of favour substracted from loser in battle (close)
decisive_defeat_favour = -18 -- amount of favour substracted from loser in battle (decisive)
epic_hero_vs_lost_favour = -10 -- amount of favour substracted from loser of battle between epic heroes
defender_victory_favour = 8 -- amount of favour granted to the defending side of a battle (generic)
city_razed_favour = 25 -- amount of favour granted to any character when razing a city
region_captured_favour = 6 -- amount of favour granted to a faction when it accuires a new region
province_completed_favour = 12 -- amount of favour granted to a faction when an entire province is captured
character_created_favour = 2 -- amount of favour granted every time a new character is created (general)
agent_created_favour = 1 -- amount of favour granted every time a new character is created (agent)
faction_overcome_favour = 25 -- amount of favour a faction gains every time it overcomes another faction
agent_action_actor_favour = 8 -- amount of favour granted to the faction owning the actor agent in case of success
agent_action_target_favour = -8 -- amount of favour substracted from target of successful agent actions
trade_agreement_established_favour = 8 -- amount of favour granted to proposer when a trade aggreement is signed,recipient gets half(THIS DISTRIBUTION OCCURS TWICE)
peace_treaty_signed_favour = 8 -- amount of favour granted to proposer when a peace aggreement is signed,recipient gets half(THIS DISTRIBUTION OCCURS TWICE)
war_declaration_favour = 12 -- amount of favour granted to proposer when a war declaration is issued(THIS DISTRIBUTION OCCURS TWICE)
trade_agreement_dissolved_favour = -10 -- amount of favour substracted from the faction dissolving a trade aggreement (THIS DISTRIBUTION OCCURS TWICE)
achilles_mood_depressed_favour_bonus = 1.2 -- bonus modifier applied to favour gain from buildings of the religion chain when achilles is in his depressed mood
gods_adventures_favour_human_mod = 0

---------------------------------------
-- See troy_campaign_setup for usage --
---------------------------------------

-- Tables for each "gain", "loss"

-- gods_panel_tooltip_gain_title = {
--	hera = { loc_key = "troy_gods_tooltip_hera_gain_title_1" },
--	zeus = { loc_key = "troy_gods_tooltip_zeus_gain_title_1" },
--	ares = { loc_key = "troy_gods_tooltip_ares_gain_title_1" },
--	apollo = { loc_key = "troy_gods_tooltip_apollo_gain_title_1" },
--	athena = { loc_key = "troy_gods_tooltip_athena_gain_title_1" },
--	poseidon = { loc_key = "troy_gods_tooltip_Poseidon_gain_title_1" },
--	aphrodite = { loc_key = "troy_gods_tooltip_aphrodite_gain_title_1" },
-- }

-- gain_construction_1 = {
-- 	hera = {
-- 		loc_key = "troy_gods_tooltip_hera_gain_construction_1",
-- 		value = "30, 40, 50"
-- 	},
-- 	zeus = {
-- 		loc_key = "troy_gods_tooltip_zeus_gain_construction_1",
-- 		value = "30, 40, 50"
-- 	},
-- 	ares = {
-- 		loc_key = "troy_gods_tooltip_ares_gain_construction_1",
-- 		value = "30, 40, 50"
-- 	},
-- 	apollo = {
-- 		loc_key = "troy_gods_tooltip_apollo_gain_construction_1",
-- 		value = "30, 40, 50"
-- 	},
-- 	athena = {
-- 		loc_key = "troy_gods_tooltip_athena_gain_construction_1",
-- 		value = "30, 40, 50"
-- 	},
-- 	poseidon = {
-- 		loc_key = "troy_gods_tooltip_Poseidon_gain_construction_1",
-- 		value = "30, 40, 50"
-- 	},
-- 	aphrodite = {
-- 		loc_key = "troy_gods_tooltip_aphrodite_gain_construction_1",
-- 		value = "30, 40, 50"
-- 	},
-- }

-- gain_construction_2 = {
-- 	hera = {
-- 		loc_key = "troy_gods_tooltip_hera_gain_construction_2",
-- 		value = "4, 8, 12"
-- 	},
-- 	zeus = {
-- 		loc_key = "troy_gods_tooltip_zeus_gain_construction_2",
-- 		value = "10, 12, 14"
-- 	},
-- 	ares = {
-- 		loc_key = "troy_gods_tooltip_ares_gain_construction_2",
-- 		value = "5, 10, 15"
-- 	},
-- 	apollo = {
-- 		loc_key = "troy_gods_tooltip_apollo_gain_construction_2",
-- 		value = "4, 8, 12"
-- 	},
-- 	athena = {
-- 		loc_key = "troy_gods_tooltip_athena_gain_construction_2",
-- 		value = "4, 8, 12, 16"
-- 	},
-- 	poseidon = {
-- 		loc_key = "troy_gods_tooltip_Poseidon_gain_construction_2",
-- 		value = "10, 20"
-- 	},
-- 	aphrodite = {
-- 		loc_key = "troy_gods_tooltip_aphrodite_gain_construction_2",
-- 		value = "2, 4, 6"
-- 	},
-- }

-- gain_battle_1 = {
-- 	hera = {
-- 		loc_key = "troy_gods_tooltip_hera_gain_battle_1",
-- 		value = character_wounded_favour
-- 	},
-- 	zeus = {
-- 		loc_key = "troy_gods_tooltip_zeus_gain_battle_1",
-- 		value = epic_hero_vs_favour
-- 	},
-- 	ares = {
-- 		loc_key = "troy_gods_tooltip_ares_gain_battle_1",
-- 		value = pyrrhic_victory_favour
-- 	},
-- 	apollo = {
-- 		loc_key = "troy_gods_tooltip_apollo_gain_battle_1",
-- 		value = defender_victory_favour
-- 	},
-- 	athena = {
-- 		loc_key = "troy_gods_tooltip_athena_gain_battle_1",
-- 		value = decisive_victory_favour
-- 	},
-- 	poseidon = {
-- 		loc_key = "troy_gods_tooltip_Poseidon_gain_battle_1",
-- 		value = naval_battle_favour
-- 	},
-- }

-- gain_battle_2 = {
-- 	zeus = {
-- 		loc_key = "troy_gods_tooltip_zeus_gain_battle_2",
-- 		value = victory_favour
-- 	},
-- }

-- gain_campaign_1 = {
-- 	hera = {
-- 		loc_key = "troy_gods_tooltip_hera_gain_campaign_1",
-- 		value = region_captured_favour
-- 	},
-- 	zeus = {
-- 		loc_key = "troy_gods_tooltip_zeus_gain_campaign_1",
-- 		value = faction_overcome_favour
-- 	},
-- 	ares = {
-- 		loc_key = "troy_gods_tooltip_ares_gain_campaign_1",
-- 		value = war_declaration_favour
-- 	},
-- 	apollo = {
-- 		loc_key = "troy_gods_tooltip_apollo_gain_campaign_1",
-- 		value = trade_agreement_established_favour
-- 	},
-- 	athena = {
-- 		loc_key = "troy_gods_tooltip_athena_gain_campaign_1",
-- 		value = peace_treaty_signed_favour
-- 	},
-- 	poseidon = {
-- 		loc_key = "troy_gods_tooltip_Poseidon_gain_campaign_1",
-- 		value = city_razed_favour
-- 	},
-- 	aphrodite = {
-- 		loc_key = "troy_gods_tooltip_aphrodite_gain_campaign_1",
-- 		value = agent_created_favour
-- 	},
-- }

-- gain_campaign_2 = {
-- 	hera = {
-- 		loc_key = "troy_gods_tooltip_hera_gain_campaign_2",
-- 		value = province_completed_favour
-- 	},
-- 	apollo = {
-- 		loc_key = "troy_gods_tooltip_apollo_gain_campaign_2",
-- 		value = trade_agreement_established_favour / 2
-- 	},
-- 	athena = {
-- 		loc_key = "troy_gods_tooltip_athena_gain_campaign_2",
-- 		value = peace_treaty_signed_favour / 2
-- 	},
-- 	aphrodite = {
-- 		loc_key = "troy_gods_tooltip_aphrodite_gain_campaign_2",
-- 		value = character_created_favour
-- 	},
-- }

-- gain_campaign_3 = {
-- 	aphrodite = {
-- 		loc_key = "troy_gods_tooltip_aphrodite_gain_campaign_3",
-- 		value = agent_action_actor_favour
-- 	},
-- }

-- gain_agent_1 = {
-- 	hera = {
-- 		loc_key = "troy_gods_tooltip_hera_gain_agent_1",
-- 		value = "15 to 40"
-- 	},
-- 	zeus = {
-- 		loc_key = "troy_gods_tooltip_zeus_gain_agent_1",
-- 		value = "15 to 40"
-- 	},
-- 	ares = {
-- 		loc_key = "troy_gods_tooltip_ares_gain_agent_1",
-- 		value = "15 to 40"
-- 	},
-- 	apollo = {
-- 		loc_key = "troy_gods_tooltip_apollo_gain_agent_1",
-- 		value = "15 to 40"
-- 	},
-- 	athena = {
-- 		loc_key = "troy_gods_tooltip_athena_gain_agent_1",
-- 		value = "15 to 40"
-- 	},
-- 	poseidon = {
-- 		loc_key = "troy_gods_tooltip_Poseidon_gain_agent_1",
-- 		value = "15 to 40"
-- 	},
-- 	aphrodite = {
-- 		loc_key = "troy_gods_tooltip_aphrodite_gain_agent_1",
-- 		value = "15 to 40"
-- 	},
-- }

-- gods_panel_tooltip_loss_title = {
--	hera = { loc_key = "troy_gods_tooltip_hera_loss_title_1" },
--	zeus = { loc_key = "troy_gods_tooltip_zeus_loss_title_1" },
--	ares = { loc_key = "troy_gods_tooltip_ares_loss_title_1", },
--	apollo = { loc_key = "troy_gods_tooltip_apollo_loss_title_1" },
--	athena = { loc_key = "troy_gods_tooltip_athena_loss_title_1" },
--	poseidon = { loc_key = "troy_gods_tooltip_Poseidon_loss_title_1" },
--	aphrodite = { loc_key = "troy_gods_tooltip_aphrodite_loss_title_1" },
--	artemis = { loc_key = "troy_gods_tooltip_aphrodite_loss_title_1" }
-- }

-- loss_construction_1 = {
-- 	hera = {
-- 		loc_key = "troy_gods_tooltip_hera_loss_construction_1",
-- 		value = "-30, -10, -10"
-- 	},
-- 	zeus = {
-- 		loc_key = "troy_gods_tooltip_zeus_loss_construction_1",
-- 		value = "-30, -10, -10"
-- 	},
-- 	ares = {
-- 		loc_key = "troy_gods_tooltip_ares_loss_construction_1",
-- 		value = "-30, -10, -10"
-- 	},
-- 	apollo = {
-- 		loc_key = "troy_gods_tooltip_apollo_loss_construction_1",
-- 		value = "-30, -10, -10"
-- 	},
-- 	athena = {
-- 		loc_key = "troy_gods_tooltip_athena_loss_construction_1",
-- 		value = "-30, -10, -10"
-- 	},
-- 	poseidon = {
-- 		loc_key = "troy_gods_tooltip_Poseidon_loss_construction_1",
-- 		value = "-30, -10, -10"
-- 	},
-- 	aphrodite = {
-- 		loc_key = "troy_gods_tooltip_aphrodite_loss_construction_1",
-- 		value = "-30, -10, -10"
-- 	},
-- }

-- loss_construction_2 = {
-- 	hera = {
-- 		loc_key = "troy_gods_tooltip_hera_loss_construction_2",
-- 		value = -4
-- 	},
-- 	zeus = {
-- 		loc_key = "troy_gods_tooltip_zeus_loss_construction_2",
-- 		value = -4
-- 	},
-- 	ares = {
-- 		loc_key = "troy_gods_tooltip_ares_loss_construction_2",
-- 		value = -5
-- 	},
-- 	apollo = {
-- 		loc_key = "troy_gods_tooltip_apollo_loss_construction_2",
-- 		value = -4
-- 	},
-- 	athena = {
-- 		loc_key = "troy_gods_tooltip_athena_loss_construction_2",
-- 		value = -4
-- 	},
-- 	poseidon = {
-- 		loc_key = "troy_gods_tooltip_Poseidon_loss_construction_2",
-- 		value = -10
-- 	},
-- 	aphrodite = {
-- 		loc_key = "troy_gods_tooltip_aphrodite_loss_construction_2",
-- 		value = -2
-- 	},
-- }

-- loss_battle_1 = {
-- 	zeus = {
-- 		loc_key = "troy_gods_tooltip_zeus_loss_battle_1",
-- 		value = defeat_favour
-- 	},
-- 	ares = {
-- 		loc_key = "troy_gods_tooltip_ares_loss_battle_1",
-- 		value = close_defeat_favour
-- 	},
-- 	apollo = {
-- 		loc_key = "troy_gods_tooltip_apollo_loss_battle_1",
-- 		value = defeat_favour
-- 	},
-- 	athena = {
-- 		loc_key = "troy_gods_tooltip_athena_loss_battle_1",
-- 		value = decisive_defeat_favour
-- 	},
-- 	poseidon = {
-- 		loc_key = "troy_gods_tooltip_Poseidon_loss_battle_1",
-- 		value = defeat_naval_battle_favour
-- 	},
-- }

-- loss_campaign_1 = {
-- 	apollo = {
-- 		loc_key = "troy_gods_tooltip_apollo_loss_campaign_1",
-- 		value = trade_agreement_dissolved_favour
-- 	},
-- 	aphrodite = {
-- 		loc_key = "troy_gods_tooltip_aphrodite_loss_campaign_1",
-- 		value = -8
-- 	}
-- }

-- loss_agent_1 = {
-- 	hera = {
-- 		loc_key = "troy_gods_tooltip_hera_loss_agent_1",
-- 		value = "-15 to -40"
-- 	},
-- 	zeus = {
-- 		loc_key = "troy_gods_tooltip_zeus_loss_agent_1",
-- 		value = "-15 to -40"
-- 	},
-- 	ares = {
-- 		loc_key = "troy_gods_tooltip_ares_loss_agent_1",
-- 		value = "-15 to -40"
-- 	},
-- 	apollo = {
-- 		loc_key = "troy_gods_tooltip_apollo_loss_agent_1",
-- 		value = "-15 to -40"
-- 	},
-- 	athena = {
-- 		loc_key = "troy_gods_tooltip_athena_loss_agent_1",
-- 		value = "-15 to -40"
-- 	},
-- 	poseidon = {
-- 		loc_key = "troy_gods_tooltip_Poseidon_loss_agent_1",
-- 		value = "-15 to -40"
-- 	},
-- 	aphrodite = {
-- 		loc_key = "troy_gods_tooltip_aphrodite_loss_agent_1",
-- 		value = "-15 to -40"
-- 	}
-- }

god_names_ordered = {
	"hera",
	"zeus",
	"ares",
	"apollo",
	"athena",
	"poseidon",
	"aphrodite"
}

-- gains_ordered = {
-- 	gain_construction_1,
-- 	gain_construction_2,
-- 	gain_battle_1,
-- 	gain_battle_2,
-- 	gain_campaign_1,
-- 	gain_campaign_2,
-- 	gain_campaign_3,
-- 	gain_agent_1
-- }

-- losses_ordered = {
-- 	loss_construction_1,
-- 	loss_construction_2,
-- 	loss_battle_1,
-- 	loss_campaign_1,
-- 	loss_agent_1
-- }

---------------------------------------------
-- See troy_favour_level_effects for usage --
---------------------------------------------
zeus_bundles = {
	[3] = "effect_bundle_gods_zeus_knowing_destiny_tier_3",
	[2] = "effect_bundle_gods_zeus_knowing_destiny_tier_2",
	[1] = "effect_bundle_gods_zeus_knowing_destiny_tier_1",
	[-1] = "effect_bundle_gods_zeus_knowing_destiny_negative_tier_1",
	[-2] = "effect_bundle_gods_zeus_knowing_destiny_negative_tier_2"
}

zeus_bundles_to_effect_data = {
	effect_bundle_gods_zeus_knowing_destiny_tier_3 = {
		[1] = {
			[1] = {
				effect_key = "troy_effect_army_effect_morale_mod_all_own",
				scope_key = "faction_to_force_own_factionwide",
				value = 30
			},
			[2] = {
				effect_key = "troy_effect_army_melee_defence_mod_all",
				scope_key = "faction_to_force_own_factionwide",
				value = 30
			}
		},
		[2] = {
			[1] = {
				effect_key = "troy_effect_army_upkeep_mod_all",
				scope_key = "faction_to_force_own_factionwide",
				value = -30
			},
			[2] = {
				effect_key = "troy_effect_army_recruitment_cost_mod_all_army_units",
				scope_key = "faction_to_province_own",
				value = -30
			}
		},
		[3] = {
			[1] = {
				effect_key = "troy_effect_agent_enemy_success_rate_agent_ids",
				scope_key = "faction_to_character_enemy",
				value = -25
			},
			[2] = {
				effect_key = "troy_effect_gods_success_rate_agents",
				scope_key = "faction_to_character_own",
				value = 25
			}
		},
		[4] = {
			[1] = {
				effect_key = "troy_effect_building_cost_mod_all",
				scope_key = "faction_to_region_own",
				value = -30
			},
			[2] = {
				effect_key = "troy_effect_fm_aeneas_speak_with_dead_main_building_construction_time",
				scope_key = "faction_to_region_own",
				value = -3
			}
		}
	},
	effect_bundle_gods_zeus_knowing_destiny_tier_2 = {
		[1] = {
			[1] = {
				effect_key = "troy_effect_army_effect_morale_mod_all_own",
				scope_key = "faction_to_force_own_factionwide",
				value = 15
			},
			[2] = {
				effect_key = "troy_effect_army_melee_defence_mod_all",
				scope_key = "faction_to_force_own_factionwide",
				value = 15
			}
		},
		[2] = {
			[1] = {
				effect_key = "troy_effect_army_upkeep_mod_all",
				scope_key = "faction_to_force_own_factionwide",
				value = -15
			},
			[2] = {
				effect_key = "troy_effect_army_recruitment_cost_mod_all_army_units",
				scope_key = "faction_to_province_own",
				value = -15
			}
		},
		[3] = {
			[1] = {
				effect_key = "troy_effect_agent_enemy_success_rate_agent_ids",
				scope_key = "faction_to_character_enemy",
				value = -15
			},
			[2] = {
				effect_key = "troy_effect_gods_success_rate_agents",
				scope_key = "faction_to_character_own",
				value = 15
			}
		},
		[4] = {
			[1] = {
				effect_key = "troy_effect_building_cost_mod_all",
				scope_key = "faction_to_region_own",
				value = -15
			},
			[2] = {
				effect_key = "troy_effect_fm_aeneas_speak_with_dead_main_building_construction_time",
				scope_key = "faction_to_region_own",
				value = -2
			}
		}
	},
	effect_bundle_gods_zeus_knowing_destiny_tier_1 = {
		[1] = {
			[1] = {
				effect_key = "troy_effect_army_effect_morale_mod_all_own",
				scope_key = "faction_to_force_own_factionwide",
				value = 10
			},
			[2] = {
				effect_key = "troy_effect_army_melee_defence_mod_all",
				scope_key = "faction_to_force_own_factionwide",
				value = 10
			}
		},
		[2] = {
			[1] = {
				effect_key = "troy_effect_army_upkeep_mod_all",
				scope_key = "faction_to_force_own_factionwide",
				value = -10
			},
			[2] = {
				effect_key = "troy_effect_army_recruitment_cost_mod_all_army_units",
				scope_key = "faction_to_province_own",
				value = -10
			}
		},
		[3] = {
			[1] = {
				effect_key = "troy_effect_agent_enemy_success_rate_agent_ids",
				scope_key = "faction_to_character_enemy",
				value = -10
			},
			[2] = {
				effect_key = "troy_effect_gods_success_rate_agents",
				scope_key = "faction_to_character_own",
				value = 10
			}
		},
		[4] = {
			[1] = {
				effect_key = "troy_effect_building_cost_mod_all",
				scope_key = "faction_to_region_own",
				value = -10
			},
			[2] = {
				effect_key = "troy_effect_fm_aeneas_speak_with_dead_main_building_construction_time",
				scope_key = "faction_to_region_own",
				value = -1
			}
		}
	},
	effect_bundle_gods_zeus_knowing_destiny_negative_tier_1 = {
		[1] = {
			[1] = {
				effect_key = "troy_effect_army_effect_morale_mod_all_own",
				scope_key = "faction_to_force_own_factionwide",
				value = -15
			},
			[2] = {
				effect_key = "troy_effect_army_melee_defence_mod_all",
				scope_key = "faction_to_force_own_factionwide",
				value = -15
			}
		},
		[2] = {
			[1] = {
				effect_key = "troy_effect_army_upkeep_mod_all",
				scope_key = "faction_to_force_own_factionwide",
				value = 15
			},
			[2] = {
				effect_key = "troy_effect_army_recruitment_cost_mod_all_army_units",
				scope_key = "faction_to_province_own",
				value = 15
			}
		},
		[3] = {
			[1] = {
				effect_key = "troy_effect_agent_enemy_success_rate_agent_ids",
				scope_key = "faction_to_character_enemy",
				value = 15
			},
			[2] = {
				effect_key = "troy_effect_gods_success_rate_agents",
				scope_key = "faction_to_character_own",
				value = -15
			}
		},
		[4] = {
			[1] = {
				effect_key = "troy_effect_building_cost_mod_all",
				scope_key = "faction_to_region_own",
				value = 15
			},
			[2] = {
				effect_key = "troy_effect_fm_aeneas_speak_with_dead_main_building_construction_time",
				scope_key = "faction_to_region_own",
				value = 2
			}
		}
	},
	effect_bundle_gods_zeus_knowing_destiny_negative_tier_2 = {
		[1] = {
			[1] = {
				effect_key = "troy_effect_army_effect_morale_mod_all_own",
				scope_key = "faction_to_force_own_factionwide",
				value = -30
			},
			[2] = {
				effect_key = "troy_effect_army_melee_defence_mod_all",
				scope_key = "faction_to_force_own_factionwide",
				value = -30
			}
		},
		[2] = {
			[1] = {
				effect_key = "troy_effect_army_upkeep_mod_all",
				scope_key = "faction_to_force_own_factionwide",
				value = 30
			},
			[2] = {
				effect_key = "troy_effect_army_recruitment_cost_mod_all_army_units",
				scope_key = "faction_to_province_own",
				value = 30
			}
		},
		[3] = {
			[1] = {
				effect_key = "troy_effect_agent_enemy_success_rate_agent_ids",
				scope_key = "faction_to_character_enemy",
				value = 25
			},
			[2] = {
				effect_key = "troy_effect_gods_success_rate_agents",
				scope_key = "faction_to_character_own",
				value = -25
			}
		},
		[4] = {
			[1] = {
				effect_key = "troy_effect_building_cost_mod_all",
				scope_key = "faction_to_region_own",
				value = 30
			},
			[2] = {
				effect_key = "troy_effect_fm_aeneas_speak_with_dead_main_building_construction_time",
				scope_key = "faction_to_region_own",
				value = 3
			}
		}
	}
}
--zeus_random_drop_amount = -15 -- amount of favour a random god loses from Zeus's negative 2 tier effect
aphrodite_bundles = {} -- table of effect bundles applied to province capital of fully owned provinces
aphrodite_bundles[3] = "effect_bundle_gods_aphrodite_favour_tier_3_HIDDEN"
aphrodite_bundles[2] = "effect_bundle_gods_aphrodite_favour_tier_2_HIDDEN"
aphrodite_bundles[1] = "effect_bundle_gods_aphrodite_favour_tier_1_HIDDEN"
aphrodite_bundles[-1] = "effect_bundle_gods_aphrodite_favour_negative_tier_1_HIDDEN"
aphrodite_bundles[-2] = "effect_bundle_gods_aphrodite_favour_negative_tier_2_HIDDEN"
port_buildings =
{
	"troy_main_ody_port_1",
	"troy_main_ody_port_2",
	"troy_main_ody_port_3",
	"troy_main_ody_port_4",
	"troy_main_ody_port_5",
	"troy_main_ody_port_ruins",
	"troy_main_port_1",
	"troy_main_port_2",
	"troy_main_port_3",
	"troy_main_port_ruins",
	"troy_main_special_ithaca_port_1",
	"troy_main_special_ithaca_port_2",
	"troy_main_special_ithaca_port_3",
	"troy_main_special_ithaca_port_4",
	"troy_main_special_ithaca_port_5",
	"troy_main_special_ithaca_port_ruins"
} -- table of building level keys used to identify port regions

-----------------------
---Faction mechanics---
-----------------------

---------------------------------------------
-- See troy_achilles_hot_blooded for usage --
---------------------------------------------


---------------------------------------------
-- See troy_faction_mechanics_ui for usage --
---------------------------------------------
ui_root = "" -- empty holder of the ui root object
faction_mechanics_containers =
{
	troy_main_dan_mycenae = {"fm_offices_container","fm_demand_tribute_container", "fm_mythic_monsters_progression"},
	troy_main_dan_ithaca = {"fm_supply_bases_container", "fm_mythic_monsters_progression"},
	troy_main_dan_sparta = {"fm_reliable_friend_container", "fm_spartan_settlers_container", "fm_mythic_monsters_progression"},
	troy_main_dan_achilles = {"fm_hot_blooded_container","fm_greatest_warrior_container", "fm_mythic_monster_selection", "fm_mythic_monsters_progression" },
	troy_main_trj_hector = {"fm_trojan_alliance_container", "fm_priam_benevolence_container", "fm_mythic_monsters_progression"},
	troy_main_trj_paris = {"fm_priam_benevolence_container","fm_paris_helen_container", "fm_mythic_monsters_progression"},
	troy_main_trj_dardania = {"fm_divine_missions_container","fm_speak_with_dead_container", "fm_mythic_monsters_progression"},
	troy_main_trj_lycia = {"fm_luxury_goods_container","fm_lycian_trade_guild_container", "fm_mythic_monsters_progression"},
	troy_amazons_trj_hippolyta = {"fm_amazon_kingdom_container","fm_amazon_unit_upgrades_container_hippolyta", "fm_mythic_monsters_progression"},
	troy_amazons_trj_penthesilea = {"fm_amazon_horde_container","fm_amazon_unit_upgrades_container_penny","fm_capture_bonus_container", "fm_mythic_monsters_progression"},
	troy_main_dan_argos = {"fm_dio_military_strategy_container", "fm_dio_champions_container", "fm_mythic_monsters_progression"},
	troy_main_dan_salamis = {"fm_ajax_renown_container", "fm_ajax_champions_container", "fm_mythic_monsters_progression"},
	troy_rem_trj_thrace = {"fm_rhes_thracian_rituals_container", "fm_rhes_countless_host_container"},
	troy_rem_horde_aethiopians = {"fm_memnon_pharaohs_servant_container", "fm_memnon_exotic_strategist_container", "fm_capture_bonus_container"},


	-- troy_amazons_trj_penthesilea = {"fm_momentum_panel", {
	--														 component = "fm_penthesilea_momentum",
	--														 src_path = "ui/campaign ui/fm_penthesilea_momentum",
	--														 target_path = {"hud_campaign","faction_widget"}
	--													 }}
}   -- table of factions and the respective buttons for faction mechanics

faction_mechanics_ui_resources =
{
	troy_amazons_trj_hippolyta = {"troy_culture"},
	troy_rem_trj_thrace = {"troy_rem_rhesos_devotion"},
	phar_main_ramesses = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	phar_main_seti = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	phar_main_tausret = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	phar_main_amenmesse = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	phar_main_irsu = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	phar_main_bay = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	phar_main_suppiluliuma = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	phar_main_kurunta = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	phar_sea_peleset = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "phar_sea_blades_points", "phar_sea_dwelling_points", "troy_dominance",},
	phar_sea_sherden = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "phar_sea_blades_points", "phar_sea_dwelling_points", "troy_dominance",},
	phar_map_ninurta = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	phar_map_babylon = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	troy_main_dan_mycenae = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	troy_main_trj_troy = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
-------- Minor Factions ---------
	phar_main_alashiya = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	phar_main_ashkelon = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	phar_main_bahariya = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	phar_main_byblos = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	phar_main_carchemish = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	phar_main_damascus = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	phar_main_dungul = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	phar_main_emar = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	phar_main_malidiya = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	phar_main_merneptah = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	phar_main_napata = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	phar_main_setnakhte = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	phar_main_ugarit = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	phar_map_assyria = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	phar_map_igihalkid = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	phar_map_lullubi = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	phar_map_sangarian_phrygians = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	phar_map_shubru = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	phar_map_sutu = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	troy_amazons_trj_hippolyta = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	troy_main_dan_achilles = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	troy_main_dan_boeotians = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	troy_main_dan_ithaca = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	troy_main_trj_lycia = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
	troy_rem_trj_thrace = {"phar_legitimacy", "phar_hatti_legitimacy", "phar_map_aegean_legitimacy", "phar_map_mesopotamian_legitimacy", "phar_eminence", "troy_dominance",},
} -- table of factions and the respective pooled resources for faction mechanics. Include only those that you want to be in the resource bar.

faction_mechanics_buttons =
{
	--troy_main_dan_mycenae = {"button_fm_offices", "button_fm_demand_tribute", "button_fm_mythic_monsters_progression"},
	--troy_main_dan_ithaca = {"button_fm_supply_bases", "button_fm_mythic_monsters_progression"},
	--troy_main_dan_sparta = {"button_fm_reliable_friend", "button_fm_spartan_settlers", "button_fm_mythic_monsters_progression"},
	--troy_main_dan_achilles = {"button_fm_hot_blooded","button_fm_greatest_warrior", "button_fm_mythic_monsters_progression"},
	--troy_main_trj_hector = {"button_fm_trojan_alliance", "button_fm_priam_benevolence", "button_fm_mythic_monsters_progression"},
	--troy_main_trj_paris = {"button_fm_priam_benevolence","button_fm_paris_helen", "button_fm_mythic_monsters_progression"},
	--troy_main_trj_dardania = {"button_fm_divine_missions","button_fm_speak_with_dead", "button_fm_mythic_monsters_progression"},
	--troy_main_trj_lycia = {"button_fm_luxury_goods","button_fm_lycian_trade_guild", "button_fm_mythic_monsters_progression"},
	--troy_amazons_trj_hippolyta = {"button_fm_amazon_kingdom", "button_fm_amazon_unit_upgrades_hippolyta", "button_fm_mythic_monsters_progression"},
	--troy_amazons_trj_penthesilea = {"button_fm_amazon_horde","button_fm_amazon_unit_upgrades_penny","button_fm_capture_bonus", "button_fm_mythic_monsters_progression"},
	--troy_main_dan_argos = {"button_fm_dio_military_strategy", "button_fm_dio_champions", "button_fm_mythic_monsters_progression"},
	--troy_main_dan_salamis = {"button_fm_ajax_renown", "button_fm_ajax_champions", "button_fm_mythic_monsters_progression"},
	--troy_rem_trj_thrace = {"button_fm_rhes_thracian", "button_fm_rhes_countless"},
	--troy_rem_horde_aethiopians = {"button_fm_memnon_pharaohs", "button_fm_memnon_exotic", "button_fm_capture_bonus"},

	-- troy_amazons_trj_penthesilea = {"fm_momentum_panel", {
	--														 component = "fm_penthesilea_momentum",
	--														 src_path = "ui/campaign ui/fm_penthesilea_momentum",
	--														 target_path = {"hud_campaign","faction_widget"}
	--													 }}
}

faction_mechanics_button_tooltips = {
	troy_amazons_trj_penthesilea = { button_fm_capture_bonus = "ui_text_replacements_localised_text_frontend_pen_fm_horde_2_2" },
	troy_rem_horde_aethiopians = { button_fm_capture_bonus = "ui_text_replacements_localised_text_frontend_rem_memnon_fm_horde_2_2" },
}

-- TODO: move what we need here to the system in phar_ancient_legacy_common and remove the rest
pharaoh_mechanics =
{
	fm_phar_ancient_legacies_container = "button_fm_phar_ancient_legacies",
	fm_reliable_friend_container = "button_fm_reliable_friend",
	fm_spartan_settlers_container = "button_fm_spartan_settlers",
	fm_divine_missions_container = "button_fm_divine_missions",
	fm_luxury_goods_container = "button_fm_luxury_goods",
	fm_phar_khufu_container = "button_fm_phar_khufu",
	fm_phar_hatchepsut_container = "button_fm_phar_hatchepsut",
	fm_phar_thutmose_container = "button_fm_phar_thutmose",
	fm_phar_tudhaliya_container = "button_fm_phar_tudhaliya",
	fm_phar_muwatalli_container = "button_fm_phar_muwatalli",
	fm_phar_akhenaten_container = "button_fm_phar_akhenaten",
	fm_phar_perseus_container = "button_fm_phar_perseus",
	fm_phar_atreus_container = "button_fm_phar_atreus",
	fm_sea_eminence_container = "button_sea_eminence",
	fm_phar_hammurabi_container = "button_fm_phar_hammurabi",
	fm_phar_sargon_container = "button_fm_phar_sargon",
}

mythic_faction_mechanics_containers =
{
	fm_mythic_monster = {
		"button_fm_mythic_monster_selection",
		"button_fm_mythic_monster_expedition",
		"button_fm_mythic_monster_progression"
	},
}


---------------------
---Realms mechanic---
---------------------

-------------------------------
-- See troy_realms for usage --
-------------------------------

troy_realms = {
	troy_main_ida_knossos =
	{
		regions =
		{
			"troy_main_madares_aptera",
			"troy_main_madares_kissamos",
			"troy_main_madares_kydonia",
			"troy_main_madares_lappa",
			"troy_main_ida_gortys",
			"troy_main_ida_lyttos",
			"troy_main_ida_phaestos",
			"troy_main_lasynthos_lato",
			"troy_main_lasynthos_setaea"
		},
		trait = "troy_trait_anax_of_crete"
	},
	troy_main_mycenaeca_mycenae =
	{
		regions = {
			"troy_main_mycenaeca_corinth",
			"troy_main_mycenaeca_stymphalos",
			"troy_main_tyrinthia_epidayrus",
			"troy_main_tyrinthia_troizen",
			"troy_main_tyrinthia_tiryns"
		},
		trait = "troy_trait_anax_of_mycenae"
	},
	troy_main_argolis_argos =
	{
		regions = {
			"troy_main_argolis_erchomenos",
			"troy_main_argolis_thyrea",
			"troy_main_messenia_tegea",
			"troy_main_messenia_mantineia",
			"troy_main_aegialeia_cleitor"
		},
		trait = "troy_rem_trait_anax_of_argos"
	},
	troy_main_edonis_aesyme =
	{
		regions = {
			"troy_main_sintice_siris",
			"troy_main_sintice_heraclea_sintica",
			"troy_main_sintice_berge",
			"troy_main_edonis_antissara",
			"troy_main_thrace_abdera",
			"troy_main_thrace_ismaros",
			"troy_main_thrace_zerynthos"
		},
		trait = "troy_rem_trait_anax_of_thrace"
	},
	troy_main_euboea_eretria =
	{
		regions = {
			"troy_main_ellopia_histiaea",
			"troy_main_ellopia_cerinthos",
			"troy_main_euboea_chalcis",
			"troy_main_euboea_carystos"
		},
		trait = "troy_trait_anax_of_euboea"
	},
	troy_main_boeotia_thebes =
	{
		regions = {
			"troy_main_boeotia_hyria",
			"troy_main_boeotia_oropos",
			"troy_main_boeotia_thisbe",
			"troy_main_cephisos_gla",
			"troy_main_cephisos_opous",
		},
		trait = "troy_trait_anax_of_boeotia"
	},
	troy_main_attica_athens =
	{
		regions = {
			"troy_main_attica_keos",
			"troy_main_attica_marathon",
			"troy_main_attica_thorikos",
			"troy_main_megaris_megara",
			"troy_main_megaris_salamis",
			"troy_main_megaris_aegina"
			},
		trait = "troy_trait_anax_of_attica"
	},
	troy_main_oylympos_larissa =
	{
		regions = {
			"troy_main_magnesia_meliboea",
			"troy_main_magnesia_iolcos",
			"troy_main_magnesia_olizon",
			"troy_main_perrhaebia_tricca",
			"troy_main_perrhaebia_oechalia",
			"troy_main_thessaliotis_arne",
			"troy_main_thessaliotis_crannon",
			"troy_main_thessaliotis_pharsalos",
			"troy_main_phthia_pherae"
			},
		trait = "troy_trait_anax_of_thessalia"
	},
	troy_main_ilion_troy =
	{
		regions = {
		   "troy_main_ilion_thymbra",
		   "troy_main_troas_larisa",
		   "troy_main_troas_hamaxitos",
		   "troy_main_troas_colonae",
		   "troy_main_ide_antandros",
		   "troy_main_ide_zeleia",
		   "troy_main_ide_gargara"
			},
		trait = "troy_trait_anax_of_troada"
	},
	troy_main_melas_sestos =
	{
		regions = {
			"troy_main_mysia_proconnesos",
			"troy_main_melas_pactya",
			"troy_main_apaesos_percote",
			"troy_main_apaesos_priapos",
			"troy_main_thynia_derkos",
			"troy_main_thynia_athyra",
			"troy_main_bythynia_procerastis"
			},
		trait = "troy_trait_anax_of_hellespontos"
	},
	troy_main_rhodes_ialysos =
	{
		regions = {
			"troy_main_rhodes_kameiros",
			"troy_main_rhodes_lindos",
			"troy_main_krapathos_arcasia",
			"troy_main_isthmos_kaunos",
			"troy_main_isthmos_knidos",
			"troy_main_isthmos_physkos"
			},
		trait = "troy_trait_anax_of_rhodes"
	},
	troy_main_latmos_milethus =
	{
		regions = {
			"troy_main_latmos_heracleia",
			"troy_main_latmos_priene",
			"troy_main_kaystros_ephesos",
			"troy_main_kaystros_claros",
			"troy_main_kaystros_colophon"
			},
		trait = "troy_trait_anax_of_miletus"
	},
	troy_main_cyclades_naxos =
	{
		regions = {
			"troy_main_cyclades_ios",
			"troy_main_cyclades_minoa",
			"troy_main_cyclades_paros",
			"troy_main_syrmata_melos",
			"troy_main_syrmata_meropia"
			},
		trait = "troy_trait_anax_of_cyclades"
	}
} -- table of all Realms - every table is named after the capital of the realm and contains the associated region keys and trait key

troy_realm_title_gained_event_title = "event_feed_strings_text_troy_scripted_event_realm_title_gained"
troy_realm_title_gained_event_primary_detail = ""
troy_realm_title_gained_event_secondary_detail = "" -- now we use the trate name
troy_realm_title_gained_is_event_persistent = true
troy_realm_title_gained_event_end_callback = nil
troy_realm_title_gained_event_delay = 0
troy_realm_title_gained_event_suppress_whitelist = false

troy_realm_title_gained_event_pic = {
	default = 1030,
	troy_amazons_trj_hippolyta = 1032
}

troy_realm_title_lost_event_title = "event_feed_strings_text_troy_scripted_event_realm_title_lost"
troy_realm_title_lost_event_primary_detail = ""
troy_realm_title_lost_event_secondary_detail = "" -- now we use the trate name
troy_realm_title_lost_is_event_persistent = true
troy_realm_title_lost_event_end_callback = nil
troy_realm_title_lost_event_delay = 0
troy_realm_title_lost_event_suppress_whitelist = false

troy_realm_title_lost_event_pic = {
	default = 1035,
	troy_amazons_trj_hippolyta = 1033
}
-------------------------
---Experience triggers---
-------------------------

---------------------------------------------
-- See troy_experience_triggers for usage --
---------------------------------------------

-- Whether to give experience to replaced starting generals.
is_xp_gained_by_replaced_starting_generals = false

-- amount of experience to give for battle results
-- The values before the division are used in previous games. The divided values are meant for Troy.
xp_battle_defeat_crushing						= 200 / 2
xp_battle_defeat								= 400 / 2
xp_battle_defeat_valiant						= 600 / 2
xp_battle_victory_pyrrhic						= 600 / 2
xp_battle_victory								= 1000 / 2
xp_battle_victory_heroic						= 1400
xp_battle_victory_ambush						= 400	-- this is added on top of the above values if the battle was an ambush
xp_battle_modifier_hero							= 1		-- this is the modifier to the above values when the participating character is a Hero(agent)
xp_battle_modifier_secondary_general			= 0.5	/ 2 -- this is the modifier to the above values when the participating character is a reinforcing Lord

-- amount of experience to give Generals
xp_general_is_garrisoned 						= 100 / 4
--xp_general_is_raiding 							= 200 / 3 -- this has been moved to a scripted bonus value.
xp_general_completes_horde_building 			= 200 / 2
xp_general_occupies_settlement					= 200
xp_general_razes_settlement						= 200
xp_general_modifier_athena_negative_2			= 0.5
xp_general_modifier_athena_positive_2			= 1.15
xp_general_modifier_athena_positive_3			= 1.4
xp_general_ends_turn_enemy_territory			= 10
xp_general_ers_interaction_experience			= 0

-- amount of experience to give Agents
xp_hero_is_active	 							= 50
xp_hero_is_embedded 							= 100

xp_hero_target_settlement_fail_critical			= 200
xp_hero_target_settlement_fail					= 400
xp_hero_target_settlement_fail_opportune		= 600
xp_hero_target_settlement_success				= 1200

xp_hero_target_army_fail_critical				= 200
xp_hero_target_army_fail						= 400
xp_hero_target_army_fail_opportune				= 600
xp_hero_target_army_success						= 1200

xp_hero_target_character_fail_critical			= 200
xp_hero_target_character_fail					= 400
xp_hero_target_character_fail_opportune			= 600
xp_hero_target_character_success				= 1000
xp_hero_target_character_success_critical		= 1600
xp_hero_target_character_success_bonus_10		= 300	-- this is added if the assassination target is > rank 10
xp_hero_target_character_success_bonus_20		= 600	-- this is added if the assassination target is > rank 20
xp_hero_modifier_apollo_negative_2			  = 0		-- this is used when the faction is in Apollo's negative 2 tier
xp_hero_modifier_apollo_positive_2				= 1.25
xp_hero_modifier_apollo_positive_3				= 1.5
xp_hero_target_own_settlement_target_multiplier = 0.5

-- experience modifier for battles and agent actions against rebel factions
xp_modifier_rebel_debuff						= 0.2

-- table of agent types for which to provide post battle experience
xp_agent_types_gaining_battle_experience = {
	wizard = true,
}

-------------------------------
--- Factions effect bundles ---
-------------------------------

------------------------------------------------
-- See troy_factions_effects_loader for usage --
------------------------------------------------

-- Table containing all factions that have special effects
factions_effects = {
	phar_sea_denyen = {
		"phar_main_effect_bundle_pillars_civilization_sea_peoples_attrition",
	},
	phar_sea_shekelesh = {
		"phar_main_effect_bundle_pillars_civilization_sea_peoples_attrition",
	},
	phar_sea_weshesh = {
		"phar_main_effect_bundle_pillars_civilization_sea_peoples_attrition",
	},
	phar_sea_tjeker = {
		"phar_main_effect_bundle_pillars_civilization_sea_peoples_attrition",
	},
	phar_sea_teresh = {
		"phar_main_effect_bundle_pillars_civilization_sea_peoples_attrition",
	},
	phar_sea_ekwesh = {
		"phar_main_effect_bundle_pillars_civilization_sea_peoples_attrition",
	},
	phar_sea_lukka = {
		"phar_main_effect_bundle_pillars_civilization_sea_peoples_attrition",
	},
}


--------------------------
--- Wrath of Posseidon ---
--------------------------

---------------------------------------
-- See troy_campaign_setup for usage --
---------------------------------------

wrath_of_posseidon_flavour_incident_turn = 20
wrath_of_posseidon_flavour_incident_key = "troy_main_incident_wrath_of_posseidon_flavour"

wrath_of_posseidon_warning_incident_turn = 0 -- To be populated by client script later
wrath_of_posseidon_warning_incident_key = "troy_main_incident_wrath_of_posseidon_warning"
wrath_of_posseidon_warning_incident_turn_low_bound = 25
wrath_of_posseidon_warning_incident_turn_high_bound = 28

wrath_of_posseidon_earthquake_incident_key = "troy_main_incident_wrath_of_posseidon_earthquake"
wrath_of_posseidon_earthquake_incident_turn = 0 -- To be populated by client script later
wrath_of_posseidon_earthquake_previous_incident_turn = 0 -- To be populated by client script later
wrath_of_posseidon_earthquake_incident_has_fired = false
wrath_of_posseidon_earthquake_incident_turn_low_bound = 30
wrath_of_posseidon_earthquake_incident_turn_high_bound = 35
wrath_of_posseidon_earthquake_incident_target_building = "troy_main_special_troy_troy"
wrath_of_posseidon_earthquake_incident_garrison_damage_amount = 0.85
wrath_of_posseidon_earthquake_incident_duration = 5
wrath_of_posseidon_earthquake_incident_duration_delay = 0
wrath_of_posseidon_earthquake_incident_target_region = "troy_main_ilion_troy"
wrath_of_posseidon_earthquake_incident_target_effect_bundle = "troy_main_effect_bundle_region_walls_demolished"
wrath_of_posseidon_earthquake_incident_target_battle_override_base = "troy_major_troy_v2"
wrath_of_posseidon_earthquake_incident_target_battle_override_suffix = "_earthquake"
wrath_of_posseidon_earthquake_incident_target_battle_override = wrath_of_posseidon_earthquake_incident_target_battle_override_base .. wrath_of_posseidon_earthquake_incident_target_battle_override_suffix
wrath_of_posseidon_earthquake_incident_over_key = "troy_main_incident_wrath_of_posseidon_earthquake_over"

----------------------
--- Odysseus' Ruse ---
----------------------

---------------------------------------
-- See troy_campaign_setup for usage --
---------------------------------------

odysseus_faction = "troy_main_dan_ithaca"
odysseus_subtype = "troy_odysseus"
odysseus_ruse_hint_incident_key = "troy_main_incident_odysseus_ruse_hint"
odysseus_ruse_hint_incident_shown_bool = false
odysseus_ruse_hint_confederation_key = "troy_main_incident_odysseus_ruse_hint"
odysseus_ruse_hint_confederation_shown_bool = false
odysseus_ruse_target_region = "troy_main_ilion_troy"
odysseus_ruse_dilemma_key = "troy_main_dilemma_ruse_troy_besieged"
odysseus_ruse_dilemma_key_confederated = "troy_main_dilemma_odysseus_ruse_troy_besieged"
odysseus_ruse_should_show_ui = false
odysseus_ruse_faction_name = ""
odysseus_ruse_notification_incident_key = "troy_main_incident_odysseus_ruse_available"
odysseus_ruse_turn_to_allow = -1
odysseus_ruse_mf_cqi = 0
odysseus_ruse_is_active = false
odysseus_ruse_target_battle_override = "troy_major_troy_v2"
odysseus_ruse_target_battle_time_of_day = "night"
odysseus_ruse_target_debuff_bundle = "effect_bundle_odysseus_ruse_troy_debuffs"

-----------------------------
--- Story/sandbox dilemma ---
-----------------------------

---------------------------------------
-- See troy_campaign_setup for usage --
---------------------------------------

story_dilemma_initial_trigger_done = false
story_dilemma_initial_key = {
	troy_main_clt_danaans 	= "troy_story_dilemma_danaans",
	troy_main_clt_trojans 	= "troy_story_dilemma_trojans",
	troy_rem_clt_thraco_phrygians 	= "troy_story_dilemma_trojans"
}
story_dilemma_secondary_trigger_turn = 99999
story_dilemma_secondary_trigger_delay_turns = 3
story_dilemma_secondary_trigger_done = false
story_dilemma_secondary_key = {
	troy_main_clt_danaans 	= "troy_story_dilemma_danaans_2",
	troy_main_clt_trojans 	= "troy_story_dilemma_trojans_2",
	troy_rem_clt_thraco_phrygians 	= "troy_story_dilemma_trojans_2"
}
story_dilemma_player_chose_story = false
story_dilemma_faithful_ally_factions = {
	troy_main_clt_danaans 	= {
		troy_main_dan_arcadians = true,
		--troy_main_dan_argos = true,
		troy_main_dan_pylos = true, 
		--troy_main_dan_salamis = true
	},
	troy_main_clt_trojans 	= {
		troy_main_trj_aegaan_pel = true,
		troy_main_trj_ilion = true,
		troy_main_trj_imbrasos = true,
		troy_main_trj_troy = true,
		troy_main_trj_aethria = true,
	}
}

---------------------------------------
--  Stealing the Palladium variables --
-- See troy_campaign_setup for usage --
---------------------------------------

troy_adi_palladium_vars = {
	stealing_the_palldium_triggered = false,
	palladium_stolen = false,
	palladium_stolen_by_faction = false,
	troy_region_key = "troy_main_ilion_troy",
	palladium_stolen_effect_bundle = "troy_adi_effect_bundle_palladium_stolen",
}



---------------------------------------
--  Rogue army spawning variables	--
--  Test usage via console for now   --
---------------------------------------

rogue_armies_info = {
	--[0] = {
	--	faction_key = "test_faction_key",
	--	spawn_x = 0,
	--	spawn_y = 0,
	--	level = XX,
	--	skills = { "skill_id", "skill_id", "skill_id" },
	--},
	[1] = {
		faction_key = "troy_adi_dan_achilles_champion",
		spawn_x = 300,
		spawn_y = 402,
		level = 21,
		skills = { "troy_main_hero_ability_frenzy", "troy_main_hero_ability_frenzy_spec_vigour_loss_reduction", 
		"troy_main_hero_self_vigour", 
		"troy_main_hero_self_vigour_spec_loss_reduction_charge", "troy_main_hero_campaign_recruitment_cost",
		"troy_main_hero_unit_vigour_loss_reduction", "troy_main_hero_unit_vigour_loss_reduction_spec_recovery",
		"troy_main_hero_self_melee_armour_piercing", "troy_main_hero_self_melee_armour_piercing_spec_strength",
		"troy_main_hero_ability_terrify", "troy_main_hero_ability_terrify_spec_melee_defence_reduction",
		"troy_main_hero_self_weapon_strength", "troy_main_hero_self_weapon_strength_spec_land",
		"troy_main_hero_unit_weapon_strength", "troy_main_hero_unit_weapon_strength_spec_shock",
		"troy_main_hero_campaign_sacking_razing", "troy_main_hero_self_cooldown",
		"troy_main_hero_self_cooldown_spec_cost", "troy_main_hero_ability_blind_rage",
		"troy_main_hero_ability_blind_rage_spec_damage"},
	},
	[2] = {
		faction_key = "troy_adi_dan_dionysias_champion",
		spawn_x = 524,
		spawn_y = 253,
		level = 12,
		skills = {"troy_main_hero_ability_adrenaline_rush", "troy_main_hero_ability_adrenaline_rush_spec_speed",
		"troy_main_hero_unit_recruit_rank", "troy_main_hero_self_melee_attack", "troy_main_hero_self_melee_attack_spec_spearmen",
		"troy_main_hero_campaign_post_battle", "troy_main_hero_ability_ignore_pain", "troy_main_hero_ability_ignore_pain_spec_heal",
		"troy_main_hero_self_leadership", "troy_main_hero_self_leadership_spec_unwavering", "troy_main_hero_unit_melee_defence"},
	},
	[3] = {
		faction_key = "troy_adi_dan_noagria_champion",
		spawn_x = 461,
		spawn_y = 324,
		level = 11,
		skills = {"troy_main_hero_ability_dread_of_ares", "troy_main_hero_ability_dread_of_ares_spec_melee_attack",
		"troy_main_hero_unit_recruit_rank", "troy_main_hero_self_melee_defence",
		"troy_main_hero_self_melee_defence_spec_melee_defence", "troy_main_hero_campaign_agent_recruitment_rank",
		"troy_main_hero_ability_throw_rock", "troy_main_hero_ability_throw_rock_spec_area",
		"troy_main_hero_self_leadership", "troy_main_hero_self_leadership_spec_cause_terror"},

	},
	[4] = {
		faction_key = "troy_adi_dan_knossos_champion",
		spawn_x = 505,
		spawn_y = 58,
		level = 13,
		skills = {"troy_main_hero_ability_set_example", "troy_main_hero_ability_set_example_spec_twice",
		"troy_main_hero_self_melee_defence", "troy_main_hero_self_melee_defence_spec_melee_defence",
		"troy_main_hero_unit_vigour_loss_reduction", "troy_main_hero_unit_vigour_loss_reduction_spec_recovery",
		"troy_main_hero_campaign_income_raiding_attrition", "troy_main_hero_unit_range",
		"troy_main_hero_unit_range_spec_javelins", "troy_main_hero_self_ranged_attack",
		"troy_main_hero_self_ranged_attacks_spec_damage", "troy_main_hero_ability_throw_rock"},
	},
	[5] = {
		faction_key = "troy_adi_dan_pylos_champion",
		spawn_x = 279,
		spawn_y = 230,
		level = 5,
		skills = {"troy_main_hero_ability_find_cover", "troy_main_hero_ability_find_cover_spec_resistance",
		"troy_main_hero_self_melee_defence", "troy_main_hero_self_melee_defence_spec_melee_defence"},
	},
	[6] = {
		faction_key = "troy_adi_dan_esperia_champion",
		spawn_x = 267,
		spawn_y = 358,
		level = 8,
		skills = {"troy_main_hero_ability_batter", "troy_main_hero_ability_batter_spec_armour_piercing",
		"troy_main_hero_self_melee_attack", "troy_main_hero_self_melee_attack_spec_swordsmen",
		"troy_main_hero_unit_vigour_loss_reduction", "troy_main_hero_unit_vigour_loss_reduction_spec_recovery",
		"troy_main_hero_campaign_casualties_post_battle"},
	},
	[7] = {
		faction_key = "troy_adi_trj_edonia_champion",
		spawn_x = 389,
		spawn_y = 615,
		level = 8,
		skills = {"troy_main_hero_ability_frenzy", "troy_main_hero_ability_frenzy_spec_vigour_loss_reduction",
		"troy_main_hero_self_vigour", "troy_main_hero_self_vigour_spec_loss_reduction_charge",
		"troy_main_hero_campaign_recruitment_cost", "troy_main_hero_unit_vigour_loss_reduction",
		"troy_main_hero_ability_terrify"},
	},
	[8] = {
		faction_key = "troy_adi_trj_cicones_champion",
		spawn_x = 476,
		spawn_y = 619,
		level = 14,
		skills = {"troy_main_hero_ability_adrenaline_rush", "troy_main_hero_ability_adrenaline_rush_spec_speed", 
		"troy_main_hero_campaign_casualties_post_battle", "troy_main_hero_unit_vigour_loss_reduction",
		"troy_main_hero_unit_vigour_loss_reduction_spec_recovery", "troy_main_hero_self_armour",
		"troy_main_hero_self_armour_spec_missile", "troy_main_hero_campaign_recruitment_cost",
		"troy_main_hero_unit_melee_attack", "troy_main_hero_unit_melee_attack_spec_sword", 
		"troy_main_hero_campaign_income_raiding_attrition", "troy_main_hero_ability_battle_cry",
		"troy_main_hero_ability_battle_cry_spec_armour"},
	},
	[9] = {
		faction_key = "troy_adi_dan_ithaca_champion",
		spawn_x = 158,
		spawn_y = 337,
		level = 16,
		skills = {"troy_main_hero_ability_born_with_bow_spec_attack_speed", "troy_main_hero_ability_born_with_the_bow",
		"troy_main_hero_self_range", "troy_main_hero_self_range_spec_superrange",
		"troy_main_hero_unit_ammunition", "troy_main_hero_unit_ammunition_spec_armour_piercing_missile_resistance_melee",
		"troy_main_hero_campaign_casualties_post_battle", "troy_main_hero_unit_missile_damage", 
		"troy_main_hero_unit_missile_damage_spec_ranged_experience_per_turn", "troy_main_hero_unit_missile_damage_spec_ranged_experience_per_turn",
		"troy_main_hero_ability_apollos_rain", "troy_main_hero_ability_apollos_rain_spec_range",
		"troy_main_hero_unit_range", "troy_main_hero_unit_range_spec_archers", "troy_main_hero_self_missile_armour_piercing",
		"troy_main_hero_self_missile_armour_piercing_spec_strength"},
	},
	[10] = {
		faction_key = "troy_adi_dan_mycenae_champion",
		spawn_x = 338,
		spawn_y = 289,
		level = 13,
		skills = {"troy_main_hero_ability_find_cover", "troy_main_hero_ability_find_cover_spec_resistance",
		"troy_main_hero_self_vigour", "troy_main_hero_self_vigour_spec_loss_reduction_charge",
		"troy_main_hero_campaign_happiness_growth", "troy_main_hero_unit_range",
		"troy_main_hero_unit_range_spec_archers", "troy_main_hero_self_armour", 
		"troy_main_hero_self_armour_spec_missile", "troy_main_hero_unit_missile_damage",
		"troy_main_hero_unit_missile_damage_spec_ranged_experience_per_turn", "troy_main_hero_self_weapon_strength"},
	},
	[11] = {
		faction_key = "troy_adi_dan_dionysias_champion_2",
		spawn_x = 324,
		spawn_y = 244,
		level = 14,
		skills = {"troy_main_hero_ability_adrenaline_rush_spec_speed", "troy_main_hero_self_missile_damage",
		"troy_main_hero_self_missile_damage_spec_range", "troy_main_hero_unit_vigour_loss_reduction",
		"troy_main_hero_unit_vigour_loss_reduction_spec_recovery", "troy_main_hero_campaign_post_battle",
		"troy_main_hero_unit_charge", "troy_main_hero_unit_charge_spec_melee",
		"troy_main_hero_ability_precise_shot", "troy_main_hero_ability_precise_shot_spec_damage", 
		"troy_main_hero_unit_melee_attack", "troy_main_hero_unit_melee_attack_spec_sword"},
	},
	[12] = {
		faction_key = "troy_adi_trj_apsynthioi_champion",
		spawn_x = 605,
		spawn_y = 634,
		level = 20,
		skills = {"troy_main_hero_ability_cheat_hades", "troy_main_hero_ability_cheat_hades_spec_defence",
		"troy_main_hero_unit_ammunition", "troy_main_hero_unit_ammunition_spec_armour_piercing_missile_resistance_melee",
		"troy_main_hero_self_speed", "troy_main_hero_self_speed_spec_superspeed",
		"troy_main_hero_campaign_wound_recovery_enemy_agent_resistance", "troy_main_hero_unit_missile_damage",
		"troy_main_hero_unit_missile_damage_spec_ranged_experience_per_turn", "troy_main_hero_ability_multiple_shot",
		"troy_main_hero_ability_multiple_shot_spec_damage_close", "troy_main_hero_campaign_ambush_success_defence", 
		"troy_main_hero_unit_range", "troy_main_hero_unit_range_spec_archers",
		"troy_main_hero_self_vanguard", "troy_main_hero_self_vanguard_spec_stalk",
		"troy_main_hero_unit_vanguard", "troy_main_hero_unit_vanguard_spec_speed_missile",
		"troy_main_hero_ability_strafe"},
	},
	[13] = {
		faction_key = "troy_adi_dan_sparta_champion",
		spawn_x = 310,
		spawn_y = 195,
		level = 12,
		skills = {"troy_main_hero_ability_focused_strikes", "troy_main_hero_ability_focused_strikes_spec_less_reduction",
		"troy_main_hero_self_melee_defence", "troy_main_hero_self_melee_defence_spec_melee_defence",
		"troy_main_hero_unit_ammunition", "troy_main_hero_unit_ammunition_spec_attack_speed_missile_resistance_ranged",
		"troy_main_hero_campaign_income_raiding_attrition", "troy_main_hero_self_bloodthirst",
		"troy_main_hero_self_bloodthirst_spec_in_battle", "troy_main_hero_ability_throw_spear",
		"troy_main_hero_ability_throw_spear_spec_cooldown"},
	},
	[14] = {
		faction_key = "troy_adi_dan_pylos_champion_2",
		spawn_x = 248,
		spawn_y = 198,
		level = 21,
		skills = {"troy_main_hero_ability_focused_strikes", "troy_main_hero_ability_focused_strikes_spec_less_reduction",
		"troy_main_hero_self_melee_defence", "troy_main_hero_self_melee_defence_spec_melee_defence",
		"troy_main_hero_unit_ammunition", "troy_main_hero_unit_ammunition_spec_attack_speed_missile_resistance_ranged",
		"troy_main_hero_campaign_income_raiding_attrition", "troy_main_hero_self_bloodthirst",
		"troy_main_hero_self_bloodthirst_spec_in_battle", "troy_main_hero_ability_throw_spear",
		"troy_main_hero_ability_throw_spear_spec_cooldown", "troy_main_hero_self_weapon_strength",
		"troy_main_hero_self_weapon_strength_spec_land", "troy_main_hero_unit_melee_defence",
		"troy_main_hero_unit_melee_defence_spec_sword", "troy_main_hero_campaign_replenishment",
		"troy_main_hero_self_melee_armour_piercing", "troy_main_hero_self_melee_armour_piercing_spec_strength",
		"troy_main_hero_unit_speed", "troy_main_hero_unit_speed_spec_land"},
	},
	[15] = {
		faction_key = "troy_adi_dan_knossos_champion_2",
		spawn_x = 537,
		spawn_y = 62,
		level = 11,
		skills = {"troy_main_hero_ability_born_with_bow_spec_attack_speed", "troy_main_hero_ability_born_with_the_bow",
		"troy_main_hero_unit_ammunition", "troy_main_hero_self_range",
		"troy_main_hero_campaign_income_raiding_attrition", "troy_main_hero_unit_melee_defence",
		"troy_main_hero_ability_stalk", "troy_main_hero_campaign_agent_recruitment_rank", 
		"troy_main_hero_unit_range", "troy_main_hero_self_vanguard"},
	},
	[16] = {
		faction_key = "troy_adi_trj_thyni_champion",
		spawn_x = 722,
		spawn_y = 690,
		level = 15,
		skills = {"troy_main_hero_ability_batter", "troy_main_hero_ability_batter_spec_armour_piercing",
		"troy_main_hero_self_melee_attack", "troy_main_hero_self_melee_attack_spec_swordsmen",
		"troy_main_hero_unit_vigour_loss_reduction", "troy_main_hero_unit_vigour_loss_reduction_spec_recovery",
		"troy_main_hero_campaign_casualties_post_battle", "troy_main_hero_self_leadership",
		"troy_main_hero_self_leadership_spec_unwavering", "troy_main_hero_ability_challenge",
		"troy_main_hero_ability_challenge_spec_duration", "troy_main_hero_self_armour",
		"troy_main_hero_self_armour_spec_melee", "troy_main_hero_unit_melee_defence"},
	},
	[17] = {
		faction_key = "troy_adi_trj_ascanian_phry_champion",
		spawn_x = 585,
		spawn_y = 318,
		level = 18,
		skills = {"troy_main_hero_ability_seize_the_moment", "troy_main_hero_ability_seize_the_moment_spec_reduce_damage",
		"troy_main_hero_campaign_casualties_post_battle", "troy_main_hero_unit_vigour_loss_reduction",
		"troy_main_hero_unit_vigour_loss_reduction_spec_recovery", "troy_main_hero_self_armour",
		"troy_main_hero_self_armour_spec_missile", "troy_main_hero_campaign_recruitment_cost",
		"troy_main_hero_unit_melee_attack", "troy_main_hero_unit_melee_attack_spec_sword",
		"troy_main_hero_campaign_income_raiding_attrition", "troy_main_hero_ability_battle_cry",
		"troy_main_hero_ability_battle_cry_spec_armour", "troy_main_hero_unit_speed",
		"troy_main_hero_unit_speed_spec_land", "troy_main_hero_campaign_replenishment",
		"troy_main_hero_unit_weapon_strength" },
	},
	[18] = {
		faction_key = "troy_adi_trj_paeonians_champion",
		spawn_x = 233,
		spawn_y = 596,
		level = 12,
		skills = {"troy_main_hero_ability_adrenaline_rush", "troy_main_hero_unit_ammunition",
		"troy_main_hero_self_melee_attack", "troy_main_hero_campaign_agent_recruitment_rank",
		"troy_main_hero_ability_ignore_pain", "troy_main_hero_self_leadership",
		"troy_main_hero_unit_melee_defence", "troy_main_hero_self_armour",
		"troy_main_hero_campaign_income_raiding_attrition", "troy_main_hero_unit_charge",
		"troy_main_hero_ability_heroic_resolve"},
	},
	[19] = {
		faction_key = "troy_adi_dan_kyme_champion",
		spawn_x = 610,
		spawn_y = 422,
		level = 13,
		skills = {"troy_main_hero_ability_adrenaline_rush", "troy_main_hero_ability_adrenaline_rush_spec_speed",
		"troy_main_hero_self_missile_damage", "troy_main_hero_self_missile_damage_spec_range",
		"troy_main_hero_unit_vigour_loss_reduction", "troy_main_hero_unit_vigour_loss_reduction_spec_recovery", 
		"troy_main_hero_campaign_casualties_post_battle", "troy_main_hero_unit_missile_damage",
		"troy_main_hero_unit_missile_damage_spec_ranged_experience_per_turn", "troy_main_hero_ability_apollos_rain",
		"troy_main_hero_ability_apollos_rain_spec_range", "troy_main_hero_unit_range"},
	},
	[20] = {
		faction_key = "troy_adi_dan_dolopians_champion",
		spawn_x = 429,
		spawn_y = 421,
		level = 20,
		skills = {"troy_main_hero_ability_set_example", "troy_main_hero_ability_set_example_spec_twice",
		"troy_main_hero_self_melee_defence", "troy_main_hero_self_melee_defence_spec_melee_defence", 
		"troy_main_hero_unit_vigour_loss_reduction", "troy_main_hero_unit_vigour_loss_reduction_spec_recovery",
		"troy_main_hero_campaign_income_raiding_attrition", "troy_main_hero_unit_range",
		"troy_main_hero_unit_range_spec_javelins", "troy_main_hero_self_ranged_attack",
		"troy_main_hero_self_ranged_attacks_spec_damage", "troy_main_hero_ability_throw_rock", 
		"troy_main_hero_ability_throw_rock_spec_range", "troy_main_hero_campaign_recruitment_capacity",
		"troy_main_hero_self_vanguard", "troy_main_hero_self_vanguard_spec_stalk",
		"troy_main_hero_unit_leadership", "troy_main_hero_unit_leadership_spec_spears",
		"troy_dlc1_hero_campaign_razing"},
	},
	[21] = {
		faction_key = "troy_adi_trj_lycia_champion",
		spawn_x = 781,
		spawn_y = 282,
		level = 22,
		skills = {"troy_main_hero_ability_recuperate", "troy_main_hero_ability_recuperate_spec_increase_ammount",
		"troy_main_hero_self_speed", "troy_main_hero_self_speed_spec_superspeed",
		"troy_main_hero_unit_vigour_loss_reduction", "troy_main_hero_unit_vigour_loss_reduction_spec_cap",
		"troy_main_hero_campaign_wound_recovery_enemy_agent_resistance", "troy_main_hero_unit_melee_defence",
		"troy_main_hero_unit_melee_defence_spec_sword", "troy_main_hero_self_bloodthirst",
		"troy_main_hero_self_bloodthirst_spec_in_battle", "troy_main_hero_ability_care_for_fallen",
		"troy_main_hero_ability_care_for_fallen_spec_heal", "troy_main_hero_campaign_recruitment_capacity",
		"troy_main_hero_self_leadership", "troy_main_hero_self_leadership_spec_unwavering", 
		"troy_main_hero_unit_speed", "troy_main_hero_unit_speed_spec_land",
		"troy_main_hero_campaign_ambush_success_defence", "troy_main_hero_self_cooldown",
		"troy_main_hero_self_cooldown_spec_cost"},
	},
	[22] = {
		faction_key = "troy_adi_trj_penthesilea_champion",
		spawn_x = 692,
		spawn_y = 357,
		level = 20,
		skills = {"troy_dlc1_hero_archer_ability_deadly_focus", "troy_dlc1_hero_archer_ability_deadly_focus_spec_leadership",
		"troy_main_hero_self_range", "troy_main_hero_self_range_spec_superrange", "troy_main_hero_unit_ammunition",
		"troy_main_hero_unit_ammunition_spec_attack_speed_missile_resistance_ranged", "troy_main_hero_campaign_post_battle",
		"troy_main_hero_unit_missile_damage", "troy_main_hero_unit_range",
		"troy_main_hero_unit_range_spec_archers", "troy_dlc1_hero_campaign_razing",
		"troy_main_hero_unit_leadership", "troy_main_hero_unit_leadership_spec_spears",
		"troy_main_hero_self_cooldown", "troy_main_hero_self_cooldown_spec_cost",
		"troy_main_hero_ability_inspired_shots", "troy_main_hero_ability_inspired_shots_spec_damage",
		"troy_main_hero_campaign_campaign_movement", "troy_main_hero_campaign_campaign_movement_spec_land"},

	},
}

--[[
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
														 ___
													  |_  |
														| |
__					  ____							| |
\ ````''''----....____.'\   ````''''--------------------| |--.			   _____	  .-.
 :.					  `-._						   | |   `''-----''''```	 ``''|`: :|
  '::.					   `'--.._____________________| |						   | : :|
	'::..	   ----....._______________________________| |						   | : :|
	  `'-::...__________________________________________| |   .-''-..-'`-..-'`-..-''-.	  :|
		   ```'''---------------------------------------| |--'						 `'-'
														| |
													   _| |
													  |___|

													Thee shalt not toucheth below this bodkin.
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
]]

----------------------------
--- Information overlays ---
----------------------------

--------------------------------------------
-- See lib_information_overlays for usage --
--------------------------------------------

local loc_pref = "random_localisation_strings_string_"
local function image_path_settlement_type_for_overlay()
	local panel = core:get_ui_root():SequentialFind("settlement_panel") or core:get_ui_root():SequentialFind("building_browser")
	local uic_settlement_type = panel:SequentialFind("main_settlement_panel", "capital", "icon_settlement_type")
	return uic_settlement_type:GetImagePath()
end
local function image_path_faction_icon_for_overlay()
	local uic_button_factions = core:get_ui_root():SequentialFind("button_factions")
	return uic_button_factions:GetImagePath()
end

_information_overlays = {
	-- This is an example for adding new overlays
	--[[{
		is_battle = <bool is_battle (true/false)>,
		target_uic = {<string name of UI Component to be overlayed>},
		path_is_not_exact = <bool path is not exact (true/false) -- whether the target uic path is exact or if there can be other components in the middle. Basically will use SequentialFind if true,
		tooltip_text = <string location of string to be used as tooltip (formated as "<table_name>_<column>_<key>)>,
		has_scripted_tour = <bool has scripted tour (true/false) -- does this info overlay have a corresponding scripted tour
	}, --]]
   { 
		is_battle = false,
		target_uic = {"party_selection","container_army_strength","army_strength"," strength_indicator"},
		tooltip_params = {
			title = loc_pref .. "mth_overlay_info_expedition_army_strength_title",
			description = loc_pref .. "mth_overlay_info_expedition_strength_desc",
			list = {},
		},
		has_scripted_tour = true
	},
   --[[{
		is_battle = false,
		target_uic = {"settlement_panel_overlay"},
		path_is_not_exact = false,
		tooltip_params = {
			title = loc_pref .. "overlay_info_settlement_panel_title",
			description = loc_pref .. "overlay_info_settlement_panel_description",
			list = {
				[1] = {
					text = loc_pref .. "overlay_info_settlement_panel_list_item2",
					img = function(uic)
						return "data/ui/skins/default/io_sp_icon_influence.png"
					end
				},
				[2] = {
					text = loc_pref .. "overlay_info_settlement_panel_list_item3",
					img = image_path_for_overlay
				},
			}
		},
		has_scripted_tour = true
	},--]]
	{
		is_battle = false,
		target_uic = {"settlement_panel","settlement_panel_title_bar","form_tabs_icons"},
		tooltip_params = {
			title = loc_pref .. "phar_panel_toggles_overlay_title",
			description = loc_pref .. "phar_panel_toggles_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "phar_panel_toggles_overlay_list_item1",
					img = "data/ui/skins/default/province_panel/icon_province_tab_settlement.png"
				},
				[2] = {
					text = loc_pref .. "phar_panel_toggles_overlay_list_item3",
					img = "data/ui/skins/default/province_panel/icon_province_tab_outpost.png"
				},
			}
		},
		has_scripted_tour = false,
	},	
	{
		is_battle = false,
		target_uic = {"settlement_panel", "main_settlement_panel", "capital"},
		tooltip_params = {
			title = loc_pref .. "phar_settlement_capital_overlay_title",
			description = loc_pref .. "phar_settlement_capital_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "phar_settlement_capital_overlay_list_item1",
					img = image_path_settlement_type_for_overlay
				},
				[2] = {
					text = loc_pref .. "phar_settlement_capital_overlay_list_item2",
					img = "data/ui/skins/default/province_panel/icon_abandon_default.png"
				},
				[3] = {
					text = loc_pref .. "phar_settlement_capital_overlay_list_item3",
					img = "data/ui/skins/default/sp_icon_garrison_strenght.png"
				},
			}
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"ProvinceInfoPopup"},
		tooltip_params = {
			title = loc_pref .. "phar_province_info_overlay_title",
			description = loc_pref .. "phar_province_info_overlay_subtitle",
			--[[list = {
				[1] = {
					text = loc_pref .. "phar_province_info_overlay_list_item1",
					img = "data/ui/skins/default/sp_icon_happiness.png"
				},
				[2] = {
					text = loc_pref .. "phar_province_info_overlay_list_item2",
					img = "data/ui/skins/default/icon_troy_influence_basic.png"
				},
				[3] = {
					text = loc_pref .. "phar_province_info_overlay_list_item3",
					img = "data/ui/skins/default/assets_common/icon_common_population_growth.png"
				},
				[4] = {
					text = loc_pref .. "phar_province_info_overlay_list_item4",
					img = "data/ui/skins/default/icon_building_browser.png"
				},
				[5] = {
					text = loc_pref .. "phar_province_info_overlay_list_item5",
					img = "data/ui/skins/default/buttons/button_nav_toggle/button_round_primary_sample_icon_active.png"
				},
			}]]
		},
		has_scripted_tour = true,
	},
	--[[{   --Used in TROY, not used in PHAR
		is_battle = false,
		target_uic = {"ProvinceInfoPopup", "panel"},
		tooltip_params = {
			title = loc_pref .. "settlement_info_panel_overlay_title",
			description = loc_pref .. "settlement_info_panel_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "settlement_info_panel_overlay_list_1"
				},
				[2] = {
					text = loc_pref .. "settlement_info_panel_overlay_list_2"
				},
				[3] = {
					text = loc_pref .. "settlement_info_panel_overlay_list_3"
				},
				[4] = {
					text = loc_pref .. "settlement_info_panel_overlay_list_4",
					img = "data/ui/skins/default/io_icon_troy_pop_surplus.png"
				},
				[5] = {
					text = loc_pref .. "settlement_info_panel_overlay_list_5",
					img = "data/ui/skins/default/io_icon_troy_growth.png"
				},
				[6] = {
					text = loc_pref .. "settlement_info_panel_overlay_list_6",
					img = "data/ui/skins/default/io_sp_icon_happiness.png"
				},
				[7] = {
					text = loc_pref .. "settlement_info_panel_overlay_list_7",
					img = "data/ui/skins/default/io_sp_icon_influence.png"
				},
			}
		},
		has_scripted_tour = false,
	},--]]
	{
		is_battle = false,
		target_uic = { "hud_campaign", "faction_widget_holder", "faction_widget", "resources_container_holder"},
		tooltip_params = {
			title = loc_pref .. "resource_container_overlay_title",
			description = loc_pref .. "resource_container_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "resource_container_overlay_list_1",
					img = "data/ui/skins/default/icon_fw_treasury.png"
				},			
				[2] = {
					text = loc_pref .. "resource_container_overlay_list_2",
					img = "data/ui/Campaign UI/pooled_resources/icon_res_food_big.png"
				},				
				[3] = {
					text = loc_pref .. "resource_container_overlay_list_3",
					img = "data/ui/Campaign UI/pooled_resources/icon_res_stone_big.png"
				},
				[4] = {
					text = loc_pref .. "resource_container_overlay_list_4",
					img = "data/ui/Campaign UI/pooled_resources/icon_res_wood_big.png"
				},
				[5] = {
					text = loc_pref .. "resource_container_overlay_list_5",
					img = "data/ui/Campaign UI/pooled_resources/icon_res_bronze_big.png"
				},
				[6] = {
					text = loc_pref .. "resource_container_overlay_list_6",
					img = "data/ui/Campaign UI/pooled_resources/icon_res_gold_big.png"
				},
			}
		},
		has_scripted_tour = false,
		show_condition = function()
			local legitimacy_template_egypt = core:get_ui_root():SequentialFind("resources_container", "res_phar_legitimacy")
			local legitimacy_template_hatti = core:get_ui_root():SequentialFind("resources_container", "res_phar_hatti_legitimacy")
			return legitimacy_template_egypt and not legitimacy_template_egypt:Visible() and legitimacy_template_hatti and not legitimacy_template_hatti:Visible()
		end
	},
	{
		is_battle = false,
		target_uic = { "hud_campaign", "faction_widget_holder", "faction_widget", "resources_container_holder"},
		tooltip_params = {
			title = loc_pref .. "resource_container_overlay_title",
			description = loc_pref .. "resource_container_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "resource_container_overlay_list_1",
					img = "data/ui/skins/default/icon_fw_treasury.png"
				},			
				[2] = {
					text = loc_pref .. "resource_container_overlay_list_2",
					img = "data/ui/campaign ui/pooled_resources/icon_res_food_medium.png"
				},				
				[3] = {
					text = loc_pref .. "resource_container_overlay_list_3",
					img = "data/ui/campaign ui/pooled_resources/icon_res_stone_medium.png"
				},
				[4] = {
					text = loc_pref .. "resource_container_overlay_list_4",
					img = "data/ui/campaign ui/pooled_resources/icon_res_wood_medium.png"
				},
				[5] = {
					text = loc_pref .. "resource_container_overlay_list_5",
					img = "data/ui/campaign ui/pooled_resources/icon_res_bronze_medium.png"
				},
				[6] = {
					text = loc_pref .. "resource_container_overlay_list_6",
					img = "data/ui/campaign ui/pooled_resources/icon_res_gold_medium.png"
				},
				[7] = {
					text = loc_pref .. "resource_container_overlay_list_7",
					img = "data/ui/campaign ui/pooled_resources/icon_res_egyptian_legitimacy_medium.png"
				},
			}
		},
		has_scripted_tour = false,
		show_condition = function()
			local legitimacy_template_egypt = core:get_ui_root():SequentialFind("resources_container", "res_phar_legitimacy")
			return legitimacy_template_egypt and legitimacy_template_egypt:Visible()
		end
	},
	{
		is_battle = false,
		target_uic = { "hud_campaign", "faction_widget_holder", "faction_widget", "resources_container_holder"},
		tooltip_params = {
			title = loc_pref .. "resource_container_overlay_title",
			description = loc_pref .. "resource_container_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "resource_container_overlay_list_1",
					img = "data/ui/skins/default/icon_fw_treasury.png"
				},			
				[2] = {
					text = loc_pref .. "resource_container_overlay_list_2",
					img = "data/ui/campaign ui/pooled_resources/icon_res_food_medium.png"
				},				
				[3] = {
					text = loc_pref .. "resource_container_overlay_list_3",
					img = "data/ui/campaign ui/pooled_resources/icon_res_stone_medium.png"
				},
				[4] = {
					text = loc_pref .. "resource_container_overlay_list_4",
					img = "data/ui/campaign ui/pooled_resources/icon_res_wood_medium.png"
				},
				[5] = {
					text = loc_pref .. "resource_container_overlay_list_5",
					img = "data/ui/campaign ui/pooled_resources/icon_res_bronze_medium.png"
				},
				[6] = {
					text = loc_pref .. "resource_container_overlay_list_6",
					img = "data/ui/campaign ui/pooled_resources/icon_res_gold_medium.png"
				},
				[7] = {
					text = loc_pref .. "resource_container_overlay_list_7",
					img = "data/ui/campaign ui/pooled_resources/icon_res_hitite_legitimacy_medium.png"
				},
			}
		},
		has_scripted_tour = false,
		show_condition = function()
			local legitimacy_template_hatti = core:get_ui_root():SequentialFind("resources_container", "res_phar_hatti_legitimacy")
			return legitimacy_template_hatti and legitimacy_template_hatti:Visible()
		end
	},
	{
		is_battle = false,
		target_uic = {"factions_dropdown_overlay"},
		tooltip_params = {
			title = loc_pref .. "factions_dropdown_overlay_title",
			description = loc_pref .. "factions_dropdown_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{ -- HUD Overlay Base Game
		is_battle = false,
		target_uic = {"hud_campaign", "faction_widget_holder", "faction_widget","main_buttons"},
		tooltip_params = {
			title = loc_pref .. "phar_main_faction_controls_overlay_title",
			description = loc_pref .. "phar_main_faction_controls_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "phar_main_faction_controls_overlay_list_1",
					img = "data/ui/skins/default/faction_widget/phar_fw_icon_local_journal.png"
				},
				[2] = {
					text = loc_pref .. "phar_main_faction_controls_overlay_list_2",
					img = "data/ui/skins/default/faction_widget/phar_fw_icon_local_decrees.png"
				},
				[3] = {
					text = loc_pref .. "phar_main_faction_controls_overlay_list_3",
					img = "data/ui/skins/default/faction_widget/phar_fw_icon_local_diplomacy.png"
				},
				[4] = {
					text = loc_pref .. "phar_main_faction_controls_overlay_list_4",
					img = "data/ui/skins/default/faction_widget/phar_fw_icon_local_deities.png"
				},
				[5] = {
					text = loc_pref .. "phar_main_faction_controls_overlay_list_5",
					img = image_path_faction_icon_for_overlay
				},
				[6] = {
					text = loc_pref .. "phar_main_faction_controls_overlay_list_6",
					img = "data/ui/skins/default/faction_widget/phar_fw_icon_local_court.png"
				},
				[7] = {
					text = loc_pref .. "phar_main_faction_controls_overlay_list_7",
					img = "data/ui/skins/default/faction_widget/phar_fw_icon_crown.png"
				},
				[8] = {
					text = loc_pref .. "phar_main_faction_controls_overlay_list_8",
					img = "data/ui/skins/default/faction_widget/phar_fw_icon_local_legacy_selection.png"
				},
			}
		},
		has_scripted_tour = false,
		show_condition = function()
			local main_buttons = core:get_ui_root():SequentialFind("faction_widget", "main_buttons")
			local uic_war_spoils = core:get_ui_root():SequentialFind("faction_widget", "faction_widget_list", "main_buttons", "main_buttons_container", "fm_sea_war_spoils_container", "fm_sea_war_spoils", "button_sea_war_spoils")
			return main_buttons and
				   (main_buttons:SequentialFind("missions_container"):Visible() or 
				   main_buttons:SequentialFind("technology_container"):Visible() or 
				   main_buttons:SequentialFind("diplomacy_container"):Visible())
				   and uic_war_spoils and not uic_war_spoils:VisibleFromRoot()
		end
	},
	{ -- HUD Overlay Sea faction without Forge Path
		is_battle = false,
		target_uic = {"hud_campaign", "faction_widget_holder", "faction_widget","main_buttons"},
		tooltip_params = {
			title = loc_pref .. "phar_main_faction_controls_overlay_title",
			description = loc_pref .. "phar_main_faction_controls_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "phar_main_faction_controls_overlay_list_1",
					img = "data/ui/skins/default/faction_widget/phar_fw_icon_local_journal.png"
				},
				[2] = {
					text = loc_pref .. "phar_main_faction_controls_overlay_list_2",
					img = "data/ui/skins/default/faction_widget/phar_fw_icon_local_decrees.png"
				},
				[3] = {
					text = loc_pref .. "phar_main_faction_controls_overlay_list_3",
					img = "data/ui/skins/default/faction_widget/phar_fw_icon_local_diplomacy.png"
				},
				[4] = {
					text = loc_pref .. "phar_main_faction_controls_overlay_list_4",
					img = "data/ui/skins/default/faction_widget/phar_fw_icon_local_deities.png"
				},
				[5] = {
					text = loc_pref .. "phar_main_faction_controls_overlay_list_5",
					img = image_path_faction_icon_for_overlay
				},
				[6] = {
					text = loc_pref .. "phar_main_faction_controls_overlay_list_6",
					img = "data/ui/skins/default/faction_widget/phar_fw_icon_local_court.png"
				},
				[7] = {
					text = loc_pref .. "phar_main_faction_controls_overlay_list_7",
					img = "data/ui/skins/default/faction_widget/phar_fw_icon_crown.png"
				},
				[8] = {
					text = loc_pref .. "phar_main_faction_controls_overlay_list_8",
					img = "data/ui/skins/default/faction_widget/phar_fw_icon_local_legacy_selection.png"
				},
				[9] = {
					text = loc_pref .. "phar_main_faction_controls_overlay_list_9",
					img = "data/ui/skins/default/faction_widget/phar_sea_fw_icon_war_spoils.png"
				},
			}
		},
		has_scripted_tour = false,
		show_condition = function()
			local main_buttons = core:get_ui_root():SequentialFind("faction_widget", "main_buttons")
			local uic_war_spoils = core:get_ui_root():SequentialFind("faction_widget", "faction_widget_list", "main_buttons", "main_buttons_container", "fm_sea_war_spoils_container", "fm_sea_war_spoils", "button_sea_war_spoils")
			local uic_legitimacy = core:get_ui_root():SequentialFind("faction_widget", "faction_widget_list", "main_buttons", "main_buttons_container", "fm_phar_pharaoh_crown_container", "fm_phar_pharaoh_crown_slot", "button_fm_phar_pharaoh_crown")
			return main_buttons and
				   (main_buttons:SequentialFind("missions_container"):Visible() or 
				   main_buttons:SequentialFind("technology_container"):Visible() or 
				   main_buttons:SequentialFind("diplomacy_container"):Visible())
				   and uic_war_spoils and uic_war_spoils:VisibleFromRoot() and uic_legitimacy and uic_legitimacy:VisibleFromRoot()
		end
	},
	{ -- HUD Overlay Sea faction with Forge Path
		is_battle = false,
		target_uic = {"hud_campaign", "faction_widget_holder", "faction_widget","main_buttons"},
		tooltip_params = {
			title = loc_pref .. "phar_main_faction_controls_overlay_title",
			description = loc_pref .. "phar_main_faction_controls_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "phar_main_faction_controls_overlay_list_1",
					img = "data/ui/skins/default/faction_widget/phar_fw_icon_local_journal.png"
				},
				[2] = {
					text = loc_pref .. "phar_main_faction_controls_overlay_list_2",
					img = "data/ui/skins/default/faction_widget/phar_fw_icon_local_decrees.png"
				},
				[3] = {
					text = loc_pref .. "phar_main_faction_controls_overlay_list_3",
					img = "data/ui/skins/default/faction_widget/phar_fw_icon_local_diplomacy.png"
				},
				[4] = {
					text = loc_pref .. "phar_main_faction_controls_overlay_list_4",
					img = "data/ui/skins/default/faction_widget/phar_fw_icon_local_deities.png"
				},
				[5] = {
					text = loc_pref .. "phar_main_faction_controls_overlay_list_5",
					img = image_path_faction_icon_for_overlay
				},
				[6] = {
					text = loc_pref .. "phar_main_faction_controls_overlay_list_9",
					img = "data/ui/skins/default/faction_widget/phar_sea_fw_icon_war_spoils.png"
				},
			}
		},
		has_scripted_tour = false,
		show_condition = function()
			local main_buttons = core:get_ui_root():SequentialFind("faction_widget", "main_buttons")
			local uic_war_spoils = core:get_ui_root():SequentialFind("faction_widget", "faction_widget_list", "main_buttons", "main_buttons_container", "fm_sea_war_spoils_container", "fm_sea_war_spoils", "button_sea_war_spoils")
			local uic_legitimacy = core:get_ui_root():SequentialFind("faction_widget", "faction_widget_list", "main_buttons", "main_buttons_container", "fm_phar_pharaoh_crown_container", "fm_phar_pharaoh_crown_slot", "button_fm_phar_pharaoh_crown")
			return main_buttons and
				   (main_buttons:SequentialFind("missions_container"):Visible() or 
				   main_buttons:SequentialFind("technology_container"):Visible() or 
				   main_buttons:SequentialFind("diplomacy_container"):Visible())
				   and uic_war_spoils and uic_war_spoils:VisibleFromRoot() and uic_legitimacy and not uic_legitimacy:VisibleFromRoot()
		end
	},
	{
		is_battle = false,
		target_uic = {"panel_buttons_tab_sidemenu"},
		tooltip_params = {
			title = loc_pref .. "lists_overlay_title",
			description = loc_pref .. "lists_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "lists_overlay_list_1",
					img = "data/ui/skins/default/components/sidemenu/icon_sidemenu_events_off.png"
				},
				[2] = {
					text = loc_pref .. "lists_overlay_list_2",
					img = "data/ui/skins/default/components/sidemenu/icon_sidemenu_heroes_off.png"
				},
				[3] = {
					text = loc_pref .. "lists_overlay_list_3",
					img = "data/ui/skins/default/components/sidemenu/icon_sidemenu_provinces_off.png"
				},
				[4] = {
					text = loc_pref .. "lists_overlay_list_4",
					img = "data/ui/skins/default/components/sidemenu/icon_sidemenu_known_factions_off.png"
				},
				[5] = {
					text = loc_pref .. "lists_overlay_list_5",
					img = "data/ui/skins/default/components/sidemenu/icon_sidemenu_notifications_off.png"
				},
				[6] = {
					text = loc_pref .. "lists_overlay_list_6",
					img = "data/ui/skins/default/components/sidemenu/icon_sidemenu_missions_off.png"
				},
			}
		},
		show_condition = function()
			local uic_sidemenu = core:get_ui_root():SequentialFind("hud_campaign", "panel_buttons_tab_sidemenu")
			return uic_sidemenu:Visible()
		end,
		has_scripted_tour = false
	},
	{
		is_battle = false,
		target_uic = {"phar_turn_widget_overlay"},
		tooltip_params = {
			title = loc_pref .. "phar_main_end_turn_overlay_title",
			description = loc_pref .. "phar_main_end_turn_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "phar_main_end_turn_overlay_subtitle_1",
					img = "data/ui/skins/default/components/turn_widget/icon_undo_turn_widget_off.png"
				},
				[2] = {
					text = loc_pref .. "phar_main_end_turn_overlay_subtitle_2",
					img = "data/ui/skins/default/end_turn_widget_seasons/icon_flood.png"
				},
				[3] = {
					text = loc_pref .. "phar_main_end_turn_overlay_subtitle_3",
					img = "data/ui/skins/default/end_turn_widget_seasons/icon_growth.png"
				},
				[4] = {
					text = loc_pref .. "phar_main_end_turn_overlay_subtitle_4",
					img = "data/ui/skins/default/end_turn_widget_seasons/icon_harvest.png"
				},
			}
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"button_notification_settings"},
		tooltip_params = {
			title = loc_pref .. "notification_settings_overlay_title",
			description = loc_pref .. "notification_settings_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "end_turn_overlay_subtitle_2",
					img = "data/ui/skins/default/io_icon_notifications_settings_active.png"
				},
			}
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"units_panel","main_units_panel", "unit_panel", "content", "unit_container", "units"},
		tooltip_params = {
			title = loc_pref .. "army_details_overlay_title",
			description = loc_pref .. "army_details_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "army_details_overlay_subtitle_2",
					img = "data/ui/Cursors/depress0000.png"
				},
				[2] = {
					text = loc_pref .. "army_details_overlay_subtitle_3",
					img = "data/UI/skins/default/icon_disband.png"
				},
				[3] = {
					text = loc_pref .. "army_details_overlay_subtitle_4",
					img = "data/ui/skins/default/icon_merge.png"
				},
				[4] = {
					text = loc_pref .. "army_details_overlay_subtitle_5",
					img = "data/ui/skins/default/icon_rename.png"
				},
			}
		},
		has_scripted_tour = true,
		show_condition = function()
			local transfer_units_check = core:get_ui_root():SequentialFind("unit_exchange" , "main_units_panel_2")
			return not transfer_units_check or not transfer_units_check:Visible()
		end,
		scripted_tour_show_condition = function()
			local local_faction = cm:get_local_faction_name(true)
			return local_faction ~= "troy_rem_horde_aethiopians"
		end
	},
	{
		is_battle = false,
		target_uic = {"recruitment_options_overlay"},
		tooltip_params = {
			title = loc_pref .. "recruitment_options_overlay_title",
			description = loc_pref .. "recruitment_options_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "recruitment_options_overlay_list_item1",
					img = "data/ui/skins/default/recruitment_item/icon_recruitment_item_timer.png"
				},
				[2] = {
					text = loc_pref .. "recruitment_options_overlay_list_item2",
					img = "data/ui/skins/default/icon_cost.png"
				},
				[3] = {
					text = loc_pref .. "recruitment_options_overlay_list_item3",
					img = "data/ui/skins/default/icon_upkeep.png"
				},
			}
		},
		has_scripted_tour = false,
		show_condition = function()
			local uic_mercenary_button = core:get_ui_root():SequentialFind("button_group_army","button_renown")
			local state = uic_mercenary_button and uic_mercenary_button:CurrentState() or ""
			return not string.find(state, "selected")
		end,
	},
	{
		is_battle = false,
		target_uic = {"character_details_panel","stats_panel"},
		tooltip_params = {
			title = loc_pref .. "character_stats_overlay_title",
			description = loc_pref .. "character_stats_overlay_subtitle",
		},
		--[[show_condition = function()
			local slider = core:get_ui_root():SequentialFind("character_details_panel", "container_left_panel", "vslider", "handle")
			local x, y = slider:RelativePosition()
			
			return y == 0
		end,--]]
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"character_details_panel","effects_panel"},
		tooltip_params = {
			title = loc_pref .. "phar_main_character_effects_overlay_title",
			description = loc_pref .. "phar_main_character_effects_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"character_details_panel","sidepanel_info_traits","details_panel"},
		tooltip_params = {
			title = loc_pref .. "character_bio_overlay_title",
			description = loc_pref .. "character_bio_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "phar_main_character_bio_overlay_subtitle_1",
					--img = "data/ui/skins/default/io_loyalty_trait_a_hero.png"
				},
				[2] = {
					text = loc_pref .. "character_bio_overlay_subtitle_2",
					--img = "data/ui/skins/default/io_loyalty_trait_a_hero.png"
				},
				[3] = {
					text = loc_pref .. "character_bio_overlay_subtitle_3",
					--img = "data/ui/skins/default/io_loyalty_trait_a_hero.png"
				},
				[4] = {
					text = loc_pref .. "phar_main_character_bio_overlay_subtitle_4",
					img = "data/ui/skins/default/character_details/trait_icon.png"
				},
			}
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"character_details_panel","sidepanel_info_traits","titles_panel"},
		tooltip_params = {
			title = loc_pref .. "phar_main_character_titles_overlay_title",
			description = loc_pref .. "phar_main_character_titles_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "phar_main_character_titles_overlay_list_item_1",
					img = "data/ui/skins/default/character_details/icon_authority.png"
				},
				[2] = {
					text = loc_pref .. "phar_main_character_titles_overlay_list_item_2",
					img = "data/ui/skins/default/character_details/icon_governance.png"
				},
				[3] = {
					text = loc_pref .. "phar_main_character_titles_overlay_list_item_3",
					img = "data/ui/skins/default/character_details/icon_zeal.png"
				},
				[4] = {
					text = loc_pref .. "phar_main_character_titles_overlay_list_item_4",
					img = "data/ui/skins/default/character_details/character_skill_points.png"
				},
				[5] = {
					text = loc_pref .. "phar_main_character_titles_overlay_list_item_5",
					img = "data/ui/skins/default/character_details/pharaoh_skill_points.png"
				},
			}
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"character_details_panel", "hero_info", "template_candidate_frame", "portrait_parent", "ancillary_parent", "ancillary_crown", "crown_slot", "crown_0"},
		tooltip_params = {
			title = loc_pref .. "phar_main_character_crown_overlay_title",
			description = loc_pref .. "phar_main_character_crown_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"character_details_panel", "phar_title_overlay"},
		tooltip_params = {
			title = loc_pref .. "phar_main_character_panel_header_title",
			description = loc_pref .. "phar_main_character_panel_header_subtitle",
		},
		has_scripted_tour = true,
	},
	--[[
	{ -- Used in TROY, not used in PHAR
		is_battle = false,
		target_uic = {"character_details_panel", "hero_info", "traits_subpanel"},
		tooltip_params = {
			title = loc_pref .. "character_lineage_and_traits_overlay_title",
			description = loc_pref .. "character_lineage_and_traits_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{ -- Used in TROY, not used in PHAR
		is_battle = false,
		target_uic = {"character_details_panel", "hero_info", "sidepanel_info_traits", "loyalty_traits_list"},
		tooltip_params = {
			title = "ui_text_replacements_localised_text_hp_title_loyalty",
			description = loc_pref .. "character_lineage_and_traits_overlay_subtitle_2",
			list = {
				[1] = {
					text = loc_pref .. "character_lineage_and_traits_overlay_subtitle_3",
					img = "data/ui/skins/default/io_loyalty_trait_a_hero.png"
				},
			}
		},
		has_scripted_tour = false,
		show_condition = function()
			local loyalty_visible_check = core:get_ui_root():SequentialFind("character_details_panel", "hero_info", "sidepanel_info_traits","header_loyalty")
			return loyalty_visible_check and loyalty_visible_check:Visible()
		end,
	},
	{ -- Used in TROY, not used in PHAR
		is_battle = false,
		target_uic = {"character_details_panel", "character_details_panel", "template_candidate_frame"},
		tooltip_params = {
			title = loc_pref .. "character_visuals_overlay_title",
			description = loc_pref .. "character_visuals_overlay_subtitle",
		},
		has_scripted_tour = true,
		show_condition = function()
			local replace_hero_check = core:get_ui_root():SequentialFind("character_details_panel", "general_selection_panel")
			return not get_info_overlay():is_really_visible(replace_hero_check)
		end,
	},
	]]
	{
		is_battle = false,
		target_uic = {"character_details_panel","hero_info","ancillary_equipment"},
		tooltip_params = {
			title = loc_pref .. "character_equipment_overlay_title",
			description = loc_pref .. "phar_main_character_equipment_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "phar_main_character_equipment_overlay_list_item_1",
					img = "data/ui/skins/default/character_details/armour_slot.png"
				},
				[2] = {
					text = loc_pref .. "phar_main_character_equipment_overlay_list_item_2",
					img = "data/ui/skins/default/character_details/shield_slot.png"
				},
				[3] = {
					text = loc_pref .. "phar_main_character_equipment_overlay_list_item_3",
					img = "data/ui/skins/default/character_details/weapon_slot.png"
				},
				[4] = {
					text = loc_pref .. "phar_main_character_equipment_overlay_list_item_4",
					img = "data/ui/skins/default/character_details/empty_mount_slot.png"
				},
			}
		},
		has_scripted_tour = false,
	},
	--[[
	{ -- Used in TROY, not used in PHAR
		is_battle = false,
		target_uic = {"character_details_panel","agent_info","ancillary_parent","ancillary_general"},
		tooltip_params = {
			title = loc_pref .. "character_followers_overlay_title",
			description = loc_pref .. "character_followers_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	]]
	{
		is_battle = false,
		target_uic = {"character_details_panel","hero_info","ancillary_general"},
		tooltip_params = {
			title = loc_pref .. "phar_main_character_followers_overlay_title",
			description = loc_pref .. "phar_main_character_followers_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	--[[
	{ -- Used in TROY, not used in PHAR
		is_battle = false,
		target_uic = {"character_details_panel","agent_info","ancillary_parent","traits_subpanel"},
		tooltip_params = {
			title = loc_pref .. "character_lineage_and_traits_overlay_title",
			description = loc_pref .. "character_lineage_and_traits_overlay_subtitle",
		},
		has_scripted_tour = false,
	}
	{
		is_battle = false,
		target_uic = {"character_details_panel","agent_info","sidepanel_skills_agents"},
		tooltip_params = {
			title = loc_pref .. "character_skills_overlay_title",
			description = loc_pref .. "character_skills_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "character_skills_overlay_subtitle_2",
				},
				[2] = {
					text = loc_pref .. "character_skills_overlay_subtitle_3",
				},
				[3] = {
					text = loc_pref .. "character_skills_overlay_subtitle_4",
				},
				[4] = {
					text = loc_pref .. "character_skills_overlay_subtitle_5",
				},
			}
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"character_details_panel","skills_subpanel","listview"},
		tooltip_params = {
			title = loc_pref .. "character_skills_overlay_title",
			description = loc_pref .. "character_skills_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "character_skills_overlay_subtitle_2",
				},
				[2] = {
					text = loc_pref .. "character_skills_overlay_subtitle_3",
				},
				[3] = {
					text = loc_pref .. "character_skills_overlay_subtitle_4",
				},
				[4] = {
					text = loc_pref .. "character_skills_overlay_subtitle_5",
				},
			}
		},
		has_scripted_tour = false,
	},
	]]
	{
		is_battle = false,
		target_uic = {"general_selection_panel","character_list_parent","character_list"},
		tooltip_params = {
			title = loc_pref .. "recruitment_heros_overlay_title",
			description = loc_pref .. "recruitment_heros_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "recruitment_heros_overlay_subtitle_2",
					img = "data/ui/skins/default/io_loyalty_trait_a_hero.png"
				},
			}
		},
		has_scripted_tour = false,
		show_condition = function()
			local hero_recruitment_button = core:get_ui_root():SequentialFind("small_bar", "button_group_settlement", "button_create_army")
			local state = hero_recruitment_button and hero_recruitment_button:CurrentState() or ""
			return string.find(state, "selected")
		end,
	},
	{
		is_battle = false,
		target_uic = {"character_panel","raise_forces_options"},
		tooltip_params = {
			title = loc_pref .. "recruitment_agent_overlay_title",
			description = loc_pref .. "recruitment_agent_overlay_subtitle",
		},
		has_scripted_tour = false,
		show_condition = function()
			local agent_recruitment_button = core:get_ui_root():SequentialFind("small_bar", "button_group_settlement", "button_agents")
			local state = agent_recruitment_button and agent_recruitment_button:CurrentState() or ""
			return string.find(state, "selected")
		end,
	},
	--[[{
		is_battle = false,
		target_uic = { "hud_campaign", "faction_widget_holder", "faction_widget", "faction_widget_list", "resources_container_holder", "resources_container", "btn_treasury", "trading_overlay"},
		tooltip_params = {
			title = loc_pref .. "trading_overlay_title",
			description = loc_pref .. "trading_overlay_subtitle",
		},
		has_scripted_tour = false,
	},--]]
	{
		is_battle = false,
		target_uic = { "pharaohs_crown", "pharaoh_screen", "your_legitimacy_holder"},
		tooltip_params = {
			title = loc_pref .. "phar_main_legitimacy_holder_overlay_title",
			description = loc_pref .. "phar_main_legitimacy_holder_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "pharaohs_crown", "kings_screen", "your_legitimacy_holder"},
		tooltip_params = {
			title = loc_pref .. "phar_main_legitimacy_holder_overlay_title",
			description = loc_pref .. "phar_main_legitimacy_holder_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "pharaohs_crown", "pharaoh_screen", "crowns_and_powers_holder", "crowns"},
		tooltip_params = {
			title = loc_pref .. "phar_main_crowns_overlay_title",
			description = loc_pref .. "phar_main_crowns_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "pharaohs_crown", "kings_screen", "crowns_and_powers_holder", "crowns"},
		tooltip_params = {
			title = loc_pref .. "phar_main_crowns_overlay_title",
			description = loc_pref .. "phar_main_crowns_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "pharaohs_crown", "pharaoh_screen", "crowns_and_powers_holder", "powers"},
		tooltip_params = {
			title = loc_pref .. "phar_main_powers_overlay_title",
			description = loc_pref .. "phar_main_powers_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "pharaohs_crown", "kings_screen", "crowns_and_powers_holder", "powers"},
		tooltip_params = {
			title = loc_pref .. "phar_main_powers_overlay_title",
			description = loc_pref .. "phar_main_powers_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "poc_panel", "overlays", "events_overlay" },
		tooltip_params = {
			title = loc_pref .. "phar_sea_civilization_blessings_disasters_overlay_title",
			description = loc_pref .."phar_sea_civilization_blessings_disasters_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "poc_panel", "overlays", "civilization_state_overlay" },
		tooltip_params = {
			title = loc_pref .. "phar_sea_civilization_state_overlay_title",
			description = loc_pref .."phar_sea_civilization_state_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "poc_panel", "overlays", "populace_overlay" },
		tooltip_params = {
			title = loc_pref .. "phar_sea_civilization_populace_overlay_title",
			description = loc_pref .. "phar_sea_civilization_populace_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "local_deities", "god_culture_tabs"},
		tooltip_params = {
			title = loc_pref .. "phar_main_local_deities_god_tabs_overlay_title",
			description = loc_pref .. "phar_main_local_deities_god_tabs_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "local_deities", "worshipped_all_gods_panel", "worshipped_gods_holder", "worshipped_gods_overlay"},
		tooltip_params = {
			title = loc_pref .. "phar_main_local_deities_worshipped_gods_overlay_title",
			description = loc_pref .. "phar_main_local_deities_worshipped_gods_overlay_subtitle",
		},
		has_scripted_tour = true,
		show_condition = function()
			local uic_aten_description = find_uicomponent(core:get_ui_root(), "local_deities", "worshipped_all_gods_panel", "aten_description_tx")
			local uic_worshipped_gods_description = find_uicomponent(core:get_ui_root(), "local_deities", "worshipped_all_gods_panel", "worshipped_gods_holder", "description_tx")

			return (uic_aten_description and not uic_aten_description:Visible()) and (uic_worshipped_gods_description and uic_worshipped_gods_description:Visible())
		end
	},
	{
		is_battle = false,
		target_uic = { "local_deities", "all_gods_holder", "all_gods_listview", "god_content_overlay"},
		tooltip_params = {
			title = loc_pref .. "phar_main_local_deities_god_content_overlay_title",
			description = loc_pref .. "phar_main_local_deities_god_content_overlay_subtitle",
		},
		has_scripted_tour = false,
		--[[show_condition = function()
			local uic_aten_button = find_uicomponent(core:get_ui_root(), "local_deities", "god_culture_tabs_new", "aten_tab_button")
			return uic_aten_button and not uic_aten_button:CurrentState() == "selected"
		end]]
	},
	{
		is_battle = false,
		target_uic = { "local_deities", "selected_god_template", "left_side_holder", "bar_holder", "tier_holder"},
		tooltip_params = {
			title = loc_pref .. "phar_main_local_deities_tier_holder_overlay_title",
			description = loc_pref .. "phar_main_local_deities_tier_holder_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "local_deities", "aten_god_template", "left_side_holder", "bar_holder", "tier_holder"},
		tooltip_params = {
			title = loc_pref .. "phar_main_al_akhenaten_tier_holder_overlay_title",
			description = loc_pref .. "phar_main_al_akhenaten_tier_holder_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "local_deities", "selected_god_template", "left_side_holder", "effects_button_holder", "effects_holder"},
		tooltip_params = {
			title = loc_pref .. "phar_main_local_deities_effect_categories_overlay_title",
			description = loc_pref .. "phar_main_local_deities_effect_categories_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "local_deities", "aten_god_template", "left_side_holder", "effects_button_holder", "listview"},
		tooltip_params = {
			title = loc_pref .. "phar_main_al_akhenaten_effect_categories_overlay_title",
			description = loc_pref .. "phar_main_al_akhenaten_effect_categories_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "local_deities", "aten_god_template", "unlocks"},
		tooltip_params = {
			title = loc_pref .. "phar_main_al_akhenaten_unlocks_overlay_title",
			description = loc_pref .. "phar_main_al_akhenaten_unlocks_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "court", "court_positions_overlay"},
		tooltip_params = {
			title = loc_pref .. "phar_main_court_positions_overlay_title",
			description = loc_pref .. "phar_main_court_positions_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "phar_main_court_positions_overlay_list_item_1",
					img = "data/ui/skins/default/court/icon_court_guile_slot.png"
				},
			}
		},
		has_scripted_tour = true,
	},
	{
		is_battle = false,
		target_uic = { "court", "character_actions_panel"},
		tooltip_params = {
			title = loc_pref .. "phar_main_court_actions_overlay_title",
			description = loc_pref .. "phar_main_court_actions_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "court", "your_faction_info"},
		tooltip_params = {
			title = loc_pref .. "phar_sea_court_overview_plots_overlay_title",
			description = loc_pref .. "phar_sea_court_overview_plots_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "phar_sea_court_overview_plots_overlay_list_item_1"
				},
				[2] = {
					text = loc_pref .. "phar_sea_court_overview_plots_overlay_list_item_2"
				},
			}
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "ambitions_list", 1, "ambition_objective" },
		path_is_not_exact = true,
		tooltip_params = {
			title = loc_pref .. "phar_main_ambition_objective_overlay_title",
			description = loc_pref .. "phar_main_ambition_objective_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "phar_main_ambition_objective_overlay_list_item_1",
					img = "data/UI/skins/default/assets_common/icon_common_hourglass.png"
				},
			},
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "ambitions_list", 1, "ambition_reward", "listview" },
		path_is_not_exact = true,
		tooltip_params = {
			title = loc_pref .. "phar_main_ambition_reward_overlay_title",
			description = loc_pref .. "phar_main_ambition_reward_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "legacy_hatshepsut", "map", "path_base", "pins_overlay"},
		tooltip_params = {
			title = loc_pref .. "phar_main_al_hatshepsut_pins_overlay_title",
			description = loc_pref .. "phar_main_al_hatshepsut_pins_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "phar_main_al_hatshepsut_pins_overlay_list_item_1",
					img = "data/ui/skins/default/legacy_hatchepsut/pin_capital.png"
				},
			}
		},
		has_scripted_tour = false,
		show_condition = function()
			local uic_trading = core:get_ui_root():SequentialFind("legacy_hatshepsut", "trading")			
			return not uic_trading or not uic_trading:Visible()
		end,
	},
	{
		is_battle = false,
		target_uic = { "legacy_hatshepsut", "selected_realm_info"},
		tooltip_params = {
			title = loc_pref .. "phar_main_al_hatshepsut_selected_realm_overlay_title",
			description = loc_pref .. "phar_main_al_hatshepsut_selected_realm_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "legacy_hatshepsut", "cashing_out", "inventory"},
		tooltip_params = {
			title = loc_pref .. "phar_main_al_hatshepsut_cash_out_overlay_title",
			description = loc_pref .. "phar_main_al_hatshepsut_cash_out_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "phar_main_al_hatshepsut_cash_out_overlay_list_item_1",
					img = "data/ui/campaign ui/effect_bundles/fx_icon_gold_cost.png"
				},
				[2] = {
					text = loc_pref .. "phar_main_al_hatshepsut_cash_out_overlay_list_item_2",
					img = "data/ui/campaign ui/effect_bundles/fx_icon_strategic_location.png"
				},
				[3] = {
					text = loc_pref .. "phar_main_al_hatshepsut_cash_out_overlay_list_item_3",
					img = "data/ui/campaign ui/effect_bundles/fx_icon_odysseus_base.png"
				},
			}
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "legacy_muwatalli","cards_panel_holder","cards_holder" },
		path_is_not_exact = true,
		tooltip_params = {
			title = loc_pref .. "phar_main_al_muwatalli_vassals_overlay_title",
			description = loc_pref .. "phar_main_al_muwatalli_vassals_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "legacy_muwatalli","gratitude_bar_holder" },
		tooltip_params = {
			title = loc_pref .. "phar_main_al_muwatalli_gratitude_overlay_title",
			description = loc_pref .. "phar_main_al_muwatalli_gratitude_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "legacy_muwatalli","vassal_actions_holder","actions_holder" },
		tooltip_params = {
			title = loc_pref .. "phar_main_al_muwatalli_tokens_of_gratitude_overlay_title",
			description = loc_pref .. "phar_main_al_muwatalli_tokens_of_gratitude_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "sea_war_spoils", "panel_campaign_bg", "rank_overlay" },
		tooltip_params = {
			title = loc_pref .. "phar_sea_war_spoils_rank_overlay_title",
			description = loc_pref .. "phar_sea_war_spoils_rank_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "sea_war_spoils", "panel_campaign_bg", "illustration_holder", "non_resource_holder" },
		tooltip_params = {
			title = loc_pref .. "phar_sea_war_spoils_non_resource_overlay_title",
			description = loc_pref .. "phar_sea_war_spoils_non_resource_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "sea_war_spoils", "panel_campaign_bg", "illustration_holder", "resource_holder" },
		tooltip_params = {
			title = loc_pref .. "phar_sea_war_spoils_resource_overlay_title",
			description = loc_pref .. "phar_sea_war_spoils_resource_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "sea_eminence_panel", "obedience_section" },
		tooltip_params = {
			title = loc_pref .. "phar_sea_eminence_obedience_overlay_title",
			description = loc_pref .. "phar_sea_eminence_obedience_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "sea_eminence_panel", "change_allegiance_section" },
		tooltip_params = {
			title = loc_pref .. "phar_sea_eminence_deserters_overlay_title",
			description = loc_pref .. "phar_sea_eminence_deserters_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "sea_eminence_panel", "main_section", "eminence_bar", "bar_frame" },
		tooltip_params = {
			title = loc_pref .. "phar_sea_eminence_overlay_title",
			description = loc_pref .. "phar_sea_eminence_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "sea_eminence_panel", "main_section", "tab_menu" },
		tooltip_params = {
			title = loc_pref .. "phar_sea_eminence_actions_overlay_title",
			description = loc_pref .. "phar_sea_eminence_actions_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "sea_tribes_privileges", "strategic_map" },
		tooltip_params = {
			title = loc_pref .. "phar_sea_tribes_privileges_scales_overlay_title",
			description = loc_pref .. "phar_sea_tribes_privileges_scales_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "phar_sea_tribes_privileges_scales_overlay_subtitle_2",
					img = "data/ui/skins/default/sea_tribes_privileges/icon_sea_tribe_privileges_achish.png"
				},
			}
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "sea_tribes_privileges", "points_sources_panel" },
		tooltip_params = {
			title = loc_pref .. "phar_sea_tribes_privileges_points_privileges_overlay_title",
			description = loc_pref .. "phar_sea_tribes_privileges_points_privileges_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "phar_sea_tribes_privileges_points_privileges_overlay_subtitle_2",
					img = "data/ui/skins/default/sea_tribes_privileges/phar_sea_padi.png"
				},
				[2] = {
					text = loc_pref .. "phar_sea_tribes_privileges_points_privileges_overlay_subtitle_3",
					img = "data/ui/skins/default/sea_tribes_privileges/sea_settlement_autonomy.png"
				},
			}
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "sea_tribes_privileges", "tile_effects_overlay" },
		tooltip_params = {
			title = loc_pref .. "phar_sea_tribes_privileges_boat_overlay_title",
			description = loc_pref .. "phar_sea_tribes_privileges_boat_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_offices_overlay"},
		tooltip_params = {
			title = loc_pref .. "faction_mechanics_overlay_title",
			description = loc_pref .. "faction_mechanics_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_hot_blooded_overlay"},
		tooltip_params = {
			title = loc_pref .. "faction_mechanics_overlay_title",
			description = loc_pref .. "faction_mechanics_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_reliable_friend_overlay"},
		tooltip_params = {
			title = loc_pref .. "faction_mechanics_overlay_title",
			description = loc_pref .. "faction_mechanics_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_greatest_warrior_overlay"},
		tooltip_params = {
			title = loc_pref .. "faction_mechanics_overlay_title",
			description = loc_pref .. "faction_mechanics_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_divine_missions_overlay"},
		tooltip_params = {
			title = loc_pref .. "faction_mechanics_overlay_title",
			description = loc_pref .. "faction_mechanics_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_luxury_goods_overlay"},
		tooltip_params = {
			title = loc_pref .. "faction_mechanics_overlay_title",
			description = loc_pref .. "faction_mechanics_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_speak_with_dead_overlay"},
		tooltip_params = {
			title = loc_pref .. "faction_mechanics_overlay_title",
			description = loc_pref .. "faction_mechanics_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_demand_tribute_overlay"},
		tooltip_params = {
			title = loc_pref .. "faction_mechanics_overlay_title",
			description = loc_pref .. "faction_mechanics_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_spartan_settlers_overlay"},
		tooltip_params = {
			title = loc_pref .. "faction_mechanics_overlay_title",
			description = loc_pref .. "faction_mechanics_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_lycian_trade_guild_overlay"},
		tooltip_params = {
			title = loc_pref .. "faction_mechanics_overlay_title",
			description = loc_pref .. "faction_mechanics_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_amazon_kingdom_overlay"},
		tooltip_params = {
			title = loc_pref .. "faction_mechanics_overlay_title",
			description = loc_pref .. "faction_mechanics_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_amazon_horde_overlay"},
		tooltip_params = {
			title = loc_pref .. "faction_mechanics_overlay_title",
			description = loc_pref .. "faction_mechanics_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_amazon_unit_upgrades_container_penny_overlay"},
		tooltip_params = {
			title = loc_pref .. "faction_mechanics_overlay_title",
			description = loc_pref .. "faction_mechanics_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_amazon_unit_upgrades_container_hippolyta_overlay"},
		tooltip_params = {
			title = loc_pref .. "faction_mechanics_overlay_title",
			description = loc_pref .. "faction_mechanics_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"antagonist_overlay"},
		tooltip_params = {
			title = loc_pref .. "antagonists_title",
			description = loc_pref .. "antagonists_description_01",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_paris_helen_overlay"},
		tooltip_params = {
			title = loc_pref .. "faction_mechanics_overlay_title",
			description = loc_pref .. "faction_mechanics_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_trojan_alliance_overlay"},
		tooltip_params = {
			title = loc_pref .. "faction_mechanics_overlay_title",
			description = loc_pref .. "faction_mechanics_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_priam_benevolence_overlay"},
		tooltip_params = {
			title = loc_pref .. "faction_mechanics_overlay_title",
			description = loc_pref .. "faction_mechanics_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_capture_bonus_overlay"},
		tooltip_params = {
			title = loc_pref .. "faction_mechanics_overlay_title",
			description = loc_pref .. "faction_mechanics_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_supply_bases_overlay"},
		tooltip_params = {
			title = loc_pref .. "faction_mechanics_overlay_title",
			description = loc_pref .. "faction_mechanics_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"campaign_space_bar_options", "plate_window_base"},
		tooltip_params = {
			title = loc_pref .. "campaign_spacebar_options_overlay_title",
			description = loc_pref .. "campaign_spacebar_options_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"faction_emblem_overlay"},
		tooltip_params = {
			title = loc_pref .. "faction_emblem_overlay_title",
			description = loc_pref .. "faction_emblem_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_achilles_hotblooded", "bar_insulted"},
		tooltip_params = {
			title = loc_pref .. "fm_achilles_hot_blooded_indignant_overlay_title",
			description = loc_pref .. "fm_achilles_hot_blooded_indignant_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_achilles_hotblooded", "bar_enraged"},
		tooltip_params = {
			title = loc_pref .. "fm_achilles_hot_blooded_outraged_overlay_title",
			description = loc_pref .. "fm_achilles_hot_blooded_outraged_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_achilles_hotblooded", "bar_depressed"},
		tooltip_params = {
			title = loc_pref .. "fm_achilles_hot_blooded_grieving_overlay_title",
			description = loc_pref .. "fm_achilles_hot_blooded_grieving_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_achilles_hotblooded", "current_mood_icon"},
		tooltip_params = {
			title = loc_pref .. "fm_achilles_hot_blooded_active_mood_overlay_title",
			description = loc_pref .. "fm_achilles_hot_blooded_active_mood_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_achilles_hotblooded", "mood_details"},
		tooltip_params = {
			title = loc_pref .. "fm_achilles_hot_blooded_active_mood_description_overlay_title",
			description = loc_pref .. "fm_achilles_hot_blooded_active_mood_description_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_achilles_hotblooded", "mood_details_compare"},
		tooltip_params = {
			title = loc_pref .. "fm_achilles_hot_blooded_selected_mood_description_overlay_title",
			description = loc_pref .. "fm_achilles_hot_blooded_selected_mood_description_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"tab_challengers"},
		tooltip_params = {
			title = loc_pref .. "fm_achilles_greatest_warrior_tab_challengers_overlay_title",
			description = loc_pref .. "fm_achilles_greatest_warrior_tab_challengers_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "fm_achilles_greatest_warrior_challengers_overlay_subtitle_2",
					img = "data/ui/skins/default/io_icon_zoom_location.png"
				},
				[2] = {
					text = loc_pref .. "fm_achilles_greatest_warrior_challengers_overlay_subtitle_3",
					img = "data/ui/skins/default/io_main_button_battles_ico_h.png"
				},
			}
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"tab_defeated"},
		tooltip_params = {
			title = loc_pref .. "fm_achilles_greatest_warrior_tab_defeated_heroes_overlay_title",
			description = loc_pref .. "fm_achilles_greatest_warrior_tab_defeated_heroes_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"undefeated_warriors_listview"},
		tooltip_params = {
			title = loc_pref .. "fm_achilles_greatest_warrior_challengers_overlay_title",
			description = loc_pref .. "fm_achilles_greatest_warrior_challengers_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_achilles_greatest_warrior_defeated_heroes"},
		tooltip_params = {
			title = loc_pref .. "fm_achilles_greatest_warrior_defeated_heroes_overlay_title",
			description = loc_pref .. "fm_achilles_greatest_warrior_defeated_heroes_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"position_buttons_info_overlay"},
		tooltip_params = {
			title = loc_pref .. "fm_agamemnon_king_of_men_position_buttons_overlay_title",
			description = loc_pref .. "fm_agamemnon_king_of_men_position_buttons_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"portrait_holder_info_overlay"},
		tooltip_params = {
			title = loc_pref .. "fm_agamemnon_king_of_men_position_slots_overlay_title",
			description = loc_pref .. "fm_agamemnon_king_of_men_position_slots_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"offices_panel_info_overlay"},
		tooltip_params = {
			title = loc_pref .. "fm_agamemnon_king_of_men_position_list_of_heroes_overlay_title",
			description = loc_pref .. "fm_agamemnon_king_of_men_position_list_of_heroes_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_agamemnon_king_of_men_position_legend"},
		tooltip_params = {
			title = loc_pref .. "fm_agamemnon_king_of_men_position_legend_overlay_title",
			description = loc_pref .. "fm_agamemnon_king_of_men_position_legend_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"tax_rate_slider_info_overlay"},
		tooltip_params = {
			title = loc_pref .. "fm_agamemnon_demand_tribute_slider_overlay_title",
			description = loc_pref .. "fm_agamemnon_demand_tribute_slider_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"resources_list_holder_info_overlay"},
		tooltip_params = {
			title = loc_pref .. "fm_agamemnon_demand_tribute_resource_bar_overlay_title",
			description = loc_pref .. "fm_agamemnon_demand_tribute_resource_bar_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_demand_tribute", "resource_buttons_list"},
		tooltip_params = {
			title = loc_pref .. "fm_agamemnon_demand_tribute_large_buttons_overlay_title",
			description = loc_pref .. "fm_agamemnon_demand_tribute_large_buttons_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_demand_tribute","sortable_list_factions"},
		tooltip_params = {
			title = loc_pref .. "fm_agamemnon_demand_tribute_list_of_vassals_overlay_title",
			description = loc_pref .. "fm_agamemnon_demand_tribute_list_of_vassals_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"button_ok_info_overlay"},
		tooltip_params = {
			title = loc_pref .. "fm_agamemnon_demand_tribute_button_demand_overlay_title",
			description = loc_pref .. "fm_agamemnon_demand_tribute_button_demand_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"supply_bases_list_info_overlay"},
		tooltip_params = {
			title = loc_pref .. "fm_odysseus_supply_bases_list_overlay_title",
			description = loc_pref .. "fm_odysseus_supply_bases_list_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"supply_bases_info_overlay"},
		tooltip_params = {
			title = loc_pref .. "fm_odysseus_supply_bases_minimap_overlay_title",
			description = loc_pref .. "fm_odysseus_supply_bases_minimap_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"list_of_allies_info_overlay"},
		tooltip_params = {
			title = loc_pref .. "fm_menelaus_call_to_arms_faction_list_overlay_title",
			description = loc_pref .. "fm_menelaus_call_to_arms_faction_list_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"recuitment_entry"},
		tooltip_params = {
			title = loc_pref .. "fm_menelaus_call_to_arms_unit_list_overlay_title",
			description = loc_pref .. "fm_menelaus_call_to_arms_unit_list_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"available_settlements_settlers_info_overlay"},
		tooltip_params = {
			title = loc_pref .. "fm_menelaus_spartan_settlers_settlement_list_overlay_title",
			description = loc_pref .. "fm_menelaus_spartan_settlers_settlement_list_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"spartan_settlers_map_info_overlay"},
		tooltip_params = {
			title = loc_pref .. "fm_menelaus_spartan_settlers_minimap_overlay_title",
			description = loc_pref .. "fm_menelaus_spartan_settlers_minimap_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"cost_omens_info_overlay"},
		tooltip_params = {
			title = loc_pref .. "fm_aeneas_omens_cost_overlay_title",
			description = loc_pref .. "fm_aeneas_omens_cost_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"btn_entreat_the_gods"},
		tooltip_params = {
			title = loc_pref .. "fm_aeneas_omens_button_read_omens_overlay_title",
			description = loc_pref .. "fm_aeneas_omens_button_read_omens_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"page_button_holder"},
		tooltip_params = {
			title = loc_pref .. "fm_aeneas_speak_with_the_dead_page_up_page_down_overlay_title",
			description = loc_pref .. "fm_aeneas_speak_with_the_dead_page_up_page_down_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"dead_heroes_list"},
		tooltip_params = {
			title = loc_pref .. "fm_aeneas_speak_with_the_dead_heroes_overlay_title",
			description = loc_pref .. "fm_aeneas_speak_with_the_dead_heroes_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"good_info_overlay"},
		tooltip_params = {
			title = loc_pref .. "fm_sarpedon_exotic_goods_resource_buttons_overlay_title",
			description = loc_pref .. "fm_sarpedon_exotic_goods_resource_buttons_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"effects_info_overlay"},
		tooltip_params = {
			title = loc_pref .. "fm_sarpedon_exotic_goods_resource_effects_overlay_title",
			description = loc_pref .. "fm_sarpedon_exotic_goods_resource_effects_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"distribute_button_info_overlay"},
		tooltip_params = {
			title = loc_pref .. "fm_sarpedon_exotic_goods_distribute_button_overlay_title",
			description = loc_pref .. "fm_sarpedon_exotic_goods_distribute_button_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"sarpedon_minimap_info_overlay"},
		tooltip_params = {
			title = loc_pref .. "fm_sarpedon_exotic_goods_minimap_overlay_title",
			description = loc_pref .. "fm_sarpedon_exotic_goods_minimap_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_trojan_alliance", "effects_holder"},
		tooltip_params = {
			title = loc_pref .. "fm_hector_trojan_alliance_effects_overlay_title",
			description = loc_pref .. "fm_hector_trojan_alliance_effects_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"sortable_list_factions_info_overlay"},
		tooltip_params = {
			title = loc_pref .. "fm_hector_trojan_alliance_ally_list_overlay_title",
			description = loc_pref .. "fm_hector_trojan_alliance_ally_list_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"total_regions"},
		tooltip_params = {
			title = loc_pref .. "fm_hector_trojan_alliance_total_regions_overlay_title",
			description = loc_pref .. "fm_hector_trojan_alliance_total_regions_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"allied_regions_bar"},
		tooltip_params = {
			title = loc_pref .. "fm_hector_trojan_alliance_alliance_bar_overlay_title",
			description = loc_pref .. "fm_hector_trojan_alliance_alliance_bar_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "fm_hector_trojan_alliance_alliance_bar_overlay_subtitle_2"
				},
				[2] = {
					text = loc_pref .. "fm_hector_trojan_alliance_alliance_bar_overlay_subtitle_3",
					img = "data/ui/skins/default/io_icon_cmp_menu_factions.png"
				},
				[3] = {
					text = loc_pref .. "fm_hector_trojan_alliance_alliance_bar_overlay_subtitle_4",
					img = "data/ui/skins/default/io_icon_melee.png"
				},
				[4] = {
					text = loc_pref .. "fm_hector_trojan_alliance_alliance_bar_overlay_subtitle_5",
					img = "data/ui/skins/default/io_da_troy_diplomatic_action__trade_regions.png"
				},
			},
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"cost_info_overlay"},
		tooltip_params = {
			title = loc_pref .. "fm_sarpedon_exotic_goods_resource_cost_overlay_title",
			description = loc_pref .. "fm_sarpedon_exotic_goods_resource_cost_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{ 
		is_battle = false,
		target_uic = {"griffin","monster_card_front_overlay"},
		tooltip_params = {
			title = loc_pref .. "troy_mth_overlay_info_selection_front_title",
			description = loc_pref .. "troy_mth_overlay_info_selection_front_desc",
		},
		has_scripted_tour = true,
		show_condition = function()
			local uic_monster_card_back_check = find_uicomponent(core:get_ui_root(), "monster_selection", "griffin", "monster_card_back")
			
			return not uic_monster_card_back_check or not uic_monster_card_back_check:Visible()
		end,
	},
	{ 
		is_battle = false,
		target_uic = {"griffin","monster_card_back","container_buttons_overlay"},
		tooltip_params = {
			title = loc_pref .. "troy_mth_overlay_info_selection_anchor_buttons_back_title",
			description = loc_pref .. "troy_mth_overlay_info_selection_anchor_buttons_back_desc",
			list = {
				[1] = {
					text = loc_pref .. "troy_mth_overlay_info_selection_anchor_buttons_back_I_desc",
					img = "data/ui/skins/default/troy_mth_icon_info_active.png"
				},
				[2] = {
					text = loc_pref .. "troy_mth_overlay_info_selection_anchor_buttons_back_II_desc",
					img = "data/ui/skins/default/troy_mth_icon_stats_active.png"
				},
				[3] = {
					text = loc_pref .. "troy_mth_overlay_info_selection_anchor_buttons_back_III_desc",
					img = "data/ui/skins/default/troy_mth_icon_battle_abilities_active.png"
				},
				[4] = {
					text = loc_pref .. "troy_mth_overlay_info_selection_anchor_buttons_back_IV_desc",
					img = "data/ui/skins/default/troy_mth_icon_campaign_abilities_active.png"
				},
				[5] = {
					text = loc_pref .. "troy_mth_overlay_info_selection_anchor_buttons_back_V_desc",
					img = "data/ui/skins/default/troy_mth_icon_roaster_active.png"
				},
				[6] = {
					text = loc_pref .. "troy_mth_overlay_info_selection_anchor_buttons_back_VI_desc",
					img = "data/ui/skins/default/troy_mth_icon_buildings_active.png"
				},

		},
		has_scripted_tour = true,
		priority_override = 2112

	},
},
{ 
		is_battle = false,
		target_uic = {"btn_compare",},
		tooltip_params = {
			title = loc_pref .. "troy_mth_overlay_info_selection_flip_all_title",
			description = loc_pref .. "troy_mth_overlay_info_selection_flip_all_desc",
		},
		has_scripted_tour = true
	},
	{ 
		is_battle = false,
		target_uic = {"mythic_expedition","empty_slot"},
		tooltip_params = {
			title = loc_pref .. "troy_mth_overlay_info_expedition_hero_selection_title",
			description = loc_pref .. "troy_mth_overlay_info_expedition_hero_selection_desc",
		},
		has_scripted_tour = true
	},
	{ 
		is_battle = false,
		target_uic = {"mythic_expedition","adventurers"},
		tooltip_params = {
			title = loc_pref .. "troy_troy_mth_overlay_info_expedition_army_selection_title",
			description = loc_pref .. "troy_troy_mth_overlay_info_expedition_army_selection_desc",
		},
		has_scripted_tour = true
	},
	{ 
		is_battle = false,
		target_uic = {"mythic_expedition","container_hunting_party", "recruit_general_panel", "unit_list_container"},
		tooltip_params = {
			title = loc_pref .. "troy_troy_mth_overlay_info_expedition_hero_list_title",
			description = loc_pref .. "troy_troy_mth_overlay_info_expedition_hero_list_desc",
		},
		has_scripted_tour = true
	},
	{ 
		is_battle = false,
		target_uic = {"mythic_expedition","container_btn_reset_party","container_button","btn_reset_party"},
		tooltip_params = {
			title = loc_pref .. "troy_troy_mth_overlay_info_expedition_army_reset_title",
			description = loc_pref .. "troy_troy_mth_overlay_info_expedition_army_reset_desc",
		},
		has_scripted_tour = true
	},
	{ 
		is_battle = false,
		target_uic = {"mythic_expedition","container_btn_reset_party","container_button","btn_cancel_expedition"},
		tooltip_params = {
			title = loc_pref .. "troy_troy_mth_overlay_info_expedition_abandon_expedition_title",
			description = loc_pref .. "troy_troy_mth_overlay_info_expedition_abandon_expedition_desc",
		},
		has_scripted_tour = true
	},
	{ 
		is_battle = false,
		target_uic = {"fm_mythic_monster","fm_mythic_monster_slot"},
		tooltip_params = {
			title = loc_pref .. "troy_mth_overlay_info_general_monster_slot_title",
			description = loc_pref .. "troy_mth_overlay_info_general_monster_slot_desc",
			},
		has_scripted_tour = true
	},
	{ 
		is_battle = false,
		target_uic = {"container_launch_expedition", "container_btn", "btn_start_expedition"},
		tooltip_params = {
			title = loc_pref .. "troy_troy_mth_overlay_info_expedition_launch_button_title",
			description = loc_pref .. "troy_troy_mth_overlay_info_expedition_launch_button_desc",
		},
		has_scripted_tour = true
	},
 	{ 
		is_battle = false,
		target_uic = {"mythic_expedition","panel", "container_hunting_party", "recruit_adventurers"},
		tooltip_params = {
			title = loc_pref .. "troy_troy_mth_overlay_info_expedition_army_selection_title",
			description = loc_pref .. "troy_troy_mth_overlay_info_expedition_army_selection_desc",
		},
		has_scripted_tour = true
	}, 
		{ 
		is_battle = false,
		target_uic = {"mythic_expedition", "army_strength"},
		tooltip_params = {
			title = loc_pref .. "troy_mth_overlay_info_expedition_army_strength_title",
			description = loc_pref .. "troy_mth_overlay_info_expedition_army_strength_desc",
		},
		has_scripted_tour = true
	}, 
	{ 
		is_battle = false,
		target_uic = {"character_details_panel", "ancillary_equipment","mount_2"},
		tooltip_params = {
			title = loc_pref .. "troy_troy_flc_overlay_info_historical_bodyguards_title",
			description = loc_pref .. "troy_troy_flc_overlay_info_historical_bodyguards_desc",
		},
		has_scripted_tour = true,
		show_condition = function()
			return cm:get_campaign_name() == "troy_historical"
		end
	}, 
	{ 
		is_battle = false,
		target_uic = {"monster_progression", "container_main","bars_holder"},
		tooltip_params = {
			title = loc_pref .. "troy_troy_mth_overlay_info_progression_unique_resource_title",
			description = loc_pref .. "troy_troy_mth_overlay_info_progression_unique_resource_desc",
		},
		has_scripted_tour = true
	},
	{ 
		is_battle = false,
		target_uic = {"monster_progression", "tab_info","tab_child"},
		tooltip_params = {
			title = loc_pref .. "troy_troy_mth_overlay_info_progression_overview_description_title",
			description = loc_pref .. "troy_troy_mth_overlay_info_progression_overview_description_desc",
		},
		has_scripted_tour = true
	},
	{ 
		is_battle = false,
		target_uic = {"monster_progression", "progression_bar","button_list_center_alignment"},
		tooltip_params = {
			title = loc_pref .. "troy_troy_mth_overlay_info_progression_skill_progression_title",
			description = loc_pref .. "troy_troy_mth_overlay_info_progression_skill_progression_desc",
		},
		has_scripted_tour = true
	},
	{ 
		is_battle = false,
		target_uic = {"monster_progression", "container_main","monster_tab_group","tab_recruit","tab_child","container_settlements"},
		tooltip_params = {
			title = loc_pref .. "troy_troy_mth_overlay_info_progression_recruitment_title",
			description = loc_pref .. "troy_troy_mth_overlay_info_progression_recruitment_desc",
		},
		has_scripted_tour = true
	},
	{ 
		is_battle = false,
		target_uic = {"monster_progression", "monster_tab_group_overlay"},
		tooltip_params = {
			title = loc_pref .. "troy_troy_mth_overlay_info_progression_tab_buttons_title",
			description = loc_pref .. "troy_troy_mth_overlay_info_progression_tab_buttons_desc",
		},
		has_scripted_tour = true
	},
	{ 
		is_battle = false,
		target_uic = {"monster_progression", "container_main", "monster_tab_group", "tab_details", "tab_child"},
		tooltip_params = {
			title = loc_pref .. "troy_troy_mth_overlay_info_progression_campaign_actions_title",
			description = loc_pref .. "troy_troy_mth_overlay_info_progression_overview_description_desc",
			list = {
				[1] = {
					text = loc_pref .. "troy_troy_mth_overlay_info_progression_battle_stats_desc",
				},
				[2] = {
					text = loc_pref .. "troy_troy_mth_overlay_info_progression_battle_abilities_desc",
				},
				[3] = {
					text = loc_pref .. "troy_troy_mth_overlay_info_progression_campaign_actions_desc",
				},
			},
		},
		has_scripted_tour = false
	},
	--[[ { 
		is_battle = false,
		target_uic = {"monster_progression", "battle_abilities_overlay"},
		tooltip_params = {
			title = loc_pref .. "troy_troy_mth_overlay_info_progression_battle_abilities_title",
			description = loc_pref .. "troy_troy_mth_overlay_info_progression_battle_abilities_desc",
		},
		has_scripted_tour = true
	},
	{ 
		is_battle = false,
		target_uic = {"monster_progression", "unit_information_overlay"},
		tooltip_params = {
			title = loc_pref .. "troy_troy_mth_overlay_info_progression_battle_stats_title",
			description = loc_pref .. "troy_troy_mth_overlay_info_progression_battle_stats_desc",
		},
		has_scripted_tour = true
	}, --]]
	{ 	
		is_battle = false,
		target_uic = {"faction_widget","faction_widget_list","admin_cost_container"},
		tooltip_params = {
			title = loc_pref .. "troy_mth_overlay_info_admnistration_bar_title",
			description = loc_pref .. "troy_mth_overlay_info_admnistration_bar_desc",
		},
		has_scripted_tour = true
	},


	
	
	
	-- {
	-- 	is_battle = false,
 --		target_uic = {"resource_trading"},
	-- 	tooltip_params = {
	-- 		title = loc_pref .. "foreign_traders_overlay_title",
	-- 		description = loc_pref .. "foreign_traders_overlay_subtitle",
	-- 	},
	-- 	has_scripted_tour = true,
	-- },
	--[[
	{
		is_battle = false,
		target_uic = {"gods_and_favor", "panel_frame", "window_title", "title_panel_base"},
		tooltip_params = {
			title = loc_pref .. "gods_and_favor_overlay_title",
			description = loc_pref .. "gods_and_favor_overlay_subtitle",
		},
		has_scripted_tour = true,
	},
	--]]
	{
		is_battle = false,
		target_uic = {"diplomacy_dropdown","faction_panel", "panel_title", "panel_title_bar", "panel_header"},
		tooltip_params = {
			title = loc_pref .. "diplomacy_overlay_title",
			description = loc_pref .. "diplomacy_overlay_subtitle",
		},
		has_scripted_tour = true,
	},
	{
		is_battle = false,
		target_uic = {"fm_paris_helen_state_of_happiness_overlay"},
		tooltip_params = {
			title = loc_pref .. "fm_paris_helen_state_of_happiness_overlay_title",
			description = loc_pref .. "fm_paris_helen_state_of_happiness_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"helen_bundle"},
		tooltip_params = {
			title = loc_pref .. "fm_paris_helen_happiness_effects_desc_overlay_title",
			description = loc_pref .. "fm_paris_helen_happiness_effects_desc_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_helen","fm_paris_helen_events_buttons_overlay"},
		tooltip_params = {
			title = loc_pref .. "fm_paris_helen_invitation_buttons_overlay_title",
			description = loc_pref .. "fm_paris_helen_invitation_buttons_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "fm_paris_helen_invitation_settlement_list_item_1",
					img = "data/ui/skins/default/io_fm_helen_feast_button.png"
				},
				[2] = {
					text = loc_pref .. "fm_paris_helen_invitation_settlement_list_item_2",
					img = "data/ui/skins/default/io_fm_helen_games_button.png"
				},
				[3] = {
					text = loc_pref .. "fm_paris_helen_invitation_settlement_list_item_3",
					img = "data/ui/skins/default/io_fm_helen_prayer_button.png"
				},
			}
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_paris_helen_invitation_settlement_list_overlay"},
		tooltip_params = {
			title = loc_pref .. "fm_paris_helen_invitation_settlement_list_overlay_title",
			description = loc_pref .. "fm_paris_helen_invitation_settlement_list_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_helen","fm_paris_helen_current_event_bundle_fx_overlay"},
		tooltip_params = {
			title = loc_pref .. "fm_paris_helen_invitation_effects_desc_title",
			description = loc_pref .. "fm_paris_helen_invitation_effects_desc_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_helen", "action_cost", "action_button"},
		tooltip_params = {
			title = loc_pref .. "fm_paris_helen_invitation_confirm_overlay_title",
			description = loc_pref .. "fm_paris_helen_invitation_confirm_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_helen", "action_cost", "cost_container"},
		tooltip_params = {
			title = loc_pref .. "fm_paris_helen_invitation_cost_overlay_title",
			description = loc_pref .. "fm_paris_helen_invitation_cost_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_sarpedon_lycian_trade_faction_list_overlay"},
		tooltip_params = {
			title = loc_pref .. "fm_sarpedon_lycian_trade_faction_list_overlay_title",
			description = loc_pref .. "fm_sarpedon_lycian_trade_faction_list_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_lycian_trade_guild", "options_list", "resource_holder"},
		tooltip_params = {
			title = loc_pref .. "fm_sarpedon_lycian_trade_exotic_goods_overlay_title",
			description = loc_pref .. "fm_sarpedon_lycian_trade_exotic_goods_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_lycian_trade_guild", "options_list", "barter_agreement_listview"},
		tooltip_params = {
			title = loc_pref .. "fm_sarpedon_lycian_trade_barter_agreement_overlay_title",
			description = loc_pref .. "fm_sarpedon_lycian_trade_barter_agreement_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"break_button_row"},
		tooltip_params = {
			title = loc_pref .. "fm_sarpedon_lycian_trade_break_agreement_desc_overlay_title",
			description = loc_pref .. "fm_sarpedon_lycian_trade_break_agreement_desc_overlay_subtitle",
		},
		has_scripted_tour = false,
		priority_override = 2105
	},
	{
		is_battle = false,
		target_uic = {"steal_button_row"},
		tooltip_params = {
			title = loc_pref .. "fm_sarpedon_lycian_trade_steal_agreement_desc_overlay_title",
			description = loc_pref .. "fm_sarpedon_lycian_trade_steal_agreement_desc_overlay_subtitle",
		},
		has_scripted_tour = false,
		priority_override = 2105
	},
	{
		is_battle = false,
		target_uic = {"fm_priam_objectives_list_overlay"},
		tooltip_params = {
			title = loc_pref .. "fm_priam_objectives_list_overlay_title",
			description = loc_pref .. "fm_priam_objectives_list_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_priam_mission_button_overlay"},
		tooltip_params = {
			title = loc_pref .. "fm_priam_mission_button_overlay_title",
			description = loc_pref .. "fm_priam_mission_button_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_priam_mission_details_overlay"},
		tooltip_params = {
			title = loc_pref .. "fm_priam_mission_desc_overlay_title",
			description = loc_pref .. "fm_priam_mission_desc_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"treachery_button_holder"},
		tooltip_params = {
			title = loc_pref .. "fm_priam_sabotage_buttons_overlay_title",
			description = loc_pref .. "fm_priam_sabotage_buttons_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "fm_priam_sabotage_buttons_item_1",
					img = "data/ui/skins/default/io_icon_accuse_of_greed.png"
				},
				[2] = {
					text = loc_pref .. "fm_priam_sabotage_buttons_item_2",
					img = "data/ui/skins/default/io_icon_accuse_of_weakness.png"
				},
				[3] = {
					text = loc_pref .. "fm_priam_sabotage_buttons_item_3",
					img = "data/ui/skins/default/io_icon_pull_rank.png"
				},
			}
		},
	},
	{
		is_battle = false,
		target_uic = {"lords_panel"},
		tooltip_params = {
			title = loc_pref .. "fm_agamemnon_king_of_men_position_list_of_heroes_overlay_title",
			description = loc_pref .. "fm_agamemnon_king_of_men_position_list_of_heroes_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"portrait_holder","office_portrait_template"},
		tooltip_params = {
			title = loc_pref .. "fm_agamemnon_king_of_men_position_slots_overlay_title",
			description = loc_pref .. "fm_agamemnon_king_of_men_position_slots_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"king_of_men_position_button_overlay"},
		tooltip_params = {
			title = loc_pref .. "fm_agamemnon_king_of_men_position_buttons_overlay_title",
			description = loc_pref .. "fm_agamemnon_king_of_men_position_buttons_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"offices_panel","tier_info_1"},
		tooltip_params = {
			title = loc_pref .. "fm_agamemnon_king_of_men_position_legend_overlay_title",
			description = loc_pref .. "fm_agamemnon_king_of_men_position_legend_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"offices_panel","tier_info_2"},
		tooltip_params = {
			title = loc_pref .. "fm_agamemnon_king_of_men_position_legend_overlay_title",
			description = loc_pref .. "fm_agamemnon_king_of_men_position_legend_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"offices_panel","tier_info_3"},
		tooltip_params = {
			title = loc_pref .. "fm_agamemnon_king_of_men_position_legend_overlay_title",
			description = loc_pref .. "fm_agamemnon_king_of_men_position_legend_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"king_of_men_position_slots_overlay"},
		tooltip_params = {
			title = loc_pref .. "fm_agamemnon_king_of_men_position_slots_overlay_title",
			description = loc_pref .. "fm_agamemnon_king_of_men_position_slots_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"main_buttons","button_gaf_overlay"},
		tooltip_params = {
			title = loc_pref .. "button_gaf_overlay_title",
			description = loc_pref .. "button_gaf_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{ --Building Browser for Hordes
		is_battle = false,
		target_uic = {"building_browser","listview"},
		tooltip_params = {
			title = loc_pref .. "building_browser_overlay_title",
			description = loc_pref .. "phar_sea_building_browser_horde_overlay_subtitle",
		},
		has_scripted_tour = false,
		show_condition = function()
			local uic = core:get_ui_root():SequentialFind("building_browser", "panel", "horde_parent")
			return uic and uic:Visible()
		end,
	},
	{ --Building Browser for Settled Factions
		is_battle = false,
		target_uic = {"building_browser","listview"},
		tooltip_params = {
			title = loc_pref .. "building_browser_overlay_title",
			description = loc_pref .. "building_browser_overlay_subtitle",
		},
		has_scripted_tour = false,
		show_condition = function()
			local uic = core:get_ui_root():SequentialFind("building_browser", "panel", "horde_parent")
			return uic and not uic:Visible()
		end,
	},
	{
		is_battle = false,
		target_uic = {"garrison_docker","garrison_panel"},
		tooltip_params = {
			title = loc_pref .. "garrison_overlay_title",
			description = loc_pref .. "garrison_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"diplomacy_dropdown","faction_left_status_panel"},
		tooltip_params = {
			title = loc_pref .. "diplomacy_own_faction_overlay_title",
			description = loc_pref .. "diplomacy_own_faction_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"diplomacy_dropdown","faction_right_status_panel"},
		tooltip_params = {
			title = loc_pref .. "diplomacy_other_faction_overlay_title",
			description = loc_pref .. "diplomacy_other_faction_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"diplomacy_dropdown","sortable_list_factions"},
		tooltip_params = {
			title = loc_pref .. "diplomacy_faction_list_overlay_title",
			description = loc_pref .. "diplomacy_faction_list_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"diplomacy_dropdown","negotiate_submenu"},
		tooltip_params = {
			title = loc_pref .. "diplomacy_central_buttons_overlay_title",
			description = loc_pref .. "diplomacy_central_buttons_overlay_subtitle",
		},
		has_scripted_tour = false,
		show_condition = function()
			local uic = core:get_ui_root():SequentialFind("diplomacy_dropdown","negotiate_submenu")
			return uic and uic:ChildCount() > 0
		end,
	},
	{
		is_battle = false,
		target_uic = {"diplomacy_dropdown","war_coordination_buttonset"},
		tooltip_params = {
			title = loc_pref .. "diplomacy_coordination_options_overlay_title",
			description = loc_pref .. "diplomacy_coordination_options_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"diplomacy_dropdown","embed_informant_buttonset", "button_slot1"},
		tooltip_params = {
			title = loc_pref .. "diplomacy_embed_informant_title",
			description = loc_pref .. "diplomacy_embed_informant_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"offers_list_panel","offers_buttons_list_1"},
		tooltip_params = {
			title = loc_pref .. "diplomacy_offer_subpanel_bottom_buttons_overlay_title",
			description = loc_pref .. "diplomacy_offer_subpanel_bottom_buttons_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"diplomacy_dropdown", "bottom_submenu", "resource_filter"},
		tooltip_params = {
			title = loc_pref .. "phar_main_diplomacy_resource_filter_overlay_title",
			description = loc_pref .. "phar_main_diplomacy_resource_filter_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"diplomacy_dropdown", "bottom_submenu", "quick_deal_submenu_holder", "quick_deal_submenu"},
		tooltip_params = {
			title = loc_pref .. "phar_main_diplomacy_quick_deal_overlay_title",
			description = loc_pref .. "phar_main_diplomacy_quick_deal_overlay_subtitle",
		},
		has_scripted_tour = true,
	},
	{
		is_battle = false,
		target_uic = {"popup_pre_battle","allies_combatants_panel"},
		tooltip_params = {
			title = loc_pref .. "pre_battle_ally_overlay_title",
			description = loc_pref .. "pre_battle_ally_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"popup_pre_battle","enemy_combatants_panel"},
		tooltip_params = {
			title = loc_pref .. "pre_battle_enemy_overlay_title",
			description = loc_pref .. "pre_battle_enemy_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"popup_pre_battle","mid", "battle_deployment", "regular_deployment", "button_set_attack"},
		tooltip_params = {
			title = loc_pref .. "pre_battle_options_overlay_title",
			description = loc_pref .. "pre_battle_options_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "pre_battle_options_overlay_subtitle_2",
					img = "data/ui/skins/default/pre_battle_post_battle/icon_pre_post_battle_attack.png"
				},
				[2] = {
					text = loc_pref .. "pre_battle_options_overlay_subtitle_3",
					img = "data/ui/skins/default/custom_battle/icon_autogenerate.png"
				},
				[3] = {
					text = loc_pref .. "pre_battle_options_overlay_subtitle_4",
					img = "data/ui/skins/default/pre_battle_post_battle/icon_pre_post_battle_retreat.png"
				},
				[4] = {
					text = loc_pref .. "pre_battle_options_overlay_subtitle_8"
				},
			}
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"popup_pre_battle","siege_information_panel", "attacker_recruitment_options", "equipment_frame"},
		tooltip_params = {
			title = loc_pref .. "pre_battle_siege_options_overlay_title",
			description = loc_pref .. "pre_battle_siege_options_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "phar_main_pre_battle_siege_options_overlay_subtitle_4",
					img = "data/ui/skins/default/pre_battle_post_battle/icon_pre_post_battle_overlay_tooltip_ladder.png"
				},
				[2] = {
					text = loc_pref .. "phar_main_pre_battle_siege_options_overlay_subtitle_3",
					img = "data/ui/skins/default/pre_battle_post_battle/icon_pre_post_battle_overlay_tooltip_tower.png"
				},
				[3] = {
					text = loc_pref .. "phar_main_pre_battle_siege_options_overlay_subtitle_5",
					img = "data/ui/skins/default/pre_battle_post_battle/icon_pre_post_battle_overlay_tooltip_tower_damaged.png"
				},
				[4] = {
					text = loc_pref .. "pre_battle_siege_options_overlay_subtitle_2",
					img = "data/ui/skins/default/pre_battle_post_battle/icon_pre_post_battle_overlay_tooltip_battering_ram.png"
				},
			}
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"popup_battle_results","menu_bar_plate"},
		tooltip_params = {
			title = loc_pref .. "post_battle_options_overlay_title",
			description = loc_pref .. "post_battle_options_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"city_info_bar","icon_Helen"},
		tooltip_params = {
			title = loc_pref .. "fm_paris_helen_campaign_map_icon_overlay_title",
			description = loc_pref .. "fm_paris_helen_campaign_map_icon_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"popup_battle_results","button_set_win_holder"},
		tooltip_params = {
			title = loc_pref .. "post_battle_options_overlay_title",
			description = loc_pref .. "post_battle_options_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"popup_pre_battle","button_set_siege"},
		tooltip_params = {
			title = loc_pref .. "pre_battle_options_overlay_title",
			description = loc_pref .. "pre_battle_options_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "pre_battle_options_overlay_subtitle_2",
					img = "data/ui/skins/default/pre_battle_post_battle/icon_pre_post_battle_attack.png"
				},
				[2] = {
					text = loc_pref .. "pre_battle_options_overlay_subtitle_3",
					img = "data/ui/skins/default/custom_battle/icon_autogenerate.png"
				},
				[3] = {
					text = loc_pref .. "pre_battle_options_overlay_subtitle_4",
					img = "data/ui/skins/default/pre_battle_post_battle/icon_pre_post_battle_retreat.png"
				},
				[4] = {
					text = loc_pref .. "pre_battle_options_overlay_subtitle_5",
					img = "data/ui/skins/default/pre_battle_post_battle/icon_pre_post_battle_siege.png"
				},
				[5] = {
					text = loc_pref .. "pre_battle_options_overlay_subtitle_8"
				},
			}
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"settlement_captured"},
		tooltip_params = {
			title = loc_pref .. "post_battle_options_overlay_title",
			description = loc_pref .. "post_battle_options_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"tab_victory_conditions","inner_frame_old"},
		tooltip_params = {
			title = loc_pref .. "objectives_personal_victory_overlay_title",
			description = loc_pref .. "objectives_personal_victory_overlay_subtitle",
		},
		has_scripted_tour = false,
		show_condition = function()
			local homeric_victory_button = core:get_ui_root():SequentialFind("tab_victory_conditions", "tree_holder", "victory_type_tree", "slot_parent", "troy_main_victory_type_personal")
			local state = homeric_victory_button and homeric_victory_button:CurrentState() or ""
			return string.find(state, "selected")
		end
	},
	{
		is_battle = false,
		target_uic = {"tab_victory_conditions","inner_frame_old"},
		tooltip_params = {
			title = loc_pref .. "objectives_total_war_victory_overlay_title",
			description = loc_pref .. "objectives_total_war_victory_overlay_subtitle",
		},
		has_scripted_tour = false,
		show_condition = function()
			local homeric_victory_button = core:get_ui_root():SequentialFind("tab_victory_conditions", "tree_holder", "victory_type_tree", "slot_parent", "troy_main_victory_type_personal")
			local state = homeric_victory_button and homeric_victory_button:CurrentState() or ""
			return not string.find(state, "selected")
		end
	},
	{
		is_battle = false,
		target_uic = {"technology_panel","listview"},
		tooltip_params = {
			title = loc_pref .. "royal_decrees_overlay_title",
			description = loc_pref .. "phar_main_royal_decrees_overlay_subtitle",
			--[[
			list = {
				[1] = {
					text = loc_pref .. "royal_decrees_overlay_subtitle_2",
					img = "data/ui/skins/default/io_icon_cost.png"
				},
			}
			]]
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"benevolence_bar_holder"},
		tooltip_params = {
			title = loc_pref .. "fm_priam_benevolence_bar_overlay_title",
			description = loc_pref .. "fm_priam_benevolence_bar_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "fm_priam_benevolence_bar_item_1"
				},
				[2] = {
					text = loc_pref .. "fm_priam_benevolence_bar_item_2"
				},
				[3] = {
					text = loc_pref .. "fm_priam_benevolence_bar_item_3"
				},
			}
		},
	},
	{
		is_battle = false,
		target_uic = {"button_negotiate"},
		tooltip_params = {
			title = loc_pref .. "diplomacy_overlay_negotiate_title",
			description = loc_pref .. "diplomacy_overlay_negotiate_subtitle",
		},
		has_scripted_tour = true
	},
	--[[
	{
		is_battle = false,
		target_uic = {"button_quick_deal"},
		tooltip_params = {
			title = loc_pref .. "diplomacy_overlay_quickdeal_title",
			description = loc_pref .. "diplomacy_overlay_quickdeal_subtitle",
		},
		has_scripted_tour = true
	},
	{
		is_battle = false,
		target_uic = {"negotiate_button"},
		tooltip_params = {
			title = loc_pref .. "diplomacy_overlay_negotiate_title",
			description = loc_pref .. "diplomacy_overlay_negotiate_subtitle",
		},
		has_scripted_tour = true
	},
	]]
	{
		is_battle = false,
		target_uic = {"CharacterInfoPopup", "character_content"},
		tooltip_params = {
			title = loc_pref .. "army_commanders_overlay_title",
			description = loc_pref .. "army_commanders_overlay_subtitletitle",
		},
		has_scripted_tour = true
	},
	{
		is_battle = false,
		target_uic = {"tab_horde_buildings_slot", "tab_horde_buildings"},
		tooltip_params = {
			title = loc_pref .. "horde_construction_overlay_title",
			description = loc_pref .. "horde_construction_overlay_subtitle",
		},
		has_scripted_tour = false,
		show_condition = function()
			local transfer_units_check = core:get_ui_root():SequentialFind("unit_exchange" , "main_units_panel_2")
			return not transfer_units_check or not transfer_units_check:Visible()
		end
	},
	{
		is_battle = false,
		target_uic = {"units_panel", "main_units_panel", "horde_building_frame"},
		tooltip_params = {
			title = loc_pref .. "horde_construction_overlay_title",
			description = loc_pref .. "dlc1_horde_construction_overlay_subtitle_2",
		},
		has_scripted_tour = true,
	},
	{
		is_battle = false,
		target_uic = {"fm_amazon_kingdom_milestones", "panel_frame", "panel", "label_amazon_treasures"},
		tooltip_params = {
			title = loc_pref .. "dlc1_label_amazon_treasures_overlay_subtitle",
			description = loc_pref .. "dlc1_label_amazon_treasures_overlay_title",
		},
		has_scripted_tour = true,
	},
	{
		is_battle = false,
		target_uic = { "fm_amazon_kingdom_milestones", "panel_frame", "milestone_parent", "milestone_0", "feat_icon_bg", "feat_icon" },
		tooltip_params = {
			title = loc_pref .. "dlc1_feat_icon_0_overlay_title",
			description = loc_pref .. "dlc1_feat_icon_0_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "fm_amazon_kingdom_milestones", "panel_frame", "milestone_parent", "milestone_1", "feat_icon_bg", "feat_icon" },
		tooltip_params = {
			title = loc_pref .. "dlc1_feat_icon_1_overlay_title",
			description = loc_pref .. "dlc1_feat_icon_1_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "fm_amazon_kingdom_milestones", "panel_frame", "milestone_parent", "milestone_2", "feat_icon_bg", "feat_icon"  },
		tooltip_params = {
			title = loc_pref .. "dlc1_feat_icon_2_overlay_title",
			description = loc_pref .. "dlc1_feat_icon_2_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "fm_amazon_kingdom_milestones", "panel_frame", "milestone_parent", "milestone_3", "feat_icon_bg", "feat_icon" },
		tooltip_params = {
			title = loc_pref .. "dlc1_feat_icon_3_overlay_title",
			description = loc_pref .. "dlc1_feat_icon_3_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "fm_amazon_kingdom_milestones", "panel_frame", "milestone_parent", "milestone_4", "feat_icon_bg", "feat_icon" },
		tooltip_params = {
			title = loc_pref .. "dlc1_feat_icon_4_overlay_title",
			description = loc_pref .. "dlc1_feat_icon_4_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "fm_amazon_kingdom_milestones", "panel_frame", "milestone_parent" },
		tooltip_params = {
			title = loc_pref .. "dlc1_milestones_overlay_title",
			description = loc_pref .. "dlc1_milestones_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "units_panel", "main_units_panel", "tabgroup", "tab_army_slot", "tab_army" },
		tooltip_params = {
			title = loc_pref .. "dlc1_horde_tab_army_overlay_title",
			description = loc_pref .. "dlc1_horde_tab_army_overlay_subtitle",
		},
		has_scripted_tour = false,
		show_condition = function()
			local transfer_units_check = core:get_ui_root():SequentialFind("unit_exchange" , "main_units_panel_2")
			return not transfer_units_check or not transfer_units_check:Visible()
		end
	},
	{
		is_battle = false,
		target_uic = { "momentum_overlay" },
		tooltip_params = {
			title = loc_pref .. "dlc1_momentum_overlay_title",
			description = loc_pref .. "dlc1_momentum_overlay_subtitle",
		},
		has_scripted_tour = false,
		show_condition = function()
			local transfer_units_check = core:get_ui_root():SequentialFind("unit_exchange" , "main_units_panel_2")
			return not transfer_units_check or not transfer_units_check:Visible()
		end
	},
	{
		is_battle = false,
		target_uic = { "blood_oath_overlay" },
		tooltip_params = {
			title = loc_pref .. "dlc1_blood_oath_overlay_title",
			description = loc_pref .. "dlc1_blood_oath_overlay_subtitle",
		},
		has_scripted_tour = false,
		show_condition = function()
			local transfer_units_check = core:get_ui_root():SequentialFind("unit_exchange" , "main_units_panel_2")
			return not transfer_units_check or not transfer_units_check:Visible()
		end
	},
	{
		is_battle = false,
		target_uic = { "units_1_overlay" },
		tooltip_params = {
			title = loc_pref .. "dlc1_initiation_units_1_overlay_title",
			description = loc_pref .. "dlc1_initiation_units_1_overlay_subtitle",
		},
		has_scripted_tour = false
	},
	{
		is_battle = false,
		target_uic = { "units_2_overlay" },
		tooltip_params = {
			title = loc_pref .. "dlc1_initiation_units_2_overlay_title",
			description = loc_pref .. "dlc1_initiation_units_2_overlay_subtitle",
		},
		has_scripted_tour = false
	},
	{
		is_battle = false,
		target_uic = { "capture_bonus_overlay" },
		tooltip_params = {
			title = loc_pref .. "dlc1_capture_bonus_overlay_title",
			description = loc_pref .. "dlc1_capture_bonus_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "total_battle_glory" },
		tooltip_params = {
			title = loc_pref .. "dlc1_total_battle_glory_overlay_title",
			description = loc_pref .. "dlc1_total_battle_glory_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_blood_oath", "oath_parent", "blood_oath_0"},
		tooltip_params = {
			title = loc_pref .. "dlc1_oaths_overlay_locked_title",
			description = loc_pref .. "dlc1_oaths_overlay_locked_subtitle",
		},
		has_scripted_tour = false,
		show_condition = function()
			local unlock_check_1 = core:get_ui_root():SequentialFind("fm_blood_oath", "oath_parent", "blood_oath_0", "skill_icon_frame", "feat_icon")
			local state = unlock_check_1 and unlock_check_1:CurrentState() or ""
			return string.find(state, "available")
		end
	},
	{
		is_battle = false,
		target_uic = {"fm_blood_oath", "oath_parent", "blood_oath_0"},
		tooltip_params = {
			title = loc_pref .. "dlc1_oaths_overlay_unlocked_title",
			description = loc_pref .. "dlc1_oaths_overlay_unlocked_subtitle",
		},
		has_scripted_tour = false,
		show_condition = function()
			local unlock_check_2 = core:get_ui_root():SequentialFind("fm_blood_oath", "oath_parent", "blood_oath_0", "skill_icon_frame", "feat_icon")
			local state = unlock_check_2 and unlock_check_2:CurrentState() or ""
			return string.find(state, "unlocked")
		end
	},
	{
		is_battle = false,
		target_uic = {"fm_blood_oath", "oath_parent", "blood_oath_2"},
		tooltip_params = {
			title = loc_pref .. "dlc1_oaths_overlay_upgrade_title",
			description = loc_pref .. "dlc1_oaths_overlay_upgrade_subtitle",
		},
		has_scripted_tour = false,
		show_condition = function()
			local upgrade_check_1 = core:get_ui_root():SequentialFind("fm_blood_oath", "unlock_button")
			local upgrade_check_2 = core:get_ui_root():SequentialFind("fm_blood_oath", "oath_parent", "blood_oath_0", "skill_icon_frame", "feat_icon")
			local state_1 = upgrade_check_2 and upgrade_check_2:CurrentState() or ""
			return string.find(state_1, "unlocked") and upgrade_check_1
		end
	},
	{
		is_battle = false,
		target_uic = {"gods_levels_overlay"},
		tooltip_params = {
			title = loc_pref .. "button_gaf_overlay_title",
			description = loc_pref .. "divine_will_overlay_subtitle_2",
			list = {
				[1] = {
					text = loc_pref .. "divine_will_overlay_subtitle_2_1",
					img = "data/ui/skins/default/io_fx_icon_zeus_gaf_positive.png"
				},
				[2] = {
					text = loc_pref .. "divine_will_overlay_subtitle_2_2",
					img = "data/ui/skins/default/io_fx_icon_ares_gaf_negative.png"
				},
				[3] = {
					text = loc_pref .. "divine_will_overlay_subtitle_2_3",
					img = "data/ui/skins/default/io_fx_icon_apollo_gaf_neutral.png"
				},
			}
		},
		has_scripted_tour = true,
	},
	{
		is_battle = false,
		target_uic = {"favour_decay"},
		tooltip_params = {
			title = loc_pref .. "button_gaf_overlay_title",
			description = loc_pref .. "divine_will_overlay_subtitle_3",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"god_template"},
		tooltip_params = {
			title = loc_pref .. "button_gaf_overlay_title",
			description = loc_pref .. "divine_will_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"container_hecatomb_prayer","prayer_holder"},
		tooltip_params = {
			title = loc_pref .. "button_gaf_overlay_prayer_title",
			description = loc_pref .. "divine_will_overlay_subtitle_4",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"container_hecatomb_prayer","hecatomb_holder"},
		tooltip_params = {
			title = loc_pref .. "button_gaf_overlay_hecatomb_title",
			description = loc_pref .. "divine_will_overlay_subtitle_5",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"unit_exchange", "main_units_panel_1"},
		tooltip_params = {
			title = loc_pref .. "unit_exchange_overlay_title",
			description = loc_pref .. "unit_exchange_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	-- troy_adi info overlays
	-- FM Ajax's Renown
	{
		is_battle = false,
		target_uic = {"fm_ajax_renown_container"},
		tooltip_params = {
			title = loc_pref .. "faction_mechanics_overlay_title",
			description = loc_pref .. "faction_mechanics_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_ajaxs_renown", "panel", "celebrations_bar", "prizes_panel"},
		tooltip_params = {
			title = loc_pref .. "adi_ajax_fm2_prizes_title",
			description = loc_pref .. "adi_ajax_fm2_prizes_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_ajaxs_renown", "panel", "celebrations_bar", "guests_panel", "list_factions"},
		tooltip_params = {
			title = loc_pref .. "adi_ajax_fm2_guests_title",
			description = loc_pref .. "adi_ajax_fm2_guests_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_ajaxs_renown", "panel", "celebrations_bar", "guests_panel", "celebrations_button", "menu_bar_plate"},
		tooltip_params = {
			title = loc_pref .. "adi_ajax_fm2_celebration_button_title",
			description = loc_pref .. "adi_ajax_fm2_celebration_button_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_ajaxs_renown", "panel", "renown_bar", "total_renown", "renown_bar_parent", "top_plate"},
		tooltip_params = {
			title = loc_pref .. "adi_ajax_fm2_renown_bar_title",
			description = loc_pref .. "adi_ajax_fm2_renown_bar_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_ajaxs_renown", "panel", "renown_bar", "total_renown", "tier_effects", "renown_bundle"},
		tooltip_params = {
			title = loc_pref .. "adi_ajax_fm2_renown_effects_title",
			description = loc_pref .. "adi_ajax_fm2_renown_effects_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "adi_ajax_fm2_renown_effects_subtitle_1",
					img = "data/ui/skins/default/fm_offices_icon_diplomacy.png"
				},
			}
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_ajaxs_renown", "panel", "renown_bar", "renown_missions_holder"},
		tooltip_params = {
			title = loc_pref .. "adi_ajax_fm2_mission_list_title",
			description = loc_pref .. "adi_ajax_fm2_mission_list_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "adi_ajax_fm2_mission_list_subtitle_1",
					img = "data/ui/skins/default/icon_cmp_menu_missions.png"
				},
				[2] = {
					text = loc_pref .. "adi_ajax_fm2_mission_list_subtitle_2",
					img = "data/ui/skins/default/icon_cmp_menu_missions.png"
				},
				[3] = {
					text = loc_pref .. "adi_ajax_fm2_mission_list_subtitle_3",
					img = "data/ui/skins/default/icon_cmp_menu_missions.png"
				},
				[4] = {
					text = loc_pref .. "adi_ajax_fm2_mission_list_subtitle_4",
					img = "data/ui/skins/default/icon_cmp_menu_missions.png"
				},
			}
		},
		has_scripted_tour = false,
	},
	-- FM Champion Challenge
	{
		is_battle = false,
		target_uic = {"fm_ajax_champions_container"},
		tooltip_params = {
			title = loc_pref .. "faction_mechanics_overlay_title",
			description = loc_pref .. "faction_mechanics_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_ajaxs_champion_challenge", "panel", "side_bar", "total_renown", "renown_bar_parent", "top_plate"},
		tooltip_params = {
			title = loc_pref .. "adi_ajax_fm1_renown_bar_title",
			description = loc_pref .. "adi_ajax_fm1_renown_bar_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_ajaxs_champion_challenge", "panel", "side_bar", "challenge_champions"},
		tooltip_params = {
			title = loc_pref .. "adi_ajax_fm1_champions_list_title",
			description = loc_pref .. "adi_ajax_fm1_champions_list_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "adi_ajax_fm1_champions_list_subtitle_1",
					img = "data/ui/skins/default/icon_upkeep.png"
				},
				[2] = {
					text = loc_pref .. "adi_ajax_fm1_champions_list_subtitle_2",
					img = "data/ui/skins/default/sp_icon_garrison_strenght.png"
				},
			}
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"champion_info"},
		tooltip_params = {
			title = loc_pref .. "adi_ajax_fm1_champions_list_title",
			description = loc_pref .. "adi_ajax_fm1_champions_list_subtitle_3",
			list = {
				[1] = {
					text = loc_pref .. "adi_ajax_fm1_champions_list_subtitle_1",
					img = "data/ui/skins/default/icon_upkeep.png"
				},
				[2] = {
					text = loc_pref .. "adi_ajax_fm1_champions_list_subtitle_4",
					img = "data/ui/skins/default/sp_icon_garrison_strenght.png"
				},
			}
		},
		has_scripted_tour = false,
		show_condition = function()
			local fm_panel_check = core:get_ui_root():SequentialFind("fm_ajaxs_champion_challenge", "panel", "side_bar", "challenge_champions")
			return not fm_panel_check
		end
	},
	
	-- FM Military Strategy
	{
		is_battle = false,
		target_uic = {"fm_dio_military_strategy_container"},
		tooltip_params = {
			title = loc_pref .. "faction_mechanics_overlay_title",
			description = loc_pref .. "faction_mechanics_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_dio_2", "panel", "content", "sidebar", "container_at_war"},
		tooltip_params = {
			title = loc_pref .. "adi_dio_fm2_factions_at_war_title",
			description = loc_pref .. "adi_dio_fm2_factions_at_war_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_dio_2", "panel", "content", "sidebar", "container_at_peace"},
		tooltip_params = {
			title = loc_pref .. "adi_dio_fm2_factions_at_peace_title",
			description = loc_pref .. "adi_dio_fm2_factions_at_peace_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_dio_2", "dom_container"},
		tooltip_params = {
			title = loc_pref .. "adi_dio_fm2_dominance_bar_title",
			description = loc_pref .. "adi_dio_fm2_dominance_bar_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_dio_2", "panel", "objectives_panel"},
		tooltip_params = {
			title = loc_pref .. "adi_dio_fm2_objectives_panel_title",
			description = loc_pref .. "adi_dio_fm2_objectives_panel_subtitle",
		},
		has_scripted_tour = false,
	},
	-- FM Argos' Fines
	{
		is_battle = false,
		target_uic = {"fm_dio_champions_container"},
		tooltip_params = {
			title = loc_pref .. "faction_mechanics_overlay_title",
			description = loc_pref .. "faction_mechanics_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_dio_1", "panel", "panel_clip", "side_bar", "unit_list", "unit_list_container"},
		tooltip_params = {
			title = loc_pref .. "adi_dio_fm1_unit_list_title",
			description = loc_pref .. "adi_dio_fm1_unit_list_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_dio_1", "panel", "panel_clip", "side_bar", "teacher_list_container", "teacher_list_container"},
		tooltip_params = {
			title = loc_pref .. "adi_dio_fm1_teacher_list_title",
			description = loc_pref .. "adi_dio_fm1_teacher_list_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "adi_dio_fm1_teacher_list_subtitle_1",
					img = "UI/skins/default/ic_troy_adi_sp_dio_epigoni.png"
				},
			}
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_dio_1", "unit", "container"},
		tooltip_params = {
			title = loc_pref .. "adi_dio_fm1_unit_under_training_title",
			description = loc_pref .. "adi_dio_fm1_unit_under_training_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_dio_1", "teacher", "container"},
		tooltip_params = {
			title = loc_pref .. "adi_dio_fm1_selected_teacher_title",
			description = loc_pref .. "adi_dio_fm1_selected_teacher_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_dio_1", "btn_start_training"},
		tooltip_params = {
			title = loc_pref .. "adi_dio_fm1_btn_start_training_title",
			description = loc_pref .. "adi_dio_fm1_btn_start_training_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_dio_1", "teacher", "text_container"},
		tooltip_params = {
			title = loc_pref .. "adi_dio_fm1_training_time_text_title",
			description = loc_pref .. "adi_dio_fm1_training_time_text_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_dio_1", "panel", "unit_in_training", "teacher", "footer", "btn_container", "btn_cancel_training"},
		tooltip_params = {
			title = loc_pref .. "adi_dio_fm1_btn_cancel_training_title",
			description = loc_pref .. "adi_dio_fm1_btn_cancel_training_subtitle",
		},
		has_scripted_tour = false,
	},

	--FM Thracian Rituals
	{
		is_battle = false,
		target_uic = { "fm_rhes_thracian_overlay"},
		tooltip_params = {
			title = loc_pref .. "faction_mechanics_overlay_title",
			description = loc_pref .. "faction_mechanics_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "fm_rhesus_2", "panel", "content", "clusters_list", "passive"},
		tooltip_params = {
			title = loc_pref .. "rem_rhesus_fm2_btn_show_divine_offerings_title",
			description = loc_pref .. "rem_rhesus_fm2_btn_show_divine_offerings_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "fm_rhesus_2", "panel", "content", "clusters_list", "armies"},
		tooltip_params = {
			title = loc_pref .. "rem_rhesus_fm2_btn_show_holy_sacrifices_title",
			description = loc_pref .. "rem_rhesus_fm2_btn_show_holy_sacrifices_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "fm_rhesus_2", "panel", "content", "clusters_list", "provinces"},
		tooltip_params = {
			title = loc_pref .. "rem_rhesus_fm2_btn_show_religious_mysteries_title",
			description = loc_pref .. "rem_rhesus_fm2_btn_show_religious_mysteries_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "fm_rhesus_2", "panel", "content", "clusters_list", "elite_units"},
		tooltip_params = {
			title = loc_pref .. "rem_rhesus_fm2_btn_show_sacred_initiations_title",
			description = loc_pref .. "rem_rhesus_fm2_btn_show_sacred_initiations_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "fm_rhesus_2", "panel", "content", "rituals_content", "menu_bar_plate_view_legacy", "bar_ornaments"},
		tooltip_params = {
			title = loc_pref .. "rem_rhesus_fm2_btn_perform_ritual_title",
			description = loc_pref .. "rem_rhesus_fm2_btn_perform_ritual_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "fm_rhesus_2", "panel", "content", "rituals_content", "info_overlay_containers", "divine_offerings_overlay"},
		tooltip_params = {
			title = loc_pref .. "rem_rhesus_fm2_divine_offerings_list_title",
			description = loc_pref .. "rem_rhesus_fm2_divine_offerings_list_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "fm_rhesus_2", "panel", "content", "rituals_content", "info_overlay_containers", "holy_sacrifices_overlay"},
		tooltip_params = {
			title = loc_pref .. "rem_rhesus_fm2_holy_sacrifices_list_title",
			description = loc_pref .. "rem_rhesus_fm2_holy_sacrifices_list_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "fm_rhesus_2", "panel", "content", "rituals_content", "info_overlay_containers", "religious_mysteries_overlay"},
		tooltip_params = {
			title = loc_pref .. "rem_rhesus_fm2_religious_mysteries_list_title",
			description = loc_pref .. "rem_rhesus_fm2_religious_mysteries_list_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "fm_rhesus_2", "panel", "content", "rituals_content", "info_overlay_containers", "sacred_initiations_overlay"},
		tooltip_params = {
			title = loc_pref .. "rem_rhesus_fm2_sacred_initiations_list_title",
			description = loc_pref .. "rem_rhesus_fm2_sacred_initiations_list_subtitle",
		},
		has_scripted_tour = false,
	},

	--FM Countless Host
	{
		is_battle = false,
		target_uic = { "fm_rhes_countless_overlay"},
		tooltip_params = {
			title = loc_pref .. "faction_mechanics_overlay_title",
			description = loc_pref .. "faction_mechanics_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_rhesus_1", "panel", "counters_container", "forest_settlement_counters", "forest_settlements_btn"},
		tooltip_params = {
			title = loc_pref .. "rem_rhesus_fm1_btn_show_forest_settlements_title",
			description = loc_pref .. "rem_rhesus_fm1_btn_show_forest_settlements_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_rhesus_1", "panel", "counters_container", "forest_settlement_counters", "counters_forests" },
		tooltip_params = {
			title = loc_pref .. "rem_rhesus_fm1_available_forest_settlement_title",
			description = loc_pref .. "rem_rhesus_fm1_available_forest_settlement_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_rhesus_1", "panel", "settlements_container", " list_of_used_settlements", "zoom_button"},
		tooltip_params = {
			title = loc_pref .. "rem_rhesus_fm1_btn_show_host_armies_title",
			description = loc_pref .. "rem_rhesus_fm1_btn_show_host_armies_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_rhesus_1", "panel", "content", "settlements_container", "list_clip"},
		tooltip_params = {
			title = loc_pref .. "rem_rhesus_fm1_btn_owned_forest_settlements_title",
			description = loc_pref .. "rem_rhesus_fm1_btn_owned_forest_settlements_subtitle",
		},
		has_scripted_tour = false,
	},
--	{
--		is_battle = false,
--		target_uic = {"fm_rhesus_1", "panel",  "settlements_container", "list_view", "list_box", "list_of_used_settlements"},
--		tooltip_params = {
--			title = loc_pref .. "rem_rhesus_fm1_btn_owned_forest_settlements_army_title",
--			description = loc_pref .. "rem_rhesus_fm1_btn_owned_forest_settlements_army_subtitle",
--		},
--		has_scripted_tour = false,
--	},
	{
		is_battle = false,
		target_uic = {"fm_rhesus_1", "panel", "recruitment_panel", "recruitment_units_header"},
		tooltip_params = {
			title = loc_pref .. "rem_rhesus_fm1_unit_list_title",
			description = loc_pref .. "rem_rhesus_fm1_unit_list_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_rhesus_1", "panel", "recruitment_panel", "recruitment_army_header"},
		tooltip_params = {
			title = loc_pref .. "rem_rhesus_fm1_unit_current_host_army_title",
			description = loc_pref .. "rem_rhesus_fm1_unit_current_host_army_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = {"fm_rhesus_1", "panel", "btn_view_legacy"},
		tooltip_params = {
			title = loc_pref .. "rem_rhesus_fm1_btn_summon_title",
			description = loc_pref .. "rem_rhesus_fm1_btn_summon_subtitle",
		},
		has_scripted_tour = false,
	},
	--FM Pharaoh's Servant
	{
		is_battle = false,
		target_uic = { "fm_memnon_pharaohs_overlay"},
		tooltip_params = {
			title = loc_pref .. "faction_mechanics_overlay_title",
			description = loc_pref .. "faction_mechanics_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "fm_memnon_1", "panel_frame", "panel", "info_overlays", "aethiopia_overlay"},
		tooltip_params = {
			title = loc_pref .. "rem_memnon_pharaohs_servant_aethiopia_region_title",
			description = loc_pref .. "rem_memnon_pharaohs_servant_aethiopia_region_description",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "fm_memnon_1", "panel_frame", "panel", "info_overlays", "egypt_overlay"},
		tooltip_params = {
			title = loc_pref .. "rem_memnon_pharaohs_servant_egypt_region_title",
			description = loc_pref .. "rem_memnon_pharaohs_servant_egypt_region_description",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "fm_memnon_1", "panel_frame", "panel", "info_overlays", "canaan_overlay"},
		tooltip_params = {
			title = loc_pref .. "rem_memnon_pharaohs_servant_canaan_region_title",
			description = loc_pref .. "rem_memnon_pharaohs_servant_canaan_region_description",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "fm_memnon_1", "panel_frame", "panel", "info_overlays", "susa_overlay"},
		tooltip_params = {
			title = loc_pref .. "rem_memnon_pharaohs_servant_susa_region_title",
			description = loc_pref .. "rem_memnon_pharaohs_servant_susa_region_description",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "fm_memnon_1","region_container","Region_details","details_holder","list_clip", "list_box", "square_ornament_button_orange"},
		tooltip_params = {
			title = loc_pref .. "rem_memnon_pharaohs_servant_call_reinforcements_button_title",
			description = loc_pref .. "rem_memnon_pharaohs_servant_call_reinforcements_button_description",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "fm_memnon_1","region_container","Region_details","details_holder","list_clip", "list_box", "recruitment_items"},
		tooltip_params = {
			title = loc_pref .. "rem_memnon_pharaohs_servant_territory_units_title",
			description = loc_pref .. "rem_memnon_pharaohs_servant_territory_units_description",
		},
		has_scripted_tour = false,
	},
	--FM Exotic Strategist
	{
		is_battle = false,
		target_uic = { "fm_memnon_exotic_overlay"},
		tooltip_params = {
			title = loc_pref .. "faction_mechanics_overlay_title",
			description = loc_pref .. "faction_mechanics_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "fm_memnon_2", "info_overlay_heroes"},
		tooltip_params = {
			title = loc_pref .. "rem_memnon_exotic_strategist_armies_title",
			description = loc_pref .. "rem_memnon_exotic_strategist_armies_description",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "fm_memnon_2", "panel_frame", "menu_bar_plate_purchase_followers"},
		tooltip_params = {
			title = loc_pref .. "rem_memnon_exotic_strategist_assign_followers_button_title",
			description = loc_pref .. "rem_memnon_exotic_strategist_assign_followers_button_description",
		},
		has_scripted_tour = false,
	},
	{
		is_battle = false,
		target_uic = { "fm_memnon_2", "panel_frame", "info_overlay_followers"},
		tooltip_params = {
			title = loc_pref .. "rem_memnon_exotic_strategist_camp_followers_title",
			description = loc_pref .. "rem_memnon_exotic_strategist_camp_followers_description_1",
			list = {
				[1] = {
					text = loc_pref .. "rem_memnon_exotic_strategist_camp_followers_description_2",
					img = "data/ui/skins/default/rem_icon_fm_exotic_strategist_selected.png"
				},
				[2] = {
					text = loc_pref .. "rem_memnon_exotic_strategist_camp_followers_description_3",
					img = "data/ui/skins/default/rem_icon_fm_exotic_strategist.png"
				},
				[3] = {
					text = loc_pref .. "rem_memnon_exotic_strategist_camp_followers_description_4",
					img = "data/ui/skins/default/troy_army_action_withdraw.png"
				},
			}
		},
		has_scripted_tour = false,
	},
	-- War Spoils
	{
		is_battle = false,
		target_uic = { "capture_bonus_overlay" },
		tooltip_params = {
			title = loc_pref .. "dlc1_capture_bonus_overlay_title",
			description = loc_pref .. "dlc1_capture_bonus_overlay_subtitle",
		},
		has_scripted_tour = false,
	},
	-- Memnon Mythic Monster Expedition
	{
		is_battle = false,
		target_uic = { "container_hunting_party","recruit_army_presets","unit_list_container" },
		tooltip_params = {
			title = loc_pref .. "rem_memnon_mythic_monster_expedition_preset_armies_title",
			description = loc_pref .. "rem_memnon_mythic_monster_expedition_preset_armies_description",
		},
		has_scripted_tour = false,
	},
}

----------------------
--- Scripted Tours ---
----------------------

------------------------------------------------------------------
-- See lib_scripted_tour and lib_information_overlays for usage --
------------------------------------------------------------------


_scripted_tours = {
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	character_content = { -- Army Commanders scripted tour
	exec = function()
		local uic_hero_widget = find_uicomponent(core:get_ui_root(), "CharacterInfoPopup")

		local tour_army_commanders = scripted_tour:new(
			"scripted_tour_army_commanders",
			function() end
		)
		tour_army_commanders:set_steal_esc_key(true)
		tour_army_commanders:set_should_hide_text_pointers_on_completion(true)
		tour_army_commanders:set_should_dismiss_advice_on_completion(true)

		tour_army_commanders:action(
			function()
				if tour_army_commanders:complete_if_uicomponent_obj_is_invalid(uic_hero_widget) then
					return
				end

				core:show_fullscreen_highlight_around_components(25, nil, false, uic_hero_widget)
				
				local army_commanders_text_pointer_1 = text_pointer:new_from_component(
					"army_commanders_text_pointer_1",
					"left",
					100,
					uic_hero_widget,
					1,
					0.5
				)
				tour_army_commanders:register_text_pointer(army_commanders_text_pointer_1)
				army_commanders_text_pointer_1:add_component_text("text", "ui_text_replacements_localised_text_troy_st_army_commanders_1")
				army_commanders_text_pointer_1:set_style("semitransparent")
				army_commanders_text_pointer_1:set_topmost(true)
				army_commanders_text_pointer_1:set_close_button_callback(
					function()
						pulse_uicomponent(uic_hero_widget, false)
						tour_army_commanders:start("show_second_text_pointer")
					end)
				army_commanders_text_pointer_1:set_highlight_close_button(2)
				army_commanders_text_pointer_1:show()
				pulse_uicomponent(uic_hero_widget, 2, 8)

			end,
			0
		)

		tour_army_commanders:add_skip_action(function()
			pulse_uicomponent(uic_hero_widget, false)
		end, "tour_army_commanders_skip_1st_action")

		local uic_ap_parent = find_uicomponent(core:get_ui_root(), "BL_parent", "info_panel_holder", "primary_info_panel_holder", "info_panel_background", "CharacterInfoPopup", "action_points_parent");
		if not uic_ap_parent then
			script_error("ERROR: army commanders tour cannot find uic_ap_parent, expect the script to break!");
			return;
		end;

		local uic_action_points = find_uicomponent(uic_ap_parent, "ap_bar_scripted_tour_dummy");
		if not uic_action_points then
			script_error("WARNING: army commanders tour cannot find ap_bar_scripted_tour_dummy child uicomponent, using ap_bar instead");
			uic_action_points = find_uicomponent(uic_ap_parent, "ap_bar");
		end;
		local uic_hero_rank = core:get_ui_root():SequentialFind("BL_parent", "info_panel_holder", "primary_info_panel_holder", "info_panel_background", "CharacterInfoPopup","rank")
		tour_army_commanders:action(
			function()
				if tour_army_commanders:complete_if_uicomponent_obj_is_invalid(uic_action_points) then
					return
				end

				pulse_uicomponent(uic_action_points, true)
				core:hide_fullscreen_highlight()
				core:show_fullscreen_highlight_around_components(0, false, false, uic_action_points)

				local army_commanders_text_pointer_2 = text_pointer:new_from_component(
					"army_commanders_text_pointer_2",
					"left",
					100,
					uic_action_points,
					1,
					0.5
				)
				tour_army_commanders:register_text_pointer(army_commanders_text_pointer_2)

				army_commanders_text_pointer_2:add_component_text("text", "ui_text_replacements_localised_text_troy_st_army_commanders_2")
				army_commanders_text_pointer_2:set_style("semitransparent")
				army_commanders_text_pointer_2:set_topmost(true)
				army_commanders_text_pointer_2:set_close_button_callback(
					function()
						pulse_uicomponent(uic_action_points, false)

						if uic_hero_rank:Visible() then 
							tour_army_commanders:start("show_third_text_pointer")
						else
							tour_army_commanders:start("show_stances")
						end
					end)
				army_commanders_text_pointer_2:set_highlight_close_button(2)
				army_commanders_text_pointer_2:show()

			end,
			0,
			"show_second_text_pointer"
		)

		tour_army_commanders:add_skip_action(function()
			pulse_uicomponent(uic_action_points, false)
		end, "tour_army_commanders_skip_2nd_action")


		tour_army_commanders:action(

			function()
				if tour_army_commanders:complete_if_uicomponent_obj_is_invalid(uic_hero_rank) then
					return
				end

				core:hide_fullscreen_highlight()
				core:show_fullscreen_highlight_around_components(0, false, false, uic_hero_rank)

				local army_commanders_text_pointer_3 = text_pointer:new_from_component(
					"army_commanders_text_pointer_3",
					"left",
					100,
					uic_hero_rank,
					1,
					0.5
				)
				tour_army_commanders:register_text_pointer(army_commanders_text_pointer_3)
				army_commanders_text_pointer_3:add_component_text("text", "ui_text_replacements_localised_text_troy_st_army_commanders_3")
				army_commanders_text_pointer_3:set_style("semitransparent")
				army_commanders_text_pointer_3:set_topmost(true)
				army_commanders_text_pointer_3:set_close_button_callback(
					function()
							tour_army_commanders:start("show_equipment_check1")
					end)
				army_commanders_text_pointer_3:set_highlight_close_button(2)
				army_commanders_text_pointer_3:show()

			end,
			0,
			"show_third_text_pointer"
		)
		local uic_army_stance = find_uicomponent(core:get_ui_root(), "BL_parent", "info_panel_holder", "primary_info_panel_holder", "info_panel_background", "CharacterInfoPopup", "land_stance_button_stack")
		local stance1 = UIComponent(uic_army_stance:Find(1,true))
		local uic_army_stance_list = find_uicomponent(core:get_ui_root(), "BL_parent", "info_panel_holder", "primary_info_panel_holder", "info_panel_background", "CharacterInfoPopup", "land_stance_button_stack", "clip_parent", "stack_background")
		local uic_navy_stance = find_uicomponent(core:get_ui_root(), "BL_parent", "info_panel_holder", "primary_info_panel_holder", "info_panel_background", "CharacterInfoPopup", "naval_stance_button_stack")
		local stance1_navy = UIComponent(uic_navy_stance:Find(1,true))
		local uic_navy_stance_list = find_uicomponent(core:get_ui_root(), "BL_parent", "info_panel_holder", "primary_info_panel_holder", "info_panel_background", "CharacterInfoPopup", "naval_stance_button_stack", "clip_parent", "stack_background")
		local uics_stances_to_highlight = {}

		tour_army_commanders:action(
					function()
						local uic_equipped_one = find_uicomponent(core:get_ui_root(), "BL_parent", "info_panel_holder", "primary_info_panel_holder", "info_panel_background", "CharacterInfoPopup","equipment", "equipment_list", "item_1")
						if uic_equipped_one and uic_equipped_one:Visible(true)
						then
							tour_army_commanders:start("show_equipment_check2")
						else
							tour_army_commanders:start("show_stances")
						end
					end,
					0,
					"show_equipment_check1"
				)
				tour_army_commanders:action(
					function()
						local uic_equipped_two = find_uicomponent(core:get_ui_root(), "BL_parent", "info_panel_holder", "primary_info_panel_holder", "info_panel_background", "CharacterInfoPopup","equipment", "equipment_list", "item_2")
						if uic_equipped_two ~= nil and  uic_equipped_two:Visible(true)
						then
							tour_army_commanders:start("show_fourth_two_text_pointer")
						else
							tour_army_commanders:start("show_fourth_text_pointer")
						end
					end,
					0,
					"show_equipment_check2"
				)

		
		tour_army_commanders:action(
			function()
				local uic_equipped_ancillaries = find_uicomponent(core:get_ui_root(), "BL_parent", "info_panel_holder", "primary_info_panel_holder", "info_panel_background", "CharacterInfoPopup","equipment", "equipment_list", "item_1")

				if tour_army_commanders:complete_if_uicomponent_obj_is_invalid(uic_equipped_ancillaries) then
					return
				end

				core:hide_fullscreen_highlight()
				core:show_fullscreen_highlight_around_components(5, false, false, uic_equipped_ancillaries)

				local army_commanders_text_pointer_4 = text_pointer:new_from_component(
					"army_commanders_text_pointer_4",
					"left",
					100,
					uic_equipped_ancillaries,
					1,
					0.5
				)
				tour_army_commanders:register_text_pointer(army_commanders_text_pointer_4)
				army_commanders_text_pointer_4:add_component_text("text", "ui_text_replacements_localised_text_troy_st_army_commanders_4")
				army_commanders_text_pointer_4:set_style("semitransparent")
				army_commanders_text_pointer_4:set_topmost(true)
				army_commanders_text_pointer_4:set_close_button_callback(
					function()
						tour_army_commanders:start("show_stances")
					end)
				army_commanders_text_pointer_4:set_highlight_close_button(2)
				army_commanders_text_pointer_4:show()

			end,
			0,
			"show_fourth_text_pointer"
		)
		tour_army_commanders:action(
			function()
				local uic_equipped_ancillaries_one = find_uicomponent(core:get_ui_root(), "BL_parent", "info_panel_holder", "primary_info_panel_holder", "info_panel_background", "CharacterInfoPopup","equipment", "equipment_list", "item_1")
				local uic_equipped_ancillaries_two = find_uicomponent(core:get_ui_root(), "BL_parent", "info_panel_holder", "primary_info_panel_holder", "info_panel_background", "CharacterInfoPopup","equipment", "equipment_list", "item_2")
				
				if tour_army_commanders:complete_if_uicomponent_obj_is_invalid(uic_equipped_ancillaries_one) then
					return
				end

				if tour_army_commanders:complete_if_uicomponent_obj_is_invalid(uic_equipped_ancillaries_two) then
					return
				end

				core:hide_fullscreen_highlight()
				core:show_fullscreen_highlight_around_components(5, false, false, uic_equipped_ancillaries_one, uic_equipped_ancillaries_two)

				local army_commanders_text_pointer_4_2 = text_pointer:new_from_component(
					"army_commanders_text_pointer_4_2",
					"left",
					100,
					uic_equipped_ancillaries_two,
					1,
					0
				)
				tour_army_commanders:register_text_pointer(army_commanders_text_pointer_4_2)
				army_commanders_text_pointer_4_2:add_component_text("text", "ui_text_replacements_localised_text_troy_st_army_commanders_4")
				army_commanders_text_pointer_4_2:set_style("semitransparent")
				army_commanders_text_pointer_4_2:set_topmost(true)
				army_commanders_text_pointer_4_2:set_close_button_callback(
					function()
						tour_army_commanders:start("show_stances")
					end)
				army_commanders_text_pointer_4_2:set_highlight_close_button(2)
				army_commanders_text_pointer_4_2:show()

			end,
			0,
			"show_fourth_two_text_pointer"
		)
		local tp_5_possition = nil
		local tp_5_width = nil
		local tp_5_height = nil
		local stance_one = nil
		local uic_stance_list = nil
		tour_army_commanders:action(
			function()
				if uic_army_stance and uic_army_stance:Visible() then 
					stance_one = stance1
					uic_stance_list = uic_army_stance_list
					for i=0, uic_army_stance_list:ChildCount() - 1 do
						local to_add = UIComponent(uic_army_stance_list:Find(i))
						if to_add:Visible() then
							table.insert(uics_stances_to_highlight, to_add)
						end
					end
					if stance1:CurrentState() == "active" then
						tp_5_possition = "left"
						tp_5_width = 1
						tp_5_height = 0.5
						stance1:SimulateLClick()
						core:progress_on_uicomponent_animation_finished(uic_army_stance_list, function() cm:callback(function() tour_army_commanders:start("show_fifth_text_pointer") end, 0.4) end)
					else
						tp_5_possition = "bottom"
						tp_5_width = 0.5
						tp_5_height = 0
						uic_army_stance_list = find_uicomponent(core:get_ui_root(), "CharacterInfoPopup", "land_stance_button_stack", "stack_arrow")
						tour_army_commanders:start("show_fifth_text_pointer")
					end
				elseif uic_navy_stance and uic_navy_stance:Visible() then 
					stance_one = stance1_navy
					uic_stance_list = uic_navy_stance_list
					for i=0, uic_navy_stance_list:ChildCount() - 1 do
						local to_add = UIComponent(uic_navy_stance_list:Find(i))
						if to_add:Visible() then
							table.insert(uics_stances_to_highlight, to_add)
						end
					end
					if stance1_navy:CurrentState() == "active" then
						tp_5_possition = "left"
						tp_5_width = 1
						tp_5_height = 0.5
						stance1_navy:SimulateLClick()
						core:progress_on_uicomponent_animation_finished(uic_navy_stance_list, function() cm:callback(function() tour_army_commanders:start("show_fifth_text_pointer") end, 0.4) end)
					else
						tp_5_possition = "bottom"
						tp_5_width = 0.5
						tp_5_height = 0
						uic_navy_stance_list = find_uicomponent(core:get_ui_root(), "CharacterInfoPopup", "naval_stance_button_stack", "stack_arrow")
						tour_army_commanders:start("show_fifth_text_pointer")
					end
				end
			end,
			0,
			"show_stances"
		)

		tour_army_commanders:action(
			function()
				if tour_army_commanders:complete_if_uicomponent_obj_is_invalid(uic_stance_list) then
					return
				end

				core:hide_fullscreen_highlight()
				core:show_fullscreen_highlight_around_components(20, false, false, unpack(uics_stances_to_highlight))

				local army_commanders_text_pointer_5 = text_pointer:new_from_component(
					"army_commanders_text_pointer_5",
					tp_5_possition,
					100,
					uic_stance_list,
					tp_5_width,
					tp_5_height
				)
				tour_army_commanders:register_text_pointer(army_commanders_text_pointer_5)
				army_commanders_text_pointer_5:add_component_text("text", "ui_text_replacements_localised_text_troy_st_army_commanders_5")
				army_commanders_text_pointer_5:set_style("semitransparent")
				army_commanders_text_pointer_5:set_topmost(true)
				army_commanders_text_pointer_5:set_close_button_callback(
					function()
						local uic_loyalty_check = find_uicomponent(core:get_ui_root(), "BL_parent", "info_panel_holder", "primary_info_panel_holder", "info_panel_background", "CharacterInfoPopup", "large_button_parent", "icon_loyalty")
						local uic_char_details_check = core:get_ui_root():SequentialFind("BL_parent", "info_panel_holder", "primary_info_panel_holder", "info_panel_background", "CharacterInfoPopup", "info_button_list", "button_general")
						if uic_char_details_check:CurrentState() == "active" then 
							if uic_loyalty_check and uic_loyalty_check:Visible(true)  then
								stance_one:SimulateLClick()
								tour_army_commanders:start("show_sixth_text_pointer")
							else
								stance_one:SimulateLClick()
								tour_army_commanders:start("show_seventh_text_pointer")
							end
						else
							stance_one:SimulateLClick()
							tour_army_commanders:complete()
						end
					end)
				army_commanders_text_pointer_5:set_highlight_close_button(2)
				army_commanders_text_pointer_5:show()
			end,
			0,
			"show_fifth_text_pointer"
		)
		tour_army_commanders:action(
			function()
				local uic_loyalty = find_uicomponent(core:get_ui_root(), "BL_parent", "info_panel_holder", "primary_info_panel_holder", "info_panel_background", "CharacterInfoPopup", "large_button_parent","icon_loyalty")
				
				if tour_army_commanders:complete_if_uicomponent_obj_is_invalid(uic_loyalty) then
					return
				end

				core:hide_fullscreen_highlight()
				core:show_fullscreen_highlight_around_components(10, false, false, uic_loyalty)

				local army_commanders_text_pointer_6 = text_pointer:new_from_component(
					"army_commanders_text_pointer_6",
					"left",
					50,
					uic_loyalty,
					1,
					-0.6
					--[[ "bottom",
					50,
					uic_loyalty,
					3,
					0 --]]
				)
				tour_army_commanders:register_text_pointer(army_commanders_text_pointer_6)
				army_commanders_text_pointer_6:add_component_text("text", "ui_text_replacements_localised_text_troy_st_army_commanders_6")
				army_commanders_text_pointer_6:set_style("semitransparent")
				army_commanders_text_pointer_6:set_topmost(true)
				army_commanders_text_pointer_6:set_close_button_callback(
					function()
						tour_army_commanders:start("show_seventh_text_pointer")
					end)
				army_commanders_text_pointer_6:set_highlight_close_button(2)
				army_commanders_text_pointer_6:show()
			end,
			0,
			"show_sixth_text_pointer"
		)
		tour_army_commanders:action(
			function()
				local uic_char_details = find_uicomponent(core:get_ui_root(), "BL_parent", "info_panel_holder", "primary_info_panel_holder", "info_panel_background", "CharacterInfoPopup", "info_button_list", "button_general")
				
				if tour_army_commanders:complete_if_uicomponent_obj_is_invalid(uic_char_details) then
					return
				end

				core:hide_fullscreen_highlight()
				core:show_fullscreen_highlight_around_components(0, false, false, uic_char_details)

				local army_commanders_text_pointer_7 = text_pointer:new_from_component(
					"army_commanders_text_pointer_7",
					"bottom",
					100,
					uic_char_details,
					0.5,
					0
				)
				tour_army_commanders:register_text_pointer(army_commanders_text_pointer_7)
				army_commanders_text_pointer_7:add_component_text("text", "ui_text_replacements_localised_text_troy_st_army_commanders_7")
				army_commanders_text_pointer_7:set_style("semitransparent")
				army_commanders_text_pointer_7:set_topmost(true)
				army_commanders_text_pointer_7:set_close_button_callback(
					function()
						core:hide_fullscreen_highlight()
						tour_army_commanders:complete()
						core:remove_listener("tour_army_commanders_unit_exchange_listener")
					end)
				army_commanders_text_pointer_7:set_highlight_close_button(2)
				army_commanders_text_pointer_7:show()

			end,
			0,
			"show_seventh_text_pointer"
		)

		tour_army_commanders:start()

		core:add_listener(
				"tour_army_commanders_unit_exchange_listener",
				"PanelOpenedCampaign", 
				function(context) return context.string == "unit_exchange" end,
				function(context) 
					if tour_army_commanders then
						tour_army_commanders:complete()
						core:remove_listener("tour_army_commanders_unit_exchange_listener")
					end
				end, 
				true
			)

		end,
	check = function()
		local uic_own_general_check = find_uicomponent(core:get_ui_root(),"CharacterInfoPopup", "land_stance_button_stack")
		local uic_own_admiral_check = find_uicomponent(core:get_ui_root(),"CharacterInfoPopup", "naval_stance_button_stack")
		local uic_embeded_agent_check = find_uicomponent(core:get_ui_root(),"units_panel", "main_units_panel", "units", "Agent 0")
		local uic_unit_upgrade = core:get_ui_root():SequentialFind("unit_upgrades")
		local uic_renaming = core:get_ui_root():SequentialFind("popup_text_input", "text_input_list_parent", "text_input")

		if uic_unit_upgrade or uic_renaming then 
			return false
		end

		if uic_own_general_check or uic_own_admiral_check then
			if uic_embeded_agent_check then 
				return  (uic_own_general_check:Visible() or uic_own_admiral_check:Visible()) and uic_embeded_agent_check:CurrentState() ~= "Selected"
			else
				return uic_own_general_check:Visible() or uic_own_admiral_check:Visible()
			end
		end
		
	end,
	tooltip_ref = function() 
		local uic_unit_upgrade = core:get_ui_root():SequentialFind("unit_upgrades")
		local uic_renaming = core:get_ui_root():SequentialFind("popup_text_input", "text_input_list_parent", "text_input")

		if uic_unit_upgrade then 
			return "random_localisation_strings_string_troy_hep_scripted_tour_tooltip_tour_unavailable_unit_upgrades"
		elseif uic_renaming then 
			return "random_localisation_strings_string_troy_hep_scripted_tour_tooltip_renaming_active_unavailable"
		else
			return "random_localisation_strings_string_scripted_tour_tooltip_commanders_tour_unavailable" 
		end
		
	end,
	},

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	settlement_panel_overlay = { -- Settlement panel scripted tour
		exec = function()
			local uic_settlement_panel = find_uicomponent(core:get_ui_root(), "settlement_panel")
			local uic_settelment_button = find_uicomponent(core:get_ui_root(), "button_group_settlement", "button_show_province")
			uic_settelment_button:SimulateLClick()
			local uic_safe_heaven = find_uicomponent(core:get_ui_root(), "settlement_panel", "pirates_cove", "settlement")
			local uic_capital_safe_heaven_check =  find_uicomponent(core:get_ui_root(), "settlement_panel", "main_settlement_panel", "capital", "pirates_cove")
			local tour_settlement_panel = scripted_tour:new(
				"scripted_tour_settlement_panel",
				function() end
			)
			tour_settlement_panel:set_steal_esc_key(true)
			tour_settlement_panel:set_should_hide_text_pointers_on_completion(true)
			tour_settlement_panel:set_should_dismiss_advice_on_completion(true)

			tour_settlement_panel:action(
				function()
					if tour_settlement_panel:complete_if_uicomponent_obj_is_invalid(uic_settlement_panel) then
						return
					end

					core:show_fullscreen_highlight_around_components(25, nil, false, uic_settlement_panel)

					local settlement_panel_text_pointer_1 = text_pointer:new_from_component(
						"settlement_panel_text_pointer_1",
						"bottom",
						100,
						uic_settlement_panel,
						0.5,
						0
					)
					tour_settlement_panel:register_text_pointer(settlement_panel_text_pointer_1)

					settlement_panel_text_pointer_1:add_component_text("text", "ui_text_replacements_localised_text_troy_st_province_1")
					settlement_panel_text_pointer_1:set_style("semitransparent")
					settlement_panel_text_pointer_1:set_topmost(true)
					settlement_panel_text_pointer_1:set_close_button_callback(
						function()
						local uic_ownership_check2 = find_uicomponent(core:get_ui_root(), "settlement_panel" , "main_settlement_panel" , "capital" , "other_faction_overlay" , "dy_flag")
						pulse_uicomponent(uic_settlement_panel, false)
						if uic_ownership_check2:Visible(true) then
							if uic_safe_heaven and uic_safe_heaven:Visible() then
								tour_settlement_panel:start("show_fourth_text_pointer", settlement_panel_text_pointer_1)
							else
								tour_settlement_panel:start("show_fifth_text_pointer", settlement_panel_text_pointer_1)
							end
						else if uic_capital_safe_heaven_check and uic_capital_safe_heaven_check:Visible() then 
									tour_settlement_panel:start("show_fourth_text_pointer", settlement_panel_text_pointer_1)
								else
									tour_settlement_panel:start("show_second_text_pointer", settlement_panel_text_pointer_1)
								end
							end
						end)
					settlement_panel_text_pointer_1:set_highlight_close_button(2)
					settlement_panel_text_pointer_1:show()
					pulse_uicomponent(uic_settlement_panel, 2, 8)
				end,
				0
			)
			tour_settlement_panel:add_skip_action(function()
				pulse_uicomponent(uic_settlement_panel, false)
			end, "tour_settlement_panel_skip_1st_action")

			local uic_building_slot = nil
			local uic_main_building = find_uicomponent(core:get_ui_root(),  "settlement_panel" , "building_slot_1")

			tour_settlement_panel:action(
				function()
					if tour_settlement_panel:complete_if_uicomponent_obj_is_invalid(uic_main_building) then
						return
					end

					core:hide_fullscreen_highlight()
					core:show_fullscreen_highlight_around_components(0, false, false, uic_main_building)

					local settlement_panel_text_pointer_2 = text_pointer:new_from_component(
						"settlement_panel_text_pointer_2",
						"right",
						100,
						uic_main_building,
						0,
						0.5
					)
					tour_settlement_panel:register_text_pointer(settlement_panel_text_pointer_2)
					settlement_panel_text_pointer_2:add_component_text("text", "ui_text_replacements_localised_text_troy_st_province_2")
					settlement_panel_text_pointer_2:set_style("semitransparent")
					settlement_panel_text_pointer_2:set_topmost(true)
					settlement_panel_text_pointer_2:set_close_button_callback(function()
						local uic_check_1 = find_uicomponent(core:get_ui_root(),"settlement_panel" , "Slot1_Construction_Site", "button_expand_slot" )
						if not uic_check_1 or uic_check_1:CurrentState() ~= "locked" then
							tour_settlement_panel:start("show_check1", settlement_panel_text_pointer_2)
						else
							uic_building_slot = uic_check_1
							tour_settlement_panel:start("show_third_text_pointer", settlement_panel_text_pointer_2)
						end
					end)
					settlement_panel_text_pointer_2:set_highlight_close_button(2)
					settlement_panel_text_pointer_2:show()

				end,
				0,
				"show_second_text_pointer"
			)

			local uic_main_building_minor = find_uicomponent(core:get_ui_root(), "settlement_panel", "settlement_1", "building_slot_1")
			tour_settlement_panel:action(
				function()
					if tour_settlement_panel:complete_if_uicomponent_obj_is_invalid(uic_main_building_minor) then
						return
					end

					core:hide_fullscreen_highlight()
					core:show_fullscreen_highlight_around_components(0, false, false, uic_main_building_minor)

					local settlement_panel_text_pointer_5 = text_pointer:new_from_component(
						"settlement_panel_text_pointer_5",
						"right",
						100,
						uic_main_building_minor,
						0,
						0.5
					)

					tour_settlement_panel:register_text_pointer(settlement_panel_text_pointer_5)
					settlement_panel_text_pointer_5:add_component_text("text", "ui_text_replacements_localised_text_troy_st_province_2")
					settlement_panel_text_pointer_5:set_style("semitransparent")
					settlement_panel_text_pointer_5:set_topmost(true)
					settlement_panel_text_pointer_5:set_close_button_callback(function()
					local uic_check_1 = find_uicomponent(core:get_ui_root(),"settlement_panel" , "Slot1_Construction_Site", "button_expand_slot" )
					if not uic_check_1 or uic_check_1:CurrentState() ~= "locked"
					then
						tour_settlement_panel:start("show_check1")
					else
						uic_building_slot = uic_check_1
						tour_settlement_panel:start("show_third_text_pointer")
						end
					end)
					settlement_panel_text_pointer_5:set_highlight_close_button(2)
					settlement_panel_text_pointer_5:show()

				end,
				0,
				"show_fifth_text_pointer"
			)
			tour_settlement_panel:action(
				function()
					local uic_check_initial = find_uicomponent(core:get_ui_root(),"settlement_panel" ,  "Slot2_Construction_Site", "button_expand_slot" )
					if not uic_check_initial or uic_check_initial:CurrentState() ~= "locked"
					then
						tour_settlement_panel:start("show_check2")
					else
						uic_building_slot = uic_check_initial
						tour_settlement_panel:start("show_third_text_pointer")
					end
				end,
				0,
				"show_check1"
			)

			tour_settlement_panel:action(
				function()
					local uic_check_2 = find_uicomponent(core:get_ui_root(),"settlement_panel" ,  "Slot3_Construction_Site", "button_expand_slot" )
					if not uic_check_2 or uic_check_2:CurrentState() ~= "locked"
					then
						tour_settlement_panel:start("show_check3")
					else
						uic_building_slot = uic_check_2
						tour_settlement_panel:start("show_third_text_pointer")
					end
				end,
				0,
				"show_check2"
			)

			tour_settlement_panel:action(
				function()
					local uic_check_3 = find_uicomponent(core:get_ui_root(),"settlement_panel" , "Slot4_Construction_Site", "button_expand_slot" )
					if not uic_check_3 or uic_check_3:CurrentState() ~= "locked" then
						tour_settlement_panel:start("show_check4")
					else
						uic_building_slot = uic_check_3
						tour_settlement_panel:start("show_third_text_pointer")
					end
				end,
				0,
				"show_check3"
			)

			tour_settlement_panel:action(
				function()
					local uic_check_4 = find_uicomponent(core:get_ui_root(),"settlement_panel" , "Slot5_Construction_Site" , "button_expand_slot" )
					if not uic_check_4 or uic_check_4:CurrentState() ~= "locked" then
						tour_settlement_panel:start("show_check5")
					else
						uic_building_slot = uic_check_4
						tour_settlement_panel:start("show_third_text_pointer")
					end
				end,
				0,
				"show_check4"
			)
			tour_settlement_panel:action(
				function()
					local uic_check_5 = find_uicomponent(core:get_ui_root(),"settlement_panel" , "Slot6_Construction_Site" , "button_expand_slot" )
					if not uic_check_5 or uic_check_5:CurrentState() ~= "locked" then
						tour_settlement_panel:start("show_check6")
					else
						uic_building_slot = uic_check_5
						tour_settlement_panel:start("show_third_text_pointer")
					end
				end,
				0,
				"show_check5"
			)
			tour_settlement_panel:action(
				function()
					local uic_check_6 = find_uicomponent(core:get_ui_root(),"settlement_panel" , "Slot7_Construction_Site", "button_expand_slot" )
					if not uic_check_6 or uic_check_6:CurrentState() ~= "locked" then
						tour_settlement_panel:start("show_check7")
					else
						uic_building_slot = uic_check_6
						tour_settlement_panel:start("show_third_text_pointer")
					end
				end,
				0,
				"show_check6"
			)
			tour_settlement_panel:action(
				function()
					local uic_check_7 = find_uicomponent(core:get_ui_root(),"settlement_panel" , "Slot8_Construction_Site", "button_expand_slot" )
					if not uic_check_7 or uic_check_7:CurrentState() ~= "locked" then
						tour_settlement_panel:start("show_fourth_text_pointer")
					else
						uic_building_slot = uic_check_7
						tour_settlement_panel:start("show_third_text_pointer")
					end
				end,
				0,
				"show_check7"
			)

			tour_settlement_panel:action(
				function()
					if tour_settlement_panel:complete_if_uicomponent_obj_is_invalid(uic_building_slot) then
						return
					end

					core:hide_fullscreen_highlight()
					core:show_fullscreen_highlight_around_components(0, false, false, uic_building_slot)

					local settlement_panel_text_pointer_3 = text_pointer:new_from_component(
						"settlement_panel_text_pointer_3",
						"bottom",
						100,
						uic_building_slot,
						0.5,
						0
					)
					tour_settlement_panel:register_text_pointer(settlement_panel_text_pointer_3)
					settlement_panel_text_pointer_3:add_component_text("text", "ui_text_replacements_localised_text_troy_st_province_3")
					settlement_panel_text_pointer_3:set_style("semitransparent")
					settlement_panel_text_pointer_3:set_topmost(true)
					settlement_panel_text_pointer_3:set_close_button_callback(function() tour_settlement_panel:start("show_fourth_text_pointer") end)
					settlement_panel_text_pointer_3:set_highlight_close_button(2)
					settlement_panel_text_pointer_3:show()
				end,
				0,
				"show_third_text_pointer"
			)
			local uic_settlement_info_panel = find_uicomponent(core:get_ui_root(), "BL_parent", "ProvinceInfoPopup")
			tour_settlement_panel:action(
				function()
					if tour_settlement_panel:complete_if_uicomponent_obj_is_invalid(uic_settlement_info_panel) then
						return
					end

					core:hide_fullscreen_highlight()
					core:show_fullscreen_highlight_around_components(0, false, false, uic_settlement_info_panel)

					local settlement_panel_text_pointer_4 = text_pointer:new_from_component(
						"settlement_panel_text_pointer_4",
						"bottom",
						100,
						uic_settlement_info_panel,
						0.6,
						0
					)
					tour_settlement_panel:register_text_pointer(settlement_panel_text_pointer_4)
					settlement_panel_text_pointer_4:add_component_text("text", "ui_text_replacements_localised_text_troy_st_province_4")
					settlement_panel_text_pointer_4:set_style("semitransparent")
					settlement_panel_text_pointer_4:set_topmost(true)
					settlement_panel_text_pointer_4:set_close_button_callback(function() tour_settlement_panel:start("show_sixth_text_pointer") end)
					settlement_panel_text_pointer_4:set_highlight_close_button(2)
					settlement_panel_text_pointer_4:show()

				end,
				0,
				"show_fourth_text_pointer"
			)
			tour_settlement_panel:action(
				function()
					local uic_tax = find_uicomponent(core:get_ui_root(),"ProvinceInfoPopup" , "panel" , "frame_PO_income" , "header_production")

					if tour_settlement_panel:complete_if_uicomponent_obj_is_invalid(uic_tax) then
						return
					end

					core:hide_fullscreen_highlight()
					core:show_fullscreen_highlight_around_components(0, false, false, uic_tax)

					local settlement_panel_text_pointer_6 = text_pointer:new_from_component(
						"settlement_panel_text_pointer_6",
						"left",
						100,
						uic_tax,
						1,
						0.5
					)
					tour_settlement_panel:register_text_pointer(settlement_panel_text_pointer_6)
					settlement_panel_text_pointer_6:add_component_text("text", "ui_text_replacements_localised_text_troy_st_province_5")
					settlement_panel_text_pointer_6:set_style("semitransparent")
					settlement_panel_text_pointer_6:set_topmost(true)
					settlement_panel_text_pointer_6:set_close_button_callback(function() tour_settlement_panel:start("show_seventh_text_pointer") end)
					settlement_panel_text_pointer_6:set_highlight_close_button(2)
					settlement_panel_text_pointer_6:show()

				end,
				0,
				"show_sixth_text_pointer"
			)
			tour_settlement_panel:action(
				function()
					local uic_garrison = find_uicomponent(core:get_ui_root(), "button_group_settlement" , "button_show_garrison")

					if tour_settlement_panel:complete_if_uicomponent_obj_is_invalid(uic_garrison) then
						return
					end

					core:hide_fullscreen_highlight()
					core:show_fullscreen_highlight_around_components(0, false, false, uic_garrison)

					local settlement_panel_text_pointer_7 = text_pointer:new_from_component(
						"settlement_panel_text_pointer_7",
						"bottom",
						100,
						uic_garrison,
						0.5,
						0
					)
					tour_settlement_panel:register_text_pointer(settlement_panel_text_pointer_7)
					settlement_panel_text_pointer_7:add_component_text("text", "ui_text_replacements_localised_text_troy_st_province_6")
					settlement_panel_text_pointer_7:set_style("semitransparent")
					settlement_panel_text_pointer_7:set_topmost(true)
					settlement_panel_text_pointer_7:set_close_button_callback(function() tour_settlement_panel:start("show_eigth_text_pointer") end)
					settlement_panel_text_pointer_7:set_highlight_close_button(2)
					settlement_panel_text_pointer_7:show()

				end,
				0,
				"show_seventh_text_pointer"
			)
			tour_settlement_panel:action(
				function()
					local uic_building_browser = find_uicomponent(core:get_ui_root(), "button_group_settlement" , "button_building_browser")
					
					if tour_settlement_panel:complete_if_uicomponent_obj_is_invalid(uic_building_browser) then
						return
					end

					core:hide_fullscreen_highlight()
					core:show_fullscreen_highlight_around_components(0, false, false, uic_building_browser)

					local settlement_panel_text_pointer_8 = text_pointer:new_from_component(
						"settlement_panel_text_pointer_8",
						"bottom",
						100,
						uic_building_browser,
						0.5,
						0
					)
					tour_settlement_panel:register_text_pointer(settlement_panel_text_pointer_8)
					settlement_panel_text_pointer_8:add_component_text("text", "ui_text_replacements_localised_text_troy_st_province_7")
					settlement_panel_text_pointer_8:set_style("semitransparent")
					settlement_panel_text_pointer_8:set_topmost(true)
					settlement_panel_text_pointer_8:set_close_button_callback(function() tour_settlement_panel:start("show_ninth_text_pointer") end)
					settlement_panel_text_pointer_8:set_highlight_close_button(2)
					settlement_panel_text_pointer_8:show()

				end,
				0,
				"show_eigth_text_pointer"
			)
			local uic_agent_recruitment = find_uicomponent(core:get_ui_root(), "button_group_settlement" , "button_agents")
			tour_settlement_panel:action(
				function()
					local uic_recruit_hero = find_uicomponent(core:get_ui_root(), "button_group_settlement" , "button_create_army")

					if tour_settlement_panel:complete_if_uicomponent_obj_is_invalid(uic_recruit_hero) then
						return
					end

					core:hide_fullscreen_highlight()
					core:show_fullscreen_highlight_around_components(0, false, false, uic_recruit_hero)

					local settlement_panel_text_pointer_9 = text_pointer:new_from_component(
						"settlement_panel_text_pointer_9",
						"bottom",
						100,
						uic_recruit_hero,
						0.5,
						0
					)
					tour_settlement_panel:register_text_pointer(settlement_panel_text_pointer_9)
					settlement_panel_text_pointer_9:add_component_text("text", "ui_text_replacements_localised_text_troy_st_province_8")
					settlement_panel_text_pointer_9:set_style("semitransparent")
					settlement_panel_text_pointer_9:set_topmost(true)
					settlement_panel_text_pointer_9:set_close_button_callback(
						function()
							if uic_agent_recruitment and uic_agent_recruitment:Visible(true) then
								tour_settlement_panel:start("show_tenth_text_pointer")
							else
								core:hide_fullscreen_highlight() 
								tour_settlement_panel:complete()
							end
						end)
					settlement_panel_text_pointer_9:set_highlight_close_button(2)
					settlement_panel_text_pointer_9:show()

				end,
				0,
				"show_ninth_text_pointer"
			)

			tour_settlement_panel:action(
				function()
					if tour_settlement_panel:complete_if_uicomponent_obj_is_invalid(uic_agent_recruitment) then
						return
					end

					core:hide_fullscreen_highlight()
					core:show_fullscreen_highlight_around_components(0, false, false, uic_agent_recruitment)

					local settlement_panel_text_pointer_10 = text_pointer:new_from_component(
						"settlement_panel_text_pointer_10",
						"bottom",
						100,
						uic_agent_recruitment,
						0.5,
						0
					)
					tour_settlement_panel:register_text_pointer(settlement_panel_text_pointer_10)

					if cm:get_local_faction_name(true) == "troy_rem_trj_thrace" or cm:get_local_faction_name(true) == "troy_rem_horde_aethiopians" then
						settlement_panel_text_pointer_10:add_component_text("text", "ui_text_replacements_localised_text_troy_rem_st_epic_agents")
					else
						settlement_panel_text_pointer_10:add_component_text("text", "ui_text_replacements_localised_text_troy_st_province_9")
					end

					settlement_panel_text_pointer_10:set_style("semitransparent")
					settlement_panel_text_pointer_10:set_topmost(true)
					settlement_panel_text_pointer_10:set_label_offset(100, 0)
					settlement_panel_text_pointer_10:set_close_button_callback(function() core:hide_fullscreen_highlight() tour_settlement_panel:complete() end)
					settlement_panel_text_pointer_10:set_highlight_close_button(2)
					settlement_panel_text_pointer_10:show()

				end,
				0,
				"show_tenth_text_pointer"
			)

			tour_settlement_panel:start()
		end,
		check = function()
			local uic_ownership_check = find_uicomponent(core:get_ui_root(), "BL_parent" , "info_panel_holder" , "primary_info_panel_holder" , "info_panel_background" , "ProvinceInfoPopup")
			return uic_ownership_check:Visible()
			end,
		tooltip_ref = function() return "random_localisation_strings_string_scripted_tour_tooltip_province_tour_unavailable" end,
	},
	-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	horde_building_frame = { -- Horde settlement panel scripted tour
		exec = function()
			local uic_horde_button = find_uicomponent(core:get_ui_root(), "units_panel", "main_units_panel", "tabgroup", "tab_horde_buildings")
			uic_horde_button:SimulateLClick()

			local tour_horde_panel = scripted_tour:new(
				"scripted_tour_horde_panel",
				function() end
			)
			tour_horde_panel:set_steal_esc_key(true)
			tour_horde_panel:set_should_hide_text_pointers_on_completion(true)
			tour_horde_panel:set_should_dismiss_advice_on_completion(true)

			tour_horde_panel:action(
				function()
					if tour_horde_panel:complete_if_uicomponent_obj_is_invalid(uic_horde_button) then
						return
					end

					core:show_fullscreen_highlight_around_components(15, nil, false, uic_horde_button)

					local horde_panel_text_pointer_1 = text_pointer:new_from_component(
						"horde_panel_text_pointer_1",
						"bottom",
						100,
						uic_horde_button,
						0.5,
						0
					)
					tour_horde_panel:register_text_pointer(horde_panel_text_pointer_1)
					horde_panel_text_pointer_1:add_component_text("text", "ui_text_replacements_localised_text_troy_dlc1_st_construction_1")
					horde_panel_text_pointer_1:set_style("semitransparent")
					horde_panel_text_pointer_1:set_topmost(true)
					horde_panel_text_pointer_1:set_close_button_callback(
						function()
							tour_horde_panel:start("show_second_text_pointer")
							pulse_uicomponent(uic_horde_button, false)

						end)
					horde_panel_text_pointer_1:set_highlight_close_button(2)
					horde_panel_text_pointer_1:show()
					pulse_uicomponent(uic_horde_button, 2, 8)

				end,
				0
			)

			tour_horde_panel:add_skip_action(function()
				pulse_uicomponent(uic_horde_button, false)
			end, "tour_horde_panel_skip_1st_action")

			local uic_horde_panel = find_uicomponent(core:get_ui_root(), "units_panel", "main_units_panel", "horde_building_frame", "settlement_parent")
			tour_horde_panel:action(
				function()
					if tour_horde_panel:complete_if_uicomponent_obj_is_invalid(uic_horde_panel) then
						return
					end

					core:hide_fullscreen_highlight()
					core:show_fullscreen_highlight_around_components(15, false, false, uic_horde_panel)

					local horde_panel_text_pointer_2 = text_pointer:new_from_component(
						"horde_panel_text_pointer_2",
						"bottom",
						100,
						uic_horde_panel,
						0.5,
						0
					)
					tour_horde_panel:register_text_pointer(horde_panel_text_pointer_2)
					horde_panel_text_pointer_2:add_component_text("text", "ui_text_replacements_localised_text_phar_sea_st_horde_buildings_1")
					horde_panel_text_pointer_2:set_style("semitransparent")
					horde_panel_text_pointer_2:set_topmost(true)
					horde_panel_text_pointer_2:set_label_offset(100, 0)
					horde_panel_text_pointer_2:set_close_button_callback(
						function()
							core:hide_fullscreen_highlight()
							tour_horde_panel:start("show_third_text_pointer")
						end)
					horde_panel_text_pointer_2:set_highlight_close_button(2)
					horde_panel_text_pointer_2:show()

				end,
				0,
				"show_second_text_pointer"
			)

			local uic_horde_main_building = find_uicomponent(core:get_ui_root(), "units_panel", "main_units_panel", "horde_building_frame", "settlement_parent", "building_slot_1")
			tour_horde_panel:action(
				function()
					if tour_horde_panel:complete_if_uicomponent_obj_is_invalid(uic_horde_main_building) then
						return
					end

					core:hide_fullscreen_highlight()
					core:show_fullscreen_highlight_around_components(15, false, false, uic_horde_main_building)

					local horde_panel_text_pointer_3 = text_pointer:new_from_component(
						"horde_panel_text_pointer_3",
						"bottom",
						100,
						uic_horde_main_building,
						0.5,
						0
					)
					tour_horde_panel:register_text_pointer(horde_panel_text_pointer_3)
					horde_panel_text_pointer_3:add_component_text("text", "ui_text_replacements_localised_text_phar_sea_st_horde_buildings_2")
					horde_panel_text_pointer_3:set_style("semitransparent")
					horde_panel_text_pointer_3:set_topmost(true)
					horde_panel_text_pointer_3:set_label_offset(100, 0)
					horde_panel_text_pointer_3:set_close_button_callback(
						function()
							core:hide_fullscreen_highlight()
							tour_horde_panel:start("show_fourth_text_pointer")
						end)
					horde_panel_text_pointer_3:set_highlight_close_button(2)
					horde_panel_text_pointer_3:show()

				end,
				0,
				"show_third_text_pointer"
			)

			local uic_horde_growth = find_uicomponent(core:get_ui_root(), "units_panel", "main_units_panel", "horde_building_frame", "workforce")
			tour_horde_panel:action(
				function()
					if tour_horde_panel:complete_if_uicomponent_obj_is_invalid(uic_horde_growth) then
						return
					end

					core:hide_fullscreen_highlight()
					core:show_fullscreen_highlight_around_components(20, false, false, uic_horde_growth)

					local horde_panel_text_pointer_4 = text_pointer:new_from_component(
						"horde_panel_text_pointer_4",
						"bottom",
						100,
						uic_horde_growth,
						0.5,
						0
					)
					tour_horde_panel:register_text_pointer(horde_panel_text_pointer_4)
					horde_panel_text_pointer_4:add_component_text("text", "ui_text_replacements_localised_text_phar_sea_st_horde_buildings_3")
					horde_panel_text_pointer_4:set_style("semitransparent")
					horde_panel_text_pointer_4:set_topmost(true)
					horde_panel_text_pointer_4:set_label_offset(100, 0)
					horde_panel_text_pointer_4:set_close_button_callback(
						function()
							tour_horde_panel:start("show_fifth_text_pointer")
						end)
					horde_panel_text_pointer_4:set_highlight_close_button(2)
					horde_panel_text_pointer_4:show()

				end,
				0,
				"show_fourth_text_pointer"
			)
			local uic_horde_building_browser = find_uicomponent(core:get_ui_root(), "units_panel", "main_units_panel", "button_group_army_settled", "button_building_browser")
			tour_horde_panel:action(
				function()
					if tour_horde_panel:complete_if_uicomponent_obj_is_invalid(uic_horde_building_browser) then
						return
					end

					core:hide_fullscreen_highlight()
					core:show_fullscreen_highlight_around_components(10, false, false, uic_horde_building_browser)

					local horde_panel_text_pointer_5 = text_pointer:new_from_component(
						"horde_panel_text_pointer_5",
						"bottom",
						100,
						uic_horde_building_browser,
						0.5,
						0
					)
					tour_horde_panel:register_text_pointer(horde_panel_text_pointer_5)
					horde_panel_text_pointer_5:add_component_text("text", "ui_text_replacements_localised_text_troy_dlc1_st_construction_5")
					horde_panel_text_pointer_5:set_style("semitransparent")
					horde_panel_text_pointer_5:set_topmost(true)
					horde_panel_text_pointer_5:set_label_offset(100, 0)
					horde_panel_text_pointer_5:set_close_button_callback(
						function()
							tour_horde_panel:start("show_sixth_text_pointer")
						end)
					horde_panel_text_pointer_5:set_highlight_close_button(2)
					horde_panel_text_pointer_5:show()

				end,
				0,
				"show_fifth_text_pointer"
			)
			local uic_horde_hero_recruit = find_uicomponent(core:get_ui_root(), "units_panel", "main_units_panel", "button_group_army_settled", "button_create_army")
			--local uic_horde_agent_recruit = find_uicomponent(core:get_ui_root(), "hud_campaign", "hud_center_docker", "hud_center", "small_bar", "button_group_army_settled", "button_agents")
			tour_horde_panel:action(
				function()
					if tour_horde_panel:complete_if_uicomponent_obj_is_invalid(uic_horde_hero_recruit) then
						return
					end

					core:hide_fullscreen_highlight()
					core:show_fullscreen_highlight_around_components(10, false, false, uic_horde_hero_recruit)

					local horde_panel_text_pointer_6 = text_pointer:new_from_component(
						"horde_panel_text_pointer_6",
						"bottom",
						100,
						uic_horde_hero_recruit,
						0.5,
						0
					)
					tour_horde_panel:register_text_pointer(horde_panel_text_pointer_6)
					horde_panel_text_pointer_6:add_component_text("text", "ui_text_replacements_localised_text_troy_dlc1_st_construction_6")
					horde_panel_text_pointer_6:set_style("semitransparent")
					horde_panel_text_pointer_6:set_topmost(true)
					horde_panel_text_pointer_6:set_label_offset(100, 0)
					horde_panel_text_pointer_6:set_close_button_callback(
						function()
							core:hide_fullscreen_highlight()
							tour_horde_panel:complete()
						end)
					horde_panel_text_pointer_6:set_highlight_close_button(2)
					horde_panel_text_pointer_6:show()

				end,
				0,
				"show_sixth_text_pointer"
			)

			
			--[[tour_horde_panel:action(
				function()
					if tour_horde_panel:complete_if_uicomponent_obj_is_invalid(uic_horde_agent_recruit) then
						return
					end
					
					core:hide_fullscreen_highlight()
					core:show_fullscreen_highlight_around_components(0, false, false, uic_horde_agent_recruit)

					local horde_panel_text_pointer_7 = text_pointer:new_from_component(
						"horde_panel_text_pointer_7",
						"bottom",
						100,
						uic_horde_agent_recruit,
						0.5,
						0
					)
					tour_horde_panel:register_text_pointer(horde_panel_text_pointer_7)

					if cm:get_local_faction_name(true) == "troy_rem_trj_thrace" or cm:get_local_faction_name(true) == "troy_rem_horde_aethiopians" then
						horde_panel_text_pointer_7:add_component_text("text", "ui_text_replacements_localised_text_troy_rem_st_epic_agents")
					else
						horde_panel_text_pointer_7:add_component_text("text", "ui_text_replacements_localised_text_troy_dlc1_st_construction_7")
					end

					horde_panel_text_pointer_7:set_style("semitransparent")
					horde_panel_text_pointer_7:set_topmost(true)
					horde_panel_text_pointer_7:set_label_offset(100, 0)
					horde_panel_text_pointer_7:set_close_button_callback(
						function()
							core:hide_fullscreen_highlight()
							tour_horde_panel:complete()
						end)
					horde_panel_text_pointer_7:set_highlight_close_button(2)
					horde_panel_text_pointer_7:show()

				end,
				0,
				"show_seventh_text_pointer"
			)]]

			tour_horde_panel:start()
		end,
		check = function()
			return true
			end
	},
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	court_positions_overlay = { -- Court menu scripted tour
		exec = function()
			local uic_court_position = find_uicomponent(core:get_ui_root(), "court", "pharaoh_position_v2")
			local uic_position_name = find_uicomponent(core:get_ui_root(), "court", "character_actions_panel", "info_buttons_holder", "character_information", "position_holder_container")
			local uic_position_info = find_uicomponent(core:get_ui_root(), "court", "character_actions_panel", "info_buttons_holder", "character_information", "position_details_holder")
			local uic_action_categories = find_uicomponent(core:get_ui_root(), "court", "character_actions_panel", "info_buttons_holder", "actions_holder")
			local uic_intrigue_actions = find_uicomponent(core:get_ui_root(), "court", "character_actions_panel", "intrigue_panel")
			local uic_request_actons = find_uicomponent(core:get_ui_root(), "court", "character_actions_panel", "request_panel")
			local uic_plot_actions = find_uicomponent(core:get_ui_root(), "court", "character_actions_panel", "plots_panel")
			local uic_overview_panel = find_uicomponent(core:get_ui_root(), "court", "your_faction_info", "overview_holder")
			local uic_plots_panel = find_uicomponent(core:get_ui_root(), "court", "your_faction_info", "plots_content")
			local tour_court_menu = scripted_tour:new(
				"scripted_tour_court_menu",
				function() end
			)
			tour_court_menu:set_steal_esc_key(true)
			tour_court_menu:set_should_hide_text_pointers_on_completion(true)
			tour_court_menu:set_should_dismiss_advice_on_completion(true)
			
			tour_court_menu:action(
				function()
				
					if tour_court_menu:complete_if_uicomponent_obj_is_invalid(uic_court_position) then
						return
					end
					
					core:show_fullscreen_highlight_around_components(25, nil, false, uic_court_position)
					
					local court_position_text_pointer_1 = text_pointer:new_from_component(
						"court_position_text_pointer_1",
						"right",
						50,
						uic_court_position,
						0,
						0.5
					)
					tour_court_menu:register_text_pointer(court_position_text_pointer_1)
					
					court_position_text_pointer_1:add_component_text("text", "ui_text_replacements_localised_text_phar_sea_st_court_1")
					court_position_text_pointer_1:set_style("semitransparent")
					court_position_text_pointer_1:set_topmost(true)
					court_position_text_pointer_1:set_close_button_callback(
						function()
							tour_court_menu:start("tour_court_menu_step_2")
						end
					)
					court_position_text_pointer_1:set_highlight_close_button(2)
					court_position_text_pointer_1:show()
					
				end,
				0
			)

			tour_court_menu:action(
				function()
					local intrigue_button = find_uicomponent(core:get_ui_root(), "court", "intrigue_button")
					if not intrigue_button or intrigue_button:VisibleFromRoot() == false then
						local uic_pharaoh_position = find_uicomponent(core:get_ui_root(), "court", "pharaoh_position_v2", "portrait_pharaoh")
						uic_pharaoh_position:SimulateLClick()
					end
				
					if tour_court_menu:complete_if_uicomponent_obj_is_invalid(uic_position_name) then
						return
					end
					
					core:show_fullscreen_highlight_around_components(20, nil, false, uic_position_name)
					
					local position_name_text_pointer_1 = text_pointer:new_from_component(
						"position_name_text_pointer_1",
						"right",
						50,
						uic_position_name,
						0,
						0.5
					)
					tour_court_menu:register_text_pointer(position_name_text_pointer_1)
					
					position_name_text_pointer_1:add_component_text("text", "ui_text_replacements_localised_text_phar_sea_st_court_2")
					position_name_text_pointer_1:set_style("semitransparent")
					position_name_text_pointer_1:set_topmost(true)
					position_name_text_pointer_1:set_close_button_callback(
						function()
							tour_court_menu:start("tour_court_menu_step_3")
						end
					)
					position_name_text_pointer_1:set_highlight_close_button(2)
					position_name_text_pointer_1:show()
					
				end,
				0,
				"tour_court_menu_step_2"
			)
			
			tour_court_menu:action(
				function()
					
					if tour_court_menu:complete_if_uicomponent_obj_is_invalid(uic_position_info) then
						return
					end
					
					core:show_fullscreen_highlight_around_components(20, nil, false, uic_position_info)
					
					local position_info_text_pointer_1 = text_pointer:new_from_component(
						"position_info_text_pointer_1",
						"right",
						50,
						uic_position_info,
						0,
						0.5
					)
					tour_court_menu:register_text_pointer(position_info_text_pointer_1)
					
					position_info_text_pointer_1:add_component_text("text", "ui_text_replacements_localised_text_phar_sea_st_court_3")
					position_info_text_pointer_1:set_style("semitransparent")
					position_info_text_pointer_1:set_topmost(true)
					position_info_text_pointer_1:set_close_button_callback(
						function()
							tour_court_menu:start("tour_court_menu_step_4")
						end
					)
					position_info_text_pointer_1:set_highlight_close_button(2)
					position_info_text_pointer_1:show()
					
				end,
				0,
				"tour_court_menu_step_3"
			)

			tour_court_menu:action(
				function()
				
					if tour_court_menu:complete_if_uicomponent_obj_is_invalid(uic_action_categories) then
						return
					end
					
					core:show_fullscreen_highlight_around_components(20, nil, false, uic_action_categories)
					
					local action_categories_text_pointer_1 = text_pointer:new_from_component(
						"action_categories_text_pointer_1",
						"right",
						50,
						uic_action_categories,
						0,
						0.5
					)
					tour_court_menu:register_text_pointer(action_categories_text_pointer_1)
					
					action_categories_text_pointer_1:add_component_text("text", "ui_text_replacements_localised_text_phar_sea_st_court_4")
					action_categories_text_pointer_1:set_style("semitransparent")
					action_categories_text_pointer_1:set_topmost(true)
					action_categories_text_pointer_1:set_close_button_callback(
						function()
							tour_court_menu:start("tour_court_menu_step_5")
						end
					)
					action_categories_text_pointer_1:set_highlight_close_button(2)
					action_categories_text_pointer_1:show()
					
				end,
				0,
				"tour_court_menu_step_4"
			)

			tour_court_menu:action(
				function()
					local uic_intrigues_button = find_uicomponent(core:get_ui_root(), "court", "character_actions_panel", "info_buttons_holder", "actions_holder", "intrigue_button")
					uic_intrigues_button:SimulateLClick()
				
					if tour_court_menu:complete_if_uicomponent_obj_is_invalid(uic_intrigue_actions) then
						return
					end
					
					core:show_fullscreen_highlight_around_components(20, nil, false, uic_intrigue_actions)
					
					local intrigue_actions_text_pointer_1 = text_pointer:new_from_component(
						"intrigue_actions_text_pointer_1",
						"right",
						50,
						uic_intrigue_actions,
						0,
						0.5
					)
					tour_court_menu:register_text_pointer(intrigue_actions_text_pointer_1)
					
					intrigue_actions_text_pointer_1:add_component_text("text", "ui_text_replacements_localised_text_phar_sea_st_court_5")
					intrigue_actions_text_pointer_1:set_style("semitransparent")
					intrigue_actions_text_pointer_1:set_topmost(true)
					intrigue_actions_text_pointer_1:set_close_button_callback(
						function()
							tour_court_menu:start("tour_court_menu_step_6")
						end
					)
					intrigue_actions_text_pointer_1:set_highlight_close_button(2)
					intrigue_actions_text_pointer_1:show()
					
				end,
				0,
				"tour_court_menu_step_5"
			)

			tour_court_menu:action(
				function()
					local uic_requests_button = find_uicomponent(core:get_ui_root(), "court", "character_actions_panel", "info_buttons_holder", "actions_holder", "request_button")
					uic_requests_button:SimulateLClick()
				
					if tour_court_menu:complete_if_uicomponent_obj_is_invalid(uic_request_actons) then
						return
					end
					
					core:show_fullscreen_highlight_around_components(20, nil, false, uic_request_actons)
					
					local request_actions_text_pointer_1 = text_pointer:new_from_component(
						"request_actions_text_pointer_1",
						"right",
						50,
						uic_request_actons,
						0,
						0.5
					)
					tour_court_menu:register_text_pointer(request_actions_text_pointer_1)
					
					request_actions_text_pointer_1:add_component_text("text", "ui_text_replacements_localised_text_phar_sea_st_court_6")
					request_actions_text_pointer_1:set_style("semitransparent")
					request_actions_text_pointer_1:set_topmost(true)
					request_actions_text_pointer_1:set_close_button_callback(
						function()
							tour_court_menu:start("tour_court_menu_step_7")
						end
					)
					request_actions_text_pointer_1:set_highlight_close_button(2)
					request_actions_text_pointer_1:show()
					
				end,
				0,
				"tour_court_menu_step_6"
			)

			tour_court_menu:action(
				function()
					local uic_plots_button = find_uicomponent(core:get_ui_root(), "court", "character_actions_panel", "info_buttons_holder", "actions_holder", "plot_button")
					uic_plots_button:SimulateLClick()
				
					if tour_court_menu:complete_if_uicomponent_obj_is_invalid(uic_plot_actions) then
						return
					end
					
					core:show_fullscreen_highlight_around_components(20, nil, false, uic_plot_actions)
					
					local plot_actions_text_pointer_1 = text_pointer:new_from_component(
						"plot_actions_text_pointer_1",
						"right",
						50,
						uic_plot_actions,
						0,
						0.5
					)
					tour_court_menu:register_text_pointer(plot_actions_text_pointer_1)
					
					plot_actions_text_pointer_1:add_component_text("text", "ui_text_replacements_localised_text_phar_sea_st_court_7")
					plot_actions_text_pointer_1:set_style("semitransparent")
					plot_actions_text_pointer_1:set_topmost(true)
					plot_actions_text_pointer_1:set_close_button_callback(
						function()
							tour_court_menu:start("tour_court_menu_step_8")
						end
					)
					plot_actions_text_pointer_1:set_highlight_close_button(2)
					plot_actions_text_pointer_1:show()
					
				end,
				0,
				"tour_court_menu_step_7"
			)

			tour_court_menu:action(
				function()
					local uic_button_overview = find_uicomponent(core:get_ui_root(), "court", "your_faction_info", "overview_plots_tab", "button_overview")
					uic_button_overview:SimulateLClick()
				
					if tour_court_menu:complete_if_uicomponent_obj_is_invalid(uic_overview_panel) then
						return
					end
					
					core:show_fullscreen_highlight_around_components(20, nil, false, uic_overview_panel)
					
					local overview_panel_text_pointer_1 = text_pointer:new_from_component(
						"overview_panel_text_pointer_1",
						"left",
						50,
						uic_overview_panel,
						1,
						0.5
					)
					tour_court_menu:register_text_pointer(overview_panel_text_pointer_1)
					
					overview_panel_text_pointer_1:add_component_text("text", "ui_text_replacements_localised_text_phar_sea_st_court_8")
					overview_panel_text_pointer_1:set_style("semitransparent")
					overview_panel_text_pointer_1:set_topmost(true)
					overview_panel_text_pointer_1:set_close_button_callback(
						function()
							tour_court_menu:start("tour_court_menu_step_9")
						end
					)
					overview_panel_text_pointer_1:set_highlight_close_button(2)
					overview_panel_text_pointer_1:show()
					
				end,
				0,
				"tour_court_menu_step_8"
			)

			tour_court_menu:action(
				function()
					local uic_button_plots = find_uicomponent(core:get_ui_root(), "court", "your_faction_info", "overview_plots_tab", "button_plots")
					uic_button_plots:SimulateLClick()
				
					if tour_court_menu:complete_if_uicomponent_obj_is_invalid(uic_plots_panel) then
						return
					end
					
					core:show_fullscreen_highlight_around_components(20, nil, false, uic_plots_panel)
					
					local plots_panel_text_pointer_1 = text_pointer:new_from_component(
						"plots_panel_text_pointer_1",
						"left",
						50,
						uic_plots_panel,
						1,
						0.5
					)
					tour_court_menu:register_text_pointer(plots_panel_text_pointer_1)
					
					plots_panel_text_pointer_1:add_component_text("text", "ui_text_replacements_localised_text_phar_sea_st_court_9")
					plots_panel_text_pointer_1:set_style("semitransparent")
					plots_panel_text_pointer_1:set_topmost(true)
					plots_panel_text_pointer_1:set_close_button_callback(
						function()
							core:hide_fullscreen_highlight()
							tour_court_menu:complete()
						end
					)
					plots_panel_text_pointer_1:set_highlight_close_button(2)
					plots_panel_text_pointer_1:show()
					
				end,
				0,
				"tour_court_menu_step_9"
			)

			tour_court_menu:start()
		end,
		check = function()
			return true
			end
	},
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
worshipped_gods_overlay = { -- Local Deities scripted tour
		exec = function()
			local uic_worshipped_gods = find_uicomponent(core:get_ui_root(), "local_deities", "worshipped_all_gods_panel", "worshipped_gods_holder", "worshipped_gods_overlay")
			local uic_worshipped_god_slot = find_uicomponent(core:get_ui_root(), "local_deities", "worshipped_all_gods_panel", "worshipped_gods_holder", "worshipped_gods", "god_slot1")
			local uic_dedicated_general = find_uicomponent(core:get_ui_root(), "local_deities", "worshipped_all_gods_panel", "worshipped_gods_holder", "worshipped_gods", "god_slot1", "army_favour_holder", "army_holder")
			local uic_favour_bar = find_uicomponent(core:get_ui_root(), "local_deities", "worshipped_all_gods_panel", "worshipped_gods_holder", "worshipped_gods", "god_slot1", "army_favour_holder", "favour_bar")
			local uic_rededicate_shrines_button = find_uicomponent(core:get_ui_root(), "local_deities", "worshipped_all_gods_panel", "worshipped_gods_holder", "worshipped_gods", "god_slot1", "shrines_button")
			local uic_rededication_toggles = find_uicomponent(core:get_ui_root(), "local_deities", "shrines_and_temples_holder", "shrines_and_temples_overlay")
			local uic_worshipped_all_gods_tabs = find_uicomponent(core:get_ui_root(), "local_deities", "worshipped_all_gods_panel", "tabs_holder", "worshipped_gods_tab")
			local uic_all_gods_list = find_uicomponent(core:get_ui_root(), "local_deities", "worshipped_all_gods_panel", "all_gods_holder", "god_content_overlay")
			local uic_gods_culture_tabs = find_uicomponent(core:get_ui_root(), "local_deities", "worshipped_all_gods_panel", "all_gods_holder", "god_culture_tabs_overlay")
			local tour_local_deities = scripted_tour:new(
				"scripted_tour_local_deities",
				function() end
			)
			tour_local_deities:set_steal_esc_key(true)
			tour_local_deities:set_should_hide_text_pointers_on_completion(true)
			tour_local_deities:set_should_dismiss_advice_on_completion(true)
			
			tour_local_deities:action(
				function()
				
					if tour_local_deities:complete_if_uicomponent_obj_is_invalid(uic_worshipped_gods) then
						return
					end
					
					core:show_fullscreen_highlight_around_components(25, nil, false, uic_worshipped_gods)
					
					local worshipped_gods_text_pointer_1 = text_pointer:new_from_component(
						"worshipped_gods_text_pointer_1",
						"left",
						50,
						uic_worshipped_gods,
						1,
						0.5
					)
					tour_local_deities:register_text_pointer(worshipped_gods_text_pointer_1)
					
					worshipped_gods_text_pointer_1:add_component_text("text", "ui_text_replacements_localised_text_phar_sea_st_local_deities_1")
					worshipped_gods_text_pointer_1:set_style("semitransparent")
					worshipped_gods_text_pointer_1:set_topmost(true)
					worshipped_gods_text_pointer_1:set_close_button_callback(
						function()
							tour_local_deities:start("tour_local_deities_step_2")
						end
					)
					worshipped_gods_text_pointer_1:set_highlight_close_button(2)
					worshipped_gods_text_pointer_1:show()
					
				end,
				0
			)

			tour_local_deities:action(
				function()
				
					if tour_local_deities:complete_if_uicomponent_obj_is_invalid(uic_worshipped_god_slot) then
						return
					end
					
					core:show_fullscreen_highlight_around_components(25, nil, false, uic_worshipped_god_slot)
					
					local worshipped_god_slot_text_pointer_1 = text_pointer:new_from_component(
						"worshipped_god_slot_text_pointer_1",
						"right",
						50,
						uic_worshipped_god_slot,
						0,
						0.5
					)
					tour_local_deities:register_text_pointer(worshipped_god_slot_text_pointer_1)
					
					worshipped_god_slot_text_pointer_1:add_component_text("text", "ui_text_replacements_localised_text_phar_sea_st_local_deities_2")
					worshipped_god_slot_text_pointer_1:set_style("semitransparent")
					worshipped_god_slot_text_pointer_1:set_topmost(true)
					worshipped_god_slot_text_pointer_1:set_close_button_callback(
						function()
							tour_local_deities:start("tour_local_deities_step_3")
						end
					)
					worshipped_god_slot_text_pointer_1:set_highlight_close_button(2)
					worshipped_god_slot_text_pointer_1:show()
					
				end,
				0,
				"tour_local_deities_step_2"
			)

			tour_local_deities:action(
				function()
				
					if tour_local_deities:complete_if_uicomponent_obj_is_invalid(uic_dedicated_general) then
						return
					end
					
					core:show_fullscreen_highlight_around_components(20, nil, false, uic_dedicated_general)
					
					local dedicated_general_text_pointer_1 = text_pointer:new_from_component(
						"dedicated_general_text_pointer_1",
						"bottom",
						50,
						uic_dedicated_general,
						0.5,
						0
					)
					tour_local_deities:register_text_pointer(dedicated_general_text_pointer_1)
					
					dedicated_general_text_pointer_1:add_component_text("text", "ui_text_replacements_localised_text_phar_sea_st_local_deities_3")
					dedicated_general_text_pointer_1:set_style("semitransparent")
					dedicated_general_text_pointer_1:set_topmost(true)
					dedicated_general_text_pointer_1:set_close_button_callback(
						function()
							tour_local_deities:start("tour_local_deities_step_4")
						end
					)
					dedicated_general_text_pointer_1:set_highlight_close_button(2)
					dedicated_general_text_pointer_1:show()
					
				end,
				0,
				"tour_local_deities_step_3"
			)

			tour_local_deities:action(
				function()
				
					if tour_local_deities:complete_if_uicomponent_obj_is_invalid(uic_favour_bar) then
						return
					end
					
					core:show_fullscreen_highlight_around_components(20, nil, false, uic_favour_bar)
					
					local favour_bar_text_pointer_1 = text_pointer:new_from_component(
						"favour_bar_text_pointer_1",
						"top",
						50,
						uic_favour_bar,
						0.5,
						1
					)
					tour_local_deities:register_text_pointer(favour_bar_text_pointer_1)
					
					favour_bar_text_pointer_1:add_component_text("text", "ui_text_replacements_localised_text_phar_sea_st_local_deities_4")
					favour_bar_text_pointer_1:set_style("semitransparent")
					favour_bar_text_pointer_1:set_topmost(true)
					favour_bar_text_pointer_1:set_close_button_callback(
						function()
							tour_local_deities:start("tour_local_deities_step_5")
						end
					)
					favour_bar_text_pointer_1:set_highlight_close_button(2)
					favour_bar_text_pointer_1:show()
					
				end,
				0,
				"tour_local_deities_step_4"
			)

			tour_local_deities:action(
				function()
				
					if tour_local_deities:complete_if_uicomponent_obj_is_invalid(uic_rededicate_shrines_button) then
						return
					end
					
					core:show_fullscreen_highlight_around_components(20, nil, false, uic_rededicate_shrines_button)
					
					local rededicate_shrines_button_text_pointer_1 = text_pointer:new_from_component(
						"rededicate_shrines_button_text_pointer_1",
						"left",
						50,
						uic_rededicate_shrines_button,
						1,
						0.5
					)
					tour_local_deities:register_text_pointer(rededicate_shrines_button_text_pointer_1)
					
					rededicate_shrines_button_text_pointer_1:add_component_text("text", "ui_text_replacements_localised_text_phar_sea_st_local_deities_5")
					rededicate_shrines_button_text_pointer_1:set_style("semitransparent")
					rededicate_shrines_button_text_pointer_1:set_topmost(true)
					rededicate_shrines_button_text_pointer_1:set_close_button_callback(
						function()
							tour_local_deities:start("tour_local_deities_step_6")
						end
					)
					rededicate_shrines_button_text_pointer_1:set_highlight_close_button(2)
					rededicate_shrines_button_text_pointer_1:show()
					
				end,
				0,
				"tour_local_deities_step_5"
			)

			tour_local_deities:action(
				function()
					local uic_rededication_button = find_uicomponent(core:get_ui_root(), "local_deities", "worshipped_all_gods_panel", "worshipped_gods_holder", "worshipped_gods", "god_slot1", "shrines_button", "button_round_basic")
					uic_rededication_button:SimulateLClick()
				
					if tour_local_deities:complete_if_uicomponent_obj_is_invalid(uic_rededication_toggles) then
						return
					end
					
					core:show_fullscreen_highlight_around_components(20, nil, false, uic_rededication_toggles)
					
					local rededication_toggles_text_pointer_1 = text_pointer:new_from_component(
						"rededication_toggles_text_pointer_1",
						"left",
						50,
						uic_rededication_toggles,
						1,
						0.5
					)
					tour_local_deities:register_text_pointer(rededication_toggles_text_pointer_1)
					
					rededication_toggles_text_pointer_1:add_component_text("text", "ui_text_replacements_localised_text_phar_sea_st_local_deities_6")
					rededication_toggles_text_pointer_1:set_style("semitransparent")
					rededication_toggles_text_pointer_1:set_topmost(true)
					rededication_toggles_text_pointer_1:set_close_button_callback(
						function()
							tour_local_deities:start("tour_local_deities_step_7")
						end
					)
					rededication_toggles_text_pointer_1:set_highlight_close_button(2)
					rededication_toggles_text_pointer_1:show()
					
				end,
				0,
				"tour_local_deities_step_6"
			)

			tour_local_deities:action(
				function()
					local uic_rededication_cancel_button = find_uicomponent(core:get_ui_root(), "local_deities", "shrines_and_temples_holder", "button_shrines_cancel")
					uic_rededication_cancel_button:SimulateLClick()
				
					if tour_local_deities:complete_if_uicomponent_obj_is_invalid(uic_worshipped_all_gods_tabs) then
						return
					end
					
					core:show_fullscreen_highlight_around_components(20, nil, false, uic_worshipped_all_gods_tabs)
					
					local worshipped_all_gods_tabs_text_pointer_1 = text_pointer:new_from_component(
						"worshipped_all_gods_tabs_text_pointer_1",
						"left",
						50,
						uic_worshipped_all_gods_tabs,
						1,
						0.5
					)
					tour_local_deities:register_text_pointer(worshipped_all_gods_tabs_text_pointer_1)
					
					worshipped_all_gods_tabs_text_pointer_1:add_component_text("text", "ui_text_replacements_localised_text_phar_sea_st_local_deities_7")
					worshipped_all_gods_tabs_text_pointer_1:set_style("semitransparent")
					worshipped_all_gods_tabs_text_pointer_1:set_topmost(true)
					worshipped_all_gods_tabs_text_pointer_1:set_close_button_callback(
						function()
							tour_local_deities:start("tour_local_deities_step_8")
						end
					)
					worshipped_all_gods_tabs_text_pointer_1:set_highlight_close_button(2)
					worshipped_all_gods_tabs_text_pointer_1:show()
					
				end,
				0,
				"tour_local_deities_step_7"
			)

			tour_local_deities:action(
				function()
					local uic_all_gods_button = find_uicomponent(core:get_ui_root(), "local_deities", "worshipped_all_gods_panel", "tabs_holder", "worshipped_gods_tab", "all_gods_tab")
					uic_all_gods_button:SimulateLClick()
				
					if tour_local_deities:complete_if_uicomponent_obj_is_invalid(uic_gods_culture_tabs) then
						return
					end
					
					core:show_fullscreen_highlight_around_components(20, nil, false, uic_gods_culture_tabs)
					
					local gods_culture_tabs_text_pointer_1 = text_pointer:new_from_component(
						"gods_culture_tabs_text_pointer_1",
						"top",
						50,
						uic_gods_culture_tabs,
						0.5,
						1
					)
					tour_local_deities:register_text_pointer(gods_culture_tabs_text_pointer_1)
					
					gods_culture_tabs_text_pointer_1:add_component_text("text", "ui_text_replacements_localised_text_phar_sea_st_local_deities_8")
					gods_culture_tabs_text_pointer_1:set_style("semitransparent")
					gods_culture_tabs_text_pointer_1:set_topmost(true)
					gods_culture_tabs_text_pointer_1:set_close_button_callback(
						function()
							tour_local_deities:start("tour_local_deities_step_9")
						end
					)
					gods_culture_tabs_text_pointer_1:set_highlight_close_button(2)
					gods_culture_tabs_text_pointer_1:show()
					
				end,
				0,
				"tour_local_deities_step_8"
			)

			tour_local_deities:action(
				function()
				
					if tour_local_deities:complete_if_uicomponent_obj_is_invalid(uic_all_gods_list) then
						return
					end
					
					core:show_fullscreen_highlight_around_components(20, nil, false, uic_all_gods_list)
					
					local all_gods_list_text_pointer_1 = text_pointer:new_from_component(
						"all_gods_list_text_pointer_1",
						"bottom",
						50,
						uic_all_gods_list,
						0.5,
						0
					)
					tour_local_deities:register_text_pointer(all_gods_list_text_pointer_1)
					
					all_gods_list_text_pointer_1:add_component_text("text", "ui_text_replacements_localised_text_phar_sea_st_local_deities_9")
					all_gods_list_text_pointer_1:set_style("semitransparent")
					all_gods_list_text_pointer_1:set_topmost(true)
					all_gods_list_text_pointer_1:set_close_button_callback(
						function()
							core:hide_fullscreen_highlight()
							tour_local_deities:complete()
						end
					)
					all_gods_list_text_pointer_1:set_highlight_close_button(2)
					all_gods_list_text_pointer_1:show()
					
				end,
				0,
				"tour_local_deities_step_9"
			)
			tour_local_deities:start()
		end,
		check = function()
			return true
			end
	},
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
units = {   -- Army recruitment scripted tour
		exec = function()
			local uic_button_recruitment = find_uicomponent(core:get_ui_root(), "units_panel", "main_units_panel", "button_group_army", "button_recruitment")

			local tour_recruitment_options = scripted_tour:new(
				"scripted_tour_recruitment_options",
				function() end
			)
			tour_recruitment_options:set_steal_esc_key(true)
			tour_recruitment_options:set_should_hide_text_pointers_on_completion(true)
			tour_recruitment_options:set_should_dismiss_advice_on_completion(true)

			tour_recruitment_options:action(
				function()
					if tour_recruitment_options:complete_if_uicomponent_obj_is_invalid(uic_button_recruitment) then
						return
					end

					core:show_fullscreen_highlight_around_components(25, nil, false, uic_button_recruitment)

					local recruitment_options_text_pointer_1 = text_pointer:new_from_component(
						"recruitment_options_text_pointer_1",
						"bottom",
						100,
						uic_button_recruitment,
						0.5,
						0
					)
					tour_recruitment_options:register_text_pointer(recruitment_options_text_pointer_1)
					recruitment_options_text_pointer_1:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_recruitment_1")
					recruitment_options_text_pointer_1:set_style("semitransparent")
					recruitment_options_text_pointer_1:set_topmost(true)
					recruitment_options_text_pointer_1:set_close_button_callback(
						function()
							-- if component is visible, continue tour
							if uic_button_recruitment and uic_button_recruitment:Visible() then
								tour_recruitment_options:start("show_second_text_pointer")
								pulse_uicomponent(uic_button_recruitment, false)
							-- if component has been hidden, end tour
							else
								tour_recruitment_options:complete()
							end
						end
					)
					recruitment_options_text_pointer_1:set_highlight_close_button(2)
					recruitment_options_text_pointer_1:show()
					pulse_uicomponent(uic_button_recruitment, 2, 8)

				end,
				0
			)
			tour_recruitment_options:add_skip_action(function()
				pulse_uicomponent(uic_button_recruitment, false)
			end, "tour_recruitment_options_skip_1st_action")

			local uic_unit_count = find_uicomponent(core:get_ui_root(), "unit_panel_title_bar", "dy_unit_count")
			tour_recruitment_options:action(
				function()
					if tour_recruitment_options:complete_if_uicomponent_obj_is_invalid(uic_unit_count) then
						return
					end
					
					core:show_fullscreen_highlight_around_components(20, false, false, uic_unit_count)

					local recruitment_options_text_pointer_2 = text_pointer:new_from_component(
						"recruitment_options_text_pointer_2",
						"bottom",
						100,
						uic_unit_count,
						0.5,
						0
					)
					tour_recruitment_options:register_text_pointer(recruitment_options_text_pointer_2)
					recruitment_options_text_pointer_2:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_recruitment_2")
					recruitment_options_text_pointer_2:set_style("semitransparent")
					recruitment_options_text_pointer_2:set_topmost(true)
					recruitment_options_text_pointer_2:set_close_button_callback(
						function()
							if uic_button_recruitment:CurrentState() == "active" then
								uic_button_recruitment:SimulateLClick()
								tour_recruitment_options:start("show_third_text_pointer")
							elseif uic_button_recruitment:CurrentState() == "selected_hover" or uic_button_recruitment:CurrentState() =="selected" then
								-- if recruit is open already, continue tour
								tour_recruitment_options:start("show_third_text_pointer")
							else
								-- if we can't recruit, we just end the tour here. 
								tour_recruitment_options:complete()
							end
						end)
					recruitment_options_text_pointer_2:set_highlight_close_button(2)
					recruitment_options_text_pointer_2:show()

				end,
				0,
				"show_second_text_pointer"
			)
			
			tour_recruitment_options:action(

				function()
					local uic_recruitment_items = find_uicomponent(core:get_ui_root(), "units_panel", "recruitment_options", "local1")
					local uic_horde_recuitment_items = find_uicomponent(core:get_ui_root(), "units_panel", "recruitment_options", "horde1")


					if not is_uicomponent(uic_recruitment_items) or not uic_recruitment_items:IsValid() then
						if tour_recruitment_options:complete_if_uicomponent_obj_is_invalid(uic_horde_recuitment_items) then
							return
						else
							uic_recruitment_items = uic_horde_recuitment_items
						end
					end
					
					core:hide_fullscreen_highlight()
					core:show_fullscreen_highlight_around_components(0, false, false, uic_recruitment_items)

					local recruitment_options_text_pointer_3 = text_pointer:new_from_component(
						"recruitment_options_text_pointer_3",
						"right",
						100,
						uic_recruitment_items,
						0,
						0.5
					)
					tour_recruitment_options:register_text_pointer(recruitment_options_text_pointer_3)
					recruitment_options_text_pointer_3:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_recruitment_3")
					recruitment_options_text_pointer_3:set_style("semitransparent")
					recruitment_options_text_pointer_3:set_topmost(true)
					recruitment_options_text_pointer_3:set_close_button_callback(
						function()

							local commander_cqi = extract_commander_cqi_from_ui()
							if tonumber(commander_cqi) == nil then
								script_error("Somehow we got here without a valid military force. Completing tour.")
								tour_recruitment_options:complete()
							end
							local commander_unit = cm:model():unit_for_command_queue_index(tonumber(commander_cqi))
							local mf = commander_unit:military_force()

							local faction = cm:get_faction(cm:get_local_faction_name(true))
							if faction:is_allowed_to_capture_territory() and not mf:is_horde() then
								tour_recruitment_options:start("show_fourth_text_pointer")
							else
								tour_recruitment_options:start("show_horde_text_pointer")
							end
						end
					)
					recruitment_options_text_pointer_3:set_highlight_close_button(2)
					recruitment_options_text_pointer_3:show()

				end,
				0,
				"show_third_text_pointer"
			)


			tour_recruitment_options:action(
				function()
					local recruitment_capacity = find_uicomponent(core:get_ui_root(), "units_panel", "main_units_panel", "recruitment_docker", "recruitment_options","title_docker", "title_bar", "recruitment_cap")
					
					if tour_recruitment_options:complete_if_uicomponent_obj_is_invalid(recruitment_capacity) then
						return
					end

					core:hide_fullscreen_highlight()
					core:show_fullscreen_highlight_around_components(20, false, false, recruitment_capacity)

					local recruitment_options_text_pointer_4 = text_pointer:new_from_component(
						"recruitment_options_text_pointer_4",
						"right",
						100,
						recruitment_capacity,
						0,
						0.5
					)
					tour_recruitment_options:register_text_pointer(recruitment_options_text_pointer_4)
					recruitment_options_text_pointer_4:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_recruitment_4")
					recruitment_options_text_pointer_4:set_style("semitransparent")
					recruitment_options_text_pointer_4:set_topmost(true)
					recruitment_options_text_pointer_4:set_close_button_callback(
						function()
							core:hide_fullscreen_highlight()
							tour_recruitment_options:start("show_fifth_text_pointer")
						end
					)
					recruitment_options_text_pointer_4:set_highlight_close_button(2)
					recruitment_options_text_pointer_4:show()

				end,
				0,
				"show_fourth_text_pointer"
			)
			local unit_list = find_uicomponent(core:get_ui_root(),"units_panel","main_units_panel","units")
			tour_recruitment_options:action(
				function()
					if tour_recruitment_options:complete_if_uicomponent_obj_is_invalid(unit_list) then
						return
					end

					core:hide_fullscreen_highlight()
					core:show_fullscreen_highlight_around_components(0, false, false, unit_list)

					local recruitment_options_text_pointer_5 = text_pointer:new_from_component(
						"recruitment_options_text_pointer_5",
						"bottom",
						100,
						unit_list,
						0.5,
						0
					)
					tour_recruitment_options:register_text_pointer(recruitment_options_text_pointer_5)
					recruitment_options_text_pointer_5:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_recruitment_5")
					recruitment_options_text_pointer_5:set_style("semitransparent")
					recruitment_options_text_pointer_5:set_topmost(true)
					--recruitment_options_text_pointer_4:set_label_offset(100, 0)
					recruitment_options_text_pointer_5:set_close_button_callback(
						function()
							core:hide_fullscreen_highlight()
							tour_recruitment_options:complete()
							core:remove_listener("army_recruitment_tour_unit_exchange_listener")
						end
					)
					recruitment_options_text_pointer_5:set_highlight_close_button(2)
					recruitment_options_text_pointer_5:show()

				end,
				0,
				"show_fifth_text_pointer"
			)
			tour_recruitment_options:action(
				function()
					local recruitment_capacity = find_uicomponent(core:get_ui_root(), "units_panel", "main_units_panel", "recruitment_docker", "recruitment_options","title_docker", "title_bar", "recruitment_cap")
					
					if tour_recruitment_options:complete_if_uicomponent_obj_is_invalid(recruitment_capacity) then
						return
					end

					core:hide_fullscreen_highlight()
					core:show_fullscreen_highlight_around_components(0, false, false, recruitment_capacity)

					local recruitment_options_text_pointer_horde = text_pointer:new_from_component(
						"recruitment_options_text_pointer_horde",
						"right",
						100,
						recruitment_capacity,
						0,
						0.5
					)
					tour_recruitment_options:register_text_pointer(recruitment_options_text_pointer_horde)
					recruitment_options_text_pointer_horde:add_component_text("text", "ui_text_replacements_localised_text_troy_dlc1_st_recruitment_4")
					recruitment_options_text_pointer_horde:set_style("semitransparent")
					recruitment_options_text_pointer_horde:set_topmost(true)
					recruitment_options_text_pointer_horde:set_close_button_callback(
						function()
							core:hide_fullscreen_highlight()
							tour_recruitment_options:start("show_fifth_text_pointer")
						end
					)
					recruitment_options_text_pointer_horde:set_highlight_close_button(2)
					recruitment_options_text_pointer_horde:show()

				end,
				0,
				"show_horde_text_pointer"
			)

			tour_recruitment_options:start()
			
			core:add_listener(
				"army_recruitment_tour_unit_exchange_listener",
				"PanelOpenedCampaign", 
				function(context) return context.string == "unit_exchange" end,
				function(context) 
					if tour_recruitment_options then
						tour_recruitment_options:complete()
						core:remove_listener("army_recruitment_tour_unit_exchange_listener")
					end
				end, 
				true
			)

		end,
	check = function()
		local commander_cqi = extract_commander_cqi_from_ui()
		if tonumber(commander_cqi) == nil then
			return false
		end
		local commander_unit = cm:model():unit_for_command_queue_index(tonumber(commander_cqi))
		local mf = commander_unit:military_force()
		local commander = mf:general_character()

		return 	commander_unit:faction():name() == cm:get_local_faction_name(true)
				and not commander:is_at_sea()
				and char_is_alowed_to_recruit(commander)
				and mf:unit_list():num_items() < 20
				and char_can_recruit_any_unit(mf)
	end,
	menu_check = function()
		local loc_faction = cm:model():world():faction_by_key(cm:get_local_faction_name(true))
		local char_list = loc_faction:character_list()
		for i=0,char_list:num_items()-1 do
			local curr_char = char_list:item_at(i)

			if  char_is_mobile_general_with_army(curr_char)
				and not curr_char:is_at_sea()
				and char_is_alowed_to_recruit(curr_char)
				and curr_char:military_force():unit_list():num_items() < 20
				and char_can_recruit_any_unit(curr_char:military_force()) then
				return curr_char
			end
		end
		return false
	end,
	tooltip_ref = function()
		local uic_unit_upgrade = core:get_ui_root():SequentialFind("unit_upgrades")
		local uic_renaming = core:get_ui_root():SequentialFind("popup_text_input", "text_input_list_parent", "text_input")

		if uic_unit_upgrade then 
			return "random_localisation_strings_string_troy_hep_scripted_tour_tooltip_tour_unavailable_unit_upgrades"
		elseif uic_renaming then 
			return "random_localisation_strings_string_troy_hep_scripted_tour_tooltip_renaming_active_unavailable"
		else
			return "random_localisation_strings_string_scripted_tour_tooltip_recruitment_tour_unavailable" 
		end
	end,
	},
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	template_candidate_frame = {	-- Character screen scripted tour

		 exec = function()

		-- 	local uic_hero_stats_header = find_uicomponent(core:get_ui_root(),"character_details_panel", "header_stats")
		-- 	local uic_battle_effects_header = find_uicomponent(core:get_ui_root(),"character_details_panel", "battle_header")
		-- 	local uic_campaign_effects_header = find_uicomponent(core:get_ui_root(),"character_details_panel", "campaign_header")
		-- 	local uic_left_container = find_uicomponent(core:get_ui_root(),"character_details_panel", "container_left_panel")
		-- 	local uic_slider_handle = find_uicomponent(core:get_ui_root(),"character_details_panel", "container_left_panel", "handle")
		-- 	local uic_vslider = find_uicomponent(core:get_ui_root(),"character_details_panel", "container_left_panel", "vslider")

		-- 	local slider_handle_height = uic_slider_handle:Height()
		-- 	local battle_effects_height = uic_battle_effects_header:Height()
		-- 	local campaign_effects_height = uic_campaign_effects_header:Height()
		-- 	local vslider_height = uic_vslider:Height()

		-- 	local stats_x, stats_y = uic_hero_stats_header:Position()
		-- 	local battle_x, battle_y = uic_battle_effects_header:Position()
		-- 	local campaign_x, campaign_y = uic_campaign_effects_header:Position()
		-- 	local lcontainer_x, lcontainer_y = uic_left_container:Position()
		-- 	local slider_handle_x, slider_handle_y = uic_slider_handle:RelativePosition()
		-- 	local new_handle_position_y
			
		-- 	local uic_battle_effects --= find_uicomponent(core:get_ui_root(), "character_details_panel", "hero_info", "battle_effects_section")
		-- 	local uic_campaign_effects --= find_uicomponent(core:get_ui_root(), "character_details_panel", "hero_info", "campaign_effects_section")

		-- 	cm:repeat_callback(
		-- 		function()
		-- 			if slider_handle_y ~= 0 then
		-- 				new_handle_position_y = slider_handle_y - 1
		-- 				uic_vslider:SimulateLClick(slider_handle_x, new_handle_position_y)
		-- 				slider_handle_x, slider_handle_y = uic_slider_handle:RelativePosition()
		-- 			else
		-- 				cm:remove_callback("hero_stats_top")
		-- 				stats_x, stats_y = uic_hero_stats_header:Position()
		-- 			end
		-- 		end,
		-- 		0.1,
		-- 		"hero_stats_top"
		-- 	)

		-- 	local uic_open_details_panel = find_uicomponent(core:get_ui_root(),"character_details_panel", "tab_buttons_holder", "details")
		-- 	uic_open_details_panel:SimulateLClick()
		-- 	local uic_hero_frame = find_uicomponent(core:get_ui_root(), "character_details_panel", "hero_info", "template_candidate_frame")
		-- 	local tour_character_screen = scripted_tour:new(
		-- 		"scripted_tour_character_screen",
		-- 		function() end
		-- 	)
		-- 	tour_character_screen:set_steal_esc_key(true)
		-- 	tour_character_screen:set_should_hide_text_pointers_on_completion(true)
		-- 	tour_character_screen:set_should_dismiss_advice_on_completion(true)

		-- 	tour_character_screen:action(
		-- 		function()
		--			if tour_character_screen:complete_if_uicomponent_obj_is_invalid(uic_hero_frame) then
		--				return
		--			end
		--
		--			core:show_fullscreen_highlight_around_components(25, nil, false, uic_hero_frame)
		-- 			local character_screen_text_pointer_1 = text_pointer:new_from_component(
		-- 				"character_screen_text_pointer_1",
		-- 				"right",
		-- 				100,
		-- 				uic_hero_frame,
		-- 				0,
		-- 				0.5
		-- 			)
		-- 			tour_character_screen:register_text_pointer(character_screen_text_pointer_1)
		-- 			character_screen_text_pointer_1:add_component_text("text", "ui_text_replacements_localised_text_troy_st_char_screen_1")
		-- 			character_screen_text_pointer_1:set_style("semitransparent")
		-- 			character_screen_text_pointer_1:set_topmost(true)
		-- 			character_screen_text_pointer_1:set_close_button_callback(
		-- 				function()
		-- 					tour_character_screen:start("show_second_text_pointer")
		-- 				end
		-- 			)
		-- 			character_screen_text_pointer_1:set_highlight_close_button(2)
		-- 			character_screen_text_pointer_1:show()

		-- 		end,
		-- 		0
		-- 	)
		-- 	local uic_character_stats = find_uicomponent(core:get_ui_root(), "character_details_panel", "hero_info", "container_left_panel", "stats_panel")

		-- 	tour_character_screen:action(
		-- 		function()
		--			if tour_character_screen:complete_if_uicomponent_obj_is_invalid(uic_character_stats) then
		--				return
		--			end
		-- 			core:show_fullscreen_highlight_around_components(0, false, false, uic_character_stats)

		-- 			local character_screen_text_pointer_2 = text_pointer:new_from_component(
		-- 				"character_screen_text_pointer_2",
		-- 				"left",
		-- 				100,
		-- 				uic_character_stats,
		-- 				1,
		-- 				0.5
		-- 			)
		-- 			tour_character_screen:register_text_pointer(character_screen_text_pointer_2)
		-- 			character_screen_text_pointer_2:add_component_text("text", "ui_text_replacements_localised_text_troy_st_char_screen_2")
		-- 			character_screen_text_pointer_2:set_style("semitransparent")
		-- 			character_screen_text_pointer_2:set_topmost(true)
		-- 			character_screen_text_pointer_2:set_close_button_callback(
		-- 				function()
		-- 					cm:repeat_callback(
		-- 					function()

		-- 						if stats_y <= (battle_y - (battle_effects_height*2)) and new_handle_position_y ~= vslider_height then
		-- 							new_handle_position_y = slider_handle_y + slider_handle_height
		-- 							uic_vslider:SimulateLClick(slider_handle_x, new_handle_position_y)
		-- 							slider_handle_x, slider_handle_y = uic_slider_handle:RelativePosition()
		-- 							battle_x, battle_y = uic_battle_effects_header:Position()
		-- 						else 
		-- 							cm:remove_callback("battle_effects_on_screen")
		-- 							uic_battle_effects = find_uicomponent(core:get_ui_root(), "character_details_panel", "hero_info", "battle_effects_section")
		-- 							tour_character_screen:start("show_third_text_pointer")
		-- 						end
		-- 					end,
		-- 					0.1,
		-- 					"battle_effects_on_screen"
		-- 					)
		-- 				end)
		-- 			character_screen_text_pointer_2:set_highlight_close_button(2)
		-- 			character_screen_text_pointer_2:show()

		-- 		end,
		-- 		0,
		-- 		"show_second_text_pointer"
		-- 	)

		-- 	tour_character_screen:action(
		-- 		function()
		--			if tour_character_screen:complete_if_uicomponent_obj_is_invalid(uic_battle_effects) then
		--				return
		--			end
		
		-- 			core:hide_fullscreen_highlight()
		-- 			core:show_fullscreen_highlight_around_components(0, false, false, uic_battle_effects)

		-- 			local character_screen_text_pointer_3 = text_pointer:new_from_component(
		-- 				"character_screen_text_pointer_3",
		-- 				"left",
		-- 				100,
		-- 				uic_battle_effects,
		-- 				1,
		-- 				0.5
		-- 			)
		-- 			tour_character_screen:register_text_pointer(character_screen_text_pointer_3)
		-- 			character_screen_text_pointer_3:add_component_text("text", "ui_text_replacements_localised_text_troy_st_char_screen_3")
		-- 			character_screen_text_pointer_3:set_style("semitransparent")
		-- 			character_screen_text_pointer_3:set_topmost(true)
		-- 			character_screen_text_pointer_3:set_close_button_callback(
		-- 				function()
		-- 					cm:repeat_callback(
		-- 					function()
		-- 						battle_x, battle_y = uic_battle_effects_header:Position()
		-- 						slider_handle_x, slider_handle_y = uic_slider_handle:Position()
		-- 						if stats_y <= (campaign_y - (campaign_effects_height*2)) and new_handle_position_y ~= vslider_height then
		-- 							new_handle_position_y = slider_handle_y + slider_handle_height
		-- 							uic_vslider:SimulateLClick(slider_handle_x, new_handle_position_y)
		-- 							slider_handle_x, slider_handle_y = uic_slider_handle:Position()
		-- 							campaign_x, campaign_y = uic_battle_effects_header:Position()
		-- 						else 
		-- 							cm:remove_callback("campaign_effects_on_screen")
		-- 							uic_campaign_effects = find_uicomponent(core:get_ui_root(), "character_details_panel", "hero_info", "campaign_effects_section")
		-- 							tour_character_screen:start("show_fourth_text_pointer")
		-- 						end
		-- 					end,
		-- 					0.1,
		-- 					"campaign_effects_on_screen"
		-- 					)
		-- 				end
		-- 			)
		-- 			character_screen_text_pointer_3:set_highlight_close_button(2)
		-- 			character_screen_text_pointer_3:show()

		-- 		end,
		-- 		0,
		-- 		"show_third_text_pointer"
		-- 	)

		-- 	tour_character_screen:action(
		-- 		function()
		--			if tour_character_screen:complete_if_uicomponent_obj_is_invalid(uic_campaign_effects) then
		--				return
		--			end

		-- 			core:hide_fullscreen_highlight()
		-- 			core:show_fullscreen_highlight_around_components(0, false, false, uic_campaign_effects)

		-- 			local character_screen_text_pointer_4 = text_pointer:new_from_component(
		-- 				"character_screen_text_pointer_4",
		-- 				"left",
		-- 				100,
		-- 				uic_campaign_effects,
		-- 				1,
		-- 				0.5
		-- 			)
		-- 			tour_character_screen:register_text_pointer(character_screen_text_pointer_4)
		-- 			character_screen_text_pointer_4:add_component_text("text", "ui_text_replacements_localised_text_troy_st_char_screen_4")
		-- 			character_screen_text_pointer_4:set_style("semitransparent")
		-- 			character_screen_text_pointer_4:set_topmost(true)
		-- 			character_screen_text_pointer_4:set_close_button_callback(
		-- 				function()
		-- 					tour_character_screen:start("show_fifth_text_pointer")
		-- 				end
		-- 			)
		-- 			character_screen_text_pointer_4:set_highlight_close_button(2)
		-- 			character_screen_text_pointer_4:show()

		-- 		end,
		-- 		0,
		-- 		"show_fourth_text_pointer"
		-- 	)

		-- 	local uic_character_info_panel = find_uicomponent(core:get_ui_root(),"character_details_panel" , "hero_info", "sidepanel_info_traits", "details"--[[ , "character_info" --]])

		-- 	tour_character_screen:action(
		-- 		function()
		--			if tour_character_screen:complete_if_uicomponent_obj_is_invalid(uic_character_info_panel) then
		--				return
		--			end
		-- 			core:hide_fullscreen_highlight()
		-- 			core:show_fullscreen_highlight_around_components(0, false, false, uic_character_info_panel)

		-- 			local character_screen_text_pointer_5 = text_pointer:new_from_component(
		-- 				"character_screen_text_pointer_5",
		-- 				"right",
		-- 				100,
		-- 				uic_character_info_panel,
		-- 				0,
		-- 				0.5
		-- 			)
		-- 			tour_character_screen:register_text_pointer(character_screen_text_pointer_5)
		-- 			character_screen_text_pointer_5:add_component_text("text", "ui_text_replacements_localised_text_troy_st_char_screen_5")
		-- 			character_screen_text_pointer_5:set_style("semitransparent")
		-- 			character_screen_text_pointer_5:set_topmost(true)
		-- 			character_screen_text_pointer_5:set_close_button_callback(
		-- 				function()
		-- 					tour_character_screen:start("show_sixth_text_pointer")
		-- 				end
		-- 			)
		-- 			character_screen_text_pointer_5:set_highlight_close_button(2)
		-- 			character_screen_text_pointer_5:show()

		-- 		end,
		-- 		0,
		-- 		"show_fifth_text_pointer"
		-- 	)
		-- 	local uic_character_traits = find_uicomponent(core:get_ui_root(),"character_details_panel", "hero_info", "sidepanel_info_traits", "listview")
		-- 	local uic_character_traits_header = find_uicomponent(core:get_ui_root(),"character_details_panel", "hero_info", "sidepanel_info_traits", "loyalty_traits_list")

		-- 	tour_character_screen:action(
		-- 		function()
		--			if tour_character_screen:complete_if_uicomponent_obj_is_invalid(uic_character_traits) then
		--				return
		--			end
		-- 			core:hide_fullscreen_highlight()
		-- 			core:show_fullscreen_highlight_around_components(0, false, false, uic_character_traits, uic_character_traits_header)

		-- 			local character_screen_text_pointer_6 = text_pointer:new_from_component(
		-- 				"character_screen_text_pointer_6",
		-- 				"right",
		-- 				100,
		-- 				uic_character_traits,
		-- 				0,
		-- 				0.5
		-- 			)
		-- 			tour_character_screen:register_text_pointer(character_screen_text_pointer_6)
		-- 			character_screen_text_pointer_6:add_component_text("text", "ui_text_replacements_localised_text_troy_st_char_screen_6")
		-- 			character_screen_text_pointer_6:set_style("semitransparent")
		-- 			character_screen_text_pointer_6:set_topmost(true)
		-- 			character_screen_text_pointer_6:set_highlight_close_button(2)
		-- 			character_screen_text_pointer_6:set_close_button_callback(
		-- 				function()
		-- 					tour_character_screen:start("show_seventh_text_pointer")
		-- 				end
		-- 			)
		-- 			character_screen_text_pointer_6:set_highlight_close_button(2)
		-- 			character_screen_text_pointer_6:show()

		-- 		end,
		-- 		0,
		-- 		"show_sixth_text_pointer"
		-- 	)
		-- 	local uic_skills_button = find_uicomponent(core:get_ui_root(),"character_details_panel", "tab_buttons_holder", "skills")
		-- 	tour_character_screen:action(
		-- 		function()
		--			if tour_character_screen:complete_if_uicomponent_obj_is_invalid(uic_skills_button) then
		--				return
		--			end
		-- 			core:hide_fullscreen_highlight()
		-- 			core:show_fullscreen_highlight_around_components(0, false, false, uic_skills_button)

		-- 			local character_screen_text_pointer_7 = text_pointer:new_from_component(
		-- 				"character_screen_text_pointer_7",
		-- 				"top",
		-- 				100,
		-- 				uic_skills_button,
		-- 				0.5,
		-- 				1
		-- 			)
		-- 			tour_character_screen:register_text_pointer(character_screen_text_pointer_7)
		-- 			character_screen_text_pointer_7:add_component_text("text", "ui_text_replacements_localised_text_troy_st_char_screen_7")
		-- 			character_screen_text_pointer_7:set_style("semitransparent")
		-- 			character_screen_text_pointer_7:set_topmost(true)
		-- 			character_screen_text_pointer_7:set_highlight_close_button(2)
		-- 			character_screen_text_pointer_7:set_close_button_callback(
		-- 				function()
		-- 					uic_skills_button:SimulateLClick()
		-- 					tour_character_screen:start("show_eigth_text_pointer")
		-- 				end
		-- 			)
		-- 			character_screen_text_pointer_7:set_highlight_close_button(2)
		-- 			character_screen_text_pointer_7:show()

		-- 		end,
		-- 		0,
		-- 		"show_seventh_text_pointer"
		-- 	)

		-- 	tour_character_screen:action(
		-- 		function()
		-- 			local uic_available_skill_points = find_uicomponent(core:get_ui_root(),"character_details_panel", "hero_info", "sidepanel_skills", "skills_subpanel", "skill_points_holder")
		
		--			if tour_character_screen:complete_if_uicomponent_obj_is_invalid(uic_available_skill_points) then
		--				return
		--			end

		-- 			core:hide_fullscreen_highlight()
		-- 			core:show_fullscreen_highlight_around_components(0, false, false, uic_available_skill_points)

		-- 			local character_screen_text_pointer_8 = text_pointer:new_from_component(
		-- 				"character_screen_text_pointer_8",
		-- 				"right",
		-- 				100,
		-- 				uic_available_skill_points,
		-- 				0,
		-- 				0.5
		-- 			)
		-- 			tour_character_screen:register_text_pointer(character_screen_text_pointer_8)
		-- 			character_screen_text_pointer_8:add_component_text("text", "ui_text_replacements_localised_text_troy_st_char_screen_8")
		-- 			character_screen_text_pointer_8:set_style("semitransparent")
		-- 			character_screen_text_pointer_8:set_topmost(true)
		-- 			character_screen_text_pointer_8:set_highlight_close_button(2)
		-- 			character_screen_text_pointer_8:set_close_button_callback(
		-- 				function()
		-- 					tour_character_screen:start("show_ninth_text_pointer")
		-- 				end
		-- 			)
		-- 			character_screen_text_pointer_8:set_highlight_close_button(2)
		-- 			character_screen_text_pointer_8:show()

		-- 		end,
		-- 		0,
		-- 		"show_eigth_text_pointer"
		-- 	)

		-- 	tour_character_screen:action(
		-- 		function()
		-- 			local uic_skills_list = find_uicomponent(core:get_ui_root(),"character_details_panel", "hero_info", "sidepanel_skills", "skills_subpanel", "listview")
		
		--			if tour_character_screen:complete_if_uicomponent_obj_is_invalid(uic_skills_list) then
		--				return
		--			end

		-- 			core:hide_fullscreen_highlight()
		-- 			core:show_fullscreen_highlight_around_components(0, false, false, uic_skills_list)

		-- 			local character_screen_text_pointer_9 = text_pointer:new_from_component(
		-- 				"character_screen_text_pointer_9",
		-- 				"right",
		-- 				100,
		-- 				uic_skills_list,
		-- 				0,
		-- 				0.5
		-- 			)
		-- 			tour_character_screen:register_text_pointer(character_screen_text_pointer_9)
		-- 			character_screen_text_pointer_9:add_component_text("text", "ui_text_replacements_localised_text_troy_st_char_screen_9")
		-- 			character_screen_text_pointer_9:set_style("semitransparent")
		-- 			character_screen_text_pointer_9:set_topmost(true)
		-- 			character_screen_text_pointer_9:set_highlight_close_button(2)
		-- 			character_screen_text_pointer_9:set_close_button_callback(
		-- 				function()
		-- 					tour_character_screen:start("show_tenth_text_pointer")
		-- 				end
		-- 			)
		-- 			character_screen_text_pointer_9:set_highlight_close_button(2)
		-- 			character_screen_text_pointer_9:show()

		-- 		end,
		-- 		0,
		-- 		"show_ninth_text_pointer"
		-- 	)
		-- 	local uic_assigned_skills_bar = find_uicomponent(core:get_ui_root(),"character_details_panel", "skills_legend_holder")
		-- 	tour_character_screen:action(
		-- 		function()
		--			if tour_character_screen:complete_if_uicomponent_obj_is_invalid(uic_assigned_skills_bar) then
		--				return
		--			end

		-- 			core:hide_fullscreen_highlight()
		-- 			core:show_fullscreen_highlight_around_components(0, false, false, uic_assigned_skills_bar)

		-- 			local character_screen_text_pointer_10 = text_pointer:new_from_component(
		-- 				"character_screen_text_pointer_10",
		-- 				"top",
		-- 				100,
		-- 				uic_assigned_skills_bar,
		-- 				0.5,
		-- 				1
		-- 			)
		-- 			tour_character_screen:register_text_pointer(character_screen_text_pointer_10)
		-- 			character_screen_text_pointer_10:add_component_text("text", "ui_text_replacements_localised_text_troy_st_char_screen_10")
		-- 			character_screen_text_pointer_10:set_style("semitransparent")
		-- 			character_screen_text_pointer_10:set_topmost(true)
		-- 			character_screen_text_pointer_10:set_highlight_close_button(2)
		-- 			character_screen_text_pointer_10:set_close_button_callback(
		-- 				function()
		-- 					tour_character_screen:start("show_eleventh_text_pointer")
		-- 				end
		-- 			)
		-- 			character_screen_text_pointer_10:set_highlight_close_button(2)
		-- 			character_screen_text_pointer_10:show()

		-- 		end,
		-- 		0,
		-- 		"show_tenth_text_pointer"
		-- 	)
		-- 	local uic_equipment_tab = find_uicomponent(core:get_ui_root(),"character_details_panel", "tab_buttons_holder", "equipment")
		-- 	tour_character_screen:action(
		-- 		function()
		--			if tour_character_screen:complete_if_uicomponent_obj_is_invalid(uic_equipment_tab) then
		--				return
		--			end

		-- 			core:hide_fullscreen_highlight()
		-- 			core:show_fullscreen_highlight_around_components(0, false, false, uic_equipment_tab)

		-- 			local character_screen_text_pointer_11 = text_pointer:new_from_component(
		-- 				"character_screen_text_pointer_11",
		-- 				"top",
		-- 				100,
		-- 				uic_equipment_tab,
		-- 				0.5,
		-- 				1
		-- 			)
		-- 			tour_character_screen:register_text_pointer(character_screen_text_pointer_11)
		-- 			character_screen_text_pointer_11:add_component_text("text", "ui_text_replacements_localised_text_troy_st_char_screen_11")
		-- 			character_screen_text_pointer_11:set_style("semitransparent")
		-- 			character_screen_text_pointer_11:set_topmost(true)
		-- 			character_screen_text_pointer_11:set_highlight_close_button(2)
		-- 			character_screen_text_pointer_11:set_close_button_callback(
		-- 				function()
		-- 					uic_equipment_tab:SimulateLClick()
		-- 					tour_character_screen:start("show_twelfth_text_pointer")
		-- 				end
		-- 			)
		-- 			character_screen_text_pointer_11:set_highlight_close_button(2)
		-- 			character_screen_text_pointer_11:show()

		-- 		end,
		-- 		0,
		-- 		"show_eleventh_text_pointer"
		-- 	)

		-- 	tour_character_screen:action(
		-- 		function()
		-- 			local uic_ancillary_equipment = find_uicomponent(core:get_ui_root(),"character_details_panel", "hero_info", "ancillary_parent", "ancillary_equipment")
		
		--			if tour_character_screen:complete_if_uicomponent_obj_is_invalid(uic_ancillary_equipment) then
		--				return
		--			end
		
		-- 			core:hide_fullscreen_highlight()
		-- 			core:show_fullscreen_highlight_around_components(0, false, false, uic_ancillary_equipment)

		-- 			local character_screen_text_pointer_12 = text_pointer:new_from_component(
		-- 				"character_screen_text_pointer_12",
		-- 				"right",
		-- 				100,
		-- 				uic_ancillary_equipment,
		-- 				0,
		-- 				0.5
		-- 			)
		-- 			tour_character_screen:register_text_pointer(character_screen_text_pointer_12)
		-- 			character_screen_text_pointer_12:add_component_text("text", "ui_text_replacements_localised_text_troy_st_char_screen_12")
		-- 			character_screen_text_pointer_12:set_style("semitransparent")
		-- 			character_screen_text_pointer_12:set_topmost(true)
		-- 			character_screen_text_pointer_12:set_highlight_close_button(2)
		-- 			character_screen_text_pointer_12:set_close_button_callback(
		-- 				function()
		-- 					tour_character_screen:start("show_thirdtheenth_text_pointer")
		-- 				end
		-- 			)
		-- 			character_screen_text_pointer_12:set_highlight_close_button(2)
		-- 			character_screen_text_pointer_12:show()

		-- 		end,
		-- 		0,
		-- 		"show_twelfth_text_pointer"
		-- 	)
		-- 	tour_character_screen:action(
		-- 		function()
		-- 			local uic_ancillary_followers = find_uicomponent(core:get_ui_root(),"character_details_panel", "hero_info", "ancillary_parent", "ancillary_general")
		
		--			if tour_character_screen:complete_if_uicomponent_obj_is_invalid(uic_ancillary_followers) then
		--				return
		--			end

		-- 			core:hide_fullscreen_highlight()
		-- 			core:show_fullscreen_highlight_around_components(0, false, false, uic_ancillary_followers)

		-- 			local character_screen_text_pointer_13 = text_pointer:new_from_component(
		-- 				"character_screen_text_pointer_13",
		-- 				"right",
		-- 				100,
		-- 				uic_ancillary_followers,
		-- 				0,
		-- 				0.5
		-- 			)
		-- 			tour_character_screen:register_text_pointer(character_screen_text_pointer_13)
		-- 			character_screen_text_pointer_13:add_component_text("text", "ui_text_replacements_localised_text_troy_st_char_screen_13")
		-- 			character_screen_text_pointer_13:set_style("semitransparent")
		-- 			character_screen_text_pointer_13:set_topmost(true)
		-- 			character_screen_text_pointer_13:set_highlight_close_button(2)
		-- 			character_screen_text_pointer_13:set_close_button_callback(
		-- 				function()
		-- 					core:hide_fullscreen_highlight()
		-- 					tour_character_screen:complete()
		-- 				end
		-- 			)
		-- 			character_screen_text_pointer_13:show()

		-- 		end,
		-- 		0,
		-- 		"show_thirdtheenth_text_pointer"
		-- 	)

		-- 	tour_character_screen:start()

		end,
		check = function() return true end,
		menu_check = function() return true end
	},
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[[ resource_trading = {   -- Foreign traders scripted tour
exec = function()
	local uic_resources_selling = find_uicomponent(core:get_ui_root(),  "resource_trading" , "tabs_holder" , "normal_resources_contents" , "sell_resource_container" )

	local tour_foreign_traders = scripted_tour:new(
		"scripted_tour_foreign_traders",
		function() end
	)
	
	tour_foreign_traders:action(
		function()
			core:show_fullscreen_highlight_around_components(25, nil, false, uic_resources_selling)
			local foreign_traders_text_pointer_1 = text_pointer:new_from_component(
				"foreign_traders_text_pointer_1",
				"left",
				100,
				uic_resources_selling,
				1,
				0.5
			)

			foreign_traders_text_pointer_1:add_component_text("text", "ui_text_replacements_localised_text_troy_main_tutorial_scripted_tour_foreign_traders_1")
			foreign_traders_text_pointer_1:set_style("semitransparent")
			foreign_traders_text_pointer_1:set_topmost(true)
			foreign_traders_text_pointer_1:set_close_button_callback(
				function()
					tour_foreign_traders:start("show_second_text_pointer")
				end
			)
			foreign_traders_text_pointer_1:set_highlight_close_button(2)
			foreign_traders_text_pointer_1:show()
			pulse_uicomponent(uic_resources_selling, 2, 8)

		end,
		0
	)

	local uic_resources_buying = find_uicomponent(core:get_ui_root(), "resource_trading" , "tabs_holder" , "normal_resources_contents" , "buy_resource_container" )
	tour_foreign_traders:action(
		function()

			pulse_uicomponent(uic_resources_selling, false)
			core:show_fullscreen_highlight_around_components(0, false, false, uic_resources_buying)

			local foreign_traders_text_pointer_2 = text_pointer:new_from_component(
				"foreign_traders_text_pointer_2",
				"right",
				100,
				uic_resources_buying,
				0,
				0.5
			)

			foreign_traders_text_pointer_2:add_component_text("text", "ui_text_replacements_localised_text_troy_main_tutorial_scripted_tour_foreign_traders_2")
			foreign_traders_text_pointer_2:set_style("semitransparent")
			foreign_traders_text_pointer_2:set_topmost(true)
			foreign_traders_text_pointer_2:set_close_button_callback(
				function()
					tour_foreign_traders:start("show_third_text_pointer")
				end)
				foreign_traders_text_pointer_2:set_highlight_close_button(2)
				foreign_traders_text_pointer_2:show()

		end,
		0,
		"show_second_text_pointer"
	)

	local uic_finish_transaction = find_uicomponent(core:get_ui_root(), "resource_trading" , "finish_button_holder" , "button_finish_transaction")
	tour_foreign_traders:action(
		function()
			core:hide_fullscreen_highlight()
			core:show_fullscreen_highlight_around_components(0, false, false, uic_finish_transaction)

			local foreign_traders_text_pointer_3 = text_pointer:new_from_component(
				"foreign_traders_text_pointer_3",
				"right",
				100,
				uic_finish_transaction,
				0,
				0.5
			)

			foreign_traders_text_pointer_3:add_component_text("text", "ui_text_replacements_localised_text_troy_main_tutorial_scripted_tour_foreign_traders_3")
			foreign_traders_text_pointer_3:set_style("semitransparent")
			foreign_traders_text_pointer_3:set_topmost(true)
			foreign_traders_text_pointer_3:set_close_button_callback(
				function()
					core:hide_fullscreen_highlight()
					tour_foreign_traders:start("show_fourth_text_pointer")
				end
			)
			foreign_traders_text_pointer_3:set_highlight_close_button(2)
			foreign_traders_text_pointer_3:show()

		end,
		0,
		"show_third_text_pointer"
	)

	local uic_cancel_transaction = find_uicomponent(core:get_ui_root(), "resource_trading" , "finish_button_holder" , "button_undo")
	tour_foreign_traders:action(
		function()

			core:hide_fullscreen_highlight()
			core:show_fullscreen_highlight_around_components(0, false, false, uic_cancel_transaction)

			local foreign_traders_text_pointer_4 = text_pointer:new_from_component(
				"foreign_traders_text_pointer_4",
				"bottom",
				100,
				uic_cancel_transaction,
				0.5,
				0
			)

			foreign_traders_text_pointer_4:add_component_text("text", "ui_text_replacements_localised_text_troy_main_tutorial_scripted_tour_foreign_traders_4")
			foreign_traders_text_pointer_4:set_style("semitransparent")
			foreign_traders_text_pointer_4:set_topmost(true)
			foreign_traders_text_pointer_4:set_close_button_callback(
				function()
					core:hide_fullscreen_highlight()
					tour_foreign_traders:complete()
				end
			)
			foreign_traders_text_pointer_4:set_highlight_close_button(2)
			foreign_traders_text_pointer_4:show()

		end,
		0,
		"show_fourth_text_pointer"
	)
	tour_foreign_traders:start()
end,
check = function() return true end,
menu_check = function() return true end
}, --]]
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	gods_levels_overlay = {   -- Gods and Favour scripted tour
		exec = function()
			local uic_overview = find_uicomponent(core:get_ui_root(), "gods_and_favor" , "Overview")
			local uic_container = find_uicomponent(core:get_ui_root(),  "gods_and_favor", "container_hecatomb_prayer")
			local uic_prayer_column = find_uicomponent(core:get_ui_root(),  "gods_and_favor", "container_hecatomb_prayer", "prayer_holder")
			local uic_hecatomb_column = find_uicomponent(core:get_ui_root(),  "gods_and_favor", "container_hecatomb_prayer", "hecatomb_holder")

			local tour_gods_and_favor = scripted_tour:new(
				"scripted_tour_gods_and_favor",
				function() end
			)
			core:hide_fullscreen_highlight()
			core:show_fullscreen_highlight_around_components(0, false, false, uic_container)
			tour_gods_and_favor:set_steal_esc_key(true)

			tour_gods_and_favor:set_should_hide_text_pointers_on_completion(true)
			tour_gods_and_favor:set_should_dismiss_advice_on_completion(true)

			tour_gods_and_favor:action(
				function()
					if tour_gods_and_favor:complete_if_uicomponent_obj_is_invalid(uic_container) then
						return
					end

					local gods_and_favor_text_pointer_1 = text_pointer:new_from_component(
						"gods_and_favor_text_pointer_1",
						"bottom",
						100,
						uic_container,
						0.5,
						0
					)
					tour_gods_and_favor:register_text_pointer(gods_and_favor_text_pointer_1)
					gods_and_favor_text_pointer_1:add_component_text("text", "ui_text_replacements_localised_text_troy_st_divine_will_1")
					gods_and_favor_text_pointer_1:set_style("semitransparent")
					gods_and_favor_text_pointer_1:set_topmost(true)
					gods_and_favor_text_pointer_1:set_close_button_callback(
						function()
							core:hide_fullscreen_highlight()
							tour_gods_and_favor:start("show_second_text_pointer")
							pulse_uicomponent(uic_prayer_column, false)
							pulse_uicomponent(uic_hecatomb_column, false)
						end
					)
					gods_and_favor_text_pointer_1:set_highlight_close_button(2)
					gods_and_favor_text_pointer_1:show()
					pulse_uicomponent(uic_prayer_column, 2, 8)
					pulse_uicomponent(uic_hecatomb_column, 2, 8)

				end,
				0
			)

			tour_gods_and_favor:add_skip_action(function()
				core:hide_fullscreen_highlight()
				pulse_uicomponent(uic_prayer_column, false)
				pulse_uicomponent(uic_hecatomb_column, false)
			end, "tour_gods_and_favor_skip_1st_action")

			local uic_zeus_name_plate = find_uicomponent(core:get_ui_root(),"gods_and_favor", "gods_list", "overview_god_card_zeus", "name_plate")
			local uic_zeus = nil
			tour_gods_and_favor:action(
				function()
					local uic_zeus_check_1 = find_uicomponent(core:get_ui_root(),"gods_and_favor", "gods_list", "overview_god_card_zeus", "portrait_tiers", "portrait_tier_1")
					local uic_zeus_check_2 = find_uicomponent(core:get_ui_root(),"gods_and_favor", "gods_list", "overview_god_card_zeus", "portrait_tiers", "portrait_tier_2")
					local uic_zeus_check_3 = find_uicomponent(core:get_ui_root(),"gods_and_favor", "gods_list", "overview_god_card_zeus", "portrait_tiers", "portrait_tier_3")

					if uic_zeus_check_1:Visible() then
						uic_zeus = uic_zeus_check_1
					elseif uic_zeus_check_2:Visible() then
						uic_zeus = uic_zeus_check_2
					elseif uic_zeus_check_3:Visible() then
						uic_zeus = uic_zeus_check_3
					else 
						uic_zeus = uic_zeus_name_plate
					end

					if tour_gods_and_favor:complete_if_uicomponent_obj_is_invalid(uic_zeus) then
						return
					end

					core:hide_fullscreen_highlight()
					core:show_fullscreen_highlight_around_components(6, false, false, uic_zeus)

					local gods_and_favor_text_pointer_2 = text_pointer:new_from_component(
						"gods_and_favor_text_pointer_2",
						"left",
						100,
						uic_zeus,
						1,
						0.5
					)
					tour_gods_and_favor:register_text_pointer(gods_and_favor_text_pointer_2)
					gods_and_favor_text_pointer_2:add_component_text("text", "ui_text_replacements_localised_text_troy_st_divine_will_2")
					gods_and_favor_text_pointer_2:set_style("semitransparent")
					gods_and_favor_text_pointer_2:set_topmost(true)
					gods_and_favor_text_pointer_2:set_close_button_callback(
						function()
							if 	uic_zeus_name_plate:CurrentState() == "active" then
								uic_zeus_name_plate:SimulateLClick()
							end
							core:hide_fullscreen_highlight()
							tour_gods_and_favor:start("show_third_text_pointer")
						end)
					gods_and_favor_text_pointer_2:set_highlight_close_button(2)
					gods_and_favor_text_pointer_2:show()
				end,
				0,
				"show_second_text_pointer"
			)

			local uic_hecatomb_button = find_uicomponent(core:get_ui_root(), "gods_and_favor", "container_hecatomb_prayer", "hecatomb_holder", "action_button")
			local divine_will_text = nil
			tour_gods_and_favor:action(
				function()
					if tour_gods_and_favor:complete_if_uicomponent_obj_is_invalid(uic_hecatomb_button) then
						return
					end
					
					if uic_hecatomb_button:CurrentState() == "active" then
						divine_will_text = "ui_text_replacements_localised_text_troy_st_divine_will_3"
					else
						divine_will_text = "ui_text_replacements_localised_text_troy_st_divine_will_3_1"
					end

					core:hide_fullscreen_highlight()
					core:show_fullscreen_highlight_around_components(0, false, false, uic_hecatomb_button)

					local gods_and_favor_text_pointer_3 = text_pointer:new_from_component(
						"gods_and_favor_text_pointer_3",
						"bottom",
						100,
						uic_hecatomb_button,
						0.5,
						0
					)
					tour_gods_and_favor:register_text_pointer(gods_and_favor_text_pointer_3)
					gods_and_favor_text_pointer_3:add_component_text("text", divine_will_text)
					gods_and_favor_text_pointer_3:set_style("semitransparent")
					gods_and_favor_text_pointer_3:set_topmost(true)
					gods_and_favor_text_pointer_3:set_close_button_callback(
						function()
							if
								uic_hecatomb_button:CurrentState() == "active" then
								uic_hecatomb_button:SimulateLClick()
								core:hide_fullscreen_highlight()
								tour_gods_and_favor:start("show_fourth_text_pointer")
							else
								core:hide_fullscreen_highlight()
								tour_gods_and_favor:start("show_fifth_text_pointer")
							end 
						end)
					gods_and_favor_text_pointer_3:set_highlight_close_button(2)
					gods_and_favor_text_pointer_3:show()
				end,
				0,
				"show_third_text_pointer"
			)

			tour_gods_and_favor:action(
				function()
					local uic_hecatomb_prompt = find_uicomponent(core:get_ui_root(), "gods_and_favor_hecatomb_dialogue_box")
					local uic_hecatomb_button_cancel = find_uicomponent(core:get_ui_root(), "gods_and_favor_hecatomb_dialogue_box", "both_group", "button_cancel")

					if tour_gods_and_favor:complete_if_uicomponent_obj_is_invalid(uic_hecatomb_prompt) then
						return
					end

					uic_hecatomb_prompt:StealShortcutKey(false)
					tour_gods_and_favor:add_skip_action(function()
						uic_hecatomb_prompt:Destroy()
					end, "tour_gods_and_favor_skip_4th_action")

					core:hide_fullscreen_highlight()
					core:show_fullscreen_highlight_around_components(0, false, false, uic_hecatomb_prompt)

					local gods_and_favor_text_pointer_4 = text_pointer:new_from_component(
						"gods_and_favor_text_pointer_4",
						"bottom",
						100,
						uic_hecatomb_prompt,
						0.5,
						0
					)

					tour_gods_and_favor:register_text_pointer(gods_and_favor_text_pointer_4)
					gods_and_favor_text_pointer_4:add_component_text("text", "ui_text_replacements_localised_text_troy_st_divine_will_4")
					gods_and_favor_text_pointer_4:set_style("semitransparent")
					gods_and_favor_text_pointer_4:set_topmost(true)
					gods_and_favor_text_pointer_4:set_close_button_callback(
						function()
							if  uic_hecatomb_button_cancel:CurrentState() == "active" then
								uic_hecatomb_button_cancel:SimulateLClick()
							end
							core:hide_fullscreen_highlight()
							tour_gods_and_favor:start("show_fifth_text_pointer")
						end)
					gods_and_favor_text_pointer_4:set_highlight_close_button(2)
					gods_and_favor_text_pointer_4:show()

				end,
				0,
				"show_fourth_text_pointer"
			)

			local uic_athena_name_plate = find_uicomponent(core:get_ui_root(),"gods_and_favor", "gods_list", "overview_god_card_athena", "name_plate")
			local uic_athena = nil

			tour_gods_and_favor:action(
				function()
					local uic_athena_check_1 = find_uicomponent(core:get_ui_root(),"gods_and_favor", "gods_list", "overview_god_card_athena", "portrait_tiers", "portrait_tier_1")
					local uic_athena_check_2 = find_uicomponent(core:get_ui_root(),"gods_and_favor", "gods_list", "overview_god_card_athena", "portrait_tiers", "portrait_tier_2")
					local uic_athena_check_3 = find_uicomponent(core:get_ui_root(),"gods_and_favor", "gods_list", "overview_god_card_athena", "portrait_tiers", "portrait_tier_3")

					if uic_athena_check_1:Visible() then
						uic_athena = uic_athena_check_1
					elseif uic_athena_check_2:Visible() then
						uic_athena = uic_athena_check_2
					elseif uic_athena_check_3:Visible() then
						uic_athena = uic_athena_check_3
					else 
						uic_athena = uic_athena_name_plate
					end

					if tour_gods_and_favor:complete_if_uicomponent_obj_is_invalid(uic_athena) then
						return
					end

					core:hide_fullscreen_highlight()
					core:show_fullscreen_highlight_around_components(6, false, false, uic_athena)

					local gods_and_favor_text_pointer_5 = text_pointer:new_from_component(
						"gods_and_favor_text_pointer_5",
						"right",
						100,
						uic_athena,
						0,
						0.5
					)
					tour_gods_and_favor:register_text_pointer(gods_and_favor_text_pointer_5)
					gods_and_favor_text_pointer_5:add_component_text("text", "ui_text_replacements_localised_text_troy_st_divine_will_5")
					gods_and_favor_text_pointer_5:set_style("semitransparent")
					gods_and_favor_text_pointer_5:set_topmost(true)
					gods_and_favor_text_pointer_5:set_close_button_callback(
						function()
							if uic_athena_name_plate:CurrentState() == "active" then
								uic_athena_name_plate:SimulateLClick()
							end
							core:hide_fullscreen_highlight()
							tour_gods_and_favor:start("show_sixth_text_pointer")
						end)
					gods_and_favor_text_pointer_5:set_highlight_close_button(2)
					gods_and_favor_text_pointer_5:show()
				end,
				0,
				"show_fifth_text_pointer"
			)

			local uic_prayer_button = find_uicomponent(core:get_ui_root(), "gods_and_favor", "container_hecatomb_prayer", "prayer_holder", "action_button" )
			local prayer_text = nil
			tour_gods_and_favor:action(
				function()
					if tour_gods_and_favor:complete_if_uicomponent_obj_is_invalid(uic_prayer_button) then
						return
					end

					if uic_prayer_button:CurrentState() == "active" then 
						prayer_text = "ui_text_replacements_localised_text_troy_st_divine_will_6"
					else
						prayer_text = "ui_text_replacements_localised_text_troy_st_divine_will_6_1"
					end

					core:hide_fullscreen_highlight()
					core:show_fullscreen_highlight_around_components(0, false, false, uic_prayer_button)

					local gods_and_favor_text_pointer_6 = text_pointer:new_from_component(
						"gods_and_favor_text_pointer_6",
						"bottom",
						100,
						uic_prayer_button,
						0.5,
						0
					)
					tour_gods_and_favor:register_text_pointer(gods_and_favor_text_pointer_6)
					gods_and_favor_text_pointer_6:add_component_text("text", prayer_text)
					gods_and_favor_text_pointer_6:set_style("semitransparent")
					gods_and_favor_text_pointer_6:set_topmost(true)
					gods_and_favor_text_pointer_6:set_close_button_callback(
						function()
							if uic_prayer_button:CurrentState() == "active" then
								uic_prayer_button:SimulateLClick()
								core:hide_fullscreen_highlight()
								tour_gods_and_favor:start("show_seventh_text_pointer")
							else 
								core:hide_fullscreen_highlight()
								tour_gods_and_favor:complete()
								tour_gods_and_favor = nil
							end
						end
					)
					gods_and_favor_text_pointer_6:set_highlight_close_button(2)
					gods_and_favor_text_pointer_6:show()
				end,
				0,
				"show_sixth_text_pointer"
			)

			tour_gods_and_favor:action(
				function()
					local uic_prayer_prompt = find_uicomponent(core:get_ui_root(), "gods_and_favor_prayer_dialogue_box")
					local uic_prayer_close_button = find_uicomponent(core:get_ui_root(), "gods_and_favor_prayer_dialogue_box", "both_group", "button_cancel")
					
					if tour_gods_and_favor:complete_if_uicomponent_obj_is_invalid(uic_prayer_prompt) then
						return
					end

					uic_prayer_prompt:StealShortcutKey(false)
					tour_gods_and_favor:add_skip_action(function()
						uic_prayer_prompt:Destroy()
					end, "tour_gods_and_favor_skip_7th_action")
					
					core:hide_fullscreen_highlight()
					core:show_fullscreen_highlight_around_components(0, false, false, uic_prayer_prompt)

					local gods_and_favor_text_pointer_7 = text_pointer:new_from_component(
						"gods_and_favor_text_pointer_7",
						"bottom",
						100,
						uic_prayer_prompt,
						0.5,
						0
					)
					tour_gods_and_favor:register_text_pointer(gods_and_favor_text_pointer_7)
					gods_and_favor_text_pointer_7:add_component_text("text", "ui_text_replacements_localised_text_troy_st_divine_will_7")
					gods_and_favor_text_pointer_7:set_style("semitransparent")
					gods_and_favor_text_pointer_7:set_topmost(true)
					gods_and_favor_text_pointer_7:set_close_button_callback(
					function()
						if uic_prayer_close_button:CurrentState() == "active" then
							uic_prayer_close_button:SimulateLClick()
						end
						core:hide_fullscreen_highlight()
						tour_gods_and_favor:complete()
						tour_gods_and_favor = nil
					end)
					gods_and_favor_text_pointer_7:set_highlight_close_button(2)
					gods_and_favor_text_pointer_7:show()

				end,
				0,
				"show_seventh_text_pointer"
			)
			tour_gods_and_favor:start()
	end,
	check = function() return true end,
	menu_check = function() return true end
},
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	button_negotiate = {  -- Diplomacy Offer scripted tour

		exec = function()

			local uic_negotiate_button_press = find_uicomponent(core:get_ui_root(),"diplomacy_dropdown", "button_negotiate")
			local uic_diplomacy_panel = find_uicomponent(core:get_ui_root(),"diplomacy_dropdown")
			local uic_sortable_list = core:get_ui_root():SequentialFind("diplomacy_dropdown", "sortable_list_factions")

			uic_sortable_list:SetInteractive(false)

			local uic_diplomacy_parent = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown" , "faction_panel" , "sortable_list_factions" , "list_clip" , "list_box" )
			local uic_chosen_faction
			local uic_diplomacy_parent_children = uic_diplomacy_parent:ChildCount()
			local uic_curr_suitable_child
			local uic_header = uic_diplomacy_panel:SequentialFind("headers")
			local uic_header_position_x, uic_header_position_y = uic_header:Position()
			local uic_header_height = uic_header:Height()
			for i = 0, uic_diplomacy_parent_children - 1 do
				local curr_child = UIComponent(uic_diplomacy_parent:Find(i))
				if curr_child then
					-- Check if we're sorted by subculture and if so, disreguard the subculture component.
					if not string.find(curr_child:Id(), "_sbc_") then
						local curr_child_x, curr_child_y = curr_child:Position()
						if (uic_header_position_y + uic_header_height)  <= curr_child_y then
							if uic_curr_suitable_child then
								local curr_suit_child_x, curr_suit_child_y = uic_curr_suitable_child:Position()
								if curr_child_y <= curr_suit_child_y then
									uic_curr_suitable_child = curr_child
								end
							else
								uic_curr_suitable_child = curr_child
							end
						end
					end
				end
			end

			local should_expand = false
			
			if uic_curr_suitable_child then
				uic_chosen_faction = uic_curr_suitable_child
				if not uic_chosen_faction:Visible() then
					should_expand = true
				end
			end
				
			local tour_diplomacy_offer = scripted_tour:new(
				"scripted_tour_diplomacy_offer",
				function() uic_sortable_list:SetInteractive(true) end
				)
			tour_diplomacy_offer:set_steal_esc_key(true)

			tour_diplomacy_offer:set_should_hide_text_pointers_on_completion(true)
			tour_diplomacy_offer:set_should_dismiss_advice_on_completion(true)
			
			tour_diplomacy_offer:action(

				function()
					if tour_diplomacy_offer:complete_if_uicomponent_obj_is_invalid(uic_chosen_faction) then
						return
					end

					ensure_no_shortcut_weirdness()
					-- Fix issue if the list is sorted by cultures and all of them are collapsed.
					if should_expand then
						UIComponent(uic_diplomacy_parent:Find(0)):SimulateLClick()
					end

					local diplomacy_offer_text_pointer_1 = text_pointer:new_from_component(
						"diplomacy_offer_text_pointer_1",
						"top",
						100,
						uic_chosen_faction,
						0.5,
						1
					)
					tour_diplomacy_offer:register_text_pointer(diplomacy_offer_text_pointer_1)
					diplomacy_offer_text_pointer_1:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_diplomacy_offer_1")
					diplomacy_offer_text_pointer_1:set_style("semitransparent")
					diplomacy_offer_text_pointer_1:set_topmost(true)
					diplomacy_offer_text_pointer_1:set_close_button_callback(
						function()
							uic_sortable_list:SetInteractive(true)
							uic_chosen_faction:SimulateDblLClick()
							tour_diplomacy_offer:start("show_second_text_pointer")
							core:hide_fullscreen_highlight()
						end
					)
					diplomacy_offer_text_pointer_1:set_highlight_close_button(2)
					diplomacy_offer_text_pointer_1:show()
					core:show_fullscreen_highlight_around_components(0, false, false, uic_chosen_faction )
					ensure_no_shortcut_weirdness()
				end,
				0
			)

					
			local uic_available_diplomatic_options = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown" , "bottom_submenu") --"negotiate_submenu"
			local uics_to_highlight = {}
			table.insert(uics_to_highlight,uic_available_diplomatic_options)
			tour_diplomacy_offer:action(
				function()
					if tour_diplomacy_offer:complete_if_uicomponent_obj_is_invalid(uic_available_diplomatic_options) then
						return
					end

					for i=0, uic_available_diplomatic_options:ChildCount() - 1 do
						local to_add = UIComponent(uic_available_diplomatic_options:Find(i))
						if to_add:Find("deal_comparison") then
							table.insert(uics_to_highlight, UIComponent(to_add:Find("deal_comparison")))
						end
					end
					core:show_fullscreen_highlight_around_components(0, false, false, unpack(uics_to_highlight))
					-- core:show_fullscreen_highlight_around_components(10, false, false, uic_available_diplomatic_options)

					local diplomacy_offer_text_pointer_2 = text_pointer:new_from_component(
						"diplomacy_offer_text_pointer_2",
						"bottom",
						100,
						uic_available_diplomatic_options,
						0.5,
						0
					)
					tour_diplomacy_offer:register_text_pointer(diplomacy_offer_text_pointer_2)
					diplomacy_offer_text_pointer_2:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_diplomacy_offer_2")
					diplomacy_offer_text_pointer_2:set_style("semitransparent")
					diplomacy_offer_text_pointer_2:set_topmost(true)
					diplomacy_offer_text_pointer_2:set_close_button_callback(
						function()
							tour_diplomacy_offer:start("show_third_text_pointer")
						end)
					diplomacy_offer_text_pointer_2:set_highlight_close_button(2)
					diplomacy_offer_text_pointer_2:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_second_text_pointer"
			)

			local uic_other_faction_details = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown", "faction_right_status_panel" )
			tour_diplomacy_offer:action(
				function()
					if tour_diplomacy_offer:complete_if_uicomponent_obj_is_invalid(uic_other_faction_details) then
						return
					end

					core:show_fullscreen_highlight_around_components(0, false, false, uic_other_faction_details)

					local diplomacy_offer_text_pointer_3 = text_pointer:new_from_component(
						"diplomacy_offer_text_pointer_3",
						"right",
						100,
						uic_other_faction_details,
						0,
						0.2
					)
					tour_diplomacy_offer:register_text_pointer(diplomacy_offer_text_pointer_3)

					diplomacy_offer_text_pointer_3:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_diplomacy_offer_3")
					diplomacy_offer_text_pointer_3:set_style("semitransparent")
					diplomacy_offer_text_pointer_3:set_topmost(true)
					diplomacy_offer_text_pointer_3:set_close_button_callback(
						function()
							local uic_deal_find = find_uicomponent(core:get_ui_root(),"diplomacy_dropdown" , "bottom_submenu","negotiate_submenu", "diplomatic_deal_holder")
							local uic_deal_select = UIComponent(uic_deal_find:Find(0,true))
							uic_deal_select:SimulateLClick()
							tour_diplomacy_offer:start("show_third_1_text_pointer")
						end)
					diplomacy_offer_text_pointer_3:set_highlight_close_button(2)
					diplomacy_offer_text_pointer_3:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_third_text_pointer"
			)
			local uic_our_offers = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown" , "offers_panel" , "offers_list_panel","your_offers")
			local uic_their_offers = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown" , "offers_panel" , "offers_list_panel","their_offers")
			local uic_common_offers = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown" , "offers_panel" , "offers_list_panel","common_offers")
			--[[
			tour_diplomacy_offer:action(
				function()
					local uic_diplomacy_balance_of_power = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown" , "offers_panel", "strength_balance_bar" )
					
					if tour_diplomacy_offer:complete_if_uicomponent_obj_is_invalid(uic_diplomacy_balance_of_power) then
						return
					end
					
					core:show_fullscreen_highlight_around_components(0, false, false, uic_diplomacy_balance_of_power)

					local diplomacy_offer_text_pointer_4 = text_pointer:new_from_component(
						"diplomacy_offer_text_pointer_4",
						"bottom",
						100,
						uic_diplomacy_balance_of_power,
						0.5,
						0
					)
					tour_diplomacy_offer:register_text_pointer(diplomacy_offer_text_pointer_4)
					diplomacy_offer_text_pointer_4:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_diplomacy_offer_4")
					diplomacy_offer_text_pointer_4:set_style("semitransparent")
					diplomacy_offer_text_pointer_4:set_topmost(true)
					diplomacy_offer_text_pointer_4:set_close_button_callback(
						function()
							local uic_deal_find = find_uicomponent(core:get_ui_root(),"diplomacy_dropdown" , "bottom_submenu","negotiate_submenu")
							local uic_deal_select = UIComponent(uic_deal_find:Find(0,true))
							uic_deal_select:SimulateLClick()
							tour_diplomacy_offer:start("show_fifth_text_pointer")
						end)
					diplomacy_offer_text_pointer_4:set_highlight_close_button(2)
					diplomacy_offer_text_pointer_4:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_fourth_text_pointer"
			)
			]]
			tour_diplomacy_offer:action(
				function()
					if tour_diplomacy_offer:complete_if_uicomponent_obj_is_invalid(uic_common_offers) then
						return
					end

					core:show_fullscreen_highlight_around_components(0, false, false, uic_our_offers, uic_their_offers, uic_common_offers)

					local diplomacy_offer_text_pointer_3_1 = text_pointer:new_from_component(
						"diplomacy_offer_text_pointer_3_1",
						"bottom",
						100,
						uic_common_offers,
						0.5,
						0
					)
					tour_diplomacy_offer:register_text_pointer(diplomacy_offer_text_pointer_3_1)

					diplomacy_offer_text_pointer_3_1:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_diplomacy_offer_3_1")
					diplomacy_offer_text_pointer_3_1:set_style("semitransparent")
					diplomacy_offer_text_pointer_3_1:set_topmost(true)
					diplomacy_offer_text_pointer_3_1:set_close_button_callback(
						function()
							tour_diplomacy_offer:start("show_fourth_text_pointer")
						end)
					diplomacy_offer_text_pointer_3_1:set_highlight_close_button(2)
					diplomacy_offer_text_pointer_3_1:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_third_1_text_pointer"
			)

			tour_diplomacy_offer:action(
				function()
					if tour_diplomacy_offer:complete_if_uicomponent_obj_is_invalid(uic_common_offers) then
						return
					end

					core:show_fullscreen_highlight_around_components(0, false, false, uic_common_offers)
					local diplomacy_offer_text_pointer_6_1 = text_pointer:new_from_component(
						"diplomacy_offer_text_pointer_6_1",
						"bottom",
						100,
						uic_common_offers,
						0.5,
						0
					)
					tour_diplomacy_offer:register_text_pointer(diplomacy_offer_text_pointer_6_1)

					diplomacy_offer_text_pointer_6_1:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_diplomacy_offer_4")
					diplomacy_offer_text_pointer_6_1:set_style("semitransparent")
					diplomacy_offer_text_pointer_6_1:set_topmost(true)
					diplomacy_offer_text_pointer_6_1:set_close_button_callback(
						function()
							tour_diplomacy_offer:start("show_fifth_text_pointer")
						end)
					diplomacy_offer_text_pointer_6_1:set_highlight_close_button(2)
					diplomacy_offer_text_pointer_6_1:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_fourth_text_pointer"
			)

			tour_diplomacy_offer:action(
				function()
					if tour_diplomacy_offer:complete_if_uicomponent_obj_is_invalid(uic_our_offers) then
						return
					end

					core:show_fullscreen_highlight_around_components(0, false, false, uic_our_offers)
					local diplomacy_offer_text_pointer_5 = text_pointer:new_from_component(
						"diplomacy_offer_text_pointer_5",
						"bottom",
						100,
						uic_our_offers,
						0.5,
						0
					)
					tour_diplomacy_offer:register_text_pointer(diplomacy_offer_text_pointer_5)
					diplomacy_offer_text_pointer_5:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_diplomacy_offer_5")
					diplomacy_offer_text_pointer_5:set_style("semitransparent")
					diplomacy_offer_text_pointer_5:set_topmost(true)
					diplomacy_offer_text_pointer_5:set_close_button_callback(
						function()
							tour_diplomacy_offer:start("show_sixth_text_pointer")
						end)
					diplomacy_offer_text_pointer_5:set_highlight_close_button(2)
					diplomacy_offer_text_pointer_5:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_fifth_text_pointer"
			)
			tour_diplomacy_offer:action(
				function()
					if tour_diplomacy_offer:complete_if_uicomponent_obj_is_invalid(uic_their_offers) then
						return
					end

					core:show_fullscreen_highlight_around_components(0, false, false, uic_their_offers)
					local diplomacy_offer_text_pointer_6 = text_pointer:new_from_component(
						"diplomacy_offer_text_pointer_6",
						"bottom",
						100,
						uic_their_offers,
						0.5,
						0
					)
					tour_diplomacy_offer:register_text_pointer(diplomacy_offer_text_pointer_6)

					diplomacy_offer_text_pointer_6:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_diplomacy_offer_6")
					diplomacy_offer_text_pointer_6:set_style("semitransparent")
					diplomacy_offer_text_pointer_6:set_topmost(true)
					diplomacy_offer_text_pointer_6:set_close_button_callback(
						function()
							tour_diplomacy_offer:start("show_seventh_text_pointer")
						end)
					diplomacy_offer_text_pointer_6:set_highlight_close_button(2)
					diplomacy_offer_text_pointer_6:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_sixth_text_pointer"
			)
			
			
			local uic_diplomatic_attitude = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown", "offers_panel", "offers_list_panel", "offers_list_panel", "offers_submenu", "success_value")
			tour_diplomacy_offer:action(
				function()
					local uic_diplomatic_treaties = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown" , "offers_panel" , "offers_list_panel","current_treaties")
					
					if tour_diplomacy_offer:complete_if_uicomponent_obj_is_invalid(uic_diplomatic_treaties) then
						return
					end

					core:show_fullscreen_highlight_around_components(0, false, false, uic_diplomatic_treaties)
					local diplomacy_offer_text_pointer_7 = text_pointer:new_from_component(
						"diplomacy_offer_text_pointer_7",
						"bottom",
						100,
						uic_diplomatic_treaties,
						0.5,
						0
					)
					tour_diplomacy_offer:register_text_pointer(diplomacy_offer_text_pointer_7)

					diplomacy_offer_text_pointer_7:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_diplomacy_offer_7")
					diplomacy_offer_text_pointer_7:set_style("semitransparent")
					diplomacy_offer_text_pointer_7:set_topmost(true)
					diplomacy_offer_text_pointer_7:set_close_button_callback(
						function()
							if uic_diplomatic_attitude:VisibleFromRoot() then
								tour_diplomacy_offer:start("show_eigth_text_pointer")
							else
								tour_diplomacy_offer:start("show_ninth_text_pointer")
							end								
						end)
					diplomacy_offer_text_pointer_7:set_highlight_close_button(2)
					diplomacy_offer_text_pointer_7:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_seventh_text_pointer"
			)

			
			tour_diplomacy_offer:action(
				function()
					if tour_diplomacy_offer:complete_if_uicomponent_obj_is_invalid(uic_diplomatic_attitude) then
						return
					end

					core:show_fullscreen_highlight_around_components(0, false, false, uic_diplomatic_attitude)

					local diplomacy_offer_text_pointer_8 = text_pointer:new_from_component(
						"diplomacy_offer_text_pointer_8",
						"bottom",
						100,
						uic_diplomatic_attitude,
						0.5,
						0
					)
					tour_diplomacy_offer:register_text_pointer(diplomacy_offer_text_pointer_8)

					diplomacy_offer_text_pointer_8:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_diplomacy_offer_8")
					diplomacy_offer_text_pointer_8:set_style("semitransparent")
					diplomacy_offer_text_pointer_8:set_topmost(true)
					diplomacy_offer_text_pointer_8:set_close_button_callback(
						function()
							tour_diplomacy_offer:start("show_ninth_text_pointer")
						end)
						diplomacy_offer_text_pointer_8:set_highlight_close_button(2)
						diplomacy_offer_text_pointer_8:show()
						ensure_no_shortcut_weirdness()
				end,
				0,
				"show_eigth_text_pointer"
			)

			tour_diplomacy_offer:action(
				function()
					local uic_button_decline = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown", "offers_panel", "offers_list_panel", "offers_submenu", "offers_buttons_list_1", "button_decline")
					
					if tour_diplomacy_offer:complete_if_uicomponent_obj_is_invalid(uic_button_decline) then
						return
					end
					
					core:show_fullscreen_highlight_around_components(0, false, false, uic_button_decline)

					local diplomacy_offer_text_pointer_9 = text_pointer:new_from_component(
						"diplomacy_offer_text_pointer_9",
						"bottom",
						100,
						uic_button_decline,
						0.5,
						0
					)
					tour_diplomacy_offer:register_text_pointer(diplomacy_offer_text_pointer_9)

					diplomacy_offer_text_pointer_9:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_diplomacy_offer_9")
					diplomacy_offer_text_pointer_9:set_style("semitransparent")
					diplomacy_offer_text_pointer_9:set_topmost(true)
					diplomacy_offer_text_pointer_9:set_close_button_callback(
						function()
							local uic_button_agree_check = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown", "offers_panel", "offers_list_panel", "offers_submenu", "offers_buttons_list_1", "button_agree")
							if uic_button_agree_check:Visible() == false then
								tour_diplomacy_offer:start("show_eleventh_text_pointer")
							else
								tour_diplomacy_offer:start("show_tenth_text_pointer")
							end
						end)
					diplomacy_offer_text_pointer_9:set_highlight_close_button(2)
					diplomacy_offer_text_pointer_9:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_ninth_text_pointer"
			)
			tour_diplomacy_offer:action(
				function()
					local uic_button_agree = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown", "offers_panel", "offers_list_panel", "offers_submenu", "offers_buttons_list_1", "button_agree")
					
					if tour_diplomacy_offer:complete_if_uicomponent_obj_is_invalid(uic_button_agree) then
						return
					end

					core:show_fullscreen_highlight_around_components(0, false, false, uic_button_agree)

					local diplomacy_offer_text_pointer_10 = text_pointer:new_from_component(
						"diplomacy_offer_text_pointer_10",
						"bottom",
						100,
						uic_button_agree,
						0.5,
						0
					)
					tour_diplomacy_offer:register_text_pointer(diplomacy_offer_text_pointer_10)

					diplomacy_offer_text_pointer_10:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_diplomacy_offer_10")
					diplomacy_offer_text_pointer_10:set_style("semitransparent")
					diplomacy_offer_text_pointer_10:set_topmost(true)
					diplomacy_offer_text_pointer_10:set_close_button_callback(
						function()
							tour_diplomacy_offer:start("show_twelfth_text_pointer")
						end)
					diplomacy_offer_text_pointer_10:set_highlight_close_button(2)
					diplomacy_offer_text_pointer_10:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_tenth_text_pointer"
			)

			tour_diplomacy_offer:action(
				function()
					local uic_button_makeitwork = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown", "offers_panel", "offers_list_panel", "offers_submenu", "offers_buttons_list_1", "button_makeitwork")
					
					if tour_diplomacy_offer:complete_if_uicomponent_obj_is_invalid(uic_button_makeitwork) then
						return
					end

					core:show_fullscreen_highlight_around_components(0, false, false, uic_button_makeitwork)

					local diplomacy_offer_text_pointer_11 = text_pointer:new_from_component(
						"diplomacy_offer_text_pointer_11",
						"bottom",
						100,
						uic_button_makeitwork,
						0.5,
						0
					)
					tour_diplomacy_offer:register_text_pointer(diplomacy_offer_text_pointer_11)

					diplomacy_offer_text_pointer_11:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_diplomacy_offer_11")
					diplomacy_offer_text_pointer_11:set_style("semitransparent")
					diplomacy_offer_text_pointer_11:set_topmost(true)
					diplomacy_offer_text_pointer_11:set_close_button_callback(
						function()
							tour_diplomacy_offer:start("show_twelfth_text_pointer")
						end)
					diplomacy_offer_text_pointer_11:set_highlight_close_button(2)
					diplomacy_offer_text_pointer_11:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_eleventh_text_pointer"
			)
			local uic_button_counter_offer = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown", "offers_panel", "offers_list_panel", "offers_submenu", "offers_buttons_list_1", "button_counter_offer")
			tour_diplomacy_offer:action(
				function()
					local uic_button_ultimatum = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown", "offers_panel", "offers_list_panel", "offers_submenu", "offers_buttons_list_1", "button_ultimatum")
					
					if tour_diplomacy_offer:complete_if_uicomponent_obj_is_invalid(uic_button_ultimatum) then
						return
					end
					
					core:show_fullscreen_highlight_around_components(0, false, false, uic_button_ultimatum)

					local diplomacy_offer_text_pointer_12 = text_pointer:new_from_component(
						"diplomacy_offer_text_pointer_12",
						"bottom",
						100,
						uic_button_ultimatum,
						0.5,
						0
					)
					tour_diplomacy_offer:register_text_pointer(diplomacy_offer_text_pointer_12)

					diplomacy_offer_text_pointer_12:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_diplomacy_offer_12")
					diplomacy_offer_text_pointer_12:set_style("semitransparent")
					diplomacy_offer_text_pointer_12:set_topmost(true)
					diplomacy_offer_text_pointer_12:set_close_button_callback(
						function()
							if uic_button_counter_offer:VisibleFromRoot() then
								tour_diplomacy_offer:start("show_thirdtheenth_text_pointer")
							else
								core:hide_fullscreen_highlight()
								core:remove_listener("tour_diplomacy_offer_panel_closed_listener")
								tour_diplomacy_offer:complete()
							end
						end)
					diplomacy_offer_text_pointer_12:set_highlight_close_button(2)
					diplomacy_offer_text_pointer_12:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_twelfth_text_pointer"
			)
			tour_diplomacy_offer:action(
				function()
					if tour_diplomacy_offer:complete_if_uicomponent_obj_is_invalid(uic_button_counter_offer) then
						return
					end

					core:show_fullscreen_highlight_around_components(0, false, false, uic_button_counter_offer)

					local diplomacy_offer_text_pointer_13 = text_pointer:new_from_component(
						"diplomacy_offer_text_pointer_13",
						"bottom",
						100,
						uic_button_counter_offer,
						0.5,
						0
					)
					tour_diplomacy_offer:register_text_pointer(diplomacy_offer_text_pointer_13)

					diplomacy_offer_text_pointer_13:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_diplomacy_offer_13")
					diplomacy_offer_text_pointer_13:set_style("semitransparent")
					diplomacy_offer_text_pointer_13:set_topmost(true)
					diplomacy_offer_text_pointer_13:set_close_button_callback(
						function()
							core:hide_fullscreen_highlight()
							core:remove_listener("tour_diplomacy_offer_panel_closed_listener")
							tour_diplomacy_offer:complete()
						end)
					diplomacy_offer_text_pointer_13:set_highlight_close_button(2)
					diplomacy_offer_text_pointer_13:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_thirdtheenth_text_pointer"
			)

			tour_diplomacy_offer:start()

			core:add_listener(
				"tour_diplomacy_offer_panel_closed_listener",
				"PanelClosedCampaign", 
				function(context) return context.string == "diplomacy_dropdown" end,
				function(context) 
					if tour_diplomacy_offer then
						tour_diplomacy_offer:complete()
						core:remove_listener("tour_diplomacy_offer_panel_closed_listener")
					end
				end, 
				true
			)

		end,
		check = function()
			local speach_check = find_uicomponent(core:get_ui_root(),"diplomacy_dropdown", "faction_right_status_panel", "portrait_part", "speech_bubble")
			local desired_filter_check = find_uicomponent(core:get_ui_root(),"diplomacy_dropdown", "bottom_submenu", "resource_filter", "most_desired_resource_dropdown", "most_desired_resource_dropdown_button", "popup_menu", "popup_list", "option0")
			local least_desired_filter_check = find_uicomponent(core:get_ui_root(),"diplomacy_dropdown", "bottom_submenu", "resource_filter", "least_desired_resource_dropdown", "least_desired_resource_dropdown_button", "popup_menu", "popup_list", "option0")
			
			return (not speach_check or not speach_check:Visible()) --and desired_filter_check:CurrentState() == "selected" and least_desired_filter_check:CurrentState() == "selected"
		end,
		menu_check = function() return true end,
		tooltip_ref = function() return "random_localisation_strings_string_scripted_tour_tooltip_diplomacy_tour_unavailable" end,
	},
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	panel_header = {	-- Diplomacy Overview scripted tour

		exec = function()
			local uic_diplomacy_panel = find_uicomponent(core:get_ui_root(),"diplomacy_dropdown")

			local uic_own_faction = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown" , "faction_left_status_panel")
			local uic_own_faction2 = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown" , "faction_left_status_panel", "model_parent", "3D_window")
			local tour_diplomacy_overview = scripted_tour:new(
				"scripted_tour_diplomacy_overview",
				function() end
			)
			core:show_fullscreen_highlight_around_components(0, false, false, uic_own_faction, uic_own_faction2 )
			tour_diplomacy_overview:set_steal_esc_key(true)
			tour_diplomacy_overview:set_should_hide_text_pointers_on_completion(true)
			tour_diplomacy_overview:set_should_dismiss_advice_on_completion(true)

			tour_diplomacy_overview:action(
				function()
					if tour_diplomacy_overview:complete_if_uicomponent_obj_is_invalid(uic_own_faction) then
						return
					end

					local diplomacy_overview_text_pointer_1 = text_pointer:new_from_component(
						"diplomacy_overview_text_pointer_1",
						"left",
						100,
						uic_own_faction,
						1,
						0.2
					)
					tour_diplomacy_overview:register_text_pointer(diplomacy_overview_text_pointer_1)

					diplomacy_overview_text_pointer_1:add_component_text("text", "ui_text_replacements_localised_text_troy_st_diplomacy_overview_1")
					diplomacy_overview_text_pointer_1:set_style("semitransparent")
					diplomacy_overview_text_pointer_1:set_topmost(true)
					diplomacy_overview_text_pointer_1:set_close_button_callback(
						function()
							tour_diplomacy_overview:start("show_second_text_pointer")
						end
					)
					diplomacy_overview_text_pointer_1:set_highlight_close_button(2)
					diplomacy_overview_text_pointer_1:show()
					ensure_no_shortcut_weirdness()
				end,
				0
			)

			local uic_other_faction = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown" , "faction_right_status_panel" , "panel_content_list")
			local uic_other_faction2 = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown" , "faction_right_status_panel" , "model_parent", "3D_window")
			tour_diplomacy_overview:action(
				function()
					if tour_diplomacy_overview:complete_if_uicomponent_obj_is_invalid(uic_other_faction) then
						return
					end

					core:show_fullscreen_highlight_around_components(0, false, false, uic_other_faction, uic_other_faction2)

					local diplomacy_overview_text_pointer_2 = text_pointer:new_from_component(
						"diplomacy_overview_text_pointer_2",
						"right",
						100,
						uic_other_faction,
						0,
						0.2
					)
					tour_diplomacy_overview:register_text_pointer(diplomacy_overview_text_pointer_2)

					diplomacy_overview_text_pointer_2:add_component_text("text", "ui_text_replacements_localised_text_troy_st_diplomacy_overview_2")
					diplomacy_overview_text_pointer_2:set_style("semitransparent")
					diplomacy_overview_text_pointer_2:set_topmost(true)
					diplomacy_overview_text_pointer_2:set_close_button_callback(
						function()
							tour_diplomacy_overview:start("show_third_text_pointer")
						end)
						diplomacy_overview_text_pointer_2:set_highlight_close_button(2)
						diplomacy_overview_text_pointer_2:show()
						ensure_no_shortcut_weirdness()
				end,
				0,
				"show_second_text_pointer"
			)

			local uic_overlay_options = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown", "overlay_bar_holder", "diplomacy_hud_overlays", "overlay_bar")
			local uic_overlay_keys = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown", "overlay_bar_holder", "diplomacy_hud_overlays", "overlay_keys")
			tour_diplomacy_overview:action(
				function()
					if tour_diplomacy_overview:complete_if_uicomponent_obj_is_invalid(uic_overlay_options) then
						return
					end

					core:show_fullscreen_highlight_around_components(0, false, false, uic_overlay_options, uic_overlay_keys)

					local diplomacy_overview_text_pointer_3 = text_pointer:new_from_component(
						"diplomacy_overview_text_pointer_3",
						"top",
						100,
						uic_overlay_options,
						0.5,
						1
					)
					tour_diplomacy_overview:register_text_pointer(diplomacy_overview_text_pointer_3)

					diplomacy_overview_text_pointer_3:add_component_text("text", "ui_text_replacements_localised_text_troy_st_diplomacy_overview_3")
					diplomacy_overview_text_pointer_3:set_style("semitransparent")
					diplomacy_overview_text_pointer_3:set_topmost(true)
					diplomacy_overview_text_pointer_3:set_close_button_callback(
						function()
							tour_diplomacy_overview:start("show_fourth_text_pointer")
						end)
						diplomacy_overview_text_pointer_3:set_highlight_close_button(2)
						diplomacy_overview_text_pointer_3:show()
						ensure_no_shortcut_weirdness()
				end,
				0,
				"show_third_text_pointer"
			)

			local uic_faction_list = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown" , "faction_panel" )
			tour_diplomacy_overview:action(
				function()
					if tour_diplomacy_overview:complete_if_uicomponent_obj_is_invalid(uic_faction_list) then
						return
					end

					core:show_fullscreen_highlight_around_components(0, false, false, uic_faction_list)

					local diplomacy_overview_text_pointer_4 = text_pointer:new_from_component(
						"diplomacy_overview_text_pointer_4",
						"bottom",
						100,
						uic_faction_list,
						0.5,
						0
					)
					tour_diplomacy_overview:register_text_pointer(diplomacy_overview_text_pointer_4)

					diplomacy_overview_text_pointer_4:add_component_text("text", "ui_text_replacements_localised_text_troy_st_diplomacy_overview_4")
					diplomacy_overview_text_pointer_4:set_style("semitransparent")
					diplomacy_overview_text_pointer_4:set_topmost(true)
					diplomacy_overview_text_pointer_4:set_close_button_callback(
						function()
							core:hide_fullscreen_highlight()
							core:remove_listener("tour_diplomacy_overview_panel_closed_listener")
							tour_diplomacy_overview:complete()
						end)
						diplomacy_overview_text_pointer_4:set_highlight_close_button(2)
						diplomacy_overview_text_pointer_4:show()
						ensure_no_shortcut_weirdness()
				end,
				0,
				"show_fourth_text_pointer"
			)

			tour_diplomacy_overview:start()

			core:add_listener(
				"tour_diplomacy_overview_panel_closed_listener",
				"PanelClosedCampaign", 
				function(context) return context.string == "diplomacy_dropdown" end,
				function(context) 
					if tour_diplomacy_overview then
						tour_diplomacy_overview:complete()
						core:remove_listener("tour_diplomacy_overview_panel_closed_listener")
					end
				end, 
				true
			)

		end,
		check = function() return true end,
		menu_check = function() return true end
	},
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	quick_deal_submenu = {	-- Diplomacy Quick deal scripted tour
		exec = function()
			local uic_quick_deal_menu = find_uicomponent(core:get_ui_root(),"diplomacy_dropdown", "bottom_submenu", "quick_deal_submenu_holder", "quick_deal_submenu")
			local uic_sortable_list = core:get_ui_root():SequentialFind("diplomacy_dropdown", "sortable_list_factions")

			uic_sortable_list:SetInteractive(false)

			local tour_quick_deal = scripted_tour:new(
				"scripted_tour_quick_deal",
				function() uic_sortable_list:SetInteractive(true) end
			)
			tour_quick_deal:set_steal_esc_key(true)
			tour_quick_deal:set_should_hide_text_pointers_on_completion(true)
			tour_quick_deal:set_should_dismiss_advice_on_completion(true)

			tour_quick_deal:action(
				function()
					if tour_quick_deal:complete_if_uicomponent_obj_is_invalid(uic_quick_deal_menu) then
						return
					end

					core:show_fullscreen_highlight_around_components(25, nil, false, uic_quick_deal_menu)
					local quick_deal_text_pointer_1 = text_pointer:new_from_component(
						"quick_deal_text_pointer_1",
						"bottom",
						100,
						uic_quick_deal_menu,
						0.5,
						0
					)
					tour_quick_deal:register_text_pointer(quick_deal_text_pointer_1)

					quick_deal_text_pointer_1:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_diplomacy_quickdeal_1")
					quick_deal_text_pointer_1:set_style("semitransparent")
					quick_deal_text_pointer_1:set_topmost(true)
					quick_deal_text_pointer_1:set_close_button_callback(
						function()
							local uic_quick_select = UIComponent(uic_quick_deal_menu:Find(0,true))
							uic_quick_select:SimulateLClick()
							tour_quick_deal:start("show_third_text_pointer")
						end
					)
					quick_deal_text_pointer_1:set_highlight_close_button(2)
					quick_deal_text_pointer_1:show()
					ensure_no_shortcut_weirdness()

				end,
				0
			)
			local uic_quick_deal_options = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown" , "bottom_submenu")
			--[[
			tour_quick_deal:action(
				function()
					if tour_quick_deal:complete_if_uicomponent_obj_is_invalid(uic_quick_deal_options) then
						return
					end

					core:show_fullscreen_highlight_around_components(0, false, false, uic_quick_deal_options)

					local quick_deal_text_pointer_2 = text_pointer:new_from_component(
						"quick_deal_text_pointer_2",
						"bottom",
						100,
						uic_quick_deal_options,
						0.5,
						0
					)
					tour_quick_deal:register_text_pointer(quick_deal_text_pointer_2)

					quick_deal_text_pointer_2:add_component_text("text", "ui_text_replacements_localised_text_troy_st_diplomacy_quickdeal_2")
					quick_deal_text_pointer_2:set_style("semitransparent")
					quick_deal_text_pointer_2:set_topmost(true)
					quick_deal_text_pointer_2:set_close_button_callback(
						function()
						local uic_quick_find = find_uicomponent(core:get_ui_root(),"diplomacy_dropdown" , "bottom_submenu","quick_deal_submenu")
						local uic_quick_select = UIComponent(uic_quick_find:Find(0,true))
						uic_quick_select:SimulateLClick()
						tour_quick_deal:start("show_third_text_pointer")
					end)
					quick_deal_text_pointer_2:set_highlight_close_button(2)
					quick_deal_text_pointer_2:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_second_text_pointer"
			)
			]]
			local uic_factions_quick = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown" , "faction_panel" , "sortable_list_factions")
			tour_quick_deal:action(
				function()
					if tour_quick_deal:complete_if_uicomponent_obj_is_invalid(uic_factions_quick) then
						return
					end

					core:show_fullscreen_highlight_around_components(0, false, false, uic_factions_quick)

					local quick_deal_text_pointer_3 = text_pointer:new_from_component(
						"quick_deal_text_pointer_3",
						"bottom",
						100,
						uic_factions_quick,
						0.5,
						0
					)
					tour_quick_deal:register_text_pointer(quick_deal_text_pointer_3)

					quick_deal_text_pointer_3:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_diplomacy_quickdeal_2")
					quick_deal_text_pointer_3:set_style("semitransparent")
					quick_deal_text_pointer_3:set_topmost(true)
					quick_deal_text_pointer_3:set_close_button_callback(
					function()
						local uic_diplomacy_parent = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown" , "faction_panel" , "sortable_list_factions" , "list_clip" , "list_box" )
						local uic_diplomacy_child_num = uic_diplomacy_parent:ChildCount()
						for i = 0, uic_diplomacy_child_num - 1 do
							if UIComponent(uic_diplomacy_parent:Find(i,true)):VisibleFromRoot() then
								uic_sortable_list:SetInteractive(true)
								local uic_diplomacy_child = UIComponent(uic_diplomacy_parent:Find(i,true))
								uic_diplomacy_child:SimulateDblLClick()
								break
							end
						end
						tour_quick_deal:start("show_forth_text_pointer")
					end)
					quick_deal_text_pointer_3:set_highlight_close_button(2)
					quick_deal_text_pointer_3:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_third_text_pointer"
			)
			tour_quick_deal:action(
				function()
					local uic_selected_deal = find_uicomponent(core:get_ui_root(),"diplomacy_dropdown", "offers_panel", "offers_list_panel")
					
					if tour_quick_deal:complete_if_uicomponent_obj_is_invalid(uic_selected_deal) then
						return
					end

					core:show_fullscreen_highlight_around_components(0, false, false, uic_selected_deal)

					local quick_deal_text_pointer_4 = text_pointer:new_from_component(
						"quick_deal_text_pointer_4",
						"bottom",
						100,
						uic_selected_deal,
						0.5,
						0
					)
					tour_quick_deal:register_text_pointer(quick_deal_text_pointer_4)
					quick_deal_text_pointer_4:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_diplomacy_quickdeal_3")
					quick_deal_text_pointer_4:set_style("semitransparent")
					quick_deal_text_pointer_4:set_topmost(true)
					quick_deal_text_pointer_4:set_highlight_close_button(2)
					quick_deal_text_pointer_4:set_close_button_callback(
						function()
							core:hide_fullscreen_highlight()
							core:remove_listener("tour_quick_deal_panel_closed_listener")
							tour_quick_deal:complete()
						end)
					quick_deal_text_pointer_4:show()
					ensure_no_shortcut_weirdness()
					end,
					0,
				"show_forth_text_pointer"
			)


			tour_quick_deal:start()

			core:add_listener(
				"tour_quick_deal_panel_closed_listener",
				"PanelClosedCampaign", 
				function(context) return context.string == "diplomacy_dropdown" end,
				function(context) 
					if tour_quick_deal then
						tour_quick_deal:complete()
						core:remove_listener("tour_quick_deal_panel_closed_listener")
					end
				end, 
				true
			)

			end,

		check = function()
			local speach_check_2 = find_uicomponent(core:get_ui_root(),"diplomacy_dropdown", "faction_right_status_panel", "portrait_part", "speech_bubble")
			local desired_filter_check = find_uicomponent(core:get_ui_root(),"diplomacy_dropdown", "bottom_submenu", "resource_filter", "most_desired_resource_dropdown", "most_desired_resource_dropdown_button", "popup_menu", "popup_list", "option0")
			local least_desired_filter_check = find_uicomponent(core:get_ui_root(),"diplomacy_dropdown", "bottom_submenu", "resource_filter", "least_desired_resource_dropdown", "least_desired_resource_dropdown_button", "popup_menu", "popup_list", "option0")
			local diplomacy_list = core:get_ui_root():SequentialFind("diplomacy_dropdown", "faction_panel", "sortable_list_factions", "list_clip", "list_box")
			return (not speach_check_2 or not speach_check_2:Visible()) and diplomacy_list:ChildCount() >= 0
			--and desired_filter_check:CurrentState() == "selected" and least_desired_filter_check:CurrentState() == "selected"
		end,
		menu_check = function() return true end,
		tooltip_ref = function() return "random_localisation_strings_string_scripted_tour_tooltip_diplomacy_tour_unavailable" end,
	},
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	ProvinceInfoPopup = { --Province Information Scripted Tour
		exec = function()
			local h_offset = 0.6
			local uic_province_info_overlay = core:get_ui_root():SequentialFind("province_info_holder")

			local tour_province_info = scripted_tour:new(
				"scripted_tour_province_info",
				function() end
			)
			tour_province_info:set_steal_esc_key(true)
			tour_province_info:set_should_hide_text_pointers_on_completion(true)
			tour_province_info:set_should_dismiss_advice_on_completion(true)

			tour_province_info:action(
				function()
					if tour_province_info:complete_if_uicomponent_obj_is_invalid(uic_province_info_overlay) then
						return
					end

					core:show_fullscreen_highlight_around_components(25, nil, false, uic_province_info_overlay)
					local province_info_text_pointer_1 = text_pointer:new_from_component(
						"province_info_text_pointer_1",
						"bottom",
						100,
						uic_province_info_overlay,
						h_offset,
						0
					)
					tour_province_info:register_text_pointer(province_info_text_pointer_1)

					province_info_text_pointer_1:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_province_info_1")
					province_info_text_pointer_1:set_style("semitransparent")
					province_info_text_pointer_1:set_topmost(true)
					province_info_text_pointer_1:set_close_button_callback(
						function()
							tour_province_info:start("show_second_text_pointer")
						end
					)
					province_info_text_pointer_1:set_highlight_close_button(2)
					province_info_text_pointer_1:show()
					ensure_no_shortcut_weirdness()
				end,
				0
			)

			local uic_header_province = core:get_ui_root():SequentialFind(unpack(province_info_panel_ui_component_path) , "province_details",  "header")
			local uic_public_order = core:get_ui_root():SequentialFind("ProvinceInfoPopup", "panel", "province_info_holder", "province_details_holder", "province_details", "public_order" )
			tour_province_info:action(
				function()
					if tour_province_info:complete_if_uicomponent_obj_is_invalid(uic_public_order) then
						return
					end

					core:show_fullscreen_highlight_around_components(10, false, false, uic_public_order)

					local province_info_text_pointer_2 = text_pointer:new_from_component(
						"province_info_text_pointer_2",
						"bottom",
						50,
						uic_public_order,
						h_offset,
						0
					)
					tour_province_info:register_text_pointer(province_info_text_pointer_2)

					province_info_text_pointer_2:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_province_info_2")
					province_info_text_pointer_2:set_style("semitransparent")
					province_info_text_pointer_2:set_topmost(true)
					province_info_text_pointer_2:set_close_button_callback(
						function()
							tour_province_info:start("show_second_1_text_pointer")
						end
					)
					province_info_text_pointer_2:set_highlight_close_button(2)
					province_info_text_pointer_2:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_second_text_pointer"
			)
	
			local uic_influence = core:get_ui_root():SequentialFind(unpack(province_info_panel_ui_component_path) , "influence")
			tour_province_info:action(
				function()
					if tour_province_info:complete_if_uicomponent_obj_is_invalid(uic_influence) then
						return
					end

					core:show_fullscreen_highlight_around_components(10, false, false, uic_influence)

					local province_info_text_pointer_2_1 = text_pointer:new_from_component(
						"province_info_text_pointer_2_1",
						"bottom",
						50,
						uic_influence,
						h_offset,
						0
					)
					tour_province_info:register_text_pointer(province_info_text_pointer_2_1)

					province_info_text_pointer_2_1:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_province_info_2_1")
					province_info_text_pointer_2_1:set_style("semitransparent")
					province_info_text_pointer_2_1:set_topmost(true)
					province_info_text_pointer_2_1:set_close_button_callback(
						function()
							tour_province_info:start("show_third_text_pointer")
						end
					)
					province_info_text_pointer_2_1:set_highlight_close_button(2)
					province_info_text_pointer_2_1:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_second_1_text_pointer"
			)

			local uic_header_workforce = core:get_ui_root():SequentialFind("ProvinceInfoPopup", "panel", "province_info_holder", "province_details_holder", "province_details", "workforce")
			tour_province_info:action(
				function()
					if tour_province_info:complete_if_uicomponent_obj_is_invalid(uic_header_workforce) then
						return
					end

					core:show_fullscreen_highlight_around_components(10, false, false, uic_header_workforce )

					local province_info_text_pointer_3 = text_pointer:new_from_component(
						"province_info_text_pointer_3",
						"bottom",
						50,
						uic_header_workforce,
						h_offset,
						0
					)
					tour_province_info:register_text_pointer(province_info_text_pointer_3)

					province_info_text_pointer_3:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_province_info_3")
					province_info_text_pointer_3:set_style("semitransparent")
					province_info_text_pointer_3:set_topmost(true)
					province_info_text_pointer_3:set_close_button_callback(
						function()
							tour_province_info:start("show_fourth_text_pointer")
						end
					)
					province_info_text_pointer_3:set_highlight_close_button(2)
					province_info_text_pointer_3:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_third_text_pointer"
			)
			local uic_header_production = core:get_ui_root():SequentialFind(unpack(province_info_panel_ui_component_path) , "production",  "header_production")
			local uic_resources = core:get_ui_root():SequentialFind(unpack(province_info_panel_ui_component_path) , "production",  "resource_container")
			local uic_header_deposits = core:get_ui_root():SequentialFind(unpack(province_info_panel_ui_component_path) , "production",  "header_deposits", "txt_production")
			local uic_deposits_list = core:get_ui_root():SequentialFind(unpack(province_info_panel_ui_component_path) , "production",  "deposits_list")
			local uic_deposits_list = core:get_ui_root():SequentialFind(unpack(province_info_panel_ui_component_path) , "production",  "deposits_list")
			local uic_commandments = core:get_ui_root():SequentialFind(unpack(province_info_panel_ui_component_path) , "stack_incentives")
			local uic_curr_commandment = UIComponent(uic_commandments:Find(1,true))
			tour_province_info:action(
				function()
					if tour_province_info:complete_if_uicomponent_obj_is_invalid(uic_header_production) then
						return
					end

					core:show_fullscreen_highlight_around_components(0, false, false, uic_header_production, uic_resources)

					local province_info_text_pointer_4 = text_pointer:new_from_component(
						"province_info_text_pointer_4",
						"bottom",
						50,
						uic_header_production,
						h_offset,
						0
					)
					tour_province_info:register_text_pointer(province_info_text_pointer_4)

					province_info_text_pointer_4:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_province_info_4")
					province_info_text_pointer_4:set_style("semitransparent")
					province_info_text_pointer_4:set_topmost(true)
					province_info_text_pointer_4:set_close_button_callback(
						function()
							if uic_deposits_list and uic_deposits_list:ChildCount() > 1 then
								tour_province_info:start("show_fifth_text_pointer")
							else 
								tour_province_info:start("show_sixth_text_pointer")
							end
						end
					)
					province_info_text_pointer_4:set_highlight_close_button(2)
					province_info_text_pointer_4:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_fourth_text_pointer"
			)
			
			tour_province_info:action(
				function()
					if tour_province_info:complete_if_uicomponent_obj_is_invalid(uic_header_deposits) then
						return
					end

					core:show_fullscreen_highlight_around_components(0, false, false, uic_header_deposits, uic_deposits_list)

					local province_info_text_pointer_5 = text_pointer:new_from_component(
						"province_info_text_pointer_5",
						"bottom",
						50,
						uic_header_deposits,
						h_offset,
						0
					)
					tour_province_info:register_text_pointer(province_info_text_pointer_5)

					province_info_text_pointer_5:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_province_info_5")
					province_info_text_pointer_5:set_style("semitransparent")
					province_info_text_pointer_5:set_topmost(true)
					province_info_text_pointer_5:set_close_button_callback(
						function()
							tour_province_info:start("show_sixth_text_pointer")
						end
					)
					province_info_text_pointer_5:set_highlight_close_button(2)
					province_info_text_pointer_5:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_fifth_text_pointer"
			)
			local uic_effect_bundles = core:get_ui_root():SequentialFind(unpack(province_info_panel_ui_component_path) , "subpanel_effect_bundles")
			tour_province_info:action(
				function()
					if tour_province_info:complete_if_uicomponent_obj_is_invalid(uic_effect_bundles) then
						return
					end

					core:show_fullscreen_highlight_around_components(30, false, false, uic_effect_bundles)

					local province_info_text_pointer_6 = text_pointer:new_from_component(
						"province_info_text_pointer_6",
						"bottom",
						50,
						uic_effect_bundles,
						h_offset,
						0
					)
					tour_province_info:register_text_pointer(province_info_text_pointer_6)

					province_info_text_pointer_6:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_province_info_6")
					province_info_text_pointer_6:set_style("semitransparent")
					province_info_text_pointer_6:set_topmost(true)
					province_info_text_pointer_6:set_close_button_callback(
						function()
							if uic_curr_commandment and uic_curr_commandment:VisibleFromRoot() then
								if uic_curr_commandment:CurrentState() ~= "inactive" then 
									tour_province_info:start("show_commandments")
								else
									tour_province_info:start("show_seventh_text_pointer")
								end
							else 
								core:hide_fullscreen_highlight()
								tour_province_info:complete()
							end
						end
					)
					province_info_text_pointer_6:set_highlight_close_button(2)
					province_info_text_pointer_6:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_sixth_text_pointer"
			)
			local uic_commandments_list = core:get_ui_root():SequentialFind(unpack(province_info_panel_ui_component_path) , "stack_incentives",  "clip_parent", "stack_background")
			tour_province_info:action(
				function()
					uic_curr_commandment:SimulateLClick()
					core:progress_on_uicomponent_animation_finished(uic_commandments_list, function() cm:callback(function() tour_province_info:start("show_seventh_text_pointer") end, 0.4) end)
				end,
				0,
				"show_commandments"
			)
			local uic_pointer_on_seventh
			tour_province_info:action(
				function()
					if uic_commandments_list and uic_commandments_list:Visible() then
						if tour_province_info:complete_if_uicomponent_obj_is_invalid(uic_commandments_list) then
							return
						end

						core:show_fullscreen_highlight_around_components(0, false, false, uic_curr_commandment, uic_commandments_list)
						uic_pointer_on_seventh = uic_commandments_list
					else
						if tour_province_info:complete_if_uicomponent_obj_is_invalid(uic_curr_commandment) then
							return
						end

						core:show_fullscreen_highlight_around_components(10, false, false, uic_curr_commandment)
						uic_pointer_on_seventh = uic_curr_commandment
					end

					local province_info_text_pointer_7 = text_pointer:new_from_component(
						"province_info_text_pointer_7",
						"bottom",
						50,
						uic_pointer_on_seventh,
						h_offset,
						0
					)
					tour_province_info:register_text_pointer(province_info_text_pointer_7)

					province_info_text_pointer_7:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_province_info_7")
					province_info_text_pointer_7:set_style("semitransparent")
					province_info_text_pointer_7:set_topmost(true)
					province_info_text_pointer_7:set_close_button_callback(
						function()
							if uic_curr_commandment and uic_curr_commandment:Visible() and uic_curr_commandment:CurrentState() ~= "inactive" then
								uic_curr_commandment:SimulateLClick()
							end
							core:hide_fullscreen_highlight()
							tour_province_info:complete()
						end
					)
					province_info_text_pointer_7:set_highlight_close_button(2)
					province_info_text_pointer_7:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_seventh_text_pointer"
			)
			--[[
			local uic_building_browser = core:get_ui_root():SequentialFind("settlement_panel", "button_building_browser")
			tour_province_info:action(
				function()
					if tour_province_info:complete_if_uicomponent_obj_is_invalid(uic_building_browser) then
						return
					end

					core:show_fullscreen_highlight_around_components(0, false, false, uic_building_browser)

					local province_info_text_pointer_8 = text_pointer:new_from_component(
						"province_info_text_pointer_8",
						"bottom",
						50,
						uic_building_browser,
						0.5,
						0
					)
					tour_province_info:register_text_pointer(province_info_text_pointer_8)

					province_info_text_pointer_8:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_province_info_8")
					province_info_text_pointer_8:set_style("semitransparent")
					province_info_text_pointer_8:set_topmost(true)
					province_info_text_pointer_8:set_close_button_callback(
						function()
							core:hide_fullscreen_highlight()
							tour_province_info:complete()
						end
					)
					province_info_text_pointer_8:set_highlight_close_button(2)
					province_info_text_pointer_8:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_eighth_text_pointer"
			)
			]]

			tour_province_info:start()
		end,
		check = function() return true end,
		menu_check = function() return true end
	},
-------------------------------------------------------------------------------------------------------------------------------------	
	phar_title_overlay = {-- Character Details scripted tour
		exec = function()
			local tour_char_panel = scripted_tour:new(
				"scripted_tour_char_panel",
				function() end
			)
			local uic_char_portrait = core:get_ui_root():SequentialFind("character_details_panel", "hero_info", "template_candidate_frame")
			local uic_stats_tab = core:get_ui_root():SequentialFind("character_details_panel", "tabs_holder", "stats_effects_tab", "button_template")
			local uic_effects_tab = core:get_ui_root():SequentialFind("character_details_panel", "tabs_holder", "stats_effects_tab", "effects_button")
			local uic_details_tab = core:get_ui_root():SequentialFind("character_details_panel", "tabs_holder", "details_titles_tab", "button_template")
			local uic_titles_tab = core:get_ui_root():SequentialFind("character_details_panel", "tabs_holder", "details_titles_tab", "titles_button")
			
			tour_char_panel:set_steal_esc_key(true)
			tour_char_panel:set_should_hide_text_pointers_on_completion(true)
			tour_char_panel:set_should_dismiss_advice_on_completion(true)
			
			tour_char_panel:action(
				function()
					if tour_char_panel:complete_if_uicomponent_obj_is_invalid(uic_char_portrait) then
						return
					end

					core:show_fullscreen_highlight_around_components(25, nil, false, uic_char_portrait)
					local char_panel_text_pointer_1 = text_pointer:new_from_component(
						"char_panel_text_pointer_1",
						"left",
						50,
						uic_char_portrait,
						1,
						0.5
					)
					tour_char_panel:register_text_pointer(char_panel_text_pointer_1)
					uic_stats_tab:SimulateLClick()
					uic_details_tab:SimulateLClick()
					char_panel_text_pointer_1:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_char_panel_1")
					char_panel_text_pointer_1:set_style("semitransparent")
					char_panel_text_pointer_1:set_topmost(true)
					char_panel_text_pointer_1:set_close_button_callback(
						function()
							tour_char_panel:start("show_text_pointer_2")
						end
					)
					char_panel_text_pointer_1:set_highlight_close_button(2)
					char_panel_text_pointer_1:show()
					ensure_no_shortcut_weirdness()
				end,
				0
			)
			local uic_bottom_buttons = core:get_ui_root():SequentialFind("character_details_panel", "hero_info", "template_candidate_frame", "portrait_parent", "portrait_button_holder")
			local uic_rank = core:get_ui_root():SequentialFind("character_details_panel", "hero_info", "rank")
			local uic_left_section = core:get_ui_root():SequentialFind("container_left_panel")
			tour_char_panel:action(
				function()
					if tour_char_panel:complete_if_uicomponent_obj_is_invalid(uic_rank) then
						return
					end

					core:show_fullscreen_highlight_around_components(0, false, false, uic_bottom_buttons, uic_rank)

					local char_panel_text_pointer_2 = text_pointer:new_from_component(
						"char_panel_text_pointer_2",
						"bottom",
						50,
						uic_rank,
						0.5,
						0
					)
					tour_char_panel:register_text_pointer(char_panel_text_pointer_2)
					uic_stats_tab:SimulateLClick()
					uic_details_tab:SimulateLClick()
					char_panel_text_pointer_2:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_char_panel_2")
					char_panel_text_pointer_2:set_style("semitransparent")
					char_panel_text_pointer_2:set_topmost(true)
					char_panel_text_pointer_2:set_close_button_callback(
						function()
							tour_char_panel:start("show_text_pointer_3")
						end
					)
					char_panel_text_pointer_2:set_highlight_close_button(2)
					char_panel_text_pointer_2:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_text_pointer_2"
			)
			tour_char_panel:action(
				function()
					if tour_char_panel:complete_if_uicomponent_obj_is_invalid(uic_left_section) then
						return
					end

					core:show_fullscreen_highlight_around_components(0, false, false, uic_left_section)

					local char_panel_text_pointer_3 = text_pointer:new_from_component(
						"char_panel_text_pointer_3",
						"left",
						100,
						uic_left_section,
						1,
						0.5
					)
					tour_char_panel:register_text_pointer(char_panel_text_pointer_3)

					char_panel_text_pointer_3:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_char_panel_3")
					char_panel_text_pointer_3:set_style("semitransparent")
					char_panel_text_pointer_3:set_topmost(true)
					char_panel_text_pointer_3:set_close_button_callback(
						function()
							uic_effects_tab:SimulateLClick()
							tour_char_panel:start("show_text_pointer_4")
						end
					)
					char_panel_text_pointer_3:set_highlight_close_button(2)
					char_panel_text_pointer_3:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_text_pointer_3"
			)
			tour_char_panel:action(
				function()

					if tour_char_panel:complete_if_uicomponent_obj_is_invalid(uic_left_section) then
						return
					end

					local char_panel_text_pointer_4 = text_pointer:new_from_component(
						"char_panel_text_pointer_4",
						"left",
						100,
						uic_left_section,
						1,
						0.25
					)
					tour_char_panel:register_text_pointer(char_panel_text_pointer_4)

					char_panel_text_pointer_4:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_char_panel_4")
					char_panel_text_pointer_4:set_style("semitransparent")
					char_panel_text_pointer_4:set_topmost(true)
					char_panel_text_pointer_4:set_close_button_callback(
						function()
							tour_char_panel:start("show_text_pointer_5")
						end
					)
					char_panel_text_pointer_4:set_highlight_close_button(2)
					char_panel_text_pointer_4:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_text_pointer_4"
			)
			local uic_anc_equip = core:get_ui_root():SequentialFind("ancillary_equipment")
			local uic_anc_gen = core:get_ui_root():SequentialFind("ancillary_general")
			local uic_anc_crown = core:get_ui_root():SequentialFind("ancillary_crown")
			tour_char_panel:action(
				function()
					if tour_char_panel:complete_if_uicomponent_obj_is_invalid(uic_anc_equip) then
						return
					end

					core:show_fullscreen_highlight_around_components(0, false, false, uic_anc_equip)

					local char_panel_text_pointer_5 = text_pointer:new_from_component(
						"char_panel_text_pointer_5",
						"right",
						100,
						uic_anc_equip,
						0,
						0.5
					)
					tour_char_panel:register_text_pointer(char_panel_text_pointer_5)

					char_panel_text_pointer_5:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_char_panel_5")
					char_panel_text_pointer_5:set_style("semitransparent")
					char_panel_text_pointer_5:set_topmost(true)
					char_panel_text_pointer_5:set_close_button_callback(
						function()
							tour_char_panel:start("show_text_pointer_6")
						end
					)
					char_panel_text_pointer_5:set_highlight_close_button(2)
					char_panel_text_pointer_5:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_text_pointer_5"
			)
			tour_char_panel:action(
				function()
					if tour_char_panel:complete_if_uicomponent_obj_is_invalid(uic_anc_gen) then
						return
					end

					core:show_fullscreen_highlight_around_components(0, false, false, uic_anc_gen)

					local char_panel_text_pointer_6 = text_pointer:new_from_component(
						"char_panel_text_pointer_6",
						"left",
						100,
						uic_anc_gen,
						1,
						0.5
					)
					tour_char_panel:register_text_pointer(char_panel_text_pointer_6)

					char_panel_text_pointer_6:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_char_panel_6")
					char_panel_text_pointer_6:set_style("semitransparent")
					char_panel_text_pointer_6:set_topmost(true)
					char_panel_text_pointer_6:set_close_button_callback(
						function()
							if uic_anc_crown and uic_anc_crown:VisibleFromRoot() then
								tour_char_panel:start("show_text_pointer_6_1")
							else
								tour_char_panel:start("show_text_pointer_7")
							end
						end
					)
					char_panel_text_pointer_6:set_highlight_close_button(2)
					char_panel_text_pointer_6:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_text_pointer_6"
			)
			tour_char_panel:action(
				function()
					if tour_char_panel:complete_if_uicomponent_obj_is_invalid(uic_anc_crown) then
						return
					end

					core:show_fullscreen_highlight_around_components(0, false, false, uic_anc_crown)

					local char_panel_text_pointer_6_1 = text_pointer:new_from_component(
						"char_panel_text_pointer_6_1",
						"left",
						100,
						uic_anc_crown,
						1,
						0.5
					)
					tour_char_panel:register_text_pointer(char_panel_text_pointer_6_1)

					char_panel_text_pointer_6_1:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_char_panel_6_1")
					char_panel_text_pointer_6_1:set_style("semitransparent")
					char_panel_text_pointer_6_1:set_topmost(true)
					char_panel_text_pointer_6_1:set_close_button_callback(
						function()
							tour_char_panel:start("show_text_pointer_7")
						end
					)
					char_panel_text_pointer_6_1:set_highlight_close_button(2)
					char_panel_text_pointer_6_1:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_text_pointer_6_1"
			)
			local uic_right_section = core:get_ui_root():SequentialFind("character_details_panel", "hero_info", "sidepanel_info_traits")
			tour_char_panel:action(
				function()
					if tour_char_panel:complete_if_uicomponent_obj_is_invalid(uic_right_section) then
						return
					end

					core:show_fullscreen_highlight_around_components(0, false, false, uic_right_section)

					local char_panel_text_pointer_7 = text_pointer:new_from_component(
						"char_panel_text_pointer_7",
						"right",
						100,
						uic_right_section,
						0,
						0.5
					)
					tour_char_panel:register_text_pointer(char_panel_text_pointer_7)

					char_panel_text_pointer_7:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_char_panel_7")
					char_panel_text_pointer_7:set_style("semitransparent")
					char_panel_text_pointer_7:set_topmost(true)
					char_panel_text_pointer_7:set_close_button_callback(
						function()
							tour_char_panel:start("show_text_pointer_8")
						end
					)
					char_panel_text_pointer_7:set_highlight_close_button(2)
					char_panel_text_pointer_7:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_text_pointer_7"
			)
			local uic_traits = core:get_ui_root():SequentialFind("scrtour_traits_highlight")
			tour_char_panel:action(
				function()
					if tour_char_panel:complete_if_uicomponent_obj_is_invalid(uic_traits) then
						return
					end

					core:show_fullscreen_highlight_around_components(0, false, false, uic_traits)

					local char_panel_text_pointer_8 = text_pointer:new_from_component(
						"char_panel_text_pointer_8",
						"bottom",
						100,
						uic_traits,
						0.5,
						0
					)
					tour_char_panel:register_text_pointer(char_panel_text_pointer_8)

					char_panel_text_pointer_8:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_char_panel_8")
					char_panel_text_pointer_8:set_style("semitransparent")
					char_panel_text_pointer_8:set_topmost(true)
					char_panel_text_pointer_8:set_close_button_callback(
						function()
							uic_titles_tab:SimulateLClick()
							tour_char_panel:start("show_text_pointer_9")
						end
					)
					char_panel_text_pointer_8:set_highlight_close_button(2)
					char_panel_text_pointer_8:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_text_pointer_8"
			)
			local uic_assigned_header = core:get_ui_root():SequentialFind("character_details_panel", "hero_info", "sidepanel_info_traits", "titles_panel", "assigned_header")
			local uic_assigned_titles = core:get_ui_root():SequentialFind("character_details_panel", "hero_info", "sidepanel_info_traits", "titles_panel", "titles_holder")
			tour_char_panel:action(
				function()
					if tour_char_panel:complete_if_uicomponent_obj_is_invalid(uic_assigned_titles) then
						return
					end

					core:show_fullscreen_highlight_around_components(0, false, false, uic_assigned_header, uic_assigned_titles)

					local char_panel_text_pointer_9 = text_pointer:new_from_component(
						"char_panel_text_pointer_9",
						"right",
						100,
						uic_assigned_titles,
						0,
						0.5
					)
					tour_char_panel:register_text_pointer(char_panel_text_pointer_9)

					char_panel_text_pointer_9:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_char_panel_9")
					char_panel_text_pointer_9:set_style("semitransparent")
					char_panel_text_pointer_9:set_topmost(true)
					char_panel_text_pointer_9:set_close_button_callback(
						function()
							tour_char_panel:start("show_text_pointer_10")
						end
					)
					char_panel_text_pointer_9:set_highlight_close_button(2)
					char_panel_text_pointer_9:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_text_pointer_9"
			)
			local uic_comp_header = core:get_ui_root():SequentialFind("competences_header")
			local uic_comp_list = core:get_ui_root():SequentialFind("competences_list")
			tour_char_panel:action(
				function()
					if tour_char_panel:complete_if_uicomponent_obj_is_invalid(uic_comp_list) then
						return
					end

					core:show_fullscreen_highlight_around_components(0, false, false, uic_comp_header, uic_comp_list)

					local char_panel_text_pointer_10 = text_pointer:new_from_component(
						"char_panel_text_pointer_10",
						"right",
						100,
						uic_comp_list,
						0,
						0.5
					)
					tour_char_panel:register_text_pointer(char_panel_text_pointer_10)

					char_panel_text_pointer_10:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_char_panel_10")
					char_panel_text_pointer_10:set_style("semitransparent")
					char_panel_text_pointer_10:set_topmost(true)
					char_panel_text_pointer_10:set_close_button_callback(
						function()
							tour_char_panel:start("show_text_pointer_11")
						end
					)
					char_panel_text_pointer_10:set_highlight_close_button(2)
					char_panel_text_pointer_10:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_text_pointer_10"
			)
			local uic_titles_list = core:get_ui_root():SequentialFind("unassigned_titles_holder")
			tour_char_panel:action(
				function()
					if tour_char_panel:complete_if_uicomponent_obj_is_invalid(uic_titles_list) then
						return
					end

					core:show_fullscreen_highlight_around_components(0, false, false, uic_titles_list)

					local char_panel_text_pointer_11 = text_pointer:new_from_component(
						"char_panel_text_pointer_11",
						"right",
						100,
						uic_titles_list,
						0,
						0.5
					)
					tour_char_panel:register_text_pointer(char_panel_text_pointer_11)

					char_panel_text_pointer_11:add_component_text("text", "ui_text_replacements_localised_text_phar_main_st_char_panel_11")
					char_panel_text_pointer_11:set_style("semitransparent")
					char_panel_text_pointer_11:set_topmost(true)
					char_panel_text_pointer_11:set_close_button_callback(
						function()
							core:hide_fullscreen_highlight()
							tour_char_panel:complete()
						end
					)
					char_panel_text_pointer_11:set_highlight_close_button(2)
					char_panel_text_pointer_11:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_text_pointer_11"
			)

			tour_char_panel:start()

		end,
		check = function() return true end,
		menu_check = function() return true end
	},




-------------------------------------------------------------------------------------------------------------------------------------
button_tutorial = {-- Campaign Customization scripted tour
		exec = function()
			local tour_campaign_customization = scripted_tour:new(
				"scripted_tour_campaign_customization",
				function() end
			)

			local uic_options_content = core:get_ui_root():SequentialFind("modular_difficulty_tabs_content")
			local uic_player_budget = core:get_ui_root():SequentialFind("panel_campaign", "listview", "list_clip", "list_box", "pre_campaign_parent", "expanding_list_items", "player_budget")
			uic_player_budget:SimulateLClick()
			tour_campaign_customization:set_steal_esc_key(true)
			tour_campaign_customization:set_should_hide_text_pointers_on_completion(true)
			tour_campaign_customization:set_should_dismiss_advice_on_completion(true)

			tour_campaign_customization:action(
				function()
					if tour_campaign_customization:complete_if_uicomponent_obj_is_invalid(uic_options_content) then
						return
					end

					core:show_fullscreen_highlight_around_components(25, nil, false, uic_options_content)

					local campaign_customization_text_pointer_1 = text_pointer:new_from_component(
						"campaign_customization_text_pointer_1",
						"left",
						100,
						uic_options_content,
						1,
						0.5
					)
					tour_campaign_customization:register_text_pointer(campaign_customization_text_pointer_1)
					
					campaign_customization_text_pointer_1:add_component_text("text", "ui_text_replacements_localised_text_phar_main_frontend_scripted_tour_campaign_customization_1")
					campaign_customization_text_pointer_1:set_style("semitransparent")
					campaign_customization_text_pointer_1:set_topmost(true)
					campaign_customization_text_pointer_1:set_close_button_callback(
						function()
							
							tour_campaign_customization:start("show_text_pointer_2")
						end
					)
					campaign_customization_text_pointer_1:set_highlight_close_button(2)
					campaign_customization_text_pointer_1:show()
					ensure_no_shortcut_weirdness()
				end,
				0
			)

			-- -- This call to show a fullscreen highlight has to be delayed as otherwise it blocks the call to SimulateMouseOn for unknown reasons
			-- tour_campaign_customization:action(
			-- 	function()
			-- 		core:show_fullscreen_highlight_around_components(25, nil, false, uic_options_content)
			-- 	end,
			-- 	0.1
			-- )
		
			local uic_options_description = core:get_ui_root():SequentialFind("about_hover")

			tour_campaign_customization:action(
				function()
					if tour_campaign_customization:complete_if_uicomponent_obj_is_invalid(uic_options_description) then
						return
					end

					core:show_fullscreen_highlight_around_components(20, false, false, uic_options_description)

					local campaign_customization_text_pointer_2 = text_pointer:new_from_component(
						"campaign_customization_text_pointer_2",
						"right",
						100,
						uic_options_description,
						0,
						0.5
					)
					tour_campaign_customization:register_text_pointer(campaign_customization_text_pointer_2)
					campaign_customization_text_pointer_2:add_component_text("text", "ui_text_replacements_localised_text_phar_main_frontend_scripted_tour_campaign_customization_2")
					campaign_customization_text_pointer_2:set_style("semitransparent")
					campaign_customization_text_pointer_2:set_topmost(true)
					campaign_customization_text_pointer_2:set_close_button_callback(
						function()
							tour_campaign_customization:start("show_text_pointer_3")
						end
					)
					campaign_customization_text_pointer_2:set_highlight_close_button(2)
					campaign_customization_text_pointer_2:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_text_pointer_2"
			)

			local uic_save_load_buttons = core:get_ui_root():SequentialFind("bottom_buttons_right_holder")

			tour_campaign_customization:action(
				function()
					if tour_campaign_customization:complete_if_uicomponent_obj_is_invalid(uic_save_load_buttons) then
						return
					end

					core:show_fullscreen_highlight_around_components(10, false, false, uic_save_load_buttons)

					local campaign_customization_text_pointer_3 = text_pointer:new_from_component(
						"campaign_customization_text_pointer_3",
						"bottom",
						100,
						uic_save_load_buttons,
						0.5,
						0
					)
					tour_campaign_customization:register_text_pointer(campaign_customization_text_pointer_3)
					campaign_customization_text_pointer_3:add_component_text("text", "ui_text_replacements_localised_text_phar_main_frontend_scripted_tour_campaign_customization_3")
					campaign_customization_text_pointer_3:set_style("semitransparent")
					campaign_customization_text_pointer_3:set_topmost(true)
					campaign_customization_text_pointer_3:set_close_button_callback(
						function()
							core:hide_fullscreen_highlight()
							tour_campaign_customization:complete()
						end
					)
					campaign_customization_text_pointer_3:set_highlight_close_button(2)
					campaign_customization_text_pointer_3:show()
					ensure_no_shortcut_weirdness()
				end,
				0,
				"show_text_pointer_3"
			)

			tour_campaign_customization:start()

		end,
		check = function() return true end,
		menu_check = function() return true end
	},
}
-------------------------------------------------------------------------------------------------------------------------------------	
	

function ensure_no_shortcut_weirdness()
	-- Apparently even if all shortcuts are stolen, the esc key is properly handled and all is well in the world our game find a way to break
	-- This unpleasant piece of code removes 99% of causes for weird shortcut interaction
	local cover = find_uicomponent(core:get_ui_root(), "fullscreen_highlight" , "top")
	local left = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown" , "left_faction_status_panel_holder" , "faction_left_status_panel")
	if cover and is_uicomponent(cover) then
		cover:SimulateLClick()
	elseif left and is_uicomponent(left) then 
		left:SimulateLClick()
	end
end


all_unit_categories = {
	"artillery",
	"cavalry",
	"heavy_ship",
	"inf_melee",
	"inf_ranged",
	"light_ship",
	"medium_ship",
	"war_beast",
	"war_machine",

}

function char_can_recruit_any_unit(military_force)
	for i=1, #all_unit_categories do
		if military_force:can_recruit_unit_category(all_unit_categories[i]) then
			out(all_unit_categories[i])
			return true
		end
	end
	return false
end

function char_is_alowed_to_recruit(char)
	if ((char:has_region() and char:region():owning_faction() == char:faction()) 
		or not char:faction():is_allowed_to_capture_territory()) then
			return true
	elseif char:military_force():is_horde() then
		return true
	end

	return false
end

function extract_commander_cqi_from_ui()
	local main_units_panel = core:get_ui_root():SequentialFind("units_panel" , "main_units_panel", "unit_panel" , "content" , "unit_container")
	local main_units_panel_child_count = main_units_panel:ChildCount()
	local units_list
	local uic_unit_upgrade = core:get_ui_root():SequentialFind("unit_upgrades")
	local uic_renaming = core:get_ui_root():SequentialFind("popup_text_input", "text_input_list_parent", "text_input")

	if uic_unit_upgrade or uic_renaming then 
		return false
	end
	
	-- the layout is full of "units_list" elements which causes issues. We need to iterate over direct children of main_units_panel
	for i = 0, main_units_panel_child_count - 1 do
		local uic_child = UIComponent(main_units_panel:Find(i))
		if uic_child:Id() == "units" then
			units_list = uic_child
		end
	end

	if units_list:ChildCount() < 1 then
		return false	-- If there is no first child, then the whole army is hidden, which means that the army is not of the local faction.
	end

	local commander_cqi = string.gsub(UIComponent(units_list:Find(0,true)):Id(), "LandUnit ", "")
	if tonumber(commander_cqi) == nil then
		return false
	end

	return commander_cqi
end

island_regions = {
	"troy_main_korcyra_lefcas",
	"troy_main_korcyra_scheria",
	"troy_main_cephallenia_hyrie",
	"troy_main_cephallenia_ithaca",
	"troy_main_cephallenia_kranioi",
	"troy_main_cephallenia_same",
	"troy_main_thrinacia_trinacria",
	"troy_main_zerynthia_nesoi_imbrasos",
	"troy_main_zerynthia_nesoi_saos",
	"troy_main_zerynthia_nesoi_thasos",
	"troy_main_lemnos_myrina",
	"troy_main_lemnos_poliochne",
	"troy_main_lesbos_eressos",
	"troy_main_lesbos_methymna",
	"troy_main_lesbos_mytilene",
	"troy_main_sporades_peparethos",
	"troy_main_sporades_skyros",
	"troy_main_ophioussa_volissos",
	"troy_main_ophioussa_vrontados",
	"troy_main_epagris_andros",
	"troy_main_epagris_hydroessa",
	"troy_main_epagris_mykonos",
	"troy_main_epagris_syros",
	"troy_main_melamphylos_dolyche",
	"troy_main_melamphylos_kalydnes",
	"troy_main_melamphylos_kos",
	"troy_main_melamphylos_samos",
	"troy_main_syrmata_meropia",
	"troy_main_syrmata_melos",
	"troy_main_syrmata_dryopis",
	"troy_main_cyclades_paros",
	"troy_main_cyclades_naxos",
	"troy_main_cyclades_minoa",
	"troy_main_cyclades_ios",
	"troy_main_krapathos_arcasia",
	"troy_main_krapathos_pylaea",
	"troy_main_rhodes_lindos",
	"troy_main_rhodes_kameiros",
	"troy_main_rhodes_ialysos",
	"troy_main_lacedaemon_cythera",
	"troy_main_mysia_proconnesos",
}

function setup_island_regions()
	for _, region_key in ipairs(island_regions) do
		cm:set_region_can_be_traded_if_not_adjacent(region_key, true)
	end
end

-- List of all the POI building keys
poi_building_keys = {
	"phar_main_ers_unique_collosi_of_memnon",
	"phar_main_ers_unique_deir_el_bahri",
	"phar_main_ers_unique_great_temple_abydos",
	"phar_main_ers_unique_hittite_rock_sanctuary",
	"phar_main_ers_unique_karnak_temple_complex",
	"phar_main_ers_unique_ramesseum",
	"phar_main_ers_unique_red_pyramid",
	"phar_main_ers_unique_sphinx_and_giza_pyramids",
	"phar_main_ers_unique_sphinx_arch_gate_arinna",
	"phar_main_ers_unique_step_pyramid_djoser",
	"phar_main_ers_unique_temple_luxor",
	"phar_main_ers_unique_temple_of_baal",
	"phar_main_ers_unique_valley_of_kings",
	"phar_map_ers_unique_ancient_statue_of_cybele",
	"phar_map_ers_unique_chogha_zanbil",
	"phar_map_ers_unique_etemenanki",
	"phar_map_ers_unique_great_ziggurat_of_ur",
	"phar_map_ers_unique_lemnos_necropolis",
	"phar_map_ers_unique_white_temple_of_anu",
	"phar_map_ers_unique_ziggurat_of_enlil",
}


----------------------------------------------------------------------------------------------------
-- Sea Peoples playable factions & Horde specific
sea_peoples_playable_faction_keys = {
	"phar_sea_sherden",
	"phar_sea_peleset",
}

is_sea_playable_faction = function(faction_key)
	return table_contains(sea_peoples_playable_faction_keys, faction_key)
end

-- you can append entries at the end of this table `horde_force_types`. But don't change the order of existing entries; if you plan to do so inform programming team.
horde_force_types = {
	"HORDE",
	"NAVAL_HORDE",
}

-- you can append entries at the end of this table `settled_force_types`. But don't change the order of existing entries; if you plan to do so inform programming team.
settled_force_types = {
	"ARMY",
	"NAVY",
}

----------------------------------------------------------------------------------------------------
