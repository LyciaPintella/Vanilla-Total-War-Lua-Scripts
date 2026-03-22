

out("phar_main_ramesses_tutorial_1 loaded")







--------------------------------------------------------------------------------------------------
-- CHECKPOINT 100: after army movement, before showing ap
--------------------------------------------------------------------------------------------------

local checkpoint_100_str = "1 " .. common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_start")

cm:add_checkpoint( 
	100,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		t1_tutorial_intro()
	end,
	false,													-- call function when checkpoint reached
	checkpoint_100_str									-- opt string name
)

cm:add_checkpoint_setup_callback(
	100,														-- checkpoint id to add setup callback
	function(is_loading_game, checkpoint_id)				-- setup function
		t1_ui_overrides()
	end,
	false													-- call function when checkpoint reached
)


function t1_ui_overrides()
	local uic_advice_interface = find_uicomponent("advice_interface")
	if uic_advice_interface then
		uic_advice_interface:InterfaceFunction("set_is_tutorial", true)
	end

	-- cm:disable_saving_game(true);

	-- explicitly set Ironman/Legendary mode disabled in case it's cached
	cm:enable_legendary_mode_restrictions(false)
	
	-- and kill modular difficulty so it doesn't meddle with stuff
	modular_difficulty_campaign.is_enabled = false

	-- Restore skip-all-but-player's-turn / skip-specific-faction-turn behaviour that was set in the savegame
	tut_restore_skipping_state_on_load()


	-- Do not fill starting gods for the player faction
	tut_skip_fill_initial_gods()
	
	core:set_boolean_preference("incremental_autosave_enabled", true)

	cm:disable_event_feed_events(true, "all")

	-- Set campaign time of day to "morning"
	cm:set_campaign_time_of_day(4)
	
	--cm:force_diplomacy("faction:" .. tut.player_faction_key, "faction:" .. tut.merneptah_faction_key, "war", false, false, true, true)
	cm:force_diplomacy("faction:" .. tut.player_faction_key, "all", "war", false, false, true)
	cm:force_diplomacy("faction:" .. tut.player_faction_key, "all", "trade agreement", false, false, true)
	cm:force_diplomacy("faction:" .. tut.player_faction_key, "all", "single barters", false, false, true)
	cm:force_diplomacy("faction:" .. tut.player_faction_key, "all", "barter agreements", false, false, true)
	cm:force_diplomacy("faction:" .. tut.per_amun_faction_key, "faction:" .. tut.player_faction_key, "peace", false, false, true)
	cm:force_diplomacy("all", "faction:" .. tut.per_amun_faction_key, "subjugate", false, false, true)
	cm:force_diplomacy("all", "faction:" .. tut.per_amun_faction_key, "become_subject", false, false, true)

	cm:disallow_army_occupation_decision(
		tut.player_faction_leader_fm_cqi,
		"occupation_decision_sack"
	)
	cm:disallow_army_occupation_decision(
		tut.player_faction_leader_fm_cqi,
		"occupation_decision_raze_without_occupy"
	)

	cm:faction_set_total_potential_override_value(cm:get_faction(tut.player_faction_key), true, 999)

	cm:set_forced_fastest_round_speed(false)

	core:svr_save_bool("sbool_replace_concede_with_skip_button", true)
	core:svr_save_bool("sbool_disable_advisor_for_tutorial_battles", true)


	uim:override("hide_settlement_panel_building_browser"):lock()
	uim:override("disable_skip_button"):lock()

	uim:override("hide_faction_widget_buttons"):lock()
	uim:override("diplomacy"):lock()
	uim:override("technology"):lock()
	
	uim:override("hide_ancient_legacies"):lock()
	uim:override("hide_power_of_the_crown"):lock()
	uim:override("hide_faction_buttons_docker"):lock()
	uim:override("hide_radar"):lock()
	uim:override("radar_rollout_buttons"):lock()
	uim:override("end_turn"):lock()
    uim:override("journal"):lock()
    uim:override("hide_divine_will_button"):lock()
    uim:override("hide_fm_offices_container"):lock()
    uim:override("hide_fm_demand_tribute_container"):lock()
    uim:override("recruit_units"):lock()
    uim:override("hide_settlement_panel_recruit_hero"):lock()
	uim:override("hide_settlement_panel_recruit_lord"):lock()
	uim:override("army_panel_visible"):lock()
	uim:override("province_overview_panel_visible"):lock()
	uim:override("hide_demolish_button"):lock()
	uim:override("maintain_siege"):lock()
	uim:override("disable_ers"):lock()
	uim:override("disband_unit"):lock()
	uim:override("settlement_labels"):lock()
	uim:override("cancel_mission"):lock()

	uim:override("abandon_settlements"):lock()
	uim:override("hide_abandon_settlement"):lock()
	uim:override("hide_province_info_panel"):lock()

	uim:override("hide_resources_bar"):lock()
--	uim:override("hide_resource_troy_bronze"):lock()
--	uim:override("hide_resource_troy_gold"):lock()
	uim:override("hide_resource_phar_legitimacy"):lock()
	uim:override("hide_resource_phar_hatti_legitimacy"):lock()

	uim:override("hide_sidemenu"):lock()
	uim:override("hide_campaign_customization_button"):lock()
	uim:override("end_of_turn_warnings"):lock()

	uim:override("hide_pre_battle_retreat"):lock()
	local get_tweaker_autoresolve_allowed = core:is_tweaker_set("SCRIPTED_TWEAKER_10")
	if not get_tweaker_autoresolve_allowed then
		uim:override("hide_pre_battle_autoresolve"):lock()
	else
		uim:override("hide_pre_battle_autoresolve"):unlock()
	end

	if not cm:get_saved_value("unlock_local_deities") then
		uim:override("hide_local_deities"):lock()
		uim:override("hide_faction_button"):lock()
	end;

	if not cm:get_saved_value("unlock_character_details") then
		uim:override("character_details"):lock()
	end

	if not cm:get_saved_value("court_unlocked") then 
		uim:override("hide_court"):lock()
	end

	if not cm:get_saved_value("unlock_stances") then
		uim:override("stances"):lock()
	end;

	if not cm:get_saved_value("legitimacy_war") then
		pillars_civilization.set_is_hidden_by_ui_override(true);
	end
	
	cm:toggle_dilemma_generation(false)
	--Add a save disable after work on the tutorial is finished
	--uim:override("saving"):lock()
	
	cm:restrict_buildings_for_faction(tut.player_faction_key, {"phar_main_ers_monument_level_1_hitt"})
	-- Prevent legitimacy from being unlocked until we're ready
	local legitimacy_onboarding_turn = tn_listeners_triggered.legitimacy_onboarding or 1000
	tut_set_legitimacy_onboarding_turn_for_tutorial(legitimacy_onboarding_turn)

	if legitimacy_onboarding_turn > cm:turn_number()
			and	tut.player_faction_key == cm:get_local_faction_name(true) then
		local ui_root = core:get_ui_root()
		local crown_mechanic_button = ui_root:SequentialFind("fm_phar_pharaoh_crown_container")
		if crown_mechanic_button then
			crown_mechanic_button:SetVisible(false)
		end
	end

	pillars_civilization.set_civilization_disaster_chance_to_zero()
end


function t1_tutorial_intro()
	uim:override("saving"):lock()

	cm:steal_user_input(true)
	cm:set_region_abandoned(tut.neb_gehes)

	cm:faction_add_pooled_resource(tut.player_faction_key, "troy_food", "troy_resource_factor_character", 10000)
	cm:faction_add_pooled_resource(tut.player_faction_key, "troy_wood", "troy_resource_factor_character", 2000)
	cm:faction_add_pooled_resource(tut.player_faction_key, "troy_gold", "troy_resource_factor_character", 2000)
	cm:faction_add_pooled_resource(tut.player_faction_key, "troy_stones", "troy_resource_factor_character", 6000)
	cm:callback(
		function()
			t1_provide_bonus_resource_bundle()
		end,
		1
	)

	cm:kill_all_armies_for_faction(cm:get_faction(tut.beersheba_faction_key))
	cm:kill_all_armies_for_faction(cm:get_faction(tut.sukhot_faction_key))

	tut_skip_all_but_player_turns(true)

	cm:force_declare_war(
		tut.player_faction_key,
		tut.sukhot_faction_key,
		false,
		false,
		true
	)

	cm:force_declare_war(
		tut.player_faction_key,
		tut.per_amun_faction_key,
		false,
		false,
		true
	)

	-- cm:force_alliance(
	-- 	tut.player_faction_key,
	-- 	tut.merneptah_faction_key,
	-- 	true,
	-- 	true
	-- )

	cm:force_alliance(
		tut.player_faction_key,
		tut.pi_ramesses_faction_key,
		true,
		true
	)

	cm:force_diplomacy(
		"faction" .. tut.player_faction_key,
		"faction" .. tut.merneptah_faction_key,
		"break alliance",
		false,
		false,
		true
	)
	cm:force_diplomacy(
		"faction" .. tut.player_faction_key,
		"faction" .. tut.pi_ramesses_faction_key,
		"break alliance",
		false,
		false,
		true
	)
	cm:force_add_and_equip_ancillary(cm:char_lookup_str(tut.player_faction_leader_fm_cqi), "phar_main_rare_equipment_khopesh_5", true)

	cm:apply_effect_bundle("phar_main_tutorial_construction_time_mod_all", tut.player_faction_key, 20)
	cm:apply_effect_bundle("phar_main_tutorial_attrition_immunity", tut.player_faction_key, 5)
	
	--Compensate for Ramesses' lack of movement points
	local ramesses = cm:get_character_by_fm_cqi(tut.player_faction_leader_fm_cqi)
	local bundle_key = "phar_main_effect_bundle_tutorial_campaign_movement"
	local effect_value = 20
	local effect_key = "troy_effect_hero_campaign_campaign_movement" 
	local bundle = cm:create_new_custom_effect_bundle(bundle_key)
	bundle:add_effect(effect_key, "general_to_force_own", effect_value)
	bundle:set_duration(0)
	cm:apply_custom_effect_bundle_to_character(bundle, ramesses)

	local merneptah_regions = cm:get_faction(tut.merneptah_faction_key):region_list()
	for i=0, merneptah_regions:num_items() - 1 do
		local region_key = merneptah_regions:item_at(i):name()
		if region_key ~= "phar_main_heliopolis_heliopolis" then
			cm:make_region_visible_in_shroud(tut.player_faction_key, region_key)
		end
	end
	local qema_key = "phar_main_rhacotis_qema"
	local qes_key = "phar_main_heliopolis_qes"
	cm:make_region_visible_in_shroud(tut.player_faction_key, qema_key)
	cm:make_region_visible_in_shroud(tut.player_faction_key, qes_key)
	cm:make_region_visible_in_shroud(tut.player_faction_key, tut.neb_gehes)

	-- set post-intro-cutscene camera position
	cm:set_camera_position(411.263794, 643.982605, 7.657795, -0.622144, 4.0)
	cm:teleport_to(cm:char_lookup_str(tut.player_faction_leader_fm_cqi), 622, 829)

	cm:disable_movement_for_faction(tut.player_faction_key)
	
	-- put faction-specific calls that should only gets triggered in a new singleplayer game here
	uim:override("hide_campaign_space_bar_options"):lock()
	cm:start_intro_cutscene_on_loading_screen_dismissed(t1_play_cutscene_intro)
end

function t1_provide_bonus_resource_bundle()
	--Greatly boost Ramesses income for Greater turns
	local administrative_bundle_key = "phar_main_universal_background_income_priests"
	local bundle = cm:create_new_custom_effect_bundle(administrative_bundle_key)

	local effects = bundle:effects()
	local effect_0 = effects:item_at(0)
	local effect_1 = effects:item_at(1)
	local effect_2 = effects:item_at(2)

	local wood_effect_value = 100
	local food_effect_value = 2000
	local bronze_effect_value = 300
	bundle:set_effect_value(effect_0, wood_effect_value)
	bundle:set_effect_value(effect_1, food_effect_value)
	bundle:set_effect_value(effect_2, bronze_effect_value)

	-- local food_effect_key = "phar_main_effect_economy_faction_add_food"
	-- bundle:add_effect(food_effect_key, "faction_to_faction_own", food_effect_value)
	-- local wood_effect_key = "phar_main_effect_economy_faction_add_wood" 
	-- bundle:add_effect(wood_effect_key, "faction_to_faction_own", wood_effect_value)
	-- local bronze_effect_key = "phar_main_effect_economy_faction_add_bronze" 
	-- bundle:add_effect(bronze_effect_key, "faction_to_faction_own", bronze_effect_value)

	bundle:set_duration(50)
	local player_faction = cm:get_faction(tut.player_faction_key)
	cm:apply_custom_effect_bundle_to_faction(bundle, player_faction)
end

---------------------------------------------------------------
--	Intro cutscene
---------------------------------------------------------------

local camera_sequence_offset = {};	--in seconds
camera_sequence_offset[1] = 3
camera_sequence_offset[2] = 21.7
camera_sequence_offset[3] = camera_sequence_offset[2] + 10.75
camera_sequence_offset[4] = camera_sequence_offset[3] + 10.5
camera_sequence_offset[5] = camera_sequence_offset[4] + 5.25
camera_sequence_offset[6] = camera_sequence_offset[5] + 10.5

local cutscene_end_callback_triggered = false

function t1_play_cutscene_intro()
	local cutscene_intro = campaign_cutscene:new(
		"intro_cutscene",									-- string name for this cutscene
		camera_sequence_offset[6] + 1,												-- length of cutscene in seconds
		function()
			cm:steal_user_input(true)
			cm:set_camera_position(307.810577, 650.765625, 8.6384725, 0.612871, 4)
			cutscene_end_callback_triggered = true
			cm:trigger_sound_event("Mixer_Campaign_Tutorial_End")
			--Adding a callback to next cutscene, so that set_camera works for it
			t1_post_initial_intro_cutscene_dialog()
		end										
	)

	--cutscene_intro:set_debug();
	cutscene_intro:set_skippable(false)
	cutscene_intro:set_disable_settlement_labels(true)
	cutscene_intro:set_dismiss_advice_on_end(false)
	cutscene_intro:set_disable_shroud(true)
	cutscene_intro:set_restore_shroud(true)
	cutscene_intro:set_skip_camera(307.810577, 650.765625, 8.6384725, 0.612871, 4)
	cutscene_intro:set_fade_on_skip(true, 1, 1)
	cutscene_intro:set_should_play_sound_on_finish(false)
	cutscene_intro:set_should_play_sound_on_cindyscene_start(false)
	cutscene_intro:steal_input_immediately()

	---------------------------------------
	-- Camera Sequences
	---------------------------------------

	cm:fade_scene(0, 0.5)
	cm:trigger_sound_event("Mixer_Campaign_Tutorial_Start")	

	cutscene_intro:action(
		function()
			out("Start intro cutscene 0")	
		end,
		0
	)
	cutscene_intro:action(
		function()
			out("Start intro cutscene 1")	
			cm:fade_scene(1, 7)
			cutscene_intro:cindy_playback("script/campaign/phar_main/factions/phar_camp_tutorial/scenes/phar_camp_tutorial_sq01_sh01.CindyScene", 0, 2);
		end,
		camera_sequence_offset[1]
	)
	
	cutscene_intro:action(
		function()
			cutscene_intro:cindy_playback("script/campaign/phar_main/factions/phar_camp_tutorial/scenes/phar_camp_tutorial_sq01_sh02.CindyScene", 0, 2);
		end,
		camera_sequence_offset[2]
	)
	
	cutscene_intro:action(
		function()
			cutscene_intro:cindy_playback("script/campaign/phar_main/factions/phar_camp_tutorial/scenes/phar_camp_tutorial_sq01_sh03.CindyScene", 0, 2);
		end,
		camera_sequence_offset[3]
	)
	
	cutscene_intro:action(
		function()
			local farafra_leader = cm:get_faction("phar_main_farafra"):faction_leader()
			local char_lookup = cm:char_lookup_str(farafra_leader)
			cm:character_forced_invisible(char_lookup, true)
			cm:add_scripted_composite_scene_to_logical_position(
				"generals_fight_csc",
				"phar_main_generals_fight",
				235,
				735,
				235,
				735,
				false,
				true,
				true,
				farafra_leader:bearing()
			)
			cutscene_intro:cindy_playback("script/campaign/phar_main/factions/phar_camp_tutorial/scenes/phar_camp_tutorial_sq01_sh04.CindyScene", 0, 2);
		end,
		camera_sequence_offset[4]
	)
	
	cutscene_intro:action(
		function()
			local farafra_leader = cm:get_faction("phar_main_farafra"):faction_leader()
			local char_lookup = cm:char_lookup_str(farafra_leader)
			cm:character_forced_invisible(char_lookup, false)
			cutscene_intro:cindy_playback("script/campaign/phar_main/factions/phar_camp_tutorial/scenes/phar_camp_tutorial_sq01_sh05.CindyScene", 0, 2);
		end,
		camera_sequence_offset[5]
	)

	cutscene_intro:action(
		function()
			cm:fade_scene(0, 0)
			-- cm:trigger_sound_event("UI_CAM_Flyover_Skip");
		end,
		camera_sequence_offset[6]
	)

	cutscene_intro:start()
end

-------------------------------
--- Camera sequence
-------------------------------


local tutorial_dialogue_sequence_offset = {	--in seconds
	[1] = 12,
	[2] = 4,
	[3] = 4,
	[4] = 9
};

local tutorial_cutscene_sequence_offset = {}	--in seconds
tutorial_cutscene_sequence_offset[1] = 1
tutorial_cutscene_sequence_offset[2] = tutorial_cutscene_sequence_offset[1] + tutorial_dialogue_sequence_offset[1] + 2
tutorial_cutscene_sequence_offset[3] = tutorial_cutscene_sequence_offset[2] + tutorial_dialogue_sequence_offset[2]
tutorial_cutscene_sequence_offset[4] = tutorial_cutscene_sequence_offset[3] + tutorial_dialogue_sequence_offset[3]
tutorial_cutscene_sequence_offset[5] = tutorial_cutscene_sequence_offset[4] + tutorial_dialogue_sequence_offset[4]

function t1_post_initial_intro_cutscene_dialog()
	
	local sequence_skipped = true
	
	local cutscene_intro = campaign_cutscene:new(
		"post_intro_cutscene",									-- string name for this cutscene
		40,												-- length of cutscene in seconds
		function()
			cm:steal_user_input(true)
			cm:remove_scripted_composite_scene("generals_fight_csc")
			if sequence_skipped then
				cm:set_camera_position(400.208038, 660.18573, 9.58838, -0.183972, 5.170344)
				cm:remove_callback("ftue_start_camera_pos")
				t1_post_initial_intro_cutscene_ramesses_movement_1()
			end
		end												-- end callback
	)

	cutscene_intro:set_skippable(false)
	cutscene_intro:set_disable_settlement_labels(true)
	cutscene_intro:set_dismiss_advice_on_end(false)
	cutscene_intro:set_disable_shroud(true)
	cutscene_intro:set_restore_shroud(true)
	cutscene_intro:wait_for_advisor()
	cutscene_intro:set_fade_on_skip(true, 3, 2)
	cutscene_intro:set_skip_camera(400.208038, 660.18573, 9.58838, -0.183972, 5.170344)
	cutscene_intro:set_should_play_sound_on_finish(false)
	cutscene_intro:set_should_play_sound_on_cindyscene_start(false)

	cutscene_intro:action(			-- delay action to prevent the hud from appearing
		function()
			cm:callback(
				function()
					-- cm:set_camera_position(382.406281, 661.367554, 8.394791, -1.323993, 4.0)
					cm:set_camera_position(307.810577, 650.765625, 8.6384725, 0.612871, 4)
				end,
				1,
				"ftue_start_camera_pos"
			)
		end,
		0
	)
	
	cutscene_intro:action(
		function()
			cm:fade_scene(1, 1)
			cm:callback(
				function()
					cm:show_advice(
						tut.advisor_texts.turn_0.v2_campaign_start_1_mern.advice_key,
						false,
						false,
						nil,
						tutorial_dialogue_sequence_offset[1]
					)
				end,
				2
			);
			cutscene_intro:wait_for_advisor()
		end,
		tutorial_cutscene_sequence_offset[1]
	)

	cutscene_intro:action(
		function()
			-- cm:set_camera_position(416.894623, 519.563171, 15.490193, -2.60805, 4.460039)
			cm:set_camera_position(439.027130, 569.529968, 9.380694, 0.6788268, 5.05)
			cm:show_advice(
				tut.advisor_texts.turn_0.v2_campaign_start_2_ram.advice_key,
				false,
				false,
				nil,
				tutorial_dialogue_sequence_offset[2]
			)
			cutscene_intro:wait_for_advisor()
		end,
		tutorial_cutscene_sequence_offset[2]
	)

	cutscene_intro:action(
		function()
			cm:show_advice(
				tut.advisor_texts.turn_0.v2_campaign_start_3_mern.advice_key,
				false,
				false,
				nil,
				tutorial_dialogue_sequence_offset[3]
			)
			cutscene_intro:wait_for_advisor()
		end,
		tutorial_cutscene_sequence_offset[3]
	)

	cutscene_intro:action(
		function()
			cm:callback(
				function()
					cm:set_camera_position(393.25, 588.60, 6.50, -1.1, 3.7)
				end,
				3.5
			);
			cm:show_advice(
				tut.advisor_texts.turn_0.v2_ramesses_on_focus_ram.advice_key,
				false,
				false,
				function()
					cutscene_intro:dismiss_advice()
				end,
				tutorial_dialogue_sequence_offset[4]
			)
		end,
		tutorial_cutscene_sequence_offset[4]
	)

	cutscene_intro:action(
		function()
			sequence_skipped = false
			cm:set_camera_position(411.263794, 643.982605, 7.657795, -0.622144, 4.0)
			cm:callback(
				function()
					cm:scroll_camera_from_current(true, 5.5, {400.208038, 660.18573, 9.58838, -0.183972, 5.170344})
				end,
				0.3
			)
			
			t1_post_initial_intro_cutscene_ramesses_movement_1()

		end,
		tutorial_cutscene_sequence_offset[5]
	)

	cutscene_intro:start()
end

local initial_movement_complete = false

function t1_post_initial_intro_cutscene_ramesses_movement_1()
	cm:replenish_action_points(cm:char_lookup_str_fm(tut.player_faction_leader_fm_cqi))
	cm:move_character(
		tut.player_faction_leader_fm_cqi,
		600,
		850,
		true,
		true,
		function()
			cm:callback(
				function()
					cm:replenish_action_points(cm:char_lookup_str_fm(tut.player_faction_leader_fm_cqi))
				end,
				0.2
			)
			initial_movement_complete = true
		end
	)

	local ramesses_cqi = cm:get_character_by_fm_cqi(tut.player_faction_leader_fm_cqi):command_queue_index()
	cm:disable_movement_for_character("character_cqi:" .. ramesses_cqi)
	
	cm:callback(
		function()
			cm:show_advice(
				tut.advisor_texts.turn_1.v2_character_introduction_pract.advice_key,
				false,
				false,
				function()
					t1_post_initial_intro_cutscene_ramesses_movement_2()
				end,
				6
			)	
		end,
		4
	)
end

function t1_post_initial_intro_cutscene_ramesses_movement_2()
	
	cm:hide_advisor_without_infotexts()
	cm:show_advice(
		tut.advisor_texts.turn_1.v2_hero_selection_ram.advice_key,
		false,
		false,
		function()
			cm:hide_advisor_without_infotexts()
			if initial_movement_complete then
				t1_start_hero_movement_advice()
			end
		end,
		11
	)
	tut_add_infotext(tut.advisor_texts.turn_1.v2_hero_selection_ram.infotext);
end

function t1_start_hero_movement_advice()
	cm:steal_user_input(false)
	uim:override("hide_campaign_space_bar_options"):unlock()

	core:close_info_overlays()
	common.enable_info_overlays(false)

	local ramesses_cqi = cm:get_character_by_fm_cqi(tut.player_faction_leader_fm_cqi):command_queue_index()
	cm:enable_movement_for_character("character_cqi:" .. ramesses_cqi)

	local hero_movement_advice = intro_campaign_movement_advice:new(
		tut.player_faction_leader_fm_cqi,
		"",
		tut.advisor_texts.turn_1.v2_hero_selection_ram.objective_key,
		tut.advisor_texts.turn_1.v2_hero_movement_pract.advice_key,
		tut.advisor_texts.turn_1.v2_hero_movement_pract.objective_key,
		612,
		877, 
		function()
			cm:checkpoint_reached(
				110,													-- checkpoint id
				function()
					common.enable_info_overlays(true)
					t1_arrive_at_nebgehes_first_time()
				end,					-- post-update callback
				tut.SHOULD_SAVE_EVERY_CHECKPOINT_MID or false,				-- should save game
				tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or false			-- always generate named savegame, rather than autosaving
			)
		end,
		tut.advisor_texts.turn_1.v2_hero_ui_movement_bar_pract.advice_key
	)
	hero_movement_advice:set_action_points_advice_key(tut.advisor_texts.turn_1.v2_hero_ui_movement_bar_pract.advice_key);
	hero_movement_advice:set_action_points_text_pointer_creator_callback(
		function()
			local ap = active_pointer:new(
				"show_action_points_bar",
				"bottomleftedge",
				function()
					return find_uicomponent(core:get_ui_root(), "info_panel_holder", "character_content", "container_action_bar", "action_points_parent");
				end,
				"ui_text_replacements_localised_text_phar_text_pointer_action_points_description",
				1.4,
				0.7,
				nil,
				true
			)
			ap:show_when_ready(2,25)
			ap:set_highlight_close_button(5, true)
			ap:set_auto_hide_time(tut.TEXT_POINTER_DURATION_S)

			return ap
		end
	)
	hero_movement_advice:show_initial_camera_pan(false)
	--hero_movement_advice:set_camera_position_override(398.403961, 665.765808, 15.93666, -0.943994, 13.233528)

	hero_movement_advice:start()
end

--------------------------------------------------------------------------------------------------
-- CHECKPOINT 110: after army movement, before showing ap
--------------------------------------------------------------------------------------------------

local checkpoint_110_str = common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_advice")

cm:add_checkpoint( 
	110,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		cm:position_camera_at_primary_military_force(tut.player_faction_key)
		core:progress_on_loading_screen_dismissed(t1_arrive_at_nebgehes_first_time)
	end,
	false,													-- call function when checkpoint reached
	checkpoint_110_str										-- opt string name
)

function t1_arrive_at_nebgehes_first_time()
	uim:override("saving"):unlock()
	cm:scroll_camera_from_current(true, tut.SCROLL_CAMERA_DURATION_S, {402.937347, 674.941467, 16.300802, -1.215001, 11.062487})
	cm:dismiss_advice()
	cm:show_advice(
		tut.advisor_texts.turn_1.v2_advisor_arrive_mern.advice_key,
		true,
		false,
		function()
			t1_start_show_advice_button_pointer()
		end,
		tut.ADVICE_DURATION_S
	)
end

function t1_start_show_advice_button_pointer()
	cm:show_advice(
		tut.advisor_texts.turn_1.v2_advisor_button_1_mern.advice_key,
		true,
		false,
		function()
			cm:hide_advisor_without_infotexts()
			cm:set_objective(tut.advisor_texts.turn_1.v2_advisor_button_1_mern.objective_key)
			
			local button_advice = find_uicomponent(core:get_ui_root(), "menu_bar", "button_show_advice")

			if button_advice then
				--pulse_uicomponent(button_advice, true, 10)
				button_advice:Highlight(true, false, 0, true)
			end
		end,
		tut.ADVICE_DURATION_S
	)
	
	cm:callback(
		function()
			tut_add_infotext(tut.advisor_texts.turn_1.v2_advisor_button_1_mern.infotext)
		end,
		4
	)

	core:add_listener(
		"FTUE_AdvisorButtonClicked",
		"ComponentLClickUp",
		function(context)
			return context.string == "button_show_advice"
		end,
		function(context)

			--highlight_component(false, false, "menu_bar", "button_show_advice")
			cm:complete_objective(tut.advisor_texts.turn_1.v2_advisor_button_1_mern.objective_key)
			
			local button_advice = find_uicomponent(core:get_ui_root(), "menu_bar", "button_show_advice")
			if button_advice then
				--pulse_uicomponent(button_advice, false, 0, false)
				button_advice:Highlight(false, false)
			end

			cm:dismiss_advice()
			cm:callback(
				function()
					cm:show_advice(
						tut.advisor_texts.turn_1.v2_advisor_button_2_pract.advice_key,
						false,
						false,
						function()
							cm:hide_advisor_without_infotexts()
							t1_pre_end_turn_checkpoint()
						end,
						tut.ADVICE_DURATION_S
					)
				end,
				2
			)

			-- In case the player clicks before the advice is ready
			cm:callback(
				function()
					if button_advice then
						button_advice:Highlight(false, false)
					end
				end,
				tut.ADVICE_DURATION_S
			)
		end
	)
end

function t1_pre_end_turn_checkpoint()
	cm:checkpoint_reached(
		120,														-- checkpoint id
		t1_prepare_to_end_turn,									-- post-update callback
		tut.SHOULD_SAVE_EVERY_CHECKPOINT_START_END or false,											-- should save game
		tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or false			-- always generate named savegame, rather than autosaving
	)
end


--------------------------------------------------------------------------------------------------
-- CHECKPOINT 120: before ending turn
--------------------------------------------------------------------------------------------------

local checkpoint_120_str = "1 " .. common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_end_turn")

cm:add_checkpoint( 
	120,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		core:progress_on_loading_screen_dismissed(t1_prepare_to_end_turn)
	end,
	false,													-- call function when checkpoint reached
	checkpoint_120_str												-- opt string name
)

cm:add_checkpoint_setup_callback(
	120,													-- checkpoint id to add setup callback
	function(is_loading_game, checkpoint_id)				-- setup function
		--uim:override("hide_sidemenu"):unlock()
	end,
	true													-- call function when checkpoint reached
)


function t1_prepare_to_end_turn()
	cm:clear_infotext()
	cm:show_advice(
		tut.advisor_texts.turn_1.v2_end_turn_pract.advice_key,
		false,
		false,
		function()
			cm:hide_advisor_without_infotexts()
		end,
		tut.ADVICE_DURATION_S
	)
	tut_add_infotext(tut.advisor_texts.turn_1.v2_end_turn_pract.infotext)
	
	cm:set_objective(tut.advisor_texts.turn_1.v2_end_turn_pract.objective_key)
	end_turn_highlight(true)
	t2_start_listener()
	t1_add_sukkot_generals_spawn_listener()
end

--------------------------------------------------------------------------------------------------
-- CHECKPOINT 130: End-turn Sukhot active sequence
--------------------------------------------------------------------------------------------------

local checkpoint_130_str = "1 " .. common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_end")

cm:add_checkpoint( 
	130,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		t1_add_sukkot_generals_spawn_listener()
	end,
	false,													-- call function when checkpoint reached
	checkpoint_130_str						-- opt string name
)


cm:add_checkpoint_setup_callback(
	130,														-- checkpoint id to add setup callback
	function(is_loading_game, checkpoint_id)				-- setup function
	end,
	false													-- call function when checkpoint reached
)

function t2_setup_pre_sukkot_active()
	tut_skip_sukhot_faction_turns(false)
end

function t1_add_sukkot_generals_spawn_listener()
	core:add_listener(
		"FTUE_FactionTurnEnd_1",
		"FactionTurnEnd",
		function(context) return context:faction():name() == tut.player_faction_key and cm:turn_number() == 1 end,
		function(context)
			cm:checkpoint_reached(
				130,														-- checkpoint id
				nil,													-- post-update callback
				false													-- should save game
			)

			cm:complete_objective(tut.advisor_texts.turn_1.v2_end_turn_pract.objective_key)
			cm:remove_objective(tut.advisor_texts.turn_1.v2_end_turn_pract.objective_key)
			cm:remove_objective(tut.advisor_texts.turn_1.v2_advisor_button_1_mern.objective_key)

			cm:disable_movement_for_faction(tut.sukhot_faction_key)

			cm:create_force_with_general(
				tut.sukhot_faction_key,
				"phar_main_nat_wes_libu_tribesmen,phar_main_nat_wes_libu_tribesmen,phar_main_nat_wes_libu_tribesmen,",
				"phar_main_east_sinai_beersheba",
				646,
				899,
				"general",
				"phar_main_general_canaan",
				"names_name_75711759",
				"",
				"",
				"",
				false,
				function(cqi)
					local character = cm:get_character_by_cqi(cqi)
					local fm_cqi = character:family_member():command_queue_index()
					cm:set_saved_value("sukkot_hero_1_fm_cqi", fm_cqi)
					tut.sukkot_hero_1_fm_cqi = fm_cqi

					cm:add_unit_model_overrides(cm:char_lookup_str_fm(tut.sukkot_hero_1_fm_cqi), "phar_main_bodyguard_hero_can_gen_club_medium_small")
					local general_unit_cqi = character:commanded_unit():command_queue_index()
					cm:upgrade_unit(general_unit_cqi, "phar_main_bodyguard_can_gen_club_medium_small")
					
					t2_setup_pre_sukkot_active()
				end
			)

			cm:create_force_with_general(
				tut.sukhot_faction_key,
				"phar_main_nat_wes_libu_tribesmen,phar_main_nat_wes_libu_tribesmen,phar_main_nat_wes_libu_tribesmen,",
				"phar_main_east_sinai_beersheba",
				638,
				904,
				"general",
				"phar_main_general_canaan",
				"names_name_1970331280",
				"",
				"",
				"",
				false,
				function(cqi)
					local character = cm:get_character_by_cqi(cqi)
					local fm_cqi = character:family_member():command_queue_index()
					cm:set_saved_value("sukkot_hero_2_fm_cqi", fm_cqi)
					tut.sukkot_hero_2_fm_cqi = fm_cqi

					cm:add_unit_model_overrides(cm:char_lookup_str_fm(tut.sukkot_hero_2_fm_cqi), "phar_main_bodyguard_hero_can_gen_khopesh_medium_small")
					local general_unit_cqi = character:commanded_unit():command_queue_index()
					cm:upgrade_unit(general_unit_cqi, "phar_main_bodyguard_can_gen_khopesh_medium_small")
				end
			)
			cm:create_force_with_general(
				tut.sukhot_faction_key,
				"phar_main_nat_wes_libu_tribesmen,phar_main_nat_wes_libu_tribesmen,",
				"phar_main_east_sinai_beersheba",
				651,
				913,
				"general",
				"phar_main_general_canaan",
				"names_name_1679009473",
				"",
				"",
				"",
				false,
				function(cqi)
					local character = cm:get_character_by_cqi(cqi)
					local fm_cqi = character:family_member():command_queue_index()
					cm:set_saved_value("sukkot_hero_3_fm_cqi", fm_cqi)
					tut.sukkot_hero_3_fm_cqi = fm_cqi

					cm:add_unit_model_overrides(cm:char_lookup_str_fm(tut.sukkot_hero_3_fm_cqi), "phar_main_bodyguard_hero_can_gen_spear_medium_small")
					local general_unit_cqi = character:commanded_unit():command_queue_index()
					cm:upgrade_unit(general_unit_cqi, "phar_main_bodyguard_can_gen_spear_medium_small")
				end
			)
		end,
		false
	)
	core:add_listener(
		"FTUE_SukhotFactionTurnStart_1",
		"FactionBeginTurnPhaseNormal",
		function(context) return context:faction():name() == tut.sukhot_faction_key and cm:turn_number() == 1 end,
		function(context)
			cm:disable_movement_for_faction(tut.sukhot_faction_key)
			if not tut.sukkot_hero_1_fm_cqi then
				script_error("ERROR: sukkot_hero_1_fm_cqi not set! Player will not be attacked.")
				return
			end
			

			-- local teleport_succeeded = cm:teleport_to("character_fm_cqi:" .. tut.sukkot_hero_1_fm_cqi, 651,913)	
			-- if teleport_succeeded then
			-- 	cm:disable_movement_for_faction(tut.sukhot_faction_key)
			-- else
			-- 	script_error("ERROR: sukkot character teleport is unsuccessful.")
			-- 	return
			-- end
		end,
		false
	)
end