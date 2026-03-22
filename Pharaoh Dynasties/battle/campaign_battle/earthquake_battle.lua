out("earthquake_battle.lua loaded")
out("mycena_battle.lua loaded")

cam = bm:camera()
local units_player = bm:alliances():item(1):armies():item(1):units()
local player_army = bm:get_player_army()
local sunit = script_unit:new(player_army, "1")

local sunits_player_all = script_units:new("player_all", sunit)
for i = 2, units_player:count() do
    local sunit = script_unit:new(player_army, tostring(i))
    sunits_player_all:add_sunits(sunit)
end

cutscene_intro_length = 44000
intro_cinematic_file = "script/battle/campaign_battle/battles_flyovers/scenes/wrath_of_poseidon_r01_s01.CindyScene"
bm:cindy_preload(intro_cinematic_file)

bm:register_phase_change_callback("Deployment", function()
    show_advisor_progress_buttons(false);
    -- show the cutscene borders immediately
    --bm:enable_cinematic_ui(true, true, true);

    out("PrebattleCinematic ")

    local scene = cutscene:new_from_cindyscene(
        "intro_cutscene_cindy",
        sunits_player_all,
        function()
            -- end callback
            out("INTRO SCENE ENDED")
        end,
        intro_cinematic_file,
        cutscene_intro_length,
        2,
        6
    )

    local subtitles = scene:subtitles()
    subtitles:set_alignment("bottom_centre")
    subtitles:clear()

    local cam_pos = v(614.71893310547, 110.05830383301, -529.21606445313)
    local cam_targ = v(596.95739746094, 108.49974060059, -520.85162353516)

    scene:set_skip_camera(cam_pos, cam_targ);
    scene:set_skippable(true, skip_cutscene_intro)
	core:progress_on_loading_screen_dismissed(function() scene:start() end)
	
end
);

-- from odysseus_ruse.lua. used to skip the weather screen.
core:add_listener(
    "skip_weather",
    "PanelOpenedBattle",
    function(context) return context.string == "finish_deployment" end,
    function(context)
        local to_press = find_uicomponent(core:get_ui_root(), "waiting_panel" , "background" , "button_battle_start")
        to_press:SimulateLClick()
    end,
    false
)