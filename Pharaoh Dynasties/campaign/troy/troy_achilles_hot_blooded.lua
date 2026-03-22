out("Loading troy_achilles_hot_blooded.lua")


troy_achilles_hot_blooded_dilemma_list = {
	enraged = {
		[1] = "troy_fm_achilles_enraged_1",
		[2] = "troy_fm_achilles_enraged_2",
		[3] = "troy_fm_achilles_enraged_3",
		[4] = "troy_fm_achilles_enraged_4",
		[5] = "troy_fm_achilles_enraged_5"
	},
	insulted = {
		[1] = "troy_fm_achilles_insulted_1",
		[2] = "troy_fm_achilles_insulted_2",
		[3] = "troy_fm_achilles_insulted_3",
		[4] = "troy_fm_achilles_insulted_4",
		[5] = "troy_fm_achilles_insulted_5"
	},
	depressed = {
		[1] = "troy_fm_achilles_depressed_1",
		[2] = "troy_fm_achilles_depressed_2",
		[3] = "troy_fm_achilles_depressed_3",
		[4] = "troy_fm_achilles_depressed_4",
		[5] = "troy_fm_achilles_depressed_5"
	}
}

troy_achilles_moods_loc_keys = {
	calm = {
		title = "troy_fm_achilles_calm_title",
		descr = "troy_fm_achilles_calm_descr",
		extend = "",
	},
	enraged = {
		title = "troy_fm_achilles_enraged_title",
		descr = "troy_fm_achilles_enraged_descr",
		extend = "troy_fm_achilles_enraged_extend",

	},
	insulted = {
		title = "troy_fm_achilles_insulted_title",
		descr = "troy_fm_achilles_insulted_descr",
		extend = "troy_fm_achilles_insulted_extend",
	},
	depressed = {
		title = "troy_fm_achilles_depressed_title",
		descr = "troy_fm_achilles_depressed_descr",
		extend = "troy_fm_achilles_depressed_extend",
	},
}

-- Constants and vars
local troy_achilles_moods_min_value = 0
troy_achilles_moods = {
	enraged = {
		value = 0,
		max_value = 100,
		old_value = nil,
		dilemma = troy_achilles_hot_blooded_dilemma_list.enraged[1],
		--dilemma = "troy_fm_achilles_enraged",
		ui_bar = "bar_enraged",
		breakdown_factor = nil,
		bundles = {
			faction = {
				key = "effect_bundle_fm_achilles_enraged_faction"
			},
			military_force = {
				key = "effect_bundle_fm_achilles_enraged_army"
			}
		}
	},
	insulted = {
		value = 0,
		max_value = 100,
		old_value = nil,
		ui_bar = "bar_insulted",
		dilemma = troy_achilles_hot_blooded_dilemma_list.insulted[1], --"troy_fm_achilles_insulted",
		breakdown_factor = nil,
		bundles = {
			faction = {
				key = "effect_bundle_fm_achilles_insulted_faction"
			},
			military_force = {
				key = "effect_bundle_fm_achilles_insulted_army"
			}
		}
	},
	depressed = {
		value = 0,
		max_value = 100,
		old_value = nil,
		dilemma = troy_achilles_hot_blooded_dilemma_list.depressed[1], --"troy_fm_achilles_depressed",
		ui_bar = "bar_depressed",
		breakdown_factor = nil,
		bundles = {
			faction = {
				key = "effect_bundle_fm_achilles_depressed_faction"
			},
			military_force = {
				key = "effect_bundle_fm_achilles_depressed_army"
			}
		}
	}
}

TROY_ACHILLES_MOODS_BREAKDOWN_FACTORS = {
	enraged = {},
	insulted = {},
	depressed = {},
}

--bool variable to be used for Achilles' mood pause when he is Outraged
has_achilles_fought = false

--enraged factors
table.insert(TROY_ACHILLES_MOODS_BREAKDOWN_FACTORS.enraged, {breakdown_factor = "dilemma", loc_key = "troy_main_achilles_breakdown_factor_dilemma"})
table.insert(TROY_ACHILLES_MOODS_BREAKDOWN_FACTORS.enraged, {breakdown_factor = "war_declarations", loc_key = "troy_main_achilles_breakdown_factor_war_declaration"})
table.insert(TROY_ACHILLES_MOODS_BREAKDOWN_FACTORS.enraged, {breakdown_factor = "raided", loc_key = "troy_main_achilles_breakdown_factor_raided"})
table.insert(TROY_ACHILLES_MOODS_BREAKDOWN_FACTORS.enraged, {breakdown_factor = "lost_battle", loc_key = "troy_main_achilles_breakdown_factor_lost_battle"})
table.insert(TROY_ACHILLES_MOODS_BREAKDOWN_FACTORS.enraged, {breakdown_factor = "agent_action", loc_key = "troy_main_achilles_breakdown_factor_agent_action"})
table.insert(TROY_ACHILLES_MOODS_BREAKDOWN_FACTORS.enraged, {breakdown_factor = "ambushed", loc_key = "troy_main_achilles_breakdown_factor_ambushed"})
table.insert(TROY_ACHILLES_MOODS_BREAKDOWN_FACTORS.enraged, {breakdown_factor = "greatest_warrior_duel_result", loc_key = "troy_main_achilles_breakdown_factor_duel_result"})
table.insert(TROY_ACHILLES_MOODS_BREAKDOWN_FACTORS.enraged, {breakdown_factor = "demand_recognition_refuse", loc_key = "troy_main_achilles_breakdown_factor_demand_recognition_refuse"})

--insulted factors
table.insert(TROY_ACHILLES_MOODS_BREAKDOWN_FACTORS.insulted, {breakdown_factor = "dilemma", loc_key = "troy_main_achilles_breakdown_factor_dilemma"})
table.insert(TROY_ACHILLES_MOODS_BREAKDOWN_FACTORS.insulted, {breakdown_factor = "low_loyalty", loc_key = "troy_main_achilles_breakdown_factor_low_loyalty"})
table.insert(TROY_ACHILLES_MOODS_BREAKDOWN_FACTORS.insulted, {breakdown_factor = "ancillary_lost", loc_key = "troy_main_achilles_breakdown_factor_ancillary_lost"})
table.insert(TROY_ACHILLES_MOODS_BREAKDOWN_FACTORS.insulted, {breakdown_factor = "encamped_or_garrisoned", loc_key = "troy_main_achilles_breakdown_factor_encamped_or_garrisoned"})
table.insert(TROY_ACHILLES_MOODS_BREAKDOWN_FACTORS.insulted, {breakdown_factor = "negative_diplomatic", loc_key = "troy_main_achilles_breakdown_factor_negative_diplomatic"})
table.insert(TROY_ACHILLES_MOODS_BREAKDOWN_FACTORS.insulted, {breakdown_factor = "greatest_warrior_duel_result", loc_key = "troy_main_achilles_breakdown_factor_duel_result"})
table.insert(TROY_ACHILLES_MOODS_BREAKDOWN_FACTORS.insulted, {breakdown_factor = "greatest_warrior_duel_refused", loc_key = "troy_main_achilles_breakdown_factor_duel_refused"})
table.insert(TROY_ACHILLES_MOODS_BREAKDOWN_FACTORS.insulted, {breakdown_factor = "favour_tier_down", loc_key = "troy_main_achilles_breakdown_factor_favour_tier_down"})

--depressed factors
table.insert(TROY_ACHILLES_MOODS_BREAKDOWN_FACTORS.depressed, {breakdown_factor = "dilemma", loc_key = "troy_main_achilles_breakdown_factor_dilemma"})
table.insert(TROY_ACHILLES_MOODS_BREAKDOWN_FACTORS.depressed, {breakdown_factor = "any_unit_destroyed", loc_key = "troy_main_achilles_breakdown_factor_myrmidon_unit_destroyed"})
table.insert(TROY_ACHILLES_MOODS_BREAKDOWN_FACTORS.depressed, {breakdown_factor = "razed", loc_key = "troy_main_achilles_breakdown_factor_razed"})
table.insert(TROY_ACHILLES_MOODS_BREAKDOWN_FACTORS.depressed, {breakdown_factor = "kill_captives", loc_key = "troy_main_achilles_breakdown_factor_kill_captives"})
table.insert(TROY_ACHILLES_MOODS_BREAKDOWN_FACTORS.depressed, {breakdown_factor = "allied_general_wounded_or_killed", loc_key = "troy_main_achilles_breakdown_factor_allied_general_wounded_or_killed"})
table.insert(TROY_ACHILLES_MOODS_BREAKDOWN_FACTORS.depressed, {breakdown_factor = "greatest_warrior_duel_result", loc_key = "troy_main_achilles_breakdown_factor_duel_result"})







troy_achilles_moods_counter = 1

insulted_treshhold = 1 -- Loyalty treshhold below which Achilles will be angry
TROY_ACHILLES_DEFAULT_MOOD = "calm"
TROY_ACHILLES_DEFAULT_BUNDLE_FACTION = "effect_bundle_fm_achilles_calm_faction"
TROY_ACHILLES_DEFAULT_BUNDLE_ARMY = "effect_bundle_fm_achilles_calm_army"
troy_achilles_current_mood = TROY_ACHILLES_DEFAULT_MOOD
troy_achilles_current_mood_solidified = false

function AchillesHotBlooded_StartPosSetup()
	troy_achilles_current_mood = TROY_ACHILLES_DEFAULT_MOOD
	if not cm:model():world():faction_by_key(achilles_faction):is_null_interface() then
		local achilles_cqi = cm:model():world():faction_by_key(achilles_faction):faction_leader():command_queue_index()
		cm:apply_effect_bundle(TROY_ACHILLES_DEFAULT_BUNDLE_FACTION, achilles_faction, 0)
		cm:apply_effect_bundle_to_characters_force(TROY_ACHILLES_DEFAULT_BUNDLE_ARMY, achilles_cqi, 0)
		for k, v in pairs(troy_achilles_moods) do
			v.value = 0
			v.breakdown = nil
		end
	end
end

function achilles_hot_blooded_reset_mood()
	troy_achilles_current_mood = TROY_ACHILLES_DEFAULT_MOOD
	local achilles_cqi = cm:model():world():faction_by_key(achilles_faction):faction_leader():command_queue_index()
	cm:apply_effect_bundle(TROY_ACHILLES_DEFAULT_BUNDLE_FACTION, achilles_faction, 0)
	cm:apply_effect_bundle_to_characters_force(TROY_ACHILLES_DEFAULT_BUNDLE_ARMY, achilles_cqi, 0)
	for k, v in pairs(troy_achilles_moods) do
		v.value = 0
		v.breakdown = nil
	end
	cm:show_configurable_message_event(achilles_faction, "event_feed_strings_text_troy_event_feed_string_scripted_event_achilles_mood_end_title", "event_feed_strings_text_troy_event_feed_string_scripted_event_achilles_mood_end_primary_details", "troy_event_feed_string_scripted_event_achilles_mood_end_secondary_details", 1087)
	--
	has_achilles_fought = false
	achievements.achilles.func_mood_changed()
end

function achilles_hot_blooded_set_mood(mood)

	if mood == troy_achilles_current_mood then
		return
	end


	local achilles_cqi = cm:model():world():faction_by_key(achilles_faction):faction_leader():command_queue_index()

	-- remove default bundle
	if troy_achilles_current_mood ~= TROY_ACHILLES_DEFAULT_MOOD then
		local bundles = troy_achilles_moods[troy_achilles_current_mood].bundles
		cm:remove_effect_bundle(bundles.faction.key, achilles_faction)
		cm:remove_effect_bundle_from_characters_force(bundles.military_force.key, achilles_cqi)

	else
		cm:remove_effect_bundle(TROY_ACHILLES_DEFAULT_BUNDLE_FACTION, achilles_faction)
		cm:remove_effect_bundle_from_characters_force(TROY_ACHILLES_DEFAULT_BUNDLE_ARMY, achilles_cqi)

	end

	for k, v in pairs(troy_achilles_moods) do
		v.value = 0
		v.breakdown = nil
		if k == mood then
			v.value = 100
		end
	end

	troy_achilles_current_mood = mood
end

function achilles_hot_blooded_pause(context)
	local achilles_faction_interface = cm:model():world():faction_by_key(achilles_faction)
	if not achilles_faction_interface or achilles_faction_interface:is_null_interface() then
		script_error("WARNING: achilles_hot_blooded_pause() called but achilles faction was not found")
		return
	end

	if achilles_faction_interface:is_dead() then
		script_error("WARNING: achilles_hot_blooded_pause() called but achilles faction is dead")
		return
	end

	local achilles_faction_leader = achilles_faction_interface:faction_leader()
	if not achilles_faction_leader or achilles_faction_leader:is_null_interface() then
		script_error("WARNING: achilles_hot_blooded_pause() called but achilles faction's leader was not found")
		return
	end

	local achilles_cqi = achilles_faction_leader:command_queue_index()
	if not troy_achilles_moods[troy_achilles_current_mood] then
		script_error("WARNING: achilles_hot_blooded_pause() called but no mood record could be found for current mood [" .. tostring(troy_achilles_current_mood) .. "] - disregarding");
		return;
	end;

	local bundles = troy_achilles_moods[troy_achilles_current_mood].bundles

	--add mood's faction bundle
	if bundles.faction.key ~= "" then
		cm:apply_effect_bundle(bundles.faction.key, achilles_faction, 1)
	end

	--add mood's military force bundle
	if bundles.military_force.key ~= "" then
		cm:apply_effect_bundle_to_characters_force(bundles.military_force.key, achilles_cqi, 1)
	end
	has_achilles_fought = false

end

function achilles_hot_blooded_dilemma_choice_made(context)
	local choice = context:choice()
	local achilles_cqi = cm:model():world():faction_by_key(achilles_faction):faction_leader():command_queue_index()
	if choice == 0 then
		troy_achilles_current_mood_solidified = true
		-- remove default bundle
		cm:remove_effect_bundle(TROY_ACHILLES_DEFAULT_BUNDLE_FACTION, achilles_faction)
		cm:remove_effect_bundle_from_characters_force(TROY_ACHILLES_DEFAULT_BUNDLE_ARMY, achilles_cqi)
		out("achilles mood current on dilemma fire: " .. troy_achilles_current_mood)
		cm:callback(function() cm:trigger_incident(achilles_faction,"troy_fm_achilles_" .. tostring(troy_achilles_current_mood) .. "_activated",true) end, 0.1)
		-- local bundles = troy_achilles_moods[troy_achilles_current_mood].bundles

		-- --add mood's faction bundle
		-- if bundles.faction.key ~= "" then
		-- 	cm:apply_effect_bundle(bundles.faction.key, achilles_faction, bundles.faction.duration)
		-- end

		-- --add mood's military force bundle
		-- if bundles.military_force.key ~= "" then
		-- 	cm:apply_effect_bundle_to_characters_force(bundles.military_force.key, achilles_cqi, bundles.military_force.duration)
		-- end

		--achilles_hot_blooded_update_ui()

		--
		achievements.achilles.func_mood_changed()
	else
		local the_mood = troy_achilles_current_mood
		troy_achilles_current_mood = TROY_ACHILLES_DEFAULT_MOOD
		increase_achilles_mood_value(the_mood, -50, "dilemma")
		troy_achilles_current_mood_solidified = false

		troy_achilles_moods_counter = troy_achilles_moods_counter + 1

		for _mood,v in pairs(troy_achilles_moods) do

			if troy_achilles_hot_blooded_dilemma_list[_mood] then
				local idx = #troy_achilles_hot_blooded_dilemma_list[_mood]
				if idx > troy_achilles_moods_counter then
					idx = troy_achilles_moods_counter
				end
				v.dilemma = troy_achilles_hot_blooded_dilemma_list[_mood][idx]
			end

			if v.value >= v.max_value then
				change_achilles_mood(_mood, v.old_value, v.value, v.breakdown_factor)
			end
		end

	end
end




function increase_achilles_mood_value(mood, value, _breakdown_factor)
	local achilles_is_ai = not cm:model():world():faction_by_key(achilles_faction):is_human()
	if (achilles_is_ai or troy_achilles_current_mood_solidified) and troy_achilles_current_mood ~= TROY_ACHILLES_DEFAULT_MOOD then
		return
	end

	if not troy_achilles_moods[mood] then
		out("error: mood " .. mood .. " not found")
		return
	end

	if not troy_achilles_moods[mood].breakdown then
		troy_achilles_moods[mood].breakdown = {}
	end

	local breakdown_factor = _breakdown_factor or "generic"
	if not troy_achilles_moods[mood].breakdown[breakdown_factor] then
		troy_achilles_moods[mood].breakdown[breakdown_factor] = value
	else
		troy_achilles_moods[mood].breakdown[breakdown_factor] = troy_achilles_moods[mood].breakdown[breakdown_factor] + value
	end

	out("troy achilles mood(".. mood ..") change: [" .. breakdown_factor .. "] = " .. tostring(mood_change) .. " -> " .. tostring(troy_achilles_moods[mood].breakdown[breakdown_factor]))

	local old_value = troy_achilles_moods[mood].value
	troy_achilles_moods[mood].value = math.clamp(troy_achilles_moods[mood].value + value, troy_achilles_moods_min_value, troy_achilles_moods[mood].max_value)


	if troy_achilles_current_mood ~= TROY_ACHILLES_DEFAULT_MOOD then
		troy_achilles_moods[mood].old_value = old_value
		troy_achilles_moods[mood].breakdown_factor = breakdown_factor
	else
		change_achilles_mood(mood, old_value, value, breakdown_factor)
	end
end

function change_achilles_mood(mood, old_value, value, breakdown_factor)
	if troy_achilles_moods[mood].value >= troy_achilles_moods[mood].max_value then
		troy_achilles_moods[mood].value = troy_achilles_moods[mood].max_value
		troy_achilles_current_mood = mood
		troy_achilles_current_mood_solidified = false

		local whose_turn_is_it = cm:model():world():whose_turn_is_it()

		if whose_turn_is_it:is_human() and whose_turn_is_it:name() == achilles_faction  then
			cm:trigger_dilemma(achilles_faction,troy_achilles_moods[mood].dilemma)
			return
		elseif whose_turn_is_it:is_human() and whose_turn_is_it:name() ~= achilles_faction then
			local turn_num = cm:model():turn_number()
			core:add_listener(
				"delayed_achilles_hot_blooded_dilemma",
				"FactionTurnStart",
				function(context)
					return (cm:model():turn_number() == (turn_num + 1)) and (context:faction():name() == achilles_faction)
				end,
				function(context)
					cm:trigger_dilemma(achilles_faction,troy_achilles_moods[mood].dilemma)
					core:remove_listener("delayed_achilles_hot_blooded_dilemma")
				end,
				false
			)
		end
	end

	local mood_change = troy_achilles_moods[mood].value - old_value
	local secondary_detail = ""
	if mood_change ~= 0 then

		if cm:model():world():whose_turn_is_it():name() == achilles_faction then

			local event_id = 1037

			if mood == "insulted" then
				event_id = 1038
			elseif mood == "depressed" then
				event_id = 1039
			end

			for k,v in ipairs(TROY_ACHILLES_MOODS_BREAKDOWN_FACTORS[mood]) do
				if breakdown_factor == v.breakdown_factor then
					secondary_detail = "campaign_localised_strings_string_" .. v.loc_key
				end
			end

			if troy_achilles_moods[mood].value > 79 then

			cm:show_message_event(
				achilles_faction,
				"event_feed_strings_text_troy_event_feed_string_scripted_event_achilles_mood_change_primary_details",
				"event_feed_strings_text_troy_event_feed_string_scripted_event_achilles_mood_change_title",
				secondary_detail,
				true,
				event_id,
				nil,
				nil,
				true,
				mood_change)
			else
				cm:show_configurable_message_event(
					achilles_faction,
					"event_feed_strings_text_troy_event_feed_string_scripted_event_achilles_mood_change_primary_details",
					"event_feed_strings_text_troy_event_feed_string_scripted_event_achilles_mood_change_title",
					secondary_detail,
					event_id,
					mood_change)
			end

			-- trigger a script event to notify other scripts of a mood change
			core:trigger_event("ScriptEventAchillesMoodChange", cm:get_faction(achilles_faction), troy_achilles_current_mood);
		else
			if not troy_achilles_moods[mood].mood_change_last_turn then
				troy_achilles_moods[mood].mood_change_last_turn = 0
			end
			troy_achilles_moods[mood].mood_change_last_turn = troy_achilles_moods[mood].mood_change_last_turn + mood_change
		end

	end

	--[[ if troy_achilles_current_mood == "insulted" then
		cm:force_diplomacy_via_string("faction:"..achilles_faction,"all",false,false,false,"all")
		cm:force_diplomacy("faction:"..achilles_faction,"all","cancel hard military access",true,true,false,false)
		cm:force_diplomacy("faction:"..achilles_faction,"all","break alliance",true,true,false,false)
		cm:force_diplomacy("faction:"..achilles_faction,"all","cancel soft military access",true,true,false,false)
		cm:force_diplomacy("faction:"..achilles_faction,"all","break non aggression pact",true,true,false,false)
		cm:force_diplomacy("faction:"..achilles_faction,"all","break soft military access",true,true,false,false)
		cm:force_diplomacy("faction:"..achilles_faction,"all","break defensive alliance",true,true,false,false)
		cm:force_diplomacy("faction:"..achilles_faction,"all","break vassal",true,true,false,false)
		cm:force_diplomacy("faction:"..achilles_faction,"all","break subject",true,true,false,false)
		cm:force_diplomacy("faction:"..achilles_faction,"all","break client state",true,true,false,false)
		cm:force_diplomacy("faction:"..achilles_faction,"all","war",true,true,false,false)
		cm:force_diplomacy("faction:"..achilles_faction,"all", "trade agreement" , false, false, false)
		cm:force_diplomacy("all", "all", "payments", false, false,false)
	else
		cm:force_diplomacy("faction:"..achilles_faction,"all","all",true,true,true)
		cm:force_diplomacy("faction:"..achilles_faction, "all", "regions" , true, true, true)
		cm:force_diplomacy("faction:"..achilles_faction, "all", "trade agreement" , false, false, false)
		cm:force_diplomacy("faction:"..achilles_faction, "all", "payments", false, false,false)
		cm:force_diplomacy("faction:"..achilles_faction, "all", "vassal", false, true, true)
		cm:force_diplomacy("faction:"..achilles_faction, "all", "subject", false, true, true)
	end]]

	achilles_hot_blooded_update_ui()
end

function achilles_hot_blooded_get_mood_change_last_turn(mood)
	if not troy_achilles_moods[mood] then
		out("error: mood " .. mood .. " not found")
		return 0
	end

	return troy_achilles_moods[mood].mood_change_last_turn or 0

end

function achilles_hot_blooded_mood_change_event()
	if troy_achilles_current_mood ~= TROY_ACHILLES_DEFAULT_MOOD then
		return
	end

	local mood_enraged_change_last_turn = achilles_hot_blooded_get_mood_change_last_turn("enraged")
	local mood_insulted_change_last_turn = achilles_hot_blooded_get_mood_change_last_turn("insulted")
	local mood_depressed_change_last_turn = achilles_hot_blooded_get_mood_change_last_turn("depressed")

	--reset counters
	for _mood,v in pairs(troy_achilles_moods) do
		v.mood_change_last_turn = 0
	end

	if mood_depressed_change_last_turn ~= 0 or mood_insulted_change_last_turn ~= 0 or mood_depressed_change_last_turn ~= 0 then
		cm:show_message_event(
				achilles_faction,
				"event_feed_strings_text_troy_event_feed_string_scripted_event_achilles_mood_change_primary_details",
				"event_feed_strings_text_troy_event_feed_string_scripted_event_achilles_mood_change_title",
				"event_feed_strings_text_troy_event_feed_string_all_null", -- handled in db (this param is not used)
				true,
				1036,
				nil,
				nil,
				true,
				mood_enraged_change_last_turn,
				mood_insulted_change_last_turn,
				mood_depressed_change_last_turn)

		-- trigger a script event to notify other scripts of a mood change
		core:trigger_event("ScriptEventAchillesMoodChange", cm:get_faction(achilles_faction), troy_achilles_current_mood);
	end
end

--#########################################
-- triggers
--##########################################

function achilles_hot_blooded_add_listeners()
	out("Listener for Achilles Hot Blooded moods started")

	core:add_listener(
		"Troy_achilles_dilemma_choice_listener",
		"DilemmaChoiceMadeEvent",
		function(context)

			if context:faction():name() ~= achilles_faction then
				return false
			end

			if troy_achilles_current_mood == TROY_ACHILLES_DEFAULT_MOOD then
				return false
			end

			for k, v in pairs(troy_achilles_moods) do
				if v.dilemma == context:dilemma() then
					return true
				end
			end
		return false
		end,
		achilles_hot_blooded_dilemma_choice_made,
		true
	)

	core:add_listener (
		"Troy_achilles_garrisoned_not_under_siege",
		"CharacterTurnStart",
		function(context)
			local achilles = context:character()
			if not achilles:has_military_force() then
				return false
			end
			if achilles:character_subtype("troy_achilles") and achilles:has_garrison_residence() then
				return not achilles:garrison_residence():is_under_siege() and troy_achilles_current_mood == "insulted"
			end
			return false
		end,
		achilles_hot_blooded_pause,
		true
		)

	core:add_listener (
		"Troy_achilles_participated_in_battle",
		"CharacterCompletedBattle",
		function(context)
			local achilles = context:character()
			return achilles:character_subtype("troy_achilles") and troy_achilles_current_mood == "enraged"
		end,
		function(context)
			has_achilles_fought = true
		end,
		true
		)

	core:add_listener (
		"Troy_achilles_has_achilles_fought",
		"FactionTurnStart",
		function(context)
			return context:faction():name() == achilles_faction and troy_achilles_current_mood == "enraged" and has_achilles_fought == true
		end,
		achilles_hot_blooded_pause,
		true
		)

	core:add_listener (
		"Troy_achilles_mood_pause_priest",
		"FactionTurnStart",
		function(context)
			if context:faction():name() ~= achilles_faction then
				return false
			end
			if troy_achilles_current_mood ~= "depressed" then
				return false
			end
			local achilles_military_force = context:faction():faction_leader():military_force()
			if achilles_military_force:is_null_interface() then
				return false
			end
			local contains_priest = false
			local char_list = achilles_military_force:character_list()
			for i=0,char_list:num_items()-1 do
				if char_list:item_at(i):character_subtype("troy_agent_priest") then
					return true
				end
			end
			return false
		end,
		achilles_hot_blooded_pause,
		true
		)

	core:add_listener (
		"Achilles_HotBlooded_PanelOpenedCampaign",
		"PanelOpenedCampaign",
		function(context) return context.string == "fm_achilles_hotblooded" end,
		function(context)
--			increase_achilles_mood_value("enraged", 99)
			achilles_hot_blooded_update_ui()
		end,
		true
	)

	core:add_listener (
	"Troy_achilles_turn_start_low_loyalty",
	"FactionTurnStart",
	function(context) return context:faction():name() == achilles_faction end,
	function(context)
		local char_list = context:faction():character_list()
		for i=0,char_list:num_items()-1 do
			local curr_char = char_list:item_at(i)
			if curr_char:character_type("general") and curr_char:has_region() and not curr_char:is_faction_leader() and curr_char:loyalty() < insulted_treshhold then
				increase_achilles_mood_value("insulted", 10, "low_loyalty")
			end
		end
	end,
	true
	)

	core:add_listener (
	"Troy_achilles_treaty_ended",
	"NegativeDiplomaticEvent",
	function(context)
		local fl = context:character()
		return fl:faction():name() == achilles_faction and context:proposer():faction_leader() == fl and context:result_of_confederation() == false
	end,
	function(context)
		if context:was_military_alliance() or context:was_military_access() or context:was_barter_agreement() or context:was_non_aggression_pact() or context:was_vassalage() or context:was_subjugation() or context:was_defensive_alliance() then
			increase_achilles_mood_value("insulted", 10, "negative_diplomatic")
		end
	end,
	true
	)

	core:add_listener (
	"Troy_achilles_encamped_or_garrisoned",
	"CharacterTurnEnd",
	function(context)
		local char = context:character()
		if char:character_subtype("troy_achilles") and char:has_military_force() then
			return char:has_garrison_residence() or char:military_force():active_stance() == "MILITARY_FORCE_ACTIVE_STANCE_TYPE_SET_CAMP"
		end
	end,
	function(context)
		increase_achilles_mood_value("insulted", 10, "encamped_or_garrisoned")
	end,
	true
	)

	core:add_listener (
		"Troy_achilles_ancillary_lost",
		"CharacterAncillaryLost",
		function(context)
			local char = context:character()
			local ancil = context:ancillary()
			local skip = false
			local is_achilles = char:character_subtype("troy_achilles")
			for _, data in ipairs(epic_skin.defs.hisotrical_campaign_ancillaries) do
				if ancil == data.existing_ancillary then
					skip = true
				end
			end
			return is_achilles and not skip
		end,
		function(context)
			increase_achilles_mood_value("insulted", 10, "ancillary_lost")
		end,
		true
	)

	core:add_listener (
	"Troy_achilles_favour_tier_down",
	"FactionGodAttitudeTierChange",
	function(context)
		return context:faction():name() == achilles_faction and (context:old_tier() > context:new_tier())
	end,
	function(context)
		increase_achilles_mood_value("insulted", 10, "favour_tier_down")
	end,
	true
	)

	core:add_listener (
	"Troy_achilles_war_with_neighbours",
	"FactionTurnStart",
	function(context)
		return context:faction():name() == achilles_faction
	end,
	function(context)
		local achilles = context:faction()
		local achilles_region_list = achilles:region_list()
		local enraged_value = 0
		local neighbours_at_war = {}
		--count number of neighbouring factions at war
		for i = 0, achilles_region_list:num_items() - 1 do
			local adjacent_region_list = achilles_region_list:item_at(i):adjacent_region_list()
			for j = 0, adjacent_region_list:num_items() - 1 do
				if adjacent_region_list:item_at(j):owning_faction():at_war_with(achilles) then
					local neighbour_name = adjacent_region_list:item_at(j):owning_faction():name()
					if neighbours_at_war[neighbour_name] == nil then
						neighbours_at_war[neighbour_name] = true
					end
				end
			end
		end
		for k,_ in pairs(neighbours_at_war) do
			enraged_value = enraged_value + 5
		end
		if enraged_value > 0 then 
			increase_achilles_mood_value("enraged", enraged_value, "war_declarations")
		end
	end,
	true
	)

	core:add_listener (
	"Troy_achilles_lost_battle",
	"BattleConflictFinished",
	function(context)
		local pb = context:pending_battle()
		local attacker = pb:attacker()
		local attacker_valid = attacker and not attacker:is_null_interface() and attacker:faction():name() == achilles_faction
		local defender = pb:defender()
		local defender_valid = defender and not defender:is_null_interface() and defender:faction():name() == achilles_faction
		return attacker_valid or defender_valid
	end,
	function(context)
		local pb = context:pending_battle()
		local relevant_character
		local attacker = pb:attacker()
		if attacker and not attacker:is_null_interface() and attacker:faction():name() == achilles_faction then
			relevant_character = attacker
		else
			relevant_character = pb:defender()
		end
		if not relevant_character:won_battle() then
			increase_achilles_mood_value("enraged", 10, "lost_battle")
		end
	end,
	true
	)

	core:add_listener (
	"Troy_achilles_being_raided",
	"CharacterTurnEnd",
	function(context)
		local char = context:character()
		if not (char:faction():name() == achilles_faction) and char:has_military_force() then
			if char:military_force():active_stance() == "MILITARY_FORCE_ACTIVE_STANCE_TYPE_LAND_RAID" and char:has_region() then
				if char:region():owning_faction():name() == achilles_faction then
					return true
				end
			end
		end
		return false
	end,
	function(context)
		increase_achilles_mood_value("enraged", 10, "raided")
	end,
	true
	)

	core:add_listener (
	"Troy_achilles_victim_of_agent_action",
	"CharacterCharacterTargetAction",
	function(context) 
		return context:target_character():faction():name() == achilles_faction and context:ability() ~= "assist_army" 
	end,
	function(context)
		increase_achilles_mood_value("enraged", 5, "agent_action")
	end,
	true
	)

	core:add_listener (
	"Troy_achilles_got_ambushed",
	"CharacterCompletedBattle",
	function(context)
		if context:character():character_subtype("troy_achilles") and context:pending_battle():defender():character_subtype("troy_achilles") then
			if context:pending_battle():ambush_battle() or context:pending_battle():failed_ambush_battle() then
				return true
			end
		end
		return false
	end,
	function(context)
		increase_achilles_mood_value("enraged", 20, "ambushed")
	end,
	true
	)

	--[[ core:add_listener (
	"Troy_achilles_myrmidon_unit_destroyed",
	"CharacterCompletedBattle",
	function(context)
		if (context:character():faction():name() == achilles_faction) and (context:character():has_military_force()) then
			return true
		end
		return false
	end,
	function(context)
		local unit_list = context:character():military_force():unit_list()
		if unit_list:has_unit("troy_pht_myrmidon_spearmen") or unit_list:has_unit("troy_pht_myrmidon_swordsmen") then
			for i=0,unit_list:num_items()-1 do
				if (unit_list:item_at(i):unit_key() == "troy_pht_myrmidon_spearmen") or (unit_list:item_at(i):unit_key() == "troy_pht_myrmidon_swordsmen") then
					if unit_list:item_at(i):percentage_proportion_of_full_strength() < 0.05 then
						increase_achilles_mood_value("depressed", 5, "myrmidon_unit_destroyed")
					end
				end
			end
		end
	end,
	true
	) ]]

	core:add_listener (
	"Troy_achilles_any_unit_destroyed",
	"UnitDestroyed",
	function(context)
		if context:was_embedded_agent() then
			return false
		end
		local unit = context:unit()
		local fc = unit:force_commander()

		return not fc:is_null_interface() and fc:character_subtype("troy_achilles") and fc:faction():name() == achilles_faction
	end,
	function(context)
		increase_achilles_mood_value("depressed", 5, "any_unit_destroyed")
	end,
	true
	)

	core:add_listener (
	"Troy_achilles_faction_character_settlement_razed",
	"CharacterRazedSettlement",
	function(context)
		return context:character():faction():name() == achilles_faction
	end,
	function(context)
		increase_achilles_mood_value("depressed", 20, "razed")
	end,
	true
	)

	core:add_listener (
	"Troy_achilles_owned_settlement_razed",
	"CharacterPerformsSettlementOccupationDecisionBeforeOutcomeApplication",
	function(context)
		return context:occupation_decision_option() == "occupation_decision_raze_without_occupy" and context:garrison_residence():faction():name() == achilles_faction
	end,
	function(context)
		increase_achilles_mood_value("depressed", 20, "razed")
	end,
	true
	)

	core:add_listener (
	"Troy_achilles_allied_general_wounded_or_killed",
	"FactionCharacterDiedOrWounded",
	function(context)
		return context:family_member():character():character_type("general") and not context:family_member():is_in_transit() and (context:faction():name() == achilles_faction) and context:faction():allied_with(cm:model():world():faction_by_key(achilles_faction))
	end,
	function(context)
		increase_achilles_mood_value("depressed", 20, "allied_general_wounded_or_killed")
	end,
	true
	)

	core:add_listener (
	"Troy_achilles_own_general_wounded_or_killed",
	"FactionCharacterDiedOrWounded",
	function(context)
		return context:family_member():character():character_type("general") and context:faction():name() == achilles_faction and not context:family_member():is_in_transit()
	end,
	function(context)
		increase_achilles_mood_value("depressed", 20, "allied_general_wounded_or_killed")
	end,
	true
	)

	core:add_listener (
	"Troy_achilles_kill_captives",
	"CharacterPostBattleSlaughter",
	function(context)
		return context:character():faction():name() == achilles_faction and context:is_automatically_selected() == false
	end,
	function(context)
		increase_achilles_mood_value("depressed", 10, "kill_captives")
	end,
	true
	)

	core:add_listener (
	"Troy_achilles_mood_reset_listener",
	"FactionTurnStart",
	function(context)
		local faction_interface = context:faction()
		if faction_interface:name() ~= achilles_faction then
			return false
		end

		if troy_achilles_current_mood == TROY_ACHILLES_DEFAULT_MOOD then
			return false
		end

		for k, v in pairs(troy_achilles_moods) do
			if faction_interface:has_effect_bundle(v.bundles.faction.key) then
				return false
			end
		end
		return true
	end,
	achilles_hot_blooded_reset_mood,
	true
	)

end

function achilles_hot_blooded_update_ui()
	local panel = find_uicomponent(core:get_ui_root(), "fm_achilles_hotblooded")

	if panel and panel:Visible() then

		local current_mood_data = {
			faction_bundle_record_key = troy_achilles_current_mood == TROY_ACHILLES_DEFAULT_MOOD and TROY_ACHILLES_DEFAULT_BUNDLE_FACTION or troy_achilles_moods[troy_achilles_current_mood].bundles.faction.key,
			force_bundle_record_key = troy_achilles_current_mood == TROY_ACHILLES_DEFAULT_MOOD and TROY_ACHILLES_DEFAULT_BUNDLE_ARMY or troy_achilles_moods[troy_achilles_current_mood].bundles.military_force.key,
			localisation_data = troy_achilles_moods_loc_keys[troy_achilles_current_mood],
			breakdown = {},
			can_show_breakdown = false,
			value = troy_achilles_current_mood ~= TROY_ACHILLES_DEFAULT_MOOD and troy_achilles_moods[troy_achilles_current_mood].value or 0,
			name = troy_achilles_current_mood
		}

		panel:InterfaceFunction("set_active_mood_data", current_mood_data)

		-- fill the bars and set bundles
		for k,v in pairs(troy_achilles_moods) do
			local value = (troy_achilles_current_mood == k or troy_achilles_current_mood == TROY_ACHILLES_DEFAULT_MOOD) and v.value or 0
			local bar_data = {
				ui_bar = v.ui_bar,
				value = value,
				interactable = true,
				faction_bundle_record_key = v.bundles.faction.key,
				force_bundle_record_key = v.bundles.military_force.key,
				localisation_data = troy_achilles_moods_loc_keys[k],
				breakdown = {},
				can_show_breakdown = troy_achilles_current_mood == TROY_ACHILLES_DEFAULT_MOOD,
				is_bar_holder_visible = true,
				name = k,
				is_current_mood = troy_achilles_current_mood == k
			}

			if TROY_ACHILLES_MOODS_BREAKDOWN_FACTORS[k] then
				for i,f in ipairs(TROY_ACHILLES_MOODS_BREAKDOWN_FACTORS[k]) do
					local fv = v.breakdown and v.breakdown[f.breakdown_factor] or 0
					table.insert(bar_data.breakdown, {factor_key = f.loc_key, factor_value = fv, is_positive = f.breakdown_factor ~= "dilemma"})
				end
			end
			panel:InterfaceFunction("set_bar_data", bar_data)
		end

		--
		local default_bar_data = {
			ui_bar = "bar_proud",
			value = troy_achilles_current_mood == TROY_ACHILLES_DEFAULT_MOOD and 100 or 0,
			interactable = true,
			faction_bundle_record_key = TROY_ACHILLES_DEFAULT_BUNDLE_FACTION,
			force_bundle_record_key = TROY_ACHILLES_DEFAULT_BUNDLE_ARMY,
			localisation_data = troy_achilles_moods_loc_keys[TROY_ACHILLES_DEFAULT_MOOD],
			breakdown = {},
			can_show_breakdown = false,
			is_bar_holder_visible = true,
			name = TROY_ACHILLES_DEFAULT_MOOD,
			is_current_mood = troy_achilles_current_mood == TROY_ACHILLES_DEFAULT_MOOD
		}
		panel:InterfaceFunction("set_bar_data", default_bar_data)


		out("current_mood = " .. troy_achilles_current_mood)
		-- -- updating component states
		-- local tmp_component = find_uicomponent(panel, "current_mood_icon")
		-- tmp_component:SetState(troy_achilles_current_mood)

		--tmp_component = find_uicomponent(panel, "moods_desc")
		--tmp_component:SetState(troy_achilles_current_mood)

		tmp_component = find_uicomponent(panel, "background")
		tmp_component:SetState(troy_achilles_current_mood)
	end
end

--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------

cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("TROY_ACHILLES_MOODS",troy_achilles_moods,context)
		cm:save_named_value("TROY_ACHILLES_MOODS_COUNTER",troy_achilles_moods_counter,context)
		cm:save_named_value("TROY_ACHILLES_MOODS_CURRENT_MOOD",troy_achilles_current_mood,context)
	end
)

cm:add_loading_game_callback(
	function(context)
		troy_achilles_moods = cm:load_named_value("TROY_ACHILLES_MOODS",troy_achilles_moods,context)
		troy_achilles_moods.counter = nil
		troy_achilles_moods_counter = cm:load_named_value("TROY_ACHILLES_MOODS_COUNTER",troy_achilles_moods_counter,context)
		troy_achilles_current_mood = cm:load_named_value("TROY_ACHILLES_MOODS_CURRENT_MOOD",troy_achilles_current_mood,context)
	end
)