

-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	OPEN CAMPAIGN INTRO SCRIPT
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------


-- table of overrides. See the source of troy_campaign_early_game_missions_shared.lua to know what overrides can be set
local early_game_mission_overrides = {
	enemy_faction_key = "troy_main_dan_ellopians",
	initial_quest_key = "troy_main_achilles_quest_stage_0",
	suppress_initial_quest = true,

	-- If the player gets within one settlement of completing the following number of provinces before the "complete province" is issued, then it is 
	-- issued early with the target set to complete this many provinces. If the mission is issued by turn number, then it is issued to capture one province.
	-- The default for this value is 1 - set it to 2 if the player faction starts the campaign only one settlement away from completing a province.
	--initial_control_province_num_provinces = 2,
	suppress_enrage_achilles_countdown = true
};



-- start early-game shared missions
start_early_game_shared_missions(
	cm:get_local_faction_name(),							-- key of local player faction
	"troy_early_game_dan_achilles",					-- substr that is used to form early game mission keys, when concatenated with strings like "_defeat_enemy_army_1" or "_recruit_full_army_1"
	early_game_mission_overrides					-- table of overrides
);


-- start early-game faction-specific missions 
start_early_game_missions_achilles(
	cm:get_local_faction_name(),							-- key of local player faction
	"troy_early_game_dan_achilles",					-- substr that is used to form early game mission keys, when concatenated with strings like "_defeat_enemy_army_1" or "_recruit_full_army_1"
	early_game_mission_overrides					-- table of overrides
);










