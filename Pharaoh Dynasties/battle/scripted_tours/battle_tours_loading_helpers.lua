


require("script.frontend_battle_tutorial_data")



-----------------------------------------------------------------------------------------------------------------
-- Custom behaviour callbacks for battle tutorials
-----------------------------------------------------------------------------------------------------------------

local function steal_focus_and_start_navigable_tour_on_deployment(nt, enable_cinematic_ui_on_start)
	bm:register_phase_change_callback(
	 	"Deployment",
		function()
			bm:steal_input_focus(true, false)
			core:close_info_overlays();
			common.enable_info_overlays(false)

			if enable_cinematic_ui_on_start then
				bm:enable_cinematic_ui(true, true, true)
			end

			core:progress_on_loading_screen_dismissed(
				function()
					local uic_finish_deployment = core:get_ui_root():SequentialFind("finish_deployment")
					if uic_finish_deployment then
						uic_finish_deployment:PropagateVisibility(false)
					end
					bm:camera():fade(true, 0)

					nt:start()
				end
			)
		end
	)
end


local function start_navigable_tour_on_deployment(nt)
	bm:register_phase_change_callback(
		"Deployment",
		function()
			bm:steal_input_focus(true, false)

			core:progress_on_loading_screen_dismissed(
				function()
					bm:steal_input_focus(false, false)

					nt:start()
				end
			);
		end
	)
end




-----------------------------------------------------------------------------------------------------------------
-- Build an indexed (i.e. in order of precedence) list of tutorial battles to consider loading
-----------------------------------------------------------------------------------------------------------------

local tutorial_battles_indexed = {

	-- Basic Battle Tutorial
	{
		battle_name = "battle_tutorial",
		frontend_battle_record = phar_tutorial_battles.battle_tutorial,
		on_start_callback = function()
			steal_focus_and_start_navigable_tour_on_deployment(nt_battle_fundamentals, true)
		end
	},

	-- Advanced Battle Tutorial
	{
		battle_name = "advanced_battle_tutorial",
		frontend_battle_record = phar_tutorial_battles.advanced_battle_tutorial,
		on_start_callback = function()
			steal_focus_and_start_navigable_tour_on_deployment(nt_battle_advanced, false)
		end
	},

	-- Siege Attack Tutorial
	{
		battle_name = "siege_attack_tutorial",
		frontend_battle_record = phar_tutorial_battles.siege_attack_tutorial,
		on_start_callback = function()
			start_navigable_tour_on_deployment(nt_siege_battle_attack)
		end
	},

	-- Siege Defence Tutorial
	{
		battle_name = "siege_defense_tutorial",
		frontend_battle_record = phar_tutorial_battles.siege_defense_tutorial,
		on_start_callback = function()
			start_navigable_tour_on_deployment(nt_siege_defence)
		end
	},

	-- Minor Settlement Tutorial
	{
		battle_name = "minor_settlement_tutorial",
		frontend_battle_record = phar_tutorial_battles.minor_settlement_tutorial,
		on_start_callback = function()
			start_navigable_tour_on_deployment(nt_minor_settlement)
		end
	}
}




-----------------------------------------------------------------------------------------------------------------
-- Private helper functions
-----------------------------------------------------------------------------------------------------------------


-- Returns whether we should immediately start the scripted behaviour for a particular tutorial battle
local function battle_tutorial_should_immediately_start(battle_record_name, svr_bool_key, tweaker_name)
	if svr_bool_key and core:svr_load_bool(svr_bool_key) then
		return true, "svr boolean [" .. svr_bool_key .. "] is set"
	end

	if tweaker_name and core:is_tweaker_set(tweaker_name) then
		return true, "tweaker [" .. tweaker_name .. "] is set"
	end
	return false
end;


-- Sets a particular tutorial battle to start again if it's restarted, by establishing a listener for the battle restarting
local function set_battle_tutorial_start_on_restart(battle_record_name, svr_bool_key, show_output)
	core:add_listener(
		"restart_tutorial_battles_listener",
		"ContextTriggerEvent",
		function(context) 
			return context.string == "RestartBattleSelected"
		end,
		function(context)
			if show_output then
				bm:out("*")
				bm:out("* Tutorial battle is restarting, setting tutorial behaviour [" .. battle_record_name .. "] to restart by setting [" .. svr_bool_key .. "] svr boolean to true")
				bm:out("*")
			end
			core:svr_save_bool(svr_bool_key, true)
		end,
		false
	)
end;


-- Indicates that we're in a tutorial battle that has been loaded from the frontend
local battle_is_tutorial_loaded_from_frontend = false







-----------------------------------------------------------------------------------------------------------------
-- Public functions / data 
-----------------------------------------------------------------------------------------------------------------


-- Return the internal tutorial_battles_indexed table if client scripts want it
function get_tutorial_battles_indexed()
	return tutorial_battles_indexed
end


-- Returns whether this is a battle tutorial that has been loaded from the frontend
function is_battle_tutorial_loaded_from_frontend()
	return battle_is_tutorial_loaded_from_frontend
end


-- Will we be starting any battle tutorial tour
function should_immediately_start_any_battle_tutorial()

	-- Return true if we've already determined that this is a tutorial loading from the frontend and started the behaviour
	if battle_is_tutorial_loaded_from_frontend then
		return true
	end
	
	for _, tutorial_battle_record in ipairs(tutorial_battles_indexed) do
		local battle_name = tutorial_battle_record.battle_name
		local svr_bool_key = tutorial_battle_record.frontend_battle_record.svr_bool
		local tweaker_name = tutorial_battle_record.frontend_battle_record.tweaker

		if battle_tutorial_should_immediately_start(battle_name, svr_bool_key, tweaker_name) then
			return true
		end
	end

	return false
end


-- Loop through all tutorial battle records to determine if the behaviour associated with one should be
-- started immediately.
function immediately_start_battle_tutorial_if_apppropriate()
	for _, tutorial_battle_record in ipairs(tutorial_battles_indexed) do
		local battle_name = tutorial_battle_record.battle_name
		local svr_bool_key = tutorial_battle_record.frontend_battle_record.svr_bool
		local tweaker_name = tutorial_battle_record.frontend_battle_record.tweaker

		local should_start, reason = battle_tutorial_should_immediately_start(battle_name, svr_bool_key, tweaker_name)
		if should_start then
			-- This battle tutorial behaviour should start

			bm:out("*")
			bm:out("* Starting battle tutorial behaviour [" .. battle_name .. "], " .. reason or "<no reason found>")
			bm:out("*")
			bm:out("")

			battle_is_tutorial_loaded_from_frontend = true

			-- Stop this battle tutorial behaviour from starting in later battles
			core:svr_save_bool(svr_bool_key, false)

			-- Set this battle tutorial behaviour to start again if the player restarts the battle
			set_battle_tutorial_start_on_restart(battle_name, svr_bool_key, true)

			-- Start custom behaviour for this tutorial battle record
			tutorial_battle_record.on_start_callback()

			return true
		end
	end

	return false
end


-- Clear all svr values that, if set, mean we immediately start some battle tutorial behaviour
function clear_battle_tutorial_svr_bools()
	for _, tutorial_battle_record in ipairs(tutorial_battles_indexed) do
		core:svr_save_bool(tutorial_battle_record.frontend_battle_record.svr_bool, false)
	end
end

