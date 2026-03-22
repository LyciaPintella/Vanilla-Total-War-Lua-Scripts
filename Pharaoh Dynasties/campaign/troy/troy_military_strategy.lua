out("Loading troy_military_strategy.lua")

military_strategy = {
	diomedes_faction_key = "troy_main_dan_argos",
	resource_key = "troy_dominance",
	factor_key = "troy_resource_factor_faction",
	weaker_faction_threshold = 1.25,
	dominance_incompatible_diplomatic_actions = { "diplomatic_option_join_war", "diplomatic_option_break_vassal", "diplomatic_option_break_subject", "diplomatic_option_break_defensive_alliance", "diplomatic_option_break_military_alliance", },

	dominance_tiers = {
		-- NOTE: The effect bundles listed here are used only for their description in the UI! They are not applied anywhere.
		--	   This is so, because, by the current design, the only thing that dominance provides is the ability to use it in diplomacy, which is implemented through this script.
		--	   If the above changes and the effect bundles start to provide any effects, those bundles should be applied somehow (for example by adding code to this script)!
		{ lower_bound = 0, effect_bundle_key = "effect_bundle_adi_dio_dominance_tier_0", },
		{ lower_bound = 100, effect_bundle_key = "effect_bundle_adi_dio_dominance_tier_1", },
		{ lower_bound = 200, effect_bundle_key = "effect_bundle_adi_dio_dominance_tier_2", },
	},

	reward_variance_apply_for_hordes = false,
	reward_variance_apply_for_non_hordes = true,
	reward_variance_minimum_reward = 10,
	reward_variance_step_value = 5,
	reward_variance_minimum_steps = 8,
	reward_variance_maximum_steps = 16,
	
	objectives = {
		-- NOTE: To avoid desynchronization in MP, it is important that the objectives are in an indexed table, rather than in a key/value table.
		--	   This is so, because the strict ordering guarantees that listeners would be registered and executed in the same order on multiple machines.
		-- NOTE: The order of objectives is important in regards to the UI. They would be displayed in the order they are defined in this table.
		-- NOTE: Although the system allows for more than one entry of objectives with the same methods, this is discouraged.
		--	   That is so, because only the first encountered entry of the same methods would be used for the UI elements!
		{
			methods = "defeat_faction_leader",
			definitions = {
				{
					is_for_hordes = false, is_for_non_hordes = true,
					excluded_factions = { "troy_main_trj_troy", },
					base_reward = 30,
					vary_reward = true,
					faction_reward_minimums = {
						troy_main_trj_hector = 60,
						troy_main_trj_dardania = 60,
						troy_main_dan_achilles = 60,
						troy_main_dan_salamis = 60,
					},
				},
				{
					is_for_hordes = true, is_for_non_hordes = false,
					base_reward = 100,
				},
			},
			ui_text = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_defeat_faction_leader_ui_text",
			reason_currently_impossible = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_defeat_faction_leader_reason_currently_impossible",
			event_message_detail = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_defeat_faction_leader_event_message_detail",
		},
		{
			methods = "conquer_capital",
			definitions = {
				{
					is_for_hordes = false, is_for_non_hordes = true,
					base_reward = 30,
					vary_reward = true,
				},
			},
			ui_text = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_conquer_capital_ui_text",
			reason_currently_impossible = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_conquer_capital_reason_currently_impossible",
			event_message_detail = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_conquer_capital_event_message_detail",
		},
		{
			methods = "raid_resources",
			definitions = {
				{
					is_for_hordes = false, is_for_non_hordes = true,
					base_reward = 20,
					vary_reward = true,
					faction_reward_minimums = {
						troy_main_trj_lycia = 40,
					},
					turns_per_step = 20,
					production_types = {
						troy_main_settlement_farm = { resource_key = "troy_food", amount_base = 400, amount_per_step = 200, },
						troy_main_settlement_forest = { resource_key = "troy_wood", amount_base = 300, amount_per_step = 200, },
						troy_main_settlement_stone = { resource_key = "troy_stones", amount_base = 200, amount_per_step = 100, },
						troy_main_settlement_bronze = { resource_key = "troy_bronze", amount_base = 200, amount_per_step = 100, },
						troy_main_settlement_gold = { resource_key = "troy_gold", amount_base = 80, amount_per_step = 30, },
					},
				},
			},
			ui_text = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_raid_resources_ui_text",
			event_message_detail = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_raid_resources_event_message_detail",
		},
		{
			methods = "raid_or_sack_resource_settlement",
			definitions = {
				{
					is_for_hordes = false, is_for_non_hordes = true,
					base_reward = 30,
					vary_reward = true,
					allow_selecting_capital = false,
					production_types = { "troy_main_settlement_farm", "troy_main_settlement_forest", "troy_main_settlement_stone", "troy_main_settlement_bronze", "troy_main_settlement_gold" },
				},
			},
			ui_text = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_raid_or_sack_resource_settlement_ui_text",
			reason_currently_impossible = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_raid_or_sack_resource_settlement_reason_currently_impossible",
			event_message_detail = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_raid_or_sack_resource_settlement_event_message_detail",
		},
		{
			methods = "kill_general",
			definitions = {
				{
					is_for_hordes = false, is_for_non_hordes = true,
					base_reward = 30,
					vary_reward = true,
					allow_selecting_faction_leader = false,
				},
			},
			ui_text = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_kill_general_ui_text",
			reason_permanently_impossible = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_kill_general_reason_permanently_impossible",
			reason_currently_impossible = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_kill_general_reason_currently_impossible",
			event_message_detail = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_kill_general_event_message_detail",
		},
		{
			methods = "horde_defeat_general",
			definitions = {
				{
					is_for_hordes = true, is_for_non_hordes = false,
					base_reward = 50,
					allow_selecting_faction_leader = false,
				},
			},
			ui_text = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_horde_defeat_general_ui_text",
			reason_permanently_impossible = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_horde_defeat_general_reason_permanently_impossible",
			reason_currently_impossible = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_horde_defeat_general_reason_currently_impossible",
			event_message_detail = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_horde_defeat_general_event_message_detail",
		},
		{
			methods = "ambush_enemy",
			definitions = {
				{
					is_for_hordes = false, is_for_non_hordes = true,
					base_reward = 40,
					vary_reward = true,
					faction_reward_minimums = {
						troy_main_dan_ithaca = 40,
					},
				},
				{
					is_for_hordes = true, is_for_non_hordes = false,
					base_reward = 40,
				},
			},
			ui_text = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_ambush_enemy_ui_text",
			event_message_detail = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_ambush_enemy_event_message_detail",
		},
		{
			methods = "break_alliances",
			definitions = {
				{
					is_for_hordes = false, is_for_non_hordes = true,
					base_reward = 40,
					vary_reward = true,
					faction_reward_minimums = {
						troy_main_trj_hector = 40,
						troy_main_dan_sparta = 40,
						troy_main_dan_salamis = 40,
					},
				},
			},
			ui_text = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_break_alliances_ui_text",
			reason_currently_impossible = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_break_alliances_reason_currently_impossible",
			event_message_detail = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_break_alliances_event_message_detail",
		},
		{
			methods = "raze_specific_settlement",
			definitions = {
				{
					is_for_hordes = false, is_for_non_hordes = true,
					base_reward = 100,
					region_keys = { "troy_main_ilion_troy", "troy_main_mycenaeca_mycenae" },
				},
			},
			delete_same_region_objectives = { "conquer_capital", "raid_or_sack_resource_settlement", },	-- Specify objectives by methods name.
			ui_text = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_raze_specific_settlement_ui_text",
			reason_currently_impossible = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_raze_specific_settlement_reason_currently_impossible",
			event_message_detail = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_raze_specific_settlement_event_message_detail",
		},
		{
			methods = "conquer_helen_settlement",
			definitions = {
				{
					is_for_hordes = false, is_for_non_hordes = true,
					base_reward = 100,
					enemy_faction_key = "troy_main_trj_paris",
				},
			},
			ui_text = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_conquer_helen_settlement_ui_text",
			reason_permanently_impossible = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_conquer_helen_settlement_reason_permanently_impossible",
			event_message_detail = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_conquer_helen_settlement_event_message_detail",
		},
	},

	character_skills_objectives_reward_changing = {
		troy_adi_hero_diomedes_campaign_dominance = { kill_general = { multiplier = 0.5, modifier = 0, }, raid_resources = { multiplier = 0.5, modifier = 0, }, },	-- Ares' Guidance
		troy_adi_hero_diomedes_campaign_dominance_objectives = { defeat_faction_leader = { multiplier = 1, modifier = 0, } },	-- Athena's Guidance
		troy_adi_hero_unit_campaign_artemis_guidance = { ambush_enemy = { multiplier = 2, modifier = 0, }, },	-- Artemis' Guidance
		troy_adi_hero_unit_campaign_dominance_siege_battle_loot = { conquer_capital = { multiplier = 0.5, modifier = 0, }, raid_or_sack_resource_settlement = { multiplier = 0.5, modifier = 0, }, },	-- Poseidon's Guidance
	},

	character_skills_effects_for_having_dominance = {
		[1] = {
		   db_key = "troy_adi_hero_diomedes_campaign_dominance_spec_melee_attack",
		   effect_bundle_key = "effect_bundle_adi_dio_guidance_ares_melee_attack",
		   required_dominance = 100,
		   is_active = false,
		},
		[2] = {
			db_key = "troy_adi_hero_diomedes_campaign_dominance_spec_charge_bonus",
			effect_bundle_key = "effect_bundle_adi_dio_guidance_ares_charge",
			required_dominance = 100,
			is_active = false,
		},
		[3] = {
			db_key = "troy_adi_hero_diomedes_campaign_dominance_spec_recrut_slots",
			effect_bundle_key = "effect_bundle_adi_dio_guidance_athena_recruit_slots",
			required_dominance = 100,
			is_active = false,
		},
		[4] = {
			db_key = "troy_adi_hero_diomedes_campaign_dominance_spec_recrut_rank",
			effect_bundle_key = "effect_bundle_adi_dio_guidance_athena_recruit_rank",
			required_dominance = 100,
			is_active = false,
		},
		[5] = {
			db_key = "troy_adi_hero_unit_campaign_dominance_siege_battle_loot_spec_siege_time",
			effect_bundle_key = "effect_bundle_adi_dio_guidance_poseidon_siege_time",
			required_dominance = 100,
			is_active = false,
		},
		[6] = {
			db_key = "troy_adi_hero_unit_campaign_dominance_siege_battle_loot_spec_campaign_movement",
			effect_bundle_key = "effect_bundle_adi_dio_guidance_poseidon_campaign_movement",
			required_dominance = 100,
			is_active = false,
		},
		[7] = {
			db_key = "troy_adi_hero_unit_campaign_artemis_guidance_spec_ambush",
			effect_bundle_key = "effect_bundle_adi_dio_guidance_artemis_ambush",
			required_dominance = 100,
			is_active = false,
		},
		[8] = {
			db_key = "troy_adi_hero_unit_campaign_artemis_guidance_spec_speed",
			effect_bundle_key = "effect_bundle_adi_dio_guidance_artemis_speed",
			required_dominance = 100,
			is_active = false,
		}
   },
   
	dominance_event_feed_messages = {
		dominance_gained = {
			title = "event_feed_strings_text_troy_adi_scripted_event_diomedes_military_strategy_title",
			primary_detail = "event_feed_strings_text_troy_adi_scripted_event_diomedes_military_strategy_dominance_gained_primary_details",
			sec_detail = nil, -- This info is extracted from the objectives.event_message_detail
			event_pic = 2104,
			args = {}, -- up to 3 numeric arguments
			not_on_screen = true
		},
	
		dominance_reached_diplomatic_action_threshold = {
			title = "event_feed_strings_text_troy_adi_scripted_event_diomedes_military_strategy_title",
			primary_detail = "event_feed_strings_text_troy_adi_scripted_event_diomedes_military_strategy_dominance_accumulated_100_primary_details",
			sec_detail = "event_feed_strings_text_troy_event_feed_string_all_null",
			event_pic = 1105,
			args = {}, -- up to 3 numeric arguments
			not_on_screen = true
		},
	
		dominance_reached_confederation_threshold = {
			title = "event_feed_strings_text_troy_adi_scripted_event_diomedes_military_strategy_title",
			primary_detail = "event_feed_strings_text_troy_adi_scripted_event_diomedes_military_strategy_dominance_accumulated_200_primary_details",
			sec_detail = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_military_strategy_dominance_reached_confederation_threshold",
			event_pic = 1106,
			args = {}, -- up to 3 numeric arguments
			not_on_screen = true
		},
	},

	--[[ Changes to the dominance rewards that the objectives grant, with a key the objective methods. Those have the following structure (note that the multiplier is cumulative and added to 1):
		objective_methods = { multiplier = 1, modifier = 10, }	-- Multiplying the reward by 2 (1 + 1) and then adding 10.
	--]]
	objective_rewards_changes = {},

	--[[ Objectives per faction, with a key the faction key/name. Once Diomedes gets into a war with a faction, the objectives for that faction get generated. Those have the following structure:
		faction_key = {
			objective_methods = {
				completed = true/false,
				reward = dominance_amount,	-- This is the base reward value. Use military_strategy.get_objective_reward to get the value after possible changes!
			},
		},
	--]]
	faction_objectives = {
		troy_main_dan_corinthians = {
			defeat_faction_leader = {
				{
					completed = false,
					reward =50,
				}
			},
			conquer_capital = {
				{
					completed = false,
					reward = 60,
				}
			},
			raid_or_sack_resource_settlement = {
				{
					completed = false,
					reward = 50,
					region_key = "troy_main_mycenaeca_stymphalos",
				}
			},
			kill_general = {
				{
					completed = false,
					reward = 40,
					general_family_member_cqi = 348,
				}
			},
		}
	},
}

military_strategy.end_turn_notification_text_key = "campaign_localised_strings_string_end_turn_warning_dominance_full"
military_strategy.target_general_not_visible = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_target_general_not_visible"

military_strategy.ui = {
	panel_name = "fm_dio_2",
	dominance_bar = {
		background = "dom_bar_container",
		bar = "dom_bar",
		marker = "marker_pos",
		current_amount = "dy_dom_current",
	},
	active_factions_list = "container_at_war",
	inactive_factions_list = "container_at_peace",
	faction_list = {
		sort_arrows = "sort_arrows",
		empty = "empty_list",
		view = "list_view",
		list = "list_box",
		template = "row_template",
		template_states = { selected = "selected", unselected = "unselected", },
		template_instance_prefix = "faction_instance_",
		emblem = "mon",
		name = "name",
		balance_of_power = { component = "bop_bar", rank = "label_strength_rank", player = "player", enemy = "enemy", },
		status = "pip_status",
		status_state = { war = "war", neutral = "0", defensive_alliance = "allied", military_alliance = "allied_military" },
		attitude = "attitude",
		diplomacy = "diplomacy_button",
		destroyed = "faction_destroyed",
	},
	objectives = {
		panel = "objectives_panel",
		property_faction = "faction",
		dead = "faction_dead",
		at_peace = "faction_at_peace",
		list = "list_box",
		template = "template_row",
		template_instance_prefix = "objective_instance_",
		template_states = { not_currently_possible = "invalid", },
		text = "dy_objective_text",
		bullet = "bullet",
		bullet_states = { active = "active", completed = "completed", impossible = "locked", },
		reward = "dy_reward_text",
		target = "dy_target_template",
		target_name = "dy_target_name",
		target_icon = "icon_complete",
		target_icon_states = { active = "incomplete", completed = "complete", impossible = "impossible", },
	},
	auto_select_active_faction = true,
}

military_strategy.get_active_objective = function(faction, objective_methods, objective_condition)	-- Returns the first active objective that fulfills the conditions.
	local faction_key = faction:name()
	if military_strategy.faction_objectives[faction_key] and military_strategy.faction_objectives[faction_key][objective_methods] and faction:at_war_with(cm:get_faction(military_strategy.diomedes_faction_key)) then
		for _, o in ipairs(military_strategy.faction_objectives[faction_key][objective_methods]) do
			if not o.completed and (not objective_condition or objective_condition(o)) then
				return o
			end
		end
	end
	return nil
end

military_strategy.get_objective_reward = function(faction_objective, objective_methods)
	local result, changes = faction_objective.reward, military_strategy.objective_rewards_changes[objective_methods]
	if changes then
		result = math.ceil(result * (1 + changes.multiplier) + changes.modifier)
	end
	return result
end

military_strategy.complete_objective = function(faction_objective, objective_methods, objective_target_faction_name)
	faction_objective.completed = true
	local reward = military_strategy.get_objective_reward(faction_objective, objective_methods)
	cm:faction_add_pooled_resource(military_strategy.diomedes_faction_key, military_strategy.resource_key, military_strategy.factor_key, reward) 
	military_strategy.trigger_event(military_strategy.diomedes_faction_key, "dominance_gained", objective_methods, reward, 0, 0, objective_target_faction_name)
end

military_strategy.is_diomedes_faction_among = function(character, characters_list)
	if character and not character:is_null_interface() and character:faction():name() == military_strategy.diomedes_faction_key then
		return true
	end
	if is_characterlist(characters_list) then
		for i = 0, characters_list:num_items() - 1 do
			local list_character = characters_list:item_at(i)
			if not list_character:is_null_interface() and list_character:faction():name() == military_strategy.diomedes_faction_key then
				return true
			end
		end
	end
	return false
end

military_strategy.check_objective_for_character = function(character, character_check, objective_methods, objective_check)
	if character and not character:is_null_interface() and (not character_check or character_check(character)) then
		local objective_check_wrapper = objective_check and function(faction_objective) return objective_check(faction_objective, character) end
		local char_faction = character:faction()
		local active_objective = military_strategy.get_active_objective(char_faction, objective_methods, objective_check_wrapper)
		if active_objective then
			military_strategy.complete_objective(active_objective, objective_methods, char_faction:name())
		end
	end
end

military_strategy.check_objective_for_characters = function(character, characters_list, character_check, objective_methods, objective_check)
	military_strategy.check_objective_for_character(character, character_check, objective_methods, objective_check)
	for i = 0, characters_list:num_items() - 1 do
		military_strategy.check_objective_for_character(characters_list:item_at(i), character_check, objective_methods, objective_check)
	end
end

military_strategy.objectives_methods = {
	defeat_faction_leader = {
		listeners = {
			{
				event = "BattleConflictFinished",
				filter = true,
				body = function(context)
					local objective_methods = "defeat_faction_leader"
					local is_faction_leader = function(general) return not general:is_null_interface() and general:is_faction_leader() end
					local battle = context:pending_battle()
					local attacking_general, attacking_reinforcing_generals = battle:attacker(), battle:secondary_attackers()
					local defending_general, defending_reinforcing_generals = battle:defender(), battle:secondary_defenders()
					if battle:attacker_battle_result():ends_with("victory") and military_strategy.is_diomedes_faction_among(attacking_general, attacking_reinforcing_generals) then
						military_strategy.check_objective_for_characters(defending_general, defending_reinforcing_generals, is_faction_leader, objective_methods)
					elseif battle:defender_battle_result():ends_with("victory") and military_strategy.is_diomedes_faction_among(defending_general, defending_reinforcing_generals) then
						military_strategy.check_objective_for_characters(attacking_general, attacking_reinforcing_generals, is_faction_leader, objective_methods)
					end
				end,
			},
		},

		get_is_possible_and_target = function(faction_objective, faction)
			local faction_leader = faction:has_faction_leader() and faction:faction_leader()
			return true, faction_leader and not faction_leader:is_wounded(), "family_member_cqi", not faction_objective.completed and faction_leader and faction_leader:family_member():command_queue_index()
		end,
	},

	conquer_capital = {
		listeners = {
			{
				event = "CharacterPerformsSettlementOccupationDecisionBeforeOutcomeApplication",
				filter = function(context)
					local option = context:occupation_decision_option()
					return (option == "occupation_decision_occupy" or option == "occupation_decision_loot") and context:character():faction():name() == military_strategy.diomedes_faction_key
				end,
				body = function(context)
					local objective_methods = "conquer_capital"
					local region = context:garrison_residence():region()
					local faction = region:owning_faction()
					local active_objective = (faction:has_home_region() and region:name() == faction:home_region():name()) and military_strategy.get_active_objective(faction, objective_methods)
					if active_objective then
						military_strategy.complete_objective(active_objective, objective_methods, faction:name())
					end
				end,
			},
		},

		get_is_possible_and_target = function(faction_objective, faction)
			return true, faction:has_home_region(), "region_key", not faction_objective.completed and faction:has_home_region() and faction:home_region():name()
		end,
	},

	raid_resources = {
		generator = function(objective, faction)
			local resources = {}
			local regions = faction:region_list()
			for i = 0, regions:num_items() - 1 do
				local settlement = regions:item_at(i):settlement()
				if not settlement:is_null_interface() then
					table_add_unique(resources, settlement:production_type())
				end
			end
			table_erase_if(resources, function(e) return not objective.production_types[e] end)
			if #resources <= 0 then
				return nil
			end
			local model = faction:model()
			local data = objective.production_types[resources[model:random_int(1, #resources)]]
			local objective = {
				resource_key = data.resource_key,
				target_amount = data.amount_per_step * math.floor(model:turn_number() / objective.turns_per_step) + data.amount_base,
				current_amount = 0,
			}
			return { objective }
		end,

		listeners = {
			{
				event = "LandTradeRouteRaided",
				filter = function(context)
					local character = context:character()
					return character:has_region() and character:faction():name() == military_strategy.diomedes_faction_key
				end,
				body = function(context)
					local objective_methods = "raid_resources"
					local objective_faction = context:character():region():owning_faction()
					local active_objective = military_strategy.get_active_objective(objective_faction, objective_methods)
					if active_objective then
						local resources = context:resources()
						active_objective.current_amount = active_objective.current_amount + (resources[active_objective.resource_key] or 0)
						if active_objective.current_amount >= active_objective.target_amount then
							military_strategy.complete_objective(active_objective, objective_methods, objective_faction:name())
						end
					end
				end,
			},
		},

		ui_details = function(faction_objective, faction)
			return faction_objective.current_amount, faction_objective.target_amount, faction:pooled_resource(faction_objective.resource_key):icon(), faction:pooled_resource_display_name(faction_objective.resource_key)
		end,
	},

	raid_or_sack_resource_settlement = {
		generator = function(objective, faction)
			if not objective.production_types or #objective.production_types <= 0 then
				out("Error: Military Strategy no settlement production types provided for objective " .. objective.methods)
				return nil
			end

			local regions_by_type = {}
			for i, pt in ipairs(objective.production_types) do
				regions_by_type[i] = {}
			end
			local regions = faction:region_list()
			for i = 0, regions:num_items() - 1 do
				local region = regions:item_at(i)
				local settlement = region:settlement()
				if not settlement:is_null_interface() then
					local production_type = settlement:production_type()
					for i = 1, #objective.production_types do
						if production_type == objective.production_types[i] then
							table.insert(regions_by_type[i], region)
							break
						end
					end
				end
			end

			table_erase_if(regions_by_type, function(e) return #e <= 0 end)
			regions_by_type = table_stable_sort(regions_by_type, function(a, b) return #a < #b end)
			if not objective.allow_selecting_capital and #regions_by_type >= 1 and #regions_by_type[1] == 1 and regions_by_type[1][1]:name() == faction:home_region():name() then
				table.remove(regions_by_type, 1)
			end
			if #regions_by_type <= 0 or #regions_by_type[1] <= 0 then
				return nil
			end
			local fewest_regions_count = #regions_by_type[1]
			table_erase_if(regions_by_type, function(e) return #e > fewest_regions_count end)
			local model = faction:model()
			repeat
				local type_index = model:random_int(1, #regions_by_type)
				local region_index = model:random_int(1, #regions_by_type[type_index])
				if objective.allow_selecting_capital or regions_by_type[type_index][region_index]:name() ~= faction:home_region():name() then
					return { { region_key = regions_by_type[type_index][region_index]:name() } }
				end
				table.remove(regions_by_type[type_index], region_index)
				if #regions_by_type[type_index] <= 0 then
					table.remove(regions_by_type, type_index)
				end
			until #regions_by_type <= 0
			return nil
		end,

		listeners = {
			{
				event = "CharacterPerformsSettlementOccupationDecisionBeforeOutcomeApplication",
				filter = function(context)
					local option = context:occupation_decision_option()
					return (option == "occupation_decision_sack" or option == "occupation_decision_raze_without_occupy") and context:character():faction():name() == military_strategy.diomedes_faction_key
				end,
				body = function(context)
					local objective_methods = "raid_or_sack_resource_settlement"
					local region = context:garrison_residence():region()
					local objective_faction = region:owning_faction()
					local active_objective = military_strategy.get_active_objective(objective_faction, objective_methods, function(faction_objective) return faction_objective.region_key == region:name() end)
					if active_objective then
						military_strategy.complete_objective(active_objective, objective_methods, objective_faction:name())
					end
				end,
			},
		},

		get_is_possible_and_target = function(faction_objective, faction)
			local region = cm:get_region(faction_objective.region_key)
			return true, region and region:owning_faction():name() == faction:name(), "region_key", faction_objective.region_key
		end,
	},

	kill_general = {
		generator = function(objective, faction)
			local highest_rank = 0
			local generals = {}
			local characters = faction:character_list()
			for i = 0, characters:num_items() - 1 do
				local character = characters:item_at(i)
				if not character:is_null_interface() and character:character_type("general") and character:has_military_force() and (objective.allow_selecting_faction_leader or not character:is_faction_leader()) then
					table.insert(generals, character)
					highest_rank = math.max(highest_rank, character:rank())
				end
			end
			table_erase_if(generals, function(e) return e:rank() < highest_rank end)
			if #generals <= 0 then
				return nil
			end
			return { { general_family_member_cqi = generals[faction:model():random_int(1, #generals)]:family_member():command_queue_index() } }
		end,

		listeners = {
			{
				event = "CharacterKilledOtherCharacter",
				filter = function(context)
					return context:character():faction():name() == military_strategy.diomedes_faction_key
				end,
				body = function(context)
					local objective_methods = "kill_general"
					local other_character = context:other_character()
					local other_character_faction = other_character:faction()
					local active_objective = military_strategy.get_active_objective(other_character_faction, objective_methods, function(faction_objective) return faction_objective.general_family_member_cqi == other_character:family_member():command_queue_index() end)
					if active_objective then
						military_strategy.complete_objective(active_objective, objective_methods, other_character_faction:name())
					end
				end,
			},
		},

		get_is_possible_and_target = function(faction_objective, faction)
			local family_member = faction:model():family_member_for_command_queue_index(faction_objective.general_family_member_cqi)
			return not family_member:is_null_interface() and family_member:is_alive(), not family_member:is_null_interface() and not family_member:is_convalescing(), "family_member_cqi", faction_objective.general_family_member_cqi
		end,
	},

	ambush_enemy = {
		listeners = {
			{
				event = "BattleConflictFinished",
				filter = true,
				body = function(context)
					local objective_methods = "ambush_enemy"
					local battle = context:pending_battle()
					if battle:ambush_battle() and not battle:failed_ambush_battle() and battle:attacker_battle_result():ends_with("victory") and battle:attacker_faction():name() == military_strategy.diomedes_faction_key then
						local defender_faction = battle:defender_faction()
						local active_objective = military_strategy.get_active_objective(defender_faction, objective_methods)
						if active_objective then
							military_strategy.complete_objective(active_objective, objective_methods, defender_faction:name())
						end
					end
				end,
			},
		},
	},

	break_alliances = {
		generator = function(objective, faction)
			return faction:num_allies() >= 1 and {{}} or nil
		end,

		listeners = {
			{
				event = "PositiveDiplomaticEvent",
				filter = function(context)
					return context:character():faction():name() == military_strategy.diomedes_faction_key
				end,
				body = function(context)
					local objective_methods = "break_alliances"
					local break_alliance_with = context:proposer():name() == military_strategy.diomedes_faction_key and context:break_alliance_with_demanded() or context:break_alliance_with_offered()
					for i = 1, #break_alliance_with do
						local current_faction = cm:get_faction(break_alliance_with[i])
						local active_objective = military_strategy.get_active_objective(current_faction, objective_methods)
						if active_objective then
							military_strategy.complete_objective(active_objective, objective_methods, current_faction:name())
						end
					end
				end,
			},
		},

		get_is_possible_and_target = function(faction_objective, faction)
			return true, faction:num_allies() >= 1
		end,
	},

	raze_specific_settlement = {
		generator = function(objective, faction)
			local objectives = {}
			for _, region_key in ipairs(objective.region_keys) do
				local region = cm:get_region(region_key)
				if region and region:owning_faction():name() == faction:name() then
					table.insert(objectives, { region_key = region_key })
				end
			end
			return #objectives >= 1 and objectives or nil
		end,

		listeners = {
			{
				event = "CharacterPerformsSettlementOccupationDecisionBeforeOutcomeApplication",
				filter = function(context)
					return context:occupation_decision_option() == "occupation_decision_raze_without_occupy" and context:character():faction():name() == military_strategy.diomedes_faction_key
				end,
				body = function(context)
					local objective_methods = "raze_specific_settlement"
					local region = context:garrison_residence():region()
					local faction = region:owning_faction()
					local active_objective = military_strategy.get_active_objective(faction, objective_methods, function(faction_objective) return faction_objective.region_key == region:name() end)
					if active_objective then
						military_strategy.complete_objective(active_objective, objective_methods, faction:name())
					end
				end,
			},
		},

		get_is_possible_and_target = function(faction_objective, faction)
			local region = cm:get_region(faction_objective.region_key)
			return true, region and region:owning_faction():name() == faction:name(), "region_key", faction_objective.region_key
		end,
	},

	conquer_helen_settlement = {
		generator = function(objective, faction)
			return faction:name() == objective.enemy_faction_key and ParisHelen_IsHelenAlive() and {{}} or nil
		end,

		listeners = {
			{
				event = "CharacterPerformsSettlementOccupationDecisionBeforeOutcomeApplication",
				filter = function(context)
					local option = context:occupation_decision_option()
					return (option == "occupation_decision_occupy" or option == "occupation_decision_loot") and context:character():faction():name() == military_strategy.diomedes_faction_key
				end,
				body = function(context)
					local objective_methods = "conquer_helen_settlement"
					local region = context:garrison_residence():region()
					local faction = region:owning_faction()
					local active_objective = ParisHelen_IsHelenAlive() and region:name() == paris_helen.current_location and military_strategy.get_active_objective(faction, objective_methods)
					if active_objective then
						military_strategy.complete_objective(active_objective, objective_methods, faction:name())
					end
				end,
			},
		},

		get_is_possible_and_target = function(faction_objective, faction)
			local is_possible = ParisHelen_IsHelenAlive()
			return is_possible, is_possible, "region_key", is_possible and paris_helen.current_location
		end,
	},

	horde_defeat_general = {
		generator = function(objective, faction)
			local objectives = {}
			local characters = faction:character_list()
			for i = 0, characters:num_items() - 1 do
				local character = characters:item_at(i)
				if not character:is_null_interface() and character:character_type("general") and character:has_military_force() and (objective.allow_selecting_faction_leader or not character:is_faction_leader()) then
					table.insert(objectives, { general_family_member_cqi = character:family_member():command_queue_index() })
				end
			end
			return #objectives >= 1 and objectives or nil
		end,

		listeners = {
			{
				event = "BattleConflictFinished",
				filter = true,
				body = function(context)
					local objective_methods = "horde_defeat_general"
					local is_objective_character = function(faction_objective, character) return faction_objective.general_family_member_cqi == character:family_member():command_queue_index() end
					local battle = context:pending_battle()
					local attacking_general, attacking_reinforcing_generals = battle:attacker(), battle:secondary_attackers()
					local defending_general, defending_reinforcing_generals = battle:defender(), battle:secondary_defenders()
					if battle:attacker_battle_result():ends_with("victory") and military_strategy.is_diomedes_faction_among(attacking_general, attacking_reinforcing_generals) then
						military_strategy.check_objective_for_characters(defending_general, defending_reinforcing_generals, nil, objective_methods, is_objective_character)
					elseif battle:defender_battle_result():ends_with("victory") and military_strategy.is_diomedes_faction_among(defending_general, defending_reinforcing_generals) then
						military_strategy.check_objective_for_characters(attacking_general, attacking_reinforcing_generals, nil, objective_methods, is_objective_character)
					end
				end,
			},
		},

		get_is_possible_and_target = function(faction_objective, faction)
			local family_member = faction:model():family_member_for_command_queue_index(faction_objective.general_family_member_cqi)
			return not family_member:is_null_interface() and family_member:is_alive(), not family_member:is_null_interface() and not family_member:is_convalescing(), "family_member_cqi", faction_objective.general_family_member_cqi
		end,
	},
}

military_strategy.vary_rewards = function(faction, objectives)
	if not objectives or #objectives < 2 then return end
	local model = faction:model()

	-- Determine which objectives would increase their reward and which would decrease it.
	local increased_index, decreased_index = model:random_int(1, #objectives), model:random_int(1, #objectives)
	if increased_index == decreased_index then
		increased_index = increased_index == 1 and increased_index + 1 or increased_index - 1
	end
	local increased_objectives, decreased_objectives = {}, {}
	for i, o in ipairs(objectives) do
		if i == increased_index or (i ~= decreased_index and model:random_int(1, 2) == 1) then
			table.insert(increased_objectives, o)
		else
			table.insert(decreased_objectives, o)
		end
	end

	-- Calculate the total variance in rewards. It is capped by the amound that can be deducted from the objectives with decreased rewards so that those do not go below the allowed minimum.
	local total_decreased_objectives_reward = table_accumulate(decreased_objectives, 0, function(value, objective) return value + objective.reward end)
	local variance = model:random_int(military_strategy.reward_variance_minimum_steps, military_strategy.reward_variance_maximum_steps) * military_strategy.reward_variance_step_value
	variance = math.min(variance, total_decreased_objectives_reward - military_strategy.reward_variance_minimum_reward * #decreased_objectives)
	variance = math.floor(variance / military_strategy.reward_variance_step_value)

	-- Distribute the increases and respective decreases in objective rewards, one step at a time.
	for s = 1, variance do
		increased_index = model:random_int(1, #increased_objectives)
		increased_objectives[increased_index].reward = increased_objectives[increased_index].reward + military_strategy.reward_variance_step_value

		decreased_index = model:random_int(1, #decreased_objectives)
		while decreased_objectives[decreased_index].reward - military_strategy.reward_variance_step_value < military_strategy.reward_variance_minimum_reward do
			table.remove(decreased_objectives, decreased_index)
			decreased_index = model:random_int(1, #decreased_objectives)
		end
		decreased_objectives[decreased_index].reward = decreased_objectives[decreased_index].reward - military_strategy.reward_variance_step_value
	end
end

military_strategy.ensure_minimum_rewards = function(faction_objectives)
	for methods, objectives in pairs(faction_objectives) do
		for _, objective in ipairs(objectives) do
			if objective.faction_reward_minimum then
				objective.reward = math.max(objective.reward, objective.faction_reward_minimum)
				objective.faction_reward_minimum = nil	-- Remove this, as it won't be needed anymore and therefore we do not want to put it in the game save.
			end
		end
	end
end

military_strategy.generate_objectives = function(faction)
	local faction_key = faction:name()
	-- Do not make objectives for the rebel fraction or a faction that has its objectives already generated.
	if faction:is_rebel() or military_strategy.faction_objectives[faction_key] then
		return
	end

	local is_horde = not faction:is_allowed_to_capture_territory()
	local vary_rewards = ((is_horde and military_strategy.reward_variance_apply_for_hordes) or (not is_horde and military_strategy.reward_variance_apply_for_non_hordes)) and {}
	military_strategy.faction_objectives[faction_key] = {}
	local faction_objectives = military_strategy.faction_objectives[faction_key]
	for _, objective in ipairs(military_strategy.objectives) do
		for _, definition in ipairs(objective.definitions) do
			local skip = definition.excluded_factions and table_contains(definition.excluded_factions, faction_key)
			if not skip and ((is_horde and definition.is_for_hordes) or (not is_horde and definition.is_for_non_hordes)) then
				local methods = military_strategy.objectives_methods[objective.methods]
				local new_faction_objectives = not methods.generator and {{}} or methods.generator(definition, faction)
				if is_table(new_faction_objectives) then
					faction_objectives[objective.methods] = faction_objectives[objective.methods] or {}
					for _, faction_objective in ipairs(new_faction_objectives) do
						faction_objective.completed = false
						faction_objective.reward = definition.base_reward
						table.insert(faction_objectives[objective.methods], faction_objective)
						-- Temporary add the per faction reward minimum, if there is one.
						faction_objective.faction_reward_minimum = definition.faction_reward_minimums and definition.faction_reward_minimums[faction_key]
						if vary_rewards and definition.vary_reward then
							table.insert(vary_rewards, faction_objective)
						end
					end
				end
			end
		end
	end

	military_strategy.process_generated_objectives(faction, faction_objectives, vary_rewards)

	if vary_rewards then
		military_strategy.vary_rewards(faction, vary_rewards)
	end
	military_strategy.ensure_minimum_rewards(faction_objectives)
end

military_strategy.process_generated_objectives = function(faction, faction_objectives, vary_rewards)
	-- Delete objectives that are for the same region as raze_specific_settlement objective.
	local raze_specific_settlement_config = table_find(military_strategy.objectives, function(o) return o.methods == "raze_specific_settlement" end)
	local raze_specific_settlement_objectives = faction_objectives.raze_specific_settlement
	if raze_specific_settlement_objectives and raze_specific_settlement_config and raze_specific_settlement_config.delete_same_region_objectives then
		for _, raze_specific_settlement_objective in ipairs(raze_specific_settlement_objectives) do
			if table_contains(raze_specific_settlement_config.delete_same_region_objectives, "conquer_capital") then
				if faction_objectives.conquer_capital and faction:has_home_region() and faction:home_region():name() == raze_specific_settlement_objective.region_key then
					table_erase(vary_rewards, faction_objectives.conquer_capital[1])
					faction_objectives.conquer_capital = nil
				end
			end

			if table_contains(raze_specific_settlement_config.delete_same_region_objectives, "raid_or_sack_resource_settlement") then
				if faction_objectives.raid_or_sack_resource_settlement and faction_objectives.raid_or_sack_resource_settlement[1].region_key == raze_specific_settlement_objective.region_key then
					table_erase(vary_rewards, faction_objectives.raid_or_sack_resource_settlement[1])
					faction_objectives.raid_or_sack_resource_settlement = nil
				end
			end
		end
	end
end

military_strategy.character_skill_point_changed = function(skill_key, is_allocated)
	local change_sign = is_allocated and 1 or -1
	local skill_rewards_changes = military_strategy.character_skills_objectives_reward_changing[skill_key]
	if skill_rewards_changes then
		for methods, changes in pairs(skill_rewards_changes) do
			military_strategy.objective_rewards_changes[methods] = military_strategy.objective_rewards_changes[methods] or { multiplier = 0, modifier = 0, }
			military_strategy.objective_rewards_changes[methods].multiplier = military_strategy.objective_rewards_changes[methods].multiplier + (changes.multiplier * change_sign)
			military_strategy.objective_rewards_changes[methods].modifier = military_strategy.objective_rewards_changes[methods].modifier + (changes.modifier * change_sign)
		end
	end	
	for _,current_skill in ipairs(military_strategy.character_skills_effects_for_having_dominance) do
		if skill_key == current_skill.db_key then
			if current_skill.is_active == false and is_allocated then
				current_skill.is_active = true
			elseif current_skill.is_active == true and not is_allocated then
				current_skill.is_active = false
			end
		end
	end
end

function military_strategy_is_faction_weaker(diomedes_faction, other_faction)
	if not diomedes_faction or diomedes_faction:is_null_interface() or not other_faction or other_faction:is_null_interface() then
			out("Error: Military Strategy diomedes or other faction is invalid! Other faction key is: " .. other_faction:name())
			return false
	end
	return diomedes_faction:strength() >= other_faction:strength() * military_strategy.weaker_faction_threshold
end

function military_strategy_get_diplomatic_action_dominance_cost(is_confederation)
	local cost = cm:model():get_campaign_variable_by_name("diplomatic_action_dominance_cost")
	if is_confederation then
		cost = cost + cm:model():get_campaign_variable_by_name("diplomatic_action_dominance_confederation_additional_cost")
	end
	return cost
end

function military_strategy_is_diplomatic_action_proposed(diplomacy_panel, action, search_in)
	search_in = search_in and search_in or "all"
	return is_component(diplomacy_panel:InterfaceFunction('find_diplomacy_offer_by_type', action, search_in))
end

function military_strategy_is_dominance_action_proposed(diplomacy_panel)
	return military_strategy_is_diplomatic_action_proposed(diplomacy_panel, "diplomatic_option_dominance")
end

function military_strategy_configure_dominance_button(context, diplomacy_panel)
	local dominance_button = diplomacy_panel:InterfaceFunction('find_diplomacy_button_by_type', "diplomatic_option_dominance")
	dominance_button = dominance_button and UIComponent(dominance_button) or nil
	if dominance_button then
		local button_state, button_tooltip_error = "active", nil
		local military_strategy_is_diplomatic_action_proposed_wrapper = function(result, action) return result or military_strategy_is_diplomatic_action_proposed(diplomacy_panel, action) end
		local diomedes_faction, other_faction = cm:get_faction(military_strategy.diomedes_faction_key), cm:get_faction(context.string)
		if not diomedes_faction:is_null_interface() and not other_faction:is_null_interface() and diomedes_faction:is_human() and other_faction:is_human() then
			button_state, button_tooltip_error = "inactive", "troy_adi_diomedes_diplomatic_action_dominance_inactive_reason_not_working_with_player"
		elseif table_accumulate(military_strategy.dominance_incompatible_diplomatic_actions, false, military_strategy_is_diplomatic_action_proposed_wrapper) then
			button_state, button_tooltip_error = "inactive", "troy_adi_diomedes_diplomatic_action_dominance_inactive_reason_not_compatible"
		elseif not military_strategy_is_faction_weaker(diomedes_faction, other_faction) then
			button_state, button_tooltip_error = "inactive", "troy_adi_diomedes_diplomatic_action_dominance_inactive_reason_not_weaker_faction"
		elseif cm:get_faction(military_strategy.diomedes_faction_key):pooled_resource(military_strategy.resource_key):value() < military_strategy_get_diplomatic_action_dominance_cost(military_strategy_is_diplomatic_action_proposed(diplomacy_panel, "diplomatic_option_confederation")) then
			button_state, button_tooltip_error = "inactive", "troy_adi_diomedes_diplomatic_action_dominance_inactive_reason_not_enough_resource"
		end

		dominance_button:SetState(button_state)
		local tooltip_text = nil						
		if button_tooltip_error and button_tooltip_error ~= '' then
			dominance_button:AppendTooltipText(button_tooltip_error, true)
		end					
	end
end

function military_strategy_configure_confederation_button(context, diplomacy_panel)
	if not military_strategy_is_dominance_action_proposed(diplomacy_panel) then
		return
	end
	local confederation_button = diplomacy_panel:InterfaceFunction('find_diplomacy_button_by_type', "diplomatic_option_confederation")
	confederation_button = confederation_button and UIComponent(confederation_button) or nil
	if confederation_button then
		if cm:get_faction(military_strategy.diomedes_faction_key):pooled_resource(military_strategy.resource_key):value() < military_strategy_get_diplomatic_action_dominance_cost(true) then
			confederation_button:SetState("inactive")
			confederation_button:AppendTooltipText("troy_adi_diomedes_diplomatic_action_dominance_inactive_reason_not_enough_resource", true)
		end
	end
end

function military_strategy_configure_incompatible_button(context, diplomacy_panel, button_type)
	local button = diplomacy_panel:InterfaceFunction('find_diplomacy_button_by_type', button_type)
	button = button and UIComponent(button) or nil
	if button then
		button:SetState("inactive")
		button:AppendTooltipText("troy_adi_diomedes_diplomatic_action_dominance_inactive_reason_not_compatible", true)
	end
end

function military_strategy_configure_all_incompatible_buttons(context, diplomacy_panel)
	if not military_strategy_is_dominance_action_proposed(diplomacy_panel) then
		return
	end
	for _, action in ipairs(military_strategy.dominance_incompatible_diplomatic_actions) do
		military_strategy_configure_incompatible_button(context, diplomacy_panel, action)
	end
end

function military_strategy_configure_strength_balance(context, diplomacy_panel)
	local offers_panel = diplomacy_panel:SequentialFind("offers_panel")
	local diomedes_faction, other_faction = cm:get_faction(military_strategy.diomedes_faction_key), cm:get_faction(context.string)
	local is_faction_weaker = military_strategy_is_faction_weaker(diomedes_faction, other_faction)

	local component_strength_balance = offers_panel and offers_panel:SequentialFind("strength_balance_bar")
	if component_strength_balance then
		component_strength_balance:SetState(is_faction_weaker and "Dominance" or "Default")
	end

	local component_indicator = offers_panel and offers_panel:SequentialFind("dominance_indicator")
	if component_indicator then
		component_indicator:SetVisible(true)
		component_indicator:SetState(is_faction_weaker and "Strong" or "Weak")	-- Note that the states refer to whether Diomedes' faction is strong or weak.
	end

	local component_threshold = offers_panel and offers_panel:SequentialFind("treshold_template")
	if component_threshold and component_strength_balance and military_strategy.weaker_faction_threshold >= 0 then
		local threshold = military_strategy.weaker_faction_threshold / (military_strategy.weaker_faction_threshold + 1)
		local offset_x, offset_y = component_threshold:GetDockOffset()
		component_threshold:SetDockOffset(threshold * component_strength_balance:Width(), offset_y)
		component_threshold:SetVisible(true)
	end
end

function military_strategy_configure_agree_button(context, diplomacy_panel)
	local their_offers = diplomacy_panel:InterfaceFunction("get_all_diplomacy_offers", "their")
	for action, _ in pairs(their_offers) do
		return
	end

	local your_offers = diplomacy_panel:InterfaceFunction("get_all_diplomacy_offers", "your")
	local is_dominance_proposed = false
	for action, _ in pairs(your_offers) do
		if action ~= "diplomatic_option_dominance" then
			return
		end
		is_dominance_proposed = true
	end

	if is_dominance_proposed then
		local component_agree = diplomacy_panel:SequentialFind("button_agree")
		if component_agree then
			component_agree:SetState("inactive")
			component_agree:AppendTooltipText("diplomacy_panel_agree_button_tooltip_add_offer", true)
		end
	end
end

military_strategy.ui.panel_open = function(context)
	local ui_context = UIComponent(context.component)
	local component_objectives_panel = ui_context:SequentialFind(military_strategy.ui.objectives.panel)
	if component_objectives_panel then
		component_objectives_panel:SetVisible(false)
	end

	military_strategy.ui.create_dominance_bar(ui_context)
	military_strategy.ui.create_factions_lists(ui_context)

	core:add_listener(
		"military_strategy_component_lclick",
		"ComponentLClickUp",
		true,
		military_strategy.ui.on_lclick,
		true
	)

	core:add_listener(
		"military_strategy_panel_closed",
		"PanelClosedCampaign",
		function(context) return context.string == military_strategy.ui.panel_name end,
		function(context)
			core:remove_listener("military_strategy_component_lclick")

			if military_strategy.ui.is_dead_template then
				military_strategy.ui.is_dead_template:Destroy()
			end
			military_strategy.ui.is_dead_template = nil

			if military_strategy.ui.is_at_peace_template then
				military_strategy.ui.is_at_peace_template:Destroy()
			end
			military_strategy.ui.is_at_peace_template = nil

			if military_strategy.ui.objective_template then
				military_strategy.ui.objective_template:Destroy()
			end
			military_strategy.ui.objective_template = nil
		end,
		false
	)
end

military_strategy.ui.create_dominance_bar = function(ui_context)
	local component_background, component_bar, component_marker = ui_context:SequentialFind(military_strategy.ui.dominance_bar.background), ui_context:SequentialFind(military_strategy.ui.dominance_bar.bar), ui_context:SequentialFind(military_strategy.ui.dominance_bar.marker)
	if component_background and component_bar and component_marker then
		local diomedes_faction = cm:get_faction(military_strategy.diomedes_faction_key)
		local maximum_dominance = math.max(military_strategy_get_diplomatic_action_dominance_cost(true), 1)
		local current_dominance = diomedes_faction:pooled_resource(military_strategy.resource_key)

		military_strategy.ui.fill_dominance_tiers_upper_bounds(not current_dominance:is_null_interface() and current_dominance:maximum_value() or -1)

		current_dominance = not current_dominance:is_null_interface() and current_dominance:value() or 0
		component_background:InterfaceFunction("set_data", { tiers = military_strategy.dominance_tiers, points = current_dominance, })

		local component_current_amount = component_marker:SequentialFind(military_strategy.ui.dominance_bar.current_amount)
		if component_current_amount then
			component_current_amount:SetText(tostring(current_dominance))
		end
		
		current_dominance = math.min(current_dominance, maximum_dominance) / maximum_dominance
		component_bar:Resize(math.max(current_dominance * component_background:Width(), 1), component_bar:Height())
		component_marker:Resize(math.max(current_dominance * component_background:Width(), 1), component_marker:Height())
	end
end

military_strategy.ui.fill_dominance_tiers_upper_bounds = function(maximum_dominance)
	if #military_strategy.dominance_tiers > 0 then
		for i = 1, #military_strategy.dominance_tiers - 1 do
			military_strategy.dominance_tiers[i].upper_bound = military_strategy.dominance_tiers[i + 1].lower_bound - 1
		end
		military_strategy.dominance_tiers[#military_strategy.dominance_tiers].upper_bound = maximum_dominance
	end
end

military_strategy.ui.create_factions_lists = function(ui_context)
	local diomedes_faction = cm:get_faction(military_strategy.diomedes_faction_key)
	local active_factions, inactive_factions = {}, {}
	for faction_key, _ in pairs(military_strategy.faction_objectives) do
		local faction = cm:get_faction(faction_key)
		if not faction:is_rebel() then
			local factions_list = (faction:is_dead() or not diomedes_faction:at_war_with(faction)) and inactive_factions or active_factions
			table.insert(factions_list, faction)
		end
	end

	-- Get all factions, sorted by rank.
	local factions_ranked, factions_all = {}, diomedes_faction:model():world():faction_list()
	for i = 0, factions_all:num_items() - 1 do
		table.insert(factions_ranked, {faction = factions_all:item_at(i)})
		factions_ranked[#factions_ranked].strength = factions_ranked[#factions_ranked].faction:strength()
	end
	factions_ranked = table_stable_sort(factions_ranked, function(lhs, rhs) return lhs.strength > rhs.strength end)

	military_strategy.ui.create_faction_list(ui_context, military_strategy.ui.active_factions_list, active_factions, diomedes_faction, factions_ranked)
	military_strategy.ui.create_faction_list(ui_context, military_strategy.ui.inactive_factions_list, inactive_factions, diomedes_faction, factions_ranked)

	if military_strategy.ui.auto_select_active_faction and #active_factions > 0 then
		local component_objectives_panel = ui_context:SequentialFind(military_strategy.ui.objectives.panel)
		if component_objectives_panel then
			local active_faction_key = active_factions[1]:name()
			component_objectives_panel:SetVisible(true)
			component_objectives_panel:SetProperty(military_strategy.ui.objectives.property_faction, active_faction_key)
			military_strategy.ui.show_objectives(component_objectives_panel, active_faction_key)
			local component_active_factions_list = ui_context:SequentialFind(military_strategy.ui.active_factions_list)
			if component_active_factions_list then
				local component_active_faction = component_active_factions_list:SequentialFind(military_strategy.ui.get_faction_component_id(active_faction_key))
				if component_active_faction then
					component_active_faction:SetState(military_strategy.ui.faction_list.template_states.selected)
				end
			end
		end
	end
end

military_strategy.ui.create_faction_list = function(ui_context, list_name, faction_list, diomedes_faction, factions_ranked)
	faction_data = {}
	selected_faction = ""

	local component_empty, component_sorting_arrows = ui_context:SequentialFind(list_name, military_strategy.ui.faction_list.empty), ui_context:SequentialFind(list_name, military_strategy.ui.faction_list.sort_arrows)
	if component_empty then
		component_empty:SetVisible(#faction_list <= 0)
	end
	if component_sorting_arrows then
		component_sorting_arrows:SetVisible(#faction_list > 0)
	end

	local component_view = ui_context:SequentialFind(list_name, military_strategy.ui.faction_list.view)
	if not component_view then
		return
	end
	component_view:SetVisible(#faction_list > 0)

	local component_list = ui_context:SequentialFind(list_name, military_strategy.ui.faction_list.list)
	if not component_list then
		return
	end

	local component_template = component_list:SequentialFind(military_strategy.ui.faction_list.template)
	if not component_template then
		return
	end

	if #faction_list > 0 then
		component_list:Divorce(component_template:Address())
		component_list:StallLayouts(true)

		for i, faction in ipairs(faction_list) do
			military_strategy.ui.add_faction_to_list(component_list, component_template, faction, diomedes_faction, factions_ranked)
		end

		component_list:StallLayouts(false)
		component_list:Layout()
	end
end

military_strategy.ui.add_faction_to_list = function(component_list, component_template, faction, diomedes_faction, factions_ranked)
	local faction_name, is_dead = faction:name(), faction:is_dead()

	local component_faction = UIComponent(component_list:CreateFromComponent(component_template:Address(), military_strategy.ui.get_faction_component_id(faction_name)))
	component_faction:SetProperty("faction_key", faction_name)

	local component_emblem = component_faction:SequentialFind(military_strategy.ui.faction_list.emblem)
	if component_emblem then
		component_emblem:SetImagePath(faction:flag_path() .. "\\mon_24.png")
		component_emblem:SetProperty("sort_value", table_accumulate({faction:subculture():byte(1, -1)}, 0))	-- Set this for sorting purposes.
	end

	local component_name = component_faction:SequentialFind(military_strategy.ui.faction_list.name)
	if component_name then
		component_name:SetText(common.get_localised_string("factions_screen_name_" .. faction_name), "factions_screen_name_" .. faction_name)
	end

	local component_power = component_faction:SequentialFind(military_strategy.ui.faction_list.balance_of_power.component)
	if component_power then
		component_power:SetVisible(not is_dead)
		local component_rank = component_faction:SequentialFind(military_strategy.ui.faction_list.balance_of_power.rank)
		if component_rank then
			local rank = table_find(factions_ranked, function(e) return e.faction:name() == faction_name end, true) or math.huge
			component_rank:SetText(tostring(rank))
			component_rank:SetProperty("sort_value", rank)
		end
		if not is_dead then
			local component_player, component_enemy = component_faction:SequentialFind(military_strategy.ui.faction_list.balance_of_power.player), component_faction:SequentialFind(military_strategy.ui.faction_list.balance_of_power.enemy)
			if component_player and component_enemy then
				local diomedes_strength, faction_strength = diomedes_faction:strength(), faction:strength()
				local total_strength = faction_strength + diomedes_strength
				local relative_strength = total_strength > 0 and diomedes_strength / total_strength or total_strength
				component_player:Resize(math.max(relative_strength * component_enemy:Width(), 1), component_player:Height())
			end
		end
	end

	local component_status = component_faction:SequentialFind(military_strategy.ui.faction_list.status)
	if component_status then
		component_status:SetVisible(not is_dead)
		if is_dead or faction:at_war_with(diomedes_faction) then
			component_status:SetState(military_strategy.ui.faction_list.status_state.war)
		elseif faction:defensive_allies_with(diomedes_faction) then
			component_status:SetState(military_strategy.ui.faction_list.status_state.defensive_alliance)
		elseif faction:military_allies_with(diomedes_faction) then
			component_status:SetState(military_strategy.ui.faction_list.status_state.military_alliance)
		else
			component_status:SetState(military_strategy.ui.faction_list.status_state.neutral)
		end
	end

	local component_attitude = component_faction:SequentialFind(military_strategy.ui.faction_list.attitude)
	if component_attitude then
		component_attitude:SetVisible(not is_dead)
		component_attitude:SetProperty("sort_value", is_dead and 0 or faction:attitude_with(military_strategy.diomedes_faction_key))
		component_attitude:SetState(faction:attitude_category_with(military_strategy.diomedes_faction_key))
		component_attitude:InterfaceFunction("set_faction", faction_name)
	end

	local component_diplomacy = component_faction:SequentialFind(military_strategy.ui.faction_list.diplomacy)
	if component_diplomacy then
		component_diplomacy:SetVisible(not is_dead)
		component_diplomacy:SetProperty("faction_key", faction_name)
	end

	local component_destroyed = component_faction:SequentialFind(military_strategy.ui.faction_list.destroyed)
	if component_destroyed then
		component_destroyed:SetVisible(is_dead)
	end

	component_faction:SetVisible(true)
end

military_strategy.ui.get_faction_component_id = function(faction_name)
	return military_strategy.ui.faction_list.template_instance_prefix .. faction_name
end

military_strategy.ui.is_dead_template = nil		-- This is used to store the is_dead text template, as it could be used through multiple calls to the below function.
military_strategy.ui.is_at_peace_template = nil	-- This is used to store the is_at_peace text template, as it could be used through multiple calls to the below function.
military_strategy.ui.objective_template = nil	-- This is used to store the objective template, as it could be used through multiple calls to the below function.

military_strategy.ui.show_objectives = function(component_objectives_panel, faction_name)
	local component_list = component_objectives_panel:SequentialFind(military_strategy.ui.objectives.list)
	if not component_list then
		return
	end

	local component_dead = component_list:SequentialFind(military_strategy.ui.objectives.dead)
	if component_dead then
		component_list:Divorce(component_dead:Address())
	end
	military_strategy.ui.is_dead_template = military_strategy.ui.is_dead_template or component_dead

	local component_at_peace = component_list:SequentialFind(military_strategy.ui.objectives.at_peace)
	if component_at_peace then
		component_list:Divorce(component_at_peace:Address())
	end
	military_strategy.ui.is_at_peace_template = military_strategy.ui.is_at_peace_template or component_at_peace

	local component_template = component_list:SequentialFind(military_strategy.ui.objectives.template)
	if component_template then
		component_list:Divorce(component_template:Address())
	end
	military_strategy.ui.objective_template = military_strategy.ui.objective_template or component_template
	if not military_strategy.ui.objective_template then
		return
	end

	component_list:StallLayouts(true)
	component_list:DestroyChildren()

	local faction = cm:get_faction(faction_name)
	if faction:is_dead() then
		local component_dead = UIComponent(component_list:CreateFromComponent(military_strategy.ui.is_dead_template:Address(), military_strategy.ui.objectives.dead))
		component_dead:SetVisible(true)
	elseif not faction:at_war_with(cm:get_faction(military_strategy.diomedes_faction_key)) then
		local component_at_peace = UIComponent(component_list:CreateFromComponent(military_strategy.ui.is_at_peace_template:Address(), military_strategy.ui.objectives.at_peace))
		component_at_peace:SetVisible(true)
	end

	local displayed_objectives = {}
	for _, objective in ipairs(military_strategy.objectives) do
		local methods = objective.methods
		if not displayed_objectives[methods] then
			displayed_objectives[methods] = true
			if military_strategy.faction_objectives[faction_name][methods] then
				for index, faction_objective in ipairs(military_strategy.faction_objectives[faction_name][methods]) do
					military_strategy.ui.add_objective_to_list(component_list, objective, index, faction_objective, faction)
				end
			end
		end
	end

	component_list:StallLayouts(false)
	component_list:Layout()
end

military_strategy.ui.add_objective_to_list = function(component_list, objective, index, faction_objective, faction)
	local objective_methods = military_strategy.objectives_methods[objective.methods]

	local objective_id = military_strategy.ui.objectives.template_instance_prefix .. objective.methods .. "_" .. tostring(index)
	local component_objective = UIComponent(component_list:CreateFromComponent(military_strategy.ui.objective_template:Address(), objective_id))
	component_objective:SetProperty("objective_id", objective_id)

	local component_text = component_objective:SequentialFind(military_strategy.ui.objectives.text)
	if component_text then
		local details = objective_methods.ui_details and {objective_methods.ui_details(faction_objective, faction)} or {}
		component_text:SetText(string.format(common.get_localised_string(objective.ui_text), unpack(details)), objective.ui_text)
	end

	local component_reward = component_objective:SequentialFind(military_strategy.ui.objectives.reward)
	if component_reward then
		component_reward:SetText(tostring(military_strategy.get_objective_reward(faction_objective, objective.methods)))
	end

	-- Get some objective details, like is it possible and its target and type of target.
	local is_possible, is_currently_possible, target_type, target_detail = true, true, nil, nil
	if objective_methods.get_is_possible_and_target then
		is_possible, is_currently_possible, target_type, target_detail = objective_methods.get_is_possible_and_target(faction_objective, faction)
	end

	local bullet_state, target_icon_state = military_strategy.ui.objectives.bullet_states.active, military_strategy.ui.objectives.target_icon_states.active
	local impossible_tooltip = nil
	if faction_objective.completed then
		bullet_state, target_icon_state = military_strategy.ui.objectives.bullet_states.completed, military_strategy.ui.objectives.target_icon_states.completed
	elseif not is_possible then
		bullet_state, target_icon_state = military_strategy.ui.objectives.bullet_states.impossible, military_strategy.ui.objectives.target_icon_states.impossible
		impossible_tooltip = objective.reason_permanently_impossible
	elseif not is_currently_possible then
		bullet_state = military_strategy.ui.objectives.bullet_states.impossible
		impossible_tooltip = objective.reason_currently_impossible
	end

	local component_bullet = component_objective:SequentialFind(military_strategy.ui.objectives.bullet)
	if component_bullet then
		component_bullet:SetState(bullet_state)
		if impossible_tooltip then
			component_bullet:SetInteractive(true)	-- The component in the UIEd is a template instance that is set to not interactive, therefore make it interactive here.
			component_bullet:SetTooltipText(common.get_localised_string(impossible_tooltip), impossible_tooltip, true)
		end
	end

	local component_target = component_objective:SequentialFind(military_strategy.ui.objectives.target)
	if component_target then
		component_target:SetVisible(not not (target_type and target_detail))
		if impossible_tooltip then
			component_target:SetTooltipText(common.get_localised_string(impossible_tooltip), impossible_tooltip, true)
		end
		if target_type and target_detail then
			component_target:SetProperty("target_type", target_type)
			component_target:SetProperty("target_detail", tostring(target_detail))
			if not is_currently_possible then
				component_target:SetState(military_strategy.ui.objectives.template_states.not_currently_possible)
			end

			local component_target_icon = component_target:SequentialFind(military_strategy.ui.objectives.target_icon)
			if component_target_icon then
				component_target_icon:SetState(target_icon_state)
				component_target_icon:SetVisible(true)
			end

			local component_target_name = component_target:SequentialFind(military_strategy.ui.objectives.target_name)
			if component_target_name then
				if target_type == "region_key" then
					component_target_name:SetText(common.get_localised_string("regions_onscreen_" .. target_detail), "regions_onscreen_" .. target_detail)
				elseif target_type == "family_member_cqi" then
					local family_member = faction:model():family_member_for_command_queue_index(target_detail)
					if not family_member:is_null_interface() then
						local forename_source, surname_source = family_member:get_forename(), family_member:get_surname()
						local forename = forename_source ~= "" and common.get_localised_string(forename_source) or ""
						local surname = surname_source ~= "" and common.get_localised_string(surname_source) or ""
						local full_name = forename .. ((forename ~= "" and surname ~= "" and " ") or "") .. surname
						component_target_name:SetText(full_name, forename_source ~= "" and forename_source or surname_source)

						if is_possible and is_currently_possible then
							local character = family_member:character()
							if character:is_null_interface() or not character:is_visible_to_faction(military_strategy.diomedes_faction_key) then
								component_target:SetState(military_strategy.ui.objectives.template_states.not_currently_possible)	-- This is the same button state as the not currently possible state.
								component_target:SetTooltipText(common.get_localised_string(military_strategy.target_general_not_visible), military_strategy.target_general_not_visible, true)
							end
						end
					end
				end
			end
		end
	end

	component_objective:SetVisible(true)
end

military_strategy.ui.close_panel = function()
	local panel = find_uicomponent(core:get_ui_root(), military_strategy.ui.panel_name)
	if panel and panel:Visible() then
		panel:InterfaceFunction("close_panel")
	end
end

military_strategy.ui.move_camera = function(ui_context)
	local target_type, target_detail = ui_context:GetProperty("target_type"), ui_context:GetProperty("target_detail")
	if target_type == "region_key" then
		military_strategy.ui.close_panel()
		cm:scroll_camera_to_settlement(target_detail)
	elseif target_type == "family_member_cqi" then
		local family_member = cm:model():family_member_for_command_queue_index(tonumber(target_detail))
		local character = not family_member:is_null_interface() and family_member:character()
		if character and not character:is_null_interface() then
			military_strategy.ui.close_panel()
			cm:scroll_camera_to_character(character:command_queue_index())
		end
	end
end

military_strategy.ui.on_lclick = function(context)
	local ui_context = UIComponent(context.component)
	local click_id = ui_context:Id();
	if click_id == military_strategy.ui.faction_list.diplomacy then
		local faction_name = ui_context:GetProperty("faction_key")
		if faction_name then
			local root_panel = core:get_ui_root():SequentialFind(military_strategy.ui.panel_name)
			root_panel:InterfaceFunction("open_diplomacy_with", faction_name)
		end
	elseif click_id:starts_with(military_strategy.ui.faction_list.template_instance_prefix) then
		local root_panel = core:get_ui_root():SequentialFind(military_strategy.ui.panel_name)
		local component_objectives_panel = root_panel:SequentialFind(military_strategy.ui.objectives.panel)
		if component_objectives_panel then
			-- If currently there is a selected faction, deselect it.
			local selected_faction_key = component_objectives_panel:GetProperty(military_strategy.ui.objectives.property_faction)
			if selected_faction_key and selected_faction_key ~= "" then
				local component_selected_faction = root_panel:SequentialFind(military_strategy.ui.get_faction_component_id(selected_faction_key))
				if component_selected_faction then
					component_selected_faction:SetState(military_strategy.ui.faction_list.template_states.unselected)
				end
			end

			-- Select the new faction.
			local faction_key = click_id:sub(#military_strategy.ui.faction_list.template_instance_prefix + 1)
			local objectives_faction_key = component_objectives_panel:GetProperty(military_strategy.ui.objectives.property_faction)
			local show_objectives = faction_key ~= objectives_faction_key
			component_objectives_panel:SetVisible(show_objectives)
			component_objectives_panel:SetProperty(military_strategy.ui.objectives.property_faction, show_objectives and faction_key or "")
			if show_objectives then
				military_strategy.ui.show_objectives(component_objectives_panel, faction_key)
			end
		end
	elseif click_id == military_strategy.ui.objectives.target then
		military_strategy.ui.move_camera(ui_context)
	end
end

military_strategy.trigger_event = function(faction_key, event_id, sec_detail_key, param1, param2, param3, second_faction_name)
	local event = military_strategy.dominance_event_feed_messages[event_id]

	local event_title = event.title
	local primary_detail = event.primary_detail
	local secondary_detail = not sec_detail_key and event.sec_detail
	if sec_detail_key then
		-- Special case for the objectives. Extract the secondarey detail from their configuration.
		local objective = table_find(military_strategy.objectives, function(objective) return objective.methods == sec_detail_key end)
		secondary_detail = objective and objective.event_message_detail
	end

	local event_pic = event.event_pic
	param1 = param1 or event.args[1]
	param2 = param2 or event.args[2]
	param3 = param3 or event.args[3]

	local str_param_1
	local str_param_2
	local str_param_3

	if second_faction_name and	event.event_pic == 2104 then
		str_param_1 = "factions_screen_name_" .. second_faction_name		
	end

	if event.not_on_screen == true then
		cm:show_configurable_message_event(faction_key, event_title, primary_detail, secondary_detail, event_pic, param1, param2, param3, str_param_1, str_param_2, str_param_3)
	else
		cm:show_message_event(faction_key, event_title, primary_detail, secondary_detail, true, event_pic, nil, nil, true, param1, param2, param3)
	end
end

military_strategy_is_dominance_full = function(faction_key)
	if faction_key == military_strategy.diomedes_faction_key then
		local faction = cm:get_faction(faction_key)
		if faction then
			local dominance_resource = faction:pooled_resource(military_strategy.resource_key)
			if not dominance_resource:is_null_interface() and dominance_resource:value() >= dominance_resource:maximum_value() then
				return true, military_strategy.end_turn_notification_text_key
			end
		end
	end
	return false
end

core:add_listener (
	"military_strategy_new_campaign_started",
	"NewCampaignStarted",
	true,
	function(context)
		if cm:get_faction(military_strategy.diomedes_faction_key) then
			local war_factions = cm:get_faction(military_strategy.diomedes_faction_key):factions_at_war_with()
			for i = 0, war_factions:num_items() - 1 do
				military_strategy.generate_objectives(war_factions:item_at(i))
			end
		end
		
	end,
	false
)

function military_strategy_add_listeners()
	core:add_listener(
		"military_strategy_diplomacy_negotiation_initialised",
		"DiplomacyNegotiationInitialised",
		function(context) return cm:get_local_faction_name(true) == military_strategy.diomedes_faction_key end,
		function(context)
			local diplomacy_panel = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown")
			if diplomacy_panel then
				military_strategy_configure_dominance_button(context, diplomacy_panel)
				military_strategy_configure_confederation_button(context, diplomacy_panel)
				military_strategy_configure_all_incompatible_buttons(context, diplomacy_panel)
				military_strategy_configure_strength_balance(context, diplomacy_panel)
				military_strategy_configure_agree_button(context, diplomacy_panel)
			end
		end, 
		true
	)

	core:add_listener(
		"military_strategy_panel_opened",
		"PanelOpenedCampaign",
		function(context) return context.string == military_strategy.ui.panel_name end,
		military_strategy.ui.panel_open,
		true
	);

	core:add_listener(
		"military_strategy_declare_war",
		"NegativeDiplomaticEvent",
		function(context) return context:is_war() and context:character():faction():name() == military_strategy.diomedes_faction_key end,
		function(context)
			local other_faction = context:proposer()
			if other_faction:name() == military_strategy.diomedes_faction_key then
				other_faction = context:recipient()
			end
			military_strategy.generate_objectives(other_faction)
		end, 
		true
	)

	core:add_listener(
		"military_strategy_dominance_threshold_reached",
		"PooledResourceTransactionEvent",
		function(context) return context:resource():key() == military_strategy.resource_key and context:faction():name() == military_strategy.diomedes_faction_key end,
		function(context)
			local resource = context:resource()
			local diplomatic_action_cost = military_strategy_get_diplomatic_action_dominance_cost(false)
			local confederation_cost = military_strategy_get_diplomatic_action_dominance_cost(true)
			
			if resource:value() >= confederation_cost then 
				military_strategy.trigger_event(context:faction():name(), "dominance_reached_confederation_threshold")
			elseif resource:value() >= diplomatic_action_cost and resource:value() - context:amount() < diplomatic_action_cost then 
				military_strategy.trigger_event(context:faction():name(), "dominance_reached_diplomatic_action_threshold")
			end
		end, 
		true
	)

	-- Start all objective listeners. For each methods type start a single listener.
	local added_listeners = {}
	for i = 1, #military_strategy.objectives do
		local methods = military_strategy.objectives[i].methods
		if not added_listeners[methods] then
			added_listeners[methods] = true
			local listeners = military_strategy.objectives_methods[methods].listeners
			for j = 1, #listeners do
				core:add_listener(
					"military_strategy_" .. military_strategy.objectives[i].methods .. "_" .. listeners[j].event .. "_" .. tostring(j),
					listeners[j].event,
					listeners[j].filter,
					listeners[j].body, 
					true
				)
			end
		end
	end

	core:add_listener(
		"military_strategy_character_skill_point_allocated",
		"CharacterSkillPointAllocated",
		true,
		function(context) return military_strategy.character_skill_point_changed(context:skill_point_spent_on(), true) end,
		true
	)

	core:add_listener(
		"military_strategy_character_skill_point_deallocated",
		"CharacterSkillPointDeallocated",
		true,
		function(context) return military_strategy.character_skill_point_changed(context:skill_point_spent_on(), false) end,
		true
	)

	core:add_listener(
		"military_strategy_character_skill_having_dominance_update",
		"PooledResourceTransactionEvent",
		function(context)
			return context:resource():key() == military_strategy.resource_key and context:faction():name() == military_strategy.diomedes_faction_key
		end,
		function(context)
			local faction_leader = context:faction():faction_leader()
			local faction_leader_cqi = faction_leader:command_queue_index()
			local resource_value = context:resource():value()
			for i = 1, #military_strategy.character_skills_effects_for_having_dominance do
				local skill = military_strategy.character_skills_effects_for_having_dominance[i]
				if skill.is_active then 
					if resource_value >= skill.required_dominance and resource_value - context:amount() < skill.required_dominance then
						cm:apply_effect_bundle_to_character(skill.effect_bundle_key, faction_leader_cqi, -1)
					elseif resource_value < skill.required_dominance and resource_value - context:amount() >= skill.required_dominance then
						local fl_effect_bundles = faction_leader:effect_bundles()
						for i = 0, fl_effect_bundles:num_items() - 1 do
							if fl_effect_bundles:item_at(i):key() == skill.effect_bundle_key then
								cm:remove_effect_bundle_from_character(skill.effect_bundle_key, faction_leader_cqi)
							end
						end
					end
				end					
			end 
		end,
		true
	)

	core:add_listener(
		"military_strategy_character_skill_having_dominance_point_allocated",
		"CharacterSkillPointAllocated",
		function(context) 
			local faction = context:character():faction()
			return faction:name() == military_strategy.diomedes_faction_key and context:character():is_faction_leader()
		end,
		function(context)			
			for i = 1, #military_strategy.character_skills_effects_for_having_dominance do
				local skill = military_strategy.character_skills_effects_for_having_dominance[i]
				if context:skill_point_spent_on() == skill.db_key then
					if context:character():faction():pooled_resource(military_strategy.resource_key):value() >= skill.required_dominance then
						cm:apply_effect_bundle_to_character(skill.effect_bundle_key, context:character():command_queue_index(), -1)
					end
					break
				end
			end
		end,
		true
	)

	core:add_listener(
		"military_strategy_character_skill_having_dominance_point_deallocated",
		"CharacterSkillPointDeallocated",
		function(context) 
			local faction = context:character():faction()
			return faction:name() == military_strategy.diomedes_faction_key and context:character():is_faction_leader()
		end,
		function(context)			
			for i = 1, #military_strategy.character_skills_effects_for_having_dominance do
				local skill = military_strategy.character_skills_effects_for_having_dominance[i]
				if context:skill_point_spent_on() == skill.db_key then
					cm:remove_effect_bundle_from_character(skill.effect_bundle_key, context:character():command_queue_index())
					break
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
		cm:save_named_value("TROY_MILITARY_STRATEGY_OBJECTIVES", military_strategy.faction_objectives, context)
		cm:save_named_value("TROY_MILITARY_STRATEGY_OBJECTIVE_REWARDS_CHANGES", military_strategy.objective_rewards_changes, context)
		cm:save_named_value("TROY_MILITARY_STRATEGY_CHARACTER_SKILLS_EFFECTS_FOR_HAVING_DOMINANCE", military_strategy.character_skills_effects_for_having_dominance, context)
	end
)

cm:add_loading_game_callback(
	function(context)
		military_strategy.faction_objectives = cm:load_named_value("TROY_MILITARY_STRATEGY_OBJECTIVES", military_strategy.faction_objectives, context)
		military_strategy.objective_rewards_changes = cm:load_named_value("TROY_MILITARY_STRATEGY_OBJECTIVE_REWARDS_CHANGES", military_strategy.objective_rewards_changes, context)
		military_strategy.character_skills_effects_for_having_dominance = cm:load_named_value("TROY_MILITARY_STRATEGY_CHARACTER_SKILLS_EFFECTS_FOR_HAVING_DOMINANCE", military_strategy.character_skills_effects_for_having_dominance, context)
	end
)