out ("Loading phar_dynamic_building_effects.lua")

faction_effect_data = {
	tausret = {
		bundle_variables = {
			bundle_key = "phar_main_tausret_complete_building_set",
			effect_key = "phar_effect_economy_ers_trading_post_mod_all_resources",
			own_province_bundle_scope = "region_to_province_own_text_provincewide",
			adjacent_province_bundle_scope = "province_to_adjacent_province_own",
		},
		effect_variables = {
			complete_set_benchmark_level_1 = 3, 		--How many buildings you need to  complete a set.
			complete_set_benchmark_level_2 = 6,			--How many buildings you need to  complete a set.
			complete_set_benchmark_level_3 = 9 			--How many buildings you need to  complete a set.
		},
		building_set_data = {
			building_set = {
				"phar_main_tausret_resource_production_modifier_food",
				"phar_main_tausret_resource_production_modifier_gold",
				"phar_main_tausret_resource_production_modifier_stone_wood",
				"phar_main_tausret_resource_production_modifier_bronze"
			}
		},
		effect_values = {
			all_production_own_level_1 = 20,
			all_production_own_level_2 = 40,
			all_production_own_level_3 = 60,
			--all_production_adjacent_level_1 = 10,
			--all_production_adjacent_level_2 = 20
		}		
	},
	bay = {
		bundle_keys = {
			bay_bundle_key = "phar_main_bay_influence_buildings"
		},
		effect_variables = {
			non_aggression_pacts = 0,
			influence_per_non_aggression_pact = 2,
		}
	},
	trade_post_ers_seasons = {
		bundle_key = "phar_map_scripted_seasons_trade_post_bonus_resources",
		building_superchain_key = "phar_main_ers_trading_post",
		building_culture_list = {
			["phar_main_clt_kemet"] = "phar_main_ers_trading_post_level_1_egyp",
			["phar_main_clt_canaan"] = "phar_main_ers_trading_post_level_1_cana",
			["phar_main_clt_hatti"] = "phar_main_ers_trading_post_level_1_hitt",
			["phar_main_clt_sea_peoples"] = "phar_main_ers_trading_post_level_1_cana",
			["phar_map_clt_mesopotamian"] = "phar_main_ers_trading_post_level_1_meso",
			["troy_main_clt_danaans"] = "phar_main_ers_trading_post_level_1_aeg",
			["troy_main_clt_trojans"] = "phar_main_ers_trading_post_level_1_aeg",
			["troy_rem_clt_thraco_phrygians"] = "phar_main_ers_trading_post_level_1_aeg",
			["troy_rem_clt_hordes_aethiopians"] = "phar_main_ers_trading_post_level_1_aeg",
			["troy_ama_clt_hordes"] = "phar_main_ers_trading_post_level_1_aeg",
		},
	},
}

function add_building_effects_listeners()

	-----------------
	--- TAUSRET LISTENERS
	-----------------
	core:add_listener(
		"phar_tausret_building_set_data_complete", ----- Effect is applied if 3 out of the 4 buildings from building set table are in the same region.
		"BuildingCompleted",
		function(context)
			local building = context:building()
			local building_part_of_set
			
			if not building:is_null_interface() then  
				building_part_of_set = table_find(faction_effect_data.tausret.building_set_data.building_set,function(e) return e == building:chain() end)
			end 
			return building_part_of_set
		end,
		function(context)
			local curr_region = context:building():region()
			local curr_faction = curr_region:owning_faction():name()
			local province = curr_region:province()
			local building_name = context:building():name()
			local building_set_level = evaluate_for_building_set_level(province, building_name, curr_faction, false)
			local bundle

			if building_set_level == 1 then
				bundle = cm:create_new_custom_effect_bundle(faction_effect_data.tausret.bundle_variables.bundle_key)
				bundle:add_effect(faction_effect_data.tausret.bundle_variables.effect_key, faction_effect_data.tausret.bundle_variables.own_province_bundle_scope, faction_effect_data.tausret.effect_values.all_production_own_level_1)
				--bundle:add_effect(faction_effect_data.tausret.bundle_variables.effect_key, faction_effect_data.tausret.bundle_variables.adjacent_province_bundle_scope, faction_effect_data.tausret.effect_values.all_production_adjacent_level_1)
			elseif building_set_level == 2 then
				bundle = cm:create_new_custom_effect_bundle(faction_effect_data.tausret.bundle_variables.bundle_key)
				bundle:add_effect(faction_effect_data.tausret.bundle_variables.effect_key, faction_effect_data.tausret.bundle_variables.own_province_bundle_scope, faction_effect_data.tausret.effect_values.all_production_own_level_2)
				--bundle:add_effect(faction_effect_data.tausret.bundle_variables.effect_key, faction_effect_data.tausret.bundle_variables.adjacent_province_bundle_scope, faction_effect_data.tausret.effect_values.all_production_adjacent_level_2)
			elseif building_set_level == 3 then
				bundle = cm:create_new_custom_effect_bundle(faction_effect_data.tausret.bundle_variables.bundle_key)
				bundle:add_effect(faction_effect_data.tausret.bundle_variables.effect_key, faction_effect_data.tausret.bundle_variables.own_province_bundle_scope, faction_effect_data.tausret.effect_values.all_production_own_level_3)
			end

			if bundle then 
				bundle:set_duration(0)
				cm:apply_custom_effect_bundle_to_faction_province(bundle, curr_region)
			end
		end,
		true
	)

	core:add_listener(
		"phar_tausret_remove_building_set_bundle",
		"BuildingDemolished",
		function(context) 
			local building = context:building()
			local building_part_of_set
			if not building:is_null_interface() then  
				building_part_of_set = table_find(faction_effect_data.tausret.building_set_data.building_set,function(e) return e == building:chain() end)
			end 
			return building_part_of_set
		end,
		function(context)
			local curr_region = context:building():region()
			local curr_faction = curr_region:owning_faction():name()
			local province = curr_region:province()
			local building_name = context:building():name()
			local building_set_level = evaluate_for_building_set_level(province, building_name, curr_faction, true)

			if building_set_level == 0 then
				cm:remove_effect_bundle_from_faction_province(faction_effect_data.tausret.bundle_variables.bundle_key, curr_region)				
			elseif building_set_level == 1 then 
				bundle = cm:create_new_custom_effect_bundle(faction_effect_data.tausret.bundle_variables.bundle_key)
				bundle:add_effect(faction_effect_data.tausret.bundle_variables.effect_key, faction_effect_data.tausret.bundle_variables.own_province_bundle_scope, faction_effect_data.tausret.effect_values.all_production_own_level_1)
				--bundle:add_effect(faction_effect_data.tausret.bundle_variables.effect_key, faction_effect_data.tausret.bundle_variables.adjacent_province_bundle_scope, faction_effect_data.tausret.effect_values.all_production_adjacent_level_1)
				bundle:set_duration(0)
				cm:apply_custom_effect_bundle_to_faction_province(bundle, curr_region)
			elseif building_set_level == 2 then 
				bundle = cm:create_new_custom_effect_bundle(faction_effect_data.tausret.bundle_variables.bundle_key)
				bundle:add_effect(faction_effect_data.tausret.bundle_variables.effect_key, faction_effect_data.tausret.bundle_variables.own_province_bundle_scope, faction_effect_data.tausret.effect_values.all_production_own_level_2)
				--bundle:add_effect(faction_effect_data.tausret.bundle_variables.effect_key, faction_effect_data.tausret.bundle_variables.adjacent_province_bundle_scope, faction_effect_data.tausret.effect_values.all_production_adjacent_level_1)
				bundle:set_duration(0)
				cm:apply_custom_effect_bundle_to_faction_province(bundle, curr_region)
			end 
		end,
		true
	)

	-----------------
	--- BAY LISTENERS
	----------------- 
	core:add_listener(
		"phar_bay_building_influence",
		"BuildingCompleted",
		function(context) 
			return context:building():name() == "phar_main_bay_province_management_main_building_diplomatic_relations_1" 
		end,
		function(context)
--			update_influence_bay_building(context)
			faction_effect_data.bay.effect_variables.non_aggression_pacts = context:building():faction():factions_non_aggression_pact_with():num_items()
			local effect_value = faction_effect_data.bay.effect_variables.non_aggression_pacts * faction_effect_data.bay.effect_variables.influence_per_non_aggression_pact
			
			if effect_value <= 0 then 
				return 
			end

			local curr_faction = context:building():faction()
			local bundle = cm:create_new_custom_effect_bundle(faction_effect_data.bay.bundle_keys.bay_bundle_key)
			bundle:add_effect("phar_main_province_management_influence_building_adjacent", "province_to_adjacent_province_any", effect_value) 
	
			bundle:set_duration(0)
			cm:apply_custom_effect_bundle_to_region(bundle, context:building():region())
		end,
		true
	)

	core:add_listener(
		"phar_bay_proposer_non_agression_pact",
		"PositiveDiplomaticEvent",
		function(context)
			local curr_faction = context:character():faction()
			return context:is_non_aggression_pact() 
					and	curr_faction:name() == "phar_main_bay" 					
					and curr_faction:building_exists("phar_main_bay_province_management_main_building_diplomatic_relations_1")
		end,
		function(context)
			local update_influence = 1
			update_influence_bay_building(update_influence)
		end,
		true
	) 
	
	core:add_listener(
		"phar_bay_propose_break_non_agression",
		"NegativeDiplomaticEvent",
		function(context)
			local curr_faction = context:character():faction()
			return context:was_non_aggression_pact() 
					and	curr_faction:name() == "phar_main_bay" 					
					and curr_faction:building_exists("phar_main_bay_province_management_main_building_diplomatic_relations_1")
		end,
		function(context)
			local update_influence = -1
			update_influence_bay_building(update_influence)
		end,
		true
	)

	core:add_listener(
		"phar_bay_remove_influence_bundle",
		"BuildingDemolished",
		function(context) 
			return  context:building():name() == "phar_main_bay_province_management_main_building_diplomatic_relations_1" 
		end,
		function(context)
			local curr_region = context:building():region()
			cm:remove_effect_bundle_from_faction_province(faction_effect_data.tausret.bundle_variables.bundle_key, curr_region)	
		end,
		true
	)

	-----------------
	--- TRADE POST / ERS LISTENERS
	-----------------

	core:add_listener(
		"phar_map_trade_post_complete_seasons",
		"BuildingCompleted",
		function(context) 
			return context:building():superchain() == faction_effect_data.trade_post_ers_seasons.building_superchain_key 
					and cm:model():current_season_key() == "season_spring"
		end,
		function(context)
			cm:apply_effect_bundle_to_region(faction_effect_data.trade_post_ers_seasons.bundle_key, context:building():region():name(), 0)
		end,
		true
	)

	core:add_listener(
		"phar_map_trade_post_complete_seasons",
		"BuildingDemolished",
		function(context) 
			return context:building():superchain() == faction_effect_data.trade_post_ers_seasons.building_superchain_key 
			and cm:model():current_season_key() == "season_spring"
		end,
		function(context)
			cm:remove_effect_bundle_from_region(faction_effect_data.trade_post_ers_seasons.bundle_key, context:building():region():name())
		end,
		true
	)

	core:add_listener(
		"phar_map_spring_trade_post_effect_enable",
		"FactionTurnStart",
		function(context)
			return cm:model():current_season_key() == "season_spring"
		end,
		function(context)
			local curr_faction = context:faction()
			apply_trade_post_ressource_effect_bundle(curr_faction, true)
		end,
		true
	)

	core:add_listener(
		"phar_map_spring_trade_post_effect_disable",
		"FactionTurnStart",
		function(context)
			local curr_faction = context:faction()
			local faction_culture = curr_faction:culture()
			local building_key = faction_effect_data.trade_post_ers_seasons.building_culture_list[faction_culture]
			local season_key = cm:model():current_season_key()
			return curr_faction:building_exists(building_key) and season_key == "season_summer"
		end,
		function(context)
			local curr_faction = context:faction()
			apply_trade_post_ressource_effect_bundle(curr_faction, false)
		end,
		true
	)

	--------------------------
	-- Util functions
	--------------------------
	function apply_trade_post_ressource_effect_bundle(faction, in_season)
		local faction_culture = faction:culture()
		local building_key = faction_effect_data.trade_post_ers_seasons.building_culture_list[faction_culture]
		local region_list = faction:region_list()

		for i = 0, region_list:num_items() - 1 do
			local curr_region = region_list:item_at(i)
			if curr_region:building_exists(building_key) then 
				if in_season then 
					cm:apply_effect_bundle_to_region(faction_effect_data.trade_post_ers_seasons.bundle_key, curr_region:name(), 0)
				else
					if curr_region:has_effect_bundle(faction_effect_data.trade_post_ers_seasons.bundle_key) then
						cm:remove_effect_bundle_from_region(faction_effect_data.trade_post_ers_seasons.bundle_key, curr_region:name())
					end
				end
			end
		end
	end

	function evaluate_for_building_set_level(province, building_name, owning_faction, demolish)
		local region_list = province:regions()
		local set_counter = 0
		local building_set_level = 0
		local existing_set_buildings = {}

		-- Evaluate how many buildings of a set we have constructed
		for i = 0, region_list:num_items() - 1 do
			if region_list:item_at(i):owning_faction():name() == owning_faction then
				local slot_list = region_list:item_at(i):slot_list()
				for i = 0, slot_list:num_items() - 1 do					
					local building = slot_list:item_at(i):building()
					if not building:is_null_interface() then 
						if table_find(faction_effect_data.tausret.building_set_data.building_set,function(e) return e == building:chain() end)  then
							table.insert(existing_set_buildings, building:name())
						end
					end
				end
			end
		end

		-- Demolished buildings are not yet removed from region slots so we manually remove
		-- the current building from the evaluation.
		if demolish then
			local remove_index = -1 
			for i = 1, #existing_set_buildings do 
				if building_name == existing_set_buildings[i] then 
					remove_index = i
					break
				end
			end
			table.remove(existing_set_buildings, remove_index)
		end

		set_counter = #existing_set_buildings

		-- Return building set level according to config thresholds.
		if set_counter >= faction_effect_data.tausret.effect_variables.complete_set_benchmark_level_1 and 
						set_counter < faction_effect_data.tausret.effect_variables.complete_set_benchmark_level_2 then
			building_set_level = 1
		elseif set_counter >= faction_effect_data.tausret.effect_variables.complete_set_benchmark_level_2 then 
			building_set_level = 2
		else
			building_set_level = 0
		end
		return building_set_level
	end

	function update_influence_bay_building(increment_value)
		local curr_faction = cm:get_faction("phar_main_bay")

		faction_effect_data.bay.effect_variables.non_aggression_pacts = faction_effect_data.bay.effect_variables.non_aggression_pacts + increment_value 
		--faction_effect_data.bay.effect_variables.influence_per_non_agression_pact = curr_faction:factions_non_aggression_pact_with():num_items()

		if faction_effect_data.bay.effect_variables.non_aggression_pacts < 0 then 	
			faction_effect_data.bay.effect_variables.non_aggression_pacts = 0
		end

		local effect_value = faction_effect_data.bay.effect_variables.non_aggression_pacts * faction_effect_data.bay.effect_variables.influence_per_non_aggression_pact

		local region_list = curr_faction:region_list();
		for i = 0, region_list:num_items() - 1 do
			local curr_region = region_list:item_at(i)
			if curr_region:building_exists("phar_main_bay_province_management_main_building_diplomatic_relations_1") then 
				if effect_value > 0 then 
					local bundle = cm:create_new_custom_effect_bundle(faction_effect_data.bay.bundle_keys.bay_bundle_key)
					bundle:add_effect("phar_main_province_management_influence_building_adjacent", "province_to_adjacent_province_any", effect_value) 
			
					bundle:set_duration(0)
					cm:apply_custom_effect_bundle_to_region(bundle, curr_region)
				else
					if curr_region:has_effect_bundle(faction_effect_data.bay.bundle_keys.bay_bundle_key) then
						cm:remove_effect_bundle_from_region(faction_effect_data.bay.bundle_keys.bay_bundle_key, curr_region:name())
					end
				end
			end
		end



	end
end
--------------------------------------------------------------
--SAVING/LOADING
--------------------------------------------------------------

cm:add_first_tick_callback(
	function() 
		if not cm:is_multiplayer() then
			add_building_effects_listeners()
--			victory_conditions_start_new_game()
		end
	end
)