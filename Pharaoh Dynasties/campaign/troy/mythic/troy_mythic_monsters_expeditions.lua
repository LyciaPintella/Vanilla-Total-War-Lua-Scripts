mythic_monsters_expeditions = {}

mythic_monsters_expeditions.unlock_turn = 15
mythic_monsters_expeditions.unlock_event_message = {
	title = "event_feed_strings_text_troy_mth_expedition_available_title",
	primary_detail = "event_feed_strings_text_troy_mth_expedition_available_primary_detail",
	secondary_detail = "event_feed_strings_text_troy_mth_expedition_available_secondary_detail",
	pic = 1223,
	show_immediately = true,

	faction_overrides = {
		troy_amazons_trj_hippolyta = {
			title = "event_feed_strings_text_troy_mth_expedition_started_title",
			primary_detail = "event_feed_strings_text_troy_mth_expedition_started_primary_detail",
			secondary_detail = "event_feed_strings_text_troy_mth_expedition_started_secondary_detail",
			pic = 2123,
		},
		troy_amazons_trj_penthesilea = {
			title = "event_feed_strings_text_troy_mth_expedition_started_title",
			primary_detail = "event_feed_strings_text_troy_mth_expedition_started_primary_detail",
			secondary_detail = "event_feed_strings_text_troy_mth_expedition_started_secondary_detail",
			pic = 2123,
		},
		troy_rem_horde_aethiopians = {
			title = "event_feed_strings_text_troy_mth_expedition_started_title",
			primary_detail = "event_feed_strings_text_troy_mth_expedition_started_primary_detail",
			secondary_detail = "event_feed_strings_text_troy_mth_expedition_started_secondary_detail",
			pic = 2127,
		},
	},
}

--[[
For each event message in the expedition, an optional member faction_overrides can be supplied. It is a list of factions (by faction key) of override parameters for the event if the event is for the given faction.
Note that for another_player_start_expedition_event_message and another_player_abandon_expedition_event_message, the key of the other human player's faction is used!
This way the following event parameters could be overriden: title, primary_detail, secondary_detail, pic
Example:
	faction_overrides = {
		troy_amazons_trj_hippolyta = {
			title = "event_feed_strings_text_troy_mth_expedition_started_title",
			primary_detail = "event_feed_strings_text_troy_mth_expedition_started_primary_detail",
			secondary_detail = "event_feed_strings_text_troy_mth_expedition_started_secondary_detail",
			pic = 1115,
		},
	},
--]]

mythic_monsters_expeditions.starting_army_units_min = 1
mythic_monsters_expeditions.starting_army_units_max = 9
mythic_monsters_expeditions.starting_army_restricted_units = { "troy_dlc2_warriors_of_artemis", }	-- Keys of units that are not allowed for selection for the expedition army.
mythic_monsters_expeditions.pooled_resource_factor_units = "troy_units"

--[[
Example for an expedition dilemma setup, an entry in the dilemmas table of a mythic monser:
{
	key = "troy_fm_achilles_enraged_1",	-- The dilemma key from the database
	faction_overrides_dilemma_key = {   -- Override table for the dilemma if you want to use a different text or picture. The choices must be the same.
		troy_main_dan_achilles = "troy_fm_achilles_enraged_1_2",
	}, 
	choices = {
		-- A list of the dilemma's choices, some of which might be variants of a single option. The dilemma should have between 2 and 4 options.
		{
			-- This specifies the option for which this choice is a variant of. The values should be between 1 and 4.
			-- The sublist of variants for a single option is iterated over and the first one that satisfies all prerequisites is chosen to be used.
			-- If none of the variants for a single option satisfy the prerequisites, the prerequisites of the last one are used to provide the restricted_display_text. 
			-- Note that every dilemma option should have at least one variant!
			variant_of_option = 4,

			-- A list of the choice's prerequisites, if any.
			-- Every prerequisite has an optional member negate, that if set to true would negate the prerequisite (i.e. a choice should not have been made).
			-- Every prerequisite has a mandatory member restricted_display_text that is an entry from the table campaign_payload_ui_details in the DB. It specifies the icon and tooltip text to be displayed when the prerequisite is not fulfilled.
			-- Note that the prerequisites are iterated in order of definition and the first one that fails would provide the icon and text to be displayed.
			prerequisites = 
			{
				-- An example for previous choice prerequisite. dilemma_index is the index of the previous dilemma, the choice for which is a prerequisite. choice is the index of the choice, a value between 1 and 4.
				{ made_choice = { dilemma_index = 1, choice = 1, }, negate = true, restricted_display_text = "dummy_troy_adi_ajax_renown_dilemma_1", },

				-- An example for having a particular unit in the expedition army.
				{ have_unit_key = "troy_trojan_militia", negate = false, restricted_display_text = "dummy_troy_adi_ajax_renown_dilemma_1", },

				-- An example for having a particular effect bundle for the expedition army.
				{ have_effect_bundle_key = "", negate = true, restricted_display_text = "dummy_troy_adi_ajax_renown_dilemma_2", },
			},

			-- An optional key for a followup incident, that would be triggered immediately after this choice has been chosen.
			followup_incident_key = "troy_fm_achilles_insulted_activated",
			faction_overrides_followup_incident_key = { -- override table for the followup incident if you want to use a different picture or text for a specific faction.
				troy_main_dan_achilles = "troy_fm_achilles_insulted_activated_2",
			},

			-- A list of the choice's outcomes, if any.
			-- Every outcome has an optional member display_text, that is an entry from the table campaign_payload_ui_details in the DB. If present would create a text display payload for the followup incident. Example: display_text = "dummy_troy_epic_mission_achilles_briseis_removed"
			-- Every outcome, except for effect bundle outcomes, has an optional member panel_text, that uses the standard localization lookup method. If present would add a text display to the choice visualization in the expedition panel. Example: panel_text = "campaign_payload_ui_details_description_dummy_troy_mth_exp_hydra_lost_hydra_egg"
			-- Every outcome, except for effect bundle outcomes, has an optional member panel_image. If present and panel_text is present, would add an image to the choice visualization in the expedition panel. Example: panel_image = "ui/campaign ui/effect_bundles/fx_icon_ancillary.png"
			-- Every effect bundle outcome is automatically added to the choice visualization in the expedition panel with a tooltip detailing it. A panel_text field is ignored for those.
			-- Note that for every outcome added to the choice visualization in the expedition panel, a gained/lost text component is prepended. It is controlled by the remove member or the sign of the health member of the outcome. Experience outcomes are always marked as gained.
			-- Any exceptions to the above rule are mentioned in their description.
			-- Note that the outcomes are iterated and executed in order of definition.
			outcomes = {
				-- An example for gaining/losing a trait (determined by the remove member). If it is gaining, optionally provide the amount of points to be gained (1 if not specified).
				{ trait_key = "troy_main_trait_wins_at_sea", remove = false, points = 10, },

				-- An example for gaining/losing an ancillary (determined by the remove member).
				{ ancillary_key = "troy_main_anc_armour_heavy_helmet", remove = true, },

				-- An example for gaining/losing an effect bundle (determined by the remove member).
				{ effect_bundle_key = "effect_bundle_captives_kill_post_battle", remove = false, },

				-- An example for gaining/losing a unit (determined by the remove member).
				{ unit_key = "troy_trojan_militia", units_amount = 2, remove = false, },

				-- An example for gaining/losing health for units (determined by the sign of the health member). The units chosen are the strongest/weakest of the army units, determined by the strength_order_ascending member.
				{ health = -0.3, units_amount = 2, strength_order_ascending = true, },

				-- An example for gaining experience levels for units. The units chosen are the strongest/weakest of the army units, determined by the strength_order_ascending member.
				{ experience_levels = 4, units_amount = 2, strength_order_descending = false, },

				-- An example for scheduling the expedition general to be permanently killed after a successful quest battle. It is not displayed in any way, except via panel_text.
				{ permanently_kill_expedition_general_after_quest_battle = true, },
			}
		},
		{},	-- This is the next choice, with structure identical to the one above.
	},
},
--]]

mythic_monsters_expeditions.turns_until_next_dilemma = 2

mythic_monsters_expeditions.post_quest_battle_expedition_force_effect_bundles = {
	{ key = "troy_mth_exp_bundle_army_returned", turns = 5, },
}

mythic_monsters_expeditions.monsters = 
{
	{
		key = "cerberus",
		quest_battle_mission_key = "troy_myth_cerberus",	-- NOTE: This is just a prefix for the per faction mission. The full key is <quest_battle_mission_key>_<faction_key>. See mythic_monsters_expeditions.get_mission_key_for_faction_key.
		quest_battle_set_piece_battle_key = "troy_myth_cerberus_battle",
		quest_battle_region_key = "troy_mth_qb_cerberus",
		quest_battle_loading_screen_key = "troy_mth_quest_battle_cerberus",

		starting_army_restricted_generals = {	-- An optional list of forenames of characters as localization strings. Example: names_name_121567699
			"names_name_995506757",	-- Patroclus
			"names_name_825358105",	-- Aegisthus
			"names_name_121567699",	-- Teucer
		},
		starting_army_restricted_general_tooltip = "troy_mth_cerberus_expedition_locked_hero",

		start_expedition_event_message = {
			title = "event_feed_strings_text_troy_mth_expedition_started_title",
			primary_detail = "event_feed_strings_text_troy_mth_expedition_started_primary_detail",
			secondary_detail = "event_feed_strings_text_troy_mth_expedition_started_secondary_detail",
			pic = 1115,
			show_immediately = true,
			
			faction_overrides = {
				troy_amazons_trj_hippolyta = {
					title = "event_feed_strings_text_troy_mth_expedition_started_title",
					primary_detail = "event_feed_strings_text_troy_mth_expedition_started_primary_detail",
					secondary_detail = "event_feed_strings_text_troy_mth_expedition_started_secondary_detail",
					pic = 2124,
					show_immediately = true,
				},
				troy_amazons_trj_penthesilea = {
					title = "event_feed_strings_text_troy_mth_expedition_started_title",
					primary_detail = "event_feed_strings_text_troy_mth_expedition_started_primary_detail",
					secondary_detail = "event_feed_strings_text_troy_mth_expedition_started_secondary_detail",
					pic = 2124,
					show_immediately = true,
				},
				troy_rem_horde_aethiopians = {
					title = "event_feed_strings_text_troy_mth_expedition_started_title",
					primary_detail = "event_feed_strings_text_troy_mth_expedition_started_primary_detail",
					secondary_detail = "event_feed_strings_text_troy_mth_expedition_started_secondary_detail",
					pic = 2128,
					show_immediately = true,
				},
			},
		},

		another_player_start_expedition_event_message = {
			title = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_title",
			primary_detail = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_primary_detail",
			secondary_detail = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_secondary_detail",
			pic = 1069,
			show_immediately = true,

			faction_overrides = {
				troy_amazons_trj_hippolyta = {
					title = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_title",
					primary_detail = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_primary_detail",
					secondary_detail = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_secondary_detail",
					pic = 2122,
					show_immediately = true,
				},
				troy_amazons_trj_penthesilea = {
					title = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_title",
					primary_detail = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_primary_detail",
					secondary_detail = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_secondary_detail",
					pic = 2122,
					show_immediately = true,
				},
				troy_rem_horde_aethiopians = {
					title = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_title",
					primary_detail = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_primary_detail",
					secondary_detail = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_secondary_detail",
					pic = 2126,
					show_immediately = true,
				},
			},
		},

		another_player_abandon_expedition_event_message = {
			title = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_title",
			primary_detail = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_primary_detail",
			secondary_detail = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_secondary_detail",
			pic = 1169,
			show_immediately = true,

			faction_overrides = {
				troy_amazons_trj_hippolyta = {
					title = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_title",
					primary_detail = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_primary_detail",
					secondary_detail = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_secondary_detail",
					pic = 2121,
					show_immediately = true,
				},
				troy_amazons_trj_penthesilea = {
					title = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_title",
					primary_detail = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_primary_detail",
					secondary_detail = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_secondary_detail",
					pic = 2121,
					show_immediately = true,
				},
				troy_rem_horde_aethiopians = {
					title = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_title",
					primary_detail = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_primary_detail",
					secondary_detail = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_secondary_detail",
					pic = 2125,
					show_immediately = true,
				},
			},
		},

		dilemmas = 
		{
			{		
				key = "troy_mth_exp_cerberus_step_1",
				choices = 
				{
					{
						variant_of_option = 1,
						prerequisites = 
						{
						},
						followup_incident_key = "troy_mth_exp_cerberus_step_1_choice_1_followup_incident",
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_cerberus_step_1_choice_1_outcome_eleusinian_initiates", remove = false, },
						},
					},
					{
						variant_of_option = 2,
						prerequisites = 
						{
						},
						followup_incident_key = "troy_mth_exp_cerberus_step_1_choice_2_followup_incident",
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_cerberus_step_1_choice_2_outcome_fatigued", remove = false, },
							{ health = -0.3, units_amount = 1, strength_order_ascending = false, display_text = "dummy_troy_mth_exp_lost_health", },
							{ experience_levels = 4, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},	
					},
					{
						variant_of_option = 3,
						prerequisites = 
						{
						},
						followup_incident_key = "troy_mth_exp_cerberus_step_1_choice_3_followup_incident",
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_cerberus_step_1_choice_3_outcome_eleusinian_feast", remove = false, },
							{ experience_levels = 1, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},
					},
					{
						variant_of_option = 4,
						prerequisites = 
						{
						},
						followup_incident_key = "troy_mth_exp_cerberus_step_1_choice_4_followup_incident",
						outcomes = 
						{
							{ unit_key = "troy_shielded_spearmen", units_amount = 2, remove = false, display_text = "dummy_troy_mth_exp_cerberus_gain_shielded_spearmen", },
						}
					},
				}
			},
			{
				key = "troy_mth_exp_cerberus_step_2",
				choices = 
				{
					{
						variant_of_option = 1,
						prerequisites = 
						{
						},
						followup_incident_key = "troy_mth_exp_cerberus_step_2_choice_1_followup_incident",
						faction_overrides_followup_incident_key = {
							troy_amazons_trj_hippolyta = "troy_mth_amazons_exp_cerberus_step_2_choice_1_followup_incident",
							troy_amazons_trj_penthesilea = "troy_mth_amazons_exp_cerberus_step_2_choice_1_followup_incident",
							troy_rem_horde_aethiopians = "troy_rem_memnon_exp_cerberus_step_2_choice_1_followup_incident",
						}, 
						outcomes = 
						{
							{ unit_key = "troy_mth_giant_2haxe", units_amount = 1, remove = false, display_text = "dummy_troy_mth_exp_cerberus_gain_giants", },
							{ unit_key = "troy_mth_giant_axe_bow", units_amount = 1, remove = false,},
							{ effect_bundle_key = "troy_mth_exp_cerberus_step_2_choice_1_wounded_giants", remove = false,},	
						},
					},
					{
						variant_of_option = 2,
						prerequisites = 
						{ 
						},
						followup_incident_key = "troy_mth_exp_cerberus_step_2_choice_2_followup_incident",
						outcomes = 
						{					
							{ effect_bundle_key = "troy_mth_exp_cerberus_step_1_choice_2_outcome_fatigued", remove = true, display_text = "dummy_troy_mth_exp_lost_negative_bundle" },
							{ effect_bundle_key = "troy_mth_exp_cerberus_step_2_choice_2_outcome_camping", remove = false,}, 
							{ experience_levels = 1, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
							
						},
					},
					{
						variant_of_option = 3,
						prerequisites = 
						{ 
						},
						followup_incident_key = "troy_mth_exp_cerberus_step_2_choice_3_followup_incident",
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_cerberus_step_2_choice_3_outcome_quality_weapons", remove = false,},
						},
					},
					{	
						variant_of_option = 4,
						prerequisites = 
						{
							{ made_choice = { dilemma_index = 1, choice = 1, }, negate = false, restricted_display_text = "dummy_troy_mth_exp_cerberus_step_1_choice_1_followup_incident_required",},
						},
						followup_incident_key = "troy_mth_exp_cerberus_step_2_choice_4_followup_incident",
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_cerberus_step_2_choice_4_outcome_peace_of_mind", remove = false,},	
							{ experience_levels = 1, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },	
						},
					},
				},
			},
			{		
				key = "troy_mth_exp_cerberus_step_3",
				choices = 
				{
					{
						variant_of_option = 1,
						prerequisites = 
						{
							{ made_choice = { dilemma_index = 2, choice = 1, }, negate = false, restricted_display_text = "dummy_troy_mth_exp_cerberus_step_2_choice_1_followup_incident_required", }
						},
						followup_incident_key = "troy_mth_exp_cerberus_step_3_choice_1_followup_incident",
						faction_overrides_followup_incident_key = {
							troy_amazons_trj_hippolyta = "troy_mth_amazons_exp_cerberus_step_3_choice_1_followup_incident",
							troy_amazons_trj_penthesilea = "troy_mth_amazons_exp_cerberus_step_3_choice_1_followup_incident",
							troy_rem_horde_aethiopians = "troy_rem_memnon_exp_cerberus_step_3_choice_1_followup_incident",
						}, 
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_cerberus_step_3_choice_1_outcome_gigantomachy", remove = false, },
							{ experience_levels = 2, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},
					},
					{
						variant_of_option = 2,
						prerequisites = 
						{
							{ made_choice = { dilemma_index = 1, choice = 1, }, negate = false, restricted_display_text = "dummy_troy_mth_exp_cerberus_step_1_choice_1_followup_incident_required", },
						},
						followup_incident_key = "troy_mth_exp_cerberus_step_3_choice_2_followup_incident",
						outcomes = 
						{
							{ ancillary_key = "troy_mth_anc_moly_flower", remove = false, display_text = "dummy_troy_mth_exp_cerberus_gained_moly_flower", panel_text = "campaign_payload_ui_details_description_dummy_troy_mth_exp_cerberus_gained_moly_flower", panel_image = "ui/campaign ui/effect_bundles/fx_icon_ancillary.png" },
							{ experience_levels = 2, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},
					},						
					{
						variant_of_option = 3,
						prerequisites = 
						{
							{ made_choice = { dilemma_index = 2, choice = 3, }, negate = false, restricted_display_text = "", }, -- this option has a universal variant without prerequisites, so this variant needs no restricted_display_text.
						},
						followup_incident_key = "troy_mth_exp_cerberus_step_3_choice_3_1_followup_incident",
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_cerberus_step_3_choice_3_1_outcome_cursed_by_shades", remove = false, },
							{ experience_levels = 1, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},
					},
					{
						variant_of_option = 3,
						prerequisites = 
						{
							{ made_choice = { dilemma_index = 2, choice = 4, }, negate = false, restricted_display_text = "", }, -- this option has a universal variant without prerequisites, so this variant needs no restricted_display_text.
						},
						followup_incident_key = "troy_mth_exp_cerberus_step_3_choice_3_2_followup_incident",
						faction_overrides_followup_incident_key = {
							troy_amazons_trj_hippolyta = "troy_mth_amazons_exp_cerberus_step_3_choice_3_2_followup_incident",
							troy_amazons_trj_penthesilea = "troy_mth_amazons_exp_cerberus_step_3_choice_3_2_followup_incident",
							troy_rem_horde_aethiopians = "troy_rem_memnon_exp_cerberus_step_3_choice_3_2_followup_incident",
						}, 
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_cerberus_step_2_choice_4_outcome_peace_of_mind", remove = true, },
							{ effect_bundle_key = "troy_mth_exp_cerberus_step_3_choice_3_2_outcome_gratitude_of_shades", remove = false, display_text = "dummy_troy_mth_exp_upgrade_bundle"},
							{ experience_levels = 2, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},
					},
					{	
						variant_of_option = 3,
						prerequisites = 
						{
						},
						followup_incident_key = "troy_mth_exp_cerberus_step_3_choice_3_3_followup_incident",
						outcomes =
						{
							{ effect_bundle_key = "troy_mth_exp_cerberus_step_3_choice_3_3_outcome_island_of_butterflies", remove = false, },
							{ experience_levels = 1, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},
					}	
				},
			},
			{		
				key = "troy_mth_exp_cerberus_step_4",
				faction_overrides_dilemma_key = {
					troy_amazons_trj_hippolyta = "troy_mth_amazons_exp_cerberus_step_4",
					troy_amazons_trj_penthesilea = "troy_mth_amazons_exp_cerberus_step_4",
					troy_rem_horde_aethiopians = "troy_rem_memnon_exp_cerberus_step_4",
				}, 
				choices = 
				{
					{
						variant_of_option = 1,
						prerequisites = 
						{
					
						},
						followup_incident_key = "troy_mth_exp_cerberus_step_4_choice_1_followup_incident",
						faction_overrides_followup_incident_key = {
							troy_amazons_trj_hippolyta = "troy_mth_amazons_exp_cerberus_step_4_choice_1_followup_incident",
							troy_amazons_trj_penthesilea = "troy_mth_amazons_exp_cerberus_step_4_choice_1_followup_incident",
							troy_rem_horde_aethiopians = "troy_rem_memnon_exp_cerberus_step_4_choice_1_followup_incident",
						}, 
						outcomes = 
						{
							{ health = -1, units_amount = 1, strength_order_ascending = true, display_text = "dummy_troy_mth_exp_cerberus_lose_two_weakest", },
							{ unit_key = "troy_mth_gen_myth_sirens", units_amount = 2, remove = false, display_text = "dummy_troy_mth_exp_cerberus_gain_sirens", },
							{ experience_levels = 2, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},
					},
					{
						variant_of_option = 2,
						prerequisites = 
						{
							{ made_choice = { dilemma_index = 3, choice = 2, }, negate = false, restricted_display_text = "dummy_troy_mth_exp_cerberus_step_3_choice_2_followup_incident_required", },
						},
						followup_incident_key = "troy_mth_exp_cerberus_step_4_choice_2_followup_incident",
						faction_overrides_followup_incident_key = {
							troy_amazons_trj_hippolyta = "troy_mth_amazons_exp_cerberus_step_4_choice_2_followup_incident",
							troy_amazons_trj_penthesilea = "troy_mth_amazons_exp_cerberus_step_4_choice_2_followup_incident",
							troy_rem_horde_aethiopians = "troy_rem_memnon_exp_cerberus_step_4_choice_2_followup_incident",
						}, 
						outcomes = 
						{
							{ ancillary_key = "troy_mth_anc_moly_flower", remove = true, display_text = "dummy_troy_mth_exp_cerberus_lost_moly_flower", panel_text = "campaign_payload_ui_details_description_dummy_troy_mth_exp_cerberus_lost_moly_flower", panel_image = "ui/campaign ui/effect_bundles/fx_icon_ancillary.png" },
							{ effect_bundle_key = "troy_mth_exp_cerberus_step_1_choice_2_outcome_fatigued", remove = true, display_text = "dummy_troy_mth_exp_lost_negative_bundle" },
							{ effect_bundle_key = "troy_mth_exp_cerberus_step_4_choice_2_outcome_blessing_of_circe", remove = false, },
							{ experience_levels = 3, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},
					},
					{
						variant_of_option = 3,
						prerequisites = 
						{
							{ made_choice = { dilemma_index = 1, choice = 1, }, negate = false, restricted_display_text = "dummy_troy_mth_exp_cerberus_step_1_choice_1_followup_incident_required", },
						},
						followup_incident_key = "troy_mth_exp_cerberus_step_4_choice_3_followup_incident",
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_cerberus_step_1_choice_2_outcome_fatigued", remove = true, display_text = "dummy_troy_mth_exp_lost_negative_bundle"},
							{ effect_bundle_key = "troy_mth_exp_cerberus_step_3_choice_3_1_outcome_cursed_by_shades", remove = true, },
							{ effect_bundle_key = "troy_mth_exp_cerberus_step_1_choice_1_outcome_eleusinian_initiates", remove = true, },
							{ effect_bundle_key = "troy_mth_exp_cerberus_step_4_choice_3_outcome_eleusinian_followers", remove = false, display_text = "dummy_troy_mth_exp_upgrade_bundle" },
						},
					},
					{	
						variant_of_option = 4,
						prerequisites = 
						{
						},
						followup_incident_key = "troy_mth_exp_cerberus_step_4_choice_4_followup_incident",
						faction_overrides_followup_incident_key = {
							troy_amazons_trj_hippolyta = "troy_mth_amazons_exp_cerberus_step_4_choice_4_followup_incident",
							troy_amazons_trj_penthesilea = "troy_mth_amazons_exp_cerberus_step_4_choice_4_followup_incident",
							troy_rem_horde_aethiopians = "troy_rem_memnon_exp_cerberus_step_4_choice_4_followup_incident",
						}, 
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_cerberus_step_4_choice_4_outcome_night_with_naiads", remove = false, },
							{ health = -0.3, units_amount = 1, strength_order_ascending = false, display_text = "dummy_troy_mth_exp_lost_health", },
							{ experience_levels = 2, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						}
					},
				}
			},
			{		
				key = "troy_mth_exp_cerberus_step_5",
				faction_overrides_dilemma_key = {
					troy_amazons_trj_hippolyta = "troy_mth_amazons_exp_cerberus_step_5",
					troy_amazons_trj_penthesilea = "troy_mth_amazons_exp_cerberus_step_5",
					troy_rem_horde_aethiopians = "troy_rem_memnon_exp_cerberus_step_5",
				}, 
				choices = 
				{
					{
						variant_of_option = 1,
						prerequisites = 
						{					
						},
						followup_incident_key = "troy_mth_exp_cerberus_step_5_choice_1_followup_incident",
						faction_overrides_followup_incident_key = {
							troy_amazons_trj_hippolyta = "troy_mth_amazons_exp_cerberus_step_5_choice_1_followup_incident",
							troy_amazons_trj_penthesilea = "troy_mth_amazons_exp_cerberus_step_5_choice_1_followup_incident",
							troy_rem_horde_aethiopians = "troy_rem_memnon_exp_cerberus_step_5_choice_1_followup_incident",
						}, 
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_cerberus_step_5_choice_1_outcome_final_destination", remove = false, },
							{ permanently_kill_expedition_general_after_quest_battle = true, },
						},
					},					
					{
						variant_of_option = 2,
						prerequisites = 
						{
							{ made_choice = { dilemma_index = 2, choice = 1, }, negate = false, restricted_display_text = "dummy_troy_mth_exp_cerberus_step_2_choice_1_followup_incident_required", },
						},
						followup_incident_key = "troy_mth_exp_cerberus_step_5_choice_2_followup_incident",
						faction_overrides_followup_incident_key = {
							troy_amazons_trj_hippolyta = "troy_mth_amazons_exp_cerberus_step_5_choice_2_followup_incident",
							troy_amazons_trj_penthesilea = "troy_mth_amazons_exp_cerberus_step_5_choice_2_followup_incident",
							troy_rem_horde_aethiopians = "troy_rem_memnon_exp_cerberus_step_5_choice_2_followup_incident",
						}, 
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_cerberus_step_5_choice_2_outcome_resolve", remove = false, },
							{ unit_key = "troy_mth_giant_2haxe", units_amount = 1, remove = true, },
							{ unit_key = "troy_mth_giant_axe_bow", units_amount = 1, remove = true, display_text = "dummy_troy_mth_exp_cerberus_lose_giants" },
							{ experience_levels = 4, units_amount = 2, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},
					},
					
					{
						variant_of_option = 3,
						prerequisites = 
						{
							{ made_choice = { dilemma_index = 4, choice = 3, }, negate = false, restricted_display_text = "dummy_troy_mth_exp_cerberus_step_4_choice_3_followup_incident_required", },
						},
						followup_incident_key = "troy_mth_exp_cerberus_step_5_choice_3_followup_incident",
						faction_overrides_followup_incident_key = {
							troy_amazons_trj_hippolyta = "troy_mth_amazons_exp_cerberus_step_5_choice_3_followup_incident",
							troy_amazons_trj_penthesilea = "troy_mth_amazons_exp_cerberus_step_5_choice_3_followup_incident",
							troy_rem_horde_aethiopians = "troy_rem_memnon_exp_cerberus_step_5_choice_3_followup_incident",
						}, 
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_cerberus_step_5_choice_3_outcome_clarity", remove = false, },
							{ experience_levels = 5, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},
					
					},
				},
			},
		},
	},
	{ 
   	 	key = "hydra",
		quest_battle_mission_key = "troy_myth_hydra",	-- NOTE: This is just a prefix for the per faction mission. The full key is <quest_battle_mission_key>_<faction_key>. See mythic_monsters_expeditions.get_mission_key_for_faction_key.
		quest_battle_set_piece_battle_key = "troy_myth_hydra_battle",
		quest_battle_region_key = "troy_mth_qb_hydra",
		quest_battle_loading_screen_key = "troy_mth_quest_battle_hydra",
		
		start_expedition_event_message = {
			title = "event_feed_strings_text_troy_mth_expedition_started_title",
			primary_detail = "event_feed_strings_text_troy_mth_expedition_started_primary_detail",
			secondary_detail = "event_feed_strings_text_troy_mth_expedition_started_secondary_detail",
			pic = 1117,
			show_immediately = true,
		},

		another_player_start_expedition_event_message = {
			title = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_title",
			primary_detail = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_primary_detail",
			secondary_detail = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_secondary_detail",
			pic = 1069,
			show_immediately = true,

			faction_overrides = {
				troy_amazons_trj_hippolyta = {
					title = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_title",
					primary_detail = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_primary_detail",
					secondary_detail = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_secondary_detail",
					pic = 2122,
					show_immediately = true,
				},
				troy_amazons_trj_penthesilea = {
					title = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_title",
					primary_detail = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_primary_detail",
					secondary_detail = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_secondary_detail",
					pic = 2122,
					show_immediately = true,
				},
				troy_rem_horde_aethiopians = {
					title = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_title",
					primary_detail = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_primary_detail",
					secondary_detail = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_secondary_detail",
					pic = 2126,
					show_immediately = true,
				},
			},
		},

		another_player_abandon_expedition_event_message = {
			title = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_title",
			primary_detail = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_primary_detail",
			secondary_detail = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_secondary_detail",
			pic = 1169,
			show_immediately = true,

			faction_overrides = {
				troy_amazons_trj_hippolyta = {
					title = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_title",
					primary_detail = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_primary_detail",
					secondary_detail = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_secondary_detail",
					pic = 2121,
					show_immediately = true,
				},
				troy_amazons_trj_penthesilea = {
					title = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_title",
					primary_detail = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_primary_detail",
					secondary_detail = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_secondary_detail",
					pic = 2121,
					show_immediately = true,
				},
				troy_rem_horde_aethiopians = {
					title = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_title",
					primary_detail = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_primary_detail",
					secondary_detail = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_secondary_detail",
					pic = 2125,
					show_immediately = true,
				},
			},
		},
		

		dilemmas = 
		{
			{		
				key = "troy_mth_exp_hydra_step_1",
				choices = 
				{
					{
						variant_of_option = 1,
						prerequisites = 
						{
						},
						followup_incident_key = "troy_mth_exp_hydra_step_1_choice_1_followup_incident",
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_hydra_step_1_choice_1_outcome_healing_mixture", remove = false, },
							{ health = -0.2, units_amount = 3, strength_order_ascending = true, display_text = "dummy_troy_mth_exp_lost_health", },
							{ experience_levels = 2, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},
					},
					{
						variant_of_option = 2,
						prerequisites = 
						{
						},
						followup_incident_key = "troy_mth_exp_hydra_step_1_choice_2_followup_incident",
						outcomes = 
						{
							{ unit_key = "troy_adi_dio_argive_raiders", units_amount = 1, remove = false, display_text = "dummy_troy_mth_exp_hydra_gain_argives", },
							{ unit_key = "troy_adi_dio_argive_slingers", units_amount = 1, remove = false, },							
						},	
					},
					{
						variant_of_option = 3,
						prerequisites = 
						{
						},
						followup_incident_key = "troy_mth_exp_hydra_step_1_choice_3_followup_incident",
						outcomes = 
						{
							{ unit_key = "troy_veteran_bowmen", units_amount = 2, remove = false, display_text = "dummy_troy_mth_exp_hydra_gain_bowmen", },
							{ ancillary_key = "troy_mth_anc_malchos", remove = false, display_text = "dummy_troy_mth_exp_hydra_gained_malchos", panel_text = "campaign_payload_ui_details_description_dummy_troy_mth_exp_hydra_gained_malchos", panel_image = "ui/campaign ui/effect_bundles/fx_icon_ancillary.png" },
							{ effect_bundle_key = "troy_mth_exp_hydra_step_1_choice_3_outcome_malchos", remove = false, },
						},
					},
					{
						variant_of_option = 4,
						prerequisites = 
						{
						},
						followup_incident_key = "troy_mth_exp_hydra_step_1_choice_4_followup_incident",
						outcomes = 
						{
							{ unit_key = "troy_mth_centaurs_sword_and_bow_elite", units_amount = 1, remove = false, display_text = "dummy_troy_mth_exp_hydra_gain_two_centaurs", },							
							{ unit_key = "troy_mth_centaurs_spear", units_amount = 1, remove = false, },
						}
					},
				}
			},
			{
				key = "troy_mth_exp_hydra_step_2",
				faction_overrides_dilemma_key = {
					troy_amazons_trj_hippolyta = "troy_mth_amazons_exp_hydra_step_2",
					troy_amazons_trj_penthesilea = "troy_mth_amazons_exp_hydra_step_2",
					troy_rem_horde_aethiopians = "troy_rem_memnon_exp_hydra_step_2",
				}, 
				choices = 
				{
					{
						variant_of_option = 1,
						prerequisites = 
						{
							{ made_choice = { dilemma_index = 1, choice = 3, }, negate = false, restricted_display_text = "",},	 -- this option has a universal variant without prerequisites, so this variant needs no restricted_display_text.
						},
						followup_incident_key = "troy_mth_exp_hydra_step_2_choice_1_2_followup_incident",
						faction_overrides_followup_incident_key = {
							troy_amazons_trj_hippolyta = "troy_mth_amazons_exp_hydra_step_2_choice_1_2_followup_incident",
							troy_amazons_trj_penthesilea = "troy_mth_amazons_exp_hydra_step_2_choice_1_2_followup_incident",
							troy_rem_horde_aethiopians = "troy_rem_memnon_exp_hydra_step_2_choice_1_2_followup_incident",
						}, 
						outcomes = 
						{
							{ health = -0.2, units_amount = 2, strength_order_ascending = true, display_text = "dummy_troy_mth_exp_lost_health", },
							{ effect_bundle_key = "troy_mth_exp_hydra_step_2_choice_1_outcome_little_green_men", remove = false, } ,
							{ experience_levels = 2, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },	
						},
					},
					{
						variant_of_option = 1,
						prerequisites = 
						{
							{ made_choice = { dilemma_index = 1, choice = 4, }, negate = false, restricted_display_text = "",},  -- this option has a universal variant without prerequisites, so this variant needs no restricted_display_text.
						},
						followup_incident_key = "troy_mth_exp_hydra_step_2_choice_1_3_followup_incident",
						faction_overrides_followup_incident_key = {
							troy_amazons_trj_hippolyta = "troy_mth_amazons_exp_hydra_step_2_choice_1_3_followup_incident",
							troy_amazons_trj_penthesilea = "troy_mth_amazons_exp_hydra_step_2_choice_1_3_followup_incident",
							troy_rem_horde_aethiopians = "troy_rem_memnon_exp_hydra_step_2_choice_1_3_followup_incident",
						}, 
						outcomes = 
						{
							{ health = -0.2, units_amount = 2, strength_order_ascending = true, display_text = "dummy_troy_mth_exp_lost_health", },
							{ ancillary_key = "troy_mth_anc_hydra_egg", remove = false, display_text = "dummy_troy_mth_exp_hydra_gained_hydra_egg", panel_text = "campaign_payload_ui_details_description_dummy_troy_mth_exp_hydra_gained_hydra_egg", panel_image = "ui/campaign ui/effect_bundles/fx_icon_ancillary.png"  },
							{ effect_bundle_key = "troy_mth_exp_hydra_step_2_choice_1_3_outcome_hydra_egg", remove = false,},
							{ experience_levels = 2, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
							
						},
					},
					{
						variant_of_option = 1,
						prerequisites = 
						{
						},
						followup_incident_key = "troy_mth_exp_hydra_step_2_choice_1_1_followup_incident",
						faction_overrides_followup_incident_key = {
							troy_amazons_trj_hippolyta = "troy_mth_amazons_exp_hydra_step_2_choice_1_1_followup_incident",
							troy_amazons_trj_penthesilea = "troy_mth_amazons_exp_hydra_step_2_choice_1_1_followup_incident",
							troy_rem_horde_aethiopians = "troy_rem_memnon_exp_hydra_step_2_choice_1_1_followup_incident",
						}, 
						outcomes = 
						{
							{ health = -0.3, units_amount = 3, strength_order_ascending = false, display_text = "dummy_troy_mth_exp_lost_health", },
							{ effect_bundle_key = "troy_mth_exp_hydra_step_2_choice_1_outcome_little_green_men", remove = false, } ,
							{ experience_levels = 2, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},
					},	
					{
						variant_of_option = 2,
						prerequisites = 
						{ 
							{ made_choice = { dilemma_index = 1, choice = 2, }, negate = false, restricted_display_text = "dummy_troy_mth_exp_hydra_step_1_choice_2_followup_incident_required",},
						},
						followup_incident_key = "troy_mth_exp_hydra_step_2_choice_2_followup_incident",
						faction_overrides_followup_incident_key = {
							troy_amazons_trj_hippolyta = "troy_mth_amazons_exp_hydra_step_2_choice_2_followup_incident",
							troy_amazons_trj_penthesilea = "troy_mth_amazons_exp_hydra_step_2_choice_2_followup_incident",
							troy_rem_horde_aethiopians = "troy_rem_memnon_exp_hydra_step_2_choice_2_followup_incident",
						}, 
						outcomes = 
						{
							{ unit_key = "troy_adi_dio_argive_raiders", units_amount = 1, remove = true, display_text = "dummy_troy_mth_exp_hydra_lose_argives", },
							{ unit_key = "troy_adi_dio_argive_slingers", units_amount = 1, remove = true, },
							{ unit_key = "troy_mth_gen_myth_hydra_archers", units_amount = 1, remove = false, display_text = "dummy_troy_mth_exp_hydra_gain_drinkers", },
							{ unit_key = "troy_mth_gen_myth_hydra_defenders", units_amount = 1, remove = false, },
						},
					},
					{	
						variant_of_option = 3,
						prerequisites = 
						{
						},
						followup_incident_key = "troy_mth_exp_hydra_step_2_choice_3_followup_incident",
						faction_overrides_followup_incident_key = {
							troy_amazons_trj_hippolyta = "troy_mth_amazons_exp_hydra_step_2_choice_3_followup_incident",
							troy_amazons_trj_penthesilea = "troy_mth_amazons_exp_hydra_step_2_choice_3_followup_incident",
							troy_rem_horde_aethiopians = "troy_rem_memnon_exp_hydra_step_2_choice_3_followup_incident",
						}, 
						outcomes = 
						{
							{ ancillary_key = "troy_mth_anc_hydra_egg", remove = false, display_text = "dummy_troy_mth_exp_hydra_gained_hydra_egg", panel_text = "campaign_payload_ui_details_description_dummy_troy_mth_exp_hydra_gained_hydra_egg", panel_image = "ui/campaign ui/effect_bundles/fx_icon_ancillary.png" },
							{ effect_bundle_key = "troy_mth_exp_hydra_step_2_choice_1_3_outcome_hydra_egg", remove = false, },
							{ trait_key = "troy_mth_exp_hydra_trait", remove = false, points = 1, display_text = "dummy_troy_mth_exp_hydra_gain_trait", },
							{ experience_levels = 1, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},
					},
					{	
						variant_of_option = 4,
						prerequisites = 
						{
						},
						followup_incident_key = "troy_mth_exp_hydra_step_2_choice_4_followup_incident",
						faction_overrides_followup_incident_key = {
							troy_amazons_trj_hippolyta = "troy_mth_amazons_exp_hydra_step_2_choice_4_followup_incident",
							troy_amazons_trj_penthesilea = "troy_mth_amazons_exp_hydra_step_2_choice_4_followup_incident",
							troy_rem_horde_aethiopians = "troy_rem_memnon_exp_hydra_step_2_choice_4_followup_incident",
						}, 
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_hydra_step_2_choice_4_outcome_the_mother", remove = false,},
							{ experience_levels = 2, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},
					},			
				},
			},	
			{		
				key = "troy_mth_exp_hydra_step_3",
				choices = 
				{
					{
						variant_of_option = 1,
						prerequisites = 
						{
							{ made_choice = { dilemma_index = 1, choice = 3, }, negate = false, restricted_display_text = "",}, -- this option has a universal variant without prerequisites, so this variant needs no restricted_display_text.
							
						},
						followup_incident_key = "troy_mth_exp_hydra_step_3_choice_1_2_followup_incident",
						outcomes = 
						{
							{ experience_levels = 3, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
							{ effect_bundle_key = "troy_mth_exp_hydra_step_3_outcome_scouted_marshlands", remove = false },	
						},
					},
					{
						variant_of_option = 1,
						prerequisites = 
						{
							{ made_choice = { dilemma_index = 1, choice = 4, }, negate = false, restricted_display_text = "", }, -- this option has a universal variant without prerequisites, so this variant needs no restricted_display_text.
							
						},
						followup_incident_key = "troy_mth_exp_hydra_step_3_choice_1_3_followup_incident",
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_hydra_step_3_outcome_scouted_marshlands", remove = false, } ,								
							{ effect_bundle_key = "troy_mth_exp_hydra_step_3_choice_1_3_outcome_equine_exhaustion", remove = false, } ,	
							{ effect_bundle_key = "troy_mth_exp_hydra_step_3_choice_1_3_outcome_centaur_salve", remove = false, } ,	
							{ experience_levels = 3, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},
					},
					{
						variant_of_option = 1,
						prerequisites = 
						{
						},
						followup_incident_key = "troy_mth_exp_hydra_step_3_choice_1_1_followup_incident",
						outcomes = 
						{
							{ experience_levels = 3, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
							{ effect_bundle_key = "troy_mth_exp_hydra_step_3_outcome_scouted_marshlands", remove = false, } ,
							{ health = -0.2, units_amount = 1, strength_order_ascending = false, display_text = "dummy_troy_mth_exp_lost_health", },
						},
					},
					{
						variant_of_option = 2,
						prerequisites = 
						{
							{ made_choice = { dilemma_index = 2, choice = 2, }, negate = false, restricted_display_text = "dummy_troy_mth_exp_hydra_step_2_choice_2_followup_incident_required", },
						},
						followup_incident_key = "troy_mth_exp_hydra_step_3_choice_2_1_followup_incident",
						outcomes = 
						{
							{ unit_key = "troy_mth_gen_myth_hydra_archers", units_amount = 1, remove = true, display_text = "dummy_troy_mth_exp_hydra_lose_one_hydra_archer", },
							{ effect_bundle_key = "troy_mth_exp_hydra_step_3_choice_2_1_outcome_safe_travels", remove = false, } ,
							{ ancillary_key = "troy_mth_anc_hydra_egg", remove = false, display_text = "dummy_troy_mth_exp_hydra_gained_hydra_egg", panel_text = "campaign_payload_ui_details_description_dummy_troy_mth_exp_hydra_gained_hydra_egg", panel_image = "ui/campaign ui/effect_bundles/fx_icon_ancillary.png" },
							{ effect_bundle_key = "troy_mth_exp_hydra_step_2_choice_1_3_outcome_hydra_egg", remove = false, },
							{ experience_levels = 2, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},
					},
					{
						variant_of_option = 2,
						prerequisites = 
						{
							{ made_choice = { dilemma_index = 2, choice = 3, }, negate = false, restricted_display_text = "dummy_troy_mth_exp_hydra_step_2_choice_3_followup_incident_required", },
						},
						followup_incident_key = "troy_mth_exp_hydra_step_3_choice_2_2_followup_incident",
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_hydra_step_3_choice_2_2_outcome_fatigue", remove = false, } ,
							{ experience_levels = 3, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
							{ trait_key = "troy_mth_exp_hydra_trait", remove = false, points = 1, display_text = "dummy_troy_mth_exp_hydra_gain_trait", },
						},
					},						
					{
						variant_of_option = 3,
						prerequisites = 
						{
						},
						followup_incident_key = "troy_mth_exp_hydra_step_3_choice_3_followup_incident",
						outcomes = 
						{
							{ health = -0.1, units_amount = 4, strength_order_ascending = true, display_text = "dummy_troy_mth_exp_lost_health", },
							{ experience_levels = 3, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},
					},	
				},
			},
			{		
				key = "troy_mth_exp_hydra_step_4",
				choices = 
				{
					{
						variant_of_option = 1,
						prerequisites = 
						{
							{ have_effect_bundle_key = "troy_mth_exp_hydra_step_2_choice_1_3_outcome_hydra_egg", negate = false, restricted_display_text = "dummy_troy_mth_exp_hydra_hydra_egg_followup_incident_required", },
						},
						followup_incident_key = "troy_mth_exp_hydra_step_4_choice_1_followup_incident",
						outcomes = 
						{
							{ ancillary_key = "troy_mth_anc_hydra_egg", remove = true, display_text = "dummy_troy_mth_exp_hydra_lost_hydra_egg", panel_text = "campaign_payload_ui_details_description_dummy_troy_mth_exp_hydra_lost_hydra_egg", panel_image = "ui/campaign ui/effect_bundles/fx_icon_ancillary.png" },
							{ trait_key = "troy_mth_exp_hydra_bracelet", remove = false, points = 1, display_text = "dummy_troy_mth_exp_hydra_gain_bracelet", panel_text = "campaign_payload_ui_details_description_dummy_troy_mth_exp_hydra_gain_bracelet_panel_text", panel_image = "UI/skins/default/troy_mth_exp_hydra_trait_hydra_bracelet.png" },
							{ experience_levels = 1, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},
					},
					{
						variant_of_option = 2,
						prerequisites = 
						{
							{ made_choice = { dilemma_index = 2, choice = 2, }, negate = false, restricted_display_text = "dummy_troy_mth_exp_hydra_step_2_choice_2_followup_incident_required", },
							
						},
						followup_incident_key = "troy_mth_exp_hydra_step_4_choice_2_followup_incident",
						outcomes = 
						{
							{ unit_key = "troy_mth_gen_myth_hydra_archers", units_amount = 1, remove = true, display_text = "dummy_troy_mth_exp_hydra_lose_all_drinkers", },
							{ unit_key = "troy_mth_gen_myth_hydra_defenders", units_amount = 1, remove = true, },
							{ unit_key = "troy_mth_gen_myth_hydra_priest", units_amount = 1, remove = false, display_text = "dummy_troy_mth_exp_hydra_gain_priest", },
							{ experience_levels = 2, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},
					},
					{
						variant_of_option = 3,
						prerequisites = 
						{
							{ made_choice = { dilemma_index = 1, choice = 3, }, negate = false, restricted_display_text = "",}, -- this option has a universal variant without prerequisites, so this variant needs no restricted_display_text..
						},
						followup_incident_key = "troy_mth_exp_hydra_step_4_choice_3_2_followup_incident",
						outcomes = 
						{
							{ unit_key = "troy_veteran_bowmen", units_amount = 1, remove = true, display_text = "dummy_troy_mth_exp_hydra_lose_bowmen", },
							{ effect_bundle_key = "troy_mth_exp_hydra_step_4_choice_3_2_outcome_legacy_of_iolaos", remove = false, },
							{ experience_levels = 3, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},
					},
					{
						variant_of_option = 3,
						prerequisites = 
						{
						},
						followup_incident_key = "troy_mth_exp_hydra_step_4_choice_3_1_followup_incident",
						outcomes = 
						{
							{ health = -1, units_amount = 2, strength_order_ascending = true, display_text = "dummy_troy_mth_exp_hydra_lose_two_strongest", },
							{ unit_key = "troy_mth_gen_myth_drinkers_venom", units_amount = 2, remove = false, display_text = "dummy_troy_mth_exp_hydra_gain_drinkers", },
							{ experience_levels = 3, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},
					},
					{	
						variant_of_option = 4,
						prerequisites = 
						{
							{ made_choice = { dilemma_index = 1, choice = 4, }, negate = false, restricted_display_text = "",},	-- this option has a universal variant without prerequisites, so this variant needs no restricted_display_text..
							{}
						},
						followup_incident_key = "troy_mth_exp_hydra_step_4_choice_4_1_followup_incident",
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_hydra_step_4_choice_4_outcome_ruined_temple", remove = false, },
							{ unit_key = "troy_mth_centaurs_spear", units_amount = 1, remove = true, display_text = "dummy_troy_mth_exp_hydra_lose_one_centaur", },
							{ experience_levels = 2, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},
					},
					{	
						variant_of_option = 4,
						prerequisites = 
						{
							{ made_choice = { dilemma_index = 1, choice = 3, }, negate = false, restricted_display_text = "",},	-- this option has a universal variant without prerequisites, so this variant needs no restricted_display_text..
						},
						followup_incident_key = "troy_mth_exp_hydra_step_4_choice_4_2_followup_incident",
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_hydra_step_4_choice_4_outcome_ruined_temple", remove = false, },
							{ ancillary_key = "troy_mth_anc_malchos", remove = true, display_text = "dummy_troy_mth_exp_hydra_lost_malchos", panel_text = "campaign_payload_ui_details_description_dummy_troy_mth_exp_hydra_lost_malchos", panel_image = "ui/campaign ui/effect_bundles/fx_icon_ancillary.png" },
							{ experience_levels = 2, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},
					},
					{	
						variant_of_option = 4,
						prerequisites = 
						{							
						},
						followup_incident_key = "troy_mth_exp_hydra_step_4_choice_4_3_followup_incident",
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_hydra_step_4_choice_4_outcome_ruined_temple", remove = false, },
							{ health = -0.2, units_amount = 2, strength_order_ascending = false, display_text = "dummy_troy_mth_exp_lost_health", },
							{ experience_levels = 2, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},
					},
				},
			},
			{		
				key = "troy_mth_exp_hydra_step_5",
				faction_overrides_dilemma_key = {
					troy_amazons_trj_hippolyta = "troy_mth_amazons_exp_hydra_step_5",
					troy_amazons_trj_penthesilea = "troy_mth_amazons_exp_hydra_step_5",
					troy_rem_horde_aethiopians = "troy_rem_memnon_exp_hydra_step_5",
				}, 
				choices = 
				{
					{
						variant_of_option = 1,
						prerequisites = 
						{
							{ made_choice = { dilemma_index = 4, choice = 1, }, negate = false, restricted_display_text = "dummy_troy_mth_exp_hydra_step_4_choice_1_followup_incident_required",},
						},
						followup_incident_key = "troy_mth_exp_hydra_step_5_choice_1_1_followup_incident",
						faction_overrides_followup_incident_key = {
							troy_amazons_trj_hippolyta = "troy_mth_amazons_exp_hydra_step_5_choice_1_1_followup_incident",
							troy_amazons_trj_penthesilea = "troy_mth_amazons_exp_hydra_step_5_choice_1_1_followup_incident",
							troy_rem_horde_aethiopians = "troy_rem_memnon_exp_hydra_step_5_choice_1_1_followup_incident",
						}, 
						outcomes = 
						{
							{ trait_key = "troy_mth_exp_hydra_bracelet", remove = true, points = 1,  display_text = "dummy_troy_mth_exp_hydra_lose_bracelet", panel_text = "campaign_payload_ui_details_description_dummy_troy_mth_exp_hydra_lose_bracelet_panel_text", panel_image = "UI/skins/default/troy_mth_exp_hydra_trait_hydra_bracelet.png" },
							{ effect_bundle_key = "troy_mth_exp_hydra_step_5_choice_1_1_outcome_hydra_scorned", remove = false, },
						},
					},					
					{
						variant_of_option = 1,
						prerequisites = 
						{
							{ made_choice = { dilemma_index = 4, choice = 2, }, negate = false, restricted_display_text = "dummy_troy_mth_exp_hydra_step_4_choice_2_followup_incident_required",},
						},
						followup_incident_key = "troy_mth_exp_hydra_step_5_choice_1_2_followup_incident",
						faction_overrides_followup_incident_key = {
							troy_amazons_trj_hippolyta = "troy_mth_amazons_exp_hydra_step_5_choice_1_2_followup_incident",
							troy_amazons_trj_penthesilea = "troy_mth_amazons_exp_hydra_step_5_choice_1_2_followup_incident",
							troy_rem_horde_aethiopians = "troy_rem_memnon_exp_hydra_step_5_choice_1_2_followup_incident",
						}, 
						outcomes = 
						{
							{ unit_key = "troy_mth_gen_myth_hydra_priest", units_amount = 1, remove = true, display_text = "dummy_troy_mth_exp_hydra_lose_priest", },
							{ effect_bundle_key = "troy_mth_exp_hydra_step_5_choice_1_1_outcome_hydra_scorned", remove = false, },
						},
					},					
					{
						variant_of_option = 2,
						prerequisites = 
						{
							{ made_choice = { dilemma_index = 2, choice = 3, }, negate = false, restricted_display_text = "dummy_troy_mth_exp_hydra_step_2_choice_3_followup_incident_required",},
							{ have_effect_bundle_key = "troy_mth_exp_hydra_step_1_choice_3_outcome_malchos", negate = false, restricted_display_text = "dummy_troy_epic_mission_menelaus_helen_removed", },												
						},
						followup_incident_key = "troy_mth_exp_hydra_step_5_choice_2_1_followup_incident",
						outcomes = 
						{
							{ unit_key = "troy_veteran_bowmen", units_amount = 1, remove = true, display_text = "dummy_troy_mth_exp_hydra_lose_bowmen", },
							{ ancillary_key = "troy_mth_anc_malchos", remove = true, display_text = "dummy_troy_mth_exp_hydra_lost_malchos", panel_text = "campaign_payload_ui_details_description_dummy_troy_mth_exp_hydra_lost_malchos", panel_image = "ui/campaign ui/effect_bundles/fx_icon_ancillary.png" },
							{ effect_bundle_key = "troy_mth_exp_hydra_step_5_choice_1_1_outcome_hydra_scorned", remove = false, },
						},					
					},
					{
						variant_of_option = 2,
						prerequisites = 
						{
							{ have_effect_bundle_key = "troy_mth_exp_hydra_dummy_bundle_the_hydra_among_us", negate = false, restricted_display_text = "dummy_troy_mth_exp_hydra_step_4_choice_2_followup_incident_required", },
							{ have_effect_bundle_key = "troy_mth_exp_hydra_step_1_choice_3_outcome_malchos", negate = false, restricted_display_text = "dummy_troy_epic_mission_menelaus_helen_removed", },
						},
						followup_incident_key = "troy_mth_exp_hydra_step_5_choice_2_2_followup_incident",
						outcomes = 
						{
							{ unit_key = "troy_veteran_bowmen", units_amount = 1, remove = true, display_text = "dummy_troy_mth_exp_hydra_lose_bowmen", },
							{ ancillary_key = "troy_mth_anc_malchos", remove = true, display_text = "dummy_troy_mth_exp_hydra_lost_malchos", panel_text = "campaign_payload_ui_details_description_dummy_troy_mth_exp_hydra_lost_malchos", panel_image = "ui/campaign ui/effect_bundles/fx_icon_ancillary.png" },
							{ effect_bundle_key = "troy_mth_exp_hydra_step_5_choice_1_1_outcome_hydra_scorned", remove = false, },
						},					
					},
					{
						variant_of_option = 2,
						prerequisites = 
						{
							{ made_choice = { dilemma_index = 2, choice = 3, }, negate = false, restricted_display_text = "dummy_troy_mth_exp_hydra_step_2_choice_3_followup_incident_required", },					
						},
						followup_incident_key = "troy_mth_exp_hydra_step_5_choice_2_3_followup_incident",
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_hydra_step_5_choice_2_3_outcome_not_human", remove = false, },
							{ trait_key = "troy_mth_exp_hydra_trait", remove = false, points = 1, display_text = "dummy_troy_mth_exp_hydra_gain_trait", },
							{ experience_levels = 2, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},					
					},
					{
						variant_of_option = 2,
						prerequisites = 
						{
							{ have_effect_bundle_key = "troy_mth_exp_hydra_dummy_bundle_the_hydra_among_us", negate = false, restricted_display_text = "dummy_troy_mth_exp_hydra_step_4_choice_2_followup_incident_required", },
						},
						followup_incident_key = "troy_mth_exp_hydra_step_5_choice_2_4_followup_incident",
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_hydra_step_5_choice_2_4_outcome_inititation_complete", remove = false, },
							{ effect_bundle_key = "troy_mth_exp_hydra_step_5_choice_2_3_outcome_not_human", remove = false, },
							{ experience_levels = 2, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},					
					},
					{
						variant_of_option = 3,
						prerequisites = 
						{
							{ have_effect_bundle_key = "troy_mth_exp_hydra_step_3_choice_1_3_outcome_centaur_salve", negate = false, restricted_display_text = "dummy_troy_mth_exp_hydra_step_3_choice_1_3_followup_incident_required", },
						},
						followup_incident_key = "troy_mth_exp_hydra_step_5_choice_3_followup_incident",
						faction_overrides_followup_incident_key = {
							troy_amazons_trj_hippolyta = "troy_mth_amazons_exp_hydra_step_5_choice_3_followup_incident",
							troy_amazons_trj_penthesilea = "troy_mth_amazons_exp_hydra_step_5_choice_3_followup_incident",
							troy_rem_horde_aethiopians = "troy_rem_memnon_exp_hydra_step_5_choice_3_followup_incident",
						}, 
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_hydra_step_3_choice_1_3_outcome_centaur_salve", remove = true, },
							{ effect_bundle_key = "troy_mth_exp_hydra_step_5_choice_3_outcome_centaur_poultice", remove = false, display_text = "dummy_troy_mth_exp_upgrade_bundle" },
						},					
					},
					{
						variant_of_option = 4,
						prerequisites = 
						{
							{ have_effect_bundle_key = "troy_mth_exp_hydra_step_1_choice_3_outcome_malchos", negate = false, restricted_display_text = "dummy_troy_epic_mission_menelaus_helen_removed",},
						},
						followup_incident_key = "troy_mth_exp_hydra_step_5_choice_4_1_followup_incident",
						faction_overrides_followup_incident_key = {
							troy_amazons_trj_hippolyta = "troy_mth_amazons_exp_hydra_step_5_choice_4_1_followup_incident",
							troy_amazons_trj_penthesilea = "troy_mth_amazons_exp_hydra_step_5_choice_4_1_followup_incident",
							troy_rem_horde_aethiopians = "troy_rem_memnon_exp_hydra_step_5_choice_4_1_followup_incident",
						},
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_hydra_step_5_choice_4_1_outcome_iolaian_spirit", remove = false, },
							{ experience_levels = 3, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},					
					},
					{
						variant_of_option = 4,
						prerequisites = 
						{
						},
						followup_incident_key = "troy_mth_exp_hydra_step_5_choice_4_2_followup_incident",
						faction_overrides_followup_incident_key = {
							troy_amazons_trj_hippolyta = "troy_mth_amazons_exp_hydra_step_5_choice_4_2_followup_incident",
							troy_amazons_trj_penthesilea = "troy_mth_amazons_exp_hydra_step_5_choice_4_2_followup_incident",
							troy_rem_horde_aethiopians = "troy_rem_memnon_exp_hydra_step_5_choice_4_2_followup_incident",
						},
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_hydra_step_5_choice_4_2_outcome_battle_spirit", remove = false, },
							{ experience_levels = 3, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},					
					},
				},
			},
		},
	},
 	{
		key = "griffin",
		quest_battle_mission_key = "troy_myth_griffin",	-- NOTE: This is just a prefix for the per faction mission. The full key is <quest_battle_mission_key>_<faction_key>. See mythic_monsters_expeditions.get_mission_key_for_faction_key.
		quest_battle_set_piece_battle_key = "troy_myth_griffin_battle",
		quest_battle_region_key = "troy_mth_qb_griffin",
		quest_battle_loading_screen_key = "troy_mth_quest_battle_griffin",

		start_expedition_event_message = {
			title = "event_feed_strings_text_troy_mth_expedition_started_title",
			primary_detail = "event_feed_strings_text_troy_mth_expedition_started_primary_detail",
			secondary_detail = "event_feed_strings_text_troy_mth_expedition_started_secondary_detail",
			pic = 1116,
			show_immediately = true,
		},

		another_player_start_expedition_event_message = {
			title = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_title",
			primary_detail = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_primary_detail",
			secondary_detail = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_secondary_detail",
			pic = 1069,
			show_immediately = true,

			faction_overrides = {
				troy_amazons_trj_hippolyta = {
					title = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_title",
					primary_detail = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_primary_detail",
					secondary_detail = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_secondary_detail",
					pic = 2122,
					show_immediately = true,
				},
				troy_amazons_trj_penthesilea = {
					title = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_title",
					primary_detail = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_primary_detail",
					secondary_detail = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_secondary_detail",
					pic = 2122,
					show_immediately = true,
				},
				troy_rem_horde_aethiopians = {
					title = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_title",
					primary_detail = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_primary_detail",
					secondary_detail = "event_feed_strings_text_troy_scripted_event_another_player_started_expedition_secondary_detail",
					pic = 2126,
					show_immediately = true,
				},
			},
		},

		another_player_abandon_expedition_event_message = {
			title = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_title",
			primary_detail = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_primary_detail",
			secondary_detail = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_secondary_detail",
			pic = 1169,
			show_immediately = true,

			faction_overrides = {
				troy_amazons_trj_hippolyta = {
					title = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_title",
					primary_detail = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_primary_detail",
					secondary_detail = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_secondary_detail",
					pic = 2121,
					show_immediately = true,
				},
				troy_amazons_trj_penthesilea = {
					title = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_title",
					primary_detail = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_primary_detail",
					secondary_detail = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_secondary_detail",
					pic = 2121,
					show_immediately = true,
				},
				troy_rem_horde_aethiopians = {
					title = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_title",
					primary_detail = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_primary_detail",
					secondary_detail = "event_feed_strings_text_troy_scripted_event_another_player_abandoned_expedition_secondary_detail",
					pic = 2125,
					show_immediately = true,
				},
			},
		},

		dilemmas = 
		{
			{		
				key = "troy_mth_exp_griffin_step_1",
				faction_overrides_dilemma_key = {
					troy_amazons_trj_hippolyta = "troy_mth_amazons_exp_griffin_step_1",
					troy_amazons_trj_penthesilea = "troy_mth_amazons_exp_griffin_step_1",
					troy_rem_horde_aethiopians = "troy_rem_memnon_exp_griffin_step_1",
				}, 
				choices = 
				{
					{
						variant_of_option = 1,
						prerequisites = 
						{
						},
						followup_incident_key = "troy_mth_exp_griffin_step_1_choice_1_followup_incident",
						outcomes = 
						{
							{ ancillary_key = "troy_mth_anc_pseudos", remove = false, display_text = "dummy_troy_mth_exp_griffin_gained_pseudos", panel_text = "campaign_payload_ui_details_description_dummy_troy_mth_exp_griffin_gained_pseudos", panel_image = "ui/campaign ui/effect_bundles/troy_mth_exp_griffin_ancillary_pseudos.png" },	
							{ effect_bundle_key = "troy_mth_exp_griffin_dummy_bundle_pseudos_the_annoying", remove = false, },
						},
					},
					{
						variant_of_option = 2,
						prerequisites = 
						{
						},
						followup_incident_key = "troy_mth_exp_griffin_step_1_choice_2_followup_incident",
						faction_overrides_followup_incident_key = {
							troy_amazons_trj_hippolyta = "troy_mth_amazons_exp_griffin_step_1_choice_2_followup_incident",
							troy_amazons_trj_penthesilea = "troy_mth_amazons_exp_griffin_step_1_choice_2_followup_incident",
							troy_rem_horde_aethiopians = "troy_rem_memnon_exp_griffin_step_1_choice_2_followup_incident",
						},
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_cerberus_step_1_choice_2_outcome_fatigued", remove = false,},
							{ effect_bundle_key = "troy_mth_exp_griffin_step_1_choice_2_outcome_scouting", remove = false,},
							{ experience_levels = 2, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},	
					},
					{
						variant_of_option = 3,
						prerequisites = 
						{
						},
						followup_incident_key = "troy_mth_exp_griffin_step_1_choice_3_followup_incident",
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_griffin_step_1_choice_3_outcome_well_fed", remove = false,},
							{ health = -1, units_amount = 1, strength_order_ascending = true, display_text = "dummy_troy_mth_exp_griffin_lose_one_weakest", },
						},
					},
					{	
						variant_of_option = 4,
						prerequisites = 
						{
						},
						followup_incident_key = "troy_mth_exp_griffin_step_1_choice_4_followup_incident",
						faction_overrides_followup_incident_key = {
							troy_amazons_trj_hippolyta = "troy_mth_amazons_exp_griffin_step_1_choice_4_followup_incident",
							troy_amazons_trj_penthesilea = "troy_mth_amazons_exp_griffin_step_1_choice_4_followup_incident",
							troy_rem_horde_aethiopians = "troy_rem_memnon_exp_griffin_step_1_choice_4_followup_incident",
						},
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_griffin_step_1_choice_4_outcome_terrain_training", remove = false,},
							{ health = -0.3, units_amount = 3, strength_order_ascending = true, display_text = "dummy_troy_mth_exp_lost_health", },
							{ experience_levels = 2, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience",},
						},
					},
				},
			},
			{
				key = "troy_mth_exp_griffin_step_2",
				choices = 
				{
					{
						variant_of_option = 1,
						prerequisites = 
						{
							{ have_effect_bundle_key= "troy_mth_exp_griffin_dummy_bundle_pseudos_the_annoying", negate = false, restricted_display_text = "dummy_troy_mth_exp_griffin_step_1_choice_1_followup_incident_required",},
						},
						followup_incident_key = "troy_mth_exp_griffin_step_2_choice_1_followup_incident",
						outcomes = 
						{
							{ ancillary_key = "troy_mth_anc_pseudos", remove = true, display_text = "dummy_troy_mth_exp_griffin_lost_pseudos", panel_text = "campaign_payload_ui_details_description_dummy_troy_mth_exp_griffin_lost_pseudos", panel_image = "ui/campaign ui/effect_bundles/troy_mth_exp_griffin_ancillary_pseudos.png" },
							{ effect_bundle_key = "troy_mth_exp_griffin_step_1_choice_3_outcome_well_fed", remove = false, },
							{ experience_levels = 2, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},
					},	
					{
						variant_of_option = 2,
						prerequisites = 
						{ 
						},
						followup_incident_key = "troy_mth_exp_griffin_step_2_choice_2_followup_incident",
						outcomes = 
						{					
							{ effect_bundle_key = "troy_mth_exp_griffin_step_2_choice_2_penalty_outcome_restless_fear", remove = false,},
							{ experience_levels = 1, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},
					},				
					{
						variant_of_option = 3,
						prerequisites = 
						{ 
						{ made_choice = { dilemma_index = 1, choice = 4, }, negate = false, restricted_display_text = "",}, -- this option has a universal variant without prerequisites, so this variant needs no restricted_display_text..
						},
						followup_incident_key = "troy_mth_exp_griffin_step_2_choice_3_followup_incident_2",
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_griffin_step_2_choice_3_1_outcome_show_of_force", remove = false,},
							{ health = -0.3, units_amount = 4, strength_order_ascending = true, display_text = "dummy_troy_mth_exp_lost_health", },
							{ unit_key = "troy_achaean_islanders", units_amount = 1, remove = false, display_text = "dummy_troy_mth_exp_griffin_gain_islanders", },
							{ unit_key = "troy_heavy_islander_skirmishers", units_amount = 1, remove = false, },
							{ experience_levels = 3, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},
					},
					{	
						variant_of_option = 3,
						prerequisites = 
						{
							{ made_choice = { dilemma_index = 1, choice = 2, }, negate = false, restricted_display_text = "",}, -- this option has a universal variant without prerequisites, so this variant needs no restricted_display_text..
						},
						followup_incident_key = "troy_mth_exp_griffin_step_2_choice_3_followup_incident_1",
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_griffin_step_2_choice_3_1_outcome_show_of_force", remove = false,},	
							{ experience_levels = 3, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },	
						},
					},
					{	
						variant_of_option = 3,
						prerequisites = 
						{		
						},
						followup_incident_key = "troy_mth_exp_griffin_step_2_choice_3_followup_incident_3",
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_griffin_step_2_choice_3_1_outcome_show_of_force", remove = false, },
							{ health = -0.3, units_amount = 4, strength_order_ascending = false, display_text = "dummy_troy_mth_exp_lost_health", },
							{ experience_levels = 3, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},
					},
				},
			},			
			{		
				key = "troy_mth_exp_griffin_step_3",
				choices = 
				{				
					{
						variant_of_option = 1,
						prerequisites = 
						{
						},
						followup_incident_key = "troy_mth_exp_griffin_step_3_choice_1_followup_incident",
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_griffin_step_3_choice_1_outcome_trader_warning", remove = false, },
							{ health = -0.2, units_amount = 3, strength_order_ascending = true, display_text = "dummy_troy_mth_exp_lost_health", },
							{ experience_levels = 1, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},
					},					
					{
						variant_of_option = 2,
						prerequisites = 
						{
						},
						followup_incident_key = "troy_mth_exp_griffin_step_3_choice_2_followup_incident",
						outcomes = 
						{
							{ unit_key = "troy_mth_centaurs_sword_and_bow_elite", units_amount = 2, remove = false, display_text = "dummy_troy_mth_exp_griffin_gain_centaur", },
						},
					},						
					{
						variant_of_option = 3,
						prerequisites = 
						{
						},
						followup_incident_key = "troy_mth_exp_griffin_step_3_choice_3_followup_incident_1",
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_griffin_step_3_choice_3_1_penalty_outcome_boreas_touch", remove = false, },
							{ experience_levels = 2, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},
					},					
					{
						variant_of_option = 4,
						prerequisites = 
						{
							{ made_choice = { dilemma_index = 1, choice = 2, }, negate = false, restricted_display_text = "dummy_troy_mth_exp_griffin_step_1_choice_2_followup_incident_required", },
						},
						followup_incident_key = "troy_mth_exp_griffin_step_3_choice_4_followup_incident",
						outcomes = 
						{
							{ experience_levels = 3, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},
					},					
				},
			},
			{		
				key = "troy_mth_exp_griffin_step_4",
				choices = 
				{
					{
						variant_of_option = 1,
						prerequisites = 
						{
							{ made_choice = { dilemma_index = 1, choice = 1, }, negate = false, restricted_display_text = "dummy_troy_mth_exp_griffin_step_1_choice_1_followup_incident_required", },
							{ made_choice = { dilemma_index = 2, choice = 1, }, negate = true, restricted_display_text = "dummy_troy_mth_exp_griffin_step_1_choice_1_followup_incident_required", },		
						},
						followup_incident_key = "troy_mth_exp_griffin_step_4_choice_1_followup_incident",
						outcomes = 
						{
							{ ancillary_key = "troy_mth_anc_pseudos", remove = true, panel_text = "campaign_payload_ui_details_description_dummy_troy_mth_exp_griffin_lost_pseudos", panel_image = "ui/campaign ui/effect_bundles/troy_mth_exp_griffin_ancillary_pseudos.png" },
							{ effect_bundle_key = "troy_mth_exp_cerberus_step_1_choice_2_outcome_fatigued", remove = true, display_text = "dummy_troy_mth_exp_lost_negative_bundle" },
							{ effect_bundle_key = "troy_mth_exp_griffin_step_2_choice_2_penalty_outcome_restless_fear", remove = true,},
							{ effect_bundle_key = "troy_mth_exp_griffin_step_3_choice_3_1_penalty_outcome_boreas_touch", remove = true, },
							{ health = 0.2, units_amount = 20, strength_order_ascending = true, display_text = "dummy_troy_mth_exp_gained_health", },
							{ effect_bundle_key = "troy_mth_exp_griffin_step_4_choice_2_outcome_arimaspoi_retinue", remove = false, },
							{ unit_key = "troy_mth_gen_myth_arimaspoi_skirmishers", units_amount = 1, remove = false, display_text = "dummy_troy_mth_exp_griffin_gain_two_arimaspoi", },
							{ unit_key = "troy_mth_gen_myth_arimaspoi_hunters", units_amount = 1, remove = false, },
							
						},
					},
					{
						variant_of_option = 2,
						prerequisites = 
						{
							{ made_choice = { dilemma_index = 3, choice = 2, }, negate = false, restricted_display_text = "dummy_troy_mth_exp_griffin_step_3_choice_2_followup_incident_required", },
						},
						followup_incident_key = "troy_mth_exp_griffin_step_4_choice_2_followup_incident",
						outcomes = 
						{
							{ unit_key = "troy_mth_gen_myth_arimaspoi_skirmishers", units_amount = 1, remove = false, display_text = "dummy_troy_mth_exp_griffin_gain_four_arimaspoi", },
							{ unit_key = "troy_mth_gen_myth_arimaspoi_hunters", units_amount = 1, remove = false, },
							{ unit_key = "troy_mth_gen_myth_arimaspoi_spearmen", units_amount = 2, remove = false, },
							{ effect_bundle_key = "troy_mth_exp_griffin_step_4_choice_2_outcome_arimaspoi_retinue", remove = false, },
						},
					},
					{
						variant_of_option = 3,
						prerequisites = 
						{					
						},
						followup_incident_key = "troy_mth_exp_griffin_step_4_choice_3_followup_incident",
						outcomes = 
						{
							{ experience_levels = 3, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},
					},
					{
						variant_of_option = 4,
						prerequisites = 
						{					
						},
						followup_incident_key = "troy_mth_exp_griffin_step_4_choice_4_followup_incident",
						outcomes = 
						{
							{ health = -1, units_amount = 1, strength_order_ascending = true, display_text = "dummy_troy_mth_exp_griffin_lose_one_weakest", },
							{ effect_bundle_key = "troy_mth_exp_cerberus_step_1_choice_2_outcome_fatigued", remove = true, display_text = "dummy_troy_mth_exp_lost_negative_bundle" },
							{ effect_bundle_key = "troy_mth_exp_griffin_step_2_choice_2_penalty_outcome_restless_fear", remove = true,},
							{ effect_bundle_key = "troy_mth_exp_griffin_step_3_choice_3_1_penalty_outcome_boreas_touch", remove = true, },
							{ health = 0.2, units_amount = 20, strength_order_ascending = true, display_text = "dummy_troy_mth_exp_gained_health", },
							{ experience_levels = 1, units_amount = 20, strength_order_descending = false, display_text = "dummy_troy_mth_exp_gained_experience", },
						},
					},
				}
			},
			{		
				key = "troy_mth_exp_griffin_step_5",
				choices = 
				{
					{
						variant_of_option = 1,
						prerequisites = 
						{
							{ made_choice = { dilemma_index = 4, choice = 1, }, negate = false, restricted_display_text = "dummy_troy_mth_exp_griffin_step_4_choice_1_or_2_followup_incident_required", },
						},
						followup_incident_key = "troy_mth_exp_griffin_step_5_choice_1_followup_incident",
						faction_overrides_followup_incident_key = {
							troy_amazons_trj_hippolyta = "troy_mth_amazons_exp_griffin_step_5_choice_1_followup_incident",
							troy_amazons_trj_penthesilea = "troy_mth_amazons_exp_griffin_step_5_choice_1_followup_incident",
							troy_rem_horde_aethiopians = "troy_rem_memnon_exp_griffin_step_5_choice_1_followup_incident",
						},
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_griffin_step_4_choice_2_outcome_arimaspoi_retinue", remove = true, },
							{ effect_bundle_key = "troy_mth_exp_griffin_step_5_choice_1_outcome_loyal_arimaspoi", remove = false, },
						},
					},					
					{
						variant_of_option = 1,
						prerequisites = 
						{
							{ made_choice = { dilemma_index = 4, choice = 2, }, negate = false, restricted_display_text = "dummy_troy_mth_exp_griffin_step_4_choice_1_or_2_followup_incident_required", },
						},
						followup_incident_key = "troy_mth_exp_griffin_step_5_choice_1_followup_incident",
						faction_overrides_followup_incident_key = {
							troy_amazons_trj_hippolyta = "troy_mth_amazons_exp_griffin_step_5_choice_1_followup_incident",
							troy_amazons_trj_penthesilea = "troy_mth_amazons_exp_griffin_step_5_choice_1_followup_incident",
							troy_rem_horde_aethiopians = "troy_rem_memnon_exp_griffin_step_5_choice_1_followup_incident",
						},
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_griffin_step_4_choice_2_outcome_arimaspoi_retinue", remove = true, },
							{ effect_bundle_key = "troy_mth_exp_griffin_step_5_choice_1_outcome_loyal_arimaspoi", remove = false, },
						},
					},					
					{
						variant_of_option = 2,
						prerequisites = 
						{
						},
						followup_incident_key = "troy_mth_exp_griffin_step_5_choice_2_followup_incident",
						outcomes = 
						{
							{ ancillary_key = "troy_mth_anc_griffin_egg", remove = false, display_text = "dummy_troy_mth_exp_griffin_gained_griffin_egg", panel_text = "campaign_payload_ui_details_description_dummy_troy_mth_exp_griffin_gained_griffin_egg", panel_image = "ui/campaign ui/effect_bundles/fx_icon_ancillary.png"},
							{ effect_bundle_key = "troy_mth_exp_griffin_step_4_choice_2_outcome_arimaspoi_retinue", remove = true, },
							{ effect_bundle_key = "troy_mth_exp_griffin_step_5_arimaspoi_neg_bundle_outcome_uneasy_arimaspoi", remove = false, },
							{ effect_bundle_key = "troy_mth_exp_griffin_step_5_choice_2_outcome_griffin_gold", remove = false, },
						},					
					},
					{
						variant_of_option = 3,
						prerequisites = 
						{
						},
						followup_incident_key = "troy_mth_exp_griffin_step_5_choice_3_followup_incident",
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_griffin_step_4_choice_2_outcome_arimaspoi_retinue", remove = true, },
							{ effect_bundle_key = "troy_mth_exp_griffin_step_5_arimaspoi_neg_bundle_outcome_uneasy_arimaspoi", remove = false, },
							{ effect_bundle_key = "troy_mth_exp_griffin_step_5_choice_3_outcome_high_ground", remove = false, },
						},					
					},
					{
						variant_of_option = 4,
						prerequisites = 
						{
						},
						followup_incident_key = "troy_mth_exp_griffin_step_5_choice_4_followup_incident",
						outcomes = 
						{
							{ effect_bundle_key = "troy_mth_exp_griffin_step_4_choice_2_outcome_arimaspoi_retinue", remove = true, },
							{ effect_bundle_key = "troy_mth_exp_griffin_step_5_arimaspoi_neg_bundle_outcome_uneasy_arimaspoi", remove = false, },
							{ effect_bundle_key = "troy_mth_exp_griffin_step_5_choice_4_outcome_ready", remove = false, },
						},					
					},
				},
			},
		},
	},
}

-- Default home regions per faction. Used for spawning the expedition force from that region when a faction has no home region.
-- A faction would not have a home region if it owns no regions. This makes this entry mandatory for the horde factions.
-- Those are required by a system that is not used in Troy, so in fact those have no meaning and thus could be arbitrary. However, for fullness, provide the start pos regions.
mythic_monsters_expeditions.faction_default_home_region_key = {
	troy_main_dan_achilles = "troy_main_phthia_pteleon",
	troy_main_dan_mycenae = "troy_main_mycenaeca_mycenae",
	troy_main_dan_sparta = "troy_main_lacedaemon_sparta",
	troy_main_dan_ithaca = "troy_main_lacedaemon_sparta",
	troy_main_trj_hector = "troy_main_ide_zeleia",
	troy_main_trj_paris = "troy_main_troas_larisa",
	troy_main_trj_dardania = "troy_main_dardania_dardanos",
	troy_main_trj_lycia = "troy_main_lycia_telmessos",
	troy_amazons_trj_hippolyta = "troy_main_maeandros_anthea",
	troy_amazons_trj_penthesilea = "troy_main_bythynia_procerastis",
	troy_main_dan_salamis = "troy_main_megaris_salamis",
	troy_main_dan_argos = "troy_main_argolis_argos",
	troy_rem_trj_thrace = "troy_main_sintice_berge",
	troy_rem_horde_aethiopians = "troy_main_rhodes_lindos",
}
--[[
Override an faction to hire from premade army bundles instead of individual units in the expedition. Example:
-- key of faction to be overriden
troy_rem_horde_aethiopians = {
-- bundle data
{
	-- record with the title of the bundle
	title = "memnon_expedition_bundle_1",
	-- units in the bundle
	units = {
		-- unit key and count of this unit
		{key = "troy_rem_aeth_nefru_infantry", count = 2},
		{key = "troy_rem_aeth_aethiopian_spearmen", count = 2},
		...
	},
	-- keys of required buildings to unlock the bundle, can be empty
	building_requirements = {
			"troy_rem_aethiopia_horde_main_4",
			...
		},
	-- keys of required technologies to unlock the bundle, can be empty
	research_requirements = {
		"troy_tech_rem_horde_memnon_1_unlocks_yeha",
		...
	},
	-- record with the cost of the bundle
	cost = "troy_rem_aeth_expedition_bundle_1"
},
...
]]
mythic_monsters_expeditions.expedition_army_bundles = {
	troy_rem_horde_aethiopians = {
		{
			title = "memnon_expedition_bundle_1",
			units = {
				{key = "troy_rem_aeth_nefru_infantry", count = 2},
				{key = "troy_rem_aeth_aethiopian_spearmen", count = 2},
				{key = "troy_rem_aeth_aethiopian_tribesmen", count = 3},
				{key = "troy_rem_aeth_aethiopian_hunters", count = 1},
				{key = "troy_rem_aeth_egyptian_slingers", count =  1}
			},
			building_requirements = {},
			research_requirements = {},
			cost = "troy_rem_aeth_expedition_bundle_1"
		},
		{
			title = "memnon_expedition_bundle_2",
			units = {
				{key = "troy_rem_aeth_manfyt_infantry", count = 3},
				{key = "troy_rem_aeth_light_seneny_chariots", count = 1},
				{key = "troy_rem_aeth_irtjet_staff_bearers", count = 3},
				{key = "troy_rem_aeth_aethiopian_archers", count = 2}
			},
			building_requirements = {
				"troy_rem_aethiopia_horde_main_4"
			},
			research_requirements = {},
			cost = "troy_rem_aeth_expedition_bundle_2"
		},
		{
			title = "memnon_expedition_bundle_3",
			units = {
				{key = "troy_rem_aeth_nakhtu_aa_infantry", count = 3},
				{key = "troy_rem_aeth_mem_medjai_warriors", count = 3},
				{key = "troy_rem_aeth_aethiopian_archers", count = 2},
				{key = "troy_rem_aeth_egyptian_archers", count = 1}
			},
			building_requirements = {},
			research_requirements = {
				"troy_tech_rem_horde_memnon_1_unlocks_yeha",
				"troy_tech_rem_horde_memnon_6_unlocks_thebes"
			},
			cost = "troy_rem_aeth_expedition_bundle_3"
		}
	}
}

mythic_monsters_expeditions.view_armies_tooltips = {
	troy_rem_horde_aethiopians = "memnon_expedition_view_armies"
}

mythic_monsters_expeditions.recruitment_status_tooltips = {
	army_available = "recruit_expedition_army_available",
	army_none_selected = "recruit_expedition_army_none_selected",
	army_already_recruited = "recruit_expedition_army_already_recruited",
	army_no_available_armies = "recruit_expedition_army_no_available_armies"
}

mythic_monsters_expeditions.ui = {}
mythic_monsters_expeditions.ui.delay_on_open_quest_battle_mission = 0.6

mythic_monsters_expeditions.ui.army_strength_threshold_medium = 4000
mythic_monsters_expeditions.ui.army_strength_threshold_high = 7500
mythic_monsters_expeditions.ui.starting_army_last_general_tooltip = "troy_mth_last_hero"
mythic_monsters_expeditions.ui.starting_army_last_horde_general_tooltip = "troy_mth_last_horde_hero"
mythic_monsters_expeditions.ui.all_horde_generals_seaborne_tooltip = "troy_mth_all_horde_generals_seaborne"
mythic_monsters_expeditions.ui.start_expedition_inactive_tooltip_invalid_general_or_army = "ui_text_replacements_localised_text_troy_mth_expedition_popup_lackin_general_or_army"
mythic_monsters_expeditions.ui.start_expedition_inactive_tooltip_cant_afford = "ui_text_replacements_localised_text_troy_mth_expedition_popup_lacking_funds"
mythic_monsters_expeditions.ui.start_expedition_confirmation_id = "mythic_monsters_expedition_confirm_start_expedition"
mythic_monsters_expeditions.ui.start_expedition_confirmation_description = "ui_text_replacements_localised_text_troy_mth_confirm_start_expedition_popup"
mythic_monsters_expeditions.ui.abandon_expedition_confirmation_id = "mythic_monsters_expedition_confirm_abandon_expedition"
mythic_monsters_expeditions.ui.abandon_expedition_confirmation_description = "ui_text_replacements_localised_text_troy_mth_confirm_abandon_expedition_popup"
mythic_monsters_expeditions.ui.army_strength_tooltip_level_0 = "ui_text_replacements_localised_text_troy_mth_expedition_army_strength_tooltip_level_0"
mythic_monsters_expeditions.ui.army_strength_tooltip_level_1 = "ui_text_replacements_localised_text_troy_mth_expedition_army_strength_tooltip_level_1"
mythic_monsters_expeditions.ui.army_strength_tooltip_level_2 = "ui_text_replacements_localised_text_troy_mth_expedition_army_strength_tooltip_level_2"
mythic_monsters_expeditions.ui.army_strength_tooltip_level_3 = "ui_text_replacements_localised_text_troy_mth_expedition_army_strength_tooltip_level_3"

mythic_monsters_expeditions.ui.panel = "mythic_expedition"
mythic_monsters_expeditions.ui.background = "background"
mythic_monsters_expeditions.ui.reset_army_container = "container_btn_reset_party"
mythic_monsters_expeditions.ui.abandon_expedition_container = "container_btn_cancel_expedition"
mythic_monsters_expeditions.ui.abandon_expedition_button = "btn_cancel_expedition"
mythic_monsters_expeditions.ui.start_expedition = "container_launch_expedition"
mythic_monsters_expeditions.ui.expedition_effects = "container_expedition_effects"
mythic_monsters_expeditions.ui.current_supply_points = "current_admin_cost"
mythic_monsters_expeditions.ui.expedition_started_before_first_dilemma = "ongoing_expedition_txt"
mythic_monsters_expeditions.ui.dilemma_numbers = "container_elements"
mythic_monsters_expeditions.ui.dilemma_list = "templates"
mythic_monsters_expeditions.ui.dilemma_template = "stage_indicator_template"
mythic_monsters_expeditions.ui.dilemma_template_text = "dy_stage_number"
mythic_monsters_expeditions.ui.dilemma_name = "stage_name"
mythic_monsters_expeditions.ui.dilemma_name_text = "dy_stage_name"
mythic_monsters_expeditions.ui.dilemma_info = "container_stage_info"
mythic_monsters_expeditions.ui.dilemma_description = "dy_stage_flavour"
mythic_monsters_expeditions.ui.dilemma_toggle_choice = "btn_toggle_dilemma_panel"
mythic_monsters_expeditions.ui.dilemma_choice = "container_dilemma_choice"
mythic_monsters_expeditions.ui.dilemma_choice_title = "dy_choice_title"
mythic_monsters_expeditions.ui.dilemma_choice_description = "dy_choice_flavour"
mythic_monsters_expeditions.ui.dilemma_choice_effects = "container_status_effects"
mythic_monsters_expeditions.ui.dilemma_template_outcome = "template_dilemma_outcome"
mythic_monsters_expeditions.ui.dilemma_template_effect_bundle = "template_dilemma_effect_bundle"
mythic_monsters_expeditions.ui.dilemma_template_prefix = "tx_action"
mythic_monsters_expeditions.ui.start_quest_battle = "footer_components"
mythic_monsters_expeditions.ui.start_quest_battle_button = "btn_quest_battle"
mythic_monsters_expeditions.ui.strat_hud_missions_tab = "tab_missions"
mythic_monsters_expeditions.ui.strat_hud_missions_dropdown = "dropdown_missions"
mythic_monsters_expeditions.ui.strat_hud_missions_list = "list_box"
mythic_monsters_expeditions.ui.strat_hud_missions_search_property = "record_key"

mythic_monsters_expeditions.ui.prebattle_panel = "popup_pre_battle"

mythic_monsters_expeditions.ui.call_army_text = "call_for_expedition"

--[[ 
--------------------------------------------------------------
----------- Implementation below. There be dragons! ----------
--------------------------------------------------------------
                          _,-'/-'/
              .      __,-; ,'( '/
               \.    `-.__`-._`:_,-._       _ , . ``
                `:-._,------' ` _,`--` -: `_ , ` ,' :
            hh     `---..__,,--'            ` -'. -'
--]]

mythic_monsters_expeditions.get_monster_data = function(monster_key)
	for _, monster_data in ipairs(mythic_monsters_expeditions.monsters) do
		if monster_data.key == monster_key then
			return monster_data
		end
	end
	return nil
end

mythic_monsters_expeditions.get_monster_dilemma_data_from_dilemma_key = function(dilemma_key, faction_key)
	for _, monster_data in ipairs(mythic_monsters_expeditions.monsters) do
		for index, dilemma in ipairs(monster_data.dilemmas) do
			if dilemma.key == dilemma_key then
				return monster_data, index, dilemma
			end
			if dilemma.faction_overrides_dilemma_key and dilemma.faction_overrides_dilemma_key[faction_key] == dilemma_key then
				return monster_data, index, dilemma
			end	
		end
	end
	return nil
end

mythic_monsters_expeditions.get_mission_key_for_faction_key = function(mission_key, faction_key)
	return mission_key .. "_" .. faction_key
end

mythic_monsters_expeditions.is_mission_monster_mission = function(mission_key, monster_mission_key)
	return mission_key:starts_with(monster_mission_key)
end

mythic_monsters_expeditions.get_monster_key_from_mission_key = function(mission_key)
	for _, monster_data in ipairs(mythic_monsters_expeditions.monsters) do
		if mythic_monsters_expeditions.is_mission_monster_mission(mission_key, monster_data.quest_battle_mission_key) then
			return monster_data.key
		end
	end
	return nil
end

-- This is the data that is being saved.
mythic_monsters_expeditions.factions = {
	--[[ A faction entry has the following structure:
	selected_monster_key = "cerberus",	-- The key of the monster that the faction has selected for hunting.
	-- An entry per monster expedition, in the order they were started.
	{
		monster_key = "cerberus",
		start_turn = 50,
		military_force_cqi = 100,	-- Only valid while a quest battle is active.
		general_family_member_cqi = 351,
		general_unit_supply_points = 2,
		army_units = {	-- An array of unit subtables. Multiple entries if one unit is enlisted multiple times.
			{
				key = "troy_trojan_militia",
				health = 0.8,				-- The health of the unit in the interval [0, 1], where 1 means full health. All units start at full health.
				experience_levels = 1,		-- The experience levels that this unit has gained during the expedition. All units start freshly recruited, so they have gained 0 levels at the start.
				custom_battle_cost = 200,	-- This would be used to determine strongest and weakest among the units.
				supply_points = 1,			-- This is the supply points for keeping the expedition army. Added directly through a script call.
			},
		}
		army_effect_bundles = {}	-- An array of effect bundle keys.
		dilemma_choice_variants = {	-- An array of the choice variants that were given to the player for the dilemma with the same index.
			{ 1, 4, 2, 1 },	-- An array of the choice elements from the monsters table that are the variant for the dilemma choice with the same index.
		}
		dilemma_choices = {}	-- An array of the choices that were made for the dilemma with the same index.
		traits_gained = {}		-- An array of the traits gained during the expedition. Used to remove those from the expedition general if the expedition is abandoned.
		ancillaries_gained = {}	-- An array of the ancillaries gained during the expedition. Used to remove those from the expedition general if the expedition is abandoned.
		permanently_kill_expedition_general_after_quest_battle = true/nil	-- If true, the expedition general would be permanently killed after successfully completing the quest battle.
	},
	-- List with the last turns that an expedition for a given monster was abandoned. Used for deciding whether an event message for abandoned expedition is sent to the other players.
	abandoned_expeditions = { { monster_key = "cerberus", turn = 51, }, },
	--]]
}

mythic_monsters_expeditions.has_faction_data = function(faction_key)
	return mythic_monsters_expeditions.factions[faction_key]
end

mythic_monsters_expeditions.has_expedition_data = function(faction_key, monster_key)
	if not mythic_monsters_expeditions.has_faction_data(faction_key) then return false end
	for _, expedition_data in ipairs(mythic_monsters_expeditions.factions[faction_key]) do
		if expedition_data.monster_key == monster_key then
			return true
		end
	end
	return false
end

mythic_monsters_expeditions.get_selected_monster = function(faction_key)
	return mythic_monsters_expeditions.has_faction_data(faction_key) and mythic_monsters_expeditions.get_faction_data(faction_key).selected_monster_key
end

mythic_monsters_expeditions.set_selected_monster = function(faction_key, monster_key, open_activated_panel)
	local faction_data = mythic_monsters_expeditions.get_faction_data(faction_key)
	faction_data.selected_monster_key = monster_key

	if cm:get_local_faction_name(true) == faction_key then
		if monster_key then
			mythic_monsters_common:activate_expedition_button(faction_key, open_activated_panel)
		else
			mythic_monsters_common:activate_selection_button(faction_key, open_activated_panel)
		end
	end
end

mythic_monsters_expeditions.get_faction_data = function(faction_key)
	-- Ensure that there is a data table for that faction.
	if not mythic_monsters_expeditions.factions[faction_key] then
		mythic_monsters_expeditions.factions[faction_key] = {}
	end
	return mythic_monsters_expeditions.factions[faction_key]
end

mythic_monsters_expeditions.get_expedition_data = function(faction_key, monster_key)
	local faction_data = mythic_monsters_expeditions.get_faction_data(faction_key)
	for _, expedition_data in ipairs(faction_data) do
		if expedition_data.monster_key == monster_key then
			return expedition_data
		end
	end
	-- Ensure that there is a data table for that monster.
	local new_expedition_data = { monster_key = monster_key }
	table.insert(faction_data, new_expedition_data)
	return new_expedition_data
end

mythic_monsters_expeditions.remove_expedition_data = function(faction_key, monster_key)
	if mythic_monsters_expeditions.factions[faction_key] then
		for i, expedition_data in ipairs(mythic_monsters_expeditions.factions[faction_key]) do
			if expedition_data.monster_key == monster_key then
				table.remove(mythic_monsters_expeditions.factions[faction_key], i)
				-- Do not remove the faction's table even if it has 0 indexed members, as it is also containing key-value pairs.
				return
			end
		end
	end
end

mythic_monsters_expeditions.get_expedition_general = function(faction, monster_key)
	local expedition_data = mythic_monsters_expeditions.get_expedition_data(faction:name(), monster_key)
	if not expedition_data.general_family_member_cqi then return nil end
	
	local family_member = faction:model():family_member_for_command_queue_index(expedition_data.general_family_member_cqi)
	if not family_member:is_null_interface() then
		local character = family_member:character()
		return not character:is_null_interface() and character
	end
	return nil
end

mythic_monsters_expeditions.get_expedition_force = function(faction, monster_key)
	local expedition_data = mythic_monsters_expeditions.get_expedition_data(faction:name(), monster_key)
	if not expedition_data.military_force_cqi then return nil end

	local force = faction:model():military_force_for_command_queue_index(expedition_data.military_force_cqi)
	return not force:is_null_interface() and force
end

mythic_monsters_expeditions.add_army_unit = function(faction, army_units, unit_key)
	local model = faction:model()
	local unit_info = model:get_unit_record_info(unit_key)
	if next(unit_info) == nil then out("Mythic Monsters Expeditions: No info for unit with key " .. unit_key) return false end

	local army_unit = { key = unit_key, health = 1, experience_levels = 0, custom_battle_cost = unit_info.custom_battle_cost, supply_points = unit_info.supply_points, }
	table.insert(army_units, army_unit)
	mythic_monsters_expeditions.sort_army_units(army_units)

	local faction_key = faction:name()
	supply_points.update_supply_points_for_faction(faction_key, army_unit.supply_points, supply_points_factors.units)

	cm:reserve_unit_cap(faction_key, unit_key)

	return true
end

mythic_monsters_expeditions.remove_army_unit = function(faction_key, army_units, unit_key)
	for index, army_unit in ipairs(army_units) do
		if army_unit.key == unit_key then
			cm:release_unit_cap(faction_key, unit_key)
			supply_points.update_supply_points_for_faction(faction_key, -army_unit.supply_points, supply_points_factors.units)
			table.remove(army_units, index)
			return true
		end
	end
	return false
end

mythic_monsters_expeditions.remove_army_units_at_0_health = function(faction_key, army_units)
	for i = #army_units, 1, -1 do
		if army_units[i].health <= 0 then
			cm:release_unit_cap(faction_key, army_units[i].key)
			supply_points.update_supply_points_for_faction(faction_key, -army_units[i].supply_points, supply_points_factors.units)
			table.remove(army_units, i)
		end
	end
end

mythic_monsters_expeditions.sort_army_units = function(army_units)
	local army_units_comparison = function(unit1, unit2)
		if unit1.custom_battle_cost == unit2.custom_battle_cost then
			return unit1.key < unit2.key
		end
		return unit1.custom_battle_cost > unit2.custom_battle_cost
	end

	army_units = table_stable_sort(army_units, army_units_comparison, true)
end

mythic_monsters_expeditions.get_army_units_string = function(army_units)
	local army_string = ""
	for index, army_unit in ipairs(army_units) do
		if index > 1 then
			army_string = army_string .. ","
		end
		army_string = army_string .. army_unit.key
	end
	return army_string
end

mythic_monsters_expeditions.get_unit_finder = function(unit_key)
	return function(army_unit) return army_unit.key == unit_key end
end

mythic_monsters_expeditions.update_supply_points_for_expedition = function(faction_key, general_unit_supply_points, army_units, multiplier)
	local army_supply_points = 0
	for _, army_unit in ipairs(army_units) do
		army_supply_points = army_supply_points + army_unit.supply_points
	end
	supply_points.update_supply_points_for_faction(faction_key, army_supply_points * multiplier, supply_points_factors.units)
	supply_points.update_supply_points_for_faction(faction_key, general_unit_supply_points * multiplier, supply_points_factors.characters)
end

mythic_monsters_expeditions.update_unit_caps = function(faction_key, army_units, reserve)
	for _, army_unit in ipairs(army_units) do
		if reserve then
			cm:reserve_unit_cap(faction_key, army_unit.key)
		else
			cm:release_unit_cap(faction_key, army_unit.key)
		end
	end
end

--[[ Overview of the expedition.
On start expedition:
- If expedition general is not leading an army? - Recruit expedition general.
- Add expedition immortality effect bundle to the expedition general, so they can't accidentally die during a failed quest battle.
- Wound expedition general.

On quest battle start:
- Create force with expedition general at faction leader's position.

On quest battle lost or canceled:
- Teleport faction leader back to previous position.
- Wound expedition general.
- Destroy expedition general's army (along with new general).
- Wound expedition general.

On quest battle won
- Teleport faction leader back to previous position.
- Teleport expedition general to faction leader's position.
- Remove expedition immortality effect bundle from expedition general.
- Unlock monster.
- Teleport monster to faction leader's position.
--]]

mythic_monsters_expeditions.start_expedition = function(faction, monster_key, general_family_member_cqi, units)
	local monster_data = mythic_monsters_expeditions.get_monster_data(monster_key)
	if not monster_data then out("Mythic Monsters Expeditions: No data for monster with key " .. monster_key) return end

	if not general_family_member_cqi then
		-- This would allow to call start_expedition without providing a specific general.
		local characters_list = faction:character_list()
		for i = 0, characters_list:num_items() - 1 do
			local character = characters_list:item_at(i)
			if not character:is_faction_leader() and character:character_type("general") then
				general_family_member_cqi = character:family_member():command_queue_index()
				break
			end
		end
	end

	local faction_key = faction:name()
	if not general_family_member_cqi then out("Mythic Monsters Expeditions: Faction " .. faction_key .. " attempts to start an expedition without suitable general!") return end

	local model = faction:model()
	local general_family_member = model:family_member_for_command_queue_index(general_family_member_cqi)
	if general_family_member:is_null_interface() then out("Mythic Monsters Expeditions: Faction " .. faction_key .. " attempts to start an expedition but there is no family member with CQI " .. general_family_member_cqi) return end

	local general = general_family_member:character()
	if general:is_null_interface() then out("Mythic Monsters Expeditions: Faction " .. faction_key .. " attempts to start an expedition but family member with CQI " .. general_family_member_cqi .. " has no character!") return end

	local general_faction_key = general:faction():name()
	if general_faction_key ~= faction_key then out("Mythic Monsters Expeditions: Faction " .. faction_key .. " attempts to start an expedition but the provided family member with CQI " .. general_family_member_cqi .. " belongs to faction " .. general_faction_key) return end
	if not general:character_type("general") then out("Mythic Monsters Expeditions: Faction " .. faction_key .. " attempts to start an expedition but the provided family member with CQI " .. general_family_member_cqi .. " is not a general, but of type " .. general:character_type_key()) return end

	local expedition_data = mythic_monsters_expeditions.get_expedition_data(faction_key, monster_key)
	expedition_data.general_family_member_cqi = general_family_member_cqi

	local general_commanded_unit = general:commanded_unit()
	expedition_data.general_unit_supply_points = general_commanded_unit:is_null_interface() and 0 or general_commanded_unit:supply_points()

	-- Wound the general with convalescence type "old age", so that no wounded event is triggered for them and they do not appear in the character roster.
	-- and temporaily disable admin message events, otherwise it will pop a level down on wound, and then a level up on update_supply_points_for_expedition
	supply_points.set_show_message_events(false)
	cm:wound_character(cm:char_lookup_str(general), 30000, true, true)

	expedition_data.start_turn = faction:model():turn_number()
	expedition_data.dilemma_choice_variants = {}
	expedition_data.dilemma_choices = {}
	expedition_data.traits_gained = {}
	expedition_data.ancillaries_gained = {}
	expedition_data.army_effect_bundles = {}
	expedition_data.army_units = {}
	units = units or mythic_monsters_expeditions.test.default_army_units	-- This would allow to call start_expedition without providing army list.
	for _, unit_key in ipairs(units) do
		mythic_monsters_expeditions.add_army_unit(faction, expedition_data.army_units, unit_key)
	end

	mythic_monsters_expeditions.update_supply_points_for_expedition(faction_key, expedition_data.general_unit_supply_points, {}, 1)
	supply_points.apply_effects_for_faction(faction_key)
	supply_points.ui.update_ui()
	supply_points.set_show_message_events(true)

	if monster_data.start_expedition_event_message then
		mythic_monsters_expeditions.trigger_message_event(faction_key, monster_data.start_expedition_event_message)
	end
end

mythic_monsters_expeditions.trigger_message_event = function(faction_key, event, override_another_faction_key)
	local faction_override_key = override_another_faction_key or faction_key
	local faction_override = event.faction_overrides and event.faction_overrides[faction_key]
	local event_title = faction_override and faction_override.title or event.title
	local event_primary_detail = faction_override and faction_override.primary_detail or event.primary_detail
	local event_secondary_detail = faction_override and faction_override.secondary_detail or event.secondary_detail
	local event_pic = faction_override and faction_override.pic or event.pic

	if event.show_immediately then
		cm:show_message_event(faction_key, event_title, event_primary_detail, event_secondary_detail, true, event_pic, nil, nil, true)
	else
		cm:show_configurable_message_event(faction_key, event_title, event_primary_detail, event_secondary_detail, event_pic)
	end
end

mythic_monsters_expeditions.abandon_expedition = function(faction, monster_key)
	local faction_key = faction:name()
	if mythic_monsters_expeditions.has_expedition_data(faction_key, monster_key) then
		local expedition_data = mythic_monsters_expeditions.get_expedition_data(faction_key, monster_key)
		local turn_number = faction:model():turn_number()
		if turn_number > expedition_data.start_turn then
			-- This is an old expedition, so note it has been abandoned.
			local faction_data = mythic_monsters_expeditions.get_faction_data(faction_key)
			faction_data.abandoned_expeditions = faction_data.abandoned_expeditions or {}
			table.insert(faction_data.abandoned_expeditions, { monster_key = monster_key, turn = turn_number, })
		end

		mythic_monsters_expeditions.update_supply_points_for_expedition(faction_key, expedition_data.general_unit_supply_points, expedition_data.army_units, -1)
		supply_points.apply_effects_for_faction(faction_key)
		supply_points.ui.update_ui()

		mythic_monsters_expeditions.update_unit_caps(faction_key, expedition_data.army_units, false)

		local expedition_general = mythic_monsters_expeditions.get_expedition_general(faction, monster_key)
		if expedition_general then
			for _, trait_key in ipairs(expedition_data.traits_gained) do
				cm:force_remove_trait(cm:char_lookup_str(expedition_general), trait_key, true)
			end

			for _, ancillary_key in ipairs(expedition_data.ancillaries_gained) do
				cm:force_remove_ancillary(cm:char_lookup_str(expedition_general), ancillary_key, false)
			end

			cm:retire_character(cm:char_lookup_str(expedition_general))
		end

		local monster_data = mythic_monsters_expeditions.get_monster_data(monster_key)
		if monster_data and #expedition_data.dilemma_choices >= #monster_data.dilemmas then
			local mission_key = mythic_monsters_expeditions.get_mission_key_for_faction_key(monster_data.quest_battle_mission_key, faction_key)
			cm:cancel_mission(faction_key, mission_key)
		end

		mythic_monsters_expeditions.remove_expedition_data(faction_key, monster_key)
	end

	if mythic_monsters_expeditions.get_selected_monster(faction_key) == monster_key then
		mythic_monsters_expeditions.set_selected_monster(faction_key, nil, true)	-- Clear the monster selection and open the selection panel.
	end
end

mythic_monsters_expeditions.trigger_dilemma = function(faction_key, dilemma, expedition_data)
	local get_unit_finder = function(unit_key)
		return mythic_monsters_expeditions.get_unit_finder(unit_key)
	end

	local variants_given = {}
	local payloads = {}
	for i = 1, 4 do
		local variants = {}
		for j, choice in ipairs(dilemma.choices) do
			if choice.variant_of_option == i then
				table.insert(variants, { index = j, choice = choice, })
			end
		end

		for j, variant in ipairs(variants) do
			local choice = variant.choice
			local restrict = false
			local payload = "payload{"
			local prerequisites = choice.prerequisites or {}
			for _, prerequisite in ipairs(prerequisites) do
				restrict = restrict or (prerequisite.made_choice and prerequisite.made_choice.dilemma_index <= #expedition_data.dilemma_choices and
					((prerequisite.made_choice.choice == expedition_data.dilemma_choices[prerequisite.made_choice.dilemma_index]) ~= not prerequisite.negate))
				restrict = restrict or (prerequisite.have_unit_key and (not table_find(expedition_data.army_units, get_unit_finder(prerequisite.have_unit_key)) == not prerequisite.negate))
				restrict = restrict or (prerequisite.have_effect_bundle_key and (table_contains(expedition_data.army_effect_bundles, prerequisite.have_effect_bundle_key) ~= not prerequisite.negate))
				if restrict then
					payload = payload .. "impossible; text_display{ lookup " .. prerequisite.restricted_display_text .. ";}"
					break
				end
			end
			payload = payload .. "}"

			if not restrict or j >= #variants then
				table.insert(variants_given, variant.index)
				table.insert(payloads, payload)
				break
			end
		end
	end

	table.insert(expedition_data.dilemma_choice_variants, variants_given)

	if #payloads < 2 or #payloads > 4 then
		out("Mythic Monsters Expeditions: Dilemma " .. dilemma.key .. " for monster " .. monster_data.key .. " has invalid number of choices: " .. #payloads)
		return
	end

	local payload1, payload2, payload3, payload4 = unpack(payloads)
	local dilemma_key = dilemma.key

	if dilemma.faction_overrides_dilemma_key and dilemma.faction_overrides_dilemma_key[faction_key] then
		dilemma_key = dilemma.faction_overrides_dilemma_key[faction_key]
	end

	cm:trigger_custom_dilemma(faction_key, dilemma_key, payload1, payload2, payload3, payload4)
	core:trigger_event("ScriptEventMythicExpeditionDilemma")
end

mythic_monsters_expeditions.get_create_force_callback = function(expedition_data)
	local callback = function(expedition_general_cqi)
		local expedition_general = cm:get_character_by_cqi(expedition_general_cqi)
		if not expedition_general then out("Mythic Monsters Expeditions: create force callback called with non existing character with CQI " .. tostring(expedition_general_cqi)) return end
		if not expedition_general:has_military_force() then out("Mythic Monsters Expeditions: create force callback called with character with no military force with CQI" .. tostring(expedition_general_cqi)) return end

		local expedition_force = expedition_general:military_force()
		expedition_data.military_force_cqi = expedition_force:command_queue_index()
		cm:character_forced_invisible(cm:char_lookup_str(expedition_general), true)
		-- Make the expedition general immortal, so that it is impossible for them to truly die in a failed attempt for the quest battle.
		cm:set_character_immortality(cm:char_lookup_str(expedition_general), true)
		
		for _, effect_bundle_key in ipairs(expedition_data.army_effect_bundles) do
			cm:apply_effect_bundle_to_force(effect_bundle_key, expedition_data.military_force_cqi, 0)	-- Infinite duration. Would be removed upon the successful completion of the quest battle.
		end

		local units_list = expedition_force:unit_list()
		local units_list_count = units_list:num_items() - 1	-- Subtract one because of the general's unit.
		if units_list_count ~= #expedition_data.army_units then
			out("Mythic Monsters Expeditions: create force callback called with military force with " .. tostring(units_list_count) .. " number of units, where they should be " .. tostring(#expedition_data.army_units))
		end

		-- Apply health and experience levels effects to the units.
		-- Note that the units in the military force's list are in a different order than the one in the army units list of the expedition data.
		-- Therefore create a multimap of the units by unit key, then go through the army units list and apply the effects.
		-- This should be MP-safe, as the iteration order is deterministic, based on the army units list.
		local units = {}
		for i = 1, units_list_count do	-- Skip the first unit, as that is the general's unit. The 1 offset because of the 0-based counting is already subtracted from units_list_count.
			local unit = units_list:item_at(i)
			local unit_key = unit:unit_key()
			units[unit_key] = units[unit_key] or {}
			table.insert(units[unit_key], unit)
		end
		local previous_unit_key, same_unit_key_index = "", 1
		for _, army_unit in ipairs(expedition_data.army_units) do
			same_unit_key_index = previous_unit_key == army_unit.key and same_unit_key_index + 1 or 1
			previous_unit_key = army_unit.key
			local unit = units[army_unit.key][same_unit_key_index]

			if army_unit.health < 1 then
				cm:change_unit_health(unit:command_queue_index(), army_unit.health - 1)
			end

			if army_unit.experience_levels >= 1 then
				cm:add_experience_to_unit(unit:command_queue_index(), army_unit.experience_levels)
			end
		end
		
		supply_points.apply_effects_for_faction(expedition_general:faction():name())
		supply_points.ui.update_ui()
	end

	return callback
end

-- Add all non-UI listeners.
core:add_listener(
	"monster_expeditions_faction_turn_start",
	"FactionTurnStart",
	true,
	function(context)
		local faction = context:faction()
		local faction_key = faction:name()
		local turn_number = faction:model():turn_number()
		if turn_number == mythic_monsters_expeditions.unlock_turn and mythic_monsters_expeditions.unlock_event_message and faction:is_human() then
			mythic_monsters_expeditions.trigger_message_event(faction_key, mythic_monsters_expeditions.unlock_event_message)
		end

		if not mythic_monsters_expeditions.has_faction_data(faction_key) then return end

		local faction_data = mythic_monsters_expeditions.get_faction_data(faction_key)
		for _, expedition_data in ipairs(faction_data) do
			local monster_data = mythic_monsters_expeditions.get_monster_data(expedition_data.monster_key)
			local expedition_turns = turn_number - expedition_data.start_turn
			local index = expedition_turns / mythic_monsters_expeditions.turns_until_next_dilemma
			local dilemma = monster_data.dilemmas[index]
			if dilemma then
				mythic_monsters_expeditions.trigger_dilemma(faction_key, dilemma, expedition_data)
			end
		end
	end,
	true
)

core:add_listener(
	"monster_expeditions_faction_turn_end",
	"FactionTurnEnd",
	true,
	function(context)
		local faction = context:faction()
		local faction_key = faction:name()
		if not mythic_monsters_expeditions.has_faction_data(faction_key) then return end

		local other_human_faction_keys = cm:get_human_factions()
		table_erase(other_human_faction_keys, faction_key)
		if #other_human_faction_keys <= 0 then return end

		local turn_number = faction:model():turn_number()
		local restarted_expeditions = {}
		local faction_data = mythic_monsters_expeditions.get_faction_data(faction_key)
		-- Send event messages for expeditions abandoned on that turn.
		if is_table(faction_data.abandoned_expeditions) then
			for i = #faction_data.abandoned_expeditions, 1, -1 do
				local abandoned_expedition = faction_data.abandoned_expeditions[i]
				if turn_number > abandoned_expedition.turn then
					break	-- The remaining expeditions were abandoned on earlier turns and should be already handled.
				end

				if mythic_monsters_expeditions.has_expedition_data(faction_key, abandoned_expedition.monster_key) then
					table.insert(restarted_expeditions, abandoned_expedition.monster_key)
				else
					local monster_data = mythic_monsters_expeditions.get_monster_data(abandoned_expedition.monster_key)
					for _, other_human_faction_key in ipairs(other_human_faction_keys) do
						if monster_data.another_player_abandon_expedition_event_message then
							mythic_monsters_expeditions.trigger_message_event(other_human_faction_key, monster_data.another_player_abandon_expedition_event_message, faction_key)
						end
					end
				end
			end
		end

		-- Send event messages for expeditions started on that turn.
		for _, expedition_data in ipairs(faction_data) do
			if turn_number <= expedition_data.start_turn and not table_contains(restarted_expeditions, expedition_data.monster_key) then
				-- This is a new expedition, started on this turn. Clear the selected state for other factions and send an event message.
				local monster_data = mythic_monsters_expeditions.get_monster_data(expedition_data.monster_key)
				for __, other_human_faction_key in ipairs(other_human_faction_keys) do
					if mythic_monsters_expeditions.get_selected_monster(other_human_faction_key) == expedition_data.monster_key then
						mythic_monsters_expeditions.set_selected_monster(other_human_faction_key, nil)	-- Clear the monster selection.
					end
					if monster_data.another_player_start_expedition_event_message then
						mythic_monsters_expeditions.trigger_message_event(other_human_faction_key, monster_data.another_player_start_expedition_event_message, faction_key)
					end
				end
			end
		end
	end,
	true
)

core:add_listener(
	"monster_expeditions_dilemma_choice_made_event",
	"DilemmaChoiceMadeEvent",
	true,
	function(context)
		local faction = context:faction()
		local faction_key = faction:name()
		local monster_data, dilemma_index, dilemma_data = mythic_monsters_expeditions.get_monster_dilemma_data_from_dilemma_key(context:dilemma(), faction_key)
		if not monster_data then return end

		local monster_key = monster_data.key
		if not mythic_monsters_expeditions.has_expedition_data(faction_key, monster_key) then out("Mythic Monsters Expeditions: Faction " .. faction_key .. " has no expedition data for monster " .. monster_key) return end

		local choice = context:choice() + 1	-- As the choice provided is 0-based, offset by one, so it is 1-based.
		local expedition_data = mythic_monsters_expeditions.get_expedition_data(faction_key, monster_key)
		table.insert(expedition_data.dilemma_choices, choice)

		if not expedition_data.dilemma_choice_variants[dilemma_index] or not expedition_data.dilemma_choice_variants[dilemma_index][choice] then
			 out("Mythic Monsters Expeditions: Expedition of faction " .. faction_key .. " for monster " .. monster_key .. " has no variants for dilemma " .. tostring(dilemma_index) .. " for choice " .. tostring(choice))
			 return
		end

		choice = expedition_data.dilemma_choice_variants[dilemma_index][choice]

		local expedition_general = nil	-- Do a lazy get for the general.
		local payload = "payload{"
		local outcomes = dilemma_data.choices[choice].outcomes or {}
		for _, outcome in ipairs(outcomes) do
			if outcome.display_text then
				payload = payload .. " text_display{ lookup " .. outcome.display_text .. ";}"
			end

			if outcome.trait_key then
				expedition_general = expedition_general or mythic_monsters_expeditions.get_expedition_general(faction, monster_key)
				if not expedition_general then out("Mythic Monsters Expeditions: Faction " .. faction_key .. " has no expedition general for monster " .. monster_key) break end

				if outcome.remove then
					--payload = payload .. " remove_trait {cqi " .. expedition_general:command_queue_index() .. "; trait " .. outcome.trait_key .. ";}"
					cm:force_remove_trait(cm:char_lookup_str(expedition_general), outcome.trait_key, true)
					table_erase(expedition_data.traits_gained, outcome.trait_key)
				else
					--payload = payload .. " give_trait {cqi " .. expedition_general:command_queue_index() .. "; trait " .. outcome.trait_key .. ";}"
					cm:force_add_trait(cm:char_lookup_str(expedition_general), outcome.trait_key, true, outcome.points or 1)
					table_add_unique(expedition_data.traits_gained, outcome.trait_key)
				end

			elseif outcome.ancillary_key then
				expedition_general = expedition_general or mythic_monsters_expeditions.get_expedition_general(faction, monster_key)
				if not expedition_general then out("Mythic Monsters Expeditions: Faction " .. faction_key .. " has no expedition general for monster " .. monster_key) break end

				if outcome.remove then
					--payload = payload .. " remove_ancillary {cqi " .. expedition_general:command_queue_index() .. "; ancillary " .. outcome.ancillary_key .. ";}"
					cm:force_remove_ancillary(cm:char_lookup_str(expedition_general), outcome.ancillary_key, false)
					table_erase(expedition_data.ancillaries_gained, outcome.ancillary_key)
				else
					--payload = payload .. " add_ancillary {cqi " .. expedition_general:command_queue_index() .. "; ancillary " .. outcome.ancillary_key .. ";}"
					cm:force_add_and_equip_ancillary(cm:char_lookup_str(expedition_general), outcome.ancillary_key)
					table_add_unique(expedition_data.ancillaries_gained, outcome.ancillary_key)
				end

			elseif outcome.effect_bundle_key then
				if outcome.remove then
					table_erase(expedition_data.army_effect_bundles, outcome.effect_bundle_key)
				else
					payload = payload .. " effect_bundle {bundle_key " .. outcome.effect_bundle_key .. "; turns 0; skip_apply;}"
					table_add_unique(expedition_data.army_effect_bundles, outcome.effect_bundle_key)
				end
				
			elseif outcome.unit_key and outcome.units_amount >= 1 then
				for i = 1, outcome.units_amount do
					if outcome.remove then
						mythic_monsters_expeditions.remove_army_unit(faction_key, expedition_data.army_units, outcome.unit_key)
					else
						mythic_monsters_expeditions.add_army_unit(faction, expedition_data.army_units, outcome.unit_key)
					end
				end
				supply_points.apply_effects_for_faction(faction_key)
				supply_points.ui.update_ui()

			elseif outcome.health and outcome.units_amount >= 1 then
				for i = 1, math.min(outcome.units_amount, #expedition_data.army_units) do
					local index = outcome.strength_order_ascending and (#expedition_data.army_units - i + 1) or i
					expedition_data.army_units[index].health = math.min(expedition_data.army_units[index].health + outcome.health, 1)
				end
				mythic_monsters_expeditions.remove_army_units_at_0_health(faction_key, expedition_data.army_units)
				supply_points.apply_effects_for_faction(faction_key)
				supply_points.ui.update_ui()

			elseif outcome.experience_levels and outcome.units_amount >= 1 then
				for i = 1, math.min(outcome.units_amount, #expedition_data.army_units) do
					local index = outcome.strength_order_ascending and (#expedition_data.army_units - i + 1) or i
					expedition_data.army_units[index].experience_levels = expedition_data.army_units[index].experience_levels + outcome.experience_levels
				end
			elseif outcome.permanently_kill_expedition_general_after_quest_battle then
				expedition_data.permanently_kill_expedition_general_after_quest_battle = true
			end
		end
		payload = payload .. "}"

		if dilemma_data.choices[choice] and dilemma_data.choices[choice].followup_incident_key then
			local followup_incident_key = dilemma_data.choices[choice].followup_incident_key

			if dilemma_data.choices[choice].faction_overrides_followup_incident_key and dilemma_data.choices[choice].faction_overrides_followup_incident_key[faction_key] then
				followup_incident_key = dilemma_data.choices[choice].faction_overrides_followup_incident_key[faction_key]
			end

			cm:trigger_custom_incident(faction_key, followup_incident_key, true, payload)
		end

		-- If this was the last dilemma of the expedition, start the quest battle mission.
		if dilemma_index >= #monster_data.dilemmas then
			local mission_key = mythic_monsters_expeditions.get_mission_key_for_faction_key(monster_data.quest_battle_mission_key, faction_key)
			cm:trigger_mission(faction_key, mission_key, false)	-- Do not fire immediately, so that the followup incident is shown first.
			core:trigger_event("ScriptEventQuestBattleReached", faction_key, mission_key)
		end
	end,
	true
)

core:add_listener(
	"monster_expeditions_faction_pre_teleport_and_initiate_quest_battle",
	"FactionPreTeleportAndInitiateQuestBattle",
	true,
	function(context)
		local monster_key = mythic_monsters_expeditions.get_monster_key_from_mission_key(context:mission():mission_record_key())		
		if not monster_key then return end

		cm:take_shroud_snapshot(true)
	end,
	true
)

core:add_listener(
	"monster_expeditions_faction_initiated_quest_battle",
	"FactionInitiatedQuestBattle",
	true,
	function(context)
		local monster_key = mythic_monsters_expeditions.get_monster_key_from_mission_key(context:mission():mission_record_key())		
		if not monster_key then return end

		local main_character = context:character()
		local faction = main_character:faction()
		local faction_key = faction:name()
		if not mythic_monsters_expeditions.has_expedition_data(faction_key, monster_key) then out("Mythic Monsters Expeditions: Faction " .. faction_key .. " has no expedition data for monster " .. monster_key) return end

		local monster_data = mythic_monsters_expeditions.get_monster_data(monster_key)
		cm:make_region_visible_in_shroud(faction_key, monster_data.quest_battle_region_key)

		local expedition_general = mythic_monsters_expeditions.get_expedition_general(faction, monster_key)
		if not expedition_general then out("Mythic Monsters Expeditions: Faction " .. faction_key .. " has no expedition general for monster " .. monster_key) return end

		local x, y = cm:find_valid_spawn_location_for_character_from_character(faction_key, cm:char_lookup_str(main_character), true)
		if x ~= -1 and y ~= -1 then
			local expedition_data = mythic_monsters_expeditions.get_expedition_data(faction_key, monster_key)
			-- NOTE: Because of the way that the supply points listeners are written, the units would not add to the supply points, therefore do not subtract them.
			mythic_monsters_expeditions.update_supply_points_for_expedition(faction_key, expedition_data.general_unit_supply_points, {}, -1)
			--mythic_monsters_expeditions.update_supply_points_for_expedition(faction_key, expedition_data.general_unit_supply_points, expedition_data.army_units, -1)

			mythic_monsters_expeditions.update_unit_caps(faction_key, expedition_data.army_units, false)

			local region_key = faction:has_home_region() and faction:home_region():name() or mythic_monsters_expeditions.faction_default_home_region_key[faction_key]
			if not region_key then out("Mythic Monsters Expeditions: Faction " .. faction_key .. " has no suitable (home) region to spawn the expedition force from") return end

			local army_units_string = mythic_monsters_expeditions.get_army_units_string(expedition_data.army_units)
			local callback = mythic_monsters_expeditions.get_create_force_callback(expedition_data)
			cm:create_force_with_existing_general(cm:char_lookup_str(expedition_general), faction_key, army_units_string, region_key, x, y, callback)
		end
	end,
	true
)

core:add_listener(
	"monster_expeditions_battle_starts_event",
	"BattleStartsEvent",
	true,
	function(context)
		local set_piece_battle_key = cm:model():pending_battle():set_piece_battle_key()
		if set_piece_battle_key ~= "" then
			for _, monster_data in ipairs(mythic_monsters_expeditions.monsters) do
				if set_piece_battle_key == monster_data.quest_battle_set_piece_battle_key then
					common.set_custom_loading_screen_key(monster_data.quest_battle_loading_screen_key)
					break
				end
			end
		end
	end,
	true
)

core:add_listener(
	"monster_expeditions_faction_completed_quest_battle",
	"FactionCompletedQuestBattle",
	true,
	function(context)
		local mission = context:mission()
		local monster_key = mythic_monsters_expeditions.get_monster_key_from_mission_key(context:mission():mission_record_key())		
		if not monster_key then return end

		cm:callback(function() cm:restore_shroud_from_snapshot() end, 0.2)	-- For some reason, restoring the shroud right away is not working. So call it with some delay.

		if mission:succeeded() then return end	-- This case is handled by the mission succeeded event handler.

		local faction = context:faction()
		local faction_key = faction:name()
		if not mythic_monsters_expeditions.has_expedition_data(faction_key, monster_key) then out("Mythic Monsters Expeditions: Faction " .. faction_key .. " has no expedition data for monster " .. monster_key) return end

		local expedition_data = mythic_monsters_expeditions.get_expedition_data(faction_key, monster_key)
		local expedition_force = mythic_monsters_expeditions.get_expedition_force(faction, monster_key)
		expedition_data.military_force_cqi= nil	-- This would no longer be needed, as the expedition force would be regenerated on a subsequent quest battle attempt.
		-- suppress administration level change message events
		supply_points.set_show_message_events(false)
		if expedition_force and not expedition_force:is_null_interface() then
			-- Destroy the non-general units first, so that the force gets destroyed upon wounding the general.
			local general = expedition_force:general_character()
			local general_unit = general:commanded_unit()
			local general_unit_cqi = not general_unit:is_null_interface() and general_unit:command_queue_index() or 0
			local units_list = expedition_force:unit_list()
			for i = 0, units_list:num_items() - 1 do
				local unit_cqi = units_list:item_at(i):command_queue_index()
				if unit_cqi ~= general_unit_cqi then
					cm:remove_unit_by_cqi(unit_cqi)
				end
			end

			if general:family_member():command_queue_index() ~= expedition_data.general_family_member_cqi then
				-- The expedition general was wounded during the battle, so this is a substituting colonel. Kill them.
				cm:kill_character_and_commanded_unit(cm:char_lookup_str(general), true)
			end
		end

		local expedition_general = mythic_monsters_expeditions.get_expedition_general(faction, monster_key)
		if expedition_general then
			cm:set_character_immortality(cm:char_lookup_str(expedition_general), false)	-- Make the expedition general mortal again.

			-- The expedition general is alive, so wound them right away.
			cm:wound_character(cm:char_lookup_str(expedition_general), 30000, true, true)
		end

		-- Add back the supply points for the expedition force.
		mythic_monsters_expeditions.update_supply_points_for_expedition(faction_key, expedition_data.general_unit_supply_points, expedition_data.army_units, 1)
		mythic_monsters_expeditions.update_unit_caps(faction_key, expedition_data.army_units, true)
		supply_points.apply_effects_for_faction(faction_key)
		supply_points.ui.update_ui()
		-- re-enable administration level change message events
		supply_points.set_show_message_events(true)
	end,
	true
)

core:add_listener(
	"monster_expeditions_mission_succeeded",
	"MissionSucceeded",
	true,
	function(context)
		local monster_key = mythic_monsters_expeditions.get_monster_key_from_mission_key(context:mission():mission_record_key())		
		if not monster_key then return end

		local faction = context:faction()
		local faction_key = faction:name()
		if not mythic_monsters_expeditions.has_expedition_data(faction_key, monster_key) then out("Mythic Monsters Expeditions: Faction " .. faction_key .. " has no expedition data for monster " .. monster_key) return end

		local expedition_force = mythic_monsters_expeditions.get_expedition_force(faction, monster_key)
		if expedition_force and not expedition_force:is_null_interface() then
			local x, y = -1, -1
			local faction_leader = faction:has_faction_leader() and faction:faction_leader()
			faction_leader = faction_leader and not faction_leader:is_null_interface() and faction_leader
			if faction_leader and faction_leader:has_military_force() then
				x, y = cm:find_valid_spawn_location_for_character_from_character(faction_key, cm:char_lookup_str(faction_leader), true)
			elseif faction:has_home_region() then
				x, y = cm:find_valid_spawn_location_for_character_from_settlement(faction_key, faction:home_region():name(), false, true)
			else
				-- Find any of the active armies of the faction.
				local military_forces = faction:military_force_list()
				if military_forces:num_items() <= 0 then
					out("There was no suitable force or region to teleport the expedition force next to!")
					return false
				end
				local military_force = military_forces:item_at(0)
				local general = military_force:has_general() and military_force:general_character()
				if not general or general:is_null_interface() then
					out("There was no suitable force or region to teleport the expedition force next to!")
					return false
				end
				x, y = cm:find_valid_spawn_location_for_character_from_character(faction_key, cm:char_lookup_str(general), true)
			end

			if x ~= -1 and y ~= -1 then
				local general = expedition_force:general_character()
				cm:teleport_to(cm:char_lookup_str(general), x, y)
			end

			local expedition_data = mythic_monsters_expeditions.get_expedition_data(faction_key, monster_key)
			local expedition_force_cqi = expedition_force:command_queue_index()
			-- Remove the expedition effect bundles from the expedition force, as it is now becoming a normal army.
			for _, effect_bundle_key in ipairs(expedition_data.army_effect_bundles) do
				cm:remove_effect_bundle_from_force(effect_bundle_key, expedition_force_cqi)
			end
			-- Add the post quest battle effect bundles to the expedition force.
			for _, effect_bundle in ipairs(mythic_monsters_expeditions.post_quest_battle_expedition_force_effect_bundles) do
				cm:apply_effect_bundle_to_force(effect_bundle.key, expedition_force_cqi, effect_bundle.turns)
			end
		end

		local expedition_general = mythic_monsters_expeditions.get_expedition_general(faction, monster_key)
		if expedition_general then
			local expedition_general_lookup_str = cm:char_lookup_str(expedition_general)
			cm:set_character_immortality(expedition_general_lookup_str, false)	-- Make the expedition general mortal again.
			cm:character_forced_invisible(expedition_general_lookup_str, false)

			local expedition_data = mythic_monsters_expeditions.get_expedition_data(faction_key, monster_key)
			if expedition_data.permanently_kill_expedition_general_after_quest_battle then
				-- Ensure that the general is not immortal.
				cm:set_character_immortality(expedition_general_lookup_str, false)
				cm:set_ignore_immortality_by_trait(expedition_general_lookup_str, true)
				cm.get_game_interface():kill_character_and_commanded_unit(expedition_general_lookup_str, false)
			end
		end

		-- Delete all the data related to the expedition, as it won't be used anymore.
		mythic_monsters_expeditions.remove_expedition_data(faction_key, monster_key)
		mythic_monsters_expeditions.set_selected_monster(faction_key, nil)	-- Clear the monster selection.

		-- Unlock the monster in the campaign.
		local monster_data = mythic_monsters_expeditions.get_monster_data(monster_key)
		local monster_id = mythic_monsters_common:monster_key_to_id(monster_data.key)
		mythic_monsters_common:unlock_monster(monster_id, faction_key)

		achievements.monsters.func_monster_quest_battle_completed(faction)
		achievements.monsters.func_monster_captured(faction, monster_key)
	end,
	true
)

mythic_monsters_expeditions.ui.activate_selection_or_expedition_buttons = function(faction_key)
	for _, monster_data in ipairs(mythic_monsters_expeditions.monsters) do
		if mythic_monsters_common:is_monster_unlocked(mythic_monsters_common:monster_key_to_id(monster_data.key), faction_key) then
			return	-- A monster is already unlocked, so do nothing here.
		end
	end

	local monster_key = mythic_monsters_expeditions.get_selected_monster(faction_key)
	if monster_key then
		mythic_monsters_common:activate_expedition_button(faction_key)
	elseif cm:model():turn_number() >= mythic_monsters_expeditions.unlock_turn then
		mythic_monsters_common:activate_selection_button(faction_key)
	end
end

-- These are used to store templates, as those could be used multiple times through the lifespan of the panel.
mythic_monsters_expeditions.ui.templates = {}
mythic_monsters_expeditions.ui.templates.dilemma_outcome = nil
mythic_monsters_expeditions.ui.templates.dilemma_effect_bundle = nil

mythic_monsters_expeditions.ui.panel_open = function(context)
	local faction_key = cm:get_local_faction_name(true)
	local monster_key = mythic_monsters_expeditions.get_selected_monster(faction_key)
	if not monster_key then out("Mythic Monsters Expeditions: Faction " .. faction_key .. " has no selected monster upon opening the expedition panel!") return end

	local ui_config = {}
	ui_config.starting_army_units_min = mythic_monsters_expeditions.starting_army_units_min
	ui_config.starting_army_units_max = mythic_monsters_expeditions.starting_army_units_max
	ui_config.starting_army_restricted_units = mythic_monsters_expeditions.starting_army_restricted_units
	ui_config.army_strength_threshold_medium = mythic_monsters_expeditions.ui.army_strength_threshold_medium
	ui_config.army_strength_threshold_high = mythic_monsters_expeditions.ui.army_strength_threshold_high
	ui_config.start_expedition_inactive_tooltip_invalid_general_or_army = mythic_monsters_expeditions.ui.start_expedition_inactive_tooltip_invalid_general_or_army
	ui_config.start_expedition_inactive_tooltip_cant_afford = mythic_monsters_expeditions.ui.start_expedition_inactive_tooltip_cant_afford
	ui_config.start_expedition_confirmation_id = mythic_monsters_expeditions.ui.start_expedition_confirmation_id
	ui_config.start_expedition_confirmation_description = mythic_monsters_expeditions.ui.start_expedition_confirmation_description
	ui_config.army_strength_tooltip_level_0 = mythic_monsters_expeditions.ui.army_strength_tooltip_level_0
	ui_config.army_strength_tooltip_level_1 = mythic_monsters_expeditions.ui.army_strength_tooltip_level_1
	ui_config.army_strength_tooltip_level_2 = mythic_monsters_expeditions.ui.army_strength_tooltip_level_2
	ui_config.army_strength_tooltip_level_3 = mythic_monsters_expeditions.ui.army_strength_tooltip_level_3

	local ui_context = UIComponent(context.component)
	ui_context:InterfaceFunction("initialise_panel_generic", ui_config)

	-- Set the state, then renotify the sound system of the panel open event again in order to properly trigger the sounds for the monster states.
	ui_context:SetState(monster_key)
	ui_context:InterfaceFunction("renotify_sound_panel_open")

	local component_background = ui_context:SequentialFind(mythic_monsters_expeditions.ui.background)
	if component_background then
		component_background:SetState(monster_key)
	end	

	local component_choice_effects = ui_context:SequentialFind(mythic_monsters_expeditions.ui.dilemma_choice_effects)
	if component_choice_effects then
		mythic_monsters_expeditions.ui.templates.dilemma_outcome = component_choice_effects:SequentialFind(mythic_monsters_expeditions.ui.dilemma_template_outcome)
		if mythic_monsters_expeditions.ui.templates.dilemma_outcome then
			component_choice_effects:Divorce(mythic_monsters_expeditions.ui.templates.dilemma_outcome:Address())
		end
		mythic_monsters_expeditions.ui.templates.dilemma_effect_bundle = component_choice_effects:SequentialFind(mythic_monsters_expeditions.ui.dilemma_template_effect_bundle)
		if mythic_monsters_expeditions.ui.templates.dilemma_effect_bundle then
			component_choice_effects:Divorce(mythic_monsters_expeditions.ui.templates.dilemma_effect_bundle:Address())
		end
	end

	if mythic_monsters_expeditions.has_expedition_data(faction_key, monster_key) then
		mythic_monsters_expeditions.ui.panel_open_undergoing_expedition(ui_context, faction_key, monster_key)
	else
		mythic_monsters_expeditions.ui.panel_open_prepare_expedition(ui_context, faction_key, monster_key)
	end

	core:add_listener(
		"mythic_monsters_expeditions_component_lclick",
		"ComponentLClickUp",
		true,
		mythic_monsters_expeditions.ui.on_lclick,
		true
	)

	core:add_listener(
		"mythic_monsters_expeditions_panel_closed",
		"PanelClosedCampaign",
		function(context) return context.string == mythic_monsters_expeditions.ui.panel end,
		function(context)
			core:remove_listener("mythic_monsters_expeditions_component_lclick")

			if mythic_monsters_expeditions.ui.templates.dilemma_outcome then
				mythic_monsters_expeditions.ui.templates.dilemma_outcome:Destroy()
			end
			mythic_monsters_expeditions.ui.templates.dilemma_outcome = nil

			if mythic_monsters_expeditions.ui.templates.dilemma_effect_bundle then
				mythic_monsters_expeditions.ui.templates.dilemma_effect_bundle:Destroy()
			end
			mythic_monsters_expeditions.ui.templates.dilemma_effect_bundle = nil
		end,
		false
	)
end

mythic_monsters_expeditions.ui.panel_open_prepare_expedition = function(ui_context, faction_key, monster_key)
	local monster_data = mythic_monsters_expeditions.get_monster_data(monster_key)
	local ui_config = {}
	ui_config.starting_army_restricted_generals = monster_data.starting_army_restricted_generals or {}
	ui_config.starting_army_restricted_general_tooltip = monster_data.starting_army_restricted_general_tooltip or ""
	ui_config.starting_army_last_general_tooltip = mythic_monsters_expeditions.ui.starting_army_last_general_tooltip or ""
	ui_config.starting_army_last_horde_general_tooltip = mythic_monsters_expeditions.ui.starting_army_last_horde_general_tooltip or ""
	ui_config.all_horde_generals_seaborne_tooltip = mythic_monsters_expeditions.ui.all_horde_generals_seaborne_tooltip or ""
	ui_config.expedition_army_bundles = mythic_monsters_expeditions.expedition_army_bundles[faction_key] or {}
	ui_config.view_armies_tooltip = mythic_monsters_expeditions.view_armies_tooltips[faction_key] or ""
	ui_config.recruitment_status_tooltips = mythic_monsters_expeditions.recruitment_status_tooltips or {}
	ui_config.call_army_text = mythic_monsters_expeditions.ui.call_army_text or ""
	ui_context:InterfaceFunction("initialise_panel_prepare_expedition", ui_config)

	-- Hide components that are used by the undergoing expedition state.
	local component_current_supply_points = ui_context:SequentialFind(mythic_monsters_expeditions.ui.current_supply_points)
	if component_current_supply_points then
		component_current_supply_points:SetVisible(false)
	end
	local component_dilemma_numbers = ui_context:SequentialFind(mythic_monsters_expeditions.ui.dilemma_numbers)
	if component_dilemma_numbers then
		component_dilemma_numbers:SetVisible(false)
	end
	local component_dilemma_name = ui_context:SequentialFind(mythic_monsters_expeditions.ui.dilemma_name)
	if component_dilemma_name then
		component_dilemma_name:SetVisible(false)
	end
	local component_dilemma_info = ui_context:SequentialFind(mythic_monsters_expeditions.ui.dilemma_info)
	if component_dilemma_info then
		component_dilemma_info:SetVisible(false)
	end
	local component_start_quest_battle = ui_context:SequentialFind(mythic_monsters_expeditions.ui.start_quest_battle)
	if component_start_quest_battle then
		component_start_quest_battle:SetVisible(false)
	end
end

mythic_monsters_expeditions.ui.panel_open_undergoing_expedition = function(ui_context, faction_key, monster_key)
	local monster_data, expedition_data = mythic_monsters_expeditions.get_monster_data(monster_key), mythic_monsters_expeditions.get_expedition_data(faction_key, monster_key)
	local ui_config = {}
	ui_config.expedition_data = expedition_data
	ui_context:InterfaceFunction("initialise_panel_undergoing_expedition", ui_config)

	-- Hide components that are used by the prepare expedition state.
	local component_reset_army_container = ui_context:SequentialFind(mythic_monsters_expeditions.ui.reset_army_container)
	if component_reset_army_container then
		component_reset_army_container:SetVisible(false)
	end
	local component_start_expedition = ui_context:SequentialFind(mythic_monsters_expeditions.ui.start_expedition)
	if component_start_expedition then
		component_start_expedition:SetVisible(false)
	end

	-- Show and configure components that are used by the undergoing expedition state.
	local component_abandon_expedition_container = ui_context:SequentialFind(mythic_monsters_expeditions.ui.abandon_expedition_container)
	if component_abandon_expedition_container then
		component_abandon_expedition_container:SetVisible(true)
	end
	local component_expedition_effects = ui_context:SequentialFind(mythic_monsters_expeditions.ui.expedition_effects)
	if component_expedition_effects then
		component_expedition_effects:SetVisible(true)
	end
	local component_current_supply_points = ui_context:SequentialFind(mythic_monsters_expeditions.ui.current_supply_points)
	if component_current_supply_points then
		local total_supply_points = table_accumulate(expedition_data.army_units, expedition_data.general_unit_supply_points, function(total, army_unit) return total + army_unit.supply_points end)
		if is_supply_points_applicable(cm:get_faction(faction_key)) and total_supply_points > 0 then
			component_current_supply_points:SetText(tostring(total_supply_points))
			component_current_supply_points:SetVisible(true)
		else
			component_current_supply_points:SetVisible(false)
		end
	end

	mythic_monsters_expeditions.ui.panel_setup_dilemmas(ui_context, faction_key, monster_key)

	local component_start_quest_battle = ui_context:SequentialFind(mythic_monsters_expeditions.ui.start_quest_battle)
	if component_start_quest_battle then
		component_start_quest_battle:SetVisible(true)

		local component_start_quest_battle_button = component_start_quest_battle:SequentialFind(mythic_monsters_expeditions.ui.start_quest_battle_button)
		if component_start_quest_battle_button then
			local state = #monster_data.dilemmas <= #expedition_data.dilemma_choices and "active" or "inactive"
			component_start_quest_battle_button:SetState(state)
		end
	end
end

mythic_monsters_expeditions.ui.panel_setup_dilemmas = function(component_panel, faction_key, monster_key)
	local component_dilemma_numbers = component_panel:SequentialFind(mythic_monsters_expeditions.ui.dilemma_numbers)
	if component_dilemma_numbers then
		component_dilemma_numbers:SetVisible(true)
	end

	local component_list = component_dilemma_numbers:SequentialFind(mythic_monsters_expeditions.ui.dilemma_list)
	if not component_list then return end

	local component_template = component_list:SequentialFind(mythic_monsters_expeditions.ui.dilemma_template)
	if not component_template then return end

	component_list:Divorce(component_template:Address())

	local monster_data, expedition_data = mythic_monsters_expeditions.get_monster_data(monster_key), mythic_monsters_expeditions.get_expedition_data(faction_key, monster_key)
	if #expedition_data.dilemma_choices < 1 then
		local component_expedition_started_before_first_dilemma = component_panel:SequentialFind(mythic_monsters_expeditions.ui.expedition_started_before_first_dilemma)
		if component_expedition_started_before_first_dilemma then
			component_expedition_started_before_first_dilemma:SetVisible(true)
		end
	end
	for i = 1, #monster_data.dilemmas do
		local component_dilemma_button = UIComponent(component_list:CreateFromComponent(component_template:Address(), "dilemma_" .. tostring(i)))
		local state = #expedition_data.dilemma_choices >= i and "active" or "inactive"
		component_dilemma_button:SetState(state)
		local component_text = component_dilemma_button:SequentialFind(mythic_monsters_expeditions.ui.dilemma_template_text)
		if component_text then
			component_text:SetText(tostring(i))
			component_text:SetState(state)
		end
	end

	component_template:Destroy()

	mythic_monsters_expeditions.ui.panel_display_dilemma(component_panel, faction_key, monster_key, #expedition_data.dilemma_choices)
end

-- Pass 0 as dilemma index in order to hide the dilemma components.
mythic_monsters_expeditions.ui.panel_display_dilemma = function(component_panel, faction_key, monster_key, dilemma_index)
	local monster_data, expedition_data = mythic_monsters_expeditions.get_monster_data(monster_key), mythic_monsters_expeditions.get_expedition_data(faction_key, monster_key)
	local show_dilemma = dilemma_index > 0
	local dilemma = show_dilemma and monster_data.dilemmas[dilemma_index]
	local choice = show_dilemma and expedition_data.dilemma_choices[dilemma_index]
	choice = choice and expedition_data.dilemma_choice_variants[dilemma_index] and expedition_data.dilemma_choice_variants[dilemma_index][choice]
	choice = choice and monster_data.dilemmas[dilemma_index].choices[choice]
	local followup_incident_key = show_dilemma and choice and choice.followup_incident_key

	-- Ensure that only one of the dilemma buttons is in selected state (i.e. make them behave like radio buttons).
	local component_list = component_panel:SequentialFind(mythic_monsters_expeditions.ui.dilemma_numbers, mythic_monsters_expeditions.ui.dilemma_list)
	if component_list then
		for i = 0, component_list:ChildCount() - 1 do
			local component_dilemma_button = UIComponent(component_list:Find(i))
			if component_dilemma_button then
				if component_dilemma_button:CurrentState() ~= "inactive" then
					component_dilemma_button:SetState(i + 1 == dilemma_index and "selected" or "active")
				end
			end
		end
	end

	local component_dilemma_name = component_panel:SequentialFind(mythic_monsters_expeditions.ui.dilemma_name)
	if component_dilemma_name then
		component_dilemma_name:SetVisible(show_dilemma)
		local component_dilemma_name_text = component_dilemma_name:SequentialFind(mythic_monsters_expeditions.ui.dilemma_name_text)
		if component_dilemma_name_text and show_dilemma then
			component_dilemma_name_text:SetText(common.get_localised_string("dilemmas_localised_title_" .. dilemma.key), "dilemmas_localised_title_" .. dilemma.key)
		end
	end

	local component_dilemma_info = component_panel:SequentialFind(mythic_monsters_expeditions.ui.dilemma_info)
	if component_dilemma_info then
		component_dilemma_info:SetVisible(show_dilemma)
		local component_dilemma_description = component_dilemma_info:SequentialFind(mythic_monsters_expeditions.ui.dilemma_description)
		if component_dilemma_description and show_dilemma then
			component_dilemma_description:SetText(common.get_localised_string("dilemmas_localised_description_" .. dilemma.key), "dilemmas_localised_description_" .. dilemma.key)
		end
	end

	local component_choice = component_panel:SequentialFind(mythic_monsters_expeditions.ui.dilemma_choice)
	if component_choice then
		component_choice:SetVisible(not not followup_incident_key)

		local component_toggle_choice = component_panel:SequentialFind(mythic_monsters_expeditions.ui.dilemma_toggle_choice)
		if component_toggle_choice then
			component_toggle_choice:SetState(followup_incident_key and "active" or "inactive")
		end

		if followup_incident_key then
			local component_choice_title = component_choice:SequentialFind(mythic_monsters_expeditions.ui.dilemma_choice_title)
			if component_choice_title then
				component_choice_title:SetText(common.get_localised_string("incidents_localised_title_" .. followup_incident_key), "incidents_localised_title_" .. followup_incident_key)
			end
	
			local component_choice_description = component_choice:SequentialFind(mythic_monsters_expeditions.ui.dilemma_choice_description)
			if component_choice_description then
				component_choice_description:SetText(common.get_localised_string("incidents_localised_description_" .. followup_incident_key), "incidents_localised_description_" .. followup_incident_key)
			end

			local component_choice_effects = component_choice:SequentialFind(mythic_monsters_expeditions.ui.dilemma_choice_effects)
			component_choice_effects:DestroyChildren()

			if component_choice_effects and choice then
				local outcomes = choice.outcomes or {}
				for _, outcome in ipairs(outcomes) do
					local component_outcome = nil
					if outcome.effect_bundle_key and mythic_monsters_expeditions.ui.templates.dilemma_effect_bundle then
						component_outcome = UIComponent(component_choice_effects:CreateFromComponent(mythic_monsters_expeditions.ui.templates.dilemma_effect_bundle:Address(), "outcome_" .. tostring(component_choice_effects:ChildCount())))
						if component_outcome then
							component_outcome:InterfaceFunction("initialize_with_record", outcome.effect_bundle_key)
						end
					elseif outcome.panel_text then
						component_outcome = UIComponent(component_choice_effects:CreateFromComponent(mythic_monsters_expeditions.ui.templates.dilemma_outcome:Address(), "outcome_" .. tostring(component_choice_effects:ChildCount())))
						if component_outcome then
							component_outcome:SetText(common.get_localised_string(outcome.panel_text), outcome.panel_text)
							-- check whether outcome.panel_image exists because if nil value is passed it will break Lua's state
							if outcome.panel_image then
								component_outcome:SetImagePath(outcome.panel_image)
							end
						end
					end

					if component_outcome then
						local component_prefix = component_outcome:SequentialFind(mythic_monsters_expeditions.ui.dilemma_template_prefix)
						if component_prefix then
							local is_gained = outcome.experience_levels or not outcome.remove
							if outcome.health then
								is_gained = outcome.health > 0
							end
							component_prefix:SetState(is_gained and "gained" or "lost")
						end
					end
				end
			end
		end
	end
end

mythic_monsters_expeditions.ui.on_lclick = function(context)
	local faction_key = cm:get_local_faction_name(true)
	local monster_key = mythic_monsters_expeditions.get_selected_monster(faction_key)
	if not monster_key then out("Mythic Monsters Expeditions: Faction " .. faction_key .. " has no selected monster upon clicking the expedition panel!") return end

	local root = core:get_ui_root()
	local panel = root:SequentialFind(mythic_monsters_expeditions.ui.panel)
	local ui_context = UIComponent(context.component)
	local click_id = ui_context:Id();
	if click_id == mythic_monsters_expeditions.ui.abandon_expedition_button then
		create_confirmation_box(mythic_monsters_expeditions.ui.abandon_expedition_confirmation_id, mythic_monsters_expeditions.ui.abandon_expedition_confirmation_description,
			function()
				mythic_monsters_expeditions.ui.close_panel()
		
				local faction = cm:get_faction(faction_key)
				CampaignUI.TriggerCampaignScriptEvent(faction:command_queue_index(), "monster_expeditions_abandon_expedition," .. monster_key)
			end
		)
	elseif click_id:starts_with("dilemma_") then
		local index = click_id:sub(string.len("dilemma_") - click_id:len())
		index = tonumber(index)
		mythic_monsters_expeditions.ui.panel_display_dilemma(panel, faction_key, monster_key, index)
	elseif click_id == mythic_monsters_expeditions.ui.dilemma_toggle_choice then
		local component_choice = panel:SequentialFind(mythic_monsters_expeditions.ui.dilemma_choice)
		if component_choice then
			component_choice:SetVisible(not component_choice:Visible())
		end
	elseif click_id == mythic_monsters_expeditions.ui.start_quest_battle_button then
		mythic_monsters_expeditions.ui.close_panel(panel)

		-- Delay the opening of the mission, as there is an animation played for the factions buttons docker upon closing a full screen panel (like this one).
		cm:callback(
			function() mythic_monsters_expeditions.ui.open_quest_battle_mission(root, monster_key) end, 
			mythic_monsters_expeditions.ui.delay_on_open_quest_battle_mission
		)
	end
end

mythic_monsters_expeditions.ui.close_panel = function(panel)
	local panel = panel or find_uicomponent(core:get_ui_root(), mythic_monsters_expeditions.ui.panel)
	if panel and panel:Visible() then
		panel:InterfaceFunction("close_panel")
	end
end

mythic_monsters_expeditions.ui.open_quest_battle_mission = function(root, monster_key)
	local ui = mythic_monsters_expeditions.ui
	local component_missions_tab = root:SequentialFind(ui.strat_hud_missions_tab)
	if component_missions_tab then
		component_missions_tab:SimulateLClick()

		local component_missions_list = root:SequentialFind(ui.strat_hud_missions_dropdown, ui.strat_hud_missions_list)
		if component_missions_list then
			local monster_data = mythic_monsters_expeditions.get_monster_data(monster_key)
			for i = 0, component_missions_list:ChildCount() - 1 do
				local component_mission_row = UIComponent(component_missions_list:Find(i))
				if component_mission_row then
					local mission_record_key = component_mission_row:GetProperty(ui.strat_hud_missions_search_property)
					if mission_record_key and mythic_monsters_expeditions.is_mission_monster_mission(mission_record_key, monster_data.quest_battle_mission_key) then
						component_mission_row:SimulateLClick()
					end
				end
			end
		end
	end
end

-- Add all UI listeners.
core:add_listener(
	"monster_expeditions_ui_faction_turn_start",
	"FactionTurnStart",
	true,
	function(context)
		local faction_key = context:faction():name()
		if cm:get_local_faction_name(true) == faction_key then
			mythic_monsters_expeditions.ui.activate_selection_or_expedition_buttons(faction_key)
		end
	end,
	true
)

core:add_listener(
	"monster_expeditions_panel_opened_campaign",
	"PanelOpenedCampaign",
	function(context) return context.string == mythic_monsters_expeditions.ui.panel end,
	mythic_monsters_expeditions.ui.panel_open,
	true
)

core:add_listener(
	"monster_expeditions_start_expedition",
	"UITriggerScriptEvent",
	true,
	function(context)
		local index, params = 1, context:trigger():split(",")

		-- Handle abandon expedition.
		if params[index] == "monster_expeditions_abandon_expedition" then
			local faction = cm:model():faction_for_command_queue_index(context:faction_cqi())
			local monster_key = params[index + 1]
			mythic_monsters_expeditions.abandon_expedition(faction, monster_key)
			return
		end

		if params[index] ~= "monster_expeditions_start_expedition" then return end

		local model = cm:model()
		local faction = model:faction_for_command_queue_index(context:faction_cqi())
		local faction_key = faction:name()
		local monster_key = mythic_monsters_expeditions.get_selected_monster(faction_key)
		if not monster_key then out("Mythic Monsters Expeditions: Faction " .. faction_key .. " has no selected monster upon starting an expedition!") return end

		index = index + 1

		local general_family_member_cqi = tonumber(params[index])
		local general_family_member = general_family_member_cqi and model:family_member_for_command_queue_index(general_family_member_cqi)
		if not general_family_member or general_family_member:is_null_interface() then
			out("Mythic Monsters Expeditions: Faction " .. faction_key .. " attempts to start an expedition with invalid general family member CQI: " .. params[index])
			return
		end
		index = index + 1

		local units_count = tonumber(params[index])
		if not units_count or units_count < mythic_monsters_expeditions.starting_army_units_min or units_count > mythic_monsters_expeditions.starting_army_units_max then
			out("Mythic Monsters Expeditions: Faction " .. faction_key .. " attempts to start an expedition with invalid number of units: " .. params[index])
			return
		end
		local units = {}
		index = index + 1
		for i = 1, units_count do
			table.insert(units, params[index])
			index = index + 1
		end
		if #units < mythic_monsters_expeditions.starting_army_units_min or #units > mythic_monsters_expeditions.starting_army_units_max then
			out("Mythic Monsters Expeditions: Faction " .. faction_key .. " attempts to start an expedition with invalid number of units: " .. tostring(#units))
			return
		end

		local resources_count = tonumber(params[index])
		if not resources_count then out("Mythic Monsters Expeditions: Faction " .. faction_key .. " attempts to start an expedition with invalid amount of resources: ".. params[index]) return end
		
		local resources = {}
		index = index + 1
		for i = 1, resources_count do
			local amount = tonumber(params[index + 1]);
			if not resources_count then
				out("Mythic Monsters Expeditions: Faction " .. faction_key .. " attempts to start an expedition with invalid amount " .. params[index + 1] .. " of resource " .. params[index])
				return
			end
			local resource = { key = params[index], amount = amount }
			if not faction:has_pooled_resource(resource.key) or faction:pooled_resource(resource.key):value() < -resource.amount then
				out("Mythic Monsters Expeditions: Faction " .. faction_key .. " attempts to start an expedition with not enough of resource " .. resource.key)
				return
			end
			table.insert(resources, resource)
			index = index + 2
		end

		-- All checks were passed. Take away the resources and start the expedition.
		for i = 1, #resources do
			cm:faction_add_pooled_resource(faction_key, resources[i].key, mythic_monsters_expeditions.pooled_resource_factor_units, resources[i].amount)
		end

		core:trigger_event("ScriptEventArmySentOnExpedition", faction, monster_key, general_family_member_cqi, units)
		mythic_monsters_expeditions.start_expedition(faction, monster_key, general_family_member_cqi, units)
	end,
	true
)

core:add_listener(
	"monster_expeditions_prebattle_panel_opened_campaign",
	"PanelOpenedCampaign",
	function(context) return context.string == mythic_monsters_expeditions.ui.prebattle_panel and cm:is_game_running() end,
	function(context)
		local pb = cm:model():pending_battle()
		local set_piece_battle_key = pb:set_piece_battle_key()
		for _, monster_data in ipairs(mythic_monsters_expeditions.monsters) do
			if set_piece_battle_key == monster_data.quest_battle_set_piece_battle_key then
				local attacker_faction = pb:attacker_faction()
				local human_faction = nil
				if attacker_faction:is_human() then
					human_faction = attacker_faction
				end
				local defender_faction = pb:defender_faction()
				if not human_faction and defender_faction:is_human() then
					human_faction = defender_faction
				end
		
				if human_faction then
					local ui_context = UIComponent(context.component)
					local monster_side_panel = "enemy_combatants_panel"
					if human_faction:name() ~= cm:get_local_faction_name(true) and not human_faction:allied_with(cm:get_local_faction_name(true)) then
						monster_side_panel = "allies_combatants_panel"
					end

					local content_frame = ui_context:SequentialFind(monster_side_panel, "plate_window_base", "content_plate_two")
					if content_frame then
						content_frame:SetState(monster_data.key)
					end
				end
				
				break
			end
		end
	end,
	true
)

--------------------------------------------------------------
------------------- Test functions and calls. ----------------
--------------------------------------------------------------

mythic_monsters_expeditions.test = {}
mythic_monsters_expeditions.test.default_army_units = { "troy_trojan_militia", "troy_dardanian_spearmen", "troy_dardanian_spearmen", "troy_heavy_lycian_axemen", }

-- Example call: mythic_monsters_expeditions.set_selected_monster(cm:get_local_faction_name(true), "griffin")

-- Example call: mythic_monsters_expeditions.start_expedition(cm:get_faction(cm:get_local_faction_name()), "griffin")

-- Example call: mythic_monsters_expeditions.test.start_monster_quest_battle_mission("cerberus")
mythic_monsters_expeditions.test.start_monster_quest_battle_mission = function(monster_key)
	local monster_data = mythic_monsters_expeditions.get_monster_data(monster_key)
	if monster_data then
		local faction_key = cm:get_local_faction_name()
		local mission_key = mythic_monsters_expeditions.get_mission_key_for_faction_key(monster_data.quest_battle_mission_key, faction_key)
		cm:trigger_mission(faction_key, mission_key, true)
	else
		out("Mythic Monsters Expeditions: No monster with key " .. monster_key)
	end
end

--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------

cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("TROY_MYTHIC_MONSTERS_EXPEDIIONS_FACTIONS", mythic_monsters_expeditions.factions, context)
	end
)

cm:add_loading_game_callback(
	function(context)
		mythic_monsters_expeditions.factions = cm:load_named_value("TROY_MYTHIC_MONSTERS_EXPEDIIONS_FACTIONS", mythic_monsters_expeditions.factions, context)
	end
)