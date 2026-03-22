local prefix = "troy_mythic_monsters_missions"

out("Loading " .. prefix .. ".lua")


--- table setup


mythic_monster_missions = {}
mythic_monster_missions.config = {
	issuer = "CLAN_ELDERS",
	--- numbered tables with faction keys
	--- if no faction key load it if faction is human
	-- mission data
	
	
		-- Key of the faction for which the mission should trigger
		-- if the mission is for all factions, add it to the table "any_faction". 
		-- If there is a mission with the same key for both a faction and in the "any_faction" table, the faction specific version will be triggered.
	--["troy_amazons_trj_penthesilea"] = {  
	--	[1] = { -- index of the mission(for MP safety)
	--		mission_key = "", -- mission key from the missions table
	--		trigger_turn = 50, -- turn number on which the mission should trigger 
	--		trigger_condition = function() return true end, -- trigger condition function which must also pass to trigger the mission. If not needed you can delete it.
	--		
	
			-- used when you need info for the conditions which is generated upon triggerring.
			-- When some info is generated here, you need to provide for which objective it is(if multiple). 
			-- The info generated then is saved as a string so the function is not called each time a save-load occurs.
	--		pre_construction_callback = function() return info or false end, 
	--		
	--		objective_and_conditions = { -- objectives and conditions table. May be used for scripted misions.
	--			objective = "ENGAGE_FORCE",
	--			conditions = {
	--				"requires_victory",
	--			},
	--		},

	--		payloads = {
	--			"adjust_experience_for_character { character 2030329467; amount 400; }",
	--		},

	--		completion_callback = function() end, -- function which is called upon successfull completion of the mission.
	--	}
	--},

	["troy_main_dan_achilles"] = {
		[1] = {
			mission_key = "troy_mth_intro_shade_early_game_mission",
			trigger_turn = 5,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_shade_early_game_mission",
						"troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_bowmen_elysium_early_game_mission,troy_mth_gen_myth_bowmen_elysium_early_game_mission",
						"troy_main_malis_trachis",
						302,
						404,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_shade_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_shade_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_main_dan_achilles", "troy_main_malis_trachis")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_shade_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_spears_elysium_mission_reward")
	
				--[[local unit_cap_effect_bundle = cm:create_new_custom_effect_bundle("effect_bundle_troy_mth_early_game_mission_myth_cap")
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_effect_unit_capacity_myth_centaurs_tier_2","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)]]
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_spears_elysium_mission_reward", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_shade_early_game_mission"))
				-- stoping the replenishment of the shade units. 
				cm:apply_effect_bundle("troy_mth_cerberus_block_replenishment_to_faction_HIDDEN", faction:name(), 0)
			end,
		},
		[2] = {
			mission_key = "troy_mth_intro_griffin_early_game_mission",
			trigger_turn = 9,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_griffin_early_game_mission",
						"troy_mth_gen_myth_arimaspoi_skirmishers,troy_mth_gen_myth_arimaspoi_skirmishers,troy_mth_gen_myth_arimaspoi_hunters,troy_mth_gen_myth_arimaspoi_hunters,troy_mth_gen_myth_arimaspoi_spearmen,troy_mth_gen_myth_arimaspoi_spearmen",
						"troy_main_cephisos_alpenos",
						343,
						416,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_griffin_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_griffin_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_main_dan_achilles", "troy_main_cephisos_alpenos")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_griffin_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_lesser_griffin")
	
				local cust_bundle_key = "effect_bundle_troy_mth_early_game_mission_myth_cap"
				local unit_cap_effect_bundle = cm:clone_or_create_custom_effect_bundle(faction:name(), cust_bundle_key)
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_mth_effect_unit_capacity_lesser_griffin","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_lesser_griffin", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_griffin_early_game_mission"))
			end,
		},
		[3] = {
			mission_key = "troy_mth_intro_hydra_early_game_mission",
			trigger_turn = 12,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_hydra_early_game_mission",
						"troy_mth_gen_myth_drinkers_venom,troy_mth_gen_myth_drinkers_venom,troy_mth_gen_myth_hydra_defenders,troy_mth_gen_myth_hydra_archers,troy_mth_gen_myth_hydra_archers,troy_mth_gen_myth_hydra_archers",
						"troy_main_phthia_alos",
						283,
						435,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_hydra_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_hydra_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_main_dan_achilles", "troy_main_phthia_alos")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_hydra_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_hydra_priest")
	
				local cust_bundle_key = "effect_bundle_troy_mth_early_game_mission_myth_cap"
				local unit_cap_effect_bundle = cm:clone_or_create_custom_effect_bundle(faction:name(), cust_bundle_key)
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_mth_effect_unit_capacity_hydra_priest","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_hydra_priest", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_hydra_early_game_mission"))
			end,
		}
	},
	
	["troy_main_dan_mycenae"] = {
		[1] = {
			mission_key = "troy_mth_intro_shade_early_game_mission",
			trigger_turn = 12,
			pre_construction_callback = function(index)
				if index == 1 then 
					local target_faction = "troy_mth_shade_early_game_mission"
	
					cm:create_force(
						target_faction,
						"troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_bowmen_elysium_early_game_mission,troy_mth_gen_myth_bowmen_elysium_early_game_mission",
						"troy_main_mycenaeca_mycenae",
						307,
						301,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
								end

								cm:force_declare_war(cm:get_local_faction_name(true), target_faction, false , false, true)
								cm:force_diplomacy("all", "faction:".. target_faction, "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_main_dan_mycenae", "troy_main_mycenaeca_mycenae")
					return "faction " .. target_faction 
				end
			end,
			objective_and_conditions = {
				{
					objective = "DESTROY_FACTION",
					conditions = {
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_shade_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_spears_elysium_mission_reward")
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_spears_elysium_mission_reward", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_shade_early_game_mission"))
				-- stoping the replenishment of the shade units. 
				cm:apply_effect_bundle("troy_mth_cerberus_block_replenishment_to_faction_HIDDEN", faction:name(), 0)
			end,
		},
		[2] = {
			mission_key = "troy_mth_intro_griffin_early_game_mission",
			trigger_turn = 9,
			pre_construction_callback = function(index)
				if index == 1 then 
					local target_faction = "troy_mth_griffin_early_game_mission"
	
					cm:create_force(
						target_faction,
						"troy_mth_gen_myth_arimaspoi_skirmishers,troy_mth_gen_myth_arimaspoi_skirmishers,troy_mth_gen_myth_arimaspoi_hunters,troy_mth_gen_myth_arimaspoi_hunters,troy_mth_gen_myth_arimaspoi_spearmen,troy_mth_gen_myth_arimaspoi_spearmen",
						"troy_main_tyrinthia_tiryns",
						336,
						280,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
								end

								cm:force_declare_war(cm:get_local_faction_name(true), target_faction, false , false, true)
								cm:force_diplomacy("all", "faction:".. target_faction, "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_main_dan_mycenae", "troy_main_tyrinthia_tiryns")
					return "faction " .. target_faction
				end
			end,
			objective_and_conditions = {
				{
					objective = "DESTROY_FACTION",
					conditions = {
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_griffin_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_lesser_griffin")
	
				local cust_bundle_key = "effect_bundle_troy_mth_early_game_mission_myth_cap"
				local unit_cap_effect_bundle = cm:clone_or_create_custom_effect_bundle(faction:name(), cust_bundle_key)
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_mth_effect_unit_capacity_lesser_griffin","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_lesser_griffin", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_griffin_early_game_mission"))
			end,
		},
		[3] = {
			mission_key = "troy_mth_intro_hydra_early_game_mission",
			trigger_turn = 5,
			pre_construction_callback = function(index)
				if index == 1 then 
					local target_faction = "troy_mth_hydra_early_game_mission"
	
					cm:create_force(
						target_faction,
						"troy_mth_gen_myth_drinkers_venom,troy_mth_gen_myth_drinkers_venom,troy_mth_gen_myth_hydra_defenders,troy_mth_gen_myth_hydra_archers,troy_mth_gen_myth_hydra_archers,troy_mth_gen_myth_hydra_archers",
						"troy_main_argolis_erchomenos",
						300,
						286,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
								end

								cm:force_declare_war(cm:get_local_faction_name(true), target_faction, false , false, true)
								cm:force_diplomacy("all", "faction:".. target_faction, "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_main_dan_mycenae", "troy_main_argolis_erchomenos")
					return "faction " .. target_faction 
				end
			end,
			objective_and_conditions = {
				{
					objective = "DESTROY_FACTION",
					conditions = {
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_hydra_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_hydra_priest")
	
				local cust_bundle_key = "effect_bundle_troy_mth_early_game_mission_myth_cap"
				local unit_cap_effect_bundle = cm:clone_or_create_custom_effect_bundle(faction:name(), cust_bundle_key)
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_mth_effect_unit_capacity_hydra_priest","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_hydra_priest", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_hydra_early_game_mission"))
			end,
		}
	},
	
	["troy_main_dan_ithaca"] = {
		[1] = {
			mission_key = "troy_mth_intro_shade_early_game_mission",
			trigger_turn = 9,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_shade_early_game_mission",
						"troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_bowmen_elysium_early_game_mission,troy_mth_gen_myth_bowmen_elysium_early_game_mission",
						"troy_main_elis_myrsinos",
						208,
						316,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_shade_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_shade_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_main_dan_ithaca", "troy_main_elis_myrsinos")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_shade_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_spears_elysium_mission_reward")
	
				--[[local unit_cap_effect_bundle = cm:create_new_custom_effect_bundle("effect_bundle_troy_mth_early_game_mission_myth_cap")
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_effect_unit_capacity_myth_centaurs_tier_2","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)]]
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_spears_elysium_mission_reward", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_shade_early_game_mission"))
				-- stoping the replenishment of the shade units. 
				cm:apply_effect_bundle("troy_mth_cerberus_block_replenishment_to_faction_HIDDEN", faction:name(), 0)
			end,
		},
		[2] = {
			mission_key = "troy_mth_intro_griffin_early_game_mission",
			trigger_turn = 5,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_griffin_early_game_mission",
						"troy_mth_gen_myth_arimaspoi_skirmishers,troy_mth_gen_myth_arimaspoi_skirmishers,troy_mth_gen_myth_arimaspoi_hunters,troy_mth_gen_myth_arimaspoi_hunters,troy_mth_gen_myth_arimaspoi_spearmen,troy_mth_gen_myth_arimaspoi_spearmen",
						"troy_main_cephallenia_hyrie",
						166,
						274,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_griffin_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_griffin_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_main_dan_ithaca", "troy_main_cephallenia_hyrie")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_griffin_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_lesser_griffin")
	
				local cust_bundle_key = "effect_bundle_troy_mth_early_game_mission_myth_cap"
				local unit_cap_effect_bundle = cm:clone_or_create_custom_effect_bundle(faction:name(), cust_bundle_key)
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_mth_effect_unit_capacity_lesser_griffin","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_lesser_griffin", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_griffin_early_game_mission"))
			end,
		},
		[3] = {
			mission_key = "troy_mth_intro_hydra_early_game_mission",
			trigger_turn = 12,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_hydra_early_game_mission",
						"troy_mth_gen_myth_drinkers_venom,troy_mth_gen_myth_drinkers_venom,troy_mth_gen_myth_hydra_defenders,troy_mth_gen_myth_hydra_archers,troy_mth_gen_myth_hydra_archers,troy_mth_gen_myth_hydra_archers",
						"troy_main_cephallenia_kranioi",
						133,
						326,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_hydra_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_hydra_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_main_dan_ithaca", "troy_main_cephallenia_kranioi")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_hydra_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_hydra_priest")
	
				local cust_bundle_key = "effect_bundle_troy_mth_early_game_mission_myth_cap"
				local unit_cap_effect_bundle = cm:clone_or_create_custom_effect_bundle(faction:name(), cust_bundle_key)
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_mth_effect_unit_capacity_hydra_priest","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_hydra_priest", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_hydra_early_game_mission"))
			end,
		}
	},
	
	["troy_main_dan_sparta"] = {
		[1] = {
			mission_key = "troy_mth_intro_shade_early_game_mission",
			trigger_turn = 12,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_shade_early_game_mission",
						"troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_bowmen_elysium_early_game_mission,troy_mth_gen_myth_bowmen_elysium_early_game_mission",
						"troy_main_lacedaemon_oitylon",
						289,
						200,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_shade_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_shade_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_main_dan_sparta", "troy_main_lacedaemon_oitylon")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_shade_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_spears_elysium_mission_reward")
	
				--[[local unit_cap_effect_bundle = cm:create_new_custom_effect_bundle("effect_bundle_troy_mth_early_game_mission_myth_cap")
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_effect_unit_capacity_myth_centaurs_tier_2","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)]]
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_spears_elysium_mission_reward", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_shade_early_game_mission"))
				-- stoping the replenishment of the shade units. 
				cm:apply_effect_bundle("troy_mth_cerberus_block_replenishment_to_faction_HIDDEN", faction:name(), 0)
			end,
		},
		[2] = {
			mission_key = "troy_mth_intro_griffin_early_game_mission",
			trigger_turn = 5,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_griffin_early_game_mission",
						"troy_mth_gen_myth_arimaspoi_skirmishers,troy_mth_gen_myth_arimaspoi_skirmishers,troy_mth_gen_myth_arimaspoi_hunters,troy_mth_gen_myth_arimaspoi_hunters,troy_mth_gen_myth_arimaspoi_spearmen,troy_mth_gen_myth_arimaspoi_spearmen",
						"troy_main_lacedaemon_boeae",
						337,
						206,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_griffin_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_griffin_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_main_dan_sparta", "troy_main_lacedaemon_boeae")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_griffin_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_lesser_griffin")
	
				local cust_bundle_key = "effect_bundle_troy_mth_early_game_mission_myth_cap"
				local unit_cap_effect_bundle = cm:clone_or_create_custom_effect_bundle(faction:name(), cust_bundle_key)
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_mth_effect_unit_capacity_lesser_griffin","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_lesser_griffin", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_griffin_early_game_mission"))
			end,
		},
		[3] = {
			mission_key = "troy_mth_intro_hydra_early_game_mission",
			trigger_turn = 9,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_hydra_early_game_mission",
						"troy_mth_gen_myth_drinkers_venom,troy_mth_gen_myth_drinkers_venom,troy_mth_gen_myth_hydra_defenders,troy_mth_gen_myth_hydra_archers,troy_mth_gen_myth_hydra_archers,troy_mth_gen_myth_hydra_archers",
						"troy_main_lacedaemon_sparta",
						318,
						205,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_hydra_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_hydra_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_main_dan_sparta", "troy_main_lacedaemon_sparta")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_hydra_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_hydra_priest")
	
				local cust_bundle_key = "effect_bundle_troy_mth_early_game_mission_myth_cap"
				local unit_cap_effect_bundle = cm:clone_or_create_custom_effect_bundle(faction:name(), cust_bundle_key)
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_mth_effect_unit_capacity_hydra_priest","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_hydra_priest", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_hydra_early_game_mission"))
			end,
		}
	},
	
	["troy_main_dan_salamis"] = {
		[1] = {
			mission_key = "troy_mth_intro_shade_early_game_mission",
			trigger_turn = 5,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_shade_early_game_mission",
						"troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_bowmen_elysium_early_game_mission,troy_mth_gen_myth_bowmen_elysium_early_game_mission",
						"troy_main_syrmata_melos",
						401,
						306,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_shade_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_shade_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_main_dan_salamis", "troy_main_syrmata_melos")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_shade_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_spears_elysium_mission_reward")
	
				--[[local unit_cap_effect_bundle = cm:create_new_custom_effect_bundle("effect_bundle_troy_mth_early_game_mission_myth_cap")
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_effect_unit_capacity_myth_centaurs_tier_2","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)]]
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_spears_elysium_mission_reward", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_shade_early_game_mission"))
				-- stoping the replenishment of the shade units. 
				cm:apply_effect_bundle("troy_mth_cerberus_block_replenishment_to_faction_HIDDEN", faction:name(), 0)
			end,
		},
		[2] = {
			mission_key = "troy_mth_intro_griffin_early_game_mission",
			trigger_turn = 12,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_griffin_early_game_mission",
						"troy_mth_gen_myth_arimaspoi_skirmishers,troy_mth_gen_myth_arimaspoi_skirmishers,troy_mth_gen_myth_arimaspoi_hunters,troy_mth_gen_myth_arimaspoi_hunters,troy_mth_gen_myth_arimaspoi_spearmen,troy_mth_gen_myth_arimaspoi_spearmen",
						"troy_main_attica_thorikos",
						390,
						313,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_griffin_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_griffin_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_main_dan_salamis", "troy_main_attica_thorikos")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_griffin_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_lesser_griffin")
	
				local cust_bundle_key = "effect_bundle_troy_mth_early_game_mission_myth_cap"
				local unit_cap_effect_bundle = cm:clone_or_create_custom_effect_bundle(faction:name(), cust_bundle_key)
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_mth_effect_unit_capacity_lesser_griffin","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_lesser_griffin", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_griffin_early_game_mission"))
			end,
		},
		[3] = {
			mission_key = "troy_mth_intro_hydra_early_game_mission",
			trigger_turn = 9,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_hydra_early_game_mission",
						"troy_mth_gen_myth_drinkers_venom,troy_mth_gen_myth_drinkers_venom,troy_mth_gen_myth_hydra_defenders,troy_mth_gen_myth_hydra_archers,troy_mth_gen_myth_hydra_archers,troy_mth_gen_myth_hydra_archers",
						"troy_main_megaris_megara",
						336,
						314,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_hydra_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_hydra_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_main_dan_salamis", "troy_main_megaris_megara")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_hydra_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_hydra_priest")

				local cust_bundle_key = "effect_bundle_troy_mth_early_game_mission_myth_cap"
				local unit_cap_effect_bundle = cm:clone_or_create_custom_effect_bundle(faction:name(), cust_bundle_key)
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_mth_effect_unit_capacity_hydra_priest","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_hydra_priest", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_hydra_early_game_mission"))
			end,
		}
	},
	
	["troy_main_dan_argos"] = {
		[1] = {
			mission_key = "troy_mth_intro_shade_early_game_mission",
			trigger_turn = 9,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_shade_early_game_mission",
						"troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_bowmen_elysium_early_game_mission,troy_mth_gen_myth_bowmen_elysium_early_game_mission",
						"troy_main_mycenaeca_mycenae",
						307,
						301,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_shade_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_shade_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_main_dan_argos", "troy_main_mycenaeca_mycenae")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_shade_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_spears_elysium_mission_reward")
	
				--[[local unit_cap_effect_bundle = cm:create_new_custom_effect_bundle("effect_bundle_troy_mth_early_game_mission_myth_cap")
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_effect_unit_capacity_myth_centaurs_tier_2","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)]]
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_spears_elysium_mission_reward", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_shade_early_game_mission"))
				-- stoping the replenishment of the shade units. 
				cm:apply_effect_bundle("troy_mth_cerberus_block_replenishment_to_faction_HIDDEN", faction:name(), 0)
			end,
		},
		[2] = {
			mission_key = "troy_mth_intro_griffin_early_game_mission",
			trigger_turn = 12,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_griffin_early_game_mission",
						"troy_mth_gen_myth_arimaspoi_skirmishers,troy_mth_gen_myth_arimaspoi_skirmishers,troy_mth_gen_myth_arimaspoi_hunters,troy_mth_gen_myth_arimaspoi_hunters,troy_mth_gen_myth_arimaspoi_spearmen,troy_mth_gen_myth_arimaspoi_spearmen",
						"troy_main_argolis_thyrea",
						322,
						240,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_griffin_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_griffin_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_main_dan_argos", "troy_main_argolis_thyrea")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_griffin_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_lesser_griffin")
	
				local cust_bundle_key = "effect_bundle_troy_mth_early_game_mission_myth_cap"
				local unit_cap_effect_bundle = cm:clone_or_create_custom_effect_bundle(faction:name(), cust_bundle_key)
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_mth_effect_unit_capacity_lesser_griffin","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_lesser_griffin", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_griffin_early_game_mission"))
			end,
		},
		[3] = {
			mission_key = "troy_mth_intro_hydra_early_game_mission",
			trigger_turn = 5,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_hydra_early_game_mission",
						"troy_mth_gen_myth_drinkers_venom,troy_mth_gen_myth_drinkers_venom,troy_mth_gen_myth_hydra_defenders,troy_mth_gen_myth_hydra_archers,troy_mth_gen_myth_hydra_archers,troy_mth_gen_myth_hydra_archers",
						"troy_main_argolis_erchomenos",
						300,
						286,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_hydra_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_hydra_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_main_dan_argos", "troy_main_argolis_erchomenos")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_hydra_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_hydra_priest")
	
				local cust_bundle_key = "effect_bundle_troy_mth_early_game_mission_myth_cap"
				local unit_cap_effect_bundle = cm:clone_or_create_custom_effect_bundle(faction:name(), cust_bundle_key)
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_mth_effect_unit_capacity_hydra_priest","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_hydra_priest", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_hydra_early_game_mission"))
			end,
		}
	},
	
	["troy_main_trj_hector"] = {
		[1] = {
			mission_key = "troy_mth_intro_shade_early_game_mission",
			trigger_turn = 12,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_shade_early_game_mission",
						"troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_bowmen_elysium_early_game_mission,troy_mth_gen_myth_bowmen_elysium_early_game_mission",
						"troy_main_ide_gargara",
						580,
						516,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
									cm:add_unit_model_overrides(cm:char_lookup_str(character), "troy_warlord_thracian_hero_4")
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_shade_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_shade_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_main_trj_hector", "troy_main_ide_gargara")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_shade_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_spears_elysium_mission_reward")
	
				--[[local unit_cap_effect_bundle = cm:create_new_custom_effect_bundle("effect_bundle_troy_mth_early_game_mission_myth_cap")
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_effect_unit_capacity_myth_centaurs_tier_2","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)]]
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_spears_elysium_mission_reward", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_shade_early_game_mission"))
				-- stoping the replenishment of the shade units. 
				cm:apply_effect_bundle("troy_mth_cerberus_block_replenishment_to_faction_HIDDEN", faction:name(), 0)
			end,
		},
		[2] = {
			mission_key = "troy_mth_intro_griffin_early_game_mission",
			trigger_turn = 9,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_griffin_early_game_mission",
						"troy_mth_gen_myth_arimaspoi_skirmishers,troy_mth_gen_myth_arimaspoi_skirmishers,troy_mth_gen_myth_arimaspoi_hunters,troy_mth_gen_myth_arimaspoi_hunters,troy_mth_gen_myth_arimaspoi_spearmen,troy_mth_gen_myth_arimaspoi_spearmen",
						"troy_main_adrastea_skepsis",
						606,
						540,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
									cm:add_unit_model_overrides(cm:char_lookup_str(character), "troy_warlord_pelasgian_hero_4")
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_griffin_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_griffin_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_main_trj_hector", "troy_main_adrastea_skepsis")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_griffin_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_lesser_griffin")
	
				local cust_bundle_key = "effect_bundle_troy_mth_early_game_mission_myth_cap"
				local unit_cap_effect_bundle = cm:clone_or_create_custom_effect_bundle(faction:name(), cust_bundle_key)
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_mth_effect_unit_capacity_lesser_griffin","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_lesser_griffin", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_griffin_early_game_mission"))
			end,
		},
		[3] = {
			mission_key = "troy_mth_intro_hydra_early_game_mission",
			trigger_turn = 5,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_hydra_early_game_mission",
						"troy_mth_gen_myth_drinkers_venom,troy_mth_gen_myth_drinkers_venom,troy_mth_gen_myth_hydra_defenders,troy_mth_gen_myth_hydra_archers,troy_mth_gen_myth_hydra_archers,troy_mth_gen_myth_hydra_archers",
						"troy_main_ide_zeleia",
						567,
						524,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
									cm:add_unit_model_overrides(cm:char_lookup_str(character), "troy_warlord_maeonian_hero_4")
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_hydra_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_hydra_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_main_trj_hector", "troy_main_ide_zeleia")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_hydra_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_hydra_priest")
	
				local cust_bundle_key = "effect_bundle_troy_mth_early_game_mission_myth_cap"
				local unit_cap_effect_bundle = cm:clone_or_create_custom_effect_bundle(faction:name(), cust_bundle_key)
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_mth_effect_unit_capacity_hydra_priest","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_hydra_priest", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_hydra_early_game_mission"))
			end,
		}
	},
	
	["troy_main_trj_paris"] = {
		[1] = {
			mission_key = "troy_mth_intro_shade_early_game_mission",
			trigger_turn = 9,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_shade_early_game_mission",
						"troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_bowmen_elysium_early_game_mission,troy_mth_gen_myth_bowmen_elysium_early_game_mission",
						"troy_main_ide_gargara",
						580,
						516,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
									cm:add_unit_model_overrides(cm:char_lookup_str(character), "troy_warlord_thracian_hero_4")
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_shade_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_shade_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_main_trj_paris", "troy_main_ide_gargara")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_shade_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_spears_elysium_mission_reward")
	
				--[[local unit_cap_effect_bundle = cm:create_new_custom_effect_bundle("effect_bundle_troy_mth_early_game_mission_myth_cap")
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_effect_unit_capacity_myth_centaurs_tier_2","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)]]
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_spears_elysium_mission_reward", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_shade_early_game_mission"))
				-- stoping the replenishment of the shade units. 
				cm:apply_effect_bundle("troy_mth_cerberus_block_replenishment_to_faction_HIDDEN", faction:name(), 0)
			end,
		},
		[2] = {
			mission_key = "troy_mth_intro_griffin_early_game_mission",
			trigger_turn = 5,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_griffin_early_game_mission",
						"troy_mth_gen_myth_arimaspoi_skirmishers,troy_mth_gen_myth_arimaspoi_skirmishers,troy_mth_gen_myth_arimaspoi_hunters,troy_mth_gen_myth_arimaspoi_hunters,troy_mth_gen_myth_arimaspoi_spearmen,troy_mth_gen_myth_arimaspoi_spearmen",
						"troy_main_adrastea_skepsis",
						606,
						540,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
									cm:add_unit_model_overrides(cm:char_lookup_str(character), "troy_warlord_pelasgian_hero_4")
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_griffin_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_griffin_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_main_trj_paris", "troy_main_adrastea_skepsis")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_griffin_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_lesser_griffin")
	
				local cust_bundle_key = "effect_bundle_troy_mth_early_game_mission_myth_cap"
				local unit_cap_effect_bundle = cm:clone_or_create_custom_effect_bundle(faction:name(), cust_bundle_key)
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_mth_effect_unit_capacity_lesser_griffin","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_lesser_griffin", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_griffin_early_game_mission"))
			end,
		},
		[3] = {
			mission_key = "troy_mth_intro_hydra_early_game_mission",
			trigger_turn = 12,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_hydra_early_game_mission",
						"troy_mth_gen_myth_drinkers_venom,troy_mth_gen_myth_drinkers_venom,troy_mth_gen_myth_hydra_defenders,troy_mth_gen_myth_hydra_archers,troy_mth_gen_myth_hydra_archers,troy_mth_gen_myth_hydra_archers",
						"troy_main_ide_zeleia",
						567,
						524,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
									cm:add_unit_model_overrides(cm:char_lookup_str(character), "troy_warlord_maeonian_hero_4")
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_hydra_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_hydra_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_main_trj_paris", "troy_main_ide_zeleia")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_hydra_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_hydra_priest")
	
				local cust_bundle_key = "effect_bundle_troy_mth_early_game_mission_myth_cap"
				local unit_cap_effect_bundle = cm:clone_or_create_custom_effect_bundle(faction:name(), cust_bundle_key)
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_mth_effect_unit_capacity_hydra_priest","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_hydra_priest", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_hydra_early_game_mission"))
			end,
		}
	},
	
	["troy_main_trj_dardania"] = {
		[1] = {
			mission_key = "troy_mth_intro_shade_early_game_mission",
			trigger_turn = 9,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_shade_early_game_mission",
						"troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_bowmen_elysium_early_game_mission,troy_mth_gen_myth_bowmen_elysium_early_game_mission",
						"troy_main_dardania_pityoussa",
						578,
						574,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
									cm:add_unit_model_overrides(cm:char_lookup_str(character), "troy_warlord_thracian_hero_4")
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_shade_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_shade_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_main_trj_dardania", "troy_main_dardania_pityoussa")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_shade_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_spears_elysium_mission_reward")
	
				--[[local unit_cap_effect_bundle = cm:create_new_custom_effect_bundle("effect_bundle_troy_mth_early_game_mission_myth_cap")
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_effect_unit_capacity_myth_centaurs_tier_2","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)]]
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_spears_elysium_mission_reward", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_shade_early_game_mission"))
				-- stoping the replenishment of the shade units. 
				cm:apply_effect_bundle("troy_mth_cerberus_block_replenishment_to_faction_HIDDEN", faction:name(), 0)
			end,
		},
		[2] = {
			mission_key = "troy_mth_intro_griffin_early_game_mission",
			trigger_turn = 12,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_griffin_early_game_mission",
						"troy_mth_gen_myth_arimaspoi_skirmishers,troy_mth_gen_myth_arimaspoi_skirmishers,troy_mth_gen_myth_arimaspoi_hunters,troy_mth_gen_myth_arimaspoi_hunters,troy_mth_gen_myth_arimaspoi_spearmen,troy_mth_gen_myth_arimaspoi_spearmen",
						"troy_main_ilion_thymbra",
						573,
						548,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
									cm:add_unit_model_overrides(cm:char_lookup_str(character), "troy_warlord_pelasgian_hero_4")
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_griffin_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_griffin_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_main_trj_dardania", "troy_main_ilion_thymbra")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_griffin_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_lesser_griffin")
	
				local cust_bundle_key = "effect_bundle_troy_mth_early_game_mission_myth_cap"
				local unit_cap_effect_bundle = cm:clone_or_create_custom_effect_bundle(faction:name(), cust_bundle_key)
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_mth_effect_unit_capacity_lesser_griffin","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_lesser_griffin", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_griffin_early_game_mission"))
			end,
		},
		[3] = {
			mission_key = "troy_mth_intro_hydra_early_game_mission",
			trigger_turn = 5,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_hydra_early_game_mission",
						"troy_mth_gen_myth_drinkers_venom,troy_mth_gen_myth_drinkers_venom,troy_mth_gen_myth_hydra_defenders,troy_mth_gen_myth_hydra_archers,troy_mth_gen_myth_hydra_archers,troy_mth_gen_myth_hydra_archers",
						"troy_main_troas_colonae",
						556,
						528,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
									cm:add_unit_model_overrides(cm:char_lookup_str(character), "troy_warlord_maeonian_hero_4")
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_hydra_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_hydra_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_main_trj_dardania", "troy_main_troas_colonae")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_hydra_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_hydra_priest")
	
				local cust_bundle_key = "effect_bundle_troy_mth_early_game_mission_myth_cap"
				local unit_cap_effect_bundle = cm:clone_or_create_custom_effect_bundle(faction:name(), cust_bundle_key)
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_mth_effect_unit_capacity_hydra_priest","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_hydra_priest", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_hydra_early_game_mission"))
			end,
		}
	},
	
	["troy_main_trj_lycia"] = {
		[1] = {
			mission_key = "troy_mth_intro_shade_early_game_mission",
			trigger_turn = 9,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_shade_early_game_mission",
						"troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_bowmen_elysium_early_game_mission,troy_mth_gen_myth_bowmen_elysium_early_game_mission",
						"troy_main_cibyratis_cibyra",
						787,
						313,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
									cm:add_unit_model_overrides(cm:char_lookup_str(character), "troy_warlord_thracian_hero_4")
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_shade_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_shade_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_main_trj_lycia", "troy_main_cibyratis_cibyra")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_shade_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_spears_elysium_mission_reward")
	
				--[[local unit_cap_effect_bundle = cm:create_new_custom_effect_bundle("effect_bundle_troy_mth_early_game_mission_myth_cap")
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_effect_unit_capacity_myth_centaurs_tier_2","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)]]
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_spears_elysium_mission_reward", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_shade_early_game_mission"))
				-- stoping the replenishment of the shade units. 
				cm:apply_effect_bundle("troy_mth_cerberus_block_replenishment_to_faction_HIDDEN", faction:name(), 0)
			end,
		},
		[2] = {
			mission_key = "troy_mth_intro_griffin_early_game_mission",
			trigger_turn = 5,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_griffin_early_game_mission",
						"troy_mth_gen_myth_arimaspoi_skirmishers,troy_mth_gen_myth_arimaspoi_skirmishers,troy_mth_gen_myth_arimaspoi_hunters,troy_mth_gen_myth_arimaspoi_hunters,troy_mth_gen_myth_arimaspoi_spearmen,troy_mth_gen_myth_arimaspoi_spearmen",
						"troy_main_cibyratis_tlos",
						840,
						275,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
									cm:add_unit_model_overrides(cm:char_lookup_str(character), "troy_warlord_pelasgian_hero_4")
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_griffin_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_griffin_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_main_trj_lycia", "troy_main_cibyratis_tlos")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_griffin_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_lesser_griffin")
	
				local cust_bundle_key = "effect_bundle_troy_mth_early_game_mission_myth_cap"
				local unit_cap_effect_bundle = cm:clone_or_create_custom_effect_bundle(faction:name(), cust_bundle_key)
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_mth_effect_unit_capacity_lesser_griffin","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_lesser_griffin", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_griffin_early_game_mission"))
			end,
		},
		[3] = {
			mission_key = "troy_mth_intro_hydra_early_game_mission",
			trigger_turn = 12,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_hydra_early_game_mission",
						"troy_mth_gen_myth_drinkers_venom,troy_mth_gen_myth_drinkers_venom,troy_mth_gen_myth_hydra_defenders,troy_mth_gen_myth_hydra_archers,troy_mth_gen_myth_hydra_archers,troy_mth_gen_myth_hydra_archers",
						"troy_main_isthmos_kaunos",
						778,
						286,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
									cm:add_unit_model_overrides(cm:char_lookup_str(character), "troy_warlord_maeonian_hero_4")
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_hydra_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_hydra_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_main_trj_lycia", "troy_main_isthmos_kaunos")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_hydra_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_hydra_priest")
	
				local cust_bundle_key = "effect_bundle_troy_mth_early_game_mission_myth_cap"
				local unit_cap_effect_bundle = cm:clone_or_create_custom_effect_bundle(faction:name(), cust_bundle_key)
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_mth_effect_unit_capacity_hydra_priest","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_hydra_priest", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_hydra_early_game_mission"))
			end,
		}
	},
	
	["troy_amazons_trj_hippolyta"] = {
		[1] = {
			mission_key = "troy_mth_intro_shade_early_game_mission",
			trigger_turn = 5,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_shade_early_game_mission",
						"troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_bowmen_elysium_early_game_mission,troy_mth_gen_myth_bowmen_elysium_early_game_mission",
						"troy_main_kaystros_ephesos",
						653,
						355,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
									cm:add_unit_model_overrides(cm:char_lookup_str(character), "troy_warlord_thracian_hero_4")
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_shade_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_shade_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_amazons_trj_hippolyta", "troy_main_kaystros_ephesos")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_shade_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_spears_elysium_mission_reward")
	
				--[[local unit_cap_effect_bundle = cm:create_new_custom_effect_bundle("effect_bundle_troy_mth_early_game_mission_myth_cap")
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_effect_unit_capacity_myth_centaurs_tier_2","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)]]
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_spears_elysium_mission_reward", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_shade_early_game_mission"))
				-- stoping the replenishment of the shade units. 
				cm:apply_effect_bundle("troy_mth_cerberus_block_replenishment_to_faction_HIDDEN", faction:name(), 0)
			end,
		},
		[2] = {
			mission_key = "troy_mth_intro_griffin_early_game_mission",
			trigger_turn = 12,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_griffin_early_game_mission",
						"troy_mth_gen_myth_arimaspoi_skirmishers,troy_mth_gen_myth_arimaspoi_skirmishers,troy_mth_gen_myth_arimaspoi_hunters,troy_mth_gen_myth_arimaspoi_hunters,troy_mth_gen_myth_arimaspoi_spearmen,troy_mth_gen_myth_arimaspoi_spearmen",
						"troy_main_maeandros_eyanthia",
						704,
						374,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
									cm:add_unit_model_overrides(cm:char_lookup_str(character), "troy_warlord_pelasgian_hero_4")
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_griffin_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_griffin_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_amazons_trj_hippolyta", "troy_main_maeandros_eyanthia")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_griffin_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_lesser_griffin")
	
				local cust_bundle_key = "effect_bundle_troy_mth_early_game_mission_myth_cap"
				local unit_cap_effect_bundle = cm:clone_or_create_custom_effect_bundle(faction:name(), cust_bundle_key)
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_mth_effect_unit_capacity_lesser_griffin","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_lesser_griffin", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_griffin_early_game_mission"))
			end,
		},
		[3] = {
			mission_key = "troy_mth_intro_hydra_early_game_mission",
			trigger_turn = 9,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_hydra_early_game_mission",
						"troy_mth_gen_myth_drinkers_venom,troy_mth_gen_myth_drinkers_venom,troy_mth_gen_myth_hydra_defenders,troy_mth_gen_myth_hydra_archers,troy_mth_gen_myth_hydra_archers,troy_mth_gen_myth_hydra_archers",
						"troy_main_maeandros_eyanthia",
						718,
						358,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
									cm:add_unit_model_overrides(cm:char_lookup_str(character), "troy_warlord_maeonian_hero_4")
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_hydra_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_hydra_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_amazons_trj_hippolyta", "troy_main_maeandros_eyanthia")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_hydra_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_hydra_priest")
	
				local cust_bundle_key = "effect_bundle_troy_mth_early_game_mission_myth_cap"
				local unit_cap_effect_bundle = cm:clone_or_create_custom_effect_bundle(faction:name(), cust_bundle_key)
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_mth_effect_unit_capacity_hydra_priest","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_hydra_priest", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_hydra_early_game_mission"))
			end,
		}
	},
	
	["troy_amazons_trj_penthesilea"] = {
		[1] = {
			mission_key = "troy_mth_intro_shade_early_game_mission",
			trigger_turn = 5,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_shade_early_game_mission",
						"troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_bowmen_elysium_early_game_mission,troy_mth_gen_myth_bowmen_elysium_early_game_mission",
						"troy_main_mysia_proconnesos",
						640,
						660,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
									cm:add_unit_model_overrides(cm:char_lookup_str(character), "troy_warlord_thracian_hero_4")
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_shade_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_shade_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_amazons_trj_penthesilea", "troy_main_mysia_proconnesos")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_shade_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_spears_elysium_mission_reward")
	
				--[[local unit_cap_effect_bundle = cm:create_new_custom_effect_bundle("effect_bundle_troy_mth_early_game_mission_myth_cap")
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_effect_unit_capacity_myth_centaurs_tier_2","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)]]
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_spears_elysium_mission_reward", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_shade_early_game_mission"))
				-- stoping the replenishment of the shade units. 
				cm:apply_effect_bundle("troy_mth_cerberus_block_replenishment_to_faction_HIDDEN", faction:name(), 0)
			end,
		},
		[2] = {
			mission_key = "troy_mth_intro_griffin_early_game_mission",
			trigger_turn = 9,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_griffin_early_game_mission",
						"troy_mth_gen_myth_arimaspoi_skirmishers,troy_mth_gen_myth_arimaspoi_skirmishers,troy_mth_gen_myth_arimaspoi_hunters,troy_mth_gen_myth_arimaspoi_hunters,troy_mth_gen_myth_arimaspoi_spearmen,troy_mth_gen_myth_arimaspoi_spearmen",
						"troy_main_bythynia_procerastis",
						590,
						619,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
									cm:add_unit_model_overrides(cm:char_lookup_str(character), "troy_warlord_pelasgian_hero_4")
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_griffin_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_griffin_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_amazons_trj_penthesilea", "troy_main_bythynia_procerastis")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_griffin_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_lesser_griffin")
	
				local cust_bundle_key = "effect_bundle_troy_mth_early_game_mission_myth_cap"
				local unit_cap_effect_bundle = cm:clone_or_create_custom_effect_bundle(faction:name(), cust_bundle_key)
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_mth_effect_unit_capacity_lesser_griffin","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_lesser_griffin", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_griffin_early_game_mission"))
			end,
		},
		[3] = {
			mission_key = "troy_mth_intro_hydra_early_game_mission",
			trigger_turn = 12,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_hydra_early_game_mission",
						"troy_mth_gen_myth_drinkers_venom,troy_mth_gen_myth_drinkers_venom,troy_mth_gen_myth_hydra_defenders,troy_mth_gen_myth_hydra_archers,troy_mth_gen_myth_hydra_archers,troy_mth_gen_myth_hydra_archers",
						"troy_main_borreas_sipte",
						550,
						609,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
									cm:add_unit_model_overrides(cm:char_lookup_str(character), "troy_warlord_maeonian_hero_4")
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_hydra_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_hydra_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_amazons_trj_penthesilea", "troy_main_borreas_sipte")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_hydra_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_hydra_priest")
	
				local cust_bundle_key = "effect_bundle_troy_mth_early_game_mission_myth_cap"
				local unit_cap_effect_bundle = cm:clone_or_create_custom_effect_bundle(faction:name(), cust_bundle_key)
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_mth_effect_unit_capacity_hydra_priest","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_hydra_priest", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_hydra_early_game_mission"))
			end,
		}
	},
	["troy_rem_trj_thrace"] = {
		[1] = {
			mission_key = "troy_mth_intro_shade_early_game_mission",
			trigger_turn = 5,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_shade_early_game_mission",
						"troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_bowmen_elysium_early_game_mission,troy_mth_gen_myth_bowmen_elysium_early_game_mission",
						"troy_main_edonis_aesyme",
						357,
						603,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
									cm:add_unit_model_overrides(cm:char_lookup_str(character), "troy_rem_defender_thracian_hero_2")
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_shade_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_shade_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_rem_trj_thrace", "troy_main_edonis_aesyme")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_shade_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_spears_elysium_mission_reward")
	
				--[[local unit_cap_effect_bundle = cm:create_new_custom_effect_bundle("effect_bundle_troy_mth_early_game_mission_myth_cap")
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_effect_unit_capacity_myth_centaurs_tier_2","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)]]
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_spears_elysium_mission_reward", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_shade_early_game_mission"))
				-- stoping the replenishment of the shade units. 
				cm:apply_effect_bundle("troy_mth_cerberus_block_replenishment_to_faction_HIDDEN", faction:name(), 0)
			end,
		},
		[2] = {
			mission_key = "troy_mth_intro_griffin_early_game_mission",
			trigger_turn = 9,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_griffin_early_game_mission",
						"troy_mth_gen_myth_arimaspoi_skirmishers,troy_mth_gen_myth_arimaspoi_skirmishers,troy_mth_gen_myth_arimaspoi_hunters,troy_mth_gen_myth_arimaspoi_hunters,troy_mth_gen_myth_arimaspoi_spearmen,troy_mth_gen_myth_arimaspoi_spearmen",
						"troy_main_thrace_abdera",
						296,
						623,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
									cm:add_unit_model_overrides(cm:char_lookup_str(character), "troy_rem_archer_thracian_hero_2")
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_griffin_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_griffin_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_rem_trj_thrace", "troy_main_thrace_abdera")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_griffin_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_lesser_griffin")
	
				local cust_bundle_key = "effect_bundle_troy_mth_early_game_mission_myth_cap"
				local unit_cap_effect_bundle = cm:clone_or_create_custom_effect_bundle(faction:name(), cust_bundle_key)
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_mth_effect_unit_capacity_lesser_griffin","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_lesser_griffin", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_griffin_early_game_mission"))
			end,
		},
		[3] = {
			mission_key = "troy_mth_intro_hydra_early_game_mission",
			trigger_turn = 12,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi

					local safe_x, safe_y = cm:find_valid_spawn_location_for_character_from_position(
						cm:get_local_faction_name(true),
						365,
						599,
						true
					)
	
					cm:create_force(
						"troy_mth_hydra_early_game_mission",
						"troy_mth_gen_myth_drinkers_venom,troy_mth_gen_myth_drinkers_venom,troy_mth_gen_myth_hydra_defenders,troy_mth_gen_myth_hydra_archers,troy_mth_gen_myth_hydra_archers,troy_mth_gen_myth_hydra_archers",
						"troy_main_edonis_aesyme",
						safe_x,
						safe_y,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
									cm:add_unit_model_overrides(cm:char_lookup_str(character), "troy_rem_fighter_thracian_hero_2")
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end
									
								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_hydra_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_hydra_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_rem_trj_thrace", "troy_main_bottiaea_therme")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_hydra_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_hydra_priest")
	
				local cust_bundle_key = "effect_bundle_troy_mth_early_game_mission_myth_cap"
				local unit_cap_effect_bundle = cm:clone_or_create_custom_effect_bundle(faction:name(), cust_bundle_key)
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_mth_effect_unit_capacity_hydra_priest","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_hydra_priest", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_hydra_early_game_mission"))
			end,
		}
	},
	["troy_rem_horde_aethiopians"] = {
		[1] = {
			mission_key = "troy_mth_intro_shade_early_game_mission",
			trigger_turn = 3,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_shade_early_game_mission",
						"troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_wretched_shades_early_game_mission,troy_mth_gen_myth_bowmen_elysium_early_game_mission,troy_mth_gen_myth_bowmen_elysium_early_game_mission",
						"troy_main_rhodes_lindos",
						727,
						176,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_shade_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_shade_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_rem_horde_aethiopians", "troy_main_rhodes_lindos")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_shade_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_spears_elysium_mission_reward")
	
				--[[local unit_cap_effect_bundle = cm:create_new_custom_effect_bundle("effect_bundle_troy_mth_early_game_mission_myth_cap")
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_effect_unit_capacity_myth_centaurs_tier_2","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)]]
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_spears_elysium_mission_reward", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_shade_early_game_mission"))
				-- stoping the replenishment of the shade units. 
				cm:apply_effect_bundle("troy_mth_cerberus_block_replenishment_to_faction_HIDDEN", faction:name(), 0)
			end,
		},
		[2] = {
			mission_key = "troy_mth_intro_griffin_early_game_mission",
			trigger_turn = 7,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_griffin_early_game_mission",
						"troy_mth_gen_myth_arimaspoi_skirmishers,troy_mth_gen_myth_arimaspoi_skirmishers,troy_mth_gen_myth_arimaspoi_hunters,troy_mth_gen_myth_arimaspoi_hunters,troy_mth_gen_myth_arimaspoi_spearmen,troy_mth_gen_myth_arimaspoi_spearmen",
						"troy_main_thrace_abdera",
						618,
						88,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_griffin_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_griffin_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_rem_horde_aethiopians", "troy_main_lasynthos_setaea")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_griffin_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_lesser_griffin")
	
				local cust_bundle_key = "effect_bundle_troy_mth_early_game_mission_myth_cap"
				local unit_cap_effect_bundle = cm:clone_or_create_custom_effect_bundle(faction:name(), cust_bundle_key)
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_mth_effect_unit_capacity_lesser_griffin","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_lesser_griffin", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_griffin_early_game_mission"))
			end,
		},
		[3] = {
			mission_key = "troy_mth_intro_hydra_early_game_mission",
			trigger_turn = 10,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi
	
					cm:create_force(
						"troy_mth_hydra_early_game_mission",
						"troy_mth_gen_myth_drinkers_venom,troy_mth_gen_myth_drinkers_venom,troy_mth_gen_myth_hydra_defenders,troy_mth_gen_myth_hydra_archers,troy_mth_gen_myth_hydra_archers,troy_mth_gen_myth_hydra_archers",
						"troy_main_lasynthos_lato",
						572,
						66,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end

								cm:force_declare_war(cm:get_local_faction_name(true), "troy_mth_hydra_early_game_mission", false , false, true)
								cm:force_diplomacy("all", "faction:".. "troy_mth_hydra_early_game_mission", "all", false, false, true, true)
							end 
						end,
						false
					)
					cm:make_region_visible_in_shroud("troy_rem_horde_aethiopians", "troy_main_lasynthos_lato")
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_mth_hydra_early_game_mission_reward; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_mth_gen_myth_hydra_priest")
	
				local cust_bundle_key = "effect_bundle_troy_mth_early_game_mission_myth_cap"
				local unit_cap_effect_bundle = cm:clone_or_create_custom_effect_bundle(faction:name(), cust_bundle_key)
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_mth_effect_unit_capacity_hydra_priest","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_mth_gen_myth_hydra_priest", unit_ammount, 0, 5, 0, 0, "", "", "")
				cm:kill_all_armies_for_faction(cm:get_faction("troy_mth_hydra_early_game_mission"))
			end,
		}
	},

	["any_faction"] = {

		-- example mission for any faction with only a turn number requirement
		-- and data generated via pre_construction_callback 
--[[
		[1] = {
			mission_key = "troy_mth_intro_shade_early_game_mission",
			trigger_turn = 2,
			pre_construction_callback = function(index)
				if index == 1 then 
					local loc_cqi

					cm:create_force(
						"troy_main_dan_corinthians",
						"troy_achaean_spearmen,troy_achaean_spearmen,troy_light_swordsmen,troy_achaean_stoneslingers",
						"troy_main_argolis_erchomenos",
						298,
						288,
						true,
						function(cqi)
							if cqi then 
								local character = cm:get_character_by_cqi(cqi)
								cm:disable_movement_for_character("character_cqi:" .. tostring(cqi))
								if character and not character:is_null_interface() then
									cm:set_force_has_retreated_this_turn(character)
								end
								if character:has_military_force() then 
									loc_cqi = character:military_force():command_queue_index()
								end
							end 
						end,
						false
					)
					return "cqi " .. loc_cqi end
				end,
			objective_and_conditions = {
				{
					objective = "ENGAGE_FORCE",
					conditions = {
						"requires_victory",
					},
				}
			},
			payloads = {
				"text_display { lookup dummy_troy_epic_missions_myth_unit_t2_savage_centaur_warriors; }",
			},
			success_callback = function() 
				local faction = cm:get_faction(cm:get_local_faction_name(true))
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, "troy_dlc1_myth_special_armoured_centaur_warriors")

				local unit_cap_effect_bundle = cm:clone_or_create_custom_effect_bundle(faction:name(),"effect_bundle_troy_mission_myth_cap")
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_effect_unit_capacity_myth_centaurs_tier_2","faction_to_faction_own_unseen",1)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)
				
				unit_ammount = unit_ammount + 1
				cm:add_unit_to_faction_mercenary_pool(faction, "troy_dlc1_myth_special_armoured_centaur_warriors", unit_ammount, 0, 5, 0, 0, "", "", "")
			end,
		}
	]]
	},

}
mythic_monster_missions.saved_data = {

 -- saves the mission key per faction for triggered missions.
 	saved_triggered_monster_missions = {
		--["troy_main_dan_mycenae"] = 
		--	"troy_mth_intro_shade_early_game_mission",
	},

-- saves any conditions per faction per mission if any are generated via a pre_construction_callback from a mission.
	saved_monster_mission_conditions = {
		--["troy_main_dan_mycenae"] = 
		--	["troy_mth_intro_shade_early_game_mission"] = {
		--		"1%cqi 317%",
		--},
	},
}



-- Script is triggered on faction turn start and on 
mythic_monster_missions.check_mission = function(checked_mission_data, faction, curr_turn) 
	if not is_table(checked_mission_data) then 
		script_error("ERROR: Tried to check missions for monster_mission, but the table is empty.")
		return 
	end
	if not is_faction(faction) then
		script_error("ERROR: invalid faction.")
		return
	end
	if not curr_turn or curr_turn < 0 then 
		script_error("ERROR: Invalid current turn.")
		return 
	end

	local pass_condition = true 

	if is_function(checked_mission_data.trigger_condition) then 
		pass_condition = checked_mission_data.trigger_condition() 
	end

	for faction_name, active_mission_key in pairs(mythic_monster_missions.saved_data.saved_triggered_monster_missions) do
		if faction_name == faction:name() then 
			for index, saved_mission_key in ipairs(active_mission_key) do 
				if saved_mission_key == checked_mission_data.mission_key then 
					return false
				end
			end
		end
	end
	
	if curr_turn >= checked_mission_data.trigger_turn and pass_condition then
		return checked_mission_data
	end
end

mythic_monster_missions.issue_monster_mission = function(faction_key, data, trigger)

	if not is_table(data) and not is_string(data) then
		script_error("MONSTER MISSIONS ERROR: mythic_monster_missions.issue_monster_mission called, but supplied data is INVALID!!!!")
		return 
	end

	if type(data) == "string" then 
		local found 

		if mythic_monster_missions.config[faction_key] then 
			for index, mission_data in ipairs(mythic_monster_missions.config[faction_key]) do
				if mission_data.mission_key == data then 
					if mythic_monster_missions.saved_data.saved_monster_mission_conditions[faction_key][data] then 
						mission_data.pre_construction_callback = mythic_monster_missions.saved_data.saved_monster_mission_conditions[faction_key][data]
					end
					data = mission_data
					found = true
					break
				end
			end
		end

		if not found then 
			for index, mission_data in ipairs(mythic_monster_missions.config.any_faction) do
				if mission_data.mission_key == data then 
					if mythic_monster_missions.saved_data.saved_monster_mission_conditions[faction_key][data] then 
						mission_data.pre_construction_callback = mythic_monster_missions.saved_data.saved_monster_mission_conditions[faction_key][data]
					end
					data = mission_data
					found = true
					break
				end
			end
		end

		if not found then 
			script_error("ERROR: Looking for mission with key "..data.." but no such mission is found in mythic_monster_missions.config")
			return
		end
	end


	local objectives_conditions = data.objective_and_conditions
	local payloads = data.payloads
	local conditon_added_upon_triggering
	local mission = mission_manager:new(faction_key, data.mission_key, data.success_callback)

	mission:set_mission_issuer(mythic_monster_missions.config.issuer)

	-- spawn objective
	for index, objective_condition in ipairs(objectives_conditions) do
		local objective = objective_condition.objective
		local conditions = objective_condition.conditions

		if is_function(data.pre_construction_callback) then 
			conditon_added_upon_triggering = data.pre_construction_callback(index)
			if conditon_added_upon_triggering then 
				table.insert(conditions, conditon_added_upon_triggering)
				mythic_monster_missions.saved_data.saved_monster_mission_conditions[faction_key] = mythic_monster_missions.saved_data.saved_monster_mission_conditions[faction_key] or {}
				mythic_monster_missions.saved_data.saved_monster_mission_conditions[faction_key][data.mission_key] = {}
				table.insert(mythic_monster_missions.saved_data.saved_monster_mission_conditions[faction_key][data.mission_key], index .. "%".. conditon_added_upon_triggering.."%")
			end

		elseif is_table(data.pre_construction_callback) then
			for _, saved_condition in ipairs(data.pre_construction_callback) do
				local str_index = tostring(index)
				local pointer = 1;
	
				-- index
				local next_separator = string.find(saved_condition, "%", pointer);
				
				if not next_separator then
					script_error("ERROR: intervention_state_from_string() called but supplied string is malformed: " .. str);
					return false;
				end;

				local svd_ind = string.sub(saved_condition, pointer, next_separator - 1);
				pointer = next_separator + 1;

				-- name 

				local next_separator = string.find(saved_condition, "%", pointer);
				
				if not next_separator then
					script_error("ERROR: intervention_state_from_string() called but supplied string is malformed: " .. str);
					return false;
				end;

				local savd_condition = string.sub(saved_condition, pointer, next_separator - 1);

				if str_index == svd_ind then 
					table.insert(conditions, savd_condition)
				end
			end
		end

		if objective ~= nil and objective ~= "SCRIPTED" then
			mission:add_new_objective(objective)

			for _, condition in ipairs(conditions) do
				mission:add_condition(condition)
			end
			
		elseif objective == "SCRIPTED" then 
			mission:add_new_scripted_objective(
				objective_condition.display_text or "", 
				objective_condition.event or "", 
				objective_condition.check, 
				script_key, 
				objective_condition.primary, 
				objective_condition.check_is_persistent or true
			)
		end

		local tbl_payloads = #objectives_conditions > 1 and payloads[index] or payloads
		if is_table(tbl_payloads) then
			for _, payload in ipairs(tbl_payloads) do
				mission:add_payload(payload)
			end
		end
	end

	if not mission.is_registered then 
		mission:register()
	end

	if trigger then 
		mission:trigger()
		core:trigger_event("ScriptEventMythicMonsterMissionTriggered", data.mission_key, objectives_conditions)
	end


	local mission_already_saved = false

	if not mythic_monster_missions.saved_data.saved_triggered_monster_missions[faction_key] then
		mythic_monster_missions.saved_data.saved_triggered_monster_missions[faction_key] = {}
		table.insert(mythic_monster_missions.saved_data.saved_triggered_monster_missions[faction_key], data.mission_key)
	else
		for _, saved_mission_key in ipairs(mythic_monster_missions.saved_data.saved_triggered_monster_missions[faction_key]) do
			if saved_mission_key == data.mission_key then
				mission_already_saved = true
			end
		end
		if not mission_already_saved then 
			table.insert(mythic_monster_missions.saved_data.saved_triggered_monster_missions[faction_key], data.mission_key)
		end
	end
end

mythic_monster_missions.register_listeners = function()
	core:add_listener(
		"troy_mth_monster_missions_faction_turn_start",
		"FactionTurnStart",
		function(context) return true end,
		function(context)
			local faction = context:faction()
			if faction:is_human() and not faction:is_dead() then 	
				local faction_name = faction:name()
				local missions_table = mythic_monster_missions.config[faction_name] or mythic_monster_missions.config.any_faction
				if missions_table then 
					for i, available_mission in ipairs(missions_table) do 
						local checked_mission = mythic_monster_missions.check_mission(available_mission, faction, cm:turn_number())
						if checked_mission then 
							mythic_monster_missions.issue_monster_mission(faction_name, checked_mission, true)
						end
					end
				end
			end
		end,
		true
	)
end

---------------------------- INIT
-- persist
cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("TROY_MTH_MONSTER_MISSION_SAVED_DATA", mythic_monster_missions.saved_data, context)
	end
)

cm:add_loading_game_callback(
	function(context)
		mythic_monster_missions.saved_data = cm:load_named_value("TROY_MTH_MONSTER_MISSION_SAVED_DATA", mythic_monster_missions.saved_data, context)
	end
) 

cm:add_pre_first_tick_callback(
	function()
		for faction_name, active_mission_key in pairs(mythic_monster_missions.saved_data.saved_triggered_monster_missions) do
			local faction = cm:get_faction(faction_name)
			if faction and faction:is_human() then
				for index, mission_key in ipairs(active_mission_key) do 
					mythic_monster_missions.issue_monster_mission(faction_name, mission_key, false)
				end
			end
		end
	end
)