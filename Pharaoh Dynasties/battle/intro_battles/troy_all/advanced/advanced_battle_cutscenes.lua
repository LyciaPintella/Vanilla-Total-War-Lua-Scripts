bm:out("Battle cutscenes loaded")

-- mute sounds for intro cutscene
--[[ bm:set_volume(VOLUME_TYPE_MUSIC, 0)
bm:set_volume(VOLUME_TYPE_SFX, 0)
bm:set_volume(VOLUME_TYPE_VO, 0) ]]

intro_scene_advisors = {
	"troy_tut_battle_adv_intro_01",
	"troy_tut_battle_adv_intro_02"
}


advanced_battle_intro_scene_length = 43000 --43sec
advanced_battle_intro_scene_path = "script/battle/intro_battles/troy_all/advanced/battles_flyovers/scenes/advanced_battle_r01_s01.CindyScene"
advanced_battle_intro_scene = cutscene:new_from_cindyscene(
	"advanced_battle_intro_scene_cindy",
	sunits_player_all,
	function()
		-- end callback
		out("INTRO CALLBACK ENDED")
		play_cutscene_intro()
	end,
	advanced_battle_intro_scene_path,
	advanced_battle_intro_scene_length,
	2, --fade in
	6 -- fadeout
)
advanced_battle_intro_scene:set_skippable(true)
-- advanced_battle_intro_scene:set_debug(true)

advanced_battle_intro_scene:action(
	function()
		bm:camera():move_to(v(248.0, 1382.0, -6.6), v(228.4, 1379.9, 31.2), 0, false, 0, false);
	end,
	0
);

advanced_battle_intro_scene:action(
	function()
		bm:camera():fade(false, 1);
	end,
	1000
);


advanced_battle_intro_scene:action(
	function()
		-- Time for some Homer lines
		bm:queue_advisor(intro_scene_advisors[1])
	end,
	10000
)

advanced_battle_intro_scene:action(
	function()
		-- Time for some Homer lines
		bm:queue_advisor(intro_scene_advisors[2])
	end,
	27000
)


cutscene_intro_length = 15000
cutscene_guard_length = 10000
cutscene_enemy_introduction_length = 15000

cutscene_intro = cutscene:new(
	"cutscene_intro", 						-- unique string name for cutscene
	sunits_player_all, 					-- unitcontroller over player's army
	cutscene_intro_length,					-- duration of cutscene in ms
	function() 								-- what to call when cutscene is finished
		bm:set_volume(VOLUME_TYPE_MUSIC, 100);
		bm:set_volume(VOLUME_TYPE_SFX, 100);
		bm:set_volume(VOLUME_TYPE_VO, 100);
		start_battle()
	end
)

cutscene_guard_mode = cutscene:new(
	"cutscene_guard_mode",
	sunits_player_all,
	cutscene_guard_length,
	function()
		bm:out("GUARDMODE CUTSCENE BOI")
		sunits_player_all:release_control()
		start_army_selection_advice_advice()
	end
)

cutscene_enemy_introduction = cutscene:new(
	"cutscene_enemy_introduction",
	sunits_player_all,
	cutscene_enemy_introduction_length,
	function()
		bm:out("CUTSCENE BE SHOWING ENEMEIS MON")
		-- call something here
		local enemy_sunits = sunits_enemy_start:get_sunit_table()
		bm:callback(function() append_movement_controls_to_cheat_sheet() end, 1000)
		sunits_enemy_start:get_unitcontroller():take_control()
		form_up_enemy(true)
		bm:callback(function() warn_if_players_forces_separated_during_attack() end, 3000)
		start_attacking_advise()
	end
	)

cutscene_enemy_introduction:set_skippable(false)

cutscene_intro:set_skippable(true, function() skip_cutscene_intro() end)
cutscene_guard_mode:set_skippable(true, function() skip_cutscene_intro() end)

function play_cutscene_intro()
	local cam_pos = v(-27.515114, 1351.240723, -330.716858)
	local cam_targ = v(-25.817673, 1349.625244, -311.02063)

	cutscene_intro:set_skip_camera(cam_pos, cam_targ);

	cutscene_intro:action(function() cam:fade(false, 1) end, 0);

	cutscene_intro:action(function() cam:move_to(v(-2.615, 1417.4310, 97.851), v( -122.1786, -162.26, -2087.362), 0, false, -1) end, 100);
	cutscene_intro:action(function() cam:move_to(v(-20.6477, 1357.430, -84.2203), v(-43.1117, -222.25, -2272.5), 7.5, false, -1) end, 7500);

	cutscene_intro:action(function() cam:move_to(cam_pos, cam_targ, 4, false, 0) end, 15000);

	cutscene_intro:start();
end

function play_guard_mode_cutscene()
	-- sunits_player_all:take_control()
	local cam_pos = cam:position();
	local cam_targ = cam:target();
	cutscene_guard_mode:set_skip_camera(cam_pos, cam_targ);

	cutscene_guard_mode:action(function() cam:move_to(v(10.919728, 1431.690, -2.52309), v( -94.216, -506.65, -1877.58), 5, false, -1) end, 0);
	cutscene_guard_mode:action(function() cam:move_to(v(-13.5636243, 1360.2785, -69.8492), v(-78.719520, -40.99, -2375.548), 5, false, -1) end, 5000);

	cutscene_guard_mode:action(function() cam:move_to(cam_pos, cam_targ, 4, false, 0) end, 10000);
	cutscene_guard_mode:start()
end

function skip_cutscene_intro()
	bm:hide_subtitles();
end;
