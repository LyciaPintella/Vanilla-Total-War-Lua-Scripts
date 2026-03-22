

--[[
-- for topic leader
require("script.battle.intro_battles.wh2_intro_battle");

-- helper functions
require("script.battle.scripted_tours.scripted_tour_helper_functions");
]]


local cam = bm:camera();
local campaign_key = bm:get_campaign_key();
local infotext = get_infotext_manager();
local ui_root = core:get_ui_root();

local battle_type = bm:battle_type();
local player_is_attacker = bm:player_is_attacker();
local is_multiplayer = bm:is_multiplayer();

local sunits_local_player = bm:get_scriptunits_for_local_players_army();







-- Infotext state overrides
infotext:set_state_override("phar_main_st_siege_battles_0013", "prelude_normal_bullet_text");
infotext:set_state_override("phar_main_st_siege_battles_0014", "prelude_normal_bullet_text");
infotext:set_state_override("phar_main_st_siege_battles_0015", "prelude_normal_bullet_text");
-- infotext:set_state_override("phar_main_st_siege_battles_0015", "prelude_normal_bullet_end");









-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-- Flammable Buildings
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

local flammable_buildings = {};
local FLAMMABLE_NEIGHBOUR_BUILDING_THRESHOLD_DISTANCE = 50;
local FLAMMABLE_BUILDING_ELIGIBLE_CATEGORIES = {
	"house"
};

if bm:is_siege_battle() and not is_multiplayer then
	-- for each capture location
		-- get a list of buildings less than 150m of it that are flammable houses and have two flammable houses within 50m
		-- pick the one furthest away
		-- store this building in the flammable_buildings data structure

	local start_time = os.clock();
	
	local clm = bm:capture_location_manager();

	local BUILDING_TO_CAPTURE_LOCATION_THRESHOLD_DISTANCE = 50;
	local MIN_NEIGHBOURS_FOR_ELIGIBILITY = 2;

	for i = 1, clm:count() do
		local cl = clm:item(i);
		local cl_position = cl:position();

		local furthest_eligible_building;
		local furthest_eligible_building_distance = 0;

		bm:get_buildings_from_grid(
			cl_position, 
			BUILDING_TO_CAPTURE_LOCATION_THRESHOLD_DISTANCE, 
			function(building)
				-- This building is eligible if it's of the correct category and has two or more buildings within a certain radius that
				local building_category = building:category();
				local building_category_is_eligible = true; -- Leaving this in case we want to do more specific search on feedback

				if building_category_is_eligible then
					local building_distance = building:central_position():distance_xz(cl_position);

					if building_distance > furthest_eligible_building_distance then

						local neighbouring_building_list = bm:get_buildings_close_to_building_from_grid(
							building,
							FLAMMABLE_NEIGHBOUR_BUILDING_THRESHOLD_DISTANCE, 
							function(neighbour_building)
								local neighbour_building_category = neighbour_building:category();
								for j = 1, #FLAMMABLE_BUILDING_ELIGIBLE_CATEGORIES do
									if neighbour_building_category == FLAMMABLE_BUILDING_ELIGIBLE_CATEGORIES[j] then
										return true;
									end;
								end;
							end
						);

						if #neighbouring_building_list > MIN_NEIGHBOURS_FOR_ELIGIBILITY then
							furthest_eligible_building_distance = building_distance;
							furthest_eligible_building = building;
						end;
					end;
				end;
			end
		);

		table.insert(flammable_buildings, furthest_eligible_building);
	end;


	local end_time = os.clock();


	bm:out("");
	bm:out("siege_battle_tours.lua :: printing " .. #flammable_buildings .. " flammable buildings, picking them took " .. end_time - start_time .. "s");
	
	for i = 1, #flammable_buildings do
		bm:out("\tbuilding " .. i .. " at " .. v_to_s(flammable_buildings[i]:central_position()));
	end;
	
	bm:out("");
end;


local function create_flammable_building_record(building)
	local record = {
		building = building,
		is_on_fire = building:is_on_fire(),
		is_immune_to_fire_damage = building:is_immune_to_fire_damage()
	};
	
	return record;
end;

local function restore_flammable_building_from_record(record)
	record.building:set_on_fire(record.is_on_fire);
	record.building:set_immune_to_fire_damage(record.is_immune_to_fire_damage);
end;


local chosen_flammable_building_record;
local chosen_flammable_building_neighbour_records;

local function generate_camera_positions_for_flammable_buildings()
	local camera_pos = cam:position();
	local chosen_flammable_building;

	do
		local closest_flammable_building;
		local closest_flammable_distance = 5000;

		for i = 1, #flammable_buildings do
			local current_building = flammable_buildings[i];
			local current_building_distance = current_building:position():distance_xz(camera_pos);

			if current_building_distance < closest_flammable_distance then
				closest_flammable_building = current_building;
				closest_flammable_distance = current_building_distance;
			end;
		end;

		chosen_flammable_building = closest_flammable_building;
	end;

	chosen_flammable_building_record = nil;
	chosen_flammable_building_neighbour_records = {};
	
	if chosen_flammable_building then
		-- Get a list of flammable buildings close to the chosen flammable building
		local chosen_flammable_building_neighbours = bm:get_buildings_close_to_building_from_grid(chosen_flammable_building, FLAMMABLE_NEIGHBOUR_BUILDING_THRESHOLD_DISTANCE);

		-- Ignite the flammable building and all neighbours, creating records to de-ignite them as we go
		chosen_flammable_building_record = create_flammable_building_record(chosen_flammable_building);

		for i = 1, #chosen_flammable_building_neighbours do
			chosen_flammable_building_neighbour_records[i] = create_flammable_building_record(chosen_flammable_building_neighbours[i]);
		end;
	
		-- Return camera positions from the chosen flammable building	
		local pos_building = chosen_flammable_building:central_position();
		local start_cam_pos, end_cam_pos = st_helper.get_offset_camera_positions_by_bearing_vector(
			pos_building,													-- cam target vector
			camera_pos,														-- from vector for bearing
			70																-- distance
		);

		return pos_building, start_cam_pos, end_cam_pos;
	end;
end;


function restore_flammable_buildings()
	restore_flammable_building_from_record(chosen_flammable_building_record);

	for i = 1, #chosen_flammable_building_neighbour_records do
		restore_flammable_building_from_record(chosen_flammable_building_neighbour_records[i]);
	end;
end;









-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-- Helper Functions
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

--
-- Generate navigable tour section for a siege intro
--
local function generate_siege_intro_nts(infotext)
	local nts_intro = st_helper.navigable_tour_section_battle_factory(
		"intro",											-- section name
		function() 
			return st_helper.get_offset_camera_positions_from_sunits(
				sunits_local_player, 
				0, 
				-75,
				nil,
				nil,
				nil,
				true
			);
		end,												-- camera positions generator
		nil,												-- advice key
		infotext											-- infotext		
	);

	return nts_intro;
end;


--
-- Generate navigable tour section for siege walls
--
local function generate_walls_nts(infotext, as_attacker)

	local nts_walls = st_helper.navigable_tour_section_battle_factory(
		"walls",											-- section name
		function() 
			if as_attacker then
				return st_helper.get_offset_camera_positions_from_walls_as_attacker();
			end;

			return st_helper.get_offset_camera_positions_from_walls_as_defender();
		end,												-- camera positions generator
		nil,												-- advice key
		infotext											-- infotext
	);

	-- precondition(s)
	nts_walls:add_precondition(
		function()
			return st_helper.fort_wall_building_exists();
		end,
		"No valid wall pieces could be found"
	);

	return nts_walls;
end;


--
-- Generate navigable tour section for settlement gates
--
local function generate_gates_nts(infotext, as_attacker)

	local nts_gates = st_helper.navigable_tour_section_battle_factory(
		"gates",											-- section name
		function() 
			return st_helper.get_offset_camera_positions_from_gate(as_attacker)
		end,												-- camera positions generator
		nil,												-- advice key
		infotext											-- infotext
	);

	-- precondition(s)
	nts_gates:add_precondition(
		function()
			return st_helper.fort_gate_building_exists();
		end,
		"No gates could be found"
	);

	return nts_gates;
end;

local function generate_victory_points_types_nts(infotext)

	local nts_victory_point_types = st_helper.navigable_tour_section_battle_factory(
		"victory_point_types",											-- section name
		nil,												-- camera positions generator
		nil,												-- advice key
		infotext											-- infotext
	);

	return nts_victory_point_types;
end;

--
-- Generate navigable tour section for defensive towers
--
local function generate_towers_nts(infotext)

	local nts_towers = st_helper.navigable_tour_section_battle_factory(
		"towers",											-- section name
		function() 
			return st_helper.get_offset_camera_positions_from_tower()
		end,												-- camera positions generator
		nil,												-- advice key
		infotext											-- infotext
	);

	-- precondition(s)
	nts_towers:add_precondition(
		function()
			return st_helper.selectable_tower_exists();
		end,
		"No suitable tower could be found"
	);

	return nts_towers;
end;


--
-- Generate navigable tour section for attacking siege weapons
--
local function generate_siege_weapons_nts(infotext)

	local nts_siege_weapons = st_helper.navigable_tour_section_battle_factory(
		"siege_weapons",									-- section name
		function() 
			return st_helper.get_offset_camera_positions_from_siege_weapons()
		end,												-- camera positions generator
		nil,												-- advice key
		infotext											-- infotext
	);

	-- precondition(s)
	nts_siege_weapons:add_precondition(
		function()
			return bm:assault_equipment_exists();
		end
	);

	return nts_siege_weapons;
end;


--
-- Generate navigable tour section for capture locations in a major siege
--
local function generate_capture_locations_nts(infotext)

	local cached_cl;
	local nts_capture_locations = st_helper.navigable_tour_section_battle_factory(
		"capture_locations",								-- section name
		function()
			local pos_capture_location, start_cam_position, end_cam_position, cl = st_helper.get_offset_camera_positions_from_gate_capture_location();
			cached_cl = cl;
			return pos_capture_location, start_cam_position, end_cam_position;
		end,												-- camera positions generator
		nil,												-- advice key
		infotext											-- infotext
	);

	-- precondition(s)
	nts_capture_locations:add_precondition(
		function()
			return st_helper.capture_location_with_gate_exists();
		end,
		"No gates with capture locations could be found"
	);


	-- additional action(s)
	nts_capture_locations:action(
		function()
			-- enable and then disable highlights with cached_cl
			if cached_cl then
				cached_cl:highlight(true);

				nts_capture_locations:add_skip_action(
					function()
						cached_cl:highlight(false);
					end
				);
			end;
		end,
		3000
	);

	return nts_capture_locations;
end;


--
-- Generate navigable tour section for the victory location
--
local function generate_victory_location_nts(infotext)

	local cached_vl;
	local nts_victory_locations = st_helper.navigable_tour_section_battle_factory(
		"victory_locations",								-- section name
		function()
			local pos_victory_location, start_cam_position, end_cam_position, vl = st_helper.get_offset_camera_positions_from_victory_point();
			cached_vl = vl;
			return pos_victory_location, start_cam_position, end_cam_position;
		end,												-- camera positions generator
		nil,												-- advice key
		infotext											-- infotext
	);

	-- precondition(s)
	nts_victory_locations:add_precondition(
		function()
			return true --st_helper.victory_point_plaza_capture_location_exists();
		end,
		"No victory location could be found"
	);

	-- additional action(s)
	nts_victory_locations:action(
		function()
			-- enable and then disable highlights with cached_vl
			if cached_vl then
				cached_vl:highlight(true);

				nts_victory_locations:add_skip_action(
					function()
						cached_vl:highlight(false);
					end
				);
			end;
		end,
		3000
	);

	return nts_victory_locations;
end;


--
-- Generate navigable tour section for flammable buildings
--
local function generate_flammable_buildings_nts(infotext)

	local nts_flammable_buildings = st_helper.navigable_tour_section_battle_factory(
		"flammable_buildings",								-- section name
		function()
			local pos_building, start_cam_pos, end_cam_pos = generate_camera_positions_for_flammable_buildings();

			if pos_building then
				return pos_building, start_cam_pos, end_cam_pos;
			else
				script_error("ERROR: failed to generate camera positions for flammable buildings");
			end;
		end,												-- camera positions generator
		nil,												-- advice key
		infotext											-- infotext
	);

	-- precondition(s)
	nts_flammable_buildings:add_precondition(
		function()
			return flammable_buildings and #flammable_buildings > 0;
		end,
		"No flammable buildings could be found"
	);


	nts_flammable_buildings:action(
		function()
			nts_flammable_buildings:add_skip_action(
				function()
					restore_flammable_buildings();
				end
			);
		end,
		0
	);

	return nts_flammable_buildings;
end;

local function generate_stances_with_clip_nts(infotext, movie_path, destroy_movie_player_timer)
	local nts_stances = st_helper.navigable_tour_section_battle_factory(
		"stances",											-- section name
		nil,												-- camera positions generator
		nil,												-- advice key
		infotext,											-- infotext
		nil,												-- infotext delay
		nil,												-- objective
		nil,												-- objective test
		false,												-- leave objective
		movie_path,											-- movie path
		destroy_movie_player_timer
	);

	return nts_stances;
end









-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-- MAJOR SIEGE BATTLE DEFENCE
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
do	
	nt_siege_defence = navigable_tour:new(
		"siege_battle_defence",														-- unique name
		function()																	-- end callback
		end,
		"ui_text_replacements_localised_text_phar_main_battle_scripted_tour_major_siege_defence_name"
	);

	nt_siege_defence:set_allow_camera_movement(true);

	-- validation rules for this navigable tour
	nt_siege_defence:add_validation_rule(
		function()
			return core:is_battle();
		end,
		"random_localisation_strings_string_scripted_tour_invalid_not_battle"
	);

	nt_siege_defence:add_validation_rule(
		function()
			return not is_multiplayer;
		end,
		"random_localisation_strings_string_scripted_tour_invalid_not_singleplayer"
	);

	nt_siege_defence:add_validation_rule(
		function()
			return battle_type == "settlement_standard";
		end,
		"random_localisation_strings_string_scripted_tour_invalid_not_major_siege_battle"
	);

	nt_siege_defence:add_validation_rule(
		function()
			return not player_is_attacker;
		end,
		"random_localisation_strings_string_scripted_tour_invalid_player_not_defender"
	);

	nt_siege_defence:add_validation_rule(
		function()
			return bm:get_current_phase_name() == "Deployment";
		end,
		"random_localisation_strings_string_scripted_tour_invalid_player_not_deployment"
	);

	nt_siege_defence:add_validation_context_change_listener(
		"BattleConflictPhaseCommenced"
	);


	if battle_type == "settlement_standard" and not player_is_attacker then	

		-------------------------------------------------
		--- Section 01 : Intro
		-------------------------------------------------

		local nts_intro = generate_siege_intro_nts(
			{
				"phar_main_st_siege_battles_0001",
				--"phar_main_st_siege_battles_0002",
				"phar_main_st_siege_battles_0003"
			}
		);


		-------------------------------------------------
		--- Section 02 : Walls
		-------------------------------------------------

		local nts_walls = generate_walls_nts(
			{
				"phar_main_st_siege_battles_0010",
				"phar_main_st_siege_battles_0011",
				"phar_main_st_siege_battles_0012",
				"phar_main_st_siege_battles_0013",
				"phar_main_st_siege_battles_0014",
				"phar_main_st_siege_battles_0015"
			}, 
			false										-- is the player attacking
		);


		-------------------------------------------------
		--- Section 03 : Gates
		-------------------------------------------------

		local nts_gates = generate_gates_nts(
			{
				"phar_main_st_siege_battles_0020",
				"phar_main_st_siege_battles_0021",
				"phar_main_st_siege_battles_0022",
				"phar_main_st_siege_battles_0023"
			}, 
			false										-- is the player attacking
		);

		
		-------------------------------------------------
		--- Section 04 : Towers
		-------------------------------------------------

		local nts_towers = generate_towers_nts(
			{
				"phar_main_st_siege_battles_0030",
				"phar_main_st_siege_battles_0031",
				"phar_main_st_siege_battles_0032",
				"phar_main_st_siege_battles_0033"
			}
		);


		-------------------------------------------------
		--- Section 05 : Flammable Buildings
		-------------------------------------------------

		local nts_flammable_buildings = generate_flammable_buildings_nts(
			{
				"phar_main_st_siege_battles_0070",
				"phar_main_st_siege_battles_0071",
				"phar_main_st_siege_battles_0072"
			}
		);

			
		-------------------------------------------------
		--- Section 06 : Capture Locations
		-------------------------------------------------

		local nts_capture_locations = generate_capture_locations_nts(
			{
				"phar_main_st_siege_battles_0040",
				"phar_main_st_siege_battles_0041",
				"phar_main_st_siege_battles_0042",
				"phar_main_st_siege_battles_0043",
				"phar_main_st_siege_battles_0044"
			}
		);

		-------------------------------------------------
		--- Section 07 : Hold Stances
		-------------------------------------------------

	
		local nts_stances = generate_stances_with_clip_nts(
			{
				"phar_main_st_siege_battles_0063",
				"phar_main_st_siege_battles_0064"
			},
			"siege_tour_stances_hold_1",
			2000
		);
		
		-------------------------------------------------
		--- Section 08 : Enemy Siege Weapons
		-------------------------------------------------

		local nts_siege_weapons = generate_siege_weapons_nts(
			{
				"phar_main_st_siege_battles_0050",
				"phar_main_st_siege_battles_0051",
				"phar_main_st_siege_battles_0052"
			}
		);


		-------------------------------------------------
		--- Section 09 : Victory Locations
		-------------------------------------------------

		local nts_victory_locations = generate_victory_location_nts(
			{
				"phar_main_st_siege_battles_0080",
				"phar_main_st_siege_battles_0081",
				"phar_main_st_siege_battles_0082"
			}
		);
		
		-------------------------------------------------
		--- Section 10 : Victory Point Types
		-------------------------------------------------

		local nts_victory_point_types = generate_victory_points_types_nts(
			{
				"phar_main_st_siege_battles_0100",
				"phar_main_st_siege_battles_0101",
				"phar_main_st_siege_battles_0102",
				"phar_main_st_siege_battles_0103",
				"phar_main_st_siege_battles_0104",
				"phar_main_st_siege_battles_0105",
				"phar_main_st_siege_battles_0106",
				"phar_main_st_siege_battles_0107",

			}
		);


		-- add all sections to tour in order
		nt_siege_defence:add_navigable_section(nts_intro);
		nt_siege_defence:add_navigable_section(nts_walls);
		nt_siege_defence:add_navigable_section(nts_gates);
		nt_siege_defence:add_navigable_section(nts_towers);
		nt_siege_defence:add_navigable_section(nts_flammable_buildings);
		nt_siege_defence:add_navigable_section(nts_capture_locations);
		nt_siege_defence:add_navigable_section(nts_stances);
		nt_siege_defence:add_navigable_section(nts_siege_weapons);
		nt_siege_defence:add_navigable_section(nts_victory_locations);
		nt_siege_defence:add_navigable_section(nts_victory_point_types);



		-- add startup actions
		nt_siege_defence:start_action(
			function()
				st_helper.setup_tour_start(nt_siege_defence);
			end,
			0
		);


		-- add end actions
		nt_siege_defence:end_action(
			function()
				st_helper.setup_tour_end(nt_siege_defence);

				if is_battle_tutorial_loaded_from_frontend() then
					show_advisor_progress_buttons(false);
			end
			end
		);
	end;
end;











-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-- MAJOR SIEGE BATTLE ATTACK
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
do
	nt_siege_battle_attack = navigable_tour:new(
		"siege_battle_attack",														-- unique name
		function()																	-- end callback
		end,
		"ui_text_replacements_localised_text_phar_main_battle_scripted_tour_major_siege_attack_name"
	);

	nt_siege_battle_attack:set_allow_camera_movement(true);

	-- validation rules for this navigable tour
	nt_siege_battle_attack:add_validation_rule(
		function()
			return core:is_battle();
		end,
		"random_localisation_strings_string_scripted_tour_invalid_not_battle"
	);

	nt_siege_battle_attack:add_validation_rule(
		function()
			return not is_multiplayer;
		end,
		"random_localisation_strings_string_scripted_tour_invalid_not_singleplayer"
	);

	nt_siege_battle_attack:add_validation_rule(
		function()
			return battle_type == "settlement_standard";
		end,
		"random_localisation_strings_string_scripted_tour_invalid_not_major_siege_battle"
	);

	nt_siege_battle_attack:add_validation_rule(
		function()
			return player_is_attacker;
		end,
		"random_localisation_strings_string_scripted_tour_invalid_player_not_attacker"
	);

	nt_siege_battle_attack:add_validation_rule(
		function()
			return bm:get_current_phase_name() == "Deployment";
		end,
		"random_localisation_strings_string_scripted_tour_invalid_player_not_deployment"
	);

	nt_siege_battle_attack:add_validation_context_change_listener(
		"BattleConflictPhaseCommenced"
	);


	if battle_type == "settlement_standard" and player_is_attacker then

		-------------------------------------------------
		--- Section 01 : Intro
		-------------------------------------------------

		local nts_intro = generate_siege_intro_nts(
			{
				"phar_main_st_siege_battles_0001",
				"phar_main_st_siege_battles_0002",
--				"phar_main_st_siege_battles_0003"
			}
		);


		-------------------------------------------------
		--- Section 02 : Siege Weapons
		-------------------------------------------------

		local nts_siege_weapons = generate_siege_weapons_nts(
			{
				"phar_main_st_siege_battles_0050",
				"phar_main_st_siege_battles_0051",
				"phar_main_st_siege_battles_0052",
				"phar_main_st_siege_battles_0053"
			}													-- infotext
		);


		-------------------------------------------------
		--- Section 03 : Walls
		-------------------------------------------------

		local nts_walls = generate_walls_nts(
			{
				"phar_main_st_siege_battles_0010",
				"phar_main_st_siege_battles_0011",
				"phar_main_st_siege_battles_0012",
				"phar_main_st_siege_battles_0013",
				"phar_main_st_siege_battles_0014",
				"phar_main_st_siege_battles_0015"
			}, 
			true										-- is the player attacking
		);

		
		-------------------------------------------------
		--- Section 04 : Gates
		-------------------------------------------------

		local nts_gates = generate_gates_nts(
			{
				"phar_main_st_siege_battles_0020",
				"phar_main_st_siege_battles_0021",
				"phar_main_st_siege_battles_0022",
				"phar_main_st_siege_battles_0023"
			}, 
			true										-- is the player attacking
		);


		-------------------------------------------------
		--- Section 05 : Towers
		-------------------------------------------------

		local nts_towers = generate_towers_nts(
			{
				"phar_main_st_siege_battles_0030",
				"phar_main_st_siege_battles_0031",
				"phar_main_st_siege_battles_0032",
				"phar_main_st_siege_battles_0033"
			}
		);


		-------------------------------------------------
		--- Section 06 : Flammable Buildings
		-------------------------------------------------

	
		local nts_flammable_buildings = generate_flammable_buildings_nts(
			{
				"phar_main_st_siege_battles_0070",
				"phar_main_st_siege_battles_0071",
				"phar_main_st_siege_battles_0072"
			}
		);
	
		-------------------------------------------------
		--- Section 07 : Advance Stances
		-------------------------------------------------

		local nts_stances = generate_stances_with_clip_nts(
			{
				"phar_main_st_siege_battles_0060",
				"phar_main_st_siege_battles_0061"
			},
			"siege_tour_stances_advance_1",
			2000
		);
		
		-------------------------------------------------
		--- Section 08 : Capture Locations
		-------------------------------------------------

		local nts_capture_locations = generate_capture_locations_nts(
			{
				"phar_main_st_siege_battles_0040",
				"phar_main_st_siege_battles_0041",
				"phar_main_st_siege_battles_0042",
				"phar_main_st_siege_battles_0043",
				"phar_main_st_siege_battles_0044"
			}
		);


		-------------------------------------------------
		--- Section 09 : Victory Locations
		-------------------------------------------------
		
		local nts_victory_locations = generate_victory_location_nts(
			{
				"phar_main_st_siege_battles_0080",
				"phar_main_st_siege_battles_0081",
				"phar_main_st_siege_battles_0082"
			}
		);

		-------------------------------------------------
		--- Section 10 : Victory Point Types
		-------------------------------------------------

		local nts_victory_point_types = generate_victory_points_types_nts(
			{
				"phar_main_st_siege_battles_0100",
				"phar_main_st_siege_battles_0101",
				"phar_main_st_siege_battles_0102",
				"phar_main_st_siege_battles_0103",
				"phar_main_st_siege_battles_0104",
				"phar_main_st_siege_battles_0105",
				"phar_main_st_siege_battles_0106",
				"phar_main_st_siege_battles_0107",

			}
		);


		-- add all sections to tour in order
		nt_siege_battle_attack:add_navigable_section(nts_intro);
		nt_siege_battle_attack:add_navigable_section(nts_siege_weapons);
		nt_siege_battle_attack:add_navigable_section(nts_walls);
		nt_siege_battle_attack:add_navigable_section(nts_gates);
		nt_siege_battle_attack:add_navigable_section(nts_towers);
		nt_siege_battle_attack:add_navigable_section(nts_flammable_buildings);
		nt_siege_battle_attack:add_navigable_section(nts_stances);
		nt_siege_battle_attack:add_navigable_section(nts_capture_locations);
		nt_siege_battle_attack:add_navigable_section(nts_victory_locations);
		nt_siege_battle_attack:add_navigable_section(nts_victory_point_types);


		
		-- add startup actions
		nt_siege_battle_attack:start_action(
			function()
				st_helper.setup_tour_start(nt_siege_battle_attack);
			end,
			0
		);


		-- add end actions
		nt_siege_battle_attack:end_action(
			function()
				st_helper.setup_tour_end(nt_siege_battle_attack);
				
				if is_battle_tutorial_loaded_from_frontend() then
					show_advisor_progress_buttons(false);
				end
			end
		);
	end;
end;








-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-- MINOR SETTLEMENT BATTLE
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
do
	nt_minor_settlement = navigable_tour:new(
		"minor_settlement_attack",														-- unique name
		function()																		-- end callback
		end,
		"ui_text_replacements_localised_text_phar_main_battle_scripted_tour_minor_settlement_attack_name"
	);

	nt_minor_settlement:set_allow_camera_movement(true);

	-- validation rules for this navigable tour
	nt_minor_settlement:add_validation_rule(
		function()
			return core:is_battle();
		end,
		"random_localisation_strings_string_scripted_tour_invalid_not_battle"
	);

	nt_minor_settlement:add_validation_rule(
		function()
			return not is_multiplayer;
		end,
		"random_localisation_strings_string_scripted_tour_invalid_not_singleplayer"
	);

	nt_minor_settlement:add_validation_rule(
		function()
			return battle_type == "settlement_unfortified";
		end,
		"random_localisation_strings_string_scripted_tour_invalid_not_major_siege_battle"
	);

	nt_minor_settlement:add_validation_rule(
		function()
			return bm:get_current_phase_name() == "Deployment";
		end,
		"random_localisation_strings_string_scripted_tour_invalid_player_not_deployment"
	);

	nt_minor_settlement:add_validation_context_change_listener(
		"BattleConflictPhaseCommenced"
	);


	if battle_type == "settlement_unfortified" then

		-------------------------------------------------
		--- Section 01 : Intro
		-------------------------------------------------
		
		local nts_intro = generate_siege_intro_nts(
			{
				"phar_main_st_siege_battles_0090",
				"phar_main_st_siege_battles_0091",
				"phar_main_st_siege_battles_0092",
				"phar_main_st_siege_battles_0093"
			}
		);
		

		-------------------------------------------------
		--- Section 04 : Flammable Buildings
		-------------------------------------------------

		
		local nts_flammable_buildings = generate_flammable_buildings_nts(
			{
				"phar_main_st_siege_battles_0070",
				"phar_main_st_siege_battles_0071",
				"phar_main_st_siege_battles_0072"
			}
		);

		-------------------------------------------------
		--- Section 03 : Victory Locations
		-------------------------------------------------

		local nts_victory_locations = generate_victory_location_nts(
			{
				"phar_main_st_siege_battles_0080",
				"phar_main_st_siege_battles_0081",
				"phar_main_st_siege_battles_0042",
				"phar_main_st_siege_battles_0043",
				"phar_main_st_siege_battles_0082"
			}
		);

		-------------------------------------------------
		--- Section 04 : Victory Point Types 
		-------------------------------------------------

		local nts_victory_point_types = generate_victory_points_types_nts(
			{
				"phar_main_st_siege_battles_0100",
				"phar_main_st_siege_battles_0101",
				"phar_main_st_siege_battles_0102",
				"phar_main_st_siege_battles_0103",
				"phar_main_st_siege_battles_0104",
				"phar_main_st_siege_battles_0105",
				"phar_main_st_siege_battles_0106",
				"phar_main_st_siege_battles_0107",

			}
		);

		-- add all sections to tour in order
		nt_minor_settlement:add_navigable_section(nts_intro);
		nt_minor_settlement:add_navigable_section(nts_flammable_buildings);
		nt_minor_settlement:add_navigable_section(nts_victory_locations);
		nt_minor_settlement:add_navigable_section(nts_victory_point_types);

		
		-- add startup actions
		nt_minor_settlement:start_action(
			function()
				st_helper.setup_tour_start(nt_minor_settlement);
			end,
			0
		);


		-- add end actions
		nt_minor_settlement:end_action(
			function()
				st_helper.setup_tour_end(nt_minor_settlement);

				if is_battle_tutorial_loaded_from_frontend() then
					show_advisor_progress_buttons(false);
				end
			end
		);
	end;

end;