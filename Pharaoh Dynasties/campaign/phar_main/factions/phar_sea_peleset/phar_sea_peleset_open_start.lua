-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	OPEN CAMPAIGN INTRO SCRIPT
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

cam_start_x = 492.501648;
cam_start_y = 796.804443;
cam_start_d = 18.823234863281;
cam_start_b = 0;
cam_start_h = 18.238054275513;

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
hanno_forename_id = "1328216600";
biridiya_forename_id = "1726620278";

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
					cm:position_camera_at_primary_military_force("phar_sea_peleset")
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
	advice_to_play[1] = "phar_cam_faction_intro_merneptah_wal_01" --#0.5#
	advice_to_play[2] = "phar_cam_faction_intro_merneptah_wal_02" --#26#
	advice_to_play[3] = "phar_cam_faction_intro_merneptah_wal_03" --#41#
	advice_to_play[4] = "phar_cam_faction_intro_merneptah_wal_04" --#52.5#
	advice_to_play[5] = "phar_cam_faction_intro_merneptah_wal_05" --#71#
	advice_to_play[6] = "phar_cam_faction_intro_merneptah_wal_06" --#92.5#
	advice_to_play[7] = "phar_cam_faction_intro_merneptah_wal_07" --#114.7#
	advice_to_play[8] = "phar_cam_faction_intro_merneptah_wal_08" --#133.6#

	local cutscene_intro = campaign_cutscene:new(
		"intro_cutscene",									-- string name for this cutscene
		157,												-- length of cutscene in seconds
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
				iolaos_forename_id,
				wawletes_forename_id,
				hanno_forename_id,
				Biridiya_forename_id,
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
				iolaos_forename_id,
				wawletes_forename_id,
				hanno_forename_id,
				Biridiya_forename_id,
			}, true)
			
			cm:set_exclusive_visible_labels({ 
				"phar_sea_peleset", 
				"phar_main_megiddo",
				"phar_main_ashkelon",
				"phar_main_bay",
				"phar_main_urushalim",	
			})
			cm:make_regions_visible_in_shroud_for_faction(cm:get_local_faction_name(), {
				"phar_main_megiddo_yapo",
				"phar_main_megiddo_megiddo",
				"phar_main_shechem_ammon",
				"phar_main_shechem_sakka",
				"phar_main_shechem_shechem",
				"phar_main_ashkelon_ashkelon",
				"phar_main_ashkelon_urushalim",
				"phar_main_ashkelon_pel",
				"phar_main_north_sinai_azzati",
				"phar_main_north_sinai_neb_gehes",
				"phar_main_north_sinai_nekhel",
				"phar_main_north_sinai_sukkot",
				"phar_main_east_sinai_beersheba",
				"phar_main_east_sinai_khet_khefti",
				"phar_main_shechem_shechem",
				"phar_main_shechem_sakka",
				"phar_main_shechem_ammon",
				"phar_main_damascus_damascus",
				"phar_main_damascus_jawa",
				"phar_main_damascus_sedad",
				"phar_main_damascus_tadmor",
				"phar_main_tyre_byblos",
				"phar_main_tyre_hazor",
				"phar_main_tyre_sidon",
				"phar_main_tyre_tyre",
				"phar_main_sea_wadj_ur",
				"phar_main_sea_ha_yam",
				"phar_main_sea_yam",
				"phar_main_sea_hapi",
				"phar_main_sea_huru_yam",
				"phar_main_sea_thalassa",
				"phar_main_buto_buto",
				"phar_main_buto_paiuenamun",
				"phar_main_buto_sais",
				"phar_main_faiyum_dahshur",
				"phar_main_faiyum_faiyum",
				"phar_main_faiyum_khem",
				"phar_main_memphis_helwan",
				"phar_main_memphis_memphis",
				"phar_main_memphis_petpeh",
				"phar_main_pi_ramesses_per_amun",
				"phar_main_pi_ramesses_pi_ramesses",
				"phar_main_pi_ramesses_tjaru",
				"phar_main_rhacotis_khan_aha",
				"phar_main_rhacotis_qema",
				"phar_main_rhacotis_rhacotis",
				"phar_main_sea_nile_faiyum",
				"phar_main_heliopolis_heliopolis",
				"phar_main_heliopolis_qes",
				"phar_main_sea_nile_delta",
			})

			cutscene_intro:cindy_playback(string.format("script/campaign/phar_main/factions/phar_camp_flybys/scenes/phar_camp_flyby_wal_r01_s01.CindyScene", id), 0, 2);
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
		26
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[3]);
		end,
		41
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[4]);
		end,
		52.5
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[5]);
		end,
		71
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[6]);
		end,
		92.5
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[7]);
			cm:characters_forced_invisible({bay_forename_id}, false);
		end,
		114.7
	);

	cutscene_intro:action(
		function()
			cm:characters_forced_invisible({wawletes_forename_id}, false);
			cm:show_advice(advice_to_play[8]);
		end,
		133.6
	);

	cutscene_intro:start()

end
