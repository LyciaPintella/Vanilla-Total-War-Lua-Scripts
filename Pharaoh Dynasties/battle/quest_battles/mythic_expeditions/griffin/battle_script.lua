load_script_libraries();
output_uicomponent_on_click()

local cam_pos =  v( 88.912 , 1449.78 , 743.997 )
local cam_targ = v( 60.719 , 1401.56 , 549.003 )

bm = battle_manager:new(empire_battle:new());

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

		local cam = bm:camera();
		cam:fade(true, 0);
		cam:move_to(cam_pos, cam_targ, 0)
	end
)

player = gb:get_army(gb:get_player_alliance_num(), 1);

-- intro scene
cutscene_intro_length = 67000
into_scene_file = "script/battle/quest_battles/mythic_expeditions/battle_flyovers/scenes/battle_flyovers_griffin_r01_s01.CindyScene"
local audio_events = {
	-- ["sound_event_id"] = time,
	["Flyover_Griffin_End"] = cutscene_intro_length,
	["Flyover_Griffin_Start"] = 0,
}
local skip_audio_event = "Flyover_Griffin_Skip"

function end_deployment_phase()
	bm:out("\tend_deployment_phase() called");
	
	-- disable orders during fly-by
	bm.battle:disable_orders(true)
	local cam = bm:camera();

	local advice_to_play = {};
	advice_to_play[1] = "troy_mth_qb_intro_griffin_1"
	advice_to_play[2] = "troy_mth_qb_intro_griffin_2"
	advice_to_play[3] = "troy_mth_qb_intro_griffin_3"

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
		12500
	)

	cutscene_intro:action(
		function()
			bm:queue_advisor(advice_to_play[2])
		end,
		30100
	)

	cutscene_intro:action(
		function()
			bm:queue_advisor(advice_to_play[3])
		end,
		45600
	)
	
	cutscene_intro:start()
end;

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

arimaspoi1_ambush_pos = v(-255, 1246, 264)
arimaspoi1_ambush_range = 120
arimaspoi2_ambush_pos = v(117, 1296, -244)
arimaspoi2_ambush_range = 175
griffin_start_position = v(-200, 1292, -74)
griffin_lair_position = v(-230, 1299, -315)
griffin_lair_radius = 150
griffin_lair_grif_aggro_radius = 130

griffin = gb:get_army(gb:get_non_player_alliance_num(1), 1, "griffin");
lesser_griffin = gb:get_army(gb:get_non_player_alliance_num(1), 1, "lesser_griffin");
lesser_griffin_ambushers = gb:get_army(gb:get_non_player_alliance_num(1), 1, "lesser_griffin_ambushers");
arimaspoi_right = gb:get_army(gb:get_non_player_alliance_num(1), 1, "arimaspoi_right");
arimaspoi_left = gb:get_army(gb:get_non_player_alliance_num(1), 1, "arimaspoi_left");
arimaspoi_hunters_left = gb:get_army(gb:get_non_player_alliance_num(1), 1, "arimaspoi_hunters_left");
arimaspoi_hunters_right = gb:get_army(gb:get_non_player_alliance_num(1), 1, "arimaspoi_hunters_right");
arimaspoi_skirmishers_left = gb:get_army(gb:get_non_player_alliance_num(1), 1, "arimaspoi_skirmishers_left");
arimaspoi_skirmishers_right = gb:get_army(gb:get_non_player_alliance_num(1), 1, "arimaspoi_skirmishers_right");

arimaspoi_backstab = gb:get_army(gb:get_non_player_alliance_num(1), 1, "arimaspoi_backstab");

local ambusher1_pos = v(425, 1300, 30)
local ambusher2_pos = v(10, 1269, 340)

local arimaspoi_right_pos1 = v(-430, 1192, 220)  -- Enable when 630m away from lesser griffin 3
local arimaspoi_right_pos2 = v(-352, 1265, 267)
local arimaspoi_right_pos3 = v(-327, 1256, 294)
local arimaspoi_right_pos4 = v(-377, 1287, 159)
local arimaspoi_right_pos5 = v(-360, 1288, 120)

local arimaspoi_right_hunters_pos1 = v(-435, 1295, 168)
local arimaspoi_right_hunters_pos2 = v(-355, 1265, 325)
local arimaspoi_right_hunters_pos3 = v(-445, 1291, 259)
local arimaspoi_right_hunters_pos4 = v(-450, 1289, 296)
local arimaspoi_right_hunters_pos5 = v(-432, 1278, 327)
local arimaspoi_right_hunters_pos6 = v(-442, 1278, 327)

local arimaspoi_right_skirmishers_pos1 = v(-314, 1291, 65)
local arimaspoi_right_skirmishers_pos2 = v(-339, 1290, 79)
local arimaspoi_right_skirmishers_pos3 = v(-393, 1295, 100)

local arimaspoi_backstab_pos1 = v(375, 1297, 327)
local arimaspoi_backstab_pos2 = v(432, 1297, 221)
local arimaspoi_backstab_pos3 = v(329, 1297, 227)

local arimaspoi_left_pos1 = v(300, 1298, -430)  -- Enable when 200m away from this guy
local arimaspoi_left_pos2 = v(-4,1296,-344.5)--v(490, 1320, -252) 
local arimaspoi_left_pos3 = v(22.1,1293.2,-237.8)--v(374, 1304, -291) 
local arimaspoi_left_pos4 = v(-13.7,1292.9,-269.3)-- v(356, 1304, -324) 
local arimaspoi_left_pos5 = v(-28.9,1287.6,-220) --v(335, 1300, -354) 

local arimaspoi_left_hunters_pos1 = v(378, 1311, -329)
local arimaspoi_left_hunters_pos2 = v(31.6,1298.7,-327.6)--v(418, 1304, -227)
local arimaspoi_left_hunters_pos3 = v(98.3,1295.5,-300.3)--v(402, 1304, -246)
local arimaspoi_left_hunters_pos4 = v(348, 1301, -406)
local arimaspoi_left_hunters_pos5 = v(327, 1296, -450)
local arimaspoi_left_hunters_pos6 = v(293, 1297, -452)

local arimaspoi_left_skirmishers_pos1 = v(-314, 1291, 65)
local arimaspoi_left_skirmishers_pos2 = v(-339, 1290, 79)
local arimaspoi_left_skirmishers_pos3 = v(-393, 1295, 100)

local lesser_griffin_pos1 = v(-430, 1300, -114)
local lesser_griffin_pos2 = v(-200, 1294, -104)
local lesser_griffin_pos3 = v(-220, 1298, -491)

-- Pre-deployment
bm:register_phase_change_callback(
	"PrebattleCinematic",
	function()
		griffin.sunits:item(1).uc:teleport_to_location(griffin_start_position, 0, 5)
		griffin:set_visible_to_all(false)
		lesser_griffin:set_enabled(false)
		lesser_griffin:set_visible_to_all(false)
		arimaspoi_right:set_enabled(false)
		arimaspoi_left:set_enabled(false)
		lesser_griffin_ambushers:set_enabled(false)
		arimaspoi_hunters_left:set_enabled(false)
		arimaspoi_hunters_right:set_enabled(false)
		arimaspoi_skirmishers_left:set_enabled(false)
		arimaspoi_skirmishers_right:set_enabled(false)
		arimaspoi_backstab:set_enabled(false)
		arimaspoi_right:set_visible_to_all(false)
		arimaspoi_left:set_visible_to_all(false)
		arimaspoi_hunters_left:set_visible_to_all(false)
		arimaspoi_hunters_right:set_visible_to_all(false)
		arimaspoi_skirmishers_left:set_visible_to_all(false)
		arimaspoi_skirmishers_right:set_visible_to_all(false)
		arimaspoi_backstab:set_visible_to_all(false)
		lesser_griffin_ambushers.sunits:item(1).uc:teleport_to_location(ambusher1_pos, 0, 5)
		lesser_griffin_ambushers.sunits:item(2).uc:teleport_to_location(ambusher2_pos, 0, 5)

		arimaspoi_right.sunits:item(1).uc:teleport_to_location(arimaspoi_right_pos1, 0, 15)
		arimaspoi_right.sunits:item(2).uc:teleport_to_location(arimaspoi_right_pos2, 0, 15)
		arimaspoi_right.sunits:item(3).uc:teleport_to_location(arimaspoi_right_pos3, 0, 15)
		arimaspoi_right.sunits:item(4).uc:teleport_to_location(arimaspoi_right_pos4, 0, 15)
		arimaspoi_right.sunits:item(5).uc:teleport_to_location(arimaspoi_right_pos5, 0, 15)

		arimaspoi_hunters_right.sunits:item(1).uc:teleport_to_location(arimaspoi_right_hunters_pos1, 0, 15)
		arimaspoi_hunters_right.sunits:item(2).uc:teleport_to_location(arimaspoi_right_hunters_pos2, 0, 15)
		arimaspoi_hunters_right.sunits:item(3).uc:teleport_to_location(arimaspoi_right_hunters_pos3, 0, 15)
		arimaspoi_hunters_right.sunits:item(4).uc:teleport_to_location(arimaspoi_right_hunters_pos4, 0, 15)
		arimaspoi_hunters_right.sunits:item(5).uc:teleport_to_location(arimaspoi_right_hunters_pos5, 0, 15)
		arimaspoi_hunters_right.sunits:item(6).uc:teleport_to_location(arimaspoi_right_hunters_pos6, 0, 15)

		arimaspoi_skirmishers_right.sunits:item(1).uc:teleport_to_location(arimaspoi_right_skirmishers_pos1, 0, 15)
		arimaspoi_skirmishers_right.sunits:item(2).uc:teleport_to_location(arimaspoi_right_skirmishers_pos2, 0, 15)
		arimaspoi_skirmishers_right.sunits:item(3).uc:teleport_to_location(arimaspoi_right_skirmishers_pos3, 0, 15)

		arimaspoi_backstab.sunits:item(1).uc:teleport_to_location(arimaspoi_backstab_pos1, 0, 15)
		arimaspoi_backstab.sunits:item(2).uc:teleport_to_location(arimaspoi_backstab_pos2, 0, 15)
		arimaspoi_backstab.sunits:item(3).uc:teleport_to_location(arimaspoi_backstab_pos3, 0, 15)


		arimaspoi_left.sunits:item(1).uc:teleport_to_location(arimaspoi_left_pos1, 0, 15)
		arimaspoi_left.sunits:item(2).uc:teleport_to_location(arimaspoi_left_pos2, 0, 15)
		arimaspoi_left.sunits:item(3).uc:teleport_to_location(arimaspoi_left_pos3, 0, 15)
		arimaspoi_left.sunits:item(4).uc:teleport_to_location(arimaspoi_left_pos4, 0, 15)
		arimaspoi_left.sunits:item(5).uc:teleport_to_location(arimaspoi_left_pos5, 0, 15)

		arimaspoi_hunters_left.sunits:item(1).uc:teleport_to_location(arimaspoi_left_hunters_pos1, 0, 15)
		arimaspoi_hunters_left.sunits:item(2).uc:teleport_to_location(arimaspoi_left_hunters_pos2, 0, 15)
		arimaspoi_hunters_left.sunits:item(3).uc:teleport_to_location(arimaspoi_left_hunters_pos3, 0, 15)
		arimaspoi_hunters_left.sunits:item(4).uc:teleport_to_location(arimaspoi_left_hunters_pos4, 0, 15)
		arimaspoi_hunters_left.sunits:item(5).uc:teleport_to_location(arimaspoi_left_hunters_pos5, 0, 15)
		arimaspoi_hunters_left.sunits:item(6).uc:teleport_to_location(arimaspoi_left_hunters_pos6, 0, 15)

		arimaspoi_skirmishers_left.sunits:item(1).uc:teleport_to_location(arimaspoi_left_skirmishers_pos1, 0, 15)
		arimaspoi_skirmishers_left.sunits:item(2).uc:teleport_to_location(arimaspoi_left_skirmishers_pos2, 0, 15)
		arimaspoi_skirmishers_left.sunits:item(3).uc:teleport_to_location(arimaspoi_left_skirmishers_pos3, 0, 15)


		lesser_griffin.sunits:item(1).uc:teleport_to_location(lesser_griffin_pos1, 0, 15)
		lesser_griffin.sunits:item(2).uc:teleport_to_location(lesser_griffin_pos2, 0, 15)
		lesser_griffin.sunits:item(3).uc:teleport_to_location(lesser_griffin_pos3, 0, 15)
	end
)

griffin.sm:add_listener(
	"intro_cutscene_end",
	function()
		griffin.sunits:item(1).uc:morale_behavior_fearless()
		lesser_griffin.sunits:item(1).uc:morale_behavior_fearless()
		lesser_griffin.sunits:item(2).uc:morale_behavior_fearless()
		lesser_griffin.sunits:item(3).uc:morale_behavior_fearless()
		lesser_griffin_ambushers.sunits:item(1).uc:morale_behavior_fearless()
		lesser_griffin_ambushers.sunits:item(2).uc:morale_behavior_fearless()
	end
)

-- Initial ambush
player:set_always_visible_on_message("intro_cutscene_end", true, true)
griffin:set_always_visible_on_message("intro_cutscene_end", true)
lesser_griffin:set_always_visible_on_message("intro_cutscene_end", true)
griffin:attack_force_on_message("intro_cutscene_end", player, 0)
lesser_griffin_ambushers:set_enabled_on_message("intro_cutscene_end", true)
--lesser_griffin_ambushers:attack_on_message("intro_cutscene_end", 0)
lesser_griffin_ambushers:move_to_position_on_message("intro_cutscene_end", v(240, 1296, 281))
gb:set_objective_on_message("intro_cutscene_end", "troy.battle.mth.griffin.repel")

lesser_griffin_ambushers:message_on_proximity_to_enemy("ambushers_attack", 170)
lesser_griffin_ambushers:attack_on_message("ambushers_attack")

-- End of initial ambush, griffin retreats
-- Its better for the griffin to be in attack_battlegoup_objective than move_to_point as we only spam commands from here and do not take full control over the unit
griffin:attack_force_on_message("griffin_half_dead", player, 0, true)
griffin:message_on_casualties("griffin_half_dead", 0.55)
griffin:set_invincible_on_message("griffin_half_dead", true)
gb:complete_objective_on_message("griffin_half_dead", "troy.battle.mth.griffin.repel")
gb:set_objective_on_message("griffin_half_dead", "troy.battle.mth.griffin.chase")

griffin:message_on_proximity_to_position("griffin_reached_lair", griffin_lair_position, 30)
griffin:set_invincible_on_message("griffin_reached_lair", false)
--griffin:move_to_position_on_message("griffin_half_dead", griffin_lair_position)

-- Start spamming movement commands for the griffin when he's halfway dead
griffin.sm:add_listener(
	"griffin_half_dead",
	function()
		bm:repeat_callback(
			function()
				griffin.sunits:item(1).uc:goto_location(griffin_lair_position, true)
			end,
			1000,
			"griffin_retreat_to_lair"
		)
	end
)
-- And stop when he's reached the lair
griffin.sm:add_listener(
	"griffin_reached_lair",
	function()
		bm:remove_process("griffin_retreat_to_lair")
		griffin.sunits:item(1).uc:morale_behavior_fearless()
	end
)

-- Player walks into an arimaspoi ambush
player:message_on_proximity_to_position("arimaspoi_ambush", arimaspoi1_ambush_pos, arimaspoi1_ambush_range)
player:message_on_proximity_to_position("arimaspoi_ambush", arimaspoi2_ambush_pos, arimaspoi2_ambush_range)
gb:complete_objective_on_message("arimaspoi_ambush", "troy.battle.mth.griffin.chase")
gb:set_objective_on_message("arimaspoi_ambush", "troy.battle.mth.griffin.survive")

arimaspoi_right:set_always_visible_on_message("arimaspoi_ambush", true)
arimaspoi_hunters_right:set_always_visible_on_message("arimaspoi_ambush", true)
arimaspoi_skirmishers_right:set_always_visible_on_message("arimaspoi_ambush", true)

arimaspoi_right:set_enabled_on_message("arimaspoi_ambush", true)
arimaspoi_hunters_right:set_enabled_on_message("arimaspoi_ambush", true)
arimaspoi_skirmishers_right:set_enabled_on_message("arimaspoi_ambush", true)

arimaspoi_right:attack_on_message("arimaspoi_ambush", 0)
arimaspoi_hunters_right:attack_on_message("arimaspoi_ambush", 0)
arimaspoi_skirmishers_right:attack_on_message("arimaspoi_ambush", 0)

arimaspoi_left:set_always_visible_on_message("arimaspoi_ambush", true)
arimaspoi_hunters_left:set_always_visible_on_message("arimaspoi_ambush", true)
arimaspoi_skirmishers_left:set_always_visible_on_message("arimaspoi_ambush", true)

arimaspoi_left:set_enabled_on_message("arimaspoi_ambush", true)
arimaspoi_hunters_left:set_enabled_on_message("arimaspoi_ambush", true)
arimaspoi_skirmishers_left:set_enabled_on_message("arimaspoi_ambush", true)

arimaspoi_left:attack_force_on_message("arimaspoi_ambush", player)
arimaspoi_hunters_left:attack_force_on_message("arimaspoi_ambush", player)
arimaspoi_skirmishers_left:attack_force_on_message("arimaspoi_ambush", player)

arimaspoi_backstab:set_always_visible_on_message("arimaspoi_ambush", true)
arimaspoi_backstab:set_enabled_on_message("arimaspoi_ambush", true)
arimaspoi_backstab:attack_on_message("arimaspoi_ambush", 0)

-- objective updating 
local objective_target_rout = 0.9 -- aiming for 90% routing arimaspoi

arimaspoi_right:message_on_rout_proportion("arimaspoi_rout", objective_target_rout)
arimaspoi_left:message_on_rout_proportion("arimaspoi_rout", objective_target_rout)
arimaspoi_hunters_left:message_on_rout_proportion("arimaspoi_rout", objective_target_rout)
arimaspoi_hunters_right:message_on_rout_proportion("arimaspoi_rout", objective_target_rout)
arimaspoi_skirmishers_left:message_on_rout_proportion("arimaspoi_rout", objective_target_rout)
arimaspoi_skirmishers_right:message_on_rout_proportion("arimaspoi_rout", objective_target_rout)

griffin.sm:add_listener(
	"arimaspoi_rout",
	function()
		-- check if all arimaspoi groups are over rout proportion
		
		local ar_rp = arimaspoi_right:get_rout_proportion()
		local al_rp = arimaspoi_left:get_rout_proportion()
		local ahl_rp = arimaspoi_hunters_left:get_rout_proportion()
		local ahr_rp = arimaspoi_hunters_right:get_rout_proportion()
		local asl_rp = arimaspoi_skirmishers_left:get_rout_proportion()
		local asr_rp = arimaspoi_skirmishers_right:get_rout_proportion()

		local average = (ar_rp + al_rp + ahl_rp + ahr_rp + asl_rp + asr_rp) / 6
		if average >= objective_target_rout then
			bm:complete_objective("troy.battle.mth.griffin.survive")
			gb.current_objectives["troy.battle.mth.griffin.survive"] = false
		end
	end,
	true
)

-- Player walks into griffin lair
player:message_on_proximity_to_position("griffin_lair_entered", griffin_lair_position, griffin_lair_radius)
player:message_on_proximity_to_position("griffin_final_attack", griffin_lair_position, griffin_lair_radius)
lesser_griffin:message_on_under_attack("griffin_final_attack")
lesser_griffin:set_enabled_on_message("griffin_lair_entered", true)
lesser_griffin:attack_on_message("griffin_lair_entered", 0)
griffin:attack_on_message("griffin_final_attack", 0)
gb:complete_objective_on_message("griffin_final_attack", "troy.battle.mth.griffin.survive")
gb:set_objective_on_message("griffin_final_attack", "troy.battle.mth.griffin.defeat.monster")

-- Griffin dead, end battle
griffin:message_on_casualties("griffin_dead", 0.999)
--lesser_griffin:rout_over_time_on_message("griffin_dead", 1000)
--lesser_griffin_ambushers:rout_over_time_on_message("griffin_dead", 1000)
--arimaspoi1:rout_over_time_on_message("griffin_dead", 1000)
--arimaspoi2:rout_over_time_on_message("griffin_dead", 1000)

gb:complete_objective_on_message("griffin_dead", "troy.battle.mth.griffin.defeat.monster")
player:force_victory_on_message("griffin_dead", 500)

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
			common.set_custom_loading_screen_key("troy_mth_quest_battle_griffin")
		end

		is_rematch_confirmation_opened = false
	end,
	true
)