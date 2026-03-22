out("Loading phar_realms.lua")
phar_realms = {
	realms = {},
	persistent = {
		current_season = "",
	},
	change_season_event_key = "nile_state_change"
}

phar_realms.realms = {
-- 	{
-- 		capital = "phar_main_abydos_abydos",
-- 		name = "sacred_egypt_lands",
-- 		regions = 
--		{
--			"phar_main_kerma_kerma",
-- 			"phar_main_kerma_mu_sh",
-- 			"phar_main_kerma_nu_abu",
-- 			"phar_main_kerma_uab_khu",
-- 			"phar_main_per_ramesses_meri_amon_hap_sh",
-- 			"phar_main_per_ramesses_meri_amon_khet_pa",
-- 			"phar_main_per_ramesses_meri_amon_per_ramesses_meri_amon",
-- 			"phar_main_buhen_buhen",
-- 			"phar_main_buhen_hap_au",
-- 			"phar_main_buhen_her_hetem",
-- 			"phar_main_buhen_shesp_ma",
-- 			"phar_main_north_nubia_hen_sekh_t",
-- 			"phar_main_north_nubia_mu_ua",
-- 			"phar_main_north_nubia_res_pa",
-- 			"phar_main_kurkur_oasis_kurkur_oasis",
--			"phar_main_kurkur_oasis_sen_hetem",
--			"phar_main_kurkur_oasis_tcheba_ua",
--			"phar_main_elephantine_elephantine",
--			"phar_main_elephantine_hierakonpolis",
--			"phar_main_elephantine_mes",
--			"phar_main_elephantine_tep_hetem",
--			"phar_main_kom_ombo_kha_sba",
--			"phar_main_kom_ombo_kom_ombo",
--			"phar_main_kom_ombo_tchu_ua",
--			"phar_main_thebes_kha_ti",
--			"phar_main_thebes_sma_ua",
--			"phar_main_thebes_thebes",
--			"phar_main_abydos_aakh_ner",
--			"phar_main_abydos_abydos",
--			"phar_main_abydos_tin",
--			"phar_main_kharga_oasis_kharga_oasis",
--			"phar_main_kharga_oasis_shesp_net",
--			"phar_main_kharga_oasis_tebh",
--			"phar_main_akhmim_akhmim",
--			"phar_main_akhmim_mefka_qes",
--			"phar_main_akhmim_ur_men",
--			"phar_main_asyut_asyut",
--			"phar_main_asyut_kep_un",
--			"phar_main_asyut_tem_khus",
--			"phar_main_amarna_amarna",
--			"phar_main_hermopolis_hermopolis",
--			"phar_main_hermopolis_ti_ar",
--			"phar_main_hardai_hardai",
--			"phar_main_hardai_tep_aha",
--			"phar_main_hardai_ur_gem",
--			"phar_main_herakleopolis_herakleopolis",
--			"phar_main_herakleopolis_sheps_khu",
--			"phar_main_fayium_dahchur",
--			"phar_main_fayium_fayium",
--			"phar_main_fayium_khem",
--			"phar_main_memphis_helwan",
--			"phar_main_memphis_memphis",
--			"phar_main_memphis_petpeh",
--			"phar_main_heliopolis_heliopolis",
--			"phar_main_heliopolis_qes",
--			"phar_main_pi_ramesses_per_amun",
--			"phar_main_pi_ramesses_pi_ramesses",
--			"phar_main_pi_ramesses_tjaru",
--			"phar_main_buto_buto",
--			"phar_main_buto_paiuenamun",
--			"phar_main_buto_sais",
--			"phar_main_rhacotis_khan_aha",
--			"phar_main_rhacotis_qema",
--			"phar_main_rhacotis_rhacotis",
--		},
--	},
	-- {
	-- 	capital = "phar_main_east_sinai_beersheba",
	-- 	name = "test_realm",
	-- 	regions = 
	-- 	{
	-- 		"phar_main_east_sinai_beersheba",
	-- 	},
	-- },
	-- {
	-- 	capital = "phar_main_sinai_tchu_am",
	-- 	name = "test_realm2",
	-- 	regions = 
	-- 	{
	-- 		"phar_main_sinai_tchu_am",
	-- 	},
	-- },
	-- {
	-- 	capital = "phar_main_east_sinai_khet_khefti",
	-- 	name = "test_realm3",
	-- 	regions = 
	-- 	{
	-- 		"phar_main_east_sinai_khet_khefti",
	-- 	},
	-- },
	{
		capital = "", --No design yet
		name = "hittite_lowlands_realm",
		native_units_set_key = "phar_main_native_lowlands_isuwa",
		regions =
		{
			"phar_main_tarsus_adana",
			"phar_main_tarsus_kyinda",
			"phar_main_tarsus_tarsus",
			"phar_main_tuwana_cybistra",
			"phar_main_tuwana_hubishna",
			"phar_main_tuwana_kelenderis",
			"phar_main_tuwana_tuwana",
			"phar_main_south_hatti_cibyra",
			"phar_main_south_hatti_lystra",
			"phar_main_south_hatti_tarhuntassa",
			"phar_main_parha_isaura",
			"phar_main_parha_parha",
			"phar_main_parha_sagalassos",
			"phar_main_central_hatti_koropissos",
			"phar_main_central_hatti_larawanda",
			"phar_main_central_hatti_pegella",
		},
	},
	{
		capital = "", --No design yet
		name = "hittite_highlands_realm",
		native_units_set_key = "phar_main_native_highlands",
		regions = 
		{
			"phar_main_north_hatti_andrapa",
			"phar_main_north_hatti_dadastana",
			"phar_main_north_hatti_dusae",
			"phar_main_north_hatti_krateia",
			"phar_main_ancyra_ancyra",
			"phar_main_ancyra_aspona",
			"phar_main_ancyra_lagania",
			"phar_main_west_hatti_abrostola",
			"phar_main_west_hatti_dorylaion",
			"phar_main_west_hatti_gordion",
			"phar_main_west_hatti_pessinus",
			"phar_main_purushanda_mokissos",
			"phar_main_purushanda_nyssa",
			"phar_main_purushanda_purushanda",
			"phar_main_hattussa_ankuwa",
			"phar_main_hattussa_arinna",
			"phar_main_hattussa_corniaspa",
			"phar_main_hattussa_hattussa",
			"phar_map_tummanna_cromna",
			"phar_map_tummanna_sandaraca",
			"phar_map_tummanna_tummanna",
			"phar_map_zz_tummanna_kinik",
		},
	},
	{
		capital = "", --No design yet
		name = "hittite_isuwa_realm",
		native_units_set_key = "phar_main_native_lowlands_isuwa",
		regions = 
		{
			"phar_main_zippalanda_amaseia",
			"phar_main_zippalanda_nerik",
			"phar_main_zippalanda_sapinuwa",
			"phar_main_zippalanda_zippalanda",
			"phar_main_malidiya_malidiya",
			"phar_main_malidiya_samuha",
			"phar_main_malidiya_tegarama",
			"phar_main_malidiya_zara",
			"phar_main_kanesh_kanesh",
			"phar_main_kanesh_kummanni",
			"phar_main_kanesh_saricha",
			"phar_map_kammanu_amidu",
			"phar_map_kammanu_kummaha",
			"phar_map_kammanu_melid",
			"phar_map_kammanu_uiram",
			"phar_map_themiscyra_sinope",
			"phar_map_themiscyra_terme",
			"phar_map_themiscyra_zalpa",
		},
	},
	{
		capital = "", --No design yet
		name = "canaanite_yamhad_realm",
		native_units_set_key = "phar_main_native_fenkhu_yamhad",
		regions =
		{
			"phar_main_alashiya_alashiya",
			"phar_main_alashiya_kition",
			"phar_main_alashiya_paphos",
			"phar_main_ugarit_ebla",
			"phar_main_ugarit_ugarit",
			"phar_main_carchemish_carchemish",
			"phar_main_carchemish_harranu",
			"phar_main_carchemish_khantap",
			"phar_main_carchemish_tuba",
			"phar_main_aleppo_alalah",
			"phar_main_aleppo_aleppo",
		},
	},
	{
		capital = "", --No design yet
		name = "canaanite_retjenu_realm",
		native_units_set_key = "phar_main_native_sinai_retjenu",
		regions =
		{
			"phar_main_emar_emar",
			"phar_main_emar_qatna",
			"phar_main_emar_teshub",
			"phar_main_damascus_damascus",
			"phar_main_damascus_jawa",
			"phar_main_damascus_sedad",
			"phar_main_damascus_tadmor",
			"phar_main_shechem_ammon",
			"phar_main_shechem_sakka",
			"phar_main_shechem_shechem",
		},
	},
	{
		capital = "", --No design yet
		name = "canaanite_fenkhu_realm",
		native_units_set_key = "phar_main_native_fenkhu_yamhad",
		regions = 
		{
			"phar_main_kadesh_kadesh",
			"phar_main_kadesh_sumur",
			"phar_main_tyre_byblos",
			"phar_main_tyre_hazor",
			"phar_main_tyre_sidon",
			"phar_main_tyre_tyre",
			"phar_main_megiddo_megiddo",
			"phar_main_megiddo_yapo",
			"phar_main_ashkelon_urushalim",
			"phar_main_ashkelon_ashkelon",
		},
	},
	{
		capital = "", --No design yet
		name = "canaanite_sinai_realm",
		native_units_set_key = "phar_main_native_sinai_retjenu",
		regions = 
		{
			"phar_main_ashkelon_pel",
			"phar_main_north_sinai_azzati",
			"phar_main_north_sinai_neb_gehes",
			"phar_main_north_sinai_nekhel",
			"phar_main_north_sinai_sukkot",
			"phar_main_east_sinai_beersheba",
			"phar_main_east_sinai_khet_khefti",
			"phar_main_sinai_hetch",
			"phar_main_sinai_tchu_am",
			"phar_main_sinai_tchu_sh",
		},
	},
	{
		capital = "", --No design yet
		name = "egyptian_lower_egypt_realm",
		native_units_set_key = "phar_main_native_lower_egypt",
		regions =
		{
			"phar_main_pi_ramesses_per_amun",
			"phar_main_pi_ramesses_pi_ramesses",
			"phar_main_pi_ramesses_tjaru",
			"phar_main_heliopolis_heliopolis",
			"phar_main_heliopolis_qes",
			"phar_main_buto_buto",
			"phar_main_buto_paiuenamun",
			"phar_main_buto_sais",
			"phar_main_rhacotis_khan_aha",
			"phar_main_rhacotis_qema",
			"phar_main_rhacotis_rhacotis",
			"phar_main_faiyum_dahshur",
			"phar_main_faiyum_faiyum",
			"phar_main_faiyum_khem",
			"phar_main_hermopolis_ti_ar",
			"phar_main_hermopolis_hermopolis",
			"phar_main_amarna_amarna",
			"phar_main_hardai_hardai",
			"phar_main_hardai_tep_aha",
			"phar_main_hardai_ur_gem",
			"phar_main_herakleopolis_herakleopolis",
			"phar_main_herakleopolis_sheps_khu",
			"phar_main_memphis_helwan",
 			"phar_main_memphis_memphis",
 			"phar_main_memphis_petpeh",
		},
	},
	{
		capital = "", --No design yet
		name = "egyptian_upper_egypt_realm",
		native_units_set_key = "phar_main_native_upper_egypt",
		regions =
		{
			"phar_main_asyut_asyut",
			"phar_main_asyut_kep_un",
			"phar_main_asyut_tem_khus",
			"phar_main_akhmim_akhmim",
			"phar_main_akhmim_mefka_qes",
			"phar_main_akhmim_ur_men",
			"phar_main_saww_mefka_beh",
			"phar_main_saww_saww",
			"phar_main_saww_sheps_uab",
			"phar_main_abydos_aakh_ner",
			"phar_main_abydos_abydos",
			"phar_main_abydos_tin",
			"phar_main_thebes_kha_ti",
			"phar_main_thebes_sma_ua",
			"phar_main_thebes_thebes",
			"phar_main_elephantine_elephantine",
			"phar_main_elephantine_hierakonpolis",
			"phar_main_elephantine_mes",
			"phar_main_elephantine_tep_hetem",
			"phar_main_kom_ombo_kha_sba",
			"phar_main_kom_ombo_kom_ombo",
			"phar_main_kom_ombo_tchu_ua",
		},
	},
	{
		capital = "", --No design yet
		name = "egyptian_western_desert_realm",
		native_units_set_key = "phar_main_native_western_desert",
		regions =
		{
			"phar_main_amunia_amunia",
			"phar_main_amunia_met_usr",
			"phar_main_amunia_ner_neb",
			"phar_main_bahariya_oasis_bahariya_oasis",
			"phar_main_bahariya_oasis_mefka",
			"phar_main_bahariya_oasis_set_neb",
			"phar_main_farafra_oasis_aakh_sa",
			"phar_main_farafra_oasis_farafra_oasis",
			"phar_main_farafra_oasis_msha_khefti",
			"phar_main_kharga_oasis_kharga_oasis",
			"phar_main_kharga_oasis_shesp_net",
			"phar_main_kharga_oasis_tebh",
			"phar_main_dakhla_oasis_dakhla_oasis",
			"phar_main_dakhla_oasis_khesef",
			"phar_main_dakhla_oasis_tcham",
			"phar_main_kurkur_oasis_kurkur_oasis",
			"phar_main_kurkur_oasis_sen_hetem",
			"phar_main_kurkur_oasis_tcheba_ua",
			"phar_main_dungul_oasis_dungul_asis",
			"phar_main_dungul_oasis_tem_pa",
			"phar_main_dungul_oasis_thes",
			"phar_main_dungul_oasis_utch",
			"phar_map_zz_tjehenu_apesh",
			"phar_map_zz_tjehenu_khenti_qerer",
			"phar_map_zz_tjehenu_sepa",
			"phar_map_zz_tjehenu_wehat_siwa",
		},
	},
	{
		capital = "", --No design yet
		name = "egyptian_nubia_realm",
		native_units_set_key = "phar_main_native_nubia_kush",
		regions =
		{
			"phar_main_north_nubia_miam",
			"phar_main_north_nubia_mu_ua",
			"phar_main_north_nubia_res_pa",
			"phar_main_north_east_nubia_hetch_pa",
			"phar_main_north_east_nubia_utcha_uas",
			"phar_main_buhen_buhen",
			"phar_main_buhen_hap_au",
			"phar_main_buhen_her_hetem",
			"phar_main_buhen_shesp_ma",
			"phar_main_east_nubia_khefti_gehes",
			"phar_main_east_nubia_tep_heb",
			"phar_main_east_nubia_ti_neb",
		},
	},
	{
		capital = "", --No design yet
		name = "egyptian_kush_realm",
		native_units_set_key = "phar_main_native_nubia_kush",
		regions =
		{
			"phar_main_per_ramesses_meri_amon_hap_sh",
			"phar_main_per_ramesses_meri_amon_khet_pa",
			"phar_main_per_ramesses_meri_amon_per_ramesses_meri_amon",
			"phar_main_kerma_kerma",
			"phar_main_kerma_mu_sh",
			"phar_main_kerma_nu_abu",
			"phar_main_kerma_uab_khu",
			"phar_main_kawa_abu_ab",
			"phar_main_kawa_kawa",
			"phar_main_kawa_khus_qes",
			"phar_main_napata_hem_shema",
			"phar_main_napata_napata",
			"phar_main_napata_res_khet",
			"phar_main_napata_res_tua",
		},
	},
	{
        capital = "", --No design yet
        name = "aegean_assuwa_realm",
		native_units_set_key = "phar_map_native_assuwa",
        regions =
        {
			"phar_map_rhodes_arcasia",
			"phar_map_rhodes_ialysos",
			"phar_map_rhodes_lindos",
			"phar_map_teythrania_eressos",
			"phar_map_teythrania_kyme",
			"phar_map_teythrania_pelopia",
			"phar_map_teythrania_volissos",
			"phar_map_latmos_dolyche",
			"phar_map_latmos_samos",
			"phar_map_zerynthia_nesoi_imbrasos",
			"phar_map_zerynthia_nesoi_myrina",
			"phar_map_zerynthia_nesoi_skyros",
			"phar_map_ilion_adresteia",
			"phar_map_ilion_percote",
			"phar_map_ilion_troy",
			"phar_map_ilion_zeleia",
			"phar_map_maeonia_milethus",
			"phar_map_maeonia_erythrae",
			"phar_map_maeonia_eyanthia",
			"phar_map_maeonia_ephesos",
			"phar_map_caria_halicarnassos",
			"phar_map_caria_knidos",
			"phar_map_bithynia_apollonia",
			"phar_map_bithynia_cythoros",
			"phar_map_bithynia_pylae",
			"phar_map_hapalla_arowanna",
			"phar_map_hapalla_hapalla",
			"phar_map_hapalla_kalasma",
			"phar_map_hapalla_pitassa",
			"phar_map_kuwaliya_appawiya",
			"phar_map_kuwaliya_kuwaliya",
			"phar_map_kuwaliya_ninoe",
			"phar_map_kuwaliya_walna",
			"phar_map_isthmos_cibyra",
			"phar_map_isthmos_kaunos",
			"phar_map_isthmos_mobolla",
			"phar_map_lycia_balbura",
			"phar_map_lycia_peraia",
			"phar_map_lycia_phellos",
			"phar_map_lycia_telmessos",
			"phar_map_parha_myra",
        },
    },
	{
        capital = "", --No design yet
        name = "aegean_thrace_realm",
		native_units_set_key = "phar_map_native_thrace",
        regions =
        {
			"phar_map_sinticobisaltia_olophyxos",
			"phar_map_sinticobisaltia_scione",
			"phar_map_sinticobisaltia_siris",
			"phar_map_zonaea_apsynthia",
			"phar_map_zonaea_ismaros",
			"phar_map_zonaea_sestos",
			"phar_map_zonaea_thasos",
			"phar_map_thynia_athyra",
			"phar_map_thynia_salmydessos",
			"phar_map_thynia_sipte",
        },
    },
	{
        capital = "", --No design yet
        name = "aegean_achaea_realm",
		native_units_set_key = "phar_map_native_achaea",
        regions =
        {
			"phar_map_cephallenia_hyrie",
			"phar_map_cephallenia_ithaca",
			"phar_map_cephallenia_lefcas",
			"phar_map_lacedaemon_altis",
			"phar_map_lacedaemon_cythera",
			"phar_map_lacedaemon_pylos",
			"phar_map_lacedaemon_sparta",
			"phar_map_mycenaeca_aegion",
			"phar_map_mycenaeca_corinth",
			"phar_map_mycenaeca_mycenae",
			"phar_map_mycenaeca_tiryns",
			"phar_map_attica_athens",
			"phar_map_attica_carystos",
			"phar_map_attica_eretria",
			"phar_map_boeotia_calydon",
			"phar_map_boeotia_cyparissos",
			"phar_map_boeotia_thebes",
			"phar_map_macedonia_arnissa",
			"phar_map_macedonia_cassope",
			"phar_map_macedonia_dolopeis",
			"phar_map_aeolia_iolcos",
			"phar_map_aeolia_pharsalos",
			"phar_map_aeolia_pteleon",
			"phar_map_almopia_apsalos",
			"phar_map_almopia_dion",
			"phar_map_kretes_knossos",
			"phar_map_kretes_kydonia",
			"phar_map_kretes_phaestos",
			"phar_map_kretes_setaea",
			"phar_map_cyclades_andros",
			"phar_map_cyclades_melos",
			"phar_map_cyclades_minoa",
			"phar_map_cyclades_naxos",
        },
    },
	{
        capital = "", --No design yet
        name = "mesopotamia_haltamti_realm",
		native_units_set_key = "phar_map_native_haltamti",
        regions =
        {
			"phar_map_northern_elam_kabnak",
			"phar_map_northern_elam_madaktu",
			"phar_map_northern_elam_pashime",
			"phar_map_northern_elam_susa",
        },
    },
	{
        capital = "", --No design yet
        name = "mesopotamia_mat_assur_realm",
		native_units_set_key = "phar_map_native_mat_assur",
        regions =
        {
			"phar_map_aranzah_assur",
			"phar_map_aranzah_karana",
			"phar_map_aranzah_nimrud",
			"phar_map_aranzah_nineveh",
			"phar_map_suhum_elu_anat",
			"phar_map_suhum_elu_haradu",
			"phar_map_suhum_elu_sapiratum",
			"phar_map_mari_duara",
			"phar_map_mari_mari",
			"phar_map_mari_supru",
			"phar_map_mari_terqa",
			"phar_map_azalzi_amasakku",
			"phar_map_azalzi_kahat",
			"phar_map_azalzi_shudu",
			"phar_map_azalzi_zakhiku",
			"phar_map_hanigalbat_dur_katlimmu",
			"phar_map_hanigalbat_sangaritu",
			"phar_map_hanigalbat_shadikanni",
			"phar_map_hanigalbat_washukanni",
        },
    },
	{
        capital = "", --No design yet
        name = "mesopotamia_mat_tamti_realm",
		native_units_set_key = "phar_map_native_mat_tamti",
        regions =
        {
			"phar_map_ashnunnak_der",
			"phar_map_ashnunnak_diniktum",
			"phar_map_ashnunnak_eshnunna",
			"phar_map_ashnunnak_tutub",
			"phar_map_karduniash_ishtananu_lagash",
			"phar_map_karduniash_ishtananu_larak",
			"phar_map_karduniash_ishtananu_malgu",
			"phar_map_karduniash_ishtananu_nippur",
			"phar_map_karduniash_shutaiu_borsippa",
			"phar_map_karduniash_shutaiu_ur",
			"phar_map_karduniash_shutaiu_uruk",
			"phar_map_kan_digirak_babylon",
			"phar_map_suhum_shaplu_idu",
			"phar_map_suhum_shaplu_rapiku",
			"phar_map_suhum_shaplu_sippar_amnamun",
			"phar_map_bit_peri_amurru_agade",
			"phar_map_bit_peri_amurru_dur_kurigalzu",
			"phar_map_bit_peri_amurru_sur_marrati",
        },
    },
	{
        capital = "", --No design yet
        name = "mesopotamia_zagros_realm",
		native_units_set_key = "phar_map_native_zagros",
        regions =
        {
			"phar_map_radanu_admannu",
			"phar_map_radanu_arrapha",
			"phar_map_radanu_lubdu",
			"phar_map_qutu_atlila",
			"phar_map_qutu_halman",
			"phar_map_qutu_nisir",
			"phar_map_qutu_tumma",
			"phar_map_zabu_kilizi",
			"phar_map_zabu_sussara",
			"phar_map_zabu_urbilim",
			"phar_map_uruatri_musasir",
			"phar_map_uruatri_tuali",
			"phar_map_uruatri_tuspa",
			"phar_map_kadmuhu_kindari",
			"phar_map_kadmuhu_mardama",
			"phar_map_kadmuhu_shibaniba",
			"phar_map_kadmuhu_tushhap",
			"phar_map_hayasa_azzi_aripsha",
			"phar_map_hayasa_azzi_hayasha",
			"phar_map_hayasa_azzi_upumu",
        },
    },
	{
        capital = "", --No design yet
        name = "mesopotamia_aber_nahra_realm",
		native_units_set_key = "phar_map_native_aber_nahra",
        regions =
        {
			"phar_map_ashtata_apane",
			"phar_map_ashtata_ashimon",
			"phar_map_ashtata_bukushe",
			"phar_map_ashtata_tuttul",
			"phar_map_balihu_eluhat",
			"phar_map_balihu_harbe",
			"phar_map_balihu_irridu",
			"phar_map_balihu_zalpah",
        },
    },
}

phar_realms.get_realm = function(realm_name)
	for _, realm in ipairs(phar_realms.realms) do
		if realm.name == realm_name then
			return realm
		end
	end
	return nil
end

phar_realms.get_realm_for_region = function(region_key)
	for _, realm in ipairs(phar_realms.realms) do
		for _, region in ipairs(realm.regions) do
			if region == region_key then
				return realm.name
			end
		end
	end
	return nil
end

phar_realms.get_regions_for_realm = function(realm_key)
	for _, realm in ipairs(phar_realms.realms) do
		if realm_key == realm.name then
			return realm.regions
		end
	end
	return {}
end

phar_realms.is_region_in_realm = function(realm_name, region_key)
	for _, realm in ipairs(phar_realms.realms) do
		if realm.realm_name == realm_name then
			for _, region in ipairs(realm.regions) do
				if region == region_key then
					return true
				end
			end
		end
	end
	return false
end

phar_realms.is_realm_owned_by_faction = function(realm_key, faction_key)
	local realm = phar_realms.get_realm(realm_key)
	if not realm then
		script_error("phar_realms.is_realm_owned_by_faction invalid realm key!")
		return
	end

	for _, region_key in ipairs(realm.regions) do
		local region = cm:model():world():region_manager():region_by_key(region_key)
		if region:owning_faction():name() ~= faction_key then
			return false
		end
	end
	return true
end

cm:add_first_tick_callback(
	function()
		for _, realm in ipairs(phar_realms.realms) do
			cm:add_realm(realm.name)

			for _, region_key in ipairs(realm.regions) do
				cm:set_region_realm(region_key, realm.name)
			end
		end

		if not deities or not deities.gods then
			return
		end

		for _, god_data in ipairs(deities.gods) do
			if god_data.realms then
				for _, realm_key in ipairs(god_data.realms) do
					cm:add_god_to_realm(
						realm_key, 
						"ui_text_replacements_localised_text_" .. god_data.localised_name, 
						god_data.god_slot_image)
				end
			end
		end

		-- Display Aten on its cult centre's tooltip alongside the other gods
		local aten_data = deities.get_god(deities.config.aten_god_key)
		if aten_data then
			local cult_centre_region = deities.get_god_cult_centre_region(deities.config.aten_god_key)
			cm:add_overriden_god_for_region(
				cult_centre_region,
				"ui_text_replacements_localised_text_" .. aten_data.localised_name, 
				aten_data.god_slot_image)

			local cult_centre_ream_key = phar_realms.get_realm_for_region(cult_centre_region)
			if not cult_centre_ream_key then
				return
			end

			for _, god_data in ipairs(deities.gods) do
				if god_data.realms then
					for _, realm_key in ipairs(god_data.realms) do
						if realm_key == cult_centre_ream_key then
							cm:add_overriden_god_for_region(
								cult_centre_region,
								"ui_text_replacements_localised_text_" .. god_data.localised_name, 
								god_data.god_slot_image)
						end
					end
				end
			end
		end
	end
)

phar_realms.persistent.current_season = ""
core:add_listener(
	"phar_realm_season_changed_listener",
	"RoundStart",
	true,
	function()
		local current_season = cm:model():current_season_key()
		if phar_realms.persistent.current_season ~= current_season then
			phar_realms.persistent.current_season = current_season
			local faction_list = cm:get_human_factions()
			for k, v in ipairs(faction_list) do
				local faction = cm:get_faction(v)
				local season_key = "campaign_localised_strings_string_" .. current_season
				cm:add_event_feed_event(
					phar_realms.change_season_event_key,
					faction:name(),
					0,
					season_key
				)
			end
			
		end
	end,
	true
)



cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("PHAR_REALMS_PERSISTENT_DATA", phar_realms.persistent, context)
	end
)

cm:add_loading_game_callback(
	function(context)
		phar_realms.persistent = cm:load_named_value("PHAR_REALMS_PERSISTENT_DATA", phar_realms.persistent, context)
	end
)
