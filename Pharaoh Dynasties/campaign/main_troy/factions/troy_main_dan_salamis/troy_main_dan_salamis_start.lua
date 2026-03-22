


-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	FACTION SCRIPT
--
--	Custom script for this faction starts here. This script loads in additional
--	scripts depending on the mode the campaign is being started in (first turn vs
--	open), sets up the faction_start object and does some other things
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

cam_start_x = 377.8;
cam_start_y = 393.247894;
cam_start_d = 15.4;
cam_start_b = 0;
cam_start_h = 14.8;


odysseus_forename_id = "675962708";
aeneas_forename_id = "741051588";
paris_forename_id = "280733261";
achilles_forename_id = "533763757";
agamemnon_forename_id = "610463016";
menelaus_forename_id = "923017616";
hector_forename_id = "2060800581";
sarpedon_forename_id = "1900383194";
ajax_forename_id = "648162272";
diomedes_forename_id = "1248830096";
start_pos_army_to_beat_lookup = "";




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
		cm:set_camera_position(cam_start_x, cam_start_y, cam_start_d, cam_start_b, cam_start_h);
		local local_faction_key = cm:get_local_faction_name(true)
		if start_pos_army_to_beat_lookup == "" and start_pos_armies_to_beat[local_faction_key].cqi then
			start_pos_army_to_beat_lookup = cm:char_lookup_str(start_pos_armies_to_beat[local_faction_key].cqi)
		end
		--cm:start_intro_cutscene_on_loading_screen_dismissed(function() cutscene_intro_play() end);
		cm:start_intro_cutscene_on_loading_screen_dismissed(start_cutscene_intro)
	end
);


cm:add_first_tick_callback_mp_new(
	function() 
		-- put faction-specific calls that should only gets triggered in a new multiplayer game here
		core:progress_on_loading_screen_dismissed(
			function()
				cm:position_camera_at_primary_military_force(cm:get_local_faction_name(true))
			end
		)
	end
);


cm:add_first_tick_callback_sp_each(
	function() 
		-- put faction-specific calls that should get triggered each time a singleplayer game loads here
	end
);


cm:add_first_tick_callback_mp_each(
	function()
		-- put faction-specific calls that should get triggered each time a multiplayer game loads here
	end
);






---------------------------------------------------------------
--	Intro cutscene
---------------------------------------------------------------

function start_cutscene_intro()

	local advice_to_play = {};
	advice_to_play[1] = "troy_adi_cam_faction_intro_homer_ajx_01"
	advice_to_play[2] = "troy_adi_cam_faction_intro_homer_ajx_02"
	advice_to_play[3] = "troy_adi_cam_faction_intro_homer_ajx_03"
	advice_to_play[4] = "troy_adi_cam_faction_intro_homer_ajx_04"
	advice_to_play[5] = "troy_adi_cam_faction_intro_homer_ajx_05"
	advice_to_play[6] = "troy_adi_cam_faction_intro_homer_ajx_06"
	advice_to_play[7] = "troy_adi_cam_faction_intro_homer_ajx_07"

	local subtitle_to_play = {};
	subtitle_to_play[1] = "troy_sub_intro_hector"
	subtitle_to_play[2] = "troy_adi_sub_intro_ajax"
	subtitle_to_play[3] = "troy_sub_intro_menelaus"

	local cutscene_intro = campaign_cutscene:new(
		"intro_cutscene",									-- string name for this cutscene
		90.5,													-- length of cutscene in seconds
		function() 
			cm:characters_forced_invisible({
				odysseus_forename_id,
				aeneas_forename_id,
				achilles_forename_id,
				agamemnon_forename_id,
				menelaus_forename_id,
				hector_forename_id,
				sarpedon_forename_id,
				paris_forename_id,
				ajax_forename_id,
				diomedes_forename_id
			}, false)
			cm:character_forced_invisible(start_pos_army_to_beat_lookup, false)

			cm:set_exclusive_visible_labels({})

			-- trigger early-game missions
			out("TRIGGERING END")
			core:trigger_event("ScriptEventIntroCutsceneFinished")
		end,
		true													-- end callback
	)

	cutscene_intro:set_disable_settlement_labels(true)
	cutscene_intro:set_dismiss_advice_on_end(false)
	cutscene_intro:set_skippable(true, start_faction)
	cutscene_intro:set_restore_shroud(true)

	cutscene_intro:action(
		function()
			cm:characters_forced_invisible({
				odysseus_forename_id,
				aeneas_forename_id,
				achilles_forename_id,
				agamemnon_forename_id,
				menelaus_forename_id,
				hector_forename_id,
				sarpedon_forename_id,
				paris_forename_id,
				ajax_forename_id,
				diomedes_forename_id
			}, true)
			cm:character_forced_invisible(start_pos_army_to_beat_lookup, true)
			cm:set_exclusive_visible_labels({"troy_main_dan_achilles", 
			"troy_main_trj_troy", 
			"troy_main_dan_mycenae",
			"troy_main_dan_sparta",
			"troy_main_dan_salamis",
			"troy_main_dan_epidayrus",
			"troy_main_dan_athina"})
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
			"troy_main_aegialeia_olenos", 
			"troy_main_aegialeia_aroe",
			"troy_main_aegialeia_cleitor",
			"troy_main_aegialeia_aegion",
			"troy_main_mycenaeca_mycenae",
			"troy_main_mycenaeca_corinth",
			"troy_main_mycenaeca_stymphalos",
			"troy_main_cephallenia_hyrie",
			"troy_main_elis_altis",
			"troy_main_elis_aliphera", 
			"troy_main_elis_myrsinos",
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
			"troy_main_syrmata_dryopis",
			"troy_main_epagris_andros",
			"troy_main_messenia_mantineia"}) 

			cutscene_intro:cindy_playback("script/campaign/main_troy/factions/flyby_cinematics/scenes/flyby_ajax_r01_s01.CindyScene", 4, 2);
		end,
		0
	)

	cutscene_intro:action(
		function()
			cm:characters_forced_invisible({ajax_forename_id}, false);
		end,
		33
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[1]);
		end,
		2
	);

	cutscene_intro:action(
		function()
			cm:show_subtitle(subtitle_to_play[1], false, true);
			cm:callback( function() cm:hide_subtitles() end, 4.4);
		end,
		9
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[2]);
		end,
		14.5
	);

	cutscene_intro:action(
		function()
			cm:show_subtitle(subtitle_to_play[2], false, true);
			cm:callback( function() cm:hide_subtitles() end, 4.4);
		end,
		27.6
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[3]);
		end,
		33
	);


	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[4]);
		end,
		43
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[5]);
		end,
		56.5
	);

	cutscene_intro:action(
		function()
			cm:show_subtitle(subtitle_to_play[3], false, true);
			cm:callback( function() cm:hide_subtitles() end, 3);
		end,
		75
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[6]);
		end,
		63
	);
	
	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[7]);
		end,
		79.5
	);

	cutscene_intro:start()

end