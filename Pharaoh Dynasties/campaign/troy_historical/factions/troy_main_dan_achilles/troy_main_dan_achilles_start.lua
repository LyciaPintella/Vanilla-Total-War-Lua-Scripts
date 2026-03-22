


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

cam_start_x = 207.69747924805;
cam_start_y = 325.76266479492;
cam_start_d = 6.4913330078125;
cam_start_b = 0;
cam_start_h = 4.6394462585449;

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
		cm:set_camera_position(284.033722, 368.063477, 15.991146, 0, 15.799996);

		-- put faction-specific calls that should only gets triggered in a new singleplayer game here	
		cm:start_intro_cutscene_on_loading_screen_dismissed(
			function()
				cm:show_benchmark_if_required(
					function()						
						start_cutscene_intro()
					end,																					-- function to call if not in benchmark mode
					"script/benchmarks/campaign_benchmark/scenes/menelaus_start.CindyScene",			-- benchmark cindy scene
					59.00,																					-- duration of cindy scene
					100,																					-- cam position x at start of scene
					200,																					-- cam position y at start of scene
					6,																						-- cam position d at start of scene
					0,																						-- cam position b at start of scene
					4																						-- cam position h at start of scene
				);
			end	
		);
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

function start_cutscene_intro()

	local advice_to_play = {};
	advice_to_play[1] = "troy_cam_faction_intro_homer_ach_01"
	advice_to_play[2] = "troy_cam_faction_intro_homer_ach_02"
	advice_to_play[3] = "troy_cam_faction_intro_homer_ach_03"
	advice_to_play[4] = "troy_cam_faction_intro_homer_ach_04"
	advice_to_play[5] = "troy_cam_faction_intro_homer_ach_05"
	advice_to_play[6] = "troy_cam_faction_intro_homer_ach_06"
	advice_to_play[7] = "troy_cam_faction_intro_homer_ach_07"
	advice_to_play[8] = "troy_cam_faction_intro_homer_ach_08"
	advice_to_play[9] = "troy_cam_faction_intro_homer_ach_09"

	local subtitle_to_play = {};
	subtitle_to_play[1] = "troy_sub_intro_hector"
	subtitle_to_play[2] = "troy_sub_intro_achilles"
	--subtitle_to_play[1] = "troy_sub_faction_intro_homer_ach_01"
	--subtitle_to_play[2] = "troy_sub_faction_intro_homer_ach_02"
	--subtitle_to_play[3] = "troy_sub_faction_intro_homer_ach_03"
	--subtitle_to_play[4] = "troy_sub_faction_intro_homer_ach_04"
	--subtitle_to_play[5] = "troy_sub_faction_intro_homer_ach_05"
	--subtitle_to_play[6] = "troy_sub_faction_intro_homer_ach_06"
	--subtitle_to_play[7] = "troy_sub_faction_intro_homer_ach_07"
	--subtitle_to_play[8] = "troy_sub_faction_intro_homer_ach_08"
	--subtitle_to_play[9] = "troy_sub_faction_intro_homer_ach_09"

	local cutscene_intro = campaign_cutscene:new(
		"intro_cutscene",									-- string name for this cutscene
		81,													-- length of cutscene in seconds
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
			-- local x, y, d, b, h = cm:get_camera_position()
			-- cm:callback(function() cm:set_camera_position(x, y, d, 0, h) end, 0.1);
			--cm:callback(function() cm:set_camera_position(cam_start_x, cam_start_y, cam_start_d, 0, cam_start_h) end, 0.5);
		end													-- end callback
	)

	--cutscene_intro:set_debug();
	cutscene_intro:set_skippable(true, function() end)
	-- cutscene_intro:set_skip_camera(cam_start_x, cam_start_y, cam_start_d, 0, cam_start_h)
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

			cm:set_exclusive_visible_labels({ 
			"troy_main_trj_troy", 
			"troy_main_dan_dolopians",
			"troy_main_dan_achilles"})
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
			"troy_main_ozolian_locris_amphissa"})
			
			cutscene_intro:cindy_playback("script/campaign/main_troy/factions/flyby_cinematics/scenes/flyby_achillesmap_r01_s01.CindyScene", 4, 2);
		end,
		0
	);

	cutscene_intro:action(
		function()
			cm:characters_forced_invisible({achilles_forename_id}, false);
		end,
		50
	);
	
	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[1]);
		end,
		1
	);

	--cutscene_intro:action(
		--function()
			--cm:show_subtitle(subtitle_to_play[1], false, true);
			--cm:callback( function() cm:hide_subtitles() end, 10)
		--end,
		--1
	--);

	cutscene_intro:action(
		function()
			cm:show_subtitle(subtitle_to_play[1], false, true);
			cm:callback( function() cm:hide_subtitles() end, 4.4);
		end,
		11
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[2]);
		end,
		15.5
	);

	--cutscene_intro:action(
		--function()
			--cm:show_subtitle(subtitle_to_play[2], false, true);
			--cm:callback( function() cm:hide_subtitles() end, 22.5)
		--end,
		--15.5
	--);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[3]);
		end,
		23
	);

	cutscene_intro:action(
		function()
			cm:show_subtitle(subtitle_to_play[2], false, true);
			cm:callback( function() cm:hide_subtitles() end, 3.8);
		end,
		30.5
	);

	--cutscene_intro:action(
		--function()
			--cm:show_subtitle(subtitle_to_play[3], false, true);
			--cm:callback( function() cm:hide_subtitles() end, 26)
		--end,
		--23
	--);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[4]);
		end,
		34.5
	);

	--cutscene_intro:action(
		--function()
			--cm:show_subtitle(subtitle_to_play[4], false, true);
			--cm:callback( function() cm:hide_subtitles() end, 40)
		--end,
		--35
	--);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[5]);
		end,
		40.13
	);

	--cutscene_intro:action(
		--function()
			--cm:show_subtitle(subtitle_to_play[5], false, true);
			--cm:callback( function() cm:hide_subtitles() end, 50.5)
		--end,
		--40.1
	--);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[6]);
		end,
		51
	);

	--cutscene_intro:action(
		--function()
			--cm:show_subtitle(subtitle_to_play[6], false, true);
			--cm:callback( function() cm:hide_subtitles() end, 55)
		--end,
		--51
	--);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[7]);
		end,
		55
	);

	--cutscene_intro:action(
		--function()
			--cm:show_subtitle(subtitle_to_play[7], false, true);
			--cm:callback( function() cm:hide_subtitles() end, 65)
		--end,
		--55
	--);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[8]);
		end,
		65
	);

	--cutscene_intro:action(
		--function()
			--cm:show_subtitle(subtitle_to_play[8], false, true);
			--cm:callback( function() cm:hide_subtitles() end, 72.5)
		--end,
		--65
	--);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[9]);
		end,
		73
	);

	--cutscene_intro:action(
		--function()
			--cm:show_subtitle(subtitle_to_play[9], false, true);
			--cm:callback( function() cm:hide_subtitles() end, 79)
		--end,
		--73
	--);

	cutscene_intro:start()

end






