out("Loading troy_aeneas_divine_missions.lua")

-- Constants and vars

AENEAS_DIVINE_MISSIONS_MISSION_KEYS = {
	"troy_main_divine_missions_conquest_aphrodite_early",
	"troy_main_divine_missions_conquest_aphrodite_mid",
	"troy_main_divine_missions_conquest_aphrodite_late",
	"troy_main_divine_missions_conquest_apollo_early",
	"troy_main_divine_missions_conquest_apollo_mid",
	"troy_main_divine_missions_conquest_apollo_late",
	"troy_main_divine_missions_conquest_ares_early",
	"troy_main_divine_missions_conquest_ares_mid",
	"troy_main_divine_missions_conquest_ares_late",
	"troy_main_divine_missions_conquest_artemis_early",
	"troy_main_divine_missions_conquest_artemis_mid",
	"troy_main_divine_missions_conquest_artemis_late",
	"troy_main_divine_missions_conquest_athena_early",
	"troy_main_divine_missions_conquest_athena_mid",
	"troy_main_divine_missions_conquest_athena_late",
	"troy_main_divine_missions_conquest_hera_early",
	"troy_main_divine_missions_conquest_hera_mid",
	"troy_main_divine_missions_conquest_hera_late",
	"troy_main_divine_missions_conquest_poseidon_early",
	"troy_main_divine_missions_conquest_poseidon_mid",
	"troy_main_divine_missions_conquest_poseidon_late",
	"troy_main_divine_missions_conquest_zeus_early",
	"troy_main_divine_missions_conquest_zeus_mid",
	"troy_main_divine_missions_conquest_zeus_late",
	"troy_main_divine_missions_raid_aphrodite_early",
	"troy_main_divine_missions_raid_apollo_early",
	"troy_main_divine_missions_raid_apollo_mid",
	"troy_main_divine_missions_raid_ares_early",
	"troy_main_divine_missions_raid_ares_mid",
	"troy_main_divine_missions_raid_ares_late",
	"troy_main_divine_missions_raid_artemis_early",
	"troy_main_divine_missions_raid_artemis_mid",
	"troy_main_divine_missions_raid_hera_early",
	"troy_main_divine_missions_raid_poseidon_early",
	"troy_main_divine_missions_raid_poseidon_mid",
	"troy_main_divine_missions_raid_zeus_early",
	"troy_main_divine_missions_raid_zeus_mid",
	"troy_main_divine_missions_kill_aphrodite_early",
	"troy_main_divine_missions_kill_apollo_early",
	"troy_main_divine_missions_kill_apollo_mid",
	"troy_main_divine_missions_kill_ares_early",
	"troy_main_divine_missions_kill_ares_mid",
	"troy_main_divine_missions_kill_ares_late",
	"troy_main_divine_missions_kill_artemis_early",
	"troy_main_divine_missions_kill_artemis_mid",
	"troy_main_divine_missions_kill_artemis_late",
	"troy_main_divine_missions_kill_athena_early",
	"troy_main_divine_missions_kill_hera_early",
	"troy_main_divine_missions_kill_hera_mid",
	"troy_main_divine_missions_kill_poseidon_early",
	"troy_main_divine_missions_kill_poseidon_mid",
	"troy_main_divine_missions_kill_zeus_early",
	"troy_main_divine_missions_kill_zeus_mid",
	"troy_main_divine_missions_kill_zeus_late",
	"troy_main_divine_missions_captives_aphrodite_early",
	"troy_main_divine_missions_captives_aphrodite_mid",
	"troy_main_divine_missions_captives_aphrodite_late",
	"troy_main_divine_missions_captives_apollo_early",
	"troy_main_divine_missions_captives_apollo_mid",
	"troy_main_divine_missions_captives_apollo_late",
	"troy_main_divine_missions_captives_ares_early",
	"troy_main_divine_missions_captives_ares_mid",
	"troy_main_divine_missions_captives_ares_late",
	"troy_main_divine_missions_captives_artemis_early",
	"troy_main_divine_missions_captives_artemis_mid",
	"troy_main_divine_missions_captives_artemis_late",
	"troy_main_divine_missions_captives_athena_early",
	"troy_main_divine_missions_captives_athena_mid",
	"troy_main_divine_missions_captives_athena_late",
	"troy_main_divine_missions_captives_hera_early",
	"troy_main_divine_missions_captives_hera_mid",
	"troy_main_divine_missions_captives_hera_late",
	"troy_main_divine_missions_captives_poseidon_early",
	"troy_main_divine_missions_captives_poseidon_mid",
	"troy_main_divine_missions_captives_poseidon_late",
	"troy_main_divine_missions_captives_zeus_early",
	"troy_main_divine_missions_captives_zeus_mid",
	"troy_main_divine_missions_captives_zeus_late",
	"troy_main_divine_missions_raze_or_sack_aphrodite_early",
	"troy_main_divine_missions_raze_or_sack_apollo_early",
	"troy_main_divine_missions_raze_or_sack_apollo_mid",
	"troy_main_divine_missions_raze_or_sack_ares_early",
	"troy_main_divine_missions_raze_or_sack_ares_mid",
	"troy_main_divine_missions_raze_or_sack_ares_late",
	"troy_main_divine_missions_raze_or_sack_artemis_early",
	"troy_main_divine_missions_raze_or_sack_artemis_mid",
	"troy_main_divine_missions_raze_or_sack_artemis_late",
	"troy_main_divine_missions_raze_or_sack_athena_early",
	"troy_main_divine_missions_raze_or_sack_athena_mid",
	"troy_main_divine_missions_raze_or_sack_athena_late",
	"troy_main_divine_missions_raze_or_sack_hera_early",
	"troy_main_divine_missions_raze_or_sack_poseidon_early",
	"troy_main_divine_missions_raze_or_sack_poseidon_mid",
	"troy_main_divine_missions_raze_or_sack_zeus_early",
	"troy_main_divine_missions_kill_x_aphrodite_early",
	"troy_main_divine_missions_kill_x_apollo_early",
	"troy_main_divine_missions_kill_x_apollo_mid",
	"troy_main_divine_missions_kill_x_ares_early",
	"troy_main_divine_missions_kill_x_ares_mid",
	"troy_main_divine_missions_kill_x_ares_late",
	"troy_main_divine_missions_kill_x_artemis_early",
	"troy_main_divine_missions_kill_x_artemis_mid",
	"troy_main_divine_missions_kill_x_athena_early",
	"troy_main_divine_missions_kill_x_athena_mid",
	"troy_main_divine_missions_kill_x_hera_early",
	"troy_main_divine_missions_kill_x_hera_mid",
	"troy_main_divine_missions_kill_x_hera_late",
	"troy_main_divine_missions_kill_x_poseidon_early",
	"troy_main_divine_missions_kill_x_poseidon_mid",
	"troy_main_divine_missions_kill_x_zeus_early",
	"troy_main_divine_missions_kill_x_zeus_mid",
	"troy_main_divine_missions_construct_n_aphrodite_early",
	"troy_main_divine_missions_construct_n_aphrodite_mid",
	"troy_main_divine_missions_construct_n_aphrodite_late",
	"troy_main_divine_missions_construct_n_apollo_early",
	"troy_main_divine_missions_construct_n_apollo_mid",
	"troy_main_divine_missions_construct_n_apollo_late",
	"troy_main_divine_missions_construct_n_ares_early",
	"troy_main_divine_missions_construct_n_ares_mid",
	"troy_main_divine_missions_construct_n_ares_late",
	"troy_main_divine_missions_construct_n_artemis_early",
	"troy_main_divine_missions_construct_n_artemis_mid",
	"troy_main_divine_missions_construct_n_artemis_late",
	"troy_main_divine_missions_construct_n_athena_early",
	"troy_main_divine_missions_construct_n_athena_mid",
	"troy_main_divine_missions_construct_n_athena_late",
	"troy_main_divine_missions_construct_n_hera_early",
	"troy_main_divine_missions_construct_n_hera_mid",
	"troy_main_divine_missions_construct_n_hera_late",
	"troy_main_divine_missions_construct_n_poseidon_early",
	"troy_main_divine_missions_construct_n_poseidon_mid",
	"troy_main_divine_missions_construct_n_poseidon_late",
	"troy_main_divine_missions_construct_n_zeus_late",
	"troy_main_divine_missions_attack_force_aphrodite_early",
	"troy_main_divine_missions_attack_force_aphrodite_mid",
	"troy_main_divine_missions_attack_force_aphrodite_late",
	"troy_main_divine_missions_attack_force_apollo_early",
	"troy_main_divine_missions_attack_force_apollo_mid",
	"troy_main_divine_missions_attack_force_apollo_late",
	"troy_main_divine_missions_attack_force_ares_early",
	"troy_main_divine_missions_attack_force_ares_mid",
	"troy_main_divine_missions_attack_force_ares_late",
	"troy_main_divine_missions_attack_force_artemis_early",
	"troy_main_divine_missions_attack_force_artemis_mid",
	"troy_main_divine_missions_attack_force_artemis_late",
	"troy_main_divine_missions_attack_force_athena_early",
	"troy_main_divine_missions_attack_force_athena_mid",
	"troy_main_divine_missions_attack_force_athena_late",
	"troy_main_divine_missions_attack_force_hera_early",
	"troy_main_divine_missions_attack_force_hera_mid",
	"troy_main_divine_missions_attack_force_hera_late",
	"troy_main_divine_missions_attack_force_poseidon_early",
	"troy_main_divine_missions_attack_force_poseidon_mid",
	"troy_main_divine_missions_attack_force_poseidon_late",
	"troy_main_divine_missions_attack_force_zeus_early",
	"troy_main_divine_missions_attack_force_zeus_mid",
	"troy_main_divine_missions_attack_force_zeus_late",
	"troy_main_divine_missions_have_resource_aphrodite_early",
	"troy_main_divine_missions_have_resource_aphrodite_mid",
	"troy_main_divine_missions_have_resource_aphrodite_late",
	"troy_main_divine_missions_have_resource_apollo_early",
	"troy_main_divine_missions_have_resource_apollo_mid",
	"troy_main_divine_missions_have_resource_ares_early",
	"troy_main_divine_missions_have_resource_artemis_early",
	"troy_main_divine_missions_have_resource_artemis_mid",
	"troy_main_divine_missions_have_resource_athena_early",
	"troy_main_divine_missions_have_resource_hera_early",
	"troy_main_divine_missions_have_resource_hera_mid",
	"troy_main_divine_missions_have_resource_hera_late",
	"troy_main_divine_missions_have_resource_poseidon_early",
	"troy_main_divine_missions_have_resource_poseidon_mid",
	"troy_main_divine_missions_have_resource_poseidon_late",
	"troy_main_divine_missions_have_resource_zeus_early",
	"troy_main_divine_missions_have_resource_zeus_mid",
	"troy_main_divine_missions_peace_aphrodite_early",
	"troy_main_divine_missions_peace_apollo_early",
	"troy_main_divine_missions_peace_athena_early",
	"troy_main_divine_missions_peace_hera_early",
	"troy_main_divine_missions_peace_poseidon_early",
	"troy_main_divine_missions_peace_zeus_early",
	"troy_main_divine_missions_rank_up_aphrodite_8",
	"troy_main_divine_missions_rank_up_aphrodite_12",
	"troy_main_divine_missions_rank_up_aphrodite_18",
	"troy_main_divine_missions_rank_up_aphrodite_26",
	"troy_main_divine_missions_rank_up_apollo_8",
	"troy_main_divine_missions_rank_up_apollo_12",
	"troy_main_divine_missions_rank_up_apollo_18",
	"troy_main_divine_missions_rank_up_apollo_26",
	"troy_main_divine_missions_rank_up_ares_8",
	"troy_main_divine_missions_rank_up_ares_12",
	"troy_main_divine_missions_rank_up_ares_18",
	"troy_main_divine_missions_rank_up_ares_26",
	"troy_main_divine_missions_rank_up_athena_8",
	"troy_main_divine_missions_rank_up_athena_12",
	"troy_main_divine_missions_rank_up_athena_18",
	"troy_main_divine_missions_rank_up_athena_26",
	"troy_main_divine_missions_rank_up_hera_8",
	"troy_main_divine_missions_rank_up_hera_12",
	"troy_main_divine_missions_rank_up_hera_18",
	"troy_main_divine_missions_rank_up_hera_26",
	"troy_main_divine_missions_rank_up_poseidon_8",
	"troy_main_divine_missions_rank_up_poseidon_12",
	"troy_main_divine_missions_rank_up_poseidon_18",
	"troy_main_divine_missions_rank_up_poseidon_26",
	"troy_main_divine_missions_rank_up_zeus_8",
	"troy_main_divine_missions_rank_up_zeus_12",
	"troy_main_divine_missions_rank_up_zeus_18",
	"troy_main_divine_missions_rank_up_zeus_26",
	"troy_main_divine_missions_war_aphrodite_def",
	"troy_main_divine_missions_war_aphrodite_mil",
	"troy_main_divine_missions_war_apollo_def",
	"troy_main_divine_missions_war_apollo_mil",
	"troy_main_divine_missions_war_ares_def",
	"troy_main_divine_missions_war_ares_mil",
	"troy_main_divine_missions_war_artemis_def",
	"troy_main_divine_missions_war_artemis_mil",
	"troy_main_divine_missions_war_athena_def",
	"troy_main_divine_missions_war_athena_mil",
	"troy_main_divine_missions_war_hera_def",
	"troy_main_divine_missions_war_hera_mil",
	"troy_main_divine_missions_war_poseidon_def",
	"troy_main_divine_missions_war_poseidon_mil",
	"troy_main_divine_missions_war_zeus_def",
	"troy_main_divine_missions_war_zeus_mil",
	"troy_main_divine_missions_recruit_agent_aphrodite_envoy",
	"troy_main_divine_missions_recruit_agent_aphrodite_spy",
	"troy_main_divine_missions_recruit_agent_aphrodite_priest",
	"troy_main_divine_missions_recruit_agent_apollo_envoy",
	"troy_main_divine_missions_recruit_agent_apollo_spy",
	"troy_main_divine_missions_recruit_agent_apollo_priest",
	"troy_main_divine_missions_recruit_agent_ares_spy",
	"troy_main_divine_missions_recruit_agent_ares_priest",
	"troy_main_divine_missions_recruit_agent_artemis_envoy",
	"troy_main_divine_missions_recruit_agent_artemis_spy",
	"troy_main_divine_missions_recruit_agent_artemis_priest",
	"troy_main_divine_missions_recruit_agent_athena_envoy",
	"troy_main_divine_missions_recruit_agent_athena_spy",
	"troy_main_divine_missions_recruit_agent_athena_priest",
	"troy_main_divine_missions_recruit_agent_hera_envoy",
	"troy_main_divine_missions_recruit_agent_hera_spy",
	"troy_main_divine_missions_recruit_agent_hera_priest",
	"troy_main_divine_missions_recruit_agent_poseidon_envoy",
	"troy_main_divine_missions_recruit_agent_poseidon_spy",
	"troy_main_divine_missions_recruit_agent_poseidon_priest",
	"troy_main_divine_missions_recruit_agent_zeus_envoy",
	"troy_main_divine_missions_recruit_agent_zeus_spy",
	"troy_main_divine_missions_recruit_agent_zeus_priest",
	"troy_main_divine_missions_attack_force_artemis_early",
	"troy_main_divine_missions_attack_force_artemis_late",
	"troy_main_divine_missions_attack_force_artemis_mid",
	"troy_main_divine_missions_captives_artemis_early",
	"troy_main_divine_missions_captives_artemis_late",
	"troy_main_divine_missions_captives_artemis_mid",
	"troy_main_divine_missions_conquest_artemis_early",
	"troy_main_divine_missions_conquest_artemis_late",
	"troy_main_divine_missions_conquest_artemis_mid",
	"troy_main_divine_missions_construct_n_artemis_early",
	"troy_main_divine_missions_construct_n_artemis_late",
	"troy_main_divine_missions_construct_n_artemis_mid",
	"troy_main_divine_missions_have_resource_artemis_early",
	"troy_main_divine_missions_kill_artemis_early",
	"troy_main_divine_missions_kill_x_artemis_early",
	"troy_main_divine_missions_kill_x_artemis_mid",
	"troy_main_divine_missions_peace_artemis_early",
	"troy_main_divine_missions_rank_up_artemis_8",
	"troy_main_divine_missions_rank_up_artemis_12",
	"troy_main_divine_missions_rank_up_artemis_18",
	"troy_main_divine_missions_rank_up_artemis_26",
	"troy_main_divine_missions_raze_or_sack_artemis_early",
	"troy_main_divine_missions_raze_or_sack_artemis_late",
	"troy_main_divine_missions_raze_or_sack_artemis_mid",
	"troy_main_divine_missions_recruit_agent_artemis_envoy",
	"troy_main_divine_missions_recruit_agent_artemis_priest",
	"troy_main_divine_missions_recruit_agent_artemis_spy",
	"troy_main_divine_missions_war_artemis_def",
	"troy_main_divine_missions_war_artemis_mil",
	"troy_hep_divine_missions_attack_force_hephaestus_early",
	"troy_hep_divine_missions_attack_force_hephaestus_late",
	"troy_hep_divine_missions_attack_force_hephaestus_mid",
	"troy_hep_divine_missions_captives_hephaestus_early",
	"troy_hep_divine_missions_captives_hephaestus_late",
	"troy_hep_divine_missions_captives_hephaestus_mid",
	"troy_hep_divine_missions_conquest_hephaestus_early",
	"troy_hep_divine_missions_conquest_hephaestus_late",
	"troy_hep_divine_missions_conquest_hephaestus_mid",
	"troy_hep_divine_missions_construct_n_hephaestus_early",
	"troy_hep_divine_missions_construct_n_hephaestus_late",
	"troy_hep_divine_missions_construct_n_hephaestus_mid",
	"troy_hep_divine_missions_have_resource_hephaestus_early",
	"troy_hep_divine_missions_kill_hephaestus_early",
	"troy_hep_divine_missions_kill_x_hephaestus_early",
	"troy_hep_divine_missions_kill_x_hephaestus_mid",
	"troy_hep_divine_missions_peace_hephaestus_early",
	"troy_hep_divine_missions_rank_up_hephaestus_12",
	"troy_hep_divine_missions_rank_up_hephaestus_18",
	"troy_hep_divine_missions_rank_up_hephaestus_26",
	"troy_hep_divine_missions_rank_up_hephaestus_8",
	"troy_hep_divine_missions_raze_or_sack_hephaestus_early",
	"troy_hep_divine_missions_raze_or_sack_hephaestus_late",
	"troy_hep_divine_missions_raze_or_sack_hephaestus_mid",
	"troy_hep_divine_missions_recruit_agent_hephaestus_envoy",
	"troy_hep_divine_missions_recruit_agent_hephaestus_priest",
	"troy_hep_divine_missions_recruit_agent_hephaestus_spy",
	"troy_hep_divine_missions_war_hephaestus_def",
	"troy_hep_divine_missions_war_hephaestus_mil"
}

AENEAS_DIVINE_MISSIONS_UI_PARAMS = {
	cost = 
	{
		{
			key = "troy_food",
			val = 300
		},
		{
			key = "troy_bronze",
			val = 50
		},
		{
			key = "troy_gold",
			val = 20
		}
		
	},
	cooldown = 5
}

AENEAS_DIVINE_MISSIONS_ISSUERS = 
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

Aeneas_faction = "troy_main_trj_dardania"
Aeneas_divine_missions_cost_factor = "troy_main_fm_aeneas_divine_omens"

function aeneas_divine_missions_issue_missions(faction)
	-- time to pay the piper
	for i=1, #AENEAS_DIVINE_MISSIONS_UI_PARAMS.cost do
		cm:faction_add_pooled_resource(Aeneas_faction,AENEAS_DIVINE_MISSIONS_UI_PARAMS.cost[i].key,Aeneas_divine_missions_cost_factor,(AENEAS_DIVINE_MISSIONS_UI_PARAMS.cost[i].val * -1))
	end

	local num_missions_fired = 0
	repeat 
		local random = cm:model():random_int(1,#AENEAS_DIVINE_MISSIONS_MISSION_KEYS)
		local mission_to_fire = AENEAS_DIVINE_MISSIONS_MISSION_KEYS[cm:model():random_int(1,#AENEAS_DIVINE_MISSIONS_MISSION_KEYS)]
		if cm:trigger_mission(faction:name(),mission_to_fire,true) then
			num_missions_fired = num_missions_fired + 1
		end
	until num_missions_fired == 3
	AENEAS_DIVINE_MISSIONS_UI_PARAMS["cooldown"] = 5
	aeneas_divine_missions_update_ui()
end

function aeneas_divine_missions_update_ui()
	local panel = find_uicomponent(core:get_ui_root(), "fm_divine_missions")
	if panel and panel:Visible() then
		panel:InterfaceFunction("set_data", AENEAS_DIVINE_MISSIONS_UI_PARAMS)
		if AENEAS_DIVINE_MISSIONS_UI_PARAMS["cooldown"] > 0 then 
			find_uicomponent(panel, "btn_entreat_the_gods"):SetState("inactive")
		end
	end
	
end

function aeneas_divine_missions_button_pressed()
	local faction_name = cm:get_local_faction_name(true)
	local faction = cm:model():world():faction_by_key(faction_name)
	CampaignUI.TriggerCampaignScriptEvent(faction:command_queue_index(), "divine_missions_event")
end

-- triggers and listeners
function aeneas_divine_missions_add_listeners()
	out("AeneasDivineMissions_AddListeners()")

	core:add_listener(
		"divine_missions_event_triggered",
		"UITriggerScriptEvent",
		function(context) return context:trigger() == "divine_missions_event" end,
		function(context)
			local faction_cqi = context:faction_cqi()
			local faction = cm:model():faction_for_command_queue_index(faction_cqi)
			aeneas_divine_missions_issue_missions(faction)
		end,
		true
	)

	-- start of turn listener
	core:add_listener (
		"AeneasDivineMissions_FactionTurnStart",
		"FactionTurnStart",
		function(context)
			return context:faction():name() == Aeneas_faction
		end,
		function(context) 
			if AENEAS_DIVINE_MISSIONS_UI_PARAMS["cooldown"] > 0 then
			AENEAS_DIVINE_MISSIONS_UI_PARAMS["cooldown"] = AENEAS_DIVINE_MISSIONS_UI_PARAMS["cooldown"] - 1 
			end
		end,
		true
	)

	-- panel opened
	core:add_listener (
		"AeneasDivineMissions_PanelOpenedCampaign",
		"PanelOpenedCampaign",
		function(context) return context.string == "fm_divine_missions" end,
		function(context)
			core:add_listener(
				"aeneas_divine_missions_component_lclickup",
				"ComponentLClickUp", 
				function(context) 
					return context.string == "btn_entreat_the_gods"
				end,
				function(context)
						local panel = core:get_ui_root():SequentialFind("fm_divine_missions")
						create_confirmation_box("divine_missions_dialogue_box", "campaign_localised_strings_string_divine_missions_dialogue_box_msg", 
							function(context)
								aeneas_divine_missions_button_pressed()
							end,
							nil,
							panel
						)
				end,
				true
			)
			aeneas_divine_missions_update_ui()
		end,
		true
	)
	
	-- panel closed
	core:add_listener(
		"AeneasDivineMissions_PanelClosedCampaign",
		"PanelClosedCampaign",
		function(context) return context.string == "fm_divine_missions" end,
		function(context)
			core:remove_listener("aeneas_divine_missions_component_lclickup")
		end,
		true
	)

	-- epic missions event
	core:add_listener(
		"AeneasDivineMissions_MissionSucceeded",
		"MissionSucceeded",
		function(context) return context:faction():name() == Aeneas_faction end,
		function(context)
			for _, mission_key in ipairs(AENEAS_DIVINE_MISSIONS_MISSION_KEYS) do
				if mission_key == context:mission():mission_record_key() then
					core:trigger_event("ScriptedEventDivineMissionCompleted", context:faction())
					break
				end
			end
		end,
		true
	)
end

--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------

cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("AENEAS_DIVINE_MISSIONS_UI_PARAMS",AENEAS_DIVINE_MISSIONS_UI_PARAMS,context)
	end
)

cm:add_loading_game_callback(
	function(context)
		AENEAS_DIVINE_MISSIONS_UI_PARAMS = cm:load_named_value("AENEAS_DIVINE_MISSIONS_UI_PARAMS",AENEAS_DIVINE_MISSIONS_UI_PARAMS,context) 
	end
)