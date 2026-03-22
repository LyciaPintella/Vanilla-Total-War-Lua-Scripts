

-- number of turns to wait (after first turn) before triggering faction-specific missions. These values can be overridden.
local turn_countdown_first_faction_specific_mission = 4;
local turn_countdown_second_faction_specific_mission = 10;



function start_early_game_shared_missions(player_faction_key, early_game_mission_prepend_str, overrides)

	if not is_string(player_faction_key) then
		script_error("ERROR: start_early_game_shared_missions() called but value of player_faction_key [" .. tostring(player_faction_key) .. "] is not a string");
		return false;
	end;

	if not cm:get_faction(player_faction_key) then
		script_error("ERROR: start_early_game_shared_missions() called but value of player_faction_key [" .. player_faction_key .. "] is not a valid faction key");
		return false;
	end;

	if not is_string(early_game_mission_prepend_str) then
		script_error("ERROR: start_early_game_shared_missions() called but value of early_game_mission_prepend_str [" .. tostring(early_game_mission_prepend_str) .. "] is not a string");
		return false;
	end;

	if not is_string(overrides.enemy_faction_key) then
		script_error("ERROR: start_early_game_shared_missions() called but value of enemy_faction_key override [" .. tostring(overrides.enemy_faction_key) .. "] is not a string");
		return false;
	end;

	if not cm:get_faction(overrides.enemy_faction_key) then
		script_error("ERROR: start_early_game_shared_missions() called but value of enemy_faction_key override [" .. overrides.enemy_faction_key .. "] is not a valid faction key");
		return false;
	end;
	





	-----------------------------------------------------------------------------------------------------------
	--	Startup missions and events
	-----------------------------------------------------------------------------------------------------------


	-- How They Play
	-- Triggers the how-they-play event for the player's faction, after the intro cutscene is finished.
	if not overrides.suppress_how_they_play_event then
		start_early_game_how_they_play_listener(
			player_faction_key,																								-- target faction
			overrides.how_they_play_trigger_event or "ScriptEventIntroCutsceneFinished",									-- trigger event
			overrides.how_they_play_issued_event or "ScriptEventHowTheyPlayEventDismissed"									-- on-issued event
		);
	end;


	-- Initial Quest
	-- Triggers the initial incident (with mission follow-up), after the How They Play event is dismissed.
	if not overrides.suppress_initial_quest then
		-- error if we don't have a quest key
		if not is_string(overrides.initial_quest_key) then
			script_error("ERROR: start_early_game_shared_missions() called but no initial quest key supplied in overrides table, and initial quest is not suppressed. Either set a valid incident/mission key at element initial_quest_key or set suppress_initial_quest in the supplied overrides table");
			return false;
		end;

		-- is_incident will be true by default
		local is_incident = overrides.initial_quest_is_incident;
		if is_incident == nil then
			is_incident = true;
		end;

		start_early_game_quest_listener(
			player_faction_key, 																							-- target faction to issue the mission/incident to
			overrides.initial_quest_key,																					-- quest chain mission
			is_incident,																									-- is incident
			overrides.initial_quest_trigger_event or "ScriptEventHowTheyPlayEventDismissed",								-- trigger event
			overrides.initial_quest_issued_event or "ScriptEventInitialQuestIssued"											-- on-issued event
		);
	end;




	-----------------------------------------------------------------------------------------------------------
	--	Defeat Enemy / Recruit units chain
	-----------------------------------------------------------------------------------------------------------


	-- Defeat Enemy Army
	-- Triggers a mission to defeat an army from the specified enemy faction, after the initial Quest is issued.
	if not overrides.suppress_defeat_enemy_army then
		start_early_game_defeat_enemy_army_mission_listener(
			"defeat_enemy_army",																								-- unique name
			player_faction_key,																									-- target faction to issue the mission to
			overrides.defeat_enemy_army_advice_key or "troy_camp_early_game_defeat_enemy_army_001",								-- advice key
			overrides.defeat_enemy_army_mission_key or early_game_mission_prepend_str .. "_defeat_enemy_army_1",				-- mission key
			overrides.enemy_faction_key, 																						-- faction to issue the mission against
			overrides.defeat_enemy_army_mission_rewards or {
				early_game_food_mission_reward(250),
				early_game_bronze_mission_reward(80)
			},																													-- mission rewards
			overrides.defeat_enemy_army_camera_target,																			-- cqi of enemy char to scroll camera to (can be nil)

			-- Initial quest has been removed, possibly permanently, so defeat enemy army will now trigger from How-They-Play
			-- overrides.defeat_enemy_army_trigger_event or "ScriptEventInitialQuestIssued",									-- trigger event (singleplayer)
			
			overrides.defeat_enemy_army_trigger_event or "ScriptEventHowTheyPlayEventDismissed",								-- trigger event (singleplayer)
			overrides.defeat_enemy_army_issued_event or nil,																	-- on-issued event
			overrides.defeat_enemy_army_completed_event or "ScriptEventDefeatEnemyArmyMissionCompleted",						-- on-completed event
			overrides.defeat_enemy_army_inherit_list or nil																		-- narrative events to inherit rewards from
		);
	end;


	-- Recruit X Units
	-- Triggers a mission to recruit a number of units. This is issued after the Defeat Enemy Army mission is completed.
	if not overrides.suppress_recruit_x_units then
		start_early_game_recruit_x_units_mission_listener(
			"recruit_x_units",																									-- unique name
			player_faction_key, 																								-- target faction to issue the mission to
			overrides.recruit_x_units_advice_key or "troy_camp_early_game_recruit_x_units_001",									-- advice key
			overrides.recruit_x_units_mission_key or early_game_mission_prepend_str .. "_recruit_x_units_1", 					-- mission key
			overrides.recruit_x_units_num_units or 12,																			-- x num of units
			overrides.recruit_x_units_mission_rewards or {
				early_game_food_mission_reward(300),
				early_game_bronze_mission_reward(100)
			},																													-- mission rewards
			overrides.recruit_x_units_trigger_event or "ScriptEventDefeatEnemyArmyMissionCompleted",							-- trigger event
			overrides.recruit_x_units_issued_event,																				-- mission issued event
			overrides.recruit_x_units_completed_event or "ScriptEventRecruitSomeUnitsMissionCompleted",							-- mission completed event
			overrides.recruit_x_units_inherit_list or {
				"defeat_enemy_army"
			}																													-- narrative events to inherit rewards from
		);
	end;

	if not overrides.suppress_recruit_full_army then
		cm:add_turn_countdown_event_on_event(
			overrides.suppress_recruit_full_army_countdown_trigger_event or "ScriptEventRecruitSomeUnitsMissionCompleted",				-- trigger event, to start on
			true,																														-- trigger condition
			player_faction_key, 																										-- faction key
			overrides.suppress_recruit_full_army_countdown_turns or 2,																	-- number of turns to wait
			overrides.suppress_recruit_full_army_trigger_event or "ScriptEventIssueRecruitFullArmyMissiontMission"						-- event to trigger
		);
	end;

	-- Recruit Full Army
	-- Triggers a mission to recruit twenty units. This is issued after the Recruit X Units mission is completed.
	if not overrides.suppress_recruit_full_army then
		start_early_game_recruit_full_army_mission_listener(
			"recruit_full_army",																								-- unique name
			player_faction_key, 																								-- target faction to issue the mission to
			overrides.recruit_full_army_advice_key or "troy_camp_early_game_recruit_full_army_001",								-- advice key
			overrides.recruit_full_army_mission_key or early_game_mission_prepend_str .. "_recruit_full_army_1", 				-- mission key
			overrides.recruit_full_army_mission_rewards or {
				early_game_food_mission_reward(500),
				early_game_bronze_mission_reward(50),
				early_game_gold_mission_reward(50)
			},																													-- mission rewards
			overrides.recruit_full_army_trigger_event or "ScriptEventIssueRecruitFullArmyMissiontMission",							-- trigger event
			overrides.recruit_full_army_issued_event,																			-- mission issued event
			overrides.recruit_full_army_completed_event or "ScriptEventRecruitFullArmyMissionCompleted",						-- mission completed event
			overrides.recruit_full_army_inherit_list or {
				"recruit_x_units", "defeat_enemy_army"
			}																													-- narrative events to inherit rewards from
		);
	end;








	-----------------------------------------------------------------------------------------------------------
	--	Technology / Royal Decree chain
	-----------------------------------------------------------------------------------------------------------

	if not overrides.suppress_issue_decree_countdown then
		cm:add_turn_countdown_event_on_event(
			overrides.issue_decree_countdown_trigger_event or "ScriptEventIntroCutsceneFinished",								-- trigger event, to start on
			true,																												-- trigger condition
			player_faction_key, 																								-- faction key
			overrides.issue_decree_countdown_turns or 1,																		-- number of turns to wait
			overrides.issue_decree_trigger_event or "ScriptEventIssueDecreeMission"												-- event to trigger
		);
	end;


		-- Research Technology
		-- Triggers a mission to research a technology. This is issued on turn two.
	if not overrides.suppress_issue_decree then
		start_early_game_issue_decree_mission_listener(
			"issue_decree",																										-- unique name
			player_faction_key,																									-- faction key
			overrides.issue_decree_advice_key or "troy_camp_early_game_issue_decree_001",										-- advice key
			overrides.issue_decree_mission_key or early_game_mission_prepend_str .. "_issue_decree_1",							-- mission key
			overrides.issue_decree_mission_rewards or {
				early_game_food_mission_reward(150),
				early_game_wood_mission_reward(150)
			},																													-- mission rewards
			overrides.issue_decree_trigger_event or "ScriptEventIssueDecreeMission",											-- trigger event
			overrides.issue_decree_issued_event,																				-- mission issued event
			overrides.issue_decree_completed_event or "ScriptEventIssueDecreeMissionCompleted",									-- mission completed event
			overrides.issue_decree_inherit_list or nil																			-- narrative events to inherit rewards from
		);
	end;







	-----------------------------------------------------------------------------------------------------------
	--	Building Construction chain
	-----------------------------------------------------------------------------------------------------------

	if not overrides.suppress_construct_any_building_countdown then
		cm:add_turn_countdown_event_on_event(
			overrides.construct_any_building_countdown_trigger_event or "ScriptEventIntroCutsceneFinished",						-- trigger event, to start on
			true,																												-- trigger condition
			player_faction_key, 																								-- faction key
			overrides.construct_any_building_countdown_turns or 2,																-- number of turns to wait
			overrides.construct_any_building_trigger_event or "ScriptEventIssueConstructBuildingMission"						-- event to trigger
		);
	end;

	
	-- Building Construction
	-- Triggers a mission to construct any building. Issued on turn three.
	if not overrides.suppress_construct_any_building then
		start_early_game_construct_any_building_mission_listener(
			"construct_building",																								-- unique name
			player_faction_key,																									-- faction key
			overrides.construct_any_building_advice_key or "troy_camp_early_game_construct_building_001",						-- advice key
			overrides.construct_any_building_mission_key or early_game_mission_prepend_str .. "_construct_building_1",			-- mission key
			overrides.construct_any_building_mission_rewards or {
				early_game_wood_mission_reward(350),
				early_game_stone_mission_reward(200)
			},																													-- mission rewards
			overrides.construct_any_building_trigger_event or "ScriptEventIssueConstructBuildingMission",						-- trigger event
			overrides.construct_any_building_issued_event,																		-- mission issued event
			overrides.construct_any_building_completed_event or "ScriptEventConstructBuildingMissionCompleted",					-- mission completed event
			overrides.construct_any_building_inherit_list or nil																-- narrative events to inherit rewards from
		);
	end;


	-- Upgrade Settlement
	-- Triggers a mission to upgrade any settlement building. Issued after the Building Construction mission is completed,
	-- or when the player earns a development point
	if not overrides.suppress_upgrade_settlement then
		start_early_game_upgrade_settlement_mission_listener(
			"upgrade_settlement",																								-- unique name
			player_faction_key,																									-- faction key
			overrides.upgrade_settlement_advice_key or "troy_camp_early_game_upgrade_settlement_001",							-- advice key
			overrides.upgrade_settlement_mission_key or early_game_mission_prepend_str .. "_upgrade_settlement_1",				-- mission key
			overrides.upgrade_settlement_mission_rewards or {
				early_game_wood_mission_reward(400),
				early_game_stone_mission_reward(300)
			},																													-- mission rewards
			overrides.upgrade_settlement_trigger_event or "ScriptEventConstructBuildingMissionCompleted",						-- trigger event
			overrides.upgrade_settlement_issued_event or nil,																	-- mission issued event
			overrides.upgrade_settlement_completed_event or "ScriptEventUpgradeSettlementMissionCompleted",						-- mission completed event
			overrides.upgrade_settlement_inherit_list or {
				"construct_building"
			}																													-- narrative events to inherit rewards from
		);
	end;

	if not overrides.suppress_upgrade_settlement_max_level then
		cm:add_turn_countdown_event_on_event(
			overrides.suppress_upgrade_settlement_max_level_countdown_trigger_event or "ScriptEventUpgradeSettlementMissionCompleted",				-- trigger event, to start on
			true,																																	-- trigger condition
			player_faction_key, 																													-- faction key
			overrides.suppress_upgrade_settlement_max_level_countdown_turns or 2,																	-- number of turns to wait
			overrides.suppress_upgrade_settlement_max_level_trigger_event or "ScriptEventIssueUpgradeSettlementMaxLevelMission"						-- event to trigger
		);
	end;

	-- Upgrade Settlement to Max Level
	-- Triggers a mission to upgrade any settlement building to max level. Issued after the Settlement Upgrade mission is completed and 2 turns have passed.
	if not overrides.suppress_upgrade_settlement_max_level then
		start_early_game_upgrade_settlement_to_max_level_mission_listener(
			"upgrade_settlement_to_max_level",																					-- unique name
			player_faction_key,																									-- faction key
			overrides.upgrade_settlement_max_level_advice_key or "troy_camp_early_game_upgrade_settlement_002",					-- advice key
			overrides.upgrade_settlement_max_level_mission_key or early_game_mission_prepend_str .. "_upgrade_settlement_2",	-- mission key
			overrides.upgrade_settlement_max_level_mission_rewards or {
				early_game_mission_reward_elite_unit("ScriptEventUpgradeSettlementMaxLevelMissionCompleted"),
			},																													-- mission rewards
			overrides.upgrade_settlement_max_level_trigger_event or "ScriptEventIssueUpgradeSettlementMaxLevelMission",			-- trigger event
			overrides.upgrade_settlement_max_level_issued_event,																-- mission issued event
			overrides.upgrade_settlement_max_level_completed_event or "ScriptEventUpgradeSettlementMaxLevelMissionCompleted",	-- mission completed event
			overrides.upgrade_settlement_max_level_inherit_list or {
				"construct_building",
				"upgrade_settlement"
			}																													-- narrative events to inherit rewards from
		);
	end;









	-----------------------------------------------------------------------------------------------------------
	--	Province chain
	-----------------------------------------------------------------------------------------------------------
	
	if not overrides.suppress_initial_control_province_countdown then
		cm:add_turn_countdown_event_on_event(
			overrides.initial_control_province_countdown_trigger_event or "ScriptEventIntroCutsceneFinished",					-- trigger event, to start on
			true,																												-- trigger condition
			player_faction_key, 																								-- faction key
			overrides.initial_control_province_countdown_turns or 8,		 													-- number of turns to wait
			overrides.initial_control_province_trigger_event or "ScriptEventIssueInitialControlProvinceMission"					-- event to trigger
		);
	end;


	-- Control Province (initial)
	-- Triggers a mission to control a province (or two). Issued on turn nine, or when the player is one settlement away
	-- from controlling a province. This scrolls the camera to a nearly-completed province, if one is found.
	-- If the supplied number of provinces is greater than one, this will only actually apply if the player gets one settlement 
	-- away from controlling those provinces. Otherwise, the mission will be to control only one province (it may complete immediately)
	if not overrides.suppress_initial_control_province then
		start_early_game_initial_control_province_mission_listener(
			"initial_control_province",																							-- unique name
			player_faction_key,																									-- faction key
			overrides.initial_control_province_advice_key or "troy_camp_early_game_control_province_001",						-- advice key
			overrides.initial_control_province_mission_key or "troy_early_game_dan_achilles_control_province_1",				-- mission key
			-- increase this value if the faction's starting position is one settlement away from completing a province
			overrides.initial_control_province_num_provinces or 2,																-- number of provinces that need to be controlled to complete the mission
			overrides.initial_control_province_mission_rewards or {
				early_game_wood_mission_reward(700)
			},																													-- mission rewards
			overrides.initial_control_province_trigger_event or "ScriptEventIssueInitialControlProvinceMission",				-- trigger event
			overrides.initial_control_province_issued_event,																	-- mission issued event
			overrides.initial_control_province_completed_event or "ScriptEventInitialControlProvinceMissionCompleted",			-- mission completed event
			overrides.initial_control_province_inherit_list or nil																-- narrative events to inherit rewards from
		);
	end;


	-- Issue Edict
	-- Triggers a mission to issue an edict, after a province has been captured.
	if not overrides.suppress_issue_edict then
		start_early_game_issue_edict_mission_listener(
			"issue_edict",																										-- unique name
			player_faction_key,																									-- faction key
			overrides.issue_edict_advice_key or "troy_camp_early_game_issue_edict_001",											-- advice key
			overrides.issue_edict_mission_key or early_game_mission_prepend_str .. "_issue_edict_1",							-- mission key
			overrides.issue_edict_mission_rewards or {
				early_game_food_mission_reward(140),
				early_game_wood_mission_reward(100)
			},																													-- mission rewards
			overrides.issue_edict_trigger_event or "ScriptEventInitialControlProvinceMissionCompleted",							-- trigger event
			overrides.issue_edict_issued_event,																					-- mission issued event
			overrides.issue_edict_completed_event or "ScriptEventIssueEdictMissionCompleted",									-- mission completed event
			overrides.issue_edict_inherit_list or {
				"initial_control_province"
			}																													-- narrative events to inherit rewards from
		);
	end;


	-- Control Many Provinces
	-- Triggers a mission to control several provinces, after the Issue Decree mission has been completed.
	if not overrides.suppress_control_provinces then
		start_early_game_control_provinces_mission_listener(
			"control_provinces",																								-- unique name
			player_faction_key,																									-- faction key
			-- by default, no advice is shown
			overrides.control_provinces_advice_key,																				-- advice key
			overrides.control_provinces_mission_key or early_game_mission_prepend_str .. "_control_province_2",					-- mission key
			overrides.control_provinces_num_provinces or 4,																		-- number of provinces that need to be controlled to complete the mission
			overrides.control_provinces_mission_rewards or {
				early_game_food_mission_reward(700),
				early_game_bronze_mission_reward(150)
			},																													-- mission rewards
			overrides.control_provinces_trigger_event or "ScriptEventIssueEdictMissionCompleted",								-- trigger event
			overrides.control_provinces_issued_event,																			-- mission issued event
			overrides.control_provinces_completed_event or "ScriptEventControlProvincesMissionCompleted",						-- mission completed event
			overrides.control_provinces_inherit_list or {
				"initial_control_province",
				"issue_decree"
			}																													-- narrative events to inherit rewards from
		);
	end;









	-----------------------------------------------------------------------------------------------------------
	--	Temple chain
	-----------------------------------------------------------------------------------------------------------

	if not overrides.suppress_construct_temple_countdown then
		cm:add_turn_countdown_event_on_event(
			overrides.construct_temple_countdown_trigger_event or "ScriptEventIntroCutsceneFinished",							-- trigger event, to start on
			true,																												-- trigger condition
			player_faction_key, 																								-- faction key
			overrides.construct_temple_countdown_turns or 9,				 													-- number of turns to wait
			overrides.construct_temple_trigger_event or "ScriptEventIssueConstructTempleMission"								-- event to trigger
		);
	end;
	

	-- Construct Temple
	-- Triggers a mission to construct a tier one temple building. Issued on turn ten.
	if not overrides.suppress_construct_temple then
		start_early_game_construct_temple_mission_listener(
			"construct_temple",																									-- unique name
			player_faction_key,																									-- faction key
			overrides.construct_temple_advice_key or "troy_camp_early_game_construct_temple_001",								-- advice key
			overrides.construct_temple_mission_key or early_game_mission_prepend_str .. "_construct_temple_1",					-- mission key
			overrides.construct_temple_mission_rewards or {
				early_game_wood_mission_reward(500)
			},																													-- mission rewards
			overrides.construct_temple_trigger_event or "ScriptEventIssueConstructTempleMission",								-- trigger event
			overrides.construct_temple_issued_event,																			-- mission issued event
			overrides.construct_temple_completed_event or "ScriptEventConstructTempleMissionCompleted",							-- mission completed event
			overrides.construct_temple_inherit_list or nil																		-- narrative events to inherit rewards from
		);
	end;

	if not overrides.suppress_initiate_hecatomb then
		cm:add_turn_countdown_event_on_event(
			overrides.suppress_initiate_hecatomb_countdown_trigger_event or "ScriptEventConstructTempleMissionCompleted",				-- trigger event, to start on
			true,																														-- trigger condition
			player_faction_key, 																										-- faction key
			overrides.suppress_initiate_hecatomb_countdown_turns or 1,																	-- number of turns to wait
			overrides.suppress_initiate_hecatomb_trigger_event or "ScriptEventIssueAccumulateFavourMissionMission"						-- event to trigger
		);
	end;

	-- Initiate Hecatomb
	-- Issues a mission to initiate a Hecatomb. Issued after 1 turn after constructing a temple.
	if not overrides.suppress_initiate_hecatomb then
		start_early_game_initiate_hecatomb_mission_listener(
			"initiate_hecatomb",																								-- unique name
			player_faction_key,																									-- faction key
			overrides.initiate_hecatomb_advice_key or "troy_camp_early_game_initiate_hecatomb_001",								-- advice key
			overrides.initiate_hecatomb_mission_key or early_game_mission_prepend_str .. "_initiate_hecatomb_1",				-- mission key
			overrides.initiate_hecatomb_mission_rewards or {
				early_game_food_mission_reward(600),
				early_game_bronze_mission_reward(50)
			},																													-- mission rewards
			overrides.initiate_hecatomb_trigger_event or "ScriptEventIssueAccumulateFavourMissionMission",							-- trigger event
			overrides.initiate_hecatomb_issued_event,																			-- mission issued event
			overrides.initiate_hecatomb_completed_event or "ScriptEventInitiateHecatombMissionCompleted",						-- mission completed event
			overrides.initiate_hecatomb_inherit_list or {
				"construct_temple",
			}																													-- narrative events to inherit rewards from
		);
	end;

	-- Accumulate Favour
	-- Issues a mission to accumulate an amount of favour with any particular god. Issued after the perform a Hecatomb mission is completed.
	-- An entry in the missions_text table with key "troy_scripted_mission_description_accumulate_favour_x", where x is the supplied
	-- favour threshold, must exist. This is the mission text that gets displayed for this scripted mission.
	if not overrides.suppress_accumulate_favour then
		start_early_game_accumulate_favour_mission_listener(
			"accumulate_favour",																								-- unique name
			player_faction_key,																									-- faction key
			overrides.accumulate_favour_advice_key or "troy_camp_early_game_earn_favour_001",									-- advice key
			overrides.accumulate_favour_mission_key or early_game_mission_prepend_str .. "_earn_favour_1",						-- mission key
			overrides.accumulate_favour_threshold or 250,																		-- favour threshold
			overrides.accumulate_favour_mission_rewards or {
				early_game_mission_reward_mythic_unit("ScriptEventAccumulateFavourMissionCompleted")
			},																													-- mission rewards
			overrides.accumulate_favour_trigger_event or "ScriptEventInitiateHecatombMissionCompleted",							-- trigger event
			overrides.accumulate_favour_issued_event,																			-- mission issued event
			overrides.accumulate_favour_completed_event or "ScriptEventAccumulateFavourMissionCompleted",						-- mission completed event
			overrides.accumulate_favour_inherit_list or {
				"construct_temple",
				"initiate_hecatomb"
			}																												-- narrative events to inherit rewards from
		);
	end;
	

	











	-----------------------------------------------------------------------------------------------------------
	--	Agent chain -- triggered after construct a Temple mission
	-----------------------------------------------------------------------------------------------------------
	--[[
	if not overrides.suppress_construct_agent_building_countdown then
		cm:add_turn_countdown_event_on_event(
			overrides.construct_agent_building_countdown_trigger_event or "ScriptEventIntroCutsceneFinished",					-- trigger event, to start on
			true,																												-- trigger condition
			player_faction_key, 																								-- faction key
			overrides.construct_agent_building_countdown_turns or 11,															-- number of turns to wait
			overrides.construct_agent_building_trigger_event or "ScriptEventIssueConstructAgentBuildingMission"					-- event to trigger
		);
	end;


	if not overrides.suppress_construct_agent_building then
		start_early_game_construct_agent_building_mission_listener(
			"construct_agent_building",																							-- unique name
			player_faction_key,																									-- faction key
			overrides.construct_agent_building_advice_key or "troy_camp_early_game_construct_agent_building_001",				-- advice key
			overrides.construct_agent_building_mission_key or early_game_mission_prepend_str .. "_construct_agent_building_1",	-- mission key
			overrides.construct_agent_building_mission_rewards or {
				early_game_wood_mission_reward(400),
				early_game_stone_mission_reward(100)
			},																													-- mission rewards
			overrides.construct_agent_building_trigger_event or "ScriptEventIssueConstructAgentBuildingMission",				-- trigger event
			overrides.construct_agent_building_issued_event,																	-- mission issued event
			overrides.construct_agent_building_completed_event or "ScriptEventConstructAgentBuildingMissionCompleted",			-- mission completed event
			overrides.construct_agent_building_inherit_list or nil																-- narrative events to inherit rewards from
		);
	end;
	]]

	if not overrides.suppress_recruit_agent then
		start_early_game_recruit_agent_mission_listener(
			"recruit_agent",																									-- unique name
			player_faction_key,																									-- faction key
			overrides.recruit_agent_advice_key or "troy_camp_early_game_recruit_agent_001",										-- advice key
			overrides.recruit_agent_mission_key or early_game_mission_prepend_str .. "_recruit_agent_1",						-- mission key
			overrides.recruit_agent_mission_rewards or {
				early_game_food_mission_reward(500),
				early_game_gold_mission_reward(20)
			},																													-- mission rewards
			overrides.recruit_agent_trigger_event or "ScriptEventConstructTempleMissionCompleted",								-- trigger event
			overrides.recruit_agent_issued_event,																				-- mission issued event
			overrides.recruit_agent_completed_event or "ScriptEventRecruitAgentMissionCompleted",								-- mission completed event
			overrides.recruit_agent_inherit_list or nil  																		-- narrative events to inherit rewards from
			--{
			--	"construct_agent_building"
			--}																													
		);
	end;


	if not overrides.suppress_employ_agent then
		start_early_game_employ_agent_mission_listener(
			"employ_agent",																										-- unique name
			player_faction_key,																									-- faction key
			overrides.employ_agent_advice_key or "troy_camp_early_game_employ_agent_001",										-- advice key
			overrides.employ_agent_mission_key or early_game_mission_prepend_str .. "_employ_agent_1",							-- mission key
			overrides.employ_agent_mission_rewards or {
				early_game_food_mission_reward(100),
				early_game_bronze_mission_reward(10)
			},																													-- mission rewards
			overrides.employ_agent_trigger_event or "ScriptEventRecruitAgentMissionCompleted",									-- trigger event
			overrides.employ_agent_issued_event,																				-- mission issued event
			overrides.employ_agent_completed_event or "ScriptEventEmployAgentMissionCompleted",									-- mission completed event
			overrides.employ_agent_inherit_list or {
			--	"construct_agent_building",
				"recruit_agent"
			}																													-- narrative events to inherit rewards from
		);
	end;








	

	-----------------------------------------------------------------------------------------------------------
	--	Diplomacy chain
	-----------------------------------------------------------------------------------------------------------

	if not overrides.suppress_barter_agreement_countdown then
		cm:add_turn_countdown_event_on_event(
			overrides.barter_agreement_countdown_trigger_event or "ScriptEventIntroCutsceneFinished",							-- trigger event, to start on
			true,																												-- trigger condition
			player_faction_key, 																								-- faction key
			overrides.barger_agreement_countdown_turns or 13,																	-- number of turns to wait
			overrides.barter_agreeemnt_trigger_event or "ScriptEventIssueBarterAgreementMission"								-- event to trigger
		);
	end;


	if not overrides.suppress_barter_agreement then
		start_early_game_barter_agreement_mission_listener(
			"barter_agreement",																									-- unique name
			player_faction_key,																									-- faction key
			overrides.barter_agreement_advice_key or "troy_camp_early_game_make_barter_agreement_001",							-- advice key
			overrides.barter_agreement_mission_key or early_game_mission_prepend_str .. "_make_barter_agreement_1",				-- mission key
			overrides.barter_agreement_mission_rewards or {
				early_game_food_mission_reward(100),
				early_game_bronze_mission_reward(30),
				early_game_gold_mission_reward(30)
			},																													-- mission rewards
			overrides.barter_agreement_trigger_event or "ScriptEventIssueBarterAgreementMission",								-- trigger event
			overrides.barter_agreement_issued_event,																			-- mission issued event
			overrides.barter_agreement_completed_event or "ScriptEventBarterAgreementMissionCompleted",							-- mission completed event
			overrides.barter_agreement_inherit_list or nil																		-- narrative events to inherit rewards from
		);
	end;

	if not overrides.suppress_non_aggression_pact_countdown then
		cm:add_turn_countdown_event_on_event(
			overrides.non_aggression_pact_countdown_trigger_event or "ScriptEventBarterAgreementMissionCompleted",				-- trigger event, to start on
			true,																												-- trigger condition
			player_faction_key, 																								-- faction key
			overrides.non_aggression_pact_countdown_turns or 1,																	-- number of turns to wait
			overrides.non_aggression_pact_trigger_event or "ScriptEventIssueNonAggressionPactMission"							-- event to trigger
		);
	end;

	if not overrides.suppress_non_aggression_pact then
		start_early_game_non_aggression_pact_mission_listener(
			"non_aggression_pact",																								-- unique name
			player_faction_key,																									-- faction key
			overrides.non_aggression_pact_advice_key or "troy_camp_early_game_make_non_aggression_pact_001",					-- advice key
			overrides.non_aggression_pact_mission_key or early_game_mission_prepend_str .. "_make_non_aggression_pact_1",		-- mission key
			overrides.non_aggression_pact_mission_rewards or {
				early_game_food_mission_reward(100),
				early_game_bronze_mission_reward(30)
			},																													-- mission rewards
			overrides.non_aggression_pact_trigger_event or "ScriptEventIssueNonAggressionPactMission",							-- trigger event
			overrides.non_aggression_pact_issued_event,																			-- mission issued event
			overrides.non_aggression_pact_completed_event or "ScriptEventNonAggressionPactMissionCompleted",					-- mission completed event
			overrides.non_aggression_pact_inherit_list or {
				"barter_agreement"
			}																													-- narrative events to inherit rewards from
		);
	end;

	--[[
	if not overrides.suppress_defensive_alliance_countdown then
		cm:add_turn_countdown_event_on_event(
			overrides.defensive_alliance_countdown_trigger_event or "ScriptEventBarterAgreementMissionCompleted",				-- trigger event, to start on
			true,																												-- trigger condition
			player_faction_key, 																								-- faction key
			overrides.defensive_alliance_countdown_turns or 1,																	-- number of turns to wait
			overrides.defensive_alliance_trigger_event or "ScriptEventIssueDefensiveAllianceMission"							-- event to trigger
		);
	end;


	if not overrides.suppress_defensive_alliance then
		start_early_game_defensive_alliance_mission_listener(
			"defensive_alliance",																								-- unique name
			player_faction_key,																									-- faction key
			overrides.defensive_alliance_advice_key or "troy_camp_early_game_make_defensive_alliance_001",						-- advice key
			overrides.defensive_alliance_mission_key or early_game_mission_prepend_str .. "_make_defensive_alliance_1",			-- mission key
			overrides.defensive_alliance_mission_rewards or {
				early_game_food_mission_reward(250),
				early_game_bronze_mission_reward(50),
				early_game_gold_mission_reward(50)
			},																													-- mission rewards
			overrides.defensive_alliance_trigger_event or "ScriptEventIssueDefensiveAllianceMission",							-- trigger event
			overrides.defensive_alliance_issued_event,																			-- mission issued event
			overrides.defensive_alliance_completed_event or "ScriptEventDefensiveAllianceMissionCompleted",						-- mission completed event
			overrides.defensive_alliance_inherit_list or {
				"non_aggression_pact",
				"barter_agreement"
			}																													-- narrative events to inherit rewards from
		);
	end;


	if not overrides.suppress_confederation_countdown then
		cm:add_turn_countdown_event_on_event(
			overrides.confederation_countdown_trigger_event or "ScriptEventDefensiveAllianceMissionCompleted",					-- trigger event, to start on
			true,																												-- trigger condition
			player_faction_key, 																								-- faction key
			overrides.confederation_countdown_turns or 1,																		-- number of turns to wait
			overrides.confederation_trigger_event or "ScriptEventIssueConfederationMission"										-- event to trigger
		);
	end;


	if not overrides.suppress_confederation then
		start_early_game_confederation_mission_listener(
			"confederation",																									-- unique name
			player_faction_key,																									-- faction key
			overrides.confederation_advice_key or "troy_camp_early_game_confederate_001",										-- advice key
			overrides.confederation_mission_key or early_game_mission_prepend_str .. "_confederate_1",							-- mission key
			overrides.confederation_mission_rewards or {
				early_game_mission_reward_epic_agent("ScriptEventConfederationMissionCompleted")
			},																													-- mission rewards
			overrides.confederation_trigger_event or "ScriptEventIssueConfederationMission",									-- trigger event
			overrides.confederation_issued_event,																				-- mission issued event
			overrides.confederation_completed_event or "ScriptEventConfederationMissionCompleted",								-- mission completed event
			overrides.confederation_inherit_list or {
				"non_aggression_pact",
				"barter_agreement",
				"defensive_alliance"
			}																													-- narrative events to inherit rewards from
		);
	end;
	]]


	-----------------------------------------------------------------------------------------------------------
	--	Recruit Hero chain
	-----------------------------------------------------------------------------------------------------------


	if not overrides.suppress_recruit_hero_countdown then
		cm:add_turn_countdown_event_on_event(
			overrides.recruit_hero_countdown_trigger_event or "ScriptEventIntroCutsceneFinished",								-- trigger event, to start on
			true,																												-- trigger condition
			player_faction_key, 																								-- faction key
			overrides.recruit_hero_countdown_turns or 14,																		-- number of turns to wait
			overrides.recruit_hero_trigger_event or "ScriptEventIssueRecruitHeroMission"										-- event to trigger
		);
	end;


	if not overrides.suppress_recruit_hero then
		start_early_game_recruit_hero_mission_listener(
			"recruit_hero",																										-- unique name
			player_faction_key,																									-- faction key
			overrides.recruit_hero_advice_key or "troy_camp_early_game_recruit_hero_001",										-- advice key
			overrides.recruit_hero_mission_key or early_game_mission_prepend_str .. "_recruit_hero_1",							-- mission key
			overrides.recruit_hero_mission_rewards or {
				early_game_food_mission_reward(300),
				early_game_bronze_mission_reward(50)
			},																													-- mission rewards
			overrides.recruit_hero_trigger_event or "ScriptEventIssueRecruitHeroMission",							 			-- trigger event
			overrides.recruit_hero_issued_event,																				-- mission issued event
			overrides.recruit_hero_completed_event or "ScriptEventRecruitHeroMissionCompleted",									-- mission completed event
			overrides.recruit_hero_inherit_list or nil																			-- narrative events to inherit rewards from
		);
	end;








	-----------------------------------------------------------------------------------------------------------
	--	Mythical Unit chain
	-----------------------------------------------------------------------------------------------------------


	if not overrides.suppress_recruit_mythical_unit_countdown then
		cm:add_turn_countdown_event_on_event(
			overrides.mythical_unit_countdown_trigger_event or "ScriptEventIntroCutsceneFinished",								-- trigger event, to start on
			true,																												-- trigger condition
			player_faction_key, 																								-- faction key
			overrides.mythical_unit_countdown_turns or 16,																		-- number of turns to wait
			overrides.mythical_unit_trigger_event or "ScriptEventIssueRecruitMythicalUnitMission"								-- event to trigger
		);
	end;


	if not overrides.suppress_recruit_mythical_unit then
		start_early_game_recruit_mythical_unit_mission_listener(
			"recruit_mythical_unit",																							-- unique name
			player_faction_key,																									-- faction key
			overrides.mythical_unit_advice_key or "troy_camp_early_game_recruit_mythical_unit_001",								-- advice key
			overrides.mythical_unit_mission_key or early_game_mission_prepend_str .. "_recruit_mythical_unit_1",				-- mission key
			overrides.mythical_unit_mission_rewards or {
				early_game_mission_reward_epic_agent("ScriptEventRecruitMythicUnitMissionCompleted")
			},																													-- mission rewards
			overrides.mythical_unit_trigger_event or "ScriptEventIssueRecruitMythicalUnitMission",				 				-- trigger event
			overrides.mythical_unit_issued_event,																				-- mission issued event
			overrides.mythical_unit_completion_event or "ScriptEventRecruitMythicUnitMissionCompleted",								-- mission completed event
			overrides.mythical_unit_inherit_list or nil																			-- narrative events to inherit rewards from
		);
	end;
end;









function start_early_game_missions_achilles(player_faction_key, early_game_mission_prepend_str, overrides)


	-----------------------------------------------------------------------------------------------------------
	--	Mood Swings chain
	-----------------------------------------------------------------------------------------------------------


	if not overrides.suppress_enrage_achilles_countdown then
		cm:add_turn_countdown_event_on_event(
			overrides.enrage_achilles_countdown_trigger_event or "ScriptEventIntroCutsceneFinished",							-- trigger event, to start on
			true,																												-- trigger condition
			player_faction_key, 																								-- faction key
			overrides.enrage_achilles_countdown_turns or turn_countdown_first_faction_specific_mission,							-- number of turns to wait
			overrides.enrage_achilles_trigger_event or "ScriptEventIssueEnrageAchillesMission"									-- event to trigger
		);
	end;
	

	if not overrides.suppress_enrage_achilles then
		start_early_game_make_achilles_enraged_mission_listener(
			"make_achilles_enraged",																							-- unique name
			player_faction_key,																									-- faction key
			overrides.enrage_achilles_advice_key or "troy_camp_early_game_achilles_mood_swings_001",							-- advice key
			overrides.enrage_achilles_mission_key or early_game_mission_prepend_str .. "_mood_enraged_1",						-- mission key
			overrides.enrage_achilles_mission_rewards or {
				early_game_food_mission_reward(100),
				early_game_wood_mission_reward(100)
			},																													-- mission rewards
			overrides.enrage_achilles_trigger_event or "ScriptEventIssueEnrageAchillesMission",						 			-- trigger event
			overrides.enrage_achilles_issued_event,																				-- mission issued event
			overrides.enrage_achilles_completion_event or "ScriptEventEnrageAchillesMissionCompleted",							-- mission completed event
			overrides.enrage_achilles_inherit_list or nil																		-- narrative events to inherit rewards from
		);
	end;








	-----------------------------------------------------------------------------------------------------------
	--	Greatest Warrior chain
	-----------------------------------------------------------------------------------------------------------


	if not overrides.suppress_become_greatest_warrior_countdown then
		cm:add_turn_countdown_event_on_event(
			overrides.become_greatest_warrior_countdown_trigger_event or "ScriptEventIntroCutsceneFinished",					-- trigger event, to start on
			true,																												-- trigger condition
			player_faction_key, 																								-- faction key
			overrides.become_greatest_warrior_countdown_turns or turn_countdown_second_faction_specific_mission,				-- number of turns to wait
			overrides.become_greatest_warrior_trigger_event or "ScriptEventIssueGreatestWarriorMission"							-- event to trigger
		);
	end;
	
	
	if not overrides.suppress_become_greatest_warrior then
		start_early_game_achilles_become_greatest_warrior_mission_listener(
			"become_greatest_warrior",																							-- unique name
			player_faction_key,																									-- faction key
			overrides.become_greatest_warrior_advice_key or "troy_camp_early_game_achilles_greatest_warrior_001",				-- advice key
			overrides.become_greatest_warrior_mission_key or early_game_mission_prepend_str .. "_greatest_warrior_1",			-- mission key
			overrides.become_greatest_warrior_mission_rewards or {
				early_game_food_mission_reward(200),
				early_game_bronze_mission_reward(50),
				early_game_gold_mission_reward(10)
			},																													-- mission rewards
			overrides.become_greatest_warrior_trigger_event or "ScriptEventIssueGreatestWarriorMission",				 		-- trigger event
			overrides.become_greatest_warrior_issued_event,																		-- mission issued event
			overrides.become_greatest_warrior_completion_event or "ScriptEventGreatestWarriorMissionCompleted",					-- mission completed event
			overrides.become_greatest_warrior_inherit_list or nil																-- narrative events to inherit rewards from
		);
	end;
end;










function start_early_game_missions_agamemnon(player_faction_key, early_game_mission_prepend_str, overrides)


	-----------------------------------------------------------------------------------------------------------
	--	Appoint Heroes chain
	-----------------------------------------------------------------------------------------------------------
--[[

	if not overrides.suppress_appoint_heqetas_countdown then
		cm:add_turn_countdown_event_on_event(
			overrides.appoint_heqetas_countdown_trigger_event or "ScriptEventIntroCutsceneFinished",							-- trigger event, to start on
			true,																												-- trigger condition
			player_faction_key, 																								-- faction key
			overrides.appoint_heqetas_countdown_turns or turn_countdown_first_faction_specific_mission,							-- number of turns to wait
			overrides.appoint_heqetas_trigger_event or "ScriptEventIssueAppointHeqetasMission"									-- event to trigger
		);
	end;
	

	if not overrides.suppress_appoint_heqetas then
		start_early_game_appoint_heqetas_mission_listener(
			"appoint_heqetas",																									-- unique name
			player_faction_key,																									-- faction key
			overrides.appoint_heqetas_advice_key or "troy_camp_early_game_agamemnon_appoint_character_001",						-- advice key
			overrides.appoint_heqetas_mission_key or early_game_mission_prepend_str .. "_appoint_character_heqetas_1",			-- mission key
			overrides.appoint_heqetas_mission_rewards or {
				early_game_food_mission_reward(300),
				early_game_bronze_mission_reward(30)
			},																													-- mission rewards
			overrides.appoint_heqetas_trigger_event or "ScriptEventIssueAppointHeqetasMission",						 			-- trigger event
			overrides.appoint_heqetas_issued_event,																				-- mission issued event
			overrides.appoint_heqetas_completion_event or "ScriptEventAppointHeqetasMissionCompleted",							-- mission completed event
			overrides.appoint_heqetas_inherit_list or nil																		-- narrative events to inherit rewards from
		);
	end;


	-- by default, appoint telestas mission comes with no advice
	local appoint_telestas_advice_key;
	if overrides.appoint_telestas_advice_key then
		appoint_telestas_advice_key = overrides.appoint_telestas_advice_key;
	end;

	if not overrides.suppress_appoint_telestas then
		start_early_game_appoint_telestas_mission_listener(
			"appoint_telestas",																									-- unique name
			player_faction_key,																									-- faction key
			appoint_telestas_advice_key,																						-- advice key
			overrides.appoint_telestas_mission_key or early_game_mission_prepend_str .. "_appoint_character_telestas_1",		-- mission key
			overrides.appoint_telestas_mission_rewards or {
				early_game_food_mission_reward(400),
				early_game_bronze_mission_reward(40)
			},																													-- mission rewards
			overrides.appoint_telestas_trigger_event or "ScriptEventAppointHeqetasMissionCompleted",				 			-- trigger event
			overrides.appoint_telestas_issued_event,																			-- mission issued event
			overrides.appoint_telestas_completion_event or "ScriptEventAppointTelestasMissionCompleted",						-- mission completed event
			overrides.appoint_telestas_inherit_list or {
				"appoint_heqetas"
			}																													-- narrative events to inherit rewards from
		);
	end;


	-- by default, appoint lawagetas mission comes with no advice
	local appoint_lawagetas_advice_key;
	if overrides.appoint_lawagetas_advice_key then
		appoint_lawagetas_advice_key = overrides.appoint_lawagetas_advice_key;
	end;

	if not overrides.suppress_appoint_lawagetas then
		start_early_game_appoint_lawagetas_mission_listener(
			"appoint_lawagetas",																								-- unique name
			player_faction_key,																									-- faction key
			appoint_lawagetas_advice_key,																						-- advice key
			overrides.appoint_lawagetas_mission_key or early_game_mission_prepend_str .. "_appoint_character_lawagetas_1",		-- mission key
			overrides.appoint_lawagetas_mission_rewards or {
				early_game_food_mission_reward(500),
				early_game_bronze_mission_reward(50),
				early_game_gold_mission_reward(10)
			},																													-- mission rewards
			overrides.appoint_lawagetas_trigger_event or "ScriptEventAppointTelestasMissionCompleted",				 			-- trigger event
			overrides.appoint_lawagetas_issued_event,																			-- mission issued event
			overrides.appoint_lawagetas_completion_event or "ScriptEventAppointLawagetasMissionCompleted",						-- mission completed event
			overrides.appoint_lawagetas_inherit_list or {
				"appoint_heqetas",
				"appoint_telestas"
			}																													-- narrative events to inherit rewards from
		);
	end;
]]







	-----------------------------------------------------------------------------------------------------------
	--	Request Resources chain
	-----------------------------------------------------------------------------------------------------------


	if not overrides.suppress_request_resources_countdown then
		cm:add_turn_countdown_event_on_event(
			overrides.request_resources_countdown_trigger_event or "ScriptEventIntroCutsceneFinished",							-- trigger event, to start on
			true,																												-- trigger condition
			player_faction_key, 																								-- faction key
			overrides.request_resources_countdown_turns or turn_countdown_first_faction_specific_mission,						-- number of turns to wait
			overrides.request_resources_trigger_event or "ScriptEventIssueRequestResourcesMission"								-- event to trigger
		);
	end;
	

	if not overrides.request_resources then
		start_early_game_request_resources_mission_listener(
			"request_resources",																								-- unique name
			player_faction_key,																									-- faction key
			overrides.request_resources_advice_key or "troy_camp_early_game_agamemnon_request_resources_001",					-- advice key
			overrides.request_resources_mission_key or early_game_mission_prepend_str .. "_request_resources_1",				-- mission key
			overrides.request_resources_mission_rewards or {
				early_game_food_mission_reward(150)
			},																													-- mission rewards
			overrides.request_resources_trigger_event or "ScriptEventIssueRequestResourcesMission",				 				-- trigger event
			overrides.request_resources_issued_event,																			-- mission issued event
			overrides.request_resources_completion_event or "ScriptEventRequestResourcesMissionCompleted",						-- mission completed event
			overrides.request_resources_inherit_list or nil																		-- narrative events to inherit rewards from
		);
	end;
end;










function start_early_game_missions_menelaus(player_faction_key, early_game_mission_prepend_str, overrides)


	-----------------------------------------------------------------------------------------------------------
	--	Establish Colony chain
	-----------------------------------------------------------------------------------------------------------


	if not overrides.suppress_establish_colony_countdown then
		cm:add_turn_countdown_event_on_event(
			overrides.establish_colony_countdown_trigger_event or "ScriptEventIntroCutsceneFinished",							-- trigger event, to start on
			true,																												-- trigger condition
			player_faction_key, 																								-- faction key
			overrides.establish_colony_countdown_turns or turn_countdown_first_faction_specific_mission,						-- number of turns to wait
			overrides.establish_colony_trigger_event or "ScriptEventIssueEstablishColonyMission"								-- event to trigger
		);
	end;
	

	if not overrides.suppress_establish_colony then
		start_early_game_establish_colony_mission_listener(
			"establish_colony",																									-- unique name
			player_faction_key,																									-- faction key
			overrides.establish_colony_advice_key or "troy_camp_early_game_menelaus_establish_colony_001",						-- advice key
			overrides.establish_colony_mission_key or early_game_mission_prepend_str .. "_establish_colony_1",					-- mission key
			overrides.establish_colony_mission_rewards or {
				early_game_food_mission_reward(200),
				early_game_wood_mission_reward(100)
			},																													-- mission rewards
			overrides.establish_colony_trigger_event or "ScriptEventIssueEstablishColonyMission",						 		-- trigger event
			overrides.establish_colony_issued_event,																			-- mission issued event
			overrides.establish_colony_completion_event or "ScriptEventEstablishColonyMissionCompleted",						-- mission completed event
			overrides.establish_colony_inherit_list or nil																		-- narrative events to inherit rewards from
		);
	end;








	-----------------------------------------------------------------------------------------------------------
	--	Recruit Allies / Call to Arms chain
	-----------------------------------------------------------------------------------------------------------


	if not overrides.suppress_recruit_allies_countdown then
		cm:add_turn_countdown_event_on_event(
			overrides.recruit_allies_countdown_trigger_event or "ScriptEventIntroCutsceneFinished",								-- trigger event, to start on
			true,																												-- trigger condition
			player_faction_key, 																								-- faction key
			overrides.recruit_allies_countdown_turns or turn_countdown_second_faction_specific_mission,							-- number of turns to wait
			overrides.recruit_allies_trigger_event or "ScriptEventIssueRecruitAlliesMission"									-- event to trigger
		);
	end;
	

	if not overrides.recruit_allies then
		start_early_game_recruit_allies_mission_listener(
			"recruit_allies",																									-- unique name
			player_faction_key,																									-- faction key
			overrides.recruit_allies_advice_key or "troy_camp_early_game_menelaus_recruit_from_ally_001",						-- advice key
			overrides.recruit_allies_mission_key or early_game_mission_prepend_str .. "_recruit_from_ally_1",					-- mission key
			overrides.recruit_allies_mission_rewards or {
				early_game_food_mission_reward(300)
			},																													-- mission rewards
			overrides.recruit_allies_trigger_event or "ScriptEventIssueRecruitAlliesMission",					 				-- trigger event
			overrides.recruit_allies_issued_event,																				-- mission issued event
			overrides.recruit_allies_completion_event or "ScriptEventRecruitAlliesMissionCompleted",							-- mission completed event
			overrides.recruit_allies_inherit_list or nil																		-- narrative events to inherit rewards from
		);
	end;
end;

















function start_early_game_missions_odysseus(player_faction_key, early_game_mission_prepend_str, overrides)


	-----------------------------------------------------------------------------------------------------------
	--	Capture Coastal Region chain
	-----------------------------------------------------------------------------------------------------------


	if not overrides.suppress_capture_coastal_region_countdown then
		cm:add_turn_countdown_event_on_event(
			overrides.capture_coastal_region_countdown_trigger_event or "ScriptEventIntroCutsceneFinished",						-- trigger event, to start on
			true,																												-- trigger condition
			player_faction_key, 																								-- faction key
			overrides.capture_coastal_region_countdown_turns or turn_countdown_first_faction_specific_mission,					-- number of turns to wait
			overrides.capture_coastal_region_trigger_event or "ScriptEventIssueCaptureCoastalRegionMission"						-- event to trigger
		);
	end;
	

	if not overrides.suppress_capture_coastal_region then
		start_early_game_capture_coastal_region_mission_listener(
			"capture_coastal_region",																							-- unique name
			player_faction_key,																									-- faction key
			overrides.capture_coastal_region_advice_key or "troy_camp_early_game_odysseus_coastal_regions_001",					-- advice key
			overrides.capture_coastal_region_mission_key or early_game_mission_prepend_str .. "_capture_coastal_region_1",		-- mission key
			overrides.capture_coastal_region_mission_rewards or {
				early_game_food_mission_reward(200),
				early_game_wood_mission_reward(150)
			},																													-- mission rewards
			overrides.capture_coastal_region_trigger_event or "ScriptEventIssueCaptureCoastalRegionMission",				 	-- trigger event
			overrides.capture_coastal_region_issued_event,																		-- mission issued event
			overrides.capture_coastal_region_completion_event or "ScriptEventCaptureCoastalRegionMissionCompleted",				-- mission completed event
			overrides.capture_coastal_region_inherit_list or nil																-- narrative events to inherit rewards from
		);
	end;








	-----------------------------------------------------------------------------------------------------------
	--	Construct Supply Base chain
	-----------------------------------------------------------------------------------------------------------


	if not overrides.suppress_construct_supply_base_countdown then
		cm:add_turn_countdown_event_on_event(
			overrides.construct_supply_base_countdown_trigger_event or "ScriptEventIntroCutsceneFinished",						-- trigger event, to start on
			true,																												-- trigger condition
			player_faction_key, 																								-- faction key
			overrides.construct_supply_base_countdown_turns or turn_countdown_second_faction_specific_mission,					-- number of turns to wait
			overrides.construct_supply_base_trigger_event or "ScriptEventIssueConstructSupplyBaseMission"						-- event to trigger
		);
	end;
	

	if not overrides.construct_supply_base then
		start_early_game_construct_supply_base_mission_listener(
			"construct_supply_base",																							-- unique name
			player_faction_key,																									-- faction key
			overrides.construct_supply_base_advice_key or "troy_camp_early_game_odysseus_construct_supply_base_001",			-- advice key
			overrides.construct_supply_base_mission_key or early_game_mission_prepend_str .. "_construct_supply_base_1",		-- mission key
			overrides.construct_supply_base_mission_rewards or {
				early_game_food_mission_reward(300),
				early_game_wood_mission_reward(200)
			},																													-- mission rewards
			overrides.construct_supply_base_trigger_event or "ScriptEventIssueConstructSupplyBaseMission",				 		-- trigger event
			overrides.construct_supply_base_issued_event,																		-- mission issued event
			overrides.construct_supply_base_completion_event or "ScriptEventConstructSupplyBaseMissionCompleted",				-- mission completed event
			overrides.construct_supply_base_inherit_list or nil																	-- narrative events to inherit rewards from
		);
	end;
end;










function start_early_game_missions_priams_benevolence(player_faction_key, early_game_mission_prepend_str, overrides)


	-----------------------------------------------------------------------------------------------------------
	--	Priams Benevolence chain
	-----------------------------------------------------------------------------------------------------------


	if not overrides.suppress_earn_priams_benevolence_region_countdown then
		cm:add_turn_countdown_event_on_event(
			overrides.earn_priams_benevolence_countdown_trigger_event or "ScriptEventIntroCutsceneFinished",					-- trigger event, to start on
			true,																												-- trigger condition
			player_faction_key, 																								-- faction key
			overrides.earn_priams_benevolence_countdown_turns or turn_countdown_first_faction_specific_mission,					-- number of turns to wait
			overrides.earn_priams_benevolence_trigger_event or "ScriptEventIssueEarnPriamsBenevolenceMission"					-- event to trigger
		);
	end;
	

	if not overrides.suppress_earn_priams_benevolence then
		start_early_game_earn_priams_benevolence_mission_listener(
			"earn_priams_benevolence",																							-- unique name
			player_faction_key,																									-- faction key
			overrides.earn_priams_benevolence_advice_key or "troy_camp_early_game_priams_benevolence_001",						-- advice key
			overrides.earn_priams_benevolence_mission_key or early_game_mission_prepend_str .. "_earn_priams_benevolence_1",	-- mission key
			overrides.earn_priams_benevolence_threshold or 50,																	-- threshold value
			overrides.earn_priams_benevolence_mission_rewards or {
				early_game_food_mission_reward(200),
				early_game_gold_mission_reward(10)
			},																													-- mission rewards
			overrides.earn_priams_benevolence_trigger_event or "ScriptEventIssueEarnPriamsBenevolenceMission",				 	-- trigger event
			overrides.earn_priams_benevolence_issued_event,																		-- mission issued event
			overrides.earn_priams_benevolence_completion_event or "ScriptEventEarnPriamsBenevolenceCompleted",					-- mission completed event
			overrides.earn_priams_benevolence_inherit_list or nil																-- narrative events to inherit rewards from
		);
	end;
end;









function start_early_game_missions_penthesilea(player_faction_key, early_game_mission_prepend_str, overrides)

	-----------------------------------------------------------------------------------------------------------
	--	Building Construction chain
	-----------------------------------------------------------------------------------------------------------

	if not overrides.suppress_construct_any_horde_building_countdown then
		cm:add_turn_countdown_event_on_event(
			overrides.construct_any_horde_building_countdown_trigger_event or "ScriptEventIntroCutsceneFinished",				-- trigger event, to start on
			true,																												-- trigger condition
			player_faction_key, 																								-- faction key
			overrides.construct_any_horde_building_countdown_turns or 2,														-- number of turns to wait
			overrides.construct_any_horde_building_trigger_event or "ScriptEventIssueConstructHordeBuildingMission"				-- event to trigger
		);
	end;

	
	-- Building Construction
	-- Triggers a mission to construct any building. Issued on turn three.
	if not overrides.suppress_construct_any_horde_building then
		start_early_game_construct_any_horde_building_mission_listener(
			"construct_horde_building",																								-- unique name
			player_faction_key,																										-- faction key
			overrides.construct_any_horde_building_advice_key or nil,																-- advice key
			overrides.construct_any_horde_building_mission_key or early_game_mission_prepend_str .. "_construct_building_1",		-- mission key
			overrides.construct_any_horde_building_mission_rewards or {
				early_game_wood_mission_reward(350),
				early_game_stone_mission_reward(200)
			},																													-- mission rewards
			overrides.construct_any_horde_building_trigger_event or "ScriptEventIssueConstructHordeBuildingMission",			-- trigger event
			overrides.construct_any_horde_building_issued_event,																-- mission issued event
			overrides.construct_any_horde_building_completed_event or "ScriptEventConstructHordeBuildingMissionCompleted",		-- mission completed event
			overrides.construct_any_horde_building_inherit_list or nil															-- narrative events to inherit rewards from
		);
	end;


	-- Upgrade Horde
	-- Triggers a mission to upgrade any horde main building. Issued after the Building Construction mission is completed,
	-- or when the player earns a development point
	if not overrides.suppress_horde_upgrade_horde then
		start_early_game_upgrade_horde_mission_listener(
			"upgrade_horde",																							-- unique name
			player_faction_key,																							-- faction key
			overrides.upgrade_horde_advice_key or nil,																	-- advice key
			overrides.upgrade_horde_mission_key or early_game_mission_prepend_str .. "_upgrade_settlement_1",			-- mission key
			overrides.upgrade_horde_mission_rewards or {
				early_game_wood_mission_reward(400),
				early_game_stone_mission_reward(300)
			},																											-- mission rewards
			overrides.upgrade_horde_trigger_event or "ScriptEventConstructHordeBuildingMissionCompleted",				-- trigger event
			overrides.upgrade_horde_issued_event or nil,																-- mission issued event
			overrides.upgrade_horde_completed_event or "ScriptEventUpgradeHordeMissionCompleted",						-- mission completed event
			overrides.upgrade_horde_inherit_list or {
				"construct_horde_building"
			}																											-- narrative events to inherit rewards from
		);
	end;

	if not overrides.suppress_horde_upgrade_max_level_countdown then
		cm:add_turn_countdown_event_on_event(
			overrides.suppress_horde_upgrade_max_level_trigger_event or "ScriptEventUpgradeHordeMissionCompleted",				-- trigger event, to start on
			true,																												-- trigger condition
			player_faction_key, 																								-- faction key
			overrides.suppress_horde_upgrade_max_level_turns or 10,																-- number of turns to wait
			overrides.suppress_horde_upgrade_max_level_event or "ScriptEventIssueUpgradeHordeMaxLevelMission"					-- event to trigger
		);
	end;

	-- Upgrade Horde to Max Level
	-- Triggers a mission to upgrade any horde main building to max level. Issued after the Horde Upgrade mission is completed.
	if not overrides.suppress_horde_upgrade_max_level then
		start_early_game_upgrade_horde_to_max_level_mission_listener(
			"upgrade_horde_to_max_level",																					-- unique name
			player_faction_key,																								-- faction key
			overrides.upgrade_horde_max_level_advice_key or nil,															-- advice key
			overrides.upgrade_horde_max_level_mission_key or early_game_mission_prepend_str .. "_upgrade_settlement_2",		-- mission key
			overrides.upgrade_horde_max_level_mission_rewards or {
				early_game_wood_mission_reward(450),
				early_game_stone_mission_reward(350)
			},																												-- mission rewards
			overrides.upgrade_horde_max_level_trigger_event or "ScriptEventIssueUpgradeHordeMaxLevelMission",					-- trigger event
			overrides.upgrade_horde_max_level_issued_event,																	-- mission issued event
			overrides.upgrade_horde_max_level_completed_event or "ScriptEventUpgradeHordeMaxLevelMissionCompleted",			-- mission completed event
			overrides.upgrade_horde_max_level_inherit_list or {
				"construct_horde_building",
				"upgrade_horde"
			}																												-- narrative events to inherit rewards from
		);
	end;

end;

function start_early_game_missions_ajax(player_faction_key, early_game_mission_prepend_str, overrides)


	-----------------------------------------------------------------------------------------------------------
	--	Hold Celebration
	-----------------------------------------------------------------------------------------------------------


	if not overrides.suppress_hold_celebration_countdown then
		cm:add_turn_countdown_event_on_event(
			overrides.hold_celebration_countdown_trigger_event or "ScriptEventIntroCutsceneFinished",						-- trigger event, to start on
			true,																											-- trigger condition
			player_faction_key, 																							-- faction key
			overrides.hold_celebration_countdown_turns or turn_countdown_first_faction_specific_mission,					-- number of turns to wait
			overrides.hold_celebration_trigger_event or "ScriptEventIssueHoldCelebrationMission"							-- event to trigger
		);
	end;
	

	if not overrides.suppress_hold_celebration then
		start_early_game_ajax_hold_celebration_mission_listener(
			"hold_celebration",																								-- unique name
			player_faction_key,																								-- faction key
			overrides.hold_celebration_advice_key or "troy_camp_early_game_odysseus_coastal_regions_001",					-- advice key
			overrides.hold_celebration_mission_key or early_game_mission_prepend_str .. "_hold_celebration_1",				-- mission key
			overrides.hold_celebration_mission_rewards or {
				early_game_stone_mission_reward(80),
				early_game_bronze_mission_reward(70)
			},																												-- mission rewards
			overrides.hold_celebration_trigger_event or "ScriptEventIssueHoldCelebrationMission",				 			-- trigger event
			overrides.hold_celebration_issued_event,																		-- mission issued event
			overrides.hold_celebration_completion_event or "ScriptEventHoldCelebrationCompleted",							-- mission completed event
			overrides.hold_celebration_inherit_list or nil																	-- narrative events to inherit rewards from
		);
	end;

end;

function start_early_game_missions_diomedes(player_faction_key, early_game_mission_prepend_str, overrides)


	-----------------------------------------------------------------------------------------------------------
	--	Hold Celebration
	-----------------------------------------------------------------------------------------------------------


	if not overrides.suppress_gain_dominance_countdown then
		cm:add_turn_countdown_event_on_event(
			overrides.gain_dominance_countdown_trigger_event or "ScriptEventIntroCutsceneFinished",						-- trigger event, to start on
			true,																										-- trigger condition
			player_faction_key, 																						-- faction key
			overrides.gain_dominance_countdown_turns or turn_countdown_first_faction_specific_mission,					-- number of turns to wait
			overrides.gain_dominance_trigger_event or "ScriptEventIssueGainDominaceMission"								-- event to trigger
		);
	end;
	

	if not overrides.suppress_gain_dominance then
		start_early_game_diomedes_gain_dominance_mission_listener(
			"gain_dominance",																							-- unique name
			player_faction_key,																							-- faction key
			overrides.gain_dominance_advice_key or "troy_camp_early_game_odysseus_coastal_regions_001",					-- advice key
			overrides.gain_dominance_mission_key or early_game_mission_prepend_str .. "_gain_dominance_1",				-- mission key
			overrides.gain_dominance_amount or 50,
			overrides.gain_dominance_mission_rewards or {
				early_game_food_mission_reward(500),
				early_game_gold_mission_reward(50)
			},																											-- mission rewards
			overrides.gain_dominance_trigger_event or "ScriptEventIssueGainDominaceMission",				 			-- trigger event
			overrides.gain_dominance_issued_event,																		-- mission issued event
			overrides.gain_dominance_completion_event or "ScriptEventGainDominaceCompleted",							-- mission completed event
			overrides.gain_dominance_inherit_list or nil																-- narrative events to inherit rewards from
		);
	end;

end;

function start_early_game_missions_memnon(player_faction_key, early_game_mission_prepend_str, overrides)
	if not overrides.suppress_issue_specific_decree_countdown then
		cm:add_turn_countdown_event_on_event(
				overrides.issue_specific_decree_countdown_trigger_event or "ScriptEventIntroCutsceneFinished",								-- trigger event, to start on
				true,																												-- trigger condition
				player_faction_key, 																								-- faction key
				overrides.issue_specific_decree_countdown_turns or 1,																		-- number of turns to wait
				overrides.issue_specific_decree_trigger_event or "ScriptEventIssueSpecificDecreeMission"												-- event to trigger
		);
	end;

	if not overrides.suppress_issue_specific_decree then
		if not overrides.issue_specific_decree_objective then
			script_error("ERROR: start_early_game_missions_memnon() with suppress_issue_specific_decree set to false and issue_specific_decree_objective missing");
		else
			start_early_game_issue_specific_decree_mission_listener(
					"issue_specific_decree",																												-- unique name
					player_faction_key,																														-- faction key
					overrides.issue_specific_decree_advice_key or nil, --"troy_camp_early_game_issue_specific_decree_001",									-- advice key
					overrides.issue_specific_decree_mission_key or early_game_mission_prepend_str .. "_issue_specific_decree_1",							-- mission key
					overrides.issue_specific_decree_mission_rewards or {
						early_game_food_mission_reward(150),
						early_game_wood_mission_reward(150),
					},																													-- mission rewards
					overrides.issue_specific_decree_trigger_event or "ScriptEventIssueSpecificDecreeMission",											-- trigger event
					overrides.issue_specific_decree_issued_event,																				-- mission issued event
					overrides.issue_specific_decree_completed_event or "ScriptEventIssueSpecificDecreeMissionCompleted",									-- mission completed event
					overrides.issue_specific_decree_inherit_list or nil,																			-- narrative events to inherit rewards from
					overrides.issue_specific_decree_objective
			);
		end
	end;
end