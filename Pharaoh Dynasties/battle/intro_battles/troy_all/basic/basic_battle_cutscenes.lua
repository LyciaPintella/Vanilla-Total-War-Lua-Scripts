bm:out("Battle cutscenes loaded")

-- mute sounds for intro cutscene
--[[ bm:set_volume(VOLUME_TYPE_MUSIC, 0)
bm:set_volume(VOLUME_TYPE_SFX, 0)
bm:set_volume(VOLUME_TYPE_VO, 0) ]]

cutscene_enemy_introduction_length = 15000

cutscene_enemy_introduction = cutscene:new(
	"cutscene_enemy_introduction",
	sunits_player_all,
	cutscene_enemy_introduction_length,
	function()
		bm:out("CUTSCENE BE SHOWING ENEMEIS MON")
		-- call something here
		local enemy_sunits = sunits_enemy_start:get_sunit_table()
		bm:callback(function() append_movement_controls_to_cheat_sheet() end, 1000)
		sunits_enemy_start:take_control()
		form_up_enemy(true)
        start_attacking_advise()
	end
)

cutscene_enemy_introduction:set_skippable(false)

function post_cutscene_setup()
	uc_enemy_01_all:take_control()
	uc_enemy_01_all:set_invisible_to_all(true, true)
	bm:out("CUTSCENE BE DONE MON")
	bm:set_volume(VOLUME_TYPE_MUSIC, 100);
	bm:set_volume(VOLUME_TYPE_SFX, 100);
	bm:set_volume(VOLUME_TYPE_VO, 100);
	start_battle()
end

function play_cutscene_enemy_introduction()
	sunits_player_start:take_control()
	teleport_enemy_army()
	uc_enemy_01_all:set_invisible_to_all(false, true) 

    local subtitles = cutscene_enemy_introduction:subtitles()
	subtitles:set_alignment("bottom_centre")
    subtitles:clear()
    
	local cam_pos = cam:position()
	local cam_targ = cam:target()
	
	cutscene_enemy_introduction:set_skip_camera(cam_pos, cam_targ)

	cutscene_enemy_introduction:action(function() cam:move_to(v(-33.85,1354.38,-252.94), v(-14.17,1354.38,-227.93), 12, false, -1) end, 0)

	cutscene_enemy_introduction:action(function() move_enemy_units_to_engage_position() end, 5)

	cutscene_enemy_introduction:action(function() cam:move_to(v(1.516611, 1358.052979, -275.620544), v(40.546589, 1324.333008, -221.220612), 0, false, -1) end, 10000)

	cutscene_enemy_introduction:start();
end


function move_enemy_units_to_engage_position() 
	sunit_player_01:cache_location()
	local pos = sunit_player_01:get_cached_position()
	local tar = v(22.5,1308.8,-144.4)
	for i=1, sunits_enemy_start:count() do
		sunits_enemy_start:item(i).uc:goto_location(tar,true)
	end
	
end

function bring_in_chariots_reinforcements() 
	sunit_player_chariot_01:set_enabled(false)

	sunit_player_chariot_01:deploy_reinforcement(true)

	bm:callback(
		function() 
			sunit_player_chariot_01:teleport_to_location(v(-99.291, 1306.365, 152.331), 149.06, 32)
		end, 
		350, 
		"reinforcements_teleport"
	)
end

function teleport_enemy_army()
	uc_enemy_01_all:take_control()
	uc_enemy_01_all:teleport_to_location(v(103.7,1304.3,-11.5), r_to_d(3.14), 60)
	uc_enemy_01_all:change_move_speed(true)
end
