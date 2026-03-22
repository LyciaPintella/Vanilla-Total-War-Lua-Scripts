-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	OPEN CAMPAIGN INTRO SCRIPT
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------


-- table of overrides. See the source of troy_campaign_early_game_missions_shared.lua to know what overrides can be set
local early_game_mission_overrides = {
	enemy_faction_key = "troy_main_dan_rhodes",
	initial_quest_key = "troy_rem_horde_aethiopians_quest_stage_0",
	suppress_initial_quest = true,
	suppress_initial_control_province = true,
	suppress_control_provinces = true,
	suppress_issue_edict = true,
	suppress_confederation = true,
	suppress_construct_any_building = true,
	suppress_upgrade_settlement = true,
	suppress_upgrade_settlement_max_level = true,
	suppress_recruit_agent  = true,
	suppress_employ_agent = true,
	accumulate_favour_issued_event = "ScriptEventEarlyGameFavourMissionIssued",
	accumulate_favour_threshold = 250,
	issue_specific_decree_objective = "troy_tech_rem_horde_memnon_5_unlocks_megiddo",
	issue_specific_decree_countdown_turns = 9,
	issue_specific_decree_mission_rewards = {
		early_game_food_mission_reward(1000),
		early_game_wood_mission_reward(2000),
		early_game_bronze_mission_reward(300),
	},
};

local memnon_faction = "troy_rem_horde_aethiopians"


-- start early-game shared missions
start_early_game_shared_missions(
	cm:get_local_faction_name(),							-- key of local player faction
	"troy_early_game_trj_aethiopians",				-- substr that is used to form early game mission keys, when concatenated with strings like "_defeat_enemy_army_1" or "_recruit_full_army_1"
	early_game_mission_overrides					-- table of overrides
);



-- start early-game faction-specific missions

--     Using the Penthesilea function because there are generic horde things in it instead of Penthesilea specific things
start_early_game_missions_penthesilea(
	cm:get_local_faction_name(),							-- key of local player faction
	"troy_early_game_trj_aethiopians",					-- substr that is used to form early game mission keys, when concatenated with strings like "_defeat_enemy_army_1" or "_recruit_full_army_1"
	early_game_mission_overrides					-- table of overrides
);
start_early_game_missions_memnon(
	cm:get_local_faction_name(),							-- key of local player faction
	"troy_early_game_trj_aethiopians",					-- substr that is used to form early game mission keys, when concatenated with strings like "_defeat_enemy_army_1" or "_recruit_full_army_1"
	early_game_mission_overrides					-- table of overrides
)

-- This is ugly and I don't like it, but I couldn't come up with a much better auto-complete approach
core:add_listener(
		"memnon_early_game_favour_mission_autocomplete",
		"ScriptEventEarlyGameFavourMissionIssued",
		true,
		function()
			local gods = cm:model():world():god_manager():gods()
			for i = 0, gods:num_items() - 1 do
				if gods:item_at(i):favor_to_faction(memnon_faction) >= early_game_mission_overrides.accumulate_favour_threshold then
					local manager = cm:get_mission_manager("troy_early_game_trj_aethiopians_earn_favour_1", "")
					for _, info in ipairs(manager.scripted_objectives) do
						manager:force_scripted_objective_success(info.script_key)
					end
				end
			end
		end,
		false
)
