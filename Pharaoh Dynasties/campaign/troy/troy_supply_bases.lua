out("Loading troy_supply_bases.lua")

num_odysseus_tier_2_melee_unlocking_buildings = 0
num_odysseus_tier_2_missile_unlocking_buildings = 0
num_odysseus_tier_3_melee_unlocking_buildings = 0
num_odysseus_tier_3_missile_unlocking_buildings = 0
restriction_reason = "troy_odysseus_supply_bases_lock_reason_2"

supply_base_buildings = {
	tier_2_melee 	= "troy_main_supply_base_3",
	tier_2_missile	= "troy_main_supply_base_4",
	tier_3_melee 	= "troy_main_supply_base_5",
	tier_3_missile	= "troy_main_supply_base_6"
}

odysseus_buildings_tier2_melee_unlock = {
	--["troy_main_ody_military_2"] = true,
	["troy_main_ody_military_3"] = true
}

odysseus_buildings_tier3_melee_unlock = {
	--["troy_main_ody_military_4"] = true,
	["troy_main_ody_military_5"] = true
}

odysseus_buildings_tier2_missile_unlock = {
	["troy_main_missile_3"] = true
}

odysseus_buildings_tier3_missile_unlock = {
	["troy_main_missile_4"] = true
}

function Add_Odyssey_War_Listeners()
	out("Listeners for Odysseys' supply bases started")
	
   --[[  core:add_listener(
		"Troy_odysseys_supply_base_destruction_war",
		"NegativeDiplomaticEvent",
		is_odyssey_involved,
		destroy_supply_bases,
		true
	) ]]

	core:add_listener(
		"Troy_odysseys_supply_base_increment_up",
		"BuildingCompleted",
		function(context) 
			return context:building():faction():name() == odysseus_faction
		end,
		check_and_increment_supply_base_counter,
		true
	)

	core:add_listener(
		"Troy_odysseys_supply_base_increment_down",
		"BuildingDemolished",
		function(context) 
			return context:building():faction():name() == odysseus_faction
		end,
		check_and_decrement_supply_base_counter,
		true
	)

	core:add_listener(
		"Troy_odysseys_supply_base_initial_lock",
		"FactionTurnStart",
		function(context)
			return context:faction():name() == odysseus_faction and cm:model():turn_number() == 1
		end,
		lock_supply_bases,
		false
	)
	
end

function check_and_increment_supply_base_counter(context)
	local building = context:building():name()
	
	if odysseus_buildings_tier2_melee_unlock[building] then 
		if num_odysseus_tier_2_melee_unlocking_buildings == 0 then 
			cm:remove_event_restricted_building_record_for_faction(supply_base_buildings.tier_2_melee, odysseus_faction)
		end
		num_odysseus_tier_2_melee_unlocking_buildings = num_odysseus_tier_2_melee_unlocking_buildings + 1
	end

	if odysseus_buildings_tier3_melee_unlock[building] then 
		if num_odysseus_tier_3_melee_unlocking_buildings == 0 then
			cm:remove_event_restricted_building_record_for_faction(supply_base_buildings.tier_3_melee, odysseus_faction)
		end
		num_odysseus_tier_3_melee_unlocking_buildings = num_odysseus_tier_3_melee_unlocking_buildings + 1
	end

	if odysseus_buildings_tier2_missile_unlock[building] then 
		if num_odysseus_tier_2_missile_unlocking_buildings == 0 then 
			cm:remove_event_restricted_building_record_for_faction(supply_base_buildings.tier_2_missile, odysseus_faction)
		end
		num_odysseus_tier_2_missile_unlocking_buildings = num_odysseus_tier_2_missile_unlocking_buildings + 1
	end

	if odysseus_buildings_tier3_missile_unlock[building] then 
		if num_odysseus_tier_3_missile_unlocking_buildings == 0 then 
			cm:remove_event_restricted_building_record_for_faction(supply_base_buildings.tier_3_missile, odysseus_faction)
		end
		num_odysseus_tier_3_missile_unlocking_buildings = num_odysseus_tier_3_missile_unlocking_buildings + 1
	end

end

function check_and_decrement_supply_base_counter(context)
	local building = context:building():name()

	if odysseus_buildings_tier2_melee_unlock[building] then
		if num_odysseus_tier_2_melee_unlocking_buildings > 0 then 
			num_odysseus_tier_2_melee_unlocking_buildings = num_odysseus_tier_2_melee_unlocking_buildings - 1
		end
		if num_odysseus_tier_2_melee_unlocking_buildings == 0 then
			cm:add_event_restricted_building_record_for_faction(
				supply_base_buildings.tier_2_melee,
				odysseus_faction,
				restric_reason_full_for_supply_base(supply_base_buildings.tier_2_melee)
			)
		end
	end

	if odysseus_buildings_tier3_melee_unlock[building] then
		if num_odysseus_tier_3_melee_unlocking_buildings > 0 then 
			num_odysseus_tier_3_melee_unlocking_buildings = num_odysseus_tier_3_melee_unlocking_buildings - 1
		end
		if num_odysseus_tier_3_melee_unlocking_buildings == 0 then
			cm:add_event_restricted_building_record_for_faction(
				supply_base_buildings.tier_3_melee,
				odysseus_faction,
				restric_reason_full_for_supply_base(supply_base_buildings.tier_3_melee)
			)
		end
	end

	if odysseus_buildings_tier2_missile_unlock[building] then
		if num_odysseus_tier_2_missile_unlocking_buildings > 0 then
			num_odysseus_tier_2_missile_unlocking_buildings = num_odysseus_tier_2_missile_unlocking_buildings - 1
		end
		if num_odysseus_tier_2_missile_unlocking_buildings == 0 then
			cm:add_event_restricted_building_record_for_faction(
				supply_base_buildings.tier_2_missile,
				odysseus_faction,
				restric_reason_full_for_supply_base(supply_base_buildings.tier_2_missile)
			)
		end
	end

	if odysseus_buildings_tier3_missile_unlock[building] then
		if num_odysseus_tier_3_missile_unlocking_buildings > 0 then
			num_odysseus_tier_3_missile_unlocking_buildings = num_odysseus_tier_3_missile_unlocking_buildings - 1
		end
		if num_odysseus_tier_3_missile_unlocking_buildings == 0 then
			cm:add_event_restricted_building_record_for_faction(
				supply_base_buildings.tier_3_missile,
				odysseus_faction,
				restric_reason_full_for_supply_base(supply_base_buildings.tier_3_missile)
			)
		end
	end
end

function restric_reason_full_for_supply_base(suply_base_key)
	local restrict_reason_full = "campaign_localised_strings_string_" .. restriction_reason
	local table_to_use
	if suply_base_key == "troy_main_supply_base_3" then
		table_to_use = odysseus_buildings_tier2_melee_unlock
	elseif suply_base_key == "troy_main_supply_base_4" then
		table_to_use = odysseus_buildings_tier2_missile_unlock
	elseif suply_base_key == "troy_main_supply_base_5" then
		table_to_use = odysseus_buildings_tier3_melee_unlock
	elseif suply_base_key == "troy_main_supply_base_6" then
		table_to_use = odysseus_buildings_tier3_missile_unlock
	end
	for key,_ in pairs(table_to_use) do
		restrict_reason_full = restrict_reason_full .. "," .. "building_culture_variants_name_" .. key
	end
	return restrict_reason_full
end

--[[ function destroy_supply_bases(context)
	local ithaca 
	local war_faction
	if context:proposer():name() == odysseus_faction then 
		ithaca = context:proposer()
		war_faction = context:recipient()
	else 
		ithaca = context:recipient()
		war_faction = context:proposer()
	end 
	foreign_slot_manager = ithaca:foreign_slot_managers()
	for i=0,foreign_slot_manager:num_items()-1 do 
		if foreign_slot_manager:item_at(i):region():owning_faction() == war_faction then
			cm:remove_faction_foreign_slots_from_region(ithaca:command_queue_index(),foreign_slot_manager:item_at(i):region():command_queue_index())
		end
	end 
end ]]

function lock_supply_bases()
	for _, base_key in pairs(supply_base_buildings) do
		cm:add_event_restricted_building_record_for_faction(base_key, odysseus_faction,restric_reason_full_for_supply_base(base_key))
	end	
end

function is_odyssey_involved(context)
	return (context:proposer():name() == odysseus_faction or context:recipient():name() == odysseus_faction) and context:is_war()
end

--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------

cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("TROY_ODYSSEUS_TIER_2_MELEE_UNLOCKS"	, num_odysseus_tier_2_melee_unlocking_buildings   , context)
		cm:save_named_value("TROY_ODYSSEUS_TIER_2_MISSILE_UNLOCKS"	, num_odysseus_tier_2_missile_unlocking_buildings , context)
		cm:save_named_value("TROY_ODYSSEUS_TIER_3_MELEE_UNLOCKS"	, num_odysseus_tier_3_melee_unlocking_buildings   , context)
		cm:save_named_value("TROY_ODYSSEUS_TIER_3_MISSILE_UNLOCKS"	, num_odysseus_tier_3_missile_unlocking_buildings , context)
	end 
)

cm:add_loading_game_callback(
	function(context)
		num_odysseus_tier_2_melee_unlocking_buildings	= cm:load_named_value("TROY_ODYSSEUS_TIER_2_MELEE_UNLOCKS", num_odysseus_tier_2_melee_unlocking_buildings, context)
		num_odysseus_tier_2_missile_unlocking_buildings = cm:load_named_value("TROY_ODYSSEUS_TIER_2_MISSILE_UNLOCKS", num_odysseus_tier_2_missile_unlocking_buildings, context)
		num_odysseus_tier_3_melee_unlocking_buildings   = cm:load_named_value("TROY_ODYSSEUS_TIER_3_MELEE_UNLOCKS", num_odysseus_tier_3_melee_unlocking_buildings, context)
		num_odysseus_tier_3_missile_unlocking_buildings = cm:load_named_value("TROY_ODYSSEUS_TIER_3_MISSILE_UNLOCKS", num_odysseus_tier_3_missile_unlocking_buildings, context) 
	end
)