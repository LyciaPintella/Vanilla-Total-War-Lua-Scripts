out("Loading phar_shemsu_hor.lua")

local output = function (str)
	out("Shemsu Hor - " .. str)
end

shemsu_hor = 
{
	config = 
	{
		shemsu_hor_period = 6,
		initial_turns_to_shemsu_hor = 5,
		campaigns_using_shemsu_hor = 
		{
			-- comment this to disable Shemsu Hor entirely
			--"phar_main",
		},
	},


	persistent = {
		turns_to_shemsu_hor = 0,
	},

	-- set to true/false in on_first_tick
	is_active = nil,

	-------------------------------------------------------------------------------------
	-- EXTERNAL METHODS: meant to be called from outside this file, for UI or AI purposes

	--- @function get_turns_to_shemsu_hor
	--- @desc Checks how many turns remain until shemsu hor - 0 means it is chemsu hor
	--- @return number showing turns remaining
	get_turns_to_shemsu_hor = function()
		return shemsu_hor.persistent.turns_to_shemsu_hor
	end,

	--- @function is_shemsu_hor
	--- @desc Checks if 0 turns remain until Shemsu Hor
	--- @return true or false depending on if this turn is shemsu hor
	is_shemsu_hor = function()
		return shemsu_hor.is_active and shemsu_hor.get_turns_to_shemsu_hor() == 0
	end,

	--- @function get_shemsu_hor_period
	--- @desc Returns period from one Shemsu Hor to the next
	--- @return number of turns from one Shemsu Hor to the next
	get_shemsu_hor_period = function()
		return shemsu_hor.config.shemsu_hor_period
	end,

	-------------------------------------------------------------------
	-- INTERNAL METHODS - meant to only be called from inside this file

	-- sets the initial value for turns to shemsu hor
	new_game_init = function()
		-- we need to account for the first RoundStart, which will reduce it by 1
		shemsu_hor.persistent.turns_to_shemsu_hor = shemsu_hor.config.initial_turns_to_shemsu_hor + 1
	end,

	-- decreases the turns to shemsu hor, or resets the timer if we are at shemsu hor
	advance = function()
		local pre_event_data =
		{
			turns_remaining = shemsu_hor.persistent.turns_to_shemsu_hor,
		}
		core:trigger_event("ShemsuHor_About_to_Advance", pre_event_data)

		if shemsu_hor.persistent.turns_to_shemsu_hor <= 0 then
			shemsu_hor.persistent.turns_to_shemsu_hor = shemsu_hor.config.shemsu_hor_period - 1
		else 
			shemsu_hor.persistent.turns_to_shemsu_hor = shemsu_hor.persistent.turns_to_shemsu_hor - 1
		end

		local event_data =
		{
			turns_remaining = shemsu_hor.persistent.turns_to_shemsu_hor,
		}
		cm:set_script_state("turns_to_shemsu_hor", shemsu_hor.persistent.turns_to_shemsu_hor)
		core:trigger_event("ShemsuHor_Advanced", event_data)

		local is_shemsu_hor_notification_disabled = to_bool(cm:get_saved_value("bool_is_tutorial_mode") and not cm:get_saved_value("tut_shemsu_hor_advice_monitors_started"))
		cm:set_script_state("is_shemsu_hor_notification_disabled", is_shemsu_hor_notification_disabled)

		if shemsu_hor.persistent.turns_to_shemsu_hor == 0 then
			output("Shemsu Hor arrived!")
			local event_data = {}
			core:trigger_event("ShemsuHor_Arrived", event_data)

			shemsu_hor.emit_event_feed_message()
		end
	end,

	emit_event_feed_message = function()
		local human_factions = cm:get_human_factions()
		for i = 1, #human_factions do
			local faction_key = human_factions[i]
			cm:add_event_feed_event("politics_shemsu_hor", faction_key, 0)
		end
	end,

	-------------------------------------------------------------------
	-- INTERNAL METHODS - meant to only be called from inside this file

	save_shemsu_hor = function(context)
		cm:save_named_value("Shemsu_Hor", shemsu_hor.persistent, context)
	end,

	load_shemsu_hor = function(context)
		shemsu_hor.persistent = cm:load_named_value("Shemsu_Hor", shemsu_hor.persistent, context)
		-- save migration
		if not shemsu_hor.persistent.turns_to_shemsu_hor then
			shemsu_hor.new_game_init()
		end
	end,

	on_first_tick = function(context)
		local campaign_name_key = cm:model():campaign_name_key()
		shemsu_hor.is_active = (table_find(shemsu_hor.config.campaigns_using_shemsu_hor, campaign_name_key) ~= nil)
		if not shemsu_hor.is_active then
			return
		end
		cm:set_script_state("turns_to_shemsu_hor", shemsu_hor.persistent.turns_to_shemsu_hor)
		cm:set_script_state("shemsu_hor_period", shemsu_hor.config.shemsu_hor_period)

		local is_shemsu_hor_notification_disabled = to_bool(cm:get_saved_value("bool_is_tutorial_mode") and not cm:get_saved_value("tut_shemsu_hor_advice_monitors_started"))
		cm:set_script_state("is_shemsu_hor_notification_disabled", is_shemsu_hor_notification_disabled)
	end,
}

--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------

cm:add_saving_game_callback(function(context) shemsu_hor.save_shemsu_hor(context) end)
cm:add_loading_game_callback(function(context) shemsu_hor.load_shemsu_hor(context) end)
cm:add_first_tick_callback(function(context) shemsu_hor:on_first_tick(context) end)

--------------------------------------------------------------
----------------------- CHEATS -------------------------------
--------------------------------------------------------------
cheat_force_quiet_shemsu_hor = function()
	if shemsu_hor.persistent.turns_to_shemsu_hor == 0 then
		-- no need to do anything
		return
	end

	output("cheat_force_quiet_shemsu_hor used. we will be at shemsu hor without triggering its effects!")
	shemsu_hor.persistent.turns_to_shemsu_hor = 0
end

cheat_force_shemsu_hor = function()
	output("cheat_force_shemsu_hor used!")
	-- we use repeat-until instead of do-while so we force trigger on_shemsu_hor again even if we are already in shemsu_hor
	repeat
		shemsu_hor.advance()
	until shemsu_hor.is_shemsu_hor()
end

--------------------------------------------------------------
----------------------- EVENT LISTENERS  ---------------------
--------------------------------------------------------------

-- called after new game
core:add_listener(
	"shemsu_hor_NewCampaign",
	"NewCampaignStarted",
	true,
	function(context)
		shemsu_hor.new_game_init()
	end,
	true
)

-- called at the start of every round
core:add_listener(
	"shemsu_hor_RoundStart",
	"RoundStart",
	function(context)
		return shemsu_hor.is_active
	end,
	function(context)
		shemsu_hor.advance()
	end,
	true
)

core:add_listener(
	"shemsu_hor_FactionTurnStart",
	"FactionTurnStart",
	function(context)
		return shemsu_hor.is_active
	end,
	function(context)
		-- Show Shemsu Hor notification to local faction
		if not shemsu_hor.is_shemsu_hor() or cm:get_bool_script_state("is_shemsu_hor_notification_disabled") then
			return
		end

		local current_faction_key = context:faction():name()
		local local_faction_key = cm:get_local_faction_name(true)
		if not local_faction_key or current_faction_key ~= local_faction_key then
			return
		end

		local turn_number = cm:turn_number()
		local turns_to_next_shemsu_hor = shemsu_hor.config.shemsu_hor_period

		local layout_path = "data/ui/campaign ui/shemsu_hor_notification";
		local component_id = "shemsu_hor_notification";
		local ui_root = core:get_ui_root()

		local shemsu_hor_notification_component = UIComponent(ui_root:CreateComponent(component_id, layout_path));

		-- check if we have features/mechanics that unlock this shemsu hor and the next, and show the notification for shemsu hor
		local features_unlocked_this_shemsu_hor = {}
		local features_unlocked_next_shemsu_hor = {}
		local faction_unlock_config = feature_unlock.config[local_faction_key] or {}
		for index, feature_table in ipairs(faction_unlock_config) do
			local feature_localised_string = feature_unlock.shemsu_hor_localised_strings[feature_table.feature]
			local feature_icon = feature_unlock.shemsu_hor_feature_icons[feature_table.feature]
			if feature_table.feature == feature_ids_config.commands then
				feature_icon = feature_icon[local_faction_key]
			end

			local newly_unlocked_feature_table = 
			{
				feature = feature_localised_string,
				icon = feature_icon
			}

			if feature_table.unlock_turn == turn_number then
				table.insert(features_unlocked_this_shemsu_hor, newly_unlocked_feature_table)
			elseif feature_table.unlock_turn == (turn_number + turns_to_next_shemsu_hor) then
				table.insert(features_unlocked_next_shemsu_hor, newly_unlocked_feature_table)
			end
		end

		if shemsu_hor_notification_component then
			shemsu_hor_notification_component:InterfaceFunction("populate_and_show_notification", features_unlocked_next_shemsu_hor, features_unlocked_this_shemsu_hor)
		end

	end,
	true
)