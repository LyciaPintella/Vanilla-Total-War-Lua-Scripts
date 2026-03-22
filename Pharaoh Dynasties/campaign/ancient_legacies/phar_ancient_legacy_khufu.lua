out("Loading phar_ancient_legacy_khufu.lua")

khufu_config =
{
	wonders =
	{
		{
			-- Key for the wonder
			key = "great_pyramid",
			-- No need to add "ui_text_replacements_localised_text_"
			display_name_key = "phar_main_al_khufu_pyramid_title",
			-- Region where the wonder can be built
			region_key = "phar_main_herakleopolis_herakleopolis",
			-- Number of the slot in the region where the wonder can be built
			slot_number = 9,
			-- Building records should not contain a cost!
			-- The building level records should be part of the same chain
			-- sacked should be level 0
			-- under construction should be level 1
			-- finished should be level 2
			sacked_building_record = "phar_main_al_khufu_pyramid_sacked",
			building_under_construction_record = "phar_main_al_khufu_pyramid_under_construction",
			finished_building_record = "phar_main_al_khufu_pyramid_complete",
			-- Effect bundle with effects from the wonder. Needed to display the wonder's effects in UI before it is built.
			effect_bundle = "phar_main_effect_bundle_al_khufu_dummy_pyramid_effects",

			-- UI images
			-- Wonder selection screen
			image_locked = "UI/skins/default/legacy_khufu/wonders/great_pyramid/image_pyramid_locked.png",
			image_to_be_constructed = "UI/skins/default/legacy_khufu/wonders/great_pyramid/image_pyramid_to_be_constructed.png",
			image_under_construction = "UI/skins/default/legacy_khufu/wonders/great_pyramid/image_pyramid_in_construction.png",
			image_finished = "UI/skins/default/legacy_khufu/wonders/great_pyramid/image_pyramid_constructed.png",
			-- Wonder details_screen
			image_foundation = "UI/skins/default/legacy_khufu/wonders/great_pyramid/image_big_pyramid_foundation.png",
			effect_bundle_icon = "ui/buildings/icons/ers_pips/icon_building_great_pyramid.png",
			image_stages =
			{
				"UI/skins/default/legacy_khufu/wonders/great_pyramid/image_big_pyramid_upgrade_1.png",
				"UI/skins/default/legacy_khufu/wonders/great_pyramid/image_big_pyramid_upgrade_2.png",
				"UI/skins/default/legacy_khufu/wonders/great_pyramid/image_big_pyramid_upgrade_3.png",
			},
			-- Mask for damaged states of wonders
			mask_image = "UI/skins/default/legacy_khufu/wonders/great_pyramid/image_pyramid_mask.png",
			-- Special effects of finished wonder that need code support (see great_garden for example)
			special_effects = {},
			-- Foundation + embelishments go here
			stages =
			{
				{
					-- Foundations are mandatory!
					key = "foundation",
					display_name_key = "phar_main_al_khufu_stage_foundation_title",
					display_tooltip_key = "phar_main_al_khufu_stage_foundation_tooltip",
					-- Cost to build
					cost = "phar_main_al_khufu_pyramid_foundation",
					-- Cost to repair the wonder is set in DB in the repair_resource_cost_override field
					construction_time = 12,
					-- Regional supply data, can contain multiple buildings
					regional_supply =
					{
						{
							building_record = "phar_main_all_resource_production_stone_mine_2",
							percentage_discount = 50,
						},
					},
				},
				{
					key = "embelishment_1",
					display_name_key = "phar_main_al_khufu_pyramid_embelishment_1_pyramidion_title",
					display_tooltip_key = "phar_main_al_khufu_pyramid_embelishment_1_pyramidion_tooltip",
					cost = "phar_main_al_khufu_pyramid_embelishment_1_pyramidion",
					construction_time = 9,
					regional_supply =
					{
						{
							building_record = "phar_main_all_resource_production_stone_mine_derivative_type_a_1",
							percentage_discount = 50,
						},
					},
				},
				{
					key = "embelishment_2",
					display_name_key = "phar_main_al_khufu_pyramid_embelishment_3_columns_title",
					display_tooltip_key = "phar_main_al_khufu_pyramid_embelishment_3_columns_tooltip",
					cost = "phar_main_al_khufu_pyramid_embelishment_3_columns",
					construction_time = 6,
					regional_supply =
					{
						{
							building_record = "phar_main_all_resource_production_wood_port_nile_2",
							percentage_discount = 50,
						},
					},
				},
				{
					key = "embelishment_3",
					display_name_key = "phar_main_al_khufu_pyramid_embelishment_2_statues_title",
					display_tooltip_key = "phar_main_al_khufu_pyramid_embelishment_2_statues_tooltip",
					cost = "phar_main_al_khufu_pyramid_embelishment_2_statues",
					construction_time = 9,
					regional_supply =
					{
						{
							building_record = "phar_main_all_province_management_happiness_type_c_3",
							percentage_discount = 50,
						},
					},
				}				
			},

			garrison_units =
			{
				{
					display_name_key = "phar_main_al_khufu_garrison_default_title",
					-- Use nil to make it free
					bundle_cost = nil,
					units =
					{
						{key = "phar_main_nat_low_lower_egyptian_spear_militia", count = 4},
						{key = "phar_main_nat_low_lower_egyptian_militia_slingers", count = 3},
					}
				},
				{
					display_name_key = "phar_main_al_khufu_garrison_medium_title",
					bundle_cost = "phar_main_al_khufu_garrison_medium",
					units =
					{
						{key = "phar_main_nat_low_lower_egyptian_axe_conscripts", count = 2},
						{key = "phar_main_nat_low_lower_egyptian_militia_slingers", count = 1},
						{key = "phar_main_nat_low_lower_egyptian_veteran_spearmen", count = 3},
						{key = "phar_main_nat_low_lower_egyptian_archers", count = 3},
					}
				},
				{
					display_name_key = "phar_main_al_khufu_garrison_expensive_title",
					bundle_cost = "phar_main_al_khufu_garrison_expensive",
					units =
					{
						{key = "phar_main_nat_low_lower_egyptian_veteran_spearmen", count = 2},
						{key = "phar_main_nat_low_lower_egyptian_veteran_swordsmen", count = 2},
						{key = "phar_main_nat_low_egyptian_chariots", count = 2},
						{key = "phar_main_nat_low_armoured_lower_egyptian_archers", count = 3},
					}
				},
			},

			invasion =
			{
				-- How many turns after the start of the foundation the invasion starts
				turns_after_start = 6,
				-- Faction of the invading army
				faction = "phar_main_al_khufu_invasion_libu",
				-- Army budget
				budget = 12000,
				-- Units in invading army (if budget is too low for the amount of units the army might not appear!)
				unit_count = 19,
				-- Starting position of invading army
				starting_position =
				{
					404,
					812,
				},
				-- Position to raid
				raid_position =
				{
					414,
					795,
				},
			},
		},
		{
			key = "great_garden",
			display_name_key = "phar_main_al_khufu_garden_title",
			region_key = "phar_main_memphis_memphis",
			slot_number = 10,
			sacked_building_record = "phar_main_al_khufu_garden_sacked",
			building_under_construction_record = "phar_main_al_khufu_garden_under_construction",
			finished_building_record = "phar_main_al_khufu_garden_complete",
			effect_bundle = "phar_main_effect_bundle_al_khufu_dummy_garden_effects",
			-- UI images
			image_locked = "UI/skins/default/legacy_khufu/wonders/great_garden/image_great_garden_locked.png",
			image_to_be_constructed = "UI/skins/default/legacy_khufu/wonders/great_garden/image_great_garden_to_be_constructed.png",
			image_under_construction = "UI/skins/default/legacy_khufu/wonders/great_garden/image_great_garden_in_construction.png",
			image_finished = "UI/skins/default/legacy_khufu/wonders/great_garden/image_great_garden_constructed.png",
			image_foundation = "UI/skins/default/legacy_khufu/wonders/great_garden/image_big_great_garden_foundation.png",
			effect_bundle_icon = "ui/buildings/icons/ers_pips/icon_building_great_garden.png",
			image_stages =
			{
				"UI/skins/default/legacy_khufu/wonders/great_garden/image_big_great_garden_upgrade_1.png",
				"UI/skins/default/legacy_khufu/wonders/great_garden/image_big_great_garden_upgrade_2.png",
				"UI/skins/default/legacy_khufu/wonders/great_garden/image_big_great_garden_upgrade_3.png",
			},
			mask_image = "UI/skins/default/legacy_khufu/wonders/great_garden/image_great_garden_mask.png",
			-- Special effects of finished wonder that need code support
			special_effects =
			{
				-- List of effect bundles to be applied
				effect_bundles =
				{
					{
						bundle_key = "phar_main_effect_bundle_al_khufu_gardens_food_income",
					},
					{
						bundle_key = "phar_main_effect_bundle_al_khufu_gardens_influence",
						-- Add apply_to_province to apply a bundle to the province of the region list rather than to each region
						apply_to_province = true,
					},
				},
				-- List of lists of regions to apply the bundles to
				region_lists =
				{
					sacred_egypt_lands,
				}
			},
			-- Foundation + embelishments go here
			stages =
			{
				{
					-- Foundations are mandatory!
					key = "foundation",
					display_name_key = "phar_main_al_khufu_stage_foundation_title",
					display_tooltip_key = "phar_main_al_khufu_stage_foundation_tooltip",
					cost = "phar_main_al_khufu_garden_foundation",
					construction_time = 9,
					regional_supply =
					{
						{
							building_record = "phar_main_religion_cult_center_grand_temple_ptah_1",
							percentage_discount = 50,
						},
					},
				},
				{
					key = "embelishment_1",
					display_name_key = "phar_main_al_khufu_garden_embelishment_1_vegetation_title",
					display_tooltip_key = "phar_main_al_khufu_garden_embelishment_1_vegetation_tooltip",
					cost = "phar_main_al_khufu_garden_embelishment_1_vegetation",
					construction_time = 12,
					regional_supply =
					{
						{
							building_record = "phar_main_all_resource_production_food_farm_type_a_nile_2",
							percentage_discount = 50,
						},
					},
				},
				{
					key = "embelishment_2",
					display_name_key = "phar_main_al_khufu_garden_embelishment_2_animals_title",
					display_tooltip_key = "phar_main_al_khufu_garden_embelishment_2_animals_tooltip",
					cost = "phar_main_al_khufu_garden_embelishment_2_animals",
					construction_time = 9,
					regional_supply =
					{
						{
							building_record = "phar_main_all_province_management_roads_1",
							percentage_discount = 50,
						},
					},
				},
				{
					key = "embelishment_3",
					display_name_key = "phar_main_al_khufu_garden_embelishment_3_tree_title",
					display_tooltip_key = "phar_main_al_khufu_garden_embelishment_3_tree_tooltip",
					cost = "phar_main_al_khufu_garden_embelishment_3_tree",
					construction_time = 6,
					regional_supply =
					{
						{
							building_record = "phar_main_all_resource_production_wood_port_nile_2",
							percentage_discount = 50,
						},
					},
				},
			},

			garrison_units =
			{
				{
					display_name_key = "phar_main_al_khufu_garrison_default_title",
					-- Use nil to make it free
					bundle_cost = nil,
					units =
					{
						{key = "phar_main_nat_low_lower_egyptian_spear_militia", count = 4},
						{key = "phar_main_nat_low_lower_egyptian_militia_slingers", count = 3},
					}
				},
				{
					display_name_key = "phar_main_al_khufu_garrison_medium_title",
					bundle_cost = "phar_main_al_khufu_garrison_medium",
					units =
					{
						{key = "phar_main_nat_low_lower_egyptian_axe_conscripts", count = 2},
						{key = "phar_main_nat_low_lower_egyptian_militia_slingers", count = 1},
						{key = "phar_main_nat_low_lower_egyptian_veteran_spearmen", count = 3},
						{key = "phar_main_nat_low_lower_egyptian_archers", count = 3},
					}
				},
				{
					display_name_key = "phar_main_al_khufu_garrison_expensive_title",
					bundle_cost = "phar_main_al_khufu_garrison_expensive",
					units =
					{
						{key = "phar_main_nat_low_lower_egyptian_veteran_spearmen", count = 2},
						{key = "phar_main_nat_low_lower_egyptian_veteran_swordsmen", count = 2},
						{key = "phar_main_nat_low_egyptian_chariots", count = 2},
						{key = "phar_main_nat_low_armoured_lower_egyptian_archers", count = 3},
					}
				},
			},

			invasion =
			{
				turns_after_start = 6,
				faction = "phar_main_al_khufu_invasion_kemet",
				budget = 12000,
				unit_count = 19,
				starting_position =
				{
					492,
					838,
				},
				raid_position =
				{
					487,
					853,
				},
			},
		},
		{
			key = "colossal_statues",
			display_name_key = "phar_main_al_khufu_colossals_title",
			region_key = "phar_main_pi_ramesses_per_amun",
			slot_number = 8,
			sacked_building_record = "phar_main_al_khufu_colossals_sacked",
			building_under_construction_record = "phar_main_al_khufu_colossals_under_construction",
			finished_building_record = "phar_main_al_khufu_colossals_complete",
			effect_bundle = "phar_main_effect_bundle_al_khufu_dummy_statues_effects",
			-- UI images
			image_locked = "UI/skins/default/legacy_khufu/wonders/colossal_statues/image_colossal_statues_locked.png",
			image_to_be_constructed = "UI/skins/default/legacy_khufu/wonders/colossal_statues/image_colossal_statues_to_be_constructed.png",
			image_under_construction = "UI/skins/default/legacy_khufu/wonders/colossal_statues/image_colossal_statues_in_construction.png",
			image_finished = "UI/skins/default/legacy_khufu/wonders/colossal_statues/image_colossal_statues_constructed.png",
			image_foundation = "UI/skins/default/legacy_khufu/wonders/colossal_statues/image_big_colossal_statues_foundation.png",
			effect_bundle_icon = "ui/buildings/icons/ers_pips/icon_building_colossal_statues.png",
			special_effects = {},
			image_stages =
			{
				"UI/skins/default/legacy_khufu/wonders/colossal_statues/image_big_colossal_statues_upgrade_1.png",
				"UI/skins/default/legacy_khufu/wonders/colossal_statues/image_big_colossal_statues_upgrade_2.png",
				"UI/skins/default/legacy_khufu/wonders/colossal_statues/image_big_colossal_statues_upgrade_3.png",
			},
			mask_image = "UI/skins/default/legacy_khufu/wonders/colossal_statues/image_colossal_statues_mask.png",
			-- Foundation + embelishments go here
			stages =
			{
				{
					-- Foundations are mandatory!
					key = "foundation",
					display_name_key = "phar_main_al_khufu_stage_foundation_title",
					display_tooltip_key = "phar_main_al_khufu_stage_foundation_tooltip",
					cost = "phar_main_al_khufu_colossals_foundation",
					construction_time = 12,
					regional_supply =
					{
						{
							building_record = "phar_main_all_resource_production_stone_mine_2",
							percentage_discount = 50,
						},
					},
				},
				{
					key = "embelishment_1",
					display_name_key = "phar_main_al_khufu_colossals_embelishment_1_crowns_title",
					display_tooltip_key = "phar_main_al_khufu_colossals_embelishment_1_crowns_tooltip",
					cost = "phar_main_al_khufu_colossals_embelishment_1_crowns",
					construction_time = 9,
					regional_supply =
					{
						{
							building_record = "phar_main_all_resource_production_wood_port_nile_2",
							percentage_discount = 50,
						},
					},
				},
				{
					key = "embelishment_2",
					display_name_key = "phar_main_al_khufu_colossals_embelishment_2_paint_title",
					display_tooltip_key = "phar_main_al_khufu_colossals_embelishment_2_paint_tooltip",
					cost = "phar_main_al_khufu_colossals_embelishment_2_paint",
					construction_time = 9,
					regional_supply =
					{
						{
							building_record = "phar_main_all_province_management_happiness_type_c_3",
							percentage_discount = 50,
						},
					},
				},
				{
					key = "embelishment_3",
					display_name_key = "phar_main_al_khufu_colossals_embelishment_3_quarters_title",
					display_tooltip_key = "phar_main_al_khufu_colossals_embelishment_3_quarters_tooltip",
					cost = "phar_main_al_khufu_colossals_embelishment_3_quarters",
					construction_time = 6,
					regional_supply =
					{
						{
							building_record = "phar_main_all_military_native_type_b_lower_egypt_2",
							percentage_discount = 50,
						},
					},
				},
			},

			garrison_units =
			{
				{
					display_name_key = "phar_main_al_khufu_garrison_default_title",
					-- Use nil to make it free
					bundle_cost = nil,
					units =
					{
						{key = "phar_main_nat_low_lower_egyptian_spear_militia", count = 4},
						{key = "phar_main_nat_low_lower_egyptian_militia_slingers", count = 3},
					}
				},
				{
					display_name_key = "phar_main_al_khufu_garrison_medium_title",
					bundle_cost = "phar_main_al_khufu_garrison_medium",
					units =
					{
						{key = "phar_main_nat_low_lower_egyptian_axe_conscripts", count = 2},
						{key = "phar_main_nat_low_lower_egyptian_militia_slingers", count = 1},
						{key = "phar_main_nat_low_lower_egyptian_veteran_spearmen", count = 3},
						{key = "phar_main_nat_low_lower_egyptian_archers", count = 3},
					}
				},
				{
					display_name_key = "phar_main_al_khufu_garrison_expensive_title",
					bundle_cost = "phar_main_al_khufu_garrison_expensive",
					units =
					{
						{key = "phar_main_nat_low_lower_egyptian_veteran_spearmen", count = 2},
						{key = "phar_main_nat_low_lower_egyptian_veteran_swordsmen", count = 2},
						{key = "phar_main_nat_low_egyptian_chariots", count = 2},
						{key = "phar_main_nat_low_armoured_lower_egyptian_archers", count = 3},
					}
				},
			},

			invasion =
			{
				turns_after_start = 6,
				faction = "phar_main_al_khufu_invasion_kemet",
				budget = 12000,
				unit_count = 19,
				starting_position =
				{
					600,
					945,
				},
				raid_position =
				{
					600,
					945,
				},
			},
		},
		{
			key = "black_obelisk",
			display_name_key = "phar_main_al_khufu_obelisk_title",
			region_key = "phar_main_akhmim_akhmim",
			slot_number = 10,
			sacked_building_record = "phar_main_al_khufu_obelisk_sacked",
			building_under_construction_record = "phar_main_al_khufu_obelisk_under_construction",
			finished_building_record = "phar_main_al_khufu_obelisk_complete",
			effect_bundle = "phar_main_effect_bundle_al_khufu_dummy_obelisk_effects",
			-- UI images
			image_locked = "UI/skins/default/legacy_khufu/wonders/obelisk/image_obelisk_locked.png",
			image_to_be_constructed = "UI/skins/default/legacy_khufu/wonders/obelisk/image_obelisk_to_be_constructed.png",
			image_under_construction = "UI/skins/default/legacy_khufu/wonders/obelisk/image_obelisk_in_construction.png",
			image_finished = "UI/skins/default/legacy_khufu/wonders/obelisk/image_obelisk_constructed.png",
			image_foundation = "UI/skins/default/legacy_khufu/wonders/obelisk/image_big_obelisk_foundation.png",
			effect_bundle_icon = "ui/buildings/icons/ers_pips/icon_building_black_obelisk.png",
			image_stages =
			{
				"UI/skins/default/legacy_khufu/wonders/obelisk/image_big_obelisk_upgrade_1.png",
				"UI/skins/default/legacy_khufu/wonders/obelisk/image_big_obelisk_upgrade_2.png",
				"UI/skins/default/legacy_khufu/wonders/obelisk/image_big_obelisk_upgrade_3.png",
			},
			mask_image = "UI/skins/default/legacy_khufu/wonders/obelisk/image_obelisk_mask.png",
			special_effects =
			{
				effect_bundles =
				{
					{
						bundle_key = "phar_main_effect_bundle_al_khufu_obelisk_mine_income",
						apply_to_province = true,
					}
				},
				realms =
				{
					"egyptian_nubia_realm",
					"egyptian_kush_realm",
				},
			},
			-- Foundation + embelishments go here
			stages =
			{
				{
					-- Foundations are mandatory!
					key = "foundation",
					display_name_key = "phar_main_al_khufu_stage_foundation_title",
					display_tooltip_key = "phar_main_al_khufu_stage_foundation_tooltip",
					cost = "phar_main_al_khufu_obelisk_foundation",
					construction_time = 9,
					regional_supply =
					{
						{
							building_record = "phar_main_all_resource_production_wood_port_nile_2",
							percentage_discount = 50,
						},
					},
				},
				{
					key = "embelishment_1",
					display_name_key = "phar_main_al_khufu_obelisk_embelishment_1_inscriptions_title",
					display_tooltip_key = "phar_main_al_khufu_obelisk_embelishment_1_inscriptions_tooltip",
					cost = "phar_main_al_khufu_obelisk_embelishment_1_inscriptions",
					construction_time = 9,
					regional_supply =
					{
						{
							building_record = "phar_main_all_resource_production_modifier_gold_3",
							percentage_discount = 50,
						},
					},
				},
				{
					key = "embelishment_2",
					display_name_key = "phar_main_al_khufu_obelisk_embelishment_2_pyramidion_title",
					display_tooltip_key = "phar_main_al_khufu_obelisk_embelishment_2_pyramidion_tooltip",
					cost = "phar_main_al_khufu_obelisk_embelishment_2_pyramidion",
					construction_time = 12,
					regional_supply =
					{
						{
							building_record = "phar_main_all_resource_production_modifier_gold_3",
							percentage_discount = 50,
						},
					},
				},
				{
					key = "embelishment_3",
					display_name_key = "phar_main_al_khufu_obelisk_embelishment_3_baboons_title",
					display_tooltip_key = "phar_main_al_khufu_obelisk_embelishment_3_baboons_tooltip",
					cost = "phar_main_al_khufu_obelisk_embelishment_3_baboons",
					construction_time = 6,
					regional_supply =
					{
						{
							building_record = "phar_main_all_province_management_happiness_type_c_3",
							percentage_discount = 50,
						},
					},
				},
			},

			garrison_units =
			{
				{
					display_name_key = "phar_main_al_khufu_garrison_default_title",
					-- Use nil to make it free
					bundle_cost = nil,
					units =
					{
						{key = "phar_main_nat_upp_upper_egyptian_militia_clubmen", count = 4},
						{key = "phar_main_nat_upp_upper_egyptian_militia_slingers", count = 3},
					}
				},
				{
					display_name_key = "phar_main_al_khufu_garrison_medium_title",
					bundle_cost = "phar_main_al_khufu_garrison_medium",
					units =
					{
						{key = "phar_main_nat_upp_upper_egyptian_conscripted_axemen", count = 2},
						{key = "phar_main_nat_upp_upper_egyptian_militia_slingers", count = 1},
						{key = "phar_main_nat_upp_upper_egyptian_spearmen", count = 3},
						{key = "phar_main_nat_upp_upper_egyptian_archers", count = 3},
					}
				},
				{
					display_name_key = "phar_main_al_khufu_garrison_expensive_title",
					bundle_cost = "phar_main_al_khufu_garrison_expensive",
					units =
					{
						{key = "phar_main_nat_upp_upper_egyptian_spearmen", count = 3},
						{key = "phar_main_nat_upp_upper_egyptian_swordsmen", count = 2},
						{key = "phar_main_nat_upp_upper_egyptian_renowned_archers", count = 1},
						{key = "phar_main_nat_upp_upper_egyptian_javelin_throwers", count = 2},
						{key = "phar_main_nat_upp_egyptian_chariots", count = 1},
					}
				},
			},

			invasion =
			{
				turns_after_start = 6,
				faction = "phar_main_al_khufu_invasion_nubians",
				budget = 12000,
				unit_count = 19,
				starting_position =
				{
					532,
					689,
				},
				raid_position =
				{
					536,
					682,
				},
			},
		},
		{
			key = "mortuary_temple",
			display_name_key = "phar_main_al_khufu_temple_title",
			region_key = "phar_main_thebes_sma_ua",
			slot_number = 9,
			sacked_building_record = "phar_main_al_khufu_temple_sacked",
			building_under_construction_record = "phar_main_al_khufu_temple_under_construction",
			finished_building_record = "phar_main_al_khufu_temple_complete",
			effect_bundle = "phar_main_effect_bundle_al_khufu_dummy_temple_effects",
			-- UI images
			image_locked = "UI/skins/default/legacy_khufu/wonders/mortuary_temple/image_mortuary_temple_locked.png",
			image_to_be_constructed = "UI/skins/default/legacy_khufu/wonders/mortuary_temple/image_mortuary_temple_to_be_constructed.png",
			image_under_construction = "UI/skins/default/legacy_khufu/wonders/mortuary_temple/image_mortuary_temple_in_construction.png",
			image_finished = "UI/skins/default/legacy_khufu/wonders/mortuary_temple/image_mortuary_temple_constructed.png",
			image_foundation = "UI/skins/default/legacy_khufu/wonders/mortuary_temple/image_big_mortuary_temple_foundation.png",
			effect_bundle_icon = "ui/buildings/icons/ers_pips/icon_building_mortuary_temple.png",
			image_stages =
			{
				"UI/skins/default/legacy_khufu/wonders/mortuary_temple/image_big_mortuary_temple_upgrade_1.png",
				"UI/skins/default/legacy_khufu/wonders/mortuary_temple/image_big_mortuary_temple_upgrade_2.png",
				"UI/skins/default/legacy_khufu/wonders/mortuary_temple/image_big_mortuary_temple_upgrade_3.png",
			},
			mask_image = "UI/skins/default/legacy_khufu/wonders/mortuary_temple/image_mortuary_temple_mask.png",
			special_effects = {},
			-- Foundation + embelishments go here
			stages =
			{
				{
					-- Foundations are mandatory!
					key = "foundation",
					display_name_key = "phar_main_al_khufu_stage_foundation_title",
					display_tooltip_key = "phar_main_al_khufu_stage_foundation_tooltip",
					cost = "phar_main_al_khufu_temple_foundation",
					construction_time = 9,
					regional_supply =
					{
						{
							building_record = "phar_main_all_resource_production_stone_mine_2",
							percentage_discount = 50,
						},
					},
				},
				{
					key = "embelishment_1",
					display_name_key = "phar_main_al_khufu_temple_embelishment_1_statues_title",
					display_tooltip_key = "phar_main_al_khufu_temple_embelishment_1_statues_tooltip",
					cost = "phar_main_al_khufu_temple_embelishment_1_statues",
					construction_time = 9,
					regional_supply =
					{
						{
							building_record = "phar_main_religion_cult_center_grand_temple_amun_1",
							percentage_discount = 50,
						},
					},
				},
				{
					key = "embelishment_2",
					display_name_key = "phar_main_al_khufu_temple_embelishment_2_boat_title",
					display_tooltip_key = "phar_main_al_khufu_temple_embelishment_2_boat_tooltip",
					cost = "phar_main_al_khufu_temple_embelishment_2_boat",
					construction_time = 12,
					regional_supply =
					{
						{
							building_record = "phar_main_all_resource_production_wood_port_nile_2",
							percentage_discount = 50,
						},
					},
				},
				{
					key = "embelishment_3",
					display_name_key = "phar_main_al_khufu_temple_embelishment_3_offerings_title",
					display_tooltip_key = "phar_main_al_khufu_temple_embelishment_3_offerings_tooltip",
					cost = "phar_main_al_khufu_temple_embelishment_3_offerings",
					construction_time = 6,
					regional_supply =
					{
						{
							building_record = "phar_main_all_resource_production_food_farm_type_a_nile_2",
							percentage_discount = 50,
						},
					},
				},
			},

			garrison_units =
			{
				{
					display_name_key = "phar_main_al_khufu_garrison_default_title",
					-- Use nil to make it free
					bundle_cost = nil,
					units =
					{
						{key = "phar_main_nat_upp_upper_egyptian_militia_clubmen", count = 4},
						{key = "phar_main_nat_upp_upper_egyptian_militia_slingers", count = 3},
					}
				},
				{
					display_name_key = "phar_main_al_khufu_garrison_medium_title",
					bundle_cost = "phar_main_al_khufu_garrison_medium",
					units =
					{
						{key = "phar_main_nat_upp_upper_egyptian_conscripted_axemen", count = 2},
						{key = "phar_main_nat_upp_upper_egyptian_militia_slingers", count = 1},
						{key = "phar_main_nat_upp_upper_egyptian_spearmen", count = 3},
						{key = "phar_main_nat_upp_upper_egyptian_archers", count = 3},
					}
				},
				{
					display_name_key = "phar_main_al_khufu_garrison_expensive_title",
					bundle_cost = "phar_main_al_khufu_garrison_expensive",
					units =
					{
						{key = "phar_main_nat_upp_upper_egyptian_spearmen", count = 3},
						{key = "phar_main_nat_upp_upper_egyptian_swordsmen", count = 2},
						{key = "phar_main_nat_upp_upper_egyptian_renowned_archers", count = 1},
						{key = "phar_main_nat_upp_upper_egyptian_javelin_throwers", count = 2},
						{key = "phar_main_nat_upp_egyptian_chariots", count = 1},
					}
				},
			},

			invasion =
			{
				turns_after_start = 6,
				faction = "phar_main_al_khufu_invasion_nubians",
				budget = 12000,
				unit_count = 19,
				starting_position =
				{
					600,
					578,
				},
				raid_position =
				{
					603,
					603,
				},
			},
		},
	},

	stage_completed_incident = {
		title_foundation = "ui_text_replacements_localised_text_phar_main_al_khufu_stage_completed_event_feed_title_foundation",
		title_embellishment = "ui_text_replacements_localised_text_phar_main_al_khufu_stage_completed_event_feed_title_embellishment",
		primary_detail = "ui_text_replacements_localised_text_phar_main_al_khufu_stage_completed_event_feed_subtitle",
		secondary_detail = "ui_text_replacements_localised_text_phar_main_al_khufu_stage_completed_event_feed_desc",
		pic = 2134,
	},
	stage_completed_effect_bundle = "phar_main_effect_bundle_al_khufu_stage_completed",
	stage_completed_effect_bundle_duration = 4,

	-- Tooltip explaining you need to build foundation first
	missing_foundation_tooltip_record = "ui_text_replacements_localised_text_phar_khufu_missing_foundation",

	-- Tooltip for insufficient resources when trying to build a stage
	insufficient_resources_tooltip_record = "ui_text_replacements_localised_text_phar_khufu_insufficient_resources",

	-- Tooltip for damaged wonder when trying to build a stage
	damaged_wonder_tooltip_record = "ui_text_replacements_localised_text_phar_khufu_damaged_wonder",

	-- Tooltip for explaining wonder slot is already filled
	wonder_slot_filled_record = "ui_text_replacements_localised_text_phar_khufu_wonder_slot_filled",

	-- Tooltip explaining which settlement to conquer in order to build the wonder
	wonder_settlement_tooltip_record = "ui_text_replacements_localised_text_phar_main_al_khufu_setlement_tooltip",

	-- Construction time reduced per each follower spent
	follower_time_reduction = 1,
	-- Minimal amount of turns remaining after spending followers
	followers_min_time = 1,

	-- Text for unequipped ancillaries when spending followers
	unequipped_ancillary_display_name_key = "ui_text_replacements_localised_text_phar_khufu_wonder_plah_text",

	-- Text for confirmation after selecting Foundation and garrison
	garrison_confirmation_key = "ui_text_replacements_localised_text_phar_main_al_khufu_garrison_confirmation",

	-- Text for confirmation of starting the construction of a stage
	stage_start_confirmation_key = "ui_text_replacements_localised_text_phar_main_al_khufu_stage_start_confirmation",

	-- Text for confirmation of canceling the construction of a stage
	stage_cancel_confirmation_key = "ui_text_replacements_localised_text_phar_main_al_khufu_stage_cancel_confirmation",

	-- Text for confirmation of spending followers on wonder construction
	spend_followers_confirmation_key = "ui_text_replacements_localised_text_phar_main_al_khufu_spend_follower_confirmation",

	-- Text for confirmation of repairing wonder
	repair_wonder_confirmation_key = "ui_text_replacements_localised_text_phar_main_al_khufu_repair_wonder_confirmation",

	ancillary_assigned_to_general_key = "ui_text_replacements_localised_text_ancillary_assigned_to_general",

	wonder_effects_warning_key = "ui_text_replacements_localised_text_phar_main_al_khufu_wonder_effects_warning",

	resource_factor = "buildings",

	construction_states =
	{
		not_started = "not_started",
		under_construction = "under_construction",
		damaged = "damaged",
		finished = "finished",
	},

	can_start_stage_errors =
	{
		no_foundation = 0,
		insufficient_resources = 1,
		damaged_wonder = 2,
	},

	component_ids =
	{
		panel = "legacy_khufu",
		legacy_button = "button_fm_phar_khufu",
		alert_icon = "khufu_alert_icon",
		wonder_details_panel = "selected_wonder",
		wonder_selection_screen = "wonder_selection_screen",
		wonder_cards_holder = "wonder_cards_holder",
		wonder_cards_list_view = "listview",
		wonder_cards_list_clip = "list_clip",
		wonder_cards_list_box = "list_box",
		card_wonder_template = "card_wonder_template",
		wonder_title = "title_txt",
		wonder_image = "wonder_template",
		wonder_state_icon = "wonder_state_icon",
		wonder_prefix = "wonder_",
		stage_prefix = "stage_",
		status_damaged = "status_damaged",
		wonder_construct = "button_construct",
		wonder_finished = "button_finished",
		wonder_repair = "button_repair",
		wonder_effect_bundle_icon = "effect_bundle_icon",
		wonder_key_property = "wonder_key",
		stage_key_property = "stage_key",
		general_cqi_property = "general_cqi",
		status_container = "status_container",
		status_icon = "status",
		button_location = "button_zoom_location",
		turns_remaining = "dy_txt",
		build_status = "build_status",
		build_status_lock = "lock",
		build_status_stages =
		{
			"foundation",
			"upgrade_1",
			"upgrade_2",
			"upgrade_3",
		},

		tab_holder = "tabgroup_wonders",
		tab_template = "button_template",
		tab_prefix = "wonder_tab_",

		wonder_details_image_holder = "wonder_details_image_holder",
		wonder_details_wonder = "wonder_details_template",
		wonder_details_damaged = "destructed",
		wonder_details_title = "header_txt",
		wonder_details_info_button = "btn_show_screen_info",
		wonder_details_info_description = "description_tx",
		wonder_details_back_button = "button_back",
		wonder_details_stages = "container_wonder_stages",
		wonder_details_stages_list_clip = "list_clip",
		wonder_details_stages_list_box = "list_box",
		wonder_details_stage_template = "template_btn_embelishment",
		wonder_details_stage_name = "dy_stage_name",
		wonder_details_foundation = "btn_foundation",
		wonder_details_container_embelishments = "container_embelishments",
		wonder_details_effects_holder = "effects_holder",
		wonder_details_effect_bundle = "effect_bundle",
		wonder_details_effects = "wonder_effects",
		wonder_details_effect_explanation = "about_txt",
		wonder_details_stage_images =
		{
			"upgrade_1",
			"upgrade_2",
			"upgrade_3",
		},
		stage_build_button = "button_build",
		stage_cancel_button = "button_cancel_construction",
		stage_progress_bar = "progress_bar",
		stage_resource_cost = "resource_cost",
		stage_turn_cost = "progress_text",
		stage_progress_icon = "progress_icon",
		stage_progress_text = "progress_text",
		stage_progress_fill = "progress_bar",
		stage_progress_container = "progress_bar_container",
		stage_followers_button = "button_assign_experts",
		stage_followers_count = "dy_experts",
		stage_open_ancillaries = "button_open_ancillary_panel",
		stage_regional_supply = "icon_regional_supply",
		stage_property = "stage_property",

		dev_button_stage_complete = "dev_button_complete_stage",

		ancillary_selector = "ancillary_selector",
		ancillary_selector_close = "button_close_ancillary_selector",
		ancillary_spend_button = "button_spend_ancillaries",
		ancillary_cancel_button = "button_ancillaries_cancel",
		ancillary_selector_listview = "listview",
		ancillary_selector_list_box = "list_box",
		ancillary_template = "button_ancillary_toggle",
		ancillary_prefix = "ancillary_instance_",
		ancillary_key_property = "ancillary_key",
		ancillary_icon_parent = "equipment_items_frame",
		ancillary_icon = "icon",
		ancillary_turns = "cooldown_turn",
		ancillary_name_parent = "desc_effect_parent",
		ancillary_name = "dy_name",
		ancillary_unequipped_text = "dy_unequipped_text",
		ancillary_selector_turns = "turns_to_reduce",
		ancillary_counter = "ancillary_counter",

		location_container = "location_container",
		owner_text = "tx_static",
		repair_button = "btn_repair",

		garrison = "garrison",
		garrison_slots = "garrison_slots",
		garrison_slot_prefix = "garrison_slot_",
		garrison_unit = "adventurer_slot",
		garrison_recruitment = "recruit_garrison",
		garrison_recruitment_close = "button_close_recruitment",
		garrison_unit_card = "land_unit_card",
		garrison_bundle = "template_candidate_frame_bundle",
		garrison_bundle_title = "dy_bundle_name",
		garrison_bundle_cost_container = "garrison_cost",
		garrison_bundle_cost = "resource_template",
		garrison_bundle_prefix = "garrison_bundle_",
		garrison_unit_prefix = "garrison_unit_",
		garrison_bundle_index_property = "bundle_index",
		garrison_unit_list_container = "unit_list_container",
		garrison_unit_cards_list = "unit_cards_list",
		garrison_list_view = "listview",
		garrison_list_clip = "list_clip",
		garrison_list_box = "list_box",
		garrison_unit_card_prefix = "unit_card_",
	},

	cco_ids =
	{
		wonder_effect_bundle_icon_prefix = "wonder_effect_bundle_",
	},

	-- For debugging purposes
	-- lower value means more messages get printed
	-- priority 10 - errors showing something is seriously broken
	-- no priority given - everything else, wonder construction star, finish, damage, etc.
	min_priority_to_print = 0,
}

-- This script is managed by ancient_legacy_common!
-- there will be a separate script instance for every faction that claims this
-- this means you should use self.persistent instead of ancient_legacies_khufu.persistent
-- self.persistent will be your data, while ancient_legacies_khufu.persistent will be the template
ancient_legacies_khufu = {

	config = khufu_config,
	persistent = {
		active_faction = false,
	},

	-- ancient_legacy_common.persistent.common_persistent will be filled with copies of wonder_data_template for each started wonder
	wonder_data_template =
	{
		key = nil,
		owner_faction = nil,
		state = khufu_config.construction_states.not_started,
		state_after_repair = nil,
		turn_started = -1,
		invasion_key = nil,
		-- downgrading to sacked building level triggers BUildingDemolished events which should be ignored
		ignore_next_building_demolished_event = false,
		--[[ stage_construction_data is in the form 
		{ 
			key = X,
			construction_time = Y,
			turns_in_construction = Z, -- this can be influenced by spending followers, etc.
			state = W,
			state_after_repair = V,
		 }]]--
		stage_data = {},
	},

	-- temp data for UI
	ui_data =
	{
		templates = {},
		ancillary_components = {},
	},

	-- messages only get printed if their priority is at least min_priority_to_print
	-- or if min_priority_to_print is negative
	output = function (self, str, priority)
		if not str then
			return
		end

		if khufu_config.min_priority_to_print > 0 then
			if not priority or khufu_config.min_priority_to_print > priority then
				return
			end
		end

		out("*** _AL_KHUFU_ ***: " .. str)
	end,

	get_wonder_config = function(self, key)
		return table_find(khufu_config.wonders, function(e) return e.key == key end)
	end,

	get_stage_config = function(self, wonder_key, stage_key)
		local wonder_config = table_find(khufu_config.wonders, function(e) return e.key == wonder_key end)
		if not wonder_config then
			self:output("Error: Invalid wonder key " .. tostring(wonder_key), 10)
			return nil
		end
		return table_find(wonder_config.stages, function(e) return e.key == stage_key end)
	end,

	get_wonder_slot = function(self, wonder_key)
		local wonder = self:get_wonder_config(wonder_key)
		if not wonder then
			self:output("Error: Invalid wonder key " .. tostring(wonder_key), 10)
			return nil
		end

		local region = cm:model():world():region_manager():region_by_key(wonder.region_key)
		if not region then
			self:output("Error: Invalid wonder region " .. tostring(wonder.region_key), 10)
			return nil
		end

		local slot_number = wonder.slot_number
		local region_slots = region:slot_list()
		if region_slots:num_items() < slot_number then
			self:output("Error: Invalid slot number " .. slot_number .. " for wonder region " .. tostring(wonder.region_key), 10)
			return nil
		end

		return region_slots:item_at(slot_number)
	end,

	get_common_wonder_data = function(self)
		return ancient_legacy_common:get_legacy_common_persistent("phar_ancient_legacy_khufu")
	end,

	get_wonder_data = function(self, wonder_key)
		return table_find(self.get_common_wonder_data(), function(e) return e.key == wonder_key end)
	end,

	get_owned_wonder_data = function(self)
		local owned_wonder_data = {}
		local common_wonder_data = self:get_common_wonder_data()
		for _, wonder_data in ipairs(common_wonder_data) do
			if wonder_data.owner_faction == self.persistent.active_faction then
				table.insert(owned_wonder_data, wonder_data)
			end
		end

		return owned_wonder_data
	end,

	get_wonder_keys_for_owned_regions = function(self)
		local wonder_keys_for_owned_regions = {}
		for _, wonder in ipairs(khufu_config.wonders) do
			local region = cm:get_region(wonder.region_key)
			if not region or region:is_null_interface() then
				self:output("Could not find region " .. wonder.region_key, 10)
			else
				if self.persistent.active_faction == region:owning_faction():name() then
					table.insert(wonder_keys_for_owned_regions, wonder.key)
				end
			end
		end

		return wonder_keys_for_owned_regions
	end,

	get_wonder_data_by_region = function(self, region_key)
		return table_find(self.get_common_wonder_data(), function(e)
			local wonder_config = self:get_wonder_config(e.key)
			return wonder_config and wonder_config.region_key == region_key
		 end)
	end,

	get_stage_construction_data = function(self, wonder_key, stage_key)
		local wonder_data = self:get_wonder_data(wonder_key)
		if not wonder_data then
			return nil
		end
		return table_find(wonder_data.stage_data, function(e) return e.key == stage_key end)
	end,

	get_wonder_by_building_key = function(self, building_key)
		local wonder = table_find(khufu_config.wonders,
			function(e) return e.building_under_construction_record == building_key
				or e.finished_building_record == building_key
				or e.sacked_building_record == building_key
			end)
		return wonder
	end,

	on_legacy_claimed = function(self, faction_key)
		local local_faction = cm:get_local_faction_name(true)

		self.persistent.active_faction = faction_key

		local faction = cm:get_faction(faction_key)
		if not faction:is_human() then
			self:ai_handle_wonder_regions()
		end

		if (faction_key == local_faction) then
			egypt_political_states:activate_button(khufu_config.component_ids.legacy_button, true)
		end

		self:update_possible_construction_alert()
	end,

--------------------------------------------------------------
---------------------CONSTRUCTION-----------------------------
--------------------------------------------------------------

	restrict_buildings = function(faction_key, restrict)
		local buildings_to_lock = {}

		for _, wonder_data in ipairs(khufu_config.wonders) do
			table.insert(buildings_to_lock, wonder_data.building_under_construction_record)
			table.insert(buildings_to_lock, wonder_data.finished_building_record)
			table.insert(buildings_to_lock, wonder_data.sacked_building_record)
		end
		table.sort(buildings_to_lock)

		cm:restrict_buildings_for_faction(faction_key, buildings_to_lock, restrict)
	end,

	-- Returns 3 values:
	--  can the construction start
	-- -error message to print if the construction cannot start
	-- -error code from can_start_stage_errors table (if there is an appropriate code)
	can_start_stage_construction = function(self, wonder_key, stage_key, ignore_cost)
		local faction_key = self.persistent.active_faction
		local wonder_config = self:get_wonder_config(wonder_key)

		if not wonder_config then
			return false, "Error: Invalid wonder key " .. tostring(wonder_key)
		end

		local wonder_data = self:get_wonder_data(wonder_key)

		if stage_key ~= "foundation" and
			(not wonder_data
			or self:get_stage_construction_data(wonder_key, "foundation").state ~= khufu_config.construction_states.finished)
		 then
			return false,
				"Error: Foundation for wonder " .. tostring(wonder_key) .. " for faction " .. faction_key .. " not finished while trying to start stage " .. tostring(stage_key),
				khufu_config.can_start_stage_errors.no_foundation
		end

		local region = cm:model():world():region_manager():region_by_key(wonder_config.region_key)
		if not region then
			return false, "Error: Region " .. tostring(wonder_config.region_key) .. " not found"
		end

		if not region:owning_faction() then
			return false, "Error: Region " .. tostring(wonder_config.region_key) .. " not owned by any faction"
		end

		if region:owning_faction():name() ~= faction_key then
			return false, "Error: Region " .. tostring(wonder_config.region_key) .. " not owned by faction " .. faction_key .. " but by " .. tostring(region:owning_faction():name())
		end

		local region_slots = region:slot_list()
		if region_slots:num_items() < wonder_config.slot_number then
			return false, "Error: Invalid slot number " .. tostring(wonder_config.slot_number) .. " for wonder region " .. tostring(wonder_config.region_key)
		end

		local slot = region_slots:item_at(wonder_config.slot_number)
		if stage_key == "foundation"
		and ((slot:building() and not slot:building():is_null_interface())
		or slot:is_there_construction()) then
			return false, "Error: Wonder building slot is not empty before construction for wonder " .. wonder_key .. ", faction " ..faction_key
		end

		if wonder_data and wonder_data.state == khufu_config.construction_states.damaged then
			return false,
				"Error: " .. tostring(wonder_key) .. " is damaged, cannot build stage " .. tostring(stage_key),
				khufu_config.can_start_stage_errors.damaged_wonder
		end

		local stage_data = self:get_stage_construction_data(wonder_key, stage_key)
		if stage_data then
			return false, "Error: Stage " ..  tostring(stage_key) .. " for wonder " .. tostring(wonder_key) .. " for faction " .. faction_key .. " already started"
		end

		local foundation_stage_config = self:get_stage_config(wonder_key, "foundation")
		if not foundation_stage_config then
			return false, "Error: No foundation found for wonder " ..  tostring(wonder_key)
		end

		if not ignore_cost then
			local resources = self:get_stage_cost_after_discount(wonder_key, stage_key)
			local faction = cm:get_faction(faction_key)
			for i = 1, #resources do
				local faction_pooled_resource = faction:pooled_resource(resources[i][1]):value()
				if faction_pooled_resource < -resources[i][2] then
					return false,
						"Error: Faction " .. faction_key .. " doesn't have enough resources for stage " .. stage_key .. " of wonder " .. wonder_key,
						khufu_config.can_start_stage_errors.insufficient_resources
				end
			end
		end

		return true, ""
	end,

	stage_construction_start = function(self, wonder_key, stage_key, ignore_cost)
		local can_start, can_start_error = self:can_start_stage_construction(wonder_key, stage_key, ignore_cost)
		if not can_start then
			self:output(can_start_error, 10)
			return
		end

		local faction_key = self.persistent.active_faction
		local wonder_config = self:get_wonder_config(wonder_key)

		local stage_config = self:get_stage_config(wonder_key, stage_key)

		local regional_supply_discount = 0
		if not ignore_cost then
			-- Wonders should not be affected by cost reducing bonuses, so we expend the cost manually. The record of the wonder should not contain a cost!
			local resource_cost = cm:create_new_custom_resource_cost()
			resource_cost:get_cost_from_record(stage_config.cost)
			regional_supply_discount = self:get_regional_supply_discount(wonder_key, stage_key)
			local resources = resource_cost:resources()

			for i = 1, #resources do
				cm:faction_add_pooled_resource(faction_key, resources[i][1], khufu_config.resource_factor, resources[i][2] * (100 - regional_supply_discount) / 100)
			end
		end
		
		local wonder_data
		-- Put the building model on the map and add wonder data
		if stage_key == "foundation" then
			self.restrict_buildings(faction_key, false)
			-- Each higher level building requires the previous to already be built, so we build them in sequence
			cm:instantly_build_building_in_region(wonder_config.region_key, wonder_config.slot_number, wonder_config.sacked_building_record, true)
			cm:instantly_build_building_in_region(wonder_config.region_key, wonder_config.slot_number, wonder_config.building_under_construction_record, true)
			self.restrict_buildings(faction_key, true)

			local common_persistent = self:get_common_wonder_data()
			table.insert(common_persistent, table_deep_copy(self.wonder_data_template))
			wonder_data = common_persistent[#common_persistent]
			wonder_data.key = wonder_key
			wonder_data.owner_faction = self.persistent.active_faction
			wonder_data.state = khufu_config.construction_states.under_construction
			wonder_data.turn_started = cm:turn_number()

			local faction_list = cm:get_human_factions()
			for _, curr_faction in ipairs(faction_list) do
				cm:add_event_feed_event("ancient_legacy_khufu_monument_started", curr_faction, 0, wonder_config.region_key .. ":" .. wonder_config.slot_number)
			end

			-- TODO: Mark as a high priority target for AI
			-- cm:cai_add_victory_region_slot - to be implemented
		else
			wonder_data = self:get_wonder_data(wonder_key)
		end

		table.insert(wonder_data.stage_data,
			{
				key = stage_key,
				construction_time = stage_config.construction_time,
				turns_in_construction = 0,
				state = khufu_config.construction_states.under_construction,
				used_regional_supply = regional_supply_discount > 0
			})

		if self.persistent.active_faction == cm:get_local_faction_name(true) then
			cm:notify_khufu_stage_construction_started(self.persistent.active_faction, wonder_key, stage_key)
		end
	end,

	can_cancel_stage = function(self, wonder_key, stage_key)
		if stage_key == "foundation" then
			return false
		end

		local stage_data = self:get_stage_construction_data(wonder_key, stage_key)
		if not stage_data then
			return false
		end

		if stage_data.state == khufu_config.construction_states.finished then
			return false
		end

		return true
	end,

	stage_construction_cancel = function(self, wonder_key, stage_key)
		local wonder_data = self:get_wonder_data(wonder_key)
		if not wonder_data then
			self:output("Error: trying to cancel stage " .. tostring(stage_key) .. " for wonder " .. tostring(wonder_key) .. " that is not built!", 10)
			return
		end

		local stage_index = table_find(wonder_data.stage_data, function(e) return e.key == stage_key end, true)
		local stage_data = wonder_data.stage_data[stage_index]
		local stage_config = self:get_stage_config(wonder_key, stage_key)

		-- Wonders should not be affected by cost reducing bonuses
		local resource_cost = cm:create_new_custom_resource_cost()
		resource_cost:get_cost_from_record(stage_config.cost)
		local regional_supply_discount = 0
		if stage_data.used_regional_supply then
			regional_supply_discount = self:get_regional_supply_discount(wonder_key, stage_key)
		end

		local resources = resource_cost:resources()
		local faction_key = wonder_data.owner_faction
		for i = 1, #resources do
			cm:faction_add_pooled_resource(faction_key, resources[i][1], khufu_config.resource_factor, -resources[i][2] * (100 - regional_supply_discount) / 100)
		end

		table.remove(wonder_data.stage_data, stage_index)
	end,

	start_wonder_repair = function(self, wonder_key)
		local wonder_config = self:get_wonder_config(wonder_key)
		if not wonder_config then
			self:output("Error: Invalid wonder key " .. tostring(wonder_key), 10)
			return
		end

		local region = cm:model():world():region_manager():region_by_key(wonder_config.region_key)
		if not region then
			self:output("Error: Region " .. tostring(wonder_config.region_key) .. " not found", 10)
			return
		end

		if not region:owning_faction() then
			self:output("Error: Region " .. tostring(wonder_config.region_key) .. " not owned by any faction", 10)
			return
		end

		local active_faction_key = self.persistent.active_faction
		if region:owning_faction():name() ~= active_faction_key then
			self:output("Error: Region " .. tostring(wonder_config.region_key) .. " not owned by faction " .. active_faction_key .. " but by " .. region:owning_faction():name(), 10)
			return
		end

		local region_slots = region:slot_list()
		if region_slots:num_items() < wonder_config.slot_number then
			self:output("Error: Invalid slot number " .. wonder_config.slot_number .. " for wonder region " .. tostring(wonder_config.region_key), 10)
			return
		end

		local slot = region_slots:item_at(wonder_config.slot_number)
		if not slot or slot:is_null_interface() then
			self:output("Error: Invalid slot with number " .. wonder_config.slot_number .. " for wonder region " .. tostring(wonder_config.region_key), 10)
			return
		end

		local building = slot and slot:building() or nil
		if not building or building:is_null_interface() then
			self:output("Error: Missing building for slot with number " .. wonder_config.slot_number .. " for wonder region " .. tostring(wonder_config.region_key), 10)
			return
		end

		local active_faction = cm:get_faction(active_faction_key)
		if not active_faction or active_faction:is_null_interface() then
			self:output("Error: No faction with key " .. active_faction_key .. " exists", 10)
			return
		end

		local repair_resource_cost = cm:create_new_custom_resource_cost()
		local repair_cost_key = cm:get_building_repair_override_cost_record_key(building:name())
		repair_resource_cost:get_cost_from_record(repair_cost_key)
		if not active_faction:can_afford_resource_cost_object(repair_resource_cost) then
			self:output("Error: Not enough resources for repair of wonder", 10)
			return
		end

		local wonder_data = self:get_wonder_data(wonder_key)
		if not wonder_data then
			self:output("Error: No data for wonder " .. wonder_key, 10)
			return
		end

		if wonder_data.state ~= khufu_config.construction_states.damaged then
			self:output("Error: Can't repair a wonder that isn't damaged", 10)
			return
		end


		cm:queue_building_repair(wonder_config.region_key, wonder_config.slot_number + 1, false)

		if active_faction_key == cm:get_local_faction_name(true) then
			self:display_wonder_details(wonder_key)
		end
	end,

	-- foundation and all embelishments are complete
	wonder_construction_complete = function(self, wonder_key)
		local faction_key = self.persistent.active_faction
		local wonder = self:get_wonder_config(wonder_key)

		if not wonder then
			self:output("Error: Invalid wonder key " .. tostring(wonder_key), 10)
			return nil
		end

		local region = cm:model():world():region_manager():region_by_key(wonder.region_key)
		if not region then
			self:output("Error: Region " .. tostring(wonder.region_key) .. " not found", 10)
			return
		end

		if not region:owning_faction() then
			self:output("Error: Region " .. tostring(wonder.region_key) .. " not owned by any faction", 10)
			return
		end

		if region:owning_faction():name() ~= faction_key then
			self:output("Error: Region " .. tostring(wonder.region_key) .. " not owned by faction " .. faction_key .. " but by " .. region:owning_faction():name(), 10)
			return
		end

		local region_slots = region:slot_list()
		if region_slots:num_items() < wonder.slot_number then
			self:output("Error: Invalid slot number " .. wonder.slot_number .. " for wonder region " .. tostring(wonder.region_key), 10)
			return nil
		end
		local slot = region_slots:item_at(wonder.slot_number)

		self.restrict_buildings(faction_key, false)
		cm:instantly_build_building_in_region(wonder.region_key, wonder.slot_number, wonder.finished_building_record, true)
		self.restrict_buildings(faction_key, true)

		local wonder_data = self:get_wonder_data(wonder_key)
		if wonder_data then
			wonder_data.state = khufu_config.construction_states.finished
			wonder_data.state_after_repair = khufu_config.construction_states.finished
			self:output("Faction " .. self.persistent.active_faction .. " completed wonder " .. wonder_data.key, 0)
		else
			self:output("Error: could not find construction data for finished wonder " .. tostring(wonder_key), 10)
			return
		end

		self:toggle_special_effects(wonder_key, true)

		local faction_list = cm:get_human_factions()
		for _, curr_faction in ipairs(faction_list) do
			cm:add_event_feed_event("ancient_legacy_khufu_monument_finished", curr_faction, 0, wonder.region_key .. ":" .. wonder.slot_number)
		end

		core:trigger_event("ScriptEventKhufuWonderCompleted", { faction = cm:get_faction(faction_key), wonder_key = wonder_data.key })
	end,

	stage_construction_completed = function(self, wonder_key, stage_key)
		local stage_data = self:get_stage_construction_data(wonder_key, stage_key)
		if not stage_data then
			return
		end

		local wonder_config = self:get_wonder_config(wonder_key)
		if not wonder_config then
			return
		end
		cm:apply_effect_bundle_to_region(khufu_config.stage_completed_effect_bundle, wonder_config.region_key, khufu_config.stage_completed_effect_bundle_duration)

		stage_data.state = khufu_config.construction_states.finished
		local event = khufu_config.stage_completed_incident
		local primary_detail = "ui_text_replacements_localised_text_" .. wonder_config.display_name_key
		local is_foundation = stage_key == "foundation"
		local event_title = is_foundation and event.title_foundation or event.title_embellishment
		cm:show_message_event(self.persistent.active_faction, event_title, primary_detail, event.secondary_detail, true, event.pic, nil, nil, true)

		-- Whole wonder completed
		if self:check_all_stages_finished(wonder_key) then
			self:wonder_construction_complete(wonder_key)
		end

		if self.persistent.active_faction == cm:get_local_faction_name(true) then
			cm:notify_khufu_stage_construction_completed(self.persistent.active_faction, wonder_key, stage_key)
		end
	end,

	check_all_stages_finished = function(self, wonder_key)
		local wonder_data = self:get_wonder_data(wonder_key)
		if not wonder_data then
			return false
		end

		-- not all stages were started
		local wonder_config = self:get_wonder_config(wonder_key)
		if wonder_config and (#wonder_data.stage_data ~= #wonder_config.stages) then
			return false
		end

		local all_finished = true
		for _, stage_data in ipairs(wonder_data.stage_data) do
			if stage_data.state ~= khufu_config.construction_states.finished then
				all_finished = false
				break
			end
		end
		return all_finished
	end,

	progress_construction = function(self)
		for _, wonder_data in ipairs(self:get_owned_wonder_data()) do
			if wonder_data.state == khufu_config.construction_states.under_construction	then
				for _, stage_data in ipairs(wonder_data.stage_data) do
					if stage_data.state == khufu_config.construction_states.under_construction then

						stage_data.turns_in_construction = stage_data.turns_in_construction + 1
						if stage_data.turns_in_construction >= stage_data.construction_time then
							self:stage_construction_completed(wonder_data.key, stage_data.key)
						end
					end
				end
			end
		end
	end,

	cheat_complete_stage = function(self, wonder_key, stage_key)
		local wonder_data = self:get_wonder_data(wonder_key)

		--Start wonder if it wasn't started
		if not wonder_data then
			self:stage_construction_start(wonder_key, "foundation", true)
		end

		-- Start stage if it wasn't started
		local stage_data = self:get_stage_construction_data(wonder_key, stage_key)
		if not stage_data then
			self:stage_construction_start(wonder_key, stage_key, true)
			stage_data = self:get_stage_construction_data(wonder_key, stage_key)
		end

		if stage_data.state ~= khufu_config.construction_states.finished then
			stage_data.turns_in_construction = stage_data.construction_time
			self:stage_construction_completed(wonder_key, stage_key)
		end

		self:display_wonder_stages(wonder_key)
	end,

	toggle_special_effects = function(self, wonder_key, apply)
		local wonder = self:get_wonder_config(wonder_key)

		if not wonder then
			self:output("Error: Invalid wonder key " .. tostring(wonder_key), 10)
			return
		end

		local special_effect_bundles = wonder.special_effects.effect_bundles or {}
		local special_effect_realms = wonder.special_effects.realms or {}
		local special_effect_region_lists = wonder.special_effects.region_lists or {}
		for _, bundle in ipairs(special_effect_bundles) do
			for _, realm in ipairs(special_effect_realms) do
				local realm_data = phar_realms.get_realm(realm)
				if realm_data and realm_data.regions then
					for _, region in ipairs(realm_data.regions) do
						self:toggle_special_effect_on_region(bundle, region, apply)
					end
				end
			end
			for _, region_list in ipairs(special_effect_region_lists) do
				for _, region in ipairs(region_list) do
					self:toggle_special_effect_on_region(bundle, region, apply)
				end
			end
		end
	end,

	toggle_special_effect_on_region = function(self, bundle, region, apply)
		if apply then
			if bundle.apply_to_province then
				cm:apply_effect_bundle_to_province(bundle.bundle_key, region, 0)
				self:output("Applied effect bundle " .. bundle.bundle_key .. " to province of region " .. region)
			else
				cm:apply_effect_bundle_to_region(bundle.bundle_key, region, 0)
				self:output("Applied effect bundle " .. bundle.bundle_key .. " to region " .. region)
			end
		else
			if bundle.apply_to_province then
				cm:remove_effect_bundle_from_province(bundle.bundle_key, region)
				self:output("Removed effect bundle " .. bundle.bundle_key .. " from province of region " .. region)
			else
				cm:remove_effect_bundle_from_region(bundle.bundle_key, region)
				self:output("Removed effect bundle " .. bundle.bundle_key .. " from region " .. region)
			end
		end
	end,

	spawn_invasions = function(self)
		for _, wonder_data in ipairs(self:get_owned_wonder_data()) do
			if wonder_data.turn_started > 0 then
				local wonder_config = self:get_wonder_config(wonder_data.key)
				if wonder_config and cm:turn_number() - wonder_data.turn_started  == wonder_config.invasion.turns_after_start then
					self:trigger_invasion(wonder_data.key)
				end
			end
		end
	end,

	damage_wonder = function(self, region_key, building_health)
		local wonder_data = self:get_wonder_data_by_region(region_key)
		if not wonder_data then
			self:output("Error: Can't damage wonder in region " .. region_key .. " for faction " .. self.persistent.active_faction, 10)
			return
		end

		if wonder_data.state == khufu_config.construction_states.damaged then
			return
		end

		local wonder_config = self:get_wonder_config(wonder_data.key)

		wonder_data.state_after_repair = wonder_data.state
		for _, stage in ipairs(wonder_data.stage_data) do
			stage.state_after_repair = stage.state
			stage.state = khufu_config.construction_states.damaged
		end

		-- 3D model for damaged building is always for damaged finished building, so we change the building level to damaged only if current state is finished  
		if wonder_data.state == khufu_config.construction_states.finished then
			-- Downgrade to construction building level
			wonder_data.ignore_next_building_demolished_event = true
			cm:instantly_downgrade_building_in_region(region_key, wonder_config.slot_number, true)

			-- Downgrade to sacked building level
			wonder_data.ignore_next_building_demolished_event = true
			cm:instantly_downgrade_building_in_region(region_key, wonder_config.slot_number, true)
		end

		local in_construction = wonder_data.state == khufu_config.construction_states.under_construction
		-- This must be above instant_set_building_health_percent to not enter this function again
		wonder_data.state = khufu_config.construction_states.damaged
		local new_building_record = in_construction and wonder_config.building_under_construction_record or wonder_config.sacked_building_record
		cm:instant_set_building_health_percent(region_key, new_building_record, building_health)

		self:toggle_special_effects(wonder_data.key, false)
	end,

	repair_wonder = function(self, region_key)
		local wonder_data = self:get_wonder_data_by_region(region_key)
		if not wonder_data then
			self:output("Error: Can't repair wonder in region " .. region_key .. " for faction " .. self.persistent.active_faction, 10)
			return
		end

		if wonder_data.state ~= khufu_config.construction_states.damaged then
			self:output("Error: Trying to repair Wonder in region " .. region_key .. " for faction " .. self.persistent.active_faction .. " but it is not damaged", 10)
			return
		end

		wonder_data.state = wonder_data.state_after_repair
		for _, stage in ipairs(wonder_data.stage_data) do
			stage.state = stage.state_after_repair
		end

		local wonder_config = self:get_wonder_config(wonder_data.key)

		-- 3D model for damaged building is always for damaged finished building, so we change the building level to damaged only if current state is finished
		if wonder_data.state_after_repair == khufu_config.construction_states.finished then
			self.restrict_buildings(wonder_data.owner_faction, false)
			-- First complete the ongoing repair construction, otherwise there are problems with constructing the rest of the levels
			cm:instantly_build_building_in_region(region_key, wonder_config.slot_number, wonder_config.sacked_building_record, true)
	
			cm:instantly_build_building_in_region(region_key, wonder_config.slot_number, wonder_config.building_under_construction_record, true)
			-- Each higher level building requires the previous to already be built, so we build them in sequence
			cm:instantly_build_building_in_region(region_key, wonder_config.slot_number, wonder_config.finished_building_record, true)

			self.restrict_buildings(wonder_data.owner_faction, true)
		end

		self:toggle_special_effects(wonder_data.key, true)
	end,

	demolish_wonder = function(self, wonder_key)
		local common_wonder_data = self:get_common_wonder_data()
		local wonder_index = table_find(common_wonder_data, function(e) return e.key == wonder_key end, true)
		if wonder_index then
			-- demolishing is done throughout the whole building chain, not like regular buildings, because Khufu's implementation requires
			-- that we can easily go up/down on the chain
			local wonder_data = common_wonder_data[wonder_index]
			if not wonder_data.ignore_next_building_demolished_event then
				local remove_buildings_of_wonder = function()
					-- demolish_wonder is called when we have demolished one building level, so number of downgrades is always -1
					local downgrades = 0
					if wonder_data.state == khufu_config.construction_states.finished then
						downgrades = 2
					elseif wonder_data.state == khufu_config.construction_states.under_construction then
						downgrades = 1
					elseif wonder_data.state == khufu_config.construction_states.damaged and
					 		wonder_data.state_after_repair == khufu_config.construction_states.under_construction then
						downgrades = 1
					end

					local wonder_config = self:get_wonder_config(wonder_key)
					for i = 1, downgrades do
						cm:instantly_downgrade_building_in_region(wonder_config.region_key, wonder_config.slot_number, true)				
					end
				end

				-- since demolish_wonder is called from callback handler for BuildingDemolished we need to postpone demolishing the buildings
				cm:callback(remove_buildings_of_wonder, 0.1);

				self:toggle_special_effects(wonder_key, false)
				table.remove(common_wonder_data, wonder_index)
			else
				wonder_data.ignore_next_building_demolished_event = false
			end
		end
	end,

	get_regional_supply_discount = function(self, wonder_key, stage_key)
		local wonder_config = self:get_wonder_config(wonder_key)
		if not wonder_config then
			return 0
		end

		local stage_config = self:get_stage_config(wonder_key, stage_key)
		if not stage_config then
			return 0
		end

		local region = cm:get_region(wonder_config.region_key)
		if not region or region:is_null_interface() then
			self:output("Could not find region " .. wonder_config.region_key, 10)
			return 0
		end

		local region_list = region:province():regions()
		local discount = 0
		for _, data in ipairs(stage_config.regional_supply) do
			local building_key = data.building_record

			for i = 0, region_list:num_items() - 1 do
				local current_region = region_list:item_at(i)
				if current_region:owning_faction():name() == self.persistent.active_faction then
					if cm:region_contains_building(current_region, building_key) then
						discount = discount + data.percentage_discount
						break
					end
				end
			end
		end

		return discount
	end,

	get_potential_regional_supply_for_building = function(self, wonder_key, stage_key, building_record)
		local wonder_config = self:get_wonder_config(wonder_key)
		if not wonder_config then
			return 0
		end

		local stage_config = self:get_stage_config(wonder_key, stage_key)
		if not stage_config then
			return 0
		end

		local region = cm:get_region(wonder_config.region_key)
		if not region or region:is_null_interface() then
			self:output("Could not find region " .. wonder_config.region_key, 10)
			return 0
		end

		local discount = table_find(stage_config.regional_supply, function(e) return e.building_record == building_record end)
		if not discount then
			self:output("Could not regional supply data for wonder " .. wonder_key .. ", stage " .. stage_key .. ", building " .. building_record, 10)
			return 0
		end

		return discount.percentage_discount
	end,

	get_regional_supply_building_keys = function(self, wonder_key, stage_key)
		local building_keys_table = {}

		local wonder_config = self:get_wonder_config(wonder_key)
		if not wonder_config then
			return {}
		end

		local stage_config = self:get_stage_config(wonder_key, stage_key)
		if not stage_config then
			return {}
		end

		for _, regional_supply_data in ipairs(stage_config.regional_supply) do
			table.insert(building_keys_table, regional_supply_data.building_record)
		end

		return building_keys_table
	end,

	get_stage_cost_after_discount = function(self, wonder_key, stage_key)
		local stage_config = self:get_stage_config(wonder_key, stage_key)
		if not stage_config then
			self:output("Error: Could not find stage " .. tostring(stage_key) .. " of wonder " .. tostring(wonder_key), 10)
			return nil
		end

		local resource_cost = cm:create_new_custom_resource_cost()
		resource_cost:get_cost_from_record(stage_config.cost)
		local regional_supply_discount = self:get_regional_supply_discount(wonder_key, stage_key)
		local resources = resource_cost:resources()

		for i = 1, #resources do
			resources[i][2] = resources[i][2] * (100 - regional_supply_discount) / 100
		end

		return resources
	end,

	get_followers = function(self)
		local followers = {}
		local faction_key = self.persistent.active_faction
		local faction = cm:get_faction(faction_key)
		if not faction then
			return followers
		end

		local characters_list = faction:character_list()
		for i = 0, characters_list:num_items() - 1 do
			local character = characters_list:item_at(i)
			if character:character_type("general") and not character:character_details():is_civilian() and not character:is_replaced_starting_general() then
				local ancillaries = character:ancillaries()
				for j = 0, ancillaries:num_items() - 1 do
					local ancillary = ancillaries:item_at(j)
					local category = ancillary:category()
					if category == "follower" then
						table.insert(followers, {ancillary = ancillary, general_cqi = character:command_queue_index()})
					end
				end
			end
		end

		local ancillary_pool = faction:ancillary_pool()
		for i = 0, ancillary_pool:num_items() - 1 do
			local ancillary = ancillary_pool:item_at(i)
			local category = ancillary:category()
			if category == "follower" then
				table.insert(followers, {ancillary = ancillary})
			end
		end

		return followers
	end,

	apply_follower_time_reduction = function(self, wonder_key, stage_key, reduction)
		local stage_data = self:get_stage_construction_data(wonder_key, stage_key)
		if not stage_data then
			self:output("Error: Tried to apply followers to wonder: " .. wonder_key .. ", stage: " .. stage_key .. ", but it is not under construction", 10)
			return
		end

		local turns_left = stage_data.construction_time - stage_data.turns_in_construction
		local turns_left_after_followers = math.max(khufu_config.followers_min_time, turns_left - reduction)
		stage_data.turns_in_construction = stage_data.construction_time - turns_left_after_followers
		self:output(reduction .. " followers applied to stage " .. stage_data.key .. " of wonder " .. wonder_key .. ", "
			.. turns_left_after_followers .. " turns remaining", 0)
	end,

	add_garrison = function(self, wonder_key, bundle_index, ignore_cost)
		local faction_key = self.persistent.active_faction
		local wonder_config = self:get_wonder_config(wonder_key)

		if not wonder_config then
			self:output("Error: Invalid wonder key " .. tostring(wonder_key), 10)
			return
		end

		if bundle_index > #wonder_config.garrison_units or not wonder_config.garrison_units[bundle_index] then
			self:output("Error: Invalid garrison bundle index " .. bundle_index .. " for wonder " .. wonder_key, 10)
		end

		if not ignore_cost then
			local resource_cost = cm:create_new_custom_resource_cost()
			resource_cost:get_cost_from_record(wonder_config.garrison_units[bundle_index].bundle_cost)
			local resources = resource_cost:resources()
			for i = 1, #resources do
				cm:faction_add_pooled_resource(faction_key, resources[i][1], "troy_units", resources[i][2])
			end
		end

		local wonder_slot = self:get_wonder_slot(wonder_key)
		if wonder_slot then
			for _, unit_data in ipairs(wonder_config.garrison_units[bundle_index].units) do
				-- Get the general every time in case some other unit gets promoted to general after being added
				local garrison_army = wonder_slot:garrison_residence():garrison_army()
				if garrison_army ~= nil and garrison_army:is_null_interface() == false then
					local general = garrison_army:general_character()
					local general_lookup = "character_cqi:"..general:command_queue_index()
					cm:grant_unit_to_character(general_lookup, true, unit_data.key, unit_data.count)
				end
			end
		end
	end,

	get_garrison_strength = function(self, wonder_key)
		local wonder_slot = self:get_wonder_slot(wonder_key)
		if not wonder_slot then
			return
		end

		local garrison_strength = 0;
		local garrison_army = wonder_slot:garrison_residence():garrison_army()
		if not garrison_army:is_null_interface() then
			for i = 0, garrison_army:unit_list():num_items() - 1 do
				garrison_strength = garrison_strength + garrison_army:unit_list():item_at(i):get_unit_custom_battle_cost()
			end
		end

		return garrison_strength
	end,
	
	trigger_invasion = function(self, wonder_key)
		local faction_key = self.persistent.active_faction
		local player_faction_key = faction_key
		local wonder_config = self:get_wonder_config(wonder_key)
		if not wonder_config then
			return
		end

		local wonder_slot = self:get_wonder_slot(wonder_key)
		if wonder_slot then
			local garrison_residence_cqi = wonder_slot:garrison_residence():command_queue_index()

			local invasion_key = invasion_manager:generate_unique_invasion_key("wonder_invasion")
			local wonder_invasion_instance = invasion_manager:new_invasion(invasion_key, wonder_config.invasion.faction, "", wonder_config.invasion.starting_position, false)

			local garrison_strength = self:get_garrison_strength(wonder_key)
			if wonder_config.invasion.budget > garrison_strength then
				wonder_invasion_instance:set_target("GARRISON", garrison_residence_cqi, player_faction_key)
			else
				local raid_position_formatted = { x = wonder_config.invasion.raid_position[1], y = wonder_config.invasion.raid_position[2] }
				wonder_invasion_instance:set_target("RAID_LOCATION", raid_position_formatted, player_faction_key)
				wonder_invasion_instance.stop_at_end = true
			end

			wonder_invasion_instance.human = false
			wonder_invasion_instance:start_invasion(nil, wonder_config.invasion.budget, wonder_config.invasion.unit_count, true, false, false)

			-- Save the invasion key
			local wonder_data = self:get_wonder_data(wonder_key)
			if wonder_data then
				wonder_data.invasion_key = invasion_key
			end
		end
	end,

	can_faction_build_any_stage_of_wonder = function(self)
		for _, wonder in ipairs(khufu_config.wonders) do
			local wonder_config = self:get_wonder_config(wonder.key)
			for _, stage in ipairs(wonder_config.stages) do
				if self:can_start_stage_construction(wonder.key, stage.key) then
					return true
				end
			end
		end
		return false
	end,

--------------------------------------------------------------
---------------------------AI---------------------------------
--------------------------------------------------------------
	ai_handle_wonder_regions = function(self)
		-- AI should start working on 1 wonder only
		local wonders = self:get_wonder_keys_for_owned_regions()
		for _, wonder_key in ipairs(wonders) do
			local wonder_data = self:get_wonder_data(wonder_key)
			if not wonder_data
				or wonder_data.state == khufu_config.construction_states.under_construction
				or wonder_data.state == khufu_config.construction_states.damaged
			then
				self:ai_handle_wonder(wonder_key)
				return
			end
		end
	end,

	ai_handle_wonder = function(self, wonder_key)
		local wonder_slot = self:get_wonder_slot(wonder_key)
		if not wonder_slot then
			return
		end

		local building = wonder_slot:building()
		if building and not building:is_null_interface() then
			local name = building:name()

			local wonder_config = self:get_wonder_config(wonder_key)
			if not wonder_config then
				return
			end

			if name ~= wonder_config.building_under_construction_record and
				name ~= wonder_config.finished_building_record and
				name ~= wonder_config.sacked_building_record
			then
				cm:queue_building_dismantle(wonder_config.region_key, wonder_config.slot_number + 1)
				return
			end

			if building:percent_health() < 100 then
				local region = cm:get_region(wonder_config.region_key)
				if not region or region:is_null_interface() then
					return
				end
				-- Repair only if no enemies in region, otherwise do nothing
				if region:size_of_enemy_forces() == 0 then
					cm:queue_building_repair(wonder_config.region_key, wonder_config.slot_number + 1, true)
				end
				return
			end

			-- Start all stages that have not yet been started
			if name == wonder_config.building_under_construction_record then
				self:ai_build_all_wonder_stages(wonder_key)
			end
		elseif building:is_null_interface() then
			-- Build the wonder and all stages
			self:ai_build_all_wonder_stages(wonder_key)
		end
	end,

	ai_build_all_wonder_stages = function(self, wonder_key)
		local wonder_data = self:get_wonder_data(wonder_key)

		local wonder_config = self:get_wonder_config(wonder_key)
		if not wonder_config then
			return
		end

		for _, stage in ipairs(wonder_config.stages) do
			-- Check if stage not yet started
			if not wonder_data or not table_find(wonder_data.stage_data, function(e) return e.key == stage.key end) then
				self:stage_construction_start(wonder_key, stage.key, true)
				-- Add the strongest garrison
				if stage.key == "foundation" then
					self:add_garrison(wonder_key, #wonder_config.garrison_units, true)
				end
			end
		end
	end,

--------------------------------------------------------------
---------------------------UI---------------------------------
--------------------------------------------------------------

	get_localised_text = function(self, text_key)
		local source = "ui_text_replacements_localised_text_" .. text_key
		local localised = common.get_localised_string(source)
		return localised, source
	end,

	display_resource_cost = function(self, component, cost)
		if not component then
			return
		end

		-- By design should be 1 resource
		for _, resource_data in ipairs(cost) do
			local cost_value = -resource_data[2]
			component:SetText(cost_value)
			component:SetImagePath(resource_data[3])
		end
	end,

	update_possible_construction_alert = function(self)
		local local_faction_key = cm:get_local_faction_name(true)
		if self.persistent.active_faction ~= local_faction_key then
			return
		end

		local alert_component = core:get_ui_root():SequentialFind(khufu_config.component_ids.alert_icon)
		if alert_component then
			alert_component:SetVisible(self:can_faction_build_any_stage_of_wonder())
		end
	end,

	toggle_wonder_details = function(self, visible)
		local wonder_details_panel = self.panel:SequentialFind(khufu_config.component_ids.wonder_details_panel)
		if wonder_details_panel then
			wonder_details_panel:SetVisible(visible)
		end
	end,

	toggle_wonder_selection_screen = function(self, visible)
		local wonder_selection_screen = self.panel:SequentialFind(khufu_config.component_ids.wonder_selection_screen)
		if wonder_selection_screen then
			wonder_selection_screen:SetVisible(visible)
		end
	end,

	display_wonder_selection = function(self)
		self:toggle_wonder_selection_screen(true)
		self:toggle_wonder_details(false)

		self:display_wonders()
	end,

	display_wonders = function(self)
		local wonder_cards_list_box = self.panel:SequentialFind(khufu_config.component_ids.wonder_selection_screen,
			khufu_config.component_ids.wonder_cards_holder,
			khufu_config.component_ids.wonder_cards_list_view,
			khufu_config.component_ids.wonder_cards_list_clip,
			khufu_config.component_ids.wonder_cards_list_box)

		if not wonder_cards_list_box then
			return
		end

		wonder_cards_list_box:DestroyChildren()
		local wonder_template = self.ui_data.templates.card_wonder
		for _, wonder in ipairs(khufu_config.wonders) do
			local new_wonder_component = UIComponent(wonder_cards_list_box:CreateFromComponent(wonder_template:Address(), khufu_config.component_ids.wonder_prefix .. wonder.key))

			local wonder_title = new_wonder_component:SequentialFind(khufu_config.component_ids.wonder_title)
			if wonder_title then
				local localised, source = self:get_localised_text(wonder.display_name_key)
				wonder_title:SetText(localised, source)
			end

			local region = cm:get_region(wonder.region_key)
			local region_owned = region:owning_faction():name() == self.persistent.active_faction

			local wonder_slot_filled = false
			local wonder_data = self:get_wonder_data(wonder.key)
			if not wonder_data then
				local region_slots = region:slot_list()
				local slot = region_slots:item_at(wonder.slot_number)
				if (slot:building() and not slot:building():is_null_interface())
					or slot:is_there_construction()
				then
					wonder_slot_filled = true
				end
			end

			local show_construct = region_owned 
				and (not wonder_data or wonder_data.state == khufu_config.construction_states.under_construction)
			local wonder_construct_button = new_wonder_component:SequentialFind(khufu_config.component_ids.wonder_construct)
			if wonder_construct_button then
				wonder_construct_button:SetVisible(to_bool(show_construct))
				wonder_construct_button:SetProperty(khufu_config.component_ids.wonder_key_property, wonder.key)
				wonder_construct_button:SetState(wonder_slot_filled and "inactive" or "active")
			end

			local show_finished = to_bool(region_owned and wonder_data and wonder_data.state == khufu_config.construction_states.finished)
			local wonder_finished_detials_button = new_wonder_component:SequentialFind(khufu_config.component_ids.wonder_finished)
			if wonder_finished_detials_button then
				wonder_finished_detials_button:SetVisible(show_finished)
				wonder_finished_detials_button:SetProperty(khufu_config.component_ids.wonder_key_property, wonder.key)
			end

			local show_repair = region_owned and wonder_data and wonder_data.state == khufu_config.construction_states.damaged
			local wonder_repair_button = new_wonder_component:SequentialFind(khufu_config.component_ids.wonder_repair)
			if wonder_repair_button then
				wonder_repair_button:SetVisible(to_bool(show_repair))
				wonder_repair_button:SetProperty(khufu_config.component_ids.wonder_key_property, wonder.key)
			end

			local effect_bundle_icon = new_wonder_component:SequentialFind(khufu_config.component_ids.wonder_effect_bundle_icon)
			if effect_bundle_icon then

				if wonder.effect_bundle and #wonder.effect_bundle > 0 then
					effect_bundle_icon:SetVisible(true)

					local cco_id = khufu_config.cco_ids.wonder_effect_bundle_icon_prefix .. wonder.key
					effect_bundle_icon:SetProperty("script_id", cco_id)
					effect_bundle_icon:SetImagePath(wonder.effect_bundle_icon, 0)
	
					local cco_effect_bundle = cco("CcoEffectBundle", wonder.effect_bundle)
					local cco_table = 
					{
						DisplayName = cco_effect_bundle and cco_effect_bundle:Call("Name") or "",
						EffectBundleKey = wonder.effect_bundle,
						Alert = ((not show_finished) and common.get_localised_string(khufu_config.wonder_effects_warning_key)) or ""
					}
	
					common.set_context_value(cco_id, cco_table)
				else
					effect_bundle_icon:SetVisible(false)
				end
			end

			self:display_wonder_details_image(new_wonder_component, wonder, wonder_slot_filled)
		end
	end,

	display_wonder_details_image = function(self, wonder_component, wonder_config, wonder_slot_filled)
		if not wonder_component then
			return
		end

		local wonder_image = wonder_component:SequentialFind(khufu_config.component_ids.wonder_image)
		if not wonder_image then
			return
		end

		local wonder_data = self:get_wonder_data(wonder_config.key)
		local region = cm:get_region(wonder_config.region_key)
		local region_owned = region:owning_faction():name() == self.persistent.active_faction

		local image_indexes =
		{
			finished = 0,
			under_construction = 1,
			locked = 2,
			to_be_constructed = 3,
		}

		if not region_owned or wonder_slot_filled then
			wonder_image:SetImagePath(wonder_config.image_locked, image_indexes.locked)
			wonder_image:SetState("locked")
		else
			if not wonder_data then
				wonder_image:SetImagePath(wonder_config.image_to_be_constructed, image_indexes.to_be_constructed)
				wonder_image:SetState("to_be_constructed")
			else
				if wonder_data.state == khufu_config.construction_states.under_construction
				or wonder_data.state_after_repair == khufu_config.construction_states.under_construction then
					wonder_image:SetImagePath(wonder_config.image_under_construction, image_indexes.under_construction)
					wonder_image:SetState("in_construction")
				elseif not wonder_data.state_after_repair or wonder_data.state_after_repair == khufu_config.construction_states.finished then
					wonder_image:SetImagePath(wonder_config.image_finished, image_indexes.finished)
					wonder_image:SetState("constructed")
				else
					self:output("Error: Unknown UI wonder state for wonder key " .. wonder_config.key, 10)
				end
			end
		end

		local button_location = wonder_component:SequentialFind(khufu_config.component_ids.button_location)
		if button_location then
			button_location:InterfaceFunction("init_wonder_slot", wonder_config.region_key, wonder_config.slot_number)
		end

		if not region_owned then
			local location_container = wonder_component:SequentialFind(khufu_config.component_ids.location_container)
			if location_container then
				location_container:SetVisible(true)
				local owner_faction_key = cm:get_region(wonder_config.region_key):owning_faction():name()
				location_container:SetContextObject(cco("CcoCampaignFaction", owner_faction_key))

				local owner_text_component = location_container:SequentialFind(khufu_config.component_ids.owner_text)
				if owner_text_component then
					owner_text_component:SetState(owner_faction_key == "rebels" and "not_owned" or "default")
				end
			end
		end

		local damaged_component = wonder_image:SequentialFind(khufu_config.component_ids.status_damaged)
		if damaged_component then
			local is_damaged = (not not wonder_data) and wonder_data.state == khufu_config.construction_states.damaged
			damaged_component:SetVisible(is_damaged)
			if is_damaged then
				damaged_component:SetImagePath(wonder_config.mask_image, 0)
			end
		end

		local wonder_state_icon = wonder_component:SequentialFind(khufu_config.component_ids.wonder_state_icon)
		self:display_wonder_state_icon(wonder_config.key, wonder_state_icon)

		local wonder_build_status = wonder_component:SequentialFind(khufu_config.component_ids.build_status)
		if wonder_build_status then
			wonder_build_status:SetVisible(region_owned)

			if region_owned then
				self:display_wonder_stages_summary(wonder_config.key, wonder_build_status)
			end
		end

		local wonder_remaining_turns = wonder_component:SequentialFind(khufu_config.component_ids.status_container)
		self:display_remaining_turns(wonder_config.key, wonder_remaining_turns)
	end,

	display_wonder_details_info = function(self, visible)
		local description_component = self.panel:SequentialFind(
			khufu_config.component_ids.wonder_details_panel,
			khufu_config.component_ids.wonder_details_info_description)
		if description_component then
			description_component:SetVisible(visible)
		end
	end,

	display_wonder_state_icon = function(self, wonder_key, component)
		if not component then
			return
		end

		local wonder_config = self:get_wonder_config(wonder_key)
		local wonder_data = self:get_wonder_data(wonder_key)
		local region = cm:get_region(wonder_config.region_key)
		local region_owned = region:owning_faction():name() == self.persistent.active_faction
		local foundation = self:get_stage_construction_data(wonder_key, "foundation")
		local embelishment_in_progress = self:is_embelishment_in_progress(wonder_key)

		if not region_owned then
			component:SetState("not_owned")
		elseif not wonder_data then
			component:SetState("owned_not_started")
		elseif wonder_data.state == khufu_config.construction_states.damaged then
			component:SetState("owned_damaged")
		elseif foundation.state == khufu_config.construction_states.under_construction then
			component:SetState("owned_foundation_started")
		elseif embelishment_in_progress then
			component:SetState("owned_embelishment_in_progress")
		elseif wonder_data.state == khufu_config.construction_states.finished then
			component:SetState("owned_wonder_completed")
		else
			component:SetState("owned_foundation_completed")
		end
	end,

	display_remaining_turns = function(self, wonder_key, component)
		if not component then
			return
		end

		local wonder_config = self:get_wonder_config(wonder_key)
		local wonder_data = self:get_wonder_data(wonder_key)
		local region = cm:get_region(wonder_config.region_key)
		local region_owned = region:owning_faction():name() == self.persistent.active_faction
		local repair_in_progress = self:is_repair_in_prorgess(wonder_key)

		if (not wonder_data or wonder_data.state ~= khufu_config.construction_states.under_construction or not region_owned)
			and not repair_in_progress
		then
			component:SetVisible(false)
			return
		end

		local turns_component = component:SequentialFind(khufu_config.component_ids.turns_remaining)

		if repair_in_progress then
			component:SetVisible(true)
			if turns_component then
				turns_component:SetText("1")
			end
			local status_icon = component:SequentialFind(khufu_config.component_ids.status_icon)
			if status_icon then
				status_icon:SetState("repair")
			end
			return
		end

		local turns_left = self:get_max_remaining_construction_turns(wonder_data)
		if turns_left > 0 then
			component:SetVisible(true)
			if turns_component then
				turns_component:SetText(turns_left)
			end
		else
			component:SetVisible(false)
		end
	end,

	get_max_remaining_construction_turns = function(self, wonder_data)
		local max = 0
		for _, stage_data in ipairs(wonder_data.stage_data) do
			if stage_data.state == khufu_config.construction_states.under_construction then
				local turns_left = stage_data.construction_time - stage_data.turns_in_construction
				if turns_left > max then
					max = turns_left
				end
			end
		end
		return max
	end,

	is_embelishment_in_progress = function(self, wonder_key)
		local wonder_data = self:get_wonder_data(wonder_key)
		if not wonder_data then
			return false
		end

		return to_bool(table_find(wonder_data.stage_data, function(e) return e.state == khufu_config.construction_states.under_construction end))
	end,

	is_repair_in_prorgess = function(self, wonder_key)
		local slot = self:get_wonder_slot(wonder_key)

		if not slot then
			return false
		end

		if slot:building() and not slot:building():is_null_interface() then
			return slot:building():is_repairing()
		else
			return false
		end
	end,

	display_wonder_stages_summary = function(self, wonder_key, stages_container)
		if not stages_container then
			return
		end

		local wonder_config = self:get_wonder_config(wonder_key)
		if not wonder_config then
			return
		end

		for index, button_name in ipairs(khufu_config.component_ids.build_status_stages) do
			local button = stages_container:SequentialFind(button_name)
			local stage_data
			if wonder_config.stages[index] then
				stage_data = self:get_stage_construction_data(wonder_key, wonder_config.stages[index].key)
			end
			if button then
				local state_to_set = "default"
				if stage_data then
					local construction_state = stage_data.state
					if stage_data.state == khufu_config.construction_states.damaged then
						construction_state = stage_data.state_after_repair
					end

					if construction_state == khufu_config.construction_states.under_construction then
						state_to_set = "in_progress"
					elseif construction_state == khufu_config.construction_states.finished then
						state_to_set = "built"
						if wonder_config.stages[index].key == "foundation" then
							local lock_component = stages_container:SequentialFind(khufu_config.component_ids.build_status_lock)
							if lock_component then
								lock_component:SetVisible(false)
							end
						end
					end
				end
				button:SetState(state_to_set)
			end
		end
	end,

	display_wonder_details = function(self, wonder_key)
		self:toggle_wonder_selection_screen(false)
		self:toggle_wonder_details(true)

		self.ui_data.selected_wonder = wonder_key

		local wonder_details_panel = self.panel:SequentialFind(khufu_config.component_ids.wonder_details_panel)
		if not wonder_details_panel then
			return
		end

		local wonder_config = self:get_wonder_config(wonder_key)

		local wonder_title = wonder_details_panel:SequentialFind(khufu_config.component_ids.wonder_details_title)
		if wonder_title then
			local localised, source = self:get_localised_text(wonder_config.display_name_key)
			wonder_title:SetText(localised, source)
		end

		local wonder_data = self:get_wonder_data(wonder_key)
		local is_completed = wonder_data and wonder_data.state == khufu_config.construction_states.finished
		local effects_list = wonder_details_panel:SequentialFind(khufu_config.component_ids.wonder_details_effects_holder)
		if effects_list then
			effects_list:SetProperty("show_effects_as_active", is_completed and "1" or "0")
			common.set_context_value(khufu_config.component_ids.wonder_details_effect_bundle, wonder_config.effect_bundle)
		end

		local effects_explanation = wonder_details_panel:SequentialFind(
			khufu_config.component_ids.wonder_details_effects,
			khufu_config.component_ids.wonder_details_effect_explanation)
		if effects_explanation then
			if wonder_data then
				if wonder_data.state == khufu_config.construction_states.finished then
					effects_explanation:SetVisible(false)
				else
					effects_explanation:SetVisible(true)
					if wonder_data.state == khufu_config.construction_states.under_construction then
						effects_explanation:SetState("incomplete")
					elseif wonder_data.state == khufu_config.construction_states.damaged then
						effects_explanation:SetState("damaged")
					end
				end
			else
				effects_explanation:SetVisible(true)
			end
		end

		local button_location = wonder_details_panel:SequentialFind(khufu_config.component_ids.button_location)
		if button_location then
			button_location:InterfaceFunction("init_wonder_slot", wonder_config.region_key, wonder_config.slot_number)
		end

		local wonder_component = wonder_details_panel:SequentialFind(khufu_config.component_ids.wonder_details_wonder)
		if wonder_component and wonder_config then
			wonder_component:SetImagePath(wonder_config.image_foundation, 0)

			local damaged_component = wonder_component:SequentialFind(khufu_config.component_ids.wonder_details_damaged)
			if damaged_component then
				local is_damaged = (not not wonder_data) and wonder_data.state == khufu_config.construction_states.damaged
				damaged_component:SetVisible(is_damaged)
				if is_damaged then
					damaged_component:SetImagePath(wonder_config.mask_image, 0)
				end
			end
		end

		local repair_button = wonder_details_panel:SequentialFind(khufu_config.component_ids.repair_button)
		if repair_button then
			local show_button = wonder_data and wonder_data.state == khufu_config.construction_states.damaged
			repair_button:SetVisible(to_bool(show_button))

			if show_button then
				local can_afford = false
				local is_currently_repairing = false 

				local slot = self:get_wonder_slot(wonder_config.key)
				local building = slot and slot:building() or nil
				local repair_resource_cost = cm:create_new_custom_resource_cost()

				if building and not building:is_null_interface() then
					local repair_cost_key = cm:get_building_repair_override_cost_record_key(building:name())
					repair_resource_cost:get_cost_from_record(repair_cost_key)

					local local_faction = cm:get_local_faction(true)
					can_afford = local_faction:can_afford_resource_cost_object(repair_resource_cost)
					is_currently_repairing = building:is_repairing()
				end

				local button_state = "active"
				if is_currently_repairing then
					button_state = "in_progress"
				elseif not can_afford then
					button_state = "inactive"
				end

				repair_button:SetState(button_state)

				local show_cost = not is_currently_repairing
				local text_component = repair_button:SequentialFind("tx_info")
				if text_component then
					text_component:SetVisible(show_cost)
				end

				if show_cost then
					local cost_component = repair_button:SequentialFind("resource_cost")
					if cost_component then
						repair_resource_cost:multiply_by(-1)
						local cost_text = repair_resource_cost:to_string(local_faction)
						cost_component:SetText(cost_text)
					end

					local turn_cost_component = repair_button:SequentialFind("dy_turn_cost")
					if turn_cost_component then
						-- the number of turns is hardcoded in C++, so ...
						turn_cost_component:SetText(1)
					end
				end
			end
		end

		self:display_tabs()
		self:display_wonder_stages(wonder_key)
		self:display_current_garrsion(wonder_key)
	end,

	display_tabs = function(self)
		local tabs_holder = self.panel:SequentialFind(khufu_config.component_ids.wonder_details_panel,
		khufu_config.component_ids.tab_holder)

		if not (tabs_holder and self.ui_data.templates.tab_template) then
			return
		end

		tabs_holder:DestroyChildren()
		for _, wonder in ipairs(khufu_config.wonders) do
			local new_tab_component = UIComponent(tabs_holder:CreateFromComponent(self.ui_data.templates.tab_template:Address(), khufu_config.component_ids.tab_prefix .. wonder.key))

			if wonder.key == self.ui_data.selected_wonder then
				new_tab_component:SetState("selected")
			else
				local region = cm:get_region(wonder.region_key)
				local region_owned = region:owning_faction():name() == self.persistent.active_faction
				new_tab_component:SetState(region_owned and "active" or "inactive")
			end
			local localised, source = self:get_localised_text(wonder.display_name_key)
			new_tab_component:SetText(localised, source)
			new_tab_component:SetProperty(khufu_config.component_ids.wonder_key_property, wonder.key)
		end
	end,

	display_wonder_stages = function(self, wonder_key)
		local wonder_stages_components = self.panel:SequentialFind(khufu_config.component_ids.wonder_details_container_embelishments)

		if not wonder_stages_components then
			return
		end

		local stage_template = self.ui_data.templates.stage_template
		if not stage_template then
			return
		end

		wonder_stages_components:DestroyChildren()
		local wonder_config = self:get_wonder_config(wonder_key)
		if not wonder_config then
			return
		end

		local wonder_component = self.panel:SequentialFind(khufu_config.component_ids.wonder_details_wonder)

		-- Iterate in reverse because of container settings in layout
		for index = #wonder_config.stages, 1, -1 do
			local stage = wonder_config.stages[index]
			local new_stage_component
			if stage.key == "foundation" then
				new_stage_component = self.panel:SequentialFind(khufu_config.component_ids.wonder_details_foundation)
			else
				new_stage_component = UIComponent(wonder_stages_components:CreateFromComponent(stage_template:Address(), khufu_config.component_ids.stage_prefix .. stage.key))
			end

			local localised, source = self:get_localised_text(stage.display_name_key)
			local stage_name = new_stage_component:SequentialFind(khufu_config.component_ids.wonder_details_stage_name)
			if stage_name then
				stage_name:SetText(localised, source)
			end

			if stage.display_tooltip_key then
				local localised_tt, source_tt = self:get_localised_text(stage.display_tooltip_key)
				new_stage_component:SetTooltipText(localised_tt, source_tt, true)
			end

			local stage_construction_data = self:get_stage_construction_data(wonder_key, stage.key)
			self:display_stage_icons(wonder_key, stage.key, new_stage_component)

			-- Dev UI
			local dev_button_stage_complete = new_stage_component:SequentialFind(khufu_config.component_ids.dev_button_stage_complete)
			if dev_button_stage_complete then
				dev_button_stage_complete:SetProperty(khufu_config.component_ids.stage_property, stage.key)
			end

			-- Show image of completed stages (except foundation)
			if index > 1 and wonder_component then
				local stage_image = wonder_component:SequentialFind(khufu_config.component_ids.wonder_details_stage_images[index - 1])
				if stage_image then
					if stage_construction_data
						and (stage_construction_data.state == khufu_config.construction_states.finished
						or stage_construction_data.state_after_repair == khufu_config.construction_states.finished) then
						stage_image:SetImagePath(wonder_config.image_stages[index - 1])
						stage_image:SetVisible(true)
					else
						stage_image:SetVisible(false)
					end
				end
			end

			local stage_build_button = new_stage_component:SequentialFind(khufu_config.component_ids.stage_build_button)
			local stage_progress_bar = new_stage_component:SequentialFind(khufu_config.component_ids.stage_progress_bar)
			-- Show progress bar
			if stage_construction_data then
				if stage_build_button then
					stage_build_button:SetVisible(false)
				end
				self:display_stage_progress_bar(wonder_key, stage.key, stage_progress_bar, new_stage_component)
			-- Show build button
			else
				if stage_progress_bar then
					stage_progress_bar:SetVisible(false)
				end
				self:display_stage_build_button(wonder_key, stage.key, stage_build_button, new_stage_component)
			end

			local stage_cancel_button = new_stage_component:SequentialFind(khufu_config.component_ids.stage_cancel_button)
			if stage_cancel_button then
				stage_cancel_button:SetProperty(khufu_config.component_ids.stage_key_property, stage.key)
				if (not stage_construction_data)
					or (stage_construction_data and stage_construction_data.state == khufu_config.construction_states.finished)
				then
					stage_cancel_button:SetVisible(false)
				else
					local can_cancel_stage = self:can_cancel_stage(wonder_key, stage.key)
					stage_cancel_button:SetState(can_cancel_stage and "active" or "inactive")
				end
			end
		end
	end,

	display_stage_icons = function(self, wonder_key, stage_key, stage_component)
		if not stage_component then
			return
		end

		local stage_data = self:get_stage_construction_data(wonder_key, stage_key)
		local under_construction = to_bool(stage_data and stage_data.state == khufu_config.construction_states.under_construction)
		local not_started = to_bool(not stage_data)

		local stage_followers_button = stage_component:SequentialFind(khufu_config.component_ids.stage_followers_button)
		if stage_followers_button then
			stage_followers_button:SetVisible(under_construction)

			if under_construction then
				stage_followers_button:SetProperty(khufu_config.component_ids.stage_property, stage_key)
				local followers_count_component = stage_followers_button:SequentialFind(khufu_config.component_ids.stage_followers_count)
				if followers_count_component then
					local followers = self:get_followers()
					if #followers > 0 then
						followers_count_component:SetVisible(true)
						followers_count_component:SetText(#followers)
					else
						followers_count_component:SetVisible(false)
					end
				end
			end
		end

		local regional_supply_icon = stage_component:SequentialFind(khufu_config.component_ids.stage_regional_supply)
		if regional_supply_icon and not_started then
			regional_supply_icon:SetVisible(true)
			local is_built = self:get_regional_supply_discount(wonder_key, stage_key) > 0
			regional_supply_icon:SetState(is_built and "fulfilled" or "default")

			local stage_config = self:get_stage_config(wonder_key, stage_key)
			if stage_config then
				local cost = stage_config.cost

				local building_keys = self:get_regional_supply_building_keys(wonder_key, stage_key)
				for index, building_key in ipairs(building_keys) do
					local potential_discount = self:get_potential_regional_supply_for_building(wonder_key, stage_key, building_keys[index])
					regional_supply_icon:InterfaceFunction("add_building", building_keys[index], is_built, cost, potential_discount)
				end
			end
		end
	end,

	display_stage_progress_bar = function(self, wonder_key, stage_key, progress_bar, stage_component)
		if not progress_bar then
			return
		end

		progress_bar:SetVisible(true)

		local stage_construction_data = self:get_stage_construction_data(wonder_key, stage_key)
		if not stage_construction_data then
			return
		end

		local resource_cost_component = stage_component:SequentialFind(khufu_config.component_ids.stage_resource_cost)
		if resource_cost_component then
			resource_cost_component:SetVisible(false)
		end

		local progress_icon = stage_component:SequentialFind(khufu_config.component_ids.stage_progress_icon)
		if progress_icon then
			if stage_construction_data.state == khufu_config.construction_states.finished then
				progress_icon:SetVisible(false)
			else
				progress_icon:SetVisible(true)
				progress_icon:SetState((stage_construction_data.state == khufu_config.construction_states.damaged) and "paused" or "default")
			end
		end

		local progress_text_component = stage_component:SequentialFind(khufu_config.component_ids.stage_progress_text)
		if progress_text_component then
			if stage_construction_data.state == khufu_config.construction_states.finished then
				progress_text_component:SetState("completed")
			elseif stage_construction_data.state == khufu_config.construction_states.damaged then
				progress_text_component:SetState("paused")
			else
				progress_text_component:SetState("default")
				progress_text_component:SetStateText(stage_construction_data.construction_time - stage_construction_data.turns_in_construction)
			end
		end

		local fill_component = progress_bar:SequentialFind(khufu_config.component_ids.stage_progress_fill)
		local progress_bar_container = UIComponent(fill_component:Parent())
		if fill_component then
			fill_component:SetState((stage_construction_data.state == khufu_config.construction_states.damaged) and "paused" or "default")
			local total_width, height = progress_bar_container:Dimensions()
			local fill_width = total_width * (stage_construction_data.turns_in_construction / stage_construction_data.construction_time)

			if fill_width == 0 then
				fill_component:SetVisible(false)
			else
				fill_component:SetVisible(true)
				fill_component:Resize(fill_width, height)
			end
		end

	end,

	display_stage_build_button = function(self, wonder_key, stage_key, build_button, stage_component)
		if not build_button then
			return
		end

		local stage_config = self:get_stage_config(wonder_key, stage_key)

		build_button:SetVisible(true)
		local can_start, error_msg, error_code = self:can_start_stage_construction(wonder_key, stage_key)
		build_button:SetState(can_start and "active" or "inactive")

		build_button:SetProperty(khufu_config.component_ids.stage_key_property, stage_key)

		if not can_start then
			local tooltip_source
			if error_code == khufu_config.can_start_stage_errors.no_foundation then
				tooltip_source = khufu_config.missing_foundation_tooltip_record
			elseif error_code == khufu_config.can_start_stage_errors.insufficient_resources then
				tooltip_source = khufu_config.insufficient_resources_tooltip_record
			elseif error_code == khufu_config.can_start_stage_errors.damaged_wonder then
				tooltip_source = khufu_config.damaged_wonder_tooltip_record
			end

			if tooltip_source then
				local tooltip_localised = common.get_localised_string(tooltip_source)
				build_button:SetTooltipText(tooltip_localised, tooltip_source, true)
			end
		end

		local resource_cost_component = stage_component:SequentialFind(khufu_config.component_ids.stage_resource_cost)
		local discounted_cost = self:get_stage_cost_after_discount(wonder_key, stage_key)
		self:display_resource_cost(resource_cost_component, discounted_cost)

		if resource_cost_component then
			resource_cost_component:SetState(error_code ~= khufu_config.can_start_stage_errors.insufficient_resources and "default" or "negative")
		end

		local stage_construction_turns = stage_component:SequentialFind(khufu_config.component_ids.stage_turn_cost)
		if stage_construction_turns then
			stage_construction_turns:SetText(stage_config.construction_time)
		end

		local progress_bar_container = stage_component:SequentialFind(khufu_config.component_ids.stage_progress_container)
		if progress_bar_container then
			local foundation_construction_data = self:get_stage_construction_data(wonder_key, "foundation")
			local is_stage_unlocked = stage_key == "foundation" or
									(foundation_construction_data and foundation_construction_data.state == khufu_config.construction_states.finished)

			progress_bar_container:SetState(is_stage_unlocked and "default" or "inactive")
		end
	end,

	display_current_garrsion = function(self, wonder_key)
		local garrison_component = self.panel:SequentialFind(khufu_config.component_ids.garrison)
		if not garrison_component then
			return
		end

		local wonder_slot = self:get_wonder_slot(wonder_key)
		if not wonder_slot then
			garrison_component:SetVisible(false)
			return
		end

		local garrison_slots_component = garrison_component:SequentialFind(
			khufu_config.component_ids.garrison_slots,
			-- TODO add to config
			"list_clip",
			"list_box")
		if not garrison_slots_component or not self.ui_data.templates.unit_card_template then
			return
		end

		-- show garrison only if foundation is at least started
		local wonder_data = self:get_wonder_data(wonder_key)
		if wonder_data then
			garrison_component:SetVisible(true)
		else
			garrison_component:SetVisible(false)
			return
		end

		garrison_slots_component:DestroyChildren()
		local garrison_army = wonder_slot:garrison_residence():garrison_army()
		if not garrison_army:is_null_interface() then
			for i = 0, garrison_army:unit_list():num_items() - 1 do
				local new_unit_component = UIComponent(garrison_slots_component:CreateFromComponent(self.ui_data.templates.unit_card_template:Address(),
					khufu_config.component_ids.garrison_unit_prefix .. i))
				local unit_key = garrison_army:unit_list():item_at(i):unit_key()
				new_unit_component:InterfaceFunction("set_unit", unit_key)
			end
		end

		local garrison_size = cm:model():get_campaign_variable_by_name("fort_garrison_max_units")
		local placeholders_needed = garrison_army:is_null_interface() and garrison_size or garrison_size - garrison_army:unit_list():num_items()
		for i = 1, placeholders_needed do
			local new_slot_component = UIComponent(garrison_slots_component:CreateFromComponent(self.ui_data.templates.garrison_slot_template:Address(),
				khufu_config.component_ids.garrison_slot_prefix .. i))
		end
	end,

	display_garrison_bundles = function(self, should_steal_input)
		local recruitment_panel = self.panel:SequentialFind(khufu_config.component_ids.garrison_recruitment)
		if not recruitment_panel then
			return
		end

		recruitment_panel:SetVisible(true)
		recruitment_panel:PropagatePriority(1000)
		recruitment_panel:LockPriority(1000)
		if should_steal_input then
			cm:steal_escape_key_with_callback(khufu_config.component_ids.garrison_recruitment .. "_confirmation_box_esc", self.close_garrison_bundles)
		end

		local wonder_key = self.ui_data.selected_wonder
		local wonder_config = self:get_wonder_config(wonder_key)
		if not (wonder_config and self.ui_data.templates.bundle_template and self.ui_data.templates.unit_card_template) then
			return
		end

		local unit_list_box = recruitment_panel:SequentialFind(khufu_config.component_ids.garrison_unit_list_container,
			khufu_config.component_ids.garrison_list_view,
			khufu_config.component_ids.garrison_list_clip,
			khufu_config.component_ids.garrison_list_box)

		if not unit_list_box then
			return
		end

		local faction = cm:get_faction(self.persistent.active_faction)

		unit_list_box:DestroyChildren()
		for i = 1, #wonder_config.garrison_units do
			local bundle_data = wonder_config.garrison_units[i]
			local new_bundle_component = UIComponent(unit_list_box:CreateFromComponent(self.ui_data.templates.bundle_template:Address(),
			khufu_config.component_ids.garrison_bundle_prefix .. bundle_data.display_name_key))
			new_bundle_component:SetProperty(khufu_config.component_ids.garrison_bundle_index_property, i)

			local bundle_title_component = new_bundle_component:SequentialFind(khufu_config.component_ids.garrison_bundle_title)
			if bundle_title_component then
				local localised, source = self:get_localised_text(bundle_data.display_name_key)
				bundle_title_component:SetText(localised, source)
			end

			local bundle_cost_container = new_bundle_component:SequentialFind(khufu_config.component_ids.garrison_bundle_cost_container)
			local can_afford_bundle = true
			if bundle_cost_container then
				if bundle_data.bundle_cost then
					can_afford_bundle = faction:can_afford_resource_cost(bundle_data.bundle_cost)
					local bundle_cost_component = bundle_cost_container:SequentialFind(khufu_config.component_ids.garrison_bundle_cost)
					local resource_cost = cm:create_new_custom_resource_cost()
					resource_cost:get_cost_from_record(bundle_data.bundle_cost)
					local resources = resource_cost:resources()
					self:display_resource_cost(bundle_cost_component, resources)
					if not can_afford_bundle then
						new_bundle_component:SetState("inactive")
						bundle_cost_component:SetState("unsufficient_resource")
					end
				else
					bundle_cost_container:SetVisible(false)
				end
			end

			local unit_cards_list = new_bundle_component:SequentialFind(khufu_config.component_ids.garrison_unit_cards_list)
			if not unit_cards_list then
				break
			end

			for _, unit_data in ipairs(bundle_data.units) do
				for j = 1, unit_data.count do
					local new_unit_card_component = UIComponent(unit_cards_list:CreateFromComponent(self.ui_data.templates.unit_card_template:Address(),
						khufu_config.component_ids.garrison_unit_card_prefix .. unit_data.key .. "_" .. j))
					new_unit_card_component:InterfaceFunction("set_unit", unit_data.key)
					new_unit_card_component:SetState(can_afford_bundle and "active" or "inactive")
				end
			end
		end
	end,

	close_garrison_bundles = function()
		local recruitment_panel = core:get_ui_root():SequentialFind(khufu_config.component_ids.garrison_recruitment)
		if not recruitment_panel then
			return
		end

		if recruitment_panel:Visible() then
			recruitment_panel:SetVisible(false)
			recruitment_panel:UnLockPriority()
			cm:release_escape_key_with_callback(khufu_config.component_ids.garrison_recruitment .. "_confirmation_box_esc")
		end
	end,

	display_ancillary_selector = function(self)
		local ancillary_selector_component = self.panel:SequentialFind(khufu_config.component_ids.ancillary_selector)
		if not ancillary_selector_component then
			return
		end

		ancillary_selector_component:SetVisible(true)
		ancillary_selector_component:PropagatePriority(1000)
		ancillary_selector_component:LockPriority(1000)
		cm:steal_escape_key_with_callback(khufu_config.component_ids.ancillary_selector .. "_confirmation_box_esc", self.hide_ancillary_selector)

		local ancillary_template = self.ui_data.templates.ancillary_template
		if not ancillary_template then
			return
		end

		local ancillaries_parent = ancillary_selector_component:SequentialFind(khufu_config.component_ids.ancillary_selector_listview,
		khufu_config.component_ids.ancillary_selector_list_box)

		if not ancillaries_parent then
			return
		end

		for index = #self.ui_data.ancillary_components, 1, -1 do
			table.remove(self.ui_data.ancillary_components, index)
		end

		ancillaries_parent:DestroyChildren()
		local followers = self:get_followers()
		for i = 1, #followers do
			local key = followers[i].ancillary:ancillary_key()
			local cco_ancillary = cco("CcoAncillaryRecord", key)
			local new_follower_component = UIComponent(ancillaries_parent:CreateFromComponent(ancillary_template:Address(),	khufu_config.component_ids.ancillary_prefix .. key))

			table.insert(self.ui_data.ancillary_components, new_follower_component)

			new_follower_component:SetContextObject(cco_ancillary)
			new_follower_component:SetProperty(khufu_config.component_ids.ancillary_key_property, key)
			if followers[i].general_cqi then
				new_follower_component:SetProperty(khufu_config.component_ids.general_cqi_property, followers[i].general_cqi)
			end

			local name_component = new_follower_component:SequentialFind(khufu_config.component_ids.ancillary_name_parent,
				khufu_config.component_ids.ancillary_name)
			if name_component then
				name_component:SetText(followers[i].ancillary:onscreen_name())
			end

			local icon_component = new_follower_component:SequentialFind(khufu_config.component_ids.ancillary_icon_parent,
			khufu_config.component_ids.ancillary_icon)
			if icon_component then
				icon_component:SetImagePath(followers[i].ancillary:character_panel_icon_override_path())
			end

			local ancillary_unequipped_component = new_follower_component:SequentialFind(khufu_config.component_ids.ancillary_unequipped_text)
			local general_cqi = tonumber(followers[i].general_cqi)
			if general_cqi then
				if ancillary_unequipped_component then
					ancillary_unequipped_component:SetVisible(false)
				end

				local assigned_to_general_component = new_follower_component:SequentialFind("icon_assigned")
				if assigned_to_general_component then
					assigned_to_general_component:SetVisible(true)

					local general = cm:get_character_by_cqi(general_cqi)
					if general then
						local cco_character = cco("CcoCampaignCharacter", general_cqi)
						assigned_to_general_component:SetImagePath(cco_character:Call("ImageCardPath"), 0)
						
						local tooltip_text_key = khufu_config.ancillary_assigned_to_general_key
						local assigned_to_general_text = common.get_localised_string(tooltip_text_key)
						assigned_to_general_component:SetTooltipText(string.format(assigned_to_general_text, general:onscreen_name()), tooltip_text_key, true)
					else
						self.output("Error getting general by cqi : " .. tostring(general_cqi), 10)
					end
				end
			else
				local assigned_to_general_component = new_follower_component:SequentialFind("icon_assigned")
				if assigned_to_general_component then
					assigned_to_general_component:SetVisible(false)
				end

				if ancillary_unequipped_component then
					local localised = common.get_localised_string(khufu_config.unequipped_ancillary_display_name_key)
					ancillary_unequipped_component:SetText(localised, khufu_config.unequipped_ancillary_display_name_key)
					ancillary_unequipped_component:SetVisible(true)
				end
			end
		end

		local selected_ancillaries = self:get_selected_ancillaries_count()

		local turns_component = ancillary_selector_component:SequentialFind(khufu_config.component_ids.ancillary_selector_turns)
		if turns_component then
			turns_component:SetText(selected_ancillaries)
		end

		if self:get_stage_ancillary_limit(self.ui_data.selected_wonder, self.ui_data.stage_to_apply_followers) < khufu_config.follower_time_reduction then
			for _, ancillary_component in ipairs(self.ui_data.ancillary_components) do
				ancillary_component:SetState("inactive")
			end
		end

		self:display_ancillary_counter()
	end,

	hide_ancillary_selector = function()
		local ancillary_selector_component = core:get_ui_root():SequentialFind(khufu_config.component_ids.ancillary_selector)
		if not ancillary_selector_component then
			return
		end

		ancillary_selector_component:SetVisible(false)
		ancillary_selector_component:UnLockPriority()
		cm:release_escape_key_with_callback(khufu_config.component_ids.ancillary_selector .. "_confirmation_box_esc")
	end,

	-- TODO: Confirm with design if we can spend an ancillary that reduces more turns, e.g we can reduce one but the ancillary can reduce 2
	get_stage_ancillary_limit = function(self, wonder_key, stage_key)
		local stage_data = self:get_stage_construction_data(wonder_key, stage_key)
		if not stage_data then
			self:output("Error: Tried to apply followers to wonder: " .. wonder_key .. ", stage: " .. stage_key .. ", but it is not under construction", 10)
			return 0
		end

		local turns_left = stage_data.construction_time - stage_data.turns_in_construction - khufu_config.followers_min_time
		return turns_left
	end,

	select_ancillary = function(self)
		local selected_ancillaries = self:get_selected_ancillaries_count()

		if selected_ancillaries * khufu_config.follower_time_reduction >= self:get_stage_ancillary_limit(self.ui_data.selected_wonder, self.ui_data.stage_to_apply_followers) then
			for _, ancillary_component in ipairs(self.ui_data.ancillary_components) do
				if ancillary_component:CurrentState() == "active" then
					ancillary_component:SetState("inactive")
				end
			end
		else
			for _, ancillary_component in ipairs(self.ui_data.ancillary_components) do
				if ancillary_component:CurrentState() == "inactive" then
					ancillary_component:SetState("active")
				end
			end	
		end

		local turns_to_reduce_component = self.panel:SequentialFind(khufu_config.component_ids.ancillary_selector,
			khufu_config.component_ids.ancillary_selector_turns)

		if turns_to_reduce_component then
			turns_to_reduce_component:SetText(selected_ancillaries * khufu_config.follower_time_reduction)
		end

		self:display_ancillary_counter()
	end,

	get_selected_ancillaries_count = function(self)
		local counter = 0
		for _, ancillary_component in ipairs(self.ui_data.ancillary_components) do
			local state = ancillary_component:CurrentState()
			if state == "selected" or state == "down" then
				counter = counter + 1
			end
		end

		return counter
	end,

	-- This is currently designed to work for the case where each ancillary reduces the time by 1 turn
	display_ancillary_counter = function(self)
		local ancillary_counter_component = self.panel:SequentialFind(khufu_config.component_ids.ancillary_counter)
		if not ancillary_counter_component then
			return
		end

		local selected_ancillaries = self:get_selected_ancillaries_count()
		ancillary_counter_component:SetText(selected_ancillaries .. "/" .. self:get_stage_ancillary_limit(self.ui_data.selected_wonder, self.ui_data.stage_to_apply_followers))
	end,

	spend_ancillaries = function(self)
		local ancillary_selector_component = self.panel:SequentialFind(khufu_config.component_ids.ancillary_selector)
		if not ancillary_selector_component then
			return
		end

		local ancillaries_parent = ancillary_selector_component:SequentialFind(khufu_config.component_ids.ancillary_selector_listview,
			khufu_config.component_ids.ancillary_selector_list_box)

		if not ancillaries_parent then
			return
		end

		local ancillaries_to_spend = {}
		for i = 0, ancillaries_parent:ChildCount() - 1 do
			local ancillary = UIComponent(ancillaries_parent:Find(i))
			if ancillary:CurrentState():find("selected") then
				table.insert(ancillaries_to_spend,
					{ ancillary_key = ancillary:GetProperty(khufu_config.component_ids.ancillary_key_property),
					general_cqi = ancillary:GetProperty(khufu_config.component_ids.general_cqi_property)})
			end
		end

		local local_faction_cqi = cm:get_local_faction(true):command_queue_index()
		for i = 1, #ancillaries_to_spend do
			CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "KhufuRemoveAncillary:" .. ancillaries_to_spend[i].ancillary_key .. ":" .. ancillaries_to_spend[i].general_cqi)
		end

		CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "KhufuSpendFollowers:" .. self.ui_data.selected_wonder .. ":" .. self.ui_data.stage_to_apply_followers .. ":"  .. #ancillaries_to_spend * khufu_config.follower_time_reduction)

		self:hide_ancillary_selector()
	end,

	remove_ancillary = function(self, ancillary_key, general_cqi)
		if general_cqi and general_cqi ~= "" then
			local char_lookup_str = cm:char_lookup_str(tonumber(general_cqi))
			cm:force_remove_ancillary(char_lookup_str, ancillary_key, false)
		else
			cm:force_remove_ancillary_from_faction(self.persistent.active_faction, ancillary_key, false, false)
		end
	end,

	init_card_wonder_template = function(self)
		if self.ui_data.templates.card_wonder then
			return
		end

		local card_wonder_template = self.panel:SequentialFind(khufu_config.component_ids.card_wonder_template)
		if not card_wonder_template then
			return
		end

		card_wonder_template:DivorceFromParent()
		self.ui_data.templates.card_wonder = card_wonder_template
	end,

	init_wonder_stage_template = function(self)
		if self.ui_data.templates.stage_template then
			return
		end

		local wonder_details_panel = self.panel:SequentialFind(khufu_config.component_ids.wonder_details_panel)
		if not wonder_details_panel then
			return
		end

		local stage_template = wonder_details_panel:SequentialFind(khufu_config.component_ids.wonder_details_stage_template)
		if not stage_template then
			return
		end

		stage_template:DivorceFromParent()
		self.ui_data.templates.stage_template = stage_template
	end,

	init_garrison_bundles_templates = function(self)
		if self.ui_data.templates.unit_card_template and self.ui_data.templates.bundle_template then
			return
		end

		local bundle_component = self.panel:SequentialFind(khufu_config.component_ids.garrison_bundle)
		if not bundle_component then
			return
		end

		local unit_card_component = bundle_component:SequentialFind(khufu_config.component_ids.garrison_unit_card)
		if not unit_card_component then
			return
		end

		unit_card_component:DivorceFromParent()
		self.ui_data.templates.unit_card_template = unit_card_component

		bundle_component:DivorceFromParent()
		self.ui_data.templates.bundle_template = bundle_component
	end,

	init_garrison_slot_templates = function(self)
		if self.ui_data.templates.garrison_slot_template then
			return
		end

		local wonder_details_panel = self.panel:SequentialFind(khufu_config.component_ids.wonder_details_panel)
		if not wonder_details_panel then
			return
		end

		local garrison_slot_template = wonder_details_panel:SequentialFind(khufu_config.component_ids.garrison_unit)
		if not garrison_slot_template then
			return
		end

		garrison_slot_template:DivorceFromParent()
		self.ui_data.templates.garrison_slot_template = garrison_slot_template
	end,

	init_tab_template = function(self)
		if self.ui_data.templates.tab_template then
			return
		end

		local tab_template = self.panel:SequentialFind(khufu_config.component_ids.tab_holder,
			khufu_config.component_ids.tab_template)
		
		if not tab_template then
			return
		end

		tab_template:DivorceFromParent()
		self.ui_data.templates.tab_template = tab_template
	end,

	init_ancillary_template = function(self)
		if self.ui_data.templates.ancillary_template then
			return
		end

		local ancillary_template = self.panel:SequentialFind(khufu_config.component_ids.ancillary_template)
		if not ancillary_template then
			return
		end

		ancillary_template:DivorceFromParent()
		self.ui_data.templates.ancillary_template = ancillary_template
	end,

	init_ui_templates = function(self)
		self:init_card_wonder_template()
		self:init_wonder_stage_template()
		self:init_garrison_bundles_templates()
		self:init_garrison_slot_templates()
		self:init_tab_template()
		self:init_ancillary_template()
	end,

	delete_ui_templates = function(self)
		for name, template in pairs(self.ui_data.templates) do
			template:Destroy()
			self.ui_data.templates[name] = nil
		end
	end,

--------------------------------------------------------------
-----------------------EVENT LISTENERS  ----------------------
--------------------------------------------------------------
	get_listeners = function(self)
		self:output("PHARAOH CROWN get_listeners()", 0)

		-- open wonder panel when wonder slot is clicked while already selected on the map
		core:add_listener(
			"PharKhufu_RegionSlotReselected",
			"RegionSlotReselected",
			true,
			function(context)
				local params = context.region_slot_key:split(":")
				local region_key = params[1]
				local slot_number = params[2]

				local region = cm:model():world():region_manager():region_by_key(region_key)
				if not (region and region:owning_faction()
					and region:owning_faction():name() == self.persistent.active_faction
					and region:owning_faction():name() == cm:get_local_faction_name(true))
				then
					return
				end

				local wonder = table_find(khufu_config.wonders, function(e) return e.region_key == region_key and e.slot_number == tonumber(slot_number) end)
				if wonder and self:get_wonder_data(wonder.key) then
					egypt_political_states:activate_button(khufu_config.component_ids.legacy_button, true)
					self:display_wonder_details(wonder.key)
				end
			end,
			true
		)

		-- panel opened
		return
		{
			{
				event = "PanelOpenedCampaign",
				-- there is no context.faction in this event, so cannot use auto_check_faction
				condition = function(self, context)
					return context.string == khufu_config.component_ids.panel
						and cm:get_local_faction_name(true) == self.persistent.active_faction
				end,
				callback = function(self, context)
					self.panel = UIComponent(context:panel_component())
					if not self.panel then
						script_error("ERROR: AL Khufu panel is not found!");
						return
					end

					self:init_ui_templates()

					self:display_wonder_selection()

					core:add_listener(
							"PharKhufu_ButtonClicked",
							"ComponentLClickUp",
							true,
							function(context)
								local local_faction_cqi = cm:get_local_faction(true):command_queue_index()
								local button_component = UIComponent(context.component)
								if not button_component then
									return
								end

								-- Wonder details
								if context.string == khufu_config.component_ids.wonder_construct
									or context.string == khufu_config.component_ids.wonder_uppgrade
									or context.string == khufu_config.component_ids.wonder_finished
									--TODO remove when this repair button is functional
									or context.string == khufu_config.component_ids.wonder_repair
								then
									local wonder_key = button_component:GetProperty(khufu_config.component_ids.wonder_key_property)
									self:display_wonder_details(wonder_key)
								-- Back
								elseif context.string == khufu_config.component_ids.wonder_details_back_button then
									self:display_wonder_selection()
								-- Build stage
								elseif context.string == khufu_config.component_ids.stage_build_button then
									local stage_key = button_component:GetProperty(khufu_config.component_ids.stage_key_property)
									create_confirmation_box("confirmation_box", khufu_config.stage_start_confirmation_key,
										--Confirm
										function()
											-- Building foundations starts after choosing a garrison
											if stage_key == "foundation" then
												self:display_garrison_bundles(true)
											else
												CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "KhufuWonderConstructionStart:" .. self.ui_data.selected_wonder .. ":" .. stage_key)
											end
										end,
										--Cancel
										function()
											self:display_wonder_stages(self.ui_data.selected_wonder)
										end)
								elseif context.string == khufu_config.component_ids.stage_cancel_button then
									local stage_key = button_component:GetProperty(khufu_config.component_ids.stage_key_property)
									create_confirmation_box("confirmation_box", khufu_config.stage_cancel_confirmation_key,
										--Confirm
										function()
											CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "KhufuWonderConstructionCancel:" .. self.ui_data.selected_wonder .. ":" .. stage_key)
										end,
										--Cancel
										function()
											self:display_wonder_stages(self.ui_data.selected_wonder)
										end)
								-- Garrison bundles close & confirm
								elseif context.string == khufu_config.component_ids.garrison_recruitment_close then
									self.close_garrison_bundles()
									self:display_wonder_stages(self.ui_data.selected_wonder)
								elseif string.find(context.string, khufu_config.component_ids.garrison_bundle_prefix) then
									create_confirmation_box("confirmation_box", khufu_config.garrison_confirmation_key,
										--Confirm
										function()
											self.close_garrison_bundles()
											local index = button_component:GetProperty(khufu_config.component_ids.garrison_bundle_index_property)
											CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "KhufuWonderConstructionStart:" .. self.ui_data.selected_wonder .. ":foundation")
											CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "KhufuAddGarrison:" .. self.ui_data.selected_wonder .. ":" .. index)
										end,
										--Cancel
										function()
											self:display_garrison_bundles(false)
										end)
								-- Wonder tabs
								elseif string.find(context.string, khufu_config.component_ids.tab_prefix) then
									local wonder_key = button_component:GetProperty(khufu_config.component_ids.wonder_key_property)
									self:display_wonder_details(wonder_key)
								-- Ancillary selector
								elseif context.string == khufu_config.component_ids.stage_followers_button then
									self.ui_data.stage_to_apply_followers = button_component:GetProperty(khufu_config.component_ids.stage_property)
									self:display_ancillary_selector()
								elseif context.string == khufu_config.component_ids.ancillary_selector_close
									or context.string == khufu_config.component_ids.ancillary_cancel_button
								then
									self:hide_ancillary_selector()
								elseif context.string == khufu_config.component_ids.ancillary_spend_button then
									create_confirmation_box("confirmation_box", khufu_config.spend_followers_confirmation_key,
										--Confirm
										function()
											self:spend_ancillaries()
										end)
								elseif string.find(context.string, khufu_config.component_ids.ancillary_prefix) then
									self:select_ancillary()
								-- Dev UI
								elseif context.string == khufu_config.component_ids.dev_button_stage_complete then
									local stage = button_component:GetProperty(khufu_config.component_ids.stage_property)
									self:cheat_complete_stage(self.ui_data.selected_wonder, stage)
								elseif context.string == khufu_config.component_ids.repair_button then
									local wonder_key = self.ui_data.selected_wonder
									if not self:is_repair_in_prorgess(wonder_key) then
										create_confirmation_box("confirmation_box", khufu_config.repair_wonder_confirmation_key,
										--Confirm
										function()
											CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "KhufuWonderRepair:" .. wonder_key)
										end,
										--Cancel
										function()
											self:display_wonder_details(wonder_key)
										end)
									end
								end
							end,
							true
					)

					core:add_listener(
						"PharKhufu_MouseOn",
						"ComponentMouseOn",
						true,
						function(context)
							if UIComponent(context.component):Id() == khufu_config.component_ids.wonder_details_info_button then
								self:display_wonder_details_info(true)
							end
						end,
						true
					)
					
					core:add_listener(
						"PharKhufu_MouseOff",
						"ComponentMouseOff",
						true,
						function(context)
							if UIComponent(context.component):Id() == khufu_config.component_ids.wonder_details_info_button then
								self:display_wonder_details_info(false)
							end
						end,
						true
					)
				end,
			},

			-- panel closed
			{
				event = "PanelClosedCampaign",
				-- there is no context.faction in this event, so cannot use auto_check_faction
				condition = function(self, context)
					return context.string == khufu_config.component_ids.panel
						and cm:get_local_faction_name(true) == self.persistent.active_faction
				end,
				callback = function(self, context)
					self:delete_ui_templates()
					core:remove_listener("PharKhufu_ButtonClicked")
				end,
			},

			{
				event = "UITriggerScriptEvent",
				auto_check_faction = true,
				condition = true,
				callback = function(self, context)
					local faction_cqi = context:faction_cqi()
					local faction = cm:model():faction_for_command_queue_index(faction_cqi)
					local params = context:trigger():split(":")
					local local_faction_key = cm:get_local_faction_name(true)
					if string.find(context:trigger(), "KhufuWonderConstructionStart") then
						self:stage_construction_start(params[2], params[3])
						if faction and (not faction:is_null_interface()) and faction:name() == local_faction_key then
							self:display_wonder_details(self.ui_data.selected_wonder)
						end
					elseif string.find(context:trigger(), "KhufuWonderConstructionCancel") then
						self:stage_construction_cancel(params[2], params[3])
						if faction and (not faction:is_null_interface()) and faction:name() == local_faction_key then
							self:display_wonder_details(self.ui_data.selected_wonder)
						end
					elseif string.find(context:trigger(), "KhufuWonderRepair") then
						self:start_wonder_repair(params[2])
					elseif string.find(context:trigger(), "KhufuAddGarrison") then
						self:add_garrison(params[2], tonumber(params[3]))
						if faction and (not faction:is_null_interface()) and faction:name() == local_faction_key then
							self:display_wonder_details(self.ui_data.selected_wonder)
						end
					elseif string.find(context:trigger(), "KhufuRemoveAncillary") then
						self:remove_ancillary(params[2], params[3])
					elseif string.find(context:trigger(), "KhufuSpendFollowers") then
						self:apply_follower_time_reduction(params[2], params[3], tonumber(params[4]))
						if faction and (not faction:is_null_interface()) and faction:name() == local_faction_key then
							self:display_wonder_details(self.ui_data.selected_wonder)
						end
					end
				end,
			},

			{
				event = "FactionTurnStart",
				auto_check_faction = true,
				condition = true,
				callback = function(self, context)
					self:progress_construction()
					self:spawn_invasions()

					local is_ai = not cm:get_faction(self.persistent.active_faction):is_human()
					if is_ai then
						self:ai_handle_wonder_regions()
					end

					self:update_possible_construction_alert()
				end,
			},

			{
				event = "PooledResourceTransactionEvent",
				auto_check_faction = true,
				condition = true,
				callback = function(self, context)
					self:update_possible_construction_alert()
				end,
			},

			{
				event = "FirstTickAfterWorldCreated",
				-- there is no context.faction in this event, so cannot use auto_check_faction
				condition = function(self, context) 
					local local_faction = cm:get_local_faction_name(true)
					return local_faction == self.persistent.active_faction
				end,
				callback = function(self, context)
					egypt_political_states:activate_button("button_fm_phar_khufu")
				end,
				persistent = false,
			},

			-- building repaired
			{
				event = "CampaignBuildingRepaired",
				condition = function(self, context)
					local garrison_residence = context:garrison_residence()
					local region = garrison_residence:region()
					if region and not region:is_null_interface()
						and region:owning_faction():name() ~= self.persistent.active_faction
					then
						return false
					end

					if not garrison_residence:is_slot() then
						return false
					end
					local slot = garrison_residence:slot_interface()
					local building = slot:building()
					if building:is_null_interface() then
						self:output("Error: Khufu received CampaignBuildingRepaired but there is no building in the slot", 10)
						return
					end

					local building_key = building:name()
					if self:get_wonder_by_building_key(building_key) then
						return true
					end
					return false
				end,
				callback = function(self, context)
					local garrison_residence = context:garrison_residence()
					local region_key = garrison_residence:region():name()
					self:repair_wonder(region_key)
				end,
			},

			-- building damaged
			{
				event = "CampaignBuildingDamaged",
				condition = function(self, context)
					local garrison_residence = context:garrison_residence()
					local region = garrison_residence:region()
					if region and not region:is_null_interface()
						and region:owning_faction():name() ~= self.persistent.active_faction
					then
						return false
					end
					if not garrison_residence:is_slot() then
						return false
					end
					local slot = garrison_residence:slot_interface()
					local building = slot:building()
					if building:is_null_interface() then
						self:output("Error: Khufu received CampaignBuildingDamaged but there is no building in the slot", 10)
						return false
					end
					local building_key = building:name()
					if self:get_wonder_by_building_key(building_key) then
						return true
					end
					return false
				end,
				callback = function(self, context)
					local garrison_residence = context:garrison_residence()
					local region_key = garrison_residence:region():name()
					local slot = garrison_residence:slot_interface()
					local building_health = slot:building():percent_health()
					self:damage_wonder(region_key, building_health)
				end,
			},

			-- building demolished
			{
				event = "BuildingDemolished",
				auto_check_faction = true,
				condition = function(self, context)
					local garrison_residence = context:garrison_residence()
					local region = garrison_residence:region()
					if region and not region:is_null_interface()
						and region:owning_faction():name() ~= self.persistent.active_faction
					then
						return false
					end
					if not garrison_residence:is_slot() then
						return false
					end
					return true
				end,
				callback = function(self, context)
					local garrison_residence = context:garrison_residence()
					local slot = garrison_residence:slot_interface()
					local building = slot:building()
					if building:is_null_interface() then
						self:output("Error: Khufu received BuildingDemolished but there is no building in the slot", 10)
						return
					end

					local building_key = building:name()
					local wonder = self:get_wonder_by_building_key(building_key)
					if wonder then
						self:demolish_wonder(wonder.key)
					end
				end,
			},

			{
				event = "RegionFactionChangeEvent",
				condition = true,
				callback = function(self, context)
					local region = context:region()
					local region_key = region:name()

					-- If a wonder has special effects that are applied to a province, they need to be refreshed when the region owner changed
					-- since they are applied to the region's faction province manager which is tied to the faction that owns it
					local common_wonder_data = self:get_common_wonder_data()
					for _, wonder_data in ipairs(common_wonder_data) do
						if wonder_data.state == khufu_config.construction_states.finished then
							local wonder_config = self:get_wonder_config(wonder_data.key)
							local special_effect_bundles = wonder_config.special_effects.effect_bundles or {}
							local special_effect_realms = wonder_config.special_effects.realms or {}
							local special_effect_region_lists = wonder_config.special_effects.region_lists or {}
							for _, bundle in ipairs(special_effect_bundles) do
								if bundle.apply_to_province then
									for _, realm in ipairs(special_effect_realms) do
										local realm_data = phar_realms.get_realm(realm)
										if realm_data and realm_data.regions and table_find(realm_data.regions, region_key) then
											self:toggle_special_effect_on_region(bundle, region_key, true)
										end
									end
									for _, region_list in ipairs(special_effect_region_lists) do
										if table_find(region_list, region_key) then
											self:toggle_special_effect_on_region(bundle, region_key, true)
										end
									end
								end
							end
						end
					end

					local wonder_for_region = table_find(khufu_config.wonders, function(e) return e.region_key == region_key end)
					if not wonder_for_region then
						return false
					end

					local new_faction = region:owning_faction()
					local new_faction_key = new_faction:name()

					local wonder_data = self:get_wonder_data(wonder_for_region.key)
					if wonder_data then
						-- This listener will trigger for each Khufu faction, so do the transfer just once
						if wonder_data.owner_faction ~= new_faction_key then
							wonder_data.owner_faction = new_faction_key
						end
					end

					self:update_possible_construction_alert()

					if self.persistent.active_faction == new_faction_key and (not new_faction:is_human()) then
						self:ai_handle_wonder_regions()
					end

					-- Make AI try to retake wonder it has lost
					local previous_faction = context:previous_faction()
					local previous_faction_key = previous_faction:name()
					if self.persistent.active_faction == previous_faction_key and (not previous_faction:is_human()) then
						cm:cai_add_region_hint(previous_faction, region_key)
					end
				end,
			},

			{
				event = "CharacterPerformsSettlementOccupationDecision",
				condition = true,
				callback = function(self, context)
					local occupation_decision = context:occupation_decision_option()
					if occupation_decision ~= "occupation_decision_raze_without_occupy" then
						return false
					end

					local region = context:garrison_residence():region()
					if not region or region:is_null_interface() then
						return
					end
					local region_key = region:name()

					local wonder_for_region = table_find(khufu_config.wonders, function(e) return e.region_key == region_key end)
					if not wonder_for_region then
						return false
					end

					local owner_faction = region:owning_faction()

					local wonder_data = self:get_wonder_data(wonder_for_region.key)
					if not wonder_data then
						return false
					end

					self:damage_wonder(region_key, 50)
				end,
			},

			{
				-- Send the invasion raiding after sieging the wonder
				event = "BattleConflictFinished",
				condition = true,
				callback = function(self, context)
					local pb = context:pending_battle()
					if not pb:has_been_fought() then 
						return
					end

					local defender = pb:defender()
					if not (defender and not defender:is_null_interface() and defender:faction():name() == self.persistent.active_faction) then
						return
					end
					
					local attacker = pb:attacker()
					if not (attacker and not attacker:is_null_interface()) then
						return
					end
					
					local attacker_general_cqi = attacker:command_queue_index()

					-- Check if it is an invasion faction
					local corresponding_wonder_data = table_find(self:get_owned_wonder_data(),
						function(e)
							local invasion_key = e.invasion_key
							if not invasion_key then
								return false
							end

							local invasion = invasion_manager:get_invasion(invasion_key)
							local invading_general = invasion and invasion:get_general()
							if not invading_general or invading_general:is_null_interface() then
								return false
							end

							return invading_general:command_queue_index() == attacker_general_cqi
						end)
					if not corresponding_wonder_data then
						return
					end

					local contested_garrison = pb:contested_garrison()
					if contested_garrison:is_null_interface() then
						return
					end

					if not contested_garrison:is_slot() then
						return
					end

					local wonder_key = corresponding_wonder_data.key
					local wonder_config = self:get_wonder_config(wonder_key)
					if not wonder_config then
						return
					end

					local invasion_instance = invasion_manager:get_invasion(corresponding_wonder_data.invasion_key)
					if not invasion_instance then
						return
					end

					-- This depends on a future fix to wonder garrisons to be left without units for while after a successfull attack, or the zone of control will prevent the invasion from moving
					local raid_position_formatted = { x = wonder_config.invasion.raid_position[1], y = wonder_config.invasion.raid_position[2] }
					invasion_instance:set_target("RAID_LOCATION", raid_position_formatted, self.persistent.active_faction)
					invasion_instance.stop_at_end = true

					corresponding_wonder_data.invasion_key = nil

					if self.persistent.active_faction == cm:get_local_faction_name(true) then
						local did_wonder_owner_win = self.persistent.active_faction ~= pb:battle_results():losing_faction_key()
						local is_human_attacker = attacker:faction():is_human()
						cm:notify_khufu_wonder_attacked(self.persistent.active_faction, wonder_key, did_wonder_owner_win, is_human_attacker)
					end
				end,
			}
		}
	end,

	-- restrict building of wonders through the building browser
	core:add_listener(
		"PharKhufu_FirstTickAfterWorldCreated",
		"FirstTickAfterWorldCreated",
		true,
		function(context)
			local factions_list = context:world():faction_list()
			for i=0, factions_list:num_items() -1 do
				local curr_faction_name = factions_list:item_at(i):name()
				ancient_legacies_khufu.restrict_buildings(curr_faction_name, true)
			end
		end,
		true
	),

	-- persistent data is already loaded by ancient_legacy_common, we are just informed we are loaded
	on_loading_game = function(self, faction_title)
	end,
}

return ancient_legacies_khufu