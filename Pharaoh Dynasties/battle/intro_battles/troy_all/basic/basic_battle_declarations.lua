cam = bm:camera()
alliances = bm:alliances()
bm:out("Battle declarations loaded")

alliances = bm:alliances()
alliance_player = alliances:item(1)
alliance_enemy = alliances:item(2)

army_player_01 = alliance_player:armies():item(1)
army_enemy_01 = alliance_enemy:armies():item(1)

uc_enemy_01_all = unitcontroller_from_army(army_enemy_01)

sunit_player_01 = script_unit:new(army_player_01, "player_01")
sunit_player_02 = script_unit:new(army_player_01, "player_02")
sunit_player_03 = script_unit:new(army_player_01, "player_03")

--------------------------------------------------------------
--- 					1X BOWMEN 						---
--------------------------------------------------------------
sunit_player_04 = script_unit:new(army_player_01, "player_04")

--------------------------------------------------------------
--- 				REINFORCEMENTS - CHARIOTS			   ---
--------------------------------------------------------------
sunit_player_chariot_01 = script_unit:new(army_player_01, "troy_ach_heavy_reinforced_chariots_1")

sunit_enemy_01 = script_unit:new(army_enemy_01, "enemy_01")
sunit_enemy_02 = script_unit:new(army_enemy_01, "enemy_02")
sunit_enemy_03 = script_unit:new(army_enemy_01, "enemy_03")
sunit_enemy_04 = script_unit:new(army_enemy_01, "enemy_04")

sunits_player_all = script_units:new(
	"player_all",
	sunit_player_01,
	sunit_player_02,
	sunit_player_03,
	sunit_player_04,
	sunit_player_chariot_01
)

sunits_player_start = script_units:new(
	"player_start",
	sunit_player_01,
	sunit_player_02,
	sunit_player_03,
    sunit_player_04
)

sunits_player_start_no_bowmen = script_units:new(
	"player_start_no_bowmen",
	sunit_player_01,
	sunit_player_02,
	sunit_player_03
)

sunits_player_general = script_units:new(
	"player_general",
	sunit_player_01
)

sunit_player_generic_unit = script_units:new(
	"player_generic_unit",
	sunit_player_02
)
sunits_player_start_no_general = script_units:new(
	"player_start_no_general",
	sunit_player_02,
	sunit_player_03,
    sunit_player_04
)

sunits_enemy_start = script_units:new(
	"enemy_start",
	sunit_enemy_01,
	sunit_enemy_02,
	sunit_enemy_03,
	sunit_enemy_04
)

sunits_player_chariots = script_units:new(
	"player_chariots",
	sunit_player_chariot_01
)

-- starting enemy meander start positions
sunit_enemy_01.pos_meander_start = v(183.1, 32.4)
sunit_enemy_01.pos_meander_end = v(210.5, 20.4)
sunit_enemy_01.orient_meander = r_to_d(1.4)
sunit_enemy_01.width_meander = 1.4

sunit_enemy_02.pos_meander_start = v(202.4, 49.8)
sunit_enemy_02.orient_meander =  r_to_d(-1.77)
sunit_enemy_02.width_meander = 23.5

sunit_enemy_03.pos_meander_start = v(260.1, 28.1)
sunit_enemy_03.orient_meander = r_to_d(-1.77)
sunit_enemy_03.width_meander = 23.5

sunit_enemy_04.pos_meander_start = v(170, 63.4)
sunit_enemy_04.orient_meander = r_to_d(-1.77)
sunit_enemy_04.width_meander = 23.5

-- starting enemy formup positions
sunit_enemy_01.pos_form_up = v(50.6, -122.3)
sunit_enemy_01.orient_form_up = r_to_d(3.14)
sunit_enemy_01.width_form_up = 1.4

sunit_enemy_02.pos_form_up = v(60.2, -145.7)
sunit_enemy_02.orient_form_up =  r_to_d(3.14)
sunit_enemy_02.width_form_up = 23.5

sunit_enemy_03.pos_form_up = v(35.5, -149.5)
sunit_enemy_03.orient_form_up = r_to_d(3.14)
sunit_enemy_03.width_form_up = 23.5

sunit_enemy_04.pos_form_up = v(15.1, -152.4)
sunit_enemy_04.orient_form_up = r_to_d(3.14)
sunit_enemy_04.width_form_up = 23.5

function start_enemy_meandering()
	local player_armies = sunit_player_01:alliance():armies()

	for i = 1, sunits_enemy_start:count() do
		local current_sunit = sunits_enemy_start:item(i)
		current_sunit.uc:teleport_to_location(current_sunit.pos_meander_start, current_sunit.orient_meander, current_sunit.width_meander)
		
		if current_sunit.pos_meander_end then
			local pm = patrol_manager:new(current_sunit.name .. "_meander",	current_sunit, player_armies, 0)
			pm:set_waypoint_threshold(5)
			pm:loop(true)
			pm:add_waypoint(current_sunit.pos_meander_end)
			pm:add_waypoint(current_sunit.pos_meander_start)
			pm:start()
		end
	end
end

function form_up_enemy(should_run)
	should_run = should_run or false;
	
	for i = 1, sunits_enemy_start:count() do
		local current_sunit = sunits_enemy_start:item(i);
		current_sunit.uc:goto_location_angle_width(current_sunit.pos_form_up, current_sunit.orient_form_up, current_sunit.width_form_up, should_run);
	end;
end;

function halt_visible_enemy_units()
	for i = 1, sunits_enemy_start:count() do
		local current_sunit = sunits_enemy_start:item(i);
		if current_sunit.unit:is_visible_to_alliance(alliance_player) then
			current_sunit.uc:halt();
		end;
	end;
end;

sunit_player_chariot_01:deploy_reinforcement(false)
