out("Loading troy_paris_helen.lua")

local DEBUG_ENABLED = false
local paris_debug_str = "troy_paris_helen: "

local function print_debug(str, force_print) 
	if DEBUG_ENABLED or force_print then
		out(paris_debug_str .. str)
	end
end

paris_helen_new_state_favour_drop_amount = -20
paris_helen_move_action_prayer_favour_amount = 10
paris_helen_hostile_stance_key = "CAI_STRATEGIC_STANCE_BITTER_ENEMIES" -- Used by Paris' AI towards Helen's captor when the city containing Helen is taken directly from Paris
paris_helen_hostile_stance_turns = 10
local paris_faction_key = "troy_main_trj_paris"
local hector_faction_key = "troy_main_trj_hector"
local menelaus_faction_key = "troy_main_dan_sparta"

paris_helen_panel = "fm_helen"

paris_char = {
	forename = nil,
	fm_cqi = nil,
}

paris_helen = {
	current_location = "troy_main_troas_larisa",
	state = "happy",
	state_change_timer = 0
}

helen_state_effect_bundles = {
	happy = {
		key = "effect_bundle_fm_paris_fm_helen_happy",
		target = "region",
	},
	unhappy = {
		key = "effect_bundle_fm_paris_fm_helen_unhappy",
		target = "region",
	},
	lonely = {
		key = "effect_bundle_fm_paris_fm_helen_lonely",
		target = "faction",
	},
	captured = {
		key = "effect_bundle_fm_paris_fm_helen_terrified",
		target = "faction",
	},
	rescued = {
		key = "effect_bundle_fm_paris_fm_helen_rescued",
		target = "faction",
	},
	confederated = {
		key = "effect_bundle_fm_paris_fm_helen_happy",
		target = "region",
	},
}

helen_state_string_keys = {
	happy = "troy_main_fm_helen_state_happy",
	unhappy = "troy_main_fm_helen_state_unhappy",
	lonely = "troy_main_fm_helen_state_lonely",
	captured = "troy_main_fm_helen_state_captured",
	rescued = "troy_main_fm_helen_state_rescued",
	confederated = ""
}

paris_helen_state_transitions = {
	happy = {
		to_state = "unhappy",
		turns = 4
	},
	unhappy = {
		to_state = "lonely",
		turns = 4
	},
	-- rescued by paris
	rescued = {
		to_state = "happy",
		turns = 5
	}
}

-- Needed threshold points for the different trait levels of Paris from Dave
-- Instead of accumulating points, we will remove the previous trait and give needed points
paris_state_traits = {
	captured = {
		key = "troy_main_paris_fm2_trait_negative",
		points = 5
	},
	lonely = {
		key = "troy_main_paris_fm2_trait_negative",
		points = 3
	},
	unhappy = {
		key = "troy_main_paris_fm2_trait_negative",
		points = 1
	},
	happy = {
		key = "troy_main_paris_fm2_trait_positive",
		points = 1
	},
	rescued = { -- heroic
		key = "troy_main_paris_fm2_trait_positive",
		points = 3
	},
	confederated = nil
}

paris_state_trait_list = {
	"troy_main_paris_fm2_trait_negative",
	"troy_main_paris_fm2_trait_positive",
}

helen_actions_building_mod = {
	feast = {
		building_level_list = {
			"troy_main_special_paris_helen_1",
			"troy_main_special_paris_helen_2",
			"troy_main_special_paris_helen_3",
		},
		cost = {
			{
				key = "troy_food",
				val = 0
			}
		}
	}
}

-- If a cost modification exists for the given region and action, it is returned. 
-- Otherwise, the default cost is returned
function get_helen_action_cost_for_region(region, action)
	if not region or not helen_actions_building_mod[action] then
		return helen_actions_cfg[action].cost
	end

	local cost = helen_actions_cfg[action].cost
	for idx, key in ipairs(helen_actions_building_mod[action].building_level_list) do
		if region:building_exists(key) then
			cost = helen_actions_building_mod[action].cost
			break
		end
	end
	
	return cost
end

-- Table for configuration of Helen's actions
helen_actions_cfg = {
	cooldown = 6,
	effect_duration = 6, -- turns
	cost_factor = "troy_resource_factor_faction",
	feast = {
		button_path = {paris_helen_panel, "panel", "right_bar", "resource_buttons_list", "button_holder_feast", "button_organize_feast"},
		bundle_key = "effect_bundle_fm_paris_organize_feast_bundle",
		active_string_key = "troy_main_fm_helen_location_feast",
		cost = 
		{
			{
				key = "troy_food",
				val = 300
			},		  
		},
		buildings = {
			"troy_main_trj_settlement_bronze_1",
			"troy_main_trj_settlement_bronze_2",
			"troy_main_trj_settlement_bronze_3",
			"troy_main_trj_settlement_bronze_sea_1",
			"troy_main_trj_settlement_bronze_sea_2",
			"troy_main_trj_settlement_bronze_sea_3",
			"troy_main_trj_settlement_farm_1",
			"troy_main_trj_settlement_farm_2",
			"troy_main_trj_settlement_farm_3",
			"troy_main_trj_settlement_farm_sea_1",
			"troy_main_trj_settlement_farm_sea_2",
			"troy_main_trj_settlement_farm_sea_3",
			"troy_main_trj_settlement_forest_1",
			"troy_main_trj_settlement_forest_2",
			"troy_main_trj_settlement_forest_3",
			"troy_main_trj_settlement_forest_sea_1",
			"troy_main_trj_settlement_forest_sea_2",
			"troy_main_trj_settlement_forest_sea_3",
			"troy_main_trj_settlement_gold_1",
			"troy_main_trj_settlement_gold_2",
			"troy_main_trj_settlement_gold_3",
			"troy_main_trj_settlement_gold_sea_1",
			"troy_main_trj_settlement_gold_sea_2",
			"troy_main_trj_settlement_gold_sea_3",
			"troy_main_trj_settlement_major_1",
			"troy_main_trj_settlement_major_2",
			"troy_main_trj_settlement_major_3",
			"troy_main_trj_settlement_major_4",
			"troy_main_trj_settlement_major_5",
			"troy_main_trj_settlement_major_sea_1",
			"troy_main_trj_settlement_major_sea_2",
			"troy_main_trj_settlement_major_sea_3",
			"troy_main_trj_settlement_major_sea_4",
			"troy_main_trj_settlement_major_sea_5",
			"troy_main_trj_settlement_stone_1",
			"troy_main_trj_settlement_stone_2",
			"troy_main_trj_settlement_stone_3",
			"troy_main_trj_settlement_stone_sea_1",
			"troy_main_trj_settlement_stone_sea_2",
			"troy_main_trj_settlement_stone_sea_3",
			"troy_main_special_settlement_troy_troy_sea_",
			"troy_main_special_settlement_mycenae_1",
			"troy_main_special_settlement_mycenae_2",  
			"troy_main_special_settlement_mycenae_3",
			"troy_main_special_settlement_mycenae_4",
			"troy_main_special_settlement_mycenae_5"
			}
	},
	games = {
		button_path = {paris_helen_panel, "panel", "right_bar", "resource_buttons_list", "button_holder_games", "button_hold_games"},
		bundle_key = "effect_bundle_fm_paris_hold_games_bundle",
		active_string_key = "troy_main_fm_helen_location_games",
		cost = 
		{
			{
				key = "troy_food",
				val = 200
			},			
			{
				key = "troy_bronze",
				val = 25
			}
		},
		buildings = {
			"troy_main_chariot_3",
			"troy_main_chariot_4",
			"troy_main_garrison_2",
			"troy_main_garrison_4",
			"troy_main_military_1",
			"troy_main_military_3",
			"troy_main_military_5",
			"troy_main_military_elite_3",
			"troy_main_military_elite_5",
			"troy_main_military_myth_centaurs_1",
			"troy_main_military_myth_centaurs_3",
			"troy_main_military_myth_centaurs_5",
			"troy_main_military_myth_corybantes_3",
			"troy_main_military_myth_cyclops_5",
			"troy_main_military_myth_giants_1",
			"troy_main_military_myth_giants_3",
			"troy_main_military_myth_giants_5",
			"troy_main_military_myth_harpies_1",
			"troy_main_military_myth_harpies_4",
			"troy_main_military_myth_minotaur_3",
			"troy_main_military_myth_minotaur_5",
			"troy_main_military_myth_sirens_3",
			"troy_main_military_myth_spartoi_5",
			"troy_main_paris_military_3",
			"troy_main_paris_military_5",
			"troy_main_bowyer_3",
			"troy_main_missile_2",
			"troy_main_missile_3",
			"troy_main_missile_4",
			"troy_main_watchtower_1",
			"troy_main_watchtower_2",
			"troy_main_watchtower_3",
			"troy_main_paris_sarpedon_missile_1",
			"troy_main_paris_sarpedon_missile_3",
			"troy_main_paris_sarpedon_missile_5"
		}
	},
	prayer = {
		button_path = {paris_helen_panel, "panel", "right_bar", "resource_buttons_list", "button_holder_prayer", "button_gather_prayer"},
		bundle_key = "effect_bundle_fm_paris_convene_prayer_bundle",
		active_string_key = "troy_main_fm_helen_location_prayer",
		cost = 
		{
			{
				key = "troy_food",
				val = 500
			}
		},
		buildings = {
			"troy_main_religion_aphrodite_2",
			"troy_main_religion_aphrodite_3",
			"troy_main_religion_aphrodite_4",
			"troy_main_religion_apollo_2",
			"troy_main_religion_apollo_3",
			"troy_main_religion_apollo_4",
			"troy_main_religion_ares_2",
			"troy_main_religion_ares_3",
			"troy_main_religion_ares_4",
			"troy_main_religion_athens_2",
			"troy_main_religion_athens_3",
			"troy_main_religion_athens_4",
			"troy_main_religion_hera_2",
			"troy_main_religion_hera_3",
			"troy_main_religion_hera_4",
			"troy_main_religion_poseidon_2",
			"troy_main_religion_poseidon_3",
			"troy_main_religion_poseidon_4",
			"troy_main_religion_zeus_2",
			"troy_main_religion_zeus_3",
			"troy_main_religion_zeus_4",
			"troy_main_religion_artemis_2",
			"troy_main_religion_artemis_3",
			"troy_main_religion_artemis_4",
			"troy_hep_religion_hephaestus_2",
			"troy_hep_religion_hephaestus_3",
			"troy_hep_religion_hephaestus_4"
		}
	}
}

paris_helen_event_feed_messages = {
	feast = {
		title = "event_feed_strings_text_troy_main_fm_helen_message_event_title",
		primary_detail = "event_feed_strings_text_troy_main_fm_helen_message_event_invitation_feast_primary_details",
		sec_detail = "", -- region name
		event_pic = 1075,
	},

	games = {
		title = "event_feed_strings_text_troy_main_fm_helen_message_event_title",
		primary_detail = "event_feed_strings_text_troy_main_fm_helen_message_event_invitation_games_primary_details",
		sec_detail = "", -- region name
		event_pic = 1076,
	},

	prayer = {
		title = "event_feed_strings_text_troy_main_fm_helen_message_event_title",
		primary_detail = "event_feed_strings_text_troy_main_fm_helen_message_event_invitation_prayer_primary_details",
		sec_detail = "", -- region name
		event_pic = 1077,
	},

	helen_captured = {
		title = "event_feed_strings_text_troy_main_fm_helen_message_event_title",
		primary_detail = "event_feed_strings_text_troy_main_fm_helen_message_event_helen_captured_primary_details",
		sec_detail = "", -- faction name
		event_pic = 1078,
	},

	helen_rescued_by_paris = {
		title = "event_feed_strings_text_troy_main_fm_helen_message_event_title",
		primary_detail = "event_feed_strings_text_troy_main_fm_helen_message_event_helen_rescued_by_paris_primary_details",
		sec_detail = "event_feed_strings_text_troy_event_feed_string_all_null", -- handled in db (this param is not used),
		event_pic = 1079,
	},

	helen_rescued_not_by_paris = {
		title = "event_feed_strings_text_troy_main_fm_helen_message_event_title",
		primary_detail = "event_feed_strings_text_troy_main_fm_helen_message_event_helen_rescued_not_by_paris_primary_details",
		sec_detail = "event_feed_strings_text_troy_event_feed_string_all_null", -- handled in db (this param is not used),
		event_pic = 1080,
	},

	helen_rescued_by_hector = {
		title = "event_feed_strings_text_troy_main_fm_helen_message_event_title",
		primary_detail = "event_feed_strings_text_troy_main_fm_helen_message_event_helen_rescued_by_hector_primary_details",
		sec_detail = "event_feed_strings_text_troy_event_feed_string_all_null", -- handled in db (this param is not used),
		event_pic = 1085,
	},
	
	helen_captured_by_human_player = {
		title = "event_feed_strings_text_troy_main_fm_helen_message_event_helen_captured_primary_details",
		primary_detail = "event_feed_strings_text_troy_main_fm_helen_message_event_helen_captured_by_player_primary_details",
		sec_detail = "",
		event_pic = 1096,
	},

	helen_lost_by_human_player = {
		title = "event_feed_strings_text_troy_main_fm_helen_message_event_helen_captured_primary_details",
		primary_detail = "event_feed_strings_text_troy_main_fm_helen_message_event_helen_lost_by_player_not_paris_primary_details",
		sec_detail = "",
		event_pic = 1097,
	}
}

paris_helen_dilemmas = {
	ransom = {
		timer_treshold = 8, -- If Helen is captured for <timer_treshold> turns, the dilemma will be triggered
		key = "troy_main_paris_fm_helen_ransom",
		choice_pay = 0,
		choice_ignore = 1
	},
	menelaus_captured_helen = {
		key = "troy_main_menelaus_fm_helen_returns",
		choice_send_helen = 0,
		choice_ignore = 1
	}
}

-- Variable to store the current cooldown for Moving Helen to another settlement
helen_movement_cooldown = 0

helen_actions_total_resources_spent = {
	troy_food = 0,
	troy_bronze = 0,
	troy_gold = 0,
	troy_stones = 0,
	troy_wood = 0
}

-- This flag is neeeded for the state change description for troy_main_fm_helen_change_rescued_not_by_paris
-- This flag must always be set to false on ParisHelen_ChangeState
is_helen_rescued_not_by_paris = false

function ParisHelen_UpdateCityInfoBar()
	print_debug("ParisHelen_UpdateCityInfoBar()")
	if cm:get_region(paris_helen.current_location) and cm:get_region(paris_helen.current_location):owning_faction():name() ~= paris_faction_key then
		cm:set_custom_settlement_info_icon(paris_helen.current_location, "icon_Helen", "", "city_info_bar_helen_not_paris")
	else
		cm:set_custom_settlement_info_icon(paris_helen.current_location, "icon_Helen", "", "city_info_bar_helen_"..paris_helen.state)
	end
	CampaignUI.UpdateSettlementEffectIcons()
end

function ParisHelen_StartGameSetup()
	print_debug("ParisHelen_StartGameSetup()")
	ParisHelen_AddListeners()

	if ParisHelen_IsHelenAlive() then
		ParisHelen_UpdateCityInfoBar()

		local paris_faction = cm:model():world():faction_by_key(paris_faction_key)
		if paris_faction:is_null_interface() then
			return
		end
		cm:cai_add_region_hint(paris_faction, paris_helen.current_location)
	end
end

-- Move Helen to another region, performing action feast, games or prayer
function ParisHelen_MoveHelen(region, action, for_cai)
	print_debug("ParisHelen_MoveHelen(to " .. region:name() .. ", " .. action .. ")")

	if not for_cai then
		local cost = get_helen_action_cost_for_region(region, action)
		for idx, res in ipairs(cost) do
			cm:faction_add_pooled_resource(paris_faction_key, res.key, "troy_resource_factor_character", (res.val * -1))

			if helen_actions_total_resources_spent[res.key] then
				helen_actions_total_resources_spent[res.key] = helen_actions_total_resources_spent[res.key] + res.val
			end
		end
	end

	helen_movement_cooldown = helen_actions_cfg.cooldown

	local paris_faction = cm:model():world():faction_by_key(paris_faction_key)

	cm:set_custom_settlement_info_icon_visibility(paris_helen.current_location, "icon_Helen", false)

	local old_region = cm:get_region(paris_helen.current_location)
	if old_region then
		if not has_region_taunt_effect(old_region) or not old_region:settlement():faction():is_human() then
			cm:cai_remove_region_hint(paris_faction, paris_helen.current_location)
		end
	end

	ParisHelen_UpdateHelenLocationBundle(false, region:name())
	paris_helen.current_location = region:name()

	cm:apply_effect_bundle_to_region(helen_actions_cfg[action].bundle_key, region:name(), helen_actions_cfg.effect_duration)
	cm:cai_add_region_hint(paris_faction, paris_helen.current_location)
	
	--[[if action == "prayer" then
		local gods = cm:model():world():god_manager():gods()
		for i=0,gods:num_items()-1 do
			local curr_god = gods:item_at(i):resource_key()
			 if paris_faction:has_pooled_resource(curr_god) then			
				apply_transaction_conflict_and_spawn_event(paris_faction,curr_god,gods_factors.faction,paris_helen_move_action_prayer_favour_amount)
			end
		end
	end]]

	ParisHelen_UpdateCityInfoBar()

	local ui_context = find_uicomponent(core:get_ui_root(), paris_helen_panel)
	if ui_context then
		local state_effect_bundles = {}
		for k, v in pairs(helen_state_effect_bundles) do
			table.insert(state_effect_bundles, { state = k, effect_bundle_key = v.key, string_key = helen_state_string_keys[k]})
		end

		ui_context:InterfaceFunction("set_helen_data", {
			state_effect_bundles = state_effect_bundles,
			state = paris_helen.state, 
			current_location = paris_helen.current_location,
			movement_action_cooldown = helen_movement_cooldown,
			conf_movement_cooldown = helen_actions_cfg.cooldown,
			conf_effect_duration = helen_actions_cfg.effect_duration
		})

		ui_context:InterfaceFunction("clear_selected_region")
		ui_context:InterfaceFunction("refresh_panel")
	end

	cm:show_configurable_message_event(
		paris_faction_key, 
		paris_helen_event_feed_messages[action].title,
		paris_helen_event_feed_messages[action].primary_detail,
		"regions_onscreen_" .. region:name(),
		paris_helen_event_feed_messages[action].event_pic)

	core:trigger_event("OrganizeHelenAction", action, paris_faction, region)
end

function ParisHelen_TeleportHelen(to_region_key, new_state)
	cm:set_custom_settlement_info_icon_visibility(paris_helen.current_location, "icon_Helen", false)
	ParisHelen_UpdateHelenLocationBundle(false, to_region_key)
	paris_helen.current_location = to_region_key

	if new_state then
		ParisHelen_ChangeState(new_state)
	end

	ParisHelen_UpdateCityInfoBar()
end

-- Check if desired region has one of the requiered buildings
function ParisHelen_CanMoveHelenTo(region, action)
	print_debug("ParisHelen_CanMoveHelenTo(to " .. region:name() .. ", " .. action .. ")")

	for _, building in ipairs(helen_actions_cfg[action].buildings) do
		if region:building_exists(building) then
			return true
		end
	end

	return false
end

-- Returns a table of all regions in which the selected action can be performed
function ParisHelen_GetRegionsAvailableForAction(action)
	local region_keys = {}
	local paris_regions = cm:model():world():faction_by_key(paris_faction_key):region_list()

	for i = 0, paris_regions:num_items() - 1 do
		local region = paris_regions:item_at(i)
		if ParisHelen_CanMoveHelenTo(region, action) then 
			table.insert(region_keys, region:name()) 
		end
	end

	return region_keys
end

function ParisHelen_UpdateHelenLocationBundle(new_state, new_location)
	if not new_state then
		new_state = paris_helen.state
	end

	if not new_location then
		new_location = paris_helen.current_location
	end

	local old_state_target = helen_state_effect_bundles[paris_helen.state].target
	if old_state_target == "region" then
		cm:remove_effect_bundle_from_region(helen_state_effect_bundles[paris_helen.state].key, paris_helen.current_location)
	elseif old_state_target == "faction" then
		cm:remove_effect_bundle(helen_state_effect_bundles[paris_helen.state].key, paris_faction_key)
	end

	local new_state_target = helen_state_effect_bundles[new_state].target
	if new_state_target == "region" then
		cm:apply_effect_bundle_to_region(helen_state_effect_bundles[new_state].key, new_location, 0)
	elseif new_state_target == "faction" then
		cm:apply_effect_bundle(helen_state_effect_bundles[new_state].key, paris_faction_key, 0)
	end
end

-- Change the current state of both Helen and Paris
function ParisHelen_ChangeState(new_state)
	print_debug("ParisHelen_ChangeState(from " .. paris_helen.state .. " to " .. new_state .. ")")

	paris_helen.state_change_timer = 0

	-- once state is confederated, the mechanic ends
	if new_state == paris_helen.state or paris_helen.state == "confederated" then
		return
	end

	is_helen_rescued_not_by_paris = false 
	
	--[[if new_state == "lonely" or new_state == "captured" then
		local gods = cm:model():world():god_manager():gods()
		local paris_faction = cm:model():world():faction_by_key(paris_faction_key)
		for i=0,gods:num_items()-1 do
			local curr_god = gods:item_at(i):resource_key()
			 if paris_faction:has_pooled_resource(curr_god) then				
				apply_transaction_conflict_and_spawn_event(paris_faction,curr_god,gods_factors.faction,paris_helen_new_state_favour_drop_amount)
			end
		end
	elseif new_state == "rescued" then
		local gods = cm:model():world():god_manager():gods()
		local paris_faction = cm:model():world():faction_by_key(paris_faction_key)
		for i=0,gods:num_items()-1 do
			local curr_god = gods:item_at(i):resource_key()
			 if paris_faction:has_pooled_resource(curr_god) then				
				apply_transaction_conflict_and_spawn_event(paris_faction,curr_god,gods_factors.faction,(paris_helen_new_state_favour_drop_amount * -1))
			end
		end
	end]]

	ParisHelen_UpdateHelenLocationBundle(new_state, false)
	
	paris_helen.state = new_state

	ParisHelen_ApplyTrait()

	ParisHelen_UpdateCityInfoBar()
end

-- This function should be called as soon as the state is changed or if Paris is wounded, it will be called when he is recruited again
function ParisHelen_ApplyTrait()
	if not paris_char.fm_cqi then
		script_error("ParisHelen_ApplyTrait: paris_char.fm_cqi is nil!!!")
		return
	end

	local current_state = paris_helen.state
	local should_show_trait_msg = current_state ~= "confederated"
	local paris = cm:model():family_member_for_command_queue_index(paris_char.fm_cqi):character()

	if not paris:is_null_interface() then
		local paris_lookup = cm:char_lookup_str(paris)

		if not paris_lookup then
			return
		end

		for _, trait_key in ipairs(paris_state_trait_list) do
			cm:force_remove_trait(paris_lookup, trait_key, should_show_trait_msg)
		end

		if paris_state_traits[current_state] then
			cm:force_add_trait(paris_lookup, paris_state_traits[current_state].key, false, paris_state_traits[current_state].points - 1)
			cm:force_add_trait(paris_lookup, paris_state_traits[current_state].key, should_show_trait_msg, 1)
		end
	end
end

function ParisHelen_KillHelen()
	local paris_faction = cm:model():world():faction_by_key(paris_faction_key)

	local old_region = cm:get_region(paris_helen.current_location)
	if old_region then
		if not has_region_taunt_effect(old_region) or not old_region:settlement():faction():is_human() then
			cm:cai_remove_region_hint(paris_faction, paris_helen.current_location)
		end
	end

	if helen_state_effect_bundles[paris_helen.state].target == "region" then
		cm:remove_effect_bundle_from_region(helen_state_effect_bundles[paris_helen.state].key, paris_helen.current_location)
	elseif helen_state_effect_bundles[paris_helen.state].target == "faction" then
		cm:remove_effect_bundle(helen_state_effect_bundles[paris_helen.state].key, paris_faction_key)
	end

	paris_helen.state = "dead"
	cm:set_custom_settlement_info_icon_visibility(paris_helen.current_location, "icon_Helen", false)
	CampaignUI.UpdateSettlementEffectIcons()
end

function ParisHelen_IsHelenAlive()
	return paris_helen.state ~= "dead"
end

function ParisHelen_SetStateChangeInfoCallback(context)
	print_debug("ParisHelen_SetStateChangeInfo")

	if not paris_char.fm_cqi then
		script_error("ParisHelen_SetStateChangeInfoCallback: paris_char.fm_cqi is nil!!!")
		return
	end

	local state_change_info_key = nil;
	local turns = nil

	local paris = cm:model():family_member_for_command_queue_index(paris_char.fm_cqi):character()
	local is_paris_with_helen = (paris and paris:has_region() and paris:region():name() == paris_helen.current_location)

	if paris_helen.state == "captured" then
		state_change_info_key = "troy_main_fm_helen_change_captured"
	elseif paris_helen.state == "happy" then
		if is_paris_with_helen then
			state_change_info_key = "troy_main_fm_helen_change_happy_and_together"
		else
			state_change_info_key = "troy_main_fm_helen_change_happy_and_apart"
			turns = paris_helen_state_transitions["happy"].turns - paris_helen.state_change_timer
		end
	elseif (paris_helen.state == "unhappy" or paris_helen.state == "lonely") and is_paris_with_helen then
		state_change_info_key = "troy_main_fm_helen_change_not_happy_and_together"
	elseif paris_helen.state == "unhappy" then
		state_change_info_key = "troy_main_fm_helen_change_unhappy_and_apart"
		turns = paris_helen_state_transitions["unhappy"].turns - paris_helen.state_change_timer
	elseif paris_helen.state == "lonely" then
		if is_helen_rescued_not_by_paris then
			state_change_info_key = "troy_main_fm_helen_change_rescued_not_by_paris"
		else
			state_change_info_key = "troy_main_fm_helen_change_lonely_and_apart"
		end
	elseif paris_helen.state == "rescued" then
		state_change_info_key = "troy_main_fm_helen_change_rescued_by_paris"
		turns = paris_helen_state_transitions["rescued"].turns - paris_helen.state_change_timer
	end

	if turns ~= nil then
		context:InterfaceFunction("set_state_change_info", state_change_info_key, turns)
	else
		context:InterfaceFunction("set_state_change_info", state_change_info_key)
	end
end

function ParisHelen_OnHelenPanelOpened(context)
	print_debug("****************** ParisHelen_OnHelenPanelOpened")

	if not ParisHelen_IsHelenAlive() then
		script_error("Helen Dead FM panel NOT IMPLEMENTED")
		return
	end

	local ui_context = UIComponent(context.component)

	ui_context:InterfaceFunction("set_action_cost", get_helen_action_cost_for_region(nil, "feast"), helen_actions_cfg.cost_factor, "feast")
	ui_context:InterfaceFunction("set_action_cost", get_helen_action_cost_for_region(nil, "games"), helen_actions_cfg.cost_factor, "games")
	ui_context:InterfaceFunction("set_action_cost", get_helen_action_cost_for_region(nil, "prayer"), helen_actions_cfg.cost_factor, "prayer")

	ui_context:InterfaceFunction("set_available_regions_for_action", ParisHelen_GetRegionsAvailableForAction("feast"), "feast")
	ui_context:InterfaceFunction("set_available_regions_for_action", ParisHelen_GetRegionsAvailableForAction("games"), "games")
	ui_context:InterfaceFunction("set_available_regions_for_action", ParisHelen_GetRegionsAvailableForAction("prayer"), "prayer")


	ui_context:InterfaceFunction("set_action_bundle_key", helen_actions_cfg["feast"].bundle_key, helen_actions_cfg["feast"].active_string_key, "feast")
	ui_context:InterfaceFunction("set_action_bundle_key", helen_actions_cfg["games"].bundle_key, helen_actions_cfg["games"].active_string_key, "games")
	ui_context:InterfaceFunction("set_action_bundle_key", helen_actions_cfg["prayer"].bundle_key, helen_actions_cfg["prayer"].active_string_key, "prayer")

	local state_effect_bundles = {}
	for k, v in pairs(helen_state_effect_bundles) do
		table.insert(state_effect_bundles, { state = k, effect_bundle_key = v.key, string_key = helen_state_string_keys[k]})
	end

	ui_context:InterfaceFunction("set_helen_data", {
		state_effect_bundles = state_effect_bundles,
		state = paris_helen.state, 
		current_location = paris_helen.current_location,
		movement_action_cooldown = helen_movement_cooldown,
		conf_movement_cooldown = helen_actions_cfg.cooldown,
		conf_effect_duration = helen_actions_cfg.effect_duration
	})

	ParisHelen_SetStateChangeInfoCallback(ui_context)

	ui_context:InterfaceFunction("set_activate_action_button_tooltip_keys", 
		"troy_main_fm_helen_invitation_tooltip_cooldown", 
		"troy_main_fm_helen_invitation_tooltip_no_region_selected", 
		"troy_main_fm_helen_invitation_tooltip_no_regions_available", 
		"troy_main_fm_helen_invitation_tooltip_not_enough_resources",
		"troy_main_fm_helen_invitation_tooltip_helen_captured"
	)

	ui_context:InterfaceFunction("refresh_panel")

	core:add_listener(
		"ParisHelen_PanelSelectRegion",
		"ComponentLClickUp",
		function(context) return uicomponent_descended_from(UIComponent(context.component), paris_helen_panel) and UIComponent(context.component):GetProperty("region_key") end,
		function()
			local selected_region = nil

			local button_feast = core:get_ui_root():SequentialFind(paris_helen_panel, "button_organize_feast")
			if string.find(button_feast:CurrentState(), "selected") then
				selected_region = cm:get_region(UIComponent(context.component):GetProperty("region_key"))
			end

			ui_context:InterfaceFunction("set_action_cost", get_helen_action_cost_for_region(selected_region, "feast"), helen_actions_cfg.cost_factor, "feast")
			ui_context:InterfaceFunction("refresh_actions_info")
			ui_context:InterfaceFunction("refresh_activate_action_button")
		end,
		true
	);

	-- reset default price
	core:add_listener(
		"ParisHelen_FeastButtonClicked",
		"ComponentLClickUp",
		function(context) return context.string == "button_organize_feast" end,
		function()
			ui_context:InterfaceFunction("set_action_cost", get_helen_action_cost_for_region(nil, "feast"), helen_actions_cfg.cost_factor, "feast")
			ui_context:InterfaceFunction("refresh_actions_info")
			ui_context:InterfaceFunction("refresh_activate_action_button")
		end,
		true
	);

	core:add_listener(
		"ParisHelen_PanelClosedCampaignRemoveListeners",
		"PanelClosedCampaign",
		function(context) return context.string == paris_helen_panel end,
		function()
			core:remove_listener("ParisHelen_PanelSelectRegion")
			core:remove_listener("ParisHelen_FeastButtonClicked")
		end,
		false
	);
end

function ParisHelen_OnActivateActionButtonPressed(context)
	print_debug("ParisHelen_OnActivateActionButtonPressed")
	
	local selected_region = nil

	local regions_list = find_uicomponent(core:get_ui_root(), paris_helen_panel, "panel", "right_bar", "available_settlements", "listview", "list_clip", "list_box")

	if regions_list then
		for i = 0, regions_list:ChildCount() - 1 do
			local row = UIComponent(regions_list:Find(i))

			if row:CurrentState() == "selected" then 
				selected_region = cm:model():world():region_manager():region_by_key(row:GetProperty("region_key"))
				break
			end
		end
	end

	local selected_action = nil
	local btn_feast = find_uicomponent(core:get_ui_root(), unpack(helen_actions_cfg.feast.button_path))
	local btn_games = find_uicomponent(core:get_ui_root(), unpack(helen_actions_cfg.games.button_path))
	local btn_prayer = find_uicomponent(core:get_ui_root(), unpack(helen_actions_cfg.prayer.button_path))

	if btn_feast:CurrentState() == "selected" then selected_action = "feast"
	elseif btn_games:CurrentState() == "selected" then selected_action = "games"
	elseif btn_prayer:CurrentState() == "selected" then selected_action = "prayer" end

	if selected_region ~= nil and not selected_region:is_null_interface() and selected_action ~= nil then
		local local_faction_cqi = cm:get_faction(cm:get_local_faction_name(true)):command_queue_index()
		CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "parishelen_move_helen:" .. selected_region:name() .. ":" .. selected_action)
	end
end

function ParisHelen_OnMoveHelenScriptEvent(context)
	local selected_action = context:trigger():split(":")[3]
	local selected_region_name = context:trigger():split(":")[2]
	local selected_region = cm:model():world():region_manager():region_by_key(selected_region_name)
	ParisHelen_MoveHelen(selected_region, selected_action)
end

function ParisHelen_HelenCapturedByHector()
	local paris_faction = cm:get_faction(paris_faction_key)

	if not paris_faction or paris_helen.state == "confederated" then
		return
	end

	local paris_home_region = paris_faction:home_region()
	core:remove_listener("return_helen_when_paris_has_region")

	if paris_home_region:is_null_interface() then
		core:add_listener(
			"return_helen_when_paris_has_region",
			"RegionFactionChangeEvent",
			function(context) return ParisHelen_IsHelenAlive() and context:region():owning_faction():name() == paris_faction_key end,
			function(context)
				local is_hector_still_owning_helen = cm:get_region(paris_helen.current_location):owning_faction():name() == hector_faction_key
				if is_hector_still_owning_helen then
					ParisHelen_ReturnHelenToParis()
				end
			end,
			false
		)
	else
		ParisHelen_ReturnHelenToParis()
	end
end

function ParisHelen_ReturnHelenToParis()
	local paris_faction = cm:get_faction(paris_faction_key)
	local paris_home_region = paris_faction:home_region()
	
	ParisHelen_TeleportHelen(paris_home_region:name(), "lonely")
	core:trigger_event("ScriptEventHelenOwnershipChange", paris_faction)

	cm:show_message_event(
		paris_faction_key, 
		paris_helen_event_feed_messages["helen_rescued_by_hector"].title,
		paris_helen_event_feed_messages["helen_rescued_by_hector"].primary_detail,
		paris_helen_event_feed_messages["helen_rescued_by_hector"].sec_detail,
		true,
		paris_helen_event_feed_messages["helen_rescued_by_hector"].event_pic,
		nil,
		nil,
		true
	)
end

core:add_listener(
	"paris_helen_first_tick_after_new_campaign_started",
	"NewCampaignStarted",
	true,
	function(context) 
		local paris_faction = cm:model():world():faction_by_key(paris_faction_key)
		if paris_faction:is_null_interface() then
			return
		end

		local paris_character = paris_faction:faction_leader()
		
		paris_char.forename = paris_character:get_forename()
		paris_char.fm_cqi = paris_character:family_member():command_queue_index()

		local paris_lookup = cm:char_lookup_str(paris_character)

		paris_helen.state = "happy"
		cm:apply_effect_bundle_to_region(helen_state_effect_bundles["happy"].key, paris_helen.current_location, 0)

		cm:force_add_trait(paris_lookup, paris_state_traits["happy"].key, false, paris_state_traits["happy"].points - 1)
		cm:force_add_trait(paris_lookup, paris_state_traits["happy"].key, true, 1)
	end,
	false
)

core:add_listener(
	"ParisHelen_FirstTickAfterWorldCreated",
	"FirstTickAfterWorldCreated",
	ParisHelen_IsHelenAlive,
	function(context)
		print_debug("ParisHelen_FirstTickAfterWorldCreated")
		ParisHelen_UpdateCityInfoBar()

		if cm:get_region(paris_helen.current_location) and  cm:get_region(paris_helen.current_location):owning_faction():name() == hector_faction_key and cm:get_region(paris_helen.current_location):owning_faction():is_human() == false then
			ParisHelen_HelenCapturedByHector()
		end
	end,
	true
)

function ParisHelen_AddListeners()
	out("ParisHelen_AddListeners()")

	core:add_listener(
		"ParisHelen_StartTurnListener",
		"FactionTurnStart",
		function(context)
			return ParisHelen_IsHelenAlive() and context:faction():name() == paris_faction_key and cm:model():turn_number() ~= 1
		end,
		function(context)
			print_debug("FactionTurnStart")
			print_debug("Helen state: " .. paris_helen.state)

			-- Decrease movement cooldown if Helen was moved recently
			if helen_movement_cooldown > 0 then
				helen_movement_cooldown = helen_movement_cooldown - 1
			end 

			if not paris_char.fm_cqi then
				script_error("ParisHelen_StartTurnListener: paris_char.fm_cqi is nil!!!")
				return
			end

		   -- check if paris is with helen and adjust the `timer`
			local paris = cm:model():family_member_for_command_queue_index(paris_char.fm_cqi):character()

			-- If Paris is not in Helen's region, a timer starts. After 4 turns, Happy changes to Unhappy. 
			-- After 4 more turns, Unhappy changes to Lonely and will stay that way indefinitely, until Paris ends his turn in Helen's region.
			-- If state is rescued, after 5 turns, regardless of whether Paris and Helen are together, their traits both change to Happy
			if (paris_helen.state == "rescued") or not (paris and paris:has_region() and paris:region():name() == paris_helen.current_location) then
				paris_helen.state_change_timer = paris_helen.state_change_timer + 1
			end

			if paris_helen.state == "captured" and paris_helen.state_change_timer == paris_helen_dilemmas.ransom.timer_treshold and paris:faction():is_human() and paris:faction():has_home_region() then
				cm:trigger_dilemma(paris_faction_key, paris_helen_dilemmas.ransom.key)
			end

			for from_state, value in pairs(paris_helen_state_transitions) do
				local to_state = value.to_state
				local turns = value.turns

				if paris_helen.state_change_timer == paris_helen_state_transitions[from_state].turns and paris_helen.state == from_state then
					ParisHelen_ChangeState(to_state)
				end
			end

			ParisHelen_UpdateCityInfoBar()
			
			print_debug("Timer = " .. paris_helen.state_change_timer)
		end,
		true
	)

	core:add_listener (
		"ParisHelen_EndTurnListener_DilemmaChoiceMadeEvent",
		"DilemmaChoiceMadeEvent",
		function(context) return ParisHelen_IsHelenAlive() and context:faction():name() == paris_faction_key and context:dilemma() == paris_helen_dilemmas.ransom.key end,
		function(context)
			if context:choice() == paris_helen_dilemmas.ransom.choice_pay then
				ParisHelen_TeleportHelen(context:faction():home_region():name(), "happy")
				core:trigger_event("ScriptEventHelenOwnershipChange", context:faction())
			else
				paris_helen.state_change_timer = 0
			end
		end,
		true
	)

	core:add_listener (
		"ParisHelen_menelaus_captured_helen_listener",
		"DilemmaChoiceMadeEvent",
		function(context) 
			return ParisHelen_IsHelenAlive() and context:dilemma() == paris_helen_dilemmas.menelaus_captured_helen.key 
		end,
		function(context)
			if context:choice() == paris_helen_dilemmas.menelaus_captured_helen.choice_send_helen then
				ParisHelen_TeleportHelen(context:faction():home_region():name())
			end
		end,
		true
	)

	core:add_listener(
		"ParisHelen_EndTurnListener",
		"FactionTurnEnd",
		function(context)
			return ParisHelen_IsHelenAlive() and context:faction():name() == paris_faction_key
		end,
		function(context)
			print_debug("FactionTurnEnd")
			if not paris_char.fm_cqi then
				script_error("ParisHelen_EndTurnListener: paris_char.fm_cqi is nil!!!")
				return
			end

			local paris = cm:model():family_member_for_command_queue_index(paris_char.fm_cqi):character()
			local paris_region = paris and not paris:is_null_interface() and paris:has_region() and paris:region() or false
			local paris_region_key = paris_region and paris_region:name() or ""
			local paris_is_in_own_region = paris_region and paris:region():owning_faction():name() == paris_faction_key
			local paris_faction = context:faction()

			-- If Paris ends his turn in Helen's region, but that region is captured by an enemy army, the state does not change to Happy. 
			if paris_region and
				paris_region_key == paris_helen.current_location and 
				paris_helen.state ~= "rescued" 
			then

				if paris_is_in_own_region then
					ParisHelen_ChangeState("happy")
				end

				ParisHelen_UpdateCityInfoBar()
			end
			
			-- CAI for Paris: if Paris is in own territory and Helen is in a different owned city and Lonely, try to bring her to him.
			if not paris_faction:is_human() and paris_helen.state == "lonely" and paris_is_in_own_region and helen_movement_cooldown == 0 then
				local helen_region = cm:model():world():region_manager():region_by_key(paris_helen.current_location)
				if helen_region:owning_faction():name() == paris_faction_key then
					for _, action in ipairs { "feast", "games", "prayer" } do
						if ParisHelen_CanMoveHelenTo(paris_region, action) then
							ParisHelen_MoveHelen(paris_region, action, true)
							break
						end
					end
				end
			end
		end,
		true
	)

	core:add_listener(
		"ParisHelen_RegionFactionChangeEvent",
		"RegionFactionChangeEvent",
		function(context)
			print_debug("RegionFactionChangeEvent reason: " .. context:reason())
			-- hook if paris lost a region, or conquered one
			local paris_faction = cm:get_faction(paris_faction_key)
			return ParisHelen_IsHelenAlive() and 
				paris_faction and 
				not paris_faction:confederation_in_progress() and 
				paris_helen.state ~= "confederated" and 
				context:region():name() == paris_helen.current_location
		end,
		function(context)
			core:trigger_event("ScriptEventHelenOwnershipChange",context:region():owning_faction())
			local prev_faction = context:previous_faction()
			local prev_faction_name = context:previous_faction():name()
			local curr_faction = context:region():owning_faction()
			local curr_faction_name = context:region():owning_faction():name()
			--if we lost helen region
			if prev_faction_name == paris_faction_key then
				ParisHelen_ChangeState("captured")

				core:trigger_event("ScriptEventHelenCaptured", context:region())

				local secondary_details_prev_faction_paris = "factions_screen_name_" .. curr_faction_name
				if curr_faction_name == "rebels" then
					secondary_details_prev_faction_paris = "ui_text_replacements_localised_text_rebel_faction_name_override"
				end
				
				cm:show_message_event(
					paris_faction_key, 
					paris_helen_event_feed_messages["helen_captured"].title,
					paris_helen_event_feed_messages["helen_captured"].primary_detail,
					secondary_details_prev_faction_paris,
					true,
					paris_helen_event_feed_messages["helen_captured"].event_pic,
					nil,
					nil,
					true)

				-- CAI for Paris: Hate the new owner for some time
				if not prev_faction:is_human() then
					local turn_number = cm:model():turn_number()
					cm:cai_strategic_stance_manager_set_stance_promotion_between_factions_for_a_given_stance(
						paris_faction_key,
						curr_faction_name,
						paris_helen_hostile_stance_key,
						turn_number,
						100,
						turn_number + paris_helen_hostile_stance_turns,
						100
					)
				end

				if curr_faction:is_human() then
					cm:show_message_event(
						curr_faction_name, 
						paris_helen_event_feed_messages["helen_captured_by_human_player"].title,
						paris_helen_event_feed_messages["helen_captured_by_human_player"].primary_detail,
						context:region():name(),
						true,
						paris_helen_event_feed_messages["helen_captured_by_human_player"].event_pic,
						nil,
						nil,
						true)
				end

				cm:apply_effect_bundle("effect_bundle_fm_helen_captured_not_paris",  curr_faction_name, 0)

			-- if we captured helen's region
			elseif curr_faction_name == paris_faction_key then
				if not paris_char.fm_cqi then
					script_error("ParisHelen_RegionFactionChangeEvent: paris_char.fm_cqi is nil!!!")
					return
				end

				local paris = cm:model():family_member_for_command_queue_index(paris_char.fm_cqi):character()

				-- if we recaptured the region with Paris or another character
				if paris and paris:has_region() and paris:region():name() == context:region():name() 
				then
					ParisHelen_ChangeState("rescued")
					core:trigger_event("ScriptEventHelenOwnershipChange",context:region():owning_faction())

					cm:show_message_event(
						paris_faction_key, 
						paris_helen_event_feed_messages["helen_rescued_by_paris"].title,
						paris_helen_event_feed_messages["helen_rescued_by_paris"].primary_detail,
						paris_helen_event_feed_messages["helen_rescued_by_paris"].sec_detail,
						true,
						paris_helen_event_feed_messages["helen_rescued_by_paris"].event_pic,
						nil,
						nil,
						true)
				else
					ParisHelen_ChangeState("lonely")
					is_helen_rescued_not_by_paris = true

					cm:show_message_event(
						paris_faction_key, 
						paris_helen_event_feed_messages["helen_rescued_not_by_paris"].title,
						paris_helen_event_feed_messages["helen_rescued_not_by_paris"].primary_detail,
						paris_helen_event_feed_messages["helen_rescued_not_by_paris"].sec_detail,
						true,
						paris_helen_event_feed_messages["helen_rescued_not_by_paris"].event_pic,
						nil,
						nil,
						true)
				end

				cm:remove_effect_bundle("effect_bundle_fm_helen_captured_not_paris", prev_faction_name)
			else
				if curr_faction:is_human() then
					cm:show_message_event(
						curr_faction_name, 
						paris_helen_event_feed_messages["helen_captured_by_human_player"].title,
						paris_helen_event_feed_messages["helen_captured_by_human_player"].primary_detail,
						context:region():name(),
						true,
						paris_helen_event_feed_messages["helen_captured_by_human_player"].event_pic,
						nil,
						nil,
						true)
				end

				if prev_faction:is_human() then
					cm:show_message_event(
						curr_faction_name, 
						paris_helen_event_feed_messages["helen_lost_by_human_player"].title,
						paris_helen_event_feed_messages["helen_lost_by_human_player"].primary_detail,
						curr_faction_name,
						true,
						paris_helen_event_feed_messages["helen_lost_by_human_player"].event_pic,
						nil,
						nil,
						true)
				end

				if prev_faction:has_effect_bundle("effect_bundle_fm_helen_captured_not_paris") then
					cm:remove_effect_bundle("effect_bundle_fm_helen_captured_not_paris", prev_faction_name)
				end
				cm:apply_effect_bundle("effect_bundle_fm_helen_captured_not_paris",  curr_faction_name, 0)
			end
			
			
			ParisHelen_UpdateCityInfoBar()
		end,
		true
	)

	core:add_listener(
		"ParisHelen_HectorCapturingHelenRegion",
		"CharacterPerformsSettlementOccupationDecision",
		function(context)
			local settlement = context:garrison_residence():settlement_interface()
			return ParisHelen_IsHelenAlive() and 
				settlement:faction():name() ~= paris_faction_key and 
				settlement:region():name() == paris_helen.current_location and 
				context:character():faction():name() == hector_faction_key and
				context:character():faction():is_human() == false
		end,
		ParisHelen_HelenCapturedByHector,
		true
	)

	core:add_listener(
		"ParisHelen_HelenRegionWasGiftedToHectorByOtherFaction",
		"RegionFactionChangeEvent",
		function(context)
			return ParisHelen_IsHelenAlive() and 
			context:region():name() == paris_helen.current_location and 
			context:region():owning_faction():name() == hector_faction_key and 
			context:region():owning_faction():is_human() == false
		end,
		ParisHelen_HelenCapturedByHector,
		true
	)

	core:add_listener(
		"ParisHelen_MenelausRegionWasGiftedToHectorByOtherFaction",
		"RegionFactionChangeEvent",
		function(context)
			return ParisHelen_IsHelenAlive() and 
			context:region():name() == paris_helen.current_location and 
			context:region():owning_faction():name() == menelaus_faction_key and 
			context:region():owning_faction():is_human() == true
		end,
		function(context)
			out("Helen captured by Sparta!")
			cm:trigger_dilemma(menelaus_faction_key, paris_helen_dilemmas.menelaus_captured_helen.key, nil)
		end,
		true
	)

	core:add_listener(
		"ParisHelen_PanelOpenedCampaign",
		"PanelOpenedCampaign",
		function(context) return context.string == paris_helen_panel end,
		ParisHelen_OnHelenPanelOpened,
		true
	);

	--Add listeners for UI events that will trigger model events that will be executed on all machines.
	core:add_listener(
		"ParisHelen_ActionButtonPressed",
		"ComponentLClickUp",
		function(context) return cm:get_local_faction_name(true) == paris_faction_key and uim:is_panel_open(paris_helen_panel) and context.string == "action_button" end,
		ParisHelen_OnActivateActionButtonPressed,
		true
	)

	core:add_listener(
		"ParisHelen_MoveHelenScriptEvent",
		"UITriggerScriptEvent",
		function(context) return context:trigger():split(":")[1] == "parishelen_move_helen" end,
		ParisHelen_OnMoveHelenScriptEvent,
		true
	)

	core:add_listener(
		"ParisHelen_FactionJoinsConfederation",
		"FactionJoinsConfederation",
		function(context) return context:faction():name() == paris_faction_key end,
		function(context)
			ParisHelen_ChangeState("confederated")
		end,
		false
	)
	
	core:add_listener(
		"ParisHelen_RegionFactionChangeEvent_ParisIsDeadConfederated",
		"RegionFactionChangeEvent",
		function(context)
			local paris_faction = cm:get_faction(paris_faction_key)
			return ParisHelen_IsHelenAlive() and 
				(not paris_faction or paris_faction:is_dead() or paris_faction:confederation_in_progress()) and
				(paris_helen.state == "confederated" or paris_helen.state == "captured") and 
				context:region():name() == paris_helen.current_location
		end,
		function(context)
			core:trigger_event("ScriptEventHelenOwnershipChange",context:region():owning_faction())
			local prev_faction = context:previous_faction()
			local prev_faction_name = context:previous_faction():name()
			local curr_faction = context:region():owning_faction()
			local curr_faction_name = context:region():owning_faction():name()
			if curr_faction:is_human() then
				cm:show_message_event(
					curr_faction_name, 
					paris_helen_event_feed_messages["helen_captured_by_human_player"].title,
					paris_helen_event_feed_messages["helen_captured_by_human_player"].primary_detail,
					context:region():name(),
					true,
					paris_helen_event_feed_messages["helen_captured_by_human_player"].event_pic,
					nil,
					nil,
					true)
			end

			if prev_faction:is_human() then
				cm:show_message_event(
					curr_faction_name, 
					paris_helen_event_feed_messages["helen_lost_by_human_player"].title,
					paris_helen_event_feed_messages["helen_lost_by_human_player"].primary_detail,
					curr_faction_name,
					true,
					paris_helen_event_feed_messages["helen_lost_by_human_player"].event_pic,
					nil,
					nil,
					true)
			end

			if prev_faction:has_effect_bundle("effect_bundle_fm_helen_captured_not_paris") then
				cm:remove_effect_bundle("effect_bundle_fm_helen_captured_not_paris", prev_faction_name)
			end
			cm:apply_effect_bundle("effect_bundle_fm_helen_captured_not_paris",  curr_faction_name, 0)
			ParisHelen_UpdateCityInfoBar()
		end,
		true
	)

	core:add_listener(
		"ParisHelen_CharacterCreated",
		"NewCharacterRecruited",
		function(context) 
			return context:character():faction():name() == paris_faction_key and
				context:character():family_member():command_queue_index() == paris_char.fm_cqi
		end,
		ParisHelen_ApplyTrait,
		true
	)
end

--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------

cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("TROY_PARIS_HELEN_STATE", paris_helen, context)
		cm:save_named_value("TROY_PARIS_HELEN_MOVEMENT_COOLDOWN", helen_movement_cooldown, context)
		cm:save_named_value("TROY_PARIS_IS_HELEN_RESCUED_NOT_BY_PARIS", is_helen_rescued_not_by_paris, context)
		cm:save_named_value("TROY_PARIS_HELEN_PARIS_CHAR", paris_char, context)
		cm:save_named_value("HELEN_ACTIONS_TOTAL_RESOURCES_SPENT", helen_actions_total_resources_spent, context)
	end
)

cm:add_loading_game_callback(
	function(context)
		paris_helen = cm:load_named_value("TROY_PARIS_HELEN_STATE", paris_helen, context)
		helen_movement_cooldown = cm:load_named_value("TROY_PARIS_HELEN_MOVEMENT_COOLDOWN", helen_movement_cooldown, context)
		is_helen_rescued_not_by_paris = cm:load_named_value("TROY_PARIS_IS_HELEN_RESCUED_NOT_BY_PARIS", is_helen_rescued_not_by_paris, context)
		paris_char = cm:load_named_value("TROY_PARIS_HELEN_PARIS_CHAR", paris_char, context)
		helen_actions_total_resources_spent = cm:load_named_value("HELEN_ACTIONS_TOTAL_RESOURCES_SPENT", helen_actions_total_resources_spent, context)
	end
)