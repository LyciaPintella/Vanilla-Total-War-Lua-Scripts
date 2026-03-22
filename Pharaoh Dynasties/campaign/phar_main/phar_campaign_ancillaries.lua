out("Loading phar_campaign_ancillaries")
-------------------------------------------------------------------------
------------- Ancillaries provided by post battle for pharaoh -----------
-------------------------------------------------------------------------
-- The aim of this part is to have a set of ancillaries provided at random after winning a battle.

title_ancillary_type_key = "phar_main_anc_title"
prince_title_ancillary_type_key = "phar_main_anc_prince_title"


-- The chances are applied based on which table the ancillaries are in. If the ancillaries are in the common table, the common chance applies. If they are in one of the realms tables, the rare chance applies. --
ancillary_drop_chances = {
	post_battle_drop_chance = 60,
	rare_drop_chance = 45,
	drop_chance_bonus_value_key = "scripted_post_battle_ancillary_drop_chance_mod",
	rare_drop_chance_bonus_value_key = "rare_ancillary_drop_chance_mod"
}

phar_common_ancillaries = {

	"phar_main_common_general_1",
	"phar_main_common_general_2",
	"phar_main_common_general_4",
	"phar_main_common_general_5",
	"phar_main_common_general_6",
	"phar_main_common_general_7",
	"phar_main_common_general_8",
	"phar_main_common_general_10",
	"phar_main_common_general_11",
	"phar_main_common_general_12",
	"phar_main_common_general_13",
	"phar_main_common_general_14",
	"phar_main_common_general_15",
	"phar_main_common_general_17",
	"phar_main_common_general_20",
	"phar_main_common_general_21",
	"phar_main_common_general_22",
	"phar_main_common_general_23",
	"phar_main_common_general_24",
	"phar_main_common_general_25",
	"phar_main_common_general_26",
	"phar_main_common_general_27",
	"phar_main_common_general_28",
	"phar_main_common_general_29",
	"phar_main_common_equipment_sword",
	"phar_main_common_equipment_khopesh",
	"phar_main_common_equipment_sword",
	"phar_main_common_equipment_spear",
	"phar_main_common_equipment_club",
	"phar_main_common_equipment_axe",
	"phar_main_common_equipment_bow",
	"phar_main_common_equipment_chariot",
	"phar_main_common_armour_heavy",
	"phar_main_common_armour_light",
	"phar_main_common_armour_medium",
	"phar_main_common_shield_large",
	"phar_main_common_shield_medium",
	"phar_main_common_shield_small",
	"phar_sea_common_1",
	"phar_sea_common_2",
	"phar_sea_common_3",
	"phar_sea_common_4",
	"phar_sea_common_5",
	"phar_sea_common_6",
}

realms_to_rare_and_unique_ancillaries_table = {
	egyptian_western_desert_realm = {
		unique = "phar_main_unique_3",
		rare = {
			"phar_main_rare_1",
			"phar_main_rare_36",
			"phar_main_rare_7",
			"phar_main_rare_9",
			"phar_main_rare_14",
			"phar_main_rare_15",
			"phar_main_rare_17",
			"phar_main_rare_32",
			"phar_main_rare_10",
			"phar_main_rare_equipment_khopesh_3",
			"phar_main_rare_equipment_axes_3",
			"phar_main_rare_equipment_bows_2",
			"phar_main_rare_equipment_chariots_2",
			"phar_main_rare_equipment_clubs_3",
			"phar_main_rare_equipment_large_shield_5",
			"phar_main_rare_equipment_light_armour_2",
			"phar_main_rare_equipment_light_armour_6",
			"phar_main_rare_equipment_medium_shield_2",
			"phar_main_rare_equipment_small_shield_5",
			"phar_main_rare_equipment_small_shield_6",
			"phar_sea_rare_1",
			"phar_sea_rare_2",
			"phar_sea_rare_3",
			"phar_sea_rare_4",
			"phar_sea_rare_5",
			"phar_sea_rare_6",
			"phar_sea_rare_7",
			"phar_sea_rare_8",
		},
	},

	egyptian_kush_realm = {
		unique = "phar_main_unique_4",
		rare = {
			"phar_main_rare_4",
			"phar_main_rare_41",
			"phar_main_rare_42",
			"phar_main_rare_43",
			"phar_main_rare_18",
			"phar_main_rare_equipment_small_shield_6",
			"phar_main_rare_equipment_bows_6",
			"phar_main_rare_equipment_axes_1",
			"phar_main_rare_equipment_bows_1",
			"phar_main_rare_equipment_bows_4",
			"phar_main_rare_equipment_clubs_2",
			"phar_main_rare_equipment_khopesh_4",
			"phar_main_rare_equipment_khopesh_5",
			"phar_main_rare_equipment_light_armour_3",
			"phar_main_rare_equipment_light_armour_9",
			"phar_main_rare_equipment_small_shield_7",
			"phar_sea_rare_1",
			"phar_sea_rare_2",
			"phar_sea_rare_3",
			"phar_sea_rare_4",
			"phar_sea_rare_5",
			"phar_sea_rare_6",
			"phar_sea_rare_7",
			"phar_sea_rare_8",
		},
	},

	egyptian_nubia_realm = {
		unique = "phar_main_unique_5",
		rare = {
			"phar_main_rare_41",
			"phar_main_rare_42",
			"phar_main_rare_2",
			"phar_main_rare_24",
			"phar_main_rare_28",
			"phar_main_rare_30",
			"phar_main_rare_39",
			"phar_main_rare_13",
			"phar_main_rare_18",
			"phar_main_rare_equipment_bows_1",
			"phar_main_rare_equipment_khopesh_5",
			"phar_main_rare_equipment_light_armour_2",
			"phar_main_rare_equipment_light_armour_7",
			"phar_main_rare_equipment_bows_3",
			"phar_main_rare_equipment_chariots_3",
			"phar_main_rare_equipment_clubs_4",
			"phar_main_rare_equipment_large_shield_6",
			"phar_main_rare_equipment_light_armour_4",
			"phar_main_rare_equipment_medium_shield_5",
			"phar_main_rare_equipment_spears_1",
			"phar_sea_rare_1",
			"phar_sea_rare_2",
			"phar_sea_rare_3",
			"phar_sea_rare_4",
			"phar_sea_rare_5",
			"phar_sea_rare_6",
			"phar_sea_rare_7",
			"phar_sea_rare_8",
		},
	},

	egyptian_upper_egypt_realm = {
		unique = "phar_main_unique_2",
		rare = {
			"phar_main_rare_2",
			"phar_main_rare_24",
			"phar_main_rare_28",
			"phar_main_rare_27",
			"phar_main_rare_31",
			"phar_main_rare_40",
			"phar_main_rare_11",
			"phar_main_rare_15",
			"phar_main_rare_16",
			"phar_main_rare_32",
			"phar_main_rare_equipment_light_armour_4",
			"phar_main_rare_equipment_axes_1",
			"phar_main_rare_equipment_khopesh_4",
			"phar_main_rare_equipment_bows_2",
			"phar_main_rare_equipment_light_armour_6",
			"phar_main_rare_equipment_khopesh_1",
			"phar_main_rare_equipment_small_shield_2",
			"phar_main_rare_equipment_axes_2",
			"phar_main_rare_equipment_chariots_1",
			"phar_main_rare_equipment_clubs_1",
			"phar_main_rare_equipment_khopesh_2",
			"phar_main_rare_equipment_large_shield_3",
			"phar_main_rare_equipment_medium_armour_5",
			"phar_main_rare_equipment_medium_shield_4",
			"phar_main_rare_equipment_small_shield_4",
			"phar_main_rare_equipment_spears_5",
			"phar_sea_rare_1",
			"phar_sea_rare_2",
			"phar_sea_rare_3",
			"phar_sea_rare_4",
			"phar_sea_rare_5",
			"phar_sea_rare_6",
			"phar_sea_rare_7",
			"phar_sea_rare_8",
		},
	},
	egyptian_lower_egypt_realm = {
		unique = "phar_main_unique_1",
		rare = {
			"phar_main_rare_27",
			"phar_main_rare_31",
			"phar_main_rare_35",
			"phar_main_rare_8",
			"phar_main_rare_12",
			"phar_main_rare_19",
			"phar_main_rare_equipment_khopesh_1",
			"phar_main_rare_equipment_small_shield_2",
			"phar_main_rare_equipment_light_armour_7",
			"phar_main_rare_equipment_bows_6",
			"phar_main_rare_equipment_khopesh_3",
			"phar_main_rare_equipment_axes_5",
			"phar_main_rare_equipment_bows_7",
			"phar_main_rare_equipment_chariots_5",
			"phar_main_rare_equipment_large_shield_4",
			"phar_main_rare_equipment_light_armour_5",
			"phar_main_rare_equipment_medium_shield_1",
			"phar_main_rare_equipment_spears_6",
			"phar_sea_rare_1",
			"phar_sea_rare_2",
			"phar_sea_rare_3",
			"phar_sea_rare_4",
			"phar_sea_rare_5",
			"phar_sea_rare_6",
			"phar_sea_rare_7",
			"phar_sea_rare_8",
		},
	},
	canaanite_sinai_realm = {
		unique = "phar_main_unique_6",
		rare = {
			"phar_main_rare_38",
			"phar_main_rare_7",
			"phar_main_rare_9",
			"phar_main_rare_12",
			"phar_main_rare_13",
			"phar_main_rare_15",
			"phar_main_rare_equipment_light_armour_5",
			"phar_main_rare_equipment_khopesh_2",
			"phar_main_rare_equipment_chariots_3",
			"phar_main_rare_equipment_clubs_4",
			"phar_main_rare_equipment_light_armour_3",
			"phar_main_rare_equipment_small_shield_5",
			"phar_main_rare_equipment_bows_5",
			"phar_main_rare_equipment_chariots_6",
			"phar_main_rare_equipment_heavy_armour_4",
			"phar_main_rare_equipment_large_shield_2",
			"phar_main_rare_equipment_medium_armour_4",
			"phar_main_rare_equipment_medium_armour_2",
			"phar_main_rare_equipment_medium_shield_3",
			"phar_main_rare_equipment_spears_4",
			"phar_main_rare_equipment_swords_5",
			"phar_sea_rare_1",
			"phar_sea_rare_2",
			"phar_sea_rare_3",
			"phar_sea_rare_4",
			"phar_sea_rare_5",
			"phar_sea_rare_6",
			"phar_sea_rare_7",
			"phar_sea_rare_8",
		},
	},
	canaanite_fenkhu_realm = {
		unique = "phar_main_unique_7",
		rare = {
			"phar_main_rare_20",
			"phar_main_rare_21",
			"phar_main_rare_8",
			"phar_main_rare_11",
			"phar_main_rare_16",
			"phar_main_rare_18",
			"phar_main_rare_32",
			"phar_main_rare_10",
			"phar_main_rare_equipment_chariots_6",
			"phar_main_rare_equipment_small_shield_4",
			"phar_main_rare_equipment_bows_7",
			"phar_main_rare_equipment_spears_5",
			"phar_main_rare_equipment_light_armour_9",
			"phar_main_rare_equipment_axes_6",
			"phar_main_rare_equipment_large_shield_1",
			"phar_main_rare_equipment_medium_armour_1",
			"phar_main_rare_equipment_medium_armour_6",
			"phar_main_rare_equipment_swords_4",
			"phar_sea_rare_1",
			"phar_sea_rare_2",
			"phar_sea_rare_3",
			"phar_sea_rare_4",
			"phar_sea_rare_5",
			"phar_sea_rare_6",
			"phar_sea_rare_7",
			"phar_sea_rare_8",
		},
	},
	canaanite_retjenu_realm = {
		unique = "phar_main_unique_8",
		rare = {
			"phar_main_rare_3",
			"phar_main_rare_5",
			"phar_main_rare_6",
			"phar_main_rare_26",
			"phar_main_rare_34",
			"phar_main_rare_44",
			"phar_main_rare_14",
			"phar_main_rare_17",
			"phar_main_rare_equipment_medium_armour_6",
			"phar_main_rare_equipment_swords_4",
			"phar_main_rare_equipment_medium_armour_2",
			"phar_main_rare_equipment_spears_4",
			"phar_main_rare_equipment_large_shield_4",
			"phar_main_rare_equipment_bows_2",
			"phar_main_rare_equipment_axes_2",
			"phar_main_rare_equipment_clubs_2",
			"phar_main_rare_equipment_medium_shield_2",
			"phar_main_rare_equipment_chariots_4",
			"phar_main_rare_equipment_clubs_5",
			"phar_main_rare_equipment_heavy_armour_5",
			"phar_main_rare_equipment_light_armour_8",
			"phar_main_rare_equipment_medium_armour_3",
			"phar_sea_rare_1",
			"phar_sea_rare_2",
			"phar_sea_rare_3",
			"phar_sea_rare_4",
			"phar_sea_rare_5",
			"phar_sea_rare_6",
			"phar_sea_rare_7",
			"phar_sea_rare_8",
		},
	},
	canaanite_yamhad_realm = {
		unique = "phar_main_unique_9",
		rare = {
			"phar_main_rare_22",
			"phar_main_rare_23",
			"phar_main_rare_25",
			"phar_main_rare_29",
			"phar_main_rare_33",
			"phar_main_rare_37",
			"phar_main_rare_13",
			"phar_main_rare_equipment_heavy_armour_5",
			"phar_main_rare_equipment_light_armour_8",
			"phar_main_rare_equipment_bows_5",
			"phar_main_rare_equipment_spears_6",
			"phar_main_rare_equipment_medium_armour_5",
			"phar_main_rare_equipment_spears_1",
			"phar_main_rare_equipment_clubs_3",
			"phar_main_rare_equipment_large_shield_5",
			"phar_main_rare_equipment_axes_4",
			"phar_main_rare_equipment_light_armour_1",
			"phar_main_rare_equipment_swords_3",
			"phar_sea_rare_1",
			"phar_sea_rare_2",
			"phar_sea_rare_3",
			"phar_sea_rare_4",
			"phar_sea_rare_5",
			"phar_sea_rare_6",
			"phar_sea_rare_7",
			"phar_sea_rare_8",
		},
	},
	hittite_isuwa_realm = {
		unique = "phar_main_unique_12",
		rare = {
			"phar_main_rare_22",
			"phar_main_rare_23",
			"phar_main_rare_25",
			"phar_main_rare_29",
			"phar_main_rare_5",
			"phar_main_rare_26",
			"phar_main_rare_11",
			"phar_main_rare_equipment_swords_3",
			"phar_main_rare_equipment_clubs_5",
			"phar_main_rare_equipment_medium_armour_1",
			"phar_main_rare_equipment_large_shield_2",
			"phar_main_rare_equipment_heavy_armour_3",
			"phar_main_rare_equipment_axes_5",
			"phar_main_rare_equipment_chariots_5",
			"phar_main_rare_equipment_medium_shield_1",
			"phar_main_rare_equipment_light_armour_2",
			"phar_main_rare_equipment_medium_shield_5",
			"phar_main_rare_equipment_bows_4",
			"phar_main_rare_equipment_heavy_armour_1",
			"phar_main_rare_equipment_heavy_armour_6",
			"phar_main_rare_equipment_spears_3",
			"phar_sea_rare_1",
			"phar_sea_rare_2",
			"phar_sea_rare_3",
			"phar_sea_rare_4",
			"phar_sea_rare_5",
			"phar_sea_rare_6",
			"phar_sea_rare_7",
			"phar_sea_rare_8",
		},
	},
	hittite_lowlands_realm = {
		unique = "phar_main_unique_11",
		rare = {
			"phar_main_rare_20",
			"phar_main_rare_8",
			"phar_main_rare_12",
			"phar_main_rare_14",
			"phar_main_rare_16",
			"phar_main_rare_19",
			"phar_main_rare_equipment_heavy_armour_3",
			"phar_main_rare_equipment_heavy_armour_1",
			"phar_main_rare_equipment_heavy_armour_6",
			"phar_main_rare_equipment_light_armour_1",
			"phar_main_rare_equipment_chariots_4",
			"phar_main_rare_equipment_medium_armour_3",
			"phar_main_rare_equipment_medium_shield_3",
			"phar_main_rare_equipment_large_shield_3",
			"phar_main_rare_equipment_axes_3",
			"phar_main_rare_equipment_chariots_2",
			"phar_main_rare_equipment_heavy_armour_2",
			"phar_main_rare_equipment_heavy_armour_7",
			"phar_main_rare_equipment_spears_2",
			"phar_main_rare_equipment_swords_1",
			"phar_main_rare_equipment_swords_2",
			"phar_sea_rare_1",
			"phar_sea_rare_2",
			"phar_sea_rare_3",
			"phar_sea_rare_4",
			"phar_sea_rare_5",
			"phar_sea_rare_6",
			"phar_sea_rare_7",
			"phar_sea_rare_8",
		},
	},
	hittite_highlands_realm = {
		unique = "phar_main_unique_10",
		rare = {
			"phar_main_rare_7",
			"phar_main_rare_9",
			"phar_main_rare_17",
			"phar_main_rare_19",
			"phar_main_rare_10",
			"phar_main_rare_equipment_light_armour_1",
			"phar_main_rare_equipment_heavy_armour_2",
			"phar_main_rare_equipment_heavy_armour_7",
			"phar_main_rare_equipment_spears_2",
			"phar_main_rare_equipment_swords_1",
			"phar_main_rare_equipment_swords_2",
			"phar_main_rare_equipment_spears_3",
			"phar_main_rare_equipment_axes_4",
			"phar_main_rare_equipment_axes_6",
			"phar_main_rare_equipment_large_shield_1",
			"phar_main_rare_equipment_heavy_armour_4",
			"phar_main_rare_equipment_medium_armour_4",
			"phar_main_rare_equipment_swords_5",
			"phar_main_rare_equipment_chariots_1",
			"phar_main_rare_equipment_clubs_1",
			"phar_main_rare_equipment_medium_shield_4",
			"phar_main_rare_equipment_large_shield_6",
			"phar_sea_rare_1",
			"phar_sea_rare_2",
			"phar_sea_rare_3",
			"phar_sea_rare_4",
			"phar_sea_rare_5",
			"phar_sea_rare_6",
			"phar_sea_rare_7",
			"phar_sea_rare_8",
		},
	},
}


--- @function get_all_common_and_rare_ancillaries
--- @desc returns a list of all available common + rare ancillary keys concatenated from all available realms
function get_all_common_and_rare_ancillaries()
	local complete_ancillary_list = table_deep_copy(phar_common_ancillaries)

	local function check_ancillary_repetition(list, ancillary)
		for _, list_ancillary in ipairs(list) do
			if list_ancillary == ancillary then
				return true
			end
		end
		return false
	end
	
	for _, realm_data in ipairs(phar_realms.realms) do
		local rare = realms_to_rare_and_unique_ancillaries_table[realm_data.name].rare
		for _, ancillary in ipairs(rare) do
			if not check_ancillary_repetition(complete_ancillary_list, ancillary) then
				table.insert(complete_ancillary_list, ancillary)
			end
		end
	end

	return complete_ancillary_list
end

--- @function get_all_rare_ancillaries
--- @desc returns a list of all available rare ancillary keys concatenated from all available realms
function get_all_rare_ancillaries()
	local complete_ancillary_list = {}
	for _, realm_data in ipairs(phar_realms.realms) do
		table_append(complete_ancillary_list, realms_to_rare_and_unique_ancillaries_table[realm_data.name].rare)
	end

	return complete_ancillary_list
end

--- @function get_all_unique_ancillaries
--- @desc returns a list of all available unique ancillary keys concatenated from all available realms
function get_all_unique_ancillaries()
	local complete_ancillary_list = {}
	for _, realm_data in ipairs(phar_realms.realms) do
		local ancillary_keys = realms_to_rare_and_unique_ancillaries_table[realm_data.name].unique
		if ancillary_keys and not is_table(ancillary_keys) then
			ancillary_keys = { ancillary_keys }
		end
		table_append(complete_ancillary_list, ancillary_keys)
	end

	return complete_ancillary_list
end

--- @function get_all_rare_ancillaries_of_realm
--- @desc returns a list of all available rare ancillary keys of the requested realm
function get_all_rare_ancillaries_of_realm(realm_key)
	if not phar_realms.get_realm(realm_key) then
		script_error("Invalid realm key supplied.")
		return
	end

	return realms_to_rare_and_unique_ancillaries_table[realm_key].rare
end

--- @function get_unique_ancillary_of_realm
--- @desc returns a list of all the unique ancillary keys of the requested realm (currently there's only 1 unique ancillary per realm)
function get_all_unique_ancillaries_of_realm(realm_key)
	if not phar_realms.get_realm(realm_key) then
		script_error("Invalid realm key supplied.")
		return
	end

	local ancillary_keys = realms_to_rare_and_unique_ancillaries_table[realm_key].unique
	if ancillary_keys and not is_table(ancillary_keys) then
		ancillary_keys = { ancillary_keys }
	end

	return ancillary_keys
end

--- @function get_ancillaries_categorized
--- @desc construct and return an indexed table, of associative (key-value) tables
get_ancillaries_categorized = function()
	local ancillary_categories = modular_difficulty_campaign.config.fully_equipped_generals.ancillary_categories

	local ancillaries_by_category = {}
	for _, element in ipairs(ancillary_categories) do
		ancillaries_by_category[element.category] = {}
	end

	local complete_ancillary_list = get_all_common_and_rare_ancillaries()
	for _, ancillary_key in ipairs(complete_ancillary_list) do
		local category = cm:get_ancillary_category(ancillary_key)
		local table_element = ancillaries_by_category[category]

		if table_element then
			table.insert(table_element, ancillary_key)
		else
			script_error("Invalid ancillary category '" .. tostring(category) .. "'")
		end
	end

	return ancillaries_by_category
end


function add_phar_post_battle_ancillaries_listeners()
	core:add_listener(
		"phar_campaign_anciliaries_post_battle",
		"BattleConflictFinished",
		function(context)
			local pb = context:pending_battle()
			local result = pb:battle_results()
			local winning_faction = cm:get_faction(result:winning_faction_key())
			if not winning_faction then
				return false
			end

			local rand = cm:model():random_int(1, 100)
			local drop_chance_bonus_value_key = ancillary_drop_chances.drop_chance_bonus_value_key
			local post_battle_anc_chance_modifier_faction = cm:get_factions_bonus_value(winning_faction, drop_chance_bonus_value_key)
			local post_battle_anc_chance_modifier_character = get_bonus_value_from_winning_character(context, drop_chance_bonus_value_key)
			local post_battle_drop_chance = ancillary_drop_chances.post_battle_drop_chance + post_battle_anc_chance_modifier_faction + post_battle_anc_chance_modifier_character

			return rand <= post_battle_drop_chance
		end,
		function(context)
			local pb = context:pending_battle()
			local result = pb:battle_results()
			local winning_faction = cm:get_faction(result:winning_faction_key())
			if not winning_faction then
				return
			end

			local ancillary_to_give = ""
			local rare_drop_chance_bonus_value_key = ancillary_drop_chances.rare_drop_chance_bonus_value_key
			local rare_anc_drop_chance_modifier_character = get_bonus_value_from_winning_character(context, rare_drop_chance_bonus_value_key)
			local rare_anc_drop_chance_modifier_faction = cm:get_factions_bonus_value(winning_faction, rare_drop_chance_bonus_value_key)
			local rare_anc_drop_chance = ancillary_drop_chances.rare_drop_chance + rare_anc_drop_chance_modifier_faction + rare_anc_drop_chance_modifier_character

			if pb:has_region() then
				local rand = cm:model():random_int(1, 100)

				if rand <= rare_anc_drop_chance then
					local battle_realm = phar_realms.get_realm_for_region(pb:region():name())
					if not battle_realm then
						script_error("Region " .. pb:region():name() .. " has no realm associated with it. Please check phar_realms.lua.")
						return
					end
					local ancillary_pool = realms_to_rare_and_unique_ancillaries_table[battle_realm].rare
					if not ancillary_pool then
						script_error("No ancillaries for realm " .. battle_realm)
						return
					end
					rand = cm:model():random_int(1, #ancillary_pool)
					ancillary_to_give = ancillary_pool[rand]
				end
			end

			if ancillary_to_give == "" then
				local rand = cm:model():random_int(1, #phar_common_ancillaries)
				ancillary_to_give = phar_common_ancillaries[rand]
			end
			local winning_character = get_winning_character(context)

			if result:did_winner_primary_general_survive() then
				cm:force_add_ancillary(cm:char_lookup_str(winning_character), ancillary_to_give)
			end
		end,
		true
	)

	function get_winning_character(context)
		local pb = context:pending_battle()
		local result = pb:battle_results()
		local winning_faction = cm:get_faction(result:winning_faction_key())

		if winning_faction:name() == pb:attacker_faction():name() then
			local attacker = pb:attacker()
			if not attacker:is_null_interface() then
				return attacker
			end
		else
			local defender = pb:defender()
			if not defender:is_null_interface() then
				return defender
			end
		end
	end

	function get_bonus_value_from_winning_character(context, bonus_value_key)
		local character = get_winning_character(context)
		return cm:get_characters_bonus_value(character, bonus_value_key)
	end

	core:add_listener(
		"phar_campaign_anciliaries_conquer_entire_realm",
		"RoundStart",
		function(context)
			return true
		end,
		function(context)
			local faction_list = context:model():world():faction_list()
			for i = 0, faction_list:num_items() - 1 do
				local faction = faction_list:item_at(i)
				for _, realm_data in ipairs(phar_realms.realms) do
					local ancillary_pool = realms_to_rare_and_unique_ancillaries_table[realm_data.name]
					if phar_realms.is_realm_owned_by_faction(realm_data.name, faction:name()) and ancillary_pool and faction:has_faction_leader() then
						cm:force_add_ancillary(cm:char_lookup_str(faction:faction_leader()), ancillary_pool.unique)
					end
				end
			end
		end,
		true
	)

	-- core:add_listener(
	-- 	"phar_ancillary_equip_restriction_listener_on_shemsu_hor",
	-- 	"ShemsuHor_Arrived",
	-- 	true,
	-- 	function(context)
	-- 		local faction_list = cm:get_human_factions() or {}
	-- 		for _, player_faction_key in ipairs(faction_list) do
	-- 			cm:remove_event_restricted_ancillary_type_equip_restriction_for_faction(title_ancillary_type_key, player_faction_key)
	--			cm:remove_event_restricted_ancillary_type_equip_restriction_for_faction(prince_title_ancillary_type_key, player_faction_key)
	-- 		end
	-- 	end,
	-- 	true
	-- )

	-- core:add_listener(
	-- 	"phar_ancillary_equip_restriction_listener_advanced_shemsu_hor",
	-- 	"ShemsuHor_Advanced",
	-- 	true,
	-- 	function(context)
	-- 		local faction_list = cm:get_human_factions() or {}
	-- 		for _, player_faction_key in ipairs(faction_list) do
	-- 			cm:add_event_restricted_ancillary_type_equip_restriction_for_faction(title_ancillary_type_key, player_faction_key)
	-- 			cm:add_event_restricted_ancillary_type_equip_restriction_for_faction(prince_title_ancillary_type_key, player_faction_key)
	-- 		end
	-- 	end,
	-- 	true
	-- )
end

add_phar_post_battle_ancillaries_listeners()