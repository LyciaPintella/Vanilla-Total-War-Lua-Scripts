-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	REQUIRED FILES
--
--	Add any files that need to be loaded for this campaign here
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

package.path = package.path .. ";data/script/campaign/?.lua"
package.path = package.path .. ";data/script/campaign/phar_main/?.lua"
package.path = package.path .. ";data/script/battle/intro_battles/troy_all/?.lua"
package.path = package.path .. ";data/script/campaign/crown/?.lua"
package.path = package.path .. ";data/script/campaign/crown/egyptian/?.lua"
package.path = package.path .. ";data/script/campaign/crown/hittite/?.lua"
package.path = package.path .. ";data/script/campaign/crown/aegean/?.lua"
package.path = package.path .. ";data/script/campaign/crown/mesopotamian/?.lua"
package.path = package.path .. ";data/script/campaign/court/?.lua"
package.path = package.path .. ";data/script/campaign/sea_peoples/?.lua"
package.path = package.path .. ";data/script/campaign/ancient_legacies/?.lua"
package.path = package.path .. ";data/script/campaign/_narrative/?.lua"
--	general campaign behaviour

force_require("narrative_loader")
--force_require("troy_campaign_ancillaries")
--force_require("troy_campaign_supply_points")
--force_require("troy_campaign_achievements")
force_require("campaign_port_markers")
force_require("blood_markers")
force_require("campaign_setup")
force_require("campaign_experience_triggers")
force_require("constants")
--force_require("troy_trojan_horses")
--force_require("troy_loyalty_traits")
--force_require("troy_loyalty_effects")
--force_require("troy_loyalty_ancillary_effects")
--require("troy_campaign_traits")
force_require("phar_campaign_traits")

-- campaign advice interventions
force_require("campaign_interventions")
--force_require("troy_campaign_early_game_mission_definitions")
--force_require("troy_campaign_early_game_missions_shared")


--	help pages
--require("troy_campaign_help_pages")



-- Troy - Realms mechanic
--require("troy_realms")

-- Troy - Gods and favour
--require("troy_favour")
--require("troy_favour_level_effects")
--require("troy_sacrifices_and_rituals")
--require("troy_epic_agent_recruitment_and_actions")

-- Troy - Antagonist mechanics
--require("troy_antagonists")

-- Troy - Factions mechanics
require("faction_mechanics_ui")
--require("troy_supply_bases")
--require("troy_king_of_men")
--require("troy_achilles_hot_blooded")
--require("troy_achilles_greatest")
--require("troy_aeneas_speak_to_the_dead")
--require("troy_aeneas_divine_missions")
--require("troy_sarpedon_luxury_goods")
--require("troy_sarpedon_trade_guild")
--require("troy_hector_trojan_alliance")
--require("troy_penthesilea_momentum")
--require("troy_capture_bonuses")
--require("troy_capture_bonuses_config")
--require("troy_hippolyta_culture")
--require("troy_paris_helen")
--require("troy_menelaus_reliable_friend")
--require("troy_priam_benevolence")
--require("troy_military_strategy")
--require("troy_adi_ajax_renown")
--require("troy_ajax_champion_challenge")
--require("troy_diomedes_champions")
--require("troy_rem_rhesus_thracian_rituals")
--require("troy_rem_rhesus_countless_host")
--require("troy_rem_memnon_exotic_strategist")
--require("troy_rem_memnon_pharaohs_servant")

require("phar_feature_unlock_config")
-- Phar - Ambition mechanic
require("phar_ambitions")

-- Troy - misc
--require("troy_event_chains")
--require("troy_factions_effects_loader")
--require("troy_char_skills_scripted_effects")
--require("troy_historical_characters")
require("victory_points")
require("victory_objectives_config")
require("victory_objectives_config_utils")
require("victory_objectives_core")
require("victory_objectives_ui")
require("victory_objectives")
--require("troy_tutorial_battles")
--require("troy_taunt_effect")
--require("troy_bodyguard_as_ancillary")

require("phar_factions_effects_loader")

-- Achievements
require("phar_achievements_config")
require("achievements_core")
require("phar_achievements")

require("phar_shemsu_hor")

require("phar_crown")
require("phar_resources")
require("phar_province_management")
require("phar_military_force_management")
require("phar_modular_difficulty_config")
require("phar_modular_difficulty")
require("phar_modular_difficulty_random_startpos")
require("phar_modular_difficulty_random_startpos_config")
require("phar_sea_peoples_invasion")
require("phar_pillars_civilization")
require("phar_commands")
require("phar_realms")
require("phar_settlement_destruction")

require("phar_ancient_legacy_common")
require("phar_court")
require("phar_court_positions")
require("phar_court_intrigues")
require("phar_court_plots")
require("phar_court_ui")
require("phar_court_ai")
require("phar_court_cheats_tests")
require("phar_dynamic_building_effects")
if common.get_build_type() ~= "build_type_6" then
require("phar_ancient_legacy_thutmose_ui")
end
require("phar_ancient_legacy_muwatalli_ui")
require("phar_local_deities")
require("phar_faction_summary")
require("phar_campaign_ancillaries")
require("phar_royal_decrees")
require("phar_courtesy_gifts")

require("phar_scripted_bonus_values")
require("phar_influence_monitor")

require("phar_eminence")
require("phar_tribes_privileges")
require("phar_nomad_outposts")
require("phar_sea_peoples_prebattle_options")
require("phar_war_spoils_config")
require("phar_war_spoils")
require("phar_refugee_camps")
require("phar_forge_path")
require("phar_scripted_titles_effects")
require("phar_ruling_family")
require("phar_death_dilemmas")
require("phar_deeds")
require("phar_deeds_config")

-- Troy - start
require("campaign_start")

-- Shared
require("minimalistic_text_pointers")
