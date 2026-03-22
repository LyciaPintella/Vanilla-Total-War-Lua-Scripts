load_script_libraries()
bm = battle_manager:new(empire_battle:new())
cam = bm:camera()
cam:fade(true, 0)
local file_name, file_path = get_file_name_and_path()

package.path = file_path .. "/?.lua;" .. package.path

bm:set_close_queue_advice(false)
bm:out("")
bm:out("********************************************************************")
bm:out("********************************************************************")
bm:out("****** Campaign battle script file loaded - Now with more RUSE******")
bm:out("********************************************************************")
bm:out("********************************************************************")
bm:out("")

function parse_ruse_unit_cqis(cqis_as_string) 
	local sunit_numbers = {}
	for i in string.gmatch(cqis_as_string, "%S+") do
		table.insert(sunit_numbers,i)
		out(i)
	end
	return sunit_numbers
end

--require("troy_battle_advice");

local player_army = bm:get_player_army()
local ruse_unit_cqis = core:svr_load_string("ruse_unit_cqis")
local ruse_units = {}
local ruse_units_ids = parse_ruse_unit_cqis(ruse_unit_cqis)

for k,v in pairs(ruse_units_ids) do
	if type(v) == "string" then 
		local sunit = script_unit:new(player_army, "sunit_" .. v)
		table.insert(ruse_units, sunit)
	end
end

local non_human_alliance_armies = bm:get_non_player_alliance():armies()
local enemy_units = {}

for i = 1, non_human_alliance_armies:count() do 
	local current_army = non_human_alliance_armies:item(i)
	for j = 1, current_army:units():count() do
		local sunit = script_unit:new(current_army, current_army:units():item(j):name())
		table.insert(enemy_units, sunit)
	end
end


function teleport_ruse_units()
	
	out("TELEPORTING UNITS...")
	local tp_pos = v(-35.9, -48.1)
	local tp_pos_first_location = v(-35.9, -48.1)

	local offset_x = 25
	local offset_z = 35

	local half = math.ceil(#ruse_units / 2)

	for i=1, half do
		ruse_units[i].uc:teleport_to_location(tp_pos, 180, 20)
		local previous_x = tp_pos:get_x()
		local previous_z = tp_pos:get_z()
		tp_pos:set_x(previous_x + offset_x)
		tp_pos:set_z(previous_z)
		--ruse_units[i]:release_control()
	end
	local prevz = tp_pos_first_location:get_z()
	tp_pos_first_location:set_z(prevz + offset_z)
	for i=half + 1, #ruse_units do
		ruse_units[i].uc:teleport_to_location(tp_pos_first_location, 180, 20)
		local previous_x = tp_pos_first_location:get_x()
		local previous_z = tp_pos_first_location:get_z()
		tp_pos_first_location:set_x(previous_x + offset_x)
		tp_pos_first_location:set_z(previous_z)
		--ruse_units[i]:release_control()
	end
	out("TELEPORTED")

end

local sunits_player_ruse = script_units:new("player_ruse", ruse_units)

cutscene_intro_length = 50000
intro_cinematic_file = "script/battle/campaign_battle/battles_flyovers/scenes/oddy_trojan_horse.CindyScene"
bm:cindy_preload(intro_cinematic_file)

bm:register_phase_change_callback(
	"Startup",
	function()
		cam:fade(true, 0);
	end
)

bm:register_phase_change_callback(
	"Deployment",
	function()

		bm:enable_cinematic_ui(true, true, true)
		bm:show_start_battle_button(false);

		bm:watch(
			function()
				local btn_start = find_uicomponent(core:get_ui_root(), "finish_deployment" , "deployment_end_sp" , "button_battle_start")
				return is_uicomponent(btn_start) 
			end,
			100,
			function()
				local btn_start = find_uicomponent(core:get_ui_root(), "finish_deployment" , "deployment_end_sp" , "button_battle_start")
				btn_start:SimulateLClick()
			end
		)
	
	end
)

bm:register_phase_change_callback(
	"Deployed",
	function()
	
		for i=1, #ruse_units do
			ruse_units[i]:take_control()
		end
		
		teleport_ruse_units();
		
		for i = 1, #enemy_units do
			enemy_units[i]:take_control()
		end

		show_advisor_progress_buttons(false);
		cam:fade(false, 1) 
		
		local scene = cutscene:new_from_cindyscene(
			"intro_cutscene_cindy",
			sunits_player_ruse,
			function()
				-- end callback
				out("INTRO SCENE ENDED")
				for i=1, #ruse_units do
					ruse_units[i]:release_control()
				end
				-- Release control of the AI's units
				for i = 1, #enemy_units do
					enemy_units[i]:release_control()
				end
			end,
			intro_cinematic_file,
			cutscene_intro_length,
			0,
			4
		)

		local subtitles = scene:subtitles()
		subtitles:set_alignment("bottom_centre")
		subtitles:clear()

		local cam_pos = v(-40.662551879883, 61.571319580078, -40.913120269775)
		local cam_targ = v(-30.180128097534, 58.0618019104, -47.698040008545)
		scene:set_skip_camera(cam_pos, cam_targ);
		scene:set_skippable(true, skip_cutscene_intro)
		--scene:action(teleport_ruse_units, 1900)

		core:progress_on_loading_screen_dismissed(function() scene:start() end)
		
	end
)

function kill_ruse_units()
	out("Player lost battle. Nut Huzzah. Proceeding to murder ruse units...")
	for i=1, #ruse_units do
		ruse_units[i]:take_control()
	end
	for i=1, #ruse_units do
		local alive = ruse_units[i].unit:number_of_men_alive()
		ruse_units[i].uc:kill()
		ruse_units[i]:release_control()
	end
end


bm:register_phase_change_callback(
	"VictoryCountdown",
	function()
		local winner = bm:winner_alliance_id()
		out("WINNDER ID: " .. winner)
		if winner ~= 0 and winner ~= -1 then
			kill_ruse_units()
		end
	end
)

core:add_listener(
	"surrender_button_clicked_listener",
	"ComponentLClickUp",
	function(context)
		return context.string == "button_quit"
	end,
	function(context)
		core:add_listener(
			"surrender_button_confirm_tick",
			"ComponentLClickUp",
			function(context)
				return context.string == "button_tick"
			end,
			function(context)
				kill_ruse_units()
				core:remove_listener("surrender_button_confirm_tick")
			end,
			true
		)
		core:remove_listener("surrender_button_clicked_listener")
	end,
	true
)

function skip_cutscene_intro()
	out("SKIPPING....")
	bm:hide_subtitles();
	teleport_ruse_units();

	for i=1, #ruse_units do
		ruse_units[i]:release_control()
	end
	-- Release control of the AI's units
	for i = 1, #enemy_units do
		enemy_units[i]:release_control()
	end
end

core:add_listener(
	"get_battle_cam",
	"ComponentLClickUp",
	function(context) return context.string == "button_toggle_infopanel" end,
	function() 
		bm:out("POS : ")
		bm:out(cam:position():get_x())
		bm:out(cam:position():get_y())
		bm:out(cam:position():get_z())
		bm:out("TAR : ")
		bm:out(cam:target():get_x())
		bm:out(cam:target():get_y())
		bm:out(cam:target():get_z())
    end,
	true
)

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
