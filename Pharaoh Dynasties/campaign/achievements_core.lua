out("Loading achievements_core.lua")

local debug = false
local function output_debug_string(string)
	if debug then
		out("achievements_core (debug): " .. string)
	end
end

local function output_string(string)
	out("achievements_core: " .. string)
end

--local faction has table associated with persistent achievement data
local ACHIEVEMENTS_DATA =
{
	--
	--faction:name() = {
		--data1 =
		--data2 =
		--data3 =
		-- ...
	--}
}

-- retrieves achievements table associated with a faction. If does not exists -> creates new one
function get_achievements_data(faction)
	local data
	if not faction:is_null_interface() then
		local key = faction:name()
		data = ACHIEVEMENTS_DATA[key]
		if data == nil then
			data = {}
			ACHIEVEMENTS_DATA[key] = data
		end
	else
		--
		output_string("trying to reach data for null faction, returning empty data")
		data = {}
	end

	return data
end


function track_achievement_progress(faction, key, register, increment)
	local achievement_data = get_achievements_data(faction)
	increment = increment or 1
	key = "track_" .. key
	local val = achievement_data[key]
	if val == nil then
		val = 0
	end

	--
	if register then
		val = val + increment
		achievement_data[key] = val
		output_debug_string("track_achievement_progress (" .. faction:name() .. "): key: " .. key .. "; val: " .. val)
	end


	return val
end

function remove_achievement_progress(faction, key)
	local achievement_data = get_achievements_data(faction)
	output_debug_string("remove_achievement_progress (" .. faction:name() .. "): key: " .. key)
	achievement_data[key] = nil
end

function persist_achievement_data(faction, key, val)
	local achievement_data = get_achievements_data(faction)

	key = "persist_" .. key

	local old_val = achievement_data[key]
	achievement_data[key] = val
	-- use tostring for val or else it will crash in case such as boolean
	output_debug_string("persist_achievement_key (" .. faction:name() .. "): key: " .. key .. "; val: " .. tostring(val))

	return old_val
end

function get_persist_achievement_data(faction, key)
	local achievement_data = get_achievements_data(faction)

	key = "persist_" .. key
	return achievement_data[key]
end



function unit_count_meet_condition(character, condition)
	if not character:has_military_force() then
		return false
	end

	local military_force = character:military_force()
	local unit_list = military_force:unit_list()
	local units_meet_condition = 0

	for i = 0, unit_list:num_items() - 1 do
		local unit = unit_list:item_at(i)
		if unit ~= nil and not unit:is_null_interface() then
			if condition(unit) then
				units_meet_condition = units_meet_condition + 1
			end
		end
	end

	return units_meet_condition
end


function achievement_unlock(faction, achievement)
	output_string("unlocked achievement for faction: " .. faction:name() .. ", achievement: " .. achievement)
	cm:unlock_achievement(faction:name(), achievement)
end


function get_battle_human_winners(battle)
	local human_factions_data = {}

	local function try_insert_human_faction_data(character, is_attacker)
		if character == nil or character:is_null_interface() then
			return
		end

		local faction = character:faction()
		if faction ~= nil and not faction:is_null_interface() and faction:is_human() then
			local found_data = table_find(human_factions_data, function(it) return it.faction:name() == faction:name() end)

			if found_data then
				table.insert(found_data.characters, character)
			else
				table.insert(human_factions_data, { faction = faction, is_attacker = is_attacker, characters = { character } })
			end
		end
	end

	local battle_results = battle:battle_results()
	local attacking_side_won = battle:attacker_faction():name() == battle_results:winning_faction_key()
	if attacking_side_won then
		if battle:attacker_faction():is_human() then
			try_insert_human_faction_data(battle:attacker(), true)
		end

		local secondary_attackers = battle:secondary_attackers()
		for i = 0, secondary_attackers:num_items() - 1 do
			try_insert_human_faction_data(secondary_attackers:item_at(i), true)
		end
	else
		if battle:defender_faction():is_human() then
			try_insert_human_faction_data(battle:defender(), false)
		end

		local secondary_defenders = battle:secondary_defenders()
		for i = 0, secondary_defenders:num_items() - 1 do
			try_insert_human_faction_data(secondary_defenders:item_at(i), false)
		end
	end

	return human_factions_data
end

local ultimate_victory_missions = {
	["phar_main_seti"] = "phar_main_campaign_victory_ultimate_seti",
	["phar_main_amenmesse"] = "phar_main_campaign_victory_ultimate_amenmesse",
	["phar_main_ramesses"] = "phar_main_campaign_victory_ultimate_ramesses",
	["phar_main_bay"] = "phar_main_campaign_victory_ultimate_bay",
	["phar_main_irsu"] = "phar_main_campaign_victory_ultimate_irsu",
	["phar_main_tausret"] = "phar_main_campaign_victory_ultimate_tausret",
	["phar_main_suppiluliuma"] = "phar_main_campaign_victory_ultimate_suppiluliuma",
	["phar_main_kurunta"] = "phar_main_campaign_victory_ultimate_kurunta",
	["phar_sea_peleset"] = "phar_sea_campaign_victory_ultimate_peleset",
	["phar_sea_sherden"] = "phar_sea_campaign_victory_ultimate_sherden",
	["troy_main_dan_mycenae"] = "phar_map_campaign_victory_ultimate_agamemnon",
	["troy_main_trj_troy"] = "phar_map_campaign_victory_ultimate_priam",
	["phar_map_ninurta"] = "phar_map_campaign_victory_ultimate_ninurta",
	["phar_map_babylon"] = "phar_map_campaign_victory_ultimate_babylon",
	["phar_main_ugarit"] = "phar_map_campaign_victory_ultimate_ugarit",
	["troy_rem_trj_thrace"] = "phar_map_campaign_victory_ultimate_trj_thrace",
	["troy_main_trj_lycia"] = "phar_map_campaign_victory_ultimate_trj_lycia",
	["troy_amazons_trj_hippolyta"] = "phar_map_campaign_victory_ultimate_trj_hippolyta",
	["phar_map_sutu"] = "phar_map_campaign_victory_ultimate_sutu",
	["phar_main_setnakhte"] = "phar_map_campaign_victory_ultimate_setnakhte",
	["phar_map_sangarian_phrygians"] = "phar_map_campaign_victory_ultimate_sangarian_phrygians",
	["phar_main_merneptah"] = "phar_map_campaign_victory_ultimate_merneptah",
	["phar_main_malidiya"] = "phar_map_campaign_victory_ultimate_malidiya",
	["phar_map_lullubi"] = "phar_map_campaign_victory_ultimate_lullubi",
	["phar_map_igihalkid"] = "phar_map_campaign_victory_ultimate_igihalkid",
	["phar_main_emar"] = "phar_map_campaign_victory_ultimate_emar",
	["phar_main_dungul"] = "phar_map_campaign_victory_ultimate_dungul",
	["troy_main_dan_ithaca"] = "phar_map_campaign_victory_ultimate_dan_ithaca",
	["troy_main_dan_boeotians"] = "phar_map_campaign_victory_ultimate_dan_boeotians",
	["troy_main_dan_achilles"] = "phar_map_campaign_victory_ultimate_dan_achilles",
	["phar_main_damascus"] = "phar_map_campaign_victory_ultimate_damascus",
	["phar_main_carchemish"] = "phar_map_campaign_victory_ultimate_carchemish",
	["phar_main_byblos"] = "phar_map_campaign_victory_ultimate_byblos",
	["phar_main_bahariya"] = "phar_map_campaign_victory_ultimate_bahariya",
	["phar_map_assyria"] = "phar_map_campaign_victory_ultimate_assyria",
	["phar_main_ashkelon"] = "phar_map_campaign_victory_ultimate_ashkelon",
	["phar_main_alashiya"] = "phar_map_campaign_victory_ultimate_alashiya",
	["phar_main_napata"] = "phar_map_campaign_victory_ultimate_napata",
	["phar_map_shubru"] = "phar_map_campaign_victory_ultimate_shubru",
}

-- achievements based on completed missions
local function mission_achievement_filter(context)
	return context:faction():is_human()
end

local function mission_achievement(context)
	local mission = context:mission()
	local mission_key = mission:mission_record_key()
	local faction = context:faction()

	-- #HACK: in multiplayer co-op games the campaign victory missions are merged into one,
	-- so we will always have the victory mission for one of the factions, which leads to an ultimate victory win in co-op
	-- unlocking achievement for a random faction of the player picked factions, so to fix this we always take our own ultimate victory's mission key
	local original_mission_key = mission_key
	local is_ultimate_victory_mission = false
	if cm:model():campaign_type_string() == "mp_co_op_normal" then
		for _, it_mission_key in pairs(ultimate_victory_missions) do
			if it_mission_key == mission_key then
				is_ultimate_victory_mission = true
				break
			end
		end

		if is_ultimate_victory_mission then
			mission_key = ultimate_victory_missions[faction:name()]
		end
	end

	if is_table(achievements.mission_succeeded) and is_table(achievements.mission_succeeded.by_mission_key) then
		for achievement, achievement_data in pairs(achievements.mission_succeeded.by_mission_key) do
			if is_table(achievement_data) then
				if (is_table(achievement_data.missions) and table_contains(achievement_data.missions, mission_key)) and
					(achievement_data.campaign == nil or achievement_data.campaign == cm:get_campaign_name()) then

					if achievement_data.any_mission_succeeded then
						for index, mission in ipairs(achievement_data.missions) do
							if faction:mission_has_succeeded(mission, "") then
								achievement_unlock(faction, achievement)
								break
							end
						end
					else
						local unlock = true
						for index, mission in ipairs(achievement_data.missions) do
							local checked_mission = mission
							if is_ultimate_victory_mission and mission == mission_key then
								checked_mission = original_mission_key
							end

							if not faction:mission_has_succeeded(checked_mission, "") then
								unlock = false
								break
							end
						end

						if unlock then
							achievement_unlock(faction, achievement)
						end
					end
				end
			else
				output_string("mission_achievement: achievements.mission_succeeded.by_mission_key[" .. achievement .. "] is not a table as expected")
			end
		end
	else
		output_string("mission_achievement: no table defined for achievements.mission_succeeded.by_mission_key")
	end

	local issuer_key = mission:mission_issuer_record_key()
	if issuer_key ~= nil and issuer_key ~= "" then
		persist_achievement_data(faction, "mission_succeeded_with_issuer_" .. issuer_key, true)

		if is_table(achievements.mission_succeeded) and is_table(achievements.mission_succeeded.by_issuer_key) then
			for achievement, achievement_data in pairs(achievements.mission_succeeded.by_issuer_key) do
				if is_table(achievement_data) then
					if (achievement_data.faction == nil or achievement_data.faction == faction:name()) and
						is_table(achievement_data.issuers) and table_contains(achievement_data.issuers, issuer_key) then

						local unlock = true
						for key, issuer in pairs(achievement_data.issuers) do
							if not get_persist_achievement_data(faction, "mission_succeeded_with_issuer_" .. issuer) then
								unlock = false
								break
							end
						end

						if unlock then
							achievement_unlock(faction, achievement)
						end
					end
				else
					output_string("mission_achievement: achievements.mission_succeeded.by_issuer_key[" .. achievement .. "] is not a table as expected")
				end
			end
		else
			output_string("mission_achievement: no table defined for achievements.mission_succeeded.by_issuer_key")
		end
	end

end


local function battle_conflict_finished_filter(context)
	local battle = context:pending_battle()
	if battle:is_null_interface() then
		return false
	end
	local battle_results = battle:battle_results()
	if battle_results:is_null_interface() then
		return false
	end

	local has_human_faction = function(characters)
		for i = 0, characters:num_items() - 1 do
			local character = characters:item_at(i)
			if not character:is_null_interface() and not character:faction():is_null_interface() and character:faction():is_human() then
				return true
			end
		end

		return false
	end

	return battle:attacker_faction():is_human() or battle:defender_faction():is_human() or has_human_faction(battle:secondary_attackers()) or has_human_faction(battle:secondary_defenders())
end

local function battle_conflict_finished(context)
	local battle = context:pending_battle()
	local battle_results = battle:battle_results()

	if achievements.battle ~= nil and is_table(achievements.battle) and achievements.battle.win ~= nil and is_table(achievements.battle.win) then
		local human_factions_data = get_battle_human_winners(battle)
		local attacking_side_won = battle:attacker_faction():name() == battle_results:winning_faction_key()
		local losing_faction_name = battle_results:losing_faction_key()
		local losing_faction = cm:get_faction(losing_faction_name)
		local losing_faction_culture = (losing_faction and not losing_faction:is_rebel()) and losing_faction:culture() or false	-- If no faction or rebels, this is false

		for _, human_faction_data in ipairs(human_factions_data) do
			for achievement_key, achievement_data in pairs(achievements.battle.win) do
				local human_faction = human_faction_data.faction
				local battle_matches_achievement_region = not battle:region():is_null_interface() and battle:region():name() == achievement_data.region

				if (achievement_data.faction == nil or table_contains(achievement_data.faction, human_faction:name())) and
					(achievement_data.region == nil or battle_matches_achievement_region) and
					(achievement_data.culture == nil or human_faction:culture() == achievement_data.culture) and
					(achievement_data.losing_faction_culture == nil or losing_faction_culture == achievement_data.losing_faction_culture) and
					(achievement_data.battle_for_settlement == nil or battle:has_contested_garrison() == achievement_data.battle_for_settlement) and
					(achievement_data.attacking_side == nil or attacking_side_won == achievement_data.attacking_side) and
					(achievement_data.prerequisite_mission == nil or human_faction:mission_has_succeeded(achievement_data.prerequisite_mission, "")) and
					(achievement_data.army_func == nil or any_army_meets_conditions(human_faction_data.characters, achievement_data.army_func)) and
					(achievement_data.evaluate_state_func == nil or achievement_data.evaluate_state_func(human_faction_data, battle, battle_results))
				then
					if achievement_data.number_of_battles_won == nil then
						achievement_unlock(human_faction, achievement_key)
					else
						local count = track_achievement_progress(human_faction, "number_of_battles_won", true)
						if count >= achievement_data.number_of_battles_won then
							achievement_unlock(human_faction, achievement_key)
						end
					end
				end
			end
		end
	else
		output_string("battle_completed: no table defined for achievements.battle.win")
	end
end


local function achievements_core_init()
	output_debug_string("init")

	-- saving / loading progress
	cm:add_saving_game_callback(
		function(context)
			cm:save_named_value("ACHIEVEMENTS_DATA", ACHIEVEMENTS_DATA, context)
			output_debug_string("achievements: Saved ACHIEVEMENTS_DATA")
		end
	)

	cm:add_loading_game_callback(
		function(context)
			ACHIEVEMENTS_DATA = cm:load_named_value("ACHIEVEMENTS_DATA", {}, context)
			output_debug_string("achievements: Loaded ACHIEVEMENTS_DATA")
		end
	)

end

-- missions
core:add_listener (
	"campaign_achievements_mission_succeeded",
	"MissionSucceeded",
	mission_achievement_filter,
	mission_achievement,
	true
)


-- battle comppleted event
core:add_listener(
	"campaign_achievements_battle_conflict_finished_event",
	"BattleConflictFinished",
	battle_conflict_finished_filter,
	battle_conflict_finished,
	true
)

--
achievements_core_init()