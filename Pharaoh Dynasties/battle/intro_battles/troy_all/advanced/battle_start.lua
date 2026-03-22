load_script_libraries()
bm = battle_manager:new(empire_battle:new())
uim = battle_ui_manager:new(bm)

local file_name, file_path = get_file_name_and_path()

-- load the intro battle script library
package.path = "script/battle/intro_battles/?.lua"
require("troy_intro_battle")

package.path = file_path .. "/?.lua;" .. package.path

require("advanced_battle_declarations")
require("advanced_battle_cutscenes")
require("advanced_battle_main")