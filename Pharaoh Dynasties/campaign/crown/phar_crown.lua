local file_info = debug.getinfo(1, "S")
local folder_file_splits = string.split(file_info.source, "\\")
out("Loading " .. folder_file_splits[#folder_file_splits])

local crown_config = {
	id = "crown",
	persistent_suffix = "_crown_mechanic",

	-- Do not change the order of the mechanics in this list, since it is important for the iteration of some things
	-- For instance: phar_legitimacy_choice uses already defined things from the configs of other mechanics
	mechanics = {
		"phar_legitimacy_system",
		"phar_political_states",
		"phar_powers_system",
		"phar_ancillary_system",

		"phar_legitimacy_egyptian",
		"phar_political_states_egyptian",
		"phar_powers_egyptian",
		"phar_ancillary_egyptian",

		"phar_legitimacy_hittite",
		"phar_political_states_hittite",
		"phar_powers_hittite",
		"phar_ancillary_hittite",

		"phar_legitimacy_aegean",
		"phar_political_states_aegean",
		"phar_powers_aegean",
		"phar_ancillary_aegean",

		"phar_legitimacy_mesopotamian",
		"phar_political_states_mesopotamian",
		"phar_powers_mesopotamian",
		"phar_ancillary_mesopotamian",

		"phar_legitimacy_choice",

		"phar_modular_difficulty_all_royal_powers",
	},

	ui = {
		shared_state_own_path_turns = "your_path_turns",
		legacy_selection_panel = "legacy_selection",
		crown_panel = "pharaohs_crown",
	},
}

crown = {
	config = crown_config,

	mechanics = {

	},

	require_files = function(self)
		for _, v in ipairs(self.config.mechanics) do
			local mechanic = require(v)
			if mechanic and is_table(mechanic) then
				table.insert(self.mechanics, mechanic)
			end
		end

		for _, mechanic in ipairs(self.mechanics) do
			if is_function(mechanic.post_init) then
				mechanic:post_init()
			end
			if is_function(mechanic.post_init_generic) then
				mechanic:post_init_generic()
			end
		end
	end,

	events = {
		PanelOpenedCampaign = function(self, context)
			if context.string == self.config.ui.crown_panel then
				-- Pharaoh panel
			end
		end,

		FactionTurnStart = function(self, context)
			local turn_number = cm:turn_number()
			local faction = context:faction()
			local faction_key = faction:name()
			local feature_available_turn = feature_unlock.get_feature_unlock_turn_for_faction(faction_key, feature_ids_config.pharaohs_crown)

			local active = turn_number >= feature_available_turn

			if faction_key == cm:get_local_faction_name(true) then
				crown:update_crown_button(faction_key, active)
			end

			if active and not legitimacy_choice:any_legitimacy_unlocked(faction_key) then
				cm:set_script_state(faction, self.config.ui.shared_state_own_path_turns, turn_number - feature_available_turn)
			end

			local notify_legitimacy_special_ancillary_equipped_and_available = function()
				if faction_key ~= cm:get_local_faction_name(true) then
					return
				end

				-- Faction has to be a sitting ruler.
				local legitimacy_chosen
				if egypt_political_states:is_sitting_pharaoh(faction_key) then
					legitimacy_chosen = egypt_political_states
				elseif hatti_political_states:is_sitting_great_king(faction_key) then
					legitimacy_chosen = hatti_political_states
				else
					return
				end

				local character_list = faction:character_list()

				local comma_separated_ancillaries_equipped = ""
				for i = 0, character_list:num_items() - 1 do
					local character = character_list:item_at(i)
					for _, ancillary_data in ipairs(legitimacy_chosen.special_ancillary_system.config.ancillaries) do
						if character:has_ancillary(ancillary_data.ancillary_key) then
							comma_separated_ancillaries_equipped = comma_separated_ancillaries_equipped .. ancillary_data.ancillary_key .. ","
						end
					end
				end

				local comma_separated_ancillaries_available = ""
				for _, ancillary_data in ipairs(legitimacy_chosen.special_ancillary_system.config.ancillaries) do
					if faction:ancillary_exists(ancillary_data.ancillary_key) then
						comma_separated_ancillaries_available = comma_separated_ancillaries_available .. ancillary_data.ancillary_key .. ","
					end
				end

				local political_state_id = legitimacy_chosen.config.id -- "political_states" or "hatti_political_states"
				cm:notify_legitimacy_special_ancillary_equipped_and_available(faction_key, comma_separated_ancillaries_equipped, comma_separated_ancillaries_available, political_state_id)
			end

			notify_legitimacy_special_ancillary_equipped_and_available()
		end,

		LegitimacyPathUnlocked = function(self, context)
			if cm:get_local_faction_name(true) ~= context.stored_table.faction_key then
				return
			end
			crown:update_crown_button(context.stored_table.faction_key, true)

			local legitimacy_object = legitimacy_choice:get_unlocked_legitimacy(context.stored_table.faction_key)
			legitimacy_object:create_legitimacy_sources_cco(context.stored_table.faction_key)
		end,

		ContextTriggerEvent = function(self, context)
			local uic = context.component
			local splits = context.string:split(":")

			if splits[1] == "legitimacy_support_deal" then
				CampaignUI.OpenDiplomacyFactionList()
				CampaignUI.SetDiplomacyFactionListFilter("legitimacy")
				return
			end

			if not uic then
				return
			end

			uic = UIComponent(uic)

			if splits[1] == "generic_court_position_tooltip_on_component" then
				local position = splits[2]

				-- "egyptian", "hittite", "aegean" or "meso"
				local court_type = splits[3]
				self:setup_generic_court_position_tooltip(uic, position, court_type)
				return
			end
		end,
	},

	-- If an event from the above table is added to here with a function, and that function returns false then it will
	-- not register a listener for this event. This is useful for when some things are disabled in the config and
	-- the events for those things are no longer needed.
	event_add_condition = {
		--[[
		FactionTurnStart = function(self)
			-- If this returns false the event from above will not be created
			return false
		end,
		]]--
	},

	on_new_game_started = function(self, context)
		self:notify_mechanics("on_new_game_started", context)
	end,

	on_first_tick = function(self, context)
		if is_table(self.mechanics) then
			for _, mechanic in ipairs(self.mechanics) do
				local add_mechanic_listeners = false
				-- call on_new_game_started
				if is_table(mechanic) and is_function(mechanic.on_first_tick) then
					add_mechanic_listeners = mechanic:on_first_tick(context)
				end

				-- add listeners for specific events
				if add_mechanic_listeners and is_table(mechanic.events) then
					for event_id, callback_func in pairs(mechanic.events) do
						if is_function(callback_func) and is_function(mechanic.id) then
							self.add_listener_for_event(mechanic, event_id)
						end
					end
				end
			end
		end
		if is_table(self.events) then
			for event_id, _ in pairs(self.events) do
				self:add_listener_for_event(event_id)
			end
		end

		local local_faction_name = cm:get_local_faction_name(true)
		if local_faction_name then
			local active = feature_unlock.is_feature_unlocked_for_faction(local_faction_name, feature_ids_config.pharaohs_crown)
			crown:update_crown_button(local_faction_name, active)
		end
	end,

	on_saving_game = function(self, context)
		if not is_table(self.config) or not self.config.persistent_suffix or self.config.persistent_suffix == "" then return end

		-- save mechanics persistent data
		if is_table(self.mechanics) then
			for _, mechanic in ipairs(self.mechanics) do
				if is_table(mechanic) and is_table(mechanic.persistent) and is_function(mechanic.id) then
					cm:save_named_value(mechanic:id(self.config.persistent_suffix), mechanic.persistent, context)
				end
			end
		end
	end,

	on_loading_game = function(self, context)
		if not is_table(self.config) or not self.config.persistent_suffix or self.config.persistent_suffix == "" then return end

		-- load mechanics persistent data
		if is_table(self.mechanics) then
			for _, mechanic in ipairs(self.mechanics) do
				if is_table(mechanic) and is_table(mechanic.persistent) and is_function(mechanic.id) then
					mechanic.persistent = cm:load_named_value(mechanic:id(self.config.persistent_suffix), mechanic.persistent, context)
				end
			end
		end

		self:notify_mechanics("on_loading_game", context)
	end,

	notify_mechanics = function(self, function_name, context)
		for _, mechanic in ipairs(crown.mechanics) do
			if is_table(mechanic) and is_function(mechanic[function_name]) then
				mechanic[function_name](mechanic, context)
			end
		end
	end,

	-- Legitimacy ids is a table that includes ids like egypt_legitimacy.config.id
	--[[ Example:
	{
		no_path = true,
		[egypt_legitimacy.config.id] = true,
		[hatti_legitimacy.config.id] = true,
	}
	--]]
	send_message_event_to_paths_including = function(self, event_info, is_persistent, legitimacy_ids)
		local player_factions = cm:get_human_factions()

		if not player_factions then
			return
		end

		for _, player_faction in ipairs(player_factions) do
			local unlocked_legitimacy = legitimacy_choice:get_unlocked_legitimacy(player_faction)
			local has_no_path = unlocked_legitimacy == nil

			local include_selected_legitimacy = false

			if unlocked_legitimacy then
				local unlocked_legitimacy_id = unlocked_legitimacy.config.id
				include_selected_legitimacy = legitimacy_ids[unlocked_legitimacy_id]
			end

			if  (legitimacy_ids.no_path and has_no_path)
				or include_selected_legitimacy
			then
				if event_info.event_key then
					cm:add_event_feed_event(
						event_info.event_key,
						player_faction,
						event_info.event_pic_index,
						event_info.str_param1,
						event_info.str_param2,
						event_info.str_param3,
						event_info.int_param1,
						event_info.int_param2,
						event_info.int_param3
					)
				else
					cm:show_message_event(
						player_faction,
						event_info.title_key,
						event_info.secondary_detail,
						event_info.text,
						is_persistent or false,
						event_info.event_pic_index
					)
				end
			end
		end
	end,

	--[[ Options argument can include:
	{
		no_path = true,
		[egypt_legitimacy.config.id] = true,
		[hatti_legitimacy.config.id] = true,
	}
	If any option is missing will assume it's false
	--]]
	send_message_event_to_paths_excluding = function(self, event_info, is_persistent, legitimacy_ids)
		local include_table = {
			no_path = true,
		}

		for _, mechanic in ipairs(crown.mechanics) do
			include_table[mechanic.config.id] = true
		end

		for legitimacy_id, exclude in pairs(legitimacy_ids) do
			include_table[legitimacy_id] = not exclude
		end

		self:send_message_event_to_paths_including(event_info, is_persistent, include_table)
	end,

	add_listener_for_event = function(self, event_id)
		if not is_table(self.events) or not is_function(self.id) or not is_function(self.events[event_id]) then
			return
		end

		if is_table(self.event_add_condition)
			and is_function(self.event_add_condition[event_id])
			and not self.event_add_condition[event_id](self)
		then
			return
		end

		local register_id = self:id(event_id)
		core:add_listener(
				register_id,
				event_id,
				true,
				function(context)
					self.events[event_id](self, context)
				end,
				true
		)
	end,

	create_mechanic_from_type = function(self, mechanic_type, base_table)
		local new_object = base_table or {}

		for k, v in pairs(mechanic_type) do
			if not is_function(v) then
				if is_table(v) then
					new_object[k] = table_deep_copy(v)
				else
					new_object[k] = v
				end
			end
		end

		setmetatable(new_object, { __index = mechanic_type })

		return new_object
	end,

	setup_generic_court_position_tooltip = function(self, uic, position, court_type)
		local court_obj

		local court_type_to_court_obj = {
			["egyptian"] = court.egyptian_court,
			["hittite"] = court.hittite_court,
			["aegean"] = court.aegean_court,
			["meso"] = court.mesopotamian_court,
		}

		court_obj = court_type_to_court_obj[court_type or ""]

		if not court_type or not court_obj then
			self:error_message("trying to setup a court position tooltip for an invalid court type: " .. tostring(court_type))
			return
		end

		local target_position_obj = court.util_functions.get_court_position(court_obj, position)

		if not target_position_obj then
			self:error_message("trying to setup a court position tooltip for an invalid position: " .. tostring(position))
			return
		end

		local title_key = court.position_functions.get_position_name_localization_key(target_position_obj, court_obj)
		local description_key = target_position_obj.description_localization_key

		local title = common.get_localised_string(title_key)
		local description = common.get_localised_string(description_key)

		uic:SetTooltipText(title .. "||" .. description, "Script", true)
	end,

	-- returns a simple or composite ID
	id = function(self, suff)
		if not is_table(self.config) or not self.config.id then
			out("Missing common ID")
			return
		end
		return suff and suff ~= "" and self.config.id.."_"..suff or self.config.id
	end,

	error_message = function(self, message)
		out("ERROR "..self.config.id..": "..message)
	end,

	update_crown_button = function(self, faction_key, feature_turn_reached)
		local ui_root = core:get_ui_root()
		local crown_mechanic_container = ui_root and ui_root:SequentialFind("fm_phar_pharaoh_crown_container")
		if not crown_mechanic_container then
			return
		end

		local has_chosen_own_path = forge_path.is_any_system_unlocked(faction_key)
		if has_chosen_own_path then
			crown_mechanic_container:SetVisible(false)
			return
		end

		local can_forge_own_path = forge_path.get_num_unlockable_systems(faction_key) > 0
		crown_mechanic_container:SetVisible(true)
		local crown_mechanic_button = crown_mechanic_container:SequentialFind("button_fm_phar_pharaoh_crown")
		if not crown_mechanic_button then
			return
		end

		cm:override_ui("disable_crown", not feature_turn_reached);
		if not feature_turn_reached then
			crown_mechanic_button:SetState("inactive");
			local title_key_when_inactive = "uied_component_texts_localised_string_title_tx_tradition_selection_Text_3629daea"
			local description_key = "random_localisation_strings_string_button_phar_early_ancient_legacy_tooltip"
			local feature_available_turn = feature_unlock.get_feature_unlock_turn_for_faction(faction_key, feature_ids_config.pharaohs_crown)
			local description_param = {
				{
					text = description_key,
					params = {
						feature_available_turn
					}
				}
			}
			crown_mechanic_button:SetTooltipWithTitle(title_key_when_inactive, description_param)
		end

		local crown_alert = crown_mechanic_container:SequentialFind("holder_alert_icon")
		if crown_alert then
			if can_forge_own_path then
				crown_alert:SetVisible(true)
			else
				crown_alert:SetVisible(false)
			end
		end
	end,

	ui = {
	},
}

crown:require_files()

--------------------------------------------------------------
-------------------- INIT / SAVING / LOADING -----------------
--------------------------------------------------------------
cm:add_first_tick_callback_new(function(context) crown:on_new_game_started(context) end)
cm:add_first_tick_callback(function(context) crown:on_first_tick(context) end)
cm:add_saving_game_callback(function(context) crown:on_saving_game(context) end)
cm:add_loading_game_callback(function(context) crown:on_loading_game(context) end)
