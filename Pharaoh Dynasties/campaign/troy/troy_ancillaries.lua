
--each character has table associated with persistent ancillary data
local ANCILLARIES_DATA = 
{
	--
	--tostring(character:command_queue_index()) = {
		--data1 = 
		--data2 = 
		--data3 = 
		-- ...
	--}

}

------------------------------------------------------------------------------------------
---- retrieves ancillary table associated with a character. If does not exists -> creates new one
------------------------------------------------------------------------------------------
local function get_ancillary_data(character)
	local data
	if not character:is_null_interface() then
		-- not sure if table persistance supports object keys, for that reason we are using strings
		local key = tostring(character:command_queue_index())
		data = ANCILLARIES_DATA[key]
		if data == nil then
			data = {}
			ANCILLARIES_DATA[key] = data
		end
	else
		--
		out("trying to reach data for null character, returning empty data")
		data = {}
	end

	return data
end

--
--	trigger_context.index = trigger index (1 based)
--	trigger_context.trigger = trigger
--	trigger_context.trigger_contexts = table with all contexts
--	trigger_context.trigger_contexts[trigger] = {data_array} -> array with data for all triggers
--	trigger_context.key = ancillary key
--	register_eval_func = function(data) -> returns true if data is compatible with the tracking key

local function track_ancillary_progress(character, key, trigger_context, register_eval_func)
	local ancillary_data = get_ancillary_data(character)

	local val = ancillary_data[key]
	if val == nil then
		val = 0
	end

	local register = trigger_context.index == 1
	if register_eval_func ~= nil and is_function(register_eval_func) then
		local trigger_data = trigger_context.trigger_contexts[trigger_context.trigger]
		if trigger_data ~= nil and trigger_data.data_array ~= nil then
			for index, data in ipairs(trigger_data.data_array) do
				if register_eval_func(data) == true then
					register = index == trigger_context.index
					break
				end
			end
		end
	end

	--
	if register then
		val = val + 1
		ancillary_data[key] = val
		--out("track_ancillary_progress (" .. tostring(character:command_queue_index()) .. "): registering key: " .. key .. "; val: " .. val .. "; index: " .. trigger_context.index)
	--else
	--	out("track_ancillary_progress (" .. tostring(character:command_queue_index()) .. "): key: " .. key .. "; val: " .. val .. "; index: " .. trigger_context.index)
	end

	return val
end


------------------------------------------
--- TRIGGERS
------------------------------------------

--[[
local trigger = {
	event = "",

	or

	event = {"", ""},

	func = function(context, data, trigger_context {key = ancillary key, event = event, index = index (1 based), trigger = trigger, trigger_contexts = { trigger1 = {data_array}, trigger2 = {data_array}, etc }})
		local char = context:character() 
		return 
	end,

	-- returns array with characters, which have to add ancillaries by cm:force_add_ancillary
	func_force_add_ancillary_characters = function(context, data, trigger_context (event = event, index = 0 based index))
		return { character1, character2, etc, }

		or 

		return nil
	end,

}
--]]



------------------------------------------
--- Troy triggers
------------------------------------------

-- helper functions
local is_conquer_decision = function(decision)
	return decision ~= "occupation_decision_raze" and decision ~= "occupation_decision_sack" and decision ~= "occupation_decision_raze_without_occupy" 
end

local is_raze_decision = function(decision)
	return decision == "occupation_decision_raze" or decision == "occupation_decision_raze_without_occupy"
end

local function troy_trig_filter(def, value)
	if def == nil then return false end

	if is_table(def) then
		for _, def_value in ipairs(def) do
			if def_value == value then return false end
		end

		return true
	end

	return def ~= value
end




-- triggers
local troy_trig_conquer_region = {
	event = "CharacterPerformsSettlementOccupationDecision",
	func = function(context, data)
		return data ~= nil and data.region ~= nil and context:garrison_residence():region():name() == data.region and is_conquer_decision(context:occupation_decision_option()) and context:occupation_decision_option() ~= "occupation_decision_do_nothing"
	end,
}

local troy_trig_destroy_faction = {
	event = "FactionDestroysOtherFaction",
	func = function(context, data)
		local other_faction = context:other_faction()
		local character = context:character()
		return data ~= nil and data.faction ~= nil and not other_faction:is_null_interface() and not character:is_null_interface() and other_faction:name() == data.faction
	end, 
}

local troy_trig_kill_general = {
	event = "CharacterKilledOtherCharacter",
	func = function(context, data)
		local character = context:character()
		local other_character = context:other_character()

		--out("CharacterKilledOtherCharacter: " .. other_character:faction():name() .. ", " .. data.faction)
		return data ~= nil and ( (data.faction == nil or other_character:faction():name() == data.faction) and (data.faction_leader ~= true or other_character:is_faction_leader()) ) and other_character:character_type("general")
	end 
}

local troy_trig_conquer_province = {
	event = "CharacterPerformsSettlementOccupationDecision",
	func = function(context, data)
		local character = context:character()
		local region = context:garrison_residence():region()
		local province = region:province()
		
		if data ~= nil and data.province ~= nil and province:name() == data.province and is_conquer_decision(context:occupation_decision_option()) then
			local regions_in_province = province:regions()
			for i = 0, regions_in_province:num_items() - 1 do
				local region_in_province = regions_in_province:item_at(i)
				if region:name() ~= region_in_province:name() and region_in_province:owning_faction():name() ~= character:faction():name() then
					return false
				end
			end

			return true
		end

		return false
	end,
}

local troy_trig_kill_n_heroes = {
	event = "CharacterKilledOtherCharacter",
	func = function(context, data, trigger_context)
		local character = context:character()
		local other_character = context:other_character()

		if data == nil or data.n == nil or not character:character_type("general") or not other_character:character_type("general") then return false end

		local other_character_subculture = other_character:faction():subculture()

		local generals_killed = track_ancillary_progress(character, "generals_killed_in_battle", trigger_context)
		local generals_killed_with_subculture = track_ancillary_progress(character, "generals_killed_in_battle" .. "_" .. other_character_subculture, trigger_context, function(eval_data) return eval_data.subculture ~= nil and eval_data.subculture == other_character_subculture end)

		--
		if data.subculture ~= nil then
			return other_character_subculture == data.subculture and generals_killed_with_subculture == data.n
		end

		return generals_killed == data.n
	end 
}


local troy_trig_occupy_n_major_settlements = {
	event = "CharacterPerformsSettlementOccupationDecision",
	func = function(context, data, trigger_context)
		local decision = context:occupation_decision_option()
		if data == nil or data.n == nil or (data.conquer == true and not is_conquer_decision(decision)) or (data.raze == true and not is_raze_decision(decision)) or not context:garrison_residence():region():is_province_capital() then return false end

		if data.conquer then
			return track_ancillary_progress(context:character(), "major_settlements_conquered", trigger_context, function(eval_data) return eval_data.conquer ~= nil and eval_data.conquer == true end) == data.n
		end

		if data.raze then
			return track_ancillary_progress(context:character(), "major_settlements_razed", trigger_context, function(eval_data) return eval_data.raze ~= nil and eval_data.raze == true end) == data.n
		end

		return false
	end,
}

local troy_trig_won_n_siege_battles_as_attacker_against_general_with_specific_subculture = {
	event = "BattleConflictFinished",
	func = function(context, data, trigger_context)
		local pending_battle = context:pending_battle()
		local attacker = pending_battle:attacker()
		local defender = pending_battle:defender()

		--out("troy_trig_won_n_siege_battles_as_attacker_against_general_with_specific_subculture: " .. trigger_context.key .. "; " .. data.subculture .. "; " .. defender:faction():subculture() .. "; " .. data.n)

		if data == nil or data.n == nil or not data.subculture or attacker:is_null_interface() or defender:is_null_interface() or not attacker:won_battle() or pending_battle:seige_battle() == false or not defender:character_type("general") or defender:faction():subculture() ~= data.subculture then return false end
		return track_ancillary_progress(attacker, "siege_battles_won_as_attacker_against_general_with_subculture_" .. data.subculture, trigger_context, function(eval_data) return eval_data.subculture ~= nil and eval_data.subculture == data.subculture end) == data.n
	end,

	func_force_add_ancillary_characters = function(context, data, trigger_context)
		return { context:pending_battle():attacker(), }
	end,
}

-- [optional]
--	character_type = "type"
-- or
--	character_type = {"type1", "type2", ...}

-- [optional]
--	character_subtype = "subtype"
--	or
--	character_subtype = {"subtype1", "subtype2", ...}
--},


local troy_trig_n_successful_agent_actions = {
	event = "CharacterPerformedSuccessfulAgentAction",
	func = function(context, data, trigger_context)
		local character = context:character()
		if data == nil or data.n == nil then return false end

		--
		if troy_trig_filter(data.character_type, character:character_type_key()) then return false end
		if troy_trig_filter(data.character_subtype, character:character_subtype_key()) then return false end

		return track_ancillary_progress(character, "successful_agent_actions", trigger_context) == data.n
	end 
}

local troy_trig_kill_n_heroes_from_agents = {
	event = "CharacterKilledOtherCharacter",
	func = function(context, data, trigger_context)
		local character = context:character()
		local other_character = context:other_character()

		if data == nil or data.n == nil or not character:character_type("spy") or not other_character:character_type("general") then return false end
		return track_ancillary_progress(character, "generals_killed_with_agent_actions", trigger_context) == data.n
	end 
}

local troy_trig_win_n_battles = {
	event = "CharacterCompletedBattle",
	func = function(context,data)
		local character = context:character()
		
		if data == nil or data.n == nil or not character:won_battle() or character:battles_won() ~= data.n then return false end
		return data.own_region ~= true or (character:has_region() and character:region():owning_faction() == character:faction())
	end
}

local troy_trig_win_n_battles_siege_attacker = {
	event = "CharacterCompletedBattle",
	func = function(context,data)
		local character = context:character()

		if data == nil or data.n == nil then return false end
		
		return character:offensive_sieges_won() == data.n
	end
}

local troy_trig_win_n_battles_siege_defender = {
	event = "CharacterCompletedBattle",
	func = function(context,data)
		local character = context:character()

		if data == nil or data.n == nil then return false end
		
		return character:defensive_sieges_won() == data.n
	end
}

local troy_trig_build_specified_building = {
	event = "CharacterRankUp",
	func = function(context,data)
		local character = context:character()

		if data == nil or data.n == nil or data.building == nil or character:rank() < data.n then 
			return false 
		end

		local regions_list = character:faction():region_list()
		for i = 0, regions_list:num_items() - 1 do
			if regions_list:item_at(i):building_exists(data.building) then
				return true
			end
		end
		
		return false
	end
}


--data = {
--	n = 16,

-- [optional]
--	where = "enemy"
-- or
--	where = "own",

-- [optional]
--	character_type = "type"
-- or
--	character_type = {"type1", "type2", ...}

-- [optional]
--	character_subtype = "subtype"
--	or
--	character_subtype = {"subtype1", "subtype2", ...}
--},


local troy_trig_achieve_character_rank = {
	event = "CharacterRankUp",
	func = function(context,data)
		local character = context:character()

		--
		if data == nil or data.n == nil then return false end

		--
		if troy_trig_filter(data.character_type, character:character_type_key()) then return false end
		if troy_trig_filter(data.character_subtype, character:character_subtype_key()) then return false end

		if data.where and data.where == "enemy" then
			return character:rank() == data.n and character:has_region() and character:region():owning_faction() ~= character:faction()
		elseif data.where and data.where == "own" then
			return character:rank() == data.n and character:has_region() and character:region():owning_faction() == character:faction()
		end 

		return character:rank() == data.n
	end
}

local troy_trig_win_n_naval_battles = {
	event = "CharacterCompletedBattle",
	func = function(context,data)
		local character = context:character()

		if data == nil or data.n == nil then return false end
		
		return character:offensive_naval_battles_won() + character:defensive_naval_battles_won() == data.n
	end
}

local troy_trig_win_n_siege_battles_combined = {
	event = "CharacterCompletedBattle",
	func = function(context,data)
		local character = context:character()
		if data == nil or data.n == nil or not character:won_battle() then return false end

		return character:offensive_sieges_won() + character:defensive_sieges_won() == data.n
	end
}

local troy_trig_kill_hero_while_maintaining_favour_tier = {
	event = "CharacterKilledOtherCharacter",
	func = function(context, data)
		local character = context:character()

		if troy_trig_filter(data.character_type, character:character_type_key()) then return false end
		if troy_trig_filter(data.character_subtype, character:character_subtype_key()) then return false end

		return data ~= nil and data.god ~= nil and data.god_tier ~= nil and context:other_character():character_type("general") and context:character():faction():attitude_tier_for_god(data.god) >= data.god_tier
	end
}

local troy_trig_construct_building_and_control_region = {
	event = "CharacterRankUp",
	func = function(context,data)
		local character = context:character()

		if data == nil or data.n == nil or data.building == nil or data.region == nil or character:rank() < data.n then 
			return false 
		end

		local region = cm:model():world():region_manager():region_by_key(data.region)
		return region ~= nil and region:owning_faction() == character:faction() and region:building_exists(data.building)
	end
}
------------------------------------------
--- End of Troy Triggers
------------------------------------------


ancillary_to_triggers = {
	--[[ Example usage
	{
		ancillary_key = "troy_main_anc_item_jason_gemstone", // key from ancillaries table
		trigger = troy_trig_conquer_region, // key of the appropriate trigger table
		chance = 5, // chance in % of this ancillary being given out, provided the trigger condition is met
		data = {
			---
		},
		[optional]
		restrict_from_campaigns = { "troy_historical", ... }, // do not give out this ancillary in certain campaigns
	}

	--]]

	-- Conquer region
	{
		ancillary_key = "troy_main_anc_item_jason_gemstone",
		trigger = troy_trig_conquer_region,
		chance = 100,
		data = {
			region = "troy_main_magnesia_olizon" -- troy_main_magnesia_iolcos (c) troy_main_magnesia_meliboea
		},
	},

	{
		ancillary_key = "troy_main_anc_item_dragon_teeth",
		trigger = troy_trig_conquer_region,
		chance = 100,
		data = {
			region = "troy_main_boeotia_thebes" -- troy_main_magnesia_iolcos (c) troy_main_magnesia_meliboea
		},
	},

	{
		ancillary_key = "troy_main_anc_item_harmonia_necklace",
		trigger = troy_trig_conquer_region,
		chance = 50,
		data = {
			region = "troy_main_argolis_erchomenos" -- troy_main_magnesia_iolcos (c) troy_main_magnesia_meliboea
		},
	},

	{
		ancillary_key = "troy_main_anc_weapon_perseus_harpe",
		trigger = troy_trig_conquer_region,
		chance = 50,
		data = {
			region = "troy_main_isthmos_knidos" -- troy_main_magnesia_iolcos (c) troy_main_magnesia_meliboea
		},
		restrict_from_campaigns = { "troy_historical"},
	},

	{
		ancillary_key = "troy_main_anc_armour_helm_darkness",
		trigger = troy_trig_conquer_region,
		chance = 50,
		data = {
			region = "troy_main_cragos_myra" -- troy_main_magnesia_iolcos (c) troy_main_magnesia_meliboea
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_perseus_shield",
		trigger = troy_trig_conquer_region,
		chance = 100,
		data = {
			region = "troy_main_attica_athens" -- troy_main_magnesia_iolcos (c) troy_main_magnesia_meliboea
		},
	},

	{
		ancillary_key = "troy_main_anc_item_bellerophont_bridle",
		trigger = troy_trig_conquer_region,
		chance = 50,
		data = {
			region = "troy_main_mycenaeca_corinth" -- troy_main_magnesia_iolcos (c) troy_main_magnesia_meliboea
		},
	},

	{
		ancillary_key = "troy_main_anc_weapon_leaden_spear",
		trigger = troy_trig_conquer_region,
		chance = 50,
		data = {
			region = "troy_main_mycenaeca_stymphalos" -- troy_main_magnesia_iolcos (c) troy_main_magnesia_meliboea
		},
		restrict_from_campaigns = { "troy_historical"},
	},

	{
		ancillary_key = "troy_main_anc_item_golden_fleece",
		trigger = troy_trig_conquer_region,
		chance = 10,
		data = {
			region = "troy_main_magnesia_iolcos" -- troy_main_magnesia_iolcos (c) troy_main_magnesia_meliboea
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_meleager_armour",
		trigger = troy_trig_conquer_region,
		chance = 100,
		data = {
			region = "troy_main_ozolian_locris_amphissa" -- troy_main_magnesia_iolcos (c) troy_main_magnesia_meliboea
		},
	},

	{
		ancillary_key = "troy_main_anc_item_pelt_calydonian",
		trigger = troy_trig_conquer_region,
		chance = 100,
		data = {
			region = "troy_main_aetolia_calydon" -- troy_main_magnesia_iolcos (c) troy_main_magnesia_meliboea
		},
	},

	{
		ancillary_key = "troy_main_anc_item_tusks_calydonian",
		trigger = troy_trig_conquer_region,
		chance = 50,
		data = {
			region = "troy_main_thessaliotis_ctimene" -- troy_main_magnesia_iolcos (c) troy_main_magnesia_meliboea
		},
	},

	{
		ancillary_key = "troy_main_anc_item_ancaeus_bearskin",
		trigger = troy_trig_conquer_region,
		chance = 100,
		data = {
			region = "troy_main_ozolian_locris_tolofon" -- troy_main_magnesia_iolcos (c) troy_main_magnesia_meliboea
		},
	},

	{
		ancillary_key = "troy_main_anc_weapon_periphetes_club",
		trigger = troy_trig_conquer_region,
		chance = 100,
		data = {
			region = "troy_main_tyrinthia_epidayrus" -- troy_main_magnesia_iolcos (c) troy_main_magnesia_meliboea
		},
		restrict_from_campaigns = { "troy_historical"},
	},
	
	{
		ancillary_key = "troy_main_anc_item_ariadne_thread",
		trigger = troy_trig_conquer_region,
		chance = 50,
		data = {
			region = "troy_main_ida_lyttos" -- troy_main_magnesia_iolcos (c) troy_main_magnesia_meliboea
		},
	},

	{
		ancillary_key = "troy_main_anc_weapon_erysichthon_axe",
		trigger = troy_trig_conquer_region,
		chance = 100,
		data = {
			region = "troy_main_thessaliotis_pharsalos" -- troy_main_magnesia_iolcos (c) troy_main_magnesia_meliboea
		},
	},

	{
		ancillary_key = "troy_main_anc_weapon_bellerophon_bow",
		trigger = troy_trig_conquer_region,
		chance = 100,
		data = {
			region = "troy_main_cragos_phellos" -- troy_main_magnesia_iolcos (c) troy_main_magnesia_meliboea
		},
		restrict_from_campaigns = { "troy_historical"},
	},

	{
		ancillary_key = "troy_main_anc_item_amphion_lyre",
		trigger = troy_trig_conquer_region,
		chance = 100,
		data = {
			region = "troy_main_boeotia_hyria" -- troy_main_magnesia_iolcos (c) troy_main_magnesia_meliboea
		},
	},

	{
		ancillary_key = "troy_main_anc_item_hesperides_apples",
		trigger = troy_trig_conquer_region,
		chance = 50,
		data = {
			region = "troy_main_cephallenia_hyrie" -- troy_main_magnesia_iolcos (c) troy_main_magnesia_meliboea
		},
	},

	{
		ancillary_key = "troy_main_anc_weapon_procris_spear",
		trigger = troy_trig_conquer_region,
		chance = 50,
		data = {
			region = "troy_main_cephallenia_kranioi" -- troy_main_magnesia_iolcos (c) troy_main_magnesia_meliboea
		},
	},

	{
		ancillary_key = "troy_main_anc_item_minos_ring",
		trigger = troy_trig_conquer_region,
		chance = 50,
		data = {
			region = "troy_main_ida_gortys" -- troy_main_magnesia_iolcos (c) troy_main_magnesia_meliboea
		},
	},

	{
		ancillary_key = "troy_main_anc_item_orpheus_lyre",
		trigger = troy_trig_conquer_region,
		chance = 50,
		data = {
			region = "troy_main_zonaea_aenos" 
		},
	},

	{
		ancillary_key = "troy_main_anc_weapon_syrinx_hornbow",
		trigger = troy_trig_conquer_region,
		chance = 50,
		data = {
			region = "troy_main_aegialeia_cleitor" 
		},
	},

	{
		ancillary_key = "troy_main_anc_weapon_jason_sceptre",
		trigger = troy_trig_conquer_region,
		chance = 50,
		data = {
			region = "troy_main_magnesia_meliboea" 
		},
	},

	{
		ancillary_key = "troy_main_anc_item_prometheus_oil",
		trigger = troy_trig_conquer_region,
		chance = 25,
		data = {
			region = "troy_main_phthia_pherae" 
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_aeetus_armour",
		trigger = troy_trig_conquer_region,
		chance = 50,
		data = {
			region = "troy_main_bythynia_procerastis" 
		},
		restrict_from_campaigns = { "troy_historical"},
	},

	{
		ancillary_key = "troy_main_anc_weapon_pandarus_bow",
		trigger = troy_trig_conquer_region,
		chance = 50,
		data = {
			region = "troy_main_apaesos_percote" 
		},
	},

	{
		ancillary_key = "troy_main_anc_item_golden_grapevine",
		trigger = troy_trig_conquer_region,
		chance = 50,
		data = {
			region = "troy_main_apaesos_pegaea" 
		},
	},

	{
		ancillary_key = "troy_main_anc_item_polydamna_herb",
		trigger = troy_trig_conquer_region,
		chance = 100,
		data = {
			region = "troy_main_ide_zeleia" 
		},
	},

	{
		ancillary_key = "troy_main_anc_item_ino_veil",
		trigger = troy_trig_conquer_region,
		chance = 50,
		data = {
			region = "troy_main_zerynthia_nesoi_saos" 
		},
	},

	{
		ancillary_key = "troy_main_anc_item_aeolus_bag",
		trigger = troy_trig_conquer_region,
		chance = 50,
		data = {
			region = "troy_main_borreas_sipte" 
		},
	},

	{
		ancillary_key = "troy_main_anc_item_beast_drink_circe",
		trigger = troy_trig_conquer_region,
		chance = 50,
		data = {
			region = "troy_main_epirus_onchesmos" 
		},
	},

	{
		ancillary_key = "troy_main_anc_weapon_sceptre_circe",
		trigger = troy_trig_conquer_region,
		chance = 50,
		data = {
			region = "troy_main_korcyra_scheria" 
		},
	},

	{
		ancillary_key = "troy_main_anc_item_hermes_root",
		trigger = troy_trig_conquer_region,
		chance = 25,
		data = {
			region = "troy_main_arachthos_nekromanteion" 
		},
	},

	{
		ancillary_key = "troy_main_anc_item_circe_salve",
		trigger = troy_trig_conquer_region,
		chance = 25,
		data = {
			region = "troy_main_epirus_cichyros" 
		},
	},

	{
		ancillary_key = "troy_main_anc_item_melampus_cure",
		trigger = troy_trig_conquer_region,
		chance = 50,
		data = {
			region = "troy_main_elis_altis" 
		},
	},

	{
		ancillary_key = "troy_main_anc_item_tydeus_boarskin",
		trigger = troy_trig_conquer_region,
		chance = 25,
		data = {
			region = "troy_main_tyrinthia_tiryns" 
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_capaneus_shield",
		trigger = troy_trig_conquer_region,
		chance = 25,
		data = {
			region = "troy_main_boeotia_thisbe" 
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_hippomedon_shield",
		trigger = troy_trig_conquer_region,
		chance = 50,
		data = {
			region = "troy_main_megaris_megara" 
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_parthenopeus_shield",
		trigger = troy_trig_conquer_region,
		chance = 25,
		data = {
			region = "troy_main_ozolian_locris_cyparissos" 
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_amphiaraus_shield",
		trigger = troy_trig_conquer_region,
		chance = 25,
		data = {
			region = "troy_main_cephisos_opous" 
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_polynices_shield",
		trigger = troy_trig_conquer_region,
		chance = 25,
		data = {
			region = "troy_main_aegialeia_aegion" 
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_memnon_armour",
		trigger = troy_trig_conquer_region,
		chance = 25,
		data = {
			region = "troy_main_maeandros_eyanthia" 
		},
	},

	{
		ancillary_key = "troy_main_anc_weapon_arethous_club",
		trigger = troy_trig_conquer_region,
		chance = 25,
		data = {
			region = "troy_main_messenia_mantineia" 
		},
		restrict_from_campaigns = { "troy_historical"},
	},

	{
		ancillary_key = "troy_main_anc_weapon_teucros_bow",
		trigger = troy_trig_conquer_region,
		chance = 25,
		data = {
			region = "troy_main_megaris_salamis" 
		},
	},

	{
		ancillary_key = "troy_main_anc_weapon_sword_troy",
		trigger = troy_trig_conquer_region,
		chance = 50,
		data = {
			region = "troy_main_ilion_troy" 
		},
	},

	{
		ancillary_key = "troy_main_anc_item_seal_pylos",
		trigger = troy_trig_conquer_region,
		chance = 20,
		data = {
			region = "troy_main_messenia_pylos" 
		},
	},

	{
		ancillary_key = "troy_main_anc_item_seal_sparta",
		trigger = troy_trig_conquer_region,
		chance = 20,
		data = {
			region = "troy_main_lacedaemon_sparta" 
		},
	},

	{
		ancillary_key = "troy_main_anc_item_seal_gla",
		trigger = troy_trig_conquer_region,
		chance = 20,
		data = {
			region = "troy_main_cephisos_gla" 
		},
	},

	{
		ancillary_key = "troy_main_anc_item_seal_lyrnessos",
		trigger = troy_trig_conquer_region,
		chance = 20,
		data = {
			region = "troy_main_aega_lyrnessos" 
		},
	},

	{
		ancillary_key = "troy_main_anc_item_seal_telmessos",
		trigger = troy_trig_conquer_region,
		chance = 20,
		data = {
			region = "troy_main_lycia_telmessos" 
		},
	},

	{
		ancillary_key = "troy_main_anc_item_seal_knidos",
		trigger = troy_trig_conquer_region,
		chance = 20,
		data = {
			region = "troy_main_isthmos_knidos" 
		},
	},

	{
		ancillary_key = "troy_main_anc_item_seal_ephesos",
		trigger = troy_trig_conquer_region,
		chance = 20,
		data = {
			region = "troy_main_kaystros_ephesos" 
		},
	},

	{
		ancillary_key = "troy_main_anc_mount_pedasos",
		trigger = troy_trig_conquer_region,
		chance = 50,
		data = {
			region = "troy_main_aega_pedasos" 
		},
	},

	{
		ancillary_key = "troy_main_anc_follower_antenor",
		trigger = troy_trig_conquer_region,
		chance = 50,
		data = {
			region = "troy_main_ilion_troy" 
		},
	},

	{
		ancillary_key = "troy_main_anc_follower_hecamede",
		trigger = troy_trig_conquer_region,
		chance = 50,
		data = {
			region = "troy_main_zerynthia_nesoi_imbrasos" 
		},
	},

	{
		ancillary_key = "troy_main_anc_follower_clymene",
		trigger = troy_trig_conquer_region,
		chance = 50,
		data = {
			region = "troy_main_troas_larisa" 
		},
	},

	{
		ancillary_key = "troy_main_anc_follower_deinome",
		trigger = troy_trig_conquer_region,
		chance = 50,
		data = {
			region = "troy_main_ide_zeleia" 
		},
	},

	{
		ancillary_key = "troy_main_anc_follower_xenodice",
		trigger = troy_trig_conquer_region,
		chance = 50,
		data = {
			region = "troy_main_ilion_thymbra" 
		},
	},

	{
		ancillary_key = "troy_main_anc_follower_mimas",
		trigger = troy_trig_conquer_region,
		chance = 25,
		data = {
			region = "troy_main_dardania_arisbe" 
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_aegis_athena",
		trigger = troy_trig_conquer_region,
		chance = 25,
		data = {
			region = "troy_main_attica_athens" 
		},
	},

	{
		ancillary_key = "troy_main_anc_item_kronos_sickle",
		trigger = troy_trig_conquer_region,
		chance = 25,
		data = {
			region = "troy_main_phthia_pteleon" 
		},
	},

	{
		ancillary_key = "troy_main_anc_item_triton_horn",
		trigger = troy_trig_conquer_region,
		chance = 50,
		data = {
			region = "troy_main_cyclades_naxos" 
		},
	},

	{
		ancillary_key = "troy_main_anc_item_hermes_sceptre",
		trigger = troy_trig_conquer_region,
		chance = 25,
		data = {
			region = "troy_main_epagris_syros" 
		},
	},

	{
		ancillary_key = "troy_main_anc_item_dionysus_thyrsus",
		trigger = troy_trig_conquer_region,
		chance = 25,
		data = {
			region = "troy_main_thrace_ismaros" 
		},
	},

	{
		ancillary_key = "troy_main_anc_item_pan_syrinx",
		trigger = troy_trig_conquer_region,
		chance = 25,
		data = {
			region = "troy_main_elis_aliphera" 
		},
	},

	{
		ancillary_key = "troy_main_anc_weapon_artemis_bow",
		trigger = troy_trig_conquer_region,
		chance = 50,
		data = {
			region = "troy_main_melamphylos_kos" 
		},
		restrict_from_campaigns = { "troy_historical"},
	},

	{
		ancillary_key = "troy_main_anc_weapon_appolo_bow",
		trigger = troy_trig_conquer_region,
		chance = 50,
		data = {
			region = "troy_main_lesbos_methymna" 
		},
		restrict_from_campaigns = { "troy_historical"},
	},

	{
		ancillary_key = "troy_main_anc_weapon_shortbow_eros",
		trigger = troy_trig_conquer_region,
		chance = 50,
		data = {
			region = "troy_main_euboea_eretria" 
		},
		restrict_from_campaigns = { "troy_historical"},
	},

	{
		ancillary_key = "troy_main_anc_armour_athena_helm",
		trigger = troy_trig_conquer_region,
		chance = 25,
		data = {
			region = "troy_main_attica_thorikos" 
		},
	},
	
	-- Destroy faction
--	{
--		ancillary_key = "troy_main_anc_weapon_peleus_spear",
--		trigger = troy_trig_destroy_faction,
--		chance = 50,
--		data = {
--			faction = "troy_main_dan_achilles"
--		},
--	},

--	{
--		ancillary_key = "troy_main_anc_item_apple_discord",
--		trigger = troy_trig_destroy_faction,
--		chance = 100,
--		data = {
--			faction = "troy_main_trj_paris"
--		},
--	},

--	{
--		ancillary_key = "troy_main_anc_mount_mares_diomedes_thrace",
--		trigger = troy_trig_destroy_faction,
--		chance = 100,
--		data = {
--			faction = "troy_main_trj_apsynthioi"
--		},
--	},

	{
		ancillary_key = "troy_main_anc_armour_hippolyta_girdle",
		trigger = troy_trig_destroy_faction,
		chance = 100,
		data = {
			faction = "troy_amazons_trj_hippolyta"
		},
		restrict_from_campaigns = { "troy_historical" }
	},

	{
		ancillary_key = "troy_hist_anc_armour_hippolyta_girdle",
		trigger = troy_trig_destroy_faction,
		chance = 100,
		data = {
			faction = "troy_amazons_trj_hippolyta"
		},
		restrict_from_campaigns = { "main_troy", "troy_mythic" }
	},

	{
		ancillary_key = "troy_main_anc_weapon_peleus_sword",
		trigger = troy_trig_destroy_faction,
		chance = 50,
		data = {
			faction = "troy_main_dan_achilles"
		},
	},

	{
		ancillary_key = "troy_main_anc_weapon_agamemnon_javelin",
		trigger = troy_trig_destroy_faction,
		chance = 100,
		data = {
			faction = "troy_main_dan_mycenae"
		},
	},

--	{
--		ancillary_key = "troy_main_anc_weapon_sceptre_agamemnon",
--		trigger = troy_trig_destroy_faction,
--		chance = 100,
--		data = {
--			faction = "troy_main_dan_mycenae"
--		},
--	},

--	{
--		ancillary_key = "troy_main_anc_item_paris_leopard",
--		trigger = troy_trig_destroy_faction,
--		chance = 100,
--		data = {
--			faction = "troy_main_trj_paris"
--		},
--	},

	{
		ancillary_key = "troy_main_anc_weapon_diomedes_spear",
		trigger = troy_trig_destroy_faction,
		chance = 50,
		data = {
			faction = "troy_main_dan_argos"
		},
	},

--	{
--		ancillary_key = "troy_main_anc_armour_ajax_tower",
--		trigger = troy_trig_destroy_faction,
--		chance = 50,
--		data = {
--			faction = "troy_main_dan_salamis"
--		},
--	},

--	{
--		ancillary_key = "troy_main_anc_weapon_hector_sword",
--		trigger = troy_trig_destroy_faction,
--		chance = 50,
--		data = {
--			faction = "troy_main_trj_hector"
--		},
--	},

	{
	ancillary_key = "troy_main_anc_armour_hector_helmet",
	trigger = troy_trig_destroy_faction,
	chance = 50,
	data = {
		faction = "troy_main_trj_hector"
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_hector_shield",
		trigger = troy_trig_destroy_faction,
		chance = 50,
		data = {
			faction = "troy_main_trj_hector"
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_achilles_shield",
		trigger = troy_trig_destroy_faction,
		chance = 25,
		data = {
			faction = "troy_main_dan_achilles"
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_achilles_helm",
		trigger = troy_trig_destroy_faction,
		chance = 25,
		data = {
			faction = "troy_main_dan_achilles"
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_ajax_belt",
		trigger = troy_trig_destroy_faction,
		chance = 50,
		data = {
			faction = "troy_main_dan_salamis"
		},
	},

	{
		ancillary_key = "troy_main_anc_mount_rhesus_steeds",
		trigger = troy_trig_destroy_faction,
		chance = 50,
		data = {
			faction = "troy_main_trj_thrakes"
		},
	},

--	{
--		ancillary_key = "troy_main_anc_item_menelaus_belt",
--		trigger = troy_trig_destroy_faction,
--		chance = 50,
--		data = {
--			faction = "troy_main_dan_sparta"
--		},
--	},

	{
		ancillary_key = "troy_main_anc_armour_odysseus_night_helm",
		trigger = troy_trig_destroy_faction,
		chance = 100,
		data = {
			faction = "troy_main_dan_ithaca"
		},
	},

--	{
--		ancillary_key = "troy_main_anc_armour_odysseus_boar_helm",
--		trigger = troy_trig_destroy_faction,
--		chance = 50,
--		data = {
--			faction = "troy_main_dan_ithaca"
--		},
--	},

--	{
--		ancillary_key = "troy_main_anc_armour_agamemnon_shield",
--		trigger = troy_trig_destroy_faction,
--		chance = 50,
--		data = {
--			faction = "troy_main_dan_mycenae"
--		},
--	},

-- {
--	--	ancillary_key = "troy_main_anc_item_tethis_cup",
--		trigger = troy_trig_destroy_faction,
--		chance = 25,
--		data = {
--			faction = "troy_main_dan_achilles"
--		},
--	},

	--{
	--	ancillary_key = "troy_main_anc_armour_sarpedon_armour",
	--	trigger = troy_trig_destroy_faction,
	--	chance = 50,
	--	data = {
	--		faction = "troy_main_trj_lycia"
	--	},
	--},

	{
		ancillary_key = "troy_main_anc_weapon_ajax_long_spear",
		trigger = troy_trig_destroy_faction,
		chance = 25,
		data = {
			faction = "troy_main_dan_salamis"
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_sarpedon_shield",
		trigger = troy_trig_destroy_faction,
		chance = 100,
		data = {
			faction = "troy_main_trj_lycia"
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_menelaus_shield",
		trigger = troy_trig_destroy_faction,
		chance = 100,
		data = {
			faction = "troy_main_dan_sparta"
		},
	},

	--{
	--	ancillary_key = "troy_main_anc_armour_hector_armour",
	--	trigger = troy_trig_destroy_faction,
	--	chance = 50,
	--	data = {
	--		faction = "troy_main_trj_hector"
	--	},
	--},

	{
		ancillary_key = "troy_main_anc_armour_aeneas_shield",
		trigger = troy_trig_destroy_faction,
		chance = 100,
		data = {
			faction = "troy_main_trj_dardania"
		},
	},

	--{
	--	ancillary_key = "troy_main_anc_armour_aeneas_helmet",
	--	trigger = troy_trig_destroy_faction,
	--	chance = 50,
	--	data = {
	--		faction = "troy_main_trj_dardania"
	--	},
	--},

	{
		ancillary_key = "troy_main_anc_mount_balius_xanthus",
		trigger = troy_trig_destroy_faction,
		chance = 50,
		data = {
			faction = "troy_main_dan_achilles"
		},
	},

	--{
	--	ancillary_key = "troy_main_anc_armour_penthesilea_helm",
	--	trigger = troy_trig_destroy_faction,
	--	chance = 100,
	--	data = {
	--		faction = "troy_amazons_trj_penthesilea"
	--	},
	--},

	--{
	--	ancillary_key = "troy_main_anc_item_themiscyran_chalice",
	--	trigger = troy_trig_destroy_faction,
	--	chance = 100,
	--	data = {
	--		faction = "troy_amazons_trj_hippolyta"
	--	},
	--},

	{
		ancillary_key = "troy_main_anc_item_cup_nestor",
		trigger = troy_trig_destroy_faction,
		chance = 50,
		data = {
			faction = "troy_main_dan_pylos"
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_zoster_belt",
		trigger = troy_trig_destroy_faction,
		chance = 100,
		data = {
			faction = "troy_main_dan_boeotians"
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_bronze_zoster_belt",
		trigger = troy_trig_destroy_faction,
		chance = 100,
		data = {
			faction = "troy_main_trj_tereia"
		},
	},

	{
		ancillary_key = "troy_main_anc_follower_ucalegon",
		trigger = troy_trig_destroy_faction,
		chance = 100,
		data = {
			faction = "troy_main_trj_troy"
		},
	},

	-- Kill a general from specific faction in battle
	{
		ancillary_key = "troy_main_anc_weapon_ancaeus_labrys",
		trigger = troy_trig_kill_general,
		chance = 25,
		data = {
			faction = "troy_main_dan_magnetes"
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_zone_belt",
		trigger = troy_trig_kill_general,
		chance = 12,
		data = {
			faction = "troy_main_dan_thessalians"
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_zoster_belt",
		trigger = troy_trig_kill_general,
		chance = 12,
		data = {
			faction = "troy_main_dan_aetolians"
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_bronze_zoster_belt",
		trigger = troy_trig_kill_general,
		chance = 12,
		data = {
			faction = "troy_main_trj_tereia"
		},
	},

	{
		ancillary_key = "troy_main_anc_weapon_atalanta_bow",
		trigger = troy_trig_kill_general,
		chance = 25,
		data = {
			faction = "troy_main_trj_bottiaeans"
		},
		restrict_from_campaigns = { "troy_historical"},
	},

	{
		ancillary_key = "troy_main_anc_item_aegeus_sandals",
		trigger = troy_trig_kill_general,
		chance = 25,
		data = {
			faction = "troy_main_dan_athina"
		},
	},

	-- Kill faction leader
	{
		ancillary_key = "troy_main_anc_armour_nestor_shield",
		trigger = troy_trig_kill_general,
		chance = 100,
		data = {
			faction_leader = true,
			faction = "troy_main_dan_pylos"
		},
	},

	{
		ancillary_key = "troy_main_anc_item_castor_pilos",
		trigger = troy_trig_kill_general,
		chance = 50,
		data = {
			faction_leader = true,
			faction = "troy_main_dan_argos"
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_rhesus_armour",
		trigger = troy_trig_kill_general,
		chance = 50,
		data = {
			faction_leader = true,
			faction = "troy_main_trj_thrakes"
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_tydeus_shield",
		trigger = troy_trig_kill_general,
		chance = 50,
		data = {
			faction_leader = true,
			faction = "troy_main_dan_tiryns"
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_ajax_lesser_armour",
		trigger = troy_trig_kill_general,
		chance = 100,
		data = {
			faction_leader = true,
			faction = "troy_main_dan_narykos"
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_diomedes_armour",
		trigger = troy_trig_kill_general,
		chance = 50,
		data = {
			faction_leader = true,
			faction = "troy_main_dan_argos"
		},
	},

	-- Capture province
	{
		ancillary_key = "troy_main_anc_weapon_argive_sword",
		trigger = troy_trig_conquer_province,
		chance = 20,
		data = {
			province = "troy_main_argolis"
		},
	},

	{
		ancillary_key = "troy_main_anc_item_hephestus_hammer",
		trigger = troy_trig_conquer_province,
		chance = 25,
		data = {
			province = "troy_main_lemnos"
		},
	},

	-- Kill N' generic heroes in battle
	{
		ancillary_key = "troy_main_anc_weapon_bronze_dagger",
		trigger = troy_trig_kill_n_heroes,
		chance = 8,
		data = {
			n = 3
		},
	},

	{
		ancillary_key = "troy_main_anc_weapon_iron_dagger",
		trigger = troy_trig_kill_n_heroes,
		chance = 8,
		data = {
			n = 5
		},
		restrict_from_campaigns = { "troy_historical"},
	},

	{
		ancillary_key = "troy_main_anc_weapon_decorated_dagger",
		trigger = troy_trig_kill_n_heroes,
		chance = 8,
		data = {
			n = 7
		},
	},

	{
		ancillary_key = "troy_main_anc_weapon_lead_arrows",
		trigger = troy_trig_kill_n_heroes,
		chance = 8,
		data = {
			n = 6
		},
	},

	{
		ancillary_key = "troy_main_anc_weapon_leaded_copper_arrows",
		trigger = troy_trig_kill_n_heroes,
		chance = 8,
		data = {
			n = 8
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_heavy_helmet",
		trigger = troy_trig_kill_n_heroes,
		chance = 8,
		data = {
			n = 1
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_reinforced_helmet",
		trigger = troy_trig_kill_n_heroes,
		chance = 8,
		data = {
			n = 4
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_legendary_helmet",
		trigger = troy_trig_kill_n_heroes,
		chance = 12,
		data = {
			n = 9
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_heavy_shield",
		trigger = troy_trig_kill_n_heroes,
		chance = 12,
		data = {
			n = 12
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_reinforced_shield",
		trigger = troy_trig_kill_n_heroes,
		chance = 12,
		data = {
			n = 14
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_legendary_shield",
		trigger = troy_trig_kill_n_heroes,
		chance = 12,
		data = {
			n = 16
		},
	},

	{
		ancillary_key = "troy_main_anc_item_bronze_mirror",
		trigger = troy_trig_kill_n_heroes,
		chance = 8,
		data = {
			n = 2
		},
	},

	{
		ancillary_key = "troy_main_anc_item_silver_mirror",
		trigger = troy_trig_kill_n_heroes,
		chance = 8,
		data = {
			n = 5
		},
	},

	{
		ancillary_key = "troy_main_anc_item_golden_mirror",
		trigger = troy_trig_kill_n_heroes,
		chance = 8,
		data = {
			n = 10
		},
	},

	{
		ancillary_key = "troy_main_anc_weapon_thanatos_sword",
		trigger = troy_trig_kill_n_heroes,
		chance = 15,
		data = {
			n = 20
		},
	},
	
	-- Kill N' generals from specific subculture in battle 
	{
		ancillary_key = "troy_main_anc_item_ionian_chlamys",
		trigger = troy_trig_kill_n_heroes,
		chance = 8,
		data = {
			n = 1,
			subculture = "troy_main_sbc_danaan_ionians",
		},
	},

	{
		ancillary_key = "troy_main_anc_item_achaean_chlamys",
		trigger = troy_trig_kill_n_heroes,
		chance = 8,
		data = {
			n = 1,
			subculture = "troy_main_sbc_danaan_achaeans",
		},
	},

	{
		ancillary_key = "troy_main_anc_item_dorian_chlamys",
		trigger = troy_trig_kill_n_heroes,
		chance = 8,
		data = {
			n = 1,
			subculture = "troy_main_sbc_danaan_dorians",
		},
	},

	{
		ancillary_key = "troy_main_anc_item_aeolian_chlamys",
		trigger = troy_trig_kill_n_heroes,
		chance = 8,
		data = {
			n = 1,
			subculture = "troy_main_sbc_danaan_aeolians",
		},
	},

	{
		ancillary_key = "troy_main_anc_item_pelasgian_chlamys",
		trigger = troy_trig_kill_n_heroes,
		chance = 8,
		data = {
			n = 1,
			subculture = "troy_main_sbc_trojan_pelasgians",
		},
	},

	{
		ancillary_key = "troy_main_anc_item_lelegan_chlamys",
		trigger = troy_trig_kill_n_heroes,
		chance = 8,
		data = {
			n = 1,
			subculture = "troy_main_sbc_trojan_leleges",
		},
	},

	{
		ancillary_key = "troy_main_anc_item_meaonian_chlamys",
		trigger = troy_trig_kill_n_heroes,
		chance = 8,
		data = {
			n = 1,
			subculture = "troy_main_sbc_trojan_maeonians",
		},
	},

	{
		ancillary_key = "troy_main_anc_item_thracian_chlamys",
		trigger = troy_trig_kill_n_heroes,
		chance = 8,
		data = {
			n = 1,
			subculture = "troy_main_sbc_trojan_thracians",
		},
	},

	--Raze N' Major settlements
	{
		ancillary_key = "troy_main_anc_item_ram_horn",
		trigger = troy_trig_occupy_n_major_settlements,
		chance = 12,
		data = {
			raze = true,
			n = 3
		},
	},

	{
		ancillary_key = "troy_main_anc_item_bull_horn",
		trigger = troy_trig_occupy_n_major_settlements,
		chance = 12,
		data = {
			raze = true,
			n = 5
		},
	},

	{
		ancillary_key = "troy_main_anc_item_blowing_conch",
		trigger = troy_trig_occupy_n_major_settlements,
		chance = 12,
		data = {
			raze = true,
			n = 7
		},
	},

	{
		ancillary_key = "troy_main_anc_item_cyclopean_stone",
		trigger = troy_trig_occupy_n_major_settlements,
		chance = 6,
		data = {
			raze = true,
			n = 1
		},
	},

	-- Win N' siege battles as attacker against a general from faction with specific Subculture in battle
	{
		ancillary_key = "troy_main_anc_item_achaean_kithon",
		trigger = troy_trig_won_n_siege_battles_as_attacker_against_general_with_specific_subculture,
		chance = 8,
		data = {
			subculture = "troy_main_sbc_danaan_achaeans",
			n = 1,
		},
	},

	{
		ancillary_key = "troy_main_anc_item_ionian_kithon",
		trigger = troy_trig_won_n_siege_battles_as_attacker_against_general_with_specific_subculture,
		chance = 8,
		data = {
			subculture = "troy_main_sbc_danaan_ionians",
			n = 1,
		},
	},

	{
		ancillary_key = "troy_main_anc_item_dorian_kithon",
		trigger = troy_trig_won_n_siege_battles_as_attacker_against_general_with_specific_subculture,
		chance = 8,
		data = {
			subculture = "troy_main_sbc_danaan_dorians",
			n = 1,
		},
	},

	{
		ancillary_key = "troy_main_anc_item_aeolian_kithon",
		trigger = troy_trig_won_n_siege_battles_as_attacker_against_general_with_specific_subculture,
		chance = 8,
		data = {
			subculture = "troy_main_sbc_danaan_aeolians",
			n = 1,
		},
	},

	{
		ancillary_key = "troy_main_anc_item_pelasgian_kithon",
		trigger = troy_trig_won_n_siege_battles_as_attacker_against_general_with_specific_subculture,
		chance = 8,
		data = {
			subculture = "troy_main_sbc_trojan_pelasgians",
			n = 1,
		},
	},

	{
		ancillary_key = "troy_main_anc_item_lelegan_kithon",
		trigger = troy_trig_won_n_siege_battles_as_attacker_against_general_with_specific_subculture,
		chance = 8,
		data = {
			subculture = "troy_main_sbc_trojan_leleges",
			n = 1,
		},
	},

	{
		ancillary_key = "troy_main_anc_item_maeonian_kithon",
		trigger = troy_trig_won_n_siege_battles_as_attacker_against_general_with_specific_subculture,
		chance = 8,
		data = {
			subculture = "troy_main_sbc_trojan_maeonians",
			n = 1,
		},
	},

	{
		ancillary_key = "troy_main_anc_item_thracian_kithon",
		trigger = troy_trig_won_n_siege_battles_as_attacker_against_general_with_specific_subculture,
		chance = 8,
		data = {
			subculture = "troy_main_sbc_trojan_thracians",
			n = 1,
		},
	},

	{
		ancillary_key = "troy_main_anc_item_achaean_himation",
		trigger = troy_trig_won_n_siege_battles_as_attacker_against_general_with_specific_subculture,
		chance = 16,
		data = {
			subculture = "troy_main_sbc_danaan_achaeans",
			n = 3,
		},
	},

	{
		ancillary_key = "troy_main_anc_item_ionian_himation",
		trigger = troy_trig_won_n_siege_battles_as_attacker_against_general_with_specific_subculture,
		chance = 16,
		data = {
			subculture = "troy_main_sbc_danaan_ionians",
			n = 3,
		},
	},

	{
		ancillary_key = "troy_main_anc_item_dorian_himation",
		trigger = troy_trig_won_n_siege_battles_as_attacker_against_general_with_specific_subculture,
		chance = 16,
		data = {
			subculture = "troy_main_sbc_danaan_dorians",
			n = 3,
		},
	},

	{
		ancillary_key = "troy_main_anc_item_aeolian_himation",
		trigger = troy_trig_won_n_siege_battles_as_attacker_against_general_with_specific_subculture,
		chance = 16,
		data = {
			subculture = "troy_main_sbc_danaan_aeolians",
			n = 3,
		},
	},

	{
		ancillary_key = "troy_main_anc_item_pelasgian_himation",
		trigger = troy_trig_won_n_siege_battles_as_attacker_against_general_with_specific_subculture,
		chance = 16,
		data = {
			subculture = "troy_main_sbc_trojan_pelasgians",
			n = 3,
		},
	},

	{
		ancillary_key = "troy_main_anc_item_lelgan_himation",
		trigger = troy_trig_won_n_siege_battles_as_attacker_against_general_with_specific_subculture,
		chance = 16,
		data = {
			subculture = "troy_main_sbc_trojan_leleges",
			n = 3,
		},
	},

	{
		ancillary_key = "troy_main_anc_item_maeonian_himation",
		trigger = troy_trig_won_n_siege_battles_as_attacker_against_general_with_specific_subculture,
		chance = 16,
		data = {
			subculture = "troy_main_sbc_trojan_maeonians",
			n = 3,
		},
	},

	{
		ancillary_key = "troy_main_anc_item_thracian_himation",
		trigger = troy_trig_won_n_siege_battles_as_attacker_against_general_with_specific_subculture,
		chance = 16,
		data = {
			subculture = "troy_main_sbc_trojan_thracians",
			n = 3,
		},
	},

	--Conquer N' Major settlements
	{
		ancillary_key = "troy_main_anc_follower_young_servant",
		trigger = troy_trig_occupy_n_major_settlements,
		chance = 12,
		data = {
			conquer = true,
			n = 2
		},
	},

	{
		ancillary_key = "troy_main_anc_follower_skilled_administrator",
		trigger = troy_trig_occupy_n_major_settlements,
		chance = 12,
		data = {
			conquer = true,
			n = 10
		},
	},

	{
		ancillary_key = "troy_main_anc_follower_expert_administrator",
		trigger = troy_trig_occupy_n_major_settlements,
		chance = 12,
		data = {
			conquer = true,
			n = 15
		},
	},

	{
		ancillary_key = "troy_main_anc_follower_personal_physician",
		trigger = troy_trig_occupy_n_major_settlements,
		chance = 12,
		data = {
			conquer = true,
			n = 6
		},
	},

	{
		ancillary_key = "troy_main_anc_follower_army_physician",
		trigger = troy_trig_occupy_n_major_settlements,
		chance = 12,
		data = {
			conquer = true,
			n = 8
		},
	},

	{
		ancillary_key = "troy_main_anc_follower_personal_guard",
		trigger = troy_trig_occupy_n_major_settlements,
		chance = 12,
		data = {
			conquer = true,
			n = 4
		},
	},

	--N' successful agent actions
	{
		ancillary_key = "troy_main_anc_item_volcanic_glass_vessel",
		trigger = troy_trig_n_successful_agent_actions,
		chance = 12,
		data = {
			character_type = {"dignitary", "spy", "champion"},	
			n = 4
		},
	},

	{
		ancillary_key = "troy_main_anc_item_ivory_vessel",
		trigger = troy_trig_n_successful_agent_actions,
		chance = 12,
		data = {
			character_type = {"dignitary", "spy", "champion"},
			n = 6
		},
	},

	{
		ancillary_key = "troy_main_anc_item_golden_vessel",
		trigger = troy_trig_n_successful_agent_actions,
		chance = 12,
		data = {
			character_type = {"dignitary", "spy", "champion"},
			n = 8
		},
	},

	{
		ancillary_key = "troy_main_anc_item_veil_dodona",
		trigger = troy_trig_n_successful_agent_actions,
		chance = 12,
		data = {
			character_type = "champion",
			n = 10
		},
	},

	{
		ancillary_key = "troy_main_anc_item_veil_delphi",
		trigger = troy_trig_n_successful_agent_actions,
		chance = 12,
		data = {
			character_type = "champion",
			n = 12
		},
	},

	{
		ancillary_key = "troy_main_anc_item_frankincense",
		trigger = troy_trig_n_successful_agent_actions,
		chance = 12,
		data = {
			character_type = "champion",
			n = 9
		},
	},

	{
		ancillary_key = "troy_main_anc_item_scented_oil",
		trigger = troy_trig_n_successful_agent_actions,
		chance = 12,
		data = {
			character_type = {"dignitary", "spy", "champion"},
			n = 5
		},
	},

	{
		ancillary_key = "troy_main_anc_item_young_mule",
		trigger = troy_trig_n_successful_agent_actions,
		chance = 8,
		data = {
			character_type = {"dignitary", "spy", "champion"},
			n = 2
		},
	},

	{
		ancillary_key = "troy_main_anc_item_swift_mule",
		trigger = troy_trig_n_successful_agent_actions,
		chance = 8,
		data = {
			character_type = {"dignitary", "spy", "champion"},
			n = 3
		},
	},

	{
		ancillary_key = "troy_main_anc_item_mountain_mule",
		trigger = troy_trig_n_successful_agent_actions,
		chance = 8,
		data = {
			character_type = {"dignitary", "spy", "champion"},
			n = 7
		},
	},

	{
		ancillary_key = "troy_main_anc_item_bronze_lamp",
		trigger = troy_trig_n_successful_agent_actions,
		chance = 8,
		data = {
			character_type = {"dignitary", "spy", "champion"},
			n = 5
		},
	},

	{
		ancillary_key = "troy_main_anc_item_silver_lamp",
		trigger = troy_trig_n_successful_agent_actions,
		chance = 8,
		data = {
			character_type = {"dignitary", "spy", "champion"},
			n = 10
		},
	},

	{
		ancillary_key = "troy_main_anc_item_golden_lamp",
		trigger = troy_trig_n_successful_agent_actions,
		chance = 8,
		data = {
			character_type = {"dignitary", "spy", "champion"},
			n = 15
		},
	},

	{
		ancillary_key = "troy_main_anc_item_gorgoneion",
		trigger = troy_trig_n_successful_agent_actions,
		chance = 8,
		data = {
			character_type = "spy",
			n = 20
		},
	},

	{
		ancillary_key = "troy_main_anc_item_gorgon_head",
		trigger = troy_trig_n_successful_agent_actions,
		chance = 8,
		data = {
			character_type = "spy",
			n = 25
		},
	},

	{
		ancillary_key = "troy_main_anc_item_trojan_palladium",
		trigger = troy_trig_n_successful_agent_actions,
		chance = 50,
		data = {
			character_type = "spy",
			n = 33
		},
	},

	{
		ancillary_key = "troy_main_anc_item_medusa_head",
		trigger = troy_trig_n_successful_agent_actions,
		chance = 25,
		data = {
			character_type = "spy",
			n = 30
		},
	},

	--Kill N' generic heroes with agent action
	{
		ancillary_key = "troy_main_anc_weapon_bronze_ritual_dagger",
		trigger = troy_trig_kill_n_heroes_from_agents,
		chance = 12,
		data = {
			n = 2
		},
	},

	{
		ancillary_key = "troy_main_anc_weapon_silver_ritual_dagger",
		trigger = troy_trig_kill_n_heroes_from_agents,
		chance = 12,
		data = {
			n = 4
		},
	},

	{
		ancillary_key = "troy_main_anc_weapon_golden_ritual_dagger",
		trigger = troy_trig_kill_n_heroes_from_agents,
		chance = 12,
		data = {
			n = 6
		},
	},

	--Win N' battles at own territory
	{
		ancillary_key = "troy_main_anc_item_silver_box",
		trigger = troy_trig_win_n_battles,
		chance = 8,
		data = {
			n = 2,
			own_region = true,
		},
	},

	{
		ancillary_key = "troy_main_anc_item_golden_box",
		trigger = troy_trig_win_n_battles,
		chance = 8,
		data = {
			n = 4,
			own_region = true,
		},
	},

	--Win N' battles
	{
		ancillary_key = "troy_main_anc_armour_eteoclus_shield",
		trigger = troy_trig_win_n_battles,
		chance = 100,
		data = {
			n = 22
		},
	},

	{
		ancillary_key = "troy_main_anc_item_hermes_talaria",
		trigger = troy_trig_win_n_battles,
		chance = 50,
		data = {
			n = 24
		},
	},

	{
		ancillary_key = "troy_main_anc_weapon_light_bronze_javelin",
		trigger = troy_trig_win_n_battles,
		chance = 8,
		data = {
			n = 2
		},
	},

	{
		ancillary_key = "troy_main_anc_weapon_heavy_bronze_javelin",
		trigger = troy_trig_win_n_battles,
		chance = 8,
		data = {
			n = 4
		},
	},

	{
		ancillary_key = "troy_main_anc_weapon_light_iron_javelin",
		trigger = troy_trig_win_n_battles,
		chance = 8,
		data = {
			n = 7
		},
	},

	{
		ancillary_key = "troy_main_anc_weapon_heavy_iron_javelin",
		trigger = troy_trig_win_n_battles,
		chance = 12,
		data = {
			n = 9
		},
	},

	{
		ancillary_key = "troy_main_anc_mount_swift_horses",
		trigger = troy_trig_win_n_battles,
		chance = 8,
		data = {
			n = 5
		},
	},

	{
		ancillary_key = "troy_main_anc_mount_mountain_horses",
		trigger = troy_trig_win_n_battles,
		chance = 8,
		data = {
			n = 10
		},
	},

	{
		ancillary_key = "troy_main_anc_mount_flesh_eating_horses",
		trigger = troy_trig_win_n_battles,
		chance = 8,
		data = {
			n = 15
		},
	},

	{
		ancillary_key = "troy_main_anc_item_bronze_diploma",
		trigger = troy_trig_win_n_battles,
		chance = 8,
		data = {
			n = 8
		},
	},

	{
		ancillary_key = "troy_main_anc_item_silver_diploma",
		trigger = troy_trig_win_n_battles,
		chance = 12,
		data = {
			n = 16
		},
	},

	{
		ancillary_key = "troy_main_anc_item_golden_diploma",
		trigger = troy_trig_win_n_battles,
		chance = 12,
		data = {
			n = 20
		},
	},

	--Win N siege battles as attacker and siege battles as defender
	{
		ancillary_key = "troy_main_anc_item_cithaeronian_pelt",
		trigger = troy_trig_win_n_siege_battles_combined,
		chance = 50,
		data = {
			n = 4
		},
	},

	{
		ancillary_key = "troy_main_anc_weapon_iron_ash_club",
		trigger = troy_trig_win_n_siege_battles_combined,
		chance = 40,
		data = {
			n = 5
		},
		restrict_from_campaigns = { "troy_historical"},
	},

	{
		ancillary_key = "troy_main_anc_weapon_heracles_sword",
		trigger = troy_trig_win_n_siege_battles_combined,
		chance = 15,
		data = {
			n = 6
		},
		restrict_from_campaigns = { "troy_historical"},
	},

	{
		ancillary_key = "troy_main_anc_armour_hephestus_armour",
		trigger = troy_trig_win_n_siege_battles_combined,
		chance = 15,
		data = {
			n = 7
		},
	},

	{
		ancillary_key = "troy_main_anc_item_cretan_hat_feather",
		trigger = troy_trig_win_n_siege_battles_combined,
		chance = 12,
		data = {
			n = 6
		},
	},

	--Character rank up
	{
		ancillary_key = "troy_main_anc_item_golden_cup",
		trigger = troy_trig_achieve_character_rank,
		chance = 5,
		data = {
			character_type = "general",
			n = 8
		},
	},
	{
		ancillary_key = "troy_main_anc_item_silver_cup",
		trigger = troy_trig_achieve_character_rank,
		chance = 5,
		data = {
			character_type = "general",
			n = 6
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_heavy_armour",
		trigger = troy_trig_achieve_character_rank,
		chance = 8,
		data = {
			character_type = "general",
			n = 5
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_reinforced_armour",
		trigger = troy_trig_achieve_character_rank,
		chance = 8,
		data = {
			character_type = "general",
			n = 10
		},
	},

	{
		ancillary_key = "troy_main_anc_armour_legendary_armour",
		trigger = troy_trig_achieve_character_rank,
		chance = 8,
		data = {
			character_type = "general",
			n = 15
		},
	},

	{
		ancillary_key = "troy_main_anc_weapon_short_iron_dory",
		trigger = troy_trig_achieve_character_rank,
		chance = 15,
		data = {
			character_type = "general",
			n = 17
		},
	},

	{
		ancillary_key = "troy_main_anc_weapon_long_iron_dory",
		trigger = troy_trig_achieve_character_rank,
		chance = 15,
		data = {
			character_type = "general",
			n = 19
		},
	},

	{
		ancillary_key = "troy_main_anc_item_arkeion_herb",
		trigger = troy_trig_achieve_character_rank,
		chance = 25,
		data = {
			character_type = "general",
			where = "enemy",
			n = 16
		},
	},

	{
		ancillary_key = "troy_main_anc_item_large_amphorae",
		trigger = troy_trig_achieve_character_rank,
		chance = 12,
		data = {
			where = "enemy",
			character_type = "dignitary",
			n = 4
		},
	},

	{
		ancillary_key = "troy_main_anc_item_elaborate_amphorae",
		trigger = troy_trig_achieve_character_rank,
		chance = 12,
		data = {
			where = "enemy",
			character_type = "dignitary",
			n = 7
		},
	},

	{
		ancillary_key = "troy_main_anc_item_mandrake_herb",
		trigger = troy_trig_achieve_character_rank,
		chance = 12,
		data = {
			where = "enemy",
			character_type = "spy",
			n = 10
		},
	},

	{
		ancillary_key = "troy_main_anc_item_peonies_herbs",
		trigger = troy_trig_achieve_character_rank,
		chance = 12,
		data = {
			where = "enemy",
			character_type = "spy",
			n = 15
		},
	},

	{
		ancillary_key = "troy_main_anc_item_ivory_necklace",
		trigger = troy_trig_achieve_character_rank,
		chance = 12,
		data = {
			where = "enemy",
			character_type = {"dignitary", "spy", "champion"},
			n = 13
		},
	},

	{
		ancillary_key = "troy_main_anc_item_bronze_necklace",
		trigger = troy_trig_achieve_character_rank,
		chance = 12,
		data = {
			where = "enemy",
			character_type = {"dignitary", "spy", "champion"},
			n = 15
		},
	},

	{
		ancillary_key = "troy_main_anc_item_silver_necklace",
		trigger = troy_trig_achieve_character_rank,
		chance = 12,
		data = {
			where = "enemy",
			character_type = {"dignitary", "spy", "champion"},
			n = 16
		},
	},

	{
		ancillary_key = "troy_main_anc_item_golden_necklace",
		trigger = troy_trig_achieve_character_rank,
		chance = 12,
		data = {
			where = "enemy",
			character_type = {"dignitary", "spy", "champion"},
			n = 17
		},
	},

	{
		ancillary_key = "troy_main_anc_item_wooden_lire",
		trigger = troy_trig_achieve_character_rank,
		chance = 12,
		data = {
			where = "own",
			character_type = {"dignitary", "spy", "champion"},
			n = 5
		},
	},

	{
		ancillary_key = "troy_main_anc_item_ivory_lyre",
		trigger = troy_trig_achieve_character_rank,
		chance = 12,
		data = {
			where = "own",
			character_type = {"dignitary", "spy", "champion"},
			n = 9
		},
	},

	{
		ancillary_key = "troy_main_anc_item_silver_lire",
		trigger = troy_trig_achieve_character_rank,
		chance = 12,
		data = {
			where = "own",
			character_type = {"dignitary", "spy", "champion"},
			n = 11
		},
	},

	--Win N' "Naval" battles
	{
		ancillary_key = "troy_main_anc_mount_triaconter_ship",
		trigger = troy_trig_win_n_naval_battles,
		chance = 15,
		data = {
			n = 2
		},
	},

	{
		ancillary_key = "troy_main_anc_mount_penteconter_ship",
		trigger = troy_trig_win_n_naval_battles,
		chance = 15,
		data = {
			n = 5
		},
	},

	{
		ancillary_key = "troy_main_anc_mount_boeotian_ship",
		trigger = troy_trig_win_n_naval_battles,
		chance = 15,
		data = {
			n = 10
		},
	},

	{
		ancillary_key = "troy_main_anc_item_fishing_net",
		trigger = troy_trig_win_n_naval_battles,
		chance = 15,
		data = {
			n = 8
		},
	},

	--Win N siege battles as attacker
	{
		ancillary_key = "troy_main_anc_item_petasos_hat",
		trigger = troy_trig_win_n_battles_siege_attacker,
		chance = 8,
		data = {
			n = 2
		},
	},

	{
		ancillary_key = "troy_main_anc_item_cretan_hat",
		trigger = troy_trig_win_n_battles_siege_attacker,
		chance = 8,
		data = {
			n = 4
		},
	},

	--Kill generic hero and have maximum favour of a God 
	{
		ancillary_key = "troy_main_anc_item_statue_ares",
		trigger = troy_trig_kill_hero_while_maintaining_favour_tier,
		chance = 12,
		data = {
			character_type = "general",
			god = "ares",
			god_tier = 3
		},
	},

	{
		ancillary_key = "troy_main_anc_item_statue_apollo",
		trigger = troy_trig_kill_hero_while_maintaining_favour_tier,
		chance = 12,
		data = {
			character_type = "general",
			god = "apollo",
			god_tier = 3
		},
	},

	{
		ancillary_key = "troy_main_anc_item_statue_athena",
		trigger = troy_trig_kill_hero_while_maintaining_favour_tier,
		chance = 12,
		data = {
			character_type = "general",
			god = "athena",
			god_tier = 3
		},
	},

	{
		ancillary_key = "troy_main_anc_item_statue_poseidon",
		trigger = troy_trig_kill_hero_while_maintaining_favour_tier,
		chance = 12,
		data = {
			character_type = "general",
			god = "poseidon",
			god_tier = 3
		},
	},

	{
		ancillary_key = "troy_main_anc_item_statue_aphrodite",
		trigger = troy_trig_kill_hero_while_maintaining_favour_tier,
		chance = 12,
		data = {
			character_type = "general",
			god = "aphrodite",
			god_tier = 3
		},
	},

	{
		ancillary_key = "troy_main_anc_item_statue_zeus",
		trigger = troy_trig_kill_hero_while_maintaining_favour_tier,
		chance = 12,
		data = {
			character_type = "general",
			god = "zeus",
			god_tier = 3
		},
	},

	{
		ancillary_key = "troy_main_anc_item_statue_hera",
		trigger = troy_trig_kill_hero_while_maintaining_favour_tier,
		chance = 12,
		data = {
			character_type = "general",
			god = "hera",
			god_tier = 3
		},
	},

	{
		ancillary_key = "troy_dlc2_anc_item_statue_artemis",
		trigger = troy_trig_kill_hero_while_maintaining_favour_tier,
		chance = 12,
		data = {
			character_type = "general",
			god = "artemis",
			god_tier = 3
		},
	},
	
	{
		ancillary_key = "troy_hep_anc_item_statue_hephaestus",
		trigger = troy_trig_kill_hero_while_maintaining_favour_tier,
		chance = 12,
		data = {
			character_type = "general",
			god = "hephaestus",
			god_tier = 3
		},
	},

	--Kill generic hero and have maximum favour of a God 
	{
		ancillary_key = "troy_main_anc_follower_cassandra",
		trigger = troy_trig_construct_building_and_control_region,
		chance = 100,
		data = {
			building = "troy_main_religion_apollo_4",
			region = "troy_main_ilion_troy",
			n = 2
		},
	},
}


function add_ancillary_trigger_conditions()
	local trigger_contexts = {}
	local current_campaign = cm:get_campaign_name()

	for key, link_table in ipairs(ancillary_to_triggers) do
		local to_restrict = is_table(link_table.restrict_from_campaigns) and table_find(link_table.restrict_from_campaigns, current_campaign)
		if link_table.trigger ~= nil and not to_restrict then 

			-- adding support for multiple events
			local events = {}

			if is_table(link_table.trigger.event) then
				events = link_table.trigger.event
			else
				table.insert(events, link_table.trigger.event);
			end

			-- register trigger
			if trigger_contexts[link_table.trigger] == nil then
				trigger_contexts[link_table.trigger] = {}
				trigger_contexts[link_table.trigger].data_array = {}
			end

			--register data
			if link_table.data ~= nil then
				table.insert(trigger_contexts[link_table.trigger].data_array, link_table.data);
			else
				table.insert(trigger_contexts[link_table.trigger].data_array, {});
			end

			local trigger_context = {}

			trigger_context.index = #trigger_contexts[link_table.trigger].data_array
			trigger_context.trigger = link_table.trigger
			trigger_context.trigger_contexts = trigger_contexts
			trigger_context.key = link_table.ancillary_key

			for event_index, event in ipairs(events) do

				--out("add_ancillary_trigger_conditions: add event: " .. event .. ": " .. link_table.ancillary_key .. "_" .. key .. "_" .. event_index .. "_trigger")

				trigger_context.event = event

				core:add_listener(
					link_table.ancillary_key .. "_" .. key .. "_" .. event_index .. "_trigger", 
					event,
					function(context)
						--out("add_ancillary_trigger_conditions: check performed for " .. link_table.ancillary_key .. ", event: " .. trigger_context.event .. ", trigger index: " .. trigger_context.index)
						return link_table.trigger and link_table.trigger.func(context, link_table.data, trigger_context)
					end,

					function(context)
						--out("add_ancillary_trigger_conditions: action performed for " .. link_table.ancillary_key .. ", event: " .. trigger_context.event .. ", trigger index: " .. trigger_context.index)

						local func_force_add_ancillary_characters = link_table.trigger.func_force_add_ancillary_characters and link_table.trigger.func_force_add_ancillary_characters(context, link_table.data, trigger_context)
						if func_force_add_ancillary_characters ~= nil then
							--
							for character_index, character in ipairs(func_force_add_ancillary_characters) do
								local rand = cm:model():random_int(1, 100)
								local info = tostring(character:command_queue_index()) or ""
								out("ancillaries (" .. key .. "): Adding " .. link_table.ancillary_key .. " with chance: " .. link_table.chance .. " for character: " .. info)
								if rand <= link_table.chance then
 									cm:force_add_ancillary(cm:char_lookup_str(character), link_table.ancillary_key);
								end
							end
						else
							--
							if context.character ~= nil and context:character() ~= nil and not context:character():is_null_interface() then
								local info = tostring(context:character():command_queue_index()) or ""
								out("ancillaries (" .. key .. "): Adding " .. link_table.ancillary_key .. " with chance: " .. link_table.chance .. " for character: " .. info)
								common.ancillary(link_table.ancillary_key, link_table.chance, context)
							end
						end
					end, 
					true
				)
			end
		else
			out("add_ancillary_trigger_conditions: there is no defined trigger for ancillary #" .. key .. ": " .. link_table.ancillary_key or "unknown")
		end
	end
end

add_ancillary_trigger_conditions()

-------------------------------------------------------------------------
-------------- Ancillaries provided by constructing buildings -----------
-------------------------------------------------------------------------
-- The aim of this part is to have a set of ancillaries provided by constructing buildings
-- make an entry in the building_to_ancillaries_table with the key of the building and make a table entry with the strings of the ancillaries you want to provide trough this building

building_to_ancillaries_table = {
	["troy_adi_special_ajax_makers_camp_1"] = {
		"troy_adi_anc_armour_salamian_armour",
		"troy_adi_anc_armour_salamian_breastplate",
		"troy_adi_anc_armour_salamian_curiass",
		"troy_adi_anc_armour_salamian_girdle",
		"troy_adi_anc_armour_salamian_helmet",
		"troy_adi_anc_armour_salamian_sandals",
		"troy_adi_anc_item_salamian_clapper",
		"troy_adi_anc_weapon_salamian_bow",
		"troy_adi_anc_weapon_salamian_spear",
		"troy_adi_anc_weapon_salamian_sword"
	},
	["troy_adi_special_ajax_makers_camp_3"] = {
		"troy_adi_anc_armour_salamian_armour",
		"troy_adi_anc_armour_salamian_breastplate",
		"troy_adi_anc_armour_salamian_curiass",
		"troy_adi_anc_armour_salamian_girdle",
		"troy_adi_anc_armour_salamian_helmet",
		"troy_adi_anc_armour_salamian_sandals",
		"troy_adi_anc_item_salamian_clapper",
		"troy_adi_anc_weapon_salamian_bow",
		"troy_adi_anc_weapon_salamian_spear",
		"troy_adi_anc_weapon_salamian_sword"
	},
	["troy_adi_special_ajax_makers_camp_5"] = {
		"troy_adi_anc_armour_salamian_armour",
		"troy_adi_anc_armour_salamian_breastplate",
		"troy_adi_anc_armour_salamian_curiass",
		"troy_adi_anc_armour_salamian_girdle",
		"troy_adi_anc_armour_salamian_helmet",
		"troy_adi_anc_armour_salamian_sandals",
		"troy_adi_anc_item_salamian_clapper",
		"troy_adi_anc_weapon_salamian_bow",
		"troy_adi_anc_weapon_salamian_spear",
		"troy_adi_anc_weapon_salamian_sword"
	}
}

-- Table for restricting the ancillaries provided by constructing buildings from certain campaigns
restricted_building_ancillaries_from_campaigns = 
{
	["troy_historical"] = {
		"troy_adi_anc_weapon_salamian_bow",
		"troy_adi_anc_weapon_salamian_spear",
		"troy_adi_anc_weapon_salamian_sword",
	},
}

function restrict_ajax_ancillaries_from_buildings()
	local current_campaign = cm:get_campaign_name()
	if not is_table(restricted_building_ancillaries_from_campaigns[current_campaign]) then
		return
	end
	for _, building_ancillaries in pairs(building_to_ancillaries_table) do
		for _, ancillary in ipairs(restricted_building_ancillaries_from_campaigns[current_campaign]) do
			table_erase(building_ancillaries, ancillary)
		end
	end
end

restrict_ajax_ancillaries_from_buildings()

core:add_listener (
	"troy_adi_ajax_makers_camp_ancillary_trigger",
	"BuildingCompleted",
	function(context)
		return building_to_ancillaries_table[context:building():name()]
	end,
	function(context) 
		local building_name = context:building():name()
		if #building_to_ancillaries_table[building_name] == 0 then
			out("Error: building_to_ancillaries_table["..building_name.. "] is empty, no ancillary can be chosen!")
			return
		end
		local faction_name = context:garrison_residence():faction():name()
		local random_ancillary = cm:model():random_int(1, #building_to_ancillaries_table[building_name])
		cm:add_ancillary_to_faction(faction_name, building_to_ancillaries_table[building_name][random_ancillary], true)
	 end,
	true
)

griffin_egg_ancillary_to_character = {}

function spawn_griffin_from_griffin_egg_ancillary(char_cqi)

	if not table_find(griffin_egg_ancillary_to_character, char_cqi) then
		table.insert(griffin_egg_ancillary_to_character, char_cqi)
	end

	local griffin_spawn_chance = 5 --%
	local griffin_egg_ancillary_key = "troy_mth_anc_griffin_egg"
	local lesser_griffin_unit_key = "troy_mth_gen_myth_lesser_griffin"
	local lesser_griffin_amount_to_add = 1

	local spawn_listener_key = "troy_mth_griffin_egg_spawn_listener_for_character_" .. char_cqi
	local unequip_listener_key = "troy_mth_griffin_egg_unequip_listener_for_character_" .. char_cqi
	
	local clear_character_save_data = function(char_cqi)
		core:remove_listener(spawn_listener_key)
		core:remove_listener(unequip_listener_key)
		if table_find(griffin_egg_ancillary_to_character, char_cqi) then
			table_erase(griffin_egg_ancillary_to_character, char_cqi)
		end
	end

	core:add_listener(
		spawn_listener_key,
		"CharacterTurnStart",
		function(context)
			return context:character():command_queue_index() == char_cqi
		end,
		function(context)
			local rand = cm:model():random_int(1,100)
			if rand <= griffin_spawn_chance then
				local cont_character = context:character()
				local faction = cont_character:faction()
				local faction_cqi = faction:command_queue_index()
				local unit_ammount = cm:num_units_in_faction_mercenary_pool(faction_cqi, lesser_griffin_unit_key)

				local cust_bundle_key = "troy_mth_effect_bundle_mercenaries_from_griffin_dilemma_dummy"
				local unit_cap_effect_bundle = cm:clone_or_create_custom_effect_bundle(faction:name(), cust_bundle_key)
				unit_cap_effect_bundle:set_duration(0)
				unit_cap_effect_bundle:add_effect("troy_mth_effect_unit_capacity_lesser_griffin","faction_to_faction_own_unseen", lesser_griffin_amount_to_add)
				cm:apply_custom_effect_bundle_to_faction(unit_cap_effect_bundle, faction)
				
				unit_ammount = unit_ammount + lesser_griffin_amount_to_add
				cm:add_unit_to_faction_mercenary_pool(faction, lesser_griffin_unit_key, unit_ammount, 0, 5, 0, 0, "", "", "")

				clear_character_save_data(cont_character:command_queue_index())
				cm:force_remove_ancillary(cm:char_lookup_str(cont_character), griffin_egg_ancillary_key, false)
			end
		end,
		true
	)

	core:add_listener(
		unequip_listener_key,
		"CharacterAncillaryLost",
		function(context)
			return context:character():command_queue_index() == char_cqi and context:ancillary() == griffin_egg_ancillary_key
		end,
		function(context)
			clear_character_save_data(context:character():command_queue_index())
		end,
		true
	)


end

core:add_listener(
	"troy_mth_griffin_egg_setup_listener",
	"CharacterAncillaryGained",
	function(context)
		return context:ancillary() == "troy_mth_anc_griffin_egg"
	end,
	function(context)
		spawn_griffin_from_griffin_egg_ancillary(context:character():command_queue_index())
	end,
	true
)

--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------
cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("ANCILLARIES_DATA", ANCILLARIES_DATA, context)
		cm:save_named_value("CHARACTERS_WITH_GRIFFIN_EGG_ANCILLARY", griffin_egg_ancillary_to_character, context)
		out("ancillaries: Saved ANCILLARIES_DATA")
	end
)

cm:add_loading_game_callback(
	function(context)
		ANCILLARIES_DATA = cm:load_named_value("ANCILLARIES_DATA", {}, context)
		griffin_egg_ancillary_to_character = cm:load_named_value("CHARACTERS_WITH_GRIFFIN_EGG_ANCILLARY", griffin_egg_ancillary_to_character, context)
		out("ancillaries: Loaded ANCILLARIES_DATA")

		if next(griffin_egg_ancillary_to_character) then
			for i, char_cqi in ipairs(griffin_egg_ancillary_to_character) do
				spawn_griffin_from_griffin_egg_ancillary(char_cqi)
			end
		end
	end
)