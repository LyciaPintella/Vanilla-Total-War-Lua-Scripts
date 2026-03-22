-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--  INFO OVERLAY SCRIPTS
--  Battle information overlays are defined here
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------


local loc_pref = "random_localisation_strings_string_"

_information_overlays = {
	-- This is an example for adding new overlays 
	--[[{
		is_battle = <bool is_battle (true/false)>,
		target_uic = {<string name of UI Component to be overlayed>},
		tooltip_text = <string location of string to be used as tooltip (formated as "<table_name>_<column>_<key>)>,
		has_scripted_tour = <bool has scripted tour (true/false) -- does this info overlay have a corresponding scripted tour
	}, ]]
	{
        is_battle = true,
        target_uic = {"battle_orders_overlay"},
		tooltip_params = {
			title = loc_pref .. "battle_orders_overlay_title",
			description = loc_pref .. "battle_orders_overlay_subtitle",
		}, 
		has_scripted_tour = false,
	},
	--[[
	{
        is_battle = true,
        target_uic = {"battle_portrait_overlay"},
		tooltip_params = {
			title = loc_pref .. "battle_portrait_overlay_title",
			description = loc_pref .. "battle_portrait_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "battle_portrait_overlay_subtitle_2"
				},
				[2] = {
					text = loc_pref .. "battle_portrait_overlay_subtitle_3"
				},
				[3] = {
					text = loc_pref .. "battle_portrait_overlay_subtitle_4",
					img = "data/ui/skins/default/icon_toggle_unit_details_info.png"
				},
				[4] = {
					text = loc_pref .. "battle_portrait_overlay_subtitle_5",
					img = "data/ui/skins/default/icon_unit_camera_info.png"
				},
			}
		}, 
		has_scripted_tour = false,
	},
	]]
	{
        is_battle = true,
        target_uic = {"battle_orders", "review_DY"},
		tooltip_params = {
			title = loc_pref .. "army_details_overlay_title",
			description = loc_pref .. "army_details_overlay_subtitle",
		}, 
		has_scripted_tour = false,
	},
	{
        is_battle = true,
        target_uic = {"hud_battle", "info_panel_holder", "UnitInfoPopup", "parchament_bachground", "panel_clip_border"},
		tooltip_params = {
			title = loc_pref .. "battle_unit_details_overlay_title",
			description = loc_pref .. "battle_unit_details_overlay_subtitle",
		}, 
		has_scripted_tour = false,
	},
	{
        is_battle = true,
        target_uic = {"balance_of_power", "bop_holder"},
		tooltip_params = {
			title = loc_pref .. "battle_balance_overlay_title",
			description = loc_pref .. "phar_main_battle_balance_overlay_subtitle",
		}, 
		has_scripted_tour = false,
	},
	{
        is_battle = true,
        target_uic = {"radar_map_overlay"},
		tooltip_params = {
			title = loc_pref .. "radar_map_overlay_title",
			description = loc_pref .. "radar_map_overlay_subtitle",
			list = {
				[1] = {
					text = loc_pref .. "radar_map_overlay_list_1"
				},
			}
		}, 
		has_scripted_tour = false,
	},
	{
        is_battle = true,
        target_uic = {"speed_controls_overlay"},
		tooltip_params = {
			title = loc_pref .. "speed_controls_overlay_title",
			description = loc_pref .. "speed_controls_overlay_subtitle",
		}, 
		has_scripted_tour = false,
	},
	{
        is_battle = true,
        target_uic = {"button_tactical_map"},
		tooltip_params = {
			title = loc_pref .. "tactical_view_button_overlay_title",
			description = loc_pref .. "tactical_view_button_overlay_subtitle",
		}, 
		has_scripted_tour = false,
	},
	{
        is_battle = true,
        target_uic = {"spacebar_options"},
		tooltip_params = {
			title = loc_pref .. "battle_spacebar_options_overlay_title",
			description = loc_pref .. "battle_spacebar_options_overlay_subtitle",
		}, 
		has_scripted_tour = false,
	},
	--[[
	{
        is_battle = true,
        target_uic = {"bop_indicator"},
		tooltip_params = {
			title = loc_pref .. "bop_frame_overlay_title",
			description = loc_pref .. "bop_frame_overlay_subtitle",
		}, 
		has_scripted_tour = false,
	},
	]]
	{
        is_battle = true,
        target_uic = {"menu_top_left", "dynamic_weather"},
		tooltip_params = {
			title = loc_pref .. "dynamic_weather_overlay_title",
			description = loc_pref .. "dynamic_weather_overlay_subtitle",
		}, 
		has_scripted_tour = false,
	},	
}

_scripted_tours = {}