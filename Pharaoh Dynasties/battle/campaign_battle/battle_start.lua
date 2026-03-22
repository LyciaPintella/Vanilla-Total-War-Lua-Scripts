load_script_libraries();
bm = battle_manager:new(empire_battle:new());

local file_name, file_path = get_file_name_and_path();

package.path = file_path .. "/?.lua;" .. package.path;

bm:set_close_queue_advice(false);
bm:out("");
bm:out("********************************************************************");
bm:out("********************************************************************");
bm:out("*** Campaign battle script file loaded");
bm:out("********************************************************************");
bm:out("********************************************************************");
bm:out("");

terrain_folder, catchment = bm:battle_terrain_folder_and_catchment()

--[[
if string.find(terrain_folder, "mycenae") and catchment == "catchment_01" then
    out("THIS IS MYCENAE!")
    require("mycenae_battle");
elseif string.find(terrain_folder, "troy_major_troy_v2_earthquake") and catchment == "catchment_02" then
    out("THIS IS EARTHQUAKE!")
    require("earthquake_battle")
end
]]
require("troy_battle_advice");


local general_invincible = core:svr_load_bool("tut_make_player_general_invincible")
if general_invincible then
	local sunit_player_general = bm:get_scriptunits_for_local_players_army():get_general_sunit()
	sunit_player_general:max_casualties(0.5, true)
	sunit_player_general:morale_behavior_fearless(true)
end


local campaign_tutorial_battle = core:svr_load_bool("sbool_replace_concede_with_skip_button")
core:add_listener(
	"prevent_concede_in_campaign_tutorial_battle",
	"PanelOpenedBattle",
	function(context) 
		return context.string == "esc_menu_battle" and campaign_tutorial_battle  
	end,
	function() 
		local uic_button_quit = core:get_ui_root():SequentialFind("button_quit")
		uic_button_quit:SetVisible(false)

		local uic_button_skip_battle = core:get_ui_root():SequentialFind("button_skip_battle")
		uic_button_skip_battle:SetVisible(true)
	end,
	true
);

bm:load_scripted_tours();