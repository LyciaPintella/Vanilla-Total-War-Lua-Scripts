out("Loading troy_favour.lua")

epic_hero_subtypes = {
	troy_achilles = true,
	troy_aeneas = true,
	troy_agamemnon = true,
	troy_hector = true,
	troy_hippolyta = true,
	troy_menelaus = true,
	troy_odysseus = true,
	troy_paris = true,
	troy_penthesilea = true,
	troy_sarpedon = true
}


troy_god_attitudes = {
	"troy_god_attitude_aphrodite",
	"troy_god_attitude_apollo",
	"troy_god_attitude_ares",
	"troy_god_attitude_athena",
	"troy_god_attitude_hera",
	"troy_god_attitude_poseidon",
	"troy_god_attitude_zeus",
	"troy_god_attitude_artemis",
	"troy_god_attitude_hephaestus",
};

function get_god_attitude_for_faction(faction, attitude_key)
	local attidude = 0;
	if faction:has_pooled_resource(attitude_key) then
		attitude = faction:pooled_resource(attitude_key):value();
	end;
	return attitude
end;

function get_highest_god_attitude_for_faction(faction)
	local highest_attitude_key, highest_attitude_value;

	for i = 1, #troy_god_attitudes do
		local current_attitude_value = get_god_attitude_for_faction(faction, troy_god_attitudes[i]);
		if not highest_attitude_value and current_attitude_value then
			-- we have a current value and no highest has been recorded
			highest_attitude_value = current_attitude_value;
			highest_attitude_key = troy_god_attitudes[i];
		elseif current_attitude_value > highest_attitude_value then
			-- current value is higher than the highest value
			highest_attitude_value = current_attitude_value;
			highest_attitude_key = troy_god_attitudes[i];
		end;
	end;

	return highest_attitude_key, highest_attitude_value;
end;

function get_lowest_god_attitude_for_faction(faction)
	local lowest_attitude_key, lowest_attitude_value;

	for i = 1, #troy_god_attitudes do
		local current_attitude_value = get_god_attitude_for_faction(faction, troy_god_attitudes[i]);
		if not lowest_attitude_value and current_attitude_value then
			-- we have a current value and no lowest has been recorded
			lowest_attitude_value = current_attitude_value;
			lowest_attitude_key = troy_god_attitudes[i];
		elseif current_attitude_value < lowest_attitude_value then
			-- current value is lower than the lowest value
			lowest_attitude_value = current_attitude_value;
			lowest_attitude_key = troy_god_attitudes[i];
		end;
	end;

	return lowest_attitude_key, lowest_attitude_value;
end;


function add_favour_listeners()
	out("Listener for Favour gain/loss started")

	core:add_listener (
		"Troy_battle_favour",
		"CharacterCompletedBattle",
		is_general,
		favour_from_battle,
		true
	)

	core:add_listener (
		"Troy_temple_completed_favour",
		"BuildingCompleted",
		true,
		function(context) favour_from_buildings(context:building(), false) end,
		true
	)

	core:add_listener (
		"Troy_horde_temple_completed_favour",
		"CharacterMilitaryForceBuildingCompleted",
		true,
		function(context) favour_from_buildings(context:building(), false) end,
		true
	)

	core:add_listener (
		"Troy_temple_demolished_horde_favour",
		"CharacterMilitaryForceBuildingDemolished",
		true,
		function(context) favour_from_buildings(context:building(), true) end,
		true
	)

	core:add_listener (
		"Troy_temple_demolished_favour",
		"BuildingDemolished",
		true,
		function(context) favour_from_buildings(context:building(), true) end,
		true
	)

	core:add_listener (
		"Troy_settlement_razed_favour",
		"CharacterRazedSettlement",
		true,
		favour_from_razing,
		true
	)

	core:add_listener (
		"Troy_settlement_occupied_favour",
		"CharacterPerformsSettlementOccupationDecision",
		true,
		favour_from_occupying,
		true
	)

	core:add_listener (
		"Troy_character_created_favour",
		"CharacterCreated",
		true,
		favour_from_char_creation,
		true
	)

	core:add_listener (
		"Troy_overcomes_other_faction_favour",
		"FactionOvercomesOtherFaction",
		true,
		favour_from_overcoming,
		true
	)

	core:add_listener (
		"Troy_faction_loses_settlement_favour",
		"RegionFactionChangeEvent",
		true,
		favour_from_losing_settlement,
		true
	)

	core:add_listener (
		"Troy_agent_action_favour",
		"CharacterCharacterTargetAction",
		is_success,
		favour_from_agent_action,
		true
	)

	core:add_listener (
		"Troy_positive_diplomacy_favour",
		"PositiveDiplomaticEvent",
		true,
		favour_from_positive_diplomacy,
		true
	)

	core:add_listener (
		"Troy_negative_diplomacy_favour",
		"NegativeDiplomaticEvent",
		true,
		favour_from_negative_diplomacy,
		true
	)

end


function favour_from_battle(context)

	local battle = context:pending_battle()
	local attacker = battle:attacker():faction()
	local defender = battle:defender():faction()
	local attacker_outcome = battle:attacker_battle_result()
	local defender_outcome = battle:defender_battle_result()
	local attacking_character = battle:attacker()
	local defending_character = battle:defender()
	local apply_for_attacker
	if attacker:is_human() or defender:is_human() then 
		return
	end

	if context:character() == attacking_character then
		apply_for_attacker = true
	else
		apply_for_attacker = false
	end

	if (apply_for_attacker and attacker:is_rebel()) or ((not apply_for_attacker) and defender:is_rebel()) then
		return
	end

		if attacking_character:is_wounded() and not apply_for_attacker then
			-- apply_pending_battle_transaction_conflict(defender,"troy_god_attitude_hera",gods_factors.battles,character_wounded_favour,gain_construction_2["hera"].loc_key)
			apply_pending_battle_transaction_conflict(defender,"troy_god_attitude_hera",gods_factors.battles,character_wounded_favour)
		end

		if defending_character:is_wounded() and apply_for_attacker then
			-- apply_pending_battle_transaction_conflict(attacker,"troy_god_attitude_hera",gods_factors.battles,character_wounded_favour,gain_construction_2["hera"].loc_key)
			apply_pending_battle_transaction_conflict(attacker,"troy_god_attitude_hera",gods_factors.battles,character_wounded_favour)
		end

		if string.find(attacker_outcome, '_victory') and apply_for_attacker then

			-- Grant favour to the attacker if he won

			-- apply_pending_battle_transaction_conflict(attacker,"troy_god_attitude_zeus",gods_factors.battles,victory_favour,gain_battle_1["zeus"].loc_key)
			apply_pending_battle_transaction_conflict(attacker,"troy_god_attitude_zeus",gods_factors.battles,victory_favour)

			-- Check if the battle is between epic heroes
			if is_epic_hero(attacking_character) and is_epic_hero(defending_character) then
				-- apply_pending_battle_transaction_conflict(attacker,"troy_god_attitude_zeus",gods_factors.battles,epic_hero_vs_favour,gain_construction_2["zeus"].loc_key)
				apply_pending_battle_transaction_conflict(attacker,"troy_god_attitude_zeus",gods_factors.battles,epic_hero_vs_favour)
			end

			-- Check if the battle was at sea
			if battle:naval_battle() then
				-- apply_pending_battle_transaction_conflict(attacker,"troy_god_attitude_poseidon",gods_factors.battles,naval_battle_favour,gain_construction_2["poseidon"].loc_key)
				apply_pending_battle_transaction_conflict(attacker,"troy_god_attitude_poseidon",gods_factors.battles,naval_battle_favour)
			end

			-- Apply additional favour for pyrrhic/decisive outcomes
			if attacker_outcome == "pyrrhic_victory" then
				-- apply_pending_battle_transaction_conflict(attacker,"troy_god_attitude_ares",gods_factors.battles,pyrrhic_victory_favour,gain_construction_2["ares"].loc_key)
				apply_pending_battle_transaction_conflict(attacker,"troy_god_attitude_ares",gods_factors.battles,pyrrhic_victory_favour)
			elseif attacker_outcome == "decisive_victory" then
				-- apply_pending_battle_transaction_conflict(attacker,"troy_god_attitude_athena",gods_factors.battles,decisive_victory_favour,gain_construction_2["athena"].loc_key)
				apply_pending_battle_transaction_conflict(attacker,"troy_god_attitude_athena",gods_factors.battles,decisive_victory_favour)
			end

		elseif string.find(attacker_outcome, '_defeat') and apply_for_attacker then  -- If attacker didn't win

			-- Deduct favour to the attacker because he lost
			-- apply_pending_battle_transaction_conflict(attacker,"troy_god_attitude_zeus",gods_factors.battles,defeat_favour,gods_panel_tooltip_loss_title["zeus"].loc_key)
			apply_pending_battle_transaction_conflict(attacker,"troy_god_attitude_zeus",gods_factors.battles,defeat_favour)

			if battle:naval_battle() then
				-- apply_pending_battle_transaction_conflict(attacker,"troy_god_attitude_poseidon",gods_factors.battles,defeat_naval_battle_favour,gods_panel_tooltip_loss_title["poseidon"].loc_key)
				apply_pending_battle_transaction_conflict(attacker,"troy_god_attitude_poseidon",gods_factors.battles,defeat_naval_battle_favour)
			end

			-- Apply additional favour for close/decisive outcomes
			if attacker_outcome == "close_defeat" then
				-- apply_pending_battle_transaction_conflict(attacker,"troy_god_attitude_ares",gods_factors.battles,close_defeat_favour,gods_panel_tooltip_loss_title["ares"].loc_key)
				apply_pending_battle_transaction_conflict(attacker,"troy_god_attitude_ares",gods_factors.battles,close_defeat_favour)
			elseif attacker_outcome == "decisive_defeat" then
				-- apply_pending_battle_transaction_conflict(attacker,"troy_god_attitude_athena",gods_factors.battles,decisive_defeat_favour,gain_agent_1["athena"].loc_key)
				apply_pending_battle_transaction_conflict(attacker,"troy_god_attitude_athena",gods_factors.battles,decisive_defeat_favour)
			end

		end

		if string.find(defender_outcome, '_victory') and not apply_for_attacker then

			-- Grant favour to the defender if he won
			-- apply_pending_battle_transaction_conflict(defender,"troy_god_attitude_apollo",gods_factors.battles,defender_victory_favour,gain_battle_1["apollo"].loc_key)
			apply_pending_battle_transaction_conflict(defender,"troy_god_attitude_apollo",gods_factors.battles,defender_victory_favour)

			-- Check if the battle is between epic heroes
			if is_epic_hero(attacking_character) and is_epic_hero(defending_character) then
				-- apply_pending_battle_transaction_conflict(defender,"troy_god_attitude_zeus",gods_factors.battles,epic_hero_vs_favour,gain_construction_2["zeus"].loc_key)
				apply_pending_battle_transaction_conflict(defender,"troy_god_attitude_zeus",gods_factors.battles,epic_hero_vs_favour)
			end

			-- Check if the battle was at sea
			if battle:naval_battle() then
				-- apply_pending_battle_transaction_conflict(defender,"troy_god_attitude_poseidon",gods_factors.battles,naval_battle_favour,gain_construction_2["poseidon"].loc_key)
				apply_pending_battle_transaction_conflict(defender,"troy_god_attitude_poseidon",gods_factors.battles,naval_battle_favour)
			end

			-- Apply additional favour for pyrrhic/decisive outcomes
			if defender_outcome == "pyrrhic_victory" then
				-- apply_pending_battle_transaction_conflict(defender,"troy_god_attitude_ares",gods_factors.battles,pyrrhic_victory_favour,gain_construction_2["ares"].loc_key)
				apply_pending_battle_transaction_conflict(defender,"troy_god_attitude_ares",gods_factors.battles,pyrrhic_victory_favour)
			elseif defender_outcome == "decisive_victory" then
				-- apply_pending_battle_transaction_conflict(defender,"troy_god_attitude_athena",gods_factors.battles,decisive_victory_favour,gain_construction_2["athena"].loc_key)
				apply_pending_battle_transaction_conflict(defender,"troy_god_attitude_athena",gods_factors.battles,decisive_victory_favour)
			end

		elseif string.find(defender_outcome, '_defeat') and not apply_for_attacker then

			-- Deduct favour from the defender if he lost
			-- apply_pending_battle_transaction_conflict(defender,"troy_god_attitude_apollo",gods_factors.battles,defeat_favour,loss_battle_1["apollo"].loc_key)
			apply_pending_battle_transaction_conflict(defender,"troy_god_attitude_apollo",gods_factors.battles,defeat_favour)

			-- Check if the battle was at sea
			if battle:naval_battle() then
				-- apply_pending_battle_transaction_conflict(defender,"troy_god_attitude_poseidon",gods_factors.battles,defeat_naval_battle_favour,gods_panel_tooltip_loss_title["poseidon"].loc_key)
				apply_pending_battle_transaction_conflict(defender,"troy_god_attitude_poseidon",gods_factors.battles,defeat_naval_battle_favour)
			end

			-- Apply additional favour for close/decisive outcomes
			if defender_outcome == "close_defeat" then
				-- apply_pending_battle_transaction_conflict(defender,"troy_god_attitude_ares",gods_factors.battles,close_defeat_favour,gods_panel_tooltip_loss_title["ares"].loc_key)
				apply_pending_battle_transaction_conflict(defender,"troy_god_attitude_ares",gods_factors.battles,close_defeat_favour)
			elseif defender_outcome == "decisive_defeat" then
				-- apply_pending_battle_transaction_conflict(defender,"troy_god_attitude_athena",gods_factors.battles,decisive_defeat_favour,gain_agent_1["athena"].loc_key)
				apply_pending_battle_transaction_conflict(defender,"troy_god_attitude_athena",gods_factors.battles,decisive_defeat_favour)
			end

		end
end


-- building argument can be either BUILDING_SCRIPT_INTERFACE or MILITARY_FORCE_BUILDING_SCRIPT_INTERFACE
function favour_from_buildings(building, is_negative)
	local faction = building:faction()
	local target
	local amount
	local secondary_detail
	local is_temple = string.find(building:chain(),'religion')
		-- Check if the building in question provides favour
		for _,effect_key in pairs(gods_effects) do

			amount = building:get_effect_value(effect_key)

			-- Apply modifier from Achilles' mood
			if is_temple and (not is_negative) and (faction:name() == achilles_faction) and (troy_achilles_current_mood == "depressed") then
				amount = amount * achilles_mood_depressed_favour_bonus
			end

			if is_negative then
				amount = amount*(-1)
			end

			-- Apply the favour change
			if not (amount == 0) then
				target = effect_key
				target = string.gsub(target,"troy_effect_gods_favour_mod_","troy_god_attitude_")
				local target_god = string.gsub(target, "troy_god_attitude_", "")
				if is_temple and is_negative then
					-- apply_transaction_conflict_and_spawn_event(faction,target,gods_factors.temples,amount,loss_construction_1[target_god].loc_key)
					apply_transaction_conflict_and_spawn_event(faction,target,gods_factors.temples,amount)
				elseif not is_temple and is_negative then
					-- apply_transaction_conflict_and_spawn_event(faction,target,gods_factors.buildings,amount,loss_construction_2[target_god].loc_key)
					 apply_transaction_conflict_and_spawn_event(faction,target,gods_factors.buildings,amount)
				elseif is_temple and not is_negative then
					-- apply_transaction_conflict_and_spawn_event(faction,target,gods_factors.temples,amount,gain_construction_1[target_god].loc_key)
					apply_transaction_conflict_and_spawn_event(faction,target,gods_factors.temples,amount)
				elseif not is_temple and not is_negative then
					-- apply_transaction_conflict_and_spawn_event(faction,target,gods_factors.buildings,amount,gain_construction_2[target_god].loc_key)
					apply_transaction_conflict_and_spawn_event(faction,target,gods_factors.buildings,amount)
				end
			end

		end
end

function favour_from_razing(context)
	local faction = context:character():faction()
	
	if faction:is_human() then
		return
	end
	
	apply_transaction_conflict_and_spawn_event(faction,"troy_god_attitude_poseidon",gods_factors.campaign_adventures,city_razed_favour)
end

function favour_from_occupying(context)

	local decision = context:occupation_decision_option()
	local faction = context:character():faction()
	local province = context:garrison_residence():region():province_name()

	if faction:is_human() then 
		return 
	end

	if decision == "occupation_decision_occupy" then
		-- If the selected occupation option is the one we are interested in give favour
		-- apply_transaction_conflict_and_spawn_event(faction,"troy_god_attitude_hera",gods_factors.campaign_adventures,region_captured_favour,gain_battle_1["hera"].loc_key)
		apply_transaction_conflict_and_spawn_event(faction,"troy_god_attitude_hera",gods_factors.campaign_adventures,region_captured_favour)
	end

	if faction:holds_entire_province(province,false) then
		-- Additionally if the faction now holds the entire province apply favour changes
		-- apply_transaction_conflict_and_spawn_event(faction,"troy_god_attitude_hera",gods_factors.campaign_adventures,province_completed_favour,gods_panel_tooltip_loss_title["hera"].loc_key)
		apply_transaction_conflict_and_spawn_event(faction,"troy_god_attitude_hera",gods_factors.campaign_adventures,province_completed_favour)
	end

end

function favour_from_losing_settlement(context)

	local previous_faction = context:previous_faction()
	local buildings = context:region():slot_list()
	local target
	local amount
	for i=0, buildings:num_items()-1 do
		local current_building = buildings:item_at(i):building()
		if not current_building:is_null_interface() then
			for _,effect_key in pairs(gods_effects) do
				-- Query if the building provides favour in the first place
				amount = current_building:get_effect_value(effect_key)
				if not (amount == 0) then
					-- If the building does provide favour apply appropriate changes
					local is_temple = string.find(current_building:chain(),'religion')
					amount = amount * -1
					target = effect_key
					target = string.gsub(target,"troy_effect_gods_favour_mod_","troy_god_attitude_")
					local target_god = string.gsub(target, "troy_god_attitude_", "")
					if is_temple then
						-- apply_transaction_conflict_and_spawn_event(previous_faction,target,gods_factors.temples,amount,loss_construction_1[target_god].loc_key)
						apply_transaction_conflict_and_spawn_event(previous_faction,target,gods_factors.temples,amount)
					elseif not is_temple then
						-- apply_transaction_conflict_and_spawn_event(previous_faction,target,gods_factors.buildings,amount,loss_construction_2[target_god].loc_key)
						apply_transaction_conflict_and_spawn_event(previous_faction,target,gods_factors.buildings,amount)
					end
				end
			end
		end
	end

end

function favour_from_char_creation(context)
	local character = context:character():character_type_key()
	local faction = context:character():faction()

	if faction:is_rebel() or faction:is_human() then 
		return 
	end

	if character == "general" then
		-- If the character in question is a general apply appropriate changes
		-- apply_transaction_conflict_and_spawn_event(faction,"troy_god_attitude_aphrodite",gods_factors.agents,character_created_favour,gods_panel_tooltip_gain_title["aphrodite"].loc_key)
		apply_transaction_conflict_and_spawn_event(faction,"troy_god_attitude_aphrodite",gods_factors.agents,character_created_favour)
	elseif character == "champion" or character == "dignitary" or character == "engineer" or character == "runesmith" or character == "spy" or character == "wizard" then
		-- Otherwise apply appropriate changes for agent
		-- apply_transaction_conflict_and_spawn_event(faction,"troy_god_attitude_aphrodite",gods_factors.agents,agent_created_favour,gain_construction_1["aphrodite"].loc_key)
		apply_transaction_conflict_and_spawn_event(faction,"troy_god_attitude_aphrodite",gods_factors.agents,agent_created_favour)
	end
end

function favour_from_overcoming(context)
	local faction = context:faction()
	if faction:is_human() then 
		return 
	end
	-- apply_transaction_conflict_and_spawn_event(faction,"troy_god_attitude_zeus",gods_factors.campaign_adventures,faction_overcome_favour,gain_battle_2["zeus"].loc_key)
	apply_transaction_conflict_and_spawn_event(faction,"troy_god_attitude_zeus",gods_factors.campaign_adventures,faction_overcome_favour)
end

function favour_from_agent_action(context)
	local character = context:character():faction()
	local target_character = context:target_character():faction()
	
	if character:is_human() or target_character:is_human() then
		return
	end

	-- apply_transaction_conflict_and_spawn_event(character,"troy_god_attitude_aphrodite",gods_factors.agents,agent_action_actor_favour,gain_construction_1["aphrodite"].loc_key)
	apply_transaction_conflict_and_spawn_event(character,"troy_god_attitude_aphrodite",gods_factors.agents,agent_action_actor_favour)

	-- apply_transaction_conflict_and_spawn_event(target_character,"troy_god_attitude_aphrodite",gods_factors.agents,agent_action_target_favour,gain_campaign_3["aphrodite"].loc_key)
	apply_transaction_conflict_and_spawn_event(target_character,"troy_god_attitude_aphrodite",gods_factors.agents,agent_action_target_favour)

end

function is_epic_hero(character)
	if character:character_type("general" ) and epic_hero_subtypes[character:character_subtype_key()] then
		return true
	else
		return false
	end
end

function is_success(context)
	if context:mission_result_success() or context:mission_result_critial_success() then
		return true
	else
		return false
	end
end

function is_general(context)
	local character = context:character()
	if character:character_type("general") then
		return true
	else
		return false
	end
end

function favour_from_positive_diplomacy(context)
	local proposer = context:proposer()
	local recipient = context:recipient()
	
	if proposer:is_human() or recipient:is_human() then
		return 
	end
	-- Check what aggreement was signed
		if context:is_barter_agreement() then
			-- Apply appropriate favour changes for both sides
			if context:character() == proposer:faction_leader() then
				-- apply_transaction_conflict_and_spawn_event(proposer,"troy_god_attitude_apollo",gods_factors.campaign_adventures,trade_agreement_established_favour,gods_panel_tooltip_gain_title["apollo"].loc_key)
				apply_transaction_conflict_and_spawn_event(proposer,"troy_god_attitude_apollo",gods_factors.campaign_adventures,trade_agreement_established_favour)
			end

			if context:character() == recipient:faction_leader() then
				-- apply_transaction_conflict_and_spawn_event(recipient,"troy_god_attitude_apollo",gods_factors.campaign_adventures,(trade_agreement_established_favour/2),gain_campaign_1["apollo"].loc_key)
				apply_transaction_conflict_and_spawn_event(recipient,"troy_god_attitude_apollo",gods_factors.campaign_adventures,(trade_agreement_established_favour/2))
			end

		elseif context:is_peace_treaty() then

			if context:character() == proposer:faction_leader() then
				-- apply_transaction_conflict_and_spawn_event(proposer,"troy_god_attitude_athena",gods_factors.campaign_adventures,peace_treaty_signed_favour,gain_battle_1["athena"].loc_key)
				apply_transaction_conflict_and_spawn_event(proposer,"troy_god_attitude_athena",gods_factors.campaign_adventures,peace_treaty_signed_favour)
			end

			if context:character() == recipient:faction_leader() then
				-- apply_transaction_conflict_and_spawn_event(recipient,"troy_god_attitude_athena",gods_factors.campaign_adventures,(peace_treaty_signed_favour/2),gods_panel_tooltip_gain_title["athena"].loc_key)
				apply_transaction_conflict_and_spawn_event(recipient,"troy_god_attitude_athena",gods_factors.campaign_adventures,(peace_treaty_signed_favour/2))
			end

		end
end

function favour_from_negative_diplomacy(context)
	local proposer = context:proposer()
	local recipient = context:recipient()

	if proposer:is_human() or recipient:is_human() then
		return 
	end
	-- Check what aggreement was broken/ what declaration was issued
		if context:is_war() then

			if context:character() == proposer:faction_leader() then
				-- apply_transaction_conflict_and_spawn_event(proposer,"troy_god_attitude_ares",gods_factors.campaign_adventures,war_declaration_favour,gain_battle_1["ares"].loc_key)
				apply_transaction_conflict_and_spawn_event(proposer,"troy_god_attitude_ares",gods_factors.campaign_adventures,war_declaration_favour)
			end

		elseif context:was_barter_agreement() then

			if context:character() == proposer:faction_leader() then
				-- apply_transaction_conflict_and_spawn_event(proposer,"troy_god_attitude_apollo",gods_factors.campaign_adventures,trade_agreement_dissolved_favour,gods_panel_tooltip_loss_title["apollo"].loc_key)
				apply_transaction_conflict_and_spawn_event(proposer,"troy_god_attitude_apollo",gods_factors.campaign_adventures,trade_agreement_dissolved_favour)
			end

		end
end

function apply_conflict(faction_name,resource_key,amount,original_factor)
	-- Fetch the god object
	local god = cm:model():world():god_manager():god_by_resource_key(resource_key)
	-- If the god does not participate in the conflict do nothing
	if not god:participate_in_conflict() then
		return
	end

	-- If the god does participate it's time to go over the conflict
	local left_side = cm:model():world():god_manager():conflict_participants_on_left()
	local right_side = cm:model():world():god_manager():conflict_participants_on_right()
	local god_side = god:conflict_side()
	-- If the god in question is on the left side of the conflict we should apply conflict for right side
	if god_side == "left" then
		for i=0,right_side:num_items()-1 do
			cm:faction_add_pooled_resource(faction_name,right_side:item_at(i):resource_key(),gods_factors.conflict,(-amount/2))
		end
		for i=0,left_side:num_items()-1 do
			if left_side:item_at(i) == god then
				cm:faction_add_pooled_resource(faction_name,resource_key,original_factor,(amount/2))
			else
				cm:faction_add_pooled_resource(faction_name,left_side:item_at(i):resource_key(),gods_factors.conflict,(amount/2))
			end
		end
	-- And if god is on right side we do the same for left side
	elseif god_side == "right" then
	   for i=0,right_side:num_items()-1 do
			if right_side:item_at(i) == god then
				cm:faction_add_pooled_resource(faction_name,resource_key,original_factor,(amount/2))
			else
				cm:faction_add_pooled_resource(faction_name,right_side:item_at(i):resource_key(),gods_factors.conflict,(amount/2))
			end
		end
		for i=0,left_side:num_items()-1 do
			cm:faction_add_pooled_resource(faction_name,left_side:item_at(i):resource_key(),gods_factors.conflict,(-amount/2))
		end
	end
end

function apply_transaction_conflict_and_spawn_event(faction_interface,resource_key,factor_key,amount)
	local faction_name = faction_interface:name()
	local _amount
	if faction_interface:is_human() and factor_key == "troy_god_attitude_factor_campaign_adventures" then
		_amount = amount * gods_adventures_favour_human_mod
	else
		_amount = amount
	end
	cm:faction_add_pooled_resource(faction_name,resource_key,factor_key,_amount)
	--[[apply_conflict(faction_name,resource_key,_amount,factor_key)
	if secondary_detail ~= nil and faction_interface:is_human() then
		local title
		if _amount > 0 then
			title = "event_feed_strings_text_troy_main_event_feed_gods_milestone_gained"
		else
			title = "event_feed_strings_text_troy_main_event_feed_gods_milestone_lost"
		end

		cm:show_configurable_message_event(
			faction_name,
			title,
			"pooled_resources_display_name_" .. resource_key,
			"ui_text_replacements_localised_text_" .. secondary_detail,
			1047,
			_amount,
			0,
			0
		)

	end]]
	core:trigger_event("ScriptEventFavourUpdated", faction_interface);
end

function apply_transaction_and_spawn_event_for_rituals(faction_interface,resource_key,factor_key,amount,secondary_detail,is_ours)
	local faction_name = faction_interface:name()
	cm:faction_add_pooled_resource(faction_name,resource_key,factor_key,amount)
	if secondary_detail ~= nil then
		local title, primary_details, campaign_member_value
		if is_ours then
			title = "event_feed_strings_text_troy_main_event_feed_string_ritual_success_yours_title"
			primary_details = "event_feed_strings_text_troy_main_event_feed_string_ritual_success_yours_primary_details"
			campaign_member_value = 1088
		else
			title = "event_feed_strings_text_troy_main_event_feed_string_ritual_success_theirs_title"
			primary_details = "event_feed_strings_text_troy_main_event_feed_string_ritual_success_yours_primary_details"
			campaign_member_value = 1089
		end

		--[[cm:show_configurable_message_event(
			faction_name,
			title,
			primary_details,
			"pooled_resources_display_name_" .. resource_key,
			campaign_member_value,
			amount,
			0,
			0 
		)]]

		cm:show_message_event(
			faction_name,
			title,
			primary_details,
			"pooled_resources_display_name_" .. resource_key, -- handled in db (this param is not used)
			true,
			campaign_member_value,
			nil,
			nil,
			true,
			amount
		)

	end
	core:trigger_event("ScriptEventFavourUpdated", faction_interface);
end

-- function apply_pending_battle_transaction_conflict(faction_interface, resource_key, factor_key, amount, secondary_detail)
function apply_pending_battle_transaction_conflict(faction_interface, resource_key, factor_key, amount)
	local faction_name = faction_interface:name()
	if not faction_interface:is_human() then
		--cm:faction_add_pooled_resource(faction_name,resource_key,factor_key,amount)
		apply_conflict(faction_name,resource_key,amount,factor_key)
		cm:faction_add_post_battle_looted_resource(faction_name, resource_key, factor_key, amount)
	end
end

