out("Loading phar_commands.lua")

local is_tutorial = cm:get_saved_value("bool_is_tutorial_mode") or core:svr_load_bool("sbool_player_selected_first_turn_intro_on_frontend")

commands = {
	config = {
		-- The "activated" command is manually triggered, has some duration and then has cooldown before being able to be triggered again
		-- The default duration can be overriden for a particular activated command by adding "duration = <number>" to its config
		default_activated_effects_duration = 5,

		-- The "activated" command is manually triggered and has cooldown before being able to be triggered again
		-- The default cooldown can be overriden for a particular activated command by adding "cooldown = <number>" to its config
		default_activated_effects_cooldown = 6,

		-- The "passive" command is automatically triggered if the "activated" command has been inactive for "windup" turns
		-- The "passive" command will stay active until the "activated" command is triggered
		-- The default windup can be overriden for a particular passive command by adding "windup = <number>" to its config
		default_passive_effects_windup = 6,

		disable_activated_on_turn_passive_is_applied = false, -- Whether to allow the player to apply the "activated" command on the turn when the passive command has been applied
		default_unit_custom_id_for_buildings_giving_units = "passive_command",
		default_unit_custom_id_for_foreign_presence_giving_units = "troy_command",

		foreign_presence_min_influence = 20, -- (in percents) Minimal influence of foreign religions in own provinces in order to count a religion as Foreign Presence

		-- Debug flags
		break_on_error = false,
		show_console_messages = true,
		show_console_debug_messages = false,
		debug_force_enable_commands = false, -- If true, will make Commands always enabled for all human factions no matter of forbidding flags

		effects = {
			------------------ COMMANDS/EFFECTS DEFINITIONS PER FACTION ------------------
			-- Each faction has "activated" and "passive" effects defined
			-- Possible properties: see commands.effect_types and commands.effects_list_reserved_properties
			-- Values for text properties must be keys in the ui_text_replacements table

			-- FOR DESIGNERS: When adding a new faction, 1) add its commands here, 2) add its icon to hud_button_faction_icons

			-- FOR DEVS: When having to add new command effect (because a command needs different functionality that existing effect types don't offer),
			-- 1) Add its definition to commands.effect_types - what mandatory and optional parameters it accepts, what events should trigger updating the command button/tooltip
			-- 2) Add its apply function as commands.effect_types.<EFFECT_TYPE>.apply_function,
			-- 3) If the effect type needs removing of the effect when the command ends, the apply function should store data about what to remove
			--    in its persistent_data container (function parameter), and commands.effect_types.<EFFECT_TYPE>.clear_function should be added that reads
			--    this data and removes the effect
			-- 4) If the command should display some info about the effect in the tooltip (like displaying what units will be given), add function commands.effect_types.<EFFECT_TYPE>.update_tooltip
			-- 5) If the command tooltip's texts need replacing of a placeholder ({SOMETHING}) with a value from the effect, add function commands.effect_types.<EFFECT_TYPE>.replace_values_in_text

			------------------ Ramesses effects ------------------
			phar_main_ramesses = {
				texts = {
					title = "phar_main_commands_holder_ramesses_title",
					flavor = "phar_main_commands_holder_ramesses_flavor",
				},
				activated = {
					cooldown = 5,
					duration = 1,
					texts = {
						name = "phar_main_commands_use_ramesses_title",
						description = "phar_main_commands_use_ramesses_desc",
					},
					effect_bundle = { bundle_key = "phar_main_commands_ramesses_on_use", duration = 1 },
				},
				passive = {
					windup = 5,
					repeatable = 6,
					texts = {
						name = "phar_main_commands_shemsu_ramesses_title",
						description = "phar_main_commands_shemsu_ramesses_desc",
					},
					buildings_giving_units = {
						units_count_without_buildings = 1, -- Number of units, that are given even when no buildings (from units_by_building) are built
						units_count_per_building = 1, -- Number of units given per building (from units_by_buildings), added to units_count_without_buildings
						units_by_building = {
							-- Define what units are given by which building
							-- Should be sorted by tier; highest tier building must be at the end of the list
							{
								building = "phar_main_ramesses_military_infantry_type_a_1",
								units = {
									"phar_main_fac_ram_medjai_archers",
									"phar_main_fac_ram_medjai_chargers",
									"phar_main_fac_ram_medjai_swordsmen"
								}
							},
							{
								building = "phar_main_ramesses_military_infantry_type_a_2",
								units = {
									"phar_main_fac_ram_elite_medjai_archers",
									"phar_main_fac_ram_elite_medjai_warriors"
								}
							},
							{
								building = "phar_main_ramesses_military_infantry_type_a_3",
								units = {
									"phar_main_fac_ram_elite_medjai_warriors",
									"phar_main_fac_ram_elite_medjai_warriors_axe",
									"phar_main_fac_ram_medjai_spearmen"
								}
							},
						},
						rank_by_building = {
							-- Define the experience rank of all given units according to which building is built (highest rank of found building is taken)
							phar_main_ram_military_administration_hero_training_1 = 1,
							phar_main_ram_military_administration_hero_training_2 = 2,
							phar_main_ram_military_administration_hero_training_3 = 3,
						},
					},
				}
			},
			------------------ Seti effects ------------------
			phar_main_seti = {
				texts = {
					title = "phar_main_commands_holder_seti_title",
					flavor = "phar_main_commands_holder_seti_flavor",
				},
				activated = {
					cooldown = 5,
					duration = 1,
					texts = {
						name = "phar_main_commands_use_seti_title",
						description = "phar_main_commands_use_seti_desc",
					},
					effect_bundle = { bundle_key = "phar_main_commands_seti_on_use", duration = 1 },
				},
				passive = {
					windup = 5,
					texts = {
						name = "phar_main_commands_shemsu_seti_title",
						description = "phar_main_commands_shemsu_seti_desc",
					},
					effect_bundle = { bundle_key = "phar_main_commands_seti_shemsu_hor" },
				}
			},
			------------------ Tausret effects ------------------
			phar_main_tausret = {
				texts = {
					title = "phar_main_commands_holder_tausret_title",
					flavor = "phar_main_commands_holder_tausret_flavor",
				},
				activated = {
					cooldown = 4,
					duration = 1,
					texts = {
						name = "phar_main_commands_use_tausret_title",
						description = "phar_main_commands_use_tausret_desc",
						effect_condition = "phar_main_commands_use_condition_tausret",
					},
					effect_condition = "leader_is_in_own_or_vassal_province",
					gain_resources_leader_province_production = {
						factor = "troy_resource_factor_faction"
					},
					effect_bundle = { bundle_key = "phar_main_commands_tausret_on_use", duration = 1, target = "leaders_province" },
				},
				passive = {
					windup = 4,
					repeatable = 6,
					texts = {
						name = "phar_main_commands_shemsu_tausret_title",
						description = "phar_main_commands_shemsu_tausret_desc",
					},
					gain_free_instant_construction = {
						amount_without_regions = 1,
						amount_per_region = 1 / 6 -- Set to 1 / number if you want 1 Instant Construction to be given per several regions
					},
				}
			},
			------------------ Amenmesse effects ------------------
			phar_main_amenmesse = {
				texts = {
					title = "phar_main_commands_holder_amenmesse_title",
					flavor = "phar_main_commands_holder_amenmesse_flavor",
				},
				activated = {
					cooldown = 5,
					texts = {
						name = "phar_main_commands_use_amenmesse_title",
						description = "phar_main_commands_use_amenmesse_desc",
						effect_condition = "phar_main_commands_use_condition_amenmesse",
					},
					effect_condition = "add_ancillary_cost",
					add_ancillary = {
						ancillary_key = "phar_main_commands_amenmesse_mask",
						initial_cost = { troy_gold = 100 },
						cost_increment = { troy_gold = 50 }, -- Price increase for each usage
						factor = "troy_resource_factor_faction",
						display_event = true
					},
				},
				passive = {
					windup = 5,
					texts = {
						name = "phar_main_commands_shemsu_amenmesse_title",
						description = "phar_main_commands_shemsu_amenmesse_desc",
					},
					effect_bundle = { bundle_key = "phar_main_commands_amenmesse_shemsu_hor" },
				}
			},
			------------------ Irsu effects ------------------
			phar_main_irsu = {
				texts = {
					title = "phar_main_commands_holder_irsu_title",
					flavor = "phar_main_commands_holder_irsu_flavor",
				},
				activated = {
					texts = {
						name = "phar_main_commands_use_irsu_title",
						description = "phar_main_commands_use_irsu_desc",
					},
					pillars_of_civilization_entry = {
						text_id = "phar_main_pillars_civilization_irsu_threat_points",
						points = -50
					},
					pillars_of_civilization_level_bundles = {
						collapse = "phar_main_commands_irsu_on_use_collapse",
						crisis = "phar_main_commands_irsu_on_use_crisis",
						prosperity = "phar_main_commands_irsu_on_use_prosperity",
					},
					disallow_faction_occupation_decision = {
						occupation_decision = "occupation_decision_occupy",
					}
				},
				passive = {
					windup = 4,
					texts = {
						name = "phar_main_commands_shemsu_irsu_title",
						description = "phar_main_commands_shemsu_irsu_desc",
					},
					effect_bundle = { bundle_key = "phar_main_commands_irsu_shemsu_hor" },
				}
			},
			------------------ Bay effects ------------------
			phar_main_bay = {
				texts = {
					title = "phar_main_commands_holder_bay_title",
					flavor = "phar_main_commands_holder_bay_flavor",
				},
				activated = {
					cooldown = 5,
					texts = {
						name = "phar_main_commands_use_bay_title",
						description = "phar_main_commands_use_bay_desc",
						effect_condition = "phar_main_commands_use_condition_bay",
					},
					effect_condition = "has_ongoing_research",
					instantly_complete_ongoing_research = {
						complete_only_first_one = true,
					},
				},
				passive = {
					windup = 5,
					texts = {
						name = "phar_main_commands_shemsu_bay_title",
						description = "phar_main_commands_shemsu_bay_desc",
					},
					effect_bundle = { bundle_key = "phar_main_commands_bay_shemsu_hor" },
				}
			},
			------------------ Suppiluliuma effects ------------------
			phar_main_suppiluliuma = {
				texts = {
					title = "phar_main_commands_holder_suppi_title",
					flavor = "phar_main_commands_holder_suppi_flavor",
				},
				activated = {
					cooldown = 5,
					duration = 1,
					texts = {
						name = "phar_main_commands_use_suppi_title",
						description = "phar_main_commands_use_suppi_desc",
					},
					effect_bundle = { bundle_key = "phar_main_commands_suppi_on_use", duration = 1 },
				},
				passive = {
					windup = 5,
					texts = {
						name = "phar_main_commands_shemsu_suppi_title",
						description = "phar_main_commands_shemsu_suppi_desc",
					},
					effect_bundle = { bundle_key = "phar_main_commands_suppi_shemsu_hor" },
				}
			},
			------------------ Kurunta effects ------------------
			phar_main_kurunta = {
				texts = {
					title = "phar_main_commands_holder_kurunta_title",
					flavor = "phar_main_commands_holder_kurunta_flavor",
				},
				activated = {
					texts = {
						name = "phar_main_commands_use_kurunta_title",
						description = "phar_main_commands_use_kurunta_desc",
					},
					effect_bundle = { bundle_key = "phar_main_commands_kurunta_on_use" },
					disallow_faction_occupation_decision = {
						occupation_decision = "occupation_decision_colonise",
					},
				},
				passive = {
					windup = 4,
					texts = {
						name = "phar_main_commands_shemsu_kurunta_title",
						description = "phar_main_commands_shemsu_kurunta_desc",
					},
					effect_bundle = { bundle_key = "phar_main_commands_kurunta_shemsu_hor" },
				}
			},
			------------------ Walwetes effects ------------------
			phar_sea_peleset = {
				texts = {
					title = "phar_sea_commands_holder_walwetes_title",
					flavor = "phar_sea_commands_holder_walwetes_flavour",
				},
				activated = {
					cooldown = 4,
					texts = {
						name = "phar_sea_commands_use_walwetes_title",
						description = "phar_sea_commands_use_walwetes_desc",
					},
					effect_bundle = { bundle_key = "phar_main_commands_walwetes_on_use" },
					custom_effect_bundle = {
						bundle_key = "phar_main_commands_walwetes_on_use_custom_bundle",
						effects = {
							{
								effect_key = "phar_economy_add_food_commands_faction",
								scope = "faction_to_faction_own",
								value = "unit_count",
								value_multiplier = 100, -- food per unit
								replaced_value_multiplier_label = "{X}",
								mounted_units = true, -- If true, then only units of category "cavalry" or of "war_machine" (when num_mounts > 0) will be counted; if false, then only non-mounted units will be counted; remove/comment this line to remove filtering by is_mounted
								in_horde = false,
							},
							{
								effect_key = "phar_sea_horde_growth_buildings",
								scope = "faction_to_force_own",
								value = "unit_count",
								value_multiplier = 3, -- horde growth per unit
								replaced_value_multiplier_label = "{Y}",
								mounted_units = true, -- If true, then only units of category "cavalry" or of "war_machine" (when num_mounts > 0) will be counted; if false, then only non-mounted units will be counted; remove/comment this line to remove filtering by is_mounted
								in_horde = true,
							},
						}
					},
				},
				passive = {
					texts = {
						name = "phar_sea_commands_shemsu_walwetes_title",
						description = "phar_sea_commands_shemsu_walwetes_desc",
					},
					-- Define what resources are given for each unit that can be dismissed in Special Recruitment by
					-- adding records to the following tables:
					--  - resource_costs (id must be unit key + "_dismiss")
					--  - resource_cost_pooled_resource_junctions
					-- Note that the functionality for dismissing units from the Special Recruitment panel can work independently from commands:
					-- Only adding resource-cost records for some units will cause the Dismiss button to appear in the Special Recruitment panel (when it contains such units)
					-- The Dismiss button's tooltip will show what unit will be dismissed and what resources will be gained
					buildings_giving_units = {
						units_count_without_buildings = 1, -- Number of units, that are given even when no buildings (from units_by_building) are built
						units_count_per_building = 1, -- Number of units given per building (from units_by_buildings), added to units_count_without_buildings
						units_by_building = {
							-- Define what units are given by which building
							-- Should be sorted by tier; highest tier building must be at the end of the list
							{
								building = "phar_sea_peleset_military_mounted_2",
								units = {
									"phar_sea_fac_pel_oxen_chariots",
								}
							},
						},
						rank_by_building = {
							-- Define the experience rank of all given units according to which building is built (highest rank of found building is taken)
							-- If no buldings and ranks are supplied here, all given units will be of rank 0
							-- Set which buildings give what rank to units (if we want them to have rank > 0)
							--phar_main_ram_military_administration_hero_training_1 = 1,
						},
						custom_unit_id = "peleset_passive_command",
					},
					set_shared_state = {
						state_key = "can_dismiss_units",
						value = true
					},
				}
			},
			------------------ Iolaos effects ------------------
			phar_sea_sherden = {
				texts = {
					title = "phar_sea_commands_holder_iolaos_title",
					flavor = "phar_sea_commands_holder_iolaos_flavour",
				},
				activated = {
					texts = {
						name = "phar_main_commands_use_iolaos_title",
						description = "phar_sea_commands_use_iolaos_desc",
					},
					effect_bundle = { bundle_key = "phar_sea_commands_iolaos_on_use" },
				},
				passive = {
					windup = 4,
					texts = {
						name = "phar_sea_commands_shemsu_iolaos_title",
						description = "phar_sea_commands_shemsu_iolaos_desc",
					},
					extra_levels_to_war_spoils = {
						levels = 1, increase_max_level = true
					},
				},
			},
			------------------ Mycenae effects ------------------
			troy_main_dan_mycenae = {
				texts = {
					title = "phar_map_commands_holder_mycenae_title",
					flavor = "phar_map_commands_holder_mycenae_flavor",
				},
				activated = {
					texts = {
						name = "phar_map_commands_use_mycenae_title",
						description = "phar_map_commands_use_mycenae_desc",
						effect_condition = { -- Must be in the same order as in activated.effect_condition
							"phar_main_commands_use_condition_has_faction_leader",
							"phar_main_commands_use_condition_space_in_army"
						}
					},
					cooldown = 4,
					effect_condition = { "has_faction_leader", "faction_leader_space_in_army" },
					effect_condition_is_only_warning = { false, true },
					add_random_ancillary = {
						common_min_rank = 1,
						rare_min_rank = 10,
						realm_unique_min_rank = 20,
						add_rare_when_realm_unique_already_given = true,
						display_event = true
					},
					add_native_realm_units = {
						target = "faction_leader",
						amount = 1,
						tier_by_target_rank = {
							{ tier = 1, min_rank = 1, max_rank = 9 },
							{ tier = 2, min_rank = 1, max_rank = 9 },
							{ tier = 3, min_rank = 10, max_rank = 19 },
							{ tier = 4, min_rank = 20 },
						},
					}
				},
				passive = {
					texts = {
						name = "phar_map_commands_passive_mycenae_title",
						description = "phar_map_commands_passive_mycenae_desc",
					},
					windup = 4,
					poc_level_effect_bundles = {
						{ effect_type = "effect_bundle", bundle_key = "phar_main_commands_mycenae_passive_prosperity", condition = "pillars_civilization_level", condition_value = "prosperity" },
						{ effect_type = "effect_bundle", bundle_key = "phar_main_commands_mycenae_passive_crisis", condition = "pillars_civilization_level", condition_value = "crisis" },
						{ effect_type = "effect_bundle", bundle_key = "phar_main_commands_mycenae_passive_collapse", condition = "pillars_civilization_level", condition_value = "collapse" },
					},
					effect_bundle = { bundle_key = "phar_main_commands_mycenae_passive", target = "provinces", condition = "complete_provinces" },
				}
			},
			------------------ Troy effects ------------------
			troy_main_trj_troy = {
				texts = {
					title = "phar_map_commands_holder_troy_title",
					flavor = "phar_map_commands_holder_troy_flavor",
				},
				activated = {
					texts = {
						name = "phar_map_commands_use_troy_title",
						description = "phar_map_commands_use_troy_desc",
					},
					duration = 3,
                    cooldown = 0,
					foreign_presence_giving_units = {
						units_count_per_fp = 1,
						upkeep_cost_record_key = "phar_map_commands_troy_gold_upkeep", -- TODO Add cost record and set here
						min_tier = 5,
					},
				},
				passive = {
					shuffle = false,
					texts = {
						name = "phar_map_commands_passive_troy_title",
						description = "phar_map_commands_passive_troy_desc",
					},
					windup = 1,
					custom_effect_bundle = {
						bundle_key = "phar_map_commands_troy_passive",
						effects = {
							{
								effect_key = "phar_map_base_amount_pooled_resource_factor_troy_command_foreign_presence_gold",
								scope = "faction_to_faction_own",
								value = "foreign_presence",
								value_multiplier = 50, -- Gold per foreign presence
								replaced_value_multiplier_label = "{GOLD}",
							},
							-- the following effects are just playerfacing. They don't work with this setup. 
							{
								effect_key = "phar_map_morale_battle_context_against_troy",
								scope = "faction_to_force_enemy_own_territory",
								value = "foreign_presence",
								value_multiplier = -2, -- Effect value per foreign presence
							},
							{
								effect_key = "phar_map_charge_bonus_battle_context_against_troy",
								scope = "faction_to_force_enemy_own_territory",
								value = "foreign_presence",
								value_multiplier = -4, -- Effect value per foreign presence
							},
						}
					},

					-- This setup is what makes the effects work and we apply it all other factions. 
					custom_effect_bundle_2 = {
						bundle_key = "phar_map_commands_troy_passive_other_factions",
						effects = {
							{
								effect_key = "phar_map_morale_battle_context_against_troy",
								scope = "faction_to_force_own",
								value = "foreign_presence",
								value_multiplier = -2, -- Effect value per foreign presence
							},
							{
								effect_key = "phar_map_charge_bonus_battle_context_against_troy",
								scope = "faction_to_force_own",
								value = "foreign_presence",
								value_multiplier = -4, -- Effect value per foreign presence
							},
						},
						apply_on_all_other_factions = true,
					},
				},
			},
			------------------ Ninurta effects ------------------
			phar_map_ninurta = {
				texts = {
					title = "phar_map_commands_holder_ninurta_title",
					flavor = "phar_map_commands_holder_ninurta_flavor",
				},
				activated = {
					texts = {
						name = "phar_map_commands_use_ninurta_title",
						description = "phar_map_commands_use_ninurta_desc",
						effect_condition = "phar_map_commands_use_condition_ninurta",
					},
					cooldown = 0,
					effect_condition = "has_selected_character",
					effect_bundle = { bundle_key = "phar_map_commands_ninurta_on_use", target = "selected_character" },
					spend_military_training_points = {
						spend_on = "selected_character_units_ranks",
						multiply_spent_points_by_unit_rank = true, -- (i.e. cost from 3 to 5, requires 4+5 pts instead of just 2)
						remove_unspent_points = false,	-- Determines if remaining unspent points are retained or not after using the Command
					}
				},
				passive = {
					texts = {
						name = "phar_map_commands_passive_ninurta_title",
						description = "phar_map_commands_passive_ninurta_desc",
					},
					windup = 0,
					repeatable = 1, -- Add points and check whether to apply the bundle on every turn
					show_is_repeatable = false, -- We don't want to display in the tooltip that the command repeats every turn

					-- The effect add_military_training_points should be defined before the effect_bundle with condition = "military_training_points",
					-- so that the bundle is applied on the same turn that the points reach the threshold (not on next turn)
					add_military_training_points = {
						points_multiplier = 10, -- Points per war
					},
					effect_bundle = {
						bundle_key = "phar_map_commands_ninurta_passive",
						condition = "military_training_points",
						condition_value = 100
					}
				}
			},
			------------------ Babylon effects ------------------
			phar_map_babylon = {
				texts = {
					title = "phar_map_commands_holder_babylon_title",
					flavor = "phar_map_commands_holder_babylon_flavor",
				},
				activated = {
					texts = {
						name = "phar_map_commands_use_babylon_title",
						description = "phar_map_commands_use_babylon_desc",
					},
					effect_bundle = { bundle_key = "phar_map_commands_babylon_on_use" }
				},
				passive = {
					texts = {
						name = "phar_map_commands_passive_babylon_title",
						description = "phar_map_commands_passive_babylon_desc",
					},
					repeatable = 6, -- Set how often the effect has to repeat (give units)
					buildings_giving_units = {
						units_count_without_buildings = 0, -- Number of units, that are given even when no buildings (from units_by_building) are built
						units_count_per_building = 1, -- Number of units given per building (from units_by_buildings), added to units_count_without_buildings
						shuffle_units = true,
						remove_given_units_on_clear = false, -- Whether to remove the given units from the recruitment pool when the effect finishes (i.e. when command repeats or activated command is applied)
						units_by_building = {
							{
								building = "cult_centre_main", -- Special value telling the code to search for owned cult center settlements and their main buildings
								unit_set = "phar_map_siluhlu_units"
							},
						},
						rank_by_building_level_multiplier = 1, -- Ranks increase per level of building
						custom_unit_id = "ambition_babylon_command",
					}
				}
			},
		},

		texts = {
			lclick_to_use = "phar_main_commands_action_text_use",
			use_again_in_x_turns = "phar_main_commands_cooldown",
			cannot_apply_on_same_turn_as_passive = "phar_main_commands_cannot_use_shemsu_hor",
			cooldown_total_turns = "phar_main_commands_cooldown_total_turns",
			windup_total_turns = "phar_main_commands_windup_total_turns",
			repeat_total_turns = "phar_main_commands_repeat_total_turns",
			apply_command_dialogue_title = "phar_main_commands_apply_title",
			apply_command_dialogue_text = "phar_main_commands_apply_text",
			foreign_presence_description = "phar_main_commands_foreign_presence_description",
			foreign_presence_status = "phar_main_commands_foreign_presence_status",
			selected_character_none = "phar_main_commands_selected_character_none",
		},

		hud_button_tooltip_layout_path = "UI/Campaign UI/tooltip_commands",

		resource_icons = {
			troy_food = "UI/Campaign UI/pooled_resources/icon_res_food_medium.png",
			troy_stones = "UI/Campaign UI/pooled_resources/icon_res_stone_medium.png",
			troy_gold = "UI/Campaign UI/pooled_resources/icon_res_gold_medium.png",
			troy_bronze = "UI/Campaign UI/pooled_resources/icon_res_bronze_medium.png",
			troy_wood = "UI/Campaign UI/pooled_resources/icon_res_wood_medium.png",
		},

		cost_icons = {
			troy_food = "UI/skins/default/legacy_hatchepsut/icon_trade_item_food.png",
			troy_stones = "UI/skins/default/legacy_hatchepsut/icon_trade_item_stone.png",
			troy_gold = "UI/skins/default/legacy_hatchepsut/icon_trade_item_gold.png",
			troy_bronze = "UI/skins/default/legacy_hatchepsut/icon_trade_item_bronze.png",
			troy_wood = "UI/skins/default/legacy_hatchepsut/icon_trade_item_wood.png",
		},

		hud_button_faction_icons = {
			phar_main_ramesses = "UI/skins/default/faction_summary/icons/phar_summary_icon_commands_ramesses.png",
			phar_main_seti = "UI/skins/default/faction_summary/icons/phar_summary_icon_commands_seti.png",
			phar_main_tausret = "UI/skins/default/faction_summary/icons/phar_summary_icon_commands_tausret.png",
			phar_main_amenmesse = "UI/skins/default/faction_summary/icons/phar_summary_icon_commands_amenmesse.png",
			phar_main_merneptah = "UI/skins/default/faction_summary/icons/phar_summary_icon_commands_merneptah.png",
			phar_main_setnakhte = "UI/skins/default/faction_summary/icons/phar_summary_icon_commands_setnakhte.png",
			phar_main_irsu = "UI/skins/default/faction_summary/icons/phar_summary_icon_commands_irsu.png",
			phar_main_bay = "UI/skins/default/faction_summary/icons/phar_summary_icon_commands_bay.png",
			phar_main_suppiluliuma = "UI/skins/default/faction_summary/icons/phar_summary_icon_commands_suppiluliuma.png",
			phar_main_kurunta = "UI/skins/default/faction_summary/icons/phar_summary_icon_commands_kurunta.png",
			phar_sea_peleset = "UI/skins/default/faction_summary/icons/icon_commands_walwetes.png",
			phar_sea_sherden = "UI/skins/default/faction_summary/icons/icon_commands_iolaos.png",
			troy_main_dan_mycenae = "UI/skins/default/faction_summary/icons/phar_map_summary_icon_commands_mycenae.png",
			troy_main_trj_troy = "UI/skins/default/faction_summary/icons/phar_map_summary_icon_commands_troy.png",
			phar_map_ninurta = "UI/skins/default/faction_summary/icons/phar_map_summary_icon_commands_assyria.png",
			phar_map_babylon = "UI/skins/default/faction_summary/icons/phar_map_summary_icon_commands_babilim.png"
		},

		component_ids = {
			hud_button_container = "commands_holder",
			hud_button = "button_commands",
			hud_button_cooldown_counter = "cooldown_counter",
			hud_button_glow = "selected_glow",
			hud_button_active_fx = "active_on_fx",

			tooltip_title = "dy_title",
			tooltip_flavor = "dy_description",
			tooltip_activated_container = "active_effect_list",
			tooltip_passive_container = "passive_effect_list",
			tooltip_on_passive = "on_shemsu_txt",
			tooltip_command_icon_container = "frame_command",
			tooltip_effect_turns_counter_container = "active_state",
			tooltip_effect_name = "dy_effect_name",
			tooltip_effect_is_active_txt = "active_state_tx",
			tooltip_effect_description = "dy_effect_description",
			tooltip_effect_cooldown_description = "dy_effect_cooldown",
			tooltip_effect_windup_description = "dy_effect_turns_windup",
			tooltip_effect_repeat_description = "dy_effect_turns_repeat",
			tooltip_units_template = "unit_cards_list",
			tooltip_cost_template = "cost_list",
			tooltip_resources_template = "commands_resources_container",
			tooltip_additional_info_section = "additional_info",
			tooltip_additional_info_description = "dy_additional_description",
			tooltip_additional_info_status = "dy_effect_charges",
			tooltip_warning = "dy_warning",
			tooltip_action = "dy_action",
		},

		-- UITriggerScriptEvent events
		-- event param's format: script_events.prefix .. ":" .. script_events[x]
		script_events = {
			prefix = "faction_commands",
			use_activated = "use_activated",
		},

		hud_button_script_id = "commands_hud_button_tooltip",

		save_load_value_name = "faction_commands"
	},

	effect_types = {
		-- Apply effect bundle on own faction (or other faction(s) if 'faction_key' is supplied); Optionally supply duration in number of turns
		-- 'target' can be "faction" (default), "characters", "selected_character", "faction_leader", "forces", "provinces" or "leaders_province"
		-- 'condition' can be "pillars_civilization_level" (state/level name to be supplied in 'condition_value'), or "complete_provinces" (for when target == "provinces"), or "military_training_points" (for minimal points supplied in 'condition_value')
		-- 'condition_value' can be "prosperity" / "crisis" / "collapse" (when 'condition' is "pillars_civilization_level"), or number of points (when 'condition' is "military_training_points")
		effect_bundle = {
			mandatory_keys = { "bundle_key" },
			optional_keys = { "duration", "faction_key", "target", "condition", "condition_value" }
		},
		-- Apply custom effect bundle on own faction; Optionally supply duration in number of turns
		-- effects is a list of items with format { effect_key = "key", scope = "scope", value = number or "unit_count" or "foreign_presence", value_multiplier = number, [replaced_value_multiplier_label = "{LABEL}", mounted_units = true/false, in_horde = true/false]}
		-- when counting units for an effect value, you can filter them with the optional bool params "mounted_units" and "in_horde"
		-- If "mounted_units" = true is supplied, then only units of category "cavalry" or of "war_machine" (when num_mounts > 0) will be counted
		custom_effect_bundle = {
			mandatory_keys = { "bundle_key", "effects" },
			optional_keys = { "duration", "apply_on_all_other_factions" },
		},
		-- Add to mercenary pool according to what buildings the faction has built
		buildings_giving_units = {
			mandatory_keys = { "units_count_without_buildings", "units_count_per_building", "units_by_building" },
			optional_keys = { "custom_unit_id", "shuffle_units", "remove_given_units_on_clear", "rank_by_building", "rank_by_building_level_multiplier" }
		},
		-- Add to mercenary pool according to Foreign Presence
		foreign_presence_giving_units = {
			mandatory_keys = { "units_count_per_fp" },
			optional_keys = { "custom_unit_id", "upkeep_cost_record_key", "min_tier" }
		},
		-- Instantly gain resources equal to the current production of faction leader's local province
		gain_resources_leader_province_production = {
			mandatory_keys = { "factor" },
			update_button_on_events = { "commands_CharacterFinishedMovingEvent" },
		},
		-- Gain free uses of Instant Construction
		gain_free_instant_construction = {
			mandatory_keys = { "amount_without_regions", "amount_per_region" },
		},
		-- Add ancillary to faction with incrementing cost
		add_ancillary = {
			mandatory_keys = { "ancillary_key", "factor", "initial_cost", "cost_increment", "display_event" },
			update_button_on_events = { "commands_PooledResourceTransactionEvent" },
		},
		-- Add random ancillary to faction depending on faction leader's rank
		add_random_ancillary = {
			mandatory_keys = {},
			optional_keys = { "common_min_rank", "rare_min_rank", "realm_unique_min_rank", "add_rare_when_realm_unique_already_given", "display_event" },
		},
		-- Add realm Native units to a character; 'target' can be "faction_leader" / "selected_character"
		-- 'tier_by_target_rank' is of format { { tier = 1, min_rank = 1 [, max_rank = 10] }, ... }
		add_native_realm_units = {
			mandatory_keys = { "target", "amount"},
			optional_keys = { "tier", "tier_by_target_rank" },
		},
		-- Add Pillars of Civilization points as a separate entry in its points sources list
		pillars_of_civilization_entry = {
			mandatory_keys = { "text_id", "points" },
		},
		-- Set effect bundles that override the default PoC level bundles for own faction;  Optionally supply duration in number of turns
		pillars_of_civilization_level_bundles = {
			mandatory_keys = { "collapse", "crisis", "prosperity" },
			optional_keys = { "duration" },
		},
		-- Instantly complete the current Royal Decree
		instantly_complete_ongoing_research = {
			mandatory_keys = {},
			optional_keys = { "complete_only_first_one" },
			update_button_on_events = { "commands_ResearchStarted", "commands_ResearchCompleted", "commands_ResearchCancelled" },
		},
		-- Disallows the faction's armies from performing a specific occupation decision
		disallow_faction_occupation_decision = {
			mandatory_keys = { "occupation_decision" },
		},
		-- Increases/decreases war spoils level of faction; Optionally supply duration in number of turns
		extra_levels_to_war_spoils = {
			mandatory_keys = { "levels", "increase_max_level" },
			optional_keys = { "duration" },
		},
		-- Sets a shared state for the faction
		set_shared_state = {
			mandatory_keys = { "state_key", "value" },
		},
		-- Adds Military Training points to the faction according to how many wars the faction is currently in
		add_military_training_points = {
			mandatory_keys = {},
			optional_keys = { "points_multiplier" },
		},
		-- Spends the Military Training points of the faction
		-- 'spend_on' can be "selected_character_units_ranks" (units in the selected character's army will get their ranks increased)
		spend_military_training_points = {
			mandatory_keys = { "spend_on" },
			optional_keys = { "multiply_spent_points_by_unit_rank", "remove_unspent_points" },
			update_button_on_events = { "commands_CharacterSelected", "commands_CharacterDeselected" },
		}
	},

	-- Effect conditions define if an effect is enabled (for "activated" effects) and can be applied
	effect_conditions = {
		"has_selected_character", -- If a character is currently selected
		"has_faction_leader", -- If the player faction currently has faction leader
		"faction_leader_space_in_army", -- If the player faction's faction leader has at least one free unit slot in its force
		"leader_is_in_own_or_vassal_province", -- If leader of own faction is in own or vassal/subject region
		"add_ancillary_cost", -- If own faction has enough resources for the cost of "add_ancillary" effect (such one must be defined in the list of effects containing the condition)
		"has_ongoing_research", -- If own faction has ongoing (active) research
	},

	-- What properties an effects list can contain that are not effects
	effects_list_reserved_properties = {
		"effect_condition", -- (Optional) String defining a condition for the effect (see commands.effect_conditions for possible values), or a list of strings (conditions)
		"effect_condition_is_only_warning", -- (Optional) Boolean telling if the set effect_condition is mandatory for the command, or is just a warning; When effect_condition is a list of conditions, this must also be an indexed list of booleans
		"texts", -- A table of format { name = "text_key", description = "text_key" [, effect_condition = "text_key"]}; effect_condition must be a list of text keys when the command's effect_condition is a list
		"duration", -- (Optional) Number of turns for the duration of this activated effect (overrides default_activated_effects_duration)
		"cooldown", -- (Optional) Number of turns for the cooldown of this activated effect (overrides default_activated_effects_cooldown)
		"windup", -- (Optional) Number of turns for the windup of this passive effect (overrides default_passive_effects_windup)
		"repeatable", -- (Optional) Number of turns telling whether and how often this passive command should be applied repeatedly
		"show_is_repeatable", -- (Optional) Whether to show info in the tooltip about the passive command's repeating (how many turns); Default is true; Relevant when property repeatable exists and is > 0
		"shuffle", -- (Optional) Boolean (default is true) telling whether this activated or passive command (effects) can be shuffled (i.e. used for another faction's command)
		"is_passive_effect", -- Boolean flag automatically injected into the configs of all passive commands, so that methods that receive references to commands (i.e. lists of effects) know if these commands are passive
	},

	------------------ COMMANDS PERSISTENT (IN SAVE FILE) DATA ------------------
	-- Note that when adding a new persistent property, a default-value
	-- initialisation should be added to commands.on_loading_game()
	persistent = {
		-- Data stored by "activated" and "passive" effects needed for clearing the effects and to know when the command was applied
		activated_effect_used = {}, -- table with keys being faction keys
		passive_effect_used = {}, -- table with keys being faction keys

		-- Data stored when commands have been shuffled
		-- Table of format: [faction_key1] = { activated = faction_key2, passive = faction_key3 }, telling the commands of which factions to use as commands of faction with faction_key1
		shuffle = nil,

		apply_effects_on_new_characters = {}, -- table with keys being faction keys, values being lists(indexed tables) of { start_turn: number, duration: number, bundle_key: string, on_force: boolean }

		-- Data stored by effects that persists throughout the game
		game_persistent = {}, -- table with keys being faction keys
	},

	------------------ COMMANDS VARIABLES ------------------
	added_listeners = {},
	initialised = false,
	show_hud_button = not is_tutorial,
	hud_button = nil,
	hud_button_container = nil,
	hud_button_tooltip = nil, -- Since the tooltip is recreated every time it's displayed, this reference is set for and cleared after every showing of the tooltip


	------------------ COMMANDS METHODS ------------------

	--- @function init
	--- @desc Initialises the commands functionality
	init = function()
		commands.debug_output("init()")

		commands.initialised = true

		if modular_difficulty_campaign.utility_functions.should_shuffle_commands() and not commands.persistent.shuffle then
			commands.shuffle_commands()
		end

		commands.init_effects_config()

		commands.add_optional_listeners()

		commands.send_config_to_cpp()

		local local_faction_key = commands.get_local_faction_key()

		-- Init HUD button
		commands.hud_button_container = core:get_ui_root():SequentialFind(commands.config.component_ids.hud_button_container)
		if commands.hud_button_container then
			commands.hud_button = commands.hud_button_container:SequentialFind(commands.config.component_ids.hud_button)
		end

		if commands.hud_button then
			if local_faction_key then
				local icon_path = commands.config.hud_button_faction_icons[local_faction_key]
				if (icon_path) then
					commands.hud_button:SetImagePath(icon_path)
				end
			end

			commands.hud_button:SetTooltipText("{{tt:" .. commands.config.hud_button_tooltip_layout_path .. "}}", "", true)
		end

		commands.set_hud_button_visibility()
	end,

	--- @function destruct
	--- @desc Free all resources (listeners, etc.)
	destruct = function()
		commands.debug_output("destruct()")

		-- Remove all listeners
		for _, listener_name in ipairs(commands.added_listeners) do
			core:remove_listener(listener_name)
		end
	end,

	--- @function update
	--- @desc Updates the visual components and helper variables
	update = function()
		commands.debug_output("update()")
		if not commands.initialised then
			return
		end

		commands.set_hud_button_visibility()
		commands.update_hud_button()
	end,

	--- @function update_hud_button
	--- @desc Updates the HUD button
	update_hud_button = function()
		commands.debug_output("update_hud_button")
		if not commands.hud_button or not commands.show_hud_button then
			return
		end

		local local_faction_key = commands.get_local_faction_key()
		if not local_faction_key then
			commands.hud_button:SetState("inactive")
			return
		end

		local activated_effect = commands.get_activated_command(local_faction_key)
		local disable_activated_on_passive_turn = commands.config.disable_activated_on_turn_passive_is_applied
		local current_faction_key = cm:model():world():whose_turn_is_it():name()
		
		local command_optional_data = {}
		local selected_char_cqi = uim:get_char_selected_cqi()
		if selected_char_cqi then
			command_optional_data.character_cqi = selected_char_cqi
		end

		local button_is_enabled = current_faction_key == local_faction_key and
			not (disable_activated_on_passive_turn and commands.is_passive_applied_this_turn(local_faction_key)) and
			commands.get_activated_cooldown_turns_remaining(local_faction_key) <= 0 and
			commands.is_effect_condition_met(local_faction_key, activated_effect, command_optional_data)
		commands.hud_button:SetState(button_is_enabled and "active" or "inactive")

		commands.update_command_icon(commands.hud_button_container, commands.hud_button_container, true, true, false)
	end,

	--- @function update_command_icon
	--- @desc Updates the elements of command icon (the icon in the HUD, or the 2 icons for active & passive effects in the tooltip)
	--- @p uicomponent icon, Reference to the icon whose elements to update
	--- @p uicomponent cooldown_container, Reference to an element (can be the icon or outside of it) that contains the cooldown counter
	--- @p @boolean show_activated, Whether to display info about the activated command
	--- @p @boolean show_passive, Whether to display info about the passive command
	--- @p @boolean show_active_turns_remaining, If true and a command is currently active, will display the activated command's remaining turns or passive command's turns to repeating (if repeatable)
	update_command_icon = function(icon, cooldown_container, show_activated, show_passive, show_active_turns_remaining)
		local local_faction_key = commands.get_local_faction_key()
		if not icon or not local_faction_key then
			return
		end

		local activated_is_active = show_activated and commands.is_activated_in_progress(local_faction_key)
		local passive_is_active = show_passive and commands.is_passive_in_progress(local_faction_key)

		local cooldown_turns = commands.get_activated_cooldown_turns_remaining(local_faction_key)
		local windup_turns = commands.get_remaining_turns_to_passive(local_faction_key)
		local active_turns_remaining = 0
		if activated_is_active then
			active_turns_remaining = commands.get_activated_duration_turns_total(local_faction_key) - commands.get_activated_duration(local_faction_key, false)
		elseif passive_is_active then
			active_turns_remaining = windup_turns
		end

		local show_cooldown = show_activated and cooldown_turns > 0 and active_turns_remaining <= 0
		local show_windup = show_passive and windup_turns > 0 and cooldown_turns <= 0 and active_turns_remaining <= 0
		local show_active_turns = show_active_turns_remaining and active_turns_remaining > 0

		local cooldown_counter = cooldown_container and cooldown_container:SequentialFind(commands.config.component_ids.hud_button_cooldown_counter) or nil
		if cooldown_counter then
			cooldown_counter:SetText(show_active_turns and active_turns_remaining or (show_cooldown and cooldown_turns or windup_turns))
			cooldown_counter:SetState(show_active_turns and "active" or (show_cooldown and "cooldown" or "windup"))
			cooldown_counter:SetVisible(show_cooldown or show_windup or show_active_turns)
		end

		local button_glow = icon:SequentialFind(commands.config.component_ids.hud_button_glow)
		if button_glow then
			local glow_state = show_activated and "active_off" or "passive_off"
			if activated_is_active then
				glow_state = "active_on"
			elseif show_cooldown then
				glow_state = "active_cooldown"
			elseif passive_is_active then
				glow_state = "passive_on"
			end

			button_glow:SetVisible(true)
			button_glow:SetState(glow_state)
		end

		local active_fx = icon:SequentialFind(commands.config.component_ids.hud_button_active_fx)
		if active_fx then
			local active_fx_state = ""
			if activated_is_active then
				active_fx_state = "active_on"
			elseif passive_is_active then
				active_fx_state = "passive_on"
			end

			active_fx:SetVisible(active_fx_state ~= "")
			if active_fx_state ~= "" then
				active_fx:SetState(active_fx_state)
			end
		end
	end,

	--- @function init_effects_config
	--- @desc Injects flag "is_passive_effect" to all passive effects' configuration objects (in commands.config.effects) 
	init_effects_config = function()
		for _, faction_commands in pairs(commands.config.effects) do
			if faction_commands.passive then
				faction_commands.passive.is_passive_effect = true
				commands.for_each_effect(faction_commands.passive, function(effect_type, effect)
					effect.is_passive_effect = true
				end)
			end
		end
	end,

	--- @function set_hud_button_visibility
	--- @desc Updates the hud button visibility when it's been disabled and hidden outside of the tutorial.
	set_hud_button_visibility = function()
		if is_tutorial then 
			return
		end

		local local_faction_key = commands.get_local_faction_key()
		commands.show_hud_button = commands.is_commands_enabled_for_faction(local_faction_key)

		if commands.hud_button_container then
			commands.hud_button_container:SetVisible(commands.show_hud_button)
		end
	end,

	--- @function is_commands_enabled_for_faction
	--- @desc Returns true if the Commands functionality is currently enabled for the supplied faction
	--- @p @string faction_key, Key of faction for which to check
	is_commands_enabled_for_faction = function(faction_key)
		if not faction_key then
			-- Happens in autotests, as the local faction key is passed as argument and there is no local faction in autotests.
			return false
		end
		local is_human_faction = cm:get_faction(faction_key) and cm:get_faction(faction_key):is_human()
		local has_activated_command = to_bool(commands.get_activated_command(faction_key))
		local has_passive_command = to_bool(commands.get_passive_command(faction_key))

		return (has_activated_command or has_passive_command) and is_human_faction and
			(commands.config.debug_force_enable_commands or commands.check_feature_availability_for_faction(faction_key))
	end,

	--- @function are_passive_effects_enabled_for_faction
	--- @desc Returns true if the passive effects are currently enabled for the supplied faction
	--- @p @string faction_key, Key of faction for which to check
	are_passive_effects_enabled_for_faction = function(faction_key)
		if not commands.is_commands_enabled_for_faction(faction_key) then
			return false
		end

		-- Don't apply passive effects on the turn when Commands feature is enabled
		if commands.config.debug_force_enable_commands then
			return cm:turn_number() > 1
		else
			return commands.check_feature_availability_for_faction(faction_key, true)
		end
	end,

	--- @function update_hud_button_tooltip
	--- @desc Updates the HUD button's tooltip; Expects that commands.hud_button_tooltip references the tooltip
	update_hud_button_tooltip = function()
		commands.debug_output("update_hud_button_tooltip")
		local tooltip = commands.hud_button_tooltip
		local local_faction_key = commands.get_local_faction_key()
		if not tooltip or not local_faction_key then
			return
		end

		local current_faction_key = cm:model():world():whose_turn_is_it():name()
		local faction_effects = commands.config.effects[local_faction_key]
		local activated_command = commands.get_activated_command(local_faction_key)
		local passive_command = commands.get_passive_command(local_faction_key)

		local disable_activated_on_passive_turn = commands.config.disable_activated_on_turn_passive_is_applied
		local is_passive_applied_this_turn = commands.is_passive_applied_this_turn(local_faction_key)
		local cooldown_turns = commands.get_activated_cooldown_turns_remaining(local_faction_key)
		local activated_is_active = commands.is_activated_in_progress(local_faction_key)
		local passive_is_active = commands.is_passive_in_progress(local_faction_key)
		local windup_turns = commands.get_remaining_turns_to_passive(local_faction_key, true)

		-- Init tooltip
		tooltip:SetProperty("script_id", commands.config.hud_button_script_id)

		commands.hide_tooltip_templates({
			commands.config.component_ids.tooltip_units_template,
			commands.config.component_ids.tooltip_cost_template,
			commands.config.component_ids.tooltip_resources_template,
		})

		-- Command name and description
		commands.set_tooltip_field(commands.config.component_ids.tooltip_title, faction_effects.texts.title)
		commands.set_tooltip_field(commands.config.component_ids.tooltip_flavor, faction_effects.texts.flavor)

		-- Activated and passive effects
		commands.update_tooltip_effect(commands.config.component_ids.tooltip_activated_container, activated_command, activated_is_active, cooldown_turns)
		commands.update_tooltip_effect(commands.config.component_ids.tooltip_passive_container, passive_command, passive_is_active, windup_turns)

		-- Actions and warnings
		local command_optional_data = {}
		local selected_char_cqi = uim:get_char_selected_cqi()
		if selected_char_cqi then
			command_optional_data.character_cqi = selected_char_cqi
		end

		local can_activate = local_faction_key == current_faction_key and cooldown_turns <= 0 and
			commands.is_effect_condition_met(local_faction_key, activated_command, command_optional_data)
		local warnings = {}

		if cooldown_turns > 0 then
			table.insert(warnings, { id = commands.config.texts.use_again_in_x_turns, params = { cooldown_turns } })
		elseif disable_activated_on_passive_turn and is_passive_applied_this_turn then
			table.insert(warnings, commands.config.texts.cannot_apply_on_same_turn_as_passive)
		else
			local unmet_conditions = commands.get_unmet_effect_conditions(local_faction_key, activated_command, true, command_optional_data)
			if #unmet_conditions > 0 then
				if is_table(activated_command.texts.effect_condition) then
					for i = 1, #activated_command.texts.effect_condition do
						if table_find(unmet_conditions, activated_command.effect_condition[i], false) ~= nil then
							table.insert(warnings, activated_command.texts.effect_condition[i])
						end
					end
				else
					table.insert(warnings, activated_command.texts.effect_condition)
				end
			end
		end
		commands.set_tooltip_field(commands.config.component_ids.tooltip_warning, warnings, nil, #warnings > 0)
		commands.set_tooltip_field(commands.config.component_ids.tooltip_action, commands.config.texts.lclick_to_use, nil, can_activate)

		-- Clear the reference to the tooltip as the tooltip is recreated on each showing
		commands.hud_button_tooltip = nil
	end,

	--- @function update_tooltip_effect
	--- @desc Updates the effect info for the "activated" or "passive" effect in the HUD button's tooltip
	--- @p @string container_id, Container (in the tooltip) for the effect
	--- @p @table effect_def, Definition of "activated" or "passive" effects
	--- @p @boolean is_active, Whether the effect is currently active (in progress)
	--- @p @number turns_remaining, Cooldown or Windup turns remaining (depending on if the effect is activated or passive)
	update_tooltip_effect = function(container_id, effect_def, is_active, turns_remaining)
		local is_passive = to_bool(effect_def.is_passive_effect)
		local container = commands.hud_button_tooltip:SequentialFind(container_id)
		local local_faction_key = commands.get_local_faction_key()

		-- Set effect name, description and ACTIVE label
		commands.set_tooltip_field({ container_id, commands.config.component_ids.tooltip_effect_name }, effect_def.texts.name)
		commands.set_tooltip_field({ container_id, commands.config.component_ids.tooltip_effect_description }, effect_def.texts.description, is_active and "active" or "default")

		local active_txt_state = is_active and "active" or (is_passive and "windup" or "cooldown")
		local active_text_visible = is_active or turns_remaining > 0
		commands.set_tooltip_field({ container_id, commands.config.component_ids.tooltip_effect_is_active_txt }, nil, active_txt_state, active_text_visible)

		-- Set command icon and cooldown/windup counter
		local icon_container = container:SequentialFind(commands.config.component_ids.tooltip_command_icon_container)
		local icon = icon_container:SequentialFind(commands.config.component_ids.hud_button)
		local icon_path = commands.config.hud_button_faction_icons[local_faction_key]
		if (icon and icon_path) then
			icon:SetImagePath(icon_path)
		end

		local turns_counter_container = container:SequentialFind(commands.config.component_ids.tooltip_effect_turns_counter_container)
		commands.update_command_icon(icon_container, turns_counter_container, not is_passive, is_passive, not is_passive or effect_def.repeatable ~= 1)

		-- Set active cooldown / passive windup and repeat descriptions
		if is_passive then
			local is_in_windup = turns_remaining > 0 and not is_active
			local windup_turns = commands.get_passive_windup_turns_total(local_faction_key)
			local text_and_params = { id = commands.config.texts.windup_total_turns, params = { windup_turns } }
			local state = is_in_windup and "active" or "default"
			commands.set_tooltip_field({ container_id, commands.config.component_ids.tooltip_effect_windup_description }, text_and_params, state, windup_turns > 0)

			local show_repeatable = effect_def.repeatable ~= nil and (effect_def.show_is_repeatable == nil or effect_def.show_is_repeatable)
			text_and_params = { id = commands.config.texts.repeat_total_turns, params = { effect_def.repeatable or 0 } }
			state = is_active and "active" or "default"
			commands.set_tooltip_field({ container_id, commands.config.component_ids.tooltip_effect_repeat_description }, text_and_params, state, show_repeatable)
		else
			local is_in_cooldown = turns_remaining > 0 and not is_active
			local cooldown_turns = commands.get_activated_cooldown_turns_total(effect_def)
			local text_and_params = { id = commands.config.texts.cooldown_total_turns, params = { cooldown_turns } }
			local state = is_in_cooldown and "active" or "default"
			commands.set_tooltip_field({ container_id, commands.config.component_ids.tooltip_effect_cooldown_description }, text_and_params, state, cooldown_turns > 0)
		end

		-- Update tooltip parts (units, cost, resources, etc.) specific to particular effect types
		local update_effect_tooltip = function(effect_type, effect)
			if commands.effect_types[effect_type].update_tooltip then
				commands.debug_output("update extra tooltip info for effect " .. effect_type)
				commands.effect_types[effect_type].update_tooltip(effect, container_id)
			end
		end
		commands.for_each_effect(effect_def, update_effect_tooltip)
	end,

	--- @function get_game_persistent_data
	--- @desc Returns reference to the game-persistent data storage container for the supplied faction;
	--- @desc Reference to a property inside this container will be returned if data_property (and data_subproperty) are supplied
	--- @p @string faction_key, Key of faction
	--- @p @string data_property, Property key in the data container - property will be created if not existing
	--- @p @string data_subproperty, Property key inside data_property - property will be created if not existing
	get_game_persistent_data = function(faction_key, data_property, data_subproperty)
		if not commands.persistent.game_persistent[faction_key] then
			commands.persistent.game_persistent[faction_key] = {}
		end
		if data_property and not commands.persistent.game_persistent[faction_key][data_property]  then
			commands.persistent.game_persistent[faction_key][data_property] = {}
		end
		if data_subproperty and not commands.persistent.game_persistent[faction_key][data_property][data_subproperty]  then
			commands.persistent.game_persistent[faction_key][data_property][data_subproperty] = {}
			return commands.persistent.game_persistent[faction_key][data_property][data_subproperty]
		end
		if data_property then
			return commands.persistent.game_persistent[faction_key][data_property]
		else
			return commands.persistent.game_persistent[faction_key]
		end
	end,

	--- @function on_faction_turn_start
	--- @desc Updates the UI for the new turn and updates the effects (applying, expiring)
	on_faction_turn_start = function()
		commands.debug_output("on_faction_turn_start()")

		local faction_key = cm:model():world():whose_turn_is_it():name()
		local commands_enabled = commands.is_commands_enabled_for_faction(faction_key)

		if commands_enabled then
			local has_activated_effect = to_bool(commands.get_activated_command(faction_key))
			local passive_effect = commands.get_passive_command(faction_key)

			if has_activated_effect then
				local current_duration = commands.get_activated_duration(faction_key, true)
				local total_duration = commands.get_activated_duration_turns_total(faction_key)

				-- Clean current activated effects
				local is_time_for_clearing_activated = current_duration >= total_duration
				if is_time_for_clearing_activated then
					commands.clear_activated(faction_key)
				end
			end

			if passive_effect then
				local is_time_for_processing_passive = commands.get_remaining_turns_to_passive(faction_key) <= 0
				if is_time_for_processing_passive then
					-- Clean current passive effects and set cleared_on_turn (used for counting the period)
					commands.clear_passive(faction_key)

					-- Checking for are_passive_effects_enabled_for_faction will prevent applying on the first turn that Commands are enabled
					local passive_effects_are_enabled = commands.are_passive_effects_enabled_for_faction(faction_key)
					if passive_effects_are_enabled then
						commands.apply_passive(faction_key)
					end
				end
			end
		end

		commands.update()
		commands.send_config_to_cpp()
	end,

	--- @function on_button_click
	--- @desc Performs the action (for the local faction) upon clicking the HUD commands button
	on_button_click = function()
		commands.debug_output("on_button_click()")

		if commands.get_local_faction():name() ~= cm:model():world():whose_turn_is_it():name() then
			return
		end

		if commands.hud_button and string.sub(commands.hud_button:CurrentState(), 1, 8) == "inactive" then
			return
		end

		-- Show confirmation dialogue
		local dialogue_text = commands.config.texts.apply_command_dialogue_text
		local dialogue_title = commands.config.texts.apply_command_dialogue_title
		local dialogue_title_localised = get_localised_text_replacement(dialogue_title)
		local dialogue_text_localised = get_localised_text_replacement(dialogue_text)

		create_confirmation_box_with_text_from_script(
			"apply_command_confirm_prompt",
			dialogue_text_localised,
			dialogue_text,
			-- Confirm
			function()
				local local_faction_cqi = commands.get_local_faction():command_queue_index()
				local param_str = commands.config.script_events.prefix .. ":" .. commands.config.script_events.use_activated
	
				local selected_char_cqi = uim:get_char_selected_cqi()
				if selected_char_cqi then
					param_str = param_str .. ":character_cqi:" .. selected_char_cqi
				end

				CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, param_str)
			end,
			-- Cancel
			nil,
			nil, dialogue_title_localised, dialogue_title
		)
	end,

	--- @function apply_activated
	--- @desc Applies the "activated" effects for the supplied faction
	--- @p @string faction_key, Key of faction on which to apply the effects; If missing, the local faction key will be used
	--- @p @table command_optional_data, a table containing data usually needed by different effect type implementations (such as charater on which the effect should be applied)
	apply_activated = function(faction_key, command_optional_data)
		commands.console_output("apply_activated() " .. (faction_key or ""))
		if is_tutorial then
			return
		end

		if not faction_key then
			faction_key = commands.get_local_faction_key()
		end

		local effects = commands.get_activated_command(faction_key)
		local disable_activated_on_passive_turn = commands.config.disable_activated_on_turn_passive_is_applied
		local is_passive_applied_this_turn = commands.is_passive_applied_this_turn(faction_key)

		if commands.persistent.activated_effect_used[faction_key] and
			commands.persistent.activated_effect_used[faction_key].activated_on_turn and
			not commands.persistent.activated_effect_used[faction_key].is_cleared
		then
			commands.console_output("activated command has already been applied")
			return
		end
		if disable_activated_on_passive_turn and is_passive_applied_this_turn then
			commands.console_output("activated command cannot be applied on same turn as passive command")
			return
		end
		if not commands.is_effect_condition_met(faction_key, effects, command_optional_data) then
			commands.console_output("activated command is not applied because its condition is not met")
			return
		end

		commands.persistent.activated_effect_used[faction_key] = {
			activated_on_turn = cm:turn_number()
		}
		commands.apply_effects(faction_key, effects, commands.persistent.activated_effect_used[faction_key], command_optional_data)
	end,

	--- @function clear_activated
	--- @desc Resets the activated_effect_used for the supplied faction; Returns the value of the flag before cleaning (i.e. whether the effect was used)
	--- @p @string faction_key, Key of faction for which to clean
	clear_activated = function(faction_key)
		commands.debug_output("clear_activated() " .. (faction_key or ""))
		if not faction_key then
			faction_key = commands.get_local_faction_key()
		end

		local activated_effect_used = commands.persistent.activated_effect_used[faction_key]
		if not activated_effect_used or not activated_effect_used.activated_on_turn or
			activated_effect_used.is_cleared
		then
			return false
		end

		commands.clear_effects(faction_key, commands.get_activated_command(faction_key), activated_effect_used)

		commands.console_output("clear flag activated_effect_used for " ..  faction_key)
		activated_effect_used.is_cleared = true
		return true
	end,

	--- @function apply_passive
	--- @desc Applies the "passive" effects for the supplied faction
	--- @p @string faction_key, Key of faction on which to apply the effects; If missing, the local faction key will be used
	apply_passive = function(faction_key)
		commands.console_output("apply_passive() " .. (faction_key or ""))
		if not faction_key then
			faction_key = commands.get_local_faction_key()
		end

		local effects = commands.get_passive_command(faction_key)
		if not commands.is_effect_condition_met(faction_key, effects, {}) then
			commands.console_output("passive command is not applied because its condition is not met")
			return
		end

		commands.persistent.passive_effect_used[faction_key] = {
			activated_on_turn = cm:turn_number()
		}
		commands.apply_effects(faction_key, effects, commands.persistent.passive_effect_used[faction_key], command_optional_data)
	end,

	--- @function clear_passive
	--- @desc Removes the effects applied for the last passive command
	--- @p @string faction_key, Key of faction for which to clean
	clear_passive = function(faction_key)
		commands.debug_output("clear_passive() " .. (faction_key or ""))
		if not faction_key then
			faction_key = commands.get_local_faction_key()
		end

		local passive_effect_used = commands.persistent.passive_effect_used[faction_key]
		if passive_effect_used and passive_effect_used.activated_on_turn and not passive_effect_used.is_cleared then
			commands.console_output("clearing passive_effect_used for " ..  faction_key)
			commands.clear_effects(faction_key, commands.get_passive_command(faction_key), passive_effect_used)
			passive_effect_used.is_cleared = true
		elseif not passive_effect_used then
			commands.persistent.passive_effect_used[faction_key] = {}
		end

		commands.persistent.passive_effect_used[faction_key].cleared_on_turn = cm:turn_number()
	end,

	--- @function apply_effects
	--- @desc Applies the effects with the supplied definition on the supplied faction
	--- @p @string faction_key, Key of faction on which to apply the effects
	--- @p @table effects, Definition of "activated" or "passive" effects to apply; see commands.config.effects
	--- @p @table persistent_data, Persistent storage container, where the effects applied on this faction can store data needed for clearing them
	--- @p @table command_optional_data, a table containing data usually needed by different effect type implementations (such as charater on which the effect should be applied)
	apply_effects = function(faction_key, effects, persistent_data, command_optional_data)
		commands.debug_output("apply_effects() " .. faction_key)
		if not effects then
			commands.debug_error("trying to apply effects with no definition")
			return
		end

		local apply_effect = function(effect_type, effect)
			if commands.validate_effect(effect_type, effect) then
				commands.console_output("applying effect " .. effect_type .. " on " .. faction_key)
				commands.effect_types[effect_type].apply_function(faction_key, effect, persistent_data, command_optional_data)
			end
		end

		commands.for_each_effect(effects, apply_effect)
	end,

	--- @function validate_effect
	--- @desc Returns true/false depending on whether the supplied effect definition is of valid effect type and contains the expected parameters for this effect type
	--- @p @string effect_type, Type of effect (see commands.effect_types)
	--- @p @table effect, Definition of effect (see commands.effect_types)
	validate_effect = function(effect_type, effect)
		if not effect_type then
			local effect_prop_keys = {}
			for prop_key, _ in pairs(effect) do
				table.insert(effect_prop_keys, prop_key)
			end
			commands.debug_error("missing effect type in effect with properties: " .. table.concat(effect_prop_keys, ", "))
			return false
		end

		local effect_type_def = commands.effect_types[effect_type]
		if not effect_type_def then
			commands.debug_error("trying to apply unknown effect type: " .. effect_type)
			return false
		end

		for _, prop_name in ipairs(effect_type_def.mandatory_keys) do
			if effect[prop_name] == nil then
				commands.debug_error("missing mandatory effect property '" .. prop_name .. "' in " .. effect_type)
				return false
			end
		end

		for prop_name, _ in pairs(effect) do
			if table_find(effect_type_def.mandatory_keys, prop_name, false) == nil and
				(not effect_type_def.optional_keys or table_find(effect_type_def.optional_keys, prop_name, false) == nil) and
				prop_name ~= "effect_type" and
				prop_name ~= "is_passive_effect"
			then
				-- Give error but allow to apply effect with extra unknown properties
				commands.debug_error("trying to apply unknown effect property: " .. effect_type .. " in " .. effect_type)
			end
		end

		return true
	end,

	--- @function clear_effects
	--- @desc Clears the effects with the supplied persistent data for the supplied faction
	--- @p @string faction_key, Key of faction for which to clear the effects
	--- @p @table effects, Definition of "activated" or "passive" effects to clear; see commands.effect_types
	--- @p @table persistent_data, Persistent storage container, where the applied effects have stored data needed for clearing the effects
	clear_effects = function(faction_key, effects, persistent_data)
		commands.debug_output("clear_effects() " .. faction_key)
		if not persistent_data then
			return
		end

		commands.for_each_effect(effects, function(effect_type, effect)
			local effect_def = commands.effect_types[effect_type]
			if effect_def and effect_def.clear_function then
				commands.effect_types[effect_type].clear_function(faction_key, persistent_data, effect)
			end
		end)
	end,

	--- @function for_each_effect
	--- @desc Iterates through the supplied effects list calling the supplied callback for each effect
	--- @p @table effects_list, Definition of "activated" or "passive" effects to iterate; see commands.config.effects
	--- @p @function callback, A function that receives 2 parameters - (string effect_type, table effect)
	for_each_effect = function(effects_list, callback)
		if #effects_list > 0 then
			-- Effects are in indexed array, where every effect is supposed to have property "effect_type"
			for _, effect in ipairs(effects_list) do
				if effect.effect_type then
					callback(effect.effect_type, effect)
				end
			end
		else
			-- Effects are in table where the keys are the effect types
			for effect_type, effect in dpairs(effects_list) do
				if not table_find(commands.effects_list_reserved_properties, effect_type, false) then
					if is_table(effect) and #effect > 0 then
						-- Nested indexed list of effects, effect_type is just a designer-friendly label
						commands.for_each_effect(effect, callback)
					else
						-- Strip "1", "2", "3", "_1", "_2", "_3", etc. at end of effect_type
						if effect_type and tonumber(string.sub(effect_type, -1)) ~= nil then
							if string.sub(effect_type, -2, -2) == "_" then
								effect_type = string.sub(effect_type, 1, -3)
							else
								effect_type = string.sub(effect_type, 1, -2)
							end
						end
						callback(effect_type, effect)
					end
				end
			end
		end
	end,

	--- @function for_each_effect_of_faction
	--- @desc Iterates through the effects lists of the activated and passive commands of the supplied faction calling the supplied callback for each effect
	--- @p @function callback, A function that receives 2 parameters - (string effect_type, table effect)
	for_each_effect_of_faction = function(faction_key, callback)
		local activated_command = commands.get_activated_command(faction_key)
		if activated_command then
			commands.for_each_effect(activated_command, callback)
		end

		local passive_command = commands.get_passive_command(faction_key)
		if passive_command then		
			commands.for_each_effect(passive_command, callback)
		end
	end,

	--- @function get_command_effect
	--- @desc Searches in the supplied effects list for effect with the supplied effect type and returns it (the first in list)
	--- @p @string effect_type, Type of effect (see commands.effect_types)
	--- @p @table effects_list, Definition of "activated" or "passive" effects to iterate; see commands.config.effects
	get_command_effect = function(effect_type, effects_list)
		local found_effect = nil
		commands.for_each_effect(effects_list, function(et, effect)
			if et == effect_type and not found_effect then
				found_effect = effect
			end
		end)
		return found_effect
	end,

	--- @function is_effect_condition_met
	--- @desc Returns true if the supplied effects' condition (in its property effect_condition) is met, or the if the effects don't contain condition
	--- @p @string faction_key, Key of faction for which to check the effects
	--- @p @table effects, Definition of "activated" or "passive" effects to check; see commands.effect_types
	--- @p @table command_optional_data, a table containing data usually needed by different effect type implementations (such as charater on which the effect should be applied)
	is_effect_condition_met = function(faction_key, effects, command_optional_data)
		return #(commands.get_unmet_effect_conditions(faction_key, effects, false, command_optional_data)) == 0
	end,

	--- @function get_unmet_effect_conditions
	--- @desc Returns a list of unmet effect conditions for the supplied effects list
	--- @p @string faction_key, Key of faction for which to check the effects
	--- @p @table effects, Definition of "activated" or "passive" effects to check; see commands.effect_types
	--- @p @boolean include_warnings, If true, the returned unmet conditions will include the ones that are just warnings (not conditions mandatory for the command)
	--- @p @table command_optional_data, a table containing data usually needed by different effect type implementations (such as charater on which the effect should be applied)
	get_unmet_effect_conditions = function(faction_key, effects, include_warnings, command_optional_data)
		local faction = cm:get_faction(faction_key)
		if not effects.effect_condition or not faction or faction:is_null_interface() then
			return {}
		end

		local is_condition_met = function(effect_condition)
			if not table_find(commands.effect_conditions, effect_condition, false) then
				commands.debug_error("unsupported value to 'effect_condition': " .. effect_condition)
				return false
			end
				
			if effect_condition == "leader_is_in_own_or_vassal_province" then
				return commands.is_leader_in_own_or_vassal_province(faction_key)
			elseif effect_condition == "has_faction_leader" then
				return faction:has_faction_leader()
			elseif effect_condition == "faction_leader_space_in_army" then
				if not faction:has_faction_leader() or not faction:faction_leader():has_military_force() then
					return false
				end
				local force = faction:faction_leader():military_force()
				return force:unit_count() + force:pending_recruitment_count() < force:unit_count_limit()
			elseif effect_condition == "has_selected_character" then
				local char_cqi = is_table(command_optional_data) and command_optional_data.character_cqi or nil
				local character = char_cqi and cm:get_character_by_cqi(char_cqi) or nil;
				return to_bool(character) and character:faction():name() == faction_key
			elseif effect_condition == "add_ancillary_cost" then
				local effect_def = commands.get_command_effect("add_ancillary", effects)
				if not effect_def then
					return false
				end
				local ancillary_cost = commands.get_ancillary_cost(faction_key, effect_def)
				return commands.faction_can_afford_cost(faction_key, ancillary_cost)
			elseif effect_condition == "has_ongoing_research" then
				local remaining_turns = faction:active_research_remaining_turns()
				return remaining_turns > 0
			else
				commands.debug_error("unimplemented effect condition: " .. effect_condition)
				return false
			end
		end

		local effect_conditions = is_table(effects.effect_condition) and effects.effect_condition or { effects.effect_condition }
		local condition_is_just_warning = is_table(effects.effect_condition_is_only_warning) and effects.effect_condition_is_only_warning or { effects.effect_condition_is_only_warning or false }
		local unmet_conditions = {}

		for i, effect_condition in dpairs(effect_conditions) do
			if (include_warnings or not condition_is_just_warning[i]) and
				not is_condition_met(effect_condition)
			then
				table.insert(unmet_conditions, effect_condition)
			end
		end

		return unmet_conditions
	end,

	--- @function get_activated_command
	--- @desc Returns the definition of the activated commands of the supplied faction
	--- @desc Returns one of the commands.config.effects[faction_key].activated objects
	--- @p @string faction_key, Key of faction for which to check
	get_activated_command = function(faction_key)
		if commands.persistent.shuffle and commands.persistent.shuffle[faction_key] then
			faction_key = commands.persistent.shuffle[faction_key].activated
		end

		return commands.config.effects[faction_key] and 
			commands.config.effects[faction_key].activated
	end,

	--- @function get_passive_command
	--- @desc Returns the definition of the passive commands of the supplied faction
	--- @desc Returns one of the commands.config.effects[faction_key].passive objects
	--- @p @string faction_key, Key of faction for which to check
	get_passive_command = function(faction_key)
		if commands.persistent.shuffle and commands.persistent.shuffle[faction_key] then
			faction_key = commands.persistent.shuffle[faction_key].passive
		end

		return commands.config.effects[faction_key] and 
			commands.config.effects[faction_key].passive
	end,

	--- @function shuffle_commands
	--- @desc Shuffles the commands for the human factions, storing the result in commands.persistent.shuffle
	shuffle_commands = function()
		commands.console_output("Shuffle commands")

		commands.persistent.shuffle = {}

		local used_activated = {}
		local used_passive = {}
		local human_faction_keys = cm:get_human_factions()

		for _, faction_key in ipairs(human_faction_keys) do
			local possible_activated = commands.get_possible_commands(faction_key, false, used_activated)
			local selected_activated = #possible_activated > 0 and possible_activated[cm:model():random_int(1, #possible_activated)] or faction_key
			table.insert(used_activated, selected_activated)

			local possible_passive = commands.get_possible_commands(faction_key, true, used_passive)
			local selected_passive = #possible_passive > 0 and possible_passive[cm:model():random_int(1, #possible_passive)] or faction_key
			table.insert(used_passive, selected_passive)

			commands.persistent.shuffle[faction_key] = {
				activated = selected_activated,
				passive = selected_passive
			}

			local activated_command = commands.config.effects[selected_activated] and commands.config.effects[selected_activated].activated
			local passive_command = commands.config.effects[selected_passive] and commands.config.effects[selected_passive].passive
			commands.console_output(faction_key .. " uses commands:")
			commands.console_output("   activated = " .. selected_activated .. " (" .. commands.get_effects_debug_string(activated_command) .. ")")
			commands.console_output("   passive = " .. selected_passive .. " (" .. commands.get_effects_debug_string(passive_command) .. ")")
		end
	end,

	--- @function get_possible_commands
	--- @desc Returns an indexed list of faction_keys for the commands of which factions can be used as command for the supplied faction
	--- @p @string faction_key, Key of faction for which to check
	--- @p @boolean return_passive, Whether to return passive or activated commands
	--- @p @table list_of_already_used, An indexed list of faction keys supplying the already used commands (which cannot be added to the returned possible ones)
	get_possible_commands = function(faction_key, return_passive, list_of_already_used)
		local possible_commads_faction_keys = {}
		for another_faction_key, _ in pairs(commands.config.effects) do
			local command = nil
			if return_passive then
				command = commands.get_passive_command(another_faction_key)
			else
				command = commands.get_activated_command(another_faction_key)
			end

			if command and (another_faction_key == faction_key or command.shuffle == nil or command.shuffle) and
				not table_find(list_of_already_used, another_faction_key, false)
			then
				table.insert(possible_commads_faction_keys, another_faction_key)
			end
		end
		return possible_commads_faction_keys
	end,

	--- @function is_activated_in_progress
	--- @desc Returns true if the activated effects are applied and are not cleared
	--- @p @string faction_key, Key of faction for which to check
	is_activated_in_progress = function(faction_key)
		local activated_effect_used = commands.persistent.activated_effect_used[faction_key]
		return to_bool(activated_effect_used) and to_bool(activated_effect_used.activated_on_turn) and not activated_effect_used.is_cleared
	end,

	--- @function get_activated_duration
	--- @desc Returns the number of turns for which the activated effect has been applied;
	--- @desc Returns 0 when the effect has been applied this turn
	--- @desc Returns -1 when the effect has not been applied
	--- @p @string faction_key, Key of faction for which to check
	--- @p @boolean return_for_cleared, Whether to return (positive value) when the effect is cleared (has expired)
	get_activated_duration = function(faction_key, return_for_cleared)
		local activated_effect_used = commands.persistent.activated_effect_used[faction_key]
		if activated_effect_used and activated_effect_used.activated_on_turn and
			(return_for_cleared or not activated_effect_used.is_cleared)
		then
			return cm:turn_number() - activated_effect_used.activated_on_turn
		else
			return -1
		end
	end,

	--- @function get_activated_duration_turns_total
	--- @desc Returns the duration (in number of turns) of the activated command of the supplied faction
	--- @p @string faction_key, Key of faction for which to check
	get_activated_duration_turns_total = function(faction_key)
		local activated_effect = commands.get_activated_command(faction_key)
		return activated_effect and activated_effect.duration or commands.config.default_activated_effects_duration
	end,

	--- @function get_activated_cooldown_turns_remaining
	--- @desc Returns the number of remaining turns till the activated effect can be applied again
	--- @desc Returns 0 or a negative number when the cooldown has expired and the effect can be applied
	--- @p @string faction_key, Key of faction for which to check
	get_activated_cooldown_turns_remaining = function(faction_key)
		local activated_duration = commands.get_activated_duration(faction_key, true)
		if activated_duration == -1 then
			-- If command has never been applied, it can be activated immediately
			return 0
		end

		local total_cooldown = commands.get_activated_cooldown_turns_total(faction_key)
		local total_duration = commands.get_activated_duration_turns_total(faction_key)

		return total_duration + total_cooldown - activated_duration
	end,

	--- @function get_activated_cooldown_turns_total
	--- @desc Returns the number of turns between two consequtive applications of the activated effects
	--- @p @string faction_key_or_activated_effect_def, Key of faction for which to check or (if @table is supplied) directly a reference to the faction's activated effect definition
	get_activated_cooldown_turns_total = function(faction_key_or_activated_effect_def)
		local activated_effect = is_table(faction_key_or_activated_effect_def) and
			faction_key_or_activated_effect_def or
			commands.get_activated_command(faction_key_or_activated_effect_def)
		return activated_effect and activated_effect.cooldown or commands.config.default_activated_effects_cooldown
	end,

	--- @function get_passive_duration
	--- @desc Returns the number of turns for which the passive effect has been applied;
	--- @desc Returns 0 when the effect has been applied this turn
	--- @desc Returns -1 when the effect has not been applied
	--- @p @string faction_key, Key of faction for which to check
	--- @p @boolean return_for_cleared, Whether to return (positive value) when the effect is cleared (has expired)
	get_passive_duration = function(faction_key, return_for_cleared)
		local passive_effect_used = commands.persistent.passive_effect_used[faction_key]
		if not passive_effect_used or (not return_for_cleared and passive_effect_used.is_cleared) then
			return -1
		end

		if passive_effect_used.activated_on_turn then
			return cm:turn_number() - passive_effect_used.activated_on_turn
		elseif passive_effect_used.cleared_on_turn and return_for_cleared then
			return cm:turn_number() - passive_effect_used.cleared_on_turn
		end
		return -1
	end,

	--- @function is_passive_applied_this_turn
	--- @desc Returns true if the automatic passive effect for the supplied faction has been applied this turn
	--- @p @string faction_key, Key of faction for which to check
	is_passive_applied_this_turn = function(faction_key)
		return (commands.get_passive_duration(faction_key) == 0)
	end,

	--- @function is_passive_in_progress
	--- @desc Returns true if the passive effects are applied and are not cleared
	--- @p @string faction_key, Key of faction for which to check
	is_passive_in_progress = function(faction_key)
		local passive_effect_used = commands.persistent.passive_effect_used[faction_key]
		return to_bool(passive_effect_used) and to_bool(passive_effect_used.activated_on_turn) and not passive_effect_used.is_cleared
	end,

	--- @function get_remaining_turns_to_passive
	--- @desc Returns the number of remaining turns till the passive effect should be applied again (if no activated effect prevents it)
	--- @desc Returns 0 or a negative number when the effect can be applied
	--- @p @string faction_key, Key of faction for which to check
	--- @p @boolean only_if_in_windup, If true, will return -1 if the activated command is still active or in cooldown
	get_remaining_turns_to_passive = function(faction_key, only_if_in_windup)
		local remaining_turns = 0;
		local is_passive_in_progress = commands.is_passive_in_progress(faction_key)
		local passive_duration = commands.get_passive_duration(faction_key, true)
		local activated_duration = commands.get_activated_duration(faction_key, true)

		if is_passive_in_progress then
			-- When passive command is currently active, check if it should be applied repeatedly
			local passive_effect = commands.get_passive_command(faction_key)
			if passive_effect.repeatable then
				remaining_turns = passive_effect.repeatable - passive_duration
			end
		elseif activated_duration >= 0 then
			-- When the passive command is not currently active and the activated command has been applied
			-- the passive command can be applied windup turns after the activated command's cooldown has finished
			local cooldown_turns = commands.get_activated_cooldown_turns_remaining(faction_key)
			if only_if_in_windup and cooldown_turns > 0 then
				remaining_turns = -1
			else
				local total_windup = commands.get_passive_windup_turns_total(faction_key)
				remaining_turns = cooldown_turns + total_windup
			end
		elseif passive_duration >= 0 then
			-- Case for beginning of game when neither activated nor passive command has been applied
			-- Then wait for windup turns before applying the passive command for the first time
			local total_windup = commands.get_passive_windup_turns_total(faction_key)
			remaining_turns = total_windup - passive_duration
		end

		return remaining_turns
	end,

	--- @function get_passive_windup_turns_total
	--- @desc Returns the number of turns between two consequtive applications of the passive effects
	--- @p @string faction_key, Key of faction for which to check
	get_passive_windup_turns_total = function(faction_key)
		local passive_effect = commands.get_passive_command(faction_key)
		return passive_effect and passive_effect.windup or commands.config.default_passive_effects_windup
	end,

	--- @function get_duration_in_turns
	--- @desc Returns an effect's duration in number of turns
	--- @p @string faction_key, Key of faction for which to calculate
	--- @p @table effect, Definition of effect to apply; see commands.effect_types.effect_bundle or a similar effect type that contains property duration
	get_duration_in_turns = function(faction_key, effect)
		local effect_duration = effect.duration
		local is_passive = to_bool(effect.is_passive_effect)

		if effect_duration then
			-- If duration is defined as a number (number of turns), return it
			if (is_number(effect_duration)) then
				return effect_duration
			else
				commands.debug_error("Unsupported effect duration: " .. effect_duration)
				return 1
			end
		end

		if is_passive then
			-- Effect should be active till activated command is triggered
			return 0
		else
			-- Return fixed duration of activated command
			return commands.get_activated_duration_turns_total(faction_key)
		end
	end,

	--- @function on_character_created
	--- @desc Performs actions (like applying effects defined in commands.persistent.apply_effects_on_new_characters) on newly-created characters
	--- @p CHARACTER_SCRIPT_INTERFACE character, newly-created character from any faction
	on_character_created = function(character)
		commands.debug_output("on_character_created")

		local character_faction_key = character:faction():name()
		local effects_to_apply = commands.persistent.apply_effects_on_new_characters[character_faction_key] or {}
		local cleaned_effects = {} -- Will contain effects_to_apply with the expired effects removed
		for _, effect_def in ipairs(effects_to_apply) do
			local duration = 0
			if effect_def.duration > 0 then
				duration = effect_def.duration + effect_def.start_turn - cm:turn_number()
			end
			if effect_def.duration == 0 or duration > 0 then
				commands.apply_effect_bundle_to_character(character, effect_def.bundle_key, duration, effect_def.on_force)
				table.insert(cleaned_effects, effect_def)
			end
		end
		commands.persistent.apply_effects_on_new_characters[character_faction_key] = cleaned_effects
	end,

	--- @function get_events_for_which_to_update_button
	--- @desc Parses what activated effects the local faction has and what event listeners they require, and returns a list of event names
	get_events_for_which_to_update_button = function()
		local events = {}
		local local_faction_key = commands.get_local_faction_key()
		if not local_faction_key then
			return events
		end

		local activated_effect = commands.get_activated_command(local_faction_key)

		local add_events_for_effect = function(effect_type, effect)
			local effect_events = commands.effect_types[effect_type].update_button_on_events or {}
			for _, event_name in ipairs(effect_events) do
				table_add_unique(events, event_name)
			end
		end
		if activated_effect then
			commands.for_each_effect(activated_effect, add_events_for_effect)
		end

		return events
	end,

	--- @function get_effects_debug_string
	--- @desc Returns a string containing the names of the effects in the supplied effects list
	--- @p @table effects_list, Definition of "activated" or "passive" effects to iterate; see commands.config.effects
	get_effects_debug_string = function(effects_list)
		local effects_str = ""
		-- Join the names of the effect types
		local append_for_effect = function(effect_type, effect)
			if string.len(effects_str) > 0 then
				effects_str = effects_str .. ", "
			end
			effects_str = effects_str .. effect_type
		end
		if effects_list then
			commands.for_each_effect(effects_list, append_for_effect)
		end
		return effects_str
	end,

	--- @function get_local_faction
	--- @desc Returns the local faction's object or nil if no local faction
	get_local_faction = function()
		local local_faction = cm:get_local_faction(true)
		if local_faction and not local_faction:is_null_interface() then
			return local_faction
		else
			return nil
		end
	end,

	--- @function get_local_faction_key
	--- @desc Returns the key for the local faction or nil if no local faction
	get_local_faction_key = function()
		local local_faction = commands.get_local_faction()
		return local_faction and local_faction:name() or nil
	end,

	--- @function on_saving_game
	--- @desc Adds commands.persistent to the save file
	on_saving_game = function(context)
		commands.debug_output("on_saving_game")
		if not commands.persistent then
			return
		end

		cm:save_named_value(commands.config.save_load_value_name, commands.persistent, context)
	end,

	--- @function on_loading_game
	--- @desc Loads commands.persistent from the save file; Applies default values for the properties that are not found saved
	on_loading_game = function(context)
		commands.debug_output("on_loading_game")
		if not commands.persistent then
			return
		end

		commands.persistent = cm:load_named_value(commands.config.save_load_value_name, commands.persistent, context)

		-- Default values
		if commands.persistent.activated_effect_used == nil then
			commands.persistent.activated_effect_used = {}
		end
		if commands.persistent.passive_effect_used == nil then
			commands.persistent.passive_effect_used = {}
		end
		if commands.persistent.apply_effects_on_new_characters == nil then
			commands.persistent.apply_effects_on_new_characters = {}
		end
		if commands.persistent.game_persistent == nil then
			commands.persistent.game_persistent = {}
		end
	end,

	--- @function has_foreign_presence_effects
	--- @desc Returns true if the local faction has effects related to Foreign Presence
	has_foreign_presence_effects = function()
		local local_faction_key = commands.get_local_faction_key()
		if not local_faction_key then
			return false
		end

		local has_fp_effect = false

		commands.for_each_effect_of_faction(local_faction_key, function(effect_type, effect)
			if commands.effect_types[effect_type].show_foreign_presence and
				commands.effect_types[effect_type].show_foreign_presence(effect)
			then
				has_fp_effect = true
			end
		end)

		return has_fp_effect
	end,

	--- @function has_effect_of_type
	--- @desc Returns true if the local faction has effect(s) of the supplied type in its activated or passive command
	--- @p @string effect_type, Searched effect type
	has_effect_of_type = function(effect_type)
		local local_faction_key = commands.get_local_faction_key()
		if not local_faction_key then
			return false
		end

		local has_effect = false

		commands.for_each_effect_of_faction(local_faction_key, function(et, effect)
			if et == effect_type then
				has_effect = true
			end
		end)

		return has_effect
	end,

	--- @function get_provinces
	--- @desc Returns a list of the keys of all provinces belonging to a faction
	--- @p @string faction_key, Key of faction for which to check
	--- @p @boolean only_entire_provinces, Whether to add a province to the list only if the faction owns it completely
	--- @p @boolean return_region_key, If true, for each province will return a key of a region owned by the faction instead of province key
	get_provinces = function(faction_key, only_entire_provinces, return_region_key)
		local faction = cm:get_faction(faction_key)
		local province_or_region_keys = {}

		local province_list = faction:province_list()
		for pi = 0, faction:num_provinces() - 1 do
			local province = province_list:item_at(pi)
			if not only_entire_provinces or faction:holds_entire_province(province:name(), false) then
				if return_region_key then
					-- Find region in province owned by the faction
					local province_regions = province:regions()
					for ri = 0, province_regions:num_items() - 1 do
						local region = province_regions:item_at(ri)
						if region:owning_faction():name() == faction_key then
							table.insert(province_or_region_keys, region:name())
						end
					end
				else
					table.insert(province_or_region_keys, province:name())
				end
			end
		end
		return province_or_region_keys
	end,

	--- @function count_buildings
	--- @desc Returns a list of all buildings in the supplied faction's settlements, ERSes and hordes, with table keys being the building keys and table values being the number of such buildings (or the highest built level of these buildings)
	--- @p @string faction_key, Key of faction for which to count
	--- @p @boolean return_levels, Whether to return the highest built level for each building, or return number of such built buildings
	--- @p @boolean count_in_region_slots, Whether to count buildings in faction's regions' slots
	--- @p @boolean count_in_hordes, Whether to count buildings in faction's horde armies
	--- @p @table count_cult_centres, An optional table that will be populated with info (same format as returned table) about main buildings of owned cult centres, with table values always being building levels no matter of return_levels
	count_buildings = function(faction_key, return_levels, count_in_region_slots, count_in_hordes, count_cult_centres)
		local faction = cm:get_faction(faction_key)
		local result = {}

		local add_building = function(result_list, count_levels, building_key, building_level)
			if result_list[building_key] == nil then
				result_list[building_key] = 0
			end
			if count_levels then
				if building_level > result_list[building_key] then
					result_list[building_key] = building_level
				end
			else
				result_list[building_key] = result_list[building_key] + 1
			end
		end

		-- Count buildings in region slots (settlements and ERSes)
		if count_in_region_slots then
			local region_list = faction:region_list()
			for ri = 0, region_list:num_items() - 1 do
				local region = region_list:item_at(ri)
				local region_slot_list = region:slot_list()
				for si = 0, region_slot_list:num_items() - 1 do
					local slot = region_slot_list:item_at(si)
					if slot:has_building() then
						add_building(result, return_levels, slot:building():name(), slot:building():level())
					end
				end
			end
		end

		-- Count buildings in hordes
		if count_in_hordes then
			local forces_list = faction:military_force_list()
			for fi = 0, forces_list:num_items() - 1 do
				local force = forces_list:item_at(fi)
				if force:is_horde() then
					local force_buildings_list = force:buildings()
					for bi = 0, force_buildings_list:num_items() - 1 do
						local force_building = force_buildings_list:item_at(bi)
						add_building(result, return_levels, force_building:name(), force_building:level())
					end
				end
			end
		end

		-- Count cult centres
		if count_cult_centres then
			local cult_centre_region_keys = deities.get_cult_centre_regions()
			for _, region_key in ipairs(cult_centre_region_keys) do
				local region = cm:get_region(region_key)
				if region:owning_faction() and not region:owning_faction():is_null_interface() and
					region:owning_faction():name() == faction_key
				then
					local main_building = region:settlement():primary_slot():building()
					if main_building and not main_building:is_null_interface() then
						add_building(count_cult_centres, true, main_building:name(), main_building:level())
					end
				end
			end
		end

		return result
	end,

	--- @function get_units_given_by_buildings
	--- @desc Calculates what units will be given by effect type buildings_giving_units according to existing buildings
	--- @desc Format of returned table: { unit key = { count = list of counts, rank = list of ranks }}
	--- @p @string faction_key, Key of faction for which to calculate the effect
	--- @p @boolean return_all_units, Whether to return all units that can be given, or return only the ones chosen according to the effect params
	--- @p @table effect, Definition of effect; see commands.effect_types.buildings_giving_units
	get_units_given_by_buildings = function(faction_key, return_all_units, effect)
		local shuffe_units = effect.shuffle_units
		local units_count_without_buildings = effect.units_count_without_buildings or 0
		local units_count_per_building = effect.units_count_per_building or 1
		local units_by_building = effect.units_by_building
		local rank_by_building = effect.rank_by_building or {}
		local rank_by_building_level_multiplier = effect.rank_by_building_level_multiplier

		-- Count buildings owned by faction
		local count_cult_centres = to_bool(table_find(units_by_building, function(e) return e.building == "cult_centre_main" end))
		local count_buildings = #units_by_building > (count_cult_centres and 1 or 0)

		local cult_centre_levels = {}
		local buildings_counts = commands.count_buildings(faction_key, false, count_buildings, count_buildings, count_cult_centres and cult_centre_levels or nil)

		-- Find existing building that gives highest unit rank among the buildings in rank_by_building
		local units_rank = commands.get_unit_rank_from_building(rank_by_building, buildings_counts)

		-- Find in all owned buildings the building with the highest tier (among the buildings in units_by_building)
		-- and get the list of units that it "gives"
		-- When cult centres are counted, a list of unit ranks is also returned (with unit rank per cult centre)
		local given_units_list, units_rank_list, searched_buildings_count = commands.get_units_list_of_building_giving_units(buildings_counts, units_by_building, cult_centre_levels, rank_by_building_level_multiplier)
		units_rank = units_rank_list or units_rank

		if return_all_units then
			return given_units_list
		end

		-- Calculate total number of given units
		local given_units_total = units_count_without_buildings + math.floor(units_count_per_building * searched_buildings_count)

		-- Return a list of units of the required size, picked randomly or evenly from the list of all givable units
		return commands.get_needed_num_of_units_from_list(given_units_list, given_units_total, shuffe_units, units_rank, units_count_without_buildings, units_count_per_building)
	end,

	--- @function get_unit_rank_from_building
	--- @desc Returns the highest unit rank for an existing (according to buildings_counts) building among the buildings in rank_by_building
	--- @p @table rank_by_building, Table of format { building key = building rank }
	--- @p @table buildings_counts, Table of format { building key = number of buildings }
	get_unit_rank_from_building = function(rank_by_building, buildings_counts)
		local units_rank = 0
		for building_key, building_rank in pairs(rank_by_building) do
			local building_count = buildings_counts[building_key]
			if building_count ~= nil and building_rank > units_rank then
				units_rank = building_rank
			end
		end

		return units_rank
	end,

	--- @function get_units_list_of_building_giving_units
	--- @desc Returns a list of units + number of found buildings + a list of unit ranks for the found building of the highest tier
	--- @p @table buildings_counts, Table of format { building key = number of buildings }
	--- @p @table units_by_building, Table of format { building = building key or "cult_centre_main", units/unit_set = list of units or unit set key }; Must be sorted by bulding tier (highest tier at end)
	--- @p @table cult_centre_levels, Table of format { main building key = building level }
	--- @p @number rank_by_building_level_multiplier, If supplied, units_rank_list will be returned with unit rank for each cult centre
	get_units_list_of_building_giving_units = function(buildings_counts, units_by_building, cult_centre_levels, rank_by_building_level_multiplier)
		local searched_buildings_count = 0
		local units_rank_list = nil
		local given_units_list = nil

		for i = 1, #units_by_building do
			local building_def = units_by_building[i]

			local building_count = 0
			if building_def.building == "cult_centre_main" then
				if rank_by_building_level_multiplier then
					units_rank_list = {}
				end
				for _, building_level in dpairs(cult_centre_levels) do
					building_count = building_count + 1
					if rank_by_building_level_multiplier then
						-- For each cult centre, calculate separate unit rank
						table.insert(units_rank_list, building_level * rank_by_building_level_multiplier)
					end
				end
			else
				building_count = buildings_counts[building_def.building]
			end

			if building_count ~= nil and building_count > 0 then
				-- We assume that units_by_building is sorted by bulding tier (highest tier at end)
				if building_def.units then
					given_units_list = building_def.units
				elseif building_def.unit_set then
					given_units_list = cm:model():get_unit_keys_in_unit_set(building_def.unit_set)
				end

				searched_buildings_count = searched_buildings_count + building_count
			end
		end
		if not given_units_list then
			given_units_list = units_by_building[1].units or cm:model():get_unit_keys_in_unit_set(units_by_building[1].unit_set) or {}
		end

		return given_units_list, units_rank_list, searched_buildings_count
	end,

	--- @function get_needed_num_of_units_from_list
	--- @desc Returns a list of units of the required size, picked randomly or evenly from the input unit list, in format { unit key = { count = list of numbers, rank = list of numbers } }
	--- @p @table given_units_list, List of unit keys
	--- @p @number given_units_total, How many units we want in the returned list
	--- @p @boolean shuffe_units, Whether to randomly pick units or follow the order in the input list
	--- @p @number or @table units_rank, Rank to set to given units; Can be a list of ranks; if so, units_count_without_rank and units_count_per_rank tell how to distribute the ranks among the given units
	--- @p @number units_count_without_rank, If supplied unit_rank is a list, tells how many of the first units to give will have rank 0 
	--- @p @number units_count_per_rank, If supplied unit_rank is a list, tells how many units will receive each of the ranks in the list
	get_needed_num_of_units_from_list = function(given_units_list, given_units_total, shuffe_units, units_rank, units_count_without_rank, units_count_per_rank)
		local given_units_num = 0
		local given_units = {}

		local add_unit = function(unit_key)
			local unit_rank = units_rank
			if is_table(units_rank) then
				-- First units_count_without_rank units will have rank 0, then every units_count_per_rank units
				-- (i.e. all units coming from the same building) will have the same rank
				if given_units_num < units_count_without_rank or units_count_per_rank == 0 then
					unit_rank = 0
				else
					local building_index = 1 + math.floor((given_units_num - units_count_without_rank) / units_count_per_rank)
					unit_rank = units_rank[building_index]
				end
			end

			if given_units[unit_key] == nil then
				given_units[unit_key] = { count = {}, rank = {} }
			end

			local add_new_rank = true

			-- Find index of rank in list and increment the count for this rank
			for i = 1, #given_units[unit_key].rank do
				if given_units[unit_key].rank[i] == unit_rank then
					given_units[unit_key].count[i] = given_units[unit_key].count[i] + 1
					add_new_rank = false
					break
				end
			end

			if add_new_rank then
				table.insert(given_units[unit_key].rank, unit_rank)
				table.insert(given_units[unit_key].count, 1)
			end

			given_units_num = given_units_num + 1
		end

		while given_units_num < given_units_total do
			if shuffe_units then
				-- Pick random possibly-repeating units from the list of given units
				local random_index = cm:model():random_int(1, #given_units_list)
				add_unit(given_units_list[random_index])
			else
				-- Give evenly from the list of given units
				for _, unit_key in ipairs(given_units_list) do
					add_unit(unit_key)
					if given_units_num >= given_units_total then
						break
					end
				end
			end
		end

		return given_units
	end,

	--- @function get_units_given_by_foreign_presence
	--- @desc Calculates what units are given by effect type foreign_presence_giving_units according to religious influence in faction's provinces
	--- @desc Returned table contains indexed list of unit keys
	--- @p @string faction_key, Key of faction for which to calculate the effect
	--- @p @number units_count_per_fp, Number of units to give for each Foreign Presence
	--- @p @number min_tier, Minimal tier of the given units
	get_units_given_by_foreign_presence = function(faction_key, units_count_per_fp, min_tier)
		local faction = cm:get_faction(faction_key)
		local religion_keys = faction:foreign_influence_religions(commands.config.foreign_presence_min_influence)
		local given_units = {}

		for _, religion_key in ipairs(religion_keys) do
			local religion_faction_keys = cm:model():world():factions_with_state_religion(religion_key)

			-- Gather all possible units of the factions with this religion
			local fp_unit_keys = {}
			for _, influencing_faction_key in ipairs(religion_faction_keys) do
				local influencing_faction = cm:get_faction(influencing_faction_key)
				if influencing_faction and not influencing_faction:is_null_interface() then
					local faction_top_units = influencing_faction:frontend_top_units(min_tier)
					for _, unit_key in ipairs(faction_top_units) do
						table_add_unique(fp_unit_keys, unit_key)
					end
				end
			end

			if #fp_unit_keys > 0 then
				for i = 1, units_count_per_fp do
					local random_index = cm:model():random_int(1, #fp_unit_keys)
					table.insert(given_units, fp_unit_keys[random_index])
				end
			end
		end
		return given_units
	end,

	--- @function get_units_count
	--- @desc Counts and returns the number of units in the armies of the supplied faction
	--- @p @string faction_key, Key of faction for which to count
	--- @p [opt=nil] @boolean mounted_units, Whether to count only mounted units (true), or only not mounted units (false)
	--- @p [opt=nil] @boolean in_horde, Whether to count only units in hordes (true), or only units not in hordes (false)
	get_units_count = function(faction_key, mounted_units, in_horde)
		local faction = cm:get_faction(faction_key)
		local count = 0
		local forces_list = faction:military_force_list()
		for i = 0, forces_list:num_items() - 1 do
			local military_force = forces_list:item_at(i)
			if military_force and not military_force:is_null_interface() then
				local is_horde = tribes_privileges.is_horde_type(military_force)
				if in_horde == nil or is_horde == in_horde then
					local unit_list = military_force:unit_list()
					for unit_i = 0, unit_list:num_items() - 1 do
						local unit = unit_list:item_at(unit_i)
						if mounted_units == nil or unit:is_mounted() == mounted_units then
							count = count + 1
						end
					end
				end
			end
		end
		return count
	end,

	--- @function get_ancillary_cost
	--- @desc Returns the cost (as table of resource keys and amounts as values) of the ancillary that is added by the supplied effect
	--- @p @string faction_key, Key of faction for which to calculate the cost
	--- @p @table effect, Definition of add_ancillary effect; see commands.effect_types.add_ancillary
	get_ancillary_cost = function(faction_key, effect)
		local game_persistent = commands.get_game_persistent_data(faction_key, "added_ancillaries", effect.ancillary_key)
		local usage_count = game_persistent.count or 0

		local cost = {}
		for _, resource_key in ipairs(cm:model():get_economy_resource_keys()) do
			local resource_cost = (effect.initial_cost[resource_key] or 0) + usage_count * (effect.cost_increment[resource_key] or 0)
			if resource_cost > 0 then
				cost[resource_key] = resource_cost
			end
		end
		return cost
	end,

	--- @function get_military_training_points
	--- @desc Returns the number of Military Training points for the supplied faction
	--- @p @string faction_key, Key of faction which to check
	get_military_training_points = function(faction_key)
		local faction = cm:get_faction(faction_key)
		if faction:has_pooled_resource("phar_map_military_training") then
			return faction:pooled_resource("phar_map_military_training"):value()
		else
			return 0
		end
	end,

	--- @function add_military_training_points
	--- @desc Adds (subtracts) Military Training points to the supplied faction
	--- @p @string faction_key, Key of faction for which to add/subtract points
	--- @p @number points, Positive or negative number of points
	add_military_training_points = function(faction_key, points)
		cm:faction_add_pooled_resource(faction_key, "phar_map_military_training", "phar_map_wars", points)
	end,

	--- @function faction_can_afford_cost
	--- @desc Returns true if the supplied faction has enough resources to spend on the supplied cost
	--- @p @string faction_key, Key of faction which to check
	--- @p @table cost, The cost as table of resource keys and amounts as values
	faction_can_afford_cost = function(faction_key, cost)
		local faction = cm:get_faction(faction_key)
		for resource_key, amount in pairs(cost) do
			if not faction:has_pooled_resource(resource_key) or faction:pooled_resource(resource_key):value() < amount then
				return false
			end
		end
		return true
	end,

	--- @function is_leader_in_own_or_vassal_province
	--- @desc Returns true if the supplied faction's leader is in own or vassal/subject province
	--- @p @string faction_key, Key of faction whose faction leader to check for which province he/she is situated in
	is_leader_in_own_or_vassal_province = function(faction_key)
		local faction = cm:get_faction(faction_key)
		if not faction:faction_leader() then
			return false
		end
		local leader_region = faction:faction_leader():region()
		if not leader_region or leader_region:is_null_interface() then
			return false
		end
		local region_faction = leader_region:owning_faction()
		return region_faction:name() == faction_key or region_faction:is_vassal_of(faction) or region_faction:is_subject_of(faction)
	end,

	--- @function get_leader_province_production
	--- @desc Returns a list of resources equal to the current production of a faction leader's local province; returns an empty list if faction doesn't have a leader
	--- @p @string faction_key, Key of faction whose faction leader to check for which province he/she is situated in
	get_leader_province_production = function(faction_key)
		local faction = cm:get_faction(faction_key)
		if not faction:faction_leader() then
			commands.console_output("Cannot get production of province where faction leader is because faction ".. faction_key .. " doesn't have leader")
			return {}
		end

		if not commands.is_leader_in_own_or_vassal_province(faction_key) then
			commands.console_output("Leader of ".. faction_key .. " is not in own or vassal province, so no province production to gain")
			return {}
		end

		local leader_region = faction:faction_leader():region()
		if not leader_region or leader_region:is_null_interface() then
			return {}
		end

		local province_regions = leader_region:province():regions()
		local resources_list = {}
		for i = 0, province_regions:num_items() - 1 do
			local region = province_regions:item_at(i)
			local region_faction = region:owning_faction()
			if region_faction:name() == faction_key or region_faction:is_vassal_of(faction) or region_faction:is_subject_of(faction) then
				for _, resource_key in ipairs(cm:model():get_economy_resource_keys()) do
					local income_resource = region:pooled_resource_income(resource_key)
					if income_resource > 0 then
						if not resources_list[resource_key] then
							resources_list[resource_key] = 0
						end
						resources_list[resource_key] = resources_list[resource_key] + income_resource
					end
				end
			end
		end
		return resources_list
	end,

	--- @function apply_effect_bundle_to_character
	--- @desc Applies the supplied effect bundle to the supplied character or its military force
	--- @p CHARACTER_SCRIPT_INTERFACE character, Reference to the character
	--- @p @string effect_bundle_key, Key of effects bundle
	--- @p @number duration, Duration of effects (in turns)
	--- @p @boolean apply_on_forces, Whether to apply the bundle on the military force of the character or on the character
	apply_effect_bundle_to_character = function(character, effect_bundle_key, duration, apply_on_forces)
		if apply_on_forces then
			local military_force = character:military_force()
			if military_force and not military_force:is_null_interface() and not military_force:is_armed_citizenry() then
				cm:apply_effect_bundle_to_force(effect_bundle_key, military_force:command_queue_index(), duration)
				commands.console_output("applied effect bundle " .. effect_bundle_key .. " to force of " .. character:onscreen_name() .. ", duration: " .. duration)
			else
				commands.console_output("cannot apply " .. effect_bundle_key .. " on null military force or garrison army of " .. character:onscreen_name())
			end
		else
			cm:apply_effect_bundle_to_character(effect_bundle_key, character:command_queue_index(), duration)
			commands.console_output("applied effect bundle " .. effect_bundle_key .. " to character " .. character:onscreen_name() .. ", duration: " .. duration)
		end
	end,

	--- @function remove_effect_bundle_from_character
	--- @desc Removes the supplied effect bundle from the supplied character or its military force
	--- @p CHARACTER_SCRIPT_INTERFACE character, Reference to the character
	--- @p @string effect_bundle_key, Key of effects bundle
	--- @p @boolean apply_on_forces, Whether the bundle was applied on the military force of the character or on the character
	remove_effect_bundle_from_character = function(character, effect_bundle_key, apply_on_forces)
		if apply_on_forces then
			local military_force = character:military_force()
			if military_force and not military_force:is_null_interface() and not military_force:is_armed_citizenry() then
				cm:remove_effect_bundle_from_characters_force(effect_bundle_key, military_force:command_queue_index())
				commands.console_output("removed effect bundle " .. effect_bundle_key .. " from force of " .. character:onscreen_name())
			else
				commands.console_output("cannot remove " .. effect_bundle_key .. " from null military force or garrison army of " .. character:onscreen_name())
			end
		else
			cm:remove_effect_bundle_from_character(effect_bundle_key, character:command_queue_index())
			commands.console_output("removed effect bundle " .. effect_bundle_key .. " from character " .. character:onscreen_name())
		end
	end,

	--- @function hide_tooltip_templates
	--- @desc Sets the visibility to false of the components with the supplied ids both in the
	--- @desc "activated" and "passive" effect containers in the HUD button's tooltip
	--- @p @table template_component_ids, List of component ids
	hide_tooltip_templates = function(template_component_ids)
		local actiavated_container = commands.hud_button_tooltip:SequentialFind(commands.config.component_ids.tooltip_activated_container)
		local passive_container = commands.hud_button_tooltip:SequentialFind(commands.config.component_ids.tooltip_passive_container)
		for _, component_id in ipairs(template_component_ids) do
			local template = actiavated_container:SequentialFind(component_id)
			if template then
				template:SetVisible(false)
			end
			template = passive_container:SequentialFind(component_id)
			if template then
				template:SetVisible(false)
			end
		end
	end,

	--- @function get_selected_character_name
	--- @desc Returns the name of the currently selected character or "None"
	get_selected_character_name = function()
		local selected_char_cqi = uim:get_char_selected_cqi()
		local character = selected_char_cqi and cm:get_character_by_cqi(selected_char_cqi) or nil;
		if character then
			return character:onscreen_name()
		else
			return get_localised_text_replacement(commands.config.texts.selected_character_none)
		end
	end,

	--- @function set_tooltip_field
	--- @desc Sets the text and/or state and visibility of a componen in the HUD button's tooltip
	--- @p @string component_id, Id of component; You can also supply a list of ids (in a @table) for sequential find
	--- @p [opt=nil] @table text_id_and_params, Set to change the text of the component; The text key (for string in ui_text_replacements table) and params to be replaced in the text are supplied as table in format { id = "key", params = { param1, ...} }; If there are no params, you can just supply a @string with the text key instead of a @table; If the parameter is not supplied (or nil is supplied), then the text of the component will not be changed
	--- @p [opt=nil] @string state, Supply a state name to change the state of component; If the parameter is not supplied (or nil is supplied), then the state of the component will not be changed
	--- @p [opt=nil] @boolean visible, Set to change the visibility of component; If the parameter is not supplied (or nil is supplied), then the visibility of the component will not be changed
	set_tooltip_field = function(component_id, text_id_and_params, state, visible)
		local comp = is_table(component_id) and commands.hud_button_tooltip:SequentialFind(unpack(component_id)) or
			commands.hud_button_tooltip:SequentialFind(component_id)
		if comp then
			if text_id_and_params then
				local text_defs = {}
				if is_table(text_id_and_params) and not text_id_and_params.id then
					text_defs = text_id_and_params
				else
					text_defs = { text_id_and_params }
				end

				local texts = {}
				for _, text_def in dpairs(text_defs) do
					local text_id = is_table(text_def) and text_def.id or text_def
					local params = is_table(text_def) and text_def.params or nil
					local text
					if params then
						text = get_localised_text_replacement_and_source_formatted(text_id, unpack(params))
					else
						text = get_localised_text_replacement(text_id)
					end
					table.insert(texts, commands.replace_values_in_text(text))
				end
				comp:SetText(table.concat(texts, "\n"))
			end
			if state then
				comp:SetState(state)
			end
			if visible ~= nil then
				comp:SetVisible(visible)
			end
		else
			commands.debug_error("missing field '" .. (is_table(component_id) and component_id.key or component_id) .."' in tooltip layout " ..  commands.config.hud_button_tooltip_layout_path)
		end
	end,

	--- @function replace_values_in_text
	--- @desc Returns the supplied text with placeholders (like "{DURATION}") replaced by values according to the commands of the PlayerFaction
	--- @p @string text, Already localised text to inject values into
	replace_values_in_text = function(text)
		local faction_key = commands.get_local_faction_key()
		if not faction_key then
			return
		end

		local activated_command = commands.get_activated_command(faction_key)
		local passive_command = commands.get_passive_command(faction_key)

		text = text:gsub("{DURATION}", commands.get_activated_duration_turns_total(faction_key))
		text = text:gsub("{COOLDOWN}", commands.get_activated_cooldown_turns_total(faction_key))
		text = text:gsub("{WINDUP}", commands.get_passive_windup_turns_total(faction_key))
		text = text:gsub("{REPEAT}", passive_command.repeatable or 0)

		text = text:gsub("{MTPOINTS}", commands.get_military_training_points(faction_key))
		text = text:gsub("{SELECTED_CHARACTER}", commands.get_selected_character_name())

		local replace_effect_values_in_text = function(effect_type, effect)
			if commands.effect_types[effect_type].replace_values_in_text then
				local persistent_storage = effect.is_passive_effect and commands.persistent.passive_effect_used or commands.persistent.activated_effect_used
				text = commands.effect_types[effect_type].replace_values_in_text(text, faction_key, effect, persistent_storage[faction_key])
			end
		end

		commands.for_each_effect(activated_command, replace_effect_values_in_text)
		commands.for_each_effect(passive_command, replace_effect_values_in_text)

		return text
	end,

	--- @function set_tooltip_resources
	--- @desc Updates the list of resources/cost in the supplied effect container (for "activated" or "passive" effect) in the HUD button's tooltip
	--- @p @table resources_list, List of resources as associative map (key: resource key, value: resource amount)
	--- @p @table resources_icons, List of files as associative map (key: resource key, value: file path)
	--- @p @string container_id, Id of container (for "activated" or "passive" effect) in the tooltip
	--- @p @string resources_template_id, Id of resources/cost container inside the container with container_id
	--- @p @boolean has_separator, Whether the resource template has a separator as child right after the child that is resource template
	--- @p @number dont_touch_first_children, Number of first children inside the resource template that should be kept; the first child after them is considered the resource template; the second child after them is considered the separator template
	set_tooltip_resources = function(resources_list, resources_icons, container_id, resources_template_id, has_separator, dont_touch_first_children)
		local resources_container = commands.hud_button_tooltip:SequentialFind(container_id, resources_template_id)
		if not resources_container then
			commands.debug_error("missing template '" .. resources_template_id .."' inside '" .. container_id .. "' in tooltip layout " ..  commands.config.hud_button_tooltip_layout_path)
			return
		end

		local list_contains_resources = resources_list and not table.is_empty(resources_list)
		resources_container:SetVisible(not not list_contains_resources)
		if not list_contains_resources then
			return
		end

		local resource_template = UIComponent(resources_container:Find(dont_touch_first_children));
		resource_template:SetVisible(false)

		local separator_template = nil
		if has_separator then
			separator_template = UIComponent(resources_container:Find(dont_touch_first_children + 1));
			separator_template:SetVisible(false)
		end

		-- Clean existing resource entries (without resource_template and separator_template)
		for i = resources_container:ChildCount() - 1, dont_touch_first_children + (has_separator and 2 or 1), -1 do
			UIComponent(resources_container:Find(i)):Destroy();
		end

		-- Add resource entries and separators between them
		local separator = nil
		for _, resource_key in ipairs(cm:model():get_economy_resource_keys()) do
			local income_resource = resources_list[resource_key]
			if income_resource then
				local res_entry = UIComponent(resources_container:CreateFromComponent(resource_template:Address(), resource_key))
				res_entry:SetVisible(true)

				local first_child = res_entry:Find(0)
				res_entry = first_child and UIComponent(first_child) or res_entry;

				res_entry:SetText(income_resource)
				res_entry:SetImagePath(resources_icons[resource_key])

				if has_separator then
					separator = UIComponent(resources_container:CreateFromComponent(separator_template:Address(), "sep_" .. resource_key))
					separator:SetVisible(true)
				end
			end
		end

		-- Hide last separator
		if has_separator then
			separator:SetVisible(false)
		end
	end,

	--- @function set_tooltip_units
	--- @desc Updates the list of resources/cost in the supplied effect container (for "activated" or "passive" effect) in the HUD button's tooltip
	--- @p @table units_list, List of units as associative map (key: unit key, value: units count)
	--- @p @string container_id, Id of container (for "activated" or "passive" effect) in the tooltip
	--- @p @string units_template_id, Id of units container inside the container with container_id
	set_tooltip_units = function(units_list, container_id, units_template_id)
		local units_container = commands.hud_button_tooltip:SequentialFind(container_id, units_template_id)
		if not units_container then
			commands.debug_error("missing template '" .. units_template_id .."' inside '" .. container_id .. "' in tooltip layout " ..  commands.config.hud_button_tooltip_layout_path)
			return
		end

		local list_contains_units = units_list and not table.is_empty(units_list)
		units_container:SetVisible(not not list_contains_units)
		if not list_contains_units then
			return
		end

		-- Add units entries
		local units_cco_table = { UnitKeys = {} }
		if #units_list > 0 then
			for _, unit_key in ipairs(units_list) do
				table.insert(units_cco_table.UnitKeys, unit_key)
			end
		else
			for unit_key, unit_params in dpairs(units_list) do
				for i = 1, #unit_params.count do
					table.insert(units_cco_table.UnitKeys, unit_key)
				end
			end
		end
		common.set_context_value(commands.config.hud_button_script_id, units_cco_table)
	end,

	--- @function set_tooltip_foreign_presence
	--- @desc Shows and updates the Additional Info section in the HUD button's tooltip with info on Foreign Presence
	set_tooltip_foreign_presence = function()
		local fp_section = commands.hud_button_tooltip:SequentialFind(commands.config.component_ids.tooltip_additional_info_section)
		if not fp_section then
			return
		end

		fp_section:SetVisible(true)

		local fp_description = fp_section:SequentialFind(commands.config.component_ids.tooltip_additional_info_description)
		if fp_description then
			fp_description:SetText(get_localised_text_replacement(commands.config.texts.foreign_presence_description))
		end

		local fp_status = fp_section:SequentialFind(commands.config.component_ids.tooltip_additional_info_status)
		if fp_status then
			local local_faction_key = commands.get_local_faction_key()
			local religion_keys = cm:get_faction(local_faction_key):foreign_influence_religions(commands.config.foreign_presence_min_influence)
			local foreign_presence_count = #religion_keys
			fp_status:SetText(get_localised_text_replacement_and_source_formatted(commands.config.texts.foreign_presence_status, foreign_presence_count))
		end
	end,

	--- @function add_listener
	--- @desc A wrapper for core:add_listener() with the same parameters, that remembers
	--- @desc the added listener's name, so that it can be cleaned/removed
	add_listener = function(listener_name, ...)
		commands.debug_output("add_listener " .. listener_name)

		core:add_listener(listener_name, unpack(arg))
		table.insert(commands.added_listeners, listener_name)
	end,

	--- @function add_optional_listener
	--- @desc A wrapper for core:add_listener() with the same parameters, that remembers
	--- @desc the added listener's name, so that it can be cleaned/removed
	--- @desc The listener will be added only if its name is present among the list supplied in list_of_required_listeners
	--- @p @table list_of_required_listeners, A list of listener names (as supplied to listener_name) which are needed
	add_optional_listener = function(list_of_required_listeners, listener_name, ...)
		commands.debug_output("add_optional_listener " .. listener_name)
		if not table_find(list_of_required_listeners, listener_name, false) then
			return
		end

		commands.add_listener(listener_name, unpack(arg))
	end,

	--- @function check_feature_availability_for_faction
	--- @desc A wrapper to check if the feature is available for the faction
	--- @p @string faction_key, faction key for which to check.
	--- @p @boolean check_for_previous_turn, If true, will check the availability not for the current turn, but for the previous turn
	check_feature_availability_for_faction = function(faction_key, check_for_previous_turn)
		-- Minor factions do not have access to commands
		if common.is_secondary_faction(faction_key) then
			return false
		end
		local turn_number = cm:model():turn_number()
		if check_for_previous_turn then
			turn_number = turn_number - 1
		end
		local feature_turn = feature_unlock.get_feature_unlock_turn_for_faction(faction_key, feature_ids_config.commands)
		return turn_number >= feature_turn
	end,

	--- @function send_config_to_cpp
	--- @desc Sends some config variables to COMMANDS_CONFIG in C++
	send_config_to_cpp = function()
		local local_faction_key = commands.get_local_faction_key()
		local commands_enabled = commands.is_commands_enabled_for_faction(local_faction_key)

		cm:set_commands_config({
			commands_are_enabled = commands_enabled,
			foreign_presence_min_influence = commands.config.foreign_presence_min_influence,
			show_foreign_presence = commands.has_foreign_presence_effects(),
			show_military_training_points = commands_enabled and commands.has_effect_of_type("spend_military_training_points")
		})
	end,

	--- @function console_output
	--- @desc Prints the supplied message to console when commands.config.show_console_messages is true
	console_output = function(str)
		if commands.config.show_console_messages then
			out("*** COMMANDS ***: " .. str)
		end
	end,

	--- @function debug_output
	--- @desc Prints the supplied message to console when commands.config.show_console_debug_messages is true
	debug_output = function(str)
		if commands.config.show_console_debug_messages then
			out("*** COMMANDS DEBUG ***: " .. str)
		end
	end,

	--- @function debug_error
	--- @desc Prints the supplied error message to console and breaks LUA execution when commands.config.break_on_error is true
	debug_error = function(str)
		out("*** COMMANDS ERROR ***: " .. str)
		if commands.config.break_on_error then
			redis.breakpoint()
		end
	end,
}


------------------ APPLY & CLEAR EFFECTS ------------------

--- @function commands.effect_types.effect_bundle.apply_function
--- @desc Applies effect bundle on the supplied faction
--- @p @string faction_key, Key of faction on which to apply the effects
--- @p @table effect, Definition of effect to apply; see commands.effect_types.effect_bundle
--- @p @table persistent_data, Persistent storage container, where the effect stores data needed for clearing it
--- @p @table command_optional_data, a table containing data usually needed by different effect type implementations (such as charater on which the effect should be applied)
commands.effect_types.effect_bundle.apply_function = function(faction_key, effect, persistent_data, command_optional_data)
	if effect.bundle_key == "" then
		return
	end

	if effect.condition == "pillars_civilization_level" then
		if pillars_civilization.get_civilization_level_with_name(effect.condition_value) and
			effect.condition_value ~= pillars_civilization.get_current_civilization_level().name
		then
			return
		end
	elseif effect.condition == "military_training_points" then
		if commands.get_military_training_points(faction_key) < effect.condition_value then
			return
		end
	end

	local duration = commands.get_duration_in_turns(faction_key, effect)
	local provinces_data = {}
	local apply_on_own_character = (effect.target == "selected_character" or effect.target == "faction_leader")
	local target_character_cqi = 0
	local target_factions = apply_on_own_character and {} or { faction_key }
	if effect.faction_key then
		if apply_on_own_character then
			commands.debug_error("Effect bundle target is '" .. effect.target .. "' but faction_key is also supplied for " .. effect.bundle_key)
		-- Allow effect.faction_key to be either a single key or a list of keys
		elseif is_table(effect.faction_key) then
			target_factions = effect.faction_key
		else
			target_factions = { effect.faction_key }
		end
	end

	if effect.target == "selected_character" then
		if not is_table(command_optional_data) then
			commands.debug_error("Effect bundle received no optional command data")
			return
		end

		local char_cqi = command_optional_data.character_cqi
		local character = char_cqi and cm:get_character_by_cqi(char_cqi) or nil;
		if character then
			commands.apply_effect_bundle_to_character(character, effect.bundle_key, duration, false)
			target_character_cqi = char_cqi
		end
	elseif effect.target == "faction_leader" then
		local faction_leader = cm:get_faction(faction_key):faction_leader()
		if faction_leader and not faction_leader:is_null_interface() then
			commands.apply_effect_bundle_to_character(faction_leader, effect.bundle_key, duration, false)
			target_character_cqi = faction_leader:command_queue_index()
		end
	end

	for _, target_faction_key in ipairs(target_factions) do
		if effect.target == "characters" or effect.target == "forces" then
			-- Apply to all characters/forces of target faction
			local target_faction = cm:get_faction(target_faction_key)
			local char_list = target_faction:character_list()
			for i = 0, char_list:num_items() - 1 do
				local faction_character = char_list:item_at(i)
				commands.apply_effect_bundle_to_character(faction_character, effect.bundle_key, duration, effect.target == "forces")
			end

			-- Add effect to commands.persistent.apply_effects_on_new_characters, so that it'll be applied to newly-created characters
			if not commands.persistent.apply_effects_on_new_characters[target_faction_key] then
				commands.persistent.apply_effects_on_new_characters[target_faction_key] = {}
			end
			table.insert(commands.persistent.apply_effects_on_new_characters[target_faction_key],
				{ start_turn = cm:turn_number(), duration = duration, bundle_key = effect.bundle_key, on_force = (effect.target == "forces") }
			);
		elseif effect.target == "provinces" then
			-- Apply to provinces of target faction
			local province_region_keys = commands.get_provinces(target_faction_key, effect.condition == "complete_provinces", true)
			for _, region_key in ipairs(province_region_keys) do
				cm:apply_effect_bundle_to_province(effect.bundle_key, region_key, duration)
			end
			provinces_data[target_faction_key] = province_region_keys
		elseif effect.target == "leaders_province" then
			local faction = cm:get_faction(faction_key)
			local leader_region = faction:faction_leader():region_data()
			if leader_region and not leader_region:sea_region():is_null_interface() then
				return
			end
			local leader_region_key = leader_region:key()
			
			-- Using a callback to delay the application of the province effect so it allows the execution of other effect_types prior. This allows for the proper execution order in Tausrets Active command.
			cm:callback(
				function()
					cm:apply_effect_bundle_to_province(effect.bundle_key, leader_region_key, duration)
				end,
				0.1
			)
		else
			-- Apply to target faction
			cm:apply_effect_bundle(effect.bundle_key, target_faction_key, duration)
		end
	end

	if not persistent_data.effect_bundles then
		persistent_data.effect_bundles = {}
	end
	persistent_data.effect_bundles[effect.bundle_key] = {
		target_factions = target_factions,
		target_character_cqi = target_character_cqi,
		duration = duration,
		provinces_data = provinces_data,
	}
end

--- @function commands.effect_types.effect_bundle.clear_function
--- @desc Removes the effect bundle applied by commands.effect_types.effect_bundle.apply_function()
--- @p @string faction_key, Key of faction on which to clear
--- @p @table persistent_data, Persistent storage container, where info for the applied bundle was stored
--- @p @table effect, Definition of effect to clear; see commands.effect_types.effect_bundle
commands.effect_types.effect_bundle.clear_function = function(faction_key, persistent_data, effect)
	if not persistent_data or not persistent_data.effect_bundles or
		effect.bundle_key == "" or not persistent_data.effect_bundles[effect.bundle_key]
	then
		return
	end

	local effect_data = persistent_data.effect_bundles[effect.bundle_key]
	local duration = effect_data.duration

	-- Remove effect bundle only if its duration is unlimited (value of 0)
	if duration == 0 then
		if effect_data.target_character_cqi ~= 0 then
			local character = cm:get_character_by_cqi(effect_data.target_character_cqi);
			commands.remove_effect_bundle_from_character(character, effect.bundle_key, false)
		end

		for _, target_faction_key in ipairs(effect_data.target_factions) do
			if effect.target == "characters" or effect.target == "forces" then
				-- Remove bundle from all characters/forces of target faction
				local target_faction = cm:get_faction(target_faction_key)
				local char_list = target_faction:character_list()
				for i = 0, char_list:num_items() - 1 do
					local faction_character = char_list:item_at(i)
					commands.remove_effect_bundle_from_character(faction_character, effect.bundle_key, effect.target == "forces")
				end
	
				-- Remove bundle from commands.persistent.apply_effects_on_new_characters
				local cleared_effects = {}
				for _, character_effect in ipairs(commands.persistent.apply_effects_on_new_characters[target_faction_key]) do
					if character_effect.bundle_key ~= effect.bundle_key then
						table.insert(cleared_effects, character_effect)
					end
				end
				commands.persistent.apply_effects_on_new_characters[target_faction_key] = cleared_effects
			elseif effect.target == "provinces" then
				-- Remove bundle from provinces of target faction
				local province_region_keys = effect_data.provinces_data[target_faction_key]
				for _, region_key in ipairs(province_region_keys) do
					cm:remove_effect_bundle_from_province(effect.bundle_key, region_key)
				end
			else
				-- Remove bundle from target faction
				cm:remove_effect_bundle(effect.bundle_key, target_faction_key)
				commands.console_output("effect_bundle " .. effect.bundle_key .. " cleared for " .. faction_key)
			end
		end
	end

	persistent_data.effect_bundles[effect.bundle_key] = nil
end

--- @function commands.effect_types.custom_effect_bundle.apply_function
--- @desc Applies custom effect bundle on own faction
--- @p @string faction_key, Key of faction on which to apply the effects
--- @p @table effect, Definition of effect to apply; see commands.effect_types.effect_bundle
--- @p @table persistent_data, Persistent storage container, where the effect stores data needed for clearing it
commands.effect_types.custom_effect_bundle.apply_function = function(faction_key, effect, persistent_data)
	if (effect.bundle_key == "") then
		return
	end

	local duration = commands.get_duration_in_turns(faction_key, effect)
	local bundle_contains_effects = false
	local bundle = cm:create_new_custom_effect_bundle(effect.bundle_key)
	local other_factions_list
	if not bundle or bundle:is_null_interface() then
		commands.debug_error("cannot create custom effect bundle " .. effect.bundle_key)
		return
	end
	bundle:set_duration(duration)

	for _, effect_def in ipairs(effect.effects) do
		local value = effect_def.value
		if value == "unit_count" then
			value = commands.get_units_count(faction_key, effect_def.mounted_units, effect_def.in_horde)
		elseif value == "foreign_presence" then
			local religion_keys = cm:get_faction(faction_key):foreign_influence_religions(commands.config.foreign_presence_min_influence)
			value = #religion_keys
		end
		value = value * (effect_def.value_multiplier or 1)

		if value ~= 0 then
			bundle:add_effect(effect_def.effect_key, effect_def.scope, value)
			bundle_contains_effects = true
		end
	end

	if bundle_contains_effects then 
		if effect.apply_on_all_other_factions then
			-- Apply to all other factions in the world.
			local faction_list = cm:model():world():faction_list()
			for i = 0, faction_list:num_items() - 1 do
				local curr_faction = faction_list:item_at(i)
				local curr_faction_name = curr_faction:name()
				if curr_faction_name ~= faction_key then
					cm:apply_custom_effect_bundle_to_faction(bundle, curr_faction)
					if not other_factions_list then
						other_factions_list = {}
					end
					table.insert(other_factions_list, curr_faction_name)
				end
			end
		else 
			cm:apply_custom_effect_bundle_to_faction(bundle, cm:get_faction(faction_key))
		end

		if not persistent_data.custom_effect_bundles then
			persistent_data.custom_effect_bundles = {}
		end
		persistent_data.custom_effect_bundles[effect.bundle_key] = {
			duration = duration,
			other_factions_list = other_factions_list
		}
	end
end

--- @function commands.effect_types.custom_effect_bundle.clear_function
--- @desc Removes the custom effect bundle applied by commands.effect_types.custom_effect_bundle.apply_function()
--- @p @string faction_key, Key of faction on which to clear
--- @p @table persistent_data, Persistent storage container, where info for the applied bundle was stored
--- @p @table effect, Definition of effect to clear; see commands.effect_types.custom_effect_bundle
commands.effect_types.custom_effect_bundle.clear_function = function(faction_key, persistent_data, effect)
	if not persistent_data or not persistent_data.custom_effect_bundles or
		effect.bundle_key == "" or not persistent_data.custom_effect_bundles[effect.bundle_key]
	then
		return
	end

	local effect_data = persistent_data.custom_effect_bundles[effect.bundle_key]

	local remove_from_factions = effect_data.other_factions_list or { faction_key }
	for _, faction_key in ipairs(remove_from_factions) do
		-- Remove effect bundle only if its duration is unlimited (value of 0)
		if effect_data.duration == 0 then
			cm:remove_effect_bundle(effect.bundle_key, faction_key)
			commands.console_output("custom_effect_bundle " .. effect.bundle_key .. " cleared for " .. faction_key)
		end
	end

	persistent_data.custom_effect_bundles[effect.bundle_key] = nil
end

--- @function commands.effect_types.custom_effect_bundle.update_tooltip
--- @desc Shows and updates the Additional Info section in the HUD button's tooltip with info on Foreign Presence
--- @p @table effect, Definition of effect; see commands.effect_types.custom_effect_bundle
commands.effect_types.custom_effect_bundle.update_tooltip = function(effect)
	if commands.effect_types.custom_effect_bundle.show_foreign_presence(effect) then
		commands.set_tooltip_foreign_presence()
	end
end

--- @function commands.effect_types.custom_effect_bundle.show_foreign_presence
--- @desc Returns true if this effect bundle contains effects related to Foreign Presence
--- @p @table effect, Definition of effect; see commands.effect_types.custom_effect_bundle
commands.effect_types.custom_effect_bundle.show_foreign_presence = function(effect)
	for _, effect_def in ipairs(effect.effects) do
		if effect_def.value == "foreign_presence" then
			return true
		end
	end
	return false
end

--- @function commands.effect_types.custom_effect_bundle.replace_values_in_text
--- @desc Returns the suppled text with all instances of effect.replaced_value_multiplier_label in it replaced with the value_multiplier for this effect
--- @p @string text, Text in which to replace
--- @p @string faction_key, Key of faction for which to calculate
--- @p @table effect, Definition of effect to calculate; see commands.effect_types.gain_free_instant_construction
commands.effect_types.custom_effect_bundle.replace_values_in_text = function(text, faction_key, effect)
	local replaced_text = text
	for _, effect_def in ipairs(effect.effects) do
		if effect_def.replaced_value_multiplier_label then
			replaced_text = replaced_text:gsub(effect_def.replaced_value_multiplier_label, effect_def.value_multiplier)
		end
	end
	return replaced_text
end

--- @function commands.effect_types.buildings_giving_units.apply_function
--- @desc Applies adding of units to mercenary pool according to existing buildings
--- @p @string faction_key, Key of faction on which to apply the effects
--- @p @table effect, Definition of effect to apply; see commands.effect_types.buildings_giving_units
--- @p @table persistent_data, Persistent storage container, where the effect stores data needed for clearing it
commands.effect_types.buildings_giving_units.apply_function = function(faction_key, effect, persistent_data)
	local given_units = commands.get_units_given_by_buildings(faction_key, false, effect)
	local custom_unit_id = effect.custom_unit_id or commands.config.default_unit_custom_id_for_buildings_giving_units

	-- Add units to mercenary pool
	for unit_key, unit_params in dpairs(given_units) do
		for i = 1, #unit_params.rank do
			local units_count = unit_params.count[i]
			local rank = unit_params.rank[i]

			local custom_unit = cm:create_custom_unit_from_key(unit_key, false)
			custom_unit:add_custom_id(custom_unit_id)
			custom_unit:add_mercenary_recruit_data(
				units_count, -- count
				0, -- replenish
				units_count, -- max_count
				0, -- max_replenish
				rank, -- experience
				"", "", ""
			)
			cm:add_custom_unit_to_faction_mercenary_pool(faction_key, custom_unit)
			commands.console_output(units_count .. " unit(s) " .. unit_key .. " (rank " .. rank .. ") added to mercenary pool of faction ".. faction_key)
		end
	end

	persistent_data.buildings_giving_units = given_units
	persistent_data.buildings_giving_units_custom_id = custom_unit_id
end

--- @function commands.effect_types.buildings_giving_units.clear_function
--- @desc Removes the units added to the mercenary pool by commands.effect_types.buildings_giving_units.apply_function()
--- @p @string faction_key, Key of faction on which to clear
--- @p @table persistent_data, Persistent storage container, where info for the added units was stored
--- @p @table effect, Definition of effect to clear; see commands.effect_types.buildings_giving_units
commands.effect_types.buildings_giving_units.clear_function = function(faction_key, persistent_data, effect)
	if not persistent_data or not persistent_data.buildings_giving_units or
		(effect.remove_given_units_on_clear ~= nil and not effect.remove_given_units_on_clear)
	then
		return
	end

	local faction = cm:get_faction(faction_key)
	local custom_unit_id = persistent_data.buildings_giving_units_custom_id or commands.config.default_unit_custom_id_for_buildings_giving_units

	for unit_key, unit_params in pairs(persistent_data.buildings_giving_units) do
		for _, rank in dpairs(unit_params.rank) do
			cm:remove_unit_from_faction_mercenary_pool(faction, unit_key, custom_unit_id)
			commands.console_output("Unit " .. unit_key .. " removed from mercenary pool of faction ".. faction_key)
		end
	end
end

--- @function commands.effect_types.buildings_giving_units.update_tooltip
--- @desc Updates the units list in the HUD button's tooltip
--- @p @table effect, Definition of effect; see commands.effect_types.buildings_giving_units
--- @p @string container_id, Id of container where the units template (the units list) is situated
commands.effect_types.buildings_giving_units.update_tooltip = function(effect, container_id)
	local local_faction_key = commands.get_local_faction_key()
	local units_list = commands.get_units_given_by_buildings(local_faction_key, effect.shuffle_units, effect)
	commands.set_tooltip_units(units_list, container_id, commands.config.component_ids.tooltip_units_template)
end

--- @function commands.effect_types.foreign_presence_giving_units.apply_function
--- @desc Applies adding of units to mercenary pool according to existing buildings
--- @p @string faction_key, Key of faction on which to apply the effects
--- @p @table effect, Definition of effect to apply; see commands.effect_types.foreign_presence_giving_units
--- @p @table persistent_data, Persistent storage container, where the effect stores data needed for clearing it
commands.effect_types.foreign_presence_giving_units.apply_function = function(faction_key, effect, persistent_data)
	local given_units = commands.get_units_given_by_foreign_presence(faction_key, effect.units_count_per_fp or 1, effect.min_tier or 0)
	local custom_unit_id = effect.custom_unit_id or commands.config.default_unit_custom_id_for_foreign_presence_giving_units

	-- Add units to mercenary pool
	for _, unit_key in dpairs(given_units) do
		local custom_unit = cm:create_custom_unit_from_key(unit_key, false)
		custom_unit:add_custom_id(custom_unit_id)
		custom_unit:add_mercenary_recruit_data(
			1, -- count
			0, -- replenish
			1, -- max_count
			0, -- max_replenish
			0, -- experience
			"", "", ""
		)

		-- Free recruitment
		custom_unit:add_custom_recruitment_cost(cm:create_new_custom_resource_cost())

		-- Custom upkeep
		if effect.upkeep_cost_record_key and string.len(effect.upkeep_cost_record_key) > 0 then
			local upkeep = cm:create_new_custom_resource_cost()
			upkeep:get_cost_from_record(effect.upkeep_cost_record_key)
			custom_unit:add_custom_upkeep_cost(upkeep)
		end

		cm:add_custom_unit_to_faction_mercenary_pool(faction_key, custom_unit)
		commands.console_output(unit_key .. " added to mercenary pool of faction ".. faction_key)
	end

	persistent_data.foreign_presence_giving_units = given_units
	persistent_data.foreign_presence_giving_units_custom_id = custom_unit_id
end

--- @function commands.effect_types.foreign_presence_giving_units.clear_function
--- @desc Removes the units added to the mercenary pool by commands.effect_types.foreign_presence_giving_units.apply_function()
--- @p @string faction_key, Key of faction on which to clear
--- @p @table persistent_data, Persistent storage container, where info for the added units was stored
commands.effect_types.foreign_presence_giving_units.clear_function = function(faction_key, persistent_data)
	if not persistent_data or not persistent_data.foreign_presence_giving_units then
		return
	end

	local faction = cm:get_faction(faction_key)
	local custom_unit_id = persistent_data.foreign_presence_giving_units_custom_id or commands.config.default_unit_custom_id_for_foreign_presence_giving_units

	for _, unit_key in ipairs(persistent_data.foreign_presence_giving_units) do
		cm:remove_unit_from_faction_mercenary_pool(faction, unit_key, custom_unit_id)
		commands.console_output("All units " .. unit_key .. " removed from mercenary pool of faction ".. faction_key)
	end
end

--- @function commands.effect_types.foreign_presence_giving_units.update_tooltip
--- @desc Shows and updates the Additional Info section in the HUD button's tooltip with info on Foreign Presence
--- @p @table effect, Definition of effect; see commands.effect_types.foreign_presence_giving_units
commands.effect_types.foreign_presence_giving_units.update_tooltip = function(effect)
	commands.set_tooltip_foreign_presence()
end

--- @function commands.effect_types.foreign_presence_giving_units.show_foreign_presence
--- @desc Returns true as this effect type is related to Foreign Presence
--- @p @table effect, Definition of effect; see commands.effect_types.foreign_presence_giving_units
commands.effect_types.foreign_presence_giving_units.show_foreign_presence = function(effect)
	return true
end

--- @function commands.effect_types.gain_resources_leader_province_production.apply_function
--- @desc Gives resources equal to the current production of faction leader's local province
--- @p @string faction_key, Key of faction on which to apply the effect
--- @p @table effect, Definition of effect to apply; see commands.effect_types.gain_resources_leader_province_production
commands.effect_types.gain_resources_leader_province_production.apply_function = function(faction_key, effect)
	local province_production = commands.get_leader_province_production(faction_key)
	for resource_key, income_resource in dpairs(province_production) do
		cm:faction_add_pooled_resource(faction_key, resource_key, effect.factor, income_resource)
		commands.console_output(income_resource .. " " .. resource_key .. " given to " .. faction_key)
	end
end

--- @function commands.effect_types.gain_resources_leader_province_production.update_tooltip
--- @desc Updates the gained resources in the HUD button's tooltip
--- @p @table effect, Definition of effect; see commands.effect_types.gain_resources_leader_province_production
--- @p @string container_id, Id of container where the resources template is situated
commands.effect_types.gain_resources_leader_province_production.update_tooltip = function(effect, container_id)
	local local_faction_key = commands.get_local_faction_key()
	local province_production = commands.get_leader_province_production(local_faction_key)
	commands.set_tooltip_resources(province_production, commands.config.resource_icons,
		container_id, commands.config.component_ids.tooltip_resources_template, true, 0)
end


--- @function commands.effect_types.gain_free_instant_construction.calculate_amount
--- @desc Helper function that calculates amount of free uses given by command used by .apply_function() and .replace_values_in_text()
commands.effect_types.gain_free_instant_construction.calculate_amount = function(faction_key, effect)
	local faction = cm:get_faction(faction_key)
	local num_regions = faction:num_regions()
	return effect.amount_without_regions + math.floor(effect.amount_per_region * num_regions)
end

--- @function commands.effect_types.gain_free_instant_construction.apply_function
--- @desc Gain free uses of Instant Construction according to the number of owned regions
--- @p @string faction_key, Key of faction on which to apply the effect
--- @p @table effect, Definition of effect to apply; see commands.effect_types.gain_free_instant_construction
commands.effect_types.gain_free_instant_construction.apply_function = function(faction_key, effect)
	local faction = cm:get_faction(faction_key)
	local num_regions = faction:num_regions()
	local current_free_instant_constructions = faction:free_instant_constructions()
	local amount = commands.effect_types.gain_free_instant_construction.calculate_amount(faction_key, effect)

	cm:faction_set_free_instant_constructions(faction_key, current_free_instant_constructions + amount)
	commands.console_output(amount .. " x Instant Construction given to " .. faction_key .. " with " .. num_regions .. " regions")
end

--- @function commands.effect_types.gain_free_instant_construction.replace_values_in_text
--- @desc Returns the suppled text with all instances of "{BUILDERS}" in it replaced with the number of free uses of Instant Construction that this command gives
--- @p @string text, Text in which to replace
--- @p @string faction_key, Key of faction for which to calculate
--- @p @table effect, Definition of effect to calculate; see commands.effect_types.gain_free_instant_construction
commands.effect_types.gain_free_instant_construction.replace_values_in_text = function(text, faction_key, effect)
	local amount = commands.effect_types.gain_free_instant_construction.calculate_amount(faction_key, effect)
	return text:gsub("{BUILDERS}", amount)
end

--- @function commands.effect_types.add_ancillary.apply_function
--- @desc Add ancillary to the supplied faction at a cost which can increase with usage
--- @p @string faction_key, Key of faction on which to apply the effect
--- @p @table effect, Definition of effect to apply; see commands.effect_types.add_ancillary
commands.effect_types.add_ancillary.apply_function = function(faction_key, effect)
	if effect.ancillary_key == "" then
		return
	end

	local game_persistent = commands.get_game_persistent_data(faction_key, "added_ancillaries", effect.ancillary_key)
	local usage_count = game_persistent.count or 0

	local ancillary_cost = commands.get_ancillary_cost(faction_key, effect)
	if not commands.faction_can_afford_cost(faction_key, ancillary_cost) then
		commands.console_output("not adding ancillary " .. effect.ancillary_key .. " to " .. faction_key .. " - not enough resources")
		return
	end

	for resource_key, amount in pairs(ancillary_cost) do
		local resource_cost = (effect.initial_cost[resource_key] or 0) + usage_count * (effect.cost_increment[resource_key] or 0)
		cm:faction_add_pooled_resource(faction_key, resource_key, effect.factor, -resource_cost)
		commands.console_output(resource_cost .. " " .. resource_key .. " taken from " .. faction_key)
	end

	game_persistent.count = usage_count + 1

	cm:add_ancillary_to_faction(faction_key, effect.ancillary_key, effect.display_event)
	commands.console_output("ancillary " .. effect.ancillary_key .. " added to " .. faction_key .. " (command used " .. game_persistent.count .. " times)")
end

--- @function commands.effect_types.add_ancillary.update_tooltip
--- @desc Updates the ancillary cost in the HUD button's tooltip
--- @p @table effect, Definition of effect; see commands.effect_types.add_ancillary
--- @p @string container_id, Id of container where the cost template is situated
commands.effect_types.add_ancillary.update_tooltip = function(effect, container_id)
	local local_faction_key = commands.get_local_faction_key()
	local ancillary_cost = commands.get_ancillary_cost(local_faction_key, effect)
	commands.set_tooltip_resources(ancillary_cost, commands.config.cost_icons,
		container_id, commands.config.component_ids.tooltip_cost_template, false, 1)
end

--- @function commands.effect_types.add_random_ancillary.apply_function
--- @desc Add random ancillary to faction depending on faction leader's rank
--- @p @string faction_key, Key of faction on which to apply the effect
--- @p @table effect, Definition of effect to apply; see commands.effect_types.add_random_ancillary
commands.effect_types.add_random_ancillary.apply_function = function(faction_key, effect)
	local faction = cm:get_faction(faction_key)
	local faction_leader = (faction and not faction:is_null_interface()) and faction:faction_leader() or nil
	if not faction_leader or faction_leader:is_null_interface() then
		return
	end
	local leader_region = faction_leader:region()
	if not leader_region or leader_region:is_null_interface() then
		return
	end

	local add_ancillary_from_list = function(ancillary_keys_list, check_if_already_added)
		if not ancillary_keys_list or #ancillary_keys_list == 0 then
			return ""
		end

		local filtered_list = check_if_already_added and {} or ancillary_keys_list
		if check_if_already_added then
			for _, ancillary_key in ipairs(ancillary_keys_list) do
				if not faction:ancillary_exists(ancillary_key) then
					table.insert(filtered_list, ancillary_key)
				end
			end
		end

		if #filtered_list == 0 then
			return ""
		else
			local ancillary_key = filtered_list[cm:model():random_int(1, #filtered_list)]

			cm:add_ancillary_to_faction(faction_key, ancillary_key, effect.display_event)
			commands.console_output("ancillary " .. ancillary_key .. " added to " .. faction_key)

			return ancillary_key
		end
	end

	local realm_key = phar_realms.get_realm_for_region(leader_region:name())
	local rank = faction_leader:rank()
	local add_realm_unique = effect.realm_unique_min_rank and rank >= effect.realm_unique_min_rank
	local add_rare = not add_realm_unique and effect.rare_min_rank and rank >= effect.rare_min_rank
	local add_common = not add_realm_unique and not add_rare and effect.common_min_rank and rank >= effect.common_min_rank

	if add_realm_unique and realm_key then
		local added_ancillary_key = add_ancillary_from_list(get_all_unique_ancillaries_of_realm(realm_key), true)

		if effect.add_rare_when_realm_unique_already_given and added_ancillary_key == "" then
			add_realm_unique = false
			add_rare = true
		end
	end

	if add_rare and realm_key then
		add_ancillary_from_list(get_all_rare_ancillaries_of_realm(realm_key), false)
	end

	if add_common then
		add_ancillary_from_list(phar_common_ancillaries, false)
	end
end

--- @function commands.effect_types.add_native_realm_units.apply_function
--- @desc Add realm Native units to a character depending on in which realm the character currently is,
--- @desc and with tier depending on the character's rank
--- @p @string faction_key, Key of faction on which to apply the effect
--- @p @table effect, Definition of effect to apply; see commands.effect_types.add_native_realm_units
--- @p @table command_optional_data, a table containing data usually needed by different effect type implementations (such as charater on which the effect should be applied)
commands.effect_types.add_native_realm_units.apply_function = function(faction_key, effect, persistent_data, command_optional_data)
	local faction = cm:get_faction(faction_key)
	local character = nil
	if effect.target == "selected_character" then
		if not is_table(command_optional_data) then
			commands.debug_error("Effect type add_native_realm_units received no optional command data")
			return
		end

		local char_cqi = command_optional_data.character_cqi
		if char_cqi then
			character = cm:get_character_by_cqi(char_cqi);
		end
	else
		character = faction:faction_leader()
	end

	local force = (character and not character:is_null_interface() and character:has_military_force()) and character:military_force() or nil
	if not force or character:faction():name() ~= faction_key or
		force:unit_count() + force:pending_recruitment_count() >= force:unit_count_limit()
	then
		return
	end

	local region = character:region()
	if not region or region:is_null_interface() then
		return
	end

	local required_tiers = {}
	if effect.tier then
		table.insert(required_tiers, effect.tier)
	end
	if effect.tier_by_target_rank then
		-- Get tier of units according to character's rank
		for _, tier_def in dpairs(effect.tier_by_target_rank) do
			if tier_def.min_rank <= character:rank() and (not tier_def.max_rank or tier_def.max_rank >= character:rank()) then
				table.insert(required_tiers, tier_def.tier)
			end
		end
	end

	local realm_key = phar_realms.get_realm_for_region(region:name())
	local realm = phar_realms.get_realm(realm_key)
	local native_unit_keys = realm.native_units_set_key and
		cm:model():get_unit_keys_in_unit_set(realm.native_units_set_key) or {}

	native_unit_keys = cm:model():filter_units_by_tier(native_unit_keys, required_tiers)

	if #native_unit_keys > 0 then
		local unit_key = native_unit_keys[cm:model():random_int(1, #native_unit_keys)]
		local character_lookup = cm:char_lookup_str(character)

		cm:grant_unit_to_character(character_lookup, false, unit_key, effect.amount)
		commands.console_output("Unit " .. unit_key .. " is granted to character " .. character:onscreen_name())
	end
end

--- @function commands.effect_types.pillars_of_civilization_entry.apply_function
--- @desc Add Pillars of Civilization points as a separate entry in its points sources list
--- @p @string faction_key, Key of faction on which to apply the effect
--- @p @table effect, Definition of effect to apply; see commands.effect_types.pillars_of_civilization_entry
--- @p @table persistent_data, Persistent storage container, where the effect stores data needed for clearing it
commands.effect_types.pillars_of_civilization_entry.apply_function = function(faction_key, effect, persistent_data)
	if effect.points == 0 then
		return
	end

	pillars_civilization.set_commands_meter(effect.text_id, effect.points)
	commands.console_output("PoC entry " .. effect.text_id .. " (" .. effect.points .. " points) added")

	persistent_data.pillars_of_civilization_entry = effect
end

--- @function commands.effect_types.pillars_of_civilization_entry.clear_function
--- @desc Removes the PoC points added by commands.effect_types.pillars_of_civilization_entry.apply_function()
--- @p @string faction_key, Key of faction on which to clear
--- @p @table persistent_data, Persistent storage container, where info for the added PoC points was stored
commands.effect_types.pillars_of_civilization_entry.clear_function = function(faction_key, persistent_data)
	if not persistent_data or not persistent_data.pillars_of_civilization_entry then
		return
	end

	local effect = persistent_data.pillars_of_civilization_entry

	pillars_civilization.set_commands_meter(effect.text_id, 0)
	commands.console_output("PoC entry " .. effect.text_id .. " (" .. effect.points .. " points) cleared")
end

--- @function commands.effect_types.pillars_of_civilization_level_bundles.apply_function
--- @desc Set effect bundles that override the default PoC level bundles for own faction
--- @p @string faction_key, Key of faction on which to apply the effect
--- @p @table effect, Definition of effect to apply; see commands.effect_types.pillars_of_civilization_level_bundles
--- @p @table persistent_data, Persistent storage container, where the effect stores data needed for clearing it
commands.effect_types.pillars_of_civilization_level_bundles.apply_function = function(faction_key, effect, persistent_data)
	local effect_bundle_duration = commands.get_duration_in_turns(faction_key, effect)
	pillars_civilization.override_level_effect_bundles(faction_key, effect, effect_bundle_duration)
	commands.console_output("PoC level bundles set for " .. faction_key)

	persistent_data.pillars_of_civilization_level_bundles = effect
end

--- @function commands.effect_types.pillars_of_civilization_level_bundles.clear_function
--- @desc Removes the overrriding PoC level bundles set by commands.effect_types.pillars_of_civilization_level_bundles.apply_function()
--- @p @string faction_key, Key of faction on which to clear
--- @p @table persistent_data, Persistent storage container, where info for the set PoC level was stored
commands.effect_types.pillars_of_civilization_level_bundles.clear_function = function(faction_key, persistent_data)
	if not persistent_data or not persistent_data.pillars_of_civilization_level_bundles then
		return
	end

	pillars_civilization.override_level_effect_bundles(faction_key, {}, -1)
	commands.console_output("PoC level bundles cleared for " .. faction_key)
end

--- @function commands.effect_types.instantly_complete_ongoing_research.apply_function
--- @desc Instantly completes the current Royal Decree
--- @p @string faction_key, Key of faction on which to apply the effect
--- @p @table effect, Definition of effect to apply; see commands.effect_types.instantly_complete_ongoing_research
commands.effect_types.instantly_complete_ongoing_research.apply_function = function(faction_key, effect)
	local only_first_one = effect.complete_only_first_one or false
	cm:instantly_complete_ongoing_research_for_faction(faction_key, only_first_one)

	commands.console_output("instantly completed ongoing research for " .. faction_key)
end

--- @function commands.effect_types.disallow_faction_occupation_decision.apply_function
--- @desc Disallows the faction's armies from performing a specific occupation decision
--- @p @string faction_key, Key of faction on which to apply the effect
--- @p @table effect, Definition of effect to apply; see commands.effect_types.disallow_faction_occupation_decision
--- @p @table persistent_data, Persistent storage container, where the effect stores data needed for clearing it
commands.effect_types.disallow_faction_occupation_decision.apply_function = function(faction_key, effect, persistent_data)
	local faction = cm:get_faction(faction_key)
	cm:disallow_faction_occupation_decision(faction, effect.occupation_decision)

	persistent_data.disallow_faction_occupation_decision_applied = true

	commands.console_output("disallow_faction_occupation_decision(" .. effect.occupation_decision ..") for " .. faction_key)
end

--- @function commands.effect_types.disallow_faction_occupation_decision.clear_function
--- @desc Removes all occupation decision restrictions set by commands.effect_types.disallow_faction_occupation_decision.apply_function()
--- @p @string faction_key, Key of faction on which to clear
--- @p @table persistent_data, Persistent storage container, where a flag that the effect is applied was stored
commands.effect_types.disallow_faction_occupation_decision.clear_function = function(faction_key, persistent_data)
	if not persistent_data or not persistent_data.disallow_faction_occupation_decision_applied then
		return
	end

	local faction = cm:get_faction(faction_key)
	cm:remove_forced_occupation_decision_restrictions_for_faction(faction)

	commands.console_output("remove_forced_occupation_decision_restrictions for " .. faction_key)
end

--- @function commands.effect_types.extra_levels_to_war_spoils.apply_function
--- @desc Increases/decreases war spoils level of faction
--- @p @string faction_key, Key of faction on which to apply the effect
--- @p @table effect, Definition of effect to apply; see commands.effect_types.extra_levels_to_war_spoils
--- @p @table persistent_data, Persistent storage container, where the effect stores data needed for clearing it
commands.effect_types.extra_levels_to_war_spoils.apply_function = function(faction_key, effect, persistent_data)
	local duration = commands.get_duration_in_turns(faction_key, effect)
	local last_turn = (duration > 0 and cm:turn_number() + duration - 1) or -1

	war_spoils.set_extra_levels_from_commands(faction_key, effect.levels, last_turn, effect.increase_max_level)

	persistent_data.extra_levels_to_war_spoils_last_turn = last_turn

	commands.console_output("extra_levels_to_war_spoils for " .. faction_key)
end

--- @function commands.effect_types.extra_levels_to_war_spoils.clear_function
--- @desc Removes the extra war spoils levels set by commands.effect_types.extra_levels_to_war_spoils.apply_function()
--- @p @string faction_key, Key of faction on which to clear
--- @p @table persistent_data, Persistent storage container, where info for the extra war spoils levels was stored
commands.effect_types.extra_levels_to_war_spoils.clear_function = function(faction_key, persistent_data)
	if not persistent_data or not persistent_data.extra_levels_to_war_spoils_last_turn then
		return
	end

	-- Clear effect only if its last_turn is set to -1 (i.e. effect is of infinite duration)
	if persistent_data.extra_levels_to_war_spoils_last_turn == -1 then
		war_spoils.set_extra_levels_from_commands(faction_key, 0, 0, false)
	end
	commands.console_output("extra_levels_to_war_spoils cleared for " .. faction_key)
end

--- @function commands.effect_types.set_shared_state.apply_function
--- @desc Sets a shared state (with key and value) for the faction
--- @p @string faction_key, Key of faction on which to apply the effect
--- @p @table effect, Definition of effect to apply; see commands.effect_types.set_shared_state
commands.effect_types.set_shared_state.apply_function = function(faction_key, effect)
	local faction = cm:get_faction(faction_key)
	cm:set_script_state(faction, effect.state_key, effect.value)

	commands.console_output("set_shared_state " .. effect.state_key .. "=" .. tostring(effect.value) .." for " .. faction_key)
end

--- @function commands.effect_types.add_military_training_points.apply_function
--- @desc Adds Military Training points to the faction according to how many wars the faction is currently in
--- @p @string faction_key, Key of faction on which to apply the effect
--- @p @table effect, Definition of effect to apply; see commands.effect_types.add_military_training_points
commands.effect_types.add_military_training_points.apply_function = function(faction_key, effect)
	local faction = cm:get_faction(faction_key)
	local points_multiplier = effect.points_multiplier or 1
	local war_factions_list = faction:factions_at_war_with()

	local points_to_add = war_factions_list:num_items() * points_multiplier
	commands.add_military_training_points(faction_key, points_to_add)

	commands.console_output("add_military_training_points added " .. points_to_add .. " points to " .. faction_key)
end

--- @function commands.effect_types.spend_military_training_points.apply_function
--- @desc Spends the Military Training points of the faction
--- @p @string faction_key, Key of faction on which to apply the effect
--- @p @table effect, Definition of effect to apply; see commands.effect_types.spend_military_training_points
--- @p @table command_optional_data, a table containing data usually needed by different effect type implementations (such as charater on which the effect should be applied)
commands.effect_types.spend_military_training_points.apply_function = function(faction_key, effect, persistent_data, command_optional_data)
	local starting_points = commands.get_military_training_points(faction_key)
	local remaining_points = starting_points

	if effect.spend_on == "selected_character_units_ranks" then

		if not is_table(command_optional_data) then
			commands.debug_error("Effect spend_military_training_points received no optional command data")
			return
		end

		-- Get the list of units in the selected character's army
		local char_cqi = command_optional_data.character_cqi
		local character = char_cqi and cm:get_character_by_cqi(char_cqi) or nil;
		local military_force = character and character:military_force() or nil
		if military_force and not military_force:is_null_interface() then
			local unit_list = military_force:unit_list()

			-- Sort units by tier and rank
			local sorted_units_list = {}
			for unit_i = 0, unit_list:num_items() - 1 do
				if unit_list:item_at(unit_i):has_unit_commander() then
					-- Do nothing
				else
					table.insert(sorted_units_list, unit_list:item_at(unit_i))
				end
			end
			
			sorted_units_list = table_stable_sort(sorted_units_list, function(a, b)
				if a:tier() ~= b:tier() then
					return a:tier() < b:tier()
				else
					return a:experience_level() < b:experience_level()
				end
			end)

			local points_spent = true
			while remaining_points > 0 and points_spent do
				points_spent = false
				for _, unit in dpairs(sorted_units_list) do
					local target_rank = unit:experience_level() + 1
					local required_points = unit:tier()
					if effect.multiply_spent_points_by_unit_rank then
						required_points = required_points * target_rank
					end

					if required_points <= remaining_points and target_rank <= unit:maximum_experience_level() then
						cm:add_experience_to_unit(unit:command_queue_index(), 1)

						points_spent = true
						remaining_points = remaining_points - required_points
					end
				end
			end

			if effect.remove_unspent_points then
				remaining_points = 0
			end
		end

		if remaining_points ~= starting_points then
			commands.add_military_training_points(faction_key, remaining_points - starting_points)
		end
	else
		commands.debug_error("Effect spend_military_training_points has invalid property value for 'spend_on': " .. effect.spend_on)
		return
	end

	commands.console_output("spend_military_training_points on '" .. effect.spend_on .. "' spent " .. (starting_points - remaining_points) .. " points of " .. faction_key)
end


------------------ ADD EVENT LISTENERS ------------------
cm:add_saving_game_callback(function(context) commands.on_saving_game(context) end)
cm:add_loading_game_callback(function(context) commands.on_loading_game(context) end)

commands.add_listener(
	"commands_FirstTickAfterWorldCreated",
	"FirstTickAfterWorldCreated",
	true,
	function(context)
		commands.init()
		commands.update()
	end,
	false
)

commands.add_listener(
	"commands_UIReloaded",
	"UIReloaded",
	true,
	function(context)
		commands.init()
		commands.update()
	end,
	true
)

commands.add_listener(
	"commands_FactionTurnStart",
	"FactionTurnStart",
	true,
	function(context)
		commands.on_faction_turn_start()
	end,
	true
)

commands.add_listener(
	"commands_ContextTriggerEvent",
	"ContextTriggerEvent",
	function(context)
		return context.string == "CommandsButton"
	end,
	function(context)
		commands.on_button_click()
	end,
	true
)

commands.add_listener(
	"commands_ComponentOnTooltipShow",
	"ComponentOnTooltipShow",
	function(context) return commands.hud_button and UIComponent(context.component):Id() == commands.hud_button:Id() end,
	function(context)
		commands.hud_button_tooltip = UIComponent(context:tooltip_object())
		commands.update_hud_button_tooltip()
	end,
	true
)

commands.add_listener(
	"commands_CharacterCreated",
	"CharacterCreated",
	true,
	function(context)
		commands.on_character_created(context:character())
	end,
	true, true
)

commands.add_listener (
	"commands_UITriggerScriptEvent",
	"UITriggerScriptEvent",
	function(context)
		return context:trigger():split(":")[1] == commands.config.script_events.prefix
	end,
	function(context)
		local event_faction = cm:model():faction_for_command_queue_index(context:faction_cqi())
		local event_faction_key = event_faction:name()
		local params = context:trigger():split(":")
		local event = params[2]

		if event == commands.config.script_events.use_activated then
			local command_optional_data = {}
			if #params > 2 then
				if params[3] == "character_cqi" then
					command_optional_data.character_cqi = tonumber(params[4])
				end
			end

			commands.clear_passive(event_faction_key)
			commands.apply_activated(event_faction_key, command_optional_data)
			commands.update()
		end
	end,
	true
)

commands.add_optional_listeners = function()
	-- Listeners for events that require immediate updating of the HUD button
	local events_for_which_to_update_button = commands.get_events_for_which_to_update_button()

	commands.add_optional_listener(events_for_which_to_update_button,
		"commands_CharacterFinishedMovingEvent",
		"CharacterFinishedMovingEvent",
		function(context) return context:character():faction():name() == commands.get_local_faction_key() and context:character():is_faction_leader() end,
		function(context)
			commands.update()
		end,
		true, true
	)

	commands.add_optional_listener(events_for_which_to_update_button,
		"commands_CharacterSelected",
		"CharacterSelected",
		true,
		function(context)
			commands.update()
		end,
		true, true
	)

	commands.add_optional_listener(events_for_which_to_update_button,
		"commands_CharacterDeselected",
		"CharacterDeselected",
		true,
		function(context)
			commands.update()
		end,
		true, true
	)

	commands.add_optional_listener(events_for_which_to_update_button,
		"commands_PooledResourceTransactionEvent",
		"PooledResourceTransactionEvent",
		function(context) return context:faction():name() == commands.get_local_faction_key() end,
		function(context)
			commands.update()
		end,
		true, true
	)

	commands.add_optional_listener(events_for_which_to_update_button,
		"commands_ResearchStarted",
		"ResearchStarted",
		function(context) return context:faction():name() == commands.get_local_faction_key() end,
		function(context)
			commands.update()
		end,
		true, true
	)

	commands.add_optional_listener(events_for_which_to_update_button,
		"commands_ResearchCompleted",
		"ResearchCompleted",
		function(context) return context:faction():name() == commands.get_local_faction_key() end,
		function(context)
			commands.update()
		end,
		true, true
	)

	commands.add_optional_listener(events_for_which_to_update_button,
		"commands_ResearchCancelled",
		"ResearchCancelled",
		function(context) return context:faction():name() == commands.get_local_faction_key() end,
		function(context)
			commands.update()
		end,
		true, true
	)
end

