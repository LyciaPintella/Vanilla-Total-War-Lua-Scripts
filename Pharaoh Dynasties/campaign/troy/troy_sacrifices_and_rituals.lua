out("Loading troy_sacrifices_and_rituals.lua")

achilles_mood_depressed_ritual_bonus = 0.2
sarpedon_rare_idols_bonus = 0.2
paris_helen_prayer_action_bonus = 0.5
crit_success_skill_key = "troy_agent_priest_skill_critical_success_all_favour"
priest_repeat_skill_key = "troy_agent_priest_skill_action_rituals_own_favour_time_mod"
crit_sucess_skill_amount = 10
priest_success_any_lower_skill_key = "troy_agent_priest_skill_action_vs_enemy_agent_lowers_enemy_favour"
priest_success_any_lower_amount = -2
priest_unsuccessful_any_lower_skill_key = "troy_agent_priest_skill_unsuccessful_action_gives_favour_all"
priest_unsuccessful_any_lower_amount = 2
own_ritual_action_key = "troy_agent_action_record_ritual_own"
enemy_ritual_action_key = "troy_agent_action_record_ritual_enemy"
favour_lower_bound_settlement = 20
favour_critical_lower_bound_settlement = 25
favour_upper_bound_settlement = 20
favour_critical_upper_bound_settlement = 25
temple_level_3_bonus = 0
temple_level_5_bonus = 0
no_temple_random_god_favour_amount = 10
button_extra_option = ""
sacrifice_performed_ui = ""
sacrifice_good_omens = "effect_bundle_agent_priestess_target_sacrifice_good_omens_01"
sacrifice_chance = 50
sacrifice_bad_omens = "effect_bundle_agent_priestess_target_sacrifice_bad_omens_01" 
sacrifice_cost = {
	troy_food = {
		amount = 130,
		icon = "icon_food"
	},
}
-- START ALEX G.
favour_per_turn_from_skills = { 
	--Fervour
	--[[
	{
		key = "troy_agent_priest_skill_action_passive_divine_protection_athena_cost_main_cities",
		god = "troy_god_attitude_athena",
		amount = 2
	},
	{
		key = "troy_agent_priest_skill_spec_action_passive_divine_protection_ares_damage",
		god = "troy_god_attitude_ares",
		amount = 2
	},
	{
		key = "troy_agent_priest_skill_spec_action_passive_divine_protection_apollo_rank_priest",
		god = "troy_god_attitude_apollo",
		amount = 2
	},
	{
		key = "troy_agent_priest_skill_spec_action_passive_divine_protection_zeus_armour",
		god = "troy_god_attitude_zeus",
		amount = 2
	},
	{
		key = "troy_agent_priest_skill_spec_action_passive_divine_protection_hera_food",
		god = "troy_god_attitude_hera",
		amount = 2
	},
	{
		key = "troy_agent_priest_skill_spec_action_passive_divine_protection_aphrodite_happiness",
		god = "troy_god_attitude_aphrodite",
		amount = 2
	},
	{
		key = "troy_agent_priest_skill_spec_action_passive_divine_protection_poseidon_naval_movement",
		god = "troy_god_attitude_poseidon",
		amount = 2
	},
	
	--Slander
	
	{
		key = "troy_agent_priest_skill_spec_action_passive_divine_protection_ares_up_athena_down",
		god = "troy_god_attitude_ares",
		amount = 4
	},
	{
		key = "troy_agent_priest_skill_spec_action_passive_divine_protection_ares_up_athena_down",
		god = "troy_god_attitude_athena",
		amount = -2 
	},
	{
		key = "troy_agent_priest_skill_spec_action_passive_divine_protection_athena_up_ares_down",
		god = "troy_god_attitude_ares",
		amount = -2
	},	
	{
		key = "troy_agent_priest_skill_spec_action_passive_divine_protection_athena_up_ares_down",
		god = "troy_god_attitude_athena",
		amount = 4 
	},
	
	-- Dear Rado, the Second Specialisation for Apollo shall give him 50% chance of recieving 4 favour each turn
	-- the skill is: troy_agent_priest_skill_action_passive_divine_protection_apollo_up_chance

	{
		key = "troy_agent_priest_skill_spec_action_passive_divine_protection_zeus_up_hera_down",
		god = "troy_god_attitude_zeus",
		amount = 4
	},
	{
		key = "troy_agent_priest_skill_spec_action_passive_divine_protection_zeus_up_hera_down",
		god = "troy_god_attitude_hera",
		amount = -2 
	},
	{
		key = "troy_agent_priest_skill_spec_action_passive_divine_protection_hera_up_zeus_down",
		god = "troy_god_attitude_zeus",
		amount = -2
	},
	{
		key = "troy_agent_priest_skill_spec_action_passive_divine_protection_hera_up_zeus_down",
		god = "troy_god_attitude_hera",
		amount = 4 
	},
	{
		key = "troy_agent_priest_skill_spec_action_passive_divine_protection_aphrodite_up_poseidon_down",
		god = "troy_god_attitude_aphrodite",
		amount = 4
	},
	{
		key = "troy_agent_priest_skill_spec_action_passive_divine_protection_aphrodite_up_poseidon_down",
		god = "troy_god_attitude_poseidon",
		amount = -2 
	},
	{
		key = "troy_agent_priest_skill_spec_action_passive_divine_protection_poseidon_up_aphrodite_down",
		god = "troy_god_attitude_aphrodite",
		amount = -2
	},
	{
		key = "troy_agent_priest_skill_spec_action_passive_divine_protection_poseidon_up_aphrodite_down",
		god = "troy_god_attitude_poseidon",
		amount = 4 
	}
	--]]	
}

good_omens_mods = {
	troy_agent_priest_skill_spec_action_sacrifice_good_omen_morale = {
		effect = "troy_effect_army_effect_morale_mod",
		value = 5
	},
	troy_agent_priest_skill_spec_action_sacrifice_good_omen_melee_attack = {
		effect = "troy_effect_army_effect_morale_mod",
		value = 10
	},
	troy_agent_priest_skill_spec_action_sacrifice_good_omen_missile_damage = {
		effect = "troy_effect_army_missile_damage_mod",
		value = 10
	},
	troy_agent_priest_skill_spec_action_sacrifice_bad_omen_morale = {
		effect = "troy_effect_army_melee_defence_mod_all",
		value = 10
	},
	troy_agent_priest_skill_spec_action_sacrifice_good_omen_melee_defence = {
		effect = "troy_effect_army_melee_defence_mod_all",
		value = 15
	},
	troy_agent_priest_skill_spec_action_sacrifice_bad_omen_missile_damage = {
		effect = "troy_effect_army_melee_attack_mod_all",
		value = 10
	},
	troy_agent_priest_skill_spec_action_sacrifice_bad_omen_melee_defence = {
		effect = "troy_effect_army_melee_attack_mod_all",
		value = 10
	},
	troy_agent_priest_skill_action_sacrifice_chance_good_omen_mod_2 = {
		effect = "troy_effect_army_effect_morale_mod",
		value = 10
	}
}
bad_omens_mod = {
	troy_agent_priest_skill_action_sacrifice_bad_omen_morale = {
		effect = "troy_effect_army_effect_morale_mod",
		value = 10
	},
	troy_agent_priest_skill_action_sacrifice_bad_omen_missile_damage = {
		effect = "troy_effect_army_missile_damage_mod",
		value = 10
	},
	troy_agent_priest_skill_action_sacrifice_bad_omen_melee_defence = {
		effect = "troy_effect_army_melee_defence_mod_all",
		value = 10
	},
	troy_agent_priest_skill_action_sacrifice_bad_omen_melee_attack = {
		effect = "troy_effect_army_melee_attack_mod_all",
		value = 10
	}
}

skills_to_values = {
	[1] = {
		skill_key = "troy_agent_priest_skill_campaign_movement_range_1",
		bonus = 0.1,
		apply_for_ours = true,
		god = "troy_god_attitude_aphrodite"
	},
	[2] = {
		skill_key = "troy_agent_priest_skill_action_sacrifice_bad_omen_melee_attack",
		bonus = 0.1,
		apply_for_ours = true,
		god = "troy_god_attitude_apollo"
	},
	[3] = {
		skill_key = "troy_agent_priest_skill_action_passive_divine_protection_mod_5",
		bonus = 0.1,
		apply_for_ours = true,
		god = "troy_god_attitude_poseidon"
	},
	[4] = {
		skill_key = "troy_agent_priest_skill_action_passive_divine_protection_mod_3",
		bonus = 0.1,
		apply_for_ours = true,
		god = "troy_god_attitude_zeus"
	},
	[5] = {
		skill_key = "troy_agent_priest_skill_action_passive_divine_protection_mod_2",
		bonus = 0.1,
		apply_for_ours = true,
		god = "troy_god_attitude_hera"
	},
	[6] = {
		skill_key = "troy_agent_priest_skill_action_passive_divine_protection_mod_1",
		bonus = 0.1,
		apply_for_ours = true,
		god = "troy_god_attitude_ares"
	},
	[7] = {
		skill_key = "troy_agent_priest_skill_action_passive_divine_protection_mod",
		bonus = 0.1,
		apply_for_ours = true,
		god = "troy_god_attitude_athena"
	},
	[8] = {
		skill_key = "troy_agent_priest_skill_spec_action_passive_divine_protection_aphrodite_happiness",
		bonus = 0.2,
		apply_for_ours = true,
		god = "troy_god_attitude_aphrodite"
	},
	[9] = {
		skill_key = "troy_agent_priest_skill_spec_action_passive_divine_protection_apollo_rank_priest",
		bonus = 0.2,
		apply_for_ours = true,
		god = "troy_god_attitude_apollo"
	},
	[10] = {
		skill_key = "troy_agent_priest_skill_spec_action_passive_divine_protection_poseidon_naval_movement",
		bonus = 0.2,
		apply_for_ours = true,
		god = "troy_god_attitude_poseidon"
	},
	[11] = {
		skill_key = "troy_agent_priest_skill_spec_action_passive_divine_protection_zeus_armour",
		bonus = 0.2,
		apply_for_ours = true,
		god = "troy_god_attitude_zeus"
	},
	[12] = {
		skill_key = "troy_agent_priest_skill_spec_action_passive_divine_protection_hera_food",
		bonus = 0.2,
		apply_for_ours = true,
		god = "troy_god_attitude_hera"
	},
	[13] = {
		skill_key = "troy_agent_priest_skill_spec_action_passive_divine_protection_ares_damage",
		bonus = 0.2,
		apply_for_ours = true,
		god = "troy_god_attitude_ares"
	},
	[14] = {
		skill_key = "troy_agent_priest_skill_spec_action_passive_divine_protection_athena_cost_main_cities",
		bonus = 0.2,
		apply_for_ours = true,
		god = "troy_god_attitude_athena"
	},
	[15] = {
		skill_key = "troy_agent_priest_skill_action_rituals_success_rate_mod",
		bonus = 0.10,
		apply_for_ours = true,
		god = "any"
	},
	[16] = {
		skill_key = "troy_agent_priest_skill_spec_action_rituals_enemy_favour_mod",
		bonus = 0.2,
		apply_for_ours = true,
		god = "any"
	},
	[17] = {
		skill_key = "troy_agent_priest_skill_action_rituals_success_rate_mod_2",
		bonus = 0.1,
		apply_for_ours = true,
		god = "troy_god_attitude_artemis"
	},
	[18] = {
		skill_key = "troy_agent_priest_skill_spec_action_rituals_own_favour_mod_cost_temples",
		bonus = 0.2,
		apply_for_ours = true,
		god = "any"
	},
	[19] = {
		skill_key = "troy_agent_priest_skill_actions_divine_wrath_success_chance_mod_3",
		bonus = 0.3,
		apply_for_ours = true,
		god = "any"
	},
	[20] = {
		skill_key = "troy_agent_priest_skill_spec_actions_successful_enemy_army_retreat_charge_bonus",
		bonus = 0.15,
		apply_for_ours = false,
		god = "any"
	},
	[21] = {
		skill_key = "troy_agent_priest_skill_spec_actions_successful_enemy_army_attrition",
		bonus = 0.15,
		apply_for_ours = false,
		god = "any"
	},
	[22] = {
		skill_key = "troy_agent_horde_priest_skill_action_rituals_success_rate_mod",
		bonus = 0.10,
		apply_for_ours = false,
		god = "any"
	},
	[23] = {
		skill_key = "troy_agent_horde_priest_skill_actions_divine_wrath_success_chance_mod_3",
		bonus = 0.25,
		apply_for_ours = false,
		god = "any"
	},
	[24] = {
		skill_key = "troy_agent_horde_priest_skill_spec_action_rituals_enemy_favour_mod",
		bonus = 0.1,
		apply_for_ours = false,
		god = "any"
	},
	[25] = {
		skill_key = "troy_agent_horde_priest_skill_spec_action_rituals_own_favour_mod_cost_temples",
		bonus = 0.2,
		apply_for_ours = false,
		god = "any"
	},
	[26] = {
		skill_key = "troy_agent_horde_priest_skill_campaign_movement_range_1",
		bonus = 0.1,
		apply_for_ours = false,
		god = "troy_god_attitude_aphrodite"
	},
	[27] = {
		skill_key = "troy_agent_horde_priest_skill_spec_action_passive_divine_protection_aphrodite_happiness",
		bonus = 0.2,
		apply_for_ours = false,
		god = "troy_god_attitude_aphrodite"
	},
	[28] = {
		skill_key = "troy_agent_horde_priest_skill_action_sacrifice_bad_omen_melee_attack",
		bonus = 0.1,
		apply_for_ours = false,
		god = "troy_god_attitude_apollo"
	},
	[29] = {
		skill_key = "troy_agent_horde_priest_skill_action_passive_divine_protection_mod_5",
		bonus = 0.1,
		apply_for_ours = false,
		god = "troy_god_attitude_apollo"
	},
	[30] = {
		skill_key = "troy_agent_horde_priest_skill_action_passive_divine_protection_mod_3",
		bonus = 0.1,
		apply_for_ours = false,
		god = "troy_god_attitude_zeus"
	},
	[31] = {
		skill_key = "troy_agent_horde_priest_skill_action_passive_divine_protection_mod_2",
		bonus = 0.1,
		apply_for_ours = false,
		god = "troy_god_attitude_hera"
	},
	[32] = {
		skill_key = "troy_agent_horde_priest_skill_action_passive_divine_protection_mod_1",
		bonus = 0.1,
		apply_for_ours = false,
		god = "troy_god_attitude_ares"
	},
	[33] = {
		skill_key = "troy_agent_horde_priest_skill_action_passive_divine_protection_mod",
		bonus = 0.1,
		apply_for_ours = false,
		god = "troy_god_attitude_athena"
	},
	[34] = {
		skill_key = "troy_agent_horde_priest_skill_spec_action_passive_divine_protection_apollo_rank_priest",
		bonus = 0.2,
		apply_for_ours = false,
		god = "troy_god_attitude_apollo"
	},
	[35] = {
		skill_key = "troy_agent_horde_priest_skill_spec_action_passive_divine_protection_ares_damage",
		bonus = 0.2,
		apply_for_ours = false,
		god = "troy_god_attitude_ares"
	},
	[36] = {
		skill_key = "troy_agent_horde_priest_skill_spec_action_passive_divine_protection_athena_cost_main_cities",
		bonus = 0.2,
		apply_for_ours = false,
		god = "troy_god_attitude_athena"
	},
	[37] = {
		skill_key = "troy_agent_horde_priest_skill_spec_action_passive_divine_protection_hera_food",
		bonus = 0.2,
		apply_for_ours = false,
		god = "troy_god_attitude_hera"
	},
	[38] = {
		skill_key = "troy_agent_horde_priest_skill_spec_action_passive_divine_protection_poseidon_naval_movement",
		bonus = 0.2,
		apply_for_ours = false,
		god = "troy_god_attitude_poseidon"
	},
	[39] = {
		skill_key = "troy_agent_horde_priest_skill_spec_action_passive_divine_protection_zeus_armour",
		bonus = 0.2,
		apply_for_ours = false,
		god = "troy_god_attitude_zeus"
	},
	[40] = {
		skill_key = "troy_agent_horde_priest_skill_action_rituals_success_rate_mod_2",
		bonus = 0.1,
		apply_for_ours = false,
		god = "troy_god_attitude_artemis"
	},
	[41] = {
		skill_key = "troy_agent_horde_priest_skill_spec_action_failure_gives_movement",
		bonus = 0.2,
		apply_for_ours = false,
		god = "troy_god_attitude_artemis"
	},
	[42] = {
		skill_key = "troy_hep_agent_priest_skill_action_passive_divine_protection_mod_6",
		bonus = 0.1,
		apply_for_ours = true,
		god = "troy_god_attitude_hephaestus"
	},
	[43] = {
		skill_key = "troy_agent_horde_priest_skill_action_passive_divine_protection_mod_6",
		bonus = 0.1,
		apply_for_ours = false,
		god = "troy_god_attitude_hephaestus"
	},
	[44] = {
		skill_key = "troy_hep_agent_priest_skill_spec_action_passive_divine_protection_hephaestus",
		bonus = 0.2,
		apply_for_ours = true,
		god = "troy_god_attitude_hephaestus"
	},
	[45] = {
		skill_key = "troy_agent_horde_priest_skill_spec_action_passive_divine_protection_hephaestus",
		bonus = 0.2,
		apply_for_ours = false,
		god = "troy_god_attitude_hephaestus"
	}
}



omens_chance_mods = {
	troy_agent_priest_skill_action_sacrifice_chance_good_omen_mod = 10,
	troy_agent_priest_skill_action_sacrifice_chance_good_omen_mod_1 = 20
}


function add_sacrifices_and_rituals_listeners()
	out("Listener for Agents performing rituals and sacrifices started")
	
	core:add_listener (
		"Troy_agent_priest_start_of_turn",
		"CharacterTurnStart",
		function(context) 
		   return context:character():character_subtype("troy_agent_priest")
		end,
		function(context)
			local char = context:character()
			local faction = char:faction()
			for _,data in pairs(favour_per_turn_from_skills) do
				if char:has_skill(data.key) then
					apply_transaction_conflict_and_spawn_event(faction,data.god,gods_factors.agents,data.amount)
				end
			end
			local rnd = cm:model():random_int(1,2)
			if char:has_skill("troy_agent_priest_skill_spec_action_passive_divine_protection_apollo_up_chance") and rnd == 1 then 
				apply_transaction_conflict_and_spawn_event(faction,"troy_god_attitude_apollo",gods_factors.agents,4)
			end
		end,
		true
	)

	core:add_listener (
		"Troy_agent_ritual_performed",
		"CharacterGarrisonTargetAction",
		function(context) 
			return ((context:agent_action_key() == own_ritual_action_key) or (context:agent_action_key() == enemy_ritual_action_key))
					and (context:mission_result_success() or context:mission_result_critial_success())
		end,
		apply_ritual_for_faction,
		true
	)

	core:add_listener (
		"Troy_agent_priest_success_any_lower_enemy_favour",
		"CharacterCharacterTargetAction",
		function(context) 
			local char = context:character()
			return 	(context:mission_result_critial_success() or context:mission_result_success())
					and char:character_subtype("troy_agent_priest") 
					and char:has_skill(priest_success_any_lower_skill_key)
		end,
		function(context)
			local char_faction = context:target_character():faction()
			--local char_faction_name = char_faction:name()
			local gods = cm:model():world():god_manager():gods()
			for i=0,gods:num_items()-1 do
				local curr_god = gods:item_at(i)
				if not curr_god:is_null_interface() and char_faction:has_pooled_resource(curr_god:resource_key()) then
					local target = curr_god:resource_key()
					apply_transaction_conflict_and_spawn_event(char_faction,target,gods_factors.agents,priest_success_any_lower_amount)
				end 
			end
		end,
		true
	)

	core:add_listener (
		"Troy_agent_priest_not_success_any_",
		"CharacterCharacterTargetAction",
		function(context) 
			local char = context:character()
			return 	(context:mission_result_failure() or context:mission_result_critial_failure())
					and char:character_subtype("troy_agent_priest") 
					and char:has_skill(priest_unsuccessful_any_lower_skill_key)
		end,
		function(context)
			local char_faction = context:character():faction()
			--local char_faction_name = char_faction:name()
			local gods = cm:model():world():god_manager():gods()
			for i=0,gods:num_items()-1 do
				local curr_god = gods:item_at(i)
				if not curr_god:is_null_interface() and char_faction:has_pooled_resource(curr_god:resource_key()) then
					local target = curr_god:resource_key()
					apply_transaction_conflict_and_spawn_event(char_faction,target,gods_factors.agents,priest_unsuccessful_any_lower_amount)
				end 
			end
		end,
		true
	)
	
	core:add_listener (
		"Troy_agent_priest_critical_success_skill_mod_vs_c",
		"CharacterGarrisonTargetAction",
		function(context)
			local char = context:character()
			return context:mission_result_critial_success() and char:character_subtype("troy_agent_priest") and char:has_skill(crit_success_skill_key)
		end,
		function(context)
			local char_faction = context:character():faction()
			--local char_faction_name = char_faction:name()
			local gods = cm:model():world():god_manager():gods()
			for i=0,gods:num_items()-1 do
				local curr_god = gods:item_at(i)
				if not curr_god:is_null_interface() and char_faction:has_pooled_resource(curr_god:resource_key()) then
					local target = curr_god:resource_key()
					apply_transaction_conflict_and_spawn_event(char_faction,target,gods_factors.agents,crit_sucess_skill_amount)
				end 
			end
		end,
		true
	)

	core:add_listener (
		"Troy_agent_priest_critical_success_skill_mod_vs_gr",
		"CharacterCharacterTargetAction",
		function(context) 
			local char = context:character()
			return context:mission_result_critial_success() and char:character_subtype("troy_agent_priest") and char:has_skill(crit_success_skill_key)
		end,
		function(context)
			local char_faction = context:character():faction()
			--local char_faction_name = char_faction:name()
			local gods = cm:model():world():god_manager():gods()
			for i=0,gods:num_items()-1 do
				local curr_god = gods:item_at(i)
				if not curr_god:is_null_interface() and char_faction:has_pooled_resource(curr_god:resource_key()) then
					local target = curr_god:resource_key()
					apply_transaction_conflict_and_spawn_event(char_faction,target,gods_factors.agents,crit_sucess_skill_amount)
				end 
			end
		end,
		true
	)
	
	core:add_listener(
		"Troy_Agent_Sacrifice_Button_ComponentLClickUp",
		"ComponentLClickUp",
		function(context) return context.string == "button_extra_option" end,
		function(context)
			local faction_name = cm:get_local_faction_name(true)
			local faction = cm:model():world():faction_by_key(faction_name)
			
			local pb = cm:model():pending_battle()
			local human
			local human_string
			if pb:has_attacker() and pb:attacker():faction():is_human() and pb:attacker():faction() == faction then 
				human = pb:attacker()
				human_string = pb:attacker():faction():name()
			elseif pb:has_defender() and pb:defender():faction():is_human() and pb:defender():faction() == faction then
				human = pb:defender()
				human_string = pb:attacker():faction():name()
			else 
				script_error("ERROR: apply_sacrifice_negative_for_faction() failed to find the faction who clicked a sacrifice button in the pending battle. How is this possible?")
				return
			end
			local human_mf_char_list = human:military_force():character_list()
			local priest = nil
			for t=0, human_mf_char_list:num_items()-1 do
				if human_mf_char_list:item_at(t):character_subtype("troy_agent_priest") then
					priest = human_mf_char_list:item_at(t)
				end
			end

			if priest == nil then 
				script_error("ERROR: apply_sacrifice_negative_for_faction() failed to find a priest character in the military force. How is this possible?")
				return 
			end

			CampaignUI.TriggerCampaignScriptEvent(faction:command_queue_index(), "CCQ_Agent_Sacrifice_cqi_"..tostring(priest:command_queue_index()))
			
			local sacrifice_button = UIComponent(context.component)
			sacrifice_button:SetInteractive(false)
			sacrifice_button:SetDisabled(true)
			sacrifice_button:SetState("inactive")
		end,
		true
	)

	core:add_listener(
		"CCQ_Agent_Sacrifice_Listener",
		"UITriggerScriptEvent",
		function(context) 
			return string.find(context:trigger(), "CCQ_Agent_Sacrifice_cqi_") ~= nil
		end,
		function(context)
			local s,e = string.find(context:trigger(), "CCQ_Agent_Sacrifice_cqi_")
			local priest_cqi_as_string = string.sub(context:trigger(), e + 1)
			local priest_cqi = tonumber(priest_cqi_as_string)
			local priest = cm:get_character_by_cqi(priest_cqi)
			local faction_cqi = context:faction_cqi()
			local faction = cm:model():faction_for_command_queue_index(faction_cqi)
			local outcome = cm:model():random_int(1,100)
			local human_string = faction:name()
			local _sacrifice_chance = sacrifice_chance

			for key, value in pairs(omens_chance_mods) do
				if priest:has_skill(key) then 
					_sacrifice_chance = _sacrifice_chance + value
				end
			end

			if outcome < _sacrifice_chance then
				apply_sacrifice_for_faction(faction,true)
			else
				apply_sacrifice_for_faction(faction,false)
			end

			for resource_key , data in pairs(sacrifice_cost) do
				cm:faction_add_pooled_resource(human_string, resource_key , "troy_resource_factor_faction", data.amount * -1)
			end

		end,
		true
	)

	core:add_listener(
		"After_Battle_Sacrifice_Cleanup",
		"CharacterCompletedBattle",
		function(context) return context:character():faction():is_human() end,
		function(context)
			clean_up_sacrifice_bundles(context:character():faction())
		end,
		true
	)
	
	core:add_listener(
		"Troy_Agent_Sacrifice_Removal_Retreat_or_Dismiss",
		"UITriggerScriptEvent",
		function(context)
			return context:trigger() == "Sacrifice_retreat_or_dismiss" end,
		function(context)
			local faction_cqi = context:faction_cqi()
			local faction = cm:model():faction_for_command_queue_index(faction_cqi)
			clean_up_sacrifice_bundles(faction)
		end,
		true
	)

	core:add_listener(
		"Troy_Agent_Sacrifice_Removal_Retreat",
		"ComponentLClickUp",
		function(context) 
			return 	(context.string == "button_dismiss" or context.string == "button_retreat" or context.string == "button_surround" or context.string == "button_continue_siege")
		end,
		function(context)
			local faction = cm:model():world():faction_by_key(cm:get_local_faction_name(true))
			CampaignUI.TriggerCampaignScriptEvent(faction:command_queue_index(), "Sacrifice_retreat_or_dismiss")
		end,
		true
	)
	
	core:add_listener(
		"Troy_Agent_Sacrifice_Set_Tooltip",
		"PanelOpenedCampaign",
		function(context) 
			return context.string == "popup_pre_battle"
		end,
		function(context)
			local sacrifice_button
			if cm:model():pending_battle():seige_battle() then
				sacrifice_button = find_uicomponent(UIComponent(context.component),"button_set_siege","button_extra_option")
			else 
				sacrifice_button = find_uicomponent(UIComponent(context.component),"button_set_attack","button_extra_option")
			end
			local faction = cm:model():world():faction_by_key(cm:get_local_faction_name(true))
			local _sacrifice_chance = sacrifice_chance
			if sacrifice_button:Visible() then
				--Determine chance of success in order to display it in UI
				local pb = cm:model():pending_battle()
				local human
				if pb:has_attacker() and pb:attacker():faction():is_human() and pb:attacker():faction() == faction then 
					human = pb:attacker()
				elseif pb:has_defender() and pb:defender():faction():is_human() and pb:defender():faction() == faction then
					human = pb:defender()
				else 
					script_error("ERROR: apply_sacrifice_negative_for_faction() failed to find the faction who clicked a sacrifice button in the pending battle. How is this possible?")
					return
				end
				local human_mf_char_list = human:military_force():character_list()
				local priest = nil
				for t=0, human_mf_char_list:num_items()-1 do
					if human_mf_char_list:item_at(t):character_subtype("troy_agent_priest") then
						priest = human_mf_char_list:item_at(t)
					end
				end

				if priest == nil then 
					script_error("ERROR: apply_sacrifice_negative_for_faction() failed to find a priest character in the military force. How is this possible?")
					return 
				end

				for key, value in pairs(omens_chance_mods) do
					if priest:has_skill(key) then 
						_sacrifice_chance = _sacrifice_chance + value
					end
				end
				-- End of determining chance of success in order to display it in UI
				local title = common.get_localised_string("ui_text_replacements_localised_text_sacrifice_title")
				local desc = common.get_localised_string("ui_text_replacements_localised_text_sacrifice_description")
				local cost = common.get_localised_string("ui_text_replacements_localised_text_sacrifice_cost")
				local success_chance = common.get_localised_string("ui_text_replacements_localised_text_sacrifice_chance_of_success")
				local tooltip = title .. "\n" .. desc .. "\n" .. success_chance .. tostring(_sacrifice_chance) .. "%" .. "\n" .. cost  
				for resource_key , data in pairs(sacrifice_cost) do
					if faction:has_pooled_resource(resource_key) and faction:pooled_resource(resource_key):value() > data.amount then
						tooltip = tooltip .. "[[img:" .. data.icon..   "]][[/img]] " .. tostring(data.amount) .. "\n"
					else
						tooltip = common.get_localised_string("random_localisation_strings_string_StratHudbutton_Cannot_Recruit_Unit2")
						sacrifice_button:SetTooltipText("[[img:" .. data.icon..   "]][[/img]][[col:red]] " .. tostring(data.amount) .. "[[/col]]\n" .. tooltip, "random_localisation_strings_string_StratHudbutton_Cannot_Recruit_Unit2", true)
						sacrifice_button:SetDisabled(true)
						sacrifice_button:SetState("inactive")
						return
					end
				end
				sacrifice_button:SetTooltipText(tooltip, "From troy_sacrifices_and_rituals.lua - unlocalised text", true)
			end
			--CampaignUI.TriggerCampaignScriptEvent(faction:command_queue_index(), "Sacrifice_retreat_or_dismiss")
		end,
		true
	)

end

function apply_sacrifice_for_faction(faction,is_positive)
	local pb = cm:model():pending_battle()
	local human
	--local low_end = 5
	local bundle_key
	local mod_table
	if pb:has_attacker() and pb:attacker():faction():is_human() and pb:attacker():faction() == faction then 
		human = pb:attacker()
	elseif pb:has_defender() and pb:defender():faction():is_human() and pb:defender():faction() == faction then
		human = pb:defender()
	else 
		script_error("ERROR: apply_sacrifice_negative_for_faction() failed to find the faction who clicked a sacrifice button in the pending battle. How is this possible?")
		return
	end
	local human_mf_char_list = human:military_force():character_list()
	local priest = nil
	for t=0, human_mf_char_list:num_items()-1 do
		if human_mf_char_list:item_at(t):character_subtype("troy_agent_priest") then
			priest = human_mf_char_list:item_at(t)
		end
	end

	if priest == nil then 
		script_error("ERROR: apply_sacrifice_negative_for_faction() failed to find a priest character in the military force. How is this possible?")
		return 
	end

	if is_positive then 
		mod_table = good_omens_mods
		bundle_key = sacrifice_good_omens
	else 
		mod_table = bad_omens_mod
		bundle_key = sacrifice_bad_omens
	end
	
	local omen_bundle = cm:create_new_custom_effect_bundle(bundle_key)
	local bundle_effects = omen_bundle:effects()
	for i=0,bundle_effects:num_items() -1 do
		local curr_effect = bundle_effects:item_at(i)
		local curr_effect_value = curr_effect:value()
		local _new_value = curr_effect_value
		--[[ local rand_is_card_only
		if curr_effect_value < 0 then
			rand_is_card_only = curr_effect_value * -1
		else
			rand_is_card_only = curr_effect_value
		end
		local value = cm:model():random_int(low_end,rand_is_card_only)
		if not is_positive then 
			value = value * -1 
		end
		omen_bundle:set_effect_value(curr_effect,value) ]]
		for skill_key,to_add in pairs(mod_table) do
			if curr_effect:key() == to_add.effect and priest:has_skill(skill_key) then
				_new_value = _new_value + to_add.value
			end
		end
	omen_bundle:set_effect_value(curr_effect, _new_value )
	end

	-- Time to fix up and remove effects with a value of 0
	-- C++ side things are not as they appear so this has to be done, despite being ugly
	-- CUSTOM_EFFECT_BUNDLE:remove_effect modifies the underlying container (CUSTOM_EFFECT_BUNDLE:effects) so we have to ask for a re-wrap
	local has_deleted
	repeat
		bundle_effects = omen_bundle:effects()
		has_deleted = false
		for j=0,bundle_effects:num_items() - 1 do
			local curr_effect = bundle_effects:item_at(j)
			local curr_effect_value = curr_effect:value()
			if curr_effect_value == 0 then
				omen_bundle:remove_effect(curr_effect)
				has_deleted = true
				break
			end
		end
	until not has_deleted

	-- ui
	local panel = core:get_ui_root() and core:get_ui_root():SequentialFind("popup_pre_battle")
	if panel and panel:Visible() and cm:model():faction_is_local(faction:name()) then
		local effect_bundle_holder = panel:SequentialFind("effect_bundle_holder")
		if effect_bundle_holder ~= nil then
			local is_effect_bundle_holder_visible = true

			-- when map preview is visible we don't show effect bundle holder but C++ will show it when map preview hides
			local radar_map = panel:SequentialFind("preview_map")
			if radar_map ~= nil then
				is_effect_bundle_holder_visible = not radar_map:Visible()
			end

			effect_bundle_holder:SetVisible(is_effect_bundle_holder_visible)
			effect_bundle_holder:InterfaceFunction("set_custom_effect_bundle", omen_bundle)
		end
		local effect_bundle_title = panel:SequentialFind("dy_effect_bundle_title")
		if is_positive then 
			effect_bundle_title:SetState("positive")
		else 
			effect_bundle_title:SetState("negative")
		end
	end


	cm:apply_custom_effect_bundle_to_characters_force(omen_bundle,human)
end

function apply_ritual_for_faction(context)
	local faction_obj = context:character():faction()
	local faction = faction_obj:name()
	local buildings = context:garrison_residence():buildings()
	local acting_character = context:character()
	local is_ours
	if faction == context:garrison_residence():faction():name() then
		is_ours = true
	else 
		is_ours = false
	end
	for i=0,buildings:num_items()-1 do 
		if not buildings:item_at(i):is_null_interface() then 
			local name = buildings:item_at(i):name()
			if string.find(name,"religion") then
				for _,effect_key in pairs(gods_effects) do 
					if buildings:item_at(i):get_effect_value(effect_key) ~= 0 then
						local amount
						local bonus_amount = 0
						local target = effect_key
						target = string.gsub(target,"troy_effect_gods_favour_mod_","troy_god_attitude_")
						if string.find(name,"_3") then
							if context:mission_result_critial_success() then
								amount = cm:model():random_int(favour_critical_lower_bound_settlement,(favour_critical_upper_bound_settlement + temple_level_3_bonus))
							else
								amount = cm:model():random_int(favour_lower_bound_settlement,(favour_upper_bound_settlement + temple_level_3_bonus))
							end
							
							--Achilles Depressed Mood Buff
							if is_ours and (faction == achilles_faction) and (troy_achilles_current_mood == "depressed") then
								bonus_amount = bonus_amount + ( amount * achilles_mood_depressed_ritual_bonus )
							end

							--Sarpedon Minoan Relics Buff
							if is_ours --[[and  (faction == "troy_main_trj_lycia") ]] and (faction_obj:has_effect_bundle("effect_bundle_fm_sarpedon_rare_idols_bundle")) then
								bonus_amount = bonus_amount + ( amount * sarpedon_rare_idols_bonus )
							end

							--Paris Helen Convene Prayer Buff
							if is_ours and (faction == "troy_main_trj_paris") then
								local region_bundles = context:garrison_residence():region():effect_bundles()
								for i = 0, region_bundles:num_items() - 1 do
									if region_bundles:item_at(i):key() == "effect_bundle_fm_paris_convene_prayer_bundle" then 
										bonus_amount = bonus_amount + ( amount * paris_helen_prayer_action_bonus )
									end
								end
							end

							for i=1, #skills_to_values do 
								if 		is_ours
										and skills_to_values[i].apply_for_ours
										and	acting_character:has_skill(skills_to_values[i].skill_key)
										and (target == skills_to_values[i].god or skills_to_values[i].god == "any")
								then 
									bonus_amount = bonus_amount + (amount*skills_to_values[i].bonus)
								elseif 	not is_ours 
										and not skills_to_values[i].apply_for_ours
										and acting_character:has_skill(skills_to_values[i].skill_key) 
								then
									bonus_amount = bonus_amount + (amount*skills_to_values[i].bonus)
								end
							end
							
							if not is_ours then
								--amount = amount * (-1)
								--bonus_amount = bonus_amount * (-1)
							elseif acting_character:has_skill(priest_repeat_skill_key) then 
								repeat_ritual_favour_distribution(acting_character,target,gods_factors.agents,amount + bonus_amount)
							end 

							apply_transaction_and_spawn_event_for_rituals(faction_obj,target,gods_factors.agents,amount + bonus_amount,true,is_ours)
							return
						elseif string.find(name,"_4") then
							if context:mission_result_critial_success() then
								amount = cm:model():random_int(favour_critical_lower_bound_settlement,(favour_critical_upper_bound_settlement + temple_level_5_bonus))
							else
								amount = cm:model():random_int(favour_lower_bound_settlement,(favour_upper_bound_settlement + temple_level_5_bonus))
							end

							if is_ours and (faction == achilles_faction) and (troy_achilles_current_mood == "depressed") then
								bonus_amount = bonus_amount + (amount * achilles_mood_depressed_ritual_bonus)
							end

							if is_ours --[[ and (faction == "troy_main_trj_lycia") ]] and (faction_obj:has_effect_bundle("effect_bundle_fm_sarpedon_rare_idols_bundle")) then
								bonus_amount = bonus_amount + (amount * sarpedon_rare_idols_bonus )
							end
							
							if is_ours and (faction == "troy_main_trj_paris") then
								local region_bundles = context:garrison_residence():region():effect_bundles()
								for i = 0, region_bundles:num_items() - 1 do
									if region_bundles:item_at(i):key() == "effect_bundle_fm_paris_convene_prayer_bundle" then 
										bonus_amount = bonus_amount + (amount * paris_helen_prayer_action_bonus )
									end
								end
							end

							for i=1, #skills_to_values do 
								if 		is_ours
										and skills_to_values[i].apply_for_ours
										and	acting_character:has_skill(skills_to_values[i].skill_key) 	
										and (target == skills_to_values[i].god or skills_to_values[i].god == "any")		
								then 
									bonus_amount = bonus_amount + (amount*skills_to_values[i].bonus)
								elseif 	not is_ours 
										and not skills_to_values[i].apply_for_ours
										and acting_character:has_skill(skills_to_values[i].skill_key) 
								then
									bonus_amount = bonus_amount + (amount*skills_to_values[i].bonus)
								end
							end

							if not is_ours then
								--amount = amount * (-1)
								--bonus_amount = bonus_amount * (-1)
							elseif acting_character:has_skill(priest_repeat_skill_key) then 
								repeat_ritual_favour_distribution(acting_character,target,gods_factors.agents,amount + bonus_amount)
							end

							apply_transaction_and_spawn_event_for_rituals(faction_obj,target,gods_factors.agents,amount + bonus_amount,true,is_ours)
							return
						else
							if context:mission_result_critial_success() then
								amount = cm:model():random_int(favour_critical_lower_bound_settlement,favour_critical_upper_bound_settlement)
							else
								amount = cm:model():random_int(favour_lower_bound_settlement,favour_upper_bound_settlement)
							end
							
							if is_ours and (faction == achilles_faction) and (troy_achilles_current_mood == "depressed") then
								bonus_amount = bonus_amount + ( amount * achilles_mood_depressed_ritual_bonus )
							end

							if is_ours --[[ and (faction == "troy_main_trj_lycia") ]] and (faction_obj:has_effect_bundle("effect_bundle_fm_sarpedon_rare_idols_bundle")) then
								bonus_amount = bonus_amount + ( amount * sarpedon_rare_idols_bonus )
							end

							if is_ours and (faction == "troy_main_trj_paris") then
								local region_bundles = context:garrison_residence():region():effect_bundles()
								for i = 0, region_bundles:num_items() - 1 do
									if region_bundles:item_at(i):key() == "effect_bundle_fm_paris_convene_prayer_bundle" then 
										bonus_amount = bonus_amount + ( amount * paris_helen_prayer_action_bonus )
									end
								end
							end

							for i=1, #skills_to_values do 
								if 		is_ours
										and skills_to_values[i].apply_for_ours
										and	acting_character:has_skill(skills_to_values[i].skill_key) 		
										and (target == skills_to_values[i].god or skills_to_values[i].god == "any")
								then 
									bonus_amount = bonus_amount + (amount*skills_to_values[i].bonus)
								elseif 	not is_ours 
										and not skills_to_values[i].apply_for_ours
										and acting_character:has_skill(skills_to_values[i].skill_key) 
								then
									bonus_amount = bonus_amount + (amount*skills_to_values[i].bonus)
								end
							end

							if not is_ours then
								--amount = amount * (-1)
								--bonus_amount = bonus_amount * (-1)
							elseif acting_character:has_skill(priest_repeat_skill_key) then 
								repeat_ritual_favour_distribution(acting_character,target,gods_factors.agents,amount + bonus_amount)
							end

							apply_transaction_and_spawn_event_for_rituals(faction_obj,target,gods_factors.agents,amount + bonus_amount,true,is_ours)
							return
						end
					end
				end 
			end
		end
	end
	local gods = cm:model():world():god_manager():gods()
	local gods_rand_table = {}
	for t=0,gods:num_items()-1 do
		if not gods:item_at(t):is_null_interface() then
			table.insert(gods_rand_table, gods:item_at(t))
		end
	end
	local target = gods_rand_table[cm:model():random_int(1, #gods_rand_table)]:resource_key()
		
	apply_transaction_and_spawn_event_for_rituals(faction_obj,target,gods_factors.agents,no_temple_random_god_favour_amount,true,is_ours)
end

function repeat_ritual_favour_distribution(character, target,inc_factor,amount)
	core:add_listener("temp_repeat_ritual_for" .. tostring(character:command_queue_index()), 
		"CharacterTurnStart", 
		function(context) 
			return context:character() == character()
		end, 
		function()
			local faction = character:faction()
			apply_transaction_conflict_and_spawn_event(faction,target,inc_factor,amount,gain_campaign_1[target_god].loc_key)
		end, 
		false
	)
end

function clean_up_sacrifice_bundles(faction)
	local char_list = faction:character_list() 
	for i=0,char_list:num_items()-1 do
		local curr_char = char_list:item_at(i)
		if curr_char:has_military_force() then
			local effect_bundles = curr_char:effect_bundles()
			for t=0,effect_bundles:num_items()-1 do
				if effect_bundles:item_at(t):key() == sacrifice_good_omens then 
					cm:remove_effect_bundle_from_character(sacrifice_good_omens,curr_char:command_queue_index())
				end
				if effect_bundles:item_at(t):key() == sacrifice_bad_omens then 
					cm:remove_effect_bundle_from_character(sacrifice_bad_omens,curr_char:command_queue_index())
				end
			end
		end
	end
end