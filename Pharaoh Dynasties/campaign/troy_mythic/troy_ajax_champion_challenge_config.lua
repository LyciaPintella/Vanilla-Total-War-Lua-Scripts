out("Loading troy_ajax_champion_challenge_config.lua -> troy_mythic")

local DEBUG = true
local debug_preff = "AJAX CHAMPION CHALLENGE: "

local function output(str, force_out)
	if DEBUG or force_out then
		out(debug_preff..(str or "nil"))
	end
end

-------------------------------------------------------------------------------------------------------------------------------------------
-- FM data 
-------------------------------------------------------------------------------------------------------------------------------------------
ajax_challenge_cofiguration = {
	faction_name = "troy_main_dan_salamis",
	renown_key = "troy_adi_renown",
	wait_turns_after_disband = 2,

	-- confirmation dlg
	confirmation_dlg_id = "ajax_confirm_challenge_prompt",
	confirmation_dlg_description = "campaign_localised_strings_string_troy_adi_ajax_challenge_confirmation",

	-- champion battle lost event
	champion_battle_lost_event_title = "event_feed_strings_text_troy_adi_fm_ajax_champions_message_challenge_lost_title",
	champion_battle_lost_event_descr = "event_feed_strings_text_troy_event_feed_string_all_null",
	champion_battle_lost_event_index = 1108,

	-- champion battle win event
	champion_battle_win_event_title = "event_feed_strings_text_troy_adi_fm_ajax_champions_message_challenge_won_title",
	champion_battle_win_event_descr = "event_feed_strings_text_troy_event_feed_string_all_null",
	champion_battle_win_event_index = 1109,

	-- champion spawned event
	champion_spawned_event_title = "event_feed_strings_text_troy_adi_fm_ajax_champions_message_title",
	champion_spawned_event_descr = "event_feed_strings_text_troy_event_feed_string_all_null",
	champion_spawned_event_index = 1107,

	-- champions faction property: zero spy agent success vs champions faction
	champion_faction_bundle_zero_agent_success = "troy_adi_effect_bundle_zero_agent_success_vs_champions",
	champion_faction_bundle_zero_agent_success_turns = 0,

	-- FM panel
	fm_panel = "fm_ajaxs_champion_challenge",
	fm_renown_bar = "renown_bar_fill",
	fm_renown_bar_tooltip = "renown_bar_parent",
	fm_renown_bar_tier_template = "treshold_template",
	fm_renown_bar_tier_parent = "tresholds_holder",

	-- Settlement panel
	settlement_panel = "settlement_panel",
	settlement_panel_holder = "champion_info_holder",
	settlement_panel_champion = "champion_template_available",

	-- Settlement campaign plate icon
	settlement_icon_path = "UI/skins/default/ic_troy_adi_sp_aja_champion.png",
	settlement_icon_tooltip_key = "city_info_bar_adi_ajax_champion",
}

-- all champions data
_ajax_challenge_existing_champions = 
{	--1
	["troy_adi_dan_achilles_champion"] = {
		demanding_renown = 15, --55,
		challenge_cost = { { key = "troy_food", amount = 3500 }, { key = "troy_gold", amount = 160 } },

		champion_flavour_text = "troy_adi_hp_champion_aeacides_short_description",

		reward_main_unit_record = "troy_mth_champion_aeacides",

		spawn_settlement_name = "troy_main_phthia_alos",
		spawn_pos = { x = 291, y = 427 },

		spawn_level = 13,
		spawn_skills = { "troy_main_hero_ability_frenzy", "troy_main_hero_ability_frenzy_spec_vigour_loss_reduction", "troy_main_hero_self_vigour", 
		"troy_main_hero_self_vigour_spec_loss_reduction_charge", "troy_main_hero_campaign_recruitment_cost",
		"troy_main_hero_unit_vigour_loss_reduction", "troy_main_hero_unit_vigour_loss_reduction_spec_recovery",
		"troy_main_hero_self_melee_armour_piercing", "troy_main_hero_self_melee_armour_piercing_spec_strength",
		"troy_main_hero_ability_terrify", "troy_main_hero_ability_terrify_spec_melee_defence_reduction",
		"troy_main_hero_self_weapon_strength"},
		--"troy_main_hero_self_weapon_strength_spec_land",
		--"troy_main_hero_unit_weapon_strength", "troy_main_hero_unit_weapon_strength_spec_shock",
		--"troy_main_hero_campaign_sacking_razing", "troy_main_hero_self_cooldown",
	   -- "troy_main_hero_self_cooldown_spec_cost", "troy_main_hero_ability_blind_rage",
	   -- "troy_main_hero_ability_blind_rage_spec_damage"
	},
	--2
	["troy_adi_dan_dionysias_champion"] = {
		demanding_renown = 20,
		challenge_cost = { { key = "troy_food", amount = 2600 }, { key = "troy_gold", amount = 50 } },

		champion_flavour_text = "troy_adi_hp_champion_enyalius_short_description",

		reward_main_unit_record = "troy_adi_champion_enyalius",

		spawn_settlement_name = "troy_main_euboea_carystos",
		spawn_pos = { x = 428, y = 339 }, --spawn_pos = { x = 461, y = 324 },

		spawn_level = 14,
		spawn_skills = {"troy_main_hero_ability_adrenaline_rush", "troy_main_hero_ability_adrenaline_rush_spec_speed",
		"troy_main_hero_unit_ammunition", "troy_main_hero_self_melee_attack", "troy_main_hero_self_melee_attack_spec_spearmen",
		"troy_main_hero_campaign_post_battle", "troy_main_hero_ability_ignore_pain", "troy_main_hero_ability_ignore_pain_spec_heal",
		"troy_main_hero_self_leadership", "troy_main_hero_self_leadership_spec_unwavering", "troy_main_hero_unit_melee_defence", "troy_main_hero_ability_heroic_resolve",
		"troy_main_hero_ability_heroic_resolve_spec_duration", "troy_main_hero_self_weapon_strength"},
	},
	--3
	["troy_adi_dan_noagria_champion"] = {
		demanding_renown = 5, --20,
		challenge_cost = { { key = "troy_food", amount = 2200 } }, --{ key = "troy_gold", amount = 40 } },

		champion_flavour_text = "troy_adi_hp_champion_gorgyras_short_description",

		reward_main_unit_record = "troy_adi_champion_gorgyras",

		spawn_settlement_name = "troy_main_epagris_andros",
		spawn_pos = { x = 461, y = 324 }, --spawn_pos = { x = 524, y = 253 },

		spawn_level = 9,
		spawn_skills = {"troy_main_hero_ability_dread_of_ares", "troy_main_hero_ability_dread_of_ares_spec_melee_attack",
		"troy_main_hero_unit_ammunition", "troy_main_hero_self_melee_defence",
		"troy_main_hero_self_melee_defence_spec_melee_defence", "troy_main_hero_campaign_post_battle",
		"troy_main_hero_ability_throw_rock", "troy_main_hero_ability_throw_rock_spec_area",},
		--"troy_main_hero_self_leadership", "troy_main_hero_self_leadership_spec_cause_terror"
	},
	--4
	["troy_adi_dan_knossos_champion"] = {
		demanding_renown = 30, --25,
		challenge_cost = { { key = "troy_food", amount = 2700 }, { key = "troy_gold", amount = 60 } },

		champion_flavour_text = "troy_adi_hp_champion_orsilochus_short_description", --"troy_adi_hp_champion_horkios_short_description",

		reward_main_unit_record = "troy_adi_champion_orsilochus", -- "troy_adi_champion_horkios",

		spawn_settlement_name = "troy_main_madares_aptera",
		spawn_pos = { x = 444, y = 81 }, --This one is the previous number, now it is with the other Knossos faction
		--spawn_pos = { x = 537, y = 62 },

		spawn_level = 16,
		spawn_skills = {"troy_main_hero_ability_born_with_the_bow", "troy_main_hero_ability_born_with_bow_spec_attack_speed",
		"troy_main_hero_unit_ammunition", "troy_main_hero_unit_ammunition_spec_armour_piercing_missile_resistance_melee",
		"troy_main_hero_self_range", "troy_main_hero_self_range_spec_ammo",
		"troy_main_hero_campaign_wound_recovery_enemy_agent_resistance", "troy_main_hero_unit_missile_damage",
		"troy_main_hero_unit_missile_damage_spec_ranged_experience_per_turn", "troy_main_hero_ability_multiple_shot",
		"troy_main_hero_ability_multiple_shot_spec_damage_close", "troy_main_hero_campaign_ambush_success_defence", 
		"troy_main_hero_unit_range", "troy_main_hero_unit_range_spec_archers",
		"troy_main_hero_self_vanguard", "troy_main_hero_self_vanguard_spec_stalk"},
	},
	--5
	["troy_adi_dan_pylos_champion_2"] = {
		demanding_renown = 20, --10,
		challenge_cost = { { key = "troy_food", amount = 2700 }, { key = "troy_gold", amount = 60 } },

		champion_flavour_text = "troy_adi_hp_champion_stratichus_short_description",

		reward_main_unit_record = "troy_mth_champion_stratichus", --"troy_adi_champion_aphareus",

		spawn_settlement_name = "troy_main_messenia_messene", --"troy_main_megaris_aegina",
		--spawn_pos = { x = 374, y = 301 },
		spawn_pos = { x = 273, y = 225 },

		spawn_level = 14,
		spawn_skills = {"troy_main_hero_ability_find_cover", "troy_main_hero_ability_find_cover_spec_resistance",
		"troy_main_hero_self_melee_defence", "troy_main_hero_self_melee_defence_spec_melee_defence",
		"troy_main_hero_campaign_happiness_growth", "troy_main_hero_unit_range",
		"troy_main_hero_unit_range_spec_archers"},
	},
	--6
	["troy_adi_dan_esperia_champion"] = {
		demanding_renown = 0, --10,
		challenge_cost = { { key = "troy_food", amount = 2200 } }, --{ key = "troy_gold", amount = 0 } },

		champion_flavour_text = "troy_adi_hp_champion_ormenius_short_description",

		reward_main_unit_record = "troy_adi_champion_ormenius",

		spawn_settlement_name = "troy_main_boeotia_thisbe",
		spawn_pos = { x = 340, y = 340 },

		spawn_level = 8,
		spawn_skills = {"troy_main_hero_ability_batter", "troy_main_hero_ability_batter_spec_armour_piercing",
		"troy_main_hero_self_melee_attack", "troy_main_hero_self_melee_attack_spec_swordsmen",
		"troy_main_hero_unit_vigour_loss_reduction", "troy_main_hero_unit_vigour_loss_reduction_spec_recovery",
		"troy_main_hero_campaign_casualties_post_battle"},
	},
	--7
	["troy_adi_trj_edonia_champion"] = {
		demanding_renown = 30, --10,
		challenge_cost = { { key = "troy_food", amount = 2900 } , { key = "troy_gold", amount = 90 } },

		champion_flavour_text = "troy_adi_hp_champion_zephyrus_short_description",

		reward_main_unit_record = "troy_adi_champion_zephyrus",

		spawn_settlement_name = "troy_main_edonis_antissara",
		spawn_pos = { x = 389, y = 615 },

		spawn_level = 16,
		spawn_skills = {"troy_main_hero_ability_frenzy", "troy_main_hero_ability_frenzy_spec_vigour_loss_reduction", "troy_main_hero_self_vigour", 
		"troy_main_hero_self_vigour_spec_loss_reduction_charge", "troy_main_hero_campaign_recruitment_cost",
		"troy_main_hero_unit_vigour_loss_reduction", "troy_main_hero_unit_vigour_loss_reduction_spec_recovery",
		"troy_main_hero_self_melee_armour_piercing", "troy_main_hero_self_melee_armour_piercing_spec_strength",
		"troy_main_hero_ability_terrify", "troy_main_hero_ability_terrify_spec_melee_defence_reduction",
		"troy_main_hero_self_weapon_strength"},
	},
	--8
	["troy_adi_trj_cicones_champion"] = {
		demanding_renown = 40, --25,
		challenge_cost = { { key = "troy_food", amount = 3400 } , { key = "troy_gold", amount = 150 } },

		champion_flavour_text = "troy_adi_hp_champion_boreas_short_description",

		reward_main_unit_record = "troy_mth_champion_boreas",

		spawn_settlement_name = "troy_main_thrace_ismaros",
		spawn_pos = { x = 476, y = 619 },

		spawn_level = 14,
		spawn_skills = {"troy_main_hero_ability_adrenaline_rush", "troy_main_hero_ability_adrenaline_rush_spec_speed", 
		"troy_main_hero_campaign_casualties_post_battle", "troy_main_hero_unit_vigour_loss_reduction",
		"troy_main_hero_unit_vigour_loss_reduction_spec_recovery", "troy_main_hero_self_armour",
		"troy_main_hero_self_armour_spec_missile", "troy_main_hero_campaign_recruitment_cost",
		"troy_main_hero_unit_melee_attack", "troy_main_hero_unit_speed", 
		"troy_main_hero_campaign_income_raiding_attrition", "troy_main_hero_ability_battle_cry",
		"troy_main_hero_ability_battle_cry_spec_armour"},
	},
	--9
	["troy_adi_dan_ithaca_champion"] = {
		demanding_renown = 25, --30,
		challenge_cost = { { key = "troy_food", amount = 2800 }, { key = "troy_gold", amount = 75 } },

		champion_flavour_text = "troy_adi_hp_champion_triopas_short_description",

		reward_main_unit_record = "troy_adi_champion_triopas",

		spawn_settlement_name = "troy_main_cephallenia_ithaca",
		spawn_pos = { x = 156, y = 338 },

		spawn_level = 15,
		spawn_skills = {"troy_main_hero_ability_born_with_bow_spec_attack_speed", "troy_main_hero_ability_born_with_the_bow",
		"troy_main_hero_self_range", "troy_main_hero_self_range_spec_superrange",
		"troy_main_hero_unit_ammunition", "troy_main_hero_unit_ammunition_spec_armour_piercing_missile_resistance_melee",
		"troy_main_hero_campaign_casualties_post_battle", "troy_main_hero_unit_missile_damage", 
		"troy_main_hero_unit_missile_damage_spec_ranged_experience_per_turn",
		"troy_main_hero_ability_apollos_rain", "troy_main_hero_ability_apollos_rain_spec_range",
		"troy_main_hero_unit_range", "troy_main_hero_unit_range_spec_archers", "troy_main_hero_self_missile_armour_piercing"},
	},
	--10
	["troy_adi_dan_dionysias_champion_2"] = {
	  	demanding_renown = 10, --25,
	  	challenge_cost = { { key = "troy_food", amount = 2500 }, { key = "troy_gold", amount = 75 } },

	  	champion_flavour_text = "troy_adi_hp_champion_aloeus_short_description",

	  	reward_main_unit_record = "troy_adi_champion_aloeus",

	  	spawn_settlement_name = "troy_main_argolis_thyrea",
		spawn_pos = { x = 311, y = 267 },

		spawn_level = 12,
	  	spawn_skills = {"troy_main_hero_ability_adrenaline_rush_spec_speed", "troy_main_hero_self_missile_damage",
		  "troy_main_hero_self_missile_damage_spec_range", "troy_main_hero_unit_vigour_loss_reduction",
		  "troy_main_hero_unit_vigour_loss_reduction_spec_recovery", "troy_main_hero_campaign_post_battle",
		  "troy_main_hero_unit_charge", "troy_main_hero_unit_charge_spec_melee",
		  "troy_main_hero_ability_precise_shot", "troy_main_hero_ability_precise_shot_spec_damage", "troy_main_hero_unit_melee_attack"},
		  -- "troy_main_hero_unit_melee_attack_spec_sword"
	},
	--11
	["troy_adi_trj_apsynthioi_champion"] = {
		demanding_renown = 50,
		challenge_cost = { { key = "troy_food", amount = 3400 }, { key = "troy_gold", amount = 150 } },

		champion_flavour_text = "troy_adi_hp_champion_archelochos_short_description",

		reward_main_unit_record = "troy_mth_champion_archelochos",

		spawn_settlement_name = "troy_main_lesbos_mytilene",
		spawn_pos = { x = 558, y = 456 },

		spawn_level = 20,
		spawn_skills = {"troy_main_hero_ability_cheat_hades", "troy_main_hero_ability_cheat_hades_spec_defence",
		"troy_main_hero_unit_ammunition", "troy_main_hero_unit_ammunition_spec_armour_piercing_missile_resistance_melee",
		"troy_main_hero_self_speed", "troy_main_hero_self_speed_spec_superspeed",
		"troy_main_hero_campaign_wound_recovery_enemy_agent_resistance", "troy_main_hero_unit_missile_damage",
		"troy_main_hero_unit_missile_damage_spec_ranged_experience_per_turn", "troy_main_hero_ability_multiple_shot",
		"troy_main_hero_ability_multiple_shot_spec_damage_close", "troy_main_hero_campaign_ambush_success_defence", 
		"troy_main_hero_unit_range", "troy_main_hero_unit_range_spec_archers",
		"troy_main_hero_self_vanguard", "troy_main_hero_self_vanguard_spec_stalk",
		"troy_main_hero_unit_vanguard", "troy_main_hero_unit_vanguard_spec_speed_missile",
		"troy_main_hero_ability_strafe"},
	},
	--12
	["troy_adi_dan_sparta_champion"] = {
		demanding_renown = 20,
		challenge_cost = { { key = "troy_food", amount = 2700 }, { key = "troy_gold", amount = 60 } },

		champion_flavour_text = "troy_adi_hp_champion_canopus_short_description",

		reward_main_unit_record = "troy_adi_champion_canopus",

		spawn_settlement_name = "troy_main_lacedaemon_oitylon",
		spawn_pos = { x = 310, y = 195 },

		spawn_level = 14,
		spawn_skills = {"troy_main_hero_ability_focused_strikes", "troy_main_hero_ability_focused_strikes_spec_less_reduction",
		"troy_main_hero_self_melee_defence", "troy_main_hero_self_melee_defence_spec_melee_defence",
		"troy_main_hero_unit_ammunition", "troy_main_hero_unit_ammunition_spec_attack_speed_missile_resistance_ranged",
		"troy_main_hero_campaign_income_raiding_attrition", "troy_main_hero_self_bloodthirst",
		"troy_main_hero_self_bloodthirst_spec_in_battle", "troy_main_hero_ability_throw_spear",
		"troy_main_hero_ability_throw_spear_spec_cooldown", "troy_main_hero_self_armour",
		"troy_main_hero_self_armour_spec_melee"},
	},
	--13
	["troy_adi_dan_pylos_champion"] = {
		demanding_renown = 0, --55,
		challenge_cost = { { key = "troy_food", amount = 3500 } }, --{ key = "troy_gold", amount = 160 },

		champion_flavour_text = "troy_adi_hp_champion_aphareus_short_description",

		reward_main_unit_record = "troy_adi_champion_aphareus",

		spawn_settlement_name =  "troy_main_megaris_aegina", --"troy_main_messenia_pylos",
		--spawn_pos = { x = 248, y = 198 },
		spawn_pos = { x = 374, y = 301 },

		spawn_level = 5,
		spawn_skills = {"troy_main_hero_ability_focused_strikes", "troy_main_hero_ability_focused_strikes_spec_less_reduction",
		"troy_main_hero_self_melee_defence", "troy_main_hero_self_melee_defence_spec_melee_defence"},

		--"troy_main_hero_unit_ammunition", "troy_main_hero_unit_ammunition_spec_attack_speed_missile_resistance_ranged",
		--"troy_main_hero_campaign_income_raiding_attrition", "troy_main_hero_self_bloodthirst",
		--"troy_main_hero_self_bloodthirst_spec_in_battle", "troy_main_hero_ability_throw_spear",
		--"troy_main_hero_ability_throw_spear_spec_cooldown", "troy_main_hero_self_weapon_strength",
		--"troy_main_hero_self_weapon_strength_spec_land", "troy_main_hero_unit_melee_defence",
		--"troy_main_hero_unit_melee_defence_spec_sword", "troy_main_hero_campaign_replenishment",
		--"troy_main_hero_self_melee_armour_piercing", "troy_main_hero_self_melee_armour_piercing_spec_strength",
		--"troy_main_hero_unit_speed", "troy_main_hero_unit_speed_spec_land"
	},
	--14
	["troy_adi_dan_knossos_champion_2"] = {
		demanding_renown = 35, --20,
		challenge_cost = { { key = "troy_food", amount = 3200 }, { key = "troy_gold", amount = 100 } },

		champion_flavour_text = "troy_adi_hp_champion_horkios_short_description", --"troy_adi_hp_champion_orsilochus_short_description",

		reward_main_unit_record =  "troy_adi_champion_horkios", --"troy_adi_champion_orsilochus",

		spawn_settlement_name = "troy_main_ida_knossos",
		
		--spawn_pos = { x = 505, y = 58 }, 
		spawn_pos = { x = 517, y = 88 },
		
		spawn_level = 16,
		spawn_skills = {"troy_main_hero_ability_recuperate", "troy_main_hero_ability_recuperate_spec_increase_ammount",
		"troy_main_hero_self_speed", "troy_main_hero_self_speed_spec_superspeed",
		"troy_main_hero_unit_vigour_loss_reduction", "troy_main_hero_unit_vigour_loss_reduction_spec_recovery",
		"troy_main_hero_campaign_wound_recovery_enemy_agent_resistance", "troy_main_hero_self_bloodthirst",
		"troy_main_hero_self_bloodthirst_spec_in_battle", "troy_main_hero_ability_care_for_fallen",
		"troy_main_hero_ability_care_for_fallen_spec_heal", "troy_main_hero_campaign_replenishment",
		"troy_main_hero_self_leadership", "troy_main_hero_unit_range", "troy_main_hero_unit_range_spec_javelins"
		},
	},
	--15
	["troy_adi_trj_thyni_champion"] = {
		demanding_renown = 55, --30,
		challenge_cost = { { key = "troy_food", amount = 3500 }, { key = "troy_gold", amount = 160 } },

		champion_flavour_text = "troy_adi_hp_champion_chromis_short_description",

		reward_main_unit_record = "troy_adi_champion_chromis",

		spawn_settlement_name = "troy_main_ilion_thymbra",
		spawn_pos = { x = 570, y = 544 },

		spawn_level = 21,
		spawn_skills = {"troy_main_hero_ability_relentless_pursuit",
		"troy_main_hero_ability_born_with_the_bow", "troy_main_hero_ability_born_with_bow_spec_attack_speed",
		"troy_main_hero_unit_ammunition", "troy_main_hero_unit_ammunition_spec_attack_speed_missile_resistance_ranged",
		"troy_main_hero_self_range", "troy_main_hero_self_range_spec_superrange",
		"troy_main_hero_unit_missile_damage", "troy_main_hero_unit_missile_damage_spec_ranged_experience_per_turn",
		"troy_main_hero_ability_multiple_shot", "troy_main_hero_ability_multiple_shot_spec_knockback",
		"troy_main_hero_unit_range", "troy_main_hero_unit_range_spec_archers",
		"troy_main_hero_self_missile_armour_piercing", "troy_main_hero_self_missile_armour_piercing_spec_strength",
		"troy_main_hero_unit_speed", "troy_main_hero_unit_speed_spec_land",
		"troy_main_hero_ability_inspired_shots", "troy_main_hero_ability_inspired_shots_spec_damage",
		"troy_main_hero_self_cooldown", "troy_main_hero_self_cooldown_spec_cost"},
	},
	--16
	["troy_adi_dan_phyllis_champion"] = {
		demanding_renown = 20, --40,
		challenge_cost = { { key = "troy_food", amount = 2700 }, { key = "troy_gold", amount = 60 } },

		champion_flavour_text = "troy_adi_hp_champion_phorcys_short_description",

		reward_main_unit_record = "troy_mth_champion_phorcys",

		spawn_settlement_name = "troy_main_melamphylos_dolyche",
		spawn_pos = { x = 585, y = 318 },

		spawn_level = 14,
		spawn_skills = {"troy_main_hero_ability_seize_the_moment", "troy_main_hero_ability_seize_the_moment_spec_reduce_damage",
		"troy_main_hero_campaign_casualties_post_battle", "troy_main_hero_unit_vigour_loss_reduction",
		"troy_main_hero_unit_vigour_loss_reduction_spec_recovery", "troy_main_hero_self_armour",
		"troy_main_hero_self_armour_spec_missile", "troy_main_hero_campaign_recruitment_cost",
		"troy_main_hero_unit_melee_attack", "troy_main_hero_unit_melee_attack_spec_sword",
		"troy_main_hero_campaign_income_raiding_attrition", "troy_main_hero_ability_battle_cry",
		"troy_main_hero_ability_battle_cry_spec_armour"},
		--, "troy_main_hero_unit_speed",
		--"troy_main_hero_unit_speed_spec_land", "troy_main_hero_campaign_replenishment",
		--"troy_main_hero_unit_weapon_strength"
	},
	--17
	["troy_adi_trj_paeonians_champion"] = {
		demanding_renown = 25, --20,
		challenge_cost = { { key = "troy_food", amount = 2800 }, { key = "troy_gold", amount = 75 } },

		champion_flavour_text = "troy_adi_hp_champion_asteropaios_short_description",

		reward_main_unit_record = "troy_adi_champion_asteropaios",

		spawn_settlement_name = "troy_main_phlegra_scione",
		spawn_pos = { x = 340, y = 513 },

		spawn_level = 15,
		spawn_skills = {"troy_main_hero_ability_adrenaline_rush", "troy_main_hero_unit_ammunition",
		"troy_main_hero_self_melee_attack", "troy_main_hero_campaign_agent_recruitment_rank",
		"troy_main_hero_ability_ignore_pain", "troy_main_hero_self_leadership",
		"troy_main_hero_unit_melee_defence", "troy_main_hero_self_armour",
		"troy_main_hero_campaign_income_raiding_attrition", "troy_main_hero_unit_charge",
		"troy_main_hero_ability_heroic_resolve", "troy_main_hero_ability_heroic_resolve_spec_duration",
		"troy_main_hero_campaign_replenishment"},
	},
	--18
	["troy_adi_dan_kyme_champion"] = {
		demanding_renown = 45, --25,
		challenge_cost = { { key = "troy_food", amount = 3400 }, { key = "troy_gold", amount = 150 } },

		champion_flavour_text = "troy_adi_hp_champion_euphorbus_short_description",

		reward_main_unit_record = "troy_adi_champion_euphorbus",

		spawn_settlement_name = "troy_main_teythrania_kyme",
		spawn_pos = { x = 610, y = 422 },

		spawn_level = 19,
		spawn_skills = {"troy_main_hero_ability_adrenaline_rush", "troy_main_hero_ability_adrenaline_rush_spec_speed",
		"troy_main_hero_self_missile_damage", "troy_main_hero_self_missile_damage_spec_range",
		"troy_main_hero_unit_vigour_loss_reduction", "troy_main_hero_unit_vigour_loss_reduction_spec_recovery", 
		"troy_main_hero_campaign_casualties_post_battle", "troy_main_hero_unit_missile_damage",
		"troy_main_hero_unit_missile_damage_spec_ranged_experience_per_turn", "troy_main_hero_ability_apollos_rain",
		"troy_main_hero_ability_apollos_rain_spec_range", "troy_main_hero_unit_range",
		"troy_main_hero_unit_leadership", "troy_main_hero_self_cooldown",
		"troy_main_hero_self_cooldown_spec_cost", "troy_main_hero_ability_inspired_shots",
		"troy_main_hero_ability_inspired_shots_spec_damage", "troy_main_hero_unit_range_spec_javelins", "troy_main_hero_unit_leadership_spec_spears"},
	},
	--19
	["troy_adi_dan_dolopians_champion"] = {
		demanding_renown = 15, --50,
		challenge_cost = { { key = "troy_food", amount = 3400 }, { key = "troy_gold", amount = 150 } },

		champion_flavour_text = "troy_adi_hp_champion_neoptolemus_short_description",

		reward_main_unit_record = "troy_adi_champion_neoptolemus",

		spawn_settlement_name = "troy_main_sporades_skyros",
		spawn_pos = { x = 429, y = 421 },

		spawn_level = 15,
		spawn_skills = {"troy_main_hero_ability_batter", "troy_main_hero_ability_batter_spec_cost",
		"troy_main_hero_self_melee_attack", "troy_main_hero_self_melee_attack_spec_spearmen",
		"troy_main_hero_unit_vigour_loss_reduction", "troy_main_hero_unit_vigour_loss_reduction_spec_recovery",
		"troy_main_hero_self_melee_armour_piercing", "troy_main_hero_self_melee_armour_piercing_spec_strength",
		"troy_main_hero_ability_challenge", "troy_main_hero_ability_challenge_spec_armour_decrease",
		"troy_main_hero_self_bloodthirst", "troy_main_hero_self_bloodthirst_spec_in_battle",
		"troy_main_hero_ability_blind_rage", "troy_main_hero_ability_blind_rage_spec_damage"},
		--"troy_main_hero_ability_set_example", "troy_main_hero_ability_set_example_spec_twice",
		--"troy_main_hero_self_melee_defence", "troy_main_hero_self_melee_defence_spec_melee_defence", 
		--"troy_main_hero_unit_vigour_loss_reduction", "troy_main_hero_unit_vigour_loss_reduction_spec_recovery",
		--"troy_main_hero_campaign_income_raiding_attrition", "troy_main_hero_unit_range",
		--"troy_main_hero_unit_range_spec_javelins", "troy_main_hero_self_ranged_attack",
		--"troy_main_hero_self_ranged_attacks_spec_damage", "troy_main_hero_ability_throw_rock", 
		--"troy_main_hero_ability_throw_rock_spec_range", "troy_main_hero_campaign_recruitment_capacity",
		--"troy_main_hero_self_vanguard", "troy_main_hero_self_vanguard_spec_stalk",
		--"troy_main_hero_unit_leadership", "troy_main_hero_unit_leadership_spec_spears",
		--"troy_dlc1_hero_campaign_razing"
	},
	--20
	["troy_adi_trj_lycia_champion"] = {
		demanding_renown = 55, --60,
		challenge_cost = { { key = "troy_food", amount = 3600 }, { key = "troy_gold", amount = 175 } },

		champion_flavour_text = "troy_adi_hp_champion_glaucus_short_description",

		reward_main_unit_record = "troy_adi_champion_glaucus",

		spawn_settlement_name = "troy_main_caria_halicarnassos",
		spawn_pos = { x = 665, y = 275 },

		spawn_level = 21,
		spawn_skills = {"troy_main_hero_ability_recuperate", "troy_main_hero_ability_recuperate_spec_increase_ammount",
		"troy_main_hero_self_speed", "troy_main_hero_self_speed_spec_superspeed",
		"troy_main_hero_unit_vigour_loss_reduction", "troy_main_hero_unit_vigour_loss_reduction_spec_recovery",
		"troy_main_hero_campaign_wound_recovery_enemy_agent_resistance", "troy_main_hero_unit_melee_defence",
		"troy_main_hero_unit_melee_defence_spec_sword", "troy_main_hero_self_bloodthirst",
		"troy_main_hero_self_bloodthirst_spec_in_battle", "troy_main_hero_ability_care_for_fallen",
		"troy_main_hero_ability_care_for_fallen_spec_heal", "troy_main_hero_campaign_recruitment_capacity",
		"troy_main_hero_self_leadership", "troy_main_hero_self_leadership_spec_unwavering", 
		"troy_main_hero_unit_speed", 
		"troy_main_hero_campaign_ambush_success_defence", "troy_main_hero_self_cooldown",
		"troy_main_hero_self_cooldown_spec_cost"},
	},
	--21
	["troy_adi_trj_penthesilea_champion"] = {
		demanding_renown = 50,
		challenge_cost = { { key = "troy_food", amount = 3500 }, { key = "troy_gold", amount = 160 } },

		champion_flavour_text = "troy_adi_hp_champion_alcibie_short_description",

		reward_main_unit_record = "troy_adi_champion_alcibie",

		spawn_settlement_name = "troy_main_maeandros_anthea",
		spawn_pos = { x = 692, y = 357 },

		spawn_level = 20,
		spawn_skills = {"troy_dlc1_hero_archer_ability_deadly_focus", "troy_dlc1_hero_archer_ability_deadly_focus_spec_leadership",
		"troy_main_hero_self_range", "troy_main_hero_self_range_spec_superrange", "troy_main_hero_unit_ammunition",
		"troy_main_hero_unit_ammunition_spec_attack_speed_missile_resistance_ranged", "troy_main_hero_campaign_post_battle",
		"troy_main_hero_unit_missile_damage", "troy_main_hero_unit_range",
		"troy_main_hero_unit_range_spec_archers", "troy_dlc1_hero_campaign_razing",
		"troy_main_hero_unit_leadership", "troy_main_hero_unit_leadership_spec_spears",
		"troy_main_hero_self_cooldown", "troy_main_hero_self_cooldown_spec_cost",
		"troy_main_hero_ability_inspired_shots", "troy_main_hero_ability_inspired_shots_spec_damage",
		"troy_main_hero_campaign_campaign_movement", "troy_main_hero_campaign_campaign_movement_spec_land"},
	},
	--22
	["troy_adi_dan_mycenae_champion"] = {
		demanding_renown = 0, --25,
		challenge_cost = { { key = "troy_food", amount = 2500 }, { key = "troy_gold", amount = 40 } },

		champion_flavour_text = "troy_adi_hp_champion_epopeus_short_description",

		reward_main_unit_record = "troy_adi_champion_epopeus",

		spawn_settlement_name = "troy_main_tyrinthia_epidayrus",
		spawn_pos = { x = 338, y = 289 },

		spawn_level = 9,
		spawn_skills = {"troy_main_hero_ability_find_cover", "troy_main_hero_ability_find_cover_spec_resistance",
		"troy_main_hero_self_vigour", "troy_main_hero_self_vigour_spec_loss_reduction_charge",
		"troy_main_hero_campaign_happiness_growth", "troy_main_hero_unit_range",
		"troy_main_hero_unit_range_spec_archers", "troy_main_hero_self_armour", "troy_main_hero_self_weapon_strength", "troy_main_hero_unit_missile_damage", "troy_main_hero_self_armour_spec_missile", "troy_main_hero_unit_missile_damage_spec_ranged_experience_per_turn"},	
	},

}

-- when Ajax faction is not human setup
-- table index [xxx] is a required game turn
-- corresponding to game turn table is a pool of unit records to choose randomly one of them to add to AI special recruitment pool
ajax_challenge_ai_units = {
	[10] = { "troy_adi_champion_aphareus", "troy_adi_champion_ormenius" },
	[15] = { "troy_adi_champion_zephyrus", "troy_adi_champion_orsilochus", "troy_adi_champion_gorgyras" },
	[30] = { "troy_adi_champion_enyalius", "troy_adi_champion_canopus", "troy_adi_champion_asteropaios" },
	[45] = { "troy_adi_champion_horkios", "troy_adi_champion_euphorbus", "troy_adi_champion_epopeus" },
	[60] = { "troy_mth_champion_boreas", "troy_adi_champion_aloeus" },
	[75] = { "troy_adi_champion_chromis", "troy_adi_champion_triopas", "troy_mth_champion_phorcys" },
	[90] = { "troy_mth_champion_archelochos", "troy_adi_champion_neoptolemus", "troy_adi_champion_alcibie" },
	[105] = { "troy_mth_champion_aeacides", "troy_mth_champion_stratichus", "troy_adi_champion_glaucus" },
}

