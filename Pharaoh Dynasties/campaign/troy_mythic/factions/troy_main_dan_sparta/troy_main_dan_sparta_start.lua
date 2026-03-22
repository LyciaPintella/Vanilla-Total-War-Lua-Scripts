


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

cam_start_x = 209.24931335449;
cam_start_y = 165.33224487305;
cam_start_d = 5.2848815917969;
cam_start_b = 0;
cam_start_h = 4.1976022720337;

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
--	Intro Cutscene
---------------------------------------------------------------
--[[
-- function cutscene_intro_play()
	-- out("cutscene_intro_play() called - first turn MAIN");
	
	-- local advice_to_play = {};
	-- advice_to_play[1] = "dlc09.camp.vortex.khalida.intro.001";
	-- advice_to_play[2] = "dlc09.camp.vortex.khalida.intro.002";
	-- advice_to_play[3] = "dlc09.camp.vortex.khalida.intro.003";
	-- advice_to_play[4] = "dlc09.camp.vortex.khalida.intro.004";
	-- advice_to_play[5] = "dlc09.camp.vortex.khalida.intro.005";
	
	-- local cutscene_intro = campaign_cutscene:new(
		-- cm:get_local_faction_name(true) .. "_intro",							-- string name for this cutscene
		-- 61,																-- length of cutscene in seconds
		-- function() start_open_campaign_from_intro_cutscene() end		-- end callback
	-- );

	-- --cutscene_intro:set_debug();
	-- cutscene_intro:set_skippable(true, function() cutscene_intro_skipped(advice_to_play) end);
	-- cutscene_intro:set_skip_camera(cam_start_x, cam_start_y, cam_start_d, cam_start_b, cam_start_h);
	-- cutscene_intro:set_disable_settlement_labels(false);
	-- cutscene_intro:set_dismiss_advice_on_end(false);
	
	-- cutscene_intro:action(
		-- function()
			-- cm:show_shroud(false);
			-- cm:set_camera_position(cam_start_x, cam_start_y, cam_start_d, cam_start_b, cam_start_h);
		-- end,
		-- 0
	-- );
	
	-- cutscene_intro:action(
		-- function()
			-- cm:show_advice(advice_to_play[1]);
		-- end,
		-- 1
	-- );
	
	-- cutscene_intro:action(
		-- function()
			-- cutscene_intro:wait_for_advisor()
		-- end,
		-- 11.5
	-- );
	
	-- cutscene_intro:action(
		-- function()
			-- cm:show_advice(advice_to_play[2]);
		-- end,
		-- 12
	-- );
		
	-- cutscene_intro:action(
		-- function()
			-- cutscene_intro:wait_for_advisor()
		-- end,
		-- 19
	-- );
	
	-- cutscene_intro:action(
		-- function()
			-- cm:show_advice(advice_to_play[3]);
		-- end,
		-- 19.5
	-- );
	
	-- cutscene_intro:action(
		-- function()
			-- cutscene_intro:wait_for_advisor()
		-- end,
		-- 33.5
	-- );
	
	-- cutscene_intro:action(
		-- function()
			-- cm:show_advice(advice_to_play[4]);
		-- end,
		-- 34
	-- );
	
	-- cutscene_intro:action(
		-- function()
			-- cutscene_intro:wait_for_advisor()
		-- end,
		-- 50.5
	-- );
	
	-- cutscene_intro:action(
		-- function()
			-- cm:show_advice(advice_to_play[5]);
		-- end,
		-- 51
	-- );
	
	-- cutscene_intro:start();
-- end;

-- function cutscene_intro_skipped(advice_to_play)
	-- cm:override_ui("disable_advice_audio", true);
	
	-- -- clear advice history, and then show all the advice for the intro cutscene
	-- common.clear_advice_session_history();
	-- for i = 1, #advice_to_play do
		-- cm:show_advice(advice_to_play[i]);
	-- end;
	
	-- cm:callback(function() cm:override_ui("disable_advice_audio", false) end, 0.5);
-- end;

---------------------------------------------------------------
--	Get CQI of player legendary lord
--	(and any other characters we want)
---------------------------------------------------------------

-- if cm:is_multiplayer() then
	-- out("MP campaign script loaded for " .. cm:get_local_faction_name(true));
-- else
	-- player_legendary_lord_char_cqi = cm:get_cached_value(
		-- "player_legendary_lord_char_cqi",
		-- function()
			-- local character = cm:get_faction(cm:get_local_faction_name()):faction_leader();
			-- if character then
				-- return character:cqi();
			-- end;
		-- end
	-- );

	-- out("SP campaign script loaded for " .. cm:get_local_faction_name() .. ", player_legendary_lord_char_cqi is " .. tostring(player_legendary_lord_char_cqi));
-- end;





---------------------------------------------------------------
--	Loading faction scripts
---------------------------------------------------------------

cm:load_global_script(cm:get_local_faction_name(true) .. "_open_start", true);				-- sp only
	






]]
---------------------------------------------------------------
--	First-Tick callbacks
---------------------------------------------------------------

cm:add_first_tick_callback_sp_new(
	function()
		-- set pre-intro-cutscene camera position
		cm:set_camera_position(218.149048, 105.926163, 15.991149, 0, 13.0);
		
		-- put faction-specific calls that should only gets triggered in a new singleplayer game here
		cm:start_intro_cutscene_on_loading_screen_dismissed(cutscene_intro_menelaus)
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
		cm:make_regions_visible_in_shroud_for_faction(cm:get_local_faction_name(), {
			"troy_main_syrmata_melos",
			"troy_main_madares_kissamos",
			"troy_main_cyclades_ios",
			"troy_main_madares_lappa"
		})
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

function cutscene_intro_menelaus()

	local advice_to_play = {};
	advice_to_play[1] = "troy_cam_faction_intro_homer_men_01"
	advice_to_play[2] = "troy_cam_faction_intro_homer_men_03"
	advice_to_play[3] = "troy_cam_faction_intro_homer_men_04"
	advice_to_play[4] = "troy_cam_faction_intro_homer_men_05"
	advice_to_play[5] = "troy_cam_faction_intro_homer_men_06"

	local subtitle_to_play = {};
	subtitle_to_play[1] = "troy_sub_intro_menelaus"
	subtitle_to_play[2] = "troy_sub_intro_agamemnon"
	--subtitle_to_play[1] = "troy_sub_faction_intro_homer_men_01"
	--subtitle_to_play[2] = "troy_sub_faction_intro_homer_men_03"
	--subtitle_to_play[3] = "troy_sub_faction_intro_homer_men_04"
	--subtitle_to_play[4] = "troy_sub_faction_intro_homer_men_05"
	--subtitle_to_play[5] = "troy_sub_faction_intro_homer_men_06"

	local cutscene_intro = campaign_cutscene:new(
	"intro_cutscene",									-- string name for this cutscene
	74,												-- length of cutscene in seconds
	function()
		cm:characters_forced_invisible({
			odysseus_forename_id,
			aeneas_forename_id,
			achilles_forename_id,
			agamemnon_forename_id,
			menelaus_forename_id,
			hector_forename_id,
			sarpedon_forename_id,
			paris_forename_id
		}, false)

		cm:set_exclusive_visible_labels({})

		-- trigger early-game missions
		core:trigger_event("ScriptEventIntroCutsceneFinished")
		--cm:callback(function() cm:set_camera_position(cam_start_x, cam_start_y, cam_start_d, 0, cam_start_h) end, 0.5);
		cm:make_regions_visible_in_shroud_for_faction(cm:get_local_faction_name(), {
			"troy_main_syrmata_melos",
			"troy_main_madares_kissamos",
			"troy_main_cyclades_ios",
			"troy_main_madares_lappa"
		})
	end,												-- end callback
	true
	)

	--cutscene_intro:set_debug();
	cutscene_intro:set_skippable(true, function() end)
	--cutscene_intro:set_skip_camera(cam_start_x, cam_start_y, cam_start_d, 0, cam_start_h)
	cutscene_intro:set_disable_settlement_labels(true)
	cutscene_intro:set_dismiss_advice_on_end(false)
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
				paris_forename_id
			}, true)
			cm:set_exclusive_visible_labels({"troy_main_dan_achilles", 
			"troy_main_trj_troy", 
			"troy_main_dan_mycenae",
			"troy_main_dan_sparta"})
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
			"troy_main_cephallenia_ithaca", 
			"troy_main_cephallenia_same", 
			"troy_main_cephallenia_hyrie",
			"troy_main_aegialeia_olenos", 
			"troy_main_aegialeia_aroe",
			"troy_main_aegialeia_cleitor",
			"troy_main_aegialeia_aegion",
			"troy_main_sea_korinthiakos_kolpos",
			"troy_main_sea_mytroon_pelagos",
			"troy_main_attica_keos",
			"troy_main_syrmata_dryopis",
			"troy_main_epagris_andros",
			"troy_main_messenia_mantineia",
			"troy_main_sea_kritikon_pelagos",
			"troy_main_syrmata_melos",
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
			"troy_main_cyclades_naxos",
			"troy_main_sea_ionion_pelagos"})

			cutscene_intro:cindy_playback("script/campaign/main_troy/factions/flyby_cinematics/scenes/flyby_menelausmap_r01_s01.CindyScene", 4, 2);
		end,
		0
	)

	cutscene_intro:action(
		function()
			cm:characters_forced_invisible({menelaus_forename_id}, false);
		end,
		34
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[1]);
		end,
		0.5
	);

--	cutscene_intro:action(
--		function()
--			cm:show_subtitle(subtitle_to_play[1], false, true);
--			cm:callback( function() cm:hide_subtitles() end, 10)
--		end,
--		0.5
--	);

	cutscene_intro:action(
		function()
			cm:show_subtitle(subtitle_to_play[1], false, true);
			cm:callback( function() cm:hide_subtitles() end, 3);
		end,
		10.5
);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[2]);
		end,
		14
	);

	cutscene_intro:action(
		function()
			cm:show_subtitle(subtitle_to_play[2], false, true);
			cm:callback( function() cm:hide_subtitles() end, 5);
		end,
		21
	);

--	cutscene_intro:action(
--		function()
--			cm:show_subtitle(subtitle_to_play[2], false, true);
--			cm:callback( function() cm:hide_subtitles() end, 20)
--		end,
--		14
--	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[3]);
		end,
		28
	);

--	cutscene_intro:action(
--		function()
--			cm:show_subtitle(subtitle_to_play[3], false, true);
--			cm:callback( function() cm:hide_subtitles() end, 45)
--		end,
--		28
--	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[4]);
		end,
		45
	);
	
--	cutscene_intro:action(
--		function()
--			cm:show_subtitle(subtitle_to_play[4], false, true);
--			cm:callback( function() cm:hide_subtitles() end, 58)
--		end,
--		45
--	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[5]);
		end,
		58
	);

--	cutscene_intro:action(
--		function()
--			cm:show_subtitle(subtitle_to_play[5], false, true);
--			cm:callback( function() cm:hide_subtitles() end, 71.5)
--		end,
--		58
--	);

	cutscene_intro:start()

end
