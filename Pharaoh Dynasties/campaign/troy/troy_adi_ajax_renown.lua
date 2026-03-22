---------------------------- DESIGN
local prefix = "troy_adi_ajax_renown"
local mission_prefix = prefix .. "_mission_"

out("Loading " .. prefix .. ".lua")

-- exposed data
troy_adi_ajax_renown_export_data = {
	--defs = {},		-- tweakers
	--listeners =  {},	-- listeners
	--functions = {},	-- internal used functions
	--progress =  {},	-- faction mechanics progress
	--ui_progress = {}, -- ui progress
}

local ajax_defs = {
	missions_save_version = 1,

	-- UI
	ui = {
		-- panel
		panel = "fm_ajaxs_renown",

		-- missions
		missions_list = "renown_missions_listview",
		mission_template = "mission_template",
		mission_no_missions = "tx_mission_unavailable",

		-- ancillaries
		ancillaries_list = "ancillary_prize",
		ancillary_template = "prize_template",
		ancillary_selector = "ancillary_selector",
		ancillary_button = "ancillary_select_button",

		-- renown bar
		renown_bar = "renown_bar_fill",
		renown_bar_tooltip = "renown_bar_parent",
		renown_bar_effect_bundle = "renown_bundle",
		renown_bar_effects_list = "effects_list",
		renown_bar_tier = "treshold_template",
		renown_bar_tier_parent = "tresholds_holder",
		

		-- celebration
		celebration_button = "btn_hold_celebrations",

		celebration_confirmation_dlg_id = prefix .. "celebration_confirmation_dlg_id",
		celebration_confirmation_dlg_description = "campaign_localised_strings_string_troy_adi_ajax_renown_celebration_confirmation_dialog_description",

		celebration_button_tooltip_description = "campaign_localised_strings_string_troy_adi_ajax_renown_celebration_description",
		celebration_button_tooltip_not_match_description = "campaign_localised_strings_string_troy_adi_ajax_renown_celebration_not_match_description",
		celebration_button_tooltip_cooldown_description = "campaign_localised_strings_string_troy_adi_ajax_renown_celebration_cooldown_description",
		celebration_button_tooltip_select_at_least_one_description = "campaign_localised_strings_string_troy_adi_ajax_renown_celebration_select_at_least_one_description",
		celebration_button_tooltip_not_enough_renown_description = "campaign_localised_strings_string_troy_adi_ajax_renown_celebration_not_enough_renown_description",

		--
		celebration_ancillary_button_tooltip_nothing_to_select = "campaign_localised_strings_string_troy_adi_ajax_renown_celebration_ancillary_nothing_to_select_description",	

		celebration_text_display_key = "dummy_troy_adi_ajax_renown_ancillary_spent",
		celebration_text_resource_display_key = "dummy_troy_adi_ajax_renown_faction_gifts_resources",
		celebration_text_peace_display_key = "dummy_troy_adi_peace_from_ajax_celebration",

		renown_bar_tooltip_trojan_text = "troy_adi_ajax_renown_tooltip_danaan_description",
		renown_bar_tooltip_danaan_text = "troy_adi_ajax_renown_tooltip_trojan_description",
	},

	-- celebrations
	celebration_max_factions = 3,
	celebration_diplomacy_change_relation_amount = 5,
	celebration_incident = "troy_adi_ajax_renown_celebration_incident",
	celebration_cooldown = 15,

	--
	messages = {
		--ajax
		heroic_victory_names_name_648162272 = {
			title = "event_feed_strings_text_troy_adi_fm_ajax_renown_message_title",
			primary_detail = "event_feed_strings_text_troy_adi_fm_ajax_renown_message_heroic_victory_primary_details",
			secondary_detail = "event_feed_strings_text_troy_adi_fm_ajax_renown_message_heroic_victory_ajax_secondary_details",
			index = 1100,
		},

		--teucer
		heroic_victory_names_name_121567699 = {
			title = "event_feed_strings_text_troy_adi_fm_ajax_renown_message_title",
			primary_detail = "event_feed_strings_text_troy_adi_fm_ajax_renown_message_heroic_victory_primary_details",
			secondary_detail = "event_feed_strings_text_troy_adi_fm_ajax_renown_message_heroic_victory_teucer_secondary_details",
			index = 1103,
		},

		renown_new_tier = {
			title = "event_feed_strings_text_troy_adi_fm_ajax_renown_message_title",
			primary_detail = "event_feed_strings_text_troy_adi_fm_ajax_renown_message_tier_reached_primary_details",
			secondary_detail = "event_feed_strings_text_troy_adi_fm_ajax_renown_message_tier_reached_secondary_details",
			index = 1101,
		},

		renown_max_tier = {
			title = "event_feed_strings_text_troy_adi_fm_ajax_renown_message_title",
			primary_detail = "event_feed_strings_text_troy_adi_fm_ajax_renown_message_max_tier_primary_details",
			secondary_detail = "event_feed_strings_text_troy_adi_fm_ajax_renown_message_max_tier_secondary_details",
			index = 1102,
		},
	},

	-- faction related
	faction_key = "troy_main_dan_salamis",

	-- pooled resource
	pooled_resource_factor = "troy_resource_factor_faction",
	pooled_resource_renown_key = "troy_adi_renown",

	-- switch to the trojan camp
	story_dilemma_id = "troy_story_dilemma_danaans",
	switch_to_trojan_camp_dilemma_id = "troy_adi_ajax_fm_switch_sides_dilemma",

	-- renown
	renown_per_heroic_victory = 2,
	renown_tiers = {
		-- these are in separate tables, because pair enumerates them randomly, ipairs return nil ([1] is nil)

		-- Tier 0
		{
			[4] = {
				-- TODO: for test
				--celebration_gift = {
				--	troy_food = 1000,
				--	troy_wood = 400,
				--	troy_stones = 150,
				--	troy_bronze = 150,
				--	troy_gold = 100,
				--},
			},
		},

		-- Tier 1
		{
			[10] = {
				bundle = {"troy_adi_effect_bundle_ajax_renown_tier_1", "troy_adi_effect_bundle_ajax_renown_trojan_tier_1"},
				celebration_gift = {
					troy_food = 1000,
					troy_wood = 400,
					troy_stones = 150,
					troy_bronze = 150,
					troy_gold = 100,
				},
			},
		},

		-- Tier 2
		{
			[30] = {
				bundle = {"troy_adi_effect_bundle_ajax_renown_tier_2", "troy_adi_effect_bundle_ajax_renown_trojan_tier_2"},
				celebration_gift = {
					troy_food = 2000,
					troy_wood = 800,
					troy_stones = 300,
					troy_bronze = 300,
					troy_gold = 200,
				},
			},
		},

		-- Tier 3
		{
			[60] = {
				bundle = {"troy_adi_effect_bundle_ajax_renown_tier_3", "troy_adi_effect_bundle_ajax_renown_trojan_tier_3"},
				celebration_gift = {
					troy_food = 3000,
					troy_wood = 1200,
					troy_stones = 450,
					troy_bronze = 450,
					troy_gold = 300,
				},
			},
		},

		-- Tier 4
		{
			[99] = {
				bundle = {"troy_adi_effect_bundle_ajax_renown_tier_4", "troy_adi_effect_bundle_ajax_renown_trojan_tier_4"},
				celebration_gift = {
					troy_food = 4000,
					troy_wood = 1600,
					troy_stones = 600,
					troy_bronze = 600,
					troy_gold = 400,
				},
			},
		},

		-- Tier 5
		{
			[100] = {
				bundle = {"troy_adi_effect_bundle_ajax_renown_tier_5", "troy_adi_effect_bundle_ajax_renown_trojan_tier_5"},
				celebration_gift = {
					troy_food = 5000,
					troy_wood = 2000,
					troy_stones = 750,
					troy_bronze = 750,
					troy_gold = 500,
				},
			},
		},
	},

	dilemma = {
		id = "troy_adi_ajax_fm_renown_dilemma",
		cooldown = 10,
		next_dilemma_turns_min = 8,
		next_dilemma_turns_max = 12,
		friend_diplomatic_standing_threshold = 1,
		destroy_faction_payload = "dummy_troy_adi_ajax_renown_dilemma_destroy_faction",
		defeat_leader_payload = "dummy_troy_adi_ajax_renown_dilemma_defeat_leader",
		strong_diplomacy_payload = "troy_adi_effect_bundle_ajax_fm_dilemma_1",
	},
	
	missions = {

		-- mission data per priorities
		[1] = {
			key = "troy_adi_mission_renown_fm_defeat_hero_1",
		},

		[2] = {
			key = "troy_adi_mission_renown_fm_destroy_faction_1",
			min_regions_count = 4,
		},

		[3] = {
			key = "troy_adi_mission_renown_fm_defeat_leader_1",
		},

		[4] = {
			key = "troy_adi_mission_renown_fm_conquer_capital_1",
			objective = "mission_text_text_mis_activity_capture_faction_capital",
		},

		--renown gained
		renown = {
			-- these are in separate tables, because pair enumerates them randomly, ipairs return nil ([1] is nil)
			{[29] = 2},
			{[59] = 4},
			{[60] = 8},
		},

		issuer = "CLAN_ELDERS",


		--effect bundle
		effect_bundle = {
			id = "troy_adi_effect_bundle_ajax_fm_enemy_debuffs",
			duration = 0,
			effects = {
				{
					effect_key = "troy_adi_effect_renown_mission_%s_1",
					scope_key = "faction_to_force_own_factionwide",
					value = 5,
				},

				-- {
				--	effect_key = "troy_adi_effect_renown_mission_%s_2",
				--	scope_key = "faction_to_force_own_factionwide",
				--	value = 5,
				--},			
			},
		},
	},

	traits = {
		renown_per_trait = {
			troy_adi_trait_heroic_victory_1	= 2,
			troy_adi_trait_heroic_victory_2	= 3,
			troy_adi_trait_heroic_victory_3	= 4,
			troy_adi_trait_saviour_1 = 3,
			troy_adi_trait_attacking_victory_3 = 3,
			troy_adi_trait_defending_victory_3 = 3,
			troy_adi_trait_wins_at_sea_3 = 3,
			troy_adi_trait_siege_victory_3 = 3,
			troy_adi_trait_defeated_achilles = 3,
			troy_adi_trait_defeated_aeneas = 3,
			troy_adi_trait_defeated_agamemnon = 3,
			troy_adi_trait_defeated_hector = 3,
			troy_adi_trait_defeated_hippolyta = 3,
			troy_adi_trait_defeated_menelaus = 3,
			troy_adi_trait_defeated_odysseus = 3,
			troy_adi_trait_defeated_paris = 3,
			troy_adi_trait_defeated_penthesilea = 3,
			troy_adi_trait_defeated_sarpedon = 3,
			troy_adi_trait_defeated_diomedes_ajax = 3,
			troy_rem_adi_trait_defeated_memnon = 3,
			troy_rem_adi_trait_defeated_rhesus = 3,
			troy_adi_trait_wins_1 = 2,
			troy_adi_trait_wins_2 = 3,
			troy_adi_trait_wins_3 = 3,
		},

		characters = {
			--ajax
			names_name_648162272 = true,

			--teucer
			names_name_121567699 = true,
		},
	},

	champion_defeated_renown_reward = {
		troy_adi_trj_edonia_champion = 2,
		troy_adi_dan_esperia_champion = 2,
		troy_adi_dan_pylos_champion = 2,
		troy_adi_dan_dionysias_champion = 3,
		troy_adi_dan_knossos_champion = 3,
		troy_adi_dan_knossos_champion_2 = 3,
		troy_adi_dan_kyme_champion = 3,
		troy_adi_dan_mycenae_champion = 3,
		troy_adi_dan_noagria_champion = 3,
		troy_adi_dan_sparta_champion = 3,
		troy_adi_trj_paeonians_champion = 3,
		troy_adi_dan_dionysias_champion_2 = 4,
		troy_adi_dan_ithaca_champion = 4,
		troy_adi_dan_phyllis_champion = 4,
		troy_adi_trj_cicones_champion = 4,
		troy_adi_trj_thyni_champion = 4,
		troy_adi_dan_achilles_champion = 5,
		troy_adi_dan_dolopians_champion = 5,
		troy_adi_dan_pylos_champion_2 = 5,
		troy_adi_trj_apsynthioi_champion = 5,
		troy_adi_trj_penthesilea_champion = 5,
		troy_adi_trj_lycia_champion = 5,
	},

	mission_min_turn_condition = 10,

	faction_to_min_turn_condition = {
		troy_main_trj_hector = 40,
		troy_main_trj_paris = 40,
	},
}
-----------------------------------------------------------------------------
---------------------------- CODE IMPLEMENTATION ---------------------------- 
-----------------------------------------------------------------------------

local ajax_listeners = {
	-- listener structure
	--[[
	placeholder_listener_name = {
		-- event data
		event_name = "placeholder_event_name" | {"placeholder_event_name_01", "placeholder_event_name_02", etc} | nil (using the placeholder_listener_name), 
		callback = function (context, event_name) end
		filter_callback = function (context, event_name) end or true
		panel_event = true / false (default) -- determines if this listener is active only when the panel is opened, if nil -> forced to false
	},
	--]]
}

local ajax_functions = {
	-- all used local functions
}

-- this table is saved / loaded
local ajax_progress = {

	--active_missions = {
		-- faction_key = {
		--  id = mission id
		--  priority = [1 .. 4]
		--  cqi = number or nil (depending on mission type could be character cqi)
		--	region = region id or nil
		--	renown_amount
		-- }
	--}

	--next_mission_id = number | nil
	--last_mission_priority = number | nil

	-- dilemma = {
		-- enemy_faction = 
		-- friend_faction =
		-- next_turn = turn number | nil
	-- }

	-- celebration = {
		-- next_turn = turn_number | nil
		-- factions = { faction1, faction2, faction3}
	--}

	-- with_trojans = true

	-- past_missions = {} used for the purpose of creating mission managers 
}

-- this table is not saved / loaded
local ajax_ui_progress = {

	-- ancillaries = {
		-- {
		--		component =					- ancillary template
		--		callback_component =		- ancillary node, that have callback class
		--		button_component =			- button component
		--		ancillary = id or nil
		--		character = cqi or nil
		-- },

		-- ajax_defs.celebration_max_factions
	-- },

	-- factions = {
		-- faction1,
		-- faction2,

		--..
		-- factionn
	-- }

	-- selected_ancillary = 1 .. ajax_defs.celebration_max_factions or nil
	-- renown_bar_width = width or nil
}

--
ajax_functions.output_debug_string = function(string)
	out(prefix .. ": " .. string)
end

ajax_functions.process_listeners = function(add, panel_events)
	-- Listeners
	for listener_name, listener_data in pairs(ajax_listeners) do

		-- register / unregister listeners
		if panel_events == (listener_data.panel_event or false) then
			-- event_name could be either string or array or nil
			local event_names = { listener_name }
			if is_table(listener_data.event_name) then 
				event_names = listener_data.event_name
			elseif is_string(listener_data.event_name) then
				event_names = { listener_data.event_name }
			end

			--
			for event_index, event_name in ipairs(event_names) do

				--
				if listener_data.callback ~= nil and is_function(listener_data.callback) then
					local listener_name = prefix .. "_" .. listener_name .. "_" .. event_name .. "_" .. event_index

					if add then
						ajax_functions.output_debug_string("adding listener: " .. listener_name)

						core:add_listener(
							listener_name,
							event_name,

							function(context)
								if listener_data.filter_callback ~= nil and is_function(listener_data.filter_callback) then
									--ajax_functions.output_debug_string("triggering event filter for listener: " .. listener_name)
									return listener_data.filter_callback(context, event_name)
								end

								return true
							end,

							function(context)
								ajax_functions.output_debug_string("triggering event for listener: " .. listener_name)

								-- invoke callback
								listener_data.callback(context, event_name)
							end,
							true
						)
					else
						ajax_functions.output_debug_string("removing listener: " .. listener_name)
						core:remove_listener(listener_name)
					end
				end
			end
		end
	end
end


--
ajax_functions.get_renown_tier_data_for_renown = function(renown_amount)
	-- determine renown amount
	local bundle = nil
	local tier = 0
	for index, val in ipairs(ajax_defs.renown_tiers) do
		local a, b = next(val, nil)
		if renown_amount <= a then 
			return index - 1, b
		end

		bundle = b
		tier = index - 1
	end

	return tier, bundle
end

--
ajax_functions.faction = function()
	local faction = cm:model():world():faction_by_key(ajax_defs.faction_key)
	if faction == nil or faction:is_null_interface() then 
		ajax_functions.output_debug_string("-> ajax faction is not defined (" .. ajax_defs.faction_key .. ")") 
		return nil 
	end
	return faction
end

ajax_functions.celebration_is_on_cooldown = function()
	return ajax_progress.celebration ~= nil and ajax_progress.celebration.next_turn > cm:turn_number()
end

ajax_functions.celebration_wait_turns = function()
	return ajax_progress.celebration and (ajax_progress.celebration.next_turn - cm:turn_number())
end

ajax_functions.show_message_event = function(event_id, param1, param2, param3)
	local event_data = ajax_defs.messages[event_id]
	if event_data ~= nil then
		cm:show_configurable_message_event(ajax_defs.faction_key, event_data.title, event_data.primary_detail, event_data.secondary_detail, event_data.index, param1 or 0, param2 or 0, param3 or 0)
	end
end

ajax_functions.update_renown_for_heroic_battle_winner = function(character)
	if character:faction():name() == ajax_defs.faction_key and character:get_forename() ~= "" and ajax_defs.traits.characters[character:get_forename()] == true then
		ajax_functions.output_debug_string("-> champion: " .. character:get_forename() .. " gains " .. ajax_defs.renown_per_heroic_victory .. " renown for achieving a herioc victory")
		cm:faction_add_pooled_resource(ajax_defs.faction_key, ajax_defs.pooled_resource_renown_key, ajax_defs.pooled_resource_factor, ajax_defs.renown_per_heroic_victory)
	
		--notify player
		ajax_functions.show_message_event("heroic_victory_" .. character:get_forename(), ajax_defs.renown_per_heroic_victory)
	end
end

ajax_functions.update_mission_effects = function()
	local faction = ajax_functions.faction()
	if faction == nil then return end

	ajax_functions.output_debug_string("-> ajax_update_mission_effects")

	-- remove effect bundle first
	cm:remove_effect_bundle(ajax_defs.missions.effect_bundle.id, ajax_defs.faction_key)

	local effect_bundle = cm:create_new_custom_effect_bundle(ajax_defs.missions.effect_bundle.id)
	effect_bundle:set_duration(ajax_defs.missions.effect_bundle.duration)

	local effects = 0

	for faction_name, active_mission_data in pairs(ajax_progress.active_missions or {}) do

		-- there is an active mission for that faction
		if active_mission_data.id ~= nil then

			--add faction mission bundle
			ajax_functions.output_debug_string(" -> there is an active mission for faction: " .. faction_name .. ", adding effects...")

			for _, v in ipairs(ajax_defs.missions.effect_bundle.effects) do
				local effect_key = string.format(v.effect_key, faction_name)
				ajax_functions.output_debug_string("  -> " .. effect_key .. " with scope: " .. v.scope_key .. " and value: " .. v.value)
				effect_bundle:add_effect(effect_key, v.scope_key, v.value)
				effects = effects + 1
			end
		end
	end

	--
	if effects > 0 then
		ajax_functions.output_debug_string("-> adding custom effect bundle (" .. ajax_defs.missions.effect_bundle.id .. ") to " .. ajax_defs.faction_key .. " with " .. effects .. " effects for: " .. ajax_defs.missions.effect_bundle.duration .. " turns")
		cm:apply_custom_effect_bundle_to_faction(effect_bundle, faction)
	else
		ajax_functions.output_debug_string("-> there are no effects to be added")
	end
end

ajax_functions.cancel_mission = function(active_mission_data)
	ajax_functions.output_debug_string("-> canceling active mission with id: " .. active_mission_data.id or "nil")
end


ajax_functions.issue_mission = function(faction_name, active_mission_data, trigger)
	
	if active_mission_data.version == nil or active_mission_data.version ~= ajax_defs.missions_save_version then
		ajax_functions.output_debug_string("-> missions version mismatch, skipping... ")
		return false
	end

	local objective = nil
	local conditions = {}

	local faction = cm:model():world():faction_by_key(faction_name)
	if faction == nil or faction:is_null_interface() then 
		ajax_functions.output_debug_string("-> unable to get faction with id: " .. faction_name)
		return false
	end

	if active_mission_data.priority == 1 then
		objective = "ENGAGE_FORCE"
		table.insert(conditions, "requires_victory")
		table.insert(conditions, "cqi " .. active_mission_data.cqi)
		--ajax_functions.output_debug_string("-> ENGAGE_FORCE: " ..  character:military_force():command_queue_index() .. ", forename: " .. character:get_forename())
	elseif active_mission_data.priority == 2 then
		objective = "DESTROY_FACTION"
		table.insert(conditions, "faction " .. faction_name)
		table.insert(conditions, "confederation_valid")
		active_mission_data.ignore_faction_destroyed = true
	elseif active_mission_data.priority == 3 then
		objective = "ENGAGE_FORCE"
		table.insert(conditions, "requires_victory")
		table.insert(conditions, "cqi " .. active_mission_data.cqi)
	--[[else
		objective = "CAPTURE_REGIONS"
		table.insert(conditions, "region " .. active_mission_data.region)
		--table.insert(conditions, "ignore_allies")]]
	end


	local mission_key = ajax_defs.missions[active_mission_data.priority].key

	-- spawn mission
	--local payload = "adjust_experience_for_character {  cqi ".. ajax_functions.faction():faction_leader():command_queue_index() .. "; amount 3000; }"
	local payload = "faction_pooled_resource_transaction{ resource " .. ajax_defs.pooled_resource_renown_key .."; factor " .. ajax_defs.pooled_resource_factor .. "; amount " .. active_mission_data.renown_amount .. "; }"
	local mission = mission_manager:new(ajax_defs.faction_key, mission_key)

	--
	mission:set_mission_custom_id(active_mission_data.id)
	mission:set_mission_issuer(ajax_defs.missions.issuer)
	mission:set_should_cancel_before_issuing(false)


	ajax_functions.output_debug_string("-> Spawning mission(" .. mission_key .. ") against: " .. faction_name .. " with custom_id: " .. active_mission_data.id .. " with payload: (" .. payload .. "), priority: " .. active_mission_data.priority)

	-- spawn objective
	if objective ~= nil then
		mission:add_new_objective(objective)
		ajax_functions.output_debug_string("-> objective: " .. objective)

		for _, condition in ipairs(conditions) do
			mission:add_condition(condition)
			ajax_functions.output_debug_string("-> condition: " .. condition)
		end

		mission:add_payload(payload)

		mission:register()

		if trigger then
			mission:trigger()
		end

	-- spawn capture capital scripted objective
	else
		local script_id = prefix .. "_RegionFactionChangeEvent_" .. active_mission_data.id

		local update_scripted_objective = function(faction, custom_id)
			local settlement = nil

			if faction:has_home_region() then
				settlement = faction:home_region():settlement()
			end

			if settlement == nil or settlement:is_null_interface() then
				ajax_functions.output_debug_string("-> There is no new home region, terminating mission!")
				cm:cancel_mission_by_id(ajax_defs.faction_key, custom_id)
				return
			end

			local x = settlement:logical_position_x()
			local y = settlement:logical_position_y()

			cm:set_scripted_mission_position(ajax_defs.missions[4].key, script_id, x, y, custom_id)
			cm:set_scripted_mission_text(ajax_defs.missions[4].key, script_id, ajax_defs.missions[4].objective, "faction:" .. faction:name() .. ":icon:name", "region:" .. faction:home_region():name(), "", custom_id);
		end

		--
		mission:add_new_scripted_objective(
			ajax_defs.missions[4].objective,
			"RegionFactionChangeEvent",
			function(context)	
				ajax_functions.output_debug_string("RegionFactionChangeEvent enter")

				if context:was_capital() ~= true then 
					ajax_functions.output_debug_string("-> Region was not capital")
					return 
				end

				--
				local previous_faction = context:previous_faction()
				if previous_faction == nil or previous_faction:is_null_interface() then return end

				local region = context:region()
				if region == nil or region:is_null_interface() then return end

				local new_faction = region:owning_faction()
				if new_faction == nil or new_faction:is_null_interface() then return end

				local previous_faction_name = previous_faction:name()
				if previous_faction_name ~= faction_name then
					ajax_functions.output_debug_string("-> Previous faction: " .. previous_faction_name .. " was not the monitored one: " .. faction_name)
					return
				end

				local new_faction_name = new_faction:name()

				ajax_functions.output_debug_string("RegionFactionChangeEvent enter for capital region: " .. region:name() .. ", prev faction: " .. previous_faction_name .. ", new faction: " .. new_faction_name)

				local active_mission_data = ajax_progress.active_missions and ajax_progress.active_missions[previous_faction_name]
				if active_mission_data == nil or active_mission_data.id == nil or active_mission_data.priority ~= 4 then
					ajax_functions.output_debug_string("-> There is no active capture capital mission, terminating")
					return
				end

				if new_faction_name == ajax_defs.faction_key then
					ajax_functions.output_debug_string("-> There is an active capture capital mission, objective completed!")
					return true
				end

				-- 
				ajax_functions.output_debug_string("-> There is an active capture capital mission, but another faction has captured the capital, reallocating objective location / name!")
				update_scripted_objective(previous_faction, active_mission_data.id)
			end,

			script_id,
			true,
			true
		)

		mission:add_payload(payload)

		mission:register()
		if trigger then
			mission:trigger()
		end

		update_scripted_objective(faction, active_mission_data.id)
	end


	cm:set_mission_display_faction(ajax_defs.faction_key, faction_name, "", active_mission_data.id)
	return true
end

-- if last_mission_priority < 0 -> force priority abs(last_mission_priority)
ajax_functions.spawn_mission = function(character, active_mission_data, mission_id, last_mission_priority)
	local faction = character:faction()
	local faction_name = faction:name()

	local objective = nil
	local conditions = {}

	--last_mission_priority = -1

	-- determine priority
	if last_mission_priority == -1 or (last_mission_priority > 0 and last_mission_priority ~= 1 and character:is_immortal() and character:has_military_force()) then
		active_mission_data.priority = 1
		active_mission_data.cqi = character:military_force():command_queue_index()
		--ajax_functions.output_debug_string("-> ENGAGE_FORCE: " ..  character:military_force():command_queue_index() .. ", forename: " .. character:get_forename())
	elseif last_mission_priority == -2 or (last_mission_priority > 0 and last_mission_priority ~= 2 and faction:num_regions() <= ajax_defs.missions[2].min_regions_count) then
		active_mission_data.priority = 2
	elseif last_mission_priority == -3 or (last_mission_priority > 0 and last_mission_priority ~= 3 and faction:has_faction_leader() and faction:faction_leader():has_military_force() and faction:faction_leader():has_region()) then
		active_mission_data.priority = 3
		active_mission_data.cqi = faction:faction_leader():military_force():command_queue_index()
	--[[elseif faction:has_home_region() then
		active_mission_data.region = faction:home_region():name()]]
	else
		if not faction:has_home_region() then
			ajax_functions.output_debug_string("-> Unable to spawn mission (objective is nil for priority 4 because " .. faction_name .. " has no home region)")
			return
		end

		active_mission_data.priority = 4
	end

	active_mission_data.id =  mission_prefix .. mission_id .. "#" .. faction_name
	active_mission_data.version = ajax_defs.missions_save_version

	-- determine renown amount
	active_mission_data.renown_amount = 0
	local turn_number = cm:turn_number()
	for _, val in ipairs(ajax_defs.missions.renown) do
		local turn, amount = next(val, nil)
		active_mission_data.renown_amount = amount
		if turn_number <= turn then break end
	end

	--
	ajax_functions.issue_mission(faction_name, active_mission_data, true)
end


ajax_functions.spawn_mission_against_character = function(character, last_mission_priority)
	local faction = ajax_functions.faction()
	if faction == nil or not faction:is_human() then 
		ajax_functions.output_debug_string("-> spawn mission called for non-player faction, terminating")
		return 
	end

	local faction_name = character:faction():name()
	local active_mission_data = ajax_progress.active_missions and ajax_progress.active_missions[faction_name]
	 
	if active_mission_data ~= nil and active_mission_data.id ~= nil then
		ajax_functions.output_debug_string("-> There is an active mission for faction " .. faction_name .. ", terminating")
		return
	end

	-- clear structure
	active_mission_data = {}

	local next_mission_id = ajax_progress.next_mission_id or 1

	ajax_functions.spawn_mission(character, active_mission_data, tostring(next_mission_id), last_mission_priority or active_mission_data.last_mission_priority or 0)

	-- mission has spawned
	if active_mission_data.id ~= nil then

		-- create structure if needed
		if ajax_progress.active_missions == nil then
			ajax_progress.active_missions = {}
		end

		ajax_progress.active_missions[faction_name] = active_mission_data
		ajax_progress.next_mission_id = next_mission_id + 1
		ajax_progress.last_mission_priority = active_mission_data.priority

		ajax_functions.update_mission_effects()
	end
end

ajax_functions.get_renown_bar_data_per_renown_amount = function(renown_amount)

	local tiers = {}
	local bundle_index = 1
	local current_points = 0

	if ajax_progress.with_trojans ~= nil and ajax_progress.with_trojans == true then bundle_index = 2 end

	for index, val in ipairs(ajax_defs.renown_tiers) do
		local points, data = next(val, nil)
		if data.bundle ~= nil then
			ajax_functions.output_debug_string("-> index: " .. index .. "; bundle: " .. data.bundle[bundle_index] .. ", min: " .. current_points .. ", max: " .. points)

			table.insert(tiers, {
				bundle = data.bundle[bundle_index],
				min = current_points,
				max = points, })
		end

		current_points = points + 1
	end

	return {
		tiers = tiers,
		points = renown_amount,
	}
end

ajax_functions.update_renown_bar = function(panel, renown_amount, renown_max_value)
	local renown_bar = panel:SequentialFind(ajax_defs.ui.renown_bar)
	local renown_bar_tooltip = panel:SequentialFind(ajax_defs.ui.renown_bar_tooltip)

	if renown_bar ~= nil then
		if ajax_ui_progress.renown_bar_width == nil then
			ajax_ui_progress.renown_bar_width = renown_bar:Width()
		end

		local width = (renown_amount / renown_max_value) * ajax_ui_progress.renown_bar_width
		ajax_functions.output_debug_string("-> setting width: " .. width .. ", max_width: " .. ajax_ui_progress.renown_bar_width)
		renown_bar:Resize(width, renown_bar:Height())
		renown_bar:SetVisible(width > 0)

		--
		if renown_bar_tooltip ~= nil then
			renown_bar_tooltip:InterfaceFunction("set_data", ajax_functions.get_renown_bar_data_per_renown_amount(renown_amount))
			if ajax_progress.with_trojans ~= nil and ajax_progress.with_trojans == true then
				renown_bar_tooltip:InterfaceFunction("set_ajax_side_description_key", ajax_defs.ui.renown_bar_tooltip_trojan_text)
			else
				renown_bar_tooltip:InterfaceFunction("set_ajax_side_description_key", ajax_defs.ui.renown_bar_tooltip_danaan_text)
			end
		end
	end

	-- renown bar effect bundle
	local renown_bar_effect_bundle = panel:SequentialFind(ajax_defs.ui.renown_bar_effect_bundle)
	if renown_bar_effect_bundle ~= nil then
		renown_bar_effect_bundle:SetVisible(true)
		renown_bar_effect_bundle:InterfaceFunction("pre_initialise")

		local bundle_index = 1
		if ajax_progress.with_trojans ~= nil and ajax_progress.with_trojans == true then bundle_index = 2 end

		local tier, tier_data  = ajax_functions.get_renown_tier_data_for_renown(renown_amount)
		local bundle = tier_data.bundle and tier_data.bundle[bundle_index]

		local effects_list = renown_bar_effect_bundle:SequentialFind(ajax_defs.ui.renown_bar_effects_list)
		if effects_list ~= nil then
			effects_list:DestroyChildren()
		end

		local faction = ajax_functions.faction()
		if faction ~= nil and bundle ~= nil and faction:has_effect_bundle(bundle) then
			ajax_functions.output_debug_string("-> there is active renown tier effect bundle " .. bundle .. ", populating")
			renown_bar_effect_bundle:InterfaceFunction("set_effect_bundle", faction:get_effect_bundle(bundle))
		else
			ajax_functions.output_debug_string("-> there is no active renown tier effect bundle")
		end
	end
end

ajax_functions.create_renown_bar_tiers = function(renown_bar_tier_parent, renown_bar_tier_template, renown_max_value, log)
	if renown_bar_tier_template ~= nil and renown_bar_tier_parent ~= nil then			
		local size_x, size_y = renown_bar_tier_parent:Dimensions()

		for i = 1, #ajax_defs.renown_tiers - 1 do
			local a, b = next(ajax_defs.renown_tiers[i], nil)
			if a ~= nil then
				local tier_component = UIComponent(renown_bar_tier_parent:CreateFromComponent(renown_bar_tier_template:Address(), "renown_bar_tier_" .. i))
				local x, y = tier_component:Position()
				local new_x = x + size_x * ((a + 1) / renown_max_value)
				tier_component:SetDockingPoint(0)
				tier_component:MoveTo(new_x, y)

				if log then
					ajax_functions.output_debug_string("-> moving tier " .. i .. " component offset to" .. new_x .. " from " .. x)
				end
			end
		end
	else
		if log then
			ajax_functions.output_debug_string("-> missing renown bar tier template: " .. ajax_defs.ui.renown_bar_tier)
		end
	end

end


ajax_functions.update_factions_list = function(panel, show_only_neighbour_factions)
	panel:InterfaceFunction("set_data", 
		{
			max_selected_factions = ajax_defs.celebration_max_factions,
			selected_factions = ajax_ui_progress.factions, 
			wait_turns = ajax_functions.celebration_wait_turns() or 0,
			show_only_neighbour_factions = show_only_neighbour_factions,
			antagonist_faction_key = antagonist.current
		}
	)
end

ajax_functions.celebration_get_exclude_ancillaries_table = function(current_ancillary_id)
	local exclude_ancillaries = {}

	-- setup exclude list
	for index, ancillary_data in ipairs(ajax_ui_progress.ancillaries or {}) do
		if ancillary_data.ancillary ~= nil then
			table.insert(exclude_ancillaries, {
				ancillary = ancillary_data.ancillary,
				character = ancillary_data.character,
				current = current_ancillary_id == index,
			})
		end
	end

	return exclude_ancillaries
end

ajax_functions.update_ancillary_buttons = function()
	local ancillary_selector = core:get_ui_root():SequentialFind(ajax_defs.ui.panel, ajax_defs.ui.ancillary_selector)
	if ancillary_selector == nil then
		ajax_functions.output_debug_string("-> missing ancillary selector: " .. ajax_defs.ui.ancillary_selector)
		return
	end

	if ajax_ui_progress ~= nil and ajax_ui_progress.ancillaries ~= nil then
		for i = 1, ajax_defs.celebration_max_factions do
			--
			local empty = ancillary_selector:InterfaceFunction("empty", ajax_functions.celebration_get_exclude_ancillaries_table(i))
			if empty then
				ajax_ui_progress.ancillaries[i].button_component:SetTooltipText(common.get_localised_string(ajax_defs.ui.celebration_ancillary_button_tooltip_nothing_to_select), ajax_defs.ui.celebration_ancillary_button_tooltip_nothing_to_select, true)
				ajax_ui_progress.ancillaries[i].button_component:SetState("inactive")	
			else
				ajax_ui_progress.ancillaries[i].button_component:SetTooltipText("", true)
				ajax_ui_progress.ancillaries[i].button_component:SetState("active")	
			end
		end
	end
end

ajax_functions.update_celebration_button = function()
	local celebration_button = core:get_ui_root():SequentialFind(ajax_defs.ui.panel, ajax_defs.ui.celebration_button)

	if celebration_button ~= nil then
		local tooltip_description = ajax_defs.ui.celebration_button_tooltip_description
		local state = "active"

		-- Check if factions / ancillaries match
		local active_ancillaries = 0
		for index, ancillary_data in ipairs(ajax_ui_progress.ancillaries or {}) do
			if ancillary_data.ancillary ~= nil then
				active_ancillaries = active_ancillaries + 1
			end
		end

		local active_factions = 0
		if ajax_ui_progress.factions ~= nil then
			active_factions = #ajax_ui_progress.factions
		end

		--
		local faction = ajax_functions.faction()
		if faction ~= nil and faction:has_pooled_resource(ajax_defs.pooled_resource_renown_key) and ajax_functions.get_renown_tier_data_for_renown(faction:pooled_resource(ajax_defs.pooled_resource_renown_key):value()) == 0 then 
			tooltip_description = ajax_defs.ui.celebration_button_tooltip_not_enough_renown_description
			state = "inactive"	
		elseif ajax_functions.celebration_is_on_cooldown() then
			tooltip_description = ajax_defs.ui.celebration_button_tooltip_cooldown_description
			state = "inactive"
		elseif active_factions == 0 and active_ancillaries == 0 then
			tooltip_description = ajax_defs.ui.celebration_button_tooltip_select_at_least_one_description
			state = "inactive"
		elseif active_ancillaries ~= active_factions then
			tooltip_description = ajax_defs.ui.celebration_button_tooltip_not_match_description
			state = "inactive"
		end

		ajax_functions.output_debug_string("-> setting celebration button with state: " .. state  .. ", description: " .. tooltip_description)
		celebration_button:SetTooltipText(common.get_localised_string(tooltip_description), tooltip_description, true)
		celebration_button:SetState(state)
	else
		ajax_functions.output_debug_string("-> no celebration button with id: " .. ajax_defs.ui.celebration_button .. " is found")
	end
end


ajax_functions.celebration_participants_process = function(process_function)
	if ajax_progress.celebration == nil or ajax_progress.celebration.factions == nil or not is_function(process_function) then return end
	for i = 1, #ajax_progress.celebration.factions do
		local faction1 = ajax_progress.celebration.factions[i]
		for j = i + 1, #ajax_progress.celebration.factions do
			local faction2 = ajax_progress.celebration.factions[j]
			process_function(faction1, faction2)
		end
	end
end


---------------------------- CALLBACKS

-- BattleConflictFinished
ajax_listeners.BattleConflictFinished = {}

ajax_listeners.BattleConflictFinished.callback = function(context, event_name)
	ajax_functions.output_debug_string("BattleConflictFinished enter (" .. event_name .. ")")

	local pending_battle = context:pending_battle()
	local attacker = pending_battle:attacker()
	local defender = pending_battle:defender()

	if attacker == nil or attacker:is_null_interface() or defender == nil or defender:is_null_interface() then return end

	local winner
	local winner_reinforcing
	local winner_result
	local looser

	if attacker:won_battle() then
		winner = attacker
		winner_reinforcing = pending_battle:secondary_attackers()
		winner_result = pending_battle:attacker_battle_result()
		looser = defender
	elseif defender:won_battle() then
		winner = defender
		winner_reinforcing = pending_battle:secondary_defenders()
		winner_result = pending_battle:defender_battle_result()
		looser = attacker
	else return	end

	-- gain renown for herioc victory
	if winner_result == "heroic_victory" then
		ajax_functions.update_renown_for_heroic_battle_winner(winner)
		if winner_reinforcing ~= nil then
			for i = 0, winner_reinforcing:num_items() - 1 do
				local reinforcement = winner_reinforcing:item_at(i)
				if reinforcement ~= nil and not reinforcement:is_null_interface() then
					ajax_functions.update_renown_for_heroic_battle_winner(reinforcement)
				end
			end
		end
	end

	-- missions
	local faction = ajax_functions.faction()
	local winner_faction = winner:faction()
	local looser_faction = looser:faction()

	-- looser is our ally, and winner is not (our ally and human) (it is valid winner to be our ally though)
	if faction ~= nil and faction:allied_with(looser_faction) and not (faction:allied_with(winner_faction) and winner_faction:is_human()) then
		if cm:turn_number() > ajax_defs.mission_min_turn_condition then 
			local winner_faction_key = winner_faction:name()
			if not ajax_defs.faction_to_min_turn_condition[winner_faction_key] then
				ajax_functions.output_debug_string("-> Ajax's faction: " .. ajax_defs.faction_key .. " is an ally with the looser of the BattleConflict: " .. looser_faction:name() .. ", start processing outcome toward: " .. winner_faction:name())
				ajax_functions.spawn_mission_against_character(winner)
			elseif ajax_defs.faction_to_min_turn_condition[winner_faction_key] and cm:turn_number() > ajax_defs.faction_to_min_turn_condition[winner_faction_key] then
				ajax_functions.output_debug_string("-> Ajax's faction: " .. ajax_defs.faction_key .. " is an ally with the looser of the BattleConflict: " .. looser_faction:name() .. ", start processing outcome toward: " .. winner_faction:name())
				ajax_functions.spawn_mission_against_character(winner)
			end
		else
			ajax_functions.output_debug_string("-> Ajax's faction: " .. ajax_defs.faction_key .. " is an ally with the looser of the BattleConflict: " .. looser_faction:name() .. ", but the min turn requirement of ".. ajax_defs.mission_min_turn_condition .. " is not met")
		end
	else
		ajax_functions.output_debug_string("-> Ajax's faction: " .. ajax_defs.faction_key .. " is not an ally with the looser of the BattleConflict: " .. looser_faction:name() .. " or the winner of the conflict: " .. winner_faction:name() .. " is an ally with Ajax's faction and a human player")
	end

end

-- PositiveDiplomaticEvent
ajax_listeners.PositiveDiplomaticEvent = {}

ajax_listeners.PositiveDiplomaticEvent.filter_callback = function(context, event_name)
	return (context:proposer():name() == ajax_defs.faction_key or context:recipient():name() == ajax_defs.faction_key)
end

ajax_listeners.PositiveDiplomaticEvent.callback = function(context, event_name)
	ajax_functions.output_debug_string("PositiveDiplomaticEvent enter (" .. event_name .. "), proposer: " .. context:proposer():name() .. ", recipient" .. context:recipient():name())

	local other_faction_key

	if context:proposer():name() == ajax_defs.faction_key then
		other_faction_key = context:recipient():name()
	else
		other_faction_key = context:proposer():name()
	end

	local active_mission_data = ajax_progress.active_missions and ajax_progress.active_missions[other_faction_key]
	 
	--cancel active mission
	if active_mission_data ~= nil and active_mission_data.id ~= nil then
		ajax_functions.output_debug_string("-> Canceling mission for " .. other_faction_key .. " with custom_id: " .. active_mission_data.id)
		cm:cancel_mission_by_id(ajax_defs.faction_key, active_mission_data.id)
	else
		ajax_functions.output_debug_string("-> No active mission found for " .. other_faction_key)
	end
end

-- CharacterTraitsChanged
ajax_listeners.CharacterTraitsChanged = {}

ajax_listeners.CharacterTraitsChanged.filter_callback = function(context, event_name)
	local character = context:character()
	return character ~= nil and not character:is_null_interface() and character:faction():name() == ajax_defs.faction_key and character:get_forename() ~= "" and ajax_defs.traits.characters[character:get_forename()] == true and context:level_changed()
end

ajax_listeners.CharacterTraitsChanged.callback = function(context, event_name)
	local trait_added = context:trait_added()
	local trait_removed = context:trait_removed()
	local trait_level_added = trait_added .. "_" .. (context:character():trait_level(trait_added) or "")

	ajax_functions.output_debug_string("CharacterTraitsChanged enter (" .. event_name .. "), trait_added: " .. trait_level_added .. ", trait_removed: " .. trait_removed .. ", level_changed = " .. tostring(context:level_changed()))

	if trait_added ~= "" then
		local renown_add = ajax_defs.traits.renown_per_trait[trait_added] or ajax_defs.traits.renown_per_trait[trait_level_added]
		if renown_add ~= nil and is_number(renown_add) then
			ajax_functions.output_debug_string("-> adding " .. renown_add .. " renown")
			cm:faction_add_pooled_resource(ajax_defs.faction_key, ajax_defs.pooled_resource_renown_key, ajax_defs.pooled_resource_factor, renown_add)
		end
	end
end


-- MissionEnded
ajax_listeners.MissionEnded = 
{
	event_name = {"MissionSucceeded", "MissionCancelled", "MissionFailed"}
}

ajax_listeners.MissionEnded.filter_callback = function(context, event_name)
	local mission = context:mission()
	ajax_functions.output_debug_string("MissionEnded filter enter for event (" .. event_name .. ")")
	return mission ~= nil and not mission:is_null_interface() and mission:mission_custom_id() ~= "" and context:faction():name() == ajax_defs.faction_key
end

ajax_listeners.MissionEnded.callback = function(context, event_name)
	ajax_functions.output_debug_string("MissionEnded enter for event(" .. event_name .. ")")

	local custom_id = context:mission():mission_custom_id()
	if custom_id ~= nil then
		ajax_functions.output_debug_string("-> custom_id: " .. custom_id)
		local index = string.find(custom_id, "#")
		if index ~= nil then
			local faction_name = string.sub(custom_id, index + 1)
			ajax_functions.output_debug_string("-> faction name: " .. faction_name)
			local active_mission_data = faction_name ~= "" and ajax_progress.active_missions and ajax_progress.active_missions[faction_name]
			if active_mission_data ~= nil and active_mission_data.id ~= nil and active_mission_data.id == custom_id then
				ajax_functions.output_debug_string("-> there is an active mission defined in ajax_progress, unregistering")
				ajax_functions.cancel_mission(active_mission_data)
				if ajax_progress.past_missions == nil then
					ajax_progress.past_missions = {}
				end
				table.insert(ajax_progress.past_missions,ajax_progress.active_missions[faction_name])
				ajax_progress.past_missions[#ajax_progress.past_missions].faction_key = faction_name
				ajax_progress.active_missions[faction_name] = nil
				ajax_functions.update_mission_effects()
			else
				ajax_functions.output_debug_string("-> there is no active mission defined in ajax_progress, or the used id is different")
			end
		end
	else
		ajax_functions.output_debug_string("-> no custom_id is defined")
	end
end

-- PooledResourceTransactionEvent
ajax_listeners.PooledResourceTransactionEvent = {}

ajax_listeners.PooledResourceTransactionEvent.filter_callback = function(context, event_name)
	return context:amount() ~= 0 and context:resource():key() == ajax_defs.pooled_resource_renown_key and context:faction():name() == ajax_defs.faction_key	
end

ajax_listeners.PooledResourceTransactionEvent.callback = function(context, event_name)
	ajax_functions.output_debug_string("PooledResourceTransactionEvent enter (" .. event_name .. ")")

	local faction = context:faction()

	local val = context:resource():value()
	local prev_val = val - context:amount()

	local prev_tier, prev_tier_data = ajax_functions.get_renown_tier_data_for_renown(prev_val)
	local tier, tier_data  = ajax_functions.get_renown_tier_data_for_renown(val)

	local bundle_index = 1
	if ajax_progress.with_trojans ~= nil and ajax_progress.with_trojans == true then bundle_index = 2 end

	local prev_bundle = (prev_tier_data.bundle and prev_tier_data.bundle[bundle_index]) or ""
	local bundle = (tier_data.bundle and tier_data.bundle[bundle_index]) or ""

	ajax_functions.output_debug_string("-> val: " .. val .. ", prev val: " .. prev_val .. ", bundle: " .. bundle .. ", prev_bundle: " .. prev_bundle)

	if prev_bundle ~= "" and prev_bundle ~= bundle and faction:has_effect_bundle(prev_bundle) then
		cm:remove_effect_bundle(prev_bundle, ajax_defs.faction_key)
	end

	if bundle ~= "" and not faction:has_effect_bundle(bundle) then
		-- TODO: for some reason -> turns (-1) goes as 0
		cm:apply_effect_bundle(bundle, ajax_defs.faction_key, -1)
	end

	-- notify player
	if tier ~= prev_tier then
		-- max tier
		if tier == #ajax_defs.renown_tiers - 1 then
			ajax_functions.show_message_event("renown_max_tier", tier)
		else
			ajax_functions.show_message_event("renown_new_tier", tier)
		end
	end

	--update renown bar
	local panel = core:get_ui_root():SequentialFind(ajax_defs.ui.panel)
	if panel and panel:Visible() then	
		local resource = context:resource()
		if resource ~= nil and not resource:is_null_interface() then
			local max_value = context:resource():maximum_value()
			ajax_functions.update_renown_bar(panel, val, max_value)
			ajax_functions.update_factions_list(panel, val < max_value)
			ajax_functions.update_celebration_button()
		end
	end
end


-- FactionDestroyed
ajax_listeners.FactionDestroyed = 
{
	event_name = {"FactionDestroysOtherFaction", "FactionJoinsConfederation", }
}

ajax_listeners.FactionDestroyed.callback = function(context, event_name)
	ajax_functions.output_debug_string("FactionDestroyed enter (" .. event_name .. ")")
	local destroyed_faction_name

	if event_name == "FactionDestroysOtherFaction" and context:faction():name() ~= ajax_defs.faction_key then
		destroyed_faction_name = context:other_faction():name()
	elseif event_name == "FactionJoinsConfederation" and context:confederation():name() ~= ajax_defs.faction_key then
		destroyed_faction_name = context:faction():name()
	else return	end

	local active_mission_data = ajax_progress.active_missions and ajax_progress.active_missions[destroyed_faction_name] 
	if active_mission_data ~= nil and active_mission_data.id ~= nil and not active_mission_data.ignore_faction_destroyed then
		ajax_functions.output_debug_string("-> Canceling mission for " .. destroyed_faction_name .. " with custom_id: " .. active_mission_data.id)
		cm:cancel_mission_by_id(ajax_defs.faction_key, active_mission_data.id)
	else
		ajax_functions.output_debug_string("-> No active mission found for " .. destroyed_faction_name)
	end
end


-- FactionTurnEnd
ajax_listeners.FactionTurnEnd = {}

ajax_listeners.FactionTurnEnd.filter_callback = function(context, event_name)
	return context:faction():name() == ajax_defs.faction_key and context:faction():is_human()
end

ajax_listeners.FactionTurnEnd.callback = function(context, event_name)
	ajax_functions.output_debug_string("FactionTurnEnd enter (" .. event_name .. ")")

	-- celebration processing
	if ajax_progress.celebration ~= nil then
		if ajax_progress.celebration.next_turn <= cm:turn_number() + 1 then
			ajax_functions.output_debug_string("-> Celebration has ended")

			ajax_functions.celebration_participants_process(function (faction1, faction2)
				ajax_functions.output_debug_string("-> enabling war between " .. faction1 .. " and " .. faction2)
				cm:force_diplomacy("faction:" .. faction1, "faction:" .. faction2, "war", true, true, false)
			end)

			ajax_progress.celebration = nil
		end
	end

	-- dilemma processing
	local dilemma_filter = false

	if ajax_progress.dilemma == nil then
		ajax_progress.dilemma = {}
	end

	if ajax_progress.dilemma.next_turn == nil then
		if not ajax_progress.dilemma_has_spawned_once then 
			ajax_progress.dilemma.next_turn = cm:turn_number() + ajax_defs.dilemma.cooldown
		else
			ajax_progress.dilemma.next_turn = cm:turn_number() + cm:model():random_int(ajax_defs.dilemma.next_dilemma_turns_min, ajax_defs.dilemma.next_dilemma_turns_max)
		end
		ajax_functions.output_debug_string("-> setting initial dilemma spawn for turn: " .. ajax_progress.dilemma.next_turn)
	end
--[[
	-- Dilemma will trigger on a fixed amount of turns by design now.


	if context:faction():num_allies() > 0 then
		dilemma_filter = true
		ajax_functions.output_debug_string("-> There are allies for faction: " .. ajax_defs.faction_key .. "; " .. context:faction():num_allies())
	else
		--check for active missions
		for faction_name, active_mission_data in pairs(ajax_progress.active_missions or {}) do
			-- there is an active mission for faction
			if active_mission_data.id ~= nil then 
				ajax_functions.output_debug_string("-> There is an active mission for faction: " .. faction_name .. " with id: " .. active_mission_data.id .. ", we skip the dilemma")
				dilemma_filter = true 
				break
			end
		end
	end

	if dilemma_filter == true then
		ajax_progress.dilemma.next_turn = cm:turn_number() + 1 + ajax_defs.dilemma.cooldown
		ajax_functions.output_debug_string("-> there are active missions or allies, rescheduling dilemma for turn: " .. ajax_progress.dilemma.next_turn)
	else
		ajax_functions.output_debug_string("-> there are no active missions or allies, dilemma is still scheduled for turn: " .. ajax_progress.dilemma.next_turn)
	end 
	]]
	local ajaxs_renown = context:faction():pooled_resource(ajax_defs.pooled_resource_renown_key)
	if cm:turn_number() >= ajax_progress.dilemma.next_turn - 1 and ajaxs_renown:value() < ajaxs_renown:maximum_value() then
		-- no active missions -> spawn dilemma
		ajax_functions.output_debug_string("-> trying to spawn dilemma with id: " .. ajax_defs.dilemma.id)
	
		-- locate proper enemy
		local faction = context:faction()
		local region_list = faction:region_list()

		--	
		local processed_factions = {
		}

		processed_factions[faction:name()] = true


		local enemy_faction = nil
		local friend_factions = {}
		local enemy_faction_standing = 0

		local regions = region_list:num_items()
	
		for i = 0, regions - 1 do
			local region = region_list:item_at(i)
			local adjacent_region_list = region:adjacent_region_list()
			local adjacent_regions = adjacent_region_list:num_items()

			for j = 0, adjacent_regions - 1 do
				-- get faction of current adjacent region
				local adjacent_faction = adjacent_region_list:item_at(j):owning_faction()
				local adjacent_faction_name = adjacent_faction:name()

				local active_mission_data = ajax_progress.active_missions and ajax_progress.active_missions[adjacent_faction_name]

				if not adjacent_faction:is_null_interface() and not adjacent_faction:is_rebel() and processed_factions[adjacent_faction_name] == nil and not active_mission_data then
					-- register
					processed_factions[adjacent_faction_name] = true
					local agamemnon_faction = cm:get_faction("troy_main_dan_mycenae")
					-- TODO for Ancient Empires: This check should definitely be rewritten for Pharaoh (since there will be more factions that can vassalize other than Agamemnon).
					if adjacent_faction:is_subject_of(agamemnon_faction) and faction:allied_with(agamemnon_faction) then 
						ajax_functions.output_debug_string("-> set as friend daan faction: " .. adjacent_faction_name .. ", because it's a vassal of our friend Agamemnon")
						table.insert(friend_factions, adjacent_faction)
					elseif faction:allied_with(adjacent_faction) then 
						ajax_functions.output_debug_string("-> set as friend faction: " .. adjacent_faction_name .. ", because it's an ally of ours")
						table.insert(friend_factions, adjacent_faction)
					else
						local standing = faction:diplomatic_standing_with(adjacent_faction_name)

						ajax_functions.output_debug_string("-> processing faction: " .. adjacent_faction_name .. ", relation: " .. standing)

						if not adjacent_faction:has_faction_leader() or not adjacent_faction:faction_leader():has_military_force() then
							ajax_functions.output_debug_string("->  faction has has either no faction leader or has no military force, skipping as enemy")
						elseif enemy_faction == nil or standing < enemy_faction_standing then
							ajax_functions.output_debug_string("-> set as current enemy faction")

							local prev_enemy_faction = enemy_faction

							enemy_faction_standing = standing
							enemy_faction = adjacent_faction

							adjacent_faction = prev_enemy_faction
							adjacent_faction_name = prev_enemy_faction and prev_enemy_faction:name()
						end

						-- friend
						if adjacent_faction ~= nil and adjacent_faction:culture() == "troy_main_clt_danaans" and standing >= ajax_defs.dilemma.friend_diplomatic_standing_threshold then
							ajax_functions.output_debug_string("-> set as friend daan faction: " .. adjacent_faction_name .. ", relation: " .. standing)
							table.insert(friend_factions, adjacent_faction)
						end
					end
				end
			end
		end

		if enemy_faction ~= nil and #friend_factions > 0 then
			local friend_faction = friend_factions[faction:model():random_int(1, #friend_factions)]

			-- register
			ajax_progress.dilemma = {
				enemy_faction = enemy_faction:name(),
				friend_faction = friend_faction:name(),
			}
			local payload = "payload{" .. "text_display{ lookup " .. ajax_defs.dilemma.destroy_faction_payload .. "#faction:" .. enemy_faction:name() ..";}" .. "effect_bundle{ bundle_key ".. ajax_defs.dilemma.strong_diplomacy_payload  .. "; turns 10; }}"
			local payload2 = "payload{" .. "text_display{ lookup " .. ajax_defs.dilemma.defeat_leader_payload .. "#faction:" .. enemy_faction:name() ..";}" .. "effect_bundle{ bundle_key ".. ajax_defs.dilemma.strong_diplomacy_payload .. "; turns 5; }}"
			local payload3 = "payload{ text_display { lookup dummy_troy_epic_mission_all_give_say_nothing ;}}"  -- this is done so the 3rd empty choice of the dilemma is displayed via the cm:trigger_custom_dilemma()
			ajax_functions.output_debug_string("-> friend faction: " .. friend_faction:name() .. ", enemy faction: " .. enemy_faction:name())
			--cm:trigger_dilemma_with_targets_raw(faction:command_queue_index(), ajax_defs.dilemma.id, enemy_faction:command_queue_index(), friend_faction:command_queue_index())
			cm:trigger_custom_dilemma(faction:name(), ajax_defs.dilemma.id, payload, payload2, payload3)
		else
			ajax_functions.output_debug_string("-> there are no either friend or enemy faction")
		end
	end

	--debug_spawn_ajax_renown_dilemma()

end


-- DilemmaChoiceMadeEvent
ajax_listeners.DilemmaChoiceMadeEvent = {}

ajax_listeners.DilemmaChoiceMadeEvent.filter_callback = function(context, event_name)
	return (context:dilemma() == ajax_defs.dilemma.id and ajax_progress.dilemma ~= nil) or (context:dilemma() == ajax_defs.story_dilemma_id)  or (context:dilemma() == ajax_defs.switch_to_trojan_camp_dilemma_id)
end

ajax_listeners.DilemmaChoiceMadeEvent.callback = function(context, event_name)

	local choice = context:choice()

	-- trigger the switch sides dilemma from the story dilemma choice
	if context:dilemma() == ajax_defs.story_dilemma_id then

		if choice == 1 then
			cm:trigger_dilemma(ajax_defs.faction_key, ajax_defs.switch_to_trojan_camp_dilemma_id)
		end

	-- switch to the trojan camp	
	elseif context:dilemma() == ajax_defs.switch_to_trojan_camp_dilemma_id then
		ajax_functions.output_debug_string("DilemmaChoiceMadeEvent enter (" .. event_name .. ") with choice ".. choice .. ", for switch to the trojan camp: " .. ajax_defs.switch_to_trojan_camp_dilemma_id)

		if choice == 0 then
			ajax_progress.with_trojans = true

			-- cancel all active missions with trojans
			for faction_name, active_mission_data in pairs(ajax_progress.active_missions or {}) do
				-- there is an active mission for that faction
				if active_mission_data.id ~= nil then
					local faction = cm:model():world():faction_by_key(faction_name)
					if faction ~= nil and not faction:is_null_interface() and faction:culture() == "troy_main_clt_trojans" then 
						ajax_functions.output_debug_string("-> canceling trojan mission: " .. active_mission_data.id .. " for faction: " .. faction_name)
						cm:cancel_mission_by_id(ajax_defs.faction_key, active_mission_data.id)
					end
				end
			end

			-- 2. switch renown_tiers bundles with trojan ones
			local faction = ajax_functions.faction()
			if faction ~= nil then
				local renown_res = faction:pooled_resource(ajax_defs.pooled_resource_renown_key)
				if renown_res ~= nil and not renown_res:is_null_interface() then
					local renown_amount = renown_res:value()
					local tier, tier_data  = ajax_functions.get_renown_tier_data_for_renown(renown_amount)

					if tier_data ~= nil and tier_data.bundle ~= nil then
						ajax_functions.output_debug_string("-> replacing bundle: " .. tier_data.bundle[1] .. " with: " .. tier_data.bundle[2])

						if faction:has_effect_bundle(tier_data.bundle[1]) then
							cm:remove_effect_bundle(tier_data.bundle[1], ajax_defs.faction_key)
						end

						-- TODO: for some reason -> turns (-1) goes as 0
						cm:apply_effect_bundle(tier_data.bundle[2], ajax_defs.faction_key, -1)
					end
				end
			end
		end	
	-- Renown dilemma
	else
		local enemy_faction = ajax_progress.dilemma.enemy_faction
		local friend_faction = ajax_progress.dilemma.friend_faction

		local friend = cm:model():world():faction_by_key(friend_faction)
		local enemy = cm:model():world():faction_by_key(enemy_faction)

		--
		ajax_functions.output_debug_string("-> clearing dilemma progress")
		ajax_progress.dilemma = nil
		if not ajax_progress.dilemma_has_spawned_once then
			ajax_progress.dilemma_has_spawned_once = true
		end

		if enemy == nil or enemy:is_null_interface() then
			ajax_functions.output_debug_string("DilemmaChoiceMadeEvent enter (" .. event_name .. ") with choice ".. choice .. ", cannot get enemy faction: " .. enemy_faction .. ", terminating")
			return
		end

		if not enemy:has_faction_leader() then
			ajax_functions.output_debug_string("DilemmaChoiceMadeEvent enter (" .. event_name .. ") with choice ".. choice .. ", enemy faction: " .. enemy_faction .. " has no faction leader, terminating")
			return
		end

		local enemy_faction_leader = enemy:faction_leader()
		if not enemy_faction_leader:has_military_force() then
			ajax_functions.output_debug_string("DilemmaChoiceMadeEvent enter (" .. event_name .. ") with choice ".. choice .. ", enemy faction: " .. enemy_faction .. " has faction leader, but has no military force, terminating")
			return
		end

		ajax_functions.output_debug_string("DilemmaChoiceMadeEvent enter (" .. event_name .. ") with choice ".. choice .. ", enemy: " .. enemy_faction .. ", friend: " .. friend_faction)

		if choice == 0 then
			ajax_functions.spawn_mission_against_character(enemy_faction_leader, -2)
			local enemy_faction = enemy_faction_leader:faction()
			if not cm:get_faction(ajax_challenge_cofiguration.faction_name):at_war_with(enemy_faction) then 
				cm:force_declare_war(ajax_challenge_cofiguration.faction_name, enemy_faction:name(), false, false, true)
			end
		elseif choice == 1 then
			ajax_functions.spawn_mission_against_character(enemy_faction_leader, -3)
		elseif choice == 2 then
			ajax_functions.output_debug_string("-> do nothing, terminating")
		end
	end
end



-- UI

-- PanelOpenedCampaign
ajax_listeners.PanelOpenedCampaign = {}

ajax_listeners.PanelOpenedCampaign.filter_callback = function(context, event_name)
	return context.string == ajax_defs.ui.panel
end

ajax_listeners.PanelOpenedCampaign.callback = function(context, event_name)
	ajax_functions.output_debug_string("PanelOpenedCampaign enter (" .. event_name .. ")")

	local faction = ajax_functions.faction()
	if faction == nil then return end

	local panel = UIComponent(context.component)

	if panel == nil or not panel:Visible() then
		ajax_functions.output_debug_string("-> panel " .. ajax_defs.ui.panel .. " not found or is not visible")
		return
	end

	-- missions_list
	local missions_list_holder = panel:SequentialFind(ajax_defs.ui.missions_list)
	local missions_list

	if missions_list_holder ~= nil then
		missions_list = missions_list_holder:SequentialFind("list_box")
	end

	if missions_list == nil then
		ajax_functions.output_debug_string("-> missing missions list: " .. ajax_defs.ui.missions_list)
		return
	end

	local mission_template = missions_list:SequentialFind(ajax_defs.ui.mission_template)
	if mission_template == nil then
		ajax_functions.output_debug_string("-> missing mission template: " .. ajax_defs.ui.mission_template)
		return
	end

	local missions_empty_entry_visibility = true

	-- create entries for missions
	for faction_name, active_mission_data in pairs(ajax_progress.active_missions or {}) do

		-- there is an active mission for that faction
		if active_mission_data.id ~= nil then
			ajax_functions.output_debug_string("-> adding active mission for faction: " .. faction_name .. ", id: " .. active_mission_data.id)

			local mission_entry = UIComponent(missions_list:CreateFromComponent(mission_template:Address(), "mission_" .. active_mission_data.id))
			mission_entry:InterfaceFunction("init_from_custom_id", active_mission_data.id)
			mission_entry:InterfaceFunction("init_header")

			missions_empty_entry_visibility = false
		end
	end

	mission_template:SetVisible(false)

	if missions_list_holder ~= nil then
		missions_list_holder:SetVisible(not missions_empty_entry_visibility)
	end

	local missions_empty_entry = panel:SequentialFind(ajax_defs.ui.mission_no_missions)
	if missions_empty_entry ~= nil then
		missions_empty_entry:SetVisible(missions_empty_entry_visibility)
	else
		ajax_functions.output_debug_string("-> missing empty missions component: " .. ajax_defs.ui.mission_no_missions)
	end

	-- ancillaries
	local ancillaries_list = panel:SequentialFind(ajax_defs.ui.ancillaries_list)
	if ancillaries_list == nil then
		ajax_functions.output_debug_string("-> missing ancillaries list: " .. ajax_defs.ui.ancillaries_list)
		return
	end

	local ancillary_template = ancillaries_list:SequentialFind(ajax_defs.ui.ancillary_template)
	if ancillary_template == nil then
		ajax_functions.output_debug_string("-> missing ancillary template: " .. ajax_defs.ui.ancillary_template)
		return
	end

	--
	ajax_functions.process_listeners(true, true)

	local celebration_is_on_cooldown = ajax_functions.celebration_is_on_cooldown()

	--
	if ajax_ui_progress.ancillaries == nil then 
		ajax_ui_progress.ancillaries = {}
	end

	ajax_ui_progress.selected_ancillary = nil

	--
	for i = 1, ajax_defs.celebration_max_factions do
		local ancillary_component = UIComponent(ancillaries_list:CreateFromComponent(ancillary_template:Address(), "ancillary:" .. i))

		if #ajax_ui_progress.ancillaries < i then
			table.insert(ajax_ui_progress.ancillaries, {})
		end


		local ancillary_callback_component = uicomponent_find_down(ancillary_component, 
			function (component) 
				-- check for callback
				if component:CallbackId() == "CharacterAncillaryCategory" then return component end
			end)


		ajax_ui_progress.ancillaries[i].component = ancillary_component
		ajax_ui_progress.ancillaries[i].callback_component = ancillary_callback_component
		ajax_ui_progress.ancillaries[i].button_component = ancillary_component:SequentialFind(ajax_defs.ui.ancillary_button)

		if ajax_ui_progress.ancillaries[i].button_component == nil then
			ajax_ui_progress.ancillaries[i].button_component = ancillary_component
			ajax_functions.output_debug_string("-> unable to find button component with id: " .. ajax_defs.ui.ancillary_button)
		end

		-- prefill
		if ajax_ui_progress.ancillaries[i].ancillary ~= nil and ancillary_callback_component ~= nil then
			ancillary_callback_component:InterfaceFunction("show", ajax_ui_progress.ancillaries[i].ancillary, ajax_ui_progress.ancillaries[i].character)
		else
			ancillary_callback_component:InterfaceFunction("show", nil, nil)
		end

		-- TODO: enable / disable UI components
		--[[
		if celebration_is_on_cooldown then
			ancillary_callback_component:SetState("inactive")
			ancillary_callback_component:SetInteractive(false)
		else
			ancillary_callback_component:SetState("active")
			ancillary_callback_component:SetInteractive(true)
		end
		]]


		ajax_functions.output_debug_string("-> adding ancillary slot with id: " .. ancillary_component:Id() .. ", callback_id: " .. ( (ancillary_callback_component and ancillary_callback_component:Id() ) or "" ))
	end

	ancillary_template:SetVisible(false)

	--
	ajax_functions.update_ancillary_buttons()


	-- factions list
	if ajax_ui_progress.factions == nil then 
		ajax_ui_progress.factions = {}
	end

	-- renown

	-- clear renown bar cache
	ajax_ui_progress.renown_bar_width = nil

	local show_only_neighbour_factions = true
	local renown_res = faction:pooled_resource(ajax_defs.pooled_resource_renown_key)

	if renown_res ~= nil and not renown_res:is_null_interface() then
		local renown_amount = renown_res:value()
		local renown_max_value = renown_res:maximum_value()

		-- tiers
		local renown_bar_tier_template = panel:SequentialFind(ajax_defs.ui.renown_bar_tooltip, ajax_defs.ui.renown_bar_tier)
		local renown_bar_tier_parent = panel:SequentialFind(ajax_defs.ui.renown_bar_tooltip, ajax_defs.ui.renown_bar_tier_parent)

		ajax_functions.create_renown_bar_tiers(renown_bar_tier_parent, renown_bar_tier_template, renown_max_value, true)
		if renown_bar_tier_template ~= nil then
			renown_bar_tier_template:SetVisible(false)
		end

		ajax_functions.update_renown_bar(panel, renown_amount, renown_max_value)
		show_only_neighbour_factions = renown_amount < renown_max_value
	end

	--
	ajax_functions.update_factions_list(panel, show_only_neighbour_factions)
	ajax_functions.update_celebration_button()

	-- TODO remove
	--cm:add_ancillary_to_faction("troy_main_dan_salamis", "troy_adi_anc_armour_salamian_sandals", false)
	--cm:add_ancillary_to_faction("troy_main_dan_salamis", "troy_adi_anc_armour_salamian_helmet", false)
	--cm:add_ancillary_to_faction("troy_main_dan_salamis", "troy_adi_anc_armour_salamian_girdle", false)
end


-- PanelOpenedCampaign
ajax_listeners.PanelClosedCampaign = {	
	panel_event = true,
}

ajax_listeners.PanelClosedCampaign.filter_callback = function(context, event_name)
	return context.string == ajax_defs.ui.panel
end

ajax_listeners.PanelClosedCampaign.callback = function(context, event_name)
	ajax_functions.output_debug_string("PanelClosedCampaign enter (" .. event_name .. ")")
	ajax_functions.process_listeners(false, true)
end

-- ComponentLClickUp
ajax_listeners.ComponentLClickUp = {
	panel_event = true,
}

ajax_listeners.ComponentLClickUp.filter_callback = function(context, event_name)
	local uic = UIComponent(context.component)
	local id = uic:Id()

	return (ajax_defs.ui.ancillary_button == id or ajax_defs.ui.celebration_button == id) and uicomponent_descended_from(uic, ajax_defs.ui.panel)
end

ajax_listeners.ComponentLClickUp.callback = function(context, event_name)
	ajax_functions.output_debug_string("ComponentLClickUp enter (" .. event_name .. ")")

	local uic = UIComponent(context.component)
	local id =  uic:Id()

	-- ancillary button
	if id == ajax_defs.ui.ancillary_button then
		local ancillary_id = uicomponent_find_up(uic, 
			function (component) 
				-- check for ancillary
				local arr = component:Id():split(":")
				if #arr == 2 and arr[1] == "ancillary" then 
					return tonumber(arr[2])
				end
			end
		)

		if ancillary_id ~= nil then
			ajax_functions.output_debug_string("-> clicked ancillary: " .. ancillary_id)

			-- deselect prev
			if ajax_ui_progress.selected_ancillary ~= nil then
				ajax_ui_progress.ancillaries[ajax_ui_progress.selected_ancillary].button_component:SetState("active")
			end

			-- new selection
			if ajax_ui_progress.selected_ancillary ~= ancillary_id then
				ajax_ui_progress.selected_ancillary = ancillary_id

				--select new
				ajax_ui_progress.ancillaries[ancillary_id].button_component:SetState("selected")
			else
				ajax_ui_progress.selected_ancillary = nil
			end

			local ancillary_selector = core:get_ui_root():SequentialFind(ajax_defs.ui.panel, ajax_defs.ui.ancillary_selector)
			if ancillary_selector ~= nil then
				if ajax_ui_progress.selected_ancillary ~= nil then
					ancillary_selector:InterfaceFunction("show", ajax_functions.celebration_get_exclude_ancillaries_table(ancillary_id))	
				else
					ancillary_selector:InterfaceFunction("hide")
				end
			end
		end

	-- celebration button
	elseif id == ajax_defs.ui.celebration_button then
		ajax_functions.output_debug_string("-> clicked celebration button")

		 create_confirmation_box(ajax_defs.ui.celebration_confirmation_dlg_id, ajax_defs.ui.celebration_confirmation_dlg_description,
			function()
				local faction = ajax_functions.faction()
				if faction == nil then return end

				if ajax_ui_progress.factions ~= nil and #ajax_ui_progress.factions > 0 then
					local param = ""
					local faction_index = 0

					for index, ancillary_data in ipairs(ajax_ui_progress.ancillaries or {}) do
						if ancillary_data.ancillary ~= nil then
							faction_index = faction_index + 1

							if faction_index <= #ajax_ui_progress.factions then
								local faction_param
								if ancillary_data.character ~= nil then
									faction_param = ajax_ui_progress.factions[faction_index] .. "," .. ancillary_data.ancillary .. "," .. ancillary_data.character
								else
									faction_param = ajax_ui_progress.factions[faction_index] .. "," .. ancillary_data.ancillary .. "," .. "0"
								end

								param = param .. "," .. faction_param
							else
								ajax_functions.output_debug_string("-> selected ancillaries number do not mach selected factions number")
								param = nil
								break
							end
						end
					end

					if param ~= nil then
						ajax_functions.output_debug_string("-> triggering script event AjaxRenownCelebration with param: " .. param)
						CampaignUI.TriggerCampaignScriptEvent(faction:command_queue_index(),
							"AjaxRenownCelebration" .. param)
					else
						ajax_functions.output_debug_string("-> skipped triggering celebrations, because there are no selected ancillaries / factions")
					end
				else
					ajax_functions.output_debug_string("-> no selected factions")
				end
			end)
	end
end

-- UITriggerScriptEvent (Panel)
ajax_listeners.UITriggerScriptEventPanel = 
{
	event_name = {"UITriggerScriptEvent"},
	panel_event = true,
}

ajax_listeners.UITriggerScriptEventPanel.filter_callback = function(context, event_name)
	local args = context:trigger():split(",")
	return #args >= 1 and (args[1] == "CharacterAncillarySelector" or args[1] == "AjaxRenownFactionList" or args[1] == "CharacterAncillarySelectorClose")
end

ajax_listeners.UITriggerScriptEventPanel.callback = function(context, event_name)
	local args = context:trigger():split(",")

	if args[1] == "CharacterAncillarySelectorClose" then
		ajax_functions.output_debug_string("UITriggerScriptEvent enter (" .. event_name .. ") with argument CharacterAncillarySelectorClose")

		-- deselect
		if ajax_ui_progress.selected_ancillary then
			ajax_ui_progress.ancillaries[ajax_ui_progress.selected_ancillary].button_component:SetState("active")
			ajax_ui_progress.selected_ancillary = nil
		end
	elseif args[1] == "CharacterAncillarySelector" then
		local ancillary = nil 
		local character_cqi = nil
		if #args > 1 then 
			ancillary = args[2]
		end
	
		if #args > 2 then 
			character_cqi = tonumber(args[3])
		end

		ajax_functions.output_debug_string("UITriggerScriptEvent enter (" .. event_name .. ") with ancillary: " .. (ancillary or "") .. " for character (cqi): " .. (character_cqi or ""))

		if ajax_ui_progress.selected_ancillary ~= nil and ajax_ui_progress.selected_ancillary <= #ajax_ui_progress.ancillaries then

			ajax_ui_progress.ancillaries[ajax_ui_progress.selected_ancillary].ancillary = ancillary
			ajax_ui_progress.ancillaries[ajax_ui_progress.selected_ancillary].character = character_cqi


			local component = ajax_ui_progress.ancillaries[ajax_ui_progress.selected_ancillary].callback_component
			if component ~= nil then
				component:InterfaceFunction("show", ancillary, character_cqi)
			else
				ajax_functions.output_debug_string("-> there is no component found for " .. ajax_ui_progress.selected_ancillary)
			end

			-- deselect
			ajax_ui_progress.ancillaries[ajax_ui_progress.selected_ancillary].button_component:SetState("active")
			ajax_ui_progress.selected_ancillary = nil

			--
			ajax_functions.update_celebration_button()
			ajax_functions.update_ancillary_buttons()
		else
			ajax_functions.output_debug_string("-> there is no selected ancillary or index is bigger than ajax_ui_progress.ancillaries: " .. (ajax_ui_progress.selected_ancillary or "nil") .. ", " .. #ajax_ui_progress.ancillaries)
		end
	elseif args[1] == "AjaxRenownFactionList" then
		local factions_output = ""
		ajax_ui_progress.factions = {}
		for i = 2, #args do
			table.insert(ajax_ui_progress.factions, args[i])

			if i == 2 then
				factions_output = factions_output .. args[i]
			else
				factions_output = factions_output .. ", " .. args[i]
			end
		end

		ajax_functions.update_celebration_button()

		ajax_functions.output_debug_string("UITriggerScriptEvent enter (" .. event_name .. ") with factions selected : " .. factions_output)
	end
end


-- UITriggerScriptEvent (Model)
ajax_listeners.UITriggerScriptEventModel = {
	event_name = {"UITriggerScriptEvent"},
	--panel_event = true,
}

ajax_listeners.UITriggerScriptEventModel.filter_callback = function(context, event_name)
	local args = context:trigger():split(",")
	return #args >= 1 and args[1] == "AjaxRenownCelebration"
end

ajax_listeners.UITriggerScriptEventModel.callback = function(context, event_name)
	local args = context:trigger():split(",")

	if args[1] == "AjaxRenownCelebration" then
		ajax_functions.output_debug_string("UITriggerScriptEvent enter (" .. event_name .. ") with celebration for " .. ((#args - 1) / 3) .. " faction / ancillary pairs")

		if ajax_progress.celebration == nil then
			ajax_progress.celebration = {}
		end

		--clear
		ajax_progress.celebration.factions = {}

		-- insert our faction
		table.insert(ajax_progress.celebration.factions, ajax_defs.faction_key)

		-- pooled resources
		local celebration_gift = {}

		local faction = ajax_functions.faction()
		if faction ~= nil and faction:has_pooled_resource(ajax_defs.pooled_resource_renown_key) then 
			local value = faction:pooled_resource(ajax_defs.pooled_resource_renown_key):value()
			local tier, tier_data  = ajax_functions.get_renown_tier_data_for_renown(value)
			celebration_gift = (tier_data and tier_data.celebration_gift) or {}
		end

		local param_index = 1
		local payload = "payload{"

		while #args >= param_index + 3  do
			local faction = args[param_index + 1]
			local ancillary = args[param_index + 2]
			local character = tonumber(args[param_index + 3])
			local resource = cm:get_random_desired_resource_from_faction(faction, false)

			ajax_functions.output_debug_string("-> processing faction: " .. faction .. ", ancillary: " .. ancillary .. ", character: " .. character .. ", resource: " .. (resource or ""))

			--
			if character == 0 then
				cm:force_remove_ancillary_from_faction(ajax_defs.faction_key, ancillary, false)
			else
				cm:force_remove_ancillary("character_cqi:"..character, ancillary, false)
			end

			cm:add_ancillary_to_faction(faction, ancillary, true)
			table.insert(ajax_progress.celebration.factions, faction)

			param_index = param_index + 3
			
			-- ancillary gone
			payload = payload .. "text_display{" .. "lookup " .. ajax_defs.ui.celebration_text_display_key .. "#ancillary:" .. ancillary .. "#faction:" .. faction ..  ":icon:name" .. ";}"
			
			-- added after the loop

			-- force piece
			-- cm:force_make_peace(ajax_defs.faction_key, faction)
			-- cm:force_diplomacy("faction:" .. ajax_defs.faction_key, "faction:" .. faction, "war", false, false, false)

			-- diplomatic relation
			-- payload = payload .. "diplomacy_change { target_faction " .. faction .. ";amount " .. ajax_defs.celebration_diplomacy_change_relation_amount .. ";}"	
		
			-- resource
			if resource ~= nil and celebration_gift[resource] ~= nil then
				payload = payload .. "text_display{" .. "lookup " .. ajax_defs.ui.celebration_text_resource_display_key .. "#pooled_resource:" .. resource .. ":name#pooled_resource:".. resource ..":icon:".. celebration_gift[resource] .. "#faction:" .. faction .. ":icon:name" ..  ";}"

				-- make transaction
				cm:faction_add_pooled_resource(ajax_defs.faction_key, resource, ajax_defs.pooled_resource_factor, celebration_gift[resource])
			else
				ajax_functions.output_debug_string("-> unable to get resource: " .. (resource or ""))
			end

			-- cancel active missions against the factions if there are such missions.
			local active_mission_data = ajax_progress.active_missions and ajax_progress.active_missions[faction]
	 
			--cancel active mission
			if active_mission_data ~= nil and active_mission_data.id ~= nil then
				ajax_functions.output_debug_string("-> Canceling mission for " .. faction .. " with custom_id: " .. active_mission_data.id)
				cm:cancel_mission_by_id(ajax_defs.faction_key, active_mission_data.id)
			end
		end

		-- force piece between other factions
		ajax_functions.celebration_participants_process(function (faction1, faction2)
			ajax_functions.output_debug_string("-> fixing relationship between third party celebration factions: " .. faction1 .. " and " .. faction2)
			-- force piece
			cm:force_make_peace(faction1, faction2, true)
			cm:force_diplomacy("faction:" .. faction1, "faction:" .. faction2, "war", false, false, false)
			if faction1 == ajax_defs.faction_key then 
				-- diplomatic relation between ajax and the other faction
				payload = payload .. "diplomacy_change { target_faction " ..  faction2 .. ";amount " .. ajax_defs.celebration_diplomacy_change_relation_amount .. ";}"
			else
				-- diplomatic relation
				payload = payload .. "diplomacy_change { target_faction " .. faction1 .. ";target_secondary_faction " .. faction2 .. ";amount " .. ajax_defs.celebration_diplomacy_change_relation_amount .. ";}"
			end
		end)
			
		payload = payload .. "text_display{lookup " .. ajax_defs.ui.celebration_text_peace_display_key .. ";}"
		
		payload = payload .. "}"

		--ajax_functions.output_debug_string("-> payload: " .. payload)

		--
		cm:trigger_custom_incident(ajax_defs.faction_key, ajax_defs.celebration_incident, true, payload)

		-- set cooldown
		ajax_progress.celebration.start_turn = cm:turn_number()
		ajax_progress.celebration.next_turn = ajax_progress.celebration.start_turn + ajax_defs.celebration_cooldown

		-- clear UI
		local panel = core:get_ui_root():SequentialFind(ajax_defs.ui.panel)
		if panel ~= nil and panel:Visible() then
			-- clear ancillary
			for index, ancillary_data in ipairs(ajax_ui_progress.ancillaries or {}) do
				ancillary_data.ancillary = nil
				ancillary_data.character = nil

				if ancillary_data.callback_component ~= nil then
					ancillary_data.callback_component:InterfaceFunction("show", nil, nil)
				end
			end

			-- clear factions
			ajax_ui_progress.factions = {}
			panel:InterfaceFunction("set_data", 
			{
				selected_factions = ajax_ui_progress.factions, 
			})

			panel:InterfaceFunction("hold_celebration", 
			{
				factions = ajax_progress.celebration.factions, 
			})

			ajax_functions.update_celebration_button()

			-- close panel
			panel:InterfaceFunction("close_panel")
		end
	end
end

ajax_listeners.ScriptEventAjaxDefeatedChampion = {}

ajax_listeners.ScriptEventAjaxDefeatedChampion.callback = function(context, event_name)
	--local param_index = 1
	local defeated_champ_faction_name = context.string
	if ajax_defs.champion_defeated_renown_reward[defeated_champ_faction_name] then 
		cm:faction_add_pooled_resource(ajax_defs.faction_key, ajax_defs.pooled_resource_renown_key, ajax_defs.pooled_resource_factor, ajax_defs.champion_defeated_renown_reward[defeated_champ_faction_name])
	else 
		script_error("ajax_listeners.ScriptEventAjaxDefeatedChampion was triggered by defeating faction "..defeated_champ_faction_name.. " but that faction doesn't have a renown reward setup in the ajax_defs.champion_defeated_renown_reward table")
		return
	end
end

ajax_listeners.AncillaryStatusChanged = {
	event_name = { "CharacterAncillaryLost", "CharacterAncillaryGained",}
}

ajax_listeners.AncillaryStatusChanged.filter_callback = function(context, event_name)
	return context:character():faction():name() == ajax_defs.faction_key and is_table(ajax_ui_progress.ancillaries)
end

ajax_listeners.AncillaryStatusChanged.callback = function(context, event_name)
	local character_cqi = context:character():command_queue_index()
	local ancillary_key = context:ancillary()
	
	for index, ancillary_data in ipairs(ajax_ui_progress.ancillaries) do
		if ancillary_data.ancillary and ancillary_data.character
			and ancillary_data.ancillary == ancillary_key 
			and ancillary_data.character == character_cqi 
		then 
			table.remove(ajax_ui_progress.ancillaries, index) -- delete the entry. Opening the panel anew will fix the list size.
			return -- if we find an ancillary with a character, we've done our job of cleaning the list.
		end
	end
	-- if we didn't find the matching ancillary with char data, then we clear one of the matching ancillaries without char data.
	for index, ancillary_data in ipairs(ajax_ui_progress.ancillaries) do
		if ancillary_data.ancillary and ancillary_data.ancillary == ancillary_key and not ancillary_data.character then 
			table.remove(ajax_ui_progress.ancillaries, index)
			return -- we remove only the first occurance of said ancillary to ensure no exploits with ancillaries in transition.
		end
	end
end


function debug_spawn_ajax_renown_dilemma()
	-- I copy pasted this code to serve as a shortcut for our love QA friends
	local faction = cm:get_faction(cm:get_local_faction_name(true))
	local region_list = faction:region_list()

	--	
	local processed_factions = {
	}

	processed_factions[faction:name()] = true


	local enemy_faction = nil
	local friend_factions = {}
	local enemy_faction_standing = 0

	local regions = region_list:num_items()

	for i = 0, regions - 1 do
		local region = region_list:item_at(i)
		local adjacent_region_list = region:adjacent_region_list()
		local adjacent_regions = adjacent_region_list:num_items()

		for j = 0, adjacent_regions - 1 do
			-- get faction of current adjacent region
			local adjacent_faction = adjacent_region_list:item_at(j):owning_faction()
			local adjacent_faction_name = adjacent_faction:name()

			local active_mission_data = ajax_progress.active_missions and ajax_progress.active_missions[adjacent_faction_name]

			if not adjacent_faction:is_null_interface() and not adjacent_faction:is_rebel() and processed_factions[adjacent_faction_name] == nil and not active_mission_data then
				-- register
				processed_factions[adjacent_faction_name] = true
				local standing = faction:diplomatic_standing_with(adjacent_faction_name)

				ajax_functions.output_debug_string("-> processing faction: " .. adjacent_faction_name .. ", relation: " .. standing)

				if not adjacent_faction:has_faction_leader() or not adjacent_faction:faction_leader():has_military_force() then
					ajax_functions.output_debug_string("->  faction has has either no faction leader or has no military force, skipping as enemy")
				elseif enemy_faction == nil or standing < enemy_faction_standing then
					ajax_functions.output_debug_string("-> set as current enemy faction")

					local prev_enemy_faction = enemy_faction

					enemy_faction_standing = standing
					enemy_faction = adjacent_faction

					adjacent_faction = prev_enemy_faction
					adjacent_faction_name = prev_enemy_faction and prev_enemy_faction:name()
				end

				-- friend
				if adjacent_faction ~= nil and adjacent_faction:culture() == "troy_main_clt_danaans" and standing >= ajax_defs.dilemma.friend_diplomatic_standing_threshold then
					ajax_functions.output_debug_string("-> set as friend daan faction: " .. adjacent_faction_name .. ", relation: " .. standing)
					table.insert(friend_factions, adjacent_faction)
				end
			end
		end
	end

	if enemy_faction ~= nil and #friend_factions > 0 then
		local friend_faction = friend_factions[faction:model():random_int(1, #friend_factions)]

		-- register
		ajax_progress.dilemma = {
			enemy_faction = enemy_faction:name(),
			friend_faction = friend_faction:name(),
		}
		local payload = "payload{" .. "text_display{ lookup " .. ajax_defs.dilemma.destroy_faction_payload .. "#faction:" .. enemy_faction:name() ..";}" .. "effect_bundle{ bundle_key ".. ajax_defs.dilemma.strong_diplomacy_payload  .. "; turns 10; }}"
		local payload2 = "payload{" .. "text_display{ lookup " .. ajax_defs.dilemma.defeat_leader_payload .. "#faction:" .. enemy_faction:name() ..";}" .. "effect_bundle{ bundle_key ".. ajax_defs.dilemma.strong_diplomacy_payload .. "; turns 5; }}"
		local payload3 = "payload{ text_display { lookup dummy_troy_epic_mission_all_give_say_nothing ;}}"  -- this is done so the 3rd empty choice of the dilemma is displayed via the cm:trigger_custom_dilemma()
		ajax_functions.output_debug_string("-> friend faction: " .. friend_faction:name() .. ", enemy faction: " .. enemy_faction:name())
		--cm:trigger_dilemma_with_targets_raw(faction:command_queue_index(), ajax_defs.dilemma.id, enemy_faction:command_queue_index(), friend_faction:command_queue_index())
		cm:trigger_custom_dilemma(faction:name(), ajax_defs.dilemma.id, payload, payload2, payload3)
	else
		ajax_functions.output_debug_string("-> there are no either friend or enemy faction")
	end

end

---------------------------- INIT
function troy_adi_ajax_renown_init()
	out(prefix .. "_init")
	ajax_functions.process_listeners(true, false)
end

-- persist
cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("TROY_ADI_AJAX_RENOWN_PROGRESS", ajax_progress, context)
	end
)

cm:add_loading_game_callback(
	function(context)
		ajax_progress = cm:load_named_value("TROY_ADI_AJAX_RENOWN_PROGRESS", ajax_progress, context)
		troy_adi_ajax_renown_export_data.progress = ajax_progress
	end
)

cm:add_pre_first_tick_callback(
	function()	
		ajax_functions.output_debug_string("Reissuing active missions")
		for faction_name, active_mission_data in pairs(ajax_progress.active_missions or {}) do
			if ajax_functions.issue_mission(faction_name, active_mission_data, false) == false then
				-- TODO: for now we are leaving this mission in order to work previous save games (e.g. needed for polishing the UI)
				--active_mission_data.id = nil
			end
		end

		for _, past_mission_data in ipairs(ajax_progress.past_missions or {}) do
			if ajax_functions.issue_mission(past_mission_data.faction_key, past_mission_data, false) == false then
				-- TODO: for now we are leaving this mission in order to work previous save games (e.g. needed for polishing the UI)
				--active_mission_data.id = nil
			end
		end
	end
)

core:add_listener (
	prefix .. "_FirstTickAfterWorldCreated",
	"FirstTickAfterWorldCreated",
	true,
	function(context)
		ajax_functions.output_debug_string("FirstTickAfterWorldCreated enter")
		if ajax_progress.celebration ~= nil and ajax_progress.celebration.next_turn > cm:turn_number() then
			ajax_functions.celebration_participants_process(function (faction1, faction2)
				ajax_functions.output_debug_string("-> disabling war between " .. faction1 .. " and " .. faction2)
				cm:force_diplomacy("faction:" .. faction1, "faction:" .. faction2, "war", false, false, false)
			end)
		end
	end,
	false
)

-- exposed data
troy_adi_ajax_renown_export_data.defs = ajax_defs
troy_adi_ajax_renown_export_data.listeners = ajax_listeners
troy_adi_ajax_renown_export_data.functions = ajax_functions
troy_adi_ajax_renown_export_data.progress = ajax_progress
troy_adi_ajax_renown_export_data.ui_progress = ajax_ui_progress