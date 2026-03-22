out("Loading phar_ancient_legacy_atreus_config.lua")

ancient_legacy_atreus_config = {
	resource_key = "troy_dominance",
	factor_key = "troy_resource_factor_faction",
	resource_starting_amount = 50,

	-- The strength of a faction is multiplied by this number when it is compared to the strength of the Atreus' faction, in order for the former to be considered weaker.
	weaker_faction_threshold = 1.25,

	-- For the list of diplomatic actions, see campaign_manager.diplomatic_options defined in _lib\lib_campaign_manager.lua
	dominance_incompatible_diplomatic_actions = { "diplomatic_option_join_war", "diplomatic_option_break_vassal", "diplomatic_option_break_subject", "diplomatic_option_break_defensive_alliance", "diplomatic_option_break_military_alliance", },

	dominance_tiers = {
		-- NOTE: The data listed here is used only for UI purpose!
		--	   This is so, because, by the current design, all Dominance powers are implemented via script.
		{
			cost = 50,
			title = "ui_text_replacements_localised_text_phar_map_al_atreus_tooltip_dominance_tier_title_1",
			description = "ui_text_replacements_localised_text_phar_map_al_atreus_tooltip_dominance_tier_description_1",
		},
		{
			cost = 100,
			title = "ui_text_replacements_localised_text_phar_map_al_atreus_tooltip_dominance_tier_title_2",
			description = "ui_text_replacements_localised_text_phar_map_al_atreus_tooltip_dominance_tier_description_2",
		},
		{
			cost = 200,
			title = "ui_text_replacements_localised_text_phar_map_al_atreus_tooltip_dominance_tier_title_3",
			description = "ui_text_replacements_localised_text_phar_map_al_atreus_tooltip_dominance_tier_description_3",
		},
	},

	ruler_dominance = {
		dominance_resource_cost_key = "phar_map_atreus_ruler_dominance_cost",	-- Resource cost key.
		factor_key = "phar_map_legitimacy_atreus_ruler_domiance",	-- The factor used for granting the legitimacy.
		-- The legitimacy resource cost keys for each of the Legitimacy resources. The factor should be the factor_key from this table.
		legitimacy_resource_cost_keys = {
			phar_legitimacy = "phar_map_atreus_ruler_dominance_reward_egyptian",
			phar_hatti_legitimacy = "phar_map_atreus_ruler_dominance_reward_hatti",
			phar_map_aegean_legitimacy = "phar_map_atreus_ruler_dominance_reward_aegean",
			phar_map_mesopotamian_legitimacy = "phar_map_atreus_ruler_dominance_reward_meso",
		},
		texts = {
			confirm_activation_key = "ui_text_replacements_localised_text_phar_map_al_atreus_confirm_ruler_dominance_activation_text",
			tooltip_title_key = "ui_text_replacements_localised_text_phar_map_al_atreus_tooltip_ruler_dominance_title",
			tooltip_duration_key = "ui_text_replacements_localised_text_phar_map_al_atreus_tooltip_ruler_dominance_duration",
			tooltip_action_key = "ui_text_replacements_localised_text_phar_map_al_atreus_tooltip_ruler_dominance_action",
			tooltip_warning_already_active_key = "ui_text_replacements_localised_text_phar_map_al_atreus_tooltip_ruler_dominance_warning_already_active",
			tooltip_warning_not_pretender_key = "ui_text_replacements_localised_text_phar_map_al_atreus_tooltip_ruler_dominance_warning_not_pretender",
			tooltip_warning_cant_afford_key = "ui_text_replacements_localised_text_phar_map_al_atreus_tooltip_ruler_dominance_warning_cant_afford",
		},
	},

	-- Battle Dominance is when an Atreus force, without any reinforcements, wins a victory against any faction's force.
	-- Optional requirement is that the victory is of a particular magnitude (for example, decisive).
	-- The amount of dominance gained is calculated based on the strength of the two forces.
	-- The amount is calculated by summing the unit value (taken from main_unit table, column multiplayer_cost) of all units on the two sides and using the formula:
	-- max(enemy_force_value - own_force_value, 0) * battle_dominance.unit_value_multiplier + rand(battle_dominance.variance_min, battle_dominance.variance_max)
	battle_dominance = {
		allowed_battle_results = { "decisive_victory", },
		unit_value_multiplier = 0.001,
		reward_variance_if_unit_value_is_negative = false,	-- If true, the variance would be added to the reward even if the enemy force is weaker.
		variance_min = 1,
		variance_max = 5,
	},

	total_dominance = {
		-- The tiers should be ordered by lower bound of number of completed objectives.
		-- A rarity must be provided and will be used for showing the rarity of the reward in the UI and to extract the list of ancillaries from phar_campaign_ancillaries.lua file.
		-- You can provide a custom list of ancillaries to choose from (using "list" key) to overwrite the default list of ancillaries for the given rarity.
		tiers = {
			{
				completed_objectives_lower_bound = 0,
				no_reward = true,	-- Flag that this is an auxiliary tier that does not grant any rewards.
			},
			{
				completed_objectives_lower_bound = 2,
				dominance_reward = 10,
				ancillary = { category = "follower", rarity = "common", },
			},
			{
				completed_objectives_lower_bound = 4,
				dominance_reward = 30,
				ancillary = { category = "follower", rarity = "rare", },
			},
			{
				completed_objectives_lower_bound = 6,
				dominance_reward = 50,
				ancillary = {
					category = "follower",
					rarity = "unique",
					list = {
						"phar_main_unique_13",
						"phar_main_unique_14",
						"phar_main_unique_15",
						"phar_main_unique_16",
						"phar_main_unique_17",
						"phar_main_unique_18",
						"phar_main_unique_19",
						"phar_main_unique_20",
						"phar_main_unique_21",
						"phar_main_unique_22",
						"phar_main_unique_23",
						"phar_main_unique_24",
						"phar_main_unique_25",
						"phar_map_hatshepsut_leopards",
						"phar_main_rare_45",
						"phar_main_rare_46",
						"phar_main_rare_47",
						"phar_map_hatshepsut_aegean_fishermen_unique",
						"phar_map_hatshepsut_ahlamu_scout_unique",
						"phar_map_hatshepsut_assyrian_builders_unique",
						"phar_map_hatshepsut_assyrian_mercenary_unique",
						"phar_map_hatshepsut_babylon_merchant_unique",
						"phar_map_hatshepsut_elamite_goldsmith_unique",
						"phar_map_hatshepsut_theban_veteran_unique",
						"phar_map_hatshepsut_thracian_forresters_unique",
						"phar_map_hatshepsut_urartu_craftsmen_unique",
					},
				},
			},
		},
		ui_text = "ui_text_replacements_localised_text_phar_map_atreus_total_dominance_objective_ui_text",
	},

	reward_variance_apply_for_hordes = false,
	reward_variance_apply_for_non_hordes = true,
	reward_variance_minimum_reward = 10,
	reward_variance_step_value = 5,
	reward_variance_minimum_steps = 8,	-- The minimum number of steps the reward variance algorithm will take when varying the rewards of all objectives against a single faction.
	reward_variance_maximum_steps = 16,	-- The maximum number of steps the reward variance algorithm will take when varying the rewards of all objectives against a single faction.
	
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
					base_reward = 60,
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
					turns_per_step = 20,	-- The number of turns since campaign start that consist a single step for the purpose of increasing the required amounts of raided resources.
					production_types = {
						phar_main_settlement_farm = { resource_key = "troy_food", amount_base = 400, amount_per_step = 200, },
						phar_main_settlement_lumber = { resource_key = "troy_wood", amount_base = 300, amount_per_step = 200, },
						phar_main_settlement_stone = { resource_key = "troy_stones", amount_base = 200, amount_per_step = 100, },
						phar_main_settlement_bronze = { resource_key = "troy_bronze", amount_base = 200, amount_per_step = 100, },
						phar_main_settlement_gold = { resource_key = "troy_gold", amount_base = 80, amount_per_step = 30, },
						phar_main_settlement_food_wood_nile = { resource_key = "troy_food", amount_base = 400, amount_per_step = 200, },
						phar_main_settlement_coastal = { resource_key = "troy_food", amount_base = 400, amount_per_step = 200, },
						phar_main_settlement_nile = { resource_key = "troy_food", amount_base = 400, amount_per_step = 200, },

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
					production_types = { "phar_main_settlement_bronze", "phar_main_settlement_coastal", "phar_main_settlement_farm", "phar_main_settlement_food_wood_nile", "phar_main_settlement_gold", "phar_main_settlement_lumber", "phar_main_settlement_stone" },
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
		-- {
		-- 	methods = "ambush_enemy",
		-- 	definitions = {
		-- 		{
		-- 			is_for_hordes = false, is_for_non_hordes = true,
		-- 			base_reward = 40,
		-- 			vary_reward = true,
		-- 			faction_reward_minimums = {
		-- 				troy_main_dan_ithaca = 40,
		-- 			},
		-- 		},
		-- 		{
		-- 			is_for_hordes = true, is_for_non_hordes = false,
		-- 			base_reward = 40,
		-- 		},
		-- 	},
		-- 	ui_text = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_ambush_enemy_ui_text",
		-- 	event_message_detail = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_ambush_enemy_event_message_detail",
		-- },
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
			methods = "raze_region_slot",
			definitions = {
				{
					is_for_hordes = true, is_for_non_hordes = true,
					base_reward = 30,
					vary_reward = true,
				},
			},
			ui_text = "ui_text_replacements_localised_text_phar_map_al_atreus_obj_raze_region_slot_ui_text",
			reason_currently_impossible = "ui_text_replacements_localised_text_phar_map_al_atreus_obj_raze_region_slot_reason_currently_impossible",
			event_message_detail = "ui_text_replacements_localised_text_phar_map_al_atreus_obj_raze_region_slot_event_message_detail",
		},
		{
			methods = "succeed_court_plot",
			definitions = {
				{
					is_for_hordes = false, is_for_non_hordes = true,
					base_reward = 40,
					vary_reward = true,
				},
			},
			ui_text = "ui_text_replacements_localised_text_phar_map_al_atreus_obj_succeed_court_plot_ui_text",
			reason_currently_impossible = "ui_text_replacements_localised_text_phar_map_al_atreus_obj_succeed_court_plot_reason_currently_impossible",
			event_message_detail = "ui_text_replacements_localised_text_phar_map_al_atreus_obj_succeed_court_plot_event_message_detail",
		},
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
	
		dominance_reached_court_action_threshold = {
			title = "event_feed_strings_text_troy_adi_scripted_event_diomedes_military_strategy_title",
			primary_detail = "event_feed_strings_text_phar_map_scripted_event_diomedes_military_strategy_dominance_accumulated_50_primary_details",
			sec_detail = "event_feed_strings_text_troy_event_feed_string_all_null",
			event_pic = 1121,
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

	text = {
		end_turn_notification_text_key = "campaign_localised_strings_string_end_turn_warning_dominance_full",
		target_general_not_visible = "ui_text_replacements_localised_text_troy_adi_fm_diomedes_obj_target_general_not_visible",
	},
}