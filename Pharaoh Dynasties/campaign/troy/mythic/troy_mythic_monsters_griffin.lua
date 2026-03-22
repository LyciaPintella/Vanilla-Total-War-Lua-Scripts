out("Loading troy_mythic_monsters_griffin.lua")

-- the griffin is still in development and placeholder records are in use, so the logic is disabled for now:
-- if true then
-- 	out("troy_mythic_monsters_griffin.lua - DEACTIVATED")
-- 	return nil
-- end

-- ================================================================================================================================================ 
-- ==================================================================== CONFIG ====================================================================
-- ================================================================================================================================================ 

mythic_monster_griffin_config = {
	id = "MYTHIC_MONSTER_GRIFFIN",
	key = "griffin",
	agent_type = "wizard",
	agent_subtype = "troy_mth_agent_griffin",
	army_stance = "MILITARY_FORCE_ACTIVE_STANCE_TYPE_GRIFFIN_HUNT",
	occupation_option_bundle = "troy_mth_effect_bundle_occupation_option_griffin",
	occupation_option_bundle_duration = 5,
	unit_key = "troy_mth_gen_myth_griffin",
	harmony_resource = "troy_mth_harmony",
	harmony = {
		griffin_side ={
			min = 33,
			max = 100
		},
		harmony_side = {
			min = -32,
			max = 32,
		},
		arimaspoi_side = {
			min = -100,
			max = -33
		},
	},
	harmony_tooltips = {
		default = {
			griffin = {
				side = "griffin",
				component_id = "tooltip_trigger_right",
				effect_bundle = "troy_mth_griffin_effect_bundle_bar_griffin_side",
				info_txt = "campaign_localised_strings_string_troy_mth_griffin_harmony_bar_griffin_side_detail",
				heading = "campaign_localised_strings_string_troy_mth_griffin_harmony_bar_griffin_side_title",
			},
			harmony = {
				side = "harmony",
				component_id = "tooltip_trigger_mid",
				effect_bundle = "troy_mth_griffin_effect_bundle_bar_harmony_side",
				info_txt = "campaign_localised_strings_string_troy_mth_griffin_harmony_bar_harmony_side_detail",
				heading = "campaign_localised_strings_string_troy_mth_griffin_harmony_bar_harmony_side_title",
			},
			arimaspoi = {
				side = "arimaspoi",
				component_id = "tooltip_trigger_left",
				effect_bundle = "troy_mth_griffin_effect_bundle_bar_arimaspoi_side",
				info_txt = "campaign_localised_strings_string_troy_mth_griffin_harmony_bar_arimaspoi_side_detail",
				heading = "campaign_localised_strings_string_troy_mth_griffin_harmony_bar_arimaspoi_side_title",
			},
		},
		-- override details for Penthesilea
		troy_amazons_trj_penthesilea = {
			griffin = {
				side = "griffin",
				component_id = "tooltip_trigger_right",
				effect_bundle = "troy_mth_griffin_effect_bundle_bar_griffin_side_horde",
				info_txt = "campaign_localised_strings_string_troy_mth_griffin_harmony_bar_griffin_side_detail",
				heading = "campaign_localised_strings_string_troy_mth_griffin_harmony_bar_griffin_side_title",
			},
			harmony = {
				side = "harmony",
				component_id = "tooltip_trigger_mid",
				effect_bundle = "troy_mth_griffin_effect_bundle_bar_harmony_side_horde",
				info_txt = "campaign_localised_strings_string_troy_mth_griffin_harmony_bar_harmony_side_detail",
				heading = "campaign_localised_strings_string_troy_mth_griffin_harmony_bar_harmony_side_title",
			},
			arimaspoi = {
				side = "arimaspoi",
				component_id = "tooltip_trigger_left",
				effect_bundle = "troy_mth_griffin_effect_bundle_bar_arimaspoi_side_horde",
				info_txt = "campaign_localised_strings_string_troy_mth_griffin_harmony_bar_arimaspoi_side_detail",
				heading = "campaign_localised_strings_string_troy_mth_griffin_harmony_bar_arimaspoi_side_title",
			},
		},
		troy_rem_horde_aethiopians = {
			griffin = {
				side = "griffin",
				component_id = "tooltip_trigger_right",
				effect_bundle = "troy_mth_griffin_effect_bundle_bar_griffin_side_horde",
				info_txt = "campaign_localised_strings_string_troy_mth_griffin_harmony_bar_griffin_side_detail",
				heading = "campaign_localised_strings_string_troy_mth_griffin_harmony_bar_griffin_side_title",
			},
			harmony = {
				side = "harmony",
				component_id = "tooltip_trigger_mid",
				effect_bundle = "troy_mth_griffin_effect_bundle_bar_harmony_side_horde",
				info_txt = "campaign_localised_strings_string_troy_mth_griffin_harmony_bar_harmony_side_detail",
				heading = "campaign_localised_strings_string_troy_mth_griffin_harmony_bar_harmony_side_title",
			},
			arimaspoi = {
				side = "arimaspoi",
				component_id = "tooltip_trigger_left",
				effect_bundle = "troy_mth_griffin_effect_bundle_bar_arimaspoi_side_horde",
				info_txt = "campaign_localised_strings_string_troy_mth_griffin_harmony_bar_arimaspoi_side_detail",
				heading = "campaign_localised_strings_string_troy_mth_griffin_harmony_bar_arimaspoi_side_title",
			},
		},
	},
	panel_background = "griffin",
	panel_flavour_text = "ui_text_replacements_localised_text_hp_desc_unit_griffin",
	unit_category_icon = "UI/common ui/unit_category_icons/troy_mth_griffin.png",
	monster_button_icon = "UI/skins/default/troy_mth_griffin_button.png",
	agent_resource_cost = "troy_mythic_monster_cost",

	-- config for the dilemma which will spawn from the Griffin agent action and all it's payloads as we have a skill which upgrades the reward.
	agent_action_config = {
		hinder_settlement_action_key = "troy_mth_agent_action_record_griffin_hinder_settlement",
		assist_settlement_action_key = "troy_mth_agent_action_record_griffin_assist_settlement",
		dilemma_bonus_skill_id = "troy_mth_agent_griffin_skill_tier2_griffin_agent_action_upgrade",
		region_griffin_action_disable_bundle = "troy_mth_effect_bundle_disable_griffin_settlement_agent_action_dummy",
		region_griffin_action_disable_icon = {
			icon_id = "sp_strays_searched.png",
			icon_path = "UI/skins/default/sp_strays_searched.png",
			description = "troy_mth_griffin_agent_action_unavailable_description",
		},
		dilemma_setup = {
			[1] = {
				condition = {
					types = {"gold_sea",},
				},
				dilemma_key = "troy_mth_griffin_agent_action_search_for_strays_1",
				options_details = {
					[1] = {
						harmony_amount = 20,
						payloads = {
							[1] = {
								type = "ancillary",
								key = "troy_mth_anc_griffin_egg",
							},
							[2] = {
								type = "effect_bundle",
								key = "troy_mth_griffin_agent_action_bundle_griffin_1_1",
								upgraded_key = "troy_mth_griffin_agent_action_bundle_griffin_1_1_upgraded",
								duration = 10,
							},
						}
					},
					[2] = {
						harmony_amount = -20,
						payloads = {
							[1] = {
								type = "effect_bundle",
								key = "troy_mth_griffin_agent_action_bundle_griffin_1_2",
								upgraded_key = "troy_mth_griffin_agent_action_bundle_griffin_1_2_upgraded",
								duration = 10,
							},
							[2] = {
								type = "pooled_resource",
								resource_key = "troy_gold",
								factor_key = "troy_resource_factor_character",
								amount = 200
							}
						}
					},
					[3] = {
						harmony_amount = 5,
						payloads = {
							[1] = {
								type = "ancillary",
								key = "troy_mth_anc_griffin_egg",
							},
							[2] = {
								type = "pooled_resource",
								resource_key = "troy_gold",
								factor_key = "troy_resource_factor_character",
								amount = 100
							}
						}
					}
				},
			},
			[2] = {
				condition = {
					types = {"gold_sea",},
				},
				dilemma_key = "troy_mth_griffin_agent_action_search_for_strays_2",
				options_details = {
					[1] = {
						harmony_amount = 20,
						payloads = {
							[1] = {
								type = "add_mercenary",
								unit_key = "troy_mth_gen_myth_lesser_griffin",
								amount = 1,
								choice = "FIRST",
								effect_key = "troy_mth_effect_unit_capacity_lesser_griffin",
								lookup_key = "dummy_troy_mth_payload_myth_unit_lesser_griffin"
							},
						}
					},
					[2] = {
						harmony_amount = -20,
						payloads = {
							[1] = {
								type = "effect_bundle",
								key = "troy_mth_griffin_agent_action_bundle_griffin_2_2",
								upgraded_key = "troy_mth_griffin_agent_action_bundle_griffin_2_2_upgraded",
								duration = 5,
							},
							[2] = {
								type = "pooled_resource",
								resource_key = "troy_gold",
								factor_key = "troy_resource_factor_character",
								amount = 300
							}
						}
					},
					[3] = {
						harmony_amount = 5,
						payloads = {
							[1] = {
								type = "add_mercenary",
								unit_key = "troy_mth_gen_myth_harpy",
								amount = 2,
								choice = "THIRD",
								effect_key = "troy_mythic_exclusive_troy_effect_unit_capacity_myth_harpies_tier_1",
								lookup_key = "dummy_troy_mth_payload_myth_unit_harpies"
							},
							[2] = {
								type = "pooled_resource",
								resource_key = "troy_gold",
								factor_key = "troy_resource_factor_character",
								amount = -100
							}
						}
					}
				},
			}, 
			[3] = {
				condition = {
					regions = {"troy_main_ozolian_locris_elateia",}
				},
				dilemma_key = "troy_mth_griffin_agent_action_search_for_strays_3",
				options_details = {
					[1] = {
						harmony_amount = 20,
						payloads = {
							[1] = {
								type = "effect_bundle",
								key = "troy_mth_griffin_agent_action_bundle_griffin_3_1",
								upgraded_key = "troy_mth_griffin_agent_action_bundle_griffin_3_1_upgraded",
								duration = 10,
								horde_override = {
									key = "troy_mth_griffin_agent_action_bundle_griffin_3_1_horde",
									upgraded_key = "troy_mth_griffin_agent_action_bundle_griffin_3_1_upgraded_horde",
								}
							},
						}
					},
					[2] = {
						harmony_amount = -20,
						payloads = {
							[1] = {
								type = "effect_bundle",
								key = "troy_mth_griffin_agent_action_bundle_griffin_3_2",
								upgraded_key = "troy_mth_griffin_agent_action_bundle_griffin_3_2_upgraded",
								duration = 10,
								horde_override = {
									key = "troy_mth_griffin_agent_action_bundle_griffin_3_2_horde",
									upgraded_key = "troy_mth_griffin_agent_action_bundle_griffin_3_2_upgraded_horde",
								}
							},
						}
					},
					[3] = {
						harmony_amount = 5,
						payloads = {
							[1] = {
								type = "effect_bundle",
								key = "troy_mth_griffin_agent_action_bundle_griffin_3_3",
								upgraded_key = "troy_mth_griffin_agent_action_bundle_griffin_3_3",
								duration = 10,
								horde_override = {
									key = "troy_mth_griffin_agent_action_bundle_griffin_3_3_horde",
									upgraded_key = "troy_mth_griffin_agent_action_bundle_griffin_3_3_horde",
								}
							},
						}
					}
				},
			},
			[4] = { 
				condition = {
					regions = {"troy_main_macedonia_arnissa", "troy_main_elis_aliphera"}
				},
				dilemma_key = "troy_mth_griffin_agent_action_search_for_strays_4",
				options_details = {
					[1] = {
						harmony_amount = 20,
						payloads = {
							[1] = {
								type = "add_mercenary",
								unit_key = "troy_mth_gen_myth_lesser_griffin",
								amount = 1,
								choice = "FIRST",
								effect_key = "troy_mth_effect_unit_capacity_lesser_griffin",
								lookup_key = "dummy_troy_mth_payload_myth_unit_lesser_griffin"
							},
							[2] = {
								type = "pooled_resource",
								resource_key = "troy_god_attitude_ares",
								factor_key = "troy_god_attitude_factor_agents",
								amount = 50
							},
						}
					},
					[2] = {
						harmony_amount = -20,
						payloads = {
							[1] = {
								type = "add_mercenary",
								unit_key = "troy_mth_gen_myth_arimaspoi_skirmishers",
								amount = 1,
								choice = "SECOND",
								effect_key = "troy_mth_effect_unit_capacity_griffin_arimaspoi_skirmishers",
								lookup_key = "dummy_troy_mth_payload_myth_unit_arimaspoi_skirmishers"
							},
							[2] = {
								type = "pooled_resource",
								resource_key = "troy_god_attitude_artemis",
								factor_key = "troy_god_attitude_factor_agents",
								amount = 50
							}
						}
					},
					[3] = {
						harmony_amount = 5,
						payloads = {
							[1] = {
								type = "add_mercenary",
								unit_key = "troy_mth_gen_myth_arimaspoi_skirmishers",
								amount = 1,
								choice = "THIRD",
								effect_key = "troy_mth_effect_unit_capacity_griffin_arimaspoi_skirmishers",
								lookup_key = "dummy_troy_mth_payload_myth_unit_arimaspoi_skirmishers"
							},
							[2] = {
								type = "add_mercenary",
								unit_key = "troy_mth_gen_myth_lesser_griffin",
								amount = 1,
								choice = "THIRD",
								effect_key = "troy_mth_effect_unit_capacity_lesser_griffin",
								lookup_key = "dummy_troy_mth_payload_myth_unit_lesser_griffin"
							},
						}
					}
				},
			},
			[5] = {
				condition = {
					regions = {"troy_main_ophioussa_volissos",}
				},
				dilemma_key = "troy_mth_griffin_agent_action_search_for_strays_5",
				options_details = {
					[1] = {
						harmony_amount = 20,
						payloads = {
							[1] = {
								type = "add_mercenary",
								unit_key = "troy_mth_gen_myth_lesser_griffin",
								amount = 1,
								choice = "FIRST",
								effect_key = "troy_mth_effect_unit_capacity_lesser_griffin",
								lookup_key = "dummy_troy_mth_payload_myth_unit_lesser_griffin"
							},
						}
					},
					[2] = {
						harmony_amount = -20,
						payloads = {
							[1] = {
								type = "pooled_resource",
								resource_key = "troy_gold",
								factor_key = "troy_resource_factor_character",
								amount = 200
							},
							[2] = {
								type = "effect_bundle",
								key = "troy_mth_griffin_agent_action_bundle_griffin_5_2",
								upgraded_key = "troy_mth_griffin_agent_action_bundle_griffin_5_2_upgraded",
								duration = 10,
							},
						}
					},
					[3] = {
						harmony_amount = 5,
						payloads = {
							[1] = {
								type = "add_mercenary",
								unit_key = "troy_mth_gen_myth_lesser_griffin",
								amount = 1,
								choice = "THIRD",
								effect_key = "troy_mth_effect_unit_capacity_lesser_griffin",
								lookup_key = "dummy_troy_mth_payload_myth_unit_lesser_griffin"
							},
							[1] = {
								type = "add_mercenary",
								unit_key = "troy_mth_gen_myth_sirens",
								amount = 1,
								choice = "THIRD",
								effect_key = "troy_mythic_exclusive_troy_effect_unit_capacity_myth_sirens_tier_1",
								lookup_key = "dummy_troy_mth_payload_myth_unit_sirens"
							},
							[2] = {
								type = "effect_bundle",
								key = "troy_mth_griffin_agent_action_bundle_griffin_5_3",
								upgraded_key = "troy_mth_griffin_agent_action_bundle_griffin_5_3",
								duration = 10,
							},
						}
					}
				},
			},
			[6] = {
				condition = {
					regions = {"troy_main_bottiaea_kalindoia",}
				},
				dilemma_key = "troy_mth_griffin_agent_action_search_for_strays_6",
				options_details = {
					[1] = {
						harmony_amount = 20,
						payloads = {
							[1] = {
								type = "effect_bundle",
								key = "troy_mth_griffin_agent_action_bundle_griffin_6_1",
								upgraded_key = "troy_mth_griffin_agent_action_bundle_griffin_6_1_upgraded",
								duration = 10,
							},
						}
					},
					[2] = {
						harmony_amount = -20,
						payloads = {
							[1] = {
								type = "effect_bundle",
								key = "troy_mth_griffin_agent_action_bundle_griffin_6_2",
								upgraded_key = "troy_mth_griffin_agent_action_bundle_griffin_6_2_upgraded",
								duration = 10,
							},
						}
					},
					[3] = {
						harmony_amount = 5,
						payloads = {
							[1] = {
								type = "add_mercenary",
								unit_key = "troy_mth_gen_myth_arimaspoi_skirmishers",
								amount = 1,
								choice = "THIRD",
								effect_key = "troy_mth_effect_unit_capacity_griffin_arimaspoi_skirmishers",
								lookup_key = "dummy_troy_mth_payload_myth_unit_arimaspoi_skirmishers"
							},
							[2] = {
								type = "add_mercenary",
								unit_key = "troy_mth_gen_myth_lesser_griffin",
								amount = 1,
								choice = "THIRD",
								effect_key = "troy_mth_effect_unit_capacity_lesser_griffin",
								lookup_key = "dummy_troy_mth_payload_myth_unit_lesser_griffin"
							},
						}
					}
				},
			},
			[7] = {
				condition = {
					regions = {"troy_main_madares_lappa"}
				},
				dilemma_key = "troy_mth_griffin_agent_action_search_for_strays_7",
				options_details = {
					[1] = {
						harmony_amount = 20,
						payloads = {
							[1] = {
								type = "effect_bundle",
								key = "troy_mth_griffin_agent_action_bundle_griffin_7_1",
								upgraded_key = "troy_mth_griffin_agent_action_bundle_griffin_7_1_upgraded",
								duration = 10,
							},
							[2] = {
								type = "ancillary",
								key = "troy_mth_anc_griffin_egg",
							},
						}
					},
					[2] = {
						harmony_amount = -20,
						payloads = {
							[1] = {
								type = "effect_bundle",
								key = "troy_mth_griffin_agent_action_bundle_griffin_7_2",
								upgraded_key = "troy_mth_griffin_agent_action_bundle_griffin_7_2_upgraded",
								duration = 10,
							},
							[2] = {
								type = "pooled_resource",
								resource_key = "troy_gold",
								factor_key = "troy_resource_factor_character",
								amount = 300
							}
						}
					},
					[3] = {
						harmony_amount = 5,
						payloads = {
							[1] = {
								type = "ancillary",
								key = "troy_mth_anc_griffin_egg",
							},
							[2] = {
								type = "pooled_resource",
								resource_key = "troy_gold",
								factor_key = "troy_resource_factor_character",
								amount = 200
							}
						}
					}
				},
			},
			[8] = {
				condition = {
					regions = {"troy_main_elis_aliphera", "troy_main_krapathos_pylaea"}
				},
				dilemma_key = "troy_mth_griffin_agent_action_search_for_strays_8",
				options_details = {
					[1] = {
						harmony_amount = 20,
						payloads = {
							[1] = {
								type = "effect_bundle",
								key = "troy_mth_griffin_agent_action_bundle_griffin_8_1",
								upgraded_key = "troy_mth_griffin_agent_action_bundle_griffin_8_1_upgraded",
								duration = 10,
								horde_override = {
									key = "troy_mth_griffin_agent_action_bundle_griffin_8_1_horde",
									upgraded_key = "troy_mth_griffin_agent_action_bundle_griffin_8_1_upgraded_horde",
								}
							},
							[2] = {
								type = "ancillary",
								key = "troy_mth_anc_griffin_egg",
							},
						}
					},
					[2] = {
						harmony_amount = -20,
						payloads = {
							[1] = {
								type = "effect_bundle",
								key = "troy_mth_griffin_agent_action_bundle_griffin_8_2",
								upgraded_key = "troy_mth_griffin_agent_action_bundle_griffin_8_2_upgraded",
								duration = 10,
								horde_override = {
									key = "troy_mth_griffin_agent_action_bundle_griffin_8_2_horde",
									upgraded_key = "troy_mth_griffin_agent_action_bundle_griffin_8_2_upgraded_horde",
								}
							},
							[2] = {
								type = "pooled_resource",
								resource_key = "troy_gold",
								factor_key = "troy_resource_factor_character",
								amount = 200
							}
						}
					},
					[3] = {
						harmony_amount = 5,
						payloads = {
							[1] = {
								type = "add_mercenary",
								unit_key = "troy_mth_giant_axe_shield",
								amount = 1,
								choice = "THIRD",
								effect_key = "troy_effect_unit_capacity_myth_giants_tier_1",
								lookup_key = "dummy_troy_epic_missions_myth_unit_t2_giant_vanguard"
							},
							[2] = {
								type = "effect_bundle",
								key = "troy_mth_griffin_agent_action_bundle_griffin_8_3",
								upgraded_key = "troy_mth_griffin_agent_action_bundle_griffin_8_3",
								duration = 10,
								horde_override = {
									key = "troy_mth_griffin_agent_action_bundle_griffin_8_3_horde",
									upgraded_key = "troy_mth_griffin_agent_action_bundle_griffin_8_3_horde",
								}
							},
						}
					}
				},
			},
			[9] = {
				condition = {
					regions = {"troy_main_zerynthia_nesoi_thasos", "troy_main_krapathos_pylaea"}
				},
				dilemma_key = "troy_mth_griffin_agent_action_search_for_strays_9",
				options_details = {
					[1] = {
						harmony_amount = 30,
						payloads = {
							[1] = {
								type = "ancillary",
								key = "troy_mth_anc_griffin_egg",
							},
						}
					},
					[2] = {
						harmony_amount = -30,
						payloads = {
							[1] = {
								type = "pooled_resource",
								resource_key = "troy_gold",
								factor_key = "troy_resource_factor_character",
								amount = 100
							},
							[2] = {
								type = "pooled_resource",
								resource_key = "troy_food",
								factor_key = "troy_resource_factor_character",
								amount = 2000
							}
						}
					},
					[3] = {
						harmony_amount = 5,
						payloads = {
							[1] = {
								type = "ancillary",
								key = "troy_mth_anc_griffin_egg",
							},
							[2] = {
								type = "pooled_resource",
								resource_key = "troy_gold",
								factor_key = "troy_resource_factor_character",
								amount = 50
							},
							[3] = {
								type = "pooled_resource",
								resource_key = "troy_food",
								factor_key = "troy_resource_factor_character",
								amount = 1000
							}
						}
					}
				},
			},	
			[10] = {
				condition = {
					regions = {"troy_main_adrastea_skepsis"}
				},
				dilemma_key = "troy_mth_griffin_agent_action_search_for_strays_10",
				options_details = {
					[1] = {
						harmony_amount = 30,
						payloads = {
							[1] = {
								type = "effect_bundle",
								key = "troy_mth_griffin_agent_action_bundle_griffin_10_1",
								upgraded_key = "troy_mth_griffin_agent_action_bundle_griffin_10_1_upgraded",
								duration = 10,
							},
						}
					},
					[2] = {
						harmony_amount = -30,
						payloads = {
							[1] = {
								type = "pooled_resource",
								resource_key = "troy_gold",
								factor_key = "troy_resource_factor_character",
								amount = 400
							},
							[2] = {
								type = "effect_bundle",
								key = "troy_mth_griffin_agent_action_bundle_griffin_10_2",
								upgraded_key = "troy_mth_griffin_agent_action_bundle_griffin_10_2_upgraded",
								duration = 10,
							},
						}
					},
					[3] = {
						harmony_amount = 5,
						payloads = {
							[1] = {
								type = "pooled_resource",
								resource_key = "troy_gold",
								factor_key = "troy_resource_factor_character",
								amount = 200
							},
							[2] = {
								type = "effect_bundle",
								key = "troy_mth_griffin_agent_action_bundle_griffin_10_3",
								upgraded_key = "troy_mth_griffin_agent_action_bundle_griffin_10_3",
								duration = 10,
							},
						}
					}
				},
			},
		},
	},
	battle_skills = {
		[1] = "troy_mth_griffin_grounded",
		[2] = "troy_mth_griffin_gust",
		[3] = "troy_mth_griffin_rallying_screech",
	},
	unlockable_units = {
		{ key = "troy_mth_gen_myth_arimaspoi_hunters", antagonist = { initial_count = 3, replenish_chance_perc = 50, }, },
		{ key = "troy_mth_gen_myth_arimaspoi_skirmishers", antagonist = { initial_count = 1, replenish_chance_perc = 25, }, },
		{ key = "troy_mth_gen_myth_arimaspoi_spearmen", antagonist = { initial_count = 1, replenish_chance_perc = 25, }, },
		{ key = "troy_mth_gen_myth_lesser_griffin", antagonist = { initial_count = 2, replenish_chance_perc = 10, }, },
	},
	unlockable_buildings = {
		default = {
			[1] = {
				building_level_key = "troy_mth_special_griffin_3",
				culture_variant_key = "troy_mth_special_griffin_3",
				building_side = "griffin";
			},
			[2] = {
				building_level_key = "troy_mth_special_griffin_5",
				culture_variant_key = "troy_mth_special_griffin_5",
				building_side = "griffin";
			},
			[3] = {
				building_level_key = "troy_mth_special_griffin_arimaspoi_1",
				culture_variant_key = "troy_mth_special_griffin_arimaspoi_1",
				building_side = "arimaspoi";
			},
			[4] = {
				building_level_key = "troy_mth_special_griffin_arimaspoi_3",
				culture_variant_key = "troy_mth_special_griffin_arimaspoi_3",
				building_side = "arimaspoi";
			},
		},
		-- faction specific
		troy_amazons_trj_penthesilea = {
			[1] = {
				building_level_key = "troy_mth_horde_special_griffin_3",
				culture_variant_key = "troy_mth_horde_special_griffin_3",
				building_side = "griffin";
			},
			[2] = {
				building_level_key = "troy_mth_horde_special_griffin_5",
				culture_variant_key = "troy_mth_horde_special_griffin_5",
				building_side = "griffin";
			},
			[3] = {
				building_level_key = "troy_mth_horde_special_griffin_arimaspoi_1",
				culture_variant_key = "troy_mth_horde_special_griffin_arimaspoi_1",
				building_side = "arimaspoi";
			},
			[4] = {
				building_level_key = "troy_mth_horde_special_griffin_arimaspoi_3",
				culture_variant_key = "troy_mth_horde_special_griffin_arimaspoi_3",
				building_side = "arimaspoi";
			},
		},
		troy_rem_horde_aethiopians = {
			[1] = {
				building_level_key = "troy_mth_horde_special_griffin_3",
				culture_variant_key = "troy_mth_horde_special_griffin_3",
				building_side = "griffin";
			},
			[2] = {
				building_level_key = "troy_mth_horde_special_griffin_5",
				culture_variant_key = "troy_mth_horde_special_griffin_5",
				building_side = "griffin";
			},
			[3] = {
				building_level_key = "troy_mth_horde_special_griffin_arimaspoi_1",
				culture_variant_key = "troy_mth_horde_special_griffin_arimaspoi_1",
				building_side = "arimaspoi";
			},
			[4] = {
				building_level_key = "troy_mth_horde_special_griffin_arimaspoi_3",
				culture_variant_key = "troy_mth_horde_special_griffin_arimaspoi_3",
				building_side = "arimaspoi";
			},
		},
	},
	display_buildings = {
		default = {
			[1] = {
				building_level_key = "troy_mth_special_griffin_arimaspoi_1",
				culture_variant_key = "troy_mth_special_griffin_arimaspoi_1",
				building_side = "arimaspoi";
			},
			[2] = {
				building_level_key = "troy_mth_special_griffin_3",
				culture_variant_key = "troy_mth_special_griffin_3",
				building_side = "griffin";
			},
		},
		-- faction specific
		troy_amazons_trj_penthesilea = {
			[1] = {
				building_level_key = "troy_mth_horde_special_griffin_arimaspoi_1",
				culture_variant_key = "troy_mth_horde_special_griffin_arimaspoi_1",
				building_side = "arimaspoi";
			},
			[2] = {
				building_level_key = "troy_mth_horde_special_griffin_3",
				culture_variant_key = "troy_mth_horde_special_griffin_3",
				building_side = "griffin";
			},
		},
		troy_rem_horde_aethiopians = {
			[1] = {
				building_level_key = "troy_mth_horde_special_griffin_arimaspoi_1",
				culture_variant_key = "troy_mth_horde_special_griffin_arimaspoi_1",
				building_side = "arimaspoi";
			},
			[2] = {
				building_level_key = "troy_mth_horde_special_griffin_3",
				culture_variant_key = "troy_mth_horde_special_griffin_3",
				building_side = "griffin";
			},
		},
	},
	overview_panel = {
		feature_1 = {
			title = "ui_text_replacements_localised_text_troy_mth_monster_selection_griffin_feature_harmony_title",
			infotext = "ui_text_replacements_localised_text_troy_mth_monster_selection_griffin_feature_harmony_long_desc",
		},
		feature_2 = {
			title = "ui_text_replacements_localised_text_troy_mth_monster_selection_griffin_feature_flocks_title",
			infotext = "ui_text_replacements_localised_text_troy_mth_monster_selection_griffin_feature_flocks_long_desc",
		},
		feature_3 = {
			title = "ui_text_replacements_localised_text_troy_mth_monster_selection_griffin_feature_hunt_title",
			infotext = "ui_text_replacements_localised_text_troy_mth_monster_selection_griffin_feature_hunt_long_desc",
		},
	},

	monster_progression = {
		default = {
			[1] = {
				node_id = "node_1",
				rank_req = 2,
				skills = {
					[1] = "troy_mth_agent_griffin_skill_tier1_griffin_ability_upgrade",
					[2] = "troy_mth_agent_griffin_skill_tier1_griffin_harmony_upgrade",
					[3] = "troy_mth_agent_griffin_skill_tier1_griffin_economy_bonus",
				},
			},
			[2] = {
				node_id = "node_2",
				rank_req = 3,
				skills = { 
					[1] = "troy_mth_agent_griffin_skill_tier2_griffin_unit_upgrade",
					[2] = "troy_mth_agent_griffin_skill_tier2_griffin_agent_action_upgrade",
					[3] = "troy_mth_agent_griffin_skill_tier2_griffin_normal_unit_upgrades",
				},
			},
			[3] = {
				node_id = "node_3",
				rank_req = 4,
				skills = { 
					[1] = "troy_mth_agent_griffin_skill_tier3_griffin_attribute_upgrade",
					[2] = "troy_mth_agent_griffin_skill_tier3_griffin_harmony_army_upgrade",
					[3] = "troy_mth_agent_griffin_skill_tier3_griffin_gold_economy",
				},
			},
			[4] = {
				node_id = "node_4",
				rank_req = 5,
				skills = { 
					[1] = "troy_mth_agent_griffin_skill_tier4_army_ability",
					[2] = "troy_mth_agent_griffin_skill_tier4_harmony_units_buff",
					[3] = "troy_mth_agent_griffin_skill_tier4_arimaspoi_attributes",
				},
			},
		},
		-- skill set override for Penthesilea
		troy_amazons_trj_penthesilea = {
			[1] = {
				node_id = "node_1",
				rank_req = 2,
				skills = {
					[1] = "troy_mth_agent_griffin_skill_tier1_griffin_ability_upgrade",
					[2] = "troy_mth_agent_griffin_skill_horde_tier1_griffin_harmony_upgrade",
					[3] = "troy_mth_agent_griffin_skill_horde_tier1_griffin_economy_bonus",
				},
			},
			[2] = {
				node_id = "node_2",
				rank_req = 3,
				skills = { 
					[1] = "troy_mth_agent_griffin_skill_tier2_griffin_unit_upgrade",
					[2] = "troy_mth_agent_griffin_skill_tier2_griffin_agent_action_upgrade",
					[3] = "troy_mth_agent_griffin_skill_tier2_griffin_normal_unit_upgrades",
				},
			},
			[3] = {
				node_id = "node_3",
				rank_req = 4,
				skills = { 
					[1] = "troy_mth_agent_griffin_skill_tier3_griffin_attribute_upgrade",
					[2] = "troy_mth_agent_griffin_skill_horde_tier3_griffin_harmony_army_upgrade",
					[3] = "troy_mth_agent_griffin_skill_horde_tier3_griffin_gold_economy",
				},
			},
			[4] = {
				node_id = "node_4",
				rank_req = 5,
				skills = { 
					[1] = "troy_mth_agent_griffin_skill_tier4_army_ability",
					[2] = "troy_mth_agent_griffin_skill_tier4_harmony_units_buff",
					[3] = "troy_mth_agent_griffin_skill_tier4_arimaspoi_attributes",
				},
			},
		},
		troy_rem_horde_aethiopians = {
			[1] = {
				node_id = "node_1",
				rank_req = 2,
				skills = {
					[1] = "troy_mth_agent_griffin_skill_tier1_griffin_ability_upgrade",
					[2] = "troy_mth_agent_griffin_skill_horde_tier1_griffin_harmony_upgrade",
					[3] = "troy_mth_agent_griffin_skill_horde_tier1_griffin_economy_bonus",
				},
			},
			[2] = {
				node_id = "node_2",
				rank_req = 3,
				skills = { 
					[1] = "troy_mth_agent_griffin_skill_tier2_griffin_unit_upgrade",
					[2] = "troy_mth_agent_griffin_skill_tier2_griffin_agent_action_upgrade",
					[3] = "troy_mth_agent_griffin_skill_tier2_griffin_normal_unit_upgrades",
				},
			},
			[3] = {
				node_id = "node_3",
				rank_req = 4,
				skills = { 
					[1] = "troy_mth_agent_griffin_skill_tier3_griffin_attribute_upgrade",
					[2] = "troy_mth_agent_griffin_skill_horde_tier3_griffin_harmony_army_upgrade",
					[3] = "troy_rem_agent_griffin_skill_horde_tier3_griffin_gold_economy",
				},
			},
			[4] = {
				node_id = "node_4",
				rank_req = 5,
				skills = { 
					[1] = "troy_mth_agent_griffin_skill_tier4_army_ability",
					[2] = "troy_mth_agent_griffin_skill_tier4_harmony_units_buff",
					[3] = "troy_mth_agent_griffin_skill_tier4_arimaspoi_attributes",
				},
			},
		}
	},
	monster_effects = {
		effects_from_buildings = {
			griffin = {
				effect_key = "troy_mth_effect_harmony_griffin_side_dummy",
				factor_key = "buildings",
			},
			arimaspoi = {
				effect_key = "troy_mth_effect_harmony_arimaspoi_side_dummy",
				factor_key = "buildings",
			},
		},

		harmony_effects = {
			troy_mth_agent_griffin_skill_tier1_griffin_harmony_upgrade = {
				base_bundle = "troy_mth_agent_griffin_skill_tier1_griffin_harmony_upgrade_hidden",
				harmony_side = {
					[1] = {
						effect_key = "troy_mth_effect_replenishment_all_units_griffin_skill_mod",
						effect_value = 3,
						effects_scope = "force_to_force_own",
						condition = "griffin"
					},
					[2] = {
						effect_key = "troy_mth_effect_experience_all_units_griffin_skill",
						effect_value = 150,
						effects_scope = "force_to_force_own",
						condition = "arimaspoi"
					}
				},
			},

			troy_mth_agent_griffin_skill_horde_tier1_griffin_harmony_upgrade = {
				base_bundle = "troy_mth_agent_griffin_skill_tier1_griffin_harmony_upgrade_hidden",
				harmony_side = {
					[1] = {
						effect_key = "troy_effect_army_unrestricted_replenishment",
						effect_value = 3,
						effects_scope = "force_to_force_own",
						condition = "griffin"
					},
					[2] = {
						effect_key = "troy_mth_effect_experience_all_units_griffin_skill",
						effect_value = 150,
						effects_scope = "force_to_force_own",
						condition = "arimaspoi"
					}
				},
			},

			troy_mth_agent_griffin_skill_tier1_griffin_economy_bonus = {
				base_bundle = "troy_mth_griffin_effect_bundle_skill_tier1_griffin_economy_bonus",
				arimaspoi_side = {
					[1] = {
						effect_key = "troy_mth_effect_unit_capacity_arimaspoi_units",
						effect_value = 1,
						effects_scope = "faction_to_faction_own",
						condition = "arimaspoi"
					},
				},
			},
			troy_mth_agent_griffin_skill_horde_tier1_griffin_economy_bonus = {
				base_bundle = "troy_mth_griffin_effect_bundle_skill_tier1_griffin_economy_bonus",
				arimaspoi_side = {
					[1] = {
						effect_key = "troy_mth_effect_unit_capacity_arimaspoi_units",
						effect_value = 1,
						effects_scope = "faction_to_faction_own",
						condition = "arimaspoi"
					},
				},
			},
			troy_mth_agent_griffin_skill_tier2_griffin_agent_action_upgrade = {
				base_bundle = "troy_mth_agent_griffin_skill_tier2_griffin_agent_action_upgrade_hidden",
				harmony_side = {
					[1] = {
						effect_key = "troy_mth_effect_deal_evaluation_all_except_barter",
						effect_value = 5,
						effects_scope = "faction_to_faction_own",
					},
				},
			},
			troy_mth_agent_griffin_skill_tier3_griffin_attribute_upgrade = {
				base_bundle = "troy_mth_griffin_effect_bundle_skill_tier3_griffin_attribute_upgrade_bundle_upgrade",
				griffin_side = {
					[1] = {
						effect_key = "troy_mth_effect_unit_capacity_lesser_griffin",
						effect_value = 1,
						effects_scope = "faction_to_faction_own",
						condition = "griffin"
					},
				},
			},
			troy_mth_agent_griffin_skill_tier3_griffin_harmony_army_upgrade = {
				base_bundle = "troy_mth_griffin_effect_bundle_skill_tier3_harmony_upgrade",
				harmony_side = {
					[1] = {
						effect_key = "troy_mth_effect_happiness_harmony",
						effect_value = 1,
						effects_scope = "faction_to_province_own_unseen",
						condition = "both"
					},
					[2] = {
						effect_key = "troy_mth_effect_unit_capacity_griffin_all_griffin_units",
						effect_value = 1,
						effects_scope = "faction_to_faction_own",
						condition = "both"
					}
				},
			},

			troy_mth_agent_griffin_skill_horde_tier3_griffin_harmony_army_upgrade = {
				base_bundle = "troy_mth_griffin_effect_bundle_skill_tier3_harmony_upgrade_horde",
				harmony_side = {
					[1] = {
						effect_key = "troy_mth_effect_unit_capacity_griffin_all_griffin_units",
						effect_value = 2,
						effects_scope = "faction_to_faction_own",
						condition = "both"
					}
				},
			},

			troy_mth_agent_griffin_skill_tier3_griffin_gold_economy = {
				base_bundle = "troy_mth_griffin_effect_bundle_skill_tier3_griffin_gold_economy",
				arimaspoi_side = {
					[1] = {
						effect_key = "troy_mth_effect_gold_per_turn_arimaspoi_buildings_mod",
						effect_value = 2,
						effects_scope = "faction_to_faction_own",
						condition = "arimaspoi"
					},
				},
			},

			troy_mth_agent_griffin_skill_horde_tier3_griffin_gold_economy = {
				base_bundle = "troy_mth_griffin_effect_bundle_skill_tier3_griffin_gold_economy",
				arimaspoi_side = {
					[1] = {
						effect_key = "troy_mth_effect_gold_per_turn_arimaspoi_buildings_mod",
						effect_value = 20,
						effects_scope = "faction_to_faction_own",
						condition = "arimaspoi"
					},
				},
			},

			troy_rem_agent_griffin_skill_horde_tier3_griffin_gold_economy = {
				base_bundle = "troy_mth_griffin_effect_bundle_skill_tier3_griffin_gold_economy",
				arimaspoi_side = {
					[1] = {
						effect_key = "troy_mth_effect_gold_per_turn_arimaspoi_buildings_mod",
						effect_value = 20,
						effects_scope = "faction_to_faction_own",
						condition = "arimaspoi"
					},
				},
			},
		},

		skill_effects = {
			troy_mth_agent_griffin_skill_tier1_griffin_ability_upgrade = {
				[1] = {
					effect_bundle = "troy_mth_griffin_effect_bundle_skill_tier1_ability_upgrade",
					side = "griffin",
				},
			},
			troy_mth_agent_griffin_skill_tier1_griffin_harmony_upgrade = {
				[1] = { 
					effect_bundle = "troy_mth_griffin_effect_bundle_skill_tier1_harmony_upgrade",
					side = "harmony",
				}, 
			},
			troy_mth_agent_griffin_skill_horde_tier1_griffin_harmony_upgrade = {
				[1] = { 
					effect_bundle = "troy_mth_griffin_effect_bundle_skill_tier1_harmony_upgrade",
					side = "harmony",
				}, 
			},
			troy_mth_agent_griffin_skill_tier1_griffin_economy_bonus = {
				[1] = { 
					effect_bundle = "troy_mth_griffin_effect_bundle_skill_tier1_griffin_economy_bonus",
					side = "arimaspoi",
				}, 
			},
			troy_mth_agent_griffin_skill_horde_tier1_griffin_economy_bonus = {
				[1] = { 
					effect_bundle = "troy_mth_griffin_effect_bundle_skill_tier1_griffin_economy_bonus_horde",
					side = "arimaspoi",
				}, 
			},
			
			troy_mth_agent_griffin_skill_tier2_griffin_normal_unit_upgrades = {
				[1] = {
					effect_bundle = "troy_mth_griffin_effect_bundle_skill_tier2_griffin_unit_upgrades_bundle_upgrade",
					side = "arimaspoi",
				},
			},
			troy_mth_agent_griffin_skill_tier2_griffin_agent_action_upgrade = {
				[1] = {
					effect_bundle = "troy_mth_griffin_effect_bundle_skill_tier2_griffin_agent_action_upgrade_bundle_upgrade",
					side = "harmony",
				},
			},
			troy_mth_agent_griffin_skill_tier2_griffin_unit_upgrade = {
				[1] = {
					effect_bundle = "troy_mth_griffin_effect_bundle_skill_tier2_griffin_unit_upgrade_bundle_upgrade",
					side = "griffin",
				},
			},
			troy_mth_agent_griffin_skill_tier3_griffin_harmony_army_upgrade = {
				[1] = {
					effect_bundle = "troy_mth_griffin_effect_bundle_skill_tier3_harmony_upgrade",
					side = "harmony",
				},
			},
			troy_mth_agent_griffin_skill_horde_tier3_griffin_harmony_army_upgrade = {
				[1] = {
					effect_bundle = "troy_mth_griffin_effect_bundle_skill_tier3_harmony_upgrade_horde",
					side = "harmony",
				},
			},
			troy_mth_agent_griffin_skill_tier3_griffin_attribute_upgrade = {
				[1] = {
					effect_bundle = "troy_mth_griffin_effect_bundle_skill_tier3_griffin_attribute_upgrade_bundle_upgrade",
					side = "griffin",
				},
			},
			troy_mth_agent_griffin_skill_tier3_griffin_gold_economy = {
				[1] = {
					effect_bundle = "troy_mth_griffin_effect_bundle_skill_tier3_griffin_gold_economy",
					side = "arimaspoi",
				},
			},
			troy_mth_agent_griffin_skill_horde_tier3_griffin_gold_economy = {
				[1] = {
					effect_bundle = "troy_mth_griffin_effect_bundle_skill_tier3_griffin_gold_economy_horde",
					side = "arimaspoi",
				},
			},
			troy_rem_agent_griffin_skill_horde_tier3_griffin_gold_economy = {
				[1] = {
					effect_bundle = "troy_mth_griffin_effect_bundle_skill_tier3_griffin_gold_economy_horde",
					side = "arimaspoi",
				},
			},

			troy_mth_agent_griffin_skill_tier4_harmony_units_buff = {
				[1] = {
					effect_bundle = "troy_mth_griffin_effect_bundle_skill_tier4_harmony_units_buff_bundle_upgrade",
					side = "harmony",
				},
			},
			troy_mth_agent_griffin_skill_tier4_army_ability = {
				[1] = {
					effect_bundle = "troy_mth_griffin_effect_bundle_skill_tier4_army_ability_bundle_upgrade",
					side = "griffin",
				},
			},
			troy_mth_agent_griffin_skill_tier4_arimaspoi_attributes = {
				[1] = {
					effect_bundle = "troy_mth_effect_bundle_griffin_skill_tier4_arimaspoi_attributes_hidden",
					side = "arimaspoi",
				},
			}
		},
		stance_effects = {
			high_vigour = {
				bundle = "troy_mth_bundle_stance_griffin_hunt_vigour_mod",
				duration = 0,
				effect = "troy_mth_effect_army_campaign_stance_begin_vigour_mod",
				effect_value = 2,
			},
			med_vigour = {
				bundle = "troy_mth_bundle_stance_griffin_hunt_vigour_mod",
				duration = 0,
				effect = "troy_mth_effect_army_campaign_stance_begin_vigour_mod",
				effect_value = 3,
			},
			low_vigour = {
				bundle = "troy_mth_bundle_stance_griffin_hunt_vigour_mod",
				duration = 0,
				effect = "troy_mth_effect_army_campaign_stance_begin_vigour_mod",
				effect_value = 5,
			},
		},
	},
	harmony_side_change_event_config = {
		arimaspoi_side = {
			title = "event_feed_strings_text_troy_mth_griffin_side_changed_title",
			primary_detail = "event_feed_strings_text_troy_mth_griffin_side_changed_primary_detail",
			secondary_detail = "event_feed_strings_text_troy_mth_griffin_side_changed_arimaspoi_secondary_detail",
			pic = 1118,
			show_immediately = true,
		},
		harmony_side = {
			title = "event_feed_strings_text_troy_mth_griffin_side_changed_title",
			primary_detail = "event_feed_strings_text_troy_mth_griffin_side_changed_primary_detail",
			secondary_detail = "event_feed_strings_text_troy_mth_griffin_side_changed_harmony_secondary_detail",
			pic = 1119,
			show_immediately = true,
		},
		griffin_side = {
			title = "event_feed_strings_text_troy_mth_griffin_side_changed_title",
			primary_detail = "event_feed_strings_text_troy_mth_griffin_side_changed_primary_detail",
			secondary_detail = "event_feed_strings_text_troy_mth_griffin_side_changed_griffin_secondary_detail",
			pic = 1120,
			show_immediately = true,
		}
	},
	-- Table keys should be ability keys, while prerequisites items should be character skill keys that would grant the respective ability.
	-- NOTE: Priorities should all be unique and greater than 0.
	skill_upgrades = {
		troy_mth_griffin_grounded = {
			troy_mth_griffin_grounded_upgraded = { priority = 100, prerequisites = { "troy_mth_agent_griffin_skill_tier1_griffin_ability_upgrade", }, },
		},
		troy_mth_griffin_rallying_screech = {
			troy_mth_griffin_rallying_screech_improved = { harmony_side = "griffin_side", priority = 100, prerequisites = { "troy_mth_agent_griffin_skill_tier1_griffin_ability_upgrade", }, },
		}
	},

}

-- ================================================================================================================================================ 
-- ================================================================== SCRIPTING ===================================================================
-- ================================================================================================================================================ 

-- local helper functions
local DEBUG = true
local function output(str, force_out)
	if DEBUG or force_out then
		out(mythic_monster_griffin_config.id..": "..(str or "nil"))
	end
end

local function err(str)
	output("ERROR - "..(str or "unknown"), true)
end

mythic_monster_griffin = {
	-- config
	config = mythic_monster_griffin_config,

	-- persistent data 
	persistent = {
		monster_cqi = false,
		military_force_in_stance = false,
		stance_vigour_effect_state = false,
		unlocked_tiers = {},
		harmony_state = "",
		regions_already_acted_upon = {},
	},

	-- events
	events = {
		AgentEntersMilitaryForce = function(self, context)
			local character = context:character()
			if not character or character:is_null_interface() then
				err("enter military force - character(null)")
				return 
			end

			if not character:character_subtype(self.config.agent_subtype) then
				err("Character subtype is wrong")
				return
			end

			local military_force = context:military_force()
			if not military_force or military_force:is_null_interface() then
				err("enter military force - force(null)")
				return 
			end

			output("Griffin enetred army, activating stance ("..self.config.army_stance..") to force")
			self.persistent.military_force_in_stance = military_force:command_queue_index()
			cm:activate_stance_to_force(true, self.config.army_stance, military_force:command_queue_index())
		end,

		-- model
		AgentLeavesMilitaryForce = function(self, context)
			local character = context:character()
			if not character or character:is_null_interface() then
				err("enter military force - character(null)")
				return 
			end

			if not character:character_subtype(self.config.agent_subtype) then
				err("Character subtype is wrong")
				return
			end

			local military_force = context:military_force()
			if not military_force or military_force:is_null_interface() then
				err("enter military force - force(null)")
				return 
			end

			output("Griffin left army, deactivating stance ("..self.config.army_stance..") to force")
			cm:activate_stance_to_force(false, self.config.army_stance, self.persistent.military_force_in_stance)
			self.persistent.military_force_in_stance = false
		end,

		CharacterPerformedSuccessfulAgentAction = function(self, context)
			output("CharacterPerformedSuccessfulAgentAction TYPE " .. context:type())
		end,
		CharacterPostbattleCaptiveOptionFoodForTheNests = function(self, context)
			output("CharacterPostbattleCaptiveOptionFoodForTheNests")
		end,
		CharacterPerformsSettlementOccupationDecision = function(self, context)
			if context:occupation_decision_option() == "occupation_decision_loot" and string.match(context:occupation_decision_group(), "griffin") then
				cm:apply_effect_bundle_to_region(self.config.occupation_option_bundle, context:garrison_residence():region():name(), self.config.occupation_option_bundle_duration)
			end
		end,

		BuildingCompleted = function(self, context)
			local building = context:building()
			local faction = building:faction()
			if not self:unlocked(faction:name()) then
				return
			end

			self:harmony_from_building_completed(faction, building)
		end,

		CharacterMilitaryForceBuildingCompleted = function(self, context)
			local building = context:building()
			local faction = building:faction()
			if not self:unlocked(faction:name()) then
				return
			end

			self:harmony_from_building_completed(faction, building)
		end,

		ForceAdoptsStance = function(self, context)
			out("STANCE ADOPTED: " .. context:stance_adopted())
			
			if not self.persistent.military_force_in_stance then 
				return
			end

			local military_force = cm:get_military_force_by_cqi(self.persistent.military_force_in_stance)
			if not military_force then
				return
			end
			
			if context:military_force() ~= military_force then 
				return
			end

			if military_force:active_stance() ~= self.config.army_stance then
				if self.persistent.stance_vigour_effect_state then 
					self.persistent.stance_vigour_effect_state = false
				end
				return
			end


		end,

		FactionTurnStart = function(self, context)
			if not self.persistent.military_force_in_stance then
				return
			end

			local military_force = cm:get_military_force_by_cqi(self.persistent.military_force_in_stance)
			if not military_force then
				return
			end

			if military_force:active_stance() ~= self.config.army_stance then
				if self.persistent.stance_vigour_effect_state then 
					self.persistent.stance_vigour_effect_state = false
				end
				return
			end

			if not self.persistent.stance_vigour_effect_state then
				self:apply_griffin_stance_vigour_effects("high_vigour", military_force)
				self.persistent.stance_vigour_effect_state = "high_vigour"
			elseif self.persistent.stance_vigour_effect_state == "high_vigour" then
				self:apply_griffin_stance_vigour_effects("med_vigour", military_force)
				self.persistent.stance_vigour_effect_state = "med_vigour"
			elseif self.persistent.stance_vigour_effect_state == "med_vigour" then
				self:apply_griffin_stance_vigour_effects("low_vigour", military_force)
				self.persistent.stance_vigour_effect_state = "low_vigour"
			end
		end,

		PooledResourceTransactionEvent = function(self, context)
			if context:resource():key() ~= self.config.harmony_resource then
				return
			end

			if not self:unlocked(context:faction():name()) then
				return
			end

			local harmony_state = self:harmony_side(context:resource())

			for k, v in pairs(self.persistent.unlocked_tiers) do
				if v.skill ~= nil and v.skill ~= "" then
					local harmony_effects = self.config.monster_effects.harmony_effects[v.skill]
					mythic_monster_skills:setup_harmony_effects(self, v.skill, harmony_effects, harmony_state, context:resource():value())
				end
			end
			self:apply_harmony_bundle()
			self:refresh_harmony_bar()

			if harmony_state ~= self.persistent.harmony_state then
				local old_state = self.persistent.harmony_state
				self.persistent.harmony_state = harmony_state
				core:trigger_event("ScriptEventGriffinHarmonyStateChanged", {
					old_state = old_state,
					new_state = harmony_state,
					harmony = context:resource(),
					faction_key = context:faction():name()
				});
			end
		end,

		CharacterGarrisonTargetAction = function(self, context)
			local character = context:character()
			local char_faction = character:faction()
			local char_faction_key = char_faction:name()
			local target_region = context:garrison_residence():region()
			local available_dilemmas = {
				for_region = {},
				general = {}
			}
			local action_data = self.config.agent_action_config
			local skill_is_upgraded = character:has_skill(action_data.dilemma_bonus_skill_id)
		
			if context:agent_action_key() == action_data.hinder_settlement_action_key or context:agent_action_key() == action_data.assist_settlement_action_key and char_faction:is_human() then
				
				-- checking the dilemmas and seeing which one fit the criteria
				local region_matches = false 
				for _, data in ipairs(action_data.dilemma_setup) do
					if data.condition.regions then
						for _, key in ipairs(data.condition.regions) do
							if target_region:name() == key then 
								table.insert(available_dilemmas.for_region, data)
							end
						end
					elseif data.condition.types then
						-- we do this so we don't make unnecessary loops after we find a slot for the same region.
						local slot_matches = false
						for i = 0, target_region:slot_list():num_items() - 1 do
							if not slot_matches then 
								local curr_slot_type = target_region:slot_list():item_at(i):template_key()
								for ind, type in ipairs(data.condition.types) do	
									if string.find(curr_slot_type, type) then
										table.insert(available_dilemmas.general, data)
										slot_matches = true
									end
								end
							else
								break
							end
						end
					end
				end
		
				-- construct the payloads for the chosen dilemma either with or without the upgrade skill.
				if #available_dilemmas.for_region <= 0 and #available_dilemmas.general <= 0 then 
					script_error("ERROR: Griffin agent action performed on a gold settlement, but no dilemma is available for this region. Region is: "..target_region:name())
				else
					local dilemmas_to_chose_from
		
					-- we do this so we prioritize dilemmas for the regions.
					if #available_dilemmas.for_region >= 1 then
						dilemmas_to_chose_from = available_dilemmas.for_region
					else 
						dilemmas_to_chose_from = available_dilemmas.general
					end

					local chosen_dilemma = dilemmas_to_chose_from[cm:model():random_int(1, #dilemmas_to_chose_from)]
					local options_payloads = {}
					local mercenary_payloads_data = {}

					local payload_start = "payload{"
					local harmony_payload = "faction_pooled_resource_transaction{ resource troy_mth_harmony; factor troy_resource_factor_events; amount "
					local harmony_suffix = ";}"

					for index, option in ipairs(chosen_dilemma.options_details) do
						local payload = payload_start
						if not skill_is_upgraded then 
							payload = payload .. harmony_payload .. option.harmony_amount .. harmony_suffix
							-- If we don't have the skill, no need to populate the payload for the 3rd option.
							if index < 3 then 
								for j, payld in ipairs(option.payloads) do
									if payld.type == "ancillary" then 
										payload = payload .. "add_ancillary{ cqi ".. char_faction:faction_leader():command_queue_index() .."; ancillary ".. payld.key ..";}"
									elseif payld.type == "effect_bundle" then
										if not char_faction:is_allowed_to_capture_territory() and payld.horde_override and payld.horde_override.key then
											payload = payload .. "effect_bundle{ bundle_key ".. payld.horde_override.key .."; turns ".. payld.duration ..";}"
										else
											payload = payload .. "effect_bundle{ bundle_key ".. payld.key .."; turns ".. payld.duration ..";}"
										end
									elseif payld.type == "pooled_resource" then
										payload = payload .. "faction_pooled_resource_transaction{ resource " .. payld.resource_key .."; factor " .. payld.factor_key .. "; amount ".. payld.amount ..";}"
									elseif payld.type == "add_mercenary" then 
										payload = payload .. "text_display{lookup ".. payld.lookup_key ..";}"
										table.insert(mercenary_payloads_data, payld)
									end
								end
							end
						else
							-- in the third option, we provide harmony to stay in the middle of the bar.
							if index == 3 then 
								local current_harmony = char_faction:pooled_resource(self.config.harmony_resource):value()
								local balance_harmony_ammount = self:calcuate_harmony_towards_the_middle(option.harmony_amount, current_harmony)

								payload = payload .. harmony_payload .. balance_harmony_ammount .. harmony_suffix
							else
								local increased_harmony = option.harmony_amount + option.harmony_amount * 0.5
								payload = payload .. harmony_payload .. increased_harmony .. harmony_suffix
							end
							-- if upgraded, we provide boosted payloads
							for j, payld in ipairs(option.payloads) do
								if payld.type == "ancillary" then 
									payload = payload ..  "add_ancillary{ cqi ".. char_faction:faction_leader():command_queue_index() .."; ancillary ".. payld.key ..";}"
								elseif payld.type == "effect_bundle" then
									if not char_faction:is_allowed_to_capture_territory() and payld.horde_override and payld.horde_override.upgraded_key then
										payload = payload .. "effect_bundle{ bundle_key ".. payld.horde_override.upgraded_key .."; turns ".. payld.duration ..";}"
									else
										payload = payload .. "effect_bundle{ bundle_key ".. payld.upgraded_key .."; turns ".. payld.duration ..";}"
									end
								elseif payld.type == "pooled_resource" then
									local increased_amount = payld.amount + payld.amount * 0.5
									payload = payload .. "faction_pooled_resource_transaction{ resource " .. payld.resource_key .."; factor " .. payld.factor_key .. "; amount ".. increased_amount ..";}"
								elseif payld.type == "add_mercenary" then 
									payload = payload .. "text_display{lookup ".. payld.lookup_key ..";}"
									table.insert(mercenary_payloads_data, payld)
								end
							end
						end
						options_payloads[index] = payload .. "}"
					end

					if #mercenary_payloads_data >= 1 then
						self:add_mercenary_payload_for_dilemma_listener(char_faction_key, chosen_dilemma.dilemma_key, mercenary_payloads_data)
					end

					if not skill_is_upgraded then 
						cm:trigger_custom_dilemma(
							char_faction_key, 
							chosen_dilemma.dilemma_key, 
							options_payloads[1],
							options_payloads[2]
						)
					else
						cm:trigger_custom_dilemma(
							char_faction_key, 
							chosen_dilemma.dilemma_key, 
							options_payloads[1],
							options_payloads[2],
							options_payloads[3]
						)
					end

					local target_region_key = target_region:name()
					if not is_table(self.persistent.regions_already_acted_upon) and self.persistent.regions_already_acted_upon == nil then
						self.persistent.regions_already_acted_upon = {}
					end
					table.insert(self.persistent.regions_already_acted_upon, target_region_key)
					self:griffin_agent_action_apply_agent_action_disable_effect(target_region_key)
					self:griffin_agent_action_apply_icon(target_region_key)
				end
			end
		end,

		ScriptEventGriffinHarmonyStateChanged = function(self, context)
			if self.persistent.monster_cqi then
				local character_family_member = cm:model():family_member_for_command_queue_index(self.persistent.monster_cqi)
				local character = character_family_member:character()
				local faction_key = character:faction():name()
			
				if self.config.harmony_side_change_event_config and context.stored_table.faction_key == faction_key then
					self:trigger_message_event(context.stored_table.faction_key, self.config.harmony_side_change_event_config[context.stored_table.new_state])
				end
			end
		end,

		RegionFactionChangeEvent = function(self, context)
			if self.persistent.regions_already_acted_upon then 
				if #self.persistent.regions_already_acted_upon > 0 then 
					for i, region_key in ipairs(self.persistent.regions_already_acted_upon) do
						if context:region():name() == region_key then 
							self:griffin_agent_action_apply_agent_action_disable_effect(region_key)
						end
					end
				end
			end
		end,
	},

	add_mercenary_payload_for_dilemma_listener = function(self, faction_key, dilemma_key, payload_data)
		core:add_listener(
			"troy_mth_griffin_agent_action_"..faction_key.."_"..dilemma_key.."_listener",
			"DilemmaChoiceMadeEvent",
			function(context)
				return context:dilemma() == dilemma_key and context:faction():name() == faction_key
			end,
			function(context)
				local cont_choice = context:choice() + 1
				local choice_string = {"FIRST", "SECOND", "THIRD"}

				for i, payload in ipairs(payload_data) do 
					if choice_string[cont_choice] == payload.choice then
						local faction = context:faction()
						local faction_cqi = faction:command_queue_index()
						local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, payload.unit_key)

						local cust_bundle_key = "troy_mth_effect_bundle_mercenaries_from_griffin_dilemma_dummy"
						local unit_cap_effect_bundle = cm:clone_or_create_custom_effect_bundle(faction:name(), cust_bundle_key)
						unit_cap_effect_bundle:set_duration(0)
						unit_cap_effect_bundle:add_effect(payload.effect_key,"faction_to_faction_own_unseen", payload.amount)
						cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)
						
						unit_ammount = unit_ammount + payload.amount
						cm:add_unit_to_faction_mercenary_pool(faction, payload.unit_key, unit_ammount, 0, 5, 0, 0, "", "", "")	
					end
				end
			end,
		false
		)
	end,

	griffin_agent_action_apply_agent_action_disable_effect = function(self, region_key)
		cm:apply_effect_bundle_to_region(self.config.agent_action_config.region_griffin_action_disable_bundle, region_key, -1)
	end,

	griffin_agent_action_apply_icon = function(self, region_key)
		local icon_data = self.config.agent_action_config.region_griffin_action_disable_icon
		cm:set_custom_settlement_info_icon(region_key, icon_data.icon_id, icon_data.icon_path, icon_data.description)
		CampaignUI.UpdateSettlementEffectIcons()
	end,

	calcuate_harmony_towards_the_middle = function(self, ammount_to_apply, current_harmony)
		if not is_number(ammount_to_apply) and is_number(not current_harmony) then 
			script_error("ERROR: calcuate_harmony_towards_the_middle() called, but nether parameters are numbers")
		end
		-- making sure that we're dealing with positive numbers because the formulas rely on this.
		ammount_to_apply = math.abs(ammount_to_apply)
		local original_ammount_to_apply = ammount_to_apply

		if current_harmony >= self.config.harmony.griffin_side.min then 
			ammount_to_apply = ammount_to_apply * -1
		elseif current_harmony <= self.config.harmony.arimaspoi_side.max then 
			ammount_to_apply = ammount_to_apply * 1
		elseif current_harmony == 0 then -- if the player is at 0, we don't want to push him in either direction.
			ammount_to_apply = 0

		elseif current_harmony > 0 then 
			local end_result_check = math.clamp(current_harmony - ammount_to_apply,  self.config.harmony.arimaspoi_side.max, self.config.harmony.griffin_side.min)
			if end_result_check < 0 then
				ammount_to_apply = (original_ammount_to_apply - (end_result_check * -1)) * -1
			else
				ammount_to_apply = ammount_to_apply * -1
			end
		elseif current_harmony < 0 then 
			local end_result_check = math.clamp(current_harmony + ammount_to_apply, self.config.harmony.arimaspoi_side.max, self.config.harmony.griffin_side.min)
			if end_result_check > 0 then
				ammount_to_apply = original_ammount_to_apply - end_result_check
			end
		end

		return ammount_to_apply
	end,

	reset_persistent = function(self)
		self.persistent = {
			monster_cqi = false,
			military_force_in_stance = false,
			stance_vigour_effect_state = false,
			unlocked_tiers = {},
			harmony_state = "",
			regions_already_acted_upon = {},
		}
	end,

	get_harmony_state = function(self)
		return self.persistent.harmony_state
	end,

	harmony_side = function(self, pooled_resource)
		local value = pooled_resource:value()
		for k, v in pairs(self.config.harmony) do
			if value >= v.min and value <= v.max then
				return k
			end
		end
	end,
	-- events first handled by mythic_monsters_common

	has_griffin_in_army = function(self, character)
		if not character or character:is_null_interface() then return false end

		local military_force = character:has_military_force() and character:military_force()
		if not military_force or military_force:is_null_interface() then
			err("char with subtype " .. character:character_subtype_key() .. " no military force")
			return false
		end

		local character_list = military_force:character_list()
		local character_count = character_list:num_items()
		for i = 0, character_count - 1 do
			local char = character_list:item_at(i)
			output("Testing char with subtype " .. char:character_subtype_key())
			if char:character_subtype_key() == self.config.agent_subtype then
				return true --{ cqi = character:command_queue_index() }
			end
		end
	end,

	apply_griffin_stance_vigour_effects = function(self, vigour_state, military_force)
		local effects = self.config.monster_effects.stance_effects[vigour_state]
		local custom_bundle = cm:create_new_custom_effect_bundle(effects.bundle)
		for i = 0, custom_bundle:effects():num_items() - 1 do
			local effect = custom_bundle:effects():item_at(i)
			if effect:key() == effects.effect then
				custom_bundle:set_effect_value(effect, effects.effect_value)
			end
		end
		cm:apply_custom_effect_bundle_to_force(custom_bundle, military_force)
	end,

	unlocked = function(self, faction_key)
		return mythic_monsters_common:is_monster_unlocked(self:id(), faction_key)
	end,

	build_tooltip_custom_effect_bundle = function(self, effect_bundle_key, tooltip_side)
		local harmony_bundle = cm:create_new_custom_effect_bundle(effect_bundle_key)

		if self.persistent.unlocked_tiers == nil then
			return harmony_bundle
		end
		for k, v in pairs(self.persistent.unlocked_tiers) do
			if v.skill ~= nil then
				local skill_bundles = self.config.monster_effects.skill_effects[v.skill]
				if skill_bundles then
					for _, bundle_data in ipairs(skill_bundles) do
						if bundle_data.side == tooltip_side then
							local skill_bundle = cm:create_new_custom_effect_bundle(bundle_data.effect_bundle)
							for i = 0, skill_bundle:effects():num_items() - 1 do
								local effect = skill_bundle:effects():item_at(i)
								harmony_bundle:add_effect(effect:key(), effect:scope(), effect:value())
							end
						end
					end
				end
			end
		end
		return harmony_bundle
	end,

	apply_harmony_bundle = function(self)
		if self.persistent.monster_cqi then
			local character_family_member = cm:model():family_member_for_command_queue_index(self.persistent.monster_cqi)
			local character = character_family_member:character()
			if character:is_null_interface() then out("Monster with family member with CQI " .. self.persistent.monster_cqi .. " has no character!") return end

			local character_faction = character:faction()
			local harmony = character_faction:pooled_resource(self.config.harmony_resource)
			local side = self:harmony_side(harmony)
			local harmony_tooltip_data = self:get_harmony_bundle_details_for_faction(character_faction)

			local current_active_harmony_bundle = self:check_current_active_harmony_bundle(character_faction)
			if current_active_harmony_bundle then
				cm:remove_effect_bundle(current_active_harmony_bundle:key(), character_faction:name())
			end

			if side == "griffin_side" then
				local bundle = self:build_tooltip_custom_effect_bundle(harmony_tooltip_data.griffin.effect_bundle, "griffin")
				cm:apply_custom_effect_bundle_to_faction(bundle, character_faction)
			elseif side == "harmony_side" then
				local bundle = self:build_tooltip_custom_effect_bundle(harmony_tooltip_data.harmony.effect_bundle, "harmony")
				cm:apply_custom_effect_bundle_to_faction(bundle, character_faction)
			elseif side == "arimaspoi_side" then
				local bundle = self:build_tooltip_custom_effect_bundle(harmony_tooltip_data.arimaspoi.effect_bundle, "arimaspoi")
				cm:apply_custom_effect_bundle_to_faction(bundle, character_faction)
			end
		end
	end,

	check_current_active_harmony_bundle = function(self, faction)
		if not faction or faction:is_null_interface() then
			script_error("ERROR: check_current_active_harmony_bundle() called, but supplied faction is invalid")
		end

		local harmony_tooltip_data = self:get_harmony_bundle_details_for_faction(faction)
		local bundle = false

		if not faction:get_effect_bundle(harmony_tooltip_data.griffin.effect_bundle):is_null_interface() then
			bundle = faction:get_effect_bundle(harmony_tooltip_data.griffin.effect_bundle)
		elseif not faction:get_effect_bundle(harmony_tooltip_data.harmony.effect_bundle):is_null_interface() then
			bundle = faction:get_effect_bundle(harmony_tooltip_data.harmony.effect_bundle)
		elseif not faction:get_effect_bundle(harmony_tooltip_data.arimaspoi.effect_bundle):is_null_interface() then
			bundle = faction:get_effect_bundle(harmony_tooltip_data.arimaspoi.effect_bundle)
		end
		return bundle
	end,

	on_skill_point_picked = function(self, skill, skillpoint_picked_context)
		for k, v in pairs(self.persistent.unlocked_tiers) do
			if v.skill ~= nil and v.skill ~= "" and v.skill == skill then
				local harmony_effects = self.config.monster_effects.harmony_effects[v.skill]
				local monster_faction = cm:model():family_member_for_command_queue_index(self.persistent.monster_cqi):character():faction()
				mythic_monster_skills:setup_harmony_effects(self, v.skill, harmony_effects, self:harmony_side(monster_faction:pooled_resource(self.config.harmony_resource)), monster_faction:pooled_resource((self.config.harmony_resource)):value(), skillpoint_picked_context)
			end
		end
		self:apply_harmony_bundle()
		self:refresh_harmony_bar()
	end,

	-- on new game started - called once on new campaign
	on_new_game_started = function(self)
		return true
	end,

	on_first_tick = function(self, context)
		self:apply_harmony_bundle()

		if self.persistent.regions_already_acted_upon then 
			if #self.persistent.regions_already_acted_upon > 0 then
				for i, region in ipairs(self.persistent.regions_already_acted_upon) do 
					self:griffin_agent_action_apply_icon(region)
				end
			end
		end

		-- true: add listeners for my events table
		-- false: I'll handle my events by myself
		return true
	end,

	-- update harmony bar
	refresh_harmony_bar = function(self)
		local panel = core:get_ui_root():SequentialFind("monster_progression")
		if panel and panel:Visible() then
			local bar = panel:SequentialFind("bars_holder", "griffin")
			if bar then
				-- setup the bar and tooltip
				bar:PropagateVisibility(true)

				local harmony_tooltip_data = self:get_harmony_bundle_details_for_faction(cm:model():world():faction_by_key(cm:get_local_faction_name(true)))
				for pos, tooltip_data in pairs(harmony_tooltip_data) do
					local trigger = bar:SequentialFind(tooltip_data.component_id) 
					if trigger then
						trigger:InterfaceFunction("set_tooltip_path", "UI/Campaign UI/mth_griffin_harmony_tooltip")
						local tooltip = trigger:SequentialFind(trigger:Id() .. "_tooltip")
						if tooltip then
							tooltip:SequentialFind("dy_heading_textbox"):SetText(common.get_localised_string(tooltip_data.heading))
							tooltip:SequentialFind("info_txt"):SetText(common.get_localised_string(tooltip_data.info_txt))
							local bundle = self:build_tooltip_custom_effect_bundle(tooltip_data.effect_bundle, tooltip_data.side)
							panel:InterfaceFunction("set_griffin_tooltip_effect_bundle", tooltip_data.component_id, bundle)
							tooltip:SequentialFind("info_unlock_txt"):SetVisible(false)
							tooltip:SequentialFind("sep_bottom"):SetVisible(false)
						end
					end
				end

				--set up pointer position and resource value
				local uic_value = bar:SequentialFind("griffin_pointer")
				if uic_value then				
					local harmony = cm:model():world():faction_by_key(cm:get_local_faction_name(true)):pooled_resource(self.config.harmony_resource)
					uic_value:SetText(tostring(harmony:value()))

					local relative_pos_mul = harmony:percentage_of_capacity() * 0.01

					local uic_parent = bar:SequentialFind("griffin_bar_width")	
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

		self:refresh_harmony_bar()

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
	end,

	on_monster_unlocked = function(self, faction_key)
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

	on_monster_created = function(self, character)
		local harmony = character:faction():pooled_resource(self.config.harmony_resource)
		self.persistent.harmony_state = self:harmony_side(harmony)
		self:apply_harmony_bundle()
	end,

	on_monster_recruited = function(self, character)
		self:apply_harmony_bundle()
	end,

	trigger_message_event = function(self, faction_key, event)
		if event.show_immediately then
			cm:show_message_event(faction_key, event.title, event.primary_detail, event.secondary_detail, true, event.pic, nil, nil, true)
		else
			cm:show_configurable_message_event(faction_key, event.title, event.primary_detail, event.secondary_detail, event.pic)
		end
	end,

	harmony_from_building_completed = function(self, faction, building)
		if not is_faction(faction) then
			script_error("harmony_from_building_completed but no valid faction was provided")
			return
		end

		if not building and not building:is_null_interface() then
			script_error("harmony_from_building_completed but no valid building was provided")
			return
		end

		local building_record = building:name()
		local faction_key = faction:name()

		local griffin_effect_config 
		local pooled_res_side_mod

		local unlockable_buildings = mythic_monsters_common:get_unlockable_buildings_for_faction(faction_key, self.config)
		for _, v in ipairs(unlockable_buildings) do
			if v.building_level_key == building_record then
				griffin_effect_config = self.config.monster_effects.effects_from_buildings[v.building_side]
				
				if v.building_side == "griffin" then
					pooled_res_side_mod = 1
				elseif v.building_side == "arimaspoi" then 
					pooled_res_side_mod = -1
				end
				
				break
			end
		end

		if griffin_effect_config and pooled_res_side_mod then 
			cm:faction_add_pooled_resource(faction_key, self.config.harmony_resource, griffin_effect_config.factor_key, building:get_effect_value(griffin_effect_config.effect_key) * pooled_res_side_mod)
		end

	end
}

-- returns a simple or composite ID
mythic_monster_griffin.id = function(self, suff) 
	if not is_table(self.config) or not self.config.id then
		err("Missing monster ID")
		return
	end
	return suff and suff ~= "" and self.config.id.."_"..suff or self.config.id 
end

-- This function returns the harmony tooltips data for specified faction.
-- If there is an override for the provided faction (if any, allowing for no faction given), return it. Otherwise, return the default one.
mythic_monster_griffin.get_harmony_bundle_details_for_faction = function(self, faction)
	if not faction then 
		out("mythic_monster_griffin.get_harmony_bundle_details_for_faction() called, but the provided faction is invalid")
		return
	end

	if faction and not faction:is_null_interface() then 
		local faction_key = faction:name()

		if self.config.harmony_tooltips and self.config.harmony_tooltips[faction_key] then 
			return self.config.harmony_tooltips[faction_key]
		end
	end

	return self.config.harmony_tooltips.default
end

-- mythic_monsters_common:unlock_monster("MYTHIC_MONSTER_GRIFFIN", cm:get_local_faction_name(true))
return mythic_monster_griffin
-- cm:faction_add_pooled_resource(cm:get_local_faction_name(), "troy_mth_harmony", "troy_units", 70)

