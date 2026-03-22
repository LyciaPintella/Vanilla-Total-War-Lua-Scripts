-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	OPEN CAMPAIGN INTRO SCRIPT
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

cam_start_x = 612.52734375;
cam_start_y = 875.03112792969;
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
					cm:position_camera_at_primary_military_force("phar_main_irsu")
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
	advice_to_play[1] = "phar_cam_faction_intro_merneptah_irs_01" --#1#
	advice_to_play[2] = "phar_cam_faction_intro_merneptah_irs_02" --#23.4#
	advice_to_play[3] = "phar_cam_faction_intro_merneptah_irs_03" --#41#
	advice_to_play[4] = "phar_cam_faction_intro_merneptah_irs_04" --#56.5#

	local cutscene_intro = campaign_cutscene:new(
		"intro_cutscene",									-- string name for this cutscene
		69,												-- length of cutscene in seconds
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
				"phar_main_irsu",
				"phar_main_damascus",
				"phar_main_ugarit",
				"phar_main_byblos",
				"phar_main_amurru",
			})
			cm:make_regions_visible_in_shroud_for_faction(cm:get_local_faction_name(), {
				"phar_main_emar_emar",
				"phar_main_emar_qatna",
				"phar_main_emar_teshub",
				"phar_main_ugarit_ebla",
				"phar_main_ugarit_ugarit",
				"phar_main_aleppo_alalah",
				"phar_main_aleppo_aleppo",
				"phar_main_kadesh_kadesh",
				"phar_main_kadesh_sumur",
				"phar_main_tyre_byblos",
				"phar_main_tyre_hazor",
				"phar_main_tyre_sidon",
				"phar_main_tyre_tyre",
				"phar_main_shechem_ammon",
				"phar_main_shechem_sakka",
				"phar_main_shechem_shechem",
				"phar_main_megiddo_megiddo",
				"phar_main_megiddo_yapo",
				"phar_main_sea_huru_yam",
				"phar_main_sea_ha_yam",
			})

			local id = cm:get_local_faction(true):faction_leader():has_special_character_skin_equipped() and "02" or "01"
			cutscene_intro:cindy_playback(string.format("script/campaign/phar_main/factions/phar_camp_flybys/scenes/phar_camp_flyby_irs_r01_s%s.CindyScene", id), 0, 2);
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
		23.4
	);

	cutscene_intro:action(
		function()
			cm:characters_forced_invisible({irsu_forename_id}, false);
			cm:show_advice(advice_to_play[3]);
		end,
		41
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[4]);
		end,
		56.5
	);

	cutscene_intro:start()

end