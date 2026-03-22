


local cam = bm:camera();
local campaign_key = bm:get_campaign_key();
local infotext = get_infotext_manager();
local ui_root = core:get_ui_root();

local sunits_local_player = bm:get_scriptunits_for_local_players_army();
local sunit_local_player_general = sunits_local_player:get_general_sunit();

local sunits_enemy_main = bm:get_scriptunits_for_main_enemy_army_to_local_player();

local sai_enemy = false;

local player_army_has_one_unit = false;
if sunits_local_player:count() == 1 then
	player_army_has_one_unit = true;
end;

local health_percentage_treshold = 35

local monitor_timer_delay = 20000

local enemy_army = bm:get_first_non_player_army()
enemy_army:suppress_reinforcement_adc()

local suitable_weather_for_climate = "dry"
local weather_change_delay = 25000

local battle_clock_uic

local event_triggered_from_tour = false

local is_battle_ftue_bool = core:svr_load_bool("sbool_tutorial_battle_selected_from_frontend");

-------------------------------------------------	
--- Prerequisites
-------------------------------------------------

local fundamentals_steps_advice_key = {
	[1] = "phar_battle_tutorial_army_mern_01",
	[2] = "phar_battle_tutorial_camera_mern_01",
	[3] = "phar_battle_tutorial_units_mern_01",
	[4] = "phar_battle_tutorial_unit_selection_mern_01",
	[5] = "phar_battle_tutorial_unit_move_mern_01",
	[6] = "phar_battle_tutorial_attack_mern_01",
	[7] = "phar_battle_tutorial_reinforcements_mern_01",
	[8] = "phar_battle_tutorial_reinforcements_mern_01",
	[9] = "phar_battle_tutorial_weather_mern_01",
	[10] = "phar_battle_tutorial_flank_mern_01",
	[11] = "phar_battle_tutorial_morale_mern_01"
};
	
local fundamentals_intro_scene_advice_key = {
	[1] = "phar_battle_tutorial_intro_mern_01",
	[2] = "phar_battle_tutorial_intro_pract_02",
	[3] = "phar_battle_tutorial_intro_mern_03",
	[4] = "phar_battle_tutorial_intro_ram_04",
	[5] = "phar_battle_tutorial_intro_mern_07",	--phar_battle_tutorial_intro_mern_05
	[6] = "phar_battle_tutorial_intro_ram_08",	--phar_battle_tutorial_intro_ram_06
	[7] = "phar_battle_tutorial_intro_mern_09",
	[8] = "phar_battle_tutorial_intro_mern_10"
};

local fundamentals_mid_scene_advice_key = {
	[1] = "phar_battle_tutorial_midtro_mern_01",
	[2] = "phar_battle_tutorial_midtro_ram_02",
	[3] = "phar_battle_tutorial_midtro_mern_03",
	[4] = "phar_battle_tutorial_midtro_ram_04"
};

local fundamentals_end_scene_advice_key = {
	[1] = "phar_battle_tutorial_end_mern_01",
	[2] = "phar_battle_tutorial_outro_ram_01",
	[3] = "phar_battle_tutorial_outro_ram_02"
};

-------------------------------------------------
--- Fundamentals scripted timings
-------------------------------------------------
if not is_battle_ftue_bool then
	
	out("*** Removing all advice from Campaign triggered Battle Fundamentals Steps")
	for index, _ in ipairs(fundamentals_steps_advice_key) do
		fundamentals_steps_advice_key[index] = nil
	end;

	out("*** Removing all advice from Campaign triggered Battle Fundamentals Intro Scene")
	for index, _ in ipairs(fundamentals_intro_scene_advice_key) do
		fundamentals_intro_scene_advice_key[index] = nil
	end;

	out("*** Removing all advice from Campaign triggered Battle Fundamentals Mid Scene")
	for index, _ in ipairs(fundamentals_mid_scene_advice_key) do
		fundamentals_mid_scene_advice_key[index] = nil
	end;

	out("*** Removing all advice from Campaign triggered Battle Fundamentals End Scene")
	for index, _ in ipairs(fundamentals_end_scene_advice_key) do
		fundamentals_end_scene_advice_key[index] = nil
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
			bm:callback(
				function()
					highlight_all_visible_children(end_battle_uic, 5)
				end,
				3000
			)

			bm:queue_advisor(fundamentals_end_scene_advice_key[1]);
			bm:queue_advisor(fundamentals_end_scene_advice_key[2]);
			bm:queue_advisor(fundamentals_end_scene_advice_key[3]);
		end

	end,
	true
);

core:add_listener(
	"post_tutorial_battle_end_battle_selected",
	"PanelOpenedBattle",
	function(context) return context.string == "in_battle_results_popup" end,
	function(context) 
        unhighlight_all_visible_children()
    end,
    true
)

-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-- BATTLE FUNDAMENTALS
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

local function is_battle_type_suitable_for_battle_fundamentals_scripted_tour()
	return bm:battle_type() == "land_normal"
end;

do
	nt_battle_fundamentals = navigable_tour:new(
		"battle_fundamentals",														-- unique name
		function()																	-- end callback
		end,
		"ui_text_replacements_localised_text_phar_main_battle_scripted_tour_battle_fundamentals_name"
	);

	nt_battle_fundamentals:set_allow_camera_movement(true);
	nt_battle_fundamentals:set_start_first_section_automatically(false);			-- start actions comprise an intro cutscene that can be skipped, so they will start the first section manually

	-- validation rules for this navigable tour
	nt_battle_fundamentals:add_validation_rule(
		function()
			return core:is_battle()
		end,
		"random_localisation_strings_string_scripted_tour_invalid_not_battle"
	);

	nt_battle_fundamentals:add_validation_rule(
		function()
			return not bm:is_multiplayer()
		end,
		"random_localisation_strings_string_scripted_tour_invalid_not_singleplayer"
	);

	nt_battle_fundamentals:add_validation_rule(
		function()
			return is_battle_type_suitable_for_battle_fundamentals_scripted_tour();
		end,
		"random_localisation_strings_string_scripted_tour_invalid_not_normal_land_battle"
	);

	nt_battle_fundamentals:add_validation_rule(
		function()
			return nt_battle_fundamentals.bounding_box_to_use;
		end,
		"random_localisation_strings_string_scripted_tour_invalid_suitable_area_not_found"
	);

	nt_battle_fundamentals:add_validation_rule(
		function()
			local phase_name = bm:get_current_phase_name(); 
			return phase_name == "Deployment" or phase_name == "Deployed"
		end,
		"random_localisation_strings_string_scripted_tour_invalid_not_deployment_or_conflict_phase"
	);

	nt_battle_fundamentals:add_validation_rule(
		function()
			return nt_battle_fundamentals.min_player_units_threshold_reached;
		end,
		"random_localisation_strings_string_scripted_tour_invalid_insufficient_player_units"
	);

	nt_battle_fundamentals:add_validation_rule(
		function()
			return nt_battle_fundamentals.min_enemy_units_threshold_reached;
		end,
		"random_localisation_strings_string_scripted_tour_invalid_insufficient_enemy_units"
	);

	-- Work out what units we will use, and where we will use them, at the start of the battle if this battle is suitable
	if is_battle_type_suitable_for_battle_fundamentals_scripted_tour() and not bm:is_multiplayer() then

		core:svr_save_registry_bool("battle_tutorial_completed", true)

		-- Work out what player and enemy units we can/should use for the attacking step of this scripted tour. The script_units collections are saved on the scripted tour itself - the advice preconditions will check their size
		-- and if there aren't enough eligible units (e.g. the player has only a general + artillery in their army) then the advice will not play/the scripted tour will not be offered.
		local MIN_ELIGIBLE_PLAYER_UNITS = 2;
		local MIN_ELIGIBLE_ENEMY_UNITS = 2;

		local eligible_units_count_player = {
			general = 1,
			melee 	= 2,
			ranged  = 1,

		}
		-- Get a list of eligible player and enemy units to use in the tour
		local sunits_player_eligible = sunits_local_player:filter(
			"player_eligible",
			function(sunit)
				local unit = sunit.unit
				local unit_class = unit:unit_class();
--				if unit:is_commanding_unit() then 
--					return true
--				end

				if unit_class == "com" and eligible_units_count_player.general > 0 then
					eligible_units_count_player.general = eligible_units_count_player.general - 1
					return true
				else
					if unit:is_infantry() then 
						if unit:is_infantry_ranged() then
							if eligible_units_count_player.ranged > 0 then
								eligible_units_count_player.ranged = eligible_units_count_player.ranged - 1
								return true
							end
						else 
							if eligible_units_count_player.melee > 0 then 
								eligible_units_count_player.melee = eligible_units_count_player.melee - 1
								return true
							end
						end  
					end
				end
			end
		);

		local sunit_reinforcement_eligible

		for i = 1, sunits_local_player:count() do
			local unit = sunits_local_player:item(i).unit
			local unit_class = unit:unit_class()
			if unit_class ~= "com" then 
				if unit:is_chariot() then
					sunit_reinforcement_eligible = sunits_local_player:item(i)
					break
				elseif unit:is_infantry() and not unit:is_infantry_ranged() then 
					sunit_reinforcement_eligible = sunits_local_player:item(i)
				end
			end
		end

		local sunits_player_reinforcement = script_units:new("battle_fundamentals_reinforcements");

		if sunit_reinforcement_eligible then 
			sunits_player_reinforcement:add_sunits(sunit_reinforcement_eligible)
		end


		local eligible_units_count_enemy = {
			general = 1,
			melee 	= 3,

		}
		local sunits_enemy_eligible = sunits_enemy_main:filter(
			"enemy_eligible",
			function(sunit)
				local unit = sunit.unit
				local unit_class = unit:unit_class();
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
						end  
					end
				end
			end
		);

		-- Do we have enough eligible units
		local num_eligible_player_units = sunits_player_eligible:count();
		local num_eligible_enemy_units = sunits_enemy_eligible:count();

		nt_battle_fundamentals.min_player_units_threshold_reached = num_eligible_player_units >= MIN_ELIGIBLE_PLAYER_UNITS;
		nt_battle_fundamentals.min_enemy_units_threshold_reached = num_eligible_enemy_units >= MIN_ELIGIBLE_ENEMY_UNITS;

		if nt_battle_fundamentals.min_player_units_threshold_reached and nt_battle_fundamentals.min_enemy_units_threshold_reached then

			-- Determine how many player/enemy units to use
			local num_player_units_to_use, num_enemy_units_to_use;

			if num_eligible_player_units >= 4 then
				num_player_units_to_use = 4;
			else
				num_player_units_to_use = num_eligible_player_units;
			end;

			if num_eligible_enemy_units >=4 then
				num_enemy_units_to_use = 4;
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
			local sunits_player_to_use = script_units:new("battle_fundamentals_player");
			for i = 1, num_player_units_to_use do
				sunits_player_to_use:add_sunits(sunits_player_eligible:item(i));
			end;

			

			local sunits_enemy_to_use = script_units:new("battle_fundamentals_enemy");
			for i = 1, num_enemy_units_to_use do
				sunits_enemy_to_use:add_sunits(sunits_enemy_eligible:item(i));
			end;

			-- By this point we should have player and enemy sunit collections to use in the scripted tour - save these to the tour object
			nt_battle_fundamentals.sunits_player = sunits_player_to_use;
			nt_battle_fundamentals.sunits_player_reinforcement = sunits_player_reinforcement;
			nt_battle_fundamentals.sunits_enemy = sunits_enemy_to_use;

			out.scripted_tours("");
			out.scripted_tours("Battle Fundamentals scripted tour is working out what units/battlefield area to use");
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
			local sunits_player_unused = script_units:new("battle_fundamentals_player_unused");
			for i = 1, sunits_local_player:count() do
				local current_sunit = sunits_local_player:item(i);
				if not sunits_player_to_use:contains(current_sunit) and	not sunits_player_reinforcement:contains(current_sunit) then
					sunits_player_unused:add_sunits(current_sunit);
				end;
			end;

			local sunits_enemy_unused = script_units:new("battle_fundamentals_enemy_unused");
			for i = 1, sunits_enemy_main:count() do
				local current_sunit = sunits_enemy_main:item(i);
				if not sunits_enemy_to_use:contains(current_sunit) then
					sunits_enemy_unused:add_sunits(current_sunit);
				end;
			end;

			nt_battle_fundamentals.sunits_player_unused = sunits_player_unused;
			nt_battle_fundamentals.sunits_enemy_unused = sunits_enemy_unused;

			-- Work out the area we would want to use for this scripted tour

			local player_sunits_width = sunits_player_to_use:width();
			local enemy_sunits_width = sunits_enemy_to_use:width();

			-- Compute a width/depth
			local combat_area_width = player_sunits_width > enemy_sunits_width and player_sunits_width or enemy_sunits_width;
			local combat_area_depth = 220;


			
			local function get_suitability_score_for_bounding_box(pos, bearing_deg, width, depth)
				local score;
				local area_clear = bm:is_area_clear(pos, bearing_deg, width, depth);
				if area_clear then
					score = 100 - ground_type_proportion_in_bounding_box(pos, d_to_r(bearing_deg), width + 140, depth, "forest", 8, 8);
				else
					score = 0;
				end;

				out.scripted_tours("suitability score for obb at " .. v_to_s(pos) .. " with bearing " .. bearing_deg .. " (deg), width " .. width .. " and depth " .. depth .. " is [" .. score .. (area_clear and "]" or "] - area is not clear of terrain obstructions"))

				return score;
			end;


			
			local sunit_player_general_pos = sunit_local_player_general.unit:position();
			local sunit_player_general_bearing_deg = sunit_local_player_general.unit:ordered_bearing();
			local sunit_player_general_bearing_rad = d_to_r(sunit_player_general_bearing_deg);

			local bounding_box_to_use;

			local highest_score = 0;
			local highest_score_position;
			local highest_score_bearing_deg = 0;

			-- If the box projected forward from the player general is suitable then just proceed with that
			do
				local centre_pos = v_offset_by_bearing(sunit_player_general_pos, sunit_player_general_bearing_rad, combat_area_depth / 2);
				local score = get_suitability_score_for_bounding_box(centre_pos, sunit_player_general_bearing_deg, combat_area_width, combat_area_depth);
				if score > 90 then
					bounding_box_to_use = {
						pos = centre_pos,
						bearing = sunit_player_general_bearing_deg,
						width = combat_area_width,
						depth = combat_area_depth
					};

					out.dec_tab("scripted_tours");
					out.scripted_tours("Chosen this straight-ahead-from-player-start bounding box position as the tour combat area");
				else
					highest_score = score;
					highest_score_position = centre_pos;
					highest_score_bearing = sunit_player_general_bearing_deg;
				end;
			end;

			if not bounding_box_to_use then
				-- The straight-ahead-from-general position wasn't that good, so assemble a series of positions running left-to-right from the player general's perspective.
				local positions_to_test_from = {};

				local perpedicular_bearing_rad = sunit_player_general_bearing_rad + (math.pi / 2);
				for i = -300, 300, 100 do
					if i ~= 0 then
						table.insert(positions_to_test_from, v_offset_by_bearing(sunit_player_general_pos, perpedicular_bearing_rad, i));
					end;
				end;
				
				-- Test each of the 4 cardinal directions from the player general's facing, for each position to test from
				for i = 0, 3 do
					local bearing_to_test_deg = sunit_player_general_bearing_deg + (i * 90);
					local bearing_to_test_rad = d_to_r(bearing_to_test_deg);

					for j = 1, #positions_to_test_from do
						local current_pos = positions_to_test_from[j];

						-- Compute a centre position projected forward from the current position, based on the bearing we're currently testing
						local centre_position = v_offset_by_bearing(current_pos, bearing_to_test_rad, combat_area_depth / 2);
						local score = get_suitability_score_for_bounding_box(centre_position, bearing_to_test_deg, combat_area_width, combat_area_depth);

						if score > highest_score then
							highest_score = score;
							highest_score_position = centre_position;
							highest_score_bearing_deg = bearing_to_test_deg;
						end;
					end;

					-- At the end of each pass, see if we've found something really good
					if highest_score > 90 then
						bounding_box_to_use = {
							pos = highest_score_position,
							bearing = highest_score_bearing_deg,
							width = combat_area_width,
							depth = combat_area_depth
						};
						out.dec_tab("scripted_tours");
						out.scripted_tours("Chosen bounding box at " .. v_to_s(highest_score_position) .. " with bearing " .. highest_score_bearing_deg .. " as the tour combat area");
						break;
					else

						-- At the end of the first pass, re-insert the player general position in the list (otherwise we'd test the straight-ahead obb twice)
						if i == 0 then
							table.insert(positions_to_test_from, sunit_player_general_pos);
						end;
					end;
				end;

				if not bounding_box_to_use then
					out.dec_tab("scripted_tours");

					local low_threshold = 50;

					-- We haven't found a good area to use, so see if the best area that we did find is "okay"
					if highest_score > low_threshold then
						bounding_box_to_use = {
							pos = highest_score_position,
							bearing = highest_score_bearing_deg,
							width = combat_area_width,
							depth = combat_area_depth
						};
						out.scripted_tours("Chosen bounding box at " .. v_to_s(highest_score_position) .. " with bearing " .. highest_score_bearing_deg .. " as the tour combat area");
					else
						out.scripted_tours("Not choosing any bounding box as none reach low threshold value [" .. low_threshold .. "] - tour will not be accessible");
					end;
				end;
			end;

			nt_battle_fundamentals.bounding_box_to_use = bounding_box_to_use;
		end;
	end;


	local function reposition_sunits_for_tour(bounding_box, sunits, is_enemy)
		local uc = sunits:get_unitcontroller();

		if is_enemy then
			uc:teleport_to_location(v_offset_by_bearing(bounding_box.pos, d_to_r(bounding_box.bearing), bounding_box.depth / 2), bounding_box.bearing + 180, bounding_box.width);
		else
			uc:teleport_to_location(v_offset_by_bearing(bounding_box.pos, d_to_r(bounding_box.bearing), 0 - bounding_box.depth / 2), bounding_box.bearing, bounding_box.width);
		end;
	end;

	local function reposition_reinforcements_sunits_for_tour(bounding_box, sunits)
		for i = 1, sunits:count() do
			local sunit = sunits:item(i);
			sunit.unit:respawn(v_offset_by_bearing(bounding_box.pos, d_to_r(bounding_box.bearing), bounding_box.depth * 1.5 ), bounding_box.bearing + 180, bounding_box.width);
			sunit.unit:heal_hitpoints_unary(1, true)
		end;
	end;

	-------------------------------------------------
	--- Section 01 : Intro
	-------------------------------------------------

	-- Returns true if a tooltip over any unit is visible
	local function is_unit_tooltip_visible()
		local uic_tooltip = find_uicomponent(ui_root, "SpecialTooltip");
		return uic_tooltip and uic_tooltip:Visible(true);
	end;

	local tooltip_visible_timestamp = false;
	local allow_tooltip_objective_completion = false;
	
	local nts_intro = st_helper.navigable_tour_section_battle_factory(
		"intro",											-- section name
		nil,												-- camera positions generator
		fundamentals_steps_advice_key[1],					-- advice key
		{
			"phar_main_st_battle_fundamentals_0010",
			"phar_main_st_battle_fundamentals_0011",
			"phar_main_st_battle_fundamentals_0012"
		},													-- infotext
		nil												-- advice/infotext delay
														-- leave objective after completion
	);

	nts_intro:action(
		function()
			out("*** Setting the withdraw button to be disabled ***")
			core:get_ui_root():SequentialFind("button_withdraw"):SetDisabled(true)

			allow_tooltip_objective_completion = false;
			nt_battle_fundamentals:set_allow_camera_movement(false);
			core:restore_advisor_priority()

			core:cache_and_set_integer_preference("ui_selection_markers", 1);

			-- disable weather change ping.
			local ping_uic = core:get_ui_root():SequentialFind("ping_parent")
			ping_uic:PropagateVisibility(false)

			nts_intro:add_skip_action(
				function()
					nt_battle_fundamentals:set_allow_camera_movement(true);
				end
			);
		end,
		0
	);

	nts_intro:action(
		function() 
			nts_intro:highlight_next_button()
		end,
		3000
	)


	nts_intro:action(
		function()
			allow_tooltip_objective_completion = true;

		end,
		5000
	);








	-------------------------------------------------
	--- Section 02 : Camera Movement
	-------------------------------------------------

	local function display_battle_controls_cheat_sheet()
		core:call_once(
			"show_battle_controls_cheat_sheet",
			function()
				show_battle_controls_cheat_sheet()
				local panel, was_created_now = core:get_or_create_component("cheat_sheet_panel", "ui/common ui/cheat_sheet", core:get_ui_root())
				local x,y = panel:Position()
				y = y + 200
				panel:MoveTo(x, y)
			end
		)
	end

	infotext:set_state_override("phar_main_st_battle_fundamentals_0021", "battle_controls_camera");
	infotext:set_state_override("phar_main_st_battle_fundamentals_0022", "battle_controls_camera_facing");
	infotext:set_state_override("phar_main_st_battle_fundamentals_0023", "battle_controls_camera_altitude");
	infotext:set_state_override("phar_main_st_battle_fundamentals_0024", "battle_controls_camera_speed");

	local nts_camera_movement_tracker_started = false;
	
	local nts_camera_movement = st_helper.navigable_tour_section_battle_factory(
		"camera_movement",									-- section name
		function() 
			-- get_offset_camera_positions_from_sunits() returns three camera co-ordinates but we only want to return two, so there's no camera animation
			local cam_pos, cam_targ = st_helper.get_offset_camera_positions_from_sunits(
				nt_battle_fundamentals.sunits_player, 			-- sunits
				0, 												-- x_offset
				-65,											-- z_offset
				nil,											-- h_bearing
				nil,											-- v_bearing
				nil,											-- h_bearing_delta
				true											-- relaxed pose
			);
			return cam_pos, cam_targ;
		end,												-- camera positions generator
		fundamentals_steps_advice_key[2],				-- advice key
		{
			"phar_main_st_battle_fundamentals_0020",
			"phar_main_st_battle_fundamentals_0021",
			"phar_main_st_battle_fundamentals_0022",
			"phar_main_st_battle_fundamentals_0023",
			"phar_main_st_battle_fundamentals_0024"
		},													-- infotext
		nil,												-- advice/infotext delay
		"phar_main_st_battle_fundamentals_move_camera",		-- objective
		function()											-- objective test
			if nts_camera_movement_tracker_started then
				local cam_distance_travelled = bm:get_camera_distance_travelled();
				return cam_distance_travelled > 200 or (cam_distance_travelled > 100 and bm:get_camera_altitude_change() > 10);
			end;
		end,
		true
	);

	nts_camera_movement:action(
		function()
			nts_camera_movement_tracker_started = false;

			bm:show_army_panel(false);
			core:restore_boolean_preference("ui_mouse_scroll");

			nts_camera_movement:add_skip_action(
				function()
					display_battle_controls_cheat_sheet()
				end
			);

		end,
		0
	);

	nts_camera_movement:action(
		function()
			-- Track camera movement, for objective test
			bm:start_camera_movement_tracker();

			nts_camera_movement_tracker_started = true;

			display_battle_controls_cheat_sheet()

			nts_camera_movement:add_skip_action(
				function()
					bm:stop_camera_movement_tracker();
				end
			);
		end,
		2000 + nts_camera_movement.camera_scroll_time_s * 1000
	);






	-------------------------------------------------
	--- Section 03 : General Selection
	-------------------------------------------------

	infotext:set_state_override("phar_main_st_battle_fundamentals_0032", "battle_controls_selection");

	local selection_completed = false
	local general_pos

	local nts_unit_selection = st_helper.navigable_tour_section_battle_factory(
		"unit_selection",									-- section name
		function()
			-- sunits, x_offset, z_offset, horizontal_bearing, vertical_bearing, horizontal_bearing_delta, relaxed pose
			return st_helper.get_offset_camera_positions_from_sunits(
				nt_battle_fundamentals.sunits_player,
				0,
				-75,
				nil,
				nil,
				nil,
				true
			);
		end,												-- camera positions generator
		fundamentals_steps_advice_key[3],				-- advice key
		{
			"phar_main_st_battle_fundamentals_0030",
			"phar_main_st_battle_fundamentals_0031",
			"phar_main_st_battle_fundamentals_0032",
			"phar_main_st_battle_fundamentals_0033",
			"phar_main_st_battle_fundamentals_0034",
			"phar_main_st_battle_fundamentals_0035",
			"phar_main_st_battle_fundamentals_0036",
		},													-- infotext
		nil,												-- advice/infotext delay
		"phar_main_st_battle_fundamentals_select_general",		-- objective
		function()											-- objective test
			return selection_completed;
		end,
		true
	);

	nts_unit_selection:action(
		function()

			local uc = nt_battle_fundamentals.sunits_player:get_unitcontroller()
			uc:halt()
			buim:deselect_all()

			sunit_local_player_general:add_ping_icon()

			general_pos = sunit_local_player_general.unit:position()


			bm:add_ping_icon(general_pos:get_x(), general_pos:get_y(), general_pos:get_z(), 13)
			highlight_component(true, true, "cards_panel", "review_DY", "1001")

			nts_unit_selection:add_skip_action(
				function()
					sunit_local_player_general:remove_ping_icon()
					bm:remove_ping_icon(general_pos:get_x(), general_pos:get_y(), general_pos:get_z())
					highlight_component(false, true, "cards_panel", "review_DY", "1001")
				end,
				"remove_general_ping"
			)
		end,
		0
	);

	nts_unit_selection:action(
		function()
			bm:show_army_panel(true);

			sunit_local_player_general:highlight_unit_card(true)

			bm:register_unit_selection_callback(
				sunit_local_player_general.unit, 
				function(unit, is_selected)
					sunit_local_player_general:highlight_unit_card(false)
					selection_completed = true
					nts_unit_selection:highlight_next_button()
					sunit_local_player_general:remove_ping_icon()
					bm:remove_ping_icon(general_pos:get_x(), general_pos:get_y(), general_pos:get_z())
					highlight_component(false, true, "cards_panel", "review_DY", "1001")
				end
			)

			nt_battle_fundamentals.sunits_player:release_control();

			nts_unit_selection:add_skip_action(
				function()
					sunit_local_player_general:highlight_unit_card(false)
				end,
				"skip_general_selection"
			)
		end,
		1000
	);




	local function set_sunits_ping_icons(sunits, add)
		for i = 1, sunits:count() do
			if add then 
				local sunit = sunits:item(i)
				sunit:add_ping_icon()
			else
				local sunit = sunits:item(i)
				sunit:remove_ping_icon()
			end
		end
	end

	-------------------------------------------------
	--- Section 04 : Multiple Selection
	-------------------------------------------------

	local function display_single_selection_cheat_sheet()
		core:call_once(
			"append_single_selection_controls_to_cheat_sheet",
			function()
				append_selection_controls_to_cheat_sheet()
			end
		)
	end

	local function get_unit_card_components()
		local uic_table = {} 
		local unit_panel_uic = core:get_ui_root():SequentialFind("cards_panel", "review_DY") 
		
		for i = 0, unit_panel_uic:ChildCount() - 1 do
			local uic = UIComponent(unit_panel_uic:Find(i))
			table.insert(uic_table, uic)
		end

		return uic_table
	end

	infotext:set_state_override("phar_main_st_battle_fundamentals_0041", "battle_controls_multiple_selection");
	
	local nts_multiple_selection = st_helper.navigable_tour_section_battle_factory(
		"multiple_selection",								-- section name
		nil,												-- camera positions generator
		fundamentals_steps_advice_key[4],		-- advice key
		{
			"phar_main_st_battle_fundamentals_0040",
			"phar_main_st_battle_fundamentals_0041",
			"phar_main_st_battle_fundamentals_0042",
			"phar_main_st_battle_fundamentals_0043"
		},													-- infotext
		nil,												-- advice/infotext delay
		"phar_main_st_battle_fundamentals_select_multiple_units",				-- objective
		function()											-- objective test
			local num_units_selected = bm:num_units_selected();
			if num_units_selected > 1 or (num_units_selected == 1 and player_army_has_one_unit) then
				set_sunits_ping_icons(nt_battle_fundamentals.sunits_player, false)
				unhighlight_component_table(1, unpack(get_unit_card_components()))
				return true
			end
		end,
		true
	);

	nts_multiple_selection:action(
		function()
			buim:deselect_all()
			local sunits_player = nt_battle_fundamentals.sunits_player
			set_sunits_ping_icons(sunits_player, true)
			highlight_component_table(1, unpack(get_unit_card_components()))
			
			nts_multiple_selection:add_skip_action(
		 		function()
					set_sunits_ping_icons(sunits_player, false)
					unhighlight_component_table(1, unpack(get_unit_card_components()))
		 		end,
		 		"remove_ping"
		 	)
		end,
		0
	);

	nts_multiple_selection:action(
		function()
			display_single_selection_cheat_sheet()
		end,
		1000
	);

	nts_multiple_selection:action(
		function()
			nts_multiple_selection:highlight_next_button()
		end,
		8000
	);



	

	-------------------------------------------------
	--- Section 05 : Multiple Unit Movement
	-------------------------------------------------

	local function display_single_movement_cheat_sheet()
		core:call_once(
			"append_single_movement_controls_to_cheat_sheet",
			function()
				append_single_movement_controls_to_cheat_sheet()
			end
		)
	end

	local function display_controls_movement_cheat_sheet()
		core:call_once(
			"append_movement_controls_to_cheat_sheet",
			function()
				append_movement_controls_to_cheat_sheet()
			end
		)
	end



	infotext:set_state_override("phar_main_st_battle_fundamentals_0051", "battle_controls_unit_movement");
	infotext:set_state_override("phar_main_st_battle_fundamentals_0052", "battle_controls_unit_destinations");
	infotext:set_state_override("phar_main_st_battle_fundamentals_0053", "battle_controls_halt");
	infotext:set_state_override("phar_main_st_battle_fundamentals_0054", "battle_controls_drag_out_formation");
	
	local nts_multiple_movement = st_helper.navigable_tour_section_battle_factory(
		"multiple_movement",								-- section name
		nil,												-- camera positions generator
		fundamentals_steps_advice_key[5],			-- advice key
		{
			"phar_main_st_battle_fundamentals_0050",
			"phar_main_st_battle_fundamentals_0051",
			"phar_main_st_battle_fundamentals_0052",
			"phar_main_st_battle_fundamentals_0053",

			"phar_main_st_battle_fundamentals_0054",
			"phar_main_st_battle_fundamentals_0055",
			"phar_main_st_battle_fundamentals_0056"
		},													-- infotext
		nil,												-- advice/infotext delay
		"phar_main_st_battle_fundamentals_move_multiple_units",				-- objective
		function()											-- objective test
			local num_moved = nt_battle_fundamentals.sunits_player:num_moved(nil, 5);
			return num_moved > 1 or (player_army_has_one_unit and num_moved == 1);
		end,
		true
	);

	local pos_proxy_centre, pos_proxy_left, pos_proxy_right;
	local cam_pos_nts_multiple_movement, cam_targ_nts_multiple_movement;
	local proxy_id;

	local function setup_movement_proxies()
		local bounding_box = nt_battle_fundamentals.bounding_box_to_use;
		local bounding_box_bearing_r = d_to_r(bounding_box.bearing);
		local bounding_box_half_width = bounding_box.width / 2;
		
		local bounding_box_left = v_offset_by_bearing(bounding_box.pos, bounding_box_bearing_r - math.pi / 2, bounding_box_half_width);
		local bounding_box_right = v_offset_by_bearing(bounding_box.pos, bounding_box_bearing_r + math.pi / 2, bounding_box_half_width);
		
		local sunits_player = nt_battle_fundamentals.sunits_player;
		local most_forward_sunit, most_forward_sunit_distance = nil, -999999;

		for i = 1, sunits_player:count() do
			local current_sunit = sunits_player:item(i);
			local current_distance = distance_to_line(bounding_box_right, bounding_box_left, current_sunit.unit:position());
			
			if current_distance > most_forward_sunit_distance then
				most_forward_sunit_distance = current_distance;
				most_forward_sunit = current_sunit;
			end;
		end;

		local distance_of_units_to_proxy = most_forward_sunit_distance + 60;

		pos_proxy_centre = v_offset_by_bearing(bounding_box.pos, bounding_box_bearing_r, distance_of_units_to_proxy);
		pos_proxy_left = v_to_ground(v_offset_by_bearing(pos_proxy_centre, bounding_box_bearing_r - math.pi / 2, bounding_box_half_width), 1);
		pos_proxy_right = v_to_ground(v_offset_by_bearing(pos_proxy_centre, bounding_box_bearing_r + math.pi / 2, bounding_box_half_width), 1);
	end;


	local function show_movement_proxies()
		if not proxy_id then
			proxy_id = nt_battle_fundamentals.sunits_player:get_unitcontroller():add_animated_selection_proxy(pos_proxy_left, pos_proxy_right, 1, 3, true);
		end;
	end;


	local function remove_movement_proxies()
		if proxy_id then
			nt_battle_fundamentals.sunits_player:get_unitcontroller():remove_animated_selection_proxy(proxy_id);
			proxy_id = nil;
		end;
	end;


	local function restore_camera(period)
		if nts_multiple_movement.cached_cam_pos and nts_multiple_movement.cached_cam_targ then
			cam:move_to(nts_multiple_movement.cached_cam_pos, nts_multiple_movement.cached_cam_targ, period, false, 0);
		end;
	end;

	nts_multiple_movement:action(
		function()
			-- Re-enable orders
			bm:disable_orders(false);

			-- Cache location for objective completion
			nt_battle_fundamentals.sunits_player:cache_location();
		end,
		0
	);

	nts_multiple_movement:action(
		function()
			display_single_movement_cheat_sheet()
			display_controls_movement_cheat_sheet()

		end,
		1000
	);

	nts_multiple_movement:action(
		function()

			-- compute the positions of the movement proxy
			setup_movement_proxies();

			-- compute camera position offset from the movement proxy
			local cam_pos = st_helper.get_offset_camera_positions_by_bearing(pos_proxy_centre, 100, d_to_r(nt_battle_fundamentals.bounding_box_to_use.bearing) + math.pi, nil, 0);

			-- cache the current camera position
			nts_multiple_movement.cached_cam_pos = cam:position();
			nts_multiple_movement.cached_cam_targ = cam:target();

			-- disable player camera movement
			bm:enable_camera_movement(false);
			-- bm:enable_cinematic_ui(true, false, false);

			-- move the camera to the computed position
			cam:move_to(cam_pos, pos_proxy_centre, 1.5, false, 0);

			-- Cache locations for objective completion
			nt_battle_fundamentals.sunits_player:cache_location();

			nts_multiple_movement:add_skip_action(
				function()
					bm:enable_camera_movement(true);
				end,
				"disable_camera_movement"
			);

			nts_multiple_movement:add_skip_action(
				function()
					restore_camera(0);
				end,
				"restore_camera"
			);
		end,
		0
	);

	-- Show unit proxies
	nts_multiple_movement:action(
		function()
			local sunits_player = nt_battle_fundamentals.sunits_player;

			show_movement_proxies();

			for i = 1, sunits_player:count() do
				local current_sunit = sunits_player:item(i);
				bm:register_unit_selection_callback(
					sunits_player:item(i).unit,
					function()
						remove_movement_proxies();
					end
				);
			end;

			nts_multiple_movement:add_skip_action(
				function()
					remove_movement_proxies();
				end
			);
		end,
		1500
	);

	--Restore camera
	nts_multiple_movement:action(
		function()
			restore_camera(1.5);
		end,
		3500
	);

	-- Re-enable camera movement
	nts_multiple_movement:action(
		function()
			bm:enable_camera_movement(true);
			nts_multiple_movement:remove_skip_action("disable_camera_movement");
			nts_multiple_movement:remove_skip_action("restore_camera");
		end,
		5000
	);


	-------------------------------------------------
	--- Section 06 : Attacking
	-------------------------------------------------
	infotext:set_state_override("phar_main_st_battle_fundamentals_0061", "battle_controls_attacking");
	
	local nts_attacking;
	nts_attacking = st_helper.navigable_tour_section_battle_factory(
		"attacking",										-- section name
		nil,												-- camera positions generator
		fundamentals_steps_advice_key[6],				-- advice key
		{
			"phar_main_st_battle_fundamentals_0060",
			"phar_main_st_battle_fundamentals_0061",
			"phar_main_st_battle_fundamentals_0062",
			"phar_main_st_battle_fundamentals_0063"
		},													-- infotext
		"ScriptEventTriggerFundamentalsTourAttackingText",	-- advice/infotext delay - event to trigger infotext/objective on
		"phar_main_st_battle_fundamentals_attack_units",		-- objective
		function()											-- objective completion test
			if nt_battle_fundamentals.sunits_enemy:is_under_attack() then
				-- This callback will be cancelled if the section is skipped before it fires
				return true;
			end;
		end,
		true												-- leave objective after completion
	);




	local function reset_armies_for_start_of_attacking_section()
		nt_battle_fundamentals.sunits_enemy:set_enabled(true);

		-- We respawn the units and then reposition them immediately
		nt_battle_fundamentals.sunits_player:respawn_in_start_location();
		nt_battle_fundamentals.sunits_enemy:respawn_in_start_location();

		nt_battle_fundamentals.sunits_player:set_always_visible(true);
		nt_battle_fundamentals.sunits_enemy:set_always_visible(true);

		reposition_sunits_for_tour(nt_battle_fundamentals.bounding_box_to_use, nt_battle_fundamentals.sunits_player, false);
		reposition_sunits_for_tour(nt_battle_fundamentals.bounding_box_to_use, nt_battle_fundamentals.sunits_enemy, true);	
		
	end;

	local function start_enemy_army_attack()
		local sunits_enemy = nt_battle_fundamentals.sunits_enemy;
		sunits_enemy:release_control();

		if not sai_enemy then
			sai_enemy = script_ai_planner:new("enemy_army", sunits_enemy);

			sai_enemy:attack_force(nt_battle_fundamentals.sunits_player);
			-- sai_enemy:defend_position(nt_battle_fundamentals.bounding_box_to_use.pos, 3 * nt_battle_fundamentals.bounding_box_to_use.depth / 2);
		end;
	end;

	local function release_enemy_from_planner()
		if is_scriptaiplanner(sai_enemy) and sai_enemy:count() > 0 then
			sai_enemy:release();
		end;
	end;

	local function compute_final_camera_position_for_attacking_section()
		-- sunits, x_offset, z_offset, horizontal_bearing override, vertical_bearing, horizontal_bearing_delta, relaxed pose
		nts_attacking.final_cam_target, nts_attacking.final_cam_position = st_helper.get_offset_camera_positions_from_sunits(
			nt_battle_fundamentals.sunits_player,
			0,
			-75,
			nil,
			nil,
			nil,
			true
		);
	end;

	-- actions
	nts_attacking:action(
		function()
			-- Fade camera to black and enable cinematic ui
			cam:fade(true, 0.5);
			bm:enable_cinematic_ui(true, false, false);

			nts_attacking:add_skip_action(
				function()
					bm:enable_cinematic_ui(false, true, false);
				end,
				"disable_cinematic_ui"
			);

			nts_attacking:add_skip_action(
				function(tour_ending, skipping_backwards)

					if skipping_backwards then 
						st_helper.stop_automatic_nts_advancement_monitor()
					end

					if not tour_ending and not skipping_backwards then
						-- We're skipping forwards before the attacking army has been established, so quickly establish it (and reset the player)

						-- Fade camera to black immediately
						cam:fade(true, 0);

						-- Reposition armies
						bm:callback(
							function()
								reset_armies_for_start_of_attacking_section();
							end,
							200
						);

						-- Compute and reposition final camera position
						bm:callback(
							function()
								compute_final_camera_position_for_attacking_section();

								cam:move_to(nts_attacking.final_cam_position, nts_attacking.final_cam_target, 0);
								cam:fade(false, 0.5);

								start_enemy_army_attack();
								nt_battle_fundamentals.sunits_player:release_control();
							end,
							500
						);
					end;
				end,
				"establish_attacking_army"
			);
		end,
		0
	);

	nts_attacking:action(
		function()
			-- show the cinematic bars now the screen is blacked-out
			bm:enable_cinematic_ui(false, false, false);
			bm:enable_cinematic_ui(true, false, true);

			reset_armies_for_start_of_attacking_section();

			nts_attacking:add_skip_action(
				function(tour_ending, skipping_backwards)
					if not tour_ending then
						if skipping_backwards then
							-- We're skipping backwards, so disable the enemy army
							nt_battle_fundamentals.sunits_enemy:set_enabled(false);
							st_helper.stop_automatic_nts_advancement_monitor()
						end;
					end;
				end
			);
		end,
		700
	);

	nts_attacking:action(
		function()
			-- Move enemy forward
			nt_battle_fundamentals.sunits_enemy:goto_location_offset(0, 60, false);
		end,
		1000
	);

	nts_attacking:action(
		function()
			-- Compute camera positions for the enemy units walking on

			-- sunits, x_offset, z_offset, horizontal_bearing override, vertical_bearing, horizontal_bearing_delta, relaxed pose
			local cam_target, cam_position_1 = st_helper.get_offset_camera_positions_from_sunits(
				nt_battle_fundamentals.sunits_enemy,
				-50 - (nt_battle_fundamentals.sunits_enemy:width() / 2),
				60,
				nil,
				0.2,
				0
			);

			local cam_position_2 = st_helper.get_second_offset_camera_position(cam_target, cam_position_1);

			-- Also compute final camera positions for the tour section at this time and store them for later
			compute_final_camera_position_for_attacking_section();

			local cutscene_enemy_attack = cutscene:new(
				"enemy_attack",
				nt_battle_fundamentals.sunits_player,
				8000,
				function()
					bm:enable_cinematic_ui(false, true, false);
					bm:hide_subtitles();

					bm:cancel_progress_on_sound_effect_finished("battle_fundamentals_attack");

					nt_battle_fundamentals.sunits_player:release_control();
					start_enemy_army_attack();

					nts_attacking:remove_skip_action("disable_cinematic_ui");
					nts_attacking:remove_skip_action("establish_attacking_army");

					core:trigger_event("ScriptEventTriggerFundamentalsTourAttackingText");

					-- Move camera to final position behind player army
					cam:move_to(nts_attacking.final_cam_position, nts_attacking.final_cam_target, 3, false, 0);
				end
			);

			cutscene_enemy_attack:set_should_enable_cinematic_camera(false);
			cutscene_enemy_attack:set_wait_for_advisor_on_end(true);

			cutscene_enemy_attack:action(
				function()
					-- Move camera to show enemy units walking on, and begin fade to picture
					cam:move_to(cam_position_1, cam_target, 0, false, 40);
					if cam_position_2 then
						cam:move_to(cam_position_2, cam_target, 30, true, 40);
					end;

					cam:fade(false, 0.5);
				end,
				0
			);

			cutscene_enemy_attack:action(
				function()
					-- The enemy advance! Ready your forces for battle!
					bm:show_subtitle("phar_main_st_battle_fundamentals_mid_0001", false, true);
				end,
				0
			);

			if is_battle_ftue_bool then
				cutscene_enemy_attack:action(
					function()
						bm:queue_advisor(fundamentals_mid_scene_advice_key[1])
					end,
					500
				);
				
				cutscene_enemy_attack:action(
					function()
						cutscene_enemy_attack:wait_for_advisor()
					end,
					1500
				);

				cutscene_enemy_attack:action(
					function()
						bm:queue_advisor(fundamentals_mid_scene_advice_key[2])
					end,
					2000
				);

				cutscene_enemy_attack:action(
					function()
						cutscene_enemy_attack:wait_for_advisor()
					end,
					3500
				);

				cutscene_enemy_attack:action(
					function()
						bm:queue_advisor(fundamentals_mid_scene_advice_key[3])

						local cam_target_2, cam_position_3 = st_helper.get_offset_camera_positions_from_sunits(
							nt_battle_fundamentals.sunits_enemy,
							10 - (nt_battle_fundamentals.sunits_enemy:width() / 2),
							40,
							nil,
							0.2,
							0
						);

						local cam_target_2, cam_position_4 = st_helper.get_offset_camera_positions_from_sunits(
							nt_battle_fundamentals.sunits_enemy,
							10 - (nt_battle_fundamentals.sunits_enemy:width() / 2),
							60,
							nil,
							0.2,
							0
						);

						cam:move_to(cam_position_3, cam_target_2, 0, true, 40);
						cam:move_to(cam_position_4, cam_target_2, 30, true, 40);
					end,
					4000
				);

				cutscene_enemy_attack:action(
					function()
						cutscene_enemy_attack:wait_for_advisor()
					end,
					5500
				);

				cutscene_enemy_attack:action(
					function()
						bm:queue_advisor(fundamentals_mid_scene_advice_key[4])
					end,
					6000
				);

				cutscene_enemy_attack:action(
					function()
						cutscene_enemy_attack:wait_for_advisor()
					end,
					7500
				);
			end;

			cutscene_enemy_attack:start();

		end,
		2000
	);

	nts_attacking:action(
		function()
			if st_helper.automatic_nts_advancement_monitor(nt_battle_fundamentals, health_percentage_treshold, monitor_timer_delay) then 
				nts_attacking:add_skip_action(
					st_helper.stop_automatic_nts_advancement_monitor()
					"Attacking monitor removal"
				);
			end
		end,
		0
	)

	-------------------------------------------------
	--- Section 07 : Minimap Legend
	-------------------------------------------------
	
	local nts_map_legend = st_helper.navigable_tour_section_battle_factory(
		"map_legend",											-- section name
		nil,												-- camera positions generator
		nil,				-- advice key
		{
			"phar_main_st_battle_fundamentals_0165",
			"map_controls_legend"
		}													-- infotext
	);

	nts_map_legend:action(
		function()
			bm:disable_cycle_battle_speed(false);
			bm:show_radar_frame(true, true)
			nts_map_legend:add_skip_action(
				function(tour_ending, skipping_backwards)
					bm:show_radar_frame(true, true)
					if skipping_backwards then 
						st_helper.stop_automatic_nts_advancement_monitor()
					end
				end, 
				"skip flanking")
		end,
		0
	)

	nts_map_legend:action(
		function()
			-- If no combatants are currently routing then start a monitor for any of them routing, and advance
			if st_helper.automatic_nts_advancement_monitor(nt_battle_fundamentals, health_percentage_treshold, monitor_timer_delay) then 
				nts_map_legend:add_skip_action(st_helper.stop_automatic_nts_advancement_monitor());
			end
		end,
		500
	);
	
	nts_map_legend:action(
		function()
			nts_map_legend:highlight_next_button()
		end,
		8000
	)

	-------------------------------------------------
	--- Section 08 : Reinforcements
	-------------------------------------------------

	infotext:set_state_override("phar_main_st_battle_fundamentals_0071", "battle_controls_reinforcements");
	
	local nts_reinforcements;
	nts_reinforcements = st_helper.navigable_tour_section_battle_factory(
		"Reinforcements",												-- section name
		nil,															-- camera positions generator
		fundamentals_steps_advice_key[8],					-- advice key
		{
			"phar_main_st_battle_fundamentals_0070",
			"phar_main_st_battle_fundamentals_0071"
		},													    		-- infotext
		"ScriptEventTriggerFundamentalsTourReinforcementText",			-- advice/infotext delay - event to trigger infotext/objective on
		"phar_main_st_battle_fundamentals_reinforcements_units",		-- objective
		function()														-- objective completion test
			if nt_battle_fundamentals.sunits_player_reinforcement:have_any_moved() then 
				return true;
			end
		end,
		true															-- leave objective after completion
	);

	local function reset_armies_for_start_of_reinforcement_section()
		nt_battle_fundamentals.sunits_enemy:set_enabled(true);

		-- We respawn the units and then reposition them immediately
		nt_battle_fundamentals.sunits_player:respawn_in_start_location();
		nt_battle_fundamentals.sunits_enemy:respawn_in_start_location();

		nt_battle_fundamentals.sunits_player:set_always_visible(true);
		nt_battle_fundamentals.sunits_enemy:set_always_visible(true);

		reposition_sunits_for_tour(nt_battle_fundamentals.bounding_box_to_use, nt_battle_fundamentals.sunits_player, false);
		reposition_sunits_for_tour(nt_battle_fundamentals.bounding_box_to_use, nt_battle_fundamentals.sunits_enemy, true);	
		
		reposition_reinforcements_sunits_for_tour(nt_battle_fundamentals.bounding_box_to_use, sunits_player_reinforcement)
	end;

	local function spawn_player_reinforcement_unit()
		local sunits_player_reinforcement = nt_battle_fundamentals.sunits_player_reinforcement
		--sunits_player_reinforcement:set_always_visible(true);
		reposition_reinforcements_sunits_for_tour(nt_battle_fundamentals.bounding_box_to_use, sunits_player_reinforcement)
		sunits_player_reinforcement:set_enabled(true);
		--sunits_player_reinforcement:release_control();
		
	end;

	local function start_player_reinforcements_attack()
		local sunits_player_reinforcement = nt_battle_fundamentals.sunits_player_reinforcement

		sunits_player_reinforcement:release_control();
	end;

	local function compute_final_camera_position_for_reinforcement_section()
		-- sunits, x_offset, z_offset, horizontal_bearing override, vertical_bearing, horizontal_bearing_delta, relaxed pose
		nts_reinforcements.final_cam_target, nts_reinforcements.final_cam_position = st_helper.get_offset_camera_positions_from_sunits(
			nt_battle_fundamentals.sunits_player_reinforcement,
			0,
			-75,
			nil,
			nil,
			nil,
			true
		);
	end;

	nts_reinforcements:action(
		function()
			-- Enable weather ping icon
			local ping_uic = core:get_ui_root():SequentialFind("ping_parent")
			ping_uic:PropagateVisibility(true)

			
			-- Fade camera to black and enable cinematic ui
			cam:fade(true, 0.5);
			bm:enable_cinematic_ui(true, false, false);

			nt_battle_fundamentals.sunits_player_reinforcement:cache_location()
			
			nts_reinforcements:add_skip_action(
				function()
					bm:enable_cinematic_ui(false, true, false);
				end,
				"disable_cinematic_ui"
			);

			nts_reinforcements:add_skip_action(
				function(tour_ending, skipping_backwards)

					if skipping_backwards then 
						st_helper.stop_automatic_nts_advancement_monitor()
					end
					if not tour_ending and not skipping_backwards then
						-- We're skipping forwards before the attacking army has been established, so quickly establish it (and reset the player)

						-- Fade camera to black immediately
						cam:fade(true, 0);

						-- Reposition armies
						bm:callback(
							function()
								reset_armies_for_start_of_reinforcement_section();
								spawn_player_reinforcement_unit();
							end,
							200
						);

						-- Compute and reposition final camera position
						bm:callback(
							function()
								compute_final_camera_position_for_attacking_section();

								cam:move_to(nts_attacking.final_cam_position, nts_attacking.final_cam_target, 0);
								cam:fade(false, 0.5);

								start_player_reinforcements_attack();
								nt_battle_fundamentals.sunits_player:release_control();
							end,
							500
						);
					end;
				end,
				"establish_player_reinforcement"
			);
		end,
		0
	);

	nts_reinforcements:action(
		function()
			-- show the cinematic bars now the screen is blacked-out
			bm:enable_cinematic_ui(false, false, false);
			bm:enable_cinematic_ui(true, false, true);

			spawn_player_reinforcement_unit()

			nts_reinforcements:add_skip_action(
				function(tour_ending, skipping_backwards)
					if not tour_ending then
						if skipping_backwards then
							-- We're skipping backwards, so disable the enemy army	
							st_helper.stop_automatic_nts_advancement_monitor()
							
							reset_armies_for_start_of_attacking_section();
							nt_battle_fundamentals.sunits_player_reinforcement:set_enabled(false);
						end;
					end;
				end
			);
		end,
		700
	);


	nts_reinforcements:action(
		function()
			-- Compute camera positions for the enemy units walking on

			-- sunits, x_offset, z_offset, horizontal_bearing override, vertical_bearing, horizontal_bearing_delta, relaxed pose
			local cam_target, cam_position_1 = st_helper.get_offset_camera_positions_from_sunits(
				nt_battle_fundamentals.sunits_player_reinforcement,
				-50 - (nt_battle_fundamentals.sunits_player_reinforcement:width() / 2),
				60,
				nil,
				0.2,
				0
			);

			local cam_position_2 = st_helper.get_second_offset_camera_position(cam_target, cam_position_1);

			-- Also compute final camera positions for the tour section at this time and store them for later
			compute_final_camera_position_for_reinforcement_section();

			local cutscene_player_reinforcement = cutscene:new(
				"player_reinforcement",
				nt_battle_fundamentals.sunits_player,
				6000,		-- cutscene duration in ms
				function()
					--append_movement_controls_to_cheat_sheet();

					bm:enable_cinematic_ui(false, true, false);

					bm:hide_subtitles();

					bm:cancel_progress_on_sound_effect_finished("battle_fundamentals_attack");

					start_player_reinforcements_attack()

					nts_reinforcements:remove_skip_action("disable_cinematic_ui");
					nts_reinforcements:remove_skip_action("establish_player_reinforcement");

					core:trigger_event("ScriptEventTriggerFundamentalsTourReinforcementText");

					-- Move camera to final position behind player army
					cam:move_to(nts_attacking.final_cam_position, nts_attacking.final_cam_target, 3, false, 0);

				end
			);

			cutscene_player_reinforcement:set_should_enable_cinematic_camera(false);

			cutscene_player_reinforcement:action(
				function()
					-- Move camera to show enemy units walking on, and begin fade to picture
					cam:move_to(cam_position_1, cam_target, 0, false, 40);
					if cam_position_2 then
						cam:move_to(cam_position_2, cam_target, 30, true, 40);
					end;

					cam:fade(false, 0.5);
				end,
				0
			);

			cutscene_player_reinforcement:action(
				function()
					-- The enemy advance! Ready your forces for battle!
					bm:show_subtitle("phar_main_st_battle_fundamentals_mid_0002", false, true);
				end,
				1000
			);

			cutscene_player_reinforcement:start();
		end,
		2000
	);

	nts_reinforcements:action(
		function()
			-- Trigger change weather on this step to activate the storm visual effects
			bm:change_weather(suitable_weather_for_climate, weather_change_delay, suitable_weather_for_climate)
		end,
		2100
	)

	nts_reinforcements:action(
		function()
			if st_helper.automatic_nts_advancement_monitor(nt_battle_fundamentals, health_percentage_treshold, monitor_timer_delay) then 
				nts_reinforcements:add_skip_action(st_helper.stop_automatic_nts_advancement_monitor());
			end
		end,
		2500
	)

	nts_reinforcements:action(
		function()
			nts_reinforcements:highlight_next_button()
		end,
		8000
	)

	-------------------------------------------------
	--- Section 09 : Dynamic Weather
	-------------------------------------------------
	
	local nts_weather = st_helper.navigable_tour_section_battle_factory(
		"weather",											-- section name
		nil,												-- camera positions generator
		fundamentals_steps_advice_key[9],				-- advice key
		{
			"phar_main_st_battle_fundamentals_0080",
			"phar_main_st_battle_fundamentals_0081",
			"phar_main_st_battle_fundamentals_0082"
		}													-- infotext
	);


	

	nts_weather:action(
		function()
			--instantly change the weather to ensure we get the storm gameplay effects from updating the model.
			bm:change_weather(suitable_weather_for_climate,0,suitable_weather_for_climate)

			nts_weather:add_skip_action(
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

	nts_weather:action(
		function()
			if st_helper.automatic_nts_advancement_monitor(nt_battle_fundamentals, health_percentage_treshold, monitor_timer_delay) then 
				nts_weather:add_skip_action(st_helper.stop_automatic_nts_advancement_monitor());
			end
		end,
		500
	)

	nts_weather:action(
		function()
			nts_weather:highlight_next_button()
		end,
		8000
	)
	-------------------------------------------------
	--- Section 10 : Flanking
	-------------------------------------------------
	local function display_attack_controls_cheat_sheet()
		core:call_once(
			"append_attack_controls_to_cheat_sheet",
			function()
				append_attack_controls_to_cheat_sheet()
			end
		)
	end

	local nts_flanking = st_helper.navigable_tour_section_battle_factory(
		"flanking",											-- section name
		nil,												-- camera positions generator
		fundamentals_steps_advice_key[10],				-- advice key
		{
			"phar_main_st_battle_fundamentals_0090",
			"phar_main_st_battle_fundamentals_0091",
			"phar_main_st_battle_fundamentals_0092",
			"phar_main_st_battle_fundamentals_0093"
		}													-- infotext
	);

	nts_flanking:action(
		function()
			nts_flanking:add_skip_action(
				function(tour_ending, skipping_backwards)
					if skipping_backwards then 
						st_helper.stop_automatic_nts_advancement_monitor()
					end
				end, 
				"skip flanking")
		end,
		0
	)

	nts_flanking:action(
		function()
			-- If no combatants are currently routing then start a monitor for any of them routing, and advance
			if st_helper.automatic_nts_advancement_monitor(nt_battle_fundamentals, health_percentage_treshold, monitor_timer_delay) then 
				nts_flanking:add_skip_action(st_helper.stop_automatic_nts_advancement_monitor());
			end
		end,
		500
	);
	
	nts_flanking:action(
		function()
			display_attack_controls_cheat_sheet()
		end,
		1000
	);

	nts_flanking:action(
		function()
			nts_flanking:highlight_next_button()
		end,
		8000
	)

	-------------------------------------------------
	--- Section 11 : Morale, Routing and Shatttering
	-------------------------------------------------
	
	local nts_morale = st_helper.navigable_tour_section_battle_factory(
		"morale",											-- section name
		nil,												-- camera positions generator
		fundamentals_steps_advice_key[11],				-- advice key
		{
			--"phar_main_st_battle_fundamentals_0100",
			"phar_main_st_battle_fundamentals_0101",
			"phar_main_st_battle_fundamentals_0102",
			"phar_main_st_battle_fundamentals_0103",
			"phar_main_st_battle_fundamentals_0104",
			"phar_main_st_battle_fundamentals_0105",
			"phar_main_st_battle_fundamentals_0106",
			"phar_main_st_battle_fundamentals_0107",
			"phar_main_st_battle_fundamentals_0108",
			"phar_main_st_battle_fundamentals_0109",
		}													-- infotext
	);

	nts_morale:action(
		function()
			nts_morale:add_skip_action(
				function(tour_ending, skipping_backwards)
					if skipping_backwards then 
						st_helper.stop_automatic_nts_advancement_monitor()
					end
				end, 
				"skip flanking")
		end,
		0
	)

	nts_morale:action(
		function()
			-- If no combatants are currently routing then start a monitor for any of them routing, and advance
			if st_helper.automatic_nts_advancement_monitor(nt_battle_fundamentals, health_percentage_treshold, monitor_timer_delay) then 
				nts_morale:add_skip_action(st_helper.stop_automatic_nts_advancement_monitor());
			end
		end,
		500
	);
	
	nts_morale:action(
		function()
			nts_morale:highlight_next_button()
		end,
		8000
	)


	-- Add all sections to tour in order
	nt_battle_fundamentals:add_navigable_section(nts_intro);
	nt_battle_fundamentals:add_navigable_section(nts_camera_movement);
	nt_battle_fundamentals:add_navigable_section(nts_unit_selection);
	nt_battle_fundamentals:add_navigable_section(nts_multiple_selection);
	nt_battle_fundamentals:add_navigable_section(nts_multiple_movement);
	nt_battle_fundamentals:add_navigable_section(nts_attacking);
	nt_battle_fundamentals:add_navigable_section(nts_map_legend);
	nt_battle_fundamentals:add_navigable_section(nts_reinforcements);
	nt_battle_fundamentals:add_navigable_section(nts_weather)
	nt_battle_fundamentals:add_navigable_section(nts_flanking);
	nt_battle_fundamentals:add_navigable_section(nts_morale);

	local function prepare_non_participant_army_for_tour(tour_starting, sunits)
		sunits:set_enabled(not tour_starting, false, true);

		if tour_starting then
			sunits:take_control();
		else
			sunits:release_control();
		end;
	end;

	-- Toggles invincibility, and disables/re-enables non-player units
	local function prepare_all_armies_for_tour(tour_starting, sunits_player, sunits_player_reinforcement, sunits_enemy, bounding_box, sunits_player_unused, sunits_enemy_unused)

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
			reposition_sunits_for_tour(bounding_box, sunits_player, false);
			reposition_sunits_for_tour(bounding_box, sunits_enemy, true);

			-- Disable enemy forces
			sunits_enemy:set_enabled(false, false, true);
			sunits_player_reinforcement:set_enabled(false, false, true);

			-- Disable remaining unused enemy/player forces
			sunits_player_unused:set_enabled(false, false, true);
			sunits_enemy_unused:set_enabled(false, false, true);

		else
			-- Respawn the player + enemy units, including unused, in their starting positions
			sunits_player:set_enabled(true);
			sunits_enemy:set_enabled(true);
			sunits_player_unused:set_enabled(true);
			sunits_enemy_unused:set_enabled(true);
			sunits_player_reinforcement:set_enabled(true);

			sunits_player:set_always_visible(false);
			sunits_enemy:set_always_visible(false);
			
			sunits_player:respawn_in_start_location();
			sunits_enemy:respawn_in_start_location();
			sunits_player_reinforcement:respawn_in_start_location()
			sunits_player_unused:respawn_in_start_location();
			sunits_enemy_unused:respawn_in_start_location();

			sunits_player:release_control();
			sunits_enemy:release_control();
			sunits_player_unused:release_control();
			sunits_enemy_unused:release_control();
			sunits_player_reinforcement:release_control();
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




	-------------------------------------------------------------
	-- Add startup actions
	-------------------------------------------------------------
	nt_battle_fundamentals:start_action(
		function()
			event_triggered_from_tour = true

			if is_battle_tutorial_loaded_from_frontend() then 
				nt_battle_fundamentals:set_close_button_visible(false, false);					-- close button is invisible and inactive while the tour is playing
			end

			core:svr_save_bool("sbool_navigable_tour_started", true)

			-- fade camera to black
			cam:fade(true, 0.5);

			-- Record camera position
			nt_battle_fundamentals.cam_pos_start = cam:position();
			nt_battle_fundamentals.cam_targ_start = cam:target();
			
			-- Close current advisor
			bm:stop_advisor_queue(true);
			bm:clear_infotext();

			-- Disable pausing and changing of battle speed, set battle speed to normal, and prevent time updating
			bm:disable_pausing(true);
			bm:modify_battle_speed(1);
			bm:disable_cycle_battle_speed(true);
			-- bm:disable_time_speed_controls(true);
			bm:change_conflict_time_update_overridden(true);

			-- Disable orders
			bm:disable_orders(true);
		end,
		0
	);


	nt_battle_fundamentals:start_action(
		function()
			-- If we're in deployment phase then proceed to conflict phase
			if bm:get_current_phase_name() == "Deployment" then
				bm:end_current_battle_phase();
			end;

			-- Detach infotext from advisor
			bm:attach_to_advisor(false);
			
			-- Set tour controls above infotext - this needs to be done after detaching infotext
			nt_battle_fundamentals:set_tour_controls_above_infotext(true);

			-- Set weather to a generic one
			suitable_weather_for_climate = find_suitable_climate(bm:get_climate_type())
			bm:change_weather("dry", 0, suitable_weather_for_climate)

			-- Disable bits of the UI we don't want
			bm:disable_tactical_map(true);
			bm:disable_help_page_button(true);
			bm:disable_unit_camera(true);
			bm:show_top_bar(false);
			bm:show_army_panel(false);
			bm:show_radar_frame(false, true);
			bm:show_ui_options_panel(false);
			bm:show_portrait_panel(false);

			-- Disable clock UI 
			battle_clock_uic = core:get_ui_root():SequentialFind("txt_timer")
			battle_clock_uic:SetVisible(false)

			local battle_details_uic = core:get_ui_root():SequentialFind("battle_details")
			battle_details_uic:SetVisible(false)

			-- Cache and set certain preferences
			core:cache_and_set_integer_preference("ui_leaf_clipping", 2);
			core:cache_and_set_boolean_preference("ui_mouse_scroll", false);
			
			bm:steal_input_focus(false, false)

			-- Disable grouping/formations
			bm:disable_groups(true);
			bm:disable_formations(true);

			-- Disable units not involved in the scripted tour and teleport units being used into their starting positions
			prepare_all_armies_for_tour(true, nt_battle_fundamentals.sunits_player, nt_battle_fundamentals.sunits_player_reinforcement, nt_battle_fundamentals.sunits_enemy, nt_battle_fundamentals.bounding_box_to_use, nt_battle_fundamentals.sunits_player_unused, nt_battle_fundamentals.sunits_enemy_unused);			
		end,
		500
	);

	nt_battle_fundamentals:start_action(
		function()

			-- Begin player unit movement and position camera
			local sunits_player = nt_battle_fundamentals.sunits_player;
			local bounding_box = nt_battle_fundamentals.bounding_box_to_use;

			local cutscene_battle_fundamentals_intro = cutscene:new(
				"battle_fundamentals_intro",
				sunits_player,
				0,							-- cutscene duration in ms
				function()
					cam:fade(false, 1);

					-- sunits, x_offset, z_offset, horizontal_bearing, vertical_bearing, horizontal_bearing_delta, relaxed pose
					local cam_targ, cam_pos = st_helper.get_offset_camera_positions_from_sunits(
						nt_battle_fundamentals.sunits_player, 
						0, 
						-55,
						nil,
						nil,
						nil,
						true
					);

					cam:move_to(cam_pos, cam_targ, 3, false, 0);

					bm:hide_subtitles();
					
					bm:callback(
						function()
							nt_battle_fundamentals:start_next_section();
						end,
						1000
					);
					
				end
			);

			cutscene_battle_fundamentals_intro:set_should_enable_cinematic_camera(false);
			cutscene_battle_fundamentals_intro:set_should_release_players_army(false);
			cutscene_battle_fundamentals_intro:set_wait_for_advisor_on_end(true);
			cutscene_battle_fundamentals_intro:suppress_unit_voices(true);
			--bm:suspend_adc(true);

			if is_battle_ftue_bool then
				local right_hand_sunit = sunits_player:get_closest(v_offset_by_bearing(bounding_box.pos, d_to_r(bounding_box.bearing), bounding_box.width / 2));

				local walk_on_distance = 80;																-- distance the units will walk forward
				
				local cinematic_trigger_delay = {}
				local base_delay = 7000

				for i = 1, 18 do
					cinematic_trigger_delay[i] = base_delay + (i - 1) * 1500
				end

				cutscene_battle_fundamentals_intro:action(
					function()
						
						cam:fade(false, 10);
						
						local camera_pos_start_offset_x = -20;														-- start camera position offset from unit (left to right from unit's perspective)
						local camera_pos_start_offset_z = 25;														-- start camera position offset from unit (front to back from unit's perspective)
						local camera_pos_start_height = 15;															-- start camera position height above ground

						local camera_pos_end_travel = 10;															-- distance camera position will travel (in direction of unit facing)
						local camera_pos_end_height = 10;															-- end camera position height above ground

						local camera_movement_duration = 120;														-- camera movement duration in s

						-- Calculate start and end camera positions
						local camera_position_start = v_to_ground(right_hand_sunit:position_offset(camera_pos_start_offset_x, 0, camera_pos_start_offset_z), camera_pos_start_height);
						local camera_position_end = v_to_ground(v_offset_by_bearing(camera_position_start, d_to_r(bounding_box.bearing), camera_pos_end_travel), camera_pos_end_height);

						local camera_target_start = right_hand_sunit:position_offset(25, 25, 5);
						local camera_target_end = right_hand_sunit:position_offset(30, 30, 50);

						-- Instigate camera movements
						cam:move_to(camera_position_start, camera_target_start, 0, true, 47);
						cam:move_to(camera_position_end, camera_target_start, camera_movement_duration, false, 47);

						bm:callback(
							function()
								bm:queue_advisor(fundamentals_intro_scene_advice_key[1])
							end,
							cinematic_trigger_delay[1]
						);

					end,
					1000
				);

				cutscene_battle_fundamentals_intro:action(
					function()
						cutscene_battle_fundamentals_intro:wait_for_advisor()
					end,
					cinematic_trigger_delay[2]
				);

				cutscene_battle_fundamentals_intro:action(
					function()
						bm:queue_advisor(fundamentals_intro_scene_advice_key[2])

						bm:callback(
							function()
								local camera_pos_start_offset_x = 10;														-- start camera position offset from unit (left to right from unit's perspective)
								local camera_pos_start_offset_z = -10;														-- start camera position offset from unit (front to back from unit's perspective)
								local camera_pos_start_height = 30;															-- start camera position height above ground

								local camera_pos_end_travel = 20;															-- distance camera position will travel (in direction of unit facing)
								local camera_pos_end_height = 10;															-- end camera position height above ground

								local camera_movement_duration = 60;														-- camera movement duration in s

								-- Calculate start and end camera positions
								local camera_position_start = v_to_ground(right_hand_sunit:position_offset(camera_pos_start_offset_x, 0, camera_pos_start_offset_z), camera_pos_start_height);
								local camera_position_end = v_to_ground(v_offset_by_bearing(camera_position_start, d_to_r(bounding_box.bearing), camera_pos_end_travel), camera_pos_end_height);

								local camera_target_start = right_hand_sunit:position_offset(30, 25, 5);
								local camera_target_end = right_hand_sunit:position_offset(20, 15, 50);

								-- Instigate camera movements
								cam:move_to(camera_position_start, camera_target_start, 0, true, 47);
								cam:move_to(camera_position_end, camera_target_end, camera_movement_duration, false, 47);
							end,
							2500
						);
					end,
					cinematic_trigger_delay[3]
				);

				cutscene_battle_fundamentals_intro:action(
					function()
						cutscene_battle_fundamentals_intro:wait_for_advisor()
					end,
					cinematic_trigger_delay[4]
				);

				cutscene_battle_fundamentals_intro:action(
					function()
						bm:queue_advisor(fundamentals_intro_scene_advice_key[3])			
					end,
					cinematic_trigger_delay[5]
				);

				cutscene_battle_fundamentals_intro:action(
					function()
						cutscene_battle_fundamentals_intro:wait_for_advisor()
					end,
					cinematic_trigger_delay[6]
				);
				
				cutscene_battle_fundamentals_intro:action(
					function()
						
						bm:queue_advisor(fundamentals_intro_scene_advice_key[4])

						sunits_player:goto_location_offset(0, walk_on_distance, false);

						bm:callback(
							function()
								local camera_pos_start_offset_x = -5;														-- start camera position offset from unit (left to right from unit's perspective)
								local camera_pos_start_offset_z = 10;														-- start camera position offset from unit (front to back from unit's perspective)
								local camera_pos_start_height = 0;															-- start camera position height above ground (y is height)

								local camera_pos_end_travel = 15;															-- distance camera position will travel (in direction of unit facing)
								local camera_pos_end_height = 0;															-- end camera position height above ground

								local camera_movement_duration = 30 / right_hand_sunit.unit:slow_speed();					-- camera movement duration in s

								-- Calculate start and end camera positions
								local camera_position_start = v_to_ground(sunit_local_player_general:position_offset(camera_pos_start_offset_x, 0, camera_pos_start_offset_z), camera_pos_start_height);
								local camera_position_end = v_to_ground(v_offset_by_bearing(camera_position_start, d_to_r(bounding_box.bearing), camera_pos_end_travel), camera_pos_end_height);

								local camera_target_start = right_hand_sunit:position_offset(10, 1, 10);
								local camera_target_end = right_hand_sunit:position_offset(20, 5, 0);

								-- Instigate camera movements
								cam:move_to(camera_position_start, camera_target_start, 0, true, 47);
								cam:move_to(camera_position_end, camera_target_end, camera_movement_duration, false, 47);
							end,
							2800
						);

					end,
					cinematic_trigger_delay[7]
				);

				cutscene_battle_fundamentals_intro:action(
					function()
						cutscene_battle_fundamentals_intro:wait_for_advisor()
					end,
					cinematic_trigger_delay[8]
				);

				cutscene_battle_fundamentals_intro:action(
					function()
						bm:queue_advisor(fundamentals_intro_scene_advice_key[5])

						bm:callback(
							function ()
								local camera_pos_start_offset_x = -5;														-- start camera position offset from unit (left to right from unit's perspective)
								local camera_pos_start_offset_z = -20;														-- start camera position offset from unit (front to back from unit's perspective)
								local camera_pos_start_height = 8;															-- start camera position height above ground

								local camera_pos_end_travel = walk_on_distance / 2;												-- distance camera position will travel (in direction of unit facing)
								local camera_pos_end_height = 3;															-- end camera position height above ground

								local camera_movement_duration = walk_on_distance / right_hand_sunit.unit:slow_speed();		-- camera movement duration in s

								-- Calculate start and end camera positions
								local camera_position_start = v_to_ground(right_hand_sunit:position_offset(camera_pos_start_offset_x, 0, camera_pos_start_offset_z), camera_pos_start_height);
								local camera_position_end = v_to_ground(v_offset_by_bearing(camera_position_start, d_to_r(bounding_box.bearing), camera_pos_end_travel), camera_pos_end_height);

								local camera_target_start = right_hand_sunit:position_offset(-5, 2, 0);
								local camera_target_end = right_hand_sunit:position_offset(-8, 2, walk_on_distance);

								-- Instigate camera movements
								cam:move_to(camera_position_start, camera_target_start, 0, true, 47);
								cam:move_to(camera_position_end, camera_target_end, camera_movement_duration, false, 47);
							end,
							8200
						);

						bm:callback(
							function ()

							end,
							0
						);

					end,
					cinematic_trigger_delay[9]
				);

				cutscene_battle_fundamentals_intro:action(
					function()
						cutscene_battle_fundamentals_intro:wait_for_advisor()
					end,
					cinematic_trigger_delay[10]
				);

				cutscene_battle_fundamentals_intro:action(
					function()
						bm:queue_advisor(fundamentals_intro_scene_advice_key[6])

						local camera_pos_start_offset_x = 8;														-- start camera position offset from unit (left to right from unit's perspective)
						local camera_pos_start_offset_z = 15;														-- start camera position offset from unit (front to back from unit's perspective)
						local camera_pos_start_height = 2;															-- start camera position height above ground

						local camera_pos_end_travel = walk_on_distance / 2;												-- distance camera position will travel (in direction of unit facing)
						local camera_pos_end_height = 2;															-- end camera position height above ground

						local camera_movement_duration = walk_on_distance / right_hand_sunit.unit:slow_speed();		-- camera movement duration in s

						-- Calculate start and end camera positions
						local camera_position_start = v_to_ground(sunit_local_player_general:position_offset(camera_pos_start_offset_x, 0, camera_pos_start_offset_z), camera_pos_start_height);
						local camera_position_end = v_to_ground(v_offset_by_bearing(camera_position_start, d_to_r(bounding_box.bearing), camera_pos_end_travel), camera_pos_end_height);

						local camera_target_start = sunit_local_player_general:position_offset(-1, 0, 0);
						local camera_target_end = sunit_local_player_general:position_offset(-1, 2, 0);

						-- Instigate camera movements
						cam:move_to(camera_position_start, camera_target_start, 0, true, 38);
						cam:move_to(camera_position_end, camera_target_end, camera_movement_duration, false, 38);

					end,
					cinematic_trigger_delay[11]
				);

				cutscene_battle_fundamentals_intro:action(
					function()
						cutscene_battle_fundamentals_intro:wait_for_advisor()
					end,
					cinematic_trigger_delay[12]
				);

				cutscene_battle_fundamentals_intro:action(
					function()
						bm:queue_advisor(fundamentals_intro_scene_advice_key[7])

						bm:callback(
							function()
								local right_hand_sunit = sunits_player:get_closest(v_offset_by_bearing(bounding_box.pos, d_to_r(bounding_box.bearing), bounding_box.width / 2));

								local walk_on_distance = 30;																-- distance the units will walk forward

								local camera_pos_start_offset_x = 55;														-- start camera position offset from unit (left to right from unit's perspective)
								local camera_pos_start_offset_z = walk_on_distance / 3 + 10;									-- start camera position offset from unit (front to back from unit's perspective)
								local camera_pos_start_height = 10;															-- start camera position height above ground

								local camera_pos_end_travel = 2;															-- distance camera position will travel (in direction of unit facing)
								local camera_pos_end_height = 10;															-- end camera position height above ground

								local camera_target_start_offset_z = 5;														-- start camera target offset from unit (front to back from unit's perspective)

								local camera_movement_duration = walk_on_distance / right_hand_sunit.unit:slow_speed();		-- camera movement duration in s

								-- Calculate start and end camera positions
								local camera_position_start = v_to_ground(right_hand_sunit:position_offset(camera_pos_start_offset_x, 0, camera_pos_start_offset_z), camera_pos_start_height);
								local camera_position_end = v_to_ground(v_offset_by_bearing(camera_position_start, d_to_r(bounding_box.bearing), camera_pos_end_travel), camera_pos_end_height);

								local camera_target_start = right_hand_sunit:position_offset(0, 0, camera_target_start_offset_z);
								local camera_target_end = right_hand_sunit:position_offset(0, 0, walk_on_distance);

								-- Instigate camera movements
								cam:move_to(camera_position_start, camera_target_start, 0, true, 0);
								cam:move_to(camera_position_end, camera_target_end, camera_movement_duration, false, 0);
							end,
							0
						);
					end,
					cinematic_trigger_delay[13]
				);

				cutscene_battle_fundamentals_intro:action(
					function()
						cutscene_battle_fundamentals_intro:wait_for_advisor()
					end,
					cinematic_trigger_delay[14]
				);

				cutscene_battle_fundamentals_intro:action(
					function()
						bm:queue_advisor(fundamentals_intro_scene_advice_key[8])
						sunits_player:goto_location_offset(0, 5, false);
						bm:callback(
							function()
								-- sunits, x_offset, z_offset, horizontal_bearing, vertical_bearing, horizontal_bearing_delta, relaxed pose
								local cam_targ, cam_pos = st_helper.get_offset_camera_positions_from_sunits(
									nt_battle_fundamentals.sunits_player, 
									0, 
									-55,
									nil,
									nil,
									nil,
									true
								);

								cam:move_to(cam_pos, cam_targ, 12, false, 0);
							end,
							2000
						);

					end,
					cinematic_trigger_delay[15]
				);

				cutscene_battle_fundamentals_intro:action(
					function()
						cutscene_battle_fundamentals_intro:wait_for_advisor()
					end,
					cinematic_trigger_delay[16]
				);

				cutscene_battle_fundamentals_intro:action(
					function()
						cutscene_battle_fundamentals_intro:skip()
					end,
					cinematic_trigger_delay[17]
				);
			end;

			if not is_battle_ftue_bool then
				cutscene_battle_fundamentals_intro:action(
					function()
						local right_hand_sunit = sunits_player:get_closest(v_offset_by_bearing(bounding_box.pos, d_to_r(bounding_box.bearing), bounding_box.width / 2));

						local walk_on_distance = 30;																-- distance the units will walk forward

						local camera_pos_start_offset_x = 45;														-- start camera position offset from unit (left to right from unit's perspective)
						local camera_pos_start_offset_z = walk_on_distance + 10;									-- start camera position offset from unit (front to back from unit's perspective)
						local camera_pos_start_height = 10;															-- start camera position height above ground

						local camera_pos_end_travel = 2;															-- distance camera position will travel (in direction of unit facing)
						local camera_pos_end_height = 10;															-- end camera position height above ground

						local camera_target_start_offset_z = 5;														-- start camera target offset from unit (front to back from unit's perspective)

						local camera_fov_start = 0;																	-- fov at camera start position
						local camera_fov_end = 0;																	-- fov at camera end position

						local camera_movement_duration = walk_on_distance / right_hand_sunit.unit:slow_speed();		-- camera movement duration in s

						-- Calculate start and end camera positions
						local camera_position_start = v_to_ground(right_hand_sunit:position_offset(camera_pos_start_offset_x, 0, camera_pos_start_offset_z), camera_pos_start_height);
						local camera_position_end = v_to_ground(v_offset_by_bearing(camera_position_start, d_to_r(bounding_box.bearing), camera_pos_end_travel), camera_pos_end_height);

						local camera_target_start = right_hand_sunit:position_offset(0, 0, camera_target_start_offset_z);
						local camera_target_end = right_hand_sunit:position_offset(0, 0, walk_on_distance);

						-- Order player units to start moving forward
						sunits_player:goto_location_offset(0, walk_on_distance, false);

						-- Instigate camera movements
						cam:move_to(camera_position_start, camera_target_start, 0, true, camera_fov_start);
						cam:move_to(camera_position_end, camera_target_end, camera_movement_duration, false, camera_fov_end);

						bm:callback(
							function()
								cam:fade(false, 1);
							end,
							1000
						);

						bm:callback(
							function()
								cutscene_battle_fundamentals_intro:skip()
							end,
							8500
						);

					end,
					0
				);

				cutscene_battle_fundamentals_intro:action(
					function()
						-- Battles are fought between armies. No army may prosper without a skilled war leader to guide it. Only through your leadership may your troops gain victory.
						bm:show_subtitle("phar_main_st_battle_fundamentals_intro_0001", false, true);
					end,
					1500
				);

			end;

			cutscene_battle_fundamentals_intro:start();

		end,	
		1000
	);

	-------------------------------------------------------------
	-- Add end actions
	-------------------------------------------------------------
	nt_battle_fundamentals:end_action(
		function()

			core:restore_advisor_priority()

			bm:disable_orders(false)
			bm:disable_pausing(false);
			bm:change_conflict_time_update_overridden(false);
			bm:clear_infotext();
			bm:disable_cycle_battle_speed(false);

			bm:disable_tactical_map(false);
			bm:disable_help_page_button(false);
			bm:disable_unit_camera(false);
			bm:show_top_bar(true);
			bm:show_army_panel(true);
			bm:show_radar_frame(true, true);
			bm:show_ui_options_panel(true);
			bm:show_portrait_panel(true);

			bm:disable_groups(false);
			bm:disable_formations(false);

			-- Disable clock UI 
			battle_clock_uic:SetVisible(true)

			local battle_details_uic = core:get_ui_root():SequentialFind("battle_details")
			battle_details_uic:SetVisible(true)

			-- destroy attacking enemy units sai
			release_enemy_from_planner();
			
			if not is_battle_tutorial_loaded_from_frontend() then 
				prepare_all_armies_for_tour(false, nt_battle_fundamentals.sunits_player, nt_battle_fundamentals.sunits_player_reinforcement, nt_battle_fundamentals.sunits_enemy, nt_battle_fundamentals.bounding_box_to_use, nt_battle_fundamentals.sunits_player_unused, nt_battle_fundamentals.sunits_enemy_unused);

				cam:fade(true, 0.5);
				bm:enable_cinematic_ui(true, false, false);

				bm:callback(
					function()
						bm:change_weather("dry", 0, "dry")
						local cam_targ, cam_pos = st_helper.get_offset_camera_positions_from_sunits(
			 				nt_battle_fundamentals.sunits_player, 
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
					end, 
					1000, 
					"end_cutscene"
				)

			end
			
			core:trigger_event("BattleFundamentalsTourEnded");
		end,
		0
	);

	
end;