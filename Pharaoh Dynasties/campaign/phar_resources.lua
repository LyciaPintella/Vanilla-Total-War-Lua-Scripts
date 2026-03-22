out("Loading phar_resources.")

local function output(str)
	if str then
		out("<<<_ RESOURCES _>>>: " .. str)
	end
end


bronze_config = {
	bronze_building_chain = {
		phar_main_bronze_plah = true,
		phar_main_northern_bronze_plah = true,
	},
	bronze_building_levels = {
		phar_main_production_bronze_level_1_plah = true,
		phar_main_production_northern_bronze_level_1_plah = true,
	},
	bronze_technology_key = {
		phar_main_tech_3_bronze_plah = 3,
		phar_main_tech_2_bronze_plah = 2,
		phar_main_tech_1_bronze_plah = 1,
	},
}

bronze_buildings_for_faction = {
	-- [faction_key] = {
		-- building_cap = <number>,
		-- bronze_buildings = <number>,
		-- current_level = <string>,
	--}
}

phar_wood_config = {
	wood_building_chains = {
		phar_main_lumber_port_plah = true,
		phar_main_northern_lumber_yard_plah = true,
	},
	wood_building_levels = {
		phar_main_production_northern_lumber_level_1_plah = true,
		phar_main_production_port_level_1_plah = true,
	},

	reductions = {
		[1] = 1,
		[2] = -8,
		[3] = -15,
		[4] = -22,
		[5] = -30,
		[6] = -37,
		[7] = -45,
		[8] = -50,
	},
	--
	wood_base_bundle = "phar_main_effect_bundle_economy_buildings_multi_wood_plah",
}

wood_buildings_for_faction = {
	-- [faction_key] = {
		-- wood_buildings = {
			-- [1] = {
				-- <building>,
				 -- <region>
			-- }
	  --  }
	--}

}

cm:add_first_tick_callback(function(context)

core:add_listener(
	"phar_resources_bronze_research_completed",
	"ResearchCompleted",
	function(context)
		if bronze_config.bronze_technology_key[context:technology()] then
			output("COMPLETED " .. context:technology())
			return true
		end
		return false
	end,
	function(context)
		local faction_building_data = bronze_buildings_for_faction[context:faction():name()]

		if faction_building_data then
			faction_building_data.building_cap = faction_building_data.building_cap + 1
			for k, _ in pairs(bronze_config.bronze_building_levels) do
				cm:remove_restricted_building_level_record_for_faction(k, context:faction():name())
			end
			output("Unrestricting bronze buildings, cap boosted from technology.")
		else
			output("No bronze buildings before research. Creating entry...")
			bronze_buildings_for_faction[context:faction():name()] = {
				building_cap = 1 + bronze_config.bronze_technology_key[context:technology()],
				bronze_buildings = 0,
				current_level = "",
			}
		end
	end,
	true
)

core:add_listener(
	"phar_resources_bronze_building_completed",
	"BuildingCompleted",
	function(context)
		if bronze_config.bronze_building_chain[context:building():chain()] and bronze_config.bronze_building_levels[context:building():name()] then
			output("COMPLETED " .. context:building():chain() .. " lvl " .. context:building():name())
			return true
		end
		return false
	end,
	function(context)
		local faction_building_data = bronze_buildings_for_faction[context:building():faction():name()]

		if faction_building_data then
			faction_building_data.current_level = context:building():name()
			faction_building_data.bronze_buildings = faction_building_data.bronze_buildings + 1
			output("BRONZE " .. faction_building_data.bronze_buildings .. "/" .. faction_building_data.building_cap)
			if faction_building_data.building_cap == faction_building_data.bronze_buildings then
				output("Restricting bronze buildings, cap reached.")
				for k, _ in pairs(bronze_config.bronze_building_levels) do
					cm:add_restricted_building_level_record_for_faction(k, context:building():faction():name())
				end
			end
		else
			bronze_buildings_for_faction[context:building():faction():name()] = {
				building_cap = 1,
				bronze_buildings = 1,
				current_level = context:building():name(),
			}
			output("No faction data found. Creating one and restricting bronze buildings, cap reached.")
			for k, _ in pairs(bronze_config.bronze_building_levels) do
				cm:add_restricted_building_level_record_for_faction(k, context:building():faction():name())
			end
		end
	end,
	true
)

core:add_listener(
	"phar_resources_bronze_building_demolished",
	"BuildingDemolished",
	function(context)
		if bronze_config.bronze_building_chain[context:building():chain()] and bronze_config.bronze_building_levels[context:building():name()] then
			return true
		end
		return false
	end,
	function(context)
		local faction_building_data = bronze_buildings_for_faction[context:building():faction():name()]

		if faction_building_data then
			faction_building_data.bronze_buildings = faction_building_data.bronze_buildings - 1

			if faction_building_data.bronze_buildings < 0 then
				faction_building_data.bronze_buildings = 0
			end
			if faction_building_data.bronze_buildings < faction_building_data.building_cap then
				for k, _ in pairs(bronze_config.bronze_building_levels) do
					cm:remove_restricted_building_level_record_for_faction(k, context:building():faction():name())
				end
			end
		end
	end,
	true
)


core:add_listener(
	"phar_region_abnandoned_with_bronze_buildings",
	"RegionAboutToBeAbandoned",
	function(context)
		return true
	end,
	function(context)
		local faction_building_data = bronze_buildings_for_faction[context:region():owning_faction():name()]
		if faction_building_data then
			faction_building_data.bronze_buildings = faction_building_data.bronze_buildings - 1

			if faction_building_data.bronze_buildings < 0 then
				faction_building_data.bronze_buildings = 0
			end
			output("Removing entry(abandoned region) for bronze buildings for " .. context:region():owning_faction():name())
			if faction_building_data.bronze_buildings < faction_building_data.building_cap then
				for k, _ in pairs(bronze_config.bronze_building_levels) do
					cm:remove_restricted_building_level_record_for_faction(k, context:region():owning_faction():name())
				end
			end
		end
	end,
	true
)

-- setup the old owner
core:add_listener(
	"phar_resources_bronze_region_changed_event",
	"RegionFactionChangeEvent",
	function(context)
		local has_bronze = false
		for k, _ in pairs(bronze_config.bronze_building_chain) do
			if context:region():garrison_residence():building_chain_exists(k) then
				has_bronze = true
			end
		end

		return has_bronze
	end,
	function(context)
		local faction_building_data = bronze_buildings_for_faction[context:previous_faction():name()]
		if not faction_building_data then
			output("region with bronze building but no data. this is an error.")
			return
		end
		faction_building_data.bronze_buildings = faction_building_data.bronze_buildings - 1
		if faction_building_data.bronze_buildings < 0 then
			faction_building_data.bronze_buildings = 0
		end
		if faction_building_data.bronze_buildings < faction_building_data.building_cap then
			for k, _ in pairs(bronze_config.bronze_building_levels) do
				cm:remove_restricted_building_level_record_for_faction(k, context:previous_faction():name())
			end
		end
	end,
	true
)


--setup the new owner
core:add_listener(
	"phar_resources_bronze_region_changed_event",
	"RegionFactionChangePostBuildingConversionEvent",
	function(context)
		local has_bronze = false
		for k, _ in pairs(bronze_config.bronze_building_chain) do
			if context:region():garrison_residence():building_chain_exists(k) then
				has_bronze = true
			end
		end

		return has_bronze
	end,
	function(context)
		local faction_building_data = bronze_buildings_for_faction[context:region():owning_faction():name()]
		if not faction_building_data then
			bronze_buildings_for_faction[context:region():owning_faction():name()] = {
				building_cap = 1,
				bronze_buildings = 1,
				current_level = "",
			}
			for k, _ in pairs(bronze_config.bronze_building_levels) do
				cm:add_restricted_building_level_record_for_faction(k, context:region():owning_faction():name())
			end
			return
		end
		faction_building_data.bronze_buildings = faction_building_data.bronze_buildings + 1
		output("BRONZE " .. faction_building_data.bronze_buildings .. "/" .. faction_building_data.building_cap)
		if faction_building_data.building_cap == faction_building_data.bronze_buildings then
			output("Restricting bronze buildings, cap reached.")
			for k, _ in pairs(bronze_config.bronze_building_levels) do
				cm:add_restricted_building_level_record_for_faction(k, context:region():owning_faction():name())
			end
		end
	end,
	true
)


core:add_listener(
	"phar_region_abnandoned_with_wood_buildings",
	"RegionAboutToBeAbandoned",
	function(context)
		if wood_buildings_for_faction[context:region():owning_faction():name()] then
			return true
		end
		return false
	end,
	function(context)
		local faction_building_data = wood_buildings_for_faction[context:region():owning_faction():name()]
		if faction_building_data and is_table(faction_building_data.wood_buildings) then
			for idx, data in ipairs(faction_building_data.wood_buildings) do
				if data.region == context:region():name() then
					table.remove(faction_building_data.wood_buildings, idx)
					output("Removing entry(abandoned region) for wood buildings for " .. context:region():owning_faction():name())
				end
			end
			update_wood_effects(faction_building_data)
		end
	end,
	true
)

core:add_listener(
	"phar_resources_wood_building_completed",
	"BuildingCompleted",
	function(context)
		if phar_wood_config.wood_building_chains[context:building():chain()] and
			phar_wood_config.wood_building_levels[context:building():name()] then
			output("COMPLETED " .. context:building():chain())
			return true
		end
		return false
	end,
	function(context)
		local faction_data = wood_buildings_for_faction[context:building():faction():name()]
		if faction_data and is_table(faction_data.wood_buildings) then
			local data = {
				building = context:building():name(),
				region = context:building():region():name()
			}
			table.insert(faction_data.wood_buildings, #faction_data.wood_buildings + 1, data)
			output("Adding entry for wood building for " .. context:building():faction():name() .. ". Building #" .. #faction_data.wood_buildings)
			update_wood_effects(faction_data)
		end
		if not faction_data then
			local data = {
				building = context:building():name(),
				region = context:building():region():name()
			}
			wood_buildings_for_faction[context:building():faction():name()] = {
				wood_buildings = {
				}
			}
			output("Creating entry for wood buildings for " .. context:building():faction():name())
			local faction_data = wood_buildings_for_faction[context:building():faction():name()]
			table.insert(faction_data.wood_buildings, #faction_data.wood_buildings + 1, data)
			update_wood_effects(faction_data)
		end
	end,
	true
)

core:add_listener(
	"phar_resources_wood_building_demolished",
	"BuildingDemolished",
	function(context)
		if phar_wood_config.wood_building_chains[context:building():chain()] and
			phar_wood_config.wood_building_levels[context:building():name()] then
			return true
		end
		return false
	end,
	function(context)
		local faction_data = wood_buildings_for_faction[context:building():faction():name()]
		if faction_data and is_table(faction_data.wood_buildings) then
			for idx, data in ipairs(faction_data.wood_buildings) do
				if data.region == context:building():region():name() and data.building == context:building():name() then
					table.remove(faction_data.wood_buildings, idx)
					output("Removing entry for wood buildings for " .. context:building():faction():name())
				end
			end
			update_wood_effects(faction_data)
		end
	end,
	true
)

core:add_listener(
	"phar_resources_wood_region_changed_event",
	"RegionFactionChangeEvent",
	function(context)
		return true
	end,
	function(context)
	end,
	true
)

function update_wood_effects(faction_building_data)

	local building_count = #faction_building_data.wood_buildings
	for idx, data in pairs(faction_building_data.wood_buildings) do
		local custom_bundle = cm:create_new_custom_effect_bundle(phar_wood_config.wood_base_bundle)

		local region = cm:get_region(data.region)
		if region then
			for i = 0, custom_bundle:effects():num_items() - 1 do
				local effect = custom_bundle:effects():item_at(i)
				if not phar_wood_config.reductions[building_count]then
					custom_bundle:set_effect_value(effect, 0)
				else
					custom_bundle:set_effect_value(effect, phar_wood_config.reductions[building_count])
				end
				cm:apply_custom_effect_bundle_to_region(custom_bundle, region)
			end
		end
	end
end


end)

cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("PHAR_RESOURCES_WOOD_PER_FACTION", wood_buildings_for_faction, context)
		cm:save_named_value("PHAR_RESOURCES_BRONZE_PER_FACTION", bronze_buildings_for_faction, context)
	end
)

cm:add_loading_game_callback(
	function(context)
		wood_buildings_for_faction		 = cm:load_named_value("PHAR_RESOURCES_WOOD_PER_FACTION", wood_buildings_for_faction, context)
		bronze_buildings_for_faction	   = cm:load_named_value("PHAR_RESOURCES_BRONZE_PER_FACTION", bronze_buildings_for_faction, context)
	end
)

