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
			script_key 			= "phar_amenmesse_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	["phar_main_tausret"] = {
		[1] = 
		{	
			script_key 			= "phar_tausret_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	["phar_main_bay"] = {
		[1] = 
		{
			script_key 			= "phar_bay_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	["phar_main_irsu"] = {
		[1] = 
		{	
			script_key 			= "phar_irsu_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	["phar_main_ramesses"] = {
		[1] = 
		{
			script_key 			= "phar_ramesses_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	["phar_main_seti"] = {
		[1] = 
		{
			script_key 			= "phar_seti_point_victory_complete_quest",									-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	["phar_main_suppiluliuma"] = {
		[1] = 
		{
			script_key 			= "phar_suppiluliuma_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	["phar_main_kurunta"] = {
		[1] = 
		{
			script_key 			= "phar_kurunta_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	["phar_sea_sherden"] = {
		[1] = 
		{
			script_key 			= "phar_sherden_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	["phar_sea_peleset"] = {
		[1] = 
		{
			script_key 			= "phar_peleset_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	
	["troy_main_dan_mycenae"] = {
		[1] = 
		{
			script_key 			= "phar_agamemnon_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	["troy_main_trj_troy"] = {
		[1] = 
		{
			script_key 			= "phar_priam_point_victory_complete_quest;",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},

	["phar_map_ninurta"] = {
		[1] = 
		{
			script_key 			= "phar_ninurta_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	
	["phar_map_babylon"] = {
		[1] = 
		{
			script_key 			= "phar_babylon_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	
	["phar_main_ugarit"] = {
		[1] = 
		{
			script_key 			= "phar_ugarit_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	
	["troy_rem_trj_thrace"] = {
		[1] = 
		{
			script_key 			= "phar_trj_thrace_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	
	["troy_main_trj_lycia"] = {
		[1] = 
		{
			script_key 			= "phar_trj_lycia_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	
	["troy_amazons_trj_hippolyta"] = {
		[1] = 
		{
			script_key 			= "phar_trj_hippolyta_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	
	["phar_map_sutu"] = {
		[1] = 
		{
			script_key 			= "phar_sutu_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	
	["phar_main_setnakhte"] = {
		[1] = 
		{
			script_key 			= "phar_setnakhte_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	
	["phar_map_sangarian_phrygians"] = {
		[1] = 
		{
			script_key 			= "phar_sangarian_phrygians_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	
	["phar_main_merneptah"] = {
		[1] = 
		{
			script_key 			= "phar_merneptah_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	
	["phar_main_malidiya"] = {
		[1] = 
		{
			script_key 			= "phar_malidiya_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	
	["phar_map_lullubi"] = {
		[1] = 
		{
			script_key 			= "phar_lullubi_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	
	["phar_map_igihalkid"] = {
		[1] = 
		{
			script_key 			= "phar_igihalkid_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	
	["phar_main_emar"] = {
		[1] = 
		{
			script_key 			= "phar_emar_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	
	["phar_main_dungul"] = {
		[1] = 
		{
			script_key 			= "phar_dungul_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	
	["troy_main_dan_ithaca"] = {
		[1] = 
		{
			script_key 			= "phar_ithaca_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	
	["troy_main_dan_boeotians"] = {
		[1] = 
		{
			script_key 			= "phar_dan_boeotians_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	
	["troy_main_dan_achilles"] = {
		[1] = 
		{
			script_key 			= "phar_achilles_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	
	["phar_main_damascus"] = {
		[1] = 
		{
			script_key 			= "phar_damascus_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	
	["phar_main_carchemish"] = {
		[1] = 
		{
			script_key 			= "phar_carchemish_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	
	["phar_main_byblos"] = {
		[1] = 
		{
			script_key 			= "phar_byblos_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	
	["phar_main_bahariya"] = {
		[1] = 
		{
			script_key 			= "phar_bahariya_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	
	["phar_map_assyria"] = {
		[1] = 
		{
			script_key 			= "phar_assyria_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	
	["phar_main_ashkelon"] = {
		[1] = 
		{
			script_key 			= "phar_ashkelon_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	
	["phar_main_alashiya"] = {
		[1] = 
		{
			script_key 			= "phar_alashiya_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
	
	["phar_main_napata"] = {
		[1] = 
		{
			script_key 			= "phar_napata_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},

	["phar_map_shubru"] = {
		[1] = 
		{
			script_key 			= "phar_shubru_point_victory_complete_quest",								-- This is linked to victory_objectives.txt
			objectives_activations_progress = {},
			objectives_completions_progress = {},
			activated_objectives = {}
		},
	},
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

-- New subcategories for Sea Peoples
	victory_objectives_subcategory_invasion_egypt = {
		id = "victory_objectives_subcategory_invasion_egypt",
		title_key = "campaign_localised_strings_string_phar_map_victory_objectives_subcategory_invasion_egypt_title",
		description_key = "campaign_localised_strings_string_phar_map_victory_objectives_subcategory_invasion_egypt_desc",
		tooltip_description_key = "campaign_localised_strings_string_phar_map_victory_objectives_subcategory_invasion_egypt_tooltip_desc",
		priority = 1,
		total_victory_points = 34,
	},

	victory_objectives_subcategory_invasion_hatti = {
		id = "victory_objectives_subcategory_invasion_hatti",
		title_key = "campaign_localised_strings_string_phar_map_victory_objectives_subcategory_invasion_hatti_title",
		description_key = "campaign_localised_strings_string_phar_map_victory_objectives_subcategory_invasion_hatti_desc",
		tooltip_description_key = "campaign_localised_strings_string_phar_map_victory_objectives_subcategory_invasion_hatti_tooltip_desc",
		priority = 2,
		total_victory_points = 34,
	},

	victory_objectives_subcategory_invasion_canaan = {
		id = "victory_objectives_subcategory_invasion_canaan",
		title_key = "campaign_localised_strings_string_phar_map_victory_objectives_subcategory_invasion_canaan_title",
		description_key = "campaign_localised_strings_string_phar_map_victory_objectives_subcategory_invasion_canaan_desc",
		tooltip_description_key = "campaign_localised_strings_string_phar_map_victory_objectives_subcategory_invasion_canaan_tooltip_desc",
		priority = 3,
		total_victory_points = 34,
	},

	victory_objectives_subcategory_invasion_aegea = {
		id = "victory_objectives_subcategory_invasion_aegea",
		title_key = "campaign_localised_strings_string_phar_map_victory_objectives_subcategory_invasion_aegea_title",
		description_key = "campaign_localised_strings_string_phar_map_victory_objectives_subcategory_invasion_aegea_desc",
		tooltip_description_key = "campaign_localised_strings_string_phar_map_victory_objectives_subcategory_invasion_aegea_tooltip_desc",
		priority = 4,
		total_victory_points = 34,
	},

	victory_objectives_subcategory_invasion_mesopotamia = {
		id = "victory_objectives_subcategory_invasion_mesopotamia",
		title_key = "campaign_localised_strings_string_phar_map_victory_objectives_subcategory_invasion_mesopotamia_title",
		description_key = "campaign_localised_strings_string_phar_map_victory_objectives_subcategory_invasion_mesopotamia_desc",
		tooltip_description_key = "campaign_localised_strings_string_phar_map_victory_objectives_subcategory_invasion_mesopotamia_tooltip_desc",
		priority = 5,
		total_victory_points = 34,
	},

	victory_objectives_subcategory_prominence_hordes = {
		id = "victory_objectives_subcategory_prominence_horde",
		title_key = "campaign_localised_strings_string_phar_map_victory_objectives_subcategory_cult_centres_horde_title",
		description_key = "campaign_localised_strings_string_phar_map_victory_objectives_subcategory_cult_centres_horde_desc",
		tooltip_description_key = "campaign_localised_strings_string_phar_main_victory_objectives_subcategory_conquests_prominences_tooltip_desc",
		priority = 6,
		total_victory_points = 32,
	},

-- Outdated Sea Peoples categories
	victory_objectives_subcategory_invasion = {
		id = "victory_objectives_subcategory_invasion",
		title_key = "campaign_localised_strings_string_phar_sea_victory_objectives_subcategory_invasion_title",
		description_key = "campaign_localised_strings_string_phar_sea_victory_objectives_subcategory_invasion_desc",
		tooltip_description_key = "campaign_localised_strings_string_phar_sea_victory_objectives_subcategory_invasion_tooltip_desc",
		priority = 1,
		total_victory_points = 34,
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

-- Legacy subcategories
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

local victory_objectives_cultures_settled = {
	"phar_main_clt_kemet",
	"phar_main_clt_hatti",
	"phar_main_clt_canaan",
	"troy_main_clt_danaans",
	"troy_main_clt_trojans",
	"troy_rem_clt_thraco_phrygians",
	"phar_map_clt_mesopotamian",
}

local victory_objectives_cultures_horde = {
	"phar_main_clt_sea_peoples",
	"troy_rem_clt_hordes_aethiopians",
}

local function excludeFromList(fullList, cultureToExclude)
	local newList = {}
	for i, v in ipairs(fullList) do
		if not table_contains(cultureToExclude, v) then
            table.insert(newList, v)
        end
	end
	return newList
end

local victory_objectives_cultures_settled_excluding_egypt = excludeFromList(victory_objectives_cultures_settled, {"phar_main_clt_kemet"})
local victory_objectives_cultures_settled_excluding_egypt_canaan = excludeFromList(victory_objectives_cultures_settled, {"phar_main_clt_kemet", "phar_main_clt_canaan"})
local victory_objectives_cultures_settled_excluding_hatti = excludeFromList(victory_objectives_cultures_settled, {"phar_main_clt_hatti"})
local victory_objectives_cultures_settled_excluding_hatti_canaan = excludeFromList(victory_objectives_cultures_settled, {"phar_main_clt_hatti", "phar_main_clt_canaan"})
local victory_objectives_cultures_settled_excluding_aegean = excludeFromList(victory_objectives_cultures_settled, {"troy_main_clt_danaans", "troy_main_clt_trojans", "troy_rem_clt_thraco_phrygians"})
local victory_objectives_cultures_settled_excluding_akkad = excludeFromList(victory_objectives_cultures_settled, {"phar_map_clt_mesopotamian"})

-------------------------------------------------------------
-- Victory Objectives -- START HERE --
-------------------------------------------------------------

victory_objectives_data = {
	
	-------------------------------------------------------------
	-- CONQUEST - HOMELAND - EGYPT
	-------------------------------------------------------------
	
	{
		uid 				= "egyptian_conquest_sel_lower_egypt_buto",
		vp_reward 			= 2,
		restricted_to_cultures = { "phar_main_clt_kemet" },
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
		restricted_to_cultures = { "phar_main_clt_kemet" },
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
		restricted_to_cultures = { "phar_main_clt_kemet" },
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
		restricted_to_cultures = { "phar_main_clt_kemet" },
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
		restricted_to_cultures = { "phar_main_clt_kemet" },
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
		restricted_to_cultures = { "phar_main_clt_kemet" },
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
		restricted_to_cultures = { "phar_main_clt_kemet" },
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
		restricted_to_cultures = { "phar_main_clt_kemet" },
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
		restricted_to_cultures = { "phar_main_clt_kemet" },
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
		restricted_to_cultures = { "phar_main_clt_kemet" },
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
		restricted_to_cultures = { "phar_main_clt_kemet" },
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
		restricted_to_cultures = { "phar_main_clt_kemet" },
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
		restricted_to_cultures = { "phar_main_clt_kemet" },
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
		restricted_to_cultures = { "phar_main_clt_kemet" },
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
		restricted_to_cultures = { "phar_main_clt_kemet" },
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
		restricted_to_cultures = { "phar_main_clt_kemet" },
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
		restricted_to_cultures = { "phar_main_clt_kemet" },
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
		restricted_to_cultures = { "phar_main_clt_kemet" },

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
		restricted_to_cultures = { "phar_main_clt_kemet" },
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
		restricted_to_cultures = { "phar_main_clt_kemet" },
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
		restricted_to_cultures = { "phar_main_clt_kemet" },
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
	-- CONQUEST - FOREIGN - EGYPT
	-------------------------------------------------------------

	{
		uid 				= "egyptian_conquest_foreign_upper_egypt_saww",
		vp_reward 			= 1,
		restricted_to_cultures = { "phar_main_clt_kemet" },
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
		restricted_to_cultures = { "phar_main_clt_kemet" },
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
		restricted_to_cultures = { "phar_main_clt_kemet" },
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
		restricted_to_cultures = { "phar_main_clt_kemet" },
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
		restricted_to_cultures = { "phar_main_clt_kemet" },
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
		restricted_to_cultures = { "phar_main_clt_kemet" },
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
		vp_reward 			= 5,
		restricted_to_cultures = { "phar_main_clt_kemet" },
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
					"phar_main_bahariya_oasis_bahariya_oasis",
					"phar_main_bahariya_oasis_mefka",
					"phar_main_bahariya_oasis_set_neb",
					"phar_main_farafra_oasis_aakh_sa",
					"phar_main_farafra_oasis_farafra_oasis",
					"phar_main_farafra_oasis_msha_khefti",
					"phar_map_zz_tjehenu_apesh",
					"phar_map_zz_tjehenu_khenti_qerer",
					"phar_map_zz_tjehenu_sepa",
					"phar_map_zz_tjehenu_wehat_siwa",
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
			{
				type = "control_region",
				region_key = "phar_main_bahariya_oasis_bahariya_oasis"
			},
			{
				type = "control_region",
				region_key = "phar_main_bahariya_oasis_mefka"
			},
			{
				type = "control_region",
				region_key = "phar_main_bahariya_oasis_set_neb"
			},
			{
				type = "control_region",
				region_key = "phar_main_farafra_oasis_aakh_sa"
			},
			{
				type = "control_region",
				region_key = "phar_main_farafra_oasis_farafra_oasis"
			},
			{
				type = "control_region",
				region_key = "phar_main_farafra_oasis_msha_khefti"
			},
			{
				type = "control_region",
				region_key = "phar_map_zz_tjehenu_apesh"
			},
			{
				type = "control_region",
				region_key = "phar_map_zz_tjehenu_khenti_qerer"
			},
			{
				type = "control_region",
				region_key = "phar_map_zz_tjehenu_sepa"
			},
			{
				type = "control_region",
				region_key = "phar_map_zz_tjehenu_wehat_siwa"
			},
		}
	},
	{
		uid 				= "egyptian_conquest_foreign_realm_sinai",
		vp_reward 			= 3,
		restricted_to_cultures = { "phar_main_clt_kemet" },
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

	-------------------------------------------------------------
	-- CONQUEST - HOMELAND - HITTITE
	-------------------------------------------------------------

	{
		uid 				= "hittite_conquest_shl_highlands_ancyra",
		vp_reward 			= 3,
		restricted_to_cultures = { "phar_main_clt_hatti" },
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
		restricted_to_cultures = { "phar_main_clt_hatti" },
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
		restricted_to_cultures = { "phar_main_clt_hatti" },
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
		restricted_to_cultures = { "phar_main_clt_hatti" },
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
		uid 				= "hittite_conquest_shl_isuwa_kammanu",
		vp_reward 			= 4,
		restricted_to_cultures = { "phar_main_clt_hatti" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,
		title_key			= "provinces_onscreen_phar_map_kammanu",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_shl_isuwa_kammanu_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_kammanu_amidu",
					"phar_map_kammanu_kummaha",
					"phar_map_kammanu_melid",
					"phar_map_kammanu_uiram",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_kammanu_amidu"
			},
			{
				type = "control_region",
				region_key = "phar_map_kammanu_kummaha"
			},
			{
				type = "control_region",
				region_key = "phar_map_kammanu_melid"
			},
			{
				type = "control_region",
				region_key = "phar_map_kammanu_uiram"
			},
		}
	},
	{
		uid 				= "hittite_conquest_shl_isuwa_malidiya",
		vp_reward 			= 4,
		restricted_to_cultures = { "phar_main_clt_hatti" },
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
		restricted_to_cultures = { "phar_main_clt_hatti" },
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
		restricted_to_cultures = { "phar_main_clt_hatti" },
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
		restricted_to_cultures = { "phar_main_clt_hatti" },
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
		restricted_to_cultures = { "phar_main_clt_hatti" },
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
		restricted_to_cultures = { "phar_main_clt_hatti" },
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
	-- CONQUEST - FOREIGN - HITTITE
	-------------------------------------------------------------

	{
		uid 				= "hittite_conquest_foreign_isuwa_zalpuwa",
		vp_reward 			= 1,
		restricted_to_cultures = { "phar_main_clt_hatti" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,
		title_key			= "provinces_onscreen_phar_map_zalpuwa",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_isuwa_zalpuwa_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_themiscyra_sinope",
					"phar_map_themiscyra_terme",
					"phar_map_themiscyra_zalpa",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_themiscyra_sinope"
			},
			{
				type = "control_region",
				region_key = "phar_map_themiscyra_terme"
			},
			{
				type = "control_region",
				region_key = "phar_map_themiscyra_zalpa"
			},
		}
	},
	{
		uid 				= "hittite_conquest_foreign_highlands_north_hatti",
		vp_reward 			= 2,
		restricted_to_cultures = { "phar_main_clt_hatti" },
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
		restricted_to_cultures = { "phar_main_clt_hatti" },
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
		vp_reward 			= 1,
		restricted_to_cultures = { "phar_main_clt_hatti" },
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
		vp_reward 			= 1,
		restricted_to_cultures = { "phar_main_clt_hatti" },
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
		restricted_to_cultures = { "phar_main_clt_hatti" },
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
		restricted_to_cultures = { "phar_main_clt_hatti" },
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
		restricted_to_cultures = { "phar_main_clt_hatti" },
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
		uid 				= "hittite_conquest_foreign_fenkhu_kadesh",
		vp_reward 			= 1,
		restricted_to_cultures = { "phar_main_clt_hatti" },
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
		restricted_to_cultures = { "phar_main_clt_hatti" },
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
		vp_reward 			= 2,
		restricted_to_cultures = { "phar_main_clt_hatti" },
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
		vp_reward 			= 1,
		restricted_to_cultures = { "phar_main_clt_hatti" },
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
		restricted_to_cultures = { "phar_main_clt_hatti" },
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
		vp_reward 			= 1,
		restricted_to_cultures = { "phar_main_clt_hatti" },
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
		vp_reward 			= 1,
		restricted_to_cultures = { "phar_main_clt_hatti" },
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

	-------------------------------------------------------------
	-- CONQUEST - HOMELAND - CANAAN
	-------------------------------------------------------------

	{
		uid 				= "canaan_conquest_core_fenkhu_kadesh",
		vp_reward 			= 2,
		restricted_to_cultures = { "phar_main_clt_canaan" },
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
		restricted_to_cultures = { "phar_main_clt_canaan" },
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
		restricted_to_cultures = { "phar_main_clt_canaan" },
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
		restricted_to_cultures = { "phar_main_clt_canaan" },
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
		restricted_to_cultures = { "phar_main_clt_canaan" },
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
		restricted_to_cultures = { "phar_main_clt_canaan" },
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
		restricted_to_cultures = { "phar_main_clt_canaan" },
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
		restricted_to_cultures = { "phar_main_clt_canaan" },
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
		restricted_to_cultures = { "phar_main_clt_canaan" },
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
		restricted_to_cultures = { "phar_main_clt_canaan" },
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
		restricted_to_cultures = { "phar_main_clt_canaan" },
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
		restricted_to_cultures = { "phar_main_clt_canaan" },
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
		restricted_to_cultures = { "phar_main_clt_canaan" },
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
		restricted_to_cultures = { "phar_main_clt_canaan" },
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
	-- CONQUEST - FOREIGN - CANAAN
	-------------------------------------------------------------

	{
		uid 				= "canaan_conquest_foreign_highlands_ancyra",
		vp_reward 			= 1,
		restricted_to_cultures = { "phar_main_clt_canaan" },
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
		vp_reward 			= 2,
		restricted_to_cultures = { "phar_main_clt_canaan" },
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
		restricted_to_cultures = { "phar_main_clt_canaan" },
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
		uid 				= "canaan_conquest_shl_highlands_pala",
		vp_reward 			= 2,
		restricted_to_cultures = { "phar_main_clt_canaan" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_shl_isuwa_zippalanda_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_shl_isuwa_zippalanda_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_tummanna_cromna",
					"phar_map_tummanna_sandaraca",
					"phar_map_tummanna_tummanna",
					"phar_map_zz_tummanna_kinik",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_tummanna_cromna"
			},
			{
				type = "control_region",
				region_key = "phar_map_tummanna_sandaraca"
			},
			{
				type = "control_region",
				region_key = "phar_map_tummanna_tummanna"
			},
			{
				type = "control_region",
				region_key = "phar_map_zz_tummanna_kinik"
			},
		}
	},
	{
		uid 				= "canaan_conquest_foreign_isuwa_kanesh",
		vp_reward 			= 1,
		restricted_to_cultures = { "phar_main_clt_canaan" },
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
		restricted_to_cultures = { "phar_main_clt_canaan" },
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
		uid 				= "canaanite_conquest_shl_isuwa_kammanu",
		vp_reward 			= 2,
		restricted_to_cultures = { "phar_main_clt_canaan" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,
		title_key			= "provinces_onscreen_phar_map_kammanu",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_shl_isuwa_kammanu_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_kammanu_amidu",
					"phar_map_kammanu_kummaha",
					"phar_map_kammanu_melid",
					"phar_map_kammanu_uiram",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_kammanu_amidu"
			},
			{
				type = "control_region",
				region_key = "phar_map_kammanu_kummaha"
			},
			{
				type = "control_region",
				region_key = "phar_map_kammanu_melid"
			},
			{
				type = "control_region",
				region_key = "phar_map_kammanu_uiram"
			},
		}
	},
	{
		uid 				= "canaan_conquest_foreign_isuwa_zalpuwa",
		vp_reward 			= 1,
		restricted_to_cultures = { "phar_main_clt_canaan" },
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,
		title_key			= "provinces_onscreen_phar_map_zalpuwa",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_canaan_conquest_foreign_isuwa_zalpuwa_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_themiscyra_sinope",
					"phar_map_themiscyra_terme",
					"phar_map_themiscyra_zalpa",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_themiscyra_sinope"
			},
			{
				type = "control_region",
				region_key = "phar_map_themiscyra_terme"
			},
			{
				type = "control_region",
				region_key = "phar_map_themiscyra_zalpa"
			},
		}
	},
	{
		uid 				= "canaan_conquest_foreign_isuwa_zippalanda",
		vp_reward 			= 2,
		restricted_to_cultures = { "phar_main_clt_canaan" },
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
		restricted_to_cultures = { "phar_main_clt_canaan" },
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
		restricted_to_cultures = { "phar_main_clt_canaan" },
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
		restricted_to_cultures = { "phar_main_clt_canaan" },
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
		restricted_to_cultures = { "phar_main_clt_canaan" },
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
		restricted_to_cultures = { "phar_main_clt_canaan" },
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

	-------------------------------------------------------------
	-- SEA PEOPLES - VICTORY OBJECTIVES
	-------------------------------------------------------------

	-------------------------------------------------------------
	-- SEA PEOPLES - CONQUEST - EGYPT
	-------------------------------------------------------------

	{
		uid                 = "sea_peoples_conquest_lower_egypt_buto",
		vp_reward           = 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion_egypt,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion_egypt,
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
		vp_reward           = 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion_egypt,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion_egypt,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion_egypt,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion_egypt,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion_egypt,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion_egypt,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion_egypt,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion_egypt,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion_egypt,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion_egypt,
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
		vp_reward           = 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion_egypt,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion_egypt,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion_egypt,
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
		uid 				= "sea_peoples_conquest_upper_egypt_saww",
		vp_reward 			= 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_egypt,
		title_key			= "ui_text_replacements_localised_text_phar_main_province_name_saww",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_upper_egypt_saww_desc",
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
				region_key = "phar_main_saww_sheps_uab",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_saww_saww",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_saww_mefka_beh",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid                 = "sea_peoples_conquest_nubia_buhen",
		vp_reward           = 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion_egypt,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion_egypt,
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
		vp_reward           = 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion_egypt,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion_egypt,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion_egypt,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category            = victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion_egypt,
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
	{
		uid 				= "sea_peoples_conquest_realm_western_desert",
		vp_reward 			= 6,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category        = victory_objectives_ui_categories.victory_objectives_subcategory_invasion_egypt,
		title_key			= "ui_text_replacements_localised_text_phar_main_realm_western_name",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_realm_western_desert_desc",
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
					"phar_main_bahariya_oasis_bahariya_oasis",
					"phar_main_bahariya_oasis_mefka",
					"phar_main_bahariya_oasis_set_neb",
					"phar_main_farafra_oasis_aakh_sa",
					"phar_main_farafra_oasis_farafra_oasis",
					"phar_main_farafra_oasis_msha_khefti",
					"phar_map_zz_tjehenu_apesh",
					"phar_map_zz_tjehenu_khenti_qerer",
					"phar_map_zz_tjehenu_sepa",
					"phar_map_zz_tjehenu_wehat_siwa",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_amunia_amunia",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_amunia_met_usr",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_amunia_ner_neb",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_dungul_oasis_dungul_asis",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_dungul_oasis_tem_pa",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_dungul_oasis_thes",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_dungul_oasis_utch",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_dakhla_oasis_dakhla_oasis",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_dakhla_oasis_khesef",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_dakhla_oasis_tcham",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_bahariya_oasis_bahariya_oasis",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_bahariya_oasis_mefka",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_bahariya_oasis_set_neb",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_farafra_oasis_aakh_sa",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_farafra_oasis_farafra_oasis",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_farafra_oasis_msha_khefti",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_zz_tjehenu_apesh",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_zz_tjehenu_khenti_qerer",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_zz_tjehenu_sepa",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_zz_tjehenu_wehat_siwa",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_realm_nubia",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_egypt,
		title_key			= "ui_text_replacements_localised_text_phar_main_al_hatshepsut_realm_nubia_title",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_realm_nubia_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_east_nubia_tep_heb",
					"phar_main_east_nubia_khefti_gehes",
					"phar_main_east_nubia_ti_neb",
					"phar_main_north_east_nubia_utcha_uas",
					"phar_main_north_east_nubia_hetch_pa",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_east_nubia_tep_heb",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_east_nubia_khefti_gehes",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_east_nubia_ti_neb",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_north_east_nubia_utcha_uas",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_north_east_nubia_hetch_pa",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_realm_kush",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_egypt,
		title_key			= "ui_text_replacements_localised_text_phar_main_al_hatshepsut_realm_kush_title",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_realm_kush_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_kawa_abu_ab",
					"phar_main_kawa_khus_qes",
					"phar_main_kawa_kawa",
					"phar_main_napata_napata",
					"phar_main_napata_res_tua",
					"phar_main_napata_res_khet",
					"phar_main_napata_hem_shema",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_kawa_abu_ab",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_kawa_khus_qes",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_kawa_kawa",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_napata_napata",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_napata_res_tua",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_napata_res_khet",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_napata_hem_shema",
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_hatti,
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
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_hatti,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_hatti,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_hatti,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_hatti,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_hatti,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_hatti,
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
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_hatti,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_hatti,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_hatti,
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
	{
		uid 				= "sea_peoples_conquest_lowlands_parha",
		vp_reward 			= 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_hatti,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_hittite_conquest_foreign_lowlands_parha_title",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_lowlands_parha_desc",
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
				region_key = "phar_main_parha_isaura",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_parha_sagalassos",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_parha_parha",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_realm_highlands",
		vp_reward 			= 3,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_hatti,
		title_key			= "ui_text_replacements_localised_text_phar_main_province_name_highlands",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_realm_highlands_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_north_hatti_dadastana",
					"phar_main_north_hatti_krateia",
					"phar_main_north_hatti_dusae",
					"phar_main_north_hatti_andrapa",
					"phar_main_west_hatti_dorylaion",
					"phar_main_west_hatti_gordion",
					"phar_main_west_hatti_pessinus",
					"phar_main_west_hatti_abrostola",
					"phar_map_tummanna_cromna",
					"phar_map_tummanna_sandaraca",
					"phar_map_tummanna_tummanna",
					"phar_map_zz_tummanna_kinik",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_north_hatti_dadastana",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_north_hatti_krateia",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_north_hatti_dusae",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_north_hatti_andrapa",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_west_hatti_dorylaion",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_west_hatti_gordion",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_west_hatti_pessinus",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_main_west_hatti_abrostola",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_tummanna_cromna",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_tummanna_sandaraca",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_tummanna_tummanna",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_zz_tummanna_kinik",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_realm_isuwa",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_hatti,
		title_key			= "ui_text_replacements_localised_text_phar_main_realm_isuwa_name",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_realm_isuwa_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_themiscyra_sinope",
					"phar_map_themiscyra_terme",
					"phar_map_themiscyra_zalpa",
					"phar_map_kammanu_amidu",
					"phar_map_kammanu_kummaha",
					"phar_map_kammanu_melid",
					"phar_map_kammanu_uiram",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_themiscyra_sinope",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_themiscyra_terme",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_themiscyra_zalpa",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_kammanu_amidu",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_kammanu_kummaha",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_kammanu_melid",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_kammanu_uiram",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},

	-------------------------------------------------------------
	-- SEA PEOPLES - CONQUER - CANAAN
	-------------------------------------------------------------

	{
		uid 				= "sea_peoples_conquest_fenkhu_kadesh",
		vp_reward 			= 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_canaan,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_canaan,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_canaan,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_canaan,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_canaan,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_canaan,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_canaan,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_canaan,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_canaan,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_canaan,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_canaan,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_canaan,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_canaan,
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
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_canaan,
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
	{
		uid 				= "sea_peoples_conquest_realm_aber_nahra",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_canaan,
		title_key			= "ui_text_replacements_localised_text_phar_map_realm_aber_nahra",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_realm_aber_nahra_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_ashtata_apane",
					"phar_map_ashtata_ashimon",
					"phar_map_ashtata_bukushe",
					"phar_map_ashtata_tuttul",
					"phar_map_balihu_eluhat",
					"phar_map_balihu_harbe",
					"phar_map_balihu_irridu",
					"phar_map_balihu_zalpah",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_ashtata_apane",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_ashtata_ashimon",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_ashtata_bukushe",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_ashtata_tuttul",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_balihu_eluhat",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_balihu_harbe",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_balihu_irridu",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_balihu_zalpah",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},

	-------------------------------------------------------------
	-- SEA PEOPLES - CONQUER GREECE
	-------------------------------------------------------------

	{
		uid 				= "sea_peoples_conquest_achaea_cephallenia",
		vp_reward 			= 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_aegea,
		title_key			= "ui_text_replacements_localised_text_phar_map_province_cephallenia",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_achaea_cephallenia_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_cephallenia_ithaca",
					"phar_map_cephallenia_hyrie",
					"phar_map_cephallenia_lefcas",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_cephallenia_ithaca",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_cephallenia_hyrie",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_cephallenia_lefcas",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_achaea_epirus",
		vp_reward 			= 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_aegea,
		title_key			= "ui_text_replacements_localised_text_phar_map_province_epirus",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_achaea_epirus_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_macedonia_cassope",
					"phar_map_macedonia_arnissa",
					"phar_map_macedonia_dolopeis",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_macedonia_cassope",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_macedonia_arnissa",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_macedonia_dolopeis",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_achaea_aetolia",
		vp_reward 			= 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_aegea,
		title_key			= "ui_text_replacements_localised_text_phar_map_province_aetolia",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_achaea_aetolia_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_boeotia_thebes",
					"phar_map_boeotia_cyparissos",
					"phar_map_boeotia_calydon",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_boeotia_thebes",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_boeotia_cyparissos",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_boeotia_calydon",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_achaea_thessaly",
		vp_reward 			= 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_aegea,
		title_key			= "ui_text_replacements_localised_text_phar_map_province_thessaly",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_achaea_thessaly_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_aeolia_pteleon",
					"phar_map_aeolia_pharsalos",
					"phar_map_aeolia_iolcos",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_aeolia_pteleon",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_aeolia_pharsalos",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_aeolia_iolcos",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_achaea_peonia",
		vp_reward 			= 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_aegea,
		title_key			= "ui_text_replacements_localised_text_phar_map_province_peonia",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_achaea_peonia_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_almopia_apsalos",
					"phar_map_almopia_dion",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_almopia_apsalos",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_almopia_dion",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_achaea_attica",
		vp_reward 			= 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_aegea,
		title_key			= "ui_text_replacements_localised_text_phar_map_province_attica",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_achaea_attica_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_attica_athens",
					"phar_map_attica_carystos",
					"phar_map_attica_eretria",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_attica_athens",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_attica_carystos",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_attica_eretria",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_achaea_cyclades",
		vp_reward 			= 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_aegea,
		title_key			= "ui_text_replacements_localised_text_phar_map_province_cyclades",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_achaea_cyclades_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_cyclades_naxos",
					"phar_map_cyclades_andros",
					"phar_map_cyclades_melos",
					"phar_map_cyclades_minoa",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_cyclades_naxos",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_cyclades_andros",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_cyclades_melos",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_cyclades_minoa",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_achaea_kaftiu",
		vp_reward 			= 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_aegea,
		title_key			= "ui_text_replacements_localised_text_phar_map_province_kaftiu",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_achaea_kaftiu_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_kretes_knossos",
					"phar_map_kretes_kydonia",
					"phar_map_kretes_phaestos",
					"phar_map_kretes_setaea",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_kretes_knossos",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_kretes_kydonia",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_kretes_phaestos",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_kretes_setaea",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_achaea_achaea",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_aegea,
		title_key			= "ui_text_replacements_localised_text_phar_map_province_achaea",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_achaea_achaea_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_mycenaeca_mycenae",
					"phar_map_mycenaeca_aegion",
					"phar_map_mycenaeca_corinth",
					"phar_map_mycenaeca_tiryns",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_mycenaeca_mycenae",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_mycenaeca_aegion",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_mycenaeca_corinth",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_mycenaeca_tiryns",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_achaea_laconia",
		vp_reward 			= 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_aegea,
		title_key			= "ui_text_replacements_localised_text_phar_map_province_laconia",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_achaea_laconia_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_lacedaemon_sparta",
					"phar_map_lacedaemon_pylos",
					"phar_map_lacedaemon_cythera",
					"phar_map_lacedaemon_altis",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_lacedaemon_sparta",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_lacedaemon_pylos",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_lacedaemon_cythera",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_lacedaemon_altis",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_assuwa_rhodes",
		vp_reward 			= 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_aegea,
		title_key			= "ui_text_replacements_localised_text_phar_map_province_rhodes",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_assuwa_rhodes_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_rhodes_lindos",
					"phar_map_rhodes_arcasia",
					"phar_map_rhodes_ialysos",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_rhodes_lindos",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_rhodes_arcasia",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_rhodes_ialysos",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_assuwa_lazpa",
		vp_reward 			= 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_aegea,
		title_key			= "ui_text_replacements_localised_text_phar_map_province_lazpa",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_assuwa_lazpa_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_teythrania_eressos",
					"phar_map_teythrania_volissos",
					"phar_map_latmos_dolyche",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_teythrania_eressos",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_teythrania_volissos",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_latmos_dolyche",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_assuwa_caria",
		vp_reward 			= 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_aegea,
		title_key			= "ui_text_replacements_localised_text_phar_map_province_caria",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_assuwa_caria_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_caria_halicarnassos",
					"phar_map_caria_knidos",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_caria_halicarnassos",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_caria_knidos",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_assuwa_lycia",
		vp_reward 			= 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_aegea,
		title_key			= "ui_text_replacements_localised_text_phar_map_province_lycia",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_assuwa_lycia_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_lycia_telmessos",
					"phar_map_lycia_phellos",
					"phar_map_lycia_peraia",
					"phar_map_parha_myra",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_lycia_telmessos",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_lycia_phellos",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_lycia_peraia",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_parha_myra",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_assuwa_isthmos",
		vp_reward 			= 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_aegea,
		title_key			= "ui_text_replacements_localised_text_phar_map_province_isthmos",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_assuwa_isthmos_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_lycia_balbura",
					"phar_map_isthmos_cibyra",
					"phar_map_isthmos_mobolla",
					"phar_map_isthmos_kaunos",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_lycia_balbura",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_isthmos_cibyra",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_isthmos_mobolla",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_isthmos_kaunos",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_assuwa_mira",
		vp_reward 			= 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_aegea,
		title_key			= "ui_text_replacements_localised_text_phar_map_province_mira",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_assuwa_mira_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{				
					"phar_map_maeonia_milethus",
					"phar_map_latmos_samos",
					"phar_map_maeonia_ephesos",
					"phar_map_maeonia_eyanthia",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_maeonia_milethus",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_latmos_samos",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_maeonia_ephesos",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_maeonia_eyanthia",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_assuwa_arzawa",
		vp_reward 			= 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_aegea,
		title_key			= "ui_text_replacements_localised_text_phar_map_province_arzawa",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_assuwa_arzawa_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_kuwaliya_kuwaliya",
					"phar_map_kuwaliya_ninoe",
					"phar_map_kuwaliya_appawiya",
					"phar_map_kuwaliya_walna",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_kuwaliya_kuwaliya",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_kuwaliya_ninoe",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_kuwaliya_appawiya",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_kuwaliya_walna",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_assuwa_seha",
		vp_reward 			= 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_aegea,
		title_key			= "ui_text_replacements_localised_text_phar_map_province_seha",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_assuwa_seha_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_teythrania_kyme",
					"phar_map_teythrania_pelopia",
					"phar_map_maeonia_erythrae",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_teythrania_kyme",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_teythrania_pelopia",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_maeonia_erythrae",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_assuwa_wilusa",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_aegea,
		title_key			= "ui_text_replacements_localised_text_phar_map_region_wilusa",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_assuwa_wilusa_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_ilion_zeleia",
					"phar_map_ilion_troy",
					"phar_map_ilion_percote",
					"phar_map_ilion_adresteia",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_ilion_zeleia",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_ilion_troy",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_ilion_percote",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_ilion_adresteia",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_assuwa_boreas",
		vp_reward 			= 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_aegea,
		title_key			= "ui_text_replacements_localised_text_phar_map_province_boreas_nesoi",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_assuwa_boreas_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_zerynthia_nesoi_myrina",
					"phar_map_zerynthia_nesoi_skyros",
					"phar_map_zerynthia_nesoi_imbrasos",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_zerynthia_nesoi_myrina",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_zerynthia_nesoi_skyros",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_zerynthia_nesoi_imbrasos",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_realm_assuwa",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_aegea,
		title_key			= "ui_text_replacements_localised_text_phar_map_realm_assuwa",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_realm_assuwa_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_hapalla_arowanna",
					"phar_map_hapalla_hapalla",
					"phar_map_hapalla_kalasma",
					"phar_map_hapalla_pitassa",
					"phar_map_bithynia_apollonia",
					"phar_map_bithynia_cythoros",
					"phar_map_bithynia_pylae",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_hapalla_arowanna",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_hapalla_hapalla",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_hapalla_kalasma",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_hapalla_pitassa",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_bithynia_apollonia",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_bithynia_cythoros",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_bithynia_pylae",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_realm_thrace",
		vp_reward 			= 3,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_aegea,
		title_key			= "ui_text_replacements_localised_text_phar_map_realm_thrace",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_realm_thrace_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_sinticobisaltia_siris",
					"phar_map_sinticobisaltia_scione",
					"phar_map_sinticobisaltia_olophyxos",
					"phar_map_zonaea_thasos",
					"phar_map_zonaea_ismaros",
					"phar_map_zonaea_sestos",
					"phar_map_zonaea_apsynthia",
					"phar_map_thynia_sipte",
					"phar_map_thynia_salmydessos",
					"phar_map_thynia_athyra",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_sinticobisaltia_siris",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_sinticobisaltia_scione",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_sinticobisaltia_olophyxos",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_zonaea_thasos",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_zonaea_ismaros",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_zonaea_sestos",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_zonaea_apsynthia",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_thynia_sipte",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_thynia_salmydessos",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_thynia_athyra",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},

	-------------------------------------------------------------
	-- SEA PEOPLES - CONQUER MESOPOTAMIA
	-------------------------------------------------------------

	{
		uid 				= "sea_peoples_conquest_mat_assur_azalzi",
		vp_reward 			= 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_mesopotamia,
		title_key			= "ui_text_replacements_localised_text_phar_map_province_azalzi",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_mat_assur_azalzi_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_azalzi_amasakku",
					"phar_map_azalzi_kahat",
					"phar_map_azalzi_shudu",
					"phar_map_azalzi_zakhiku",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_azalzi_amasakku",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_azalzi_kahat",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_azalzi_shudu",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_azalzi_zakhiku",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_mat_assur_hanigalbat",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_mesopotamia,
		title_key			= "ui_text_replacements_localised_text_phar_map_province_hanigalbat",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_mat_assur_hanigalbat_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_hanigalbat_dur_katlimmu",
					"phar_map_hanigalbat_sangaritu",
					"phar_map_hanigalbat_shadikanni",
					"phar_map_hanigalbat_washukanni",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_hanigalbat_dur_katlimmu",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_hanigalbat_sangaritu",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_hanigalbat_shadikanni",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_hanigalbat_washukanni",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_mat_assur_aranzah",
		vp_reward 			= 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_mesopotamia,
		title_key			= "ui_text_replacements_localised_text_phar_map_province_aranzah",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_mat_assur_aranzah_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_aranzah_assur",
					"phar_map_aranzah_karana",
					"phar_map_aranzah_nimrud",
					"phar_map_aranzah_nineveh",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_aranzah_assur",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_aranzah_karana",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_aranzah_nimrud",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_aranzah_nineveh",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_mat_assur_mari",
		vp_reward 			= 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_mesopotamia,
		title_key			= "ui_text_replacements_localised_text_phar_map_province_mari",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_mat_assur_mari_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_mari_duara",
					"phar_map_mari_mari",
					"phar_map_mari_supru",
					"phar_map_mari_terqa",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_mari_duara",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_mari_mari",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_mari_supru",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_mari_terqa",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_mat_assur_suhum_elu",
		vp_reward 			= 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_mesopotamia,
		title_key			= "ui_text_replacements_localised_text_phar_map_province_suhum_elu",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_mat_assur_suhum_elu_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_suhum_elu_anat",
					"phar_map_suhum_elu_haradu",
					"phar_map_suhum_elu_sapiratum",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_suhum_elu_anat",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_suhum_elu_haradu",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_suhum_elu_sapiratum",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_mat_tamti_bit_peri_amurru",
		vp_reward 			= 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_mesopotamia,
		title_key			= "ui_text_replacements_localised_text_phar_map_province_bit_peri_amurru",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_mat_tamti_bit_peri_amurru_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_bit_peri_amurru_agade",
					"phar_map_bit_peri_amurru_dur_kurigalzu",
					"phar_map_bit_peri_amurru_sur_marrati",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_bit_peri_amurru_agade",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_bit_peri_amurru_dur_kurigalzu",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_bit_peri_amurru_sur_marrati",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_mat_tamti_suhum_shaplu",
		vp_reward 			= 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_mesopotamia,
		title_key			= "ui_text_replacements_localised_text_phar_map_province_suhum_shaplu",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_mat_tamti_suhum_shaplu_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_suhum_shaplu_idu",
					"phar_map_suhum_shaplu_rapiku",
					"phar_map_suhum_shaplu_sippar_amnamun",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_suhum_shaplu_idu",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_suhum_shaplu_rapiku",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_suhum_shaplu_sippar_amnamun",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_mat_tamti_karduniash_ishtananu",
		vp_reward 			= 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_mesopotamia,
		title_key			= "ui_text_replacements_localised_text_phar_map_province_karduniash_ishtananu",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_mat_tamti_karduniash_ishtananu_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_karduniash_ishtananu_lagash",
					"phar_map_karduniash_ishtananu_larak",
					"phar_map_karduniash_ishtananu_malgu",
					"phar_map_karduniash_ishtananu_nippur",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_karduniash_ishtananu_lagash",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_karduniash_ishtananu_larak",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_karduniash_ishtananu_malgu",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_karduniash_ishtananu_nippur",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_mat_tamti_ashnunnak",
		vp_reward 			= 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_mesopotamia,
		title_key			= "ui_text_replacements_localised_text_phar_map_province_ashnunnak",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_mat_tamti_ashnunnak_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_ashnunnak_der",
					"phar_map_ashnunnak_diniktum",
					"phar_map_ashnunnak_eshnunna",
					"phar_map_ashnunnak_tutub",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_ashnunnak_der",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_ashnunnak_diniktum",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_ashnunnak_eshnunna",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_ashnunnak_tutub",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_mat_tamti_kan_digirak",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_mesopotamia,
		title_key			= "ui_text_replacements_localised_text_phar_map_province_kan_digirak",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_mat_tamti_kan_digirak_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_kan_digirak_babylon",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_kan_digirak_babylon",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_mat_tamti_shutaiu",
		vp_reward 			= 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_mesopotamia,
		title_key			= "ui_text_replacements_localised_text_phar_map_province_karduniash_shutaiu",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_mat_tamti_shutaiu_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_karduniash_shutaiu_borsippa",
					"phar_map_karduniash_shutaiu_ur",
					"phar_map_karduniash_shutaiu_uruk",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_karduniash_shutaiu_borsippa",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_karduniash_shutaiu_ur",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_karduniash_shutaiu_uruk",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_zagros_radanu",
		vp_reward 			= 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_mesopotamia,
		title_key			= "ui_text_replacements_localised_text_phar_map_province_radanu",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_zagros_radanu_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_radanu_admannu",
					"phar_map_radanu_arrapha",
					"phar_map_radanu_lubdu",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_radanu_admannu",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_radanu_arrapha",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_radanu_lubdu",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_realm_haltamti",
		vp_reward 			= 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_mesopotamia,
		title_key			= "ui_text_replacements_localised_text_phar_map_province_northern_elam",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_realm_haltamti_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_northern_elam_kabnak",
					"phar_map_northern_elam_madaktu",
					"phar_map_northern_elam_pashime",
					"phar_map_northern_elam_susa",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_northern_elam_kabnak",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_northern_elam_madaktu",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_northern_elam_pashime",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_northern_elam_susa",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},
	{
		uid 				= "sea_peoples_conquest_realm_zagros",
		vp_reward 			= 5,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_invasion_mesopotamia,
		title_key			= "ui_text_replacements_localised_text_phar_map_realm_zagros",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_conquest_realm_zagros_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_qutu_atlila",
					"phar_map_qutu_halman",
					"phar_map_qutu_nisir",
					"phar_map_qutu_tumma",
					"phar_map_zabu_kilizi",
					"phar_map_zabu_sussara",
					"phar_map_zabu_urbilim",
					"phar_map_uruatri_musasir",
					"phar_map_uruatri_tuali",
					"phar_map_uruatri_tuspa",
					"phar_map_kadmuhu_kindari",
					"phar_map_kadmuhu_mardama",
					"phar_map_kadmuhu_shibaniba",
					"phar_map_kadmuhu_tushhap",
					"phar_map_hayasa_azzi_aripsha",
					"phar_map_hayasa_azzi_hayasha",
					"phar_map_hayasa_azzi_upumu",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_qutu_atlila",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_qutu_halman",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_qutu_nisir",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_qutu_tumma",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_zabu_kilizi",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_zabu_sussara",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_zabu_urbilim",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_uruatri_musasir",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_uruatri_tuali",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_uruatri_tuspa",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_kadmuhu_kindari",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_kadmuhu_mardama",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_kadmuhu_shibaniba",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_kadmuhu_tushhap",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_hayasa_azzi_aripsha",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_hayasa_azzi_hayasha",
				should_consider_razed_regions_as_under_control = true
			},
			{
				type = "control_region",
				region_key = "phar_map_hayasa_azzi_upumu",
				should_consider_razed_regions_as_under_control = true
			},
		}
	},

	-------------------------------------------------------------
	-- END OF SEA PEOPLES VCS
	-------------------------------------------------------------

	-------------------------------------------------------------
	-- CONQUEST - FOREIGN - REALM - SHARED
	-------------------------------------------------------------

	{
		uid 				= "conquest_foreign_realm_sinai",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_settled_excluding_egypt_canaan,
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
		uid 				= "conquest_foreign_realm_western_desert",
		vp_reward 			= 6,
		restricted_to_cultures = victory_objectives_cultures_settled_excluding_egypt,
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
					"phar_main_bahariya_oasis_bahariya_oasis",
					"phar_main_bahariya_oasis_mefka",
					"phar_main_bahariya_oasis_set_neb",
					"phar_main_farafra_oasis_aakh_sa",
					"phar_main_farafra_oasis_farafra_oasis",
					"phar_main_farafra_oasis_msha_khefti",
					"phar_map_zz_tjehenu_apesh",
					"phar_map_zz_tjehenu_khenti_qerer",
					"phar_map_zz_tjehenu_sepa",
					"phar_map_zz_tjehenu_wehat_siwa",
					"phar_main_kharga_oasis_kharga_oasis",
					"phar_main_kharga_oasis_shesp_net",
					"phar_main_kharga_oasis_tebh",
					"phar_main_kurkur_oasis_kurkur_oasis",
					"phar_main_kurkur_oasis_sen_hetem",
					"phar_main_kurkur_oasis_tcheba_ua",
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
			{
				type = "control_region",
				region_key = "phar_main_bahariya_oasis_bahariya_oasis"
			},
			{
				type = "control_region",
				region_key = "phar_main_bahariya_oasis_mefka"
			},
			{
				type = "control_region",
				region_key = "phar_main_bahariya_oasis_set_neb"
			},
			{
				type = "control_region",
				region_key = "phar_main_farafra_oasis_aakh_sa"
			},
			{
				type = "control_region",
				region_key = "phar_main_farafra_oasis_farafra_oasis"
			},
			{
				type = "control_region",
				region_key = "phar_main_farafra_oasis_msha_khefti"
			},
			{
				type = "control_region",
				region_key = "phar_map_zz_tjehenu_apesh"
			},
			{
				type = "control_region",
				region_key = "phar_map_zz_tjehenu_khenti_qerer"
			},
			{
				type = "control_region",
				region_key = "phar_map_zz_tjehenu_sepa"
			},
			{
				type = "control_region",
				region_key = "phar_map_zz_tjehenu_wehat_siwa"
			},
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
		uid 				= "conquest_foreign_realm_lower_egypt",
		vp_reward 			= 5,
		restricted_to_cultures = victory_objectives_cultures_settled_excluding_egypt,
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
					"phar_main_faiyum_khem",
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
		uid 				= "conquest_foreign_realm_upper_egypt",		
		vp_reward 			= 5,
		restricted_to_cultures = victory_objectives_cultures_settled_excluding_egypt,
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
		uid 				= "conquest_foreign_realm_nubia",
		vp_reward 			= 3,
		restricted_to_cultures = victory_objectives_cultures_settled_excluding_egypt,
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
		uid 				= "conquest_foreign_realm_kush",
		vp_reward 			= 3,
		restricted_to_cultures = victory_objectives_cultures_settled_excluding_egypt,
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
	{
		uid 				= "conquest_foreign_realm_fenkhu",
		vp_reward 			= 3,
		restricted_to_cultures = victory_objectives_cultures_settled_excluding_hatti_canaan,
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
		uid 				= "conquest_foreign_realm_retjenu",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_settled_excluding_hatti_canaan,
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
		uid 				= "conquest_foreign_realm_yamhad",
		vp_reward 			= 3,
		restricted_to_cultures = victory_objectives_cultures_settled_excluding_hatti_canaan,
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
		uid 				= "conquest_foreign_realm_isuwa",
		vp_reward 			= 4,
		restricted_to_cultures = victory_objectives_cultures_settled_excluding_hatti_canaan,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,
		title_key			= "ui_text_replacements_localised_text_phar_main_victory_objectives_egyptian_conquest_foreign_realm_isuwa_title",
		description_key		= "ui_text_replacements_localised_text_phar_main_victory_objectives_egyptian_conquest_foreign_realm_isuwa_desc",	
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_zippalanda_amaseia",
					"phar_main_zippalanda_nerik",
					"phar_main_zippalanda_sapinuwa",
					"phar_main_zippalanda_zippalanda",
					"phar_main_malidiya_malidiya",
					"phar_main_malidiya_samuha",
					"phar_main_malidiya_tegarama",
					"phar_main_malidiya_zara",
					"phar_main_kanesh_kanesh",
					"phar_main_kanesh_kummanni",
					"phar_main_kanesh_saricha",
					"phar_map_kammanu_amidu",
					"phar_map_kammanu_kummaha",
					"phar_map_kammanu_melid",
					"phar_map_kammanu_uiram",
					"phar_map_themiscyra_sinope",
					"phar_map_themiscyra_terme",
					"phar_map_themiscyra_zalpa",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_zippalanda_amaseia"
			},
			{
				type = "control_region",
				region_key = "phar_main_zippalanda_nerik"
			},
			{
				type = "control_region",
				region_key = "phar_main_zippalanda_sapinuwa"
			},
			{
				type = "control_region",
				region_key = "phar_main_zippalanda_zippalanda"
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
				region_key = "phar_main_malidiya_tegarama"
			},
			{
				type = "control_region",
				region_key = "phar_main_malidiya_zara"
			},
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
			{
				type = "control_region",
				region_key = "phar_map_kammanu_amidu"
			},
			{
				type = "control_region",
				region_key = "phar_map_kammanu_kummaha"
			},
			{
				type = "control_region",
				region_key = "phar_map_kammanu_melid"
			},
			{
				type = "control_region",
				region_key = "phar_map_kammanu_uiram"
			},
			{
				type = "control_region",
				region_key = "phar_map_themiscyra_sinope"
			},
			{
				type = "control_region",
				region_key = "phar_map_themiscyra_terme"
			},
			{
				type = "control_region",
				region_key = "phar_map_themiscyra_zalpa"
			},
		}
	},
	{
		uid 				= "conquest_foreign_realm_highlands",
		vp_reward 			= 5,
		restricted_to_cultures = victory_objectives_cultures_settled_excluding_hatti_canaan,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,
		title_key			= "ui_text_replacements_localised_text_phar_main_victory_objectives_egyptian_conquest_foreign_realm_highlands_title",
		description_key		= "ui_text_replacements_localised_text_phar_main_victory_objectives_egyptian_conquest_foreign_realm_highlands_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_north_hatti_andrapa",
					"phar_main_north_hatti_dadastana",
					"phar_main_north_hatti_dusae",
					"phar_main_north_hatti_krateia",
					"phar_main_ancyra_ancyra",
					"phar_main_ancyra_aspona",
					"phar_main_ancyra_lagania",
					"phar_main_west_hatti_abrostola",
					"phar_main_west_hatti_dorylaion",
					"phar_main_west_hatti_gordion",
					"phar_main_west_hatti_pessinus",
					"phar_main_purushanda_mokissos",
					"phar_main_purushanda_nyssa",
					"phar_main_purushanda_purushanda",
					"phar_main_hattussa_ankuwa",
					"phar_main_hattussa_arinna",
					"phar_main_hattussa_corniaspa",
					"phar_main_hattussa_hattussa",
					"phar_map_tummanna_cromna",
					"phar_map_tummanna_sandaraca",
					"phar_map_tummanna_tummanna",
					"phar_map_zz_tummanna_kinik",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_north_hatti_andrapa"
			},
			{
				type = "control_region",
				region_key = "phar_main_north_hatti_dadastana"
			},
			{
				type = "control_region",
				region_key = "phar_main_north_hatti_dusae"
			},
			{
				type = "control_region",
				region_key = "phar_main_north_hatti_krateia"
			},
			{
				type = "control_region",
				region_key = "phar_main_ancyra_ancyra"
			},
			{
				type = "control_region",
				region_key = "phar_main_ancyra_aspona"
			},
			{
				type = "control_region",
				region_key = "phar_main_ancyra_lagania"
			},
			{
				type = "control_region",
				region_key = "phar_main_west_hatti_abrostola"
			},
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
				region_key = "phar_main_purushanda_mokissos"
			},
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
				region_key = "phar_main_hattussa_ankuwa"
			},
			{
				type = "control_region",
				region_key = "phar_main_hattussa_arinna"
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
				region_key = "phar_map_tummanna_cromna"
			},
			{
				type = "control_region",
				region_key = "phar_map_tummanna_sandaraca"
			},
			{
				type = "control_region",
				region_key = "phar_map_tummanna_tummanna"
			},
			{
				type = "control_region",
				region_key = "phar_map_zz_tummanna_kinik"
			},
		}
	},
	{
		uid 				= "conquest_foreign_realm_lowlands",
		vp_reward 			= 4,
		restricted_to_cultures = victory_objectives_cultures_settled_excluding_hatti_canaan,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,
		title_key			= "ui_text_replacements_localised_text_phar_main_victory_objectives_egyptian_conquest_foreign_realm_lowlands_title",
		description_key		= "ui_text_replacements_localised_text_phar_main_victory_objectives_egyptian_conquest_foreign_realm_lowlands_desc",	
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_main_tarsus_adana",
					"phar_main_tarsus_kyinda",
					"phar_main_tarsus_tarsus",
					"phar_main_tuwana_cybistra",
					"phar_main_tuwana_hubishna",
					"phar_main_tuwana_kelenderis",
					"phar_main_tuwana_tuwana",
					"phar_main_south_hatti_cibyra",
					"phar_main_south_hatti_lystra",
					"phar_main_south_hatti_tarhuntassa",
					"phar_main_parha_isaura",
					"phar_main_parha_parha",
					"phar_main_parha_sagalassos",
					"phar_main_central_hatti_koropissos",
					"phar_main_central_hatti_larawanda",
					"phar_main_central_hatti_pegella",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_main_tarsus_adana"
			},
			{
				type = "control_region",
				region_key = "phar_main_tarsus_kyinda"
			},
			{
				type = "control_region",
				region_key = "phar_main_tarsus_tarsus"
			},
			{
				type = "control_region",
				region_key = "phar_main_tuwana_cybistra"
			},
			{
				type = "control_region",
				region_key = "phar_main_tuwana_hubishna"
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
			{
				type = "control_region",
				region_key = "phar_main_parha_isaura"
			},
			{
				type = "control_region",
				region_key = "phar_main_parha_parha"
			},
			{
				type = "control_region",
				region_key = "phar_main_parha_sagalassos"
			},
			{
				type = "control_region",
				region_key = "phar_main_central_hatti_koropissos"
			},
			{
				type = "control_region",
				region_key = "phar_main_central_hatti_larawanda"
			},
			{
				type = "control_region",
				region_key = "phar_main_central_hatti_pegella"
			},
		}
	},
	{
		uid					= "conquest_foreign_realm_assuwa",
		vp_reward 			= 7,
		restricted_to_cultures = victory_objectives_cultures_settled_excluding_aegean,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_realm_assuwa_title",
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_realm_assuwa_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_bithynia_apollonia",
					"phar_map_bithynia_cythoros",
					"phar_map_bithynia_pylae",
					"phar_map_hapalla_arowanna",
					"phar_map_hapalla_hapalla",
					"phar_map_hapalla_kalasma",
					"phar_map_hapalla_pitassa",
					"phar_map_ilion_adresteia",
					"phar_map_ilion_percote",
					"phar_map_ilion_troy",
					"phar_map_ilion_zeleia",
					"phar_map_teythrania_pelopia",
					"phar_map_teythrania_kyme",
					"phar_map_maeonia_erythrae",
					"phar_map_kuwaliya_appawiya",
					"phar_map_kuwaliya_kuwaliya",
					"phar_map_kuwaliya_ninoe",
					"phar_map_kuwaliya_walna",
					"phar_map_maeonia_ephesos",
					"phar_map_latmos_samos",
					"phar_map_maeonia_eyanthia",
					"phar_map_maeonia_milethus",
					"phar_map_caria_halicarnassos",
					"phar_map_caria_knidos",
					"phar_map_isthmos_mobolla",
					"phar_map_isthmos_cibyra",
					"phar_map_isthmos_kaunos",
					"phar_map_lycia_balbura",
					"phar_map_lycia_peraia",
					"phar_map_lycia_phellos",
					"phar_map_lycia_telmessos",
					"phar_map_parha_myra",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_bithynia_apollonia"
			},
			{
				type = "control_region",
				region_key = "phar_map_bithynia_cythoros"
			},
			{
				type = "control_region",
				region_key = "phar_map_bithynia_pylae"
			},
			{
				type = "control_region",
				region_key = "phar_map_hapalla_arowanna"
			},
			{
				type = "control_region",
				region_key = "phar_map_hapalla_hapalla"
			},
			{
				type = "control_region",
				region_key = "phar_map_hapalla_kalasma"
			},
			{
				type = "control_region",
				region_key = "phar_map_hapalla_pitassa"
			},
			{
				type = "control_region",
				region_key = "phar_map_ilion_adresteia"
			},
			{
				type = "control_region",
				region_key = "phar_map_ilion_percote"
			},
			{
				type = "control_region",
				region_key = "phar_map_ilion_troy"
			},
			{
				type = "control_region",
				region_key = "phar_map_ilion_zeleia"
			},
			{
				type = "control_region",
				region_key = "phar_map_teythrania_pelopia"
			},
			{
				type = "control_region",
				region_key = "phar_map_teythrania_kyme"
			},
			{
				type = "control_region",
				region_key = "phar_map_maeonia_erythrae"
			},
			{
				type = "control_region",
				region_key = "phar_map_kuwaliya_appawiya"
			},
			{
				type = "control_region",
				region_key = "phar_map_kuwaliya_kuwaliya"
			},
			{
				type = "control_region",
				region_key = "phar_map_kuwaliya_ninoe"
			},
			{
				type = "control_region",
				region_key = "phar_map_kuwaliya_walna"
			},
			{
				type = "control_region",
				region_key = "phar_map_maeonia_ephesos"
			},
			{
				type = "control_region",
				region_key = "phar_map_latmos_samos"
			},
			{
				type = "control_region",
				region_key = "phar_map_maeonia_eyanthia"
			},
			{
				type = "control_region",
				region_key = "phar_map_maeonia_milethus"
			},
			{
				type = "control_region",
				region_key = "phar_map_caria_halicarnassos"
			},
			{
				type = "control_region",
				region_key = "phar_map_caria_knidos"
			},
			{
				type = "control_region",
				region_key = "phar_map_isthmos_mobolla"
			},
			{
				type = "control_region",
				region_key = "phar_map_isthmos_cibyra"
			},
			{
				type = "control_region",
				region_key = "phar_map_isthmos_kaunos"
			},
			{
				type = "control_region",
				region_key = "phar_map_lycia_balbura"
			},
			{
				type = "control_region",
				region_key = "phar_map_lycia_peraia"
			},
			{
				type = "control_region",
				region_key = "phar_map_lycia_phellos"
			},
			{
				type = "control_region",
				region_key = "phar_map_lycia_telmessos"
			},
			{
				type = "control_region",
				region_key = "phar_map_parha_myra"
			},
		}
	},
	{
		uid					= "conquest_foreign_realm_thrace",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_settled_excluding_aegean,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_realm_thrace_title",
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_realm_thrace_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_sinticobisaltia_siris",
					"phar_map_sinticobisaltia_scione",
					"phar_map_sinticobisaltia_olophyxos",
					"phar_map_zonaea_thasos",
					"phar_map_zonaea_ismaros",
					"phar_map_zonaea_sestos",
					"phar_map_zonaea_apsynthia",
					"phar_map_thynia_sipte",
					"phar_map_thynia_salmydessos",
					"phar_map_thynia_athyra",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_sinticobisaltia_siris"
			},
			{
				type = "control_region",
				region_key = "phar_map_sinticobisaltia_scione"
			},
			{
				type = "control_region",
				region_key = "phar_map_sinticobisaltia_olophyxos"
			},
			{
				type = "control_region",
				region_key = "phar_map_zonaea_thasos"
			},
			{
				type = "control_region",
				region_key = "phar_map_zonaea_ismaros"
			},
			{
				type = "control_region",
				region_key = "phar_map_zonaea_sestos"
			},
			{
				type = "control_region",
				region_key = "phar_map_zonaea_apsynthia"
			},
			{
				type = "control_region",
				region_key = "phar_map_thynia_sipte"
			},
			{
				type = "control_region",
				region_key = "phar_map_thynia_salmydessos"
			},
			{
				type = "control_region",
				region_key = "phar_map_thynia_athyra"
			},
		}
	},
	{
		uid					= "conquest_foreign_realm_achaea",
		vp_reward 			= 6,
		restricted_to_cultures = victory_objectives_cultures_settled_excluding_aegean,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_realm_achaea_title",
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_realm_achaea_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_almopia_apsalos",
					"phar_map_almopia_dion",
					"phar_map_macedonia_arnissa",
					"phar_map_macedonia_dolopeis",
					"phar_map_macedonia_cassope",
					"phar_map_cephallenia_lefcas",
					"phar_map_cephallenia_ithaca",
					"phar_map_cephallenia_hyrie",
					"phar_map_boeotia_calydon",
					"phar_map_boeotia_cyparissos",
					"phar_map_boeotia_thebes",
					"phar_map_mycenaeca_aegion",
					"phar_map_mycenaeca_corinth",
					"phar_map_mycenaeca_tiryns",
					"phar_map_mycenaeca_mycenae",
					"phar_map_lacedaemon_altis",
					"phar_map_lacedaemon_pylos",
					"phar_map_lacedaemon_sparta",
					"phar_map_lacedaemon_cythera",
					"phar_map_aeolia_pharsalos",
					"phar_map_aeolia_iolcos",
					"phar_map_aeolia_pteleon",
					"phar_map_attica_athens",
					"phar_map_attica_eretria",
					"phar_map_attica_carystos",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_almopia_apsalos"
			},
			{
				type = "control_region",
				region_key = "phar_map_almopia_dion"
			},
			{
				type = "control_region",
				region_key = "phar_map_macedonia_arnissa"
			},
			{
				type = "control_region",
				region_key = "phar_map_macedonia_dolopeis"
			},
			{
				type = "control_region",
				region_key = "phar_map_macedonia_cassope"
			},
			{
				type = "control_region",
				region_key = "phar_map_cephallenia_lefcas"
			},
			{
				type = "control_region",
				region_key = "phar_map_cephallenia_ithaca"
			},
			{
				type = "control_region",
				region_key = "phar_map_cephallenia_hyrie"
			},
			{
				type = "control_region",
				region_key = "phar_map_boeotia_calydon"
			},
			{
				type = "control_region",
				region_key = "phar_map_boeotia_cyparissos"
			},
			{
				type = "control_region",
				region_key = "phar_map_boeotia_thebes"
			},
			{
				type = "control_region",
				region_key = "phar_map_mycenaeca_aegion"
			},
			{
				type = "control_region",
				region_key = "phar_map_mycenaeca_corinth"
			},
			{
				type = "control_region",
				region_key = "phar_map_mycenaeca_tiryns"
			},
			{
				type = "control_region",
				region_key = "phar_map_mycenaeca_mycenae"
			},
			{
				type = "control_region",
				region_key = "phar_map_lacedaemon_altis"
			},
			{
				type = "control_region",
				region_key = "phar_map_lacedaemon_pylos"
			},
			{
				type = "control_region",
				region_key = "phar_map_lacedaemon_sparta"
			},
			{
				type = "control_region",
				region_key = "phar_map_lacedaemon_cythera"
			},
			{
				type = "control_region",
				region_key = "phar_map_aeolia_pharsalos"
			},
			{
				type = "control_region",
				region_key = "phar_map_aeolia_iolcos"
			},
			{
				type = "control_region",
				region_key = "phar_map_aeolia_pteleon"
			},
			{
				type = "control_region",
				region_key = "phar_map_attica_athens"
			},
			{
				type = "control_region",
				region_key = "phar_map_attica_eretria"
			},
			{
				type = "control_region",
				region_key = "phar_map_attica_carystos"
			},
		}
	},
	{
		uid					= "conquest_foreign_realm_aegean_islands",
		vp_reward 			= 4,
		restricted_to_cultures = victory_objectives_cultures_settled_excluding_aegean,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_aegean_islands_title",
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_aegean_islands_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_rhodes_arcasia",
					"phar_map_rhodes_ialysos",
					"phar_map_rhodes_lindos",
					"phar_map_latmos_dolyche",
					"phar_map_teythrania_eressos",
					"phar_map_teythrania_volissos",
					"phar_map_zerynthia_nesoi_imbrasos",
					"phar_map_zerynthia_nesoi_myrina",
					"phar_map_zerynthia_nesoi_skyros",
					"phar_map_kretes_knossos",
					"phar_map_kretes_kydonia",
					"phar_map_kretes_phaestos",
					"phar_map_kretes_setaea",
					"phar_map_cyclades_andros",
					"phar_map_cyclades_melos",
					"phar_map_cyclades_minoa",
					"phar_map_cyclades_naxos",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_rhodes_arcasia"
			},
			{
				type = "control_region",
				region_key = "phar_map_rhodes_ialysos"
			},
			{
				type = "control_region",
				region_key = "phar_map_rhodes_lindos"
			},
			{
				type = "control_region",
				region_key = "phar_map_latmos_dolyche"
			},
			{
				type = "control_region",
				region_key = "phar_map_teythrania_eressos"
			},
			{
				type = "control_region",
				region_key = "phar_map_teythrania_volissos"
			},
			{
				type = "control_region",
				region_key = "phar_map_zerynthia_nesoi_imbrasos"
			},
			{
				type = "control_region",
				region_key = "phar_map_zerynthia_nesoi_myrina"
			},
			{
				type = "control_region",
				region_key = "phar_map_zerynthia_nesoi_skyros"
			},
			{
				type = "control_region",
				region_key = "phar_map_kretes_knossos"
			},
			{
				type = "control_region",
				region_key = "phar_map_kretes_kydonia"
			},
			{
				type = "control_region",
				region_key = "phar_map_kretes_phaestos"
			},
			{
				type = "control_region",
				region_key = "phar_map_kretes_setaea"
			},
			{
				type = "control_region",
				region_key = "phar_map_cyclades_andros"
			},
			{
				type = "control_region",
				region_key = "phar_map_cyclades_melos"
			},
			{
				type = "control_region",
				region_key = "phar_map_cyclades_minoa"
			},
			{
				type = "control_region",
				region_key = "phar_map_cyclades_naxos"
			},
		}
	},
	{
		uid 				= "conquest_foreign_realm_aber_nahra",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_settled_excluding_akkad,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_realm_aber_nahra_title",
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_realm_aber_nahra_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_balihu_eluhat",
					"phar_map_balihu_irridu",
					"phar_map_balihu_harbe",
					"phar_map_balihu_zalpah",
					"phar_map_ashtata_tuttul",
					"phar_map_ashtata_bukushe",
					"phar_map_ashtata_ashimon",
					"phar_map_ashtata_apane",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_balihu_eluhat"
			},
			{
				type = "control_region",
				region_key = "phar_map_balihu_irridu"
			},
			{
				type = "control_region",
				region_key = "phar_map_balihu_harbe"
			},
			{
				type = "control_region",
				region_key = "phar_map_balihu_zalpah"
			},
			{
				type = "control_region",
				region_key = "phar_map_ashtata_tuttul"
			},
			{
				type = "control_region",
				region_key = "phar_map_ashtata_bukushe"
			},
			{
				type = "control_region",
				region_key = "phar_map_ashtata_ashimon"
			},
			{
				type = "control_region",
				region_key = "phar_map_ashtata_apane"
			},
		}
	},
	{
		uid 				= "conquest_foreign_realm_mat_assur",
		vp_reward 			= 4,
		restricted_to_cultures = victory_objectives_cultures_settled_excluding_akkad,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_realm_mat_assur_title",
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_realm_mat_assur_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_aranzah_assur",
					"phar_map_aranzah_karana",
					"phar_map_aranzah_nimrud",
					"phar_map_aranzah_nineveh",
					"phar_map_suhum_elu_anat",
					"phar_map_suhum_elu_haradu",
					"phar_map_suhum_elu_sapiratum",
					"phar_map_mari_duara",
					"phar_map_mari_mari",
					"phar_map_mari_supru",
					"phar_map_mari_terqa",
					"phar_map_azalzi_amasakku",
					"phar_map_azalzi_kahat",
					"phar_map_azalzi_shudu",
					"phar_map_azalzi_zakhiku",
					"phar_map_hanigalbat_dur_katlimmu",
					"phar_map_hanigalbat_sangaritu",
					"phar_map_hanigalbat_shadikanni",
					"phar_map_hanigalbat_washukanni",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_aranzah_assur"
			},
			{
				type = "control_region",
				region_key = "phar_map_aranzah_karana"
			},
			{
				type = "control_region",
				region_key = "phar_map_aranzah_nimrud"
			},
			{
				type = "control_region",
				region_key = "phar_map_aranzah_nineveh"
			},
			{
				type = "control_region",
				region_key = "phar_map_suhum_elu_anat"
			},
			{
				type = "control_region",
				region_key = "phar_map_suhum_elu_haradu"
			},
			{
				type = "control_region",
				region_key = "phar_map_suhum_elu_sapiratum"
			},
			{
				type = "control_region",
				region_key = "phar_map_mari_duara"
			},
			{
				type = "control_region",
				region_key = "phar_map_mari_mari"
			},
			{
				type = "control_region",
				region_key = "phar_map_mari_supru"
			},
			{
				type = "control_region",
				region_key = "phar_map_mari_terqa"
			},
			{
				type = "control_region",
				region_key = "phar_map_azalzi_amasakku"
			},
			{
				type = "control_region",
				region_key = "phar_map_azalzi_kahat"
			},
			{
				type = "control_region",
				region_key = "phar_map_azalzi_shudu"
			},
			{
				type = "control_region",
				region_key = "phar_map_azalzi_zakhiku"
			},
			{
				type = "control_region",
				region_key = "phar_map_hanigalbat_dur_katlimmu"
			},
			{
				type = "control_region",
				region_key = "phar_map_hanigalbat_sangaritu"
			},
			{
				type = "control_region",
				region_key = "phar_map_hanigalbat_shadikanni"
			},
			{
				type = "control_region",
				region_key = "phar_map_hanigalbat_washukanni"
			},
		}
	},
	{
		uid 				= "conquest_foreign_realm_mat_tamti",
		vp_reward 			= 4,
		restricted_to_cultures = victory_objectives_cultures_settled_excluding_akkad,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_realm_mat_tamti_title",
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_realm_mat_tamti_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_ashnunnak_der",
					"phar_map_ashnunnak_diniktum",
					"phar_map_ashnunnak_eshnunna",
					"phar_map_ashnunnak_tutub",
					"phar_map_karduniash_ishtananu_lagash",
					"phar_map_karduniash_ishtananu_larak",
					"phar_map_karduniash_ishtananu_malgu",
					"phar_map_karduniash_ishtananu_nippur",
					"phar_map_karduniash_shutaiu_borsippa",
					"phar_map_karduniash_shutaiu_ur",
					"phar_map_karduniash_shutaiu_uruk",
					"phar_map_kan_digirak_babylon",
					"phar_map_suhum_shaplu_idu",
					"phar_map_suhum_shaplu_rapiku",
					"phar_map_suhum_shaplu_sippar_amnamun",
					"phar_map_bit_peri_amurru_agade",
					"phar_map_bit_peri_amurru_dur_kurigalzu",
					"phar_map_bit_peri_amurru_sur_marrati",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_ashnunnak_der"
			},
			{
				type = "control_region",
				region_key = "phar_map_ashnunnak_diniktum"
			},
			{
				type = "control_region",
				region_key = "phar_map_ashnunnak_eshnunna"
			},
			{
				type = "control_region",
				region_key = "phar_map_ashnunnak_tutub"
			},
			{
				type = "control_region",
				region_key = "phar_map_karduniash_ishtananu_lagash"
			},
			{
				type = "control_region",
				region_key = "phar_map_karduniash_ishtananu_larak"
			},
			{
				type = "control_region",
				region_key = "phar_map_karduniash_ishtananu_malgu"
			},
			{
				type = "control_region",
				region_key = "phar_map_karduniash_ishtananu_nippur"
			},
			{
				type = "control_region",
				region_key = "phar_map_karduniash_shutaiu_borsippa"
			},
			{
				type = "control_region",
				region_key = "phar_map_karduniash_shutaiu_ur"
			},
			{
				type = "control_region",
				region_key = "phar_map_karduniash_shutaiu_uruk"
			},
			{
				type = "control_region",
				region_key = "phar_map_kan_digirak_babylon"
			},
			{
				type = "control_region",
				region_key = "phar_map_suhum_shaplu_idu"
			},
			{
				type = "control_region",
				region_key = "phar_map_suhum_shaplu_rapiku"
			},
			{
				type = "control_region",
				region_key = "phar_map_suhum_shaplu_sippar_amnamun"
			},
			{
				type = "control_region",
				region_key = "phar_map_bit_peri_amurru_agade"
			},
			{
				type = "control_region",
				region_key = "phar_map_bit_peri_amurru_dur_kurigalzu"
			},
			{
				type = "control_region",
				region_key = "phar_map_bit_peri_amurru_sur_marrati"
			},
		}
	},
	{
		uid 				= "conquest_foreign_realm_zagros",
		vp_reward 			= 5,
		restricted_to_cultures = victory_objectives_cultures_settled_excluding_akkad,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_realm_zagros_title",
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_realm_zagros_desc",
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_radanu_admannu",
					"phar_map_radanu_arrapha",
					"phar_map_radanu_lubdu",
					"phar_map_qutu_atlila",
					"phar_map_qutu_halman",
					"phar_map_qutu_nisir",
					"phar_map_qutu_tumma",
					"phar_map_zabu_kilizi",
					"phar_map_zabu_sussara",
					"phar_map_zabu_urbilim",
					"phar_map_uruatri_musasir",
					"phar_map_uruatri_tuali",
					"phar_map_uruatri_tuspa",
					"phar_map_kadmuhu_kindari",
					"phar_map_kadmuhu_mardama",
					"phar_map_kadmuhu_shibaniba",
					"phar_map_kadmuhu_tushhap",
					"phar_map_hayasa_azzi_aripsha",
					"phar_map_hayasa_azzi_hayasha",
					"phar_map_hayasa_azzi_upumu",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_radanu_admannu"
			},
			{
				type = "control_region",
				region_key = "phar_map_radanu_arrapha"
			},
			{
				type = "control_region",
				region_key = "phar_map_radanu_lubdu"
			},
			{
				type = "control_region",
				region_key = "phar_map_qutu_atlila"
			},
			{
				type = "control_region",
				region_key = "phar_map_qutu_halman"
			},
			{
				type = "control_region",
				region_key = "phar_map_qutu_nisir"
			},
			{
				type = "control_region",
				region_key = "phar_map_qutu_tumma"
			},
			{
				type = "control_region",
				region_key = "phar_map_zabu_kilizi"
			},
			{
				type = "control_region",
				region_key = "phar_map_zabu_sussara"
			},
			{
				type = "control_region",
				region_key = "phar_map_zabu_urbilim"
			},
			{
				type = "control_region",
				region_key = "phar_map_uruatri_musasir"
			},
			{
				type = "control_region",
				region_key = "phar_map_uruatri_tuali"
			},
			{
				type = "control_region",
				region_key = "phar_map_uruatri_tuspa"
			},
			{
				type = "control_region",
				region_key = "phar_map_kadmuhu_kindari"
			},
			{
				type = "control_region",
				region_key = "phar_map_kadmuhu_mardama"
			},
			{
				type = "control_region",
				region_key = "phar_map_kadmuhu_shibaniba"
			},
			{
				type = "control_region",
				region_key = "phar_map_kadmuhu_tushhap"
			},
			{
				type = "control_region",
				region_key = "phar_map_hayasa_azzi_aripsha"
			},
			{
				type = "control_region",
				region_key = "phar_map_hayasa_azzi_hayasha"
			},
			{
				type = "control_region",
				region_key = "phar_map_hayasa_azzi_upumu"
			},
		}
	},

	-------------------------------------------------------------
	-- CONQUEST - CULT CENTERS - SHARED
	-------------------------------------------------------------

	{
		uid 				= "common_conquest_prominence_egypt_abydos",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_settled,
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
		restricted_to_cultures = victory_objectives_cultures_settled,
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
		restricted_to_cultures = victory_objectives_cultures_settled,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_heliopolis_title",
		description_key		= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_heliopolis_desc",
		disable_progress_bar = true,
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
		restricted_to_cultures = victory_objectives_cultures_settled,
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
		restricted_to_cultures = victory_objectives_cultures_settled,
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
		restricted_to_cultures = victory_objectives_cultures_settled,
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
		restricted_to_cultures = victory_objectives_cultures_settled,
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
		restricted_to_cultures = victory_objectives_cultures_settled,
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
		restricted_to_cultures = victory_objectives_cultures_settled,
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
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_settled,
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
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_settled,
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
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_settled,
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
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_settled,
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
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_settled,
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
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_settled,
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
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_settled,
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
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_settled,
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
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_settled,
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
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_settled,
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
	{
		uid 				= "common_conquest_prominence_mycenaeca_mycenae",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_settled,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_conquest_cult_center_mycenae_title",
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_conquest_cult_center_mycenae_desc",
		disable_progress_bar = true,	
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_mycenaeca_mycenae",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_mycenaeca_mycenae"
			},
		}
	},
	{
		uid 				= "common_conquest_prominence_kretes_knossos",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_settled,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_conquest_cult_center_knossos_title",
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_conquest_cult_center_knossos_desc",	
		disable_progress_bar = true,	
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_kretes_knossos",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_kretes_knossos"
			},
		}
	},
	{
		uid 				= "common_conquest_prominence_ilion_troy",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_settled,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_conquest_cult_center_wilusa_title",
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_conquest_cult_center_wilusa_desc",	
		disable_progress_bar = true,	
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_ilion_troy",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_ilion_troy"
			},
		}
	},
	{
		uid 				= "common_conquest_prominence_sinticobisaltia_siris",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_settled,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_conquest_cult_center_siris_title",
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_conquest_cult_center_siris_desc",
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_sinticobisaltia_siris",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_sinticobisaltia_siris"
			},
		}
	},
	{
		uid 				= "common_conquest_prominence_isthmos_cibyra",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_settled,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,
		title_key			= "regions_onscreen_phar_main_south_hatti_cibyra",
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_conquest_cult_center_cibyra_magna_desc",
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_isthmos_cibyra",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_isthmos_cibyra"
			},
		}
	},
	{
		uid 				= "common_conquest_prominence_aranzah_assur",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_settled,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_conquest_cult_center_assur_title",
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_conquest_cult_center_assur_desc",
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_aranzah_assur",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_aranzah_assur"
			},
		}
	},
	{
		uid 				= "common_conquest_prominence_phar_map_bit_peri_amurru_dur_kurigalzu",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_settled,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,
		title_key			= "regions_onscreen_phar_map_bit_peri_amurru_dur_kurigalzu",
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_conquest_cult_center_dur_kurigalzu_desc",
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_bit_peri_amurru_dur_kurigalzu",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_bit_peri_amurru_dur_kurigalzu"
			},
		}
	},
	{
		uid 				= "common_conquest_prominence_elam_susa",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_settled,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_conquest_cult_center_susa_title",
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_conquest_cult_center_susa_desc",
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_northern_elam_susa",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_northern_elam_susa"
			},
		}
	},
	{
		uid 				= "common_conquest_prominence_digirak_babylon",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_settled,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_conquest_cult_center_babylon_title",
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_conquest_cult_center_babylon_desc",
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_kan_digirak_babylon",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_kan_digirak_babylon"
			},
		}
	},
	{
		uid 				= "common_conquest_prominence_ishtananu_nippur",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_settled,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_conquest_cult_center_nippur_title",
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_conquest_cult_center_nippur_desc",
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_karduniash_ishtananu_nippur",
				}
			},
		},
		completion_conditions = {
			{
				type = "control_region",
				region_key = "phar_map_karduniash_ishtananu_nippur"
			},
		}
	},

	-------------------------------------------------------------
	-- CONQUEST - CULT CENTERS - HORDE
	-------------------------------------------------------------

	{
		uid 				= "sea_peoples_raze_prominence_egypt_abydos",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence_hordes,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_abydos_title",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_raze_prominence_egypt_abydos_desc",
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
				type = "raze_region",
				region_key = "phar_main_abydos_abydos",
			},
		}
	},
	{
		uid 				= "sea_peoples_raze_prominence_egypt_buhen",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence_hordes,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_buhen_title",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_raze_prominence_egypt_buhen_desc",
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
				type = "raze_region",
				region_key = "phar_main_buhen_buhen",
			},
		}
	},
	{
		uid 				= "sea_peoples_raze_prominence_egypt_heliopolis",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence_hordes,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_heliopolis_title",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_raze_prominence_egypt_heliopolis_desc",
		disable_progress_bar = true,
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
				region_key = "phar_main_heliopolis_heliopolis",
			},
		}
	},
	{
		uid 				= "sea_peoples_raze_prominence_egypt_hermopolis",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence_hordes,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_hermopolis_title",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_raze_prominence_egypt_hermopolis_desc",
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
				type = "raze_region",
				region_key = "phar_main_hermopolis_hermopolis",
			},
		}
	},
	{
		uid 				= "sea_peoples_raze_prominence_egypt_kawa",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence_hordes,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_kawa_title",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_raze_prominence_egypt_kawa_desc",
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
				type = "raze_region",
				region_key = "phar_main_kawa_kawa",
			},
		}
	},
	{
		uid 				= "sea_peoples_raze_prominence_egypt_kom_ombo",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence_hordes,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_kom_ombo_title",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_raze_prominence_egypt_kom_ombo_desc",
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
				type = "raze_region",
				region_key = "phar_main_kom_ombo_kom_ombo",
			},
		}
	},
	{
		uid 				= "sea_peoples_raze_prominence_egypt_memphis",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence_hordes,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_memphis_title",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_raze_prominence_egypt_memphis_desc",
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
				type = "raze_region",
				region_key = "phar_main_memphis_memphis",
			},
		}
	},
	{
		uid 				= "sea_peoples_raze_prominence_egypt_miam",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence_hordes,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_miam_title",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_raze_prominence_egypt_miam_desc",
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
				type = "raze_region",
				region_key = "phar_main_north_nubia_miam",
			},
		}
	},
	{
		uid 				= "sea_peoples_raze_prominence_egypt_thebes",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence_hordes,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_egypt_thebes_title",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_raze_prominence_egypt_thebes_desc",
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
				type = "raze_region",
				region_key = "phar_main_thebes_thebes",
			},
		}
	},
	{
		uid 				= "sea_peoples_raze_prominence_canaan_ashkelon",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence_hordes,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_canaan_ashkelon_title",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_raze_prominence_canaan_ashkelon_desc",
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
				type = "raze_region",
				region_key = "phar_main_ashkelon_ashkelon",
			},
		}
	},
	{
		uid 				= "sea_peoples_raze_prominence_canaan_byblos",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence_hordes,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_canaan_byblos_title",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_raze_prominence_canaan_byblos_desc",
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
				type = "raze_region",
				region_key = "phar_main_tyre_byblos",
			},
		}
	},
	{
		uid 				= "sea_peoples_raze_prominence_canaan_carchemish",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence_hordes,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_canaan_carchemish_title",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_raze_prominence_canaan_carchemish_desc",
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
				type = "raze_region",
				region_key = "phar_main_carchemish_carchemish",
			},
		}
	},
	{
		uid 				= "sea_peoples_raze_prominence_canaan_damascus",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence_hordes,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_canaan_damascus_title",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_raze_prominence_canaan_damascus_desc",
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
				type = "raze_region",
				region_key = "phar_main_damascus_damascus",
			},
		}
	},
	{
		uid 				= "sea_peoples_raze_prominence_canaan_emar",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence_hordes,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_canaan_emar_title",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_raze_prominence_canaan_emar_desc",
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
				type = "raze_region",
				region_key = "phar_main_emar_emar",
			},
		}
	},
	{
		uid 				= "sea_peoples_raze_prominence_canaan_ugarit",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence_hordes,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_canaan_ugarit_title",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_raze_prominence_canaan_ugarit_desc",
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
				type = "raze_region",
				region_key = "phar_main_ugarit_ugarit",
			},
		}
	},
	{
		uid 				= "sea_peoples_raze_prominence_hatti_gordion",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence_hordes,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_hatti_gordion_title",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_raze_prominence_hatti_gordion_desc",
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
				type = "raze_region",
				region_key = "phar_main_west_hatti_gordion",
			},
		}
	},
	{
		uid 				= "sea_peoples_raze_prominence_hatti_hattussa",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence_hordes,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_hatti_hattussa_title",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_raze_prominence_hatti_hattussa_desc",
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
				type = "raze_region",
				region_key = "phar_main_hattussa_hattussa",
			},
		}
	},
	{
		uid 				= "sea_peoples_raze_prominence_hatti_tarhuntassa",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence_hordes,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_hatti_tarhuntassa_title",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_raze_prominence_hatti_tarhuntassa_desc",
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
				type = "raze_region",
				region_key = "phar_main_south_hatti_tarhuntassa",
			},
		}
	},
	{
		uid 				= "sea_peoples_raze_prominence_malidiya_malidiya",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence_hordes,
		title_key			= "campaign_localised_strings_string_phar_main_victory_objectives_common_conquest_prominence_malidiya_malidiya_title",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_raze_prominence_malidiya_malidiya_desc",
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
				type = "raze_region",
				region_key = "phar_main_malidiya_malidiya",
			},
		}
	},
	{
		uid 				= "sea_peoples_raze_prominence_mycenaeca_mycenae",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence_hordes,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_conquest_cult_center_mycenae_title",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_raze_prominence_aegea_mycenaeca_mycenae_desc",
		disable_progress_bar = true,	
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_mycenaeca_mycenae",
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_map_mycenaeca_mycenae"
			},
		}
	},
	{
		uid 				= "sea_peoples_raze_prominence_kretes_knossos",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence_hordes,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_conquest_cult_center_knossos_title",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_raze_prominence_aegea_kretes_knossos_desc",	
		disable_progress_bar = true,	
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_kretes_knossos",
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_map_kretes_knossos"
			},
		}
	},
	{
		uid 				= "sea_peoples_raze_prominence_ilion_troy",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence_hordes,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_conquest_cult_center_wilusa_title",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_raze_prominence_aegea_ilion_troy_desc",	
		disable_progress_bar = true,	
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_ilion_troy",
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_map_ilion_troy"
			},
		}
	},
	{
		uid 				= "sea_peoples_raze_prominence_sinticobisaltia_siris",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence_hordes,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_conquest_cult_center_siris_title",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_raze_prominence_aegea_sinticobisaltia_siris_desc",
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_sinticobisaltia_siris",
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_map_sinticobisaltia_siris"
			},
		}
	},
	{
		uid 				= "sea_peoples_raze_prominence_isthmos_cibyra",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence_hordes,
		title_key			= "regions_onscreen_phar_main_south_hatti_cibyra",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_raze_prominence_aegea_isthmos_cibyra_desc",
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_isthmos_cibyra",
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_map_isthmos_cibyra"
			},
		}
	},
	{
		uid 				= "sea_peoples_raze_prominence_aranzah_assur",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence_hordes,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_conquest_cult_center_assur_title",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_raze_prominence_mesopotamia_aranzah_assur_desc",
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_aranzah_assur",
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_map_aranzah_assur"
			},
		}
	},
	{
		uid 				= "sea_peoples_raze_prominence_bit_peri_amurru_dur_kurigalzu",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence_hordes,
		title_key			= "regions_onscreen_phar_map_bit_peri_amurru_dur_kurigalzu",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_raze_prominence_mesopotamia_bit_peri_amurru_dur_kurigalzu_desc",
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_bit_peri_amurru_dur_kurigalzu",
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_map_bit_peri_amurru_dur_kurigalzu"
			},
		}
	},
	{
		uid 				= "sea_peoples_raze_prominence_elam_susa",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence_hordes,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_conquest_cult_center_susa_title",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_raze_prominence_mesopotamia_elam_susa_desc",
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_northern_elam_susa",
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_map_northern_elam_susa"
			},
		}
	},
	{
		uid 				= "sea_peoples_raze_prominence_digirak_babylon",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence_hordes,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_conquest_cult_center_babylon_title",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_raze_prominence_mesopotamia_digirak_babylon_desc",
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_kan_digirak_babylon",
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_map_kan_digirak_babylon"
			},
		}
	},
	{
		uid 				= "sea_peoples_raze_prominence_ishtananu_nippur",
		vp_reward 			= 2,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_prominence_hordes,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_conquest_cult_center_nippur_title",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_sea_peoples_raze_prominence_mesopotamia_ishtananu_nippur_desc",
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "discover_any_region_of_list",
				region_keys =
				{
					"phar_map_karduniash_ishtananu_nippur",
				}
			},
		},
		completion_conditions = {
			{
				type = "raze_region",
				region_key = "phar_map_karduniash_ishtananu_nippur"
			},
		}
	},

	-------------------------------------------------------------
	-- FEATS - Feature-related Victory Objectives - Culture Restricted
	-------------------------------------------------------------

	{
		uid 				= "common_survive_sea_people_invasion",
		vp_reward 			= 10,
		restricted_to_cultures = victory_objectives_cultures_settled,
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
		restricted_to_cultures = victory_objectives_cultures_settled,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
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
		restricted_to_cultures = victory_objectives_cultures_horde,
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
		restricted_to_cultures = victory_objectives_cultures_settled,
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
		vp_reward 			= 1,
		restricted_to_cultures = victory_objectives_cultures_horde,
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
		vp_reward 			= 3,
		restricted_to_cultures = victory_objectives_cultures_horde,
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
		vp_reward 			= 5,
		restricted_to_cultures = victory_objectives_cultures_horde,
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
	{
		uid 				= "map_have_blade_or_dwelling_maxed_out",
		vp_reward 			= 3,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		restricted_to_cultures = victory_objectives_cultures_horde,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_feat_have_blade_or_dwelling_maxed_out_title",
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_feat_have_blade_or_dwelling_maxed_out_description",
		activation_conditions = {
			{
				type = "unlock_forge_path",
				path_name = "tribes_privileges"
			}
		},
		completion_conditions = {
			{
				type = "have_pooled_resource_amount",
				allowed_pooled_resources = { "phar_sea_blades_points", "phar_sea_dwelling_points" },
				absolute_value = true,
				sum_resources = false,
				amount = 300
			}
		}
	},

	-------------------------------------------------------------
	-- Special conquest VCs, common to all factions			
	-- "Special": design-wise, this is not part of the base 100 points required for conquest, but an extra
	-------------------------------------------------------------

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
		uid 				= "map_become_wanax_of_aegean",
		vp_reward 			= 10,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_feat_become_wanax_of_aegean_title",
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_feat_become_wanax_of_aegean_description",
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "choose_legitimacy_path",
				legitimacy_path = "aegean_legitimacy"
			}
		},
		completion_conditions = {
			{
				type = "maintain_be_ruler",
				legitimacy_path = "aegean_legitimacy",
				ui = {
					custom_description = "ui_text_replacements_localised_text_phar_map_victory_objectives_feat_become_wanax_of_aegean_objective"
				}
			}
		}
	},
	{
		uid 				= "map_become_king_of_mesopotamia",
		vp_reward 			= 10,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_feat_become_king_of_mesopotamia_title",
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_feat_become_king_of_mesopotamia_description",
		disable_progress_bar = true,
		activation_conditions = {
			{
				type = "choose_legitimacy_path",
				legitimacy_path = "meso_legitimacy"
			}
		},
		completion_conditions = {
			{
				type = "maintain_be_ruler",
				legitimacy_path = "meso_legitimacy",
				ui = {
					custom_description = "ui_text_replacements_localised_text_phar_map_victory_objectives_feat_become_king_of_mesopotamia_objective"
				}
			}
		}
	},
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
				amount = 601					--- Keep this at 601 min to exclude SEA Gods, which have a max of 800, so SEA gods can't activate this
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
				amount = 15
			}
		},
		completion_conditions = {
			{
				type = "have_amount_of_max_level_of_building_chain",
				building_chain_keys = { "phar_main_ers_monument_egyp" },
				check_max_level = true,
				amount = 25
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
				amount = 15
			}
		},
		completion_conditions = {
			{
				type = "have_amount_of_max_level_of_building_chain",
				building_chain_keys = { "phar_main_ers_monument_hitt" },
				check_max_level = true,
				amount = 25
			}
		}
	},
	{
		uid 				= "have_aegean_mounemnt_buildings",
		vp_reward 			= 3,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "campaign_localised_strings_string_phar_map_victory_objectives_have_aegean_mounemnt_buildings_title",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_have_aegean_mounemnt_buildings_desc",
		disable_bullet_points = true,
		activation_conditions = {
			{
				type = "have_amount_of_max_level_of_building_chain",
				building_chain_keys = { "phar_main_ers_monument_aeg" },
				check_max_level = true,
				amount = 15
			}
		},
		completion_conditions = {
			{
				type = "have_amount_of_max_level_of_building_chain",
				building_chain_keys = { "phar_main_ers_monument_aeg" },
				check_max_level = true,
				amount = 25
			}
		}
	},
	{
		uid 				= "have_mesopotamian_mounemnt_buildings",
		vp_reward 			= 3,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "campaign_localised_strings_string_phar_map_victory_objectives_have_meso_mounemnt_buildings_title",
		description_key		= "campaign_localised_strings_string_phar_map_victory_objectives_have_meso_mounemnt_buildings_desc",
		disable_bullet_points = true,
		activation_conditions = {
			{
				type = "have_amount_of_max_level_of_building_chain",
				building_chain_keys = { "phar_main_ers_monument_meso" },
				check_max_level = true,
				amount = 15
			}
		},
		completion_conditions = {
			{
				type = "have_amount_of_max_level_of_building_chain",
				building_chain_keys = { "phar_main_ers_monument_meso" },
				check_max_level = true,
				amount = 25
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
		vp_reward 			= 4,
		restricted_to_cultures = victory_objectives_cultures_horde,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_spend_turns_in_any_tribe_category_title",
		description_key		= "campaign_localised_strings_string_phar_sea_victory_objectives_sea_peoples_spend_turns_in_any_tribe_category_description",
		activation_conditions = {
			{
				type = "spend_turns_in_any_tribe_category",
				turns = 20
			}
		},
		completion_conditions = {
			{
				type = "spend_turns_in_any_tribe_category",
				turns = 60
			}
		}
	},
	{
		uid 				= "sea_peoples_construct_nuraghe_camps_or_peleset_villages",
		vp_reward 			= 6,
		restricted_to_cultures = victory_objectives_cultures_horde,
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
	-- NEW FEATS
	{
		uid 				= "map_muwatalli_gratitude_per_turn",
		vp_reward 			= 3,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_feat_muwatalli_gratitude_per_turn_title",
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_feat_muwatalli_gratitude_per_turn_description",
		disable_bullet_points = true,
		activation_conditions = {
			{
				type = "unlock_ancient_legacy",
				ancient_legacy_name = "phar_ancient_legacy_muwatalli"
			}
		},
		completion_conditions = {
			{
				type = "maintain_muwatalli_gratitude_per_turn",
				amount = 42,
			}
		}
	},
	{
		uid 				= "map_have_hammurabi_laws",
		vp_reward 			= 3,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_feat_hammurabi_hammurabi_laws_title",
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_feat_hammurabi_hammurabi_laws_description",
		disable_bullet_points = true,
		activation_conditions = {
			{
				type = "unlock_ancient_legacy",
				ancient_legacy_name = "phar_ancient_legacy_hammurabi"
			}
		},
		completion_conditions = {
			{
				type = "have_hammurabi_laws",
				amount = 10
			}
		}
	},
	{
		uid 				= "map_hatshepsut_cash_out_ancillary_or_effect_bundle",
		vp_reward 			= 3,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_feat_hatshepsut_cash_out_ancillary_or_effect_bundle_title",
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_feat_hatshepsut_cash_out_ancillary_or_effect_bundle_description",
		disable_bullet_points = true,
		activation_conditions = {
			{
				type = "unlock_ancient_legacy",
				ancient_legacy_name = "phar_ancient_legacy_hatshepsut"
			}
		},
		completion_conditions = {
			{
				type = "hatshepsut_cash_out_ancillary_or_effect_bundle",
				amount = 3
			}
		}
	},
	{
		uid 				= "map_atreus_spend_dominance",
		vp_reward 			= 3,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_feat_atreus_spend_dominance_title",
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_feat_atreus_spend_dominance_description",
		activation_conditions = {
			{
				type = "unlock_ancient_legacy",
				ancient_legacy_name = "phar_ancient_legacy_atreus",
			}
		},
		completion_conditions = {
			{
				type = "spend_pooled_resource_amount",
				pooled_resource_key = "troy_dominance",
				amount = 1000
			}
		}
	},
	{
		uid 				= "map_perseus_recruit_units",
		vp_reward 			= 3,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_feat_perseus_recruit_units_title",
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_feat_perseus_recruit_units_description",
		disable_bullet_points = true,
		activation_conditions = {
			{
				type = "unlock_ancient_legacy",
				ancient_legacy_name = "phar_ancient_legacy_perseus"
			}
		},
		completion_conditions = {
			{
				type = "recruit_units",
				amount = 30,
				is_global_recruitment = true,
			}
		}
	},
	{
		uid 				= "map_use_eminence_obedience",
		vp_reward 			= 3,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_feat_use_eminence_obedience_title",
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_feat_use_eminence_obedience_description",
		disable_bullet_points = true,
		activation_conditions = {
			{
				type = "unlock_forge_path",
				path_name = "eminence"
			}
		},
		completion_conditions = {
			{
				type = "use_eminence_obedience",
				amount = 1,
				is_cult_centre = true,
			}
		}
	},
	{
		uid 				= "map_maintain_equipped_ancillaries",
		vp_reward 			= 3,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_feat_maintain_equipped_ancillaries_title",
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_feat_maintain_equipped_ancillaries_description",
		disable_bullet_points = true,
		activation_conditions = {
			{
				type = "unlock_ancient_legacy",
				ancient_legacy_name = "phar_ancient_legacy_tudhaliya"
			}
		},
		completion_conditions = {
			{
				type = "maintain_equipped_ancillaries",
				ancillary_type = "phar_main_anc_prince_title",
				unique_ancillaries = true,
				amount = 3
			}
		}
	},
	{
		uid 				= "map_capture_settlements_with_thutmose_culmination",
		vp_reward 			= 3,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_feat_capture_settlements_with_thutmose_culmination_title",
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_feat_capture_settlements_with_thutmose_culmination_description",
		disable_bullet_points = true,
		activation_conditions = {
			{
				type = "unlock_ancient_legacy",
				ancient_legacy_name = "phar_ancient_legacy_thutmose"
			}
		},
		completion_conditions = {
			{
				type = "capture_settlements_with_thutmose_culmination",
				amount = 2
			}
		}
	},
	{
		uid 				= "map_complete_sargon_ambitions",
		vp_reward 			= 3,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_feat_complete_sargon_ambitions_title",
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_feat_complete_sargon_ambitions_description",
		disable_bullet_points = true,
		activation_conditions = {
			{
				type = "unlock_ancient_legacy",
				ancient_legacy_name = "phar_ancient_legacy_sargon"
			}
		},
		completion_conditions = {
			{
				type = "complete_ambitions",
				pool = "sargon_grand_ambitions",
				amount = 2
			}
		}
	},
	{
		uid 				= "map_equip_sargon_title",
		vp_reward 			= 5,
		category			= victory_objectives_ui_categories.victory_objectives_category_feats,
		title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_feat_equip_sargon_title_title",
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_feat_equip_sargon_title_description",
		disable_bullet_points = true,
		activation_conditions = {
			{
				type = "unlock_ancient_legacy",
				ancient_legacy_name = "phar_ancient_legacy_sargon"
			}
		},
		completion_conditions = {
			{
				type = "maintain_equipped_ancillaries",
				ancillary_type = "phar_main_anc_prince_title",
				unique_ancillaries = true,
				amount = 1
			}
		}
	},
}



-- ------------------------------------------------------------ TEMPLATES ------------------------------------------------------------
-- ___________________________________________________________________________________________________________________________________
-- -----------------------------------------------------------------------------------------------------------------------------------

--[[
-- Example template:

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

local conquest_province_cyclades = {
	vp_reward 			= 1,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_province_cyclades_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_province_cyclades_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_cyclades_naxos",
				"phar_map_cyclades_minoa",
				"phar_map_cyclades_melos",
				"phar_map_cyclades_andros",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_cyclades_naxos"
		},
		{
			type = "control_region",
			region_key = "phar_map_cyclades_minoa"
		},
		{
			type = "control_region",
			region_key = "phar_map_cyclades_melos"
		},
		{
			type = "control_region",
			region_key = "phar_map_cyclades_andros"
		},
	}
}

local conquest_province_lazpa = {
	vp_reward 			= 1,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_lazpa_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_lazpa_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_teythrania_volissos",
				"phar_map_teythrania_eressos",
				"phar_map_latmos_dolyche",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_teythrania_volissos"
		},
		{
			type = "control_region",
			region_key = "phar_map_teythrania_eressos"
		},
		{
			type = "control_region",
			region_key = "phar_map_latmos_dolyche"
		},
	}
}

local conquest_province_boreas_nesoi = {
	vp_reward 			= 1,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_province_boreas_nesoi_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_province_boreas_nesoi_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_zerynthia_nesoi_imbrasos",
				"phar_map_zerynthia_nesoi_myrina",
				"phar_map_zerynthia_nesoi_skyros",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_zerynthia_nesoi_imbrasos"
		},
		{
			type = "control_region",
			region_key = "phar_map_zerynthia_nesoi_myrina"
		},
		{
			type = "control_region",
			region_key = "phar_map_zerynthia_nesoi_skyros"
		},
	}
}

local conquest_province_cephallenia = {
	vp_reward 			= 1,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_province_cephallenia_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_province_cephallenia_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_cephallenia_hyrie",
				"phar_map_cephallenia_ithaca",
				"phar_map_cephallenia_lefcas",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_cephallenia_hyrie"
		},
		{
			type = "control_region",
			region_key = "phar_map_cephallenia_ithaca"
		},
		{
			type = "control_region",
			region_key = "phar_map_cephallenia_lefcas"
		},
	}
}

local conquest_province_northern_elam = {
	vp_reward 			= 2,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_province_northern_elam_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_province_northern_elam_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_northern_elam_kabnak",
				"phar_map_northern_elam_madaktu",
				"phar_map_northern_elam_pashime",
				"phar_map_northern_elam_susa",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_northern_elam_kabnak"
		},
		{
			type = "control_region",
			region_key = "phar_map_northern_elam_madaktu"
		},
		{
			type = "control_region",
			region_key = "phar_map_northern_elam_pashime"
		},
		{
			type = "control_region",
			region_key = "phar_map_northern_elam_susa"
		},
	}
}

-------------------------------------------------------------
-- AEGEAN - 
-------------------------------------------------------------

local conquest_province_peonia = {
	vp_reward 			= 1,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_province_peonia_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_peonia_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_almopia_apsalos",
				"phar_map_almopia_dion",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_almopia_apsalos"
		},
		{
			type = "control_region",
			region_key = "phar_map_almopia_dion"
		},
	}
}

local conquest_province_epirus = {
	vp_reward 			= 2,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_epirus_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_epirus_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_macedonia_arnissa",
				"phar_map_macedonia_cassope",
				"phar_map_macedonia_dolopeis",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_macedonia_arnissa"
		},
		{
			type = "control_region",
			region_key = "phar_map_macedonia_cassope"
		},
		{
			type = "control_region",
			region_key = "phar_map_macedonia_dolopeis"
		},
	}
}

local conquest_province_thessaly = {
	vp_reward 			= 2,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_thessaly_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_thessaly_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_aeolia_iolcos",
				"phar_map_aeolia_pharsalos",
				"phar_map_aeolia_pteleon",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_aeolia_iolcos"
		},
		{
			type = "control_region",
			region_key = "phar_map_aeolia_pharsalos"
		},
		{
			type = "control_region",
			region_key = "phar_map_aeolia_pteleon"
		},
	}
}

local conquest_province_attica = {
	vp_reward 			= 2,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_attica_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_attica_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_attica_athens",
				"phar_map_attica_carystos",
				"phar_map_attica_eretria",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_attica_athens"
		},
		{
			type = "control_region",
			region_key = "phar_map_attica_carystos"
		},
		{
			type = "control_region",
			region_key = "phar_map_attica_eretria"
		},
	}
}

local conquest_province_achaea = {
	vp_reward 			= 4,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_achaea_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_achaea_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_mycenaeca_aegion",
				"phar_map_mycenaeca_corinth",
				"phar_map_mycenaeca_mycenae",
				"phar_map_mycenaeca_tiryns",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_mycenaeca_aegion"
		},
		{
			type = "control_region",
			region_key = "phar_map_mycenaeca_corinth"
		},
		{
			type = "control_region",
			region_key = "phar_map_mycenaeca_mycenae"
		},
		{
			type = "control_region",
			region_key = "phar_map_mycenaeca_tiryns"
		},
	}
}

local conquest_province_aetolia = {
	vp_reward 			= 2,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_aetolia_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_aetolia_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_boeotia_calydon",
				"phar_map_boeotia_cyparissos",
				"phar_map_boeotia_thebes",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_boeotia_calydon"
		},
		{
			type = "control_region",
			region_key = "phar_map_boeotia_cyparissos"
		},
		{
			type = "control_region",
			region_key = "phar_map_boeotia_thebes"
		},
	}
}

local conquest_province_laconia = {
	vp_reward 			= 3,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_laconia_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_laconia_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_lacedaemon_altis",
				"phar_map_lacedaemon_cythera",
				"phar_map_lacedaemon_pylos",
				"phar_map_lacedaemon_sparta"
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_lacedaemon_altis"
		},
		{
			type = "control_region",
			region_key = "phar_map_lacedaemon_cythera"
		},
		{
			type = "control_region",
			region_key = "phar_map_lacedaemon_pylos"
		},
		{
			type = "control_region",
			region_key = "phar_map_lacedaemon_sparta"
		},
		
	}
}

local conquest_province_kaftiu = {
	vp_reward 			= 3,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_kaftiu_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_kaftiu_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_kretes_knossos",
				"phar_map_kretes_kydonia",
				"phar_map_kretes_phaestos",
				"phar_map_kretes_setaea"
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_kretes_knossos"
		},
		{
			type = "control_region",
			region_key = "phar_map_kretes_kydonia"
		},
		{
			type = "control_region",
			region_key = "phar_map_kretes_phaestos"
		},
		{
			type = "control_region",
			region_key = "phar_map_kretes_setaea"
		},
		
	}
}

local conquest_province_rhodes = {
	vp_reward 			= 2,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_rhodes_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_rhodes_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_rhodes_arcasia",
				"phar_map_rhodes_ialysos",
				"phar_map_rhodes_lindos",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_rhodes_arcasia"
		},
		{
			type = "control_region",
			region_key = "phar_map_rhodes_ialysos"
		},
		{
			type = "control_region",
			region_key = "phar_map_rhodes_lindos"
		},
	}
}

local conquest_province_lycia = {
	vp_reward 			= 3,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_lycia_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_lycia_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_parha_myra",
				"phar_map_lycia_peraia",
				"phar_map_lycia_phellos",
				"phar_map_lycia_telmessos"
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_parha_myra"
		},
		{
			type = "control_region",
			region_key = "phar_map_lycia_peraia"
		},
		{
			type = "control_region",
			region_key = "phar_map_lycia_phellos"
		},
		{
			type = "control_region",
			region_key = "phar_map_lycia_telmessos"
		},
		
	}
}

local conquest_province_caria = {
	vp_reward 			= 1,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_caria_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_caria_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_caria_halicarnassos",
				"phar_map_caria_knidos",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_caria_halicarnassos"
		},
		{
			type = "control_region",
			region_key = "phar_map_caria_knidos"
		},
	}
}

local conquest_province_isthmos = {
	vp_reward 			= 3,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_isthmos_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_isthmos_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_isthmos_cibyra",
				"phar_map_isthmos_kaunos",
				"phar_map_isthmos_mobolla",
				"phar_map_lycia_balbura"
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_isthmos_cibyra"
		},
		{
			type = "control_region",
			region_key = "phar_map_isthmos_kaunos"
		},
		{
			type = "control_region",
			region_key = "phar_map_isthmos_mobolla"
		},
		{
			type = "control_region",
			region_key = "phar_map_lycia_balbura"
		},
		
	}
}

local conquest_province_mira = {
	vp_reward 			= 3,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_mira_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_mira_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_maeonia_milethus",
				"phar_map_latmos_samos",
				"phar_map_maeonia_ephesos",
				"phar_map_maeonia_eyanthia",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_maeonia_milethus"
		},
		{
			type = "control_region",
			region_key = "phar_map_latmos_samos"
		},
		{
			type = "control_region",
			region_key = "phar_map_maeonia_ephesos"
		},
		{
			type = "control_region",
			region_key = "phar_map_maeonia_eyanthia"
		},
		
	}
}

local conquest_province_seha = {
	vp_reward 			= 2,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_seha_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_seha_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_maeonia_erythrae",
				"phar_map_teythrania_kyme",
				"phar_map_teythrania_pelopia",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_maeonia_erythrae"
		},
		{
			type = "control_region",
			region_key = "phar_map_teythrania_kyme"
		},
		{
			type = "control_region",
			region_key = "phar_map_teythrania_pelopia"
		},
	}
}

local conquest_province_wilusha = {
	vp_reward 			= 4,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_wilusha_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_wilusha_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_ilion_adresteia",
				"phar_map_ilion_percote",
				"phar_map_ilion_troy",
				"phar_map_ilion_zeleia"
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_ilion_adresteia"
		},
		{
			type = "control_region",
			region_key = "phar_map_ilion_percote"
		},
		{
			type = "control_region",
			region_key = "phar_map_ilion_troy"
		},
		{
			type = "control_region",
			region_key = "phar_map_ilion_zeleia"
		},
		
	}
}

-------------------------------------------------------------
-- AEGEAN - FOREIGN
-------------------------------------------------------------

local conquest_province_masha = {
	vp_reward 			= 2,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_province_masha_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_province_masha_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_hapalla_arowanna",
				"phar_map_hapalla_hapalla",
				"phar_map_hapalla_kalasma",
				"phar_map_hapalla_pitassa",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_hapalla_arowanna"
		},
		{
			type = "control_region",
			region_key = "phar_map_hapalla_hapalla"
		},
		{
			type = "control_region",
			region_key = "phar_map_hapalla_kalasma"
		},
		{
			type = "control_region",
			region_key = "phar_map_hapalla_pitassa"
		},
	}
}

local conquest_province_arzawa = {
	vp_reward 			= 2,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_province_arzawa_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_province_arzawa_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_kuwaliya_appawiya",
				"phar_map_kuwaliya_kuwaliya",
				"phar_map_kuwaliya_ninoe",
				"phar_map_kuwaliya_walna",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_kuwaliya_appawiya"
		},
		{
			type = "control_region",
			region_key = "phar_map_kuwaliya_kuwaliya"
		},
		{
			type = "control_region",
			region_key = "phar_map_kuwaliya_ninoe"
		},
		{
			type = "control_region",
			region_key = "phar_map_kuwaliya_walna"
		},
	}
}

local conquest_province_karkisha = {
	vp_reward 			= 1,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_province_karkisha_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_province_karkisha_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_bithynia_apollonia",
				"phar_map_bithynia_cythoros",
				"phar_map_bithynia_pylae",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_bithynia_apollonia"
		},
		{
			type = "control_region",
			region_key = "phar_map_bithynia_cythoros"
		},
		{
			type = "control_region",
			region_key = "phar_map_bithynia_pylae"
		},
	}
}

local conquest_province_thrace = {
	vp_reward 			= 2,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_province_thrace_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_province_thrace_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_zonaea_apsynthia",
				"phar_map_zonaea_ismaros",
				"phar_map_zonaea_sestos",
				"phar_map_zonaea_thasos",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_zonaea_apsynthia"
		},
		{
			type = "control_region",
			region_key = "phar_map_zonaea_ismaros"
		},
		{
			type = "control_region",
			region_key = "phar_map_zonaea_sestos"
		},
		{
			type = "control_region",
			region_key = "phar_map_zonaea_thasos"
		},
	}
}

local conquest_province_migdonia = {
	vp_reward 			= 1,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_province_mygdonia_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_foreign_province_mygdonia_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_sinticobisaltia_olophyxos",
				"phar_map_sinticobisaltia_scione",
				"phar_map_sinticobisaltia_siris",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_sinticobisaltia_olophyxos"
		},
		{
			type = "control_region",
			region_key = "phar_map_sinticobisaltia_scione"
		},
		{
			type = "control_region",
			region_key = "phar_map_sinticobisaltia_siris"
		},
	}
}

local conquest_province_thynia = {
	vp_reward 			= 1,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_thynia_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_thynia_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_thynia_athyra",
				"phar_map_thynia_salmydessos",
				"phar_map_thynia_sipte",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_thynia_athyra"
		},
		{
			type = "control_region",
			region_key = "phar_map_thynia_salmydessos"
		},
		{
			type = "control_region",
			region_key = "phar_map_thynia_sipte"
		},
	}
}

-------------------------------------------------------------
-- MESOPOTAMIA - HOMELAND
-------------------------------------------------------------

local conquest_province_azalzi = {
	vp_reward 			= 4,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_azalzi_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_azalzi_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_azalzi_amasakku",
				"phar_map_azalzi_kahat",
				"phar_map_azalzi_shudu",
				"phar_map_azalzi_zakhiku",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_azalzi_amasakku"
		},
		{
			type = "control_region",
			region_key = "phar_map_azalzi_kahat"
		},
		{
			type = "control_region",
			region_key = "phar_map_azalzi_shudu"
		},
		{
			type = "control_region",
			region_key = "phar_map_azalzi_zakhiku"
		},
	}
}

local conquest_province_hanigalbat = {
	vp_reward 			= 4,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_hanigalbat_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_hanigalbat_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_hanigalbat_dur_katlimmu",
				"phar_map_hanigalbat_sangaritu",
				"phar_map_hanigalbat_shadikanni",
				"phar_map_hanigalbat_washukanni",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_hanigalbat_dur_katlimmu"
		},
		{
			type = "control_region",
			region_key = "phar_map_hanigalbat_sangaritu"
		},
		{
			type = "control_region",
			region_key = "phar_map_hanigalbat_shadikanni"
		},
		{
			type = "control_region",
			region_key = "phar_map_hanigalbat_washukanni"
		},
	}
}

local conquest_province_mari = {
	vp_reward 			= 4,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_mari_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_mari_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_mari_duara",
				"phar_map_mari_mari",
				"phar_map_mari_supru",
				"phar_map_mari_terqa",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_mari_duara"
		},
		{
			type = "control_region",
			region_key = "phar_map_mari_mari"
		},
		{
			type = "control_region",
			region_key = "phar_map_mari_supru"
		},
		{
			type = "control_region",
			region_key = "phar_map_mari_terqa"
		},
	}
}

local conquest_province_aranzah = {
	vp_reward 			= 4,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_aranzah_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_aranzah_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_aranzah_assur",
				"phar_map_aranzah_karana",
				"phar_map_aranzah_nimrud",
				"phar_map_aranzah_nineveh",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_aranzah_assur"
		},
		{
			type = "control_region",
			region_key = "phar_map_aranzah_karana"
		},
		{
			type = "control_region",
			region_key = "phar_map_aranzah_nimrud"
		},
		{
			type = "control_region",
			region_key = "phar_map_aranzah_nineveh"
		},
	}
}

local conquest_province_suhum_shaplu = {
	vp_reward 			= 3,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_suhum_shaplu_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_suhum_shaplu_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_suhum_shaplu_idu",
				"phar_map_suhum_shaplu_rapiku",
				"phar_map_suhum_shaplu_sippar_amnamun",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_suhum_shaplu_idu"
		},
		{
			type = "control_region",
			region_key = "phar_map_suhum_shaplu_rapiku"
		},
		{
			type = "control_region",
			region_key = "phar_map_suhum_shaplu_sippar_amnamun"
		},
	}
}

local conquest_province_radanu = {
	vp_reward 			= 3,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_radanu_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_radanu_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_radanu_admannu",
				"phar_map_radanu_arrapha",
				"phar_map_radanu_lubdu",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_radanu_admannu"
		},
		{
			type = "control_region",
			region_key = "phar_map_radanu_arrapha"
		},
		{
			type = "control_region",
			region_key = "phar_map_radanu_lubdu"
		},
	}
}

local conquest_province_bit_peri_amurru = {
	vp_reward 			= 3,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_amurru_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_amurru_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_bit_peri_amurru_agade",
				"phar_map_bit_peri_amurru_dur_kurigalzu",
				"phar_map_bit_peri_amurru_sur_marrati",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_bit_peri_amurru_agade"
		},
		{
			type = "control_region",
			region_key = "phar_map_bit_peri_amurru_dur_kurigalzu"
		},
		{
			type = "control_region",
			region_key = "phar_map_bit_peri_amurru_sur_marrati"
		},
	}
}

local conquest_province_ashnunnak = {
	vp_reward 			= 4,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_ashnunnak_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_ashnunnak_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_ashnunnak_der",
				"phar_map_ashnunnak_diniktum",
				"phar_map_ashnunnak_eshnunna",
				"phar_map_ashnunnak_tutub",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_ashnunnak_der"
		},
		{
			type = "control_region",
			region_key = "phar_map_ashnunnak_diniktum"
		},
		{
			type = "control_region",
			region_key = "phar_map_ashnunnak_eshnunna"
		},
		{
			type = "control_region",
			region_key = "phar_map_ashnunnak_tutub"
		},
	}
}

local conquest_province_kan_digirak = {
	vp_reward 			= 2,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_kan_digirak_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_kan_digirak_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_kan_digirak_babylon",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_kan_digirak_babylon"
		},
	}
}

local conquest_province_karduniash_shutaiu = {
	vp_reward 			= 3,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_karduniash_shutaiu_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_karduniash_shutaiu_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_karduniash_shutaiu_borsippa",
				"phar_map_karduniash_shutaiu_ur",
				"phar_map_karduniash_shutaiu_uruk",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_karduniash_shutaiu_borsippa"
		},
		{
			type = "control_region",
			region_key = "phar_map_karduniash_shutaiu_ur"
		},
		{
			type = "control_region",
			region_key = "phar_map_karduniash_shutaiu_uruk"
		},
	}
}

local conquest_province_karduniash_ishtananu = {
	vp_reward 			= 4,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_karduniash_ishtananu_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_karduniash_ishtananu_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_karduniash_ishtananu_lagash",
				"phar_map_karduniash_ishtananu_larak",
				"phar_map_karduniash_ishtananu_malgu",
				"phar_map_karduniash_ishtananu_nippur",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_karduniash_ishtananu_lagash"
		},
		{
			type = "control_region",
			region_key = "phar_map_karduniash_ishtananu_larak"
		},
		{
			type = "control_region",
			region_key = "phar_map_karduniash_ishtananu_malgu"
		},
		{
			type = "control_region",
			region_key = "phar_map_karduniash_ishtananu_nippur"
		},
	}
}

-------------------------------------------------------------
-- MESOPOTAMIA - FOREIGN
-------------------------------------------------------------

local conquest_province_suhum_elu = {
	vp_reward 			= 1,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_suhum_elu_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_suhum_elu_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_suhum_elu_anat",
				"phar_map_suhum_elu_haradu",
				"phar_map_suhum_elu_sapiratum",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_suhum_elu_anat"
		},
		{
			type = "control_region",
			region_key = "phar_map_suhum_elu_haradu"
		},
		{
			type = "control_region",
			region_key = "phar_map_suhum_elu_sapiratum"
		},
	}
}

local conquest_province_qutu = {
	vp_reward 			= 2,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_qutu_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_qutu_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_qutu_atlila",
				"phar_map_qutu_halman",
				"phar_map_qutu_nisir",
				"phar_map_qutu_tumma",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_qutu_atlila"
		},
		{
			type = "control_region",
			region_key = "phar_map_qutu_halman"
		},
		{
			type = "control_region",
			region_key = "phar_map_qutu_nisir"
		},
		{
			type = "control_region",
			region_key = "phar_map_qutu_tumma"
		},
	}
}

local conquest_province_zabu = {
	vp_reward 			= 1,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_zabu_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_zabu_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_zabu_kilizi",
				"phar_map_zabu_sussara",
				"phar_map_zabu_urbilim",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_zabu_kilizi"
		},
		{
			type = "control_region",
			region_key = "phar_map_zabu_sussara"
		},
		{
			type = "control_region",
			region_key = "phar_map_zabu_urbilim"
		},
	}
}

local conquest_province_uruatri = {
	vp_reward 			= 1,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_uruatri_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_uruatri_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_uruatri_musasir",
				"phar_map_uruatri_tuali",
				"phar_map_uruatri_tuspa",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_uruatri_musasir"
		},
		{
			type = "control_region",
			region_key = "phar_map_uruatri_tuali"
		},
		{
			type = "control_region",
			region_key = "phar_map_uruatri_tuspa"
		},
	}
}

local conquest_province_kadmuhu = {
	vp_reward 			= 2,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_kadmuhu_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_kadmuhu_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_kadmuhu_kindari",
				"phar_map_kadmuhu_mardama",
				"phar_map_kadmuhu_shibaniba",
				"phar_map_kadmuhu_tushhap",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_kadmuhu_kindari"
		},
		{
			type = "control_region",
			region_key = "phar_map_kadmuhu_mardama"
		},
		{
			type = "control_region",
			region_key = "phar_map_kadmuhu_shibaniba"
		},
		{
			type = "control_region",
			region_key = "phar_map_kadmuhu_tushhap"
		},
	}
}

local conquest_province_hayasa_azzi = {
	vp_reward 			= 1,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_hayasa_azzi_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_hayasa_azzi_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_hayasa_azzi_aripsha",
				"phar_map_hayasa_azzi_hayasha",
				"phar_map_hayasa_azzi_upumu",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_hayasa_azzi_aripsha"
		},
		{
			type = "control_region",
			region_key = "phar_map_hayasa_azzi_hayasha"
		},
		{
			type = "control_region",
			region_key = "phar_map_hayasa_azzi_upumu"
		},
	}
}

local conquest_province_ashtata = {
	vp_reward 			= 2,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_ashtata_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_ashtata_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_ashtata_apane",
				"phar_map_ashtata_ashimon",
				"phar_map_ashtata_bukushe",
				"phar_map_ashtata_tuttul",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_ashtata_apane"
		},
		{
			type = "control_region",
			region_key = "phar_map_ashtata_ashimon"
		},
		{
			type = "control_region",
			region_key = "phar_map_ashtata_bukushe"
		},
		{
			type = "control_region",
			region_key = "phar_map_ashtata_tuttul"
		},
	}
}

local conquest_province_balihu = {
	vp_reward 			= 2,
	category			= victory_objectives_ui_categories.victory_objectives_category_conquests,
	sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,	
	title_key			= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_balihu_title",
	description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_balihu_desc",
	activation_conditions = {
		{
			type = "discover_any_region_of_list",
			region_keys =
			{
				"phar_map_balihu_eluhat",
				"phar_map_balihu_harbe",
				"phar_map_balihu_irridu",
				"phar_map_balihu_zalpah",
			}
		},
	},
	completion_conditions = {
		{
			type = "control_region",
			region_key = "phar_map_balihu_eluhat"
		},
		{
			type = "control_region",
			region_key = "phar_map_balihu_harbe"
		},
		{
			type = "control_region",
			region_key = "phar_map_balihu_irridu"
		},
		{
			type = "control_region",
			region_key = "phar_map_balihu_zalpah"
		},
	}
}

-- ------------------------------------------------------- TEMPLATE INSTANCES --------------------------------------------------------
-- ___________________________________________________________________________________________________________________________________
-- -----------------------------------------------------------------------------------------------------------------------------------

victory_objectives_template_instances = {
	
	--[[
	--Example template instance
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


	-------------------------------------------------------------
	-- Homeland conquest-related VCs from Egyptian point of view
	-------------------------------------------------------------
	
	-------------------------------------------------------------
	-- CONQUEST - FOREIGN - MIXED
	-------------------------------------------------------------
	
	{
		template = conquest_province_northern_elam,
		uid			= "egyptian_conquest_foreign_province_northern_elam",
		restricted_to_cultures = victory_objectives_cultures_settled_excluding_akkad
	},

	-------------------------------------------------------------
	-- Homeland conquest-related VCs from Aegeans point of view
	-------------------------------------------------------------
	
	{
		template = conquest_province_peonia,
		uid			= "aegean_conquest_homeland_province_peonia",
		restricted_to_cultures = { "troy_main_clt_danaans", "troy_main_clt_trojans", "troy_rem_clt_thraco_phrygians" },
	},
	{
		template = conquest_province_epirus,
		uid			= "aegean_conquest_homeland_province_epirus",
		restricted_to_cultures = { "troy_main_clt_danaans", "troy_main_clt_trojans", "troy_rem_clt_thraco_phrygians" },
	},
	{
		template = conquest_province_thessaly,
		uid			= "aegean_conquest_homeland_province_thessaly",
		restricted_to_cultures = { "troy_main_clt_danaans", "troy_main_clt_trojans", "troy_rem_clt_thraco_phrygians" },
	},
	{
		template = conquest_province_attica,
		uid			= "aegean_conquest_homeland_province_attica",
		restricted_to_cultures = { "troy_main_clt_danaans", "troy_main_clt_trojans", "troy_rem_clt_thraco_phrygians" },
	},
	{
		template = conquest_province_achaea,
		uid			= "aegean_conquest_homeland_province_achaea",
		restricted_to_cultures = { "troy_main_clt_danaans", "troy_main_clt_trojans", "troy_rem_clt_thraco_phrygians" },
	},
	{
		template = conquest_province_aetolia,
		uid			= "aegean_conquest_homeland_province_aetolia",
		restricted_to_cultures = { "troy_main_clt_danaans", "troy_main_clt_trojans", "troy_rem_clt_thraco_phrygians" },
	},
	{
		template = conquest_province_laconia,
		uid			= "aegean_conquest_homeland_province_laconia",
		restricted_to_cultures = { "troy_main_clt_danaans", "troy_main_clt_trojans", "troy_rem_clt_thraco_phrygians" },
	},
	{
		template = conquest_province_cephallenia,
		uid			= "aegean_conquest_homeland_province_cephallenia",
		restricted_to_cultures = { "troy_main_clt_danaans", "troy_main_clt_trojans", "troy_rem_clt_thraco_phrygians" },
		vp_reward 	= 2,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_cephallenia_desc",
	},
	{
		template = conquest_province_cyclades,
		uid			= "aegean_conquest_homeland_province_cyclades",
		restricted_to_cultures = { "troy_main_clt_danaans", "troy_main_clt_trojans", "troy_rem_clt_thraco_phrygians" },
		vp_reward 	= 3,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_cyclades_desc",
	},
	{
		template = conquest_province_lazpa,
		uid			= "aegean_conquest_foreign_province_lazpa",
		restricted_to_cultures = { "troy_main_clt_danaans", "troy_main_clt_trojans", "troy_rem_clt_thraco_phrygians" },
		vp_reward 	= 2,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_foreignlands,
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_lazpa_desc",
	},
	{
		template = conquest_province_kaftiu,
		uid			= "aegean_conquest_homeland_province_kaftiu",
		restricted_to_cultures = { "troy_main_clt_danaans", "troy_main_clt_trojans", "troy_rem_clt_thraco_phrygians" },
	},
	{
		template = conquest_province_boreas_nesoi,
		uid			= "aegean_conquest_homeland_province_boreas_nesoi",
		restricted_to_cultures = { "troy_main_clt_danaans", "troy_main_clt_trojans", "troy_rem_clt_thraco_phrygians" },
		vp_reward 	= 2,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_boreas_nesoi_desc",
	},
	{
		template = conquest_province_rhodes,
		uid			= "aegean_conquest_homeland_province_rhodes",
		restricted_to_cultures = { "troy_main_clt_danaans", "troy_main_clt_trojans", "troy_rem_clt_thraco_phrygians" },
	},
	{
		template = conquest_province_lycia,
		uid			= "aegean_conquest_homeland_province_lycia",
		restricted_to_cultures = { "troy_main_clt_danaans", "troy_main_clt_trojans", "troy_rem_clt_thraco_phrygians" },
	},
	{
		template = conquest_province_caria,
		uid			= "aegean_conquest_homeland_province_caria",
		restricted_to_cultures = { "troy_main_clt_danaans", "troy_main_clt_trojans", "troy_rem_clt_thraco_phrygians" },
	},
	{
		template = conquest_province_isthmos,
		uid			= "aegean_conquest_homeland_province_isthmos",
		restricted_to_cultures = { "troy_main_clt_danaans", "troy_main_clt_trojans", "troy_rem_clt_thraco_phrygians" },
	},
	{
		template = conquest_province_mira,
		uid			= "aegean_conquest_homeland_province_mira",
		restricted_to_cultures = { "troy_main_clt_danaans", "troy_main_clt_trojans", "troy_rem_clt_thraco_phrygians" },
	},
	{
		template = conquest_province_seha,
		uid			= "aegean_conquest_homeland_province_seha",
		restricted_to_cultures = { "troy_main_clt_danaans", "troy_main_clt_trojans", "troy_rem_clt_thraco_phrygians" },
	},
	{
		template = conquest_province_wilusha,
		uid			= "aegean_conquest_homeland_province_wilusha",
		restricted_to_cultures = { "troy_main_clt_danaans", "troy_main_clt_trojans", "troy_rem_clt_thraco_phrygians" },
	},
	{
		template = conquest_province_migdonia,
		uid			= "aegean_conquest_homeland_province_migdonia",
		restricted_to_cultures = { "troy_main_clt_danaans", "troy_main_clt_trojans", "troy_rem_clt_thraco_phrygians" },
	},
	{
		template = conquest_province_thrace,
		uid			= "aegean_conquest_homeland_province_thrace",
		restricted_to_cultures = { "troy_main_clt_danaans", "troy_main_clt_trojans", "troy_rem_clt_thraco_phrygians" },
	},
	{
		template = conquest_province_thynia,
		uid			= "aegean_conquest_homeland_province_thynia",
		restricted_to_cultures = { "troy_main_clt_danaans", "troy_main_clt_trojans", "troy_rem_clt_thraco_phrygians" },
	},
	
	-------------------------------------------------------------
	-- Foreign conquest-related VCs from Aegeans point of view
	-------------------------------------------------------------
	
	{
		template = conquest_province_arzawa,
		uid			= "aegean_conquest_foreign_province_arzawa",
		restricted_to_cultures = { "troy_main_clt_danaans", "troy_main_clt_trojans", "troy_rem_clt_thraco_phrygians" },
	},
	{
		template = conquest_province_karkisha,
		uid			= "aegean_conquest_foreign_province_karkisha",
		restricted_to_cultures = { "troy_main_clt_danaans", "troy_main_clt_trojans", "troy_rem_clt_thraco_phrygians" },
	},
	{
		template = conquest_province_masha,
		uid			= "aegean_conquest_foreign_province_masha",
		restricted_to_cultures = { "troy_main_clt_danaans", "troy_main_clt_trojans", "troy_rem_clt_thraco_phrygians" },
	},

	-------------------------------------------------------------
	-- Homeland conquest-related VCs from Akkadians point of view
	-------------------------------------------------------------
	{
		template = conquest_province_northern_elam,
		uid			= "akkad_conquest_province_northern_elam",
		restricted_to_cultures = { "phar_map_clt_mesopotamian" },
		vp_reward 	= 3,
		sub_category		= victory_objectives_ui_categories.victory_objectives_subcategory_homelands,
		description_key		= "ui_text_replacements_localised_text_phar_map_victory_objectives_aegean_conquest_homeland_province_northern_elam_desc",
	},
	{
		template = conquest_province_azalzi,
		uid			= "akkad_conquest_province_azalzi",
		restricted_to_cultures = { "phar_map_clt_mesopotamian" }
	},
	{
		template = conquest_province_hanigalbat,
		uid			= "akkad_conquest_province_hanigalbat",
		restricted_to_cultures = { "phar_map_clt_mesopotamian" }
	},
	{
		template = conquest_province_mari,
		uid			= "akkad_conquest_province_mari",
		restricted_to_cultures = { "phar_map_clt_mesopotamian" }
	},
	{
		template = conquest_province_aranzah,
		uid			= "akkad_conquest_province_aranzah",
		restricted_to_cultures = { "phar_map_clt_mesopotamian" }
	},
	{
		template = conquest_province_suhum_elu,
		uid			= "akkad_conquest_province_suhum_elu",
		restricted_to_cultures = { "phar_map_clt_mesopotamian" }
	},
	{
		template = conquest_province_suhum_shaplu,
		uid			= "akkad_conquest_province_suhum_shaplu",
		restricted_to_cultures = { "phar_map_clt_mesopotamian" }
	},
	{
		template = conquest_province_radanu,
		uid			= "akkad_conquest_province_radanu",
		restricted_to_cultures = { "phar_map_clt_mesopotamian" }
	},
	{
		template = conquest_province_bit_peri_amurru,
		uid			= "akkad_conquest_province_bit_peri_amurru",
		restricted_to_cultures = { "phar_map_clt_mesopotamian" }
	},
	{
		template = conquest_province_ashnunnak,
		uid			= "akkad_conquest_province_ashnunnak",
		restricted_to_cultures = { "phar_map_clt_mesopotamian" }
	},
	{
		template = conquest_province_kan_digirak,
		uid			= "akkad_conquest_province_kan_digirak",
		restricted_to_cultures = { "phar_map_clt_mesopotamian" }
	},
	{
		template = conquest_province_karduniash_shutaiu,
		uid			= "akkad_conquest_province_karduniash_shutaiu",
		restricted_to_cultures = { "phar_map_clt_mesopotamian" }
	},
	{
		template = conquest_province_karduniash_ishtananu,
		uid			= "akkad_conquest_province_karduniash_ishtananu",
		restricted_to_cultures = { "phar_map_clt_mesopotamian" }
	},
	{
		template = conquest_province_qutu,
		uid			= "akkad_conquest_province_qutu",
		restricted_to_cultures = { "phar_map_clt_mesopotamian" }
	},
	{
		template = conquest_province_zabu,
		uid			= "akkad_conquest_province_zabu",
		restricted_to_cultures = { "phar_map_clt_mesopotamian" }
	},
	{
		template = conquest_province_uruatri,
		uid			= "akkad_conquest_province_uruatri,",
		restricted_to_cultures = { "phar_map_clt_mesopotamian" }
	},
	{
		template = conquest_province_kadmuhu,
		uid			= "akkad_conquest_province_kadmuhu",
		restricted_to_cultures = { "phar_map_clt_mesopotamian" }
	},
	{
		template = conquest_province_hayasa_azzi,
		uid			= "akkad_conquest_province_hayasa_azzi",
		restricted_to_cultures = { "phar_map_clt_mesopotamian" }
	},
	{
		template = conquest_province_ashtata,
		uid			= "akkad_conquest_province_ashtata",
		restricted_to_cultures = { "phar_map_clt_mesopotamian" }
	},
	{
		template = conquest_province_balihu,
		uid			= "akkad_conquest_province_balihu",
		restricted_to_cultures = { "phar_map_clt_mesopotamian" }
	},
}