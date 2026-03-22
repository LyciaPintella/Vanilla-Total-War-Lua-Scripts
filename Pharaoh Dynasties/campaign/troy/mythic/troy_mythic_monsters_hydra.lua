out("Loading troy_mythic_monsters_hydra.lua")

-- the hydra is still in development and placeholder records are in use, so the logic is disabled for now:
-- if true then
-- 	out("troy_mythic_monsters_hydra.lua - DEACTIVATED")
-- 	return nil
-- end

-- ================================================================================================================================================ 
-- ==================================================================== CONFIG ====================================================================
-- ================================================================================================================================================ 

mythic_monster_hydra_config = {
	id = "MYTHIC_MONSTER_HYDRA",
	key = "hydra",
	agent_type = "wizard",
	agent_subtype = "troy_mth_agent_hydra",

	-- army with HYDRA acquired stance
	army_stance = "MILITARY_FORCE_ACTIVE_STANCE_TYPE_FEED_HYDRA",
	army_stance_vitality_per_turn_per_unit = 3,
	army_stance_min_units = 3,
	army_stance_min_units_tooltip = "random_localisation_strings_string_troy_mth_hydra_stance_unit_requirement",
	army_stance_min_units_tooltip_component = { "list_parent", "dy_description_textbox_copy_2" },
	army_stance_bundle = "effect_bundle_military_force_active_stance_type_feed_hydra",
	-- to last string "button_" will be concatenated the army_stance string
	army_stance_button = { "CharacterInfoPopup", "button_" },

	-- prebattle applay HYDRA bundle to army
	bundle_vitality_cost = 25,
	bundle_vitality_cost_factor = "troy_resource_factor_character",
	bundle_key = "troy_mth_effect_bundle_hydra_pre_battle_agent_action", 
	bundle_value_mod_by_skill = {
		troy_mth_agent_hydra_skill_tier4_hydra_pre_battle_buff = { 
			troy_effect_damage_reduction_all = 10,
 			troy_mth_effect_hydra_pre_battle_regeneration_to_all_units = 1,
 		}
	},
	apply_bundle_button_id = "button_hydra_action",
	apply_bundle_button_location = { "button_set_attack" },
	apply_bundle_button_siege_location = { "button_set_siege" },

	-- vitality
	vitality_key = "troy_mth_vitality",
	vitality_loosing_battle_factor = "troy_resource_factor_battles",
	vitality_loosing_battle_cost = 10,
	vitality_building_factor = "troy_mth_resource_factor_buildings",
	vitality_from_building_effect = "troy_mth_effect_economy_mod_vitality_dummy",

	unit_key = "troy_mth_gen_myth_hydra",
	panel_background = "hydra",
	hydra_bar_id = "hydra_bar",
	panel_flavour_text = "ui_text_replacements_localised_text_hp_desc_unit_hydra",
	unit_category_icon = "UI/common ui/unit_category_icons/troy_mth_hydra.png",
	monster_button_icon = "UI/skins/default/troy_mth_hydra_button.png",
	agent_resource_cost = "troy_mythic_monster_cost",
	battle_skills = {
		[1] = "troy_mth_hydra_poison_bomb",
		[2] = "troy_mth_hydra_poison_breath",
		[3] = "troy_mth_hydra_virulent_blood",
	},
	unlockable_units = {
		{ key = "troy_mth_gen_myth_drinkers_venom", antagonist = { initial_count = 4, replenish_chance_perc = 80, }, },
		{ key = "troy_mth_gen_myth_hydra_defenders", antagonist = { initial_count = 2, replenish_chance_perc = 25, }, },
		{ key = "troy_mth_gen_myth_hydra_archers", antagonist = { initial_count = 2, replenish_chance_perc = 30, }, },
		{ key = "troy_mth_gen_myth_hydra_priest", antagonist = { initial_count = 1, replenish_chance_perc = 10, }, },
	},
	display_buildings = {
		default = {
			[1] = {
				building_level_key = "troy_mth_special_hydra_drinkers_of_venom_1",
				culture_variant_key = "troy_mth_special_hydra_drinkers_of_venom_1",
			},
			[2] = {
				building_level_key = "troy_mth_special_hydra_defenders_1",
				culture_variant_key = "troy_mth_special_hydra_defenders_1",
			},
			[3] = {
				building_level_key = "troy_mth_special_hydra_archers_1",
				culture_variant_key = "troy_mth_special_hydra_archers_1",
			},
			[4] = {
				building_level_key = "troy_mth_special_hydra_priest_3",
				culture_variant_key = "troy_mth_special_hydra_priest_3",
			},
		},
		-- faction specific
		troy_amazons_trj_penthesilea = {
			[1] = {
				building_level_key = "troy_mth_horde_special_hydra_drinkers_of_venom_1",
				culture_variant_key = "troy_mth_horde_special_hydra_drinkers_of_venom_1",
			},
			[2] = {
				building_level_key = "troy_mth_horde_special_hydra_defenders_1",
				culture_variant_key = "troy_mth_horde_special_hydra_defenders_1",
			},
			[3] = {
				building_level_key = "troy_mth_horde_special_hydra_archers_1",
				culture_variant_key = "troy_mth_horde_special_hydra_archers_1",
			},
			[4] = {
				building_level_key = "troy_mth_horde_special_hydra_priest_3",
				culture_variant_key = "troy_mth_horde_special_hydra_priest_3",
			},
		},
		troy_rem_horde_aethiopians = {
			[1] = {
				building_level_key = "troy_mth_horde_special_hydra_drinkers_of_venom_1",
				culture_variant_key = "troy_mth_horde_special_hydra_drinkers_of_venom_1",
			},
			[2] = {
				building_level_key = "troy_mth_horde_special_hydra_defenders_1",
				culture_variant_key = "troy_mth_horde_special_hydra_defenders_1",
			},
			[3] = {
				building_level_key = "troy_mth_horde_special_hydra_archers_1",
				culture_variant_key = "troy_mth_horde_special_hydra_archers_1",
			},
			[4] = {
				building_level_key = "troy_mth_horde_special_hydra_priest_3",
				culture_variant_key = "troy_mth_horde_special_hydra_priest_3",
			},
		},
	},
	unlockable_buildings = {
		default = {
			[1] = {
				building_level_key = "troy_mth_special_hydra_drinkers_of_venom_1",
				culture_variant_key = "troy_mth_special_hydra_drinkers_of_venom_1",
			},
			[2] = {
				building_level_key = "troy_mth_special_hydra_drinkers_of_venom_3",
				culture_variant_key = "troy_mth_special_hydra_drinkers_of_venom_3",
			},
			[3] = {
				building_level_key = "troy_mth_special_hydra_archers_1",
				culture_variant_key = "troy_mth_special_hydra_archers_1",
			},
			[4] = {
				building_level_key = "troy_mth_special_hydra_archers_3",
				culture_variant_key = "troy_mth_special_hydra_archers_3",
			},
			[5] = {
				building_level_key = "troy_mth_special_hydra_defenders_1",
				culture_variant_key = "troy_mth_special_hydra_defenders_1",
			},
			[6] = {
				building_level_key = "troy_mth_special_hydra_defenders_3",
				culture_variant_key = "troy_mth_special_hydra_defenders_3",
			},
			[7] = {
				building_level_key = "troy_mth_special_hydra_priest_3",
				culture_variant_key = "troy_mth_special_hydra_priest_3",
			},
			[8] = {
				building_level_key = "troy_mth_special_hydra_priest_5",
				culture_variant_key = "troy_mth_special_hydra_priest_5",
			},
		},
		-- faction specific
		troy_amazons_trj_penthesilea = {
			[1] = {
				building_level_key = "troy_mth_horde_special_hydra_drinkers_of_venom_1",
				culture_variant_key = "troy_mth_horde_special_hydra_drinkers_of_venom_1",
			},
			[2] = {
				building_level_key = "troy_mth_horde_special_hydra_drinkers_of_venom_3",
				culture_variant_key = "troy_mth_horde_special_hydra_drinkers_of_venom_3",
			},
			[3] = {
				building_level_key = "troy_mth_horde_special_hydra_archers_1",
				culture_variant_key = "troy_mth_horde_special_hydra_archers_1",
			},
			[4] = {
				building_level_key = "troy_mth_horde_special_hydra_archers_3",
				culture_variant_key = "troy_mth_horde_special_hydra_archers_3",
			},
			[5] = {
				building_level_key = "troy_mth_horde_special_hydra_defenders_1",
				culture_variant_key = "troy_mth_horde_special_hydra_defenders_1",
			},
			[6] = {
				building_level_key = "troy_mth_horde_special_hydra_defenders_3",
				culture_variant_key = "troy_mth_horde_special_hydra_defenders_3",
			},
			[7] = {
				building_level_key = "troy_mth_horde_special_hydra_priest_3",
				culture_variant_key = "troy_mth_horde_special_hydra_priest_3",
			},
			[8] = {
				building_level_key = "troy_mth_horde_special_hydra_priest_5",
				culture_variant_key = "troy_mth_horde_special_hydra_priest_5",
			},
		},
		troy_rem_horde_aethiopians = {
			[1] = {
				building_level_key = "troy_mth_horde_special_hydra_drinkers_of_venom_1",
				culture_variant_key = "troy_mth_horde_special_hydra_drinkers_of_venom_1",
			},
			[2] = {
				building_level_key = "troy_mth_horde_special_hydra_drinkers_of_venom_3",
				culture_variant_key = "troy_mth_horde_special_hydra_drinkers_of_venom_3",
			},
			[3] = {
				building_level_key = "troy_mth_horde_special_hydra_archers_1",
				culture_variant_key = "troy_mth_horde_special_hydra_archers_1",
			},
			[4] = {
				building_level_key = "troy_mth_horde_special_hydra_archers_3",
				culture_variant_key = "troy_mth_horde_special_hydra_archers_3",
			},
			[5] = {
				building_level_key = "troy_mth_horde_special_hydra_defenders_1",
				culture_variant_key = "troy_mth_horde_special_hydra_defenders_1",
			},
			[6] = {
				building_level_key = "troy_mth_horde_special_hydra_defenders_3",
				culture_variant_key = "troy_mth_horde_special_hydra_defenders_3",
			},
			[7] = {
				building_level_key = "troy_mth_horde_special_hydra_priest_3",
				culture_variant_key = "troy_mth_horde_special_hydra_priest_3",
			},
			[8] = {
				building_level_key = "troy_mth_horde_special_hydra_priest_5",
				culture_variant_key = "troy_mth_horde_special_hydra_priest_5",
			},
		},
	},
	overview_panel = {
		feature_1 = {
			title = "ui_text_replacements_localised_text_troy_mth_monster_selection_hydra_feature_vitality_title",
			infotext = "ui_text_replacements_localised_text_troy_mth_monster_selection_hydra_feature_vitality_long_desc",
		},
		feature_2 = {
			title = "ui_text_replacements_localised_text_troy_mth_monster_selection_hydra_feature_buildings_title",
			infotext = "ui_text_replacements_localised_text_troy_mth_monster_selection_hydra_feature_buildings_long_desc",
		},
		feature_3 = {
			title = "ui_text_replacements_localised_text_troy_mth_monster_selection_hydra_feature_feast_title",
			infotext = "ui_text_replacements_localised_text_troy_mth_monster_selection_hydra_feature_feast_long_desc",
		},
	},
	monster_progression = {
		default = {
			[1] = {
				node_id = "node_1",
				rank_req = 2,
				skills = {
					[1] = "troy_mth_agent_hydra_skill_tier1_damage_and_poison_buff",
					[2] = "troy_mth_agent_hydra_skill_tier1_healt_and_regeneration_buff",
					[3] = "troy_mth_agent_hydra_skill_tier1_vitality_buff",
				},
			},
			[2] = {
				node_id = "node_2",
				rank_req = 3,
				skills = {
					[1] = "troy_mth_agent_hydra_skill_tier2_building_buff",
					[2] = "troy_mth_agent_hydra_skill_tier2_drinkers_of_venom_new_skill",
					[3] = "troy_mth_agent_hydra_skill_tier2_hydra_virulent_blood_aura",
				},
			},
			[3] = {
				node_id = "node_3",
				rank_req = 4,
				skills = {
					[1] = "troy_mth_agent_hydra_skill_tier3_hydra_artillery_buff_1",
					[2] = "troy_mth_agent_hydra_skill_tier3_hydra_artillery_buff_2",
					[3] = "troy_mth_agent_hydra_skill_tier3_hydra_lost_health_passive_ability",
				},
			},
			[4] = {
				node_id = "node_4",
				rank_req = 5,
				skills = {
					[1] = "troy_mth_agent_hydra_skill_tier4_hydra_and_units_attribute_buff",
					[2] = "troy_mth_agent_hydra_skill_tier4_hydra_pre_battle_buff",
					[3] = "troy_mth_agent_hydra_skill_tier4_hydra_priest_buff",
				},
			},
		},
		troy_amazons_trj_penthesilea = {
			[1] = {
				node_id = "node_1",
				rank_req = 2,
				skills = {
					[1] = "troy_mth_agent_hydra_skill_tier1_damage_and_poison_buff",
					[2] = "troy_mth_agent_hydra_skill_tier1_healt_and_regeneration_buff",
					[3] = "troy_mth_agent_hydra_skill_tier1_vitality_buff_horde",
				},
			},
			[2] = {
				node_id = "node_2",
				rank_req = 3,
				skills = {
					[1] = "troy_mth_agent_hydra_skill_tier2_building_buff",
					[2] = "troy_mth_agent_hydra_skill_tier2_drinkers_of_venom_new_skill",
					[3] = "troy_mth_agent_hydra_skill_tier2_hydra_virulent_blood_aura",
				},
			},
			[3] = {
				node_id = "node_3",
				rank_req = 4,
				skills = {
					[1] = "troy_mth_agent_hydra_skill_tier3_hydra_artillery_buff_1",
					[2] = "troy_mth_agent_hydra_skill_tier3_hydra_artillery_buff_2",
					[3] = "troy_mth_agent_hydra_skill_tier3_hydra_lost_health_passive_ability",
				},
			},
			[4] = {
				node_id = "node_4",
				rank_req = 5,
				skills = {
					[1] = "troy_mth_agent_hydra_skill_tier4_hydra_and_units_attribute_buff",
					[2] = "troy_mth_agent_hydra_skill_tier4_hydra_pre_battle_buff",
					[3] = "troy_mth_agent_hydra_skill_tier4_hydra_priest_buff",
				},
			},
		},
		troy_rem_horde_aethiopians = {
			[1] = {
				node_id = "node_1",
				rank_req = 2,
				skills = {
					[1] = "troy_mth_agent_hydra_skill_tier1_damage_and_poison_buff",
					[2] = "troy_mth_agent_hydra_skill_tier1_healt_and_regeneration_buff",
					[3] = "troy_mth_agent_hydra_skill_tier1_vitality_buff_horde",
				},
			},
			[2] = {
				node_id = "node_2",
				rank_req = 3,
				skills = {
					[1] = "troy_mth_agent_hydra_skill_tier2_building_buff",
					[2] = "troy_mth_agent_hydra_skill_tier2_drinkers_of_venom_new_skill",
					[3] = "troy_mth_agent_hydra_skill_tier2_hydra_virulent_blood_aura",
				},
			},
			[3] = {
				node_id = "node_3",
				rank_req = 4,
				skills = {
					[1] = "troy_mth_agent_hydra_skill_tier3_hydra_artillery_buff_1",
					[2] = "troy_mth_agent_hydra_skill_tier3_hydra_artillery_buff_2",
					[3] = "troy_mth_agent_hydra_skill_tier3_hydra_lost_health_passive_ability",
				},
			},
			[4] = {
				node_id = "node_4",
				rank_req = 5,
				skills = {
					[1] = "troy_mth_agent_hydra_skill_tier4_hydra_and_units_attribute_buff",
					[2] = "troy_mth_agent_hydra_skill_tier4_hydra_pre_battle_buff",
					[3] = "troy_mth_agent_hydra_skill_tier4_hydra_priest_buff",
				},
			},
		},
	},
	monster_effects = {
		effects_from_buildings = {
		},
		skill_effects = {
		},
		stance_effects = {
		},
	},
	hydra_vitality = {
		[1] = {
			bundle = "troy_mth_effect_bundle_hydra_vitality_tier_0",
			min = 0,
			max = 25,
		},
		[2] = {
			bundle = "troy_mth_effect_bundle_hydra_vitality_tier_1",
			min = 26,
			max = 50,
		},
		[3] = {
			bundle = "troy_mth_effect_bundle_hydra_vitality_tier_2",
			min = 51,
			max = 75,
		},
		[4] = {
			bundle = "troy_mth_effect_bundle_hydra_vitality_tier_3",
			min = 76,
			max = 100,
		},
		[5] = {
			bundle = "troy_mth_effect_bundle_hydra_vitality_tier_4",
			min = 101,
			max = 125,
		},
		[6] = {
			bundle = "troy_mth_effect_bundle_hydra_vitality_tier_5",
			min = 126,
			max = 150,
		}
	},

	-- custom enable&disable special abilities when two skills are unlocked
	virulend_blood_setup = {
		-- check for these skills
		skill_1 = "troy_mth_agent_hydra_skill_tier1_damage_and_poison_buff",
		skill_2 = "troy_mth_agent_hydra_skill_tier2_hydra_virulent_blood_aura",
		-- if skill_1 and skill_2 are active then apply the folowing effect-bundle
		bundle = "troy_mth_effect_bundle_hydra_virulent_blood_combination",
	},

	agent_actions = {
		{
			id = "troy_mth_agent_action_record_hydra_assist_settlement",
			agent_options_panel_customization = { cost_tooltip = "ui_text_replacements_localised_text_troy_mth_hydra_agent_action_cost", },
		},
	},

	-- Table keys should be ability keys, while prerequisites items should be character skill keys that would grant the respective ability.
	-- NOTE: Priorities should all be unique and greater than 0.
	skill_upgrades = {
		troy_mth_hydra_virulent_blood = {
			troy_mth_hydra_virulent_blood_poison_buff = { priority = 70, prerequisites = { "troy_mth_agent_hydra_skill_tier1_damage_and_poison_buff", }, },
			troy_mth_hydra_virulent_blood_aura_upgrade = { priority = 80, prerequisites = { "troy_mth_agent_hydra_skill_tier2_hydra_virulent_blood_aura", }, },
			troy_mth_hydra_virulent_blood_combined_upgrade = { priority = 90, prerequisites = { "troy_mth_agent_hydra_skill_tier1_damage_and_poison_buff", "troy_mth_agent_hydra_skill_tier2_hydra_virulent_blood_aura", }, },
		},
		troy_mth_hydra_poison_breath = {
			troy_mth_hydra_poison_breath_poison_buff = { priority = 100, prerequisites = {"troy_mth_agent_hydra_skill_tier1_damage_and_poison_buff", }, },
		},
		troy_mth_hydra_poison_bomb = {
			troy_mth_hydra_poison_bomb_poison_buff = { priority = 100, prerequisites = {"troy_mth_agent_hydra_skill_tier1_damage_and_poison_buff", }, },
		} 
	},
}


-- ================================================================================================================================================ 
-- ================================================================== SCRIPTING ===================================================================
-- ================================================================================================================================================ 

mythic_monster_hydra_config.army_stance_button[#mythic_monster_hydra_config.army_stance_button] = mythic_monster_hydra_config.army_stance_button[#mythic_monster_hydra_config.army_stance_button]..mythic_monster_hydra_config.army_stance

-- local helper functions
local DEBUG = true
local function output(str, force_out)
	if DEBUG or force_out then
		out(mythic_monster_hydra_config.id..": "..(str or "nil"))
	end
end

local function err(str)
	output("ERROR - "..(str or "unknown"), true)
end

mythic_monster_hydra = {
	-- config
	config = mythic_monster_hydra_config,

	-- persistent data 
	persistent = {
		monster_cqi = false,
		unlocked_tiers = {},
		pre_battle_bundle_applied = false,
	},

	-- events
	events = {
		-- model
		AgentEntersMilitaryForce = function(self, context)
			local character = context:character()
			if not character or character:is_null_interface() or not character:character_subtype(self.config.agent_subtype) then
				return 
			end

			local military_force = context:military_force()
			if not military_force or military_force:is_null_interface() then
				return 
			end

			output("Hydra enetred army, activating stance ("..self.config.army_stance..") to force")
			cm:activate_stance_to_force(true, self.config.army_stance, military_force:command_queue_index())
		end,

		-- model
		AgentLeavesMilitaryForce = function(self, context)
			local character = context:character()
			if not character or character:is_null_interface() or not character:character_subtype(self.config.agent_subtype) then
				return 
			end

			local military_force = context:military_force()
			if not military_force or military_force:is_null_interface() then
				return 
			end

			output("Hydra leaved army, deactivating stance ("..self.config.army_stance..") to force")
			cm:activate_stance_to_force(false, self.config.army_stance, military_force:command_queue_index())
		end,

		-- model
		BattleCompleted = function(self, context)
			local battle = context:pending_battle()
			if battle:is_null_interface() then return end

			local unlocked_for_attacker = self:unlocked(battle:attacker_faction():name())
			local unlocked_for_defender = self:unlocked(battle:defender_faction():name())

			-- remove pre-battle bundle
			if unlocked_for_attacker or unlocked_for_defender then
				self:remove_pre_battle_bundle()
			else
				return
			end

			local battle_results = battle:battle_results()
			if battle_results:is_null_interface() then return end

			local loosing_faction_key = battle_results:losing_faction_key()

			-- check if the loosing faction has unlocked HYDRA
			if not self:unlocked(loosing_faction_key) then return end

			local loosing_commander = false
			
			local attacker = battle:has_attacker() and battle:attacker()
			if attacker and attacker:faction():name() == losing_faction_key then
				loosing_commander = attacker
			end

			if not loosing_commander then
				local defender = battle:has_defender() and battle:defender()
				if defender and defender:faction():name() == losing_faction_key then
					loosing_commander = attacker
				end
			end
			if not loosing_commander then return end

			if is_table(self:has_hydra_in_army(loosing_commander)) then
				cm:faction_add_pooled_resource(loosing_faction_key, self.config.vitality_key, self.config.vitality_loosing_battle_factor, self.config.vitality_loosing_battle_cost * -1)
			end
		end,

		-- model
		FactionTurnStart = function(self, context)
			if not self:unlocked(context.string) then return end

			-- remove pre-battle bundle
			self:remove_pre_battle_bundle()

			-- gain vitality per turn per unit if there is a faction army in "feed hydra" stance
			local faction = cm:get_faction(context.string)
			if faction and not faction:is_dead() then
				local military_force_list = faction:military_force_list()
				if military_force_list and not military_force_list:is_empty() then

					local num_forces = military_force_list:num_items()
					for i = 0, num_forces-1 do
						local military_force = military_force_list:item_at(i)
						if military_force and not military_force:is_null_interface() then
							if military_force:active_stance() == self.config.army_stance then

								local vitality_gain = self.config.army_stance_vitality_per_turn_per_unit * ( military_force:unit_list():num_items() - 1 )

								cm:faction_add_pooled_resource(context.string, self.config.vitality_key, self.config.bundle_vitality_cost_factor, vitality_gain)

								output("Army stance vitality per turn gained: "..vitality_gain)

								break
							end
						end
					end

				end
			end

		end,

		-- UI
		PanelOpenedCampaign = function(self, context)
			if not self:unlocked() then return end

			if context.string == "popup_pre_battle" then
				mythic_monster_hydra:on_prebattle_panel_opened(cm:get_local_faction_name(true), cm:model())
			end
		end,

		ComponentLClickUp = function(self, context)
			if not context.string == self.config.apply_bundle_button_id then return end

			local apply_bundle_button = UIComponent(context.component)
			if not apply_bundle_button then return end

			local hydra_cqi = apply_bundle_button:GetProperty("hydra_cqi")
			if not hydra_cqi or hydra_cqi == "" then return end

			local commander_cqi = apply_bundle_button:GetProperty("commander_cqi")
			if not commander_cqi or commander_cqi == "" then return end

			if is_table(self.persistent.pre_battle_bundle_applied) then return end

			self.persistent.pre_battle_bundle_applied = { hydra_cqi = hydra_cqi, commander_cqi = commander_cqi }

			-- tooltip & state
			self:update_pre_battle_bundle_button(apply_bundle_button)

			-- trigger Campaign Script Event
			local faction = cm:get_faction(cm:get_local_faction_name(true))
			CampaignUI.TriggerCampaignScriptEvent(faction:command_queue_index(), self:id("_TCSE")..",".."APPLY_BUNDLE"..","..hydra_cqi..","..commander_cqi)
		end,

		-- TriggerCampaignScriptEvent - UI to MODEL
		UITriggerScriptEvent = function(self, context)
			if not self:unlocked() then return end

			local args = context:trigger():split(",")

			if #args == 3 and args[1] == "ArmyStanceTooltipCreated" and args[2] == self.config.army_stance_button[#self.config.army_stance_button] then

				local hydra_stance_button = core:get_ui_root():SequentialFind(unpack(self.config.army_stance_button))
				if not hydra_stance_button or hydra_stance_button:CurrentState() ~= "inactive" then return end 

				local stance_tooltip_component = core:get_ui_root():SequentialFind(args[3])
				if not stance_tooltip_component then return end

				local title_component = stance_tooltip_component:SequentialFind(unpack(self.config.army_stance_min_units_tooltip_component))
				if not title_component then return end

				local stance_tooltip_string = string.format(common.get_localised_string(self.config.army_stance_min_units_tooltip), self.config.army_stance_min_units)

				title_component:SetText(stance_tooltip_string)

			elseif #args == 2 and args[1] == "ArmyStanceButtonsCreated" then

				local commander_cqi = tonumber(args[2])
				local commander = cm:get_character_by_cqi(commander_cqi)
				if not commander or not self:has_hydra_in_army(commander) then return end

				local hydra_stance_button = core:get_ui_root():SequentialFind(unpack(self.config.army_stance_button))
				if not hydra_stance_button then return end

				local military_force = commander:has_military_force() and commander:military_force()
				if not military_force or military_force:is_null_interface() then return end

				local unit_list = military_force:unit_list()
				local unit_count = unit_list:num_items()

				if unit_count - 1 < self.config.army_stance_min_units then
					hydra_stance_button:SetState("inactive")
				end

			elseif #args == 4 and args[1] == self:id("_TCSE") and args[2] == "APPLY_BUNDLE" then

				local hydra_cqi = tonumber(args[3])
				local hydra = cm:get_character_by_cqi(hydra_cqi)
				local commander_cqi = tonumber(args[4])
				local commander = cm:get_character_by_cqi(commander_cqi)
				self:apply_army_effect_bundle(hydra, commander)
				
			end

		end,

		CharacterTurnEnd = function(self, context)
			local hydra = context:character()
			if not hydra or hydra:is_null_interface() or not hydra:character_subtype(self.config.agent_subtype) then
				return
			end 

			if not hydra:has_region() then 
				return
			end

			local hydra_faction = hydra:faction()
			local hydra_region = hydra:region()
			local hydra_province = hydra_region:province()

			
			-- Checking if the Hydra is in a province with buildings providing Vitality and if so, applying it
			if not hydra_faction:is_allowed_to_capture_territory() then
				for i=0, hydra_province:regions():num_items() - 1 do
					local curr_region = hydra_province:regions():item_at(i)
					local chars_at_curr_region = curr_region:characters_in_region()				
					for i = 0, chars_at_curr_region:num_items() -1 do
						curr_character = chars_at_curr_region:item_at(i)
						if curr_character:has_military_force() and curr_character:faction() == hydra_faction then
							local building_list = curr_character:military_force():buildings()
							for i = 0, building_list:num_items() - 1 do
								local curr_building = building_list:item_at(i)
								local vitality_from_building = curr_building:get_effect_value(self.config.vitality_from_building_effect)
								if  vitality_from_building ~= 0 then 
	
									cm:faction_add_pooled_resource(hydra_faction:name(), self.config.vitality_key, self.config.vitality_building_factor, vitality_from_building)
	
								end		
							end	
						end									
					end
				end
			else
				for i=0, hydra_province:regions():num_items() - 1 do
					local curr_region = hydra_province:regions():item_at(i)				
					if curr_region:owning_faction() == hydra_faction then 
						local building_list = curr_region:settlement():building_list()
						for i = 0, building_list:num_items() - 1 do
							local curr_building = building_list:item_at(i)
							local vitality_from_building = curr_building:get_effect_value(self.config.vitality_from_building_effect)
							if  vitality_from_building ~= 0 then 

								cm:faction_add_pooled_resource(hydra_faction:name(), self.config.vitality_key, self.config.vitality_building_factor, vitality_from_building)

							end
						end
					end
				end
			end
		end,

		CharacterSkillPointAllocated = function(self, context)
			local hydra = context:character()
			if not hydra or hydra:is_null_interface() or not hydra:character_subtype(self.config.agent_subtype) then
				return
			end 

			if not is_table(self.config.virulend_blood_setup) then
				return
			end

			local skill_id = context:skill_point_spent_on()

			if (self.config.virulend_blood_setup.skill_1 == skill_id and hydra:has_skill(self.config.virulend_blood_setup.skill_2)) or
				(self.config.virulend_blood_setup.skill_2 == skill_id and hydra:has_skill(self.config.virulend_blood_setup.skill_1)) then

				cm:apply_effect_bundle_to_character(self.config.virulend_blood_setup.bundle, hydra:command_queue_index(), -1)

			end
			
		end,

		PooledResourceTransactionEvent = function(self, context)
			local faction = context:faction()
			local total_amount = context:resource():value()

			if  self:unlocked(faction:name()) and 
				context:amount() ~= 0 and context:resource():key() == mythic_monster_hydra_config.vitality_key then
				for i, tier_data in ipairs(mythic_monster_hydra_config.hydra_vitality) do
					local bundle = tier_data.bundle
					local tier_min = tier_data.min
					local tier_max = tier_data.max
		
					if faction:has_effect_bundle(bundle) and (total_amount < tier_min or total_amount > tier_max) then
						cm:remove_effect_bundle(bundle, faction:name())
					elseif not faction:has_effect_bundle(bundle) and total_amount >= tier_min and total_amount <= tier_max then
						cm:apply_effect_bundle(bundle, faction:name(), 0)
					end
				end
			end
		end
	},

	-- methods
	unlocked = function(self, faction_key)
		return mythic_monsters_common:is_monster_unlocked(self:id(), is_string(faction_key) and faction_key or cm:get_local_faction_name(true))
	end,

	remove_pre_battle_bundle = function(self)
		if is_table(self.persistent.pre_battle_bundle_applied) then
			local hydra_cqi = tonumber(self.persistent.pre_battle_bundle_applied.hydra_cqi)
			local hydra = cm:get_character_by_cqi(hydra_cqi)
			local commander_cqi = tonumber(self.persistent.pre_battle_bundle_applied.commander_cqi)

			self:remove_army_effect_bundle(hydra, commander_cqi)
		end

		self.persistent.pre_battle_bundle_applied = false
	end,

	update_pre_battle_bundle_button = function(self, apply_bundle_button)
		local bundle_cost_string = string.format(common.get_localised_string("random_localisation_strings_string_troy_mth_hydra_pre_battle_action_cost"), self.config.bundle_vitality_cost)
		local not_enought_vitality_string = common.get_localised_string("random_localisation_strings_string_troy_mth_hydra_pre_battle_action_no_vitality")
		local bundle_applied_string = common.get_localised_string("random_localisation_strings_string_troy_mth_hydra_pre_battle_action_already_done")

		local faction = cm:get_faction(cm:get_local_faction_name(true))
		local vitality = faction:pooled_resource(self.config.vitality_key):value()
		local disabled_button = self.config.bundle_vitality_cost > vitality
		local cost_colorized_number = disabled_button and "[[col:red]]"..tostring(self.config.bundle_vitality_cost).."[[/col]]" or tostring(self.config.bundle_vitality_cost)

		local tooltip = string.format(bundle_cost_string, cost_colorized_number)

		if is_table(self.persistent.pre_battle_bundle_applied) then
			disabled_button = true
			tooltip = tooltip .. "\n" .. bundle_applied_string
		elseif disabled_button then
			tooltip = tooltip .. "\n" .. not_enought_vitality_string 
		end

		apply_bundle_button:SetTooltipText(tooltip, "From troy_mythic_monsters_hydra.lua", true)
		apply_bundle_button:SetState(disabled_button and "inactive" or "active")
	end,

	-- model, prebattle apply HYDRA army buffs
	apply_army_effect_bundle = function(self, hydra, commander)
		output("apply army effect bundle :"..self.config.bundle_key)

		local army_bundle = cm:create_new_custom_effect_bundle(self.config.bundle_key)
		local bundle_effects = army_bundle:effects()

		-- modify bundle effect values by HYDRA skills
		local effect_count = bundle_effects:num_items()
		for i= 0, effect_count - 1 do
			local curr_effect = bundle_effects:item_at(i)
			local effect_key = curr_effect:key()
			local effect_value = curr_effect:value()

			for skill_key, mod in pairs(self.config.bundle_value_mod_by_skill) do
				if hydra:has_skill(skill_key) and mod[effect_key] then
					effect_value = effect_value + mod[effect_key]
				end
			end

			army_bundle:set_effect_value(curr_effect, effect_value)
		end

		-- remove effects with a value of 0
		repeat
			bundle_effects = army_bundle:effects()
			local has_deleted_effect = false
			for j=0,bundle_effects:num_items() - 1 do
				local curr_effect = bundle_effects:item_at(j)
				local curr_effect_value = curr_effect:value()
				if curr_effect_value == 0 then
					army_bundle:remove_effect(curr_effect)
					has_deleted_effect = true
					break
				end
			end
		until not has_deleted_effect

		cm:faction_add_pooled_resource(commander:faction():name(), self.config.vitality_key, self.config.bundle_vitality_cost_factor, self.config.bundle_vitality_cost * -1)

		cm:apply_custom_effect_bundle_to_characters_force(army_bundle, commander)

		-- confirmation panel for hydra owning faction
		local panel = core:get_ui_root() and core:get_ui_root():SequentialFind("popup_pre_battle")
		if panel and panel:Visible() and cm:model():faction_is_local(commander:faction():name()) then
			local effect_bundle_holder = panel:SequentialFind("effect_bundle_holder")
			if effect_bundle_holder ~= nil then
				local is_effect_bundle_holder_visible = true

				-- when map preview is visible bundle holder is hidden
				local radar_map = panel:SequentialFind("preview_map")
				if radar_map ~= nil then
					is_effect_bundle_holder_visible = not radar_map:Visible()
				end

				effect_bundle_holder:SetVisible(is_effect_bundle_holder_visible)
				effect_bundle_holder:InterfaceFunction("set_custom_effect_bundle", army_bundle)
			end
			local effect_bundle_title = panel:SequentialFind("dy_effect_bundle_title")
			if effect_bundle_title then 
				effect_bundle_title:SetState("positive")
			end
		end

	end,

	-- model, prebattle remove HYDRA army buffs
	remove_army_effect_bundle = function(self, hydra, commander_cqi)
		output("remove army effect bundle: "..self.config.bundle_key)
		cm:remove_effect_bundle_from_character(self.config.bundle_key, commander_cqi)
	end,

	has_hydra_in_army = function(self, character)
		if not character or character:is_null_interface() then return false end

		local military_force = character:has_military_force() and character:military_force()
		if not military_force or military_force:is_null_interface() then return false end

		local character_list = military_force:character_list()
		local character_count = character_list:num_items()
		for i = 0, character_count - 1 do
			local nth_character = character_list:item_at(i)
			if nth_character:character_subtype(self.config.agent_subtype) then
				return { cqi = nth_character:command_queue_index() }
			end
		end
	end,

	-- events first handled by mythic_monsters_common
	-- on new game started - called once on new campaign
	on_new_game_started = function(self)
	end,

	on_first_tick = function(self)

		-- true: add listeners for my events table
		-- false: I'll handle my events by myself
		return true
	end,

	reset_persistent = function(self)
		self.persistent = {
			monster_cqi = false,
			unlocked_tiers = {},
			pre_battle_bundle_applied = false,
		}
	end,

	-- update vitality bar
	refresh_vitality_bar = function(self)
		local panel = core:get_ui_root():SequentialFind("monster_progression")
		if panel and panel:Visible() then
			local bar = panel:SequentialFind("bars_holder", "hydra")
			if bar then
				local min_vitality, max_vitality = 999999, -999999	-- Very small and very huge numbers.
				for i, tier_data in ipairs(mythic_monster_hydra_config.hydra_vitality) do
					min_vitality = math.min(min_vitality, tier_data.min)
					max_vitality = math.max(max_vitality, tier_data.max)
				end
				local vitality_interval_size = max_vitality - min_vitality

				local hydra_bar_width = bar:SequentialFind("hydra_bar_width")
				local tresholds_holder = bar:SequentialFind("tresholds_holder")
				if hydra_bar_width and tresholds_holder then
					local treshold_template = hydra_bar_width:SequentialFind("treshold_template")
					treshold_template:SetVisible(false)
		
					local pixels_per_point = hydra_bar_width:Width() / vitality_interval_size
					for i, tier_data in ipairs(mythic_monster_hydra_config.hydra_vitality) do
						local tier_entry = UIComponent(tresholds_holder:CreateFromComponent(treshold_template:Address(), string.format("tier_%d", i)))
						tier_entry:SetVisible(true)
		
						-- Offset and resize the current tier entry
						local tier_max_supply_points = i < #mythic_monster_hydra_config.hydra_vitality and mythic_monster_hydra_config.hydra_vitality[i + 1].min or max_vitality
						tier_entry:SetCanResizeWidth(true)
						tier_entry:Resize(pixels_per_point * (tier_max_supply_points - tier_data.min), tier_entry:Height())
						tier_entry:SetCanResizeWidth(false)
		
						local x, y = tier_entry:GetDockOffset()
						tier_entry:SetDockOffset(pixels_per_point * tier_data.min, y)
		
						tier_entry:InterfaceFunction("set_tooltip_path", "UI/Campaign UI/mth_vitality_tooltip")
						local tooltip = tier_entry:SequentialFind(tier_entry:Id() .. "_tooltip")
						tooltip:InterfaceFunction("set_custom_effect_bundle", cm:create_new_custom_effect_bundle(tier_data.bundle))

						local resource = cm:model():world():faction_by_key(cm:get_local_faction_name(true)):pooled_resource(self.config.vitality_key)

						local effect_list = tooltip:SequentialFind("effects_list")
						local effect_title = tooltip:SequentialFind("dy_effect_bundle_title")

						if effect_list and effect_title then
							for i = 0, effect_list:ChildCount() - 1 do
								local effect_entry = UIComponent(effect_list:Find(i))
								if resource:value() >= tier_data.min and resource:value() <= tier_data.max then
									effect_entry:SetState("active")
									effect_title:SetState("active")
								else
									effect_entry:SetState("inactive")
									effect_title:SetState("inactive")
								end
							end
						end

						local dy_vitality_points = tooltip:SequentialFind("dy_vitality_points")
						if dy_vitality_points then
							local resource = cm:model():world():faction_by_key(cm:get_local_faction_name(true)):pooled_resource(self.config.vitality_key)
							dy_vitality_points:SetText(tostring(resource:value()))
						end
					end
		
				end

				-- set up pointer position and resource value
				local uic_value = bar:SequentialFind("hydra_pointer")
				if uic_value then				
					local resource = cm:model():world():faction_by_key(cm:get_local_faction_name(true)):pooled_resource(self.config.vitality_key)
					uic_value:SetText(tostring(math.abs(resource:value())))

					local relative_pos_mul = vitality_interval_size <= 0 and 1 or resource:value() / vitality_interval_size

					local uic_parent = bar:SequentialFind("hydra_bar_width")	
					local uic_real_bar_width = uic_parent:Width()
					
					local pos_x
					local pos_y
					pos_x, pos_y = uic_value:Position()
					local w = uic_value:Width()
					local parent_pos_x
					local parent_pos_y
					parent_pos_x, parent_pos_y = uic_parent:Position()

					local new_pos_x = parent_pos_x + uic_real_bar_width*relative_pos_mul - w/2

					if new_pos_x < parent_pos_x then
						new_pos_x = parent_pos_x
					end

					if new_pos_x + w > parent_pos_x + uic_real_bar_width then
						new_pos_x = parent_pos_x + uic_real_bar_width - w
					end

					uic_value:MoveTo(new_pos_x, pos_y)
				end
			end
		end
	end,

	-- monster panel is opened
	on_monster_panel_opened = function(self, context)
		local panel = core:get_ui_root():SequentialFind(context.string)

		local bar = panel:SequentialFind("bars_holder", "hydra")
		if bar then
			bar:PropagateVisibility(true)
			self:refresh_vitality_bar()
		end

		local background = panel:SequentialFind("background")
		if background then
			background:SetState(self.config.panel_background)
		end

		local flavour_text = panel:SequentialFind("dy_monster_flavour")
		if flavour_text then
			flavour_text:SetText(common.get_localised_string(self.config.panel_flavour_text))
		end
	end,

	on_monster_panel_closed = function(self, context)
		core:remove_listener("monster_hydra_vitality_mouse_off")
		core:remove_listener("monster_hydra_vitality_mouse_on")

	end,

	on_level_up = function(self, context)
		local character = context:character()
		local rank = character:rank()

		for _, node in ipairs(mythic_monsters_common:get_monster_progression_for_faction(character:faction(), self)) do
			if node.rank_req == rank then
				-- unlock skill tier
				if not is_table(self.persistent.unlocked_tiers) and self.persistent.unlocked_tiers == nil then
					self.persistent.unlocked_tiers = {}
				end
				table.insert(self.persistent.unlocked_tiers, rank, {state = "unlocked", node = node, skill = ""}) -- key is rank for skill, value is state from ui
				out("rank " .. rank .. "self.persistent.unlocked_tiers[rank] " .. tostring(self.persistent.unlocked_tiers) .. tostring(self.persistent.unlocked_tiers[rank].state))
			end
		end
	end,

	on_monster_unlocked = function(self, faction_key)
	end,

	on_monster_created = function(self, character)
	end,

	on_monster_recruited = function(self, character)
	end,

	on_prebattle_panel_opened = function(self, local_faction_key, model)
		local character = false
		local pb = model:pending_battle()
		if pb and pb:has_attacker() and pb:attacker():faction():is_human() and pb:attacker():faction():name() == local_faction_key then 
			character = pb:attacker()
		elseif pb and pb:has_defender() and pb:defender():faction():is_human() and pb:defender():faction():name() == local_faction_key then
			character = pb:defender()
		end
		if not character then return end

		local hydra = self:has_hydra_in_army(character)
		if not is_table(hydra) then return end

		local panel = core:get_ui_root():SequentialFind("popup_pre_battle")
		if not panel then return end

		local apply_bundle_button
		if model:pending_battle():seige_battle() then
			apply_bundle_button = panel:SequentialFind(unpack(self.config.apply_bundle_button_siege_location), self.config.apply_bundle_button_id)
		else 
			apply_bundle_button = panel:SequentialFind(unpack(self.config.apply_bundle_button_location), self.config.apply_bundle_button_id)
		end

		if apply_bundle_button then
			apply_bundle_button:SetVisible(true)

			-- set the button HYDRAs cqi
			apply_bundle_button:SetProperty("hydra_cqi", hydra.cqi)
			apply_bundle_button:SetProperty("commander_cqi", character:command_queue_index())

			-- tooltip & state
			self:update_pre_battle_bundle_button(apply_bundle_button)
		end
	end
}

-- returns a simple or composite ID
mythic_monster_hydra.id = function(self, suff) 
	if not is_table(self.config) or not self.config.id then
		err("Missing monster ID")
		return
	end
	return suff and suff ~= "" and self.config.id.."_"..suff or self.config.id 
end

core:add_listener (
	"MythicMonsterHydra_FirstTickAfterWorldCreated",
	"FirstTickAfterWorldCreated",
	true,
	function(context)
		-- Proceed only if the prebattle screen is opened and the hydra is unlocked
		local panel = core:get_ui_root():SequentialFind("popup_pre_battle")
		if not panel or not mythic_monster_hydra:unlocked() then
			return
		end

		local local_faction_key = nil

		local factions = context:world():faction_list()
		local num_factions = factions:num_items()
		for i = 0, num_factions - 1 do
			local faction = factions:item_at(i)
			local faction_key = faction:name()
			if faction:model():faction_is_local(faction_key) then
				local_faction_key = faction_key
				break
			end
		end

		if local_faction_key then
			mythic_monster_hydra:on_prebattle_panel_opened(local_faction_key, context:world():model())
		end
	end,
	false
);

-- mythic_monsters_common:unlock_monster("MYTHIC_MONSTER_HYDRA", cm:get_local_faction_name())
return mythic_monster_hydra