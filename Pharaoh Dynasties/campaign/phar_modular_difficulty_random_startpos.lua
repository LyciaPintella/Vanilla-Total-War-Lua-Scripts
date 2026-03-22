out("Loading phar_modular_difficulty_random_startpos.lua")

local RSP_faction_list = {};
local RSP_region_list = {};
local RSP_initial_region_list = {};
local RSP_faction_count = 0;
local RSP_desired_ruins = 0;
local RSP_provinces = {};
local RSP_transferred_regions = {};
local RSP_seed = 0;

core:add_listener(
	"RandomizeStartPos", 
	"ModularDifficultyRandomStartPosEnabled", 
	function(context) 
		return context.bool == true
	end,
	function(context)
		RSP_seed = RSP_new_random_seed()
		cm:disable_event_feed_events(true, "", "", "diplomacy_faction_encountered")
		RSP_start_randomize(RSP_seed)
		cm:disable_event_feed_events(false, "", "", "diplomacy_faction_encountered")
		
		for _, legitimacy_object  in ipairs(legitimacy_choice.legitimacy_objects) do
			if legitimacy_object then 
				local faction_key = legitimacy_object.political_states_system.config.starting_ruler_faction_key
				if faction_key then
					legitimacy_object.political_states_system.special_ancillary_system:unlock_ancillaries(faction_key, true)
				end
			end
		end
	end,
	true)
---------------------------------------------------------------------------
------------------------------ RANDOMIZATION ------------------------------
---------------------------------------------------------------------------
function RSP_start_randomize(seed)
	out.design("RSP_start_randomize("..tostring(seed)..")");
	math.randomseed(seed);
	
	RSP_faction_list = {};
	RSP_region_list = {};
	
	-- Factions
	local faction_list = cm:model():world():faction_list();
	RSP_faction_count = faction_list:num_items();
	
	for i = 0, RSP_faction_count - 1 do
		local faction = faction_list:item_at(i);
		local faction_key = faction:name();
		local faction_subculture = faction:subculture();
		
		local new_faction = {};
		new_faction.key = faction_key;
		new_faction.subculture = faction_subculture;
		new_faction.is_human = faction:is_human();
		new_faction.original_regions_count = faction:num_regions()
		new_faction.regions_to_distribute = new_faction.original_regions_count
		
		if new_faction.is_human == true then
			out.design("\tList Marking Player : "..faction_key);
		end			
		-- After introducing character bound hordes the check that replaces is_horde() is is_allowed_to_capture_territory()
		if not faction:is_dead() and faction:is_allowed_to_capture_territory() then
 			table.insert(RSP_faction_list, new_faction);
		else
			out.design("RSP excluded faction as dead or not allowed to capture territori. Faction name : " .. faction_key)
		end
	end
	
	-- Regions
	local region_list = cm:model():world():region_manager():region_list();
	
	for i = 0, region_list:num_items() - 1 do
		local region = region_list:item_at(i);
		local region_key = region:name();		

		-- Add the region to the region list
		-- TODO: Exclude Amarna from this regions list, as it should not be distributed to any faction. Best to provide a configurable list of excluded regions.		
		local region_settlement = region:settlement()
		local new_region = {};
		new_region.key = region_key;
		new_region.province = region:province_name();
		new_region.is_razed = region:is_abandoned();
		new_region.is_port  = region_settlement:is_port();
		new_region.pos_x = region_settlement:logical_position_x();
		new_region.pos_y = region_settlement:logical_position_y();
		new_region.display_x = region_settlement:display_position_x();
		new_region.display_y = region_settlement:display_position_y();
		
		table.insert(RSP_region_list, new_region);
		RSP_transferred_regions[region_key] = false;
		
		-- Keep province list
		RSP_provinces[new_region.province] = RSP_provinces[new_region.province] or {};
		table.insert(RSP_provinces[new_region.province], new_region);
	end
	
	-- Randomize Lists
	RSP_shuffle_table(RSP_faction_list);
	RSP_shuffle_table(RSP_region_list);
	
	-- Deep copy of region list to be used as reference point at the end of randomization
	RSP_initial_region_list = table_deep_copy(RSP_region_list)

	-- Logging
	out.design("\tTotal Factions: "..tostring(RSP_faction_count));
	out.design("\t\tIncluded Factions: "..tostring(#RSP_faction_list));
	
	local total_regions = region_list:num_items();
	out.design("\tTotal Regions: "..tostring(total_regions));
	out.design("\t\tIncluded Regions: "..tostring(#RSP_region_list));
	
	-- TODO: Properly calculate the number of settled factions as dead and horde factions should be excluded from the following calculation.
	local spare_regions = total_regions - #RSP_faction_list; -- The amount of regions left after everyone gets one
	--Currently unused but allows to adjust the amount of deserted regions
	local ruin_percentage = 100
	RSP_desired_ruins = math.floor((spare_regions / 100) * ruin_percentage);
	
	--Keeps track of regions saved for factions
	local faction_regions = 0

	-- Pick Player Region based on subculture
	for i = 1, #RSP_faction_list do
		faction_regions = RSP_faction_list[i].original_regions_count + faction_regions
	end
		-- Begin randomization
	RSP_randomize(faction_regions);
end

function RSP_randomize_complete()
	out.design("RSP_randomize_complete()");
	out.design("Seed for RSP session is: " .. RSP_seed);
end

function RSP_randomize(faction_regions_left) 
	local faction_index = 1
	out.design("RSP_randomize_next("..faction_index..")")

	-- Check if we are shuffling faction regions or desert.
	while faction_regions_left > 0 do
		local faction = RSP_faction_list[faction_index];

		-- Does this particular faction has any regions left to distribute?
		if faction.regions_to_distribute > 0 then 
			-- If this is the first region for a faction, we need to move the armies as well
			if faction.regions_to_distribute == faction.original_regions_count then
				
				--Moving the capital of the faction. .
				local region, i = RSP_find_region_for_faction(faction, true);
				faction.first_assigned_region = region;
				RSP_transfer_region(region, faction, true);
				table.remove(RSP_region_list, i);
			
				-- If the faction is Human we need to reposition the camera accordingly
				if faction.is_human == true then 
					-- Set the camera
					local cam_X = region.display_x;
					local cam_Y = region.display_y;
					cm:set_camera_position(cam_X, cam_Y, 10, 0, 10); 
				end 
			else 
				-- Try to find a nearby region
				local region, i = RSP_find_region_for_faction(faction, false);
				RSP_transfer_region(region, faction, false);
				table.remove(RSP_region_list, i);
			end
			faction.regions_to_distribute = faction.regions_to_distribute - 1
			faction_regions_left = faction_regions_left - 1;
		else 
			faction_index = faction_index + 1
		end	
	end 

	-- After the same amount of regions as the originally owned is distributed, clear up the remaining map by razing all regions left in the list.
	for _, region in ipairs(RSP_region_list) do
		cm:set_region_abandoned(region.key)
	end

	-- After the regions are distributed, move all settled faction armies to their capital regions.
	for _, faction in ipairs(RSP_faction_list) do
		-- If the faction originally owned regions, then it is a settled faction.
		local faction_obj = cm:model():world():faction_by_key(faction.key)
		if faction.original_regions_count > 0 then
			-- Find the faction capital after all the distribution, which should generally be the faction's best region.
			if faction_obj:has_home_region() then
				local capital_region_obj = faction_obj:home_region()
				local capital_region_key = capital_region_obj:name()
				local capital_region = table_find(RSP_initial_region_list, function(r) return r.key == capital_region_key end)
				RSP_move_faction_forces_to_region(capital_region, faction)
			end
		elseif faction_obj:culture() == "phar_main_clt_sea_peoples" then
			-- send sea peoples to random regions
			local target_region_index = math.random(1,#RSP_initial_region_list)
			local target_region = RSP_initial_region_list[target_region_index]
			RSP_move_faction_forces_to_region(target_region, faction)
		end
	end

	RSP_randomize_complete();
end

function RSP_find_teleport_pos(faction_key, region_key, preferred_distance)
	out.design("\tRSP_find_teleport_pos("..faction_key..", "..region_key..")");
	local pos_x, pos_y = cm:find_valid_spawn_location_for_character_from_settlement(faction_key, region_key, false, false, preferred_distance);
	return pos_x, pos_y;
end


function RSP_find_region_for_faction(faction, is_capital)
	if is_capital == true then
		-- This is their capital
		for i = 1, #RSP_region_list do
			local region = RSP_region_list[i];
			local region_check = RSP_check_region_restriction(region, faction, true);
			
			if region_check == true then
				return region, i;
			end
		end
		out.design("NOTE: Failed to find suitable region for faction - "..faction.key);
	else
		-- 1) Find region in their start province
		local province_regions = RSP_provinces[faction.first_assigned_region.province];
		
		for i = 1, #province_regions do
			local region = province_regions[i];
			
			if RSP_transferred_regions[region.key] == false then
				local region_check = RSP_check_region_restriction(region, faction, true);
				
				if region_check == true then
					local region_index = RSP_find_region_index(region.key)

					out.design("\tFound region in start province - "..tostring(i));
					return region, region_index;
				end
			end
		end
		
		-- 2) Find region adjacent to capital
		local capital_region = cm:model():world():region_manager():region_by_key(faction.first_assigned_region.key);
		local adjacent_region_list = capital_region:adjacent_region_list_traversable();
		
		for i = 0, adjacent_region_list:num_items() - 1 do
			local cur_region = adjacent_region_list:item_at(i);
			local cur_region_key = cur_region:name();
			
			if RSP_transferred_regions[cur_region_key] == false then
				for j = 1, #RSP_region_list do
					local region = RSP_region_list[j];
					
					if region.key == cur_region_key then
						local region_check = RSP_check_region_restriction(region, faction, true);
						
						if region_check == true then
							out.design("\tFound region via adjacency - "..tostring(j));
							return region, j;
						end
					end
				end
			end
		end
		
		-- 3) Find closest region
		local regions_by_distance = {};
		
		for i = 1, #RSP_region_list do
			local region = RSP_region_list[i];
			local region_check = RSP_check_region_restriction(region, faction, true);
			
			if region_check == true then
				local distance = distance_squared(faction.first_assigned_region.pos_x, faction.first_assigned_region.pos_y, region.pos_x, region.pos_y);
				local region_distance = {index = i, distance = distance};
				table.insert(regions_by_distance, region_distance);
			end
		end
		
		if #regions_by_distance > 0 then
			local RBD_index = table_find_extremum(regions_by_distance, function(a, b) return b.distance > a.distance end, true)
			local region_index = regions_by_distance[RBD_index].index 
			local region = RSP_region_list[region_index];
			out.design("\tFound region via distance - "..tostring(region_index));
			return region, index;
		end
	end
	-- Give up and return a random region
	return RSP_region_list[1], 1;
end

function RSP_check_region_restriction(region, faction, skip_subculture_check)
	if faction.is_human == true and region.is_razed == true then
		-- Don't give player ruins
		return false;
	end

	if table_find(RSP_suitable_regions["excluded_regions"], function(r) return r == region.key end) then 
		return false 
	end

	if skip_subculture_check == true then
		-- With this check on, the randomization won't be gated by subcultures.
		return true;
	end

	local faction_subculture = faction.subculture 
	local region_name = region.key
	if RSP_suitable_regions[faction_subculture] then
		for i=1, #RSP_suitable_regions[faction_subculture] do
			if RSP_suitable_regions[faction_subculture][i] == region_name then
				return true
			end
		end
	end

	return false;
end

function RSP_transfer_region(region, faction, move_forces)
	out.design("\tRSP_transfer_region("..region.key..", "..faction.key..")");
	cm:transfer_region_to_faction(region.key, faction.key);
	RSP_transferred_regions[region.key] = true;

	local region_obj = cm:model():world():region_manager():region_by_key(region.key);

	-- Upgrade ruins
	if region.is_razed then
		local slot_list = region_obj:slot_list():num_items()
		if slot_list then 
			for i = 0, slot_list - 1 do 
				local building_slot = region_obj:slot_list():item_at(i)
				if not building_slot:building():is_null_interface() then
					local building_level = building_slot:building():ui_level()
					if building_level == 0 then 
						local chain = building_slot:building():chain();
						local upgrade = cm:get_building_from_building_chain(chain, 1)
						cm:instantly_upgrade_building_in_region(region.key, i+1, upgrade);
					end
				end
			end
		end
	end
	
	-- Add development points to transfered regions from provinces that start with none
	if region_obj:faction_province_development_points() == 0 then 
		cm:add_development_points_to_region(region.key, RSP_config_variables.development_points_to_give)
	end
	

	--Move any forces
	if move_forces == true then
		RSP_move_faction_forces_to_region(region, faction)
	end
	
	-- Heal garrison
	cm:heal_region_garrison(region_obj:command_queue_index(), 1.0)
end

function RSP_move_faction_forces_to_region(region, faction)
	local faction_obj = cm:model():world():faction_by_key(faction.key);
	
	-- Teleport armies
	local military_force_list = faction_obj:military_force_list();
	local actual_forces = 0;
		
	for i = 0, military_force_list:num_items() - 1 do
		local current_force = military_force_list:item_at(i);
		
		if current_force:is_armed_citizenry() == false then
			actual_forces = actual_forces + 1;
			local force_leader_cqi = current_force:general_character():command_queue_index();
			local teleport_pos_X, teleport_pos_Y = RSP_find_teleport_pos(faction.key, region.key, 5)
			if teleport_pos_X > -1 then
				out.design("\t\tAttempting teleport of "..tostring(force_leader_cqi).." to "..tostring(teleport_pos_X).."/"..tostring(teleport_pos_Y));
				--Bypassing the wrapper as it has gating against teleportation outside the faction's turn.
				cm:get_game_interface():teleport_to("character_cqi:"..force_leader_cqi, teleport_pos_X, teleport_pos_Y);
				cm:replenish_action_points("character_cqi:"..force_leader_cqi);
			else
				out.design("\t\tNOTE: Failed to find teleport location for character with CQI "..tostring(force_leader_cqi).." - "..faction.key.." - "..region.key);
			end
		end
	end
	
	if RSP_DEBUG == true and actual_forces > 1 then
		out.design("NOTE: "..faction.key.." starts with "..actual_forces.." armies.");
	end
end

function RSP_find_region_index(region_key)
	for index, region in ipairs(RSP_region_list) do
		if region_key == region.key then 
			return index
		end
	end
end

function RSP_shuffle_table(input)
    for i = #input, 1, -1 do
        local j = math.random(i);
        input[i], input[j] = input[j], input[i];
    end
end

function RSP_new_random_seed()
	return math.random(10000, 99999);
end