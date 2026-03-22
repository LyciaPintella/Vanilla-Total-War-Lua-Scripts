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
package.path = package.path .. ";data/script/campaign/troy_historical/?.lua"
package.path = package.path .. ";data/script/battle/intro_battles/troy_all/?.lua"
package.path = package.path .. ";data/script/campaign/troy_legacy/?.lua"
package.path = package.path .. ";data/script/campaign/troy/?.lua"
--	general campaign behaviour

force_require("troy_ancillaries")
force_require("troy_campaign_supply_points")
force_require("achievements_core")
force_require("troy_achievements")
force_require("campaign_port_markers")
force_require("blood_markers")
force_require("campaign_setup")
force_require("campaign_experience_triggers")
force_require("constants")
force_require("troy_trojan_horses")
force_require("troy_loyalty_traits")
force_require("troy_loyalty_effects")
force_require("troy_loyalty_ancillary_effects")
-- campaign advice interventions
force_require("campaign_interventions")
force_require("troy_early_game_mission_definitions")
force_require("troy_early_game_missions_shared")


--	help pages
require("troy_campaign_help_pages")

require("troy_traits")


-- Troy - Realms mechanic
require("troy_realms")

-- Troy - Gods and favour
require("troy_favour")
require("troy_favour_level_effects")
require("troy_sacrifices_and_rituals")
require("troy_epic_agent_recruitment_and_actions")

-- Troy - Antagonist mechanics
require("troy_antagonists")

-- Troy - Factions mechanics
require("faction_mechanics_ui")
require("troy_supply_bases")
require("troy_king_of_men")
require("troy_achilles_hot_blooded")
require("troy_achilles_greatest")
require("troy_aeneas_speak_to_the_dead")
require("troy_aeneas_divine_missions")
require("troy_sarpedon_luxury_goods")
require("troy_sarpedon_trade_guild")
require("troy_hector_trojan_alliance")
require("troy_penthesilea_momentum")
require("troy_capture_bonuses")
require("troy_capture_bonuses_config")
require("troy_hippolyta_culture")
require("troy_paris_helen")
require("troy_menelaus_reliable_friend")
require("troy_priam_benevolence")
require("troy_military_strategy")
require("troy_adi_ajax_renown")
require("troy_ajax_champion_challenge")
require("troy_diomedes_champions")
require("troy_rem_rhesus_thracian_rituals")
require("troy_rem_rhesus_countless_host")
require("troy_rem_memnon_exotic_strategist")
require("troy_rem_memnon_pharaohs_servant")

-- Troy - misc
require("troy_event_chains")
require("troy_factions_effects_loader")
require("troy_char_skills_scripted_effects")
require("troy_historical_characters")
require("victory_conditions_config")
require("victory_objectives_core")
require("victory_objectives_ui")
require("victory_objectives")
require("troy_tutorial_battles")
require("troy_taunt_effect")
require("troy_bodyguard_as_ancillary")

-- Troy - start
require("campaign_start")

-- Shared
require("minimalistic_text_pointers")
