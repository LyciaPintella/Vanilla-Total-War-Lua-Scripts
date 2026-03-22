out("Loading campaign_experience_triggers.lua")

-- modular difficulty modifier
xp_general_modifier_modular_difficulty = 1

--function setup_experience_triggers()
	core:add_listener(
		"CharacterTurnStart_experience",
		"CharacterTurnStart",
		function()
			return cm:model():turn_number() > 1;
		end,
		function(context)
			local character = context:character();
		
			-- general is garrisoned
			if character:has_garrison_residence() then
				add_experience(context, true, xp_general_is_garrisoned);
			end;
			
			-- general is raiding
			-- This has been moved to a scripted bonus value.
			--[[
			if character:has_military_force() then
				local mf = character:military_force();
				
				if mf:active_stance() == "MILITARY_FORCE_ACTIVE_STANCE_TYPE_LAND_RAID" or mf:active_stance() == "MILITARY_FORCE_ACTIVE_STANCE_TYPE_SET_CAMP_RAIDING" then
					add_experience(context, true, xp_general_is_raiding);
				end;
			end;
			]]
			-- agent is active
			if not character:is_wounded() and character:character_type("champion") or character:character_type("spy") or character:character_type("dignitary") or character:character_type("engineer") or character:character_type("runesmith") then --or character:character_type("wizard")  then -- we don't want Mythic monsters to gain passive experience.
				add_experience(context, false, xp_hero_is_active);
			end;
			
			-- agent is embedded
			-- Mythic monsters don't gain passive experience
			if character:is_embedded_in_military_force() and not character:character_type("wizard") then
				add_experience(context, false, xp_hero_is_embedded);
			end;
		end,
		true
	);
	
	core:add_listener(
		"GarrisonOccupiedEvent_experience",
		"GarrisonOccupiedEvent",
		true,
		function(context)
			-- general captures and occupies a settlement
			add_experience(context, true, xp_general_occupies_settlement);
		end,
		true
	);
	
	core:add_listener(
		"CharacterRazedSettlement_experience",
		"CharacterRazedSettlement",
		true,
		function(context)
			-- general captures and razes a settlement
			add_experience(context, true, xp_general_razes_settlement);
		end,
		true
	);
	
	core:add_listener(
		"MilitaryForceBuildingCompleteEvent_experience",
		"CharacterMilitaryForceBuildingCompleted",
		true,
		function(context)
			-- horde general constructs a building
			add_experience(context, true, xp_general_completes_horde_building);
		end,
		true
	);
	
	core:add_listener(
		"CharacterGarrisonTargetAction_experience",
		"CharacterGarrisonTargetAction",
		true,
		function(context)
			-- agent targets a settlement
			-- ignore if an agent is scouting ruins
			if context:agent_action_key():find("scout_settlement") then
				return;
			end;

			-- generals may interact with ERSs.
			-- This triggers the GarrisonTargetAction event
			-- We want to provide a completely separate bonus for them.
			if context:character():character_type_key() == "general" then
				add_experience(context, true, xp_general_ers_interaction_experience);
				return
			end
				
			local value = xp_hero_target_settlement_success;
			
			if context:mission_result_critial_failure() then
				value = xp_hero_target_settlement_fail_critical;
			elseif context:mission_result_failure() then
				value = xp_hero_target_settlement_fail;
			elseif context:mission_result_opportune_failure() then
				value = xp_hero_target_settlement_fail_opportune;
			end;

			if context:character():faction() == context:garrison_residence():faction() then
				value = value * xp_hero_target_own_settlement_target_multiplier
			end
			
			add_experience(context, false, value);
		end,
		true
	);
	
	core:add_listener(
		"CharacterCharacterTargetAction_experience",
		"CharacterCharacterTargetAction",
		true,
		function(context)
			local ability = context:ability();
			
			-- agent targets an army
			if ability == "hinder_army" then
				local value = xp_hero_target_army_success;
				
				if context:mission_result_critial_failure() then
					value = xp_hero_target_army_fail_critical;
				elseif context:mission_result_failure() then
					value = xp_hero_target_army_fail;
				elseif context:mission_result_opportune_failure() then
					value = xp_hero_target_army_fail_opportune;
				end;
				
				add_experience(context, false, value);
				
			-- agent targets a character (assassination)
			elseif ability == "hinder_character" or ability == "hinder_agent" then
				local value = xp_hero_target_character_fail;
				local target_rank = context:target_character():rank();
				
				if context:mission_result_critial_failure() then
					value = xp_hero_target_character_fail_critical;
				elseif context:mission_result_opportune_failure() then
					value = xp_hero_target_character_fail_opportune;
				elseif context:mission_result_critial_success() then
					value = xp_hero_target_character_success_critical + add_assassination_bonus(target_rank);
				elseif context:mission_result_success() then
					value = xp_hero_target_character_success + add_assassination_bonus(target_rank);
				end;
				
				add_experience(context, false, value);
			end;
		end,
		true
	);
	
	core:add_listener(
		"CharacterCompletedBattle_experience",
		"CharacterCompletedBattle",
		true,
		function(context)
			-- general completes a battle
			calculate_battle_result_experience(context, true, false);
		end,
		true
	);
	
	core:add_listener(
		"HeroCharacterParticipatedInBattle_experience",
		"HeroCharacterParticipatedInBattle",
		true,
		function(context)
			-- embedded agent completes a battle
			calculate_battle_result_experience(context, false, false);
		end,
		true
	);
	
	core:add_listener(
		"CharacterParticipatedAsSecondaryGeneralInBattle_experience",
		"CharacterParticipatedAsSecondaryGeneralInBattle",
		true,
		function(context)
			-- reinforcing general completes a battle
			calculate_battle_result_experience(context, true, true);
		end,
		true
	);

	core:add_listener(
		"troy_adi_experience_for_heroes_from_special_diomedes_military_camp",
		"FactionTurnStart",
		function(context) return context:faction():name() == "troy_main_dan_argos" end,
		function(context)
			local faction = context:faction()
			local province_list = faction:province_list()

			for p = 0, province_list:num_items() - 1 do
				local value
				local curr_province = province_list:item_at(p)
				local region_list = curr_province:regions()

				for i = 0, region_list:num_items() - 1 do
					
					local curr_region = region_list:item_at(i)
					if curr_region:owning_faction() == faction then 
						local curr_region_build_list = curr_region:settlement():building_list()

						for b = 0, curr_region_build_list:num_items() - 1 do
							local curr_building = curr_region_build_list:item_at(b) 
							if curr_building:chain() == "troy_adi_special_diomedes_military_camp" then 
								value = curr_building:get_effect_value("troy_adi_effect_hero_xp_per_turn_dummy")
							end
						end
					end	
				end

				if value then 
					local chars_in_province = faction:character_list()
					for c = 0, chars_in_province:num_items() - 1 do
						local curr_char = chars_in_province:item_at(c) 
						if curr_char:character_type("general") and curr_char:has_region() and curr_char:faction() == faction and curr_char:has_military_force() and curr_char:region():province() == curr_province and curr_char:region():owning_faction() == faction then 
							--out("\n\nadding "..value.." to character ".. curr_char:character_subtype_key().. " located in province "..curr_province:name())
							cm:add_agent_experience(cm:char_lookup_str(curr_char:command_queue_index()),value)
						end
					end
				end

			end
					
		end,
		true
	);

	core:add_listener(
		"character_ended_turn_in_enemy_territory_experience",
		"CharacterTurnEnd",
		function(context)
			local character = context:character()
			local faction = character:faction()
			return character:has_region() and character:has_military_force() and faction:at_war_with(character:region():owning_faction())
		end,
		function(context)
			add_experience(context, true, xp_general_ends_turn_enemy_territory)
		end,
		true
	);
	
--end;

function add_assassination_bonus(target_rank)
	if target_rank > 10 and target_rank < 21 then
		return xp_hero_target_character_success_bonus_10;
	elseif target_rank > 20 then
		return xp_hero_target_character_success_bonus_20;
	else
		return 0;
	end;
end;

function calculate_battle_result_experience(context, is_general, is_secondary_general)
	local value = 0;
	
	local pb = cm:model():pending_battle();

	-- don't give experience to chalanged champion
	if pb:challenge_battle() and context:character():faction():name() == pb:defender_faction():name() then
		return
	end

	local attacker_battle_result = pb:attacker_battle_result();
	local defender_battle_result = pb:defender_battle_result();
	
	if context:character():won_battle() then
		if attacker_battle_result == "pyrrhic_victory" or defender_battle_result == "pyrrhic_victory" then
			value = xp_battle_victory_pyrrhic;
		elseif attacker_battle_result == "heroic_victory" or defender_battle_result == "heroic_victory" then
			value = xp_battle_victory_heroic;
		else
			value = xp_battle_victory;
		end;
		
		-- add the ambush bonus if it's an ambush battle
		if is_general and pb:attacker() == context:character() and pb:ambush_battle() and not pb:failed_ambush_battle() then
			value = value + xp_battle_victory_ambush;
		end;
	-- don't award losing XP if it's a quest battle
	elseif not battle_is_quest_battle(pb) then
		if attacker_battle_result == "crushing_defeat" or defender_battle_result == "crushing_defeat" then
			value = xp_battle_defeat_crushing;
		elseif attacker_battle_result == "valiant_defeat" or defender_battle_result == "valiant_defeat" then
			value = xp_battle_defeat_valiant;
		else
			value = xp_battle_defeat;
		end;
	end;
	
	--[[ if not is_general then
		value = value * xp_battle_modifier_hero;
	elseif is_secondary_general then
		value = value * xp_battle_modifier_secondary_general;
	end;	 ]]
	if not is_general and xp_agent_types_gaining_battle_experience[context:character():character_type_key()] then 
		value = value * xp_battle_modifier_hero;
	elseif not is_general then
		value = 0;
	end

	if not pb:attacker_faction():is_rebel() and not pb:defender_faction():is_rebel() then 
		add_experience(context, is_general, value);
	else
		if context:character():faction():is_rebel() then
			add_experience(context, is_general, value);
		else
			local rebel_debuff = true
			add_experience(context, is_general, value, rebel_debuff);
		end
	end
end;

function battle_is_quest_battle(pb)
	if (pb:has_attacker() and pb:attacker():faction():is_quest_battle_faction()) or (pb:has_defender() and pb:defender():faction():is_quest_battle_faction()) then
		return true;
	else
		return false;
	end;
end;


function add_experience(context, is_general, value, rebel_debuff)
	local character = context:character()
	local faction = character:faction()
	local character_subtype = context:character():character_subtype_key()
	local char_str = cm:char_lookup_str(character:command_queue_index())

	------ special rules ------
	if is_general then 
		if not is_xp_gained_by_replaced_starting_generals and character:is_replaced_starting_general() then
			return
		end

		local athena_tier = faction:attitude_tier_for_god("athena")
		if athena_tier == -2 then
			value = value * xp_general_modifier_athena_negative_2
		elseif athena_tier == 2 then
			value = value * xp_general_modifier_athena_positive_2
		elseif athena_tier == 3 then
			value = value * xp_general_modifier_athena_positive_3
		end

		value = value * xp_general_modifier_modular_difficulty
	end

	if not is_general then
		local apollo_tier = faction:attitude_tier_for_god("apollo")
		if apollo_tier == -2 then
			value = value * xp_hero_modifier_apollo_negative_2
		elseif apollo_tier == 2 then
			value = value * xp_hero_modifier_apollo_positive_2
		elseif apollo_tier == 3 then
			value = value * xp_hero_modifier_apollo_positive_3
		end
	end

	if rebel_debuff then
		value = value * xp_modifier_rebel_debuff
	end

	cm:add_agent_experience(char_str,value)
end

cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("XP_GENERAL_MODIFIER_MODULAR_DIFFICULTY", xp_general_modifier_modular_difficulty, context)
	end
)
cm:add_loading_game_callback(
	function(context)
		xp_general_modifier_modular_difficulty = cm:load_named_value("XP_GENERAL_MODIFIER_MODULAR_DIFFICULTY", xp_general_modifier_modular_difficulty , context)
	end
)