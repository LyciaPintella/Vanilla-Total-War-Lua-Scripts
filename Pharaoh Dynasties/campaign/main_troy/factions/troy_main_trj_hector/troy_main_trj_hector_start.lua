-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	FACTION SCRIPT
--
--	Custom script for this faction starts here. The should_load_first_turn is
--	queried to determine whether to load the startup script for the full-prelude
--	first turn or just the standard startup script.
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------


-- intro camera
cam_start_x = 397.50317382813;					-- camera target x position
cam_start_y = 399.16961669922;					-- camera target y position
cam_start_d = 8.3250980377197;						-- camera distance
cam_start_b = 0;						-- camera heading
cam_start_h = 4;						-- camera height


hector_starting_camera_position = {
	cam_start_x,
	cam_start_y,
	cam_start_d,
	cam_start_b,
	cam_start_h
}

odysseus_forename_id = "675962708";
aeneas_forename_id = "741051588";
paris_forename_id = "280733261";
achilles_forename_id = "533763757";
agamemnon_forename_id = "610463016";
menelaus_forename_id = "923017616";
hector_forename_id = "2060800581";
sarpedon_forename_id = "1900383194";


---------------------------------------------------------------
--	Loading faction scripts
---------------------------------------------------------------

cm:load_global_script(cm:get_local_faction_name(true) .. "_open_start", true);				-- sp only





---------------------------------------------------------------
--	First-Tick callbacks
---------------------------------------------------------------

cm:add_first_tick_callback_sp_new(
	function() 
		-- set pre-intro-cutscene camera position
		cm:set_camera_position(222.42063903809, 132.03402709961, 14.873885154724, 0, 16.13488769531);

		-- put faction-specific calls that should only gets triggered in a new singleplayer game here
		
		cm:start_intro_cutscene_on_loading_screen_dismissed(cutscene_intro_hector)
	end
)


cm:add_first_tick_callback_mp_new(
	function() 
		-- put faction-specific calls that should only gets triggered in a new multiplayer game here
		core:progress_on_loading_screen_dismissed(
			function() 
				cm:position_camera_at_primary_military_force(cm:get_local_faction_name(true))
			end
		)
	end
)


cm:add_first_tick_callback_sp_each(
	function() 
		-- put faction-specific calls that should get triggered each time a singleplayer game loads here
	end
)


cm:add_first_tick_callback_mp_each(
	function()
		-- put faction-specific calls that should get triggered each time a multiplayer game loads here
	end
)







---------------------------------------------------------------
--	Intro cutscene
---------------------------------------------------------------

function cutscene_intro_hector()

	cm:set_camera_position(cam_start_x, cam_start_y, cam_start_d, cam_start_b, cam_start_h);
	local advice_to_play = {};
	advice_to_play[1] = "troy_cam_faction_intro_homer_hec_01"
	advice_to_play[2] = "troy_cam_faction_intro_homer_hec_02"
	advice_to_play[3] = "troy_cam_faction_intro_homer_hec_03"
	advice_to_play[4] = "troy_cam_faction_intro_homer_hec_04"
	advice_to_play[5] = "troy_cam_faction_intro_homer_hec_05"
	advice_to_play[6] = "troy_cam_faction_intro_homer_hec_06"
	advice_to_play[7] = "troy_cam_faction_intro_homer_hec_10"
	advice_to_play[8] = "troy_cam_faction_intro_homer_hec_11"
	advice_to_play[9] = "troy_cam_faction_intro_homer_hec_12"
	advice_to_play[10] = "troy_cam_faction_intro_homer_hec_13"

	local subtitle_to_play = {};
	subtitle_to_play[1] = "troy_sub_intro_menelaus"
	subtitle_to_play[2] = "troy_sub_intro_hector"
	subtitle_to_play[3] = "troy_sub_intro_aeneas"
--	subtitle_to_play[1] = "troy_sub_faction_intro_homer_hec_01"
--	subtitle_to_play[2] = "troy_sub_faction_intro_homer_hec_02"
--	subtitle_to_play[3] = "troy_sub_faction_intro_homer_hec_03"
--	subtitle_to_play[4] = "troy_sub_faction_intro_homer_hec_04"
--	subtitle_to_play[5] = "troy_sub_faction_intro_homer_hec_05"
--	subtitle_to_play[6] = "troy_sub_faction_intro_homer_hec_06"
--	subtitle_to_play[7] = "troy_sub_faction_intro_homer_hec_10"
--	subtitle_to_play[8] = "troy_sub_faction_intro_homer_hec_11"
--	subtitle_to_play[9] = "troy_sub_faction_intro_homer_hec_12"
--	subtitle_to_play[10] = "troy_sub_faction_intro_homer_hec_13"

	local cutscene_intro = campaign_cutscene:new(
		"intro_cutscene",										-- string name for this cutscene
		92,													-- length of cutscene in seconds
		function()
			cm:characters_forced_invisible({
				odysseus_forename_id,
				aeneas_forename_id,
				achilles_forename_id,
				agamemnon_forename_id,
				menelaus_forename_id,
				sarpedon_forename_id,
				paris_forename_id
			}, false)

			cm:set_exclusive_visible_labels({})
			out("SCENE ENDED BRUV")
			-- trigger early-game missions
			core:trigger_event("ScriptEventIntroCutsceneFinished")
			-- cm:scroll_camera_from_current(true, 1, hector_starting_camera_position)
		end													-- end callback
	)

	cutscene_intro:set_disable_settlement_labels(true)
	cutscene_intro:set_dismiss_advice_on_end(false)
	cutscene_intro:set_skippable(true)
	cutscene_intro:set_restore_shroud(true)

	cutscene_intro:action(
		function()
			cm:characters_forced_invisible({
				odysseus_forename_id,
				aeneas_forename_id,
				achilles_forename_id,
				agamemnon_forename_id,
				menelaus_forename_id,
				sarpedon_forename_id,
				paris_forename_id
			}, true)
			cm:set_exclusive_visible_labels({
				"troy_main_trj_hector", 
				"troy_main_trj_troy"})
			cm:make_regions_visible_in_shroud_for_faction(cm:get_local_faction_name(), {
				"troy_main_ilion_troy", 
				"troy_main_troas_colonae", 
				"troy_main_dardania_dardanos",
				"troy_main_ilion_thymbra",
				"troy_main_dardania_abydos", 
				"troy_main_melas_sestos", 
				"troy_main_melas_pactya",
				"troy_main_apaesos_percote",
				"troy_main_apaesos_priapos",
				"troy_main_dardania_pityoussa",
				"troy_main_dardania_arisbe",
				"troy_main_apaesos_pegaea",
				"troy_main_ide_zeleia",
				"troy_main_ide_gargara",
				"troy_main_sea_euboiki_thalassa", 
				"troy_main_sporades_skyros", 
				"troy_main_sporades_peparethos", 
				"troy_main_troas_larisa",
				"troy_main_troas_hamaxitos",
				"troy_main_lesbos_methymna",
				"troy_main_lesbos_eressos",
				"troy_main_lesbos_mytilene",
				"troy_main_lemnos_myrina",
				"troy_main_oylympos_dion", 
				"troy_main_perrhaebia_oloosson",
				"troy_main_oylympos_leibethra",
				"troy_main_sea_thrakikon_pelagos", 
				"troy_main_zerynthia_nesoi_imbrasos", 
				"troy_main_zerynthia_nesoi_saos", 
				"troy_main_zerynthia_nesoi_thasos", 
				"troy_main_phlegra_singos", 
				"troy_main_sea_troikos_pelagos", 
				"troy_main_lemnos_poliochne", 
				"troy_main_sea_thermaikos_kolpos", 
				"troy_main_euboea_carystos", 
				"troy_main_euboea_eretria", 
				"troy_main_euboea_chalcis", 
				"troy_main_ellopia_cerinthos", 
				"troy_main_ellopia_histiaea", 
				"troy_main_magnesia_olizon", 
				"troy_main_magnesia_iolcos",
				"troy_main_phthia_pteleon", 
				"troy_main_phthia_alos", 
				"troy_main_phthia_pherae", 
				"troy_main_thessaliotis_pharsalos", 
				"troy_main_thessaliotis_crannon", 
				"troy_main_thessaliotis_arne", 
				"troy_main_magnesia_meliboea", 
				"troy_main_oylympos_larissa", 
				"troy_main_perrhaebia_oechalia", 
				"troy_main_perrhaebia_tricca", 
				"troy_main_cephisos_gla", 
				"troy_main_boeotia_thisbe", 
				"troy_main_cephisos_opous", 
				"troy_main_ozolian_locris_cyparissos", 
				"troy_main_cephisos_alpenos", 
				"troy_main_ozolian_locris_elateia", 
				"troy_main_malis_trachis", 
				"troy_main_malis_oita", 
				"troy_main_ozolian_locris_amphissa",
				"troy_main_argolis_thyrea",
				"troy_main_messenia_tegea",
				"troy_main_attica_thorikos",
				"troy_main_attica_marathon",
				"troy_main_attica_keos",
				"troy_main_attica_athens",
				"troy_main_megaris_salamis",
				"troy_main_megaris_megara",
				"troy_main_megaris_aegina",
				"troy_main_boeotia_thebes",
				"troy_main_boeotia_oropos",
				"troy_main_boeotia_hyria",
				"troy_main_sea_korinthiakos_kolpos",
				"troy_main_sea_mytroon_pelagos",
				"troy_main_attica_keos",
				"troy_main_lacedaemon_sparta",
				"troy_main_lacedaemon_boeae",
				"troy_main_lacedaemon_oitylon",
				"troy_main_argolis_argos",
				"troy_main_mycenaeca_mycenae",
				"troy_main_mycenaeca_stymphalos",
				"troy_main_mycenaeca_corinth",
				"troy_main_tyrinthia_troizen",
				"troy_main_tyrinthia_tiryns",
				"troy_main_tyrinthia_epidayrus",
				"troy_main_syrmata_dryopis",
				"troy_main_epagris_andros",
				"troy_main_messenia_mantineia",
				"troy_main_sea_kritikon_pelagos",
				"troy_main_syrmata_melos",
				"troy_main_erythraea_erythrae",
				"troy_main_erythraea_kyssos",
				"troy_main_ophioussa_volissos",
				"troy_main_ophioussa_vrontados",
				"troy_main_madares_kissamos",
				"troy_main_madares_lappa",
				"troy_main_madares_kydonia",
				"troy_main_madares_aptera",
				"troy_main_ida_phaestos",
				"troy_main_ida_lyttos",
				"troy_main_ida_knossos",
				"troy_main_ida_gortys",
				"troy_main_lasynthos_setaea",
				"troy_main_lasynthos_lato",
				"troy_main_aega_porosilene",
				"troy_main_aega_pedasos",
				"troy_main_teythrania_pitane",
				"troy_main_teythrania_cidaenis",
				"troy_main_astraeos_achyraos",
				"troy_main_aega_lyrnessos",
				"troy_main_aega_thebe_hypoplakia",
				"troy_main_ide_antandros",
				"troy_main_adrastea_pericharaxis",
				"troy_main_adrastea_skepsis",
				"troy_main_adrastea_practios",
				"troy_main_adrastea_adresteia",
				"troy_main_mysia_cyzicos",
				"troy_main_mysia_apollonia",
				"troy_main_mysia_proconnesos",
				"troy_main_sea_ikarion_pelagos",
				"troy_main_cephallenia_hyrie",
				"troy_main_sea_propontis"})

			--TODO:Fix up shroud before cutscene playback 
			cutscene_intro:cindy_playback("script/campaign/main_troy/factions/flyby_cinematics/scenes/flyby_hectormap_r01_s01.CindyScene", 4, 6)
		end,
		0
	);
	cutscene_intro:action(
		function()
		end,
		0
	)

	cutscene_intro:action(
		function()
			cm:show_subtitle(subtitle_to_play[1], false, true);
			cm:callback( function() cm:hide_subtitles() end, 3);
		end,
		5.5
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[1]);
		end,
		10
	);

--	cutscene_intro:action(
--		function()
--			cm:show_subtitle(subtitle_to_play[1], false, true);
--			cm:callback( function() cm:hide_subtitles() end, 13.5)
--		end,
--		10
--	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[2]);
		end,
		13.5
	);

--	cutscene_intro:action(
--		function()
--			cm:show_subtitle(subtitle_to_play[2], false, true);
--			cm:callback( function() cm:hide_subtitles() end, 31.5)
--		end,
--		14
--	);

cutscene_intro:action(
	function()
		cm:show_subtitle(subtitle_to_play[2], false, true);
		cm:callback( function() cm:hide_subtitles() end, 4.4);
	end,
	26.3
);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[3]);
		end,
		31.5
	);

--	cutscene_intro:action(
--		function()
--			cm:show_subtitle(subtitle_to_play[3], false, true);
--			cm:callback( function() cm:hide_subtitles() end, 38.5)
--		end,
--		31.5
--	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[4]);
		end,
		38.5
	);

--	cutscene_intro:action(
--		function()
--			cm:show_subtitle(subtitle_to_play[4], false, true);
--			cm:callback( function() cm:hide_subtitles() end, 46.5)
--		end,
--		38.5
--	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[5]);
		end,
		46.5
	);

--	cutscene_intro:action(
--		function()
--			cm:show_subtitle(subtitle_to_play[5], false, true);
--			cm:callback( function() cm:hide_subtitles() end, 53.5)
--		end,
--		46.5
--	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[6]);
		end,
		53.5
	);

--	cutscene_intro:action(
--		function()
--			cm:show_subtitle(subtitle_to_play[6], false, true);
--			cm:callback( function() cm:hide_subtitles() end, 60.5)
--		end,
--		53.5
--	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[7]);
		end,
		60.5
	);

--	cutscene_intro:action(
--		function()
--			cm:show_subtitle(subtitle_to_play[7], false, true);
--			cm:callback( function() cm:hide_subtitles() end, 62.5)
--		end,
--		60.5
--	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[8]);
		end,
		62.2
	);

	cutscene_intro:action(
		function()
			cm:show_subtitle(subtitle_to_play[3], false, true);
			cm:callback( function() cm:hide_subtitles() end, 4.4);
		end,
		65
	);

--	cutscene_intro:action(
--		function()
--			cm:show_subtitle(subtitle_to_play[8], false, true);
--			cm:callback( function() cm:hide_subtitles() end, 71)
--		end,
--		62.5
--	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[9]);
		end,
		71
	);

--	cutscene_intro:action(
--		function()
--			cm:show_subtitle(subtitle_to_play[9], false, true);
--			cm:callback( function() cm:hide_subtitles() end, 83.5)
--		end,
--		71
--	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[10]);
		end,
		83.5
	);

--	cutscene_intro:action(
--		function()
--			cm:show_subtitle(subtitle_to_play[10], false, true);
--			cm:callback( function() cm:hide_subtitles() end, 87.5)
--		end,
--		83.5
--	);

	cutscene_intro:start()

end
