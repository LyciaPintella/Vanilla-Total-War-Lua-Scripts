load_script_libraries();

bm = battle_manager:new(empire_battle:new());
alliances = bm:alliances()
player_alliance = alliances:item(bm:local_alliance())
player_army = player_alliance:armies():item(bm:local_army())
enemy_army = bm:get_first_non_player_army()
should_show_options = false
should_instantly_rematch = false
local ui_root = core:get_ui_root()
common.set_custom_loading_screen_key("troy_preview")
cam = bm:camera()

bm:register_phase_change_callback(
    "Startup", 
    function() 
        local btn_help = find_uicomponent(ui_root,"holder_tutorial_panel")
        local btn_advisor = find_uicomponent(ui_root,"holder_show_advice")
        if btn_help then
            btn_help:SetVisible(false)
        end

        if btn_advisor then
            btn_advisor:SetVisible(false)
        end
    end
)

core:add_listener(
    "preview_build_cheat_win_battle",
	"ShortcutPressed",
	function(context) return context.string == "script_F4_win" end,
    function(context) 
        enemy_army:quit_battle()
    end,
    true
)

core:add_listener(
    "preview_build_cheat_lose_battle",
	"ShortcutPressed",
	function(context) return context.string == "script_F5_lose" end,
    function(context) 
        player_army:quit_battle()
    end,
    true
)

core:add_listener(
    "preview_build_cheat_options_menu",
	"ShortcutPressed",
	function(context) return context.string == "script_F6_options" end,
    function(context) 
        should_show_options = true
        local button_menu = find_uicomponent(ui_root,"button_menu")
        button_menu:SimulateLClick()
    end,
    true
)

core:add_listener(
    "preview_build_cheat_options_menu_impl",
	"PanelOpenedBattle",
    function(context) return context.string == "esc_menu_battle" end,
    function(context) 
        if should_show_options then
            local button_options = find_uicomponent(ui_root,"button_options")
            button_options:SimulateLClick()
            should_show_options = false
        end
    end,
    true
)


core:add_listener(
    "preview_build_script_remove_esc_menu_options",
	"PanelOpenedBattle",
	function(context) return context.string == "esc_menu_battle" end,
    function(context) 
        local button_options = find_uicomponent(ui_root,"panel_manager","esc_menu_battle","menu_1","button_options")
        local button_support = find_uicomponent(ui_root,"panel_manager","esc_menu_battle","menu_1","button_support")
        local button_windows = find_uicomponent(ui_root,"panel_manager","esc_menu_battle","menu_1","button_windows")
        local button_rematch = find_uicomponent(ui_root,"panel_manager","esc_menu_battle","menu_1","button_rematch")
        --button_options:SetVisible(false)
        button_support:SetVisible(false)
        button_windows:SetVisible(false)
        button_rematch:SetVisible(true)
    end,
    true
)

core:add_listener(
    "preview_build_script",
	"PanelOpenedBattle",
    function(context) return context.string == "in_battle_results_popup" end,
    function(context) 
        local btn_load = find_uicomponent(ui_root,"button_load_replay")
        local btn_save = find_uicomponent(ui_root,"button_save_replay")
        local btn_rematch = find_uicomponent(ui_root,"button_rematch")
        btn_load:SetVisible(true)
        btn_rematch:SetVisible(true)
		btn_save:SetVisible(true)
		if should_instantly_rematch then
			btn_rematch:SimulateLClick()
		end
    end,
    true
)

core:add_listener(
    "preview_build_script_rematch",
	"ComponentLClickUp",
    function(context) return context.string == "button_rematch" end,
    function(context) 
        should_instantly_rematch = true
    end,
    true
)
