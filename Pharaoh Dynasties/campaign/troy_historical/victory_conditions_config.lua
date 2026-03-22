out("Loading victory_conditions_config.lua")

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

victory_objectives_ui_categories = {}

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