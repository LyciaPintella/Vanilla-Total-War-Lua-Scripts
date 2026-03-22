
---------------------------------------------------------------
------------------ Ambition helper functions ------------------
---------------------------------------------------------------

-- In ALL functions that accept a min and max, if the max is bellow the min then the function becomes "Have at least X of"
-- EXAMPLE:
-- num_owned_regions_between(3, 6) checks if we have 3, 4, 5 or 6 regions
-- num_owned_regions_between(3, 0) checks if we have AT LEAST 3 regions

local really_small_number = -99999999

local function region_borders_faction(region, faction_key)
	local adjacent_regions = region:adjacent_region_list()
	for i = 0, adjacent_regions:num_items() - 1 do
		local adjacent_region = adjacent_regions:item_at(i)
		if adjacent_region:owning_faction():name() == faction_key then
			return true
		end
	end
	return false
end

local function check_if_region_has_POI(target_region_slot_list, list)
	for i = 1, #list do
		if target_region_slot_list:buliding_type_exists(list[i]) then
			return true
		end
	end

	return false
end

local function region_occupation_locked(faction, region)
	return cm:get_bool_script_state(region, "akhenaten_special_occupation_options")
		and not cm:get_bool_script_state(faction, "has_faction_claimed_akhenaten")
end

local function get_horde_characters(faction)
	local characters_table = {}
	local character_list = faction:character_list()
	for i = 0, character_list:num_items() - 1 do
		local character = character_list:item_at(i)
		local military_force = character and not character:is_null_interface() and character:military_force()
		local is_horde = military_force and not military_force:is_null_interface() and military_force:is_horde()

		if is_horde and character:family_member():is_alive() and character:region() and not character:region():is_null_interface() then
			table.insert(characters_table, character)
		end
	end
	return characters_table
end

-- If max_regions is less than min_regions will return early when we find min_regions amount,
-- which will cause it to not return all the regions with the given options.
-- Example: min_regions = 2, max_regions = 1, options = { is_province_capital = false }
--          If we have 5 regions that are not the province capital only the first 2 will be returned, instead of all 5
-- To avoid this just set max_regions to some really big number
local function get_bordering_regions(faction_key, metadata, min_regions, max_regions, options)
	if options.faction_to_check then
		faction_key = options.faction_to_check
	end

	local faction = cm:get_faction(faction_key)
	local faction_subculture = faction:subculture()
	local region_list = faction:region_list()

	if not is_nil(options.owner_min_regions)
		and not is_nil(options.owner_max_regions)
		and options.owner_min_regions > options.owner_max_regions
	then
		options.owner_max_regions = nil
	end

	if not is_nil(options.owner_min_armies)
		and not is_nil(options.owner_max_armies)
		and options.owner_min_armies > options.owner_max_armies
	then
		options.owner_max_armies = nil
	end

	local option_only_check_horde_regions = not is_nil(options.only_check_horde_regions) and options.only_check_horde_regions
	local option_check_horde_regions = ambitions.defaults.check_horde_regions
	if not is_nil(options.check_horde_regions) then
		option_check_horde_regions = options.check_horde_regions
	end

	local check_around_horde_characters = option_check_horde_regions or option_only_check_horde_regions
	local check_around_owned_regions = not option_only_check_horde_regions

	-- By request from Alex Serim, checks around horde armies are performed
	-- only if no own regions (i.e. only when faction is "full-horde")
	if check_around_owned_regions and region_list:num_items() > 0 then
		check_around_horde_characters = false
	end

	local adjacent_regions = {}
	local add_to_adjacent_regions = function(adjacent_region_list)
		for j = 0, adjacent_region_list:num_items() - 1 do
			table.insert(adjacent_regions, adjacent_region_list:item_at(j))
		end
	end

	if check_around_horde_characters then
		-- Get regions adjacent to the regions currently containing own horde armies
		local characters = get_horde_characters(faction)
		for _, character in ipairs(characters) do
			add_to_adjacent_regions(character:region():adjacent_region_list())
		end
	end

	if check_around_owned_regions then
		-- Get regions adjacent to owned regions
		for i = 0, region_list:num_items() - 1 do
			add_to_adjacent_regions(region_list:item_at(i):adjacent_region_list())
		end
	end
	
	local total_regions = 0
	local bordering_regions = {}
	local already_seen_region = {}

	-- Filter the adjacent regions by the options and populate bordering_regions
	for _, adjacent_region in ipairs(adjacent_regions) do
		local adjacent_region_key = adjacent_region:name()
		local adjacent_region_owner = adjacent_region:owning_faction()

		if adjacent_region_owner ~= faction
			and not region_occupation_locked(faction, adjacent_region)
			and not already_seen_region[adjacent_region_key]
			and (is_nil(options.is_province_capital)      or options.is_province_capital     == to_bool(adjacent_region:is_province_capital()))
			and (is_nil(options.is_abandoned)             or options.is_abandoned            == to_bool(adjacent_region:is_abandoned()))
			and (is_nil(options.is_enemy)                 or options.is_enemy                == to_bool(adjacent_region_owner:at_war_with(faction)))
			and (is_nil(options.is_subject)               or options.is_subject              == to_bool(adjacent_region_owner:is_subject_of(faction)))
			and (is_nil(options.we_are_subject_of)        or options.we_are_subject_of       == to_bool(faction:is_subject_of(adjacent_region_owner)))
			and (is_nil(options.is_allied)                or options.is_allied               == to_bool(adjacent_region_owner:allied_with(faction)))
			and (is_nil(options.is_specific_faction)      or options.is_specific_faction     == adjacent_region_owner:name())
			and (is_nil(options.is_sacred_egyptian)       or options.is_sacred_egyptian      == to_bool(sacred_egypt_lands[adjacent_region_key]))
			and (is_nil(options.is_sacred_hittite)        or options.is_sacred_hittite       == to_bool(sacred_hatti_lands[adjacent_region_key]))
			and (is_nil(options.is_sacred_aegean)         or options.is_sacred_aegean        == to_bool(sacred_aeg_lands[adjacent_region_key]))
			and (is_nil(options.is_sacred_mesopotamian)   or options.is_sacred_mesopotamian  == to_bool(sacred_meso_lands[adjacent_region_key]))
			and (is_nil(options.is_sacred_any)            or options.is_sacred_any           == to_bool(sacred_egypt_lands[adjacent_region_key] or sacred_hatti_lands[adjacent_region_key] or sacred_meso_lands[adjacent_region_key]))
			and (is_nil(options.is_different_subculture)  or options.is_different_subculture == to_bool(faction_subculture ~= adjacent_region_owner:subculture()))
			and (is_nil(options.owner_min_regions)        or adjacent_region_owner:num_regions() >= options.owner_min_regions)
			and (is_nil(options.owner_max_regions)        or adjacent_region_owner:num_regions() <= options.owner_max_regions)
			and (is_nil(options.owner_min_armies)         or adjacent_region_owner:num_generals() >= options.owner_min_armies)
			and (is_nil(options.owner_max_armies)         or adjacent_region_owner:num_generals() <= options.owner_max_armies)
			and (is_nil(options.production_type)          or table_find(options.production_type, adjacent_region:settlement():production_type()))
			and (is_nil(options.has_POI) 				  or options.has_POI == check_if_region_has_POI(adjacent_region:slot_list(), poi_building_keys))
		then
			total_regions = 1 + total_regions
			already_seen_region[adjacent_region_key] = true
			table.insert(bordering_regions, adjacent_region_key)

			if total_regions >= min_regions and max_regions < min_regions then
				metadata.regions_list = bordering_regions
				return bordering_regions
			elseif total_regions > max_regions then
				return nil
			end
		end
	end

	metadata.regions_list = (total_regions >= min_regions and total_regions <= max_regions and bordering_regions) or nil
	return metadata.regions_list
end

-- This returns a province where we own the capital region of the
-- province and an enemy owns some other region in the same province
local function owning_province_capital_with_adjacent_enemy_region_in_same_province(faction_key)
	local faction = cm:get_faction(faction_key)
	local region_list = faction:region_list()

	for i = 0, region_list:num_items() - 1 do
		local region = region_list:item_at(i)
		if region:is_province_capital() then
			local province_regions = region:province():regions()
			for j = 0, province_regions:num_items() - 1 do
				local province_region = province_regions:item_at(j)
				if province_region:owning_faction():at_war_with(faction)
					and not region_occupation_locked(faction, province_region)
					and region_borders_faction(province_region, faction_key)
				then
					return region:province()
				end
			end
		end
	end

	return nil
end

local function faction_controls_more_than_X_provinces (faction_key, min_provinces)
	if min_provinces <= 0 then
		return nil
	end

	local province_controlled, province_almost_controlled = cm:num_provinces_controlled_by_faction(cm:get_faction(faction_key))
	
	return province_controlled >= min_provinces 
end 

local function percent_regions_controlled_in_realm (faction_key, realm_key)
	local region_list = phar_realms.get_regions_for_realm(realm_key)
	local number_regions_owned = 0
	local number_regions = #region_list

	for _, region in ipairs(region_list) do 
		if cm:model():world():region_manager():region_by_key(region):owning_faction():name() == faction_key then 
			number_regions_owned = number_regions_owned + 1 
		end
	end 

	return math.round((number_regions_owned * 100) / number_regions)
end 

local chosen_path_to_legitimacy = function()
	return {
		["egyptian"] = egypt_legitimacy,
		["hittite"] = hatti_legitimacy,
		["aegean"] = aegean_legitimacy,
		["mesopotamian"] = meso_legitimacy,
	}
end

------------------------------------------------------------
------------------------ Pool Events -----------------------
------------------------------------------------------------

-- Checks the conditions on the faction's start of the turn
-- Will supply 2 arguments to the conditions:
--		faction_key
--		empty table {}
-- The empty table is so that this is compatible with the regular ambition conditions
-- The table will be unused after passed
function ambitions.helper.pool_event.activate_when_conditions_met(conditions_table, persistent)
	return {
		event = "FactionTurnStart",
		condition = function(context, faction_key, pool_metadata, pool_name)
			for _, condition in ipairs(conditions_table) do
				if not condition(faction_key, {}) then
					return false
				end
			end
			return true
		end,
		callback = function(context, faction_key, pool_metadata, pool_name)
			ambitions.add_pool_to_queue(faction_key, pool_name)
		end,
		persistent = persistent or false,
	}
end

------------------------------------------------------------
---------------------- Pool Conditions ---------------------
------------------------------------------------------------

function ambitions.helper.pool_condition.is_tutorial()
	return function()
		return core:svr_load_bool("sbool_player_selected_first_turn_intro_on_frontend") or cm:get_saved_value("bool_is_tutorial_mode")
	end
end

function ambitions.helper.pool_condition.is_not_tutorial()
	return function()
		return not ambitions.helper.pool_condition.is_tutorial()()
	end
end

function ambitions.helper.pool_condition.is_pharaoh_campaign()
	return function()
		return cm:get_campaign_name() == "phar_main"
	end
end

------------------------------------------------------------
------------------------ Conditions ------------------------
------------------------------------------------------------

function ambitions.helper.condition.OR(conditions)
	return function(faction_key, metadata)
		for _, condition in ipairs(conditions) do
			if condition(faction_key, metadata) then
				return true
			end
		end

		return false
	end
end

function ambitions.helper.condition.AND(conditions)
	return function(faction_key, metadata)
		for _, condition in ipairs(conditions) do
			if not condition(faction_key, metadata) then
				return false
			end
		end

		return true
	end
end

function ambitions.helper.condition.NOT(condition)
	return function(faction_key, metadata)
		return not condition(faction_key, metadata)
	end
end

-- Checks whether a province exists that the player owns the capital region of that
-- province and an enemy owns another region in that same province that borders ours.
function ambitions.helper.condition.player_has_province_capital_with_adjacent_enemy_region_in_same_province()
	return function(faction_key, metadata)
		local province = owning_province_capital_with_adjacent_enemy_region_in_same_province(faction_key)
		return province ~= nil
	end
end

-- Options accept:
--- options = {
--- 	faction_to_check,			-- Check for this faction instead of the player faction
--- 	is_province_capital,		-- Checks whether the region is a province capital
--- 	is_abandoned,				-- Checks whether the region is abandoned
--- 	is_enemy,					-- Checks whether the region owner is at war with us
--- 	is_subject,					-- Checks whether the region owner is our subject
--- 	we_are_subject_of,			-- Checks whether we are the subject of the region owner
--- 	is_allied,					-- Checks whether we're in an alliance with the region owner
---		is_specific_faction,		-- Checks whether the faction is a specific faction you ask for
--- 	is_sacred_egyptian,			-- Checks whether the region is an SEL
--- 	is_sacred_hittite,			-- Checks whether the region is an SHL
--- 	is_sacred_aegean,			-- Checks whether the region is a sacred aegean land
--- 	is_sacred_mesopotamian,		-- Checks whether the region is a sacred mesopotamian land
--- 	is_sacred_any,				-- Checks whether the region is either an SEL or SHL
--- 	is_different_subculture,	-- Checks whether the region owner is a different subculture from ours
--- 	owner_min_regions,			-- Checks whether the region owner has equal to or more regions than specified
--- 	owner_max_regions,			-- Checks whether the region owner has equal to or less regions than specified
--- 	owner_min_armies,			-- Checks whether the region owner has equal to or more armies than specified
--- 	owner_max_armies,			-- Checks whether the region owner has equal to or less armies than specified
---     production_type,            -- Checks whether the region settlement's production type is one of the specified ones. Must be a table, e.g. { "production_type1", "production_type2" }
---     has_POI,                    -- Checks whether the region has a POI (Place of Interest) currently built in any of its construction slots
---     check_horde_regions         -- Checks for neighbouring regions of owned regions and if no owned regions - of regions containing own horde armies
---     only_check_horde_regions    -- Checks for neighbouring regions of horde armies only (not for regions neighbouring owned regions)
--- }
-- Will fill "metadata.regions_list" with the regions fulfilling the condition on success
function ambitions.helper.condition.bordering_regions_between(min_regions, max_regions, options)
	if not options then
		options = {}
	end

	return function(faction_key, metadata)
		return get_bordering_regions(faction_key, metadata, min_regions, max_regions, options) and true
	end
end

function ambitions.helper.condition.bordering_regions_at_least(min_regions, options)
	return ambitions.helper.condition.bordering_regions_between(min_regions, min_regions - 1, options)
end

function ambitions.helper.condition.bordering_regions_at_most(max_regions, options)
	return ambitions.helper.condition.bordering_regions_between(really_small_number, max_regions, options)
end

function ambitions.helper.condition.is_region_abandoned(region_key)
    return function(faction_key, metadata)
        local region = cm:get_region(region_key)

        if region:is_abandoned() then
            return true
        end

        return false
    end
end

-- Options accept:
--- options = {
--- 	region_options = { the same stuff from bordering_regions_between() }
--- }
function ambitions.helper.condition.num_armies_of_bordering_factions_between(min_armies, max_armies, options)
	if not options then
		options = {}
	end

	return function(faction_key, metadata)
		local bordering_regions = get_bordering_regions(faction_key, metadata, 0, 99999, options.region_options or {}) or {}

		local total_armies = 0
		local checked_factions = {}

		for _, region_key in ipairs(bordering_regions) do
			local region = cm:get_region(region_key)
			local region_owner = region:owning_faction()
			local region_owner_key = region_owner:name()
			if not checked_factions[region_owner_key] then
				checked_factions[region_owner_key] = true
				total_armies = region_owner:num_generals() + total_armies

				if total_armies >= min_armies and max_armies < min_armies then
					return true
				elseif total_armies > max_armies then
					return false
				end
			end
		end

		return total_armies >= min_armies and total_armies <= max_armies
	end
end

function ambitions.helper.condition.num_armies_of_bordering_factions_at_least(min_armies, options)
	return ambitions.helper.condition.num_armies_of_bordering_factions_between(min_armies, min_armies - 1, options)
end

function ambitions.helper.condition.num_armies_of_bordering_factions_at_most(max_armies, options)
	return ambitions.helper.condition.num_armies_of_bordering_factions_between(really_small_number, max_armies, options)
end

-- If min_strength or max_strength is "own" will use your faction's strength
-- Options accept:
--- options = {
--- 	region_options = { the same stuff from bordering_regions_between() }
--- }
function ambitions.helper.condition.strength_of_bordering_factions_between(min_strength_param, max_strength_param, options)
	if not options then
		options = {}
	end

	return function(faction_key, metadata)
		local bordering_regions = get_bordering_regions(faction_key, metadata, 0, 99999, options.region_options or {}) or {}

		local total_strength = 0
		local checked_factions = {}

		local min_strength
		local max_strength

		if min_strength_param == "own" then
			min_strength = cm:get_faction(faction_key):strength()
		else
			min_strength = min_strength_param
		end

		if max_strength_param == "own" then
			max_strength = cm:get_faction(faction_key):strength()
		else
			max_strength = max_strength_param
		end

		for _, region_key in ipairs(bordering_regions) do
			local region = cm:get_region(region_key)
			local region_owner = region:owning_faction()
			local region_owner_key = region_owner:name()
			if not checked_factions[region_owner_key] then
				checked_factions[region_owner_key] = true
				total_strength = region_owner:strength() + total_strength

				if total_strength >= min_strength and max_strength < min_strength then
					return true
				elseif total_strength > max_strength then
					return false
				end
			end
		end

		return total_strength >= min_strength and total_strength <= max_strength
	end
end

function ambitions.helper.condition.strength_of_bordering_factions_at_least(min_strength, options)
	return ambitions.helper.condition.strength_of_bordering_factions_between(min_strength, really_small_number, options)
end

function ambitions.helper.condition.strength_of_bordering_factions_at_most(max_strength, options)
	return ambitions.helper.condition.strength_of_bordering_factions_between(really_small_number, max_strength, options)
end

-- If min_regions or max_regions is a number between 0 and 1 will convert them to a percent of the player's total regions.
-- E.g. if min_regions is 0.3 then the minimum regions is 3 if the player has 10 regions (0.3 * num_player_regions)
-- Options accept:
--- options = {
--- 	is_sacred_egyptian,	-- Checks whether the region is an SEL
--- 	is_sacred_hittite,	-- Checks whether the region is an SHL
--- 	is_sacred_aegean,	-- Checks whether the region is a sacred aegaen land
--- 	is_sacred_mesopotamian,	-- Checks whether the region is a sacred mesopotamian land
---     min_happiness,      -- Checks whether the happiness of the region is above this
---     max_happiness,      -- Checks whether the happiness of the region is bellow this
---     min_growth,         -- Checks whether the growth of the region is above this
---     max_growth,         -- Checks whether the growth of the region is bellow this
--- }
function ambitions.helper.condition.num_owned_regions_between(min_regions, max_regions, options)
	return ambitions.helper.condition.target_faction_num_regions_between(nil, min_regions, max_regions, options)
end

function ambitions.helper.condition.num_owned_regions_at_least(min_regions, options)
	return ambitions.helper.condition.num_owned_regions_between(min_regions, min_regions - 1, options)
end

function ambitions.helper.condition.num_owned_regions_at_most(max_regions, options)
	return ambitions.helper.condition.num_owned_regions_between(really_small_number, max_regions, options)
end

-- Options accept:
--- options = {
---		realms,   			-- a list of keys for realms
---     as_percentage, 		-- Define an option that allow use of percentage instead of strict numbers
--- }
function ambitions.helper.condition.have_regions_in_realm_between(min_regions, max_regions, options)
	if not options then
		options = {}
	end

	return function(faction_key, metadata)

		local min = min_regions
		local max = max_regions

		options.required_regions = {}

		if is_table(options.realms) then
			for _, realm_key in ipairs(options.realms) do
				local regions = phar_realms.get_regions_for_realm(realm_key)
				table_append(options.required_regions, regions)
			end

			if options.as_percentage then 
				min = math.round((min_regions / 100) * #options.required_regions)
				max = math.round((max_regions / 100) * #options.required_regions)
		    end 
		end
	
		local check_function = ambitions.helper.condition.num_owned_regions_between(min, max, options)
		return check_function(faction_key, metadata)
	end
end

function ambitions.helper.condition.have_regions_in_realm_at_least(min_regions, options)
	return ambitions.helper.condition.have_regions_in_realm_between(min_regions, min_regions - 1, options)
end

function ambitions.helper.condition.have_regions_in_realm_at_most(max_regions, options)
	return ambitions.helper.condition.have_regions_in_realm_between(really_small_number, max_regions, options)
end

-- Options accept:
--- options = {
--- 	unit_set,	-- Checks whether the unit belongs to one of the specified unit sets. Accepts a table
---		is_ranged,	-- Checks whether the unit uses a ranged weapon as their primary weapon
--- }
function ambitions.helper.condition.num_units_between(min_units, max_units, options)
	local check_units = function(faction_key, metadata, military_force)
		local num_units = 0
		local unit_list = military_force:unit_list()
		for i = 0, unit_list:num_items() - 1 do
			local unit = unit_list:item_at(i)
			if (is_nil(options.unit_set) or (is_table(options.unit_set) and table_find(options.unit_set, function(unit_set) return unit:belongs_to_unit_set(unit_set) end)))
				and (is_nil(options.is_ranged) or (to_bool(options.is_ranged) == unit:is_ranged()))
			then
				num_units = 1 + num_units
			end
		end
		return num_units
	end
	return function(faction_key, metadata)
		local num_units = 0
		local military_force_list = cm:get_faction(faction_key):military_force_list()
		for i = 0, military_force_list:num_items() - 1 do
			local military_force = military_force_list:item_at(i)
			-- Excluding regular garrisons but including fort garrisons
			if not military_force:is_armed_citizenry()
				or (not military_force:garrison_residence():is_null_interface()
					and military_force:garrison_residence():is_slot())
			then
				if not options then
					num_units = num_units + military_force:unit_list():num_items()
				else
					num_units = num_units + check_units(faction_key, metadata, military_force)
				end
			end
		end
		return num_units >= min_units and (num_units <= max_units or max_units < min_units)
	end
end

function ambitions.helper.condition.num_units_at_least(min_units, options)
	return ambitions.helper.condition.num_units_between(min_units, min_units - 1, options)
end

function ambitions.helper.condition.num_units_at_most(max_units, options)
	return ambitions.helper.condition.num_units_between(really_small_number, max_units, options)
end

function ambitions.helper.condition.num_generals_between(min_generals, max_generals)
	return function(faction_key, metadata)
		local num_generals = cm:get_faction(faction_key):num_generals()
		return num_generals >= min_generals and (num_generals <= max_generals or max_generals < min_generals)
	end
end

function ambitions.helper.condition.own_at_least_N_nomad_outposts_in_own_territory(target_num_nomad_outposts)
	return function(faction_key, metadata)
		return tribes_privileges.calculate_num_nomad_outposts_of_faction_in_own_territory(faction_key) >= target_num_nomad_outposts
	end
end

function ambitions.helper.condition.own_at_most_N_nomad_outposts_in_own_territory(target_num_nomad_outposts)
	return function(faction_key, metadata)
		return tribes_privileges.calculate_num_nomad_outposts_of_faction_in_own_territory(faction_key) <= target_num_nomad_outposts
	end
end

function ambitions.helper.condition.own_between_N_nomad_outposts_in_own_territory(target_num_nomad_outposts_min, target_num_nomad_outposts_max)
	return function(faction_key, metadata)
		return  ambitions.helper.condition.own_at_most_N_nomad_outposts_in_own_territory(target_num_nomad_outposts_max)(faction_key, metadata)
				and ambitions.helper.condition.own_at_least_N_nomad_outposts_in_own_territory(target_num_nomad_outposts_min)(faction_key, metadata)
	end
end

function ambitions.helper.condition.own_at_least_N_nomad_outposts_in_foreign_territory(target_num_nomad_outposts)
	return function(faction_key, metadata)
		return tribes_privileges.calculate_num_nomad_outposts_of_faction_in_foreign_territory(faction_key) >= target_num_nomad_outposts
	end
end

function ambitions.helper.condition.own_at_most_N_nomad_outposts_in_foreign_territory(target_num_nomad_outposts)
	return function(faction_key, metadata)
		return tribes_privileges.calculate_num_nomad_outposts_of_faction_in_foreign_territory(faction_key) <= target_num_nomad_outposts
	end
end

function ambitions.helper.condition.own_between_N_nomad_outposts_in_foreign_territory(target_num_nomad_outposts_min, target_num_nomad_outposts_max)
	return function(faction_key, metadata)
		return  ambitions.helper.condition.own_at_most_N_nomad_outposts_in_foreign_territory(target_num_nomad_outposts_max)(faction_key, metadata)
				and ambitions.helper.condition.own_at_least_N_nomad_outposts_in_foreign_territory(target_num_nomad_outposts_min)(faction_key, metadata)
	end
end

function ambitions.helper.condition.own_at_least_N_nomad_outposts_in_razed_territory(target_num_nomad_outposts)
	return function(faction_key, metadata)
		return tribes_privileges.calculate_num_nomad_outposts_of_faction_in_razed_territory(faction_key) >= target_num_nomad_outposts
	end
end

function ambitions.helper.condition.own_at_most_N_nomad_outposts_in_razed_territory(target_num_nomad_outposts)
	return function(faction_key, metadata)
		return tribes_privileges.calculate_num_nomad_outposts_of_faction_in_razed_territory(faction_key) <= target_num_nomad_outposts
	end
end

function ambitions.helper.condition.own_between_N_nomad_outposts_in_razed_territory(target_num_nomad_outposts_min, target_num_nomad_outposts_max)
	return function(faction_key, metadata)
		return  ambitions.helper.condition.own_at_most_N_nomad_outposts_in_razed_territory(target_num_nomad_outposts_max)(faction_key, metadata)
				and ambitions.helper.condition.own_at_least_N_nomad_outposts_in_razed_territory(target_num_nomad_outposts_min)(faction_key, metadata)
	end
end

function ambitions.helper.condition.num_generals_at_least(min_generals)
	return ambitions.helper.condition.num_generals_between(min_generals, min_generals - 1)
end

function ambitions.helper.condition.num_generals_at_most(max_generals)
	return ambitions.helper.condition.num_generals_between(really_small_number, max_generals)
end

function ambitions.helper.condition.turn_number_between(min_turns, max_turns)
	return function(faction_key, metadata)
		local turn_number = cm:turn_number()
		if max_turns == nil or max_turns < min_turns then max_turns = 99999 end
		return turn_number >= min_turns and (turn_number <= max_turns or max_turns < min_turns)
	end
end

function ambitions.helper.condition.turn_number_at_least(min_turns)
	return ambitions.helper.condition.turn_number_between(min_turns, min_turns - 1)
end

function ambitions.helper.condition.turn_number_at_most(max_turns)
	return ambitions.helper.condition.turn_number_between(really_small_number, max_turns)
end

function ambitions.helper.condition.resource_value_between(resource_key, min_resource, max_resource)
	return function(faction_key, metadata)
		local current_amount = cm:get_faction(faction_key):pooled_resource(resource_key):value()
		return current_amount >= min_resource and (current_amount <= max_resource or max_resource < min_resource)
	end
end

function ambitions.helper.condition.resource_value_at_least(resource_key, min_resource)
	return ambitions.helper.condition.resource_value_between(resource_key, min_resource, min_resource - 1)
end

function ambitions.helper.condition.resource_value_at_most(resource_key, max_resource)
	return ambitions.helper.condition.resource_value_between(resource_key, really_small_number, max_resource)
end

function ambitions.helper.condition.resource_income_between(resource_key, min_income, max_income)
	return function(faction_key, metadata)
		local current_income = cm:get_faction(faction_key):pooled_resource(resource_key):income()
		return current_income >= min_income and (current_income <= max_income or max_income < min_income)
	end
end

function ambitions.helper.condition.resource_income_at_least(resource_key, min_income)
	return ambitions.helper.condition.resource_income_between(resource_key, min_income, min_income - 1)
end

function ambitions.helper.condition.resource_income_at_most(resource_key, max_income)
	return ambitions.helper.condition.resource_income_between(resource_key, really_small_number, max_income)
end

function ambitions.helper.condition.have_building(building_key)
	return function(faction_key, metadata)
		local faction = cm:get_faction(faction_key)
		return faction:building_exists(building_key)
	end
end

function ambitions.helper.condition.does_not_have_building(building_key)
	return function(faction_key, metadata)
		return not ambitions.helper.condition.have_building(building_key)(faction_key)
	end
end

function ambitions.helper.condition.building_chains_available(building_chain_keys, how_many)
	if is_nil(how_many) then
		how_many = #building_chain_keys
	end

	return function(faction_key, metadata)
		local faction = cm:get_faction(faction_key)
		local available_building_chains = faction:all_available_building_chains()
		local available_so_far = 0

		for _, available_chain in ipairs(available_building_chains) do
			for i = #building_chain_keys, 1, -1 do
				local chain_key = building_chain_keys[i]

				if available_chain == chain_key then
					table.remove(building_chain_keys, i)
					available_so_far = 1 + available_so_far

					if #building_chain_keys == 0 or available_so_far >= how_many then
						return true
					end

					break
				end
			end
		end

		return false
	end
end

function ambitions.helper.condition.num_barter_agreements_between(min_barter_agreements, max_barter_agreements)
	return function(faction_key, metadata)
		local num_barter_agreements = cm:get_faction(faction_key):factions_bartering_with():num_items()
		return num_barter_agreements >= min_barter_agreements and (num_barter_agreements <= max_barter_agreements or max_barter_agreements < min_barter_agreements)
	end
end

function ambitions.helper.condition.num_barter_agreements_at_least(min_barter_agreements)
	return ambitions.helper.condition.num_barter_agreements_between(min_barter_agreements, min_barter_agreements - 1)
end

function ambitions.helper.condition.num_barter_agreements_at_most(max_barter_agreements)
	return ambitions.helper.condition.num_barter_agreements_between(really_small_number, max_barter_agreements)
end

function ambitions.helper.condition.at_war()
	return function(faction_key, metadata)
		local faction = cm:get_faction(faction_key)
		return faction:at_war()
	end
end

-- Options accept:
--- options = {
--- 	min_attitude,	-- Checks whether the faction's attitude is at least this towards us
--- 	max_attitude,	-- Checks whether the faction's attitude is at most this towards us
--- }
function ambitions.helper.condition.num_met_factions_between(min_factions, max_factions, options)
	return function(faction_key, metadata)
		local player_faction = cm:get_faction(faction_key)
		local met_factions_list = player_faction:factions_met()
		local total_factions = 0

		for i = 0, met_factions_list:num_items() - 1 do
			local met_faction = met_factions_list:item_at(i)
			local attitude_towards_player = met_faction:diplomatic_attitude_towards(faction_key)

			if (is_nil(options.min_attitude) or attitude_towards_player >= options.min_attitude)
				and (is_nil(options.max_attitude) or attitude_towards_player <= options.max_attitude)
			then
				total_factions = total_factions + 1

				if total_factions >= min_factions and max_factions < min_factions then
					return true
				elseif total_factions > max_factions then
					return false
				end
			end
		end

		return total_factions >= min_factions and total_factions <= max_factions
	end
end

function ambitions.helper.condition.num_met_factions_at_least(min_factions, options)
	return ambitions.helper.condition.num_met_factions_between(min_factions, min_factions - 1, options)
end

function ambitions.helper.condition.num_met_factions_at_most(max_factions, options)
	return ambitions.helper.condition.num_met_factions_between(really_small_number, max_factions, options)
end

-- Options accept:
--- options = {
--- 	is_infrastructure,	-- Checks whether the slot is an infrastructure slot
--- 	is_ERS, 			-- Same as is_infrastructure
--- 	has_building, 		-- Checks whether the slot has a building
--- 	tier, 				-- Checks if the building is at least of this tier
---		building_set,		-- Checks if the building belongs to this building set (Use building_set_key)
--- }
function ambitions.helper.condition.num_region_slots_between(min_slots, max_slots, options)
	return function(faction_key, metadata)
		local player_faction = cm:get_faction(faction_key)
		local region_list = player_faction:region_list()
		local total_slots = 0

		for i = 0, region_list:num_items() - 1 do
			local region = region_list:item_at(i)
			local slot_list = region:slot_list()

			for j = 0, slot_list:num_items() - 1 do
				local slot = slot_list:item_at(j)
				
				local has_building = slot:has_building()
				if (is_nil(options.is_infrastructure) or options.is_infrastructure == to_bool(slot:is_infrastructure_slot()))
					and (is_nil(options.is_ERS)       or options.is_ERS            == to_bool(slot:is_infrastructure_slot()))
					and (is_nil(options.has_building) or options.has_building      == to_bool(has_building))
					and (is_nil(options.tier)         or (has_building and slot:building():ui_level() >= options.tier))
					and (is_nil(options.building_set) or (has_building and slot:building():belongs_to_building_set(options.building_set))) == true
				then
					total_slots = total_slots + 1

					if total_slots >= min_slots and max_slots < min_slots then
						return true, total_slots
					elseif total_slots > max_slots then
						return false, total_slots
					end
				end
			end

		end

		return total_slots >= min_slots and total_slots <= max_slots, total_slots
	end
end

function ambitions.helper.condition.num_region_slots_at_least(min_slots, options)
	return ambitions.helper.condition.num_region_slots_between(min_slots, min_slots - 1, options)
end

function ambitions.helper.condition.num_region_slots_at_most(max_slots, options)
	return ambitions.helper.condition.num_region_slots_between(really_small_number, max_slots, options)
end

function ambitions.helper.condition.has_technology(tech_key)
	return function(faction_key, metadata)
		return cm:get_faction(faction_key):has_technology(tech_key)
	end
end

function ambitions.helper.condition.faction_leader_located_in_provinces(province_list)
	return function(faction_key, metadata)
		local faction_leader = cm:get_faction(faction_key):faction_leader()
		local region = faction_leader:region()
		if (not region) or region:is_null_interface() then
			return false
		end

		local province_key = region:province_name()
		return table_contains(province_list, province_key)
	end
end

function ambitions.helper.condition.is_target_faction(target_faction_key)
	return function(faction_key, metadata)
		return faction_key == target_faction_key
	end
end

function ambitions.helper.condition.is_faction_alive(target_faction_key)
    return function(faction_key, metadata)
        local faction = cm:get_faction(target_faction_key)
        return not faction:is_dead()
    end
end

function ambitions.helper.condition.is_target_faction_culture(target_faction_culture_key)
	return function(faction_key, metadata)
		return cm:get_faction(faction_key):culture() == target_faction_culture_key
	end
end

function ambitions.helper.condition.has_completed_at_least_N_faction_specific_ambitions(num_ambitions)
	return function(faction_key, metadata)
		local misc_data = ambitions.misc_data[faction_key]
		if not misc_data then
			return false
		end

		return misc_data.num_faction_specific_ambitions_completed >= num_ambitions
	end
end

function ambitions.helper.condition.faction_leader_level_between(min_level, max_level)
	return function(faction_key, metadata)
		local faction = cm:get_faction(faction_key)
		local faction_leader = faction:faction_leader()
		local rank = faction_leader:rank()

		return rank >= min_level and (rank <= max_level or max_level < min_level)
	end
end

function ambitions.helper.condition.faction_leader_level_at_least(min_level)
	return ambitions.helper.condition.faction_leader_level_between(min_level, really_small_number)
end

function ambitions.helper.condition.faction_leader_level_at_most(max_level)
	return ambitions.helper.condition.faction_leader_level_between(really_small_number, max_level)
end

function ambitions.helper.condition.num_characters_with_level_between(min_characters, max_characters, min_level, max_level)
	return function(faction_key, metadata)
		local faction = cm:get_faction(faction_key)
		local character_list = faction:character_list()

		local num_characters = 0

		for i = 0, character_list:num_items() - 1 do
			local char = character_list:item_at(i)
			if (char:rank() >= min_level) and (char:rank() <= max_level) then
				num_characters = num_characters + 1

				if num_characters >= min_characters and max_characters < min_characters then
					return true
				end
			end
		end

		return num_characters >= min_characters and (num_characters <= max_characters or max_characters < min_characters)
	end
end

function ambitions.helper.condition.at_least_X_characters_with_level_between(min_characters, min_level, max_level)
	return ambitions.helper.condition.num_characters_with_level_between(min_characters, min_characters - 1, min_level, max_level)
end

function ambitions.helper.condition.at_most_X_characters_with_level_between(max_characters, min_level, max_level)
	return ambitions.helper.condition.num_characters_with_level_between(really_small_number, max_characters, min_level, max_level)
end

function ambitions.helper.condition.is_pharaoh()
	return function(faction_key, metadata)
		return egypt_political_states:is_sitting_pharaoh(faction_key)
	end
end

function ambitions.helper.condition.is_great_king()
	return function(faction_key, metadata)
		return hatti_political_states:is_sitting_great_king(faction_key)
	end
end

-- Accepts "any", "egyptian", "hittite", "aegean" and "mesopotamian"
function ambitions.helper.condition.is_sitting_ruler_of_legitimacy_path(legitimacy_path)
	return function(faction_key, metadata)
		local legitimacy_object
		if legitimacy_path == "any" then
			legitimacy_object = legitimacy_choice:get_unlocked_legitimacy(faction_key)
		else
			legitimacy_object = chosen_path_to_legitimacy()[legitimacy_path]
		end

		return to_bool(legitimacy_object and legitimacy_object.political_states_system:is_sitting_ruler(faction_key))
	end
end

-- Goal is to check if a target faction has below or above a certain amount of regions
function ambitions.helper.condition.target_faction_num_regions_between(target_faction_name, min_regions, max_regions, options)
	if is_nil(options) then
		return function(faction_key)
			if not is_nil(target_faction_name) then
				faction_key = target_faction_name
			end

			local num_regions = cm:get_faction(faction_key):num_regions()
			return num_regions >= min_regions and (num_regions <= max_regions or max_regions < min_regions), num_regions
		end
	end

	return function(faction_key, metadata)
		if not is_nil(target_faction_name) then
			faction_key = target_faction_name
		end

		local owned_regions = 0
		local faction = cm:get_faction(faction_key)
		local region_list = faction:region_list()
		local min = min_regions
		local max = max_regions

		if min > 0 and min < 1 then
			min = min * faction:num_regions()
		end

		if max > 0 and max < 1 then
			max = max * faction:num_regions()
		end

		for i = 0, region_list:num_items() - 1 do
			local region = region_list:item_at(i)
			local region_key = region:name()

			if      (is_nil(options.is_sacred_egyptian)     or options.is_sacred_egyptian     == to_bool(sacred_egypt_lands[region_key]))
				and (is_nil(options.is_sacred_hittite)      or options.is_sacred_hittite      == to_bool(sacred_hatti_lands[region_key]))
				and (is_nil(options.is_sacred_aegean)       or options.is_sacred_aegean       == to_bool(sacred_aeg_lands[region_key]))
				and (is_nil(options.is_sacred_mesopotamian) or options.is_sacred_mesopotamian == to_bool(sacred_meso_lands[region_key]))
				and (is_nil(options.min_happiness)          or region:public_order() >= options.min_happiness)
				and (is_nil(options.max_happiness)          or region:public_order() <= options.max_happiness)
				and (is_nil(options.min_growth)             or region:faction_province_growth_per_turn() >= options.min_growth)
				and (is_nil(options.max_growth)             or region:faction_province_growth_per_turn() <= options.max_growth)
				and (is_nil(options.required_regions)       or table_contains(options.required_regions, region_key))
				and (is_nil(options.is_poc)                 or pillars_civilization.is_pillar_region(region_key) == options.is_poc)
			then
				owned_regions = 1 + owned_regions

				if owned_regions >= min and max < min then
					return true, owned_regions
				end
			end
		end

		return owned_regions >= min and owned_regions <= max, owned_regions
	end
end

function ambitions.helper.condition.target_faction_num_regions_at_least(target_faction_name, min_regions, options)
	return ambitions.helper.condition.target_faction_num_regions_between(target_faction_name, min_regions, min_regions - 1, options)
end

function ambitions.helper.condition.target_faction_num_regions_at_most(target_faction_name, max_regions, options)
	return ambitions.helper.condition.target_faction_num_regions_between(target_faction_name, really_small_number, max_regions, options)
end

function ambitions.helper.condition.target_faction_attitude_between(target_faction_key, min_attitude, max_attitude)
	return function(faction_key, metadata)
		local target_faction = cm:get_faction(target_faction_key)
		if target_faction then
			local attitude_value = target_faction:diplomatic_attitude_towards(faction_key)
			return attitude_value >= min_attitude and (attitude_value <= max_attitude or max_attitude < min_attitude)
		end
		return false
	end
end

function ambitions.helper.condition.target_faction_attitude_at_least(target_faction_key, min_attitude)
	return ambitions.helper.condition.target_faction_attitude_between(target_faction_key, min_attitude, min_attitude - 1)
end

function ambitions.helper.condition.target_faction_attitude_at_most(target_faction_key, max_attitude)
	return ambitions.helper.condition.target_faction_attitude_between(target_faction_key, really_small_number, max_attitude)
end

-- Accepts "any", "none", "egyptian", "hittite", "aegean" and "mesopotamian"
function ambitions.helper.condition.chosen_legitimacy_path(chosen_path)
	return function(faction_key, metadata)
		if chosen_path == "any" then
			return legitimacy_choice:any_legitimacy_unlocked(faction_key)
		end

		return legitimacy_choice:legitimacy_unlocked(chosen_path_to_legitimacy()[chosen_path], faction_key)
	end
end

function ambitions.helper.condition.is_player_worshipping_specific_deity(target_god_name)
    return function(faction_key, metadata)

		if not is_table(deities.persistent[faction_key]) then
            return false
        end

		local god_slots = deities.get_god_slots(faction_key)
        local god_slots_count = deities.get_faction_god_slots_count(faction_key)

		for i = 1, god_slots_count do
			if god_slots[i].god_key == target_god_name then
                return true
            end
        end

        return false
    end
end

function ambitions.helper.condition.has_tribe_cell_for_at_least_N_turns_except(min_turns, excluded_cell_bundle_key)
	return function(faction_key, metadata)
		local tribes_faction_data = tribes_privileges.persistent.factions[faction_key]
		if not tribes_faction_data then
			return false
		end

		return tribes_faction_data.num_turns_in_current_cell >= min_turns and tribes_faction_data.current_cell_bundle_key ~= excluded_cell_bundle_key
	end
end

function ambitions.helper.condition.has_enough_eminence(min_eminence)
	return ambitions.helper.condition.resource_value_between("phar_eminence", min_eminence, min_eminence - 1)
end

function ambitions.helper.condition.is_desired_civilization(target_civilization_level)
	return function(faction_key, metadata)
		return pillars_civilization.get_current_civilization_level().name == target_civilization_level
	end
end

function ambitions.helper.condition.has_dynasty()
	return function(faction_key, metadata)
		local faction = cm:get_faction(faction_key)
		return faction:has_dynasty()
	end
end

function ambitions.helper.condition.between_N_non_aggression_pacts(min_pacts, max_pacts, options)
	return function(faction_key, metadata)
		if not options then
			options = {}
		end

		local faction = cm:get_faction(faction_key)
		local non_aggression_pacts_meeting_criteria = 0
		local factions_non_aggression_pact_with = faction:factions_non_aggression_pact_with()
		if options.factions_share_legitimacy_path then
			local faction_unlocked_legitimacy = legitimacy_choice:get_unlocked_legitimacy(faction_key)

			for i = 0, factions_non_aggression_pact_with:num_items() - 1 do
				local other_faction = factions_non_aggression_pact_with:item_at(i)
				local other_faction_unlocked_legitimacy = legitimacy_choice:get_unlocked_legitimacy(other_faction:name())
				if faction_unlocked_legitimacy and other_faction_unlocked_legitimacy and
					faction_unlocked_legitimacy.config.id == other_faction_unlocked_legitimacy.config.id
				then
					non_aggression_pacts_meeting_criteria = non_aggression_pacts_meeting_criteria + 1
				end
			end
		else
			non_aggression_pacts_meeting_criteria = factions_non_aggression_pact_with:num_items()
		end

		return non_aggression_pacts_meeting_criteria >= min_pacts and (non_aggression_pacts_meeting_criteria <= max_pacts or max_pacts < min_pacts)
	end
end

function ambitions.helper.condition.at_least_N_non_aggression_pacts(min_pacts, options)
	return ambitions.helper.condition.between_N_non_aggression_pacts(min_pacts, min_pacts - 1, options)
end

function ambitions.helper.condition.at_most_N_non_aggression_pacts(max_pacts, options)
	return ambitions.helper.condition.between_N_non_aggression_pacts(really_small_number, max_pacts, options)
end

function ambitions.helper.condition.has_heir()
	return function(faction_key, metadata)
		local faction = cm:get_faction(faction_key)
		local heir = faction:faction_heir()
		return not heir:is_null_interface()
	end
end

function ambitions.helper.condition.heir_has_court_position()
	return function(faction_key, metadata)
		local faction = cm:get_faction(faction_key)
		local faction_heir = faction:faction_heir()
		if faction_heir:is_null_interface() then
			return false
		end

		local faction_heir_character = faction_heir:character()
		if (not faction_heir_character or faction_heir_character:is_null_interface()) then
			return false
		end

		local faction_court_for_faction = court.util_functions.get_faction_court_for_faction(faction_key)
		if faction_court_for_faction then
			for _, position in ipairs(court.position_templates) do
				local position_obj = court.util_functions.get_court_position(faction_court_for_faction, position.name, true)
				if position_obj and position_obj.persistent.current_holder then
					local targeted_character = cm:get_character(position_obj.persistent.current_holder)
					if not targeted_character:is_null_interface() then
						if targeted_character:command_queue_index() == faction_heir_character:command_queue_index() then
							return true
						end
					end
				end	
			end
		end

		return false
	end
end

function ambitions.helper.condition.faction_heir_is_in_region_neighbouring_enemy_region()
	return function(faction_key, metadata)
		local faction = cm:get_faction(faction_key)
		local faction_heir = faction:faction_heir()
		if faction_heir:is_null_interface() then
			return false
		end

		local faction_heir_character = faction_heir:character()
		if (not faction_heir_character or faction_heir_character:is_null_interface()) then
			return false
		end

		if not faction_heir_character:has_region() then
			return false
		end

		local region = faction_heir_character:region()
		local adjacent_regions = region:adjacent_region_list()
		for i = 0, adjacent_regions:num_items() - 1 do
			local adjacent_region = adjacent_regions:item_at(i)
			local region_owner = adjacent_region:owning_faction()
			if faction:at_war_with(region_owner) then
				return true
			end
		end

		return false
	end
end

function ambitions.helper.condition.is_dynasty_ruler()
	return function(faction_key, metadata)
		local faction = cm:get_faction(faction_key)
		return faction:is_dynasty_ruler()
	end
end

function ambitions.helper.condition.has_subject_with_no_dynasty()
	return function(faction_key, metadata)
		local faction = cm:get_faction(faction_key)
		local subjects = faction:factions_sovereign_of()
		for i = 0, subjects:num_items() - 1 do
			local subject = subjects:item_at(i)
			if not subject:has_dynasty() then
				return true
			end
		end

		return false
	end
end

function ambitions.helper.condition.sargon_grand_ambitions_unlocked()
	return function(faction_key, metadata)
		local claimed_legacies = ancient_legacy_common:faction_claimed_legacies(faction_key)
		local sargon_legacy = is_table(claimed_legacies) and claimed_legacies["phar_ancient_legacy_sargon"]

		return sargon_legacy and sargon_legacy:grand_ambitions_are_unlocked()
	end
end


function ambitions.helper.condition.control_at_least_X_provinces(min_provinces)
	return function(faction_key, metadata)
		return faction_controls_more_than_X_provinces(faction_key, min_provinces)
	end
end 

function ambitions.helper.condition.has_active_ambition(ambitions)
	return function(faction_key, metadata)
		local active_ambitions = ambitions.get_active_ambitions_for_faction(faction_key)

		for _, ambition_key in ipairs(ambitions) do
			if table_find(active_ambitions, function(active_ambition) return active_ambition.ambition_key == ambition_key end) then
				return true
			end
		end
		
		return false
	end
end

------------------------------------------------------------
------------------------ Objectives ------------------------
------------------------------------------------------------

-- Options accept:
--- options = {
--- 	is_province_capital,-- Checks whether the region is a province capital
--- 	is_adjacent,		-- Checks whether the region is adjacent to one of our other regions
--- 	is_colonized,		-- Checks whether the region was colonized
--- 	is_sacred_egyptian,	-- Checks whether the region is an SEL
--- 	is_sacred_hittite,	-- Checks whether the region is an SHL
--- 	is_sacred_aegean,	-- Checks whether the region is a sacred aegean land
--- 	is_sacred_mesopotamian,	-- Checks whether the region is a sacred mesopotamian land
--- 	is_sacred_any,		-- Checks whether the region is either an SEL or SHL
---		have_own_region_in_province, -- Checks whether we own a region in the same province.
--- }
function ambitions.helper.objective.conquer_region(display_text, options)
	if not options then
		options = {}
	end

	return {
		objective = "SCRIPTED",
		display_text = display_text,
		event = "RegionFactionChangeEvent",
		check = function(context, faction_key, metadata)
			local conquered_region = context:region()
			local conquered_region_key = conquered_region:name()
			local previous_owner = context:previous_faction()

			local check_if_we_own_region_in_province = function(province)
				local regions_list = province:regions()
				for i = 0, regions_list:num_items() - 1 do
					if not regions_list:item_at(i):owning_faction():is_rebel() and regions_list:item_at(i):owning_faction():name() == faction_key then
						return true
					end
				end

				return false
			end

			return conquered_region:owning_faction():name() == faction_key
				and (is_nil(options.is_province_capital)         or options.is_province_capital    == to_bool(conquered_region:is_province_capital()))
				and (is_nil(options.is_abandoned)                or options.is_abandoned           == to_bool(previous_owner:name() == "rebels"))
				and (is_nil(options.is_enemy)                    or options.is_enemy               == to_bool(previous_owner:at_war_with(conquered_region:owning_faction())))
				and (is_nil(options.is_adjacent)                 or options.is_adjacent            == to_bool(region_borders_faction(conquered_region, faction_key)))
				and (is_nil(options.is_colonized)                or options.is_colonized           == to_bool(previous_owner:is_rebel()))
				and (is_nil(options.is_sacred_egyptian)          or options.is_sacred_egyptian     == to_bool(sacred_egypt_lands[conquered_region_key]))
				and (is_nil(options.is_sacred_hittite)           or options.is_sacred_hittite      == to_bool(sacred_hatti_lands[conquered_region_key]))
				and (is_nil(options.is_sacred_aegean)            or options.is_sacred_aegean       == to_bool(sacred_aeg_lands[conquered_region_key]))
				and (is_nil(options.is_sacred_mesopotamian)      or options.is_sacred_mesopotamian == to_bool(sacred_meso_lands[conquered_region_key]))
				and (is_nil(options.is_sacred_any)               or options.is_sacred_any          == to_bool(sacred_egypt_lands[conquered_region_key] or sacred_hatti_lands[conquered_region_key] or sacred_meso_lands[conquered_region_key]))
				and (is_nil(options.production_type)             or table_find(options.production_type, conquered_region:settlement():production_type()))
				and (is_nil(options.has_POI)                     or options.has_POI                == check_if_region_has_POI(conquered_region:slot_list(), poi_building_keys))
				and (is_nil(options.have_own_region_in_province) or options.have_own_region_in_province == check_if_we_own_region_in_province(conquered_region:province()))
		end,
	}
end

function ambitions.helper.objective.conquer_realm(display_text, realms_keys)

	local check_function = function (context, faction_key, metadata)
		local conquered_regions = 0
		local number_regions_in_realm = #phar_realms.get_regions_for_realm(metadata.objective_realm)

		for _, region in ipairs(phar_realms.get_regions_for_realm(metadata.objective_realm)) do
			if cm:get_region(region):owning_faction():name() == faction_key then 
				conquered_regions = conquered_regions + 1
			end
		end

		return conquered_regions >= number_regions_in_realm, conquered_regions 
	end 

	return function(faction_key, metadata)
		if not metadata.objective_realm then 
			local objective_realm
			local smallest_number = 0

			for _, realm in ipairs(realms_keys) do
				local current_number = percent_regions_controlled_in_realm(faction_key, realm)
				if current_number > smallest_number then 
					smallest_number = current_number
					objective_realm = realm
				end 
			end

			metadata.objective_realm = objective_realm
		end

		return {
			objective = "SCRIPTED",
			display_text = display_text,
			event = "RegionFactionChangeEvent",
			check = function(context, faction_key, metadata, script_key)
				local is_success, owned_regions = check_function(context, faction_key, metadata)
				if display_text and string.find(common:get_localised_string(display_text), "%1%") then
					local realm_name_string_key = "random_localisation_strings_string_" .. metadata.objective_realm
					local progress_text = owned_regions .. "/" .. #phar_realms.get_regions_for_realm(metadata.objective_realm)
					cm:set_scripted_mission_text(metadata.ambition_key, script_key, display_text,"text:" .. realm_name_string_key, "text:" .. progress_text)
				end
	
				return is_success
			end,
			create_initial_custom_display_text = function(faction_key, metadata, script_key, is_ambition_issued)
				if not (display_text and string.find(common:get_localised_string(display_text), "%1%")) then
					return display_text
				end
	
				local progress_text = ""
				if is_ambition_issued then
					local is_sucess, owned_regions = check_function(nil, faction_key, metadata)
					progress_text = owned_regions .. "/" .. #phar_realms.get_regions_for_realm(metadata.objective_realm)
				else
					progress_text = ""
				end
	
				local realm_name_string_key = "random_localisation_strings_string_" .. metadata.objective_realm
				return display_text, "text:" .. realm_name_string_key, "text:" .. progress_text
			end,
		}
	end
end

function ambitions.helper.objective.own_N_more_regions(num_more_regions)
	return function(faction_key, metadata)
		local num_regions = cm:get_faction(faction_key):num_regions()
		local target_regions = num_regions + num_more_regions
		return {
			objective = "OWN_N_REGIONS_INCLUDING",
			conditions = {
				"total " .. tostring(target_regions)
			}
		}
	end
end

function ambitions.helper.objective.own_N_more_units(num_more_units)
	return function(faction_key, metadata)
		local num_units = 0
		local local_faction = cm:get_faction(faction_key)
		local local_faction_armies_list = local_faction:military_force_list()

		for i = 0, local_faction_armies_list:num_items() - 1 do
			local army = local_faction_armies_list:item_at(i)
			if army:is_armed_citizenry() == false then
				local army_units = army:unit_list():num_items()
				num_units = num_units + army_units
			end
		end

		local target_unit_count = num_units + num_more_units

		return {
			objective = "OWN_N_UNITS",
			conditions = {
				"total " .. tostring(target_unit_count)
			}
		}
	end
end

function ambitions.helper.objective.tutorial_1_defeat_a_particular_army()
	return function(faction_key, metadata)
		if not metadata.tut2_mf_cqi then
			metadata.tut2_mf_cqi = cm:get_character_by_fm_cqi(tut.sukkot_hero_2_fm_cqi):military_force():command_queue_index()
		end
		return {
			objective = "ENGAGE_FORCE",
			conditions = {
				"requires_victory",
				"cqi ".. metadata.tut2_mf_cqi,
			}
		}

	end
end

function ambitions.helper.objective.tutorial_2_conquer_a_particular_settlement()
	return function(faction_key, metadata)
		if not metadata.region_name then
			metadata.region_name = tut.sukkot
		end
		return {
			objective = "OWN_N_REGIONS_INCLUDING",
			conditions = {
				"total 1",
				"region ".. metadata.region_name,
			},
		}
	end
end

function ambitions.helper.objective.tutorial_7_conquer_a_particular_settlement()
	return function(faction_key, metadata)
		if not metadata.region_name then
			metadata.region_name = tut.per_amun
		end
		return {
			objective = "OWN_N_REGIONS_INCLUDING",
			conditions = {
				"total 1",
				"region ".. metadata.region_name,
			},
		}
	end
end

-- use military force cqi for the target here.
function ambitions.helper.objective.defeat_a_particular_army(mf_cqi)
	return function(faction_key, metadata)
		return {
			objective = "ENGAGE_FORCE",
			conditions = {
				"requires_victory",
				"cqi ".. mf_cqi,
			}
		}
	end
end

function ambitions.helper.objective.have_X_times_your_pooled_resource_value(factor_more_resource, resource_key)
	return function(faction_key, metadata)
		local current_resource = cm:get_faction(faction_key):pooled_resource(resource_key):value()
		local target_resource_amount = math.floor((current_resource * factor_more_resource) / 100) * 100	--Rounding to nearest 100
		return {
			objective = "HAVE_AT_LEAST_X_OF_A_POOLED_RESOURCE",
			conditions = {
				"pooled_resource " .. tostring(resource_key),
				"total " .. tostring(target_resource_amount)
			}
		}
	end
end

function ambitions.helper.objective.have_X_plus_your_pooled_resource_value(factor_more_resource, provided_resource_key)
	return function(faction_key, metadata)
		local resource_key = provided_resource_key
		if string.find(resource_key, "legitimacy") then
			local unlocked_legitimacy = legitimacy_choice:get_unlocked_legitimacy(faction_key)
			resource_key = unlocked_legitimacy.config.resource_key
		end
		
		local current_resource = cm:get_faction(faction_key):pooled_resource(resource_key):value()
		local target_resource_amount = current_resource + factor_more_resource
		return {
			objective = "HAVE_AT_LEAST_X_OF_A_POOLED_RESOURCE",
			conditions = {
				"pooled_resource " .. tostring(resource_key),
				"total " .. tostring(target_resource_amount)
			}
		}
	end
end

-- The options argument accepts the same things as the "bordering_regions_between" condition check
function ambitions.helper.objective.defeat_N_armies_of_bordering_faction(num_armies, options)
	return function(faction_key, metadata)
		local regions = get_bordering_regions(faction_key, metadata, 0, 99999, options)
		local random_region_key = regions[cm:model():random_int(1, #regions)]
		local random_region = cm:get_region(random_region_key)
		local target_faction = random_region:owning_faction()

		return {
			objective = "DEFEAT_N_ARMIES_OF_FACTION",
			conditions = {
				"total " .. num_armies,
				"faction " .. target_faction:name(),
			}
		}
	end
end

function ambitions.helper.objective.raid_bordering_stronger_faction(raid_region_count, options)
	return function(faction_key, metadata)
		if not options then
			options = {}
		end

		local suitable_target_faction = metadata.raid_bordering_stronger_faction_key

		if not suitable_target_faction then
			local own_faction_strength = cm:get_faction(faction_key):strength()
			local min_strength = own_faction_strength

			local bordering_regions = get_bordering_regions(faction_key, metadata, 0, 99999, options.region_options or {}) or {}

			local checked_factions = {}

			for _, region_key in ipairs(bordering_regions or {}) do
				local region = cm:get_region(region_key)
				local region_owner = region:owning_faction()
				local region_owner_key = region_owner:name()
				if not checked_factions[region_owner_key] then
					local faction_strength = region_owner:strength()
					checked_factions[region_owner_key] = true

					if faction_strength >= min_strength then
						suitable_target_faction = region_owner_key
					end
				end
			end
		end

		if suitable_target_faction ~= nil then
			-- Caching the faction key because the player's faction strength can change between FactionTurnStart and the player choosing the ambition
			-- This can happen if for instance another mechanic creates units/armies for the player or something similar.
			metadata.raid_bordering_stronger_faction_key = suitable_target_faction
			return {
				objective = "RAID_X_REGIONS",
				conditions = {
					"total " .. raid_region_count,
					"faction " .. metadata.raid_bordering_stronger_faction_key,
				}
			}

		end
	end
end

function ambitions.helper.objective.recruit_n_units_from(num_units, unit_keys, exclude_existing)
	return function(faction_key, metadata)
		if is_string(unit_keys) then
			unit_keys = {unit_keys}
		end;

		-- don't count units already recruited by default
		if exclude_existing ~= false then
			exclude_existing = true
		end

		local conditions = {
			"total " .. num_units,
			"exclude_existing " .. tostring(exclude_existing)
		}

		if unit_keys then
			for i = 1, #unit_keys do
				table.insert(conditions, "unit " .. unit_keys[i])
			end
		end

		return {
			objective = "RECRUIT_N_UNITS_FROM",
			conditions = conditions
		}
	end
end

function ambitions.helper.objective.research_n_techs_including(num_technologies, tech_keys, include_existing)
	return function(faction_key, metadata)
		if is_string(tech_keys) then
			tech_keys = {tech_keys}
		end;

		-- don't count existing technologies by default
		if include_existing ~= true then
			include_existing = false
		end

		local conditions = {
			"total " .. num_technologies,
			"additive " .. tostring(include_existing)
		}

		if tech_keys then
			for i = 1, #tech_keys do
				table.insert(conditions, "technology " .. tech_keys[i])
			end
		end

		return {
			objective = "RESEARCH_N_TECHS_INCLUDING",
			conditions = conditions
		}
	end
end

function ambitions.helper.objective.destroy_bordering_faction_with_num_regions_between(min_regions, max_regions)
	return function(faction_key, metadata)
		local target_faction = metadata.target_faction and cm:get_faction(metadata.target_faction)
		if not target_faction then
			local regions = get_bordering_regions(faction_key, metadata, 0, 99999, { is_enemy = true, owner_min_regions = min_regions, owner_max_regions = max_regions, is_abandoned = false })
			local random_region_key = regions[cm:model():random_int(1, #regions)]
			local random_region = cm:get_region(random_region_key)
			target_faction = random_region:owning_faction()
			metadata.target_faction = target_faction:name()
		end

		return {
			objective = "DESTROY_FACTION",
			conditions = {
				"faction " .. target_faction:name(),
				"confederation_valid",
			}
		}
	end
end

function ambitions.helper.objective.destroy_bordering_faction_with_num_regions_at_least(min_regions)
	return ambitions.helper.objective.destroy_bordering_faction_with_num_regions_between(min_regions, min_regions - 1)
end

function ambitions.helper.objective.destroy_bordering_faction_with_num_regions_at_most(max_regions)
	return ambitions.helper.objective.destroy_bordering_faction_with_num_regions_between(really_small_number, max_regions)
end

function ambitions.helper.objective.destroy_faction(target_faction_key, can_confederate_instead, options)
	if not options then
		options = {}
	end

	local bool_str
	if can_confederate_instead == nil or can_confederate_instead == false then
		bool_str = "false"
	elseif can_confederate_instead == true then
		bool_str = "true"
	end

	return function(faction_key, metadata)
		return {
			objective = "DESTROY_FACTION",
			conditions = {
				"faction " .. target_faction_key,
				"confederation_valid " .. tostring(to_bool(can_confederate_instead)),
			}
		}
	end
end

function ambitions.helper.objective.destroy_legitimacy_ruler(legitimacy_resource_id, options)
	if not options then
		options = {}
	end

	return function(faction_key, metadata)
		if options.players_legitimacy_path then
			local faction_unlocked_legitimacy = legitimacy_choice:get_unlocked_legitimacy(faction_key)
			if faction_unlocked_legitimacy then
				legitimacy_resource_id = faction_unlocked_legitimacy.config.resource_key
			end
		end

		return {
			objective = "DESTROY_LEGITIMACY_RULER",
			conditions = {
				"legitimacy_resource_id " .. legitimacy_resource_id,
			}
		}
	end
end

function ambitions.helper.objective.destroy_bordering_faction_matching_options(options)
	if not options then
		options = {}
	end

	return function(faction_key, metadata)
		local enemy_faction_key = nil
		if is_string(metadata.enemy_faction_key) then
			enemy_faction_key = metadata.enemy_faction_key
		else
			local bordering_regions = get_bordering_regions(faction_key, metadata, 1, 99999, options or {}) or {}
			if #bordering_regions == 0 then
				return nil
			end
			local random_region_name = bordering_regions[cm:model():random_int(1, #bordering_regions)]
			local random_region_object = cm:get_region(tostring(random_region_name))
			enemy_faction_key = random_region_object:owning_faction():name()
			metadata.enemy_faction_key = enemy_faction_key
		end
		return {
			objective = "DESTROY_FACTION",
			conditions = {
				"faction " .. enemy_faction_key,
				"confederation_valid false",
			}
		}
	end
end

function ambitions.helper.objective.get_resource_income(resource_key, min_income, display_text)
	return {
		objective = "SCRIPTED",
		display_text = display_text,
		event = "FactionTurnEnd",
		check = function(context, faction_key, metadata)
			local faction = context:faction()

			if faction:name() ~= faction_key then
				return false
			end

			local income = faction:pooled_resource(resource_key):income()
			return income >= min_income
		end
	}
end

function ambitions.helper.objective.get_resource_value(resource_key, min_value)
	return {
		objective = "HAVE_AT_LEAST_X_OF_A_POOLED_RESOURCE",
		conditions = {
			"pooled_resource " .. resource_key,
			"total " .. min_value,
		}
	}
end

function ambitions.helper.objective.construct_N_buildings_from(amount, buildings, building_chains, building_sets, exclude_existing, display_text)
	return function(faction_key, metadata)
		local ret = {
			objective = "CONSTRUCT_N_BUILDINGS_FROM",
			conditions = {
				"total " .. tostring(amount),
				"faction " .. faction_key,
			}
		}

		for _, building in ipairs(buildings or {}) do
			table.insert(ret.conditions, "building_level " .. building)
		end

		for _, building_chain in ipairs(building_chains or {}) do
			table.insert(ret.conditions, "building_chain " .. building_chain)
		end

		for _, building_set in ipairs(building_sets or {}) do
			table.insert(ret.conditions, "building_set " .. building_set)
		end

		if exclude_existing then
			table.insert(ret.conditions, "exclude_existing " .. tostring(exclude_existing))
		end

		if display_text ~= nil then
			table.insert(ret.conditions, "override_text " .. tostring(display_text))
		end

		return ret
	end
end

function ambitions.helper.objective.num_region_slots_at_least(min_slots, options, display_text)
	local check_function = ambitions.helper.condition.num_region_slots_between(min_slots, min_slots - 1, options)

	return {
		objective = "SCRIPTED",
		display_text = display_text,
		event = "BuildingCompleted",
		check = function(context, faction_key, metadata, script_key)
			if context:building():faction():name() ~= faction_key then 
				return false 
			end

			local is_sucess, region_slots_owned = check_function(faction_key, metadata)
			if display_text and string.find(common:get_localised_string(display_text), "%1%") then
				local progress_text = region_slots_owned .. "/" .. min_slots
				cm:set_scripted_mission_text(metadata.ambition_key, script_key, display_text, "text:" .. progress_text)
			end

			return is_sucess
		end,
		create_initial_custom_display_text = function(faction_key, metadata, script_key, is_ambition_issued)
			if not (display_text and string.find(common:get_localised_string(display_text), "%1%")) then
				return display_text
			end

			local progress_text = ""
			if is_ambition_issued then
				local is_sucess, region_slots_owned = check_function(faction_key, metadata)
				progress_text = region_slots_owned .. "/" .. min_slots
			else
				progress_text = tostring(min_slots)
			end

			return display_text, "text:" .. progress_text
		end
	}
end

function ambitions.helper.objective.num_region_slots_at_most(max_slots, options, display_text)
	local check_function = ambitions.helper.condition.num_region_slots_between(really_small_number, max_slots - 1, options)

	return {
		objective = "SCRIPTED",
		display_text = display_text,
		event = "BuildingCompleted",
		check = function(context, faction_key, metadata)
			if context:building():faction():name() ~= faction_key then 
				return false 
			end 
			return check_function(faction_key, metadata)
		end
	}
end

-- Accepts same options as num_owned_regions_between
function ambitions.helper.objective.have_regions_between(min_regions, max_regions, options, display_text)
	local check_function = ambitions.helper.condition.num_owned_regions_between(min_regions, max_regions, options)

	return {
		objective = "SCRIPTED",
		display_text = display_text,
		event = "RegionFactionChangeEvent",
		check = function(context, faction_key, metadata)
			return context:region():owning_faction():name() == faction_key and check_function(faction_key, metadata)
		end
	}
end

function ambitions.helper.objective.own_at_least_N_nomad_outposts_in_own_territory(target_num_nomad_outposts, display_text)
	return {
		objective = "SCRIPTED",
		display_text = display_text,
		event = "FactionTurnEnd",
		check = function(context, faction_key, metadata)
			return tribes_privileges.calculate_num_nomad_outposts_of_faction_in_own_territory(faction_key) >= target_num_nomad_outposts
		end
	}
end

function ambitions.helper.objective.own_at_least_N_nomad_outposts_in_foreign_territory(target_num_nomad_outposts, display_text)
	return {
		objective = "SCRIPTED",
		display_text = display_text,
		event = "FactionTurnEnd",
		check = function(context, faction_key, metadata)
			return tribes_privileges.calculate_num_nomad_outposts_of_faction_in_foreign_territory(faction_key) >= target_num_nomad_outposts
		end
	}
end

function ambitions.helper.objective.own_at_least_N_nomad_outposts_in_razed_territory(target_num_nomad_outposts, display_text)
	return {
		objective = "SCRIPTED",
		display_text = display_text,
		event = "FactionTurnEnd",
		check = function(context, faction_key, metadata)
			return tribes_privileges.calculate_num_nomad_outposts_of_faction_in_razed_territory(faction_key) >= target_num_nomad_outposts
		end
	}
end

function ambitions.helper.objective.reach_tribe_cell(target_cell_bundle_key, display_text)
	return {
		objective = "SCRIPTED",
		display_text = display_text,
		event = "FactionTurnEnd",
		check = function(context, faction_key, metadata)
			local tribes_faction_data = tribes_privileges.persistent.factions[faction_key]
			if not tribes_faction_data then
				return false
			end

			return tribes_faction_data.current_cell_bundle_key == target_cell_bundle_key
		end
	}
end

-- "target_settlement_types" accepts any number of types (logic: "OR") by using a table in this format:
-- objectives.perform_obedience_raze({"type_a", "type_b"}, "text_string")
function ambitions.helper.objective.perform_obedience_raze(target_settlement_types, display_text)
    return {
        objective = "SCRIPTED",
        display_text = display_text,
        event = "ScriptEventEminenceObediencePerformed",
        check = function(context, faction_key, metadata)
            if context.stored_table.faction_key == faction_key and table_contains(target_settlement_types, context.stored_table.settlement_type) then
                return true
            end

            return false
        end
    }
end

function ambitions.helper.objective.reach_civilization_level(target_civilization_name, display_text)
	return {
		objective = "SCRIPTED",
		display_text = display_text,
		event = "FactionTurnEnd",
		check = function(context, faction_key, metadata)
			return pillars_civilization.get_current_civilization_level().name == target_civilization_name
		end
	}
end

function ambitions.helper.objective.have_regions_at_least(min_regions, options, display_text)
	local check_function = ambitions.helper.condition.num_owned_regions_between(min_regions, min_regions - 1, options)

	return {
		objective = "SCRIPTED",
		display_text = display_text,
		event = "FactionTurnStart",
		check = function(context, faction_key, metadata, script_key)
			if context:faction():name() ~= faction_key then
				return false
			end

			local is_success, owned_regions = check_function(faction_key, metadata)
			if display_text and string.find(common:get_localised_string(display_text), "%1%") then
				local progress_text = owned_regions .. "/" .. min_regions
				cm:set_scripted_mission_text(metadata.ambition_key, script_key, display_text, "text:" .. progress_text)
			end

			return is_success
		end,
		create_initial_custom_display_text = function(faction_key, metadata, script_key, is_ambition_issued)
			if not (display_text and string.find(common:get_localised_string(display_text), "%1%")) then
				return display_text
			end

			local progress_text = ""
			if is_ambition_issued then
				local is_sucess, owned_regions = check_function(faction_key, metadata)
				progress_text = owned_regions .. "/" .. min_regions
			else
				progress_text = tostring(min_regions)
			end

			return display_text, "text:" .. progress_text
		end
	}
end

function ambitions.helper.objective.have_regions_at_most(max_regions, options, display_text)
	return ambitions.helper.objective.have_regions_between(really_small_number, max_regions, options, display_text)
end

-- Accepts same options as num_owned_regions_between
function ambitions.helper.objective.all_regions(options, display_text)
	return {
		objective = "SCRIPTED",
		display_text = display_text,
		event = "FactionTurnEnd",
		check = function(context, faction_key, metadata)
			local faction = context:faction()
			if not context:faction():name() == faction_key then
				return false
			end

			local num_regions = faction:num_regions()
			local check_function = ambitions.helper.condition.num_owned_regions_between(num_regions, num_regions, options)
			return check_function(faction_key, metadata)
		end
	}
end

function ambitions.helper.objective.hold_entirety_of_province_with_enemy()
	return function(faction_key, metadata)
		local province = owning_province_capital_with_adjacent_enemy_region_in_same_province(faction_key)
		local ret = {
			objective = "HOLD_ENTIRETY_OF_N_PROVINCES_INCLUDING",
			conditions = {
				"total 1"
			},
		}

		if province ~= nil then
			table.insert(ret.conditions, "province " .. province:name())
		end

		return ret
	end
end

function ambitions.helper.objective.control_X_provinces_with_more_than_Y_idle_workforce(min_provinces, min_idle_workforce, display_text)
	local check_function = function(faction_key, metadata)
		local faction = cm:get_faction(faction_key)
		local province_list = faction:province_list()
		local provinces_with_idle_workforce = 0 

		for i = 0, province_list:num_items() - 1 do
			local province = province_list:item_at(i)
			local dev_points = province:development_points_for_faction(faction_key)
			if dev_points >= min_idle_workforce then
				provinces_with_idle_workforce = provinces_with_idle_workforce + 1 
			end
		end

		return provinces_with_idle_workforce >= min_provinces, provinces_with_idle_workforce
	end

	return {
		objective = "SCRIPTED",
		display_text = display_text,
		event = "FactionTurnStart",
		check = function(context, faction_key, metadata, script_key)
			local is_sucess, provinces_with_idle_workforce = check_function(faction_key, metadata)

			if display_text and #display_text > 0 then
				local progress_text = provinces_with_idle_workforce .. "/" .. min_provinces
				cm:set_scripted_mission_text(metadata.ambition_key, script_key, display_text, "text:" .. progress_text, "text:" .. min_idle_workforce)
			end

			return is_sucess
		end,
		create_initial_custom_display_text = function(faction_key, metadata, script_key, is_ambition_issued)
			if not (display_text and string.find(common:get_localised_string(display_text), "%1%")) then
				return display_text
			end

			local progress_text = ""
			if is_ambition_issued then
				local is_sucess, provinces_with_idle_workforce = check_function(faction_key, metadata)
				progress_text = provinces_with_idle_workforce .. "/" .. min_provinces
			else
				progress_text = tostring(min_provinces)
			end

			return display_text, "text:" .. progress_text, "text:" .. min_idle_workforce
		end
	}
end

-- Requires metadata.regions_list to be a list with at least "num_regions" regions
-- For example, this can be done with the "bordering_regions_between" condition
function ambitions.helper.objective.raze_or_sack_regions_from_metadata(num_regions)
	return function(faction_key, metadata)
		local region_list = metadata.regions_list

		local ret = {
			objective = "RAZE_OR_SACK_N_DIFFERENT_SETTLEMENTS_INCLUDING",
			conditions = {
			}
		}

		if num_regions > #region_list then
			script_error("Trying to create an objective to raze more regions than were given in a list")
			num_regions = #region_list
		end

		table.insert(ret.conditions, "total " .. tostring(num_regions))

		for i = 1, num_regions do
			local region_name = region_list[i]
			table.insert(ret.conditions, "region " .. region_name)
		end

		return ret
	end
end

function ambitions.helper.objective.raze_or_sack_regions_in_province(province_key)
	return function(faction_key, metadata)
		local province = cm:get_province(province_key)
		if not province then
			script_error("Trying to create an objective for an invalid province!")
			return nil
		end

		local last_region_index = province:regions():num_items() - 1
		local region_list = {}
		for i = 0, last_region_index do
			local region = province:regions():item_at(i)
			if region:owning_faction():name() ~= faction_key then
				table.insert(region_list, region:name())
			end
		end

		local ret = {
			objective = "RAZE_OR_SACK_N_DIFFERENT_SETTLEMENTS_INCLUDING",
			conditions = {
			}
		}

		local num_regions = #region_list
		table.insert(ret.conditions, "total " .. tostring(num_regions))

		for i = 1, num_regions do
			local region_name = region_list[i]
			table.insert(ret.conditions, "region " .. region_name)
		end

		return ret
	end
end

-- "supreme_leader" accepts "any", "none", "pharaoh" and "great_king"
function ambitions.helper.objective.be_supreme_leader(supreme_leader, display_text)
	return {
		objective = "SCRIPTED",
		display_text = display_text,
		event = "FactionTurnEnd",
		check = function(context, faction_key)
			local pharaoh = egypt_political_states:is_sitting_pharaoh(faction_key)
			local gk = hatti_political_states:is_sitting_great_king(faction_key)

			if egypt_political_states:is_sitting_pharaoh(faction_key) then
				return supreme_leader == "pharaoh" or supreme_leader == "any"
			elseif hatti_political_states:is_sitting_great_king(faction_key) then
				return supreme_leader == "great_king" or supreme_leader == "any"
			else
				return supreme_leader == "none"
			end
		end
	}
end

function ambitions.helper.objective.dummy_condition_for_active_ambitions(display_text)
	return {
		objective = "SCRIPTED",
		display_text = display_text,
		event = "FactionTurnEnd",
		check = function(context, faction_key)
			return true
		end
	}
end

--- Commented out until I get support on this

-- Options accept:
--- method_type = {
---		melee_weapon			-- Counts entities killed if they were killed while in melee
---		ranged_weapon			-- Counts entities killed if they were killed while using a ranged 
---		chariot_weapon			-- Counts entities killed while the character was on a chariot (regardless of weapon used)
--- }
--- options = {
--- 	is_faction_leader		-- Checks if the character is a faction leader
---		characters_any			-- Checks if any character matches the conditions, and returns true if the number of matches equals or exceeds value X
---		is_specific_character	-- Looks for specific character using its cqi
--- }

-- function ambitions.helper.objective.character_entity_kill_counter(target_entity_kills, method_type, options, display_text)
-- 	if not method_type then
-- 		method_type = {}
-- 	end
-- 	if not options then
-- 		options = {}
-- 	end

-- 	local starting_entities_killed_count = 

-- 	return function(faction_key, metadata)
-- 		local player_faction = cm:get_faction(faction_key)
-- 		local character_list = player_faction:character_list()
-- 		local faction_leader = player_faction:faction_leader()
-- 		local kill_count = 0

-- 		return {
-- 			objective = "SCRIPTED",
-- 			display_text = display_text,
-- 			event = "FactionTurnEnd", -- or "BattleCompleted"?
-- 			check = function(context)
	
-- 				if options.is_faction_leader then
-- 					kill_count = faction_leader:kill_count()		---- FIND HOW TO REPLACE THIS
-- 					if faction_leader:character_subtype_key() == method_type then
-- 						count = count + kill_count

-- 					end
-- 				end

-- 				if count >= target_entity_kills then
-- 					return true
-- 				else
-- 					return false
-- 				end
-- 			end
-- 		}
-- 		end
-- 	end

-- 	return function(faction_key, metadata)
-- 		local player_faction = cm:get_faction(faction_key)
-- 		local character_list = player_faction:character_list()
-- 		local faction_leader = player_faction:faction_leader()

-- 		-- Option is_faction_leader
-- 		if options.is_faction_leader == true then
-- 			faction_leader_level = faction_leader:rank()			
-- 			if 	(faction_leader_level <= max_level) and
-- 				(faction_leader_level >= min_level) then
-- 				return true
-- 			else
-- 				return false
-- 			end
-- 		end
-- 	end
-- end


function ambitions.helper.objective.reach_turn_number(target_turn, display_text)
	return {
		objective = "SCRIPTED",
		display_text = display_text,
		event = "FactionTurnStart",
		check = function(context, faction_key, metadata)
			local turn_number = cm:turn_number()
			return turn_number >= target_turn
		end
	}
end

-- Needs fix for phar_main_ambition_charactereffort to be able to work

-- function ambitions.helper.objective.num_characters_with_level_between(min_characters, max_characters, min_level, max_level, display_text)
-- 	return {
-- 		objective = "SCRIPTED",
-- 		display_text = display_text,
-- 		event = "CharacterRankUp",
-- 		check = function(faction_key, metadata)
			
	-- 		local faction = cm:get_faction(faction_key)
	-- 		local character_list = faction:character_list()

	-- 		local num_characters = 0

	-- 		for i = 0, character_list:num_items() - 1 do
	-- 			local char = character_list:item_at(i)
	-- 			if (char:rank() >= min_level) and (char:rank() <= max_level) then
	-- 				num_characters = num_characters + 1

	-- 				if num_characters >= min_characters and max_characters < min_characters then
	-- 					return true
	-- 				end
	-- 			end
	-- 		end
	-- 			return num_characters >= min_characters and (num_characters <= max_characters or max_characters < min_characters)
	-- 		end
	-- 	}
-- end

-- function ambitions.helper.objective.at_least_X_characters_with_level_between(min_characters, min_level, max_level, display_text)
-- 	return ambitions.helper.objective.num_characters_with_level_between(min_characters, min_characters - 1, min_level, max_level, display_text)
-- end

-- function ambitions.helper.objective.at_most_X_characters_with_level_between(max_characters, min_level, max_level, display_text)
-- 	return ambitions.helper.objective.num_characters_with_level_between(really_small_number, max_characters, min_level, max_level, display_text)
-- end


-- Stance-related objectives
-- List of possible stances available in campaign_stances in DaVe

function ambitions.helper.objective.check_all_armies_stances(stance, display_text)
    return {
		objective = "SCRIPTED",
		display_text = display_text,
		event = "FactionTurnEnd",
		check = function(context, faction_key, metadata)
			local faction = context:faction()

			if faction:name() ~= faction_key then
				return false
			end

			local armies = cm:get_faction(faction_key):military_force_list()

			for i = 0, armies:num_items() - 1 do
				local army = armies:item_at(i)

				if not army:is_armed_citizenry()
					and army:can_activate_stance(stance)
					and army:active_stance() ~= stance
				then
					return false
				end
			end

	        return true
    	end
	}
end

function ambitions.helper.objective.political_marriage_through_diplomacy(display_text)
	return {
		objective = "SCRIPTED",
		display_text = display_text,
		event = "FamilyMembersMarriage",
		check = function(context, faction_key)
			local character_details = context:family_member1():character_details()
			local character_details_other = context:family_member2():character_details()
			if not (character_details:faction():name() == faction_key or character_details_other:faction():name() == faction_key) then
				return
			end

			local marriage_type = context:marriage_type()
			return marriage_type == "diplomatic"
		end
	}
end

function ambitions.helper.objective.assign_court_position_to_heir(display_text)
	return {
		objective = "SCRIPTED",
		display_text = display_text,
		event = "ScriptEventCourtFactionGainedCourtPosition",
		check = function(context, faction_key)
			if context.stored_table.faction_key ~= faction_key then
				return false
			end

			local faction = cm:get_faction(faction_key)
			local faction_heir = faction:faction_heir()
			if faction_heir:is_null_interface() then
				return false
			end
	
			local heir_character = faction_heir:character()
			if (not heir_character or heir_character:is_null_interface()) then
				return false
			end

			return heir_character:command_queue_index() == context.stored_table.character:command_queue_index()
		end
	}
end

function ambitions.helper.objective.faction_heir_capture_neighbouring_enemy_region(display_text)
	return {
		objective = "SCRIPTED",
		display_text = display_text,
		event = "CharacterPerformsSettlementOccupationDecisionBeforeOutcomeApplication",
		check = function(context, faction_key)
			local option = context:occupation_decision_option()
			if not (option == "occupation_decision_occupy" or option == "occupation_decision_loot") then
				return false
			end

			local character_occupier = context:character()
			if character_occupier:faction():name() ~= faction_key then
				return false
			end

			local faction = cm:get_faction(faction_key)
			local faction_heir = faction:faction_heir()
			if faction_heir:is_null_interface() then
				return false
			end
	
			local faction_heir_character = faction_heir:character()
			if (not faction_heir_character or faction_heir_character:is_null_interface()) then
				return false
			end

			if character_occupier:command_queue_index() ~= faction_heir_character:command_queue_index() then
				return false
			end

			local region = character_occupier:region()
			if region:is_null_interface() then
				return false
			end

			local is_region_on_border_faction = false
			local adjacent_regions = region:adjacent_region_list()
			for i = 0, adjacent_regions:num_items() - 1 do
				local adjacent_region = adjacent_regions:item_at(i)
				local region_owner = adjacent_region:owning_faction()
				if region_owner:name() == faction_key then
					is_region_on_border_faction = true
					break
				end
			end

			return is_region_on_border_faction
		end
	}
end

function ambitions.helper.objective.adopt_faction_in_own_dynasty(display_text, options)
	return {
		objective = "SCRIPTED",
		display_text = display_text,
		event = "DynastyAdoptedFaction",
		check = function(context, faction_key)
			if not options then
				options = {}
			end

			if not options.ignore_forced and to_bool(options.is_forced) ~= context:forced() then
				return false
			end

			local faction = cm:get_faction(faction_key)
			return context:dynasty_line_key() == faction:dynasty_line_key()
		end
	}
end

function ambitions.helper.objective.own_faction_is_adopted_in_dynasty(display_text, options)
	return {
		objective = "SCRIPTED",
		display_text = display_text,
		event = "DynastyAdoptedFaction",
		check = function(context, faction_key)
			if not options then
				options = {}
			end

			if not options.ignore_forced and to_bool(options.is_forced) ~= context:forced() then
				return false
			end

			local adopted_faction = context:adopted_faction()
			return adopted_faction:name() == faction_key
		end
	}
end

function ambitions.helper.objective.collect_N_resources_from_raiding(pooled_resource_keys, amount)
	return function(faction_key, metadata, script_key)
		local sum_income_from_raiding = function(faction)
			local total_income_from_raiding = 0
			for _, pooled_resource_key in ipairs(pooled_resource_keys) do
				local pooled_resource = faction:pooled_resource(pooled_resource_key)
				local income_from_raiding = pooled_resource:playthrough_income("raiding")
				total_income_from_raiding = total_income_from_raiding + income_from_raiding
			end
	
			return total_income_from_raiding
		end

		local create_resources_display_string = function()
			-- set_scripted_mission_text doesn't really support a list of strings, but there is a hacky way by passing a text with interval " ",
			-- everything else added after this will be read as an individual string and they have to be separated by ":"
			local pooled_resources_string = "text: :"
			for index, pooled_resource_key in ipairs(pooled_resource_keys) do
				local pooled_resource_record_cco = cco("CcoPooledResourceRecord", pooled_resource_key)
				pooled_resources_string = pooled_resources_string .. pooled_resource_record_cco:Call("Name")

				if index < #pooled_resource_keys then
					pooled_resources_string = pooled_resources_string .. ",:"
				end
			end
			
			return pooled_resources_string
		end

		if metadata.start_amount == nil then
			local objective_faction = cm:get_faction(faction_key)
			metadata.start_amount = sum_income_from_raiding(objective_faction)
		end

		local resources_text = create_resources_display_string()
		return {
			objective = "SCRIPTED",
			display_text = "ui_text_replacements_localised_text_phar_map_collect_N_resources_from_raiding_text",
			event = "PooledResourceTransactionEvent",
			check = function(context, faction_key)
	
				local event_faction = context:faction()
				if event_faction:name() ~= faction_key then
					return
				end

				local total_income_from_raiding = sum_income_from_raiding(event_faction)
				total_income_from_raiding = total_income_from_raiding - metadata.start_amount

				local progress_text = math.min(total_income_from_raiding, amount) .. "/" .. amount
				local text = "ui_text_replacements_localised_text_phar_map_collect_N_resources_from_raiding_text"
				cm:set_scripted_mission_text(metadata.ambition_key, script_key, text, resources_text, "text:" .. progress_text, "", metadata.custom_id);

				return total_income_from_raiding >= amount
			end,
			create_initial_custom_display_text = function(faction_key, metadata, script_key)
				local progress_text = 0 .. "/" .. amount
				local text = "ui_text_replacements_localised_text_phar_map_collect_N_resources_from_raiding_text"
				return text, resources_text, "text:" .. progress_text;
			end
		}
	end
end

function ambitions.helper.objective.own_N_units(amount, unit_sets)
	return function(faction_key, metadata)
		local unit_sets_condition = ""
		for index, unit_set in ipairs(unit_sets) do
			unit_sets_condition = unit_sets_condition .. "unit_set " .. unit_set

			if index < #unit_sets then
				unit_sets_condition = unit_sets_condition .. ";"
			end
		end

		return {
			objective = "OWN_N_UNITS",
			conditions = {
				"total " .. amount,
				unit_sets_condition,
			},
		}
	end
end

-- Options accept:
--- options = {
--- 	is_non_aggression_pact	= true / false 
--- 	is_defensive_alliance	= true / false 
--- 	is_military_alliance	= true / false 
--- 	is_barter_agreement		= true / false 
--- 	is_vassalage 			= true / false 
--- }
--- The faction_[treaty_type]():num_items() is only incremented AFTER the event is triggered, we need to increment our total amount 
--- as we receive the event, thus having the correct count for each treaties when receiving this event. 
function ambitions.helper.objective.have_X_amount_positive_treaties (amount, options, display_text)
	if not options then 
		options = {}
	end

	local check_function = function(faction_key, metadata)
		local faction = cm:get_faction(faction_key)
		local total_amount_treaties = 0

		if options.is_non_aggression_pact then
			total_amount_treaties = total_amount_treaties + faction:factions_non_aggression_pact_with():num_items()
		end
		if options.is_defensive_alliance then 
			total_amount_treaties = total_amount_treaties + faction:factions_defensive_alliance_with():num_items()
		end
		if options.is_military_alliance then 
			total_amount_treaties = total_amount_treaties + faction:factions_military_alliance_with():num_items()
		end 
		if options.is_barter_agreement then 
			total_amount_treaties = total_amount_treaties + faction:factions_bartering_with():num_items()
		end
		if options.is_vassalage then 
			total_amount_treaties = total_amount_treaties + faction:factions_sovereign_of():num_items()
		end

		return total_amount_treaties >= amount, total_amount_treaties
	end

	return {
		objective = "SCRIPTED",
		display_text = display_text,
		event = "PostPositiveDiplomaticEvent",
		check = function(context, faction_key, metadata, script_key)
			if context:character():faction():name() ~= faction_key then 
				return 
			end 

			local is_success, total_amount_treaties = check_function(faction_key, metadata)

			if display_text and #display_text > 0 then
				local progress_text = total_amount_treaties .. "/" .. amount
				cm:set_scripted_mission_text(metadata.ambition_key, script_key, display_text, "text:" .. progress_text)
			end

			return is_success
		end,
		create_initial_custom_display_text = function(faction_key, metadata, script_key, is_ambition_issued)
			if not (display_text and string.find(common:get_localised_string(display_text), "%1%")) then
				return display_text
			end

			local progress_text = ""
			if is_ambition_issued then
				local is_sucess, total_amount_treaties = check_function(faction_key, metadata)
				progress_text = total_amount_treaties .. "/" .. amount
			else
				progress_text = tostring(amount)
			end

			return display_text, "text:" .. progress_text
		end
	}
end

------------------------------------------------------------
---------------------- Payload Helpers ---------------------
------------------------------------------------------------

-- Due to how the unpack() function behaves with tables this payload __MUST__ always be on the bottom of the payloads list.
--[[
When testing it I noticed this behaviour:
	t = { "a", "b" }
	{      unpack(t)      } == { "a", "b" }
	{ "c", unpack(t)      } == { "c", "a", "b" }
	{      unpack(t), "c" } == { "a", "c" } AND NOT { "a", "b", "c" }

Because of this if this payload is followed by any other payload then only the first resource will be accounted for.
For example:
	reward_payloads = {
		payloads.generate_ambition_resource_reward_payload({
			{ "troy_bronze" , 1300 },
			{ "troy_gold" , 600 },
		}),
		payloads.victory_points(3),
	}

	in this situation only the bronze and victory points will actually be in the rewards.
	To fix that we have to make sure this function is on the bottom:

	reward_payloads = {
		payloads.victory_points(3),
		payloads.generate_ambition_resource_reward_payload({
			{ "troy_bronze" , 1300 },
			{ "troy_gold" , 600 },
		}),
	}
--]]
function ambitions.helper.payload.generate_ambition_resource_reward_payload(rewards)
	local function string_builder(resource, value)
		return "faction_pooled_resource_transaction{resource " .. resource .. ";factor troy_resource_factor_faction;amount " .. tostring(value) .. ";}";
	end;

	local resource_reward_list = {}

	for _, resource_key_value in ipairs(rewards) do
		table.insert(resource_reward_list, string_builder(resource_key_value[1], resource_key_value[2]))
	end

	return unpack(resource_reward_list)
end

function ambitions.helper.payload.text_display(text_lookup, tooltip_lookup, icon_path)
	-- "text_display { lookup text_key; tooltip_lookup tooltip_text_key; icon_path path_to_icon; }"
	local ret = "text_display {"
	local error_string = nil

	if is_string(text_lookup) then
		ret = ret .. " lookup " .. text_lookup .. ";"
	else
		error_string = "text_lookup is a required parameter for the text_display payload. The mission creation will error out."
	end

	if is_string(tooltip_lookup) then
		ret = ret .. " tooltip_lookup " .. tooltip_lookup .. ";"
	end

	if is_string(icon_path) then
		ret = ret .. " icon_path " .. icon_path .. ";"
	end

	ret = ret .. " }"

	return ret, error_string
end

-- Gives the provided ancillary to the first legit character with provided forename.
-- "#" from names table - provide the name of the character and look it up for the faction. Choses the first one spawned with that name.
function ambitions.helper.payload.add_ancillary_to_character_with_forename(character_forename, ancillary_key)
	return function(faction_key, metadata) 
		local character = cm:get_character("faction:" .. faction_key .. ",forename:" .. character_forename)
		local character_cqi = character:command_queue_index()
		
		return "add_ancillary{ cqi ".. character_cqi .. ";ancillary " .. ancillary_key .. ";}"
	end

end

-- Gives the ancillary to the faction leader
function ambitions.helper.payload.add_ancillary_to_faction_leader(ancillary_key)
	return function(faction_key, metadata) 
		return "add_ancillary{ target_faction ".. faction_key .. ";ancillary " .. ancillary_key .. ";award_to_faction_leader true; }"
	end
end

function ambitions.helper.payload.victory_points(num_victory_points)
	return function(faction_key, metadata)
		-- Head to head multiplayer does not care about victory points so we don't award them there
		local campaign_type = cm:model():campaign_type_string()
		if campaign_type == "sp_normal" or campaign_type == "mp_co_op_normal" then
			return "faction_pooled_resource_transaction{ resource phar_victory_points; factor troy_resource_factor_missions; amount " .. num_victory_points .. ";	}"
		end

		return ""
	end
end


------------------------------------------------------------
----------------- Scripted Payloads Helpers ----------------
------------------------------------------------------------

function ambitions.helper.scripted_payload.random_weighted_unit_reward(total_added_units, units_and_weights_list, unit_veterancy)
	return function(faction_key, metadata)
		local player_faction = cm:get_faction(faction_key)
		local faction_cqi = player_faction:command_queue_index()
		local weighted_list_of_units_with_weights = weighted_list:new()

		-- Create a pairs list thanks to "lib_weighted_list.lua" library which has the unit key and weigth
		-- First create the list, with :new(), and then populate it with items one pair at a time

		for _, unit_key_num in pairs(units_and_weights_list) do
			weighted_list_of_units_with_weights:add_item(unit_key_num[1], unit_key_num[2])
		end

		-- Looping once per random roll ("total_added_units"), corresponding to total NUMBER of added units (not unit keys) into the Special Recruitment pool
		for i = 1, total_added_units do
			local rolled_unit = weighted_list_of_units_with_weights:weighted_select()
			local current_unit_amount = cm:num_units_in_faction_mercenary_pool(faction_cqi, rolled_unit, "ambition")
			current_unit_amount = current_unit_amount + 1

			local custom_unit = cm:create_custom_unit_from_key(rolled_unit, false)
			custom_unit:add_custom_id("ambition")
			custom_unit:add_mercenary_recruit_data(
				current_unit_amount,
				0,
				current_unit_amount,
				0,
				unit_veterancy,
				"", "", ""
			)

			cm:add_custom_unit_to_faction_mercenary_pool(faction_key, custom_unit)
		end
	end
end

function ambitions.helper.scripted_payload.award_victory_points_to_other_players(num_victory_points)
	return function(faction_key, metadata)
		-- We only want to award victory points in normal or coop campaigns. They are not used in head to head campaigns
		local campaign_type = cm:model():campaign_type_string()
		if campaign_type == "sp_normal" or campaign_type == "mp_co_op_normal" then
			local human_factions = cm:get_human_factions()
			for _, human_faction_key in ipairs(human_factions) do
				-- We already add victory points to the current player with the mission payload
				if human_faction_key ~= faction_key then
					cm:faction_add_pooled_resource(human_faction_key, "phar_victory_points", "troy_resource_factor_missions", num_victory_points)
				end
			end
		end
	end
end


------------------------------------------------------------
--------------------- Utility Helpers ----------------------
------------------------------------------------------------







