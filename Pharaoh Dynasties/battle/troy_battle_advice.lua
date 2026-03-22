

-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	ADVICE SCRIPTS
--	Battle advice trigger declarations go here
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

require("script.battle.scripted_tours.battle_tours_loading_helpers");


-- If we are to immediately show any battle tutorial then exit without loading any advice
if should_immediately_start_any_battle_tutorial() then
	return;
end;



-- Settlement battle types
-- These are to be used to determine the different battle types
SIEGE_BATTLE_MAJOR = "settlement_standard";
SETTLEMENT_BATTLE_MINOR = "settlement_unfortified";

-- distance in metres at which we transition from "early battle" approach advice
local MID_APPROACH_THRESHOLD = 250;

-- establish a listener for the battle forces approaching
bm:watch(
	function()
		return bm:get_distance_between_forces() < MID_APPROACH_THRESHOLD;
	end,
	0,
	function()
		bm:out("* Player and enemy forces have closed to within " .. tostring(MID_APPROACH_THRESHOLD) .. "m - advice script is triggering ScriptEventBattleForcesApproach *");
		core:trigger_event("ScriptEventBattleForcesApproach");
	end
);


-- is this a standard battle (incl. minor settlement) - not a major settlement battle, and not an ambush battle
local is_standard_battle = not bm:is_major_settlement_battle() and not bm:is_ambush_battle();


-- cache the number of player and enemy armies/units
local num_player_armies = bm:get_player_alliance():armies():count();
local num_player_primary_units = bm:get_player_army():units():count();

local num_enemy_armies = bm:get_non_player_alliance():armies():count();
local num_enemy_primary_units = bm:get_first_non_player_army():units():count();

-- assemble a test which returns whether an army is represented on the battlefield
local function no_units_on_battlefield(units)
	return 0 == num_units_passing_test(
		units, 
		function(unit)
			return unit:is_valid_target() or unit:is_hidden();
		end
	);
end;




bm:out("********************************************************************");
bm:out("*** loading advice scripts");
bm:out("********************************************************************");
bm:out("");
bm:out("Player alliance number: " .. tostring(bm:get_player_alliance_num()));
bm:out("Battle type: " .. bm:battle_type());
bm:out("Primary attacker faction is [" .. tostring(core:svr_load_string("primary_attacker_faction_name")) .. "], subculture is [" .. tostring(core:svr_load_string("primary_attacker_subculture")) .. "], is player: " .. tostring(core:svr_load_bool("primary_attacker_is_player")));
bm:out("Primary defender faction is [" .. tostring(core:svr_load_string("primary_defender_faction_name")) .. "], subculture is [" .. tostring(core:svr_load_string("primary_defender_subculture")) .. "], is player: " .. tostring(core:svr_load_bool("primary_defender_is_player")));
bm:out("");

-- create an advice manager
am = advice_manager:new(true);

-- load scripted tour advice monitors
if core:svr_load_bool("sbool_advice_loaded_from_custom_battle") then
	core:svr_save_bool("sbool_advice_loaded_from_custom_battle", false)
	bm:out("Custom Battle - No Scripted Tours loaded");
else
	require("battle_advice_scripted_tours");
end




--
--	DEPLOYMENT_standard
--
do
	local am = advice_monitor:new(
		"DEPLOYMENT_standard",
		90,
		-- Your warriors stand ready to serve. They await only your orders.
		"phar_battle_advisor_deployment_01",
		{
			"troy_battle_info_deployment_01",
			"phar_battle_info_deployment_02",
			"phar_battle_info_deployment_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);

	am:add_trigger_condition(
		function()
			return is_standard_battle and num_player_primary_units > 1;
		end,
		"ScriptEventDeploymentPhaseBegins"
	);

	am:add_halt_condition(true, "ScriptEventConflictPhaseBegins");
end;








--
--	DEPLOYMENT_standard_attacker
--
do
	local am = advice_monitor:new(
		"DEPLOYMENT_standard_attacker",
		70,
		-- Are you ready to mount your attack? To triumph you must rout the enemy in a timely manner. Plan your strategy with care.
		"phar_battle_advisor_field_battle_attacker_01",
		{
			"troy_battle_info_attacking_01",
			"troy_battle_info_attacking_02",
			"troy_battle_info_attacking_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_HIGH);

	am:add_trigger_condition(
		function()
			return is_standard_battle and bm:player_is_attacker();
		end, 
		"ScriptEventDeploymentPhaseBegins"
	);

	am:add_halt_condition(true, "ScriptEventConflictPhaseBegins");
end;








--
--	DEPLOYMENT_standard_defender
--
do
	local am = advice_monitor:new(
		"DEPLOYMENT_standard_defender",
		70,
		-- The enemy have sought battle, and therefore it is their burden to attack. Seize any defensive position you might find, repel their forces, and look for opportunities to counter-attack!
		"phar_battle_advisor_field_battle_defender_01",
		{
			"troy_battle_info_defending_01",
			"troy_battle_info_defending_02",
			"troy_battle_info_attacking_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_HIGH);

	am:add_trigger_condition(
		function()
			return is_standard_battle and not bm:player_is_attacker();
		end, 
		"ScriptEventDeploymentPhaseBegins"
	);

	am:add_halt_condition(true, "ScriptEventConflictPhaseBegins");
end;






--
--	DEPLOYMENT_standard_terrain
--
do
	local am = advice_monitor:new(
		"DEPLOYMENT_standard_terrain",
		50,
		-- Display the wisdom of Artemis and make the land your ally. Forests and hills provide cover. Roads and grasslands permit the swift passage of armies. And to attack from higher ground gives the advantage.
		"phar_battle_advisor_terrain_01",
		{
			"troy_battle_info_terrain_01",
			"phar_battle_info_terrain_02",
			"phar_battle_info_terrain_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_HIGH);

	am:add_trigger_condition(
		function()
			return is_standard_battle;
		end, 
		"ScriptEventDeploymentPhaseBegins"
	);

	am:add_halt_condition(true, "ScriptEventConflictPhaseBegins");
end;









--
--	DEPLOYMENT_fatigue
--
do
	local am = advice_monitor:new(
		"DEPLOYMENT_fatigue",
		80,
		-- The road was long, and the march hard. Your warriors are not at their best. Use what strength they still have wisely.
		"phar_battle_advisor_fatigue_01",
		{
			"troy_battle_info_fatigue_01",
			"troy_battle_info_fatigue_02",
			"troy_battle_info_fatigue_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);

	am:add_trigger_condition(
		function()
			if not is_standard_battle then
				return false;
			end;

			local player_units = bm:get_player_army():units();		
			local num_fatigued_units, total_units = num_units_passing_test(
				player_units,
				function(unit)
					local fatigue_state = unit:fatigue_state();
					return fatigue_state == "threshold_tired" or fatigue_state == "threshold_very_tired" or fatigue_state == "threshold_exhausted";
				end
			);
			
			if total_units == 0 then
				return false;
			end;
			
			return num_fatigued_units / total_units > 0.5;
		end,
		"ScriptEventDeploymentPhaseBegins" 
	);

	am:add_halt_condition(true, "ScriptEventConflictPhaseBegins");
end;








--
--	DEPLOYMENT_siege_attacker
--
do
	local am = advice_monitor:new(
		"DEPLOYMENT_siege_attacker",
		60,
		-- The walls of this city may look high and strong, but no defences are impregnable. Seek out their weaknesses; break their gates or scale their walls. Attack at several points and you will split the defender's forces... but also your own.
		"phar_battle_advisor_siege_battle_attacker_01",
		{
			"troy_battle_info_siege_attacking_01",
			"troy_battle_info_siege_attacking_02",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_HIGH);

	am:add_trigger_condition(
		function()
			return bm:is_major_settlement_battle() and bm:player_is_attacker() and num_player_primary_units > 1;
		end, 
		"ScriptEventDeploymentPhaseBegins"
	);

	am:add_halt_condition(true, "ScriptEventConflictPhaseBegins");
end;








--
--	DEPLOYMENT_siege_defender
--
do
	local am = advice_monitor:new(
		"DEPLOYMENT_siege_defender",
		60,
		-- The city's defence is in your hands! Position your forces to counter the advance of the enemy. Defend the walls as best you can, then lure the enemy into the maze of city streets and despatch them there. Gods grant you strength!
		"phar_battle_advisor_siege_battle_defender_01",
		{
			"troy_battle_info_siege_defending_01",
			"troy_battle_info_siege_defending_02",
			"troy_battle_info_siege_defending_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_HIGH);

	am:add_trigger_condition(
		function()
			return bm:is_major_settlement_battle() and not bm:player_is_attacker() and num_player_primary_units > 1;
		end, 
		"ScriptEventDeploymentPhaseBegins"
	);

	am:add_halt_condition(true, "ScriptEventConflictPhaseBegins");
end;








--
--	DEPLOYMENT_ambush_attacker
--
do
	local am = advice_monitor:new(
		"DEPLOYMENT_ambush_attacker",
		85,
		-- The enemy are unaware of your presence! Position your troops to retain your advantage once the attack begins!
		"phar_battle_advisor_ambush_attacker_02",
		{
			"troy_battle_info_ambushes_01",
			"troy_battle_info_ambushes_02",
			"troy_battle_info_ambushes_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);

	am:add_trigger_condition(
		function()
			return bm:is_ambush_battle() and bm:player_is_attacker();
		end, 
		"ScriptEventDeploymentPhaseBegins"
	);

	am:add_halt_condition(true, "ScriptEventConflictPhaseBegins");
end;








--
--	DEPLOYMENT_ambush_defender
--
do
	local am = advice_monitor:new(
		"DEPLOYMENT_ambush_defender",
		85,
		-- An ambush! Draw your weapons! Stay strong and united, and make for the higher ground!
		"phar_battle_advisor_ambush_defender_01",
		{
			"troy_battle_info_ambushes_01",
			"troy_battle_info_ambushes_02",
			"troy_battle_info_ambushes_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);
	am:set_delay_before_triggering(5000);

	am:add_start_condition(
		function()
			return bm:is_ambush_battle() and not bm:player_is_attacker();
		end, 
		"ScriptEventConflictPhaseBegins"
	);

	local player_units = bm:get_player_army():units();
	local player_alliance = bm:get_player_alliance();
	local enemy_alliance = bm:get_non_player_alliance();

	am:add_trigger_condition(
		function()
			if is_visible(enemy_alliance, player_alliance) then
				return true;
			end;

			for i = 1, player_units:count() do
				local current_unit = player_units:item(i);
				if current_unit:is_under_missile_attack() then
					return true;
				end;
			end;
		end
	);
end;











--
--	EARLY_BATTLE_defend_gates
--
do
	local am = advice_monitor:new(
		"EARLY_BATTLE_defend_gates",
		75,
		-- Look to your city gates! Missile troops may hold back the foe even after the gate falls. If nothing else they will delay the attackers, and buy time for the city's defenders to muster the strength to fight back.
		"phar_battle_advisor_siege_defender_02_gates",
		{
			"troy_battle_info_gates_01",
			"troy_battle_info_gates_02",
			"troy_battle_info_gates_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);

	am:add_trigger_condition(
		function()
			return bm:is_major_settlement_battle() and not bm:player_is_attacker() and num_player_primary_units > 1;
		end, 
		"ScriptEventConflictPhaseBegins"
	);
	
	am:add_halt_condition(true, "ScriptEventBattleForcesApproach");
end;












--
--	EARLY_BATTLE_ambush_attacker
--
do
	local am = advice_monitor:new(
		"EARLY_BATTLE_ambush_attacker",
		70,
		-- The enemy march on, heedless of the danger. Reveal yourself at the right moment and bring their doom!
		"phar_battle_advisor_ambush_attacker_03",
		{
			"troy_battle_info_ambushes_01",
			"troy_battle_info_ambushes_02",
			"troy_battle_info_ambushes_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);
	am:add_halt_on_advice_monitor_triggering("EARLY_BATTLE_ambush_visibility");

	am:add_start_condition(
		function()
			return bm:is_ambush_battle() and bm:player_is_attacker();
		end, 
		"ScriptEventConflictPhaseBegins"
	);

	local player_alliance = bm:get_player_alliance();
	local enemy_alliance = bm:get_non_player_alliance();

	am:add_trigger_condition(
		function()
			if not is_visible(player_alliance, enemy_alliance) then
				return true;
			end;

			am.should_halt = true;		-- a bit of a hack to prevent the monitor checking this expensive condition twice
			return false;
		end
	);

	am:add_halt_condition(
		function()
			return am.should_halt;
		end
	);
end;











--
--	EARLY_BATTLE_tactical_map
--
do
	local am = advice_monitor:new(
		"EARLY_BATTLE_tactical_map",
		30,
		-- A map gives a battle commander a god-like view. Use the maps at your disposal to plan your tactics with care.
		"phar_battle_advisor_maps_01",
		{
			"troy_battle_info_tactical_map_01",
			"troy_battle_info_tactical_map_02",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_HIGH);

	am:add_start_condition(
		function()
			return is_standard_battle;
		end,
		"ScriptEventConflictPhaseBegins"
	);

	am:add_trigger_condition(
		true
	);

	am:add_halt_condition(true, "ScriptEventBattleForcesApproach");
end;










--
--	EARLY_BATTLE_defender_walls
--
do
	local am = advice_monitor:new(
		"EARLY_BATTLE_defender_walls",
		70,
		-- Your walls give you an advantage. From here your missile troops may rain down death upon the besieging forces, like the arrows of Apollo. But beware: should the foe scale the wall, warriors not trained for close combat make poor defenders.
		"phar_battle_advisor_siege_defender_01_walls",
		{
			"troy_battle_info_walls_01",
			"troy_battle_info_walls_02",
			"troy_battle_info_walls_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_HIGH);

	am:add_start_condition(
		function()
			return bm:is_major_settlement_battle() and not bm:player_is_attacker() and num_player_primary_units > 1;
		end,
		"ScriptEventConflictPhaseBegins"
	);

	am:add_trigger_condition(
		true
	);
	
	am:add_halt_condition(true, "ScriptEventBattleForcesApproach");
end;










--
--	EARLY_BATTLE_woodland_player
--
do
	local am = advice_monitor:new(
		"EARLY_BATTLE_woodland_player",
		40,
		-- Make the woodlands work for you. Your warriors may pass through them like ghosts, leaving the enemy unaware of the true threat. Use the cover the forest provides!
		"phar_battle_advisor_forests_01",
		{
			"troy_battle_info_forests_01",
			"troy_battle_info_forests_02",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_HIGH);
	am:add_halt_on_advice_monitor_triggering("EARLY_BATTLE_woodland_enemy");

	am:add_start_condition(
		function()
			return is_standard_battle;
		end,
		"ScriptEventDeploymentPhaseBegins"
	);

	local player_units = bm:get_player_army():units();
	local threshold = num_player_primary_units > 4 and 1 or 0;

	am:add_trigger_condition(
		function()
			local count_hidden = 0;
			for i = 1, player_units:count() do
				if player_units:item(i):is_hidden() then
					count_hidden = count_hidden + 1;
				end;
			end;

			if count_hidden > threshold then
				return true;
			end;
		end
	);

	am:add_halt_condition(true, "ScriptEventBattleForcesApproach");
end;











--
--	EARLY_BATTLE_woodland_enemy
--
do
	local am = advice_monitor:new(
		"EARLY_BATTLE_woodland_enemy",
		40,
		-- Be wary, for the enemy may have concealed themselves amongst the trees. Keep your wits about you.
		"phar_battle_advisor_forests_02",
		{
			"troy_battle_info_forests_01",
			"troy_battle_info_forests_02",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);
	am:add_halt_on_advice_monitor_triggering("EARLY_BATTLE_woodland_player");

	am:add_start_condition(
		function()
			return is_standard_battle;
		end,
		"ScriptEventDeploymentPhaseBegins"
	);

	local enemy_units = bm:get_first_non_player_army():units();
	local threshold = num_enemy_primary_units > 5 and 2 or 1;

	am:add_trigger_condition(
		function()
			local count_hidden = 0;
			for i = 1, enemy_units:count() do
				if enemy_units:item(i):is_hidden() then
					count_hidden = count_hidden + 1;
				end;
			end;

			if count_hidden > threshold then
				return true;
			end;
		end
	);

	am:add_halt_condition(true, "ScriptEventBattleForcesApproach");
end;












--
--	EARLY_BATTLE_positioning
--
do
	local am = advice_monitor:new(
		"EARLY_BATTLE_positioning",
		70,
		-- Take care in deploying your troops. Consider which formation will be most advantageous in the situation and position your warriors accordingly.
		"phar_battle_advisor_positioning_01",
		{
			"troy_battle_info_unit_positioning_01",
			"troy_battle_info_unit_positioning_02",
			"troy_battle_info_unit_positioning_03",
			"troy_battle_info_unit_positioning_04",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_HIGH);

	am:add_start_condition(
		function()
			return is_standard_battle and num_player_primary_units > 1;
		end,
		"ScriptEventConflictPhaseBegins"
	);

	am:add_trigger_condition(
		true
	);
	
	am:add_halt_condition(
		true,
		"ScriptEventBattleForcesApproach"
	);
end;











--
--	EARLY_BATTLE_battering_rams
--
do
	local am = advice_monitor:new(
		"EARLY_BATTLE_battering_rams",
		50,
		-- A battering ram is a monstrous war machine of wood and bronze. These contraptions require strength and skill to deploy, but can smash a city gate to matchwood.
		"phar_battle_advisor_battering_ram_01",
		{
			"troy_battle_info_battering_rams_01",
			"troy_battle_info_battering_rams_02",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);

	am:add_start_condition(
		function()
			return bm:is_major_settlement_battle() and bm:assault_equipment_exists("phar_gen_batteringram");
		end,
		"ScriptEventConflictPhaseBegins"
	);

	am:add_trigger_condition(
		true
	);

	am:add_halt_condition(true, "ScriptEventBattleForcesApproach");
end;











--
--	EARLY_BATTLE_attack_walls
--
do
	local am = advice_monitor:new(
		"EARLY_BATTLE_attack_walls",
		48,
		-- Use ladders to scale the city walls. The enemy may fire upon your warriors but should you take control of the wall, your own troops can rain down missiles in their turn.
		"phar_battle_advisor_siege_attacker_01_walls",
		{
			"troy_battle_info_walls_01",
			"troy_battle_info_walls_02",
			"troy_battle_info_walls_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_HIGH);

	am:add_start_condition(
		function()
			return bm:is_major_settlement_battle() and bm:player_is_attacker() and num_player_primary_units > 1;
		end,
		"ScriptEventConflictPhaseBegins"
	);

	am:add_trigger_condition(
		true
	);

	am:add_halt_condition(true, "ScriptEventBattleForcesApproach");
end;











--
--	EARLY_BATTLE_attack_gates
--
do
	local am = advice_monitor:new(
		"EARLY_BATTLE_attack_gates",
		40,
		-- Whoever controls the gates controls access to the city. Your warriors must defeat the defenders inside the gates, and hold off any further foes who seek to retake them.
		"phar_battle_advisor_siege_attacker_02_gates",
		{
			"troy_battle_info_gates_01",
			"troy_battle_info_gates_02",
			"troy_battle_info_gates_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_HIGH);

	am:add_start_condition(
		function()
			return bm:is_major_settlement_battle() and bm:player_is_attacker();
		end,
		"ScriptEventConflictPhaseBegins"
	);

	am:add_trigger_condition(
		true
	);

	am:add_halt_condition(true, "ScriptEventBattleForcesApproach");
end;











--
--	EARLY_BATTLE_enemy_visibility
--
do
	local am = advice_monitor:new(
		"EARLY_BATTLE_enemy_visibility",
		40,
		-- In terrain such as this, every natural feature may conceal an enemy. Beware of unseen foes!
		"phar_battle_advisor_visibility_01",
		{
			"troy_battle_info_visibility_01",
			"troy_battle_info_visibility_02",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);
	am:add_halt_on_advice_monitor_triggering("EARLY_BATTLE_player_visibility");

	am:add_start_condition(
		function()
			return is_standard_battle;
		end,
		"ScriptEventConflictPhaseBegins"
	);

	local player_alliance = bm:get_player_alliance();
	local enemy_army = bm:get_first_non_player_army();

	am:add_trigger_condition(
		function()			
			local num_invisible_enemy_units, num_enemy_units = num_units_passing_test(
				enemy_army,
				function(unit)
					return not unit:is_visible_to_alliance(player_alliance);
				end
			);
			
			if num_enemy_units == 0 then
				return false;
			end;
			
			-- try and trigger if more than three units and more than 33% of the enemy army is invisible
			return num_invisible_enemy_units > 3 and num_invisible_enemy_units / num_enemy_units > 0.33;
		end
	);

	am:add_halt_condition(true, "ScriptEventBattleForcesApproach");
end;












--
--	EARLY_BATTLE_player_visibility
--
do
	local am = advice_monitor:new(
		"EARLY_BATTLE_player_visibility",
		25,
		-- Use the natural features of this landscape to your advantage. Forests and hills make good hiding places for the stealthy warrior.
		"phar_battle_advisor_visibility_02",
		{
			"troy_battle_info_visibility_01",
			"troy_battle_info_visibility_02",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_HIGH);
	am:add_halt_on_advice_monitor_triggering("EARLY_BATTLE_enemy_visibility");

	am:add_start_condition(
		function()
			return is_standard_battle;
		end,
		"ScriptEventConflictPhaseBegins"
	);

	local player_army = bm:get_player_army();
	local enemy_alliance = bm:get_non_player_alliance();

	am:add_trigger_condition(
		function()			
			local num_invisible_player_units, num_player_units = num_units_passing_test(
				player_army,
				function(unit)
					return not unit:is_visible_to_alliance(enemy_alliance);
				end
			);
			
			if num_player_units == 0 then
				return false;
			end;
			
			-- try and trigger if more than two units and more than 25% of the player's army is invisible
			return num_invisible_player_units > 2 and num_invisible_player_units / num_player_units > 0.25;
		end
	);

	am:add_halt_condition(true, "ScriptEventBattleForcesApproach");
end;












--
--	EARLY_BATTLE_ambush_visibility
--
do
	local am = advice_monitor:new(
		"EARLY_BATTLE_ambush_visibility",
		75,
		-- The enemy have become aware of your presence - your trap is sprung! Let no-one escape alive!
		"phar_battle_advisor_ambush_attacker_01",
		{
			"troy_battle_info_ambushes_01",
			"troy_battle_info_ambushes_02",
			"troy_battle_info_ambushes_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_HIGH);
	am:set_can_interrupt_other_advice(true);

	am:add_start_condition(
		function()
			return bm:is_ambush_battle() and bm:player_is_attacker();
		end,
		"ScriptEventConflictPhaseBegins"
	);

	local player_alliance = bm:get_player_alliance();
	local enemy_alliance = bm:get_non_player_alliance();

	am:add_trigger_condition(
		function()
			return is_visible(player_alliance, enemy_alliance);
		end
	);
end;










--
--	EARLY_BATTLE_flanking
--
do
	local am = advice_monitor:new(
		"EARLY_BATTLE_flanking",
		20,
		-- The obvious course is not always the most effective. To meet the enemy head on speaks well of your courage, but a flank attack does more damage, and erodes the enemy's morale.
		"phar_battle_advisor_flanking_maneuvers_01",
		{
			"troy_battle_info_flanking_01",
			"troy_battle_info_flanking_02",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_HIGH);
	am:add_halt_on_advice_monitor_triggering("EARLY_BATTLE_hammer_and_anvil");

	am:add_start_condition(
		function()
			return is_standard_battle and num_player_primary_units > 7;
		end,
		"ScriptEventConflictPhaseBegins"
	);

	am:add_trigger_condition(
		true
	);

	am:add_halt_condition(true, "ScriptEventBattleForcesApproach");
end;











--
--	EARLY_BATTLE_hammer_and_anvil
--
do
	local am = advice_monitor:new(
		"EARLY_BATTLE_hammer_and_anvil",
		25,
		-- Do as Hephaestus does, and employ a hammer and anvil! Have one group of your warriors engage the enemy head on, then order a second to attack from the flank or rear.
		"phar_battle_advisor_hammer_and_anvil_tactics_01",
		{
			"troy_battle_info_hammer_anvil_01",
			"troy_battle_info_hammer_anvil_02",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_HIGH);
	am:add_halt_on_advice_monitor_triggering("EARLY_BATTLE_flanking");

	am:add_start_condition(
		function()
			return is_standard_battle and num_player_primary_units > 7;
		end,
		"ScriptEventConflictPhaseBegins"
	);

	am:add_trigger_condition(
		true
	);

	am:add_halt_condition(true, "ScriptEventBattleForcesApproach");
end;











--
--	EARLY_BATTLE_high_ground_player
--
do
	local am = advice_monitor:new(
		"EARLY_BATTLE_high_ground_player",
		35,
		-- You have the high ground. Make full use of your advantage.
		"phar_battle_advisor_high_ground_01",
		{
			"troy_battle_info_high_ground_01",
			"troy_battle_info_high_ground_02",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_HIGH);
	am:add_halt_on_advice_monitor_triggering("EARLY_BATTLE_high_ground_enemy");

	am:add_start_condition(
		function()
			return is_standard_battle;
		end,
		"ScriptEventConflictPhaseBegins"
	);

	am:add_trigger_condition(
		function()
			-- return true if the player <> enemy height difference is more than 10% of the distance between them
			return (bm:get_player_army_altitude() - bm:get_enemy_army_altitude()) * 10 > bm:get_distance_between_forces();
		end
	);

	am:add_halt_condition(true, "ScriptEventBattleForcesApproach");
end;











--
--	EARLY_BATTLE_high_ground_enemy
--
do
	local am = advice_monitor:new(
		"EARLY_BATTLE_high_ground_enemy",
		38,
		-- The enemy hold the high ground. To rush in when they have such an advantage is to invite disaster.
		"phar_battle_advisor_high_ground_02",
		{
			"troy_battle_info_high_ground_01",
			"troy_battle_info_high_ground_02",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);
	am:add_halt_on_advice_monitor_triggering("EARLY_BATTLE_high_ground_player");

	am:add_start_condition(
		function()
			return is_standard_battle;
		end,
		"ScriptEventConflictPhaseBegins"
	);

	am:add_trigger_condition(
		function()
			-- return true if the enemy <> player height difference is more than 10% of the distance between them
			return (bm:get_enemy_army_altitude() - bm:get_player_army_altitude()) * 10 > bm:get_distance_between_forces();
		end
	);

	am:add_halt_condition(true, "ScriptEventBattleForcesApproach");
end;











--
--	EARLY_BATTLE_formations
--
do
	local am = advice_monitor:new(
		"EARLY_BATTLE_formations",
		30,
		-- As each warrior has their unit, each unit has their place in battle. Group units into formations, to better take command of the field.
		"phar_battle_advisor_formations_01",
		{
			"troy_battle_info_formations_01",
			"troy_battle_info_formations_02",
			"troy_battle_info_formations_03",
			"troy_battle_info_formations_04",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_HIGH);

	am:add_start_condition(
		function()
			return is_standard_battle and num_player_primary_units > 10;
		end,
		"ScriptEventConflictPhaseBegins"
	);

	am:add_trigger_condition(
		true
	);

	am:add_halt_condition(true, "ScriptEventBattleForcesApproach");
end;











--
--	EARLY_BATTLE_player_reinforcements
--
do
	local am = advice_monitor:new(
		"EARLY_BATTLE_player_reinforcements",
		75,
		-- Reinforcements arrive to support your army! Together you can vanquish the foe!
		"phar_battle_advisor_reinforcements_01",
		{
			"troy_battle_info_reinforcements_01",
			"troy_battle_info_reinforcements_02",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);


	am:add_trigger_condition(
		function()
			return is_standard_battle and (bm:get_player_alliance():armies():count() > 1 or (bm:get_player_army():get_reinforcement_units() and bm:get_player_army():get_reinforcement_units():count() > 0));
		end,
		"ScriptEventConflictPhaseBegins" 
	);

	am:add_trigger_condition(
		function(context)
			return context.string == "adc_own_reinforcements"
		end,
		"BattleAideDeCampEvent"
	);

	am:add_halt_condition(true, "ScriptEventBattleForcesApproach");
end;












--
--	EARLY_BATTLE_enemy_reinforcements
--
do
	local am = advice_monitor:new(
		"EARLY_BATTLE_enemy_reinforcements",
		80,
		-- Beware! Enemy reinforcements have been sighted! You must fight on two fronts!
		"phar_battle_advisor_reinforcements_02",
		{
			"troy_battle_info_reinforcements_01",
			"troy_battle_info_reinforcements_02",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);

	am:add_start_condition(
		function()
			return is_standard_battle and (bm:get_non_player_alliance():armies():count() > 1 or (bm:get_first_non_player_army():get_reinforcement_units() and bm:get_first_non_player_army():get_reinforcement_units():count() > 0));
		end,
		"ScriptEventConflictPhaseBegins" 
	);

	am:add_trigger_condition(
		function(context)
			return context.string == "adc_enemy_reinforcements";
		end,
		"BattleAideDeCampEvent"
	);

	am:add_halt_condition(true, "ScriptEventBattleForcesApproach");
end;










--
--	EARLY_BATTLE_player_mounted
--
do
	local am = advice_monitor:new(
		"EARLY_BATTLE_player_mounted",
		15,
		-- You bring horses to the field of battle, and that alone makes the enemy fear you. Use this edge: harry the enemy army and seek out their weak points.
		"phar_battle_advisor_mounted_02",
		{
			"phar_battle_info_horse_01",
			"phar_battle_info_horse_02",
			"phar_battle_info_horse_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_HIGH);
	am:add_halt_on_advice_monitor_triggering("EARLY_BATTLE_enemy_mounted");

	am:add_start_condition(
		function(context)
			if not is_standard_battle then
				return false;
			end;

			local num_player_cavalry, num_player_units = num_units_passing_test(
				bm:get_player_army(),
				function(unit)
					return unit:is_cavalry() or unit:is_chariot();
				end
			);
			
			if num_player_units == 0 then
				return false;
			end;
			
			-- trigger if more than 10% of the player's army is cavalry
			return num_player_cavalry / num_player_units > 0.1;
		end,
		"ScriptEventConflictPhaseBegins"
	);

	am:add_trigger_condition(
		true
	);

	am:add_halt_condition(true, "ScriptEventBattleArmiesEngaging");
end;











--
--	EARLY_BATTLE_enemy_mounted
--
do
	local am = advice_monitor:new(
		"EARLY_BATTLE_enemy_mounted",
		65,
		-- The enemy has horses! Keep a watch on your weaker units, lest they fall prey to rapid strikes!
		"phar_battle_advisor_mounted_01",
		{
			"phar_battle_info_horse_01",
			"phar_battle_info_horse_02",
			"phar_battle_info_horse_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_HIGH);
	am:add_halt_on_advice_monitor_triggering("EARLY_BATTLE_player_mounted");

	local enemy_cavalry = get_all_matching_units(
		bm:get_non_player_alliance(), 
		function(unit)
			return unit:is_cavalry() or unit:is_chariot();
		end
	);
	local player_alliance = bm:get_player_alliance();

	am:add_start_condition(
		function()
			return is_standard_battle and #enemy_cavalry > 0;
		end,
		"ScriptEventConflictPhaseBegins"
	);

	local threshold = #enemy_cavalry > 1 and 1 or 0;

	am:add_trigger_condition(
		function()
			local num_visible_enemy_cavalry = num_units_passing_test(
				enemy_cavalry,
				function(unit)
					return unit:is_visible_to_alliance(player_alliance);
				end
			);
			
			return num_visible_enemy_cavalry > threshold;
		end
	);

	am:add_halt_condition(true, "ScriptEventBattleArmiesEngaging");
end;












--
--	EARLY_BATTLE_hero_abilities
--
do
	local am = advice_monitor:new(
		"EARLY_BATTLE_hero_abilities",
		60,
		-- The heroes who fight for you all have their own unique skills and advantages. Pay close regard to what they can do and let them stoke their rage, ready to unleash their abilities on the enemy.
		"phar_battle_advisor_hero_abilities_01",
		{
			"phar_battle_info_hero_abilities_01",
			"phar_battle_info_hero_abilities_02",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);

	local player_units = bm:get_player_army():units();
	local player_general = false;
	for i = 1, player_units:count() do
		if player_units:item(i):is_commanding_unit() then
			player_general = player_units:item(i);
			break;
		end;
	end;

	am:add_start_condition(
		function()
			return is_standard_battle and player_general and player_general:num_special_abilities() > 0;
		end,
		"ScriptEventConflictPhaseBegins"
	);

	am:add_trigger_condition(
		true
	);

	am:add_halt_condition(true, "ScriptEventBattleArmiesEngaging");
end;












--
--	EARLY_BATTLE_victory_points
--
do
	local am = advice_monitor:new(
		"EARLY_BATTLE_victory_points",
		50,
		-- Certain locations are key to victory. To control such places, your warriors must remain nearby for a fixed time, seeing off all attackers. Succeed, and the battle is yours.
		"phar_battle_advisor_siege_attacker_03_victory_point",
		{
			"troy_battle_info_victory_points_01",
			"troy_battle_info_victory_points_02",
			"troy_battle_info_victory_points_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);

	am:add_start_condition(
		function()
			return bm:is_major_settlement_battle() and bm:player_is_attacker();
		end,
		"ScriptEventBattleForcesApproach"
	);

	am:add_trigger_condition(
		true
	);

	am:add_halt_condition(true, "ScriptEventPlayerApproachingVictoryPoint");
end;











--
--	EARLY_BATTLE_capture_points
--
do
	local am = advice_monitor:new(
		"EARLY_BATTLE_capture_points",
		55,
		-- Seek out important enemy sites. To conquer them brings glory, and such places may then be turned to your own use.
		"phar_battle_advisor_capture_points_02",
		{
			"troy_battle_info_capture_points_01",
			"troy_battle_info_capture_points_02",
			"troy_battle_info_capture_points_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);

	am:add_start_condition(
		function()
			return bm:is_major_settlement_battle() and bm:player_is_attacker();
		end,
		"ScriptEventBattleForcesApproach"
	);

	am:add_trigger_condition(
		true
	);

	am:add_halt_condition(true, "ScriptEventPlayerEngagedInSiegeBattle");
end;











--[[
--
--	COMBAT_rage
--
do
	local am = advice_monitor:new(
		"COMBAT_rage",
		40,
		-- As the battle progresses, the hero's rage grows. The anger of Ares made manifest, rage grants powerful combat abilities; the more experienced the hero, the more abilities they may call upon.
		"phar_battle_advisor_rage_resource_01",
		{
			"troy_battle_info_rage_01",
			"troy_battle_info_rage_02",
			"troy_battle_info_rage_03",
			"troy_battle_info_rage_04",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);

	local player_general = false;

	am:add_start_condition(
		function()
			if not is_standard_battle then
				return false;
			end;

			local player_units = bm:get_player_army():units();
			for i = 1, player_units:count() do
				if player_units:item(i):is_commanding_unit() then
					player_general = player_units:item(i);
					return true;
				end;
			end;
		end,
		"ScriptEventBattleForcesApproach"
	);
	
	am:add_trigger_condition(
		function()
			return player_general:rage_unary() > 0.05 and not is_routing_or_dead(player_general);
		end
	);
end;












--
--	COMBAT_aristeia
--
do
	local am = advice_monitor:new(
		"COMBAT_aristeia",
		40,
		-- The Aristeia is a hero's finest moment. This godlike transformation comes but once per battle, turning the chosen warrior into a near unstoppable fighter of consummate skill. But Zeus only grants boons like this to the truly worthy.
		"troy_battle_advisor_aristeia_01",
		{
			"troy_battle_info_aristeia_01",
			"troy_battle_info_aristeia_02",
			"troy_battle_info_aristeia_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);

	local player_general = false;

	am:add_start_condition(
		function()
			if not is_standard_battle then
				return false;
			end;

			local player_units = bm:get_player_army():units();
			for i = 1, player_units:count() do
				if player_units:item(i):is_commanding_unit() then
					player_general = player_units:item(i);
					return true;
				end;
			end;
		end,
		"ScriptEventBattleForcesApproach"
	);
	
	am:add_trigger_condition(
		function()
			return player_general:aristeia_unary() > 0.9 and not is_routing_or_dead(player_general);
		end
	);
end;
--]]











--
--	COMBAT_fatigue
--
do
	local am = advice_monitor:new(
		"COMBAT_fatigue",
		50,
		-- No mortal can fight without tiring. Your warriors grow weary from their exertions. You must let them rest, even as the battle rages on around them.
		"phar_battle_advisor_fatigue_02",
		{
			"troy_battle_info_fatigue_01",
			"troy_battle_info_fatigue_02",
			"troy_battle_info_fatigue_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);
	am:add_halt_on_advice_monitor_triggering("DEPLOYMENT_fatigue");

	local player_general = false;

	am:add_start_condition(
		function()
			return is_standard_battle;
		end,
		"ScriptEventConflictPhaseBegins"
	);
	

	local player_units = bm:get_player_army():units();

	am:add_trigger_condition(
		function()					
			local num_fatigued_units, total_units = num_units_passing_test(
				player_units,
				function(unit)
					local fatigue_state = unit:fatigue_state();
					return fatigue_state == "threshold_tired" or fatigue_state == "threshold_very_tired" or fatigue_state == "threshold_exhausted";
				end
			);
			
			if total_units == 0 then
				return false;
			end;
			
			return num_fatigued_units / total_units > 0.25;
		end
	);
end;












--
--	COMBAT_receiving_fire
--
do
	local am = advice_monitor:new(
		"COMBAT_receiving_fire",
		45,
		-- Death comes from above, like the arrows of Apollo! Have your warriors take cover from the enemy missiles, or else seek out and destroy the cause of this threat.
		"phar_battle_advisor_missile_fire_01",
		{
			"troy_battle_info_missile_troops_01",
			"troy_battle_info_missile_troops_02",
			"troy_battle_info_missile_troops_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);
	am:set_delay_before_triggering(5000);

	am:add_start_condition(
		function()
			return is_standard_battle;
		end,
		"ScriptEventConflictPhaseBegins"
	);

	am:add_trigger_condition(
		function()					
			-- trigger if the player has two or more units under fire
			return bm:get_num_units_under_fire() > 1;
		end
	);

	am:add_halt_condition(
		function() 
			return bm:get_proportion_engaged() > 0.25;
		end
	);
end;












--
--	COMBAT_player_flanked
--
do
	local am = advice_monitor:new(
		"COMBAT_player_flanked",
		85,
		-- Your foe attacks your flank! Drive them off!
		"phar_battle_advisor_flanking_01",
		{
			"troy_battle_info_flanking_01",
			"troy_battle_info_flanking_02",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);

	am:add_start_condition(
		function()
			return is_standard_battle;
		end,
		"ScriptEventConflictPhaseBegins"
	);

	local player_units = bm:get_player_army():units();

	am:add_trigger_condition(
		function()			
			local num_player_units_flanked, num_player_units = num_units_passing_test(
				player_units,
				function(unit)
					return (unit:is_left_flank_threatened() and not unit:left_flank_threat():is_in_melee()) or 
						(unit:is_right_flank_threatened() and not unit:right_flank_threat():is_in_melee()) or 
						(unit:is_rear_flank_threatened() and not unit:rear_threat():is_in_melee());
				end
			);
			
			-- try and trigger if more than one unit is being flanked
			return num_player_units_flanked > 1;
		end
	);
end;













--
--	COMBAT_enemy_unit_routs
--
do
	local am = advice_monitor:new(
		"COMBAT_enemy_unit_routs",
		50,
		-- See the enemy break like reeds before the storm! As they flee, cut the curs down!
		"phar_battle_advisor_routing_01",
		{
			"troy_battle_info_morale_01",
			"troy_battle_info_morale_02",
			"troy_battle_info_morale_03",
			"troy_battle_info_morale_04",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);
	am:add_halt_on_advice_monitor_triggering("HERO_enemy_routs");
	am:add_halt_on_advice_monitor_triggering("COMBAT_player_unit_routs");
	am:add_halt_on_advice_monitor_triggering("COMBAT_player_unit_rallies");
	am:set_can_interrupt_other_advice(true);

	am:add_start_condition(
		true,
		"ScriptEventConflictPhaseBegins"
	);

	am:add_trigger_condition(
		true,
		"ScriptEventEnemyUnitRouts"
	);
end;












--
--	COMBAT_player_unit_routs
--
do
	local am = advice_monitor:new(
		"COMBAT_player_unit_routs",
		60,
		-- For shame, your warriors' courage has failed them! They run from battle like frightened children. Round them up, and send them back into the field!
		"phar_battle_advisor_routing_02",
		{
			"troy_battle_info_morale_01",
			"troy_battle_info_morale_02",
			"troy_battle_info_morale_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);
	am:add_halt_on_advice_monitor_triggering("HERO_player_routs");
	am:add_halt_on_advice_monitor_triggering("COMBAT_enemy_unit_routs");
	am:add_halt_on_advice_monitor_triggering("COMBAT_player_unit_rallies");
	am:set_can_interrupt_other_advice(true);

	am:add_start_condition(
		true,
		"ScriptEventConflictPhaseBegins"
	);

	am:add_trigger_condition(
		true,
		"ScriptEventPlayerUnitRouts"
	);
end;












--
--	COMBAT_player_unit_rallies
--
do
	local am = advice_monitor:new(
		"COMBAT_player_unit_rallies",
		45,
		-- Your warriors have not let you down. Already their courage returns, and soon they will re-join the fight!
		"phar_battle_advisor_rallying_01",
		{
			"troy_battle_info_morale_01",
			"troy_battle_info_morale_02",
			"troy_battle_info_morale_04",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_HIGH);
	am:add_halt_on_advice_monitor_triggering("COMBAT_enemy_unit_routs");
	am:add_halt_on_advice_monitor_triggering("COMBAT_player_unit_routs");
	am:set_can_interrupt_other_advice(true);

	am:add_start_condition(
		true,
		"ScriptEventPlayerUnitRouts"
	);

	am:add_trigger_condition(
		true,
		"ScriptEventPlayerUnitRallies"
	);
end;












--
--	COMBAT_enemy_capturing_gates
--
do
	local am = advice_monitor:new(
		"COMBAT_enemy_capturing_gates",
		50,
		-- The foe are at the walls! They are about to take one of your towers.
		"phar_battle_advisor_capture_points_01",
		{
			"troy_battle_info_capture_points_01",
			"troy_battle_info_capture_points_02",
			"troy_battle_info_capture_points_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_HIGH);
	am:set_delay_before_triggering(5000);
	am:set_can_interrupt_other_advice(true);

	am:add_start_condition(
		function()
			return bm:is_major_settlement_battle() and not bm:player_is_attacker();
		end,
		"ScriptEventConflictPhaseBegins"
	);

	am:add_trigger_condition(
		true,
		"BattleCapturePointCaptureCommenced"
	);
end;












--
--	COMBAT_victory_point_approach
--
do
	local am = advice_monitor:new(
		"COMBAT_victory_point_approach",
		45,
		-- The heart of the city is within reach! Press forward, capture it, and the city will fall to you!
		"phar_battle_advisor_victory_points_03",
		{
			"troy_battle_info_victory_points_01",
			"troy_battle_info_victory_points_02",
			"troy_battle_info_victory_points_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);

	bool_trigger_advice = false;

	am:add_start_condition(
		function()
			if bm:is_major_settlement_battle() and bm:player_is_attacker() then
				-- set up a listener for this event being received from the battle manager, and set a flag so that we trigger this advice when we next can
				core:add_listener(
					"COMBAT_victory_point_approach",
					"ScriptEventPlayerApproachingVictoryPoint",
					true,
					function()
						bool_trigger_advice = true;
					end,
					false
				);

				return true;
			end;
		end,
		"ScriptEventConflictPhaseBegins" 
	);

	am:add_trigger_condition(
		function() return bool_trigger_advice end
	);

	am:add_halt_condition(
		true,
		"BattleFortPlazaCaptureCommenced"
	);
end;












--
--	COMBAT_player_captures_victory_point
--
do
	local am = advice_monitor:new(
		"COMBAT_player_captures_victory_point",
		30,
		-- You have taken the heart of the city. Defend it well, and soon this place will be yours.
		"phar_battle_advisor_victory_points_04",
		{
			"troy_battle_info_victory_points_01",
			"troy_battle_info_victory_points_02",
			"troy_battle_info_victory_points_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_HIGH);
	am:set_can_interrupt_other_advice(true);

	am:add_start_condition(
		function()
			return bm:is_major_settlement_battle() and bm:player_is_attacker();
		end,
		"ScriptEventConflictPhaseBegins" 
	);

	am:add_trigger_condition(
		true,
		"BattleFortPlazaCaptureCompleted"
	);
end;












--
--	COMBAT_enemy_capturing_victory_point
--
do
	local am = advice_monitor:new(
		"COMBAT_enemy_capturing_victory_point",
		60,
		-- The city is falling! Act now to see off the enemy. Soon it will be too late!
		"phar_battle_advisor_victory_points_02",
		{
			"troy_battle_info_victory_points_01",
			"troy_battle_info_victory_points_02",
			"troy_battle_info_victory_points_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);
	am:set_can_interrupt_other_advice(true);

	am:add_start_condition(
		function()
			return bm:is_major_settlement_battle() and not bm:player_is_attacker();
		end,
		"ScriptEventConflictPhaseBegins" 
	);

	am:add_trigger_condition(
		true,
		"BattleFortPlazaCaptureCommenced"
	);
end;












--
--	COMBAT_enemy_capture_victory_point
--
do
	local am = advice_monitor:new(
		"COMBAT_enemy_capture_victory_point",
		60,
		-- The foe controls the heart of the city! Retake it at once, or the entire city will be lost!
		"phar_battle_advisor_victory_points_01",
		{
			"troy_battle_info_victory_points_01",
			"troy_battle_info_victory_points_02",
			"troy_battle_info_victory_points_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);
	am:set_can_interrupt_other_advice(true);

	am:add_start_condition(
		function()
			return bm:is_major_settlement_battle() and not bm:player_is_attacker();
		end,
		"ScriptEventConflictPhaseBegins" 
	);

	am:add_trigger_condition(
		true,
		"BattleFortPlazaCaptureCompleted"
	);
end;














--
--	HERO_enemy_dies
--
do
	local am = advice_monitor:new(
		"HERO_enemy_dies",
		70,
		-- Your brave warriors have cut down the enemy hero! Follow up on this bold stroke, and destroy their now leaderless army!
		"phar_battle_advisor_enemy_general_01",
		{
			"phar_battle_info_heroes_01",
			"phar_battle_info_heroes_02",
			"phar_battle_info_heroes_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);
	am:set_can_interrupt_other_advice(true);

	am:add_start_condition(
		true,
		"ScriptEventConflictPhaseBegins"
	);

	am:add_trigger_condition(
		true,
		"ScriptEventEnemyGeneralDies"
	);
end;












--
--	HERO_enemy_wounded
--
do
	local am = advice_monitor:new(
		"HERO_enemy_wounded",
		70,
		-- The enemy hero is wounded and cannot fight on. Their troops are leaderless! Take this chance to seize the advantage.
		"phar_battle_advisor_enemy_general_02",
		{
			"phar_battle_info_heroes_01",
			"phar_battle_info_heroes_02",
			"phar_battle_info_heroes_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);
	am:set_can_interrupt_other_advice(true);

	am:add_start_condition(
		true,
		"ScriptEventConflictPhaseBegins"
	);

	am:add_trigger_condition(
		true,
		"ScriptEventEnemyGeneralWounded"
	);
end;












--
--	HERO_enemy_routs
--
do
	local am = advice_monitor:new(
		"HERO_enemy_routs",
		60,
		-- The enemy chose their leader poorly. See them run from battle, with the laughter of the gods ringing in their ears! Now is the time to press home your attack!
		"phar_battle_advisor_enemy_general_03",
		{
			"phar_battle_info_heroes_01",
			"phar_battle_info_heroes_02",
			"phar_battle_info_heroes_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);
	am:add_halt_on_advice_monitor_triggering("HERO_enemy_dies");
	am:add_halt_on_advice_monitor_triggering("HERO_enemy_wounded");
	am:set_can_interrupt_other_advice(true);

	am:add_start_condition(
		true,
		"ScriptEventConflictPhaseBegins"
	);

	am:add_trigger_condition(
		true,
		"ScriptEventMainEnemyGeneralRouts"
	);
end;












--
--	HERO_player_dies
--
do
	local am = advice_monitor:new(
		"HERO_player_dies",
		60,
		-- Your hero has fallen in the fighting! How many of the army they leave behind will follow them to the underworld before this day is done?
		"phar_battle_advisor_general_01",
		{
			"phar_battle_info_heroes_01",
			"phar_battle_info_heroes_02",
			"phar_battle_info_heroes_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);
	am:set_can_interrupt_other_advice(true);

	am:add_start_condition(
		true,
		"ScriptEventConflictPhaseBegins"
	);

	am:add_trigger_condition(
		true,
		"ScriptEventPlayerGeneralDies"
	);
end;












--
--	HERO_player_wounded
--
do
	local am = advice_monitor:new(
		"HERO_player_wounded",
		80,
		-- Alas, your hero has been struck down and has retired from the field, gravely wounded. Your leaderless troops will soon lose heart!
		"phar_battle_advisor_general_02",
		{
			"phar_battle_info_heroes_01",
			"phar_battle_info_heroes_02",
			"phar_battle_info_heroes_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);
	am:set_can_interrupt_other_advice(true);

	am:add_start_condition(
		true,
		"ScriptEventConflictPhaseBegins"
	);

	am:add_trigger_condition(
		true,
		"ScriptEventPlayerGeneralWounded"
	);
end;












--
--	HERO_player_routs
--
do
	local am = advice_monitor:new(
		"HERO_player_routs",
		70,
		-- Your faithless hero flees like a craven dog! How dare they leave your warriors leaderless?
		"phar_battle_advisor_general_03",
		{
			"phar_battle_info_heroes_01",
			"phar_battle_info_heroes_02",
			"phar_battle_info_heroes_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);
	am:add_halt_on_advice_monitor_triggering("HERO_player_dies");
	am:add_halt_on_advice_monitor_triggering("HERO_player_wounded");
	am:set_can_interrupt_other_advice(true);

	am:add_start_condition(
		true,
		"ScriptEventConflictPhaseBegins"
	);

	am:add_trigger_condition(
		true,
		"ScriptEventPlayerGeneralRouts"
	);
end;




--
--	MYTHIC_monster_battle_cerberus_monster_unit
--
do
	local am = advice_monitor:new(
		"MYTHIC_monster_battle_cerberus_monster_unit",
		70,
		-- Cerberus, son of Typhon, is the mighty hound of Hades, guardian of the gates to the Underworld. In battle, its strength and ferocity is legend, and its howl alone is enough to harrow the most hardened of enemies. Though a swarm of spear-bearers and the like and a barrage of javelins may be enough to bring it down, the Shades of the dead are sure to answer its call for aid, and a burst of fire from the river Phlegethon is sure to ward off most foes.
		"troy_mth_mythic_monster_battle_cerberus_monster_unit"
	);
	local player_army = bm:get_player_army()
	local player_units_list = player_army:units()

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);

	am:add_trigger_condition(
		function()
			for i=1, player_units_list:count() do
				if player_units_list:item(i):type() == "troy_mth_gen_myth_cerberus" then
					return true
				end
			end
			return false
		end,
		"ScriptEventConflictPhaseBegins"
	);
end;




--
--	MYTHIC_monster_battle_cerberus_roster
--
do
	local am = advice_monitor:new(
		"MYTHIC_monster_battle_cerberus_roster",
		70,
		-- Cerberus, son of Typhon, is the mighty hound of Hades, guardian of the gates to the Underworld. In battle, its strength and ferocity is legend, and its howl alone is enough to harrow the most hardened of enemies. Though a swarm of spear-bearers and the like and a barrage of javelins may be enough to bring it down, the Shades of the dead are sure to answer its call for aid, and a burst of fire from the river Phlegethon is sure to ward off most foes.
		"troy_mth_mythic_monster_battle_cerberus_roster"
	);
	local player_army = bm:get_player_army()
	local player_units_list = player_army:units()

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);

	am:add_trigger_condition(
		function()
			for i=1, player_units_list:count() do
				local curr_unit = player_units_list:item(i):type()
				if 	curr_unit == "troy_mth_gen_myth_bowmen_elysium" or 
					curr_unit == "troy_mth_gen_myth_shade_giants" or 
					curr_unit == "troy_mth_gen_myth_spears_elysium" or 
					curr_unit == "troy_mth_gen_myth_wretched_shades" 	then
					return true
				end
			end
			return false
		end,
		"ScriptEventConflictPhaseBegins"
	);
end;




--
--	MYTHIC_monster_battle_griffin_monster_unit
--
do
	local am = advice_monitor:new(
		"MYTHIC_monster_battle_griffin_monster_unit",
		70,
		-- The Griffin Patriarch is the terror of the skies, flying high above the battlefield and dealing tremendous damage from above. Strong and mobile, the Griffin is most dangerous in the air, yet also at its most vulnerable. While on ground, feathers hard-as-bronze protect the beast from sword and arrow alike, the arrows and javelin of its enemies pose a much greater threat once it takes to the skies.
		"troy_mth_mythic_monster_battle_griffin_monster_unit"
	);
	local player_army = bm:get_player_army()
	local player_units_list = player_army:units()

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);

	am:add_trigger_condition(
		function()
			for i=1, player_units_list:count() do
				if player_units_list:item(i):type() == "troy_mth_gen_myth_griffin" then
					return true
				end
			end
			return false
		end,
		"ScriptEventConflictPhaseBegins"
	);
end;



--
--	MYTHIC_monster_battle_griffin_roster
--
do
	local am = advice_monitor:new(
		"MYTHIC_monster_battle_griffin_roster",
		70,
		-- Cerberus, son of Typhon, is the mighty hound of Hades, guardian of the gates to the Underworld. In battle, its strength and ferocity is legend, and its howl alone is enough to harrow the most hardened of enemies. Though a swarm of spear-bearers and the like and a barrage of javelins may be enough to bring it down, the Shades of the dead are sure to answer its call for aid, and a burst of fire from the river Phlegethon is sure to ward off most foes.
		"troy_mth_mythic_monster_battle_griffin_roster"
	);
	local player_army = bm:get_player_army()
	local player_units_list = player_army:units()

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);

	am:add_trigger_condition(
		function()
			for i=1, player_units_list:count() do
				local curr_unit_key = player_units_list:item(i):type()
				if 	curr_unit_key == "troy_mth_gen_myth_lesser_griffin" or 
					curr_unit_key == "troy_mth_gen_myth_arimaspoi_hunters" or 
					curr_unit_key == "troy_mth_gen_myth_arimaspoi_skirmishers" or 
					curr_unit_key == "troy_mth_gen_myth_arimaspoi_spearmen" 	then
					return true
				end
			end
			return false
		end,
		"ScriptEventConflictPhaseBegins"
	);
end;



--
--	MYTHIC_monster_battle_hydra_monster_unit
--
do
	local am = advice_monitor:new(
		"MYTHIC_monster_battle_hydra_monster_unit",
		70,
		-- "The Lernaean Hydra has risen once more, wreaking havoc in the realms of men and devouring its victims whole. In battle, each of its nine heads spits poison at unsuspecting enemies over a huge range. With little physical defence, the beast relies on regeneration to fight through the pain, splashing poisonous blood on those attacking up close. Yet quickly engaging the creature in melee is the surest way to bring it down. Do not enter a shooting contest, for you will undoubtedly lose."
		"troy_mth_mythic_monster_battle_hydra_monster_unit"
	);
	local player_army = bm:get_player_army()
	local player_units_list = player_army:units()

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);

	am:add_trigger_condition(
		function()
			for i=1, player_units_list:count() do
				if player_units_list:item(i):type() == "troy_mth_gen_myth_hydra" then
					return true
				end
			end
			return false
		end,
		"ScriptEventConflictPhaseBegins"
	);
end;



--
--	MYTHIC_monster_battle_hydra_roster
--
do
	local am = advice_monitor:new(
		"MYTHIC_monster_battle_hydra_roster",
		70,
		-- Cerberus, son of Typhon, is the mighty hound of Hades, guardian of the gates to the Underworld. In battle, its strength and ferocity is legend, and its howl alone is enough to harrow the most hardened of enemies. Though a swarm of spear-bearers and the like and a barrage of javelins may be enough to bring it down, the Shades of the dead are sure to answer its call for aid, and a burst of fire from the river Phlegethon is sure to ward off most foes.
		"troy_mth_mythic_monster_battle_hydra_roster"
	);
	local player_army = bm:get_player_army()
	local player_units_list = player_army:units()

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);

	am:add_trigger_condition(
		function()
			for i=1, player_units_list:count() do
				local curr_unit = player_units_list:item(i):type()
				if 	curr_unit == "troy_mth_gen_myth_drinkers_venom" or 
					curr_unit == "troy_mth_gen_myth_hydra_archers" or 
					curr_unit == "troy_mth_gen_myth_hydra_defenders" or 
					curr_unit == "troy_mth_gen_myth_hydra_priest" 	then
					return true
				end
			end
			return false
		end,
		"ScriptEventConflictPhaseBegins"
	);
end;



--
--	DIVINE_will_army_abilities_in_battle
--
do
	local am = advice_monitor:new(
		"DIVINE_will_army_abilities_in_battle",
		90,
		-- Your warriors stand ready to serve. They await only your orders.
		"troy_mth_divine_will_army_ablities_battle"
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);

	am:add_trigger_condition(
		function()
			
			local uic = find_uicomponent(core:get_ui_root(), "army_ability_parent");

			if uic and uic:Visible() and uic:ChildCount() >= 1 then
				return true
			end
			return false
		end,
		"ScriptEventDeploymentPhaseBegins"
	);

end;



--
--	FLC_bodyguard_units_description
--
do
	local am = advice_monitor:new(
		"FLC_bodyguard_units_description",
		90,
		-- Your warriors stand ready to serve. They await only your orders.
		"phar_battle_advisor_general_bodyguard_01",
		{
			"phar_battle_info_hero_bodyguards_01",
			"phar_battle_info_hero_bodyguards_02",
			"phar_battle_info_hero_bodyguards_03",
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);

	am:add_start_condition(
		true,
		"ScriptEventDeploymentPhaseBegins"
	);

	am:add_trigger_condition(
		function()
			local player_army_unit_list = bm:get_player_army():units()
			local player_army_units_number = player_army_unit_list:count()
			local player_army_commander

			for i=1, player_army_units_number do
				local curr_unit = player_army_unit_list:item(i)
				if curr_unit:is_commanding_unit() then
					if curr_unit:initial_number_of_men() > 1 then
						return true
					end
				end
			end
			return false
		end,
		"ScriptEventConflictPhaseBegins"

	);

	am:add_halt_condition(true, "ScriptEventConflictPhaseBegins");
end;
