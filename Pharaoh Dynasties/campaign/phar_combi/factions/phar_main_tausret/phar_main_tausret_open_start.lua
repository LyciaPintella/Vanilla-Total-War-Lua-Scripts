-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	OPEN CAMPAIGN INTRO SCRIPT
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

cam_start_x = 380.75122070312;
cam_start_y = 424.99609375;
cam_start_d = 14.013397216797;
cam_start_b = 0;
cam_start_h = 18.237894058228;

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
					cm:position_camera_at_primary_military_force("phar_main_tausret")
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
	advice_to_play[1] = "phar_cam_faction_intro_merneptah_tau_01" --#1#
	advice_to_play[2] = "phar_cam_faction_intro_merneptah_tau_02" --#21.5#
	advice_to_play[3] = "phar_cam_faction_intro_merneptah_tau_03" --#39#
	advice_to_play[4] = "phar_cam_faction_intro_merneptah_tau_04" --#49.5#
	advice_to_play[5] = "phar_cam_faction_intro_merneptah_tau_05" --#62#

	local cutscene_intro = campaign_cutscene:new(
		"intro_cutscene",									-- string name for this cutscene
		80,												-- length of cutscene in seconds
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
				"phar_main_merneptah", 
				"phar_main_seti",
				"phar_main_tausret",
				"phar_main_mes",
				"phar_main_abdju",
				"phar_main_kurkur",
				"phar_main_miam",
				"phar_main_waset",
			})
			cm:make_regions_visible_in_shroud_for_faction(cm:get_local_faction_name(), {
				"phar_main_memphis_memphis",
				"phar_main_memphis_petpeh",
				"phar_main_memphis_helwan",
				"phar_main_faiyum_dahshur",
				"phar_main_faiyum_faiyum",
				"phar_main_faiyum_khem",
				"phar_main_sea_nile_faiyum",
				"phar_main_hardai_ur_gem",
				"phar_main_hardai_hardai",
				"phar_main_hardai_tep_aha",
				"phar_main_akhmim_akhmim",
				"phar_main_akhmim_mefka_qes",
				"phar_main_akhmim_ur_men",
				"phar_main_amarna_amarna",
				"phar_main_herakleopolis_herakleopolis",
				"phar_main_herakleopolis_sheps_khu",
				"phar_main_hermopolis_hermopolis",
				"phar_main_hermopolis_ti_ar",
				"phar_main_asyut_asyut",
				"phar_main_asyut_kep_un",
				"phar_main_asyut_tem_khus",
				"phar_main_abydos_aakh_ner",
				"phar_main_abydos_abydos",
				"phar_main_abydos_tin",
				"phar_main_elephantine_elephantine",
				"phar_main_elephantine_hierakonpolis",
				"phar_main_elephantine_mes",
				"phar_main_elephantine_tep_hetem",
				"phar_main_thebes_kha_ti",
				"phar_main_thebes_sma_ua",
				"phar_main_thebes_thebes",
				"phar_main_kom_ombo_kha_sba",
				"phar_main_kom_ombo_kom_ombo",
				"phar_main_kom_ombo_tchu_ua",
				"phar_main_sea_nile_upper",
				"phar_main_sea_nile_first_cataract",
				"phar_main_sea_nile",
				"phar_main_sea_pa_yem",
				"phar_main_kharga_oasis_kharga_oasis",
				"phar_main_kharga_oasis_shesp_net",
				"phar_main_kharga_oasis_tebh",
				"phar_main_sea_kharga_oasis",
				"phar_main_kurkur_oasis_kurkur_oasis",
				"phar_main_kurkur_oasis_sen_hetem",
				"phar_main_kurkur_oasis_tcheba_ua",
				"phar_main_sea_kurkur_oasis",
				"phar_main_north_nubia_miam",
				"phar_main_north_nubia_mu_ua",
				"phar_main_north_nubia_res_pa",
			})

			local id = cm:get_local_faction(true):faction_leader():has_special_character_skin_equipped() and "02" or "01"
			cutscene_intro:cindy_playback(string.format("script/campaign/phar_combi/factions/phar_camp_flybys/scenes/phar_camp_flyby_tau_r01_s%s.CindyScene", id), 0, 2);
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
		21.5
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[3]);
		end,
		39
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[4]);
		end,
		49.5
	);

	cutscene_intro:action(
		function()
			cm:characters_forced_invisible({tausret_forename_id}, false);
			cm:show_advice(advice_to_play[5]);
		end,
		62
	);

	cutscene_intro:start()

end