out("Loading troy_achilles_greatest.lua")
-- Constants and vars
ACHILLES_GREATEST_WARRIOR = {
	targets = {
		--{
		--	cqi = 5,
		--	can_demand_recognition = true
		--}
	},
	resolved_targets = {
		--{
		--	cqi = 5
		--}
	},
	pick_targets_cooldown = 12
}

ACHILLES_GREATEST_WARRIOR_MAX_TARGETS = 3
ACHILLES_GREATEST_WARRIOR_PICK_TARGETS_COOLDOWN = 12
ACHILLES_GREATEST_WARRIOR_GREATEST_BUNDLE = "effect_bundle_fm_achilles_the_greatest"
ACHILLES_GREATEST_WARRIOR_NO_GREATEST_BUNDLE = "effect_bundle_fm_achilles_not_greatest"


achilles_faction = "troy_main_dan_achilles"
achilles_subtype = "troy_achilles"
achilles_friendly_duel_dilemma_key = "troy_fm_achilles_friendly_duel"
achilles_friendly_duel_target = 0
achilles_turns_to_trigger_incident = {}
achilles_turns_to_resolve_friendly_duel = 2
achilles_when_greatest_loyalty_amount = 1
achilles_greatest_reward_num = 1

achilles_oponent_eval_strings = {
	"campaign_localised_strings_string_troy_main_achilles_opponent_flavor_stronger_not_allied", -- Stronger, not allied
	"campaign_localised_strings_string_troy_main_achilles_opponent_flavor_equal_not_allied", -- Equal, not allied
	"campaign_localised_strings_string_troy_main_achilles_opponent_flavor_weaker_not_allied", -- Weaker, not allie
	"campaign_localised_strings_string_troy_main_achilles_opponent_flavor_stronger_and_allied", -- Stronger, allied
	"campaign_localised_strings_string_troy_main_achilles_opponent_flavor_equal_and_allied", -- Equal, allied
	"campaign_localised_strings_string_troy_main_achilles_opponent_flavor_weaker_and_allied" -- Weaker, allied
}

achilles_greatest_rewards_table = {
	[1] = {
		-- key of unit = amount
		["troy_pht_aeginian_runners"] = 2,
		["troy_phthian_spears"] = 2
	},
	[2] = {
		["troy_pht_aeginian_runners"] = 2,
		["troy_veteran_club_warriors"] = 2,
		["troy_pht_champions_of_phthia"] = 1
	},
	[3] = {
		["troy_pht_champions_of_phthia"] = 2,
		["troy_pht_thessaly_marines"] = 1,
		["troy_pht_myrmidon_swordsmen"] = 1
	},
	[4] = {
		["troy_pht_thessaly_marines"] = 2,
		["troy_pht_myrmidon_swordsmen"] = 1,
		["troy_pht_myrmidon_spearmen"] = 1,
	},
	[5] = {
		["troy_pht_veteran_thessaly_marines"] = 2,
		["troy_pht_myrmidon_swordsmen"] = 2,
		["troy_pht_myrmidon_spearmen"] = 2
	}
}

achilles_greatest_unit_caps = {}
--used to save caps of awarded units

named_characters_eval = {
	--[index] = { val = eval_number, forename = "forename_key", surname = "optional_surname_key" }
	[1] = {
			val = 4, -- Hector
			forename = "names_name_2060800581"
		  },
	[2] = {
			val = 3, -- Agamemnon
			forename = "names_name_610463016"
		  },
	[3] = {
			val = 6, -- Menelaus
			forename = "names_name_923017616"
		  },
	[4] = {
			val = 5, -- Odysseus
			forename = "names_name_675962708"
		  },
	[5] = {
			val = 6, -- Paris
			forename = "names_name_280733261"
		  },
	[6] = {
			val = 3, -- Aeneas
			forename = "names_name_741051588"
		  },
	[7] = {
			val = 4, -- Sarpedon
			forename = "names_name_1900383194"
		  },
	[8] = {
			val = 1, -- Penthesilea
			forename = "names_name_399994929"
		  },
	[9] = {
			val = 3, -- Hippolyta
			forename = "names_name_1382394063"
		  },
	[10] = {
			val = 1, -- Ellopians Faction Leader, Ellops
			forename = "names_name_1112037145"
		  },
	[11] = {
			val = 6, -- Narykos Faction Leader, Ajax the lesser
			forename = "names_name_648162272",
			surname = "names_name_1925783999",
		  }
}

-- functions
function achilles_greatest_set_can_demand_recognition(family_member_cqi, can_demand_recognition)
	local target_tbl = achilles_greatest_get_target(family_member_cqi)
	if target_tbl then
		target_tbl.can_demand_recognition = can_demand_recognition
		return true
	end
	return false
end

function ccq_achilles_greatest_resolve_demanded_recognition(family_member_cqi)
	local panel = find_uicomponent(core:get_ui_root(), "fm_achilles_greatestwarrior")
	if panel and panel:Visible() then
		panel:InterfaceFunction("close_panel")
	end
	
	local faction = cm:model():world():faction_by_key(achilles_faction)
	CampaignUI.TriggerCampaignScriptEvent(faction:command_queue_index(), "AchillesGreatest_ResolveDemandedRecognition_"..tostring(family_member_cqi))
end

function achilles_greatest_resolve_demanded_recognition(family_member_cqi)
	local fm = cm:model():family_member_for_command_queue_index(family_member_cqi)
	if fm:is_null_interface() then
		script_error("ERROR: AchillesGreates_ResolveDemandedRecognition() called but supplied family member cqi [" .. tostring(family_member_cqi) .. "] is not valid")
	end
	if fm:character():is_null_interface() then
		script_error("ERROR: AchillesGreates_ResolveDemandedRecognition() called but supplied family member cqi [" .. tostring(family_member_cqi) .. "] is not linked to a character")
	end
	local eval = achilles_greatest_opponent_eval(fm)

	if eval == 1 then
		increase_achilles_mood_value("enraged", 10, "demand_recognition_refuse")
		achilles_greatest_set_can_demand_recognition(family_member_cqi, false)
		cm:trigger_incident(achilles_faction, "troy_fm_achilles_demand_recognition_fail", true)
		achilles_greatest_update_ui()
	elseif eval == 2 then
		local rand = cm:model():random_int(1,100)
		if rand >= 10 then
			-- friendly duel
			achilles_friendly_duel_target = family_member_cqi
			cm:trigger_dilemma(achilles_faction, achilles_friendly_duel_dilemma_key)
			achilles_greatest_update_ui()
		else 
			-- refuse
			increase_achilles_mood_value("enraged", 10, "demand_recognition_refuse")
			achilles_greatest_set_can_demand_recognition(family_member_cqi, false)
			achilles_greatest_update_ui()
			cm:trigger_incident(achilles_faction, "troy_fm_achilles_demand_recognition_fail", true)
		end
	elseif eval == 3 then 
		local rand = cm:model():random_int(1,100)
		if rand >= 25 then
			-- recognize
			achilles_greatest_remove_target(family_member_cqi, "troy_achilles_fm_opponent_defeat_recognized", nil, "troy_fm_achilles_demand_recognition_success")
			achilles_greatest_update_ui()
		else 
			-- friendly duel
			achilles_friendly_duel_target = family_member_cqi
			cm:trigger_dilemma(achilles_faction, achilles_friendly_duel_dilemma_key)
			achilles_greatest_update_ui()
		end
	elseif eval == 4 then 
		-- friendly duel
		achilles_friendly_duel_target = family_member_cqi
		cm:trigger_dilemma(achilles_faction, achilles_friendly_duel_dilemma_key)
		achilles_greatest_update_ui()
	elseif eval == 5 then
		local rand = cm:model():random_int(1,100)
		if rand >= 50 then
			-- recognize
			achilles_greatest_remove_target(family_member_cqi, "troy_achilles_fm_opponent_defeat_recognized", nil, "troy_fm_achilles_demand_recognition_success")
			achilles_greatest_update_ui()
		else 
			-- friendly duel
			achilles_friendly_duel_target = family_member_cqi
			cm:trigger_dilemma(achilles_faction, achilles_friendly_duel_dilemma_key)
			achilles_greatest_update_ui()
		end
	elseif eval == 6 then
		-- recognize
		achilles_greatest_remove_target(family_member_cqi, "troy_achilles_fm_opponent_defeat_recognized", nil, "troy_fm_achilles_demand_recognition_success")
		achilles_greatest_update_ui()
	end
end

function achilles_greatest_opponent_eval(family_member)
	local achilles_faction_obj = cm:model():world():faction_by_key(achilles_faction)
	local char_rank = family_member:character():rank()
	local achilles_rank = achilles_faction_obj:faction_leader():rank()
	local is_ally = achilles_faction_obj:allied_with(family_member:character():faction())
	--special care for select named characters
	for k,v in pairs(named_characters_eval) do
		if family_member:is_alive() then
			if family_member:get_forename() == v.forename and (v.surname and v.surname == family_member:get_surname() or true) then
				return v.val
			end
		end
	end
	--and back to regular target evaluation
	if (not is_ally) and (char_rank > achilles_rank + 4) then
		return 1 -- Stronger, not allied
	elseif (not is_ally) and (char_rank >= achilles_rank) then
		return 2 -- Equal, not allied
	elseif (not is_ally) and (char_rank < achilles_rank) then
		return 3 -- Weaker, not allied
	elseif is_ally and (char_rank > achilles_rank + 4) then
		return 4 -- Stronger, allied
	elseif is_ally and (char_rank >= achilles_rank) then
		return 5 -- Equal, allied
	elseif is_ally and (char_rank < achilles_rank) then
		return 6 -- Weaker, allied
	end
end

function achilles_greatest_has_any_target()
	return #ACHILLES_GREATEST_WARRIOR.targets > 0
end

function achilles_greatest_update_bundle()
	if achilles_greatest_has_any_target() then
		cm:remove_effect_bundle(ACHILLES_GREATEST_WARRIOR_GREATEST_BUNDLE, achilles_faction)
		cm:apply_effect_bundle(ACHILLES_GREATEST_WARRIOR_NO_GREATEST_BUNDLE, achilles_faction, 0)
	else
		out("WE ARE GIVING LOYALTY YO")
		cm:faction_apply_character_loyalty_change(achilles_faction, "", achilles_when_greatest_loyalty_amount)
		cm:remove_effect_bundle(ACHILLES_GREATEST_WARRIOR_NO_GREATEST_BUNDLE, achilles_faction)
		cm:apply_effect_bundle(ACHILLES_GREATEST_WARRIOR_GREATEST_BUNDLE, achilles_faction, 0)
		local faction = cm:get_faction("troy_main_dan_achilles")
		for k,v in pairs(achilles_greatest_rewards_table[achilles_greatest_reward_num]) do
			if achilles_greatest_unit_caps[k] == nil then
				cm:add_unit_to_faction_mercenary_pool(faction, k, v, 100, v, 0, 0, "", "", "")
				achilles_greatest_unit_caps[k] = v
			else
				cm:add_unit_to_faction_mercenary_pool(faction, k, v, 100, (achilles_greatest_unit_caps[k] + v), 0, 0, "", "", "")
				achilles_greatest_unit_caps[k] = achilles_greatest_unit_caps[k] + v
			end
		end
		if achilles_greatest_reward_num < #achilles_greatest_rewards_table then
			achilles_greatest_reward_num = achilles_greatest_reward_num + 1
		end
	end
end

-- make sure that this is called in model side
function achilles_greatest_remove_target(family_member_cqi, removing_descr_key, optional_region_cqi, incident_to_trigger)

	for i = 1, #ACHILLES_GREATEST_WARRIOR.targets do
		if ACHILLES_GREATEST_WARRIOR.targets[i].cqi == family_member_cqi then
			
			table.remove(ACHILLES_GREATEST_WARRIOR.targets, i)
			table.insert(ACHILLES_GREATEST_WARRIOR.resolved_targets, { cqi = family_member_cqi, removing_descr_key = removing_descr_key or "", optional_region_cqi = optional_region_cqi or 0})

			achilles_greatest_update_bundle()

			if #ACHILLES_GREATEST_WARRIOR.targets == 0 then
				cm:trigger_incident(achilles_faction, "troy_fm_achilles_all_challengers_defeated", true)

				-- trigger event for early-game mission scripts
				core:trigger_event("ScriptEventAchillesBecomesGreatestWarrior")
			elseif incident_to_trigger and incident_to_trigger ~= "" then
				cm:trigger_incident(achilles_faction, incident_to_trigger, true)
			end

			return true
		end
	end

	return false
end

function achilles_greatest_had_been_target(family_member_cqi)
	for _, v in pairs(ACHILLES_GREATEST_WARRIOR.resolved_targets) do
		if v.cqi == family_member_cqi then
			return true
		end
	end
	return false
end

function achilles_greatest_is_target(family_member_cqi)
	return achilles_greatest_get_target(family_member_cqi) and true or false
end

function achilles_greatest_get_target(family_member_cqi)
	for _, v in pairs(ACHILLES_GREATEST_WARRIOR.targets) do
		if v.cqi == family_member_cqi then
			return v
		end
	end
end

function achilles_greatest_add_target(family_member_cqi)
	if not achilles_greatest_is_target(family_member_cqi) then
		local target = {
			cqi = family_member_cqi,
			can_demand_recognition = true
		}
		table.insert(ACHILLES_GREATEST_WARRIOR.targets, target)
	end
end

function AchillesGreatest_StartPosSetup()
	out("AchillesGreatest_StartPosSetup()")
	ACHILLES_GREATEST_WARRIOR.targets = {}
	ACHILLES_GREATEST_WARRIOR.resolved_targets = {}
	ACHILLES_GREATEST_WARRIOR.pick_targets_cooldown = 12
	if not cm:model():character_for_command_queue_index(57):is_null_interface() then
		achilles_greatest_add_target(cm:model():character_for_command_queue_index(57):family_member():command_queue_index())
	end
	if not cm:model():character_for_command_queue_index(71):is_null_interface()  then
		achilles_greatest_add_target(cm:model():character_for_command_queue_index(71):family_member():command_queue_index())
	end
	if not cm:model():character_for_command_queue_index(72):is_null_interface()  then
		achilles_greatest_add_target(cm:model():character_for_command_queue_index(72):family_member():command_queue_index())
	end
end

function achilles_greatest_on_demand_recognition_click(family_member_cqi)
	achilles_greatest_set_can_demand_recognition(family_member_cqi, false)
	achilles_greatest_update_ui()
	ccq_achilles_greatest_resolve_demanded_recognition(family_member_cqi)
end

function achilles_greatest_update_ui()
	local panel = find_uicomponent(core:get_ui_root(), "fm_achilles_greatestwarrior")
	if panel and panel:Visible() then
		panel:InterfaceFunction("set_targets", ACHILLES_GREATEST_WARRIOR.targets)
		panel:InterfaceFunction("set_resolved_targets", ACHILLES_GREATEST_WARRIOR.resolved_targets)

		panel:InterfaceFunction("set_active_effect_bundle", ACHILLES_GREATEST_WARRIOR_GREATEST_BUNDLE, ACHILLES_GREATEST_WARRIOR_NO_GREATEST_BUNDLE)

		local unresolved_targets = panel:SequentialFind("undefeated_warriors_listview")
		for _, target in ipairs(ACHILLES_GREATEST_WARRIOR.targets) do
			local warrior = unresolved_targets:SequentialFind("warrior_" .. target.cqi)

			if warrior then
				local fm = cm:model():family_member_for_command_queue_index(target.cqi)
				local eval = achilles_greatest_opponent_eval(fm)
				local eval_string_key = achilles_oponent_eval_strings[eval]

				warrior:SequentialFind("flavour_text"):SetStateText(common.get_localised_string(eval_string_key), eval_string_key)
			end
		end	
	end
end

function achilles_greatest_component_lclickup(context)
	local uic = UIComponent(context.component)

	if uic:Id() == "btn_demand_recognition" then
		if uicomponent_descended_from(uic, "fm_achilles_greatestwarrior") then
			--we have press notification for some of the "btn_demand_recognition" buttons from "fm_achilles_greatestwarrior"
			local family_member_cqi_as_string = uic:GetProperty("fm_cqi")
			if family_member_cqi_as_string then
				local fm_cqi_as_number = tonumber(family_member_cqi_as_string)
				achilles_greatest_on_demand_recognition_click(fm_cqi_as_number)
			end
		end
	end
end

function achilles_greatest_friendly_duel_result()
	for i = #achilles_turns_to_trigger_incident, 1, -1 do 
		if achilles_turns_to_trigger_incident[i].turn == cm:turn_number() then
			-- remove duel target
			if achilles_turns_to_trigger_incident[i].family_member_cqi then
				achilles_greatest_remove_target(achilles_turns_to_trigger_incident[i].family_member_cqi, "troy_achilles_fm_opponent_defeat_duel")
			end
			
			local mood = achilles_turns_to_trigger_incident[i].mood_to_change
			local value = achilles_turns_to_trigger_incident[i].mood_value_change
			increase_achilles_mood_value(mood, value, "greatest_warrior_duel_result")
			cm:trigger_incident(achilles_faction,achilles_turns_to_trigger_incident[i].incident_to_trigger,true)

			table.remove(achilles_turns_to_trigger_incident, i)
		end
	end
end

function achilles_greatest_update_targets_choosing(faction)
	if faction:name() ~= achilles_faction then 
		return
	end

	local should_pick_targets = false

	if not achilles_greatest_has_any_target() then
		ACHILLES_GREATEST_WARRIOR.pick_targets_cooldown = ACHILLES_GREATEST_WARRIOR.pick_targets_cooldown - 1
		if ACHILLES_GREATEST_WARRIOR.pick_targets_cooldown <= 0 then
			should_pick_targets = true
			ACHILLES_GREATEST_WARRIOR.pick_targets_cooldown = 0
		end

		-- incident 1 turn before pick
		if ACHILLES_GREATEST_WARRIOR.pick_targets_cooldown == 1 then
			cm:trigger_incident(achilles_faction, "troy_fm_achilles_challengers_will_appear", true)
		end
	end

	-- if need to pick new set of targets
	if should_pick_targets then

		-- finding adjacent faction

		local unique_factions_list = {
			--[faction_key] = true
		}

		local tgts = {}

		-- regions of achilles
		local region_list = faction:region_list()
		
		for i = 0, region_list:num_items() - 1 do
			
			-- adjacent regions of current region
			local adjacent_region_list = region_list:item_at(i):adjacent_region_list()
			
			for j = 0, adjacent_region_list:num_items() - 1 do
				
				-- get faction of current adjacent region
				local adjacent_faction = adjacent_region_list:item_at(j):owning_faction()

				-- is faction eligible for taget selection
				if not adjacent_faction:is_null_interface() and adjacent_faction:name() ~= faction:name() then
					-- if not already processed process it
					if not unique_factions_list[adjacent_faction:name()] then
						-- mark as processed
						unique_factions_list[adjacent_faction:name()] = true

						--push character cqi-s
						local char_list = adjacent_faction:character_list()
						for c = 0, char_list:num_items() - 1 do
							local chr = char_list:item_at(c)
							if chr:has_military_force() and not achilles_greatest_had_been_target(chr:family_member():command_queue_index()) then
								local tgt = {
									cqi = chr:family_member():command_queue_index(),
									rank = chr:rank()
								}
								table.insert(tgts, tgt)
							end
						end
					end
				end
			end
		end

		-- ok
		-- now we have all neighboring faction generals family members cqi's and ranks in tgts, and we need to sort them

		table.sort(tgts, function(a, b) return b.rank < a.rank end)

		
		-- filter targets
		if #tgts > ACHILLES_GREATEST_WARRIOR_MAX_TARGETS then
			local min_rank = tgts[ACHILLES_GREATEST_WARRIOR_MAX_TARGETS].rank
			-- remove targets with lower ranks than first ACHILLES_GREATEST_WARRIOR_MAX_TARGETS characters
			while tgts[#tgts].rank < min_rank do
				table.remove(tgts)
			end
		end


		-- add the targets
		if #tgts > ACHILLES_GREATEST_WARRIOR_MAX_TARGETS then
			local min_rank = tgts[ACHILLES_GREATEST_WARRIOR_MAX_TARGETS].rank
			local picked = 0
			
			-- put high ranked characters
			local characters_for_random_pick = {}
			for k, v in ipairs(tgts) do
				if v.rank > min_rank then
					-- put high ranked character
					achilles_greatest_add_target(v.cqi)
					picked = picked + 1
				else
					-- mark for random pick
					table.insert(characters_for_random_pick, v)
				end
			end

			--random pick from low ranked characters
			while picked < ACHILLES_GREATEST_WARRIOR_MAX_TARGETS do
				local rand = cm:model():random_int(1, #characters_for_random_pick)
				-- put random picked character
				achilles_greatest_add_target(characters_for_random_pick[rand].cqi)
				table.remove(characters_for_random_pick, rand)
				picked = picked + 1
			end
		else
			for k, v in ipairs(tgts) do
				achilles_greatest_add_target(v.cqi)
			end
		end

		if achilles_greatest_has_any_target() then
			ACHILLES_GREATEST_WARRIOR.pick_targets_cooldown = ACHILLES_GREATEST_WARRIOR_PICK_TARGETS_COOLDOWN
			achilles_greatest_update_bundle()

			-- incident for picking targets
			cm:trigger_incident(achilles_faction, "troy_fm_achilles_challengers_have_appeared", true)
		end
	end
end


function achilles_greatest_faction_turn_start(context)
	achilles_greatest_friendly_duel_result()
	achilles_greatest_update_targets_choosing(context:faction())
end

-- triggers and listeners
function achilles_greatest_add_listeners()
	out("AchillesGreatest_AddListeners()")

	-- panel opened
	core:add_listener (
		"AchillesGreatest_PanelOpenedCampaign",
		"PanelOpenedCampaign",
		function(context) return context.string == "fm_achilles_greatestwarrior" end,
		function(context)
			core:add_listener(
				"achilles_greatest_component_lclickup",
				"ComponentLClickUp", 
				true,
				function(context) achilles_greatest_component_lclickup(context) end, 
				true
			)

			achilles_greatest_update_ui()
		end,
		true
	)

	-- panel closed
	core:add_listener(
		"AchillesGreatest_PanelClosedCampaign",
		"PanelClosedCampaign",
		function(context) return context.string == "fm_achilles_greatestwarrior" end,
		function(context)
			core:remove_listener("achilles_greatest_component_lclickup")
		end,
		true
	)

	-- making demand recognition in model
	core:add_listener(
		"ccq_achilles_greatest_resolve_demanded_recognition",
		"UITriggerScriptEvent",
		function(context) 
			return string.find(context:trigger(), "AchillesGreatest_ResolveDemandedRecognition_") ~= nil
		end,
		function(context)
			local s,e = string.find(context:trigger(), "AchillesGreatest_ResolveDemandedRecognition_")
			local family_member_cqi_as_string = string.sub(context:trigger(), e + 1)
			local family_member_cqi = tonumber(family_member_cqi_as_string)
			achilles_greatest_resolve_demanded_recognition(family_member_cqi)
			achilles_greatest_update_ui()
		end,
		true
	)

	core:add_listener(
		"AchillesGreatest_Friendly_Duel_Dilemma_Choice_Made",
		"DilemmaChoiceMadeEvent",
		function(context) return context:dilemma() == achilles_friendly_duel_dilemma_key end,
		function(context)
			
			if context:choice() == 0 then

				--do the wounding here etc

				local faction_leader = cm:model():world():faction_by_key(achilles_faction):faction_leader():command_queue_index()
				local char_str = cm:char_lookup_str(faction_leader)
				cm:send_character_to_duel(char_str,2)

				if achilles_friendly_duel_target ~= 0 then
					achilles_greatest_set_can_demand_recognition(achilles_friendly_duel_target, false)
					cm:trigger_incident(achilles_faction, "troy_fm_achilles_gone_off_dueling", true)
					--achilles_greatest_remove_target(achilles_friendly_duel_target, "troy_achilles_fm_opponent_defeat_duel", nil, "troy_fm_achilles_gone_off_dueling")
				end

				local rand = cm:model():random_int(1,100)

				-- decide the outcome of the duel

				if rand < 25 then
					local entry = {
						turn = cm:turn_number() + achilles_turns_to_resolve_friendly_duel,
						mood_to_change = "enraged",
						mood_value_change = 10,
						incident_to_trigger = "troy_fm_achilles_duel_result_enraged",
						family_member_cqi = achilles_friendly_duel_target
					}
					table.insert(achilles_turns_to_trigger_incident, #achilles_turns_to_trigger_incident+1, entry)
				elseif rand >= 25 and rand < 50 then 
					local entry = {
						turn = cm:turn_number() + achilles_turns_to_resolve_friendly_duel,
						mood_to_change = "insulted",
						mood_value_change = 10,
						incident_to_trigger = "troy_fm_achilles_duel_result_insulted",
						family_member_cqi = achilles_friendly_duel_target
					}
					table.insert(achilles_turns_to_trigger_incident, #achilles_turns_to_trigger_incident+1, entry)
				elseif rand >= 50 and rand < 75	then 
					local entry = {
						turn = cm:turn_number() + achilles_turns_to_resolve_friendly_duel,
						mood_to_change = "depressed",
						mood_value_change = 10,
						incident_to_trigger = "troy_fm_achilles_duel_result_depressed",
						family_member_cqi = achilles_friendly_duel_target
					}
					table.insert(achilles_turns_to_trigger_incident, #achilles_turns_to_trigger_incident+1, entry)
				elseif rand >= 75 then
					local entry = {
						turn = cm:turn_number() + achilles_turns_to_resolve_friendly_duel,
						mood_to_change = "",
						mood_value_change = 0,
						incident_to_trigger = "troy_fm_achilles_duel_result_calm",
						family_member_cqi = achilles_friendly_duel_target
					}
					table.insert(achilles_turns_to_trigger_incident, #achilles_turns_to_trigger_incident+1, entry)
				end
			elseif context:choice() == 1 then
				if achilles_friendly_duel_target ~= 0 then
					achilles_greatest_set_can_demand_recognition(achilles_friendly_duel_target, false)
				end
				increase_achilles_mood_value("insulted", 10, "greatest_warrior_duel_refused")
			end

			achilles_friendly_duel_target = 0
		end,
		true
	)

	core:add_listener(
		"achilles_greatest_faction_turn_start",
		"FactionTurnStart",
		function(context) return context:faction():name() == achilles_faction end,
		achilles_greatest_faction_turn_start,
		true
	)

	-- remove from targets list on character die or faction die
	core:add_listener(
		"AchillesGreatest_FactionCharacterDiedOrWounded",
		"FactionCharacterDiedOrWounded",
		function(context)
			if not context:family_member():is_alive() or context:faction():is_dead() then
				return achilles_greatest_is_target(context:family_member():command_queue_index())
			end
			return false
		end,
		function(context)
			achilles_greatest_remove_target(context:family_member():command_queue_index(), "troy_achilles_fm_opponent_defeat_other", nil, "troy_fm_achilles_challenger_perished")
		end,
		true
	)

	-- remove from targets list if they are confederated
	core:add_listener(
		"AchillesGreatest_Confederation",
		"FactionJoinsConfederation",
		function(context)
			return context:confederation():name() == "troy_main_dan_achilles"
		end,
		function(context)
			local char_list = context:confederation():character_list()
			for i = 0, char_list:num_items() - 1 do
				local char = char_list:item_at(i)
				local char_cqi = char:family_member():command_queue_index()
				if char:character_type("general") and achilles_greatest_is_target(char_cqi) then
					achilles_greatest_remove_target(char_cqi, "troy_achilles_fm_opponent_confederated", nil, "troy_fm_achilles_demand_recognition_success")
				end
			end
		end,
		true
	)

	-- general from achilles faction won a battle
	core:add_listener (
		"AchillesGreatest_CharacterCompletedBattle",
		"CharacterCompletedBattle",
		function(context) 
			return context:character():character_subtype(achilles_subtype) and context:character():won_battle()
		end,
		function(context)
			local enemy_fm_cqis = cm:pending_battle_cache_get_enemies_of_char(context:character())
				
			for i=1, #enemy_fm_cqis do
				if achilles_greatest_is_target(enemy_fm_cqis[i]) then
					local optional_region_cqi = nil
					local enemy_fm = cm:get_family_member_by_cqi(enemy_fm_cqis[i])

					if enemy_fm and enemy_fm:is_alive() then
						local enemy_character = enemy_fm:character()
						if is_character(enemy_character) and enemy_character:has_region() then
							optional_region_cqi = enemy_character:region():command_queue_index()
						end
					end
					achilles_greatest_remove_target(enemy_fm_cqis[i], "troy_achilles_fm_opponent_defeat_battle", optional_region_cqi, "troy_fm_achilles_challenger_defeated")
				end
			end
			
		end,
		true
	)

	-- general from achilles faction won a battle
	core:add_listener (
		"AchillesGreatest_CharacterCompletedBattle_AsSecondaryGeneral",
		"CharacterParticipatedAsSecondaryGeneralInBattle",
		function(context) 
			return context:character():character_subtype(achilles_subtype) and context:character():won_battle()
		end,
		function(context)
			local enemy_fm_cqis = cm:pending_battle_cache_get_enemies_of_char(context:character())
				
			for i=1, #enemy_fm_cqis do
				if achilles_greatest_is_target(enemy_fm_cqis[i]) then
					local optional_region_cqi = nil
					local enemy_fm = cm:get_family_member_by_cqi(enemy_fm_cqis[i])

					if enemy_fm and enemy_fm:is_alive() then
						local enemy_character = enemy_fm:character()
						if is_character(enemy_character) and enemy_character:has_region() then
							optional_region_cqi = enemy_character:region():command_queue_index()
						end
					end
					achilles_greatest_remove_target(enemy_fm_cqis[i], "troy_achilles_fm_opponent_defeat_battle", optional_region_cqi, "troy_fm_achilles_challenger_defeated")
				end
			end			

		end,
		true
	)
end

--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------

cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("ACHILLES_GREATEST_WARRIOR",ACHILLES_GREATEST_WARRIOR,context)
		cm:save_named_value("ACHILLES_GREATEST_INCIDENT_TURNS",achilles_turns_to_trigger_incident,context)
		cm:save_named_value("achilles_greatest_unit_caps",achilles_greatest_unit_caps,context)
		cm:save_named_value("achilles_greatest_reward_num",achilles_greatest_reward_num,context)
		
	end
)

cm:add_loading_game_callback(
	function(context)
		ACHILLES_GREATEST_WARRIOR = cm:load_named_value("ACHILLES_GREATEST_WARRIOR",ACHILLES_GREATEST_WARRIOR,context)
		achilles_turns_to_trigger_incident = cm:load_named_value("ACHILLES_GREATEST_INCIDENT_TURNS",achilles_turns_to_trigger_incident,context)
		achilles_greatest_unit_caps = cm:load_named_value("achilles_greatest_unit_caps",achilles_greatest_unit_caps,context)
		achilles_greatest_reward_num = cm:load_named_value("achilles_greatest_reward_num",achilles_greatest_reward_num,context)
	end
)