
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Mission reward string functions
--	For use by early game mission templates
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

function early_game_mission_reward(resource, value)
	return "faction_pooled_resource_transaction{resource " .. resource .. ";factor troy_resource_factor_missions;amount " .. tostring(value) .. ";}";
end;


function early_game_food_mission_reward(value)
	return early_game_mission_reward("troy_food", value);
end;


function early_game_wood_mission_reward(value)
	return early_game_mission_reward("troy_wood", value);
end;


function early_game_stone_mission_reward(value)
	return early_game_mission_reward("troy_stones", value);
end;


function early_game_bronze_mission_reward(value)
	return early_game_mission_reward("troy_bronze", value);
end;


function early_game_gold_mission_reward(value)
	return early_game_mission_reward("troy_gold", value);
end;

function early_game_mission_reward_elite_unit(mission_complete_event_name) -- function requires the mission complete event as string to execute the event. TS
	core:add_listener(
	"onbording_elite_units_reward_listener",
	mission_complete_event_name,
	true,		
	function(context)
		local elite_units = 
		{
			["troy_main_dan_mycenae"] = {
				"troy_myc_light_javelin_throwers"
			},
			["troy_main_dan_sparta"] = {
				"troy_spa_light_spear_runners"
			},	
			["troy_main_dan_ithaca"] = {
				"troy_ith_elite_ambushers"
			},	
			["troy_main_dan_achilles"] = {
				"troy_pht_champions_of_phthia", 
				"troy_pht_thessaly_marines"
			},		
			["troy_main_trj_hector"] = {
				"troy_hec_guards_of_troy"
			},		
			["troy_main_trj_paris"] = {
				"troy_par_trojan_nobles"
			},	
			["troy_main_trj_lycia"] = {
				"troy_lyc_lycian_light_chariots"
			},		
			["troy_main_trj_dardania"] = {
				"troy_dardanian_spearmen", 
				"troy_dardanian_stoneslingers", 
				"troy_dardanian_zealots"
			},		
			["troy_amazons_trj_penthesilea"] = {
				"troy_dlc1_ama_pen_warband_bloodsworn"
			},		
			["troy_amazons_trj_hippolyta"] = {
				"troy_dlc1_ama_hip_war_riders"
			},
			["troy_main_dan_salamis"] = {
				"troy_adi_ajax_companions",
				"troy_adi_locrian_slingers",
				"troy_adi_salamis_marines",
				
			},
			["troy_main_dan_argos"] = {
				"troy_adi_dio_argive_swordsmen",
				"troy_adi_dio_argive_axemen",
			},
			["troy_rem_horde_aethiopians"] = {
				"troy_rem_aeth_mem_medjai_warriors",
			},
			["troy_rem_trj_thrace"] = {
				"troy_rem_thr_rhes_devoted_to_zalmoxis",
			},
		}
		local faction = cm:get_faction(cm:get_local_faction_name(true))
		local faction_name = faction:name()
		local faction_cqi = faction:command_queue_index()
		
		local table = elite_units[faction_name]
		if not table then
			script_error("function early_game_mission_reward_elite_unit doesn't have units set for faction "..faction_name)
			return
		end
		
		local random_unit = cm:model():random_int(1, #table)
		local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, table[random_unit])
		
		if faction_name == "troy_main_trj_dardania" then 
			unit_ammount = unit_ammount + 2
			cm:add_unit_to_faction_mercenary_pool(faction, table[random_unit] , unit_ammount, 0, 5, 0, 0, "", "", "")
		else
			unit_ammount = unit_ammount + 1
			cm:add_unit_to_faction_mercenary_pool(faction, table[random_unit] , unit_ammount, 0, 5, 0, 0, "", "", "")
		end
	end,
	false
)
	return "text_display { lookup dummy_troy_onboarding_mission_elite_units_reward; }"
end;

function early_game_mission_reward_mythic_unit(mission_complete_event_name) -- function requires the mission complete event as string to execute the event. TS
	core:add_listener(
	"onbording_mythic_units_reward_listener",
	mission_complete_event_name,
	true,		
	function(context)
		local main_mythic_units = 
		{
			["main_troy"] = {
				"troy_myth_giant_bowmen",
				"troy_myth_armoured_giant_spearmen",
				"troy_myth_giant_vanguard",
				"troy_myth_armoured_centaur_warriors",
				"troy_myth_centaur_scouts"
			},
			["troy_mythic"] = {
				"troy_mth_giant_axe_bow",
				"troy_mth_giant_spear_shield",
				"troy_mth_giant_axe_shield",
				"troy_mth_centaurs_spear_shield",
				"troy_mth_centaurs_spear"
			}
		}

		local dlc1_mythic_units = 
		{
			["main_troy"] = {
			"troy_dlc1_myth_special_armoured_centaur_warriors",
			"troy_dlc1_myth_special_armoured_giant_spearmen",
			"troy_dlc1_myth_special_centaur_scouts",
			"troy_dlc1_myth_special_giant_bowmen",
			"troy_dlc1_myth_special_giant_vanguard",
			},
			["troy_mythic"] = {
				"troy_mth_dlc1_giant_axe_bow",
				"troy_mth_dlc1_giant_spear_shield",
				"troy_mth_dlc1_giant_axe_shield",
				"troy_mth_dlc1_centaurs_spear_shield",
				"troy_mth_dlc1_centaurs_spear"
			}
		}

		local mythic_unit_to_effect = {
			["troy_myth_giant_bowmen"] = "troy_effect_unit_capacity_myth_giants_tier_2",
			["troy_myth_armoured_giant_spearmen"] = "troy_effect_unit_capacity_myth_giants_tier_2",
			["troy_myth_giant_vanguard"] = "troy_effect_unit_capacity_myth_giants_tier_1",
			["troy_myth_armoured_centaur_warriors"] = "troy_effect_unit_capacity_myth_centaurs_tier_2",
			["troy_myth_centaur_scouts"] = "troy_effect_unit_capacity_myth_centaurs_tier_1",
			["troy_dlc1_myth_special_armoured_centaur_warriors"] = "troy_effect_unit_capacity_myth_centaurs_tier_2",
			["troy_dlc1_myth_special_armoured_giant_spearmen"] = "troy_effect_unit_capacity_myth_giants_tier_2",
			["troy_dlc1_myth_special_centaur_scouts"] = "troy_effect_unit_capacity_myth_centaurs_tier_1",
			["troy_dlc1_myth_special_giant_bowmen"] = "troy_effect_unit_capacity_myth_giants_tier_2",
			["troy_dlc1_myth_special_giant_vanguard"] = "troy_effect_unit_capacity_myth_giants_tier_1",
			["troy_mth_giant_axe_bow"] = "troy_effect_unit_capacity_myth_giants_tier_2",
			["troy_mth_giant_spear_shield"] = "troy_effect_unit_capacity_myth_giants_tier_2",
			["troy_mth_giant_axe_shield"] = "troy_effect_unit_capacity_myth_giants_tier_1",
			["troy_mth_centaurs_spear_shield"] = "troy_effect_unit_capacity_myth_centaurs_tier_2",
			["troy_mth_centaurs_spear"] = "troy_effect_unit_capacity_myth_centaurs_tier_1"
		}

		local faction = cm:get_faction(cm:get_local_faction_name(true))
		local faction_name = faction:name()
		local campaign_name = cm:get_campaign_name()
		local mythic_units
		
		if faction:is_allowed_to_capture_territory() then 
			mythic_units = main_mythic_units[campaign_name]
		else
			mythic_units = dlc1_mythic_units[campaign_name]
		end
		
		local random_myth_unit = cm:model():random_int(1, #mythic_units)
		local faction_cqi = faction:command_queue_index()
		local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, mythic_units[random_myth_unit])
		
		local unit_cap_effect = mythic_unit_to_effect[mythic_units[random_myth_unit]]
		local unit_cap_effect_bundle = cm:clone_or_create_custom_effect_bundle(faction_name, "effect_bundle_troy_mission_myth_cap")
		unit_cap_effect_bundle:set_duration(0)
		unit_cap_effect_bundle:add_effect(unit_cap_effect,"faction_to_faction_own_unseen",1)
		cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)
		
		unit_ammount = unit_ammount + 1
		cm:add_unit_to_faction_mercenary_pool(faction, mythic_units[random_myth_unit] , unit_ammount, 0, 5, 0, 0, "", "", "")
		
	end,
	false
)
	return "text_display { lookup dummy_troy_onboarding_mission_mythic_units_reward; }"
end;

function early_game_mission_reward_epic_agent(mission_complete_event_name) -- function requires the mission complete event as string to execute the event. TS
local faction = cm:get_faction(cm:get_local_faction_name(true))
	core:add_listener(
	"onbording_epic_agent_reward_listener",
	mission_complete_event_name,
	true,		
	function(context)
		local epic_agents = 
		{
			"troy_agent_gorgon",
			"troy_agent_satyr",
			"troy_agent_seer",
			"troy_dlc2_agent_orion",
			"troy_hep_agent_kabeiros"
		
		}
		local faction_name = faction:name()
		local random_epic_agent = cm:model():random_int(1, #epic_agents)
		local x, y
		if faction:is_allowed_to_capture_territory() and faction:has_home_region() then
			local capital = faction:home_region():name()
			x, y = cm:find_valid_spawn_location_for_character_from_settlement(
					faction_name,
					capital,
					false,
					true,
					1
				)
		else
			local faction_leader = faction:faction_leader()
			local char_to_spawn_at = faction_leader

			-- if the faction leader is dead, check for other military forces and spawn the agent next to one of them.
			if faction_leader:is_null_interface() or not faction_leader:has_region() then
				local faction_char_list = faction:character_list()
				for i = 0, faction_char_list:num_items() - 1 do
					local curr_char = faction_char_list:item_at(i)
					if curr_char:has_region() and curr_char:has_military_force() then 
						char_to_spawn_at = curr_char
						break
					end
				end
			end
			
			local char_to_spawn_at_lookup = cm:char_lookup_str(char_to_spawn_at)
			x, y = cm:find_valid_spawn_location_for_character_from_character(
				faction_name,
				char_to_spawn_at_lookup,
				false,
				1
				)
		end

		if x ~= -1 and y ~= -1 then
			cm:create_agent(
				faction_name,
				"engineer",
				epic_agents[random_epic_agent],
				x,
				y,
				false
			)
		end
		
	end,
	false
)

	if faction:is_allowed_to_capture_territory() then 
		return "text_display { lookup dummy_troy_onboarding_mission_epic_agent_reward; }"
	else
		return "text_display { lookup dummy_troy_onboarding_mission_epic_agent_reward_horde; }"
	end
end;






-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Arg validation functions
--	For use by early game mission templates. We do validation in this way to
--	avoid bulking out the early-game mission declaration blocks - the intention
--	is for them to be as easy as possible to create.
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

function early_game_validate_mission_rewards(value)
	if not is_table(value) and not is_string(value) then
		script_error("ERROR: early_game_validate_mission_rewards() called but supplied value [" .. tostring(value) .. "] is not a table");
		return false;
	end;

	if is_table(value) and #value == 0 then
		script_error("ERROR: early_game_validate_mission_rewards() called but supplied mission rewards table is empty");
		return false;
	end;

	return true;
end;


function early_game_validate_faction_key(value)
	if not is_string(value) then
		script_error("ERROR: early_game_validate_faction_key() called but supplied value [" .. tostring(value) .. "] is not a string");
		return false;
	end;

	local faction = cm:get_faction(value);

	if not faction then
		script_error("ERROR: early_game_validate_faction_key() called but no faction with supplied key [" .. value .. "] could be found");
		return false;
	end;
	
	return faction;
end;


function early_game_validate_string(value)
	if not is_string(value) then
		script_error("ERROR: early_game_validate_string() called but supplied value [" .. tostring(value) .. "] is not a string");
		return false;
	end;

	return true;
end;


function early_game_validate_number(value)
	if not is_number(value) then
		script_error("ERROR: early_game_validate_number() called but supplied value [" .. tostring(value) .. "] is not a number");
		return false;
	end;

	return true;
end;


function early_game_validate_inherit_list(value)
	if not is_table(value) then
		script_error("ERROR: early_game_validate_inherit_list() called but supplied value [" .. tostring(value) .. "] is not a table");
		return false;
	end;
	
	for i = 1, #value do
		if not is_string(value[i]) then
			script_error("ERROR: early_game_validate_inherit_list() called but element [" .. i .. "] in supplied table is not a string, its value is [" .. tostring(value[i]) .. "]");
			return false;
		end;
	end;

	return true;
end;


function early_game_validate_table_of_strings(value, allow_empty)

	if not is_table(value) then
		script_error("ERROR: early_game_validate_table_of_strings() called but supplied value [" .. tostring(value) .. "] is not a table");
		return false;
	end;

	if not allow_empty and #value == 0 then
		script_error("ERROR: early_game_validate_table_of_strings() called but supplied table is empty");
		return false;
	end;

	for i = 1, #value do
		if not is_string(value[i]) then
			script_error("ERROR: early_game_validate_table_of_strings() called but element [" .. i .. "] in supplied table is not a string, its value is [" .. tostring(value[i]) .. "]");
			return false;
		end;
	end;

	return true;
end;


early_game_diplomatic_agreement_types = {
	"non_aggression_pact",
	"alliance",
	"military_alliance",
	"defensive_alliance",
	"peace",
	"barter",
	"military_access",
	"trade",
	"vassalage",
	"subjugation"
}


function early_game_validate_diplomatic_agreement_type(value)
	if not is_string(value) then
		script_error("ERROR: early_game_validate_diplomatic_agreement_type() called but supplied value [" .. tostring(value) .. "] is not a string");
		return false;
	end;
	
	local value_is_valid = false;
	for i = 1, #early_game_diplomatic_agreement_types do
		if value == early_game_diplomatic_agreement_types[i] then
			value_is_valid = true;
			break;
		end;
	end;

	if not value_is_valid then
		script_error("ERROR: early_game_validate_diplomatic_agreement_type() called but supplied value [" .. value .. "] is not a valid early-game diplomatic agreement type. Valid types are: " .. table.concat(early_game_diplomatic_agreement_types, ", "));
		return false;
	end;

	return true;
end;








-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Base early game mission listener
-- 	not to be called externally
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

function construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	-- validate args that will not be passed into the narrative_event (which validates its own)
	if not early_game_validate_string(unique_name) then
		return false;
	end;
	
	if not early_game_validate_mission_rewards(mission_rewards) then
		return false;
	end;

	-- trigger event and on_completed event must be supplied
	if not early_game_validate_string(trigger_event) or not early_game_validate_string(on_completed_event) then
		return false;
	end;

	-- on_issued event is optional
	if on_issued_event and not early_game_validate_string(on_issued_event) then
		return false;
	end;

	if inherit_list and not early_game_validate_inherit_list(inherit_list) then
		return false;
	end;

	local ne = narrative_event:new(
		"eg_" .. unique_name,									-- unique name
		faction_key,											-- faction key
		advice_key,												-- advice key
		nil,													-- infotext
		mission_key												-- mission key
	);

	if is_string(on_issued_event) then
		ne:add_trigger_callback(
			function()
				core:trigger_event(on_issued_event);
			end
		);
	end;

	if is_string(on_completed_event) then
		ne:add_completion_callback(
			function()
				core:trigger_event(on_completed_event);
			end
		);
	end;

	local triggering_message = "EG_" .. unique_name .. "_" .. faction_key .. "_trigger";

	-- trigger on the triggering message
	ne:add_trigger_condition(triggering_message, true, triggering_message);

	if inherit_list then
		for i = 1, #inherit_list do
			ne:add_narrative_event_payload_inheritance("eg_" .. inherit_list[i], faction_key);
		end
	end;

	-- set up a narrative trigger to listen for the specified event and then trigger the triggering_message which triggers the narrative event
	local nt = narrative_trigger:new(
		"nt_" .. unique_name,
		faction_key,
		triggering_message,
		{
			{
				event = trigger_event,
				condition = true,
				immediate = true
			}
		}
	);

	-- start the narrative trigger automatically when the narrative event starts
	ne:add_start_callback(
		function()
			nt:start();
		end
	)

	return ne;
end;


function setup_early_game_mission_rewards(narrative_event, mission_rewards)
	if is_table(mission_rewards) then
		for i = 1, #mission_rewards do
			narrative_event:add_payload(mission_rewards[i]);
		end;
	else
		narrative_event:add_payload(mission_rewards)
	end
end;








-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	How They Play event
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

function start_early_game_how_they_play_listener(faction_key, trigger_event, on_issued_event)

	-- validate
	if not early_game_validate_faction_key(faction_key) then
		return false;
	end;

	if not early_game_validate_string(trigger_event) or not early_game_validate_string(on_issued_event) then
		return false;
	end;

	
	-- In singleplayer mode, set up an intervention that triggers when the intro cutscene finishes
	local in_eg_how_they_play = intervention:new(
		"eg_how_they_play", 													-- string name
		0,	 																	-- cost
		function() in_eg_how_they_play_trigger() end,							-- trigger callback
		BOOL_INTERVENTIONS_DEBUG	 											-- show debug output
	);

	in_eg_how_they_play:add_trigger_condition(
		trigger_event, 
		true
	);

	in_eg_how_they_play:set_must_trigger(true);

	in_eg_how_they_play:add_precondition(
		function() 
			return not cm:get_saved_value("how_they_play_shown");
		end,
		"how-they-play message must not have been shown"
	);

	function in_eg_how_they_play_trigger()
		out.design("[EG] How They Play event is triggering for " .. faction_key);
		
		show_how_to_play_event(
			faction_key,
			function()
				cm:set_saved_value("how_they_play_shown", true);

				cm:progress_on_events_dismissed(
					"show_how_to_play_" .. faction_key, 
					function()
						out.design("[EG] How They Play event dismissed, triggering event [" .. on_issued_event .. "]");
						core:trigger_event(on_issued_event);
						in_eg_how_they_play:complete();		
					end
				);
			end
		);
	end;

	in_eg_how_they_play:start();
end;









-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Initial Quest
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

function start_early_game_quest_listener(faction_key, mission_key, is_incident, trigger_event, on_issued_event)

	if not cm:is_new_game() then
		return;
	end;

	if not early_game_validate_string(trigger_event) or not early_game_validate_string(on_issued_event) then
		return false;
	end;

	local listener_name = "early_game_quest_" .. faction_key .. "_" .. mission_key;

	-- exit if we've already issued this quest
	if cm:get_saved_value(listener_name) then
		return;
	end;

	-- trigger when the trigger_event is received
	core:add_listener(
		listener_name,
		trigger_event,
		true,
		function()
			cm:trigger_transient_intervention(
				"early_game_quest_mission_" .. faction_key .. "_" .. mission_key, 
				function(intervention)
					-- whitelist all incident and mission event types so that they get displayed
					cm:whitelist_event_feed_event_type("faction_event_mission_issuedevent_feed_target_mission_faction");
					cm:whitelist_event_feed_event_type("faction_event_character_incidentevent_feed_target_incident_faction");
					cm:whitelist_event_feed_event_type("faction_event_region_incidentevent_feed_target_incident_faction");
					cm:whitelist_event_feed_event_type("faction_event_incidentevent_feed_target_incident_faction");

					if is_incident then
						out.design("[EG] Early game quest mission " .. mission_key .. " is triggering for " .. faction_key);
						local res = cm:trigger_incident(faction_key, mission_key, true);
						if not res then
							script_error("ERROR: cm:trigger_incident() called but supplied mission_key [" .. mission_key .. "] not recognised");
							intervention:complete();
						end
					else
						out.design("[EG] Early game quest incident " .. mission_key .. " is triggering for " .. faction_key);
						local res = cm:trigger_mission(faction_key, mission_key, true);
						if not res then
							script_error("ERROR: cm:trigger_mission() called but supplied mission_key [" .. mission_key .. "] not recognised");
							intervention:complete();
						end
					end;
					
					core:add_listener(
						listener_name,
						"PanelClosedCampaign",
						true,
						function()
							-- Wait half a second and see if there is any event panel still open - the closing of the first incident may trigger a follow-up mission which we also want to show.
							-- If no event panel is open after half a second, complete this intervention.
							cm:callback(
								function()
									if not cuim:is_event_panel_open() then
										cm:remove_callback(listener_name);
										core:remove_listener(listener_name);

										out.design("[EG] No event panel is open after quest issued, proceeding - triggering event [" .. on_issued_event .. "]");

										cm:set_saved_value(listener_name, true);

										core:trigger_event(on_issued_event);

										intervention:complete();									
									end;
								end, 
								0.5, 
								listener_name
							);
						end,
						true
					);
				end, 
				true
			);
		end,
		false
	);
end;







-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Defeat Enemy Army
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

function construct_early_game_defeat_enemy_army_mission_listener(unique_name, faction_key, advice_key, mission_key, enemy_faction_key, mission_rewards, target_char_cqi, trigger_event, on_issued_event, on_completed_event, inherit_list)
	
	if not early_game_validate_faction_key(enemy_faction_key) then
		return false;
	end;

	if not target_char_cqi then
		local mf = cm:get_strongest_military_force_from_faction(enemy_faction_key);
		if mf then
			target_char_cqi = mf:general_character():command_queue_index()
		end;
	end;

	local ne = construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		-- set up scripted mission type
		ne:add_new_objective("ENGAGE_FORCE");
		ne:add_condition("faction  " .. enemy_faction_key);
		ne:add_condition("requires_victory");
		ne:add_condition("armies_only");

		-- set up mission rewards
		--early_game_mission_reward_unit(ne)
		setup_early_game_mission_rewards(ne, mission_rewards);

		ne:set_camera_scroll_target_callback(function() return target_char_cqi end);

		return ne;
	end;
end;


function start_early_game_defeat_enemy_army_mission_listener(unique_name, faction_key, advice_key, mission_key, enemy_faction_key, mission_rewards, target_char_cqi, trigger_event, on_issued_event, on_completed_event, inherit_list)
	local ne = construct_early_game_defeat_enemy_army_mission_listener(unique_name, faction_key, advice_key, mission_key, enemy_faction_key, mission_rewards, target_char_cqi, trigger_event, on_issued_event, on_completed_event, inherit_list)

	if ne then
		ne:start();
	end;
end;





-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Recruit X Units
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------



function construct_early_game_recruit_x_units_mission_listener(unique_name, faction_key, advice_key, mission_key, num_units, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)

	if not early_game_validate_number(num_units) then
		return false;
	end;

	local ne = construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		-- set up scripted mission type
		ne:add_new_objective("OWN_N_UNITS");
		ne:add_condition("total " .. num_units);

		-- add a trigger condition to trigger the mission if the player starts a turn with enough units to complete the mission next turn
		local lower_trigger_threshold = num_units - 3;
		ne:add_trigger_condition(
			"FactionTurnStart",
			function(context)
				return context:faction():name() == faction_key and 
					cm:number_of_units_in_faction(context:faction(), true) >= lower_trigger_threshold and
					cm:turn_number() > 1
			end
		);

		-- set up mission rewards
		setup_early_game_mission_rewards(ne, mission_rewards);

		-- set strongest military force as the camera scroll target
		ne:set_camera_scroll_target_callback(
			function()
				local mf = cm:get_strongest_military_force_from_faction(faction_key);
				if mf then
					return mf:general_character():command_queue_index();
				end;
			end
		);

		return ne;
	end;
end;


function start_early_game_recruit_x_units_mission_listener(unique_name, faction_key, advice_key, mission_key, num_units, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	local ne = construct_early_game_recruit_x_units_mission_listener(unique_name, faction_key, advice_key, mission_key, num_units, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		ne:start();
	end;
end;











-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Recruit Full Army
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

function construct_early_game_recruit_full_army_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)

	local ne = construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		-- set up scripted mission type
		local mm = ne:get_mission_manager();

		-- trigger at the start of a new turn if the faction has a full military force
		mm:add_new_scripted_objective(
			"mission_text_text_troy_scripted_mission_description_recruit_full_army",
			"FactionTurnStart",
			function(context)
				if context:faction():name() == faction_key then
					return cm:faction_has_full_military_force(context:faction());
				end;
			end
		);

		-- trigger if a unit is created for the faction and it has a full military force
		mm:add_scripted_objective_success_condition(
			"UnitCreated",
			function(context)
				if context:unit():faction():name() == faction_key then
					return cm:faction_has_full_military_force(context:unit():faction());
				end;
			end
		);

		-- set up mission rewards
		setup_early_game_mission_rewards(ne, mission_rewards);

		-- set strongest military force as the camera scroll target
		ne:set_camera_scroll_target_callback(
			function()
				local mf = cm:get_strongest_military_force_from_faction(faction_key);
				if mf then
					return mf:general_character():command_queue_index();
				end;
			end
		);

		return ne;
	end;
end;


function start_early_game_recruit_full_army_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	local ne = construct_early_game_recruit_full_army_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		ne:start();
	end;
end;









-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Issue Royal Decree / Research Technology
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

function construct_early_game_issue_decree_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)

	local ne = construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		-- set up scripted mission type
		ne:get_mission_manager():add_new_scripted_objective(
			"mission_text_text_troy_scripted_mission_description_issue_royal_decree",
			"ResearchCompleted",
			function(context)
				return context:faction():name() == faction_key;
			end
		);

		-- set up mission rewards
		setup_early_game_mission_rewards(ne, mission_rewards);

		return ne;
	end;
end;


function start_early_game_issue_decree_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	local ne = construct_early_game_issue_decree_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		ne:start();
	end;
end;




-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Issue Specific Royal Decree / Research Technology
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

function construct_early_game_issue_specific_decree_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list, royal_decree_key)

	local ne = construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		-- set up scripted mission type
		ne:get_mission_manager():add_new_scripted_objective(
				"mission_text_text_troy_scripted_mission_description_issue_specific_royal_decree",
				"ResearchCompleted",
				function(context)
					return context:faction():name() == faction_key and context:technology() == royal_decree_key;
				end
		);

		-- set up mission rewards
		setup_early_game_mission_rewards(ne, mission_rewards);

		return ne;
	end;
end;


function start_early_game_issue_specific_decree_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list, royal_decree_key)
	local ne = construct_early_game_issue_specific_decree_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list, royal_decree_key);

	if ne then
		ne:start();
	end;
end;









-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Building Construction
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

function construct_early_game_construct_any_building_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)

	local ne = construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		-- set up scripted mission type
		ne:get_mission_manager():add_new_scripted_objective(
			"mission_text_text_troy_scripted_mission_description_construct_any_building",
			"BuildingCompleted",
			function(context)
				return context:garrison_residence():faction():name() == faction_key;
			end
		);

		-- set up mission rewards
		setup_early_game_mission_rewards(ne, mission_rewards);

		-- set the player's home region as the camera scroll target	
		ne:set_camera_scroll_target_callback(
			function()
				local faction = cm:get_faction(faction_key);
				if faction and faction:has_home_region() then
					return faction:home_region():name();
				end;
			end
		);

		return ne;
	end;
end;


function start_early_game_construct_any_building_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	local ne = construct_early_game_construct_any_building_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		ne:start();
	end;
end;












-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Upgrade Settlement
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

function construct_early_game_upgrade_settlement_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list, constructed_building_must_be_max_level)

	local ne = construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		-- construct a scripted mission that completes when the player constructs a building of superchain with a key containing "troy_main_settlement"
		if constructed_building_must_be_max_level then
			ne:get_mission_manager():add_new_scripted_objective(
				"mission_text_text_troy_scripted_mission_description_upgrade_settlement_max_level",
				"BuildingCompleted",
				function(context)
					if context:garrison_residence():faction():name() == faction_key and (string.find(context:building():superchain(), "troy_main_settlement") or context:building():superchain() == "troy_main_special_mycenae" )then
						local upgrades_list = context:building():possible_building_construction_list();
						return is_table(upgrades_list) and #upgrades_list == 0;
					end;
				end
			);
		else
			ne:get_mission_manager():add_new_scripted_objective(
				"mission_text_text_troy_scripted_mission_description_upgrade_settlement",
				"BuildingCompleted",
				function(context)
					return context:garrison_residence():faction():name() == faction_key and (string.find(context:building():superchain(), "troy_main_settlement") or context:building():superchain() == "troy_main_special_mycenae");
				end
			);
		end;

		-- set the player's home region as the camera scroll target	
		ne:set_camera_scroll_target_callback(
			function()
				local faction = cm:get_faction(faction_key);
				if faction and faction:has_home_region() then
					return faction:home_region():name();
				end;
			end
		);

		-- set up mission rewards
		setup_early_game_mission_rewards(ne, mission_rewards);

		return ne;
	end;
end;


function start_early_game_upgrade_settlement_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	local ne = construct_early_game_upgrade_settlement_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list, false);

	if ne then
		-- also trigger if the player earns a development point
		ne:add_trigger_condition(
			"ScriptEventPlayerFactionTurnStart",
			function(context)
				local player_faction = context:faction()
				local region_list = player_faction:region_list()

				for i = 0, region_list:num_items() - 1 do 
					local curr_region = region_list:item_at(i)
					if curr_region:has_development_points_to_upgrade() == true then
						return true
					end
				end
			end,
			"ScriptEventPlayerFactionTurnStart"
		);

		ne:start();
	end;
end;


function start_early_game_upgrade_settlement_to_max_level_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	local ne = construct_early_game_upgrade_settlement_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list, true);

	if ne then
		ne:start();
	end;
end;













-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Control Province
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

function construct_early_game_control_province_mission_listener(unique_name, faction_key, advice_key, mission_key, num_provinces, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)

	-- validate args that will not be passed into the narrative_event (which validates its own)
	if not early_game_validate_number(num_provinces) then
		return false;
	end;

	local ne = construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		-- set up scripted mission type
		ne:add_new_objective("CONTROL_N_PROVINCES_INCLUDING");

		-- set up mission rewards
		setup_early_game_mission_rewards(ne, mission_rewards);

		-- trigger on the supplied event
		ne:remove_trigger_condition(trigger_event);
		ne:add_trigger_condition(
			trigger_event,
			function()
				-- only add the condition that specifies the number of provinces the player has to control now 
				-- doing it this way allows this condition to be overriden by start_early_game_initial_control_province_mission_listener
				ne:add_condition("total " .. num_provinces);
				return true;
			end,
			trigger_event
		);

		-- trigger when the player is one settlement away from completing the objective
		ne:add_trigger_condition(
			"ScriptEventPlayerFactionTurnStart",
			function()
				local num_controlled_provinces, num_almost_controlled_provinces = cm:num_provinces_controlled_by_faction(cm:get_faction(faction_key));
				if num_controlled_provinces == num_provinces - 1 and num_almost_controlled_provinces > 0 then
					-- only add the condition that specifies the number of provinces the player has to control now 
					-- doing it this way allows this condition to be overriden by start_early_game_initial_control_province_mission_listener
					ne:add_condition("total " .. num_provinces);
					return true;
				end;
			end,
			"ScriptEventPlayerFactionTurnStart"
		);

		return ne;
	end;
end;


function start_early_game_initial_control_province_mission_listener(unique_name, faction_key, advice_key, mission_key, num_provinces, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	local ne = construct_early_game_control_province_mission_listener(unique_name, faction_key, advice_key, mission_key, num_provinces, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		-- find a region in an uncompleted province for the camera scroll target
		ne:set_camera_scroll_target_callback(
			function()
				local faction = cm:get_faction(faction_key);
				local region_list = faction:region_list();
				for i = 0, region_list:num_items() - 1 do
					local region = region_list:item_at(i);
					local num_controlled_regions, num_regions = cm:num_regions_controlled_in_province_by_faction(region:province(), faction);
					if num_controlled_regions + 1 == num_regions then
						-- We have a province where the player only needs one more settlement to control it all.
						-- Work out if the player owns the province capital - if so, set that to be the scroll target
						local province_capital = cm:get_province_capital_for_region(region);
						if province_capital and not province_capital:is_abandoned() then
							local owning_faction = province_capital:owning_faction();
							if not owning_faction:is_null_interface() and owning_faction:name() == faction_key then
								return province_capital:name();
							end;
						end;

						-- otherwise, use the current region
						return region:name();
					end;
				end;
			end
		);

		-- override this listener - if this timeout event has been received, then issue the mission to complete only one province
		ne:remove_trigger_condition(trigger_event);
		ne:add_trigger_condition(
			trigger_event,
			function()
				ne:add_condition("total 1");
				return true;
			end,
			trigger_event
		);

		ne:start();
	end;
end;


function start_early_game_control_provinces_mission_listener(unique_name, faction_key, advice_key, mission_key, num_provinces, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	local ne = construct_early_game_control_province_mission_listener(unique_name, faction_key, advice_key, mission_key, num_provinces, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		ne:start();
	end;
end;










-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Issue Edict
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

function construct_early_game_issue_edict_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)

	local ne = construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		-- set up scripted mission type
		ne:add_new_objective("ISSUE_PROVINCE_INITIATIVE");
		ne:add_condition("total 1");

		-- scroll the camera to the province capital of a province the player owns
		ne:set_camera_scroll_target_callback(
			function()
				local faction = cm:get_faction(faction_key);
				local region_list = faction:region_list();

				for i = 0, region_list:num_items() - 1 do
					local current_region = region_list:item_at(i);

					if current_region:is_province_capital() then
						local num_owned_regions_in_province, num_regions_in_province = cm:num_regions_controlled_in_province_by_faction(current_region:province(), faction);
						if num_owned_regions_in_province == num_regions_in_province then
							return current_region:name();
						end;
					end;
				end;
			end
		);

		-- set up mission rewards
		setup_early_game_mission_rewards(ne, mission_rewards);

		return ne;
	end;
end;


function start_early_game_issue_edict_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	local ne = construct_early_game_issue_edict_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		ne:start();
	end;
end;








-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Construct Building From List
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------


function construct_early_game_construct_building_mission_listener(unique_name, faction_key, advice_key, mission_key, building_list, num_buildings_required, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	-- validate args that will not be passed into the narrative_event (which validates its own)
	if not early_game_validate_number(num_buildings_required) then
		return false;
	end;

	if not early_game_validate_table_of_strings(building_list) then
		return false;
	end;

	local ne = construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		-- set up scripted mission type
		ne:add_new_objective("CONSTRUCT_N_BUILDINGS_FROM");
		ne:add_condition("total " .. num_buildings_required);
		ne:add_condition("faction " .. faction_key);
		for i = 1, #building_list do
			ne:add_condition("building_level " .. building_list[i]);
		end;
		
		-- set up mission rewards
		setup_early_game_mission_rewards(ne, mission_rewards);

		return ne;
	end;
end;


function start_early_game_construct_building_mission_listener(unique_name, faction_key, advice_key, mission_key, building_list, num_buildings_required, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)

	local ne = construct_early_game_construct_building_mission_listener(unique_name, faction_key, advice_key, mission_key, building_list, num_buildings_required, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);
	if ne then
		ne:start();
	end;
end;








-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Construct Temple
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

function start_early_game_construct_temple_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)

	local t = {}
	if cm:model():world():faction_by_key(faction_key):is_allowed_to_capture_territory() then 
		t = {
			"troy_main_religion_poseidon_2",
			"troy_main_religion_hera_2",
			"troy_main_religion_athens_2",
			"troy_main_religion_ares_2",
			faction_key == "troy_rem_trj_thrace" and "troy_rem_religion_apollo_2" or "troy_main_religion_apollo_2",
			"troy_main_religion_aphrodite_2",
			"troy_main_religion_zeus_2",
			"troy_main_religion_artemis_2",
			"troy_hep_religion_hephaestus_2"
		}
	else
		if faction_key == "troy_amazons_trj_penthesilea" then
			t = {
				"troy_amazons_penthesilea_horde_religion_aphrodite_2",
				"troy_amazons_penthesilea_horde_religion_apollo_2",
				"troy_amazons_penthesilea_horde_religion_ares_2",
				"troy_amazons_penthesilea_horde_religion_athena_2",
				"troy_amazons_penthesilea_horde_religion_hera_2",
				"troy_amazons_penthesilea_horde_religion_poseidon_2",
				"troy_amazons_penthesilea_horde_religion_zeus_2",
				"troy_amazons_penthesilea_horde_religion_artemis_2",
				"troy_hep_amazons_penthesilea_horde_religion_hephaestus_2"
			}
		else -- faction is aethiopians
			t = {
				"troy_rem_aethiopia_horde_religion_aphrodite_2",
				"troy_rem_aethiopia_horde_religion_apollo_2",
				"troy_rem_aethiopia_horde_religion_ares_2",
				"troy_rem_aethiopia_horde_religion_artemis_2",
				"troy_rem_aethiopia_horde_religion_athena_2",
				"troy_rem_aethiopia_horde_religion_haphaestus_2",
				"troy_rem_aethiopia_horde_religion_hera_2",
				"troy_rem_aethiopia_horde_religion_poseidon_2",
				"troy_rem_aethiopia_horde_religion_zeus_2",
			}
		end
	end

	local ne = construct_early_game_construct_building_mission_listener(
		unique_name, 
		faction_key, 
		advice_key, 
		mission_key, 
		t, 
		1, 
		mission_rewards, 
		trigger_event, 
		on_issued_event, 
		on_completed_event, 
		inherit_list
	);

	if ne then
		ne:start();
	end;
end;








-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Accumulate Favour
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

function construct_early_game_accumulate_favour_mission_listener(unique_name, faction_key, advice_key, mission_key, favour_threshold, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)

	-- validate args that will not be passed into the narrative_event (which validates its own)
	if not early_game_validate_number(favour_threshold) then
		return false;
	end;

	local ne = construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		-- set up scripted mission type
		ne:get_mission_manager():add_new_scripted_objective(
			"mission_text_text_troy_scripted_mission_description_accumulate_favour_" .. favour_threshold,		-- this record needs creating in the mission_text table
			"PooledResourceTransactionEvent",
			function(context)
				if context:faction():name() == faction_key and string.find(context:resource():key(), "troy_god_attitude") and context:resource():value() >= favour_threshold then
					return true;
				end;
			end
		);
		
		-- set up mission rewards
		setup_early_game_mission_rewards(ne, mission_rewards);

		return ne;
	end;
end;


function start_early_game_accumulate_favour_mission_listener(unique_name, faction_key, advice_key, mission_key, favour_threshold, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	local ne = construct_early_game_accumulate_favour_mission_listener(unique_name, faction_key, advice_key, mission_key, favour_threshold, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		ne:start();
	end
end;








-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Initiate Hecatomb
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

function construct_early_game_initiate_hecatomb_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)

	local ne = construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		-- set up scripted mission type
		ne:get_mission_manager():add_new_scripted_objective(
			"mission_text_text_troy_scripted_mission_description_initiate_hecatomb",
			"FactionInitiatesHecatomb",
			function(context)
				return context:faction():name() == faction_key;
			end
		);
		
		-- set up mission rewards
		setup_early_game_mission_rewards(ne, mission_rewards);

		return ne;
	end;
end;


function start_early_game_initiate_hecatomb_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	local ne = construct_early_game_initiate_hecatomb_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		ne:start();
	end
end;













-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Construct Agent Building
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

function start_early_game_construct_agent_building_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	local t = {}
	if cm:model():world():faction_by_key(faction_key):is_allowed_to_capture_territory() and cm:model():world():faction_by_key(faction_key):name() ~= odysseus_faction then

		t = {
			"troy_main_influence_2",
			"troy_main_happiness_2",
			"troy_main_religion_poseidon_2",
			"troy_main_religion_hera_2",
			"troy_main_religion_athens_2",
			"troy_main_religion_ares_2",
			"troy_main_religion_apollo_2",
			"troy_main_religion_aphrodite_2",
			"troy_main_religion_zeus_2",
			"troy_main_religion_artemis_2",
			"troy_hep_religion_hephaestus_2"
			}

		elseif not cm:model():world():faction_by_key(faction_key):is_allowed_to_capture_territory() then

		if faction_key == "troy_amazons_trj_penthesilea" then
			t = {
				"troy_amazons_penthesilea_horde_resources_2",
				"troy_amazons_penthesilea_horde_replenishment_2",
				"troy_amazons_penthesilea_horde_religion_aphrodite_2",
				"troy_amazons_penthesilea_horde_religion_apollo_2",
				"troy_amazons_penthesilea_horde_religion_ares_2",
				"troy_amazons_penthesilea_horde_religion_athena_2",
				"troy_amazons_penthesilea_horde_religion_hera_2",
				"troy_amazons_penthesilea_horde_religion_poseidon_2",
				"troy_amazons_penthesilea_horde_religion_zeus_2",
				"troy_amazons_penthesilea_horde_religion_artemis_2",
				"troy_hep_amazons_penthesilea_horde_religion_hephaestus_2"
			}

		else -- faction is aethiopians
			t = {
				"troy_rem_aethiopia_horde_religion_aphrodite_2",
				"troy_rem_aethiopia_horde_religion_apollo_2",
				"troy_rem_aethiopia_horde_religion_ares_2",
				"troy_rem_aethiopia_horde_religion_artemis_2",
				"troy_rem_aethiopia_horde_religion_athena_2",
				"troy_rem_aethiopia_horde_religion_haphaestus_2",
				"troy_rem_aethiopia_horde_religion_hera_2",
				"troy_rem_aethiopia_horde_religion_poseidon_2",
				"troy_rem_aethiopia_horde_religion_zeus_2",
			}
		end

		elseif cm:model():world():faction_by_key(faction_key):name() == odysseus_faction then

			t = {
				"troy_main_ody_happiness_2",
				"troy_main_religion_poseidon_2",
				"troy_main_religion_hera_2",
				"troy_main_religion_athens_2",
				"troy_main_religion_ares_2",
				"troy_main_religion_apollo_2",
				"troy_main_religion_aphrodite_2",
				"troy_main_religion_zeus_2",
				"troy_main_religion_artemis_2",
				"troy_hep_religion_hephaestus_2"
				}

	end
	local ne = construct_early_game_construct_building_mission_listener(
		unique_name, 
		faction_key, 
		advice_key, 
		mission_key, 
		t, 
		1, 
		mission_rewards, 
		trigger_event, 
		on_issued_event, 
		on_completed_event, 
		inherit_list
	);

	if ne then
		ne:start();
	end;
end;











-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Recruit Agent
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------


function construct_early_game_recruit_agent_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	
	local ne = construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		-- set up scripted mission type
		ne:add_new_objective("RECRUIT_AGENT");
		ne:add_condition("total 1");
		
		-- set up mission rewards
		setup_early_game_mission_rewards(ne, mission_rewards);

		return ne;
	end;
end;


function start_early_game_recruit_agent_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	local ne = construct_early_game_recruit_agent_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);
	if ne then
		ne:start();
	end;
end;











-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Employ Agent
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------


function construct_early_game_employ_agent_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	
	local ne = construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		-- set up scripted mission type
		ne:add_new_objective("PERFORM_ANY_AGENT_ACTION");
		
		-- set up mission rewards
		setup_early_game_mission_rewards(ne, mission_rewards);

		return ne;
	end;
end;


function start_early_game_employ_agent_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	local ne = construct_early_game_employ_agent_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);
	if ne then
		ne:start();
	end;
end;









-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Non Aggression Pact
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------


function construct_early_game_non_aggression_pact_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)

	local ne = construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then		
		-- set up scripted mission type
		ne:get_mission_manager():add_new_scripted_objective(
			"mission_text_text_troy_scripted_mission_description_non_aggression_pact",
			"PositiveDiplomaticEvent",
			function(context)
				return (context:proposer():name() == faction_key or context:recipient():name() == faction_key) and context:is_non_aggression_pact();
			end
		);
		
		-- set up mission rewards
		setup_early_game_mission_rewards(ne, mission_rewards);

		return ne;
	end;
end;


function start_early_game_non_aggression_pact_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	local ne = construct_early_game_non_aggression_pact_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);
	if ne then
		ne:start();
	end;
end;









-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Barter Agreement
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------


function construct_early_game_barter_agreement_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)

	local ne = construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then		
		-- set up scripted mission type
		ne:get_mission_manager():add_new_scripted_objective(
			"mission_text_text_troy_scripted_mission_description_barter_agreement",
			"PositiveDiplomaticEvent",
			function(context)
				return (context:proposer():name() == faction_key or context:recipient():name() == faction_key) and context:is_barter_agreement();
			end
		);
		
		-- set up mission rewards
		setup_early_game_mission_rewards(ne, mission_rewards);

		return ne;
	end;
end;


function start_early_game_barter_agreement_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	local ne = construct_early_game_barter_agreement_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);
	if ne then
		ne:start();
	end;
end;










-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Defensive Alliance
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------


function construct_early_game_defensive_alliance_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)

	local ne = construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		-- set up scripted mission type
		ne:get_mission_manager():add_new_scripted_objective(
			"mission_text_text_troy_scripted_mission_description_defensive_alliance",
			"PositiveDiplomaticEvent",
			function(context)
				return (context:proposer():name() == faction_key or context:recipient():name() == faction_key) and context:is_defensive_alliance();
			end
		);

		-- set up mission rewards
		setup_early_game_mission_rewards(ne, mission_rewards);

		return ne;
	end;
end;


function start_early_game_defensive_alliance_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	local ne = construct_early_game_defensive_alliance_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);
	if ne then
		ne:start();
	end;
end;









-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Confederation
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------


function construct_early_game_confederation_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)

	local ne = construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		-- set up scripted mission type
		ne:get_mission_manager():add_new_scripted_objective(
			"mission_text_text_troy_scripted_mission_description_confederate",
			"FactionJoinsConfederation",
			function(context)
				return context:faction():name() == faction_key or context:confederation():name() == faction_key;
			end
		);

		-- set up mission rewards
		setup_early_game_mission_rewards(ne, mission_rewards);

		return ne;
	end;
end;


function start_early_game_confederation_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	local ne = construct_early_game_confederation_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);
	if ne then
		ne:start();
	end;
end;









-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Recruit Hero
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------


function construct_early_game_recruit_hero_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)

	local ne = construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		-- set up scripted mission type
		ne:add_new_objective("RAISE_FORCE");
		
		-- set up mission rewards
		setup_early_game_mission_rewards(ne, mission_rewards);

		return ne;
	end;
end;


function start_early_game_recruit_hero_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	local ne = construct_early_game_recruit_hero_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);
	if ne then
		ne:start();
	end;
end;











-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Recruit Mythical Unit
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------


function construct_early_game_recruit_mythical_unit_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)

	local ne = construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		-- set up scripted mission type
		ne:get_mission_manager():add_new_scripted_objective(
			"mission_text_text_troy_scripted_mission_description_recruit_mythical_unit",
			"UnitTrained",
			function(context)
				local unit = context:unit();
				return unit:faction():name() == faction_key and (string.find(unit:unit_key(), "troy_myth_") or string.find(unit:unit_key(), "troy_dlc1_myth_") or string.find(unit:unit_key(), "troy_mth_"));
			end
		);
		ne:get_mission_manager():add_scripted_objective_success_condition(
			"ScriptedForceCreated",
			function(context)
				local force_general = context:character()
				local forces_faction = force_general:faction()

				-- early return if the force is created for a battle like the mythic monsters battle.
				if not force_general:has_region() then
					return false
				end

				if forces_faction:name() == faction_key and force_general:has_military_force() then 
					local military_force_unit_list = force_general:military_force():unit_list()
					for i = 0, military_force_unit_list:num_items() - 1 do 
						local curr_unit = military_force_unit_list:item_at(i)
						if early_game_missions_check_if_unit_is_mythical(curr_unit:unit_key()) then
							return true
						end
					end
				end
			end
		)

		-- currently we have only the mythic monsters quest battles and it's highly likely we get a military force with mythic untis from it
		-- because we cannot reliably listen for when the military force is created there, we listen for a successfull completion of the battle
		-- and go trough all the armies of the faction to see if we have mythic units now.
		ne:get_mission_manager():add_scripted_objective_success_condition(
			"FactionCompletedQuestBattle",
			function(context)
				-- filter to not trigger if the mission is cancelled.
				if not context:mission():succeeded() then
					return false
				end
				
				local faction = context:faction()
				local faction_mf_list = faction:military_force_list()

				if faction:name() == faction_key then
					for i = 0, faction_mf_list:num_items() - 1 do
						local military_force_unit_list = faction_mf_list:item_at(i):unit_list()
						for u = 0, military_force_unit_list:num_items() - 1 do
							local curr_unit = military_force_unit_list:item_at(u)
							if early_game_missions_check_if_unit_is_mythical(curr_unit:unit_key()) then
								return true
							end
						end
					end
				end
			end
		)
		
		-- set up mission rewards
		setup_early_game_mission_rewards(ne, mission_rewards);

		return ne;
	end;
end;


function start_early_game_recruit_mythical_unit_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	local ne = construct_early_game_recruit_mythical_unit_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);
	if ne then
		ne:start();
	end;
end;


function early_game_missions_check_if_unit_is_mythical(unit_key)
	if string.find(unit_key, "troy_myth_") or string.find(unit_key, "troy_dlc1_myth_") or string.find(unit_key, "troy_mth_") then
		return true
	end
	return false
end








-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Achilles Mood Swings
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

function construct_early_game_achilles_mood_swing_mission_listener(unique_name, faction_key, advice_key, mission_key, target_mood, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)

	if not early_game_validate_string(target_mood) then
		return false;
	end;

	local ne = construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		-- set up scripted mission type
		ne:get_mission_manager():add_new_scripted_objective(
			"mission_text_text_troy_scripted_mission_description_make_achilles_" .. target_mood,		-- this text key will need creating for each mood swing mission used
			"ScriptEventAchillesMoodChange",
			function(context)
				return context:faction():name() == faction_key and context.string == target_mood;
			end
		);
		
		-- set up mission rewards
		setup_early_game_mission_rewards(ne, mission_rewards);

		return ne;
	end;
end;


function start_early_game_make_achilles_enraged_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	local ne = construct_early_game_achilles_mood_swing_mission_listener(unique_name, faction_key, advice_key, mission_key, "enraged", mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);
	if ne then
		ne:start();
	end;
end;











-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Achilles Greatest Warrior
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

function construct_early_game_achilles_become_greatest_warrior_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)

	local ne = construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		-- set up scripted mission type
		ne:get_mission_manager():add_new_scripted_objective(
			"mission_text_text_troy_scripted_mission_description_achilles_become_greatest_warrior",
			"ScriptEventAchillesBecomesGreatestWarrior",
			function(context)
				return true
			end
		);
		
		-- set up mission rewards
		setup_early_game_mission_rewards(ne, mission_rewards);

		return ne;
	end;
end;


function start_early_game_achilles_become_greatest_warrior_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	local ne = construct_early_game_achilles_become_greatest_warrior_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);
	if ne then
		ne:start();
	end;
end;










-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Appoint Character
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

function construct_early_game_appoint_character_mission_listener(unique_name, faction_key, advice_key, mission_key, character_index, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)

	if not early_game_validate_number(character_index) then
		return false;
	end;

	local ne = construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		-- set up scripted mission type
		ne:get_mission_manager():add_new_scripted_objective(
			"mission_text_text_troy_scripted_mission_description_appoint_character_" .. character_index,		-- this text key will need creating for each character index
			"CharacterAssignedToPost",
			function(context)
				return context:character():faction():name() == faction_key and cm:politics_get_ministerial_posts(faction_key, character_index, true) > 0;
			end
		);
		
		-- set up mission rewards
		setup_early_game_mission_rewards(ne, mission_rewards);

		return ne;
	end;
end;


function start_early_game_appoint_heqetas_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	-- character index should correspond with values set in troy_king_of_men.lua
	-- 3 = heqetas
	local character_index = 3;
	local ne = construct_early_game_appoint_character_mission_listener(unique_name, faction_key, advice_key, mission_key, character_index, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);
	if ne then
		ne:start();
	end;
end;


function start_early_game_appoint_telestas_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	-- character index should correspond with values set in troy_king_of_men.lua
	-- 2 = telestas
	local character_index = 2;
	local ne = construct_early_game_appoint_character_mission_listener(unique_name, faction_key, advice_key, mission_key, character_index, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);
	if ne then
		ne:start();
	end;
end;


function start_early_game_appoint_lawagetas_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	-- character index should correspond with values set in troy_king_of_men.lua
	-- 1 = lawagetas
	local character_index = 1;
	local ne = construct_early_game_appoint_character_mission_listener(unique_name, faction_key, advice_key, mission_key, character_index, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);
	if ne then
		ne:start();
	end;
end;










-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Request Resources
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------


function construct_early_game_request_resources_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)

	local ne = construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		-- set up scripted mission type
		ne:get_mission_manager():add_new_scripted_objective(
			"mission_text_text_troy_scripted_mission_description_request_resources",
			"ComponentLClickUp",
			function(context)
				return UIComponent(context.component) == find_uicomponent(core:get_ui_root(), "demand_tribute_dialogue_box", "both_group", "button_tick");
			end
		);
		
		-- set up mission rewards
		setup_early_game_mission_rewards(ne, mission_rewards);

		return ne;
	end;
end;


function start_early_game_request_resources_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)

	local ne = construct_early_game_request_resources_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		ne:start();
	end;
end;











-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Establish Colony
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------


function construct_early_game_establish_colony_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)

	local ne = construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		-- set up scripted mission type
		ne:get_mission_manager():add_new_scripted_objective(
			"mission_text_text_troy_scripted_mission_description_establish_colony",
			"RegionFactionChangeEvent",
			function(context)
				return context:reason() == "remote colonisation"
			end
		);
		
		-- set up mission rewards
		setup_early_game_mission_rewards(ne, mission_rewards);

		return ne;
	end;
end;


function start_early_game_establish_colony_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)

	local ne = construct_early_game_establish_colony_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		ne:start();
	end;
end;











-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Recruit Allies / Call to Arms
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------


function construct_early_game_recruit_allies_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)

	local ne = construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		-- set up scripted mission type
		ne:get_mission_manager():add_new_scripted_objective(
			"mission_text_text_troy_scripted_mission_description_recruit_allies",
			"UnitTrained",
			function(context)
				return context:foreign() and context:unit():faction():name() == faction_key;
			end
		);
		
		-- set up mission rewards
		setup_early_game_mission_rewards(ne, mission_rewards);

		return ne;
	end;
end;


function start_early_game_recruit_allies_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)

	local ne = construct_early_game_recruit_allies_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		ne:start();
	end;
end;











-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Capture Coastal Region
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------


function construct_early_game_capture_coastal_region_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)

	local ne = construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		-- set up scripted mission type
		ne:get_mission_manager():add_new_scripted_objective(
			"mission_text_text_troy_scripted_mission_description_capture_coastal_region",
			"RegionFactionChangeEvent",
			function(context)
				return context:region():owning_faction():name() == faction_key and context:region():settlement():is_port();
			end
		);
		
		-- set up mission rewards
		setup_early_game_mission_rewards(ne, mission_rewards);

		return ne;
	end;
end;


function start_early_game_capture_coastal_region_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)

	local ne = construct_early_game_capture_coastal_region_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		ne:start();
	end;
end;










-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Construct Supply Base
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------


function construct_early_game_construct_supply_base_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)

	local ne = construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		-- set up scripted mission type
		ne:get_mission_manager():add_new_scripted_objective(
			"mission_text_text_troy_scripted_mission_description_construct_supply_base",
			"ForeignSlotBuildingCompleteEvent",
			function(context)
				return context:faction():name() == faction_key;
			end
		);
		
		-- set up mission rewards
		setup_early_game_mission_rewards(ne, mission_rewards);

		return ne;
	end;
end;


function start_early_game_construct_supply_base_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	
	local ne = construct_early_game_construct_supply_base_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		ne:start();
	end;
end;











-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Earn Priams Benevolence
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------


function construct_early_game_earn_priams_benevolence_mission_listener(unique_name, faction_key, advice_key, mission_key, threshold_value, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)

	if not early_game_validate_number(threshold_value) then
		return;
	end;

	local ne = construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		-- set up scripted mission type
		ne:get_mission_manager():add_new_scripted_objective(
			"mission_text_text_troy_scripted_mission_description_earn_priams_benevolence_" .. threshold_value,			-- this text key will need creating for each threshold value
			"PooledResourceTransactionEvent",
			function(context)
				if context:faction():name() == faction_key and context:resource():key() == "troy_priam_benevolence" and context:amount() > 0 and context:resource():value() >= threshold_value then
					return true;
				end;
			end
		);
		
		-- set up mission rewards
		setup_early_game_mission_rewards(ne, mission_rewards);

		return ne;
	end;
end;


function start_early_game_earn_priams_benevolence_mission_listener(unique_name, faction_key, advice_key, mission_key, threshold_value, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)

	local ne = construct_early_game_earn_priams_benevolence_mission_listener(unique_name, faction_key, advice_key, mission_key, threshold_value, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		ne:start();
	end;

	-- Requested by design to auto-complete
	core:add_listener(
		"early_game_benevolance_mission_auto_complete", 
		"MissionIssued", 
		function(context)
			return context:mission():mission_record_key() == mission_key
		end, 
		function()
			local benevolance = cm:get_faction(faction_key):pooled_resource("troy_priam_benevolence")
			if benevolance and not benevolance:is_null_interface() and benevolance:value() >= threshold_value then
				ne:get_mission_manager():force_scripted_objective_completion(true)
			end
		end, 
		false
	)
end;











-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Horde Building Construction
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

function construct_early_game_construct_any_horde_building_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)

	local ne = construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		-- set up scripted mission type
		ne:get_mission_manager():add_new_scripted_objective(
			"mission_text_text_troy_scripted_mission_description_construct_any_building",
			"CharacterMilitaryForceBuildingCompleted",
			function(context)
				return context:building():faction():name() == faction_key;
			end
		);

		-- set up mission rewards
		setup_early_game_mission_rewards(ne, mission_rewards);

		-- set the player's home region as the camera scroll target	
		ne:set_camera_scroll_target_callback(
			function()
				local faction = cm:get_faction(faction_key);
				if faction and faction:has_faction_leader() then
					return faction:faction_leader():region():name();
				end;
			end
		);

		return ne;
	end;
end;


function start_early_game_construct_any_horde_building_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	local ne = construct_early_game_construct_any_horde_building_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		ne:start();
	end;
end;










-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Horde Upgrade
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

function construct_early_game_upgrade_horde_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list, constructed_building_must_be_max_level)

	local ne = construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	function check_if_horde_main_building(superchain)
		return string.find(superchain, "troy_amazons_penthesilea_horde_main") or string.find(superchain, "troy_rem_aethiopia_horde_main")

	end

	if ne then
		-- construct a scripted mission that completes when the player constructs a building of superchain with a key containing "troy_amazons_penthesilea_horde_main"
		if constructed_building_must_be_max_level then
			ne:get_mission_manager():add_new_scripted_objective(
				"mission_text_text_troy_scripted_mission_description_upgrade_horde_max_level",
				"CharacterMilitaryForceBuildingCompleted",
				function(context)
					if context:building():faction():name() == faction_key and check_if_horde_main_building(context:building():superchain()) then
						local upgrades_list = context:building():possible_building_construction_list();
						return is_table(upgrades_list) and #upgrades_list == 0;
					end;
				end
			);
		else
			ne:get_mission_manager():add_new_scripted_objective(
				"mission_text_text_troy_scripted_mission_description_upgrade_horde",
				"CharacterMilitaryForceBuildingCompleted",
				function(context)
					return context:building():faction():name() == faction_key and check_if_horde_main_building(context:building():superchain());
				end
			);
		end;

		-- set the player's home region as the camera scroll target	
		ne:set_camera_scroll_target_callback(
			function()
				local faction = cm:get_faction(faction_key);
				if faction and faction:has_faction_leader() then
					return faction:faction_leader():region():name();
				end;
			end
		);

		-- set up mission rewards
		setup_early_game_mission_rewards(ne, mission_rewards);

		return ne;
	end;
end;


function start_early_game_upgrade_horde_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	local ne = construct_early_game_upgrade_horde_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list, false);

	if ne then
		-- also trigger if the player earns a development point
		ne:add_trigger_condition(
			"ScriptEventPlayerMilitaryForceGainedDevelopmentPoint",
			true,
			"ScriptEventPlayerMilitaryForceGainedDevelopmentPoint"
		);

		ne:start();
	end;
end;


function start_early_game_upgrade_horde_to_max_level_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	local ne = construct_early_game_upgrade_horde_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list, true);

	if ne then
		ne:start();
	end;
end;

-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Ajax Hold Celebration
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

function construct_early_game_ajax_hold_celebration_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)

	local ne = construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		-- set up scripted mission type
		ne:get_mission_manager():add_new_scripted_objective(
			"mission_text_text_troy_adi_mis_activity_hold_celebration",
			"UITriggerScriptEvent",
			function(context)
				local args = context:trigger():split(",")
				return #args >= 1 and args[1] == "AjaxRenownCelebration"
			end
		);
		
		-- set up mission rewards
		setup_early_game_mission_rewards(ne, mission_rewards);

		return ne;
	end;
end;


function start_early_game_ajax_hold_celebration_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	local ne = construct_early_game_ajax_hold_celebration_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);
	if ne then
		ne:start();
	end;
end;

-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	Diomedes Gain Dominance
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

function construct_early_game_diomedes_gain_dominance_mission_listener(unique_name, faction_key, advice_key, mission_key, amount, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	
	if not early_game_validate_number(amount) then
		return false;
	end;

	local ne = construct_early_game_mission_listener(unique_name, faction_key, advice_key, mission_key, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		-- set up scripted mission type
		ne:add_new_objective("HAVE_AT_LEAST_X_OF_A_POOLED_RESOURCE");
		ne:add_condition("total " .. amount);
		ne:add_condition("pooled_resource troy_dominance")

		-- set up mission rewards
		setup_early_game_mission_rewards(ne, mission_rewards);

		return ne;
	end;
end;


function start_early_game_diomedes_gain_dominance_mission_listener(unique_name, faction_key, advice_key, mission_key, amount, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list)
	local ne = construct_early_game_diomedes_gain_dominance_mission_listener(unique_name, faction_key, advice_key, mission_key, amount, mission_rewards, trigger_event, on_issued_event, on_completed_event, inherit_list);

	if ne then
		ne:start();
	end;
end;