local taunt_effect_db_key = "troy_effect_building_taunt_dummy"

function add_taunt_effect_for_region(region)
	local faction_list = cm:model():world():faction_list()

	for i = 0, faction_list:num_items() - 1 do
		cm:cai_add_region_hint(faction_list:item_at(i), region:name())
	end
end

function remove_taunt_effect_for_region(region)
	local faction_list = cm:model():world():faction_list()

	for i = 0, faction_list:num_items() - 1 do
		cm:cai_remove_region_hint(faction_list:item_at(i), region:name())
	end
end

-- check if the specified building has taunt effect
function has_building_taunt_effect(building)
	return building:get_effect_value(taunt_effect_db_key) ~= 0
end

function num_buildings_with_taunt_effect_in_region(region)
	local num_buildings = 0
	local building_list = region:settlement():building_list()

	for i = 0, building_list:num_items() - 1 do
		if has_building_taunt_effect(building_list:item_at(i)) then
			num_buildings = num_buildings + 1
		end
	end

	return num_buildings
end

-- check if there is a building with taunt effect in this region
function has_region_taunt_effect(region)
	return num_buildings_with_taunt_effect_in_region(region) > 0
end

core:add_listener(
	"taunt_effect_startpos_buildings",
	"NewCampaignStarted",
	true,
	function(context)
		local region_list = cm:model():world():region_manager():region_list()

		for i = 0, region_list:num_items() - 1 do
			local region = region_list:item_at(i)
			local is_owner_human = region:settlement():faction():is_human()

			if is_owner_human and has_region_taunt_effect(region) then
				add_taunt_effect_for_region(region)
			end
		end
	end,
	false
)

function add_taunt_listeners()
	core:add_listener(
		"taunt_effect_building_completed",
		"BuildingCompleted",
		function(context)
			local is_owner_human = context:building():faction():is_human()
			
			return is_owner_human and has_building_taunt_effect(context:building())
		end,
		function(context)
			add_taunt_effect_for_region(context:building():region())
		end,
		true
	)

	core:add_listener(
		"taunt_effect_building_demolished",
		"BuildingDemolished",
		function(context)
			local was_building_with_taunt_effect = has_building_taunt_effect(context:building())

			-- This check is before the building is actually destroyed so we need to know the number of such buildings in the region
			-- If there are more than 1 buildings and the player demolishes them in the same turn, only the last one will pass the condition for the callback as it is intended
			local exists_another_taunt_effect_in_region = num_buildings_with_taunt_effect_in_region(context:building():region()) > 1

			return was_building_with_taunt_effect and not exists_another_taunt_effect_in_region
		end,
		function(context)
			remove_taunt_effect_for_region(context:building():region())
		end,
		true
	)

	-- Remove taunt effect in the region after it changes hands
	-- It will be added again after building conversion if the faction is human and there is still a building with taunt effect
	core:add_listener(
		"taunt_effect_faction_changed",
		"RegionFactionChangeEvent",
		function(context)
			return has_region_taunt_effect(context:region())
		end,
		function(context)
			remove_taunt_effect_for_region(context:region())
		end,
		true
	)

	-- Add taunt effect after building covnersion is completed if it's human faction and there is still a building with taunt effect
	core:add_listener(
		"taunt_effect_faction_changed_post_building_conversion",
		"RegionFactionChangePostBuildingConversionEvent",
		function(context)
			local is_new_owner_human = context:region():settlement():faction():is_human()
			local has_building_with_taunt_effect_post_change = has_region_taunt_effect(context:region())

			return is_new_owner_human and has_building_with_taunt_effect_post_change
		end,
		function(context)
			add_taunt_effect_for_region(context:region())
		end,
		true
	)
end