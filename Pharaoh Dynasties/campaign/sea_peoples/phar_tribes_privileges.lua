out("Loading phar_tribes_privileges.lua")

local function output(str)
	if str then
		out("*** phar_tribes_privileges ***: " .. str)
	end
end


tribes_privileges = {
	config = {
		points_per_gradation = 100,

		resource_keys = {
			dwelling = "phar_sea_dwelling_points",
			blades = "phar_sea_blades_points",
		},

		factors = {
			dwelling = {
				settled = {
					ers = "phar_sea_tribes_privilege_external_region_slot_settled",
					building = "phar_sea_tribes_privilege_main_settlement_building_settled",
				},
				horde = {
					ers = "phar_sea_tribes_privilege_external_region_slot_horde",
					building = "phar_sea_tribes_privilege_main_settlement_building_horde",
				},
			},
			blades = {
				settled = {
					general_competency = "phar_sea_tribes_privilege_general_competency_settled",
					military_force = "phar_sea_tribes_privilege_military_force_settled",
					units = "phar_sea_tribes_privilege_units_settled",
					units_high_tier = "phar_sea_tribes_privilege_units_settled_high_tier",
				},
				horde = {
					general_competency = "phar_sea_tribes_privilege_general_competency_horde",
					military_force = "phar_sea_tribes_privilege_military_force_horde",
					units = "phar_sea_tribes_privilege_units_horde",
					units_high_tier = "phar_sea_tribes_privilege_units_horde_high_tier",
				},
			},
		},

		factor_unique_id_to_factor_key = {
			phar_sea_tribes_privilege_external_region_slot_dwelling_settled = "phar_sea_tribes_privilege_external_region_slot_settled",
			phar_sea_tribes_privilege_external_region_slot_dwelling_horde = "phar_sea_tribes_privilege_external_region_slot_horde",
			phar_sea_tribes_privilege_main_settlement_building_dwelling_settled = "phar_sea_tribes_privilege_main_settlement_building_settled",
			phar_sea_tribes_privilege_main_settlement_building_dwelling_horde = "phar_sea_tribes_privilege_main_settlement_building_horde",
			phar_sea_tribes_privilege_general_competency_blades_settled = "phar_sea_tribes_privilege_general_competency_settled",
			phar_sea_tribes_privilege_general_competency_blades_horde = "phar_sea_tribes_privilege_general_competency_horde",
			phar_sea_tribes_privilege_military_force_blades_settled = "phar_sea_tribes_privilege_military_force_settled",
			phar_sea_tribes_privilege_military_force_blades_horde = "phar_sea_tribes_privilege_military_force_horde",
			phar_sea_tribes_privilege_units_blades_settled = "phar_sea_tribes_privilege_units_settled",
			phar_sea_tribes_privilege_units_blades_settled_high_tier = "phar_sea_tribes_privilege_units_settled_high_tier",
			phar_sea_tribes_privilege_units_blades_horde = "phar_sea_tribes_privilege_units_horde",
			phar_sea_tribes_privilege_units_blades_horde_high_tier = "phar_sea_tribes_privilege_units_horde_high_tier",
		},

		factor_key_to_factor_unique_id = {
			-- automatically filled using table above
		},

		factors_that_can_have_points_removed_by_autonomy = {
			phar_sea_tribes_privilege_main_settlement_building_dwelling_settled = true,
			phar_sea_tribes_privilege_external_region_slot_dwelling_settled = true,
			phar_sea_tribes_privilege_external_region_slot_dwelling_horde = true,
		},

		-- positive points means SETTLED points (dwelling/blades)
		-- negative points means HORDE points (dwelling/blades)
		-- in the UI all points should be displayed as positive
		dwelling_points_of_minor_settlement_per_main_building_level = {
			[0] = 0,
			[1] = 10,
			[2] = 20,
			[3] = 30,
			[4] = 40,
			[5] = 50,
		},
		dwelling_points_of_major_settlement_multiplier = 2,	-- a multiplier for dwelling_points_of_minor_settlement_per_main_building_level values

		dwelling_points_per_nomad_outpost_ers = -60,	-- Nuraghe Camps, Peleset Village
		dwelling_points_per_settled_ers = 10,		-- eg. Forts, Monuments, Trading Posts, etc.
		dwelling_points_per_horde_force = -50,

		blades_points_per_horde_general_competency = -2,
		blades_points_per_settled_general_competency = 2,

		-- a table of unit keys and the blade points assigned to them
		blades_points_for_unit_keys = {
			--phar_main_nat_fen_armoured_canaanite_chariots = 32,
			--phar_main_nat_hig_armoured_anatolian_spears = 10,
		},

		blades_points_per_horde_force = -10,
		blades_points_per_settled_force = 10,
		blades_points_per_horde_unit = -4,
		blades_points_per_settled_unit = 4,
		blades_points_per_elite_horde_unit = -6,
		blades_points_per_elite_settled_unit = 6,

		horde_unit_set = "phar_sea_tribes_blades_normal_horde_units",
		settled_unit_set = "phar_sea_tribes_blades_normal_settled_units",
		elite_horde_unit_set = "phar_sea_tribes_blades_elite_horde_units",
		elite_settled_unit_set = "phar_sea_tribes_blades_elite_settled_units",

		include_fort_units_in_scales = false,	-- by "fort" here we mean all ERSs that can house units and allow unit exchange with a visiting force (so regular Forts, as well as Nomad Outposts etc.)

		nomad_outpost_ers_building_set = "phar_sea_nomad_ers",
		settled_ers_building_sets = {
			"phar_main_administrative_ers",
			"phar_main_economic_ers",
			"phar_main_military_ers",
			"phar_main_religious_ers ",
			"phar_main_unique_ers",
		},

		autonomy_bundle_key_ers = "phar_sea_effect_bundle_town_privileges_autonomy_nomad_camp",
		autonomy_bundle_key_minor_settlement = "phar_sea_effect_bundle_town_privileges_autonomy_minor",
		autonomy_bundle_key_major_settlement = "phar_sea_effect_bundle_town_privileges_autonomy_major",

		settled_force_bundle = "phar_sea_effect_bundle_town_privileges_phicol",
		horde_force_bundle = "",

		settlement_autonomy_cooldown = 3,
		ers_autonomy_cooldown = 3,
		army_type_swap_cooldown = 3,

		cell_categories = {
			herdsmen = "herdsmen",		-- upper left quadrant
			farmers = "farmers",		-- upper right quadrant
			raiders = "raiders",		-- lower left quadrant
			craftsmen = "craftsmen",	-- lower right quadrant
		},

		achish_ceremony = {
			duration = 4,
			cooldown = 6,
			resource_cost_key = "tribes_privileges_achish_ceremony_cost",
		},

		sea_horde_faction_keys = {
			"phar_sea_denyen",
			"phar_sea_ekwesh",
			"phar_sea_lukka",
			"phar_sea_shekelesh",
			"phar_sea_teresh",
			"phar_sea_tjeker",
			"phar_sea_weshesh",
			"phar_sea_sherden",
			"phar_sea_peleset",
		},

		-- cells is the table of Tribe Categories
		-- the table is ordered first by row starting from the top-most row and then by column left-to-right
		cells =
		{
			-- Top row (x = 1)
			{
				-- Left-most column (y = 1)
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_shepherds",
					bundle_key = "phar_sea_effect_bundle_town_privileges_shepherds",
					ui_component_section_id = "top_left_1",
				},
				-- Second column from the left (y = 2)
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_cattlemen",
					bundle_key = "phar_sea_effect_bundle_town_privileges_cattlemen",
					ui_component_section_id = "top_left_1",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_herders",
					bundle_key = "phar_sea_effect_bundle_town_privileges_herders",
					ui_component_section_id = "top_left_2",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_breeders",
					bundle_key = "phar_sea_effect_bundle_town_privileges_breeders",
					ui_component_section_id = "top_left_2",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_landowners",
					bundle_key = "phar_sea_effect_bundle_town_privileges_landowners",
					ui_component_section_id = "top_right_1",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_planters",
					bundle_key = "phar_sea_effect_bundle_town_privileges_planters",
					ui_component_section_id = "top_right_1",
				},
				-- Second column from the right (y = 7)
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_cultivators",
					bundle_key = "phar_sea_effect_bundle_town_privileges_cultivators",
					ui_component_section_id = "top_right_2",
				},
				-- Right-most column (y = 8)
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_agriculturalists",
					bundle_key = "phar_sea_effect_bundle_town_privileges_agriculturalists",
					ui_component_section_id = "top_right_2",
				},
			},
			-- Second row from the top (x = 2)
			{
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_wranglers",
					bundle_key = "phar_sea_effect_bundle_town_privileges_wranglers",
					ui_component_section_id = "top_left_1",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_cowpoke",
					bundle_key = "phar_sea_effect_bundle_town_privileges_cowpoke",
					ui_component_section_id = "top_left_1",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_graziers",
					bundle_key = "phar_sea_effect_bundle_town_privileges_graziers",
					ui_component_section_id = "top_left_2",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_stockmen",
					bundle_key = "phar_sea_effect_bundle_town_privileges_stockmen",
					ui_component_section_id = "top_left_2",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_weeders",
					bundle_key = "phar_sea_effect_bundle_town_privileges_weeders",
					ui_component_section_id = "top_right_1",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_harvesters",
					bundle_key = "phar_sea_effect_bundle_town_privileges_harvesters",
					ui_component_section_id = "top_right_1",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_plowers",
					bundle_key = "phar_sea_effect_bundle_town_privileges_plowers",
					ui_component_section_id = "top_right_2",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_homesteaders",
					bundle_key = "phar_sea_effect_bundle_town_privileges_homesteaders",
					ui_component_section_id = "top_right_2",
				},
			},
			{
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_poachers",
					bundle_key = "phar_sea_effect_bundle_town_privileges_poachers",
					ui_component_section_id = "top_left_3",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_cowhands",
					bundle_key = "phar_sea_effect_bundle_town_privileges_cowhands",
					ui_component_section_id = "top_left_3",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_fishermen",
					bundle_key = "phar_sea_effect_bundle_town_privileges_fishermen",
					ui_component_section_id = "top_left_4",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_huntsmen",
					bundle_key = "phar_sea_effect_bundle_town_privileges_huntsmen",
					ui_component_section_id = "top_left_4",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_hayseeds",
					bundle_key = "phar_sea_effect_bundle_town_privileges_hayseeds",
					ui_component_section_id = "top_right_4",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_farmworkers",
					bundle_key = "phar_sea_effect_bundle_town_privileges_farmworkers",
					ui_component_section_id = "top_right_4",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_crofters",
					bundle_key = "phar_sea_effect_bundle_town_privileges_crofters",
					ui_component_section_id = "top_right_3",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_horticulturists",
					bundle_key = "phar_sea_effect_bundle_town_privileges_horticulturists",
					ui_component_section_id = "top_right_3",
				},
			},
			{
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_rustlers",
					bundle_key = "phar_sea_effect_bundle_town_privileges_rustlers",
					ui_component_section_id = "top_left_3",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_pursuers",
					bundle_key = "phar_sea_effect_bundle_town_privileges_pursuers",
					ui_component_section_id = "top_left_3",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_deerstalkers",
					bundle_key = "phar_sea_effect_bundle_town_privileges_deerstalkers",
					ui_component_section_id = "top_left_4",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_herdsmen",
					bundle_key = "phar_sea_effect_bundle_town_privileges_herdsmen",
					ui_component_section_id = "top_left_4",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_farmers",
					bundle_key = "phar_sea_effect_bundle_town_privileges_farmers",
					ui_component_section_id = "top_right_4",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_reapers",
					bundle_key = "phar_sea_effect_bundle_town_privileges_reapers",
					ui_component_section_id = "top_right_4",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_growers",
					bundle_key = "phar_sea_effect_bundle_town_privileges_growers",
					ui_component_section_id = "top_right_3",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_gardeners",
					bundle_key = "phar_sea_effect_bundle_town_privileges_gardeners",
					ui_component_section_id = "top_right_3",
				},
			},
			{
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_looters",
					bundle_key = "phar_sea_effect_bundle_town_privileges_looters",
					ui_component_section_id = "bottom_left_1",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_swindlers",
					bundle_key = "phar_sea_effect_bundle_town_privileges_swindlers",
					ui_component_section_id = "bottom_left_1",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_infiltrators",
					bundle_key = "phar_sea_effect_bundle_town_privileges_infiltrators",
					ui_component_section_id = "bottom_left_4",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_raiders",
					bundle_key = "phar_sea_effect_bundle_town_privileges_raiders",
					ui_component_section_id = "bottom_left_4",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_craftsmen",
					bundle_key = "phar_sea_effect_bundle_town_privileges_craftsmen",
					ui_component_section_id = "bottom_right_4",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_carpenters",
					bundle_key = "phar_sea_effect_bundle_town_privileges_carpenters",
					ui_component_section_id = "bottom_right_4",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_builders",
					bundle_key = "phar_sea_effect_bundle_town_privileges_builders",
					ui_component_section_id = "bottom_right_1",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_masters",
					bundle_key = "phar_sea_effect_bundle_town_privileges_masters",
					ui_component_section_id = "bottom_right_1",
				},
			},
			{
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_plunderers",
					bundle_key = "phar_sea_effect_bundle_town_privileges_plunderers",
					ui_component_section_id = "bottom_left_1",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_depredators",
					bundle_key = "phar_sea_effect_bundle_town_privileges_depredators",
					ui_component_section_id = "bottom_left_1",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_freebooters",
					bundle_key = "phar_sea_effect_bundle_town_privileges_freebooters",
					ui_component_section_id = "bottom_left_4",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_provocateurs",
					bundle_key = "phar_sea_effect_bundle_town_privileges_provocateurs",
					ui_component_section_id = "bottom_left_4",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_stonecutters",
					bundle_key = "phar_sea_effect_bundle_town_privileges_stonecutters",
					ui_component_section_id = "bottom_right_4",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_wrights",
					bundle_key = "phar_sea_effect_bundle_town_privileges_wrights",
					ui_component_section_id = "bottom_right_4",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_bricklayers",
					bundle_key = "phar_sea_effect_bundle_town_privileges_bricklayers",
					ui_component_section_id = "bottom_right_1",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_masons",
					bundle_key = "phar_sea_effect_bundle_town_privileges_masons",
					ui_component_section_id = "bottom_right_1",
				},
			},
			{
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_marauders",
					bundle_key = "phar_sea_effect_bundle_town_privileges_marauders",
					ui_component_section_id = "bottom_left_2",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_extortionists",
					bundle_key = "phar_sea_effect_bundle_town_privileges_extortionists",
					ui_component_section_id = "bottom_left_2",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_intruders",
					bundle_key = "phar_sea_effect_bundle_town_privileges_intruders",
					ui_component_section_id = "bottom_left_3",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_trespassers",
					bundle_key = "phar_sea_effect_bundle_town_privileges_trespassers",
					ui_component_section_id = "bottom_left_3",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_woodcutters",
					bundle_key = "phar_sea_effect_bundle_town_privileges_woodcutters",
					ui_component_section_id = "bottom_right_2",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_lumbermen",
					bundle_key = "phar_sea_effect_bundle_town_privileges_lumbermen",
					ui_component_section_id = "bottom_right_2",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_weaponsmiths",
					bundle_key = "phar_sea_effect_bundle_town_privileges_weaponsmiths",
					ui_component_section_id = "bottom_right_3",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_artificers",
					bundle_key = "phar_sea_effect_bundle_town_privileges_artificers",
					ui_component_section_id = "bottom_right_3",
				},
			},
			-- Bottom/last row (x = 8)
			{
				-- Left-most column (y = 1)
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_ravagers",
					bundle_key = "phar_sea_effect_bundle_town_privileges_ravagers",
					ui_component_section_id = "bottom_left_2",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_pillagers",
					bundle_key = "phar_sea_effect_bundle_town_privileges_pillagers",
					ui_component_section_id = "bottom_left_2",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_invaders",
					bundle_key = "phar_sea_effect_bundle_town_privileges_invaders",
					ui_component_section_id = "bottom_left_3",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_aggressors",
					bundle_key = "phar_sea_effect_bundle_town_privileges_aggressors",
					ui_component_section_id = "bottom_left_3",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_gatherers",
					bundle_key = "phar_sea_effect_bundle_town_privileges_gatherers",
					ui_component_section_id = "bottom_right_2",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_stockpilers",
					bundle_key = "phar_sea_effect_bundle_town_privileges_stockpilers",
					ui_component_section_id = "bottom_right_2",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_smiths",
					bundle_key = "phar_sea_effect_bundle_town_privileges_smiths",
					ui_component_section_id = "bottom_right_3",
				},
				{
					display_name = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_categories_artisans",
					bundle_key = "phar_sea_effect_bundle_town_privileges_artisans",
					ui_component_section_id = "bottom_right_3",
				},
			},
		},

		ui = {
			panel_name = "sea_tribes_privileges",

			axis_tooltip_layout_path = "ui/campaign ui/sea_tribes_privileges_grid_resource_tooltip",
			achish_button_tooltip_layout_path = "ui/campaign ui/sea_tribes_privileges_tooltip_title_description_warning",
			autonomy_button_tooltip_layout_path = "ui/campaign ui/sea_tribes_privileges_sovereignty_tooltip",
			change_army_type_button_tooltip_layout_path = "ui/campaign ui/sea_tribes_privileges_sovereignty_tooltip",

			component_ids = {
				-- components resident in the layout "faction_widget_phar"
				faction_widget_button_alert_icon = "tribes_privileges_alert_icon",

				-- components resident in the primary layout "sea_tribes_privileges"
				tile_template = "template_sea_tribes_privileges_tile",
				herdsmen_tiles_holder = "herdsmen_tiles_holder",	-- ul
				farmers_tiles_holder = "farmers_tiles_holder",		-- ur
				raiders_tiles_holder = "raiders_tiles_holder",		-- bl
				craftsmen_tiles_holder = "craftsmen_tiles_holder",	-- br
				your_boat = "your_boat",
				dwelling_axis = "dwelling_axis",
				blades_axis = "blades_axis",
				dwelling_indicator = "dwelling_indicator",
				blades_indicator = "blades_indicator",
				indicator_text_value = "value_holder",
				achish_ceremony_button = "achish_ceremony_button",
				achish_ceremony_button_turn_counter = "turns_icon",
				dwelling_horde_axis_tooltip_holder = "dwelling_horde_tooltip_hover_area",
				dwelling_settled_axis_tooltip_holder = "dwelling_settled_tooltip_hover_area",
				blades_horde_axis_tooltip_holder = "blades_horde_tooltip_hover_area",
				blades_settled_axis_tooltip_holder = "blades_settled_tooltip_hover_area",
				strategic_map = "strategic_map",
				coordinate_values = "coordinate_values",
				quadrant_highlighters = "quadrant_highlighters",

				panel_left_side_parent = "points_sources_panel",	-- abstracted into its own layout "sea_tribes_privileges_points_sources_panel"

				panel_right_side_parent = "tile_effects",			-- abstracted into its own layout "sea_tribes_privileges_tile_effects"
				tile_effects_current_effects = "current_effects",
				tile_effects_alert = "dy_alert",
				tile_effects_tile_category_text = "dy_tile_category",
				tile_effects_hovered_effects = "hover_pin_effects",		-- only visible when a tile template is hovered or pinned
				tile_effects_requirements_holder = "requirements_holder",		-- only visible when a tile template is hovered or pinned
				tile_effects_dwelling_horde_requirements_text = "horde_dwelling_req_pts",
				tile_effects_blades_horde_requirements_text = "horde_blades_req_pts",
				tile_effects_blades_settled_requirements_text = "settled_blades_req_pts",
				tile_effects_dwelling_settled_requirements_text = "settled_dwelling_req_pts",

				-- components resident in "sea_tribes_privileges_tooltip_title_description_warning":
				achish_ceremony_tooltip_cost_template = "cost_template",
				achish_ceremony_tooltip_duration_container = "copy_of_duration_template",
				achish_ceremony_tooltip_cooldown_container = "cooldown_template",
				achish_ceremony_tooltip_duration_number = "dy_duration_value",

				-- ui/common ui/dialogue_box/popup_message_box
				popup_message_box = "popup_message_box",

				-- components resident in "settlement_captured" layout:
				settlement_captured_template_holder = "button_parent",
				settlement_captured_dwelling_points_indicator = "tribes_privileges_dwelling_points_indicator",
				settlement_captured_blades_points_indicator = "tribes_privileges_blades_points_indicator",
				settlement_captured_option_icon = "icon",
				settlement_capture_option_button = "option_button",
			},

			component_states = {
				default = "default",
				your_boat = "your_boat",
				your_boat_hover = "your_boat_hover",
				achish_ceremony_predicted = "achish_ceremony_predicted",
				active = "active",
				inactive = "inactive",
				left = "left",
				right = "right",
				up = "up",
				down = "down",
				dwelling_horde = "dwelling_horde",
				dwelling_settled = "dwelling_settled",
				blades_horde = "blades_horde",
				blades_settled = "blades_settled",
			},

			localization_keys = {
				cell_category_title_prefix = "phar_sea_tribes_privileges_category_",

				dwelling_points = "phar_sea_tribes_privileges_dwelling_points_title",
				blades_points = "phar_sea_tribes_privileges_blades_points_title",

				tooltip_dwelling_settled_points_title = "phar_sea_tribes_privileges_tooltip_tribe_category_dwelling_settled_points_title",
				tooltip_dwelling_horde_points_title = "phar_sea_tribes_privileges_tooltip_tribe_category_dwelling_horde_points_title",
				tooltip_blades_settled_points_title = "phar_sea_tribes_privileges_tooltip_tribe_category_blades_settled_points_title",
				tooltip_blades_horde_points_title = "phar_sea_tribes_privileges_tooltip_tribe_category_blades_horde_points_title",
				tooltip_dwelling_settled_points_description = "phar_sea_tribes_privileges_tooltip_tribe_category_dwelling_settled_points_description",
				tooltip_dwelling_horde_points_description = "phar_sea_tribes_privileges_tooltip_tribe_category_dwelling_horde_points_description",
				tooltip_blades_settled_points_description = "phar_sea_tribes_privileges_tooltip_tribe_category_blades_settled_points_description",
				tooltip_blades_horde_points_description = "phar_sea_tribes_privileges_tooltip_tribe_category_blades_horde_points_description",
				tooltip_tribe_category_points_description_source_settled_blades_competency = "phar_sea_tribes_privileges_tooltip_tribe_category_points_description_source_settled_blades_competency",
				tooltip_tribe_category_points_description_source_settled_blades_settled_army = "phar_sea_tribes_privileges_tooltip_tribe_category_points_description_source_settled_blades_settled_army",
				tooltip_tribe_category_points_description_source_settled_blades_settled_unit_tiers = "phar_sea_tribes_privileges_tooltip_tribe_category_points_description_source_settled_blades_settled_unit_tiers",
				tooltip_tribe_category_points_description_source_settled_blades_settled_unit_tiers_elite = "phar_sea_tribes_privileges_tooltip_tribe_category_points_description_source_settled_blades_settled_unit_tiers_elite",
				tooltip_tribe_category_points_description_source_horde_blades_competency = "phar_sea_tribes_privileges_tooltip_tribe_category_points_description_source_horde_blades_competency",
				tooltip_tribe_category_points_description_source_horde_blades_horde_army = "phar_sea_tribes_privileges_tooltip_tribe_category_points_description_source_horde_blades_horde_army",
				tooltip_tribe_category_points_description_source_horde_blades_horde_unit_tiers = "phar_sea_tribes_privileges_tooltip_tribe_category_points_description_source_horde_blades_horde_unit_tiers",
				tooltip_tribe_category_points_description_source_horde_blades_horde_unit_tiers_elite = "phar_sea_tribes_privileges_tooltip_tribe_category_points_description_source_horde_blades_horde_unit_tiers_elite",
				tooltip_tribe_category_points_description_source_settled_dwelling_major_settlement = "phar_sea_tribes_privileges_tooltip_tribe_category_points_description_source_settled_dwelling_major_settlement",
				tooltip_tribe_category_points_description_source_settled_dwelling_minor_settlement = "phar_sea_tribes_privileges_tooltip_tribe_category_points_description_source_settled_dwelling_minor_settlement",
				tooltip_tribe_category_points_description_source_settled_dwelling_settled_outpost = "phar_sea_tribes_privileges_tooltip_tribe_category_points_description_source_settled_dwelling_settled_outpost",
				tooltip_tribe_category_points_description_source_horde_dwelling_horde_outpost = "phar_sea_tribes_privileges_tooltip_tribe_category_points_description_source_horde_dwelling_horde_outpost",
				tooltip_tribe_category_points_description_source_horde_dwelling_horde_army = "phar_sea_tribes_privileges_tooltip_tribe_category_points_description_source_horde_dwelling_horde_army",
				tooltip_dwelling_settled_points_alert_text = "phar_sea_tribes_privileges_tooltip_tribe_category_dwelling_settled_points_alert_text",
				tooltip_dwelling_horde_points_alert_text = "phar_sea_tribes_privileges_tooltip_tribe_category_dwelling_horde_points_alert_text",
				tooltip_blades_settled_points_alert_text = "phar_sea_tribes_privileges_tooltip_tribe_category_blades_settled_points_alert_text",
				tooltip_blades_horde_points_alert_text = "phar_sea_tribes_privileges_tooltip_tribe_category_blades_horde_points_alert_text",

				tooltip_achish_ceremony_title = "phar_sea_tribes_privileges_tooltip_achish_ceremony_title",
				tooltip_achish_ceremony_description = "phar_sea_tribes_privileges_tooltip_achish_ceremony_description",
				tooltip_achish_ceremony_action = "phar_sea_tribes_privileges_tooltip_achish_ceremony_action",
				tooltip_achish_ceremony_warning_after_cooldown_ends = "phar_sea_tribes_privileges_tooltip_achish_ceremony_warning_after_cooldown_ends",
				tooltip_achish_ceremony_warning_boat_already_central_tile = "phar_sea_tribes_privileges_tooltip_achish_ceremony_warning_boat_already_central_tile",
				tooltip_achish_ceremony_warning_cannot_afford = "phar_sea_tribes_privileges_tooltip_achish_ceremony_warning_cannot_afford",

				tile_effects_boat_returns_once_achish_ceremony_is_over = "phar_sea_tribes_privileges_tile_effects_boat_returns_once_achish_ceremony_is_over",

				tooltip_sources_list_major_settlement = "ui_text_replacements_localised_text_hp_title_major_settlement",
				tooltip_sources_list_minor_settlement = "ui_text_replacements_localised_text_hp_title_minor_settlement",
				tooltip_sources_list_settlement_tier = {
					[1] = "ui_text_replacements_localised_text_phar_local_deities_favour_income_tier_1",
					[2] = "ui_text_replacements_localised_text_phar_local_deities_favour_income_tier_2",
					[3] = "ui_text_replacements_localised_text_phar_local_deities_favour_income_tier_3",
					[4] = "ui_text_replacements_localised_text_phar_local_deities_favour_income_tier_4",
					[5] = "ui_text_replacements_localised_text_phar_local_deities_favour_income_tier_5",
				},

				tooltip_sovereignty_title_grant = "random_localisation_strings_string_phar_sea_tribes_privileges_tooltip_heading_sovereignty_grant",
				tooltip_sovereignty_title_revoke = "random_localisation_strings_string_phar_sea_tribes_privileges_tooltip_heading_sovereignty_revoke",
				tooltip_sovereignty_description_horde_ers_grant = "random_localisation_strings_string_phar_sea_tribes_privileges_tooltip_description_horde_dwelling_ers_negate",
				tooltip_sovereignty_description_horde_ers_revoke = "random_localisation_strings_string_phar_sea_tribes_privileges_tooltip_description_horde_dwelling_ers_restore",
				tooltip_sovereignty_description_settled_ers_grant = "random_localisation_strings_string_phar_sea_tribes_privileges_tooltip_description_settled_dwelling_ers_negate",
				tooltip_sovereignty_description_settled_ers_revoke = "random_localisation_strings_string_phar_sea_tribes_privileges_tooltip_description_settled_dwelling_ers_restore",
				tooltip_sovereignty_description_settlement_grant = "random_localisation_strings_string_phar_sea_tribes_privileges_tooltip_description_settled_dwelling_settlement_negate",
				tooltip_sovereignty_description_settlement_revoke = "random_localisation_strings_string_phar_sea_tribes_privileges_tooltip_description_settled_dwelling_settlement_restore",
				tooltip_sovereignty_info_ers = "ui_text_replacements_localised_text_phar_sea_outpost_id_sovereign_outpost",
				tooltip_sovereignty_info_settlement = "ui_text_replacements_localised_text_phar_sea_settlement_id_sovereign_settlement",
				tooltip_sovereignty_effects_title = "random_localisation_strings_string_phar_sea_tribes_privileges_tooltip_section_additional_effects",
				tooltip_sovereignty_negated_points_title = "random_localisation_strings_string_phar_sea_tribes_privileges_tooltip_section_negated_points",
				tooltip_sovereignty_restored_points_title = "random_localisation_strings_string_phar_sea_tribes_privileges_tooltip_section_restored_points",
				tooltip_sovereignty_settled_points_label = "random_localisation_strings_string_phar_sea_tribes_privileges_tooltip_section_dwelling_settled_label",
				tooltip_sovereignty_horde_points_label = "random_localisation_strings_string_phar_sea_tribes_privileges_tooltip_section_dwelling_horde_label",
				tooltip_sovereignty_grant_alert = "random_localisation_strings_string_phar_sea_tribes_privileges_tooltip_alert_sovereignty",
				tooltip_sovereignty_warning_cooldown = "random_localisation_strings_string_phar_sea_tribes_privileges_tooltip_warning_activation",
				tooltip_sovereignty_action = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_tooltip_achish_ceremony_action",

				tooltip_change_army_type_title_is_horde = "random_localisation_strings_string_phar_sea_tribes_privileges_tooltip_heading_phicol_grant",
				tooltip_change_army_type_title_is_settled = "random_localisation_strings_string_phar_sea_tribes_privileges_tooltip_heading_padi_grant",
				tooltip_change_army_type_description_is_horde = "random_localisation_strings_string_phar_sea_tribes_privileges_tooltip_description_military_force_army",
				tooltip_change_army_type_description_is_settled = "random_localisation_strings_string_phar_sea_tribes_privileges_tooltip_description_military_force_horde",
				tooltip_change_army_type_info_horde = "ui_text_replacements_localised_text_sea_tribes_privileges_army_id_horde",
				tooltip_change_army_type_info_settled = "ui_text_replacements_localised_text_sea_tribes_privileges_army_id_army",
				tooltip_change_army_type_warning_cooldown = "random_localisation_strings_string_phar_sea_tribes_privileges_tooltip_warning_activation",
				tooltip_change_army_type_action = "ui_text_replacements_localised_text_phar_sea_tribes_privileges_tooltip_achish_ceremony_action",

				sources_list_horde_force_item = "random_localisation_strings_string_phar_sea_tribes_privileges_horde_force",
				sources_list_settled_force_item = "random_localisation_strings_string_phar_sea_tribes_privileges_settled_force",
				sources_list_general_competences_item = "random_localisation_strings_string_phar_sea_tribes_privileges_general_competencies",
			},

			icon_paths = {
				dwelling_settled = "UI/Campaign UI/pooled_resources/settled_dwelling_point_big.png",
				dwelling_horde = "UI/Campaign UI/pooled_resources/horde_dwelling_point_big.png",
				blades_settled = "UI/Campaign UI/pooled_resources/settled_blades_points_big.png",
				blades_horde = "UI/Campaign UI/pooled_resources/horde_blades_point_big.png",
			},

			colour_codes = {
				green = "green",
				red = "red",
				cell_text_tagged_tooltip = "dark_r",
			},

			-- In which order things to be displayed in the sources list breakdown. Higher number is more to the top.
			source_list_item_type_display_priority = {
				character = 2,
				settlement = 2,
				ers = 1,
				unit = 1,
			},
		},
	},

	persistent = {
		factions = {
			--[[example format:
			["phar_sea_sherden"] = {
				current_cell_bundle_key = "phar_sea_effect_bundle_town_privileges_agriculturalists",
				num_turns_in_current_cell = 0,
				factors_table = {
					dwelling = {
						["factor2_key"] = {
							total = 50,
							sources = {
								{
									type = "force", -- "character", "force", "settlement" or "ers"
									cqi = 1337,
									amount = 322,
									unit_cqi = 420, -- optional, only there if the points come from a unit
								}
							},
						},
					},
					blades = {
						["factor1_key"] = { ... }, -- same as above
					},
				},
			},
			--]]
		},
		autonomous_regions = {	-- aka "sovereign" regions
			--example format:
			--["phar_sea_sherden"] = {
			--	["phar_main_alashiya_alashiya"] = {
			--		is_settlement_autonomous = true,	-- whether the settlement of the "phar_main_alashiya_alashiya" region, owned by the "phar_sea_sherden" faction, has autonomy
			--		autonomous_region_slots = {
			--			2,		-- autonomous nomad outpost/ers region slot, in the "phar_main_alashiya_alashiya" region, which is owned by the "phar_sea_sherden" faction
			--			5,		-- autonomous nomad outpost/ers region slot, in the "phar_main_alashiya_alashiya" region, which is owned by the "phar_sea_sherden" faction
			--		},
			--	},
			--},
		},
		achish_ceremony_stats = {
			--[[example format:
			["phar_sea_sherden"] = {
				remaining_duration = 4,
				remaining_cooldown = 6,
				bundle_key = "phar_sea_effect_bundle_town_privileges_cattlemen",
			},
			["phar_sea_peleset"] = {
				remaining_duration = 0,
				remaining_cooldown = 0,
				bundle_key = ""
			},
			--]]
		},
		pinned_cell = { -- tile (ui) === cell (model)
			--example format:
			--["phar_sea_sherden"] = "phar_sea_effect_bundle_town_privileges_shepherds",	-- store the bundle_key of the pinned cell
			--["phar_sea_peleset"] = "",
		},
		-- Used for autonomy and army type switching
		conversion_cooldowns = {
			character = { },
			settlement = { },
			ers = { },
			--[[
			character/ers/settlement = {
				[cqi] = 3, -- current cooldown
			},
			--]]
		},
		-- used to calculate dwelling & blades points difference in between before & after a battle
		pre_battle_points = {
			--[[example format:
			["phar_sea_peleset"] = {
				dwelling_points = -160,
				blades_points = -46,
			},
			--]]
		},
	},

	-- for session or temporary ui component storage and retrieval
	component_cache = {
	},

	temporary_garrison_region_key = "",
	temporary_garrison_slot_cqi = nil,


	-------------
	--- FUNCTIONS

	is_faction_applicable = function(faction_key)
		return is_string(faction_key)
			and is_sea_playable_faction(faction_key)
			and cm:get_faction(faction_key):is_human()
			and forge_path.is_system_unlocked_by_faction("tribes_privileges", faction_key)
	end,

	-- on the x axis
	get_dwelling_gradations = function()
		return table_size(tribes_privileges.config.cells, 1)
	end,

	-- on the y axis
	get_blades_gradations = function()
		return table_size(tribes_privileges.config.cells[1], 1)
	end,

	get_num_cells = function()
		return tribes_privileges.get_dwelling_gradations() * tribes_privileges.get_blades_gradations()
	end,

	get_cell_by_coords = function(x, y)
		if not tribes_privileges.assert_coords(x, y) then
			script_error("Invalid arguments!")
			return
		end

		return tribes_privileges.config.cells[y][x]
	end,

	points_to_coord = function(points, is_x)
		local num_gradations = tribes_privileges.get_dwelling_gradations()
		local points_limit = tribes_privileges.config.points_per_gradation * num_gradations / 2
		points = math.clamp(points, -points_limit, points_limit)

		local coord = math.floor(points / tribes_privileges.config.points_per_gradation)
		coord = coord + (num_gradations / 2) + 1
		coord = math.min(coord, num_gradations)

		if not is_x then
			coord = num_gradations + 1 - coord
		end

		return coord
	end,

	-- disambiguation: x_axis is the "dwelling points" axis but we iterate through its row using the y coordinate ("x", "y" are in reference to the Cartesian coordinate system)
	coord_to_points_range = function(coord, is_x_axis)
		local points_per_gradation = tribes_privileges.config.points_per_gradation
		local half_max_points = (tribes_privileges.get_dwelling_gradations() * points_per_gradation) / 2

		local points = ((coord - 1) * points_per_gradation) - half_max_points

		local min_max = {}
		if is_x_axis then
			min_max.min = points
			min_max.max = points + points_per_gradation
		else
			points = -points
			min_max.max = points
			min_max.min = points - points_per_gradation
		end

		if tribes_privileges.are_points_settled(min_max.min) then
			min_max.min = min_max.min + 1
			min_max.max = min_max.max
		else
			min_max.min = min_max.min
			min_max.max = min_max.max - 1
		end

		return min_max
	end,

	get_cell_points_range = function(cell)
		for y = 1, tribes_privileges.get_dwelling_gradations() do
			for x = 1, tribes_privileges.get_blades_gradations() do
				local current_cell = tribes_privileges.config.cells[y][x]
				if current_cell.display_name == cell.display_name then
					local dwelling_points_range = tribes_privileges.coord_to_points_range(x, true)
					local blades_points_range = tribes_privileges.coord_to_points_range(y, false)

					return {
						dwelling_min = dwelling_points_range.min,
						dwelling_max = dwelling_points_range.max,
						blades_min = blades_points_range.min,
						blades_max = blades_points_range.max,
					}
				end
			end
		end

		return nil
	end,

	assert_coords = function(x, y)
		return is_integer(x) and is_integer(y) and x >= 1 and y >= 1 and x <= tribes_privileges.get_dwelling_gradations() and y <= tribes_privileges.get_blades_gradations()
	end,

	get_cell_category_from_coords = function(x, y)
		if not tribes_privileges.assert_coords(x, y) then
			script_error("Invalid coordinates!")
			return ""
		end

		-- assume it's an equal size grid of even number of cells
		local grid_size = tribes_privileges.get_dwelling_gradations()
		local half_size = grid_size / 2

		-- top half
		if x <= half_size then
			if y <= half_size then
				return tribes_privileges.config.cell_categories.herdsmen
			else
				return tribes_privileges.config.cell_categories.farmers
			end
		else -- bottom half
			if y <= half_size then
				return tribes_privileges.config.cell_categories.raiders
			else
				return tribes_privileges.config.cell_categories.craftsmen
			end
		end

		return ""
	end,

	get_dwelling_points = function(faction_key)
		local faction = cm:get_faction(faction_key)
		local resource_key = tribes_privileges.config.resource_keys.dwelling
		return (faction and faction:has_pooled_resource(resource_key) and faction:pooled_resource(resource_key):value()) or 0
	end,

	get_blades_points = function(faction_key)
		local faction = cm:get_faction(faction_key)
		local resource_key = tribes_privileges.config.resource_keys.blades
		return (faction and faction:has_pooled_resource(resource_key) and faction:pooled_resource(resource_key):value()) or 0
	end,

	are_points_settled = function(points)
		return is_number(points) and points >= 0
	end,

	are_points_horde = function(points)
		return is_number(points) and points < 0
	end,

	generic_get_points = function(factors_table, comparison_func)
		local points = 0
		for _, factor in pairs(factors_table) do
			for _, source in ipairs(factor.sources) do
				if comparison_func(source.amount) then
					points = source.amount + points
				end
			end
		end
		return points
	end,

	get_settled_dwelling_points = function(faction_key)
		local faction_table = tribes_privileges.persistent.factions[faction_key] or {}
		local factors_table = faction_table.factors_table.dwelling or {}
		return tribes_privileges.generic_get_points(factors_table, tribes_privileges.are_points_settled)
	end,

	get_horde_dwelling_points = function(faction_key)
		local faction_table = tribes_privileges.persistent.factions[faction_key] or {}
		local factors_table = faction_table.factors_table.dwelling or {}
		return tribes_privileges.generic_get_points(factors_table, tribes_privileges.are_points_horde)
	end,

	get_settled_blades_points = function(faction_key)
		local faction_table = tribes_privileges.persistent.factions[faction_key] or {}
		local factors_table = faction_table.factors_table.blades or {}
		return tribes_privileges.generic_get_points(factors_table, tribes_privileges.are_points_settled)
	end,

	get_horde_blades_points = function(faction_key)
		local faction_table = tribes_privileges.persistent.factions[faction_key] or {}
		local factors_table = faction_table.factors_table.blades or {}
		return tribes_privileges.generic_get_points(factors_table, tribes_privileges.are_points_horde)
	end,

	get_cells_in_rectangle = function(first_cell_row, first_cell_col, last_cell_row, last_cell_col)
		if not tribes_privileges.assert_coords(first_cell_row, first_cell_col) or not tribes_privileges.assert_coords(last_cell_row, last_cell_col) then
			script_error("Invalid arguments!")
			return
		end

		if first_cell_row > last_cell_row then
			local temp_cell_row = first_cell_row
			first_cell_row = last_cell_row
			last_cell_row = temp_cell_row
		end

		if first_cell_col > last_cell_col then
			local temp_cell_col = first_cell_col
			first_cell_col = last_cell_col
			last_cell_col = temp_cell_col
		end

		local cells = {}
		for y = first_cell_row, last_cell_row do
			for x = first_cell_col, last_cell_col do
				local cell = tribes_privileges.config.cells[y][x]
				table.insert(cells, cell)
			end
		end

		return cells
	end,

	get_cell_by_bundle_key = function(bundle_key)
		for y = 1, tribes_privileges.get_dwelling_gradations() do
			for x = 1, tribes_privileges.get_blades_gradations() do
				local cell = tribes_privileges.config.cells[y][x]
				if cell.bundle_key == bundle_key then
					return cell
				end
			end
		end

		return nil
	end,

	get_cell_coords = function(cell)
		for y = 1, tribes_privileges.get_dwelling_gradations() do
			for x = 1, tribes_privileges.get_blades_gradations() do
				local current_cell = tribes_privileges.config.cells[y][x]
				if current_cell.display_name == cell.display_name then
					return y, x
				end
			end
		end

		return nil
	end,

	get_cell_coords_by_points = function(dwelling_points, blades_points)
		if not is_number(dwelling_points) or not is_number(blades_points) then
			script_error("Invalid arguments!")
			return
		end

		local x = tribes_privileges.points_to_coord(dwelling_points, true)
		local y = tribes_privileges.points_to_coord(blades_points, false)

		return x, y
	end,

	get_cell_by_points = function(dwelling_points, blades_points)
		local x, y = tribes_privileges.get_cell_coords_by_points(dwelling_points, blades_points)
		if not tribes_privileges.assert_coords(x, y) then
			script_error("Invalid coordinates!")
			return
		end

		return tribes_privileges.config.cells[y][x]
	end,

	get_cell_category_corner_cells = function(cell_category)
		local first_cell = {}
		local last_cell = {}
		if cell_category == tribes_privileges.config.cell_categories.herdsmen then -- ul
			first_cell.x = 1
			first_cell.y = 1
			last_cell.x = 4
			last_cell.y = 4
		elseif cell_category == tribes_privileges.config.cell_categories.farmers then -- ur
			first_cell.x = 1
			first_cell.y = 5
			last_cell.x = 4
			last_cell.y = 8
		elseif cell_category == tribes_privileges.config.cell_categories.raiders then -- bl
			first_cell.x = 5
			first_cell.y = 1
			last_cell.x = 8
			last_cell.y = 4
		elseif cell_category == tribes_privileges.config.cell_categories.craftsmen then -- br
			first_cell.x = 5
			first_cell.y = 5
			last_cell.x = 8
			last_cell.y = 8
		end

		return first_cell, last_cell
	end,

	get_central_cell_coords_by_category = function(cell_category)
		local central_cell_coords = {}
		if cell_category == tribes_privileges.config.cell_categories.herdsmen then
			central_cell_coords.x = 4
			central_cell_coords.y = 4
		elseif cell_category == tribes_privileges.config.cell_categories.farmers then
			central_cell_coords.x = 4
			central_cell_coords.y = 5
		elseif cell_category == tribes_privileges.config.cell_categories.raiders then
			central_cell_coords.x = 5
			central_cell_coords.y = 4
		elseif cell_category == tribes_privileges.config.cell_categories.craftsmen then
			central_cell_coords.x = 5
			central_cell_coords.y = 5
		end

		return central_cell_coords
	end,

	get_central_cell_of_category = function(cell_category)
		local central_cell_coords = tribes_privileges.get_central_cell_coords_by_category(cell_category)
		return central_cell_coords and tribes_privileges.config.cells[central_cell_coords.x][central_cell_coords.y]
	end,

	is_achish_ceremony_valid = function(faction_key)
		local achish_ceremony_stats = tribes_privileges.persistent.achish_ceremony_stats[faction_key]
		return (not is_nil(achish_ceremony_stats))
			, achish_ceremony_stats
	end,

	-- the achish ceremony is active for a specific faction, if the faction's current cell effects are influenced from the achish-ceremony and this happens so long as remaining_duration is greater than 0
	is_achish_ceremony_active = function(faction_key)
		local is_valid, achish_ceremony_stats = tribes_privileges.is_achish_ceremony_valid(faction_key)
		return (is_valid and achish_ceremony_stats.remaining_duration > 0) or false
			, achish_ceremony_stats
	end,

	-- the current cell of a faction is updated on turn start (or on system unlock), but the dwelling & blades points are updated dynamically
	-- 	to get the cell that corresponds to said up-to-the-minute points use `get_predicted_cell` function
	get_current_cell = function(faction_key)
		local is_active, ceremony_stats = tribes_privileges.is_achish_ceremony_active(faction_key)
		return tribes_privileges.get_cell_by_bundle_key(is_active and ceremony_stats.bundle_key or tribes_privileges.persistent.factions[faction_key].current_cell_bundle_key)
	end,

	-- use get_predicted_cell when you want to query the cell that corresponds to the up-to-date points of the faction in question
	get_predicted_cell = function(faction_key)
		return tribes_privileges.get_cell_by_points(tribes_privileges.get_dwelling_points(faction_key), tribes_privileges.get_blades_points(faction_key))
	end,

	get_current_cell_category = function(faction_key)
		local current_cell = tribes_privileges.get_current_cell(faction_key)
		local x, y = tribes_privileges.get_cell_coords(current_cell)
		return tribes_privileges.get_cell_category_from_coords(x, y)
	end,

	get_central_cell_of_faction = function(faction_key)
		local cell_category = tribes_privileges.get_current_cell_category(faction_key)
		return tribes_privileges.get_central_cell_of_category(cell_category)
	end,

	is_central_cell = function(cell)
		local x, y = tribes_privileges.get_cell_coords(cell)
		if not x then
			script_error("Invalid cell coordinates!")
			return false
		end

		-- assume it's an equal size grid of even number of cells
		local grid_size = tribes_privileges.get_dwelling_gradations()
		local lower_half_coord = grid_size / 2
		local upper_half_coord = lower_half_coord + 1

		--	cell_coords = x,y
		--
		--	-|----|---|-
		--	 |4,4 |4,5|
		--	-|----|---|-
		--	 |5,4 |5,5|
		--	-|----|---|-
		--
		return (x == lower_half_coord and y == lower_half_coord) or (x == upper_half_coord and y == upper_half_coord)
				or (x == lower_half_coord and y == upper_half_coord) or (x == upper_half_coord and y == lower_half_coord)
	end,

	apply_effects_to_force = function(force, should_apply)
		if not force or force:is_null_interface() then
			script_error("Invalid force interface!")
			return
		end

		local force_cqi = force:command_queue_index()
		if should_apply then
			local force_type = force:force_type()
			if table_contains(settled_force_types, force_type) then
				-- the force is settled
				cm:remove_effect_bundle_from_force(tribes_privileges.config.horde_force_bundle, force_cqi)
				cm:apply_effect_bundle_to_force(tribes_privileges.config.settled_force_bundle, force_cqi, 0)
			elseif table_contains(horde_force_types, force_type) then
				-- the force is horde
				cm:remove_effect_bundle_from_force(tribes_privileges.config.settled_force_bundle, force_cqi)
				cm:apply_effect_bundle_to_force(tribes_privileges.config.horde_force_bundle, force_cqi, 0)
			end
		else
			cm:remove_effect_bundle_from_force(tribes_privileges.config.settled_force_bundle, force_cqi)
			cm:remove_effect_bundle_from_force(tribes_privileges.config.horde_force_bundle, force_cqi)
		end

		cm:set_script_state(force, "army_type_effects_applied", should_apply)
	end,

	-- if `should_apply` is true then apply T&P effect-bundles to military forces of `faction` as applicable, otherwise remove them
	apply_effects_to_forces_of_faction = function(faction, should_apply)
		local military_force_list = faction:military_force_list()
		local last_force_index = military_force_list:num_items() - 1
		for i = 0, last_force_index do
			tribes_privileges.apply_effects_to_force(military_force_list:item_at(i), should_apply)
		end
	end,

	on_turn_start = function(faction_key)
		tribes_privileges.process_autonomy_privileges(faction_key)
		tribes_privileges.process_achish_ceremony(faction_key)
		tribes_privileges.calculate_points(faction_key)
		tribes_privileges.update_cell_for_faction(faction_key)
	end,

	calculate_points = function(faction_key)
		tribes_privileges.calculate_dwelling_points(faction_key)
		tribes_privileges.calculate_blades_points(faction_key)

		local new_dwelling_points = tribes_privileges.get_dwelling_points(faction_key)
		cm:notify_tribes_privileges_dwelling_points(new_dwelling_points)

		local new_blades_points = tribes_privileges.get_blades_points(faction_key)
		cm:notify_tribes_privileges_blades_points(new_blades_points)
	end,

	calculate_dwelling_points = function(faction_key)
		local current_dwelling_points = 0
		tribes_privileges.persistent.factions[faction_key].factors_table.dwelling = {}
		local factors_table = tribes_privileges.persistent.factions[faction_key].factors_table.dwelling

		for _, settled_or_horde in pairs(tribes_privileges.config.factors.dwelling) do
			for _, factor_key in pairs(settled_or_horde) do
				factors_table[factor_key] = { total = 0, sources = {} }
			end
		end

		local faction = cm:get_faction(faction_key)

		-- dwelling points from military forces
		local military_force_list = faction:military_force_list()
		local last_force_index = military_force_list:num_items() - 1
		for i = 0, last_force_index do
			local force = military_force_list:item_at(i)
			current_dwelling_points = current_dwelling_points + tribes_privileges.calculate_dwelling_points_for_force(force, factors_table)
		end

		-- dwelling points from settlements
		local region_list = faction:region_list()
		local last_region_index = region_list:num_items() - 1
		for i = 0, last_region_index do
			local region = region_list:item_at(i)
			if not tribes_privileges.is_autonomous_settlement(faction_key, region:name()) then
				current_dwelling_points = current_dwelling_points + tribes_privileges.calculate_dwelling_points_for_settlement(region, factors_table)
			end
		end

		-- dwelling points from ERSs
		local ers_dwelling_points = tribes_privileges.calculate_dwelling_points_for_faction_from_ers(faction_key, factors_table)
		current_dwelling_points = current_dwelling_points + ers_dwelling_points

		local resource_key = tribes_privileges.config.resource_keys.dwelling
		local pooled_resource = faction:pooled_resource(resource_key)
		local factors = pooled_resource:factors()

		-- Add/remove points to whatever factors we've gained/lost from since last turn
		cm:iterate(function(factor)
			local unique_factor_id = factor:factor_id()
			local factor_key = tribes_privileges.config.factor_unique_id_to_factor_key[unique_factor_id]
			if factor_key and factors_table[factor_key] then
				local difference = factors_table[factor_key].total - factor:value()
				if difference ~= 0 then
					cm:faction_add_pooled_resource(faction_key, resource_key, factor_key, difference)
				end
			end
		end, factors)

		if current_dwelling_points ~= pooled_resource:value() then
			script_error("Tribes and Privileges: ERROR, for some reason current dwelling points are desynced in the model!")
		end
	end,

	calculate_dwelling_points_for_settlement = function(region, factors_table)
		local settlement = region:settlement()
		if not settlement or settlement:is_null_interface() then
			script_error("invalid settlement!")
			return 0
		end

		local main_building_level = tribes_privileges.get_main_building_level_of_settlement(settlement)
		if not main_building_level or main_building_level > #tribes_privileges.config.dwelling_points_of_minor_settlement_per_main_building_level then
			return 0
		end

		local main_building_points = tribes_privileges.config.dwelling_points_of_minor_settlement_per_main_building_level[main_building_level]

		local is_major_settlement = region:is_province_capital()
		local dwelling_points = (is_major_settlement and (math.round(main_building_points * tribes_privileges.config.dwelling_points_of_major_settlement_multiplier))) or main_building_points
		if factors_table and dwelling_points ~= 0 then
			local factor_key = tribes_privileges.config.factors.dwelling.settled.building
			local factor_table = factors_table[factor_key]
			factor_table.total = dwelling_points + factor_table.total
			table.insert(factor_table.sources, { type = "settlement", cqi = settlement:command_queue_index(), amount = dwelling_points })
		end
		return dwelling_points
	end,

	get_main_building_level_of_settlement = function(settlement)
		if not settlement or settlement:is_null_interface() then
			script_error("Invalid settlement!")
			return nil
		end

		local slot_list = settlement:slot_list()
		if slot_list:num_items() <= 0 then
			script_error("Settlement has no valid slots!")
			return nil
		end

		local slot = slot_list:item_at(0)
		if not slot or slot:is_null_interface() then
			script_error("Invalid slot!")
			return nil
		end

		if not slot:has_building() then
			return nil
		end

		local building = slot:building()
		if not building or building:is_null_interface() then
			script_error("Invalid building!")
			return nil
		end

		return building:level()
	end,

	calculate_dwelling_points_for_specific_ers = function(faction_key, region_slot, factors_table)
		local is_ers_slot = region_slot:is_infrastructure_slot()
		local has_finished_construction = region_slot:has_building()
		local slot_owning_faction_key = region_slot:faction():name()

		local factor_key
		local points = 0

		if is_ers_slot and has_finished_construction and slot_owning_faction_key == faction_key then
			local region_key = region_slot:region():name()
			local building = region_slot:building()
			local region_slot_index = tribes_privileges.get_ers_slot_index(region_slot)
			local is_autonomous = tribes_privileges.is_autonomous_ers(faction_key, region_key, region_slot_index)
			if not is_autonomous then
				if tribes_privileges.is_nomad_outpost_ers(building) then
					factor_key = tribes_privileges.config.factors.dwelling.horde.ers
					points = tribes_privileges.config.dwelling_points_per_nomad_outpost_ers
				elseif tribes_privileges.is_settled_ers(building) then
					factor_key = tribes_privileges.config.factors.dwelling.settled.ers
					points = tribes_privileges.config.dwelling_points_per_settled_ers
				end
			end
		end

		if factors_table and factor_key and points ~= 0 then
			local factor_table = factors_table[factor_key]
			factor_table.total = points + factor_table.total
			table.insert(factor_table.sources, { type = "ers", cqi = region_slot:command_queue_index(), amount = points })
		end

		return points
	end,

	calculate_dwelling_points_for_faction_from_ers = function(faction_key, factors_table)
		local points = 0

		local region_list = cm:model():world():region_manager():region_list()
		local last_region_index = region_list:num_items() - 1
		for i = 0, last_region_index do
			local region = region_list:item_at(i)
			local region_slots = region:slot_list()
			local last_region_slot_index = region_slots:num_items() - 1
			for region_slot_index = 0, last_region_slot_index do
				local region_slot = region_slots:item_at(region_slot_index)
				points = points + tribes_privileges.calculate_dwelling_points_for_specific_ers(faction_key, region_slot, factors_table)
			end
		end

		return points
	end,

	calculate_dwelling_points_for_force = function(force, factors_table)
		if not force or force:is_null_interface() then
			return 0
		end

		if tribes_privileges.is_horde_type(force) and tribes_privileges.does_force_contribute_to_points(force) then
			if factors_table then
				local factor_key = tribes_privileges.config.factors.dwelling.horde.building
				local factor_table = factors_table[factor_key]
				local amount = tribes_privileges.config.dwelling_points_per_horde_force
				factor_table.total = amount + factor_table.total
				table.insert(factor_table.sources, { type = "force", cqi = force:command_queue_index(), amount = amount })
			end
			return tribes_privileges.config.dwelling_points_per_horde_force
		end

		return 0
	end,

	calculate_num_nomad_outposts_of_faction = function(faction_key)
		local num_nomad_outposts = 0

		local region_list = cm:model():world():region_manager():region_list()
		local last_region_index = region_list:num_items() - 1
		for i = 0, last_region_index do
			local region = region_list:item_at(i)
			num_nomad_outposts = num_nomad_outposts + tribes_privileges.calculate_num_nomad_outposts_of_faction_in_region(faction_key, region)
		end

		return num_nomad_outposts
	end,

	calculate_num_nomad_outposts_of_faction_in_own_territory = function(faction_key)
		local faction = cm:get_faction(faction_key)
		if not faction or faction:is_null_interface() then
			return
		end

		local num_nomad_outposts = 0

		local region_list = faction:region_list()
		local last_region_index = region_list:num_items() - 1
		for i = 0, last_region_index do
			local region = region_list:item_at(i)
			num_nomad_outposts = num_nomad_outposts + tribes_privileges.calculate_num_nomad_outposts_of_faction_in_region(faction_key, region)
		end

		return num_nomad_outposts
	end,

	calculate_num_nomad_outposts_of_faction_in_razed_territory = function(faction_key)
		local num_nomad_outposts = 0

		local region_list = cm:model():world():region_manager():region_list()
		local last_region_index = region_list:num_items() - 1
		for i = 0, last_region_index do
			local region = region_list:item_at(i)
			if region:is_abandoned() then
				num_nomad_outposts = num_nomad_outposts + tribes_privileges.calculate_num_nomad_outposts_of_faction_in_region(faction_key, region)
			end
		end

		return num_nomad_outposts
	end,

	calculate_num_nomad_outposts_of_faction_in_foreign_territory = function(faction_key)
		local num_nomad_outposts = 0

		local region_list = cm:model():world():region_manager():region_list()
		local last_region_index = region_list:num_items() - 1
		for i = 0, last_region_index do
			local region = region_list:item_at(i)
			local region_owning_faction_key = region:owning_faction():name()
			if region_owning_faction_key ~= faction_key then
				num_nomad_outposts = num_nomad_outposts + tribes_privileges.calculate_num_nomad_outposts_of_faction_in_region(faction_key, region)
			end
		end

		return num_nomad_outposts
	end,

	calculate_num_nomad_outposts_of_faction_in_region = function(faction_key, region)
		local num_nomad_outposts = 0

		local region_slots = region:slot_list()
		local last_region_slot_index = region_slots:num_items() - 1
		for region_slot_index = 0, last_region_slot_index do
			local region_slot = region_slots:item_at(region_slot_index)
			local is_ers_slot = region_slot:is_infrastructure_slot()
			local has_finished_construction = region_slot:has_building()
			local slot_owning_faction_key = region_slot:faction():name()
			if is_ers_slot and has_finished_construction and slot_owning_faction_key == faction_key then
				local building = region_slot:building()
				if tribes_privileges.is_nomad_outpost_ers(building) then
					num_nomad_outposts = num_nomad_outposts + 1
				end
			end
		end

		return num_nomad_outposts
	end,

	calculate_blades_points = function(faction_key)
		local current_blades_points = 0
		tribes_privileges.persistent.factions[faction_key].factors_table.blades = {}
		local factors_table = tribes_privileges.persistent.factions[faction_key].factors_table.blades

		for _, settled_or_horde in pairs(tribes_privileges.config.factors.blades) do
			for _, factor_key in pairs(settled_or_horde) do
				factors_table[factor_key] = { total = 0, sources = {} }
			end
		end

		-- blade points from generals
		local faction = cm:get_faction(faction_key)
		local character_list = faction:character_list()
		local last_character_index = character_list:num_items() - 1
		for i = 0, last_character_index do
			current_blades_points = current_blades_points + tribes_privileges.calculate_blades_points_for_general(character_list:item_at(i), factors_table)
		end

		-- blade points from military forces
		local military_force_list = faction:military_force_list()
		local last_force_index = military_force_list:num_items() - 1
		for i = 0, last_force_index do
			local force = military_force_list:item_at(i)
			if force and not force:is_null_interface() and tribes_privileges.does_force_contribute_to_points(force) then
				local unit_list = force:unit_list()
				local last_unit_index = unit_list:num_items() - 1
				for j = 0, last_unit_index do
					current_blades_points = current_blades_points + tribes_privileges.calculate_blades_points_for_unit(force, unit_list:item_at(j), factors_table)
				end
			end
		end

		local resource_key = tribes_privileges.config.resource_keys.blades
		local pooled_resource = faction:pooled_resource(resource_key)
		local factors = pooled_resource:factors()

		-- Add/remove points to whatever factors we've gained/lost from since last turn
		cm:iterate(function(factor)
			local unique_factor_id = factor:factor_id()
			local factor_key = tribes_privileges.config.factor_unique_id_to_factor_key[unique_factor_id]
			if factor_key and factors_table[factor_key] then
				local difference = factors_table[factor_key].total - factor:value()
				if difference ~= 0 then
					cm:faction_add_pooled_resource(faction_key, resource_key, factor_key, difference)
				end
			end
		end, factors)

		if current_blades_points ~= pooled_resource:value() then
			script_error("for some reason current blades points are desynced in the model!")
		end
	end,

	get_character_num_competencies = function(character)
		-- Subtracting 1 competency per attribute as the characters start with 1 point
		-- in all skills that does not give effects and is not visualised
		local level_authority = character:attribute_level("authority") - 1
		local level_zeal = character:attribute_level("zeal") - 1
		local level_subterfuge = character:attribute_level("subterfuge") - 1

		return level_authority + level_zeal + level_subterfuge
	end,

	calculate_blades_points_for_general = function(character, factors_table)
		if not character or character:is_null_interface() or not cm:char_is_general_with_army(character) then
			return 0
		end

		local force_factor = nil
		local competency_factor = nil
		local force_points = 0
		local competency_points = 0

		local num_competencies = tribes_privileges.get_character_num_competencies(character)

		if tribes_privileges.is_horde_type(character:military_force()) then
			force_factor = tribes_privileges.config.factors.blades.horde.military_force
			competency_factor = tribes_privileges.config.factors.blades.horde.general_competency
			force_points = tribes_privileges.config.blades_points_per_horde_force
			competency_points = num_competencies * tribes_privileges.config.blades_points_per_horde_general_competency
		else
			force_factor = tribes_privileges.config.factors.blades.settled.military_force
			competency_factor = tribes_privileges.config.factors.blades.settled.general_competency
			force_points = tribes_privileges.config.blades_points_per_settled_force
			competency_points = num_competencies * tribes_privileges.config.blades_points_per_settled_general_competency
		end

		if factors_table then
			local force_table = factors_table[force_factor]
			force_table.total = force_points + force_table.total
			table.insert(force_table.sources, { type = "character", cqi = character:command_queue_index(), amount = force_points })

			local competency_table = factors_table[competency_factor]
			competency_table.total = competency_points + competency_table.total
			table.insert(competency_table.sources, { type = "character", cqi = character:command_queue_index(), amount = competency_points })
		end

		return force_points + competency_points
	end,

	does_force_contribute_to_points = function(force)
		if not force:is_armed_citizenry() then
			return true
		end

		return tribes_privileges.config.include_fort_units_in_scales and (force:garrison_residence() and not force:garrison_residence():is_settlement())
	end,

	calculate_blades_points_for_unit = function(military_force, unit, factors_table)
		local blades_points = tribes_privileges.get_blades_points_for_unit(unit:unit_key())
		local tier = unit:tier()

		if factors_table and blades_points ~= 0 then
			local unit_cqi = unit:command_queue_index()
			local factor_key
			if blades_points > 0 then
				if tier < 4 then
					factor_key = tribes_privileges.config.factors.blades.settled.units
				else
					factor_key = tribes_privileges.config.factors.blades.settled.units_high_tier
				end
			else
				if tier < 4 then
					factor_key = tribes_privileges.config.factors.blades.horde.units
				else
					factor_key = tribes_privileges.config.factors.blades.horde.units_high_tier
				end
			end

			local factor_table = factors_table[factor_key]
			factor_table.total = blades_points + factor_table.total
			table.insert(factor_table.sources,
				{
					type = "force",
					cqi = military_force:command_queue_index(),
					amount = blades_points,
					unit_cqi = unit_cqi,
				})
		end

		return blades_points
	end,

	get_blades_points_for_unit = function(unit_key)
		local blades_points = 0

		local unit_points = tribes_privileges.config.blades_points_for_unit_keys[unit_key]
		if unit_points then
			blades_points = unit_points
		elseif cm:unit_belongs_to_unit_set(unit_key, tribes_privileges.config.elite_horde_unit_set) then
			blades_points = tribes_privileges.config.blades_points_per_elite_horde_unit
		elseif cm:unit_belongs_to_unit_set(unit_key, tribes_privileges.config.elite_settled_unit_set) then
			blades_points = tribes_privileges.config.blades_points_per_elite_settled_unit
		elseif cm:unit_belongs_to_unit_set(unit_key, tribes_privileges.config.horde_unit_set) then
			blades_points = tribes_privileges.config.blades_points_per_horde_unit
		elseif cm:unit_belongs_to_unit_set(unit_key, tribes_privileges.config.settled_unit_set) then
			blades_points = tribes_privileges.config.blades_points_per_settled_unit
		end

		return blades_points
	end,

	get_points_for_general = function(character)
		local faction_key = character:faction():name()
		if not character or character:is_null_interface() or not cm:char_is_general_with_army(character) or not tribes_privileges.is_faction_applicable(faction_key) then
			return nil
		end

		local dwelling_points = 0
		local blades_points = 0

		local force = character:military_force()

		-- dwelling points from character
		local num_competencies = tribes_privileges.get_character_num_competencies(character)
		if tribes_privileges.is_horde_type(force) then
			dwelling_points = num_competencies * tribes_privileges.config.blades_points_per_horde_general_competency
		else
			dwelling_points = num_competencies * tribes_privileges.config.blades_points_per_settled_general_competency
		end

		-- dwelling points from force
		if not tribes_privileges.does_force_contribute_to_points(force) then
			return dwelling_points, blades_points
		end

		if tribes_privileges.is_horde_type(force) then
			dwelling_points = dwelling_points + tribes_privileges.config.dwelling_points_per_horde_force
		end

		-- blades points from force
		local unit_list = force:unit_list()
		local last_unit_index = unit_list:num_items() - 1
		for i = 0, last_unit_index do
			blades_points = blades_points + tribes_privileges.get_blades_points_for_unit(unit_list:item_at(i):unit_key())
		end

		return dwelling_points, blades_points
	end,

	-- unused
	get_points_for_unit = function(unit_key)
		if not is_string(unit_key) or unit_key == "" then
			return
		end

		local dwelling_points = 0
		local blades_points = tribes_privileges.get_blades_points_for_unit(unit_key)
		return dwelling_points, blades_points
	end,

	-- unused
	get_points_for_region = function(region, faction_key)
		local dwelling_points, blades_points = tribes_privileges.get_points_for_settlement(region, faction_key, region:owning_faction():name() == faction_key)

		local region_slots = region:slot_list()
		local last_region_slot_index = region_slots:num_items() - 1
		for region_slot_index = 0, last_region_slot_index do
			local current_dwelling_points, current_blades_points = tribes_privileges.get_points_for_ers(region, region_slots:item_at(region_slot_index), faction_key)
			dwelling_points = dwelling_points + current_dwelling_points
			blades_points = blades_points + current_blades_points
		end

		return dwelling_points, blades_points
	end,

	--- @function get_points_for_settlement
	--- @desc this function queries the dwelling & blades points for a given settlement
	--- @p object region: the requested region
	--- @p string faction_key: the faction's key for which the points are to be considered
	--- @p bool ignore_autonomy: whether to ignore the autonomy/sovereignty status of the settlement in the points calculation
	--- @p [opt=0] integer main_building_level_change: if this parameter is supplied then the points are calculated for the settlement with main building level modified by this specified amount
	--- @return 2 integer numbers: dwelling_points, blades_points
	get_points_for_settlement = function(region, faction_key, ignore_autonomy, main_building_level_change)
		if not is_number(main_building_level_change) then
			main_building_level_change = 0
		end

		local dwelling_points = 0
		local blades_points = 0

		if region:owning_faction():name() == faction_key and not ignore_autonomy and tribes_privileges.is_autonomous_settlement(faction_key, region:name()) then
			return dwelling_points, blades_points
		end

		local main_building_level = tribes_privileges.get_main_building_level_of_settlement(region:settlement())
		main_building_level = main_building_level ~= 0 and math.max(main_building_level + main_building_level_change, 1) or 0
		if main_building_level and main_building_level < #tribes_privileges.config.dwelling_points_of_minor_settlement_per_main_building_level then
			dwelling_points = tribes_privileges.config.dwelling_points_of_minor_settlement_per_main_building_level[main_building_level]
		end

		local is_major_settlement = region:is_province_capital()
		return ((is_major_settlement and (math.round(dwelling_points * tribes_privileges.config.dwelling_points_of_major_settlement_multiplier))) or dwelling_points)
			, blades_points
	end,

	get_points_for_ers = function(region, region_slot, faction_key, ignore_autonomy)
		local dwelling_points = 0
		local blades_points = 0

		local is_ers_slot = region_slot:is_infrastructure_slot()
		local has_finished_construction = region_slot:has_building()
		local slot_owning_faction_key = region_slot:faction():name()
		local should_check_for_autonomy = not ignore_autonomy and slot_owning_faction_key == faction_key
		if is_ers_slot and has_finished_construction then
			local region_key = region:name()
			local building = region_slot:building()
			local is_autonomous = should_check_for_autonomy and tribes_privileges.is_autonomous_ers(slot_owning_faction_key, region_key, tribes_privileges.get_ers_slot_index(region_slot))
			if not is_autonomous then
				if tribes_privileges.is_nomad_outpost_ers(building) then
					dwelling_points = tribes_privileges.config.dwelling_points_per_nomad_outpost_ers
				elseif tribes_privileges.is_settled_ers(building) then
					dwelling_points = tribes_privileges.config.dwelling_points_per_settled_ers
				end
			end
		end

		return dwelling_points, blades_points
	end,

	is_horde_type = function(force)
		return table_contains(horde_force_types, force:force_type())
	end,

	is_horde_type_string = function(force_type_key)
		return table_contains(horde_force_types, force_type_key)
	end,

	toggle_force_type = function(general_character)
		local force = general_character:military_force()
		local faction_key = general_character:faction():name()

		local cqi = general_character:command_queue_index()
		local cooldown = tribes_privileges.persistent.conversion_cooldowns.character[cqi] or 0
		if cooldown > 0 then
			script_error("For some reason trying to change army type for character cqi = " .. tostring(cqi) .. " that has a cooldown = " .. tostring(cooldown))
			return
		end
		tribes_privileges.persistent.conversion_cooldowns.character[cqi] = tribes_privileges.config.army_type_swap_cooldown

		local previous_force_type = force:force_type()
		local new_force_type = ""
		if table_find(horde_force_types, previous_force_type) then
			local index = table_find(horde_force_types, previous_force_type, true)
			new_force_type = settled_force_types[index]
		elseif table_find(settled_force_types, previous_force_type) then
			local index = table_find(settled_force_types, previous_force_type, true)
			new_force_type = horde_force_types[index]
		else
			script_error("force with type '" .. previous_force_type ..  "' not compatible!")
			return
		end

		cm:convert_force_to_type(general_character, new_force_type)

		if force:force_type() == new_force_type then
			if table_find(horde_force_types, new_force_type) then
				cm:notify_tribes_privileges_settled_to_horde_general_conversion_triggered()
			elseif table_find(settled_force_types, new_force_type) then
				cm:notify_tribes_privileges_horde_to_settled_general_conversion_triggered()
			end
		else
			script_error("Cannot switch the type of force, with cqi '" .. force:command_queue_index() .. "', from: '" .. previous_force_type .. "' to: '" .. new_force_type .. "'!")
			return
		end

		tribes_privileges.apply_effects_to_force(force, true)

		output("switched the type of force, with cqi '" .. force:command_queue_index() .. "', from: '" .. previous_force_type .. "' to: '" .. new_force_type .. "'.")
		return true
	end,

	is_nomad_outpost_ers = function(building)
		if not building or building:is_null_interface() then
			return false
		end
		return building:belongs_to_building_set(tribes_privileges.config.nomad_outpost_ers_building_set)
	end,

	is_settled_ers = function(building)
		if not building or building:is_null_interface() then
			return false
		end

		for i = 1, #tribes_privileges.config.settled_ers_building_sets do
			local building_set = tribes_privileges.config.settled_ers_building_sets[i]
			if building:belongs_to_building_set(building_set) then
				return true
			end
		end

		return false
	end,

	--- @function process_autonomy_privileges
	--- @desc this function is called every turn instead of dynamically responding to the 2 events "RegionFactionChangeEvent" and "CharacterPerformsRegionSlotOccupationDecision"
	---	      it tends to the autonomous regions and nomad outposts and ensures that the tribes_privileges.persistent.autonomous_regions[faction_key] table is adhering to the model
	--- @p faction_key string: the faction's key
	process_autonomy_privileges = function(faction_key)
		local autonomous_regions = tribes_privileges.persistent.autonomous_regions[faction_key]
		for region_key, region_autonomy in dpairs(autonomous_regions) do
			local invalidated = false

			local region = cm:get_region(region_key)
			-- ensure the faction still owns this settlement; otherwise remove the settlement registration from region_autonomy
			if region_autonomy.is_settlement_autonomous then
				local region_owning_faction_key = region:owning_faction():name()
				if region_owning_faction_key ~= faction_key then
					tribes_privileges.set_region_autonomy(faction_key, region_key, false)
					invalidated = true
				end
			end

			-- ensure the saved autonomous ERSs are still owned by the faction; otherwise remove their registrations from region_autonomy
			if tribes_privileges.has_ers_autonomy(faction_key, region_key) then
				local region_slots = region:slot_list()
				local last_region_slot_index = region_slots:num_items() - 1
				for region_slot_index = 0, last_region_slot_index do
					local region_slot = region_slots:item_at(region_slot_index)
					local is_ers_slot = region_slot:is_infrastructure_slot()
					local slot_owning_faction_key = region_slot:faction():name()
					if is_ers_slot and tribes_privileges.is_autonomous_ers(faction_key, region_key, region_slot_index) and slot_owning_faction_key ~= faction_key then
						tribes_privileges.set_region_autonomy(faction_key, region_key, false, region_slot_index)
						invalidated = true
					end
				end
			end

			if invalidated
				and tribes_privileges.persistent.autonomous_regions[faction_key][region_key]	-- sanity check (shouldn't be required)
			then
				local should_erase = (not tribes_privileges.persistent.autonomous_regions[faction_key][region_key].is_settlement_autonomous) and not tribes_privileges.has_ers_autonomy(faction_key, region_key)
				if should_erase then
					tribes_privileges.persistent.autonomous_regions[faction_key][region_key] = nil
				end
			end
		end
	end,

	get_region_autonomy = function(faction_key, region_key)
		return tribes_privileges.persistent.autonomous_regions[faction_key] and tribes_privileges.persistent.autonomous_regions[faction_key][region_key] or nil
	end,

	is_autonomous_settlement = function(faction_key, region_key)
		local region_autonomy = tribes_privileges.get_region_autonomy(faction_key, region_key)
		return region_autonomy and region_autonomy.is_settlement_autonomous or false
	end,

	is_autonomous_ers = function(faction_key, region_key, region_slot_index)
		local region_autonomy = tribes_privileges.get_region_autonomy(faction_key, region_key)
		return region_autonomy and (is_table(region_autonomy.autonomous_region_slots) and table_contains(region_autonomy.autonomous_region_slots, region_slot_index)) or false
	end,

	-- returns the amount of autonomous ERSs for the specified faction in the specified region
	-- returns false if the specified faction has no ers with autonomy privileges in the specified region
	has_ers_autonomy = function(faction_key, region_key)
		local region_autonomy = tribes_privileges.get_region_autonomy(faction_key, region_key)
		if not region_autonomy or not is_table(region_autonomy.autonomous_region_slots) then
			return false
		end

		local num_nomad_outposts = table_size(region_autonomy.autonomous_region_slots)
		return (num_nomad_outposts > 0) and num_nomad_outposts or false
	end,

	--- @function set_region_autonomy
	--- @desc the function adds or removes autonomy from a region's settlement or ers
	--- @p string faction_key: the faction's database key
	--- @p string region_key: the region's database key
	--- @p boolean make_autonomous: if true we set autonomy on a settlement or ers, if false we remove autonomy from a settlement or ers
	--- @p [opt=nil] integer ers_slot_index: if supplied then a region slot's autonomy is targeted, instead of a settlement's
	set_region_autonomy = function(faction_key, region_key, make_autonomous, ers_slot_index)
		local region_autonomy = tribes_privileges.get_region_autonomy(faction_key, region_key)
		if not make_autonomous and not region_autonomy then
			return	-- don't attempt to remove autonomy from an item that doesn't have it!
		end

		-- Set shared state for the settlement/ERS
		local region = cm:get_region(region_key)
		local garrison_residence = nil
		if ers_slot_index then
			local region_slot_list = region:slot_list()
			local slot = region_slot_list:item_at(ers_slot_index)
			garrison_residence = slot:garrison_residence()
		else
			garrison_residence = region:garrison_residence()
		end
		if garrison_residence and not garrison_residence:is_null_interface() then
			cm:set_script_state(garrison_residence, "autonomy_enabled", make_autonomous)
		end

		-- update persistent settlement/ERS autonomy
		if make_autonomous and not region_autonomy then
			tribes_privileges.persistent.autonomous_regions[faction_key][region_key] = {}
		end

		if make_autonomous then
			if ers_slot_index then
				if not tribes_privileges.has_ers_autonomy(faction_key, region_key) then
					tribes_privileges.persistent.autonomous_regions[faction_key][region_key].autonomous_region_slots = {}
				end
				table_add_unique(tribes_privileges.persistent.autonomous_regions[faction_key][region_key].autonomous_region_slots, ers_slot_index)
			else
				tribes_privileges.persistent.autonomous_regions[faction_key][region_key].is_settlement_autonomous = true
			end
		else
			if ers_slot_index then
				if tribes_privileges.has_ers_autonomy(faction_key, region_key) then
					table_erase(tribes_privileges.persistent.autonomous_regions[faction_key][region_key].autonomous_region_slots, ers_slot_index)
				end
			else
				tribes_privileges.persistent.autonomous_regions[faction_key][region_key].is_settlement_autonomous = false
			end
		end

		-- update settlement/ERS nameplates
		if ers_slot_index then
			common.update_ers_nameplates()
		else
			common.update_settlement_nameplates()
		end
	end,

	get_settlement_autonomy_bundle_key = function(region)
		local is_major_settlement = region:is_province_capital()
		local bundle_key = is_major_settlement and tribes_privileges.config.autonomy_bundle_key_major_settlement or tribes_privileges.config.autonomy_bundle_key_minor_settlement
		return bundle_key
	end,

	add_autonomy_privilege_to_settlement = function(faction_key, region_key)
		local region = cm:get_region(region_key)
		local owning_faction_key = region:owning_faction():name()
		if not is_sea_playable_faction(owning_faction_key) or owning_faction_key ~= faction_key then
			return
		end

		local cqi = region:command_queue_index()
		local cooldown = tribes_privileges.persistent.conversion_cooldowns.settlement[cqi] or 0
		if cooldown > 0 then
			script_error("For some reason trying to apply autonomy to settlement = " .. tostring(region_key) .. " that has a cooldown = " .. tostring(cooldown))
			return
		end
		tribes_privileges.persistent.conversion_cooldowns.settlement[cqi] = tribes_privileges.config.settlement_autonomy_cooldown

		tribes_privileges.set_region_autonomy(faction_key, region_key, true)

		local bundle_key = tribes_privileges.get_settlement_autonomy_bundle_key(region)
		cm:apply_effect_bundle_to_region(bundle_key, region_key, 0)

		output("Applied autonomy to region's '" .. region_key .. "' settlement.")
		return true
	end,

	remove_autonomy_privilege_from_settlement = function(faction_key, region_key)
		local region = cm:get_region(region_key)
		local owning_faction_key = region:owning_faction():name()
		if not is_sea_playable_faction(owning_faction_key) or owning_faction_key ~= faction_key then
			return
		end

		local cqi = region:command_queue_index()
		local cooldown = tribes_privileges.persistent.conversion_cooldowns.ers[cqi] or 0
		if cooldown > 0 then
			script_error("For some reason trying to remove autonomy from settlement = " .. tostring(region_key) .. " that has a cooldown = " .. tostring(cooldown))
			return
		end
		tribes_privileges.persistent.conversion_cooldowns.settlement[cqi] = tribes_privileges.config.settlement_autonomy_cooldown

		tribes_privileges.set_region_autonomy(faction_key, region_key, false)

		local is_major_settlement = region:is_province_capital()
		local bundle_key = is_major_settlement and tribes_privileges.config.autonomy_bundle_key_major_settlement or tribes_privileges.config.autonomy_bundle_key_minor_settlement

		cm:remove_effect_bundle_from_region(bundle_key, region_key)

		output("Removed autonomy from region's '" .. region_key .. "' settlement.")
		return true
	end,

	apply_autonomy_privilege_to_ers = function(faction_key, region_key, region_slot_index, should_add)
		local region_slot = tribes_privileges.get_region_slot(region_key, region_slot_index)
		if not region_slot then
			return
		end

		local cqi = region_slot:command_queue_index()
		local cooldown = tribes_privileges.persistent.conversion_cooldowns.ers[cqi] or 0
		if cooldown > 0 then
			script_error("For some reason trying to apply/remove autonomy to/from ers cqi = " .. tostring(cqi) .. " that has a cooldown = " .. tostring(cooldown))
			return
		end
		tribes_privileges.persistent.conversion_cooldowns.ers[cqi] = tribes_privileges.config.ers_autonomy_cooldown

		local slot_owning_faction_key = region_slot:faction():name()
		if not is_sea_playable_faction(faction_key) or slot_owning_faction_key ~= faction_key then
			return
		end

		tribes_privileges.set_region_autonomy(faction_key, region_key, should_add, region_slot_index)

		local region = cm:get_region(region_key)
		tribes_privileges.apply_ers_autonomy_bundle_to_province(faction_key, region:province_name(), tribes_privileges.config.autonomy_bundle_key_ers)

		if should_add then
			output("Applied autonomy to region's '" .. region_key .. "' ERS slot #" .. tostring(region_slot_index) .. ".")
		else
			output("Removed autonomy from region's '" .. region_key .. "' ERS slot #" .. tostring(region_slot_index) .. ".")
		end
		return true
	end,

	get_ers_slot_index = function(ers)
		local region = ers:region()
		local region_slots = region:slot_list()
		local region_slot_index
		local cqi = ers:command_queue_index()

		for i = 0, region_slots:num_items() - 1 do
			local slot = region_slots:item_at(i)
			if slot:command_queue_index() == cqi then
				region_slot_index = i
				break
			end
		end

		return region_slot_index
	end,

	apply_autonomy_privilege_to_ers_object = function(ers)
		local faction_key = ers:faction():name()
		local region_key = ers:region():name()
		local slot_index = tribes_privileges.get_ers_slot_index(ers)

		if not slot_index then
			script_error("Trying to apply autonomy to an ers that doesn't have a slot index?? Something weird is going on")
			return
		end

		return tribes_privileges.apply_autonomy_privilege_to_ers(faction_key, region_key, slot_index, true)
	end,

	remove_autonomy_privilege_from_ers_object = function(ers)
		local faction_key = ers:faction():name()
		local region_key = ers:region():name()
		local slot_index = tribes_privileges.get_ers_slot_index(ers)

		if not slot_index then
			script_error("Trying to remove autonomy from an ers that doesn't have a slot index?? Something weird is going on")
			return
		end

		return tribes_privileges.apply_autonomy_privilege_to_ers(faction_key, region_key, slot_index, false)
	end,

	--- @function apply_ers_autonomy_bundle_to_province
	--- @desc we create a custom bundle from the "bundle_key" template and then multiply the bundle's effect values by the amount of ERS nomad outposts in that region owned by "faction_key". If only 1 nomad outpost is owned then we apply a normal bundle.
	--- @p faction_key string: the faction's database key
	--- @p province_key string: the province's database key
	--- @p bundle_key string: the effect bundle's database key
	apply_ers_autonomy_bundle_to_province = function(faction_key, province_key, bundle_key)
		cm:remove_effect_bundle_from_province_for_faction(bundle_key, province_key, faction_key)	-- remove existing ers bundle if it exists

		-- Count the faction's autonomous ERSes in all regions of the province
		local province = cm:get_province(province_key)
		local num_nomad_outposts = 0
		local province_regions = province:regions()
		for i = 0, province_regions:num_items() - 1 do
			local region = province_regions:item_at(i)
			local region_key = region:name()
			local num_nomad_outposts_in_region = tribes_privileges.has_ers_autonomy(faction_key, region_key)
			if num_nomad_outposts_in_region then
				num_nomad_outposts = num_nomad_outposts + num_nomad_outposts_in_region
			end
		end

		if num_nomad_outposts == 1 then
			cm:apply_effect_bundle_to_province_for_faction(bundle_key, province_key, faction_key, 0)
			return
		end

		local custom_bundle = cm:create_new_custom_effect_bundle(bundle_key)
		local effects = custom_bundle:effects()
		local last_effect_index = effects:num_items() - 1
		for i = 0, last_effect_index do
			local effect = effects:item_at(i)
			if effect and not effect:is_null_interface() and effect:key() then
				local default_effect_value = effect:value()
				local custom_effect_value = default_effect_value * num_nomad_outposts
				custom_bundle:set_effect_value(effect, custom_effect_value)
			end
		end
		cm:apply_custom_effect_bundle_to_province_for_faction(custom_bundle, province_key, faction_key)
	end,

	get_region_slot = function(region_key, target_region_slot_index)
		local region = cm:model():world():region_manager():region_by_key(region_key)
		if not region or region:is_null_interface() then
			return nil
		end

		local region_slots = region:slot_list()
		local last_region_slot_index = region_slots:num_items() - 1
		if target_region_slot_index <= last_region_slot_index then
			return region_slots:item_at(target_region_slot_index)
		end

		return nil
	end,

	process_achish_ceremony = function(faction_key)
		local is_valid, previous_ceremony_stats = tribes_privileges.is_achish_ceremony_valid(faction_key)
		if not is_valid then
			return
		end

		tribes_privileges.persistent.achish_ceremony_stats[faction_key].remaining_duration = previous_ceremony_stats.remaining_duration - 1
		tribes_privileges.persistent.achish_ceremony_stats[faction_key].remaining_cooldown = previous_ceremony_stats.remaining_cooldown - 1

		local should_erase = tribes_privileges.persistent.achish_ceremony_stats[faction_key].remaining_duration < 1 and tribes_privileges.persistent.achish_ceremony_stats[faction_key].remaining_cooldown < 1
		if should_erase then
			tribes_privileges.persistent.achish_ceremony_stats[faction_key] = nil
			if faction_key == cm:get_local_faction_name(true) then
				tribes_privileges.ui.set_faction_widget_alert_icon_visibility(true)
			end
		end
	end,

	update_cell_for_faction = function(faction_key)
		local faction_data = tribes_privileges.persistent.factions[faction_key]

		local previous_bundle_key = tribes_privileges.persistent.factions[faction_key].current_cell_bundle_key
		local get_new_turn_bundle_key = function(faction_key)
			local is_active, ceremony_stats = tribes_privileges.is_achish_ceremony_active(faction_key)
			return is_active and ceremony_stats.bundle_key or tribes_privileges.get_predicted_cell(faction_key).bundle_key
		end
		local new_bundle_key = get_new_turn_bundle_key(faction_key)

		if new_bundle_key ~= previous_bundle_key then
			local is_non_empty_previous_bundle_key = previous_bundle_key ~= ""
			if is_non_empty_previous_bundle_key then
				cm:remove_effect_bundle(previous_bundle_key, faction_key)
			end
			local is_non_empty_new_bundle_key = new_bundle_key ~= ""
			if is_non_empty_new_bundle_key then
				cm:apply_effect_bundle(new_bundle_key, faction_key, 0)
			end

			if is_non_empty_previous_bundle_key and is_non_empty_new_bundle_key then
				local old_cell = tribes_privileges.get_cell_by_bundle_key(previous_bundle_key)
				local new_cell = tribes_privileges.get_cell_by_bundle_key(new_bundle_key)
				tribes_privileges.ui.emit_event_feed_message_cell_changed(faction_key, old_cell, new_cell)
				if faction_key == cm:get_local_faction_name(true) then
					tribes_privileges.ui.set_faction_widget_alert_icon_visibility(true)
				end
			end

			faction_data.current_cell_bundle_key = new_bundle_key
			faction_data.num_turns_in_current_cell = 0
		end

		faction_data.num_turns_in_current_cell = faction_data.num_turns_in_current_cell + 1
		cm:notify_tribes_privileges_total_turns_in_cell(faction_data.current_cell_bundle_key)
	end,

	get_points_sources_for_factor = function(faction_key, factor_unique_id)
		local factor_key = tribes_privileges.config.factor_unique_id_to_factor_key[factor_unique_id]

		if not factor_key then
			return {}
		end

		local blades_sources = tribes_privileges.persistent.factions[faction_key].factors_table.blades[factor_key] or {}
		local dwelling_sources = tribes_privileges.persistent.factions[faction_key].factors_table.dwelling[factor_key] or {}

		return blades_sources.sources or dwelling_sources.sources
	end,

	-- Whether autonomy can disable points for this factor.
	-- E.g. this would return true on the "phar_sea_tribes_privilege_main_settlement_building_dwelling_settled" factor, because when you give autonomy to a region points are removed from this factor
	can_factor_have_points_removed_by_autonomy = function(factor_unique_id)
		local relevant_factors = tribes_privileges.config.factors_that_can_have_points_removed_by_autonomy
		return relevant_factors[factor_unique_id]
	end,

	get_autonomous_sources_for_factor = function(faction_key, factor_unique_id)
		if not tribes_privileges.can_factor_have_points_removed_by_autonomy(factor_unique_id) then
			return {}
		end

		local autonomous_regions = tribes_privileges.persistent.autonomous_regions[faction_key]

		if not autonomous_regions then
			return {}
		end

		local sources = {}

		for region_key, data in pairs(autonomous_regions) do
			local region = cm:get_region(region_key)
			if data.is_settlement_autonomous and factor_unique_id == "phar_sea_tribes_privilege_main_settlement_building_dwelling_settled" then
				local settlement = region:settlement()
				local building = settlement:primary_slot():building()
				local settlement_tier = building:ui_level()
				if settlement_tier > 0 then
					table.insert(sources, {
						is_autonomous = true,
						type = "settlement",
						cqi = region:command_queue_index(),
						amount = tribes_privileges.get_points_for_settlement(region, faction_key, true),
					})
				end
			end

			if factor_unique_id == "phar_sea_tribes_privilege_external_region_slot_dwelling_settled"
				or factor_unique_id == "phar_sea_tribes_privilege_external_region_slot_dwelling_horde"
			then
				local region_slots = region:slot_list()
				for _, region_slot_index in ipairs(data.autonomous_region_slots or {}) do
					local region_slot = region_slots:item_at(region_slot_index)
					local has_building = region_slot:has_building()
					local building = has_building and region_slot:building()
					local is_horde_ers = building and tribes_privileges.is_nomad_outpost_ers(building)
					local should_display = (is_horde_ers and factor_unique_id == "phar_sea_tribes_privilege_external_region_slot_dwelling_horde")
						or (not is_horde_ers and factor_unique_id == "phar_sea_tribes_privilege_external_region_slot_dwelling_settled")
					if has_building and should_display then
						table.insert(sources, {
							is_autonomous = true,
							type = "ers",
							cqi = region_slot:command_queue_index(),
							amount = tribes_privileges.get_points_for_ers(region, region_slot, faction_key, true),
						})
					end
				end
			end
		end

		return sources
	end,

	get_resource_key_for_factor = function(factor_unique_id)
		local factor_to_resource_key_table = {
			phar_sea_tribes_privilege_external_region_slot_dwelling_settled = "phar_sea_dwelling_points",
			phar_sea_tribes_privilege_external_region_slot_dwelling_horde = "phar_sea_dwelling_points",
			phar_sea_tribes_privilege_main_settlement_building_dwelling_settled = "phar_sea_dwelling_points",
			phar_sea_tribes_privilege_main_settlement_building_dwelling_horde = "phar_sea_dwelling_points",
			phar_sea_tribes_privilege_general_competency_blades_settled = "phar_sea_blades_points",
			phar_sea_tribes_privilege_general_competency_blades_horde = "phar_sea_blades_points",
			phar_sea_tribes_privilege_military_force_blades_settled = "phar_sea_blades_points",
			phar_sea_tribes_privilege_military_force_blades_horde = "phar_sea_blades_points",
			phar_sea_tribes_privilege_units_blades_settled = "phar_sea_blades_points",
			phar_sea_tribes_privilege_units_blades_settled_high_tier = "phar_sea_blades_points",
			phar_sea_tribes_privilege_units_blades_horde = "phar_sea_blades_points",
			phar_sea_tribes_privilege_units_blades_horde_high_tier = "phar_sea_blades_points",
		}

		return factor_to_resource_key_table[factor_unique_id]
	end,

	log_faction_stats = function(faction_key)
		local faction_data = tribes_privileges.persistent.factions[faction_key]

		output("current_dwelling_points for '" .. faction_key .. "' = " .. tostring(tribes_privileges.get_dwelling_points(faction_key)) .. ".")
		output("current_blades_points for '" .. faction_key .. "' = " .. tostring(tribes_privileges.get_blades_points(faction_key)) .. ".")
		output("currently applied effect bundle for '" .. faction_key .. "' = '" .. faction_data.current_cell_bundle_key .. "'.")
		output("number of turns in current cell/tribe-category " .. tostring(faction_data.num_turns_in_current_cell) .. ".")

		local autonomous_regions = tribes_privileges.persistent.autonomous_regions[faction_key]
		for region_key, region_autonomy in pairs(autonomous_regions) do
			if region_autonomy.is_settlement_autonomous then
				output("Autonomous settlement for '" .. faction_key .. "' in region '" .. region_key .. "'.")
			end

			local num_autonomous_nomad_outposts = tribes_privileges.has_ers_autonomy(faction_key, region_key)
			if num_autonomous_nomad_outposts then
				output("'" .. faction_key .. "' has '" .. tostring(num_autonomous_nomad_outposts) .. "' autonomous nomad outposts in region '" .. region_key .. "'.")
			end
		end

		local is_valid, ceremony_stats = tribes_privileges.is_achish_ceremony_valid(faction_key)
		if is_valid then
			output("Achish ceremony for '" .. faction_key .. "' [duration, cooldown] = [" .. tostring(ceremony_stats.remaining_duration) .. ", " .. tostring(ceremony_stats.remaining_cooldown) .. "] grants the bundle with key: '" .. ceremony_stats.bundle_key .. "'.")
		end

		local pinned_bundle_key = tribes_privileges.persistent.pinned_cell[faction_key]
		if pinned_bundle_key ~= "" then
			output(faction_key .. " pinned cell bundle key: '" .. pinned_bundle_key .. "'.")
		end
	end,


	----------------
	--- UI FUNCTIONS
	ui = {
		temporary = {
			localised_factor_names = {}
		},

		emit_event_feed_message_cell_changed = function(faction_key, old_cell, new_cell)
			cm:add_event_feed_event("sea_peoples_tribes_privileges_cell_changed", faction_key, 0, old_cell.display_name, new_cell.display_name)
		end,

		--- @function get_points
		--- @desc requests the points as shown to the player in the ui, for the faction inferred via faction_key
		--- @p faction_key string: the faction's key
		--- @return 4 integer numbers: dwelling_settled_points, dwelling_horde_points, blades_settled_points, blades_horde_points
		get_points = function(faction_key)
			local current_dwelling_points = tribes_privileges.get_dwelling_points(faction_key)
			local current_blades_points = tribes_privileges.get_blades_points(faction_key)

			local dwelling_settled_points = 0
			local dwelling_horde_points = 0
			local blades_settled_points = 0
			local blades_horde_points = 0

			if current_dwelling_points >= 0 then
				dwelling_settled_points = current_dwelling_points
			else
				dwelling_horde_points = math.abs(current_dwelling_points)
			end

			if current_blades_points >= 0 then
				blades_settled_points = current_blades_points
			else
				blades_horde_points = math.abs(current_blades_points)
			end

			return dwelling_settled_points, dwelling_horde_points, blades_settled_points, blades_horde_points
		end,

		get_maximum_dwelling_points_for_coordinate_map = function()
			return tribes_privileges.get_dwelling_gradations() * tribes_privileges.config.points_per_gradation
		end,

		-- unused
		get_maximum_blades_points_for_coordinate_map = function()
			return tribes_privileges.get_blades_gradations() * tribes_privileges.config.points_per_gradation
		end,

		set_enable_ui = function(should_enable)
			if should_enable then
				uim:override("hide_tribes_privileges"):unlock(true)
				uim:override("hide_resource_phar_sea_blades_points"):unlock()
				uim:override("hide_resource_phar_sea_dwelling_points"):unlock()
			else
				uim:override("hide_tribes_privileges"):lock(true)
				uim:override("hide_resource_phar_sea_blades_points"):lock()
				uim:override("hide_resource_phar_sea_dwelling_points"):lock()
			end
		end,

		set_faction_widget_alert_icon_visibility = function(should_be_visible)
			local icon_alert_component = core:get_ui_root():SequentialFind(tribes_privileges.config.ui.component_ids.faction_widget_button_alert_icon)
			if icon_alert_component then
				icon_alert_component:SetVisible(should_be_visible)
			end
		end,

		setup_tile_templates = function(faction_key, component, cell_category)
			local current_cell_bundle_key = tribes_privileges.get_current_cell(faction_key).bundle_key
			local turns_for_predicted_cell_to_take_effect = 0

			local predicted_cell_bundle_key = tribes_privileges.get_predicted_cell(faction_key).bundle_key
			if current_cell_bundle_key ~= predicted_cell_bundle_key then
				turns_for_predicted_cell_to_take_effect = 1

				local is_active, ceremony_stats = tribes_privileges.is_achish_ceremony_active(faction_key)
				if is_active then
					turns_for_predicted_cell_to_take_effect = math.max(turns_for_predicted_cell_to_take_effect, ceremony_stats.remaining_duration)
				end
			else
				predicted_cell_bundle_key = ""
			end

			local cco_table = {}

			local first_cell, last_cell = tribes_privileges.get_cell_category_corner_cells(cell_category)
			local cells = tribes_privileges.get_cells_in_rectangle(first_cell.x, first_cell.y, last_cell.x, last_cell.y)
			local num_cells = #cells
			for i = 1, num_cells do
				local cell = cells[i]
				local cell_bundle_key = cell.bundle_key

				local cco_sub_table = {
					IsCurrentTile = to_bool(cell_bundle_key == current_cell_bundle_key),
					IsPinned = to_bool(cell_bundle_key == tribes_privileges.persistent.pinned_cell[faction_key]),
					DisplayName = get_localised_text_replacement(cell.display_name),
					BundleKey = cell_bundle_key,
					IsCentralTileOfFaction = tostring(to_bool(cell_bundle_key == tribes_privileges.get_central_cell_of_faction(faction_key).bundle_key)),
					PredictedTileLocationInNTurns = tostring(turns_for_predicted_cell_to_take_effect),
					IsPredictedLocation = cell_bundle_key == predicted_cell_bundle_key,
				}
				table.insert(cco_table, cco_sub_table)
			end

			local cco_id = "_tribes_privileges_tile_templates_" .. cell_category .. "_cco_id_"
			component:SetProperty("script_id", cco_id)
			common.set_context_value(cco_id, cco_table)
			-- the created components have an id of the sort: "CcoScriptTableNode .. _tribes_privileges_tile_templates_ .. cell_category .. _cco_id_ .. long_number"
		end,

		refresh_main_panel = function(faction_key)
			common.send_ui_update_message("tribes_privileges_refresh_strategic_map_tiles") -- refreshes strategic map templates
			tribes_privileges.ui.init_main_panel(faction_key)
		end,

		init_main_panel = function(faction_key)
			tribes_privileges.ui.reset_main_panel()

			local main_panel_component = core:get_ui_root():SequentialFind(tribes_privileges.config.ui.panel_name)
			if not main_panel_component then
				return
			end
			tribes_privileges.component_cache.main_panel_component = main_panel_component

			if tribes_privileges.ui.should_flip_current_tile_image(faction_key) then
				tribes_privileges.ui.flip_tile_image_orientation()
			end

			tribes_privileges.ui.setup_axes(faction_key)
			tribes_privileges.ui.setup_achish_ceremony_button(faction_key)
			tribes_privileges.ui.setup_tile_effects(faction_key)

			tribes_privileges:set_enable_ui_listeners(true)
			tribes_privileges.ui.set_faction_widget_alert_icon_visibility(false)
		end,

		should_flip_current_tile_image = function(faction_key)
			return tribes_privileges.are_points_settled(tribes_privileges.get_dwelling_points(faction_key))
		end,

		flip_tile_image_orientation = function(target_tile_component)
			if not target_tile_component then
				local component_predicate = function(uic)
					return uic and uic:CurrentState() == tribes_privileges.config.ui.component_states.your_boat
				end

				target_tile_component = uicomponent_find_down(UIComponent(tribes_privileges.component_cache.main_panel_component:SequentialFind(tribes_privileges.config.ui.component_ids.herdsmen_tiles_holder):Parent()), component_predicate)
			end

			if target_tile_component then
				local your_boat_component = target_tile_component:SequentialFind(tribes_privileges.config.ui.component_ids.your_boat)
				if your_boat_component then
					your_boat_component:SetCurrentStateImageXFlip(0, true)
				end
			end
		end,

		setup_axes = function(faction_key)
			local main_panel_component = tribes_privileges.component_cache.main_panel_component
			local coordinate_values_component = main_panel_component:SequentialFind(tribes_privileges.config.ui.component_ids.coordinate_values)
			coordinate_values_component:SetVisible(false)

			local points_range = tribes_privileges.get_cell_points_range(tribes_privileges.get_predicted_cell(faction_key))

			local max_map_points = tribes_privileges.ui.get_maximum_dwelling_points_for_coordinate_map()
			local points_to_pixel_along_axis = function(min, max, max_pixels, is_x_axis)
				local mid_points = (min + max) / 2
				local normalized = (mid_points / max_map_points) * max_pixels

				normalized = is_x_axis and normalized
					or (-normalized * 1.1)	-- magic number neatness adjuster
				return math.round(normalized)
			end

			local dwelling_points = tribes_privileges.get_dwelling_points(faction_key)
			local blades_points = tribes_privileges.get_blades_points(faction_key)
			local is_settled_dwelling = tribes_privileges.are_points_settled(dwelling_points)
			local is_settled_blades = tribes_privileges.are_points_settled(blades_points)

			local dwelling_axis_component = main_panel_component:SequentialFind(tribes_privileges.config.ui.component_ids.dwelling_axis)
			local dwelling_axis_width, _ = dwelling_axis_component:Dimensions()
			dwelling_x = points_to_pixel_along_axis(points_range.dwelling_min, points_range.dwelling_max, dwelling_axis_width, true)

			local blades_axis_component = main_panel_component:SequentialFind(tribes_privileges.config.ui.component_ids.blades_axis)
			local _, blades_axis_height = blades_axis_component:Dimensions()
			blades_y = points_to_pixel_along_axis(points_range.blades_min, points_range.blades_max, blades_axis_height, false)

			local dwelling_indicator_component = main_panel_component:SequentialFind(tribes_privileges.config.ui.component_ids.dwelling_indicator)
			local _, dwelling_y = dwelling_indicator_component:GetDockOffset()
			dwelling_indicator_component:SetDockOffset(dwelling_x, dwelling_y)
			local dwelling_indicator_state_name = is_settled_blades and tribes_privileges.config.ui.component_states.up or tribes_privileges.config.ui.component_states.down
			dwelling_indicator_component:SetState(dwelling_indicator_state_name)

			local dwelling_indicator_text_value_component = dwelling_indicator_component:SequentialFind(tribes_privileges.config.ui.component_ids.indicator_text_value)
			dwelling_indicator_text_value_component:SetText(math.abs(dwelling_points))

			local dwelling_indicator_icon = is_settled_dwelling and tribes_privileges.config.ui.icon_paths.dwelling_settled or tribes_privileges.config.ui.icon_paths.dwelling_horde
			dwelling_indicator_text_value_component:SetImagePath(dwelling_indicator_icon)

			local blades_indicator_component = main_panel_component:SequentialFind(tribes_privileges.config.ui.component_ids.blades_indicator)
			local blades_x, __ = blades_indicator_component:GetDockOffset()
			blades_indicator_component:SetDockOffset(blades_x, blades_y)
			local blades_indicator_state_name = is_settled_dwelling and tribes_privileges.config.ui.component_states.right or tribes_privileges.config.ui.component_states.left
			blades_indicator_component:SetState(blades_indicator_state_name)

			local blades_indicator_text_value_component = blades_indicator_component:SequentialFind(tribes_privileges.config.ui.component_ids.indicator_text_value)
			blades_indicator_text_value_component:SetText(math.abs(blades_points))

			local blades_indicator_icon = is_settled_blades and tribes_privileges.config.ui.icon_paths.blades_settled or tribes_privileges.config.ui.icon_paths.blades_horde
			blades_indicator_text_value_component:SetImagePath(blades_indicator_icon)

			tribes_privileges.ui.setup_axes_tooltips(faction_key, main_panel_component)
		end,

		setup_axes_tooltips = function(faction_key, main_panel_component)
			local dwelling_points_per_minor_settlement_tier = math.abs(tribes_privileges.config.dwelling_points_of_minor_settlement_per_main_building_level[2] - tribes_privileges.config.dwelling_points_of_minor_settlement_per_main_building_level[1])

			local dwelling_settled_description = get_localised_text_replacement(tribes_privileges.config.ui.localization_keys.tooltip_dwelling_settled_points_description)
				-- dwelling settled sources
				.. get_localised_text_replacement_safe_formatted(tribes_privileges.config.ui.localization_keys.tooltip_tribe_category_points_description_source_settled_dwelling_minor_settlement, dwelling_points_per_minor_settlement_tier)
				.. "\n" .. get_localised_text_replacement_safe_formatted(tribes_privileges.config.ui.localization_keys.tooltip_tribe_category_points_description_source_settled_dwelling_major_settlement, dwelling_points_per_minor_settlement_tier * tribes_privileges.config.dwelling_points_of_major_settlement_multiplier)
				.. "\n" .. get_localised_text_replacement_safe_formatted(tribes_privileges.config.ui.localization_keys.tooltip_tribe_category_points_description_source_settled_dwelling_settled_outpost, math.abs(tribes_privileges.config.dwelling_points_per_settled_ers))

			local dwelling_horde_description = get_localised_text_replacement(tribes_privileges.config.ui.localization_keys.tooltip_dwelling_horde_points_description)
				-- dwelling horde sources
				.. get_localised_text_replacement_safe_formatted(tribes_privileges.config.ui.localization_keys.tooltip_tribe_category_points_description_source_horde_dwelling_horde_outpost, math.abs(tribes_privileges.config.dwelling_points_per_nomad_outpost_ers))
				.. "\n" .. get_localised_text_replacement_safe_formatted(tribes_privileges.config.ui.localization_keys.tooltip_tribe_category_points_description_source_horde_dwelling_horde_army, math.abs(tribes_privileges.config.dwelling_points_per_horde_force))

			local blades_settled_description = get_localised_text_replacement(tribes_privileges.config.ui.localization_keys.tooltip_blades_settled_points_description)
				-- blades settled sources
				.. get_localised_text_replacement_safe_formatted(tribes_privileges.config.ui.localization_keys.tooltip_tribe_category_points_description_source_settled_blades_competency, math.abs(tribes_privileges.config.blades_points_per_settled_general_competency))
				.. "\n" .. get_localised_text_replacement_safe_formatted(tribes_privileges.config.ui.localization_keys.tooltip_tribe_category_points_description_source_settled_blades_settled_army, math.abs(tribes_privileges.config.blades_points_per_settled_force))
				.. "\n" .. get_localised_text_replacement_safe_formatted(tribes_privileges.config.ui.localization_keys.tooltip_tribe_category_points_description_source_settled_blades_settled_unit_tiers, math.abs(tribes_privileges.config.blades_points_per_settled_unit))
				.. "\n" .. get_localised_text_replacement_safe_formatted(tribes_privileges.config.ui.localization_keys.tooltip_tribe_category_points_description_source_settled_blades_settled_unit_tiers_elite, math.abs(tribes_privileges.config.blades_points_per_elite_settled_unit))

			local blades_horde_description = get_localised_text_replacement(tribes_privileges.config.ui.localization_keys.tooltip_blades_horde_points_description)
				-- blades horde sources
				.. get_localised_text_replacement_safe_formatted(tribes_privileges.config.ui.localization_keys.tooltip_tribe_category_points_description_source_horde_blades_competency, math.abs(tribes_privileges.config.blades_points_per_horde_general_competency))
				.. "\n" .. get_localised_text_replacement_safe_formatted(tribes_privileges.config.ui.localization_keys.tooltip_tribe_category_points_description_source_horde_blades_horde_army, math.abs(tribes_privileges.config.blades_points_per_horde_force))
				.. "\n" .. get_localised_text_replacement_safe_formatted(tribes_privileges.config.ui.localization_keys.tooltip_tribe_category_points_description_source_horde_blades_horde_unit_tiers, math.abs(tribes_privileges.config.blades_points_per_horde_unit))
				.. "\n" .. get_localised_text_replacement_safe_formatted(tribes_privileges.config.ui.localization_keys.tooltip_tribe_category_points_description_source_horde_blades_horde_unit_tiers_elite, math.abs(tribes_privileges.config.blades_points_per_elite_horde_unit))

			local dwelling_settled_points, dwelling_horde_points, blades_settled_points, blades_horde_points = tribes_privileges.ui.get_points(faction_key)

			local dwelling_settled_cco_table = {	-- CcoRTTribesPrivilegesAxisTooltipHolder
				DisplayName = get_localised_text_replacement(tribes_privileges.config.ui.localization_keys.tooltip_dwelling_settled_points_title),
				IconPath = tribes_privileges.config.ui.icon_paths.dwelling_settled,
				Text = dwelling_settled_description,
				Alert = get_localised_text_replacement(tribes_privileges.config.ui.localization_keys.tooltip_dwelling_settled_points_alert_text),
				CurrentPoints = tostring(dwelling_settled_points),
			}
			local dwelling_horde_cco_table = {
				DisplayName = get_localised_text_replacement(tribes_privileges.config.ui.localization_keys.tooltip_dwelling_horde_points_title),
				IconPath = tribes_privileges.config.ui.icon_paths.dwelling_horde,
				Text = dwelling_horde_description,
				Alert = get_localised_text_replacement(tribes_privileges.config.ui.localization_keys.tooltip_dwelling_horde_points_alert_text),
				CurrentPoints = tostring(dwelling_horde_points),
			}
			local blades_settled_cco_table = {
				DisplayName = get_localised_text_replacement(tribes_privileges.config.ui.localization_keys.tooltip_blades_settled_points_title),
				IconPath = tribes_privileges.config.ui.icon_paths.blades_settled,
				Text = blades_settled_description,
				Alert = get_localised_text_replacement(tribes_privileges.config.ui.localization_keys.tooltip_blades_settled_points_alert_text),
				CurrentPoints = tostring(blades_settled_points),
			}
			local blades_horde_cco_table = {
				DisplayName = get_localised_text_replacement(tribes_privileges.config.ui.localization_keys.tooltip_blades_horde_points_title),
				IconPath = tribes_privileges.config.ui.icon_paths.blades_horde,
				Text = blades_horde_description,
				Alert = get_localised_text_replacement(tribes_privileges.config.ui.localization_keys.tooltip_blades_horde_points_alert_text),
				CurrentPoints = tostring(blades_horde_points),
			}

			local resource_type = "dwelling_settled"
			local dwelling_settled_axis_tooltip_holder_component = main_panel_component:SequentialFind(tribes_privileges.config.ui.component_ids.dwelling_settled_axis_tooltip_holder)
			dwelling_settled_axis_tooltip_holder_component:SetTooltipText("{{tt:" .. tribes_privileges.config.ui.axis_tooltip_layout_path .. "}}", "", true)
			local cco_id = "tribes_privileges_resource_" .. resource_type .. "_cco_id"
			dwelling_settled_axis_tooltip_holder_component:SetProperty("script_id", cco_id)
			common.set_context_value(cco_id, dwelling_settled_cco_table)

			resource_type = "dwelling_horde"
			local dwelling_horde_axis_tooltip_holder_component = main_panel_component:SequentialFind(tribes_privileges.config.ui.component_ids.dwelling_horde_axis_tooltip_holder)
			dwelling_horde_axis_tooltip_holder_component:SetTooltipText("{{tt:" .. tribes_privileges.config.ui.axis_tooltip_layout_path .. "}}", "", true)
			cco_id = "tribes_privileges_resource_" .. resource_type .. "_cco_id"
			dwelling_horde_axis_tooltip_holder_component:SetProperty("script_id", cco_id)
			common.set_context_value(cco_id, dwelling_horde_cco_table)

			resource_type = "blades_settled"
			local blades_settled_axis_tooltip_holder_component = main_panel_component:SequentialFind(tribes_privileges.config.ui.component_ids.blades_settled_axis_tooltip_holder)
			blades_settled_axis_tooltip_holder_component:SetTooltipText("{{tt:" .. tribes_privileges.config.ui.axis_tooltip_layout_path .. "}}", "", true)
			cco_id = "tribes_privileges_resource_" .. resource_type .. "_cco_id"
			blades_settled_axis_tooltip_holder_component:SetProperty("script_id", cco_id)
			common.set_context_value(cco_id, blades_settled_cco_table)

			resource_type = "blades_horde"
			local blades_horde_axis_tooltip_holder_component = main_panel_component:SequentialFind(tribes_privileges.config.ui.component_ids.blades_horde_axis_tooltip_holder)
			blades_horde_axis_tooltip_holder_component:SetTooltipText("{{tt:" .. tribes_privileges.config.ui.axis_tooltip_layout_path .. "}}", "", true)
			cco_id = "tribes_privileges_resource_" .. resource_type .. "_cco_id"
			blades_horde_axis_tooltip_holder_component:SetProperty("script_id", cco_id)
			common.set_context_value(cco_id, blades_horde_cco_table)
		end,

		setup_achish_ceremony_button = function(faction_key)
			local is_valid, ceremony_stats = tribes_privileges.is_achish_ceremony_valid(faction_key)
			local duration = 0
			local cooldown = 0
			if is_valid then
				duration = ceremony_stats.remaining_duration
				cooldown = ceremony_stats.remaining_cooldown
			end

			local durations_check_out = duration <= 0 and cooldown <= 0

			local achish_ceremony_cost_obj = cm:create_new_custom_resource_cost()
			achish_ceremony_cost_obj:get_cost_from_record(tribes_privileges.config.achish_ceremony.resource_cost_key)
			local can_afford_transaction = cm:get_faction(faction_key):can_afford_resource_cost_object(achish_ceremony_cost_obj)

			local is_not_central_cell = not tribes_privileges.is_central_cell(tribes_privileges.get_current_cell(faction_key))

			local can_activate_ceremony = durations_check_out and is_not_central_cell and can_afford_transaction

			local warning_localized_text = ""
			if not durations_check_out then
				warning_localized_text = get_localised_text_replacement(tribes_privileges.config.ui.localization_keys.tooltip_achish_ceremony_warning_after_cooldown_ends)
			end
			if not can_afford_transaction then
				warning_localized_text = warning_localized_text .. "\n" .. get_localised_text_replacement(tribes_privileges.config.ui.localization_keys.tooltip_achish_ceremony_warning_cannot_afford)
			end
			if not is_not_central_cell then
				warning_localized_text = warning_localized_text .. "\n" .. get_localised_text_replacement(tribes_privileges.config.ui.localization_keys.tooltip_achish_ceremony_warning_boat_already_central_tile)
			end

			local cco_table = {
				Title = get_localised_text_replacement(tribes_privileges.config.ui.localization_keys.tooltip_achish_ceremony_title),
				Text = get_localised_text_replacement(tribes_privileges.config.ui.localization_keys.tooltip_achish_ceremony_description),
				Warning = warning_localized_text,
				Action = can_activate_ceremony and get_localised_text_replacement(tribes_privileges.config.ui.localization_keys.tooltip_achish_ceremony_action) or "",
			}

			local achish_ceremony_button_component = tribes_privileges.component_cache.main_panel_component:SequentialFind(tribes_privileges.config.ui.component_ids.achish_ceremony_button)
			local button_state_name = can_activate_ceremony and tribes_privileges.config.ui.component_states.active or tribes_privileges.config.ui.component_states.inactive
			achish_ceremony_button_component:SetState(button_state_name)
			achish_ceremony_button_component:SetTooltipText("{{tt:" .. tribes_privileges.config.ui.achish_button_tooltip_layout_path .. "}}", "", true)
			local cco_id = "tribes_privileges_achish_ceremony_tooltip_cco_id"
			achish_ceremony_button_component:SetProperty("script_id", cco_id)
			common.set_context_value(cco_id, cco_table)

			local achish_ceremony_button_turn_counter_component = achish_ceremony_button_component:SequentialFind(tribes_privileges.config.ui.component_ids.achish_ceremony_button_turn_counter)
			achish_ceremony_button_turn_counter_component:SetText(cooldown)
			achish_ceremony_button_turn_counter_component:SetVisible(not durations_check_out)
		end,

		on_achish_ceremony_tooltip_show = function(faction_key, tooltip_component)
			local cost_component = tooltip_component:SequentialFind(tribes_privileges.config.ui.component_ids.achish_ceremony_tooltip_cost_template)
			cost_component:SetContextObject(cco("CcoCampaignResourceCost", tribes_privileges.config.achish_ceremony.resource_cost_key))
			cost_component:SetProperty("resource_cost_key", tribes_privileges.config.achish_ceremony.resource_cost_key)
			common.send_ui_update_message("AchishCeremonyUpdateResourceCost")

			local is_valid, ceremony_stats = tribes_privileges.is_achish_ceremony_valid(faction_key)
			local duration = 0
			local cooldown = 0
			if is_valid then
				duration = ceremony_stats.remaining_duration
				cooldown = ceremony_stats.remaining_cooldown
			end

			local duration_container_component = tooltip_component:SequentialFind(tribes_privileges.config.ui.component_ids.achish_ceremony_tooltip_duration_container)
			duration_container_component:SetVisible(duration > 0)
			if duration_container_component:Visible() then
				local duration_number_component = duration_container_component:SequentialFind(tribes_privileges.config.ui.component_ids.achish_ceremony_tooltip_duration_number)
				duration_number_component:SetText(duration)
			end

			local cooldown_container_component = tooltip_component:SequentialFind(tribes_privileges.config.ui.component_ids.achish_ceremony_tooltip_cooldown_container)
			cooldown_container_component:SetVisible(cooldown > 0)
			if cooldown_container_component:Visible() then
				local cooldown_number_component = cooldown_container_component:SequentialFind(tribes_privileges.config.ui.component_ids.achish_ceremony_tooltip_duration_number)
				cooldown_number_component:SetText(cooldown)
			end
		end,

		get_central_tile_component_by_category = function(cell_category)
			local main_panel_component = tribes_privileges.component_cache.main_panel_component
			if not main_panel_component then
				return
			end

			local quadrant_holder_component
			if cell_category == tribes_privileges.config.cell_categories.herdsmen then
				quadrant_holder_component = main_panel_component:SequentialFind(tribes_privileges.config.ui.component_ids.herdsmen_tiles_holder)
			elseif cell_category == tribes_privileges.config.cell_categories.farmers then
				quadrant_holder_component = main_panel_component:SequentialFind(tribes_privileges.config.ui.component_ids.farmers_tiles_holder)
			elseif cell_category == tribes_privileges.config.cell_categories.raiders then
				quadrant_holder_component = main_panel_component:SequentialFind(tribes_privileges.config.ui.component_ids.raiders_tiles_holder)
			elseif cell_category == tribes_privileges.config.cell_categories.craftsmen then
				quadrant_holder_component = main_panel_component:SequentialFind(tribes_privileges.config.ui.component_ids.craftsmen_tiles_holder)
			else
				script_error("invalid cell category!")
				return
			end

			return find_child_uicomponent_by_property(quadrant_holder_component, "IsCentralTileOfFaction", "true", {tribes_privileges.config.ui.component_ids.tile_template})
		end,

		get_central_tile_component_of_faction = function(faction_key)
			local cell_category = tribes_privileges.get_current_cell_category(faction_key)
			return tribes_privileges.ui.get_central_tile_component_by_category(cell_category)
		end,

		on_achish_ceremony_mouse_on = function(faction_key)
			local central_tile_component = tribes_privileges.ui.get_central_tile_component_of_faction(faction_key)
			if central_tile_component and central_tile_component:CurrentState() ~= tribes_privileges.config.ui.component_states.your_boat then
				central_tile_component:SetState(tribes_privileges.config.ui.component_states.achish_ceremony_predicted)
			end
		end,

		on_achish_ceremony_mouse_off = function(faction_key)
			local central_tile_component = tribes_privileges.ui.get_central_tile_component_of_faction(faction_key)
			if central_tile_component and central_tile_component:CurrentState() ~= tribes_privileges.config.ui.component_states.your_boat then
				central_tile_component:SetState(tribes_privileges.config.ui.component_states.default)
			end
		end,

		on_achish_ceremony_clicked = function(faction_key)
			local main_panel_component = tribes_privileges.component_cache.main_panel_component
			if not main_panel_component then
				return
			end

			local achish_ceremony_button_component = main_panel_component:SequentialFind(tribes_privileges.config.ui.component_ids.achish_ceremony_button)
			achish_ceremony_button_component:SetState(tribes_privileges.config.ui.component_states.inactive)

			CampaignUI.TriggerCampaignScriptEvent(cm:get_faction(faction_key):command_queue_index(), "TribesPrivilegesMultiplayerReplicatingEvent:AchishCeremonyActivated:" .. faction_key)
		end,

		get_localized_cell_category_text_and_source = function(cell_category)
			return get_localised_text_replacement_and_source(tribes_privileges.config.ui.localization_keys.cell_category_title_prefix .. cell_category)
		end,

		setup_tile_effects_points_requirements_texts = function(faction_key, parent_component, tile_effects_requirements_holder, other_cell)
			local current_cell_points_range = tribes_privileges.get_cell_points_range(tribes_privileges.get_predicted_cell(faction_key))
			local other_cell_points_range = tribes_privileges.get_cell_points_range(other_cell)

			local are_current_dwelling_points_settled = tribes_privileges.are_points_settled(current_cell_points_range.dwelling_min)
			local are_current_blades_points_settled = tribes_privileges.are_points_settled(current_cell_points_range.blades_min)

			local are_other_dwelling_points_settled = tribes_privileges.are_points_settled(other_cell_points_range.dwelling_min)
			local are_other_blades_points_settled = tribes_privileges.are_points_settled(other_cell_points_range.blades_min)

			local is_same_dwelling_range = current_cell_points_range.dwelling_min == other_cell_points_range.dwelling_min
			local is_same_blades_range = current_cell_points_range.blades_min == other_cell_points_range.blades_min

			local is_same_dwelling_quadrant = are_current_dwelling_points_settled == are_other_dwelling_points_settled
			local is_same_blades_quadrant = are_current_blades_points_settled == are_other_blades_points_settled

			local dwelling_points_range_text = is_same_dwelling_quadrant and tostring(math.abs(tribes_privileges.get_dwelling_points(faction_key))) or "0"
			local blades_points_range_text = is_same_blades_quadrant and tostring(math.abs(tribes_privileges.get_blades_points(faction_key))) or "0"

			dwelling_points_range_text = (is_same_dwelling_range and ("[[col:" .. tribes_privileges.config.ui.colour_codes.green .. "]]" .. dwelling_points_range_text .. "[[/col]]")) or ("[[col:" .. tribes_privileges.config.ui.colour_codes.red .. "]]" .. dwelling_points_range_text .. "[[/col]]")
			blades_points_range_text = (is_same_blades_range and ("[[col:" .. tribes_privileges.config.ui.colour_codes.green .. "]]" .. blades_points_range_text .. "[[/col]]")) or ("[[col:" .. tribes_privileges.config.ui.colour_codes.red .. "]]" .. blades_points_range_text .. "[[/col]]")

			local other_min_dwelling_points_text = tostring(math.abs(other_cell_points_range.dwelling_min))
			local other_max_dwelling_points_text = tostring(math.abs(other_cell_points_range.dwelling_max))
			local other_min_blades_points_text = tostring(math.abs(other_cell_points_range.blades_min))
			local other_max_blades_points_text = tostring(math.abs(other_cell_points_range.blades_max))

			dwelling_points_range_text = dwelling_points_range_text .. " (" .. other_min_dwelling_points_text .. "-" .. other_max_dwelling_points_text .. ")"
			blades_points_range_text = blades_points_range_text .. " (" .. other_min_blades_points_text .. "-" .. other_max_blades_points_text .. ")"

			local points_not_applicable_text = "-"

			local dwelling_settled_requirements_text_component = tile_effects_requirements_holder:SequentialFind(tribes_privileges.config.ui.component_ids.tile_effects_dwelling_settled_requirements_text)
			local dwelling_horde_requirements_text_component = tile_effects_requirements_holder:SequentialFind(tribes_privileges.config.ui.component_ids.tile_effects_dwelling_horde_requirements_text)
			local blades_settled_requirements_text_component = tile_effects_requirements_holder:SequentialFind(tribes_privileges.config.ui.component_ids.tile_effects_blades_settled_requirements_text)
			local blades_horde_requirements_text_component = tile_effects_requirements_holder:SequentialFind(tribes_privileges.config.ui.component_ids.tile_effects_blades_horde_requirements_text)

			if are_other_dwelling_points_settled then
				dwelling_settled_requirements_text_component:SetText(dwelling_points_range_text)
				dwelling_settled_requirements_text_component:SetState(tribes_privileges.config.ui.component_states.default)

				dwelling_horde_requirements_text_component:SetText(points_not_applicable_text)
				dwelling_horde_requirements_text_component:SetState(tribes_privileges.config.ui.component_states.inactive)
			else
				dwelling_settled_requirements_text_component:SetText(points_not_applicable_text)
				dwelling_settled_requirements_text_component:SetState(tribes_privileges.config.ui.component_states.inactive)

				dwelling_horde_requirements_text_component:SetText(dwelling_points_range_text)
				dwelling_horde_requirements_text_component:SetState(tribes_privileges.config.ui.component_states.default)
			end

			if are_other_blades_points_settled then
				blades_settled_requirements_text_component:SetText(blades_points_range_text)
				blades_settled_requirements_text_component:SetState(tribes_privileges.config.ui.component_states.default)

				blades_horde_requirements_text_component:SetText(points_not_applicable_text)
				blades_horde_requirements_text_component:SetState(tribes_privileges.config.ui.component_states.inactive)
			else
				blades_settled_requirements_text_component:SetText(points_not_applicable_text)
				blades_settled_requirements_text_component:SetState(tribes_privileges.config.ui.component_states.inactive)

				blades_horde_requirements_text_component:SetText(blades_points_range_text)
				blades_horde_requirements_text_component:SetState(tribes_privileges.config.ui.component_states.default)
			end
		end,

		setup_tile_effects = function(faction_key)
			local tile_effects_parent_component = tribes_privileges.component_cache.main_panel_component:SequentialFind(tribes_privileges.config.ui.component_ids.panel_right_side_parent)
			tribes_privileges.component_cache.tile_effects_parent_component = tile_effects_parent_component
			local current_effects_container_component = tile_effects_parent_component:SequentialFind(tribes_privileges.config.ui.component_ids.tile_effects_current_effects)

			local current_cell_bundle_key = tribes_privileges.get_current_cell(faction_key).bundle_key
			current_effects_container_component:SetContextObject(cco("CcoEffectBundle", current_cell_bundle_key))

			local tile_category_current_effects_category_text_component = current_effects_container_component:SequentialFind(tribes_privileges.config.ui.component_ids.tile_effects_tile_category_text)
			tile_category_current_effects_category_text_component:SetText(tribes_privileges.ui.get_localized_cell_category_text_and_source(tribes_privileges.get_current_cell_category(faction_key)))

			local current_effect_alert_text_component = current_effects_container_component:SequentialFind(tribes_privileges.config.ui.component_ids.tile_effects_alert)
			current_effect_alert_text_component:SetVisible(false)

			local pinned_cell_bundle_key = tribes_privileges.persistent.pinned_cell[faction_key]
			local is_any_tile_pinned = pinned_cell_bundle_key ~= ""

			local hovered_effects_container_component = tile_effects_parent_component:SequentialFind(tribes_privileges.config.ui.component_ids.tile_effects_hovered_effects)
			hovered_effects_container_component:SetVisible(is_any_tile_pinned)

			local tile_effects_requirements_holder = tile_effects_parent_component:SequentialFind(tribes_privileges.config.ui.component_ids.tile_effects_requirements_holder)
			tile_effects_requirements_holder:SetVisible(is_any_tile_pinned)
			if not is_any_tile_pinned then
				return
			end

			hovered_effects_container_component:SetContextObject(cco("CcoEffectBundle", pinned_cell_bundle_key))

			local hovered_effects_alert_text_component = hovered_effects_container_component:SequentialFind(tribes_privileges.config.ui.component_ids.tile_effects_alert)
			hovered_effects_alert_text_component:SetVisible(false)

			local tile_category_hovered_effects_category_text_component = hovered_effects_container_component:SequentialFind(tribes_privileges.config.ui.component_ids.tile_effects_tile_category_text)
			local pinned_cell = tribes_privileges.get_cell_by_bundle_key(pinned_cell_bundle_key)
			local pinned_x, pinned_y = tribes_privileges.get_cell_coords(pinned_cell)
			tile_category_hovered_effects_category_text_component:SetText(tribes_privileges.ui.get_localized_cell_category_text_and_source(tribes_privileges.get_cell_category_from_coords(pinned_x, pinned_y)))

			tribes_privileges.ui.setup_tile_effects_points_requirements_texts(faction_key,
				hovered_effects_container_component,
				tile_effects_requirements_holder,
				pinned_cell)
		end,

		on_tile_template_mouse_on = function(uic, faction_key, hovered_cell_bundle_key)
			local tile_effects_parent_component = tribes_privileges.component_cache.main_panel_component
			if not tile_effects_parent_component or not hovered_cell_bundle_key then
				return
			end

			if tribes_privileges.ui.should_flip_current_tile_image(faction_key) and uic and uic:CurrentState() == tribes_privileges.config.ui.component_states.your_boat_hover then
				tribes_privileges.ui.flip_tile_image_orientation(uic)
			end

			local current_cell_bundle_key = tribes_privileges.get_current_cell(faction_key).bundle_key
			local is_same_tile_hovered = hovered_cell_bundle_key == current_cell_bundle_key

			local hovered_effects_container_component = tile_effects_parent_component:SequentialFind(tribes_privileges.config.ui.component_ids.tile_effects_hovered_effects)
			hovered_effects_container_component:SetVisible(not is_same_tile_hovered)

			local tile_effects_requirements_holder = tile_effects_parent_component:SequentialFind(tribes_privileges.config.ui.component_ids.tile_effects_requirements_holder)
			tile_effects_requirements_holder:SetVisible(not is_same_tile_hovered)

			if not is_same_tile_hovered then
				hovered_effects_container_component:SetContextObject(cco("CcoEffectBundle", hovered_cell_bundle_key))

				local tile_category_hovered_effects_category_text_component = hovered_effects_container_component:SequentialFind(tribes_privileges.config.ui.component_ids.tile_effects_tile_category_text)
				local hovered_cell = tribes_privileges.get_cell_by_bundle_key(hovered_cell_bundle_key)
				local hovered_x, hovered_y = tribes_privileges.get_cell_coords(hovered_cell)
				tile_category_hovered_effects_category_text_component:SetText(tribes_privileges.ui.get_localized_cell_category_text_and_source(tribes_privileges.get_cell_category_from_coords(hovered_x, hovered_y)))

				tribes_privileges.ui.highlight_quadrant_section(hovered_cell, true)
			end

			local hovered_effects_alert_text_component = hovered_effects_container_component:SequentialFind(tribes_privileges.config.ui.component_ids.tile_effects_alert)
			hovered_effects_alert_text_component:SetText(get_localised_text_replacement_and_source(tribes_privileges.config.ui.localization_keys.tile_effects_boat_returns_once_achish_ceremony_is_over))

			-- If the Achish ceremony is active show an alert message in case the hovered cell is the next predicted cell
			local is_active, _ = tribes_privileges.is_achish_ceremony_active(faction_key)
			local predicted_cell_bundle_key = is_active and tribes_privileges.get_predicted_cell(faction_key).bundle_key or ""
			hovered_effects_alert_text_component:SetVisible(hovered_cell_bundle_key == predicted_cell_bundle_key)

			tribes_privileges.ui.setup_tile_effects_points_requirements_texts(faction_key,
				hovered_effects_container_component,
				tile_effects_requirements_holder,
				tribes_privileges.get_cell_by_bundle_key(hovered_cell_bundle_key))
		end,

		on_tile_template_mouse_off = function(faction_key, unhovered_cell_bundle_key)
			local tile_effects_parent_component = tribes_privileges.component_cache.main_panel_component
			if not tile_effects_parent_component then
				return
			end

			tribes_privileges.ui.highlight_quadrant_section(tribes_privileges.get_cell_by_bundle_key(unhovered_cell_bundle_key), false)

			local pinned_cell_bundle_key = tribes_privileges.persistent.pinned_cell[faction_key]
			local is_any_tile_pinned = pinned_cell_bundle_key ~= ""
			local hovered_effects_container_component = tile_effects_parent_component:SequentialFind(tribes_privileges.config.ui.component_ids.tile_effects_hovered_effects)
			hovered_effects_container_component:SetVisible(is_any_tile_pinned)

			local tile_effects_requirements_holder = tile_effects_parent_component:SequentialFind(tribes_privileges.config.ui.component_ids.tile_effects_requirements_holder)
			tile_effects_requirements_holder:SetVisible(is_any_tile_pinned)

			if not is_any_tile_pinned then
				return
			end

			hovered_effects_container_component:SetContextObject(cco("CcoEffectBundle", pinned_cell_bundle_key))

			local tile_category_hovered_effects_category_text_component = hovered_effects_container_component:SequentialFind(tribes_privileges.config.ui.component_ids.tile_effects_tile_category_text)
			local pinned_cell = tribes_privileges.get_cell_by_bundle_key(pinned_cell_bundle_key)
			local pinned_x, pinned_y = tribes_privileges.get_cell_coords(pinned_cell)
			tile_category_hovered_effects_category_text_component:SetText(tribes_privileges.ui.get_localized_cell_category_text_and_source(tribes_privileges.get_cell_category_from_coords(pinned_x, pinned_y)))

			tribes_privileges.ui.setup_tile_effects_points_requirements_texts(faction_key,
				hovered_effects_container_component,
				tile_effects_requirements_holder,
				pinned_cell)
		end,

		highlight_quadrant_section = function(cell, should_show_highlight)
			local quadrant_highlighters_component = tribes_privileges.component_cache.main_panel_component:SequentialFind(tribes_privileges.config.ui.component_ids.quadrant_highlighters)
			local quadrant_highlighters_section_component = quadrant_highlighters_component and quadrant_highlighters_component:SequentialFind(cell.ui_component_section_id)
			if not quadrant_highlighters_section_component then
				return
			end
			quadrant_highlighters_section_component:SetVisible(should_show_highlight)
		end,

		on_tile_clicked = function(faction_key, clicked_tile_bundle_key)
			CampaignUI.TriggerCampaignScriptEvent(cm:get_faction(faction_key):command_queue_index(), "TribesPrivilegesMultiplayerReplicatingEvent:NewTilePinned:" .. faction_key .. ":" .. clicked_tile_bundle_key)
		end,

		setup_tile_tooltip_requirements_templates = function(component, faction_key, cell_bundle_key)
			local cell = tribes_privileges.get_cell_by_bundle_key(cell_bundle_key)
			if not cell then
				script_error("cell not found!")
				return
			end

			local get_cell_ui_info = function(cell)
				local points_range = tribes_privileges.get_cell_points_range(cell)
				local is_settled_blades_points = tribes_privileges.are_points_settled(points_range.blades_min)
				local is_settled_dwelling_points = tribes_privileges.are_points_settled(points_range.dwelling_min)

				local current_cell_points_range = tribes_privileges.get_cell_points_range(tribes_privileges.get_current_cell(faction_key))
				local is_same_blades_range = current_cell_points_range.blades_min == points_range.blades_min
				local is_same_dwelling_range = current_cell_points_range.dwelling_min == points_range.dwelling_min

				local blades_points_range_text = tostring(points_range.blades_min) .. "-" .. tostring(points_range.blades_max)
				local dwelling_points_range_text = tostring(points_range.dwelling_min) .. "-" .. tostring(points_range.dwelling_max)

				return {
					requirement_localization_keys = {
						is_settled_blades_points and tribes_privileges.config.ui.localization_keys.tooltip_blades_settled_points_title or tribes_privileges.config.ui.localization_keys.tooltip_blades_horde_points_title,
						is_settled_dwelling_points and tribes_privileges.config.ui.localization_keys.tooltip_dwelling_settled_points_title or tribes_privileges.config.ui.localization_keys.tooltip_dwelling_horde_points_title,
					},
					points_range_text = {
						(is_same_blades_range and "[[col:" .. tribes_privileges.config.ui.colour_codes.green .. "]]" .. blades_points_range_text .. "[[/col]]") or "[[col:" .. tribes_privileges.config.ui.colour_codes.red .. "]]" .. blades_points_range_text .. "[[/col]]",
						(is_same_dwelling_range and "[[col:" .. tribes_privileges.config.ui.colour_codes.green .. "]]" .. dwelling_points_range_text .. "[[/col]]") or "[[col:" .. tribes_privileges.config.ui.colour_codes.red .. "]]" .. dwelling_points_range_text .. "[[/col]]",
					},
					icon_paths = {
						is_settled_blades_points and tribes_privileges.config.ui.icon_paths.blades_settled or tribes_privileges.config.ui.icon_paths.blades_horde,
						is_settled_dwelling_points and tribes_privileges.config.ui.icon_paths.dwelling_settled or tribes_privileges.config.ui.icon_paths.dwelling_horde,
					},
				}
			end

			local cell_ui_info = get_cell_ui_info(cell)

			local cco_table = {}
			for i = 1, 2 do
				local cco_sub_table = {
					RequirementLocalizedText = get_localised_text_replacement(cell_ui_info.requirement_localization_keys[i]),
					PointsRangeText = cell_ui_info.points_range_text[i],
					ResourceIconPath = cell_ui_info.icon_paths[i],
				}
				table.insert(cco_table, cco_sub_table)
			end

			local cco_id = "tribes_privileges_tile_tooltip_requirements_templates_" .. cell.display_name .. "_cco_id"
			component:SetProperty("script_id", cco_id)
			common.set_context_value(cco_id, cco_table)
		end,

		try_to_apply_autonomy = function(split_tokens)
			local type = split_tokens[3]
			local cqi = tonumber(split_tokens[4])

			if type == "settlement" then
				local settlement = cm:model():settlement_for_command_queue_index(cqi)
				if settlement and not settlement:is_null_interface() then
					tribes_privileges.add_autonomy_privilege_to_settlement(settlement:faction():name(), settlement:region():name())
					tribes_privileges.calculate_points(settlement:faction():name())
				else
					script_error("Trying to toggle autonomy for a settlement that doesn't exist")
				end

				cm:notify_tribes_privileges_settlement_sovereignty_attempted()
			elseif type == "ers" then
				local ers = cm:model():region_slot_for_command_queue_index(cqi)
				if ers and not ers:is_null_interface() then
					tribes_privileges.apply_autonomy_privilege_to_ers_object(ers)
					tribes_privileges.calculate_points(ers:faction():name())
				else
					script_error("Trying to toggle autonomy for an ERS that doesn't exist")
				end

				cm:notify_tribes_privileges_tribal_outpost_sovereignty_attempted()
			end
		end,

		try_to_remove_autonomy = function(split_tokens)
			local type = split_tokens[3]
			local cqi = tonumber(split_tokens[4])

			if type == "settlement" then
				local settlement = cm:model():settlement_for_command_queue_index(cqi)
				if settlement and not settlement:is_null_interface() then
					tribes_privileges.remove_autonomy_privilege_from_settlement(settlement:faction():name(), settlement:region():name())
					tribes_privileges.calculate_points(settlement:faction():name())
				else
					script_error("Trying to toggle autonomy for a settlement that doesn't exist")
				end
			elseif type == "ers" then
				local ers = cm:model():region_slot_for_command_queue_index(cqi)
				if ers and not ers:is_null_interface() then
					tribes_privileges.remove_autonomy_privilege_from_ers_object(ers)
					tribes_privileges.calculate_points(ers:faction():name())
				else
					script_error("Trying to toggle autonomy for an ERS that doesn't exist")
				end
			end
		end,

		try_to_toggle_force_type = function(split_tokens)
			local type = split_tokens[3]
			local cqi = tonumber(split_tokens[4])

			local character = cm:get_character_by_cqi(cqi)
			if character and not character:is_null_interface() then
				tribes_privileges.toggle_force_type(character)
				tribes_privileges.calculate_points(character:faction():name())
			else
				script_error("Trying to toggle force type for a non-existing character")
			end
		end,

		get_amount_type_from_factor_and_amount = function(factor_unique_id, amount, is_autonomous)
			local amount_type_prefix = (amount >= 0 and "settled_") or "horde_"

			local factor_to_amount_type_suffix = {
				phar_sea_tribes_privilege_external_region_slot_dwelling_settled = "dwelling",
				phar_sea_tribes_privilege_external_region_slot_dwelling_horde = "dwelling",
				phar_sea_tribes_privilege_main_settlement_building_dwelling_settled = "dwelling",
				phar_sea_tribes_privilege_main_settlement_building_dwelling_horde = "dwelling",
				phar_sea_tribes_privilege_general_competency_blades_settled = "blades",
				phar_sea_tribes_privilege_general_competency_blades_horde = "blades",
				phar_sea_tribes_privilege_military_force_blades_settled = "blades",
				phar_sea_tribes_privilege_military_force_blades_horde = "blades",
				phar_sea_tribes_privilege_units_blades_settled = "blades",
				phar_sea_tribes_privilege_units_blades_settled_high_tier = "blades",
				phar_sea_tribes_privilege_units_blades_horde = "blades",
				phar_sea_tribes_privilege_units_blades_horde_high_tier = "blades",
			}

			local result = amount_type_prefix .. factor_to_amount_type_suffix[factor_unique_id]

			if is_autonomous then
				result = result .. "_inactive"
			end

			return result
		end,

		get_force_info = function(source, factor_name, factor_unique_id)
			local force = cm:get_military_force_by_cqi(source.cqi)

			if not force or force:is_null_interface() then
				script_error("For some reason we have a force without a general when trying to open the Tribes & Privileges UI, and this should be impossible. Something's wrong")
				return {}
			end

			local general = force:general_character()
			if general and not general:is_null_interface() then
				local item_type
				local item_name
				if source.unit_cqi then
					local unit = cm:model():unit_for_command_queue_index(source.unit_cqi)
					if unit and not unit:is_null_interface() then
						item_type = "unit"
						item_name = unit:onscreen_name()
					else
						-- execution shouldn't reach this point; if it does something may not have been accounted for
						output("WARNING: unit has been cleared from the army but its source still remains for some reason.")
					end
				else
					item_type = "character"

					if factor_unique_id == "phar_sea_tribes_privilege_military_force_blades_horde" then
						item_name = common.get_localised_string(tribes_privileges.config.ui.localization_keys.sources_list_horde_force_item)
					elseif factor_unique_id == "phar_sea_tribes_privilege_military_force_blades_settled" then
						item_name = common.get_localised_string(tribes_privileges.config.ui.localization_keys.sources_list_settled_force_item)
					else
						item_name = factor_name
					end
				end

				local general_cqi = general:command_queue_index()

				return {
					type = "character",
					cqi = general_cqi,
					display_items = {
						{
							item_type = item_type,
							item_name = item_name,
							item_cqi = general_cqi,
							amount = math.abs(source.amount),
							amount_type = tribes_privileges.ui.get_amount_type_from_factor_and_amount(factor_unique_id, source.amount, source.is_autonomous),
							is_autonomous = to_bool(source.is_autonomous),
						},
					},
				}
			end

			return {}
		end,

		get_character_info = function(source, factor_name, factor_unique_id)
			local character = cm:get_character_by_cqi(source.cqi)
			if character and not character:is_null_interface() then
				local item_name

				if factor_unique_id == "phar_sea_tribes_privilege_general_competency_blades_horde"
					or factor_unique_id == "phar_sea_tribes_privilege_general_competency_blades_settled"
				then
					item_name = common.get_localised_string(tribes_privileges.config.ui.localization_keys.sources_list_general_competences_item)
				else
					item_name = factor_name
				end

				return {
					type = source.type,
					cqi = source.cqi,
					display_items = {
						{
							item_type = "character",
							item_name = item_name,
							item_cqi = source.cqi,
							amount = math.abs(source.amount),
							amount_type = tribes_privileges.ui.get_amount_type_from_factor_and_amount(factor_unique_id, source.amount, source.is_autonomous),
							is_autonomous = source.is_autonomous,
						},
					},
				}
			end

			return {}
		end,

		get_settlement_info = function(source, factor_name, factor_unique_id)
			-- CcoCampaignRegion does not exist and we have no way of currently getting
			-- a settlement from a region CQI in the UI system so we pass it settlement cqi
			return {
				type = "region",
				cqi = source.cqi,
				factor_name_override = tribes_privileges.ui.get_settlement_factor_name(source.cqi),
				display_items = {
					{
						item_type = "settlement",
						item_name = tribes_privileges.ui.get_settlement_factor_name(source.cqi),
						item_cqi = source.cqi,
						amount = math.abs(source.amount),
						amount_type = tribes_privileges.ui.get_amount_type_from_factor_and_amount(factor_unique_id, source.amount, source.is_autonomous),
						is_autonomous = source.is_autonomous,
					},
				},
			}
		end,

		get_ers_info = function(source, factor_name, factor_unique_id)
			local ers = cm:model():region_slot_for_command_queue_index(source.cqi)
			if not ers or ers:is_null_interface() then
				script_error("For some reason we are not finding the CQI of a region when trying to display the T&P sources list. Something's wrong")
				return {}
			end

			if ers:has_building() then
				-- CcoCampaignRegion does not exist and we have no way of currently getting
				-- a settlement from a region CQI in the UI system so we pass it settlement cqi
				local settlement = ers:region():settlement()
				local building_name = ers:building():localised_display_name()
				return {
					type = "region",
					cqi = settlement:command_queue_index(),
					additional_identifier = source.cqi,
					factor_name_override = building_name,
					display_items = {
						{
							item_type = "ers",
							item_name = factor_name,
							item_cqi = source.cqi,
							amount = math.abs(source.amount),
							amount_type = tribes_privileges.ui.get_amount_type_from_factor_and_amount(factor_unique_id, source.amount, source.is_autonomous),
							is_autonomous = source.is_autonomous,
						},
					},
				}
			end

			return {}
		end,

		add_source_to_ui_friendly_table = function(source, ui_table, factor_name, factor_unique_id)
			local info = {}
			if source.type == "force" then
				info = tribes_privileges.ui.get_force_info(source, factor_name, factor_unique_id)
			elseif source.type == "character" then
				info = tribes_privileges.ui.get_character_info(source, factor_name, factor_unique_id)
			elseif source.type == "settlement" then
				info = tribes_privileges.ui.get_settlement_info(source, factor_name, factor_unique_id)
			elseif source.type == "ers" then -- "ers"
				info = tribes_privileges.ui.get_ers_info(source, factor_name, factor_unique_id)
			else
				script_error("For some reason we have a source with an invalid type. Something went wrong when calculating points!")
				return
			end

			if info.cqi and info.type then
				local amount = source.amount

				local new_source = table_find(ui_table, function(ui_source) return ui_source.type == info.type and ui_source.cqi == info.cqi end)
				if not new_source then
					new_source = {
						type = info.type,
						cqi = info.cqi,
						amount = 0,
						factors = { },
						display_items = { },
					}

					table.insert(ui_table, new_source)
				end

				if not source.is_autonomous then
					new_source.amount = new_source.amount + amount
				end
				new_source.amount_type = tribes_privileges.ui.get_amount_type_from_factor_and_amount(factor_unique_id, new_source.amount)

				local new_factor = table_find(new_source.factors,
					function(ui_factor)
						return ui_factor.factor_name == (info.factor_name_override or factor_name)
							and ui_factor.additional_identifier == info.additional_identifier
					end)

				if not new_factor then
					new_factor = {
						factor_name = info.factor_name_override or factor_name,
						amount = 0,
						additional_identifier = info.additional_identifier,
					}
					table.insert(new_source.factors, new_factor)
				end

				if not source.is_autonomous then
					new_factor.amount = amount + new_factor.amount
				end
				new_factor.amount_type = tribes_privileges.ui.get_amount_type_from_factor_and_amount(factor_unique_id, new_factor.amount)

				for _, new_display_item in ipairs(info.display_items or {}) do
					table.insert(new_source.display_items, new_display_item)
				end
			end
		end,

		get_points_sources_for_factor_in_ui_friendly_table = function(faction_key, factor_unique_ids)
			local ui_table = {
				--[[
				{
					type = <"character" or "region">,
					cqi = <number>,
					amount = <amount of points this source gives>,
					amount_type = <"horde_blades", "horde_dwelling", "horde_dwelling_inactive", "settled_blades", "settled_dwelling" or "settled_dwelling_inactive">,

					-- This is a breakdown of the factors, used for the tooltip.
					-- Instead of displaying the total value for all the ERSes in the region each ERS is displayed separately with its name as the "factor_name"
					factors = {
						{
							factor_name = <UniString, display name for the factor>,
							amount = <amount of points for this factor>,
							amount_type = <"horde_blades", "horde_dwelling", "horde_dwelling_inactive", "settled_blades", "settled_dwelling" or "settled_dwelling_inactive">,
							additional_identifier = <anything, currently used to differentiate between ERSes in the tooltip>,
						},
					},

					-- This is a detailed list of the items that give points in this character or region
					-- Used in the breakdown for the region/character.
					-- For character it lists the amount of points from the character itself and all the units
					-- For region it lists the settlement (if controlled) and all the ERSes that give points
					display_items = {
						{
							item_type = <"character", "ers", "settlement" or "unit">,
							item_name = <UniString, display name for the item>,
							item_cqi = <cqi_number>,
							amount = <amount of points the item gives>,
							amount_type = <"horde_blades", "horde_dwelling", "horde_dwelling_inactive", "settled_blades", "settled_dwelling" or "settled_dwelling_inactive">,
							is_autonomous = <true or false>,
						},
					},
				},
				--]]
			}

			for _, factor_unique_id in ipairs(factor_unique_ids) do
				local sources = tribes_privileges.get_points_sources_for_factor(faction_key, factor_unique_id)

				local factor_name = tribes_privileges.ui.get_localised_factor_name(factor_unique_id)

				if is_table(sources) then
					for _, source in ipairs(sources) do
						tribes_privileges.ui.add_source_to_ui_friendly_table(source, ui_table, factor_name, factor_unique_id)
					end
				end

				local autonomous_sources = tribes_privileges.get_autonomous_sources_for_factor(faction_key, factor_unique_id)

				if is_table(autonomous_sources) then
					for _, source in ipairs(autonomous_sources) do
						tribes_privileges.ui.add_source_to_ui_friendly_table(source, ui_table, factor_name, factor_unique_id)
					end
				end
			end

			-- We want character and settlement type points on the top, and the rest on the bottom.
			local item_type_priority = tribes_privileges.config.ui.source_list_item_type_display_priority

			for _, source_list_item in ipairs(ui_table) do
				table.sort(source_list_item.display_items,
					function(a, b)
						-- We want autonomous stuff on the bottom
						if a.is_autonomous and not b.is_autonomous then
							return false
						end

						if not a.is_autonomous and b.is_autonomous then
							return true
						end

						return item_type_priority[a.item_type] > item_type_priority[b.item_type]
					end
				)
			end

			table.sort(ui_table, function(a, b) return a.amount > b.amount end)

			return ui_table
		end,

		get_points_sources_for_factor = function(faction_key, splits, uic)
			if not uic then
				script_error("For some reason UI is requesting points sources but is not providing a component.")
				return
			end

			if #splits < 3 then
				script_error("For some reason someone in UI is trying to get sources for factor, but hasn't supplied any factors.")
				return
			end

			local factor_unique_ids = {}
			local cco_id = "points_sources_for_factor"
			for i = 3, #splits do
				local factor_unique_id = splits[i]
				table.insert(factor_unique_ids, factor_unique_id)
				cco_id = cco_id .. "_" .. factor_unique_id
			end

			local sources = tribes_privileges.ui.get_points_sources_for_factor_in_ui_friendly_table(faction_key, factor_unique_ids)

			uic:SetProperty("script_id", cco_id)

			common.set_context_value(cco_id, sources)
		end,

		create_tooltip_breakdown_cco = function(uic, pooled_resource_key)
			local cco_id = "tooltip_value_breakdown_" .. pooled_resource_key

			-- avoid refreshing the UI more than once
			if uic:GetProperty("script_id") == cco_id then
				return
			end

			local cco_table = {
				IsOverride = true,
				PositiveFactors = {
					--[[
						{
							Name = common.get_localised_string(source.name_key),
							Value = sum_factors(factors, source.factors_keys),
							FormatType = "%d"
						}
					--]]
				},
				NegativeFactors = {},
			}

			local local_faction = cm:get_local_faction(true)
			local pooled_resource = local_faction:pooled_resource(pooled_resource_key)
			local pooled_resource_value = pooled_resource:value()
			local swap_signs = pooled_resource_value < 0

			local factors = pooled_resource:factors()

			for i = 0, factors:num_items() - 1 do
				local factor = factors:item_at(i)
				local value = (swap_signs and -factor:value()) or factor:value()

				if value ~= 0 then
					local name = (value > 0 and factor:localised_positive_display_name()) or factor:localised_negative_display_name()

					local factor_table = {
						Name = name,
						Value = value,
						FormatType = "%d",
					}

					local factors_table = (value > 0 and cco_table.PositiveFactors) or cco_table.NegativeFactors

					table.insert(factors_table, factor_table)
				end
			end

			uic:SetProperty("script_id", cco_id)
			common.set_context_value(cco_id, cco_table)
			-- this will refresh ContextPropagator with cco CcoCampaignResourcePool whose expression will end up using the new CcoScriptObject we just pushed
			common.send_ui_update_message("tooltip_value_breakdown_refresh")
		end,

		get_localised_factor_name = function(factor_unique_id)
			local saved_names = tribes_privileges.ui.temporary.localised_factor_names
			if saved_names[factor_unique_id] then
				return saved_names[factor_unique_id]
			end

			local resource_key = tribes_privileges.get_resource_key_for_factor(factor_unique_id)

			local faction = cm:get_local_faction(true)

			local resource_pool = faction:pooled_resource(resource_key)
			local factors = resource_pool:factors()

			local factor_name = "Error: name not found"

			for i = 0, factors:num_items() - 1 do
				local factor = factors:item_at(i)
				if factor:factor_id() == factor_unique_id then
					factor_name = factor:localised_positive_display_name()
					break
				end
			end

			saved_names[factor_unique_id] = factor_name
			return factor_name
		end,

		get_conversion_type_from_entity_type = function(faction_key, type, cqi)
			if type == "character" then
				local character = cm:get_character_by_cqi(cqi)
				local military_force = character:military_force()
				return (tribes_privileges.is_horde_type_string(military_force:force_type()) and "horde_to_settled") or "settled_to_horde"
			end

			if type == "settlement" then
				local settlement = cm:model():settlement_for_command_queue_index(cqi)
				local region_key = settlement:region():name()
				return (tribes_privileges.is_autonomous_settlement(faction_key, region_key) and "remove_autonomy") or "grant_autonomy"
			end

			if type == "ers" then
				local ers = cm:model():region_slot_for_command_queue_index(cqi)
				local slot_index = tribes_privileges.get_ers_slot_index(ers)
				local region_key = ers:region():name()
				return (tribes_privileges.is_autonomous_ers(faction_key, region_key, slot_index) and "remove_autonomy") or "grant_autonomy"
			end
		end,

		get_relevant_factors_for_conversion_type = function(conversion_type)
			local conversion_type_to_factors = {
				grant_autonomy = {
					"phar_sea_tribes_privilege_main_settlement_building_settled",
					"phar_sea_tribes_privilege_external_region_slot_settled",
					"phar_sea_tribes_privilege_external_region_slot_horde",
				},
				remove_autonomy = {
					-- same as grant_autonomy
				},
				horde_to_settled = {
					"phar_sea_tribes_privilege_general_competency_settled",
					"phar_sea_tribes_privilege_military_force_settled",
					"phar_sea_tribes_privilege_general_competency_horde",
					"phar_sea_tribes_privilege_military_force_horde",
					"phar_sea_tribes_privilege_main_settlement_building_horde",
				},
				settled_to_horde = {
					-- same as horde_to_settled
				},
				disbanding = {
					"phar_sea_tribes_privilege_main_settlement_building_horde",
					"phar_sea_tribes_privilege_general_competency_settled",
					"phar_sea_tribes_privilege_general_competency_horde",
					"phar_sea_tribes_privilege_military_force_settled",
					"phar_sea_tribes_privilege_units_settled",
					"phar_sea_tribes_privilege_units_settled_high_tier",
					"phar_sea_tribes_privilege_military_force_horde",
					"phar_sea_tribes_privilege_units_horde",
					"phar_sea_tribes_privilege_units_horde_high_tier",
				},
			}
			conversion_type_to_factors.remove_autonomy = conversion_type_to_factors.grant_autonomy
			conversion_type_to_factors.settled_to_horde = conversion_type_to_factors.horde_to_settled

			return conversion_type_to_factors[conversion_type]
		end,

		get_opposite_factor_key = function(factor_key)
			local opposite_factors = {}

			local fill_factors_from_opposite_tables = function(table1, table2)
				for factor_type, key in pairs(table1) do
					if table2[factor_type] then
						opposite_factors[key] = table2[factor_type]
					end
				end
			end

			local factors = tribes_privileges.config.factors
			fill_factors_from_opposite_tables(factors.dwelling.settled, factors.dwelling.horde)
			fill_factors_from_opposite_tables(factors.dwelling.horde, factors.dwelling.settled)
			fill_factors_from_opposite_tables(factors.blades.settled, factors.blades.horde)
			fill_factors_from_opposite_tables(factors.blades.horde, factors.blades.settled)

			return opposite_factors[factor_key]
		end,

		setup_dialogue_box = function(faction_key, uic, type, cqi)
			cqi = tonumber(cqi)
			local cco = {
				--[[
				conversion_type = "", -- "grant_autonomy", "remove_autonomy", "horde_to_settled", "settled_to_horde", or "disbanding"
				blades_points_new_value = 50,
				dwelling_points_new_value = 50,
				--]]

				cell_will_change = false,
				--[[
				old_cell_display_name = <UniString>,
				new_cell_display_name = <UniString>,
				old_cell_bundle_key = "",
				new_cell_bundle_key = "",
				--]]

				changes = {
				--[[
					{
						resource_key = "",
						resource_type = "", -- horde or settled
						old_value = 50,
						new_value = 60,
						factors = {
							{
								name = <UniString>,
								value = 10,
							},
						},
					},
				--]]
				},
			}

			cco.conversion_type = tribes_privileges.ui.get_conversion_type_from_entity_type(faction_key, type, cqi)

			local horde_blades_points_change = 0
			local settled_blades_points_change = 0
			local horde_dwelling_points_change = 0
			local settled_dwelling_points_change = 0

			local horde_blades_factors = {}
			local settled_blades_factors = {}
			local horde_dwelling_factors = {}
			local settled_dwelling_factors = {}

			local faction_data = tribes_privileges.persistent.factions[faction_key]
			local factors_table = faction_data.factors_table

			if cco.conversion_type ~= "remove_autonomy" then
				-- For these cases we can just check the factor sources to see what will change
				local relevant_factors = tribes_privileges.ui.get_relevant_factors_for_conversion_type(cco.conversion_type)

				for _, factor_key in ipairs(relevant_factors) do
					-- Each factor key is present either in blades or in dwelling, never in both
					local blades_factor_table = factors_table.blades[factor_key]
					local dwelling_factor_table = factors_table.dwelling[factor_key]

					local invert_points = blades_factor_table and (cco.conversion_type == "horde_to_settled" or cco.conversion_type == "settled_to_horde")

					local factor_table = blades_factor_table or dwelling_factor_table

					for _, source in ipairs(factor_table.sources) do
						if (source.type == type or (source.type == "force" and type == "character")) and source.cqi == cqi then
							local relevant_table
							local inverted_table
							if blades_factor_table then
								if source.amount < 0 then
									horde_blades_points_change = source.amount + horde_blades_points_change
									relevant_table = horde_blades_factors
									if invert_points then
										settled_blades_points_change = -source.amount + settled_blades_points_change
										inverted_table = settled_blades_factors
									end
								else
									settled_blades_points_change = -source.amount + settled_blades_points_change
									relevant_table = settled_blades_factors
									if invert_points then
										horde_blades_points_change = source.amount + horde_blades_points_change
										inverted_table = horde_blades_factors
									end
								end
							else
								if source.amount < 0 then
									horde_dwelling_points_change = source.amount + horde_dwelling_points_change
									relevant_table = horde_dwelling_factors
									if invert_points then
										settled_dwelling_points_change = -source.amount + settled_dwelling_points_change
										inverted_table = settled_dwelling_factors
									end
								else
									settled_dwelling_points_change = -source.amount + settled_dwelling_points_change
									relevant_table = settled_dwelling_factors
									if invert_points then
										horde_dwelling_points_change = source.amount + horde_dwelling_points_change
										inverted_table = horde_dwelling_factors
									end
								end
							end
							local factor_unique_id = tribes_privileges.config.factor_key_to_factor_unique_id[factor_key]
							local localised_factor_name = tribes_privileges.ui.get_localised_factor_name(factor_unique_id)
							table.insert(relevant_table, { name = localised_factor_name, value = -math.abs(source.amount) })

							if inverted_table then
								local inverted_factor = tribes_privileges.ui.get_opposite_factor_key(factor_key)
								factor_unique_id = tribes_privileges.config.factor_key_to_factor_unique_id[inverted_factor]
								localised_factor_name = tribes_privileges.ui.get_localised_factor_name(factor_unique_id)
								table.insert(inverted_table, { name = localised_factor_name, value = math.abs(source.amount) })
							end
						end
					end
				end
			else
				-- When removing autonomy we have to instead calculate how many dwelling points we'll get
				if type == "settlement" then
					local settlement = cm:model():settlement_for_command_queue_index(cqi)
					local region = settlement:region()
					local factor_key = tribes_privileges.config.factors.dwelling.settled.building
					local factor_unique_id = tribes_privileges.config.factor_key_to_factor_unique_id[factor_key]
					local localised_factor_name = tribes_privileges.ui.get_localised_factor_name(factor_unique_id)

					settled_dwelling_points_change, _ = tribes_privileges.get_points_for_settlement(region, faction_key, true)
					table.insert(settled_dwelling_factors, { name = localised_factor_name, value = settled_dwelling_points_change })
				else -- type == "ers"
					local ers = cm:model():region_slot_for_command_queue_index(cqi)
					local points_change, _ = tribes_privileges.get_points_for_ers(ers:region(), ers, faction_key, true)
					if points_change > 0 then
						settled_dwelling_points_change = points_change
						local factor_key = tribes_privileges.config.factors.dwelling.settled.ers
						local factor_unique_id = tribes_privileges.config.factor_key_to_factor_unique_id[factor_key]
						local localised_factor_name = tribes_privileges.ui.get_localised_factor_name(factor_unique_id)
						table.insert(settled_dwelling_factors, { name = localised_factor_name, value = settled_dwelling_points_change })
					else
						horde_dwelling_points_change = -points_change
						local factor_key = tribes_privileges.config.factors.dwelling.horde.ers
						local factor_unique_id = tribes_privileges.config.factor_key_to_factor_unique_id[factor_key]
						local localised_factor_name = tribes_privileges.ui.get_localised_factor_name(factor_unique_id)
						table.insert(horde_dwelling_factors, { name = localised_factor_name, value = horde_dwelling_points_change })
					end
				end
			end

			local insert_table_from_changes = function(resource_key, resource_type, old_value, difference, factors)
				table.insert(cco.changes, {
					resource_key = resource_key,
					resource_type = resource_type,
					old_value = old_value,
					new_value = old_value + difference,
					factors = factors,
				})
			end

			local old_blades_points = tribes_privileges.get_blades_points(faction_key)
			local old_dwelling_points = tribes_privileges.get_dwelling_points(faction_key)
			local new_blades_points = old_blades_points
			local new_dwelling_points = old_dwelling_points

			if horde_blades_points_change ~= 0 then
				new_blades_points = new_blades_points - horde_blades_points_change
				local old_points = -tribes_privileges.get_horde_blades_points(faction_key)
				insert_table_from_changes(tribes_privileges.config.resource_keys.blades, "horde", old_points, horde_blades_points_change, horde_blades_factors)
			end

			if settled_blades_points_change ~= 0 then
				new_blades_points = new_blades_points + settled_blades_points_change
				local old_points = tribes_privileges.get_settled_blades_points(faction_key)
				insert_table_from_changes(tribes_privileges.config.resource_keys.blades, "settled", old_points, settled_blades_points_change, settled_blades_factors)
			end

			if horde_dwelling_points_change ~= 0 then
				new_dwelling_points = new_dwelling_points - horde_dwelling_points_change
				local old_points = -tribes_privileges.get_horde_dwelling_points(faction_key)
				insert_table_from_changes(tribes_privileges.config.resource_keys.dwelling, "horde", old_points, horde_dwelling_points_change, horde_dwelling_factors)
			end

			if settled_dwelling_points_change ~= 0 then
				new_dwelling_points = new_dwelling_points + settled_dwelling_points_change
				local old_points = tribes_privileges.get_settled_dwelling_points(faction_key)
				insert_table_from_changes(tribes_privileges.config.resource_keys.dwelling, "settled", old_points, settled_dwelling_points_change, settled_dwelling_factors)
			end

			local old_cell = tribes_privileges.get_cell_by_points(tribes_privileges.get_dwelling_points(faction_key), tribes_privileges.get_blades_points(faction_key))
			cco.dwelling_points_new_value = new_dwelling_points
			cco.blades_points_new_value = new_blades_points
			local new_cell = tribes_privileges.get_cell_by_points(new_dwelling_points, new_blades_points)

			if old_cell ~= new_cell then
				cco.cell_will_change = true
				cco.old_cell_display_name = get_localised_text_replacement(old_cell.display_name)
				cco.new_cell_display_name = get_localised_text_replacement(new_cell.display_name)
				cco.old_cell_bundle_key = old_cell.bundle_key
				cco.new_cell_bundle_key = new_cell.bundle_key
			end

			local cco_id = "tribes_privileges_dialogue_box"
			common.set_context_value(cco_id, cco)
			uic:SetProperty("script_id", cco_id)
		end,

		setup_dialogue_box_for_disbanding = function(faction_key, uic, split_tokens)
			local cco = {
				conversion_type = "disbanding",
				cell_will_change = false,
				changes = {},
			}

			local horde_blades_points_change = 0
			local settled_blades_points_change = 0
			local horde_dwelling_points_change = 0
			local settled_dwelling_points_change = 0

			local horde_blades_factors = {}
			local settled_blades_factors = {}
			local horde_dwelling_factors = {}
			local settled_dwelling_factors = {}

			local faction_data = tribes_privileges.persistent.factions[faction_key]
			local factors_table = faction_data.factors_table

			local cqi_list = {}
			for i, cqi in ipairs(split_tokens) do
				if i > 2 then
					table.insert(cqi_list, tonumber(cqi))
				end
			end

			-- For these cases we can just check the factor sources to see what will change
			local relevant_factors = tribes_privileges.ui.get_relevant_factors_for_conversion_type(cco.conversion_type)

			for _, factor_key in ipairs(relevant_factors) do
				local blades_factor_table = factors_table.blades[factor_key]
				local dwelling_factor_table = factors_table.dwelling[factor_key]

				local factor_table = blades_factor_table or dwelling_factor_table

				for _, source in ipairs(factor_table.sources) do
					for _, cqi in ipairs(cqi_list) do
						if (source.type == "force" and source.unit_cqi == cqi)							-- cqi here is the unit's cqi (stored under a "force" source)
							or (source.type == "force" and source.cqi == cqi and not source.unit_cqi)	-- cqi here is the military force's cqi (stored under a "force" source)
							or (source.type == "character" and source.cqi == cqi)						-- cqi here is the general's cqi (stored under a "character" source)
						then
							local relevant_table
							if blades_factor_table then
								if source.amount < 0 then
									horde_blades_points_change = source.amount + horde_blades_points_change
									relevant_table = horde_blades_factors
								else
									settled_blades_points_change = -source.amount + settled_blades_points_change
									relevant_table = settled_blades_factors
								end
							else
								if source.amount < 0 then
									horde_dwelling_points_change = source.amount + horde_dwelling_points_change
									relevant_table = horde_dwelling_factors
								else
									settled_dwelling_points_change = -source.amount + settled_dwelling_points_change
									relevant_table = settled_dwelling_factors
								end
							end
							local factor_unique_id = tribes_privileges.config.factor_key_to_factor_unique_id[factor_key]
							local localised_factor_name = tribes_privileges.ui.get_localised_factor_name(factor_unique_id)
							table.insert(relevant_table, { name = localised_factor_name, value = -math.abs(source.amount) })
						end
					end
				end
			end

			local insert_table_from_changes = function(resource_key, resource_type, old_value, difference, factors)
				table.insert(cco.changes, {
					resource_key = resource_key,
					resource_type = resource_type,
					old_value = old_value,
					new_value = old_value + difference,
					factors = factors,
				})
			end

			local old_blades_points = tribes_privileges.get_blades_points(faction_key)
			local old_dwelling_points = tribes_privileges.get_dwelling_points(faction_key)
			local new_blades_points = old_blades_points
			local new_dwelling_points = old_dwelling_points

			if horde_blades_points_change ~= 0 then
				new_blades_points = new_blades_points - horde_blades_points_change
				local old_points = -tribes_privileges.get_horde_blades_points(faction_key)
				insert_table_from_changes(tribes_privileges.config.resource_keys.blades, "horde", old_points, horde_blades_points_change, horde_blades_factors)
			end

			if settled_blades_points_change ~= 0 then
				new_blades_points = new_blades_points + settled_blades_points_change
				local old_points = tribes_privileges.get_settled_blades_points(faction_key)
				insert_table_from_changes(tribes_privileges.config.resource_keys.blades, "settled", old_points, settled_blades_points_change, settled_blades_factors)
			end

			if horde_dwelling_points_change ~= 0 then
				new_dwelling_points = new_dwelling_points - horde_dwelling_points_change
				local old_points = -tribes_privileges.get_horde_dwelling_points(faction_key)
				insert_table_from_changes(tribes_privileges.config.resource_keys.dwelling, "horde", old_points, horde_dwelling_points_change, horde_dwelling_factors)
			end

			if settled_dwelling_points_change ~= 0 then
				new_dwelling_points = new_dwelling_points + settled_dwelling_points_change
				local old_points = tribes_privileges.get_settled_dwelling_points(faction_key)
				insert_table_from_changes(tribes_privileges.config.resource_keys.dwelling, "settled", old_points, settled_dwelling_points_change, settled_dwelling_factors)
			end

			local old_cell = tribes_privileges.get_cell_by_points(tribes_privileges.get_dwelling_points(faction_key), tribes_privileges.get_blades_points(faction_key))
			cco.dwelling_points_new_value = new_dwelling_points
			cco.blades_points_new_value = new_blades_points
			local new_cell = tribes_privileges.get_cell_by_points(new_dwelling_points, new_blades_points)

			if old_cell ~= new_cell then
				cco.cell_will_change = true
				cco.old_cell_display_name = get_localised_text_replacement(old_cell.display_name)
				cco.new_cell_display_name = get_localised_text_replacement(new_cell.display_name)
				cco.old_cell_bundle_key = old_cell.bundle_key
				cco.new_cell_bundle_key = new_cell.bundle_key
			end

			local cco_id = "tribes_privileges_dialogue_box_disbanding"
			common.set_context_value(cco_id, cco)
			uic:SetProperty("script_id", cco_id)
		end,

		set_to_state_if_type_on_cooldown = function(uic, splits)
			local type = splits[3]
			local cqi = tonumber(splits[4])
			local state = splits[5]

			local type_cooldowns = tribes_privileges.persistent.conversion_cooldowns[type] or ""
			local cooldown = type_cooldowns[cqi] or 0

			if cooldown > 0 then
				uic:SetState(state)
			end
		end,

		setup_type_cooldown_counter = function(uic, splits)
			local type = splits[3]
			local cqi = tonumber(splits[4])

			local type_cooldowns = tribes_privileges.persistent.conversion_cooldowns[type] or ""
			local cooldown = type_cooldowns[cqi] or 0

			uic:SetVisible(cooldown > 0)
			uic:SetText(tostring(cooldown))
		end,

		set_visible_if_mechanic_unlocked = function(faction_key, uic)
			local visible = forge_path.is_system_unlocked_by_faction("tribes_privileges", faction_key)
			uic:SetVisible(visible)
		end,

		setup_autonomy_button = function(faction_key, uic, splits)
			local object_type = splits[3] -- "ers" or "settlement"
			local button_type = splits[4] -- "grant" or "remove"
			local cqi = tonumber(splits[5])

			local tribes_unlocked = forge_path.is_system_unlocked_by_faction("tribes_privileges", faction_key)

			if not tribes_unlocked then
				uic:SetVisible(false)
				return
			end

			local has_autonomy = false

			if object_type == "ers" then
				local ers = cm:model():region_slot_for_command_queue_index(cqi)
				if not ers:is_infrastructure_slot() then
					uic:SetVisible(false)
					return
				end

				local slot_index = tribes_privileges.get_ers_slot_index(ers)
				local region_key = ers:region():name()
				has_autonomy = tribes_privileges.is_autonomous_ers(faction_key, region_key, slot_index)
			elseif object_type == "settlement" then
				local settlement = cm:model():settlement_for_command_queue_index(cqi)
				local region_key = settlement:region():name()
				has_autonomy = tribes_privileges.is_autonomous_settlement(faction_key, region_key)
			else
				uic:SetVisible(false)
				script_error("Trying to setup an autonomy button but the wrong object type was passed. Button id = ", uic:Id())
				return
			end

			if button_type == "grant" then
				if has_autonomy then
					uic:SetVisible(false)
					return
				end
			elseif button_type == "remove" then
				if not has_autonomy then
					uic:SetVisible(false)
					return
				end
			else
				uic:SetVisible(false)
				script_error("Trying to setup an autonomy button but the wrong button type was passed. Button id = ", uic:Id())
				return
			end

			uic:SetVisible(true)

			local cooldowns_table = tribes_privileges.persistent.conversion_cooldowns[object_type]
			local cooldown = cooldowns_table[cqi] or 0
			if cooldown > 0 then
				uic:SetState("inactive")
			else
				uic:SetState("active")
			end

			uic:SetTooltipText("{{tt:" .. tribes_privileges.config.ui.autonomy_button_tooltip_layout_path .. "}}", "", true)
		end,

		setup_autonomy_button_tooltip = function(faction_key, uic, splits)
			local button_type = splits[3] -- "ers" or "settlement" or "ers_info" or "settlement_info"
			local cqi = tonumber(splits[4])
			local object_type = ((button_type == "ers" or button_type == "ers_info") and "ers") or "settlement"
			local show_info = (button_type == "ers_info" or button_type == "settlement_info")

			local cooldowns_table = tribes_privileges.persistent.conversion_cooldowns[object_type]
			local cooldown_turns_remaining = cooldowns_table[cqi] or 0
			local in_cooldown = cooldown_turns_remaining > 0

			local has_autonomy = false
			local is_tribal_ers = false
			local points = 0
			local title = ""
			local description = ""
			local effect_bundle_key = ""

			if object_type == "ers" then
				local ers = cm:model():region_slot_for_command_queue_index(cqi)
				local slot_index = tribes_privileges.get_ers_slot_index(ers)
				local region_key = ers:region():name()

				has_autonomy = tribes_privileges.is_autonomous_ers(faction_key, region_key, slot_index)
				points = tribes_privileges.get_points_for_ers(ers:region(), ers, faction_key)
				is_tribal_ers = ers:has_building() and tribes_privileges.is_nomad_outpost_ers(ers:building())

				if is_tribal_ers then
					-- Temporarily hide effect bundle until PHAR-36502 is properly fixed
					--effect_bundle_key = tribes_privileges.config.autonomy_bundle_key_ers
					description = (has_autonomy and
						common.get_localised_string(tribes_privileges.config.ui.localization_keys.tooltip_sovereignty_description_horde_ers_revoke)) or
						common.get_localised_string(tribes_privileges.config.ui.localization_keys.tooltip_sovereignty_description_horde_ers_grant)
				else
					description = (has_autonomy and
						common.get_localised_string(tribes_privileges.config.ui.localization_keys.tooltip_sovereignty_description_settled_ers_revoke)) or
						common.get_localised_string(tribes_privileges.config.ui.localization_keys.tooltip_sovereignty_description_settled_ers_grant)
				end
			elseif object_type == "settlement" then
				local settlement = cm:model():settlement_for_command_queue_index(cqi)
				local region_key = settlement:region():name()

				has_autonomy = tribes_privileges.is_autonomous_settlement(faction_key, region_key)
				points = tribes_privileges.get_points_for_settlement(settlement:region(), faction_key)
				effect_bundle_key = tribes_privileges.get_settlement_autonomy_bundle_key(settlement:region())

				description = (has_autonomy and
					common.get_localised_string(tribes_privileges.config.ui.localization_keys.tooltip_sovereignty_description_settlement_revoke)) or
					common.get_localised_string(tribes_privileges.config.ui.localization_keys.tooltip_sovereignty_description_settlement_grant)
			else
				uic:SetVisible(false)
				script_error("Trying to setup an autonomy button tooltip but the wrong object type was passed. object_type = ", object_type)
				return
			end

			if show_info then
				local title_and_desc = (button_type == "ers_info" and
					common.get_localised_string(tribes_privileges.config.ui.localization_keys.tooltip_sovereignty_info_ers)) or
					common.get_localised_string(tribes_privileges.config.ui.localization_keys.tooltip_sovereignty_info_settlement)
				local delim_pos = string.find(title_and_desc, "||")
		
				title = (delim_pos and string.sub(title_and_desc, 1, delim_pos - 1)) or title_and_desc
				description = (delim_pos and effect_bundle_key == "" and string.sub(title_and_desc, delim_pos + 2)) or ""
			else
				title = (has_autonomy and
					common.get_localised_string(tribes_privileges.config.ui.localization_keys.tooltip_sovereignty_title_revoke) or
					common.get_localised_string(tribes_privileges.config.ui.localization_keys.tooltip_sovereignty_title_grant))
				
				-- Show negative points when granting autonomy, positive when revoking
				if has_autonomy ~= (points > 0) then
					points = -points
				end

				-- Don't show effects bundle when revoking autonomy
				if has_autonomy then
					effect_bundle_key = ""
				end
			end

			local cco_id = "tribes_privileges_autonomy_button_tooltip"
			local cco_table = {
				Title = title,
				Description = description,
				Cooldown = (in_cooldown and not show_info and tostring(cooldown_turns_remaining)) or "",
				Alert = ((has_autonomy or show_info) and "") or common.get_localised_string(tribes_privileges.config.ui.localization_keys.tooltip_sovereignty_grant_alert),
				Warning = (in_cooldown and not show_info and common.get_localised_string(tribes_privileges.config.ui.localization_keys.tooltip_sovereignty_warning_cooldown)) or "",
				Action = (not in_cooldown and not show_info and common.get_localised_string(tribes_privileges.config.ui.localization_keys.tooltip_sovereignty_action)) or "",
				Flavor = "",

				EffectsTitle = (effect_bundle_key ~= "" and common.get_localised_string(tribes_privileges.config.ui.localization_keys.tooltip_sovereignty_effects_title)) or "",
				EffectBundleKey = effect_bundle_key,

				PointsVisible = (points ~= 0),
				PointsTitle = ((has_autonomy and
					common.get_localised_string(tribes_privileges.config.ui.localization_keys.tooltip_sovereignty_restored_points_title)) or
					common.get_localised_string(tribes_privileges.config.ui.localization_keys.tooltip_sovereignty_negated_points_title))
					.. ":",
				PointsLabel = (is_tribal_ers and
					common.get_localised_string(tribes_privileges.config.ui.localization_keys.tooltip_sovereignty_horde_points_label)) or
					common.get_localised_string(tribes_privileges.config.ui.localization_keys.tooltip_sovereignty_settled_points_label),
				Points = (points > 0 and "+" .. tostring(points)) or tostring(points),
				PointsNegative = (points < 0),
			}

			uic:SetProperty("script_id", cco_id)
			common.set_context_value(cco_id, cco_table)
		end,

		setup_change_army_type_button = function(faction_key, uic, splits)
			local button_type = splits[3] -- "to_horde" or "to_settled"
			local cqi = tonumber(splits[4])

			local tribes_unlocked = forge_path.is_system_unlocked_by_faction("tribes_privileges", faction_key)

			if not tribes_unlocked then
				uic:SetVisible(false)
				return
			end

			local character = cm:model():character_for_command_queue_index(cqi)
			if not character or character:is_null_interface() then
				uic:SetVisible(false)
				return
			end

			local military_force = character:military_force()
			if not military_force or military_force:is_null_interface() then
				uic:SetVisible(false)
				return
			end

			local is_horde = tribes_privileges.is_horde_type(military_force)

			if button_type == "to_horde" then
				if is_horde then
					uic:SetVisible(false)
					return
				end
			elseif button_type == "to_settled" then
				if not is_horde then
					uic:SetVisible(false)
					return
				end
			else
				script_error("Trying to setup a swap army type button but the wrong button type was passed. Button id = ", uic:Id())
				uic:SetVisible(false)
				return
			end

			uic:SetVisible(true)

			local cooldowns_table = tribes_privileges.persistent.conversion_cooldowns.character
			local cooldown = cooldowns_table[cqi] or 0
			if cooldown > 0 then
				uic:SetState("inactive")
			end

			uic:SetTooltipText("{{tt:" .. tribes_privileges.config.ui.change_army_type_button_tooltip_layout_path .. "}}", "", true)
		end,

		setup_change_army_type_button_tooltip = function(uic, splits)
			local object_type = "character"
			local button_type = splits[3] -- "army_info" or "to_settled" or "to_horde"
			local cqi = tonumber(splits[4])

			local character = cm:model():character_for_command_queue_index(cqi)
			local military_force = character:military_force()
			local is_horde = tribes_privileges.is_horde_type(military_force)

			local cooldowns_table = tribes_privileges.persistent.conversion_cooldowns[object_type]
			local cooldown_turns_remaining = cooldowns_table[cqi] or 0
			local in_cooldown = cooldown_turns_remaining > 0
			local effect_bundle_key = (is_horde == (button_type ~= "army_info") and
				tribes_privileges.config.settled_force_bundle) or
				tribes_privileges.config.horde_force_bundle

			local cco_id = "tribes_privileges_change_army_type_button_tooltip"
			local cco_table = {}

			if button_type == "army_info" then
				local show_effect = cm:get_bool_script_state(military_force, "army_type_effects_applied")
				local title_and_no_effects_desc = (is_horde and
					common.get_localised_string(tribes_privileges.config.ui.localization_keys.tooltip_change_army_type_info_horde)) or
					common.get_localised_string(tribes_privileges.config.ui.localization_keys.tooltip_change_army_type_info_settled)
				local delim_pos = string.find(title_and_no_effects_desc, "||")

				cco_table = {
					Title = (delim_pos and string.sub(title_and_no_effects_desc, 1, delim_pos - 1)) or title_and_no_effects_desc,
					Description = (delim_pos and string.sub(title_and_no_effects_desc, delim_pos + 2)) or "",
					Cooldown = "",
					Alert = "",
					Warning = "",
					Action = "",
					Flavor = "",
					PointsVisible = false,
					EffectsTitle = "",
					EffectBundleKey = (show_effect and effect_bundle_key) or "",
				}
			else
				cco_table = {
					Title = (is_horde and
						common.get_localised_string(tribes_privileges.config.ui.localization_keys.tooltip_change_army_type_title_is_horde)) or
						common.get_localised_string(tribes_privileges.config.ui.localization_keys.tooltip_change_army_type_title_is_settled),
					Description = (is_horde and
						common.get_localised_string(tribes_privileges.config.ui.localization_keys.tooltip_change_army_type_description_is_horde)) or
						common.get_localised_string(tribes_privileges.config.ui.localization_keys.tooltip_change_army_type_description_is_settled),
					Cooldown = (in_cooldown and tostring(cooldown_turns_remaining)) or "",
					Alert = "",
					Warning = (in_cooldown and common.get_localised_string(tribes_privileges.config.ui.localization_keys.tooltip_change_army_type_warning_cooldown)) or "",
					Action = (not in_cooldown and common.get_localised_string(tribes_privileges.config.ui.localization_keys.tooltip_change_army_type_action)) or "",
					Flavor = "",
					PointsVisible = false,
					EffectsTitle = "",
					EffectBundleKey = effect_bundle_key,
				}
			end

			uic:SetProperty("script_id", cco_id)
			common.set_context_value(cco_id, cco_table)
		end,

		set_text_to_unit_blades_points = function(uic, splits)
			local unit_key = splits[3]
			local blades_points = tribes_privileges.get_blades_points_for_unit(unit_key)

			uic:SetText(tostring(blades_points))
			common.send_ui_update_message("sea_tribes_privileges_update_sources_list_unit_visibility")
		end,

		get_settlement_factor_name = function(cqi)
			local settlement = cm:model():settlement_for_command_queue_index(cqi)
			local building = settlement:primary_slot():building()
			local settlement_tier = building:ui_level()
			local is_major = settlement:region():is_province_capital()

			local major_string_key = tribes_privileges.config.ui.localization_keys.tooltip_sources_list_major_settlement
			local minor_string_key = tribes_privileges.config.ui.localization_keys.tooltip_sources_list_minor_settlement
			local level_to_string_key = tribes_privileges.config.ui.localization_keys.tooltip_sources_list_settlement_tier

			local major_or_minor_unistring = common.get_localised_string((is_major and major_string_key) or minor_string_key)
			local tier_unistring = common.get_localised_string(level_to_string_key[settlement_tier])
			return major_or_minor_unistring .. " - " .. tier_unistring
		end,

		reset_main_panel = function()
			local popup_message_box_component = core:get_ui_root():SequentialFind(tribes_privileges.config.ui.component_ids.popup_message_box)
			if popup_message_box_component then
				popup_message_box_component:Destroy()
			end

			tribes_privileges.ui.delete_component_cache()
			tribes_privileges:set_enable_ui_listeners(false)
		end,

		delete_component_cache = function()
			tribes_privileges.component_cache = {}
		end,

		toggle_dev_ui = function()
			local sea_peoples_dev_ui_panel_component, just_created = core:get_or_create_component("dev_ui_sea_peoples", "UI/dev_ui/dev_ui_sea_peoples")
			if not sea_peoples_dev_ui_panel_component then
				script_error("The Sea Peoples DEV UI layout was not found!")
				return
			end
			local should_show = not sea_peoples_dev_ui_panel_component:Visible() or just_created
			sea_peoples_dev_ui_panel_component:SetVisible(should_show)
		end,
	},-- tribes_privileges.ui
}

for factor_unique_id, factor_key in pairs(tribes_privileges.config.factor_unique_id_to_factor_key) do
	tribes_privileges.config.factor_key_to_factor_unique_id[factor_key] = factor_unique_id
end

cm:add_saving_game_callback(
	function(context)
		if not is_table(tribes_privileges.persistent) then
			script_error("tribes_privileges.persistent table is invalid!")
			return
		end

		cm:save_named_value("tribes_privileges", tribes_privileges.persistent, context)
	end
)

cm:add_loading_game_callback(
	function(context)
		if not is_table(tribes_privileges.persistent) then
			script_error("tribes_privileges.persistent table is invalid!")
			return
		end

		tribes_privileges.persistent = cm:load_named_value("tribes_privileges", tribes_privileges.persistent, context)

		if tribes_privileges.persistent.factions == nil or table.is_empty(tribes_privileges.persistent.factions) then
			tribes_privileges.persistent.factions = {}
			for i = 1, #sea_peoples_playable_faction_keys do
				local faction_key = sea_peoples_playable_faction_keys[i]
				local faction_data = {
					current_cell_bundle_key = "",
					num_turns_in_current_cell = 0,
					factors_table = { dwelling = {}, blades = {} }
				}
				tribes_privileges.persistent.factions[faction_key] = faction_data
			end
		end

		if tribes_privileges.persistent.autonomous_regions == nil or table.is_empty(tribes_privileges.persistent.autonomous_regions) then
			tribes_privileges.persistent.autonomous_regions = {}
			for i = 1, #sea_peoples_playable_faction_keys do
				local faction_key = sea_peoples_playable_faction_keys[i]
				tribes_privileges.persistent.autonomous_regions[faction_key] = {}
			end
		end

		if tribes_privileges.persistent.achish_ceremony_stats == nil or table.is_empty(tribes_privileges.persistent.achish_ceremony_stats) then
			tribes_privileges.persistent.achish_ceremony_stats = {}
		end

		if tribes_privileges.persistent.pinned_cell == nil or table.is_empty(tribes_privileges.persistent.pinned_cell) then
			tribes_privileges.persistent.pinned_cell = {}
			for i = 1, #sea_peoples_playable_faction_keys do
				local faction_key = sea_peoples_playable_faction_keys[i]
				tribes_privileges.persistent.pinned_cell[faction_key] = ""
			end
		end

		for i = 1, #sea_peoples_playable_faction_keys do
			local faction_key = sea_peoples_playable_faction_keys[i]
			if not tribes_privileges.persistent.factions[faction_key].factors_table then
				tribes_privileges.persistent.factions[faction_key].factors_table = { dwelling = {}, blades = {} }
			end
		end

		if tribes_privileges.persistent.conversion_cooldowns == nil or table.is_empty(tribes_privileges.persistent.conversion_cooldowns) then
			tribes_privileges.persistent.conversion_cooldowns = {
				character = { },
				settlement = { },
				ers = { },
			}
		end

		if tribes_privileges.persistent.pre_battle_points == nil then
			tribes_privileges.persistent.pre_battle_points = {}
		end
	end
)


-------------
--- LISTENERS
core:add_listener(
	"tribes_privileges_FirstTickAfterWorldCreated",
	"FirstTickAfterWorldCreated",
	true,
	function(context)
		for _, faction_key in ipairs(tribes_privileges.config.sea_horde_faction_keys) do
			cm:set_script_state(cm:get_faction(faction_key), "sea_horde_faction_shared_state", true)
		end
	end,
	false
)

core:add_listener(
	"tribes_privileges_RoundStart",
	"RoundStart",
	true,
	function(context)
		for _, cooldowns in pairs(tribes_privileges.persistent.conversion_cooldowns) do
			for cqi, cooldown in pairs(cooldowns) do
				cooldown = cooldown - 1
				if cooldown <= 0 then
					cooldowns[cqi] = nil
				else
					cooldowns[cqi] = cooldown
				end
			end
		end
	end,
	true
)

core:add_listener(
	"tribes_privileges_FactionTurnStart",
	"FactionTurnStart",
	true,
	function(context)
		local faction_key = context:faction():name()
		if not tribes_privileges.is_faction_applicable(faction_key) then
			return
		end

		tribes_privileges.on_turn_start(faction_key)
		tribes_privileges.log_faction_stats(faction_key)

		local cell_category = tribes_privileges.get_current_cell_category(faction_key)
		core:trigger_event("ScriptStartedTurnWithTribeCategory", { faction = context:faction(), tribe_category = cell_category })
	end,
	true
)

function tribes_privileges:set_enable_model_listeners(should_enable)
	if should_enable then
		-- MILITARY_FORCE_CREATED (C++)
		core:add_listener(
			"tribes_privileges_MilitaryForceCreated",
			"MilitaryForceCreated",
			true,
			function(context)
				local force = context:military_force_created()
				local faction_key = force:faction():name()
				if not tribes_privileges.is_faction_applicable(faction_key) then
					return
				end

				tribes_privileges.apply_effects_to_force(force, true)
			end,
			true
		)

		-- BATTLE_BEING_FOUGHT (C++), called when a battle starts or auto-resolved
		core:add_listener(
			"tribes_privileges_BattleBeingFought",
			"BattleBeingFought",
			true,
			function(context)
				local battle = context:pending_battle()

				local faction_keys_considered = {}

				if battle:has_attacker() then
					local attacker_faction_key = battle:attacker_faction():name()
					if tribes_privileges.is_faction_applicable(attacker_faction_key) then
						table_add_unique(faction_keys_considered, attacker_faction_key)
					end
				end

				if battle:has_defender() then
					local defender_faction_key = battle:defender_faction():name()
					if tribes_privileges.is_faction_applicable(defender_faction_key) then
						table_add_unique(faction_keys_considered, defender_faction_key)
					end
				end

				local secondary_attackers = battle:secondary_attackers()
				local last_secondary_attacker = secondary_attackers:num_items() - 1
				for i = 0, last_secondary_attacker do
					local secondary_attacker = secondary_attackers:item_at(i)
					if secondary_attacker and not secondary_attacker:is_null_interface() and tribes_privileges.is_faction_applicable(secondary_attacker:faction():name()) then
						table_add_unique(faction_keys_considered, secondary_attacker:faction():name())
					end
				end

				local secondary_defenders = battle:secondary_defenders()
				local last_secondary_defender = secondary_defenders:num_items() - 1
				for i = 0, last_secondary_defender do
					local secondary_defender = secondary_defenders:item_at(i)
					if secondary_defender and not secondary_defender:is_null_interface() and tribes_privileges.is_faction_applicable(secondary_defender:faction():name()) then
						table_add_unique(faction_keys_considered, secondary_defender:faction():name())
					end
				end

				for _, faction_key in ipairs(faction_keys_considered) do
					if not is_table(tribes_privileges.persistent.pre_battle_points[faction_key]) then
						tribes_privileges.persistent.pre_battle_points[faction_key] = {}
						tribes_privileges.persistent.pre_battle_points[faction_key].dwelling_points = tribes_privileges.get_dwelling_points(faction_key)
						tribes_privileges.persistent.pre_battle_points[faction_key].blades_points = tribes_privileges.get_blades_points(faction_key)
					end
				end
			end,
			true,
			true
		)

		-- BATTLE_CONFLICT_FINISHED (C++), used to recalculate points after returning from battle to account for unit losses of applicable factions etc.
		core:add_listener(
			"tribes_privileges_BattleConflictFinished",
			"BattleConflictFinished",
			true,
			function(context)
				local battle = context:pending_battle()

				-- assess participating factions
				local faction_keys_for_points_recalculation = {}

				if battle:has_attacker() then
					local attacker_faction_key = battle:attacker_faction():name()
					if tribes_privileges.is_faction_applicable(attacker_faction_key) then
						table_add_unique(faction_keys_for_points_recalculation, attacker_faction_key)
					end
				end

				if battle:has_defender() then
					local defender_faction_key = battle:defender_faction():name()
					if tribes_privileges.is_faction_applicable(defender_faction_key) then
						table_add_unique(faction_keys_for_points_recalculation, defender_faction_key)
					end
				end

				local secondary_attackers = battle:secondary_attackers()
				local last_secondary_attacker = secondary_attackers:num_items() - 1
				for i = 0, last_secondary_attacker do
					local secondary_attacker = secondary_attackers:item_at(i)
					if secondary_attacker and not secondary_attacker:is_null_interface() and tribes_privileges.is_faction_applicable(secondary_attacker:faction():name()) then
						table_add_unique(faction_keys_for_points_recalculation, secondary_attacker:faction():name())
					end
				end

				local secondary_defenders = battle:secondary_defenders()
				local last_secondary_defender = secondary_defenders:num_items() - 1
				for i = 0, last_secondary_defender do
					local secondary_defender = secondary_defenders:item_at(i)
					if secondary_defender and not secondary_defender:is_null_interface() and tribes_privileges.is_faction_applicable(secondary_defender:faction():name()) then
						table_add_unique(faction_keys_for_points_recalculation, secondary_defender:faction():name())
					end
				end

				-- apply results
				local is_settlement_battle = battle:contested_garrison() and not battle:contested_garrison():is_null_interface() and true or false

				for _, faction_key in ipairs(faction_keys_for_points_recalculation) do
					local pre_battle_dwelling_points = tribes_privileges.persistent.pre_battle_points[faction_key].dwelling_points
					local pre_battle_blades_points = tribes_privileges.persistent.pre_battle_points[faction_key].blades_points

					tribes_privileges.calculate_points(faction_key)

					-- show dwelling & blades points as "loot" to the local faction whether they won, lost, or come to a draw
					local dwelling_points_difference = tribes_privileges.get_dwelling_points(faction_key) - pre_battle_dwelling_points
					if dwelling_points_difference ~= 0 then
						local factor_key = dwelling_points_difference > 0 and tribes_privileges.config.factors.dwelling.settled.building or tribes_privileges.config.factors.dwelling.horde.building
						cm:faction_add_post_battle_looted_resource(faction_key, tribes_privileges.config.resource_keys.dwelling, factor_key, dwelling_points_difference, false)
					end
					local blades_points_difference = tribes_privileges.get_blades_points(faction_key) - pre_battle_blades_points
					if blades_points_difference ~= 0 then
						local factor_key = blades_points_difference > 0 and tribes_privileges.config.factors.blades.settled.units or tribes_privileges.config.factors.blades.horde.units
						cm:faction_add_post_battle_looted_resource(faction_key, tribes_privileges.config.resource_keys.blades, factor_key, blades_points_difference, false)
					end

					tribes_privileges.persistent.pre_battle_points[faction_key] = nil
				end
			end,
			true,
			true
		)

		-- ui listener
		core:add_listener(
			"tribes_privileges_PanelOpenedCampaign_settlement_captured",
			"PanelOpenedCampaign",
			function(context)
				return context.string == "settlement_captured"
			end,
			function(context)
				local local_faction_key = cm:get_local_faction_name(true)
				if not tribes_privileges.is_faction_applicable(local_faction_key) then
					return
				end

				local contested_garrison = cm:model():pending_battle():contested_garrison()
				local region
				if contested_garrison and not contested_garrison:is_null_interface() then
					region = contested_garrison:region()
				else
					-- if there's no contested_garrison then the settlement is being captured "unopposed"
					region = cm:get_region(tribes_privileges.temporary_garrison_region_key)
					tribes_privileges.temporary_garrison_region_key = ""
				end

				local is_inapplicable_occupation_decision = function(occupation_decision)
					return not is_string(occupation_decision)
						or occupation_decision == ""
						or occupation_decision == "occupation_decision_raze"
						or occupation_decision == "occupation_decision_raze_without_occupy"
						or occupation_decision == "occupation_decision_raze_and_exterminate"
						or occupation_decision == "occupation_decision_sack"
						or occupation_decision == "occupation_decision_do_nothing"
						or occupation_decision == "occupation_decision_colonise"
						or occupation_decision == "occupation_decision_ers_raze_without_occupy"	-- only applicable for ERS
						or occupation_decision == "occupation_decision_ers_sack"				-- only applicable for ERS
				end

				local is_ers_occupation = tribes_privileges.temporary_garrison_slot_cqi ~= nil

				local uic = UIComponent(context.component)
				local template_holder_component = uic:SequentialFind(tribes_privileges.config.ui.component_ids.settlement_captured_template_holder)
				for i = 0, template_holder_component:ChildCount() - 1 do
					local component = UIComponent(template_holder_component:Find(i))
					local settlement_capture_option_button_component = component:SequentialFind(tribes_privileges.config.ui.component_ids.settlement_capture_option_button)
					local occupation_decision = settlement_capture_option_button_component and settlement_capture_option_button_component:GetProperty("audio_option_id")

					if not is_inapplicable_occupation_decision(occupation_decision) then
						local dwelling_points_difference = 0
						local blades_points_difference = 0

						if is_ers_occupation then
							local ers = cm:model():region_slot_for_command_queue_index(tribes_privileges.temporary_garrison_slot_cqi)
							dwelling_points_difference, blades_points_difference = tribes_privileges.get_points_for_ers(ers:region(), ers, local_faction_key, true)
						else
							-- during "occupation_decision_occupy" ("Occupy") and "occupation_decision_loot" ("Loot and Occupy") the main building level of the settlement is reduced by 1 (min=1)
							dwelling_points_difference, blades_points_difference = tribes_privileges.get_points_for_settlement(region, local_faction_key, nil, (occupation_decision == "occupation_decision_occupy" or occupation_decision == "occupation_decision_loot") and -1 or 0)
						end
						local are_dwelling_points_changed = dwelling_points_difference ~= 0
						local are_blades_points_changed = blades_points_difference ~= 0

						local dwelling_points_indicator_component = component:SequentialFind(tribes_privileges.config.ui.component_ids.settlement_captured_dwelling_points_indicator)
						if dwelling_points_indicator_component then
							if are_dwelling_points_changed then
								dwelling_points_indicator_component:SequentialFind(tribes_privileges.config.ui.component_ids.settlement_captured_option_icon):SetState(dwelling_points_difference > 0 and tribes_privileges.config.ui.component_states.dwelling_settled or tribes_privileges.config.ui.component_states.dwelling_horde)
								dwelling_points_indicator_component:SetText(math.abs(dwelling_points_difference))
							end
							dwelling_points_indicator_component:SetVisible(are_dwelling_points_changed)
						end

						local blades_points_indicator_component = component:SequentialFind(tribes_privileges.config.ui.component_ids.settlement_captured_blades_points_indicator)
						if blades_points_indicator_component then
							if are_blades_points_changed then
								blades_points_indicator_component:SequentialFind(tribes_privileges.config.ui.component_ids.settlement_captured_option_icon):SetState(blades_points_difference > 0 and tribes_privileges.config.ui.component_states.blades_settled or tribes_privileges.config.ui.component_states.blades_horde)
								blades_points_indicator_component:SetText(math.abs(blades_points_difference))
							end
							blades_points_indicator_component:SetVisible(are_blades_points_changed)
						end
					end
				end

				tribes_privileges.temporary_garrison_slot_cqi = nil
			end,
			true,
			true
		)

		-- ui listener
		-- CHARACTER_CAPTURED_SETTLEMENT_UNOPPOSED (C++)
		core:add_listener(
			"tribes_privileges_CharacterCapturedSettlementUnopposed",
			"CharacterCapturedSettlementUnopposed",
			true,
			function(context)
				local garrison = context:garrison_residence()
				if garrison and not garrison:is_null_interface() then
					tribes_privileges.temporary_garrison_region_key = garrison:region():name()
				end
			end,
			true,
			true
		)

		-- ui listener
		-- GARRISON_ATTACKED_EVENT (C++)
		core:add_listener(
			"tribes_privileges_GarrisonAttackedEvent",
			"GarrisonAttackedEvent",
			true,
			function(context)
				local garrison = context:garrison_residence()
				if garrison:is_slot() and tribes_privileges.is_faction_applicable(context:character():faction():name()) then
					local region_slot = garrison:slot_interface()

					local is_ers_slot = region_slot:is_infrastructure_slot()
					local has_finished_construction = region_slot:has_building()
					if is_ers_slot and has_finished_construction then
						tribes_privileges.temporary_garrison_slot_cqi = region_slot:command_queue_index()
					end
				else
					tribes_privileges.temporary_garrison_slot_cqi = nil
				end
			end,
			true,
			true
		)

		-- NEW_CHARACTER_RECRUITED (C++)
		core:add_listener(
			"tribes_privileges_NewCharacterRecruited",
			"NewCharacterRecruited",
			true,
			function(context)
				local faction_key = context:character():faction():name()
				if not tribes_privileges.is_faction_applicable(faction_key) then
					return
				end
				tribes_privileges.calculate_points(faction_key)
			end,
			true,
			true
		)

		-- CHARACTER_ENTERS_MILITARY_FORCE (C++)
		core:add_listener(
			"tribes_privileges_CharacterEntersMilitaryForce",
			"CharacterEntersMilitaryForce",
			true,
			function(context)
				local faction_key = context:character():faction():name()
				if not tribes_privileges.is_faction_applicable(faction_key) then
					return
				end
				tribes_privileges.calculate_points(faction_key)
			end,
			true,
			true
		)

		-- CHARACTER_LEAVES_MILITARY_FORCE (C++)
		core:add_listener(
			"tribes_privileges_CharacterLeavesMilitaryForce",
			"CharacterLeavesMilitaryForce",
			true,
			function(context)
				local faction_key = context:character():faction():name()
				if not tribes_privileges.is_faction_applicable(faction_key) then
					return
				end
				tribes_privileges.calculate_points(faction_key)
			end,
			true,
			true
		)

		-- REGION_FACTION_CHANGE_EVENT (C++)
		core:add_listener(
			"tribes_privileges_RegionFactionChangeEvent",
			"RegionFactionChangeEvent",
			true,
			function(context)
				local region = context:region()

				local previous_owning_faction_key = context:previous_faction():name()
				if tribes_privileges.is_faction_applicable(previous_owning_faction_key) then
					tribes_privileges.calculate_points(previous_owning_faction_key)
				end

				local new_owning_faction_key = region:owning_faction():name()
				if tribes_privileges.is_faction_applicable(new_owning_faction_key) then
					tribes_privileges.calculate_points(new_owning_faction_key)
				end
			end,
			true,
			true
		)

		-- CHARACTER_PERFORMS_REGION_SLOT_OCCUPATION_DECISION_BEFORE_OUTCOME_APPLICATION (C++)
		core:add_listener(
			"tribes_privileges_CharacterPerformsRegionSlotOccupationDecisionBeforeOutcomeApplication",
			"CharacterPerformsRegionSlotOccupationDecisionBeforeOutcomeApplication",
			true,
			function(context)
				local region_slot = context:region_slot()
				local region = region_slot:garrison_residence():region()
				if not region or region:is_null_interface() then
					return	-- can happen for sea regions
				end

				local previous_owning_faction_key = region_slot:faction():name()
				if tribes_privileges.is_faction_applicable(previous_owning_faction_key) then
					tribes_privileges.calculate_points(previous_owning_faction_key)
				end

				local new_owning_faction_key = context:character():faction()
				local occupation_decision = context:occupation_decision_option()
				if tribes_privileges.is_faction_applicable(new_owning_faction_key) and
					(occupation_decision == "occupation_decision_occupy" or occupation_decision == "occupation_decision_loot" or occupation_decision == "occupation_decision_colonise")
				then
					tribes_privileges.calculate_points(new_owning_faction_key)
				end
			end,
			true,
			true
		)

		-- UNIT_RECRUITED_EVENT (C++)
		core:add_listener(
			"tribes_privileges_UnitTrained",
			"UnitTrained",
			true,
			function(context)
				local unit = context:unit()
				local faction_key = unit:faction():name()
				if not tribes_privileges.is_faction_applicable(faction_key) then
					return
				end

				if not tribes_privileges.does_force_contribute_to_points(unit:military_force()) then
					return
				end

				tribes_privileges.calculate_points(faction_key)
			end,
			true,
			true
		)

		-- UNIT_DISBANDED_EVENT (C++)
		-- As of 13-DEC-2023, when a UNIT is disbanded "UnitDestroyed" and "UnitMergedAndDestroyed" listeners are not dispatched.
		core:add_listener(
			"tribes_privileges_UnitDisbanded",
			"UnitDisbanded",
			true,
			function(context)
				local unit = context:unit()
				local faction_key = unit:faction():name()
				if not tribes_privileges.is_faction_applicable(faction_key) then
					return
				end

				if not tribes_privileges.does_force_contribute_to_points(unit:military_force()) then
					return
				end

				cm:callback(
					function()
						-- when "UnitDisbanded" triggers, the unit hasn't yet been disengaged from its force
						-- hence calling tribes_privileges.calculate_points would account for it
						-- to make sure this doesn't happen I have decided to add a 0.1s time delay before calling it to calculate the updated amount of points
						tribes_privileges.calculate_points(faction_key)
					end,
					0.1
				)
			end,
			true,
			true
		)

		-- UNIT_DESTROYED_EVENT (C++)
		core:add_listener(
			"tribes_privileges_UnitDestroyed",
			"UnitDestroyed",
			true,
			function(context)
				local unit = context:unit()
				local faction_key = unit:faction():name()
				if not tribes_privileges.is_faction_applicable(faction_key) then
					return
				end

				tribes_privileges.calculate_points(faction_key)
			end, 
			true,
			true
		)

		-- UNIT_MERGED_AND_DESTROYED_EVENT (C++)
		core:add_listener(
			"tribes_privileges_UnitMergedAndDestroyed",
			"UnitMergedAndDestroyed",
			true,
			function(context)
				local unit = context:unit()
				local faction_key = unit:faction():name()
				if not tribes_privileges.is_faction_applicable(faction_key) then
					return
				end

				tribes_privileges.calculate_points(faction_key)
			end, 
			true,
			true
		)

		-- BUILDING_COMPLETED_EVENT (C++), used for instant building construction/upgrading
		core:add_listener(
			"tribes_privileges_BuildingCompleted",
			"BuildingCompleted",
			true,
			function(context)
				local faction_key = context:building():faction():name()
				if not tribes_privileges.is_faction_applicable(faction_key) then
					return
				end

				tribes_privileges.calculate_points(faction_key)
			end,
			true,
			true
		)

		-- CHARACTER_SKILL_POINT_ALLOCATED (C++), used for when characters allocate skill points (competences)
		core:add_listener(
			"tribes_privileges_CharacterSkillPointAllocated",
			"CharacterSkillPointAllocated",
			true,
			function(context)
				local character = context:character()
				if not cm:char_is_general_with_army(character) then
					return
				end

				local faction_key = character:faction():name()
				if not tribes_privileges.is_faction_applicable(faction_key) then
					return
				end

				tribes_privileges.calculate_points(faction_key)
			end,
			true,
			true
		)

		-- FACTION_END_TURN (C++)
		core:add_listener(
			"tribes_privileges_FactionTurnEnd",
			"FactionTurnEnd",
			true,
			function(context)
				tribes_privileges.temporary_garrison_region_key = ""
				tribes_privileges.temporary_garrison_slot_cqi = nil
			end,
			true,
			true
		)
	else
		core:remove_listener("tribes_privileges_MilitaryForceCreated")
		core:remove_listener("tribes_privileges_BattleBeingFought")
		core:remove_listener("tribes_privileges_BattleConflictFinished")
		core:remove_listener("tribes_privileges_PanelOpenedCampaign_settlement_captured")
		core:remove_listener("tribes_privileges_CharacterCapturedSettlementUnopposed")
		core:remove_listener("tribes_privileges_GarrisonAttackedEvent")
		core:remove_listener("tribes_privileges_NewCharacterRecruited")
		core:remove_listener("tribes_privileges_CharacterEntersMilitaryForce")
		core:remove_listener("tribes_privileges_CharacterLeavesMilitaryForce")
		core:remove_listener("tribes_privileges_RegionFactionChangeEvent")
		core:remove_listener("tribes_privileges_CharacterPerformsRegionSlotOccupationDecisionBeforeOutcomeApplication")
		core:remove_listener("tribes_privileges_UnitTrained")
		core:remove_listener("tribes_privileges_UnitDisbanded")
		core:remove_listener("tribes_privileges_UnitDestroyed")
		core:remove_listener("tribes_privileges_UnitMergedAndDestroyed")
		core:remove_listener("tribes_privileges_BuildingCompleted")
		core:remove_listener("tribes_privileges_CharacterSkillPointAllocated")
		core:remove_listener("tribes_privileges_FactionTurnEnd")
	end
end

-- create the panel in memory and place it in the UI hierarchy
-- ui listener "PanelOpenedCampaign" responds to CampaignHUDCallback::OpenHUDPanel -> TWUI::ComponentUtilities::CreateFromLayout
core:add_listener(
	"tribes_privileges_PanelOpenedCampaign",
	"PanelOpenedCampaign",
	function(context)
		return context.string == tribes_privileges.config.ui.panel_name
	end,
	function(context)
		local local_faction_key = cm:get_local_faction_name(true)
		tribes_privileges.ui.init_main_panel(local_faction_key)
	end,
	true
)

-- ui listener
core:add_listener(
	"tribes_privileges_PanelClosedCampaign",
	"PanelClosedCampaign",
	function(context)
		return context.string == tribes_privileges.config.ui.panel_name
	end,
	function(context)
		tribes_privileges.ui.reset_main_panel()
	end,
	true
)

-- ui listener triggered from TriggerScriptEvent (C++) / UITriggerScriptEvent (LUA)
core:add_listener(
	"tribes_privileges_UITriggerScriptEvent",
	"UITriggerScriptEvent",
	function(context)
		return string.find(context:trigger(), "TribesPrivilegesButton")
	end,
	function(context)
		local split_tokens = context:trigger():split(":")
		local command = split_tokens[2]

		if command == "ApplyAutonomy" then
			tribes_privileges.ui.try_to_apply_autonomy(split_tokens)
			common.send_ui_update_message("tribes_privileges_refresh_sources")
		elseif command == "RemoveAutonomy" then
			tribes_privileges.ui.try_to_remove_autonomy(split_tokens)
			common.send_ui_update_message("tribes_privileges_refresh_sources")
		elseif command == "ToggleForceType" then
			tribes_privileges.ui.try_to_toggle_force_type(split_tokens)
			common.send_ui_update_message("tribes_privileges_refresh_sources")
			common.send_ui_update_message("refresh_units_panel")
		elseif command == "Disbanding" then
			cm:callback(
				function()
					common.send_ui_update_message("tribes_privileges_refresh_sources")
					common.send_ui_update_message("refresh_units_panel")
				end,
				0.2
			)
		end
	end,
	true
)

-- ui listener
core:add_listener(
	"tribes_privileges_UITriggerScriptEvent_multiplayer_replicating",
	"UITriggerScriptEvent",
	function(context)
		return string.find(context:trigger(), "TribesPrivilegesMultiplayerReplicatingEvent")
	end,
	function(context)
		local split_tokens = context:trigger():split(":")
		local command = split_tokens[2]
		local caller_faction_key = split_tokens[3]

		if command == "AchishCeremonyActivated" then
			local central_cell_bundle_key = tribes_privileges.get_central_cell_of_faction(caller_faction_key).bundle_key
			tribes_privileges.persistent.achish_ceremony_stats[caller_faction_key] = {
				remaining_duration = tribes_privileges.config.achish_ceremony.duration,
				remaining_cooldown = tribes_privileges.config.achish_ceremony.cooldown,
				bundle_key = central_cell_bundle_key,
			}

			local achish_ceremony_cost_obj = cm:create_new_custom_resource_cost()
			achish_ceremony_cost_obj:get_cost_from_record(tribes_privileges.config.achish_ceremony.resource_cost_key)
			cm:faction_apply_resource_transaction(cm:get_faction(caller_faction_key), achish_ceremony_cost_obj)

			if caller_faction_key == cm:get_local_faction_name(true) then
				local central_tile_component = tribes_privileges.ui.get_central_tile_component_of_faction(caller_faction_key)
				if central_tile_component then
					central_tile_component:SetState(tribes_privileges.config.ui.component_states.your_boat)
				end

				cm:notify_tribes_privileges_achish_ceremony_triggered()

				tribes_privileges.ui.refresh_main_panel(caller_faction_key)
			end
		elseif command == "NewTilePinned" then
			local clicked_tile_bundle_key = split_tokens[4]
			tribes_privileges.persistent.pinned_cell[caller_faction_key] = (tribes_privileges.persistent.pinned_cell[caller_faction_key] == clicked_tile_bundle_key and "") or clicked_tile_bundle_key

			if caller_faction_key == cm:get_local_faction_name(true) then
				tribes_privileges.ui.refresh_main_panel(caller_faction_key)
			end
		end
	end,
	true
)

-- ui listener
core:add_listener(
	"tribes_privileges_UITriggerScriptEvent_cheats",
	"UITriggerScriptEvent",
	function(context)
		return string.find(context:trigger(), "TribesPrivilegesButton")
	end,
	function(context)
		local split_tokens = context:trigger():split(":")
		local command = split_tokens[2]

		local local_faction_key = cm:get_local_faction_name(true)
		if not tribes_privileges.is_faction_applicable(local_faction_key) then
			script_error("Invalid faction!")
			return
		end

		if command == "CheatToggleForceType" then
			local selected_character_cqi = uim:get_char_selected_cqi()
			if selected_character_cqi and selected_character_cqi ~= "" then
				local character = cm:get_character_by_cqi(selected_character_cqi)
				if local_faction_key == character:faction():name() then
					local checks_out = tribes_privileges.toggle_force_type(character)
					if checks_out then
						tribes_privileges.calculate_points(local_faction_key)
					end
				end
			end
		elseif command == "CheatApplyAutonomyBundle" then
			local selected_region_key, selected_slot_index = uim:get_selected_region_slot()

			if selected_region_key and selected_region_key ~= "" then
				local region = cm:get_region(selected_region_key)
				if region and region:owning_faction():name() == local_faction_key then
					local checks_out
					if not selected_slot_index and not tribes_privileges.is_autonomous_settlement(local_faction_key, selected_region_key) then
						checks_out = tribes_privileges.add_autonomy_privilege_to_settlement(local_faction_key, selected_region_key)
					elseif is_number(selected_slot_index) and selected_slot_index > 0
						and not tribes_privileges.is_autonomous_ers(local_faction_key, selected_region_key, selected_slot_index)
					then
						checks_out = tribes_privileges.apply_autonomy_privilege_to_ers(local_faction_key, selected_region_key, selected_slot_index, true)
					end

					if checks_out then
						tribes_privileges.calculate_points(local_faction_key)
					end
				else
					script_error("Invalid region!")
				end
			end
		elseif command == "CheatRemoveAutonomyBundle" then
			local selected_region_key, selected_slot_index = uim:get_selected_region_slot()

			if selected_region_key and selected_region_key ~= "" then
				local region = cm:get_region(selected_region_key)
				if region and region:owning_faction():name() == local_faction_key then
					local checks_out
					if not selected_slot_index and tribes_privileges.is_autonomous_settlement(local_faction_key, selected_region_key) then
						checks_out = tribes_privileges.remove_autonomy_privilege_from_settlement(local_faction_key, selected_region_key)
					elseif is_number(selected_slot_index) and selected_slot_index > 0
						and tribes_privileges.is_autonomous_ers(local_faction_key, selected_region_key, selected_slot_index)
					then
						checks_out = tribes_privileges.apply_autonomy_privilege_to_ers(local_faction_key, selected_region_key, selected_slot_index, false)
					end

					if checks_out then
						tribes_privileges.calculate_points(local_faction_key)
					end
				else
					script_error("Invalid region!")
				end
			end
		elseif command == "CheatChangeDwellingPoints" then
			local dwelling_points_change = tonumber(split_tokens[3])

			local factor = (dwelling_points_change > 0 and tribes_privileges.config.factors.dwelling.settled.building) or tribes_privileges.config.factors.dwelling.horde.building
			cm:faction_add_pooled_resource(local_faction_key, tribes_privileges.config.resource_keys.dwelling, factor, dwelling_points_change)
			tribes_privileges.update_cell_for_faction(local_faction_key)
		elseif command == "CheatChangeBladePoints" then
			local blades_points_change = tonumber(split_tokens[3])

			local factor = (blades_points_change > 0 and tribes_privileges.config.factors.blades.settled.military_force) or tribes_privileges.config.factors.blades.horde.military_force
			cm:faction_add_pooled_resource(local_faction_key, tribes_privileges.config.resource_keys.blades, factor, blades_points_change)
			tribes_privileges.update_cell_for_faction(local_faction_key)
		end
	end,
	true
)

-- ui listener
core:add_listener(
	"tribes_privileges_ContextTriggerEvent",
	"ContextTriggerEvent",
	function(context)
		return string.find(context.string, "TribesPrivilegesContextEvent")
	end,
	function(context)
		local split_tokens = string.split(context.string, ":")
		local command = split_tokens[2]

		local get_attached_component = function()
			return UIComponent(context.component)
		end

		local local_faction_key = cm:get_local_faction_name(true)
		if command == "SetupTileTemplates" then
			tribes_privileges.ui.setup_tile_templates(local_faction_key, get_attached_component(), split_tokens[3])
		elseif command == "tooltip_value_breakdown_set_tribes_privileges_resource" then	-- called when hovering over the resource breakdown component for dwelling points and blades points (located on the top resource bar)
			local resource_key = split_tokens[3]
			tribes_privileges.ui.create_tooltip_breakdown_cco(get_attached_component(), resource_key)
		elseif command == "SetupTileEffectsHoveredOn" then
			tribes_privileges.ui.on_tile_template_mouse_on(get_attached_component(), local_faction_key, split_tokens[3])
		elseif command == "SetupTileEffectsHoveredOff" then
			tribes_privileges.ui.on_tile_template_mouse_off(local_faction_key, split_tokens[3])
		elseif command == "NewTilePinned" then
			tribes_privileges.ui.on_tile_clicked(local_faction_key, split_tokens[3])
		elseif command == "AchishCeremonyButtonHoverOn" then
			tribes_privileges.ui.on_achish_ceremony_mouse_on(local_faction_key)
		elseif command == "AchishCeremonyButtonHoverOff" then
			tribes_privileges.ui.on_achish_ceremony_mouse_off(local_faction_key)
		elseif command == "AchishCeremonyButtonClicked" then
			tribes_privileges.ui.on_achish_ceremony_clicked(local_faction_key)
		elseif command == "SetupTileTooltipRequirementsTemplates" then
			tribes_privileges.ui.setup_tile_tooltip_requirements_templates(get_attached_component(), local_faction_key, split_tokens[3])
		elseif command == "GetPointsSourcesForFactor" then
			tribes_privileges.ui.get_points_sources_for_factor(local_faction_key, split_tokens, get_attached_component())
		elseif command == "SetupDialogueBox" then
			tribes_privileges.ui.setup_dialogue_box(local_faction_key, get_attached_component(), split_tokens[3], split_tokens[4])
		elseif command == "SetupDialogueBoxForDisbanding" then
			tribes_privileges.ui.setup_dialogue_box_for_disbanding(local_faction_key, get_attached_component(), split_tokens)
		elseif command == "SetToStateIfTypeOnCooldown" then
			tribes_privileges.ui.set_to_state_if_type_on_cooldown(get_attached_component(), split_tokens)
		elseif command == "SetupTypeCooldownCounter" then
			tribes_privileges.ui.setup_type_cooldown_counter(get_attached_component(), split_tokens)
		elseif command == "SetVisibleIfMechanicUnlocked" then
			tribes_privileges.ui.set_visible_if_mechanic_unlocked(local_faction_key, get_attached_component())
		elseif command == "SetupAutonomyButton" then
			tribes_privileges.ui.setup_autonomy_button(local_faction_key, get_attached_component(), split_tokens)
		elseif command == "SetupAutonomyButtonTooltip" then
			tribes_privileges.ui.setup_autonomy_button_tooltip(local_faction_key, get_attached_component(), split_tokens)
		elseif command == "SetupChangeArmyTypeButton" then
			tribes_privileges.ui.setup_change_army_type_button(local_faction_key, get_attached_component(), split_tokens)
		elseif command == "SetupChangeArmyTypeButtonTooltip" then
			tribes_privileges.ui.setup_change_army_type_button_tooltip(get_attached_component(), split_tokens)
		elseif command == "SetTextToUnitBladesPoints" then
			tribes_privileges.ui.set_text_to_unit_blades_points(get_attached_component(), split_tokens)
		end
	end,
	true
)

function tribes_privileges:set_enable_ui_listeners(should_enable)
	if should_enable then
		-- ui listener
		core:add_listener(
			"tribes_privileges_ComponentOnTooltipShow",
			"ComponentOnTooltipShow",
			true,
			function(context)
				local component = UIComponent(context.component)
				if component:Id() ~= tribes_privileges.config.ui.component_ids.achish_ceremony_button then
					return
				end

				local local_faction_key = cm:get_local_faction_name(true)
				local tooltip_component = UIComponent(context:tooltip_object())
				tribes_privileges.ui.on_achish_ceremony_tooltip_show(local_faction_key, tooltip_component)
			end,
			true
		)

		-- ui listener
		core:add_listener(
			"tribes_privileges_ComponentMouseOn",
			"ComponentMouseOn",
			true,
			function(context)
				local hovered_component = UIComponent(context.component)
				if not uicomponent_descended_from(hovered_component, tribes_privileges.config.ui.panel_name, true) then
					return
				end

				local main_panel_component = tribes_privileges.component_cache.main_panel_component
				if not main_panel_component then
					return
				end

				local should_show_coordinate_grid = uicomponent_descended_from(hovered_component, tribes_privileges.config.ui.component_ids.strategic_map, true)
				local coordinate_values_component = main_panel_component:SequentialFind(tribes_privileges.config.ui.component_ids.coordinate_values)
				if coordinate_values_component then
					coordinate_values_component:SetVisible(should_show_coordinate_grid)
				end
			end,
			true
		)
	else
		core:remove_listener("tribes_privileges_ComponentOnTooltipShow")
		core:remove_listener("tribes_privileges_ComponentMouseOn")
	end
end



-----------------
--- FOR TESTING
function tribes_privileges:test()
	-- list points ranges of the first row cells
	for _, cell_config in ipairs(tribes_privileges.config.cells[1]) do
		local cell = tribes_privileges.get_cell_by_bundle_key(cell_config.bundle_key)
		if cell.display_name == cell_config.display_name then
			local x, y = tribes_privileges.get_cell_coords(cell)
			local points_range = tribes_privileges.get_cell_points_range(cell)
			output("'" .. cell.display_name .. "' (" .. x .. ", " .. y .. ") = [" ..
				points_range.dwelling_min .. "-" .. points_range.dwelling_max .. ", " .. points_range.blades_min .. "-" .. points_range.blades_max .. "]")
		else
			output("ERROR!")
		end
	end

	local should_be_farmers_original_cell = tribes_privileges.get_cell_by_points(0, 0)
	local points_range = tribes_privileges.get_cell_points_range(should_be_farmers_original_cell)
	local x = tribes_privileges.points_to_coord(points_range.dwelling_min, true)
	local y = tribes_privileges.points_to_coord(points_range.blades_min, false)
	local farmers_inferred_cell = tribes_privileges.get_cell_by_coords(x, y)
	if should_be_farmers_original_cell.bundle_key ~= farmers_inferred_cell.bundle_key then
		output("ERROR!")
	end

	local should_be_farmworkers_original_cell = tribes_privileges.get_cell_by_points(100, 100)
	local points_range = tribes_privileges.get_cell_points_range(should_be_farmworkers_original_cell)
	local x = tribes_privileges.points_to_coord(points_range.dwelling_min, true)
	local y = tribes_privileges.points_to_coord(points_range.blades_min, false)
	local farmworkers_inferred_cell = tribes_privileges.get_cell_by_coords(x, y)
	if should_be_farmworkers_original_cell.bundle_key ~= farmworkers_inferred_cell.bundle_key then
		output("ERROR!")
	end

	local should_be_freebooters_original_cell = tribes_privileges.get_cell_by_points(-200, -200)
	local points_range = tribes_privileges.get_cell_points_range(should_be_freebooters_original_cell)
	local x = tribes_privileges.points_to_coord(points_range.dwelling_min, true)
	local y = tribes_privileges.points_to_coord(points_range.blades_min, false)
	local freebooters_inferred_cell = tribes_privileges.get_cell_by_coords(x, y)
	if should_be_freebooters_original_cell.bundle_key ~= freebooters_inferred_cell.bundle_key then
		output("ERROR!")
	end

	local should_be_cowhands_original_cell = tribes_privileges.get_cell_by_points(-300, 200)
	local points_range = tribes_privileges.get_cell_points_range(should_be_cowhands_original_cell)
	local x = tribes_privileges.points_to_coord(points_range.dwelling_min, true)
	local y = tribes_privileges.points_to_coord(points_range.blades_min, false)
	local cowhands_inferred_cell = tribes_privileges.get_cell_by_coords(x, y)
	if should_be_cowhands_original_cell.bundle_key ~= cowhands_inferred_cell.bundle_key then
		output("ERROR!")
	end

	local x_gradations = tribes_privileges.get_dwelling_gradations()
	local y_gradations = tribes_privileges.get_blades_gradations()

	local D = tribes_privileges.get_cell_by_coords(5, 6)
	local D_alt = tribes_privileges.get_cell_by_points(15, -186)

	local E = tribes_privileges.get_cell_by_coords(3, 7)
	local E_alt = tribes_privileges.get_cell_by_points(-150, -250)

	local F = tribes_privileges.get_cell_by_coords(7, 6)
	local F_alt = tribes_privileges.get_cell_by_points(243, -109)
	local F_alt2 = tribes_privileges.get_cell_by_points(230, -107)

	local herdsmen = tribes_privileges.get_cells_in_rectangle(1, 1, 4, 4)	-- ul quadrant herdsmen
	local craftsmen = tribes_privileges.get_cells_in_rectangle(5, 5, 8, 8)	-- br quadrant craftsmen
end