 out("Loading troy_rem_memnon_pharaohs_servant.lua")

-- What the table looks like:
-- pharaohs_servant = {
--     faction = "faction_key",
--     max_recruitment_territories_per_turn = 1,
--     bucket_resource_cost_modifier_technologies = {
--			{ "technology_key", multiplier }
--     }
--     regions = {
-- 		region1 = {
-- 			bucket_upgrade_technologies = {
-- 				{ technology_key = "key1", upgraded_amount = 1 },
-- 				{ technology_key = "key2", upgraded_amount = 1 },
-- 			},
-- 			bucket_upgrades_count = 0,
--			purchased_bucket_here_this_turn = false,
--			cost_multiplier = 1,
--			cost_technologies = { technology_key = 0.85 }
-- 			cities = {
-- 				city1 = {
-- 					number_of_upgrades = 0,
--					unlock_building_key = "building key",
--					unlock_technology_key = "tech key",
-- 					unlocked = true,
-- 					upgrade_building_key = "Egypt Chain lvl. 1 key",
--					on_cooldown = 0,
-- 					units = {
-- 						unit1 = {
-- 							bucket_count = 1,
-- 							key = "key",
-- 							recruitment_cap = 1,
-- 						}
-- 					},
--					bucket_cost = {
--						{"troy_food", 420},
--						{"troy_wood", 1337},
--						{"resource_key", 322}
--					}
--					ui_button = "button name in component",
--					ui_title_key = "ui title key from database",
--					ui_description_key = "ui description key from database",
-- 				}
-- 			},
-- 		}
-- 	},
-- }

pharaohs_servant = {}
pharaohs_servant.faction_key = "troy_rem_horde_aethiopians"
pharaohs_servant.vo_event = "campaign_vo_cs_rem_memnon_fm_pharaoh_servant"
-- Regions
pharaohs_servant.regions = {}
pharaohs_servant.regions.egypt = {}
pharaohs_servant.regions.aethiopia = {}
pharaohs_servant.regions.canaan = {}
pharaohs_servant.regions.susa = {}

-- Cities
pharaohs_servant.regions.egypt    .cities = {}
pharaohs_servant.regions.aethiopia.cities = {}
pharaohs_servant.regions.canaan   .cities = {}
pharaohs_servant.regions.susa     .cities = {}

pharaohs_servant.regions.egypt    .cities.sais = {}
pharaohs_servant.regions.egypt    .cities.memphis = {}
pharaohs_servant.regions.egypt    .cities.thebes = {}
pharaohs_servant.regions.aethiopia.cities.napata = {}
pharaohs_servant.regions.aethiopia.cities.kerma = {}
pharaohs_servant.regions.aethiopia.cities.yeha = {}
pharaohs_servant.regions.canaan   .cities.megiddo = {}
pharaohs_servant.regions.canaan   .cities.ugarit = {}
pharaohs_servant.regions.susa     .cities.susa = {}

-- City unlocked at the start
pharaohs_servant.regions.egypt    .cities.sais   .unlocked = true
pharaohs_servant.regions.egypt    .cities.memphis.unlocked = false
pharaohs_servant.regions.egypt    .cities.thebes .unlocked = false
pharaohs_servant.regions.aethiopia.cities.napata .unlocked = true
pharaohs_servant.regions.aethiopia.cities.kerma  .unlocked = true
pharaohs_servant.regions.aethiopia.cities.yeha   .unlocked = false
pharaohs_servant.regions.canaan   .cities.megiddo.unlocked = false
pharaohs_servant.regions.canaan   .cities.ugarit .unlocked = false
pharaohs_servant.regions.susa     .cities.susa   .unlocked = false

-- City unlock conditions
pharaohs_servant.regions.egypt    .cities.memphis.unlock_building_key   = "troy_rem_aethiopia_horde_main_4"
pharaohs_servant.regions.canaan   .cities.ugarit .unlock_building_key   = "troy_rem_aethiopia_horde_military_canaan_4"

pharaohs_servant.regions.egypt    .cities.thebes .unlock_technology_key = "troy_tech_rem_horde_memnon_6_unlocks_thebes"
pharaohs_servant.regions.aethiopia.cities.yeha   .unlock_technology_key = "troy_tech_rem_horde_memnon_1_unlocks_yeha"
pharaohs_servant.regions.canaan   .cities.megiddo.unlock_technology_key = "troy_tech_rem_horde_memnon_5_unlocks_megiddo"
pharaohs_servant.regions.susa     .cities.susa   .unlock_technology_key = "troy_tech_rem_horde_memnon_8_unlocks_susa"

-- Units
pharaohs_servant.regions.egypt.cities.sais.units = {
	egyptian_slingers = {},
	neru_infantry = {}
}

pharaohs_servant.regions.egypt.cities.memphis.units = {
	chariot_runners = {},
	manfyt_infantry = {},
	light_seneny_chariots = {}
}

pharaohs_servant.regions.egypt.cities.thebes.units = {
	egyptian_archers = {},
	nakhtu_aa_infantry = {},
	seneny_chariots = {}
}

pharaohs_servant.regions.aethiopia.cities.napata.units = {
	aethiopian_tribesmen = {},
	aethiopian_hunters = {},
	aethiopian_spearmen = {}
}

pharaohs_servant.regions.aethiopia.cities.kerma.units = {
	aethiopian_javelinmen = {},
	irjet_staff_bearers = {},
	aethiopian_archers = {}
}

pharaohs_servant.regions.aethiopia.cities.yeha.units = {
	archers_of_wawat = {},
	medjai_warriors = {}
}

pharaohs_servant.regions.canaan.cities.megiddo.units = {
	philistine_swordsmen = {},
	hupshu = {}
}

pharaohs_servant.regions.canaan.cities.ugarit.units = {
	henkhu_guards = {},
	maryannu = {}
}

pharaohs_servant.regions.susa.cities.susa.units = {
	elamite_stoneslingers = {},
	sherden_warriors = {}
}

-- Unit configs
pharaohs_servant.regions.egypt    .cities.sais   .units.egyptian_slingers    .key = "troy_rem_aeth_egyptian_slingers"
pharaohs_servant.regions.egypt    .cities.sais   .units.neru_infantry        .key = "troy_rem_aeth_nefru_infantry"
pharaohs_servant.regions.egypt    .cities.memphis.units.chariot_runners      .key = "troy_rem_aeth_chariot_runners"
pharaohs_servant.regions.egypt    .cities.memphis.units.manfyt_infantry      .key = "troy_rem_aeth_manfyt_infantry"
pharaohs_servant.regions.egypt    .cities.memphis.units.light_seneny_chariots.key = "troy_rem_aeth_light_seneny_chariots"
pharaohs_servant.regions.egypt    .cities.thebes .units.egyptian_archers     .key = "troy_rem_aeth_egyptian_archers"
pharaohs_servant.regions.egypt    .cities.thebes .units.nakhtu_aa_infantry   .key = "troy_rem_aeth_nakhtu_aa_infantry"
pharaohs_servant.regions.egypt    .cities.thebes .units.seneny_chariots      .key = "troy_rem_aeth_seneny_chariots"
pharaohs_servant.regions.aethiopia.cities.napata .units.aethiopian_tribesmen .key = "troy_rem_aeth_aethiopian_tribesmen"
pharaohs_servant.regions.aethiopia.cities.napata .units.aethiopian_hunters   .key = "troy_rem_aeth_aethiopian_hunters"
pharaohs_servant.regions.aethiopia.cities.napata .units.aethiopian_spearmen  .key = "troy_rem_aeth_aethiopian_spearmen"
pharaohs_servant.regions.aethiopia.cities.kerma  .units.aethiopian_javelinmen.key = "troy_rem_aeth_aethiopian_javelinmen"
pharaohs_servant.regions.aethiopia.cities.kerma  .units.irjet_staff_bearers  .key = "troy_rem_aeth_irtjet_staff_bearers"
pharaohs_servant.regions.aethiopia.cities.kerma  .units.aethiopian_archers   .key = "troy_rem_aeth_aethiopian_archers"
pharaohs_servant.regions.aethiopia.cities.yeha   .units.archers_of_wawat     .key = "troy_rem_aeth_archers_of_wawat"
pharaohs_servant.regions.aethiopia.cities.yeha   .units.medjai_warriors      .key = "troy_rem_aeth_mem_medjai_warriors"
pharaohs_servant.regions.canaan   .cities.megiddo.units.philistine_swordsmen .key = "troy_rem_aeth_philistine_swordsmen"
pharaohs_servant.regions.canaan   .cities.megiddo.units.hupshu               .key = "troy_rem_aeth_hupshu"
pharaohs_servant.regions.canaan   .cities.ugarit .units.henkhu_guards        .key = "troy_rem_aeth_henkhu_guards"
pharaohs_servant.regions.canaan   .cities.ugarit .units.maryannu             .key = "troy_rem_aeth_mem_maryannu"
pharaohs_servant.regions.susa     .cities.susa   .units.elamite_stoneslingers.key = "troy_rem_aeth_elamite_stoneslingers"
pharaohs_servant.regions.susa     .cities.susa   .units.sherden_warriors     .key = "troy_rem_aeth_mem_sherden_warriors"

pharaohs_servant.regions.egypt    .cities.sais   .units.egyptian_slingers    .recruitment_cap = 4
pharaohs_servant.regions.egypt    .cities.sais   .units.neru_infantry        .recruitment_cap = 6
pharaohs_servant.regions.egypt    .cities.memphis.units.chariot_runners      .recruitment_cap = 3
pharaohs_servant.regions.egypt    .cities.memphis.units.manfyt_infantry      .recruitment_cap = 4
pharaohs_servant.regions.egypt    .cities.memphis.units.light_seneny_chariots.recruitment_cap = 2
pharaohs_servant.regions.egypt    .cities.thebes .units.egyptian_archers     .recruitment_cap = 2
pharaohs_servant.regions.egypt    .cities.thebes .units.nakhtu_aa_infantry   .recruitment_cap = 2
pharaohs_servant.regions.egypt    .cities.thebes .units.seneny_chariots      .recruitment_cap = 2
pharaohs_servant.regions.aethiopia.cities.napata .units.aethiopian_tribesmen .recruitment_cap = 6
pharaohs_servant.regions.aethiopia.cities.napata .units.aethiopian_hunters   .recruitment_cap = 4
pharaohs_servant.regions.aethiopia.cities.napata .units.aethiopian_spearmen  .recruitment_cap = 4
pharaohs_servant.regions.aethiopia.cities.kerma  .units.aethiopian_javelinmen.recruitment_cap = 3
pharaohs_servant.regions.aethiopia.cities.kerma  .units.irjet_staff_bearers  .recruitment_cap = 4
pharaohs_servant.regions.aethiopia.cities.kerma  .units.aethiopian_archers   .recruitment_cap = 3
pharaohs_servant.regions.aethiopia.cities.yeha   .units.archers_of_wawat     .recruitment_cap = 2
pharaohs_servant.regions.aethiopia.cities.yeha   .units.medjai_warriors      .recruitment_cap = 2
pharaohs_servant.regions.canaan   .cities.megiddo.units.philistine_swordsmen .recruitment_cap = 4
pharaohs_servant.regions.canaan   .cities.megiddo.units.hupshu               .recruitment_cap = 3
pharaohs_servant.regions.canaan   .cities.ugarit .units.henkhu_guards        .recruitment_cap = 2
pharaohs_servant.regions.canaan   .cities.ugarit .units.maryannu             .recruitment_cap = 2
pharaohs_servant.regions.susa     .cities.susa   .units.elamite_stoneslingers.recruitment_cap = 3
pharaohs_servant.regions.susa     .cities.susa   .units.sherden_warriors     .recruitment_cap = 2

pharaohs_servant.regions.egypt    .cities.sais   .units.egyptian_slingers    .bucket_count = 1
pharaohs_servant.regions.egypt    .cities.sais   .units.neru_infantry        .bucket_count = 2
pharaohs_servant.regions.egypt    .cities.memphis.units.chariot_runners      .bucket_count = 1
pharaohs_servant.regions.egypt    .cities.memphis.units.manfyt_infantry      .bucket_count = 1
pharaohs_servant.regions.egypt    .cities.memphis.units.light_seneny_chariots.bucket_count = 1
pharaohs_servant.regions.egypt    .cities.thebes .units.egyptian_archers     .bucket_count = 1
pharaohs_servant.regions.egypt    .cities.thebes .units.nakhtu_aa_infantry   .bucket_count = 1
pharaohs_servant.regions.egypt    .cities.thebes .units.seneny_chariots      .bucket_count = 1
pharaohs_servant.regions.aethiopia.cities.napata .units.aethiopian_tribesmen .bucket_count = 2
pharaohs_servant.regions.aethiopia.cities.napata .units.aethiopian_hunters   .bucket_count = 1
pharaohs_servant.regions.aethiopia.cities.napata .units.aethiopian_spearmen  .bucket_count = 1
pharaohs_servant.regions.aethiopia.cities.kerma  .units.aethiopian_javelinmen.bucket_count = 1
pharaohs_servant.regions.aethiopia.cities.kerma  .units.irjet_staff_bearers  .bucket_count = 1
pharaohs_servant.regions.aethiopia.cities.kerma  .units.aethiopian_archers   .bucket_count = 1
pharaohs_servant.regions.aethiopia.cities.yeha   .units.archers_of_wawat     .bucket_count = 1
pharaohs_servant.regions.aethiopia.cities.yeha   .units.medjai_warriors      .bucket_count = 1
pharaohs_servant.regions.canaan   .cities.megiddo.units.philistine_swordsmen .bucket_count = 1
pharaohs_servant.regions.canaan   .cities.megiddo.units.hupshu               .bucket_count = 1
pharaohs_servant.regions.canaan   .cities.ugarit .units.henkhu_guards        .bucket_count = 1
pharaohs_servant.regions.canaan   .cities.ugarit .units.maryannu             .bucket_count = 1
pharaohs_servant.regions.susa     .cities.susa   .units.elamite_stoneslingers.bucket_count = 1
pharaohs_servant.regions.susa     .cities.susa   .units.sherden_warriors     .bucket_count = 1


-- Cap upgrade buildings
pharaohs_servant.regions.egypt    .cities.sais   .upgrade_building_key = "troy_rem_aethiopia_horde_main_1"
pharaohs_servant.regions.egypt    .cities.memphis.upgrade_building_key = "troy_rem_aethiopia_horde_main_3"
pharaohs_servant.regions.egypt    .cities.thebes .upgrade_building_key = "troy_rem_aethiopia_horde_main_5"
pharaohs_servant.regions.aethiopia.cities.napata .upgrade_building_key = "troy_rem_aethiopia_horde_military_aethiopia_2"
pharaohs_servant.regions.aethiopia.cities.kerma  .upgrade_building_key = "troy_rem_aethiopia_horde_military_aethiopia_3"
pharaohs_servant.regions.aethiopia.cities.yeha   .upgrade_building_key = "troy_rem_aethiopia_horde_military_aethiopia_5"
pharaohs_servant.regions.canaan   .cities.megiddo.upgrade_building_key = "troy_rem_aethiopia_horde_military_canaan_3"
pharaohs_servant.regions.canaan   .cities.ugarit .upgrade_building_key = "troy_rem_aethiopia_horde_military_canaan_5"
pharaohs_servant.regions.susa     .cities.susa   .upgrade_building_key = "troy_rem_aethiopia_horde_military_susa_5"

-- Bucket upgrade technologies
pharaohs_servant.regions.egypt.bucket_upgrade_technologies =
{
	{ technology_key = "troy_tech_rem_horde_memnon_3_size_of_buckets_africa", upgraded_amount = 1 },
	--{ technology_key = "key2", upgraded_amount = 1 },
	--{ technology_key = "key3", upgraded_amount = 1 },
}

pharaohs_servant.regions.aethiopia.bucket_upgrade_technologies =
{
	{ technology_key = "troy_tech_rem_horde_memnon_3_size_of_buckets_africa", upgraded_amount = 1 },
}

pharaohs_servant.regions.canaan.bucket_upgrade_technologies =
{
	{ technology_key = "troy_tech_rem_horde_memnon_12_size_of_buckets_asia", upgraded_amount = 1 },
	--{ technology_key = "key2", upgraded_amount = 1 },
}

pharaohs_servant.regions.susa.bucket_upgrade_technologies =
{
	{ technology_key = "troy_tech_rem_horde_memnon_12_size_of_buckets_asia", upgraded_amount = 1 },
	--{ technology_key = "key2", upgraded_amount = 1 },
}

-- Bucket costs
pharaohs_servant.resource_factor_key = "troy_resource_factor_faction"

-- Bucket resource cost modifiers. Multiplier should be a positive number, e.g. 0.7
pharaohs_servant.bucket_resource_cost_modifier_technologies = {
--	{ "technology_key", multiplier }
}

pharaohs_servant.regions.egypt    .cities.sais   .bucket_cost = { {"troy_food", 2000}, {"troy_wood", 175} }
pharaohs_servant.regions.egypt    .cities.memphis.bucket_cost = { {"troy_food", 7000}, {"troy_wood", 850} }
pharaohs_servant.regions.egypt    .cities.thebes .bucket_cost = { {"troy_food", 10000}, {"troy_wood", 400} }
pharaohs_servant.regions.aethiopia.cities.napata .bucket_cost = { {"troy_food", 500}, {"troy_wood", 820} }
pharaohs_servant.regions.aethiopia.cities.kerma  .bucket_cost = { {"troy_food", 1500}, {"troy_wood", 3000} }
pharaohs_servant.regions.aethiopia.cities.yeha   .bucket_cost = { {"troy_wood", 5000}, {"troy_gold", 200} }
pharaohs_servant.regions.canaan   .cities.megiddo.bucket_cost = { {"troy_wood", 300}, {"troy_bronze", 1800} }
pharaohs_servant.regions.canaan   .cities.ugarit .bucket_cost = { {"troy_bronze", 3500}, {"troy_gold", 100} }
pharaohs_servant.regions.susa     .cities.susa   .bucket_cost = { {"troy_wood", 1000}, {"troy_gold", 350} }

pharaohs_servant.max_recruitment_per_turn_technology_upgrades = {
	{ technology_key = "troy_tech_rem_horde_memnon_13_two_region_recruitment_unlocked", upgraded_amount = 1 },
}

pharaohs_servant.ai_purchase_buckets_tasks = {
	{
		start_turn = 0,
		frequency = 1, -- how frequently (in turns) the AI will execute this task
		possible_buckets = {
			{
				min_turn = 0,
				buckets = {
					pharaohs_servant.regions.egypt.cities.sais,
					pharaohs_servant.regions.aethiopia.cities.napata
				}
			},
			{
				min_turn = 25,
				buckets = {
					pharaohs_servant.regions.egypt.cities.memphis,
					pharaohs_servant.regions.aethiopia.cities.kerma
				}
			},
			{
				min_turn = 45,
				buckets = {
					pharaohs_servant.regions.canaan.cities.megiddo
				}
			},
		}
	},
	{
		start_turn = 60,
		frequency = 3, -- how frequently (in turns) the AI will execute this task
		possible_buckets = {
			{
				min_turn = 60,
				buckets = {
					pharaohs_servant.regions.egypt.cities.thebes,
					pharaohs_servant.regions.aethiopia.cities.yeha,
					pharaohs_servant.regions.canaan.cities.ugarit,
					pharaohs_servant.regions.susa.cities.susa,
				}
			},
		}
	},
}

----- You probably do not need to touch data bellow this comment if you're just configuring the mechanic
-- Max territories to recruit from per turn
pharaohs_servant.max_recruitment_territories_per_turn = 1
pharaohs_servant.recruitments_cur_turn = 0

pharaohs_servant.regions.egypt    .cities.sais   .on_cooldown = 0
pharaohs_servant.regions.egypt    .cities.memphis.on_cooldown = 0
pharaohs_servant.regions.egypt    .cities.thebes .on_cooldown = 0
pharaohs_servant.regions.aethiopia.cities.napata .on_cooldown = 0
pharaohs_servant.regions.aethiopia.cities.kerma  .on_cooldown = 0
pharaohs_servant.regions.aethiopia.cities.yeha   .on_cooldown = 0
pharaohs_servant.regions.canaan   .cities.megiddo.on_cooldown = 0
pharaohs_servant.regions.canaan   .cities.ugarit .on_cooldown = 0
pharaohs_servant.regions.susa     .cities.susa   .on_cooldown = 0

pharaohs_servant.regions.egypt    .cities.sais   .cooldown_on_recruit = 1
pharaohs_servant.regions.egypt    .cities.memphis.cooldown_on_recruit = 3
pharaohs_servant.regions.egypt    .cities.thebes .cooldown_on_recruit = 5
pharaohs_servant.regions.aethiopia.cities.napata .cooldown_on_recruit = 1
pharaohs_servant.regions.aethiopia.cities.kerma  .cooldown_on_recruit = 3
pharaohs_servant.regions.aethiopia.cities.yeha   .cooldown_on_recruit = 5
pharaohs_servant.regions.canaan   .cities.megiddo.cooldown_on_recruit = 3
pharaohs_servant.regions.canaan   .cities.ugarit .cooldown_on_recruit = 5
pharaohs_servant.regions.susa     .cities.susa   .cooldown_on_recruit = 3

pharaohs_servant.regions.egypt    .purchased_bucket_here_this_turn = false
pharaohs_servant.regions.aethiopia.purchased_bucket_here_this_turn = false
pharaohs_servant.regions.canaan   .purchased_bucket_here_this_turn = false
pharaohs_servant.regions.susa     .purchased_bucket_here_this_turn = false

-- City number of upgrades
pharaohs_servant.regions.egypt    .cities.sais   .number_of_upgrades = 0
pharaohs_servant.regions.egypt    .cities.memphis.number_of_upgrades = 0
pharaohs_servant.regions.egypt    .cities.thebes .number_of_upgrades = 0
pharaohs_servant.regions.aethiopia.cities.napata .number_of_upgrades = 0
pharaohs_servant.regions.aethiopia.cities.kerma  .number_of_upgrades = 0
pharaohs_servant.regions.aethiopia.cities.yeha   .number_of_upgrades = 0
pharaohs_servant.regions.canaan   .cities.megiddo.number_of_upgrades = 0
pharaohs_servant.regions.canaan   .cities.ugarit .number_of_upgrades = 0
pharaohs_servant.regions.susa     .cities.susa   .number_of_upgrades = 0

pharaohs_servant.regions.egypt    .bucket_upgrades_count = 0
pharaohs_servant.regions.aethiopia.bucket_upgrades_count = 0
pharaohs_servant.regions.canaan   .bucket_upgrades_count = 0
pharaohs_servant.regions.susa     .bucket_upgrades_count = 0

pharaohs_servant.regions.egypt    .cost_multiplier = 1
pharaohs_servant.regions.aethiopia.cost_multiplier = 1
pharaohs_servant.regions.canaan   .cost_multiplier = 1
pharaohs_servant.regions.susa     .cost_multiplier = 1

pharaohs_servant.regions.egypt    .cost_technologies = { troy_tech_rem_horde_memnon_2_recruitment_cost_egypt     = 0.85 }
pharaohs_servant.regions.aethiopia.cost_technologies = { troy_tech_rem_horde_memnon_4_recruitment_cost_aethiopia = 0.85 }
pharaohs_servant.regions.canaan   .cost_technologies = { troy_tech_rem_horde_memnon_7_recruitment_cost_canaan    = 0.85 }
pharaohs_servant.regions.susa     .cost_technologies = { }

pharaohs_servant.temporary_bucket_upgrades = 0
pharaohs_servant.playthrough_total_larger_buckets_bonus_collected = 0

pharaohs_servant.current_bucket_resource_multiplier = 1

-- UI stuff
pharaohs_servant.ui = {}
local ui = pharaohs_servant.ui

ui.panel = "fm_memnon_1"
ui.city_selected = nil
ui.region_details = "Region_details"
ui.region_container = "region_container"
ui.purchase_button = "square_ornament_button_orange"
ui.active_buttons = "active_buttons"
ui.locked_buttons = "locked_buttons"
ui.cooldown_buttons = "cooldown_buttons"
ui.selected_city = nil
ui.selected_city_component = nil
ui.uic = nil
ui.region_details_component = nil
ui.region_container_component = nil
ui.unit_card = "recruitment_item_"
ui.unit_card_amount = 3
ui.unit_card_components = {}
ui.unit_information = "unit_information"
ui.unit_information_component = nil
ui.image_container_id = "event_picture_thin_border"
ui.unit_capacity_id = "unit_capacity"

ui.confirm_purchase_id = "pharaohs_servant_purchase_bucket_prompt"
ui.confirm_purchase_description_key = "ui_text_replacements_localised_text_troy_rem_memnon_pharaon_servant_confirmation_purchase_bucket"

ui.city_active_tooltip_key = "ui_text_replacements_localised_text_troy_rem_memnon_pharaon_servant_territory_active"
ui.city_locked_tooltip_key = "ui_text_replacements_localised_text_troy_rem_memnon_pharaon_servant_territory_locked"
ui.city_cooldown_tooltip_key = "ui_text_replacements_localised_text_troy_rem_memnon_pharaon_servant_territory_cooldown"
ui.city_cooldown_purchased_from_other_region_tooltip_key = "ui_text_replacements_localised_text_troy_rem_memnon_pharaon_servant_purchased_from_other_region_tooltip"

ui.purchase_button_active_tooltip_key = "ui_text_replacements_localised_text_troy_rem_memnon_pharaon_servant_purchase_button_active"
ui.purchase_button_inactive_due_to_region_locked_key = "ui_text_replacements_localised_text_troy_rem_memnon_pharaon_servant_purchase_button_locked_region"
ui.purchase_button_inactive_due_to_cooldown_key = "ui_text_replacements_localised_text_troy_rem_memnon_pharaon_servant_territory_cooldown"
ui.purchase_button_inactive_due_to_recruiting_this_turn_in_other_regions = "ui_text_replacements_localised_text_troy_rem_memnon_pharaon_servant_recruiting_this_turn_in_other_regions"
ui.purchase_button_inactive_due_to_lack_of_resources_key = "ui_text_replacements_localised_text_troy_rem_memnon_pharaon_servant_purchase_button_resource_lock"

ui.max_recruitments_upgrade_message_event = {
	title_key = "event_feed_strings_text_troy_rem_event_feed_string_scripted_multiple_regions_title",
	primary_key = "event_feed_strings_text_troy_rem_event_feed_string_scripted_multiple_regions_primary_detial",
	secondary_key = "event_feed_strings_text_troy_rem_event_feed_string_scripted_multiple_regions_secondary_detial",
	persistent = true,
	index = 2114,
}

pharaohs_servant.city_button_suffix = "_button_toggle"
pharaohs_servant.regions.egypt    .cities.sais   .ui_button = "sais"   ..pharaohs_servant.city_button_suffix
pharaohs_servant.regions.egypt    .cities.memphis.ui_button = "memphis"..pharaohs_servant.city_button_suffix
pharaohs_servant.regions.egypt    .cities.thebes .ui_button = "thebes" ..pharaohs_servant.city_button_suffix
pharaohs_servant.regions.aethiopia.cities.napata .ui_button = "napata" ..pharaohs_servant.city_button_suffix
pharaohs_servant.regions.aethiopia.cities.kerma  .ui_button = "kerma"  ..pharaohs_servant.city_button_suffix
pharaohs_servant.regions.aethiopia.cities.yeha   .ui_button = "yeha"   ..pharaohs_servant.city_button_suffix
pharaohs_servant.regions.canaan   .cities.megiddo.ui_button = "megiddo"..pharaohs_servant.city_button_suffix
pharaohs_servant.regions.canaan   .cities.ugarit .ui_button = "ugarit" ..pharaohs_servant.city_button_suffix
pharaohs_servant.regions.susa     .cities.susa   .ui_button = "susa"   ..pharaohs_servant.city_button_suffix

pharaohs_servant.regions.egypt    .cities.sais   .ui_title_key = "ui_text_replacements_localised_text_troy_rem_memnon_pharaon_servant_region_sais_title"
pharaohs_servant.regions.egypt    .cities.memphis.ui_title_key = "ui_text_replacements_localised_text_troy_rem_memnon_pharaon_servant_region_memphis_title"
pharaohs_servant.regions.egypt    .cities.thebes .ui_title_key = "ui_text_replacements_localised_text_troy_rem_memnon_pharaon_servant_region_thebes_title"
pharaohs_servant.regions.aethiopia.cities.napata .ui_title_key = "ui_text_replacements_localised_text_troy_rem_memnon_pharaon_servant_region_napata_title"
pharaohs_servant.regions.aethiopia.cities.kerma  .ui_title_key = "ui_text_replacements_localised_text_troy_rem_memnon_pharaon_servant_region_kerma_title"
pharaohs_servant.regions.aethiopia.cities.yeha   .ui_title_key = "ui_text_replacements_localised_text_troy_rem_memnon_pharaon_servant_region_yeha_title"
pharaohs_servant.regions.canaan   .cities.megiddo.ui_title_key = "ui_text_replacements_localised_text_troy_rem_memnon_pharaon_servant_region_megiddo_title"
pharaohs_servant.regions.canaan   .cities.ugarit .ui_title_key = "ui_text_replacements_localised_text_troy_rem_memnon_pharaon_servant_region_ugarit_title"
pharaohs_servant.regions.susa     .cities.susa   .ui_title_key = "ui_text_replacements_localised_text_troy_rem_memnon_pharaon_servant_region_susa_title"

pharaohs_servant.regions.egypt    .cities.sais   .ui_description_key = "ui_text_replacements_localised_text_troy_rem_memnon_pharaon_servant_region_sais_description"
pharaohs_servant.regions.egypt    .cities.memphis.ui_description_key = "ui_text_replacements_localised_text_troy_rem_memnon_pharaon_servant_region_memphis_description"
pharaohs_servant.regions.egypt    .cities.thebes .ui_description_key = "ui_text_replacements_localised_text_troy_rem_memnon_pharaon_servant_region_thebes_description"
pharaohs_servant.regions.aethiopia.cities.napata .ui_description_key = "ui_text_replacements_localised_text_troy_rem_memnon_pharaon_servant_region_napata_description"
pharaohs_servant.regions.aethiopia.cities.kerma  .ui_description_key = "ui_text_replacements_localised_text_troy_rem_memnon_pharaon_servant_region_kerma_description"
pharaohs_servant.regions.aethiopia.cities.yeha   .ui_description_key = "ui_text_replacements_localised_text_troy_rem_memnon_pharaon_servant_region_yeha_description"
pharaohs_servant.regions.canaan   .cities.megiddo.ui_description_key = "ui_text_replacements_localised_text_troy_rem_memnon_pharaon_servant_region_megiddo_description"
pharaohs_servant.regions.canaan   .cities.ugarit .ui_description_key = "ui_text_replacements_localised_text_troy_rem_memnon_pharaon_servant_region_ugarit_description"
pharaohs_servant.regions.susa     .cities.susa   .ui_description_key = "ui_text_replacements_localised_text_troy_rem_memnon_pharaon_servant_region_susa_description"

pharaohs_servant.regions.egypt    .cities.sais   .ui_locked_tooltip = "ui_text_replacements_localised_text_troy_rem_memnon_pharaoh_servant_region_sais_locked_tooltip"
pharaohs_servant.regions.egypt    .cities.memphis.ui_locked_tooltip = "ui_text_replacements_localised_text_troy_rem_memnon_pharaoh_servant_region_memphis_locked_tooltip"
pharaohs_servant.regions.egypt    .cities.thebes .ui_locked_tooltip = "ui_text_replacements_localised_text_troy_rem_memnon_pharaoh_servant_region_thebes_locked_tooltip"
pharaohs_servant.regions.aethiopia.cities.napata .ui_locked_tooltip = "ui_text_replacements_localised_text_troy_rem_memnon_pharaoh_servant_region_napata_locked_tooltip"
pharaohs_servant.regions.aethiopia.cities.kerma  .ui_locked_tooltip = "ui_text_replacements_localised_text_troy_rem_memnon_pharaoh_servant_region_kerma_locked_tooltip"
pharaohs_servant.regions.aethiopia.cities.yeha   .ui_locked_tooltip = "ui_text_replacements_localised_text_troy_rem_memnon_pharaoh_servant_region_yeha_locked_tooltip"
pharaohs_servant.regions.canaan   .cities.megiddo.ui_locked_tooltip = "ui_text_replacements_localised_text_troy_rem_memnon_pharaoh_servant_region_megiddo_locked_tooltip"
pharaohs_servant.regions.canaan   .cities.ugarit .ui_locked_tooltip = "ui_text_replacements_localised_text_troy_rem_memnon_pharaoh_servant_region_ugarit_locked_tooltip"
pharaohs_servant.regions.susa     .cities.susa   .ui_locked_tooltip = "ui_text_replacements_localised_text_troy_rem_memnon_pharaoh_servant_region_susa_locked_tooltip"

pharaohs_servant.regions.egypt.cities.sais.ui_message_event_on_unlock = {
	title_key = "key",
	primary_key = "key",
	secondary_key = "key",
	persistent = false,
	index = 0,
}
pharaohs_servant.regions.egypt.cities.memphis.ui_message_event_on_unlock = {
	title_key = "event_feed_strings_text_troy_rem_event_feed_string_scripted_unlock_territory_title",
	primary_key = "event_feed_strings_text_troy_rem_event_feed_string_scripted_unlock_territory_memphis_primary_detail",
	secondary_key = "event_feed_strings_text_troy_rem_event_feed_string_scripted_unlock_territory_memphis_secondary_detail",
	persistent = true,
	index = 2108,
}
pharaohs_servant.regions.egypt.cities.thebes.ui_message_event_on_unlock = {
	title_key = "event_feed_strings_text_troy_rem_event_feed_string_scripted_unlock_territory_title",
	primary_key = "event_feed_strings_text_troy_rem_event_feed_string_scripted_unlock_territory_thebes_primary_detail",
	secondary_key = "event_feed_strings_text_troy_rem_event_feed_string_scripted_unlock_territory_thebes_secondary_detail",
	persistent = true,
	index = 2109,
}
pharaohs_servant.regions.aethiopia.cities.napata.ui_message_event_on_unlock = {
	title_key = "key",
	primary_key = "key",
	secondary_key = "key",
	persistent = true,
	index = 0,
}
pharaohs_servant.regions.aethiopia.cities.kerma.ui_message_event_on_unlock = {
	title_key = "key",
	primary_key = "key",
	secondary_key = "key",
	persistent = true,
	index = 0,
}
pharaohs_servant.regions.aethiopia.cities.yeha.ui_message_event_on_unlock = {
	title_key = "event_feed_strings_text_troy_rem_event_feed_string_scripted_unlock_territory_title",
	primary_key = "event_feed_strings_text_troy_rem_event_feed_string_scripted_unlock_territory_yeha_primary_detail",
	secondary_key = "event_feed_strings_text_troy_rem_event_feed_string_scripted_unlock_territory_yeha_secondary_detail",
	persistent = true,
	index = 2110,
}
pharaohs_servant.regions.canaan.cities.megiddo.ui_message_event_on_unlock = {
	title_key = "event_feed_strings_text_troy_rem_event_feed_string_scripted_unlock_territory_title",
	primary_key = "event_feed_strings_text_troy_rem_event_feed_string_scripted_unlock_territory_megiddo_primary_detail",
	secondary_key = "event_feed_strings_text_troy_rem_event_feed_string_scripted_unlock_territory_megiddo_secondary_detail",
	persistent = true,
	index = 2112,
}
pharaohs_servant.regions.canaan.cities.ugarit.ui_message_event_on_unlock = {
	title_key = "event_feed_strings_text_troy_rem_event_feed_string_scripted_unlock_territory_title",
	primary_key = "event_feed_strings_text_troy_rem_event_feed_string_scripted_unlock_territory_ugarit_primary_detail",
	secondary_key = "event_feed_strings_text_troy_rem_event_feed_string_scripted_unlock_territory_ugarit_secondary_detail",
	persistent = true,
	index = 2111,
}
pharaohs_servant.regions.susa.cities.susa.ui_message_event_on_unlock = {
	title_key = "event_feed_strings_text_troy_rem_event_feed_string_scripted_unlock_territory_title",
	primary_key = "event_feed_strings_text_troy_rem_event_feed_string_scripted_unlock_territory_susa_primary_detail",
	secondary_key = "event_feed_strings_text_troy_rem_event_feed_string_scripted_unlock_territory_susa_secondary_detail",
	persistent = true,
	index = 2113,
}

pharaohs_servant.regions.egypt    .cities.sais   .ui_image_state = "Sais"
pharaohs_servant.regions.egypt    .cities.memphis.ui_image_state = "Memphis"
pharaohs_servant.regions.egypt    .cities.thebes .ui_image_state = "Thebes"
pharaohs_servant.regions.aethiopia.cities.napata .ui_image_state = "Napata"
pharaohs_servant.regions.aethiopia.cities.kerma  .ui_image_state = "Kerma"
pharaohs_servant.regions.aethiopia.cities.yeha   .ui_image_state = "Yeha"
pharaohs_servant.regions.canaan   .cities.megiddo.ui_image_state = "Megiddo"
pharaohs_servant.regions.canaan   .cities.ugarit .ui_image_state = "Ugarit"
pharaohs_servant.regions.susa     .cities.susa   .ui_image_state = "Susa"

pharaohs_servant.warriors_of_artemis_key = "troy_dlc2_warriors_of_artemis"
pharaohs_servant.warriors_of_artemis_cap = 10
pharaohs_servant.warriors_of_artemis_to_recruit = { 2, 5, 7 }

 -- Functions
pharaohs_servant.purchase_bucket = function(city, bucket_cost)
	local region = city.region
	local faction = cm:get_faction(pharaohs_servant.faction_key)

	if not bucket_cost then
		bucket_cost = pharaohs_servant.city_bucket_cost(city)
	end

	if faction and city.unlocked and not pharaohs_servant.on_cooldown(city) and pharaohs_servant.can_afford_bucket(city) then
		local faction_cqi = faction:command_queue_index()
		for _, unit in pairs(city.units) do
			local cur_amount = cm:num_units_in_faction_mercenary_pool(faction_cqi, unit.key)
			local amount_to_recruit = pharaohs_servant.get_number_of_units_that_can_actually_be_recruited_from_city(city, unit) + cur_amount
			local max_recruits = pharaohs_servant.get_city_recruitment_cap(city, unit)

			if amount_to_recruit < 0 then
				script_error("ASSERT: amount to recruit < 0, something is wrong!")
			elseif amount_to_recruit > 0 then
				cm:add_unit_to_faction_mercenary_pool(faction, unit.key, amount_to_recruit, 0, max_recruits, 0, 0, "", "", "")
			end
		end

		for _, resource in ipairs(bucket_cost) do
			cm:faction_add_pooled_resource(pharaohs_servant.faction_key, resource[1], pharaohs_servant.resource_factor_key, -resource[2])
		end

		city.on_cooldown = city.cooldown_on_recruit
		if not city.region.purchased_here_this_turn then
			city.region.purchased_here_this_turn = true
			pharaohs_servant.recruitments_cur_turn = pharaohs_servant.recruitments_cur_turn + 1
		end

		pharaohs_servant.temporary_bucket_upgrades = 0

		for city_name, _city in pairs(region.cities) do
			if city == _city then
				core:trigger_event("ScriptEventMemnonPharaohsServantBucketPurchased", city_name)
			end
		end
	end
end

pharaohs_servant.get_unit_bucket_count = function(region, unit)
	return region.bucket_upgrades_count + unit.bucket_count + pharaohs_servant.temporary_bucket_upgrades
end

pharaohs_servant.get_city_recruitment_cap = function(city, unit)
	return city.number_of_upgrades + unit.recruitment_cap
end

pharaohs_servant.get_number_of_units_that_can_actually_be_recruited_from_city = function(city, unit)
	local num_units_to_recruit = pharaohs_servant.get_unit_bucket_count(city.region, unit)
	local max_recruits = pharaohs_servant.get_city_recruitment_cap(city, unit)
	local faction_cqi = cm:get_faction(pharaohs_servant.faction_key):command_queue_index()
	local cur_amount = cm:num_units_in_faction_mercenary_pool(faction_cqi, unit.key)

	num_units_to_recruit = math.min(num_units_to_recruit, max_recruits - cur_amount) -- substract the units that are already in the mercenary pool because we have a max cap
	num_units_to_recruit = math.max(0, num_units_to_recruit) -- this shouldn't be negative, but just in case
	
	return num_units_to_recruit
end

pharaohs_servant.city_bucket_cost = function(city)
	local cost = deep_copy(city.bucket_cost)
	for _, resource in pairs(cost) do
		resource[2] = resource[2] * pharaohs_servant.current_bucket_resource_multiplier * city.region.cost_multiplier
	end
	return cost
end

pharaohs_servant.can_afford_bucket = function(city)
	return cm:faction_can_afford_resource_cost(cm:get_faction(pharaohs_servant.faction_key), pharaohs_servant.city_bucket_cost(city))
end

pharaohs_servant.num_unlocked_cities = function()
	local num = 0

	for _, region in pairs(pharaohs_servant.regions) do
		for _, city in pairs(region.cities) do
			if city.unlocked then
				num = num + 1
			end
		end
	end

	return num
end

pharaohs_servant.unlock_city_via_building = function(building)
	local unlocked_something = false

	for _, region in pairs(pharaohs_servant.regions) do
		for _, city in pairs(region.cities) do
			if building == city.unlock_building_key and not city.unlocked then
				unlocked_something = true
				city.unlocked = true
				pharaohs_servant.show_unlock_message_event(city)
			end
		end
	end

	if unlocked_something then
		core:trigger_event(
				"ScriptEventFactionVictoryConditionProgress",
				pharaohs_servant.num_unlocked_cities()-3,
				"troy_rem_horde_aethiopians_personal_objective_pharaohs_servant_regions",
				cm:model():world():faction_by_key(pharaohs_servant.faction_key)
		)
	end
end

pharaohs_servant.unlock_city_via_technology = function(technology)
	local unlocked_something = false

	for _, region in pairs(pharaohs_servant.regions) do
		for _, city in pairs(region.cities) do
			if technology == city.unlock_technology_key then
				unlocked_something = true
				city.unlocked = true
				pharaohs_servant.show_unlock_message_event(city)
			end
		end
	end

	if unlocked_something then
		core:trigger_event(
				"ScriptEventFactionVictoryConditionProgress",
				pharaohs_servant.num_unlocked_cities()-3,
				"troy_rem_horde_aethiopians_personal_objective_pharaohs_servant_regions",
				cm:model():world():faction_by_key(pharaohs_servant.faction_key)
		)
	end
end

pharaohs_servant.show_unlock_message_event = function(city)
	local ev = city.ui_message_event_on_unlock
	cm:show_message_event(pharaohs_servant.faction_key, ev.title_key, ev.primary_key, ev.secondary_key, ev.persistent, ev.index)
end

pharaohs_servant.apply_bucket_resource_cost_multiplier = function(technology)
	for _, tech in ipairs(pharaohs_servant.bucket_resource_cost_modifier_technologies) do
		if technology == tech[1] then
			pharaohs_servant.current_bucket_resource_multiplier = pharaohs_servant.current_bucket_resource_multiplier * tech[2]
		end
	end

	for _, region in pairs(pharaohs_servant.regions) do
		if region.cost_technologies[technology] then
			region.cost_multiplier = region.cost_multiplier * region.cost_technologies[technology]
		end
	end
end

pharaohs_servant.apply_bucket_resource_cost_multiplier_raw = function(number)
	pharaohs_servant.current_bucket_resource_multiplier = pharaohs_servant.current_bucket_resource_multiplier * number
end

pharaohs_servant.increase_unit_upgrades = function(building)
	for _, region in pairs(pharaohs_servant.regions) do
		for _, city in pairs(region.cities) do
			if building == city.upgrade_building_key then
				city.number_of_upgrades = city.number_of_upgrades + 1
			end
		end
	end
end

pharaohs_servant.decrease_unit_upgrades = function(building)
	for _, region in pairs(pharaohs_servant.regions) do
		for _, city in pairs(region.cities) do
			if building == city.upgrade_building_key then
				city.number_of_upgrades = city.number_of_upgrades - 1
				if city.number_of_upgrades < 0 then
					script_error("ASSERT: Pharaoh's Servant: city.number_of_upgrades < 0, something is wrong!")
					city.number_of_upgrades = 0
				end
			end
		end
	end
end

pharaohs_servant.raise_bucket_upgrades_via_tech = function(technology)
	for _, region in pairs(pharaohs_servant.regions) do
		for _, upg_tech in pairs(region.bucket_upgrade_technologies) do
			if technology == upg_tech.technology_key then
				region.bucket_upgrades_count = region.bucket_upgrades_count + upg_tech.upgraded_amount
			end
		end
	end
end

pharaohs_servant.raise_max_recruitments_per_turn = function(technology)
	for _, upg_tech in pairs(pharaohs_servant.max_recruitment_per_turn_technology_upgrades) do
		if technology == upg_tech.technology_key then
			pharaohs_servant.max_recruitment_territories_per_turn = pharaohs_servant.max_recruitment_territories_per_turn + upg_tech.upgraded_amount
			local ev = ui.max_recruitments_upgrade_message_event
			cm:show_message_event(pharaohs_servant.faction_key, ev.title_key, ev.primary_key, ev.secondary_key, ev.persistent, ev.index)
		end
	end
end

-- returns cooldown and if the cooldown is active because another territory was activated
pharaohs_servant.get_cooldown = function(city)
	if city.on_cooldown > 0 then
		return city.on_cooldown, false
	end

	if pharaohs_servant.max_recruitment_territories_per_turn <= pharaohs_servant.recruitments_cur_turn and not city.region.purchased_here_this_turn then
		return 1, true
	end

	return 0, false
end

pharaohs_servant.on_cooldown = function(city)
	return city.on_cooldown > 0 or (pharaohs_servant.max_recruitment_territories_per_turn <= pharaohs_servant.recruitments_cur_turn and not city.region.purchased_here_this_turn)
end

pharaohs_servant.on_settlement_with_capture_bonus_larger_buckets_razed = function(faction_key, value)
	if faction_key ~= pharaohs_servant.faction_key then
		script_error("Pharaoh's Servant: method on_settlement_with_capture_bonus_larger_buckets_razed called for faction "..faction_key.." which is not Memnon's faction! ("..pharaohs_servant.faction_key..")")
		return
	end

	pharaohs_servant.playthrough_total_larger_buckets_bonus_collected = pharaohs_servant.playthrough_total_larger_buckets_bonus_collected + 1
	achievements.memnon.func_memnon_capture_bonus_larger_buckets_collected(pharaohs_servant.playthrough_total_larger_buckets_bonus_collected)

	pharaohs_servant.temporary_bucket_upgrades = pharaohs_servant.temporary_bucket_upgrades + value
end

ui.set_city_button_visibility = function(buttons_object, city, visibility, tooltip)
	local city_button = buttons_object:Find(city.ui_button)
	if city_button then
		city_button = UIComponent(city_button)
		city_button:SetVisible(visibility)
		if tooltip then
			city_button:SetTooltipText(tooltip, "", true)
		end
	end
end

ui.get_buttons_object = function(uic, buttons_object)
	buttons_object = uic:Find(buttons_object)
	if buttons_object then
		return UIComponent(buttons_object)
	end

	return nil
end

ui.set_button_state = function(uic, buttons_object, city, visibility, tooltip)
	ui.set_city_button_visibility(buttons_object, city, visibility, tooltip)
end

ui.unset_active = function(uic, city)
	local active_buttons_uic = ui.get_buttons_object(uic, ui.active_buttons)
	if active_buttons_uic then
		ui.set_button_state(uic, active_buttons_uic, city, false, nil)
	end
end

ui.set_active = function(uic, city)
	local active_buttons_uic = ui.get_buttons_object(uic, ui.active_buttons)
	if active_buttons_uic then
		local tooltip = common.get_localised_string(ui.city_active_tooltip_key)
		ui.set_button_state(uic, active_buttons_uic, city, true, tooltip)
	end
end

ui.set_locked = function(uic, city)
	local locked_buttons_uic = ui.get_buttons_object(uic, ui.locked_buttons)
	if locked_buttons_uic then
		local tooltip = common.get_localised_string(city.ui_locked_tooltip)
		ui.set_button_state(uic, locked_buttons_uic, city, true, tooltip)
	end
end

ui.set_on_cooldown = function(uic, city, cd, is_cooldown_from_recruiting_this_turn_in_other_regions)
	local cooldown_buttons_uic = ui.get_buttons_object(uic, ui.cooldown_buttons)
	if cooldown_buttons_uic then
		local tooltip
		if is_cooldown_from_recruiting_this_turn_in_other_regions then
			tooltip = common.get_localised_string(ui.city_cooldown_purchased_from_other_region_tooltip_key)
		else
			tooltip = common.get_localised_string(ui.city_cooldown_tooltip_key)
		end
		ui.set_button_state(uic, cooldown_buttons_uic, city, true, tooltip)
		
		local cooldown_counter_uic = cooldown_buttons_uic:SequentialFind(city.ui_button, "cooldown_counter")
		if cooldown_counter_uic then
			cooldown_counter_uic:SetStateText(tostring(cd), "From troy_rem_memnon_pharaohs_servant.lua cooldown turns- unlocalized text")
		end						
	end
end

ui.set_unselected = function(city)
	city:SetState("active")
end

ui.set_selected = function(city)
	city:SetState("selected")
end

ui.refresh_regions = function()
	for _, region in pairs(pharaohs_servant.regions) do
		for _, city in pairs(region.cities) do
			if not city.unlocked then
				ui.unset_active(ui.uic, city)
				ui.set_locked(ui.uic, city)
			elseif pharaohs_servant.on_cooldown(city) then
				ui.unset_active(ui.uic, city)
				local cd, is_cooldown_from_recruiting_this_turn_in_other_regions = pharaohs_servant.get_cooldown(city)
				ui.set_on_cooldown(ui.uic, city, cd, is_cooldown_from_recruiting_this_turn_in_other_regions)
			else
				ui.set_active(ui.uic, city)
			end
		end
	end
end

ui.panel_opened = function(context)
	for index, listener in ipairs(ui.listeners) do
		core:add_listener(
			"pharaohs_servant_ui_"..listener.event.."_"..index,
			listener.event,
			listener.filter,
			listener.body,
			true
		)
	end

	-- Setup the panel
	ui.uic = UIComponent(context.component)

	-- Hide region details
	local region_details = ui.uic:Find(ui.region_details)

	if region_details then
		ui.region_details_component = UIComponent(region_details)
	end

	ui.region_container_component = ui.uic:SequentialFind("region_container")
	if ui.region_container_component then
		ui.region_container_component:SetVisible(false)
	end

	local purchase_button = ui.uic:Find(ui.purchase_button)

	if purchase_button then
		ui.purchase_button_component = UIComponent(purchase_button)
	end

	local unit_information = ui.uic:Find(ui.unit_information)
	if unit_information then
		ui.unit_information_component = UIComponent(unit_information)
	end

	-- Set which regions are active, locked or on cooldown
	ui.refresh_regions()

	for i = 1, ui.unit_card_amount do
		local unit_card = ui.uic:Find(ui.unit_card..i)
		if unit_card then
			table.insert(ui.unit_card_components, UIComponent(unit_card))
		end
	end
end

ui.panel_closed = function(context)
	for index, listener in ipairs(ui.listeners) do
		core:remove_listener("pharaohs_servant_ui_"..listener.event.."_"..index)
	end

	ui.selected_city = nil
	ui.selected_city_component = nil
	ui.uic = nil
	ui.region_details_component = nil
	ui.region_container_component = nil
	ui.unit_card_components = {}
end

ui.get_clicked_city = function(clicked_string)
	for _, region in pairs(pharaohs_servant.regions) do
		for _, city in pairs(region.cities) do
			if city.ui_button == clicked_string then
				return city
			end
		end
	end

	return nil
end

ui.close_city_info = function()
	if ui.selected_city and ui.selected_city_component then
		ui.set_unselected(ui.selected_city_component)
		ui.selected_city = nil
		ui.selected_city_component = nil
	end
	if ui.region_container_component then
		ui.region_container_component:SetVisible(false)
	end
end

ui.activate_purchase_button = function(tooltip)
	if ui.purchase_button_component then
		ui.purchase_button_component:SetState("active")
		if tooltip then
			ui.purchase_button_component:SetTooltipText(tooltip, "", true)
		end
	end
end

ui.deactivate_purchase_button = function(tooltip)
	if ui.purchase_button_component then
		ui.purchase_button_component:SetState("inactive")
		if tooltip then
			ui.purchase_button_component:SetTooltipText(tooltip, "", true)
		end
	end
end

ui.city_selected = function(context, clicked_string)
	local city = ui.get_clicked_city(clicked_string)

	if not city then
		return
	end

	if ui.selected_city and ui.selected_city_component then
		if ui.selected_city.ui_button == clicked_string then
			ui.selected_city = nil
			ui.selected_city_component = nil
			ui.region_container_component:SetVisible(false)
			return
		end
		ui.set_unselected(ui.selected_city_component)
	end
	ui.selected_city = city
	ui.selected_city_component = UIComponent(context.component)

	if not city.unlocked then
		ui.deactivate_purchase_button(common.get_localised_string(ui.purchase_button_inactive_due_to_region_locked_key))
	elseif pharaohs_servant.on_cooldown(city) then
		local _, is_cooldown_from_recruiting_this_turn_in_other_regions = pharaohs_servant.get_cooldown(city)
		local tooltip_key = is_cooldown_from_recruiting_this_turn_in_other_regions and ui.purchase_button_inactive_due_to_recruiting_this_turn_in_other_regions or 
							ui.purchase_button_inactive_due_to_cooldown_key

		ui.deactivate_purchase_button(common.get_localised_string(tooltip_key))
	elseif not pharaohs_servant.can_afford_bucket(city) then
		ui.deactivate_purchase_button(common.get_localised_string(ui.purchase_button_inactive_due_to_lack_of_resources_key))
	else
		ui.activate_purchase_button(common.get_localised_string(ui.purchase_button_active_tooltip_key))
	end

	if ui.region_details_component then
		local dy_title       = ui.region_details_component:Find("dy_title")
		local dy_description = ui.region_details_component:Find("dy_description")
		local dy_price       = ui.region_details_component:Find("dy_price")

		if dy_title then
			dy_title = UIComponent(dy_title)
			dy_title:SetStateText(common.get_localised_string(city.ui_title_key))
		end

		if dy_description then
			dy_description = UIComponent(dy_description)
			dy_description:SetStateText(common.get_localised_string(city.ui_description_key))
		end

		if dy_price then
			dy_price = UIComponent(dy_price)

			local resource_cost = cm:create_new_custom_resource_cost()

			local bucket_cost = pharaohs_servant.city_bucket_cost(city)
			for _, res in ipairs(bucket_cost) do
				resource_cost:add_resource_cost(res[1], pharaohs_servant.resource_factor_key, res[2])
			end

			local faction = cm:get_faction(pharaohs_servant.faction_key)
			local price_text = resource_cost:to_string(faction)
			dy_price:SetStateText(price_text)
		end

		if ui.region_container_component then
			ui.region_container_component:SetVisible(true)
		end

		local unit_card_index = 1
		local unit_card_amount = table.getn(ui.unit_card_components)
		for _, unit in pairs(city.units) do
			if unit_card_index > unit_card_amount then
				break
			end

			local unit_uic = ui.unit_card_components[unit_card_index]
			local num_units_to_recruit = pharaohs_servant.get_number_of_units_that_can_actually_be_recruited_from_city(city, unit)

			unit_uic:InterfaceFunction("init_card", unit.key, pharaohs_servant.faction_key, num_units_to_recruit)
			unit_uic:SetVisible(true)

			local unit_capacity_uic = unit_uic:SequentialFind(ui.unit_capacity_id)
			if unit_capacity_uic then
				local unit_cap = pharaohs_servant.get_city_recruitment_cap(city, unit)
				unit_capacity_uic:SetVisible(true)
				unit_capacity_uic:SetStateText(""..unit_cap)
			end
			unit_card_index = unit_card_index + 1
		end

		for i = unit_card_index, unit_card_amount do
			ui.unit_card_components[unit_card_index]:SetVisible(false)
		end
	end

	local image_container = ui.uic:SequentialFind(ui.image_container_id)
	if image_container then
		image_container:SetState(city.ui_image_state)
	end
end

pharaohs_servant.listeners = {
	--	{
	--		event = "",
	--		filter = function(context) end,
	--		body = function(context) end
	--	},

	{
		event = "CharacterMilitaryForceBuildingCompleted",
		filter = function(context)
			return context:building():faction():name() == pharaohs_servant.faction_key
		end,
		body = function(context)
			local building_name = context:building():name()
			pharaohs_servant.increase_unit_upgrades(building_name)
			pharaohs_servant.unlock_city_via_building(building_name)
		end
	},

	{
		event = "CharacterMilitaryForceBuildingDemolished",
		filter = function(context)
			return context:character():faction():name() == pharaohs_servant.faction_key
		end,
		body = function(context)
			pharaohs_servant.decrease_unit_upgrades(context:building():name())
		end
	},

	{
		event = "MilitaryForceDestroyed",
		filter = function(context)
			return context:military_force():faction():name() == pharaohs_servant.faction_key
		end,
		body = function(context)
			local buildings = context:military_force():buildings()
			for i = 0, buildings:num_items() - 1 do
				local building = buildings:item_at(i)
				if building then
					local building_name = building:name()
					pharaohs_servant.decrease_unit_upgrades(building_name)
				end
			end
		end
	},

	{
		event = "ResearchCompleted",
		filter = function(context)
			return context:faction():name() == pharaohs_servant.faction_key
		end,
		body = function(context)
			local technology_name = context:technology()
			pharaohs_servant.raise_bucket_upgrades_via_tech(technology_name)
			pharaohs_servant.raise_max_recruitments_per_turn(technology_name)
			pharaohs_servant.unlock_city_via_technology(technology_name)
			pharaohs_servant.apply_bucket_resource_cost_multiplier(technology_name)
		end
	},

	{
		event = "FactionTurnStart",
		filter = function(context)
			return context:faction():name() == pharaohs_servant.faction_key
		end,
		body = function(context)
			pharaohs_servant.recruitments_cur_turn = 0

			for _, region in pairs(pharaohs_servant.regions) do
				region.purchased_here_this_turn = false

				for _, city in pairs(region.cities) do
					if city.on_cooldown > 0 then
						city.on_cooldown = city.on_cooldown - 1
					end
				end
			end
		end
	},

	{
		event = "PanelOpenedCampaign",
		filter = function(context)
			return context.string == ui.panel
		end,
		body = ui.panel_opened
	},

	{
		event = "PanelClosedCampaign",
		filter = function(context)
			return context.string == ui.panel
		end,
		body = ui.panel_closed
	},

	{
		event = "UITriggerScriptEvent",
		filter = function(context)
			return context:trigger():split(":")[1] == "pharaohs_servant_purchase_bucket"
		end,
		body = function(context)
			local city_button_name = context:trigger():split(":")[2]

			for _, region in pairs(pharaohs_servant.regions) do
				for _, city in pairs(region.cities) do
					if city.ui_button == city_button_name then
						pharaohs_servant.purchase_bucket(city)
						break
					end
				end
			end

			if ui.uic then
				ui.close_city_info()
				ui.refresh_regions()
			end
		end
	},

	{--pharaohs_servant_purchase_buckets_for_ai
		event = "FactionTurnStart",
		filter = function(context)
			local faction = context:faction()
			return faction:name() == pharaohs_servant.faction_key and not faction:is_human()
		end,
		body = function(context)
			for _, task in ipairs(pharaohs_servant.ai_purchase_buckets_tasks) do
				local current_turn = cm:turn_number()

				if current_turn >= task.start_turn and current_turn % task.frequency == 0 then
					local has_found_bucket_for_this_task = false

					-- try purchasing the highest tier first
					for i = #task.possible_buckets, 1, -1 do
						local possible_bucket = task.possible_buckets[i]

						if current_turn >= possible_bucket.min_turn then
							local indices = {}
							for j = 1, #possible_bucket.buckets do
								table.insert(indices, j)
							end
							indices = cm:random_sort(indices)

							for k = 1, #indices do
								local city = possible_bucket.buckets[indices[k]]
								local can_purchase = city.unlocked and 
													not pharaohs_servant.on_cooldown(city) and 
													pharaohs_servant.can_afford_bucket(city)

								if can_purchase then
									pharaohs_servant.purchase_bucket(city)
									has_found_bucket_for_this_task = true
									break
								end
							end
						end

						if has_found_bucket_for_this_task then
							break
						end
					end
				end  
			end
		end,
	},

	{
		event = "PanelOpenedCampaign",
		filter = function(context)
			local units_panel = "mercenary_recruitment"
			return cm:get_local_faction_name(true) == pharaohs_servant.faction_key and context.string == units_panel
		end,
		body = function(context)
			local uic = UIComponent(context.component)
			for _, region in pairs(pharaohs_servant.regions) do
				for _, city in pairs(region.cities) do
					for _, unit in pairs(city.units) do
						local unit_capacity_uic = uic:SequentialFind(unit.key.."_mercenary", ui.unit_capacity_id)
						if unit_capacity_uic then
							local unit_cap = pharaohs_servant.get_city_recruitment_cap(city, unit)
							unit_capacity_uic:SetVisible(true)
							unit_capacity_uic:SetStateText(""..unit_cap)
						end
					end
				end
			end

			local unit_capacity_uic = uic:SequentialFind(pharaohs_servant.warriors_of_artemis_key.."_mercenary", ui.unit_capacity_id)
			if unit_capacity_uic then
				local unit_cap = pharaohs_servant.warriors_of_artemis_cap
				unit_capacity_uic:SetVisible(true)
				unit_capacity_uic:SetStateText(""..unit_cap)
			end
		end
	},

	{
		event = "FactionInitiatesPrayer",
		filter = function(context)
			return context:god():name() == "artemis"
					and context:faction():name() == pharaohs_servant.faction_key
					and context:tier() > 0
		end,
		body = function(context)
			local tier = context:tier()
			local faction = cm:get_faction(pharaohs_servant.faction_key)
			local key = pharaohs_servant.warriors_of_artemis_key
			local to_recruit = pharaohs_servant.warriors_of_artemis_to_recruit[tier]
								+ cm:num_units_in_faction_mercenary_pool(faction:command_queue_index(), key)
			local cap = pharaohs_servant.warriors_of_artemis_cap

			cm:add_unit_to_faction_mercenary_pool(faction, key, to_recruit, 0, cap, 0, 0, "", "", "")
		end
	},
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
			return ui.uic and uicomponent_descended_from(UIComponent(context.component), ui.panel)
		end,
		body = function(context)
			-- Check if user clicked on a city. All the city buttons have a common suffix
			local clicked_string = context.string
			if clicked_string:find(pharaohs_servant.city_button_suffix) then
				ui.city_selected(context, clicked_string)
			elseif uicomponent_descended_from(UIComponent(context.component), ui.region_details) then
				if clicked_string == ui.purchase_button and ui.selected_city then
					local faction = cm:get_faction(pharaohs_servant.faction_key)
					local faction_cqi = faction:command_queue_index()
					local currently_selected_city = ui.selected_city
					create_confirmation_box(ui.confirm_purchase_id, ui.confirm_purchase_description_key,
						function()
							CampaignUI.TriggerCampaignScriptEvent(faction_cqi, "pharaohs_servant_purchase_bucket:" .. currently_selected_city.ui_button)
							CampaignUI.TriggerCampaignVO(pharaohs_servant.vo_event, pharaohs_servant.faction_key)
						end,
						nil,
						ui.uic
					)
				end
			else
				ui.close_city_info()
				if ui.unit_information_component then
					ui.unit_information_component:SetVisible(false)
				end
			end
		end
	},
}

pharaohs_servant.add_listeners = function()
	for index, listener in ipairs(pharaohs_servant.listeners) do
		core:add_listener(
			"pharaohs_servant_"..listener.event.."_"..index,
			listener.event,
			listener.filter,
			listener.body,
			true
		)
	end
end

-- Backwards pointers to easily access the region the city is from
for _, region in pairs(pharaohs_servant.regions) do
	for _, city in pairs(region.cities) do
		city.region = region
	end
end

--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------

cm:add_saving_game_callback(
	function(context)
		local region_data = {}

		for region_key, region_vals in pairs(pharaohs_servant.regions) do
			region_data[region_key] = {
				bucket_upgrades_count    = region_vals.bucket_upgrades_count,
				cities                   = {},
				purchased_here_this_turn = region_vals.purchased_here_this_turn,
				cost_multiplier          = region_vals.cost_multiplier,
			}

			for city_key, city_vals in pairs(region_vals.cities) do
				region_data[region_key].cities[city_key] = {
					unlocked           = city_vals.unlocked,
					number_of_upgrades = city_vals.number_of_upgrades,
					on_cooldown        = city_vals.on_cooldown
				}
			end
		end

		cm:save_named_value("TROY_PHARAOHS_SERVANT_DATA", region_data, context)
		cm:save_named_value("TROY_PHARAOHS_SERVANT_CUR_TURN_RECRUITMENTS", pharaohs_servant.recruitments_cur_turn, context)
		cm:save_named_value("TROY_PHARAOHS_SERVANT_CUR_BUCKET_RESOURCE_MULTIPLIER", pharaohs_servant.current_bucket_resource_multiplier, context)
		cm:save_named_value("TROY_PHARAOHS_SERVANT_TEMP_BUCKET_UPGRADES", pharaohs_servant.temporary_bucket_upgrades, context)
		cm:save_named_value("TROY_PHARAOHS_SERVANT_TOTAL_LARGER_BUCKETS_BONUS_COLLECTED", pharaohs_servant.playthrough_total_larger_buckets_bonus_collected, context)
		cm:save_named_value("TROY_PHARAOHS_SERVANT_MAX_RECRUITMENT_TERRITORIES_PER_TURN", pharaohs_servant.max_recruitment_territories_per_turn, context)
	end
)

cm:add_loading_game_callback(
	function(context)
		local region_data = cm:load_named_value("TROY_PHARAOHS_SERVANT_DATA", {}, context)
		pharaohs_servant.recruitments_cur_turn = cm:load_named_value("TROY_PHARAOHS_SERVANT_CUR_TURN_RECRUITMENTS", pharaohs_servant.recruitments_cur_turn, context)
		pharaohs_servant.current_bucket_resource_multiplier = cm:load_named_value("TROY_PHARAOHS_SERVANT_CUR_BUCKET_RESOURCE_MULTIPLIER", pharaohs_servant.current_bucket_resource_multiplier, context)
		pharaohs_servant.temporary_bucket_upgrades = cm:load_named_value("TROY_PHARAOHS_SERVANT_TEMP_BUCKET_UPGRADES", pharaohs_servant.temporary_bucket_upgrades, context)
		pharaohs_servant.playthrough_total_larger_buckets_bonus_collected = cm:load_named_value("TROY_PHARAOHS_SERVANT_TOTAL_LARGER_BUCKETS_BONUS_COLLECTED", pharaohs_servant.playthrough_total_larger_buckets_bonus_collected, context)
		pharaohs_servant.max_recruitment_territories_per_turn = cm:load_named_value("TROY_PHARAOHS_SERVANT_MAX_RECRUITMENT_TERRITORIES_PER_TURN", pharaohs_servant.max_recruitment_territories_per_turn, context)

		for region_key, region_vals in pairs(region_data) do
			if pharaohs_servant.regions[region_key] then
				pharaohs_servant.regions[region_key].bucket_upgrades_count = region_vals.bucket_upgrades_count
				pharaohs_servant.regions[region_key].purchased_here_this_turn = region_vals.purchased_here_this_turn or false
				pharaohs_servant.regions[region_key].cost_multiplier = region_vals.cost_multiplier or 1

				for city_key, city_vals in pairs(region_vals.cities) do
					if pharaohs_servant.regions[region_key].cities[city_key] then
						pharaohs_servant.regions[region_key].cities[city_key].unlocked           = city_vals.unlocked
						pharaohs_servant.regions[region_key].cities[city_key].number_of_upgrades = city_vals.number_of_upgrades
						if city_vals.on_cooldown == true then
							pharaohs_servant.regions[region_key].cities[city_key].on_cooldown    = 1
						elseif city_vals.on_cooldown == false then
							pharaohs_servant.regions[region_key].cities[city_key].on_cooldown    = 0
						else
							pharaohs_servant.regions[region_key].cities[city_key].on_cooldown    = city_vals.on_cooldown or 0
						end

					else
						script_error("Tried to load city "..city_name.." from the save file, even though it's not in the pharaoh's servant base data!")
					end
				end
			else
				script_error("Tried to load region "..region_key.." from the save file, even though it's not in the pharaoh's servant base data!")
			end
		end
	end
)
