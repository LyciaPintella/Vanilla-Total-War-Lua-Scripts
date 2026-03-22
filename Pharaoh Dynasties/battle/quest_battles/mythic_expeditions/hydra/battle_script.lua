load_script_libraries();
local file_name, file_path = get_file_name_and_path()

package.path = file_path .. "/?.lua;" .. package.path

bm = battle_manager:new(empire_battle:new());
cam = bm:camera();

local cam_pos =  v( 44.705 , 25.061 , -62.119 )
local cam_targ = v( 57.789 , 18.431 , -48.524 )

local skip_cam_pos 	 = v( 140.113 , 63.984 , 140.902 )
local skip_cam_targ  = v( 135.248 , 61.856 , 125.950 )

gb = generated_battle:new(
	true,  					-- screen starts black
	true,  					-- prevent deployment for player
	true,  					-- prevent deployment for ai
	function() 				-- player cutscene function
		end_deployment_phase()
	end,
	false   				-- debug mode
);

bm:register_phase_change_callback(
	"Startup",
	function()
		local sfx = new_sfx("Battle_Quest_Prebattle_Start");
		play_sound_2D(sfx);

		cam:fade(true, 0);
		cam:move_to(cam_pos, cam_targ, 0)
	end
)

gb.bm = bm

player = gb:get_army(gb:get_player_alliance_num(), 1, "");

-- intro scene
cutscene_intro_length = 56000
cutscene_intro_file = "script/battle/quest_battles/mythic_expeditions/battle_flyovers/scenes/hydra_flyby_s01.CindyScene"
local audio_events = {
	-- ["sound_event_id"] = time,
	["Flyover_Hydra_Start"] = 0,
	["Flyover_Hydra_End"] = cutscene_intro_length,
}
local skip_audio_event = "Flyover_Hydra_Skip"

function end_deployment_phase()

	-- disable orders during fly-by
	bm.battle:disable_orders(true)

	local advice_to_play = {};
	advice_to_play[1] = "troy_mth_qb_intro_hydra_1"
	advice_to_play[2] = "troy_mth_qb_intro_hydra_2"
	advice_to_play[3] = "troy_mth_qb_intro_hydra_3"

	out("PREBATTLE CINEMATIC STARTED")

	local cutscene_intro = cutscene:new_from_cindyscene(
		"intro_cutscene_cindy",
		player.sunits,
		function()
			-- end callback
			out("INTRO SCENE ENDED")
			bm:hide_subtitles();
			gb.sm:trigger_message("intro_cutscene_end")
			-- re-enable orders
			bm.battle:disable_orders(false)
			player.sunits:get_unitcontroller():fire_at_will(true)
			player.sunits:get_unitcontroller():release_control()
		end,
		cutscene_intro_file,
		cutscene_intro_length,
		0,
		4
	)

	local subtitles = cutscene_intro:subtitles()
	subtitles:set_alignment("bottom_centre")
	subtitles:clear()

	cutscene_intro:set_skip_camera(skip_cam_pos, skip_cam_targ);
	
	local is_multiplayer = bm:is_multiplayer()
	cutscene_intro:set_skippable(not is_multiplayer, skip_cutscene_intro) -- set it to be skippable only in in SP mode
	cutscene_intro:set_show_cinematic_bars(false)

	-- actions for audio events
	for audio_event_id, time in pairs(audio_events) do 
		cutscene_intro:action(
			function() 
				--bm:play_music(audio_event_id)
				local sfx = new_sfx(audio_event_id)
				play_sound_2D(sfx)
			end, 
			time
		)
	end

	cutscene_intro:action(
		function() 
			cam:fade(false, 1) 
		end, 
		100
	)

	cutscene_intro:action(
		function()
			bm:queue_advisor(advice_to_play[1])
		end,
		4900
	)

	cutscene_intro:action(
		function()
			bm:queue_advisor(advice_to_play[2])
		end,
		21000
	)

	cutscene_intro:action(
		function()
			bm:queue_advisor(advice_to_play[3])
		end,
		34000
	)

	cutscene_intro:start()
end

function skip_cutscene_intro()
	out("SKIPPING....")
	bm:hide_subtitles()
	gb.sm:trigger_message("intro_cutscene_end")
	--bm:play_music(skip_audio_event)
	local sfx = new_sfx(skip_audio_event)
	play_sound_2D(sfx)
	-- re-enable orders
	bm.battle:disable_orders(false)
	player.sunits:get_unitcontroller():fire_at_will(true)
	player.sunits:get_unitcontroller():release_control()
end

-- First wave
fw_drinkers = gb:get_army(gb:get_non_player_alliance_num(1), 1, "first_wave_drinkers");
fw_priest   = gb:get_army(gb:get_non_player_alliance_num(1), 1, "first_wave_priest");

-- Second wave
sw_drinkers  = gb:get_army(gb:get_non_player_alliance_num(1), 1, "second_wave_drinkers");
sw_archers   = gb:get_army(gb:get_non_player_alliance_num(1), 1, "second_wave_archers");
sw_defenders = gb:get_army(gb:get_non_player_alliance_num(1), 1, "second_wave_defenders");

-- Third wave
tw_hydra   = gb:get_army(gb:get_non_player_alliance_num(1), 1, "third_wave_hydra");
tw_priests = gb:get_army(gb:get_non_player_alliance_num(1), 1, "third_wave_priests");
tw_drinkers= gb:get_army(gb:get_non_player_alliance_num(1), 1, "third_wave_drinkers");

-- Pre-deployment
bm:register_phase_change_callback(
	"PrebattleCinematic",
	function()
		--player		:set_visible_to_all(true)
		fw_drinkers :set_visible_to_all(true)
		fw_priest   :set_visible_to_all(true)
		fw_priest   :release_on_message("intro_cutscene_end", 0)
		sw_drinkers :set_enabled(false)
		sw_archers  :set_enabled(false)
		sw_defenders:set_enabled(false)
		tw_hydra    :set_enabled(false)
		tw_priests  :set_enabled(false)
		tw_drinkers :set_enabled(false)
		-- stop player from shooting during the cutscene
		player.sunits:get_unitcontroller():fire_at_will(false)

		fw_priest.sunits:item(1).uc:teleport_to_location(v(185, 4, 241), 225, 20)
		fw_drinkers.sunits:item(1).uc:teleport_to_location(v(260, 4, 0), 270, 20)
		fw_drinkers.sunits:item(2).uc:teleport_to_location(v(260, 4, 20), 270, 20)
		fw_drinkers.sunits:item(3).uc:teleport_to_location(v(260, 4, 40), 270, 20)
		fw_drinkers.sunits:item(4).uc:teleport_to_location(v(260, 4, 60), 270, 20)
		fw_drinkers.sunits:item(5).uc:teleport_to_location(v(260, 4, 80), 270, 20)
		fw_drinkers.sunits:item(6).uc:teleport_to_location(v(260, 4, 100), 270, 20)
		fw_drinkers.sunits:item(7).uc:teleport_to_location(v(80, 4, 225), 180, 20)
		fw_drinkers.sunits:item(8).uc:teleport_to_location(v(100, 4, 225), 180, 20)
		fw_drinkers.sunits:item(9).uc:teleport_to_location(v(120, 4, 225), 180, 20)
		fw_drinkers.sunits:item(10).uc:teleport_to_location(v(140, 4, 225), 180, 20)
		fw_drinkers.sunits:item(11).uc:teleport_to_location(v(160, 4, 225), 180, 20)
		fw_drinkers.sunits:item(12).uc:teleport_to_location(v(180, 4, 225), 180, 20)

		sw_drinkers.sunits:item(1).uc:teleport_to_location(v(-50, 2, 310), 180, 20)
		sw_drinkers.sunits:item(2).uc:teleport_to_location(v(145, 2, -285), 0, 20)
		sw_archers.sunits:item(1).uc:teleport_to_location(v(-140, 5, -285), 0, 20)
		sw_archers.sunits:item(2).uc:teleport_to_location(v(-300, 5, -122), 90, 20)
		sw_archers.sunits:item(3).uc:teleport_to_location(v(-200, 3, 283), 120, 20)
		sw_archers.sunits:item(4).uc:teleport_to_location(v(350, 10, -135), 270, 20)
		sw_defenders.sunits:item(1).uc:teleport_to_location(v(-150, 3, -245), 0, 20)
		sw_defenders.sunits:item(2).uc:teleport_to_location(v(-110, 3, -245), 0, 20)
		sw_defenders.sunits:item(3).uc:teleport_to_location(v(-260, 3, -130), 90, 20)
		sw_defenders.sunits:item(4).uc:teleport_to_location(v(-260, 3, -170), 90, 20)
		sw_defenders.sunits:item(5).uc:teleport_to_location(v(-166, 3, 267), 120, 20)
		sw_defenders.sunits:item(6).uc:teleport_to_location(v(-193, 3, 247), 120, 20)
		sw_defenders.sunits:item(7).uc:teleport_to_location(v(330, 3, -142), 270, 20)
		sw_defenders.sunits:item(8).uc:teleport_to_location(v(330, 3, -102), 270, 20)

		tw_hydra.sunits:item(1).uc:teleport_to_location(v(-425, 7, 0), 270, 20)
		tw_priests.sunits:item(1).uc:teleport_to_location(v(-400, 7, 70), 270, 20)
		tw_priests.sunits:item(2).uc:teleport_to_location(v(-400, 7, -70), 270, 20)
		tw_priests.sunits:item(3).uc:teleport_to_location(v(379, 12, -124), 270, 20)
		tw_drinkers.sunits:item(1).uc:teleport_to_location(v(-380, 7, -70), 270, 20)
		tw_drinkers.sunits:item(2).uc:teleport_to_location(v(-360, 7, -70), 270, 20)
		tw_drinkers.sunits:item(3).uc:teleport_to_location(v(-340, 7, -70), 270, 20)
	end
)

-- Speed run setup
second_wave_sent = false
is_speedrun = false
tw_hydra.sm:add_listener(
	"send_second_wave",
	function()
		second_wave_sent = true
	end
)
player:message_on_proximity_to_position("player_approached_hydra_pre_phase_2", v(-425, 7, 0), 270)
tw_hydra.sm:add_listener(
	"player_approached_hydra_pre_phase_2",
	function()
		if not second_wave_sent then
			is_speedrun = true
			gb:message_on_time_offset(
				"player_started_speedrun",
				0,
				true
			)
			gb:message_on_time_offset(
				"send_second_wave",
				0,
				true
			)
		end
	end
)
gb:fail_objective_on_message("player_started_speedrun", "troy.battle.mth.hydra.defeat.drinkers")
gb:set_objective_on_message("player_started_speedrun", "troy.battle.mth.hydra.defeat.monster.and.priests")

-- First wave
fw_drinkers:attack_force_on_message("intro_cutscene_end", player)
gb:set_objective_on_message("intro_cutscene_end", "troy.battle.mth.hydra.defeat.drinkers")
fw_drinkers:message_on_rout_proportion("send_second_wave", 0.8)

tw_hydra.sm:add_listener(
	"intro_cutscene_end",
	function()
		tw_hydra.sunits:item(1).uc:morale_behavior_fearless()
		fw_priest.sunits:item(1).uc:morale_behavior_fearless()
		tw_priests.sunits:item(1).uc:morale_behavior_fearless()
		tw_priests.sunits:item(2).uc:morale_behavior_fearless()
		tw_priests.sunits:item(3).uc:morale_behavior_fearless()
	end
)


-- Second wave
bm:register_phase_change_callback(
	"PrebattleCinematic",
	function()
		sw_drinkers :set_enabled_on_message("send_second_wave", true)
		sw_archers  :set_enabled_on_message("send_second_wave", true)
		sw_defenders:set_enabled_on_message("send_second_wave", true)
		sw_drinkers :set_always_visible_on_message("send_second_wave", true)
		sw_archers  :set_always_visible_on_message("send_second_wave", true)
		sw_defenders:set_always_visible_on_message("send_second_wave", true)
		sw_drinkers :attack_force_on_message("send_second_wave", player)
		sw_archers  :attack_force_on_message("send_second_wave", player)
		sw_defenders:attack_force_on_message("send_second_wave", player)
		sw_drinkers :release_on_message("send_second_wave", 90)
		sw_archers  :release_on_message("send_second_wave", 90)
		sw_defenders:release_on_message("send_second_wave", 90)
	end
)

tw_hydra.sm:add_listener(
	"send_second_wave",
	function()
		bm:callback(
			function()
				tw_hydra.sm:trigger_message("send_third_wave");
			end,
			15000
		);
	end
)

--gb:complete_objective_on_message("send_second_wave", "troy.battle.mth.hydra.defeat.drinkers")
--gb:set_objective_on_message("send_second_wave", "troy.battle.mth.hydra.defeat.monster")
tw_hydra.sm:add_listener(
	"send_second_wave",
	function()
		if not is_speedrun then 
			bm:complete_objective("troy.battle.mth.hydra.defeat.drinkers")
			gb.current_objectives["troy.battle.mth.hydra.defeat.drinkers"] = false

			bm:set_objective("troy.battle.mth.hydra.defeat.monster")
			gb.current_objectives["troy.battle.mth.hydra.defeat.monster"] = true
		end
	end
)

-- Third wave
bm:register_phase_change_callback(
	"PrebattleCinematic",
	function()
		tw_hydra  :set_enabled_on_message("send_third_wave", true)
		tw_priests:set_enabled_on_message("send_third_wave", true)
		tw_drinkers:set_enabled_on_message("send_third_wave", true)
		tw_hydra  :set_always_visible_on_message("send_third_wave", true)
		tw_priests:set_always_visible_on_message("send_third_wave", true)
		tw_drinkers:set_always_visible_on_message("send_third_wave", true)
		tw_hydra  :release_on_message("send_third_wave", 0)
		tw_priests:release_on_message("send_third_wave", 0)
		tw_drinkers:release_on_message("send_third_wave", 0)
	end
)

-- Global events
hydra_dead = false
fw_priest_dead = false
tw_priests_dead = false
tw_hydra:message_on_casualties("hydra_dead", 0.999)
tw_priests:message_on_casualties("tw_priests_dead", 0.999)
fw_priest:message_on_casualties("fw_priest_dead", 0.999)

tw_hydra.sm:add_listener(
	"hydra_dead",
	function()
		if not is_speedrun then 
			bm:complete_objective("troy.battle.mth.hydra.defeat.monster")
			gb.current_objectives["troy.battle.mth.hydra.defeat.monster"] = false;
			gb:message_on_time_offset(
				"player_won",
				100,
				true
			)
		elseif is_speedrun and fw_priest_dead and tw_priests_dead then
			bm:complete_objective("troy.battle.mth.hydra.defeat.monster.and.priests")
			gb.current_objectives["troy.battle.mth.hydra.defeat.monster.and.priests"] = false;
			gb:message_on_time_offset(
				"player_won",
				100,
				true
			)
		end 

		hydra_dead = true
	end
)

tw_hydra.sm:add_listener(
	"tw_priests_dead",
	function()
		if is_speedrun and hydra_dead and fw_priest_dead then
		    bm:complete_objective("troy.battle.mth.hydra.defeat.monster.and.priests")
			gb.current_objectives["troy.battle.mth.hydra.defeat.monster.and.priests"] = false;
			gb:message_on_time_offset(
				"player_won",
				100,
				true
			)
		end 

		tw_priests_dead = true
	end
)

tw_hydra.sm:add_listener(
	"fw_priest_dead",
	function()
		if is_speedrun and hydra_dead and tw_priests_dead then
		    bm:complete_objective("troy.battle.mth.hydra.defeat.monster.and.priests")
			gb.current_objectives["troy.battle.mth.hydra.defeat.monster.and.priests"] = false;
			gb:message_on_time_offset(
				"player_won",
				100,
				true
			)
		end 

		fw_priest_dead = true
	end
)

player:force_victory_on_message("player_won")

tw_hydra.sm:add_listener(
	"player_won",
	function()
		local fw_d = fw_drinkers.sunits:get_sunit_table()
		kill_all_sunits_in_table(fw_d)

		local fw_p = fw_priest.sunits:get_sunit_table()
		kill_all_sunits_in_table(fw_p)

		local sw_d = sw_drinkers.sunits:get_sunit_table()
		kill_all_sunits_in_table(sw_d)

		local sw_a = sw_archers.sunits:get_sunit_table()
		kill_all_sunits_in_table(sw_a)

		local sw_dd = sw_defenders.sunits:get_sunit_table()
		kill_all_sunits_in_table(sw_dd)

		local tw_h = tw_hydra.sunits:get_sunit_table()
		kill_all_sunits_in_table(tw_h)

		local tw_p = tw_priests.sunits:get_sunit_table()
		kill_all_sunits_in_table(tw_p)

		local tw_d = tw_drinkers.sunits:get_sunit_table()
		kill_all_sunits_in_table(tw_d)

		bm:callback(
			function()
				bm:end_battle()
			end,
			100
		)
	end
)

function kill_all_sunits_in_table(sunits_table)
	for i = 1, #sunits_table do
		sunits_table[i]:kill()
	end
end

--[[ fw_drinkers:rout_over_time_on_message("hydra_dead", 1000)
fw_priest:rout_over_time_on_message("hydra_dead", 1000)
sw_drinkers:rout_over_time_on_message("hydra_dead", 1000)
sw_archers:rout_over_time_on_message("hydra_dead", 1000)
sw_defenders:rout_over_time_on_message("hydra_dead", 1000)
tw_priests:rout_over_time_on_message("hydra_dead", 1000)
tw_drinkers:rout_over_time_on_message("hydra_dead", 1000) ]]

-- Skip weather wait
--[[ core:add_listener(
	"skip_weather",
	"PanelOpenedBattle",
	function(context) return context.string == "finish_deployment" end,
	function(context)
		local to_press = find_uicomponent(core:get_ui_root(), "button_battle_start") --"waiting_panel" , "background" , 
		to_press:SimulateLClick()
		-- Disallow deployment
		bm:setup_battle(function() gb:start_battle() end)
	end,
	false
) ]]

local is_rematch_confirmation_opened = false

core:add_listener(
	"battle_rematch_listener",
	"ComponentLClickUp",
	function(context) return context.string == "button_rematch" end,
	function(context)
		is_rematch_confirmation_opened = true
	end,
	true
)

core:add_listener(
	"battle_confirmation_dialogue_listener",
	"ComponentLClickUp",
	function(context) return context.string == "button_tick" or context.string == "button_cancel" end,
	function(context)
		-- we set the custom loading scren after we have made sure that confirmation is done on rematch dialogue
		if is_rematch_confirmation_opened and context.string == "button_tick" then
			common.set_custom_loading_screen_key("troy_mth_quest_battle_hydra")
		end

		is_rematch_confirmation_opened = false
	end,
	true
)