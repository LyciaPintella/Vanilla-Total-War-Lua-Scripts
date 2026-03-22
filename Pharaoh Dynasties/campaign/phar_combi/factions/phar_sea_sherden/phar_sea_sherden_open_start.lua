-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	OPEN CAMPAIGN INTRO SCRIPT
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

cam_start_x = 512.663452;
cam_start_y = 984.36377;
cam_start_d = 14.080462863281;
cam_start_b = 0;
cam_start_h = 8.230896275513;

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
		local random_start_pos_enabled = (mdm.state["random_startpos"].value == 1) and true or false

		if not random_start_pos_enabled then 
			-- set pre-intro-cutscene camera position
			cm:set_camera_position(cam_start_x, cam_start_y, cam_start_d, cam_start_b, cam_start_h);

			-- put faction-specific calls that should only gets triggered in a new singleplayer game here
			cm:start_intro_cutscene_on_loading_screen_dismissed(play_cutscene_intro)
		else
			core:progress_on_loading_screen_dismissed(
				function()
					cm:position_camera_at_primary_military_force("phar_sea_sherden")
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
	advice_to_play[1] = "phar_cam_faction_intro_merneptah_iol_01" --#0.5#
	advice_to_play[2] = "phar_cam_faction_intro_merneptah_iol_02" --#21.5#
	advice_to_play[3] = "phar_cam_faction_intro_merneptah_iol_03" --#36.2#
	advice_to_play[4] = "phar_cam_faction_intro_merneptah_iol_04" --#60.5#
	advice_to_play[5] = "phar_cam_faction_intro_merneptah_iol_05" --#73#
	advice_to_play[6] = "phar_cam_faction_intro_merneptah_iol_06" --#94.5#
	advice_to_play[7] = "phar_cam_faction_intro_merneptah_iol_07" --#113.5#
	advice_to_play[8] = "phar_cam_faction_intro_merneptah_iol_08" --#129#

	local cutscene_intro = campaign_cutscene:new(
		"intro_cutscene",									-- string name for this cutscene
		156.6,												-- length of cutscene in seconds
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
				wawletes_forename_id,
				iolaos_forename_id,
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
	cutscene_intro:set_dismiss_advice_on_end(false)
	cutscene_intro:set_restore_shroud(true)
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
				wawletes_forename_id,
				iolaos_forename_id,
			}, true)
			
			cm:set_exclusive_visible_labels({ 
				"phar_sea_sherden", 
				"phar_main_kizzuwatna",
				"phar_main_kummanni",
			})
			cm:make_regions_visible_in_shroud_for_faction(cm:get_local_faction_name(), {
				"phar_main_parha_parha",
				"phar_main_parha_isaura",
				"phar_main_south_hatti_tarhuntassa",
				"phar_main_south_hatti_lystra",
				"phar_main_south_hatti_cibyra",
				"phar_main_alashiya_alashiya",
				"phar_main_alashiya_kition",
				"phar_main_alashiya_paphos",
				"phar_main_tuwana_tuwana",
				"phar_main_tuwana_cybistra",
				"phar_main_tuwana_kelenderis",
				"phar_main_tuwana_hubishna",
				"phar_main_tarsus_tarsus",
				"phar_main_tarsus_kyinda",
				"phar_main_tarsus_adana",
				"phar_main_kanesh_kanesh",
				"phar_main_kanesh_kummanni",
				"phar_main_kanesh_saricha",
				"phar_main_hattussa_ankuwa",
				"phar_main_hattussa_arinna",
				"phar_main_hattussa_corniaspa",
				"phar_main_hattussa_hattussa",
				"phar_main_purushanda_purushanda",
				"phar_main_purushanda_nyssa",
				"phar_main_purushanda_mokissos",
				"phar_main_central_hatti_pegella",
				"phar_main_central_hatti_larawanda",
				"phar_main_central_hatti_koropissos",
				"phar_main_sea_kolpos",
				"phar_main_sea_pelagos",
				"phar_main_sea_kath_hemas",
				"phar_main_sea_megale_thalassa",
				"phar_main_sea_aruna",
				"phar_main_sea_huru_yam",
			})

			cutscene_intro:cindy_playback(string.format("script/campaign/phar_combi/factions/phar_camp_flybys/scenes/phar_camp_flyby_iol_r01_s01.CindyScene", id), 0, 2);
		end,
		0
	)

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[1]);
		end,
		0.5
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[2]);
		end,
		21.5
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[3]);
		end,
		36.2
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[4]);
		end,
		60.5
	);

	cutscene_intro:action(
		function()
			cm:characters_forced_invisible({suppi_forename_id}, false);
			cm:show_advice(advice_to_play[5]);
		end,
		73
	);

	cutscene_intro:action(
		function()
			cm:characters_forced_invisible({suppi_forename_id}, false);
			cm:show_advice(advice_to_play[6]);
		end,
		94.5
	);

	cutscene_intro:action(
		function()
			cm:characters_forced_invisible({kurunta_forename_id}, false);
			cm:show_advice(advice_to_play[7]);
		end,
		113.5
	);

	cutscene_intro:action(
		function()
			cm:characters_forced_invisible({iolaos_forename_id}, false);
			cm:show_advice(advice_to_play[8]);
		end,
		129
	);

	cutscene_intro:start()

end
