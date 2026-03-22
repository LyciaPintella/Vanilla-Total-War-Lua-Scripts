out("Loading troy_hector_trojan_alliance.lua")

hector_faction = "troy_main_trj_hector"
troy_faction = "troy_main_trj_troy"

-- Pairs of lower bound number of regions to respective effect bundles.
-- The upper bounds are the exclusive lower bounds of the next element (or no upper bound in the case of the last element)
-- The first element of the list should be the 0th element and its lower bound should be 0 regions.
trojan_alliance_bonuses_list = {
	[0] = { lower_bound = 0,	effect_bundle_key = "effect_bundle_fm_trojan_alliance_level_0", background = "level_0" },
	[1] = { lower_bound = 4,	effect_bundle_key = "effect_bundle_fm_trojan_alliance_level_1", background = "level_1" },
	[2] = { lower_bound = 10,	effect_bundle_key = "effect_bundle_fm_trojan_alliance_level_2", background = "level_2" },
	[3] = { lower_bound = 20,	effect_bundle_key = "effect_bundle_fm_trojan_alliance_level_3", background = "level_3" },
	[4] = { lower_bound = 40,	effect_bundle_key = "effect_bundle_fm_trojan_alliance_level_4", background = "level_4" },
	[5] = { lower_bound = 60,	effect_bundle_key = "effect_bundle_fm_trojan_alliance_level_5", background = "level_5" }
}

-- Configuration of the 'Grateful ally' events
trojan_alliance_event_cooldown = 10
trojan_alliance_incidents = {
	common_enemy_destroyed = {
		up_to_25 = {
			"troy_fm_hector_destroyed_common_enemy_1_general_up_to_25",
			"troy_fm_hector_destroyed_common_enemy_2_spy_up_to_25",
			"troy_fm_hector_destroyed_common_enemy_3_envoy_up_to_25",
			"troy_fm_hector_destroyed_common_enemy_4_priest_up_to_25"
		},
		up_to_50 = {
			"troy_fm_hector_destroyed_common_enemy_1_general_up_to_50",
			"troy_fm_hector_destroyed_common_enemy_2_spy_up_to_50",
			"troy_fm_hector_destroyed_common_enemy_3_envoy_up_to_50",
			"troy_fm_hector_destroyed_common_enemy_4_priest_up_to_50"
		},
		up_to_75 = {
			"troy_fm_hector_destroyed_common_enemy_1_general_up_to_75",
			"troy_fm_hector_destroyed_common_enemy_2_spy_up_to_75",
			"troy_fm_hector_destroyed_common_enemy_3_envoy_up_to_75",
			"troy_fm_hector_destroyed_common_enemy_4_priest_up_to_75"
		},
		up_to_100 = {
			"troy_fm_hector_destroyed_common_enemy_1_general_up_to_100",
			"troy_fm_hector_destroyed_common_enemy_2_spy_up_to_100",
			"troy_fm_hector_destroyed_common_enemy_3_envoy_up_to_100",
			"troy_fm_hector_destroyed_common_enemy_4_priest_up_to_100"
		},
		post_100 = {
			"troy_fm_hector_destroyed_common_enemy_1_general_post_100",
			"troy_fm_hector_destroyed_common_enemy_2_spy_post_100",
			"troy_fm_hector_destroyed_common_enemy_3_envoy_post_100",
			"troy_fm_hector_destroyed_common_enemy_4_priest_post_100"
		}
	},
	won_battle_in_allied_region = {
		up_to_25 = {
			"troy_fm_hector_won_battle_in_allied_region_1_food_bronze_up_to_25",
			"troy_fm_hector_won_battle_in_allied_region_2_wood_stone_up_to_25",
			"troy_fm_hector_won_battle_in_allied_region_3_gold_up_to_25",
			"troy_fm_hector_won_battle_in_allied_region_4_all_but_gold_up_to_25"
		},
		up_to_50 = {
			"troy_fm_hector_won_battle_in_allied_region_1_food_bronze_up_to_50",
			"troy_fm_hector_won_battle_in_allied_region_2_wood_stone_up_to_50",
			"troy_fm_hector_won_battle_in_allied_region_3_gold_up_to_50",
			"troy_fm_hector_won_battle_in_allied_region_4_all_but_gold_up_to_50"
		},
		up_to_75 = {
			"troy_fm_hector_won_battle_in_allied_region_1_food_bronze_up_to_75",
			"troy_fm_hector_won_battle_in_allied_region_2_wood_stone_up_to_75",
			"troy_fm_hector_won_battle_in_allied_region_3_gold_up_to_75",
			"troy_fm_hector_won_battle_in_allied_region_4_all_but_gold_up_to_75"
		},
		up_to_100 = {
			"troy_fm_hector_won_battle_in_allied_region_1_food_bronze_up_to_100",
			"troy_fm_hector_won_battle_in_allied_region_2_wood_stone_up_to_100",
			"troy_fm_hector_won_battle_in_allied_region_3_gold_up_to_100",
			"troy_fm_hector_won_battle_in_allied_region_4_all_but_gold_up_to_100"
		},
		post_100 = {
			"troy_fm_hector_won_battle_in_allied_region_1_food_bronze_post_100",
			"troy_fm_hector_won_battle_in_allied_region_2_wood_stone_post_100",
			"troy_fm_hector_won_battle_in_allied_region_3_gold_post_100",
			"troy_fm_hector_won_battle_in_allied_region_4_all_but_gold_post_100"
		}		
	},
	gifted_region_to_ally = {
		up_to_25 = {
			"troy_fm_hector_gifted_region_to_ally_1_ares_up_to_25",
			"troy_fm_hector_gifted_region_to_ally_2_athena_up_to_25",
			"troy_fm_hector_gifted_region_to_ally_3_aphrodite_up_to_25",
			"troy_fm_hector_gifted_region_to_ally_4_apollo_up_to_25",
			"troy_fm_hector_gifted_region_to_ally_5_hera_up_to_25",
			"troy_fm_hector_gifted_region_to_ally_6_poseidon_up_to_25",
			"troy_fm_hector_gifted_region_to_ally_7_zeus_up_to_25",
			"troy_fm_hector_gifted_region_to_ally_8_artemis_up_to_25",
			"troy_fm_hep_hector_gifted_region_to_ally_9_hephaestus_up_to_25"
		},
		up_to_50 = {
			"troy_fm_hector_gifted_region_to_ally_1_ares_up_to_50",
			"troy_fm_hector_gifted_region_to_ally_2_athena_up_to_50",
			"troy_fm_hector_gifted_region_to_ally_3_aphrodite_up_to_50",
			"troy_fm_hector_gifted_region_to_ally_4_apollo_up_to_50",
			"troy_fm_hector_gifted_region_to_ally_5_hera_up_to_50",
			"troy_fm_hector_gifted_region_to_ally_6_poseidon_up_to_50",
			"troy_fm_hector_gifted_region_to_ally_7_zeus_up_to_50",
			"troy_fm_hector_gifted_region_to_ally_8_artemis_up_to_50",
			"troy_fm_hep_hector_gifted_region_to_ally_9_hephaestus_up_to_50"
		},
		up_to_75 = {
			"troy_fm_hector_gifted_region_to_ally_1_ares_up_to_75",
			"troy_fm_hector_gifted_region_to_ally_2_athena_up_to_75",
			"troy_fm_hector_gifted_region_to_ally_3_aphrodite_up_to_75",
			"troy_fm_hector_gifted_region_to_ally_4_apollo_up_to_75",
			"troy_fm_hector_gifted_region_to_ally_5_hera_up_to_75",
			"troy_fm_hector_gifted_region_to_ally_6_poseidon_up_to_75",
			"troy_fm_hector_gifted_region_to_ally_7_zeus_up_to_75",
			"troy_fm_hector_gifted_region_to_ally_8_artemis_up_to_75",
			"troy_fm_hep_hector_gifted_region_to_ally_9_hephaestus_up_to_75"
		},
		up_to_100 = {
			"troy_fm_hector_gifted_region_to_ally_1_ares_up_to_100",
			"troy_fm_hector_gifted_region_to_ally_2_athena_up_to_100",
			"troy_fm_hector_gifted_region_to_ally_3_aphrodite_up_to_100",
			"troy_fm_hector_gifted_region_to_ally_4_apollo_up_to_100",
			"troy_fm_hector_gifted_region_to_ally_5_hera_up_to_100",
			"troy_fm_hector_gifted_region_to_ally_6_poseidon_up_to_100",
			"troy_fm_hector_gifted_region_to_ally_7_zeus_up_to_100",
			"troy_fm_hector_gifted_region_to_ally_8_artemis_up_to_100",
			"troy_fm_hep_hector_gifted_region_to_ally_9_hephaestus_up_to_100"
		},
		post_100 = {
			"troy_fm_hector_gifted_region_to_ally_1_ares_post_100",
			"troy_fm_hector_gifted_region_to_ally_2_athena_post_100",
			"troy_fm_hector_gifted_region_to_ally_3_aphrodite_post_100",
			"troy_fm_hector_gifted_region_to_ally_4_apollo_post_100",
			"troy_fm_hector_gifted_region_to_ally_5_hera_post_100",
			"troy_fm_hector_gifted_region_to_ally_6_poseidon_post_100",
			"troy_fm_hector_gifted_region_to_ally_7_zeus_post_100",
			"troy_fm_hector_gifted_region_to_ally_8_artemis_post_100",
			"troy_fm_hep_hector_gifted_region_to_ally_9_hephaestus_post_100"
		}		
	},
}

trojan_alliance_num_regions = 0					  -- This value would be overriden at the start of the first turn of the faction.
trojan_alliance_turns_before_incident_allowed = 0 -- This will be reset after a gratitude event is triggered for an ally to avoid spamming these events.
trojan_alliance_selected_incident_key = ""		-- This will be non-empty whenever a 'grateful ally' incident is waiting for the beginning of the next Hector's turn
trojan_alliance_selected_incident_cqi_1 = 0	   -- CQI of the faction expressing its gratitude via the incident
trojan_alliance_selected_incident_cqi_2 = 0		  -- CQI of any enemy faction related to the incident

-- UI element names for the faction mechanic.
trojan_alliance_ui = {
	root_panel = "fm_trojan_alliance",
	no_allies_text = "tx_when_empty",
	allies_list = "list_box",
	sort_arrows = "headers",
}

function Add_Hector_Trojan_Alliance_Listeners()
	out("Listener for Hector Trojan Alliance started")

	core:add_listener(
		"Hector_Trojan_Alliance_every_turn_start",
		"FactionTurnStart",
		function(context) return context:faction():name() == hector_faction end,
		Hector_Trojan_Alliance_Recalc,
		true
	)

	core:add_listener(
		"Hector_Trojan_Alliance_positive_diplomatic_event",
		"PositiveDiplomaticEvent",
		function(context) return context:character():faction():name() == hector_faction end,
		function(context)
			cm:callback(
				Hector_Trojan_Alliance_Recalc,
				0.2)
		end,
		true
	)

	core:add_listener(
		"Hector_Trojan_Alliance_negative_diplomatic_event",
		"NegativeDiplomaticEvent",
		function(context) return context:character():faction():name() == hector_faction end,
		Hector_Trojan_Alliance_Recalc,
		true
	)

	core:add_listener(
		"Hector_Trojan_Alliance_PanelOpenedCampaign",
		"PanelOpenedCampaign",
		function(context) return context.string == trojan_alliance_ui.root_panel end,
		Hector_Trojan_Alliance_panel_open,
		true
	);
	
	-- Ally's gratitude: Hector destroyed a common enemy
	core:add_listener(
		"Hector_Trojan_Alliance_FactionOvercomesOtherFaction",
		"FactionOvercomesOtherFaction",
		function(context) return context:faction():name() == hector_faction and trojan_alliance_turns_before_incident_allowed == 0 end,
		Hector_Trojan_Alliance_common_enemy_destroyed,
		true
	)

	-- Ally's gratitude: Hector's Troy won a battle in allied territory (COMMON ENEMY!!)
	core:add_listener(
		"Hector_Trojan_Alliance_CharacterCompletedBattle",
		"CharacterCompletedBattle",
		function(context)
			if trojan_alliance_turns_before_incident_allowed > 0 or not context:pending_battle():has_region() then return false end
			local character = context:character()
			local faction = character:faction()
			local enemy_fm_cqis = cm:pending_battle_cache_get_enemies_of_char(context:character())
			local enemy_fm = cm:get_family_member_by_cqi(enemy_fm_cqis[i])

			if enemy_fm then
				local primary_enemy_faction = enemy_fm:character_details():faction()
				local region_owning_faction = context:pending_battle():region():owning_faction()
				return faction:name() == hector_faction and character:won_battle() and region_owning_faction:allied_with(faction) and region_owning_faction:at_war_with(primary_enemy_faction)
			end
		end,
		Hector_Trojan_Alliance_won_battle_in_allied_region,
		true
	)

	-- Ally's gratitude: Hector gifted a region to an ally with 5 or less regions
	core:add_listener(
		"Hector_Trojan_Alliance_RegionFactionChangeEvent",
		"RegionFactionChangeEvent",
		function(context)
			if trojan_alliance_turns_before_incident_allowed > 0 then return false end
			local previous_owner = context:previous_faction()
			local new_owner = context:region():owning_faction()
			return previous_owner:name() == hector_faction and new_owner:allied_with(previous_owner) and new_owner:num_regions() <= 6
		end,
		Hector_Trojan_Alliance_gifted_region_to_ally,
		true
	)
end

function get_bonuses_list_index(num_regions)
	for i, bonus in ipairs(trojan_alliance_bonuses_list)
	do
		if num_regions < bonus.lower_bound then
			return i - 1
		end
	end
	return #trojan_alliance_bonuses_list
end

function is_faction_in_list(faction, list)
	for i = 0, list:num_items() - 1
	do
		if faction:command_queue_index() == list:item_at(i):command_queue_index() then
			return true
		end
	end
	return false
end

function count_ally_regions(ally, defensive_allies, military_allies)
	local num_regions = ally:num_regions()
	local ally_vassals = ally:factions_master_of()
	for i = 0, ally_vassals:num_items() - 1
	do
		local ally_vassal = ally_vassals:item_at(i)
		if not is_faction_in_list(ally_vassal, defensive_allies) and not is_faction_in_list(ally_vassal, military_allies) then
			num_regions = num_regions + ally_vassal:num_regions()
		end
	end

	local ally_subjects = ally:factions_sovereign_of()
	for i = 0, ally_subjects:num_items() - 1
	do
		local ally_subject = ally_subjects:item_at(i)
		if not is_faction_in_list(ally_subject, defensive_allies) and not is_faction_in_list(ally_subject, military_allies) then
			num_regions = num_regions + ally_subject:num_regions()
		end
	end

	return num_regions
end

function count_allies_regions(allies)
	local num_regions = 0
	for i = 0, allies:num_items() - 1
	do
		local ally = allies:item_at(i)
		num_regions = num_regions + count_ally_regions(ally, defensive_allies, military_allies)
	end
	return num_regions
end

function Hector_Trojan_Alliance_Recalc()

	local fac = cm:get_faction(hector_faction)
	local defensive_allies = fac:factions_defensive_alliance_with()
	local military_allies = fac:factions_military_alliance_with()

	local num_regions = count_allies_regions(defensive_allies) + count_allies_regions(military_allies)
	local old_bonus_index, new_bonus_index = get_bonuses_list_index(trojan_alliance_num_regions), get_bonuses_list_index(num_regions)

	if new_bonus_index ~= old_bonus_index then
		cm:remove_effect_bundle(trojan_alliance_bonuses_list[old_bonus_index].effect_bundle_key, hector_faction)

		local event_id

		if new_bonus_index == #trojan_alliance_bonuses_list then
			event_id = 1058 -- max alliance
		elseif new_bonus_index < old_bonus_index then
			event_id = 1056 -- decreased
		else
			event_id = 1057 -- increased
		end

		cm:show_message_event(
			hector_faction, 
			"event_feed_strings_text_troy_event_feed_string_scripted_event_trojan_alliance_change_title",
			"effect_bundles_localised_title_" .. trojan_alliance_bonuses_list[new_bonus_index].effect_bundle_key,
			"event_feed_strings_text_troy_event_feed_string_all_null", -- handled in db (this param is not used)
			true,
			event_id,
			nil,
			nil,
			true)

		achievements.hector.func_trojan_alliance_level_changed(new_bonus_index)
	end

	if new_bonus_index ~= old_bonus_index then
		cm:apply_effect_bundle(trojan_alliance_bonuses_list[new_bonus_index].effect_bundle_key, hector_faction, 0)
		core:trigger_event("TrojanAllianceTier", cm:model():world():faction_by_key(hector_faction), new_bonus_index)
	end

	trojan_alliance_num_regions = num_regions

	if trojan_alliance_turns_before_incident_allowed > 0 then
		trojan_alliance_turns_before_incident_allowed = trojan_alliance_turns_before_incident_allowed - 1
	end

	if type(trojan_alliance_selected_incident_key) == "string" and trojan_alliance_selected_incident_key ~= "" then
		-- Trigger the waiting incident and reset the related variables
		local troy_of_hector_cqi = cm:model():world():faction_by_key(hector_faction):command_queue_index()
		cm:trigger_incident_with_targets(troy_of_hector_cqi, trojan_alliance_selected_incident_key, trojan_alliance_selected_incident_cqi_1, trojan_alliance_selected_incident_cqi_2, 0, 0, 0, 0)
		trojan_alliance_selected_incident_cqi_1 = 0
		trojan_alliance_selected_incident_cqi_2 = 0
		trojan_alliance_selected_incident_key = ""
	end
end

function fill_regions_bar(ui_context)
	for i = 0, #trojan_alliance_bonuses_list 
	do
		ui_context:InterfaceFunction("add_threshold_level", trojan_alliance_bonuses_list[i].lower_bound, trojan_alliance_bonuses_list[i].effect_bundle_key, trojan_alliance_bonuses_list[i].background)
	end
	ui_context:InterfaceFunction("finish_threshold_levels", trojan_alliance_num_regions)
end

function fill_allies_list(ui_context)
	local defensive_allies = cm:get_faction(hector_faction):factions_defensive_alliance_with()
	local military_allies = cm:get_faction(hector_faction):factions_military_alliance_with()

	local empty_text = find_uicomponent(ui_context, trojan_alliance_ui.no_allies_text)
	local sort_arrows = find_uicomponent(ui_context, trojan_alliance_ui.sort_arrows)
	empty_text:SetVisible(defensive_allies:is_empty() and military_allies:is_empty())
	sort_arrows:SetVisible(not (defensive_allies:is_empty() and military_allies:is_empty()))

	local allies_list = find_uicomponent(ui_context, trojan_alliance_ui.allies_list)
	allies_list:DestroyChildren()

	function create_ally_entries(allies)
		for i = 0, allies:num_items() - 1
		do
			local num_regions = count_ally_regions(allies:item_at(i), defensive_allies, military_allies)
			ui_context:InterfaceFunction("add_ally", trojan_alliance_ui.allies_list, allies:item_at(i):command_queue_index(), num_regions)
		end
	end

	create_ally_entries(defensive_allies)
	create_ally_entries(military_allies)
end

function Hector_Trojan_Alliance_panel_open(context)
	local ui_context = UIComponent(context.component)

	fill_allies_list(ui_context)
	fill_regions_bar(ui_context)
end

function Hector_Trojan_Alliance_select_incident(incident_set_key, hectors_troy_faction, allied_faction, enemy_faction)
	-- Select an incident from the given subset and remember it to be triggered at the beginning of Hector's next turn.
	-- If there is already another incident waiting, just overwrite it (by design).
	trojan_alliance_turns_before_incident_allowed = trojan_alliance_event_cooldown
	local incident_set = trojan_alliance_incidents[incident_set_key]
	local turn = cm:model():turn_number()
	local turn_set = {}
	if turn <= 25 then
		turn_set = incident_set["up_to_25"]
	elseif  turn <= 50 then
		turn_set = incident_set["up_to_50"]
	elseif  turn <= 75 then
		turn_set = incident_set["up_to_75"]
	elseif  turn <= 100 then
		turn_set = incident_set["up_to_100"]
	else
		turn_set = incident_set["post_100"]
	end
	trojan_alliance_selected_incident_key = turn_set[cm:model():random_int(1, #turn_set)]
	trojan_alliance_selected_incident_cqi_1 = allied_faction:command_queue_index()
	trojan_alliance_selected_incident_cqi_2 = enemy_faction and enemy_faction:command_queue_index() or 0
end

function Hector_Trojan_Alliance_common_enemy_destroyed(context)

	local hectors_troy = context:faction()
	local other_faction = context:other_faction()
	local other_factions_enemies = other_faction:factions_at_war_with()
	local affected_hectors_allies = {}
	for i = 0, other_factions_enemies:num_items() - 1 do
		local other_factions_enemy = other_factions_enemies:item_at(i)
		if other_factions_enemy:allied_with(hectors_troy) then
			table.insert(affected_hectors_allies, other_factions_enemy)
		end
	end
	if #affected_hectors_allies == 0 then
		return
	end
	-- Select the strongest one among the affected Hector's allies
	local strongest_ally
	local strongest_ally_strength
	for _, ally in ipairs(affected_hectors_allies) do
		local ally_strength = ally:strength()
		if strongest_ally_strength == nil or ally_strength > strongest_ally_strength then
			strongest_ally = ally
			strongest_ally_strength = ally_strength
		end
	end
	Hector_Trojan_Alliance_select_incident("common_enemy_destroyed", hectors_troy, strongest_ally, other_faction)
end

function Hector_Trojan_Alliance_won_battle_in_allied_region(context)
	local hectors_troy = context:character():faction()
	local allied_faction = context:pending_battle():region():owning_faction()

	local common_enemy_faction
	local char = context:character()

	if cm:pending_battle_cache_char_is_attacker(char) then
		common_enemy_faction = cm:get_faction(cm:pending_battle_cache_get_defender_faction_name(1))
	elseif cm:pending_battle_cache_char_is_defender(char) then
		common_enemy_faction = cm:get_faction(cm:pending_battle_cache_get_attacker_faction_name(1))
	end
	
	Hector_Trojan_Alliance_select_incident("won_battle_in_allied_region", hectors_troy, allied_faction, common_enemy_faction)
end

function Hector_Trojan_Alliance_gifted_region_to_ally(context)
	local hectors_troy = context:previous_faction()
	local allied_faction = context:region():owning_faction()
	Hector_Trojan_Alliance_select_incident("gifted_region_to_ally", hectors_troy, allied_faction)
end

function hector_faction_active(faction_name)
	return faction_name == hector_faction
end

function assuwan_league_can_gift_region()
	local hector = cm:get_faction(hector_faction)
	local hector_regions = hector:region_list()
	local hector_regions_num = hector_regions:num_items()
	local defensive_allies = hector:factions_defensive_alliance_with()
	local military_allies = hector:factions_military_alliance_with()
	local alliance_num_regions = count_allies_regions(defensive_allies) + count_allies_regions(military_allies)
	local one_off_from_bonus = false

	if hector_regions_num < 2 then
		return false
	end

	for k, v in pairs(trojan_alliance_bonuses_list) do
		if alliance_num_regions + 1 == v.lower_bound then
			one_off_from_bonus = true
			break
		end
	end

	if one_off_from_bonus == false then
		return false
	end

	local function can_gift_region(ally)
		if ally:name() == troy_faction then
			return false
		end
		if ally:region_list():num_items() > 4 then
			return false
		end
		local giftable_regions = hector:tradeable_regions(ally:command_queue_index())
		return giftable_regions:num_items() > 0
	end

	local max_num = defensive_allies:num_items() - 1
	for i = 0, max_num do
		local ally = defensive_allies:item_at(i)
		if can_gift_region(ally) then
			return ally
		end
	end

	local max_num = military_allies:num_items() - 1
	for i = 0, max_num do
		local ally = military_allies:item_at(i)
		if can_gift_region(ally) then
			return ally
		end
	end


	return false
end


--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------

cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("TROY_HECTOR_TROJAN_ALLIANCE_NUM_REGIONS", trojan_alliance_num_regions, context)
		cm:save_named_value("TROY_HECTOR_TROJAN_ALLIANCE_TURNS_BEFORE_INCIDENT_ALLOWED", trojan_alliance_turns_before_incident_allowed, context)
		cm:save_named_value("TROY_HECTOR_TROJAN_ALLIANCE_SELECTED_INCIDENT_KEY", trojan_alliance_selected_incident_key, context)
		cm:save_named_value("TROY_HECTOR_TROJAN_ALLIANCE_SELECTED_INCIDENT_CQI_1", trojan_alliance_selected_incident_cqi_1, context)
		cm:save_named_value("TROY_HECTOR_TROJAN_ALLIANCE_SELECTED_INCIDENT_CQI_2", trojan_alliance_selected_incident_cqi_2, context)
	end
)

cm:add_loading_game_callback(
	function(context)
		trojan_alliance_num_regions				   = cm:load_named_value("TROY_HECTOR_TROJAN_ALLIANCE_NUM_REGIONS", trojan_alliance_num_regions, context)
		trojan_alliance_turns_before_incident_allowed = cm:load_named_value("TROY_HECTOR_TROJAN_ALLIANCE_TURNS_BEFORE_INCIDENT_ALLOWED", trojan_alliance_turns_before_incident_allowed, context)
		trojan_alliance_selected_incident_key		 = cm:load_named_value("TROY_HECTOR_TROJAN_ALLIANCE_SELECTED_INCIDENT_KEY", trojan_alliance_selected_incident_key, context)
		trojan_alliance_selected_incident_cqi_1	   = cm:load_named_value("TROY_HECTOR_TROJAN_ALLIANCE_SELECTED_INCIDENT_CQI_1", trojan_alliance_selected_incident_cqi_1, context)
		trojan_alliance_selected_incident_cqi_2	   = cm:load_named_value("TROY_HECTOR_TROJAN_ALLIANCE_SELECTED_INCIDENT_CQI_2", trojan_alliance_selected_incident_cqi_2, context)
	end
)