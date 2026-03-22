-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	OPEN CAMPAIGN INTRO SCRIPT
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------


-- table of overrides. See the source of troy_campaign_early_game_missions_shared.lua to know what overrides can be set
local early_game_mission_overrides = {
	enemy_faction_key = "troy_main_dan_teleboans",
	initial_quest_key = "troy_main_odysseus_quest_stage_0",
	suppress_initial_quest = true,
	suppress_construct_supply_base_countdown = true
};



-- start early-game shared missions
start_early_game_shared_missions(
	cm:get_local_faction_name(),							-- key of local player faction
	"troy_early_game_dan_odysseus",					-- substr that is used to form early game mission keys, when concatenated with strings like "_defeat_enemy_army_1" or "_recruit_full_army_1"
	early_game_mission_overrides					-- table of overrides
);


-- start early-game faction-specific missions 
--[[
start_early_game_missions_odysseus(
	cm:get_local_faction_name(),							-- key of local player faction
	"troy_early_game_dan_odysseus",					-- substr that is used to form early game mission keys, when concatenated with strings like "_defeat_enemy_army_1" or "_recruit_full_army_1"
	early_game_mission_overrides					-- table of overrides
);
]]