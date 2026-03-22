cam = bm:camera()
alliances = bm:alliances()
bm:out("Battle declarations loaded")

alliances = bm:alliances()
alliance_player = alliances:item(1)
alliance_enemy = alliances:item(2)

army_player_01 = alliance_player:armies():item(1)
army_enemy_01 = alliance_enemy:armies():item(1)

uc_enemy_01_all = unitcontroller_from_army(army_enemy_01)

-- PLAYER ARMY
sunit_player_general = script_unit:new(army_player_01, "agamemnon_player")

sunit_player_spear_01 = script_unit:new(army_player_01, "troy_achaean_spearmen_1")
sunit_player_spear_02 = script_unit:new(army_player_01, "troy_achaean_spearmen_2")
sunit_player_spear_03 = script_unit:new(army_player_01, "troy_achaean_spearmen_3")
sunit_player_spear_04 = script_unit:new(army_player_01, "troy_achaean_spearmen_4")
sunit_player_spear_05 = script_unit:new(army_player_01, "troy_achaean_spearmen_5")
sunit_player_spear_06 = script_unit:new(army_player_01, "troy_achaean_spearmen_6")

sunit_player_sword_01 = script_unit:new(army_player_01, "troy_light_swordsmen_1")
sunit_player_sword_02 = script_unit:new(army_player_01, "troy_light_swordsmen_2")
sunit_player_sword_03 = script_unit:new(army_player_01, "troy_light_swordsmen_3")
sunit_player_sword_04 = script_unit:new(army_player_01, "troy_light_swordsmen_4")
sunit_player_sword_05 = script_unit:new(army_player_01, "troy_light_swordsmen_5")
sunit_player_sword_06 = script_unit:new(army_player_01, "troy_light_swordsmen_6")

sunit_player_javelin_01 = script_unit:new(army_player_01, "troy_myc_light_javelin_throwers_1")

sunit_player_bows_01 = script_unit:new(army_player_01, "troy_heavy_mycenaen_bowmen_1")
sunit_player_bows_02 = script_unit:new(army_player_01, "troy_heavy_mycenaen_bowmen_2")

-- ENEMY ARMY
sunit_enemy_general = script_unit:new(army_enemy_01, "agamemnon_enemy")

sunit_enemy_shield_01 = script_unit:new(army_enemy_01, "troy_club_warriors_large_shields_1")
sunit_enemy_shield_02 = script_unit:new(army_enemy_01, "troy_club_warriors_large_shields_2")
sunit_enemy_shield_03 = script_unit:new(army_enemy_01, "troy_club_warriors_large_shields_3")
sunit_enemy_shield_04 = script_unit:new(army_enemy_01, "troy_club_warriors_large_shields_4")

sunit_enemy_spear_01 = script_unit:new(army_enemy_01, "troy_shielded_spearmen_1")
sunit_enemy_spear_02 = script_unit:new(army_enemy_01, "troy_shielded_spearmen_2")
sunit_enemy_spear_03 = script_unit:new(army_enemy_01, "troy_shielded_spearmen_3")

sunit_enemy_charger_01 = script_unit:new(army_enemy_01, "troy_dendra_chargers_1")
sunit_enemy_charger_02 = script_unit:new(army_enemy_01, "troy_dendra_chargers_2")

sunit_enemy_javelin_01 = script_unit:new(army_enemy_01, "troy_myc_light_javelin_throwers_1")

sunit_enemy_bows_01 = script_unit:new(army_enemy_01, "troy_heavy_mycenaen_bowmen_1")
sunit_enemy_bows_02 = script_unit:new(army_enemy_01, "troy_heavy_mycenaen_bowmen_2")
sunit_enemy_bows_03 = script_unit:new(army_enemy_01, "troy_heavy_mycenaen_bowmen_3")


sunits_player_all = script_units:new(
	"player_all",
	sunit_player_general,
	sunit_player_spear_01,
	sunit_player_spear_02,
	sunit_player_spear_03,
	sunit_player_spear_04,
	sunit_player_spear_05,
	sunit_player_spear_06,

	sunit_player_sword_01,
	sunit_player_sword_02,
	sunit_player_sword_03,
	sunit_player_sword_04,
	sunit_player_sword_05,
	sunit_player_sword_06,

	sunit_player_javelin_01,

	sunit_player_bows_01,
	sunit_player_bows_02
)

sunits_player_all_no_general = script_units:new(
	"player_all_no_general",
	sunit_player_spear_01,
	sunit_player_spear_02,
	sunit_player_spear_03,
	sunit_player_spear_04,
	sunit_player_spear_05,
	sunit_player_spear_06,

	sunit_player_sword_01,
	sunit_player_sword_02,
	sunit_player_sword_03,
	sunit_player_sword_04,
	sunit_player_sword_05,
	sunit_player_sword_06,

	sunit_player_javelin_01,

	sunit_player_bows_01,
	sunit_player_bows_02
)

sunits_player_pikes = script_units:new(
	"player_pikes",
	sunit_player_spear_01,
	sunit_player_spear_02,
	sunit_player_spear_03,
	sunit_player_spear_04,
	sunit_player_spear_05,
	sunit_player_spear_06
)

sunits_player_swords = script_units:new(
	"player_swords",
	sunit_player_sword_01,
	sunit_player_sword_02,
	sunit_player_sword_03,
	sunit_player_sword_04,
	sunit_player_sword_05,
	sunit_player_sword_06
)

sunits_player_javelins = script_units:new(
	"player_javelins",
	sunit_player_javelin_01
)

suints_player_rest = script_units:new(
	"player_all",
	sunit_player_general,
	sunit_player_spear_01,
	sunit_player_spear_02,
	sunit_player_spear_03,
	sunit_player_spear_04,
	sunit_player_spear_05,
	sunit_player_spear_06,

	sunit_player_sword_01,
	sunit_player_sword_02,
	sunit_player_sword_03,
	sunit_player_sword_04,
	sunit_player_sword_05,
	sunit_player_sword_06,

	sunit_player_javelin_01
)

suints_player_non_javelins = script_units:new(
	"player_non_javelins",
	sunit_player_general,
	sunit_player_spear_01,
	sunit_player_spear_02,
	sunit_player_spear_03,
	sunit_player_spear_04,
	sunit_player_spear_05,
	sunit_player_spear_06,

	sunit_player_sword_01,
	sunit_player_sword_02,
	sunit_player_sword_03,
	sunit_player_sword_04,
	sunit_player_sword_05,
	sunit_player_sword_06,

	sunit_player_bows_01,
	sunit_player_bows_02
)

sunits_player_non_forest = script_units:new(
	"player_non_forest",
	sunit_player_general,
	sunit_player_spear_01,
	sunit_player_spear_02,
	sunit_player_spear_03,
	sunit_player_spear_04,
	sunit_player_spear_05,
	sunit_player_spear_06,

	sunit_player_sword_01,
	sunit_player_sword_02,
	sunit_player_sword_03,
	sunit_player_sword_04,
	sunit_player_sword_05,
	sunit_player_sword_06,

	sunit_player_javelin_01
)

sunits_player_bowmen = script_units:new(
	"player_bowmen",
	sunit_player_bows_01,
	sunit_player_bows_02
)

sunits_player_general = script_units:new(
	"player_general",
	sunit_player_general
)

sunits_enemy_start = script_units:new(
	"enemy_all",
	sunit_enemy_shield_01,
	sunit_enemy_shield_02,
	sunit_enemy_shield_03,
	sunit_enemy_shield_04,

	sunit_enemy_spear_01,
	sunit_enemy_spear_02,
	sunit_enemy_spear_03,

	sunit_enemy_charger_01,
	sunit_enemy_charger_02,

	sunit_enemy_javelin_01,

	sunit_enemy_bows_01,
	sunit_enemy_bows_02,
	sunit_enemy_bows_03
)

sunits_enemy_missile = script_units:new(
	"enemy_missile",
	sunit_enemy_javelin_01,
	sunit_enemy_bows_01,
	sunit_enemy_bows_02,
	sunit_enemy_bows_03
)

suints_player_deployed = script_units:new(
	"player_deployed",
	sunit_player_bows_01,
	sunit_player_bows_02
)

-- area_forest = convex_area:new({
-- 	v(-42, -10),
-- 	v(7, -10),
-- 	v(7, -52),
-- 	v(-42, -52)
-- })

camera_marker_hill_initial_cam_pos = v(-34.78, 1389.62, -222.63)
camera_marker_hill_initial_cam_target = v( -44.74, 1319.27, -15.73)
camera_marker_hill_position = v(-35.30, 1367.44, 152.23)
camera_marker_hill_move_to_pos = v(-39.71, 1352.56, 144.02)
camera_marker_hill_move_to_target = v(12.56, 1311.51, 234.40)
camera_marker_hill_return_to_pos = v(-9.05, 1380.71, -271.22)
camera_marker_hill_return_to_target = v(-3.53, 1310.36, -64.15)

select_javelins_cam_pos = v(-48.13, 1378.60, -296.04)
select_javelins_cam_target = v(64, 362.58, 2194.75)

first_javelin_deployment_objective_cam_pos = v(-198 - 20, 1386, -184)
first_javelin_deployment_objective_cam_target = v(-215.7, 1344, -79.31)
first_javelin_deployment_pin_pos = v(-218, 1326.67, -34.72)

second_javelin_deployment_objective_cam_pos = v(72.18, 1386.3, -182.88)
second_javelin_deployment_objective_cam_target = v(90.37, 1282.94, 138.70)
second_javelin_deployment_pin_pos = v(112, 1340, -34.72)

select_javelins_cam_pos = v(-23.251352, 1369.61376, -250.7529)
select_javelins_cam_target = v(-22.765, 1240.479, -68.061)

army_selection_cam_pos = v(-23.251352, 1369.61376, -250.7529)
army_selection_cam_target = v(-22.765, 1240.479, -68.061)

advance_army_pos = v(-1.99 - 22, 1349.15, -34.96)
enemy_ai_planner_defend_pos = v(-57.10, 1348.09, -23.67)

javelins_flanking_cam_pos = v(1.34, 1425.12, -48.00)
javelins_flanking_cam_target = v(-23.11, 1326.67, 146.30)
javelins_flank_left_ping_pos = v(-140, 1366, 100)
javelins_flank_right_ping_pos = v(110, 1359, 100)

javelins_combat_cam_pos = v(1.34, 1425.12, -48.00)
javelins_combat_cam_target = v(-23.11, 1326.67, 146.30)

javelin_area_1 = convex_area:new({
	v(63 - 290 - 20, -45 + 30),
	v(120 - 290 - 20, -45 + 30),
	v(120 - 290 - 20, -82 + 30),
	v(63 - 290 - 20, -82 + 30)
})

javelin_area_2 = convex_area:new({
	v(63 + 20, -45 + 30),
	v(120 + 20, -45 + 30),
	v(120 + 20, -82 + 30),
	v(63 + 20, -82 + 30)
})

flank_area_left = convex_area:new({
	v(-166 - 20, 130),
	v(-114 - 20, 130),
	v(-106 - 20, 80),
	v(-159 - 20, 80)
})

flank_area_right = convex_area:new({
	v(96, 130),
	v(142, 130),
	v(125, 80),
	v(73, 80)
})
