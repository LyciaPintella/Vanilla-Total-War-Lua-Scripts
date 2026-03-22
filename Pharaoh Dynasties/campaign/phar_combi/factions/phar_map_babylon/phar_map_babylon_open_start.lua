-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	OPEN CAMPAIGN INTRO SCRIPT
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

cam_start_x = 1260;
cam_start_y = 738;
cam_start_d = 3;
cam_start_b = -0.45;
cam_start_h = 36;

local faction_characters_forename_ids = {
	"710351612",	--adad_forename_id
};

local other_characters_forename_ids = {
	"792338714",	--irsu_forename_id
	"1632431701",	--ninurta_forename_id
};

local revealed_shroud_regions_list = {
	"phar_map_northern_elam_kabnak",
	"phar_map_northern_elam_madaktu",
	"phar_map_northern_elam_pashime",
	"phar_map_northern_elam_susa",
	"phar_map_aranzah_assur",
	"phar_map_aranzah_karana",
	"phar_map_aranzah_nimrud",
	"phar_map_suhum_elu_anat",
	"phar_map_suhum_elu_haradu",
	"phar_map_suhum_elu_sapiratum",
	"phar_map_mari_duara",
	"phar_map_mari_mari",
	"phar_map_mari_supru",
	"phar_map_mari_terqa",
	"phar_map_azalzi_amasakku",
	"phar_map_azalzi_kahat",
	"phar_map_azalzi_shudu",
	"phar_map_azalzi_zakhiku",
	"phar_map_hanigalbat_dur_katlimmu",
	"phar_map_hanigalbat_sangaritu",
	"phar_map_hanigalbat_shadikanni",
	"phar_map_hanigalbat_washukanni",
	"phar_map_ashnunnak_der",
	"phar_map_ashnunnak_diniktum",
	"phar_map_ashnunnak_eshnunna",
	"phar_map_ashnunnak_tutub",
	"phar_map_karduniash_ishtananu_lagash",
	"phar_map_karduniash_ishtananu_larak",
	"phar_map_karduniash_ishtananu_malgu",
	"phar_map_karduniash_ishtananu_nippur",
	"phar_map_karduniash_shutaiu_borsippa",
	"phar_map_karduniash_shutaiu_ur",
	"phar_map_karduniash_shutaiu_uruk",
	"phar_map_kan_digirak_babylon",
	"phar_map_suhum_shaplu_idu",
	"phar_map_suhum_shaplu_rapiku",
	"phar_map_suhum_shaplu_sippar_amnamun",
	"phar_map_bit_peri_amurru_agade",
	"phar_map_bit_peri_amurru_dur_kurigalzu",
	"phar_map_bit_peri_amurru_sur_marrati",
	"phar_map_radanu_admannu",
	"phar_map_radanu_arrapha",
	"phar_map_radanu_lubdu",
	"phar_map_qutu_atlila",
	"phar_map_qutu_halman",
	"phar_map_uruatri_musasir",
	"phar_map_uruatri_tuali",
	"phar_map_uruatri_tuspa",
	"phar_map_hayasa_azzi_aripsha",
	"phar_map_hayasa_azzi_hayasha",
	"phar_map_hayasa_azzi_upumu",
	"phar_map_ashtata_apane",
	"phar_map_ashtata_ashimon",
	"phar_map_ashtata_bukushe",
	"phar_map_ashtata_tuttul",
	"phar_map_balihu_eluhat",
	"phar_map_balihu_harbe",
	"phar_map_balihu_irridu",
	"phar_map_balihu_zalpah",
	"phar_main_emar_emar",
	"phar_main_emar_teshub",
	"phar_main_damascus_tadmor",
}

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
					cm:position_camera_at_primary_military_force("phar_map_babylon")
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
	advice_to_play[1] = {
		text = "phar_cam_faction_intro_merneptah_ada_01",
		time = 1
	}
	advice_to_play[2] = {
		text = "phar_cam_faction_intro_merneptah_ada_02",
		time = 20
	}
	advice_to_play[3] = {
		text = "phar_cam_faction_intro_merneptah_ada_03",
		time = 38
	}
	advice_to_play[4] = {
		text = "phar_cam_faction_intro_merneptah_ada_04",
		time = 51.5
	}
	advice_to_play[5] = {
		text = "phar_cam_faction_intro_merneptah_ada_05",
		time = 68
	}
	advice_to_play[6] = {
		text = "phar_cam_faction_intro_merneptah_ada_06",
		time = 82.5
	}

	local cutscene_intro = campaign_cutscene:new(
		"intro_cutscene",									-- string name for this cutscene
		98.5,												-- length of cutscene in seconds
		function() 
			cm:characters_forced_invisible(faction_characters_forename_ids, false)
			cm:characters_forced_invisible(other_characters_forename_ids, false)
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
				"phar_map_ninurta", 
				"phar_map_babylon",
			})
			cm:make_regions_visible_in_shroud_for_faction(cm:get_local_faction_name(), revealed_shroud_regions_list)
			
			--TODO:Fix up shroud before cutscene playback 
			cutscene_intro:cindy_playback("script/campaign/phar_combi/factions/phar_camp_flybys/scenes/phar_camp_flyby_ada_r01_s01.CindyScene", 0, 2);
		end,
		0
	)

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[1].text);
		end,
		advice_to_play[1].time
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[2].text);
		end,
		advice_to_play[2].time
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[3].text);
		end,
		advice_to_play[3].time
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[4].text);
		end,
		advice_to_play[4].time
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[5].text);
			cm:characters_forced_invisible(faction_characters_forename_ids, false)
		end,
		advice_to_play[5].time
	);

	cutscene_intro:action(
		function()
			cm:show_advice(advice_to_play[6].text);
		end,
		advice_to_play[6].time
	);

	cutscene_intro:start()

end