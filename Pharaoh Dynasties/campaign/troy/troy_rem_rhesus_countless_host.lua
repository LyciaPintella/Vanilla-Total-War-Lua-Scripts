out("Loading troy_rem_rhesus_countless_host.lua")

countless_host = {}
countless_host.faction_key = "troy_rem_trj_thrace"
countless_host.vo_event = "campaign_vo_cs_rem_rhesus_fm_countless_hosts"
countless_host.army_effect_bundle = "troy_rem_rhesus_countless_host_army"
countless_host.character_effect_bundle = "troy_rem_rhesus_countless_host_character"

-- The max armies you can have at the start of the game
countless_host.max_armies = 0
countless_host.current_max_armies = 0

-- On what amount of forest regions to increase the max armies number
countless_host.max_armies_upgrade_region_requirement = {
	-- The UI tooltip is split into 2 effect bundles, that's why there's a list here
	{ 1, {"troy_rem_rhesus_countless_host_tier_1", "troy_rem_rhesus_countless_host_tier_1_percents" }},
	{ 2, {"troy_rem_rhesus_countless_host_tier_2", "troy_rem_rhesus_countless_host_tier_2_percents" }},
	{ 5, {"troy_rem_rhesus_countless_host_tier_3", "troy_rem_rhesus_countless_host_tier_3_percents" }},
	{ 10, {"troy_rem_rhesus_countless_host_tier_4", "troy_rem_rhesus_countless_host_tier_4_percents" }},
	{ 15, {"troy_rem_rhesus_countless_host_tier_5", "troy_rem_rhesus_countless_host_tier_5_percents" }},
	{ 20, {"troy_rem_rhesus_countless_host_tier_6", "troy_rem_rhesus_countless_host_tier_6_percents" }},
}

-- Cooldown between army summons
countless_host.host_army_summ_cooldown = 5

-- Resource costs for the armies
countless_host.host_army_summon_resource_cost = {
	{ "troy_food", 4000 },
	{ "troy_rem_rhesos_devotion", 10 },
}
countless_host.resource_factor_key = "troy_resource_factor_faction"

-- Units that can be recruited in an army
countless_host.recruitable_units = {
	{
		key = "troy_rem_thr_highland_tribesmen",
		cap = 6,
	},
	{
		key = "troy_rem_thr_highland_raiders",
		cap = 8,
	},
	{
		key = "troy_rem_thr_highland_warriors",
		cap = 8,
	},
	{
		key = "troy_rem_thr_highland_javelinmen",
		cap = 10,
	},
	{
		key = "troy_rem_thr_highland_archers",
		cap = 10,
	}
}

countless_host.generals = {
	{
		unit_key = "troy_rem_thr_rhes_sons_of_strymon1", -- Needed to display the unit card in the UI
		character_type_key = "general", -- Should be left "general"
		character_subtype_key = "troy_rem_thr_res_sons_of_strymon1",
		names = {
			{
				forename_key = "names_name_1300535143",
				-- The bellow 3 are not required, will be assumed "" if missing
				clanname_key = "",
				surname_key = "",
				other_name_key = "", -- Currently unused by the cm:create_force_with_general function and should be a blank string as per the episodic scripting documentation
			},
			{
				forename_key = "names_name_25081812",
			},
			{
				forename_key = "names_name_525584059",
			},
		}
	},
	{
		unit_key = "troy_rem_thr_rhes_sons_of_strymon2", -- Needed to display the unit card in the UI
		character_type_key = "general", -- Should be left "general"
		character_subtype_key = "troy_rem_thr_res_sons_of_strymon2",
		names = {
			{
				forename_key = "names_name_1392434288",
			},
			{
				forename_key = "names_name_845504392",
			},
			{
				forename_key = "names_name_1906308371",
			},
		}
	},
	{
		unit_key = "troy_rem_thr_rhes_sons_of_strymon3", -- Needed to display the unit card in the UI
		character_type_key = "general", -- Should be left "general"
		character_subtype_key = "troy_rem_thr_res_sons_of_strymon3",
		names = {
			{
				forename_key = "names_name_1551370602",
			},
			{
				forename_key = "names_name_1892784834",
			},
			{
				forename_key = "names_name_279519969",
			},
		}
	},
	{
		unit_key = "troy_rem_thr_rhes_sons_of_strymon4", -- Needed to display the unit card in the UI
		character_type_key = "general", -- Should be left "general"
		character_subtype_key = "troy_rem_thr_res_sons_of_strymon4",
		names = {
			{
				forename_key = "names_name_1611708444",
			},
			{
				forename_key = "names_name_1393813321",
			},
			{
				forename_key = "names_name_24480153",
			},
		}
	},
	{
		unit_key = "troy_rem_thr_rhes_sons_of_strymon5", -- Needed to display the unit card in the UI
		character_type_key = "general", -- Should be left "general"
		character_subtype_key = "troy_rem_thr_res_sons_of_strymon5",
		names = {
			{
				forename_key = "names_name_1722804225",
			},
			{
				forename_key = "names_name_1533604598",
			},
			{
				forename_key = "names_name_752057696",
			},
		}
	},
	{
		unit_key = "troy_rem_thr_rhes_sons_of_strymon6", -- Needed to display the unit card in the UI
		character_type_key = "general", -- Should be left "general"
		character_subtype_key = "troy_rem_thr_res_sons_of_strymon6",
		names = {
			{
				forename_key = "names_name_1790599227",
			},
			{
				forename_key = "names_name_1305323723",
			},
			{
				forename_key = "names_name_1876691378",
			},
		}
	},
}

-- table to include any subtypes used for host armies gained not via the normal mechanic.
countless_host.unique_generals_subtypes = {
	"troy_rem_thr_res_sons_of_strymon_sons_of_the_fallen",
}

-- Countless host general constructor for other modules
countless_host.new_general = function(unit_key, character_type_key, character_subtype_key, forename_key, clanname_key, surname_key, other_name_key)
	return {
		unit_key = unit_key,
		character_type_key = character_type_key,
		character_subtype_key = character_subtype_key,
		names = {
			{
				forename_key = forename_key,
				clanname_key = clanname_key,
				surname_key = surname_key,
				other_name_key = other_name_key
			},
		}
	}
end

countless_host.forest_regions = {
	{ key = "troy_main_sintice_berge",             x = 323, y = 595, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_berge" },
	{ key = "troy_main_epirus_dodona",             x = 148, y = 463, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_dodona" },
	{ key = "troy_main_bythynia_procerastis",      x = 739, y = 669, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_procerastis" },
	{ key = "troy_main_madares_kissamos",          x = 406, y = 082, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_kissamos" },
	{ key = "troy_main_isthmos_kaunos",            x = 763, y = 272, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_kaunos" },
	{ key = "troy_main_mycenaeca_stymphalos",      x = 295, y = 313, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_stymphalos" },
	{ key = "troy_main_euboea_chalcis",            x = 374, y = 380, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_chalcis" },
	{ key = "troy_main_almopia_ioron",             x = 304, y = 610, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_ioron" },
	{ key = "troy_main_dardania_arisbe",           x = 572, y = 555, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_arisbe" },
	{ key = "troy_main_bythynia_chele",            x = 832, y = 700, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_chele" },
	{ key = "troy_main_apaesos_priapos",           x = 621, y = 581, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_priapos" },
	{ key = "troy_main_cyclades_ios",              x = 525, y = 216, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_ios" },
	{ key = "troy_main_cephisos_opous",            x = 320, y = 378, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_opous" },
	{ key = "troy_main_kaystros_claros",           x = 632, y = 373, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_claros" },
	{ key = "troy_main_edonis_antissara",          x = 387, y = 615, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_antissara" },
	{ key = "troy_main_thynia_derkos",             x = 703, y = 683, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_derkos" },
	{ key = "troy_main_erythraea_clazomenai",      x = 606, y = 382, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_clazomenai" },
	{ key = "troy_main_borreas_kypasis",           x = 600, y = 622, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_kypasis" },
	{ key = "troy_main_zonaea_apsynthia",          x = 588, y = 638, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_apsynthia" },
	{ key = "troy_main_argolis_erchomenos",        x = 292, y = 286, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_erchomenos" },
	{ key = "troy_main_ozolian_locris_cyparissos", x = 288, y = 352, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_cyparissos" },
	{ key = "troy_main_caria_alinda",              x = 712, y = 322, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_alinda" },
	{ key = "troy_main_epirus_tekmon",             x = 154, y = 437, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_tekmon" },
	{ key = "troy_main_maeonia_thyaira",           x = 677, y = 376, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_thyaira" },
	{ key = "troy_main_thessaliotis_arne",         x = 228, y = 440, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_arne" },
	{ key = "troy_main_phthia_alos",               x = 287, y = 429, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_alos" },
	{ key = "troy_main_epagris_hydroessa",         x = 504, y = 304, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_hydroessa" },
	{ key = "troy_main_lacedaemon_cythera",        x = 347, y = 155, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_cythera" },
	{ key = "troy_main_thrace_zerynthos",          x = 511, y = 623, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_zerynthos" },
	{ key = "troy_main_lasynthos_lato",            x = 574, y = 86,  army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_lato" },
	{ key = "troy_main_aega_pedasos",              x = 615, y = 498, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_pedasos" },
	{ key = "troy_main_elis_myrsinos",             x = 212, y = 300, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_myrsinos" },
	{ key = "troy_main_adrastea_practios",         x = 622, y = 557, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_practios" },
	{ key = "troy_main_megaris_salamis",           x = 369, y = 319, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_salamis" },
	{ key = "troy_main_troas_hamaxitos",           x = 553, y = 495, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_hamaxitos" },
	{ key = "troy_main_malis_oita",                x = 256, y = 401, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_oita" },
	{ key = "troy_main_teythrania_pitane",         x = 632, y = 454, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_pitane" },
	{ key = "troy_main_melamphylos_kos",           x = 662, y = 256, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_kos" },
	{ key = "troy_main_aegialeia_olenos",          x = 223, y = 306, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_olenos" },
	{ key = "troy_main_boeotia_oropos",            x = 393, y = 343, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_oropos" },
	{ key = "troy_main_korcyra_lefcas",            x = 151, y = 363, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_lefcas" },
	{ key = "troy_main_astraeos_acrassos",         x = 677, y = 471, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_acrassos" },
	{ key = "troy_main_bottiaea_kition",           x = 246, y = 561, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_kition" },
	{ key = "troy_main_perrhaebia_oloosson",       x = 235, y = 493, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_oloosson" },
	{ key = "troy_main_borreas_tzirallon",         x = 670, y = 688, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_tzirallon" },
	{ key = "troy_main_cragos_phellos",            x = 866, y = 256, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_phellos" },
	{ key = "troy_main_macedonia_aeane",           x = 217, y = 505, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_aeane" },
	{ key = "troy_main_messenia_tegea",            x = 291, y = 250, army_name_key = "campaign_localised_strings_string_troy_main_fm_countless_host_army_tegea" },
}

-- Countless host region constructor for other modules
countless_host.new_region = function(key, x, y, army_name_key)
	return {
		key = key,
		x = x,
		y = y,
		army_name_key = army_name_key
	}
end

countless_host.disabled_occupation_decisions = {
	"occupation_decision_loot",
	"occupation_decision_occupy",
	"occupation_decision_colonise",
	"occupation_decision_resettle",
	"occupation_decision_establish_foreign_slot"
}

countless_host.message_events = {
	army_available = {
		title_key = "campaign_localised_strings_string_troy_rem_fm_rhesus_countless_host_army_available_title",
		primary_key = "",
		secondary_key = "campaign_localised_strings_string_troy_rem_fm_rhesus_countless_host_army_available_desc",
		persistent = true,
		index = 1200,
	},
	army_spawned = {
		title_key = "campaign_localised_strings_string_troy_rem_fm_rhesus_countless_host_army_spawned_title",
		primary_key = "",
		secondary_key = "campaign_localised_strings_string_troy_rem_fm_rhesus_countless_host_army_spawned_desc",
		persistent = true,
		index = 1201,
	}
}

-- Scripted Character skill that grants 10% replenishment per turn for Host armies on own territory (provincewide)
countless_host.replenish_skill = {
	key = "troy_rem_rhesus_old_gods_zealot_spec_host_replenishment",
	replenish_value = 0.10
}

-- Thracian rituals which grant host army replenishment (factionwide)
countless_host.replenishment_from_rituals = {
	{
		ritual_key = "sacrifice_to_gebeleizis",
		replenish_value = 0.30
	}
}

-- You probably do not need to change anything bellow this line

countless_host.host_army_summ_cur_cooldown = 0
countless_host.current_summoned_armies = {}
countless_host.current_forest_regions = {}

countless_host.ui_trigger_event = "countless_host_spawn_army"

countless_host.showed_summon_event_recently = false
countless_host.advanced_siege_technology_key = "troy_tech_5_beast_of_war"
countless_host.advanced_siege_effect_bundle_key = "troy_rem_rhesus_countless_host_advanced_siege_enable"

-- Effect bundles applied to countless host armies via the countless_host.apply_effect_bundle function
-- example data:
-- { effect_bundle_key="asdasd", start_turn = 1337, duration = 4 }
countless_host.effect_bundles = {}

countless_host.rhesus_morale_buff_skill = "troy_rem_rhesus_new_gods_zealot_spec_host_morale"
countless_host.rhesus_morale_buff_skill_effect_bundle = "troy_rem_rhesus_new_gods_zealot_spec_host_morale"

-- Needed to enable mythic campaign battle abilities for countless host armies
countless_host.prayer_effect_bundles = {
	-- prayer_effect_bundle_key = countless_host_buff_key
	troy_effect_bundle_myth_gods_prayer_aphrodite_1      = "troy_rem_host_myth_gods_prayer_aphrodite_1",
	troy_effect_bundle_myth_gods_prayer_aphrodite_2      = "troy_rem_host_myth_gods_prayer_aphrodite_2",
	troy_effect_bundle_myth_gods_prayer_aphrodite_3      = "troy_rem_host_myth_gods_prayer_aphrodite_3",
	troy_effect_bundle_myth_gods_prayer_apollo_1         = "troy_rem_host_myth_gods_prayer_apollo_1",
	troy_effect_bundle_myth_gods_prayer_apollo_2         = "troy_rem_host_myth_gods_prayer_apollo_2",
	troy_effect_bundle_myth_gods_prayer_apollo_3         = "troy_rem_host_myth_gods_prayer_apollo_3",
	troy_effect_bundle_myth_gods_prayer_ares_1           = "troy_rem_host_myth_gods_prayer_ares_1",
	troy_effect_bundle_myth_gods_prayer_ares_2           = "troy_rem_host_myth_gods_prayer_ares_2",
	troy_effect_bundle_myth_gods_prayer_ares_3           = "troy_rem_host_myth_gods_prayer_ares_3",
	troy_effect_bundle_myth_gods_prayer_artemis_1        = "troy_rem_host_myth_gods_prayer_artemis_1",
	troy_effect_bundle_myth_gods_prayer_artemis_2        = "troy_rem_host_myth_gods_prayer_artemis_2",
	troy_effect_bundle_myth_gods_prayer_artemis_3        = "troy_rem_host_myth_gods_prayer_artemis_3",
	troy_effect_bundle_myth_gods_prayer_athena_1         = "troy_rem_host_myth_gods_prayer_athena_1",
	troy_effect_bundle_myth_gods_prayer_athena_2         = "troy_rem_host_myth_gods_prayer_athena_2",
	troy_effect_bundle_myth_gods_prayer_athena_3         = "troy_rem_host_myth_gods_prayer_athena_3",
	troy_effect_bundle_myth_gods_prayer_hera_1           = "troy_rem_host_myth_gods_prayer_hera_1",
	troy_effect_bundle_myth_gods_prayer_hera_2           = "troy_rem_host_myth_gods_prayer_hera_2",
	troy_effect_bundle_myth_gods_prayer_hera_3           = "troy_rem_host_myth_gods_prayer_hera_3",
	troy_effect_bundle_myth_gods_prayer_poseidon_1       = "troy_rem_host_myth_gods_prayer_poseidon_1",
	troy_effect_bundle_myth_gods_prayer_poseidon_2       = "troy_rem_host_myth_gods_prayer_poseidon_2",
	troy_effect_bundle_myth_gods_prayer_poseidon_3       = "troy_rem_host_myth_gods_prayer_poseidon_3",
	troy_effect_bundle_myth_gods_prayer_zeus_1           = "troy_rem_host_myth_gods_prayer_zeus_1",
	troy_effect_bundle_myth_gods_prayer_zeus_2           = "troy_rem_host_myth_gods_prayer_zeus_2",
	troy_effect_bundle_myth_gods_prayer_zeus_3           = "troy_rem_host_myth_gods_prayer_zeus_3",
	troy_effect_bundle_myth_hep_gods_prayer_hephaestus_1 = "troy_rem_host_myth_hep_gods_prayer_hephaestus_1",
	troy_effect_bundle_myth_hep_gods_prayer_hephaestus_2 = "troy_rem_host_myth_hep_gods_prayer_hephaestus_2",
	troy_effect_bundle_myth_hep_gods_prayer_hephaestus_3 = "troy_rem_host_myth_hep_gods_prayer_hephaestus_3",
}

-- UI Things

countless_host.ui = {}
local ui = countless_host.ui

ui.panel_id = "fm_rhesus_1"
ui.panel = nil
ui.template_components = {} -- Template components that are to be deleted after the panel is closed
ui.recruitment_panel_id = "recruitment_panel"
ui.recruitment_panel = nil
ui.army_icon_id = "icon_army"

ui.forest_settlement_counter_id = "forest_settlement_counters"
ui.summoned_army_counter_id = "summoned_army_counters"

ui.tooltip_info = {
	path = "UI/Campaign UI/thracian_rituals_cluster_tooltip",
	forest_settlement_holder_id = "counters_forests",
	summoned_army_holder_id = "counters_armies",
	bullet_id = "bullet",

	title_id = "dy_title",
	description_id = "dy_flavour_text",
	status_id = "status",

	content_id = "content",
	separator_id = "separator",

	to_hide_id = "tx_active_ritual",

	tier_template_id = { "tier_effects", "tier_effect_bundle_template" },
	tier_details_id = "bundle_details",
	tier_percent_details_id = "bundle_details_2",
	tier_effects_title_id = "effects_title",
	tier_bundle_effect_id = "bundle_effect",
	tier_description_id = "tx_desc",

	tier_flavour_tooltip_id = { "tiers_flavour", "tx_cooldown" },

	title_key = "campaign_localised_strings_string_troy_rem_fm_rhesus_countless_host_tooltip_title",
	description_key = "campaign_localised_strings_string_troy_rem_fm_rhesus_countless_host_tooltip_description",
	level_increase_instructions_key = "campaign_localised_strings_string_troy_rem_fm_rhesus_countless_host_tooltip_level_increase",
}

ui.bullet_id = "bullet"
ui.num_bullets = 6
ui.forest_settlements_button_id = "forest_settlements_btn"
ui.summoned_armies_button_id = "summoned_armies_btn"

ui.summon_button_id = "btn_view_legacy"
ui.summon_button = nil
ui.summon_button_active = false
ui.close_recruitment_panel_button_id = "button_close_recruitment_panel"
ui.can_summon = false

ui.summon_button_active_key = "campaign_localised_strings_string_troy_rem_fm_countless_host_summon_button_active_key"
ui.summon_button_inactive_due_to_lack_of_units_key = "campaign_localised_strings_string_troy_rem_fm_countless_host_inactive_due_to_lack_of_units_key"
ui.summon_button_inactive_due_to_lack_of_resources_key = "campaign_localised_strings_string_troy_rem_fm_countless_host_inactive_due_to_lack_of_resources_key"
ui.summon_button_inactive_due_to_max_countless_host_armies_key = "campaign_localised_strings_string_troy_rem_fm_countless_host_invalid_max_countless_host_armies"
ui.summon_button_inactive_due_to_cooldown_key = "campaign_localised_strings_string_troy_rem_fm_countless_host_invalid_cooldown"

ui.confirm_purchase_id = "summon_confirmation_box"
ui.confirm_purchase_description_key = "campaign_localised_strings_string_troy_rem_fm_countless_host_summon_confirmation_description_key"

ui.highlighting_forest_regions = false

-- AI stuff

countless_host.ai = {
	cooldown = 0,
}

-- Functions

local function table_size(t)
	local size = 0
	for _, _ in pairs(t) do
		size = size + 1
	end
	return size
end

ui.unit_card = {
	tooltip_key = "campaign_localised_strings_string_troy_rem_fm_countless_host_unit_card_tooltip_key",
	out_of_charges_tooltip_key = "random_localisation_strings_string_out_of_charges_tooltip_key",
	id = { "recuitment_entry", "recruitment_item" },
	list_id = { "recuitment_entry", "list_box" },
	unit_icon_id = "unit_icon",
	template = nil,
	list = nil,
	cards = {},
}

ui.current_army_cards = {
	tooltip_key = "campaign_localised_strings_string_troy_rem_fm_countless_host_current_army_card_tooltip_key",
	general_tooltip_key = "campaign_localised_strings_string_host_general_tooltip_key",
	id = { "land_unit_card" },
	list_id = { "recruitment_army_units_holder" },
	template = nil,
	list = nil,
	cards = {},
	counter = 0,
	num_cards = 0,
	num_units = {},
}

ui.region_items = {
	id = { "settlement_row_template" },
	owned_list_id = { "list_of_owned_settlements" },
	owned_list_header_id = { "header_forest_settlements" },
	owned_counter_id = { "header_forest_settlements", "dy_counter" },
	used_list_id = { "list_of_used_settlements" },
	used_list_header_id = { "header_settlements_armies" },
	used_counter_id = { "header_settlements_armies", "dy_counter" },
	open_settlement_arrow_id = { "arrow_open_settlement" },
	zoom_to_location_button_id = { "zoom_to_location", "zoom_button" },

	owned_list_open = true, -- whether the list is expanded or not on UI creation
	used_list_open = true, -- whether the list is expanded or not on UI creation

	active_tooltip_key = "campaign_localised_strings_string_troy_rem_fm_countless_host_active_tooltip_key",
	max_army_capacity_tooltip_key = "campaign_localised_strings_string_troy_rem_fm_countless_host_max_army_capacity_tooltip_key",
	insufficient_resources_tooltip_key = "campaign_localised_strings_string_troy_rem_fm_countless_host_insufficient_resources_tooltip_key",
	region_on_cooldown_tooltip_key = "campaign_localised_strings_string_troy_rem_fm_countless_host_region_on_cooldown_tooltip_key",
	region_army_already_summoned_tooltip_key = "campaign_localised_strings_string_troy_rem_fm_countless_host_region_army_already_summoned_tooltip_key",

	template = nil,
	owned_list = nil,
	owned_counter = nil,
	used_list = nil,
	used_counter = nil,
	selected_region = nil,
}

ui.resource_cost = {
	list_id = "cost_list",
	template_id = { "cost_list", "template_resource" },
	to_hide = "devotion_cost",
}

countless_host.spawn_army = function(units, region, general --[[opt--]])
	if not countless_host.can_summon_an_army(true) then
		return
	end

	if not countless_host.current_forest_regions[region.key] then
		script_error("Countless Host: Trying to spawn an army for uncontrolled region "..region.key)
		return
	end

	general = general or countless_host.get_unused_general()
	countless_host.construct_army(units, region, general)
	
	countless_host.host_army_summ_cur_cooldown = countless_host.host_army_summ_cooldown
	countless_host.could_summon_previously = false

	for _, resource in ipairs(countless_host.host_army_summon_resource_cost) do
		cm:faction_add_pooled_resource(countless_host.faction_key, resource[1], countless_host.resource_factor_key, -resource[2])
	end
end

countless_host.construct_army = function(units, region, general)
	local success_callback = function(char_cqi)
		local char_str = cm:char_lookup_str(char_cqi);
		local char = cm:get_character(char_str)
		if not char:is_null_interface() and char:has_military_force() then
			local force = char:military_force()
			local force_cqi = force:command_queue_index()
			local faction = cm:get_faction(countless_host.faction_key)

			cm:set_custom_army_name_key(force_cqi, region.army_name_key)
			countless_host.current_summoned_armies[force_cqi] = { region = region.key, general = general }
			cm:apply_effect_bundle_to_force(countless_host.army_effect_bundle, force_cqi, -1)
			cm:apply_effect_bundle_to_character(countless_host.character_effect_bundle, char_cqi, -1)
			if faction:has_technology(countless_host.advanced_siege_technology_key) then
				cm:apply_effect_bundle_to_force(countless_host.advanced_siege_effect_bundle_key, force_cqi, -1)
			end
			cm:disallow_army_occupation_decision(force_cqi, countless_host.disabled_occupation_decisions)

			local turn = cm:turn_number()
			for _, effect_bundle in ipairs(countless_host.effect_bundles) do
				if effect_bundle.duration <= 0 then
					cm:apply_effect_bundle_to_force(effect_bundle.effect_bundle_key, force_cqi, effect_bundle.duration)
				else
					local new_duration = effect_bundle.duration - (turn - effect_bundle.start_turn)
					if new_duration > 0 then
						cm:apply_effect_bundle_to_force(effect_bundle.effect_bundle_key, force_cqi, new_duration)
					end
				end
			end

			-- Remove loyalty effects from character
			apply_loyalty_effects(char)

			local event = countless_host.message_events.army_spawned
			cm:show_message_event_located(
					countless_host.faction_key,
					event.title_key,
					event.primary_key,
					event.secondary_key,
					region.x,
					region.y,
					event.persistent,
					event.index
			)

			core:trigger_event("ScriptEventRhesusCountlessHostArmySpawned", force_cqi)

			local num_countless_armies_alived = table_size(countless_host.current_summoned_armies)
			core:trigger_event(
					"ScriptEventFactionVictoryConditionProgress",
					num_countless_armies_alived,
					"troy_rem_trj_thrace_personal_objective_countless_host_armies",
					cm:model():world():faction_by_key(countless_host.faction_key)
			)

			cm:set_custom_army_info_icon_visibility(force_cqi, "icon_host_army", true)

			achievements.rhesus.func_countless_host_army_created(num_countless_armies_alived)
		end
	end

	local x, y = cm:find_valid_spawn_location_for_character_from_position(
			countless_host.faction_key,
			region.x,
			region.y,
			true
	)

	local name = countless_host.get_random_name(general)

	cm:create_force_with_general(
		countless_host.faction_key,
		units,
		region.key,
		x,
		y,
		general.character_type_key,
		general.character_subtype_key,
		name.forename_key,
		name.clanname_key,
		name.surname_key,
		name.other_name_key,
		false,
		success_callback
	)
end

countless_host.army_spawned_in_region = function(region_key)
	for army_cqi, army in pairs(countless_host.current_summoned_armies) do
		if army.region == region_key then
			return army_cqi
		end
	end

	return false
end

countless_host.get_cur_max_armies = function()
	local cur_max_armies = countless_host.max_armies
	local num_forest_regions = table_size(countless_host.current_forest_regions)
	for _, upgrade_amount in ipairs(countless_host.max_armies_upgrade_region_requirement) do
		if upgrade_amount[1] <= num_forest_regions then
			cur_max_armies = cur_max_armies + 1
		end
	end
	return cur_max_armies
end

countless_host.can_afford_to_summon = function()
	return cm:faction_can_afford_resource_cost(cm:get_faction(countless_host.faction_key), countless_host.host_army_summon_resource_cost)
end

countless_host.get_unused_general = function()
	if table_size(countless_host.current_summoned_armies) == #countless_host.generals then
		return nil
	end

	local found_an_unused_general = false
	local general_idx

	while not found_an_unused_general do
		found_an_unused_general = true
		general_idx = cm:model():random_int(1, #countless_host.generals)
		for _, army in pairs(countless_host.current_summoned_armies) do
			if countless_host.generals[general_idx] == army.general then
				found_an_unused_general = false
				break
			end
		end
	end

	return countless_host.generals[general_idx]
end

countless_host.get_random_name = function(general)
	local names = general.names
	local rand_int = cm:model():random_int(1, #names)
	local rand_name = names[rand_int]

	return {
		forename_key = rand_name.forename_key or "",
		clanname_key = rand_name.clanname_key or "",
		surname_key = rand_name.surname_key or "",
		other_name_key = rand_name.other_name_key or "",
	}
end

countless_host.can_summon_an_army = function(show_error)
	if countless_host.host_army_summ_cur_cooldown > 0 then
		if show_error then
			script_error("Countless Host: Cannot summon an army because the cooldown is still active")
		end
		return false
	end

	if table_size(countless_host.current_summoned_armies) >= countless_host.get_cur_max_armies() then
		if show_error then
			script_error("Countless Host: Cannot summon an army because too many armies are already summoned")
		end
		return false
	end

	if not countless_host.can_afford_to_summon() then
		if show_error then
			script_error("Countless Host: Cannot summon an army because it cannot be afforded")
		end
		return false
	end

	return true
end

countless_host.get_sorted_force_cqis = function()
	local sorted_cqis = {}
	for cqi, _ in pairs(countless_host.current_summoned_armies) do
		table.insert(sorted_cqis, cqi)
	end

	table.sort(sorted_cqis)

	return sorted_cqis
end

countless_host.apply_effect_bundle = function(effect_bundle_key, turns)
	local force_cqis = countless_host.get_sorted_force_cqis()
	for _, force_cqi in ipairs(force_cqis) do
		cm:apply_effect_bundle_to_force(effect_bundle_key, force_cqi, turns)
	end

	local turn = cm:turn_number()
	table.insert(
			countless_host.effect_bundles,
			{
				effect_bundle_key = effect_bundle_key,
				start_turn = turn,
				duration = turns,
			}
	)
end

countless_host.remove_effect_bundle = function(effect_bundle_key)
	for i = #countless_host.effect_bundles, 1, -1 do
		if countless_host.effect_bundles[i].effect_bundle_key == effect_bundle_key then
			local force_cqis = countless_host.get_sorted_force_cqis()
			for _, force_cqi in ipairs(force_cqis) do
				cm:remove_effect_bundle_from_force(effect_bundle_key, force_cqi)
			end

			table.remove(countless_host.effect_bundles, i)
		end
	end
end

countless_host.update_current_tier_effect = function()
	local new_max_armies = countless_host.get_cur_max_armies()

	if new_max_armies == countless_host.current_max_armies then
		return
	end

	if countless_host.current_max_armies ~= 0 then
		local effect_bundle1 = countless_host.max_armies_upgrade_region_requirement[countless_host.current_max_armies][2][1]
		local effect_bundle2 = countless_host.max_armies_upgrade_region_requirement[countless_host.current_max_armies][2][2]
		countless_host.remove_effect_bundle(effect_bundle1)
		countless_host.remove_effect_bundle(effect_bundle2)
	end

	if new_max_armies ~= 0 then
		local effect_bundle1 = countless_host.max_armies_upgrade_region_requirement[new_max_armies][2][1]
		local effect_bundle2 = countless_host.max_armies_upgrade_region_requirement[new_max_armies][2][2]
		countless_host.apply_effect_bundle(effect_bundle1, 0)
		countless_host.apply_effect_bundle(effect_bundle2, 0)
	end

	countless_host.current_max_armies = new_max_armies
end

countless_host.only_host_armies_left = function()
	local faction = cm:get_faction(countless_host.faction_key)

	if not faction then
		return false
	end

	local regions = faction:region_list()

	if regions:num_items() > 0 then
		return false
	end

	local military_forces = faction:military_force_list()

	for i = 0, military_forces:num_items() - 1 do
		local military_force = military_forces:item_at(i)
		local force_cqi = military_force and military_force:command_queue_index()

		if not countless_host.current_summoned_armies[force_cqi] then
			return false
		end
	end

	return true
end

countless_host.update_morale_buff_from_skills = function(dying_force_cqi--[[optional--]])
	local provinces_with_morale_skill_map = {}

	local faction = cm:get_faction(countless_host.faction_key)
	if not faction or faction:is_dead() then
		return
	end

	local force_list = faction:military_force_list()
	for i = 0, force_list:num_items() - 1 do
		local force = force_list:item_at(i)

		if force:command_queue_index() ~= dying_force_cqi and force:has_general() then
			local character = force:general_character()

			if character:has_skill(countless_host.rhesus_morale_buff_skill) and character:has_region() then
				provinces_with_morale_skill_map[character:region():province_name()] = true
			end
		end
	end

	local host_forces = countless_host.get_sorted_force_cqis()
	for _, force_cqi in ipairs(host_forces) do
		local force = cm:get_military_force_by_cqi(force_cqi)

		if force and force:has_general() and force:general_character():has_region() then
			local province_name = force:general_character():region():province_name()
			local should_have_buff = not not provinces_with_morale_skill_map[province_name]
			local already_has_buff = force:has_effect_bundle(countless_host.rhesus_morale_buff_skill_effect_bundle)

			if should_have_buff and not already_has_buff then
				cm:apply_effect_bundle_to_force(countless_host.rhesus_morale_buff_skill_effect_bundle, force_cqi, 0)
			elseif not should_have_buff and already_has_buff then
				cm:remove_effect_bundle_from_force(countless_host.rhesus_morale_buff_skill_effect_bundle, force_cqi)
			end
		end				
	end
end

ui.panel_opened = function(context)
	for index, listener in ipairs(ui.listeners) do
		core:add_listener(
			"countless_host_ui_"..listener.event.."_"..index,
			listener.event,
			listener.filter,
			listener.body,
			true
		)
	end

	ui.panel = UIComponent(context.component)

	ui.recruitment_panel = ui.panel:SequentialFind(ui.recruitment_panel_id)
	ui.hide_recruitment_panel()

	ui.summon_button = ui.panel:SequentialFind(ui.summon_button_id)
	ui.can_summon = false
	if countless_host.host_army_summ_cur_cooldown > 0 then
		ui.deactivate_summon_button(common.get_localised_string(ui.summon_button_inactive_due_to_cooldown_key))
	elseif not countless_host.can_afford_to_summon() then
		ui.deactivate_summon_button(common.get_localised_string(ui.summon_button_inactive_due_to_lack_of_resources_key))
	elseif table_size(countless_host.current_summoned_armies) >= countless_host.get_cur_max_armies() then
		ui.deactivate_summon_button(common.get_localised_string(ui.summon_button_inactive_due_to_max_countless_host_armies_key))
	else
		ui.deactivate_summon_button(common.get_localised_string(ui.summon_button_inactive_due_to_lack_of_units_key))
		ui.can_summon = true
	end

	ui.set_resource_cost()
	ui.setup_unit_cards()
	ui.setup_current_army_cards()
	ui.setup_region_items()
	ui.setup_forest_counter()
	ui.setup_army_counter()
	ui.setup_army_and_forest_counter_tooltips()
	ui.update_cooldown()
end

ui.panel_closed = function(context)
	for index, listener in ipairs(ui.listeners) do
		core:remove_listener("countless_host_ui_"..listener.event.."_"..index)
	end

	for _, template in ipairs(ui.template_components) do
		template:Destroy()
	end

	ui.panel = nil
	ui.template_components = {}
	ui.recruitment_panel = nil
	ui.summon_button = nil
	ui.unit_card.template = nil
	ui.unit_card.list = nil
	ui.unit_card.cards = {}
	ui.current_army_cards.template = nil
	ui.current_army_cards.list = nil
	ui.current_army_cards.cards = {}
	ui.current_army_cards.counter = 0
	ui.current_army_cards.num_cards = 0
	ui.current_army_cards.num_units = {}
	ui.region_items.template = nil
	ui.region_items.owned_list = nil
	ui.region_items.owned_counter = nil
	ui.region_items.used_list = nil
	ui.region_items.used_counter = nil
	ui.region_items.selected_region = nil
end

ui.get_child_template = function(id)
	local component = ui.panel:SequentialFind(unpack(id))

	if not component then
		return nil
	end

	UIComponent(component:Parent()):Divorce(component:Address())

	table.insert(ui.template_components, component)

	return component
end

ui.show_recruitment_panel = function()
	if ui.recruitment_panel then
		ui.recruitment_panel:SetVisible(true)
	end
end

ui.hide_recruitment_panel = function()
	if ui.recruitment_panel then
		ui.recruitment_panel:SetVisible(false)
	end
	if ui.region_items.selected_region then
		local region = ui.region_items.owned_list:SequentialFind(ui.region_items.selected_region)
		if region then
			region:SetState("unselected")
		end
		ui.region_items.selected_region = nil
	end
end

ui.setup_forest_counter = function()
	local forest_settlement_counter = ui.panel:SequentialFind(ui.forest_settlement_counter_id)
	if forest_settlement_counter then
		local cur_max_armies = countless_host.get_cur_max_armies()

		for i = 1, ui.num_bullets do
			if i == cur_max_armies then
				ui.find_and_complete_bullet(forest_settlement_counter, ui.bullet_id..i)
			end
		end
	end
end

ui.setup_army_counter = function()
	local summoned_army_counter = ui.panel:SequentialFind(ui.summoned_army_counter_id)
	if summoned_army_counter then
		local cur_max_armies = countless_host.get_cur_max_armies()
		local cur_summoned_armies = table_size(countless_host.current_summoned_armies)

		for i = 1, ui.num_bullets do
			if i <= cur_max_armies then
				if i <= cur_summoned_armies then
					ui.find_and_complete_bullet(summoned_army_counter, ui.bullet_id..i)
				end
			else
				ui.find_and_hide_bullet(summoned_army_counter, ui.bullet_id..i)
			end
		end
	end
end

ui.setup_army_and_forest_counter_tooltips = function()
	local forest_settlement_tooltip_holder = ui.panel:SequentialFind(ui.tooltip_info.forest_settlement_holder_id)

	if forest_settlement_tooltip_holder then
		ui.setup_counter_tooltip(forest_settlement_tooltip_holder)
	end

	local flavour_tooltip_holder = ui.panel:SequentialFind(unpack(ui.tooltip_info.tier_flavour_tooltip_id))

	if flavour_tooltip_holder then
		ui.setup_flavour_tooltip(flavour_tooltip_holder)
	end

	--[[
	local summoned_armies_tooltip_holder = ui.panel:SequentialFind(ui.tooltip_info.summoned_army_holder_id)

	if summoned_armies_tooltip_holder then
		ui.setup_counter_tooltip(summoned_armies_tooltip_holder)
	end
	--]]
end

ui.setup_counter_tooltip = function(tooltip_holder)
	local info = ui.tooltip_info
	local counter = 1

	-- Setup the title
	for i, num_settlements in ipairs(countless_host.max_armies_upgrade_region_requirement) do
		local bullet_id = ui.tooltip_info.bullet_id .. counter
		counter = counter + 1

		local bullet = tooltip_holder:SequentialFind(bullet_id)

		if not bullet then
			break
		end

		bullet:InterfaceFunction("set_tooltip_path", ui.tooltip_info.path)
		local tooltip = bullet:SequentialFind(bullet_id.."_tooltip")

		local title_uic = tooltip:SequentialFind(info.title_id)
		if title_uic then
			local title = common.get_localised_string(info.title_key)
			title_uic:SetStateText(title)
		end

		local description_uic = tooltip:SequentialFind(info.description_id)
		if description_uic then
			description_uic:SetVisible(false)
		end

		local to_hide = tooltip:SequentialFind(info.to_hide_id)
		if to_hide then
			to_hide:SetVisible(false)
		end

		local tier = tooltip:SequentialFind(unpack(info.tier_template_id))
		if tier then
			local max_armies = countless_host.get_cur_max_armies()
			local tier_details = tier:SequentialFind(info.tier_details_id)

			if tier_details then
				tier_details:InterfaceFunction("set_should_sort_and_combine_effects", true)
				tier_details:InterfaceFunction("set_effect_bundle_record", num_settlements[2][1])

				local effects_title = tier_details:SequentialFind(info.tier_effects_title_id)
				if effects_title then
					effects_title:SetVisible(true)
				end
			end

			local tier_percent_details = tier:SequentialFind(info.tier_percent_details_id)

			if tier_percent_details then
				if i == 1 then
					local effects_title = tier_percent_details:SequentialFind(info.tier_effects_title_id)
					if effects_title then
						effects_title:SetVisible(false)
					end
				end

				tier_percent_details:SetVisible(true)
				tier_percent_details:InterfaceFunction("set_should_sort_and_combine_effects", true)
				tier_percent_details:InterfaceFunction("set_effect_bundle_record", num_settlements[2][2])
			end

			local fix_bundle_effect = function(bundle_effect)
				if bundle_effect then
					local txt = bundle_effect:GetStateText()
					bundle_effect:SetState("inactive")
					txt = txt:gsub("%[%[col:green]]", "")
					txt = txt:gsub("%[%[/col]]", "")
					bundle_effect:SetStateText(txt)
				end
			end

			if i ~= max_armies then
				local effect_num = 0
				while true do
					local bundle_effect_1 = tier_details:SequentialFind(info.tier_bundle_effect_id..effect_num)
					local bundle_effect_2 = tier_percent_details:SequentialFind(info.tier_bundle_effect_id..effect_num)

					fix_bundle_effect(bundle_effect_1)
					fix_bundle_effect(bundle_effect_2)

					if not bundle_effect_1 and not bundle_effect_2 then
						break
					end

					effect_num = effect_num + 1
				end

				local status = tooltip:SequentialFind(ui.tooltip_info.status_id)
				if status then
					status:SetState("not_available")
				end
			end

			local tier_description = tier:SequentialFind(info.tier_description_id)
			if tier_description then
				tier_description:SetVisible(true)
			end
		end

		local content = tooltip:SequentialFind(info.content_id)
		if content then
			local separator = tooltip:SequentialFind(info.separator_id)
			if separator then
				content:CreateFromComponent(separator:Address(), "separator2")
			end
		end

		if description_uic then
			local instructions = UIComponent(tooltip:CreateFromComponent(description_uic:Address(), "level_increase_instructions"))
			if instructions then
				instructions:SetStateText(common.get_localised_string(info.level_increase_instructions_key))
			end
		end
	end
end

ui.setup_flavour_tooltip = function(tooltip_holder)
	local info = ui.tooltip_info

	tooltip_holder:InterfaceFunction("set_tooltip_path", ui.tooltip_info.path)
	local tooltip = tooltip_holder:SequentialFind(tooltip_holder:Id().."_tooltip")

	if not tooltip then
		return
	end

	local title_uic = tooltip:SequentialFind(info.title_id)
	if title_uic then
		local title = common.get_localised_string(info.title_key)
		title_uic:SetStateText(title)
	end

	local description_uic = tooltip:SequentialFind(info.description_id)
	if description_uic then
		local description = common.get_localised_string(info.description_key)
		description_uic:SetStateText(description)
	end

	local to_hide = tooltip:SequentialFind(info.to_hide_id)
	if to_hide then
		to_hide:SetVisible(false)
	end

	local content = tooltip:SequentialFind(info.content_id)
	if content then
		content:SetVisible(false)
	end
end

ui.find_and_complete_bullet = function(uic, bullet_id)
	local bullet = uic:SequentialFind(bullet_id)
	if bullet then
		bullet:SetState("completed")
	end
end

ui.find_and_hide_bullet = function(uic, bullet_id)
	local bullet = uic:SequentialFind(bullet_id)
	if bullet then
		bullet:SetVisible(false)
	end
end

ui.activate_summon_button = function(tooltip)
	if ui.summon_button then
		ui.summon_button:SetState("active")
		if tooltip then
			ui.summon_button:SetTooltipText(tooltip, "", true)
		end
		ui.summon_button_active = true
	end
end

ui.deactivate_summon_button = function(tooltip)
	if ui.summon_button then
		ui.summon_button:SetState("inactive")
		if tooltip then
			ui.summon_button:SetTooltipText(tooltip, "", true)
		end
		ui.summon_button_active = false
	end
end

ui.set_resource_cost = function()
	local cost_list = ui.panel:SequentialFind(ui.resource_cost.list_id)
	if cost_list then
		local to_hide = ui.panel:SequentialFind(ui.resource_cost.to_hide)
		if to_hide then
			to_hide:SetVisible(false)
		end

		local cost_template = ui.get_child_template(ui.resource_cost.template_id)
		if cost_template then
			local faction = cm:get_faction(countless_host.faction_key)
			local red_color_prefix = "[[col:red]]"
			local red_color_suffix = "[[/col]]"
			table.insert(ui.template_components, cost_template)

			for _, res in ipairs(countless_host.host_army_summon_resource_cost) do
				local cost_uic = UIComponent(cost_list:CreateFromComponent(cost_template:Address(), res[1]))
				cost_uic:SetState(res[1])
				if cm:faction_can_afford_resource_cost(faction, { res }) then
					cost_uic:SetStateText(res[2])
				else
					cost_uic:SetStateText(red_color_prefix..res[2]..red_color_suffix)
				end
			end
		end
	end
end

ui.forest_settlements_button_clicked = function()
	if ui.hightlighting_forest_regions then
		return
	end

	ui.highlighting_forest_regions = true

	local root = core:get_ui_root()
	-- x, y, horizontal distance, bearing, height
	local posx, posy, posd, posb, posh = cm:get_camera_position()
	cm:set_camera_position(posx, posy, posd, posb, 100)

	local region_label_prefix = "label_settlement:"

	cm:callback(function()
		for _, region in ipairs(countless_host.forest_regions) do
			local region_label = root:SequentialFind(region_label_prefix .. region.key)
			if region_label then
				pulse_uicomponent(region_label, true, 10, true)
			end
		end

		local listener_name = "countless_host_ui_forest_regions_highlight"
		core:add_listener(
				listener_name,
				"CampaignCityInfoBarCreated",
				true,
				function(context)
					for _, region in ipairs(countless_host.forest_regions) do
						if context.string == region_label_prefix..region.key then
							pulse_uicomponent(UIComponent(context.component), true, 10, true)
							return
						end
					end
				end,
				true
		)
	end, 0.5)

	ui.panel:InterfaceFunction("close_panel")

	cm:callback(function()
		core:remove_listener(listener_name)
		for _, region in ipairs(countless_host.forest_regions) do
			local region_label = root:SequentialFind("label_settlement:"..region.key)
			if region_label then
				pulse_uicomponent(region_label, false, 0, true)
			end
		end
	end, 10)
end

ui.summoned_armies_button_clicked = function()
	ui.panel:InterfaceFunction("close_panel")
	local root = core:get_ui_root()
	local agents_and_heroes_tab = root:SequentialFind("panel_buttons_tab_sidemenu", "tab_units")
	if agents_and_heroes_tab then
		agents_and_heroes_tab:SimulateLClick()
	end
end

-- UI Recruitment panel

ui.setup_unit_cards = function()
	ui.unit_card.template = ui.get_child_template(ui.unit_card.id)
	if ui.unit_card.template then
		table.insert(ui.template_components, ui.unit_card.template)

		ui.unit_card.list = ui.panel:SequentialFind(unpack(ui.unit_card.list_id))

		for i, unit in ipairs(countless_host.recruitable_units) do
			local unit_card_name = unit.key.."_"..i
			local unit_card = UIComponent(ui.unit_card.list:CreateFromComponent(ui.unit_card.template:Address(), unit_card_name))
			if(unit_card) then
				ui.unit_card.cards[unit_card_name] = {
					component = unit_card,
					unit = unit,
				}

				unit_card:InterfaceFunction("init_card", unit.key, countless_host.faction_key, unit.cap, ui.unit_card.tooltip_key)
			end
		end
	end
end

ui.setup_current_army_cards = function()
	ui.current_army_cards.template = ui.get_child_template(ui.current_army_cards.id)
	if ui.current_army_cards.template then
		table.insert(ui.template_components, ui.current_army_cards.template)

		ui.current_army_cards.list = ui.panel:SequentialFind(unpack(ui.current_army_cards.list_id))

		local general_name = countless_host.generals[1].unit_key
		local card = UIComponent(ui.current_army_cards.list:CreateFromComponent(ui.current_army_cards.template:Address(), general_name))
		if card then
			card:InterfaceFunction("init_card", countless_host.generals[1].unit_key, ui.current_army_cards.general_tooltip_key)
		end
	end
end

ui.disable_unit_cards = function()
	for _, card in pairs(ui.unit_card.cards) do
		ui.disable_unit_card(card.component)
	end
end

ui.enable_unit_cards = function()
	for _, card in pairs(ui.unit_card.cards) do
		if card.unit.cap > (ui.current_army_cards.num_units[card.unit.key] or 0) then
			ui.enable_unit_card(card.component)
		end
	end
end

ui.disable_unit_card = function(card)
	card:SetState("inactive")
	local unit_icon = card:SequentialFind(ui.unit_card.unit_icon_id)
	if unit_icon then
		unit_icon:SetState("inactive")
	end
end

ui.enable_unit_card = function(card)
	card:SetState("active")
	local unit_icon = card:SequentialFind(ui.unit_card.unit_icon_id)
	if unit_icon then
		unit_icon:SetState("active")
	end
end

ui.unit_clicked = function(clicked_string)
	local card = ui.unit_card.cards[clicked_string]

	if ui.current_army_cards.num_cards < 19 then
		if ui.current_army_cards.num_units[card.unit.key] and ui.current_army_cards.num_units[card.unit.key] >= card.unit.cap then
			return
		end
		local card_name = ui.current_army_cards.counter.."_"..card.unit.key
		local new_card = UIComponent(ui.current_army_cards.list:CreateFromComponent(ui.current_army_cards.template:Address(), card_name))

		if new_card then
			local unit_availability_counter = card.component:SequentialFind("max_units")

			new_card:InterfaceFunction("init_card", card.unit.key, ui.current_army_cards.tooltip_key)
			ui.current_army_cards.cards[card_name] =
			{
				uic = new_card,
				unit = card.unit,
				counter_uic = unit_availability_counter,
				original_card_uic = card.component,
			}
			ui.current_army_cards.counter = ui.current_army_cards.counter + 1
			ui.current_army_cards.num_cards = ui.current_army_cards.num_cards + 1
			ui.current_army_cards.num_units[card.unit.key] = (ui.current_army_cards.num_units[card.unit.key] or 0) + 1

			if unit_availability_counter then
				local units_left = card.unit.cap - ui.current_army_cards.num_units[card.unit.key]
				unit_availability_counter:SetStateText(""..units_left)
				if units_left == 0 then
					ui.disable_unit_card(card.component)
					card.component:InterfaceFunction("update_tooltip", ui.unit_card.out_of_charges_tooltip_key)
				end
			end

			if ui.current_army_cards.num_cards == 19 then
				ui.disable_unit_cards()
				if ui.can_summon then
					ui.activate_summon_button(common.get_localised_string(ui.summon_button_active_key))
				end
			end
		end
	end
end

ui.current_army_card_clicked = function(clicked_string)
	local unit = ui.current_army_cards.cards[clicked_string].unit
	local unit_key = unit.key
	local card = ui.current_army_cards.cards[clicked_string]
	local unit_availability_counter = card.counter_uic

	ui.current_army_cards.num_units[unit_key] = ui.current_army_cards.num_units[unit_key] - 1
	ui.current_army_cards.cards[clicked_string].uic:Destroy()
	ui.current_army_cards.cards[clicked_string] = nil
	ui.current_army_cards.num_cards = ui.current_army_cards.num_cards - 1

	if unit_availability_counter then
		unit_availability_counter:SetStateText(""..(unit.cap - ui.current_army_cards.num_units[unit_key]))
	end

	ui.enable_unit_card(card.original_card_uic)
	card.original_card_uic:InterfaceFunction("update_tooltip", ui.unit_card.tooltip_key)

	if ui.current_army_cards.num_cards == 18 then
		ui.enable_unit_cards()
		if ui.summon_button_active then
			ui.deactivate_summon_button(common.get_localised_string(ui.summon_button_inactive_due_to_lack_of_units_key))
		end
	end
end

-- UI Region panel

ui.set_region_display_data = function(region_uic, region_key)
	local region = cm:get_region(region_key)
	if region then
		local region_name = region_uic:SequentialFind("tx_region_title")
		if region_name then
			region_name:SetStateText(region:localised_display_name())
		end

		local province_name = region_uic:SequentialFind("tx_province_title")
		if province_name then
			province_name:SetStateText(region:province():localised_display_name())
		end
	end
end

ui.region_clicked = function(region_key)
	local force_cqi = countless_host.army_spawned_in_region(region_key)
	if force_cqi then
		local army = cm:get_military_force_by_cqi(force_cqi)
		if army and army:has_general() then
			ui.panel:InterfaceFunction("close_panel")
			cm:scroll_camera_to_character(army:general_character():command_queue_index())
		end
	else
		ui.show_recruitment_panel()

		if ui.region_items.selected_region then
			local region = ui.region_items.owned_list:SequentialFind(ui.region_items.selected_region)
			if region then
				region:SetState("unselected")
			end
		end

		ui.region_items.selected_region = region_key

		local region = ui.region_items.owned_list:SequentialFind(region_key)
		if region then
			region:SetState("selected")
		end
	end
end

ui.region_double_clicked = function(region_key)
	ui.panel:InterfaceFunction("close_panel")
	cm:scroll_camera_to_settlement(region_key)
end

ui.setup_region_items = function()
	ui.region_items.template = ui.get_child_template(ui.region_items.id)
	if ui.region_items.template then
		table.insert(ui.template_components, ui.region_items.template)

		local num_summoned_armies = table_size(countless_host.current_summoned_armies)

		local tooltip
		if countless_host.host_army_summ_cur_cooldown > 0 then
			tooltip = ui.region_items.region_on_cooldown_tooltip_key
		elseif not countless_host.can_afford_to_summon() then
			tooltip = ui.region_items.insufficient_resources_tooltip_key
		elseif num_summoned_armies >= countless_host.get_cur_max_armies() then
			tooltip = ui.region_items.max_army_capacity_tooltip_key
		else
			tooltip = ui.region_items.active_tooltip_key
		end

		ui.region_items.owned_list = ui.panel:SequentialFind(unpack(ui.region_items.owned_list_id))
		ui.region_items.owned_counter = ui.panel:SequentialFind(unpack(ui.region_items.owned_counter_id))
		ui.region_items.used_list = ui.panel:SequentialFind(unpack(ui.region_items.used_list_id))
		ui.region_items.used_counter = ui.panel:SequentialFind(unpack(ui.region_items.used_counter_id))

		local owned_list_header = ui.panel:SequentialFind(unpack(ui.region_items.owned_list_header_id))
		local used_list_header = ui.panel:SequentialFind(unpack(ui.region_items.used_list_header_id))
		local owned_counter = table_size(countless_host.current_forest_regions)
		local used_counter =  num_summoned_armies .. " / " .. countless_host.get_cur_max_armies()

		for region_key, _ in pairs(countless_host.current_forest_regions) do
			local region = nil
			if countless_host.army_spawned_in_region(region_key) then
				region = ui.region_items.used_list:CreateFromComponent(ui.region_items.template:Address(), region_key)
				if used_list_header then
					used_list_header:InterfaceFunction("add_item", region)
				end
				region = UIComponent(region)
				region:SetTooltipText(common.get_localised_string(ui.region_items.region_army_already_summoned_tooltip_key), "", true)

				local arrow = region:SequentialFind(unpack(ui.region_items.open_settlement_arrow_id))
				local zoom = region:SequentialFind(unpack(ui.region_items.zoom_to_location_button_id))
				if arrow and zoom then
					arrow:SetVisible(false)
					zoom:SetVisible(true)
				end

				region:SetState("invalid")
			else
				region = ui.region_items.owned_list:CreateFromComponent(ui.region_items.template:Address(), region_key)
				if owned_list_header then
					owned_list_header:InterfaceFunction("add_item", region)
				end
				region = UIComponent(region)
				local army_icon = region:SequentialFind(ui.army_icon_id)
				if army_icon then
					army_icon:SetVisible(false)
				end
				region:SetTooltipText(common.get_localised_string(tooltip), "", true)
			end
			ui.set_region_display_data(region, region_key)
		end

		if owned_list_header and ui.region_items.owned_list_open then
			owned_list_header:InterfaceFunction("expand_list_header", true)
		end
		if used_list_header and ui.region_items.used_list_open then
			used_list_header:InterfaceFunction("expand_list_header", true)
		end

		ui.region_items.owned_counter:SetStateText(owned_counter - num_summoned_armies)
		ui.region_items.used_counter:SetStateText(used_counter)
	end
end

ui.update_cooldown = function()
	local cooldown_holder = ui.panel:SequentialFind("cooldown_holder")
	if cooldown_holder then
		if countless_host.host_army_summ_cur_cooldown == 0 then
			cooldown_holder:SetVisible(false)
		else
			cooldown_holder:SetVisible(true)
			local dy_turns = ui.panel:SequentialFind("dy_turns")
			if dy_turns then
				dy_turns:SetStateText(tostring(countless_host.host_army_summ_cur_cooldown))
			end
		end
	end
end

-- AI helper functions

countless_host.ai.get_random_region = function()
	local available_regions = {}
	for _, region in pairs(countless_host.current_forest_regions) do
		if not countless_host.army_spawned_in_region(region_key) then
			table.insert(available_regions, region)
		end
	end

	return available_regions[cm:model():random_int(1, #available_regions)]
end

countless_host.ai.get_random_units = function()
	local units = {}
	local return_val = ""

	for _, unit in ipairs(countless_host.recruitable_units) do
		table.insert(units,
					{
						key = unit.key,
						num = 0,
						cap = unit.cap,
					})
	end

	for _ = 1, 19 do
		while true do
			local rand_num = cm:model():random_int(1, #units)
			local unit = units[rand_num]
			if unit.num < unit.cap then
				unit.num = 1 + unit.num
				return_val = unit.key..","..return_val
				break
			end
		end
	end

	return return_val
end

countless_host.is_host_general = function(character)
	if not is_character(character) then 
		script_error("ERROR: countless_host.is_host_general() called, but supplied character is invalid")
		return
	end

	local char_subtype = character:character_subtype_key()
	for _, entry in ipairs(countless_host.generals) do
		if entry.character_subtype_key == char_subtype then 
			return true
		end
	end
	
	if table_contains(countless_host.unique_generals_subtypes, char_subtype) then 
		return true
	end

	return false
end

-- Listeners

countless_host.listeners = {
	--	{
	--		event = "",
	--		filter = function(context) end,
	--		body = function(context) end
	--	},

	{
		event = "FactionTurnStart",
		filter = function(context)
			return context:faction():name() == countless_host.faction_key
		end,
		body = function(context)
			if countless_host.host_army_summ_cur_cooldown > 0 then
				countless_host.host_army_summ_cur_cooldown = countless_host.host_army_summ_cur_cooldown - 1
			end
		end
	},

	{
		--------------------------
		-- Lost a forest region --
		--------------------------
		event = "RegionFactionChangeEvent",
		filter = function(context)
			return context:previous_faction():name() == countless_host.faction_key
		end,
		body = function(context)
			local region_name = context:region():name()
			countless_host.current_forest_regions[region_name] = nil
			countless_host.update_current_tier_effect()
		end
	},

	{
		--------------------------------
		-- Gained a new forest region --
		--------------------------------
		event = "RegionFactionChangeEvent",
		filter = function(context)
			return context:region():owning_faction():name() == countless_host.faction_key
		end,
		body = function(context)
			local region_name = context:region():name()
			for _, region in ipairs(countless_host.forest_regions) do
				if region.key == region_name then
					local could_summon_previously = countless_host.can_summon_an_army()
					countless_host.current_forest_regions[region.key] = region
					local can_summon_now = countless_host.can_summon_an_army()
					if not could_summon_previously and can_summon_now then
						local event = countless_host.message_events.army_available
						cm:show_message_event(countless_host.faction_key, event.title_key, event.primary_key, event.secondary_key, event.persistent, event.index)
					end
				end
			end
			countless_host.update_current_tier_effect()
		end
	},

	{
		event = "CharacterLeavesMilitaryForce",
		filter = function(context)
			local force_cqi = context:military_force():command_queue_index()
			return not not countless_host.current_summoned_armies[force_cqi]
		end,
		body = function(context)
			local force = context:military_force()
			local force_cqi = force:command_queue_index()
			countless_host.current_summoned_armies[force_cqi] = nil
			if force:has_general() then
				local family_member_cqi = force:general_character():family_member():command_queue_index()
				cm:callback(function()
					local family_member = cm:model():family_member_for_command_queue_index(family_member_cqi)
					local character = family_member:character()
					if character and not character:is_null_interface() then
						local char_lookup = cm:char_lookup_str(character)
						cm:kill_character_and_commanded_unit_with_dt(char_lookup, false, "KILLED_IN_ACTION")
					end
				end, 0.2)
			end
			core:trigger_event(
					"ScriptEventFactionVictoryConditionProgress",
					table_size(countless_host.current_summoned_armies),
					"troy_rem_trj_thrace_personal_objective_countless_host_armies",
					cm:model():world():faction_by_key(countless_host.faction_key)
			)
		end
	},

	{	--[[
			Old Gods Zealot (Host Replenishment)
			+10% replenishment per turn for Host armies on own territory (provincewide) when a character in the province has the skill Old Gods Zealot
		--]]
		event = "CharacterTurnStart",
		filter = function(context)
			return context:character():faction():name() == countless_host.faction_key
				and context:character():has_skill(countless_host.replenish_skill.key)
		end,
		body = function(context)
			local character = context:character()
			if not character:has_region() or character:region():owning_faction():name() ~= countless_host.faction_key then
				return
			end

			local province = context:character():region():province()
			local regions = province:regions()
			local num_regions = regions:num_items()

			for i = 0, num_regions - 1 do
				local region = regions:item_at(i)

				if region:owning_faction():name() == countless_host.faction_key then
					local characters = region:characters_in_region()
					local num_characters = characters:num_items()

					for j = 0, num_characters - 1 do
						local char = characters:item_at(j)

						if char:has_military_force() and char:faction():name() == countless_host.faction_key then
							local force_cqi = char:military_force():command_queue_index()

							-- Check if this is a host army
							if countless_host.current_summoned_armies[force_cqi] then
								cm:replenish_units(cm:char_lookup_str(char:command_queue_index()), countless_host.replenish_skill.replenish_value)
							end
						end
					end
				end
			end
		end
	},

	{
		event = "PanelOpenedCampaign",
		filter = function(context)
			return context.string == ui.panel_id
		end,
		body = ui.panel_opened
	},

	{
		event = "PanelClosedCampaign",
		filter = function(context)
			return context.string == ui.panel_id
		end,
		body = ui.panel_closed
	},

	{
		event = "UITriggerScriptEvent",
		filter = function(context)
			return context:trigger():split(":")[1] == countless_host.ui_trigger_event
		end,
		body = function(context)
			local splits = context:trigger():split(":")
			local region_key = splits[2]
			local units_list = splits[3]

			for idx, unit in ipairs(countless_host.recruitable_units) do
				units_list = units_list:gsub(tostring(idx), unit.key)
			end

			for _, region in pairs(countless_host.forest_regions) do
				if region.key == region_key then
					countless_host.spawn_army(units_list, region)
					break
				end
			end

			ui.panel:InterfaceFunction("close_panel")
		end
	},

	{
		event = "FactionTurnStart",
		filter = function(context)
			local faction = context:faction()
			return faction:name() == countless_host.faction_key and not faction:is_human()
		end,
		body = function(context)
			if countless_host.ai.cooldown > 0 then
				countless_host.ai.cooldown = countless_host.ai.cooldown - 1
			elseif countless_host.get_cur_max_armies() > table_size(countless_host.current_summoned_armies)
				and countless_host.can_afford_to_summon()
			then
				countless_host.ai.cooldown = 3
				countless_host.ai.host_army_summ_cur_cooldown = 0
				local region = countless_host.ai.get_random_region()
				local units = countless_host.ai.get_random_units()

				countless_host.spawn_army(units, region)
			end
		end
	},

	{
		event = "FactionTurnStart",
		filter = function(context)
			return context:faction():name() == countless_host.faction_key
		end,
		body = function(context)
			if countless_host.can_summon_an_army() then
				if not countless_host.showed_summon_event_recently then
					local event = countless_host.message_events.army_available
					cm:show_message_event(countless_host.faction_key, event.title_key, event.primary_key, event.secondary_key, event.persistent, event.index)
					countless_host.showed_summon_event_recently = true
				end
			else
				countless_host.showed_summon_event_recently = false
			end
		end
	},

	{
		event = "ResearchCompleted",
		filter = function(context)
			local technology_name = context:technology()
			return context:faction():name() == countless_host.faction_key and context:technology() == countless_host.advanced_siege_technology_key
		end,
		body = function(context)
			-- Will desync in multiplayer if we apply the effect bundle in different order on both pcs, and
			-- for _, _ in pairs(countless_host.current_summoned_armies)
			-- can iterate through the table in different orders on both pcs in lua, so we sort the cqis and use that
			local sorted_cqis = countless_host.get_sorted_force_cqis()
			for _, force_cqi in ipairs(sorted_cqis) do
				cm:apply_effect_bundle_to_force(countless_host.advanced_siege_effect_bundle_key, force_cqi, -1)
			end
		end
	},

	{
		event = "RegionFactionChangeEvent",
		filter = function(context)
			return context:previous_faction():name() == countless_host.faction_key
		end,
		body = function(context)
			if countless_host.only_host_armies_left() then
				cm:cancel_mission(countless_host.faction_key, "troy_rem_personal_victory_rhesus")
			end
		end,
	},

	{
		event = "CharacterLeavesMilitaryForce",
		filter = function(context)
			local force_cqi = context:military_force():command_queue_index()
			return not countless_host.current_summoned_armies[force_cqi]
		end,
		body = function(context)
			if countless_host.only_host_armies_left() then
				cm:cancel_mission(countless_host.faction_key, "troy_rem_personal_victory_rhesus")
			end
		end,
	},

	{
		event = "FactionInitiatesPrayer",
		filter = function(context)
			return context:faction():name() == countless_host.faction_key
					and countless_host.prayer_effect_bundles[context:effect_bundle_key()]
		end,
		body = function(context)
			local duration = context:effect_bundle_duration()
			local effect_bundle = countless_host.prayer_effect_bundles[context:effect_bundle_key()]
			countless_host.apply_effect_bundle(effect_bundle, duration)
		end
	},

	-- BEGIN Listeners for provincewide morale buff from skills
	{
		event = "CharacterFinishedMovingEvent",
		filter = function(context)
			return context:character():faction():name() == countless_host.faction_key
		end,
		body = function(context)
			countless_host.update_morale_buff_from_skills()
		end
	},

	{
		event = "CharacterSkillPointAllocated",
		filter = function(context)
			return context:skill_point_spent_on() == countless_host.rhesus_morale_buff_skill and
				context:character():faction():name() == countless_host.faction_key
		end,
		body = function(context)
			countless_host.update_morale_buff_from_skills()
		end
	},

	{
		event = "CharacterSkillPointDeallocated",
		filter = function(context)
			return context:skill_point_spent_on() == countless_host.rhesus_morale_buff_skill and
				context:character():faction():name() == countless_host.faction_key
		end,
		body = function(context)
			countless_host.update_morale_buff_from_skills()
		end
	},

	{
		event = "MilitaryForceCreated",
		filter = function(context)
			return context:military_force_created():faction():name() == countless_host.faction_key
		end,
		body = function(context)
			countless_host.update_morale_buff_from_skills()
		end
	},

	{
		event = "MilitaryForceDestroyed",
		filter = function(context)
			return context:military_force():faction():name() == countless_host.faction_key
		end,
		body = function(context)
			countless_host.update_morale_buff_from_skills(context:cqi())
		end
	},

	{
		event = "CharacterEntersMilitaryForce",
		filter = function(context)
			return context:character():faction():name() == countless_host.faction_key
		end,
		body = function(context)
			-- Call this in callback because the character won't have region assigned yet
			cm:callback(countless_host.update_morale_buff_from_skills, 0.1)
		end
	},

	{
		event = "CharacterLeavesMilitaryForce",
		filter = function(context)
			return context:character():faction():name() == countless_host.faction_key
		end,
		body = function(context)
			countless_host.update_morale_buff_from_skills(context:military_force():command_queue_index())
		end
	},
	-- END Listeners for provincewide morale buff from skills
}

ui.listeners = {
	--	{
	--		event = "",
	--		filter = function(context) end,
	--		body = function(context) end
	--	},

	{
		event = "ComponentLClickUp",
		filter = function(context)
			return ui.panel and uicomponent_descended_from(UIComponent(context.component), ui.panel_id)
		end,
		body = function(context)
			local clicked_string = context.string
			local uic = UIComponent(context.component)

			if ui.unit_card.cards[clicked_string] then
				ui.unit_clicked(clicked_string)
			elseif ui.current_army_cards.cards[clicked_string] then
				ui.current_army_card_clicked(clicked_string)
			elseif countless_host.current_forest_regions[clicked_string] then
				ui.region_clicked(clicked_string)
			elseif clicked_string == ui.summon_button_id then
				local faction = cm:get_faction(countless_host.faction_key)
				local faction_cqi = faction:command_queue_index()
				create_confirmation_box(ui.confirm_purchase_id, ui.confirm_purchase_description_key,
					function()
						local units_list = ""
						for _, card in pairs(ui.current_army_cards.cards) do
							for idx, unit in ipairs(countless_host.recruitable_units) do
								if card.unit == unit then
									units_list = units_list..","..idx
									break
								end
							end
						end
						units_list = units_list:sub(2, -1)
						CampaignUI.TriggerCampaignScriptEvent(faction_cqi, countless_host.ui_trigger_event..":"..ui.region_items.selected_region..":"..units_list)
						CampaignUI.TriggerCampaignVO(countless_host.vo_event, countless_host.faction_key)
					end,
					nil,
					ui.panel
				)
			elseif clicked_string == ui.close_recruitment_panel_button_id then
				ui.hide_recruitment_panel()
			elseif clicked_string == ui.forest_settlements_button_id then
				ui.forest_settlements_button_clicked()
			elseif clicked_string == ui.summoned_armies_button_id then
				ui.summoned_armies_button_clicked()
			elseif clicked_string == ui.region_items.owned_list_header_id[1] then
				ui.region_items.owned_list_open = not ui.region_items.owned_list_open
			elseif clicked_string == ui.region_items.used_list_header_id[1] then
				ui.region_items.used_list_open = not ui.region_items.used_list_open
			elseif clicked_string == ui.region_items.zoom_to_location_button_id[2] then
				for name, _ in pairs(countless_host.current_forest_regions) do
					if uicomponent_descended_from(uic, name) then
						ui.region_clicked(name)
						break
					end
				end
			end
		end
	},

	{
		event = "ComponentLDBLClickUp",
		filter = function(context)
			return ui.panel and uicomponent_descended_from(UIComponent(context.component), ui.panel_id)
		end,
		body = function(context)
			local clicked_string = context.string
			if countless_host.current_forest_regions[clicked_string] then
				ui.region_double_clicked(clicked_string)
			end
		end
	},
}

countless_host.add_listeners = function()
	for index, listener in pairs(countless_host.listeners) do
		core:add_listener(
			"countless_host_"..listener.event.."_"..index,
			listener.event,
			listener.filter,
			listener.body,
			true
		)
	end
end

core:add_listener(
		"RhesusCountlessHost_FirstTickAfterWorldCreated",
		"FirstTickAfterWorldCreated",
		true,
		function()
			for cqi, _ in pairs(countless_host.current_summoned_armies) do
				cm:set_custom_army_info_icon_visibility(cqi, "icon_host_army", true)
			end
		end,
		true
)

cm:add_first_tick_callback(function()
	if table_size(countless_host.current_forest_regions) > 0 then
		return
	end

	local faction = cm:get_faction(countless_host.faction_key)
	if not faction then return end	-- There could be no such faction, for example when loading a save file from older version of the game (pre R&M).

	local region_list = faction:region_list()
	local num_regions = faction:num_regions()

	for i = 0, num_regions - 1 do
		local region_item = region_list:item_at(i)
		local region_name = region_item:name()

		for _, region in ipairs(countless_host.forest_regions) do
			if region_name == region.key then
				countless_host.current_forest_regions[region.key] = region
				break
			end
		end
	end

	countless_host.update_current_tier_effect()
end)

--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------

cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("TROY_COUNTLESS_HOST_SUMMON_ARMY_COOLDOWN"   , countless_host.host_army_summ_cur_cooldown, context)
		cm:save_named_value("TROY_COUNTLESS_HOST_CURRENT_SUMMONED_ARMIES", countless_host.current_summoned_armies, context)
		cm:save_named_value("TROY_COUNTLESS_HOST_CURRENT_FOREST_REGIONS" , countless_host.current_forest_regions, context)
		cm:save_named_value("TROY_COUNTLESS_HOST_AI_COOLDOWN"            , countless_host.ai.cooldown, context)
		cm:save_named_value("TROY_COUNTLESS_HOST_EFFECT_BUNDLES"         , countless_host.effect_bundles, context)
		cm:save_named_value("TROY_COUNTLESS_HOST_CURRENT_MAX_ARMIES"     , countless_host.current_max_armies, context)
	end
)

cm:add_loading_game_callback(
	function(context)
		countless_host.host_army_summ_cur_cooldown = cm:load_named_value("TROY_COUNTLESS_HOST_SUMMON_ARMY_COOLDOWN"   , countless_host.host_army_summ_cur_cooldown, context)
		countless_host.current_summoned_armies     = cm:load_named_value("TROY_COUNTLESS_HOST_CURRENT_SUMMONED_ARMIES", countless_host.current_summoned_armies    , context)
		countless_host.current_forest_regions      = cm:load_named_value("TROY_COUNTLESS_HOST_CURRENT_FOREST_REGIONS" , countless_host.current_forest_regions     , context)
		countless_host.ai.cooldown                 = cm:load_named_value("TROY_COUNTLESS_HOST_AI_COOLDOWN"            , countless_host.ai.cooldown                , context)
		countless_host.effect_bundles              = cm:load_named_value("TROY_COUNTLESS_HOST_EFFECT_BUNDLES"         , countless_host.effect_bundles             , context)
		countless_host.current_max_armies          = cm:load_named_value("TROY_COUNTLESS_HOST_CURRENT_MAX_ARMIES"     , countless_host.current_max_armies         , context)
	end
)
