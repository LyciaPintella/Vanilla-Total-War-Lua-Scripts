out("Loading victory_objectives_config.lua")

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

-- TODO: documentation on supported types of activation and completion conditions

-- changing objective id, isn't safe unless code is added to cover such changes

-- any change to activation conditions on a already activated objective will not affect the objective
-- removing an acitvation condition when objective isn't activated - isn't safe unless code is added to cover such changes
-- adding new activation condition when objective isn't activated - will work as if the condition was always there

-- adding new completion condition when objective isn't completed
-- the new condition will not be evaluated from the start and will appear as incomplete even if it should be considered completed
-- no vp will be gained on start

-- adding new completion condition when objective is completed 
-- the new condition will not be evaluated from the start
-- the new condition will appear as incomplete even if the requirements are met
-- no vp will be lost on start

-- removing a completion condition when objective isn't completed
-- the objective will not be reevaluated
-- the condition will not be marked as completed even if the requirements are met
-- no vp will be gained on start

-- removing a completion condition when objective is completed
-- the objective will not be reevaluated
-- no vp will be lost on start

victory_conditions_data = {
	["phar_main_amenmesse"] = {
		[1] = 
		{
			victory_mission_key = "phar_amenmesse_point_victory",														-- Has to be unique
			script_key 			= "phar_amenmesse_point_victory_complete_quest",										-- This is linked to victory_objectives.txt
			text_key 			= "mission_text_text_troy_victory_personal_complete_quest_text_scripted",
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	["phar_main_tausret"] = {
		[1] = 
		{
			victory_mission_key = "phar_tausret_point_victory",														-- Has to be unique
			script_key 			= "phar_tausret_point_victory_complete_quest",										-- This is linked to victory_objectives.txt
			text_key 			= "mission_text_text_troy_victory_personal_complete_quest_text_scripted",
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	["phar_main_setnakhte"] = {
		[1] = 
		{
			victory_mission_key = "phar_setnakhte_point_victory",														-- Has to be unique
			script_key 			= "phar_setnakhte_point_victory_complete_quest",										-- This is linked to victory_objectives.txt
			text_key 			= "mission_text_text_troy_victory_personal_complete_quest_text_scripted",
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	["phar_main_bay"] = {
		[1] = 
		{
			victory_mission_key = "phar_bay_point_victory",														-- Has to be unique
			script_key 			= "phar_bay_point_victory_complete_quest",										-- This is linked to victory_objectives.txt
			text_key 			= "mission_text_text_troy_victory_personal_complete_quest_text_scripted",
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	["phar_main_irsu"] = {
		[1] = 
		{
			victory_mission_key = "phar_irsu_point_victory",													-- Has to be unique
			script_key 			= "phar_irsu_point_victory_complete_quest",										-- This is linked to victory_objectives.txt
			text_key 			= "mission_text_text_troy_victory_personal_complete_quest_text_scripted",
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	["phar_main_ramesses"] = {
		[1] = 
		{
			victory_mission_key = "phar_ramesses_point_victory",													-- Has to be unique
			script_key 			= "phar_ramesses_point_victory_complete_quest",										-- This is linked to victory_objectives.txt
			text_key 			= "mission_text_text_troy_victory_personal_complete_quest_text_scripted",
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	["phar_main_merneptah"] = {
		[1] = 
		{
			victory_mission_key = "phar_merneptah_point_victory",														-- Has to be unique
			script_key 			= "phar_merneptah_point_victory_complete_quest",										-- This is linked to victory_objectives.txt
			text_key 			= "mission_text_text_troy_victory_personal_complete_quest_text_scripted",
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	["phar_main_seti"] = {
		[1] = 
		{
			victory_mission_key = "phar_seti_point_victory",														-- Has to be unique
			script_key 			= "phar_seti_point_victory_complete_quest",											-- This is linked to victory_objectives.txt
			text_key 			= "mission_text_text_troy_victory_personal_complete_quest_text_scripted",
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	["phar_main_suppiluliuma"] = {
		[1] = 
		{
			victory_mission_key = "phar_suppiluliuma_point_victory",													-- Has to be unique
			script_key 			= "phar_suppiluliuma_point_victory_complete_quest",										-- This is linked to victory_objectives.txt
			text_key 			= "mission_text_text_troy_victory_personal_complete_quest_text_scripted",
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	["phar_main_kurunta"] = {
		[1] = 
		{
			victory_mission_key = "phar_kurunta_point_victory",													-- Has to be unique
			script_key 			= "phar_kurunta_point_victory_complete_quest",										-- This is linked to victory_objectives.txt
			text_key 			= "mission_text_text_troy_victory_personal_complete_quest_text_scripted",
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	["phar_sea_sherden"] = {
		[1] = 
		{
			victory_mission_key = "phar_irsu_point_victory",													-- Has to be unique
			script_key 			= "phar_irsu_point_victory_complete_quest",										-- This is linked to victory_objectives.txt
			text_key 			= "mission_text_text_troy_victory_personal_complete_quest_text_scripted",
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	["phar_sea_peleset"] = {
		[1] = 
		{
			victory_mission_key = "phar_irsu_point_victory",													-- Has to be unique
			script_key 			= "phar_irsu_point_victory_complete_quest",										-- This is linked to victory_objectives.txt
			text_key 			= "mission_text_text_troy_victory_personal_complete_quest_text_scripted",
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
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
	} 
}

victory_objectives_ui_categories = {
	--[[
	Victory Objectives can have optional fields/properties:
	- sub_category - sub category used by the UI
	- ignore_add_feed_message_on_campaign_start - tells the system to not add event feed message whenever the objective is activated on campaign start

	categories that have sub categories don't need to specify total_victory_points since it is the sum of their categories and it's calculated dynamically
	test_category = {
		title_key = "campaign_localised_strings_string_TODO",
		description_key = "campaign_localised_strings_string_TODO",
		priority = 1,
		total_victory_points = 30, -- Remove this if category has subcategories
	},
	test_sub_category = {
		title_key = "campaign_localised_strings_string_TODO",
		description_key = "campaign_localised_strings_string_TODO",
		priority = 1,
		total_victory_points = 30,
	},
	--]]

	victory_objectives_category_conquests = {
		id = "victory_objectives_category_conquests",
		title_key = "campaign_localised_strings_string_phar_main_victory_objectives_category_conquests_title",
		description_key = "campaign_localised_strings_string_phar_main_victory_objectives_category_conquests_desc",
		tooltip_description_key = "campaign_localised_strings_string_phar_main_victory_objectives_category_conquests_tooltip_desc",
		priority = 1,
	},
-- New subcategory for Sea Peoples--
	victory_objectives_subcategory_invasion = {
		id = "victory_objectives_subcategory_invasion",
		title_key = "campaign_localised_strings_string_phar_sea_victory_objectives_subcategory_invasion_title",
		description_key = "campaign_localised_strings_string_phar_sea_victory_objectives_subcategory_invasion_desc",
		tooltip_description_key = "campaign_localised_strings_string_phar_sea_victory_objectives_subcategory_invasion_tooltip_desc",
		priority = 1,
		total_victory_points = 34,	--- This can go higher than this. Need solution
	},

	victory_objectives_subcategory_homelands = {
		id = "victory_objectives_subcategory_homelands",
		title_key = "campaign_localised_strings_string_phar_main_victory_objectives_subcategory_homelands_title",
		description_key = "campaign_localised_strings_string_phar_main_victory_objectives_subcategory_homelands_desc",
		tooltip_description_key = "campaign_localised_strings_string_phar_main_victory_objectives_subcategory_conquests_homelands_tooltip_desc",
		priority = 1,
		total_victory_points = 34,	--- This can go higher than this. Need solution
	},

	victory_objectives_subcategory_foreignlands = {
		id = "victory_objectives_subcategory_foreignlands",
		title_key = "campaign_localised_strings_string_phar_main_victory_objectives_subcategory_foreignlands_title",
		description_key = "campaign_localised_strings_string_phar_main_victory_objectives_subcategory_foreignlands_desc",
		tooltip_description_key = "campaign_localised_strings_string_phar_main_victory_objectives_subcategory_conquests_foreignlands_tooltip_desc",
		priority = 2,
		total_victory_points = 34,	--- This can go higher than this. Need solution
	},

	victory_objectives_subcategory_prominence = {
		id = "victory_objectives_subcategory_prominence",
		title_key = "campaign_localised_strings_string_phar_main_victory_objectives_subcategory_prominence_title",
		description_key = "campaign_localised_strings_string_phar_main_victory_objectives_subcategory_prominence_desc",
		tooltip_description_key = "campaign_localised_strings_string_phar_main_victory_objectives_subcategory_conquests_prominences_tooltip_desc",
		priority = 3,
		total_victory_points = 32,  -- This never goes above 32. All good
	},

	victory_objectives_subcategory_raze_sacred_lands_egypt = {
		id = "victory_objectives_subcategory_raze_sacred_lands_egypt",
		title_key = "campaign_localised_strings_string_phar_sea_victory_objectives_subcategory_sacred_lands_egypt_title",
		description_key = "campaign_localised_strings_string_phar_sea_victory_objectives_common_raze_enemy_settlements_desc",
		tooltip_description_key = "campaign_localised_strings_string_phar_sea_victory_objectives_subcategory_sacred_lands_egypt_desc",
		priority = 3,
		total_victory_points = 100,
	},

	victory_objectives_subcategory_raze_sacred_lands_hati = {
		id = "victory_objectives_subcategory_raze_sacred_lands_hati",
		title_key = "campaign_localised_strings_string_phar_sea_victory_objectives_subcategory_sacred_lands_hati_title",
		description_key = "campaign_localised_strings_string_phar_sea_victory_objectives_common_raze_enemy_settlements_desc",
		tooltip_description_key = "campaign_localised_strings_string_phar_sea_victory_objectives_subcategory_sacred_lands_hati_desc",
		priority = 3,
		total_victory_points = 100,
	},

	victory_objectives_category_feats = {
		id = "victory_objectives_category_feats",
		title_key = "campaign_localised_strings_string_phar_main_victory_objectives_category_feats_title",
		description_key = "campaign_localised_strings_string_phar_main_victory_objectives_category_feats_desc",
		tooltip_description_key = "campaign_localised_strings_string_phar_main_victory_objectives_category_feats_tooltip_desc",
		priority = 2,
		total_victory_points = 100,
	},
	victory_objectives_category_buildings = {
		id = "victory_objectives_category_buildings",
		title_key = "campaign_localised_strings_string_phar_main_victory_objectives_category_buildings_title",
		description_key = "campaign_localised_strings_string_phar_main_victory_objectives_category_buildings_desc",
		tooltip_description_key = "campaign_localised_strings_string_phar_main_victory_objectives_category_buildings_tooltip_desc",
		priority = 3,
		total_victory_points = 41,
	},
	victory_objectives_category_ambitions = {
		id = "victory_objectives_category_ambitions",
		title_key = "campaign_localised_strings_string_phar_main_victory_objectives_category_ambitions_title",
		description_key = "campaign_localised_strings_string_phar_main_victory_objectives_category_ambitions_desc",
		tooltip_description_key = "campaign_localised_strings_string_phar_main_victory_objectives_category_ambitions_tooltip_desc",
		priority = 4,
		total_victory_points = 100,
		factor_id = "phar_victory_points_missions",
	},
}

-------------------------------------------------------------
-- Table for restrictions used in victory conditions.
-------------------------------------------------------------

local victory_objectives_cultures_all_excluding_sea_peoples = {
	[1] = "phar_main_clt_kemet",
	[2] = "phar_main_clt_hatti",
	[3] = "phar_main_clt_canaan"
}

local victory_objectives_subculters_sea_peoples = {
	[1] = "phar_main_sbc_sea_peoples_sea_wanderers",
	[2] = "phar_main_sbc_sea_peoples_western_islanders"
}

-------------------------------------------------------------
-- Victory Objectives Start Here:
-------------------------------------------------------------

victory_objectives_data = {
	
	-------------------------------------------------------------
	-- Homeland conquest-related VCs from Egyptian point of view
	-------------------------------------------------------------
	
	{
		uid 				= "egyptian_conquest_sel_lower_egypt_buto",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_lower_egypt_buto_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_lower_egypt_buto_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_buto_buto",
					"phar_main_buto_sais",
					"phar_main_buto_paiuenamun"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_buto_buto"
			},
			{
				type = "control_region",
				region_key = "phar_main_buto_sais"
			},
			{
				type = "control_region",
				region_key = "phar_main_buto_paiuenamun"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_sel_lower_egypt_faiyum",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_lower_egypt_faiyum_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_lower_egypt_faiyum_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_faiyum_faiyum",
					"phar_main_faiyum_dahshur",
					"phar_main_faiyum_khem"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_faiyum_faiyum"
			},
			{
				type = "control_region",
				region_key = "phar_main_faiyum_dahshur"
			},
			{
				type = "control_region",
				region_key = "phar_main_faiyum_khem"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_sel_lower_egypt_hardai",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_lower_egypt_hardai_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_lower_egypt_hardai_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{ 
					"phar_main_hardai_tep_aha",
					"phar_main_hardai_ur_gem",
					"phar_main_hardai_hardai"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_hardai_tep_aha"
			},
			{
				type = "control_region",
				region_key = "phar_main_hardai_ur_gem"
			},
			{
				type = "control_region",
				region_key = "phar_main_hardai_hardai"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_sel_lower_egypt_heliopolis",
		vp_reward 			= 1,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_lower_egypt_heliopolis_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_lower_egypt_heliopolis_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_heliopolis_heliopolis",
					"phar_main_heliopolis_qes"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_heliopolis_heliopolis"
			},
			{
				type = "control_region",
				region_key = "phar_main_heliopolis_qes"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_sel_lower_egypt_herakleopolis",
		vp_reward 			= 1,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_lower_egypt_herakleopolis_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_lower_egypt_herakleopolis_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_herakleopolis_sheps_khu",
					"phar_main_herakleopolis_herakleopolis"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_herakleopolis_sheps_khu"
			},
			{
				type = "control_region",
				region_key = "phar_main_herakleopolis_herakleopolis"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_sel_lower_egypt_hermopolis",
		vp_reward 			= 1,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_lower_egypt_hermopolis_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_lower_egypt_hermopolis_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_hermopolis_ti_ar",
					"phar_main_hermopolis_hermopolis"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_hermopolis_ti_ar"
			},
			{
				type = "control_region",
				region_key = "phar_main_hermopolis_hermopolis"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_sel_lower_egypt_memphis",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_lower_egypt_memphis_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_lower_egypt_memphis_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_memphis_helwan",
					"phar_main_memphis_petpeh",
					"phar_main_memphis_memphis"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_memphis_helwan"
			},
			{
				type = "control_region",
				region_key = "phar_main_memphis_petpeh"
			},
			{
				type = "control_region",
				region_key = "phar_main_memphis_memphis"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_sel_lower_egypt_pi_ramesses",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_lower_egypt_pi_ramesses_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_lower_egypt_pi_ramesses_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_pi_ramesses_tjaru",
					"phar_main_pi_ramesses_per_amun",
					"phar_main_pi_ramesses_pi_ramesses"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_pi_ramesses_tjaru"
			},
			{
				type = "control_region",
				region_key = "phar_main_pi_ramesses_per_amun"
			},
			{
				type = "control_region",
				region_key = "phar_main_pi_ramesses_pi_ramesses"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_sel_lower_egypt_rhacotis",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_lower_egypt_rhacotis_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_lower_egypt_rhacotis_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_rhacotis_khan_aha",
					"phar_main_rhacotis_qema",
					"phar_main_rhacotis_rhacotis"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_rhacotis_khan_aha"
			},
			{
				type = "control_region",
				region_key = "phar_main_rhacotis_qema"
			},
			{
				type = "control_region",
				region_key = "phar_main_rhacotis_rhacotis"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_sel_upper_egypt_abydos",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_upper_egypt_abydos_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_upper_egypt_abydos_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_abydos_abydos",
					"phar_main_abydos_tin",
					"phar_main_abydos_aakh_ner"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_abydos_abydos"
			},
			{
				type = "control_region",
				region_key = "phar_main_abydos_tin"
			},
			{
				type = "control_region",
				region_key = "phar_main_abydos_aakh_ner"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_sel_upper_egypt_akhmim",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_upper_egypt_akhmim_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_upper_egypt_akhmim_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_akhmim_akhmim",
					"phar_main_akhmim_ur_men",
					"phar_main_akhmim_mefka_qes"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_akhmim_akhmim"
			},
			{
				type = "control_region",
				region_key = "phar_main_akhmim_ur_men"
			},
			{
				type = "control_region",
				region_key = "phar_main_akhmim_mefka_qes"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_sel_upper_egypt_asyut",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_upper_egypt_asyut_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_upper_egypt_asyut_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_asyut_kep_un",
					"phar_main_asyut_asyut",
					"phar_main_asyut_tem_khus"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_asyut_kep_un"
			},
			{
				type = "control_region",
				region_key = "phar_main_asyut_asyut"
			},
			{
				type = "control_region",
				region_key = "phar_main_asyut_tem_khus"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_sel_upper_egypt_elephantine",
		vp_reward 			= 3,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_upper_egypt_elephantine_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_upper_egypt_elephantine_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_elephantine_elephantine",
					"phar_main_elephantine_tep_hetem",
					"phar_main_elephantine_hierakonpolis",
					"phar_main_elephantine_mes"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_elephantine_elephantine"
			},
			{
				type = "control_region",
				region_key = "phar_main_elephantine_tep_hetem"
			},
			{
				type = "control_region",
				region_key = "phar_main_elephantine_hierakonpolis"
			},
			{
				type = "control_region",
				region_key = "phar_main_elephantine_mes"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_sel_upper_egypt_kom_ombo",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_upper_egypt_kom_ombo_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_upper_egypt_kom_ombo_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kom_ombo_tchu_ua",
					"phar_main_kom_ombo_kom_ombo",
					"phar_main_kom_ombo_kha_sba"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_kom_ombo_tchu_ua"
			},
			{
				type = "control_region",
				region_key = "phar_main_kom_ombo_kom_ombo"
			},
			{
				type = "control_region",
				region_key = "phar_main_kom_ombo_kha_sba"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_sel_upper_egypt_thebes",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_upper_egypt_thebes_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_upper_egypt_thebes_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_thebes_kha_ti",
					"phar_main_thebes_sma_ua",
					"phar_main_thebes_thebes"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_thebes_kha_ti"
			},
			{
				type = "control_region",
				region_key = "phar_main_thebes_sma_ua"
			},
			{
				type = "control_region",
				region_key = "phar_main_thebes_thebes"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_sel_nubia_buhen",
		vp_reward 			= 3,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_nubia_buhen_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_nubia_buhen_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_buhen_shesp_ma",
					"phar_main_buhen_her_hetem",
					"phar_main_buhen_hap_au",
					"phar_main_buhen_buhen"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_buhen_shesp_ma"
			},
			{
				type = "control_region",
				region_key = "phar_main_buhen_her_hetem"
			},
			{
				type = "control_region",
				region_key = "phar_main_buhen_hap_au"
			},
			{
				type = "control_region",
				region_key = "phar_main_buhen_buhen"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_sel_nubia_north_nubia",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_nubia_north_nubia_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_nubia_north_nubia_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_north_nubia_res_pa",
					"phar_main_north_nubia_mu_ua",
					"phar_main_north_nubia_miam"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_north_nubia_res_pa"
			},
			{
				type = "control_region",
				region_key = "phar_main_north_nubia_mu_ua"
			},
			{
				type = "control_region",
				region_key = "phar_main_north_nubia_miam"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_sel_kush_per_ramesses_meri_amon",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },

		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_kush_per_ramesses_meri_amon_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_kush_per_ramesses_meri_amon_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_per_ramesses_meri_amon_per_ramesses_meri_amon",
					"phar_main_per_ramesses_meri_amon_hap_sh",
					"phar_main_per_ramesses_meri_amon_khet_pa"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_per_ramesses_meri_amon_per_ramesses_meri_amon"
			},
			{
				type = "control_region",
				region_key = "phar_main_per_ramesses_meri_amon_hap_sh"
			},
			{
				type = "control_region",
				region_key = "phar_main_per_ramesses_meri_amon_khet_pa"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_sel_western_desert_kharga_oasis",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_western_desert_kharga_oasis_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_western_desert_kharga_oasis_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kharga_oasis_kharga_oasis",
					"phar_main_kharga_oasis_shesp_net",
					"phar_main_kharga_oasis_tebh"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_kharga_oasis_kharga_oasis"
			},
			{
				type = "control_region",
				region_key = "phar_main_kharga_oasis_shesp_net"
			},
			{
				type = "control_region",
				region_key = "phar_main_kharga_oasis_tebh"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_sel_western_desert_kurkur_oasis",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_western_desert_kurkur_oasis_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_western_desert_kurkur_oasis_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kurkur_oasis_kurkur_oasis",
					"phar_main_kurkur_oasis_sen_hetem",
					"phar_main_kurkur_oasis_tcheba_ua"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_kurkur_oasis_kurkur_oasis"
			},
			{
				type = "control_region",
				region_key = "phar_main_kurkur_oasis_sen_hetem"
			},
			{
				type = "control_region",
				region_key = "phar_main_kurkur_oasis_tcheba_ua"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_sel_kush_kerma",
		vp_reward 			= 3,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_kush_kerma_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_kush_kerma_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kerma_kerma",
					"phar_main_kerma_nu_abu",
					"phar_main_kerma_uab_khu",
					"phar_main_kerma_mu_sh"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_kerma_kerma"
			},
			{
				type = "control_region",
				region_key = "phar_main_kerma_nu_abu"
			},
			{
				type = "control_region",
				region_key = "phar_main_kerma_uab_khu"
			},
			{
				type = "control_region",
				region_key = "phar_main_kerma_mu_sh"
			},
		}
	},

	-------------------------------------------------------------
	-- Foreign conquest-related VCs from Egyptian point of view
	-------------------------------------------------------------

	{
		uid 				= "egyptian_conquest_foreign_upper_egypt_saww",
		vp_reward 			= 1,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_foreign_upper_egypt_saww_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_foreign_upper_egypt_saww_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_saww_sheps_uab",
					"phar_main_saww_saww",
					"phar_main_saww_mefka_beh"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_saww_sheps_uab"
			},
			{
				type = "control_region",
				region_key = "phar_main_saww_saww"
			},
			{
				type = "control_region",
				region_key = "phar_main_saww_mefka_beh"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_foreign_nubia_east_nubia",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_foreign_nubia_east_nubia_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_foreign_nubia_east_nubia_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_east_nubia_tep_heb",
					"phar_main_east_nubia_khefti_gehes",
					"phar_main_east_nubia_ti_neb"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_east_nubia_tep_heb"
			},
			{
				type = "control_region",
				region_key = "phar_main_east_nubia_khefti_gehes"
			},
			{
				type = "control_region",
				region_key = "phar_main_east_nubia_ti_neb"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_foreign_nubia_north_east_nubia",
		vp_reward 			= 1,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_foreign_nubia_north_east_nubia_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_foreign_nubia_north_east_nubia_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_north_east_nubia_utcha_uas",
					"phar_main_north_east_nubia_hetch_pa"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_north_east_nubia_utcha_uas"
			},
			{
				type = "control_region",
				region_key = "phar_main_north_east_nubia_hetch_pa"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_foreign_kush_kawa",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_foreign_kush_kawa_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_foreign_kush_kawa_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kawa_abu_ab",
					"phar_main_kawa_khus_qes",
					"phar_main_kawa_kawa"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_kawa_abu_ab"
			},
			{
				type = "control_region",
				region_key = "phar_main_kawa_khus_qes"
			},
			{
				type = "control_region",
				region_key = "phar_main_kawa_kawa"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_foreign_kush_napata",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_foreign_kush_napata_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_foreign_kush_napata_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_napata_napata",
					"phar_main_napata_res_tua",
					"phar_main_napata_res_khet",
					"phar_main_napata_hem_shema"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_napata_napata"
			},
			{
				type = "control_region",
				region_key = "phar_main_napata_res_tua"
			},
			{
				type = "control_region",
				region_key = "phar_main_napata_res_khet"
			},
			{
				type = "control_region",
				region_key = "phar_main_napata_hem_shema"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_foreign_north_sinai",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_lower_egypt_north_sinai_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_sel_lower_egypt_north_sinai_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_north_sinai_nekhel",
					"phar_main_north_sinai_neb_gehes",
					"phar_main_north_sinai_azzati",
					"phar_main_north_sinai_sukkot"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_north_sinai_nekhel"
			},
			{
				type = "control_region",
				region_key = "phar_main_north_sinai_neb_gehes"
			},
			{
				type = "control_region",
				region_key = "phar_main_north_sinai_azzati"
			},
			{
				type = "control_region",
				region_key = "phar_main_north_sinai_sukkot"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_foreign_realm_western_desert",
		vp_reward 			= 3,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_foreign_realm_western_desert_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_foreign_realm_western_desert_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_amunia_amunia",
					"phar_main_amunia_met_usr",
					"phar_main_amunia_ner_neb",
					"phar_main_dungul_oasis_dungul_asis",
					"phar_main_dungul_oasis_tem_pa",
					"phar_main_dungul_oasis_thes",
					"phar_main_dungul_oasis_utch",
					"phar_main_dakhla_oasis_dakhla_oasis",
					"phar_main_dakhla_oasis_khesef",
					"phar_main_dakhla_oasis_tcham",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_amunia_amunia"
			},
			{
				type = "control_region",
				region_key = "phar_main_amunia_met_usr"
			},
			{
				type = "control_region",
				region_key = "phar_main_amunia_ner_neb"
			},
			{
				type = "control_region",
				region_key = "phar_main_dungul_oasis_dungul_asis"
			},
			{
				type = "control_region",
				region_key = "phar_main_dungul_oasis_tem_pa"
			},
			{
				type = "control_region",
				region_key = "phar_main_dungul_oasis_thes"
			},
			{
				type = "control_region",
				region_key = "phar_main_dungul_oasis_utch"
			},
			{
				type = "control_region",
				region_key = "phar_main_dakhla_oasis_dakhla_oasis"
			},
			{
				type = "control_region",
				region_key = "phar_main_dakhla_oasis_khesef"
			},
			{
				type = "control_region",
				region_key = "phar_main_dakhla_oasis_tcham"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_foreign_realm_sinai",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_foreign_realm_sinai_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_foreign_realm_sinai_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_sinai_hetch",
					"phar_main_sinai_tchu_am",
					"phar_main_east_sinai_beersheba",
					"phar_main_sinai_tchu_sh",
					"phar_main_east_sinai_khet_khefti"
				}
			},
		},
		completion_conditions = {

			{
				type = "control_region",
				region_key = "phar_main_sinai_hetch"
			},
			{
				type = "control_region",
				region_key = "phar_main_sinai_tchu_am"
			},
			{
				type = "control_region",
				region_key = "phar_main_east_sinai_beersheba"
			},
			{
				type = "control_region",
				region_key = "phar_main_sinai_tchu_sh"
			},
			{
				type = "control_region",
				region_key = "phar_main_east_sinai_khet_khefti"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_foreign_realm_fenkhu",
		vp_reward 			= 4,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_foreign_realm_fenkhu_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_foreign_realm_fenkhu_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_ashkelon_ashkelon",
					"phar_main_ashkelon_pel",
					"phar_main_ashkelon_urushalim",
					"phar_main_tyre_hazor",
					"phar_main_kadesh_sumur",
					"phar_main_megiddo_yapo",
					"phar_main_kadesh_kadesh",
					"phar_main_megiddo_megiddo",
					"phar_main_tyre_byblos",
					"phar_main_tyre_tyre",
					"phar_main_tyre_sidon"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_ashkelon_ashkelon"
			},
			{
				type = "control_region",
				region_key = "phar_main_ashkelon_pel"
			},
			{
				type = "control_region",
				region_key = "phar_main_ashkelon_urushalim"
			},
			{
				type = "control_region",
				region_key = "phar_main_tyre_hazor"
			},
			{
				type = "control_region",
				region_key = "phar_main_kadesh_sumur"
			},
			{
				type = "control_region",
				region_key = "phar_main_megiddo_yapo"
			},
			{
				type = "control_region",
				region_key = "phar_main_kadesh_kadesh"
			},
			{
				type = "control_region",
				region_key = "phar_main_megiddo_megiddo"
			},
			{
				type = "control_region",
				region_key = "phar_main_tyre_byblos"
			},
			{
				type = "control_region",
				region_key = "phar_main_tyre_tyre"
			},
			{
				type = "control_region",
				region_key = "phar_main_tyre_sidon"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_foreign_realm_retjenu",
		vp_reward 			= 3,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_foreign_realm_retjenu_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_foreign_realm_retjenu_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_damascus_damascus",
					"phar_main_damascus_sedad",
					"phar_main_emar_qatna",
					"phar_main_emar_emar",
					"phar_main_emar_teshub",
					"phar_main_shechem_ammon",
					"phar_main_shechem_sakka",
					"phar_main_shechem_shechem",
					"phar_main_damascus_jawa",
					"phar_main_damascus_tadmor"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_damascus_damascus"
			},
			{
				type = "control_region",
				region_key = "phar_main_damascus_sedad"
			},
			{
				type = "control_region",
				region_key = "phar_main_emar_qatna"
			},
			{
				type = "control_region",
				region_key = "phar_main_emar_emar"
			},
			{
				type = "control_region",
				region_key = "phar_main_emar_teshub"
			},
			{
				type = "control_region",
				region_key = "phar_main_shechem_ammon"
			},
			{
				type = "control_region",
				region_key = "phar_main_shechem_sakka"
			},
			{
				type = "control_region",
				region_key = "phar_main_shechem_shechem"
			},
			{
				type = "control_region",
				region_key = "phar_main_damascus_jawa"
			},
			{
				type = "control_region",
				region_key = "phar_main_damascus_tadmor"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_foreign_realm_yamhad",
		vp_reward 			= 4,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_foreign_realm_yamhad_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_foreign_realm_yamhad_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_carchemish_carchemish",
					"phar_main_alashiya_paphos",
					"phar_main_carchemish_harranu",
					"phar_main_alashiya_kition",
					"phar_main_ugarit_ugarit",
					"phar_main_ugarit_ebla",
					"phar_main_aleppo_alalah",
					"phar_main_alashiya_alashiya",
					"phar_main_aleppo_aleppo",
					"phar_main_carchemish_tuba",
					"phar_main_carchemish_khantap"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_carchemish_carchemish"
			},
			{
				type = "control_region",
				region_key = "phar_main_alashiya_paphos"
			},
			{
				type = "control_region",
				region_key = "phar_main_carchemish_harranu"
			},
			{
				type = "control_region",
				region_key = "phar_main_alashiya_kition"
			},
			{
				type = "control_region",
				region_key = "phar_main_ugarit_ugarit"
			},
			{
				type = "control_region",
				region_key = "phar_main_ugarit_ebla"
			},
			{
				type = "control_region",
				region_key = "phar_main_aleppo_alalah"
			},
			{
				type = "control_region",
				region_key = "phar_main_alashiya_alashiya"
			},
			{
				type = "control_region",
				region_key = "phar_main_aleppo_aleppo"
			},
			{
				type = "control_region",
				region_key = "phar_main_carchemish_tuba"
			},
			{
				type = "control_region",
				region_key = "phar_main_carchemish_khantap"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_foreign_realm_isuwa",
		vp_reward 			= 4,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_foreign_realm_isuwa_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_foreign_realm_isuwa_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kanesh_kanesh",
					"phar_main_zippalanda_nerik",
					"phar_main_kanesh_kummanni",
					"phar_main_zippalanda_amaseia",
					"phar_main_malidiya_tegarama",
					"phar_main_kanesh_saricha",
					"phar_main_malidiya_malidiya",
					"phar_main_malidiya_samuha",
					"phar_main_zippalanda_zippalanda",
					"phar_main_zippalanda_sapinuwa",
					"phar_main_malidiya_zara"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_kanesh_kanesh"
			},
			{
				type = "control_region",
				region_key = "phar_main_zippalanda_nerik"
			},
			{
				type = "control_region",
				region_key = "phar_main_kanesh_kummanni"
			},
			{
				type = "control_region",
				region_key = "phar_main_zippalanda_amaseia"
			},
			{
				type = "control_region",
				region_key = "phar_main_malidiya_tegarama"
			},
			{
				type = "control_region",
				region_key = "phar_main_kanesh_saricha"
			},
			{
				type = "control_region",
				region_key = "phar_main_malidiya_malidiya"
			},
			{
				type = "control_region",
				region_key = "phar_main_malidiya_samuha"
			},
			{
				type = "control_region",
				region_key = "phar_main_zippalanda_zippalanda"
			},
			{
				type = "control_region",
				region_key = "phar_main_zippalanda_sapinuwa"
			},
			{
				type = "control_region",
				region_key = "phar_main_malidiya_zara"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_foreign_realm_lowlands",
		vp_reward 			= 5,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_foreign_realm_lowlands_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_foreign_realm_lowlands_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_tuwana_cybistra",
					"phar_main_parha_isaura",
					"phar_main_parha_sagalassos",
					"phar_main_parha_parha",
					"phar_main_tuwana_kelenderis",
					"phar_main_south_hatti_cibyra",
					"phar_main_tuwana_tuwana",
					"phar_main_south_hatti_lystra",
					"phar_main_tarsus_kyinda",
					"phar_main_tuwana_hubishna",
					"phar_main_tarsus_adana",
					"phar_main_tarsus_tarsus",
					"phar_main_central_hatti_pegella",
					"phar_main_central_hatti_larawanda",
					"phar_main_central_hatti_koropissos",
					"phar_main_south_hatti_tarhuntassa"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_tuwana_cybistra"
			},
			{
				type = "control_region",
				region_key = "phar_main_parha_isaura"
			},
			{
				type = "control_region",
				region_key = "phar_main_parha_sagalassos"
			},
			{
				type = "control_region",
				region_key = "phar_main_parha_parha"
			},
			{
				type = "control_region",
				region_key = "phar_main_tuwana_kelenderis"
			},
			{
				type = "control_region",
				region_key = "phar_main_south_hatti_cibyra"
			},
			{
				type = "control_region",
				region_key = "phar_main_tuwana_tuwana"
			},
			{
				type = "control_region",
				region_key = "phar_main_south_hatti_lystra"
			},
			{
				type = "control_region",
				region_key = "phar_main_tarsus_kyinda"
			},
			{
				type = "control_region",
				region_key = "phar_main_tuwana_hubishna"
			},
			{
				type = "control_region",
				region_key = "phar_main_tarsus_adana"
			},
			{
				type = "control_region",
				region_key = "phar_main_tarsus_tarsus"
			},
			{
				type = "control_region",
				region_key = "phar_main_central_hatti_pegella"
			},
			{
				type = "control_region",
				region_key = "phar_main_central_hatti_larawanda"
			},
			{
				type = "control_region",
				region_key = "phar_main_central_hatti_koropissos"
			},
			{
				type = "control_region",
				region_key = "phar_main_south_hatti_tarhuntassa"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_foreign_realm_highlands",
		vp_reward 			= 5,
		restricted_to_subcultures = { "phar_main_sbc_kemet_egyptians" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_foreign_realm_highlands_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_egyptian_conquest_foreign_realm_highlands_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_north_hatti_dadastana",
					"phar_main_ancyra_lagania",
					"phar_main_purushanda_nyssa",
					"phar_main_hattussa_ankuwa",
					"phar_main_purushanda_purushanda",
					"phar_main_ancyra_ancyra",
					"phar_main_west_hatti_dorylaion",
					"phar_main_hattussa_corniaspa",
					"phar_main_purushanda_mokissos",
					"phar_main_west_hatti_gordion",
					"phar_main_west_hatti_pessinus",
					"phar_main_west_hatti_abrostola",
					"phar_main_north_hatti_krateia",
					"phar_main_north_hatti_dusae",
					"phar_main_north_hatti_andrapa",
					"phar_main_hattussa_hattussa",
					"phar_main_hattussa_arinna",
					"phar_main_ancyra_aspona"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_north_hatti_dadastana"
			},
			{
				type = "control_region",
				region_key = "phar_main_ancyra_lagania"
			},
			{
				type = "control_region",
				region_key = "phar_main_purushanda_nyssa"
			},
			{
				type = "control_region",
				region_key = "phar_main_hattussa_ankuwa"
			},
			{
				type = "control_region",
				region_key = "phar_main_purushanda_purushanda"
			},
			{
				type = "control_region",
				region_key = "phar_main_ancyra_ancyra"
			},
			{
				type = "control_region",
				region_key = "phar_main_west_hatti_dorylaion"
			},
			{
				type = "control_region",
				region_key = "phar_main_hattussa_corniaspa"
			},
			{
				type = "control_region",
				region_key = "phar_main_purushanda_mokissos"
			},
			{
				type = "control_region",
				region_key = "phar_main_west_hatti_gordion"
			},
			{
				type = "control_region",
				region_key = "phar_main_west_hatti_pessinus"
			},
			{
				type = "control_region",
				region_key = "phar_main_west_hatti_abrostola"
			},
			{
				type = "control_region",
				region_key = "phar_main_north_hatti_krateia"
			},
			{
				type = "control_region",
				region_key = "phar_main_north_hatti_dusae"
			},
			{
				type = "control_region",
				region_key = "phar_main_north_hatti_andrapa"
			},
			{
				type = "control_region",
				region_key = "phar_main_hattussa_hattussa"
			},
			{
				type = "control_region",
				region_key = "phar_main_hattussa_arinna"
			},
			{
				type = "control_region",
				region_key = "phar_main_ancyra_aspona"
			},
		}
	},

	-------------------------------------------------------------
	-- Homeland conquest-related VCs from Hittite point of view
	-------------------------------------------------------------

	{
		uid 				= "hittite_conquest_shl_highlands_ancyra",
		vp_reward 			= 3,
		restricted_to_subcultures = { "phar_main_sbc_hatti_hittites" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_shl_highlands_ancyra_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_shl_highlands_ancyra_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_ancyra_lagania",
					"phar_main_ancyra_ancyra",
					"phar_main_ancyra_aspona"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_ancyra_lagania"
			},
			{
				type = "control_region",
				region_key = "phar_main_ancyra_ancyra"
			},
			{
				type = "control_region",
				region_key = "phar_main_ancyra_aspona"
			},
		}
	},
	{
		uid 				= "hittite_conquest_shl_highlands_hattussa",
		vp_reward 			= 4,
		restricted_to_subcultures = { "phar_main_sbc_hatti_hittites" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_shl_highlands_hattussa_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_shl_highlands_hattussa_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_hattussa_ankuwa",
					"phar_main_hattussa_corniaspa",
					"phar_main_hattussa_hattussa",
					"phar_main_hattussa_arinna"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_hattussa_ankuwa"
			},
			{
				type = "control_region",
				region_key = "phar_main_hattussa_corniaspa"
			},
			{
				type = "control_region",
				region_key = "phar_main_hattussa_hattussa"
			},
			{
				type = "control_region",
				region_key = "phar_main_hattussa_arinna"
			},
		}
	},
	{
		uid 				= "hittite_conquest_shl_highlands_purushanda",
		vp_reward 			= 3,
		restricted_to_subcultures = { "phar_main_sbc_hatti_hittites" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_shl_highlands_purushanda_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_shl_highlands_purushanda_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_purushanda_nyssa",
					"phar_main_purushanda_purushanda",
					"phar_main_purushanda_mokissos"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_purushanda_nyssa"
			},
			{
				type = "control_region",
				region_key = "phar_main_purushanda_purushanda"
			},
			{
				type = "control_region",
				region_key = "phar_main_purushanda_mokissos"
			},
		}
	},
	{
		uid 				= "hittite_conquest_shl_isuwa_kanesh",
		vp_reward 			= 3,
		restricted_to_subcultures = { "phar_main_sbc_hatti_hittites" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_shl_isuwa_kanesh_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_shl_isuwa_kanesh_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kanesh_kanesh",
					"phar_main_kanesh_kummanni",
					"phar_main_kanesh_saricha"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_kanesh_kanesh"
			},
			{
				type = "control_region",
				region_key = "phar_main_kanesh_kummanni"
			},
			{
				type = "control_region",
				region_key = "phar_main_kanesh_saricha"
			},
		}
	},
	{
		uid 				= "hittite_conquest_shl_isuwa_malidiya",
		vp_reward 			= 4,
		restricted_to_subcultures = { "phar_main_sbc_hatti_hittites" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_shl_isuwa_malidiya_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_shl_isuwa_malidiya_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_malidiya_tegarama",
					"phar_main_malidiya_malidiya",
					"phar_main_malidiya_samuha",
					"phar_main_malidiya_zara"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_malidiya_tegarama"
			},
			{
				type = "control_region",
				region_key = "phar_main_malidiya_malidiya"
			},
			{
				type = "control_region",
				region_key = "phar_main_malidiya_samuha"
			},
			{
				type = "control_region",
				region_key = "phar_main_malidiya_zara"
			},
		}
	},
	{
		uid 				= "hittite_conquest_shl_isuwa_zippalanda",
		vp_reward 			= 4,
		restricted_to_subcultures = { "phar_main_sbc_hatti_hittites" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_shl_isuwa_zippalanda_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_shl_isuwa_zippalanda_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_zippalanda_nerik",
					"phar_main_zippalanda_amaseia",
					"phar_main_zippalanda_zippalanda",
					"phar_main_zippalanda_sapinuwa"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_zippalanda_nerik"
			},
			{
				type = "control_region",
				region_key = "phar_main_zippalanda_amaseia"
			},
			{
				type = "control_region",
				region_key = "phar_main_zippalanda_zippalanda"
			},
			{
				type = "control_region",
				region_key = "phar_main_zippalanda_sapinuwa"
			},
		}
	},
	{
		uid 				= "hittite_conquest_shl_lowlands_central_hatti",
		vp_reward 			= 3,
		restricted_to_subcultures = { "phar_main_sbc_hatti_hittites" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_shl_lowlands_central_hatti_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_shl_lowlands_central_hatti_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_central_hatti_pegella",
					"phar_main_central_hatti_larawanda",
					"phar_main_central_hatti_koropissos"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_central_hatti_pegella"
			},
			{
				type = "control_region",
				region_key = "phar_main_central_hatti_larawanda"
			},
			{
				type = "control_region",
				region_key = "phar_main_central_hatti_koropissos"
			},
		}
	},
	{
		uid 				= "hittite_conquest_shl_lowlands_south_hatti",
		vp_reward 			= 3,
		restricted_to_subcultures = { "phar_main_sbc_hatti_hittites" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_shl_lowlands_south_hatti_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_shl_lowlands_south_hatti_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_south_hatti_cibyra",
					"phar_main_south_hatti_lystra",
					"phar_main_south_hatti_tarhuntassa"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_south_hatti_cibyra"
			},
			{
				type = "control_region",
				region_key = "phar_main_south_hatti_lystra"
			},
			{
				type = "control_region",
				region_key = "phar_main_south_hatti_tarhuntassa"
			},
		}
	},
	{
		uid 				= "hittite_conquest_shl_lowlands_tarsus",
		vp_reward 			= 3,
		restricted_to_subcultures = { "phar_main_sbc_hatti_hittites" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_shl_lowlands_tarsus_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_shl_lowlands_tarsus_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_tarsus_kyinda",
					"phar_main_tarsus_adana",
					"phar_main_tarsus_tarsus"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_tarsus_kyinda"
			},
			{
				type = "control_region",
				region_key = "phar_main_tarsus_adana"
			},
			{
				type = "control_region",
				region_key = "phar_main_tarsus_tarsus"
			},
		}
	},
	{
		uid 				= "hittite_conquest_shl_lowlands_tuwana",
		vp_reward 			= 4,
		restricted_to_subcultures = { "phar_main_sbc_hatti_hittites" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_shl_lowlands_tuwana_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_shl_lowlands_tuwana_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_tuwana_cybistra",
					"phar_main_tuwana_kelenderis",
					"phar_main_tuwana_tuwana",
					"phar_main_tuwana_hubishna"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_tuwana_cybistra"
			},
			{
				type = "control_region",
				region_key = "phar_main_tuwana_kelenderis"
			},
			{
				type = "control_region",
				region_key = "phar_main_tuwana_tuwana"
			},
			{
				type = "control_region",
				region_key = "phar_main_tuwana_hubishna"
			},
		}
	},

	-------------------------------------------------------------
	-- Foreign conquest-related VCs from Hittite point of view
	-------------------------------------------------------------

	{
		uid 				= "hittite_conquest_foreign_highlands_north_hatti",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_hatti_hittites" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_highlands_north_hatti_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_highlands_north_hatti_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_north_hatti_dadastana",
					"phar_main_north_hatti_krateia",
					"phar_main_north_hatti_dusae",
					"phar_main_north_hatti_andrapa"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_north_hatti_dadastana"
			},
			{
				type = "control_region",
				region_key = "phar_main_north_hatti_krateia"
			},
			{
				type = "control_region",
				region_key = "phar_main_north_hatti_dusae"
			},
			{
				type = "control_region",
				region_key = "phar_main_north_hatti_andrapa"
			},
		}
	},
	{
		uid 				= "hittite_conquest_foreign_highlands_west_hatti",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_hatti_hittites" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_highlands_west_hatti_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_highlands_west_hatti_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_west_hatti_dorylaion",
					"phar_main_west_hatti_gordion",
					"phar_main_west_hatti_pessinus",
					"phar_main_west_hatti_abrostola"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_west_hatti_dorylaion"
			},
			{
				type = "control_region",
				region_key = "phar_main_west_hatti_gordion"
			},
			{
				type = "control_region",
				region_key = "phar_main_west_hatti_pessinus"
			},
			{
				type = "control_region",
				region_key = "phar_main_west_hatti_abrostola"
			},
		}
	},
	{
		uid 				= "hittite_conquest_foreign_lowlands_parha",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_hatti_hittites" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_lowlands_parha_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_lowlands_parha_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_parha_isaura",
					"phar_main_parha_sagalassos",
					"phar_main_parha_parha"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_parha_isaura"
			},
			{
				type = "control_region",
				region_key = "phar_main_parha_sagalassos"
			},
			{
				type = "control_region",
				region_key = "phar_main_parha_parha"
			},
		}
	},
	{
		uid 				= "hittite_conquest_foreign_yamhad_alashiya",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_hatti_hittites" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_yamhad_alashiya_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_yamhad_alashiya_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_alashiya_paphos",
					"phar_main_alashiya_kition",
					"phar_main_alashiya_alashiya"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_alashiya_paphos"
			},
			{
				type = "control_region",
				region_key = "phar_main_alashiya_kition"
			},
			{
				type = "control_region",
				region_key = "phar_main_alashiya_alashiya"
			},
		}
	},
	{
		uid 				= "hittite_conquest_foreign_yamhad_aleppo",
		vp_reward 			= 1,
		restricted_to_subcultures = { "phar_main_sbc_hatti_hittites" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_yamhad_aleppo_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_yamhad_aleppo_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_aleppo_alalah",
					"phar_main_aleppo_aleppo"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_aleppo_alalah"
			},
			{
				type = "control_region",
				region_key = "phar_main_aleppo_aleppo"
			},
		}
	},
	{
		uid 				= "hittite_conquest_foreign_yamhad_ugarit",
		vp_reward 			= 1,
		restricted_to_subcultures = { "phar_main_sbc_hatti_hittites" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_yamhad_ugarit_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_yamhad_ugarit_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_ugarit_ugarit",
					"phar_main_ugarit_ebla"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_ugarit_ugarit"
			},
			{
				type = "control_region",
				region_key = "phar_main_ugarit_ebla"
			},
		}
	},
	{
		uid 				= "hittite_conquest_foreign_yamhad_carchemish",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_hatti_hittites" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_yamhad_carchemish_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_yamhad_carchemish_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_carchemish_carchemish",
					"phar_main_carchemish_harranu",
					"phar_main_carchemish_tuba",
					"phar_main_carchemish_khantap"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_carchemish_carchemish"
			},
			{
				type = "control_region",
				region_key = "phar_main_carchemish_harranu"
			},
			{
				type = "control_region",
				region_key = "phar_main_carchemish_tuba"
			},
			{
				type = "control_region",
				region_key = "phar_main_carchemish_khantap"
			},
		}
	},
	{
		uid 				= "hittite_conquest_foreign_western_desert_amunia",
		vp_reward 			= 1,
		restricted_to_subcultures = { "phar_main_sbc_hatti_hittites" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_western_desert_amunia_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_western_desert_amunia_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_amunia_amunia",
					"phar_main_amunia_met_usr",
					"phar_main_amunia_ner_neb"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_amunia_amunia"
			},
			{
				type = "control_region",
				region_key = "phar_main_amunia_met_usr"
			},
			{
				type = "control_region",
				region_key = "phar_main_amunia_ner_neb"
			},
		}
	},
	{
		uid 				= "hittite_conquest_foreign_fenkhu_kadesh",
		vp_reward 			= 1,
		restricted_to_subcultures = { "phar_main_sbc_hatti_hittites" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_fenkhu_kadesh_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_fenkhu_kadesh_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kadesh_sumur",
					"phar_main_kadesh_kadesh"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_kadesh_sumur"
			},
			{
				type = "control_region",
				region_key = "phar_main_kadesh_kadesh"
			},
		}
	},
	{
		uid 				= "hittite_conquest_foreign_fenkhu_megiddo",
		vp_reward 			= 1,
		restricted_to_subcultures = { "phar_main_sbc_hatti_hittites" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_fenkhu_megiddo_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_fenkhu_megiddo_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_megiddo_yapo",
					"phar_main_megiddo_megiddo"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_megiddo_yapo"
			},
			{
				type = "control_region",
				region_key = "phar_main_megiddo_megiddo"
			},
		}
	},
	{
		uid 				= "hittite_conquest_foreign_fenkhu_tyre",
		vp_reward 			= 3,
		restricted_to_subcultures = { "phar_main_sbc_hatti_hittites" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_fenkhu_tyre_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_fenkhu_tyre_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_tyre_hazor",
					"phar_main_tyre_byblos",
					"phar_main_tyre_tyre",
					"phar_main_tyre_sidon"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_tyre_hazor"
			},
			{
				type = "control_region",
				region_key = "phar_main_tyre_byblos"
			},
			{
				type = "control_region",
				region_key = "phar_main_tyre_tyre"
			},
			{
				type = "control_region",
				region_key = "phar_main_tyre_sidon"
			},
		}
	},
	{
		uid 				= "hittite_conquest_foreign_fenkhu_ashkelon",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_hatti_hittites" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_fenkhu_ashkelon_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_fenkhu_ashkelon_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_ashkelon_ashkelon",
					"phar_main_ashkelon_pel",
					"phar_main_ashkelon_urushalim"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_ashkelon_ashkelon"
			},
			{
				type = "control_region",
				region_key = "phar_main_ashkelon_pel"
			},
			{
				type = "control_region",
				region_key = "phar_main_ashkelon_urushalim"
			},
		}
	},
	{
		uid 				= "hittite_conquest_foreign_retjenu_damascus",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_hatti_hittites" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_retjenu_damascus_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_retjenu_damascus_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_damascus_damascus",
					"phar_main_damascus_sedad",
					"phar_main_damascus_jawa",
					"phar_main_damascus_tadmor"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_damascus_damascus"
			},
			{
				type = "control_region",
				region_key = "phar_main_damascus_sedad"
			},
			{
				type = "control_region",
				region_key = "phar_main_damascus_jawa"
			},
			{
				type = "control_region",
				region_key = "phar_main_damascus_tadmor"
			},
		}
	},
	{
		uid 				= "hittite_conquest_foreign_retjenu_emar",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_hatti_hittites" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_retjenu_emar_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_retjenu_emar_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_emar_qatna",
					"phar_main_emar_emar",
					"phar_main_emar_teshub"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_emar_qatna"
			},
			{
				type = "control_region",
				region_key = "phar_main_emar_emar"
			},
			{
				type = "control_region",
				region_key = "phar_main_emar_teshub"
			},
		}
	},
	{
		uid 				= "hittite_conquest_foreign_retjenu_shechem",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_hatti_hittites" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_retjenu_shechem_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_retjenu_shechem_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_shechem_ammon",
					"phar_main_shechem_sakka",
					"phar_main_shechem_shechem"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_shechem_ammon"
			},
			{
				type = "control_region",
				region_key = "phar_main_shechem_sakka"
			},
			{
				type = "control_region",
				region_key = "phar_main_shechem_shechem"
			},
		}
	},
	{
		uid 				= "hittite_conquest_foreign_realm_sinai",
		vp_reward 			= 3,
		restricted_to_subcultures = { "phar_main_sbc_hatti_hittites" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_realm_sinai_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_realm_sinai_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_north_sinai_nekhel",
					"phar_main_north_sinai_neb_gehes",
					"phar_main_sinai_hetch",
					"phar_main_north_sinai_azzati",
					"phar_main_sinai_tchu_am",
					"phar_main_east_sinai_beersheba",
					"phar_main_sinai_tchu_sh",
					"phar_main_north_sinai_sukkot",
					"phar_main_east_sinai_khet_khefti"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_north_sinai_nekhel"
			},
			{
				type = "control_region",
				region_key = "phar_main_north_sinai_neb_gehes"
			},
			{
				type = "control_region",
				region_key = "phar_main_sinai_hetch"
			},
			{
				type = "control_region",
				region_key = "phar_main_north_sinai_azzati"
			},
			{
				type = "control_region",
				region_key = "phar_main_sinai_tchu_am"
			},
			{
				type = "control_region",
				region_key = "phar_main_east_sinai_beersheba"
			},
			{
				type = "control_region",
				region_key = "phar_main_sinai_tchu_sh"
			},
			{
				type = "control_region",
				region_key = "phar_main_north_sinai_sukkot"
			},
			{
				type = "control_region",
				region_key = "phar_main_east_sinai_khet_khefti"
			},
		}
	},
	{
		uid 				= "hittite_conquest_foreign_realm_lower_egypt",
		vp_reward 			= 6,
		restricted_to_subcultures = { "phar_main_sbc_hatti_hittites" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_realm_lower_egypt_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_realm_lower_egypt_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_faiyum_faiyum",
					"phar_main_faiyum_dahshur",
					"phar_main_memphis_helwan",
					"phar_main_rhacotis_khan_aha",
					"phar_main_hermopolis_ti_ar",
					"phar_main_pi_ramesses_tjaru",
					"phar_main_pi_ramesses_per_amun",
					"phar_main_memphis_petpeh",
					"phar_main_pi_ramesses_pi_ramesses",
					"phar_main_memphis_memphis",
					"phar_main_hardai_tep_aha",
					"phar_main_rhacotis_qema",
					"phar_main_buto_buto",
					"phar_main_hardai_ur_gem",
					"phar_main_buto_sais",
					"phar_main_herakleopolis_sheps_khu",
					"phar_main_herakleopolis_herakleopolis",
					"phar_main_hermopolis_hermopolis",
					"phar_main_heliopolis_heliopolis",
					"phar_main_buto_paiuenamun",
					"phar_main_hardai_hardai",
					"phar_main_heliopolis_qes",
					"phar_main_rhacotis_rhacotis",
					"phar_main_faiyum_khem"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_faiyum_faiyum"
			},
			{
				type = "control_region",
				region_key = "phar_main_faiyum_dahshur"
			},
			{
				type = "control_region",
				region_key = "phar_main_memphis_helwan"
			},
			{
				type = "control_region",
				region_key = "phar_main_rhacotis_khan_aha"
			},
			{
				type = "control_region",
				region_key = "phar_main_hermopolis_ti_ar"
			},
			{
				type = "control_region",
				region_key = "phar_main_pi_ramesses_tjaru"
			},
			{
				type = "control_region",
				region_key = "phar_main_pi_ramesses_per_amun"
			},
			{
				type = "control_region",
				region_key = "phar_main_memphis_petpeh"
			},
			{
				type = "control_region",
				region_key = "phar_main_pi_ramesses_pi_ramesses"
			},
			{
				type = "control_region",
				region_key = "phar_main_memphis_memphis"
			},
			{
				type = "control_region",
				region_key = "phar_main_hardai_tep_aha"
			},
			{
				type = "control_region",
				region_key = "phar_main_rhacotis_qema"
			},
			{
				type = "control_region",
				region_key = "phar_main_buto_buto"
			},
			{
				type = "control_region",
				region_key = "phar_main_hardai_ur_gem"
			},
			{
				type = "control_region",
				region_key = "phar_main_buto_sais"
			},
			{
				type = "control_region",
				region_key = "phar_main_herakleopolis_sheps_khu"
			},
			{
				type = "control_region",
				region_key = "phar_main_herakleopolis_herakleopolis"
			},
			{
				type = "control_region",
				region_key = "phar_main_hermopolis_hermopolis"
			},
			{
				type = "control_region",
				region_key = "phar_main_heliopolis_heliopolis"
			},
			{
				type = "control_region",
				region_key = "phar_main_buto_paiuenamun"
			},
			{
				type = "control_region",
				region_key = "phar_main_hardai_hardai"
			},
			{
				type = "control_region",
				region_key = "phar_main_heliopolis_qes"
			},
			{
				type = "control_region",
				region_key = "phar_main_rhacotis_rhacotis"
			},
			{
				type = "control_region",
				region_key = "phar_main_faiyum_khem"
			},
		}
	},
	{
		uid 				= "hittite_conquest_foreign_realm_upper_egypt",
		vp_reward 			= 6,
		restricted_to_subcultures = { "phar_main_sbc_hatti_hittites" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_realm_upper_egypt_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_realm_upper_egypt_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_elephantine_elephantine",
					"phar_main_saww_sheps_uab",
					"phar_main_elephantine_tep_hetem",
					"phar_main_kom_ombo_tchu_ua",
					"phar_main_saww_saww",
					"phar_main_asyut_kep_un",
					"phar_main_akhmim_akhmim",
					"phar_main_kom_ombo_kom_ombo",
					"phar_main_thebes_kha_ti",
					"phar_main_saww_mefka_beh",
					"phar_main_abydos_abydos",
					"phar_main_elephantine_hierakonpolis",
					"phar_main_asyut_asyut",
					"phar_main_akhmim_ur_men",
					"phar_main_elephantine_mes",
					"phar_main_abydos_tin",
					"phar_main_abydos_aakh_ner",
					"phar_main_asyut_tem_khus",
					"phar_main_akhmim_mefka_qes",
					"phar_main_thebes_sma_ua",
					"phar_main_thebes_thebes",
					"phar_main_kom_ombo_kha_sba"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_elephantine_elephantine"
			},
			{
				type = "control_region",
				region_key = "phar_main_saww_sheps_uab"
			},
			{
				type = "control_region",
				region_key = "phar_main_elephantine_tep_hetem"
			},
			{
				type = "control_region",
				region_key = "phar_main_kom_ombo_tchu_ua"
			},
			{
				type = "control_region",
				region_key = "phar_main_saww_saww"
			},
			{
				type = "control_region",
				region_key = "phar_main_asyut_kep_un"
			},
			{
				type = "control_region",
				region_key = "phar_main_akhmim_akhmim"
			},
			{
				type = "control_region",
				region_key = "phar_main_kom_ombo_kom_ombo"
			},
			{
				type = "control_region",
				region_key = "phar_main_thebes_kha_ti"
			},
			{
				type = "control_region",
				region_key = "phar_main_saww_mefka_beh"
			},
			{
				type = "control_region",
				region_key = "phar_main_abydos_abydos"
			},
			{
				type = "control_region",
				region_key = "phar_main_elephantine_hierakonpolis"
			},
			{
				type = "control_region",
				region_key = "phar_main_asyut_asyut"
			},
			{
				type = "control_region",
				region_key = "phar_main_akhmim_ur_men"
			},
			{
				type = "control_region",
				region_key = "phar_main_elephantine_mes"
			},
			{
				type = "control_region",
				region_key = "phar_main_abydos_tin"
			},
			{
				type = "control_region",
				region_key = "phar_main_abydos_aakh_ner"
			},
			{
				type = "control_region",
				region_key = "phar_main_asyut_tem_khus"
			},
			{
				type = "control_region",
				region_key = "phar_main_akhmim_mefka_qes"
			},
			{
				type = "control_region",
				region_key = "phar_main_thebes_sma_ua"
			},
			{
				type = "control_region",
				region_key = "phar_main_thebes_thebes"
			},
			{
				type = "control_region",
				region_key = "phar_main_kom_ombo_kha_sba"
			},
		}
	},
	{
		uid 				= "hittite_conquest_foreign_realm_nubia",
		vp_reward 			= 4,
		restricted_to_subcultures = { "phar_main_sbc_hatti_hittites" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_realm_nubia_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_realm_nubia_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_buhen_shesp_ma",
					"phar_main_east_nubia_tep_heb",
					"phar_main_buhen_her_hetem",
					"phar_main_east_nubia_khefti_gehes",
					"phar_main_north_nubia_res_pa",
					"phar_main_north_nubia_mu_ua",
					"phar_main_east_nubia_ti_neb",
					"phar_main_north_east_nubia_utcha_uas",
					"phar_main_north_east_nubia_hetch_pa",
					"phar_main_north_nubia_miam",
					"phar_main_buhen_hap_au",
					"phar_main_buhen_buhen"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_buhen_shesp_ma"
			},
			{
				type = "control_region",
				region_key = "phar_main_east_nubia_tep_heb"
			},
			{
				type = "control_region",
				region_key = "phar_main_buhen_her_hetem"
			},
			{
				type = "control_region",
				region_key = "phar_main_east_nubia_khefti_gehes"
			},
			{
				type = "control_region",
				region_key = "phar_main_north_nubia_res_pa"
			},
			{
				type = "control_region",
				region_key = "phar_main_north_nubia_mu_ua"
			},
			{
				type = "control_region",
				region_key = "phar_main_east_nubia_ti_neb"
			},
			{
				type = "control_region",
				region_key = "phar_main_north_east_nubia_utcha_uas"
			},
			{
				type = "control_region",
				region_key = "phar_main_north_east_nubia_hetch_pa"
			},
			{
				type = "control_region",
				region_key = "phar_main_north_nubia_miam"
			},
			{
				type = "control_region",
				region_key = "phar_main_buhen_hap_au"
			},
			{
				type = "control_region",
				region_key = "phar_main_buhen_buhen"
			},
		}
	},
	{
		uid 				= "hittite_conquest_foreign_realm_kush",
		vp_reward 			= 4,
		restricted_to_subcultures = { "phar_main_sbc_hatti_hittites" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_realm_kush_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_realm_kush_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kerma_kerma",
					"phar_main_kawa_abu_ab",
					"phar_main_per_ramesses_meri_amon_per_ramesses_meri_amon",
					"phar_main_napata_napata",
					"phar_main_kerma_nu_abu",
					"phar_main_kerma_uab_khu",
					"phar_main_napata_res_tua",
					"phar_main_napata_res_khet",
					"phar_main_napata_hem_shema",
					"phar_main_kerma_mu_sh",
					"phar_main_kawa_khus_qes",
					"phar_main_kawa_kawa",
					"phar_main_per_ramesses_meri_amon_hap_sh",
					"phar_main_per_ramesses_meri_amon_khet_pa"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_kerma_kerma"
			},
			{
				type = "control_region",
				region_key = "phar_main_kawa_abu_ab"
			},
			{
				type = "control_region",
				region_key = "phar_main_per_ramesses_meri_amon_per_ramesses_meri_amon"
			},
			{
				type = "control_region",
				region_key = "phar_main_napata_napata"
			},
			{
				type = "control_region",
				region_key = "phar_main_kerma_nu_abu"
			},
			{
				type = "control_region",
				region_key = "phar_main_kerma_uab_khu"
			},
			{
				type = "control_region",
				region_key = "phar_main_napata_res_tua"
			},
			{
				type = "control_region",
				region_key = "phar_main_napata_res_khet"
			},
			{
				type = "control_region",
				region_key = "phar_main_napata_hem_shema"
			},
			{
				type = "control_region",
				region_key = "phar_main_kerma_mu_sh"
			},
			{
				type = "control_region",
				region_key = "phar_main_kawa_khus_qes"
			},
			{
				type = "control_region",
				region_key = "phar_main_kawa_kawa"
			},
			{
				type = "control_region",
				region_key = "phar_main_per_ramesses_meri_amon_hap_sh"
			},
			{
				type = "control_region",
				region_key = "phar_main_per_ramesses_meri_amon_khet_pa"
			},
		}
	},

	-------------------------------------------------------------
	-- Homeland conquest-related VCs from Canaanite point of view
	-------------------------------------------------------------

	{
		uid 				= "canaan_conquest_core_fenkhu_kadesh",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_core_fenkhu_kadesh_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_core_fenkhu_kadesh_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kadesh_sumur",
					"phar_main_kadesh_kadesh"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_kadesh_sumur"
			},
			{
				type = "control_region",
				region_key = "phar_main_kadesh_kadesh"
			},
		}
	},
	{
		uid 				= "canaan_conquest_core_fenkhu_megiddo",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_core_fenkhu_megiddo_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_core_fenkhu_megiddo_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_megiddo_yapo",
					"phar_main_megiddo_megiddo"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_megiddo_yapo"
			},
			{
				type = "control_region",
				region_key = "phar_main_megiddo_megiddo"
			},
		}
	},
	{
		uid 				= "canaan_conquest_core_fenkhu_tyre",
		vp_reward 			= 4,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_core_fenkhu_tyre_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_core_fenkhu_tyre_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_tyre_hazor",
					"phar_main_tyre_byblos",
					"phar_main_tyre_tyre",
					"phar_main_tyre_sidon"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_tyre_hazor"
			},
			{
				type = "control_region",
				region_key = "phar_main_tyre_byblos"
			},
			{
				type = "control_region",
				region_key = "phar_main_tyre_tyre"
			},
			{
				type = "control_region",
				region_key = "phar_main_tyre_sidon"
			},
		}
	},
	{
		uid 				= "canaan_conquest_core_yamhad_alashiya",
		vp_reward 			= 3,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_core_yamhad_alashiya_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_core_yamhad_alashiya_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_alashiya_paphos",
					"phar_main_alashiya_kition",
					"phar_main_alashiya_alashiya"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_alashiya_paphos"
			},
			{
				type = "control_region",
				region_key = "phar_main_alashiya_kition"
			},
			{
				type = "control_region",
				region_key = "phar_main_alashiya_alashiya"
			},
		}
	},
	{
		uid 				= "canaan_conquest_core_yamhad_aleppo",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_core_yamhad_aleppo_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_core_yamhad_aleppo_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_aleppo_alalah",
					"phar_main_aleppo_aleppo"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_aleppo_alalah"
			},
			{
				type = "control_region",
				region_key = "phar_main_aleppo_aleppo"
			},
		}
	},
	{
		uid 				= "canaan_conquest_core_yamhad_ugarit",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_core_yamhad_ugarit_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_core_yamhad_ugarit_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_ugarit_ugarit",
					"phar_main_ugarit_ebla"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_ugarit_ugarit"
			},
			{
				type = "control_region",
				region_key = "phar_main_ugarit_ebla"
			},
		}
	},
	{
		uid 				= "canaan_conquest_core_yamhad_carchemish",
		vp_reward 			= 4,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_core_yamhad_carchemish_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_core_yamhad_carchemish_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_carchemish_carchemish",
					"phar_main_carchemish_harranu",
					"phar_main_carchemish_tuba",
					"phar_main_carchemish_khantap"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_carchemish_carchemish"
			},
			{
				type = "control_region",
				region_key = "phar_main_carchemish_harranu"
			},
			{
				type = "control_region",
				region_key = "phar_main_carchemish_tuba"
			},
			{
				type = "control_region",
				region_key = "phar_main_carchemish_khantap"
			},
		}
	},
	{
		uid 				= "canaan_conquest_core_retjenu_damascus",
		vp_reward 			= 4,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_core_retjenu_damascus_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_core_retjenu_damascus_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_damascus_damascus",
					"phar_main_damascus_sedad",
					"phar_main_damascus_jawa",
					"phar_main_damascus_tadmor"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_damascus_damascus"
			},
			{
				type = "control_region",
				region_key = "phar_main_damascus_sedad"
			},
			{
				type = "control_region",
				region_key = "phar_main_damascus_jawa"
			},
			{
				type = "control_region",
				region_key = "phar_main_damascus_tadmor"
			},
		}
	},
	{
		uid 				= "canaan_conquest_core_retjenu_emar",
		vp_reward 			= 3,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_core_retjenu_emar_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_core_retjenu_emar_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_emar_qatna",
					"phar_main_emar_emar",
					"phar_main_emar_teshub"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_emar_qatna"
			},
			{
				type = "control_region",
				region_key = "phar_main_emar_emar"
			},
			{
				type = "control_region",
				region_key = "phar_main_emar_teshub"
			},
		}
	},
	{
		uid 				= "canaan_conquest_core_retjenu_shechem",
		vp_reward 			= 3,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_core_retjenu_shechem_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_core_retjenu_shechem_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_shechem_ammon",
					"phar_main_shechem_sakka",
					"phar_main_shechem_shechem"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_shechem_ammon"
			},
			{
				type = "control_region",
				region_key = "phar_main_shechem_sakka"
			},
			{
				type = "control_region",
				region_key = "phar_main_shechem_shechem"
			},
		}
	},
	{
		uid 				= "canaan_conquest_core_sinai_ashkelon",
		vp_reward 			= 3,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_core_sinai_ashkelon_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_core_sinai_ashkelon_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_ashkelon_ashkelon",
					"phar_main_ashkelon_pel",
					"phar_main_ashkelon_urushalim"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_ashkelon_ashkelon"
			},
			{
				type = "control_region",
				region_key = "phar_main_ashkelon_pel"
			},
			{
				type = "control_region",
				region_key = "phar_main_ashkelon_urushalim"
			},
		}
	},
	{
		uid 				= "canaan_conquest_core_sinai_east_sinai",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_core_sinai_east_sinai_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_core_sinai_east_sinai_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_east_sinai_beersheba",
					"phar_main_east_sinai_khet_khefti"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_east_sinai_beersheba"
			},
			{
				type = "control_region",
				region_key = "phar_main_east_sinai_khet_khefti"
			},
		}
	},
	{
		uid 				= "canaan_conquest_core_sinai_north_sinai",
		vp_reward 			= 4,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_core_sinai_north_sinai_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_core_sinai_north_sinai_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_north_sinai_nekhel",
					"phar_main_north_sinai_neb_gehes",
					"phar_main_north_sinai_azzati",
					"phar_main_north_sinai_sukkot"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_north_sinai_nekhel"
			},
			{
				type = "control_region",
				region_key = "phar_main_north_sinai_neb_gehes"
			},
			{
				type = "control_region",
				region_key = "phar_main_north_sinai_azzati"
			},
			{
				type = "control_region",
				region_key = "phar_main_north_sinai_sukkot"
			},
		}
	},
	{
		uid 				= "canaan_conquest_core_sinai_sinai",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_core_sinai_sinai_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_core_sinai_sinai_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_sinai_hetch",
					"phar_main_sinai_tchu_am",
					"phar_main_sinai_tchu_sh"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_sinai_hetch"
			},
			{
				type = "control_region",
				region_key = "phar_main_sinai_tchu_am"
			},
			{
				type = "control_region",
				region_key = "phar_main_sinai_tchu_sh"
			},
		}
	},

	-------------------------------------------------------------
	-- Foreign conquest-related VCs from Canaanite point of view
	-------------------------------------------------------------

	{
		uid 				= "canaan_conquest_foreign_highlands_ancyra",
		vp_reward 			= 1,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_highlands_ancyra_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_highlands_ancyra_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_ancyra_lagania",
					"phar_main_ancyra_ancyra",
					"phar_main_ancyra_aspona"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_ancyra_lagania"
			},
			{
				type = "control_region",
				region_key = "phar_main_ancyra_ancyra"
			},
			{
				type = "control_region",
				region_key = "phar_main_ancyra_aspona"
			},
		}
	},
	{
		uid 				= "canaan_conquest_foreign_highlands_hattussa",
		vp_reward 			= 3,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_highlands_hattussa_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_highlands_hattussa_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_hattussa_ankuwa",
					"phar_main_hattussa_corniaspa",
					"phar_main_hattussa_hattussa",
					"phar_main_hattussa_arinna"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_hattussa_ankuwa"
			},
			{
				type = "control_region",
				region_key = "phar_main_hattussa_corniaspa"
			},
			{
				type = "control_region",
				region_key = "phar_main_hattussa_hattussa"
			},
			{
				type = "control_region",
				region_key = "phar_main_hattussa_arinna"
			},
		}
	},
	{
		uid 				= "canaan_conquest_foreign_highlands_purushanda",
		vp_reward 			= 1,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_highlands_purushanda_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_highlands_purushanda_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_purushanda_nyssa",
					"phar_main_purushanda_purushanda",
					"phar_main_purushanda_mokissos"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_purushanda_nyssa"
			},
			{
				type = "control_region",
				region_key = "phar_main_purushanda_purushanda"
			},
			{
				type = "control_region",
				region_key = "phar_main_purushanda_mokissos"
			},
		}
	},
	{
		uid 				= "canaan_conquest_foreign_isuwa_kanesh",
		vp_reward 			= 1,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_isuwa_kanesh_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_isuwa_kanesh_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kanesh_kanesh",
					"phar_main_kanesh_kummanni",
					"phar_main_kanesh_saricha"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_kanesh_kanesh"
			},
			{
				type = "control_region",
				region_key = "phar_main_kanesh_kummanni"
			},
			{
				type = "control_region",
				region_key = "phar_main_kanesh_saricha"
			},
		}
	},
	{
		uid 				= "canaan_conquest_foreign_isuwa_malidiya",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_isuwa_malidiya_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_isuwa_malidiya_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_malidiya_tegarama",
					"phar_main_malidiya_malidiya",
					"phar_main_malidiya_samuha",
					"phar_main_malidiya_zara"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_malidiya_tegarama"
			},
			{
				type = "control_region",
				region_key = "phar_main_malidiya_malidiya"
			},
			{
				type = "control_region",
				region_key = "phar_main_malidiya_samuha"
			},
			{
				type = "control_region",
				region_key = "phar_main_malidiya_zara"
			},
		}
	},
	{
		uid 				= "canaan_conquest_foreign_isuwa_zippalanda",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_isuwa_zippalanda_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_isuwa_zippalanda_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_zippalanda_nerik",
					"phar_main_zippalanda_amaseia",
					"phar_main_zippalanda_zippalanda",
					"phar_main_zippalanda_sapinuwa"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_zippalanda_nerik"
			},
			{
				type = "control_region",
				region_key = "phar_main_zippalanda_amaseia"
			},
			{
				type = "control_region",
				region_key = "phar_main_zippalanda_zippalanda"
			},
			{
				type = "control_region",
				region_key = "phar_main_zippalanda_sapinuwa"
			},
		}
	},
	{
		uid 				= "canaan_conquest_foreign_lowlands_central_hatti",
		vp_reward 			= 1,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_lowlands_central_hatti_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_lowlands_central_hatti_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_central_hatti_pegella",
					"phar_main_central_hatti_larawanda",
					"phar_main_central_hatti_koropissos"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_central_hatti_pegella"
			},
			{
				type = "control_region",
				region_key = "phar_main_central_hatti_larawanda"
			},
			{
				type = "control_region",
				region_key = "phar_main_central_hatti_koropissos"
			},
		}
	},
	{
		uid 				= "canaan_conquest_foreign_lowlands_south_hatti",
		vp_reward 			= 1,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_lowlands_south_hatti_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_lowlands_south_hatti_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_south_hatti_cibyra",
					"phar_main_south_hatti_lystra",
					"phar_main_south_hatti_tarhuntassa"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_south_hatti_cibyra"
			},
			{
				type = "control_region",
				region_key = "phar_main_south_hatti_lystra"
			},
			{
				type = "control_region",
				region_key = "phar_main_south_hatti_tarhuntassa"
			},
		}
	},
	{
		uid 				= "canaan_conquest_foreign_lowlands_tarsus",
		vp_reward 			= 1,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_lowlands_tarsus_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_lowlands_tarsus_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_tarsus_kyinda",
					"phar_main_tarsus_adana",
					"phar_main_tarsus_tarsus"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_tarsus_kyinda"
			},
			{
				type = "control_region",
				region_key = "phar_main_tarsus_adana"
			},
			{
				type = "control_region",
				region_key = "phar_main_tarsus_tarsus"
			},
		}
	},
	{
		uid 				= "canaan_conquest_foreign_lowlands_tuwana",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_lowlands_tuwana_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_lowlands_tuwana_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_tuwana_cybistra",
					"phar_main_tuwana_kelenderis",
					"phar_main_tuwana_tuwana",
					"phar_main_tuwana_hubishna"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_tuwana_cybistra"
			},
			{
				type = "control_region",
				region_key = "phar_main_tuwana_kelenderis"
			},
			{
				type = "control_region",
				region_key = "phar_main_tuwana_tuwana"
			},
			{
				type = "control_region",
				region_key = "phar_main_tuwana_hubishna"
			},
		}
	},
	{
		uid 				= "canaan_conquest_foreign_lowlands_parha",
		vp_reward 			= 1,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_lowlands_parha_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_lowlands_parha_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_parha_isaura",
					"phar_main_parha_sagalassos",
					"phar_main_parha_parha"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_parha_isaura"
			},
			{
				type = "control_region",
				region_key = "phar_main_parha_sagalassos"
			},
			{
				type = "control_region",
				region_key = "phar_main_parha_parha"
			},
		}
	},
	{
		uid 				= "canaan_conquest_foreign_lower_egypt_buto",
		vp_reward 			= 1,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_lower_egypt_buto_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_lower_egypt_buto_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_buto_buto",
					"phar_main_buto_sais",
					"phar_main_buto_paiuenamun"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_buto_buto"
			},
			{
				type = "control_region",
				region_key = "phar_main_buto_sais"
			},
			{
				type = "control_region",
				region_key = "phar_main_buto_paiuenamun"
			},
		}
	},
	{
		uid 				= "canaan_conquest_foreign_lower_egypt_faiyum",
		vp_reward 			= 1,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_lower_egypt_faiyum_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_lower_egypt_faiyum_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_faiyum_faiyum",
					"phar_main_faiyum_dahshur",
					"phar_main_faiyum_khem"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_faiyum_faiyum"
			},
			{
				type = "control_region",
				region_key = "phar_main_faiyum_dahshur"
			},
			{
				type = "control_region",
				region_key = "phar_main_faiyum_khem"
			},
		}
	},
	{
		uid 				= "canaan_conquest_foreign_lower_egypt_hardai",
		vp_reward 			= 1,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_lower_egypt_hardai_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_lower_egypt_hardai_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_hardai_tep_aha",
					"phar_main_hardai_ur_gem",
					"phar_main_hardai_hardai"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_hardai_tep_aha"
			},
			{
				type = "control_region",
				region_key = "phar_main_hardai_ur_gem"
			},
			{
				type = "control_region",
				region_key = "phar_main_hardai_hardai"
			},
		}
	},
	{
		uid 				= "canaan_conquest_foreign_lower_egypt_heliopolis",
		vp_reward 			= 1,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_lower_egypt_heliopolis_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_lower_egypt_heliopolis_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_heliopolis_heliopolis",
					"phar_main_heliopolis_qes"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_heliopolis_heliopolis"
			},
			{
				type = "control_region",
				region_key = "phar_main_heliopolis_qes"
			},
		}
	},
	{
		uid 				= "canaan_conquest_foreign_lower_egypt_herakleopolis",
		vp_reward 			= 1,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_lower_egypt_herakleopolis_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_lower_egypt_herakleopolis_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_herakleopolis_sheps_khu",
					"phar_main_herakleopolis_herakleopolis"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_herakleopolis_sheps_khu"
			},
			{
				type = "control_region",
				region_key = "phar_main_herakleopolis_herakleopolis"
			},
		}
	},
	{
		uid 				= "canaan_conquest_foreign_lower_egypt_hermopolis",
		vp_reward 			= 1,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_lower_egypt_hermopolis_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_lower_egypt_hermopolis_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_hermopolis_ti_ar",
					"phar_main_hermopolis_hermopolis"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_hermopolis_ti_ar"
			},
			{
				type = "control_region",
				region_key = "phar_main_hermopolis_hermopolis"
			},
		}
	},
	{
		uid 				= "canaan_conquest_foreign_lower_egypt_memphis",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_lower_egypt_memphis_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_lower_egypt_memphis_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_memphis_helwan",
					"phar_main_memphis_petpeh",
					"phar_main_memphis_memphis"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_memphis_helwan"
			},
			{
				type = "control_region",
				region_key = "phar_main_memphis_petpeh"
			},
			{
				type = "control_region",
				region_key = "phar_main_memphis_memphis"
			},
		}
	},
	{
		uid 				= "canaan_conquest_foreign_lower_egypt_pi_ramesses",
		vp_reward 			= 1,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_lower_egypt_pi_ramesses_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_lower_egypt_pi_ramesses_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_pi_ramesses_tjaru",
					"phar_main_pi_ramesses_per_amun",
					"phar_main_pi_ramesses_pi_ramesses"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_pi_ramesses_tjaru"
			},
			{
				type = "control_region",
				region_key = "phar_main_pi_ramesses_per_amun"
			},
			{
				type = "control_region",
				region_key = "phar_main_pi_ramesses_pi_ramesses"
			},
		}
	},
	{
		uid 				= "canaan_conquest_foreign_lower_egypt_rhacotis",
		vp_reward 			= 1,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_lower_egypt_rhacotis_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_lower_egypt_rhacotis_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_rhacotis_khan_aha",
					"phar_main_rhacotis_qema",
					"phar_main_rhacotis_rhacotis"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_rhacotis_khan_aha"
			},
			{
				type = "control_region",
				region_key = "phar_main_rhacotis_qema"
			},
			{
				type = "control_region",
				region_key = "phar_main_rhacotis_rhacotis"
			},
		}
	},
	{
		uid 				= "canaan_conquest_foreign_upper_egypt_abydos",
		vp_reward 			= 1,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_upper_egypt_abydos_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_upper_egypt_abydos_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_abydos_abydos",
					"phar_main_abydos_tin",
					"phar_main_abydos_aakh_ner"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_abydos_abydos"
			},
			{
				type = "control_region",
				region_key = "phar_main_abydos_tin"
			},
			{
				type = "control_region",
				region_key = "phar_main_abydos_aakh_ner"
			},
		}
	},
	{
		uid 				= "canaan_conquest_foreign_upper_egypt_akhmim",
		vp_reward 			= 1,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_upper_egypt_akhmim_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_upper_egypt_akhmim_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_akhmim_akhmim",
					"phar_main_akhmim_ur_men",
					"phar_main_akhmim_mefka_qes"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_akhmim_akhmim"
			},
			{
				type = "control_region",
				region_key = "phar_main_akhmim_ur_men"
			},
			{
				type = "control_region",
				region_key = "phar_main_akhmim_mefka_qes"
			},
		}
	},
	{
		uid 				= "canaan_conquest_foreign_upper_egypt_asyut",
		vp_reward 			= 1,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_upper_egypt_asyut_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_upper_egypt_asyut_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_asyut_kep_un",
					"phar_main_asyut_asyut",
					"phar_main_asyut_tem_khus"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_asyut_kep_un"
			},
			{
				type = "control_region",
				region_key = "phar_main_asyut_asyut"
			},
			{
				type = "control_region",
				region_key = "phar_main_asyut_tem_khus"
			},
		}
	},
	{
		uid 				= "canaan_conquest_foreign_upper_egypt_elephantine",
		vp_reward 			= 2,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_upper_egypt_elephantine_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_upper_egypt_elephantine_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_elephantine_elephantine",
					"phar_main_elephantine_tep_hetem",
					"phar_main_elephantine_hierakonpolis",
					"phar_main_elephantine_mes"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_elephantine_elephantine"
			},
			{
				type = "control_region",
				region_key = "phar_main_elephantine_tep_hetem"
			},
			{
				type = "control_region",
				region_key = "phar_main_elephantine_hierakonpolis"
			},
			{
				type = "control_region",
				region_key = "phar_main_elephantine_mes"
			},
		}
	},
	{
		uid 				= "canaan_conquest_foreign_upper_egypt_kom_ombo",
		vp_reward 			= 1,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_upper_egypt_kom_ombo_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_upper_egypt_kom_ombo_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kom_ombo_tchu_ua",
					"phar_main_kom_ombo_kom_ombo",
					"phar_main_kom_ombo_kha_sba"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_kom_ombo_tchu_ua"
			},
			{
				type = "control_region",
				region_key = "phar_main_kom_ombo_kom_ombo"
			},
			{
				type = "control_region",
				region_key = "phar_main_kom_ombo_kha_sba"
			},
		}
	},
	{
		uid 				= "canaan_conquest_foreign_upper_egypt_thebes",
		vp_reward 			= 1,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_upper_egypt_thebes_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_upper_egypt_thebes_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_thebes_kha_ti",
					"phar_main_thebes_sma_ua",
					"phar_main_thebes_thebes"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_thebes_kha_ti"
			},
			{
				type = "control_region",
				region_key = "phar_main_thebes_sma_ua"
			},
			{
				type = "control_region",
				region_key = "phar_main_thebes_thebes"
			},
		}
	},
	{
		uid 				= "canaan_conquest_foreign_western_desert_amunia",
		vp_reward 			= 1,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_western_desert_amunia_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_western_desert_amunia_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_amunia_amunia",
					"phar_main_amunia_met_usr",
					"phar_main_amunia_ner_neb"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_amunia_amunia"
			},
			{
				type = "control_region",
				region_key = "phar_main_amunia_met_usr"
			},
			{
				type = "control_region",
				region_key = "phar_main_amunia_ner_neb"
			},
		}
	},
	{
		uid 				= "canaan_conquest_foreign_realm_nubia",
		vp_reward 			= 4,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_realm_nubia_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_realm_nubia_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_buhen_shesp_ma",
					"phar_main_east_nubia_tep_heb",
					"phar_main_buhen_her_hetem",
					"phar_main_east_nubia_khefti_gehes",
					"phar_main_north_nubia_res_pa",
					"phar_main_north_nubia_mu_ua",
					"phar_main_east_nubia_ti_neb",
					"phar_main_north_east_nubia_utcha_uas",
					"phar_main_north_east_nubia_hetch_pa",
					"phar_main_north_nubia_miam",
					"phar_main_buhen_hap_au",
					"phar_main_buhen_buhen"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_buhen_shesp_ma"
			},
			{
				type = "control_region",
				region_key = "phar_main_east_nubia_tep_heb"
			},
			{
				type = "control_region",
				region_key = "phar_main_buhen_her_hetem"
			},
			{
				type = "control_region",
				region_key = "phar_main_east_nubia_khefti_gehes"
			},
			{
				type = "control_region",
				region_key = "phar_main_north_nubia_res_pa"
			},
			{
				type = "control_region",
				region_key = "phar_main_north_nubia_mu_ua"
			},
			{
				type = "control_region",
				region_key = "phar_main_east_nubia_ti_neb"
			},
			{
				type = "control_region",
				region_key = "phar_main_north_east_nubia_utcha_uas"
			},
			{
				type = "control_region",
				region_key = "phar_main_north_east_nubia_hetch_pa"
			},
			{
				type = "control_region",
				region_key = "phar_main_north_nubia_miam"
			},
			{
				type = "control_region",
				region_key = "phar_main_buhen_hap_au"
			},
			{
				type = "control_region",
				region_key = "phar_main_buhen_buhen"
			},
		}
	},
	{
		uid 				= "canaan_conquest_foreign_realm_kush",
		vp_reward 			= 4,
		restricted_to_subcultures = { "phar_main_sbc_canaan_canaans" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_realm_kush_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_realm_kush_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kerma_kerma",
					"phar_main_kawa_abu_ab",
					"phar_main_per_ramesses_meri_amon_per_ramesses_meri_amon",
					"phar_main_napata_napata",
					"phar_main_kerma_nu_abu",
					"phar_main_kerma_uab_khu",
					"phar_main_napata_res_tua",
					"phar_main_napata_res_khet",
					"phar_main_napata_hem_shema",
					"phar_main_kerma_mu_sh",
					"phar_main_kawa_khus_qes",
					"phar_main_kawa_kawa",
					"phar_main_per_ramesses_meri_amon_hap_sh",
					"phar_main_per_ramesses_meri_amon_khet_pa"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_kerma_kerma"
			},
			{
				type = "control_region",
				region_key = "phar_main_kawa_abu_ab"
			},
			{
				type = "control_region",
				region_key = "phar_main_per_ramesses_meri_amon_per_ramesses_meri_amon"
			},
			{
				type = "control_region",
				region_key = "phar_main_napata_napata"
			},
			{
				type = "control_region",
				region_key = "phar_main_kerma_nu_abu"
			},
			{
				type = "control_region",
				region_key = "phar_main_kerma_uab_khu"
			},
			{
				type = "control_region",
				region_key = "phar_main_napata_res_tua"
			},
			{
				type = "control_region",
				region_key = "phar_main_napata_res_khet"
			},
			{
				type = "control_region",
				region_key = "phar_main_napata_hem_shema"
			},
			{
				type = "control_region",
				region_key = "phar_main_kerma_mu_sh"
			},
			{
				type = "control_region",
				region_key = "phar_main_kawa_khus_qes"
			},
			{
				type = "control_region",
				region_key = "phar_main_kawa_kawa"
			},
			{
				type = "control_region",
				region_key = "phar_main_per_ramesses_meri_amon_hap_sh"
			},
			{
				type = "control_region",
				region_key = "phar_main_per_ramesses_meri_amon_khet_pa"
			},
		}
	},

	-------------------------------------------------------------
	-- SEA PEOPLES victory conditions
	-------------------------------------------------------------

	-------------------------------------------------------------
	-- CONQUER EGYPT
	-------------------------------------------------------------

            {
                uid                 = "sea_peoples_conquest_lower_egypt_buto",
                vp_reward           = 1,
                restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
                category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
                sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion,
                title_key           = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_lower_egypt_buto_title",
                description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_lower_egypt_buto_desc",     
                activation_conditions = {
                    {
                        type = "discover_any_region_of_list",
                        region_keys =
                        {
                            "phar_main_buto_buto",
                            "phar_main_buto_sais",
                            "phar_main_buto_paiuenamun"
                        }
                    },
                },
                completion_conditions = {
                    {
                        type = "control_region",
                        region_key = "phar_main_buto_buto",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_buto_sais",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_buto_paiuenamun",
						should_consider_razed_regions_as_under_control = true
                    },
                }
            },
            {
                uid                 = "sea_peoples_conquest_lower_egypt_faiyum",
                vp_reward           = 1,
                restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
                category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
                sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion,        
                title_key           = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_lower_egypt_faiyum_title",
                description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_lower_egypt_faiyum_desc",       
                activation_conditions = {
                    {
                        type = "discover_any_region_of_list",
                        region_keys =
                        {
                            "phar_main_faiyum_faiyum",
                            "phar_main_faiyum_dahshur",
                            "phar_main_faiyum_khem"
                        }
                    },
                },
                completion_conditions = {
                    {
                        type = "control_region",
                        region_key = "phar_main_faiyum_faiyum",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_faiyum_dahshur",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_faiyum_khem",
						should_consider_razed_regions_as_under_control = true
                    },
                }
            },
            {
                uid                 = "sea_peoples_conquest_lower_egypt_hardai",
                vp_reward           = 1,
                restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
                category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
                sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion,        
                title_key           = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_lower_egypt_hardai_title",
                description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_lower_egypt_hardai_desc",       
                activation_conditions = {
                    {
                        type = "discover_any_region_of_list",
                        region_keys =
                        { 
                            "phar_main_hardai_tep_aha",
                            "phar_main_hardai_ur_gem",
                            "phar_main_hardai_hardai"
                        }
                    },
                },
                completion_conditions = {
                    {
                        type = "control_region",
                        region_key = "phar_main_hardai_tep_aha",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_hardai_ur_gem",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_hardai_hardai",
						should_consider_razed_regions_as_under_control = true
                    },
                }
            },
            {
                uid                 = "sea_peoples_conquest_lower_egypt_heliopolis",
                vp_reward           = 1,
                restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
                category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
                sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion,        
                title_key           = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_lower_egypt_heliopolis_title",
                description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_lower_egypt_heliopolis_desc",       
                activation_conditions = {
                    {
                        type = "discover_any_region_of_list",
                        region_keys =
                        {
                            "phar_main_heliopolis_heliopolis",
                            "phar_main_heliopolis_qes"
                        }
                    },
                },
                completion_conditions = {
                    {
                        type = "control_region",
                        region_key = "phar_main_heliopolis_heliopolis",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_heliopolis_qes",
						should_consider_razed_regions_as_under_control = true
                    },
                }
            },
            {
                uid                 = "sea_peoples_conquest_lower_egypt_herakleopolis",
                vp_reward           = 1,
                restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
                category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
                sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion,        
                title_key           = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_lower_egypt_herakleopolis_title",
                description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_lower_egypt_herakleopolis_desc",        
                activation_conditions = {
                    {
                        type = "discover_any_region_of_list",
                        region_keys =
                        {
                            "phar_main_herakleopolis_sheps_khu",
                            "phar_main_herakleopolis_herakleopolis"
                        }
                    },
                },
                completion_conditions = {
                    {
                        type = "control_region",
                        region_key = "phar_main_herakleopolis_sheps_khu",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_herakleopolis_herakleopolis",
						should_consider_razed_regions_as_under_control = true
                    },
                }
            },
            {
                uid                 = "sea_peoples_conquest_lower_egypt_hermopolis",
                vp_reward           = 1,
                restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
                category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
                sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion,        
                title_key           = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_lower_egypt_hermopolis_title",
                description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_lower_egypt_hermopolis_desc",       
                activation_conditions = {
                    {
                        type = "discover_any_region_of_list",
                        region_keys =
                        {
                            "phar_main_hermopolis_ti_ar",
                            "phar_main_hermopolis_hermopolis"
                        }
                    },
                },
                completion_conditions = {
                    {
                        type = "control_region",
                        region_key = "phar_main_hermopolis_ti_ar",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_hermopolis_hermopolis",
						should_consider_razed_regions_as_under_control = true
                    },
                }
            },
            {
                uid                 = "sea_peoples_conquest_lower_egypt_memphis",
                vp_reward           = 1,
                restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
                category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
                sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion,        
                title_key           = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_lower_egypt_memphis_title",
                description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_lower_egypt_memphis_desc",      
                activation_conditions = {
                    {
                        type = "discover_any_region_of_list",
                        region_keys =
                        {
                            "phar_main_memphis_helwan",
                            "phar_main_memphis_petpeh",
                            "phar_main_memphis_memphis"
                        }
                    },
                },
                completion_conditions = {
                    {
                        type = "control_region",
                        region_key = "phar_main_memphis_helwan",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_memphis_petpeh",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_memphis_memphis",
						should_consider_razed_regions_as_under_control = true
                    },
                }
            },
            {
                uid                 = "sea_peoples_conquest_lower_egypt_pi_ramesses",
                vp_reward           = 1,
                restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
                category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
                sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion,        
                title_key           = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_lower_egypt_pi_ramesses_title",
                description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_lower_egypt_pi_ramesses_desc",      
                activation_conditions = {
                    {
                        type = "discover_any_region_of_list",
                        region_keys =
                        {
                            "phar_main_pi_ramesses_tjaru",
                            "phar_main_pi_ramesses_per_amun",
                            "phar_main_pi_ramesses_pi_ramesses"
                        }
                    },
                },
                completion_conditions = {
                    {
                        type = "control_region",
                        region_key = "phar_main_pi_ramesses_tjaru",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_pi_ramesses_per_amun",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_pi_ramesses_pi_ramesses",
						should_consider_razed_regions_as_under_control = true
                    },
                }
            },
            {
                uid                 = "sea_peoples_conquest_lower_egypt_rhacotis",
                vp_reward           = 1,
                restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
                category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
                sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion,        
                title_key           = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_lower_egypt_rhacotis_title",
                description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_lower_egypt_rhacotis_desc",     
                activation_conditions = {
                    {
                        type = "discover_any_region_of_list",
                        region_keys =
                        {
                            "phar_main_rhacotis_khan_aha",
                            "phar_main_rhacotis_qema",
                            "phar_main_rhacotis_rhacotis"
                        }
                    },
                },
                completion_conditions = {
                    {
                        type = "control_region",
                        region_key = "phar_main_rhacotis_khan_aha",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_rhacotis_qema",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_rhacotis_rhacotis",
						should_consider_razed_regions_as_under_control = true
                    },
                }
            },
            {
                uid                 = "sea_peoples_conquest_upper_egypt_abydos",
                vp_reward           = 1,
                restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
                category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
                sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion,        
                title_key           = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_upper_egypt_abydos_title",
                description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_upper_egypt_abydos_desc",       
                activation_conditions = {
                    {
                        type = "discover_any_region_of_list",
                        region_keys =
                        {
                            "phar_main_abydos_abydos",
                            "phar_main_abydos_tin",
                            "phar_main_abydos_aakh_ner"
                        }
                    },
                },
                completion_conditions = {
                    {
                        type = "control_region",
                        region_key = "phar_main_abydos_abydos",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_abydos_tin",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_abydos_aakh_ner",
						should_consider_razed_regions_as_under_control = true
                    },
                }
            },
            {
                uid                 = "sea_peoples_conquest_upper_egypt_akhmim",
                vp_reward           = 1,
                restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
                category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
                sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion,        
                title_key           = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_upper_egypt_akhmim_title",
                description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_upper_egypt_akhmim_desc",       
                activation_conditions = {
                    {
                        type = "discover_any_region_of_list",
                        region_keys =
                        {
                            "phar_main_akhmim_akhmim",
                            "phar_main_akhmim_ur_men",
                            "phar_main_akhmim_mefka_qes"
                        }
                    },
                },
                completion_conditions = {
                    {
                        type = "control_region",
                        region_key = "phar_main_akhmim_akhmim",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_akhmim_ur_men",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_akhmim_mefka_qes",
						should_consider_razed_regions_as_under_control = true
                    },
                }
            },
            {
                uid                 = "sea_peoples_conquest_upper_egypt_asyut",
                vp_reward           = 1,
                restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
                category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
                sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion,        
                title_key           = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_upper_egypt_asyut_title",
                description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_upper_egypt_asyut_desc",        
                activation_conditions = {
                    {
                        type = "discover_any_region_of_list",
                        region_keys =
                        {
                            "phar_main_asyut_kep_un",
                            "phar_main_asyut_asyut",
                            "phar_main_asyut_tem_khus"
                        }
                    },
                },
                completion_conditions = {
                    {
                        type = "control_region",
                        region_key = "phar_main_asyut_kep_un",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_asyut_asyut",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_asyut_tem_khus",
						should_consider_razed_regions_as_under_control = true
                    },
                }
            },
            {
                uid                 = "sea_peoples_conquest_upper_egypt_elephantine",
                vp_reward           = 1,
                restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
                category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
                sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion,        
                title_key           = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_upper_egypt_elephantine_title",
                description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_upper_egypt_elephantine_desc",      
                activation_conditions = {
                    {
                        type = "discover_any_region_of_list",
                        region_keys =
                        {
                            "phar_main_elephantine_elephantine",
                            "phar_main_elephantine_tep_hetem",
                            "phar_main_elephantine_hierakonpolis",
                            "phar_main_elephantine_mes"
                        }
                    },
                },
                completion_conditions = {
                    {
                        type = "control_region",
                        region_key = "phar_main_elephantine_elephantine",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_elephantine_tep_hetem",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_elephantine_hierakonpolis",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_elephantine_mes",
						should_consider_razed_regions_as_under_control = true
                    },
                }
            },
            {
                uid                 = "sea_peoples_conquest_upper_egypt_kom_ombo",
                vp_reward           = 1,
                restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
                category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
                sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion,        
                title_key           = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_upper_egypt_kom_ombo_title",
                description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_upper_egypt_kom_ombo_desc",     
                activation_conditions = {
                    {
                        type = "discover_any_region_of_list",
                        region_keys =
                        {
                            "phar_main_kom_ombo_tchu_ua",
                            "phar_main_kom_ombo_kom_ombo",
                            "phar_main_kom_ombo_kha_sba"
                        }
                    },
                },
                completion_conditions = {
                    {
                        type = "control_region",
                        region_key = "phar_main_kom_ombo_tchu_ua",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_kom_ombo_kom_ombo",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_kom_ombo_kha_sba",
						should_consider_razed_regions_as_under_control = true
                    },
                }
            },
            {
                uid                 = "sea_peoples_conquest_upper_egypt_thebes",
                vp_reward           = 1,
                restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
                category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
                sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion,        
                title_key           = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_upper_egypt_thebes_title",
                description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_upper_egypt_thebes_desc",       
                activation_conditions = {
                    {
                        type = "discover_any_region_of_list",
                        region_keys =
                        {
                            "phar_main_thebes_kha_ti",
                            "phar_main_thebes_sma_ua",
                            "phar_main_thebes_thebes"
                        }
                    },
                },
                completion_conditions = {
                    {
                        type = "control_region",
                        region_key = "phar_main_thebes_kha_ti",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_thebes_sma_ua",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_thebes_thebes",
						should_consider_razed_regions_as_under_control = true
                    },
                }
            },
            {
                uid                 = "sea_peoples_conquest_nubia_buhen",
                vp_reward           = 1,
                restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
                category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
                sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion,        
                title_key           = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_nubia_buhen_title",
                description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_nubia_buhen_desc",      
                activation_conditions = {
                    {
                        type = "discover_any_region_of_list",
                        region_keys =
                        {
                            "phar_main_buhen_shesp_ma",
                            "phar_main_buhen_her_hetem",
                            "phar_main_buhen_hap_au",
                            "phar_main_buhen_buhen"
                        }
                    },
                },
                completion_conditions = {
                    {
                        type = "control_region",
                        region_key = "phar_main_buhen_shesp_ma",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_buhen_her_hetem",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_buhen_hap_au",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_buhen_buhen",
						should_consider_razed_regions_as_under_control = true
                    },
                }
            },
            {
                uid                 = "sea_peoples_conquest_nubia_north_nubia",
                vp_reward           = 1,
                restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
                category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
                sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion,        
                title_key           = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_nubia_north_nubia_title",
                description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_nubia_north_nubia_desc",        
                activation_conditions = {
                    {
                        type = "discover_any_region_of_list",
                        region_keys =
                        {
                            "phar_main_north_nubia_res_pa",
                            "phar_main_north_nubia_mu_ua",
                            "phar_main_north_nubia_miam"
                        }
                    },
                },
                completion_conditions = {
                    {
                        type = "control_region",
                        region_key = "phar_main_north_nubia_res_pa",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_north_nubia_mu_ua",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_north_nubia_miam",
						should_consider_razed_regions_as_under_control = true
                    },
                }
            },
            {
                uid                 = "sea_peoples_conquest_kush_per_ramesses_meri_amon",
                vp_reward           = 1,
                restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
        
                category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
                sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion,        
                title_key           = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_kush_per_ramesses_meri_amon_title",
                description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_kush_per_ramesses_meri_amon_desc",      
                activation_conditions = {
                    {
                        type = "discover_any_region_of_list",
                        region_keys =
                        {
                            "phar_main_per_ramesses_meri_amon_per_ramesses_meri_amon",
                            "phar_main_per_ramesses_meri_amon_hap_sh",
                            "phar_main_per_ramesses_meri_amon_khet_pa"
                        }
                    },
                },
                completion_conditions = {
                    {
                        type = "control_region",
                        region_key = "phar_main_per_ramesses_meri_amon_per_ramesses_meri_amon",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_per_ramesses_meri_amon_hap_sh",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_per_ramesses_meri_amon_khet_pa",
						should_consider_razed_regions_as_under_control = true
                    },
                }
            },
            {
                uid                 = "sea_peoples_conquest_western_desert_kharga_oasis",
                vp_reward           = 1,
                restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
                category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
                sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion,        
                title_key           = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_western_desert_kharga_oasis_title",
                description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_western_desert_kharga_oasis_desc",      
                activation_conditions = {
                    {
                        type = "discover_any_region_of_list",
                        region_keys =
                        {
                            "phar_main_kharga_oasis_kharga_oasis",
                            "phar_main_kharga_oasis_shesp_net",
                            "phar_main_kharga_oasis_tebh"
                        }
                    },
                },
                completion_conditions = {
                    {
                        type = "control_region",
                        region_key = "phar_main_kharga_oasis_kharga_oasis",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_kharga_oasis_shesp_net",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_kharga_oasis_tebh",
						should_consider_razed_regions_as_under_control = true
                    },
                }
            },
            {
                uid                 = "sea_peoples_conquest_western_desert_kurkur_oasis",
                vp_reward           = 1,
                restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
                category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
                sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion,        
                title_key           = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_western_desert_kurkur_oasis_title",
                description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_western_desert_kurkur_oasis_desc",      
                activation_conditions = {
                    {
                        type = "discover_any_region_of_list",
                        region_keys =
                        {
                            "phar_main_kurkur_oasis_kurkur_oasis",
                            "phar_main_kurkur_oasis_sen_hetem",
                            "phar_main_kurkur_oasis_tcheba_ua"
                        }
                    },
                },
                completion_conditions = {
                    {
                        type = "control_region",
                        region_key = "phar_main_kurkur_oasis_kurkur_oasis",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_kurkur_oasis_sen_hetem",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_kurkur_oasis_tcheba_ua",
						should_consider_razed_regions_as_under_control = true
                    },
                }
            },
            {
                uid                 = "sea_peoples_conquest_kush_kerma",
                vp_reward           = 1,
                restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
                category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
                sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion,        
                title_key           = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_kush_kerma_title",
                description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_kush_kerma_desc",     
                activation_conditions = {
                    {
                        type = "discover_any_region_of_list",
                        region_keys =
                        {
                            "phar_main_kerma_kerma",
                            "phar_main_kerma_nu_abu",
                            "phar_main_kerma_uab_khu",
                            "phar_main_kerma_mu_sh"
                        }
                    },
                },
                completion_conditions = {
                    {
                        type = "control_region",
                        region_key = "phar_main_kerma_kerma",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_kerma_nu_abu",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_kerma_uab_khu",
						should_consider_razed_regions_as_under_control = true
                    },
                    {
                        type = "control_region",
                        region_key = "phar_main_kerma_mu_sh",
						should_consider_razed_regions_as_under_control = true
                    },
                }
            },

			-------------------------------------------------------------
			--SEA PEOPLES - CONQUER ANATOLIA
			-------------------------------------------------------------

			{
				uid 				= "sea_peoples_conquest_highlands_ancyra",
				vp_reward 			= 1,
				restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
				category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
				sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion,		
				title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_highlands_ancyra_title",
				description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_highlands_ancyra_desc",		
				activation_conditions = {
					{
						type = "discover_any_region_of_list",
						region_keys =
						{
							"phar_main_ancyra_lagania",
							"phar_main_ancyra_ancyra",
							"phar_main_ancyra_aspona"
						}
					},
				},
				completion_conditions = {
					{
						type = "control_region",
						region_key = "phar_main_ancyra_lagania",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_ancyra_ancyra",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_ancyra_aspona",
						should_consider_razed_regions_as_under_control = true
					},
				}
			},
			{
				uid 				= "sea_peoples_conquest_highlands_hattussa",
				vp_reward 			= 1,
				restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
				category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
				sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion,		
				title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_highlands_hattussa_title",
				description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_highlands_hattussa_desc",		
				activation_conditions = {
					{
						type = "discover_any_region_of_list",
						region_keys =
						{
							"phar_main_hattussa_ankuwa",
							"phar_main_hattussa_corniaspa",
							"phar_main_hattussa_hattussa",
							"phar_main_hattussa_arinna"
						}
					},
				},
				completion_conditions = {
					{
						type = "control_region",
						region_key = "phar_main_hattussa_ankuwa",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_hattussa_corniaspa",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_hattussa_hattussa",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_hattussa_arinna",
						should_consider_razed_regions_as_under_control = true
					},
				}
			},
			{
				uid 				= "sea_peoples_conquest_highlands_purushanda",
				vp_reward 			= 1,
				restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
				category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
				sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion,		
				title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_highlands_purushanda_title",
				description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_highlands_purushanda_desc",		
				activation_conditions = {
					{
						type = "discover_any_region_of_list",
						region_keys =
						{
							"phar_main_purushanda_nyssa",
							"phar_main_purushanda_purushanda",
							"phar_main_purushanda_mokissos"
						}
					},
				},
				completion_conditions = {
					{
						type = "control_region",
						region_key = "phar_main_purushanda_nyssa",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_purushanda_purushanda",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_purushanda_mokissos",
						should_consider_razed_regions_as_under_control = true
					},
				}
			},
			{
				uid 				= "sea_peoples_conquest_shl_isuwa_kanesh",
				vp_reward 			= 1,
				restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
				category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
				sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion,		
				title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_isuwa_kanesh_title",
				description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_isuwa_kanesh_desc",		
				activation_conditions = {
					{
						type = "discover_any_region_of_list",
						region_keys =
						{
							"phar_main_kanesh_kanesh",
							"phar_main_kanesh_kummanni",
							"phar_main_kanesh_saricha"
						}
					},
				},
				completion_conditions = {
					{
						type = "control_region",
						region_key = "phar_main_kanesh_kanesh",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_kanesh_kummanni",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_kanesh_saricha",
						should_consider_razed_regions_as_under_control = true
					},
				}
			},
			{
				uid 				= "sea_peoples_conquest_isuwa_malidiya",
				vp_reward 			= 1,
				restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
				category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
				sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion,		
				title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_isuwa_malidiya_title",
				description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_isuwa_malidiya_desc",		
				activation_conditions = {
					{
						type = "discover_any_region_of_list",
						region_keys =
						{
							"phar_main_malidiya_tegarama",
							"phar_main_malidiya_malidiya",
							"phar_main_malidiya_samuha",
							"phar_main_malidiya_zara"
						}
					},
				},
				completion_conditions = {
					{
						type = "control_region",
						region_key = "phar_main_malidiya_tegarama",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_malidiya_malidiya",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_malidiya_samuha",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_malidiya_zara",
						should_consider_razed_regions_as_under_control = true
					},
				}
			},
			{
				uid 				= "sea_peoples_conquest_isuwa_zippalanda",
				vp_reward 			= 1,
				restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
				category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
				sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion,		
				title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_isuwa_zippalanda_title",
				description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_isuwa_zippalanda_desc",		
				activation_conditions = {
					{
						type = "discover_any_region_of_list",
						region_keys =
						{
							"phar_main_zippalanda_nerik",
							"phar_main_zippalanda_amaseia",
							"phar_main_zippalanda_zippalanda",
							"phar_main_zippalanda_sapinuwa"
						}
					},
				},
				completion_conditions = {
					{
						type = "control_region",
						region_key = "phar_main_zippalanda_nerik",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_zippalanda_amaseia",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_zippalanda_zippalanda",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_zippalanda_sapinuwa",
						should_consider_razed_regions_as_under_control = true
					},
				}
			},
			{
				uid 				= "sea_peoples_conquest_lowlands_central_hatti",
				vp_reward 			= 1,
				restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
				category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
				sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion,		
				title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_lowlands_central_hatti_title",
				description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_lowlands_central_hatti_desc",		
				activation_conditions = {
					{
						type = "discover_any_region_of_list",
						region_keys =
						{
							"phar_main_central_hatti_pegella",
							"phar_main_central_hatti_larawanda",
							"phar_main_central_hatti_koropissos"
						}
					},
				},
				completion_conditions = {
					{
						type = "control_region",
						region_key = "phar_main_central_hatti_pegella",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_central_hatti_larawanda",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_central_hatti_koropissos",
						should_consider_razed_regions_as_under_control = true
					},
				}
			},
			{
				uid 				= "sea_peoples_conquest_lowlands_south_hatti",
				vp_reward 			= 1,
				restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
				category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
				sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion,		
				title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_lowlands_south_hatti_title",
				description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_lowlands_south_hatti_desc",		
				activation_conditions = {
					{
						type = "discover_any_region_of_list",
						region_keys =
						{
							"phar_main_south_hatti_cibyra",
							"phar_main_south_hatti_lystra",
							"phar_main_south_hatti_tarhuntassa"
						}
					},
				},
				completion_conditions = {
					{
						type = "control_region",
						region_key = "phar_main_south_hatti_cibyra",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_south_hatti_lystra",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_south_hatti_tarhuntassa",
						should_consider_razed_regions_as_under_control = true
					},
				}
			},
			{
				uid 				= "sea_peoples_conquest_lowlands_tarsus",
				vp_reward 			= 1,
				restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
				category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
				sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion,		
				title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_lowlands_tarsus_title",
				description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_lowlands_tarsus_desc",		
				activation_conditions = {
					{
						type = "discover_any_region_of_list",
						region_keys =
						{
							"phar_main_tarsus_kyinda",
							"phar_main_tarsus_adana",
							"phar_main_tarsus_tarsus"
						}
					},
				},
				completion_conditions = {
					{
						type = "control_region",
						region_key = "phar_main_tarsus_kyinda",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_tarsus_adana",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_tarsus_tarsus",
						should_consider_razed_regions_as_under_control = true
					},
				}
			},
			{
				uid 				= "sea_peoples_conquest_lowlands_tuwana",
				vp_reward 			= 1,
				restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
				category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
				sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion,		
				title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_lowlands_tuwana_title",
				description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_lowlands_tuwana_desc",		
				activation_conditions = {
					{
						type = "discover_any_region_of_list",
						region_keys =
						{
							"phar_main_tuwana_cybistra",
							"phar_main_tuwana_kelenderis",
							"phar_main_tuwana_tuwana",
							"phar_main_tuwana_hubishna"
						}
					},
				},
				completion_conditions = {
					{
						type = "control_region",
						region_key = "phar_main_tuwana_cybistra",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_tuwana_kelenderis",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_tuwana_tuwana",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_tuwana_hubishna",
						should_consider_razed_regions_as_under_control = true
					},
				}
			},

			-------------------------------------------------------------
			-- SEA PEOPLES - CONQUER CANAAN
			-------------------------------------------------------------

			{
				uid 				= "sea_peoples_conquest_fenkhu_kadesh",
				vp_reward 			= 1,
				restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
				category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
				sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion,		
				title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_fenkhu_kadesh_title",
				description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_fenkhu_kadesh_desc",		
				activation_conditions = {
					{
						type = "discover_any_region_of_list",
						region_keys =
						{
							"phar_main_kadesh_sumur",
							"phar_main_kadesh_kadesh"
						}
					},
				},
				completion_conditions = {
					{
						type = "control_region",
						region_key = "phar_main_kadesh_sumur",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_kadesh_kadesh",
						should_consider_razed_regions_as_under_control = true
					},
				}
			},
			{
				uid 				= "sea_peoples_conquest_fenkhu_megiddo",
				vp_reward 			= 1,
				restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
				category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
				sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion,		
				title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_fenkhu_megiddo_title",
				description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_fenkhu_megiddo_desc",		
				activation_conditions = {
					{
						type = "discover_any_region_of_list",
						region_keys =
						{
							"phar_main_megiddo_yapo",
							"phar_main_megiddo_megiddo"
						}
					},
				},
				completion_conditions = {
					{
						type = "control_region",
						region_key = "phar_main_megiddo_yapo",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_megiddo_megiddo",
						should_consider_razed_regions_as_under_control = true
					},
				}
			},
			{
				uid 				= "sea_peoples_conquest_fenkhu_tyre",
				vp_reward 			= 1,
				restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
				category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
				sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion,		
				title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_fenkhu_tyre_title",
				description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_fenkhu_tyre_desc",		
				activation_conditions = {
					{
						type = "discover_any_region_of_list",
						region_keys =
						{
							"phar_main_tyre_hazor",
							"phar_main_tyre_byblos",
							"phar_main_tyre_tyre",
							"phar_main_tyre_sidon"
						}
					},
				},
				completion_conditions = {
					{
						type = "control_region",
						region_key = "phar_main_tyre_hazor",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_tyre_byblos",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_tyre_tyre",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_tyre_sidon",
						should_consider_razed_regions_as_under_control = true
					},
				}
			},
			{
				uid 				= "sea_peoples_conquest_yamhad_alashiya",
				vp_reward 			= 1,
				restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
				category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
				sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion,		
				title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_yamhad_alashiya_title",
				description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_yamhad_alashiya_desc",		
				activation_conditions = {
					{
						type = "discover_any_region_of_list",
						region_keys =
						{
							"phar_main_alashiya_paphos",
							"phar_main_alashiya_kition",
							"phar_main_alashiya_alashiya"
						}
					},
				},
				completion_conditions = {
					{
						type = "control_region",
						region_key = "phar_main_alashiya_paphos",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_alashiya_kition",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_alashiya_alashiya",
						should_consider_razed_regions_as_under_control = true
					},
				}
			},
			{
				uid 				= "sea_peoples_conquest_yamhad_aleppo",
				vp_reward 			= 1,
				restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
				category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
				sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion,		
				title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_yamhad_aleppo_title",
				description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_yamhad_aleppo_desc",		
				activation_conditions = {
					{
						type = "discover_any_region_of_list",
						region_keys =
						{
							"phar_main_aleppo_alalah",
							"phar_main_aleppo_aleppo"
						}
					},
				},
				completion_conditions = {
					{
						type = "control_region",
						region_key = "phar_main_aleppo_alalah",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_aleppo_aleppo",
						should_consider_razed_regions_as_under_control = true
					},
				}
			},
			{
				uid 				= "sea_peoples_conquest_yamhad_ugarit",
				vp_reward 			= 1,
				restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
				category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
				sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion,		
				title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_yamhad_ugarit_title",
				description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_yamhad_ugarit_desc",		
				activation_conditions = {
					{
						type = "discover_any_region_of_list",
						region_keys =
						{
							"phar_main_ugarit_ugarit",
							"phar_main_ugarit_ebla"
						}
					},
				},
				completion_conditions = {
					{
						type = "control_region",
						region_key = "phar_main_ugarit_ugarit",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_ugarit_ebla",
						should_consider_razed_regions_as_under_control = true
					},
				}
			},
			{
				uid 				= "sea_peoples_conquest_yamhad_carchemish",
				vp_reward 			= 1,
				restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
				category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
				sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion,		
				title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_yamhad_carchemish_title",
				description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_yamhad_carchemish_desc",		
				activation_conditions = {
					{
						type = "discover_any_region_of_list",
						region_keys =
						{
							"phar_main_carchemish_carchemish",
							"phar_main_carchemish_harranu",
							"phar_main_carchemish_tuba",
							"phar_main_carchemish_khantap"
						}
					},
				},
				completion_conditions = {
					{
						type = "control_region",
						region_key = "phar_main_carchemish_carchemish",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_carchemish_harranu",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_carchemish_tuba",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_carchemish_khantap",
						should_consider_razed_regions_as_under_control = true
					},
				}
			},
			{
				uid 				= "sea_peoples_conquest_retjenu_damascus",
				vp_reward 			= 1,
				restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
				category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
				sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion,		
				title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_retjenu_damascus_title",
				description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_retjenu_damascus_desc",		
				activation_conditions = {
					{
						type = "discover_any_region_of_list",
						region_keys =
						{
							"phar_main_damascus_damascus",
							"phar_main_damascus_sedad",
							"phar_main_damascus_jawa",
							"phar_main_damascus_tadmor"
						}
					},
				},
				completion_conditions = {
					{
						type = "control_region",
						region_key = "phar_main_damascus_damascus",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_damascus_sedad",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_damascus_jawa",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_damascus_tadmor",
						should_consider_razed_regions_as_under_control = true
					},
				}
			},
			{
				uid 				= "sea_peoples_conqueste_retjenu_emar",
				vp_reward 			= 1,
				restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
				category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
				sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion,		
				title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_retjenu_emar_title",
				description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_retjenu_emar_desc",		
				activation_conditions = {
					{
						type = "discover_any_region_of_list",
						region_keys =
						{
							"phar_main_emar_qatna",
							"phar_main_emar_emar",
							"phar_main_emar_teshub"
						}
					},
				},
				completion_conditions = {
					{
						type = "control_region",
						region_key = "phar_main_emar_qatna",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_emar_emar",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_emar_teshub",
						should_consider_razed_regions_as_under_control = true
					},
				}
			},
			{
				uid 				= "sea_peoples_conquest_retjenu_shechem",
				vp_reward 			= 1,
				restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
				category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
				sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion,		
				title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_retjenu_shechem_title",
				description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_retjenu_shechem_desc",		
				activation_conditions = {
					{
						type = "discover_any_region_of_list",
						region_keys =
						{
							"phar_main_shechem_ammon",
							"phar_main_shechem_sakka",
							"phar_main_shechem_shechem"
						}
					},
				},
				completion_conditions = {
					{
						type = "control_region",
						region_key = "phar_main_shechem_ammon",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_shechem_sakka",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_shechem_shechem",
						should_consider_razed_regions_as_under_control = true
					},
				}
			},
			{
				uid 				= "sea_peoples_conquest_sinai_ashkelon",
				vp_reward 			= 1,
				restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
				category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
				sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion,		
				title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_sinai_ashkelon_title",
				description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_sinai_ashkelon_desc",		
				activation_conditions = {
					{
						type = "discover_any_region_of_list",
						region_keys =
						{
							"phar_main_ashkelon_ashkelon",
							"phar_main_ashkelon_pel",
							"phar_main_ashkelon_urushalim"
						}
					},
				},
				completion_conditions = {
					{
						type = "control_region",
						region_key = "phar_main_ashkelon_ashkelon",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_ashkelon_pel",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_ashkelon_urushalim",
						should_consider_razed_regions_as_under_control = true
					},
				}
			},
			{
				uid 				= "sea_peoples_conquest_sinai_east_sinai",
				vp_reward 			= 1,
				restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
				category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
				sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion,		
				title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_sinai_east_sinai_title",
				description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_sinai_east_sinai_desc",		
				activation_conditions = {
					{
						type = "discover_any_region_of_list",
						region_keys =
						{
							"phar_main_east_sinai_beersheba",
							"phar_main_east_sinai_khet_khefti"
						}
					},
				},
				completion_conditions = {
					{
						type = "control_region",
						region_key = "phar_main_east_sinai_beersheba",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_east_sinai_khet_khefti",
						should_consider_razed_regions_as_under_control = true
					},
				}
			},
			{
				uid 				= "sea_peoples_conquest_sinai_north_sinai",
				vp_reward 			= 1,
				restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
				category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
				sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion,		
				title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_sinai_north_sinai_title",
				description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_sinai_north_sinai_desc",		
				activation_conditions = {
					{
						type = "discover_any_region_of_list",
						region_keys =
						{
							"phar_main_north_sinai_nekhel",
							"phar_main_north_sinai_neb_gehes",
							"phar_main_north_sinai_azzati",
							"phar_main_north_sinai_sukkot"
						}
					},
				},
				completion_conditions = {
					{
						type = "control_region",
						region_key = "phar_main_north_sinai_nekhel",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_north_sinai_neb_gehes",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_north_sinai_azzati",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_north_sinai_sukkot",
						should_consider_razed_regions_as_under_control = true
					},
				}
			},
			{
				uid 				= "sea_peoples_conquest_sinai_sinai",
				vp_reward 			= 1,
				restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
				category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
				sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion,		
				title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_sinai_sinai_title",
				description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_conquest_sinai_sinai_desc",		
				activation_conditions = {
					{
						type = "discover_any_region_of_list",
						region_keys =
						{
							"phar_main_sinai_hetch",
							"phar_main_sinai_tchu_am",
							"phar_main_sinai_tchu_sh"
						}
					},
				},
				completion_conditions = {
					{
						type = "control_region",
						region_key = "phar_main_sinai_hetch",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_sinai_tchu_am",
						should_consider_razed_regions_as_under_control = true
					},
					{
						type = "control_region",
						region_key = "phar_main_sinai_tchu_sh",
						should_consider_razed_regions_as_under_control = true
					},
				}
			},

			-------------------------------------------------------------
			-- END OF SEA PEOPLES VCS
			-------------------------------------------------------------

	-------------------------------------------------------------
	-- Places of Prominence, conquest-related VCs, common to most other factions
	-------------------------------------------------------------

	{
		uid 				= "common_conquest_prominence_egypt_abydos",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_all_excluding_sea_peoples, -- Added culture limit ignoring sea people factions
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_abydos_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_abydos_desc",
		disable_progress_bar = true, 		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_abydos_abydos"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_abydos_abydos"
			},
		}
	},
	{
		uid 				= "common_conquest_prominence_egypt_buhen",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_all_excluding_sea_peoples, -- Added culture limit ignoring sea people factions
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_buhen_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_buhen_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_buhen_buhen"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_buhen_buhen"
			},
		}
	},
	{
		uid 				= "common_conquest_prominence_egypt_heliopolis",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_all_excluding_sea_peoples, -- Added culture limit ignoring sea people factions
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_heliopolis_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_heliopolis_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_heliopolis_heliopolis"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_heliopolis_heliopolis"
			},
		}
	},
	{
		uid 				= "common_conquest_prominence_egypt_hermopolis",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_all_excluding_sea_peoples, -- Added culture limit ignoring sea people factions
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_hermopolis_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_hermopolis_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_hermopolis_hermopolis"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_hermopolis_hermopolis"
			},
		}
	},
	{
		uid 				= "common_conquest_prominence_egypt_kawa",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_all_excluding_sea_peoples, -- Added culture limit ignoring sea people factions
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_kawa_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_kawa_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kawa_kawa"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_kawa_kawa"
			},
		}
	},
	{
		uid 				= "common_conquest_prominence_egypt_kom_ombo",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_all_excluding_sea_peoples, -- Added culture limit ignoring sea people factions
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_kom_ombo_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_kom_ombo_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kom_ombo_kom_ombo"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_kom_ombo_kom_ombo"
			},
		}
	},
	{
		uid 				= "common_conquest_prominence_egypt_memphis",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_all_excluding_sea_peoples, -- Added culture limit ignoring sea people factions
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_memphis_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_memphis_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_memphis_memphis"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_memphis_memphis"
			},
		}
	},
	{
		uid 				= "common_conquest_prominence_egypt_miam",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_all_excluding_sea_peoples, -- Added culture limit ignoring sea people factions
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_miam_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_miam_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_north_nubia_miam"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_north_nubia_miam"
			},
		}
	},
	{
		uid 				= "common_conquest_prominence_egypt_thebes",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_all_excluding_sea_peoples, -- Added culture limit ignoring sea people factions
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_thebes_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_thebes_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_thebes_thebes"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_thebes_thebes"
			},
		}
	},
	{
		uid 				= "common_conquest_prominence_canaan_ashkelon",
		vp_reward 			= 3,
		restricted_to_cultures = victory_objectives_cultures_all_excluding_sea_peoples, -- Added culture limit ignoring sea people factions
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_canaan_ashkelon_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_canaan_ashkelon_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_ashkelon_ashkelon"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_ashkelon_ashkelon"
			},
		}
	},
	{
		uid 				= "common_conquest_prominence_canaan_byblos",
		vp_reward 			= 3,
		restricted_to_cultures = victory_objectives_cultures_all_excluding_sea_peoples, -- Added culture limit ignoring sea people factions
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_canaan_byblos_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_canaan_byblos_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_tyre_byblos"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_tyre_byblos"
			},
		}
	},
	{
		uid 				= "common_conquest_prominence_canaan_carchemish",
		vp_reward 			= 3,
		restricted_to_cultures = victory_objectives_cultures_all_excluding_sea_peoples, -- Added culture limit ignoring sea people factions
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_canaan_carchemish_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_canaan_carchemish_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_carchemish_carchemish"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_carchemish_carchemish"
			},
		}
	},
	{
		uid 				= "common_conquest_prominence_canaan_damascus",
		vp_reward 			= 3,
		restricted_to_cultures = victory_objectives_cultures_all_excluding_sea_peoples, -- Added culture limit ignoring sea people factions
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_canaan_damascus_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_canaan_damascus_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_damascus_damascus"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_damascus_damascus"
			},
		}
	},
	{
		uid 				= "common_conquest_prominence_canaan_emar",
		vp_reward 			= 3,
		restricted_to_cultures = victory_objectives_cultures_all_excluding_sea_peoples, -- Added culture limit ignoring sea people factions
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_canaan_emar_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_canaan_emar_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_emar_emar"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_emar_emar"
			},
		}
	},
	{
		uid 				= "common_conquest_prominence_canaan_ugarit",
		vp_reward 			= 3,
		restricted_to_cultures = victory_objectives_cultures_all_excluding_sea_peoples, -- Added culture limit ignoring sea people factions
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_canaan_ugarit_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_canaan_ugarit_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_ugarit_ugarit"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_ugarit_ugarit"
			},
		}
	},
	{
		uid 				= "common_conquest_prominence_hatti_gordion",
		vp_reward 			= 4,
		restricted_to_cultures = victory_objectives_cultures_all_excluding_sea_peoples, -- Added culture limit ignoring sea people factions
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_hatti_gordion_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_hatti_gordion_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_west_hatti_gordion"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_west_hatti_gordion"
			},
		}
	},
	{
		uid 				= "common_conquest_prominence_hatti_hattussa",
		vp_reward 			= 4,
		restricted_to_cultures = victory_objectives_cultures_all_excluding_sea_peoples, -- Added culture limit ignoring sea people factions
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_hatti_hattussa_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_hatti_hattussa_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_hattussa_hattussa"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_hattussa_hattussa"
			},
		}
	},
	{
		uid 				= "common_conquest_prominence_hatti_tarhuntassa",
		vp_reward 			= 4,
		restricted_to_cultures = victory_objectives_cultures_all_excluding_sea_peoples, -- Added culture limit ignoring sea people factions
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_hatti_tarhuntassa_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_hatti_tarhuntassa_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_south_hatti_tarhuntassa"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_south_hatti_tarhuntassa"
			},
		}
	},
	{
		uid 				= "common_conquest_prominence_malidiya_malidiya",
		vp_reward 			= 4,
		restricted_to_cultures = victory_objectives_cultures_all_excluding_sea_peoples, -- Added culture limit ignoring sea people factions
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_malidiya_malidiya_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_malidiya_malidiya_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_malidiya_malidiya"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_malidiya_malidiya"
			},
		}
	},

	-------------------------------------------------------------
	-- SEA PEOPLES - Places of Prominence - DISABLED but not remvoed 
	-------------------------------------------------------------

	--[[
	{
		uid 				= "sea_peoples_prominence_egypt_abydos",
		vp_reward 			= 2,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_abydos_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_abydos_desc",
		disable_progress_bar = true, 		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_abydos_abydos"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_abydos_abydos",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_prominence_egypt_buhen",
		vp_reward 			= 2,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_buhen_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_buhen_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_buhen_buhen"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_buhen_buhen",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_prominence_egypt_heliopolis",
		vp_reward 			= 2,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_heliopolis_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_heliopolis_desc",		
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_heliopolis_heliopolis"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_heliopolis_heliopolis",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_prominence_egypt_hermopolis",
		vp_reward 			= 2,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_hermopolis_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_hermopolis_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_hermopolis_hermopolis"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_hermopolis_hermopolis",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_prominence_egypt_kawa",
		vp_reward 			= 2,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_kawa_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_kawa_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kawa_kawa"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_kawa_kawa",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_prominence_egypt_kom_ombo",
		vp_reward 			= 2,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_kom_ombo_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_kom_ombo_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kom_ombo_kom_ombo"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_kom_ombo_kom_ombo",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_prominence_egypt_memphis",
		vp_reward 			= 2,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_memphis_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_memphis_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_memphis_memphis"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_memphis_memphis",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_prominence_egypt_miam",
		vp_reward 			= 2,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_miam_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_miam_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_north_nubia_miam"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_north_nubia_miam",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_prominence_egypt_thebes",
		vp_reward 			= 2,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_thebes_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_thebes_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_thebes_thebes"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_thebes_thebes",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_prominence_canaan_ashkelon",
		vp_reward 			= 3,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_canaan_ashkelon_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_canaan_ashkelon_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_ashkelon_ashkelon"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_ashkelon_ashkelon",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_prominence_canaan_byblos",
		vp_reward 			= 3,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_canaan_byblos_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_canaan_byblos_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_tyre_byblos"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_tyre_byblos",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_prominence_canaan_carchemish",
		vp_reward 			= 3,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_canaan_carchemish_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_canaan_carchemish_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_carchemish_carchemish"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_carchemish_carchemish",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_prominence_canaan_damascus",
		vp_reward 			= 3,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_canaan_damascus_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_canaan_damascus_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_damascus_damascus"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_damascus_damascus",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_prominence_canaan_emar",
		vp_reward 			= 3,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_canaan_emar_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_canaan_emar_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_emar_emar"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_emar_emar",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_prominence_canaan_ugarit",
		vp_reward 			= 3,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_canaan_ugarit_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_canaan_ugarit_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_ugarit_ugarit"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_ugarit_ugarit",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_prominence_hatti_gordion",
		vp_reward 			= 4,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_hatti_gordion_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_hatti_gordion_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_west_hatti_gordion"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_west_hatti_gordion",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_prominence_hatti_hattussa",
		vp_reward 			= 4,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_hatti_hattussa_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_hatti_hattussa_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_hattussa_hattussa"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_hattussa_hattussa",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_prominence_hatti_tarhuntassa",
		vp_reward 			= 4,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_hatti_tarhuntassa_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_hatti_tarhuntassa_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_south_hatti_tarhuntassa"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_south_hatti_tarhuntassa",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_prominence_malidiya_malidiya",
		vp_reward 			= 4,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,		
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_malidiya_malidiya_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_malidiya_malidiya_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_malidiya_malidiya"
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_malidiya_malidiya",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	--]]

	-------------------------------------------------------------
	-- SEA PEOPLES - Raze Sacred Lands - Egypt
	-------------------------------------------------------------

	{
		uid                 = "sea_peoples_raze_lands_kerma",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_kerma_kerma",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_kerma_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kerma_kerma"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_kerma_kerma"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_mu_sh",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_kerma_mu_sh",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_mu_sh_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kerma_mu_sh"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_kerma_mu_sh"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_nu_abu",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_kerma_nu_abu",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_nu_abu_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kerma_nu_abu"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_kerma_nu_abu"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_uab_khu",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_kerma_uab_khu",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_uab_khu_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kerma_uab_khu"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_kerma_uab_khu"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_hap_sh",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,
		title_key           = "regions_onscreen_phar_main_per_ramesses_meri_amon_hap_sh",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_hap_sh_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_per_ramesses_meri_amon_hap_sh"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_per_ramesses_meri_amon_hap_sh"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_khet_pa",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,
		title_key           = "regions_onscreen_phar_main_per_ramesses_meri_amon_khet_pa",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_kjhet_pa_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_per_ramesses_meri_amon_khet_pa"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_per_ramesses_meri_amon_khet_pa"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_meri_amon",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_per_ramesses_meri_amon_per_ramesses_meri_amon",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_meri_amon_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_per_ramesses_meri_amon_per_ramesses_meri_amon"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_per_ramesses_meri_amon_per_ramesses_meri_amon"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_buhen",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_buhen_buhen",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_buhen_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_buhen_buhen"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_buhen_buhen"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_hap_au",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_buhen_hap_au",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_hap_au_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_buhen_hap_au"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_buhen_hap_au"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_her_hetem",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_buhen_her_hetem",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_her_hetem_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_buhen_her_hetem"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_buhen_her_hetem"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_shesp_ma",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_buhen_shesp_ma",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_shesp_ma_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_buhen_shesp_ma"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_buhen_shesp_ma"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_miam",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_north_nubia_miam",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_miam_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_north_nubia_miam"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_north_nubia_miam"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_mu_ua",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_north_nubia_mu_ua",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_mu_ua_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_north_nubia_mu_ua"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_north_nubia_mu_ua"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_res_pa",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_north_nubia_res_pa",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_res_pa_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_north_nubia_res_pa"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_north_nubia_res_pa"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_kurkur",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_kurkur_oasis_kurkur_oasis",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_kurkur_oasis_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kurkur_oasis_kurkur_oasis"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_kurkur_oasis_kurkur_oasis"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_sen_hetem",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_kurkur_oasis_sen_hetem",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_sen_hetem_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kurkur_oasis_sen_hetem"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_kurkur_oasis_sen_hetem"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_tcheba_ua",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_kurkur_oasis_tcheba_ua",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_tcheba_ua_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kurkur_oasis_tcheba_ua"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_kurkur_oasis_tcheba_ua"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_elephantine",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_elephantine_elephantine",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_elephantine_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_elephantine_elephantine"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_elephantine_elephantine"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_hierakonpolis",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_elephantine_hierakonpolis",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_hierakonpolis_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_elephantine_hierakonpolis"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_elephantine_hierakonpolis"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_mes",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_elephantine_mes",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_mes_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_elephantine_mes"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_elephantine_mes"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_tep_hetem",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_elephantine_tep_hetem",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_tep_hetem_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_elephantine_tep_hetem"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_elephantine_tep_hetem"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_kha_sba",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_kom_ombo_kha_sba",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_kha_sba_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kom_ombo_kha_sba"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_kom_ombo_kha_sba"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_kom_ombo",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_kom_ombo_kom_ombo",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_kom_ombo_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kom_ombo_kom_ombo"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_kom_ombo_kom_ombo"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_tchu_ua",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_kom_ombo_tchu_ua",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_tchu_ua_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kom_ombo_tchu_ua"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_kom_ombo_tchu_ua"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_kha_ti",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_thebes_kha_ti",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_kha_ti_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_thebes_kha_ti"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_thebes_kha_ti"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_sma_ua",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_thebes_sma_ua",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_sma_ua_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_thebes_sma_ua"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_thebes_sma_ua"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_thebes",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_thebes_thebes",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_thebes_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_thebes_thebes"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_thebes_thebes"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_aakh_ner",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_abydos_aakh_ner",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_aakh_ner_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_abydos_aakh_ner"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_abydos_aakh_ner"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_abydos",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_abydos_abydos",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_abydos_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_abydos_abydos"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_abydos_abydos"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_tin",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_abydos_tin",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_tin_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_abydos_tin"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_abydos_tin"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_kharga",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_kharga_oasis_kharga_oasis",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_kharga_oasis_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kharga_oasis_kharga_oasis"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_kharga_oasis_kharga_oasis"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_shesp_net",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_kharga_oasis_shesp_net",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_shesp_net_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kharga_oasis_shesp_net"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_kharga_oasis_shesp_net"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_tebh",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_kharga_oasis_tebh",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_tebh_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kharga_oasis_tebh"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_kharga_oasis_tebh"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_akhim",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_akhmim_akhmim",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_akhmim_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_akhmim_akhmim"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_akhmim_akhmim"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_mefka_qes",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_akhmim_mefka_qes",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_mefka_qes_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_akhmim_mefka_qes"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_akhmim_mefka_qes"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_ur_men",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_akhmim_ur_men",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_ur_men_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_akhmim_ur_men"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_akhmim_ur_men"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_asyut",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_asyut_asyut",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_asyut_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_asyut_asyut"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_asyut_asyut"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_kep_un",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_asyut_kep_un",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_kep_un_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_asyut_kep_un"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_asyut_kep_un"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_tem_khus",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_asyut_tem_khus",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_khus_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_asyut_tem_khus"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_asyut_tem_khus"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_amarna",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_amarna_amarna",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_amarna_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_amarna_amarna"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_amarna_amarna"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_hermopolis",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_hermopolis_hermopolis",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_hermopolis_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_hermopolis_hermopolis"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_hermopolis_hermopolis"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_ti_ar",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_hermopolis_ti_ar",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_ti_ar_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_hermopolis_ti_ar"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_hermopolis_ti_ar"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_hardai",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_hardai_hardai",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_hardai_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_hardai_hardai"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_hardai_hardai"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_tep_aha",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_hardai_tep_aha",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_tep_aha_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_hardai_tep_aha"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_hardai_tep_aha"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_ur_gem",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_hardai_ur_gem",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_ur_gem_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_hardai_ur_gem"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_hardai_ur_gem"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_herakleopolis",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_herakleopolis_herakleopolis",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_herakleopolis_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_herakleopolis_herakleopolis"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_herakleopolis_herakleopolis"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_sheps_khu",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_herakleopolis_sheps_khu",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_sheps_khu_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_herakleopolis_sheps_khu"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_herakleopolis_sheps_khu"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_dahsur",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_faiyum_dahshur",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_dahshur_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_faiyum_dahshur"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_faiyum_dahshur"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_faiyum",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_faiyum_faiyum",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_faiyum_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_faiyum_faiyum"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_faiyum_faiyum"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_khem",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_faiyum_khem",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_khem_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_faiyum_khem"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_faiyum_khem"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_helwan",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_memphis_helwan",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_helwan_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_memphis_helwan"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_memphis_helwan"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_memphis",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_memphis_memphis",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_memphis_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_memphis_memphis"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_memphis_memphis"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_petpeh",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_memphis_petpeh",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_petpeh_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_memphis_petpeh"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_memphis_petpeh"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_heliopolis",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_heliopolis_heliopolis",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_heliopolis_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_heliopolis_heliopolis"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_heliopolis_heliopolis"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_qes",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_heliopolis_qes",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_qes_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_heliopolis_qes"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_heliopolis_qes"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_per_amun",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_pi_ramesses_per_amun",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_per_amun_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_pi_ramesses_per_amun"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_pi_ramesses_per_amun"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_pi_ramesses",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_pi_ramesses_pi_ramesses",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_pi_ramesses_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_pi_ramesses_pi_ramesses"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_pi_ramesses_pi_ramesses"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_tjaru",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_pi_ramesses_tjaru",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_tjaru_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_pi_ramesses_tjaru"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_pi_ramesses_tjaru"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_buto",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_buto_buto",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_buto_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_buto_buto"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_buto_buto"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_paiuenamun",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_buto_paiuenamun",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_paiuenamun_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_buto_paiuenamun"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_buto_paiuenamun"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_sais",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_buto_sais",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_sais_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_buto_sais"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_buto_sais"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_khan_aha",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_rhacotis_khan_aha",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_khan_aha_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_rhacotis_khan_aha"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_rhacotis_khan_aha"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_qema",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_rhacotis_qema",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_qema_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_rhacotis_qema"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_rhacotis_qema"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_rhacotis",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_rhacotis_rhacotis",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_rhacotis_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_rhacotis_rhacotis"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_rhacotis_rhacotis"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_azzati",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_north_sinai_azzati",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_azzati_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_north_sinai_azzati"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_north_sinai_azzati"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_neb_gehes",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_north_sinai_neb_gehes",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_neb_gehes_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_north_sinai_neb_gehes"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_north_sinai_neb_gehes"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_nekhel",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_north_sinai_nekhel",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_nekhel_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_north_sinai_nekhel"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_north_sinai_nekhel"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_sukkot",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_egypt,        
		title_key           = "regions_onscreen_phar_main_north_sinai_sukkot",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_sukkot_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_north_sinai_sukkot"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_north_sinai_sukkot"
			},
		}
	},

	-------------------------------------------------------------
	-- SEA PEOPLES - Raze Sacred Lands - Hittite
	-------------------------------------------------------------

	{
		uid                 = "sea_peoples_raze_lands_amaseia",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_zippalanda_amaseia",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_amaseia_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_zippalanda_amaseia"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_zippalanda_amaseia"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_nerik",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_zippalanda_nerik",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_nerik_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_zippalanda_nerik"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_zippalanda_nerik"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_sapinuwa",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_zippalanda_sapinuwa",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_sapinuwa_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_zippalanda_sapinuwa"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_zippalanda_sapinuwa"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_zippalanda",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_zippalanda_zippalanda",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_zippalanda_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_zippalanda_zippalanda"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_zippalanda_zippalanda"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_ankuwa",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_hattussa_ankuwa",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_ankuwa_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_hattussa_ankuwa"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_hattussa_ankuwa"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_arinna",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_hattussa_arinna",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_arinna_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_hattussa_arinna"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_hattussa_arinna"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_corniaspa",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_hattussa_corniaspa",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_corniaspa_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_hattussa_corniaspa"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_hattussa_corniaspa"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_hattussa",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_hattussa_hattussa",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_hattussa_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_hattussa_hattussa"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_hattussa_hattussa"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_ancyra",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_ancyra_ancyra",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_ancyra_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_ancyra_ancyra"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_ancyra_ancyra"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_aspona",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_ancyra_aspona",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_aspona_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_ancyra_aspona"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_ancyra_aspona"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_lagania",

		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_ancyra_lagania",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_lagania_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_ancyra_lagania"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_ancyra_lagania"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_mokissos",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_purushanda_mokissos",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_mokissos_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_purushanda_mokissos"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_purushanda_mokissos"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_nyssa",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_purushanda_nyssa",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_nyssa_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_purushanda_nyssa"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_purushanda_nyssa"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_purushanda",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_purushanda_purushanda",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_purushanda_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_purushanda_purushanda"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_purushanda_purushanda"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_koropissos",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_central_hatti_koropissos",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_koropissos_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_central_hatti_koropissos"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_central_hatti_koropissos"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_larawanda",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_central_hatti_larawanda",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_larawanda_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_central_hatti_larawanda"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_central_hatti_larawanda"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_pegella",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_central_hatti_pegella",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_pegella_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_central_hatti_pegella"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_central_hatti_pegella"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_cibyra",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_south_hatti_cibyra",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_cibyra_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_south_hatti_cibyra"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_south_hatti_cibyra"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_lystra",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_south_hatti_lystra",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_lystra_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_south_hatti_lystra"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_south_hatti_lystra"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_tarhuntassa",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_south_hatti_tarhuntassa",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_tarhuntassa_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_south_hatti_tarhuntassa"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_south_hatti_tarhuntassa"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_cybistra",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_tuwana_cybistra",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_cybistra_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_tuwana_cybistra"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_tuwana_cybistra"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_hubishna",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_tuwana_hubishna",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_hubishna_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_tuwana_hubishna"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_tuwana_hubishna"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_kelenderis",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_tuwana_kelenderis",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_kelenderis_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_tuwana_kelenderis"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_tuwana_kelenderis"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_tuwana",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_tuwana_tuwana",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_tuwana_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_tuwana_tuwana"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_tuwana_tuwana"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_adana",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_tarsus_adana",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_adana_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_tarsus_adana"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_tarsus_adana"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_kyinda",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_tarsus_kyinda",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_kyinda_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_tarsus_kyinda"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_tarsus_kyinda"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_tarsus",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_tarsus_tarsus",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_tarsus_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_tarsus_tarsus"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_tarsus_tarsus"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_kanesh",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_kanesh_kanesh",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_kanesh_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kanesh_kanesh"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_kanesh_kanesh"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_kummanni",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_kanesh_kummanni",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_kummanni_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kanesh_kummanni"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_kanesh_kummanni"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_saricha",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_kanesh_saricha",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_saricha_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kanesh_saricha"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_kanesh_saricha"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_malidiya",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_malidiya_malidiya",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_malidiya_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_malidiya_malidiya"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_malidiya_malidiya"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_samuha",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_malidiya_samuha",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_samuha_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_malidiya_samuha"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_malidiya_samuha"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_tagarama",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_malidiya_tegarama",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_tegarama_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_malidiya_tegarama"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_malidiya_tegarama"
			},
		}
	},
	{
		uid                 = "sea_peoples_raze_lands_zara",
		vp_reward           = 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_raze_sacred_lands_hati,        
		title_key           = "regions_onscreen_phar_main_malidiya_zara",
		description_key     = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_raze_sacred_lands_zara_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_malidiya_zara"
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_main_malidiya_zara"
			},
		}
	},

	-------------------------------------------------------------
	-- FEATS - Feature-related Victory Objectives - Culture Restricted
	-------------------------------------------------------------

	{
		uid 				= "common_survive_sea_people_invasion",
		vp_reward 			= 10,
		restricted_to_cultures = victory_objectives_cultures_all_excluding_sea_peoples, -- Added culture limit ignoring sea people factions
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_survive_sea_people_invasion_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_survive_sea_people_invasion_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "sea_people_invasion_started",
			}
		},
		completion_conditions = {
			{
				type = "reach_campaign_turn",
				turn = 140,
				ui = {
					custom_description = "campaign_localised_strings_string_phar_main_victory_objectives_common_survive_sea_people_invasion_description"
				}
			}
		}
	},
	{
		uid 				= "maintain_10000_gold",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_all_excluding_sea_peoples, -- Added culture limit ignoring sea people factions
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_maintain_10000_gold_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_maintain_10000_gold_desc",		
		disable_bullet_points = true,
		activation_conditions = {
			{
				type = "have_pooled_resource_amount",
				allowed_pooled_resources = {"troy_gold"},
				amount = 5000
			}
		},
		completion_conditions = {
			{
				type = "have_pooled_resource_amount",
				allowed_pooled_resources = {"troy_gold"},
				amount = 10000
			}
		}
	},
	
	-------------------------------------------------------------
	-- FEATS - Looting and Razing Objectives - Sea Peoples Only
	-------------------------------------------------------------

	{
		uid 				= "maintain_gold_p1",
		vp_reward 			= 1,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_have_resources_gold_phase_1_title",
		description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_have_resources_gold_phase_1_desc",		
		disable_bullet_points = true,
		activation_conditions = {
			{
				type = "have_pooled_resource_amount",
				allowed_pooled_resources = {"troy_gold"},
				amount = 1000
			}
		},
		completion_conditions = {
			{
				type = "have_pooled_resource_amount",
				allowed_pooled_resources = {"troy_gold"},
				amount = 5000
			}
		}
	},
	{
		uid 				= "maintain_gold_p2",
		vp_reward 			= 2,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_have_resources_gold_phase_2_title",
		description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_have_resources_gold_phase_2_desc",
		disable_bullet_points = true,
		activation_conditions = {
			{
				type = "have_pooled_resource_amount",
				allowed_pooled_resources = {"troy_gold"},
				amount = 5000
			}
		},
		completion_conditions = {
			{
				type = "have_pooled_resource_amount",
				allowed_pooled_resources = {"troy_gold"},
				amount = 10000
			}
		}
	},
	{
		uid 				= "maintain_gold_p3",
		vp_reward 			= 4,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_have_resources_gold_phase_3_title",
		description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_have_resources_gold_phase_3_desc",
		disable_bullet_points = true,
		activation_conditions = {
			{
				type = "have_pooled_resource_amount",
				allowed_pooled_resources = {"troy_gold"},
				amount = 10000
			}
		},
		completion_conditions = {
			{
				type = "have_pooled_resource_amount",
				allowed_pooled_resources = {"troy_gold"},
				amount = 20000
			}
		}
	},
	{
		uid 				= "raze_enemy_settlements",
		vp_reward 			= 6,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_common_raze_enemy_settlements_title",
		description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_common_raze_enemy_settlements_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "raze_n_regions",
				amount = 10
			}
		},
		completion_conditions = {
			{
				type = "raze_n_regions",
				amount = 50
			}
		}
	},
	{
		uid 				= "loot_250000_any_resource",
		vp_reward 			= 4,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_loot_250000_resource_title",
		description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_loot_250000_resource_desc",
		activation_conditions = {
			{
				type = "loot_resources_from_settlements",
				allowed_pooled_resources = {"troy_food", "troy_wood", "troy_stones", "troy_bronze", "troy_gold"},
				amount = 20000
			}
		},
		completion_conditions = {
			{
				type = "loot_resources_from_settlements",
				allowed_pooled_resources = {"troy_food", "troy_wood", "troy_stones", "troy_bronze", "troy_gold"},
				amount = 250000
			}
		}
	},
	
	-------------------------------------------------------------
	-- FEATS - Have Resource, all other factions
	-------------------------------------------------------------
	
	{
		uid 				= "have_50000_any_resource",
		vp_reward 			= 4,
		restricted_to_cultures = victory_objectives_cultures_all_excluding_sea_peoples, -- Added culture limit ignoring sea people factions
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_have_50000_resource_title",
		description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_have_50000_resource_desc",
		activation_conditions = {
			{
				type = "have_pooled_resource_amount",
				allowed_pooled_resources = {"troy_food", "troy_wood", "troy_stones", "troy_bronze", "troy_gold"},
				sum_resources = true,
				amount = 20000
			}
		},
		completion_conditions = {
			{
				type = "have_pooled_resource_amount",
				allowed_pooled_resources = {"troy_food", "troy_wood", "troy_stones", "troy_bronze", "troy_gold"},
				sum_resources = true,
				amount = 100000
			}
		}
	},

	-------------------------------------------------------------
	-- Feature-related Victory Objectives - Feats - Non-restricted
	-------------------------------------------------------------

	{
		uid 				= "maintain_200_egyptian_legitimacy",
		vp_reward 			= 10,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_maintain_200_egyptian_legitimacy_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_maintain_200_egyptian_legitimacy_desc",		
		disable_bullet_points = true,
		activation_conditions = {
			{
				type = "have_pooled_resource_amount",
				allowed_pooled_resources = {"phar_legitimacy"},
				amount = 100
			},
			{
				type = "choose_legitimacy_path",
				legitimacy_path = "legitimacy"
			},
		},
		completion_conditions = {
			{
				type = "have_pooled_resource_amount",
				allowed_pooled_resources = {"phar_legitimacy"},
				amount = 320
			}
		}
	},

	{
		uid 				= "maintain_200_hittite_legitimacy",
		vp_reward 			= 10,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_maintain_200_hittite_legitimacy_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_maintain_200_hittite_legitimacy_desc",		
		disable_bullet_points = true,
		activation_conditions = {
			{
				type = "have_pooled_resource_amount",
				allowed_pooled_resources = {"phar_hatti_legitimacy"},
				amount = 100
			},
			{
				type = "choose_legitimacy_path",
				legitimacy_path = "hatti_legitimacy"
			},
		},
		completion_conditions = {
			{
				type = "have_pooled_resource_amount",
				allowed_pooled_resources = {"phar_hatti_legitimacy"},
				amount = 320
			}
		}
	},

	-------------------------------------------------------------
	-- FEATS - Sea Peoples - Have Resources Objectives - Pushed for ordering reasons
	-------------------------------------------------------------

	{
		uid 				= "have_stone_wood_resource_p1",
		vp_reward 			= 2,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_have_resources_wood_stone_phase_1_title",
		description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_have_resources_wood_stone_phase_1_desc",
		activation_conditions = {
			{
				type = "have_pooled_resource_amount",
				allowed_pooled_resources = {"troy_wood", "troy_stones"},
				sum_resources = true,
				amount = 10000
			}
		},
		completion_conditions = {
			{
				type = "have_pooled_resource_amount",
				allowed_pooled_resources = {"troy_wood", "troy_stones"},
				sum_resources = true,
				amount = 25000
			}
		}
	},
	{
		uid 				= "have_stone_wood_resource_p2",
		vp_reward 			= 4,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_have_resources_wood_stone_phase_2_title",
		description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_have_resources_wood_stone_phase_2_desc",
		activation_conditions = {
			{
				type = "have_pooled_resource_amount",
				allowed_pooled_resources = {"troy_wood", "troy_stones"},
				sum_resources = true,
				amount = 25000
			}
		},
		completion_conditions = {
			{
				type = "have_pooled_resource_amount",
				allowed_pooled_resources = {"troy_wood", "troy_stones"},
				sum_resources = true,
				amount = 100000
			}
		}
	},
	{
		uid 				= "have_stone_wood_resource_p3",
		vp_reward 			= 6,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_have_resources_wood_stone_phase_3_title",
		description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_have_resources_wood_stone_phase_3_desc",
		activation_conditions = {
			{
				type = "have_pooled_resource_amount",
				allowed_pooled_resources = {"troy_wood", "troy_stones"},
				sum_resources = true,
				amount = 100000
			}
		},
		completion_conditions = {
			{
				type = "have_pooled_resource_amount",
				allowed_pooled_resources = {"troy_wood", "troy_stones"},
				sum_resources = true,
				amount = 200000
			}
		}
	},

	-------------------------------------------------------------
	-- Special conquest VCs, common to all factions			
	-- "Special": design-wise, this is not part of the base 100 points required for conquest, but an extra
	-------------------------------------------------------------

	{
		uid 				= "common_special_conquest_prominence_egypt_amarna",
		vp_reward 			= 3,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_special_conquest_prominence_egypt_amarna_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_special_conquest_prominence_egypt_amarna_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				
				type = "unlock_ancient_legacy",
				ancient_legacy_name = "phar_ancient_legacy_akhenaten"
				
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_amarna_amarna"
			},
		}
	},

	{
		uid 				= "common_have_tudhaliya_princes",
		vp_reward 			= 3,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_have_tudhaliya_princes_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_have_tudhaliya_princes_desc",		
		disable_bullet_points = true,
		activation_conditions = {
			{
				type = "unlock_ancient_legacy",
				ancient_legacy_name = "phar_ancient_legacy_tudhaliya"
			}
		},
		completion_conditions = {
			{
				type = "have_tudhaliya_princes",
				amount = 5
			}
		}
	},

	{
		uid 				= "common_have_maxed_out_gods",
		vp_reward 			= 3,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_have_maxed_out_gods_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_have_maxed_out_gods_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "have_max_favour_with_gods",
				gods_amount = 2,
			}
		},
		completion_conditions = {
			{
				type = "have_max_favour_with_gods",
				gods_amount = 3,
				ui = {
					custom_description = "campaign_localised_strings_string_phar_main_victory_objectives_common_have_maxed_out_gods_description"
				}
			}
		}
	},

	{
		uid 				= "common_have_maxed_out_gods_different_pantheons",
		vp_reward 			= 3,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_have_maxed_out_gods_different_pantheons_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_have_maxed_out_gods_different_pantheons_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "have_max_favour_with_gods",
				gods_amount = 3,
				unique_cultures_amount = 3
			}
		},
		completion_conditions = {
			{
				type = "have_max_favour_with_gods",
				gods_amount = 3,
				unique_cultures_amount = 3,
				ui = {
					custom_description = "campaign_localised_strings_string_phar_main_victory_objectives_common_have_maxed_out_gods_different_pantheons_condition_1_description"
				}
			}
		}
	},

	{
		uid 				= "common_have_favour_with_god",
		vp_reward 			= 3,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_have_favour_with_god_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_have_favour_with_god_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "have_favour_amount_with_any_god",
				amount = 601					--- Keep this at 601 min to exclude SEA Gods, which have a max of 600, so SEA gods can't activate this
			}
		},
		completion_conditions = {
			{
				type = "have_favour_amount_with_any_god",
				amount = 800,
				ui = {
					custom_description = "campaign_localised_strings_string_phar_main_victory_objectives_common_have_favour_with_god_description"
				}

			}
		}
	},

	-------------------------------------------------------------
	-- Faction-based Victory Objectives are CANCELLED
	-------------------------------------------------------------

	-- {
	-- 	uid 				= "suppiluliuma_build_landmark_and_military",
	-- 	vp_reward 			= 3,
	-- 	restricted_to_factions = { "phar_main_suppiluliuma" },
	-- 	category			= victory_objectives_ui_categories.victory_objectives_category_feats,
	-- 	title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_suppiluliuma_build_landmark_and_military_title",
	-- 	description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_suppiluliuma_build_landmark_and_military_desc",		
	-- 	activation_conditions = {
	-- 	},
	-- 	completion_conditions = {
	-- 		{
	-- 			type = "have_amount_of_max_level_of_building_chain",
	-- 			building_chain_keys = { "phar_main_all_landmark_happiness_hattusa" },
	-- 			check_max_level = true,
	-- 			amount = 1
	-- 		},
	-- 		{
	-- 			type = "have_amount_of_max_level_of_building_chain",
	-- 			building_chain_keys = { "phar_main_suppi_military_administration_garrison_type_a" },
	-- 			check_max_level = true,
	-- 			amount = 1
	-- 		}
	-- 	}
	-- },

	-- Faction-based Victory Objectives are cancelled
	-- {
	-- 	uid 				= "seti_build_province_management",
	-- 	vp_reward 			= 3,
	-- 	restricted_to_factions = { "phar_main_seti" },
	-- 	category			= victory_objectives_ui_categories.victory_objectives_category_feats,
	-- 	title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_seti_build_province_management_title",
	-- 	description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_seti_build_province_management_desc",		
	-- 	activation_conditions = {
	-- 	},
	-- 	completion_conditions = {
	-- 		{
	-- 			type = "have_amount_of_max_level_of_building_chain",
	-- 			building_chain_keys = { "phar_main_seti_province_management_main_building_legitimacy_influence_boost" },
	-- 			check_max_level = true,
	-- 			amount = 1
	-- 		}
	-- 	}
	-- },

	-- Faction-based Victory Objectives are cancelled
	-- {
	-- 	uid 				= "amenmesse_build_province_management",
	-- 	vp_reward 			= 3,
	-- 	restricted_to_factions = { "phar_main_amenmesse" },
	-- 	category			= victory_objectives_ui_categories.victory_objectives_category_feats,
	-- 	title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_amenmesse_build_province_management_title",
	-- 	description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_amenmesse_build_province_management_desc",		
	-- 	activation_conditions = {
	-- 	},
	-- 	completion_conditions = {
	-- 		{
	-- 			type = "have_amount_of_max_level_of_building_chain",
	-- 			building_chain_keys = { "phar_main_amenmesse_province_management_main_building_production_boost_growth" },
	-- 			check_max_level = true,
	-- 			amount = 1
	-- 		}
	-- 	}
	-- },

	-- Faction-based Victory Objectives are cancelled
	-- {
	-- 	uid 				= "kurunta_build_military_administration",
	-- 	vp_reward 			= 3,
	-- 	restricted_to_factions = { "phar_main_kurunta" },
	-- 	category			= victory_objectives_ui_categories.victory_objectives_category_feats,
	-- 	title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_kurunta_build_military_administration_title",
	-- 	description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_kurunta_build_military_administration_desc",		
	-- 	activation_conditions = {
	-- 	},
	-- 	completion_conditions = {
	-- 		{
	-- 			type = "have_amount_of_max_level_of_building_chain",
	-- 			building_chain_keys = { "phar_main_kuru_military_administration_unit_training_type_a" },
	-- 			check_max_level = true,
	-- 			amount = 1
	-- 		}
	-- 	}
	-- },

	-- Faction-based Victory Objectives are cancelled
	-- {
	-- 	uid 				= "bay_build_province_management_and_landmark",
	-- 	vp_reward 			= 3,
	-- 	restricted_to_factions = { "phar_main_bay" },
	-- 	category			= victory_objectives_ui_categories.victory_objectives_category_feats,
	-- 	title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_bay_build_province_management_and_landmark_title",
	-- 	description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_bay_build_province_management_and_landmark_desc",		
	-- 	activation_conditions = {
	-- 	},
	-- 	completion_conditions = {
	-- 		{
	-- 			type = "have_amount_of_max_level_of_building_chain",
	-- 			building_chain_keys = { "phar_main_bay_province_management_main_building_diplomatic_relations" },
	-- 			check_max_level = true,
	-- 			amount = 1
	-- 		},
	-- 		{
	-- 			type = "have_amount_of_max_level_of_building_chain",
	-- 			building_chain_keys = { "phar_main_all_landmark_legitimacy_influence_megiddo" },
	-- 			check_max_level = true,
	-- 			amount = 1
	-- 		}
	-- 	}
	-- },

	-- Faction-based Victory Objectives are cancelled
	-- {
	-- 	uid 				= "irsu_build_province_management",
	-- 	vp_reward 			= 3,
	-- 	restricted_to_factions = { "phar_main_irsu" },
	-- 	category			= victory_objectives_ui_categories.victory_objectives_category_feats,
	-- 	title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_irsu_build_province_management_title",
	-- 	description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_irsu_build_province_management_desc",		
	-- 	activation_conditions = {
	-- 	},
	-- 	completion_conditions = {
	-- 		{
	-- 			type = "have_amount_of_max_level_of_building_chain",
	-- 			building_chain_keys = { "phar_main_irsu_province_management_main_building_loot_boost" },
	-- 			check_max_level = true,
	-- 			amount = 1
	-- 		}
	-- 	}
	-- },

	-- Faction-based Victory Objectives are cancelled
	-- {
	-- 	uid 				= "ramesses_build_landmarkand_military_administration",
	-- 	vp_reward 			= 3,
	-- 	restricted_to_factions = { "phar_main_ramesses" },
	-- 	category			= victory_objectives_ui_categories.victory_objectives_category_feats,
	-- 	title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_ramesses_build_landmarkand_military_administration_title",
	-- 	description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_ramesses_build_landmarkand_military_administration_desc",		
	-- 	activation_conditions = {
	-- 	},
	-- 	completion_conditions = {
	-- 		{
	-- 			type = "have_amount_of_max_level_of_building_chain",
	-- 			building_chain_keys = { "phar_main_all_landmark_hero_training_memphis" },
	-- 			check_max_level = true,
	-- 			amount = 1
	-- 		},
	-- 		{
	-- 			type = "have_amount_of_max_level_of_building_chain",
	-- 			building_chain_keys = { "phar_main_ram_military_administration_hero_training" },
	-- 			check_max_level = true,
	-- 			amount = 1
	-- 		}
	-- 	}
	-- },

	{
		uid 				= "have_egyptian_mounemnt_buildings",
		vp_reward 			= 3,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_have_egyptian_mounemnt_buildings_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_have_egyptian_mounemnt_buildings_desc",		
		disable_bullet_points = true,
		activation_conditions = {
			{
				type = "have_amount_of_max_level_of_building_chain",
				building_chain_keys = { "phar_main_ers_monument_egyp" },
				check_max_level = true,
				amount = 30
			}
		},
		completion_conditions = {
			{
				type = "have_amount_of_max_level_of_building_chain",
				building_chain_keys = { "phar_main_ers_monument_egyp" },
				check_max_level = true,
				amount = 40
			}
		}
	},

	{
		uid 				= "have_hatti_mounemnt_buildings",
		vp_reward 			= 3,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_have_hatti_mounemnt_buildings_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_have_hatti_mounemnt_buildings_desc",		
		disable_bullet_points = true,
		activation_conditions = {
			{
				type = "have_amount_of_max_level_of_building_chain",
				building_chain_keys = { "phar_main_ers_monument_hitt" },
				check_max_level = true,
				amount = 12
			}
		},
		completion_conditions = {
			{
				type = "have_amount_of_max_level_of_building_chain",
				building_chain_keys = { "phar_main_ers_monument_hitt" },
				check_max_level = true,
				amount = 20
			}
		}
	},

	{
		uid 				= "common_maintain_hatti_legitimacy_through_battle",
		vp_reward 			= 3,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_maintain_hatti_legitimacy_through_battle_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_maintain_hatti_legitimacy_through_battle_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "have_pooled_resource_amount",
				allowed_pooled_resources = {"phar_hatti_legitimacy"},
				factor_key = "phar_hatti_legitimacy_battle",
				amount = 10
			}
		},
		completion_conditions = {
			{
				type = "have_pooled_resource_amount",
				allowed_pooled_resources = {"phar_hatti_legitimacy"},
				factor_key = "phar_hatti_legitimacy_battle",
				amount = 10,
				ui = {
					custom_description = "campaign_localised_strings_string_phar_main_victory_objectives_common_maintain_hatti_legitimacy_through_battle_description"
				}
			}
		}
	},
	{
		uid 				= "common_become_pharaoh",
		vp_reward 			= 10,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_become_pharaoh_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_become_pharaoh_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "choose_legitimacy_path",
				legitimacy_path = "legitimacy"
			}
		},
		completion_conditions = {
			{
				type = "maintain_be_ruler",
				legitimacy_path = "legitimacy",
				ui = {
					custom_description = "campaign_localised_strings_string_phar_main_victory_objectives_common_become_pharaoh_objective"
				}
			}
		}
	},
	{
		uid 				= "common_become_great_king",
		vp_reward 			= 10,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_become_high_king_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_become_high_king_desc",		
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "choose_legitimacy_path",
				legitimacy_path = "hatti_legitimacy"
			}
		},
		completion_conditions = {
			{
				type = "maintain_be_ruler",
				legitimacy_path = "hatti_legitimacy",
				ui = {
					custom_description = "campaign_localised_strings_string_phar_main_victory_objectives_common_become_high_king_objective"
				}
			}
		}
	},
	{
		uid 				= "common_spend_eminence",
		vp_reward 			= 10,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_spend_eminence_title",
		description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_spend_eminence_description",
		activation_conditions = {
			{
				type = "spend_pooled_resource_amount",
				pooled_resource_key = "phar_eminence",
				amount = 200
			}
		},
		completion_conditions = {
			{
				type = "spend_pooled_resource_amount",
				pooled_resource_key = "phar_eminence",
				amount = 1000
			}
		}
	},
	{
		uid 				= "common_spend_turns_in_collapse",
		vp_reward 			= 15,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_spend_turns_in_collapse_title",
		description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_spend_turns_in_collapse_description",
		activation_conditions = {
			{
				type = "spend_turns_in_civilization_level",
				civilization_level = "collapse",
				turns = 10,
				in_a_row = false
			}
		},
		completion_conditions = {
			{
				type = "spend_turns_in_civilization_level",
				civilization_level = "collapse",
				turns = 60,
				in_a_row = false,
				ui = {
					custom_description = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_maintain_collapse"
				}
			}
		}
	},
	{
		uid 				= "sea_peoples_spend_turns_in_any_tribe_category",
		vp_reward 			= 5,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_spend_turns_in_any_tribe_category_title",
		description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_spend_turns_in_any_tribe_category_description",
		activation_conditions = {
			{
				type = "spend_turns_in_any_tribe_category",
				turns = 30
			}
		},
		completion_conditions = {
			{
				type = "spend_turns_in_any_tribe_category",
				turns = 80
			}
		}
	},
	{
		uid 				= "sea_peoples_construct_nuraghe_camps_or_peleset_villages",
		vp_reward 			= 20,
		restricted_to_subcultures = victory_objectives_subculters_sea_peoples,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_construct_nuraghe_camps_or_peleset_villages_title",
		description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_construct_nuraghe_camps_or_peleset_villages_description",
		activation_conditions = {
			{
				type = "have_amount_of_max_level_of_building_chain",
				building_chain_keys = { 
					"phar_sea_ers_nomad_peleset_foreign_region",
					"phar_sea_ers_nomad_peleset_own_region",
					"phar_sea_ers_nomad_peleset_razed_region",
					"phar_sea_ers_nomad_sherden_fenkhu_foreign_region",
					"phar_sea_ers_nomad_sherden_fenkhu_own_region",
					"phar_sea_ers_nomad_sherden_fenkhu_razed_region",
					"phar_sea_ers_nomad_sherden_highlands_foreign_region",
					"phar_sea_ers_nomad_sherden_highlands_own_region",
					"phar_sea_ers_nomad_sherden_highlands_razed_region",
					"phar_sea_ers_nomad_sherden_isuwa_foreign_region",
					"phar_sea_ers_nomad_sherden_isuwa_own_region",
					"phar_sea_ers_nomad_sherden_isuwa_razed_region",
					"phar_sea_ers_nomad_sherden_kush_foreign_region",
					"phar_sea_ers_nomad_sherden_kush_own_region",
					"phar_sea_ers_nomad_sherden_kush_razed_region",
					"phar_sea_ers_nomad_sherden_lower_egypt_foreign_region",
					"phar_sea_ers_nomad_sherden_lower_egypt_own_region",
					"phar_sea_ers_nomad_sherden_lower_egypt_razed_region",
					"phar_sea_ers_nomad_sherden_lowlands_foreign_region",
					"phar_sea_ers_nomad_sherden_lowlands_own_region",
					"phar_sea_ers_nomad_sherden_lowlands_razed_region",
					"phar_sea_ers_nomad_sherden_nubia_foreign_region",
					"phar_sea_ers_nomad_sherden_nubia_own_region",
					"phar_sea_ers_nomad_sherden_nubia_razed_region",
					"phar_sea_ers_nomad_sherden_retjennu_foreign_region",
					"phar_sea_ers_nomad_sherden_retjennu_own_region",
					"phar_sea_ers_nomad_sherden_retjennu_razed_region",
					"phar_sea_ers_nomad_sherden_sinai_foreign_region",
					"phar_sea_ers_nomad_sherden_sinai_own_region",
					"phar_sea_ers_nomad_sherden_sinai_razed_region",
					"phar_sea_ers_nomad_sherden_upper_egypt_foreign_region",
					"phar_sea_ers_nomad_sherden_upper_egypt_own_region",
					"phar_sea_ers_nomad_sherden_upper_egypt_razed_region",
					"phar_sea_ers_nomad_sherden_western_desert_foreign_region",
					"phar_sea_ers_nomad_sherden_western_desert_own_region",
					"phar_sea_ers_nomad_sherden_western_desert_razed_region",
					"phar_sea_ers_nomad_sherden_yamhad_foreign_region"
				 },
				check_max_level = false,
				amount = 5
			}
		},
		completion_conditions = {
			{
				type = "have_amount_of_max_level_of_building_chain",
				building_chain_keys = { 
					"phar_sea_ers_nomad_peleset_foreign_region",
					"phar_sea_ers_nomad_peleset_own_region",
					"phar_sea_ers_nomad_peleset_razed_region",
					"phar_sea_ers_nomad_sherden_fenkhu_foreign_region",
					"phar_sea_ers_nomad_sherden_fenkhu_own_region",
					"phar_sea_ers_nomad_sherden_fenkhu_razed_region",
					"phar_sea_ers_nomad_sherden_highlands_foreign_region",
					"phar_sea_ers_nomad_sherden_highlands_own_region",
					"phar_sea_ers_nomad_sherden_highlands_razed_region",
					"phar_sea_ers_nomad_sherden_isuwa_foreign_region",
					"phar_sea_ers_nomad_sherden_isuwa_own_region",
					"phar_sea_ers_nomad_sherden_isuwa_razed_region",
					"phar_sea_ers_nomad_sherden_kush_foreign_region",
					"phar_sea_ers_nomad_sherden_kush_own_region",
					"phar_sea_ers_nomad_sherden_kush_razed_region",
					"phar_sea_ers_nomad_sherden_lower_egypt_foreign_region",
					"phar_sea_ers_nomad_sherden_lower_egypt_own_region",
					"phar_sea_ers_nomad_sherden_lower_egypt_razed_region",
					"phar_sea_ers_nomad_sherden_lowlands_foreign_region",
					"phar_sea_ers_nomad_sherden_lowlands_own_region",
					"phar_sea_ers_nomad_sherden_lowlands_razed_region",
					"phar_sea_ers_nomad_sherden_nubia_foreign_region",
					"phar_sea_ers_nomad_sherden_nubia_own_region",
					"phar_sea_ers_nomad_sherden_nubia_razed_region",
					"phar_sea_ers_nomad_sherden_retjennu_foreign_region",
					"phar_sea_ers_nomad_sherden_retjennu_own_region",
					"phar_sea_ers_nomad_sherden_retjennu_razed_region",
					"phar_sea_ers_nomad_sherden_sinai_foreign_region",
					"phar_sea_ers_nomad_sherden_sinai_own_region",
					"phar_sea_ers_nomad_sherden_sinai_razed_region",
					"phar_sea_ers_nomad_sherden_upper_egypt_foreign_region",
					"phar_sea_ers_nomad_sherden_upper_egypt_own_region",
					"phar_sea_ers_nomad_sherden_upper_egypt_razed_region",
					"phar_sea_ers_nomad_sherden_western_desert_foreign_region",
					"phar_sea_ers_nomad_sherden_western_desert_own_region",
					"phar_sea_ers_nomad_sherden_western_desert_razed_region",
					"phar_sea_ers_nomad_sherden_yamhad_foreign_region"
				 },
				check_max_level = false,
				amount = 20,
				ui = {
					custom_description = "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_construct_nuraghe_camps_or_peleset_villages_bullet"
				}
			}
		}
	},
}

--[[
local my_template = {
	vp_reward 			= 3,
	category			= victory_objectives_ui_categories.victory_objectives_category_feats,
	title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_have_resources_wood_stone_phase_3_title",
	description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_have_resources_wood_stone_phase_3_desc",
	activation_conditions = {
		{
			type = "have_pooled_resource_amount",
			allowed_pooled_resources = {"troy_gold"},
			amount = 500
		}
	},
	completion_conditions = {
		{
			type = "have_pooled_resource_amount",
			allowed_pooled_resources = {"troy_gold"},
			amount = 1000
		}
	}
}
--]]

-- ------------------------------------------------------- TEMPLATE INSTANCES --------------------------------------------------------
-- ___________________________________________________________________________________________________________________________________
-- -----------------------------------------------------------------------------------------------------------------------------------

victory_objectives_template_instances = {
	--[[
		{
			template = my_template,
			uid			= "test_obj_resources_1",
			vp_reward	= 5,
			restricted_to_subcultures = {"phar_main_sbc_hatti_hittites"}
		},
		{
			template = my_template,
			uid			= "test_obj_resources_2",
			vp_reward	= 10,
			restricted_to_subcultures = {"phar_main_sbc_kemet_egyptians"}
		}
	--]]
	
	}