-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	OPEN CAMPAIGN INTRO SCRIPT
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------


-- table of overrides. See the source of troy_campaign_early_game_missions_shared.lua to know what overrides can be set
local early_game_mission_overrides = {
	enemy_faction_key = "troy_main_trj_thyni",
	initial_quest_key = "troy_main_penthesilea_quest_stage_0",
	
	-- penthesilea doesn't have an initial quest currently, so bypass it
	-- penthesilea cannot control settlements, so missions about settlements are unneeded. 
	suppress_initial_quest = true,
	suppress_initial_control_province = true,
	suppress_control_provinces = true,
	suppress_issue_edict = true,
	suppress_confederation = true,
	suppress_construct_any_building = true,
	suppress_upgrade_settlement = true,
	suppress_upgrade_settlement_max_level = true,
	accumulate_favour_issued_event = "ScriptEventEarlyGameFavourMissionIssued",
	accumulate_favour_threshold = 250
};



-- start early-game shared missions
start_early_game_shared_missions(
	cm:get_local_faction_name(),							-- key of local player faction
	"troy_early_game_trj_penthesilea",				-- substr that is used to form early game mission keys, when concatenated with strings like "_defeat_enemy_army_1" or "_recruit_full_army_1"
	early_game_mission_overrides					-- table of overrides
);


-- start early-game faction-specific missions

start_early_game_missions_penthesilea(
	cm:get_local_faction_name(),							-- key of local player faction
	"troy_early_game_trj_penthesilea",				-- substr that is used to form early game mission keys, when concatenated with strings like "_defeat_enemy_army_1" or "_recruit_full_army_1"
	early_game_mission_overrides					-- table of overrides
);

-- This is ugly and I don't like it, but I couldn't come up with a much better auto-complete approach
core:add_listener(
	"penthesilea_early_game_favour_mission_autocomplete",
	"ScriptEventEarlyGameFavourMissionIssued",
	true,
	function()
		local gods = cm:model():world():god_manager():gods()
		for i = 0, gods:num_items() - 1 do 
			if gods:item_at(i):favor_to_faction(penthesilea_faction) >= early_game_mission_overrides.accumulate_favour_threshold then
				local manager = cm:get_mission_manager("troy_early_game_trj_penthesilea_earn_favour_1", "")
				for _, info in ipairs(manager.scripted_objectives) do
					manager:force_scripted_objective_success(info.script_key)
				end
			end
		end
	end,
	false
)