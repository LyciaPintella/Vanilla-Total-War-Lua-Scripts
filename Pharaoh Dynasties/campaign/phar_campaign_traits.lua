out("Loading phar_campaign_traits.lua")

campaign_traits = {
	config = {
	},
	persistent = {
		trait_data = {
					--[[
				[1] = {
					fm_cqi = number -- use family member cqi
					traits = {
						[1] = trait
					},
				}
			]]
		},
		characters_battles_count = {
			-- ["family_member_cqi"] = <battles_fought number>
		},

	},

	get_personality_traits_count_for_character = function(character)
		-- return # of p. traits
	end,
}

campaign_traits.config = {
	max_num_traits = 6,
	trait_reset_treshold = 1,
	civilian_traits_years = 5, -- years to wait before assigning a new random civilian trait to a civilian character
}

campaign_traits.config.modifiable_event_params = {
	character_fought_battle_far_from_capital = 2000,
	character_being_lazy_in_owned_settlement_high_public_order = 50,
	character_being_lazy_in_owned_settlement_low_public_order = 0,
	character_suffered_high_casualties_in_battle = 0.6,
	character_recruited_2h_melee_unit_axes = "phar_main_2h_axes",
	character_recruited_2h_melee_unit_clubs = "phar_main_2h_clubs",
	character_recruited_2h_melee_unit_infantry = "phar_main_2h_infantry",
	character_recruited_2h_melee_unit_spears = "phar_main_2h_spears",
	character_recruited_1h_melee_unit_spears = "phar_main_1h_spears",
	character_recruited_khopeshi = "phar_main_1h_khopesh",
	character_recruited_swordmen = "phar_main_1h_swords",
	character_recruited_chariots = "phar_main_chariots_all",
	character_recruited_bowmen = "phar_main_ranged_bows",
	character_bodyguard_unit_set = "phar_main_bodyguards",
	character_spent_turn_in_region_with_high_influence = 0.6,
	character_spent_turn_in_region_with_low_influence = 0.6,
	character_bodyguard_suffered_casualties_high = 30,
	character_bodyguard_suffered_casualties_low = 30,
	character_shrine_occupation_allowed_options = {"occupation_decision_ers_raze_without_occupy", "occupation_decision_ers_sack"},
	character_raze_port_decision_key = {"occupation_decision_raze_without_occupy", "occupation_decision_raze_and_exterminate"}
}

-- this table setups restrictions per trait based on subcultures
campaign_traits.config.trait_restrictions = {
	phar_sea_special_coastal_ambusher = {
		allowed_subcultures = {
			"phar_main_sbc_sea_peoples_aegean_sea_raiders",
			"phar_main_sbc_sea_peoples_sea_wanderers",
			"phar_main_sbc_sea_peoples_western_islanders",
		},
	},
	phar_sea_special_coastal_predator = {
		allowed_subcultures = {
			"phar_main_sbc_sea_peoples_aegean_sea_raiders",
			"phar_main_sbc_sea_peoples_sea_wanderers",
			"phar_main_sbc_sea_peoples_western_islanders",
		},
	},
	phar_sea_special_colonizer = {
		allowed_subcultures = {
			"phar_main_sbc_sea_peoples_aegean_sea_raiders",
			"phar_main_sbc_sea_peoples_sea_wanderers",
			"phar_main_sbc_sea_peoples_western_islanders",
		},
	},
	phar_sea_special_sea_wolf = {
		allowed_subcultures = {
			"phar_main_sbc_sea_peoples_aegean_sea_raiders",
			"phar_main_sbc_sea_peoples_sea_wanderers",
			"phar_main_sbc_sea_peoples_western_islanders",
		},
	},
}

-- this table configures the background modifiers for each trait in each event.
campaign_traits.config.character_backgrounds = {
	
	-- Generic backgrounds. The use_when_coming_of_age flag is used to determine if the background should be used when the character comes of age.
	--Background 1 (Troubled Childhood)--
	[1] = {
		background_trait_key = "phar_main_background_1",
		is_household_background = false,
		use_when_coming_of_age = true,
		events = {
			character_recruited_1h_melee_unit_spears = {
				phar_main_trait_cautious = 2,--[[Predisposed--]]
			},
			character_bodyguard_suffered_casualties_low = {
				phar_main_trait_cautious = 2,--[[Predisposed--]]
				phar_main_trait_brave = 1,
			},
			character_recruited_khopeshi = {
				phar_main_trait_brave = 1,
			},
			character_recruited_swordmen = {
				phar_main_trait_brave = 1,
			},
			character_sacks_or_razes_ers_shrine = {
				phar_main_trait_underhanded = 1,
				phar_main_trait_barbaric = 1,
			},
			character_spent_turns_in_encamp_stance = {
				phar_main_trait_content = 1,
			},
			character_suffered_attrition = {
				phar_main_trait_ambitious = 2,--[[Predisposed--]]
			},
			character_interacted_with_non_shrine_ers = {
				phar_main_trait_materialistic = 1,
			},
			character_prayed_at_ers = {
				phar_main_trait_spiritual = 1,
			},
			character_ends_turn_in_region_with_construction_shrine_building = {
				phar_main_trait_spiritual = 1,
			},
			character_fought_alone = {
				phar_main_trait_individualistic = 2,--[[Predisposed--]]
			},
			character_bodyguard_suffered_casualties_high = {
				phar_main_trait_reckless = 1,
			},
			character_recruited_2h_melee_unit_infantry = {
				phar_main_trait_reckless = 1,
			},
			character_post_battle_release_generic = {
				phar_main_trait_merciful = 1,
				phar_main_trait_materialistic = 1,
			},
			character_sacked_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_being_lazy_in_owned_settlement_high_public_order = {
				phar_main_trait_respectful = 1,
				phar_main_trait_hesitant= 1,
			},
			character_being_lazy_in_owned_settlement_low_public_order = {
				phar_main_trait_irreverent = 2,
				phar_main_trait_hesitant= 1,
			},
			character_present_for_construction = {
				phar_main_trait_cultured = 1,
			},
			character_won_battle_cadmean_victory = {
				phar_main_trait_blunt = 1,
			},
			character_spent_turn_in_ambush_stance = {
				phar_main_trait_cowardly = 1,
				phar_main_trait_underhanded = 1,
			},
			character_spent_turns_in_march_stance = {
				phar_main_trait_ambitious = 2,--[[Predisposed--]]
			},
			character_razed_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_executed_captives = {
				phar_main_trait_cruel = 2,--[[Predisposed--]]
			},
			character_fought_battle_far_from_capital = {
				phar_main_trait_individualistic = 2,--[[Predisposed--]]
			},
			character_reinforces_other_armies = {
				phar_main_trait_cooperative = 1,
			},
			character_beeing_reinforced = {
				phar_main_trait_cooperative = 1,
			},
			character_spent_turn_in_enemy_region = {
				phar_main_trait_confident = 1,
			},
			character_spent_turns_in_raiding_stance = {
				phar_main_trait_blunt = 1,
			},

			character_won_defensive_battle = {
				phar_main_trait_hesitant= 1,
			},
		},
	},
	
	--Background 2 (Purveyour of Trinkets)--
	[2] = {
		background_trait_key = "phar_main_background_2",
		is_household_background = false,
		use_when_coming_of_age = false,
		events = {

			character_recruited_1h_melee_unit_spears = {
				phar_main_trait_cautious = 2,--[[Predisposed--]]
			},
			character_bodyguard_suffered_casualties_low = {
				phar_main_trait_cautious = 2,--[[Predisposed--]]
				phar_main_trait_brave = 1,
			},
			character_recruited_khopeshi = {
				phar_main_trait_brave = 1,
			},
			character_recruited_swordmen = {
				phar_main_trait_brave = 1,
			},
			character_sacks_or_razes_ers_shrine = {
				phar_main_trait_underhanded = 1,
				phar_main_trait_barbaric = 1,
			},
			character_spent_turns_in_encamp_stance = {
				phar_main_trait_content = 1,
			},
			character_suffered_attrition = {
				phar_main_trait_ambitious = 1,
			},
			character_interacted_with_non_shrine_ers = {
				phar_main_trait_materialistic = 2,--[[Predisposed--]]
			},
			character_prayed_at_ers = {
				phar_main_trait_spiritual = 1,
			},
			character_ends_turn_in_region_with_construction_shrine_building = {
				phar_main_trait_spiritual = 1,
			},
			character_fought_alone = {
				phar_main_trait_individualistic = 1,
			},
			character_bodyguard_suffered_casualties_high = {
				phar_main_trait_reckless = 1,
			},
			character_recruited_2h_melee_unit_infantry = {
				phar_main_trait_reckless = 1,
			},
			character_post_battle_release_generic = {
				phar_main_trait_merciful = 1,
				phar_main_trait_materialistic = 2,--[[Predisposed--]]
			},
			character_sacked_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_being_lazy_in_owned_settlement_high_public_order = {
				phar_main_trait_respectful = 2,--[[Predisposed--]]
				phar_main_trait_hesitant= 1,
			},
			character_being_lazy_in_owned_settlement_low_public_order = {
				phar_main_trait_irreverent = 1,
				phar_main_trait_hesitant= 1,
			},
			character_present_for_construction = {
				phar_main_trait_cultured = 2,--[[Predisposed--]]
			},
			character_won_battle_cadmean_victory = {
				phar_main_trait_blunt = 1,
			},
			character_spent_turn_in_ambush_stance = {
				phar_main_trait_cowardly = 1,
				phar_main_trait_underhanded = 1,
			},
			character_spent_turns_in_march_stance = {
				phar_main_trait_ambitious = 1,
			},
			character_razed_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_executed_captives = {
				phar_main_trait_cruel = 1,
			},
			character_fought_battle_far_from_capital = {
				phar_main_trait_individualistic = 1,
			},
			character_reinforces_other_armies = {
				phar_main_trait_cooperative = 1,
			},
			character_beeing_reinforced = {
				phar_main_trait_cooperative = 1,
			},
			character_spent_turn_in_enemy_region = {
				phar_main_trait_confident = 1,
			},
			character_spent_turns_in_raiding_stance = {
				phar_main_trait_blunt = 1,
			},

			character_won_defensive_battle = {
				phar_main_trait_hesitant= 1,
			},
		},
	},
	
	--Background 3 (Adventurer)--
	[3] = {
		background_trait_key = "phar_main_background_3",
		is_household_background = false,
		use_when_coming_of_age = true,
		events = {
			character_recruited_1h_melee_unit_spears = {
				phar_main_trait_cautious = 1,
			},
			character_bodyguard_suffered_casualties_low = {
				phar_main_trait_cautious = 1,
				phar_main_trait_brave = 1,
			},
			character_recruited_khopeshi = {
				phar_main_trait_brave = 1,
			},
			character_recruited_swordmen = {
				phar_main_trait_brave = 1,
			},
			character_sacks_or_razes_ers_shrine = {
				phar_main_trait_underhanded = 1,
				phar_main_trait_barbaric = 1,
			},
			character_spent_turns_in_encamp_stance = {
				phar_main_trait_content = 1,
			},
			character_suffered_attrition = {
				phar_main_trait_ambitious = 2,--[[Predisposed--]]
			},
			character_interacted_with_non_shrine_ers = {
				phar_main_trait_materialistic = 2,--[[Predisposed--]]
			},
			character_prayed_at_ers = {
				phar_main_trait_spiritual = 1,
			},
			character_ends_turn_in_region_with_construction_shrine_building = {
				phar_main_trait_spiritual = 1,
			},
			character_fought_alone = {
				phar_main_trait_individualistic = 2,--[[Predisposed--]]
			},
			character_bodyguard_suffered_casualties_high = {
				phar_main_trait_reckless = 2,--[[Predisposed--]]
			},
			character_recruited_2h_melee_unit_infantry = {
				phar_main_trait_reckless = 2,--[[Predisposed--]]
			},
			character_post_battle_release_generic = {
				phar_main_trait_merciful = 1,
				phar_main_trait_materialistic = 2,--[[Predisposed--]]
			},
			character_sacked_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_being_lazy_in_owned_settlement_high_public_order = {
				phar_main_trait_respectful = 1,
				phar_main_trait_hesitant= 1,
			},
			character_being_lazy_in_owned_settlement_low_public_order = {
				phar_main_trait_irreverent = 1,
				phar_main_trait_hesitant= 1,
			},
			character_present_for_construction = {
				phar_main_trait_cultured = 1,
			},
			character_won_battle_cadmean_victory = {
				phar_main_trait_blunt = 1,
			},
			character_spent_turn_in_ambush_stance = {
				phar_main_trait_cowardly = 1,
				phar_main_trait_underhanded = 1,
			},
			character_spent_turns_in_march_stance = {
				phar_main_trait_ambitious = 2,--[[Predisposed--]]
			},
			character_razed_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_executed_captives = {
				phar_main_trait_cruel = 1,
			},
			character_fought_battle_far_from_capital = {
				phar_main_trait_individualistic = 2,--[[Predisposed--]]
			},
			character_reinforces_other_armies = {
				phar_main_trait_cooperative = 1,
			},
			character_beeing_reinforced = {
				phar_main_trait_cooperative = 1,
			},
			character_spent_turn_in_enemy_region = {
				phar_main_trait_confident = 1,
			},
			character_spent_turns_in_raiding_stance = {
				phar_main_trait_blunt = 1,
			},
			character_won_defensive_battle = {
				phar_main_trait_hesitant= 1,
			},
		},
	},
	
	--Background 4 (Devout Warrior)--
	[4] = {
		background_trait_key = "phar_main_background_4",
		is_household_background = false,
		use_when_coming_of_age = true,
		events = {

			character_recruited_1h_melee_unit_spears = {
				phar_main_trait_cautious = 1,
			},
			character_bodyguard_suffered_casualties_low = {
				phar_main_trait_cautious = 1,
				phar_main_trait_brave = 2,--[[Predisposed--]]
			},
			character_recruited_khopeshi = {
				phar_main_trait_brave = 2,--[[Predisposed--]]
			},
			character_recruited_swordmen = {
				phar_main_trait_brave = 2,--[[Predisposed--]]
			},
			character_sacks_or_razes_ers_shrine = {
				phar_main_trait_underhanded = 1,
				phar_main_trait_barbaric = 1,
			},
			character_spent_turns_in_encamp_stance = {
				phar_main_trait_content = 2,--[[Predisposed--]]
			},
			character_suffered_attrition = {
				phar_main_trait_ambitious = 1,
			},
			character_interacted_with_non_shrine_ers = {
				phar_main_trait_materialistic = 1,
			},
			character_prayed_at_ers = {
				phar_main_trait_spiritual = 2,--[[Predisposed--]]
			},
			character_ends_turn_in_region_with_construction_shrine_building = {
				phar_main_trait_spiritual = 2,--[[Predisposed--]]
			},
			character_fought_alone = {
				phar_main_trait_individualistic = 1,
			},
			character_bodyguard_suffered_casualties_high = {
				phar_main_trait_reckless = 1,
			},
			character_recruited_2h_melee_unit_infantry = {
				phar_main_trait_reckless = 1,
			},
			character_post_battle_release_generic = {
				phar_main_trait_merciful = 2,--[[Predisposed--]]
				phar_main_trait_materialistic = 1,
			},
			character_sacked_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_being_lazy_in_owned_settlement_high_public_order = {
				phar_main_trait_respectful = 1,
				phar_main_trait_hesitant= 1,
			},
			character_being_lazy_in_owned_settlement_low_public_order = {
				phar_main_trait_irreverent = 1,
				phar_main_trait_hesitant= 1,
			},
			character_present_for_construction = {
				phar_main_trait_cultured = 1,
			},
			character_won_battle_cadmean_victory = {
				phar_main_trait_blunt = 1,
			},
			character_spent_turn_in_ambush_stance = {
				phar_main_trait_cowardly = 1,
				phar_main_trait_underhanded = 1,
			},
			character_spent_turns_in_march_stance = {
				phar_main_trait_ambitious = 1,
			},
			character_razed_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_executed_captives = {
				phar_main_trait_cruel = 1,
			},
			character_fought_battle_far_from_capital = {
				phar_main_trait_individualistic = 1,
			},
			character_reinforces_other_armies = {
				phar_main_trait_cooperative = 1,
			},
			character_beeing_reinforced = {
				phar_main_trait_cooperative = 1,
			},
			character_spent_turn_in_enemy_region = {
				phar_main_trait_confident = 1,
			},
			character_spent_turns_in_raiding_stance = {
				phar_main_trait_blunt = 1,
			},
			character_won_defensive_battle = {
				phar_main_trait_hesitant= 1,
			},
		},
	},
	
	--Background 5 (Pious Zealot)--
	[5] = {
		background_trait_key = "phar_main_background_5",
		is_household_background = false,
		use_when_coming_of_age = true,
		events = {

			character_recruited_1h_melee_unit_spears = {
				phar_main_trait_cautious = 1,
			},
			character_bodyguard_suffered_casualties_low = {
				phar_main_trait_cautious = 1,
				phar_main_trait_brave = 1,
			},
			character_recruited_khopeshi = {
				phar_main_trait_brave = 1,
			},
			character_recruited_swordmen = {
				phar_main_trait_brave = 1,
			},
			character_sacks_or_razes_ers_shrine = {
				phar_main_trait_underhanded = 1,
				phar_main_trait_barbaric = 1,
			},
			character_spent_turns_in_encamp_stance = {
				phar_main_trait_content = 1,
			},
			character_suffered_attrition = {
				phar_main_trait_ambitious = 1,
			},
			character_interacted_with_non_shrine_ers = {
				phar_main_trait_materialistic = 1,
			},
			character_prayed_at_ers = {
				phar_main_trait_spiritual = 2,--[[Predisposed--]]
			},
			character_ends_turn_in_region_with_construction_shrine_building = {
				phar_main_trait_spiritual = 2,--[[Predisposed--]]
			},
			character_fought_alone = {
				phar_main_trait_individualistic = 1,
			},
			character_bodyguard_suffered_casualties_high = {
				phar_main_trait_reckless = 2,--[[Predisposed--]]
			},
			character_recruited_2h_melee_unit_infantry = {
				phar_main_trait_reckless = 2,--[[Predisposed--]]
			},
			character_post_battle_release_generic = {
				phar_main_trait_merciful = 1,
				phar_main_trait_materialistic = 1,
			},
			character_sacked_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_being_lazy_in_owned_settlement_high_public_order = {
				phar_main_trait_respectful = 1,
				phar_main_trait_hesitant= 2,--[[Predisposed--]]
			},
			character_being_lazy_in_owned_settlement_low_public_order = {
				phar_main_trait_irreverent = 1,
				phar_main_trait_hesitant= 2,--[[Predisposed--]]
			},
			character_present_for_construction = {
				phar_main_trait_cultured = 1,
			},
			character_won_battle_cadmean_victory = {
				phar_main_trait_blunt = 1,
			},
			character_spent_turn_in_ambush_stance = {
				phar_main_trait_cowardly = 1,
				phar_main_trait_underhanded = 1,
			},
			character_spent_turns_in_march_stance = {
				phar_main_trait_ambitious = 1,
			},
			character_razed_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_executed_captives = {
				phar_main_trait_cruel = 2,--[[Predisposed--]]
			},
			character_fought_battle_far_from_capital = {
				phar_main_trait_individualistic = 1,
			},
			character_reinforces_other_armies = {
				phar_main_trait_cooperative = 1,
			},
			character_beeing_reinforced = {
				phar_main_trait_cooperative = 1,
			},
			character_spent_turn_in_enemy_region = {
				phar_main_trait_confident = 1,
			},
			character_spent_turns_in_raiding_stance = {
				phar_main_trait_blunt = 1,
			},
			character_won_defensive_battle = {
				phar_main_trait_hesitant= 2,--[[Predisposed--]]
			},
		},
	},
	
	--Background 6 (Magician's Apprentice)--
	[6] = {
		background_trait_key = "phar_main_background_6",
		is_household_background = false,
		use_when_coming_of_age = true,
		events = {

			character_recruited_1h_melee_unit_spears = {
				phar_main_trait_cautious = 1,
			},
			character_bodyguard_suffered_casualties_low = {
				phar_main_trait_cautious = 1,
				phar_main_trait_brave = 1,
			},
			character_recruited_khopeshi = {
				phar_main_trait_brave = 1,
			},
			character_recruited_swordmen = {
				phar_main_trait_brave = 1,
			},
			character_sacks_or_razes_ers_shrine = {
				phar_main_trait_underhanded = 2,--[[Predisposed--]]
				phar_main_trait_barbaric = 1,
			},
			character_spent_turns_in_encamp_stance = {
				phar_main_trait_content = 1,
			},
			character_suffered_attrition = {
				phar_main_trait_ambitious = 1,
			},
			character_interacted_with_non_shrine_ers = {
				phar_main_trait_materialistic = 1,
			},
			character_prayed_at_ers = {
				phar_main_trait_spiritual = 2,--[[Predisposed--]]
			},
			character_ends_turn_in_region_with_construction_shrine_building = {
				phar_main_trait_spiritual = 2,--[[Predisposed--]]
			},
			character_fought_alone = {
				phar_main_trait_individualistic = 1,
			},
			character_bodyguard_suffered_casualties_high = {
				phar_main_trait_reckless = 1,
			},
			character_recruited_2h_melee_unit_infantry = {
				phar_main_trait_reckless = 1,
			},
			character_post_battle_release_generic = {
				phar_main_trait_merciful = 1,
				phar_main_trait_materialistic = 1,
			},
			character_sacked_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_being_lazy_in_owned_settlement_high_public_order = {
				phar_main_trait_respectful = 1,
				phar_main_trait_hesitant= 1,
			},
			character_being_lazy_in_owned_settlement_low_public_order = {
				phar_main_trait_irreverent = 1,
				phar_main_trait_hesitant= 1,
			},
			character_present_for_construction = {
				phar_main_trait_cultured = 2,--[[Predisposed--]]
			},
			character_won_battle_cadmean_victory = {
				phar_main_trait_blunt = 1,
			},
			character_spent_turn_in_ambush_stance = {
				phar_main_trait_cowardly = 2,--[[Predisposed--]]
				phar_main_trait_underhanded = 1,
			},
			character_spent_turns_in_march_stance = {
				phar_main_trait_ambitious = 1,
			},
			character_razed_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_executed_captives = {
				phar_main_trait_cruel = 1,
			},
			character_fought_battle_far_from_capital = {
				phar_main_trait_individualistic = 1,
			},
			character_reinforces_other_armies = {
				phar_main_trait_cooperative = 1,
			},
			character_beeing_reinforced = {
				phar_main_trait_cooperative = 1,
			},
			character_spent_turn_in_enemy_region = {
				phar_main_trait_confident = 1,
			},
			character_spent_turns_in_raiding_stance = {
				phar_main_trait_blunt = 1,
			},
			character_won_defensive_battle = {
				phar_main_trait_hesitant= 1,
			},
		},
	},
	
	--Background 7 (Hedonist)--
	[7] = {
		background_trait_key = "phar_main_background_7",
		is_household_background = false,
		use_when_coming_of_age = true,
		events = {

			character_recruited_1h_melee_unit_spears = {
				phar_main_trait_cautious = 2,--[[Predisposed--]]
			},
			character_bodyguard_suffered_casualties_low = {
				phar_main_trait_cautious = 2,--[[Predisposed--]]
				phar_main_trait_brave = 1,
			},
			character_recruited_khopeshi = {
				phar_main_trait_brave = 1,
			},
			character_recruited_swordmen = {
				phar_main_trait_brave = 1,
			},
			character_sacks_or_razes_ers_shrine = {
				phar_main_trait_underhanded = 2,--[[Predisposed--]]
				phar_main_trait_barbaric = 1,
			},
			character_spent_turns_in_encamp_stance = {
				phar_main_trait_content = 1,
			},
			character_suffered_attrition = {
				phar_main_trait_ambitious = 1,
			},
			character_interacted_with_non_shrine_ers = {
				phar_main_trait_materialistic = 2,--[[Predisposed--]]
			},
			character_prayed_at_ers = {
				phar_main_trait_spiritual = 1,
			},
			character_ends_turn_in_region_with_construction_shrine_building = {
				phar_main_trait_spiritual = 1,
			},
			character_fought_alone = {
				phar_main_trait_individualistic = 1,
			},
			character_bodyguard_suffered_casualties_high = {
				phar_main_trait_reckless = 1,
			},
			character_recruited_2h_melee_unit_infantry = {
				phar_main_trait_reckless = 1,
			},
			character_post_battle_release_generic = {
				phar_main_trait_merciful = 1,
				phar_main_trait_materialistic = 2,--[[Predisposed--]]
			},
			character_sacked_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_being_lazy_in_owned_settlement_high_public_order = {
				phar_main_trait_respectful = 1,
				phar_main_trait_hesitant= 1,
			},
			character_being_lazy_in_owned_settlement_low_public_order = {
				phar_main_trait_irreverent = 2,--[[Predisposed--]]
				phar_main_trait_hesitant= 1,
			},
			character_present_for_construction = {
				phar_main_trait_cultured = 1,
			},
			character_won_battle_cadmean_victory = {
				phar_main_trait_blunt = 1,
			},
			character_spent_turn_in_ambush_stance = {
				phar_main_trait_cowardly = 1,
				phar_main_trait_underhanded = 1,
			},
			character_spent_turns_in_march_stance = {
				phar_main_trait_ambitious = 1,
			},
			character_razed_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_executed_captives = {
				phar_main_trait_cruel = 1,
			},
			character_fought_battle_far_from_capital = {
				phar_main_trait_individualistic = 1,
			},
			character_reinforces_other_armies = {
				phar_main_trait_cooperative = 1,
			},
			character_beeing_reinforced = {
				phar_main_trait_cooperative = 1,
			},
			character_spent_turn_in_enemy_region = {
				phar_main_trait_confident = 1,
			},
			character_spent_turns_in_raiding_stance = {
				phar_main_trait_blunt = 1,
			},
			character_won_defensive_battle = {
				phar_main_trait_hesitant= 1,
			},
		},
	},
	
	--Background 8 (Grizzled Veteran)--
	[8] = {
		background_trait_key = "phar_main_background_8",
		is_household_background = false,
		use_when_coming_of_age = false,
		events = {

			character_recruited_1h_melee_unit_spears = {
				phar_main_trait_cautious = 2,--[[Predisposed--]]
			},
			character_bodyguard_suffered_casualties_low = {
				phar_main_trait_cautious = 2,--[[Predisposed--]]
				phar_main_trait_brave = 1,
			},
			character_recruited_khopeshi = {
				phar_main_trait_brave = 1,
			},
			character_recruited_swordmen = {
				phar_main_trait_brave = 1,
			},
			character_sacks_or_razes_ers_shrine = {
				phar_main_trait_underhanded = 1,
				phar_main_trait_barbaric = 1,
			},
			character_spent_turns_in_encamp_stance = {
				phar_main_trait_content = 1,
			},
			character_suffered_attrition = {
				phar_main_trait_ambitious = 1,
			},
			character_interacted_with_non_shrine_ers = {
				phar_main_trait_materialistic = 1,
			},
			character_prayed_at_ers = {
				phar_main_trait_spiritual = 1,
			},
			character_ends_turn_in_region_with_construction_shrine_building = {
				phar_main_trait_spiritual = 1,
			},
			character_fought_alone = {
				phar_main_trait_individualistic = 1,
			},
			character_bodyguard_suffered_casualties_high = {
				phar_main_trait_reckless = 1,
			},
			character_recruited_2h_melee_unit_infantry = {
				phar_main_trait_reckless = 1,
			},
			character_post_battle_release_generic = {
				phar_main_trait_merciful = 1,
				phar_main_trait_materialistic = 1,
			},
			character_sacked_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_being_lazy_in_owned_settlement_high_public_order = {
				phar_main_trait_respectful = 1,
				phar_main_trait_hesitant= 1,
			},
			character_being_lazy_in_owned_settlement_low_public_order = {
				phar_main_trait_irreverent = 1,
				phar_main_trait_hesitant= 1,
			},
			character_present_for_construction = {
				phar_main_trait_cultured = 1,
			},
			character_won_battle_cadmean_victory = {
				phar_main_trait_blunt = 2,--[[Predisposed--]]
			},
			character_spent_turn_in_ambush_stance = {
				phar_main_trait_cowardly = 1,
				phar_main_trait_underhanded = 1,
			},
			character_spent_turns_in_march_stance = {
				phar_main_trait_ambitious = 1,
			},
			character_razed_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_executed_captives = {
				phar_main_trait_cruel = 2,--[[Predisposed--]]
			},
			character_fought_battle_far_from_capital = {
				phar_main_trait_individualistic = 1,
			},
			character_reinforces_other_armies = {
				phar_main_trait_cooperative = 1,
			},
			character_beeing_reinforced = {
				phar_main_trait_cooperative = 1,
			},
			character_spent_turn_in_enemy_region = {
				phar_main_trait_confident = 2, --[[Predisposed--]]
			},
			character_spent_turns_in_raiding_stance = {
				phar_main_trait_blunt = 2,--[[Predisposed--]]
			},
			character_won_defensive_battle = {
				phar_main_trait_hesitant= 1,
			},
		},
	},
	
	--Background 9 (Family Man)--
	[9] = {
		background_trait_key = "phar_main_background_9",
		is_household_background = false,
		use_when_coming_of_age = true,
		events = {

			character_recruited_1h_melee_unit_spears = {
				phar_main_trait_cautious = 1,
			},
			character_bodyguard_suffered_casualties_low = {
				phar_main_trait_cautious = 1,
				phar_main_trait_brave = 2,--[[Predisposed--]]
			},
			character_recruited_khopeshi = {
				phar_main_trait_brave = 2,--[[Predisposed--]]
			},
			character_recruited_swordmen = {
				phar_main_trait_brave = 2,--[[Predisposed--]]
			},
			character_sacks_or_razes_ers_shrine = {
				phar_main_trait_underhanded = 1,
				phar_main_trait_barbaric = 1,
			},
			character_spent_turns_in_encamp_stance = {
				phar_main_trait_content = 2,--[[Predisposed--]]
			},
			character_suffered_attrition = {
				phar_main_trait_ambitious = 1,
			},
			character_interacted_with_non_shrine_ers = {
				phar_main_trait_materialistic = 1,
			},
			character_prayed_at_ers = {
				phar_main_trait_spiritual = 1,
			},
			character_ends_turn_in_region_with_construction_shrine_building = {
				phar_main_trait_spiritual = 1,
			},
			character_fought_alone = {
				phar_main_trait_individualistic = 1,
			},
			character_bodyguard_suffered_casualties_high = {
				phar_main_trait_reckless = 1,
			},
			character_recruited_2h_melee_unit_infantry = {
				phar_main_trait_reckless = 1,
			},
			character_post_battle_release_generic = {
				phar_main_trait_merciful = 1,
				phar_main_trait_materialistic = 1,
			},
			character_sacked_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_being_lazy_in_owned_settlement_high_public_order = {
				phar_main_trait_respectful = 2,--[[Predisposed--]]
				phar_main_trait_hesitant= 1,
			},
			character_being_lazy_in_owned_settlement_low_public_order = {
				phar_main_trait_irreverent = 1,
				phar_main_trait_hesitant= 1,
			},
			character_present_for_construction = {
				phar_main_trait_cultured = 1,
			},
			character_won_battle_cadmean_victory = {
				phar_main_trait_blunt = 1,
			},
			character_spent_turn_in_ambush_stance = {
				phar_main_trait_cowardly = 1,
				phar_main_trait_underhanded = 1,
			},
			character_spent_turns_in_march_stance = {
				phar_main_trait_ambitious = 1,
			},
			character_razed_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_executed_captives = {
				phar_main_trait_cruel = 1,
			},
			character_fought_battle_far_from_capital = {
				phar_main_trait_individualistic = 1,
			},
			character_reinforces_other_armies = {
				phar_main_trait_cooperative = 2,--[[Predisposed--]]
			},
			character_beeing_reinforced = {
				phar_main_trait_cooperative = 2,--[[Predisposed--]]
			},
			character_spent_turn_in_enemy_region = {
				phar_main_trait_confident = 1,
			},
			character_spent_turns_in_raiding_stance = {
				phar_main_trait_blunt = 1,
			},
			character_won_defensive_battle = {
				phar_main_trait_hesitant= 1,
			},
		},
	},
	
	--Background 10 (Generous Landowner)--
	[10] = {
		background_trait_key = "phar_main_background_10",
		is_household_background = false,
		use_when_coming_of_age = false,
		events = {

			character_recruited_1h_melee_unit_spears = {
				phar_main_trait_cautious = 1,
			},
			character_bodyguard_suffered_casualties_low = {
				phar_main_trait_cautious = 1,
				phar_main_trait_brave = 1,
			},
			character_recruited_khopeshi = {
				phar_main_trait_brave = 1,
			},
			character_recruited_swordmen = {
				phar_main_trait_brave = 1,
			},
			character_sacks_or_razes_ers_shrine = {
				phar_main_trait_underhanded = 1,
				phar_main_trait_barbaric = 1,
			},
			character_spent_turns_in_encamp_stance = {
				phar_main_trait_content = 1,
			},
			character_suffered_attrition = {
				phar_main_trait_ambitious = 2,--[[Predisposed--]]
			},
			character_interacted_with_non_shrine_ers = {
				phar_main_trait_materialistic = 1,
			},
			character_prayed_at_ers = {
				phar_main_trait_spiritual = 1,
			},
			character_ends_turn_in_region_with_construction_shrine_building = {
				phar_main_trait_spiritual = 1,
			},
			character_fought_alone = {
				phar_main_trait_individualistic = 1,
			},
			character_bodyguard_suffered_casualties_high = {
				phar_main_trait_reckless = 1,
			},
			character_recruited_2h_melee_unit_infantry = {
				phar_main_trait_reckless = 1,
			},
			character_post_battle_release_generic = {
				phar_main_trait_merciful = 1,
				phar_main_trait_materialistic = 1,
			},
			character_sacked_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_being_lazy_in_owned_settlement_high_public_order = {
				phar_main_trait_respectful = 1,
				phar_main_trait_hesitant= 1,
			},
			character_being_lazy_in_owned_settlement_low_public_order = {
				phar_main_trait_irreverent = 1,
				phar_main_trait_hesitant= 1,
			},
			character_present_for_construction = {
				phar_main_trait_cultured = 2,--[[Predisposed--]]
			},
			character_won_battle_cadmean_victory = {
				phar_main_trait_blunt = 1,
			},
			character_spent_turn_in_ambush_stance = {
				phar_main_trait_cowardly = 2,--[[Predisposed--]]
				phar_main_trait_underhanded = 1,
			},
			character_spent_turns_in_march_stance = {
				phar_main_trait_ambitious = 2,--[[Predisposed--]]
			},
			character_razed_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_executed_captives = {
				phar_main_trait_cruel = 1,
			},
			character_fought_battle_far_from_capital = {
				phar_main_trait_individualistic = 1,
			},
			character_reinforces_other_armies = {
				phar_main_trait_cooperative = 2,--[[Predisposed--]]
			},
			character_beeing_reinforced = {
				phar_main_trait_cooperative = 2,--[[Predisposed--]]
			},
			character_spent_turn_in_enemy_region = {
				phar_main_trait_confident = 1,
			},
			character_spent_turns_in_raiding_stance = {
				phar_main_trait_blunt = 1,
			},
			character_won_defensive_battle = {
				phar_main_trait_hesitant= 1,
			},
		},
	},
	
	--Background 11 (Freed from Slavery)--
	[11] = {
		background_trait_key = "phar_main_background_11",
		is_household_background = false,
		use_when_coming_of_age = false,
		events = {

			character_recruited_1h_melee_unit_spears = {
				phar_main_trait_cautious = 1,
			},
			character_bodyguard_suffered_casualties_low = {
				phar_main_trait_cautious = 1,
				phar_main_trait_brave = 1,
			},
			character_recruited_khopeshi = {
				phar_main_trait_brave = 1,
			},
			character_recruited_swordmen = {
				phar_main_trait_brave = 1,
			},
			character_sacks_or_razes_ers_shrine = {
				phar_main_trait_underhanded = 1,
				phar_main_trait_barbaric = 2,--[[Predisposed--]]
			},
			character_spent_turns_in_encamp_stance = {
				phar_main_trait_content = 1,
			},
			character_suffered_attrition = {
				phar_main_trait_ambitious = 2,--[[Predisposed--]]
			},
			character_interacted_with_non_shrine_ers = {
				phar_main_trait_materialistic = 1,
			},
			character_prayed_at_ers = {
				phar_main_trait_spiritual = 1,
			},
			character_ends_turn_in_region_with_construction_shrine_building = {
				phar_main_trait_spiritual = 1,
			},
			character_fought_alone = {
				phar_main_trait_individualistic = 1,
			},
			character_bodyguard_suffered_casualties_high = {
				phar_main_trait_reckless = 2,--[[Predisposed--]]
			},
			character_recruited_2h_melee_unit_infantry = {
				phar_main_trait_reckless = 2,--[[Predisposed--]]
			},
			character_post_battle_release_generic = {
				phar_main_trait_merciful = 1,
				phar_main_trait_materialistic = 1,
			},
			character_sacked_settlement = {
				phar_main_trait_barbaric = 2,--[[Predisposed--]]
			},
			character_being_lazy_in_owned_settlement_high_public_order = {
				phar_main_trait_respectful = 1,
				phar_main_trait_hesitant= 1,
			},
			character_being_lazy_in_owned_settlement_low_public_order = {
				phar_main_trait_irreverent = 1,
				phar_main_trait_hesitant= 1,
			},
			character_present_for_construction = {
				phar_main_trait_cultured = 1,
			},
			character_won_battle_cadmean_victory = {
				phar_main_trait_blunt = 1,
			},
			character_spent_turn_in_ambush_stance = {
				phar_main_trait_cowardly = 1,
				phar_main_trait_underhanded = 1,
			},
			character_spent_turns_in_march_stance = {
				phar_main_trait_ambitious = 2,--[[Predisposed--]]
			},
			character_razed_settlement = {
				phar_main_trait_barbaric = 2,--[[Predisposed--]]
			},
			character_executed_captives = {
				phar_main_trait_cruel = 1,
			},
			character_fought_battle_far_from_capital = {
				phar_main_trait_individualistic = 1,
			},
			character_reinforces_other_armies = {
				phar_main_trait_cooperative = 2,--[[Predisposed--]]
			},
			character_beeing_reinforced = {
				phar_main_trait_cooperative = 2,--[[Predisposed--]]
			},
			character_spent_turn_in_enemy_region = {
				phar_main_trait_confident = 1,
			},
			character_spent_turns_in_raiding_stance = {
				phar_main_trait_blunt = 1,
			},
			character_won_defensive_battle = {
				phar_main_trait_hesitant= 1,
			},
		},
	},
	
	--Background 12 (Cheerful Entertainer)--
	[12] = {
		background_trait_key = "phar_main_background_12",
		is_household_background = false,
		use_when_coming_of_age = true,
		events = {

			character_recruited_1h_melee_unit_spears = {
				phar_main_trait_cautious = 1,
			},
			character_bodyguard_suffered_casualties_low = {
				phar_main_trait_cautious = 1,
				phar_main_trait_brave = 1,
			},
			character_recruited_khopeshi = {
				phar_main_trait_brave = 1,
			},
			character_recruited_swordmen = {
				phar_main_trait_brave = 1,
			},
			character_sacks_or_razes_ers_shrine = {
				phar_main_trait_underhanded = 1,
				phar_main_trait_barbaric = 1,
			},
			character_spent_turns_in_encamp_stance = {
				phar_main_trait_content = 1,
			},
			character_suffered_attrition = {
				phar_main_trait_ambitious = 1,
			},
			character_interacted_with_non_shrine_ers = {
				phar_main_trait_materialistic = 2,--[[Predisposed--]]
			},
			character_prayed_at_ers = {
				phar_main_trait_spiritual = 1,
			},
			character_ends_turn_in_region_with_construction_shrine_building = {
				phar_main_trait_spiritual = 1,
			},
			character_fought_alone = {
				phar_main_trait_individualistic = 1,
			},
			character_bodyguard_suffered_casualties_high = {
				phar_main_trait_reckless = 1,
			},
			character_recruited_2h_melee_unit_infantry = {
				phar_main_trait_reckless = 1,
			},
			character_post_battle_release_generic = {
				phar_main_trait_merciful = 1,
				phar_main_trait_materialistic = 2,--[[Predisposed--]]
			},
			character_sacked_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_being_lazy_in_owned_settlement_high_public_order = {
				phar_main_trait_respectful = 1,
				phar_main_trait_hesitant= 1,
			},
			character_being_lazy_in_owned_settlement_low_public_order = {
				phar_main_trait_irreverent = 2,--[[Predisposed--]]
				phar_main_trait_hesitant= 1,
			},
			character_present_for_construction = {
				phar_main_trait_cultured = 2,--[[Predisposed--]]
			},
			character_won_battle_cadmean_victory = {
				phar_main_trait_blunt = 1,
			},
			character_spent_turn_in_ambush_stance = {
				phar_main_trait_cowardly = 2, --[[Predisposed--]]
				phar_main_trait_underhanded = 1,
			},
			character_spent_turns_in_march_stance = {
				phar_main_trait_ambitious = 1,
			},
			character_razed_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_executed_captives = {
				phar_main_trait_cruel = 1,
			},
			character_fought_battle_far_from_capital = {
				phar_main_trait_individualistic = 1,
			},
			character_reinforces_other_armies = {
				phar_main_trait_cooperative = 1,
			},
			character_beeing_reinforced = {
				phar_main_trait_cooperative = 1,
			},
			character_spent_turn_in_enemy_region = {
				phar_main_trait_confident = 1,
			},
			character_spent_turns_in_raiding_stance = {
				phar_main_trait_blunt = 1,
			},
			character_won_defensive_battle = {
				phar_main_trait_hesitant= 1,
			},
		},
	},
	
	--Background 13 (Raised in the Wild)--
	[13] = {
		background_trait_key = "phar_main_background_13",
		is_household_background = false,
		use_when_coming_of_age = true,
		events = {

			character_recruited_1h_melee_unit_spears = {
				phar_main_trait_cautious = 1,
			},
			character_bodyguard_suffered_casualties_low = {
				phar_main_trait_cautious = 1,
				phar_main_trait_brave = 1,
			},
			character_recruited_khopeshi = {
				phar_main_trait_brave = 1,
			},
			character_recruited_swordmen = {
				phar_main_trait_brave = 1,
			},
			character_sacks_or_razes_ers_shrine = {
				phar_main_trait_underhanded = 1,
				phar_main_trait_barbaric = 2,--[[Predisposed--]]
			},
			character_spent_turns_in_encamp_stance = {
				phar_main_trait_content = 1,
			},
			character_suffered_attrition = {
				phar_main_trait_ambitious = 1,
			},
			character_interacted_with_non_shrine_ers = {
				phar_main_trait_materialistic = 1,
			},
			character_prayed_at_ers = {
				phar_main_trait_spiritual = 1,
			},
			character_ends_turn_in_region_with_construction_shrine_building = {
				phar_main_trait_spiritual = 1,
			},
			character_fought_alone = {
				phar_main_trait_individualistic = 1,
			},
			character_bodyguard_suffered_casualties_high = {
				phar_main_trait_reckless = 2,--[[Predisposed--]]
			},
			character_recruited_2h_melee_unit_infantry = {
				phar_main_trait_reckless = 2,--[[Predisposed--]]
			},
			character_post_battle_release_generic = {
				phar_main_trait_merciful = 1,
				phar_main_trait_materialistic = 1,
			},
			character_sacked_settlement = {
				phar_main_trait_barbaric = 2,--[[Predisposed--]]
			},
			character_being_lazy_in_owned_settlement_high_public_order = {
				phar_main_trait_respectful = 1,
				phar_main_trait_hesitant= 1,
			},
			character_being_lazy_in_owned_settlement_low_public_order = {
				phar_main_trait_irreverent = 1,
				phar_main_trait_hesitant= 1,
			},
			character_present_for_construction = {
				phar_main_trait_cultured = 1,
			},
			character_won_battle_cadmean_victory = {
				phar_main_trait_blunt = 2,--[[Predisposed--]]
			},
			character_spent_turn_in_ambush_stance = {
				phar_main_trait_cowardly = 1,
				phar_main_trait_underhanded = 1,
			},
			character_spent_turns_in_march_stance = {
				phar_main_trait_ambitious = 1,
			},
			character_razed_settlement = {
				phar_main_trait_barbaric = 2,--[[Predisposed--]]
			},
			character_executed_captives = {
				phar_main_trait_cruel = 1,
			},
			character_fought_battle_far_from_capital = {
				phar_main_trait_individualistic = 1,
			},
			character_reinforces_other_armies = {
				phar_main_trait_cooperative = 1,
			},
			character_beeing_reinforced = {
				phar_main_trait_cooperative = 1,
			},
			character_spent_turn_in_enemy_region = {
				phar_main_trait_confident = 2,--[[Predisposed--]]
			},
			character_spent_turns_in_raiding_stance = {
				phar_main_trait_blunt = 2,--[[Predisposed--]]
			},
			character_won_defensive_battle = {
				phar_main_trait_hesitant= 1,
			},
		},
	},

	-- Household backgrounds are reserved for civilian women and used for them toghether with all other applicable backgrounds.
	--Background 14 (household 1, Genius Mind)--
	[14] = {
		background_trait_key = "phar_map_background_household_1",
		is_household_background = true,
		use_when_coming_of_age = true,
		events = {
		},
	},

	--Background 15 (household 2, Remarkable Beauty)--
	[15] = {
		background_trait_key = "phar_map_background_household_2",
		is_household_background = true,
		use_when_coming_of_age = true,
		events = {
		},
	},

	--Background 16 (household 3, Obedient)--
	[16] = {
		background_trait_key = "phar_map_background_household_3",
		is_household_background = true,
		use_when_coming_of_age = true,
		events = {
		},
	},

	--Background 17 (household 4, Dull-witted)--
	[17] = {
		background_trait_key = "phar_map_background_household_4",
		is_household_background = true,
		use_when_coming_of_age = true,
		events = {
		},
	},

	--Background 18 (household 5, Comely)--
	[18] = {
		background_trait_key = "phar_map_background_household_5",
		is_household_background = true,
		use_when_coming_of_age = true,
		events = {
		},
	},

	--Background 19 (household 6, Obstinate)--
	[19] = {
		background_trait_key = "phar_map_background_household_6",
		is_household_background = true,
		use_when_coming_of_age = true,
		events = {
		},
	},
}

campaign_traits.config.faction_leader_backgrounds = {
	--RAMESSES--
	[1] = {
		background_trait_key = "phar_main_background_ramesses",
		faction = "phar_main_ramesses",
		events = {

			character_recruited_1h_melee_unit_spears = {
				phar_main_trait_cautious = 1,
			},
			character_bodyguard_suffered_casualties_low = {
				phar_main_trait_cautious = 1,
				phar_main_trait_brave = 1,
			},
			character_recruited_khopeshi = {
				phar_main_trait_brave = 1,
			},
			character_recruited_swordmen = {
				phar_main_trait_brave = 1,
			},
			character_sacks_or_razes_ers_shrine = {
				phar_main_trait_underhanded = 1,
				phar_main_trait_barbaric = 1,
			},
			character_spent_turns_in_encamp_stance = {
				phar_main_trait_content = 1,
			},
			character_suffered_attrition = {
				phar_main_trait_ambitious = 2,--[[Predisposed--]]
			},
			character_interacted_with_non_shrine_ers = {
				phar_main_trait_materialistic = 1,
			},
			character_prayed_at_ers = {
				phar_main_trait_spiritual = 2,--[[Predisposed--]]
			},
			character_ends_turn_in_region_with_construction_shrine_building = {
				phar_main_trait_spiritual = 2,--[[Predisposed--]]
			},
			character_fought_alone = {
				phar_main_trait_individualistic = 2,--[[Predisposed--]]
			},
			character_bodyguard_suffered_casualties_high = {
				phar_main_trait_reckless = 1,
			},
			character_recruited_2h_melee_unit_infantry = {
				phar_main_trait_reckless = 1,
			},
			character_post_battle_release_generic = {
				phar_main_trait_merciful = 1,
				phar_main_trait_materialistic = 1,
			},
			character_sacked_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_being_lazy_in_owned_settlement_high_public_order = {
				phar_main_trait_respectful = 1,
				phar_main_trait_hesitant= 1,
			},
			character_being_lazy_in_owned_settlement_low_public_order = {
				phar_main_trait_irreverent = 1,
				phar_main_trait_hesitant= 1,
			},
			character_present_for_construction = {
				phar_main_trait_cultured = 1,
			},
			character_won_battle_cadmean_victory = {
				phar_main_trait_blunt = 1,
			},
			character_spent_turn_in_ambush_stance = {
				phar_main_trait_cowardly = 1,
				phar_main_trait_underhanded = 1,
			},
			character_spent_turns_in_march_stance = {
				phar_main_trait_ambitious = 2,--[[Predisposed--]]
			},
			character_razed_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_executed_captives = {
				phar_main_trait_cruel = 1,
			},
			character_fought_battle_far_from_capital = {
				phar_main_trait_individualistic = 2,--[[Predisposed--]]
			},
			character_reinforces_other_armies = {
				phar_main_trait_cooperative = 1,
			},
			character_beeing_reinforced = {
				phar_main_trait_cooperative = 1,
			},
			character_spent_turn_in_enemy_region = {
				phar_main_trait_confident = 2,--[[Predisposed--]]
			},
			character_spent_turns_in_raiding_stance = {
				phar_main_trait_blunt = 1,
			},
			character_won_defensive_battle = {
				phar_main_trait_hesitant= 1,
			},
			character_won_battle = {
				phar_main_trait_ramesses = 2,--[[Special Trait--]]
			},
		},
	},

	--AMENMESSE--
	[2] = {
		background_trait_key = "phar_main_background_amenmesse",
		faction = "phar_main_amenmesse",
		events = {

			character_recruited_1h_melee_unit_spears = {
				phar_main_trait_cautious = 1,
			},
			character_bodyguard_suffered_casualties_low = {
				phar_main_trait_cautious = 1,
				phar_main_trait_brave = 1,
			},
			character_recruited_khopeshi = {
				phar_main_trait_brave = 1,
			},
			character_recruited_swordmen = {
				phar_main_trait_brave = 1,
			},
			character_sacks_or_razes_ers_shrine = {
				phar_main_trait_underhanded = 1,
				phar_main_trait_barbaric = 1,
			},
			character_spent_turns_in_encamp_stance = {
				phar_main_trait_content = 1,
			},
			character_suffered_attrition = {
				phar_main_trait_ambitious = 2,--[[Predisposed--]]
			},
			character_interacted_with_non_shrine_ers = {
				phar_main_trait_materialistic = 2,--[[Predisposed--]]
			},
			character_prayed_at_ers = {
				phar_main_trait_spiritual = 1,
			},
			character_ends_turn_in_region_with_construction_shrine_building = {
				phar_main_trait_spiritual = 1,
			},
			character_fought_alone = {
				phar_main_trait_individualistic = 1,
			},
			character_bodyguard_suffered_casualties_high = {
				phar_main_trait_reckless = 1,
			},
			character_recruited_2h_melee_unit_infantry = {
				phar_main_trait_reckless = 1,
			},
			character_post_battle_release_generic = {
				phar_main_trait_merciful = 1,
				phar_main_trait_materialistic = 2,--[[Predisposed--]]
			},
			character_sacked_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_being_lazy_in_owned_settlement_high_public_order = {
				phar_main_trait_respectful = 1,
				phar_main_trait_hesitant= 1,
			},
			character_being_lazy_in_owned_settlement_low_public_order = {
				phar_main_trait_irreverent = 2,--[[Predisposed--]]
				phar_main_trait_hesitant= 1,
			},
			character_present_for_construction = {
				phar_main_trait_cultured = 1,
			},
			character_won_battle_cadmean_victory = {
				phar_main_trait_blunt = 1,
			},
			character_spent_turn_in_ambush_stance = {
				phar_main_trait_cowardly = 1,
				phar_main_trait_underhanded = 1,
			},
			character_spent_turns_in_march_stance = {
				phar_main_trait_ambitious = 2,--[[Predisposed--]]
			},
			character_razed_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_executed_captives = {
				phar_main_trait_cruel = 1,
			},
			character_fought_battle_far_from_capital = {
				phar_main_trait_individualistic = 1,
			},
			character_reinforces_other_armies = {
				phar_main_trait_cooperative = 2,--[[Predisposed--]]
			},
			character_beeing_reinforced = {
				phar_main_trait_cooperative = 2,--[[Predisposed--]]
			},
			character_spent_turn_in_enemy_region = {
				phar_main_trait_confident = 1,
			},
			character_spent_turns_in_raiding_stance = {
				phar_main_trait_blunt = 1,
			},
			character_won_defensive_battle = {
				phar_main_trait_hesitant= 1,
			},
			character_won_battle = {
				phar_main_trait_amenmesse = 2,--[[Special Trait--]]
			},
		},
	},

	--BAY--
	[3] = {
		background_trait_key = "phar_main_background_bay",
		faction = "phar_main_bay",
		events = {

			character_recruited_1h_melee_unit_spears = {
				phar_main_trait_cautious = 1,
			},
			character_bodyguard_suffered_casualties_low = {
				phar_main_trait_cautious = 1,
				phar_main_trait_brave = 1,
			},
			character_recruited_khopeshi = {
				phar_main_trait_brave = 1,
			},
			character_recruited_swordmen = {
				phar_main_trait_brave = 1,
			},
			character_sacks_or_razes_ers_shrine = {
				phar_main_trait_underhanded = 2,--[[Predisposed--]]
				phar_main_trait_barbaric = 1,
			},
			character_spent_turns_in_encamp_stance = {
				phar_main_trait_content = 1,
			},
			character_suffered_attrition = {
				phar_main_trait_ambitious = 1,
			},
			character_interacted_with_non_shrine_ers = {
				phar_main_trait_materialistic = 2,--[[Predisposed--]]
			},
			character_prayed_at_ers = {
				phar_main_trait_spiritual = 1,
			},
			character_ends_turn_in_region_with_construction_shrine_building = {
				phar_main_trait_spiritual = 1,
			},
			character_fought_alone = {
				phar_main_trait_individualistic = 1,
			},
			character_bodyguard_suffered_casualties_high = {
				phar_main_trait_reckless = 1,
			},
			character_recruited_2h_melee_unit_infantry = {
				phar_main_trait_reckless = 1,
			},
			character_post_battle_release_generic = {
				phar_main_trait_merciful = 1,
				phar_main_trait_materialistic = 2,--[[Predisposed--]]
			},
			character_sacked_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_being_lazy_in_owned_settlement_high_public_order = {
				phar_main_trait_respectful = 1,
				phar_main_trait_hesitant= 1,
			},
			character_being_lazy_in_owned_settlement_low_public_order = {
				phar_main_trait_irreverent = 1,
				phar_main_trait_hesitant= 1,
			},
			character_present_for_construction = {
				phar_main_trait_cultured = 2,--[[Predisposed--]]
			},
			character_won_battle_cadmean_victory = {
				phar_main_trait_blunt = 1,
			},
			character_spent_turn_in_ambush_stance = {
				phar_main_trait_cowardly = 1,
				phar_main_trait_underhanded = 1,
			},
			character_spent_turns_in_march_stance = {
				phar_main_trait_ambitious = 1,
			},
			character_razed_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_executed_captives = {
				phar_main_trait_cruel = 1,
			},
			character_fought_battle_far_from_capital = {
				phar_main_trait_individualistic = 1,
			},
			character_reinforces_other_armies = {
				phar_main_trait_cooperative = 2,--[[Predisposed--]]
			},
			character_beeing_reinforced = {
				phar_main_trait_cooperative = 2,--[[Predisposed--]]
			},
			character_spent_turn_in_enemy_region = {
				phar_main_trait_confident = 1,
			},
			character_spent_turns_in_raiding_stance = {
				phar_main_trait_blunt = 1,
			},
			character_won_defensive_battle = {
				phar_main_trait_hesitant= 1,
			},
			character_won_battle = {
				phar_main_trait_bay = 2,--[[Special Trait--]]
			},
		},
	},


	--IRSU--
	[4] = {
		background_trait_key = "phar_main_background_irsu",
		faction = "phar_main_irsu",
		events = {

			character_recruited_1h_melee_unit_spears = {
				phar_main_trait_cautious = 1,
			},
			character_bodyguard_suffered_casualties_low = {
				phar_main_trait_cautious = 1,
				phar_main_trait_brave = 1,
			},
			character_recruited_khopeshi = {
				phar_main_trait_brave = 1,
			},
			character_recruited_swordmen = {
				phar_main_trait_brave = 1,
			},
			character_sacks_or_razes_ers_shrine = {
				phar_main_trait_underhanded = 1,
				phar_main_trait_barbaric = 2,--[[Predisposed--]]
			},
			character_spent_turns_in_encamp_stance = {
				phar_main_trait_content = 1,
			},
			character_suffered_attrition = {
				phar_main_trait_ambitious = 1,
			},
			character_interacted_with_non_shrine_ers = {
				phar_main_trait_materialistic = 2,--[[Predisposed--]]
			},
			character_prayed_at_ers = {
				phar_main_trait_spiritual = 1,
			},
			character_ends_turn_in_region_with_construction_shrine_building = {
				phar_main_trait_spiritual = 1,
			},
			character_fought_alone = {
				phar_main_trait_individualistic = 1,
			},
			character_bodyguard_suffered_casualties_high = {
				phar_main_trait_reckless = 1,
			},
			character_recruited_2h_melee_unit_infantry = {
				phar_main_trait_reckless = 1,
			},
			character_post_battle_release_generic = {
				phar_main_trait_merciful = 1,
				phar_main_trait_materialistic = 2,--[[Predisposed--]]
			},
			character_sacked_settlement = {
				phar_main_trait_barbaric = 2,--[[Predisposed--]]
			},
			character_being_lazy_in_owned_settlement_high_public_order = {
				phar_main_trait_respectful = 1,
				phar_main_trait_hesitant= 1,
			},
			character_being_lazy_in_owned_settlement_low_public_order = {
				phar_main_trait_irreverent = 2,--[[Predisposed--]]
				phar_main_trait_hesitant= 1,
			},
			character_present_for_construction = {
				phar_main_trait_cultured = 1,
			},
			character_won_battle_cadmean_victory = {
				phar_main_trait_blunt = 1,
			},
			character_spent_turn_in_ambush_stance = {
				phar_main_trait_cowardly = 1,
				phar_main_trait_underhanded = 1,
			},
			character_spent_turns_in_march_stance = {
				phar_main_trait_ambitious = 1,
			},
			character_razed_settlement = {
				phar_main_trait_barbaric = 2,--[[Predisposed--]]
			},
			character_executed_captives = {
				phar_main_trait_cruel = 2,--[[Predisposed--]]
			},
			character_fought_battle_far_from_capital = {
				phar_main_trait_individualistic = 1,
			},
			character_reinforces_other_armies = {
				phar_main_trait_cooperative = 1,
			},
			character_beeing_reinforced = {
				phar_main_trait_cooperative = 1,
			},
			character_spent_turn_in_enemy_region = {
				phar_main_trait_confident = 1,
			},
			character_spent_turns_in_raiding_stance = {
				phar_main_trait_blunt = 1,
			},
			character_won_defensive_battle = {
				phar_main_trait_hesitant= 1,
			},
			character_won_battle = {
				phar_main_trait_irsu = 2,--[[Special Trait--]]
			},
		},
	},

	--KURUNTA--
	[5] = {
		background_trait_key = "phar_main_background_kurunta",
		faction = "phar_main_kurunta",
		events = {

			character_recruited_1h_melee_unit_spears = {
				phar_main_trait_cautious = 1,
			},
			character_bodyguard_suffered_casualties_low = {
				phar_main_trait_cautious = 1,
				phar_main_trait_brave = 1,
			},
			character_recruited_khopeshi = {
				phar_main_trait_brave = 1,
			},
			character_recruited_swordmen = {
				phar_main_trait_brave = 1,
			},
			character_sacks_or_razes_ers_shrine = {
				phar_main_trait_underhanded = 2,--[[Predisposed--]]
				phar_main_trait_barbaric = 2,--[[Predisposed--]]
			},
			character_spent_turns_in_encamp_stance = {
				phar_main_trait_content = 1,
			},
			character_suffered_attrition = {
				phar_main_trait_ambitious = 1,
			},
			character_interacted_with_non_shrine_ers = {
				phar_main_trait_materialistic = 1,
			},
			character_prayed_at_ers = {
				phar_main_trait_spiritual = 2,--[[Predisposed--]]
			},
			character_ends_turn_in_region_with_construction_shrine_building = {
				phar_main_trait_spiritual = 2,--[[Predisposed--]]
			},
			character_fought_alone = {
				phar_main_trait_individualistic = 1,
			},
			character_bodyguard_suffered_casualties_high = {
				phar_main_trait_reckless = 1,
			},
			character_recruited_2h_melee_unit_infantry = {
				phar_main_trait_reckless = 1,
			},
			character_post_battle_release_generic = {
				phar_main_trait_merciful = 1,
				phar_main_trait_materialistic = 1,
			},
			character_sacked_settlement = {
				phar_main_trait_barbaric = 2,--[[Predisposed--]]
			},
			character_being_lazy_in_owned_settlement_high_public_order = {
				phar_main_trait_respectful = 1,
				phar_main_trait_hesitant= 1,
			},
			character_being_lazy_in_owned_settlement_low_public_order = {
				phar_main_trait_irreverent = 1,
				phar_main_trait_hesitant= 1,
			},
			character_present_for_construction = {
				phar_main_trait_cultured = 1,
			},
			character_won_battle_cadmean_victory = {
				phar_main_trait_blunt = 1,
			},
			character_spent_turn_in_ambush_stance = {
				phar_main_trait_cowardly = 1,
				phar_main_trait_underhanded = 2,--[[Predisposed--]]
			},
			character_spent_turns_in_march_stance = {
				phar_main_trait_ambitious = 1,
			},
			character_razed_settlement = {
				phar_main_trait_barbaric = 2,--[[Predisposed--]]
			},
			character_executed_captives = {
				phar_main_trait_cruel = 2,--[[Predisposed--]]
			},
			character_fought_battle_far_from_capital = {
				phar_main_trait_individualistic = 1,
			},
			character_reinforces_other_armies = {
				phar_main_trait_cooperative = 1,
			},
			character_beeing_reinforced = {
				phar_main_trait_cooperative = 1,
			},
			character_spent_turn_in_enemy_region = {
				phar_main_trait_confident = 1,
			},
			character_spent_turns_in_raiding_stance = {
				phar_main_trait_blunt = 1,
			},
			character_won_defensive_battle = {
				phar_main_trait_hesitant= 1,
			},
			character_won_battle = {
				phar_main_trait_kurunta = 2,--[[Special Trait--]]
			},
		},
	},

	--SETI--
	[6] = {
		background_trait_key = "phar_main_background_seti",
		faction = "phar_main_seti",
		events = {

			character_recruited_1h_melee_unit_spears = {
				phar_main_trait_cautious = 1,
			},
			character_bodyguard_suffered_casualties_low = {
				phar_main_trait_cautious = 1,
				phar_main_trait_brave = 1,
			},
			character_recruited_khopeshi = {
				phar_main_trait_brave = 1,
			},
			character_recruited_swordmen = {
				phar_main_trait_brave = 1,
			},
			character_sacks_or_razes_ers_shrine = {
				phar_main_trait_underhanded = 1,
				phar_main_trait_barbaric = 1,
			},
			character_spent_turns_in_encamp_stance = {
				phar_main_trait_content = 1,
			},
			character_suffered_attrition = {
				phar_main_trait_ambitious = 2,--[[Predisposed--]]
			},
			character_interacted_with_non_shrine_ers = {
				phar_main_trait_materialistic = 1,
			},
			character_prayed_at_ers = {
				phar_main_trait_spiritual = 1,
			},
			character_ends_turn_in_region_with_construction_shrine_building = {
				phar_main_trait_spiritual = 1,
			},
			character_fought_alone = {
				phar_main_trait_individualistic = 1,
			},
			character_bodyguard_suffered_casualties_high = {
				phar_main_trait_reckless = 1,
			},
			character_recruited_2h_melee_unit_infantry = {
				phar_main_trait_reckless = 1,
			},
			character_post_battle_release_generic = {
				phar_main_trait_merciful = 1,
				phar_main_trait_materialistic = 1,
			},
			character_sacked_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_being_lazy_in_owned_settlement_high_public_order = {
				phar_main_trait_respectful = 1,
				phar_main_trait_hesitant= 1,
			},
			character_being_lazy_in_owned_settlement_low_public_order = {
				phar_main_trait_irreverent = 1,
				phar_main_trait_hesitant= 1,
			},
			character_present_for_construction = {
				phar_main_trait_cultured = 1,
			},
			character_won_battle_cadmean_victory = {
				phar_main_trait_blunt = 2,--[[Predisposed--]]
			},
			character_spent_turn_in_ambush_stance = {
				phar_main_trait_cowardly = 1,
				phar_main_trait_underhanded = 1,
			},
			character_spent_turns_in_march_stance = {
				phar_main_trait_ambitious = 2,--[[Predisposed--]]
			},
			character_razed_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_executed_captives = {
				phar_main_trait_cruel = 2,--[[Predisposed--]]
			},
			character_fought_battle_far_from_capital = {
				phar_main_trait_individualistic = 1,
			},
			character_reinforces_other_armies = {
				phar_main_trait_cooperative = 1,
			},
			character_spent_turn_in_enemy_region = {
				phar_main_trait_confident = 2,--[[Predisposed--]]
			},
			character_spent_turns_in_raiding_stance = {
				phar_main_trait_blunt = 2,--[[Predisposed--]]
			},
			character_won_defensive_battle = {
				phar_main_trait_hesitant= 1,
			},
			character_won_battle = {
				phar_main_trait_seti = 2,--[[Special Trait--]]
			},
		},
	},

	--SUPPI--
	[7] = {
		background_trait_key = "phar_main_background_suppiliuliuma",
		faction = "phar_main_suppiluliuma",
		events = {

			character_recruited_1h_melee_unit_spears = {
				phar_main_trait_cautious = 1,
			},
			character_bodyguard_suffered_casualties_low = {
				phar_main_trait_cautious = 1,
				phar_main_trait_brave = 1,
			},
			character_recruited_khopeshi = {
				phar_main_trait_brave = 1,
			},
			character_recruited_swordmen = {
				phar_main_trait_brave = 1,
			},
			character_sacks_or_razes_ers_shrine = {
				phar_main_trait_underhanded = 1,
				phar_main_trait_barbaric = 1,
			},
			character_spent_turns_in_encamp_stance = {
				phar_main_trait_content = 2,--[[Predisposed--]]
			},
			character_suffered_attrition = {
				phar_main_trait_ambitious = 1,
			},
			character_interacted_with_non_shrine_ers = {
				phar_main_trait_materialistic = 1,
			},
			character_prayed_at_ers = {
				phar_main_trait_spiritual = 2,--[[Predisposed--]]
			},
			character_ends_turn_in_region_with_construction_shrine_building = {
				phar_main_trait_spiritual = 2,--[[Predisposed--]]
			},
			character_fought_alone = {
				phar_main_trait_individualistic = 1,
			},
			character_bodyguard_suffered_casualties_high = {
				phar_main_trait_reckless = 1,
			},
			character_recruited_2h_melee_unit_infantry = {
				phar_main_trait_reckless = 1,
			},
			character_post_battle_release_generic = {
				phar_main_trait_merciful = 1,
				phar_main_trait_materialistic = 1,
			},
			character_sacked_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_being_lazy_in_owned_settlement_high_public_order = {
				phar_main_trait_respectful = 1,
				phar_main_trait_hesitant= 1,
			},
			character_being_lazy_in_owned_settlement_low_public_order = {
				phar_main_trait_irreverent = 1,
				phar_main_trait_hesitant= 1,
			},
			character_present_for_construction = {
				phar_main_trait_cultured = 2,--[[Predisposed--]]
			},
			character_won_battle_cadmean_victory = {
				phar_main_trait_blunt = 1,
			},
			character_spent_turn_in_ambush_stance = {
				phar_main_trait_cowardly = 1,
				phar_main_trait_underhanded = 1,
			},
			character_spent_turns_in_march_stance = {
				phar_main_trait_ambitious = 1,
			},
			character_razed_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_executed_captives = {
				phar_main_trait_cruel = 1,
			},
			character_fought_battle_far_from_capital = {
				phar_main_trait_individualistic = 1,
			},
			character_reinforces_other_armies = {
				phar_main_trait_cooperative = 2,--[[Predisposed--]]
			},
			character_beeing_reinforced = {
				phar_main_trait_cooperative = 2,--[[Predisposed--]]
			},
			character_spent_turn_in_enemy_region = {
				phar_main_trait_confident = 1,
			},
			character_spent_turns_in_raiding_stance = {
				phar_main_trait_blunt = 1,
			},
			character_won_defensive_battle = {
				phar_main_trait_hesitant= 1,
			},
			character_won_battle = {
				phar_main_trait_suppiluliuma = 2,--[[Special Trait--]]		
			},
		},
	},

	--TAUSRET--
	[8] = {
		background_trait_key = "phar_main_background_tausret",
		faction = "phar_main_tausret",
		events = {

			character_recruited_1h_melee_unit_spears = {
				phar_main_trait_cautious = 1,
			},
			character_bodyguard_suffered_casualties_low = {
				phar_main_trait_cautious = 1,
				phar_main_trait_brave = 1,
			},
			character_recruited_khopeshi = {
				phar_main_trait_brave = 1,
			},
			character_recruited_swordmen = {
				phar_main_trait_brave = 1,
			},
			character_sacks_or_razes_ers_shrine = {
				phar_main_trait_underhanded = 1,
				phar_main_trait_barbaric = 1,
			},
			character_spent_turns_in_encamp_stance = {
				phar_main_trait_content = 1,
			},
			character_suffered_attrition = {
				phar_main_trait_ambitious = 1,
			},
			character_interacted_with_non_shrine_ers = {
				phar_main_trait_materialistic = 1,
			},
			character_prayed_at_ers = {
				phar_main_trait_spiritual = 1,
			},
			character_ends_turn_in_region_with_construction_shrine_building = {
				phar_main_trait_spiritual = 1,
			},
			character_fought_alone = {
				phar_main_trait_individualistic = 1,
			},
			character_bodyguard_suffered_casualties_high = {
				phar_main_trait_reckless = 1,
			},
			character_recruited_2h_melee_unit_infantry = {
				phar_main_trait_reckless = 1,
			},
			character_post_battle_release_generic = {
				phar_main_trait_merciful = 2,--[[Predisposed--]]
				phar_main_trait_materialistic = 1,
			},
			character_sacked_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_being_lazy_in_owned_settlement_high_public_order = {
				phar_main_trait_respectful = 2,--[[Predisposed--]]
				phar_main_trait_hesitant= 1,
			},
			character_being_lazy_in_owned_settlement_low_public_order = {
				phar_main_trait_irreverent = 1,
				phar_main_trait_hesitant= 1,
			},
			character_present_for_construction = {
				phar_main_trait_cultured = 2,--[[Predisposed--]]
			},
			character_won_battle_cadmean_victory = {
				phar_main_trait_blunt = 1,
			},
			character_spent_turn_in_ambush_stance = {
				phar_main_trait_cowardly = 1,
				phar_main_trait_underhanded = 1,
			},
			character_spent_turns_in_march_stance = {
				phar_main_trait_ambitious = 1,
			},
			character_razed_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_executed_captives = {
				phar_main_trait_cruel = 1,
			},
			character_fought_battle_far_from_capital = {
				phar_main_trait_individualistic = 1,
			},
			character_reinforces_other_armies = {
				phar_main_trait_cooperative = 2,--[[Predisposed--]]
			},
			character_beeing_reinforced = {
				phar_main_trait_cooperative = 2,--[[Predisposed--]]
			},
			character_spent_turn_in_enemy_region = {
				phar_main_trait_confident = 1,
			},
			character_spent_turns_in_raiding_stance = {
				phar_main_trait_blunt = 1,
			},
			character_won_defensive_battle = {
				phar_main_trait_hesitant= 1,
			},
			character_won_battle = {
				phar_main_trait_tausret = 2,--[[Special Trait--]]
			},
		},
	},

	--WALWETES--
	[9] = {
		background_trait_key = "phar_sea_background_walwetes",
		faction = "phar_sea_peleset",
		events = {

			character_recruited_1h_melee_unit_spears = {
				phar_main_trait_cautious = 1,
			},
			character_bodyguard_suffered_casualties_low = {
				phar_main_trait_cautious = 1,
				phar_main_trait_brave = 2, --[[Predisposed--]]
			},
			character_recruited_khopeshi = {
				phar_main_trait_brave = 2, --[[Predisposed--]]
			},
			character_recruited_swordmen = {
				phar_main_trait_brave = 2, --[[Predisposed--]]
			},
			character_sacks_or_razes_ers_shrine = {
				phar_main_trait_underhanded = 1,
				phar_main_trait_barbaric = 1,
			},
			character_spent_turns_in_encamp_stance = {
				phar_main_trait_content = 1,
			},
			character_suffered_attrition = {
				phar_main_trait_ambitious = 1,
			},
			character_interacted_with_non_shrine_ers = {
				phar_main_trait_materialistic = 2, --[[Predisposed--]]
			},
			character_prayed_at_ers = {
				phar_main_trait_spiritual = 1,
			},
			character_ends_turn_in_region_with_construction_shrine_building = {
				phar_main_trait_spiritual = 1,
			},
			character_fought_alone = {
				phar_main_trait_individualistic = 1,
			},
			character_bodyguard_suffered_casualties_high = {
				phar_main_trait_reckless = 1,
			},
			character_recruited_2h_melee_unit_infantry = {
				phar_main_trait_reckless = 1,
			},
			character_post_battle_release_generic = {
				phar_main_trait_merciful = 1,
				phar_main_trait_materialistic = 2,  --[[Predisposed--]]
			},
			character_sacked_settlement = {
				phar_main_trait_barbaric = 2, --[[Predisposed--]]
			},
			character_being_lazy_in_owned_settlement_high_public_order = {
				phar_main_trait_respectful = 1,
				phar_main_trait_hesitant = 1,
			},
			character_being_lazy_in_owned_settlement_low_public_order = {
				phar_main_trait_irreverent = 1,
				phar_main_trait_hesitant = 1,
			},
			character_present_for_construction = {
				phar_main_trait_cultured = 1,
			},
			character_won_battle_cadmean_victory = {
				phar_main_trait_blunt = 1,
			},
			character_spent_turn_in_ambush_stance = {
				phar_main_trait_cowardly = 1,
				phar_main_trait_underhanded = 1,
			},
			character_spent_turns_in_march_stance = {
				phar_main_trait_ambitious = 1,
			},
			character_razed_settlement = {
				phar_main_trait_barbaric = 2, --[[Predisposed--]]
			},
			character_executed_captives = {
				phar_main_trait_cruel = 1,
			},
			character_fought_battle_far_from_capital = {
				phar_main_trait_individualistic = 1,
			},
			character_reinforces_other_armies = {
				phar_main_trait_cooperative = 2, --[[Predisposed--]]
			},
			character_beeing_reinforced = {
				phar_main_trait_cooperative = 2, --[[Predisposed--]]
			},
			character_spent_turn_in_enemy_region = {
				phar_main_trait_confident = 1,
			},
			character_spent_turns_in_raiding_stance = {
				phar_main_trait_blunt = 1,
			},
			character_won_defensive_battle = {
				phar_main_trait_hesitant = 1,
			},
			character_won_battle = {
				phar_sea_trait_walwetes = 1,--[[Special Trait--]]
			},
		},
	},

	--IOLAOS--
	[10] = {
		background_trait_key = "phar_sea_background_iolaos",
		faction = "phar_sea_sherden",
		events = {

			character_recruited_1h_melee_unit_spears = {
				phar_main_trait_cautious = 1,
			},
			character_bodyguard_suffered_casualties_low = {
				phar_main_trait_cautious = 1,
				phar_main_trait_brave = 1,
			},
			character_recruited_khopeshi = {
				phar_main_trait_brave = 1,
			},
			character_recruited_swordmen = {
				phar_main_trait_brave = 1,
			},
			character_sacks_or_razes_ers_shrine = {
				phar_main_trait_underhanded = 1,
				phar_main_trait_barbaric = 1,
			},
			character_spent_turns_in_encamp_stance = {
				phar_main_trait_content = 1,
			},
			character_suffered_attrition = {
				phar_main_trait_ambitious = 1,
			},
			character_interacted_with_non_shrine_ers = {
				phar_main_trait_materialistic = 1,
			},
			character_prayed_at_ers = {
				phar_main_trait_spiritual = 2, --[[Predisposed--]]
			},
			character_ends_turn_in_region_with_construction_shrine_building = {
				phar_main_trait_spiritual = 2, --[[Predisposed--]]
			},
			character_fought_alone = {
				phar_main_trait_individualistic = 1,
			},
			character_bodyguard_suffered_casualties_high = {
				phar_main_trait_reckless = 2,  --[[Predisposed--]]
			},
			character_recruited_2h_melee_unit_infantry = {
				phar_main_trait_reckless = 2, --[[Predisposed--]]
			},
			character_post_battle_release_generic = {
				phar_main_trait_merciful = 1,
				phar_main_trait_materialistic = 1,
			},
			character_sacked_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_being_lazy_in_owned_settlement_high_public_order = {
				phar_main_trait_respectful = 1,
				phar_main_trait_hesitant = 1,
			},
			character_being_lazy_in_owned_settlement_low_public_order = {
				phar_main_trait_irreverent = 1,
				phar_main_trait_hesitant = 1,
			},
			character_present_for_construction = {
				phar_main_trait_cultured = 1,
			},
			character_won_battle_cadmean_victory = {
				phar_main_trait_blunt = 1,
			},
			character_spent_turn_in_ambush_stance = {
				phar_main_trait_cowardly = 1,
				phar_main_trait_underhanded = 1,
			},
			character_spent_turns_in_march_stance = {
				phar_main_trait_ambitious = 1,
			},
			character_razed_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_executed_captives = {
				phar_main_trait_cruel = 2, --[[Predisposed--]]
			},
			character_fought_battle_far_from_capital = {
				phar_main_trait_individualistic = 1,
			},
			character_reinforces_other_armies = {
				phar_main_trait_cooperative = 1,
			},
			character_beeing_reinforced = {
				phar_main_trait_cooperative = 1,
			},
			character_spent_turn_in_enemy_region = {
				phar_main_trait_confident = 2, --[[Predisposed--]]
			},
			character_spent_turns_in_raiding_stance = {
				phar_main_trait_blunt = 1,
			},
			character_won_defensive_battle = {
				phar_main_trait_hesitant = 1,
			},
			character_won_battle = {
				phar_sea_trait_iolas = 2,--[[Special Trait--]]
			},
		},
	},

	--AGAMEMNON--
	[11] = {
		background_trait_key = "phar_map_background_agamemnon",
		faction = "troy_main_dan_mycenae",
		events = {

			character_recruited_1h_melee_unit_spears = {
				phar_main_trait_cautious = 1,
			},
			character_bodyguard_suffered_casualties_low = {
				phar_main_trait_cautious = 1,
				phar_main_trait_brave = 1,
			},
			character_recruited_khopeshi = {
				phar_main_trait_brave = 1,
			},
			character_recruited_swordmen = {
				phar_main_trait_brave = 1,
			},
			character_sacks_or_razes_ers_shrine = {
				phar_main_trait_underhanded = 1,
				phar_main_trait_barbaric = 1,
			},
			character_spent_turns_in_encamp_stance = {
				phar_main_trait_content = 1,
			},
			character_suffered_attrition = {
				phar_main_trait_ambitious = 2, --[[Predisposed--]]
			},
			character_interacted_with_non_shrine_ers = {
				phar_main_trait_materialistic = 1,
			},
			character_prayed_at_ers = {
				phar_main_trait_spiritual = 1, 
			},
			character_ends_turn_in_region_with_construction_shrine_building = {
				phar_main_trait_spiritual = 1, 
			},
			character_fought_alone = {
				phar_main_trait_individualistic = 2, --[[Predisposed--]]
			},
			character_bodyguard_suffered_casualties_high = {
				phar_main_trait_reckless = 1,  
			},
			character_recruited_2h_melee_unit_infantry = {
				phar_main_trait_reckless = 1, 
			},
			character_post_battle_release_generic = {
				phar_main_trait_merciful = 1,
				phar_main_trait_materialistic = 1,
			},
			character_sacked_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_being_lazy_in_owned_settlement_high_public_order = {
				phar_main_trait_respectful = 1,
				phar_main_trait_hesitant = 1,
			},
			character_being_lazy_in_owned_settlement_low_public_order = {
				phar_main_trait_irreverent = 1,
				phar_main_trait_hesitant = 1,
			},
			character_present_for_construction = {
				phar_main_trait_cultured = 1,
			},
			character_won_battle_cadmean_victory = {
				phar_main_trait_blunt = 1,
			},
			character_spent_turn_in_ambush_stance = {
				phar_main_trait_cowardly = 1,
				phar_main_trait_underhanded = 1,
			},
			character_spent_turns_in_march_stance = {
				phar_main_trait_ambitious = 2, --[[Predisposed--]]
			},
			character_razed_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_executed_captives = {
				phar_main_trait_cruel = 2,  --[[Predisposed--]]
			},
			character_fought_battle_far_from_capital = {
				phar_main_trait_individualistic = 1, --[[Predisposed--]]
			},
			character_reinforces_other_armies = {
				phar_main_trait_cooperative = 1,
			},
			character_beeing_reinforced = {
				phar_main_trait_cooperative = 1,
			},
			character_spent_turn_in_enemy_region = {
				phar_main_trait_confident = 2,  --[[Predisposed--]]
			},
			character_spent_turns_in_raiding_stance = {
				phar_main_trait_blunt = 1,
			},
			character_won_defensive_battle = {
				phar_main_trait_hesitant = 1,
			},
		},
	},

	--PRIAM--
	[12] = {
		background_trait_key = "phar_map_background_priam",
		faction = "troy_main_trj_troy",
		events = {

			character_recruited_1h_melee_unit_spears = {
				phar_main_trait_cautious = 1,
			},
			character_bodyguard_suffered_casualties_low = {
				phar_main_trait_cautious = 1,
				phar_main_trait_brave = 1,
			},
			character_recruited_khopeshi = {
				phar_main_trait_brave = 1,
			},
			character_recruited_swordmen = {
				phar_main_trait_brave = 1,
			},
			character_sacks_or_razes_ers_shrine = {
				phar_main_trait_underhanded = 1,
				phar_main_trait_barbaric = 1,
			},
			character_spent_turns_in_encamp_stance = {
				phar_main_trait_content = 1,
			},
			character_suffered_attrition = {
				phar_main_trait_ambitious = 1,
			},
			character_interacted_with_non_shrine_ers = {
				phar_main_trait_materialistic = 1,
			},
			character_prayed_at_ers = {
				phar_main_trait_spiritual = 1, 
			},
			character_ends_turn_in_region_with_construction_shrine_building = {
				phar_main_trait_spiritual = 1, 
			},
			character_fought_alone = {
				phar_main_trait_individualistic = 1,
			},
			character_bodyguard_suffered_casualties_high = {
				phar_main_trait_reckless = 1,  
			},
			character_recruited_2h_melee_unit_infantry = {
				phar_main_trait_reckless = 1, 
			},
			character_post_battle_release_generic = {
				phar_main_trait_merciful = 2, --[[Predisposed--]]
				phar_main_trait_materialistic = 1,
			},
			character_sacked_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_being_lazy_in_owned_settlement_high_public_order = {
				phar_main_trait_respectful = 2, --[[Predisposed--]]
				phar_main_trait_hesitant = 1,
			},
			character_being_lazy_in_owned_settlement_low_public_order = {
				phar_main_trait_irreverent = 1,
				phar_main_trait_hesitant = 1,
			},
			character_present_for_construction = {
				phar_main_trait_cultured = 1, --[[Predisposed--]]
			},
			character_won_battle_cadmean_victory = {
				phar_main_trait_blunt = 1,
			},
			character_spent_turn_in_ambush_stance = {
				phar_main_trait_cowardly = 1,
				phar_main_trait_underhanded = 1,
			},
			character_spent_turns_in_march_stance = {
				phar_main_trait_ambitious = 1,
			},
			character_razed_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_executed_captives = {
				phar_main_trait_cruel = 1, 
			},
			character_fought_battle_far_from_capital = {
				phar_main_trait_individualistic = 1,
			},
			character_reinforces_other_armies = {
				phar_main_trait_cooperative = 2, --[[Predisposed--]]
			},
			character_beeing_reinforced = {
				phar_main_trait_cooperative = 2, --[[Predisposed--]]
			},
			character_spent_turn_in_enemy_region = {
				phar_main_trait_confident = 2, 
			},
			character_spent_turns_in_raiding_stance = {
				phar_main_trait_blunt = 1,
			},
			character_won_defensive_battle = {
				phar_main_trait_hesitant = 1,
			},
		},
	},

	--ADAD--
	[13] = {
		background_trait_key = "phar_map_background_adad",
		faction = "phar_map_babylon",
		events = {

			character_recruited_1h_melee_unit_spears = {
				phar_main_trait_cautious = 2, --[[Predisposed--]]
			},
			character_bodyguard_suffered_casualties_low = {
				phar_main_trait_cautious = 2, --[[Predisposed--]]
				phar_main_trait_brave = 1,
			},
			character_recruited_khopeshi = {
				phar_main_trait_brave = 1,
			},
			character_recruited_swordmen = {
				phar_main_trait_brave = 1,
			},
			character_sacks_or_razes_ers_shrine = {
				phar_main_trait_underhanded = 1,
				phar_main_trait_barbaric = 1,
			},
			character_spent_turns_in_encamp_stance = {
				phar_main_trait_content = 1,
			},
			character_suffered_attrition = {
				phar_main_trait_ambitious = 1,
			},
			character_interacted_with_non_shrine_ers = {
				phar_main_trait_materialistic = 1,
			},
			character_prayed_at_ers = {
				phar_main_trait_spiritual = 1, 
			},
			character_ends_turn_in_region_with_construction_shrine_building = {
				phar_main_trait_spiritual = 1, 
			},
			character_fought_alone = {
				phar_main_trait_individualistic = 1,
			},
			character_bodyguard_suffered_casualties_high = {
				phar_main_trait_reckless = 1,  
			},
			character_recruited_2h_melee_unit_infantry = {
				phar_main_trait_reckless = 1, 
			},
			character_post_battle_release_generic = {
				phar_main_trait_merciful = 1, 
				phar_main_trait_materialistic = 1,
			},
			character_sacked_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_being_lazy_in_owned_settlement_high_public_order = {
				phar_main_trait_respectful = 1,
				phar_main_trait_hesitant = 1,
			},
			character_being_lazy_in_owned_settlement_low_public_order = {
				phar_main_trait_irreverent = 1,
				phar_main_trait_hesitant = 1,
			},
			character_present_for_construction = {
				phar_main_trait_cultured = 2, --[[Predisposed--]]
			},
			character_won_battle_cadmean_victory = {
				phar_main_trait_blunt = 2, --[[Predisposed--]]
			},
			character_spent_turn_in_ambush_stance = {
				phar_main_trait_cowardly = 1,
				phar_main_trait_underhanded = 1,
			},
			character_spent_turns_in_march_stance = {
				phar_main_trait_ambitious = 1,
			},
			character_razed_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_executed_captives = {
				phar_main_trait_cruel = 1, 
			},
			character_fought_battle_far_from_capital = {
				phar_main_trait_individualistic = 1,
			},
			character_reinforces_other_armies = {
				phar_main_trait_cooperative = 1,
			},
			character_beeing_reinforced = {
				phar_main_trait_cooperative = 1,
			},
			character_spent_turn_in_enemy_region = {
				phar_main_trait_confident = 2,  --[[Predisposed--]]
			},
			character_spent_turns_in_raiding_stance = {
				phar_main_trait_blunt = 2, --[[Predisposed--]]
			},
			character_won_defensive_battle = {
				phar_main_trait_hesitant = 1,
			},
		},
	},

	--NINURTA--
	[14] = {
		background_trait_key = "phar_map_background_ninurta",
		faction = "phar_map_ninurta",
		events = {

			character_recruited_1h_melee_unit_spears = {
				phar_main_trait_cautious = 1,
			},
			character_bodyguard_suffered_casualties_low = {
				phar_main_trait_cautious = 1,
				phar_main_trait_brave = 2, --[[Predisposed--]]
			},
			character_recruited_khopeshi = {
				phar_main_trait_brave = 2, --[[Predisposed--]]
			},
			character_recruited_swordmen = {
				phar_main_trait_brave = 2, --[[Predisposed--]]
			},
			character_sacks_or_razes_ers_shrine = {
				phar_main_trait_underhanded = 1,
				phar_main_trait_barbaric = 1,
			},
			character_spent_turns_in_encamp_stance = {
				phar_main_trait_content = 1,
			},
			character_suffered_attrition = {
				phar_main_trait_ambitious = 2, --[[Predisposed--]]
			},
			character_interacted_with_non_shrine_ers = {
				phar_main_trait_materialistic = 1,
			},
			character_prayed_at_ers = {
				phar_main_trait_spiritual = 1, 
			},
			character_ends_turn_in_region_with_construction_shrine_building = {
				phar_main_trait_spiritual = 1, 
			},
			character_fought_alone = {
				phar_main_trait_individualistic = 1,
			},
			character_bodyguard_suffered_casualties_high = {
				phar_main_trait_reckless = 2,   --[[Predisposed--]]
			},
			character_recruited_2h_melee_unit_infantry = {
				phar_main_trait_reckless = 2,  --[[Predisposed--]]
			},
			character_post_battle_release_generic = {
				phar_main_trait_merciful = 1,
				phar_main_trait_materialistic = 1,
			},
			character_sacked_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_being_lazy_in_owned_settlement_high_public_order = {
				phar_main_trait_respectful = 1,
				phar_main_trait_hesitant = 1,
			},
			character_being_lazy_in_owned_settlement_low_public_order = {
				phar_main_trait_irreverent = 1,
				phar_main_trait_hesitant = 1,
			},
			character_present_for_construction = {
				phar_main_trait_cultured = 1,
			},
			character_won_battle_cadmean_victory = {
				phar_main_trait_blunt = 1,
			},
			character_spent_turn_in_ambush_stance = {
				phar_main_trait_cowardly = 1,
				phar_main_trait_underhanded = 1,
			},
			character_spent_turns_in_march_stance = {
				phar_main_trait_ambitious = 2, --[[Predisposed--]]
			},
			character_razed_settlement = {
				phar_main_trait_barbaric = 1,
			},
			character_executed_captives = {
				phar_main_trait_cruel = 1, 
			},
			character_fought_battle_far_from_capital = {
				phar_main_trait_individualistic = 1,
			},
			character_reinforces_other_armies = {
				phar_main_trait_cooperative = 1,
			},
			character_beeing_reinforced = {
				phar_main_trait_cooperative = 1,
			},
			character_spent_turn_in_enemy_region = {
				phar_main_trait_confident = 2,  --[[Predisposed--]]
			},
			character_spent_turns_in_raiding_stance = {
				phar_main_trait_blunt = 1,
			},
			character_won_defensive_battle = {
				phar_main_trait_hesitant = 1,
			},
		},
	},
}

-- this table configures which events give which traits.
campaign_traits.config.traits_per_events = {
	character_recruited_1h_melee_unit_spears = {
		[1] = {trait = "phar_main_trait_cautious", points = 1},
	},
	character_bodyguard_suffered_casualties_low = {
		[1] = {trait = "phar_main_trait_cautious", points = 1},
		[2] = {trait = "phar_main_trait_brave", points = 1},
	},
	character_sacks_or_razes_ers_shrine = {
		[1] = {trait = "phar_main_trait_underhanded", points = 1},
		[2] = {trait = "phar_main_trait_barbaric", points = 1},
	},

	character_spent_turns_in_encamp_stance = {
		[1] = {trait = "phar_main_trait_content", points = 1},
	},
	character_suffered_attrition = {
		[1] = {trait = "phar_main_trait_ambitious", points = 1},
	},

	character_interacted_with_non_shrine_ers = {
		[1] = {trait = "phar_main_trait_materialistic", points = 1},
	},
	character_ends_turn_in_region_with_construction_shrine_building = {
		[1] = {trait = "phar_main_trait_spiritual", points = 1},
	},
	character_prayed_at_ers = {
		[1] = {trait = "phar_main_trait_spiritual", points = 1},
	},

	character_fought_alone = {
		[1] = {trait = "phar_main_trait_individualistic", points = 1},
	},

	character_bodyguard_suffered_casualties_high = {
		[1] = {trait = "phar_main_trait_reckless", points = 1},

	},
	character_recruited_2h_melee_unit_infantry = {
		[1] = {trait = "phar_main_trait_reckless", points = 1},
	},

	character_post_battle_release_generic = {
		[1] = {trait = "phar_main_trait_merciful", points = 1},
		[2] = {trait = "phar_main_trait_materialistic", points = 1},
	},

	character_sacked_settlement = {
		[1] = {trait = "phar_main_trait_barbaric", points = 1},
	},

	character_being_lazy_in_owned_settlement_high_public_order = {
		[1] = {trait = "phar_main_trait_respectful", points = 1},
	},

	character_being_lazy_in_owned_settlement_low_public_order = {
		[1] = {trait = "phar_main_trait_irreverent", points = 1},
	},

	character_present_for_construction = {
		[1] = {trait = "phar_main_trait_cultured", points = 1},
	},

	character_won_battle_cadmean_victory = {
		[1] = {trait = "phar_main_trait_blunt", points = 1},
	},


	character_spent_turn_in_ambush_stance = {
		[1] = {trait = "phar_main_trait_cowardly", points = 1},
		[2] = {trait = "phar_main_trait_underhanded", points = 1},
	},

	character_spent_turns_in_march_stance = {
		[1] = {trait = "phar_main_trait_ambitious", points = 1},
	},

	character_razed_settlement = {
		[1] = {trait = "phar_main_trait_barbaric", points = 1},
	},

	character_executed_captives = {
		[1] = {trait = "phar_main_trait_cruel", points = 1},
	},

	character_fought_battle_far_from_capital = {
		[1] = {trait = "phar_main_trait_individualistic", points = 1},
	},

	character_reinforces_other_armies = {
		[1] = {trait = "phar_main_trait_cooperative", points = 1},
	},
	character_beeing_reinforced = {
		[1] = {trait = "phar_main_trait_cooperative", points = 1},
	},

	character_spent_turn_in_enemy_region = {
		[1] = {trait = "phar_main_trait_confident", points = 1},
	},
	
	character_spent_turns_in_raiding_stance = {
		[1] = {trait = "phar_main_trait_blunt", points = 1},
	},

	character_won_defensive_battle = {
		[1] = {trait = "phar_main_trait_hesitant", points = 1},
	},

	--[[character_did_not_fight_battles = {
		[1] = {trait = "phar_main_trait_hesitant", points = 1},
	},--]]

	character_recruited_khopeshi={
		[1] = {trait = "phar_main_trait_brave", points = 1},
	},

	character_recruited_swordmen = {
		[1] = {trait = "phar_main_trait_brave", points = 1},
	},


	character_won_battle = {
		[1] = {trait = "phar_main_trait_amenmesse", points = 0},
		[2] = {trait = "phar_main_trait_ramesses", points = 0},
		[3] = {trait = "phar_main_trait_tausret", points = 0},
		[4] = {trait = "phar_main_trait_bay", points = 0},
		[5] = {trait = "phar_main_trait_kurunta", points = 0},
		[6] = {trait = "phar_main_trait_irsu", points = 0},
		[7] = {trait = "phar_main_trait_suppiluliuma", points = 0},
		[8] = {trait = "phar_main_trait_seti", points = 0},
		[9] = {trait = "phar_sea_trait_iolas", points = 0},
		[10] = {trait = "phar_sea_trait_walwetes", points = 0},
	},

	character_won_battle_sea = {
		[1] = {trait = "phar_sea_special_sea_wolf", points = 1},
	},
	character_sacks_or_razes_port_settlement = {
		[1] = {trait = "phar_sea_special_colonizer", points = 1},
		[2] = {trait = "phar_sea_special_coastal_predator", points = 1},

	},
	character_won_battle_sea_region_ports = {
		[1] = {trait = "phar_sea_special_coastal_ambusher", points = 1},
	},



	--[[character_battle_completed_lost_siege_battle = {
		[1] = {trait = "phar_main_trait_respectful", points = 1},
		[1] = {trait = "phar_main_trait_hesitant", points = 1},
	},

	character_ends_turn_in_region_with_construction_primary_slot = {
		[1] = {trait = "phar_main_trait_respectful", points = 1},
		[3] = {trait = "phar_main_trait_cultured", points = 1},
	},

	character_ends_turn_in_region_with_construction_economy_building = {
		[1] = {trait = "phar_main_trait_materialistic", points = 1},
		[2] = {trait = "phar_main_trait_amenmesse", points = 0},
	},

	character_ends_turn_in_region_with_construction_military_building = {
		[1] = {trait = "phar_main_trait_cautious", points = 1},
		[2] = {trait = "phar_main_trait_ambitious", points = 1},
	},



	character_suffered_high_casualties_in_battle = {
		[1] = {trait = "phar_main_trait_ambitious", points = 1},
		[2] = {trait = "phar_main_trait_reckless", points = 1},
		[3] = {trait = "phar_main_trait_irreverent", points = 1},
	},

	character_routed_in_battle = {
		[1] = {trait = "phar_main_trait_individualistic", points = 1},
		[2] = {trait = "phar_main_trait_hesitant", points = 1},
		[3] = {trait = "phar_main_trait_cowardly", points = 1},
	},--]]

	--[[character_won_battle_decisive_victory = {
		[1] = {trait = "phar_main_trait_brave", points = 1},
		[2] = {trait = "phar_main_trait_confident", points = 1},
		[3] = {trait = "phar_main_trait_ramesses", points = 0},
	},

		character_post_battle_enslave_generic = {
		[1] = {trait = "phar_main_trait_cooperative", points = 1},
		[2] = {trait = "phar_main_trait_merciful", points = 1},
	},--]]
	
	
}

-- this table configures the traits allowed for civilian characters
campaign_traits.config.civilian_traits =
{
	"phar_main_trait_ambitious",
	"phar_main_trait_content",
	"phar_main_trait_barbaric",
	"phar_main_trait_cultured",
	"phar_main_trait_blunt",
	"phar_main_trait_underhanded",
	"phar_main_trait_brave",
	"phar_main_trait_cowardly",
	"phar_main_trait_cautious",
	"phar_main_trait_reckless",
	"phar_main_trait_confident",
	"phar_main_trait_hesitant",
	"phar_main_trait_content",
	"phar_main_trait_ambitious",
	"phar_main_trait_cooperative",
	"phar_main_trait_individualistic",
	"phar_main_trait_cowardly",
	"phar_main_trait_brave",
	"phar_main_trait_cruel",
	"phar_main_trait_merciful",
	"phar_main_trait_cultured",
	"phar_main_trait_barbaric",
	"phar_main_trait_hesitant",
	"phar_main_trait_confident",
	"phar_main_trait_individualistic",
	"phar_main_trait_cooperative",
	"phar_main_trait_irreverent",
	"phar_main_trait_respectful",
	"phar_main_trait_materialistic",
	"phar_main_trait_spiritual",
	"phar_main_trait_merciful",
	"phar_main_trait_cruel",
	"phar_main_trait_reckless",
	"phar_main_trait_cautious",
	"phar_main_trait_respectful",
	"phar_main_trait_irreverent",
	"phar_main_trait_spiritual",
	"phar_main_trait_materialistic",
	"phar_main_trait_underhanded",
	"phar_main_trait_blunt",
}

-- Setup startpos traits
core:add_listener(
	"phar_trait_new_campaign_started_listener",
	"FirstTickAfterNewCampaignStarted",
	true,
	function(context)
		if not campaign_traits.persistent.trait_data then
			campaign_traits.persistent.trait_data = {}
		end

		local world = cm:model():world()
		local factions = world:faction_list()

		for i = 0, factions:num_items() - 1 do
			local faction = factions:item_at(i)
			local characters = faction:character_list()

			for j = 0, characters:num_items() - 1 do
				local character = characters:item_at(j)

				if character:number_of_traits() > 0 then
					local save_data = campaign_traits.get_or_create_character_save_data(character:family_member():command_queue_index())

					local ui_traits = character:get_traits_for_ui()
					for _, trait in ipairs(ui_traits) do
						table.insert(save_data.traits, trait)
					end					
				end
			end
		end
	end,
	false
)

-- this table stores the event listenrs data
campaign_traits.config.trait_event_data = {
	{
		id = "character_sacks_or_razes_port_settlement",
		event = "CharacterPerformsSettlementOccupationDecision",
		filter = function(context)
			return table_find(campaign_traits.config.modifiable_event_params["character_raze_port_decision_key"], context:occupation_decision_option())
				and context:garrison_residence():settlement_interface():is_port()
		end,
		listener = function(context)
			campaign_traits.apply_traits("character_sacks_or_razes_port_settlement", context:character())
		end,
	},
	{
		id = "character_sacks_or_razes_ers_shrine",
		event = "CharacterPerformsRegionSlotOccupationDecisionBeforeOutcomeApplication",
		filter = function(context)
			if context:region_slot():building():is_null_interface() then
				return false
			end

			return table_find(campaign_traits.config.modifiable_event_params["character_shrine_occupation_allowed_options"], context:occupation_decision_option())
				and campaign_traits.check_if_region_slot_has_shrine(context:region_slot():building():chain())
		end,
		listener = function(context)
			campaign_traits.apply_traits("character_sacks_or_razes_ers_shrine", context:character())
		end,
	},

	{
		id = "character_recruited_khopeshi",
		event = "UnitTrained",
		filter = function(context)
			local unit = context:unit()
			return unit:belongs_to_unit_set(campaign_traits.config.modifiable_event_params["character_recruited_khopeshi"]) and not unit:force_commander():is_null_interface() and not unit:military_force():is_armed_citizenry()
		end,
		listener = function(context)
			campaign_traits.apply_traits("character_recruited_khopeshi", context:unit():force_commander())
		end,
	},

	{
		id = "character_recruited_swordmen",
		event = "UnitTrained",
		filter = function(context)
			local unit = context:unit()
			return unit:belongs_to_unit_set(campaign_traits.config.modifiable_event_params["character_recruited_swordmen"]) and not unit:force_commander():is_null_interface() and not unit:military_force():is_armed_citizenry()
		end,
		listener = function(context)
			campaign_traits.apply_traits("character_recruited_swordmen", context:unit():force_commander())
		end,
	},

	{
		id = "character_recruited_bowmen",
		event = "UnitTrained",
		filter = function(context)
			local unit = context:unit()
			return unit:belongs_to_unit_set(campaign_traits.config.modifiable_event_params["character_recruited_bowmen"]) and not unit:force_commander():is_null_interface() and not unit:military_force():is_armed_citizenry()
		end,
		listener = function(context)
			campaign_traits.apply_traits("character_recruited_bowmen", context:unit():force_commander())
		end,
	},

	{
		id = "character_recruited_chariots",
		event = "UnitTrained",
		filter = function(context)
			local unit = context:unit()
			return unit:belongs_to_unit_set(campaign_traits.config.modifiable_event_params["character_recruited_chariots"]) and not unit:force_commander():is_null_interface() and not unit:military_force():is_armed_citizenry()
		end,
		listener = function(context)
			campaign_traits.apply_traits("character_recruited_chariots", context:unit():force_commander())
		end,
	},

	{
		id = "character_recruited_1h_melee_unit_spears",
		event = "UnitTrained",
		filter = function(context)
			local unit = context:unit()
			return unit:belongs_to_unit_set(campaign_traits.config.modifiable_event_params["character_recruited_1h_melee_unit_spears"]) and not unit:force_commander():is_null_interface() and not unit:military_force():is_armed_citizenry()
		end,
		listener = function(context)
			campaign_traits.apply_traits("character_recruited_1h_melee_unit_spears", context:unit():force_commander())
		end,
	},

	{
		id = "character_recruited_2h_melee_unit_axes",
		event = "UnitTrained",
		filter = function(context)
			local unit = context:unit()
			return unit:belongs_to_unit_set(campaign_traits.config.modifiable_event_params["character_recruited_2h_melee_unit_axes"]) and not unit:force_commander():is_null_interface() and not unit:military_force():is_armed_citizenry()
		end,
		listener = function(context)
			campaign_traits.apply_traits("character_recruited_2h_melee_unit_axes", context:unit():force_commander())
		end,
	},

	{
		id = "character_recruited_2h_melee_unit_clubs",
		event = "UnitTrained",
		filter = function(context)
			local unit = context:unit()
			return unit:belongs_to_unit_set(campaign_traits.config.modifiable_event_params["character_recruited_2h_melee_unit_clubs"]) and not unit:force_commander():is_null_interface() and not unit:military_force():is_armed_citizenry()
		end,
		listener = function(context)
			campaign_traits.apply_traits("character_recruited_2h_melee_unit_clubs", context:unit():force_commander())
		end,
	},

	{
		id = "character_recruited_2h_melee_unit_spears",
		event = "UnitTrained",
		filter = function(context)
			local unit = context:unit()
			return unit:belongs_to_unit_set(campaign_traits.config.modifiable_event_params["character_recruited_2h_melee_unit_spears"]) and not unit:force_commander():is_null_interface() and not unit:military_force():is_armed_citizenry()
		end,
		listener = function(context)
			campaign_traits.apply_traits("character_recruited_2h_melee_unit_spears", context:unit():force_commander())
		end,
	},

	{
		id = "character_recruited_2h_melee_unit_infantry",
		event = "UnitTrained",
		filter = function(context)
			local unit = context:unit()
			return unit:belongs_to_unit_set(campaign_traits.config.modifiable_event_params["character_recruited_2h_melee_unit_infantry"]) and not unit:force_commander():is_null_interface() and not unit:military_force():is_armed_citizenry()
		end,
		listener = function(context)
			campaign_traits.apply_traits("character_recruited_2h_melee_unit_infantry", context:unit():force_commander())
		end,
	},

	{
		id = "character_prayed_at_ers",
		event = "CharacterPerformedSuccessfulAgentAction",
		filter = function(context)
			return string.find(context:unique_id(), "phar_ers_interaction_shrine_pray")
		end,
		listener = function(context)
			campaign_traits.apply_traits("character_prayed_at_ers", context:character())
		end,
	},

	{
		id = "character_interacted_with_non_shrine_ers",
		event = "CharacterPerformedSuccessfulAgentAction",
		filter = function(context)
			return  string.find(context:unique_id(), "phar_ers_interaction") and string.find(context:unique_id(), "phar_ers_interaction_shrine_pray") == nil
		end,
		listener = function(context)
			campaign_traits.apply_traits("character_interacted_with_non_shrine_ers", context:character())
		end,
	},

	{
		id = "character_post_battle_release_generic",
		event = "CharacterPostBattleRelease",
		listener = function(context)
			campaign_traits.apply_traits("character_post_battle_release_generic", context:character())
		end,
	},

	{
		id = "character_post_battle_enslave_generic",
		event = "CharacterPostBattleEnslave",
		listener = function(context)
			campaign_traits.apply_traits("character_post_battle_enslave_generic", context:character())
		end,
	},

	{
		id = "character_executed_captives",
		event = "CharacterPostBattleSlaughter",
		listener = function(context)
			campaign_traits.apply_traits("character_executed_captives", context:character())
		end,
	},

	{
		id = "character_sacked_settlement",
		event = "CharacterSackedSettlement",
		filter = function(context)
			return true
		end,
		listener = function(context)
			campaign_traits.apply_traits("character_sacked_settlement", context:character())
		end,
	},

	{
		id = "character_razed_settlement",
		event = "CharacterRazedSettlement",
		listener = function(context)
			campaign_traits.apply_traits("character_razed_settlement", context:character())
		end,
	},

	{
		id = "character_spent_turns_in_encamp_stance",
		event = "CharacterTurnEnd",
		listener = function(context)
			local character = context:character()
			local mil_force = context:character():military_force()

			if not mil_force:is_null_interface() and mil_force:active_stance() == "MILITARY_FORCE_ACTIVE_STANCE_TYPE_SET_CAMP" then
				campaign_traits.apply_traits("character_spent_turns_in_encamp_stance", character)
			end
		end,
	},

	{
		id = "character_spent_turn_in_ambush_stance",
		event = "CharacterTurnEnd",
		listener = function(context)
			local character = context:character()
			local mil_force = context:character():military_force()

			if not mil_force:is_null_interface() and mil_force:active_stance() == "MILITARY_FORCE_ACTIVE_STANCE_TYPE_AMBUSH" then
				campaign_traits.apply_traits("character_spent_turn_in_ambush_stance", context:character())
			end
		end,
	},

	{
		id = "character_spent_turns_in_raiding_stance",
		event = "CharacterTurnEnd",
		listener = function(context)
			local character = context:character()
			local mil_force = context:character():military_force()

			if not mil_force:is_null_interface() and mil_force:active_stance() == "MILITARY_FORCE_ACTIVE_STANCE_TYPE_LAND_RAID" then
				campaign_traits.apply_traits("character_spent_turns_in_raiding_stance", context:character())
			end
		end,
	},

	{
		id = "character_spent_turns_in_march_stance",
		event = "CharacterTurnEnd",
		filter = function(context)
			return true
		end,
		listener = function(context)
			local character = context:character()
			local mil_force = context:character():military_force()

			if not mil_force:is_null_interface() and mil_force:active_stance() == "MILITARY_FORCE_ACTIVE_STANCE_TYPE_MARCH" then
				campaign_traits.apply_traits("character_spent_turns_in_march_stance", context:character())
			end
		end,
	},

	{
		id = "character_spent_turn_recruiting",
		event = "CharacterTurnEnd",
		listener = function(context)
			local character = context:character()
			local mil_force = context:character():military_force()

			if not mil_force:is_null_interface() and mil_force:active_stance() == "MILITARY_FORCE_ACTIVE_STANCE_TYPE_MUSTER" then
				campaign_traits.apply_traits("character_spent_turn_recruiting", context:character())
			end
		end,
	},

	{
		id = "character_being_lazy_in_owned_settlement_high_public_order",
		event = "CharacterTurnStart",
		filter = function(context)
			return true
		end,
		listener = function(context)
			local character = context:character()
			local region = character:region()
			local high_public_order = campaign_traits.config.modifiable_event_params["character_being_lazy_in_owned_settlement_high_public_order"]
			if cm:char_is_general_with_army(character)
				and high_public_order
				and character:has_region()
				and region:public_order() >= high_public_order
				and region:owning_faction():name() == character:faction():name()
				and character:in_settlement() == true then
					campaign_traits.apply_traits("character_being_lazy_in_owned_settlement_high_public_order", context:character())
			end
		end,
	},

	{
		id = "character_being_lazy_in_owned_settlement_low_public_order",
		event = "CharacterTurnStart",
		filter = function(context)
			return true
		end,
		listener = function(context)
			local character = context:character()
			local region = character:region()
			local low_public_order = campaign_traits.config.modifiable_event_params["character_being_lazy_in_owned_settlement_low_public_order"]

			if cm:char_is_general_with_army(character)
				and low_public_order
				and character:has_region()
				and region:public_order() < low_public_order
				and region:owning_faction():name() == character:faction():name()
				and character:in_settlement() == true then
					campaign_traits.apply_traits("character_being_lazy_in_owned_settlement_low_public_order", context:character())
			end
		end,
	},

	{
		id = "character_spent_turn_in_region_with_low_influence",
		event = "CharacterTurnEnd",
		listener = function(context)
			local character = context:character()
			local low_influence = campaign_traits.config.modifiable_event_params["character_spent_turn_in_region_with_low_influence"]
			local religion = context:character():faction():state_religion()

			if cm:char_is_general_with_army(character)
				and not character:region():is_null_interface()
				and low_influence
				and character:has_region()
				and character:region():religion_proportion(religion) < low_influence then
					campaign_traits.apply_traits("character_spent_turn_in_region_with_low_influence", character)
			end
		end,
	},

	{
		id = "character_spent_turn_in_region_with_high_influence",
		event = "CharacterTurnEnd",
		listener = function(context)
			local character = context:character()
			local high_influnce = campaign_traits.config.modifiable_event_params["character_spent_turn_in_region_with_high_influence"]
			local religion = context:character():faction():state_religion()

			if cm:char_is_general_with_army(character)
				and not character:region():is_null_interface()
				and high_influnce
				and character:has_region()
				and character:region():religion_proportion(religion) > high_influnce then
					campaign_traits.apply_traits("character_spent_turn_in_region_with_high_influence", character)
			end
		end,
	},

	{
		id = "character_spent_turn_in_enemy_region",
		event = "CharacterTurnEnd",
		listener = function(context)
			local character = context:character()
			if character:faction():is_allowed_to_capture_territory() then
				if cm:char_is_general_with_army(character) and character:has_region() and not character:region():is_abandoned() then
					if character:faction():name() ~= character:region():owning_faction():name() then
						campaign_traits.apply_traits("character_spent_turn_in_enemy_region", context:character())
					end
				end
			end
		end,
	},

	{
		id = "character_battle_completed_lost_siege_battle",
		event = "BattleConflictFinished",
		filter = function(context)
			local battle = context:pending_battle()
			if battle:siege_battle() then
				return true
			end
			return false
		end,
		listener = function(context)
			local battle = context:pending_battle()
			local attacker = battle:attacker()
			local defender = battle:defender()

			if not attacker:is_null_interface() and not attacker:won_battle() then
				campaign_traits.apply_traits("character_battle_completed_lost_siege_battle", attacker)
			end

			if not defender:is_null_interface() and not defender:won_battle() then
				campaign_traits.apply_traits("character_battle_completed_lost_siege_battle", defender)
			end
		end,
	},

	{
		id = "character_suffered_high_casualties_in_battle",
		event = "BattleConflictFinished",
		listener = function(context)
			local battle = context:pending_battle()
			local attacker = battle:attacker()
			local defender = battle:defender()
			local loss_percent = campaign_traits.config.modifiable_event_params["character_suffered_high_casualties_in_battle"]

			if not attacker:is_null_interface() and cm:char_is_general_with_army(attacker) then
				local losses = attacker:percentage_of_own_alliance_killed()
				if loss_percent and losses >= loss_percent then
					campaign_traits.apply_traits("character_suffered_high_casualties_in_battle", attacker)
				end
			end
			if not defender:is_null_interface() and cm:char_is_general_with_army(defender) then
				local losses = defender:percentage_of_own_alliance_killed()
				if loss_percent and losses >= loss_percent then
					campaign_traits.apply_traits("character_suffered_high_casualties_in_battle", defender)
				end
			end
		end,
	},

	{
		id = "character_bodyguard_suffered_casualties",
		event = "BattleConflictFinished",
		listener = function(context)
			local battle = context:pending_battle()
			local attacker = battle:attacker()
			local defender = battle:defender()

			local check_side = function(character)
				if not character:is_null_interface() and cm:char_is_general_with_army(character) then
					local unit_list = character:military_force():unit_list()
					for i = 0, unit_list:num_items() - 1 do
						local unit = unit_list:item_at(i)
						if unit:belongs_to_unit_set(campaign_traits.config.modifiable_event_params["character_bodyguard_unit_set"]) then
							local casualties_percent = 100 - unit:percentage_proportion_of_full_strength()
							local percent_loss_trigger_high = campaign_traits.config.modifiable_event_params["character_bodyguard_suffered_casualties_high"]
							local percent_loss_trigger_low = campaign_traits.config.modifiable_event_params["character_bodyguard_suffered_casualties_low"]
							if casualties_percent > percent_loss_trigger_high then
								campaign_traits.apply_traits("character_bodyguard_suffered_casualties_high", character)
							end
							if casualties_percent < percent_loss_trigger_low then
								campaign_traits.apply_traits("character_bodyguard_suffered_casualties_low", character)
							end
						end
					end
				end
			end

			check_side(attacker)
			check_side(defender)
		end,
	},

	{
		id = "character_defeated_in_defensive_battle",
		event = "BattleConflictFinished",
		listener = function(context)
			local battle = context:pending_battle()
			local defender = battle:defender()

			if not defender:is_null_interface() and not defender:won_battle() then
				campaign_traits.apply_traits("character_defeated_in_defensive_battle", defender)
			end
		end,
	},

	{
		id = "character_won_defensive_battle",
		event = "BattleConflictFinished",
		filter = function(context)
			local battle = context:pending_battle()
			local defender = battle:defender()

			if not defender:is_null_interface() and defender:won_battle() then
				return true
			end
			return false
		end,
		listener = function(context)
			local battle = context:pending_battle()
			local defender = battle:defender()
			campaign_traits.apply_traits("character_won_defensive_battle", defender)
		end,
	},

	{
		id = "character_fought_battle_far_from_capital",
		event = "BattleConflictFinished",
		filter = function(context)
			return true
		end,
		listener = function(context)
			local battle = context:pending_battle()
			local attacker = battle:attacker()
			local defender = battle:defender()

			if attacker:faction():is_allowed_to_capture_territory() then
				if cm:char_is_general_with_army(attacker) and attacker:faction():has_home_region() then
					local home = attacker:faction():home_region():settlement()
					local distance = campaign_traits.config.modifiable_event_params["character_fought_battle_far_from_capital"]
					if distance and distance_squared(attacker:logical_position_x(), attacker:logical_position_y(), home:logical_position_x(), home:logical_position_y()) >= distance * distance then
						campaign_traits.apply_traits("character_fought_battle_far_from_capital", attacker)
					end
				end
			end

			if defender:faction():is_allowed_to_capture_territory() then
				if cm:char_is_general_with_army(defender) and defender:faction():has_home_region() then
					local home = defender:faction():home_region():settlement()
					local distance = campaign_traits.config.modifiable_event_params["character_fought_battle_far_from_capital"]
					if distance and distance_squared(defender:logical_position_x(), defender:logical_position_y(), home:logical_position_x(), home:logical_position_y()) >= distance * distance then
						campaign_traits.apply_traits("character_fought_battle_far_from_capital", defender)
					end
				end
			end
		end,
	},

	{
		id = "character_beeing_reinforced",
		event = "BattleConflictFinished",
		listener = function(context)
			local battle = context:pending_battle()
			--secodnary attackers
			local secondary_attackers = battle:secondary_attackers()
			if not secondary_attackers:is_empty() and not battle:attacker():is_null_interface() then
				campaign_traits.apply_traits("character_beeing_reinforced", battle:attacker())
			end
			-- secondary defenders
			local secondary_defenders = battle:secondary_defenders()
			if not secondary_defenders:is_empty() and not battle:defender():is_null_interface() then
				campaign_traits.apply_traits("character_beeing_reinforced", battle:defender())
			end
		end,
	},

	{
		id = "character_reinforces_other_armies",
		event = "BattleConflictFinished",
		listener = function(context)
			local battle = context:pending_battle()
			--secodnary attackers
			local secondary_attackers = battle:secondary_attackers()
			if not secondary_attackers:is_empty() then
				for i = 0, secondary_attackers:num_items() - 1 do
					local character = secondary_attackers:item_at(i)
					campaign_traits.apply_traits("character_reinforces_other_armies", character)
				end
			end
			-- secondary defenders
			local secondary_defenders = battle:secondary_defenders()
			if not secondary_defenders:is_empty() then
				for i = 0, secondary_defenders:num_items() - 1 do
					local character = secondary_defenders:item_at(i)
					campaign_traits.apply_traits("character_reinforces_other_armies", character)
				end
			end
		end,
	},

	{
		id = "character_fought_alone",
		event = "BattleConflictFinished",
		listener = function(context)
			local battle = context:pending_battle()
			--secodnary attackers
			local secondary_attackers = battle:secondary_attackers()
			if secondary_attackers:is_empty() then
				campaign_traits.apply_traits("character_fought_alone", battle:attacker())
			end

			-- secondary defenders
			local secondary_defenders = battle:secondary_defenders()
			if secondary_defenders:is_empty() then
				campaign_traits.apply_traits("character_fought_alone", battle:defender())
			end
		end,
	},

	{
		id = "character_routed_in_battle",
		event = "CharacterCompletedBattle",
		filter = function(context)
			return true
		end,
		listener = function(context)
			local character = context:character()

			if not character:is_null_interface() and character:routed_in_battle() then
				campaign_traits.apply_traits("character_routed_in_battle", character)
			end
		end,
	},

	-- character_did_not_fight_battles and character_did_not_fight_battles_turn_end work together.
	-- the actual trait trigger key is "character_did_not_fight_battles".
	--please refrain from using character_did_not_fight_battles_turn_end
	{
		id = "character_did_not_fight_battles",
		event = "CharacterTurnStart",
		filter = function(context)
			return cm:char_is_general_with_army(context:character())
		end,
		listener = function(context)
			local cqi = context:character():family_member():command_queue_index()
			local start_turn_battles =  context:character():battles_fought()
			campaign_traits.persistent.characters_battles_count[tostring(cqi)] = start_turn_battles
		end,
	},

	{
		id = "character_did_not_fight_battles_turn_end", -- not an actual trait key.
		event = "CharacterTurnEnd",
		filter = function(context)
			local char_fm = context:character():family_member()
			local saved_data = campaign_traits.persistent.characters_battles_count[tostring(char_fm:command_queue_index())]
			if saved_data then
				return true
			end
			return false
		end,
		listener = function(context)
			local char_fm = context:character():family_member()
			local saved_data = campaign_traits.persistent.characters_battles_count[tostring(char_fm:command_queue_index())]
			local saved_fm = cm:model():family_member_for_command_queue_index(char_fm:command_queue_index())
			if not saved_fm:character():is_null_interface() and saved_fm:character():battles_fought() == saved_data then
				campaign_traits.apply_traits("character_did_not_fight_battles", context:character())
				campaign_traits.persistent.characters_battles_count[tostring(char_fm:command_queue_index())] = nil
			end
		end,
	},

	{
		id = "character_suffered_attrition",
		event = "CharacterTurnEnd",
		listener = function(context)
			local character = context:character()
			local militry_force = character:military_force()
			if militry_force:is_null_interface() then
				return
			end

			if militry_force:will_suffer_any_attrition() then
				campaign_traits.apply_traits("character_suffered_attrition", character)
			end
		end,
	},

	{
		id = "character_won_battle",
		event = "BattleConflictFinished",
		listener = function(context)
			local battle = context:pending_battle()
			local attacker = battle:attacker()
			local defender = battle:defender()

			if not attacker:is_null_interface() and attacker:won_battle() then
				campaign_traits.apply_traits("character_won_battle", attacker)

				for i = 0, battle:secondary_attackers():num_items() - 1 do
					local char = battle:secondary_attackers():item_at(i)
					campaign_traits.apply_traits("character_won_battle", char)
				end
			end

			if not defender:is_null_interface() and defender:won_battle() then
				campaign_traits.apply_traits("character_won_battle", defender)
				for i = 0, battle:secondary_defenders():num_items() - 1 do
					local char = battle:secondary_defenders():item_at(i)
					campaign_traits.apply_traits("character_won_battle", char)
				end
			end
		end,
	},

	{
		id = "character_won_battle_sea",
		event = "BattleConflictFinished",
		listener = function(context)
			local battle = context:pending_battle()
			if battle:has_region() then -- sea battle dont have a region
				return
			end
			local attacker = battle:attacker()
			local defender = battle:defender()

			if not attacker:is_null_interface() and attacker:won_battle() and not attacker:sea_region():is_null_interface() then
				campaign_traits.apply_traits("character_won_battle_sea", attacker)

				for i = 0, battle:secondary_attackers():num_items() - 1 do
					local char = battle:secondary_attackers():item_at(i)
					campaign_traits.apply_traits("character_won_battle_sea", char)
				end
			end

			if not defender:is_null_interface() and defender:won_battle() and not attacker:sea_region():is_null_interface() then
				campaign_traits.apply_traits("character_won_battle_sea", defender)
				for i = 0, battle:secondary_defenders():num_items() - 1 do
					local char = battle:secondary_defenders():item_at(i)
					campaign_traits.apply_traits("character_won_battle_sea", char)
				end
			end
		end,
	},

	{
		id = "character_won_battle_sea_region_ports",
		event = "BattleConflictFinished",
		listener = function(context)
			local battle = context:pending_battle()

			if not battle:has_contested_garrison() then
				return
			end
			local garrison = battle:contested_garrison()
			if not garrison:is_settlement() then
				return
			end

			local is_port = garrison:settlement_interface():is_port()
			if not is_port then
				return
			end
			local attacker = battle:attacker()
			local defender = battle:defender()

			if not attacker:is_null_interface() and attacker:won_battle() then
				campaign_traits.apply_traits("character_won_battle_sea_region_ports", attacker)

				for i = 0, battle:secondary_attackers():num_items() - 1 do
					local char = battle:secondary_attackers():item_at(i)
					campaign_traits.apply_traits("character_won_battle_sea_region_ports", char)
				end
			end

			if not defender:is_null_interface() and defender:won_battle() then
				campaign_traits.apply_traits("character_won_battle_sea_region_ports", defender)
				for i = 0, battle:secondary_defenders():num_items() - 1 do
					local char = battle:secondary_defenders():item_at(i)
					campaign_traits.apply_traits("character_won_battle_sea_region_ports", char)
				end
			end
		end,
	},

	{
		id = "character_won_battle_decisive_victory",
		event = "BattleConflictFinished",
		listener = function(context)
			local battle = context:pending_battle()

			local attacker = battle:attacker()
			local defender = battle:defender()

			if not attacker:is_null_interface() and attacker:won_battle() and battle:attacker_battle_result() == "decisive_victory" then
				campaign_traits.apply_traits("character_won_battle_decisive_victory", attacker)
			end

			if not defender:is_null_interface() and defender:won_battle() and battle:defender_battle_result() == "decisive_victory" then
				campaign_traits.apply_traits("character_won_battle_decisive_victory", defender)
			end
		end,
	},

	{
		id = "character_won_battle_cadmean_victory",
		event = "BattleConflictFinished",
		listener = function(context)
			local battle = context:pending_battle()
			local attacker = battle:attacker()
			local defender = battle:defender()

			if not attacker:is_null_interface() and attacker:won_battle() and battle:attacker_battle_result() == "pyrrhic_victory" then
				campaign_traits.apply_traits("character_won_battle_cadmean_victory", attacker)
			end

			if not defender:is_null_interface() and defender:won_battle() and battle:defender_battle_result() == "pyrrhic_victory" then
				campaign_traits.apply_traits("character_won_battle_cadmean_victory", defender)
			end
		end,
	},

	{
		id = "character_present_for_construction",
		event = "CharacterTurnEnd",
		filter = function(context)
			local character = context:character()
			if character:has_region() then
				local region = character:region()
				for i = 0, region:slot_list():num_items() - 1 do
					local slot = region:slot_list():item_at(i)
					if slot:is_there_construction() and not slot:is_infrastructure_slot() and slot:construction_building_level_record_name() ~= "" then
						return true
					end
				end
			end
			return false
		end,
		listener = function(context)
			campaign_traits.apply_traits("character_present_for_construction", context:character())
		end,
	},

	{
		id = "character_ends_turn_in_region_with_construction_primary_slot",
		event = "CharacterTurnEnd",
		filter = function(context)
			local character = context:character()
			if character:has_region() then
				local region = character:region()
				for i = 0, region:slot_list():num_items() - 1 do
					local slot = region:slot_list():item_at(i)
					if slot:is_there_construction() and slot:type() == "primary" then
						return true
					end
				end
			end
			return false
		end,
		listener = function(context)
			campaign_traits.apply_traits("character_ends_turn_in_region_with_construction_primary_slot", context:character())
		end,
	},

	{
		id = "character_ends_turn_in_region_with_construction_shrine_building",
		event = "CharacterTurnEnd",
		filter = function(context)
			local character = context:character()
			if character:has_region() then
				local region = character:region()
				for i = 0, region:slot_list():num_items() - 1 do
					local slot = region:slot_list():item_at(i)
					if slot:is_there_construction() and slot:construction_building_chain_superchain() == "phar_main_ers_shrine" then
						return true
					end
				end
			end
			return false
		end,
		listener = function(context)
			campaign_traits.apply_traits("character_ends_turn_in_region_with_construction_shrine_building", context:character())
		end,
	},

	{
		id = "character_ends_turn_in_region_with_construction_military_building",
		event = "CharacterTurnEnd",
		filter = function(context)
			local character = context:character()
			if character:has_region() then
				local region = character:region()
				for i = 0, region:slot_list():num_items() - 1 do
					local slot = region:slot_list():item_at(i)
					if slot:is_there_construction() and slot:construction_building_chain_category() == "military" then
						return true
					end
				end
			end
			return false
		end,
		listener = function(context)
			campaign_traits.apply_traits("character_ends_turn_in_region_with_construction_military_building", context:character())
		end,
	},

	{
		id = "character_ends_turn_in_region_with_construction_economy_building",
		event = "CharacterTurnEnd",
		filter = function(context)
			local character = context:character()
			if character:has_region() then
				local region = character:region()
				for i = 0, region:slot_list():num_items() - 1 do
					local slot = region:slot_list():item_at(i)
					if slot:is_there_construction() and slot:construction_building_chain_category() == "money" then
						return true
					end
				end
			end
			return false
		end,
		listener = function(context)
			campaign_traits.apply_traits("character_ends_turn_in_region_with_construction_economy_building", context:character())
		end,
	},

}


-- this table is autofilled by the script. it contains all the personality traits as a list.
campaign_traits.config.personality_trait_list = {

}

campaign_traits.get_character_side_in_last_battle = function(character)
	for i = 1, cm:pending_battle_cache_num_attackers() do
		local char_cqi = cm:pending_battle_cache_get_attacker(i)

		if char_cqi == character:command_queue_index() then
			return "Attacker"
		end
	end
	for i = 1, cm:pending_battle_cache_num_defenders() do
		local char_cqi = cm:pending_battle_cache_get_defender(i)

		if char_cqi == character:command_queue_index() then
			return "Defender"
		end
	end
	script_error("character " .. character:command_queue_index() .. " was neither defender or attacker in battle, something is wrong")
	return ""
end

campaign_traits.choose_background_trait_for_character_details = function(character_details, is_coming_of_age)
	local is_civilian_woman = character_details:is_civilian() and not character_details:is_male()
	local is_relative_or_civilian_woman = character_details:has_mother() or character_details:has_father() or is_coming_of_age or is_civilian_woman

	-- out("Choosing background trait for character " .. character_details:get_forename() .. " / " .. character_details:onscreen_name() .. " (is_coming_of_age: " .. tostring(is_coming_of_age) .. ", is_civilian_woman: " .. tostring(is_civilian_woman) .. ")")
	
	-- Filter out traits that are not applicable to the character
	local applicable_backgrounds = {}
	for _, trait in ipairs(campaign_traits.config.character_backgrounds) do
		if (not trait.is_household_background or is_civilian_woman) and (trait.use_when_coming_of_age or not is_relative_or_civilian_woman) then
			table.insert(applicable_backgrounds, trait)
		end
	end
	
	if is_string(campaign_traits.forced_background_trait) then
		out("Forcing background trait " .. campaign_traits.forced_background_trait .. " for character " .. character_details:get_forename())
		local background_trait_data = table_find(applicable_backgrounds, function(b) return b.background_trait_key == campaign_traits.forced_background_trait end)
		if background_trait_data then
			return campaign_traits.forced_background_trait
		else
			out("Forced background trait " .. campaign_traits.forced_background_trait .. " is not applicable to the character. Choosing a random background trait instead.")
		end
	end

	local choice = cm:model():random_int(1, #applicable_backgrounds)
	return applicable_backgrounds[choice].background_trait_key
end

campaign_traits.choose_background_trait_for_character = function(character, is_coming_of_age)
	return campaign_traits.choose_background_trait_for_character_details(character:character_details(), is_coming_of_age)
end

-- called in start_new_game_all_factions in troy_start.
campaign_traits.new_game_initialization = function()
	-- setup up faction_leader backgrounds
	for _, background in ipairs(campaign_traits.config.faction_leader_backgrounds) do
		local faction = cm:get_faction(background.faction)
		if faction then
			local faction_leader = faction:faction_leader()
			if not faction_leader:is_null_interface() then
				local char_str = cm:char_lookup_str(faction_leader:command_queue_index())
				cm:force_add_trait(char_str, background.background_trait_key, false, 1)
				out.traits("Added background trait " .. background.background_trait_key .. " to fation leader for " .. background.faction)
			end
		end
	end
end

-- called in start_game_all_factions in troy_start.
campaign_traits.start_background_trait_listeners = function()
	-- fill personality_trait_list
	for event, traits in pairs(campaign_traits.config.traits_per_events) do
		for _, trait in ipairs(traits) do
			if not campaign_traits.config.personality_trait_list[trait] then
				campaign_traits.config.personality_trait_list[trait] = true
			end
		end
	end

	if not campaign_traits.persistent.trait_data then
		campaign_traits.persistent.trait_data = {}
	end

	if not campaign_traits.persistent.characters_battles_count then
		campaign_traits.persistent.characters_battles_count = {}
	end

	core:add_listener(
		"phar_background_trait_new_char_in_pool_listener",
		"NewCharacterEnteredRecruitmentPool",
		true,
		function(context)
			local chosen_background_trait_key = campaign_traits.choose_background_trait_for_character_details(context:character_details())
			cm:add_trait_to_character_by_family_member(context:character_details():family_member():command_queue_index(), chosen_background_trait_key, false, 1)
			out.traits("NewCharacterEnteredRecruitmentPool " .. chosen_background_trait_key)
		end,
		true
	)

	core:add_listener(
		"phar_background_trait_NewCharacterRecruited_listener",
		"NewCharacterRecruited",
		function(context)
			return context:character():has_military_force()
		end,
		function(context)
			out.traits("NewCharacterRecruited " .. context:character():get_forename())
			local char_str = cm:char_lookup_str(context:character():command_queue_index())
			-- check if char has background. if not add one

			local trait, data = campaign_traits.get_background_trait_for_character_details(context:character():character_details())
			if not trait then
				local chosen_background_trait_key = campaign_traits.choose_background_trait_for_character(context:character())
				cm:force_add_trait(char_str, chosen_background_trait_key, false, 1)
			end
		end,
		true
	)
	
	core:add_listener(
		"phar_background_trait_FactionJoinsConfederation_listener",
		"FactionJoinsConfederation",
		true,
		function(context)
			local faction = context:confederation()
			local char_list = faction:character_list()
			for i = 0, char_list:num_items() - 1 do	
				local character = char_list:item_at(i)
				if character:character_type("general") or character:is_politician() then
					--out.traits("FactionJoinsConfederation - Character " .. character:get_forename())
					
					local char_str = cm:char_lookup_str(character:command_queue_index())
					-- check if char has background. if not add one

					local trait, data = campaign_traits.get_background_trait_for_character_details(character:character_details())
					if not trait then
						local chosen_background_trait_key = campaign_traits.choose_background_trait_for_character(character)
						cm:force_add_trait(char_str, chosen_background_trait_key, false, 1)
					end
				end
			end
		end,
		true
	)

	core:add_listener(
		"phar_background_trait_CharacterComesOfAge_listener",
		"CharacterComesOfAge",
		true,
		function(context)
			local character = context:character()
			if character:character_type("general") then
				out.traits("CharacterComesOfAge - Character " .. character:get_forename())
				local char_str = cm:char_lookup_str(character:command_queue_index())
				-- check if char has background. if not add one

				local trait, data = campaign_traits.get_background_trait_for_character_details(character:character_details())
				if not trait then
					local chosen_background_trait_key = campaign_traits.choose_background_trait_for_character(character, true)
					cm:force_add_trait(char_str, chosen_background_trait_key, false, 1)
					cm:set_script_state(character, "last_turn_character_received_trait", cm:model():turn_number()) -- to prevent the character from getting a new trait next turn
					out("CharacterComesOfAge - Added background trait " .. chosen_background_trait_key .. " to " .. character:get_forename())
				end
			end
		end,
		true
	)

	core:add_listener(
		"phar_background_trait_CommonerCreated_listener",
		"TemporaryCharacterDetailsForMarriageCreated",
		true,
		function(context)
			local character_details = context:character_details()
			if character_details:character_type("general") then
				out.traits("TemporaryCharacterDetailsForMarriageCreated - Character " .. character_details:get_forename())

				local trait, data = campaign_traits.get_background_trait_for_character_details(character_details)
				if not trait then
					local chosen_background_trait_key = campaign_traits.choose_background_trait_for_character_details(character_details)
					cm:add_trait_to_character_by_family_member(character_details:family_member():command_queue_index(), chosen_background_trait_key, false, 1)

					cm:set_script_state(character_details:family_member(), "last_turn_fm_received_trait", cm:model():turn_number()) -- to prevent the character from getting a new trait next turn if they got married and are no longer just a temporary character

					out("TemporaryCharacterDetailsForMarriageCreated - Added background trait " .. chosen_background_trait_key .. " to " .. character_details:get_forename())
				end
			end
		end,
		true
	)

	core:add_listener(
		"phar_background_trait_FactionTurnStart_listener",
		"FactionTurnStart",
		true,
		function(context)
			-- For all civilian characters, add a random personality trait every X years
			local faction = context:faction()
			local char_list = faction:character_list()
			local model = cm:model()
			local current_turn = model:turn_number()
			local civilian_traits_rounds = model:rounds_per_year() * campaign_traits.config.civilian_traits_years

			for i = 0, char_list:num_items() - 1 do	
				local character = char_list:item_at(i)
				if character:character_details():is_civilian() then
					local last_turn_character_received_trait = cm:get_float_script_state(character, "last_turn_character_received_trait") or 0
					local last_turn_fm_received_trait = cm:get_float_script_state(character:character_details():family_member(), "last_turn_fm_received_trait") or 0
					-- out("Civilian character " .. faction:name() .. "/" .. character:get_forename() .. ": last_turn_character_received_trait = " .. last_turn_character_received_trait .. ", last_turn_fm_received_trait = " .. last_turn_fm_received_trait .. ", turns to next trait = " .. civilian_traits_rounds - (current_turn - last_turn_character_received_trait))
					if current_turn - last_turn_character_received_trait >= civilian_traits_rounds and current_turn - last_turn_fm_received_trait >= civilian_traits_rounds then
						local char_str = cm:char_lookup_str(character:command_queue_index())

						-- Filter out traits already acquired by the character
						local save_data = campaign_traits.get_or_create_character_save_data(character:family_member():command_queue_index())
						if #save_data.traits < campaign_traits.config.max_num_traits then
							local available_traits = {}
							for _, trait_key in ipairs(campaign_traits.config.civilian_traits) do
								if not table_find(save_data.traits, trait_key) and not table_find(save_data.traits, cm:get_antitrait_for_trait(trait_key)) then
									table.insert(available_traits, trait_key)
								end
							end

							if #available_traits > 0 then
								local civilian_trait_key = available_traits[cm:model():random_int(1, #available_traits)]

								if is_string(campaign_traits.forced_civilian_trait) then
									out("Forcing civilian trait " .. campaign_traits.forced_civilian_trait .. " for " .. character:get_forename())
									if table_find(available_traits, campaign_traits.forced_civilian_trait) then
										civilian_trait_key = campaign_traits.forced_civilian_trait
									else
										out("FactionTurnStart for civilian characters - Forced civilian trait " .. campaign_traits.forced_civilian_trait .. " is not available for the character. Choosing a random trait instead.")
									end
								end

								cm:force_add_trait_level(char_str, civilian_trait_key, false, 0)
								-- out("FactionTurnStart for civilian characters - Added personality trait " .. civilian_trait_key .. " to " .. character:get_forename())
								cm:set_script_state(character, "last_turn_character_received_trait", current_turn)
							else
								out("FactionTurnStart for civilian characters - No available traits for " .. character:get_forename())
							end
						end
					end
				end
			end
		end,
		true
	)

	core:add_listener(
		"phar_trait_character_trait_changed_listener",
		"CharacterTraitsChanged",
		true,
		function(context)
			local character = context:character()
			local save_data = campaign_traits.get_or_create_character_save_data(character:family_member():command_queue_index())

			-- Once we reach the trait limit, we lock the save_data.traits array.
			if #save_data.traits >= campaign_traits.config.max_num_traits then
				return
			end

			local update_trait_data = function(trait_key)
				local new_trait_acquired = false
				local antitrait_key = cm:get_antitrait_for_trait(trait_key) or ""

				local is_trait_pair_acquired = character:has_display_trait(trait_key) or character:has_display_trait(antitrait_key)
				if is_trait_pair_acquired then
					local was_trait_pair_already_acquired = table_find(save_data.traits, trait_key) or table_find(save_data.traits, antitrait_key)
					if not was_trait_pair_already_acquired then
						table.insert(save_data.traits, trait_key)
						new_trait_acquired = true
					end
				else
					table_erase(save_data.traits, trait_key)
					table_erase(save_data.traits, antitrait_key)
				end

				return new_trait_acquired
			end

			local trait_added = context:trait_added()
			local trait_removed = context:trait_removed()

			-- context:level_changed() indicates the trait in the event. If that was an antitrait of an already acquired trait and we just lost the acquired trait due to adding enough antitrait points,
			-- level_changed() will still be false because for this trait the level didn't change, it changed for its antitrait. Rework this event in C++ side if it hits performance, although it shouldn't hit performance because save_data.traits is of max size 6
			if save_data --[[and context:level_changed()--]] and (trait_added ~= "" or trait_removed ~= "") then
				local trait_key = trait_added ~= "" and trait_added or trait_removed
				local new_trait_acquired = update_trait_data(trait_key)

				if new_trait_acquired and #save_data.traits >= campaign_traits.config.trait_reset_treshold then
						cm:reset_not_received_traits_progress(cm:char_lookup_str(character:command_queue_index()))
					end
				end
		end,
		true
	)

	core:add_listener(
		"phar_traits_update_predisposed_traits_character_panel_listener",
		"PanelOpenedCampaign",
		function(context)
			return context.string == "character_details_panel"
		end,
		function(context)
			local panel = UIComponent(context.component)

			local setup_character_traits = function()
				local char_cqi = panel:InterfaceFunction("GetCharacterCQI")
				if char_cqi then
					local predisposed_traits = {}
					local character = cm:get_character_by_cqi(char_cqi)
					local _, trait_data = campaign_traits.get_background_trait_for_character_details(character:character_details())
					
					if trait_data ~= nil then
						for event, event_traits in pairs(trait_data.events) do
							for trait, value in pairs(event_traits) do
								if value > 1 then
									table.insert(predisposed_traits, trait)
								end
							end
						end
					else
						script_error("ERROR: Failed to find a background trait for character with CQI" .. char_cqi)
					end
	
	
					local acquired_traits_section = panel:SequentialFind("acquired_traits_section")
					acquired_traits_section:InterfaceFunction("set_max_trait_count", campaign_traits.config.max_num_traits)
					acquired_traits_section:InterfaceFunction("set_predisposed_traits", unpack(predisposed_traits))
	
					local unacquired_traits_section = panel:SequentialFind("unacquired_traits_section")
					unacquired_traits_section:InterfaceFunction("set_predisposed_traits", unpack(predisposed_traits))
	
					local save_data = campaign_traits.get_character_save_data(character:family_member():command_queue_index())
					if save_data then
						unacquired_traits_section:InterfaceFunction("set_already_acquired_traits", unpack(save_data.traits))
						acquired_traits_section:InterfaceFunction("set_already_acquired_traits", unpack(save_data.traits))
					end
	
					panel:InterfaceFunction("SetupCharacterTraits")
				end
			end

			setup_character_traits()

			core:add_listener(
				"phar_traits_update_predisposed_traits_character_panel_listener_cycle_left_or_right_lclickup",
				"ComponentLClickUp",
				function(context)
					return context.string == "button_cycle_left" or context.string == "button_cycle_right"
				end,
				function(context)
					cm:callback(setup_character_traits, 0.1)
				end,
				true,
				true
			)

			core:add_listener(
				"phar_traits_update_predisposed_traits_character_panel_listener_cycle_left_or_right_shortcutpressed",
				"ShortcutPressed",
				function(context)
					--out("ShortcutPressed event occurred, context.string is " .. context.string);
					return context.string == "select_prev" or context.string == "select_next"
				end,
				function(context)
					cm:callback(setup_character_traits, 0.1)
				end,
				true,
				true
			)

			core:add_listener(
				"phar_traits_update_predisposed_traits_character_panel_listener_close_panel",
				"PanelClosedCampaign",
				function(context)
					return context.string == "character_details_panel"
				end,
				function(context)
					core:remove_listener("phar_traits_update_predisposed_traits_character_panel_listener_cycle_left_or_right_lclickup")
					core:remove_listener("phar_traits_update_predisposed_traits_character_panel_listener_cycle_left_or_right_shortcutpressed")
				end,
				false,
				true
			)
		end,
		true
	)
end

campaign_traits.check_if_region_slot_has_shrine = function(building_chain)
	for idx, data in ipairs(deities.gods) do
		local shrine_chain = deities.get_god_shrine_chain(data.key)
		if shrine_chain == building_chain then
			return true
		end
	end
	return false
end

campaign_traits.get_character_save_data = function(fm_cqi)
	for _, trait_data in ipairs(campaign_traits.persistent.trait_data) do
		if fm_cqi == trait_data.fm_cqi then
			return trait_data
		end
	end
end

campaign_traits.get_or_create_character_save_data = function(fm_cqi)
	local save_data = campaign_traits.get_character_save_data(fm_cqi)
	if not save_data then
		save_data = {
			fm_cqi = fm_cqi,
			traits = {}
		}
		table.insert(campaign_traits.persistent.trait_data, save_data)
	end
	return save_data
end

campaign_traits.apply_traits = function(event, character)
	if not cm:char_is_general_with_army(character) then
		return
	end

	out.traits("Applying traits for event " .. event)
	local traits = campaign_traits.config.traits_per_events[event]
	if not traits then
		out.traits("Trait event " .. event .. " has no traits. Please add some.")
		return
	end

	for _, trait_data in ipairs(traits) do
		local trait_restrictions = campaign_traits.config.trait_restrictions[trait_data.trait]

		-- if restriction are present
		if trait_restrictions and trait_restrictions.allowed_subcultures then
			local subculture = character:faction():subculture()
			found = table_find(trait_restrictions.allowed_subcultures, subculture)
			if found then
				campaign_traits.apply_trait_change(event, trait_data.trait, trait_data.points, character)
			end
		else
			campaign_traits.apply_trait_change(event, trait_data.trait, trait_data.points, character)
		end
	end
end

campaign_traits.apply_trait_change = function(event, trait, points_change, character)
	local _, background_trait = campaign_traits.get_background_trait_for_character_details(character:character_details())
	local points = points_change
	if background_trait and background_trait.events[event] and background_trait.events[event][trait] then
		points = points + background_trait.events[event][trait]
	end

	local char_str = "fm_cqi: " .. character:family_member():command_queue_index()
	out.traits("Adding trait " .. trait .. " with points " .. points)
	local save_data = campaign_traits.get_character_save_data(character:family_member():command_queue_index())

	if save_data then
		if #save_data.traits >= campaign_traits.config.max_num_traits then
			out.traits("Max num traits reached on " .. char_str)

			-- Once we reach the trait limit, we lock the save_data.traits array.
			-- The character can only gain points on the already acquired traits or antitraits.
			local antitrait_key = cm:get_antitrait_for_trait(trait) or ""
			if table_find(save_data.traits, trait) or table_find(save_data.traits, antitrait_key) then
				cm:add_trait_to_character_by_family_member(character:family_member():command_queue_index(), trait, true, points)
			end
		else
			cm:add_trait_to_character_by_family_member(character:family_member():command_queue_index(), trait, true, points)
		end
	else
		out.traits("No trait data for " .. char_str .. ". Creating...")
		local data = {
			fm_cqi = character:family_member():command_queue_index(),
			traits = {}
		}
		table.insert(campaign_traits.persistent.trait_data, data)
		cm:add_trait_to_character_by_family_member(character:family_member():command_queue_index(), trait, true, points)
	end
end

campaign_traits.setup_phar_traits_listeners = function()
	for idx, event_data in ipairs(campaign_traits.config.trait_event_data) do
		if not is_string(event_data.event) or not is_function(event_data.listener) or not is_string(event_data.id) then
			script_error("ERROR: setup_phar_traits_listeners() called but provided ".. event_name .." as event name is not a string or its callback is not a function.")
			return
		end
		out.traits("Adding trait listener for " .. event_data.id)
		core:add_listener(
			"phar_personality_traits_" .. event_data.id,
			event_data.event,
			function(context)
				if event_data.filter and is_function(event_data.filter) then
					return event_data.filter(context)
				end
				return true
			end,
			event_data.listener,
			true
		)
	end
end

-----------------------------------------------------------------------------------
-- Helper functions for the trait checks.
-----------------------------------------------------------------------------------

campaign_traits.get_background_trait_for_character_details = function(character_details)
	for _, trait_data in ipairs(campaign_traits.config.character_backgrounds) do
		if character_details:has_trait(trait_data.background_trait_key) then
			return trait_data.background_trait_key, trait_data
		end
	end

	for _, trait_data in ipairs(campaign_traits.config.faction_leader_backgrounds) do
		if character_details:has_trait(trait_data.background_trait_key) then
			return trait_data.background_trait_key, trait_data
		end
	end

	return nil, nil
end

campaign_traits.is_personality_trait = function(trait_key)
	if campaign_traits.config.personality_trait_list[trait_key] then
		return true
	end
	return false
end

cm:add_saving_game_callback(function(context)
	cm:save_named_value("PHAR_TRAITS_SAVE_DATA", campaign_traits.persistent, context)
end)
cm:add_loading_game_callback(function(context)
	campaign_traits.persistent = cm:load_named_value("PHAR_TRAITS_SAVE_DATA", campaign_traits.persistent, context)
end)

cm:add_first_tick_callback_new(
	function() 
		campaign_traits.new_game_initialization()
	end
)

cm:add_first_tick_callback(
	function()
		campaign_traits.start_background_trait_listeners()
		campaign_traits.setup_phar_traits_listeners()
	end
)

traits_cheats = {
	add_trait_points_faction_leader = function(target_faction_key, trait_key, points)
		local faction = cm:get_faction(target_faction_key)
		if faction then
			local faction_leader = faction:faction_leader()
			if not faction_leader:is_null_interface() then
				campaign_traits.apply_trait_change("character_executed_captives", trait_key, points, faction_leader)
			end
		end
	end,

	force_next_background_trait = function(background_trait_key)
		campaign_traits.forced_background_trait = background_trait_key
	end,

	force_next_civilian_trait = function(civilian_trait_key)
		campaign_traits.forced_civilian_trait = civilian_trait_key
	end,
}