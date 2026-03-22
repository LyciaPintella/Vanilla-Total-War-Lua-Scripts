out("mycena_battle.lua loaded")
load_script_libraries()
bm = battle_manager:new(empire_battle:new())
cam = bm:camera()
local file_name, file_path = get_file_name_and_path()

package.path = file_path .. "/?.lua;" .. package.path

bm:set_close_queue_advice(false)
bm:out("")
bm:out("********************************************************************")
bm:out("********************************************************************")
bm:out("****** Campaign battle script file loaded - Battle of Mycenae ******")
bm:out("********************************************************************")
bm:out("********************************************************************")
bm:out("")

local player_army = bm:get_player_army()
local player_units = {}
local player_reinforcement_table = {}


for j = 1, player_army:units():count() do
	local sunit = script_unit:new(player_army, player_army:units():item(j):name())
	table.insert(player_units, sunit)

	local player_reinforcements = player_army:get_reinforcement_units()
	if player_reinforcements and player_reinforcements:count() > 0 then 
		for r = 1, player_reinforcements:count() do
			sunit = script_unit:new(player_army, player_reinforcements:item(r):name())
			table.insert(player_reinforcement_table, sunit)
			sunit:deploy_reinforcement(false)
		end
	end
end

local non_human_alliance_armies = bm:get_non_player_alliance():armies()
local enemy_units = {}
local enemy_reinforcement_table = {}

for i = 1, non_human_alliance_armies:count() do 
	local current_army = non_human_alliance_armies:item(i)
	for j = 1, current_army:units():count() do
		local sunit = script_unit:new(current_army, current_army:units():item(j):name())
		table.insert(enemy_units, sunit)
	end
	local enemy_reinforcements = current_army:get_reinforcement_units()
	if enemy_reinforcements and enemy_reinforcements:count() > 0 then 
		for r = 1, enemy_reinforcements:count() do
			local sunit = script_unit:new(current_army, enemy_reinforcements:item(r):name())
			table.insert(enemy_reinforcement_table, sunit)
			sunit:deploy_reinforcement(false)
		end
	end
end

local sunits_player = script_units:new("player_all", player_units)

cam:move_to(v(893.772, 1663.46, 303.85), v(882.995, 1660.45, 287.272), 0, false, 0)
cutscene_intro_length = 40200
intro_cinematic_file = "script/battle/campaign_battle/battles_flyovers/scenes/mycenae_battle.CindyScene"
bm:cindy_preload(intro_cinematic_file)

bm:register_phase_change_callback(
	"Deployed",
	function()
		bm:enable_cinematic_ui(true, true, true)

		for i=1, #player_units do
			player_units[i]:take_control()
		end
		
		for i = 1, #enemy_units do
			enemy_units[i]:take_control()
		end

		show_advisor_progress_buttons(false);
		
		local scene = cutscene:new_from_cindyscene(
			"intro_cutscene_cindy",
			sunits_player,
			function()
				-- end callback
				out("INTRO SCENE ENDED")
				release_control_of_units(false)
			end,
			intro_cinematic_file,
			cutscene_intro_length,
			2,
			6
		)

		local subtitles = scene:subtitles()
		subtitles:set_alignment("bottom_centre")
		subtitles:clear()

		local cam_pos = v(-542.83459472656, 1609.7889404297, -271.53955078125)
    	local cam_targ = v(-524.33599853516, 1606.0775146484, -263.81500244141)
		local skippable_cutscene = not bm:is_multiplayer()
		scene:set_skip_camera(cam_pos, cam_targ);
		scene:set_skippable(skippable_cutscene, function() release_control_of_units(true) end)

		core:progress_on_loading_screen_dismissed(function() scene:start() end)
		
	end
)


function release_control_of_units(cutscene_skipped)
	if cutscene_skipped then
		out("SKIPPING....")
		bm:hide_subtitles();
	end

	for i=1, #player_units do
		player_units[i]:release_control()
	end
	-- Release control of the AI's units
	for i = 1, #enemy_units do
		enemy_units[i]:release_control()
	end

	if #player_reinforcement_table ~= 0 then 
		for i=1, #player_reinforcement_table do
			player_reinforcement_table[i]:deploy_reinforcement(true)
		end
	end

	if #enemy_reinforcement_table ~= 0 then
		for i=1, #enemy_reinforcement_table do
			enemy_reinforcement_table[i]:deploy_reinforcement(true)
		end
	end
end

-- from odysseus_ruse.lua. used to skip the weather screen.
core:add_listener(
    "skip_weather",
    "PanelOpenedBattle",
    function(context) return context.string == "finish_deployment" end,
    function(context)
        local to_press = find_uicomponent(core:get_ui_root(), "waiting_panel" , "background" , "button_battle_start")
		if to_press then
        	to_press:SimulateLClick()
		end
    end,
    false
)
