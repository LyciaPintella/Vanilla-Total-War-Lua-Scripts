-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	INTERVENTIONS SCRIPTS
--	Declare scripts for campaign interventions (when the advisor appears to
--	inform the player about a game feature) here
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

-- Advice levels
-- These are to be used with intervention:set_min_advice_level. Calling intervention:set_min_advice_level(ADVICE_LEVEL_LOW_HIGH) for
-- example would mean that intervention would only be able to triger if the player's advice level preferences were set to "Low" or "High"
local ADVICE_LEVEL_MINIMAL_LOW_HIGH = 0;
local ADVICE_LEVEL_LOW_HIGH = 1;
local ADVICE_LEVEL_HIGH = 2;


-- Intervention costs
-- These values can be used when calling intervention:new, which requires a cost to be specified for the new intervention. The intervention system
-- has a budget of 100 points max to spend in any given sequence. If these values are used two low cost interventions may trigger, or a low and then
-- a medium, or one medium or one high. Other values can be used. If intervention:set_must_trigger then the cost is deducted from the available points
-- but the intervention is triggered anyway, even if the max points is exceeded. See the intervention system documentation for more information.
local INTERVENTION_COST_NO_COST = 0;
local INTERVENTION_COST_LOW = 40;
local INTERVENTION_COST_MEDIUM = 60;
local INTERVENTION_COST_HIGH = 80;



-- For testing
local bool_start_global_interventions = true

-- Global distance at which things are close enough to be pointed out - e.g. enemy culture are "close" and will be 
-- highlighted by the advisor if the shortest distance between the player and any character is less than this number)
local INTERVENTION_CLOSE_DISTANCE = 50;

-- List of global interventions to start
local global_intervention_list = {};





--
-- Dismiss advices automatically after "intervention_auto_clear_t" has expired.

local intervention_auto_clear_t = 30;

local function auto_clear_advice()
    cm:set_infotext_auto_clear_timer(intervention_auto_clear_t, true)
end;

local function auto_clear_advice_delayed()
	cm:callback(
		function()
			auto_clear_advice()
		end,
		0.6
	)
end;






-- Optional highlight to display on High advice level only and when not in FTUE to avoid other scripting conflicts

local intervention_highlight_clear_t = 6;

local function advice_component_table_highlight(uic_supplied_paths)
	if core:get_advice_level() == 2 and not is_tutorial_mode() then
		highlight_component_table(0, unpack(uic_supplied_paths));
	else
		return
	end

	local remove_intervention_highlight = function()
		unhighlight_component_table()

		cm:remove_callback("RemoveAdviceHighlight_callback")
		core:remove_listener("DismissAdviceHighlightWithAdvice_listener")
		cm:remove_real_callback("AdviceHighlightValidityCheck_repeat")
	end

	cm:callback(
		function()
			remove_intervention_highlight()
		end,
		intervention_highlight_clear_t,
		"RemoveAdviceHighlight_callback"
	)

	core:add_listener(
        "DismissAdviceHighlightWithAdvice_listener",
        "AdviceDismissed",
        true,
        function()
            remove_intervention_highlight()
        end,
        false
    );

	cm:repeat_real_callback(
		function()
			local checked_comp = uic_supplied_paths[1]
			if not is_uicomponent(checked_comp) then
				script_error("ERROR: advice_component_table_highlight() called but parameter is a [" .. tostring(checked_comp) .. "] and not a uicomponent");
			end
			local is_visible = checked_comp and is_uicomponent(checked_comp) and checked_comp:VisibleFromRoot()
			if not is_visible then
				remove_intervention_highlight()
			end
		end,
		200,
		"AdviceHighlightValidityCheck_repeat"	
	)

end







-- Function for use inside this file which registers a global intervention to be started when start_global_interventions() is called
local function add_global_intervention(intervention, allow_in_tutorial)
	-- If we're not allowed in the tutorial, then add a precondition to the intervention that prevents it from starting if is_tutorial_mode() returns true
	if allow_in_tutorial ~= true then
		intervention:add_precondition(
			function()
				return not is_tutorial_mode()
			end,
			"game must not be in tutorial mode"
		)
	end;
	
	table.insert(global_intervention_list, intervention);
end;

-- Factory function for creating a new global intervention inside this file.
-- If an advice_level is passed in, then this is set on the new intervention.
-- If an advice_key is passed in, then this is set as a precondition (i.e. the intervention will not start if the advice key has been heard before). This can be passed in as a table of keys if there are more than one.
-- Ditto min turn number. Note that if the advice history is reset by the player mid-campaign game this min turn countdown will also apply from the turn on 
-- which this happened, so it's worth setting.
-- trigger_over_fullscreen_panel, trigger_over_battle and trigger_on_ai_turns are also optional settings.
-- min_turns_before_triggering_ftue - Optional param for min turns in FTUE mode. This overrides the min_turns_before_triggering param. 
local function create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turns, min_turns_before_triggering_ftue)
	local new_intervention = intervention:new(
		name,
		cost,
		nil,
		BOOL_INTERVENTIONS_DEBUG
	);

	if advice_level then
		new_intervention:set_min_advice_level(advice_level);
	end;

	if is_string(advice_key) then
		new_intervention:add_advice_key_precondition(advice_key);
	elseif is_table(advice_key) then
		for i = 1, #advice_key do
			new_intervention:add_advice_key_precondition(advice_key[i]);
		end;
	end;

	-- If either a min_turns_before_triggering or min_turns_before_triggering_ftue value have been set, then add in a precondition check that always passes, but which also sets the
	-- min turn based on whether we're in a tutorial or not. This is a bit of a hack, but we do this because we can't reliably know whether we're in a tutorial when this script is initialised
	if min_turns_before_triggering or min_turns_before_triggering_ftue then
		local min_turn_set = false

		new_intervention:add_precondition(
			function()
				if not min_turn_set then
					min_turn_set = true;
					
					local is_tutorial = is_tutorial_mode()
					if min_turns_before_triggering and not is_tutorial then
						new_intervention:set_min_turn(min_turns_before_triggering)
					end;
				
					if min_turns_before_triggering_ftue and is_tutorial then
						new_intervention:set_min_turn(min_turns_before_triggering_ftue)
					end

					return true
				end
			end,
			"min-turns-before-triggering condition must be met (this precondition should never fail!)"
		)
	end;


	if trigger_over_fullscreen_panel then
		new_intervention:set_wait_for_fullscreen_panel_dismissed(false);
	end;
	
	if trigger_over_battle then
		new_intervention:set_wait_for_battle_complete(false);
	end;
	
	if trigger_on_ai_turns then
		new_intervention:set_player_turn_only(false);
	end;

	return new_intervention;
end;


-- function for creating interventions that trigger when fullscreen panels are opened
local function create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name, allow_in_tutorial, uic_string_path)

	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, false, true, false, false);


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"PanelOpenedCampaign",
		function(context)
			return context.string == panel_name
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
			auto_clear_advice_delayed()
			core:trigger_event("ScriptEvent" .. name .. "Highlight")
			
			if uic_string_path then
				local uic_target_paths = {
					core:get_ui_root():SequentialFind( unpack(uic_string_path) );
				};
				advice_component_table_highlight(uic_target_paths)
			end;
				
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention,allow_in_tutorial);

	return new_intervention;
end;





-- Function to start all global interventions - called from faction scripts
local function start_global_interventions(include_scripted_tours)

	if core:is_tweaker_set("DISABLE_PRELUDE_CAMPAIGN_SCRIPTS") then
		return
	end;

	out.interventions("");
	out.interventions("* start_global_interventions() called");
	out("* start_global_interventions() called - see output in interventions tab");
	out.interventions("");

	-- don't start interventions if we're not supposed to
	if not bool_start_global_interventions then
		out.interventions("* not starting global interventions as bool_start_global_interventions is set to false");
		return;
	end;
	
	-- guard against being called in multiplayer
	if cm:is_multiplayer() then
		out.interventions("* not starting global interventions as this is a multiplayer game");
		return;
	end;
	
	local local_faction_key = cm:get_local_faction_name();
	
	-- guard against being called in autoruns
	if not is_string(local_faction_key) or local_faction_key == "" then
		out.interventions("* not starting global interventions as no local faction string could be found - is this an autorun?");
	end;

	local faction = cm:get_faction(local_faction_key);
	
	if not faction then
		out.interventions("* not starting global interventions as couldn't find the local faction");
	end;

	local subculture_key = faction:subculture();

	-- start all global interventions, passing in the local faction subculture key
	local num_global_interventions = #global_intervention_list;
	local num_global_interventions_started = 0;

	for i = 1, num_global_interventions do
		if global_intervention_list[i]:start() then
			num_global_interventions_started = num_global_interventions_started + 1;
		end;
	end;

	out.interventions("");
	out.interventions("### started " .. num_global_interventions_started .. " of " .. num_global_interventions .. " global interventions");
	out.interventions("");
end;


-- start global interventions when intro cutscenes have finished
core:add_listener(
	"start_global_interventions",
	"ScriptEventIntroCutsceneFinished",
	true,
	start_global_interventions,
	false
);

-- start global interventions when requested by tutorial
core:add_listener(
	"start_global_interventions_ftue",
	"ScriptEventFTUEStartGlobalInterventions",
	true,
	start_global_interventions,
	false
);






------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------
-- Gobal intervention declarations
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------









---------------------------------------------------------------
--
--	AGENT_foreign_action
--
---------------------------------------------------------------
--[[
do
	local name = "AGENT_foreign_action";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- A foe has struck from the shadows! An enemy agent, skilled in underhand tactics, has infiltrated your people and sowed disruption. This dishonourable attempt to thwart your plans must not go unchallenged.
	local advice_key = "troy_campaign_advisor_agent_actions_001";

	local infotext = {
		"troy_camp_info_agent_actions_01",
		"troy_camp_info_agent_actions_02",
		"troy_camp_info_agent_actions_04",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	
	--
	-- intervention configuration
	new_intervention:add_whitelist_event_type("scripted_persistent_located_eventevent_feed_target_faction");
	new_intervention:add_whitelist_event_type("agent_action_vs_army_with_immortal_generalevent_feed_target_target_faction");
	new_intervention:add_whitelist_event_type("agent_action_vs_characterevent_feed_target_target_faction");
	new_intervention:add_whitelist_event_type("agent_action_vs_settlementevent_feed_target_target_faction");


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventAgentActionSuccessAgainstCharacter",
		function(context)
			local char = context:character();
			new_intervention.x = char:display_position_x();
			new_intervention.y = char:display_position_y();
		
			return true;
		end
	);

	new_intervention:add_trigger_condition(
		"ScriptEventAgentActionFailureAgainstCharacter",
		function(context)
			local char = context:character();
			new_intervention.x = char:display_position_x();
			new_intervention.y = char:display_position_y();
		
			return true;
		end
	);

	new_intervention:add_trigger_condition(
		"ScriptEventAgentActionSuccessAgainstGarrison",
		function(context)
			local settlement = context:garrison_residence():settlement_interface();
			new_intervention.x = settlement:display_position_x();
			new_intervention.y = settlement:display_position_y();
		
			return true;
		end
	);

	new_intervention:add_trigger_condition(
		"ScriptEventAgentActionFailureAgainstGarrison",
		function(context)
			local settlement = context:garrison_residence():settlement_interface();
			new_intervention.x = settlement:display_position_x();
			new_intervention.y = settlement:display_position_y();
		
			return true;
		end
	);

	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()	
			new_intervention:scroll_camera_for_intervention(
				nil,									-- region key to reveal shroud from
				new_intervention.x, 					-- display position x
				new_intervention.y,						-- display position y
				advice_key, 							-- advice key
				infotext,								-- infotext table
				nil										-- mission manager
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;











---------------------------------------------------------------
--
--	AGENT_experience_gained
--
---------------------------------------------------------------

do
	local name = "AGENT_experience_gained";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- All who wish to make a mark on the world seek to gain new skills through experience. This is as true for your agents as for your military leaders.
	local advice_key = "troy_campaign_advisor_agent_experience_level_up_01";

	local infotext = {
		"troy_camp_info_character_experience_01",
		"troy_camp_info_character_experience_02",
		"troy_camp_info_character_experience_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerCharacterRankUp",
		function(context)
			if cm:char_is_agent(context:character()) then
				new_intervention.char_cqi = context:character():cqi();
				return true;
			end
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:scroll_camera_to_character_for_intervention(
				new_intervention.char_cqi,					-- target character cqi
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;












---------------------------------------------------------------
--
--	AGENT_gorgon_recruited
--
---------------------------------------------------------------

do
	local name = "AGENT_gorgon_recruited";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- To meet the gorgon's gaze is to look upon horror made flesh. The bravest heart trembles and the most rational mind is stricken with terror. Her mere presence may unman an entire army.
	local advice_key = "troy_campaign_advisor_agent_type_epic_gorgon_01";	

	local infotext = {
		"troy_camp_info_gorgons_01",
		"troy_camp_info_gorgons_02",
		"troy_camp_info_gorgons_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionCharacterCreated",
		function(context)			
			if context:character():character_subtype("troy_agent_gorgon") then
				-- return true, but store the character involved
				new_intervention.char_cqi = context:character():cqi();
				return true;
			end;
			
			return false;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:scroll_camera_to_character_for_intervention(
				new_intervention.char_cqi,					-- target character cqi
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;












---------------------------------------------------------------
--
--	AGENT_satyr_recruited
--
---------------------------------------------------------------

do
	local name = "AGENT_satyr_recruited";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- The satyr is a jocular fellow. But do not be fooled by this prancing bard. He uses merriment and trickery as weapons, bringing joyful chaos… and worrisome disruption.
	local advice_key = "troy_campaign_advisor_agent_type_epic_satyr_01";	

	local infotext = {
		"troy_camp_info_satyrs_01",
		"troy_camp_info_satyrs_02",
		"troy_camp_info_satyrs_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionCharacterCreated",
		function(context)			
			if context:character():character_subtype("troy_agent_satyr") then
				-- return true, but store the character involved
				new_intervention.char_cqi = context:character():cqi();
				return true;
			end;
			
			return false;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:scroll_camera_to_character_for_intervention(
				new_intervention.char_cqi,					-- target character cqi
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;












---------------------------------------------------------------
--
--	AGENT_seer_recruited
--
---------------------------------------------------------------

do
	local name = "AGENT_seer_recruited";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- The seer walks paths most mortals cannot see. The world of men is but a passing distraction to this eternal traveller. Yet the favour of the gods may go with her.  
	local advice_key = "troy_campaign_advisor_agent_type_epic_seer_01";	

	local infotext = {
		"troy_camp_info_seers_01",
		"troy_camp_info_seers_02",
		"troy_camp_info_seers_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionCharacterCreated",
		function(context)			
			if context:character():character_subtype("troy_agent_seer") then
				-- return true, but store the character involved
				new_intervention.char_cqi = context:character():cqi();
				return true;
			end;
			
			return false;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:scroll_camera_to_character_for_intervention(
				new_intervention.char_cqi,					-- target character cqi
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;












---------------------------------------------------------------
--
--	AGENT_RACIAL_odysseus_supply_bases
--
---------------------------------------------------------------

do
	local name = "AGENT_RACIAL_odysseus_supply_bases";		-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- This quick-witted agent may build a safe haven in even the most hostile of lands. Send them forth to infiltrate the cities of your rivals.
	local advice_key = "troy_campaign_advisor_fm_odysseus_supply_bases_agent_action_01";	

	local infotext = {
		"troy_camp_info_odysseus_safe_haven_01",
		"troy_camp_info_odysseus_safe_haven_02",
		"troy_camp_info_odysseus_safe_haven_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration
	new_intervention:add_player_faction_precondition("troy_main_dan_ithaca");


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionTurnStart",
		function(context)			
			local has_spies, spy_list = cm:faction_contains_character_of_subtype(context:faction(), "troy_agent_spy", true);
			
			if has_spies then
				new_intervention.char_cqi = spy_list[1]:command_queue_index();
				return true;
			end;

			return false;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:scroll_camera_to_character_for_intervention(
				new_intervention.char_cqi,					-- target character cqi
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;







---------------------------------------------------------------
--
--	DCL2_AGENT_orion_recruited
--
---------------------------------------------------------------

do
	local name = "DCL2_AGENT_orion_recruited";				-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- The satyr is a jocular fellow. But do not be fooled by this prancing bard. He uses merriment and trickery as weapons, bringing joyful chaos… and worrisome disruption.
	local advice_key = "troy_dlc2_campaign_advisor_orion_01";	

	local infotext = {
		"troy_dlc2_camp_info_orion_01",
		"troy_dlc2_camp_info_orion_02",
		"troy_dlc2_camp_info_orion_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionCharacterCreated",
		function(context)			
			if context:character():character_subtype("troy_dlc2_agent_orion") then
				-- return true, but store the character involved
				new_intervention.char_cqi = context:character():cqi();
				return true;
			end;
			
			return false;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:scroll_camera_to_character_for_intervention(
				new_intervention.char_cqi,					-- target character cqi
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;





---------------------------------------------------------------
--
--	HEP_AGENT_kabeiros_recruited
--
---------------------------------------------------------------

do
	local name = "HEP_AGENT_kabeiros_recruited";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- The satyr is a jocular fellow. But do not be fooled by this prancing bard. He uses merriment and trickery as weapons, bringing joyful chaos… and worrisome disruption.
	local advice_key = "troy_hep_campaign_advisor_kabeiros_01";	

	local infotext = {
		"troy_hep_camp_info_kabeiros_01",
		"troy_hep_camp_info_kabeiros_02",
		"troy_hep_camp_info_kabeiros_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionCharacterCreated",
		function(context)			
			if context:character():character_subtype("troy_hep_agent_kabeiros") then
				-- return true, but store the character involved
				new_intervention.char_cqi = context:character():cqi();
				return true;
			end;
			
			return false;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:scroll_camera_to_character_for_intervention(
				new_intervention.char_cqi,					-- target character cqi
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;

]]





---------------------------------------------------------------
--
--	MANAGEMENT_money
--
---------------------------------------------------------------

do
	local name = "MANAGEMENT_money";						-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local pooled_resource_trigger_thresholds = {
		troy_food = 1000,
		troy_wood = 200,
		troy_stones = 200,
		troy_bronze = 100,
		troy_gold = 50
	};


	-- War is expensive, but even in times of peace, hard-won wealth may leach away like summer rain into parched earth. Spend more than you gain, and you risk destitution.
	local advice_key = "phar_campaign_advisor_money_01";	

	local infotext = {
		"troy_camp_info_resources_01",
		"phar_camp_info_resources_02",
		"phar_camp_info_resources_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration
	new_intervention:add_advice_key_precondition("phar_campaign_advisor_bankruptcy_01");
	new_intervention:add_advice_key_precondition("phar_campaign_advisor_bankruptcy_02");


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionTurnStart",
		function(context)
			local faction = context:faction();

			for resource_key, threshold_value in pairs(pooled_resource_trigger_thresholds) do
				local pooled_resource = faction:pooled_resource(resource_key);
				if not pooled_resource:is_null_interface() and pooled_resource:value() < threshold_value then
					new_intervention.resource_key = resource_key;
					return true;
				end;
			end;			
			return false;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;












---------------------------------------------------------------
--
--	MANAGEMENT_near_bankruptcy
--
---------------------------------------------------------------

do
	local name = "MANAGEMENT_near_bankruptcy";				-- Unique string name for this intervention
	local cost = INTERVENTION_COST_NO_COST;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local pooled_resource_trigger_thresholds = {
		troy_bronze = 50,
		troy_food = 150,
		troy_gold = 50
	};


	-- Look to your treasury! The wealth that maintains your power and influence runs low.
	local advice_key = "phar_campaign_advisor_bankruptcy_01";	

	local infotext = {
		"phar_camp_info_bankruptcy_01",
		"phar_camp_info_bankruptcy_02",
		"phar_camp_info_bankruptcy_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	

	--
	-- intervention configuration
	new_intervention:add_advice_key_precondition("phar_campaign_advisor_bankruptcy_02");
	new_intervention:give_priority_to_intervention("RESOURCE_money");


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionTurnStart",
		function(context)
			local faction = context:faction();

			for resource_key, threshold_value in pairs(pooled_resource_trigger_thresholds) do
				local pooled_resource = faction:pooled_resource(resource_key);

				if not pooled_resource:is_null_interface() and pooled_resource:income() < 0 and pooled_resource:value() < threshold_value then
					new_intervention.resource_key = resource_key;
					return true;
				end;
			end;
			return false;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;












---------------------------------------------------------------
--
--	MANAGEMENT_bankruptcy
--
---------------------------------------------------------------

do
	local name = "MANAGEMENT_bankruptcy";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_NO_COST;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local pooled_resource_trigger_thresholds = {
		troy_bronze = 1,
		troy_food = 1,
		troy_gold = 1,
		troy_stones = 1,
		troy_wood = 1
	};


	-- Alas, your treasury is bare! Search out new sources of wealth at once, or risk losing all you have achieved!
	local advice_key = "phar_campaign_advisor_bankruptcy_02";	

	local infotext = {
		"phar_camp_info_bankruptcy_11",
		"phar_camp_info_bankruptcy_12",
		"phar_camp_info_bankruptcy_13",
		"phar_camp_info_bankruptcy_14",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	

	--
	-- intervention configuration
	new_intervention:give_priority_to_intervention("MANAGEMENT_near_bankruptcy");
	new_intervention:add_whitelist_event_type("faction_resource_shortageevent_feed_target_faction");


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionTurnStart",
		function(context)
			local faction = context:faction();

			for resource_key, threshold_value in pairs(pooled_resource_trigger_thresholds) do
				local pooled_resource = faction:pooled_resource(resource_key);
				if not pooled_resource:is_null_interface() and pooled_resource:income() < 0 and pooled_resource:value() < threshold_value then
					new_intervention.resource_key = resource_key;
					return true;
				end;
			end;
			return false;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;













---------------------------------------------------------------
--
--	MANAGEMENT_provincial_growth
--
---------------------------------------------------------------

do
	local name = "MANAGEMENT_provincial_growth";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = 4;					-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Healthy growth in a province leads to the expansion of your cities and an increase in the benefits they bring. The populace thrives here, so the cities are ripe for improvement.
	local advice_key = "phar_campaign_advisor_population_growth_01";	

	local infotext = {
		"troy_camp_info_provincial_growth_01",
		"phar_camp_info_provincial_growth_02",
		"phar_camp_info_provincial_growth_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	--
	-- intervention configuration


	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_precondition(
		function()
			-- return true if the player faction is not horde
			return cm:get_faction(cm:get_local_faction_name()):is_allowed_to_capture_territory();
		end,
		"player must not be a horde faction"
	);



	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionTurnStart",
		function(context)
			local region_list = context:faction():region_list();
			for i = 0, region_list:num_items() - 1 do
				if region_list:item_at(i):has_development_points_to_upgrade() then
					new_intervention.region_name = region_list:item_at(i):name();
					return true;
				end;
			end;
			return false;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
			uim:highlight_settlement("settlement:" .. new_intervention.region_name, "select_vfx")
			stop_highlight_growth()
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);

	-- stop highlight triggered from this intervention
	function stop_highlight_growth()
		cm:callback(
			function()
				uim:unhighlight_settlement("settlement:" .. new_intervention.region_name, true)
			end,
			5
		)
	end

end;













---------------------------------------------------------------
--
--	MANAGEMENT_horde_growth
--
---------------------------------------------------------------

do
	local name = "MANAGEMENT_horde_growth";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Praise the gods, more followers flock to your banner! Your encampment grows, rivalling the cities of men!
	local advice_key = "troy_campaign_advisor_growth_002";	

	local infotext = {
		"troy_camp_info_horde_growth_01",
		"troy_camp_info_horde_growth_02",
		"troy_camp_info_horde_growth_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	

	--
	-- intervention configuration
	

	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_precondition(
		function()
			-- return true if the player faction is horde
			return not cm:get_faction(cm:get_local_faction_name()):is_allowed_to_capture_territory();
		end,
		"player must be a horde faction"
	);


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"MilitaryForceDevelopmentPointChange",
		function(context)
			local mf_faction = context:military_force():faction();
			
			if mf_faction:name() ~= cm:get_local_faction_name() then
				return false;
			end;
			
			if mf_faction:name() == cm:get_local_faction_name() and context:point_change() > 0 and context:military_force():has_general() then
				new_intervention.char_cqi = context:military_force():general_character():cqi();
				return true;
			end;
			return false;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:scroll_camera_to_character_for_intervention(
				new_intervention.char_cqi,					-- target character cqi
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;












---------------------------------------------------------------
--
--	MANAGEMENT_happiness_warning
--
---------------------------------------------------------------

do
	local name = "MANAGEMENT_happiness_warning";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Should mutters of discontent reach your ears, discourage open rebellion with threats of force. Or perhaps not, for a wise ruler knows that contented subjects mean a long and happy reign.
	local advice_key = "phar_campaign_advisor_happiness_01";	

	local infotext = {
		"phar_camp_info_happiness_01",
		"phar_camp_info_happiness_02",
		"phar_camp_info_happiness_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	--
	-- intervention configuration


	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_precondition(
		function()
			-- return true if the player faction is not horde
			return cm:get_faction(cm:get_local_faction_name()):is_allowed_to_capture_territory();
		end,
		"player must not be a horde faction"
	);


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionTurnStart",
		function(context)
			local region_list = context:faction():region_list();

			local lowest_public_order = 100;
			local lowest_public_order_region = false;

			for i = 0, region_list:num_items() - 1 do
				local current_region_public_order = region_list:item_at(i):public_order();
				if current_region_public_order < lowest_public_order then
					lowest_public_order = current_region_public_order;
					lowest_public_order_region = region_list:item_at(i);
				end;
			end;

			if lowest_public_order < -35 then
				if lowest_public_order_region:is_province_capital() then
					new_intervention.region_key = lowest_public_order_region:name();
				else
					local province_capital_region = cm:get_province_capital_for_region(lowest_public_order_region);
					if province_capital_region:owning_faction() == context:faction() then
						new_intervention.region_key = province_capital_region:name();
					else
						new_intervention.region_key = lowest_public_order_region:name();
					end;
				end;
				return true;
			end;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:scroll_camera_to_settlement_for_intervention(
				new_intervention.region_key,				-- region key
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;













---------------------------------------------------------------
--
--	MANAGEMENT_rebellion_imminent
--
---------------------------------------------------------------

do
	local name = "MANAGEMENT_rebellion_imminent";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Discontented mutters have become angry shouts! You will soon have a rebellion on your hands!
	local advice_key = "phar_campaign_advisor_happiness_rebellion_imminent_01";	

	local infotext = {
		"phar_camp_info_happiness_rebellion_imminent_01",
		"phar_camp_info_happiness_rebellion_imminent_02",
		"phar_camp_info_happiness_rebellion_imminent_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	--
	-- intervention configuration
	new_intervention:add_whitelist_event_type("provinces_unrest_imminent_rebellionevent_feed_target_province_faction");

	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_precondition(
		function()
			-- return true if the player faction is not horde
			return cm:get_faction(cm:get_local_faction_name()):is_allowed_to_capture_territory();
		end,
		"player must not be a horde faction"
	);


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionEventFeedEventRecorded",
		function(context)
			return context.string == "provinces_unrest_imminent_rebellion";
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;












---------------------------------------------------------------
--
--	DIPLOMACY_screen_opened
--
---------------------------------------------------------------

do
	local name = "DIPLOMACY_screen_opened";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;				-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Relations with foreign powers may be managed through diplomacy. Broker treaties of trade, alliance, war and peace to either provoke or placate your fellow rulers. Always be aware that others may view your negotiations as a threat... or an opportunity.
	local advice_key = "phar_campaign_advisor_diplomacy_intro_01";	

	local infotext = {
		"troy_camp_info_diplomacy_01",
		"phar_camp_info_diplomacy_02",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	--
	-- intervention configuration


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventDiplomacyPanelOpened",
		function()
			-- only trigger if it's the player's turn
			return cm:whose_turn_is_it() == cm:get_local_faction_name();
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()	
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;






-- Local function for specific advice monitors - they call this when their condition passes, locking advice audio and preventing the foreign diplomat VO from being played.
-- This accelerates the display of the diplomatic deal, allowing advice to be triggered in a timely and pleasing manner. The lock is later released when the diplomacy
-- panel closes. This function stops getting called when none of the foreign diplomacy advice triggers are active.
local function disable_diplomacy_audio_for_advice()
	uim:lock_diplomacy_audio();

	core:add_listener(
		"disable_diplomacy_audio_for_advice",
		"ScriptEventDiplomacyPanelClosed",
		true,
		function(context)
			uim:unlock_diplomacy_audio();
		end,
		false
	);
end;










---------------------------------------------------------------
--
--	DIPLOMACY_foreign
--
---------------------------------------------------------------

do
	local name = "DIPLOMACY_foreign";						-- Unique string name for this intervention
	local cost = INTERVENTION_COST_NO_COST;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;				-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = true;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- A rival power proposes a change in your relationship. Their offer may merit some consideration.
	local interactive_advice_key = "phar_campaign_advisor_diplomacy_02";

	-- It appears that a rival wishes to revisit an existing treaty with you.
	local non_interactive_advice_key = "phar_campaign_advisor_diplomacy_01";

	local infotext = {
		"troy_camp_info_diplomacy_01",
		"phar_camp_info_diplomacy_02",
		"phar_camp_info_diplomacy_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, {interactive_advice_key, non_interactive_advice_key}, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	--
	-- intervention configuration


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventDiplomacyPanelOpened",
		function()
			-- only trigger if it's not the player's turn
			if cm:whose_turn_is_it() ~= cm:get_local_faction_name() and core:get_advice_level() >= advice_level then
				-- lock the diplomacy audio at this time, which has the effect that the ui tries to bring 
				-- forward the showing of offer components (which we use to test the panel context)
				disable_diplomacy_audio_for_advice();
				return true;
			end;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()	
			
			core:add_listener(
				name,
				"ScriptEventDiplomacyPanelContext",
				true,
				function(context) 
					local diplomacy_context = context.string;

					-- if the context is not "interactive" or "noninteractive" then cancel and exit
					if diplomacy_context ~= "interactive" and diplomacy_context ~= "noninteractive" then
						new_intervention:cancel();
						return;
					end;
				
					new_intervention:play_advice_for_intervention(
						-- advice key
						diplomacy_context == "interactive" and interactive_advice_key or non_interactive_advice_key,
						infotext,									-- infotext
						nil											-- mission manager
					);
					auto_clear_advice_delayed()
				end,
				false
			);
			
			cm:start_diplomacy_panel_context_listener();
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;













---------------------------------------------------------------
--
--	DIPLOMACY_foreign_war
--
---------------------------------------------------------------

do
	local name = "DIPLOMACY_foreign_war";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_NO_COST;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;				-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = true;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- War is declared! The time for diplomacy is past. Only battle will settle your differences now.
	local advice_key = "phar_campaign_advisor_war_01";

	local infotext = {
		"troy_camp_info_war_01",
		"phar_camp_info_war_02",
		"phar_camp_info_war_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	--
	-- intervention configuration


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventDiplomacyPanelOpened",
		function()
			-- only trigger if it's not the player's turn
			if cm:whose_turn_is_it() ~= cm:get_local_faction_name() and core:get_advice_level() >= advice_level then
				-- lock the diplomacy audio at this time, which has the effect that the ui tries to bring 
				-- forward the showing of offer components (which we use to test the panel context)
				disable_diplomacy_audio_for_advice();
				return true;
			end;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()	
			core:add_listener(
				name,
				"ScriptEventDiplomacyPanelContext",
				true,
				function(context)
					local diplomacy_context = context.string;

					-- if the context is not "war" then cancel and exit
					if diplomacy_context ~= "war" then
						new_intervention:cancel();
						return;
					end;
				
					new_intervention:play_advice_for_intervention(
						-- advice key
						advice_key,
						infotext,									-- infotext
						nil											-- mission manager
					);
					auto_clear_advice_delayed()
				end,
				false
			);
			
			cm:start_diplomacy_panel_context_listener();
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;













---------------------------------------------------------------
--
--	DIPLOMACY_war_warning
--
---------------------------------------------------------------

do
	local name = "DIPLOMACY_war_warning";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Do you serve the cause of Ares? War will surely follow, should you take this action. 
	local advice_key = "phar_campaign_advisor_war_02";

	local infotext = {
		"troy_camp_info_war_01",
		"phar_camp_info_war_02",
		"phar_camp_info_war_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	
	

	--
	-- intervention configuration


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventMoveOptionsPanelOpened",
		true
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			-- if the dialog is closed before the advice is shown then cancel
			core:add_listener(
				name,
				"PanelClosedCampaign",
				function(context) return context.string == "move_options" end,
				function() 
					cm:remove_callback(name);
					new_intervention:cancel();
				end,
				false
			);
			
			cm:callback(
				function()
					core:remove_listener(name);
					
					new_intervention:play_advice_for_intervention(
						-- advice key
						advice_key,
						infotext,									-- infotext
						nil											-- mission manager
					);
					auto_clear_advice_delayed()
				end,
				0.5
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;













---------------------------------------------------------------
--
--	DIPLOMACY_alliances
--
---------------------------------------------------------------

do
	local name = "DIPLOMACY_alliances";						-- Unique string name for this intervention
	local cost = 20;										-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;				-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = true;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- A foreign power seeks to ally with you. If it is to your advantage, accept the offer of a treaty. If not, then make your disdain clear.
	local advice_key = "phar_campaign_advisor_alliances_01";	

	local infotext = {
		"troy_camp_info_alliances_01",
		"phar_camp_info_alliances_02",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	
	

	--
	-- intervention configuration


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventDiplomacyPanelOpened",
		function()
			-- only trigger if it's not the player's turn
			if cm:whose_turn_is_it() ~= cm:get_local_faction_name() and core:get_advice_level() >= advice_level then
				-- lock the diplomacy audio at this time, which has the effect that the ui tries to bring 
				-- forward the showing of offer components (which we use to test the panel context)
				disable_diplomacy_audio_for_advice();
				return true;
			end;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			core:add_listener(
				name,
				"ScriptEventDiplomacyPanelContext",
				true,
				function(context)
					local diplomacy_context = context.string;

					-- if the context is not alliance then return
					if diplomacy_context ~= "alliance" then
						new_intervention:cancel();
						return;
					end;
				
					new_intervention:play_advice_for_intervention(
						advice_key, 								-- advice key
						infotext,									-- infotext
						nil											-- mission manager
					);
					auto_clear_advice_delayed()
				end,
				false
			);
			
			cm:start_diplomacy_panel_context_listener();
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;













---------------------------------------------------------------
--
--	DIPLOMACY_non_aggression_pact
--
---------------------------------------------------------------

do
	local name = "DIPLOMACY_non_aggression_pact";			-- Unique string name for this intervention
	local cost = 20;										-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;				-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = true;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Foreign emissaries seek a pact of non-aggression. If their offer is acceptable, it may lead to improved trade relations or even a formal alliance.
	local advice_key = "phar_campaign_advisor_non_aggression_pact_01";	

	local infotext = {
		"phar_camp_info_non_aggression_pact_01",
		"phar_camp_info_non_aggression_pact_02",
		"phar_camp_info_non_aggression_pact_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	
	

	--
	-- intervention configuration


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventDiplomacyPanelOpened",
		function()
			-- only trigger if it's not the player's turn
			if cm:whose_turn_is_it() ~= cm:get_local_faction_name() and core:get_advice_level() >= advice_level then
				-- lock the diplomacy audio at this time, which has the effect that the ui tries to bring 
				-- forward the showing of offer components (which we use to test the panel context)
				disable_diplomacy_audio_for_advice();
				return true;
			end;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			-- disables diplomacy audio, which has the effect that the ui tries to bring 
			-- forward the showing of offer components (which we use to test the panel context)
			uim:lock_diplomacy_audio();
			
			core:add_listener(
				name,
				"ScriptEventDiplomacyPanelContext",
				true,
				function(context)
					local diplomacy_context = context.string;
					
					-- if the context is not alliance then return
					if diplomacy_context ~= "nap" then
						new_intervention:cancel();
						return;
					end;
					
					new_intervention:play_advice_for_intervention(
						advice_key, 								-- advice key
						infotext,									-- infotext
						nil											-- mission manager
					);
					auto_clear_advice_delayed()
				end,
				false
			);
			
			cm:start_diplomacy_panel_context_listener();
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;


---------------------------------------------------------------
--
--	DIPLOMACY_trade
--
---------------------------------------------------------------

do
	local name = "DIPLOMACY_trade";							-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;				-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = true;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_trade_agreement_01";

	local infotext = {
		"phar_camp_info_trade_agreement_01",
		"phar_camp_info_trade_agreement_02",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	
	

	--
	-- intervention configuration


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventDiplomacyPanelOpened",
		function()
			-- only trigger if it's not the player's turn
			if cm:whose_turn_is_it() ~= cm:get_local_faction_name() and core:get_advice_level() >= advice_level then
				-- lock the diplomacy audio at this time, which has the effect that the ui tries to bring 
				-- forward the showing of offer components (which we use to test the panel context)
				disable_diplomacy_audio_for_advice();
				return true;
			end;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()	
			core:add_listener(
				name,
				"ScriptEventDiplomacyPanelContext",
				true,
				function(context)
					local diplomacy_context = context.string;

					-- if the context is not "interactive" then cancel and exit
					if diplomacy_context ~= "interactive" then
						new_intervention:cancel();
						return;
					end;
				
					new_intervention:play_advice_for_intervention(
						-- advice key
						advice_key,
						infotext,									-- infotext
						nil											-- mission manager
					);
					auto_clear_advice_delayed()
				end,
				false
			);
			
			cm:start_diplomacy_panel_context_listener();
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;











---------------------------------------------------------------
--
--	PREBATTLE_normal
--
---------------------------------------------------------------

do
	local name = "PREBATTLE_normal";						-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = true;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = true;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Battle is imminent! Though Zeus knows all, you do not; you would be wise to study all possible options before taking the field.
	local advice_key = "phar_campaign_advisor_pre_battle_options_01";

	local infotext = {
		"phar_camp_info_pre_battle_options_land_01",
		"troy_camp_info_pre_battle_options_02",
		"troy_camp_info_pre_battle_options_03",
	};

	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	
	

	--
	-- intervention configuration


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPreBattlePanelOpenedField",
		function(context)
			local player_strength = 0;
			
			-- determine player's relative strength in this battle
			if cm:pending_battle_cache_faction_is_attacker(cm:get_local_faction_name()) then
				player_strength = cm:model():pending_battle():attacker_strength();
			else
				player_strength = cm:model():pending_battle():defender_strength();
			end;
			
			-- return true if the player has a reasonable chance of victory, or if it's not the player's turn
			return player_strength >= 50;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			-- if the player closes panel immediately then cancel
			core:add_listener(
				name,
				"PanelClosedCampaign",
				function(context) return context.string == "popup_pre_battle" end,
				function()
					cm:remove_callback(name);
					new_intervention:cancel();
				end,
				false
			);
			
			cm:callback(
				function()
					core:remove_listener(name);
					new_intervention:play_advice_for_intervention(
						advice_key, 								-- advice key
						infotext,									-- infotext
						nil											-- mission manager
					);
					auto_clear_advice_delayed()
					local uic_target_paths = {
						core:get_ui_root():SequentialFind( "battle_deployment", "regular_deployment", "button_set_attack" );
					};
					advice_component_table_highlight(uic_target_paths) -- highlight_component_table is used
				end,
				0.5,
				listener_str
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;










---------------------------------------------------------------
--
--	PREBATTLE_outmatched
--
---------------------------------------------------------------

do
	local name = "PREBATTLE_outmatched";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = true;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = true;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- The enemy mass in great strength against you. A tactical withdrawal may be wise.
	local advice_key = "phar_campaign_advisor_pre_battle_options_02";	

	local infotext = {
		"troy_camp_info_pre_battle_options_01",
		"troy_camp_info_pre_battle_options_02",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	
	

	--
	-- intervention configuration


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPreBattlePanelOpenedField",
		function(context)
			local player_strength = 0;
			local pb = cm:model():pending_battle();
			
			-- determine player's relative strength in this battle
			if cm:pending_battle_cache_faction_is_attacker(cm:get_local_faction_name()) then
				player_strength = pb:attacker_strength();
			else
				player_strength = pb:defender_strength();
			end;
			
			-- return true if victory is unsure and it's the player's turn
			return player_strength < 50 and cm:is_local_players_turn();
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			-- if the player closes panel immediately then cancel
			core:add_listener(
				name,
				"PanelClosedCampaign",
				function(context) return context.string == "popup_pre_battle" end,
				function()
					cm:remove_callback(name);
					new_intervention:cancel();
				end,
				false
			);
			
			cm:callback(
				function()
					core:remove_listener(name);
					new_intervention:play_advice_for_intervention(
						advice_key, 								-- advice key
						infotext,									-- infotext
						nil											-- mission manager
					);
					auto_clear_advice_delayed()
				end,
				0.5,
				listener_str
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;













---------------------------------------------------------------
--
--	PREBATTLE_minor_settlement
--
---------------------------------------------------------------

do
	local name = "PREBATTLE_minor_settlement";				-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = true;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Your warriors have reached the city. Though they no doubt long for battle, consider instead a siege, encircling the enemy and starving them out.
	local advice_key = "phar_campaign_advisor_pre_battle_options_03";

	local infotext = {
		"phar_camp_info_pre_battle_options_settlement_01",
		"phar_camp_info_pre_battle_options_04",
		"troy_camp_info_pre_battle_options_02",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	
	

	--
	-- intervention configuration


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPreBattlePanelOpenedMinorSettlement",
		function(context)
			return cm:is_local_players_turn() and cm:pending_battle_cache_faction_is_attacker(cm:get_local_faction_name());
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			-- if the player closes panel immediately then cancel
			core:add_listener(
				name,
				"PanelClosedCampaign",
				function(context) return context.string == "popup_pre_battle" end,
				function()
					cm:remove_callback(name);
					new_intervention:cancel();
				end,
				false
			);
			
			cm:callback(
				function()
					core:remove_listener(name);
					new_intervention:play_advice_for_intervention(
						advice_key, 								-- advice key
						infotext,									-- infotext
						nil											-- mission manager
					);
					auto_clear_advice_delayed()
					local uic_target_paths = {
						core:get_ui_root():SequentialFind( "battle_deployment", "regular_deployment", "button_set_siege" );
					};
					advice_component_table_highlight(uic_target_paths) -- highlight_component_table is used
				end,
				0.5,
				listener_str
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;













---------------------------------------------------------------
--
--	PREBATTLE_enemy_reinforcements
--
---------------------------------------------------------------

do
	local name = "PREBATTLE_enemy_reinforcements";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_HIGH;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = true;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = true;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Beware – the enemy brings reinforcements to the battle! If you commit to the fray, you will be facing threats on multiple fronts. 
	local advice_key = "phar_campaign_advisor_reinforcements_01";	

	local infotext = {
		"troy_camp_info_reinforcements_01",
		"troy_camp_info_reinforcements_02",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	
	

	--
	-- intervention configuration


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPreBattlePanelOpened",
		function(context)
			-- don't proceed if this is a siege or ambush battle
			local battle_type = cm:model():pending_battle():battle_type();
			if string.find(battle_type, "settlement") or string.find(battle_type, "ambush") then
				return false;
			end;
			
			-- don't proceed if this is a quest battle
			if cm:pending_battle_cache_is_quest_battle() then
				return false;
			end;
			
			if cm:pending_battle_cache_faction_is_attacker(cm:get_local_faction_name()) then
				if cm:pending_battle_cache_num_defenders() > 1 then
					return true;
				end;
			else
				if cm:pending_battle_cache_num_attackers() > 1 then
					return true;
				end;
			end;
			
			return false;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			-- if the player closes panel immediately then cancel
			core:add_listener(
				name,
				"PanelClosedCampaign",
				function(context) return context.string == "popup_pre_battle" end,
				function()
					cm:remove_callback(name);
					new_intervention:cancel();
				end,
				false
			);
			
			cm:callback(
				function()
					core:remove_listener(name);
					new_intervention:play_advice_for_intervention(
						advice_key, 								-- advice key
						infotext,									-- infotext
						nil											-- mission manager
					);
					auto_clear_advice_delayed()
					local uic_target_paths = {
						core:get_ui_root():SequentialFind( "enemy_combatants_panel", "army", "units_and_banners_parent", "units_window", "listview", "list_clip", "list_box", "commander_header_1" );
					};
					advice_component_table_highlight(uic_target_paths) -- highlight_component_table is used
				end,
				0.5,
				listener_str
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;













---------------------------------------------------------------
--
--	PREBATTLE_player_reinforcements
--
---------------------------------------------------------------

do
	local name = "PREBATTLE_player_reinforcements";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_HIGH;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = true;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = true;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Ares smiles upon you. Reinforcements stand by to lend aid in the coming battle. 
	local advice_key = "phar_campaign_advisor_reinforcements_02";	

	local infotext = {
		"troy_camp_info_reinforcements_01",
		"troy_camp_info_reinforcements_02",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	
	

	--
	-- intervention configuration


	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	
	-- return true if the player is not penthesilea
	new_intervention:add_player_not_faction_precondition("troy_amazons_trj_penthesilea");


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPreBattlePanelOpened",
		function(context)
			-- don't proceed if this is a siege or ambush battle
			local battle_type = cm:model():pending_battle():battle_type();
			if string.find(battle_type, "settlement") or string.find(battle_type, "ambush") then
				return false;
			end;
			
			-- don't proceed if this is a quest battle
			if cm:pending_battle_cache_is_quest_battle() then
				return false;
			end;
			
			if cm:pending_battle_cache_faction_is_attacker(cm:get_local_faction_name()) then
				if cm:pending_battle_cache_num_attackers() > 1 then
					return true;
				end;
			else
				if cm:pending_battle_cache_num_defenders() > 1 then
					return true;
				end;
			end;
			
			return false;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			-- if the player closes panel immediately then cancel
			core:add_listener(
				name,
				"PanelClosedCampaign",
				function(context) return context.string == "popup_pre_battle" end,
				function()
					cm:remove_callback(name);
					new_intervention:cancel();
				end,
				false
			);
			
			cm:callback(
				function()
					core:remove_listener(name);
					new_intervention:play_advice_for_intervention(
						advice_key, 								-- advice key
						infotext,									-- infotext
						nil											-- mission manager
					);
					auto_clear_advice_delayed()
				end,
				0.5,
				listener_str
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;













---------------------------------------------------------------
--
--	PREBATTLE_ambush_defence
--
---------------------------------------------------------------

do
	local name = "PREBATTLE_ambush_defence";				-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = true;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = true;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- An ambush! Your warriors are surrounded!
	local advice_key = "phar_campaign_advisor_ambushes_01";	

	local infotext = {
		"troy_camp_info_ambushes_01",
		"phar_camp_info_ambushes_02",
		"phar_camp_info_ambushes_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	
	

	--
	-- intervention configuration


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPreBattlePanelOpenedAmbushPlayerDefender",
		true
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			-- if the player closes panel immediately then cancel
			core:add_listener(
				name,
				"PanelClosedCampaign",
				function(context) return context.string == "popup_pre_battle" end,
				function()
					cm:remove_callback(name);
					new_intervention:cancel();
				end,
				false
			);
			
			cm:callback(
				function()
					core:remove_listener(name);
					new_intervention:play_advice_for_intervention(
						advice_key, 								-- advice key
						infotext,									-- infotext
						nil											-- mission manager
					);
					auto_clear_advice_delayed()
				end,
				0.5,
				listener_str
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;













---------------------------------------------------------------
--
--	POSTBATTLE_field_victory
--
---------------------------------------------------------------

do
	local name = "POSTBATTLE_field_victory";				-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = true;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = true;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- You are triumphant! Now you must decide the fate of the captives taken in battle. You may punish them for taking up arms against you, or choose the path of mercy instead.
	local advice_key = "phar_campaign_advisor_victory_options_01";	

	local infotext = {
		"troy_camp_info_post_battle_options_01",
		"phar_camp_info_post_battle_options_field_02",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	
	

	--
	-- intervention configuration


	--
	-- trigger conditions - controls when the intervention can trigger	
	new_intervention:add_trigger_condition(
		"PanelOpenedCampaign",
        function(context)
			if is_tutorial_mode() then
				return not ftue_event_overrides 
			elseif context.string == "popup_battle_results" then
				local pb = cm:model():pending_battle()
				if cm:pending_battle_cache_faction_is_attacker(cm:get_local_faction_name()) and not pb:has_contested_garrison() then
					return true
				end
			end
		end
	);



	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			-- if the player closes panel immediately then cancel
			core:add_listener(
				name,
				"PanelClosedCampaign",
				function(context) return context.string == "popup_battle_results" end,
				function()
					cm:remove_callback(name);
					new_intervention:cancel();
				end,
				false
			);
			
			cm:callback(
				function()
					core:remove_listener(name);
					new_intervention:play_advice_for_intervention(
						advice_key, 								-- advice key
						infotext,									-- infotext
						nil											-- mission manager
					);
					auto_clear_advice_delayed()
					local uic_target_paths = {
						core:get_ui_root():SequentialFind( "battle_results", "button_set_win_holder", "button_set_win" );
					};
					advice_component_table_highlight(uic_target_paths) -- highlight_component_table is used
				end,
				0.5,
				listener_str
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;













---------------------------------------------------------------
--
--	POSTBATTLE_field_defeat
--
---------------------------------------------------------------

do
	local name = "POSTBATTLE_field_defeat";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_HIGH;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = true;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = true;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- The gods turned their faces from you today. But one defeat is not the end of the war. Learn from this, and return to the field stronger and more determined!
	local advice_key = "phar_campaign_advisor_post_battle_defeat_01";	

	local infotext = {};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	
	

	--
	-- intervention configuration


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerLosesFieldBattle",
		function() 
			if is_tutorial_mode() then
				return not ftue_event_overrides 
			else
				return true
			end
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			-- if the player closes panel immediately then cancel
			core:add_listener(
				name,
				"PanelClosedCampaign",
				function(context) return context.string == "popup_pre_battle" end,
				function()
					cm:remove_callback(name);
					new_intervention:cancel();
				end,
				false
			);
			
			cm:callback(
				function()
					core:remove_listener(name);
					new_intervention:play_advice_for_intervention(
						advice_key, 								-- advice key
						infotext,									-- infotext
						nil											-- mission manager
					);
					auto_clear_advice_delayed()
				end,
				0.5,
				listener_str
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;












---------------------------------------------------------------
--
--	POSTBATTLE_settlement_victory
--
---------------------------------------------------------------

do
	local name = "POSTBATTLE_settlement_victory";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_NO_COST;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = true;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = true;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- The city is yours to do with as you please. Claim it as your own, sack it, or raze it to the ground, leaving only ruins.
	local advice_key = "phar_campaign_advisor_conquering_settlements_02";	

	local infotext = {
		"troy_camp_info_post_battle_options_01",
		"phar_camp_info_post_battle_options_02",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	
	

	--
	-- intervention configuration
	new_intervention:set_must_trigger(true)

	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_precondition(
		function()
			-- return true if the player faction is not horde
			return cm:get_faction(cm:get_local_faction_name()):is_allowed_to_capture_territory();
		end,
		"player must not be a horde faction"
	);

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"BattleConflictFinished",
		function()
			local pb = cm:model():pending_battle()
			if not pb:has_contested_garrison() then
				return false
			end
			-- only trigger if the pending battle is at a settlement that the player doesn't own
			local local_faction = cm:get_local_faction_name()
			local primary_attacker_is_local_player = cm:pending_battle_cache_get_attacker_faction_name(1) == local_faction
			local battle_is_not_sally_out = pb:region():owning_faction():name() ~= local_faction
			return primary_attacker_is_local_player and battle_is_not_sally_out
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			-- listen for the settlement captured panel being opened and deliver advice
			core:add_listener(
				name,
				"PanelOpenedCampaign",
				function(context) return context.string == "settlement_captured" end,
				function()
					cm:remove_callback(name);
					new_intervention:play_advice_for_intervention(
						advice_key, 								-- advice key
						infotext,									-- infotext
						nil											-- mission manager
					);
					auto_clear_advice_delayed()
					local uic_target_paths = {
						core:get_ui_root():SequentialFind( "settlement_captured", "button_parent" );
					};
					advice_component_table_highlight(uic_target_paths) -- highlight_component_table used
				end,
				false
			);
			
			-- failsafe - poll whether we're in a battle sequence still, and cancel the intervention if we're not
			cm:repeat_callback(
				function()
					if not cm:is_processing_battle() then
						cm:remove_callback(name);
						script_error("WARNING: cancelling intervention " .. name .. " as we have exited a battle sequence. How has this happened?");
						new_intervention:cancel();
					end;
				end,
				0.5,
				name
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;











---------------------------------------------------------------
--
--	POSTBATTLE_penthesilea_razing
--
---------------------------------------------------------------
--[[
do
	local name = "POSTBATTLE_penthesilea_razing";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = true;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = true;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- No true Daughter of Ares accepts the settled life. When you conquer a settlement you can enslave its occupants into your army before burning it to the ground, or merely raze the place to ashes and leave.
	local advice_key = "troy_campaign_advisor_conquering_settlements_penthesilea_02";

	local infotext = {};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	

	--
	-- intervention configuration


	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_amazons_trj_penthesilea");


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerWinsSettlementAttackBattle",
		function()
			-- only trigger if the pending battle is at a settlement that the player doesn't own
			local pb = cm:model():pending_battle();
			return pb:has_contested_garrison() and pb:contested_garrison():faction():name() ~= cm:get_local_faction_name();
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			-- listen for the settlement captured panel being opened and deliver advice
			core:add_listener(
				name,
				"PanelOpenedCampaign",
				function(context) return context.string == "settlement_captured" end,
				function()
					cm:remove_callback(name);
					new_intervention:play_advice_for_intervention(
						advice_key, 								-- advice key
						infotext,									-- infotext
						nil											-- mission manager
					);
				end,
				false
			);
			
			-- failsafe - poll whether we're in a battle sequence still, and cancel the intervention if we're not
			cm:repeat_callback(
				function()
					if not cm:is_processing_battle() then
						cm:remove_callback(name);
						script_error("WARNING: cancelling intervention " .. name .. " as we have exited a battle sequence. How has this happened?");
						new_intervention:cancel();
					end;
				end,
				0.5,
				name
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;
]]










---------------------------------------------------------------
--
--	POSTBATTLE_building_repair
--
---------------------------------------------------------------

do
	local name = "POSTBATTLE_building_repair";				-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Empires are given form by the houses and temples their rulers raise and maintain. These buildings need attention if they are to reflect your true glory and ambition.
	local advice_key = "phar_campaign_advisor_building_repair_01";

	local infotext = {
		"phar_camp_info_building_repair_01",
		"phar_camp_info_building_repair_02",
		"phar_camp_info_building_repair_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	
	

	--
	-- intervention configuration


	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_precondition(
		function()
			-- return true if the player faction is not horde
			return cm:get_faction(cm:get_local_faction_name()):is_allowed_to_capture_territory();
		end,
		"player must not be a horde faction"
	);


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFoughtBattleSequenceCompleted",
		function(context)
			-- trigger if the pending battle took place at a settlement now owned by the player that has damaged buildings
			local pb = cm:model():pending_battle();
			if pb:has_contested_garrison() then
				local gr = pb:contested_garrison();
				
				if gr:region():owning_faction():name() == cm:get_local_faction_name() then
					local slot_list = gr:region():slot_list();
					for i = 0, slot_list:num_items() - 1 do
						if slot_list:item_at(i):has_building() and slot_list:item_at(i):building():percent_health() < 100 then
							new_intervention.region_key = gr:region():name();
							return true;
						end;
					end;
				end;
			end;
			return false;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(  -- previous setup - new_intervention:scroll_camera_to_settlement_for_intervention(
				-- new_intervention.region_key,				-- target region key
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
			uim:highlight_settlement("settlement:" .. new_intervention.region_key, "select_vfx")
			stop_highlight_repair()
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);

	-- stop highlight triggered from this intervention
	function stop_highlight_repair()
		cm:callback(
			function()
				uim:unhighlight_settlement("settlement:" .. new_intervention.region_key, true)
			end,
			5
		)
	end

end;











---------------------------------------------------------------
--
--	ARMIES_attrition
--
---------------------------------------------------------------

do
	local name = "ARMIES_attrition";						-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Your warriors are suffering! Move them away from this accursed place before these conditions make them unfit for war.
	local advice_key = "phar_campaign_advisor_attrition_01";	

	local infotext = {
		"troy_camp_info_attrition_01",
		"phar_camp_info_attrition_02",
		"phar_camp_info_attrition_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	
	

	--
	-- intervention configuration


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"CharacterEntersAttritionalArea",
		function(context)
			if context:character():faction():name() == cm:get_local_faction_name() then
				new_intervention.char_cqi = context:character():cqi();
				return true;
			end;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:scroll_camera_to_character_for_intervention(
				new_intervention.char_cqi,					-- target character cqi
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;













---------------------------------------------------------------
--
--	ARMIES_multi_turn_recruitment
--
---------------------------------------------------------------

do
	local name = "ARMIES_multi_turn_recruitment";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Whilst your enthusiasm for expanding your armies is commendable, there is a limit to how many new recruits can be trained at once. Your most recent recruits will receive their training in due course.
	local advice_key = "phar_campaign_advisor_multi_turn_recruitment_01";	

	local infotext = {
		"troy_camp_info_unit_recruitment_01",
		"phar_camp_info_unit_recruitment_02",
		"troy_camp_info_unit_recruitment_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	
	

	--
	-- intervention configuration


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"RecruitmentItemIssuedByPlayer",
		function(context)
			if context:time_to_build() < 2 then
				return false;
			end;
			
			-- also find the local recruitment queue capacity list and ensure that it's full
			local uic_capacity_list = find_uicomponent(core:get_ui_root(), "units_panel", "main_units_panel", "local1", "recruitment_cap", "capacity_listview");
			
			if uic_capacity_list then
				for i = 0, uic_capacity_list:ChildCount() - 1 do
					local uic_child = UIComponent(uic_capacity_list:Find(i));
					
					if uic_child:Id() ~= "used_slot" then
						return false;
					end;
				end;
			end;
			
			return true;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(	-- new_intervention:scroll_camera_to_character_for_intervention(
				-- new_intervention.char_cqi,					-- target character cqi
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;













---------------------------------------------------------------
--
--	ARMIES_sea_battles
--
---------------------------------------------------------------

do
	local name = "ARMIES_sea_battles";						-- Unique string name for this intervention
	local cost = INTERVENTION_COST_HIGH;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = 12;					-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Battles may be fought by seaborne armies. These warriors will engage each other on one of the many tiny islands scattered throughout the Aegean.
	local advice_key = "phar_campaign_advisor_battle_seaborne_01";	

	local infotext = {};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	
	

	--
	-- intervention configuration


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionTurnStart",
		function(context)
			-- return true if we find a player mf with a sea region within 10 hexes of a visible enemy mf that's also at sea
			local mf_list = context:faction():military_force_list();
			local enemy_factions = context:faction():factions_at_war_with();
			for i = 0, mf_list:num_items() - 1 do
				local player_mf = mf_list:item_at(i);
				if player_mf:has_general() and player_mf:general_character():is_at_sea() then
					local player_x = player_mf:general_character():logical_position_x();
					local player_y = player_mf:general_character():logical_position_y();
					for j = 0, enemy_factions:num_items() - 1 do
						local enemy_faction_mf_list = enemy_factions:item_at(j):military_force_list();
						--out("\tchecking enemy faction " .. enemy_factions:item_at(j):name() .. " with " .. enemy_faction_mf_list:num_items() .. " military forces");
						for k = 0, enemy_faction_mf_list:num_items() - 1 do
							local current_enemy_mf = enemy_faction_mf_list:item_at(k);
														
							if current_enemy_mf:has_general() then
								local enemy_general = current_enemy_mf:general_character();
								if enemy_general:is_at_sea() and enemy_general:is_visible_to_faction(context:faction():name()) and distance_squared(player_x, player_y, enemy_general:logical_position_x(), enemy_general:logical_position_y()) < 100 then
									new_intervention.char_cqi = player_mf:general_character():command_queue_index();
									return true;
								end;
							end;
						end;
					end;
				end;
			end;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(	-- new_intervention:scroll_camera_to_character_for_intervention(
				-- new_intervention.char_cqi,					-- target character cqi
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;













---------------------------------------------------------------
--
--	ARMIES_unit_exchange
--
---------------------------------------------------------------

do
	local name = "ARMIES_unit_exchange";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_HIGH;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = 12;					-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Even when out in the field, warriors can move between your armies. Ever obedient to your will, two units need only meet in the same location to change places.
	local advice_key = "phar_campaign_advisor_unit_exchange_01";	

	local infotext = {
		"troy_camp_info_unit_exchange_01",
		"phar_camp_info_unit_exchange_02",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	
	

	--
	-- intervention configuration


	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_precondition(
		function()
			-- return true if the player has not closed the unit exchange panel in the past
			return not uim:get_interaction_monitor_state("unit_exchange_panel_closed")
		end,
		"player must not have closed unit exchange panel"
	);

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionTurnStart",
		function(context)
			local mf_list = context:faction():military_force_list();
			local mf_count = 0;
			
			for i = 0, mf_list:num_items() - 1 do
				if not mf_list:item_at(i):is_armed_citizenry() then
					mf_count = mf_count + 1;
					if mf_count > 1 then
						return true;
					end;
				end;
			end;
			
			return false;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;











---------------------------------------------------------------
--
--	ARMIES_unit_merging
--
---------------------------------------------------------------

do
	local name = "ARMIES_unit_merging";						-- Unique string name for this intervention
	local cost = INTERVENTION_COST_HIGH;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = 8;					-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- The troops in this army have suffered grievous losses. Consider combining weakened units, to conserve and build on what strength they have left.
	local advice_key = "phar_campaign_advisor_unit_merging_01";	

	local infotext = {
		"phar_camp_info_unit_merging_01",
		"phar_camp_info_unit_merging_02",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	
	

	--
	-- intervention configuration


	--
	-- trigger conditions - controls when the intervention can trigger
	local function intervention_check(player_faction)
		if not player_faction then
			player_faction = cm:get_faction(cm:get_local_faction_name());
		end;

		local mf_list = player_faction:military_force_list();

		-- return true any of the player's non-armed-citzenry military forces have more than one unit of the same type at less than 50% health	
		for i = 0, mf_list:num_items() - 1 do
			local current_mf = mf_list:item_at(i);
			
			if not current_mf:is_armed_citizenry() then
				local unit_list = current_mf:unit_list();
				
				local damaged_units = {};
				
				for j = 0, unit_list:num_items() - 1 do
					local current_unit = unit_list:item_at(j);
					
					if current_unit:percentage_proportion_of_full_strength() < 50 then
						local unit_key = current_unit:unit_key();
						
						if damaged_units[unit_key] then
							new_intervention.mf_cqi = current_mf:command_queue_index();
							
							if current_mf:has_general() then
								new_intervention.char_cqi = current_mf:general_character():cqi();
							end;
							return true;
						else
							damaged_units[unit_key] = true;
						end;
					end;
				end;
			end;
		end;

		return false;
	end;


	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionTurnStart",
		function(context)
			return intervention_check(context:faction());
		end
	);


	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFoughtBattleSequenceCompleted",
		function(context)
			return intervention_check();
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()				
			new_intervention:scroll_camera_to_character_for_intervention(
				new_intervention.char_cqi,					-- target character cqi
			-- new_intervention:play_advice_for_intervention(	
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
			-- uim:highlight_character(new_intervention.char_cqi, "select_vfx")
			stop_highlight_merge()
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);

	function stop_highlight_merge()
		cm:callback(
			function()
				uim:unhighlight_character(new_intervention.char_cqi, true)
			end,
			5
		)
	end

end;











---------------------------------------------------------------
--
--	ARMIES_unit_replenishment
--
---------------------------------------------------------------

do
	local name = "ARMIES_unit_replenishment";				-- Unique string name for this intervention
	local cost = INTERVENTION_COST_HIGH;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = 4;					-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Though the privations of war may lead to losses, your armies will slowly regain their strength when in friendly territory.
	local advice_key = "phar_campaign_advisor_units_replenishment_01";	

	local infotext = {
		"troy_camp_info_unit_replenishment_01",
		"phar_camp_info_unit_replenishment_02",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	
	

	--
	-- intervention configuration


	--
	-- trigger conditions - controls when the intervention can trigger
	local function faction_check(faction)
		local mf_list = faction:military_force_list();

		for i = 0, mf_list:num_items() - 1 do
			local mf = mf_list:item_at(i);
			if cm:military_force_average_strength(mf) < 90 and mf:has_general() and cm:char_in_owned_region(mf:general_character()) then				
				new_intervention.char_cqi = mf_list:item_at(i):general_character():cqi();
				return true;
			end;
		end;
	end;


	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionTurnStart",
		function(context)		
			return faction_check(context:faction());
		end
	);



	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFoughtBattleSequenceCompleted",
		function(context)
			return faction_check(cm:get_faction(cm:get_local_faction_name()));
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(	-- new_intervention:scroll_camera_to_character_for_intervention(
				-- new_intervention.char_cqi,					-- target character cqi
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
			uim:highlight_character(new_intervention.char_cqi, "select_vfx")
			stop_highlight_replenish()
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);

	function stop_highlight_replenish()
		cm:callback(
			function()
				uim:unhighlight_character(new_intervention.char_cqi, true)
			end,
			5
		)
	end

end;










---------------------------------------------------------------
--
--	ARMIES_sea_travel
--
---------------------------------------------------------------

do
	local name = "ARMIES_sea_travel";						-- Unique string name for this intervention
	local cost = INTERVENTION_COST_HIGH;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = 7;					-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- If you order your army to cross the sea, they will embark on ships. When Poseidon is with them, they may travel as swiftly as the wind!
	local advice_key = "phar_campaign_advisor_naval_travel_01";	

	local infotext = {
		"troy_camp_info_armies_at_sea_01",
		"phar_camp_info_armies_at_sea_02",
		"troy_camp_info_armies_at_sea_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	
	

	--
	-- intervention configuration


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionTurnStart",
		function(context)
			-- return true if any of the player's military forces are either at sea or in a region that contains a port			
			local mf_list = context:faction():military_force_list();
			
			for i = 0, mf_list:num_items() - 1 do
				local current_mf = mf_list:item_at(i);
				
				if not current_mf:is_armed_citizenry() and current_mf:has_general() then
					local char = current_mf:general_character();
					if (char:has_region() and char:region():settlement():is_port())
						or not char:sea_region():is_null_interface() then
						new_intervention.char_cqi = char:cqi();
						return true;
					end;
				end;
			end;
			
			return false;
		end
	);
	
	new_intervention:add_trigger_condition(
		"CharacterFinishedMovingEvent",
		function(context)
			-- return true if the player's military forces are either at sea or in a region that contains a port			
		
			local character = context:character()
			local char_mf = character:military_force()

			if char_mf and not char_mf:is_armed_citizenry() then
				if (character:has_region() and character:region():settlement():is_port())
					or not character:sea_region():is_null_interface() then
					new_intervention.char_cqi = character:cqi();
					return true;
				end;
			end;
			
			return false;
		end
	);

	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(	-- new_intervention:scroll_camera_to_character_for_intervention(
				-- new_intervention.char_cqi,					-- target character cqi
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
			uim:highlight_character(new_intervention.char_cqi, "select_vfx")
			stop_highlight_sea()
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);

	function stop_highlight_sea()
		cm:callback(
			function()
				uim:unhighlight_character(new_intervention.char_cqi, true)
			end,
			5
		)
	end

end;













---------------------------------------------------------------
--
--	STANCES_ambush_adopted
--
---------------------------------------------------------------

do
	local name = "STANCES_ambush_adopted";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_HIGH;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Your army waits in ambush, unseen and ready to attack. When the time is right, let them fall upon the unsuspecting enemy!
	local advice_key = "phar_campaign_advisor_battle_ambush_01";	

	local infotext = {
		"troy_camp_info_ambushes_01",
		"phar_camp_info_ambushes_02",
		"phar_camp_info_ambushes_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	
	

	--
	-- intervention configuration


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerForceAdoptsAmbushStance",
		true
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;













---------------------------------------------------------------
--
--	STANCES_ambush
--
---------------------------------------------------------------

do
	local name = "STANCES_ambush";							-- Unique string name for this intervention
	local cost = INTERVENTION_COST_HIGH;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = 15;					-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Look for the chance to set an ambush. Find suitable places to conceal your forces, ready to surprise an advancing enemy!
	local advice_key = "phar_campaign_advisor_assume_ambush_01";	

	local infotext = {
		"troy_camp_info_ambushes_01",
		"phar_camp_info_ambushes_02",
		"phar_camp_info_ambushes_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	
	

	--
	-- intervention configuration


	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_precondition(
		function()
			-- return true if the player has not adopted ambush stance in the past
			return not common.get_advice_history_string_seen("ambush_stance");
		end,
		"player must not have adopted ambush stance"
	);


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionTurnStart",
		function(context)
			return context:faction():at_war();
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;












---------------------------------------------------------------
--
--	STANCES_raiding
--
---------------------------------------------------------------

do
	local name = "STANCES_raiding";							-- Unique string name for this intervention
	local cost = INTERVENTION_COST_HIGH;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = 7;					-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Show your might by mounting raids. Have your warriors pillage enemy lands in Ares' name, taking what they will and spreading fear in their wake.
	local advice_key = "phar_campaign_advisor_armies_raiding_01";	

	local infotext = {
		"troy_camp_info_raiding_01",
		"phar_camp_info_raiding_12",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	
	

	--
	-- intervention configuration


	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_precondition(
		function()
			-- return true if the player has not adopted raiding stance in the past
			return not common.get_advice_history_string_seen("raiding_stance");
		end,
		"player must not have adopted raiding stance"
	);


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionTurnStart",
		function(context)
			return cm:faction_has_armies_in_enemy_territory(context:faction());
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;











---------------------------------------------------------------
--
--	STANCES_enemy_raiding
--
---------------------------------------------------------------

do
	local name = "STANCES_enemy_raiding";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = false;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Your people suffer at the hands of enemy raiders! Send out warriors to deal with these miscreants.
	local advice_key = "phar_campaign_advisor_enemy_raiding_01";	

	local infotext = {
		"troy_camp_info_raiding_01",
		"phar_camp_info_raiding_02",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	
	

	--
	-- intervention configuration


	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_precondition(
		function()
			-- return true if the player faction is not horde
			return cm:get_faction(cm:get_local_faction_name()):is_allowed_to_capture_territory();
		end,
		"player must not be a horde faction"
	);


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventForceRaidingPlayerTerritory",
		function(context)
			new_intervention.mf_cqi = context:military_force():command_queue_index();
			return true;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			local mf_cqi = new_intervention.mf_cqi;
			local char_cqi = false;

			if mf_cqi then
				local mf = cm:model():military_force_for_command_queue_index(mf_cqi);
				if is_militaryforce(mf) and mf:has_general() then
					char_cqi = mf:general_character():cqi();
				end;
			end;
			
			if char_cqi then
				new_intervention:scroll_camera_to_character_for_intervention(
					char_cqi,									-- target character cqi
					advice_key, 								-- advice key
					infotext,									-- infotext
					nil											-- mission manager
				);
				auto_clear_advice_delayed()
			else
				new_intervention:play_advice_for_intervention(
					advice_key, 								-- advice key
					infotext,									-- infotext
					nil											-- mission manager
				);
				auto_clear_advice_delayed()
			end;
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;













---------------------------------------------------------------
--
--	HERO_experienced_gained
--
---------------------------------------------------------------

do
	local name = "HERO_experienced_gained";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Your Heroic deeds have earnt you the blessings of Ares! Through your actions you gain greater experience, and thus the means to develop your skills further. It only remains to choose the manner of such development.
	local advice_key = "phar_campaign_advisor_hero_experience_level_up_01";	

	local infotext = {
		"phar_camp_info_hero_experience_01",
		"phar_camp_info_hero_experience_02",
		"phar_camp_info_hero_experience_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	
	

	--
	-- intervention configuration


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerCharacterRankUp",
		function(context)
			if cm:char_is_general(context:character()) then
				new_intervention.char_cqi = context:character():cqi();
				return true;
			end
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				-- new_intervention.char_cqi,					-- target character cqi
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
			auto_clear_advice_delayed()
			uim:highlight_character(new_intervention.char_cqi, "select_vfx")
			stop_highlight_exp()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, false);

	function stop_highlight_exp()
		cm:callback(
			function()
				uim:unhighlight_character(new_intervention.char_cqi, true)
			end,
			5
		)
	end

end;













---------------------------------------------------------------
--
--	HERO_replacement_required
--
---------------------------------------------------------------

do
	local name = "HERO_replacement_required";				-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;				-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Your Hero has fallen in battle and your army now lacks a leader. Pray that your next choice is more highly favoured by the gods.
	local advice_key = "phar_campaign_advisor_heroes_01";	

	local infotext = {
		"phar_camp_info_heroes_01",
		"phar_camp_info_heroes_02",
		"phar_camp_info_heroes_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	
	

	--
	-- intervention configuration


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventAppointNewGeneralPanelOpened",
		function(context)
			-- only return true if the absense is not because of dueling
			local uic_convalescence_reason = find_uicomponent(core:get_ui_root(), "panel_manager", "appoint_new_general", "event_appoint_new_general", "textpanel");
			if uic_convalescence_reason then
				local _, text = uic_convalescence_reason:GetStateText();
				return text == "death_types_localised_description_KILLED_IN_ACTION" or text == "death_types_localised_description_CONVALESCING";
			end;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;













---------------------------------------------------------------
--
--	HERO_low_loyalty
--
---------------------------------------------------------------

--[[
do
	local name = "HERO_low_loyalty";						-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Not all who serve you give their best. Here we see one whose lack of motivation makes them of limited use, perhaps even a liability. Action must be taken to remedy this.
	local advice_key = "troy_campaign_advisor_low_loyalty_01";	

	local infotext = {
		"troy_camp_info_loyalty_01",
		"troy_camp_info_loyalty_02",
		"troy_camp_info_loyalty_03",
		"troy_camp_info_loyalty_04",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	

	--
	-- intervention configuration
	

	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_not_faction_precondition("troy_amazons_trj_penthesilea");


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionTurnStart",
		function(context)
			local character_list = context:faction():character_list();
			for i = 0, character_list:num_items() - 1 do
				local current_char = character_list:item_at(i);				
				if not current_char:is_faction_leader() and current_char:has_military_force() and not current_char:military_force():is_armed_citizenry() and current_char:loyalty() < 6 then
					new_intervention.char_cqi = current_char:cqi();
					return true;
				end;
			end;
		
			return false;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:scroll_camera_to_character_for_intervention(
				new_intervention.char_cqi,					-- target character cqi
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;
--]]












---------------------------------------------------------------
--
--	WARNING_besieged
--
---------------------------------------------------------------

do
	local name = "WARNING_besieged";						-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Your city is besieged! Despatch a force to break the enemy's hold, and free your beleaguered subjects.
	local advice_key = "phar_campaign_advisor_siege_warfare_02";	

	local infotext = {
		"troy_camp_info_siege_warfare_01",
		"phar_camp_info_siege_warfare_12",
		"phar_camp_info_siege_warfare_13",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	
	

	--
	-- intervention configuration
	new_intervention:add_whitelist_event_type("conquest_siege_establishedevent_feed_target_conquest_besieged_faction");


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionTurnStart",
		function(context)
			local region_list = cm:get_faction(cm:get_local_faction_name()):region_list();
			
			for i = 0, region_list:num_items() - 1 do
				local region = region_list:item_at(i);
				if region:garrison_residence():is_under_siege() then
					new_intervention.region_key = region:name();
					return true;				
				end;
			end;
			
			return false;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:scroll_camera_to_settlement_for_intervention(
				new_intervention.region_key,				-- target region key
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;













---------------------------------------------------------------
--
--	WARNING_unit_recruitment
--
---------------------------------------------------------------

do
	local name = "WARNING_unit_recruitment";				-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = 2;					-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- To claim victory, you must always seek to increase the strength of your armies. Recruit new warriors to serve your cause!
	local advice_key = "phar_campaign_advisor_recruit_units_01";	

	local infotext = {
		"troy_camp_info_unit_recruitment_01",
		"phar_camp_info_unit_recruitment_02",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	
	

	--
	-- intervention configuration


	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_precondition(
		function()
			-- return true if the player has not recruited units in the past
			return not uim:get_interaction_monitor_state("unit_recruited")
		end,
		"player must not have recruited units"
	);


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionTurnStart",
		function()
			return true;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;












---------------------------------------------------------------
--
--	WARNING_building_construction
--
---------------------------------------------------------------

do
	local name = "WARNING_building_construction";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = 3;					-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Prosperous towns and strong-walled cities will be your lasting legacy, so build well. Your rivals will be watching your empire grow.
	local advice_key = "phar_campaign_advisor_construct_buildings_01";	

	local infotext = {
		"phar_camp_info_buildings_01",
		"troy_camp_info_buildings_02",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	
	

	--
	-- intervention configuration


	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_precondition(
		function()
			-- return true if the player has not constructed buildings in the past
			return not uim:get_interaction_monitor_state("building_constructed")
		end,
		"player must not have constructed buildings"
	);


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionTurnStart",
		function()
			return true;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;













---------------------------------------------------------------
--
--	WARNING_garrison_threatened
--
---------------------------------------------------------------

do
	local name = "WARNING_garrison_threatened";				-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = 8;					-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Your city is under threat! The garrison stand ready to meet any attack, but that may not be enough. Consider calling in additional troops to bolster the city's defences.
	local advice_key = "phar_campaign_advisor_garrison_armies_01";	

	local infotext = {
		"troy_camp_info_garrison_armies_01",
		"troy_camp_info_garrison_armies_02",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	
	

	--
	-- intervention configuration
	new_intervention:add_precondition(
		function()
			-- player must not be horde
			return cm:get_faction(cm:get_local_faction_name()):is_allowed_to_capture_territory();
		end,
		"player must not be a horde faction"
	);


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionTurnStart",
		function(context)
			local player_faction = context:faction();
			local player_faction_regions = player_faction:region_list();
			local enemy_factions = player_faction:factions_at_war_with();
			
			-- go through each military force of each enemy of the player
			for i = 0, enemy_factions:num_items() - 1 do
				local current_faction = enemy_factions:item_at(i);
				local enemy_force_list = current_faction:military_force_list();
				
				for j = 0, enemy_force_list:num_items() - 1 do
					local current_mf = enemy_force_list:item_at(j);
					
					if current_mf:has_general() and not current_mf:is_armed_citizenry() then
						local current_mf_general = current_mf:general_character();
						local current_mf_num_units = current_mf:unit_list():num_items();
						
						-- for each enemy enemy force, test whether it can reach each of the settlements controlled by the player
						for k = 0, player_faction_regions:num_items() - 1 do
							local current_player_region = player_faction_regions:item_at(k);
							local current_player_gr = current_player_region:garrison_residence();
							
							if not current_player_gr:is_under_siege() then
								local garrison_army = cm:get_armed_citizenry_from_garrison(current_player_gr);
								
								if garrison_army and garrison_army:has_general() then
									local garrison_commander = garrison_army:general_character();
									
									if cm:character_can_reach_character(current_mf_general, garrison_commander) then
										-- the enemy army commander can reach the settlement this turn
										local num_defending_units = garrison_army:unit_list():num_items();
										
										-- see if there are any other player forces nearby
										local current_player_settlement = current_player_region:settlement();
										local settlement_x = current_player_settlement:logical_position_x();
										local settlement_y = current_player_settlement:logical_position_y();
										
										local closest_player_army_commander = cm:get_closest_general_to_position_from_faction(player_faction, settlement_x, settlement_y);

										-- in case such general exists - add their units up
										if closest_player_army_commander then
											if distance_squared(settlement_x, settlement_y, closest_player_army_commander:logical_position_x(), closest_player_army_commander:logical_position_y()) < 36 then
												num_defending_units = num_defending_units + closest_player_army_commander:military_force():unit_list():num_items();
											end;
										end
										
										-- compare the size of the enemy force against the garrison army + any other local allies
										if num_defending_units < current_mf_num_units then
											-- this force is threatening enough to the settlement and any other local defenders, return true
											new_intervention.char_cqi = current_mf_general:cqi();
											return true;
										end;
									end;
								end;
							end;
						end;
					end;
				end;
			end;
			
			return false;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:scroll_camera_to_character_for_intervention(
				new_intervention.char_cqi,					-- target region key
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;












---------------------------------------------------------------
--
--	INFO_goldmine_sighted
--
---------------------------------------------------------------
--[[
do
	local name = "INFO_goldmine_sighted";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = 7;					-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Gold is perhaps the earth's greatest treasure; the effort of mining it is always worthwhile.
	local advice_key = "troy_campaign_advisor_specialised_settlements_gold_01";

	local infotext = {
		"troy_camp_info_resources_01",
		"troy_camp_info_resources_04",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);
	

	--
	-- intervention configuration


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionTurnStart",
		function(context)
			local region_list = context:faction():get_foreign_visible_regions_for_player();
			for i = 0, region_list:num_items() - 1 do
				local first_slot = region_list:item_at(i):slot_list():item_at(0);
				if first_slot:has_building() and string.find(first_slot:building():name(), "gold") then
					new_intervention.region_key = region_list:item_at(i):name();
					return true;
				end;
			end;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:scroll_camera_to_settlement_for_intervention(
				new_intervention.region_key,				-- region key
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;
]]











---------------------------------------------------------------
--
--	INFO_troy_sighted
--
---------------------------------------------------------------
--[[
do
	local name = "INFO_troy_sighted";						-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = 5;					-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Ah Troy! The world has never known a city so glorious... and so full of riches. Ilios is a prize worth dying for.
	local advice_key = "troy_campaign_advisor_victory_options_02";

	local infotext = {
		"troy_camp_info_troy_01",
		"troy_camp_info_troy_02",
		"troy_camp_info_troy_03",
	};

	local troy_region_key = "troy_main_ilion_troy";


	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_not_faction_precondition("troy_main_trj_hector");
	new_intervention:add_player_not_faction_precondition("troy_main_trj_paris");
	new_intervention:add_player_not_faction_precondition("troy_main_trj_dardania");


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionTurnStart",
		function(context)
			local region_troy = cm:get_region(troy_region_key);

			if region_troy:owning_faction() ~= context:faction() then
				if cm:get_garrison_commander_of_region(region_troy):is_visible_to_faction(context:faction():name()) then
					return true;
				end;
			end;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:scroll_camera_to_settlement_for_intervention(
				troy_region_key,							-- region key
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;
--]]











---------------------------------------------------------------
--
--	INFO_ruin_sighted
--
---------------------------------------------------------------

do	
	local name = "INFO_ruin_sighted";						-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = 8;					-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- A razed settlement is a sorry place, inhabited only by spirits and memories. But such sad desolation can be brought back to life; send an army to see what may be salvaged and rebuilt.
	local advice_key = "phar_campaign_advisor_razed_settlements_01";

	local infotext = {
		"troy_camp_info_ruins_01",
		"phar_camp_info_ruins_02",
	};

	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_precondition(
		function()
			-- return true if the player faction is not horde
			return cm:get_faction(cm:get_local_faction_name()):is_allowed_to_capture_territory();
		end,
		"player must not be a horde faction"
	);


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionTurnStart",
		function(context)
			local region_list = context:faction():get_foreign_visible_regions_for_player();
			for i = 0, region_list:num_items() - 1 do
				if region_list:item_at(i):is_abandoned() then
					new_intervention.region_key = region_list:item_at(i):name();
					return true;
				end;
			end;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			-- new_intervention:scroll_camera_to_settlement_for_intervention( -- prior setup
				-- new_intervention.region_key,				-- region key
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
			auto_clear_advice_delayed()
			uim:highlight_settlement("settlement:" .. new_intervention.region_key, "select_vfx")
			stop_highlight_ruin()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);

	-- stop highlight triggered from this intervention
	function stop_highlight_ruin()
		cm:callback(
			function()
				uim:unhighlight_settlement("settlement:" .. new_intervention.region_key, true)
			end,
			5
		)
	end
	
end;










---------------------------------------------------------------
--
--	INFO_enemy_province_capital_sighted
--
---------------------------------------------------------------

do	
	local name = "INFO_enemy_province_capital_sighted";		-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = 7;					-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- The enemy is no fool; their cities are fortified. To take them may require a lengthy siege.
	local advice_key = "phar_campaign_advisor_siege_warfare_01";

	local infotext = {
		"troy_camp_info_siege_warfare_01",
		"phar_camp_info_siege_warfare_02",
		"phar_camp_info_siege_warfare_03",
	};

	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionTurnStart",
		function(context)
			local eligible_regions = {};
			local player_faction = context:faction();
			local region_list = player_faction:get_foreign_visible_regions_for_player();

			for i = 0, region_list:num_items() - 1 do
				local current_region = region_list:item_at(i);
				if current_region:is_province_capital() and current_region:owning_faction():at_war_with(player_faction) and not current_region:garrison_residence():is_under_siege() then
					table.insert(eligible_regions, current_region);
				end;
			end;

			-- if we have any eligible province capitals, then find the closest to the player
			if #eligible_regions > 0 then
				local closest_region = false;
				local closest_distance = 50000000;

				for i = 1, #eligible_regions do
					local current_settlement = eligible_regions[i]:settlement();
					local settlement_x = current_settlement:logical_position_x();
					local settlement_y = current_settlement:logical_position_y();
					local closest_player_character = cm:get_closest_general_to_position_from_faction(player_faction, settlement_x, settlement_y, true);

					local current_distance = distance_squared(settlement_x, settlement_y, closest_player_character:logical_position_x(), closest_player_character:logical_position_y());
					if current_distance < closest_distance then
						closest_distance = current_distance;
						closest_region = eligible_regions[i];
					end;
				end;

				if closest_region then
					new_intervention.region_key = closest_region:name();
					return true;
				end;
			end;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			-- new_intervention:scroll_camera_to_settlement_for_intervention(
			-- 	new_intervention.region_key,				-- region key
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
			auto_clear_advice_delayed()
			uim:highlight_settlement("settlement:" .. new_intervention.region_key, "select_vfx")
			stop_highlight_enemy_capital_sighted()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);

	-- stop highlight triggered from this intervention
	function stop_highlight_enemy_capital_sighted()
		cm:callback(
			function()
				uim:unhighlight_settlement("settlement:" .. new_intervention.region_key, true)
			end,
			5
		)
	end

end;








---------------------------------------------------------------
--
--	INFO_conquest
--
---------------------------------------------------------------

do
	local name = "INFO_conquest";							-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = 4;					-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Conquer towns and cities to expand your empire. Recruit troops from your settlements, and send them forth to take more territory. Thus you build ever greater armies, and control yet more land. Such is the warrior's way.
	local advice_key = "phar_campaign_advisor_conquering_settlements_01";	

	local infotext = {};

	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration


	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_precondition(
		function()
			-- player must not be horde and must not have captured a settlement
			return cm:get_faction(cm:get_local_faction_name()):is_allowed_to_capture_territory() and not uim:get_interaction_monitor_state("settlement_captured");
		end,
		"player must not be a horde faction and must not have captured a settlement"
	);

	
	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionTurnStart",
		function(context)
			return true;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;











---------------------------------------------------------------
--
--	UI_strategic_overview_panel
--
---------------------------------------------------------------

do	
	local name = "UI_strategic_overview_panel";				-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;				-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Here you may take an overview of the world, and gain knowledge such as only the gods themselves might know.
	local advice_key = "phar_campaign_advisor_campaign_map_01";

	local infotext = {
		"troy_camp_info_strategic_overview_01",
		"troy_camp_info_strategic_overview_02",
		"phar_camp_info_strategic_overview_03",
	};

	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"StrategicOverviewPanelOpenedCampaign",
		function() 
			if is_tutorial_mode() then
				return not ftue_event_overrides 
			else
				return true
			end
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;











---------------------------------------------------------------
--
--	UI_divine_will_panel
--
---------------------------------------------------------------

-- do	
-- 	local name = "UI_divine_will_panel";					-- Unique string name for this intervention
-- 	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
-- 	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
-- 	local panel_name = "gods_and_favor";					-- Fullscreen panel to listen for
	
-- 	-- The gods influence the fates of men, bestowing benefits and curses as they see fit. To be high in their favour is to be sure of success. Fall too low in their esteem, and you will suffer.
-- 	local advice_key = "troy_campaign_advisor_gods_and_favour_interface_01";

-- 	local infotext = {
-- 		"troy_camp_info_divine_will_01",
-- 		"troy_camp_info_divine_will_02",
-- 		"troy_camp_info_divine_will_03",
-- 		"troy_camp_info_divine_will_04",
-- 		"troy_tutorial_camp_agamemnon_diplomacy_02",
-- 	};

-- 	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name);
-- end;












---------------------------------------------------------------
--
--	UI_royal_decrees_panel
--
---------------------------------------------------------------

do	
	local name = "UI_royal_decrees_panel";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "technology_panel";					-- Fullscreen panel to listen for
	
	-- As ruler of a great and growing empire you may issue decrees. While such orders can take time to enact, their beneficial effects are long-lasting.
	local advice_key = "phar_campaign_advisor_decree_intro_01";

	local infotext = {
		"phar_camp_info_decrees_01",
		"phar_camp_info_decrees_02",
		"phar_camp_info_decrees_03",
	};

	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name);

	

	-- Listener check
	core:add_listener(
		name .. "HighlightListener",
		"ScriptEvent" .. name .. "Highlight",
		function (context) return common.get_advice_thread_score(advice_key) ~= 0	end,
		function ()
			local uic_target_paths = {
				core:get_ui_root():SequentialFind( "tree_parent", "slot_parent", "phar_main_tech_civil_1_happiness_capital" );
				core:get_ui_root():SequentialFind( "tree_parent", "slot_parent", "phar_main_tech_economic_2_food_farm" );
				core:get_ui_root():SequentialFind( "tree_parent", "slot_parent", "phar_main_tech_military_1_xp_per_turn_all_units" );
			};
			advice_component_table_highlight(uic_target_paths) -- highlight_component_table used
		end,
		false
	)
	
end;











---------------------------------------------------------------
--
--	UI_greatest_warrior_panel
--
---------------------------------------------------------------
--[[
do	
	local name = "UI_greatest_warrior_panel";				-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "fm_achilles_greatestwarrior";		-- Fullscreen panel to listen for
	
	-- Can any warrior approach you in might and prowess, o lion-hearted Achilles? If they are foolish enough to try, you must vanquish them in battle.
	local advice_key = "troy_campaign_advisor_fm_achilles_greatest_warrior_intro_01";

	local infotext = {
		"troy_camp_info_achilles_greatest_warrior_01",
		"troy_camp_info_achilles_greatest_warrior_02",
		"troy_camp_info_achilles_greatest_warrior_03",
		"troy_camp_info_achilles_greatest_warrior_04",
		"troy_tutorial_camp_agamemnon_diplomacy_02",
	};

	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name);

	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_main_dan_achilles");
end;











---------------------------------------------------------------
--
--	UI_hot_blooded_panel
--
---------------------------------------------------------------

do	
	local name = "UI_hot_blooded_panel";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "fm_achilles_hotblooded";			-- Fullscreen panel to listen for
	
	-- Ah Achilles, ever a slave to your emotions. Any slight or setback may raise your ire. Likewise, a timely gift can avert the storm. Channel your moods to serve your cause.
	local advice_key = "troy_campaign_advisor_fm_achilles_hot-blooded_intro_01";

	local infotext = {
		"troy_camp_info_achilles_hot_blooded_01",
		"troy_camp_info_achilles_hot_blooded_02",
		"troy_camp_info_achilles_hot_blooded_03",
		"troy_camp_info_achilles_hot_blooded_04",
		"troy_tutorial_camp_agamemnon_diplomacy_02",
	};

	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name);

	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_main_dan_achilles");
end;











---------------------------------------------------------------
--
--	UI_king_of_men_panel
--
---------------------------------------------------------------

do	
	local name = "UI_king_of_men_panel";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "offices";							-- Fullscreen panel to listen for
	
	-- Here you may appoint trusted aides to help govern Mycenae. No other king is able to share their burden in this manner.
	local advice_key = "troy_campaign_advisor_fm_agamemnon_king_of_men_intro_01";

	local infotext = {
		"troy_camp_info_agamemnon_king_of_men_01",
		"troy_camp_info_agamemnon_king_of_men_02",
		"troy_camp_info_agamemnon_king_of_men_03",
		"troy_camp_info_agamemnon_king_of_men_04",
		"troy_tutorial_camp_agamemnon_diplomacy_02",
	};

	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name);

	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_main_dan_mycenae");
end;











---------------------------------------------------------------
--
--	UI_lions_share_panel
--
---------------------------------------------------------------

do	
	local name = "UI_lions_share_panel";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "fm_demand_tribute";					-- Fullscreen panel to listen for
	
	-- King Agamemnon, you are a lord of men! Those you conquer may serve as vassals; they will be forced to obey without question and pay tribute at your command.
	local advice_key = "troy_campaign_advisor_fm_agamemnon_supreme_lord_intro_01";

	local infotext = {
		"troy_camp_info_agamemnon_the_lions_share_01",
		"troy_camp_info_agamemnon_the_lions_share_02",
		"troy_camp_info_agamemnon_the_lions_share_03",
		"troy_tutorial_camp_agamemnon_diplomacy_02",
	};

	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name);

	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_main_dan_mycenae");
end;










---------------------------------------------------------------
--
--	UI_safe_havens_panel
--
---------------------------------------------------------------

do	
	local name = "UI_safe_havens_panel";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "odysseus_supply_bases";				-- Fullscreen panel to listen for
	
	-- Resourceful Odysseus, you are the master of spies. Train and dispatch agents to establish safe havens in foreign settlements. These secret enclaves will be most useful to your cause. 
	local advice_key = "troy_campaign_advisor_fm_odysseus_supply_bases_intro_01";

	local infotext = {
		"troy_camp_info_odysseus_safe_haven_01",
		"troy_camp_info_odysseus_safe_haven_02",
		"troy_camp_info_odysseus_safe_haven_03",
		"troy_tutorial_camp_agamemnon_diplomacy_02",
	};

	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name);

	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_main_dan_ithaca");
end;










---------------------------------------------------------------
--
--	UI_call_to_arms_panel
--
---------------------------------------------------------------

do	
	local name = "UI_call_to_arms_panel";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "reliable_friend";					-- Fullscreen panel to listen for
	
	-- Your friends respect you, noble Menelaus. Allies may offer up their own warriors to serve in your armies, and thus aid your cause.
	local advice_key = "troy_campaign_advisor_fm_menelaus_call_to_arms_intro_01";

	local infotext = {
		"troy_camp_info_menelaus_call_to_arms_01",
		"troy_camp_info_menelaus_call_to_arms_02",
		"troy_camp_info_menelaus_call_to_arms_03",
		"troy_camp_info_menelaus_call_to_arms_04",
		"troy_tutorial_camp_agamemnon_diplomacy_02",
	};

	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name);

	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_main_dan_sparta");
end;










---------------------------------------------------------------
--
--	UI_spartan_colonies_panel
--
---------------------------------------------------------------

do	
	local name = "UI_spartan_colonies_panel";				-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "spartan_settlers";					-- Fullscreen panel to listen for
	
	-- The Spartans are masters of opportunity. Others see a newly-razed settlement as a casualty of war. You see it as a chance to expand your domain.
	local advice_key = "troy_campaign_advisor_fm_menelaus_spartan_settlers_intro_01";

	local infotext = {
		"troy_camp_info_menelaus_spartan_colonies_01",
		"troy_camp_info_menelaus_spartan_colonies_02",
		"troy_camp_info_menelaus_spartan_colonies_03",
		"troy_camp_info_menelaus_spartan_colonies_04",
		"troy_tutorial_camp_agamemnon_diplomacy_02",
	};

	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name);

	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_main_dan_sparta");
end;










---------------------------------------------------------------
--
--	UI_assuwan_league_panel
--
---------------------------------------------------------------

do	
	local name = "UI_assuwan_league_panel";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "fm_trojan_alliance";				-- Fullscreen panel to listen for
	
	-- Mighty though you are, Hector, you cannot stand alone; you share your success with your friends and allies, and they with you.
	local advice_key = "troy_campaign_advisor_fm_hector_trojan_alliance_intro_01";

	local infotext = {
		"troy_camp_info_hector_assuwan_league_01",
		"troy_camp_info_hector_assuwan_league_02",
		"troy_camp_info_hector_assuwan_league_03",
		"troy_tutorial_camp_agamemnon_diplomacy_02",
	};

	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name);

	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_main_trj_hector");
end;










---------------------------------------------------------------
--
--	UI_priams_heir_panel
--
---------------------------------------------------------------

do	
	local name = "UI_priams_heir_panel";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "fm_priams_benevolence";				-- Fullscreen panel to listen for
	
	-- Your father, wise King Priam, judges his favoured sons. Obedience and respect will earn his benevolence, and he alone decides who will inherit his throne: you or your brother.
	local advice_key = "troy_campaign_advisor_fm_hector_paris_priam_benevolence_intro_01";

	local infotext = {
		"troy_camp_info_priams_heir_01",
		"troy_camp_info_priams_heir_02",
		"troy_camp_info_priams_heir_03",
		"troy_tutorial_camp_agamemnon_diplomacy_02",
	};

	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name);

	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_precondition(
		function()
			local local_faction = cm:get_local_faction_name();
			return local_faction == "troy_main_trj_hector" or local_faction == "troy_main_trj_paris";
		end,
		"player faction must be Hector or Paris"
	);
end;










---------------------------------------------------------------
--
--	UI_helen_my_love_panel
--
---------------------------------------------------------------

do	
	local name = "UI_helen_my_love_panel";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "fm_helen";							-- Fullscreen panel to listen for
	
	-- Aphrodite herself smiles on your love for Helen. Would that fate did not keep separating you!
	local advice_key = "troy_campaign_advisor_fm_paris_helen_my_love_intro_01";

	local infotext = {
		"troy_camp_info_paris_helen_my_love_01",
		"troy_camp_info_paris_helen_my_love_02",
		"troy_camp_info_paris_helen_my_love_03",
		"troy_camp_info_paris_helen_my_love_04",
		"troy_camp_info_paris_helen_my_love_05",
		"troy_tutorial_camp_agamemnon_diplomacy_02",
	};

	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name);

	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_main_trj_paris");
end;










---------------------------------------------------------------
--
--	UI_divine_omens_panel
--
---------------------------------------------------------------

do	
	local name = "UI_divine_omens_panel";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "fm_divine_missions";				-- Fullscreen panel to listen for
	
	-- Do the immortal gods themselves whisper to you, Aeneas? Heed their words, do their bidding, and thus gain divine favour.
	local advice_key = "troy_campaign_advisor_fm_aeneas_divine_missions_intro_01";

	local infotext = {
		"troy_camp_info_aeneas_divine_missions_01",
		"troy_camp_info_aeneas_divine_missions_02",
		"troy_camp_info_aeneas_divine_missions_03",
		"troy_tutorial_camp_agamemnon_diplomacy_02",
	};

	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name);

	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_main_trj_dardania");
end;










---------------------------------------------------------------
--
--	UI_stygian_voices_panel
--
---------------------------------------------------------------

do	
	local name = "UI_stygian_voices_panel";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "fm_speak_with_dead";				-- Fullscreen panel to listen for
	
	-- As the son of Aphrodite, you are said to converse with the dead. Past Heroes may share their otherworldly wisdom with you, for good or ill.
	local advice_key = "troy_campaign_advisor_fm_aeneas_speak_with_the_dead_intro_01";

	local infotext = {
		"troy_camp_info_aeneas_stygian_voices_01",
		"troy_camp_info_aeneas_stygian_voices_02",
		"troy_camp_info_aeneas_stygian_voices_03",
		"troy_camp_info_aeneas_stygian_voices_04",
		"troy_tutorial_camp_agamemnon_diplomacy_02",
	};

	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name);

	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_main_trj_dardania");
end;










---------------------------------------------------------------
--
--	UI_precious_resources_panel
--
---------------------------------------------------------------

do	
	local name = "UI_precious_resources_panel";				-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "fm_sarpedon_luxury_goods_v2";		-- Fullscreen panel to listen for
	
	-- As a master of acquisition, you are able to procure certain rare goods, from granite as white as a sacrificial bull, to ancient relics, and celestial iron that fell from the sky itself.
	local advice_key = "troy_campaign_advisor_fm_sarpedon_luxury_goods_intro_01";

	local infotext = {
		"troy_camp_info_sarpedon_precious_resources_01",
		"troy_camp_info_sarpedon_precious_resources_02",
		"troy_camp_info_sarpedon_precious_resources_03",
		"troy_camp_info_sarpedon_precious_resources_04",
		"troy_tutorial_camp_agamemnon_diplomacy_02",
	};

	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name);

	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_main_trj_lycia");
end;










---------------------------------------------------------------
--
--	UI_lycian_trade_panel
--
---------------------------------------------------------------

do	
	local name = "UI_lycian_trade_panel";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "fm_lycian_trade_guild";				-- Fullscreen panel to listen for
	
	-- A trustworthy merchant is a friend to all and your word may be believed when others are disregarded. Such influence can bring advantages for the canny trader.
	local advice_key = "troy_campaign_advisor_fm_sarpedon_lycian_trade_guild_foreign_affairs_01";

	local infotext = {
		"troy_camp_info_sarpedon_lycian_trade_missions_01",
		"troy_camp_info_sarpedon_lycian_trade_missions_02",
		"troy_camp_info_sarpedon_lycian_trade_missions_03",
		"troy_tutorial_camp_agamemnon_diplomacy_02",
	};

	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name);

	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_main_trj_lycia");
end;










---------------------------------------------------------------
--
--	UI_hippolyta_initiation_rites
--
---------------------------------------------------------------

do	
	local name = "UI_hippolyta_initiation_rites";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "unit_upgrades_panel";				-- Fullscreen panel to listen for
	
	-- Under your banner, even inexperienced warriors give their all. Those raw recruits who survive long enough will earn your blessing and progress to become experienced veterans, able to serve in any of your armies.
	local advice_key = "troy_campaign_advisor_fm_hippolyta_initiation_rites_intro_01";

	local infotext = {
		"troy_camp_info_initiation_rites_01",
		"troy_camp_info_initiation_rites_02",
		"troy_camp_info_initiation_rites_03",
		"troy_camp_info_initiation_rites_04",
		"troy_tutorial_camp_agamemnon_diplomacy_02",
	};

	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name);

	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_amazons_trj_hippolyta");
end;










---------------------------------------------------------------
--
--	UI_hippolyta_amazon_kingdom
--
---------------------------------------------------------------

do	
	local name = "UI_hippolyta_amazon_kingdom";				-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "fm_amazon_kingdom_milestones";		-- Fullscreen panel to listen for
	
	-- It is time for the Amazons to return to their ancient homeland. The treasures of your forebears are yours to claim. Amassing their riches will unlock benefits to aid your kingdom. 
	local advice_key = "troy_campaign_advisor_fm_hippolyta_amazon_kingdom_intro_01";

	local infotext = {
		"troy_camp_info_hippolyta_amazon_kingdom_01",
		"troy_camp_info_hippolyta_amazon_kingdom_02",
		"troy_camp_info_hippolyta_amazon_kingdom_03",
		"troy_camp_info_hippolyta_amazon_kingdom_04",
		"troy_tutorial_camp_agamemnon_diplomacy_02",
	};

	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name);

	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_amazons_trj_hippolyta");
end;










---------------------------------------------------------------
--
--	UI_penthesilea_initiation_rites
--
---------------------------------------------------------------

do	
	local name = "UI_penthesilea_initiation_rites";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "unit_upgrades_panel";				-- Fullscreen panel to listen for
	
	-- Your Amazons are fierce and loyal; though they may come from humble beginnings, they stay the course. As units prove themselves in battle they may earn your favour, gaining greater skill and better equipment.
	local advice_key = "troy_campaign_advisor_fm_penthesilea_initiation_rites_intro_01";

	local infotext = {
		"troy_camp_info_initiation_rites_01",
		"troy_camp_info_initiation_rites_02",
		"troy_camp_info_initiation_rites_03",
		"troy_camp_info_initiation_rites_05",
		"troy_tutorial_camp_agamemnon_diplomacy_02",
	};

	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name);

	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_amazons_trj_penthesilea");
end;










---------------------------------------------------------------
--
--	UI_penthesilea_capture_bonus
--
---------------------------------------------------------------

do	
	local name = "UI_penthesilea_capture_bonus";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "fm_capture_bonus";					-- Fullscreen panel to listen for
	
	-- The settlements you capture are of little use to a nomad who sees settled life as a prison, but they may aid your campaign in other ways. Your scouts have revealed their strategic advantage, should you choose to raze them.
	local advice_key = "troy_campaign_advisor_fm_penthesilea_capture_bonus_intro_01";

	local infotext = {
		"troy_camp_info_penthesilea_capture_bonus_01",
		"troy_camp_info_penthesilea_capture_bonus_02",
		"troy_camp_info_penthesilea_capture_bonus_03",
		"troy_tutorial_camp_agamemnon_diplomacy_02",
	};

	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name);

	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	--new_intervention:add_player_faction_precondition("troy_amazons_trj_penthesilea");
end;










---------------------------------------------------------------
--
--	UI_penthesilea_blood_oath
--
---------------------------------------------------------------

do	
	local name = "UI_penthesilea_blood_oath";				-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "fm_blood_oath";						-- Fullscreen panel to listen for
	
	-- Only the most renowned of Warrior Queens can invoke the old oaths...
	local advice_key = "troy_campaign_advisor_fm_penthesilea_blood_oath_intro_01";

	local infotext = {
		"troy_camp_info_penthesilea_blood_oaths_01",
		"troy_camp_info_penthesilea_blood_oaths_02",
		"troy_camp_info_penthesilea_blood_oaths_03",
		"troy_camp_info_penthesilea_blood_oaths_04",
		"troy_tutorial_camp_agamemnon_diplomacy_02",
	};

	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name);

	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_amazons_trj_penthesilea");
end;

---------------------------------------------------------------
--
--	UI_fm_ajaxs_champion_challenge
--
---------------------------------------------------------------

do	
	local name = "UI_fm_ajaxs_champion_challenge";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "fm_ajaxs_champion_challenge";		-- Fullscreen panel to listen for
	
	-- PH Adiver texts
	local advice_key = "troy_adi_campaign_advisor_fm_ajax_champions_intro_01";

	local infotext = {
		"troy_adi_camp_info_fm_ajax_campions_01",
		"troy_adi_camp_info_fm_ajax_campions_02",
		"troy_adi_camp_info_fm_ajax_campions_03",
		"troy_adi_camp_info_fm_ajax_campions_04",
		};

	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name);

	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_main_dan_salamis");
end;

---------------------------------------------------------------
--
--	UI_fm_ajaxs_renown
--
---------------------------------------------------------------

do	
	local name = "UI_fm_ajaxs_renown";							-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "fm_ajaxs_renown";					-- Fullscreen panel to listen for
	
	-- PH Adiver texts
	local advice_key = "troy_adi_campaign_advisor_fm_ajax_celebration_intro_01";

	local infotext = {
		"troy_adi_camp_info_fm_ajax_celebration_01",
		"troy_adi_camp_info_fm_ajax_celebration_02",
		"troy_adi_camp_info_fm_ajax_celebration_03",
		"troy_adi_camp_info_fm_ajax_celebration_04",
	};

	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name);

	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_main_dan_salamis");
end;

---------------------------------------------------------------
--
--	UI_diomedes_champions_panel
--
---------------------------------------------------------------

do	
	local name = "UI_diomedes_champions_panel";				-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "fm_dio_1";							-- Fullscreen panel to listen for
	
	-- PH Adiver texts
	local advice_key = "troy_adi_campaign_advisor_fm_diomedes_champions_intro_01";

	local infotext = {
		"troy_adi_camp_info_fm_diomedes_campions_01",
		"troy_adi_camp_info_fm_diomedes_campions_02",
		"troy_adi_camp_info_fm_diomedes_campions_03",
		"troy_adi_camp_info_fm_diomedes_campions_04",
	};

	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name);

	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_main_dan_argos");
end;

---------------------------------------------------------------
--
--	UI_diomedes_mil_strategy_panel
--
---------------------------------------------------------------

do	
	local name = "UI_diomedes_mil_strategy_panel";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "fm_dio_2";							-- Fullscreen panel to listen for
	
	-- PH Adiver texts
	local advice_key = "troy_adi_campaign_advisor_fm_diomedes_mil_strategy_intro_01";

	local infotext = {
		"troy_adi_camp_info_fm_diomedes_mil_strategy_01",
		"troy_adi_camp_info_fm_diomedes_mil_strategy_02",
		"troy_adi_camp_info_fm_diomedes_mil_strategy_03",
		"troy_adi_camp_info_fm_diomedes_mil_strategy_04",
	};

	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name);

	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_main_dan_argos");
end;


---------------------------------------------------------------
--
--	UI_fm_memnon_1
--
---------------------------------------------------------------

do	
	local name = "UI_fm_memnon_1";							-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "fm_memnon_1";				-- Fullscreen panel to listen for
	
	-- Resourceful Odysseus, you are the master of spies. Train and dispatch agents to establish safe havens in foreign settlements. These secret enclaves will be most useful to your cause. 
	local advice_key = "troy_rem_campaign_advisor_fm_memnon_servant_intro_01";

	local infotext = {
		"troy_rem_camp_info_fm_memnon_servant_01",
		"troy_rem_camp_info_fm_memnon_servant_02",
		"troy_rem_camp_info_fm_memnon_servant_03",
		"troy_rem_camp_info_fm_memnon_servant_04",
		"troy_rem_camp_info_fm_memnon_servant_05",
	};

	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name);

end;

---------------------------------------------------------------
--
--	UI_fm_memnon_2
--
---------------------------------------------------------------

do	
	local name = "UI_fm_memnon_2";							-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "fm_memnon_2";				-- Fullscreen panel to listen for
	
	-- Resourceful Odysseus, you are the master of spies. Train and dispatch agents to establish safe havens in foreign settlements. These secret enclaves will be most useful to your cause. 
	local advice_key = "troy_rem_campaign_advisor_fm_memnon_exotic_intro_01";

	local infotext = {
		"troy_rem_camp_info_fm_memnon_exotic_01",
		"troy_rem_camp_info_fm_memnon_exotic_02",
		"troy_rem_camp_info_fm_memnon_exotic_03",
		"troy_rem_camp_info_fm_memnon_exotic_04",
		"troy_rem_camp_info_fm_memnon_exotic_05",
	};

	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name);

end;


---------------------------------------------------------------
--
--	UI_fm_rhesus_1
--
---------------------------------------------------------------

do	
	local name = "UI_fm_rhesus_1";							-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "fm_rhesus_1";						-- Fullscreen panel to listen for
	
	-- Resourceful Odysseus, you are the master of spies. Train and dispatch agents to establish safe havens in foreign settlements. These secret enclaves will be most useful to your cause. 
	local advice_key = "troy_rem_campaign_advisor_fm_rhesus_host_intro_01";

	local infotext = {
		"troy_rem_camp_info_fm_rhesus_host_01",
		"troy_rem_camp_info_fm_rhesus_host_02",
		"troy_rem_camp_info_fm_rhesus_host_03",
		"troy_rem_camp_info_fm_rhesus_host_04",
		"troy_rem_camp_info_fm_rhesus_host_05",
	};

	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name);

end;

---------------------------------------------------------------
--
--	UI_fm_rhesus_2
--
---------------------------------------------------------------

do	
	local name = "UI_fm_rhesus_2";							-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "fm_rhesus_2";						-- Fullscreen panel to listen for
	
	-- Resourceful Odysseus, you are the master of spies. Train and dispatch agents to establish safe havens in foreign settlements. These secret enclaves will be most useful to your cause. 
	local advice_key = "troy_rem_campaign_advisor_fm_rhesus_rituals_intro_01";

	local infotext = {
		"troy_rem_camp_info_fm_rhesus_rituals_01",
		"troy_rem_camp_info_fm_rhesus_rituals_02",
		"troy_rem_camp_info_fm_rhesus_rituals_03",
		"troy_rem_camp_info_fm_rhesus_rituals_04",
		"troy_rem_camp_info_fm_rhesus_rituals_05",
	};

	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name);

end;



---------------------------------------------------------------
--
--	RACIAL_menelaus_ally_gained
--
---------------------------------------------------------------

do
	local name = "RACIAL_menelaus_ally_gained";				-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Your new ally offers support even before the battle lines are drawn; they will allow you to recruit warriors from their army to swell your own ranks.
	local advice_key = "troy_campaign_advisor_fm_menelaus_call_to_arms_alliance_available_01";	

	local infotext = {
		"troy_camp_info_menelaus_call_to_arms_01",
		"troy_camp_info_menelaus_call_to_arms_02",
		"troy_camp_info_menelaus_call_to_arms_03",
		"troy_camp_info_menelaus_call_to_arms_04",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration


	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_main_dan_sparta");

	
	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"PositiveDiplomaticEvent",
		function(context)
			if context:is_military_alliance() or context:is_defensive_alliance() then
				local local_faction_name = cm:get_local_faction_name();
				if context:proposer():name() == local_faction_name or context:recipient():name() == local_faction_name then
					return true;
				end;
			end;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;











---------------------------------------------------------------
--
--	RACIAL_paris_helen_captured
--
---------------------------------------------------------------

do
	local name = "RACIAL_paris_helen_captured";				-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Helen is in danger, detained by a rival ruler! This news is an arrow to your heart. You must hurry to the rescue of your true love.  
	local advice_key = "troy_campaign_advisor_fm_paris_helen_my_love_damsel_in_distress_01";	

	local infotext = {
		"troy_camp_info_paris_helen_my_love_01",
		"troy_camp_info_paris_helen_my_love_02",
		"troy_camp_info_paris_helen_my_love_04",
		"troy_camp_info_paris_helen_my_love_05",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration


	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_main_trj_paris");

	
	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventHelenCaptured",
		function(context)
			new_intervention.region_key = context:region():name();
			return true;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:scroll_camera_to_settlement_for_intervention(
				new_intervention.region_key,				-- region key
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;











---------------------------------------------------------------
--
--	RACIAL_horde_razing
--
---------------------------------------------------------------

do
	local name = "RACIAL_horde_razing";						-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = 4;					-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- The world has never known an army like yours! Towns and cities are the follies of insecure men. You cannot occupy them – it is your destiny only to plunder and destroy, leaving ruins in your wake!
	local advice_key = "troy_campaign_advisor_conquering_settlements_penthesilea_01";	

	local infotext = {
		"troy_camp_info_hordes_01",
		"troy_camp_info_hordes_02",
		"troy_camp_info_hordes_03",
		"troy_camp_info_hordes_04",
		"troy_camp_info_hordes_05",
	};

	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration


	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_precondition(
		function()
			-- player must be horde and not have razed
			return not cm:get_faction(cm:get_local_faction_name()):is_allowed_to_capture_territory() and not cm:get_saved_value("player_has_razed");
		end,
		"player must be a horde faction and must not have razed"
	);

	
	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionTurnStart",
		function(context)
			return true;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;


---------------------------------------------------------------
--
--	RACIAL_ajax_diomedes_champion_available
--
---------------------------------------------------------------

do
	local name = "RACIAL_ajax_diomedes_champion_available";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;							-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;					-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- The world has never known an army like yours! Towns and cities are the follies of insecure men. You cannot occupy them – it is your destiny only to plunder and destroy, leaving ruins in your wake!
	local advice_key = "troy_adi_campaign_advisor_champion_units_01";	

	local infotext = {
		"troy_adi_campaign_advisor_champion_units_info_01",
		"troy_adi_campaign_advisor_champion_units_info_02",
		"troy_adi_campaign_advisor_champion_units_info_03",
	};

	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration


	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	--new_intervention:add_player_faction_precondition("troy_main_dan_salamis");

	
	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventAjaxChampionAddedToMercenaryPool",
		true
	);
	new_intervention:add_trigger_condition(
		"ScriptEventDiomedesChampionTrained",
		true
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;

---------------------------------------------------------------
--
--	RACIAL_ajax_renown_mission_issued
--
---------------------------------------------------------------

do
	local name = "RACIAL_ajax_renown_mission_issued";		-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;					-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- The world has never known an army like yours! Towns and cities are the follies of insecure men. You cannot occupy them – it is your destiny only to plunder and destroy, leaving ruins in your wake!
	local advice_key = "troy_adi_campaign_advisor_fm_ajax_missions_intro_01";	

	local infotext = {
		"troy_adi_campaign_advisor_fm_ajax_missions_info_01",
		"troy_adi_campaign_advisor_fm_ajax_missions_info_02",
		"troy_adi_campaign_advisor_fm_ajax_missions_info_03",
	};

	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration


	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_main_dan_salamis");

	
	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"MissionIssued",
		function(context)
			return string.find(context:mission():mission_record_key(), "troy_adi_mission_renown_fm_");
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;

---------------------------------------------------------------
--
--	RACIAL_ajax_enough_renown_for_celebration
--
---------------------------------------------------------------

do
	local name = "RACIAL_ajax_enough_renown_for_celebration";		-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;							-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;							-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;					-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- The world has never known an army like yours! Towns and cities are the follies of insecure men. You cannot occupy them – it is your destiny only to plunder and destroy, leaving ruins in your wake!
	local advice_key = "troy_adi_campaign_advisor_fm_ajax_celebration_available_01";	

	local infotext = {
		"troy_adi_campaign_advisor_fm_ajax_celebration_available_info_01",
		"troy_adi_campaign_advisor_fm_ajax_celebration_available_info_02",
		"troy_adi_campaign_advisor_fm_ajax_celebration_available_info_03",
	};

	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration


	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_main_dan_salamis");

	
	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"PooledResourceTransactionEvent",
		function(context)
			local resource = context:resource() 
			return resource:key() == "troy_adi_renown" and resource:value() >= 5;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;

---------------------------------------------------------------
--
--	RACIAL_ajax_champion_settlement_selected
--
---------------------------------------------------------------

do
	local name = "RACIAL_ajax_champion_settlement_selected";	-- Unique string name for this intervention
	local cost = INTERVENTION_COST_NO_COST;							-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_MINIMAL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;					-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Ah Troy! The world has never known a city so glorious… and so full of riches. Ilios is a prize worth dying for.
	local advice_key = "troy_adi_campaign_advisor_settlement_with_champion_units_01";

	local infotext = {
		"troy_adi_campaign_advisor_settlement_with_champion_units_info_01",
		"troy_adi_campaign_advisor_settlement_with_champion_units_info_02",
		"troy_adi_campaign_advisor_settlement_with_champion_units_info_03",
	};

	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_main_dan_salamis");
	
	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"SettlementSelected",
		function(context)
			local region_name = context:garrison_residence():region():name()
			for _, champions in pairs(_ajax_challenge_existing_champions) do
				if champions.spawn_settlement_name == region_name then
					return true
				end
			end
			return false
		end
	);

	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;

---------------------------------------------------------------
--
--	RACIAL_diomedes_dominance_gained
--
---------------------------------------------------------------

do
	local name = "RACIAL_diomedes_dominance_gained";				-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;							-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;							-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;					-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- The world has never known an army like yours! Towns and cities are the follies of insecure men. You cannot occupy them – it is your destiny only to plunder and destroy, leaving ruins in your wake!
	local advice_key = "troy_adi_campaign_advisor_fm_diomedes_dominance_gained_01";	

	local infotext = {
		"troy_adi_campaign_advisor_fm_diomedes_dominance_gained_info_01",
		"troy_adi_campaign_advisor_fm_diomedes_dominance_gained_info_02",
		"troy_adi_campaign_advisor_fm_diomedes_dominance_gained_info_03",
	};

	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration


	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_main_dan_argos");

	
	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"PooledResourceTransactionEvent",
		function(context) return context:resource():key() == "troy_dominance"; end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;

---------------------------------------------------------------
--
--	RACIAL_diomedes_dominance_diplomacy
--
---------------------------------------------------------------

do
	local name = "RACIAL_diomedes_dominance_diplomacy";				-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;							-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_MINIMAL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- The world has never known an army like yours! Towns and cities are the follies of insecure men. You cannot occupy them – it is your destiny only to plunder and destroy, leaving ruins in your wake!
	local advice_key = "troy_adi_campaign_advisor_fm_diomedes_dominance_spending_01";	

	local infotext = {
		"troy_adi_campaign_advisor_fm_diomedes_dominance_spending_info_01",
		"troy_adi_campaign_advisor_fm_diomedes_dominance_spending_info_02",
		"troy_adi_campaign_advisor_fm_diomedes_dominance_spending_info_03",
	};

	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration


	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_main_dan_argos");

	
	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"PanelOpenedCampaign",
		function(context)
			local resource = "troy_dominance"
			local faction = cm:get_faction(cm:get_local_faction_name(true)) 
			return context.string == "diplomacy_dropdown" and faction:has_pooled_resource(resource) and faction:pooled_resource(resource):value() >= cm:model():get_campaign_variable_by_name("diplomatic_action_dominance_cost"); 
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;

---------------------------------------------------------------
--
--	RACIAL_diomedes_strategos_settlement_selected
--
---------------------------------------------------------------

do
	local name = "RACIAL_diomedes_strategos_settlement_selected";	-- Unique string name for this intervention
	local cost = INTERVENTION_COST_NO_COST;							-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_MINIMAL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;					-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Ah Troy! The world has never known a city so glorious… and so full of riches. Ilios is a prize worth dying for.
	local advice_key = "troy_adi_campaign_advisor_fm_diomedes_champion_available_01";

	local infotext = {
		"troy_adi_campaign_advisor_fm_diomedes_champion_available_info_01",
		"troy_adi_campaign_advisor_fm_diomedes_champion_available_info_02",
		"troy_adi_campaign_advisor_fm_diomedes_champion_available_info_03",
	};

	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_main_dan_argos");

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"SettlementSelected",
		function(context)
			local region_name = context:garrison_residence():region():name()
			for teacher_key, teachers in pairs(dio_champions.teachers) do
				if teachers.unlock_region == region_name and not dio_champions.champions_unlocked_teachers[teacher_key] then
					return true
				end
			end
			return false
		end
	);

	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;


---------------------------------------------------------------
--
--	RACIAL_fm_memnon_1_canaan_territories_unlocked
--
---------------------------------------------------------------

do
	local name = "RACIAL_fm_memnon_1_canaan_territories_unlocked";	-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;				-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Your new ally offers support even before the battle lines are drawn; they will allow you to recruit warriors from their army to swell your own ranks.
	local advice_key = "troy_rem_campaign_advisor_fm_memnon_servant_canaan_01";	

	local infotext = {
		"troy_rem_campaign_advisor_memnon_servant_canaan_01",
		"troy_rem_campaign_advisor_memnon_servant_canaan_02",
		"troy_rem_campaign_advisor_memnon_servant_canaan_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration


	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_rem_horde_aethiopians");

	
	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"PanelOpenedCampaign",
		function(context)
			local megiddo = pharaohs_servant.regions["canaan"].cities["megiddo"]
			local ugarit = pharaohs_servant.regions["canaan"].cities["ugarit"]

			if context.string == "fm_memnon_1" then
				if megiddo.unlocked or ugarit.unlocked then 
					return true
				else
					return false
				end
			end;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;

---------------------------------------------------------------
--
--	RACIAL_fm_memnon_1_susa_territories_unlocked
--
---------------------------------------------------------------

do
	local name = "RACIAL_fm_memnon_1_susa_territories_unlocked";	-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;				-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Your new ally offers support even before the battle lines are drawn; they will allow you to recruit warriors from their army to swell your own ranks.
	local advice_key = "troy_rem_campaign_advisor_fm_memnon_servant_susa_01";	

	local infotext = {
		"troy_rem_campaign_advisor_memnon_servant_susa_01",
		"troy_rem_campaign_advisor_memnon_servant_susa_02",
		"troy_rem_campaign_advisor_memnon_servant_susa_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration


	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_rem_horde_aethiopians");

	
	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"PanelOpenedCampaign",
		function(context)
			local susa = pharaohs_servant.regions["susa"].cities["susa"]

			if context.string == "fm_memnon_1" then
				if susa.unlocked then 
					return true
				else
					return false
				end
			end;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;

---------------------------------------------------------------
--
--	RACIAL_fm_memnon_1_emissary_technology_researched
--
---------------------------------------------------------------

do
	local name = "RACIAL_fm_memnon_1_emissary_technology_researched";	-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;				-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Your new ally offers support even before the battle lines are drawn; they will allow you to recruit warriors from their army to swell your own ranks.
	local advice_key = "troy_rem_campaign_advisor_fm_memnon_servant_reinforcements_01";	

	local infotext = {
		"troy_rem_campaign_advisor_memnon_servant_reinforcements_01",
		"troy_rem_campaign_advisor_memnon_servant_reinforcements_02",
		"troy_rem_campaign_advisor_memnon_servant_reinforcements_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration


	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_rem_horde_aethiopians");

	
	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"PanelOpenedCampaign",
		function(context)
			local faction = cm:get_faction(cm:get_local_faction_name(true))
			local target_technology = "troy_tech_rem_horde_memnon_13_two_region_recruitment_unlocked"

			if context.string == "fm_memnon_1" then
				return faction:has_technology(target_technology)
			end;
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;

---------------------------------------------------------------
--
--	RACIAL_fm_memnon_2_available_follower
--
---------------------------------------------------------------

do
	local name = "RACIAL_fm_memnon_2_available_follower";	-- Unique string name for this intervention
	local cost = INTERVENTION_COST_NO_COST;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;				-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = true;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = true;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Your new ally offers support even before the battle lines are drawn; they will allow you to recruit warriors from their army to swell your own ranks.
	local advice_key = "troy_rem_campaign_advisor_fm_memnon_exotic_followers_action_01";	

	local infotext = {
		"troy_rem_campaign_advisor_memnon_exotic_followers_action_01",
		"troy_rem_campaign_advisor_memnon_exotic_followers_action_02",
		"troy_rem_campaign_advisor_memnon_exotic_followers_action_03",
		"troy_rem_campaign_advisor_memnon_exotic_followers_action_04",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration


	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_rem_horde_aethiopians");

	
	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"TROY_REM_MEMNON_FOLLOWERS_BUTTON_IS_ACTIVE",
		function(context)
			local faction = cm:get_faction(cm:get_local_faction_name(true))

			return cm:get_military_force_by_cqi(context.number):faction() == faction
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;

---------------------------------------------------------------
--
--	RACIAL_fm_memnon_2_force_with_follower_destroyed
--
---------------------------------------------------------------

do
	local name = "RACIAL_fm_memnon_2_force_with_follower_destroyed";	-- Unique string name for this intervention
	local cost = INTERVENTION_COST_NO_COST;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;				-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = true;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = true;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Your new ally offers support even before the battle lines are drawn; they will allow you to recruit warriors from their army to swell your own ranks.
	local advice_key = "troy_rem_campaign_advisor_fm_memnon_exotic_followers_scattered_01";	

	local infotext = {
		"troy_rem_campaign_advisor_memnon_exotic_followers_scattered_01",
		"troy_rem_campaign_advisor_memnon_exotic_followers_scattered_02",
		"troy_rem_campaign_advisor_memnon_exotic_followers_scattered_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration


	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_rem_horde_aethiopians");

	
	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"TROY_REM_MEMNON_ARMY_WITH_FOLLOWERS_DESTROYED",
		function(context)
			local faction = cm:get_faction(cm:get_local_faction_name(true))

			return context:faction() == faction
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;


---------------------------------------------------------------
--
--	RACIAL_fm_rhesus_1_can_summon_army
--
---------------------------------------------------------------

do
	local name = "RACIAL_fm_rhesus_1_can_summon_army";		-- Unique string name for this intervention
	local cost = INTERVENTION_COST_NO_COST;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;				-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Your new ally offers support even before the battle lines are drawn; they will allow you to recruit warriors from their army to swell your own ranks.
	local advice_key = "troy_rem_campaign_advisor_fm_rhesus_host_summon_01";	

	local infotext = {
		"troy_rem_campaign_advisor_rhesus_host_summon_01",
		"troy_rem_campaign_advisor_rhesus_host_summon_02",
		"troy_rem_campaign_advisor_rhesus_host_summon_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration


	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_rem_trj_thrace");

	
	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"PanelOpenedCampaign",
		function(context)
			return context.string == "fm_rhesus_1" and countless_host.can_summon_an_army()
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;


---------------------------------------------------------------
--
--	RACIAL_fm_rhesus_1_summoned_army_selected
--
---------------------------------------------------------------

do
	local name = "RACIAL_fm_rhesus_1_summoned_army_selected";		-- Unique string name for this intervention
	local cost = INTERVENTION_COST_NO_COST;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;				-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Your new ally offers support even before the battle lines are drawn; they will allow you to recruit warriors from their army to swell your own ranks.
	local advice_key = "troy_rem_campaign_advisor_fm_rhesus_host_ready_01";	

	local infotext = {
		"troy_rem_campaign_advisor_rhesus_host_ready_01",
		"troy_rem_campaign_advisor_rhesus_host_ready_02",
		"troy_rem_campaign_advisor_rhesus_host_ready_03",
		"troy_rem_campaign_advisor_rhesus_host_ready_04",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration


	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_rem_trj_thrace");

	
	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"CharacterSelected",
		function(context)
			local character = context:character()
			return character and character:has_military_force() and countless_host.current_summoned_armies[character:military_force():command_queue_index()]
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;

---------------------------------------------------------------
--
--	RACIAL_fm_rhesus_2_sacred_initiations_available
--
---------------------------------------------------------------

do
	local name = "RACIAL_fm_rhesus_2_sacred_initiations_available";		-- Unique string name for this intervention
	local cost = INTERVENTION_COST_NO_COST;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;				-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Your new ally offers support even before the battle lines are drawn; they will allow you to recruit warriors from their army to swell your own ranks.
	local advice_key = "troy_rem_campaign_advisor_fm_rhesus_rituals_initiations_01";	

	local infotext = {
		"troy_rem_campaign_advisor_rhesus_rituals_initiations_01",
		"troy_rem_campaign_advisor_rhesus_rituals_initiations_02",
		"troy_rem_campaign_advisor_rhesus_rituals_initiations_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration


	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_faction_precondition("troy_rem_trj_thrace");

	
	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"PanelOpenedCampaign",
		function(context)
			local sacred_initiation_keys = {
				"zibelthiurdos_oath",
				"sabazios_oath",
				"zalmoxis_oath"
			}
			local is_any_sacred_ritual_available = false

			if context.string == "fm_rhesus_2" then 
				for i, ritual_key in ipairs(sacred_initiation_keys) do
					if thracian_rituals.can_activate_ritual(ritual_key, true, true) then
						is_any_sacred_ritual_available = true
					end
				end
				
				return  is_any_sacred_ritual_available
			end
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;


---------------------------------------------------------------
--
--	INFO_troy_city_replenishment
--
---------------------------------------------------------------

do
	local name = "INFO_troy_city_replenishment";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_NO_COST;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_MINIMAL_LOW_HIGH;		-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Ah Troy! The world has never known a city so glorious… and so full of riches. Ilios is a prize worth dying for.
	local advice_key = "troy_campaign_advisor_victory_options_02";

	--The infotexts used are linked in DaVE in the advice_levels_info_text_juncs table so no need to supply infotexts here.
		local infotext = {
		"troy_camp_info_troy_city_replenishment_01",
		"troy_camp_info_troy_city_replenishment_02",
	}; 
	
	local troy_region_key = "troy_main_ilion_troy";

	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"SettlementSelected",
		function(context)
			if context:garrison_residence():region():name() == troy_region_key then
				return true;
			end;
		end
	);

	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				nil, --infotext,							-- infotext
				nil											-- mission manager
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;


---------------------------------------------------------------
--
--	INFO_thebes_strong_garrison
--
---------------------------------------------------------------

do
	local name = "INFO_thebes_strong_garrison";				-- Unique string name for this intervention
	local cost = INTERVENTION_COST_NO_COST;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_MINIMAL_LOW_HIGH;		-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- PH ADVISER KEY
	local advice_key = "troy_adi_campaign_advisor_thebes_01";

	local infotext = {
		"troy_adi_campaign_advisor_thebes_info_01",
		"troy_adi_campaign_advisor_thebes_info_02",
		"troy_adi_campaign_advisor_thebes_info_03",
	};
	local thebes_region_key = "troy_main_boeotia_thebes";

	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"SettlementSelected",
		function(context)
			if context:garrison_residence():region():name() == thebes_region_key then
				return true;
			end;
		end
	);

	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;


---------------------------------------------------------------
--
--	INFO_zeleia_selected
--
---------------------------------------------------------------

do
	local name = "INFO_zeleia_selected";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_NO_COST;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_MINIMAL_LOW_HIGH;		-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- PH ADVISER KEY
	local advice_key = "troy_adi_campaign_advisor_zeleia_01";

	local infotext = {
		"troy_adi_campaign_advisor_zeleia_info_01",
		"troy_adi_campaign_advisor_zeleia_info_02",
		"troy_adi_campaign_advisor_zeleia_info_03",
	};
	local zeleia_region_key = "troy_main_ide_zeleia";

	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_precondition(function()
		if cm:get_local_faction_culture() == "troy_main_clt_danaans" then
			return true
		end,
		"player culture must be Danaans"
	end)

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"SettlementSelected",
		function(context)
			if context:garrison_residence():region():name() == zeleia_region_key then
				return true;
			end;
		end
	);

	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;


---------------------------------------------------------------
--
--	ADMINISTRATION_feature_description
--
---------------------------------------------------------------

do
	local name = "ADMINISTRATION_feature_description";		-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Efficient Administration is a vital component in ruling any land or people. All units and settlements cost Administration, requiring more or less depending on their strength and size. Yet the peril of beaurocracy also comes with its own consequences. These negative effects may be viewed in the administration bar.
	local advice_key = "troy_mth_administration_feature_description";
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	new_intervention:add_player_not_faction_precondition("troy_amazons_trj_penthesilea")
	new_intervention:add_player_not_faction_precondition("troy_rem_horde_aethiopians")
	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventAdministrationTierChange",
		function(context)
			--if cm:get_local_faction_name(true) == context:faction_name() then
				return true
			--else 
			--	return false
			--end
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key 								 	-- advice key
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;


---------------------------------------------------------------
--
--	DIVINE_will_army_abilities_in_campaign
--
---------------------------------------------------------------

do
	local name = "DIVINE_will_army_abilities_in_campaign";	-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;				-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Those truly blessed with the highest favour of the Gods may be granted great abilities in their name. Through prayer and devotion, these gifts will serve you well in all battles to come, thus it would be wise not to waste it.
	local advice_key = "troy_mth_divine_will_army_ablities_campaign";
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration

	new_intervention:add_precondition( function() return cm:get_campaign_name() == "troy_mythic" end, "campaign must be mythic" )


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"PanelOpenedCampaign",
		function(context)
			local gods = {
				"athena",
				"poseidon",
				"aphrodite",
				"artemis",
				"hephaestus",
				"hera",
				"zeus",
				"ares",
				"apollo",
			}
			local target_god_tier = 1

			if context.string == "gods_and_favor" then
				local player_faction_key = cm:get_faction(cm:get_local_faction_name(true))

				for i, god_name in ipairs(gods) do
					if player_faction_key:attitude_tier_for_god(god_name) >= target_god_tier then
						return true
					end
				end
			end	
			return false
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key 								-- advice key
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;







---------------------------------------------------------------
--
--	MYTHIC_onboarding_missions_cerberus
--
---------------------------------------------------------------

do
	local name = "MYTHIC_onboarding_missions_cerberus";		-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Recruiting an Expedition army requires an efficient Administration, to draw both the brave, and the foolhardy to your undertaking. Such an adventure is sure to be long and perilous, for no Monster of legend is likely to capitulate without a fight.
	local advice_key = "troy_mth_mythic_onboarding_missions_cerberus";
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration

	new_intervention:add_precondition( function() return cm:get_campaign_name() == "troy_mythic" end, "campaign must be mythic" )


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventMythicMonsterMissionTriggered",
		function(context)
			if context.string == "troy_mth_intro_shade_early_game_mission" then
				return true
			else
				return false
			end
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key 								-- advice key
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;


---------------------------------------------------------------
--
--	MYTHIC_onboarding_missions_griffin
--
---------------------------------------------------------------

do
	local name = "MYTHIC_onboarding_missions_griffin";		-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Recruiting an Expedition army requires an efficient Administration, to draw both the brave, and the foolhardy to your undertaking. Such an adventure is sure to be long and perilous, for no Monster of legend is likely to capitulate without a fight.
	local advice_key = "troy_mth_mythic_onboarding_missions_griffin";
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration

	new_intervention:add_precondition( function() return cm:get_campaign_name() == "troy_mythic" end, "campaign must be mythic" )


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventMythicMonsterMissionTriggered",
		function(context)
			if context.string == "troy_mth_intro_griffin_early_game_mission" then
				return true
			else
				return false
			end
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key 								-- advice key
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;



---------------------------------------------------------------
--
--	MYTHIC_onboarding_missions_hydra
--
---------------------------------------------------------------

do
	local name = "MYTHIC_onboarding_missions_hydra";		-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Recruiting an Expedition army requires an efficient Administration, to draw both the brave, and the foolhardy to your undertaking. Such an adventure is sure to be long and perilous, for no Monster of legend is likely to capitulate without a fight.
	local advice_key = "troy_mth_mythic_onboarding_missions_hydra";
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration

	new_intervention:add_precondition( function() return cm:get_campaign_name() == "troy_mythic" end, "campaign must be mythic" )


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventMythicMonsterMissionTriggered",
		function(context)
			if context.string == "troy_mth_intro_hydra_early_game_mission" then
				return true
			else
				return false
			end
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key 								-- advice key
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;







---------------------------------------------------------------
--
--	MYTHIC_monster_selection_for_expedition
--
---------------------------------------------------------------

do
	local name = "MYTHIC_monster_selection_for_expedition";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;			-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Recruiting an Expedition army requires an efficient Administration, to draw both the brave, and the foolhardy to your undertaking. Such an adventure is sure to be long and perilous, for no Monster of legend is likely to capitulate without a fight.
	local advice_key = "troy_mth_mythic_monster_select_expedition";
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration

	new_intervention:add_precondition( function() return cm:get_campaign_name() == "troy_mythic" end, "campaign must be mythic" )


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"FactionTurnStart",
		function(context)
			if context:faction():name() == cm:get_local_faction_name(true) then
				if cm:turn_number() >= mythic_monsters_expeditions.unlock_turn then
					return true
				end
			end
			return false
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key 								-- advice key
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;







---------------------------------------------------------------
--
--	MYTHIC_expedition_start
--
---------------------------------------------------------------

do
	local name = "MYTHIC_expedition_start";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;				-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Recruiting an Expedition army requires an efficient Administration, to draw both the brave, and the foolhardy to your undertaking. Such an adventure is sure to be long and perilous, for no Monster of legend is likely to capitulate without a fight.
	local advice_key = "troy_mth_mythic_expedition_start";
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration

	new_intervention:add_precondition( function() return cm:get_campaign_name() == "troy_mythic" end, "campaign must be mythic" )


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"PanelOpenedCampaign",
		function(context)
			if cm:get_campaign_name() == "troy_mythic" then 
				if context.string == mythic_monsters_expeditions.ui.panel then
					return true
				end
			end
			return false
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key 								-- advice key
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;





---------------------------------------------------------------
--
--	MYTHIC_expedition_army_sent
--
---------------------------------------------------------------

do
	local name = "MYTHIC_expedition_army_sent";				-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;				-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Recruiting an Expedition army requires an efficient Administration, to draw both the brave, and the foolhardy to your undertaking. Such an adventure is sure to be long and perilous, for no Monster of legend is likely to capitulate without a fight.
	local advice_key = "troy_mth_mythic_expedition_army_sent";
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration

	new_intervention:add_precondition( function() return cm:get_campaign_name() == "troy_mythic" end, "campaign must be mythic" )


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventArmySentOnExpedition",
		true
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key 								-- advice key
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;







---------------------------------------------------------------
--
--	MYTHIC_expedition_first_dilemma
--
---------------------------------------------------------------

do
	local name = "MYTHIC_expedition_first_dilemma";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;				-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Recruiting an Expedition army requires an efficient Administration, to draw both the brave, and the foolhardy to your undertaking. Such an adventure is sure to be long and perilous, for no Monster of legend is likely to capitulate without a fight.
	local advice_key = "troy_mth_mythic_expedition_first_dilemma";
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration

	new_intervention:add_precondition( function() return cm:get_campaign_name() == "troy_mythic" end, "campaign must be mythic" )


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventMythicExpeditionDilemma",
		true
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key 								-- advice key
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;



---------------------------------------------------------------
--
--	MYTHIC_expedition_quest_battle_reached
--
---------------------------------------------------------------

do
	local name = "MYTHIC_expedition_quest_battle_reached";	-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;				-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Recruiting an Expedition army requires an efficient Administration, to draw both the brave, and the foolhardy to your undertaking. Such an adventure is sure to be long and perilous, for no Monster of legend is likely to capitulate without a fight.
	local advice_key = "troy_mth_mythic_expedition_quest_battle_reached";
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration

	new_intervention:add_precondition( function() return cm:get_campaign_name() == "troy_mythic" end, "campaign must be mythic" )


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventQuestBattleReached",
		true
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key 								-- advice key
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;








---------------------------------------------------------------
--
--	MYTHIC_monster_unlocked_cerberus
--
---------------------------------------------------------------

do
	local name = "MYTHIC_monster_unlocked_cerberus";		-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_MINIMAL_LOW_HIGH;		-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;				-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Recruiting an Expedition army requires an efficient Administration, to draw both the brave, and the foolhardy to your undertaking. Such an adventure is sure to be long and perilous, for no Monster of legend is likely to capitulate without a fight.
	local advice_key = "troy_mth_mythic_monster_unlocked_cerberus";
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration

	new_intervention:add_precondition( function() return cm:get_campaign_name() == "troy_mythic" end, "campaign must be mythic" )
	new_intervention:set_must_trigger(true)


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventMythicMonsterUnlocked",
		function(context)
			local unlocked_monster_key = context.string
			local unlocked_for_faction = context:faction():name()
			local player_faction = cm:get_local_faction_name(true)

			if unlocked_monster_key == "MYTHIC_MONSTER_CERBERUS" and unlocked_for_faction == player_faction then
				return true
			end
			return false
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key 								-- advice key
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;



---------------------------------------------------------------
--
--	MYTHIC_monster_unlocked_griffin
--
---------------------------------------------------------------

do
	local name = "MYTHIC_monster_unlocked_griffin";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_MINIMAL_LOW_HIGH;		-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;				-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Recruiting an Expedition army requires an efficient Administration, to draw both the brave, and the foolhardy to your undertaking. Such an adventure is sure to be long and perilous, for no Monster of legend is likely to capitulate without a fight.
	local advice_key = "troy_mth_mythic_monster_unlocked_griffin";
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration

	new_intervention:add_precondition( function() return cm:get_campaign_name() == "troy_mythic" end, "campaign must be mythic" )
	new_intervention:set_must_trigger(true)


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventMythicMonsterUnlocked",
		function(context)
			local unlocked_monster_key = context.string
			local unlocked_for_faction = context:faction():name()
			local player_faction = cm:get_local_faction_name(true)

			if unlocked_monster_key == "MYTHIC_MONSTER_GRIFFIN" and unlocked_for_faction == player_faction then
				return true
			end
			return false
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key 								-- advice key
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;






---------------------------------------------------------------
--
--	MYTHIC_monster_unlocked_hydra
--
---------------------------------------------------------------

do
	local name = "MYTHIC_monster_unlocked_hydra";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_MINIMAL_LOW_HIGH;		-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;				-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Recruiting an Expedition army requires an efficient Administration, to draw both the brave, and the foolhardy to your undertaking. Such an adventure is sure to be long and perilous, for no Monster of legend is likely to capitulate without a fight.
	local advice_key = "troy_mth_mythic_monster_unlocked_hydra";
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration

	new_intervention:add_precondition( function() return cm:get_campaign_name() == "troy_mythic" end, "campaign must be mythic" )
	new_intervention:set_must_trigger(true)


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventMythicMonsterUnlocked",
		function(context)
			local unlocked_monster_key = context.string
			local unlocked_for_faction = context:faction():name()
			local player_faction = cm:get_local_faction_name(true)

			if unlocked_monster_key == "MYTHIC_MONSTER_HYDRA" and unlocked_for_faction == player_faction then
				return true
			end
			return false
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key 								-- advice key
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;





---------------------------------------------------------------
--
--	MYTHIC_monster_campaign_new_buildings
--
---------------------------------------------------------------

do
	local name = "MYTHIC_monster_campaign_new_buildings";	-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;				-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Recruiting an Expedition army requires an efficient Administration, to draw both the brave, and the foolhardy to your undertaking. Such an adventure is sure to be long and perilous, for no Monster of legend is likely to capitulate without a fight.
	local advice_key = "troy_mth_mythic_monster_campaign_new_buildings";
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration

	new_intervention:add_precondition( function() return cm:get_campaign_name() == "troy_mythic" end, "campaign must be mythic" )


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"SettlementSelected",
		function(context)
			local player_faction_name = cm:get_local_faction_name()
			local selected_settlement_faction_name = context:garrison_residence():faction():name()

			if mythic_monsters_common:unlocked_monster(player_faction_name) and selected_settlement_faction_name == player_faction_name then
				return true
			end

			return false
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key 								-- advice key
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;




---------------------------------------------------------------
--
--	MYTHIC_monster_campaign_new_army_stance
--
---------------------------------------------------------------

do
	local name = "MYTHIC_monster_campaign_new_army_stance";	-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;				-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Recruiting an Expedition army requires an efficient Administration, to draw both the brave, and the foolhardy to your undertaking. Such an adventure is sure to be long and perilous, for no Monster of legend is likely to capitulate without a fight.
	local advice_key = "troy_mth_mythic_monster_campaign_new_army_stance";
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration

	new_intervention:add_precondition( function() return cm:get_campaign_name() == "troy_mythic" end, "campaign must be mythic" )

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"AgentEntersMilitaryForce",
		function(context)
			local faction_name = cm:get_local_faction_name(true)
			
			if mythic_monsters_common:unlocked_monster(faction_name) ~= nil then
				if context:character():character_subtype_key() == mythic_monster_hydra_config.agent_subtype then
					return true
				elseif context:character():character_subtype_key() == mythic_monster_griffin_config.agent_subtype then
					return true
				end
			end
			
			return false
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key 								-- advice key
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;







---------------------------------------------------------------
--
--	MYTHIC_monster_campaign_new_edict
--
---------------------------------------------------------------

do
	local name = "MYTHIC_monster_campaign_new_edict";		-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;				-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Recruiting an Expedition army requires an efficient Administration, to draw both the brave, and the foolhardy to your undertaking. Such an adventure is sure to be long and perilous, for no Monster of legend is likely to capitulate without a fight.
	local advice_key = "troy_mth_mythic_monster_campaign_new_edict";
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration


	new_intervention:add_precondition( function() return cm:get_campaign_name() == "troy_mythic" end, "campaign must be mythic" )

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"SettlementSelected",
		function(context)
			
			local player_faction_name = cm:get_local_faction_name(true)
			local selected_settlement_faction_name = context:garrison_residence():faction():name()
			
			if selected_settlement_faction_name == player_faction_name then
				local unlocked_monster = mythic_monsters_common:unlocked_monster(player_faction_name)
				local is_province_mine = true
				local does_province_contain_pit = false
				local province = context:garrison_residence():region():province()
				local number_of_regions = province:regions():num_items()

				for i=0, number_of_regions - 1 do
					if province:regions():item_at(i):owning_faction():name() ~= player_faction_name then
						is_province_mine = false
						break
					end
					if province:regions():item_at(i):building_exists("troy_mth_special_cerberus_3") or 
					province:regions():item_at(i):building_exists("troy_mth_special_cerberus_5") then
						does_province_contain_pit = true
					end
				end

				if is_province_mine and does_province_contain_pit and unlocked_monster:id() == "MYTHIC_MONSTER_CERBERUS" then
					return true
				end
				return false
			end

		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key 								-- advice key
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;







---------------------------------------------------------------
--
--	MYTHIC_monster_campaign_new_post_battle_options
--
---------------------------------------------------------------

do
	local name = "MYTHIC_monster_campaign_new_post_battle_options";		-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;				-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = true;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = true;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Recruiting an Expedition army requires an efficient Administration, to draw both the brave, and the foolhardy to your undertaking. Such an adventure is sure to be long and perilous, for no Monster of legend is likely to capitulate without a fight.
	local advice_key = "troy_mth_mythic_monster_campaign_new_post_battle_options";
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration

	new_intervention:add_precondition( function() return cm:get_campaign_name() == "troy_mythic" end, "campaign must be mythic" )


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerWinsBattle",
		function(context)
			local pb = context:pending_battle()
			local player_faction = cm:get_faction(cm:get_local_faction_name(true))
			local player_char
			
			local player_was_primary_attacker = (pb:has_attacker() and pb:attacker():faction() == player_faction);
			local player_was_primary_defender = (pb:has_defender() and pb:defender():faction() == player_faction);
			if player_was_primary_attacker then
				player_char = pb:attacker()
			elseif player_was_primary_defender then
				player_char = pb:defender()
			end
			local military_force_char_list = player_char:military_force():character_list()
			for i=0, military_force_char_list:num_items()-1 do 
				local curr_char = military_force_char_list:item_at(i)
				if curr_char:character_subtype("troy_mth_agent_cerberus")
				or curr_char:character_subtype("troy_mth_agent_griffin")
				or curr_char:character_subtype("troy_mth_agent_hydra") then
					return true
				end
			end
			return false
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key 								-- advice key
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;






---------------------------------------------------------------
--
--	MYTHIC_monster_campaign_progression
--
---------------------------------------------------------------

do
	local name = "MYTHIC_monster_campaign_progression";		-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;				-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Recruiting an Expedition army requires an efficient Administration, to draw both the brave, and the foolhardy to your undertaking. Such an adventure is sure to be long and perilous, for no Monster of legend is likely to capitulate without a fight.
	local advice_key = "troy_mth_mythic_monster_campaign_progression";
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration

	new_intervention:add_precondition( function() return cm:get_campaign_name() == "troy_mythic" end, "campaign must be mythic" )


	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"PanelOpenedCampaign",
		function(context)
			if context.string == "monster_progression" then
				return true
			end
			return false
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key 								-- advice key
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;









---------------------------------------------------------------
--
--	FLC_bodyguard_skill_available
--
---------------------------------------------------------------

do
	local name = "FLC_bodyguard_skill_available";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;				-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;				-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	-- Recruiting an Expedition army requires an efficient Administration, to draw both the brave, and the foolhardy to your undertaking. Such an adventure is sure to be long and perilous, for no Monster of legend is likely to capitulate without a fight.
	local advice_key = "troy_mth_flc_bodyguard_skill_available";
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration

	new_intervention:add_precondition(function() return cm:get_campaign_name() == "troy_historical" end, "campaign must be historical" )

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"CharacterRankUp",
		function(context)
			local player_faction_key = cm:get_local_faction_name(true)
			local character_rank = context:character():rank()
			local character_faction_key = context:character():faction():name()
			local campaign_name = cm:get_campaign_name()

			if campaign_name == "troy_historical" then
				if character_rank == 3 and character_faction_key == player_faction_key then
					return true
				end
			end
			return false
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key 								-- advice key
			);
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;
]]

---------------------------------------------------------------
--
--	PHAR_anchient_legacy_akhenaten_selected
--
---------------------------------------------------------------

do
	local name = "PHAR_anchient_legacy_akhenaten_selected";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_legacy_akhenaten_01";

	local infotext = {
		"phar_camp_info_legacy_akhenaten_11",
		"phar_camp_info_legacy_akhenaten_12",
		"phar_camp_info_legacy_akhenaten_13",
		"phar_camp_info_legacy_akhenaten_14",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"UITriggerScriptEvent",
		function(context)
			if context:trigger():split(":")[1] == "legacy_claim" then
				local params = context:trigger():split(":")
				local faction_cqi = context:faction_cqi()
				local faction = cm:model():faction_for_command_queue_index(faction_cqi)
				local faction_key = faction:name()
				local local_faction_name = cm:get_local_faction_name(true)

				return params[2] == "phar_ancient_legacy_akhenaten" and local_faction_name == faction_key
			end
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, true);
end;

---------------------------------------------------------------
--
--	PHAR_anchient_legacy_akhenaten_panel_opened
--
---------------------------------------------------------------

do
	local name = "PHAR_anchient_legacy_akhenaten_panel_opened";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;									-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;							-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;							-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;							-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;									-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;									-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_legacy_akhenaten_02";

	local infotext = {
		"phar_camp_info_legacy_akhenaten_21",
		"phar_camp_info_legacy_akhenaten_22",
		"phar_camp_info_legacy_akhenaten_23",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"PanelOpenedCampaign",
		function(context)
			local aten = find_uicomponent(core:get_ui_root(), "local_deities","god_culture_tabs","aten_tab_button")
			return context.string == "local_deities" and aten and aten:Visible()
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, true);
end;

---------------------------------------------------------------
--
--	PHAR_anchient_legacy_hatshepsut_selected
--
---------------------------------------------------------------

do
	local name = "PHAR_anchient_legacy_hatshepsut_selected";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_legacy_hatshepsut_01";

	local infotext = {
		"phar_camp_info_legacy_hatshepsut_11",
		"phar_camp_info_legacy_hatshepsut_12",
		"phar_camp_info_legacy_hatshepsut_13",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"UITriggerScriptEvent",
		function(context)
			if context:trigger():split(":")[1] == "legacy_claim" then
				local params = context:trigger():split(":")
				local faction_cqi = context:faction_cqi()
				local faction = cm:model():faction_for_command_queue_index(faction_cqi)
				local faction_key = faction:name()
				local local_faction_name = cm:get_local_faction_name(true)

				return params[2] == "phar_ancient_legacy_hatshepsut" and local_faction_name == faction_key
			end
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, true);
end;

---------------------------------------------------------------
--
--	UI_PHAR_anchient_legacy_hatshepsut_panel_opened
--
---------------------------------------------------------------

do	
	local name = "UI_PHAR_anchient_legacy_hatshepsut_panel_opened";	-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;							-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "legacy_hatshepsut";							-- Fullscreen panel to listen for
	
	local advice_key = "phar_campaign_advisor_legacy_hatshepsut_02";

	local infotext = {
		"phar_camp_info_legacy_hatshepsut_21",
		"phar_camp_info_legacy_hatshepsut_22",
		"phar_camp_info_legacy_hatshepsut_23",
	};

	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name, true);

	

end;

---------------------------------------------------------------
--
--	PHAR_anchient_legacy_hatshepsut_destination_reached
--
---------------------------------------------------------------

do
	local name = "PHAR_anchient_legacy_hatshepsut_destination_reached";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;									-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;							-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;							-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;							-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;									-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;									-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_legacy_hatshepsut_03";

	local infotext = {
		"phar_camp_info_legacy_hatshepsut_31",
		"phar_camp_info_legacy_hatshepsut_32",
		"phar_camp_info_legacy_hatshepsut_33",
		"phar_camp_info_legacy_hatshepsut_34",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptedEventHatshepsutDestinationReached",
		function(context)
			return true
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, true);
end;

---------------------------------------------------------------
--
--	PHAR_anchient_legacy_hatshepsut_expedition_returned
--
---------------------------------------------------------------

do
	local name = "PHAR_anchient_legacy_hatshepsut_expedition_returned";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;									-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;							-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;							-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;							-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;									-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;									-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_legacy_hatshepsut_04";

	local infotext = {
		"phar_camp_info_legacy_hatshepsut_41",
		"phar_camp_info_legacy_hatshepsut_42",
		"phar_camp_info_legacy_hatshepsut_43",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptedEventHatshepsutExpeditionReturned",
		function(context)
			return true
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, true);
end;

---------------------------------------------------------------
--
--	PHAR_anchient_legacy_tudhaliya_selected
--
---------------------------------------------------------------

do
	local name = "PHAR_anchient_legacy_tudhaliya_selected";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_legacy_tudhaliya_01";

	local infotext = {
		"phar_camp_info_legacy_tudhaliya_11",
		"phar_camp_info_legacy_tudhaliya_12",
		"phar_camp_info_legacy_tudhaliya_13",
		"phar_camp_info_legacy_tudhaliya_14",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"UITriggerScriptEvent",
		function(context)
			if context:trigger():split(":")[1] == "legacy_claim" then
				local params = context:trigger():split(":")
				local faction_cqi = context:faction_cqi()
				local faction = cm:model():faction_for_command_queue_index(faction_cqi)
				local faction_key = faction:name()
				local local_faction_name = cm:get_local_faction_name(true)

				return params[2] == "phar_ancient_legacy_tudhaliya" and local_faction_name == faction_key
			end
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	)

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, true);
end;

---------------------------------------------------------------
--
--	UI_PHAR_anchient_legacy_tudhaliya_panel_opened
--
---------------------------------------------------------------

do	
	local name = "UI_PHAR_anchient_legacy_tudhaliya_panel_opened";	-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;							-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "legacy_tudhaliya";							-- Fullscreen panel to listen for
	
	local advice_key = "phar_campaign_advisor_legacy_tudhaliya_02";

	local infotext = {
		"phar_camp_info_legacy_tudhaliya_21",
		"phar_camp_info_legacy_tudhaliya_22",
		"phar_camp_info_legacy_tudhaliya_23",
		"phar_camp_info_legacy_tudhaliya_24",
	};

	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name, true);

	
end;

---------------------------------------------------------------
--
--	PHAR_anchient_legacy_tudhaliya_prince_won_battle
--
---------------------------------------------------------------

do
	local name = "PHAR_anchient_legacy_tudhaliya_prince_won_battle";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_legacy_tudhaliya_03";

	local infotext = {
		"phar_camp_info_legacy_tudhaliya_31",
		"phar_camp_info_legacy_tudhaliya_32",
		"phar_camp_info_legacy_tudhaliya_33",
		"phar_camp_info_legacy_tudhaliya_34",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPrinceFoughtBattle",
		function(context)
			return context.bool == true and context:faction() == cm:get_local_faction(true)
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	)

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, true);
end;



---------------------------------------------------------------
--
--	PHAR_anchient_legacy_tudhaliya_prince_died
--
---------------------------------------------------------------

do
	local name = "PHAR_anchient_legacy_tudhaliya_prince_died";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_legacy_tudhaliya_04";

	local infotext = {
		"phar_camp_info_legacy_tudhaliya_41",
		"phar_camp_info_legacy_tudhaliya_42",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPrinceDied",
		function(context)
			return context:faction() == cm:get_local_faction(true)
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	)

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, true);
end;

---------------------------------------------------------------
--
--	PHAR_anchient_legacy_muwatalli_selected
--
---------------------------------------------------------------

do
	local name = "PHAR_anchient_legacy_muwatalli_selected";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_legacy_muwatalli_01";

	local infotext = {
		"phar_camp_info_legacy_muwatalli_11",
		"phar_camp_info_legacy_muwatalli_12",
		"phar_camp_info_legacy_muwatalli_13",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"UITriggerScriptEvent",
		function(context)
			if context:trigger():split(":")[1] == "legacy_claim" then
				local params = context:trigger():split(":")
				local faction_cqi = context:faction_cqi()
				local faction = cm:model():faction_for_command_queue_index(faction_cqi)
				local faction_key = faction:name()
				local local_faction_name = cm:get_local_faction_name(true)

				return params[2] == "phar_ancient_legacy_muwatalli" and local_faction_name == faction_key
			end
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	)

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, true);
end;

---------------------------------------------------------------
--
--	PHAR_anchient_legacy_muwatalli_gratitude
--
---------------------------------------------------------------

do
	local name = "PHAR_anchient_legacy_muwatalli_gratitude";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_legacy_muwatalli_02";

	local infotext = {
		"phar_camp_info_legacy_muwatalli_21",
		"phar_camp_info_legacy_muwatalli_22",
		"phar_camp_info_legacy_muwatalli_23",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"PooledResourceTransactionEvent",
		function(context)
			local resource = context:resource()
			local context_faction = context:faction()
			local player_faction = cm:get_local_faction(true)
			if resource:key() == "phar_muwatalli_gratitude" then
				return resource:value() >= 80 and context_faction == player_faction
			end
			return false
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	)

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, true);
end;

---------------------------------------------------------------
--
--	UI_PHAR_victory_journal_panel_opened
--
---------------------------------------------------------------

do	
	local name = "UI_PHAR_victory_journal_panel_opened";	-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;					-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "journal";					-- Fullscreen panel to listen for
	
	local advice_key = "phar_campaign_advisor_victory_journal_01";

	local infotext = {
		"phar_camp_info_victory_journal_01",
		"phar_camp_info_victory_journal_02",
		"phar_camp_info_victory_journal_03",
	};

	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name, true);

	

end;

---------------------------------------------------------------
--
--	PHAR_victory_point_gained
--
---------------------------------------------------------------

do
	local name = "PHAR_victory_point_gained";						-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;							-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = 10;							-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_victory_points_01";
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"PooledResourceTransactionEvent",
		function(context)
			local resource = context:resource()
			local context_faction = context:faction()
			local player_faction = cm:get_local_faction(true)
			if resource:key() == "phar_victory_points" then
				return context:amount() >= 1 and context_faction == player_faction
			end
			return false
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key
			);
		end
	)

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, true);
end;

---------------------------------------------------------------
--
--	PHAR_anchient_legacy_khufu_selected
--
---------------------------------------------------------------

do
	local name = "PHAR_anchient_legacy_khufu_selected";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_legacy_khufu_01";

	local infotext = {
		"phar_camp_info_legacy_khufu_11",
		"phar_camp_info_legacy_khufu_12",
		"phar_camp_info_legacy_khufu_13",
		"phar_camp_info_legacy_khufu_14",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"UITriggerScriptEvent",
		function(context)
			if context:trigger():split(":")[1] == "legacy_claim" then
				local params = context:trigger():split(":")
				local faction_cqi = context:faction_cqi()
				local faction = cm:model():faction_for_command_queue_index(faction_cqi)
				local faction_key = faction:name()
				local local_faction_name = cm:get_local_faction_name(true)

				return params[2] == "phar_ancient_legacy_khufu" and local_faction_name == faction_key
			end
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, true);
end;

---------------------------------------------------------------
--
--	PHAR_anchient_legacy_thutmose_selected
--
---------------------------------------------------------------

do
	local name = "PHAR_anchient_legacy_thutmose_selected";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_legacy_thut_01";

	local infotext = {
		"phar_camp_info_legacy_thut_11",
		"phar_camp_info_legacy_thut_12",
		"phar_camp_info_legacy_thut_13",
		"phar_camp_info_legacy_thut_14",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"UITriggerScriptEvent",
		function(context)
			if context:trigger():split(":")[1] == "legacy_claim" then
				local params = context:trigger():split(":")
				local faction_cqi = context:faction_cqi()
				local faction = cm:model():faction_for_command_queue_index(faction_cqi)
				local faction_key = faction:name()
				local local_faction_name = cm:get_local_faction_name(true)

				return params[2] == "phar_ancient_legacy_thutmose" and local_faction_name == faction_key
			end
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, true);
end;

---------------------------------------------------------------
--
--	PHAR_anchient_legacy_thutmose_culmination_battle
--
---------------------------------------------------------------

do
	local name = "PHAR_anchient_legacy_thutmose_culmination_battle";	-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;							-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;							-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;							-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;									-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;									-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_legacy_thut_02";

	local infotext = {
		"phar_camp_info_legacy_thut_21",
		"phar_camp_info_legacy_thut_22",
		"phar_camp_info_legacy_thut_23",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptedEventThutmoseCulminationReached",
		function(context)
			if context:faction_key() == cm:get_local_faction_name() then
				return context:culmination_key() == "culmination_support" 
			end
			return false
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, true);
end;

---------------------------------------------------------------
--
--	PHAR_anchient_legacy_thutmose_culmination_surrender
--
---------------------------------------------------------------

do
	local name = "PHAR_anchient_legacy_thutmose_culmination_surrender";	-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;							-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;							-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;							-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;									-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;									-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_legacy_thut_03";

	local infotext = {
		"phar_camp_info_legacy_thut_31",
		"phar_camp_info_legacy_thut_32",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptedEventThutmoseCulminationReached",
		function(context)
			if context:faction_key() == cm:get_local_faction_name() then
				return context:culmination_key() == "culmination_balanced" 
			end
			return false
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, true);
end;

---------------------------------------------------------------
--
--	PHAR_anchient_legacy_thutmose_culmination_sally_out
--
---------------------------------------------------------------

do
	local name = "PHAR_anchient_legacy_thutmose_culmination_sally_out";	-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;							-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;							-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;							-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;									-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;									-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_legacy_thut_04";

	local infotext = {
		"phar_camp_info_legacy_thut_41",
		"phar_camp_info_legacy_thut_42",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptedEventThutmoseCulminationReached",
		function(context)
			if context:faction_key() == cm:get_local_faction_name() then
				return context:culmination_key() == "culmination_sabotage" 
			end
			return false
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, true);
end;

---------------------------------------------------------------
--
--	PHAR_legitimacy_intro
--
---------------------------------------------------------------

do
	local name = "PHAR_legitimacy_intro";							-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = 12;							-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_legitimacy_01";

	local infotext = {
		"phar_camp_info_legitimacy_01",
		"phar_camp_info_legitimacy_02",
		"phar_camp_info_legitimacy_03",
		"phar_camp_info_legitimacy_04",
		-- "phar_camp_info_legitimacy_05"
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionTurnStart",
		function(context)
			local player_faction = cm:get_local_faction()
			for _, region_key in ipairs(sacred_egypt_lands) do
				local curr_region = cm:get_region(region_key)
				if curr_region:owning_faction() == player_faction then
					return cm:model():turn_number() >= 3
				end
			end
			for _, region_key in ipairs(sacred_hatti_lands) do
				local curr_region = cm:get_region(region_key)
				if curr_region:owning_faction() == player_faction then
					return cm:model():turn_number() >= 3
				end
			end
			for _, region_key in ipairs(sacred_meso_lands) do
				local curr_region = cm:get_region(region_key)
				if curr_region:owning_faction() == player_faction then
					return cm:model():turn_number() >= 3
				end
			end
			return false
		end
	)

	new_intervention:add_trigger_condition(
		"RegionFactionChangeEvent",
		function(context)
			local player_faction = cm:get_local_faction()
			local region = context:region()
			local region_owner = region:owning_faction()
			local found = false
			if region_owner == player_faction then
				local region_key = region:name()
				if table_find(sacred_egypt_lands, region_key) then
					found = true
				end
				if table_find(sacred_hatti_lands, region_key) then
					found = true
				end
				if table_find(sacred_meso_lands, region_key) then
					found = true
				end
			end
			return found
		end
	)

	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	)

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, false);
end;

---------------------------------------------------------------
--
--	PHAR_legitimacy_gained_to_start_war_phar
--
---------------------------------------------------------------

do
	local name = "PHAR_legitimacy_gained_to_start_war_phar";		-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;							-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = 6;							-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_legitimacy_02";
	
	local infotext = {
		"phar_camp_info_legitimacy_11",
		"phar_camp_info_legitimacy_12",
		"phar_camp_info_legitimacy_13",
		"phar_camp_info_legitimacy_14",
	};
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"PooledResourceTransactionEvent",
		function(context)
			local resource = context:resource()
			local context_faction = context:faction()
			local player_faction = cm:get_local_faction(true)
			local faction_key = cm:get_local_faction_name(true)
			local resource_key = resource:key()

			if resource_key == "phar_legitimacy" and context:amount() >= 1 then
				return  context_faction == player_faction and resource:value() >= cm:get_float_script_state("legitimacy_to_start_war") and legitimacy_choice:egyptian_legitimacy_unlocked(faction_key)
			end

			return false

		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	)

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, true);
end;

---------------------------------------------------------------
--
--	PHAR_legitimacy_gained_to_join_war
--
---------------------------------------------------------------

do
	local name = "PHAR_legitimacy_gained_to_join_war";				-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;							-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = 6;							-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_legitimacy_04";
	
	local infotext = {
		"phar_camp_info_legitimacy_31",
		"phar_camp_info_legitimacy_32",
		"phar_camp_info_legitimacy_33",
		"phar_camp_info_legitimacy_34",
	};
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"PooledResourceTransactionEvent",
		function(context)
			local resource = context:resource()
			local context_faction = context:faction()
			local player_faction = cm:get_local_faction(true)
			local resource_key = resource:key()
			if resource_key == "phar_legitimacy" and context:amount() >= 1 then
				return  context_faction == player_faction and egypt_political_states:political_state() == "legitimacy_war" and resource:value() >= cm:get_float_script_state("legitimacy_to_join_war")
			end
			if resource_key == "phar_hatti_legitimacy" and context:amount() >= 1 then
				return  context_faction == player_faction and hatti_political_states:political_state() == "legitimacy_war" and resource:value() >= cm:get_float_script_state("hatti_legitimacy_to_join_war")
			end

			return false

		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	)

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, false);
end;

---------------------------------------------------------------
--
--	PHAR_legitimacy_gained_to_start_war_king
--
---------------------------------------------------------------

do
	local name = "PHAR_legitimacy_gained_to_start_war_king";		-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;							-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = 6;							-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_legitimacy_03";
	
	local infotext = {
		"phar_camp_info_legitimacy_21",
		"phar_camp_info_legitimacy_22",
		"phar_camp_info_legitimacy_23",
		"phar_camp_info_legitimacy_24",
	};
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- preconditions - any preconditions must return true for the intervention to start or trigger
	new_intervention:add_player_not_faction_precondition("phar_main_suppiluliuma");

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"PooledResourceTransactionEvent",
		function(context)
			local resource = context:resource()
			local context_faction = context:faction()
			local player_faction = cm:get_local_faction(true)
			local faction_key = cm:get_local_faction_name(true)
			local resource_key = resource:key()

			if resource_key == "phar_hatti_legitimacy" and context:amount() >= 1 then
				return  context_faction == player_faction and resource:value() >= cm:get_float_script_state("hatti_legitimacy_to_start_war") and legitimacy_choice:hatti_legitimacy_unlocked(faction_key)
			end

			return false

		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	)

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, true);
end;

---------------------------------------------------------------
--
--	PHAR_pillars_of_civilisation
--
---------------------------------------------------------------

do
	local name = "PHAR_pillars_of_civilisation";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;							-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "poc_panel";									-- Fullscreen panel to listen for

	local advice_key = "phar_campaign_advisor_maat_02";
	
	local infotext = {
		"phar_camp_info_maat_11",
		"phar_camp_info_maat_12",
		"phar_camp_info_maat_13",
		"phar_camp_info_maat_14",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name);

end;

---------------------------------------------------------------
--
--	PHAR_power_of_the_crown_panel_opened_as_pharaoh
--
---------------------------------------------------------------

do
	local name = "PHAR_power_of_the_crown_panel_opened_as_pharaoh";	-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_powers_intro_01";

	local infotext = {
		"phar_camp_info_powers_intro_01",
		"phar_camp_info_powers_intro_02",
		"phar_camp_info_powers_intro_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"PanelOpenedCampaign",
		function(context)
			local player_faction = cm:get_local_faction(true)
			return context.string == "pharaohs_crown" and cm:get_bool_script_state(player_faction, "is_sitting_pharaoh")
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	)

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, true);
end;

---------------------------------------------------------------
--
--	PHAR_power_of_the_crown_panel_opened_as_king
--
---------------------------------------------------------------

do
	local name = "PHAR_power_of_the_crown_panel_opened_as_king";	-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_powers_intro_02";

	local infotext = {
		"phar_camp_info_powers_intro_11",
		"phar_camp_info_powers_intro_12",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"PanelOpenedCampaign",
		function(context)
			local player_faction = cm:get_local_faction(true)
			return context.string == "pharaohs_crown" and cm:get_bool_script_state(player_faction, "is_sitting_great_king")
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	)

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, true);
end;

---------------------------------------------------------------
--
--	PHAR_province_completed
--
---------------------------------------------------------------

do
	local name = "PHAR_province_completed";							-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;							-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_commandments_01";

	local infotext = {
		"phar_camp_info_commandments_01",
		"phar_camp_info_commandments_02",
		"phar_camp_info_commandments_03",
		"phar_camp_info_commandments_04"
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"RegionFactionChangeEvent",
		function(context)
			local player_faction = cm:get_local_faction(true)
			local context_region = context:region()
			local context_faction = context_region:owning_faction()
			local province_regions = context_region:province():regions()
			local control_province = true

			if player_faction == context_faction then
				for i = 0, province_regions:num_items() -1 do 
					local curr_region = province_regions:item_at(i)
					if curr_region:owning_faction() ~= player_faction then
						control_province = false
					end
				end
				return control_province
			end

			return false
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	)

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, true);
end;

---------------------------------------------------------------
--
--	PHAR_trespassing
--
---------------------------------------------------------------

do
	local name = "PHAR_trespassing";								-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;							-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = 9;							-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;					-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_trespassing_01";

	local infotext = {
		"phar_camp_info_trespassing_01",
		"phar_camp_info_trespassing_02",
		"phar_camp_info_trespassing_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"EventFeedEventRecordedEvent",
		function(context)
			-- Triggers for all factions. 
			-- Should be ok, as we're not triggering the intervention on ai_turn. 
			return context:event_key() == "diplomacy_trespassing"
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	)

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;

---------------------------------------------------------------
--
--	PHAR_ERS_selected
--
---------------------------------------------------------------

do
	local name = "PHAR_ERS_selected";								-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_ers_intro_01";

	local infotext = {
		"phar_camp_info_ers_intro_01",
		"phar_camp_info_ers_intro_02",
		"phar_camp_info_ers_intro_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration
	new_intervention:set_must_trigger(true)

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"SlotSelected",
		function(context)
			local garrison = context:garrison_residence()
			if garrison:is_slot() then
				local slot = garrison:slot_interface()
				if slot then
					return slot:is_infrastructure_slot()
				end
			end
			return false
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	)

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, true);
end;

---------------------------------------------------------------
--
--	PHAR_ERS_outpost_construction
--
---------------------------------------------------------------

do
	local name = "PHAR_ERS_outpost_construction";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_ers_out_start_01";

	local infotext = {
		"phar_camp_info_ers_out_01",
		"phar_camp_info_ers_out_02",
		"phar_camp_info_ers_out_03",
		"phar_camp_info_ers_out_04",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"BuildingConstructionIssuedByPlayer",
		function(context)
			return string.find(context:building(), "ers_outpost")
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	)

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, true);
end;

---------------------------------------------------------------
--
--	PHAR_ERS_staging_ground_construction
--
---------------------------------------------------------------

do
	local name = "PHAR_ERS_staging_ground_construction";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_ers_staging_start_01";

	local infotext = {
		"phar_camp_info_ers_staging_01",
		"phar_camp_info_ers_staging_02",
		"phar_camp_info_ers_staging_03",
		"phar_camp_info_ers_staging_04",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"BuildingConstructionIssuedByPlayer",
		function(context)
			return string.find(context:building(), "ers_staging_ground")
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	)

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, true);
end;

---------------------------------------------------------------
--
--	PHAR_ERS_trading_post_construction
--
---------------------------------------------------------------

do
	local name = "PHAR_ERS_trading_post_construction";				-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_ers_trade_start_01";

	local infotext = {
		"phar_camp_info_ers_trade_01",
		"phar_camp_info_ers_trade_02",
		"phar_camp_info_ers_trade_03",
		"phar_camp_info_ers_trade_04",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"BuildingConstructionIssuedByPlayer",
		function(context)
			return string.find(context:building(), "ers_trading_post")
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	)

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, true);
end;

---------------------------------------------------------------
--
--	PHAR_ERS_waystation_construction
--
---------------------------------------------------------------

do
	local name = "PHAR_ERS_waystation_construction";				-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_ers_waystation_start_01";

	local infotext = {
		"phar_camp_info_ers_waystation_01",
		"phar_camp_info_ers_waystation_02",
		"phar_camp_info_ers_waystation_03",
		"phar_camp_info_ers_waystation_04",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"BuildingConstructionIssuedByPlayer",
		function(context)
			return string.find(context:building(), "ers_waystation")
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	)

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, true);
end;

---------------------------------------------------------------
--
--	PHAR_ERS_fort_construction
--
---------------------------------------------------------------

do
	local name = "PHAR_ERS_fort_construction";						-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_ers_fort_start_01";

	local infotext = {
		"phar_camp_info_ers_fort_01",
		"phar_camp_info_ers_fort_02",
		"phar_camp_info_ers_fort_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"BuildingConstructionIssuedByPlayer",
		function(context)
			return string.find(context:building(), "ers_fort")
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	)

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, true);
end;

---------------------------------------------------------------
--
--	PHAR_ERS_monument_construction
--
---------------------------------------------------------------

do
	local name = "PHAR_ERS_monument_construction";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_ers_monument_start_01";

	local infotext = {
		"phar_camp_info_ers_monument_01",
		"phar_camp_info_ers_monument_02",
		"phar_camp_info_ers_monument_03",
		"phar_camp_info_ers_monument_04",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"BuildingConstructionIssuedByPlayer",
		function(context)
			return string.find(context:building(), "ers_monument")
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	)

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, true);
end;

---------------------------------------------------------------
--
--	PHAR_ERS_shrine_construction
--
---------------------------------------------------------------

do
	local name = "PHAR_ERS_shrine_construction";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_ers_shrine_start_01";

	local infotext = {
		"phar_camp_info_ers_shrine_01",
		"phar_camp_info_ers_shrine_02",
		"phar_camp_info_ers_shrine_03",
		"phar_camp_info_ers_shrine_04",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"BuildingConstructionIssuedByPlayer",
		function(context)
			return string.find(context:building(), "ers_shrine")
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	)

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, true);
end;

---------------------------------------------------------------
--
--	PHAR_seasons
--
---------------------------------------------------------------

--[[
do
	local name = "PHAR_seasons";									-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;							-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = 3;							-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_nile_lands_01";

	local infotext = {
		"phar_camp_info_nile_lands_01",
		"phar_camp_info_nile_lands_02",
		"phar_camp_info_nile_lands_03",
		"phar_camp_info_nile_lands_04",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration
	new_intervention:add_player_subculture_precondition("phar_main_sbc_kemet_egyptians")
	new_intervention:add_player_subculture_precondition("phar_main_sbc_kemet_kushites")
	new_intervention:add_player_subculture_precondition("phar_main_sbc_kemet_libu_nomads")

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionTurnStart",
		function(context)
			local curr_season = cm:model():current_season_key()
			return curr_season == "season_high_tide" or curr_season == "season_low_tide"
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()

			local uic_target_paths = {
				core:get_ui_root():SequentialFind( "turn_widget", "turn_widget_default", "turn_widget_seasons" );
			};
			advice_component_table_highlight(uic_target_paths)
		end
	)

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, true);
end;
]]

---------------------------------------------------------------
--
--	PHAR_settlement_type_explanation
--
---------------------------------------------------------------

do
	local name = "PHAR_settlement_type_explanation";				-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;							-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;					-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_setttlement_types_01";

	local infotext = {
		"phar_camp_info_setttlement_types_01",
		"phar_camp_info_setttlement_types_02",
		"phar_camp_info_setttlement_types_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"SettlementSelected",
		function(context)
			local gr = context:garrison_residence()
			local faction = gr:faction()
			if faction:is_human() then
				local province_regions = gr:region():province():regions()
				local holds_entire_province = true
				for i = 0, province_regions:num_items() - 1 do
					local curr_region = province_regions:item_at(i)
					if curr_region:owning_faction() ~= faction then
						holds_entire_province = false
					end
				end
				return holds_entire_province
			end
			return false
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	)

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;

---------------------------------------------------------------
--
--	PHAR_settlement_type_stone_explanation
--
---------------------------------------------------------------

do
	local name = "PHAR_settlement_type_stone_explanation";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;							-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = 7;							-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = false;					-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_specialised_settlements_stone_01";

	local infotext = {
		"phar_camp_info_mined_resources_01",
		"phar_camp_info_mined_resources_02",
		"phar_camp_info_mined_resources_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"SettlementSelected",
		function(context)
			local gr = context:garrison_residence()
			local faction = gr:faction()
			if faction:is_human() then
				local settlement = gr:settlement_interface()
				return settlement:production_type() == "phar_main_settlement_stone"
			end
			return false
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	)

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;

---------------------------------------------------------------
--
--	PHAR_ancillary_slot_selected
--
---------------------------------------------------------------

do
	local name = "PHAR_ancillary_slot_selected";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;							-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;							-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_hero_ancillaries_01";

	local infotext = {
		"phar_camp_info_ancillaries_01",
		"phar_camp_info_ancillaries_02",
		"phar_camp_info_ancillaries_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ComponentLClickUp",
		function(context)
			if context.string == "ancillary_select_button" then
				local component = UIComponent(context.component)
				local parent = UIComponent(component:Parent())
				local parent_id = parent:Id()
				return not string.find(parent_id, "title")
			end
			return false
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	)

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;

---------------------------------------------------------------
--
--	PHAR_ancillary_weapon_slot_selected
--
---------------------------------------------------------------

do
	local name = "PHAR_ancillary_weapon_slot_selected";				-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;							-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_hero_bodyguards_01";

	local infotext = {
		"phar_camp_info_bodyguards_01",
		"phar_camp_info_bodyguards_02",
		"phar_camp_info_bodyguards_03",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ComponentLClickUp",
		function(context)
			
			if context.string == "ancillary_select_button" then
				local component = UIComponent(context.component)
				local parent = UIComponent(component:Parent())
				local parent_id = parent:Id()
				return string.find(parent_id, "shield") or string.find(parent_id, "weapon") or
						string.find(parent_id, "armour") or string.find(parent_id, "mount")
			end
			return false
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	)

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;

--[[ 
---------------------------------------------------------------
--
--	PHAR_declare_war
--
---------------------------------------------------------------

do
	local name = "PHAR_declare_war";								-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;							-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_diplomacy_war_declaration_01";

	local infotext = {
		"troy_camp_info_war_01",
		"troy_camp_info_war_02",
		"troy_camp_info_war_03",
		"troy_camp_info_war_04"
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);


	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"PanelOpenedCampaign",
		function(context)	
			if context.string == "diplomacy_dropdown" then
				local war_declared = find_uicomponent(core:get_ui_root(),"war_declared")
				return war_declared
			end
			return false
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
		end
	)

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end; 
]]

---------------------------------------------------------------
--
--	UI_PHAR_court_panel_opened
--
---------------------------------------------------------------

do	
	local name = "UI_PHAR_court_panel_opened";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;							-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;					-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "court";									-- Fullscreen panel to listen for
	
	local advice_key = "phar_campaign_advisor_court_intro_01";

	local infotext = {
		"phar_camp_info_court_intro_01",
		"phar_camp_info_court_intro_02",
		"phar_camp_info_court_intro_03",
		"phar_camp_info_court_intro_04",
	};

	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name);

	

end;

---------------------------------------------------------------
--
--	PHAR_court_action_selected
--
---------------------------------------------------------------

do
	local name = "PHAR_court_action_selected";						-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;							-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = 4;							-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_court_intrigue_01";

	local infotext = {
		"phar_camp_info_court_intrigue_01",
		"phar_camp_info_court_intrigue_02",
		"phar_camp_info_court_intrigue_03",
		"phar_camp_info_court_intrigue_04",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ComponentLClickUp",
		function(context)
			return context.string == "intrigue_button" or context.string == "request_button" or context.string == "plot_button"
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	)

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, true);
end;

---------------------------------------------------------------
--
--	PHAR_court_panel_opened_shemsu_hor_egy
--
---------------------------------------------------------------

do
	local name = "PHAR_court_panel_opened_shemsu_hor_egy";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;							-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_court_pharaoh_01";

	local infotext = {
		"phar_camp_info_court_pharaoh_01",
		"phar_camp_info_court_pharaoh_02",
		"phar_camp_info_court_pharaoh_03",
		"phar_camp_info_court_pharaoh_04"
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration
	new_intervention:set_must_trigger(true)

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"PanelOpenedCampaign",
		function(context)	
			if context.string == "court" then
				local title = find_uicomponent(core:get_ui_root(),"court", "header", "title_tx")
				return title:CurrentState() == "egyptian" and shemsu_hor.is_shemsu_hor()
			end
			return false
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	)

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;

---------------------------------------------------------------
--
--	PHAR_court_panel_opened_shemsu_hor_hittite
--
---------------------------------------------------------------

do
	local name = "PHAR_court_panel_opened_shemsu_hor_hittite";		-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = 6;							-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_court_king_01";

	local infotext = {
		"phar_camp_info_court_king_01",
		"phar_camp_info_court_king_02",
		"phar_camp_info_court_king_03",
		"phar_camp_info_court_king_04"
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration
	new_intervention:set_must_trigger(true)

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"PanelOpenedCampaign",
		function(context)	
			if context.string == "court" then
				local title = find_uicomponent(core:get_ui_root(),"court", "header", "title_tx")
				return title:CurrentState() == "hittite" and shemsu_hor.is_shemsu_hor()
			end
			return false
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	)

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;

---------------------------------------------------------------
--
--	PHAR_court_panel_opened_position_vacant
--
---------------------------------------------------------------

do
	local name = "PHAR_court_panel_opened_position_vacant";			-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_court_reminder_01";

	local infotext = {
		"phar_camp_info_court_reminder_01",
		"phar_camp_info_court_reminder_02",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"PanelOpenedCampaign",
		function(context)	
			if context.string == "court" then
				local faction_key = cm:get_local_faction_name()
				local faction_court_for_faction = court.util_functions.get_faction_court_for_faction(faction_key)
				for _, position in ipairs(court.position_templates) do
					local position_obj = court.util_functions.get_court_position(faction_court_for_faction, position.name, true)
					if position_obj and not position_obj.persistent.current_holder_faction then
						return true
					end
				end
			end
			return false
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	)

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;

---------------------------------------------------------------
--
--	PHAR_start_of_shemsu_hor
--
---------------------------------------------------------------

--[[
do
	local name = "PHAR_start_of_shemsu_hor";				-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = 6;					-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;				-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;						-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;						-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_court_shemsu_01";	

	local infotext = {
		"phar_camp_info_court_shemsu_01",
		"phar_camp_info_court_shemsu_02",
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionTurnStart",
		function(context)			
			return shemsu_hor.is_shemsu_hor()
		end
	);


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:scroll_camera_to_character_for_intervention(
				new_intervention.char_cqi,					-- target character cqi
				advice_key, 								-- advice key
				infotext,									-- infotext
				nil											-- mission manager
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;
]]

---------------------------------------------------------------
--
--	PHAR_crown_powers_annex
--
---------------------------------------------------------------

do
	local name = "PHAR_crown_powers_annex";							-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_powers_annex_01";

	local infotext = {
		"phar_camp_info_powers_annex_01",
		"phar_camp_info_powers_annex_02",
		"phar_camp_info_powers_annex_03"
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"UITriggerScriptEvent",
		function(context)
			local event = context:trigger():split(":")[1]
			if event == "phar_crown_unlock_pharaohs_powers" or event == "phar_crown_unlock_great_kings_powers" then
				local params = context:trigger():split(":")
				local faction_cqi = context:faction_cqi()
				local faction = cm:model():faction_for_command_queue_index(faction_cqi)
				local faction_key = faction:name()
				local local_faction_name = cm:get_local_faction_name(true)
				local target_power = "forced_annexation"

				return string.find(params[2], target_power) and local_faction_name == faction_key
			end
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;

---------------------------------------------------------------
--
--	PHAR_crown_powers_labor
--
---------------------------------------------------------------

do
	local name = "PHAR_crown_powers_labor";							-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_powers_labor_01";

	local infotext = {
		"phar_camp_info_powers_labor_01",
		"phar_camp_info_powers_labor_02",
		"phar_camp_info_powers_labor_03"
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"UITriggerScriptEvent",
		function(context)
			local event = context:trigger():split(":")[1]
			if event == "phar_crown_unlock_pharaohs_powers" or event == "phar_crown_unlock_great_kings_powers" then
				local params = context:trigger():split(":")
				local faction_cqi = context:faction_cqi()
				local faction = cm:model():faction_for_command_queue_index(faction_cqi)
				local faction_key = faction:name()
				local local_faction_name = cm:get_local_faction_name(true)
				local target_power = "corvee_labour"

				return string.find(params[2], target_power) and local_faction_name == faction_key
			end
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;

---------------------------------------------------------------
--
--	PHAR_crown_powers_stack
--
---------------------------------------------------------------

do
	local name = "PHAR_crown_powers_stack";							-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_powers_stack_01";

	local infotext = {
		"phar_camp_info_powers_stack_01",
		"phar_camp_info_powers_stack_02",
		"phar_camp_info_powers_stack_03"
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"UITriggerScriptEvent",
		function(context)
			local event = context:trigger():split(":")[1]
			if event == "phar_crown_unlock_pharaohs_powers" or event == "phar_crown_unlock_great_kings_powers" then
				local params = context:trigger():split(":")
				local faction_cqi = context:faction_cqi()
				local faction = cm:model():faction_for_command_queue_index(faction_cqi)
				local faction_key = faction:name()
				local local_faction_name = cm:get_local_faction_name(true)
				local target_power = "court_positions"

				return string.find(params[2], target_power) and local_faction_name == faction_key
			end
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;

---------------------------------------------------------------
--
--	PHAR_crown_powers_competency
--
---------------------------------------------------------------

do
	local name = "PHAR_crown_powers_competency";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_powers_competency_01";

	local infotext = {
		"phar_camp_info_powers_competency_01",
		"phar_camp_info_powers_competency_02",
		"phar_camp_info_powers_competency_03"
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"UITriggerScriptEvent",
		function(context)
			local event = context:trigger():split(":")[1]
			if event == "phar_crown_unlock_pharaohs_powers" or event == "phar_crown_unlock_great_kings_powers" then
				local params = context:trigger():split(":")
				local faction_cqi = context:faction_cqi()
				local faction = cm:model():faction_for_command_queue_index(faction_cqi)
				local faction_key = faction:name()
				local local_faction_name = cm:get_local_faction_name(true)
				local target_power = "competency_points"

				return string.find(params[2], target_power) and local_faction_name == faction_key
			end
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;

---------------------------------------------------------------
--
--	PHAR_crown_powers_migration
--
---------------------------------------------------------------

do
	local name = "PHAR_crown_powers_migration";						-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_powers_migration_01";

	local infotext = {
		"phar_camp_info_powers_migration_01",
		"phar_camp_info_powers_migration_02",
		"phar_camp_info_powers_migration_03"
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"UITriggerScriptEvent",
		function(context)
			local event = context:trigger():split(":")[1]
			if event == "phar_crown_unlock_pharaohs_powers" or event == "phar_crown_unlock_great_kings_powers" then
				local params = context:trigger():split(":")
				local faction_cqi = context:faction_cqi()
				local faction = cm:model():faction_for_command_queue_index(faction_cqi)
				local faction_key = faction:name()
				local local_faction_name = cm:get_local_faction_name(true)
				local target_power = "growth_migration"

				return string.find(params[2], target_power) and local_faction_name == faction_key
			end
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;

---------------------------------------------------------------
--
--	PHAR_crown_powers_raise_resources
--
---------------------------------------------------------------

do
	local name = "PHAR_crown_powers_raise_resources";				-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_powers_resource_01";

	local infotext = {
		"phar_camp_info_powers_resource_01",
		"phar_camp_info_powers_resource_02",
		"phar_camp_info_powers_resource_03"
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"UITriggerScriptEvent",
		function(context)
			local event = context:trigger():split(":")[1]
			if event == "phar_crown_unlock_pharaohs_powers" or event == "phar_crown_unlock_great_kings_powers" then
				local params = context:trigger():split(":")
				local faction_cqi = context:faction_cqi()
				local faction = cm:model():faction_for_command_queue_index(faction_cqi)
				local faction_key = faction:name()
				local local_faction_name = cm:get_local_faction_name(true)
				local target_power = "raise_resources"

				return string.find(params[2], target_power) and local_faction_name == faction_key
			end
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;


---------------------------------------------------------------
--
--	PHAR_crown_powers_raise_armies
--
---------------------------------------------------------------

do
	local name = "PHAR_crown_powers_raise_armies";					-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = nil;						-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_powers_armies_01";

	local infotext = {
		"phar_camp_info_powers_armies_01",
		"phar_camp_info_powers_armies_02",
		"phar_camp_info_powers_armies_03"
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"UITriggerScriptEvent",
		function(context)
			local event = context:trigger():split(":")[1]
			if event == "phar_crown_unlock_pharaohs_powers" or event == "phar_crown_unlock_great_kings_powers" then
				local params = context:trigger():split(":")
				local faction_cqi = context:faction_cqi()
				local faction = cm:model():faction_for_command_queue_index(faction_cqi)
				local faction_key = faction:name()
				local local_faction_name = cm:get_local_faction_name(true)
				local target_power = "raise_armies"

				return string.find(params[2], target_power) and local_faction_name == faction_key
			end
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;
---------------------------------------------------------------
--
--	UI_PHAR_local_deities_panel_opened
--
---------------------------------------------------------------

do	
	local name = "UI_PHAR_local_deities_panel_opened";		-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "local_deities";						-- Fullscreen panel to listen for
	
	local advice_key = "phar_campaign_advisor_local_deities_panel_01";

	local infotext = {
		"phar_camp_info_local_deities_panel_01",
		"phar_camp_info_local_deities_panel_02",
		"phar_camp_info_local_deities_panel_03",
		"phar_camp_info_local_deities_panel_04"
	};

	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name);

	

end;

---------------------------------------------------------------
--
--	PHAR_local_deities_multiple_worship
--
---------------------------------------------------------------

do
	local name = "PHAR_local_deities_multiple_worship";				-- Unique string name for this intervention
	local cost = INTERVENTION_COST_MEDIUM;							-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_HIGH;							-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = 7;							-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_local_deities_tier_01";

	local infotext = {
		"phar_camp_info_local_deities_tier_01",
		"phar_camp_info_local_deities_tier_02",
		"phar_camp_info_local_deities_tier_03"
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"PanelOpenedCampaign",
		function(context)
			if context.string == "local_deities" then
				local faction_key = cm:get_local_faction_name(true)
				local god_slots = deities.get_god_slots(faction_key)
				for _, slot in ipairs(god_slots) do
					if slot.god_key and deities.get_tier(faction_key, slot.god_key) > 1 then
						return true
					end
				end
			end
			return false
		end
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention);
end;

---------------------------------------------------------------
--
--	PHAR_local_deities_reminder
--
---------------------------------------------------------------

do
	local name = "PHAR_local_deities_reminder";						-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;								-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;						-- Advice thresholds at which this intervention can trigger, default is high only
	local min_turns_before_triggering = 7;							-- Minimum number of turns after campaign start (or advice history reset) before this can trigger (set nil to deactivate)
	local trigger_over_fullscreen_panel = true;						-- Allows the intervention to trigger over fullscreen panels such as diplomacy/tech. Default behaviour is to wait until the panel is closed.
	local trigger_over_battle = false;								-- Allows the intervention to trigger over a battle sequence i.e. from pre-battle to post-battle screen and return of camera to normal
	local trigger_on_ai_turn = false;								-- Allows the intervention to trigger on ai turns e.g. over pre-battle screen or diplomacy screen if player is attacked/approached. Default behaviour is to wait until player turn.

	local advice_key = "phar_campaign_advisor_local_deities_intro_01";

	local infotext = {
		"phar_camp_info_local_deities_intro_01",
		"phar_camp_info_local_deities_intro_02",
		"phar_camp_info_local_deities_intro_03"
	};
	
	--
	-- intervention declaration
	local new_intervention = create_global_intervention(name, cost, advice_level, advice_key, min_turns_before_triggering, trigger_over_fullscreen_panel, trigger_over_battle, trigger_on_ai_turn);

	

	--
	-- intervention configuration
	new_intervention:add_advice_key_precondition("phar_campaign_advisor_local_deities_panel_01")

	--
	-- trigger conditions - controls when the intervention can trigger
	new_intervention:add_trigger_condition(
		"ScriptEventPlayerFactionTurnStart",
		true
	)


	--
	-- intervention callback - called when intervention is triggered
	new_intervention:set_callback(
		function()
			new_intervention:play_advice_for_intervention(
				advice_key,
				infotext
			);
			auto_clear_advice_delayed()
		end
	);

	-- add this intervention to the list of global interventions
	add_global_intervention(new_intervention, false);
end;

---------------------------------------------------------------
--
--	UI_PHAR_ambitions
--
---------------------------------------------------------------

do	
	local name = "UI_PHAR_ambitions";						-- Unique string name for this intervention
	local cost = INTERVENTION_COST_LOW;						-- Points cost for this intervention
	local advice_level = ADVICE_LEVEL_LOW_HIGH;				-- Advice thresholds at which this intervention can trigger, default is high only
	local panel_name = "ambitions";							-- Fullscreen panel to listen for
	
	local advice_key = "phar_campaign_advisor_ambitions";

	local infotext = {
		"phar_camp_info_ambitions_01",
		"phar_camp_info_ambitions_02",
		"phar_camp_info_ambitions_03"
	};

	local uic_string_path = { "hud_campaign", "panel_buttons_tab_sidemenu", "tab_missions" };
	
	local new_intervention = create_fullscreen_panel_global_intervention(name, cost, advice_level, advice_key, infotext, panel_name, false, uic_string_path);

	

end;
