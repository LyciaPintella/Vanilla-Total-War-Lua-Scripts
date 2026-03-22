load_script_libraries();
bm = battle_manager:new(empire_battle:new());

local file_name, file_path = get_file_name_and_path();

package.path = file_path .. "/?.lua;" .. package.path;

bm:out("");
bm:out("* battle_xmls_start.lua script loaded *");
bm:out("");


bm:load_scripted_tours();
