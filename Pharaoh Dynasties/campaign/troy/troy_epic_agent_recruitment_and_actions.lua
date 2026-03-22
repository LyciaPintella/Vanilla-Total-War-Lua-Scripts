out("Loading troy_epic_agent_recruitment_and_actions.lua")

--[[ epic_agent_names = {
	troy_agent_satyr 	= {
		"1207971855",
		"1229635839",
		"1291406906",
		"1368031289",
		"1400912777",
		"1757735248",
		"1768298957",
		"1781739879",
		"200673332",
		"280839875",
		"36595018",
		"467522232",
		"483202988",
		"554621903",
		"712147591",
		"737197298",
		"77868623",
	},
	troy_agent_seer 	= {
		"1087833107",
		"1198021278",
		"1354733408",
		"1591134977",
		"1624279631",
		"1905945345",
		"2014352911",
		"2137862243",
		"227514643",
		"268741185",
		"281351112",
		"411507156",
		"459310115",
		"477838737",
		'674466263',
		'689944692',
		"713728380", 
		"848932059"
	},
	troy_agent_gorgon 	= {
		"1355746882",
		"2033061528",
		"517169108"
	}
} ]]

--[[ epic_agent_rec_cooldown = {
	gorgon = {},
	seer = {},
	satyr = {}
} ]]

--epic_agent_time_to_leave = {}
seer_own_settlement_favour_amount = 650

epic_agent_time_to_live = 8
epic_agent_time_to_live_seer = 10

mission_issuers = 
{
	"ZEUS",
	"HERA",
	"ATHENA",
	"POSEIDON",
	"ARES",
	"APOLLO",
	"APHRODITE",
	"ARTEMIS",
	"HEPHAESTUS"
}

seer_passive_favour = 2

seer_quest_locations = 
{
	[1] = { 
		region = "troy_main_phlegra_olophyxos",
		mission = "troy_main_seer_mission_01"
	},
	[2] = {
		region = "troy_main_perrhaebia_oloosson",
		mission = "troy_main_seer_mission_01"
	},
	[3] = {
		region = "troy_main_magnesia_meliboea",
		mission = "troy_main_seer_mission_01"
	},
	[4] = {
		region = "troy_main_magnesia_iolcos",
		mission = "troy_main_seer_mission_01"
	},
	[5] = {
		region = "troy_main_phthia_pteleon",
		mission = "troy_main_seer_mission_01"
	},
	[6] = {
		region = "troy_main_malis_oita",
		mission = "troy_main_seer_mission_01"
	},
	[7] = {
		region = "troy_main_ozolian_locris_elateia",
		mission = "troy_main_seer_mission_01"
	},
	[8] = {
		region = "troy_main_ozolian_locris_cyparissos",
		mission = "troy_main_seer_mission_01",
	},
	[9] = {
		region = "troy_main_boeotia_thisbe",
		mission = "troy_main_seer_mission_01"
	},
	[10] = {
		region = "troy_main_elis_altis",
		mission = "troy_main_seer_mission_01"
	},
	[11] = {
		region = "troy_main_lacedaemon_sparta",
		mission = "troy_main_seer_mission_01"
	},
	[12] = {
		region = "troy_main_lacedaemon_oitylon",
		mission = "troy_main_seer_mission_01"
	},
	[13] = {
		region = "troy_main_epirus_dodona",
		mission = "troy_main_seer_mission_01"
	},
	[14] = {
		region = "troy_main_perrheabia_tricca",
		mission = "troy_main_seer_mission_01"
	},
	[15] = {
		region = "troy_main_ida_knossos",
		mission = "troy_main_seer_mission_01"
	},
	[16] = {
		region = "troy_main_cyclades_ios",
		mission = "troy_main_seer_mission_01"
	},
	[17] = {
		region = "troy_main_syrmata_melos",
		mission = "troy_main_seer_mission_01"
	},
	[18] = {
		region = "troy_main_epagris_mykonos",
		mission = "troy_main_seer_mission_01"
	},
	[19] = {
		region = "troy_main_melamphyslos_kos",
		mission = "troy_main_seer_mission_01",
	},
	[20] = {
		region = "troy_main_cragos_phellos",
		mission = "troy_main_seer_mission_01"
	},
	[21] = {
		region = "troy_main_latmos_milethus",
		mission = "troy_main_seer_mission_01"
	},
	[22] = {
		region = "troy_main_sipylos_myrra",
		mission = "troy_main_seer_mission_01",
	},
	[23] = {
		region = "troy_main_maeonia_hypaepa",
		mission = "troy_main_seer_mission_01"
	},
	[24] = {
		region = "troy_main_ide_zeleia",
		mission = "troy_main_seer_mission_01",
	},
	[25] = {
		region = "troy_main_lemnos_poliochne",
		mission = "troy_main_seer_mission_01"
	},
	[26] = {
		region = "troy_main_zerynthia_nesoi_saos",
		mission = "troy_main_seer_mission_01"
	},
	[27] = {
		region = "troy_main_phrygia_medra",
		mission = "troy_main_seer_mission_01"
	}
}

--epic_agent_turns_cooldown = 0
epic_agent_incident_key = "troy_main_incident_all_epic_agent_available"
epic_agent_subtypes = {
	["troy_agent_satyr"] 		= true,
	["troy_agent_seer"]  		= true,
	["troy_agent_gorgon"]		= true,
	["troy_dlc2_agent_orion"] 	= true,
	["troy_hep_agent_kabeiros"] = true,
}
satyr_subtype = "troy_agent_satyr"
seer_subtype = "troy_agent_seer"
gorgon_subtype = "troy_agent_gorgon"
kabeiros_subtype = "troy_hep_agent_kabeiros"
gorgon_hinder_army = "troy_agent_action_record_petrify_enemy_army"
seer_hinder_character = "troy_agent_action_record_misery_loves_company_character"
--seer_hinder_settlement = "troy_agent_action_record_misery_loves_company_settlement"
satyr_assist_settlement = "troy_agent_action_record_happy_elders"
seer_killed_favour_drop_amount = -10
gorgon_bundle = "effect_bundle_agent_target_gorgon_petrify_01"
seer_own_ritual_action_key = "troy_agent_action_record_seer_ritual"
seer_horde_own_ritual_action_key = "troy_agent_horde_action_record_seer_ritual"
orion_hinder_settlement_action_key = "troy_agent_action_record_orion_hinder_settlement"
effect_bundles_for_cooldown = {
	["troy_agent_satyr"] = "effect_bundle_agent_satyr_restriction",
	["troy_agent_seer"] = "effect_bundle_agent_seer_restriction",
	["troy_agent_gorgon"] = "effect_bundle_agent_gorgon_restriction",
	["troy_dlc2_agent_orion"] = "effect_bundle_agent_orion_restriction",
	["troy_hep_agent_kabeiros"] = "troy_hep_effect_bundle_agent_kabeiros_restriction",
}


-- kabeiros specific variables and tables 
kabeiros_settlement_ui_details = {
	major = {
		icon_id = "sp_icon_kabeiros.png",
		icon_path = "UI/skins/default/sp_icon_kabeiros.png",
		description = "troy_hep_kabeiros_agent_action_major_settlement_description",
	},
	minor = {
		icon_id = "sp_icon_kabeiros.png",
		icon_path = "UI/skins/default/sp_icon_kabeiros.png",
		description = "troy_hep_kabeiros_agent_action_minor_settlement_description",
	}
	
}

kabeiros_settlement_mods = {
	major = {
		tier_1 = { 
			troy_main_effect_influence_factor_events = 3, 
			troy_effect_campaign_happiness_factor_events = 3,
			troy_effect_building_morale_all_units_defending_siege = 10,
		},
		tier_2 = { 
			troy_main_effect_influence_factor_events = 5, 
			troy_effect_campaign_happiness_factor_events = 5,
			troy_effect_building_morale_all_units_defending_siege = 15,
		},
		tier_3 = { 
			troy_main_effect_influence_factor_events = 7, 
			troy_effect_campaign_happiness_factor_events = 7,
			troy_effect_building_morale_all_units_defending_siege = 20,
		},
		tier_4 = { 
			troy_main_effect_influence_factor_events = 8, 
			troy_effect_campaign_happiness_factor_events = 8,
			troy_effect_building_morale_all_units_defending_siege = 23,
		},
		tier_5 = { 
			troy_main_effect_influence_factor_events = 9, 
			troy_effect_campaign_happiness_factor_events = 9,
			troy_effect_building_morale_all_units_defending_siege = 25,
		},
	},
	minor = {
		tier_1 = {troy_effect_economy_mod_all_resources = 50},
		tier_2 = {troy_effect_economy_mod_all_resources = 70},
		tier_3 = {troy_effect_economy_mod_all_resources = 85},
		tier_4 = {troy_effect_economy_mod_all_resources = 93},
		tier_5 = {troy_effect_economy_mod_all_resources = 100},
	}
}

kabeiros_assist_settlement_keys = {
	action_key = "troy_hep_agent_action_record_kabeiros_assist_minor_settlement",
	horde_action_key = "troy_hep_agent_action_record_kabeiros_settlement_horde",
	major = { effect_bundle = "troy_hep_effect_bundle_agent_target_region_major_kabeiros" },
	minor = { effect_bundle = "troy_hep_effect_bundle_agent_target_region_minor_kabeiros" },
}

kabeiros_modified_settlements = { major = {}, minor = {}, }

kabeiros_assist_army = {
	units_per_turn = 3,	-- Number of units per turn that would get their equipment upgraded.
	unit_equipment_upgrades = {
		{ bonus_key = "campaign_unit_stat_bonus_type_armour3", bonus_value = 20, },
		{ bonus_key = "campaign_unit_stat_bonus_type_attack3", bonus_value = 20, },
	}
}




--[[ core:add_listener (
	"Troy_epic_agent_initial_cooldown_all_factions",
	"FirstTickAfterNewCampaignStarted",
	true,
	function(context) 
		local faction_list = context:model():world():faction_list()
		for i=0,faction_list:num_items()-1 do
			if faction_list:item_at(i):has_pooled_resource("troy_god_attitude_athena") and faction_list:item_at(i):has_pooled_resource("troy_god_attitude_apollo") then
				epic_agent_rec_cooldown.gorgon[faction_list:item_at(i):name()] = epic_agent_turns_cooldown
				epic_agent_rec_cooldown.seer[faction_list:item_at(i):name()] = epic_agent_turns_cooldown
				epic_agent_rec_cooldown.satyr[faction_list:item_at(i):name()] = epic_agent_turns_cooldown
			end
		end
	end,
	false
) ]]

function epic_agent_recruitment_and_actions_add_listeners()
	out("Listeners for Epic agent recruitment and actions started")
	
   --[[  core:add_listener (
	"Troy_epic_agent_add_recruitable_gorgon",
	"FactionTurnStart",
	function(context) 
		if context:faction():has_pooled_resource("troy_god_attitude_athena") and context:faction():has_effect_bundle("effect_bundle_gods_athena_favour_tier_3") then
			if  epic_agent_rec_cooldown.gorgon[context:faction():name()] == nil 
				or epic_agent_rec_cooldown.gorgon[context:faction():name()] < cm:model():turn_number() then
				return true
			end
		end
		return false
	end,
	function(context) add_epic_agent_to_recruitment_pool(context,"gorgon") end,
	true
	) ]]
	
	core:add_listener (
	"Troy_epic_agent_seer_killed",
	"CharacterCharacterTargetAction",
	function(context) 
		return  context:mission_result_critial_success() 
				and context:character():character_subtype("troy_agent_spy")
				and context:target_character():character_subtype(seer_subtype)
	end,
	function(context) 
		local seer_faction = context:target_character():faction()
		local killer_faction = context:character():faction()

		-- Drop favour with all gods for killer. Killing a sacred person is a sin! 
		-- I really need to make this a function :()
		local gods = cm:model():world():god_manager():gods()
		for i=0,gods:num_items()-1 do
			local curr_god = gods:item_at(i):resource_key()
			if killer_faction:has_pooled_resource(curr_god) then				
				apply_transaction_conflict_and_spawn_event(killer_faction,curr_god,gods_factors.faction,seer_killed_favour_drop_amount)
			end
		end

		-- Penalty for the faction owning the seer. Letting your sacred person get killed is a sin!
		cm:apply_effect_bundle("effect_bundle_agent_seer_killed_happiness",seer_faction:name(),5)
		
	end,
	true
	)

	core:add_listener (
	"Troy_epic_agent_satyr_killed",
	"CharacterCharacterTargetAction",
	function(context) 
		return  context:mission_result_critial_success() 
				and context:character():character_subtype("troy_agent_spy")
				and context:target_character():character_subtype(satyr_subtype)
	end,
	function(context) 
		-- Buff for killing the satyr, restoring discipline to the world!
		local killer_faction = context:character():faction()
		cm:apply_effect_bundle("effect_bundle_agent_satyr_gone_morale",killer_faction:name(),4)
	end,
	true
	)

	core:add_listener (
	"Troy_epic_agent_gorgon_killed",
	"CharacterCharacterTargetAction",
	function(context) 
		return  context:mission_result_critial_success() 
				and context:character():character_subtype("troy_agent_spy")
				and context:target_character():character_subtype(gorgon_subtype)
	end,
	function(context) 
		-- Buff for having the gorgon be killed, restoring happiness to the world!
		local target_faction = context:target_character():faction()
		cm:apply_effect_bundle("effect_bundle_agent_gorgon_left_happiness",target_faction:name(),2)
		
		-- Buff for killing the gorgon, motivating the troops!
		local killer_faction = context:character():faction()
		cm:apply_effect_bundle("effect_bundle_agent_gorgon_harmed_speed_morale",killer_faction:name(),4)
		
	end,
	true
	)

	core:add_listener(
		"troy_agent_orion_killed",
		"CharacterCharacterTargetAction",
		function(context)
			return  context:mission_result_critial_success() 
			and context:character():character_subtype("troy_agent_spy")
			and context:target_character():character_subtype("troy_dlc2_agent_orion")
		end,
		function(context)
			-- Buff for killing Orion
			local killer_faction = context:character():faction():name()
			cm:apply_effect_bundle("effect_bundle_agent_orion_killed", killer_faction, 5)
		end,
		true
	)

	--[[ core:add_listener (
	"Troy_epic_agent_add_recruitable_seer",
	"FactionTurnStart",
	function(context) 
		if context:faction():has_pooled_resource("troy_god_attitude_apollo") and context:faction():has_effect_bundle("effect_bundle_gods_apollo_favour_tier_3") then
			if  epic_agent_rec_cooldown.seer[context:faction():name()] == nil 
				or epic_agent_rec_cooldown.seer[context:faction():name()] < cm:model():turn_number() then
				return true
			end  
		end
		return false
	end,
	function(context) add_epic_agent_to_recruitment_pool(context,"seer") end,
	true
	) ]]

	--[[ core:add_listener (
	"Troy_epic_agent_add_recruitable_satyr",
	"FactionTurnStart",
	function(context) 
		if context:faction():has_pooled_resource("troy_god_attitude_aphrodite") and context:faction():has_effect_bundle("effect_bundle_gods_aphrodite_favour_tier_3") then
			if  epic_agent_rec_cooldown.satyr[context:faction():name()] == nil 
				or epic_agent_rec_cooldown.satyr[context:faction():name()] < cm:model():turn_number() then
				return true
			end
		end
		return false
	end,
	function(context) add_epic_agent_to_recruitment_pool(context,"satyr") end,
	true
	) ]]

	core:add_listener (
	"Troy_epic_agent_recruited",
	"CharacterCreated",
	function(context) 
		local char_subtype = context:character():character_subtype_key()
		if epic_agent_subtypes[char_subtype] then
			return true
		end
		return false
	end,
	function(context)
		local char_str = cm:char_lookup_str(context:character():command_queue_index())
		cm:replenish_action_points(char_str)
	end,
	true
	)
	
	core:add_listener (
		"Troy_epic_agent_seer_action_target_character",
		"CharacterCharacterTargetAction",
		function(context) 
			return context:agent_action_key() == seer_hinder_character
		end,
		function(context)
			seer_favour_drop(context,"character")
		end,
		true
	)
--[[ --By design, the seer action against a settlement is removed.
	core:add_listener (
		"Troy_epic_agent_seer_action_target_settlement",
		"CharacterGarrisonTargetAction",
		function(context) 
			return context:agent_action_key() == seer_hinder_settlement
		end,
		function(context) 
			seer_favour_drop(context,"settlement")
		end,
		true
	)
--]]
	
	core:add_listener (
		"Troy_epic_agent_satyr_action_target_own_settlement",
		"CharacterGarrisonTargetAction",
		function(context) 
			return context:agent_action_key() == satyr_assist_settlement
		end,
		function(context) 
			cm:complete_recruitment_and_contruction_in_region(context:garrison_residence():region():name())
		end,
		true
	)

	core:add_listener (
		"Troy_epic_agent_restriction_after_they_leave",
		"FactionCharacterDiedOrWounded",
		function(context) 
			local char_subtype = context:family_member():character():character_subtype_key()
			return effect_bundles_for_cooldown[char_subtype]
		end,
		function(context) 
			local char_subtype = context:family_member():character():character_subtype_key()
			if char_subtype == "troy_agent_seer" then 
				cm:apply_effect_bundle(effect_bundles_for_cooldown[char_subtype], context:family_member():character():faction():name(),epic_agent_time_to_live_seer)
			else 
				cm:apply_effect_bundle(effect_bundles_for_cooldown[char_subtype], context:family_member():character():faction():name(),epic_agent_time_to_live)
			end
		end,
		true
	)

	core:add_listener (
		"Troy_epic_agent_seer_died",
		"FactionCharacterDiedOrWounded",
		function(context)
			if context:family_member():character():is_null_interface() then
				return false
			end
			return context:family_member():character():character_subtype(seer_subtype) and context:family_member():character():faction():is_human()
		end,
		function(context) 
			cm:cancel_mission(context:faction():name(), seer_quest_locations[1].mission)
		end,
		true
	)

	core:add_listener (
		"Troy_epic_agent_seer_spawned_issue_quest",
		"CharacterCreated",
		function(context) 
			return context:character():character_subtype(seer_subtype) and context:character():faction():is_human()
		end,
		function(context) 
			local to_fire = cm:model():random_int(1,#seer_quest_locations)
			local mission_key = seer_quest_locations[to_fire].mission
			local target_region = seer_quest_locations[to_fire].region
			local character_region = context:character():region():name()

			while target_region == character_region do
				to_fire = cm:model():random_int(1,#seer_quest_locations)
				mission_key = seer_quest_locations[to_fire].mission
				target_region = seer_quest_locations[to_fire].region
			end

			local faction_name = context:character():faction():name()
			local issuer = mission_issuers[cm:model():random_int(1,#mission_issuers)]
			local faction = cm:model():world():faction_by_key(faction_name)
			local faction_leader = faction:faction_leader():command_queue_index()
			local pooled_resource_payload = "adjust_experience_for_character {  cqi "..faction_leader.. "; amount 3000; }"--"faction_pooled_resource_transaction{resource troy_god_attitude_"..issuer:lower()..";factor troy_god_attitude_factor_faction;amount 200;}"
			if not mission_key or not target_region then 
				script_error("WARNING: Mission key or target region for Seer mission number "..to_fire.." is invalid")
			end
			local seer_mission = mission_manager:new(
				faction_name,
				mission_key
			)
			seer_mission:add_new_objective("MOVE_TO_REGION")
			seer_mission:add_condition("region " .. target_region)
			seer_mission:add_condition("agent_subtype ".. seer_subtype)
			seer_mission:set_mission_issuer(issuer)
			seer_mission:set_turn_limit(epic_agent_time_to_live_seer)
			seer_mission:add_payload(pooled_resource_payload)
			seer_mission:set_should_cancel_before_issuing(false)
			seer_mission:trigger()
		end,
		true
	)
	
	
	--[[
	core:add_listener (
		"Troy_epic_agent_seer_passive_cannot_fail",
		"CharacterTurnStart",
		function(context) 
			return context:character():character_subtype(seer_subtype) 
		end,
		function(context) 
			local gods = cm:model():world():god_manager():gods()
			local faction = context:character():faction()
			for i=0,gods:num_items()-1 do
				local curr_god = gods:item_at(i):resource_key()
				if faction:has_pooled_resource(curr_god) then	
					apply_transaction_conflict_and_spawn_event(faction,curr_god,gods_factors.agents,seer_passive_favour)
				end
			end
		end,
		true
	)
	--]]
	core:add_listener (
		"Troy_epic_agent_seer_passive_cannot_fail",
		"CharacterTurnStart",
		function(context)
			return context:character():character_subtype(seer_subtype) 
		end,
		function(context)
			local faction = context:character():faction()
			local region = context:character():region_data()
			local faction_char_list = faction:character_list()
			for i=0, faction_char_list:num_items()-1 do 
				local curr_char = faction_char_list:item_at(i)
				if curr_char:region_data():key() == region:key() and not region:is_sea() then 
					cm:add_agent_experience("character_cqi:"..curr_char:cqi(), 100)
				end
			end
		end,
		true
	)

	core:add_listener(
		"troy_epic_agent_orion_passive_cannot_fail",
		"CharacterTurnStart",
		function(context)
			return context:character():character_subtype("troy_dlc2_agent_orion")
		end,
		function(context)
			local acting_character = context:character()
			local acting_character_faction_key = acting_character:faction():name()
			local acting_character_region = acting_character:region()
			if acting_character_region and not acting_character_region:is_null_interface() then
				local acting_character_province = acting_character_region:province()
				if acting_character_province and not acting_character_province:is_null_interface() then
					local character_province_regions = acting_character_province:regions()
					for i=0, character_province_regions:num_items() - 1 do
						local curr_item = character_province_regions:item_at(i)
						cm:make_region_visible_in_shroud(acting_character_faction_key, curr_item:name())
					end
				end
			end
		end,
		true
	)

	core:add_listener (
		"Troy_epic_agent_seer_quest_success",
		"MissionSucceeded",
		function(context) 
			local str = context:mission():mission_record_key()
			return string.find(str,'seer_mission_')
		end,
		function(context)
			local faction_char_list = context:faction():character_list()
			local seer
			for i=0, faction_char_list:num_items() -1 do
				if faction_char_list:item_at(i):character_subtype(seer_subtype) then 
					seer = faction_char_list:item_at(i)
				end
			end
			local issuer = context:mission():mission_issuer_record_key():lower()
			local god = cm:model():world():god_manager():god_by_key(issuer)
			if god:participate_in_conflict() then
				cm:remove_god_from_conflict(issuer)
			end

			-- Time to wait for the character to stop moving before we kill him or we crash :(
			local seer_x = seer:display_position_x()
			local seer_y = seer:display_position_y()

			cm:repeat_callback(
				function() 
					if seer:display_position_x() ~= seer_x or seer:display_position_y() ~= seer_y then 
						seer_x = seer:display_position_x()
						seer_y = seer:display_position_y()
					else
						cm:remove_callback("wait_seer")
						cm:force_character_to_leave(seer:command_queue_index())
					end
				end, 
				0.2, 
				"wait_seer"
			)
			
		end,
		true
	)
	
	core:add_listener (
		"Troy_epic_agent_set_time_to_leave+",
		"CharacterCreated",
		function(context)
			local char_subtype = context:character():character_subtype_key()
			if epic_agent_subtypes[char_subtype] then
				return true
			end
			return false
		end,
		function(context)
			local char = context:character()
			local char_cqi = char:command_queue_index()
			local turn_to_leave
			local ttl
			if char:character_subtype(seer_subtype) then
				turn_to_leave = cm:model():turn_number() + epic_agent_time_to_live_seer
				ttl = epic_agent_time_to_live_seer
			else
				turn_to_leave = cm:model():turn_number() + epic_agent_time_to_live
				ttl = epic_agent_time_to_live
			end
			--table.insert(epic_agent_time_to_leave,char_cqi,turn_to_leave)
			out("TIME TO LEAVE FOR CHAR WITH CQI : " .. tostring(char_cqi) .. " IS " .. tostring(turn_to_leave))
			cm:set_character_scripted_time_to_leave(context:character(),ttl)
		end,
		true
	)
	
	core:add_listener (
		"Troy_epic_agent_check_leave_time_and_apply_effects",
		"CharacterTurnStart",
		function(context) 
			local char = context:character()
			local char_subtype = char:character_subtype_key()
			return epic_agent_subtypes[char_subtype] and char:scripted_time_to_leave() == 0
			
		end,
		function(context)
			--[[ local char_cqi = context:character():command_queue_index()
			if epic_agent_time_to_leave[char_cqi] and epic_agent_time_to_leave[char_cqi] == cm:model():turn_number() then 
				
			end ]]
			local char = context:character()
			if char:character_subtype(gorgon_subtype) then
				cm:apply_effect_bundle("effect_bundle_agent_gorgon_left_happiness",char:faction():name(),1)
			end
			cm:force_character_to_leave(char:command_queue_index())
		end,
		true
	)

	core:add_listener(
		"Troy_epic_agent_gorgon", 
		"CharacterCharacterTargetAction", 
		function(context)
			return context:character():character_subtype(gorgon_subtype)
		end, 
		function(context)
			local bundle = cm:create_new_custom_effect_bundle(gorgon_bundle)
			bundle:set_duration(3)
			local bundle_effects = bundle:effects()
			for i=0,bundle_effects:num_items()-1 do
				bundle:set_effect_value(bundle_effects:item_at(i), cm:model():random_int(5,20) * (-1))
			end
			cm:apply_custom_effect_bundle_to_characters_force(bundle,context:target_character())
		end, 
		true
	)

	core:add_listener (
		"Troy_agent_ritual_performed",
		"CharacterGarrisonTargetAction",
		function(context) 
			return context:agent_action_key() == seer_own_ritual_action_key and (context:mission_result_success() or context:mission_result_critial_success())
		end,
		function(context)
			local faction_obj = context:garrison_residence():faction()
			local faction = faction_obj:name()
			local buildings = context:garrison_residence():buildings()
			local acting_character = context:character()
			if faction == acting_character:faction():name() then
				for i=0,buildings:num_items()-1 do 
					if not buildings:item_at(i):is_null_interface() then 
						local name = buildings:item_at(i):name()
						if string.find(name,"religion") then
							for _,effect_key in pairs(gods_effects) do
								if buildings:item_at(i):get_effect_value(effect_key) ~= 0 then
									local target = effect_key
									local target_god = string.gsub(target, "troy_god_attitude_", "")
									target = string.gsub(target,"troy_effect_gods_favour_mod_","troy_god_attitude_")
									apply_transaction_and_spawn_event_for_rituals(faction_obj,target,gods_factors.agents,seer_own_settlement_favour_amount)
								end
							end
						end
					end
				end	
			end
		end,
		true
	)
	core:add_listener (
		"Troy_horde_agent_ritual_performed",
		"CharacterCharacterTargetAction",
		function(context) 
			return context:agent_action_key() == seer_horde_own_ritual_action_key and (context:mission_result_success() or context:mission_result_critial_success())
		end,
		function(context)
			local faction_obj = context:target_character():faction()
			local faction = faction_obj:name()
			local buildings = context:target_character():military_force():buildings()
			local acting_character = context:character()
			if faction == acting_character:faction():name() then
				for i=0,buildings:num_items()-1 do 
					if not buildings:item_at(i):is_null_interface() then 
						local name = buildings:item_at(i):name()
						if string.find(name,"religion") then
							for _,effect_key in pairs(gods_effects) do
								if buildings:item_at(i):get_effect_value(effect_key) ~= 0 then
									local target = effect_key
									local target_god = string.gsub(target, "troy_god_attitude_", "")
									target = string.gsub(target,"troy_effect_gods_favour_mod_","troy_god_attitude_")
									apply_transaction_and_spawn_event_for_rituals(faction_obj,target,gods_factors.agents,seer_own_settlement_favour_amount)
								end
							end
						end
					end
				end	
			end
		end,
		true
	)

	core:add_listener (
		"Troy_agent_orion_hinder_settlement",
		"CharacterCharacterTargetAction",
		function(context) 
			return context:agent_action_key() == orion_hinder_settlement_action_key and (context:mission_result_success() or context:mission_result_critial_success())
		end,
		function(context)
			local acting_character = context:character()
			local acting_character_faction_key = acting_character:faction():name()
			local character_province_regions = acting_character:region():province():regions()
			for i=0, character_province_regions:num_items() - 1 do
				local curr_item = character_province_regions:item_at(i)
				local adj_regions = curr_item:adjacent_region_list()
				cm:make_region_visible_in_shroud(acting_character_faction_key, curr_item:name())

				for j=0, adj_regions:num_items() - 1 do
					cm:make_region_visible_in_shroud(acting_character_faction_key, adj_regions:item_at(j):name())
				end
			end
		end,
		true
	)

	core:add_listener(
		"troy_hep_agent_kabeiros_assist_settlement",
		"CharacterGarrisonTargetAction",
		function(context) return context:agent_action_key() == kabeiros_assist_settlement_keys.action_key or context:agent_action_key() == kabeiros_assist_settlement_keys.horde_action_key end,
		function(context)
			local garrison = context:garrison_residence()
			local region = garrison:region()
			if garrison:is_settlement() and garrison:settlement_interface():production_type() == "troy_main_settlement_major" then 
				kabeiros_settlement_effects(region, "major", true)
			else 
				kabeiros_settlement_effects(region, "minor", true)
			end
		end,
		true
	)

	core:add_listener (
		"Troy_epic_agent_kabeiros_assist_army",
		"FactionTurnStart",	-- NOTE: Listen on this event, rather than CharacterTurnStart, as we want the body to be executed after the unit recruitment is completed!
		true,
		function(context)
			local characters = context:faction():character_list()
			for c = 0, characters:num_items() - 1 do
				local character = characters:item_at(c)
				if character:character_subtype(kabeiros_subtype) and character:is_embedded_in_military_force() then
					local units, units_to_upgrade = character:embedded_in_military_force():unit_list(), {}
					for i = 0, units:num_items() - 1 do
						local unit = units:item_at(i)
						local bonuses = unit:get_unit_stat_bonuses()
						for _, upgrade in ipairs(kabeiros_assist_army.unit_equipment_upgrades) do
							if not bonuses[upgrade.bonus_key] then
								table.insert(units_to_upgrade, {unit = unit, cost = unit:get_unit_custom_battle_cost()})
								break
							end
						end
					end
		
					if #units_to_upgrade > kabeiros_assist_army.units_per_turn then
						units_to_upgrade = table_stable_sort(units_to_upgrade, function(a, b) return a.cost > b.cost end)
					end
		
					for i = 1, math.min(#units_to_upgrade, kabeiros_assist_army.units_per_turn) do
						local ccq = units_to_upgrade[i].unit:command_queue_index()
						for _, upgrade in ipairs(kabeiros_assist_army.unit_equipment_upgrades) do
							cm:add_unit_stat_bonuses(ccq, upgrade.bonus_key, upgrade.bonus_value)
						end
					end
				end
			end
		end,
		true
	)
end

-- Applying the settlement icons after loading.
core:add_listener(
	"troy_hep_kabeiros_affected_settlements_FirstTickAfterWorldCreated",
	"FirstTickAfterWorldCreated",
	true,
	function(context)
		local apply_icon = function(uid, settlements_list)
			for i, curr_entry in ipairs(settlements_list) do
				kabeiros_apply_icon(curr_entry.key, uid.icon_id, uid.icon_path, uid.description)
			end
		end
		apply_icon(kabeiros_settlement_ui_details.minor, kabeiros_modified_settlements.minor)
		apply_icon(kabeiros_settlement_ui_details.major, kabeiros_modified_settlements.major)
	end,
	true
)

core:add_listener(
	"troy_hep_kabeiros_affected_settlements_ownership_change",
	"RegionFactionChangeEvent",
	true,
	function(context)
		local region = context:region()
		local region_type 
		if region:garrison_residence():settlement_interface():production_type() == "troy_main_settlement_major" then 
			region_type = "major"
		else
			region_type = "minor"
		end
		local table_of_settlements = kabeiros_modified_settlements[region_type]
		if table_find(table_of_settlements, function(e) return e.key == region:name() end ) then 
			kabeiros_settlement_effects(region, region_type, false)
		end
	end,
	true
)

function seer_favour_drop(context,target)

	if target == "character" then
		local our_favours = context:character():faction():pooled_resources()
		local lowest_god = ""
		local lowest_god_amount = 1000
		for i=0,our_favours:num_items()-1 do
			local curr_res = our_favours:item_at(i)
			if string.find(curr_res:key(),'troy_god_attitude') then
				if curr_res:value() < lowest_god_amount then
					lowest_god_amount = curr_res:value()
					lowest_god = curr_res:key()
				end
			end
		end
		local enemy_favour_for_our_lowest_god
		local target_char_faction = context:target_character():faction()
		if not target_char_faction:pooled_resource(lowest_god):is_null_interface() then
			enemy_favour_for_our_lowest_god = target_char_faction:pooled_resource(lowest_god):value()
		end
		if enemy_favour_for_our_lowest_god == lowest_god_amount then
			do return end
		elseif enemy_favour_for_our_lowest_god > lowest_god_amount then
			local amount = (enemy_favour_for_our_lowest_god - lowest_god_amount) * -1 
			cm:faction_add_pooled_resource(target_char_faction:name(),lowest_god,gods_factors.agents,amount)
		elseif enemy_favour_for_our_lowest_god < lowest_god_amount then
			local amount = (lowest_god_amount - enemy_favour_for_our_lowest_god)
			cm:faction_add_pooled_resource(target_char_faction:name(),lowest_god,gods_factors.agents,amount)
		end
	elseif target == "settlement" then
		local our_favours = context:character():faction():pooled_resources()
		local lowest_god = ""
		local lowest_god_amount = 1000
		for i=0,our_favours:num_items()-1 do
			local curr_res = our_favours:item_at(i)
			if string.find(curr_res:key(),'troy_god_attitude') then
				if curr_res:value() < lowest_god_amount then
					lowest_god_amount = curr_res:value()
					lowest_god = curr_res:key()
				end
			end
		end
		local enemy_favour_for_our_lowest_god
		local target_garrison_residence_faction = context:garrison_residence():faction()
		if not target_garrison_residence_faction:pooled_resource(lowest_god):is_null_interface() then
			enemy_favour_for_our_lowest_god = target_garrison_residence_faction:pooled_resource(lowest_god):value()
		end
		if enemy_favour_for_our_lowest_god == lowest_god_amount then
			do return end
		elseif enemy_favour_for_our_lowest_god > lowest_god_amount then
			local amount = (enemy_favour_for_our_lowest_god - lowest_god_amount) * -1 
			cm:faction_add_pooled_resource(target_garrison_residence_faction:name(),lowest_god,gods_factors.agents,amount)
		elseif enemy_favour_for_our_lowest_god < lowest_god_amount then
			local amount = (lowest_god_amount - enemy_favour_for_our_lowest_god)
			cm:faction_add_pooled_resource(target_garrison_residence_faction:name(),lowest_god,gods_factors.agents,amount)
		end
	end
end

function kabeiros_settlement_effects(target_region, region_type, to_add)
	if region_type ~= "minor" and region_type ~= "major" then
		script_error("Specified region is out of scope. You provided --> ".. tostring(region))
		return
	end

	local uid = kabeiros_settlement_ui_details[region_type]
	local table_of_settlements = kabeiros_modified_settlements[region_type]
	local effect_bundle_key = kabeiros_assist_settlement_keys[region_type].effect_bundle
	local mods_table = kabeiros_settlement_mods[region_type]
	local tier_prefix = "tier_"
	local current_tier = 1

	local region_info = table_find(table_of_settlements, function(e) return e.key == target_region:name() end )
	if region_info then 
		if to_add then 
			current_tier = math.clamp(region_info.tier + 1, 1, 5)
		end
		region_info.tier = current_tier
	else 
		local new_entry = {key = target_region:name(), tier = current_tier}
		table.insert(table_of_settlements, new_entry)
		kabeiros_apply_icon(target_region:name(),uid.icon_id, uid.icon_path, uid.description)
	end

	local tier = tier_prefix..current_tier

	local updated_effect_bundle = cm:create_new_custom_effect_bundle(effect_bundle_key)
			
	for i = 0, updated_effect_bundle:effects():num_items() - 1 do
		local curr_effect = updated_effect_bundle:effects():item_at(i)
		local curr_effect_value = curr_effect:value()
		local new_value

		local effect = mods_table[tier][curr_effect:key()]
		if effect then
			new_value = effect
			updated_effect_bundle:set_effect_value(curr_effect, new_value)
		end
	end

	local has_deleted
	repeat
		bundle_effects = updated_effect_bundle:effects()
		has_deleted = false
		for j=0,bundle_effects:num_items() - 1 do
			local curr_effect = bundle_effects:item_at(j)
			local curr_effect_value = curr_effect:value()
			if curr_effect_value == 0 then
				updated_effect_bundle:remove_effect(curr_effect)
				has_deleted = true
				break
			end
		end
	until not has_deleted

	cm:apply_custom_effect_bundle_to_region(updated_effect_bundle, target_region)
end

function kabeiros_apply_icon(region_key, icon_id, icon_path, icon_tooltip_key)
	cm:set_custom_settlement_info_icon(region_key, icon_id, icon_path, icon_tooltip_key)
	CampaignUI.UpdateSettlementEffectIcons()
end

--[[ function add_epic_agent_to_recruitment_pool(context,agent) 
	local faction = context:faction():name()
	local turn_number = cm:model():turn_number()
	out("AGENT ABOUT TO BE ADDED TO POOL IS : "..agent)
	local name_prefix = "names_name_"
	local forename 
	local surname = ""
	local subtype
	if agent == "seer" then
		forename = name_prefix .. epic_agent_names[seer_subtype][cm:model():random_int(1,#epic_agent_names[seer_subtype])]
		out(forename)
		subtype = seer_subtype
	elseif agent == "satyr" then
		forename = name_prefix .. epic_agent_names[satyr_subtype][cm:model():random_int(1,#epic_agent_names[satyr_subtype])]
		subtype = satyr_subtype
	elseif agent == "gorgon" then 
		forename = name_prefix .. epic_agent_names[gorgon_subtype][cm:model():random_int(1,#epic_agent_names[gorgon_subtype])]
		subtype = gorgon_subtype
	end
	cm:spawn_character_to_pool(faction, forename, surname, "", "", 18, true, "engineer", subtype, false, "")
	if agent == "seer" then
		epic_agent_rec_cooldown.seer[faction] = epic_agent_rec_cooldown.seer[faction] + turn_number
		cm:trigger_incident(faction,epic_agent_incident_key,true)
	elseif agent == "satyr" then
		epic_agent_rec_cooldown.satyr[faction] = epic_agent_rec_cooldown.satyr[faction] + turn_number
		cm:trigger_incident(faction,epic_agent_incident_key,true)
	elseif agent == "gorgon" then 
		epic_agent_rec_cooldown.gorgon[faction] = epic_agent_rec_cooldown.gorgon[faction] + turn_number
		cm:trigger_incident(faction,epic_agent_incident_key,true)
	end
end ]]

--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------

cm:add_saving_game_callback(
	function(context)
		--cm:save_named_value("EPIC_AGENT_RECRUITMENT_COOLDOWN",epic_agent_rec_cooldown,context)
		--cm:save_named_value("EPIC_AGENT_TURNS_TO_LEAVE",epic_agent_time_to_leave,context)
		cm:save_named_value("KABEIROS_MODIFIED_SETTLEMENTS",kabeiros_modified_settlements,context)
	end
)

cm:add_loading_game_callback(
	function(context)
		--epic_agent_rec_cooldown 	= cm:load_named_value("EPIC_AGENT_RECRUITMENT_COOLDOWN",epic_agent_rec_cooldown,context)
		--epic_agent_time_to_leave 	= cm:load_named_value("EPIC_AGENT_TURNS_TO_LEAVE",epic_agent_time_to_leave,context)
		kabeiros_modified_settlements = cm:load_named_value("KABEIROS_MODIFIED_SETTLEMENTS",kabeiros_modified_settlements,context)

	end
)