load_script_libraries();
bm = battle_manager:new(empire_battle:new());

local file_name, file_path = get_file_name_and_path();

package.path = file_path .. "/?.lua;" .. package.path;

bm:set_close_queue_advice(false);
bm:out("");
bm:out("********************************************************************");
bm:out("********************************************************************");
bm:out("*** Campaign battle script file loaded - Exotic Strategist");
bm:out("********************************************************************");
bm:out("********************************************************************");
bm:out("");

local enemy_alliance_index = tonumber(core:svr_load_string("exotic_strategist_make_enemy_tired_alliance_index"))
local enemy_armies = bm:alliances():item(enemy_alliance_index + 1):armies()

for i = 1, enemy_armies:count() do
    local uc = unitcontroller_from_army(enemy_armies:item(i))
    uc:set_fatigue_value(17000)
    uc:release_control()
end