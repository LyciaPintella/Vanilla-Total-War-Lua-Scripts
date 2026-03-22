load_script_libraries();
bm = battle_manager:new(empire_battle:new());
uim = battle_ui_manager:new(bm)

tm = get_tm()
alliances = bm:alliances()
alliance_player = alliances:item(1)
alliance_enemy = alliances:item(2)

army_player_01 = alliance_player:armies():item(1)
army_enemy_01 = alliance_enemy:armies():item(1)

sunit_player_general = script_unit:new(army_player_01, "player_01")
sunit_enemy_general = script_unit:new(army_enemy_01, "enemy_01")

sunit_player_figher = script_unit:new(army_player_01, "player_02")
sunit_enemy_figher = script_unit:new(army_enemy_01, "enemy_02")

sunits_player = script_units:new(
	"player",
	sunit_player_figher
)

sunits_enemy = script_units:new(
	"enemy",
	sunit_enemy_figher
)


core:add_listener(
	"TEST_ME_SOME_ANIMS", 
	"ComponentLClickUp", 
	function(context) 
		return context.string == "button_battle_start" 
	end, 
	function() 
		sunit_player_general:take_control()
		sunit_enemy_general:take_control()
		sunit_enemy_figher:take_control()
		sunit_player_figher:take_control()

		sunit_player_figher:set_invincible(true)
		sunit_enemy_figher:set_invincible(true)

		sunit_player_figher:morale_behavior_fearless()
		sunit_enemy_figher:morale_behavior_fearless()
		
		--sunits_player:attack_enemy_scriptunits(sunits_enemy, true)
		--sunits_enemy:attack_enemy_scriptunits(sunits_player, true)

		sunit_player_figher:teleport_to_location(v(-12.1,1303.4,36.2), 0, 80)
		sunit_enemy_figher:teleport_to_location(v(-9.4,1305.2,-0.5), 0, 80)

		bm:callback(
			function()
				sunits_player:attack_enemy_scriptunits(sunits_enemy, true)
				sunits_enemy:attack_enemy_scriptunits(sunits_player, true)
			end, 
			200, 
			"TEST_ME_SOME_ANIMS")
		
	end, 
	false
)
