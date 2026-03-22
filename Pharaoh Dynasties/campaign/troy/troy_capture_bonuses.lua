out("Loading troy_capture_bonuses.lua")

local DEBUG_ENABLED = true
local capture_bonus_debug_str = "troy_capture_bonuses.lua: "

local function print_debug(str, force_print)
	if DEBUG_ENABLED or force_print then
		out(capture_bonus_debug_str .. str)
	end
end

capture_bonuses = {}

function capture_bonuses.get_myth_unit(context, value)
	local region_name = context:garrison_residence():region():name()
	local horde = context:character():military_force()
	local debug_msg = ""
	local myth_units = capture_bonuses.extract_myth_unit(region_name, horde)
	local faction = context:character():faction()

	for myth_unit, count in pairs(myth_units) do
		count = count or 1
		local capture_bonus = capture_bonuses.get_region_capture_bonus(faction:name(), region_name)
		local mod_kabeiros_value = capture_bonuses.get_kabeiros_region_effect_mod(cm:get_region(region_name), capture_bonus, count)
		if mod_kabeiros_value > 0 then 
			count = mod_kabeiros_value
		end

		debug_msg = string.format("%s\nBonus %d myth unit(s) (%s) added to mercenary pool.", debug_msg, count, myth_unit)

		-- total units are current one + the new ones
		local num = cm:num_units_in_faction_mercenary_pool(faction:command_queue_index(), myth_unit) + count
		cm:add_unit_to_faction_mercenary_pool(faction, myth_unit, num, 0, num, 0, 0, "", "", "")
	end

	return debug_msg
end

capture_bonuses.ui = {
	panel = "fm_capture_bonus",
	mechanic_desc = "mechanic_desc",
	buttons_mapping = {
		["resource_button_capture_bonus_gold"] = "capture_bonus_gold",
		["resource_button_capture_bonus_food"] = "capture_bonus_food",
		["resource_button_capture_bonus_wood"] = "capture_bonus_wood",
		["resource_button_capture_bonus_stones"] = "capture_bonus_stones",
		["resource_button_capture_bonus_bronze"] = "capture_bonus_bronze",
		["resource_button_capture_bonus_momentum"] = "capture_bonus_momentum",
		["resource_button_capture_bonus_god_attitude_zeus"] = "capture_bonus_god_attitude_zeus",
		["resource_button_capture_bonus_god_attitude_poseidon"] = "capture_bonus_god_attitude_poseidon",
		["resource_button_capture_bonus_god_attitude_hera"] = "capture_bonus_god_attitude_hera",
		["resource_button_capture_bonus_god_attitude_athena"] = "capture_bonus_god_attitude_athena",
		["resource_button_capture_bonus_god_attitude_ares"] = "capture_bonus_god_attitude_ares",
		["resource_button_capture_bonus_god_attitude_apollo"] = "capture_bonus_god_attitude_apollo",
		["resource_button_capture_bonus_god_attitude_aphrodite"] = "capture_bonus_god_attitude_aphrodite",
		["resource_button_capture_bonus_god_attitude_artemis"] = "capture_bonus_god_attitude_artemis",
		["resource_button_capture_bonus_god_attitude_hephaestus"] = "capture_bonus_god_attitude_hephaestus",
		["resource_button_capture_bonus_vision"] = "capture_bonus_vision",
		["resource_button_capture_bonus_giants"] = "capture_bonus_giants",
		["resource_button_capture_bonus_centaurs"] = "capture_bonus_centaurs",
		["resource_button_capture_bonus_sirens"] = "capture_bonus_sirens",
		["resource_button_capture_bonus_harpies"] = "capture_bonus_harpies",
		["resource_button_capture_bonus_larger_buckets"] = "capture_bonus_larger_buckets",
	},
	background_comp = "background",

	selected_character_cqi = nil, -- will hold the currently selected character for the local faction
}

-- Definition of the different capture bonus types that will be assigned to Regions.
capture_bonuses.types = {
	capture_bonus_gold = {
		skill_mod = "resource",
		resource_key = "troy_gold",
		icon = "UI/skins/default/sp_icon_capture_bonus_gold.png",
		tooltip = "city_info_bar_capture_bonus_gold",
		apply_effect = function(context, value)
			local debug_msg = string.format("Capture bonus: Added %d gold", value)
			cm:faction_add_pooled_resource(context:character():faction():name(), "troy_gold", capture_bonuses.resource_factor, value)
			return debug_msg
		end,
	},

	capture_bonus_food = {
		skill_mod = "resource",
		resource_key = "troy_food",
		icon = "UI/skins/default/sp_icon_capture_bonus_food.png",
		tooltip = "city_info_bar_capture_bonus_food",
		apply_effect = function(context, value)
			local debug_msg = string.format("Capture bonus: Added %d food", value)
			cm:faction_add_pooled_resource(context:character():faction():name(), "troy_food", capture_bonuses.resource_factor, value)
			return debug_msg
		end,
	},

	capture_bonus_wood = {
		skill_mod = "resource",
		resource_key = "troy_wood",
		icon = "UI/skins/default/sp_icon_capture_bonus_wood.png",
		tooltip = "city_info_bar_capture_bonus_wood",
		apply_effect = function(context, value)
			local debug_msg = string.format("Capture bonus: Added %d wood", value)
			cm:faction_add_pooled_resource(context:character():faction():name(), "troy_wood", capture_bonuses.resource_factor, value)
			return debug_msg
		end,
	},

	capture_bonus_stones = {
		skill_mod = "resource",
		resource_key = "troy_stones",
		icon = "UI/skins/default/sp_icon_capture_bonus_stone.png",
		tooltip = "city_info_bar_capture_bonus_stone",
		apply_effect = function(context, value)
			local debug_msg = string.format("Capture bonus: Added %d stones", value)
			cm:faction_add_pooled_resource(context:character():faction():name(), "troy_stones", capture_bonuses.resource_factor, value)
			return debug_msg
		end,
	},

	capture_bonus_bronze = {
		skill_mod = "resource",
		resource_key = "troy_bronze",
		icon = "UI/skins/default/sp_icon_capture_bonus_bronze.png",
		tooltip = "city_info_bar_capture_bonus_bronze",
		apply_effect = function(context, value)
			local debug_msg = string.format("Capture bonus: Added %d bronze", value)
			cm:faction_add_pooled_resource(context:character():faction():name(), "troy_bronze", capture_bonuses.resource_factor, value)
			return debug_msg
		end,
	},

	capture_bonus_momentum = {
		skill_mod = "resource",
		icon = "UI/skins/default/sp_icon_capture_bonus_glory.png",
		tooltip = "city_info_bar_capture_bonus_momentum",
		apply_effect = function(context, value)
			local debug_msg = string.format("Capture bonus: Added %d momentum", value)
			local force_cqi = context:character():military_force():command_queue_index()
			PenthesileaMomentum_OnSettlementWithCaptureBonusMomentumRazed(force_cqi, value)
			return debug_msg
		end,
	},

	capture_bonus_god_attitude_zeus = {
		skill_mod = "attitude",
		resource_key = "troy_god_attitude_zeus",
		icon = "UI/skins/default/sp_icon_capture_bonus_zeus.png",
		tooltip = "city_info_bar_capture_bonus_zeus",
		apply_effect = function(context, value)
			local debug_msg = string.format("Capture bonus: Added %d troy_god_attitude_zeus", value)
			cm:faction_add_pooled_resource(context:character():faction():name(), "troy_god_attitude_zeus", capture_bonuses.favour_factor, value)
			return debug_msg
		end,
	},

	capture_bonus_god_attitude_poseidon = {
		skill_mod = "attitude",
		resource_key = "troy_god_attitude_poseidon",
		icon = "UI/skins/default/sp_icon_capture_bonus_poseidon.png",
		tooltip = "city_info_bar_capture_bonus_poseidon",
		apply_effect = function(context, value)
			local debug_msg = string.format("Capture bonus: Added %d troy_god_attitude_poseidon", value)
			cm:faction_add_pooled_resource(context:character():faction():name(), "troy_god_attitude_poseidon", capture_bonuses.favour_factor, value)
			return debug_msg
		end,
	},

	capture_bonus_god_attitude_hera = {
		skill_mod = "attitude",
		resource_key = "troy_god_attitude_hera",
		icon = "UI/skins/default/sp_icon_capture_bonus_hera.png",
		tooltip = "city_info_bar_capture_bonus_hera",
		apply_effect = function(context, value)
			local debug_msg = string.format("Capture bonus: Added %d troy_god_attitude_hera", value)
			cm:faction_add_pooled_resource(context:character():faction():name(), "troy_god_attitude_hera", capture_bonuses.favour_factor, value)
			return debug_msg
		end,
	},

	capture_bonus_god_attitude_athena = {
		skill_mod = "attitude",
		resource_key = "troy_god_attitude_athena",
		icon = "UI/skins/default/sp_icon_capture_bonus_athena.png",
		tooltip = "city_info_bar_capture_bonus_athena",
		apply_effect = function(context, value)
			local debug_msg = string.format("Capture bonus: Added %d troy_god_attitude_athena", value)
			cm:faction_add_pooled_resource(context:character():faction():name(), "troy_god_attitude_athena", capture_bonuses.favour_factor, value)
			return debug_msg
		end,
	},

	capture_bonus_god_attitude_ares = {
		skill_mod = "attitude",
		resource_key = "troy_god_attitude_ares",
		icon = "UI/skins/default/sp_icon_capture_bonus_ares.png",
		tooltip = "city_info_bar_capture_bonus_ares",
		apply_effect = function(context, value)
			local debug_msg = string.format("Capture bonus: Added %d troy_god_attitude_ares", value)
			cm:faction_add_pooled_resource(context:character():faction():name(), "troy_god_attitude_ares", capture_bonuses.favour_factor, value)
			return debug_msg
		end,
	},

	capture_bonus_god_attitude_apollo = {
		skill_mod = "attitude",
		resource_key = "troy_god_attitude_apollo",
		icon = "UI/skins/default/sp_icon_capture_bonus_apollo.png",
		tooltip = "city_info_bar_capture_bonus_apollo",
		apply_effect = function(context, value)
			local debug_msg = string.format("Capture bonus: Added %d troy_god_attitude_apollo", value)
			cm:faction_add_pooled_resource(context:character():faction():name(), "troy_god_attitude_apollo", capture_bonuses.favour_factor, value)
			return debug_msg
		end,
	},

	capture_bonus_god_attitude_aphrodite = {
		skill_mod = "attitude",
		resource_key = "troy_god_attitude_aphrodite",
		icon = "UI/skins/default/sp_icon_capture_bonus_aphrodite.png",
		tooltip = "city_info_bar_capture_bonus_aphrodite",
		apply_effect = function(context, value)
			local debug_msg = string.format("Capture bonus: Added %d troy_god_attitude_aphrodite", value)
			cm:faction_add_pooled_resource(context:character():faction():name(), "troy_god_attitude_aphrodite", capture_bonuses.favour_factor, value)
			return debug_msg
		end,
	},
	
	capture_bonus_god_attitude_artemis = {
		skill_mod = "attitude",
		resource_key = "troy_god_attitude_artemis",
		icon = "UI/skins/default/sp_icon_capture_bonus_artemis.png",
		tooltip = "city_info_bar_capture_bonus_artemis",
		apply_effect = function(context, value)
			local debug_msg = string.format("Capture bonus: Added %d troy_god_attitude_artemis", value)
			cm:faction_add_pooled_resource(context:character():faction():name(), "troy_god_attitude_artemis", capture_bonuses.favour_factor, value)
			return debug_msg
		end,
	},

	capture_bonus_god_attitude_hephaestus = {
		skill_mod = "attitude",
		resource_key = "troy_god_attitude_hephaestus",
		icon = "UI/skins/default/sp_icon_capture_bonus_hep.png",
		tooltip = "city_info_bar_capture_bonus_hephaestus",
		apply_effect = function(context, value)
			local debug_msg = string.format("Capture bonus: Added %d troy_god_attitude_hephaestus", value)
			cm:faction_add_pooled_resource(context:character():faction():name(), "troy_god_attitude_hephaestus", capture_bonuses.favour_factor, value)
			return debug_msg
		end,
	},

	capture_bonus_vision = {
		-- dont want to modify value by skill - skip 'skill_mod' key
		skill_mod = "vision",
		icon = "UI/skins/default/sp_icon_capture_bonus_vision.png",
		tooltip = "city_info_bar_capture_bonus_vision",
		apply_effect = function(context, value)
			local debug_msg = string.format("Bonus vision added.", value)

			local character_cqi = context:character():command_queue_index()
			local effect_bundle_key = "effect_bundle_character_sight_bonus"

			if value ~= 0 then 
				local updated_effect_bundle = cm:create_new_custom_effect_bundle(effect_bundle_key)
			
				for i = 0, updated_effect_bundle:effects():num_items() - 1 do
					local curr_effect = updated_effect_bundle:effects():item_at(i)
					local curr_effect_value = curr_effect:value()
					local new_value = curr_effect_value * (100 + value) / 100
					
					updated_effect_bundle:set_effect_value(curr_effect, new_value)
				end

				local has_deleted
				repeat
					bundle_effects = updated_effect_bundle:effects()
					has_deleted = false
					for j=0,bundle_effects:num_items() - 1 do
						local curr_effect = bundle_effects:item_at(j)
						local curr_effect_value = curr_effect:value()
						if curr_effect_value == 0 then
							updated_effect_bundle:remove_effect(curr_effect)
							has_deleted = true
							break
						end
					end
				until not has_deleted

				cm:apply_custom_effect_bundle_to_character(updated_effect_bundle, context:character())
				cm:callback(function() cm:remove_effect_bundle_from_character(updated_effect_bundle:key(), character_cqi) end, 0.5)
			else
				cm:apply_effect_bundle_to_character(effect_bundle_key, character_cqi, 0)
				cm:callback(function() cm:remove_effect_bundle_from_character(effect_bundle_key, character_cqi) end, 0.5)
			end
			return debug_msg
		end,
	},

	capture_bonus_giants = {
		skill_mod = "myth_unit",
		icon = "/UI/skins/default/sp_icon_capture_bonus_giant.png",
		tooltip = "city_info_bar_capture_bonus_giants",
		apply_effect = capture_bonuses.get_myth_unit,
	},

	capture_bonus_centaurs = {
		skill_mod = "myth_unit",
		icon = "/UI/skins/default/sp_icon_capture_bonus_centaur.png",
		tooltip = "city_info_bar_capture_bonus_centaurs",
		apply_effect = capture_bonuses.get_myth_unit,
	},

	capture_bonus_sirens = {
		skill_mod = "myth_unit",
		icon = "/UI/skins/default/sp_icon_capture_bonus_siren.png",
		tooltip = "city_info_bar_capture_bonus_sirens",
		apply_effect = capture_bonuses.get_myth_unit,
	},

	capture_bonus_harpies = {
		skill_mod = "myth_unit",
		icon = "/UI/skins/default/sp_icon_capture_bonus_harpy.png",
		tooltip = "city_info_bar_capture_bonus_harpies",
		apply_effect = capture_bonuses.get_myth_unit,
	},

	capture_bonus_larger_buckets = {
		skill_mod = nil,
		icon = "UI/skins/default/sp_icon_capture_bonus_larger_buckets.png",
		tooltip = "city_info_bar_capture_bonus_larger_buckets",
		apply_effect = function(context, value)
			local debug_msg = string.format("Capture bonus: Pharaoh servant - Increased the size of all unlocked unit buckets by %d", value)
			pharaohs_servant.on_settlement_with_capture_bonus_larger_buckets_razed(context:character():faction():name(), value)
			return debug_msg
		end,
	},
}

-- function that aplies the character skill modification for capture bonus value
function capture_bonuses.get_character_skill_mod(character, value, ref_key)
	if not ref_key or type(capture_bonuses.skill_mod) ~= "table" or type(capture_bonuses.skill_mod[ref_key]) ~= "table" or not character then
		return value
	end

	local mod = 0

	for skill, value in pairs(capture_bonuses.skill_mod[ref_key]) do
		if character:has_skill(skill) then
			mod = mod + value
		end
	end

	mod = math.max(mod, -100)
	if mod ~= 0 then
		return value * (100 + mod) / 100
	end

	return value
end

-- function that applies a value mod from a set of listed effects
function capture_bonuses.get_faction_effect_mod(faction_key, capture_bonus_key, value)
	if not capture_bonuses.effects_mod or type(capture_bonuses.effects_mod) ~= "table" or type(capture_bonuses.effects_mod[capture_bonus_key]) ~= "table" then
		return value
	end

	local faction = cm:get_faction(faction_key)
	local mod = 0

	for i=0, faction:effect_bundles():num_items() - 1 do 
		local curr_effect_bundle = faction:effect_bundles():item_at(i)
		for e = 0, curr_effect_bundle:effects():num_items() - 1 do 
			local curr_effect = curr_effect_bundle:effects():item_at(e)
			if table_contains(capture_bonuses.effects_mod[capture_bonus_key], curr_effect:key()) then
				mod = mod + curr_effect:value()
			end
		end
	end

	mod = math.max(mod, -100)
	if mod ~= 0 then
		return value * (100 + mod) / 100
	end

	return value
end

function capture_bonuses.get_kabeiros_region_effect_mod(region, capture_bonus, value)
	if not capture_bonus or not capture_bonuses.kabeiros[capture_bonus.skill_mod] or not region then
		return value
	end

	local mod = 0

	local region_type 
	if region:garrison_residence():settlement_interface():production_type() == "troy_main_settlement_major" then 
		region_type = "major"
	else
		region_type = "minor"
	end
	local table_of_settlements = kabeiros_modified_settlements[region_type]
	if table_find(table_of_settlements, function(e) return e.key == region:name() end ) then
		mod = mod + capture_bonuses.kabeiros[capture_bonus.skill_mod]
		if capture_bonus.skill_mod == "vision" then -- this is only for vision, as it's using an effect bundle and the arithmetics are done in the cap bonus
			value = mod
			return value
		end
	else
		return value
	end

	mod = math.max(mod, -100)
	if mod ~= 0 then
		return value * (100 + mod) / 100
	end

	return value
end

function capture_bonuses.extract_myth_unit(region_name, horde)
	local campaign_name = cm:get_campaign_name()
	local buildings_mappings = capture_bonuses.regions_myth_unit_capture_bonuses[region_name] or capture_bonuses.regions_myth_unit_capture_bonuses["default"]
	local horde_buildings = horde:buildings()
	local buildings_size = horde_buildings:num_items()
	local buildings = {}
	local myth_units = {}

	for i=0, buildings_size-1 do
		local b = horde_buildings:item_at(i)
		buildings[b:name()] = true
	end

	local has_found_required_building = false

	for building_key, myth_units_and_counts in pairs(buildings_mappings) do
		if buildings[building_key] then
			has_found_required_building = true

			for unit, num in pairs(myth_units_and_counts[campaign_name]) do
				if myth_units[unit] then
					myth_units[unit] = myth_units[unit] + num
				else
					myth_units[unit] = num
				end
			end
		end
	end

	if not has_found_required_building then
		local myth_units_and_counts = buildings_mappings["default"]

		for unit, num in pairs(myth_units_and_counts[campaign_name]) do
			if myth_units[unit] then
				myth_units[unit] = myth_units[unit] + num
			else
				myth_units[unit] = num
			end
		end
	end

	return myth_units
end

-- VARIABLES

-- penthesilea_capture_bonus_cooldowns = {} -- this is no longer used. It is remapped in the loading callback

-- Table to hold the active cooldowns PER REGION for the capture bonus for all factions
capture_bonuses.active_cooldowns = {
	-- EXAMPLE
	-- faction_key = {
	--	 region1_key = 20,
	--	 region2_key = 3,
	-- }
}

-- FUNCTIONS

function capture_bonuses.are_enabled_for_faction(faction_key)
	return not not capture_bonuses.factions[faction_key]
end

function capture_bonuses.is_capture_bonus_available_to_local_faction(bonus_key)
	local faction_key = cm:get_local_faction_name(true)
	local campaign_name = cm:get_campaign_name()
	return capture_bonuses.availability[bonus_key]
			and table_find(capture_bonuses.availability[bonus_key].factions, faction_key)
			and table_find(capture_bonuses.availability[bonus_key].campaigns, campaign_name)
end

-- Returns the table with configuration about bonus type, cooldown, value and value_per_turn_modifier
-- This checks the faction key and current campaign_name. Returns nil if there is no correct combination for this faction and campaign defined
function capture_bonuses.get_region_capture_bonus_config(faction_key, region_key)
	local region_bonus_config = capture_bonuses.regions[region_key]

	if not region_bonus_config then
		script_error(string.format("get_region_capture_bonus_config called but there is no such region <%s> in capture_bonuses.regions", region_key))
		return
	end

	local campaign_name = cm:get_campaign_name()

	for _, bonus_data in ipairs(region_bonus_config) do
		if table_find(bonus_data.factions, faction_key) and table_find(bonus_data.campaigns, campaign_name) then
			return bonus_data
		end
	end

	local error_msg = string.format(
		[[ERROR: capture_bonuses.get_region_capture_bonus_config(faction_key = %s, region_key = %s)
		and campaign_name = %s BUT there is no configuration in capture_bonuses.regions[%s]
		that meets the criteria for faction and campaign name.
		]], faction_key, region_key, campaign_name, region_key)
	script_error(error_msg)
	return nil -- Explicitly showing to anyone who might look at this code that this function can return nil
	-- if there is no proper capture bonus config for this region, faction and campaign.
	-- Normally this should not happen and it is a bug for the design team
end

function capture_bonuses.get_region_capture_bonus(faction_key, region_key)
	local region_bonus_config = capture_bonuses.get_region_capture_bonus_config(faction_key, region_key)
	return region_bonus_config and capture_bonuses.types[region_bonus_config.bonus]
end

function capture_bonuses.get_capture_bonus_value_for_current_turn(faction_key, region_key)
	local region_bonus_config = capture_bonuses.get_region_capture_bonus_config(faction_key, region_key)
	if not region_bonus_config then
		return 0
	end

	local capture_bonus_key = region_bonus_config.bonus
	local value = region_bonus_config.value or 0
	local per_turn_bonus_value = region_bonus_config.value_per_turn_modifier

	local current_turn = cm:model():turn_number()

	if per_turn_bonus_value then
		value = value + (per_turn_bonus_value * current_turn)
	end

	return capture_bonuses.get_faction_effect_mod(faction_key, capture_bonus_key, value)
end

function capture_bonuses.get_nearest_settlement_with_capture_bonus(faction_key, bonus_key)
	local selected_force_x, selected_force_y = nil, nil

	if capture_bonuses.ui.selected_character_cqi and cm:get_character_by_cqi(capture_bonuses.ui.selected_character_cqi) then
		selected_force_x = cm:get_character_by_cqi(capture_bonuses.ui.selected_character_cqi):display_position_x()
		selected_force_y = cm:get_character_by_cqi(capture_bonuses.ui.selected_character_cqi):display_position_y()
	else
		local faction = cm:get_faction(faction_key)
		if faction:character_list():is_empty() then
			selected_force_x = faction:home_region():settlement():display_position_x()
			selected_force_y = faction:home_region():settlement():display_position_y()
		else
			selected_force_x = faction:character_list():item_at(0):display_position_x()
			selected_force_y = faction:character_list():item_at(0):display_position_y()
		end
	end

	local closest_region_key = nil
	local closest_settlement_dist = 999999999

	local region_list = cm:model():world():region_manager():region_list()
	for i = 0, region_list:num_items() - 1 do
		local region = region_list:item_at(i)
		local region_key = region:name()
		
		local region_bonus_config = capture_bonuses.get_region_capture_bonus_config(faction_key, region_key)
		local region_bonus_cooldown = capture_bonuses.get_active_cooldown(faction_key, region_key)

		if region_bonus_config and region_bonus_config.bonus == bonus_key and region_bonus_cooldown == 0 then
			local curr_settlement = region:settlement()
			local distance_to_settlement_squared = distance_squared(
				curr_settlement:display_position_x(), curr_settlement:display_position_y(), selected_force_x, selected_force_y)

			if distance_to_settlement_squared < closest_settlement_dist then
				closest_region_key = region_key
				closest_settlement_dist = distance_to_settlement_squared
			end
		end
	end

	return closest_region_key
end

function capture_bonuses.scroll_camera_to_nearest_settlement_with_capture_bonus(bonus_key, faction_key)
	local closest_region_key = capture_bonuses.get_nearest_settlement_with_capture_bonus(faction_key, bonus_key)
	
	if closest_region_key then
		cm:scroll_camera_to_settlement(closest_region_key)
	end
end

function capture_bonuses.get_active_cooldown(faction_key, region_key)
	if capture_bonuses.active_cooldowns[faction_key] and capture_bonuses.active_cooldowns[faction_key][region_key] then
		return capture_bonuses.active_cooldowns[faction_key][region_key]
	end

	return 0
end

function capture_bonuses.set_active_cooldown(faction_key, region_key, cooldown)
	capture_bonuses.active_cooldowns[faction_key] = capture_bonuses.active_cooldowns[faction_key] or {}
	capture_bonuses.active_cooldowns[faction_key][region_key] = cooldown
end

function capture_bonuses.advance_cooldowns_for_faction(faction_key)
	if not capture_bonuses.active_cooldowns[faction_key] then return end

	for region_key, cooldown in pairs(capture_bonuses.active_cooldowns[faction_key]) do
		capture_bonuses.active_cooldowns[faction_key][region_key] = math.max(0, cooldown - 1)
	end

	if cm:get_local_faction_name(true) == faction_key then
		capture_bonuses.ui.update_capture_bonus_icons_for_local_faction()
	end
end

function capture_bonuses.ui.refresh_panel()
	print_debug("capture_bonuses.ui.refresh_panel()")
	local tooltip_no_settlement_with_such_capture_bonus = "city_info_bar_capture_bonus_empty"

	local capture_bonus_panel = core:get_ui_root():SequentialFind(capture_bonuses.ui.panel)
	if not capture_bonus_panel then
		return
	end

	local description = capture_bonus_panel:SequentialFind(capture_bonuses.ui.mechanic_desc)
	if description then
		local state = capture_bonuses.ui_config.mechanic_desc_states[cm:get_local_faction_name(true)]
		if state then
			description:SetState(state)
		end
	end

	local background = capture_bonus_panel:SequentialFind(capture_bonuses.ui.background_comp)
	if background then
		local state = capture_bonuses.ui_config.background_states[cm:get_local_faction_name(true)]
		if state then
			background:SetState(state)
		end
	end

	for key, bonus_type in pairs(capture_bonuses.types) do
		if capture_bonuses.is_capture_bonus_available_to_local_faction(key) then
			local closest_region_key = capture_bonuses.get_nearest_settlement_with_capture_bonus(cm:get_local_faction_name(true), key)
			local value = closest_region_key and capture_bonuses.get_capture_bonus_value_for_current_turn(cm:get_local_faction_name(true), closest_region_key) or 0

			capture_bonus_panel:InterfaceFunction(
				'set_resource', 
				key, 
				bonus_type.resource_key or "", 
				bonus_type.icon,
				bonus_type.tooltip .. "_title",
				closest_region_key and bonus_type.tooltip or tooltip_no_settlement_with_such_capture_bonus,
				closest_region_key and "active" or "inactive",
				value)
		end
	end
end

-- Be very careful not to pass here a faction that is not the local faction
-- This parameter exists only to be used when the function is called before the creation of Campaign Manager
function capture_bonuses.ui.update_capture_bonus_icons_for_local_faction(local_faction_key)
	local local_faction_key = local_faction_key or cm:get_local_faction_name(true)

	if cm:is_game_running() and local_faction_key ~= cm:get_local_faction_name(true) then
		script_error("The function capture_bonuses.ui.update_capture_bonus_icons_for_local_faction() is called but the specified local_faction_key is different that the actual local faction")
	end

	if not capture_bonuses.are_enabled_for_faction(local_faction_key) then
		return
	end

	local region_list = cm:model():world():region_manager():region_list()
	for i = 0, region_list:num_items() - 1 do
		local region_key = region_list:item_at(i):name()
		
		local region_capture_bonus = capture_bonuses.get_region_capture_bonus(local_faction_key, region_key)
		local region_bonus_cooldown_for_faction = capture_bonuses.get_active_cooldown(local_faction_key, region_key)

		if region_capture_bonus and region_bonus_cooldown_for_faction == 0 then
			local value = capture_bonuses.get_capture_bonus_value_for_current_turn(local_faction_key, region_key)
			capture_bonuses.ui.add_capture_bonus_icon(region_key, region_capture_bonus.icon, region_capture_bonus.tooltip, value)
		end
	end
end

function capture_bonuses.ui.add_capture_bonus_icon(region_key, icon_path, icon_tooltip_key, value)
	cm:set_custom_settlement_info_icon(region_key, "pen_capture_bonus", icon_path, icon_tooltip_key, value)
	CampaignUI.UpdateSettlementEffectIcons()
end

function capture_bonuses.ui.remove_capture_bonus_icon(region_key)
	cm:set_custom_settlement_info_icon_visibility(region_key, "pen_capture_bonus", false)
	CampaignUI.UpdateSettlementEffectIcons()
end

--##########################################
-- triggers
--##########################################

core:add_listener (
	"CaptureBonuses_FirstTickAfterWorldCreated_UI",
	"FirstTickAfterWorldCreated",
	function(context)
		for faction_key, _ in pairs(capture_bonuses.factions) do
			if context:world():model():faction_is_local(faction_key) then
				return true
			end
		end

		return false
	end,
	function(context)
		print_debug("CaptureBonuses_FirstTickAfterWorldCreated_UI")

		local local_faction_key = nil
		for faction_key, _ in pairs(capture_bonuses.factions) do
			if context:world():model():faction_is_local(faction_key) then
				local_faction_key = faction_key
				break
			end
		end

		if local_faction_key then
			capture_bonuses.ui.update_capture_bonus_icons_for_local_faction(local_faction_key)
		end
	end,
	false
);

function capture_bonuses.add_listeners()
	out("CaptureBonuses_AddListeners()")

	core:add_listener(
		"CaptureBonuses_CharacterSelected",
		"CharacterSelected",
		function(context) return capture_bonuses.are_enabled_for_faction(context:character():faction():name()) end,
		function(context)
			print_debug("CharacterSelected")
			capture_bonuses.ui.selected_character_cqi = context:character():command_queue_index()
		end,
		true
	)

	core:add_listener(
		"CaptureBonuses_CharacterDeselected",
		"CharacterDeselected",
		true,
		function(context)
			capture_bonuses.ui.selected_character_cqi = nil
		end,
		true
	)

	core:add_listener(
		"CaptureBonuses_PanelOpened",
		"PanelOpenedCampaign",
		function(context)
			return context.string == capture_bonuses.ui.panel
		end,
		capture_bonuses.ui.refresh_panel,
		true
	)

	core:add_listener(
		"CaptureBonuses_CaptureBonusButtonClicked",
		"ComponentLClickUp",
		function(context) return capture_bonuses.ui.buttons_mapping[context.string] end,
		function(context)
			capture_bonuses.scroll_camera_to_nearest_settlement_with_capture_bonus(capture_bonuses.ui.buttons_mapping[context.string], cm:get_local_faction_name(true))
		end,
		true
	)

	core:add_listener(
		"CaptureBonuses_CharacterPerformsSettlementOccupationDecision",
		"CharacterPerformsSettlementOccupationDecision",
		function(context) return capture_bonuses.are_enabled_for_faction(context:character():faction():name()) end,
		function(context)
			print_debug("CaptureBonuses_CharacterPerformsSettlementOccupationDecision")

			local region_key = context:garrison_residence():region():name()
			local faction_key = context:character():faction():name()

			local capture_bonus = capture_bonuses.get_region_capture_bonus(faction_key, region_key)

			if capture_bonus and capture_bonuses.get_active_cooldown(faction_key, region_key) == 0 then
				local region_bonus_config = capture_bonuses.get_region_capture_bonus_config(faction_key, region_key)
				local cooldown = region_bonus_config.cooldown

				local base_value = capture_bonuses.get_capture_bonus_value_for_current_turn(faction_key, region_key)
				local modified_value_skills = capture_bonuses.get_character_skill_mod(
					context:character(), 
					base_value,
					capture_bonus.skill_mod
				)
				local modified_value_faction = capture_bonuses.get_faction_effect_mod(
					faction_key,
					region_bonus_config.bonus,
					modified_value_skills
				)
				local modified_value_kabeiros = capture_bonuses.get_kabeiros_region_effect_mod(
					cm:get_region(region_key), 
					capture_bonus, 
					modified_value_faction							
				)

				local debug_msg = capture_bonus.apply_effect(context, modified_value_kabeiros)
				capture_bonuses.set_active_cooldown(faction_key, region_key, cooldown)

				capture_bonuses.ui.remove_capture_bonus_icon(region_key)

				if capture_bonus.skill_mod == "attitude" then
					local god = cm:model():world():god_manager():god_by_resource_key(capture_bonus.resource_key)
					if not god:is_null_interface() then
						achievements.penthesilea.func_capture_bonuses_captured(faction_key, god:name())
					end
				end

				print_debug(string.format("Capture bonus activated for region %s. Cooldown for this region set to %d turns.", region_key, cooldown), true)
				print_debug(debug_msg, true)
			end
		end,
		true
	)

	core:add_listener(
		"CaptureBonuses_CaptureBonusTurnStart",
		"FactionTurnStart",
		function(context) return capture_bonuses.are_enabled_for_faction(context:faction():name()) end,
		function(context)
			print_debug("CaptureBonuses_CaptureBonusTurnStart")
			capture_bonuses.advance_cooldowns_for_faction(context:faction():name())
		end,
		true
	)

	core:add_listener(
		"CaptureBonuses_FactionGodAttitudeTierChange",
		"FactionGodAttitudeTierChange",
		function(context) 
			return capture_bonuses.are_enabled_for_faction(context:faction():name()) and cm:get_local_faction_name(true) == context:faction():name()
		end,
		function(context)
			print_debug("CaptureBonuses_FactionGodAttitudeTierChange")
			capture_bonuses.ui.update_capture_bonus_icons_for_local_faction()
		end,
		true
	)
end

--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------
cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("CAPTURE_BONUSES_ACTIVE_COOLDOWNS", capture_bonuses.active_cooldowns, context)
	end
)

cm:add_loading_game_callback(
	function(context)
		capture_bonuses.active_cooldowns = cm:load_named_value("CAPTURE_BONUSES_ACTIVE_COOLDOWNS", capture_bonuses.active_cooldowns, context)

		-- remap old variable for older saves
		local penthesilea_capture_bonus_cooldowns = cm:load_named_value("PENTHESILEA_CAPTURE_BONUS_COOLDOWNS", {}, context)
		if next(penthesilea_capture_bonus_cooldowns) ~= nil then  -- Check whether the table is not empty.
			capture_bonuses.active_cooldowns["troy_amazons_trj_penthesilea"] = penthesilea_capture_bonus_cooldowns
		end
	end
)