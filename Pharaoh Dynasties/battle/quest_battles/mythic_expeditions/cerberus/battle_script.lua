load_script_libraries();

bm = battle_manager:new(empire_battle:new());
sm = get_messager()
cam = bm:camera();

local cam_pos =  v( -531.418 , 620.851 , 480.440 )
local cam_targ = v( -549.608 , 619.918 , 488.703 )

local skip_cam_pos 	 = v( -1.934 , 432.438 , -399.030 )
local skip_cam_targ  = v( -2.567 , 433.862 , -379.089 )

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

player = gb:get_army(gb:get_player_alliance_num(), 1, "");

-- intro scene
cutscene_intro_length = 58000
into_scene_file = "script/battle/quest_battles/mythic_expeditions/battle_flyovers/scenes/cerberus_flyover_s01.CindyScene"
local audio_events = {
	-- ["sound_event_id"] = time,
	["Flyover_Cerberus_Start"] = 0,
	["Flyover_Cerberus_End"] = cutscene_intro_length,
}
local skip_audio_event = "Flyover_Cerberus_Skip"

function end_deployment_phase()
	bm:out("\tend_deployment_phase() called");
	
	-- disable orders during fly-by
	bm.battle:disable_orders(true)

	local advice_to_play = {};
	advice_to_play[1] = "troy_mth_qb_intro_cerberus_1"
	advice_to_play[2] = "troy_mth_qb_intro_cerberus_2"
	advice_to_play[3] = "troy_mth_qb_intro_cerberus_3"
	advice_to_play[4] = "troy_mth_qb_intro_cerberus_4"

	-- declare cutscene
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
		end,
		into_scene_file,
		cutscene_intro_length,
		0,
		4
	)
		
	-- set up subtitles
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
		4800
	)

	cutscene_intro:action(
		function()
			bm:queue_advisor(advice_to_play[2])
		end,
		15000
	)

	cutscene_intro:action(
		function()
			bm:queue_advisor(advice_to_play[3])
		end,
		26400
	)

	cutscene_intro:action(
		function()
			bm:queue_advisor(advice_to_play[4])
		end,
		38400
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
end

cerberus_location = v(-10, 395, 300)

-- Main army
cerberus         = gb:get_army(gb:get_non_player_alliance_num(1), 1, "cerberus");
frontline_shades = gb:get_army(gb:get_non_player_alliance_num(1), 1, "frontline_shades")
marksmen         = gb:get_army(gb:get_non_player_alliance_num(1), 1, "marksmen");

-- Reinforcements
wretched_shades  = gb:get_army(gb:get_non_player_alliance_num(1), 1, "wretched_shades");
shades_of_giants = gb:get_army(gb:get_non_player_alliance_num(1), 1, "shades_of_giants");
spearmasters     = gb:get_army(gb:get_non_player_alliance_num(1), 1, "spearmasters");

-- Pre-deployment
bm:register_phase_change_callback(
	"PrebattleCinematic",
	function()
		cerberus        :set_visible_to_all(false)
		cerberus        .sunits:item(1):set_invisible_to_all(true)
		frontline_shades:set_visible_to_all(true)
		marksmen        :set_visible_to_all(true)
		wretched_shades :set_enabled(false)
		shades_of_giants:set_enabled(false)
		spearmasters    :set_enabled(false)
		cerberus.sunits:item(1).uc:teleport_to_location(cerberus_location, 180, 5)
		marksmen.sunits:item(1).uc:teleport_to_location(v(-30, 395, 290), 180, 20)
		marksmen.sunits:item(2).uc:teleport_to_location(v( 10, 395, 290), 180, 20)

		frontline_shades.sunits:item(1).uc:teleport_to_location(v( 40, 395, 240), 180, 20)
		frontline_shades.sunits:item(2).uc:teleport_to_location(v( 20, 395, 240), 180, 20)
		frontline_shades.sunits:item(3).uc:teleport_to_location(v(  0, 395, 240), 180, 20)
		frontline_shades.sunits:item(4).uc:teleport_to_location(v(-20, 395, 240), 180, 20)
		frontline_shades.sunits:item(5).uc:teleport_to_location(v(-40, 395, 240), 180, 20)
		frontline_shades.sunits:item(6).uc:teleport_to_location(v(-60, 395, 240), 180, 20)
		frontline_shades.sunits:item(7).uc:teleport_to_location(v( 30, 393, 262), 180, 20)
		frontline_shades.sunits:item(8).uc:teleport_to_location(v(-48, 393, 262), 180, 20)

		wretched_shades.sunits:item(1).uc:teleport_to_location(v(-470, 395, -125), 90, 20)
		wretched_shades.sunits:item(3).uc:teleport_to_location(v(-450, 395, -125), 90, 20)

		wretched_shades.sunits:item(2).uc:teleport_to_location(v( 470, 395, -125), 270, 20)
		wretched_shades.sunits:item(4).uc:teleport_to_location(v( 450, 395, -125), 270, 20)


		shades_of_giants.sunits:item(1).uc:teleport_to_location(v(-470, 395, 220), 90, 20)
		shades_of_giants.sunits:item(2).uc:teleport_to_location(v( 470, 395, 220), 270, 20)

		spearmasters.sunits:item(1).uc:teleport_to_location(v( 38,  393, 340), 0, 20)
		spearmasters.sunits:item(2).uc:teleport_to_location(v( 13,  393, 340), 0, 20)
		spearmasters.sunits:item(3).uc:teleport_to_location(v(-12,  393, 340), 0, 20)
		spearmasters.sunits:item(4).uc:teleport_to_location(v(-37,  393, 340), 0, 20)
	end
)

-- Stages of the battle
player:message_on_proximity_to_position("cerberus_send_shades", cerberus_location, 410)
player:message_on_proximity_to_position("cerberus_send_spearmasters_and_attack", cerberus_location, 170)
player:message_on_proximity_to_position("cerberus_send_giants", cerberus_location, 90)
cerberus:message_on_under_attack("cerberus_send_spearmasters_and_attack")
cerberus:message_on_under_attack("cerberus_send_giants")

cerberus.sm:add_listener(
	"intro_cutscene_end",
	function()
		cerberus.sunits:item(1).uc:morale_behavior_fearless()
		cerberus.sunits:item(1):set_invisible_to_all(false)
	end
)

gb:set_objective_on_message("intro_cutscene_end", "troy.battle.mth.cerberus.advance")
cerberus:set_always_visible_on_message("intro_cutscene_end", true)

-- Anti-flanking measures
--flank1 = v(395,408,-53)
flank2 = v(451.3,393,194.2)
flank3 = v(-375,393,-52)

--[[ player:message_on_proximity_to_position("cerberus_send_shades", flank1, 50)
player:message_on_proximity_to_position("cerberus_send_spearmasters_and_attack", flank1, 50)
player:message_on_proximity_to_position("cerberus_send_giants", flank1, 50) ]]

player:message_on_proximity_to_position("cerberus_send_shades", flank2, 60)
player:message_on_proximity_to_position("cerberus_send_spearmasters_and_attack", flank2, 60)
player:message_on_proximity_to_position("cerberus_send_giants", flank2, 60)

player:message_on_proximity_to_position("cerberus_send_shades", flank3, 80)
player:message_on_proximity_to_position("cerberus_send_spearmasters_and_attack", flank3, 80)
player:message_on_proximity_to_position("cerberus_send_giants", flank3, 80)

-- Shades stage
wretched_shades:set_enabled_on_message("cerberus_send_shades", true)
wretched_shades:attack_on_message("cerberus_send_shades", 0)
wretched_shades:release_on_message("cerberus_send_shades", 0)
frontline_shades:attack_on_message("cerberus_send_shades", 0)
frontline_shades:release_on_message("cerberus_send_shades", 0)

-- Giants stage
shades_of_giants:set_enabled_on_message("cerberus_send_giants", true)
shades_of_giants:attack_on_message("cerberus_send_giants", 0)
shades_of_giants:release_on_message("cerberus_send_giants", 0)

--Spearmasters stage
gb:complete_objective_on_message("cerberus_send_spearmasters_and_attack", "troy.battle.mth.cerberus.advance")
gb:set_objective_on_message("cerberus_send_spearmasters_and_attack", "troy.battle.mth.cerberus.defeat.monster")

spearmasters:set_enabled_on_message("cerberus_send_spearmasters_and_attack", true)
spearmasters:attack_on_message("cerberus_send_spearmasters_and_attack")
spearmasters:release_on_message("cerberus_send_spearmasters_and_attack", 0)
cerberus:attack_on_message("cerberus_send_spearmasters_and_attack", 0)
cerberus:release_on_message("cerberus_send_spearmasters_and_attack", 0)
marksmen:attack_on_message("cerberus_send_spearmasters_and_attack", 0)
marksmen:release_on_message("cerberus_send_spearmasters_and_attack", 0)

-- Global events
cerberus:message_on_casualties("cerberus_dead", 0.999)
gb:complete_objective_on_message("cerberus_dead", "troy.battle.mth.cerberus.defeat.monster")

--[[ frontline_shades:rout_over_time_on_message("cerberus_dead", 1000)
marksmen        :rout_over_time_on_message("cerberus_dead", 1000)
wretched_shades :rout_over_time_on_message("cerberus_dead", 1000)
shades_of_giants:rout_over_time_on_message("cerberus_dead", 1000)
spearmasters    :rout_over_time_on_message("cerberus_dead", 1000) ]]

sm:add_listener(
	"cerberus_dead",
	function()
		local fr_shades = frontline_shades.sunits:get_sunit_table()
		kill_all_sunits_in_table(fr_shades)
		local mm = marksmen.sunits:get_sunit_table()
		kill_all_sunits_in_table(mm)
		local ws = wretched_shades.sunits:get_sunit_table()
		kill_all_sunits_in_table(ws)
		local sg = shades_of_giants.sunits:get_sunit_table()
		kill_all_sunits_in_table(sg)
		local sm = spearmasters.sunits:get_sunit_table()
		kill_all_sunits_in_table(sm)
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

player:force_victory_on_message("cerberus_dead")

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
			common.set_custom_loading_screen_key("troy_mth_quest_battle_cerberus")
		end

		is_rematch_confirmation_opened = false
	end,
	true
)