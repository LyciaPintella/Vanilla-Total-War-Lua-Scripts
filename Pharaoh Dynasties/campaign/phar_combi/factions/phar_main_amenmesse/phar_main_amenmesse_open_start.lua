-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	OPEN CAMPAIGN INTRO SCRIPT
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

cam_start_x = 309.95043945312;
cam_start_y = 209.80332946777;
cam_start_d = 14.013107299805;
cam_start_b = 0;
cam_start_h = 18.238740921021;

ramesses_forename_id = "266691888";
seti_forename_id = "599305130";
tausret_forename_id = "862248711";
amenmesse_forename_id = "922529854";
irsu_forename_id = "792338714";
bay_forename_id = "1366019581";
suppi_forename_id = "594798676";
kurunta_forename_id = "697761829";
wawletes_forename_id = "1125480268";
iolaos_forename_id = "341405456";

---------------------------------------------------------------
--	First-Tick callbacks
---------------------------------------------------------------

cm:add_first_tick_callback_sp_new(
	function()
		local random_start_pos_enabled = (mdm.state["random_startpos"] and mdm.state["random_startpos"].value == 1) and true or false

		if not random_start_pos_enabled then 
			-- set pre-intro-cutscene camera position
			cm:set_camera_position(cam_start_x, cam_start_y, cam_start_d, cam_start_b, cam_start_h);

			-- put faction-specific calls that should only gets triggered in a new singleplayer game here
			cm:start_intro_cutscene_on_loading_screen_dismissed(
				function()
					cm:show_benchmark_if_required(
						function()
							play_cutscene_intro()
						end,																					-- function to call if not in benchmark mode
						"script/benchmarks/phar_campaign_benchmark/scenes/amenmesse_start.CindyScene",			-- benchmark cindy scene
						120.00,																					-- duration of cindy scene
						435,																					-- cam position x at start of scene
						690,																					-- cam position y at start of scene
						18,																						-- cam position d at start of scene
						0,																						-- cam position b at start of scene
						4																						-- cam position h at start of scene
					);
				end
			);
		else
			core:progress_on_loading_screen_dismissed(
				function()
					cm:position_camera_at_primary_military_force("phar_main_amenmesse")
				end
			);
		end
	end
);

cm:add_first_tick_callback_sp_each(
	function() 
		-- put faction-specific calls that should get triggered each time a singleplayer game loads here
	end
);

---------------------------------------------------------------
--	Intro cutscene
---------------------------------------------------------------

function play_cutscene_intro()

	cm:disable_event_feed_events(true, "", "", "diplomacy_faction_encountered")
	
	local advice_to_play = {};
	advice_to_play[1] = "phar_cam_faction_intro_merneptah_ame_01" --#1#
	advice_to_play[2] = "phar_cam_faction_intro_merneptah_ame_02" --#16.6#
	advice_to_play[3] = "phar_cam_faction_intro_merneptah_ame_03" --#36.3#
	advice_to_play[4] = "phar_cam_faction_intro_merneptah_ame_04" --#50#
	advice_to_play[5] = "phar_cam_faction_intro_merneptah_ame_05" --#62.3#
	advice_to_play[6] = "phar_cam_faction_intro_merneptah_ame_06" --#72.8#

	local cutscene_intro = campaign_cutscene:new(
		"intro_cutscene",									-- string name for this cutscene
		83,												-- length of cutscene in seconds
		function()
			cm:characters_forced_invisible({
				ramesses_forename_id,
				seti_forename_id,
				tausret_forename_id,
				amenmesse_forename_id,
				irsu_forename_id,
				bay_forename_id,
				suppi_forename_id,
				kurunta_forename_id,
			}, false)
			out("Cutscene finished")
			cm:set_exclusive_visible_labels({})
			uim:override("disable_ers"):unlock()
			cm:disable_event_feed_events(false, "", "", "diplomacy_faction_encountered")
			core:trigger_event("ScriptEventIntroCutsceneFinished")
			cm:dismiss_advice()
		end,												-- end callback
		true
	)

	--cutscene_intro:set_debug();
	cutscene_intro:set_skippable(true, function() end)
	--cutscene_intro:set_skip_camera(cam_start_x, cam_start_y, cam_start_d, 0, cam_start_h)
	cutscene_intro:set_disable_settlement_labels(false)
	cutscene_intro:set_restore_shroud(false)
	uim:override("disable_ers"):lock()

	cutscene_intro:action(
		function()
			cm:characters_forced_invisible({
				ramesses_forename_id,
				seti_forename_id,
				tausret_forename_id,
				amenmesse_forename_id,
				irsu_forename_id,
				bay_forename_id,
				suppi_forename_id,
				kurunta_forename_id,
			}, true)
			
			cm:set_exclusive_visible_labels({ 
				"phar_main_amenmesse", 
				"phar_main_kawa",
				"phar_main_napata",
				"phar_main_kerma",
				"phar_main_buhen",
			})
			cm:make_regions_visible_in_shroud_for_faction(cm:get_local_faction_name(), {
				"phar_main_east_nubia_khefti_gehes",
				"phar_main_east_nubia_tep_heb",
				"phar_main_east_nubia_ti_neb",
				"phar_main_dungul_oasis_dungul_asis",
				"phar_main_dungul_oasis_tem_pa",
				"phar_main_dungul_oasis_thes",
				"phar_main_dungul_oasis_utch",
				"phar_main_napata_hem_shema",
				"phar_main_napata_napata",
				"phar_main_napata_res_khet",
				"phar_main_napata_res_tua",				
				"phar_main_sea_nile_first_cataract",
				"phar_main_sea_nile_second_cataract",
				"phar_main_sea_nile_thrid_cataract",
				"phar_main_sea_nile_fourth_cataract",
				"phar_main_kawa_abu_ab",
				"phar_main_kawa_kawa",
				"phar_main_kawa_khus_qes",
				"phar_main_buhen_buhen",
				"phar_main_buhen_hap_au",
				"phar_main_buhen_her_hetem",
				"phar_main_buhen_shesp_ma",
				"phar_main_north_nubia_miam",
				"phar_main_north_nubia_mu_ua",
				"phar_main_north_nubia_res_pa",
				"phar_main_elephantine_elephantine",
				"phar_main_elephantine_hierakonpolis",
				"phar_main_elephantine_mes",
				"phar_main_elephantine_tep_hetem",
				"phar_main_kerma_kerma",
				"phar_main_kerma_mu_sh",
				"phar_main_kerma_nu_abu",
				"phar_main_kerma_uab_khu",
			})

			local id = cm:get_local_faction(true):faction_leader():has_special_character_skin_equipped() and "02" or "01"
			cutscene_intro:cindy_playback(string.format("script/campaign/phar_combi/factions/phar_camp_flybys/scenes/phar_camp_flyby_ame_r01_s%s.CindyScene", id), 0, 2);
		end,
		0
	)

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[1]);
		end,
		1
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[2]);
		end,
		16.6
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[3]);
		end,
		36.3
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[4]);
		end,
		50
	);

	cutscene_intro:action(
		function()
			cm:characters_forced_invisible({amenmesse_forename_id}, false);
			cm:show_advice(advice_to_play[5]);
		end,
		62.3
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[6]);
		end,
		72.8
	);

	cutscene_intro:start()

end