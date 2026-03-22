output_uicomponent_on_click();
bm:out("Battle main loaded")

--get_objectives_manager():set_debug();

advisor_texts = {
	general_unit_advice = {
		advice_key = "troy_tut_battle_basic_hero_01",
		objective_key = "troy.battle.intro.general_selection_advice.005",
		info_text = {
			"troy.battle.intro.info_009",
			"troy.battle.intro.info_010"
		}
	},
	hero_movement_advice = {
		advice_key = "",
		objective_key = "troy.battle.intro.movement_advice.002",
		info_text = {
			"troy.battle.intro.info_022"
		}
	},
	generic_unit_advice = {
		advice_key = "troy_tut_battle_basic_units_01",
		objective_key = "troy.battle.intro.general_selection_advice.007",
		info_text = {
			"troy.battle.intro.info_011",
			"troy.battle.intro.info_012",
			"troy.battle.intro.info_025"
		}
	},
	early_advance_army_advice = {
		advice_key = "troy_tut_battle_basic_movement_01",
		objective_key = "troy.battle.intro.movement_advice.001",
		info_text = {
			"troy_tutorial_camp_agamemnon_army_select_info_02"
		}
	},
	lord_camera_movement_advice = {
		advice_key = "troy_tut_battle_basic_camera_hero_01",
		info_text = {
			"troy.battle.intro.info_045"
		}
	},
	army_camera_movement_advice = {
		advice_key = "troy_tut_battle_basic_camera_unit_01",
		info_text = {
			"troy.battle.intro.info_046",
			"troy.battle.intro.info_047"
		}
	},
	camera_hill_marker = {
		advice_key = "troy_tut_battle_basic_camera_enemy_01",
		info_text = {}
	},
	camera_position_advice = {
		advice_key = "troy_tut_battle_basic_camera_01",
		objective_key = "troy.battle.intro.camera_advice.001",
		info_text = {
			"troy_tutorial_camp_agamemnon_camera_info_02",
			"troy.battle.intro.info_002"
		}
	},
	movement_advice = {
		advice_key = "troy_tut_battle_basic_movement_01",
		objective_key = "troy.battle.intro.movement_advice.001",
		info_text = {
			"troy.battle.intro.info_021",
			"troy.battle.intro.info_022",
			"troy.battle.intro.info_006"
		}
	},
	attacking_advice = {
		advice_key = "troy_tut_battle_basic_attack_01",
		objective_key = "troy.battle.intro.attack_advice.001",
		info_text = {
			"troy.battle.intro.info_024",
			"troy.battle.intro.info_025",
			"troy.battle.intro.info_005"
		},
	},

	archers_selection_advice = {
		advice_key = "troy_tut_battle_basic_reinforcements_01", 
		objective_key = "troy.battle.intro.general_selection_advice.006",
		info_text = {
			"troy.battle.intro.info_026",
		}
	},

	archers_attacking_advice = {
		advice_key = "troy_tut_battle_basic_reinforcements_01", 
		objective_key = "troy.battle.intro.archers_attack_advice.001",
		info_text = {
			"troy.battle.intro.info_027",
			"troy.battle.intro.info_028"
		}
	},

	routing_monitoring_advice = {
		enemy_routs_advice_key = "troy_tut_battle_basic_victory_01",
		player_routs_advice_key = "troy_tut_battle_basic_friend_routing_01",
		enemy_info_text = {},
		player_info_text = {}
	},

	objective_complete_infotext = {
		"troy.battle.intro.info_obejctive_complete_01",
		"troy.battle.intro.info_obejctive_complete_02"
	},

	chariots_selection_advice = {
		advice_key_debug = "VI.1: Select the chariots",
		advice_key = "troy_battle_advisor_reinforcements_001",
		objective_key = "troy.battle.intro.chariots_selection_advice.001",
		info_text = {
			"troy.battle.intro.info_024"
		}
	},

	chariots_attacking_advice = {
		advice_key = "troy_tut_battle_adv_chariots_01",
		objective_key = "troy.battle.intro.attack_advice.005", 
		info_text = {
			"troy.battle.intro.info_017",
			"troy.battle.intro.info_018"
		},
	}
}

intro_scene_advisors = {
	"troy_tut_battle_basic_intro_01",
	"troy_tut_battle_basic_intro_02"
}

bm:register_phase_change_callback(
	"Deployment",
	function()
		-- prevent UI hiding
		bm:enable_ui_hiding(false);
		show_advisor_progress_buttons(false);
		-- show the cutscene borders immediately
		--bm:enable_cinematic_ui(true, true, true);
		-- override_loading_screen()
		override_loading_screen_on_skip_end()
	end
);

basic_battle_intro_scene_length = 41000 -- 41 sec
basic_battle_intro_scene_path = "script/battle/intro_battles/troy_all/basic/battles_flyovers/scenes/basic_battle_flyby.CindyScene"
basic_battle_intro_scene = cutscene:new_from_cindyscene(
	"basic_battle_intro_scene_cindy",
	sunits_player_start,
	function()
		-- end callback
		bm:setup_battle(function()
			bm:show_start_battle_button(true);
			post_cutscene_setup()
		end);
	end,
	basic_battle_intro_scene_path,
	basic_battle_intro_scene_length,
	0, -- fade in
	6 -- fade out
)

-- basic_battle_intro_scene:set_debug(true);
basic_battle_intro_scene:action(
	function()
		-- Immediately reposition the camera to something approximating the starting frame of the cindy scene
		bm:camera():move_to(v(-484.1, 1497.9, 365.1), v(-470.3, 1493.7, 379.0), 0, false, 0, false);
	end,
	0
);

basic_battle_intro_scene:action(
	function()
		-- Fade from black to picture over a second
		bm:camera():fade(false, 1);
	end,
	2000
);

basic_battle_intro_scene:action(
	function()
		-- Time for some Homer lines
		bm:queue_advisor(intro_scene_advisors[1])
	end,
	8000
)

basic_battle_intro_scene:action(
	function()
		-- Time for some Homer lines
		bm:queue_advisor(intro_scene_advisors[2])
	end,
	24000
)

bm:register_phase_change_callback(
	"PrebattleCinematic",
	function()
		-- Disable the Start Battle button, fade the screen to black immediately, and then start the intro cutscene once the loading screen has been dismissed
		bm:show_start_battle_button(false);
		bm:camera():fade(true, 0);
		core:progress_on_loading_screen_dismissed(
			function() 
				show_advisor_progress_buttons(false);
				basic_battle_intro_scene:set_skippable(true)
				basic_battle_intro_scene:start()
			end
		);
	end
);

function override_loading_screen_on_skip_end()

	-- button clicks without confirmation box
	core:add_listener(
		"skip_end_battle_listener_no_confirmation",
		"ComponentLClickUp",
		function(context) return context.string == "button_end_battle" end,
		override_loading_screen,
		false
	)

	bm:register_phase_change_callback(
		"Complete",
		override_loading_screen
	)

	-- button clicks which opens confirmation box
	core:add_listener(
		"skip_end_battle_listener_confirmation_box",
		"ComponentLClickUp",
		function(context) return context.string == "button_quit" end,
		function()
			core:add_listener(
				"skip_end_battle_listener_confirmation_box_accept",
				"ComponentLClickUp",
				function(context)
					return context.string == "button_tick"
				end,
				function(context)
					core:remove_listener("skip_end_battle_listener_confirmation_box_accept")
					core:remove_listener("skip_end_battle_listener_confirmation_box_cancel")
					override_loading_screen()
				end,
				false
			)

			core:add_listener(
				"skip_end_battle_listener_confirmation_box_cancel",
				"ComponentLClickUp",
				function(context)
					return context.string == "button_cancel"
				end,
				function(context)
					core:remove_listener("skip_end_battle_listener_confirmation_box_accept")
					core:remove_listener("skip_end_battle_listener_confirmation_box_cancel")
				end,
				false
			)
		end,
		true
	)
end

function override_loading_screen()
	bm:out("Overriding loading screen");
	common.set_custom_loading_screen_key("troy_main_intro_battle_1_quote_1");
end

function show_speed_controls(should_show)
	local buttons_holder = core:get_ui_root():SequentialFind("hud_battle", "radar_holder", "speed_controls")
	buttons_holder:SetVisible(should_show)
end

function start_battle()
	-- set up a listener which overrides the loading screen if the player skips
	show_speed_controls(false)
	bm:disable_shortcut("cycle_battle_speed", true)
	bm:disable_shortcut("cycle_battle_speed_back", true)

	bm:set_close_queue_advice(false)
	
	show_advisor_progress_buttons(false)

	bm:disable_shortcut("show_allied_units_proxies", true)
	
	-- ensure player cannot move their forces
	sunits_player_start:take_control()

	bm:callback(function() start_general_unit_card_advise() end, 500)
end

function start_general_unit_card_advise()
	append_selection_controls_to_cheat_sheet()
	show_battle_controls_cheat_sheet()
	local cam = bm:camera();
	local cam_pos = cam:position();
	local cam_targ = cam:target();

	-- allow pausing again
	--bm:disable_shortcut("toggle_pause", false);
	
	local sa = intro_battle_selection_advice:new(
		advisor_texts.general_unit_advice.advice_key,
		v(28.591085, 1390.877808, -572.462708),--v_offset(sunits_player_general.unit:position(), 0, 50, 0),
		v(29.747511, 1377.399902, -541.505127),--v_offset(sunits_player_general.unit:position(), -10, 55, -10),
		sunits_player_general,
		advisor_texts.general_unit_advice.objective_key,
		function() start_hero_moving_advice() end
	)
	
	if #advisor_texts.general_unit_advice.info_text >= 1 then
		sa:add_infotext(unpack(advisor_texts.general_unit_advice.info_text))
	end
    
    sa:set_all_player_sunits(sunits_player_start)
	sa:set_should_enable_unit_cards(false)
	sa:set_should_disable_camera(true)
	sa:set_enable_orders_on_end(false)
	sa:set_marker_position(v_offset(sunit_player_01.unit:position(), 0, 2, 0))
	sunit_player_01:highlight_unit_card(true)
	sa:start();
end

function start_hero_moving_advice()
	local hero_target_position = v(1.341907, 1358.943237, -482.72464)

	local ma = intro_battle_movement_advice:new(
		advisor_texts.hero_movement_advice.advice_key,
		hero_target_position,
		sunits_player_general,
		advisor_texts.hero_movement_advice.objective_key,
		function()
			start_generic_unit_card_advise() 
		end
	)
	
	ma:set_allow_orders_on_advice_delivery(true)
	-- ma:set_prevent_orders_after_movement(true)
	--ma:set_should_disable_camera(true);
	ma:set_advisor_delay(500)
	ma:set_end_on_marker_reached(true)
	ma:set_remove_marker_on_end(true)
	ma:set_marker_range(10)
	
	if #advisor_texts.hero_movement_advice.info_text >= 1 then
		ma:add_infotext(unpack(advisor_texts.hero_movement_advice.info_text))
	end
	
	ma:start()

	sunit_player_01:cache_location()

	bm:watch(
		function()
			return sunit_player_01:has_moved()
		end,
		0,
		function()
			sunit_player_01:take_control()
			sunit_player_01.uc:goto_location(hero_target_position, true)
		end,
		"ensure_units_are_moving_to_first_waypoint"
	)

	-- Check if the player unselected the general from previous step
	bm:register_unit_selection_callback(
		sunits_player_general:item(1).unit, 
		function(unit, is_selected)
			if not is_selected then
				if #advisor_texts.general_unit_advice.info_text >= 1 then
					bm:add_infotext(unpack(advisor_texts.general_unit_advice.info_text))
				end
				-- Remove selection callback, registered in previous step
				bm:unregister_unit_selection_callback(sunits_player_general:item(1).unit);
			end;
		end
	)
end

function start_generic_unit_card_advise()
	bm:out("WE STILL ON THE RIGHT TRACK MON")
	local cam = bm:camera()
	local cam_pos = cam:position()
	local cam_tar = cam:target()
	sunit_player_01:highlight_unit_card(false)
	local sa2 = intro_battle_selection_advice:new(
		advisor_texts.generic_unit_advice.advice_key,
		v(40.513706, 1410.641357, -572.459961),--v_offset(sunit_player_02.unit:position(), -140, 40, -6),
		v(46.611294, 1393.279053, -544.14032),--v_offset(sunit_player_02.unit:position(), -110, 25, -2), 
		sunits_player_start,
		advisor_texts.generic_unit_advice.objective_key,
		function() 
			bm:clear_infotext()
			start_early_advance_army_advice() 
		end
	)

	if #advisor_texts.generic_unit_advice.info_text >= 1 then
		sa2:add_infotext(unpack(advisor_texts.generic_unit_advice.info_text))
	end
	sa2:set_all_player_sunits(sunits_player_start)
	sa2:set_should_enable_unit_cards(false)
	sa2:set_should_disable_camera(true)
	sa2:set_enable_orders_on_end(false)
	-- sa2:set_marker_position(v_offset(sunit_player_02.unit:position(), 0, 2, 0))
	sunits_player_start:highlight_unit_cards(true)
	sa2:start()
end

function start_early_advance_army_advice()
	local ma = intro_battle_movement_advice:new(
		advisor_texts.early_advance_army_advice.advice_key,
		v(114.69828, 1347.936035, -385.978668),
		sunits_player_start,
		advisor_texts.early_advance_army_advice.objective_key,
		function()
			wait_before_camera_advise() 
		end
	)
	
	ma:set_allow_orders_on_advice_delivery(true)
	ma:set_prevent_orders_after_movement(true)
	--ma:set_should_disable_camera(true);
	ma:set_advisor_delay(500)
	ma:set_end_on_marker_reached(true)
	ma:set_remove_marker_on_end(true)
	
	if #advisor_texts.early_advance_army_advice.info_text >= 1 then
		ma:add_infotext(unpack(advisor_texts.early_advance_army_advice.info_text))
	end
	
	ma:start()

	sunit_player_01:cache_location()
	sunit_player_02:cache_location()
	sunit_player_03:cache_location()
    sunit_player_04:cache_location()

	bm:watch(
		function()
			return any_player_unit_moving()
		end,
		0,
		function()
			sunit_player_01.uc:goto_location_angle_width(v(60.272850036621, 1332.2711181641, -393.86901855469), 322.17956542969, 1.4, true)
			sunit_player_02.uc:goto_location_angle_width(v(91.197395324707, 1334.8405761719, -377.53884887695), 2.7630615234375, 40.40, true)
			sunit_player_03.uc:goto_location_angle_width(v(139.4983215332, 1345.9379882813, -382.82583618164), 2.8125, 40.40, true)
			sunit_player_04.uc:goto_location_angle_width(v(116.10008239746, 1343.2963867188, -404.67547607422), 2.6971435546875, 40.40, true)
		end,
		"ensure_units_are_moving_to_first_waypoint"
	)
end

function wait_before_camera_advise()
    bm:clear_infotext()

	-- Proceed when all units are idle
	bm:watch(
		function() 
			for i=1, sunits_player_start:count() do
				if sunits_player_start:item(i).unit:is_moving() then
					return false
				end
			end

			return true
		end,
		0,
		function()
			sunits_player_start:highlight_unit_cards(false)
			bm:watch(
		        function()
		            return bm:advice_finished()
		        end,
		        0,
		        function()
		            start_camera_movement_advise() 
		        end,
		        "wait_before_start_army_selection_advice"
		    );
		end
	)
end

function start_camera_movement_advise() 
	bm:out("MOVING IN THE RIGHT DIRECTION MON")

	sunits_player_start:take_control()

	local cam = bm:camera();
	local cam_pos = cam:position();
	local cam_targ = cam:target();
	
	--
	-- Hero marker
	--
		
	local camera_marker_general = intro_battle_camera_marker:new(
		"general_marker",
		v_offset(sunit_player_01.unit:position(), 0, 2, 0),
		advisor_texts.lord_camera_movement_advice.advice_key
	);
	camera_marker_general:set_advisor_delay(1000);
	camera_marker_general:set_advisor_duration(10000);

	if #advisor_texts.lord_camera_movement_advice.info_text >= 1 then
		camera_marker_general:add_infotext(unpack(advisor_texts.lord_camera_movement_advice.info_text))
	end

	camera_marker_general:action(
		function()
			local unit = sunit_player_01.unit;
			local pos_officer = unit:position();
		
			local h_camera_bearing = 30;
			local v_camera_bearing = 12;
			local camera_distance = 10;
			
			local camera_pos = get_tracking_offset(pos_officer, unit:bearing() + h_camera_bearing, v_camera_bearing, camera_distance);
			
			cam:move_to(camera_pos, v_offset(pos_officer, 0, 1, 0), 2.5, false) 
		end, 
		0
	);
	
	camera_marker_general:action(
		function()
			local unit = sunit_player_01.unit;
			local pos_officer = v_offset(unit:position(), 0, 1.4, 0);
		
			local h_camera_bearing_start = 20;
			local h_camera_bearing_end = -10;
			local v_camera_bearing_start = 5;
			local v_camera_bearing_end = 5;
			local camera_distance = 4;
			
			local camera_pos_start = get_tracking_offset(pos_officer, unit:bearing() + h_camera_bearing_start, v_camera_bearing_start, camera_distance);
			local camera_pos_end = get_tracking_offset(pos_officer, unit:bearing() + h_camera_bearing_end, v_camera_bearing_end, camera_distance);
			
			cam:move_to(camera_pos_start, pos_officer, 0, false) 
			cam:move_to(camera_pos_end, pos_officer, 8, true) 
		end, 
		4500
	);
	
	camera_marker_general:action(
		function()
			local unit = sunit_player_01.unit;
			local pos_officer = v_offset(unit:position(), 0, 1.3, 0);
		
			local h_camera_bearing_start = 2;
			local h_camera_bearing_end = 2;
			local v_camera_bearing_start = 10;
			local v_camera_bearing_end = 10;
			local camera_distance_start = 4;
			local camera_distance_end = 40;
			
			local camera_pos_start = get_tracking_offset(pos_officer, unit:bearing() + h_camera_bearing_start, v_camera_bearing_start, camera_distance_start);
			local camera_pos_end = get_tracking_offset(pos_officer, unit:bearing() + h_camera_bearing_end, v_camera_bearing_end, camera_distance_end);
			
			cam:move_to(camera_pos_start, pos_officer, 0, false) 
			cam:move_to(camera_pos_end, pos_officer, 40, false) 
		end, 
		11000
	);
	
	--
	-- Army marker
	--
	
	local camera_marker_army = intro_battle_camera_marker:new(
		"army_marker",
		v_offset(sunit_player_03.unit:position(), 0, 2, 0),
		advisor_texts.army_camera_movement_advice.advice_key
	);
	camera_marker_army:set_advisor_delay(1000);
	camera_marker_army:set_advisor_duration(9000);
	if #advisor_texts.army_camera_movement_advice.info_text >= 1 then
		camera_marker_army:add_infotext(unpack(advisor_texts.army_camera_movement_advice.info_text))
	end
	
	camera_marker_army:action(
		function()
			local unit = sunit_player_03.unit;
			local pos_officer = unit:position();
		
			local h_camera_bearing = 30;
			local v_camera_bearing = 12;
			local camera_distance = 20;
			
			local camera_pos = get_tracking_offset(pos_officer, unit:bearing() + h_camera_bearing, v_camera_bearing, camera_distance);
			
			cam:move_to(camera_pos, v_offset(pos_officer, 0, 1, 0), 2.5, false) 
		end, 
		0
    );
    
    camera_marker_army:action(
		function()
			local unit = sunit_player_03.unit;
			local pos_officer = v_offset(unit:position(), 0, 2, 0);
		
			local h_camera_bearing_start = 2;
			local h_camera_bearing_end = 2;
			local v_camera_bearing_start = 10;
			local v_camera_bearing_end = 10;
			local camera_distance_start = 4;
			local camera_distance_end = 30;
			
			local camera_pos_start = get_tracking_offset(pos_officer, unit:bearing() + h_camera_bearing_start, v_camera_bearing_start, camera_distance_start);
			local camera_pos_end = get_tracking_offset(pos_officer, unit:bearing() + h_camera_bearing_end, v_camera_bearing_end, camera_distance_end);
			
			cam:move_to(camera_pos_start, pos_officer, 0, false, 40) 
			cam:move_to(camera_pos_end, pos_officer, 40, false, 40) 
		end, 
		5000
	);
	
	--
	-- Hill marker
	--
	
	local camera_marker_hill = intro_battle_camera_marker:new(
		"hill_marker",
		v(64.7,1314.7,-216.4), 
		advisor_texts.camera_hill_marker.advice_key,
		100
	)

	camera_marker_hill:set_advisor_delay(1000)
	camera_marker_hill:set_advisor_duration(9000)
	
	if #advisor_texts.camera_hill_marker.info_text >= 1 then
		camera_marker_hill:add_infotext(unpack(advisor_texts.camera_hill_marker.info_text))
	end

	--
	-- Container
	--
	
	local ca = intro_battle_camera_positions_advice:new(
		advisor_texts.camera_position_advice.advice_key,
		sunits_player_all,
		advisor_texts.camera_position_advice.objective_key,
		function() wait_before_start_enemy_introduction_advise() end,
		{camera_marker_general, camera_marker_army, camera_marker_hill}
	);
	ca.help_panel_camera_info_callback = false -- Don't show camera cheat sheets here.
	
	--ca.should_skip = true;	-- uncomment to immdiately skip camera advice section
	ca.trigger_threshold = 62
	ca:start();
end

function wait_before_start_enemy_introduction_advise()

	bm:watch(
        function()
            return bm:advice_finished()
        end,
        0,
        function()
            bm:callback(
                function() 
                    show_advisor_progress_buttons(false);
                    start_enemy_introduction_advise() 
                end, 
                500
            );
        end,
        "wait_before_start_enemy_introduction_advice"
    );
end

waypoint_marker_pos = v(64.7,1314.7,-216.4)

function start_enemy_introduction_advise() 

	show_advisor_progress_buttons(false);
	
	local ma = intro_battle_movement_advice:new(
		advisor_texts.movement_advice.advice_key,
		waypoint_marker_pos,
		sunits_player_start,
		advisor_texts.movement_advice.objective_key,
		function()
			play_cutscene_enemy_introduction() 
		end
	)
	
	ma:set_allow_orders_on_advice_delivery(true)
	ma:set_prevent_orders_after_movement(true)
	--ma:set_should_disable_camera(true);
	ma:set_advisor_delay(500)
	ma:set_end_on_marker_reached(true)
	ma:set_remove_marker_on_end(true)
	
	if #advisor_texts.movement_advice.info_text >= 1 then
		ma:add_infotext(unpack(advisor_texts.movement_advice.info_text))
	end
	
	ma:start()
	local cam = bm:camera();
	cam:move_to(v(142.875, 1390.85, -477.564), v(130.547, 1378.676, -449.106), 2)

	sunit_player_01:cache_location()
	sunit_player_02:cache_location()
	sunit_player_03:cache_location()
    sunit_player_04:cache_location()
	
	bm:watch(
		function()
			return any_player_unit_moving()
		end,
		0,
		function()
			sunit_player_01.uc:goto_location_angle_width(v(9.2501392364502, 1311.2023925781, -260.59631347656), 299.8388671875, 1.4, true)
			sunit_player_02.uc:goto_location_angle_width(v(33.717105865479, 1313.2443847656, -240.73086547852), 340.3125, 40.40, true)
			sunit_player_03.uc:goto_location_angle_width(v(83.310623168945, 1315.5360107422, -228.80168151855), 340.3125, 40.40, true)
			sunit_player_04.uc:goto_location_angle_width(v(76.028244018555, 1320.2565917969, -280.87850952148), 340.3125, 40.40, true)
		end,
		"ensure_player_units_are_moving_to_second_waypoint"
	)
	sunits_player_start:release_control()
end

function start_attacking_advise()
	sunits_player_start:release_control()
	
	bm:disable_orders(false)
	bm:stop_advisor_queue();
	bm:clear_infotext();
	bm:queue_advisor(advisor_texts.attacking_advice.advice_key);
	bm:set_objective(advisor_texts.attacking_advice.objective_key)
	if #advisor_texts.attacking_advice.info_text >= 1 then
		bm:add_infotext(unpack(advisor_texts.attacking_advice.info_text))
	end
	bm:add_ping_icon(71.7, 1313, -70.7, 13, false)
	append_attack_controls_to_cheat_sheet()

	bm:repeat_callback(function() halt_visible_enemy_units() end, 1000, "halt_visible_enemy_units");

	sunit_player_01:cache_location()
	sunit_player_02:cache_location()
	sunit_player_03:cache_location()
	sunit_player_04:cache_location()

	sunits_enemy_start:cache_location()
	sunits_player_start:cache_location()
	bm:watch(
		function()
		    return sunit_player_01:has_moved() or sunit_player_02:has_moved() or sunit_player_03:has_moved() or sunit_player_04:has_moved()
		end,
		0,
		function()
		    bm:remove_ping_icon(71.7, 1313, -70.7)
		    bm:remove_process("halt_visible_enemy_units");
		    sunits_enemy_start:attack_enemy_scriptunits(sunits_player_start, true)
		    sunits_player_start:attack_enemy_scriptunits(sunits_enemy_start, true)
		end,
		"wait_for_attack_initiated"
	)

	bm:watch(
        function()
            return distance_between_forces(sunits_enemy_start, sunits_player_start_no_bowmen) < 10
        end,
        0,
        function()
            bm:remove_process("wait_for_attack_initiated");
            bm:complete_objective(advisor_texts.attacking_advice.objective_key)
            bm:remove_objective(advisor_texts.attacking_advice.objective_key)
            bm:callback(function() 
            		bm:callback(wait_before_chariots_selection_advice, 1000)
            	end, 
            	1000
            )
        end,
        "wait_before_start_to_attack"
    );


	sunits_player_start:max_casualties(0.7, true);
	sunits_player_start:release_control()

	-- set enemy forces to be fearless
	sunits_enemy_start:morale_behavior_fearless();
end


function any_player_unit_moving()
	if sunits_player_start:have_any_moved() then
		return true
	end
	return false
end

function wait_before_chariots_selection_advice()
	bring_in_chariots_reinforcements()

	bm:callback(
		function()
			sunit_player_chariot_01:teleport_to_location(v(-99.291, 1306.365, 152.331), 149.06, 32)

			bm:callback(
				function()
					sunit_player_chariot_01:set_enabled(true)
					sunits_player_chariots:release_control()

					-- local cam = bm:camera();
					-- cam:move_to(v(-99.975388, 1321.261353, 160.799423), v(19.373383, 1273.42041, 26.105453), 2)
					sunit_player_chariot_01.uc:goto_location(v(-73.096, 1319.45, 115.882), true)

					bm:watch(
						function()
							return not sunit_player_chariot_01.unit:is_moving()
						end,
						1000,
						start_chariots_selection_advice
					)
				end,
				150
			)
		end,
		500,
		"enable_reinforcements"
	)
end

function start_chariots_selection_advice()
	local cam = bm:camera();
	local cam_pos = cam:position();
	local cam_targ = cam:target();

	local sa = intro_battle_selection_advice:new(
		advisor_texts.chariots_selection_advice.advice_key,
		v(-99.975388, 1321.261353, 160.799423), 
		v(19.373383, 1273.42041, 26.105453),
		sunits_player_chariots,
		advisor_texts.chariots_selection_advice.objective_key,
		function() start_chariots_attacking_advice() end
	)
	
	if #advisor_texts.chariots_selection_advice.info_text >= 1 then
		sa:add_infotext(unpack(advisor_texts.chariots_selection_advice.info_text))
	end
    
    sa:set_all_player_sunits(sunits_player_all)
	sa:set_should_enable_unit_cards(false)
	sa:set_should_disable_camera(false)
	sa:set_enable_orders_on_end(true)
	sa:set_marker_position(v(-73.096, 1319.45, 115.882))
	sunit_player_chariot_01:highlight_unit_card(true)
	sa:start();
end

function start_chariots_attacking_advice()
	sunit_player_chariot_01:highlight_unit_card(false)

	bm:stop_advisor_queue();
	bm:clear_infotext();
	bm:queue_advisor(advisor_texts.chariots_attacking_advice.advice_key);
	bm:set_objective(advisor_texts.chariots_attacking_advice.objective_key)
	if #advisor_texts.chariots_attacking_advice.info_text >= 1 then
		bm:add_infotext(unpack(advisor_texts.chariots_attacking_advice.info_text))
	end

	local ping_pos = sunit_enemy_02.unit:position()

	bm:add_ping_icon(ping_pos:get_x(), ping_pos:get_y() + 15, ping_pos:get_z(), 13, false)
	sunits_player_start:stop_attack_enemy_scriptunits()
	bm:callback(function() sunits_player_all:release_control() end, 500)

	bm:watch(
        function()
            return sunit_player_chariot_01:is_in_melee()
        end,
        0,
        function()
            bm:remove_ping_icon(ping_pos:get_x(), ping_pos:get_y() + 15, ping_pos:get_z())
			bm:complete_objective(advisor_texts.chariots_attacking_advice.objective_key)
			bm:remove_objective(advisor_texts.chariots_attacking_advice.objective_key)
			bm:clear_infotext();
			bm:stop_advisor_queue(true);


            sunits_enemy_start:morale_behavior_default();
    		sunits_enemy_start:rout_on_casualties(0.3);

            monitor_for_routing()
        end,
        "wait_before_chariots_start_to_attack"
    );
end

function monitor_for_routing()
	bm:out("monitor_for_routing() called");
	bm:remove_process("wait_before_archers_start_to_atack")
    
    highlight_advisor_progress_button(false);
    sunits_player_all:release_control()
	
	sunits_enemy_start:rout_over_time(20000)
	
	local ra = intro_battle_routing_advice:new(
		sunits_player_start,
		sunits_enemy_start,
		advisor_texts.routing_monitoring_advice.enemy_routs_advice_key, -- advice for if enemy units start to rout
		advisor_texts.routing_monitoring_advice.player_routs_advice_key, -- advice for if the players units start to rout
		function() sunits_player_all:release_control() end,		-- function to call when all enemy sunits rout
		function() end				-- function that routs the player army (over time)		
	);
	
	if #advisor_texts.routing_monitoring_advice.enemy_info_text >= 1 then
		ra:add_enemy_routs_infotext(1, unpack(advisor_texts.routing_monitoring_advice.enemy_info_text))
	end
	
	if #advisor_texts.routing_monitoring_advice.player_info_text >= 1 then
		ra:add_player_routs_infotext(1, unpack(advisor_texts.routing_monitoring_advice.player_info_text))
	end

	ra:set_enemy_units_routing_treshold(sunits_enemy_start:count())
	ra:set_player_units_routing_treshold(10000)
	
	ra:start();
end;
