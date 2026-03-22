out("qa_console.lua loaded");

local get_n_spaces_string = function(n)
	local spaces = ""
	for _ = 1, n do
		spaces = spaces .. " "
	end

	return spaces
end

_debug = {
	whitespace_len_initial = 4,
	whitespace_len_additional = 4,

	print = function(object)
		out(_debug.to_str(object))
	end,

	-- spaces is optional. Dictates the whitespace before the content
	-- of a table or something else that will use whitespace
	to_str = function(object, spaces)
		spaces = (is_number(spaces) and spaces) or _debug.whitespace_len_initial

		local result_str
		if is_nil(object) then
			result_str = _debug.to_str_nil(object)
		elseif is_number(object) then
			result_str = _debug.to_str_number(object)
		elseif is_function(object) then
			result_str = _debug.to_str_function(object)
		elseif is_string(object) then
			result_str = _debug.to_str_string(object)
		elseif is_boolean(object) then
			result_str = _debug.to_str_boolean(object)
		elseif is_table(object) then
			result_str = _debug.to_str_table(spaces, object)
		else
			result_str = "Not implemented for this object yet: " .. tostring(object)
		end
		return result_str
	end,

	to_str_nil = tostring,

	to_str_number = tostring,

	to_str_function = tostring,

	to_str_string = function(object)
		return "\"" .. object .. "\""
	end,

	to_str_boolean = tostring,

	table_type = function(table)
		if not is_table(table) then
			return nil
		end

		if #table > 0 then
			return "indexed"
		end

		return "map"
	end,

	to_str_table = function(num_spaces, table)
		local result = ""
		local whitespace = get_n_spaces_string(math.max(0, num_spaces - _debug.whitespace_len_additional))

		result = result .. "\n" .. whitespace .. "{\n"

		local table_type = _debug.table_type(table)
		if table_type == "indexed" then
			result = result .. _debug.to_str_table_content_ipairs(num_spaces, table)
		elseif table_type == "map" then
			result = result .. _debug.to_str_table_content_pairs(num_spaces, table)
		else
			result = result .. whitespace .. "not a table?\n"
		end

		result = result .. whitespace .. "}"

		return result
	end,

	to_str_table_content_ipairs = function(num_spaces, table)
		return _debug.to_str_table_content(num_spaces, table, ipairs)
	end,

	to_str_table_content_pairs = function(num_spaces, table)
		return _debug.to_str_table_content(num_spaces, table, pairs)
	end,

	to_str_table_content = function(num_spaces, table, iterate_func)
		local result = ""
		local whitespace = get_n_spaces_string(num_spaces)

		for key, val in iterate_func(table) do
			result = result .. whitespace .. "[ " .. _debug.to_str(key) .. " ] = "
			result = result .. _debug.to_str(val, num_spaces + _debug.whitespace_len_additional) .. ",\n"
		end

		return result
	end,
}


local end_turn_file_name = nil
function province_buildings_round_summary_start()
	out("Starting province_buildings_round_summary dump...")
	core:add_listener(
		"provice_round_summary_listener",
		"RoundStart",
		function(context)
			return true
		end,
		function(context)
			local end_turn_file = nil
			if not end_turn_file_name then
				end_turn_file_name = "../working_data/script/end_turn_building_logs/end_turn_buildings_" .. os.date("%Y_%m_%d_%H_%M_%S") .. ".txt"
				end_turn_file = io.open(end_turn_file_name, "w")
				if not end_turn_file then
					out("Failed to open file " .. end_turn_file_name .. " . Stopping...")
					province_buildings_round_summary_stop()
					do return end
				end
				end_turn_file:write("Owning Faction key,Region key,Slot key,Slot Type,Building key,Turn\n")
			else
				end_turn_file = io.open(end_turn_file_name, "a")
				if not end_turn_file then
					out("Failed to open file " .. end_turn_file_name .. " . Stopping...")
					province_buildings_round_summary_stop()
					do return end
				end
			end

			log_provices_buildings(end_turn_file, context:model():world():province_manager():province_list())

			end_turn_file:write("\n")
			end_turn_file:close()
		end,
		true
	)
end

function log_provices_buildings(file, provinces)
	for i = 0, provinces:num_items() - 1 do
		local province = provinces:item_at(i)
		for j = 0, province:regions():num_items() - 1 do
			local region = province:regions():item_at(j)
			local slot_string = ""
			for m = 0, region:slot_list():num_items() - 1 do
				local slot = region:slot_list():item_at(m)
				if not slot:building():is_null_interface() then
					file:write(region:name() .. "," .. region:owning_faction():name() .. "," .. slot:name() .. "," .. slot:type() .. "," .. slot:building():name() .. "," .. cm:model():turn_number() .. "\n")
				end
			end
		end
	end
end

function province_buildings_round_summary_for_turn(turn_number)
	out("Starting province_buildings_round_summary_for_turn listener...")
	core:add_listener(
		"province_round_summary_for_turn_listener",
		"RoundStart",
		function(context)
			return true
		end,
		function(context)
			if cm:model():turn_number() == turn_number then
				local end_turn_file_name = "../working_data/script/end_turn_building_logs/end_turn_buildings_turn_".. turn_number .. "_" .. os.date("%Y_%m_%d_%H_%M_%S") .. ".txt"
				local end_turn_file = io.open(end_turn_file_name, "w")
				if not end_turn_file then
					out("Failed to open file " .. end_turn_file_name .. " . Stopping...")
					core:remove_listener("province_round_summary_for_turn_listener")
					do return end
				end
				end_turn_file:write("Owning Faction key,Region key,Slot key,Slot Type,Building key,Turn\n")
				log_provices_buildings(end_turn_file, context:model():world():province_manager():province_list())
				end_turn_file:close()
				core:remove_listener("province_round_summary_for_turn_listener")
			end
		end,
		true
	)
end

function province_buildings_round_summary_stop()
	out("Stopping province_buildings_round_summary dump...")
	core:remove_listener("provice_round_summary_listener")
	end_turn_file_name = nil
end

function get_camera_pos()
	local x,y,d,b,h = cm:get_camera_position()
	out(x)
	out(y)
	out(d)
	out(b)
	out(h)
end

function get_camera_pos_cindy()
	local posx, posy, posz, tarx, tary, tarz = cm:get_camera_position_cindy_format()
	out("POSITION")
	out(posx)
	out(posy)
	out(posz)

	out("TARGET")
	out(tarx)
	out(tary)
	out(tarz)
end

-- Functionality for testing - spawning champion rogue armies
function spawn_champions()
	for _,data in pairs(rogue_armies_info) do
		-- spawn army
		cm:spawn_rogue_army(data.faction_key, data.spawn_x, data.spawn_y)
	
		-- commander level & skills setup
		if is_table(data.skills) or is_number(data.level) then
			local forces = cm:get_faction(data.faction_key):military_force_list()
			if forces then
				local last_force = forces:item_at(forces:num_items() - 1)
				if last_force then
					local cqi = last_force:general_character():command_queue_index()
					local character_lookup_string = "faction:"..data.faction_key..",cqi:"..tostring(cqi)
					
					-- level
					if is_number(data.level) then
						local level = math.clamp(data.level, 1, #cm.character_xp_per_level)
						local xp = last_force:general_character():experience_required_for_rank(level)
						if xp > 0 then
							cm:add_agent_experience(character_lookup_string, xp);
						end
					end
					
					-- skills
					if is_table(data.skills) then
						for _,skill_id in ipairs(data.skills) do
							cm:force_add_skill(character_lookup_string, skill_id, true)
						end
					end

				end
			end
		end

	end
end

function test_spawn_army(...)
	local unit_list = arg
	local enemy_faction = "phar_main_al_khufu_invasion_kemet_rebels"
	local out_fl = cm:get_local_faction(true):faction_leader()
	local x, y = cm:find_valid_spawn_location_for_character_from_character(enemy_faction,cm:char_lookup_str(out_fl),true,2)
	cm:create_force(enemy_faction, unpack(arg), out_fl:region():name(), x, y, true)
end

function set_locked_status_for_all_movies(should_lock)
	local movie_keys = {
		"camp_intro_ach",
		"camp_intro_trj",
		"phar_main_amenmesse_win_movie_long",
		"phar_main_amenmesse_win_movie_short",
		"phar_main_amenmesse_win_movie_ultimate",
		"phar_main_bay_win_movie_long",
		"phar_main_bay_win_movie_short",
		"phar_main_bay_win_movie_ultimate",
		"phar_main_egypt_legitimacy_war_start",
		"phar_main_irsu_win_movie_long",
		"phar_main_irsu_win_movie_short",
		"phar_main_irsu_win_movie_ultimate",
		"phar_main_kurunta_win_movie_long",
		"phar_main_kurunta_win_movie_short",
		"phar_main_kurunta_win_movie_ultimate",
		"phar_main_ramesses_win_movie_long",
		"phar_main_ramesses_win_movie_short",
		"phar_main_ramesses_win_movie_ultimate",
		"phar_main_seti_win_movie_long",
		"phar_main_seti_win_movie_short",
		"phar_main_seti_win_movie_ultimate",
		"phar_main_suppiluliuma_win_movie_long",
		"phar_main_suppiluliuma_win_movie_short",
		"phar_main_suppiluliuma_win_movie_ultimate",
		"phar_main_tausret_win_movie_long",
		"phar_main_tausret_win_movie_short",
		"phar_main_tausret_win_movie_ultimate",
		"phar_sea_peleset_win_movie_long",
		"phar_sea_peleset_win_movie_short",
		"phar_sea_peleset_win_movie_ultimate",
		"phar_sea_sherden_win_movie_long",
		"phar_sea_sherden_win_movie_short",
		"phar_sea_sherden_win_movie_ultimate",
		"phar_map_aegean_win_movie_long",
		"phar_map_aegean_win_movie_short",
		"phar_map_aegean_win_movie_ultimate",
		"phar_map_cannanite_win_movie_long",
		"phar_map_cannanite_win_movie_short",
		"phar_map_cannanite_win_movie_ultimate",
		"phar_map_egypt_win_movie_long",
		"phar_map_egypt_win_movie_short",
		"phar_map_egypt_win_movie_ultimate",
		"phar_map_hittite_win_movie_long",
		"phar_map_hittite_win_movie_short",
		"phar_map_hittite_win_movie_ultimate",
		"phar_map_sea_peoples_win_movie_long",
		"phar_map_sea_peoples_win_movie_short",
		"phar_map_sea_peoples_win_movie_ultimate",
		"startup_movie_03",
	}

	for _, movie_key in pairs(movie_keys) do
		core:svr_save_registry_bool(movie_key, should_lock)
	end
end


local faction_summary_variables = {
	summary_end_turn_file_name = nil,
	summary_enabled = false
}

local table_format_data_setup = {
	"Turn",
	"Faction key",
	"Number of Settlements",
	"Number of Armies",
	"Food(stock)",		"Food(income)",
	"Wood(stock)", 		"Wood(income)",
	"Stone(stock)",		"Stone(income)",
	"Bronze(stock)",	"Bronze(income)",
	"Gold(stock)",		"Gold(income)",
	"Pillars of Civ Level",
	"Legitimacy Total(egypt)",
	"Legitimacy Total(hatti)",
	"God Slot 1",	"God Slot 1(favour)",
	"God Slot 2",	"God Slot 2(favour)",
	"God Slot 3",	"God Slot 3(favour)",
	"Power 1",		"Power 1 (tier)",
	"Power 2",		"Power 2 (tier)",
	"Power 3",		"Power 3(tier)",
	"Power 4",		"Power 4(tier)",
	"Power 5",		"Power 5(tier)"
}

local non_human_factions_to_be_logged_keys = {
	"phar_main_weshesh",
	"phar_main_shekelesh",
	"phar_main_lukka",
	"phar_main_teresh ",
	"phar_main_denyen",
	"phar_main_ekwesh",
	"phar_main_tjeker",
	"phar_main_kaska",
	"phar_main_phrygian_invaders",
	"phar_main_libu_invaders",

}

function faction_data_summary_file_setup_creator()
	local string = ""
	for i, data in ipairs(table_format_data_setup) do
		string = string .. data .. ","
	end
	return string .. "\n"
end

function log_faction_summary_data(file, faction_key)

	local curr_turn = cm:model():turn_number()

	file:write(curr_turn .. "," .. faction_key)

	local faction = cm:get_faction(faction_key)
	if not faction or faction:is_dead() then
		file:write("," .. " is dead. Skipping data... \n")
		return
	end

	file:write("," .. faction:num_regions() .. "," .. faction:military_force_list():num_items())
	
	local resource_keys = {
		"troy_food",
		"troy_wood",
		"troy_stones",
		"troy_bronze",
		"troy_gold",
	}
	for i, resource_key in ipairs(resource_keys) do
		local resource = faction:pooled_resource(resource_key)
		file:write("," .. resource:value() .. "," .. resource:income())
	end

	file:write("," .. pillars_civilization.current_level_index .. "," .. faction:pooled_resource("phar_legitimacy"):value() .. "," .. faction:pooled_resource("phar_hatti_legitimacy"):value())
	
	local god_slots = deities.get_god_slots(faction_key)
	if god_slots then
		for g, god_slot in ipairs(god_slots) do
			if god_slot.god_key then
				file:write("," .. god_slot.god_key .. "," .. god_slot.favour.total_favour)
			else
				file:write("," .. "slot " .. "," .. "empty")
			end
		end
	else
		file:write("," .. "no god " .. "," .. "slots " .. "," .. "for " .. "," .. "this " .. "," .. "faction " .. "," .. "...")
	end

	if pharaohs_powers.persistent.faction_data[faction_key] then
		for t, tier in ipairs(pharaohs_powers.persistent.faction_data[faction_key].tier_unlocks) do
			for tp, curr_power in ipairs(tier) do
				file:write("," .. curr_power .. "," .. t)
			end
		end
	elseif great_king_powers.persistent.faction_data[faction_key] then
		for t, tier in ipairs(great_king_powers.persistent.faction_data[faction_key].tier_unlocks) do
			for tp, curr_power in ipairs(tier) do
				file:write("," .. curr_power .. "," .. t)
			end
		end
	else
		file:write("," .. "no powers available for this faction...")
	end

	file:write("\n")
end

function faction_data_round_summary_start()
	local listener_name = "faction_data_round_summary_listener"
	out("Starting faction_data_round_summary dump...")
	
	faction_summary_variables.summary_enabled = true

	core:add_listener(
		listener_name,
		"RoundStart",
		true,
		function(context)
			local end_turn_file = nil
			if not faction_summary_variables.summary_end_turn_file_name then
				local summary_path = string.gsub(common.get_appdata_screenshots_path(), "screenshots", "logs")
				faction_summary_variables.summary_end_turn_file_name = summary_path .. "/faction_data_summary_" .. os.date("%Y_%m_%d_%H_%M_%S") .. ".csv"
				end_turn_file = io.open(faction_summary_variables.summary_end_turn_file_name, "w")
				if not end_turn_file then
					out("Failed to open file " .. faction_summary_variables.summary_end_turn_file_name .. " . Stopping...")
					faction_data_round_summary_stop_listener(listener_name)
					return
				end
				end_turn_file:write(faction_data_summary_file_setup_creator())
			else
				end_turn_file = io.open(faction_summary_variables.summary_end_turn_file_name, "a")
				if not end_turn_file then
					out("Failed to open file " .. faction_summary_variables.summary_end_turn_file_name .. " . Stopping...")
					faction_data_round_summary_stop_listener(listener_name)
					return
				end
			end

			local human_faction_keys = cm:get_human_factions()
			for i, faction_key in ipairs(human_faction_keys) do
				log_faction_summary_data(end_turn_file, faction_key)
			end

			for j, ai_faction_key in ipairs(non_human_factions_to_be_logged_keys) do
				log_faction_summary_data(end_turn_file, ai_faction_key)
			end

			end_turn_file:write("\n")
			end_turn_file:close()
		end,
		true
	)
end

function faction_data_round_summary_start_for_turn(turn_number)
	out("Starting faction_data_round_summary_start_for_turn listener...")
	core:add_listener(
		"faction_data_round_summary_for_turn_listener",
		"RoundStart",
		true,
		function(context)
			if cm:model():turn_number() == turn_number then
				local summary_path = string.gsub(common.get_appdata_screenshots_path(), "screenshots", "logs")
				faction_summary_variables.summary_end_turn_file_name = summary_path .. "/faction_data_summary_for_turn".. turn_number .. "_" .. os.date("%Y_%m_%d_%H_%M_%S") .. ".csv"
				local end_turn_file = io.open(faction_summary_variables.summary_end_turn_file_name, "w")

				if not end_turn_file then
					out("Failed to open file " .. faction_summary_variables.summary_end_turn_file_name .. " . Stopping...")
					faction_data_round_summary_stop_listener("faction_data_round_summary_for_turn_listener")
					return
				end

				end_turn_file:write(faction_data_summary_file_setup_creator() .. "\n")

				local human_faction_keys = cm:get_human_factions()
				for i, faction_key in ipairs(human_faction_keys) do
					log_faction_summary_data(end_turn_file, faction_key)
				end

				for j, ai_faction_key in ipairs(non_human_factions_to_be_logged_keys) do
					log_faction_summary_data(end_turn_file, ai_faction_key)
				end
					
				end_turn_file:close()
				core:remove_listener("faction_data_round_summary_for_turn_listener")
			end
		end,
		true
	)
end

function faction_data_round_summary_stop_listener(listener_name)
	out("Stopping faction_data_round_summary dump...")
	core:remove_listener(listener_name)
	faction_summary_variables.summary_end_turn_file_name = nil
	faction_summary_variables.summary_enabled = false
end

if __game_mode == __lib_type_campaign then
	cm:add_first_tick_callback(
		function()
			if faction_summary_variables.summary_enabled then
				faction_data_round_summary_start()
			end
		end
	)

	cm:add_saving_game_callback(
		function(context)
			cm:save_named_value("DEBUG_FACTION_SUMMARY_VARIABLES", faction_summary_variables, context)
		end
	)

	cm:add_loading_game_callback(
		function(context)
			faction_summary_variables = cm:load_named_value("DEBUG_FACTION_SUMMARY_VARIABLES", faction_summary_variables, context)
		end
	)
end