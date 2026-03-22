

---- QA Helper functions
-- Example to how to call the function in the QA console
-- qa_spawn_army_test("phar_main_general_kemet", false, "phar_main_ancyra", "phar_main_fac_bay_canaanite_warriors, phar_main_fac_bay_canaanite_warriors")
-- Where:
-- "phar_main_general_kemet" - is the agent_subtype_key for the spawned general
-- false - this forces the army created to not be for the player
-- "phar_main_ancyra" - override faction key for which the army spawns
-- "phar_main_fac_bay_canaanite_warriors, phar_main_fac_bay_canaanite_warriors" - list of units by key, they must be separated by a comma and be in the same string


function qa_spawn_army_test(agent_subtype_key, for_player_faction, other_faction_name, unit_list) 
	local player_faction_key = cm:get_local_faction_name()
	local faction = cm:get_local_faction()
	local fl = faction:faction_leader()
	local pos_x, pos_y = cm:find_valid_spawn_location_for_character_from_character(player_faction_key, cm:char_lookup_str(fl), true, 2)
	local enemy_faction_key = other_faction_name or "phar_main_akhmim"
	local list_of_units = unit_list or "phar_main_nat_fen_canaanite_recruits"


	if for_player_faction then
		cm:create_force_with_general(
			player_faction_key,
			list_of_units,
			fl:region():name(),
			pos_x,
			pos_y,
			"general",
			agent_subtype_key,
			"names_name_100229777",
			"",
			"",
			"",
			false,
			nil
		)
	else
		cm:create_force_with_general(
			enemy_faction_key,
			list_of_units,
			fl:region():name(),
			pos_x,
			pos_y,
			"general",
			agent_subtype_key,
			"names_name_100229777",
			"",
			"",
			"",
			false,
			nil
		)
	end
end