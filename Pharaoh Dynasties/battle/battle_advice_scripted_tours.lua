

-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	SCRIPTED TOUR ADVICE MONITORS
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

local im = get_infotext_manager();



bm:register_phase_change_callback(
	"Deployed",
	function()
		core:svr_save_timestamp("timestamp_battle_started");

		if bm:battle_type() == "settlement_standard" then
			core:svr_save_timestamp("timestamp_major_siege_started");
		end;
	end
);











--
--	DEPLOYMENT_tour
--

do
	im:set_button_state_override(
		"phar_main_st_battle_deployment_0004",
		function()
			nt_battle_advanced:start();
		end,
		function(uic)
			
		end,
		"ScriptEventConflictPhaseBegins"
	);

	do
		local am = advice_monitor:new(
			"DEPLOYMENT_tour",
			100,
			-- Your soldiers are ready to deploy for battle, my lord. They await your orders.
			"phar_main_st_battle_deployment_0001",
			{
				"phar_main_st_battle_advanced_0001",
				"phar_main_st_battle_advanced_0002",
				"phar_main_st_battle_advanced_0003",
				"phar_main_st_battle_deployment_0004",
			}
		);

		am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);

		am:add_ignore_advice_history_tweaker("SCRIPTED_TWEAKER_21");
		am:add_ignore_advice_history_condition(
			function()
				local timestamp_name = "timestamp_battle_started";
				local time_since_timestamp = core:svr_time_since_timestamp(timestamp_name);
				local threshold = 3 * SECONDS_PER_MONTH;
	
				if time_since_timestamp then
					if time_since_timestamp > threshold then
						get_advice_manager():out(am.name .. " will disregard advice history as time since timestamp " .. timestamp_name .. " was last recorded is " .. time_since_timestamp .. " which is more than threshold value " .. threshold);
						return true;
					end;
				else
					get_advice_manager():out(am.name .. " will disregard advice history as timestamp " .. timestamp_name .. " has not previously been recorded");
					return true;
				end
			end
		);
		
		am:set_duration(0);

		local function trigger_condition()
			return not bm:is_ambush_battle() 
							and not bm:is_major_settlement_battle() 
							and not bm:is_minor_settlement_battle()
							and not bm:battle_type() == "settlement_sally"
							and not core:svr_load_bool("sbool_disable_advisor_for_tutorial_battles")
		end;

		am:add_trigger_condition(
			trigger_condition, 
			"ScriptEventDeploymentPhaseBegins"
		);

		am:add_trigger_condition(
			function()
				return bm:is_deployment_phase() and trigger_condition();
			end,
			"ScriptEventScriptedTourCompleted"
		);
	end;
end;











--
--	DEPLOYMENT_fundamentals_tour
--

do
	im:set_button_state_override(
		"phar_main_st_battle_fundamentals_0004",
		function()
			nt_battle_fundamentals:start();
		end,
		function(uic)
			
		end,
		"ScriptEventConflictPhaseBegins"
	);

	local am = advice_monitor:new(
		"DEPLOYMENT_fundamentals_tour",
		110,
		-- Greatness in battle may only be reached through rigorous training. Even the most skillful of generals must regularly practice their craft.
		"phar_main_st_battle_fundamentals_0001",
		{
			"phar_main_st_battle_fundamentals_0001",
			"phar_main_st_battle_fundamentals_0002",
			"phar_main_st_battle_fundamentals_0003",
			"phar_main_st_battle_fundamentals_0004"
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);

	am:add_ignore_advice_history_tweaker("SCRIPTED_TWEAKER_20");
	am:add_ignore_advice_history_condition(
		function()
			local timestamp_name = "timestamp_battle_started";
			local time_since_timestamp = core:svr_time_since_timestamp(timestamp_name);
			local threshold = 3 * SECONDS_PER_MONTH;

			if time_since_timestamp then
				if time_since_timestamp > threshold then
					get_advice_manager():out(am.name .. " will disregard advice history as time since timestamp " .. timestamp_name .. " was last recorded is " .. time_since_timestamp .. " which is more than threshold value " .. threshold);
					return true;
				end;
			else
				get_advice_manager():out(am.name .. " will disregard advice history as timestamp " .. timestamp_name .. " has not previously been recorded");
				return true;
			end;
		end
	);

	am:set_duration(0);

	local function trigger_condition()
		return nt_battle_fundamentals.min_player_units_threshold_reached 
						and nt_battle_fundamentals.min_enemy_units_threshold_reached 
						and nt_battle_fundamentals.bounding_box_to_use 
						and not core:get_active_scripted_tour()
						and not core:svr_load_bool("sbool_disable_advisor_for_tutorial_battles")

	end;

	am:add_trigger_condition(
		function()
			return trigger_condition();
		end, 
		"ScriptEventDeploymentPhaseBegins"
	);

	am:add_trigger_condition(
		function()
			return bm:is_deployment_phase() and trigger_condition();
		end,
		"ScriptEventScriptedTourCompleted"
	);
end;




--
--	DEPLOYMENT_major_siege_battle_defence_scripted_tour
--

do
	im:set_button_state_override(
		"phar_battle_advice_major_siege_battles_info_005",
		function()
			nt_siege_defence:start();
		end,
		function(uic)
			
		end,
		"ScriptEventConflictPhaseBegins"
	);

	local am = advice_monitor:new(
		"DEPLOYMENT_major_siege_battle_defence_scripted_tour",
		95,
		-- The enemy look set to begin their attack soon. Should they drive out your forces or wrest key locations from your grasp then the city will surely be lost. Man the defences, for the city must not fall!
		"phar_main_battle_advice_major_settlement_defence_01",
		{
			"phar_battle_advice_major_siege_battles_info_001",
			"phar_battle_advice_major_siege_battles_info_002",
			"phar_battle_advice_major_siege_battles_info_003",
			"phar_battle_advice_major_siege_battles_info_005"
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);

	am:add_ignore_advice_history_tweaker("SCRIPTED_TWEAKER_23");
	am:add_ignore_advice_history_condition(
		function()
			local timestamp_name = "timestamp_major_siege_started";
			local time_since_timestamp = core:svr_time_since_timestamp(timestamp_name);
			local threshold = 3 * SECONDS_PER_MONTH;

			if time_since_timestamp then
				if time_since_timestamp > threshold then
					get_advice_manager():out(am.name .. " will disregard advice history as time since timestamp " .. timestamp_name .. " was last recorded is " .. time_since_timestamp .. " which is more than threshold value " .. threshold);
					return true;
				end;
			else
				get_advice_manager():out(am.name .. " will disregard advice history as timestamp " .. timestamp_name .. " has not previously been recorded");
				return true;
			end;
		end
	);

	am:set_duration(0);

	local function trigger_condition()
		return bm:battle_type() == "settlement_standard" and not bm:player_is_attacker() and not core:get_active_scripted_tour();
	end;

	am:add_trigger_condition(
		trigger_condition,
		"ScriptEventDeploymentPhaseBegins"
	);

	am:add_trigger_condition(
		function()
			return bm:is_deployment_phase() and trigger_condition();
		end,
		"ScriptEventScriptedTourCompleted"
	);
end;














--
--	DEPLOYMENT_major_siege_battle_attacking_scripted_tour
--

do
	im:set_button_state_override(
		"phar_battle_advice_major_siege_battles_info_004",
		function()
			nt_siege_battle_attack:start();
		end,
		function(uic)
			
		end,
		"ScriptEventConflictPhaseBegins"
	);

	local am = advice_monitor:new(
		"DEPLOYMENT_major_siege_battle_attacking_scripted_tour",
		95,
		-- Your forces are lined up and ready to attack. The enemy fortifications are formidable, but you must seek to overcome them and either drive out the enemy forces or seize key locations within the city.
		"phar_main_battle_advice_major_settlement_attack_01",
		{
			"phar_battle_advice_major_siege_battles_info_001",
			"phar_battle_advice_major_siege_battles_info_002",
			"phar_battle_advice_major_siege_battles_info_003",
			"phar_battle_advice_major_siege_battles_info_004"
		}
	);

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);

	am:add_ignore_advice_history_tweaker("SCRIPTED_TWEAKER_23");
	am:add_ignore_advice_history_condition(
		function()
			local timestamp_name = "timestamp_major_siege_started";
			local time_since_timestamp = core:svr_time_since_timestamp(timestamp_name);
			local threshold = 3 * SECONDS_PER_MONTH;

			if time_since_timestamp then
				if time_since_timestamp > threshold then
					get_advice_manager():out(am.name .. " will disregard advice history as time since timestamp " .. timestamp_name .. " was last recorded is " .. time_since_timestamp .. " which is more than threshold value " .. threshold);
					return true;
				end;
			else
				get_advice_manager():out(am.name .. " will disregard advice history as timestamp " .. timestamp_name .. " has not previously been recorded");
				return true;
			end;
		end
	);

	am:set_duration(0);

	local function trigger_condition()
		return bm:battle_type() == "settlement_standard" and bm:player_is_attacker() and not core:get_active_scripted_tour();
	end;

	am:add_trigger_condition(
		trigger_condition,
		"ScriptEventDeploymentPhaseBegins"
	);

	am:add_trigger_condition(
		function()
			return bm:is_deployment_phase() and trigger_condition();
		end,
		"ScriptEventScriptedTourCompleted"
	);
end;



--
--	DEPLOYMENT_minor_settlement_battle_attack_scripted_tour
--


do
	im:set_button_state_override(
		"phar_battle_advice_minor_settlement_battles_info_004",
		function()
			nt_minor_settlement:start();
		end,
		function(uic)
			
		end,
		"ScriptEventConflictPhaseBegins"
	);

	-- setup shared infotext
	local infotext = {
		"phar_battle_advice_minor_settlement_battles_info_001",
		"phar_battle_advice_minor_settlement_battles_info_002",
		--"phar_battle_advice_minor_settlement_battles_info_003",
		"phar_battle_advice_minor_settlement_battles_info_004"
	};

	local am

	if bm:player_is_attacker() then 

		am = advice_monitor:new(
			"DEPLOYMENT_minor_settlement_battle_attack_scripted_tour",
			95,
			-- Your forces are ready to storm the defences! Yet I advise caution, for you face an entrenched enemy that has had time to prepare - be wary!
			"phar_main_battle_advice_minor_settlement_attack_01",
			infotext
		);
	else 
		am = advice_monitor:new(
			"DEPLOYMENT_minor_settlement_battle_defence_scripted_tour",
			95,
			-- Gather your warriors about you, for the enemy line up to attack! They will soon press forward, but your entrenched position places the settlement defences at your disposal. Use them wisely!
			"phar_main_battle_advice_minor_settlement_defence_01",
			{
				"phar_battle_advice_minor_settlement_battles_info_001",
				"phar_battle_advice_minor_settlement_battles_info_002",
				--"phar_battle_advice_minor_settlement_battles_info_003",
				"phar_battle_advice_minor_settlement_battles_info_005"
			}
		);
	end

	am:set_advice_level(ADVICE_LEVEL_LOW_HIGH);

	am:add_ignore_advice_history_tweaker("SCRIPTED_TWEAKER_23");
	am:add_ignore_advice_history_condition(
		function()
			local timestamp_name = "timestamp_major_siege_started";
			local time_since_timestamp = core:svr_time_since_timestamp(timestamp_name);
			local threshold = 3 * SECONDS_PER_MONTH;

			if time_since_timestamp then
				if time_since_timestamp > threshold then
					get_advice_manager():out(am.name .. " will disregard advice history as time since timestamp " .. timestamp_name .. " was last recorded is " .. time_since_timestamp .. " which is more than threshold value " .. threshold);
					return true;
				end;
			else
				get_advice_manager():out(am.name .. " will disregard advice history as timestamp " .. timestamp_name .. " has not previously been recorded");
				return true;
			end;
		end
	);

	am:set_duration(0);

	local function trigger_condition()
		return bm:battle_type() == "settlement_unfortified" and bm:player_is_attacker() and not core:get_active_scripted_tour();
	end;

	am:add_trigger_condition(
		trigger_condition,
		"ScriptEventDeploymentPhaseBegins"
	);

	am:add_trigger_condition(
		function()
			return bm:is_deployment_phase() and trigger_condition();
		end,
		"ScriptEventScriptedTourCompleted"
	);
end;


