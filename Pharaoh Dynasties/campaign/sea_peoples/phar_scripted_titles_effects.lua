out("Loading phar_scripted_titles_effects.lua")
sea_scripted_titles_config = {
	titles_effect_config = {
		phar_sea_title_2 = {
			effect_bundle_key = "phar_sea_title_2_effect_bundle",
			ammo_to_all_units = {"effect", 5}, -- percent
			ammo_for_every_camp = {
				effect = "phar_main_ammo_mod_unit_sets_all_units",
				scope = "force_to_force_own",
				value = 2}, -- percent
		},

		phar_sea_title_7 = {
			post_battle_options = {
				["occupation_decision_raze_without_occupy"] = true,
				["occupation_decision_raze"] = true,
				["occupation_decision_raze_and_exterminate"] = true,
			},
			refund_movement = 0.3,
		},

		phar_sea_title_17 = {
			effect_bundle_key = "phar_sea_title_17_effect_bundle",
			ambush_chance = {"effect", 5}, -- percent
			ambush_chance_per_camp = {
				effect = "phar_main_ambush_chance_of_success_attack_bonus_basic",
				scope = "force_to_force_own",
				value = 2
			}, -- percent
		},
	},
}

sea_scripted_titles = {
	config = sea_scripted_titles_config,
	titles = {
		phar_sea_title_2 = {
			on_apply = function(character)
				sea_scripted_titles.apply_nomad_camp_title_effects(character, "nomad_sherden", "phar_sea_title_2", "ammo_for_every_camp")
			end,

			on_remove = function(character)
				if not character:has_military_force() then
					return
				end
				cm:remove_effect_bundle_from_force(sea_scripted_titles_config.titles_effect_config.phar_sea_title_2.effect_bundle_key, character:military_force():command_queue_index())
			end,

			events = {
				[1] = {
					event = "BuildingCompleted",
					listener = function(context)
						sea_scripted_titles.apply_nomad_camp_title_effects_wrapper(context:building():faction(), "nomad_sherden", "phar_sea_title_2", "ammo_for_every_camp", context)
					end,
				},
			},
		},

		phar_sea_title_7 = {
			events = {
				[1] = {
					event = "CharacterPerformsSettlementOccupationDecision",
					listener = function(context)
						if not context:garrison_residence():is_settlement() then --or not context:garrison_residence():settlement_interface():is_port() --leaving this as comment potentially for future dlcs
							return
						end

						local character = context:character()

						if not character:has_ancillary("phar_sea_title_7") then
							return
						end

						if sea_scripted_titles_config.titles_effect_config.phar_sea_title_7.post_battle_options[context:occupation_decision_option()] then
							local character_string = cm:char_lookup_str(character:command_queue_index())
							cm:replenish_action_points(character_string, sea_scripted_titles_config.titles_effect_config.phar_sea_title_7.refund_movement)
							cm:reset_maximum_action_points_this_turn(character_string)
						end
					end,
				},
			},
		},

		phar_sea_title_15 = {
			events = {
					[1] = {
					event = "ForceAdoptsStance",
					listener = function(context)
						-- Code support to allow for encampment stance to cause attrition damage in region.
						-- Also to provide a buff for units while in a ruined region
					end,
				},
			},
		},

		-- peleset
		phar_sea_title_17 = {
			on_apply = function(character)
				sea_scripted_titles.apply_nomad_camp_title_effects(character, "nomad_peleset", "phar_sea_title_17", "ambush_chance_per_camp")
			end,

			on_remove = function(character)
				if not character:has_military_force() then
					return
				end
				cm:remove_effect_bundle_from_force(sea_scripted_titles_config.titles_effect_config.phar_sea_title_17.effect_bundle_key, character:military_force():command_queue_index())
			end,

			events = {
				[1] = {
					event = "BuildingCompleted",
					listener = function(context)
						sea_scripted_titles.apply_nomad_camp_title_effects_wrapper(context:building():faction(), "nomad_peleset", "phar_sea_title_17", "ambush_chance_per_camp")
					end,
				},
			},
		},
		phar_sea_title_21 = {
			events = {
				[1] = {
					event = "ForceAdoptsStance",
					listener = function(context)
						--Code support for melee attack and defence effects that are applied to a stance?
					end,
				},
			},
		},
	},
}

function sea_scripted_titles.count_nomad_camps(faction, nomad_camp_find_string)
	if not faction then
		script_error("no faction provided for sea_scripted_titles.count_nomad_camps")
	end

	local number_of_camps_owned = 0

	for i = 0, cm:model():world():region_manager():region_list():num_items() - 1 do
		local region = cm:model():world():region_manager():region_list():item_at(i)
		for j = 0, region:slot_list():num_items() - 1 do
			local slot = region:slot_list():item_at(j)
			if slot:faction():name() == faction:name() then
				local building = slot:building()
				if not building:is_null_interface() then
					if string.find(building:chain(), nomad_camp_find_string) then
						number_of_camps_owned = number_of_camps_owned + 1
					end
				end
			end
		end
	end
	return number_of_camps_owned
end

function sea_scripted_titles.apply_nomad_camp_title_effects_wrapper(faction, nomad_camp_find_string, title_key, config_value_key)
	local char_list = faction:character_list()

	for i = 0, char_list:num_items() - 1 do
		local curr_character = char_list:item_at(i)
		if curr_character:has_ancillary(title_key) then
			sea_scripted_titles.apply_nomad_camp_title_effects(curr_character, nomad_camp_find_string, title_key, config_value_key)
		end
	end
end

function sea_scripted_titles.apply_nomad_camp_title_effects(character, nomad_camp_find_string, title_key, config_value_key)
	if not character then
		script_error("No character provided for nomad camps")
	end

	local number_of_camps_owned = sea_scripted_titles.count_nomad_camps(character:faction(), nomad_camp_find_string)

	local custom_effect_bundle = cm:create_new_custom_effect_bundle(sea_scripted_titles_config.titles_effect_config[title_key].effect_bundle_key)
	if not custom_effect_bundle:is_null_interface() then
		local effect = sea_scripted_titles_config.titles_effect_config[title_key][config_value_key]["effect"]
		local scope = sea_scripted_titles_config.titles_effect_config[title_key][config_value_key]["scope"]
		local value = sea_scripted_titles_config.titles_effect_config[title_key][config_value_key]["value"]
		custom_effect_bundle:add_effect(effect, scope, value * number_of_camps_owned)
		cm:apply_custom_effect_bundle_to_force(custom_effect_bundle, character:military_force())
	end
end

function sea_scripted_titles.build_title_event_key(character, ancillary_key, idx, event)
	return "phar_sea_scripted_title_" .. character:command_queue_index() .. "_" .. ancillary_key .. "_" .. tostring(idx) .. "_" .. event
end

function sea_scripted_titles.add_listeners_for_title(ancillary_key, character)
	if sea_scripted_titles.titles[ancillary_key] then
		local title_data = sea_scripted_titles.titles[ancillary_key]
		if title_data.on_apply and is_function(title_data.on_apply) then
			title_data.on_apply(character)
		end
		if #title_data.events > 0 then
			for idx, event_data in ipairs(title_data.events) do
				if not is_string(event_data.event) or not is_function(event_data.listener) then
					script_error("ERROR: sea_scripted_titles.add_listeners_for_title called but provided ".. event_name .." as event name is not a string or its callback is not a function.")
					return
				end

				core:add_listener(
					sea_scripted_titles.build_title_event_key(character, ancillary_key, tostring(idx), event_data.event),
					event_data.event,
					true,
					event_data.listener,
					true,
					true
				)
			end
		end
	end
end

function sea_scripted_titles.remove_listeners_for_title(ancillary_key, character)
	if sea_scripted_titles.titles[ancillary_key] then

		local title_data = sea_scripted_titles.titles[ancillary_key]
		if title_data.on_remove and is_function(title_data.on_remove) then
			title_data.on_remove(character)
		end

		if #title_data.events > 0 then
			for idx, event_data in ipairs(title_data.events) do
				if not is_string(event_data.event)  then
					script_error("ERROR: sea_scripted_titles.add_listeners_for_title called but provided ".. event_name .." as event name is not a string")
					return
				end

				core:remove_listener(sea_scripted_titles.build_title_event_key(character, ancillary_key, tostring(idx), event_data.event))
			end
		end
	end
end

function sea_scripted_titles.add_listeners()
	--add listeners for equip/unequip
	out("Adding sea_scripted_titles listeners")
	core:add_listener(
		"scripted_titles_character_ancillary_equipped",
		"CharacterAncillaryEquipped",
		function(context)
			return not context:character():is_null_interface() and table_find(sea_peoples_playable_faction_keys, context:character():faction():name())
		end,
		function(context)
			sea_scripted_titles.add_listeners_for_title(context:ancillary(), context:character())
		end,
		true
	)

	core:add_listener(
		"scripted_titles_character_ancillary_unequipped",
		"CharacterAncillaryLost",
		function(context)
			return not context:character():is_null_interface() and table_find(sea_peoples_playable_faction_keys, context:character():faction():name())
		end,
		function(context)
			sea_scripted_titles.remove_listeners_for_title(context:ancillary(), context:character())
		end,
		true
	)
end

core:add_listener(
	"scripted_titles_first_tick_fixup",
	"FirstTickAfterWorldCreated",
	true,
	function(context)
		for _, faction_key in ipairs(sea_peoples_playable_faction_keys) do
			local faction = cm:get_faction(faction_key)
			if faction and not faction:is_null_interface() then
				local char_list = faction:character_list()
				for i = 0, char_list:num_items() - 1 do
					local character = char_list:item_at(i);
					local character_ancillaries = character:ancillaries()
					for j = 0, character_ancillaries:num_items() - 1 do 
						local ancillary_interface = character_ancillaries:item_at(j)
						sea_scripted_titles.add_listeners_for_title(ancillary_interface:ancillary_key(), character)
					end
				end
			end
		end
	end,
	false
)