out("Loading troy_rem_rhesus_thracian_rituals.lua")

---------------------------------------------------------------
------------------------ CONSTANTS ----------------------------
---------------------------------------------------------------


thracian_rituals = {
	faction_key = "troy_rem_trj_thrace",
	resource = {
		key = "troy_rem_rhesos_devotion",
		factors = {
			faction = "troy_resource_factor_faction",
			god_attitude = "troy_god_attitude_factor_battles"
		}
	},
	vo_event = "campaign_vo_cs_rem_rhesus_fm_thracian_rituals",
	
	-- NOTE: We have different groups of rituals. By design, only one ritual per group can be active at the time
	-- !!!!! Keep this up to date with the groups from the rituals table above
	-- NOTE: Ritual cooldown is applied to the whole group upon deactivation of the ritual
	ritual_groups = {"passive"--[[Divine Offerings--]], "armies"--[[Holy Sacrifices--]], "provinces"--[[Religious Mysteries--]], "elite_units"--[[Sacred Initiations--]]},
	groups_ui = {
		passive = {
			title = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_divine_offerings_group_title", 
			description = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_divine_offerings_group_description"
		},
		armies = {
			title = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_holy_sacrifices_group_title", 
			description = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_holy_sacrifices_group_description"  
		},
		provinces = {
			title = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_religious_mysteries_group_title", 
			description = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_religious_mysteries_group_description"
		},
		elite_units = {
			title = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_sacred_initiations_group_title", 
			description = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_sacred_initiations_group_description"
		},
	},
	groups_with_unit_bonus = { -- set to true if the group has a ritual which gives a special unit to the mercenary pool
		passive = false,
		armies = false,
		provinces = false,
		elite_units = true,
	},

	rituals = {

		-- EXAMPLE ENTRY with ADDITIONAL INFORMATION

		-- my_fancy_rittual = {
		--	 group_name = "passive", -- should be the same as in the ritual_groups table above

		--	  ui_title = "ui_text_replacements_something",
		--	  ui_description = "some_other_table_localised_field",

		--	 cooldown = 0, -- if == 0 -> no cooldown; if > 0 -> cooldown in turns. This cooldown is applied after the ritual expires
		--	 cancel_cooldown = 0, -- This cooldown is applied when the player mannualy cancels the ritual
		--	 duration = 0, -- if < 0 -> instant effect; if == 0 -> infinite duration; if > 0 -> duration in turns

		--	 -- Activation cost. Can be an empty table ( activation_cost = {} ) if there is no cost.
		--	 activation_cost = {
		--		 {"troy_food", 400},
		--		 {"troy_wood", 100},
		--		 {"any resource I'd like key", 1000}
		--	 },

		--	 -- Every entry in the following table represents different tier of this ritual
		--	 -- It is possible to have only one tier for given ritual
		--	 -- Keep in mind the order of the elements, the active tier will be the last one that is available, i.e. if you meet the buildings requirements for all tiers, you get the last one
		--	 tiers = {
		--		 [1] = {
		--			 required_buildings = {  -- List of required buildings and culture variants for the UI: 
		--									 -- For every entry in this table you need to have a building from that chain that is at least 
		--									 -- the specified min_level. The culture variant record is of the building with level min_level 
		--									 -- and is used in the UI. If this is an empty table {}, the tier is always available
		--					  {
		--						  chain_key = "troy_rem_special_rhesus_ritual_ground",
		--						  min_level = 1,
		--						  culture_variant = "troy_rem_special_rhesus_ritual_ground_3",
		--						  unlock_info_loc_key = nil -- Optional info to display next to the building name: Example value: ui_text_replacements_localised_text_troy_rem_thracian_rituals_offerings_description_hera
		--					  },
		--					  {
		--						  chain_key = "some_other_chain",
		--						  min_level = 0,
		--						  culture_variant = "The culture variant key of the building from this chain with level equal to min_level",
		--						  unlock_info_loc_key = nil -- Optional info to display next to the building name: Example value: ui_text_replacements_localised_text_troy_rem_thracian_rituals_offerings_description_hera
		--					  },
		--				 },
		--			 bundle_key = "effect_bundle_rem_thracian_rituals_offerings_altar_hera", -- "effect_bundle_record_key", -- Effect bundle key: This is the effect bundle that will be applied if this tier is active
		--			 post_battle_loot_resources = {{"troy_rem_rhesos_devotion", 2}, {"troy_god_attitude_hera", 20}}, -- [optional] default value is nil; format: post_battle_loot_resources = {{"res1", value}, {"res2", value}}
		--			 special_unit_reward = { -- [optional] default value is nil; format: special_unit_reward = {unit_key = "main_units key", num_units = 2, cap = 6}
		--				 unit_key = "troy_rem_thr_rhes_warriors_of_pangaion", -- main_units record key
		--				 num_units = 2, -- number of units that will be given upon activation
		--				 cap = 6 -- maximum number of units of this type you can have in the mercenary pool
		--			 }
		--		 },
		--		 [2] = {
		--			 required_buildings = {  -- List of required buildings and culture variants for the UI: 
		--									 --For every entry in this table you need to have a building from that chain that is at least 
		--									 -- the specified min_level. The culture variant record is of the building with level min_level 
		--									 -- and is used in the UI. If this is an empty table {}, the tier is always available
		--					 {
		--						 chain_key = "troy_rem_special_rhesus_ritual_ground",
		--						 min_level = 2,
		--						 culture_variant = "troy_rem_special_rhesus_ritual_ground_3",
		--						 unlock_info_loc_key = nil -- Optional info to display next to the building name: Example value: ui_text_replacements_localised_text_troy_rem_thracian_rituals_offerings_description_hera
		--					 },
		--					 {
		--						 chain_key = "some_other_chain",
		--						 min_level = 1,
		--						 culture_variant = "The culture variant key of the building from this chain with level equal to min_level",
		--						 unlock_info_loc_key = nil -- Optional info to display next to the building name: Example value: ui_text_replacements_localised_text_troy_rem_thracian_rituals_offerings_description_hera
		--					 },
		--				 },
		--			 bundle_key = "effect_bundle_rem_thracian_rituals_offerings_sanctuary_hera", -- "effect_bundle_record_key", -- Effect bundle key: This is the effect bundle that will be applied if this tier is active
		--			 post_battle_loot_resources = {{"troy_rem_rhesos_devotion", 2}, {"troy_god_attitude_hera", 30}}, -- [optional] default value is nil; format: post_battle_loot_resources = {{"res1", value}, {"res2", value}}
		--			 special_unit_reward = nil -- [optional] default value is nil; format: special_unit_reward = {unit_key = "main_units key", num_units = 2, cap = 6}
		--		 }
		--	 },
		-- 
		--	 -- Optional callbacks
		--	 on_pre_activate = nil,
		--	 on_post_activate = nil,
		--	 on_pre_deactivate = nil,
		--	 on_post_deactivate = nil,
		-- },


		-- Divine Offerings (PASSIVE RITUALS)
		offerings_to_hera = {
			group_name = "passive",
			attitude_key = "troy_god_attitude_hera",

			ui_title = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_offerings_to_hera_title", 
			ui_description = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_offerings_description_hera", 

			cooldown = 0,
			cancel_cooldown = 0,
			duration = 0,

			activation_cost = {
				{"troy_food", 400},
				{"troy_wood", 100},
				{"troy_rem_rhesos_devotion", 1}
			},

			tiers = {
				[1] = {
					required_buildings = {
					{
					chain_key = "troy_main_religion_hera",
					min_level = 0,
					culture_variant = "troy_main_religion_hera_2"
					},						
						-- {
						--	 key = "troy_main_religion_hera_2",
						--	 culture_variant = "troy_main_religion_hera_2"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_offerings_altar_hera",
					post_battle_loot_resources = {{"troy_rem_rhesos_devotion", 2}, {"troy_god_attitude_hera", 20}},
					special_unit_reward = nil
				},
				[2] = {
					required_buildings = {
					{
					chain_key = "troy_main_religion_hera",
					min_level = 1,
					culture_variant = "troy_main_religion_hera_3"
					},  
						-- {
						--	 key = "troy_main_religion_hera_3",
						--	 culture_variant = "troy_main_religion_hera_3"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_offerings_sanctuary_hera",
					post_battle_loot_resources = {{"troy_rem_rhesos_devotion", 2}, {"troy_god_attitude_hera", 30}},
					special_unit_reward = nil
				},
				[3] = {
					required_buildings = {
					{
					chain_key = "troy_main_religion_hera",
					min_level = 2,
					culture_variant = "troy_main_religion_hera_4"
					},  
						-- {
						--	 key = "troy_main_religion_hera_4",
						--	 culture_variant = "troy_main_religion_hera_4"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_offerings_temple_hera",
					post_battle_loot_resources = {{"troy_rem_rhesos_devotion", 2}, {"troy_god_attitude_hera", 40}},
					special_unit_reward = nil
				}
			},
		},

		offerings_to_zeus = {
			group_name = "passive",
			attitude_key = "troy_god_attitude_zeus",

			ui_title = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_offerings_to_zeus_title", 
			ui_description = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_offerings_description_zeus", 

			cooldown = 0,
			cancel_cooldown = 0,
			duration = 0,

			activation_cost = {
				{"troy_food", 400},
				{"troy_wood", 100},
				{"troy_rem_rhesos_devotion", 1}
			},

			tiers = {
				[1] = {
					required_buildings = {
						{
							chain_key = "troy_main_religion_zeus",
							min_level = 0,
							culture_variant = "troy_main_religion_zeus_2"
						},
						-- {
						--	 key = "troy_main_religion_zeus_2",
						--	 culture_variant = "troy_main_religion_zeus_2"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_offerings_altar_zeus",
					post_battle_loot_resources = {{"troy_rem_rhesos_devotion", 2}, {"troy_god_attitude_zeus", 20}},
					special_unit_reward = nil
				},
				[2] = {
					required_buildings = {
						{
							chain_key = "troy_main_religion_zeus",
							min_level = 1,
							culture_variant = "troy_main_religion_zeus_3"
						},
						-- {
						--	 key = "troy_main_religion_zeus_3",
						--	 culture_variant = "troy_main_religion_zeus_3"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_offerings_sanctuary_zeus",
					post_battle_loot_resources = {{"troy_rem_rhesos_devotion", 2}, {"troy_god_attitude_zeus", 30}},
					special_unit_reward = nil
				},
				[3] = {
					required_buildings = {
						{
							chain_key = "troy_main_religion_zeus",
							min_level = 2,
							culture_variant = "troy_main_religion_zeus_4"
						},
						-- {
						--	 key = "troy_main_religion_zeus_4",
						--	 culture_variant = "troy_main_religion_zeus_4"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_offerings_temple_zeus",
					post_battle_loot_resources = {{"troy_rem_rhesos_devotion", 2}, {"troy_god_attitude_zeus", 40}},
					special_unit_reward = nil
				}
			},
		},

		offerings_to_ares = {
			group_name = "passive",
			attitude_key = "troy_god_attitude_ares",

			ui_title = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_offerings_to_ares_title", 
			ui_description = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_offerings_description_ares", 

			cooldown = 0,
			cancel_cooldown = 0,
			duration = 0,

			activation_cost = {
				{"troy_food", 400},
				{"troy_wood", 100},
				{"troy_rem_rhesos_devotion", 1}
			},

			tiers = {
				[1] = {
					required_buildings = {
						{
							chain_key = "troy_main_religion_ares",
							min_level = 0,
							culture_variant = "troy_main_religion_ares_2"
						},
						-- {
						--	 key = "troy_main_religion_ares_2",
						--	 culture_variant = "troy_main_religion_ares_2"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_offerings_altar_ares",
					post_battle_loot_resources = {{"troy_rem_rhesos_devotion", 2}, {"troy_god_attitude_ares", 20}},
					special_unit_reward = nil
				},
				[2] = {
					required_buildings = {
						{
							chain_key = "troy_main_religion_ares",
							min_level = 1,
							culture_variant = "troy_main_religion_ares_3"
						},
						-- {
						--	 key = "troy_main_religion_ares_3",
						--	 culture_variant = "troy_main_religion_ares_3"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_offerings_sanctuary_ares",
					post_battle_loot_resources = {{"troy_rem_rhesos_devotion", 2}, {"troy_god_attitude_ares", 30}},
					special_unit_reward = nil
				},
				[3] = {
					required_buildings = {
						{
							chain_key = "troy_main_religion_ares",
							min_level = 2,
							culture_variant = "troy_main_religion_ares_4"
						},
						-- {
						--	 key = "troy_main_religion_ares_4",
						--	 culture_variant = "troy_main_religion_ares_4"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_offerings_temple_ares",
					post_battle_loot_resources = {{"troy_rem_rhesos_devotion", 2}, {"troy_god_attitude_ares", 40}},
					special_unit_reward = nil
				}
			},
		},

		offerings_to_apollo = {
			group_name = "passive",
			attitude_key = "troy_god_attitude_apollo",

			ui_title = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_offerings_to_apollo_title", 
			ui_description = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_offerings_description_appolo", 

			cooldown = 0,
			cancel_cooldown = 0,
			duration = 0,

			activation_cost = {
				{"troy_food", 400},
				{"troy_wood", 100},
				{"troy_rem_rhesos_devotion", 1}
			},

			tiers = {
				[1] = {
					required_buildings = {
						{
							chain_key = "troy_rem_religion_apollo",
							min_level = 0,
							culture_variant = "troy_rem_religion_apollo_2"
						},
						-- {
						--	 key = "troy_main_religion_apollo_2",
						--	 culture_variant = "troy_main_religion_apollo_2"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_offerings_altar_apollo",
					post_battle_loot_resources = {{"troy_rem_rhesos_devotion", 2}, {"troy_god_attitude_apollo", 20}},
					special_unit_reward = nil
				},
				[2] = {
					required_buildings = {
						{
							chain_key = "troy_rem_religion_apollo",
							min_level = 1,
							culture_variant = "troy_rem_religion_apollo_3"
						},
						-- {
						--	 key = "troy_main_religion_apollo_3",
						--	 culture_variant = "troy_main_religion_apollo_3"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_offerings_sanctuary_apollo",
					post_battle_loot_resources = {{"troy_rem_rhesos_devotion", 2}, {"troy_god_attitude_apollo", 30}},
					special_unit_reward = nil
				},
				[3] = {
					required_buildings = {
						{
							chain_key = "troy_rem_religion_apollo",
							min_level = 2,
							culture_variant = "troy_rem_religion_apollo_4"
						},
						-- {
						--	 key = "troy_main_religion_apollo_4",
						--	 culture_variant = "troy_main_religion_apollo_4"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_offerings_temple_apollo",
					post_battle_loot_resources = {{"troy_rem_rhesos_devotion", 2}, {"troy_god_attitude_apollo", 40}},
					special_unit_reward = nil
				}
			},
		},

		offerings_to_athena = {
			group_name = "passive",
			attitude_key = "troy_god_attitude_athena",

			ui_title = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_offerings_to_athena_title", 
			ui_description = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_offerings_description_athena", 

			cooldown = 0,
			cancel_cooldown = 0,
			duration = 0,

			activation_cost = {
				{"troy_food", 400},
				{"troy_wood", 100},
				{"troy_rem_rhesos_devotion", 1}
			},

			tiers = {
				[1] = {
					required_buildings = {
						{
							chain_key = "troy_main_religion_athens",
							min_level = 0,
							culture_variant = "troy_main_religion_athens_2"
						},
						-- {
						--	 key = "troy_main_religion_athens_2",
						--	 culture_variant = "troy_main_religion_athens_2"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_offerings_altar_athena",
					post_battle_loot_resources = {{"troy_rem_rhesos_devotion", 2}, {"troy_god_attitude_athena", 20}},
					special_unit_reward = nil
				},
				[2] = {
					required_buildings = {
						{
							chain_key = "troy_main_religion_athens",
							min_level = 1,
							culture_variant = "troy_main_religion_athens_3"
						},
						-- {
						--	 key = "troy_main_religion_athens_3",
						--	 culture_variant = "troy_main_religion_athens_3"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_offerings_sanctuary_athena",
					post_battle_loot_resources = {{"troy_rem_rhesos_devotion", 2}, {"troy_god_attitude_athena", 30}},
					special_unit_reward = nil
				},
				[3] = {
					required_buildings = {
						{
							chain_key = "troy_main_religion_athens",
							min_level = 2,
							culture_variant = "troy_main_religion_athens_4"
						},
						-- {
						--	 key = "troy_main_religion_athens_4",
						--	 culture_variant = "troy_main_religion_athens_4"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_offerings_temple_athena",
					post_battle_loot_resources = {{"troy_rem_rhesos_devotion", 2}, {"troy_god_attitude_athena", 40}},
					special_unit_reward = nil
				}
			},
		},
		
		offerings_to_poseidon = {
			group_name = "passive",
			attitude_key = "troy_god_attitude_poseidon",

			ui_title = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_offerings_to_poseidon_title", 
			ui_description = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_offerings_description_poseidon", 

			cooldown = 0,
			cancel_cooldown = 0,
			duration = 0,

			activation_cost = {
				{"troy_food", 400},
				{"troy_wood", 100},
				{"troy_rem_rhesos_devotion", 1}
			},

			tiers = {
				[1] = {
					required_buildings = {
						{
							chain_key = "troy_main_religion_poseidon",
							min_level = 0,
							culture_variant = "troy_main_religion_poseidon_2"
						},
						-- {
						--	 key = "troy_main_religion_poseidon_2",
						--	 culture_variant = "troy_main_religion_poseidon_2"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_offerings_altar_poseidon",
					post_battle_loot_resources = {{"troy_rem_rhesos_devotion", 2}, {"troy_god_attitude_poseidon", 20}},
					special_unit_reward = nil
				},
				[2] = {
					required_buildings = {
						{
							chain_key = "troy_main_religion_poseidon",
							min_level = 1,
							culture_variant = "troy_main_religion_poseidon_3"
						},
						-- {
						--	 key = "troy_main_religion_poseidon_3",
						--	 culture_variant = "troy_main_religion_poseidon_3"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_offerings_sanctuary_poseidon",
					post_battle_loot_resources = {{"troy_rem_rhesos_devotion", 2}, {"troy_god_attitude_poseidon", 30}},
					special_unit_reward = nil
				},
				[3] = {
					required_buildings = {
						{
							chain_key = "troy_main_religion_poseidon",
							min_level = 2,
							culture_variant = "troy_main_religion_poseidon_4"
						},
						-- {
						--	 key = "troy_main_religion_poseidon_4",
						--	 culture_variant = "troy_main_religion_poseidon_4"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_offerings_temple_poseidon",
					post_battle_loot_resources = {{"troy_rem_rhesos_devotion", 2}, {"troy_god_attitude_poseidon", 40}},
					special_unit_reward = nil
				}
			},
		},

		offerings_to_aphrodite = {
			group_name = "passive",
			attitude_key = "troy_god_attitude_aphrodite",

			ui_title = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_offerings_to_aphrodite_title", 
			ui_description = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_offerings_description_aphrodite", 

			cooldown = 0,
			cancel_cooldown = 0,
			duration = 0,

			activation_cost = {
				{"troy_food", 400},
				{"troy_wood", 100},
				{"troy_rem_rhesos_devotion", 1}
			},

			tiers = {
				[1] = {
					required_buildings = {
						{
							chain_key = "troy_main_religion_aphrodite",
							min_level = 0,
							culture_variant = "troy_main_religion_aphrodite_2"
						},
						-- {
						--	 key = "troy_main_religion_aphrodite_2",
						--	 culture_variant = "troy_main_religion_aphrodite_2"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_offerings_altar_aphrodite",
					post_battle_loot_resources = {{"troy_rem_rhesos_devotion", 2}, {"troy_god_attitude_aphrodite", 20}},
					special_unit_reward = nil
				},
				[2] = {
					required_buildings = {
						{
							chain_key = "troy_main_religion_aphrodite",
							min_level = 1,
							culture_variant = "troy_main_religion_aphrodite_3"
						},
						-- {
						--	 key = "troy_main_religion_aphrodite_3",
						--	 culture_variant = "troy_main_religion_aphrodite_3"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_offerings_sanctuary_aphrodite",
					post_battle_loot_resources = {{"troy_rem_rhesos_devotion", 2}, {"troy_god_attitude_aphrodite", 30}},
					special_unit_reward = nil
				},
				[3] = {
					required_buildings = {
						{
							chain_key = "troy_main_religion_aphrodite",
							min_level = 2,
							culture_variant = "troy_main_religion_aphrodite_4"
						},
						-- {
						--	 key = "troy_main_religion_aphrodite_4",
						--	 culture_variant = "troy_main_religion_aphrodite_4"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_offerings_temple_aphrodite",
					post_battle_loot_resources = {{"troy_rem_rhesos_devotion", 2}, {"troy_god_attitude_aphrodite", 40}},
					special_unit_reward = nil
				}
			},
		},

		offerings_to_artemis = {
			group_name = "passive",
			attitude_key = "troy_god_attitude_artemis",

			ui_title = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_offerings_to_artemis_title", 
			ui_description = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_offerings_description_artemis", 

			cooldown = 0,
			cancel_cooldown = 0,
			duration = 0,

			activation_cost = {
				{"troy_food", 400},
				{"troy_wood", 100},
				{"troy_rem_rhesos_devotion", 1}
			},

			tiers = {
				[1] = {
					required_buildings = {
						{
							chain_key = "troy_main_religion_artemis",
							min_level = 0,
							culture_variant = "troy_main_religion_artemis_2"
						},
						-- {
						--	 key = "troy_main_religion_artemis_2",
						--	 culture_variant = "troy_main_religion_artemis_2"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_offerings_altar_artemis",
					post_battle_loot_resources = {{"troy_rem_rhesos_devotion", 2}, {"troy_god_attitude_artemis", 20}},
					special_unit_reward = nil
				},
				[2] = {
					required_buildings = {
						{
							chain_key = "troy_main_religion_artemis",
							min_level = 1,
							culture_variant = "troy_main_religion_artemis_3"
						},
						-- {
						--	 key = "troy_main_religion_artemis_3",
						--	 culture_variant = "troy_main_religion_artemis_3"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_offerings_sanctuary_artemis",
					post_battle_loot_resources = {{"troy_rem_rhesos_devotion", 2}, {"troy_god_attitude_artemis", 30}},
					special_unit_reward = nil
				},
				[3] = {
					required_buildings = {
						{
							chain_key = "troy_main_religion_artemis",
							min_level = 2,
							culture_variant = "troy_main_religion_artemis_4"
						},
						-- {
						--	 key = "troy_main_religion_artemis_4",
						--	 culture_variant = "troy_main_religion_artemis_4"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_offerings_temple_artemis",
					post_battle_loot_resources = {{"troy_rem_rhesos_devotion", 2}, {"troy_god_attitude_artemis", 40}},
					special_unit_reward = nil
				}
			},
		},

		offerings_to_hephaestus = {
			group_name = "passive",
			attitude_key = "troy_god_attitude_hephaestus",

			ui_title = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_offerings_to_hephaestus_title", 
			ui_description = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_offerings_description_hephaestus", 
			cooldown = 0,
			cancel_cooldown = 0,
			duration = 0,

			activation_cost = {
				{"troy_food", 400},
				{"troy_wood", 100},
				{"troy_rem_rhesos_devotion", 1}
			},

			tiers = {
				[1] = {
					required_buildings = {
						{
							chain_key = "troy_hep_religion_hephaestus",
							min_level = 0,
							culture_variant = "troy_hep_religion_hephaestus_2"
						},
						-- {
						--	 key = "troy_hep_religion_hephaestus_2",
						--	 culture_variant = "troy_hep_religion_hephaestus_2"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_offerings_altar_hephaestus",
					post_battle_loot_resources = {{"troy_rem_rhesos_devotion", 2}, {"troy_god_attitude_hephaestus", 20}},
					special_unit_reward = nil
				},
				[2] = {
					required_buildings = {
						{
							chain_key = "troy_hep_religion_hephaestus",
							min_level = 1,
							culture_variant = "troy_hep_religion_hephaestus_3"
						},
						-- {
						--	 key = "troy_hep_religion_hephaestus_3",
						--	 culture_variant = "troy_hep_religion_hephaestus_3"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_offerings_sanctuary_hephaestus",
					post_battle_loot_resources = {{"troy_rem_rhesos_devotion", 2}, {"troy_god_attitude_hephaestus", 30}},
					special_unit_reward = nil
				},
				[3] = {
					required_buildings = {
						{
							chain_key = "troy_hep_religion_hephaestus",
							min_level = 2,
							culture_variant = "troy_hep_religion_hephaestus_4"
						},
						-- {
						--	 key = "troy_hep_religion_hephaestus_4",
						--	 culture_variant = "troy_hep_religion_hephaestus_4"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_offerings_temple_hephaestus",
					post_battle_loot_resources = {{"troy_rem_rhesos_devotion", 2}, {"troy_god_attitude_hephaestus", 40}},
					special_unit_reward = nil
				}
			},
		},

		-- Religious Mysteries (PROVINCE RITUALS)
		dionysia = {
			group_name = "provinces",

			ui_title = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_religious_mysteries_dionysia_title", 
			ui_description = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_religious_mysteries_description_dionysia", 

			cooldown = 3,
			cancel_cooldown = 1,
			duration = 5,

			activation_cost = {
				{"troy_food", 400},
				{"troy_wood", 400}
			},

			tiers = {
				[1] = {
					required_buildings = {
						{
							chain_key = "troy_rem_special_rhesus_ritual_ground",
							min_level = 1,
							culture_variant = "troy_rem_special_rhesus_ritual_ground_3"
						},
						-- {
						--	 key = "troy_rem_special_rhesus_ritual_ground_3", 
						--	 culture_variant = "troy_rem_special_rhesus_ritual_ground_3"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_mysteris_dionysia",
					post_battle_loot_resources = nil,
					special_unit_reward = nil
				}
			},
		},

		bendideia = {
			group_name = "provinces",

			ui_title = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_religious_mysteries_bendideia_title", 
			ui_description = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_religious_mysteries_description_bendideia", 

			cooldown = 2,
			cancel_cooldown = 1,
			duration = 5,

			activation_cost = {
				{"troy_food", 500},
				{"troy_wood", 500}
			},

			tiers = {
				[1] = {
					required_buildings = {
						{
							chain_key = "troy_rem_special_rhesus_ritual_ground",
							min_level = 1,
							culture_variant = "troy_rem_special_rhesus_ritual_ground_3"
						},
						-- {
						--	 key = "troy_rem_special_rhesus_ritual_ground_3", 
						--	 culture_variant = "troy_rem_special_rhesus_ritual_ground_3"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_mysteris_bendideia",
					post_battle_loot_resources = nil,
					special_unit_reward = nil
				}
			},
		},

		honouring_of_semele = {
			group_name = "provinces",

			ui_title = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_religious_mysteries_semele_title", 
			ui_description = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_religious_mysteries_description_semeleia", 

			cooldown = 3,
			cancel_cooldown = 1,
			duration = 3,

			activation_cost = {
				{"troy_food", 600},
				{"troy_stones", 500}
			},

			tiers = {
				[1] = {
					required_buildings = {},
					bundle_key = "effect_bundle_rem_thracian_rituals_mysteris_semele",
					post_battle_loot_resources = nil,
					special_unit_reward = nil
				}
			},
		},

		darzaleia = {
			group_name = "provinces",

			ui_title = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_religious_mysteries_darzaleia_title", 
			ui_description = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_religious_mysteries_description_darzaleia", 

			cooldown = 2,
			cancel_cooldown = 1,
			duration = 4,

			activation_cost = {
				{"troy_food", 400},
				{"troy_wood", 300}
			},

			tiers = {
				[1] = {
					required_buildings = {},
					bundle_key = "effect_bundle_rem_thracian_rituals_mysteris_darzaleia",
					post_battle_loot_resources = nil,
					special_unit_reward = nil
				}
			},
		},

		kotyttia = {
			group_name = "provinces",

			ui_title = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_religious_mysteries_kotyttia_title", 
			ui_description = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_religious_mysteries_description_kotyttia", 

			cooldown = 4,
			cancel_cooldown = 1,
			duration = 4,

			activation_cost = {
				{"troy_food", 700},
				{"troy_bronze", 200}
			},

			tiers = {
				[1] = {
					required_buildings = {},
					bundle_key = "effect_bundle_rem_thracian_rituals_mysteris_kotyttia",
					post_battle_loot_resources = nil,
					special_unit_reward = nil
				}
			},
		},

		-- Holy Sacrifices (ARMY RITUALS)
		sacrifice_to_bendis = {
			group_name = "armies",

			ui_title = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_holy_sacrifices_bendis_title", 
			ui_description = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_holy_sacrifices_description_bendis", 

			cooldown = 3,
			cancel_cooldown = 1,
			duration = 4,

			activation_cost = {
				{"troy_food", 500},
				{"troy_wood", 400},
				{"troy_rem_rhesos_devotion", 5}
			},

			tiers = {
				[1] = {
					required_buildings = {},
					bundle_key = "effect_bundle_rem_thracian_rituals_sacrifice_bendis",
					post_battle_loot_resources = nil,
					special_unit_reward = nil
				}
			},

			-- apply the movement bonus on the same turn
			on_post_activate = function()
				local movement_bonus_effect = "troy_effect_army_campaign_movement_range"
				local bundle = cm:create_new_custom_effect_bundle("effect_bundle_rem_thracian_rituals_sacrifice_bendis")
				local effects = bundle:effects()
				local movement_bonus = 0.1
				for i = 0, effects:num_items() - 1 do
					local effect = effects:item_at(i)
					if effect:key() == movement_bonus_effect then
						movement_bonus = effect:value() / 100
						break
					end
				end

				local faction = cm:get_faction(thracian_rituals.faction_key)
				local characters = faction:character_list()
				for i = 0, characters:num_items() - 1 do
					cm:replenish_action_points(cm:char_lookup_str(characters:item_at(i):command_queue_index()), 0, movement_bonus)
				end
			end,
			on_pre_deactivate = function()
				local movement_bonus_effect = "troy_effect_army_campaign_movement_range"
				local bundle = cm:create_new_custom_effect_bundle("effect_bundle_rem_thracian_rituals_sacrifice_bendis")
				local effects = bundle:effects()
				local movement_bonus = 0.1
				for i = 0, effects:num_items() - 1 do
					local effect = effects:item_at(i)
					if effect:key() == movement_bonus_effect then
						movement_bonus = effect:value() / 100
						break
					end
				end

				local faction = cm:get_faction(thracian_rituals.faction_key)
				local characters = faction:character_list()
				for i = 0, characters:num_items() - 1 do
					cm:replenish_action_points(cm:char_lookup_str(characters:item_at(i):command_queue_index()), 0, -movement_bonus)
				end
			end
		},

		kotys_bathing_ritual = {
			group_name = "armies",

			ui_title = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_holy_sacrifices_kotys_title", 
			ui_description = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_holy_sacrifices_description_kotys", 

			cooldown = 3,
			cancel_cooldown = 1,
			duration = 4,

			activation_cost = {
				{"troy_stones", 300},
				{"troy_wood", 600},
				{"troy_rem_rhesos_devotion", 5}
			},

			tiers = {
				[1] = {
					required_buildings = {},
					bundle_key = "effect_bundle_rem_thracian_rituals_sacrifice_kotys_bathing_ritual",
					post_battle_loot_resources = nil,
					special_unit_reward = nil
				}
			},
		},

		sacrifice_to_pleistoros = {
			group_name = "armies",

			ui_title = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_holy_sacrifices_pleistoros_title", 
			ui_description = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_holy_sacrifices_description_pleistoros", 

			cooldown = 3,
			cancel_cooldown = 1,
			duration = 4,

			activation_cost = {
				{"troy_food", 700},
				{"troy_bronze", 150},
				{"troy_rem_rhesos_devotion", 7}
			},

			tiers = {
				[1] = {
					required_buildings = {
						{
							chain_key = "troy_rem_special_rhesus_ritual_ground",
							min_level = 2,
							culture_variant = "troy_rem_special_rhesus_ritual_ground_4"
						},
						-- {
						--	 key = "troy_rem_special_rhesus_ritual_ground_4", 
						--	 culture_variant = "troy_rem_special_rhesus_ritual_ground_4"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_sacrifice_pleistoros",
					post_battle_loot_resources = nil,
					special_unit_reward = nil
				}
			},
		},

		sacrifice_to_derzelas = {
			group_name = "armies",

			ui_title = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_holy_sacrifices_derzelas_title",
			ui_description = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_holy_sacrifices_description_derzelas",

			cooldown = 3,
			cancel_cooldown = 1,
			duration = 4,

			activation_cost = {
				{"troy_food", 800},
				{"troy_wood", 800},
				{"troy_rem_rhesos_devotion", 6}
			},

			tiers = {
				[1] = {
					required_buildings = {
						{
							chain_key = "troy_rem_special_rhesus_ritual_ground",
							min_level = 2,
							culture_variant = "troy_rem_special_rhesus_ritual_ground_4"
						},
						-- {
						--	 key = "troy_rem_special_rhesus_ritual_ground_4", 
						--	 culture_variant = "troy_rem_special_rhesus_ritual_ground_4"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_sacrifice_derzelas",
					post_battle_loot_resources = nil,
					special_unit_reward = nil
				}
			},
		},

		sacrifice_to_gebeleizis = {
			group_name = "armies",

			ui_title = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_holy_sacrifices_gebeleizis_title", 
			ui_description = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_holy_sacrifices_description_gebeleizis",
			countless_host_effect_bundle_key = "effect_bundle_rem_thracian_rituals_sacrifice_gebeleizis_army",

			cooldown = 3,
			cancel_cooldown = 1,
			duration = 4,

			activation_cost = {
				{"troy_food", 900},
				{"troy_bronze", 400},
				{"troy_rem_rhesos_devotion", 5}
			},

			tiers = {
				[1] = {
					required_buildings = {},
					bundle_key = "effect_bundle_rem_thracian_rituals_sacrifice_gebeleizis",
					post_battle_loot_resources = nil,
					special_unit_reward = nil
				}
			},

			on_post_activate = function()
				local bundle_key = thracian_rituals.rituals.sacrifice_to_gebeleizis.countless_host_effect_bundle_key
				local bundle_duration = thracian_rituals.rituals.sacrifice_to_gebeleizis.duration
				countless_host.apply_effect_bundle(bundle_key, bundle_duration)
			end,

			on_post_deactivate = function()
				local bundle_key = thracian_rituals.rituals.sacrifice_to_gebeleizis.countless_host_effect_bundle_key
				countless_host.remove_effect_bundle(bundle_key)
			end,
		},

		-- Sacred Initiations (ELITE_UNITS rituals)
		zibelthiurdos_oath = {
			group_name = "elite_units",

			ui_title = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_sacred_initiations_zibelthiurdos_title", 
			ui_description = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_sacred_initiations_description_zibelthiurdos", 

			cooldown = 3,
			cancel_cooldown = 3,
			duration = -1,

			activation_cost = {
				{"troy_bronze", 880},
				{"troy_rem_rhesos_devotion", 10}
			},

			tiers = {
				[1] = {
					required_buildings = {
						{
							chain_key = "troy_main_military",
							min_level = 2,
							culture_variant = "troy_main_military_5"
						},
						{
							chain_key = "troy_rem_special_rhesus_great_temple_zibelthiurdos",
							min_level = 0,
							culture_variant = "troy_rem_special_rhesus_great_temple_zibelthiurdos_5",
							unlock_info_loc_key = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_info_major_settlement",
						},
						-- {
						--	 key = "troy_main_military_5", 
						--	 culture_variant = "troy_main_military_5"
						-- },
						-- {
						--	 key = "troy_rem_special_rhesus_great_temple_zibelthiurdos_5", 
						--	 culture_variant = "troy_rem_special_rhesus_great_temple_zibelthiurdos_5"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_initiation_zibelthiurdos", 
					post_battle_loot_resources = nil,
					special_unit_reward = {
						unit_key = "troy_rem_thr_rhes_warriors_of_pangaion",
						num_units = 1,
						cap = 6
					}
				}
			},
		},

		sabazios_oath = {
			group_name = "elite_units",

			ui_title = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_sacred_initiations_sabazios_title", 
			ui_description = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_sacred_initiations_description_sabazios", 

			cooldown = 4,
			cancel_cooldown = 4,
			duration = -1,

			activation_cost = {
				{"troy_bronze", 400},
				{"troy_rem_rhesos_devotion", 10}
			},

			tiers = {
				[1] = {
					required_buildings = {
						{
							chain_key = "troy_rem_rhesus_military_chariot",
							min_level = 2,
							culture_variant = "troy_rem_rhesus_military_chariot_4"
						},
						{
							chain_key = "troy_rem_special_rhesus_great_temple_sabazios",
							min_level = 0,
							culture_variant = "troy_rem_special_rhesus_great_temple_sabazios_3",
							unlock_info_loc_key = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_info_farm_settlement"
						},
						-- {
						--	 key = "troy_rem_rhesus_military_chariot_3", 
						--	 culture_variant = "troy_rem_rhesus_military_chariot_3"
						-- },
						-- {
						--	 key = "troy_rem_special_rhesus_great_temple_sabazios_3", 
						--	 culture_variant = "troy_rem_special_rhesus_great_temple_sabazios_3"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_initiation_sabazios", 
					post_battle_loot_resources = nil,
					special_unit_reward = {
						unit_key = "troy_rem_thr_rhes_mares_of_diomedes",
						num_units = 1,
						cap = 4
					}
				}
			},
		},

		zalmoxis_oath = {
			group_name = "elite_units",

			ui_title = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_sacred_initiations_zalmoxis_title", 
			ui_description = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_sacred_initiations_description_zalmoxis", 

			cooldown = 3,
			cancel_cooldown = 3,
			duration = -1,

			activation_cost = {
				{"troy_bronze", 880},
				{"troy_rem_rhesos_devotion", 10}
			},

			tiers = {
				[1] = {
					required_buildings = {
						{
							chain_key = "troy_main_military_elite",
							min_level = 1,
							culture_variant = "troy_main_military_elite_5"
						},
						{
							chain_key = "troy_rem_special_rhesus_great_temple_zalmoxis",
							min_level = 0,
							culture_variant = "troy_rem_special_rhesus_great_temple_zalmoxis_3",
							unlock_info_loc_key = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_info_forest_settlement"
						},
						-- {
						--	 key = "troy_main_military_elite_5", 
						--	 culture_variant = "troy_main_military_elite_5"
						-- },
						-- {
						--	 key = "troy_rem_special_rhesus_great_temple_zalmoxis_3", 
						--	 culture_variant = "troy_rem_special_rhesus_great_temple_zalmoxis_3"
						-- }
					},
					bundle_key = "effect_bundle_rem_thracian_rituals_initiation_zalmoxis", 
					post_battle_loot_resources = nil,
					special_unit_reward = {
						unit_key = "troy_rem_thr_rhes_devoted_to_zalmoxis",
						num_units = 1,
						cap = 6
					}
				}
			},
		}
	},

	message_events = {
		ritual_activated = {
			event_pic = 2105,
			title = "event_feed_strings_text_troy_rem_thracian_rituals_activated_title",
			primary_detail = "event_feed_strings_text_troy_rem_thracian_rituals_activated_primary_details",
			not_on_screen = false
		},
		ritual_canceled = {
			event_pic = 2106,
			title = "event_feed_strings_text_troy_rem_thracian_rituals_canceled_title",
			primary_detail = "event_feed_strings_text_troy_rem_thracian_rituals_canceled_primary_details",
			not_on_screen = false
		},
		ritual_expired_or_deactivated = {
			event_pic = 2107,
			title = "event_feed_strings_text_troy_rem_thracian_rituals_expired_title",
			primary_detail = "event_feed_strings_text_troy_rem_thracian_rituals_expired_primary_details",
			not_on_screen = false
		},
	},

	skills = {
		{
			id = "troy_rem_rhesus_new_gods_zealot", -- todo
			post_battle_loot_mod = {
				troy_rem_rhesos_devotion = 0.5 -- stands for percentage
			},
			resource_bonus_on_new_ritual = nil
		},
		{
			id = "troy_rem_rhesus_old_gods_zealot", 
			post_battle_loot_mod = nil,
			resource_bonus_on_new_ritual = {
				{
					key = "troy_rem_rhesos_devotion",
					value = 1,
					ritual_groups = {"provinces"} -- if set to nil, it will be applied for every ritual group
				}
			}
		}
	},
}

thracian_rituals.ui = {
	text_source = "troy_rem_rhesus_thracian_rituals",
	panel = "fm_rhesus_2",

	button_activate = {
		id = "btn_view_legacy",
		tooltips = { 
			default = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_button_default",
			available = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_button_ritual_available",
			active_ritual = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_button_ritual_active",
			cooldown = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_button_ritual_cooldown",
			-- cant_afford = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_button_ritual_cant_afford" -- this state is removed
		},
		states = {
			active = "active",
			inactive = "inactive"
		}
	},
	unit_details_holder = "unit_holder",
	unit_details = "unit_information",
	unit_capacity = "unit_capacity",

	cooldown_panel = {
		id = "cooldown_container",
		value = "cooldown_icon"
	},

	group_list = "clusters_list",
	group_template = {
		id = "cluster_template",

		icon = "icon_of_cluster",
		name = "dy_cluster_name",
		status = {
			id = "tx_ritual_status",
			states = {
				inactive = "Inactive",
				active = "Active",
				cooldown = "Inactive_cooldown"
			}
		},
		cooldown = "cooldown_counter",

		ritual = {
			id = "dy_active_ritual_durationn",

			name = "dy_active_ritual_name",
			duration = "active_ritual_duration"
		},

		states = {
			active = "active",
			selected = "selected"
		},

		description_id = "tx_cluster_description"
	},
	group_tooltip = {
		path = "UI/Campaign UI/thracian_rituals_cluster_tooltip",

		title = "dy_title",
		description = "dy_flavour_text",
		ritual_holder = {
			id = "content",
			effect_bundle = "bundle_details"
		}
	},

	ritual_list = "rituals_list",
	row_template = {
		id = "rituals_row_template",
		list = "row_list",

		max_cards_per_row = 2,
	},
	ritual_template = {
		id = "ritual_card_template",
		inactive_id = "ritual_card_template_inactive",

		states = {
			active = "active",
			inactive = "inactive",
			selected = "selected"
		},

		title = "ritual_card_header",
		unit = "recruitment_item",

		duration_holder = {
			id = "duration_holder",
			cooldown = "cd",
			duration = "duration"
		},

		cost_list = "resource_cost_holder",
		cost_template = {
			id = "template_resource",
			value = "dy_amount",
			state_negative = "red"
		},

		remaining_turns = {
			id = "turns_holder",
			value = "duration",
			text = {
				id = "remaining_turs",
				state_infinite = "infinite",
			}
		},

		tier_traker = {
			list = "tier_list",
			bullet_prefix = "bullet",
			state_available = "available"
		},

		button_cancel = "button_close_blood",
		icon_locked = "icon_locked"
	},
	ritual_tooltip = {
		path = "UI/Campaign UI/thracian_rituals_ritual_tooltip",
		holder = "tooltip_holder",

		status = {
			id = "status",
			states = {
				active = "active",
				available = "available",
				not_available = "not_available",
				no_resources = "insufficient_resources",
			},
		},
		feedback = {
			id = "txt_ritual_status",
			states = {
				active = "active",
				active_infinite = "active_offering",
				available = "available",
				not_available = "unavailable",
				no_resources = "insufficient_resources",
				cooldown = "cooldown",
				other_active_ritual = "unavailable_other_active_rtl",
			},
		},

		title = "dy_title",
		description = "dy_flavour_text",
		explanation = {
			id = "dy_explanatory_text",
			armies = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_holy_sacrifices_description",
			provinces = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_religious_mysteries_description",
			elite_units = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_sacred_initiations_description",
			passive = "ui_text_replacements_localised_text_troy_rem_thracian_rituals_offerings_description"
		},

		required_buildings = {
			id = "required_buildings",
			list = "buildings_list",
			template = 
			{
				id = "building_template",
				states = {
					available = "active",
					unavailable = "inactive",
				}
			},
		},

		multiple_tiers = {
			id = "multiple_tiers",
			list = "multiple_tiers_list",
			template = {
				id = "tier_effect_bundle_template",
				txt_not_available = "tx_tier_effect"
			},
			tier_index = "tx_roman_number"
		},
		one_tier = "one_tier",

		unit_cap = "dy_unit_cap_info"
	},

	confirmation_ui = {
		start_ritual_prompt = "ui_text_replacements_localised_text_troy_rem_fm_rhesus2_start_ritual_prompt",
		start_ritual_no_cooldown = "ui_text_replacements_localised_text_troy_rem_fm_rhesus2_start_ritual_no_cooldown_info",
		start_ritual_no_duration = "ui_text_replacements_localised_text_troy_rem_fm_rhesus2_start_ritual_no_duration_info",
		start_ritual_with_cooldown = "ui_text_replacements_localised_text_troy_rem_fm_rhesus2_start_ritual_with_cooldown_info",
		start_ritual_cost = "ui_text_replacements_localised_text_troy_rem_fm_rhesus2_start_ritual_cost",
		cancel_ritual_no_cooldown = "ui_text_replacements_localised_text_troy_rem_fm_rhesus2_cancel_ritual_no_cooldown",
		cancel_ritual_with_cooldown = "ui_text_replacements_localised_text_troy_rem_fm_rhesus2_cancel_ritual_with_cooldown"
	},

	info_overlays = {
		passive = "divine_offerings_overlay",
		armies = "holy_sacrifices_overlay",
		provinces = "religious_mysteries_overlay",
		elite_units = "sacred_initiations_overlay",
	},

	-- variables that are reinitialized on panel open
	v = {
		panel = nil,
		group_list = nil,
		group_template = nil,
		ritual_list = nil,
		ritual_row_template = nil,
		ritual_template = nil,
		ritual_template_inactive = nil,
		btn_activate_ritual = nil,

		selected_ritual_key = nil,
		selected_group = nil,
		template_components = {},

		info_overlays = {
			-- passive = nil,
			-- armies = nil,
			-- provinces = nil,
			-- elite_units = nil,
		}
	}
}

local ui = thracian_rituals.ui
local uiv = thracian_rituals.ui.v

thracian_rituals.ui.listeners = {
	{
		name = "thracian_rituals_panel_lclick",
		event = "ComponentLClickUp",
		condition = function(context)
			return uicomponent_descended_from(UIComponent(context.component), ui.panel)
		end,
		callback = function(context)
			local uic = UIComponent(context.component)
			local faction = cm:get_faction(thracian_rituals.faction_key)
			local faction_cqi = faction:command_queue_index()

			local group_name = uic:GetProperty("group_name")
			if group_name then
				ui.on_group_selected(group_name)
				return
			end

			local ritual_key = uic:GetProperty("ritual_key")
			if ritual_key then
				ui.try_select_ritual(ritual_key)
				return
			end

			if context.string == ui.ritual_template.button_cancel and uic:GetProperty("cancel_ritual_key") then
				local ritual_key = uic:GetProperty("cancel_ritual_key")

				local selected_ritual = uiv.selected_ritual_key
				local ritual = thracian_rituals.get_ritual(ritual_key)

				local text
				local cooldown = ritual.cancel_cooldown or ritual.cooldown
				if cooldown > 0 then
					text = string.format(common.get_localised_string(ui.confirmation_ui.cancel_ritual_with_cooldown), cooldown)
				else
					text = common.get_localised_string(ui.confirmation_ui.cancel_ritual_no_cooldown)
				end

				create_confirmation_box_with_text_from_script(
					"thracian_rituals_cancel_ritual_confirmation_box", 
					text,
					ui.text_source,
					function()
						CampaignUI.TriggerCampaignScriptEvent(faction_cqi, "thracian_rituals_ui_cancel_ritual:" .. ritual_key)
					end, 
					nil,
					uiv.panel
				)
				return
			end

			if context.string == ui.button_activate.id then
				local ritual = thracian_rituals.get_ritual(uiv.selected_ritual_key)

				local text = common.get_localised_string(ui.confirmation_ui.start_ritual_prompt)
				if ritual.duration < 0 then
					text = text ..
						string.format(common.get_localised_string(ui.confirmation_ui.start_ritual_no_duration), ritual.cooldown)
				elseif ritual.cooldown > 0 then
					text = text .. 
						string.format(common.get_localised_string(ui.confirmation_ui.start_ritual_with_cooldown), ritual.cooldown, ritual.cancel_cooldown or 0)
				else
					text = text .. common.get_localised_string(ui.confirmation_ui.start_ritual_no_cooldown)
				end

				text = text .. "\n\n" .. common.get_localised_string(ui.confirmation_ui.start_ritual_cost)
				local cost = cm:create_new_custom_resource_cost()
				for _, res in ipairs(ritual.activation_cost) do
					cost:add_resource_cost(res[1], thracian_rituals.resource.factors.faction, res[2])
				end
				text = text .. cost:to_string()

				create_confirmation_box_with_text_from_script(
					"thracian_rituals_activate_ritual_confirmation_box", 
					text,
					ui.text_source,
					function()
						CampaignUI.TriggerCampaignScriptEvent(faction_cqi, "thracian_rituals_ui_activate_ritual:" .. uiv.selected_ritual_key)
						CampaignUI.TriggerCampaignVO(thracian_rituals.vo_event, thracian_rituals.faction_key)
					end, 
					nil,
					uiv.panel
				)
				return
			end
		end,
		is_persistent = true
	},
	{
		name = "thracian_rituals_panel_ritual_mouseon",
		event = "ComponentMouseOn",
		condition = function(context)
			local uic = UIComponent(context.component)
			return uicomponent_descended_from(uic, ui.panel) and 
				uic:GetProperty("ritual_key") and
				uic:GetProperty("ritual_scripted_tooltip")
		end,
		callback = function(context)
			local card = UIComponent(context.component)
			local ritual_key = card:GetProperty("ritual_key")

			local c_tooltip = uiv.panel:SequentialFind(ritual_key, card:Id() .. "_tooltip")

			if c_tooltip then
				return -- already initialized
			end

			local tier_index = card:GetProperty("tier_index")
			ui.ritual_card_initialize_ritual_tooltip(card, ritual_key, tier_index and tonumber(tier_index))
		end,
		is_persistent = true
	}
}

thracian_rituals.ai = {
	ignore_required_buildings = true,

	passive_rituals_frequency = 12,
	passive_rituals_chance = 50, -- stands for percentage

	other_rituals_frequency = {lower_bound = 5, upper_bound = 8},

	-- Rituals are randomly triggered, prioritizing the groups by their order in the following table
	rituals_group_priority = {
		{key = "elite_units", min_turn = 61},--[[Sacred Initiations--]]
		{key = "armies", min_turn = 0},--[[Holy Sacrifices--]]
		{key = "provinces", min_turn = 0},--[[Religious Mysteries--]]
		{key = "passive", min_turn = 0}--[[Divine Offerings--]]
	},

	predicates = {
		is_ritual_passive = function(ritual) 
			return ritual.group_name == "passive"
		end,
		is_ritual_not_passive = function(ritual) 
			return ritual.group_name ~= "passive"
		end,
	},
}

---------------------------------------------------------------
------------------------ VARIABLES ----------------------------
---------------------------------------------------------------

-- Active cooldowns of the ritual groups
thracian_rituals.active_cooldowns = {
	passive = 0,
	armies = 0,
	provinces = 0,
	elite_units = 0,
}

-- Active rituals at the moment
thracian_rituals.active_rituals = {
	passive = nil,
	armies = nil,
	provinces = nil,
	elite_units = nil,

	-- EXAMPLE ENTRY
	-- passive = {
	--	 key = "offering_to_hera",
	--	 turn_activated = 10,
	--	 active_tier_index = -1
	-- }
}

thracian_rituals.ai.trigger_non_passive_ritual_cooldown = 0
thracian_rituals.ai.trigger_passive_ritual_cooldown = thracian_rituals.ai.passive_rituals_frequency

---------------------------------------------------------------
---------------------- IMPLEMENTATION -------------------------
---------------------------------------------------------------

function thracian_rituals.get_ritual(ritual_key)
	return thracian_rituals.rituals[ritual_key]
end

-- Update the current cooldown of a ritual's group
-- It will clamp the cooldown to >= 0
function thracian_rituals.update_group_cooldown(group_name, cooldown)
	thracian_rituals.active_cooldowns[group_name] = math.max(0, cooldown)
end

-- Return the current cooldown for this ritual group
function thracian_rituals.get_group_cooldown(group_name)
	return thracian_rituals.active_cooldowns[group_name]
end

-- Decrease all cooldowns by one, ensuring that new cooldowns will be >= 0
function thracian_rituals.advance_cooldowns()
	for _, group in ipairs(thracian_rituals.ritual_groups) do
		thracian_rituals.active_cooldowns[group] = math.max(0, thracian_rituals.active_cooldowns[group] - 1)
	end
end

-- Check if the specified ritual is currently active
function thracian_rituals.is_ritual_active(ritual_key)
	local ritual = thracian_rituals.get_ritual(ritual_key)

	return ritual and 
		   thracian_rituals.active_rituals[ritual.group_name] and
		   thracian_rituals.active_rituals[ritual.group_name].key == ritual_key
end

-- Return the key of the active ritual from the specified group or false if there is no active ritual from this group at the moment
function thracian_rituals.try_get_active_ritual_key_from_group(group_name)
	return thracian_rituals.active_rituals[group_name] and thracian_rituals.active_rituals[group_name].key
end

-- Return the highest tier of this ritual for which all required buildings are constructed
function thracian_rituals.get_highest_possible_tier(ritual_key)
	local ritual = thracian_rituals.get_ritual(ritual_key)

	if not ritual then return nil end

	local highest_tier = nil
	local index = -1

	local faction = cm:model():world():faction_by_key(thracian_rituals.faction_key)

	if faction:is_human() or not thracian_rituals.ai.ignore_required_buildings then
		for i, tier in ipairs(ritual.tiers) do
			local is_tier_available = true

			for _, building in ipairs(tier.required_buildings) do
				local required_building_exists = cm:max_chain_level_in_faction(building.chain_key, faction) >= building.min_level
				is_tier_available = is_tier_available and required_building_exists
			end

			if is_tier_available then
				highest_tier = tier
				index = i
			end
		end
	else -- the AI will not check the Required Buildings if thracian_rituals.ai.ignore_required_buildings set to true
		index = #ritual.tiers
		highest_tier = ritual.tiers[index]
	end

	return highest_tier, index
end

function thracian_rituals.get_tier_by_index(ritual_key, tier_index)
	local ritual = thracian_rituals.get_ritual(ritual_key)

	if not ritual then return nil end

	return ritual.tiers[tier_index]
end

function thracian_rituals.activate_ritual(ritual_key)
	local ritual = thracian_rituals.get_ritual(ritual_key)
	local highest_tier, highest_tier_index = thracian_rituals.get_highest_possible_tier(ritual_key)
	local faction = cm:get_faction(thracian_rituals.faction_key)

	-- check if there is such ritual and if it is available
	if not ritual or not highest_tier then return end
	
	-- UPDATE: Now new ritual can be activated only if there is no active ritual from this group. But I'll leave the following code as a safeguard
	if thracian_rituals.active_rituals[ritual.group_name] then
		thracian_rituals.deactivate_ritual(thracian_rituals.active_rituals[ritual.group_name].key, true)
	end

	if ritual.on_pre_activate then
		ritual.on_pre_activate()
	end

	-- Trigger an incident for the activation of the ritual
	thracian_rituals.trigger_message_event(thracian_rituals.message_events.ritual_activated, ritual)
	core:trigger_event("ScriptEventRhesusThracianRitualActivated", ritual_key)

	-- Update the active ritual from this group
	thracian_rituals.active_rituals[ritual.group_name] = {
		key = ritual_key,
		turn_activated = cm:turn_number(),
		active_tier_index = highest_tier_index
	}

	-- Apply cost transactions
	for _, resource in ipairs(ritual.activation_cost) do
		cm:faction_add_pooled_resource(thracian_rituals.faction_key, resource[1], thracian_rituals.resource.factors.faction, -resource[2])
	end

	-- Apply effects
	cm:apply_effect_bundle(highest_tier.bundle_key, thracian_rituals.faction_key, ritual.duration)

	-- Add special units to mercenary pool
	local unit_reward = highest_tier.special_unit_reward
	if unit_reward then
		local num_units = cm:num_units_in_faction_mercenary_pool(faction:command_queue_index(), unit_reward.unit_key)
		local updated_num_units = num_units + unit_reward.num_units
		cm:add_unit_to_faction_mercenary_pool(faction, unit_reward.unit_key, updated_num_units, 0, unit_reward.cap, 0, 0, "", "", "")
	end

	-- Post-battle loot resources bonus is applied in CharacterCompletedBattle listener

	if ritual.on_post_activate then
		ritual.on_post_activate()
	end

	-- Deactivate the ritual if it was an instant effect ritual
	if ritual.duration < 0 then
		thracian_rituals.deactivate_ritual(ritual_key, false)
	end

	-- Grant pooled resources if there is such skill
	local resource_cost_bonus = thracian_rituals.get_resource_bonus_for_ritual_activation_due_to_skills(ritual.group_name)
	cm:faction_apply_resource_transaction(faction, resource_cost_bonus)
end

function thracian_rituals.deactivate_ritual(ritual_key, was_canceled_by_player)
	local ritual = thracian_rituals.get_ritual(ritual_key)

	-- if there is no such ritual or it is not currently active, exit the function
	if not thracian_rituals.is_ritual_active(ritual_key) then 
		return
	end

	if ritual.on_pre_deactivate then
		ritual.on_pre_deactivate()
	end

	local active_tier = thracian_rituals.get_tier_by_index(ritual_key, thracian_rituals.active_rituals[ritual.group_name].active_tier_index)
	-- Remove effects
	cm:remove_effect_bundle(active_tier.bundle_key, thracian_rituals.faction_key, 0)

	-- Apply cooldown
	local cooldown = was_canceled_by_player and ritual.cancel_cooldown or ritual.cooldown
	thracian_rituals.update_group_cooldown(ritual.group_name, cooldown)

	-- Update the active ritual from this group
	thracian_rituals.active_rituals[ritual.group_name] = nil

	-- Trigger an incident for the deactivation of the ritual, except if the ritual is with instant effect (activated and than deactivated immediately)
	if was_canceled_by_player then
		thracian_rituals.trigger_message_event(thracian_rituals.message_events.ritual_canceled, ritual)
	elseif ritual.duration >= 0 then
		thracian_rituals.trigger_message_event(thracian_rituals.message_events.ritual_expired_or_deactivated, ritual)
	end

	if ritual.on_post_deactivate then
		ritual.on_post_deactivate()
	end
end

-- Check if the tier of an active ritual should be upgraded/downgraded or the ritual should be deactivated if there is no available tier anymore
function thracian_rituals.reevaluate_active_ritual_tier(ritual_key)
	local ritual = thracian_rituals.get_ritual(ritual_key)

	-- if there is no such ritual or it is not currently active, exit the function
	if not thracian_rituals.is_ritual_active(ritual_key) then 
		return
	end

	local active_tier_index = thracian_rituals.active_rituals[ritual.group_name].active_tier_index
	local active_tier = thracian_rituals.get_tier_by_index(ritual_key, active_tier_index)
	local highest_tier, highest_tier_index = thracian_rituals.get_highest_possible_tier(ritual_key)

	-- Deactivate the ritual if for some reason there is no available tier anymore, for example the required buildings have been destroyed
	if not highest_tier then
		thracian_rituals.deactivate_ritual(ritual_key, false)
		return
	end

	if active_tier_index ~= highest_tier_index then
		-- update effect bundles
		cm:remove_effect_bundle(active_tier.bundle_key, thracian_rituals.faction_key, 0)
		cm:apply_effect_bundle(highest_tier.bundle_key, thracian_rituals.faction_key, 0)
		
		-- update the active tier for this ritual
		thracian_rituals.active_rituals[ritual.group_name].active_tier_index = highest_tier_index
	end
end


-- Check if this ritual can be activated:
--  check if there is another active ritual from this group, unless should_ignore_other_active_rituals == true
--  check cost
--  check cooldown
--  check if there is available tier (buildings)
function thracian_rituals.can_activate_ritual(ritual_key, should_ignore_other_active_rituals --[[optional--]], should_ignore_resource_cost --[[ optional-- ]])
	local ritual = thracian_rituals.get_ritual(ritual_key)

	if not ritual then return false end

	-- Check if there is another active ritual from this group
	if not should_ignore_other_active_rituals and thracian_rituals.active_rituals[ritual.group_name] then
		return false
	end

	local faction = cm:model():world():faction_by_key(thracian_rituals.faction_key)

	-- Check cost
	if not should_ignore_resource_cost and not cm:faction_can_afford_resource_cost(faction, ritual.activation_cost) then
		return false
	end

	-- Check if the ritual is in cooldown
	if thracian_rituals.get_group_cooldown(ritual.group_name) > 0 then
		return false
	end

	-- Check required buildings to see if there is some available tier
	local available_tier = thracian_rituals.get_highest_possible_tier(ritual_key)

	return not not available_tier
end

-- Calculate the remaining duration of the active ritual from this group_name
-- Return nil if there is no active ritual from this group right now
function thracian_rituals.remaining_turns(group_name)
	local active_rituals_entry = thracian_rituals.active_rituals[group_name]

	-- check if there is an active ritual of this group
	if not active_rituals_entry then return nil end

	local ritual = thracian_rituals.get_ritual(active_rituals_entry.key)

	local elapsed_turns = cm:turn_number() - active_rituals_entry.turn_activated
	local remaining_turns = ritual.duration - elapsed_turns
	local is_duration_infinite = ritual.duration == 0

	return remaining_turns, is_duration_infinite
end

-- Find expired rituals and deactivate them
function thracian_rituals.check_for_expiring_rituals()
	for _, group in ipairs(thracian_rituals.ritual_groups) do
		local active_rituals_entry = thracian_rituals.active_rituals[group]

		if active_rituals_entry then  -- check if there is an active ritual of this group
			local remaining_turns, is_infinite = thracian_rituals.remaining_turns(group)

			if remaining_turns <= 0 and not is_infinite then
				thracian_rituals.deactivate_ritual(active_rituals_entry.key, false)
			end
		end
	end
end

-- Apply the loot bonuses of all active rituals
function thracian_rituals.post_battle_apply_loot_bonuses()
	for _, group in ipairs(thracian_rituals.ritual_groups) do
		local active_rituals_entry = thracian_rituals.active_rituals[group]

		if active_rituals_entry then -- check if there is an active ritual of this group
			local active_tier = thracian_rituals.get_tier_by_index(active_rituals_entry.key, active_rituals_entry.active_tier_index)

			if is_table(active_tier.post_battle_loot_resources) then
				for _, resource in ipairs(active_tier.post_battle_loot_resources) do
					local resource_key = resource[1]
					local resource_value = thracian_rituals.get_post_battle_loot_skill_modified_value(resource_key, resource[2])
					cm:faction_add_post_battle_looted_resource(thracian_rituals.faction_key, resource_key, thracian_rituals.resource.factors.god_attitude, resource_value)
				end
			end
		end
	end
end

-- Check all active rituals if their tier should be upgraded/downgraded or the ritual should be deactivated if there is no available tier anymore
function thracian_rituals.reevaluate_tier_of_all_active_rituals()
	for _, group in ipairs(thracian_rituals.ritual_groups) do
		local active_rituals_entry = thracian_rituals.active_rituals[group]

		if active_rituals_entry then
			thracian_rituals.reevaluate_active_ritual_tier(active_rituals_entry.key)
		end
	end
end

function thracian_rituals.trigger_message_event(event, ritual)
	if event.not_on_screen then
		cm:show_configurable_message_event(
			thracian_rituals.faction_key, 
			event.title, 
			event.primary_detail, 
			ritual.ui_title, 
			event.event_pic
		)
	else
		cm:show_message_event(
			thracian_rituals.faction_key, 
			event.title, 
			event.primary_detail, 
			ritual.ui_title, 
			true, 
			event.event_pic
		)
	end
end

-- Check the skills of the character in the pending battle and get post battle loot bonus if there is such skill
-- Returns the modified value of the loot bonuses
function thracian_rituals.get_post_battle_loot_skill_modified_value(resource_key, base_value)
	local faction = cm:get_faction(thracian_rituals.faction_key)
	local character = thracian_rituals.get_pending_battle_general_for_our_faction()
	local modifier = 1

	for _, skill_info in ipairs(thracian_rituals.skills) do
		if character:has_skill(skill_info.id) and skill_info.post_battle_loot_mod and skill_info.post_battle_loot_mod[resource_key] then
			modifier = modifier + skill_info.post_battle_loot_mod[resource_key]
		end
	end

	return base_value * modifier
end

-- Check the skills of our characters and get bonus resources upon activation of a ritual if there is such skill
-- Returns resource_cost
function thracian_rituals.get_resource_bonus_for_ritual_activation_due_to_skills(activated_ritual_group_name)
	local faction = cm:get_faction(thracian_rituals.faction_key)
	local cost = cm:create_new_custom_resource_cost()

	for _, skill_info in ipairs(thracian_rituals.skills) do
		local num_characters_with_skill = cm:num_characters_with_skill_in_faction(faction, skill_info.id)

		if num_characters_with_skill > 0 and skill_info.resource_bonus_on_new_ritual then
			for _, resource_info in ipairs(skill_info.resource_bonus_on_new_ritual) do
				if not resource_info.ritual_groups or table_contains(resource_info.ritual_groups, activated_ritual_group_name) then
					cost:add_resource_cost(resource_info.key, thracian_rituals.resource.factors.faction, resource_info.value)
				end
			end
		end
	end

	return cost
end

function thracian_rituals.get_pending_battle_general_for_our_faction()
	local pending_battle = cm:model():pending_battle()
	local general = nil

	if pending_battle:has_attacker() and pending_battle:attacker():faction():name() == thracian_rituals.faction_key then
		general = pending_battle:attacker()
	elseif pending_battle:has_defender() and pending_battle:defender():faction():name() == thracian_rituals.faction_key then
		general = pending_battle:defender()
	end

	return general
end

function thracian_rituals.get_unit_limit(unit_key)
	for _, ritual in pairs(thracian_rituals.rituals) do
		if ritual.group_name == "elite_units" then
			for _, tier in ipairs(ritual.tiers) do
				if tier.special_unit_reward and tier.special_unit_reward.unit_key == unit_key then
					return tier.special_unit_reward.cap
				end
			end
		end
	end
end

function thracian_rituals.ai.get_possible_rituals_for_ai_shuffled(ritual_filter--[[optional--]], should_ignore_other_active_rituals --[[optional--]])
	local rituals = {}
	local current_turn = cm:turn_number()

	if not ritual_filter or not is_function(ritual_filter) then
		ritual_filter = function(ritual) return true end
	end

	-- Rituals are randomly triggered, prioritizing the groups by their order in thracian_rituals.ai.rituals_group_priority
	for _, group_info in ipairs(thracian_rituals.ai.rituals_group_priority) do
		if current_turn >= group_info.min_turn then -- Oooh continue statement, I miss you when I write Lua
			local new_rituals = {}

			for key, ritual in pairs(thracian_rituals.rituals) do
				if ritual.group_name == group_info.key and 
					thracian_rituals.can_activate_ritual(key, should_ignore_other_active_rituals) and
					ritual_filter(ritual) then

					table.insert(new_rituals, key)
				end
			end

			table.sort(new_rituals) -- sort the rituals table, which contains unique strings, in order to avoid multiplayer issues due to the fact that the table was created with pairs()
			table_append(rituals, cm:random_sort(new_rituals))
		end
	end

	return rituals
end

---------------------------------------------------------------
------------------------ LISTENERS ----------------------------
---------------------------------------------------------------

function thracian_rituals.add_listeners()
	core:add_listener (
		"thracian_rituals_battle_loot_bonuses",
		"CharacterCompletedBattle",
		function(context)
			return context:character():faction():name() == thracian_rituals.faction_key and context:character():won_battle()
		end,
		function(context)
			-- Character can be nil when our army is reinforcing, in which case we don't want to give post battle loot
			local character = thracian_rituals.get_pending_battle_general_for_our_faction()
			if character then
				thracian_rituals.post_battle_apply_loot_bonuses()
			end
		end,
		true
	)

	-- Deactivate expired rituals if any
	core:add_listener (
		"thracian_rituals_turn_start",
		"FactionTurnStart",
		function(context)
			return context:faction():name() == thracian_rituals.faction_key
		end,
		function(context)
			thracian_rituals.advance_cooldowns()
			thracian_rituals.check_for_expiring_rituals()

			-- Handle dismantled buildings on turn start. Otherwise the dismantle is applied on RoundEnd and the cooldown is not correct
			thracian_rituals.reevaluate_tier_of_all_active_rituals()
		end,
		true
	)

	-- Reevaluate active rituals tier on Building Completed/Demolished/Lost
	do
		-- Check if new tier can be activated for some ritual
		core:add_listener (
			"thracian_rituals_building_completed",
			"BuildingCompleted",
			function(context)
				return context:building():faction():name() == thracian_rituals.faction_key
			end,
			function(context)
				thracian_rituals.reevaluate_tier_of_all_active_rituals()
			end,
			true
		)

		-- Reevaluate active rituals when another faction sacks our settlements because the owner doesn't change and this situation is not handled elsewhere
		-- Sacking a settlement downgrades the main building which may result in loosing the required building for some rituals.
		-- Note: CharacterSackedSettlement event can't be used because it is fired before the outcome is applied
		core:add_listener(
			"thracian_rituals_other_faction_sacks_our_settlement",
			"CharacterPerformsSettlementOccupationDecision",
			function(context)
				return context:garrison_residence():faction():name() == thracian_rituals.faction_key
			end,
			function(context)
				thracian_rituals.reevaluate_tier_of_all_active_rituals()
			end,
			true
		)

		core:add_listener(
			"thracian_rituals_region_faction_change",
			"RegionFactionChangeEvent",
			function(context)
				local region = context:region()
				return region:owning_faction():name() == thracian_rituals.faction_key or context:previous_faction():name() == thracian_rituals.faction_key
			end,
			function(context)
				-- Subscribe for the next RegionFactionChangePostBuildingConversionEvent and reevaluate tiers
				core:add_listener(
					"thracian_rituals_region_faction_change_post_building_conversion_event",
					"RegionFactionChangePostBuildingConversionEvent",
					true,
					function(future_context)
						thracian_rituals.reevaluate_tier_of_all_active_rituals()
					end,
					false
				)
			end,
			true
		)
	end

	core:add_listener(
		"thracian_rituals_panel_opened",
		"PanelOpenedCampaign",
		function(context) return context.string == ui.panel end,
		ui.on_panel_opened,
		true
	)

	core:add_listener(
		"thracian_rituals_panel_closed",
		"PanelClosedCampaign",
		function(context) return context.string == ui.panel end,
		ui.on_panel_closed,
		true
	)

	core:add_listener(
		"thracian_rituals_ui_activate_ritual",
		"UITriggerScriptEvent",
		function(context)
			return context:trigger():split(":")[1] == "thracian_rituals_ui_activate_ritual"
		end,
		function(context)
			local ritual_key = context:trigger():split(":")[2]
			thracian_rituals.activate_ritual(ritual_key)

			if uim:is_panel_open(ui.panel) then
				ui.refresh_panel()
			end
		end,
		true
	)

	core:add_listener(
		"thracian_rituals_ui_cancel_ritual",
		"UITriggerScriptEvent",
		function(context)
			return context:trigger():split(":")[1] == "thracian_rituals_ui_cancel_ritual"
		end,
		function(context)
			local ritual_key = context:trigger():split(":")[2]
			thracian_rituals.deactivate_ritual(ritual_key, true)

			if uim:is_panel_open(ui.panel) then
				ui.refresh_panel()
			end
		end,
		true
	)

	core:add_listener (
		"thracian_rituals_activate_rituals_for_ai",
		"FactionTurnStart",
		function(context)
			local faction = context:faction()
			return faction:name() == thracian_rituals.faction_key and not faction:is_human()
		end,
		function(context)
			-- advance cooldowns
			thracian_rituals.ai.trigger_non_passive_ritual_cooldown = thracian_rituals.ai.trigger_non_passive_ritual_cooldown - 1
			thracian_rituals.ai.trigger_passive_ritual_cooldown = thracian_rituals.ai.trigger_passive_ritual_cooldown - 1

			-- trigger non-passive ritual
			if thracian_rituals.ai.trigger_non_passive_ritual_cooldown <= 0 then
				local possible_rituals = thracian_rituals.ai.get_possible_rituals_for_ai_shuffled(thracian_rituals.ai.predicates.is_ritual_not_passive, false--[[should_ignore_other_active_rituals--]])

				if #possible_rituals == 0 then
					thracian_rituals.ai.trigger_non_passive_ritual_cooldown = 0 -- try again next turn if no ritual could be activated
				else
					thracian_rituals.activate_ritual(possible_rituals[1])
					thracian_rituals.ai.trigger_non_passive_ritual_cooldown = cm:model():random_int(
						thracian_rituals.ai.other_rituals_frequency.lower_bound, 
						thracian_rituals.ai.other_rituals_frequency.upper_bound)
				end
			end

			-- check for activating / deactivating passive rituals. They have infinite duration so we handle them differently
			if thracian_rituals.ai.trigger_passive_ritual_cooldown <= 0 then
				local should_trigger_ritual = cm:model():random_int(0, 100) <= thracian_rituals.ai.passive_rituals_chance

				if should_trigger_ritual then
					local possible_rituals = thracian_rituals.ai.get_possible_rituals_for_ai_shuffled(thracian_rituals.ai.predicates.is_ritual_passive, true--[[should_ignore_other_active_rituals--]])
					
					if #possible_rituals == 0 then
						thracian_rituals.ai.trigger_passive_ritual_cooldown = 0 -- try again next turn if no ritual could be activated
					else
						local faction = cm:get_faction(thracian_rituals.faction_key)
						local current_active_passive_ritual = thracian_rituals.active_rituals["passive"] and thracian_rituals.active_rituals["passive"].key or false

						-- Activate ritual for the God with the lowest favour. Pick randomly if more than one. The list is already shuffled so we pick the first one from the lowest
						local _, lowest_attitude_value = get_lowest_god_attitude_for_faction(faction)
						table_erase_if(
							possible_rituals, 
							function(ritual_key)
								local ritual = thracian_rituals.get_ritual(ritual_key)
								local attitude = get_god_attitude_for_faction(faction, ritual.attitude_key)
								return attitude > lowest_attitude_value or ritual_key == current_active_passive_ritual
							end
						)

						thracian_rituals.activate_ritual(possible_rituals[1])
						thracian_rituals.ai.trigger_passive_ritual_cooldown = thracian_rituals.ai.passive_rituals_frequency
					end
				else
					local active_ritual = thracian_rituals.active_rituals["passive"] and thracian_rituals.active_rituals["passive"].key or false
					if active_ritual then
						thracian_rituals.deactivate_ritual(active_ritual)
					end

					thracian_rituals.ai.trigger_passive_ritual_cooldown = thracian_rituals.ai.passive_rituals_frequency
				end
			end
		end,
		true
	)

	core:add_listener (
			"thracian_rituals_display_unit_special_recruitment_pool_limit",
			"PanelOpenedCampaign",
			function(context)
				local units_panel = "mercenary_recruitment"
				return cm:get_local_faction_name(true) == thracian_rituals.faction_key and context.string == units_panel
			end,
			function(context)
				local uic = UIComponent(context.component)

				for _, ritual in pairs(thracian_rituals.rituals) do
					if ritual.group_name == "elite_units" then
						local unit_key = ritual.tiers[1].special_unit_reward.unit_key
						local unit_capacity_uic = uic:SequentialFind(unit_key.."_mercenary", ui.unit_capacity)
						if unit_capacity_uic then
							local unit_cap = ritual.tiers[1].special_unit_reward.cap
							unit_capacity_uic:SetVisible(true)
							unit_capacity_uic:SetStateText(""..unit_cap)
						end
					end
				end
			end,
			true
	)

	core:add_listener (
		"thracian_rituals_spend_devotion",
		"PooledResourceTransactionEvent",
		function(context)
			return context:resource():key() == thracian_rituals.resource.key
		end,
		function(context)
			achievements.rhesus.func_spend_devotion(context:resource())
		end,
		true
	)
end


---------------------------------------------------------------
--------------------------- UI --------------------------------
---------------------------------------------------------------

function ui.on_panel_opened()
	uiv.panel = core:get_ui_root():SequentialFind(ui.panel)
	uiv.btn_activate_ritual = uiv.panel:SequentialFind(ui.button_activate.id)

	uiv.group_template = ui.get_child_template(ui.group_template.id)
	uiv.ritual_template = ui.get_child_template(ui.ritual_template.id)
	uiv.ritual_template_inactive = ui.get_child_template(ui.ritual_template.inactive_id)
	uiv.ritual_row_template = ui.get_child_template(ui.row_template.id)

	uiv.group_list = uiv.panel:SequentialFind(ui.group_list)
	uiv.ritual_list = uiv.panel:SequentialFind(ui.ritual_list)

	uiv.selected_group = thracian_rituals.ritual_groups[1]

	uiv.info_overlays = {}
	uiv.info_overlays.passive = uiv.panel:SequentialFind(ui.info_overlays.passive)
	uiv.info_overlays.armies = uiv.panel:SequentialFind(ui.info_overlays.armies)
	uiv.info_overlays.provinces = uiv.panel:SequentialFind(ui.info_overlays.provinces)
	uiv.info_overlays.elite_units = uiv.panel:SequentialFind(ui.info_overlays.elite_units)

	ui.add_listeners()
	ui.refresh_panel()
end

function ui.on_panel_closed()
	-- Destroy template components
	for _, component in ipairs(uiv.template_components) do
		component:Destroy()
	end

	ui.v = {}
	uiv = ui.v

	for _, listener in ipairs(ui.listeners) do
		core:remove_listener(listener.name)
	end
end

function ui.add_listeners()
	for _, listener in ipairs(ui.listeners) do
		core:add_listener(
			listener.name,
			listener.event,
			listener.condition,
			listener.callback,
			listener.is_persistent
		)
	end
end

function ui.refresh_panel()
	ui.create_groups()
	ui.on_group_selected(uiv.selected_group)
end

function ui.get_child_template(id)
	local component = uiv.panel:SequentialFind(id)
	if not component then return nil end

	UIComponent(component:Parent()):Divorce(component:Address())

	-- Add the template to this list on order to be destroyed on PanelClosedCampaign
	-- Otherwise it will be destroyed only after the UI is destroyed
	uiv.template_components = uiv.template_components or {}
	table.insert(uiv.template_components, component)

	return component
end

-------------------------------- Clusters
function ui.create_groups()
	uiv.group_list:DestroyChildren()

	for _, group_name in ipairs(thracian_rituals.ritual_groups) do
		local c_group = UIComponent(uiv.group_list:CreateFromComponent(uiv.group_template:Address(), group_name))
		c_group:SetProperty("group_name", group_name)

		ui.initialize_group(c_group, group_name)
	end
end

function ui.initialize_group(c_group, group_name)
	ui.set_group_name(c_group, group_name)
	ui.set_group_description(c_group, group_name)
	ui.set_group_icon(c_group, group_name)
	ui.set_group_status(c_group, group_name)
	if thracian_rituals.active_rituals[group_name] then
		ui.set_group_active_ritual(c_group, group_name)
	end
	ui.set_group_tooltip(c_group, group_name)
end

function ui.set_group_name(c_group, group_name)
	local localisation_src = thracian_rituals.groups_ui[group_name].title
	local localised_name = common.get_localised_string(localisation_src)
	c_group:SequentialFind(ui.group_template.name):SetText(localised_name, localisation_src)
end

function ui.set_group_description(c_group, group_name)
	local c_description = c_group:SequentialFind(thracian_rituals.ui.group_template.description_id)
	if c_description then
		c_description:SetState(group_name)
	end
end

function ui.set_group_icon(c_group, group_name)
	c_group:SequentialFind(ui.group_template.icon):SetState(group_name)
end

function ui.set_group_status(c_group, group_name)
	local c_status = c_group:SequentialFind(ui.group_template.status.id)
	local status_state = ui.group_template.status.states.inactive

	if thracian_rituals.active_rituals[group_name] then -- active ritual
		status_state = ui.group_template.status.states.active
	elseif thracian_rituals.get_group_cooldown(group_name) > 0 then -- active cooldown
		status_state = ui.group_template.status.states.cooldown

		local cooldown = thracian_rituals.get_group_cooldown(group_name)
		local c_cooldown = c_group:SequentialFind(ui.group_template.cooldown)
		c_cooldown:SetVisible(true)
		c_cooldown:SetText(tostring(cooldown), ui.text_source)
	end

	c_status:SetState(status_state)
end

function ui.set_group_active_ritual(c_group, group_name)
	local ritual = thracian_rituals.get_ritual(thracian_rituals.active_rituals[group_name].key)

	local c_ritual = c_group:SequentialFind(ui.group_template.ritual.id)
	c_ritual:SetVisible(true)

	local remaining_turns, is_infinite = thracian_rituals.remaining_turns(group_name)
	local c_duration = c_ritual:SequentialFind(ui.group_template.ritual.duration)
	c_duration:SetVisible(not is_infinite)
	c_duration:SetText(tostring(remaining_turns), ui.text_source)

	local ritual_localised_name = common.get_localised_string(ritual.ui_title)
	c_ritual:SequentialFind(ui.group_template.ritual.name):SetText(ritual_localised_name, ritual.ui_title)
end

function ui.set_group_tooltip(c_group, group_name)
	c_group:InterfaceFunction("set_tooltip_path", ui.group_tooltip.path)
	local c_tooltip = c_group:SequentialFind(c_group:Id() .. "_tooltip")

	-- Set group title
	local title = common.get_localised_string(thracian_rituals.groups_ui[group_name].title)
	c_tooltip:SequentialFind(ui.group_tooltip.title):SetText(title, ui.text_source)

	-- Set group description
	local description = common.get_localised_string(thracian_rituals.groups_ui[group_name].description)
	c_tooltip:SequentialFind(ui.group_tooltip.description):SetText(description, ui.text_source)

	-- Show active ritual if any and its effects
	local c_ritual_holder = c_tooltip:SequentialFind(ui.group_tooltip.ritual_holder.id)
	if thracian_rituals.active_rituals[group_name] then
		local active_tier = thracian_rituals.get_tier_by_index(thracian_rituals.active_rituals[group_name].key, 
															   thracian_rituals.active_rituals[group_name].active_tier_index)
		local c_effect = c_ritual_holder:SequentialFind(ui.group_tooltip.ritual_holder.effect_bundle)
		c_effect:InterfaceFunction("set_effect_bundle_record", active_tier.bundle_key)
	else
		c_ritual_holder:SetVisible(false)
	end
end

function ui.update_cooldown_panel(group_name)
	local cooldown = thracian_rituals.get_group_cooldown(group_name)

	local c_cooldown = uiv.panel:SequentialFind(ui.cooldown_panel.id)
	c_cooldown:SetVisible(cooldown > 0)
	local c_value = c_cooldown:SequentialFind(ui.cooldown_panel.value)
	c_value:SetText(tostring(cooldown), ui.text_source)
end

-------------------------------- Rituals

function ui.create_ritual_cards(group_name)
	uiv.ritual_list:DestroyChildren()

	local current_row = nil
	local current_row_cards_count = ui.row_template.max_cards_per_row

	for key, ritual in pairs(thracian_rituals.rituals) do
		if ritual.group_name == group_name then
			if current_row_cards_count >= ui.row_template.max_cards_per_row then
				local id = string.format("row_%d", uiv.ritual_list:ChildCount())
				current_row = UIComponent(uiv.ritual_list:CreateFromComponent(uiv.ritual_row_template:Address(), id))
				current_row_cards_count = 0
			end

			current_row_cards_count = current_row_cards_count + 1

			-- we use the locked template only if the tier conditions are not met or the group is in cooldown
			local highest_possible_tier = thracian_rituals.get_highest_possible_tier(key)
			local is_in_cooldown = thracian_rituals.get_group_cooldown(group_name) > 0
			local is_locked = not highest_possible_tier or is_in_cooldown
			local template_to_use = is_locked and uiv.ritual_template_inactive or uiv.ritual_template
			local card = UIComponent(current_row:SequentialFind(ui.row_template.list):CreateFromComponent(template_to_use:Address(), key))
			card:SetProperty("ritual_key", key)

			ui.initialize_ritual_card(card, key)
			current_row:Resize(current_row:Width(), card:Height())
		end
	end
end

function ui.initialize_ritual_card(card, ritual_key)
	local ritual = thracian_rituals.get_ritual(ritual_key)

	ui.ritual_card_set_unit(card, ritual_key)
	ui.ritual_card_set_title(card, ritual)
	ui.ritual_card_set_activation_cost(card, ritual)
	
	if thracian_rituals.is_ritual_active(ritual_key) then
		ui.ritual_card_show_cancel_button(card, ritual_key)
		ui.ritual_card_set_remaining_turns(card, ritual)
		ui.try_select_ritual(ritual_key)
	else
		ui.ritual_card_set_duration_and_cooldown(card, ritual)
	end

	local has_available_tier = thracian_rituals.get_highest_possible_tier(ritual_key)
	if not has_available_tier then
		ui.ritual_card_show_icon_locked(card)
	end

	ui.ritual_card_set_tiers(card, ritual_key)

	ui.ritual_card_set_ritual_tooltip(card, ritual_key)
end

function ui.ritual_card_set_tiers(card, ritual_key)
	local ritual = thracian_rituals.get_ritual(ritual_key)

	if #ritual.tiers > 1 then
		local tier_list = card:SequentialFind(thracian_rituals.ui.ritual_template.tier_traker.list)
		tier_list:SetVisible(true)
		local _, highest_tier_index = thracian_rituals.get_highest_possible_tier(ritual_key)

		for i = 1, #ritual.tiers do
			local icon = tier_list:SequentialFind(thracian_rituals.ui.ritual_template.tier_traker.bullet_prefix .. tostring(i))
			if highest_tier_index >= i then
				icon:SetState(thracian_rituals.ui.ritual_template.tier_traker.state_available)
			end

			ui.ritual_card_set_ritual_tooltip(icon, ritual_key, i)
		end
	end
end

function ui.ritual_card_set_unit(card, ritual_key)
	local highest_possible_tier = thracian_rituals.get_highest_possible_tier(ritual_key)
	local tier_to_show = highest_possible_tier or thracian_rituals.get_tier_by_index(ritual_key, 1)

	local c_unit = card:SequentialFind(ui.ritual_template.unit)
	local c_unit_holder = UIComponent(c_unit:Parent())
	c_unit_holder:SetVisible(not not tier_to_show.special_unit_reward)

	if tier_to_show.special_unit_reward then
		c_unit:InterfaceFunction("init_card", 
			tier_to_show.special_unit_reward.unit_key,
			thracian_rituals.faction_key,
			tier_to_show.special_unit_reward.num_units
		)

		local c_unit_capacity = c_unit:SequentialFind(ui.unit_capacity)
		if c_unit_capacity then
			local unit_cap = tier_to_show.special_unit_reward.cap
			c_unit_capacity:SetVisible(true)
			c_unit_capacity:SetStateText(""..unit_cap)
		end
	end
end

function ui.ritual_card_set_title(card, ritual)
	local localised_title = common.get_localised_string(ritual.ui_title)
	card:SequentialFind(ui.ritual_template.title):SetText(localised_title, ritual.ui_title)
end

function ui.ritual_card_set_activation_cost(card, ritual)
	local cost_list = card:SequentialFind(ui.ritual_template.cost_list)
	local cost_template = ui.get_child_template(ui.ritual_template.cost_template.id)
	
	cost_list:DestroyChildren()
	
	for _, res in ipairs(ritual.activation_cost) do
		local c_cost = UIComponent(cost_list:CreateFromComponent(cost_template:Address(), res[1]))
		c_cost:SetState(res[1])
		c_cost:SetTooltipText(common.get_localised_string("pooled_resources_display_name_" .. res[1]), "pooled_resource_display_name", true)

		local value = c_cost:SequentialFind(ui.ritual_template.cost_template.value)
		value:SetText(tostring(res[2]), ui.text_source)
		if not cm:faction_can_afford_resource_cost(cm:get_faction(thracian_rituals.faction_key), {res}) then
			value:SetState(ui.ritual_template.cost_template.state_negative)
		end
	end
end

function ui.ritual_card_set_duration_and_cooldown(card, ritual)
	local duration_holder = card:SequentialFind(ui.ritual_template.duration_holder.id)

	if ritual.cooldown <= 0 and ritual.duration <= 0 then
		duration_holder:SetVisible(false)
	else
		local cooldown = duration_holder:SequentialFind(ui.ritual_template.duration_holder.cooldown)
		local duration = duration_holder:SequentialFind(ui.ritual_template.duration_holder.duration)

		cooldown:SetVisible(ritual.cooldown > 0)
		cooldown:SetText(tostring(ritual.cooldown), ui.text_source)
		
		duration:SetVisible(ritual.duration > 0)
		duration:SetText(tostring(ritual.duration), ui.text_source)
	end
end

function ui.ritual_card_show_cancel_button(card, ritual_key)
	local button_cancel = card:SequentialFind(ui.ritual_template.button_cancel)
	if button_cancel then
		button_cancel:SetVisible(true)
		button_cancel:SetProperty("cancel_ritual_key", ritual_key)
	end
end

function ui.ritual_card_set_remaining_turns(card, ritual)
	local duration_holder = card:SequentialFind(ui.ritual_template.duration_holder.id)
	local cost_list = card:SequentialFind(ui.ritual_template.cost_list)
	duration_holder:SetVisible(false)
	UIComponent(cost_list:Parent()):SetVisible(false)

	local remaining_turns, is_infinite = thracian_rituals.remaining_turns(ritual.group_name)
	local c_turns = card:SequentialFind(ui.ritual_template.remaining_turns.id)
	local c_turns_value = c_turns:SequentialFind(ui.ritual_template.remaining_turns.value)
	c_turns:SetVisible(true)
	if is_infinite then
		local text = c_turns:SequentialFind(ui.ritual_template.remaining_turns.text.id)
		text:SetState(ui.ritual_template.remaining_turns.text.state_infinite)
		c_turns_value:SetVisible(false)
	else
		c_turns_value:SetText(tostring(remaining_turns), ui.text_source)
	end
end	

function ui.ritual_card_show_icon_locked(card)
	card:SequentialFind(ui.ritual_template.icon_locked):SetVisible(true)
end

-- setup info for lazy initialization of the tooltip - when the player hovers for the first time on the ritual card
function ui.ritual_card_set_ritual_tooltip(card, ritual_key, tier_index--[[optional--]])
	card:SetProperty("ritual_scripted_tooltip", "ritual_scripted_tooltip")
	card:SetProperty("ritual_key", ritual_key)
	if tier_index and is_number(tier_index) then
		card:SetProperty("tier_index", tostring(tier_index))
	end
end

function ui.ritual_card_initialize_ritual_tooltip(card, ritual_key, tier_index--[[optional--]])
	card:InterfaceFunction("set_tooltip_path", ui.ritual_tooltip.path, ui.ritual_tooltip.holder)
	local c_tooltip = uiv.panel:SequentialFind(ritual_key, card:Id() .. "_tooltip")
	local ritual = thracian_rituals.get_ritual(ritual_key)

	ui.ritual_card_set_ritual_tooltip_status(c_tooltip, ritual_key)
	ui.ritual_card_set_ritual_tooltip_title(c_tooltip, ritual_key)
	ui.ritual_card_set_ritual_tooltip_description(c_tooltip, ritual_key)
	ui.ritual_card_set_ritual_tooltip_explanation(c_tooltip, ritual_key)

	if #ritual.tiers > 1 then
		if tier_index then
			ui.ritual_card_set_ritual_tooltip_multiple_tiers(c_tooltip, ritual_key, tier_index)
		else
			local _, highest_tier_index = thracian_rituals.get_highest_possible_tier(ritual_key)
			ui.ritual_card_set_ritual_tooltip_multiple_tiers(c_tooltip, ritual_key, highest_tier_index ~= -1 and highest_tier_index or 1)
		end
	else
		ui.ritual_card_set_ritual_tooltip_one_tier(c_tooltip, ritual_key)
	end
	ui.ritual_card_set_ritual_tooltip_feedback(c_tooltip, ritual_key)
	ui.ritual_card_set_ritual_tooltip_unit_cap(c_tooltip, ritual_key)
end

function ui.ritual_card_set_ritual_tooltip_status(c_tooltip, ritual_key)
	local c_status = c_tooltip:SequentialFind(ui.ritual_tooltip.status.id)
	local available_tier = thracian_rituals.get_highest_possible_tier(ritual_key)
	local ritual = thracian_rituals.get_ritual(ritual_key)

	if thracian_rituals.is_ritual_active(ritual_key) then
		c_status:SetState(ui.ritual_tooltip.status.states.active)
	elseif thracian_rituals.can_activate_ritual(ritual_key, true) then
		c_status:SetState(ui.ritual_tooltip.status.states.available)
	elseif not available_tier or thracian_rituals.get_group_cooldown(ritual.group_name) > 0 then
		c_status:SetState(ui.ritual_tooltip.status.states.not_available)
	else
		c_status:SetState(ui.ritual_tooltip.status.states.no_resources)
	end
end

function ui.ritual_card_set_ritual_tooltip_title(c_tooltip, ritual_key)
	local c_title = c_tooltip:SequentialFind(ui.ritual_tooltip.title)
	local title = thracian_rituals.get_ritual(ritual_key).ui_title
	c_title:SetText(common.get_localised_string(title), ui.text_source)
end

function ui.ritual_card_set_ritual_tooltip_description(c_tooltip, ritual_key)
	local c_desc = c_tooltip:SequentialFind(ui.ritual_tooltip.description)
	local description = thracian_rituals.get_ritual(ritual_key).ui_description
	c_desc:SetText(common.get_localised_string(description), ui.text_source)
end

function ui.ritual_card_set_ritual_tooltip_explanation(c_tooltip, ritual_key)
	local c_expl = c_tooltip:SequentialFind(ui.ritual_tooltip.explanation.id)
	local ritual = thracian_rituals.get_ritual(ritual_key)
	local explanation = common.get_localised_string(ui.ritual_tooltip.explanation[ritual.group_name])
	c_expl:SetText(explanation, ui.ritual_tooltip.explanation[ritual.group_name])
end

function ui.ritual_card_set_ritual_tooltip_multiple_tiers(c_tooltip, ritual_key, tier_index)
	local ritual = thracian_rituals.get_ritual(ritual_key)
	local faction = cm:get_faction(thracian_rituals.faction_key)
	local _, highest_tier_index = thracian_rituals.get_highest_possible_tier(ritual_key)

	tier_index = tier_index or 1

	local c_not_available = c_tooltip:SequentialFind(ui.ritual_tooltip.multiple_tiers.template.txt_not_available)
	c_not_available:SetVisible(highest_tier_index ~= #ritual.tiers)

	c_tooltip:SequentialFind(ui.ritual_tooltip.one_tier):SetVisible(false)
	local list = c_tooltip:SequentialFind(ui.ritual_tooltip.multiple_tiers.list)

	local tier_template = list:SequentialFind(ui.ritual_tooltip.multiple_tiers.template.id)
	local tier = ritual.tiers[tier_index]
	local c_tier = UIComponent(list:CreateFromComponent(tier_template:Address(), string.format("tier%d", tier_index)))

	c_tier:InterfaceFunction("set_effect_bundle_record", tier.bundle_key)
	c_tier:SequentialFind(ui.ritual_tooltip.multiple_tiers.tier_index):SetState(tostring(tier_index))

	if #tier.required_buildings == 0 then
		c_tier:SequentialFind(ui.ritual_tooltip.required_buildings.id):SetVisible(false)
		return
	end

	-- Setup required buildings
	local buildings_list = c_tier:SequentialFind(ui.ritual_tooltip.required_buildings.list)
	local building_template = buildings_list:SequentialFind(ui.ritual_tooltip.required_buildings.template.id)
	for _, building in ipairs(tier.required_buildings) do
		local c_building = UIComponent(buildings_list:CreateFromComponent(building_template:Address(), 
									   building.culture_variant))
		local building_name_key = "building_culture_variants_name_" .. building.culture_variant
		local text = common.get_localised_string(building_name_key)
		local text_src = building_name_key
		if building.unlock_info_loc_key then
			text = text .. " " .. common.get_localised_string(building.unlock_info_loc_key)
			text_src = string.format("%s + %s", text_src, building.unlock_info_loc_key)
		end
		c_building:SetText(text, text_src)
		local state = ui.ritual_tooltip.required_buildings.template.states.available
		if cm:max_chain_level_in_faction(building.chain_key, faction) < building.min_level then
			state = ui.ritual_tooltip.required_buildings.template.states.unavailable
		end
		c_building:SetState(state)
	end
	building_template:SetVisible(false)

	tier_template:SetVisible(false)
end

function ui.ritual_card_set_ritual_tooltip_one_tier(c_tooltip, ritual_key)
	local ritual = thracian_rituals.get_ritual(ritual_key)
	c_tooltip:SequentialFind(ui.ritual_tooltip.multiple_tiers.id):SetVisible(false)

	local c_tier = c_tooltip:SequentialFind(ui.ritual_tooltip.one_tier)
	c_tier:InterfaceFunction("set_effect_bundle_record", ritual.tiers[1].bundle_key)

	if #ritual.tiers[1].required_buildings == 0 then
		c_tier:SequentialFind(ui.ritual_tooltip.required_buildings.id):SetVisible(false)
		return
	end

	-- Setup required buildings
	local faction = cm:get_faction(thracian_rituals.faction_key)
	local buildings_list = c_tier:SequentialFind(ui.ritual_tooltip.required_buildings.list)
	local building_template = buildings_list:SequentialFind(ui.ritual_tooltip.required_buildings.template.id)
	for _, building in ipairs(ritual.tiers[1].required_buildings) do
		local c_building = UIComponent(buildings_list:CreateFromComponent(building_template:Address(), 
									   building.culture_variant))
		local building_name_key = "building_culture_variants_name_" .. building.culture_variant
		local text = common.get_localised_string(building_name_key)
		local text_src = building_name_key
		if building.unlock_info_loc_key then
			text = text .. " " .. common.get_localised_string(building.unlock_info_loc_key)
			text_src = string.format("%s + %s", text_src, building.unlock_info_loc_key)
		end
		c_building:SetText(text, text_src)
		local state = ui.ritual_tooltip.required_buildings.template.states.available
		if cm:max_chain_level_in_faction(building.chain_key, faction) < building.min_level then
			state = ui.ritual_tooltip.required_buildings.template.states.unavailable
		end
		c_building:SetState(state)
	end
	building_template:SetVisible(false)
end

function ui.ritual_card_set_ritual_tooltip_feedback(c_tooltip, ritual_key)
	local c_feedback = c_tooltip:SequentialFind(ui.ritual_tooltip.feedback.id)
	local ritual = thracian_rituals.get_ritual(ritual_key)
	local available_tier = thracian_rituals.get_highest_possible_tier(ritual_key)

	if thracian_rituals.is_ritual_active(ritual_key) then
		local remaining_turns, is_infinite = 
			thracian_rituals.remaining_turns(ritual.group_name)

		if is_infinite then
			c_feedback:SetState(ui.ritual_tooltip.feedback.states.active_infinite)
		else
			c_feedback:SetState(ui.ritual_tooltip.feedback.states.active)
			c_feedback:SetStateText(string.format(c_feedback:GetStateText(), remaining_turns), "uied")
		end
	elseif thracian_rituals.active_rituals[ritual.group_name] then
		c_feedback:SetState(ui.ritual_tooltip.feedback.states.other_active_ritual)   
	elseif thracian_rituals.can_activate_ritual(ritual_key, true) then
		c_feedback:SetState(ui.ritual_tooltip.feedback.states.available)
	elseif not available_tier then
		c_feedback:SetState(ui.ritual_tooltip.feedback.states.not_available)
	elseif thracian_rituals.get_group_cooldown(ritual.group_name) > 0 then
		c_feedback:SetState(ui.ritual_tooltip.feedback.states.cooldown)
	else
		c_feedback:SetState(ui.ritual_tooltip.feedback.states.no_resources)
	end
end


function ui.ritual_card_set_ritual_tooltip_unit_cap(c_tooltip, ritual_key)
	local c_unit_cap = c_tooltip:SequentialFind(ui.ritual_tooltip.unit_cap)
	if not c_unit_cap then
		return
	end

	local ritual = thracian_rituals.get_ritual(ritual_key)
	local unit_reward = ritual.tiers[1].special_unit_reward
	c_unit_cap:SetVisible(not not unit_reward)

	if unit_reward then
		local cap = ritual.tiers[1].special_unit_reward.cap
		c_unit_cap:SetText(string.format(c_unit_cap:GetStateText(), cap), ui.text_source)
	end
end

-------------------------------- UI Actions

function ui.on_group_selected(group_name)
	uiv.selected_group = group_name

	uiv.selected_ritual_key = nil
	ui.update_button_activate_ritual()

	for i = 0, uiv.group_list:ChildCount() - 1 do
		UIComponent(uiv.group_list:Find(i)):SetState(ui.group_template.states.active)
	end
	uiv.group_list:SequentialFind(group_name):SetState(ui.group_template.states.selected)

	ui.create_ritual_cards(group_name)
	ui.update_cooldown_panel(group_name)
	ui.update_info_overlays_components(group_name)

	local should_show_unit_details = not not thracian_rituals.groups_with_unit_bonus[group_name]
	uiv.panel:SequentialFind(ui.unit_details_holder):SetVisible(should_show_unit_details)
end

function ui.update_info_overlays_components(selected_group_name)
	for group_name, component in pairs(uiv.info_overlays) do
		component:SetVisible(group_name == selected_group_name)
	end
end

function ui.try_select_ritual(ritual_key)
	local ritual = thracian_rituals.get_ritual(ritual_key)
	local active_ritual_key = thracian_rituals.try_get_active_ritual_key_from_group(ritual.group_name)
	if active_ritual_key and active_ritual_key ~= ritual_key then
		return -- if we have an active ritual, we can't select other rituals
	end

	local faction = cm:get_faction(thracian_rituals.faction_key)
	local can_afford = cm:faction_can_afford_resource_cost(faction, ritual.activation_cost)
	if not active_ritual_key and not can_afford then
		return -- can't select a ritual when you don't have enough resources for it
	end

	local is_already_selected = uiv.selected_ritual_key == ritual_key
	if is_already_selected then
		return
	end

	uiv.selected_ritual_key = ritual_key
	ui.update_button_activate_ritual()

	for i = 0, uiv.ritual_list:ChildCount() - 1 do
		local row = UIComponent(uiv.ritual_list:Find(i)):SequentialFind(ui.row_template.list)
		for j = 0, row:ChildCount() - 1 do
			local card = UIComponent(row:Find(j))
			if card:CurrentState() ~= ui.ritual_template.states.inactive then
				card:SetState(ui.ritual_template.states.active)
			end
		end
	end

	if ritual_key then
		uiv.ritual_list:SequentialFind(ritual_key):SetState(ui.ritual_template.states.selected)
	end
end

function ui.update_button_activate_ritual()
	local tooltip = ""
	local state

	if thracian_rituals.can_activate_ritual(uiv.selected_ritual_key) then
		state = ui.button_activate.states.active
		tooltip = ui.button_activate.tooltips.available
	else
		state = ui.button_activate.states.inactive
		local ritual = thracian_rituals.get_ritual(uiv.selected_ritual_key)
		local faction = cm:get_faction(thracian_rituals.faction_key)

		if thracian_rituals.active_rituals[uiv.selected_group] then
			tooltip = ui.button_activate.tooltips.active_ritual
		elseif thracian_rituals.get_group_cooldown(uiv.selected_group) > 0 then
			tooltip = ui.button_activate.tooltips.cooldown
		else
			if not uiv.selected_ritual_key then
				tooltip = ui.button_activate.tooltips.default
			-- elseif not cm:faction_can_afford_resource_cost(faction, ritual.activation_cost) then
			--	 tooltip = ui.button_activate.tooltips.cant_afford
			-- this state is removed
			end
		end
	end

	uiv.btn_activate_ritual:SetState(state)
	uiv.btn_activate_ritual:SetTooltipText(common.get_localised_string(tooltip), ui.text_source, true)
end

--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------

cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("THRACIAN_RITUALS_ACTIVE_COOLDOWNS", thracian_rituals.active_cooldowns, context)
		cm:save_named_value("THRACIAN_RITUALS_ACTIVE_RITUALS", thracian_rituals.active_rituals, context)
		cm:save_named_value("THRACIAN_RITUALS_AI_TRIGGER_NON_PASSIVE_RITUAL_COOLDOWN", thracian_rituals.ai.trigger_non_passive_ritual_cooldown, context)
		cm:save_named_value("THRACIAN_RITUALS_AI_TRIGGER_PASSIVE_RITUAL_COOLDOWN", thracian_rituals.ai.trigger_passive_ritual_cooldown, context)
	end
)

cm:add_loading_game_callback(
	function(context)
		thracian_rituals.active_cooldowns = cm:load_named_value("THRACIAN_RITUALS_ACTIVE_COOLDOWNS", thracian_rituals.active_cooldowns, context)
		thracian_rituals.active_rituals = cm:load_named_value("THRACIAN_RITUALS_ACTIVE_RITUALS", thracian_rituals.active_rituals, context)
		thracian_rituals.ai.trigger_non_passive_ritual_cooldown = cm:load_named_value("THRACIAN_RITUALS_AI_TRIGGER_NON_PASSIVE_RITUAL_COOLDOWN", thracian_rituals.ai.trigger_non_passive_ritual_cooldown, context)
		thracian_rituals.ai.trigger_passive_ritual_cooldown = cm:load_named_value("THRACIAN_RITUALS_AI_TRIGGER_PASSIVE_RITUAL_COOLDOWN", thracian_rituals.ai.trigger_passive_ritual_cooldown, context)
	end
)