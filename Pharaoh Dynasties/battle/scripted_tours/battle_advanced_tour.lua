


local cam = bm:camera();

local sunits_local_player = bm:get_scriptunits_for_local_players_army();
local sunit_local_player_general = sunits_local_player:get_general_sunit();

local highlight_table_padding = 1

local sunits_enemy_main = bm:get_scriptunits_for_main_enemy_army_to_local_player();

local health_percentage_treshold = 20
local monitor_timer_delay = 20000

local sai_enemy = false;

local suitable_weather_for_climate = "dry"
local weather_change_delay = 25000

local battle_clock_uic
local general_target_sunits

local complete_obj_distance_threshold = 20

local event_triggered_from_tour = false

-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-- UTIL FUNCTIONS
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

local function filter_and_assign_sunits_for_tour(navigable_tour)

	local MIN_ELIGIBLE_PLAYER_UNITS = 7;
	local MIN_ELIGIBLE_ENEMY_UNITS = 3;

	local eligible_units_count_player = {
		general = 1,
		melee 	= 4,
		ranged  = 2,
		chariot = 1,
		vanguard = 1

	}
	-- Get a list of eligible player and enemy units to use in the tour
	local sunits_player_eligible = sunits_local_player:filter(
		"player_eligible",
		function(sunit)
			local unit = sunit.unit
			local unit_class = unit:unit_class()

			if unit_class == "com" and eligible_units_count_player.general > 0 then 
				eligible_units_count_player.general = eligible_units_count_player.general - 1
				return true
			else
				if unit:is_infantry() then 
					if unit:can_guerrilla_deploy() and eligible_units_count_player.vanguard > 0 then 
						eligible_units_count_player.vanguard = eligible_units_count_player.vanguard - 1
						return true;
					elseif unit:is_infantry_ranged() and eligible_units_count_player.ranged > 0 then
						eligible_units_count_player.ranged = eligible_units_count_player.ranged - 1
						return true
					elseif not unit:can_guerrilla_deploy() and not unit:is_infantry_ranged() and eligible_units_count_player.melee > 0 then  
						eligible_units_count_player.melee = eligible_units_count_player.melee - 1
						return true
					end  
				
				elseif unit:is_chariot() then 
					if eligible_units_count_player.chariot > 0 then
						eligible_units_count_player.chariot = eligible_units_count_player.chariot - 1
						return true
					end
				end
			end
		end
	);

	local eligible_units_count_enemy = {
		general = 1,
		melee 	= 3,
		ranged 	= 1
	}
	local sunits_enemy_eligible = sunits_enemy_main:filter(
		"enemy_eligible",
		function(sunit)
			local unit = sunit.unit
			local unit_class = unit:unit_class()

			if unit_class == "com" and eligible_units_count_enemy.general > 0 then 
				eligible_units_count_enemy.general = eligible_units_count_enemy.general - 1
				return true
			else				
				if unit:is_infantry() then 
					if not unit:is_infantry_ranged() then
						if eligible_units_count_enemy.melee > 0 then 
							eligible_units_count_enemy.melee = eligible_units_count_enemy.melee - 1
							return true
						end
					else 
						if eligible_units_count_enemy.ranged > 0 then 
							eligible_units_count_enemy.ranged = eligible_units_count_enemy.ranged - 1
							return true
						end
					end  
				end
			end
		end
	);

	local num_eligible_player_units = sunits_player_eligible:count();
	local num_eligible_enemy_units = sunits_enemy_eligible:count();

	navigable_tour.min_player_units_threshold_reached = num_eligible_player_units >= MIN_ELIGIBLE_PLAYER_UNITS;
	navigable_tour.min_enemy_units_threshold_reached = num_eligible_enemy_units >= MIN_ELIGIBLE_ENEMY_UNITS;

	if navigable_tour.min_player_units_threshold_reached and navigable_tour.min_enemy_units_threshold_reached then

		-- Determine how many player/enemy units to use
		local num_player_units_to_use, num_enemy_units_to_use;

		if num_eligible_player_units >= 9 then
			num_player_units_to_use = 9;
		else
			num_player_units_to_use = num_eligible_player_units;
		end;

		if num_eligible_enemy_units >=5 then
			num_enemy_units_to_use = 5;
		else
			num_enemy_units_to_use = num_eligible_enemy_units;
		end;
		
		-- Sort the eligible player sunits, highest-value to lowest-value
		sunits_player_eligible:sort(
			function(sunit1, sunit2)
				return sunit1.unit:strategic_value() > sunit2.unit:strategic_value();
			end
		);

		-- Sort the eligible enemy sunits, lowest-value to highest-value
		sunits_enemy_eligible:sort(
			function(sunit1, sunit2)
				return sunit1.unit:strategic_value() < sunit2.unit:strategic_value();
			end
		);

		-- Work out exactly what units to use
		local sunits_player_to_use = script_units:new("battle_advanced_player");
		for i = 1, num_player_units_to_use do
			sunits_player_to_use:add_sunits(sunits_player_eligible:item(i));
		end;
	
		
	
		local sunits_enemy_to_use = script_units:new("battle_advanced_enemy");
		for i = 1, num_enemy_units_to_use do
			sunits_enemy_to_use:add_sunits(sunits_enemy_eligible:item(i));
		end;
	
		-- By this point we should have player and enemy sunit collections to use in the scripted tour - save these to the tour object
		navigable_tour.sunits_player = sunits_player_to_use;
		navigable_tour.sunits_enemy = sunits_enemy_to_use;

		navigable_tour.start_pos_center = sunits_player_to_use:get_centremost()
		navigable_tour.start_pos_bearing = sunits_player_to_use:average_bearing()
		navigable_tour.start_pos_width = sunits_player_to_use:width()


		local sunits_melee_infantry = script_units:new("battle_advanced_player_melee")
		local sunits_ranged_infantry = script_units:new("battle_advanced_player_ranged")
		local sunits_chariots = script_units:new("battle_advanced_player_chariot")
		local sunits_vanguard = script_units:new("battle_advanced_player_vanguard")

		for _,sunit in ipairs(sunits_player_to_use.sunit_list) do 
			local unit = sunit.unit 

			if unit:is_infantry() and not unit:is_commanding_unit() then 
				if unit:is_infantry_ranged() and not unit:can_guerrilla_deploy() then 
					sunits_ranged_infantry:add_sunits(sunit)					
				else
					if unit:can_guerrilla_deploy() and sunits_vanguard:count() == 0 then 
						sunits_vanguard:add_sunits(sunit)
					else
						sunits_melee_infantry:add_sunits(sunit)
					end
				end
			elseif unit:is_chariot() and not unit:is_commanding_unit() then
				sunits_chariots:add_sunits(sunit)
			end
		end

		local sunits_general = script_units:new("battle_advanced_general");
		sunits_general:add_sunits(sunits_player_to_use:get_general_sunit())


		navigable_tour.sunits_player_melee = sunits_melee_infantry;
		navigable_tour.sunits_player_ranged = sunits_ranged_infantry;
		navigable_tour.sunits_player_chariots = sunits_chariots;
		navigable_tour.sunits_player_vanguard = sunits_vanguard;
		navigable_tour.general = sunits_player_to_use:get_general_sunit()
		navigable_tour.sunits_player_general = sunits_general

		out.scripted_tours("");
		out.scripted_tours("Battle Advanced scripted tour is working out what units/battlefield area to use");
		out.inc_tab("scripted_tours");

		out.scripted_tours("player sunits:");
		for i = 1, sunits_player_to_use:count() do
			local current_sunit = sunits_player_to_use:item(i);
			out.scripted_tours("\t" .. i .. ": " .. current_sunit.name .. " of type " .. current_sunit.unit:type() .. " at position " .. v_to_s(current_sunit.unit:position()) .. " with strategic value " .. current_sunit.unit:strategic_value());
		end;

		out.scripted_tours("");
		out.scripted_tours("enemy sunits:");
		for i = 1, sunits_enemy_to_use:count() do
			local current_sunit = sunits_enemy_to_use:item(i);
			out.scripted_tours("\t" .. i .. ": " .. current_sunit.name .. " of type " .. current_sunit.unit:type() .. " at position " .. v_to_s(current_sunit.unit:position()) .. " with strategic value " .. current_sunit.unit:strategic_value());
		end;

		-- Compile collections of scriptunits in the primary player and primary enemy forces that we didn't use, as we have to treat them specially later
		local sunits_player_unused = script_units:new("battle_advanced_player_unused");
		for i = 1, sunits_local_player:count() do
			local current_sunit = sunits_local_player:item(i);
			if not sunits_player_to_use:contains(current_sunit) then
				sunits_player_unused:add_sunits(current_sunit);
			end;
		end;

		local sunits_enemy_unused = script_units:new("battle_advanced_enemy_unused");
		for i = 1, sunits_enemy_main:count() do
			local current_sunit = sunits_enemy_main:item(i);
			if not sunits_enemy_to_use:contains(current_sunit) then
				sunits_enemy_unused:add_sunits(current_sunit);
			end;
		end;

		navigable_tour.sunits_player_unused = sunits_player_unused;
		navigable_tour.sunits_enemy_unused = sunits_enemy_unused;
	
		if is_battle_tutorial_loaded_from_frontend() then
			for _,sunit in ipairs(navigable_tour.sunits_enemy_unused.sunit_list) do 
				sunit:kill(true)
			end
		end
	end;
end

local function reposition_sunits_for_tour(sunits, is_enemy)
	local uc = sunits:get_unitcontroller();

	if is_enemy then
		uc:teleport_to_location(v_offset_by_bearing(bounding_box.pos, d_to_r(bounding_box.bearing), bounding_box.depth / 2), bounding_box.bearing + 180, bounding_box.width);
	else
		for _,sunit in ipairs(sunits.sunit_list) do
			sunit:teleport_to_start_location_offset(0, -200)
		end
	end;
end;


core:add_listener(
	"post_tutorial_battle_end_battle_highlight",
	"ScriptEventBattlePhaseChanged",
	function()
		return event_triggered_from_tour and bm:is_victory_countdown_phase()
	end,
	function() 
		local end_battle_uic = core:get_ui_root():SequentialFind("button_end_battle")
		event_triggered_from_tour = false
		if end_battle_uic then
			pulse_uicomponent(end_battle_uic, true)
		end
	end,
	true
);

-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-- ADVANCED BATTLE TOUR
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

local function is_battle_type_suitable_for_battle_advanced_scripted_tour()
	return bm:battle_type() == "land_normal"
end;


do
	nt_battle_advanced = navigable_tour:new(
		"battle_advanced",															-- unique name
		function()																	-- end callback
		end,
		"ui_text_replacements_localised_text_phar_main_battle_scripted_tour_deployment_name"
	);

	nt_battle_advanced_combat = navigable_tour:new(
		"battle_advanced_combat",													-- unique name
		function()																	-- end callback
		end,
		"ui_text_replacements_localised_text_phar_main_battle_scripted_tour_deployment_name"
	);

	nt_battle_advanced:set_allow_camera_movement(true);

	-- validation rules for this navigable tour
	nt_battle_advanced:add_validation_rule(
		function()
			return core:is_battle()
		end,
		"random_localisation_strings_string_scripted_tour_invalid_not_battle"
	);

	nt_battle_advanced:add_validation_rule(
		function()
			return is_battle_type_suitable_for_battle_advanced_scripted_tour();
		end,
		"random_localisation_strings_string_scripted_tour_invalid_not_normal_land_battle"
	);

	nt_battle_advanced:add_validation_rule(
		function()
			return not bm:is_multiplayer()
		end,
		"random_localisation_strings_string_scripted_tour_invalid_not_singleplayer"
	);

	nt_battle_advanced:add_validation_rule(
		function()
			return bm:battle_type() ~= "land_ambush"
		end,
		"random_localisation_strings_string_scripted_tour_invalid_is_ambush_battle"
	);

--[[	nt_battle_advanced:add_validation_rule(
		function()
			return bm:get_current_phase_name() == "Deployment"
		end,
		"random_localisation_strings_string_scripted_tour_invalid_player_not_deployment"
	);
]]
	nt_battle_advanced:add_validation_rule(
		function()
			return nt_battle_advanced.min_player_units_threshold_reached;
		end,
		"random_localisation_strings_string_scripted_tour_invalid_insufficient_player_units"
	);

	nt_battle_advanced:add_validation_rule(
		function()
			return nt_battle_advanced.min_enemy_units_threshold_reached;
		end,
		"random_localisation_strings_string_scripted_tour_invalid_insufficient_enemy_units"
	);

	nt_battle_advanced:add_validation_context_change_listener(
		"BattleConflictPhaseCommenced"
	);

	------------------------------------------
	----------- Listeners --------------------
	------------------------------------------

	core:add_listener(
		"EndDeploymentTourOnBattleStart",
		"ComponentLClickUp",
		function(context) 
			return context.string == "button_battle_start" and is_battle_tutorial_loaded_from_frontend()
		end,
		function() 
			local uic_tour_end = core:get_ui_root():SequentialFind("scripted_tour_end_button")
			uic_tour_end:SimulateLClick()
		end,
		true
	);

	------ fixing sunits
	if not bm:is_multiplayer() then 
		filter_and_assign_sunits_for_tour(nt_battle_advanced)
	end;
		
	------






	-------------------------------------------------
	--- Section 01 : Intro - Inspect Battlefild
	-------------------------------------------------
	
	local nts_inspect_battlefield = st_helper.navigable_tour_section_battle_factory(
		"inspect_battlefield",									-- section name	
		function()
			local player_centre_pos = sunits_local_player:centre_point();
			local enemy_centre_pos = sunits_enemy_main:centre_point();
			local pos_centre = centre_point_table({player_centre_pos, enemy_centre_pos});
			
			return pos_centre, st_helper.get_offset_camera_positions_by_offset_and_bearing(
				pos_centre,
				500, 
				-200, 
				get_bearing(player_centre_pos, enemy_centre_pos)
			);
		end,											-- camera positions generator
		nil,												-- advice key
		{
			"phar_main_st_battle_advanced_0010",
			"phar_main_st_battle_advanced_0011",
			"phar_main_st_battle_advanced_0012",
			"phar_main_st_battle_advanced_0013"
		}													-- infotext
	);

	nts_inspect_battlefield:action(
		function() 
			out("*** Setting the withdraw button to be disabled ***")
			core:get_ui_root():SequentialFind("button_withdraw"):SetDisabled(true)
			
			-- Disable weather ping icon
			local ping_uic = core:get_ui_root():SequentialFind("ping_parent")
			ping_uic:PropagateVisibility(false)


			bm:enable_camera_movement(true);
			nt_battle_advanced.general:cache_location()
		end,
		0
	)

	-- make the deployment zone flash, and then stop it flashing when we proceed
	nts_inspect_battlefield:action(
		function()
			local local_player_army = sunits_local_player:item(1).unit:army();
			local_player_army:highlight_deployment_areas(true);

			local main_enemy_army = sunits_enemy_main:item(1).unit:army();
			main_enemy_army:highlight_deployment_areas(true);

			nts_inspect_battlefield:add_skip_action(
				function()
					local_player_army:highlight_deployment_areas(false);
					main_enemy_army:highlight_deployment_areas(false);
				end
			);

			nts_inspect_battlefield:highlight_next_button()

		end,
		3000
	);




	
	-------------------------------------------------
	--- Section 02 : Terrain types
	-------------------------------------------------
	
	local nts_terrain_types = st_helper.navigable_tour_section_battle_factory(
		"terrain_types",									-- section name
		function()
			local player_centre_pos = sunits_local_player:centre_point();
			local enemy_centre_pos = sunits_enemy_main:centre_point();
			local pos_centre = centre_point_table({player_centre_pos, enemy_centre_pos});
			
			return pos_centre, st_helper.get_offset_camera_positions_by_offset_and_bearing(
				pos_centre,
				250, 
				-200, 
				get_bearing(player_centre_pos, enemy_centre_pos)
			);
		end,												-- camera positions generator
		nil,												-- advice key
		{
			"phar_main_st_battle_advanced_0020",
			"phar_main_st_battle_advanced_0021",
			"phar_main_st_battle_advanced_0022",
			"phar_main_st_battle_advanced_0023",
			"phar_main_st_battle_advanced_0024",
			"phar_main_st_battle_advanced_0025"
		},													-- infotext
		nil,												-- infotext delay
		nil,												-- objective
		nil,												-- objective test
		false,												-- leave objective
		"advanced_tour_terrain_types_01",					-- movie path
		31000
	);

	nts_terrain_types:action(
		function() 
			nts_terrain_types:highlight_next_button()
		end,
		3000
	)

	local pos_proxy_centre, pos_proxy_left, pos_proxy_right;
	local cam_pos_nts_multiple_movement, cam_targ_nts_multiple_movement;
	local proxy_id;

	local function setup_movement_proxies(sunits, first_row, target_sunits)
		if first_row then 
			local bounding_box_start_position =  nt_battle_advanced.general:get_cached_position()
			--local combat_area_width = nt_battle_advanced.sunits_player:width() > nt_battle_advanced.sunits_enemy:width() and nt_battle_advanced.sunits_player:width() or nt_battle_advanced.sunits_enemy:width();

			local bounding_box_bearing_r = d_to_r(nt_battle_advanced.general:get_cached_bearing());
			local bounding_box_half_width =  sunits:width() / 2;
			
			local bounding_box_left = v_offset_by_bearing(bounding_box_start_position, bounding_box_bearing_r - math.pi / 2, bounding_box_half_width);
			local bounding_box_right = v_offset_by_bearing(bounding_box_start_position, bounding_box_bearing_r + math.pi / 2, bounding_box_half_width);
			
			local most_forward_sunit, most_forward_sunit_distance = nil, -999999;

			for i = 1, sunits:count() do
				local current_sunit = sunits:item(i);
				local current_distance = distance_to_line(bounding_box_right, bounding_box_left, current_sunit.unit:position());

				if current_distance > most_forward_sunit_distance then
					most_forward_sunit_distance = current_distance;
					most_forward_sunit = current_sunit;
				end;
			end;

			local distance_of_units_to_proxy = most_forward_sunit_distance + 200;

			pos_proxy_centre = v_offset_by_bearing(bounding_box_start_position, bounding_box_bearing_r, distance_of_units_to_proxy);
			pos_proxy_left = v_to_ground(v_offset_by_bearing(pos_proxy_centre, bounding_box_bearing_r - math.pi / 2, bounding_box_half_width), 1);
			pos_proxy_right = v_to_ground(v_offset_by_bearing(pos_proxy_centre, bounding_box_bearing_r + math.pi / 2, bounding_box_half_width), 1);

		else
			local anchor_sunit = target_sunits:get_centremost()
			local anchor_pos = anchor_sunit.unit:position()
			local anchor_bearing_r = d_to_r(anchor_sunit.unit:bearing())
			local anchor_width = sunits:width()

			local anchor_left = v_offset_by_bearing(anchor_pos, anchor_bearing_r - math.pi / 2, anchor_width)
			local anchor_right = v_offset_by_bearing(anchor_pos, anchor_bearing_r + math.pi / 2, anchor_width)
			
			local most_forward_sunit, most_forward_sunit_distance = nil, -999999;

			for i = 1, target_sunits:count() do
				local current_sunit = target_sunits:item(i);
				local current_distance = distance_to_line(anchor_right, anchor_left, current_sunit.unit:position());

				if current_distance > most_forward_sunit_distance then
					most_forward_sunit_distance = current_distance;
					most_forward_sunit = current_sunit;
				end;
			end;

			local distance_of_units_to_proxy = most_forward_sunit_distance - 40

			pos_proxy_centre = v_offset_by_bearing(anchor_pos, anchor_bearing_r, distance_of_units_to_proxy);
			pos_proxy_left = v_to_ground(v_offset_by_bearing(pos_proxy_centre, anchor_bearing_r - math.pi / 2, anchor_width), 1);
			pos_proxy_right = v_to_ground(v_offset_by_bearing(pos_proxy_centre, anchor_bearing_r + math.pi / 2, anchor_width), 1);

		end
	end;


	local function show_movement_proxies(sunits)
		if not proxy_id then
			proxy_id = sunits:get_unitcontroller():add_animated_selection_proxy(pos_proxy_left, pos_proxy_right, 1, 3, true);
		end;
	end;


	local function remove_movement_proxies(sunits)
		if proxy_id then
			sunits:get_unitcontroller():remove_animated_selection_proxy(proxy_id);
			proxy_id = nil;
		end;
	end;


	local function restore_camera(period,sunits)
		local cam_target, cam_position = st_helper.get_offset_camera_positions_from_sunits(
			sunits,
			0,
			-75,
			nil,
			nil,
			nil,
			true
		);

		cam:move_to(cam_position, cam_target, period, false, 0);
	end;

	local function cache_location_for_sunits(sunits) 
		for _,sunit in ipairs(sunits.sunit_list) do
			sunit:cache_location()
		end
	end

	local function set_sunits_ping_icons(sunits, add)
		if add then 
			for i = 1, sunits:count() do
				local sunit = sunits:item(i)
				sunit:add_ping_icon()
			end
		else
			for i = 1, sunits:count() do
				local sunit = sunits:item(i)
				sunit:remove_ping_icon()
			end
		end
	end

	-- Flag used in nts_actions 03-06 to check for completing the objective. Currently used only for skip_actions.
	local nts_objective_complete

	local function get_unit_card_uic_table_for_sunits(sunits)
		local uic_table = {}
		local uic_parent = find_uicomponent(core:get_ui_root(), "battle_orders", "cards_panel", "review_DY");
		for i=1, sunits:count() do
			local sunit = sunits:item(i);
			local unique_ui_id = tostring(sunit.unit:unique_ui_id());
			
			if uic_parent and uic_parent:Visible() then	
				for j = 0, uic_parent:ChildCount() - 1 do
					local uic_card = UIComponent(uic_parent:Find(j));
					if uic_card:Id() == unique_ui_id then
						table.insert(uic_table, uic_card)
					end
				end
			end
		end
		return uic_table
	end
	-------------------------------------------------
	--- Section 03 : Melee Infantry
	-------------------------------------------------	
	local nts_deployment_melee_infantry = st_helper.navigable_tour_section_battle_factory(
		"deployment_melee",									-- section name
		nil,												-- camera positions generator
		nil,												-- advice key
		{
			"phar_main_st_battle_advanced_0030",
			"phar_main_st_battle_advanced_0031",
			"phar_main_st_battle_advanced_0032",
			"phar_main_st_battle_advanced_0033",
			"phar_main_st_battle_advanced_0034"
		},													-- infotext
		nil,
		"phar_main_st_battle_advanced_deploy_melee",		-- objective
		function()											-- objective test
			if nt_battle_advanced.sunits_player_melee:have_all_moved(pos_proxy_centre, complete_obj_distance_threshold) then 
				nts_objective_complete = true
				remove_movement_proxies(nt_battle_advanced.sunits_player_melee)
				set_sunits_ping_icons(nt_battle_advanced.sunits_player_melee, false)
				unhighlight_component_table()

				return true
			end
			return false
		end,
		true
	);

	nts_deployment_melee_infantry:action(
		function()
			if not bm:player_is_attacker() then 
				nt_battle_advanced.sunits_enemy:set_enabled(true) 
			end
		end,
		0
	);


	-- make the deployment zone flash, and then stop it flashing when we proceed
	nts_deployment_melee_infantry:action(
		function()


			bm:show_army_panel(true);

			reposition_sunits_for_tour(nt_battle_advanced.sunits_player_melee, false)
			set_sunits_ping_icons(nt_battle_advanced.sunits_player_melee, true)


			nt_battle_advanced.sunits_player_melee:set_enabled(true);
			nt_battle_advanced.sunits_player_melee:release_control();


			buim:deselect_all()

			nts_deployment_melee_infantry:add_skip_action(
				function(tour_ending, skipping_backwards)
					if not tour_ending then 
						if skipping_backwards then
							nt_battle_advanced.sunits_player_melee:set_enabled(false)
							nts_objective_complete = false
						else
							set_sunits_ping_icons(nt_battle_advanced.sunits_player_melee, false) 
							if not nts_objective_complete then 
								local uc = nt_battle_advanced.sunits_player_melee:get_unitcontroller()
								uc:teleport_to_location(pos_proxy_centre, nt_battle_advanced.sunits_player_melee:average_bearing(), nt_battle_advanced.sunits_player_melee:width())
							end
						end
					end 
				end, 
				"melee_deployment"
			)

		end,
		0
	);

	nts_deployment_melee_infantry:action(
		function()
			cache_location_for_sunits(nt_battle_advanced.sunits_player_melee)
			setup_movement_proxies(nt_battle_advanced.sunits_player_melee, true, nil);
			local cam_pos = st_helper.get_offset_camera_positions_by_bearing(pos_proxy_centre, 100, d_to_r(nt_battle_advanced.sunits_player_melee:average_bearing()) + math.pi, nil, 0);
			-- disable player camera movement
			bm:enable_camera_movement(false);
			-- move the camera to the computed position
			cam:move_to(cam_pos, pos_proxy_centre, 1.5, false, 0);
			bm:disable_orders(false);
			bm:enable_camera_movement(true);


		end,
		200
	);

	-- Show unit proxies
	nts_deployment_melee_infantry:action(
		function()
			local sunits_player = nt_battle_advanced.sunits_player_melee;

			show_movement_proxies(sunits_player);
			highlight_component_table(highlight_table_padding, unpack(get_unit_card_uic_table_for_sunits(nt_battle_advanced.sunits_player_melee)))

			nts_deployment_melee_infantry:add_skip_action(
				function()
					remove_movement_proxies(sunits_player);
					unhighlight_component_table()
				end
			);
		end,
		1500
	);

	--Restore camera
	nts_deployment_melee_infantry:action(
		function()
			bm:enable_camera_movement(true);
			nts_deployment_melee_infantry:remove_skip_action("disable_camera_movement");
			nts_deployment_melee_infantry:remove_skip_action("restore_camera");
		end,
		3500
	);

	nts_deployment_melee_infantry:action(
		function() 
			nts_deployment_melee_infantry:highlight_next_button()
		end,
		4000
	)

	-------------------------------------------------
	--- Section 04 : Ranged Infantry
	-------------------------------------------------
	local nts_deployment_ranged_infantry = st_helper.navigable_tour_section_battle_factory(
		"deployment_ranged",									-- section name
		nil,												-- camera positions generator
		nil,												-- advice key
		{
			"phar_main_st_battle_advanced_0040",
			"phar_main_st_battle_advanced_0041",
			"phar_main_st_battle_advanced_0042",
			"phar_main_st_battle_advanced_0043",
			"phar_main_st_battle_advanced_0044"
		},													-- infotext
		nil,
		"phar_main_st_battle_advanced_deploy_ranged",
		function()											-- objective test
			if nt_battle_advanced.sunits_player_ranged:have_all_moved(pos_proxy_centre, complete_obj_distance_threshold) then 
				nts_objective_complete = true
				remove_movement_proxies(nt_battle_advanced.sunits_player_ranged)
				set_sunits_ping_icons(nt_battle_advanced.sunits_player_ranged, false)
				unhighlight_component_table()
				return true
			end

			return false
		end,
		true
	);

	nts_deployment_ranged_infantry:action(
		function()
			reposition_sunits_for_tour(nt_battle_advanced.sunits_player_ranged, false)

			set_sunits_ping_icons(nt_battle_advanced.sunits_player_ranged, true)
			nt_battle_advanced.sunits_player_ranged:set_enabled(true)
			nt_battle_advanced.sunits_player:release_control();

			buim:deselect_all()
			nts_deployment_ranged_infantry:add_skip_action(
				function(tour_ending, skipping_backwards)
					if not tour_ending then 
						if skipping_backwards then
							nt_battle_advanced.sunits_player_ranged:set_enabled(false)
						else 
							set_sunits_ping_icons(nt_battle_advanced.sunits_player_ranged, false)
							if not nts_objective_complete then 
								local uc = nt_battle_advanced.sunits_player_ranged:get_unitcontroller()
								uc:teleport_to_location(pos_proxy_centre, nt_battle_advanced.sunits_player_ranged:average_bearing(), nt_battle_advanced.sunits_player_ranged:width())
							end
						end
					end 
				end, 
				"ranged_deployment"
			)
		end,
		0
	);

	nts_deployment_ranged_infantry:action(
		function()
			-- cache sunits positions for objective check
			cache_location_for_sunits(nt_battle_advanced.sunits_player_ranged)

			-- disable player camera movement
			bm:enable_camera_movement(false);

			-- compute the positions of the movement proxy
			setup_movement_proxies(nt_battle_advanced.sunits_player_ranged, false, nt_battle_advanced.sunits_player_melee);

			local cam_pos = st_helper.get_offset_camera_positions_by_bearing(pos_proxy_centre, 100, d_to_r(nt_battle_advanced.sunits_player_melee:average_bearing()) + math.pi, nil, 0);

			-- move the camera to the computed position
			cam:move_to(cam_pos, pos_proxy_centre, 1.5, false, 0);



		end,
		200
	);

	-- Show unit proxies
	nts_deployment_ranged_infantry:action(
		function()
			local sunits_player = nt_battle_advanced.sunits_player_ranged;

			show_movement_proxies(sunits_player);
			highlight_component_table(highlight_table_padding, unpack(get_unit_card_uic_table_for_sunits(nt_battle_advanced.sunits_player_ranged)))

			nts_deployment_ranged_infantry:add_skip_action(
				function()
					remove_movement_proxies(sunits_player);
					unhighlight_component_table()
				end
			);
		end,
		1500
	);

		-- Re-enable camera movement
	nts_deployment_ranged_infantry:action(
		function()
			bm:enable_camera_movement(true);
			nts_deployment_ranged_infantry:remove_skip_action("disable_camera_movement");
			nts_deployment_ranged_infantry:remove_skip_action("restore_camera");
		end,
		3500
	);

	nts_deployment_ranged_infantry:action(
		function() 
			nts_deployment_ranged_infantry:highlight_next_button()
		end,
		4000
	)



	-------------------------------------------------
	--- Section 05 : Chariots Deployment
	-------------------------------------------------
	local nts_deployment_chariots = st_helper.navigable_tour_section_battle_factory(
		"deployment_chariots",								-- section name
		nil,												-- camera positions generator
		nil,												-- advice key
		{
			"phar_main_st_battle_advanced_0050",
			"phar_main_st_battle_advanced_0051",
			"phar_main_st_battle_advanced_0052",
			"phar_main_st_battle_advanced_0053"
		},													-- infotext
		nil,
		"phar_main_st_battle_advanced_deploy_chariots",
		function()											-- objective test
			if nt_battle_advanced.sunits_player_chariots:count() > 0 then 
				if nt_battle_advanced.sunits_player_chariots:have_all_moved(pos_proxy_centre, complete_obj_distance_threshold) then 
					nts_objective_complete = true
					remove_movement_proxies(nt_battle_advanced.sunits_player_chariots)
					set_sunits_ping_icons(nt_battle_advanced.sunits_player_chariots, false)
					unhighlight_component_table()
					return true
				end

				return false
			end
		end,
		true
	);
	
	
	nts_deployment_chariots:action(
		function()
			if nt_battle_advanced.sunits_player_chariots:count() > 0 then
				bm:enable_camera_movement(true);
				reposition_sunits_for_tour(nt_battle_advanced.sunits_player_chariots, false)
				set_sunits_ping_icons(nt_battle_advanced.sunits_player_chariots, true)
				nt_battle_advanced.sunits_player_chariots:set_enabled(true)
				nt_battle_advanced.sunits_player:release_control();

				buim:deselect_all()

				-- disable player camera movement
				bm:enable_camera_movement(false);

				nts_deployment_chariots:add_skip_action(
					function(tour_ending, skipping_backwards)
						if not tour_ending then 
							if skipping_backwards then
								nt_battle_advanced.sunits_player_chariots:set_enabled(false)
								nts_objective_complete = false
							else 
								set_sunits_ping_icons(nt_battle_advanced.sunits_player_chariots, false)
								if not nts_objective_complete then 
									local uc = nt_battle_advanced.sunits_player_chariots:get_unitcontroller()
									uc:teleport_to_location(pos_proxy_centre, nt_battle_advanced.sunits_player_ranged:average_bearing(), nt_battle_advanced.sunits_player_chariots:width())
								end
							end
						end 
					end, 
					"chariots_deployment"
				)
			end
			
		end,
		0
	);

	-- Show unit proxies
	nts_deployment_chariots:action(
		function()
			if nt_battle_advanced.sunits_player_chariots:count() > 0 then
				-- cache sunits positions for objective check
				cache_location_for_sunits(nt_battle_advanced.sunits_player_chariots)

				setup_movement_proxies(nt_battle_advanced.sunits_player_chariots, false, nt_battle_advanced.sunits_player_ranged);			
				local cam_pos = st_helper.get_offset_camera_positions_by_bearing(pos_proxy_centre, 100, d_to_r(nt_battle_advanced.sunits_player_ranged:average_bearing()) + math.pi, nil, 0);

				-- move the camera to the computed position
				cam:move_to(cam_pos, pos_proxy_centre, 1.5, false, 0);
			end
		end,
		200
	);

	-- Show unit proxies
	nts_deployment_chariots:action(
		function()
			if nt_battle_advanced.sunits_player_chariots:count() > 0 then

				local sunits_player = nt_battle_advanced.sunits_player_chariots;
		
				show_movement_proxies(sunits_player);
				highlight_component_table(highlight_table_padding, unpack(get_unit_card_uic_table_for_sunits(nt_battle_advanced.sunits_player_chariots)))

				nts_deployment_chariots:add_skip_action(
					function()
						remove_movement_proxies(sunits_player);
						unhighlight_component_table()
					end
				);
			end
		end,
		1500
	);

	--Restore camera
	nts_deployment_chariots:action(
		function()
			bm:enable_camera_movement(true);
			nts_deployment_chariots:remove_skip_action("disable_camera_movement");
			nts_deployment_chariots:remove_skip_action("restore_camera");
		end,
		3500
	);

	nts_deployment_chariots:action(
		function() 
			nts_deployment_chariots:highlight_next_button()
		end,
		4000
	)



	-------------------------------------------------
	--- Section 06 : General Deployment
	-------------------------------------------------
	local nts_deployment_general = st_helper.navigable_tour_section_battle_factory(
		"deployment_general",											-- section name
		nil,												-- camera positions generator
		nil,												-- advice key
		{													-- infotext
			"phar_main_st_battle_advanced_0060",
			"phar_main_st_battle_advanced_0061",
			"phar_main_st_battle_advanced_0062",
			"phar_main_st_battle_advanced_0063"
		},													-- infotext
		nil,
		"phar_main_st_battle_advanced_deploy_general",
		function()											-- objective test	
			if nt_battle_advanced.general:has_moved() then 
				unhighlight_component_table()
				return true
			end
		end,
		true									
	);


	nts_deployment_general:action(
		function()
			bm:enable_camera_movement(true);
			reposition_sunits_for_tour(nt_battle_advanced.sunits_player_general, false)
			set_sunits_ping_icons(nt_battle_advanced.sunits_player_general, true)
			nt_battle_advanced.sunits_player_general:set_enabled(true)
			nt_battle_advanced.sunits_player:release_control();

			buim:deselect_all()

			-- disable player camera movement
			--bm:enable_camera_movement(false);

			nts_deployment_general:add_skip_action(
				function(tour_ending, skipping_backwards)
					if not tour_ending then 
						if skipping_backwards then
							nt_battle_advanced.sunits_player_general:set_enabled(false)
							nts_objective_complete = false
						else
							set_sunits_ping_icons(nt_battle_advanced.sunits_player_general, false)
							if not nts_objective_complete then 
								local uc = nt_battle_advanced.sunits_player_general:get_unitcontroller()
								uc:teleport_to_location(pos_proxy_centre, general_target_sunits:average_bearing(), nt_battle_advanced.sunits_player_general:width())
							end
						end
					end 
				end, 
				"chariots_deployment"
			)
		end,
		0
	);

	nts_deployment_general:action(
		function()
			-- cache sunits positions for objective check
			cache_location_for_sunits(nt_battle_advanced.sunits_player_general)
			setup_movement_proxies(nt_battle_advanced.sunits_player_general, false, general_target_sunits);			
			local cam_pos = st_helper.get_offset_camera_positions_by_bearing(pos_proxy_centre, 100, d_to_r(general_target_sunits:average_bearing()) + math.pi, nil, 0);
			-- move the camera to the computed position
			cam:move_to(cam_pos, pos_proxy_centre, 1.5, false, 0);
		end,
		200
	);

	nts_deployment_general:action(
		function()
			local sunits_player = nt_battle_advanced.sunits_player_general;
	
			show_movement_proxies(sunits_player);
			highlight_component_table(highlight_table_padding, unpack(get_unit_card_uic_table_for_sunits(nt_battle_advanced.sunits_player_general)))
			nts_deployment_general:add_skip_action(
				function()
					remove_movement_proxies(sunits_player);
					unhighlight_component_table()
				end
			);
		end,
		1500
	);


	nts_deployment_general:action(
		function() 
			nts_deployment_general:highlight_next_button()
		end,
		3000
	)



	-------------------------------------------------
	--- Section 07 : Vanguard Deployment
	-------------------------------------------------
	local nts_deployment_vanguard = st_helper.navigable_tour_section_battle_factory(
		"nts_deployment_vanguard",											-- section name
		function()
			-- sunits, x_offset, z_offset, horizontal_bearing, vertical_bearing, horizontal_bearing_delta, relaxed pose	
			if nt_battle_advanced.sunits_player_vanguard:count() > 0 then 
				return st_helper.get_offset_camera_positions_from_sunits(
					nt_battle_advanced.sunits_player_vanguard,
					0,
					-75,
					nil,
					nil,
					0,
					true
				);
			else 
				return st_helper.get_offset_camera_positions_from_sunits(
					nt_battle_advanced.sunits_player_melee,
					0,
					-75,
					nil,
					nil,
					0,
					true
				);
			end
		end,												-- camera positions generator
		nil,												-- advice key
		{													-- infotext
		"phar_main_st_battle_advanced_0070",
		"phar_main_st_battle_advanced_0071",
		"phar_main_st_battle_advanced_0072"
		},													-- infotext
		nil,
		"phar_main_st_battle_advanced_deploy_vanguard",
		function()											-- objective test
			if nt_battle_advanced.sunits_player_vanguard:count() > 0 then 
				return nt_battle_advanced.sunits_player_vanguard:have_any_moved(nt_battle_advanced.sunits_player_vanguard:get_cached_position(), 10)
			end
		end,
		true,
		"advanced_tour_vanguard_deployment_02",
		7200
	);

	nts_deployment_vanguard:action(
		function()
			if nt_battle_advanced.sunits_player_vanguard:count() > 0 then 			
					-- cache sunits positions for objective check
				cache_location_for_sunits(nt_battle_advanced.sunits_player_vanguard)
				reposition_sunits_for_tour(nt_battle_advanced.sunits_player_vanguard, false)
				
				buim:deselect_all()
				nt_battle_advanced.sunits_player_vanguard:set_enabled(true)
				nt_battle_advanced.sunits_player:release_control();

				nts_deployment_vanguard:add_skip_action(
					function(tour_ending, skipping_backwards)
						if not tour_ending then 
							if skipping_backwards then
								nt_battle_advanced.sunits_player_vanguard:set_enabled(false)
							end
						end 
					end, 
					"vanguard_deployment"
				)
			end
		end,
		0
	);

	nts_deployment_vanguard:action(
		function()
			if nt_battle_advanced.sunits_player_vanguard:count() > 0 then 
				highlight_component_table(highlight_table_padding, unpack(get_unit_card_uic_table_for_sunits(nt_battle_advanced.sunits_player_vanguard)))
				nts_deployment_vanguard:add_skip_action(
					function()
						unhighlight_component_table()
					end
				);
			end
		end,
		1500
	);
	

	nts_deployment_vanguard:action(
		function() 
			nts_deployment_vanguard:highlight_next_button()
		end,
		3000
	)

	-------------------------------------------------
	--- Section 08 : Unit Info Panel
	-------------------------------------------------
	
	local function toggle_unit_info_panel(pulse)
		local unit_info_panel = core:get_ui_root():SequentialFind("button_toggle_info_panel")
		pulse_uicomponent(unit_info_panel, pulse)
		unit_info_panel:SimulateLClick()

	end

	local nts_unit_info = st_helper.navigable_tour_section_battle_factory(
		"unit_info",									-- section name
		function()
			-- sunits, x_offset, z_offset, horizontal_bearing, vertical_bearing, horizontal_bearing_delta, relaxed pose
			return st_helper.get_offset_camera_positions_from_sunits(
				nt_battle_advanced.sunits_player,
				0,
				-75,
				nil,
				nil,
				nil,
				true
			);
		end,												-- camera positions generator
		nil,												-- advice key
		{													-- infotext
			"phar_main_st_battle_advanced_0080",
			"phar_main_st_battle_advanced_0081",
			"unit_info_legend",
		},													-- infotext
		nil,												-- advice/infotext delay
		"phar_main_st_battle_fundamentals_select_unit",		-- objective
		function()											-- objective test
			return bm:is_any_unit_selected();
		end,
		true
	);

	nts_unit_info:action(
		function()
			buim:deselect_all()
			nt_battle_advanced.sunits_player:release_control();

		end,
		0
	);


	nts_unit_info:action(
		function()
			bm:show_army_panel(true);
			toggle_unit_info_panel(true)
						
			nts_unit_info:add_skip_action(
				function()
					toggle_unit_info_panel(false)
				end
			);
		end,
		1000
	);

	nts_unit_info:action(
		function() 
			nts_unit_info:highlight_next_button()
		end,
		3000
	)

	-------------------------------------------------
	--- Section 09 : Unit Grouping
	-------------------------------------------------

	local function sunits_highlight_cards(sunits, state)
		for i=1, sunits:count() do
			local current_sunit = sunits:item(i);
			current_sunit:highlight_unit_card(state)
		end		
	end

	local function stop_pulse_unit_iterations()
		for _,sunit in ipairs(nt_battle_advanced.sunits_player.sunit_list) do 
			local unit = sunit.unit 
			bm:unregister_unit_selection_callback(unit)
		end
	end

	local function group_button_pulse_control(pulse)
		local grouping_uic = core:get_ui_root():SequentialFind("button_group")
		bm:callback(
			function()
				pulse_uicomponent(grouping_uic, pulse)
				if not pulse then
					grouping_uic:StopPulseHighlight()
				end
			end,
			0.5
		)
	end

	local nts_unit_grouping = st_helper.navigable_tour_section_battle_factory(
		"Unit Grouping",											-- section name
		function() 
			return st_helper.get_offset_camera_positions_from_sunits(
				sunits_local_player,
				0,
				-90,
				nil,
				nil,
				nil,
				true				-- relaxed pose
			);
		end,												-- camera positions generator
		nil,												-- advice key
		{													-- infotext
			"phar_main_st_battle_advanced_0090",
			"phar_main_st_battle_advanced_0091",
			"phar_main_st_battle_advanced_0092"
		},
		nil,
		"phar_main_st_battle_advanced_group_units",
		function()
			for _,sunit in ipairs(nt_battle_advanced.sunits_player.sunit_list) do 
				local unit = sunit.unit 
				if unit:is_in_group() or buim:is_unit_in_ui_group(unit:unique_ui_id()) then 
					nts_objective_complete = true
					sunits_highlight_cards(nt_battle_advanced.sunits_player_melee, false)

					stop_pulse_unit_iterations()
					group_button_pulse_control(false)

					return true
				end
			end
		end,
		true
	);

	nts_unit_grouping:action(
		function()
			bm:disable_groups(false);
			bm:disable_formations(false);

			-- For some reason selecting any unit and activating the button kills the pulse. Therefore adding selection callback to start it on selection.
			for _,sunit in ipairs(nt_battle_advanced.sunits_player.sunit_list) do 
				local unit = sunit.unit 
				bm:register_unit_selection_callback(
					unit, 
					function(unit, is_selected)
						group_button_pulse_control(is_selected)
					end
				)
			end

			sunits_highlight_cards(nt_battle_advanced.sunits_player_melee, true)

			nts_unit_grouping:add_skip_action(
				function(tour_ending, skipping_backwards)
					if skipping_backwards then 
						bm:disable_groups(true);
					end

					sunits_highlight_cards(nt_battle_advanced.sunits_player_melee, false)
					stop_pulse_unit_iterations()
					group_button_pulse_control(false)
				end
			);

		end,
		0
	);

	nts_unit_grouping:action(
		function() 
			nts_unit_grouping:highlight_next_button()
		end,
		3000
	)
	-------------------------------------------------
	--- Section 10 : Unit Stances
	-------------------------------------------------
	
	local nts_unit_stances = st_helper.navigable_tour_section_battle_factory(
		"Unit Stances",											-- section name
		function() 
			return st_helper.get_offset_camera_positions_from_sunits(
				sunits_local_player,
				0,
				-90,
				nil,
				nil,
				nil,
				true				-- relaxed pose
			);
		end,												-- camera positions generator
		nil,												-- advice key
		{													-- infotext
			"phar_main_st_battle_advanced_0100",
			"phar_main_st_battle_advanced_0101",
			"phar_main_st_battle_advanced_0102"
		}
	);

	nts_unit_stances:action(
		function()
			buim:deselect_all()
		end,
		0
	);





	-------------------------------------------------
	--- Section 11 : Start Battle
	-------------------------------------------------
	local nts_start_battle = st_helper.navigable_tour_section_battle_factory(
		"Start Battle",											-- section name
		nil,												-- camera positions generator
		nil,												-- advice key
		{													-- infotext
		"phar_main_st_battle_advanced_0110",
		"phar_main_st_battle_advanced_0111",
		},		
		nil,
		"phar_main_st_battle_advanced_start_battle",
		function()
			if bm:get_current_phase_name() == "Deployed" then
				
				nt_battle_advanced:start_next_section();
				return true
			end;
		end
	);

	
	nts_start_battle:action(
		function()
			bm:show_start_battle_button(true, true);

			local uic_finish_deployment = bm:ui_component("finish_deployment");
			local uic_deployment_end_sp = bm:ui_component("deployment_end_sp");
			local uic_battle_start = bm:ui_component("button_battle_start");
			
			uic_finish_deployment:SetVisible(true)
			uic_deployment_end_sp:SetVisible(true)
			uic_battle_start:PropagateVisibility(true)

			uic_finish_deployment:StartPulseHighlight()
			uic_deployment_end_sp:StartPulseHighlight()
			uic_battle_start:StartPulseHighlight()

			nts_start_battle:add_skip_action(
				function(tour_ending, skipping_backwards)
					if skipping_backwards then 
						uic_finish_deployment:SetVisible(false)
						uic_deployment_end_sp:SetVisible(false)
						uic_battle_start:PropagateVisibility(false)
					end
				end, 
				"skip weather")

		end,
		0
	);

	



	

	-- add all sections to tour in order
	nt_battle_advanced:add_navigable_section(nts_inspect_battlefield);
	nt_battle_advanced:add_navigable_section(nts_terrain_types);
	nt_battle_advanced:add_navigable_section(nts_deployment_melee_infantry);
	nt_battle_advanced:add_navigable_section(nts_deployment_ranged_infantry);
	nt_battle_advanced:add_navigable_section(nts_deployment_chariots);
	nt_battle_advanced:add_navigable_section(nts_deployment_general);
	nt_battle_advanced:add_navigable_section(nts_deployment_vanguard);
	nt_battle_advanced:add_navigable_section(nts_unit_info);
	nt_battle_advanced:add_navigable_section(nts_unit_grouping);
	nt_battle_advanced:add_navigable_section(nts_unit_stances);
	nt_battle_advanced:add_navigable_section(nts_start_battle);

	local function prepare_deployed_units_for_tour(sunits)
		for _,sunit in ipairs(sunits.sunit_list) do
			local position = sunit:get_cached_position()
			local bearing = sunit:get_cached_bearing()
			local width = sunit:get_cached_width() 
			sunit:teleport_to_cached_location()
			
		end
	end

	local function prepare_non_participant_army_for_tour(tour_starting, sunits)
		sunits:set_enabled(not tour_starting, false, true);
		
		if tour_starting then
			sunits:take_control();
		else
			sunits:release_control();
		end;
	end;


	local function prepare_all_armies_for_tour(tour_starting, sunits_player, sunits_enemy, sunits_player_unused, sunits_enemy_unused)

		tour_starting = not not tour_starting;

		local player_alliance_index = sunits_player:item(1).alliance_num;
		local player_army_index = sunits_player:item(1).unit:army_index();

		local main_enemy_alliance_index = sunits_enemy:item(1).alliance_num;
		local main_enemy_army_index = sunits_enemy:item(1).unit:army_index();

		local num_alliances = bm:num_alliances()
		
		-- Enable/disable units not in the player or enemy primary armies
		for i = 1, bm:num_alliances() do
			for j = 1, bm:num_armies_in_alliance(i) do

				-- Non-participating main armies
				if not (i == player_alliance_index and j == player_army_index) or (i == main_enemy_alliance_index and j == main_enemy_army_index) then
					prepare_non_participant_army_for_tour(tour_starting, bm:get_scriptunits_for_army(i, j));
				end;

				-- Reinforcing armies
				for k = 1, bm:num_reinforcing_armies_for_army_in_alliance(i, j) do
					sunits = bm:get_scriptunits_for_army(i, j, k)
					sunits:morale_behavior_rout();
					prepare_non_participant_army_for_tour(tour_starting, sunits);
				end;
			end;
		end;

		-- Enable/disable units not in the player or enemy primary armies
		if tour_starting then

			-- Teleport the player and enemy armies in to their starting positions
			reposition_sunits_for_tour(sunits_player, false);
			
			-- Disable enemy forces
			sunits_player:set_enabled(false, false, true)
			sunits_enemy:set_enabled(false, false, true);

			-- Disable remaining unused enemy/player forces
			sunits_player_unused:kill(true);
			sunits_enemy_unused:kill(true);

		else
			-- Respawn the player + enemy units, including unused, in their starting positions
			sunits_player:set_enabled(true);
			sunits_enemy:set_enabled(true);
			sunits_player_unused:set_enabled(true);
			sunits_enemy_unused:set_enabled(true);

			sunits_player:set_always_visible(false);
			sunits_enemy:set_always_visible(false);
			
			sunits_player:respawn_in_start_location();
			sunits_enemy:respawn_in_start_location();
			sunits_player_unused:respawn_in_start_location();
			sunits_enemy_unused:respawn_in_start_location();

			sunits_player:release_control();
			sunits_enemy:release_control();
			sunits_player_unused:release_control();
			sunits_enemy_unused:release_control();

			prepare_deployed_units_for_tour(sunits_player)

		end;
	end;


	local function find_suitable_climate(climate_type) 	
		local sandstorm_suitable_climates = {
			phar_eastern_desert = true,
			phar_north_western_desert = true,
			phar_oas = true,
			phar_south_western_desert = true
		}
	
		if sandstorm_suitable_climates[climate_type] then 
			return "sandstorm"
		else
			return "thunderstorm"
		end
	end


	-- add startup actions
	nt_battle_advanced:start_action(
		function()
			if is_battle_tutorial_loaded_from_frontend() then 
				nt_battle_advanced:set_close_button_visible(false, false); -- enabling close button on second part of tour when started from campaign. We don't enable it in the first part to prevent a softlock.
			end

			bm:suspend_adc(true)
			bm:suppress_unit_voices(true)
			event_triggered_from_tour = true

			cam:fade(false, 0.5)

			st_helper.setup_tour_start(nt_battle_advanced);

			bm:steal_input_focus(false, false)

			bm:modify_battle_speed(1);
			bm:disable_cycle_battle_speed(true);

			--set weather to a generic one at start
			suitable_weather_for_climate = find_suitable_climate(bm:get_climate_type())
			bm:change_weather("dry", 0, suitable_weather_for_climate)

			-- gating for optional units in campaign
			general_target_sunits = nt_battle_advanced.sunits_player_chariots:count() > 0 and nt_battle_advanced.sunits_player_chariots or nt_battle_advanced.sunits_player_ranged

			--local reinforcement_panel = core:get_ui_root():SequentialFind("adc_icon")
			--set_component_visible(false, reinforcement_panel)
			prepare_all_armies_for_tour(true, nt_battle_advanced.sunits_player, nt_battle_advanced.sunits_enemy, nt_battle_advanced.sunits_player_unused, nt_battle_advanced.sunits_enemy_unused)

			-- Disable bits of the UI we don't want
			bm:disable_help_page_button(true);
			bm:disable_unit_camera(true);
			bm:show_radar_frame(false, true);
			bm:show_ui_options_panel(false);
			nt_battle_advanced:set_allow_camera_movement(true);

			battle_clock_uic = core:get_ui_root():SequentialFind("txt_timer")
			battle_clock_uic:SetVisible(false)

			local battle_details_uic = core:get_ui_root():SequentialFind("battle_details")
			battle_details_uic:SetVisible(false)
		end,
		0
	);

	-- add end actions
	nt_battle_advanced:end_action(
		function()
			-- st_helper.setup_tour_end(nt_battle_advanced);

			-- -- Re-enable bits of the UI we didn't want
			-- bm:disable_tactical_map(false);
			-- bm:disable_help_page_button(false);
			-- bm:disable_unit_camera(false);
			-- bm:show_radar_frame(true, true);
			-- bm:show_ui_options_panel(true);

			-- battle_clock_uic:SetVisible(true)

			bm:clear_infotext();

			bm:suspend_adc(false)
			bm:suppress_unit_voices(false)

			nt_battle_advanced_combat:start()
		end
	);
	
	-----------------------------------------------------------------------------------------------------------------
	-----------------------------------------------------------------------------------------------------------------
	-- ADVANCED BATTLE TOUR: Part 2.
	-----------------------------------------------------------------------------------------------------------------
	-----------------------------------------------------------------------------------------------------------------


	filter_and_assign_sunits_for_tour(nt_battle_advanced_combat)


	-------------------------------------------------
	--- Section 12 : Army Movement controls
	-------------------------------------------------
	local army_movement_movie_duration = 10100

	local function start_enemy_army_attack()
		local sunits_enemy = nt_battle_advanced_combat.sunits_enemy;
		sunits_enemy:release_control();

		if not sai_enemy then
			sai_enemy = script_ai_planner:new("enemy_army", sunits_enemy);

			sai_enemy:attack_force(nt_battle_advanced_combat.sunits_player);
		end;
	end;

	local nts_army_movement = st_helper.navigable_tour_section_battle_factory(
		"Army Movement Controls",											-- section name
		function() 
			return st_helper.get_offset_camera_positions_from_sunits(
				sunits_local_player,
				0,
				-90,
				nil,
				nil,
				nil,
				true				-- relaxed pose
			);
		end,												-- camera positions generator
		nil,												-- advice key
		{													-- infotext
			"phar_main_st_battle_advanced_0120",
			"phar_main_st_battle_advanced_0121",
			"phar_main_st_battle_advanced_0122",
		}													-- infotext
	);


	nts_army_movement:action(
		function()
			if bm:player_is_attacker() then 
				nt_battle_advanced_combat.sunits_enemy:set_enabled(true) 
			end
			bm:suspend_adc(false)
			start_enemy_army_attack()
		end,
		0
	)

	nts_army_movement:action(
		function()
			if st_helper.automatic_nts_advancement_monitor(nt_battle_advanced_combat, health_percentage_treshold, monitor_timer_delay) then 
				nts_army_movement:add_skip_action(st_helper.stop_automatic_nts_advancement_monitor());
			end
		end,
		2500
	)

	nts_army_movement:action(
		function() 
			nts_army_movement:highlight_next_button()
		end,
		3000
	)
	-------------------------------------------------
	--- Section 13 : Fatigue
	-------------------------------------------------

	local nts_fatigue = st_helper.navigable_tour_section_battle_factory(
		"Fatigue",											-- section name
		nil,												-- camera positions generator
		nil,												-- advice key
		{													-- infotext
			"phar_main_st_battle_advanced_0130",
			"phar_main_st_battle_advanced_0131",
			"phar_main_st_battle_advanced_0132"
		}	
	);

	nts_fatigue:action(
		function()
			if st_helper.automatic_nts_advancement_monitor(nt_battle_advanced_combat, health_percentage_treshold, monitor_timer_delay) then 
				nts_fatigue:add_skip_action(st_helper.stop_automatic_nts_advancement_monitor());
			end
		end,
		2500
	)

	nts_fatigue:action(
		function() 
			nts_fatigue:highlight_next_button()
		end,
		3000
	)


	-------------------------------------------------
	--- Section 14 : Armour durability
	-------------------------------------------------
	
	local nts_armour = st_helper.navigable_tour_section_battle_factory(
		"Armour",											-- section name
		nil,												-- camera positions generator
		nil,												-- advice key
		{													-- infotext
			"phar_main_st_battle_advanced_0140",
			"phar_main_st_battle_advanced_0141"
		}	
	);

	nts_armour:action(
		function()
			-- Enable weather ping icon
			local ping_uic = core:get_ui_root():SequentialFind("ping_parent")
			ping_uic:PropagateVisibility(true)
			
			-- Trigger change weather on this step to activate the storm visual effects
			bm:change_weather(suitable_weather_for_climate, weather_change_delay, suitable_weather_for_climate)
		end,
		0
	)

	nts_armour:action(
		function()
			if st_helper.automatic_nts_advancement_monitor(nt_battle_advanced_combat, health_percentage_treshold, monitor_timer_delay) then 
				nts_armour:add_skip_action(st_helper.stop_automatic_nts_advancement_monitor());
			end
		end,
		2500
	)

	nts_armour:action(
		function() 
			nts_armour:highlight_next_button()
		end,
		3000
	)

	-------------------------------------------------
	--- Section 15 : Sandstorm
	-------------------------------------------------
	local nts_dynamic_weather = st_helper.navigable_tour_section_battle_factory(
		"Dynamic Weather",											-- section name
		nil,												-- camera positions generator
		nil,												-- advice key
		{													-- infotext
			"phar_main_st_battle_advanced_0150",
			"phar_main_st_battle_advanced_0151",
			"phar_main_st_battle_advanced_0153",
			"phar_main_st_battle_advanced_0154",
		}	
	);



	nts_dynamic_weather:action(
		function()
			--instantly change the weather to ensure we get the storm gameplay effects from updating the model.
			bm:change_weather(suitable_weather_for_climate,0,suitable_weather_for_climate)

			nts_dynamic_weather:add_skip_action(
				function(tour_ending, skipping_backwards)
					if skipping_backwards then 
						bm:change_weather("dry", 0, suitable_weather_for_climate)
						st_helper.stop_automatic_nts_advancement_monitor()
					else 
						bm:change_weather(suitable_weather_for_climate, 0, suitable_weather_for_climate)			
					end
				end, 
				"skip weather")
		end,
		0
	)

	nts_dynamic_weather:action(
		function()
			if st_helper.automatic_nts_advancement_monitor(nt_battle_advanced_combat, health_percentage_treshold, monitor_timer_delay) then 
				nts_dynamic_weather:add_skip_action(st_helper.stop_automatic_nts_advancement_monitor());
			end
		end,
		2500
	)

	nts_dynamic_weather:action(
		function() 
			nts_dynamic_weather:highlight_next_button()
		end,
		3000
	)

	-------------------------------------------------
	--- Section 16 : Win the battle
	-------------------------------------------------

	local nts_win = st_helper.navigable_tour_section_battle_factory(
		"Win Battle",											-- section name
		nil,												-- camera positions generator
		nil,												-- advice key
		{													-- infotext
		"phar_main_st_battle_advanced_0160",
		"phar_main_st_battle_advanced_0161"
		}	
	);

	nt_battle_advanced_combat:add_navigable_section(nts_army_movement);
	nt_battle_advanced_combat:add_navigable_section(nts_fatigue);
	nt_battle_advanced_combat:add_navigable_section(nts_armour);
	nt_battle_advanced_combat:add_navigable_section(nts_dynamic_weather);
	nt_battle_advanced_combat:add_navigable_section(nts_win);

	nt_battle_advanced_combat:start_action(
		function()
			bm:attach_to_advisor(false);
			nt_battle_advanced_combat:set_tour_controls_above_infotext(true);

			if bm:get_current_phase_name() == "Deployment" then
				bm:end_current_battle_phase();
			end;

			nt_battle_advanced_combat.sunits_player_melee:cache_location()
			nt_battle_advanced_combat.sunits_player_ranged:cache_location()
			nt_battle_advanced_combat.sunits_player_chariots:cache_location()
			nt_battle_advanced_combat.sunits_player_vanguard:cache_location()
			nt_battle_advanced_combat.sunits_player_general:cache_location()
		end,
		0
	);


	-- add end actions
	nt_battle_advanced_combat:end_action(
		function()
			st_helper.setup_tour_end(nt_battle_advanced_combat);

			-- Re-enable bits of the UI we didn't want
			bm:disable_help_page_button(false);
			bm:disable_unit_camera(false);
			bm:show_radar_frame(true, true);
			bm:show_ui_options_panel(true);
			bm:disable_cycle_battle_speed(false);

			if is_battle_tutorial_loaded_from_frontend() then
				show_advisor_progress_buttons(false);
			end

			battle_clock_uic:SetVisible(true)

			local battle_details_uic = core:get_ui_root():SequentialFind("battle_details")
			battle_details_uic:SetVisible(true)

			if not is_battle_tutorial_loaded_from_frontend() then 
				prepare_all_armies_for_tour(false, nt_battle_advanced_combat.sunits_player, nt_battle_advanced_combat.sunits_enemy, nt_battle_advanced_combat.sunits_player_unused, nt_battle_advanced_combat.sunits_enemy_unused)

				cam:fade(true, 0.5);
				bm:enable_cinematic_ui(true, false, false);

				bm:callback(
					function()
						bm:change_weather("dry", 0, "dry")
						local cam_targ, cam_pos = st_helper.get_offset_camera_positions_from_sunits(
							nt_battle_advanced_combat.sunits_player, 
							0, 
							-55,
							nil,
							nil,
							nil,
							true
						);
						cam:move_to(cam_pos, cam_targ, 3, false, 0);
						cam:fade(false, 0.5);
						bm:enable_cinematic_ui(false, true, false);
						nt_battle_advanced_combat.sunits_player:release_control()
					end, 
					1000, 
					"end_cutscene"
				)
			end
		end
	);

end;