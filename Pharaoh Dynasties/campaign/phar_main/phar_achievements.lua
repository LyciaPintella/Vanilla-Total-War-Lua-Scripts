out("Loading phar_achievements.lua")

local debug = false
local function output_debug_string(string)
	if debug then
		out("phar_achievements (debug): " .. string)
	end
end

local function output_string(string)
	out("phar_achievements: " .. string)
end


local function discover_realm_for_region(faction, region_key)
	local realm_name = phar_realms.get_realm_for_region(region_key)
	if realm_name == nil then
		return
	end

	if get_persist_achievement_data(faction, "discovered_realm_" .. realm_name) then
		return -- already discovered
	end

	persist_achievement_data(faction, "discovered_realm_" .. realm_name, true)

	if is_table(achievements.discover_realms) then
		for achievement_key, achievement_data in pairs(achievements.discover_realms) do
			local all_realms_are_discovered = true

			for _, realm in ipairs(phar_realms.realms) do
				if (achievement_data.realm_name_prefix == nil or string.starts_with(realm.name, achievement_data.realm_name_prefix)) and
					not get_persist_achievement_data(faction, "discovered_realm_" .. realm.name)
				then
					all_realms_are_discovered = false
					break
				end
			end

			if all_realms_are_discovered then
				achievement_unlock(faction, achievement_key)
			end
		end
	end
end

local function fill_initial_discovered_realms(faction)
	local region_list = faction:region_list()

	for i = 0, region_list:num_items() - 1 do
		local region = region_list:item_at(i);
		discover_realm_for_region(faction, region:name())
	end
end

local function check_millitary_allies_achievements(faction)
	if achievements.diplomacy.military_allies_with ~= nil and is_table(achievements.diplomacy.military_allies_with) then
		for achievement_key, achievement_data in pairs(achievements.diplomacy.military_allies_with) do
			if (is_table(achievement_data.play_with_factions) and table_contains(achievement_data.play_with_factions, faction:name()) and is_table(achievement_data.allied_with_factions)) then
				local allied_with_all_necessary_factions = true
				for _, necessary_faction_name in ipairs(achievement_data.allied_with_factions) do
					local necessary_faction = cm:get_faction(necessary_faction_name)
					if faction:name() ~= necessary_faction_name and not necessary_faction:is_dead() then -- don't check alliance with yourself or dead factions
						if not faction:military_allies_with(necessary_faction) then
							allied_with_all_necessary_factions = false
							break
						end
					end
				end
				if allied_with_all_necessary_factions then
					achievement_unlock(faction, achievement_key)
				end
			end
		end
	end
end

local function check_peace_treaty_achievements(faction, other_faction)
	if achievements.diplomacy.make_peace_with ~= nil and is_table(achievements.diplomacy.make_peace_with) then
		for achievement_key, achievement_data in pairs(achievements.diplomacy.make_peace_with) do
			if (is_table(achievement_data.play_with_factions) and table_contains(achievement_data.play_with_factions, faction:name())) then
				if achievement_data.factions_to_ignore_prefix == nil or not string.starts_with(other_faction:name(), achievement_data.factions_to_ignore_prefix) then
					local count = track_achievement_progress(faction, "number_of_peace_treaties", true)
					if count >= achievement_data.count then
						achievement_unlock(faction, achievement_key)
					end
				end
			end
		end
	end
end

local function positive_diplomatic_event_filter(context)
	return context:character():faction():is_human()
end

local function positive_diplomatic_event(context)
	local faction = context:character():faction()
	local other_faction = nil
	if context:proposer():name() == faction:name() then
		other_faction = context:recipient()
	else
		other_faction = context:proposer()
	end

	if not get_persist_achievement_data(faction, "has_made_treaties") and
	 	(context:is_military_alliance() or context:is_defensive_alliance() or context:is_military_access() or context:is_non_aggression_pact() or context:is_trade_agreement() or context:is_vassalage() or context:is_subjugation())
	then
		persist_achievement_data(faction, "has_made_treaties", true)
	end

	if context:is_military_alliance() then
		cm:callback(function() check_millitary_allies_achievements(faction) end, 1)
		
	end

	if context:is_peace_treaty() then
		check_peace_treaty_achievements(faction, other_faction)
	end

	-- NOTE: Vassels are acquired through subjugation, this is why we check for is_subjugation(), we also check for is_vassalage() just in case the implementation changes.
	if context:is_subjugation() or context:is_vassalage() then
		local proposer_is_subject = context:proposer_is_subject() or context:proposer_is_vassal()
		local player_acquired_vassal = (faction:name() == context:proposer():name() and not proposer_is_subject) or (faction:name() == context:recipient():name() and proposer_is_subject)

		if player_acquired_vassal and is_table(achievements.vassalise_factions) then
			for achievement_key, achievement_data in pairs(achievements.vassalise_factions) do
				if faction:name() == achievement_data.play_with_faction and other_faction:name() == achievement_data.vassalised_faction then
					achievement_unlock(faction, achievement_key)
				end
			end
		end

		if faction:name() == "phar_main_bay" and player_acquired_vassal and not get_persist_achievement_data(faction, "bay_has_acquired_vassal_" .. other_faction:name()) then
			persist_achievement_data(faction, "bay_has_acquired_vassal_" .. other_faction:name(), true)
			-- Save and check how many vassals Bay has acquired so far
			local count = track_achievement_progress(faction, "bay_number_of_acquired_vassals", true)
			if count == 4 then
				achievement_unlock(faction, achievements.diplomacy.acquire_four_vassals_bay)
			end
		end
	end

	if context:is_confederation() then
		local count = track_achievement_progress(faction, "number_of_confederated_factions", true)

		if is_table(achievements.confederate_factions) then
			for achievement_key, achievement_data in pairs(achievements.confederate_factions) do
				if faction:name() == achievement_data.play_with_faction and count >= achievement_data.count then
					achievement_unlock(faction, achievement_key)
				end
			end
		end
	end
end

local function negative_diplomatic_event_filter(context)
	local proposer = context:proposer()
	local human_proposer = nil
	if not proposer:is_null_interface() and proposer:is_human() then
		human_proposer = proposer
	end

	local recipient = context:recipient()
	local human_recipient = nil
	if not recipient:is_null_interface() and recipient:is_human() then
		human_recipient = recipient
	end

	return human_proposer or human_recipient
end

local function negative_diplomatic_event(context)
	local faction = context:character():faction()
	local proposer = context:proposer()
	local recipient = context:recipient()
	if context:is_war() then
		if proposer:is_human() and proposer:name() == "phar_main_bay" and context:was_military_alliance()
		then
			-- Persist the declare-war event
			persist_achievement_data(proposer, "bay_has_declared_war_on_an_old_ally_" .. recipient:name(), true)
		end

		if is_table(achievements.at_war_with_major_factions) then
			for achievement_key, achievement_data in pairs(achievements.at_war_with_major_factions) do
				if faction:is_human() and faction:name() == achievement_data.play_with_faction then
					local faction_is_at_war_with_all_major_factions = true

					for _, major_faction_name in ipairs(achievement_data.factions_list) do
						local major_faction = cm:get_faction(major_faction_name)
						-- NOTE: We check for is_major() so that "phar_main_merneptah" and "phar_main_setnakhte" are only checked when a player has them as DLCs
						if major_faction:is_major() and not faction:at_war_with(major_faction) then
							faction_is_at_war_with_all_major_factions = false
							break
						end
					end

					if faction_is_at_war_with_all_major_factions then
						achievement_unlock(faction, achievement_key)
					end
				end
			end
		end
	end
end


local function faction_achieved_victory_filter(context)
	return context:faction():is_human()
end

local function faction_achieved_victory(context)
	local faction = context:faction()
	if not get_persist_achievement_data(faction, "has_made_treaties") then
		achievement_unlock(faction, achievements.campaign_victory.win_game_without_treaties)
	end

	if is_table(achievements.win_coop_game) then
		for achievement_key, achievement_data in pairs(achievements.win_coop_game) do
			local my_faction_name = faction:name()
			local human_factions = cm:get_human_factions()
			for _, other_faction_name in ipairs(human_factions) do
				if other_faction_name ~= my_faction_name and cm:model():are_factions_coop_allies(my_faction_name, other_faction_name) and
				   ((my_faction_name == achievement_data.first_faction and other_faction_name == achievement_data.second_faction) or
				   (my_faction_name == achievement_data.second_faction and other_faction_name == achievement_data.first_faction))
				then
					achievement_unlock(faction, achievement_key)
				end
			end
		end
	end

	if is_table(achievements.win_game_with_specific_civilization_level) then
		for achievement_key, achievement_data in pairs(achievements.win_game_with_specific_civilization_level) do
			local civilization_level = pillars_civilization.get_current_civilization_level()
			if civilization_level.name == achievement_data.civilization_level then
				achievement_unlock(faction, achievement_key)
			end
		end
	end
end


local function faction_destroys_other_faction_filter(context)
	return context:faction():is_human()
end

local function faction_destroys_other_faction(context)
	local faction = context:faction()
	local destroyed_faction_name = context:other_faction():name()

	if faction:name() == "phar_main_bay" and get_persist_achievement_data(faction, "bay_has_declared_war_on_an_old_ally_" .. destroyed_faction_name)
	then
		-- Clear the decalre-war event, faction has been already destroyd
		persist_achievement_data(faction, "bay_has_declared_war_on_an_old_ally_" .. destroyed_faction_name, false)
		-- Save and check how many old allies we have defeated so far
		local count = track_achievement_progress(faction, "bay_number_of_old_allies_who_have_been_defeated_by_him", true)
		if count == 2 then
			achievement_unlock(faction, achievements.diplomacy.defeat_two_old_allies_bay)
		end
	end

	if is_table(achievements.destroy_factions) then
		for achievement_key, achievement_data in pairs(achievements.destroy_factions) do
			if faction:name() == achievement_data.play_with_faction and destroyed_faction_name == achievement_data.destroyed_faction and
			   (achievement_data.by_turn == nil or cm:model():turn_number() <= achievement_data.by_turn)
			then
				achievement_unlock(faction, achievement_key)
			end
		end
	end

end


local function pooled_resource_transaction_event_filter(context)
	return context:faction():is_human()
end

local function pooled_resource_transaction_event(context)
	local faction = context:faction()
	local resource_key = context:resource():key()
	local resource_value = context:resource():value()

	if is_table(achievements.gain_pooled_resources) then
		for achievement_key, achievement_data in pairs(achievements.gain_pooled_resources) do
			if faction:name() == achievement_data.play_with_faction and resource_key == achievement_data.resource_key and resource_value >= achievement_data.resource_value then
				achievement_unlock(faction, achievement_key)
			end
		end
	end
end


-- achievements based on faction turn end
local function faction_turn_end_filter(context)
	return context:faction():is_human()
end

local function faction_turn_end(context)
	local faction = context:faction()

	if is_table(achievements.bad_attitude_from_their_whole_subculture) then
		for achievement_key, achievement_data in pairs(achievements.bad_attitude_from_their_whole_subculture) do
			if faction:name() == achievement_data.play_with_faction then
				local other_factions_list = faction:factions_of_same_subculture()
				local all_factions_hate_us = true

				for i = 0, other_factions_list:num_items() - 1 do
					local other_faction = other_factions_list:item_at(i)
					if not other_faction:is_excluded_from_cai_diplomacy() then
					-- NOTE: We have to check for the other_faction's attitude towards us, not the other way around
					local attitude = other_faction:diplomatic_attitude_towards(faction:name())
					if attitude > achievement_data.attitude_threshold then
						all_factions_hate_us = false
						break
					end
				end
				end

				if all_factions_hate_us then
					achievement_unlock(faction, achievement_key)
				end
			end
		end
	end

	if is_table(achievements.control_all_ports) then
		for achievement_key, achievement_data in pairs(achievements.control_all_ports) do
			if faction:name() == achievement_data.play_with_faction then
				local faction_controls_all_ports = true

				local region_list = cm:model():world():region_manager():region_list()
				for i = 0, region_list:num_items() - 1 do
					local settlement = region_list:item_at(i):settlement()
					local port_slot = settlement:port_slot()
					if not port_slot:is_null_interface() and port_slot:template_key() == achievement_data.port_template_key then
						if faction:name() ~= settlement:faction():name() then
							faction_controls_all_ports = false
							break
						end
					end
				end

				if faction_controls_all_ports then
					achievement_unlock(faction, achievement_key)
				end
			end
		end
	end

	if is_table(achievements.have_provinces) then
		for achievement_key, achievement_data in pairs(achievements.have_provinces) do
			if faction:name() == achievement_data.play_with_faction and faction:num_provinces() >= achievement_data.count then
				local province_list = faction:province_list()
				local provinces_with_minimum_growth = 0

				for i = 0, province_list:num_items() - 1 do
					local accumulated_growth = province_list:item_at(i):accumulated_growth_for_faction(faction:name())
					if accumulated_growth >= achievement_data.minimum_growth then
						provinces_with_minimum_growth = provinces_with_minimum_growth + 1
					end
				end

				if provinces_with_minimum_growth >= achievement_data.count then
					achievement_unlock(faction, achievement_key)
				end
			end
		end
	end

	local has_unlocked_muwatalli = ancient_legacy_common:faction_has_claimed_legacy(faction:name(), "phar_ancient_legacy_muwatalli")
	if has_unlocked_muwatalli and is_table(achievements.vassals_maxed_out_gratitude_muwatalli) then
		for achievement_key, achievement_data in pairs(achievements.vassals_maxed_out_gratitude_muwatalli) do
			local maxed_out_gratitude_vassals = function(vassals_list)
				local count = 0
				for i = 0, vassals_list:num_items() - 1 do
					local vassal_faction = vassals_list:item_at(i)

					if vassal_faction and (not vassal_faction:is_null_interface()) and
					   vassal_faction:diplomatic_attitude_towards(faction:name()) >= ancient_legacy_muwatalli.utility.get_vassal_gratitude_max_threshold().attitude_lower_bound
					then
						count = count + 1
					end
				end
				return count
			end

			local count = maxed_out_gratitude_vassals(faction:factions_master_of()) + maxed_out_gratitude_vassals(faction:factions_sovereign_of())
			if count >= achievement_data.count then
				achievement_unlock(faction, achievement_key)
			end
		end
	end
end

local function check_survive_with_specific_civilization_level_for_x_turns(faction)
	if is_table(achievements.survive_certain_amount.with_specific_civilization_level) then
		for achievement_key, achievement_data in pairs(achievements.survive_certain_amount.with_specific_civilization_level) do
			if (is_table(achievement_data.faction) and table_contains(achievement_data.faction, faction:name())) then
				local civilization_level = pillars_civilization.get_current_civilization_level()
				if civilization_level.name == achievement_data.civilization_level then
					local count = track_achievement_progress(faction, "survived_with_civilization_level_for_turn_count", true)
					if count >= achievement_data.turn_count then
						achievement_unlock(faction, achievement_key)
					end
				else
					remove_achievement_progress(faction, "survived_with_civilization_level_for_turn_count")
				end
			end
		end
	end
end

local function check_survive_with_specific_tribal_categories_x_turns(faction)
	if not forge_path.is_system_unlocked_by_faction("tribes_privileges", faction:name()) then
		return
	end
	
	local faction_data = tribes_privileges.persistent.factions[faction:name()]
	local bundle_key = faction_data.current_cell_bundle_key
	local num_turns_in_current_tribes_category = faction_data.num_turns_in_current_cell

	if is_table(achievements.survive_certain_amount.with_specific_tribal_category) then
		for achievement_key, achievement_data in pairs(achievements.survive_certain_amount.with_specific_tribal_category) do
			if (is_table(achievement_data.tribe_categories) and table_contains(achievement_data.tribe_categories, bundle_key)) then
				if num_turns_in_current_tribes_category >= achievement_data.turn_count then
					achievement_unlock(faction, achievement_key)
				end
			end
		end
	end
end

local function faction_turn_start_filter(context)
	return context:faction():is_human()
end

local function faction_turn_start(context)
	local faction = context:faction()
	check_survive_with_specific_civilization_level_for_x_turns(faction)
	check_survive_with_specific_tribal_categories_x_turns(faction)
end

local function character_razed_settlement_event_filter(context)
	return context:character():faction():is_human()
end

local function character_razed_settlement_event(context)
	if not is_table(achievements.raze_settlements) then
		return
	end

	-- Until VERSION 0, achievement progress is tracked by slot_template_key_prefix, i.e. how many razed settlements we have with a slot with that slot_template_key_prefix.
	-- That approach is not good because the condition progress key for the whole achievement becomes "phar_main_" which may conflict with so many things.
	-- To keep backwards compatibility, we will use the old progress key rules for VERSION 0 which is only one achievement, and use new approach for new achievements:
	-- New approach: progress_key := raze_settlements;<slot_template_key_prefix>;[optional]<only_track_spoils_of_war>
	local get_achievement_progress_key_from_achievement_data = function(achievement_data)
		if achievement_data.version == 0 then
			return achievement_data.slot_template_key_prefix
		else
			local achievement_progress_key = "raze_settlements;" .. achievement_data.slot_template_key_prefix
			if achievement_data.only_track_spoils_of_war then
				achievement_progress_key = achievement_progress_key .. ";only_track_spoils_of_war"
			end
			return achievement_progress_key
		end
	end

	local achievement_progress_keys = {}
	for _, achievement_data in pairs(achievements.raze_settlements) do
		table_add_unique(achievement_progress_keys, get_achievement_progress_key_from_achievement_data(achievement_data))
	end

	local faction = context:character():faction()
	local building_list = context:garrison_residence():buildings()
	local region_key = context:garrison_residence():region():name()
	local is_war_spoils_region = war_spoils.get_region_config(region_key) ~= nil

	for _, achievement_progress_key in ipairs(achievement_progress_keys) do
		local params = achievement_progress_key:split(";")
		local is_version_0 = params[1] ~= "raze_settlements"
		local slot_template_prefix = is_version_0 and params[1] or params[2]
		local only_track_spoils_of_war = is_version_0 and params[2] or params[3]

		-- We search for at least one slot that matches the criteria. Break out of the inner loop if such is found, otherwise razing this region may get counted more than once
		for i = 0, building_list:num_items() - 1 do
			local slot_template_key = building_list:item_at(i):slot():template_key()

			if string.starts_with(slot_template_key, slot_template_prefix) and (not only_track_spoils_of_war or is_war_spoils_region) then
				track_achievement_progress(faction, achievement_progress_key, true)
				break
			end
		end
	end

	for achievement_key, achievement_data in pairs(achievements.raze_settlements) do
		if is_table(achievement_data.faction) and table_contains(achievement_data.faction, faction:name()) then
			local achievement_progress_key = get_achievement_progress_key_from_achievement_data(achievement_data)

			local count = track_achievement_progress(faction, achievement_progress_key, false)
			if count >= achievement_data.count then
				achievement_unlock(faction, achievement_key)
			end
		end
	end
end


local function character_occupied_ers_event_filter(context)
	return context:character():faction():is_human()
end

local function character_occupied_ers_event(context)
	local faction = context:character():faction()
	local occupation_decision = context:occupation_decision_option()

	local count = track_achievement_progress(faction, "ers_occupation_decision_used_" .. occupation_decision, true)

	if is_table(achievements.occupy_ers) then
		for achievement_key, achievement_data in pairs(achievements.occupy_ers) do
			if faction:name() == achievement_data.play_with_faction and count >= achievement_data.count and occupation_decision == achievement_data.occupation_decision then
				achievement_unlock(faction, achievement_key)
			end
		end
	end
end


local function legitimacy_war_ended_event_filter(context)
	local new_ruling_faction_key = context.stored_table.new_ruling_faction_key
	local new_ruling_faction = cm:get_faction(new_ruling_faction_key)
	return new_ruling_faction:is_human()
end

local function legitimacy_war_ended_event(context)
	local new_ruling_faction_key = context.stored_table.new_ruling_faction_key
	local new_ruling_faction = cm:get_faction(new_ruling_faction_key)

	if is_table(achievements.become_great_king_or_pharaoh) then
		for achievement_key, achievement_data in pairs(achievements.become_great_king_or_pharaoh) do
			if achievement_data.play_with_faction == nil or new_ruling_faction_key == achievement_data.play_with_faction then
				if (achievement_data.become_pharaoh and egypt_political_states:is_pharaoh(new_ruling_faction_key)) or
				   (not achievement_data.become_pharaoh and hatti_political_states:is_great_king(new_ruling_faction_key))
				then
					achievement_unlock(new_ruling_faction, achievement_key)
				end
			end
		end
	end
end


local function character_ancillary_gained_event_filter(context)
	return context:character():faction():is_human()
end

local function character_ancillary_gained_event(context)
	local faction = context:character():faction()
	local ancillary_key = context:ancillary()

	if is_table(achievements.gain_ancillary) then
		for achievement_key, achievement_data in pairs(achievements.gain_ancillary) do
			if faction:name() == achievement_data.play_with_faction and ancillary_key == achievement_data.ancillary_key  then
				achievement_unlock(faction, achievement_key)
			end
		end
	end
end


local function ambition_successfull_event_filter(context)
	return context:faction():is_human()
end

local function ambition_successfull_event(context)
	local faction = context:faction()
	track_achievement_progress(faction, "number_of_completed_ambitions", true)

	if is_table(achievements.complete_ambitions) then
		for achievement_key, achievement_data in pairs(achievements.complete_ambitions) do
			local count = track_achievement_progress(faction, "number_of_completed_ambitions", false)
			if count >= achievement_data.count then
				achievement_unlock(faction, achievement_key)
			end
		end
	end
end


local function tudhaliya_prince_assigned_event_filter(context)
	return context.stored_table.faction:is_human()
end

local function tudhaliya_prince_assigned_event(context)
	local faction = context.stored_table.faction

	if is_table(achievements.assign_princes) then
		for achievement_key, achievement_data in pairs(achievements.assign_princes) do
			local number_of_princes = context.stored_table.num_princes
			if number_of_princes >= achievement_data.count then
				achievement_unlock(faction, achievement_key)
			end
		end
	end
end


local function first_tick_after_world_created_event()
	local faction = cm:get_local_faction(true)
	
	-- Faction can be missing in autoruns, we should just return early in that case
	if not faction then
		return
	end
	
	fill_initial_discovered_realms(faction)
end


local function check_faction_conquered_number_of_settlements(faction)
	track_achievement_progress(faction, "number_of_conquered_settlements", true)
	if is_table(achievements.conquer_settlements.conquer_specific_number_of_settlements) then
		for achievement_key, achievement_data in pairs(achievements.conquer_settlements.conquer_specific_number_of_settlements) do
			if (is_table(achievement_data.faction) and table_contains(achievement_data.faction, faction:name())) then
				local count = track_achievement_progress(faction, "number_of_conquered_settlements", false)
				if count >= achievement_data.count then
					achievement_unlock(faction, achievement_key)
				end
			end
		end
	end
end


local function check_faction_conquered_specific_settlements(faction)
	local region_manager = cm:model():world():region_manager()
	if is_table(achievements.conquer_settlements.conquer_specific_settlements) then
		for achievement_key, achievement_data in pairs(achievements.conquer_settlements.conquer_specific_settlements) do
			if faction:name() == achievement_data.play_with_faction then
				local conquered_all_necessary_settlements = true
				for _, settlement_name in ipairs(achievement_data.settlements_to_conquer) do
					local settlement = region_manager:settlement_by_key("settlement:"..settlement_name)
					if settlement == nil then
						out("Failed to find settlement by key " .. settlement_name)
						conquered_all_necessary_settlements = false
						break
					end
					local settlement_faction = settlement:faction()
					if settlement_faction then
						if settlement_faction:name() ~= faction:name() then
							conquered_all_necessary_settlements = false
							break
						end
					else
						conquered_all_necessary_settlements = false -- no faction means it doesn't belong to this as well
						break
					end
				end
				if conquered_all_necessary_settlements then
					achievement_unlock(faction, achievement_key)
				end
			end
		end
	end
end

local function check_prior_faction_loss(prior_faction)
	if not prior_faction:is_human() then
		return
	end

	if is_table(achievements.lose_settlements.lose_all_settlements) then
		for achievement_key, achievement_data in pairs(achievements.lose_settlements.lose_all_settlements) do
			if (is_table(achievement_data.play_with_factions) and table_contains(achievement_data.play_with_factions, prior_faction:name())) then
				local has_horde_force = false
				local military_force_list = prior_faction:military_force_list()

				for j = 0, military_force_list:num_items() - 1 do
					local military_force = military_force_list:item_at(j);
					if military_force:is_horde() then
						has_horde_force = true
						break
					end
				end
				
				if prior_faction:num_regions() == 0 and (not achievement_data.requires_horde_force or has_horde_force) then
					achievement_unlock(prior_faction, achievement_key)
				end
			end
		end
	end
end


local function character_performs_settlement_occupation_decision_filter(context)
	return context:character():faction():is_human() or context:prior_faction():is_human()
end

local function character_performs_settlement_occupation_decision(context)
	local occupation_decision = context:occupation_decision_option()
	local faction = context:character():faction()
	
	if not faction:is_allowed_to_capture_territory() or
		occupation_decision == "occupation_decision_occupy" or
		occupation_decision == "occupation_decision_loot" or
		occupation_decision == "occupation_decision_colonise"
	then
		local region = context:character():region()
		discover_realm_for_region(faction, region:name())
	end
	
	if occupation_decision == "occupation_decision_occupy" or occupation_decision == "occupation_decision_colonise" or occupation_decision == "occupation_decision_loot" then
		check_faction_conquered_number_of_settlements(faction)
	end
	
	check_faction_conquered_specific_settlements(faction)
	
	local prior_faction = context:prior_faction()
	check_prior_faction_loss(prior_faction)

	if occupation_decision == "occupation_decision_raze_and_exterminate" and forge_path.is_system_unlocked_by_faction("eminence", faction:name()) then
		if is_table(achievements.trigger_eminence_options.raze_and_exterminate) then
			for achievement_key, achievement_data in pairs(achievements.trigger_eminence_options.raze_and_exterminate) do
				local count = track_achievement_progress(faction, "triggered_raze_and_exterminate_option_count", true)
				if count >= achievement_data.trigger_count then
					achievement_unlock(faction, achievement_key)
				end
			end
		end
	end
end


local function region_faction_change_event_filter(context)
	return context:region():owning_faction():is_human()
end

local function region_faction_change_event(context)
	local faction = context:region():owning_faction()
	local region = context:region()
	-- discover realms from a settlement trade or confederation in diplomacy
	if context:reason() == "diplomacy trade" then
		discover_realm_for_region(faction, region:name())
	end
end


local function hatshepsut_trade_made_event_filter(context)
	return context.stored_table.faction:is_human()
end

local function hatshepsut_trade_made_event(context)
	local faction = context.stored_table.faction

	if is_table(achievements.have_trades_hatshepsut) then
		local realm_name = context.stored_table.realm_name
		local home_region = faction:home_region()
		for achievement_key, _ in pairs(achievements.have_trades_hatshepsut) do
			if get_persist_achievement_data(faction, "traded_with_realm_" .. realm_name) then
				break -- already traded with
			end

			persist_achievement_data(faction, "traded_with_realm_" .. realm_name, true)

			local traded_with_all_realms = true
			for _, realm in ipairs(phar_realms.realms) do
				local capital_realm = not home_region:is_null_interface() and phar_realms.get_realm_for_region(home_region:name()) or ""
				if realm.name ~= capital_realm and not get_persist_achievement_data(faction, "traded_with_realm_" .. realm.name) then
					traded_with_all_realms = false
					break
				end
			end

			if traded_with_all_realms then
				achievement_unlock(faction, achievement_key)
			end
		end
	end
end


local function akhenaten_amarna_captured_event_filter(context)
	return context.stored_table.faction:is_human()
end

local function akhenaten_amarna_captured_event(context)
	local faction = context.stored_table.faction

	if is_table(achievements.capture_amarna_akhenaten) then
		for achievement_key, _ in pairs(achievements.capture_amarna_akhenaten) do
			achievement_unlock(faction, achievement_key)
		end
	end
end


local function khufu_wonder_completed_event_filter(context)
	return context.stored_table.faction:is_human()
end

local function khufu_wonder_completed_event(context)
	local faction = context.stored_table.faction

	if is_table(achievements.complete_wonders_khufu) then
		local wonder_key = context.stored_table.wonder_key
		for achievement_key, _ in pairs(achievements.complete_wonders_khufu) do
			if get_persist_achievement_data(faction, "wonder_completed_" .. wonder_key) then
				break -- already completed
			end

			persist_achievement_data(faction, "wonder_completed_" .. wonder_key, true)

			local completed_all_wonders = true
			for _, wonder in ipairs(khufu_config.wonders) do
				if not get_persist_achievement_data(faction, "wonder_completed_" .. wonder.key) then
					completed_all_wonders = false
					break
				end
			end

			if completed_all_wonders then
				achievement_unlock(faction, achievement_key)
			end
		end
	end
end


local function thutmose_conquered_cities_with_each_culmination_event_filter(context)
	return context.stored_table.faction:is_human()
end

local function thutmose_conquered_cities_with_each_culmination_event(context)
	local faction = context.stored_table.faction

	if is_table(achievements.conquer_settlements_with_each_culmination_thutmose) then
		for achievement_key, _ in pairs(achievements.conquer_settlements_with_each_culmination_thutmose) do
			achievement_unlock(faction, achievement_key)
		end
	end
end

local function thutmose_conquered_city_with_each_action_type_event_filter(context)
	return context.stored_table.faction:is_human()
end

local function thutmose_conquered_city_with_each_action_type_event(context)
	local faction = context.stored_table.faction

	if is_table(achievements.conquer_settlements_with_each_action_type_thutmose) then
		for achievement_key, _ in pairs(achievements.conquer_settlements_with_each_action_type_thutmose) do
			achievement_unlock(faction, achievement_key)
		end
	end
end

local function local_deities_god_max_tier_reached_event_filter(context)
	return context.stored_table.faction:is_human()
end

local function local_deities_god_max_tier_reached_event(context)
	local faction = context.stored_table.faction
	local god_key = context.stored_table.god_key

	if not get_persist_achievement_data(faction, "local_deities_god_with_max_tier_" .. god_key) then
		persist_achievement_data(faction, "local_deities_god_with_max_tier_" .. god_key, true)
		track_achievement_progress(faction, "local_deities_god_max_tier_reached", true)
	end

	if is_table(achievements.reach_gods_max_tier) then
		for achievement_key, achievement_data in pairs(achievements.reach_gods_max_tier) do
			local count = track_achievement_progress(faction, "local_deities_god_max_tier_reached", false)
			if achievement_data.play_with_faction == nil or faction:name() == achievement_data.play_with_faction then
				if achievement_data.count ~= nil and achievement_data.count <= count then
					achievement_unlock(faction, achievement_key)
				else
					if is_table(achievement_data.god_keys) and table_contains(achievement_data.god_keys, god_key) then
						local specific_god_key_count = track_achievement_progress(faction, "local_deities_god_max_tier_reached_for_achievement_" .. achievement_key, true)
						if specific_god_key_count >= table_size(achievement_data.god_keys) then
							achievement_unlock(faction, achievement_key)
						end
					end
				end
			end
		end
	end
end


local function force_annexation_used_event_filter(context)
	return context.stored_table.faction:is_human()
end

local function force_annexation_used_event(context)
	local faction = context.stored_table.faction
	local annexed_faction_key = context.stored_table.annexed_faction_key

	if is_table(achievements.force_annex_faction) then
		for achievement_key, achievement_data in pairs(achievements.force_annex_faction) do
			if faction:name() == achievement_data.play_with_faction and annexed_faction_key == achievement_data.annexed_faction_key then
				achievement_unlock(faction, achievement_key)
			end
		end
	end
end


local function corvee_labour_used_event_filter(context)
	return context.stored_table.faction:is_human()
end

local function corvee_labour_used_event(context)
	local faction = context.stored_table.faction

	track_achievement_progress(faction, "corvee_labour_used", true)

	if is_table(achievements.use_corvee_labour) then
		for achievement_key, achievement_data in pairs(achievements.use_corvee_labour) do
			local count = track_achievement_progress(faction, "corvee_labour_used", false)
			if faction:name() == achievement_data.play_with_faction and count >= achievement_data.count then
				achievement_unlock(faction, achievement_key)
			end
		end
	end
end


local function court_position_gained_event_filter(context)
	return context.stored_table.faction:is_human()
end

local function court_position_gained_event(context)
	local faction = context.stored_table.faction

	if is_table(achievements.gain_court_positions) then
		for achievement_key, achievement_data in pairs(achievements.gain_court_positions) do
			if faction:name() == achievement_data.play_with_faction and
			   (achievement_data.court_name == nil or context.stored_table.court_name == achievement_data.court_name) and
			   (not achievement_data.become_great_king or hatti_political_states:is_great_king(faction:name())) and
			   (not achievement_data.become_pharaoh or egypt_political_states:is_pharaoh(faction:name())) and
			   (not achievement_data.fill_all_positions or context.stored_table.faction_filled_all_positions) and
			   (not achievement_data.count or context.stored_table.owned_positions_number >= achievement_data.count)
			then
				achievement_unlock(faction, achievement_key)
			end
		end
	end
end


local function court_intrigue_used_event_filter(context)
	return context.stored_table.faction:is_human()
end

local function court_intrigue_used_event(context)
	local faction = context.stored_table.faction
	local court_name = context.stored_table.court_name

	local count = track_achievement_progress(faction, "intrigues_used_in_court_" .. court_name, true)

	if is_table(achievements.use_court_intrigue) then
		for achievement_key, achievement_data in pairs(achievements.use_court_intrigue) do
			if faction:name() == achievement_data.play_with_faction and count >= achievement_data.count and court_name == achievement_data.court_name then
				achievement_unlock(faction, achievement_key)
			end
		end
	end
end


local function court_action_used_event_filter(context)
	return context.stored_table.acting_faction_obj:is_human()
end

local function court_action_used_event(context)
	local faction = context.stored_table.acting_faction_obj

	local count = track_achievement_progress(faction, "court_actions_used", true, context.stored_table.number_of_actions)

	if is_table(achievements.use_court_actions) then
		for achievement_key, achievement_data in pairs(achievements.use_court_actions) do
			if faction:name() == achievement_data.play_with_faction and count >= achievement_data.count then
				achievement_unlock(faction, achievement_key)
			end
		end
	end
end


local function faction_becomes_our_subject_filter(context)
	local vassalised_faction = context:faction()
	local faction = vassalised_faction:get_sovereign()
	if not faction then
		faction = vassalised_faction:get_master()
	end
	return faction and faction:is_human()
end

local function faction_becomes_our_subject(context)
	local vassalised_faction = context:faction()
	local faction = vassalised_faction:get_sovereign()
	-- NOTE: Vassels are acquired through subjugation, but we also check for get_master() (which checks for vassals) just in case the implementation changes.
	if not faction then
		faction = vassalised_faction:get_master()
	end

	if is_table(achievements.vassalise_factions) then
		for achievement_key, achievement_data in pairs(achievements.vassalise_factions) do
			if faction and faction:name() == achievement_data.play_with_faction and vassalised_faction:name() == achievement_data.vassalised_faction then
				achievement_unlock(faction, achievement_key)
			end
		end
	end
end


local function callback_survive_sea_peoples_invasion_completed(faction)
	if faction == nil or faction:is_null_interface() or not faction:is_human() then
		return
	end

	if is_table(achievements.sea_peoples_invasion) then
		achievement_unlock(faction, achievements.sea_peoples_invasion.survive_sea_peoples_invasion_key)
	else
		output_string("callback_survive_sea_peoples_invasion_completed: no table defined for achievements.sea_peoples_invasion")
	end
end


local function check_sea_people_achievement_for_building_tribal_outpost_in_every_slot(context)
	local faction = context:building():faction()
	local region = context:building():region()
	local province = region:province()
	local region_list = province:regions();

	if is_table(achievements.become_sea_nomad_as_sea_peoples_faction) then
		for achievement_key, achievement_data in pairs(achievements.become_sea_nomad_as_sea_peoples_faction) do
			if (is_table(achievement_data.faction) and table_contains(achievement_data.faction, faction:name())) then
				if achievement_data.nomad_outpost_ers_building_set == nil then
					break -- nomad_outpost_ers_building_set is missing
				end
				if not context:building():belongs_to_building_set(achievement_data.nomad_outpost_ers_building_set) then
					break -- the currently built building is not going to fulfill the requirement, early out.
				end
				local requirements_met = true
				for i = 0, region_list:num_items() - 1 do
					local curr_region = region_list:item_at(i)
					if curr_region:owning_faction():name() == faction:name() then
						requirements_met = false
						break -- We want the sea peoples not to own any of the regions in the province for this achievement
					end
					for j = 0, curr_region:slot_list():num_items() - 1 do
						local slot = curr_region:slot_list():item_at(j)
						if slot:is_infrastructure_slot() then
							-- We're checking an ERS
							if not slot:has_building() then
								requirements_met = false
								break -- ERS slot empty in this region, therefore not all slots are built so no achievement
							end

							if not slot:building():belongs_to_building_set(achievement_data.nomad_outpost_ers_building_set) then
								requirements_met = false
								break
							end
						end
					end
					if requirements_met == false then
						-- The region slot loop found a slot which is not the required building. No need to continue
						break
					end
				end
				if requirements_met then
					achievement_unlock(faction, achievement_key)
				end
			end
		end
	end

end


local function building_completed_event_filter(context)
	return context:building():faction():is_human()
end

local function building_completed_event(context)
	check_sea_people_achievement_for_building_tribal_outpost_in_every_slot(context)
end

local function eminence_obedience_performed_filter(context)
	local faction = cm:get_faction(context.stored_table.faction_key)
	return faction:is_human()
end

local function eminence_obedience_performed(context)
	local faction = cm:get_faction(context.stored_table.faction_key)
	if is_table(achievements.trigger_eminence_options.obedience) and forge_path.is_system_unlocked_by_faction("eminence", faction:name()) then
		for achievement_key, achievement_data in pairs(achievements.trigger_eminence_options.obedience) do
			local count = track_achievement_progress(faction, "triggered_obedience_option_count", true)
			if count >= achievement_data.trigger_count then
				achievement_unlock(faction, achievement_key)
			end
		end
	end
end

local function eminence_display_of_power_performed_filter(context)
	local faction = cm:get_faction(context.stored_table.faction_key)
	return faction:is_human()
end

local function eminence_display_of_power_performed(context)
	local faction = cm:get_faction(context.stored_table.faction_key)
	if is_table(achievements.trigger_eminence_options.display_of_power) and forge_path.is_system_unlocked_by_faction("eminence", faction:name()) then
		for achievement_key, achievement_data in pairs(achievements.trigger_eminence_options.display_of_power) do
			local count = track_achievement_progress(faction, "triggered_display_of_power_option_count", true)
			if count >= achievement_data.trigger_count then
				achievement_unlock(faction, achievement_key)
			end
		end
	end
end

local function faction_bribes_unit_filter(context)
	return context:faction():is_human()
end

local function faction_bribes_unit(context)
	local faction = context:faction()
	if is_table(achievements.trigger_eminence_options.change_allegiance) and forge_path.is_system_unlocked_by_faction("eminence", faction:name()) then
		for achievement_key, achievement_data in pairs(achievements.trigger_eminence_options.change_allegiance) do
			local count = track_achievement_progress(faction, "triggered_change_allegiance_option_count", true)
			if count >= achievement_data.trigger_count then
				achievement_unlock(faction, achievement_key)
			end
		end
	end
end

local function achievements_init()
	output_debug_string("init")

	-- callbacks setup
	achievements.sea_peoples_invasion.func_survive_sea_peoples_invasion_completed = callback_survive_sea_peoples_invasion_completed
end


-- listen for when a sea peoples faction becomes a sea nomad by building tribal outpost in every slot in foreign land
core:add_listener(
	"phar_campaign_achievements_building_completed_event",
	"BuildingCompleted",
	building_completed_event_filter,
	building_completed_event,
	true
)


-- positive diplomatic event
core:add_listener(
	"phar_campaign_achievements_positive_diplomatic_event",
	"PositiveDiplomaticEvent",
	positive_diplomatic_event_filter,
	positive_diplomatic_event,
	true
)


-- negative diplomatic event
core:add_listener(
	"troy_campaign_achievements_negative_diplomatic_event",
	"NegativeDiplomaticEvent",
	negative_diplomatic_event_filter,
	negative_diplomatic_event,
	true
)


-- faction completed event
core:add_listener(
	"phar_campaign_achievements_faction_achieved_victory_event",
	"FactionAchievedVictoryEvent",
	faction_achieved_victory_filter,
	faction_achieved_victory,
	true
)


-- faction destroyed another faction
core:add_listener(
	"phar_campaign_achievements_faction_destroys_other_faction",
	"FactionDestroysOtherFaction",
	faction_destroys_other_faction_filter,
	faction_destroys_other_faction,
	true
)


-- resource transaction event
core:add_listener(
	"phar_campaign_achievements_pooled_resource_transaction_event",
	"PooledResourceTransactionEvent",
	pooled_resource_transaction_event_filter,
	pooled_resource_transaction_event,
	true
)


-- faction turn end event
core:add_listener(
	"phar_campaign_achievements_faction_turn_end",
	"FactionTurnEnd",
	faction_turn_end_filter,
	faction_turn_end,
	true
)


-- faction turn start event
core:add_listener(
	"phar_campaign_achievements_faction_turn_start",
	"FactionTurnStart",
	faction_turn_start_filter,
	faction_turn_start,
	true
)


-- razing a settlement event
core:add_listener(
	"phar_campaign_achievements_character_razed_settlement_event",
	"CharacterRazedSettlement",
	character_razed_settlement_event_filter,
	character_razed_settlement_event,
	true
)


-- occupying an ERS event
core:add_listener(
	"phar_campaign_achievements_character_occupied_ers_event",
	"CharacterPerformsRegionSlotOccupationDecision",
	character_occupied_ers_event_filter,
	character_occupied_ers_event,
	true
)


-- legitimacy war ended event
core:add_listener(
	"phar_campaign_achievements_legitimacy_war_ended_event",
	"ScriptEventLegitimacyWarEnded",
	legitimacy_war_ended_event_filter,
	legitimacy_war_ended_event,
	true
)


-- gaining an ancillary event
core:add_listener(
	"phar_campaign_achievements_character_ancillary_gained_event",
	"CharacterAncillaryGained",
	character_ancillary_gained_event_filter,
	character_ancillary_gained_event,
	true
)


-- completing an ambition successfully
core:add_listener(
	"phar_campaign_achievements_ambition_successfull_event",
	"ScriptEventAmbitionSuccessful",
	ambition_successfull_event_filter,
	ambition_successfull_event,
	true
)


-- assigning a prince in Tudhaliya ancient legacy
core:add_listener(
	"phar_campaign_achievements_tudhaliya_prince_assigned_event",
	"ScriptEventTudhaliyaPrinceAssigned",
	tudhaliya_prince_assigned_event_filter,
	tudhaliya_prince_assigned_event,
	true
)


core:add_listener (
	"phar_campaign_achievements_first_tick_after_world_created_event",
	"FirstTickAfterWorldCreated",
	true,
	first_tick_after_world_created_event,
	true
)


core:add_listener (
	"phar_campaign_achievements_character_performs_settlement_occupation_decision",
	"CharacterPerformsSettlementOccupationDecision",
	character_performs_settlement_occupation_decision_filter,
	character_performs_settlement_occupation_decision,
	true
)


core:add_listener (
	"phar_campaign_achievements_region_faction_change_event",
	"RegionFactionChangeEvent",
	region_faction_change_event_filter,
	region_faction_change_event,
	true
)


core:add_listener(
	"phar_campaign_achievements_hatshepsut_trade_made_event",
	"ScriptEventHatshepsutTradeMade",
	hatshepsut_trade_made_event_filter,
	hatshepsut_trade_made_event,
	true
)


core:add_listener(
	"phar_campaign_achievements_akhenaten_amarna_captured_event",
	"ScriptEventAkhenatenAmarnaCaptured",
	akhenaten_amarna_captured_event_filter,
	akhenaten_amarna_captured_event,
	true
)


core:add_listener(
	"phar_campaign_achievements_khufu_wonder_completed_event",
	"ScriptEventKhufuWonderCompleted",
	khufu_wonder_completed_event_filter,
	khufu_wonder_completed_event,
	true
)


core:add_listener(
	"phar_campaign_achievements_thutmose_conquered_cities_with_each_culmination_event",
	"ScriptEventThutmoseConqueredCitiesWithEachCulmination",
	thutmose_conquered_cities_with_each_culmination_event_filter,
	thutmose_conquered_cities_with_each_culmination_event,
	true
)

core:add_listener(
	"phar_campaign_achievements_thutmose_conquered_city_with_each_action_type_event",
	"ScriptEventThutmoseConqueredWithEachActionType",
	thutmose_conquered_city_with_each_action_type_event_filter,
	thutmose_conquered_city_with_each_action_type_event,
	true
)

core:add_listener(
	"phar_campaign_achievements_local_deities_god_max_tier_reached_event",
	"ScriptEventLocalDeitiesGodMaxTierReached",
	local_deities_god_max_tier_reached_event_filter,
	local_deities_god_max_tier_reached_event,
	true
)


core:add_listener(
	"phar_campaign_achievements_force_annexation_used_event",
	"ScriptEventForceAnnexationUsed",
	force_annexation_used_event_filter,
	force_annexation_used_event,
	true
)


core:add_listener(
	"phar_campaign_achievements_corvee_labour_used_event",
	"ScriptEventCorveeLabourUsed",
	corvee_labour_used_event_filter,
	corvee_labour_used_event,
	true
)


core:add_listener(
	"phar_campaign_achievements_court_position_gained_event",
	"ScriptEventCourtPositionGained",
	court_position_gained_event_filter,
	court_position_gained_event,
	true
)


core:add_listener(
	"phar_campaign_achievements_court_intrigue_used_event",
	"ScriptEventCourtIntrigueUsed",
	court_intrigue_used_event_filter,
	court_intrigue_used_event,
	true
)


core:add_listener(
	"phar_campaign_achievements_court_action_used_event",
	"CourtActionTriggerScriptEvent",
	court_action_used_event_filter,
	court_action_used_event,
	true
)


core:add_listener(
	"phar_campaign_achievements_faction_becomes_our_subject",
	"FactionBecomesSubject",
	faction_becomes_our_subject_filter,
	faction_becomes_our_subject,
	true
)

core:add_listener(
	"phar_campaign_achievements_eminence_obedience_performed",
	"ScriptEventEminenceObediencePerformed",
	eminence_obedience_performed_filter,
	eminence_obedience_performed,
	true
)

core:add_listener(
	"phar_campaign_achievements_eminence_display_of_power_performed",
	"ScriptEventEminenceDisplayOfPowerPerformed",
	eminence_display_of_power_performed_filter,
	eminence_display_of_power_performed,
	true
)

core:add_listener(
	"phar_campaign_achievements_faction_bribes_unit",
	"FactionBribesUnit",
	faction_bribes_unit_filter,
	faction_bribes_unit,
	true
)

--
achievements_init()