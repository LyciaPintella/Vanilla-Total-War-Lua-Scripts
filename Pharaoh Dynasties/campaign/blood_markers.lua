local DEV_BLOOD_MARKERS_IGNORE_CONDITIONS = false

BLOOD_MARKER_TYPE_INVALID = 0
BLOOD_MARKER_TYPE_BLOOD_TOTEM = 1
BLOOD_MARKER_TYPE_BLOOD_RIVER = 2

MAX_BLOOD_TOTEMS_ALLOWED = 200
BLOOD_MARKERS_MIN_UNITS_IN_MAIN_ARMY_OF_EACH_SIDE = 14 -- excluding reinforcements
BLOOD_MARKERS_MIN_TROOPS_OF_EACH_SIDE = 0 -- including reinforcements
BLOOD_MARKERS_TOTAL_CASUALTIES = 75 -- including reinforcements, in percents

core:add_listener(
	"BloodMarkers_WorldCreated",
	"WorldCreated",
	true,
	function(context)
		MAX_BLOOD_TOTEMS_ALLOWED = cm:model():get_campaign_variable_by_name("famous_battles_max_allowed")
		BLOOD_MARKERS_MIN_UNITS_IN_MAIN_ARMY_OF_EACH_SIDE = cm:model():get_campaign_variable_by_name("famous_battles_minimum_units_per_side")
		BLOOD_MARKERS_MIN_TROOPS_OF_EACH_SIDE = cm:model():get_campaign_variable_by_name("famous_battles_minimum_force_required")
		BLOOD_MARKERS_TOTAL_CASUALTIES = cm:model():get_campaign_variable_by_name("famous_battles_minimum_casualties_required")
	end,
	false
)

blood_marker = {
	logical_position = {x = 0, y = 0},
	battles = {}, -- queue of battle details with max size = blood_marker.max_battles
	id = 0, -- unique id of the blood marker
	marker_type = BLOOD_MARKER_TYPE_INVALID,

	-- counter from which the id variable is generated
	total_blood_markers = 0,

	-- cfg
	interactable_marker_info_key = "blood_totem",
	max_battles = 3, -- in case of more battles, we discard the oldest one
}
blood_marker.__index = blood_marker

function blood_marker:new(logical_position_x, logical_position_y, marker_type)
	local marker = {}
	setmetatable(marker, self)
	self.total_blood_markers = self.total_blood_markers + 1
	
	marker.id = self.total_blood_markers
	marker.logical_position = {x = logical_position_x, y = logical_position_y}
	marker.battles = {}
	marker.marker_type = marker_type

	out("New blood marker created with position: x = " .. marker.logical_position.x .. ", y = " .. marker.logical_position.y)
	
	return marker
end

-- the actual displaying of the blood marker on the campaign map
-- should be called every time when battles are updated 
function blood_marker:update_marker_on_the_campaign_map()
	local marker_id = "blood_marker_" .. tostring(self.id)

	if self.marker_type == BLOOD_MARKER_TYPE_BLOOD_TOTEM then
		cm:remove_interactable_campaign_marker(marker_id)

		cm:add_blood_marker(
			marker_id,  -- marker_unique_id
			self.interactable_marker_info_key, -- marker_info_key
			self.logical_position.x, -- position_x
			self.logical_position.y, -- position_y
			0, -- radius
			"", -- faction
			"", -- subculture
			self:get_tooltip() -- localised tooltip
		)
	elseif self.marker_type == BLOOD_MARKER_TYPE_BLOOD_RIVER then
		cm:add_blood_river(
			marker_id,
			self:get_tooltip(),
			self.logical_position.x, -- position_x
			self.logical_position.y -- position_y
		)
	end
end

function blood_marker:clear_marker_on_the_campaign_map()
	local marker_id = "blood_marker_" .. tostring(self.id)

	if self.marker_type == BLOOD_MARKER_TYPE_BLOOD_TOTEM then
		cm:remove_interactable_campaign_marker(marker_id)
	elseif self.marker_type == BLOOD_MARKER_TYPE_BLOOD_RIVER then
		-- currently there is no way to clear single battle river
	end
end

-- generate tooltip based on all battles in this blood marker
function blood_marker:get_tooltip()
	local tooltip = {}

	for idx, details in ipairs(self.battles) do
		tooltip[#tooltip + 1] = details:generate_tooltip()
		tooltip[#tooltip + 1] = ""
	end
	
	return table.concat(tooltip, "\n")
end

-- add another battle to the blood marker
-- if there would be more than max_battles, the oldest one is discarded
function blood_marker:add_battle(battle_details)
	if #self.battles >= self.max_battles then
		table.remove(self.battles, 1)
	end

	table.insert(self.battles, battle_details)
end

blood_marker_battle_details = {
	-- This is not used anymore. It is here only to prevent old saves from lua crashes. 
	-- The battle name is now generated the same way it's generated in the pending battle - using loading_screen_title_override, battle_region_key, battle_record_key
	localised_battle_name = "",
	
	loading_screen_title_override = "",
	battle_region_key = "",
	battle_record_key = "",
	attacker_battle_result = "",
	attacker_faction_key = "",
	attacker_family_member_cqi = 0,
	defender_faction_key = "",
	defender_family_member_cqi = 0,
	num_casualties = 0,
	turn_number = 0
}
blood_marker_battle_details.__index = blood_marker_battle_details

function blood_marker_battle_details:new(loading_screen_title_override, battle_region_key, battle_record_key, attacker_result, attacker_key, attacker_fm_cqi, defender_key, defender_fm_cqi, casualties, turn_number)
	local battle_details = {}
	setmetatable(battle_details, self)
	
	battle_details.loading_screen_title_override = loading_screen_title_override
	battle_details.battle_region_key = battle_region_key
	battle_details.battle_record_key = battle_record_key

	battle_details.attacker_battle_result = attacker_result
	battle_details.attacker_faction_key = attacker_key
	battle_details.attacker_family_member_cqi = attacker_fm_cqi

	battle_details.defender_faction_key = defender_key
	battle_details.defender_family_member_cqi = defender_fm_cqi

	battle_details.num_casualties = casualties
	battle_details.turn_number = turn_number
	
	return battle_details
end

function blood_marker_battle_details:get_faction_name_and_flag_str(for_attacker)
	local faction_name = ""
	local faction_flag = ""

	-- First, try to get the data from the character details, accessed via the family member,
	-- which will return correct data for (killed) rebel characters
	local family_member_cqi = for_attacker and self.attacker_family_member_cqi or self.defender_family_member_cqi or 0
	local family_member = family_member_cqi and family_member_cqi > 0 and cm:get_family_member_by_cqi(family_member_cqi) or nil
	local character_details = family_member and not family_member:is_null_interface() and family_member:character_details() or nil

	if character_details and not character_details:is_null_interface() then
		faction_name = character_details:faction_onscreen_name()
		faction_flag = character_details:faction_flag_path()
	else
		local faction_key = for_attacker and self.attacker_faction_key or self.defender_faction_key
		local faction = cm:get_faction(faction_key)

		faction_name = common:get_localised_string("factions_screen_name_" .. faction_key)
		faction_flag = faction:flag_path()
	end

	return string.format("[[img:%s/mon_24.png]]%s[[/img]]", faction_flag, faction_name)
end

function blood_marker_battle_details:generate_tooltip()
	local tooltip = {}

	local localised_battle_name = self.localised_battle_name
	if #self.loading_screen_title_override > 0 then
		localised_battle_name = common:get_localised_string(self.loading_screen_title_override)
	elseif #self.battle_record_key > 0 then
		localised_battle_name = common:get_localised_string("battles_localised_name_" + self.battle_record_key)
	elseif #self.battle_region_key > 0 then
		localised_battle_name = common:get_localised_string("random_localisation_strings_string_famous_battle_battle_of") .. " " .. 
								common:get_localised_string(self.battle_region_key)
	end
	tooltip[#tooltip + 1] = localised_battle_name
	
	local result = common:get_localised_string("battle_result_types_result_screen_name_" .. self.attacker_battle_result)

	local attacker = self:get_faction_name_and_flag_str(true)
	local defender = self:get_faction_name_and_flag_str(false)

	tooltip[#tooltip + 1] = string.format(common:get_localised_string("campaign_localised_strings_string_blood_marker_battle_result"), result, attacker, defender)
	tooltip[#tooltip + 1] = string.format("%s: %d", common:get_localised_string("campaign_localised_strings_string_turn"), self.turn_number)
	tooltip[#tooltip + 1] = string.format("%s: %d", common:get_localised_string("campaign_localised_strings_string_blood_marker_casualties"), self.num_casualties)
	
	return table.concat(tooltip, "\n")
end

function blood_marker_show_conditions_check(battle_results)
	if DEV_BLOOD_MARKERS_IGNORE_CONDITIONS then
		return true
	end

	local unit_scale = cm:model():unit_scale_ratio()
	local total_starting_units_num = battle_results:attacker_start_number_of_men() + battle_results:defender_start_number_of_men()

	return battle_results:attacker_main_army_start_units() >= BLOOD_MARKERS_MIN_UNITS_IN_MAIN_ARMY_OF_EACH_SIDE and
		   battle_results:defender_main_army_start_units() >= BLOOD_MARKERS_MIN_UNITS_IN_MAIN_ARMY_OF_EACH_SIDE and
		   battle_results:attacker_start_number_of_men() >= BLOOD_MARKERS_MIN_TROOPS_OF_EACH_SIDE * unit_scale and
		   battle_results:defender_start_number_of_men() >= BLOOD_MARKERS_MIN_TROOPS_OF_EACH_SIDE * unit_scale and
		   battle_results:attacker_casualties() + battle_results:defender_casualties() >= total_starting_units_num * 0.01 * BLOOD_MARKERS_TOTAL_CASUALTIES
end

function should_add_blood_totem(context)
	local pending_battle = context:pending_battle()
	local battle_results = pending_battle:battle_results()

	return not pending_battle:river_battle() and 
		   not pending_battle:seige_battle() and
		   not pending_battle:naval_battle() and
		   not battle_results:is_null_interface() and 
		   blood_marker_show_conditions_check(battle_results)
end

function should_add_blood_river(context)
	local battle_results = context:pending_battle():battle_results()

	return context:pending_battle():river_battle() and
		   not battle_results:is_null_interface() and 
		   blood_marker_show_conditions_check(battle_results)
end


-- This is the class that will hold all of the blood markers and blood rivers.
-- We need to be able to check if a blood marker already exists in a given location, 
-- in order to update it or create new one if it didn't exist
blood_markers_manager = {
	markers = {},
	num_blood_totems = 0,
	num_blood_rivers = 0,

	-- Get attacker and defender data before the battle, as the data for rebels is lost when the character (its MF) is killed
	attacker_family_member_cqi = 0,
	defender_family_member_cqi = 0,
}

__blood_markers_manager = nil

function blood_markers_manager:new()
	if __blood_markers_manager then
		return __blood_markers_manager
	end

	local markers_manager = {}
	setmetatable(markers_manager, self)
	self.__index = self
	
	markers_manager.markers = {}
	markers_manager.num_blood_totems = 0
	markers_manager.num_blood_rivers = 0
	markers_manager.attacker_family_member_cqi = 0
	markers_manager.defender_family_member_cqi = 0

	__blood_markers_manager = markers_manager
	
	return markers_manager
end

blood_markers_manager:new()

function blood_markers_manager:add_marker(marker)
	if marker.marker_type == BLOOD_MARKER_TYPE_BLOOD_TOTEM then
		self.num_blood_totems = self.num_blood_totems + 1
	elseif marker.marker_type == BLOOD_MARKER_TYPE_BLOOD_RIVER then
		self.num_blood_rivers = self.num_blood_rivers + 1
	else
		script_error("blood_markers_manager:add_marker() Trying to add invalid blood marker")
		return
	end

	local key = marker.logical_position.x .. ":" .. marker.logical_position.y
	self.markers[key] = marker
end

-- If Blood Totem is inside the zone of control of any settlement,
-- return new coordinates that lay on the circumference of the zone of control of the settlement.
-- I.e. given radius, angle (calculated from input x, y) and origin (settlement pos), 
-- find the (ret_x, ret_y) point on the circumference of the zone of control.
-- This prevents the Blood Totem to overlap with the settlement on the campaign map.
function blood_markers_manager:calc_offset_position_to_target_zone_of_control(battle_x, battle_y, target_x, target_y, target_zoc)
	local distance_from_origin = ((battle_x - target_x) ^ 2 + (battle_y - target_y) ^ 2) ^ 0.5
	
	if distance_from_origin < target_zoc then
		local angle = math.atan2(battle_y - target_y, battle_x - target_x)

		local ret_x = target_x + target_zoc * math.cos(angle)
		local ret_y = target_y + target_zoc * math.sin(angle)

		return { x = math.floor(ret_x), y = math.floor(ret_y) }
	end
end

function blood_markers_manager:offset_position_to_settlement_zone_of_control(marker_type, x, y)
	if marker_type ~= BLOOD_MARKER_TYPE_BLOOD_TOTEM then
		return x, y
	end

	local regions_list = cm:model():world():region_manager():region_list()
	local num_regions = regions_list:num_items()
	for i = 0, num_regions - 1 do
		local region = regions_list:item_at(i)
		local settlement = region:settlement()
		local zone_of_control_radius = settlement:zone_of_control_radius_land()

		local res = self:calc_offset_position_to_target_zone_of_control(x, y, settlement:logical_position_x(), settlement:logical_position_y(), zone_of_control_radius)
		if res then
			return res.x, res.y
		end

		--ERS
		local slot_list = region:slot_list()
		local num_slots = slot_list:num_items()
		local ERS_ZOC = 2
		for slot_idx = 0, num_slots - 1 do
			local slot = slot_list:item_at(slot_idx)
			if slot:is_infrastructure_slot() then
				local res = self:calc_offset_position_to_target_zone_of_control(x, y, slot:logical_position_x(), slot:logical_position_y(), ERS_ZOC)
				if res then
					return res.x, res.y
				end
			end
		end
	end

	return x, y
end

function blood_markers_manager:get_marker(logical_position_x, logical_position_y)
	local key = logical_position_x .. ":" .. logical_position_y
	return self.markers[key]
end

function blood_markers_manager:gather_factions_data(context)
	local get_family_member_cqi = function(character)
		if character and not character:is_null_interface() and
			character:family_member() and not character:family_member():is_null_interface()
		then
			return character:family_member():command_queue_index()
		else
			return 0
		end
	end

	self.attacker_family_member_cqi = get_family_member_cqi(context:pending_battle():attacker())
	self.defender_family_member_cqi = get_family_member_cqi(context:pending_battle():defender())
end

function create_test_blood_marker(x, y, marker_type)
	if not __blood_markers_manager:get_marker(x, y) then
		__blood_markers_manager:add_marker(blood_marker:new(x, y, marker_type))
	end

	local battle_details = blood_marker_battle_details:new("Test name", "asd", "dsa", "decisive_victory", cm:get_local_faction_name(true), 0, cm:get_local_faction_name(true), 0, 1234, cm:turn_number())
	__blood_markers_manager:get_marker(x, y):add_battle(battle_details)
	__blood_markers_manager:get_marker(x, y):update_marker_on_the_campaign_map()
end

function blood_markers_add_listeners()
	core:add_listener(
		"BloodMarkers_PendingBattleCreated",
		"PendingBattleCreated",
		true,
		function(context)
			__blood_markers_manager:gather_factions_data(context)
		end,
		true
	)

	core:add_listener(
		"BloodMarkers_BattleCompleted",
		"BattleCompleted",
		function(context) 
			return (should_add_blood_totem(context) or should_add_blood_river(context)) and not context:pending_battle():region():is_null_interface()
		end,
		function(context)
			local marker_type = should_add_blood_totem(context) and BLOOD_MARKER_TYPE_BLOOD_TOTEM or BLOOD_MARKER_TYPE_BLOOD_RIVER

			local pending_battle = context:pending_battle()
			local battle_results = pending_battle:battle_results()

			local battle_x = pending_battle:logical_position_x()
			local battle_y = pending_battle:logical_position_y()

			local x, y = __blood_markers_manager:offset_position_to_settlement_zone_of_control(marker_type, battle_x, battle_y)

			-- check if there is already a blood marker on this position
			local marker = __blood_markers_manager:get_marker(x, y)

			if not marker then
				if marker_type == BLOOD_MARKER_TYPE_BLOOD_TOTEM and 
					__blood_markers_manager.num_blood_totems >= MAX_BLOOD_TOTEMS_ALLOWED then
					return
				end

				marker = blood_marker:new(x, y, marker_type)
				__blood_markers_manager:add_marker(marker)
			end
			
			local battle_details = blood_marker_battle_details:new(
				pending_battle:loading_screen_title_override(),
				pending_battle:battle_region_key(),
				pending_battle:battle_record_key(),
				pending_battle:attacker_battle_result(),
				pending_battle:attacker_faction():name(),
				__blood_markers_manager.attacker_family_member_cqi,
				pending_battle:defender_faction():name(),
				__blood_markers_manager.defender_family_member_cqi,
				battle_results:attacker_casualties() + battle_results:defender_casualties(),
				cm:turn_number()
			)

			marker:add_battle(battle_details)
			marker:update_marker_on_the_campaign_map()

			if achievements.blood_markers then
				if marker_type == BLOOD_MARKER_TYPE_BLOOD_TOTEM then
					achievements.blood_markers.func_add_blood_totem(pending_battle)
				else
					achievements.blood_markers.func_add_blood_river(pending_battle)
				end
			end
		end,
		true
	)

	core:add_listener(
		"BloodMarkers_OptionsChanged",
		"BloodMarkersOptionsChanged",
		true,
		function(context)
			if not context.are_blood_rivers_enabled then
				cm:clear_campaign_blood_rivers()
			end

			for _, marker in pairs(__blood_markers_manager.markers) do
				marker:update_marker_on_the_campaign_map()
			end
		end,
		true
	)
end

--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------
cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("CAMPAIGN_TOTAL_BLOOD_MARKERS", blood_marker.total_blood_markers, context)
		cm:save_named_value("CAMPAIGN_BLOOD_MARKERS", __blood_markers_manager.markers, context)
		cm:save_named_value("CAMPAIGN_BLOOD_MARKERS_NUM_TOTEMS", __blood_markers_manager.num_blood_totems, context)
		cm:save_named_value("CAMPAIGN_BLOOD_MARKERS_NUM_RIVERS", __blood_markers_manager.num_blood_rivers, context)
	end
)

cm:add_loading_game_callback(
	function(context)
		blood_marker.total_blood_markers = cm:load_named_value("CAMPAIGN_TOTAL_BLOOD_MARKERS", blood_marker.total_blood_markers, context)

		blood_markers_manager:new().markers = cm:load_named_value("CAMPAIGN_BLOOD_MARKERS", {}, context)
		__blood_markers_manager.num_blood_totems = cm:load_named_value("CAMPAIGN_BLOOD_MARKERS_NUM_TOTEMS", 0, context)
		__blood_markers_manager.num_blood_rivers = cm:load_named_value("CAMPAIGN_BLOOD_MARKERS_NUM_RIVERS", 0, context)

		--removing empty markers
		local markers_for_delete = {}
		for _, k in ipairs(markers_for_delete) do
			local marker = __blood_markers_manager.markers[k]
			if marker.marker_type == BLOOD_MARKER_TYPE_BLOOD_TOTEM then
				__blood_markers_manager.num_blood_totems = __blood_markers_manager.num_blood_totems - 1
			elseif marker.marker_type == BLOOD_MARKER_TYPE_BLOOD_RIVER then
				__blood_markers_manager.num_blood_rivers = __blood_markers_manager.num_blood_rivers - 1
			end
			__blood_markers_manager.markers[k] = nil
		end

		for _, marker in pairs(__blood_markers_manager.markers) do
			setmetatable(marker, blood_marker)

			for _, battle_details in pairs(marker.battles) do
				setmetatable(battle_details, blood_marker_battle_details)
			end
		end

		core:add_listener(
			"LoadBloodMarkersOnUICreated",
			"UICreated",
			true,
			function(context)
				for _, marker in pairs(__blood_markers_manager.markers) do
					marker:update_marker_on_the_campaign_map()
				end
			end,
			false
		)
	end
)