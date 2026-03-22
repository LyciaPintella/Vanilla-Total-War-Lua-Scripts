

out("phar_main_ramesses_tutorial_additional loaded")





-- Called at bottom of this file
function tut.add.start_listeners_on_load()

	tut.add.start_resource_advice_listeners_on_load();
	tut.add.start_per_amun_listeners_on_load()
	tut.add.start_competency_points_advice_listeners_on_load();
	tut.add.start_seaborne_assault_listeners_on_load();
	tut.add.start_local_deities_advice_listeners_on_load();
	tut.add.start_court_advice_listeners_on_load();
	tut.add.start_shemsu_hor_advice_listeners_on_load();

	tut.add.start_global_interventions_listeners_on_load();
end;






-----------------------------------------------------------------------------------------------
--	Start Global Interventions
-----------------------------------------------------------------------------------------------

tut.start_interventions_turn = 13

function tut.add.start_global_interventions_listeners_on_load()
	--Listener starting all campaign interventions on turn start (currently turn 9)
	core:add_listener(
		"FTUE_StartGlobalInterventions",
		"ScriptEventPlayerFactionTurnStart",
		function(context) return cm:turn_number() == tut.start_interventions_turn end,
		function(context)
			core:trigger_event("ScriptEventFTUEStartGlobalInterventions")
		end
	)
end




-----------------------------------------------------------------------------------------------
--	Resources
-----------------------------------------------------------------------------------------------

local resource_advice_monitors_started = "tut_resource_advice_monitors_started";
local resource_advice_monitors_completed = "tut_resource_advice_monitors_completed";

local resource_precondition_missions_list = cm:get_saved_value("resource_precondition_missions_list") or {
	["phar_tutorial_ambition_3_colonize_neb_gehes"] = false
};


-- Called when scripts are loaded, decides to start listeners if the game is in the correct state
function tut.add.start_resource_advice_listeners_on_load()
	local started = cm:get_saved_value(resource_advice_monitors_started);
	local completed = cm:get_saved_value(resource_advice_monitors_completed);
	if started and not completed then
		-- We are in the correct state to start the listeners
		tut.add.start_resource_advice_listeners_action();
	end;
end;


-- Called when it's time to start the advice listeners from a previous section of script. After this is called, these listeners will start when loading from a savegame.
function tut.add.start_resource_advice_listeners()
	local started = cm:get_saved_value(resource_advice_monitors_started);
	local completed = cm:get_saved_value(resource_advice_monitors_completed);
	if started or completed then
		return false;
	end;

	cm:set_saved_value(resource_advice_monitors_started, true);

	return true, tut.add.start_resource_advice_listeners_action();
end;


-- Actually start the listeners, either on-load or by other scripts at the appropriate time
function tut.add.start_resource_advice_listeners_action()

	local process_name = "tut.add.pre_resource_advice_listeners";

	-- Listen for the player faction starting turn 14
	cm:add_faction_turn_start_listener_by_name(
		process_name,
		tut.player_faction_key,
		function()
			if cm:turn_number() >= 14 then
				cm:remove_faction_turn_start_listener_by_name(process_name);
				core:remove_listener(process_name);

				tut.add.start_resource_advice_intervention(false);
			end;
		end,
		true
	);

	-- Listen for the preconditional missions to be completed
	core:add_listener(
		process_name,
		"MissionSucceeded",
		function(context)
			local mission_key = context:mission():mission_record_key();
			if resource_precondition_missions_list[mission_key] == false then
				resource_precondition_missions_list[mission_key] = true;

				cm:set_saved_value("resource_precondition_missions_list", resource_precondition_missions_list);

				for mission_key, suceeded in pairs(resource_precondition_missions_list) do
					if succeeded == false then
						return false;
					end;
				end;

				-- All missions succeeded
				return true;
			end;
		end,
		function(context)
			cm:remove_faction_turn_start_listener_by_name(process_name);
			core:remove_listener(process_name);

			cm:checkpoint_reached(
				720,														-- checkpoint id
				function()												-- post-update callback
					t7_neb_gehes_colonized_overrides()
					t7_neb_gehes_colonized()
				end,
				tut.SHOULD_SAVE_EVERY_CHECKPOINT_MID,				-- should save game
				tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or false				-- always generate named savegame, rather than autosaving
			)
		end,
		false
	);
end;


-- Trigger a transient intervention to queue up the advice
function tut.add.start_resource_advice_intervention(objectives_succeeded)

	cm:set_saved_value(resource_advice_monitors_completed, true);

	cm:trigger_transient_intervention(
		"tutorial_resource_advice",					-- name
		function(inv)
			tut.add.start_resources_advice(objectives_succeeded)
		end,										-- callback
		true,										-- debug output
		function(inv)
		end											-- config callback
	);
end;


-- Actually issue the advice
function tut.add.start_resources_advice(objectives_succeeded)
	local conv_resources = campaign_conversation:new(
		"resources",
		function()
			cm:callback(
				function()
					tut.add.start_natives_advice();
				end,
				1
			);
		end
	);

	conv_resources:set_proceed_on_advice_finished(true);

	local resources_infotext = {
		"phar_tutorial_camp_ramesses_resources_info_00",
		"phar_tutorial_camp_ramesses_resources_info_01",
		"phar_tutorial_camp_ramesses_resources_info_02"
	};

	if objectives_succeeded then
		conv_resources:add_advice(
			"phar_main_tutorial_resources_01_mern",				-- advice key
			nil,												-- infotext
			nil,												-- show topic leader
			true,												-- dismiss before playing override
			nil,												-- initial delay override
			nil,												-- proceed on advice finished override
			nil 												-- start callback
		);

		conv_resources:add_advice(
			"phar_main_tutorial_resources_02_ram",				-- advice key
			nil,												-- infotext
			nil,												-- show topic leader
			true,												-- dismiss before playing override
			nil,												-- initial delay override
			nil,												-- proceed on advice finished override
			nil 												-- start callback
		);

		conv_resources:add_advice(
			"phar_main_tutorial_resources_03_mern",				-- advice key
			nil,												-- infotext
			nil,												-- show topic leader
			true,												-- dismiss before playing override
			nil,												-- initial delay override
			nil,												-- proceed on advice finished override
			nil 												-- start callback
		);

		conv_resources:add_advice(
			"phar_main_tutorial_resources_04_mern",				-- advice key
			resources_infotext,									-- infotext
			true,												-- show topic leader
			false,												-- dismiss before playing override
			nil,												-- initial delay override
			false,												-- proceed on advice finished override
			nil 												-- start callback
		);

	else
		conv_resources:add_advice(
			"phar_main_tutorial_resources_11_mern",				-- advice key
			nil,												-- infotext
			nil,												-- show topic leader
			true,												-- dismiss before playing override
			nil,												-- initial delay override
			nil,												-- proceed on advice finished override
			nil 												-- start callback
		);

		conv_resources:add_advice(
			"phar_main_tutorial_resources_12_ram",				-- advice key
			nil,												-- infotext
			nil,												-- show topic leader
			true,												-- dismiss before playing override
			nil,												-- initial delay override
			nil,												-- proceed on advice finished override
			nil 												-- start callback
		);
		
		conv_resources:add_advice(
			"phar_main_tutorial_resources_13_mern",				-- advice key
			resources_infotext,									-- infotext
			true,												-- show topic leader
			true,												-- dismiss before playing override
			nil,												-- initial delay override
			false,												-- proceed on advice finished override
			nil 												-- start callback
		);
	end;

	conv_resources:start();
end;






-----------------------------------------------------------------------------------------------
--	Native Units
-----------------------------------------------------------------------------------------------

-- TODO: flesh this out more
function tut.add.start_natives_advice()

	cm:progress_on_advice_dismissed(
		"tutorial_natives_advice", 
		function()
			cm:save(
				nil,
				function()
					tut_complete_active_intervention();
				end
			);
			
			if not tn_listeners_triggered.per_amun_conquered then
				ambitions.generate_specific_ambitions_with_intervention(tut.player_faction_key, {"phar_tutorial_ambition_7_conquer_per_amun"})
			end
			tut.add.start_per_amun_listeners()
		end,
		1,
		true
	);

	cm:clear_infotext();
	cm:show_advice(
		"phar_main_tutorial_natives_01_mern",
		true,
		false,
		function()
			cm:hide_advisor_without_infotexts()
		end,
		tut.ADVICE_DURATION_S
	);

	cm:add_infotext_with_leader(
		"phar_tutorial_camp_ramesses_native_units_info_00",
		"phar_tutorial_camp_ramesses_native_units_info_01",
		"phar_tutorial_camp_ramesses_native_units_info_02"
	);
end;






-----------------------------------------------------------------------------------------------
--	Conquer Per Amun ambition
-----------------------------------------------------------------------------------------------

local per_amun_monitors_started = "tut_per_amun_monitors_started";
local per_amun_monitors_completed = "tut_per_amun_monitors_completed";


-- Called when scripts are loaded, decides to start listeners if the game is in the correct state
function tut.add.start_per_amun_listeners_on_load()
	local started = cm:get_saved_value(per_amun_monitors_started);
	local completed = cm:get_saved_value(per_amun_monitors_completed);
	if started and not completed then
		-- We are in the correct state to start the listeners
		tut.add.start_conquer_per_amun_action();
	end
end

-- Called when it's time to start the advice listeners from a previous section of script. After this is called, these listeners will start when loading from a savegame.
function tut.add.start_per_amun_listeners()
	local started = cm:get_saved_value(per_amun_monitors_started);
	local completed = cm:get_saved_value(per_amun_monitors_completed);
	if started or completed then
		return false;
	end;

	cm:set_saved_value(per_amun_monitors_started, true);

	return true, tut.add.start_conquer_per_amun_action()
end

function tut.add.start_conquer_per_amun_action()
	if not tn_listeners_triggered.per_amun_conquered then
		cm:set_objective(tut.advisor_texts.next_turns.v2_conquer_per_amun.objective)
		uim:highlight_settlement("settlement:" .. tut.per_amun, "move_to_vfx")
		
		core:add_listener(
			"FTUE_AmbitionConquerPerAmunIssued",
			"MissionIssued",
			function(context)
				return context:mission():mission_record_key() == "phar_tutorial_ambition_7_conquer_per_amun"
			end,
			function()
				--Make a checkpoint for turn 7 since we should always get here at that point (looks a bit ugly, but we changed the tutorial steps and leaving this here is much cheaper)
				--Unlock the end-turn in the setup callback; it shouldn't get locked again
				cm:checkpoint_reached(
					730,
					function()
						t7_end_turn_overrides()
						t7_end_turn()
					end,
					tut.SHOULD_SAVE_EVERY_CHECKPOINT_START_END,
					tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or true
				)
			end,
			false
		)
		core:add_listener(
			"FTUE_PlayerConqueredPerAmun",
			"RegionFactionChangeEvent",
			function(context)
				local region = context:region()
				return region:name() == tut.per_amun and region:owning_faction():name() == tut.player_faction_key
			end,
			function(context)
				cm:set_saved_value(per_amun_monitors_completed, true)
				tut_complete_and_remove_objective(tut.advisor_texts.next_turns.v2_conquer_per_amun.objective)
				uim:unhighlight_settlement("settlement:" .. tut.per_amun, true)

				--Adding the competency points in a callback so that we don't interupt Merneptah's advice in tn_listeners_triggered.settlement_conquered
				-- PS: Added a rule to abide when VO is played and work properly in all localization languages
				if common.is_advice_audio_playing() then
					tut.add.conquer_per_amun_wait_for_advice_finish()
				else
				cm:callback(
					function()
						tut.add.start_competency_points_advice_listeners()
					end,
						tut.ADVICE_DURATION_S + 3
				)
				end;
			end,
			false
		)
	else
		-- if the player has already conquered Per-Amun immediately start first multiple choice Ambitions
		tut.add.issue_ambitions_choice()
		-- After the first battle chosen by the player happens start the Character progression section
		core:add_listener(
			"FTUE_FirstFreeActionBattle",
			"BattleCompletedPostModelNotify",
			function(context)
				local ramesses = cm:get_character_by_fm_cqi(tut.player_faction_leader_fm_cqi)
				return cm:pending_battle_cache_char_is_attacker(ramesses) and cm:turn_number() == 3
			end,
			function(context)
				tut.add.start_competency_points_advice_listeners()
			end,
			false
		)
	end
end

function tut.add.conquer_per_amun_wait_for_advice_finish()
	core:add_listener(
		"FTUE_WaitAdviceFinish",
		"AdviceFinishedTrigger",
		true,
		function()
			tut.add.start_competency_points_advice_listeners()
		end,
		false
	)
end



-----------------------------------------------------------------------------------------------
--	Choice of Ambitions
-----------------------------------------------------------------------------------------------

function tut.add.issue_ambitions_choice()

	local ambitions_to_generate = {
		"phar_tutorial_ambition_6_recruit_units",
		"phar_tutorial_ambition_6_research_technologies"
	};

	core:add_listener(
		"FTUE_AmbitionSelected_6",
		"MissionIssued",
		function(context)
			local mission_key = context:mission():mission_record_key();
			for i = 1, #ambitions_to_generate do
				if ambitions_to_generate[i] == mission_key then
					return true;
				end;
			end;
		end,
		function()
			tut.add.ambitions_choice_issued();	
		end,
		false
	)

	ambitions.generate_specific_ambitions(tut.player_faction_key, ambitions_to_generate);
end;


function tut.add.ambitions_choice_issued()
	cm:save(
		nil,
		function()
			if cm:get_active_intervention() then
				tut_complete_active_intervention()
			end
		end
	);
	
	cm:callback(
		function()
			end_turn_highlight()
		end,
		2
	)
end;









-----------------------------------------------------------------------------------------------
--	Character Details panel helper functions
-----------------------------------------------------------------------------------------------
local character_titles_tab_seen = false
local character_competencies_selected = false

function tut.add.character_development_steps_gate()
	if character_competencies_selected then
		tut.add.titles_add_title();
	elseif character_titles_tab_seen then
		tut.add.competency_points_character_details_titles_tab_opened();
	else
		tut.add.competency_points_character_details_panel_opened();
	end;
end;

function tut.add.competency_points_highlight_character_details_button(process_name)
	
	tut.add.highlight_character_details_button(
		process_name, 
		function()
			tut.add.character_development_steps_gate()
		end
	);
end;

function tut.add.highlight_character_details_button(process_name, progress_callback)
	cm:remove_callback(process_name);
	
	local uic_skills_button = find_uicomponent("hud_campaign", "BL_parent", "info_panel_holder", "primary_info_panel_holder", "info_panel_background", "CharacterInfoPopup", "nameplate_bg", "info_button_list", "button_general");

	local skills_button_is_square = true;

	if uic_skills_button then
		uic_skills_button:Highlight(true, skills_button_is_square, 0, true);

		local ap;

		cm:callback(
			function()
				-- Show a text pointer for the character details button the first time we reach this point
				core:call_once(
					process_name .. "_ap",
					function()
						ap = tut_show_ap(
							"character_details_button",
							"bottomleft",
							uic_skills_button,
							"ui_text_replacements_localised_text_phar_tutorial_character_details_button",
							0.5,
							0.1
						);
					end
				);
			end,
			1,
			process_name
		);

		core:add_listener(
			process_name,
			"PanelOpenedCampaign",
			function(context)
				return context.string == "character_details_panel";
			end,
			function()
				uic_skills_button:Highlight(false, skills_button_is_square);
				cm:remove_callback(process_name);
				progress_callback();
				tut.add.competency_titles_tab_highlight();
			end,
			false
		);
	else
		script_error("ERROR: tut.add.highlight_character_details_button() could not find character details button to highlight!");
		cm:end_objective_chain(process_name);
		tut_complete_active_intervention();
	end;
end;

function tut.add.chacter_panel_state_monitor(process_name)
	-- Listen for the character details panel being closed
	core:add_listener(
		"FTUE_character_panel_state_monitor",
		"PanelClosedCampaign",
		function(context)
			return context.string == "character_details_panel";
		end,
		function()
			core:remove_listener(process_name);
			unhighlight_component_table();
			tut.add.competency_points_highlight_character_details_button(process_name);
			tut.add.remove_character_tab_listeners();
		end,
		false
	);
end;

function tut.add.competency_titles_tab_highlight()
	
	local uic_character_titles_tab = find_uicomponent("character_details_panel", "tabs_holder", "titles_button");
	
	unhighlight_component_table();

	cm:callback(				-- adding a callback as there is a delay before state update
		function()
			if uic_character_titles_tab and not uic_character_titles_tab:CurrentState():find("selected") then
				uic_character_titles_tab:Highlight(true, true, 0, true);

				core:add_listener(
					"FTUE_character_titles_tab_selected",
					"ComponentLClickUp",
					function(context)
						return context.string == "titles_button";
					end,
					function()
						tut.add.competency_titles_tab_selected();
					end,
					false
				);
			else
				tut.add.competency_titles_tab_selected();
				return
			end;
		end,
		0.5
	);
end;

function tut.add.competency_titles_tab_selected()
	local uic_character_titles_tab = find_uicomponent("character_details_panel", "tabs_holder", "titles_button");
	
	if uic_character_titles_tab then
		uic_character_titles_tab:Highlight(false);
	end

	tut.add.character_development_focus_uic_highlight();

	core:add_listener(
		"FTUE_details_tab_selected",
		"ComponentLClickUp",
		function(context)
			return context.string == "button_template";
		end,
		function()
			tut.add.competency_titles_tab_highlight();
		end,
		false
	);
end;

function tut.add.character_development_focus_uic_highlight()
	local titles_button = core:get_ui_root():SequentialFind("character_details_panel", "titles_button");
	
	-- competencies container
	local uic_competencies_list = {
		core:get_ui_root():SequentialFind( "titles_panel", "competences_list", "authority_competence", "button_round_secondary_toggle"),
		core:get_ui_root():SequentialFind( "titles_panel", "competences_list", "governance_competence", "button_round_secondary_toggle"),
		core:get_ui_root():SequentialFind( "titles_panel", "competences_list", "zeal_competence", "button_round_secondary_toggle"),
	};

	-- titles container
	local uic_titles_list_box = core:get_ui_root():SequentialFind( "titles_panel", "unassigned_titles_holder", "list_clip","list_box");
	if uic_titles_list_box then
		uic_available_titles_list = {
			UIComponent(uic_titles_list_box:Find(0)),
			UIComponent(uic_titles_list_box:Find(1)),
		};
	end
	
	if titles_button then
		if character_competencies_selected and uic_available_titles_list then
			highlight_component_table(0, unpack(uic_available_titles_list));
		elseif character_titles_tab_seen and uic_competencies_list then
			highlight_component_table(0, unpack(uic_competencies_list));
		else
			return
		end
	end
end;

function tut.add.remove_character_tab_listeners()
	core:remove_listener("FTUE_details_tab_selected");
	core:remove_listener("FTUE_character_titles_tab_selected");
	core:remove_listener("FTUE_character_panel_state_monitor");
end;

-----------------------------------------------------------------------------------------------
--	Competency Points
-----------------------------------------------------------------------------------------------

local competency_points_advice_monitors_started = "tut_competency_points_advice_monitors_started";
local competency_points_advice_monitors_completed = "tut_competency_points_advice_monitors_completed";

local competency_points_process_name = "competency_points";
local competency_points_tab_pointer_process_name = competency_points_process_name .. "_tab_pointer";
local competency_points_tab_open_name = competency_points_process_name .. "_tab_open";
local competency_points_panel_closed_process_name = competency_points_process_name .. "_panel_closed";


-- Called when scripts are loaded, decides to start listeners if the game is in the correct state
function tut.add.start_competency_points_advice_listeners_on_load()
	local started = cm:get_saved_value(competency_points_advice_monitors_started);
	local completed = cm:get_saved_value(competency_points_advice_monitors_completed);
	if started and not completed then
		-- We are in the correct state to start the listeners
		tut.add.start_competency_points_advice_listeners_action();
	end;
end;


-- Called when it's time to start the advice listeners from a previous section of script. After this is called, these listeners will start when loading from a savegame.
function tut.add.start_competency_points_advice_listeners()
	local started = cm:get_saved_value(competency_points_advice_monitors_started);
	local completed = cm:get_saved_value(competency_points_advice_monitors_completed);
	if started or completed then
		return false;
	end;

	cm:set_saved_value(competency_points_advice_monitors_started, true);

	return true, tut.add.start_competency_points_advice_listeners_action();
end;


-- Actually start the listeners, either on-load or by other scripts at the appropriate time
function tut.add.start_competency_points_advice_listeners_action()

	-- Perform a one-time check to see if any characters in the player's faction have any unassigned skill points
	local faction = cm:get_faction(tut.player_faction_key);
	if faction then
		local mf_list = faction:military_force_list();

		for _, mf in model_pairs(mf_list) do
			if mf:has_general() then
				local char = mf:general_character();

				if char:unassigned_skill_points() > 0 then
					local char_cqi = char:command_queue_index();
					core:progress_on_loading_screen_dismissed(
						function()
							tut.add.start_competency_points_advice_for_character(char_cqi);
						end
					);
					
					return;
				end;
			end;
		end;
	end;

	-- No characters have unassigned skill points, so listen for them to become available
	local char_cqi = false;
	core:add_listener(
		"competency_points_advice",
		"CharacterSkillPointAvailable",
		function(context)
			local char = context:character();
			if char:faction():name() == tut.player_faction_key and cm:char_is_general_with_army(char) then
				char_cqi = char:command_queue_index();
				return true;
			end;
		end,
		function()
			--Enforce the advice to be for Ramesses
			local char = cm:get_character_by_fm_cqi(tut.player_faction_leader_fm_cqi)
			if char and not char:is_null_interface() then
				char_cqi = char:command_queue_index()
			end
			tut.add.start_competency_points_advice_for_character(char_cqi);
		end,
		false
	);
end;


function tut.add.start_competency_points_advice_for_character(char_cqi)
	cm:set_saved_value(competency_points_advice_monitors_completed, true);

	cm:trigger_transient_intervention(
		"tutorial_competency_points_advice",		-- name
		function(inv)
			tut.add.competency_points_select_character(char_cqi);
		end,										-- callback
		true,										-- debug output
		function(inv)
		end											-- config callback
	);
end;

function tut.add.competency_points_select_character(char_cqi)
	uim:override("hide_sidemenu"):lock()
	local sa = intro_campaign_select_advice:new(
		char_cqi,
		"phar_main_tutorial_competencies_01",							-- advice key
		"phar_tutorial_ramesses_army_select_obj_01",					-- objective key
		function()
			uim:override("selection_change"):lock();
			uim:override("technology"):lock();
			uim:override("diplomacy"):lock();
			uim:override("journal"):lock();

			cm:set_saved_value("unlock_character_details", true);
			uim:override("character_details"):unlock();

			cm:activate_objective_chain(competency_points_process_name, "phar_tutorial_ramesses_character_competences_01");

			tut.add.competency_points_highlight_character_details_button(competency_points_process_name);
		end
	);

	sa:set_selection_delay(3);										-- duration of camera scroll
	sa:set_proceed_immediately_if_character_selected(false);		-- make sure advice/infotext are always shown

	sa:start();
	
	local clear_timer = tut.INFO_TEXT_DURATION_S - 10
	cm:set_infotext_auto_clear_timer(clear_timer > 0 and clear_timer or 1)
end;


function tut.add.competency_points_show_character_details_panel_advice()
	core:call_once(
		competency_points_process_name .. "_panel_advice",
		function()
			cm:clear_infotext();
			cm:show_advice(
				"phar_main_tutorial_competencies_02", 
				false,
				false,
				function()
					cm:hide_advisor_without_infotexts()
				end,
				tut.ADVICE_DURATION_S
			);
			cm:add_infotext(
				"phar_tutorial_camp_ramesses_competencies_info_00",
				"phar_tutorial_camp_ramesses_competencies_info_01"
			)
		end
	);
end;

function tut.add.competency_points_character_details_panel_opened()

	cm:update_objective_chain(competency_points_process_name, "phar_tutorial_ramesses_character_competences_02");

	tut.add.chacter_panel_state_monitor(competency_points_process_name)

	-- Show advice first time round
	cm:callback(
		function()
			tut.add.competency_points_show_character_details_panel_advice();
		end,
		1,
		competency_points_process_name
	);

	local ap;
	local uic_titles_button;

	local titles_button = core:get_ui_root():SequentialFind("character_details_panel", "titles_button")

	if titles_button and titles_button:CurrentState():find("selected") then
		tut.add.competency_points_character_details_titles_tab_opened();
		character_titles_tab_seen = true
	else
		-- Listen for the Titles tab being selected
		core:add_listener(
			competency_points_process_name,
			"ComponentLClickUp",
			function(context)
				return context.string == "titles_button";
			end,
			function()
				if ap then
					ap:hide();
				end;

				cm:remove_callback(competency_points_tab_pointer_process_name);
				tut.add.competency_points_character_details_titles_tab_opened();
				character_titles_tab_seen = true
			end,
			false
		);
	end
end;

local num_unallocated_competence_points = false;

function tut.add.competency_points_character_details_titles_tab_opened()

	local selected_char_cqi = uim:get_char_selected_cqi()
	local is_first_time_open = not num_unallocated_competence_points

	tut.add.chacter_panel_state_monitor(competency_points_process_name)

	-- Work out how many competence points are unallocated
	if not num_unallocated_competence_points then
		if selected_char_cqi then
			local character = cm:get_character_by_cqi(selected_char_cqi);
			if character then
				num_unallocated_competence_points = character:unassigned_skill_points();
				if num_unallocated_competence_points == 0 then
					script_error("WARNING: competency_points_character_details_titles_tab_opened() but selected character with cqi [" .. selected_char_cqi .. "] has no unallocated skill points - how can this be?");
				end;
			else
				script_error("WARNING: competency_points_character_details_titles_tab_opened() could not find selected character with cqi [" .. selected_char_cqi .. "] - how can this be?");
			end;
		else
			script_error("WARNING: competency_points_character_details_titles_tab_opened() could not find selected character - how can this be?");
		end;
	end;

	-- Guard against proceeding with an invalid number of unallocated competence points
	if not num_unallocated_competence_points or num_unallocated_competence_points == 0 then
		tut.add.competency_points_character_details_competences_completed();
		return;
	end;

	local ap;
	
	-- Show competences list text pointer the first time round
	cm:callback(
		function()
			core:call_once(
				competency_points_process_name .. "_competences_list",
				function()
					tut.add.character_development_focus_uic_highlight();
					ap = tut_show_ap(
						"competences_list",
						"topright",
						{"character_details_panel", "hero_info", "sidepanel_info_traits", "titles_panel" , "competences_list"},
						"ui_text_replacements_localised_text_phar_tutorial_competences_list",
						0.95,
						0.95
					);
				end
			);
		end,
		1,
		competency_points_process_name
	);

	-- Ensure advice is displayed by this point
	tut.add.competency_points_show_character_details_panel_advice();

	-- Add additional infotext the first time only
	if is_first_time_open then
		cm:add_infotext(
			"phar_tutorial_camp_ramesses_competencies_info_02"
		);
	end

	-- Update Objective
	local skill_points_left = cm:get_character_by_cqi(uim:get_char_selected_cqi()):unassigned_skill_points()
	cm:update_objective_chain(competency_points_process_name, "phar_tutorial_ramesses_character_competences_03", num_unallocated_competence_points - skill_points_left, num_unallocated_competence_points);

	-- Listen for points being spent
	core:add_listener(
		competency_points_process_name,
		"CharacterSkillPointAllocated",
		function(context)
			if context:character():command_queue_index() == selected_char_cqi then
				-- Close the active pointer if it's still open
				if ap then
					ap:hide();
					ap = nil;
				end;

				local current_unallocated_points = context:character():unassigned_skill_points();
				cm:update_objective_chain(competency_points_process_name, "phar_tutorial_ramesses_character_competences_03", num_unallocated_competence_points - current_unallocated_points, num_unallocated_competence_points);

				unhighlight_component_table();

				return current_unallocated_points == 0;
			end;
		end,
		function()
			local character_panel_close_button = core:get_ui_root():SequentialFind("character_details_panel", "header", "button_ok")
			cm:steal_escape_key(true)
			if character_panel_close_button then
				character_panel_close_button:SetDisabled(true)
				
			end
			
			tut.add.competency_points_character_details_competences_completed();

			core:remove_listener(competency_points_process_name);
			core:remove_listener("FTUE_character_panel_state_monitor");
			character_competencies_selected = true
		end,
		false
	);

end;


function tut.add.competency_points_character_details_competences_completed()

	cm:complete_objective("phar_tutorial_ramesses_character_competences_03");

	cm:callback(
		function()
			-- if 
			tut.add.titles_add_title();
		end,
		1
	);

	cm:callback(
		function()
			cm:end_objective_chain(competency_points_process_name);
		end,
		tut.OBJECTIVE_REMOVE_DELAY
	);
end;



-----------------------------------------------------------------------------------------------
--	Titles
-----------------------------------------------------------------------------------------------

local titles_process_name = "titles";
local titles_process_name_advice = titles_process_name .. "_advice";
local titles_process_name_panel_closed = titles_process_name .. "_panel_closed";
local titles_process_name_tab_changed = titles_process_name .. "_tab_changed";

-- TODO: handle player navigating around character details panel, and potentially closing it, or find a way to prevent this
-- TODO: prevent the player from assigning a title before now

local objective_set = false;
local objective_completed = false;
local player_has_available_titles = false

function tut.add.titles_add_title()

	tut.add.chacter_panel_state_monitor(titles_process_name)

	core:call_once(
		titles_process_name_advice,
		function()
	cm:clear_infotext();
	cm:show_advice(
		"phar_main_tutorial_v2_competency_3_pract",
		false,
		false,
		function()
			cm:hide_advisor_without_infotexts()
		end,
		tut.ADVICE_DURATION_S
	);

	local character_panel_close_button = core:get_ui_root():SequentialFind("character_details_panel", "header", "button_ok")
	cm:steal_escape_key(false)
	if character_panel_close_button then
		character_panel_close_button:SetDisabled(false)
	end

	cm:add_infotext_with_leader(
		"phar_tutorial_camp_titles_01",
		"phar_tutorial_camp_ramesses_titles_info_01",
		function()
			if not objective_completed then
				objective_set = true;
				cm:set_objective("phar_tutorial_ramesses_claim_title_01");
			end;
		end
	);
		end
	);

	local ap;
	
	-- Show titles text pointer the first time round
	cm:callback(
		function()
			core:call_once(
				titles_process_name .. "_titles",
				function()
					tut.add.character_development_focus_uic_highlight();
					ap = tut_show_ap(
						"titles_list",
						"bottomright",
						{"character_details_panel", "hero_info", "sidepanel_info_traits", "titles_panel" , "unassigned_titles_holder"},
						"ui_text_replacements_localised_text_phar_tutorial_titles_list",
						0.1,
						0
					);
				end
			);
		end,
		1,
		titles_process_name
	);

	
	local titles_list = core:get_ui_root():SequentialFind("character_details_panel", "unassigned_titles_list_view", "list_box")
	if titles_list then
		for i = 0, titles_list:ChildCount() - 1 do
			local uic_child = UIComponent(titles_list:Find(i));
			if uic_child:CurrentState() == "available" then
				player_has_available_titles = true
				break
			end
		end
	end

	local success_callback = function()
		if ap then
			ap:hide();
			ap = nil;
		end;

		objective_completed = true;

		if objective_set then
			cm:complete_objective("phar_tutorial_ramesses_claim_title_01");

			cm:callback(
				function()
					cm:remove_objective("phar_tutorial_ramesses_claim_title_01");
				end,
				tut.OBJECTIVE_REMOVE_DELAY
			);
		end;

		tut.add.title_claimed();
		tut.add.remove_character_tab_listeners()
	end

	if player_has_available_titles then
		-- Listen for title being claimed
		core:add_listener(
			titles_process_name,
			"CharacterAncillaryGained",
			function(context)
				local anc_category = context:ancillary_object():category();
				return anc_category == "title";
			end,
			success_callback,
			false
		);
	else
		cm:callback(success_callback, 5)
	end

end;


function tut.add.title_claimed()	
	cm:remove_callback(titles_process_name);
	unhighlight_component_table();
	cm:callback(
		function()
			tut_complete_active_intervention();

			uim:override("selection_change"):unlock();
			uim:override("technology"):unlock();
			uim:override("diplomacy"):unlock();
			uim:override("journal"):unlock();
		end,
		1
	);

	tut.add.prepare_seaborne_assault_countdown();
	tut.add.start_local_deities_advice_listeners();
	tut.add.start_local_deities_advice_countdown();
											
	local uic_close_panel_button = find_uicomponent(core:get_ui_root(), "character_details_panel", "btns_container", "button_ok");
	cm:callback(
		function()
	if uic_close_panel_button then
		uic_close_panel_button:Highlight(true, false, 0, true);
	end
		end,
		1,
		"FTUE_character_development_planel_close"
	)

	
	core:add_listener(
		"FTUE_character_details_panel_closed",
		"PanelClosedCampaign",
		function(context)
			return context.string == "character_details_panel";
		end,
		function()
			cm:dismiss_advice();
			cm:remove_callback("FTUE_character_development_planel_close")
			if uic_close_panel_button then
				uic_close_panel_button:Highlight(false);
			end
			
			-- To do: add a system of this warning appearing on load
			uim:suppress_end_turn_warning("phar_unequipped_ancillaries", false)
			uim:suppress_end_turn_warning("character upgrade available", false)
			uim:override("hide_sidemenu"):unlock()

			cm:save();
			tut.add.issue_ambitions_choice()
		end,
		false
	);
end;





-----------------------------------------------------------------------------------------------
--	Seaborne Assault
-----------------------------------------------------------------------------------------------


-- Start a turn countdown to the seaborne assault being spawned - it is spawned on the player's turn, as the Sukkot faction may be dead so the FactionTurnStart event isn't reliably triggered for them
function tut.add.prepare_seaborne_assault_countdown()
	tut_block_skipping_sukhot_faction_turns(true);
	cm:add_turn_countdown_event(tut.player_faction_key, 1, "ScriptEventPrepareSeaborneAssault");
end;


function tut.add.start_seaborne_assault_listeners_on_load()

	-- Listen for the signal to prepare the Seaborne Assault - this now comes on the players turn. We spawn the assault force and then set up a countdown to fire on the Sukkot faction's turn
	core:add_listener(
		"tut_prepare_seaborne_assault",
		"ScriptEventPrepareSeaborneAssault",
		true,
		function()
			tut.add.spawn_seaborne_assault();
			tut.add.start_seaborne_assault_countdown();
		end,
		false
	);

	-- Listen for the signal to start the Seaborne Assault, which comes on the first Sukkot faction turn after the invasion force is spawned
	core:add_listener(
		"tut_start_seaborne_assault",
		"ScriptEventStartSeaborneAssault",
		true,
		function()
			-- If we're in the normal turn phase (we're probably not) then wait for it before trying to move, otherwise the move order itself would have to wait and we wouldn't get good information back from it as to whether it has succeeded or not
			if cm:model():world():is_turn_phase_normal() then
				tut.add.prepare_to_move_seaborne_assault_force();
			else
				core:add_listener(
					"prepare_to_move_seaborne_assault_force",
					"FactionBeginTurnPhaseNormal",
					function(context)
						return context:faction():name() == tut.sukhot_faction_key;
					end,
					function()
						tut.add.prepare_to_move_seaborne_assault_force();
					end,
					false
				);
			end;
		end,
		false
	);
end;


-- Start a 0-turn countdown to commence the Seaborne Assault - this will trigger the next time the Sukhot faction starts a turn
function tut.add.start_seaborne_assault_countdown()
	cm:add_turn_countdown_event(tut.sukhot_faction_key, 0, "ScriptEventStartSeaborneAssault");
end;


function tut.add.spawn_seaborne_assault()

	local fm_saved_value_key = "sukkot_hero_2_fm_cqi";
	local spawn_data = {
		faction_key = tut.sukhot_faction_key,
		units = "phar_main_nat_wes_libu_desert_runners,phar_main_nat_wes_libu_desert_swords,phar_main_nat_wes_libu_tribe_spears,phar_main_nat_wes_libu_tribesmen",
		pos_x = 673,
		pos_y = 1015,
		home_region_key = "phar_main_north_sinai_azzati",
		success_callback = function(char_cqi)
			cm:set_saved_value("seaborne_assault_char_cqi", char_cqi)
		end
	};
	
	local force_created = false;

	-- Check that we can look up a family member from fm_saved_value_key, but that it's not attached to a character that's alive
	local fm_cqi = cm:get_saved_value(fm_saved_value_key);
	if fm_cqi then
		local fm = cm:get_family_member_by_cqi(fm_cqi);
		if fm then
			if not fm:is_alive() then
				local faction = cm:get_faction(spawn_data.faction_key);
				if faction then
					if cm:respawn_character_to_pool_from_family_member(faction, fm) then
						force_created = cm:create_force_from_family_member(
							fm_cqi,
							spawn_data.faction_key,
							spawn_data.units,
							spawn_data.home_region_key,
							spawn_data.pos_x,
							spawn_data.pos_y,
							spawn_data.success_callback
						);
					else
						script_error("ERROR: tut.add.spawn_seaborne_assault() is trying to spawn character but command to respawn the character in the recruitment pool failed - how can this be?");
					end;
				else
					script_error("ERROR: tut.add.spawn_seaborne_assault() is trying to spawn character but the faction related to key [" .. spawn_data.faction_key .. "] does not exist - is it dead?");
				end;
			else
				script_error("ERROR: tut.add.spawn_seaborne_assault() found a character related to fm cqi [" .. fm_cqi .. "] that's already alive");
			end;
		else
			script_error("ERROR: tut.add.spawn_seaborne_assault() could not find a family member object related to fm cqi [" .. fm_cqi .. "]");
		end;
	else
		script_error("ERROR: tut.add.spawn_seaborne_assault() could not find a [" .. fm_saved_value_key .. "] family member cqi value in savegame");
	end;

	-- If a force with the named general was not created then create a stand-in now
	if not force_created then
		cm:create_force(
			spawn_data.faction_key,
			spawn_data.units,
			spawn_data.home_region_key,
			spawn_data.pos_x,
			spawn_data.pos_y,
			false,
			spawn_data.success_callback
		);
	end;

	cm:force_declare_war(
		tut.player_faction_key,
		tut.sukhot_faction_key,
		false,
		false,
		true
	)
end;


function tut.add.seaborne_assault_enable_ai_army_movement(enable)
	if enable then
		cm:cai_enable_movement_for_faction(tut.sukhot_faction_key);
	else
		cm:cai_disable_movement_for_faction(tut.sukhot_faction_key);
	end;
end;


function tut.add.prepare_to_move_seaborne_assault_force()

	local char_cqi = cm:get_saved_value("seaborne_assault_char_cqi");

	local char = cm:get_character_by_cqi(char_cqi);
	if not char then
		script_error("ERROR: tut.add.move_seaborne_assault_force() failed to find character with cqi [" .. char_cqi .. "] to move force that was just created - how can this be?");
		return;
	end;

	cm:disable_end_turn(true);

	-- Prevent the AI from trying to move its forces while we are doing so
	tut.add.seaborne_assault_enable_ai_army_movement(false);

	local landing_coordinates = {
		{x = 651, y = 948},
		{x = 647, y = 949},
		{x = 666, y = 952},
		{x = 641, y = 949},
		{x = 669, y = 953},
		{x = 633, y = 950},
		{x = 675, y = 955}
	};

	-- Disable warnings for failed calls to move_to
	cm:enable_locomotion_failed_warning(false);

	tut.add.move_seaborne_assault_force(char_cqi, landing_coordinates, 1)
end;


function tut.add.move_seaborne_assault_force(char_cqi, landing_coordinates, index_to_try)

	local x = landing_coordinates[index_to_try].x;
	local y = landing_coordinates[index_to_try].y;

	out("tut.add.move_seaborne_assault_force() is trying to move seaborne invasion force with char cqi [" .. char_cqi .. "] to [" .. x .. ", " .. y .. "]");

	cm:move_character(
		char_cqi,
		x,
		y,
		true,					-- allow AP replenishment
		true,					-- allow movement afterwards
		function()				-- success callback
			tut.add.seaborne_assault_force_moved(char_cqi)
		end,
		function()				-- failure callback
			if index_to_try < #landing_coordinates then
				-- Try again with the next set of landing co-ordinates
				index_to_try = index_to_try + 1;
				tut.add.move_seaborne_assault_force(char_cqi, landing_coordinates, index_to_try);
			else
			script_error("ERROR: tut.add.move_seaborne_assault_force() failed to move character to destination");
			tut.add.seaborne_assault_force_moved(char_cqi)
			end;
		end
	);
end;


function tut.add.seaborne_assault_force_moved(char_cqi)

	-- Re-enable warnings for failed calls to move_to and other locomotion orders
	cm:enable_locomotion_failed_warning(true);

	cm:add_faction_turn_start_listener_by_name(
		"tut_seaborne_assault_force",
		tut.player_faction_key,
		function()
			-- Allow the AI to move its forces again
			tut.add.seaborne_assault_enable_ai_army_movement(true);

			tut.add.seaborne_assault_player_faction_turn_start_after_force_moved(char_cqi)
		end,
		false
	);

	cm:disable_end_turn(false);

	cm:end_turn();
end;


function tut.add.seaborne_assault_player_faction_turn_start_after_force_moved(char_cqi)
	
	CampaignUI.ClearSelection();

	cm:trigger_transient_intervention(
		"tutorial_seaborne_assault",				-- name
		function(inv)
			tut.add.seaborne_assault_show_attacker(char_cqi)
		end,										-- callback
		true,										-- debug output
		function(inv)
		end											-- config callback
	);
end;


function tut.add.seaborne_assault_show_attacker(char_cqi)
	--Kill off all Azati forces so they don't murder you if you march
	local sukhot = cm:get_faction(tut.sukhot_faction_key)
	local sukhot_characters = sukhot:character_list()
	if sukhot_characters then
		for i = 0, sukhot_characters:num_items() - 1 do
			local sukhot_character = sukhot_characters:item_at(i)
			if sukhot_character and sukhot_character:has_region() and sukhot_character:region():name() == tut.azzati 
					and not (sukhot_character:has_garrison_residence() and sukhot_character:command_queue_index() == sukhot_character:garrison_residence():garrison_army():general_character():command_queue_index()) then
				local sukhot_character_lookup_str = cm:char_lookup_str(sukhot_character)
				cm:kill_character_and_commanded_unit(sukhot_character_lookup_str, true)
			end
		end
	end

	local scroll_duration = 3;
	cm:scroll_camera_to_character(char_cqi, scroll_duration);

	cm:callback(
		function()
			-- force selection of enemy character
			CampaignUI.SelectObject(char_cqi, "character", false);
		end,
		scroll_duration
	);

	local conv_resources = campaign_conversation:new(
		"seaborne_assault",
		function()
			cm:callback(
				function()
					tut.add.seaborne_assault_issue_ambition(char_cqi);
				end,
				1
			);
		end
	);

	conv_resources:set_proceed_on_advice_finished(true);

	conv_resources:add_advice("phar_main_tutorial_seaborne_assault_01");
	conv_resources:add_advice("phar_main_tutorial_seaborne_assault_02_ram");

	conv_resources:start();
end;


function tut.add.seaborne_assault_issue_ambition(char_cqi)

	local char = cm:get_character_by_cqi(char_cqi);
	if not char or not char:has_military_force() then
		script_error("ERROR: tut.add.seaborne_assault_issue_ambition() could not find a character with cqi [" .. tostring(char_cqi) .. "], or that character has no military force - how can this be?");
		tut.add.start_stances_scroll_to_player_general();
	end;

	local mf_cqi = char:military_force():command_queue_index();

	local ambition_key = "phar_tutorial_ambition_defeat_seaborne_assault";

	-- Inject the objective to defeat a particular military force, now that we know its cqi
	ambitions.inject_objective(
		"tutorial_pool",
		ambition_key,
		ambitions.helper.objective.defeat_a_particular_army(mf_cqi)
	);

	-- Listen for the events panel being opened, and then closed
	core:add_listener(
		"seaborne_assault_issue_ambition",
		"PanelOpenedCampaign",
		function(context)
			return context.string == "ambitions"
		end,
		function()
			cm:progress_on_fullscreen_panel_dismissed(
				function()
					tut.add.start_stances_scroll_to_player_general();
				end,
				1
			);
		end,
		false
	);

	ambitions.generate_specific_ambitions(tut.player_faction_key, {ambition_key});	
end;

	











-----------------------------------------------------------------------------------------------
--	Stances Advice
-----------------------------------------------------------------------------------------------


function tut.add.start_stances_scroll_to_player_general()

	CampaignUI.ClearSelection();

	cm:set_saved_value("unlock_stances", true);
	uim:override("stances"):unlock();

	cm:callback(
		function()
			cm:clear_infotext();
			cm:show_advice(
				"phar_main_tutorial_stances_01",
				false,
				false,
				function()
					cm:hide_advisor_without_infotexts()
				end,
				tut.ADVICE_DURATION_S
			);
			cm:add_infotext_with_leader(
				"phar_tutorial_camp_ramesses_campaign_stances_info_00",
				"phar_tutorial_camp_ramesses_campaign_stances_info_01",
				"phar_tutorial_camp_ramesses_campaign_stances_info_02"
			);
		end,
		0.5
	);

	local char = cm:get_character_by_fm_cqi(tut.player_faction_leader_fm_cqi);
	if char and char:has_military_force() then
		local char_cqi = char:command_queue_index();
		
		cm:scroll_camera_with_cutscene_to_character(
			3, 
			function()
				-- force selection of player character
				CampaignUI.SelectObject(char_cqi, "character", false);

				tut.add.highlight_stances();
			end,
			char_cqi
		);

		return;
	end;

	-- Only get here if we weren't able to scroll to character
	tut.add.highlight_stances();
end;


function tut.add.highlight_stances()
	--Just in case the function gets called multiple times
	core:remove_listener("FTUE_character_deselected")

	cm:modify_advice(true);

	cm:callback(
		function()
			local ap = tut_show_ap(
				"stances_rollout",
				"bottomleft",
				{
					"hud_campaign",
					"BL_parent",
					"info_panel_holder",
					"primary_info_panel_holder",
					"info_panel_background",
					"CharacterInfoPopup",
					"character_content",
					"nameplate_bg",
					"btns_container",
					"stance_button_stacks"
				},
				"ui_text_replacements_localised_text_phar_tutorial_stances_rollout",
				0.5,
				0.1
			);

			ap:set_highlight_close_button(2);

			ap:set_close_button_callback(
				function()
					tut.add.stances_advice_end()
				end,
				1
			);
		end,
		1
	);

	core:add_listener(
		"FTUE_character_deselected",
		"CharacterDeselected",
		true,
		function()
			cm:callback(
				function()
					local ramesses = cm:get_character_by_fm_cqi(tut.player_faction_leader_fm_cqi);
					uim:highlight_character_for_selection(
						ramesses,
						function()
							tut.add.highlight_stances()
						end
					)
				end,
				0.5
			)
		end,
		false
	);
end;


function tut.add.stances_advice_end()
	core:remove_listener("FTUE_character_deselected")
	tut_complete_active_intervention();

	tut.add.start_local_deities_advice_listeners();
	tut.add.start_local_deities_advice_countdown();
end;


















-----------------------------------------------------------------------------------------------
--	Local Deities
-----------------------------------------------------------------------------------------------

local local_deities_advice_monitors_started = "tut_local_deities_advice_monitors_started";
local local_deities_advice_monitors_completed = "tut_local_deities_advice_monitors_completed";

local local_deities_process_name = "local_deities";
local local_deities_region_transfer_process_name = local_deities_process_name .. "_region_transfer";
local local_deities_panel_closed_process_name = local_deities_process_name .. "_panel_closed";
local local_deities_confirmation_dialog_process_name = local_deities_process_name .. "_confirmation";

local local_deities_qes_region_key = "phar_main_heliopolis_qes";
local local_deities_iunu_region_key = "phar_main_heliopolis_heliopolis";


-- Called when scripts are loaded, decides to start listeners if the game is in the correct state
function tut.add.start_local_deities_advice_listeners_on_load()
	local started = cm:get_saved_value(local_deities_advice_monitors_started);
	local completed = cm:get_saved_value(local_deities_advice_monitors_completed);
	if started and not completed then
		-- We are in the correct state to start the listeners
		tut.add.start_local_deities_advice_listeners_action();
	end;
end;


-- Called when it's time to start the advice listeners from a previous section of script. After this is called, these listeners will start when loading from a savegame.
function tut.add.start_local_deities_advice_listeners()
	local started = cm:get_saved_value(local_deities_advice_monitors_started);
	local completed = cm:get_saved_value(local_deities_advice_monitors_completed);
	if started or completed then
		return false;
	end;

	cm:set_saved_value(local_deities_advice_monitors_started, true);

	return true, tut.add.start_local_deities_advice_listeners_action();
end;


-- Start a turn countdown to the local deities advice being issued
function tut.add.start_local_deities_advice_countdown()
	cm:add_turn_countdown_event(tut.player_faction_key, 1, "ScriptEventStartLocalDeitiesAdvice");
end;


-- Actually start the listeners, either on-load or by other scripts at the appropriate time
function tut.add.start_local_deities_advice_listeners_action()

	local turn_threshold = 18;

	-- Listen for the player faction starting turn 18
	cm:add_faction_turn_start_listener_by_name(
		local_deities_process_name,
		tut.player_faction_key,
		function()
			if cm:turn_number() >= turn_threshold then
				tut.add.start_local_deities_intervention();
			end;
		end,
		true
	);

	-- Listen for turn countdown being completed
	core:add_listener(
		local_deities_process_name,
		"ScriptEventStartLocalDeitiesAdvice",
		true,
		function()
			tut.add.start_local_deities_intervention();
		end,
		false
	);
end;


-- Begin to issue the advice. We do this by triggering a transient intervention
function tut.add.start_local_deities_intervention()
	cm:clear_infotext()
	cm:remove_faction_turn_start_listener_by_name(local_deities_process_name);
	core:remove_listener(local_deities_process_name);

	cm:set_saved_value(local_deities_advice_monitors_completed, true);

	cm:trigger_transient_intervention(
		"tutorial_local_deities_advice",				-- name
		function(inv)
			tut.add.start_local_deities_cutscene()
		end,										-- callback
		true,										-- debug output
		function(inv)
		end											-- config callback
	);
end;


function tut.add.transfer_sacred_egyptian_lands_to_player()
	core:call_once(
		local_deities_region_transfer_process_name,
		function()
			cm:transfer_region_to_faction(local_deities_qes_region_key, tut.player_faction_key);
			cm:transfer_region_to_faction(local_deities_iunu_region_key, tut.player_faction_key);
		end
	);
end;
	


-- Actually issue the advice within the intervention
function tut.add.start_local_deities_cutscene()

	-- Switch to this constructor when a cindyscene has been made
	--[[
	local cutscene_local_deities = campaign_cutscene:new_from_cindyscene(
		"local_deities",
		function()
			
		end,
		"cindy_scene_path_here"
	);
	]]

	-- script_error("INFO: Local Deities cutscene unfinished");
	cm:set_camera_position(392.066071, 728.405762, 10.702136, -0.759747, 4.818614)

	local cutscene_local_deities = campaign_cutscene:new(
		"local_deities",
		45,
		function()
			cm:callback(
				function()
					cm:make_region_visible_in_shroud(tut.player_faction_key, local_deities_iunu_region_key)
					cm:make_region_visible_in_shroud(tut.player_faction_key, "phar_main_buto_paiuenamun")
					cm:make_region_visible_in_shroud(tut.player_faction_key, "phar_main_buto_sais")
					cm:make_region_visible_in_shroud(tut.player_faction_key, "phar_main_buto_buto")

					tut.add.transfer_sacred_egyptian_lands_to_player();
					tut.add.local_deities_advice_show_region_transfer_message();
				end,
				1
			);
		end
	);

	cutscene_local_deities:set_disable_settlement_labels(false);

	
	cutscene_local_deities:action(
		function()
			cm:show_advice("phar_main_tutorial_local_deities_01_mern");
		end,
		1
	);

	cutscene_local_deities:action(
		function()
			cutscene_local_deities:wait_for_advisor();
		end,
		5.5
	);

	cutscene_local_deities:action(
		function()
			cm:show_advice("phar_main_tutorial_local_deities_02_ram");
		end,
		6.5
	);

	cutscene_local_deities:action(
		function()
			cutscene_local_deities:wait_for_advisor();
		end,
		10.5
	);

	cutscene_local_deities:action(
		function()
			cm:show_advice("phar_main_tutorial_local_deities_03_mern");
		end,
		11.5
	);

	cutscene_local_deities:action(
		function()
			cutscene_local_deities:wait_for_advisor();
		end,
		16
	);

	cutscene_local_deities:action(
		function()
			cm:show_advice("phar_main_tutorial_local_deities_04_mern");

			cm:scroll_camera_to_settlement(local_deities_iunu_region_key, 3);
		end,
		17
	);

	cutscene_local_deities:action(
		function()
			tut.add.transfer_sacred_egyptian_lands_to_player();
		end,
		21
	);

	cutscene_local_deities:action(
		function()
			cutscene_local_deities:wait_for_advisor();
		end,
		27
	);

	cutscene_local_deities:action(
		function()
			cm:show_advice("phar_main_tutorial_local_deities_05_mern");
		end,
		28
	);

	cutscene_local_deities:action(
		function()
			cutscene_local_deities:wait_for_advisor();
		end,
		36
	);

	cutscene_local_deities:action(
		function()
			cm:show_advice("phar_main_tutorial_local_deities_06_mern");
		end,
		37
	);

	cutscene_local_deities:action(
		function()
			cutscene_local_deities:wait_for_advisor();
		end,
		44
	);

	cutscene_local_deities:start();
end;

function tut.add.local_deities_advice_show_region_transfer_message()
	cm:show_message_event(
		tut.player_faction_key,
		"event_feed_strings_text_phar_tutorial_message_sacred_egyptian_lands_transfer_title",			-- title key
		"event_feed_strings_text_phar_tutorial_message_sacred_egyptian_lands_transfer_primary",			-- primary text key
		"event_feed_strings_text_phar_tutorial_message_sacred_egyptian_lands_transfer_secondary",		-- secondary text key
		true,																							-- persistent
		2140,																							-- event pic index
		function()
			tut.add.start_local_deities_advice(true)
		end,																							-- progress callback
		0.5																								-- progress callback delay
	);
end;


function tut.add.start_local_deities_advice(first_time)

	local uic_local_deities = find_uicomponent("hud_campaign", "faction_widget_holder", "faction_widget", "faction_widget_list", "main_buttons_container", "button_local_deities");
	local ap;

	if first_time then
		cm:clear_infotext();
		cm:show_advice(
			"phar_main_tutorial_local_deities_07",
			true,
			false,
			function()
				cm:hide_advisor_without_infotexts()
			end,
			tut.ADVICE_DURATION_S
		);

		cm:add_infotext_with_leader(
			"phar_tutorial_camp_ramesses_local_deities_info_00",
			"phar_tutorial_camp_ramesses_local_deities_info_01",
			"phar_tutorial_camp_ramesses_local_deities_info_02",
			function()
				cm:set_saved_value("unlock_local_deities", true);
				uim:override("hide_local_deities"):unlock();

				cm:activate_objective_chain(local_deities_process_name, "phar_tutorial_ramesses_local_deities_01");

				if uic_local_deities then
					uic_local_deities:Highlight(true, false, 0, true);
				end;
			end
		);
	else
		cm:update_objective_chain(local_deities_process_name, "phar_tutorial_ramesses_local_deities_01");
	end;

	core:add_listener(
		local_deities_process_name,
		"PanelOpenedCampaign",
		function(context)
			return context.string == "local_deities";
		end,
		function()
			if ap then
				ap:hide();
				ap = nil;
			end;

			if uic_local_deities then
				uic_local_deities:Highlight(false);
			end;

			tut.add.local_deities_panel_opened();
		end,
		false
	);
end;


function tut.add.local_deities_panel_opened()
	local claimed_akhenaten = ancient_legacy_common:faction_has_claimed_legacy(tut.player_faction_key, "phar_ancient_legacy_akhenaten")
	if claimed_akhenaten then
		tut.add.local_deities_worship_started()
		return
	end

	local local_deities_plus = find_uicomponent("local_deities", "worshipped_all_gods_panel", "worshipped_gods_holder", "worshipped_gods", "god_slot1", "god_portrait", "available_btn")
	local_deities_plus:Highlight(true, true, 0, true)

	cm:update_objective_chain(local_deities_process_name, "phar_tutorial_ramesses_local_deities_02");

	core:call_once(
		local_deities_process_name .. "_panel",
		function()
			cm:show_advice(
				"phar_main_tutorial_local_deities_08",
				true,
				false,
				function()
					cm:hide_advisor_without_infotexts()
				end,
				tut.ADVICE_DURATION_S
			);
			
			cm:add_infotext(
				"phar_tutorial_camp_ramesses_local_deities_info_03"
			);

			core:add_listener(
				local_deities_panel_closed_process_name,
				"PanelClosedCampaign",
				function(context)
					return context.string == "local_deities";
				end,
				function()
					core:remove_listener(local_deities_process_name);
					tut.add.start_local_deities_advice(false);
				end,
				false
			);
		end
	);
	
	core:add_listener(
		local_deities_process_name .. "_slot",
		"ComponentLClickUp",
		function(context)
			return context.string == "available_btn" and uicomponent_descended_from(UIComponent(context.component), "local_deities");
		end,
		function(context)
			cm:add_infotext(
				"phar_tutorial_camp_ramesses_local_deities_info_04"
			);
		end,
		false
	)

	core:add_listener(
		local_deities_process_name,
		"ComponentLClickUp",
		function(context)
			return uicomponent_descended_from(UIComponent(context.component), "gods_list")
			--return string.find(context.string, "god_instance");
		end,
		function(context)
			tut.add.local_deities_instance_selected()	
			core:remove_listener(local_deities_process_name .. "_slot")
		end,
		false
	);

end;



function tut.add.local_deities_instance_selected()
	local worship_button = find_uicomponent("local_deities", "selected_god_template", "left_side_holder", "effects_button_holder", "flavour_btn_holder", "worship_button")
	worship_button:Highlight(true, true, 0, true)

	cm:update_objective_chain(local_deities_process_name, "phar_tutorial_ramesses_local_deities_03");

	core:call_once(
		local_deities_process_name .. "_instance_select",
		function()
			cm:dismiss_advice();
			cm:callback(
				function()
					cm:show_advice(
						"phar_main_tutorial_local_deities_09",
						true,
						false,
						function()
							cm:hide_advisor_without_infotexts()
						end,
						tut.ADVICE_DURATION_S
					);
					cm:add_infotext(
						"phar_tutorial_camp_ramesses_local_deities_info_20",
						"phar_tutorial_camp_ramesses_local_deities_info_21",
						"phar_tutorial_camp_ramesses_local_deities_info_23"
					);
				end,
				0.5
			);
		end
	);

	-- TODO: Make steps safe for navigating out of order
	-- Listen for either the back button or the Worship button being clicked
	-- core:add_listener(
	-- 	local_deities_process_name,
	-- 	"ComponentLClickUp",
	-- 	function(context)
	-- 		return context.string == "button_back" and uicomponent_descended_from(UIComponent(context.component), "local_deities");
	-- 	end,
	-- 	function(context)
	-- 		core:remove_listener(local_deities_process_name);
	-- 		tut.add.local_deities_panel_opened()
	-- 	end,
	-- 	true
	-- )
	
	core:add_listener(
		local_deities_process_name,
		"ComponentLClickUp",
		function(context)
			return context.string == "worship_button" and uicomponent_descended_from(UIComponent(context.component), "local_deities");
		end,
		function(context)
			local worship_button = find_uicomponent("local_deities", "selected_god_template", "left_side_holder", "effects_button_holder", "flavour_btn_holder", "worship_button")
			worship_button:Highlight(false, false)
			tut.add.local_deities_listen_for_worship_confirmation();
		end,
		true
	)
end;


function tut.add.local_deities_listen_for_worship_confirmation()

	core:add_listener(
		local_deities_confirmation_dialog_process_name,
		"ComponentLClickUp",
		function(context)
			local is_button_cancel = context.string == "button_cancel";
			local is_descended = uicomponent_descended_from(UIComponent(context.component), "worship_dialogue_box_id");
			return context.string == "button_cancel" and uicomponent_descended_from(UIComponent(context.component), "worship_dialogue_box_id");
		end,
		function(context)
			core:remove_listener(local_deities_confirmation_dialog_process_name);
		end,
		false
	);
	
	core:add_listener(
		local_deities_confirmation_dialog_process_name,
		"ComponentLClickUp",
		function(context)
			return context.string == "button_tick" and uicomponent_descended_from(UIComponent(context.component), "worship_dialogue_box_id");
		end,
		function(context)
			core:remove_listener(local_deities_process_name);
			core:remove_listener(local_deities_confirmation_dialog_process_name);
			tut.add.local_deities_worship_started();
		end,
		false
	);
end;


function tut.add.local_deities_worship_started()
	local uic_close_panel_button = find_uicomponent(core:get_ui_root(), "local_deities", "btns_container", "button_ok");
	cm:callback(
		function()
			if uic_close_panel_button then
				uic_close_panel_button:Highlight(true, false, 0, true);
			end
		end,
		1,
		"FTUE_local_deities_planel_close"
	)
	
	core:add_listener(
		"FTUE_deities_panel_closed_final",
		"PanelClosedCampaign",
		function(context)
			return context.string == "local_deities";
		end,
		function()
			cm:remove_callback("FTUE_local_deities_planel_close")
			if uic_close_panel_button then
				uic_close_panel_button:Highlight(false);
			end
			cm:callback(
				function()
					cm:dismiss_advice()
				end,
				1
			);
		end,
		false
	);

	core:remove_listener(local_deities_panel_closed_process_name);

	cm:callback(function() cm:end_objective_chain(local_deities_process_name) end, 5);
	
	uim:suppress_end_turn_warning("phar_deity_slot_available", false)
	uim:suppress_end_turn_warning("phar_local_deities_devoted_hero_available", false)

	tut_complete_active_intervention();
end;















-----------------------------------------------------------------------------------------------
--	Court
-----------------------------------------------------------------------------------------------

local court_advice_monitors_started = "tut_court_advice_monitors_started";
local court_advice_monitors_completed = "tut_court_advice_monitors_completed";

local court_process_name = "court";


-- Called when scripts are loaded, decides to start listeners if the game is in the correct state
function tut.add.start_court_advice_listeners_on_load()
	local started = cm:get_saved_value(court_advice_monitors_started);
	local completed = cm:get_saved_value(court_advice_monitors_completed);
	if started and not completed then
		-- We are in the correct state to start the listeners
		tut.add.start_court_advice_listeners_action();
	end;
end;


-- Called when it's time to start the advice listeners from a previous section of script. After this is called, these listeners will start when loading from a savegame.
function tut.add.start_court_advice_listeners()
	local started = cm:get_saved_value(court_advice_monitors_started);
	local completed = cm:get_saved_value(court_advice_monitors_completed);
	if started or completed then
		return false;
	end;

	cm:set_saved_value(court_advice_monitors_started, true);

	return true, tut.add.start_court_advice_listeners_action();
end;


-- Actually start the listeners, either on-load or by other scripts at the appropriate time
function tut.add.start_court_advice_listeners_action()

	-- Trigger the advice if the player starts their turn and we are one turn away from a Shemsu-Hor
	cm:add_faction_turn_start_listener_by_name(
		court_process_name,
		tut.player_faction_key,
		function()
			local turns_to_shemsu_hor = shemsu_hor.get_turns_to_shemsu_hor();
			if turns_to_shemsu_hor == 1 then
				tut.add.start_court_intervention();
			end;
		end,
		true
	);
end;


-- Begin to issue the advice. We do this by triggering a transient intervention
function tut.add.start_court_intervention()
	-- Remove the objective and return it once the intervention is finished
	cm:remove_objective(tut.advisor_texts.next_turns.v2_merneptah_advisor_own_settlements.own_settlements_objective)
	cm:remove_faction_turn_start_listener_by_name(court_process_name);
	cm:set_saved_value(court_advice_monitors_completed, true);
	uim:override("stances"):unlock();  -- Ensure stances get unlocked
	
	--Unsuppress court warnings here
	uim:suppress_end_turn_warning("phar_court_unused_intrigue", false)
	uim:suppress_end_turn_warning("phar_court_posiion_available", false)

	cm:trigger_transient_intervention(
		"tutorial_court_advice",					-- name
		function(inv)
			tut.add.start_court_cutscene()
		end,										-- callback
		true,										-- debug output
		function(inv)
		end											-- config callback
	);
end;


function tut.add.highlight_court_button(ap_name)
	local uic_court_button = find_uicomponent("hud_campaign", "faction_widget_holder", "faction_widget_list", "main_buttons", "phar_court_container", "button_phar_court");
	local ap_court_button;

	if uic_court_button then
		uic_court_button:Highlight(true, false, 0, true);

		if ap_name then
			ap_court_button = tut_show_ap(
				ap_name,
				"topleft",
				uic_court_button,
				"ui_text_replacements_localised_text_phar_tutorial_court_button",
				0.5,
				0.9
			);
		end;
	end;

	return uic_court_button, ap_court_button;
end;


function tut.add.unhighlight_court_button(uic_court_button, ap_court_button)
	if uic_court_button then
		uic_court_button:Highlight(false, false);
	end;

	if ap_court_button then
		ap_court_button:hide();
	end;
end;


function tut.add.proceed_on_court_panel_opened(process_name, progress_callback, objective_key, objective_chain_key, should_activate_objective_chain)

	if objective_key then
		if objective_chain_key then
			if should_activate_objective_chain then
				cm:activate_objective_chain(objective_chain_key, objective_key);
			else
				cm:update_objective_chain(objective_chain_key, objective_key);
			end;
		else
			cm:set_objective(objective_key);
		end;
	end;
	
	core:remove_listener(process_name);

	core:add_listener(
		process_name,
		"PanelOpenedCampaign",
		function(context)
			return context.string == "court";
		end,
		function()
			-- If we have an objective key and not an objective chain key then complete and remove the objective. If we have a
			-- chain key the assumption is that the objective will be updated once the panel is opened.
			if objective_key and not objective_chain_key then
				tut_complete_and_remove_objective(objective_key)
			end;

			progress_callback();
		end,
		false
	);

end;


function tut.add.start_court_cutscene()

	local open_court_panel_objective_key = "phar_tutorial_ramesses_court_01";
	local court_panel_opened = false;
	local uic_court_button;
	local ap_court_button;

	-- Set up a progression function that unhighlights the court button, hides the ap, and calls court_panel_opened()
	local function progress_function()
		court_panel_opened = true;
		tut.add.unhighlight_court_button(uic_court_button, ap_court_button)
		tut.add.court_panel_opened();
	end;

	-- Set up conversation
	local conv_court = campaign_conversation:new(
		"court",
		function()
			-- Conversation ends
		end
	);

	conv_court:set_proceed_on_advice_finished(true);

	-- Set up infotext to show at end of conversation, also with an objective, a button highlight, and an active pointer
	local court_infotext_initial = {
		"phar_camp_info_court_intro_01",
		"phar_tutorial_camp_ramesses_court_info_01",
		"phar_tutorial_camp_ramesses_court_info_02",
		function()
			if not court_panel_opened then
				uic_court_button, ap_court_button = tut.add.highlight_court_button("court");
				court.position_functions.remove_character_from_position(court.egyptian_court, "vizier")
				-- Register another proceed_on_court_panel_opened() process, this time with an objective name. This will supercede the previous process and show the objective
				tut.add.proceed_on_court_panel_opened(
					court_process_name,
					progress_function,
					open_court_panel_objective_key
				);
			end;
		end
	};

	conv_court:add_advice(
		"phar_main_tutorial_v2_court_1_pract",				-- advice key
		nil,												-- infotext
		nil,												-- show topic leader
		true,												-- dismiss before playing override
		nil,												-- initial delay override
		nil,												-- proceed on advice finished override
		nil 												-- start callback
	);

	conv_court:add_advice(
		"phar_main_tutorial_v2_court_2_ram",				-- advice key
		nil,												-- infotext
		nil,												-- show topic leader
		true,												-- dismiss before playing override
		nil,												-- initial delay override
		nil,												-- proceed on advice finished override
		nil 												-- start callback
	);

	conv_court:add_advice(
		"phar_main_tutorial_v2_court_3_pract",				-- advice key
		court_infotext_initial,								-- infotext
		true,												-- show topic leader
		true,												-- dismiss before playing override
		nil,												-- initial delay override
		nil,												-- proceed on advice finished override
		nil 												-- start callback
	);

	conv_court:start();

	-- Register a proceed_on_court_panel_opened() process. This will be superceded by another call to the same function further up this file - the second call shows the objective.
	-- This one will handle the case of the player proceeding before the objective is shown.
	tut.add.proceed_on_court_panel_opened(
		court_process_name,
		progress_function
	);
end;


function tut.add.court_panel_opened()

	cm:clear_infotext();
	cm:show_advice(
		"phar_main_tutorial_v2_court_4_pract",
		true,
		false,
		function()
			cm:hide_advisor_without_infotexts()
		end,
		tut.ADVICE_DURATION_S
	);
	cm:add_infotext(
		"phar_tutorial_camp_ramesses_court_info_11",
		"phar_tutorial_camp_ramesses_court_info_21"
	);

	tut.add.start_shemsu_hor_advice_listeners();
	tut_complete_active_intervention();
	if cm:get_faction(tut.player_faction_key):num_regions() < 8 then
		cm:set_objective(tut.advisor_texts.next_turns.v2_merneptah_advisor_own_settlements.own_settlements_objective)
	end
end;












--------------------------------------------------------------------------------------------------
-- CHECKPOINT 1050: Shemsu Hor
--------------------------------------------------------------------------------------------------

local checkpoint_1050_str = common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_shemsu")

cm:add_checkpoint( 
	1050,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		
	end,
	false,													-- call function when checkpoint reached
	checkpoint_1050_str										-- opt string name
)




-----------------------------------------------------------------------------------------------
--	Shemsu-Hor
-----------------------------------------------------------------------------------------------


local shemsu_hor_advice_monitors_started = "tut_shemsu_hor_advice_monitors_started";
local shemsu_hor_advice_monitors_completed = "tut_shemsu_hor_advice_monitors_completed";

local shemsu_hor_process_name = "shemsu_hor";


-- Called when scripts are loaded, decides to start listeners if the game is in the correct state
function tut.add.start_shemsu_hor_advice_listeners_on_load()
	local started = cm:get_saved_value(shemsu_hor_advice_monitors_started);
	local completed = cm:get_saved_value(shemsu_hor_advice_monitors_completed);
	if started and not completed then
		-- We are in the correct state to start the listeners
		tut.add.start_shemsu_hor_advice_listeners_action();
	end;
end;


-- Called when it's time to start the advice listeners from a previous section of script. After this is called, these listeners will start when loading from a savegame.
function tut.add.start_shemsu_hor_advice_listeners()
	local started = cm:get_saved_value(shemsu_hor_advice_monitors_started);
	local completed = cm:get_saved_value(shemsu_hor_advice_monitors_completed);
	if started or completed then
		return false;
	end;

	cm:set_saved_value(shemsu_hor_advice_monitors_started, true);

	return true, tut.add.start_shemsu_hor_advice_listeners_action();
end;


-- Actually start the listeners, either on-load or by other scripts at the appropriate time
function tut.add.start_shemsu_hor_advice_listeners_action()
	if shemsu_hor.is_shemsu_hor() then
		tut.add.start_shemsu_hor_intervention();
	else
		-- Trigger the advice if the player starts their turn we are on a Shemsu-Hor turn
		cm:add_faction_turn_start_listener_by_name(
			shemsu_hor_process_name,
			tut.player_faction_key,
			function()
				cm:checkpoint_reached(
					1050,														-- checkpoint id
					function()												-- post-update callback
						if shemsu_hor.is_shemsu_hor() then
							tut.add.start_shemsu_hor_intervention();
						end;
					end,
					tut.SHOULD_SAVE_EVERY_CHECKPOINT_MID,				-- should save game
					tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or false			-- always generate named savegame, rather than autosaving
				)
			end,
			true
		);
	end
end;


-- Begin to issue the advice. We do this by triggering a transient intervention
function tut.add.start_shemsu_hor_intervention()
	cm:remove_faction_turn_start_listener_by_name(shemsu_hor_process_name);

	cm:trigger_transient_intervention(
		"tutorial_shemsu_hor_advice",					-- name
		function(inv)
			tut.add.start_shemsu_hor_advice()
		end,										-- callback
		true,										-- debug output
		function(inv)
		end											-- config callback
	);
end;


function tut.add.start_shemsu_hor_advice()
	cm:remove_objective(tut.advisor_texts.next_turns.v2_merneptah_advisor_own_settlements.own_settlements_objective)
	
	-- Remove the Vizier from his position
	local position_string = "vizier"
	court.position_functions.remove_character_from_position(court.egyptian_court, position_string)
	local court_position_obj = court.util_functions.get_court_position(court.egyptian_court, position_string)
	local open_court_panel_objective_key = "phar_tutorial_ramesses_court_01";
	local court_panel_opened = false;
	local uic_court_button;
	local ap_court_button;

	local faction = cm:get_faction(tut.player_faction_key)
	local can_claim_position = court.util_functions.can_claim_position_directly(court.egyptian_court, tut.player_faction_key, court_position_obj)

	if not can_claim_position then
		local claim_cost_obj = court.position_functions.get_claim_position_cost_obj(court.egyptian_court, tut.player_faction_key)
		local resource_cost = claim_cost_obj:resources()
		for i = 1, #resource_cost do
			local resource_i_key = resource_cost[i][1]
			local resource_i_cost = resource_cost[i][2]
			
			if resource_i_cost < 0 then
				resource_i_cost = -resource_i_cost
			end

			if faction:pooled_resource(resource_i_key):value() < resource_i_cost then
				cm:faction_add_pooled_resource(tut.player_faction_key, resource_i_key, "troy_resource_factor_character", resource_i_cost)
			end
		end;
	end
	-- Set up a progression function that unhighlights the court button, hides the ap, and calls court_panel_opened()
	local function progress_function()
		court_panel_opened = true;
		--tut.add.unhighlight_court_button(uic_court_button, ap_court_button)
		tut.add.shemsu_hor_court_panel_opened(open_court_panel_objective_key);
	end;

	if not court_panel_opened then
		cm:clear_infotext();
		cm:show_advice(
			"phar_main_tutorial_v2_shemsu_hor_1_pract",
			true,
			false,
			function()
				cm:hide_advisor_without_infotexts()
			end,
			tut.ADVICE_DURATION_S
		);
		cm:add_infotext_with_leader(
			"phar_camp_info_court_shemsu_01",
			"phar_camp_info_court_shemsu_02",
			function()

			end
		);
		uic_court_button, ap_court_button = tut.add.highlight_court_button(--[["shemsu_hor_court"]]);		-- uncomment the name to create/show an action pointer
		-- Register another proceed_on_court_panel_opened() process, this time with an objective name. This will supercede the previous process and show the objective
		tut.add.proceed_on_court_panel_opened(
			shemsu_hor_process_name,
			progress_function,
			open_court_panel_objective_key,
			shemsu_hor_process_name,
			true
		);
	end;

	core:add_listener(
		"FTUE_court_position_gained_event",
		"ScriptEventCourtPositionGained",
		function() return true end,
		function()
			local appoint_vizier_objective_key = "phar_tutorial_ramesses_court_02";
			tut.add.shemsu_hor_vizier_appointed(appoint_vizier_objective_key);
		end,
		true
	)

	-- Register a proceed_on_court_panel_opened() process. This will be superceded by another call to the same function further up this file - the second call shows the objective.
	-- This one will handle the case of the player proceeding before the objective is shown.
	tut.add.proceed_on_court_panel_opened(
		shemsu_hor_process_name,
		progress_function
	);
end;


function tut.add.shemsu_hor_court_panel_opened(objective_key)
	local uic_court_button = find_uicomponent("hud_campaign", "faction_widget_holder", "faction_widget_list", "main_buttons", "phar_court_container", "button_phar_court");
	tut.add.unhighlight_court_button(uic_court_button)

	local court_panel_closed = false;
	local appoint_vizier_objective_key = "phar_tutorial_ramesses_court_02";

	-- Show additional infotext the first time we're here
	core:call_once(
		shemsu_hor_process_name .. "_panel_opened",
		function()
			cm:add_infotext(
				"phar_camp_info_court_shemsu_03"
			);
		end
	);

	-- Listen for the Vizier being appointed
	if court.util_functions.is_in_legitimacy_war(court.ui.data.faction_court) then
		script_error("WARNING: shemsu_hor_court_panel_opened() called but we are currently in a legitimacy war - no Vizier can appointed");
		should_show_active_pointer = false;
		tut.add.shemsu_hor_vizier_appointed(appoint_vizier_objective_key);
		return;
	end;

	-- Show active pointer after a short delay
	cm:callback(
		function()
			if court_panel_closed then
				return;
			end;

			local faction_court = court.util_functions.get_faction_court_for_faction(tut.player_faction_key)
			local vizier_position_obj = court.util_functions.get_court_position(faction_court, "vizier")
			
			if not vizier_position_obj or vizier_position_obj.persistent.current_holder then
				return
			end		


			local uic_vizier_position = find_uicomponent("court", "vizier");
			if uic_vizier_position then
				local ap_vizier_position = tut_show_ap(
					"court_panel_vizier_position",
					"bottomleft",
					uic_vizier_position,
					"ui_text_replacements_localised_text_phar_tutorial_shemsu_hor_vizier_position",
					0.6,
					0.1
				);
			end;

			-- Update objective
			cm:update_objective_chain(
				shemsu_hor_process_name,
				"phar_tutorial_ramesses_court_02"
			);
		end,
		1
	);
	
	-- Listen for the panel being closed and issue an objective to re-open it
	core:add_listener(
		shemsu_hor_process_name,
		"PanelClosedCampaign",
		function(context)
			return context.string == "court";
		end,
		function()
			court_panel_closed = true;
			core:hide_all_text_pointers();

			tut.add.highlight_court_button(--[["shemsu_hor_court"]]);
			tut.add.proceed_on_court_panel_opened(
				shemsu_hor_process_name,
				function()
					tut.add.shemsu_hor_court_panel_opened(objective_key)
				end,
				objective_key,
				shemsu_hor_process_name,
				false
			);
		end,
		false
	);
end;


function tut.add.shemsu_hor_vizier_appointed(appoint_vizier_objective_key)
	tut_complete_active_intervention();
	cm:show_advice(
		"phar_main_tutorial_v2_shemsu_hor_2_pract",
		true,
		false,
		function()
			cm:dismiss_advice()
		end,
		tut.ADVICE_DURATION_S
	);
	tut_complete_and_remove_objective(appoint_vizier_objective_key)

	--Remove the previous objective
	local open_court_panel_objective_key = "phar_tutorial_ramesses_court_01";
	tut_complete_and_remove_objective(open_court_panel_objective_key)
	core:remove_listener(shemsu_hor_process_name)
	cm:set_saved_value(shemsu_hor_advice_monitors_completed, true);

	cm:callback(
		function()
			if cm:get_faction(tut.player_faction_key):num_regions() < 8 then
				cm:set_objective(tut.advisor_texts.next_turns.v2_merneptah_advisor_own_settlements.own_settlements_objective)
			end
		end,
		tut.OBJECTIVE_REMOVE_DELAY + 2
	)
end;












tut.add.start_listeners_on_load();