-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	OPEN CAMPAIGN INTRO SCRIPT
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

cam_start_x = 374.74621582031;
cam_start_y = 976.12542724609;
cam_start_d = 14.013305664062;
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
					cm:position_camera_at_primary_military_force("phar_main_kurunta")
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
	advice_to_play[1] = "phar_cam_faction_intro_merneptah_kur_01" --#1s#
	advice_to_play[2] = "phar_cam_faction_intro_merneptah_kur_02" --#23s#
	advice_to_play[3] = "phar_cam_faction_intro_merneptah_kur_03" --#38.5s#
	advice_to_play[4] = "phar_cam_faction_intro_merneptah_kur_04" --#56s#
	advice_to_play[5] = "phar_cam_faction_intro_merneptah_kur_05" --#79.5s#


	local cutscene_intro = campaign_cutscene:new(
		"intro_cutscene",									-- string name for this cutscene
		104,												-- length of cutscene in seconds
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
				"phar_main_alashiya", 
				"phar_main_kurunta",
			})
			cm:make_regions_visible_in_shroud_for_faction(cm:get_local_faction_name(), {
				"phar_main_central_hatti_koropissos",
				"phar_main_central_hatti_larawanda",
				"phar_main_central_hatti_pegella",
				"phar_main_zippalanda_amaseia",
				"phar_main_zippalanda_nerik",
				"phar_main_zippalanda_sapinuwa",
				"phar_main_zippalanda_zippalanda",
				"phar_main_kanesh_kanesh",
				"phar_main_kanesh_kummanni",
				"phar_main_kanesh_saricha",
				"phar_main_ancyra_ancyra",
				"phar_main_ancyra_aspona",
				"phar_main_ancyra_lagania",
				"phar_main_west_hatti_abrostola",
				"phar_main_west_hatti_dorylaion",
				"phar_main_west_hatti_gordion",
				"phar_main_west_hatti_pessinus",
				"phar_main_alashiya_alashiya",
				"phar_main_alashiya_kition",
				"phar_main_alashiya_paphos",
				"phar_main_parha_isaura",
				"phar_main_parha_parha",
				"phar_main_parha_sagalassos",
				"phar_main_tuwana_cybistra",
				"phar_main_tuwana_hubishna",
				"phar_main_tuwana_kelenderis",
				"phar_main_tuwana_tuwana",
				"phar_main_north_hatti_andrapa",
				"phar_main_north_hatti_dadastana",
				"phar_main_north_hatti_dusae",
				"phar_main_north_hatti_krateia",
				"phar_main_hattussa_ankuwa",
				"phar_main_hattussa_arinna",
				"phar_main_hattussa_corniaspa",
				"phar_main_hattussa_hattussa",
				"phar_main_kanesh_kanesh",
				"phar_main_kanesh_kummanni",
				"phar_main_kanesh_saricha",
				"phar_main_tarsus_adana",
				"phar_main_tarsus_kyinda",
				"phar_main_tarsus_tarsus",
				"phar_main_sea_huru_yam",
				"phar_main_sea_pelagos",
				"phar_main_purushanda_mokissos",
				"phar_main_purushanda_nyssa",
				"phar_main_purushanda_purushanda",
			})

			local id = cm:get_local_faction(true):faction_leader():has_special_character_skin_equipped() and "02" or "01"
			cutscene_intro:cindy_playback(string.format("script/campaign/phar_combi/factions/phar_camp_flybys/scenes/phar_camp_flyby_kuru_r01_s%s.CindyScene", id), 0, 2);
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
		23
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[3]);
		end,
		38.5
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[4]);
		end,
		56
	);

	cutscene_intro:action(
		function()
			cm:characters_forced_invisible({kurunta_forename_id}, false);
			cm:show_advice(advice_to_play[5]);
		end,
		79.5
	);

	cutscene_intro:start()

end
