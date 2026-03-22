-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	OPEN CAMPAIGN INTRO SCRIPT
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

cam_start_x = 210;
cam_start_y = 914;
cam_start_d = 4;
cam_start_b = -0.1;
cam_start_h = 26;

local faction_characters_forename_ids = {
	"610463016",	--agamemnon_forename_id
	"923017616",	--menelaus_forename_id
};

local other_characters_forename_ids = {
	"297327456",	--priam_forename_id
	"1247459162",	--hector_forename_id
	"1172277873",	--amythaon_forename_id
	"1655770330",	--demoleon_forename_id
};

local revealed_shroud_regions_list = {
	"phar_map_rhodes_arcasia",
	"phar_map_rhodes_ialysos",
	"phar_map_rhodes_lindos",
	"phar_map_teythrania_eressos",
	"phar_map_teythrania_kyme",
	"phar_map_teythrania_pelopia",
	"phar_map_teythrania_volissos",
	"phar_map_latmos_dolyche",
	"phar_map_latmos_samos",
	"phar_map_zerynthia_nesoi_imbrasos",
	"phar_map_zerynthia_nesoi_myrina",
	"phar_map_zerynthia_nesoi_skyros",
	"phar_map_ilion_adresteia",
	"phar_map_ilion_percote",
	"phar_map_ilion_troy",
	"phar_map_ilion_zeleia",
	"phar_map_maeonia_milethus",
	"phar_map_maeonia_erythrae",
	"phar_map_maeonia_eyanthia",
	"phar_map_maeonia_ephesos",
	"phar_map_caria_halicarnassos",
	"phar_map_caria_knidos",
	"phar_map_cephallenia_hyrie",
	"phar_map_cephallenia_ithaca",
	"phar_map_cephallenia_lefcas",
	"phar_map_lacedaemon_altis",
	"phar_map_lacedaemon_cythera",
	"phar_map_lacedaemon_pylos",
	"phar_map_lacedaemon_sparta",
	"phar_map_mycenaeca_aegion",
	"phar_map_mycenaeca_corinth",
	"phar_map_mycenaeca_mycenae",
	"phar_map_mycenaeca_tiryns",
	"phar_map_attica_athens",
	"phar_map_attica_carystos",
	"phar_map_attica_eretria",
	"phar_map_boeotia_calydon",
	"phar_map_boeotia_cyparissos",
	"phar_map_boeotia_thebes",
	"phar_map_kretes_knossos",
	"phar_map_kretes_kydonia",
	"phar_map_kretes_phaestos",
	"phar_map_kretes_setaea",
	"phar_map_cyclades_andros",
	"phar_map_cyclades_melos",
	"phar_map_cyclades_minoa",
	"phar_map_cyclades_naxos",
	"phar_map_sea_thermaikos_kolpos",
	"phar_map_sea_jorinthiakos_kolpos",
	"phar_map_sea_ikarion_pelagos",
	"phar_map_sea_ionian_pelagos",
	"phar_map_sea_kritikon_pelagos",
	"phar_map_sea_lykion_pelagos",
	"phar_map_sea_mytroon_pelagos",
	"phar_map_sea_thrakikon_pelagos",
	"phar_map_sea_tumanoiki_pelagos",
	"phar_map_sea_zalpoiki_pelagos",
	"troy_main_sea_ikarion_pelagos",
	"troy_main_sea_ionion_pelagos",
	"troy_main_sea_kritikon_pelagos",
	"troy_main_sea_lykion_pelagos",
	"troy_main_sea_mytroon_pelagos",
	"troy_main_sea_thrakikon_pelagos",
	"troy_main_sea_troikos_pelagos",
	"phar_map_sea_assuboki_lagos",
	"phar_map_sea_euboiki_thalassa",
	"phar_map_sea_propontis",
	"phar_main_sea_megale_thalassa",
	"phar_map_zonaea_apsynthia",
	"phar_map_zonaea_ismaros",
	"phar_map_zonaea_sestos",
	"phar_map_zonaea_thasos",
};

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
					cm:position_camera_at_primary_military_force("troy_main_dan_mycenae")
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

	local corinthians_interface = cm:get_faction("troy_main_dan_corinthians")
	local corinthians_armies = corinthians_interface:military_force_list()
	local corinthtians_to_hide = {}
	for i = 0, corinthians_armies:num_items() - 1 do 
		local commander = corinthians_armies:item_at(i):general_character()
		table.insert(corinthtians_to_hide, cm:char_lookup_str(commander))
	end

	local advice_to_play = {};
	advice_to_play[1] = "phar_cam_faction_intro_merneptah_aga_01" --#1#
	advice_to_play[2] = "phar_cam_faction_intro_merneptah_aga_02" --#24.5#
	advice_to_play[3] = "phar_cam_faction_intro_merneptah_aga_03" --#44.5#
	advice_to_play[4] = "phar_cam_faction_intro_merneptah_aga_04" --#66#
	advice_to_play[5] = "phar_cam_faction_intro_merneptah_aga_05" --#83#
	advice_to_play[6] = "phar_cam_faction_intro_merneptah_aga_06" --#106#
	advice_to_play[7] = "phar_cam_faction_intro_merneptah_aga_07" --#130.5#

	local cutscene_intro = campaign_cutscene:new(
		"intro_cutscene",									-- string name for this cutscene
		153,												-- length of cutscene in seconds
		function() 
			cm:characters_forced_invisible(faction_characters_forename_ids, false)
			cm:characters_forced_invisible(other_characters_forename_ids, false)
			for _, char_lookup_str in pairs(corinthtians_to_hide) do 
				cm:character_forced_invisible(char_lookup_str, false)
			end
			cm:set_exclusive_visible_labels({})
			out("TRIGGERING END")
			cm:disable_event_feed_events(false, "", "", "diplomacy_faction_encountered")
			core:trigger_event("ScriptEventIntroCutsceneFinished")
			cm:dismiss_advice()
		end,
		true													-- end callback
	)

	cutscene_intro:set_skippable(true, start_faction)
	cutscene_intro:set_disable_settlement_labels(true)
	cutscene_intro:set_dismiss_advice_on_end(false)
	cutscene_intro:set_restore_shroud(true)

	cutscene_intro:action(
		function()
			cm:characters_forced_invisible(faction_characters_forename_ids, true)
			cm:characters_forced_invisible(other_characters_forename_ids, true)
			cm:set_exclusive_visible_labels({
				"troy_main_dan_mycenae", 
				"troy_main_trj_troy"
			})
			cm:make_regions_visible_in_shroud_for_faction(cm:get_local_faction_name(), revealed_shroud_regions_list)

			for _, char_lookup_str in pairs(corinthtians_to_hide) do 
				cm:character_forced_invisible(char_lookup_str, true)
			end

			--TODO:Fix up shroud before cutscene playback 
			cutscene_intro:cindy_playback("script/campaign/phar_combi/factions/phar_camp_flybys/scenes/phar_camp_flyby_aga_r01_s01.CindyScene", 0, 2);
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
		24.5
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[3]);
		end,
		44.5
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[4]);
		end,
		61
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[5]);
		end,
		83
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[6]);
			cm:characters_forced_invisible(faction_characters_forename_ids, false)
			for _, char_lookup_str in pairs(corinthtians_to_hide) do 
				cm:character_forced_invisible(char_lookup_str, false)
			end
		end,
		106
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[7]);
		end,
		130.5
	);

	cutscene_intro:start()

end