-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	OPEN CAMPAIGN INTRO SCRIPT
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------


-- table of overrides. See the source of troy_campaign_early_game_missions_shared.lua to know what overrides can be set
local early_game_mission_overrides = {
	enemy_faction_key = "troy_main_dan_tiryns",
	initial_quest_key = "troy_main_agamemnon_quest_stage_0",
	suppress_initial_quest = true,
	suppress_appoint_heqetas_countdown = true,
	suppress_recruit_mythical_unit_countdown = true,
	suppress_recruit_mythical_unit = true,
	accumulate_favour_mission_rewards = early_game_mission_reward_elite_unit("ScriptEventAccumulateFavourMissionCompleted")
};



-- start early-game shared missions
start_early_game_shared_missions(
	cm:get_local_faction_name(),							-- key of local player faction
	"troy_early_game_dan_agamemnon",				-- substr that is used to form early game mission keys, when concatenated with strings like "_defeat_enemy_army_1" or "_recruit_full_army_1"
	early_game_mission_overrides					-- table of overrides
);


-- start early-game faction-specific missions 
start_early_game_missions_agamemnon(
	cm:get_local_faction_name(),							-- key of local player faction
	"troy_early_game_dan_agamemnon",				-- substr that is used to form early game mission keys, when concatenated with strings like "_defeat_enemy_army_1" or "_recruit_full_army_1"
	early_game_mission_overrides					-- table of overrides
);
