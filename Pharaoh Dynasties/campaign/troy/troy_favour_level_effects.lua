out("Loading troy_favour_level_effects.lua")

--Config

poseidon_food = 100
--Amount of Food, granted per turn by Poseidon's Tier 2 Favour effect

starting_turn_events = 15
--The first turn for negative events to fire
next_event_turns_min = 4
next_event_turns_max = 8
--How many turns to wait, before another negative event is fired
save_data_events = {}
--Used to save the next event turns and last event fired for each faction, necessary for multiplayer

negative_events = {
	["aphrodite"] = {
		["troy_main_incident_divine_will_bird_migration_aphrodite"] = {
			event_type = "incident_with_target_region",
			target = function(context)
				return select_random_owned_region(context)
			end,
			condition = function(context)
				return context:faction():is_allowed_to_capture_territory()
			end,
			name = ""
		},
		["troy_main_incident_lightning_storm_aphrodite"] = {
			event_type = "incident_with_target_region",
			target = function(context)
				return select_random_owned_region(context)
			end,
			condition = function(context)
				return context:faction():is_allowed_to_capture_territory()
			end,
			name = ""
		},
		["troy_main_incident_divorce_aphrodite"] = {
			event_type = "incident_with_target_character",
			target = function(context)
				return select_random_character(context)
			end,
			condition = function(context)
				local faction_name = context:faction():name()
				if faction_name ~= "troy_amazons_trj_hippolyta" and faction_name ~= "troy_amazons_trj_penthesilea" and faction_name ~= "troy_rem_horde_aethiopians" then
					return check_for_non_faction_leader(context)
				end
			end,			
			effect_bundle = "effect_bundle_troy_main_incident_divorce_aphrodite",
			duration = 4,
			name = ""
		}
	},
	["apollo"] = {
		["troy_main_incident_natural_urbran_fire"] = {
			event_type = "incident_with_target_region",
			target = function(context)
				return select_random_owned_region(context)
			end,
			condition = function(context)
				return context:faction():is_allowed_to_capture_territory()
			end,
			name = ""
		},
		["troy_main_dilemma_economy_dry_season"] = {
			event_type = "dilemma",
			target = true,
			condition = function(context)
				return context:faction():is_allowed_to_capture_territory()
			end,
			name = ""
		},
		["troy_main_incident_divine_will_bird_migration_apollo"] = {
			event_type = "incident_with_target_region",
			target = function(context)
				return select_random_owned_region(context)
			end,
			condition = function(context)
				return context:faction():is_allowed_to_capture_territory()
			end,
			name = ""
		},
		["troy_main_incident_lightning_storm_apollo"] = {
			event_type = "incident_with_target_region",
			target = function(context)
				return select_random_owned_region(context)
			end,
			condition = function(context)
				return context:faction():is_allowed_to_capture_territory()
			end,
			name = ""
		}
	},
	["ares"] = {
		["troy_main_dilemma_economy_roaming_bandits"] = {
			event_type = "dilemma_with_target_region",
			target = function(context)
				return select_random_owned_region(context)
			end,
			condition = function(context)
				return context:faction():is_allowed_to_capture_territory()
			end,
			name = ""
		},
		["troy_main_incident_lightning_storm_ares"] = {
			event_type = "incident_with_target_region",
			target = function(context)
				return select_military_building_for_event(context)
			end,
			condition = function(context)
				return check_for_owned_military_building(context)
			end,
			name = ""
		},
		["troy_main_incident_rebellious_army_ares"] = {
			event_type = "incident_with_target_character",
			target = function(context)
				return select_random_character(context)
			end,
			condition = function(context)
				local faction_name = context:faction():name()
				if faction_name ~= "troy_amazons_trj_hippolyta" and faction_name ~= "troy_amazons_trj_penthesilea" and faction_name ~= "troy_rem_horde_aethiopians" then
					return check_for_non_faction_leader(context)
				end
			end,
			effect_bundle = "effect_bundle_troy_main_incident_rebellious_army_ares",
			duration = 4,
			name = ""
		}
	},
	["athena"] = {
		["troy_main_incident_divine_will_bird_migration_athena"] = {
			event_type = "incident_with_target_region",
			target = function(context)
				return select_military_building_for_event(context)
			end,
			condition = function(context)
				return check_for_owned_military_building(context)
			end,
			name = ""
		},
		["troy_main_incident_madness_athena"] = {
			event_type = "incident_with_target_character",
			target = function(context)
				return select_random_character(context)
			end,
			condition = function(context)
				local faction_name = context:faction():name()
				if faction_name ~= "troy_amazons_trj_hippolyta" and faction_name ~= "troy_amazons_trj_penthesilea" and faction_name ~= "troy_rem_horde_aethiopians" then
					return check_for_non_faction_leader(context)
				end
			end,
			name = ""
		}
	},
	["hera"] = {
		["troy_main_dilemma_economy_crop_disease"] = {
			event_type = "dilemma_with_target_region",
			target = function(context)
				return select_food_region_for_event(context)
			end,
			condition = function(context)
				return check_for_owned_food_region(context)
			end,
			name = ""
		},
		["troy_main_incident_lightning_storm_hera"] = {
			event_type = "incident_with_target_region",
			target = function(context)
				return select_random_owned_region(context)
			end,
			condition = function(context)
				return context:faction():is_allowed_to_capture_territory()
			end,
			name = ""
		}
	},
	["poseidon"] = {
		["troy_main_incident_natural_flood"] = {
			event_type = "incident_with_target_region",
			target = function(context)
				return select_port_for_event(context)
			end,
			condition = function(context)
				return check_for_owned_port(context)
			end,
			name = ""
		},
		["troy_main_incident_natural_high_waves"] = {
			event_type = "incident_with_target_region",
			target = function(context)
				return select_port_for_event(context)
			end,
			condition = function(context)
				return check_for_owned_port(context)
			end,
			name = ""
		},
		["troy_main_incident_natural_sea_storm"] = {
			event_type = "incident_with_target_region",
			target = function(context)
				return select_port_for_event(context)
			end,
			condition = function(context)
				return check_for_owned_port(context)
			end,
			name = ""
		},
		["troy_main_incident_natural_earthquake"] = {
			event_type = "incident_with_target_region",
			target = function(context)
				return select_random_owned_region(context)
			end,
			condition = function(context)
				return context:faction():is_allowed_to_capture_territory()
			end,
			name = ""
		},
		["troy_main_incident_divine_will_bird_migration_poseidon"] = {
			event_type = "incident_with_target_region",
			target = function(context)
				return select_port_for_event(context)
			end,
			condition = function(context)
				return check_for_owned_port(context)
			end,
			name = ""
		}
	},
	["zeus"] = {
		["troy_main_incident_natural_maelstrom"] = {
			event_type = "incident_with_target_region",
			target = function(context)
				return select_port_for_event(context)
			end,
			condition = function(context)
				return check_for_owned_port(context)
			end,
			name = ""
		},
		["troy_main_incident_natural_volcanic_erruption"] = {
			event_type = "incident_with_target_region",
			target = function(context)
				local conditon_regions = {
					["troy_main_cyclades_ios"] = true,
					["troy_main_melamphylos_kos"] = true,
					["troy_main_syrmata_melos"] = true
				}
				for reg, _ in pairs(conditon_regions) do
					local region = cm:get_region(reg)
					if region:owning_faction():name() == context:faction():name() then
						return region:command_queue_index()
					end
				end
			end,
			condition = function(context)
				local conditon_regions = {
					["troy_main_cyclades_ios"] = true,
					["troy_main_melamphylos_kos"] = true,
					["troy_main_syrmata_melos"] = true
				}
				for reg,_ in pairs(conditon_regions) do
					if cm:get_region(reg) and cm:get_region(reg):owning_faction():name() == context:faction():name() then
						return true
					end
				end
			end,
			name = ""
		}
	},
	["hephaestus"] = {
		["troy_adi_incident_divine_will_ash_cloud_hephaestus"] = {
			event_type = "incident_with_target_region",
			production_types = {"troy_main_settlement_bronze", "troy_main_settlement_gold"},
			target = function(context)
				local regions = get_specific_event_regions(context, false, negative_events["hephaestus"]["troy_adi_incident_divine_will_ash_cloud_hephaestus"].production_types)
				return regions[cm:model():random_int(1, #regions)]
			end,
			condition = function(context) return #get_specific_event_regions(context, true, negative_events["hephaestus"]["troy_adi_incident_divine_will_ash_cloud_hephaestus"].production_types) > 0 end,
			name = ""
		},
	}
}

-- traits from Zeus tier level effects 
zeus_traits = {
	["main_troy"] = {
		agent = "troy_trait_zeus_trait",
		general = "troy_trait_zeus_hero_not_archer",
		archer_general = "troy_trait_zeus_hero_archer",
	},
	["troy_historical"] = {
		agent = "troy_hist_trait_zeus_trait",
		general = "troy_hist_trait_zeus_hero_not_archer_1",
		archer_general = "troy_hist_trait_zeus_hero_archer_1",
	},
	["troy_mythic"] = {
		agent = "troy_trait_zeus_trait",
		general = "troy_trait_zeus_hero_not_archer",
		archer_general = "troy_trait_zeus_hero_archer",
	},
}
--End of Config

function select_port_for_event(context)
	local faction = context:faction()
	if not faction:is_allowed_to_capture_territory() then
		return false
	end
	local region_list = faction:region_list()
	local port_regions = {}
	for i = 0, region_list:num_items() - 1 do
		local region = region_list:item_at(i)
		if region:settlement():is_port() then
			table.insert(port_regions, region:command_queue_index())
		end
	end
	local random_number = cm:model():random_int(1, #port_regions)
	return port_regions[random_number]
end

function check_for_owned_port(context)
	local faction = context:faction()
	if not faction:is_allowed_to_capture_territory() then
		return false
	end
	local region_list = faction:region_list()
	for i = 0, region_list:num_items() - 1 do
		local region = region_list:item_at(i)
		if region:settlement():is_port() then
			return true
		end
	end
	return false
end

function select_military_building_for_event(context)
	local faction = context:faction()
	if not faction:is_allowed_to_capture_territory() then
		return false
	end
	local region_list = faction:region_list()
	local military_regions = {}
	for i = 0, region_list:num_items() - 1 do
		local building_list = region_list:item_at(i):settlement():building_list()
		for j = 0, building_list:num_items() -1 do
			for k,v in pairs(military_chains) do
				if building_list:item_at(j):chain(v) then
					table.insert(military_regions,  region_list:item_at(i):command_queue_index())
				end
			end
		end
	end
	local random_number = cm:model():random_int(1, #military_regions)
	return military_regions[random_number]
end

function check_for_owned_military_building(context)
	local faction = context:faction()
	if not faction:is_allowed_to_capture_territory() then
		return false
	end
	local region_list = faction:region_list()
	for i = 0, region_list:num_items() - 1 do
		local building_list = region_list:item_at(i):settlement():building_list()
		for j = 0, building_list:num_items() -1 do
			for k,v in pairs(military_chains) do
				if building_list:item_at(j):chain(v) then
					return true
				end
			end
		end
	end
	return false
end

function select_food_region_for_event(context)
	local faction = context:faction()
	if not faction:is_allowed_to_capture_territory() then
		return false
	end
	local region_list = faction:region_list()
	local food_regions = {}
	for i = 0, region_list:num_items() - 1 do
		local region = region_list:item_at(i)
		if region:settlement():production_type() == "troy_main_settlement_farm" then
			table.insert(food_regions, region:command_queue_index())
		end
	end
	local random_number = cm:model():random_int(1, #food_regions)
	return food_regions[random_number]
end

function check_for_owned_food_region(context)
	local faction = context:faction()
	if not faction:is_allowed_to_capture_territory() then
		return false
	end
	local region_list = faction:region_list()
	for i = 0, region_list:num_items() - 1 do
		if region_list:item_at(i):settlement():production_type() == "troy_main_settlement_farm" then				
			return true
		end
	end
	return false
end

function select_random_owned_region(context)
	local faction = context:faction()
	if not faction:is_allowed_to_capture_territory() then
		return false
	end
	local region_list = faction:region_list()
	local region_table = {}
	for i = 0, region_list:num_items() - 1 do
		table.insert(region_table, region_list:item_at(i):command_queue_index())
	end
	local random_number = cm:model():random_int(1, #region_table)
	return region_table[random_number]
end

function check_for_non_faction_leader(context)
	local faction = context:faction()
	local character_list = faction:character_list()
	local num_characters = character_list:num_items()
	if num_characters == 0 then
		return false
	end
	for i = 0, num_characters - 1 do
		local char = character_list:item_at(i)
		-- we don't select Rhesus' countless host generals for this.
		if cm:char_is_mobile_general_with_army(char) and (not char:is_faction_leader()) and not countless_host.is_host_general(char) then				
			return true
		end
	end
	return false
end

function select_random_character(context)
	local faction = context:faction()
	local character_list = faction:character_list()
	local character_table = {}
	local num_characters = character_list:num_items()
	if num_characters == 0 then
		return false
	end
	for i = 0, num_characters - 1 do
		local char = character_list:item_at(i)
		-- we don't select Rhesus' countless host generals for this.
		if cm:char_is_mobile_general_with_army(char) and (not char:is_faction_leader()) and not countless_host.is_host_general(char) then
			table.insert(character_table, char:command_queue_index())
		end
	end
	local random_number = cm:model():random_int(1, #character_table)
	return character_table[random_number]
end

-- check_at_least_once is a bool variable and production_types should be provided in table format
function get_specific_event_regions(context, check_at_least_one, production_types)
	local faction = context:faction()
	local region_list = faction:region_list()
	local desired_regions = {}
	if is_table(production_types) then 
		for i = 0, region_list:num_items() - 1 do
			local region = region_list:item_at(i)
			if table_contains(production_types, region:settlement():production_type()) then
				table.insert(desired_regions, region:command_queue_index())
				if check_at_least_one then
					break
				end
			end
		end
	else
		script_error("PROVIDED "..production_types.. " is not table. Please provide the production type in table format")
	end
	return desired_regions
end

function add_favour_level_listeners()
	out("Listener for Favour level scripted effects started")

	core:add_listener(
		"Troy_fire_first_negative_event_divine_will",
		"FactionTurnStart",
		function (context)
			local faction = context:faction()
			if save_data_events["next_event_turns_current" .. faction:name()] ~= nil then
				return cm:model():turn_number() == (starting_turn_events + save_data_events["next_event_turns_current" .. faction:name()]) and faction:is_human()
			else
				return cm:model():turn_number() == starting_turn_events and faction:is_human()
			end
		end,
		function (context)
			local gods = cm:model():world():god_manager():gods()
			local faction = context:faction()
			local applicable_event_list = {}
			-- add events for all gods who are not Respected
			for i = 0, gods:num_items() - 1 do
				local god_name = gods:item_at(i):name()
				if faction:attitude_tier_for_god(god_name) == 0 then
					if is_table(negative_events[god_name]) then 
						for k,v in pairs(negative_events[god_name]) do
							if k ~= save_data_events["last_event_fired" .. faction:name()] then
								if not v.condition or v.condition(context) then
								-- check for events with targets
									table.insert(applicable_event_list, v)
									applicable_event_list[#applicable_event_list].name = k
								end
							end
						end
					end
				end
			end
			-- if no events have been added, since all gods are Respected, then ALL events are added
			if next(applicable_event_list) == nil then
				for i = 0, gods:num_items() - 1 do
					local god_name = gods:item_at(i):name()
					if is_table(negative_events[god_name]) then 
						for k,v in pairs(negative_events[god_name]) do
							if k ~= save_data_events["last_event_fired" .. faction:name()] then
								if v.condition(context) then
								-- check for events with targets
									table.insert(applicable_event_list, v)
									applicable_event_list[#applicable_event_list].name = k
								end
							end
						end
					end
				end
			end
			-- select an event at random and fire it
			if #applicable_event_list == 0 then
				return
			end
			local rand = applicable_event_list[cm:model():random_int(1, #applicable_event_list)]
			if save_data_events["last_event_fired" .. faction:name()] == nil then
				save_data_events["last_event_fired" .. faction:name()] = rand.name
			elseif save_data_events["last_event_fired" .. faction:name()] ~= rand.name then
				save_data_events["last_event_fired" .. faction:name()] = rand.name
			end
			if save_data_events["next_event_turns_current" .. faction:name()] ~= nil then
				save_data_events["next_event_turns_current" .. faction:name()] = save_data_events["next_event_turns_current" .. faction:name()] + cm:model():random_int(next_event_turns_min, next_event_turns_max)
			else
				save_data_events["next_event_turns_current" .. faction:name()] = cm:model():random_int(next_event_turns_min, next_event_turns_max)
			end
			if rand.event_type == "incident" then
				cm:trigger_incident(faction:name(), rand.name, true)
			elseif rand.event_type == "incident_with_target_region" then
				local target = rand.target(context)
				if target then -- it is possible that the faction doesn't have any regions which will lead to a crash
					cm:trigger_incident_with_targets(faction:command_queue_index(), rand.name, 0, 0, 0, 0, target, 0)
				end
			elseif rand.event_type == "incident_with_target_character" then
				local target = rand.target(context)
				if target then
					if rand.effect_bundle ~= nil then
						cm:apply_effect_bundle_to_character(rand.effect_bundle, target, rand.duration)
					end
					cm:trigger_incident_with_targets(faction:command_queue_index(), rand.name, 0, 0, target, 0, 0, 0)
				end
			elseif rand.event_type == "dilemma" then
				cm:trigger_dilemma(faction:name(), rand.name)
			elseif rand.event_type == "dilemma_with_target_region" then
				local target = rand.target(context)
				if target then
					cm:trigger_dilemma_with_targets_raw(faction:command_queue_index(), rand.name, 0, 0, 0, 0, target, 0, false, 0)
				end
			end
			return
		end,
		true
	)

	core:add_listener(
		"Troy_add_zeus_trait_agents",
		"CharacterCreated",
		function (context)
			local character = context:character()
			return character:faction():attitude_tier_for_god("zeus") >= 2 and character:has_region()
		end,
		function (context)
			local char = context:character()
			local faction_name = char:faction():name()
			local cqi = char:family_member():command_queue_index()
			for i = 1, #zeus_traits_existing_chars do
				if cqi == zeus_traits_existing_chars[i] then
					return					
				end
			end
			local curr_campaign = cm:get_campaign_name()
			if 	char:character_subtype("troy_agent_envoy") or 
				char:character_subtype("troy_agent_priest") or 
				char:character_subtype("troy_agent_spy") 
			then
				grant_trait(char, zeus_traits[curr_campaign].agent)
				table.insert(zeus_traits_existing_chars, cqi)
			elseif char:character_type("general") and 
					(char:character_subtype("troy_archer_skirmisher") or char:character_subtype("troy_archer_trickster")) 
			then
				grant_trait(char, zeus_traits[curr_campaign].archer_general)
				table.insert(zeus_traits_existing_chars, cqi)
			elseif char:character_type("general")
			then
				grant_trait(char, zeus_traits[curr_campaign].general)
				table.insert(zeus_traits_existing_chars, cqi)
			end
		end,
		true
	)
	
	core:add_listener (
		"Troy_favour_level_change_scripted_effects",
		"FactionGodAttitudeTierChange",
		true,
		apply_scripted_effects,
		true
	)

	core:add_listener (
		"Troy_apollo_line_of_sight_temple_activate",
		"FactionInitiatesPrayer",
		function (context)
			return context:god():name() == "apollo" and context:faction():is_allowed_to_capture_territory()
		end,
		function (context)
			local region_list = context:faction():region_list()
			local tier = context:tier()
			for i = 0, region_list:num_items() - 1 do
				for k,v in pairs(apollo_temples) do
					if region_list:item_at(i):building_exists(v) then
						cm:apply_effect_bundle_to_region(apollo_prayer_bundles[tier].line_of_sight_bundle,region_list:item_at(i):name(),4)
					end
				end
			end
		end,
		true
	)

	core:add_listener (
		"Troy_apollo_line_of_sight_temple_destroyed",
		"BuildingDemolished",
		function (context)
			local faction = context:building():faction()
			if not faction:is_allowed_to_capture_territory() then
				return false
			end
			local building = context:building()
			for k,v in pairs(apollo_prayer_bundles) do
				if faction:has_effect_bundle(v.prayer_level) then
					return building:chain() == "troy_main_religion_apollo"
				end
			end
		end,
		function (context)
			local faction = context:building():faction()
			for k,v in pairs(apollo_prayer_bundles) do
				if faction:has_effect_bundle(v.prayer_level) then
					cm:remove_effect_bundle_from_region(v.line_of_sight_bundle,context:building():region():name())
				end
			end
		end,
		true
	)

	core:add_listener (
		"Troy_apollo_line_of_sight_temple_built",
		"BuildingCompleted",
		function (context)
			local faction = context:building():faction()
			if not faction:is_allowed_to_capture_territory() then
				return false
			end
			local building = context:building()
			for k,v in pairs(apollo_prayer_bundles) do
				if faction:has_effect_bundle(v.prayer_level) then
					return building:name() == "troy_main_religion_apollo_2"
				end
			end
		end,
		function (context)
			local faction = context:building():faction()
			for k,v in pairs(apollo_prayer_bundles) do
				if faction:has_effect_bundle(v.prayer_level) then
					local duration = context:building():faction():get_effect_bundle(v.prayer_level):duration()
					cm:apply_effect_bundle_to_region(v.line_of_sight_bundle,context:building():region():name(),duration)
				end
			end
		end,
		true
	)

	core:add_listener (
		"Troy_apollo_line_of_sight_temple_captured",
		"RegionFactionChangeEvent",
		function (context)
			local curr_faction = context:region():owning_faction()
			local prev_faction = context:previous_faction()
			for k,v in pairs(apollo_prayer_bundles) do
				if prev_faction:has_effect_bundle(v.prayer_level) and not curr_faction:has_effect_bundle(v.prayer_level) then
					for k,v in pairs(apollo_temples) do
						if context:region():building_exists(v) then
							return true
						else
							return false
						end
					end
				end
			end
		end,
		function (context)
			local curr_faction = context:region():owning_faction()
			for k,v in pairs(apollo_prayer_bundles) do
				cm:remove_effect_bundle_from_region(v.line_of_sight_bundle,context:region():name())
				if curr_faction:has_effect_bundle(v.prayer_level) and curr_faction:is_allowed_to_capture_territory() then
					local duration = context:building():faction():get_effect_bundle(v.prayer_level):duration()
					cm:apply_effect_bundle_to_region(v.line_of_sight_bundle,context:building():region():name(),duration)
				end
			end
		end,
		true
	)
--[[
	core:add_listener (
		"Troy_spawn_myth_units",
		"FactionInitiatesPrayer",
		function (context)
			return gods_with_myth_units[context:god():name()] and gods_with_myth_units[context:god():name()].myth_unit and true or false
		end,
		function (context)
			local unit = gods_with_myth_units[context:god():name()].myth_unit
			local tier = context:tier()
			local tier_amount = gods_with_myth_units[context:god():name()].units_per_tier[tier]
			cm:add_unit_to_faction_mercenary_pool(context:faction(),unit,tier_amount,0,10,0,0,"","","")
		end,
		true
	) ]]

	core:add_listener (
		"Troy_ares_prayer_bundle",
		"FactionInitiatesPrayer",
		function (context)
			return context:god():name() == "ares"
		end,
		function (context)
			local bundle = cm:create_new_custom_effect_bundle("effect_bundle_gods_prayer_ares_for_heroes")
			bundle:set_duration(4)
			local bundle_effects = bundle:effects()
			for i=0,bundle_effects:num_items()-1 do
				bundle:set_effect_value(bundle_effects:item_at(i), (-5 - (5*context:tier())))
			end
			local char_list = context:faction():character_list()
			for i=0, char_list:num_items() - 1 do
				local char = char_list:item_at(i)
				if not countless_host.is_host_general(char)
						and (char:character_type("general") or char:character_type("colonel"))
				then
					cm:apply_custom_effect_bundle_to_character(bundle,char)
				end
			end
		end,
		true
	)

	core:add_listener (
		"Troy_ares_prayer_bundle_new_character",
		"CharacterCreated",
		function (context)
			local char = context:character()
			local faction = context:character():faction()
			if char:character_type("general") or char:character_type("colonel") then
				for k,v in pairs(ares_prayer_bundles) do
					if faction:has_effect_bundle(k) then
						return true
					end
				end
			end
		end,
		function (context)
			local bundle = cm:create_new_custom_effect_bundle("effect_bundle_gods_prayer_ares_for_heroes")
			local faction = context:character():faction()
			for k,v in pairs(ares_prayer_bundles) do
				if faction:has_effect_bundle(v) then
					bundle:set_duration(faction:get_effect_bundle(v):duration())
					local bundle_effects = bundle:effects()
					for i=0,bundle_effects:num_items()-1 do
						bundle:set_effect_value(bundle_effects:item_at(i), ares_prayer_bundles[faction:get_effect_bundle(k)].value)
					end
				end
			end
			cm:apply_custom_effect_bundle_to_character(bundle,context:character())
		end,
		true
	)

	--core:add_listener(
	--"Troy_zeus_destiny_bundle_updater",
	--"FactionTurnStart",
	--true,
	--update_knowing_destiny_bundle,
	--true
	--)

  --[[   core:add_listener(
	"Troy_zeus_negative_tier_2_favour_drop",
	"FactionTurnStart",
	function(context) return check_zeus_favour(context:faction()) end,
	function(context) drop_random_favour(context:faction()) end,
	true
	) ]]

end

gods_with_myth_units = {
	["ares"] = {
		myth_unit = {
			["main_troy"] = "troy_myth_spartoi",
			["troy_mythic"] = "troy_mth_gen_myth_spartoi"
		},
		units_per_tier = {
			[0] = 0,
			[1] = 0,
			[2] = 0,
			[3] = 1
	 	}
	},
	["hera"] = {
		myth_unit = {
			["main_troy"] = "troy_myth_corybantes",
			["troy_mythic"] = "troy_mth_gen_myth_corybantes"
		},
		units_per_tier = {
			[0] = 0,
			[1] = 0,
			[2] = 0,
			[3] = 1
	 	}
	},
	["zeus"] = {
		myth_unit = {
			["main_troy"] = "troy_myth_minotaur",
			["troy_mythic"] = "troy_mth_gen_myth_minotaur"
		},
		units_per_tier = {
			[0] = 0,
			[1] = 0,
			[2] = 0,
			[3] = 1
	 	}
	},
	["poseidon"] = {
		myth_unit = {
			["main_troy"] = "troy_myth_cyclops",
			["troy_mythic"] = "troy_mth_gen_myth_cyclops"
		},
		units_per_tier = {
			[0] = 0,
			[1] = 0,
			[2] = 0,
			[3] = 1
	 	}
	},
}

apollo_temples = {
	"troy_main_religion_apollo_2",
	"troy_main_religion_apollo_3",
	"troy_main_religion_apollo_4"
}

apollo_prayer_bundles = {
	[0] = {
		prayer_level = "effect_bundle_gods_prayer_apollo_0",
		line_of_sight_bundle = "effect_bundle_apollo_line_of_sight_0"
	},
	[1] = {
		prayer_level = "effect_bundle_gods_prayer_apollo_1",
		line_of_sight_bundle = "effect_bundle_apollo_line_of_sight_1"
	},
	[2] = {
		prayer_level = "effect_bundle_gods_prayer_apollo_2",
		line_of_sight_bundle = "effect_bundle_apollo_line_of_sight_2"
	},
	[3] = {
		prayer_level = "effect_bundle_gods_prayer_apollo_3",
		line_of_sight_bundle = "effect_bundle_apollo_line_of_sight_3"
	}
}

ares_prayer_bundles = {
	["effect_bundle_gods_prayer_ares_0"] = { value = -5 },
	["effect_bundle_gods_prayer_ares_1"] = { value = -10 },
	["effect_bundle_gods_prayer_ares_2"] = { value = -15 },
	["effect_bundle_gods_prayer_ares_3"] = { value = -20 },
}

coastal_buildings = {
	"troy_main_ody_settlement_bronze_sea_1",
	"troy_main_ody_settlement_bronze_sea_2",
	"troy_main_ody_settlement_bronze_sea_3",
	"troy_main_ody_settlement_bronze_sea_ruin",
	"troy_main_ody_settlement_farm_sea_1",
	"troy_main_ody_settlement_farm_sea_2",
	"troy_main_ody_settlement_farm_sea_3",
	"troy_main_ody_settlement_farm_sea_ruin",
	"troy_main_ody_settlement_forest_sea_1",
	"troy_main_ody_settlement_forest_sea_2",
	"troy_main_ody_settlement_forest_sea_3",
	"troy_main_ody_settlement_forest_sea_ruin",
	"troy_main_ody_settlement_gold_sea_1",
	"troy_main_ody_settlement_gold_sea_2",
	"troy_main_ody_settlement_gold_sea_3",
	"troy_main_ody_settlement_gold_sea_ruin",
	"troy_main_ody_settlement_major_sea_1",
	"troy_main_ody_settlement_major_sea_2",
	"troy_main_ody_settlement_major_sea_3",
	"troy_main_ody_settlement_major_sea_4",
	"troy_main_ody_settlement_major_sea_5",
	"troy_main_ody_settlement_major_sea_ruin",
	"troy_main_ody_settlement_stone_sea_1",
	"troy_main_ody_settlement_stone_sea_2",
	"troy_main_ody_settlement_stone_sea_3",
	"troy_main_ody_settlement_stone_sea_ruin",
	"troy_main_settlement_bronze_sea_1",
	"troy_main_settlement_bronze_sea_2",
	"troy_main_settlement_bronze_sea_3",
	"troy_main_settlement_bronze_sea_ruin",
	"troy_main_settlement_farm_sea_1",
	"troy_main_settlement_farm_sea_2",
	"troy_main_settlement_farm_sea_3",
	"troy_main_settlement_farm_sea_ruin",
	"troy_main_settlement_forest_sea_1",
	"troy_main_settlement_forest_sea_2",
	"troy_main_settlement_forest_sea_3",
	"troy_main_settlement_forest_sea_ruin",
	"troy_main_settlement_gold_sea_1",
	"troy_main_settlement_gold_sea_2",
	"troy_main_settlement_gold_sea_3",
	"troy_main_settlement_gold_sea_ruin",
	"troy_main_settlement_major_sea_1",
	"troy_main_settlement_major_sea_2",
	"troy_main_settlement_major_sea_3",
	"troy_main_settlement_major_sea_4",
	"troy_main_settlement_major_sea_5",
	"troy_main_settlement_major_sea_ruin",
	"troy_main_settlement_stone_sea_1",
	"troy_main_settlement_stone_sea_2",
	"troy_main_settlement_stone_sea_3",
	"troy_main_settlement_stone_sea_ruin",
	"troy_main_trj_settlement_bronze_sea_1",
	"troy_main_trj_settlement_bronze_sea_2",
	"troy_main_trj_settlement_bronze_sea_3",
	"troy_main_trj_settlement_bronze_sea_ruin",
	"troy_main_trj_settlement_farm_sea_1",
	"troy_main_trj_settlement_farm_sea_2",
	"troy_main_trj_settlement_farm_sea_3",
	"troy_main_trj_settlement_farm_sea_ruin",
	"troy_main_trj_settlement_forest_sea_1",
	"troy_main_trj_settlement_forest_sea_2",
	"troy_main_trj_settlement_forest_sea_3",
	"troy_main_trj_settlement_forest_sea_ruin",
	"troy_main_trj_settlement_gold_sea_1",
	"troy_main_trj_settlement_gold_sea_2",
	"troy_main_trj_settlement_gold_sea_3",
	"troy_main_trj_settlement_gold_sea_ruin",
	"troy_main_trj_settlement_major_sea_1",
	"troy_main_trj_settlement_major_sea_2",
	"troy_main_trj_settlement_major_sea_3",
	"troy_main_trj_settlement_major_sea_4",
	"troy_main_trj_settlement_major_sea_5",
	"troy_main_trj_settlement_stone_sea_1",
	"troy_main_trj_settlement_stone_sea_2",
	"troy_main_trj_settlement_stone_sea_3",
	"troy_main_trj_settlement_stone_sea_ruin"
}

military_chains = {
	"troy_amazons_special_hippolyta_cavalry",
	"troy_amazons_special_hippolyta_chariot",
	"troy_amazons_special_hippolyta_military",
	"troy_amazons_special_hippolyta_missile",
	"troy_main_military_chariot",
	"troy_main_aeneas_military",
	"troy_main_military",
	"troy_main_ody_military",
	"troy_main_paris_military",
	"troy_main_sarpedon_military",
	"troy_main_aeneas_military_elite",
	"troy_main_military_elite",
	"troy_main_ody_military_elite",
	"troy_main_hector_missile",
	"troy_main_paris_sarpedon_missile",
	"troy_main_military_myth_centaurs",
	"troy_main_military_myth_giants",
	"troy_main_military_myth_harpies",
	"troy_main_military_myth_sirens",
	"troy_main_special_achilles_military_myrmidon"
	}

function apply_scripted_effects(context)
	-- Initial data for checking
	local new_tier = context:new_tier()
	local old_tier = context:old_tier()
	local faction = context:faction()
	local faction_name = faction:name()
	local god = context:god():name()
	local campaign_name = cm:get_campaign_name()

	-- Mythological units, not relevant in Historical campaign
	if not (campaign_name == "troy_historical") and gods_with_myth_units[god] and gods_with_myth_units[god].myth_unit[campaign_name] then
		local unit = gods_with_myth_units[god].myth_unit[campaign_name]
		local tier_amount = gods_with_myth_units[god].units_per_tier[new_tier]
		cm:add_unit_to_faction_mercenary_pool(faction, unit, 1, 100, tier_amount, 1, 0, "", "", "")
	end

	-- Check for which favour level of what god we are working
	if god == "poseidon" and new_tier >= 2 and old_tier ~= 3 and faction:is_allowed_to_capture_territory() then
		out("Adding Listener for Food Per Coastal Region")
		update_poseidon_food_effect(context,true)
		core:add_listener (
			"Troy_Poseidon_Food_Per_Coastal_Region" .. faction_name,
			"FactionTurnStart",
			function(context) return context:faction():name() == faction_name end,
			function(context)
			update_poseidon_food_effect(context,true)
			end,
			true
		)

		core:add_listener (
			"Troy_Poseidon_Coastal_Region_Captured" .. faction_name,
			"RegionFactionChangeEvent",
			function(context)
				if context:region():owning_faction():name() == faction_name or context:previous_faction():name() == faction_name then
					for k,v in pairs(coastal_buildings) do
						if context:region():building_exists(v) then
							return true
						end
					end
				end
				return false
			end,
			function(context)
				update_poseidon_food_effect(context,false)
			end,
			true
		)
	end

	if god == "poseidon" and new_tier <= 1 and faction:is_allowed_to_capture_territory() then
		cm:remove_effect_bundle("effect_bundle_gods_poseidon_favour_tier_2", faction_name)
		core:remove_listener("Troy_Poseidon_Food_Per_Coastal_Region" .. faction_name)
		core:remove_listener("Troy_Poseidon_Coastal_Region_Captured" .. faction_name)
	end

	if god == "zeus" and new_tier >= 2 then
		if zeus_traits_existing_chars == nil then
			zeus_traits_existing_chars = {}
		end
		local char_list = faction:character_list()
		for i = 0, char_list:num_items() - 1 do
			local char = char_list:item_at(i)
			local cqi = char:family_member():command_queue_index()
			for i = 1, #zeus_traits_existing_chars do
				if cqi == zeus_traits_existing_chars[i] then
					return					
				end
			end
			if  cm:char_is_mobile_general_with_army(char) or 
				char:family_member():is_in_transit() or
				char:character_subtype("troy_agent_envoy") or 
				char:character_subtype("troy_agent_priest") or 
				char:character_subtype("troy_agent_spy") 
			then
				table.insert(zeus_traits_existing_chars, cqi)
				out("Saving character with cqi: " .. cqi)
			end
		end		
	end
	
	--[[ if god == "zeus" and new_tier <= 1 and old_tier ~= 0 then
		core:remove_listener("Troy_add_zeus_trait_agents" .. faction_name)
		core:remove_listener("Troy_add_zeus_trait_heroes" .. faction_name)
	end ]]
	
	--if new_tier == "troy_gods_athena_favour_tier_3" then
		--[[ local char_list = faction:character_list()
		for i=0,char_list:num_items()-1 do
			local current_char = char_list:item_at(i)
			if current_char:character_type("general") then
				grant_trait(current_char,athena_3_trait)
			end
		end ]]
	--elseif new_tier == "troy_gods_athena_favour_tier_2" and old_tier == "troy_gods_athena_favour_tier_3" then
		-- trigger warning incident if previous tier was 3
		--cm:trigger_incident(faction_name,athena_tier_2_warning,true)
	--elseif new_tier == "troy_gods_athena_favour_tier_1" then
		--[[ local char_list = faction:character_list()
		for i=0,char_list:num_items()-1 do
			local current_char = char_list:item_at(i)
			if current_char:character_type("general") and not current_char:is_faction_leader() then
				remove_trait(current_char,athena_3_trait)
			end
		end  ]]
	--elseif new_tier == "troy_gods_athena_favour_tier_0" then
		--[[ local char_list = faction:character_list()
		for i=0,char_list:num_items()-1 do
			local current_char = char_list:item_at(i)
			if current_char:character_type("general") then
				remove_trait(current_char,athena_negative_2_trait)
			end
		end ]]
	--elseif new_tier == "troy_gods_athena_favour_tier_negative_1" and old_tier == "troy_gods_athena_favour_tier_negative_2" then
		-- trigger warning incident if previous tier was negative 2
		--cm:trigger_incident(faction_name,athena_tier_negative_1_warning,true)
	--elseif new_tier == "troy_gods_athena_favour_tier_negative_2" then
		--[[ local char_list = faction:character_list()
		for i=0,char_list:num_items()-1 do
			local current_char = char_list:item_at(i)
			if current_char:character_type("general") then
				grant_trait(current_char,athena_negative_2_trait)
			end
		end ]]
	--end

	--[[ if new_tier == "troy_gods_aphrodite_favour_tier_3" then
		-- remove ancillaries to avoid abuse and grant them again
		cm:force_remove_ancillary_from_faction(faction_name,aphrodite_ancillary_1)
		cm:force_remove_ancillary_from_faction(faction_name,aphrodite_ancillary_2)
		cm:force_remove_ancillary_from_faction(faction_name,aphrodite_ancillary_3)
		cm:add_ancillary_to_faction(faction_name,aphrodite_ancillary_1, true)
		cm:add_ancillary_to_faction(faction_name,aphrodite_ancillary_2, true)
		cm:add_ancillary_to_faction(faction_name,aphrodite_ancillary_3, true) ]]
	-- elseif new_tier == "troy_gods_aphrodite_favour_tier_2" then
		-- trigger warning incident if previous tier was 3
		--if old_tier == "troy_gods_aphrodite_favour_tier_3" then
			--cm:trigger_incident(faction_name,aphrodite_tier_2_warning,true)
		--end
		--apply_aphrodite_bundle(faction,2)
	--elseif new_tier == "troy_gods_aphrodite_favour_tier_1" then
		-- remove ancillaries
		--cm:force_remove_ancillary_from_faction(faction_name,aphrodite_ancillary_1)
		--cm:force_remove_ancillary_from_faction(faction_name,aphrodite_ancillary_2)
		--cm:force_remove_ancillary_from_faction(faction_name,aphrodite_ancillary_3)
	   --aaply_aphrodite_bundle(faction,1)
	--elseif new_tier == "troy_gods_aphrodite_favour_tier_0" then
		--apply_aphrodite_bundle(faction,0)
	--elseif new_tier == "troy_gods_aphrodite_favour_negative_tier_1" then
		--apply_aphrodite_bundle(faction,-1)
	--elseif new_tier == "troy_gods_aphrodite_favour_negative_tier_2" then
	   	--apply_aphrodite_bundle(faction,-2)
	--end

	--if string.find(new_effect, "troy_gods_zeus_favour_tier_") and new_tier ~= "troy_gods_zeus_favour_tier_0" then
		--remove_knowing_destiny_bundle(faction)
		--update_knowing_destiny_bundle(context)
	--end

	--[[ if new_effect == "troy_gods_zeus_favour_tier_3" then
		determine_knowing_destiny_effect(context)
		cm:remove_effect_bundle("troy_gods_zeus_favour_tier_3",faction_name)
		-- Ensure any previous Zeus bundles are removed to prevent abuse
		for i=1, 4 do
			cm:remove_effect_bundle("troy_gods_zeus_knowing_destiny_"..i.."_HIDDEN",faction_name)
		end
		zeus_destiny_positive = cm:model():random_int(1,4)
		cm:apply_effect_bundle("troy_gods_zeus_knowing_destiny_"..zeus_destiny_positive.."_HIDDEN",faction_name,5)
	elseif new_effect == "troy_gods_zeus_favour_negative_tier_2" then
		cm:remove_effect_bundle("troy_gods_zeus_favour_negative_tier_2",faction_name)
		zeus_destiny_negative = cm:model():random_int(1,4)
		cm:apply_effect_bundle("troy_gods_zeus_knowing_destiny_negative_"..zeus_destiny_negative.."_HIDDEN",faction_name,5)
	end	]]

	--[[ if new_effect == "troy_gods_poseidon_favour_tier_3" then
		local region_list = faction:region_list()
		local port_regions = {}
		for i=0,region_list:num_items()-1 do
			local current_region = region_list:item_at(i)
			for _,building in pairs(port_buildings) do
				if current_region:building_exists(building) then
				   port_regions[#port_regions+1] = current_region:name()
				end
			end
		end
		local random = cm:model():random_int(1,#port_regions)
		cm:apply_effect_bundle_to_region(poseidon_random_bundle,port_regions[random],-1)
	end ]]

	--if old_tier == "troy_gods_poseidon_favour_tier_3" then
		--remove_random_bundle(faction)
	--end
end

function grant_trait(character,trait)
	if not character:has_trait(trait) then
		local char_str = cm:char_lookup_str(character:command_queue_index())
		cm:force_add_trait(char_str, trait, true)
	end
end

function remove_trait(character,trait)
	if character:has_trait(trait) then
		local char_str = cm:char_lookup_str(character:command_queue_index())
		cm:force_remove_trait(char_str, trait)
	end
end

function remove_aphrodite_bundle(region)
	for _,bundle in pairs(aphrodite_bundles) do
		cm:remove_effect_bundle_from_region(bundle,region:name())
	end
end

function apply_aphrodite_bundle(faction,tier)
	local region_list = faction:region_list()
	for i=0,region_list:num_items()-1 do
		local currect_region = region_list:item_at(i)
		if currect_region:is_province_capital() then
			if faction:holds_entire_province(currect_region:province_name(),false) then
				if tier == 0 then
					remove_aphrodite_bundle(currect_region)
				else
					remove_aphrodite_bundle(currect_region)
					cm:apply_effect_bundle_to_region(aphrodite_bundles[tier],currect_region,-1)
				end
			end
		end
	end
end

--[[ function determine_knowing_destiny_effect(context)
	if context:faction():has_pooled_resource("troy_god_attitude_zeus") then
		local zeus_favor = context:faction():pooled_resource("troy_god_attitude_zeus"):value()
		if zeus_favor > 250 then
			zeus_destiny_positive = cm:model():random_int(1,4)
			cm:apply_effect_bundle("troy_gods_zeus_knowing_destiny_"..zeus_destiny_positive.."_HIDDEN",context:faction():name(),6)
		elseif zeus_favor < -149 then
			zeus_destiny_negative = cm:model():random_int(1,4)
			cm:apply_effect_bundle("troy_gods_zeus_knowing_destiny_negative_"..zeus_destiny_negative.."_HIDDEN",context:faction():name(),6)
		end
	end
end ]]

--[[ function check_zeus_favour(faction)
	if faction:has_pooled_resource("troy_god_attitude_zeus") then
		local zeus_favor = faction:pooled_resource("troy_god_attitude_zeus"):value()
		if zeus_favor < -149 then
			return true
		end
	end
	return false
end

function drop_random_favour(faction)
	local gods = cm:model():world():god_manager():gods()
	local random = cm:model():random_int(1,gods:num_items())
	cm:faction_add_pooled_resource(faction:name(),gods:item_at(random):resource_key(),gods_factors.faction,zeus_random_drop_amount)
end  ]]

--[[ function remove_random_bundle(faction)
	local region_list = faction:region_list()
	for i=0,region_list:num_items()-1 do
		cm:remove_effect_bundle_from_region(poseidon_random_bundle,region_list:item_at(i):name())
	end
end ]]

function remove_knowing_destiny_bundle(faction)
	for _, effect_bundle_key in pairs(zeus_bundles) do
		if faction:has_effect_bundle(effect_bundle_key) then
			cm:remove_effect_bundle(effect_bundle_key, faction:name())
		end
	end
end

function has_any_knowing_destiny_bundle(faction)
	for _, effect_bundle_key in pairs(zeus_bundles) do
		if faction:has_effect_bundle(effect_bundle_key) then
			return true
		end
	end
	return false
end

function update_knowing_destiny_bundle(context)
	local faction = context:faction()
	local tier = context:faction():attitude_tier_for_god("zeus")

	if tier == 0 then
		return
	end

	if has_any_knowing_destiny_bundle(faction) then
		return
	end

	if zeus_bundles[tier] then
		local bundle_key = zeus_bundles[tier]
		local effect_bundle = cm:create_new_custom_effect_bundle(bundle_key)
		effect_bundle:set_duration(5)
		if zeus_bundles_to_effect_data[bundle_key] then
			local picked = cm:model():random_int(1,#zeus_bundles_to_effect_data[bundle_key])
			local effects_to_add = zeus_bundles_to_effect_data[bundle_key][picked]
			for _,data in ipairs(effects_to_add) do
				effect_bundle:add_effect(data.effect_key,data.scope_key,data.value)
			end
			cm:apply_custom_effect_bundle_to_faction(effect_bundle,faction)
			if faction:is_human() then
				cm:show_message_event(
					faction:name(),
					"event_feed_strings_text_troy_scripted_event_knowing_destiny_change_title",
					"",
					"event_feed_strings_text_troy_scripted_event_knowing_destiny_change_secondary_detail",
					true,
					1048
				)
			end
		else
			script_error("SCRIPT ERROR: update_knowing_destiny_bundle() found no effects to insert in effect bundle with key " .. bundle_key)
			return
		end
	else
		script_error("SCRIPT ERROR: update_knowing_destiny_bundle() found no effect bundle key for tier " .. tostring(tier))
		return
	end

end

function update_poseidon_food_effect(context,from_turn_start)
	local region_list
	local faction_
	if from_turn_start then
		region_list = context:faction():region_list()
		faction_ = context:faction()
	elseif not from_turn_start then
		region_list = context:region():owning_faction():region_list()
		faction_ = context:region():owning_faction()
	else
		return
	end

	local num_regions = 0
	for i = 0, region_list:num_items() - 1 do
		 for k,v in pairs(coastal_buildings) do
			if region_list:item_at(i):building_exists(v) then
				num_regions = num_regions + 1
			end
		end
	end
	local food_amount = num_regions*poseidon_food
	effect_bundle = cm:create_new_custom_effect_bundle("effect_bundle_gods_poseidon_favour_tier_2")
	effect_bundle:add_effect("troy_effect_food_income_per_coastal_region_hidden","faction_to_faction_own_unseen",food_amount)
	cm:apply_custom_effect_bundle_to_faction(effect_bundle,faction_)
end

hera_prayer_momentum_tier = {
	[0] = 20,
	[1] = 30,
	[2] = 40,
	[3] = 50
}

hera_prayer_momentum_bundles = {
	[0] = "effect_bundle_dlc1_penthesilea_gods_prayer_hera_0",
	[1] = "effect_bundle_dlc1_penthesilea_gods_prayer_hera_1",
	[2] = "effect_bundle_dlc1_penthesilea_gods_prayer_hera_2",
	[3] = "effect_bundle_dlc1_penthesilea_gods_prayer_hera_3"
}

--[[ core:add_listener (
	"troy_hera_add_momentum",
	"FactionInitiatesPrayer",
	function (context)
		return context:god():name() == "hera" and context:faction():is_horde()
	end,
	function(context)

		local tier = context:tier()
		local turn_started = cm:model():turn_number()
		local tier_amount = hera_prayer_momentum_tier[tier]
		
		local military_forces_list = cm:get_faction("troy_amazons_trj_penthesilea"):military_force_list()
		local military_forces_count = military_forces_list:num_items()
		if military_forces_count > 0 then
			for i = 0, military_forces_count - 1 do
				local military_force = military_forces_list:item_at(i);
				increaseMomentum(military_force:command_queue_index(), tier_amount)
			end
		end
		
	end,
	true
) ]]

core:add_listener(
	"troy_hera_add_momentum_per_turn", 
	"CharacterTurnStart", 
	function(context)
		local char = context:character()
		local char_fac = char:faction()
		return penthesilea_armies_momentum and
				not char_fac:is_allowed_to_capture_territory() and
				char:has_military_force() and
				penthesilea_armies_momentum[char:military_force():command_queue_index()]
	end,
	function (context)
		local char = context:character()
		local char_fac = char:faction()
		local tier_amount
		for i=0, #hera_prayer_momentum_bundles do
			if char_fac:has_effect_bundle(hera_prayer_momentum_bundles[i]) then
				tier_amount = hera_prayer_momentum_tier[i]
				break
			end
		end

		if tier_amount == nil then 
			return
		end

		increaseMomentum(char:military_force():command_queue_index(), tier_amount)
	end,
	true
)

---Table for exsiting characters, who should NOT receive traits by Zeus when hired
zeus_traits_existing_chars = {}

--  fixing up the structure so save games with old data structure work.
function zeus_traits_table_post_load_fix_up()
	local temp_table = {}
	for fac, data in pairs(zeus_traits_existing_chars) do
		for i = 0, #data do
			table.insert(temp_table, data[i])
		end
	end
	zeus_traits_existing_chars = temp_table
end
--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------

cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("zeus_traits_existing_chars",zeus_traits_existing_chars,context)
		cm:save_named_value("save_data_events", save_data_events, context)
	end
)

cm:add_loading_game_callback(
	function(context)
		zeus_traits_existing_chars = cm:load_named_value("zeus_traits_existing_chars",zeus_traits_existing_chars,context)
		save_data_events = cm:load_named_value("save_data_events", save_data_events, context)

		-- fixing the table structure from old saves
		if is_table(zeus_traits_existing_chars) and next(zeus_traits_existing_chars) and is_table(zeus_traits_existing_chars[next(zeus_traits_existing_chars)]) then
			zeus_traits_table_post_load_fix_up()
		end

	end
)