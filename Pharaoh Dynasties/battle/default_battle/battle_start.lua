load_script_libraries();
bm = battle_manager:new(empire_battle:new());

local file_name, file_path = get_file_name_and_path();

package.path = file_path .. "/?.lua;" .. package.path;

bm:out("");
bm:out("* No battle script defined - default script loaded *");
bm:out("");


-- Always loading battle advice for Custom Battles

bm:out("\tAlways Loading advice");

if core:is_tweaker_set("ALLOW_ADVICE_IN_CUSTOM_BATTLE") then
	bm:out("\tLoading scripted tours");
	core:svr_save_bool("sbool_advice_loaded_from_custom_battle", false)
	bm:load_scripted_tours();
else
	core:svr_save_bool("sbool_advice_loaded_from_custom_battle", true)
end;

require("troy_battle_advice");


-- Loading advice based on tweaker

