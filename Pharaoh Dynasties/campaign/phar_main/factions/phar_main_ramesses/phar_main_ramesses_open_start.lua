-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	OPEN CAMPAIGN INTRO SCRIPT
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

cam_start_x = 326.05087280273;
cam_start_y = 680.77850341797;
cam_start_d = 15.094647407532;
cam_start_b = -0.2276489585638;
cam_start_h = 9;

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
			cm:start_intro_cutscene_on_loading_screen_dismissed(start_cutscene_intro)
		else 
			core:progress_on_loading_screen_dismissed(
				function()
					cm:position_camera_at_primary_military_force("phar_main_ramesses")
				end
			);
		end
	end
)

cm:add_first_tick_callback_sp_each(
	function() 
		-- put faction-specific calls that should get triggered each time a singleplayer game loads here
	end
);

---------------------------------------------------------------
--	Intro cutscene
---------------------------------------------------------------

function start_cutscene_intro()

	cm:disable_event_feed_events(true, "", "", "diplomacy_faction_encountered")

	local advice_to_play = {};
	advice_to_play[1] = "phar_cam_faction_intro_merneptah_ram_01" --#1s#
	advice_to_play[2] = "phar_cam_faction_intro_merneptah_ram_02" --#20.1s#
	advice_to_play[3] = "phar_cam_faction_intro_merneptah_ram_03" --#30.6s#
	advice_to_play[4] = "phar_cam_faction_intro_merneptah_ram_04" --#39.7s#
	advice_to_play[5] = "phar_cam_faction_intro_merneptah_ram_05" --#53.3s#
	advice_to_play[6] = "phar_cam_faction_intro_merneptah_ram_06" --#71.3s#
	advice_to_play[7] = "phar_cam_faction_intro_merneptah_ram_07" --#84s#


	local subtitle_to_play = {};
	subtitle_to_play[1] = "troy_sub_intro_hector"



	local cutscene_intro = campaign_cutscene:new(
		"intro_cutscene",									-- string name for this cutscene
		106,													-- length of cutscene in seconds
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
			cm:set_exclusive_visible_labels({})
			uim:override("disable_ers"):unlock()
			cm:disable_event_feed_events(false, "", "", "diplomacy_faction_encountered")
			-- trigger early-game missions
			core:trigger_event("ScriptEventIntroCutsceneFinished")
			cm:dismiss_advice()
		end													-- end callback
	)

	--cutscene_intro:set_debug();
	cutscene_intro:set_skippable(true, function() end)
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
				"phar_main_ramesses",
				"phar_main_pi_ramesses",
				"phar_main_megiddo",
			})
			cm:make_regions_visible_in_shroud_for_faction(cm:get_local_faction_name(), {
				"phar_main_memphis_memphis",
				"phar_main_memphis_petpeh",
				"phar_main_memphis_helwan",
				"phar_main_rhacotis_qema",
				"phar_main_heliopolis_heliopolis",
				"phar_main_heliopolis_qes",
				"phar_main_pi_ramesses_per_amun",
				"phar_main_pi_ramesses_pi_ramesses",
				"phar_main_pi_ramesses_tjaru",
				"phar_main_north_sinai_azzati",
				"phar_main_north_sinai_neb_gehes",
				"phar_main_north_sinai_nekhel",
				"phar_main_north_sinai_sukkot",
				"phar_main_sinai_tchu_sh",
				"phar_main_sinai_tchu_am",
				"phar_main_sinai_hetch",
				"phar_main_east_sinai_beersheba",
				"phar_main_ashkelon_ashkelon",
				"phar_main_ashkelon_pel",
				"phar_main_ashkelon_urushalim",
				"phar_main_megiddo_megiddo",
				"phar_main_megiddo_yapo",
				"phar_main_shechem_shechem",
				"phar_main_sea_wadj_ur",
				"phar_main_sea_ha_yam",
				"phar_main_buto_sais",
				"phar_main_buto_paiuenamun",
				"phar_main_buto_buto",
				"phar_main_hardai_ur_gem",
				"phar_main_hardai_hardai",
				"phar_main_sea_huru_yam",
			})

			local id = cm:get_local_faction(true):faction_leader():has_special_character_skin_equipped() and "02" or "01"
			cutscene_intro:cindy_playback(string.format("script/campaign/phar_main/factions/phar_camp_flybys/scenes/phar_camp_flyby_ram_r01_s%s.CindyScene", id), 0, 2);
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
		20.1
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[3]);
		end,
		30.6
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[4]);
		end,
		39.7
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[5]);
		end,
		53.3
	);

	cutscene_intro:action(
		function()
			cm:characters_forced_invisible({ramesses_forename_id}, false);
			cm:show_advice(advice_to_play[6]);
		end,
		71.3
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[7]);
		end,
		84
	);

	cutscene_intro:start()

end