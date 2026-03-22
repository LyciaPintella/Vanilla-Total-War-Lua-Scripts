out("Loading troy_victory_conditions.lua")

victory_mission_total_all = "troy_main_total_victory"

hippolyta_sacred_regions = {
	["troy_main_apaesos_pegaea"] 	= true,
	["troy_main_bythynia_chele"] 	= true,
	["troy_main_kaystros_ephesos"] 	= true,
	["troy_main_lesbos_methymna"] 	= true,
	["troy_main_syrmata_meropia"] 	= true,
	["troy_main_ellopia_histiaea"]  = true,
	num_captured = 0
}

troy_adi_diomedes_champion_units_amount =  0 
diomedes_faction_key = "troy_main_dan_argos"

victory_conditions_data = {
	["troy_amazons_trj_hippolyta"] 	= 
	{
		[1] = 
		{
			victory_mission_key = "troy_amazons_personal_victory_hippolyta",
			script_key 			= "troy_amazons_trj_hippolyta_personal_objective_complete_quest",
			text_key 			= "mission_text_text_troy_victory_personal_complete_quest_text_scripted",
			progress_current	= 0,
			progress_max 		= 13
		},
		[2] = 
		{
			victory_mission_key = "troy_amazons_personal_victory_hippolyta", 
			script_key 			= "troy_amazons_trj_hippolyta_personal_objective_complete_amazon_kingdom",
			text_key 			= "mission_text_text_troy_victory_personal_complete_amazon_kingdom_text_scripted",
			progress_current	= 0,
			progress_max 		= 5
		},
		[3] =
		{
			victory_mission_key = "troy_amazons_personal_victory_hippolyta",
			script_key 			= "troy_amazons_trj_hippolyta_personal_objective_control_sacred_regions",
			text_key 			= "mission_text_text_troy_victory_personal_control_sacred_regions_text_scripted",
			extra_param			= 6,
			progress_current	= 0,
			progress_max 		= 6
		},
	},
	["troy_amazons_trj_penthesilea"] = 
	{
		[1] = 
		{
			victory_mission_key = "troy_amazons_personal_victory_penthesilea",
			script_key 			= "troy_amazons_trj_penthesilea_personal_objective_complete_quest",
			text_key 			= "mission_text_text_troy_victory_personal_complete_quest_text_scripted",
			progress_current	= 0,
			progress_max 		= 13
		},
		[2] = 
		{
			victory_mission_key = "troy_amazons_personal_victory_penthesilea",
			script_key 			= "troy_amazons_trj_penthesilea_personal_objective_accumulate_battle_glory",
			text_key 			= "mission_text_text_troy_victory_personal_accumulate_battle_glory_text_scripted",
			extra_param			= 5000,
			progress_current	= 0,
			progress_max 		= 5000
		},
	},
	["troy_main_trj_dardania"] 	= 
	{
		[1] = 
		{
			victory_mission_key = "troy_main_personal_victory_dardania",
			script_key 			= "troy_main_trj_dardania_personal_objective_complete_quest",
			text_key 			= "mission_text_text_troy_victory_personal_complete_quest_text_scripted",
			progress_current	= 0,
			progress_max 		= 11
		},
	},
	["troy_main_dan_mycenae"] 	=
	{
		[1] = 
		{
			victory_mission_key = "troy_main_personal_victory_mycenae",
			script_key 			= "troy_main_dan_mycenae_personal_objective_complete_quest",
			text_key 			= "mission_text_text_troy_victory_personal_complete_quest_text_scripted",
			progress_current	= 0,
			progress_max 		= 13
		},
	},
	["troy_main_trj_hector"] 	= 
	{
		[1] = 
		{
			victory_mission_key = "troy_main_personal_victory_hector",
			script_key 			= "troy_main_trj_hector_personal_objective_complete_quest",
			text_key 			= "mission_text_text_troy_victory_personal_complete_quest_text_scripted",
			progress_current	= 0,
			progress_max 		= 12
		},
	},	
	["troy_main_dan_sparta"] 	= 
	{
		[1] = 
		{
			victory_mission_key = "troy_main_personal_victory_sparta",
			script_key 			= "troy_main_dan_sparta_personal_objective_complete_quest",
			text_key 			= "mission_text_text_troy_victory_personal_complete_quest_text_scripted",
			progress_current	= 0,
			progress_max 		= 12
		},
	},
	["troy_main_dan_ithaca"] 	= 
	{
		[1] = 
		{
			victory_mission_key = "troy_main_personal_victory_ithaca",
			script_key 			= "troy_main_dan_ithaca_personal_objective_complete_quest",
			text_key 			= "mission_text_text_troy_victory_personal_complete_quest_text_scripted",
			progress_current	= 0,
			progress_max 		= 12
		},
	},
	["troy_main_trj_paris"] 	= 
	{
		[1] = 
		{
			victory_mission_key = "troy_main_personal_victory_paris",
			script_key 			= "troy_main_trj_paris_personal_objective_complete_quest",
			text_key 			= "mission_text_text_troy_victory_personal_complete_quest_text_scripted",
			progress_current	= 0,
			progress_max 		= 12
		},
	},
	["troy_main_trj_lycia"] 		= 
	{
		[1] = 
		{
			victory_mission_key = "troy_main_personal_victory_lycia",
			script_key 			= "troy_main_trj_lycia_personal_objective_complete_quest",
			text_key 			= "mission_text_text_troy_victory_personal_complete_quest_text_scripted",
			progress_current	= 0,
			progress_max 		= 10
		}
		
	},
	["troy_main_dan_achilles"] 		= 
	{
		[1] = 
		{
			victory_mission_key = "troy_main_personal_victory_achilles",
			script_key 			= "troy_main_dan_achilles_personal_objective_complete_quest",
			text_key 			= "mission_text_text_troy_victory_personal_complete_quest_text_scripted",
			progress_current	= 0,
			progress_max 		= 12
		}
	},
	["troy_main_dan_salamis"] 		= 
	{
		[1] = 
		{
			victory_mission_key = "troy_adi_personal_victory_salamis",
			script_key 			= "troy_main_dan_salamis_personal_objective_complete_quest",
			text_key 			= "mission_text_text_troy_victory_personal_complete_quest_text_scripted",
			progress_current	= 0,
			progress_max 		= 12
		}
	}, 
	["troy_main_dan_argos"] 		= 
	{
		[1] = 
		{
			victory_mission_key = "troy_adi_personal_victory_argos",
			script_key 			= "troy_main_dan_argos_personal_objective_complete_quest",
			text_key 			= "mission_text_text_troy_victory_personal_complete_quest_text_scripted",
			progress_current	= 0,
			progress_max 		= 13
		},

		[2] = 
		{
			victory_mission_key = "troy_adi_personal_victory_argos",
			script_key 			= "troy_adi_dan_argos_personal_objective_maintain_champions",
			text_key 			= "mission_text_text_troy_adi_victory_personal_maintain_champions_text_scripted",
			extra_param			= 7,
			progress_current	= 0,
			progress_max 		= 7
		},
	},
	["troy_rem_trj_thrace"] =
	{
		[1] = {
			victory_mission_key = "troy_rem_personal_victory_rhesus",
			script_key = "troy_rem_trj_thrace_personal_objective_complete_quest",
			text_key = "mission_text_text_troy_victory_personal_complete_quest_text_scripted",
			progress_current = 0,
			progress_max = 13,
		},
		[2] = {
			victory_mission_key = "troy_rem_personal_victory_rhesus",
			script_key 			= "troy_rem_trj_thrace_personal_objective_countless_host_armies",
			text_key 			= "mission_text_text_troy_victory_personal_countless_host_armies_text_scripted",
			extra_param			= 4,
			progress_current	= 0,
			progress_max 		= 4,
		},
	},
	["troy_rem_horde_aethiopians"] =
	{
		[1] = {
			victory_mission_key = "troy_rem_personal_victory_memnon",
			script_key = "troy_rem_horde_aethiopians_personal_objective_complete_quest",
			text_key = "mission_text_text_troy_victory_personal_complete_quest_text_scripted",
			progress_current = 0,
			progress_max = 13,
		},
		[2] = {
			victory_mission_key = "troy_rem_personal_victory_memnon",
			script_key 			= "troy_rem_horde_aethiopians_personal_objective_pharaohs_servant_regions",
			text_key 			= "mission_text_text_troy_victory_personal_pharaohs_servant_regions_text_scripted",
			progress_current	= 0,
			progress_max 		= 6,
		},
	},
}

faction_to_personal_victory_mission = {
	troy_amazons_trj_hippolyta = "troy_amazons_personal_victory_hippolyta",
	troy_amazons_trj_penthesilea = "troy_amazons_personal_victory_penthesilea",
	troy_main_trj_dardania = "troy_main_personal_victory_dardania",
	troy_main_dan_mycenae = "troy_main_personal_victory_mycenae",
	troy_main_trj_hector = "troy_main_personal_victory_hector",
	troy_main_dan_sparta = "troy_main_personal_victory_sparta",
	troy_main_dan_ithaca = "troy_main_personal_victory_ithaca",
	troy_main_trj_paris = "troy_main_personal_victory_paris",
	troy_main_trj_lycia = "troy_main_personal_victory_lycia",
	troy_main_dan_achilles = "troy_main_personal_victory_achilles",
	troy_main_dan_salamis = "troy_adi_personal_victory_salamis",
	troy_main_dan_argos = "troy_adi_personal_victory_argos",
	troy_rem_trj_thrace = "troy_rem_personal_victory_rhesus",
	troy_rem_horde_aethiopians = "troy_rem_personal_victory_memnon",
}

function add_victory_conditions_listeners()

	core:add_listener(
		"troy_victory_conditions_paris_menelaus_personal_objective_control_helen", 
		"ScriptEventHelenOwnershipChange",
		true, 
		update_control_of_helen_victory_condition, 
		true
	)

	core:add_listener(
		"troy_victory_conditions_all_total_objective_defeat_antagonist", 
		"ScriptEventFactionDefeatsAntagonist", 
		true, 
		update_defeat_antagonist_victory_condition, 
		false
	)

	core:add_listener(
		"troy_victory_conditions_all_process_progression_data", 
		"ScriptEventFactionVictoryConditionProgress", 
		function(context)
			return context:faction():is_human()
		end, 
		process_faction_victory_condition_progress, 
		true
	)

	core:add_listener(
		"troy_victory_conditions_hippolyta_sacred_regions", 
		"RegionFactionChangeEvent", 
		function(context)
			local region = context:region()
			local hippolyta_faction = cm:get_faction("troy_amazons_trj_hippolyta") 
			return hippolyta_sacred_regions[region:name()] ~= nil and not hippolyta_faction:is_null_interface() and not hippolyta_faction:is_dead()
		end, 
		function(context)
			local region = context:region()
			local current_faction = region:owning_faction()
			local previous_faction = context:previous_faction()
			local region_name = region:name()

			if current_faction:name() == "troy_amazons_trj_hippolyta" then
				update_hippolyta_sacred_regions_condition(current_faction, region_name, true)
			elseif previous_faction and not previous_faction:is_null_interface() and previous_faction:name() == "troy_amazons_trj_hippolyta" then
				update_hippolyta_sacred_regions_condition(previous_faction, region_name, false)
			elseif cm:get_faction("troy_amazons_trj_hippolyta"):allied_with(current_faction) then
				update_hippolyta_sacred_regions_condition(cm:get_faction("troy_amazons_trj_hippolyta"), region_name, true)
			elseif cm:get_faction("troy_amazons_trj_hippolyta"):allied_with(previous_faction) then
				update_hippolyta_sacred_regions_condition(cm:get_faction("troy_amazons_trj_hippolyta"), region_name, false)
			end
		end, 
		true
	)

	core:add_listener(
		"troy_victory_conditions_hippolyta_sacred_regions_diplomacy_positive", 
		"PositiveDiplomaticEvent", 
		function(context)
			local hippolita_faction_name = "troy_amazons_trj_hippolyta"
			local hippolyta_faction = cm:get_faction(hippolita_faction_name) 
			if  not hippolyta_faction:is_null_interface() and not hippolyta_faction:is_dead() then 
				local proposer = context:proposer()
				local recepient = context:recipient()
				return (proposer == hippolyta_faction or recepient == hippolyta_faction) and context:is_alliance()
			else
				return false
			end
		end, 
		function(context)
			local proposer = context:proposer()
			local recepient = context:recipient()
			local hippolita_faction = cm:get_faction("troy_amazons_trj_hippolyta") 
			local other_faction

			if proposer ~= hippolita_faction then 
				other_faction = proposer
			else 
				other_faction = recepient
			end

			for i = 0, other_faction:region_list():num_items() - 1 do 
				local curr_region_name = other_faction:region_list():item_at(i):name()
				if hippolyta_sacred_regions[curr_region_name] then 
					update_hippolyta_sacred_regions_condition(hippolita_faction, curr_region_name, true)
				end
			end
		end, 
		true
	)

	core:add_listener(
		"troy_victory_conditions_hippolyta_sacred_regions_diplomacy_positive", 
		"NegativeDiplomaticEvent", 
		function(context)
			local hippolita_faction_name = "troy_amazons_trj_hippolyta"
			local hippolyta_faction = cm:get_faction(hippolita_faction_name) 
			if  not hippolyta_faction:is_null_interface() and not hippolyta_faction:is_dead() then 
				local proposer = context:proposer()
				local recepient = context:recipient()
				return (proposer == hippolyta_faction or recepient == hippolyta_faction) and context:was_alliance()
			else
				return false
			end
		end, 
		function(context)
			local proposer = context:proposer()
			local recepient = context:recipient()
			local hippolita_faction = cm:get_faction("troy_amazons_trj_hippolyta") 
			local other_faction

			if proposer ~= hippolita_faction then 
				other_faction = proposer
			else 
				other_faction = recepient
			end

			for i = 0, other_faction:region_list():num_items() - 1 do 
				local curr_region_name = other_faction:region_list():item_at(i):name()
				if hippolyta_sacred_regions[curr_region_name] == false then 
					update_hippolyta_sacred_regions_condition(hippolita_faction, curr_region_name, false)
				end
			end
		end, 
		true
	)

	core:add_listener(
		"troy_adi_victory_conditions_diomedes_champions_unit_trained", 
		"UnitTrained", 
		function(context)
			local unit = context:unit()
			return unit:faction():name() == diomedes_faction_key and unit:is_custom_unit()
		end, 
		function(context) update_diomedes_champion_victory_condition(context, 1) end,
		true
	)

	core:add_listener(
		"troy_adi_victory_conditions_diomedes_champions_unit_disbanded", 
		"UnitDisbanded", 
		function(context)
			local unit = context:unit()
			return unit:faction():name() == diomedes_faction_key and unit:is_custom_unit()
		end, 
		function(context) update_diomedes_champion_victory_condition(context, -1) end,
		true
	)

	core:add_listener(
		"troy_adi_victory_conditions_diomedes_champions_unit_merged_destroyed", 
		"UnitMergedAndDestroyed", 
		function(context)
			local unit = context:unit()
			return unit:faction():name() == diomedes_faction_key and unit:is_custom_unit()
		end, 
		function(context) update_diomedes_champion_victory_condition(context, -1) end,
		true
	)

	core:add_listener(
		"troy_adi_victory_conditions_diomedes_champions_unit_destroyed", 
		"UnitDestroyed", 
		function(context)
			local unit = context:unit()
			return unit:faction():name() == diomedes_faction_key and unit:is_custom_unit()
		end, 
		function(context) update_diomedes_champion_victory_condition(context, -1) end,
		true
	)	

end

function victory_conditions_start_new_game()
	for faction_key,faction_table in pairs(victory_conditions_data) do
		if cm:get_local_faction_name() == faction_key then
			for _,entry in pairs(faction_table) do
				if entry.extra_param then 
					cm:set_scripted_mission_text(
						entry.victory_mission_key, 
						entry.script_key, 
						entry.text_key,
						entry.extra_param,
						entry.progress_current,
						entry.progress_max
					)
				else 
					cm:set_scripted_mission_text(
						entry.victory_mission_key, 
						entry.script_key, 
						entry.text_key,
						entry.progress_current,
						entry.progress_max
					)
				end
			end
		end
	end
end

function process_faction_victory_condition_progress(context)
	local faction_name 			= context:faction():name()
	local script_key_to_process = context.string
	for i=1, #victory_conditions_data[faction_name] do 
		if victory_conditions_data[faction_name][i] 
		and victory_conditions_data[faction_name][i].script_key 
		and (victory_conditions_data[faction_name][i].script_key == script_key_to_process 
		or string.find(victory_conditions_data[faction_name][i].script_key,script_key_to_process)) then
			
			local new_progress = context.number
			if victory_conditions_data[faction_name][i].progress_current >= victory_conditions_data[faction_name][i].progress_max then 
				break			
			elseif new_progress >= victory_conditions_data[faction_name][i].progress_max then 
				victory_conditions_data[faction_name][i].progress_current = victory_conditions_data[faction_name][i].progress_max
				cm:complete_scripted_mission_objective(
					victory_conditions_data[faction_name][i].victory_mission_key, 
					victory_conditions_data[faction_name][i].script_key,
					true
				)
			else
				victory_conditions_data[faction_name][i].progress_current = new_progress
			end

			if victory_conditions_data[faction_name][i].extra_param then 
				cm:set_scripted_mission_text(
					victory_conditions_data[faction_name][i].victory_mission_key, 
					victory_conditions_data[faction_name][i].script_key, 
					victory_conditions_data[faction_name][i].text_key,
					victory_conditions_data[faction_name][i].extra_param,
					victory_conditions_data[faction_name][i].progress_current,
					victory_conditions_data[faction_name][i].progress_max
				)
			else 
				cm:set_scripted_mission_text(
				victory_conditions_data[faction_name][i].victory_mission_key, 
				victory_conditions_data[faction_name][i].script_key, 
				victory_conditions_data[faction_name][i].text_key,
				victory_conditions_data[faction_name][i].progress_current,
				victory_conditions_data[faction_name][i].progress_max
				)
			end	
		end
	end
end

function update_control_of_helen_victory_condition(context)
	local new_owner = context:faction():name()
	local is_human = context:faction():is_human()
	if is_human and new_owner ~= paris_faction then
		cm:complete_scripted_mission_objective(
			"troy_main_personal_victory_paris", 
			"troy_main_trj_paris_personal_objective_control_helen",
			false
		)
	end

	if is_human and new_owner == "troy_main_dan_sparta" then
		cm:complete_scripted_mission_objective(
			"troy_main_personal_victory_sparta", 
			"troy_main_dan_sparta_personal_objective_control_helen",
			true
		)
	end
end

function update_defeat_antagonist_victory_condition(context)
	local faction_key = context:faction():name()

	cm:complete_scripted_mission_objective(
		"troy_main_total_victory",
		faction_key .. "_total_objective_defeat_antagonist",
		true
	)

	-- cm:complete_scripted_mission_objective(
	--	faction_to_personal_victory_mission[context:faction():name()],
	--	faction_key .. "_total_objective_defeat_antagonist",
	--	true
	-- )
	
end

function update_diomedes_champion_victory_condition(context, value)
	
	troy_adi_diomedes_champion_units_amount = math.clamp(troy_adi_diomedes_champion_units_amount + value, 0, victory_conditions_data["troy_main_dan_argos"][2].progress_max)
	
	core:trigger_event(
		"ScriptEventFactionVictoryConditionProgress",
		troy_adi_diomedes_champion_units_amount,
		"troy_adi_dan_argos_personal_objective_maintain_champions",
		context:unit():faction()
	)
	
end

function update_hippolyta_sacred_regions_condition(faction, region_name, to_add)

	if to_add then 
		hippolyta_sacred_regions[region_name] = false
		hippolyta_sacred_regions.num_captured = math.clamp(hippolyta_sacred_regions.num_captured + 1, 0, victory_conditions_data["troy_amazons_trj_hippolyta"][3].progress_max)
	elseif not to_add then 
		hippolyta_sacred_regions[region_name] = true
		hippolyta_sacred_regions.num_captured = math.clamp(hippolyta_sacred_regions.num_captured - 1, 0, victory_conditions_data["troy_amazons_trj_hippolyta"][3].progress_max)
	end

	core:trigger_event(
		"ScriptEventFactionVictoryConditionProgress",
		hippolyta_sacred_regions.num_captured,
		"troy_amazons_trj_hippolyta_personal_objective_control_sacred_regions",
		faction
	)
end

--------------------------------------------------------------
--SAVING/LOADING
--------------------------------------------------------------

if __game_mode == __lib_type_campaign then
	cm:add_saving_game_callback(
		function(context)
			cm:save_named_value("HIPPOLYTA_SACRED_REGIONS", hippolyta_sacred_regions, context)
			cm:save_named_value("VICTORY_CONDITIONS_DATA", victory_conditions_data, context)
			cm:save_named_value("TROY_ADI_VICTORY_CONDITIONS_DIOMEDES_CHAMPIONS", troy_adi_diomedes_champion_units_amount, context)
		end
	)

	cm:add_loading_game_callback(
		function(context)
			hippolyta_sacred_regions = cm:load_named_value("HIPPOLYTA_SACRED_REGIONS", hippolyta_sacred_regions, context)
			victory_conditions_data = cm:load_named_value("VICTORY_CONDITIONS_DATA", victory_conditions_data, context)
			troy_adi_diomedes_champion_units_amount = cm:load_named_value("TROY_ADI_VICTORY_CONDITIONS_DIOMEDES_CHAMPIONS", troy_adi_diomedes_champion_units_amount, context)
		end
	)
end