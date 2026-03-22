skill_data = {

	-- Griffin Scripted Skills
	troy_mth_agent_griffin_skill_tier1_griffin_ability_upgrade = {
		events = {
			CharacterSkillPointAllocated = function(context, monster, skill_key)
				if context:character():character_subtype_key() ~= monster.config.agent_subtype then 
					return
				end
				if skill_key == "troy_mth_agent_griffin_skill_tier1_griffin_ability_upgrade" then
					mythic_monster_skills_functions.griffin_harmony_for_skill(monster, "griffin")
				end
			end,
		},
	},

	troy_mth_agent_griffin_skill_tier1_griffin_harmony_upgrade = {
		events = {
			CharacterSkillPointAllocated = function(context, monster, skill_key)
				if context:character():character_subtype_key() ~= monster.config.agent_subtype then 
					return
				end
				if skill_key == "troy_mth_agent_griffin_skill_tier1_griffin_harmony_upgrade" then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
					mythic_monster_skills_functions.griffin_harmony_for_skill(monster, "harmony")
				end
			end,
			FactionTurnStart = function(context, monster, skill_key)
				out("FACTION TURN START FROM SKILLS " .. monster:id() .. " " .. tostring(monster.persistent.monster_cqi))
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_tier1_griffin_harmony_upgrade" and context:faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitCreated = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_tier1_griffin_harmony_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitDisbanded = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_tier1_griffin_harmony_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitMergedAndDestroyed = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_tier1_griffin_harmony_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitTransferred = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_tier1_griffin_harmony_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitTrained = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_tier1_griffin_harmony_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitCreated = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_tier1_griffin_harmony_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			AgentEntersMilitaryForce = function(context, monster, skill_key)
				local griffin = mythic_monster_skills_functions.get_monster_or_faction(monster, false)

				if skill_key == "troy_mth_agent_griffin_skill_tier1_griffin_harmony_upgrade" and context:character() == griffin then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,

		},
		harmony_events = {
			CharacterSkillPointAllocated = function(context, monster, skill_key, effects, harmony_side, harmony)
				if harmony_side == "harmony_side" and skill_key == "troy_mth_agent_griffin_skill_tier1_griffin_harmony_upgrade" then
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key, effects, harmony_side)
				end
				
			end,
			ScriptEventGriffinHarmonyStateChanged = function(context, monster, skill_key, effects, harmony_side, harmony)
				if context.stored_table.new_state == "harmony_side" and skill_key == "troy_mth_agent_griffin_skill_tier1_griffin_harmony_upgrade" then
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key, effects, harmony_side)
				end
				
			end,
			UnitCreated = function(context, monster, skill_key, effects, harmony_side, harmony)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_tier1_griffin_harmony_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key, effects, harmony_side)
				end
			end,
			UnitDisbanded = function(context, monster, skill_key, effects, harmony_side, harmony)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_tier1_griffin_harmony_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key, effects, harmony_side)
				end
			end,
			UnitMergedAndDestroyed = function(context, monster, skill_key, effects, harmony_side, harmony)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_tier1_griffin_harmony_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key, effects, harmony_side)
				end
			end,
			UnitTransferred = function(context, monster, skill_key, effects, harmony_side, harmony)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_tier1_griffin_harmony_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key, effects, harmony_side)
				end
			end,
			UnitTrained = function(context, monster, skill_key, effects, harmony_side, harmony)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_tier1_griffin_harmony_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key, effects, harmony_side)
				end
			end,
			UnitCreated = function(context, monster, skill_key, effects, harmony_side, harmony)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_tier1_griffin_harmony_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key, effects, harmony_side)
				end
			end,
			AgentEntersMilitaryForce = function(context, monster, skill_key)
				local griffin = mythic_monster_skills_functions.get_monster_or_faction(monster, false)

				if skill_key == "troy_mth_agent_griffin_skill_tier1_griffin_harmony_upgrade" and context:character() == griffin then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
		},
	},

	troy_mth_agent_griffin_skill_horde_tier1_griffin_harmony_upgrade = {
		events = {
			CharacterSkillPointAllocated = function(context, monster, skill_key)
				if context:character():character_subtype_key() ~= monster.config.agent_subtype then 
					return
				end
				if skill_key == "troy_mth_agent_griffin_skill_horde_tier1_griffin_harmony_upgrade" then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
					mythic_monster_skills_functions.griffin_harmony_for_skill(monster, "harmony")
				end
			end,
			FactionTurnStart = function(context, monster, skill_key)
				out("FACTION TURN START FROM SKILLS " .. monster:id() .. " " .. tostring(monster.persistent.monster_cqi))
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_horde_tier1_griffin_harmony_upgrade" and context:faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitCreated = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_horde_tier1_griffin_harmony_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitDisbanded = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_horde_tier1_griffin_harmony_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitMergedAndDestroyed = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_horde_tier1_griffin_harmony_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitTransferred = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_horde_tier1_griffin_harmony_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitTrained = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_horde_tier1_griffin_harmony_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitCreated = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_horde_tier1_griffin_harmony_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			AgentEntersMilitaryForce = function(context, monster, skill_key)
				local griffin = mythic_monster_skills_functions.get_monster_or_faction(monster, false)

				if skill_key == "troy_mth_agent_griffin_skill_horde_tier1_griffin_harmony_upgrade" and context:character() == griffin then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,

		},
		harmony_events = {
			CharacterSkillPointAllocated = function(context, monster, skill_key, effects, harmony_side, harmony)
				if harmony_side == "harmony_side" and skill_key == "troy_mth_agent_griffin_skill_horde_tier1_griffin_harmony_upgrade" then
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key, effects, harmony_side)
				end
				
			end,
			ScriptEventGriffinHarmonyStateChanged = function(context, monster, skill_key, effects, harmony_side, harmony)
				if context.stored_table.new_state == "harmony_side" and skill_key == "troy_mth_agent_griffin_skill_horde_tier1_griffin_harmony_upgrade" then
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key, effects, harmony_side)
				end
				
			end,
			UnitCreated = function(context, monster, skill_key, effects, harmony_side, harmony)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_horde_tier1_griffin_harmony_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key, effects, harmony_side)
				end
			end,
			UnitDisbanded = function(context, monster, skill_key, effects, harmony_side, harmony)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_horde_tier1_griffin_harmony_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key, effects, harmony_side)
				end
			end,
			UnitMergedAndDestroyed = function(context, monster, skill_key, effects, harmony_side, harmony)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_horde_tier1_griffin_harmony_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key, effects, harmony_side)
				end
			end,
			UnitTransferred = function(context, monster, skill_key, effects, harmony_side, harmony)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_horde_tier1_griffin_harmony_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key, effects, harmony_side)
				end
			end,
			UnitTrained = function(context, monster, skill_key, effects, harmony_side, harmony)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_horde_tier1_griffin_harmony_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key, effects, harmony_side)
				end
			end,
			UnitCreated = function(context, monster, skill_key, effects, harmony_side, harmony)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_horde_tier1_griffin_harmony_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key, effects, harmony_side)
				end
			end,
			AgentEntersMilitaryForce = function(context, monster, skill_key)
				local griffin = mythic_monster_skills_functions.get_monster_or_faction(monster, false)

				if skill_key == "troy_mth_agent_griffin_skill_horde_tier1_griffin_harmony_upgrade" and context:character() == griffin then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
		},
	},

	troy_mth_agent_griffin_skill_tier1_griffin_economy_bonus = {
		events = {
			CharacterSkillPointAllocated = function(context, monster, skill_key)
				if context:character():character_subtype_key() ~= monster.config.agent_subtype then
					return
				end
				if skill_key == "troy_mth_agent_griffin_skill_tier1_griffin_economy_bonus" then 
					mythic_monster_skills_functions.griffin_harmony_for_skill(monster, "arimaspoi")
				end
			end,
		},
		harmony_events = {
			CharacterSkillPointAllocated = function(context, monster, skill_key, effects, harmony_side, harmony)
				if harmony_side == "arimaspoi_side" and skill_key == "troy_mth_agent_griffin_skill_tier1_griffin_economy_bonus" then
					mythic_monster_skills_functions.griffin_skill_bonuses_from_buildings_to_faction(context, monster, skill_key, effects, harmony_side, true)
				end
				
			end,

			ScriptEventGriffinHarmonyStateChanged = function(context, monster, skill_key, effects, harmony_side, harmony)
				if context.stored_table.new_state == "arimaspoi_side" and skill_key == "troy_mth_agent_griffin_skill_tier1_griffin_economy_bonus" then
					mythic_monster_skills_functions.griffin_skill_bonuses_from_buildings_to_faction(context, monster, skill_key, effects, harmony_side, true)
				elseif context.stored_table.new_state ~= "arimaspoi_side" and skill_key == "troy_mth_agent_griffin_skill_tier1_griffin_economy_bonus" then
					mythic_monster_skills_functions.griffin_skill_bonuses_from_buildings_to_faction(context, monster, skill_key, effects, harmony_side, false)
				end
				
			end,
			
		},
	},

	troy_mth_agent_griffin_skill_horde_tier1_griffin_economy_bonus = {
		events = {
			CharacterSkillPointAllocated = function(context, monster, skill_key)
				if context:character():character_subtype_key() ~= monster.config.agent_subtype then 
					return
				end
				if skill_key == "troy_mth_agent_griffin_skill_horde_tier1_griffin_economy_bonus" then 
					mythic_monster_skills_functions.griffin_harmony_for_skill(monster, "arimaspoi")
				end
			end,
		},
		harmony_events = {
			CharacterSkillPointAllocated = function(context, monster, skill_key, effects, harmony_side, harmony)
				if harmony_side == "arimaspoi_side" and skill_key == "troy_mth_agent_griffin_skill_horde_tier1_griffin_economy_bonus" then
					mythic_monster_skills_functions.griffin_skill_bonuses_from_buildings_to_faction(context, monster, skill_key, effects, harmony_side, true)
				end
				
			end,

			ScriptEventGriffinHarmonyStateChanged = function(context, monster, skill_key, effects, harmony_side, harmony)
				if context.stored_table.new_state == "arimaspoi_side" and skill_key == "troy_mth_agent_griffin_skill_horde_tier1_griffin_economy_bonus" then
					mythic_monster_skills_functions.griffin_skill_bonuses_from_buildings_to_faction(context, monster, skill_key, effects, harmony_side, true)
				elseif context.stored_table.new_state ~= "arimaspoi_side" and skill_key == "troy_mth_agent_griffin_skill_horde_tier1_griffin_economy_bonus" then
					mythic_monster_skills_functions.griffin_skill_bonuses_from_buildings_to_faction(context, monster, skill_key, effects, harmony_side, false)
				end
				
			end,
			
		},
	},

	troy_mth_agent_griffin_skill_tier2_griffin_agent_action_upgrade = {
		events = {
			CharacterSkillPointAllocated = function(context, monster, skill_key)
				if context:character():character_subtype_key() ~= monster.config.agent_subtype then 
					return
				end
				if skill_key == "troy_mth_agent_griffin_skill_tier2_griffin_agent_action_upgrade" then 
					mythic_monster_skills_functions.griffin_harmony_for_skill(monster, "harmony")
				end
			end,
		},
	},

	troy_mth_agent_griffin_skill_tier2_griffin_normal_unit_upgrades = {
		events = {
			CharacterSkillPointAllocated = function(context, monster, skill_key)
				if context:character():character_subtype_key() ~= monster.config.agent_subtype then 
					return
				end
				if skill_key == "troy_mth_agent_griffin_skill_tier2_griffin_normal_unit_upgrades" then 
					mythic_monster_skills_functions.griffin_harmony_for_skill(monster, "arimaspoi")
				end
			end,
		},
	},
	
	troy_mth_agent_griffin_skill_tier2_griffin_unit_upgrade = {
		events = {
			CharacterSkillPointAllocated = function(context, monster, skill_key)
				if context:character():character_subtype_key() ~= monster.config.agent_subtype then 
					return
				end
				if skill_key == "troy_mth_agent_griffin_skill_tier2_griffin_unit_upgrade" then 
					mythic_monster_skills_functions.griffin_harmony_for_skill(monster, "griffin")
				end
			end,
		},
	},

	troy_mth_agent_griffin_skill_tier3_griffin_attribute_upgrade = {
		events = {
			CharacterSkillPointAllocated = function(context, monster, skill_key)
				if context:character():character_subtype_key() ~= monster.config.agent_subtype then 
					return
				end
				if skill_key == "troy_mth_agent_griffin_skill_tier3_griffin_attribute_upgrade" then
					mythic_monster_skills_functions.griffin_harmony_for_skill(monster, "griffin")
				end
			end,
		},
		harmony_events = {
			CharacterSkillPointAllocated = function(context, monster, skill_key, effects, harmony_side, harmony)
				if harmony_side == "griffin_side" and skill_key == "troy_mth_agent_griffin_skill_tier3_griffin_attribute_upgrade" then
					mythic_monster_skills_functions.griffin_skill_bonuses_from_buildings_to_faction(context, monster, skill_key, effects, harmony_side, true)
				end
				
			end,
			ScriptEventGriffinHarmonyStateChanged = function(context, monster, skill_key, effects, harmony_side, harmony)
				if context.stored_table.new_state == "griffin_side" and skill_key == "troy_mth_agent_griffin_skill_tier3_griffin_attribute_upgrade" then
					mythic_monster_skills_functions.griffin_skill_bonuses_from_buildings_to_faction(context, monster, skill_key, effects, harmony_side, true)
				elseif context.stored_table.new_state ~= "griffin_side" and skill_key == "troy_mth_agent_griffin_skill_tier3_griffin_attribute_upgrade" then
					mythic_monster_skills_functions.griffin_skill_bonuses_from_buildings_to_faction(context, monster, skill_key, effects, harmony_side, false)
				end
			end,
		},
	},

	troy_mth_agent_griffin_skill_tier3_griffin_harmony_army_upgrade = {
		events = {
			CharacterSkillPointAllocated = function(context, monster, skill_key)
				if context:character():character_subtype_key() ~= monster.config.agent_subtype then 
					return
				end
				if skill_key == "troy_mth_agent_griffin_skill_tier3_griffin_harmony_army_upgrade" then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
					mythic_monster_skills_functions.griffin_harmony_for_skill(monster, "harmony")
				end
			end,
			FactionTurnStart = function(context, monster, skill_key)
				out("FACTION TURN START FROM SKILLS " .. monster:id() .. " " .. tostring(monster.persistent.monster_cqi))
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_tier3_griffin_harmony_army_upgrade" and context:faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitCreated = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_tier3_griffin_harmony_army_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitDisbanded = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_tier3_griffin_harmony_army_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitMergedAndDestroyed = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_tier3_griffin_harmony_army_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitTransferred = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_tier3_griffin_harmony_army_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitTrained = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_tier3_griffin_harmony_army_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitCreated = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_tier3_griffin_harmony_army_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			AgentEntersMilitaryForce = function(context, monster, skill_key)
				local griffin = mythic_monster_skills_functions.get_monster_or_faction(monster, false)

				if skill_key == "troy_mth_agent_griffin_skill_tier3_griffin_harmony_army_upgrade" and context:character() == griffin then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
		},
		harmony_events = {
			CharacterSkillPointAllocated = function(context, monster, skill_key, effects, harmony_side, harmony)
				if harmony_side == "harmony_side" and skill_key == "troy_mth_agent_griffin_skill_tier3_griffin_harmony_army_upgrade" then
					mythic_monster_skills_functions.griffin_skill_bonuses_from_buildings_to_faction(context, monster, skill_key, effects, harmony_side, true)
				end
				
			end,
			ScriptEventGriffinHarmonyStateChanged = function(context, monster, skill_key, effects, harmony_side, harmony)
				if context.stored_table.new_state == "harmony_side" and skill_key == "troy_mth_agent_griffin_skill_tier3_griffin_harmony_army_upgrade" then
					mythic_monster_skills_functions.griffin_skill_bonuses_from_buildings_to_faction(context, monster, skill_key, effects, harmony_side, true)
				elseif context.stored_table.new_state ~= "harmony_side" and skill_key == "troy_mth_agent_griffin_skill_tier3_griffin_harmony_army_upgrade" then
					mythic_monster_skills_functions.griffin_skill_bonuses_from_buildings_to_faction(context, monster, skill_key, effects, harmony_side, false)
				end
			end,
		},
	},

	troy_mth_agent_griffin_skill_horde_tier3_griffin_harmony_army_upgrade = {
		events = {
			CharacterSkillPointAllocated = function(context, monster, skill_key)
				if context:character():character_subtype_key() ~= monster.config.agent_subtype then 
					return
				end
				if skill_key == "troy_mth_agent_griffin_skill_horde_tier3_griffin_harmony_army_upgrade" then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
					mythic_monster_skills_functions.griffin_harmony_for_skill(monster, "harmony")
				end
			end,
			FactionTurnStart = function(context, monster, skill_key)
				out("FACTION TURN START FROM SKILLS " .. monster:id() .. " " .. tostring(monster.persistent.monster_cqi))
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_horde_tier3_griffin_harmony_army_upgrade" and context:faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitCreated = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_horde_tier3_griffin_harmony_army_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitDisbanded = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_horde_tier3_griffin_harmony_army_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitMergedAndDestroyed = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_horde_tier3_griffin_harmony_army_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitTransferred = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_horde_tier3_griffin_harmony_army_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitTrained = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_horde_tier3_griffin_harmony_army_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitCreated = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_horde_tier3_griffin_harmony_army_upgrade" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			AgentEntersMilitaryForce = function(context, monster, skill_key)
				local griffin = mythic_monster_skills_functions.get_monster_or_faction(monster, false)

				if skill_key == "troy_mth_agent_griffin_skill_horde_tier3_griffin_harmony_army_upgrade" and context:character() == griffin then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
		},
		harmony_events = {
			CharacterSkillPointAllocated = function(context, monster, skill_key, effects, harmony_side, harmony)
				if harmony_side == "harmony_side" and skill_key == "troy_mth_agent_griffin_skill_horde_tier3_griffin_harmony_army_upgrade" then
					mythic_monster_skills_functions.griffin_skill_bonuses_from_buildings_to_faction(context, monster, skill_key, effects, harmony_side, true)
				end
				
			end,
			ScriptEventGriffinHarmonyStateChanged = function(context, monster, skill_key, effects, harmony_side, harmony)
				if context.stored_table.new_state == "harmony_side" and skill_key == "troy_mth_agent_griffin_skill_horde_tier3_griffin_harmony_army_upgrade" then
					mythic_monster_skills_functions.griffin_skill_bonuses_from_buildings_to_faction(context, monster, skill_key, effects, harmony_side, true)
				elseif context.stored_table.new_state ~= "harmony_side" and skill_key == "troy_mth_agent_griffin_skill_horde_tier3_griffin_harmony_army_upgrade" then
					mythic_monster_skills_functions.griffin_skill_bonuses_from_buildings_to_faction(context, monster, skill_key, effects, harmony_side, false)
				end
			end,
		},
	},

	troy_mth_agent_griffin_skill_tier3_griffin_gold_economy = {
		events = {
			CharacterSkillPointAllocated = function(context, monster, skill_key)
				if context:character():character_subtype_key() ~= monster.config.agent_subtype then 
					return
				end
				if skill_key == "troy_mth_agent_griffin_skill_tier3_griffin_gold_economy" then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
					mythic_monster_skills_functions.griffin_harmony_for_skill(monster, "arimaspoi")
				end
			end,
			FactionTurnStart = function(context, monster, skill_key)
				out("FACTION TURN START FROM SKILLS " .. monster:id() .. " " .. tostring(monster.persistent.monster_cqi))
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_tier3_griffin_gold_economy" and context:faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitCreated = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_tier3_griffin_gold_economy" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitDisbanded = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_tier3_griffin_gold_economy" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitMergedAndDestroyed = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_tier3_griffin_gold_economy" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitTransferred = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_tier3_griffin_gold_economy" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitTrained = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_tier3_griffin_gold_economy" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitCreated = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_tier3_griffin_gold_economy" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
		},
		harmony_events = {
			CharacterSkillPointAllocated = function(context, monster, skill_key, effects, harmony_side, harmony)
				if harmony_side == "arimaspoi_side" and skill_key == "troy_mth_agent_griffin_skill_tier3_griffin_gold_economy" then
					mythic_monster_skills_functions.griffin_skill_bonuses_from_buildings_to_faction(context, monster, skill_key, effects, harmony_side, true)
				end
				
			end,
			ScriptEventGriffinHarmonyStateChanged = function(context, monster, skill_key, effects, harmony_side, harmony)
				if context.stored_table.new_state == "arimaspoi_side" and skill_key == "troy_mth_agent_griffin_skill_tier3_griffin_gold_economy" then
					mythic_monster_skills_functions.griffin_skill_bonuses_from_buildings_to_faction(context, monster, skill_key, effects, harmony_side, true)
				elseif context.stored_table.new_state ~= "arimaspoi_side" and skill_key == "troy_mth_agent_griffin_skill_tier3_griffin_gold_economy" then
					mythic_monster_skills_functions.griffin_skill_bonuses_from_buildings_to_faction(context, monster, skill_key, effects, harmony_side, false)
				end
			end,
		},
	},

	troy_mth_agent_griffin_skill_horde_tier3_griffin_gold_economy = {
		events = {
			CharacterSkillPointAllocated = function(context, monster, skill_key)
				if context:character():character_subtype_key() ~= monster.config.agent_subtype then 
					return
				end
				if skill_key == "troy_mth_agent_griffin_skill_horde_tier3_griffin_gold_economy" then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
					mythic_monster_skills_functions.griffin_harmony_for_skill(monster, "arimaspoi")
				end
			end,
			FactionTurnStart = function(context, monster, skill_key)
				out("FACTION TURN START FROM SKILLS " .. monster:id() .. " " .. tostring(monster.persistent.monster_cqi))
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_horde_tier3_griffin_gold_economy" and context:faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitCreated = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_horde_tier3_griffin_gold_economy" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitDisbanded = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_horde_tier3_griffin_gold_economy" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitMergedAndDestroyed = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_horde_tier3_griffin_gold_economy" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitTransferred = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_horde_tier3_griffin_gold_economy" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitTrained = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_horde_tier3_griffin_gold_economy" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitCreated = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_griffin_skill_horde_tier3_griffin_gold_economy" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
		},
		harmony_events = {
			CharacterSkillPointAllocated = function(context, monster, skill_key, effects, harmony_side, harmony)
				if harmony_side == "arimaspoi_side" and skill_key == "troy_mth_agent_griffin_skill_horde_tier3_griffin_gold_economy" then
					mythic_monster_skills_functions.griffin_skill_bonuses_from_buildings_to_faction(context, monster, skill_key, effects, harmony_side, true)
				end
				
			end,
			ScriptEventGriffinHarmonyStateChanged = function(context, monster, skill_key, effects, harmony_side, harmony)
				if context.stored_table.new_state == "arimaspoi_side" and skill_key == "troy_mth_agent_griffin_skill_horde_tier3_griffin_gold_economy" then
					mythic_monster_skills_functions.griffin_skill_bonuses_from_buildings_to_faction(context, monster, skill_key, effects, harmony_side, true)
				elseif context.stored_table.new_state ~= "arimaspoi_side" and skill_key == "troy_mth_agent_griffin_skill_horde_tier3_griffin_gold_economy" then
					mythic_monster_skills_functions.griffin_skill_bonuses_from_buildings_to_faction(context, monster, skill_key, effects, harmony_side, false)
				end
			end,
		},
	},

	troy_rem_agent_griffin_skill_horde_tier3_griffin_gold_economy = {
		events = {
			CharacterSkillPointAllocated = function(context, monster, skill_key)
				if context:character():character_subtype_key() ~= monster.config.agent_subtype then 
					return
				end
				if skill_key == "troy_rem_agent_griffin_skill_horde_tier3_griffin_gold_economy" then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
					mythic_monster_skills_functions.griffin_harmony_for_skill(monster, "arimaspoi")
				end
			end,
			FactionTurnStart = function(context, monster, skill_key)
				out("FACTION TURN START FROM SKILLS " .. monster:id() .. " " .. tostring(monster.persistent.monster_cqi))
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_rem_agent_griffin_skill_horde_tier3_griffin_gold_economy" and context:faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitCreated = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_rem_agent_griffin_skill_horde_tier3_griffin_gold_economy" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitDisbanded = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_rem_agent_griffin_skill_horde_tier3_griffin_gold_economy" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitMergedAndDestroyed = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_rem_agent_griffin_skill_horde_tier3_griffin_gold_economy" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitTransferred = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_rem_agent_griffin_skill_horde_tier3_griffin_gold_economy" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitTrained = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_rem_agent_griffin_skill_horde_tier3_griffin_gold_economy" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
			UnitCreated = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_rem_agent_griffin_skill_horde_tier3_griffin_gold_economy" and context:unit():faction() == faction then 
					mythic_monster_skills_functions.griffin_skill_bonuses_from_units_in_armies(context, monster, skill_key)
				end
			end,
		},
		harmony_events = {
			CharacterSkillPointAllocated = function(context, monster, skill_key, effects, harmony_side, harmony)
				if harmony_side == "arimaspoi_side" and skill_key == "troy_rem_agent_griffin_skill_horde_tier3_griffin_gold_economy" then
					mythic_monster_skills_functions.griffin_skill_bonuses_from_buildings_to_faction(context, monster, skill_key, effects, harmony_side, true)
				end
				
			end,
			ScriptEventGriffinHarmonyStateChanged = function(context, monster, skill_key, effects, harmony_side, harmony)
				if context.stored_table.new_state == "arimaspoi_side" and skill_key == "troy_rem_agent_griffin_skill_horde_tier3_griffin_gold_economy" then
					mythic_monster_skills_functions.griffin_skill_bonuses_from_buildings_to_faction(context, monster, skill_key, effects, harmony_side, true)
				elseif context.stored_table.new_state ~= "arimaspoi_side" and skill_key == "troy_rem_agent_griffin_skill_horde_tier3_griffin_gold_economy" then
					mythic_monster_skills_functions.griffin_skill_bonuses_from_buildings_to_faction(context, monster, skill_key, effects, harmony_side, false)
				end
			end,
		},
	},

	troy_mth_agent_griffin_skill_tier4_arimaspoi_attributes = {
		events = {
			CharacterSkillPointAllocated = function(context, monster, skill_key)
				if context:character():character_subtype_key() ~= monster.config.agent_subtype then 
					return
				end
				if skill_key == "troy_mth_agent_griffin_skill_tier4_arimaspoi_attributes" then 
					mythic_monster_skills_functions.griffin_harmony_for_skill(monster, "arimaspoi")
				end
			end,
		},
	},

	troy_mth_agent_griffin_skill_tier4_army_ability = {
		events = {
			CharacterSkillPointAllocated = function(context, monster, skill_key)
				if context:character():character_subtype_key() ~= monster.config.agent_subtype then 
					return
				end
				if skill_key == "troy_mth_agent_griffin_skill_tier4_army_ability" then 
					mythic_monster_skills_functions.griffin_harmony_for_skill(monster, "griffin")
				end
			end,
		},
	},

	troy_mth_agent_griffin_skill_tier4_harmony_units_buff = {
		events = {
			CharacterSkillPointAllocated = function(context, monster, skill_key)
				if context:character():character_subtype_key() ~= monster.config.agent_subtype then 
					return
				end
				if skill_key == "troy_mth_agent_griffin_skill_tier4_harmony_units_buff" then 
					mythic_monster_skills_functions.griffin_harmony_for_skill(monster, "harmony")
				end
			end,
		},
	},


	-- Hydra Scripted Skills
	troy_mth_agent_hydra_skill_tier2_building_buff = {
		events = {
			CharacterSkillPointAllocated = function(context, monster, skill_key)
				if context:character():character_subtype_key() ~= monster.config.agent_subtype then 
					return
				end
				if skill_key == "troy_mth_agent_hydra_skill_tier2_building_buff" then 
					mythic_monster_skills_functions.hydra_skill_tier2_building_unit_cap(context, monster, skill_key)
				end
			end,
			FactionTurnStart = function(context, monster, skill_key)
				out("FACTION TURN START FROM SKILLS " .. monster:id() .. " " .. tostring(monster.persistent.monster_cqi))
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_hydra_skill_tier2_building_buff" and context:faction() == faction then 
					mythic_monster_skills_functions.hydra_skill_tier2_building_unit_cap(context, monster, skill_key)
				end
			end,

			BuildingCompleted = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_hydra_skill_tier2_building_buff" and context:building():faction() == faction then
					mythic_monster_skills_functions.hydra_skill_tier2_building_unit_cap(context, monster, skill_key)
				end
			end,

			CharacterMilitaryForceBuildingCompleted = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_hydra_skill_tier2_building_buff" and context:building():faction() == faction then
					mythic_monster_skills_functions.hydra_skill_tier2_building_unit_cap(context, monster, skill_key)
				end
			end,

			BuildingDemolished = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_hydra_skill_tier2_building_buff" and context:building():faction() == faction then
					mythic_monster_skills_functions.hydra_skill_tier2_building_unit_cap(context, monster, skill_key)
				end
			end,

			CharacterMilitaryForceBuildingDemolished = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_hydra_skill_tier2_building_buff" and context:character():faction() == faction then
					mythic_monster_skills_functions.hydra_skill_tier2_building_unit_cap(context, monster, skill_key)
				end
			end,

			RegionFactionChangeEvent = function(context, monster, skill_key)
				local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)

				if skill_key == "troy_mth_agent_hydra_skill_tier2_building_buff" and context:previous_faction() == faction then
					mythic_monster_skills_functions.hydra_skill_tier2_building_unit_cap(context, monster, skill_key)
				end
			end,
		},
	},

	troy_mth_agent_hydra_skill_tier4_hydra_priest_buff = {
		events = {
			CharacterSkillPointAllocated = function(context, monster, skill_key)
				if context:character():character_subtype_key() ~= monster.config.agent_subtype then 
					return
				end
				local hydra = mythic_monster_skills_functions.get_monster_or_faction(monster, false)

					-- Removing unit abilities from Hydra, which are not meant for the Hydra, but the skill needed to enable for her for tooltop purposes
				if skill_key == "troy_mth_agent_hydra_skill_tier4_hydra_priest_buff" then
					cm:apply_effect_bundle_to_character("troy_mth_effect_bundle_hydra_remove_augment_with_poison", hydra:command_queue_index(), -1)
					cm:apply_effect_bundle_to_character("troy_mth_effect_bundle_hydra_remove_virulent_blood_drinkers", hydra:command_queue_index(), -1)
				end 
			end
		}
	},

	troy_mth_agent_hydra_skill_tier1_damage_and_poison_buff = {
		events = {
			CharacterSkillPointAllocated = function(context, monster, skill_key)
				if context:character():character_subtype_key() ~= monster.config.agent_subtype then 
					return
				end
				local hydra = mythic_monster_skills_functions.get_monster_or_faction(monster, false)

					-- Applying effect bundle that gives the Hydra its buffed unit abilities
				if skill_key == "troy_mth_agent_hydra_skill_tier1_damage_and_poison_buff" then
					cm:apply_effect_bundle_to_character("troy_mth_effect_bundle_hydra_skill_tier1_damage_and_poison_buff", hydra:command_queue_index(), -1)
				end 
			end
		}
	},


	-- Cerberus scripted skills
	troy_mth_agent_cerberus_skill_horde_tier3_soul_economy_upgrade = {
		events = {
			CharacterSkillPointAllocated = function(context, monster, skill_key)
				if context:character():character_subtype_key() ~= monster.config.agent_subtype then 
					return
				end
				local cerberus_faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)
					-- Applying effect bundle that provides War spoil bonuses to the faction so the script can find the effect.
				if skill_key == "troy_mth_agent_cerberus_skill_horde_tier3_soul_economy_upgrade" then
					cm:apply_effect_bundle("troy_mth_effect_bundle_horde_capture_bonus_mod_cerberus_hidden", cerberus_faction:name(), 0)
				end 
			end,
		}
	},
}




mythic_monster_skills_functions = {
	get_monster_or_faction = function(monster, get_faction)
		local character_family_member = cm:model():family_member_for_command_queue_index(monster.persistent.monster_cqi)

		if character_family_member:is_null_interface() then 
			out("Family member with CQI " .. monster.persistent.monster_cqi .. " does not exist!")
			return nil
		end

		local character = character_family_member:character()

		if not is_character(character) then
			out("Family member with CQI " .. monster.persistent.monster_cqi .. " does not have a character!")
			return nil
		end

		if not get_faction then
			return character
		else
			local faction = character:faction()
			if faction:is_null_interface() then 
				out("Family member with CQI " .. monster.persistent.monster_cqi .. " does not have a faction!")
				return nil
			else
				return faction
			end
		end
	end,

	griffin_skill_bonuses_from_units_in_armies = function(context, monster, skill_key, harmony_side_effects, harmony_side)
		local griffin_constant_army_bonuses_per_skill = {
			troy_mth_agent_griffin_skill_tier1_griffin_harmony_upgrade = {
				bundle_key = "troy_mth_griffin_effect_bundle_skill_tier1_harmony_upgrade",
				arimaspoi = {
					effect_key = "troy_mth_effect_battle_speed_to_all_units",
					effect_value = 10,
					effects_scope = "force_to_force_own",
				},
				griffin = {
					effect_key = "troy_mth_effect_morale_to_all_units",
					effect_value = 10,
					effects_scope = "force_to_force_own",
				},
			},
			troy_mth_agent_griffin_skill_horde_tier1_griffin_harmony_upgrade = {
				bundle_key = "troy_mth_griffin_effect_bundle_skill_tier1_harmony_upgrade",
				arimaspoi = {
					effect_key = "troy_mth_effect_battle_speed_to_all_units",
					effect_value = 10,
					effects_scope = "force_to_force_own",
				},
				griffin = {
					effect_key = "troy_mth_effect_morale_to_all_units",
					effect_value = 10,
					effects_scope = "force_to_force_own",
				},
			},
			troy_mth_agent_griffin_skill_tier3_griffin_harmony_army_upgrade = {
				bundle_key = "troy_mth_griffin_effect_bundle_skill_tier3_harmony_upgrade",
				arimaspoi = {	
					effect_key = "troy_mth_effect_griffin_campaign_movement_range",
					effect_value = 20,
					effects_scope = "force_to_force_own",
				},
				griffin = {
					effect_key = "troy_mth_effect_griffin_line_of_sight",
					effect_value = 20,
					effects_scope = "force_to_character_own_provincetext",
				},
			},
			troy_mth_agent_griffin_skill_horde_tier3_griffin_harmony_army_upgrade = {
				bundle_key = "troy_mth_griffin_effect_bundle_skill_tier3_harmony_upgrade_horde",
				arimaspoi = {	
					effect_key = "troy_mth_effect_griffin_campaign_movement_range",
					effect_value = 20,
					effects_scope = "force_to_force_own",
				},
				griffin = {
					effect_key = "troy_mth_effect_griffin_line_of_sight",
					effect_value = 20,
					effects_scope = "force_to_character_own_provincetext",
				},
			},
			troy_mth_agent_griffin_skill_tier3_griffin_gold_economy = {
				bundle_key = "troy_mth_griffin_effect_bundle_skill_tier3_griffin_gold_economy_constant_hidden",
				arimaspoi = {
					effect_key = "troy_mth_effect_post_battle_loot_arimaspoi",
					effect_value = 50,
					effects_scope = "force_to_character_own_provincetext"
				}
			},
			troy_mth_agent_griffin_skill_horde_tier3_griffin_gold_economy = {
				bundle_key = "troy_mth_griffin_effect_bundle_skill_tier3_griffin_gold_economy_constant_hidden",
				arimaspoi = {
					effect_key = "troy_mth_effect_post_battle_loot_arimaspoi",
					effect_value = 50,
					effects_scope = "force_to_character_own_provincetext"
				}
			},
			troy_rem_agent_griffin_skill_horde_tier3_griffin_gold_economy = {
				bundle_key = "troy_mth_griffin_effect_bundle_skill_tier3_griffin_gold_economy_constant_hidden",
				arimaspoi = {
					effect_key = "troy_mth_effect_post_battle_loot_arimaspoi",
					effect_value = 50,
					effects_scope = "force_to_character_own_provincetext"
				}
			},
			
		}

		local char_effect_arimaspoi = griffin_constant_army_bonuses_per_skill[skill_key].arimaspoi
		local char_effect_griffin = griffin_constant_army_bonuses_per_skill[skill_key].griffin

		local bar_effect_arimaspoi
		local bar_effect_griffin

		if harmony_side_effects and harmony_side_effects[harmony_side] then 
			for i, data in ipairs(harmony_side_effects[harmony_side]) do 
				if data.condition == "arimaspoi" then 
					bar_effect_arimaspoi = data
				elseif data.condition == "griffin" then
					bar_effect_griffin = data 
				end
			end
		end

		local custom_effect_bundle_key
		if harmony_side_effects then
			custom_effect_bundle_key = harmony_side_effects.base_bundle
		else
			custom_effect_bundle_key = griffin_constant_army_bonuses_per_skill[skill_key].bundle_key 
		end
			
		local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)
		local faction_mf_list = faction:military_force_list()

		local found_arimaspoi = false
		local found_griffins = false

		for i=0, faction_mf_list:num_items() -1 do 
			local curr_mf = faction_mf_list:item_at(i)
			local curr_mf_unit_list = curr_mf:unit_list()
			
			if curr_mf_unit_list:has_unit("troy_mth_gen_myth_arimaspoi_hunters") or curr_mf_unit_list:has_unit("troy_mth_gen_myth_arimaspoi_skirmishers") or curr_mf_unit_list:has_unit("troy_mth_gen_myth_arimaspoi_spearmen") then 
				found_arimaspoi = true
			end
			if curr_mf_unit_list:has_unit("troy_mth_gen_myth_lesser_griffin") or curr_mf_unit_list:has_unit("troy_mth_gen_myth_griffin") then 
				found_griffins = true
			end

			if found_arimaspoi or found_griffins then

				local cust_effect_bundle = cm:create_new_custom_effect_bundle(custom_effect_bundle_key)
				cust_effect_bundle:set_duration(0)

				if found_arimaspoi then 
					if char_effect_arimaspoi then 
						cust_effect_bundle:add_effect(char_effect_arimaspoi.effect_key, char_effect_arimaspoi.effects_scope, char_effect_arimaspoi.effect_value)
					end
					if bar_effect_arimaspoi then
						cust_effect_bundle:add_effect(bar_effect_arimaspoi.effect_key, bar_effect_arimaspoi.effects_scope, bar_effect_arimaspoi.effect_value)
					end
				end
				if found_griffins then 
					if char_effect_griffin then 
						cust_effect_bundle:add_effect(char_effect_griffin.effect_key, char_effect_griffin.effects_scope, char_effect_griffin.effect_value)
					end
					if bar_effect_griffin then
						cust_effect_bundle:add_effect(bar_effect_griffin.effect_key, bar_effect_griffin.effects_scope, bar_effect_griffin.effect_value)
					end
				end

				if found_arimaspoi or found_griffins then 
					cm:apply_custom_effect_bundle_to_force(cust_effect_bundle, curr_mf)
					out("CUSTOM EFFECT BUNDLE APPLIED FROM GRIFFIN SKILLS!!!")
					found_arimaspoi = false
					found_griffins = false
				end

			elseif not found_arimaspoi and not found_griffins and curr_mf:has_effect_bundle(custom_effect_bundle_key) then
				cm:remove_effect_bundle_from_force(custom_effect_bundle_key, curr_mf:command_queue_index())
			end
		end
	end,

	griffin_skill_bonuses_from_buildings_to_faction = function(context, monster, skill_key, harmony_side_effects, harmony_side, apply_effects)
	
		local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)
		local custom_effect_bundle_key = harmony_side_effects.base_bundle
		local provinces_with_both_chains = 0
		local found_griffin_building = 0
		local found_arimaspoi_building = 0

		if apply_effects then 

			if harmony_side_effects[harmony_side] then
				if faction:is_allowed_to_capture_territory() then 
					for i=0, faction:province_list():num_items() -1 do
						local found_griffin_chain = false
						local found_arimaspoi_chain = false
						local curr_province_region_list = faction:province_list():item_at(i):regions()

						for r=0, curr_province_region_list:num_items() - 1 do 
							local curr_region = curr_province_region_list:item_at(r)
							if cm:garrison_contains_building_chain(curr_region:garrison_residence(), "troy_mth_special_griffin") then 
								found_griffin_chain = true
								found_griffin_building = found_griffin_building + 1
							end
							if cm:garrison_contains_building_chain(curr_region:garrison_residence(), "troy_mth_special_griffin_arimaspoi") then
								found_arimaspoi_chain = true
								found_arimaspoi_building = found_arimaspoi_building + 1
							end
						end

						if found_griffin_chain and found_arimaspoi_chain then
							provinces_with_both_chains = provinces_with_both_chains + 1
						end
					end
				else
					for i=0, faction:military_force_list():num_items() -1 do
						local found_griffin_chain = false
						local found_arimaspoi_chain = false
						local curr_mf_building_list = faction:military_force_list():item_at(i):buildings()

						for r=0, curr_mf_building_list:num_items() - 1 do 
							local curr_building = curr_mf_building_list:item_at(r)
							if curr_building:chain() == "troy_mth_horde_special_griffin" then 
								found_griffin_chain = true
								found_griffin_building = found_griffin_building + 1
							end
							if curr_building:chain() == "troy_mth_horde_special_griffin_arimaspoi" then
								found_arimaspoi_chain = true
								found_arimaspoi_building = found_arimaspoi_building + 1
							end
						end

						if found_griffin_chain and found_arimaspoi_chain then
							provinces_with_both_chains = provinces_with_both_chains + 1
						end
					end
				end

				

				local cust_effect_bundle = cm:create_new_custom_effect_bundle(custom_effect_bundle_key)
				cust_effect_bundle:set_duration(0)
				if provinces_with_both_chains > 0 then 
					for i, data in ipairs(harmony_side_effects[harmony_side]) do
						if data.condition == "both" then
							cust_effect_bundle:add_effect(data.effect_key, data.effects_scope, provinces_with_both_chains * data.effect_value)
						end
					end
				end
				if found_griffin_building > 0 then 
					for i, data in ipairs(harmony_side_effects[harmony_side]) do
						if data.condition == "griffin" then 
							cust_effect_bundle:add_effect(data.effect_key, data.effects_scope, found_griffin_building * data.effect_value)
						end
					end
				end
				if found_arimaspoi_building > 0 then 
					for i, data in ipairs(harmony_side_effects[harmony_side]) do
						if data.condition == "arimaspoi" then 
							cust_effect_bundle:add_effect(data.effect_key, data.effects_scope, found_arimaspoi_building * data.effect_value)
						end
					end
				end

				cm:apply_custom_effect_bundle_to_faction(cust_effect_bundle, faction)
			else 
				return
			end
		elseif faction:has_effect_bundle(custom_effect_bundle_key) then
			cm:remove_effect_bundle(custom_effect_bundle_key, faction:name())
		end
	end,
	griffin_harmony_for_skill = function(monster, side)
		local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)
		local harmony_amount = 15
		if side == "griffin" then
			harmony_amount = harmony_amount * 1
		elseif side == "arimaspoi"then
			harmony_amount = harmony_amount * -1
		elseif side == "harmony" then
			local current_harmony = faction:pooled_resource(monster.config.harmony_resource):value()

			harmony_amount = monster:calcuate_harmony_towards_the_middle(harmony_amount, current_harmony)
		else
			script_error("Error: mythic_monster_skills_functions.griffin_harmony_for_skill() called, but no side was supplied.")
		end
		
		cm:faction_add_pooled_resource(faction:name(), monster.config.harmony_resource, "troy_mth_resource_factor_skills", harmony_amount)
	end,

	hydra_skill_tier2_building_unit_cap = function(context, monster, skill_key)
		local faction = mythic_monster_skills_functions.get_monster_or_faction(monster, true)
		local custom_effect_bundle_key = "troy_mth_hydra_effect_bundle_skill_tier2_buidling_buff_dummy"
		local effect_key_archers = "troy_mth_effect_unit_capacity_hydra_archers"
		local effect_key_defenders = "troy_mth_effect_unit_capacity_hydra_defenders"
		local effect_key_kletnici = "troy_mth_effect_unit_capacity_hydra_drinkers_of_venom"
		local effect_key_priests = "troy_mth_effect_unit_capacity_hydra_priest"
		local unit_cap_additive_bonus = 2

		local found_hydra_archers = 0
		local found_hydra_defenders = 0
		local found_hydra_kletnici = 0
		local found_hydra_priests  = 0

		if not faction:is_allowed_to_capture_territory() then
			local force_list = faction:military_force_list()
			for i=0, force_list:num_items() -1 do
				local curr_force = force_list:item_at(i)
				local building_list = curr_force:buildings()
				for i=0, building_list:num_items() - 1 do
					local curr_building = building_list:item_at(i)
					if curr_building:chain() == "troy_mth_horde_special_hydra_archers" then
						found_hydra_archers = found_hydra_archers + 1
					end
				end
				for i=0, building_list:num_items() - 1 do
					local curr_building = building_list:item_at(i)
					if curr_building:chain() == "troy_mth_horde_special_hydra_defenders" then
						found_hydra_defenders = found_hydra_defenders + 1
					end
				end
				for i=0, building_list:num_items() - 1 do
					local curr_building = building_list:item_at(i)
					if curr_building:chain() == "troy_mth_horde_special_hydra_drinkers_of_venom" then
						found_hydra_kletnici = found_hydra_kletnici + 1
					end
				end
				for i=0, building_list:num_items() - 1 do
					local curr_building = building_list:item_at(i)
					if curr_building:chain() == "troy_mth_horde_special_hydra_priest" then
						found_hydra_priests = found_hydra_priests + 1
					end
				end
			end
		else
			for i=0, faction:region_list():num_items() -1 do
				local curr_region = faction:region_list():item_at(i)
				if cm:garrison_contains_building_chain(curr_region:garrison_residence(), "troy_mth_special_hydra_archers") then 
					found_hydra_archers = found_hydra_archers + 1
				end
				if cm:garrison_contains_building_chain(curr_region:garrison_residence(), "troy_mth_special_hydra_defenders") then 
					found_hydra_defenders = found_hydra_defenders + 1
				end
				if cm:garrison_contains_building_chain(curr_region:garrison_residence(), "troy_mth_special_hydra_drinkers_of_venom") then 
					found_hydra_kletnici = found_hydra_kletnici + 1
				end
				if cm:garrison_contains_building_chain(curr_region:garrison_residence(), "troy_mth_special_hydra_priest") then 
					found_hydra_priests = found_hydra_priests + 1
				end
			end
		end

		

		local cust_effect_bundle = cm:create_new_custom_effect_bundle(custom_effect_bundle_key)
		cust_effect_bundle:set_duration(0)
		if found_hydra_archers > 0 then 
				cust_effect_bundle:add_effect(effect_key_archers, "faction_to_faction_own", found_hydra_archers * unit_cap_additive_bonus)
		end
		if found_hydra_defenders > 0 then 
				cust_effect_bundle:add_effect(effect_key_defenders, "faction_to_faction_own", found_hydra_defenders * unit_cap_additive_bonus)
		end
		if found_hydra_kletnici > 0 then 
			cust_effect_bundle:add_effect(effect_key_kletnici, "faction_to_faction_own", found_hydra_kletnici * unit_cap_additive_bonus)
		end
		if found_hydra_priests > 0 then 
			cust_effect_bundle:add_effect(effect_key_priests, "faction_to_faction_own", found_hydra_priests * unit_cap_additive_bonus)
		end
		cm:remove_effect_bundle(custom_effect_bundle_key, faction:name())
		cm:apply_custom_effect_bundle_to_faction(cust_effect_bundle, faction)
	end,
}

mythic_monster_skills = {
	config = {
		skill_data = skill_data,
		id = "mythic_monster_skills"
	},

	persistent = {
		active_skills = {},
	},

	setup_harmony_effects = function(self, griffin, skill, effects, harmony_side, harmony, skillpoint_picked_context)
		local events = self.config.skill_data[skill].harmony_events
		if not is_table(events) then return end

		for event_name, listener in pairs(events) do
			if event_name == "CharacterSkillPointAllocated" then
				listener(skillpoint_picked_context, griffin, skill, effects, harmony_side, harmony)
			else
				core:add_listener(
					event_name .. "_" .. skill .. "_harmony_listener",
					event_name,
					function(context)
						return true
					end,
					function(context)
						listener(context, griffin, skill, effects, harmony_side, harmony)
					end,
					true
				)
			end
		end
		if is_loading then
			return
		end
	end,

	add_listeners_for_monster_skill = function(self, monster, skill_key, is_loading)
		local events = self.config.skill_data[skill_key].events
		if not is_table(events) then return end

		for event_name, listener in pairs(events) do
			local should_persist  = true
			if event_name == "CharacterSkillPointAllocated" then
				should_persist = false
			end
			core:add_listener(
				event_name .. "_" .. skill_key .. "_listener",
				event_name,
				function(context)
					return true
				end,
				function(context)
					listener(context, monster, skill_key)
				end,
				should_persist
			)
		end
		if is_loading then
			return
		end
		table.insert(self.persistent.active_skills, skill_key)
	end,

	on_first_tick = function(self, context, monster)
		for _, skill_key in pairs(self.persistent.active_skills) do
			self:add_listeners_for_monster_skill(monster, skill_key, true)
		end
	end
}