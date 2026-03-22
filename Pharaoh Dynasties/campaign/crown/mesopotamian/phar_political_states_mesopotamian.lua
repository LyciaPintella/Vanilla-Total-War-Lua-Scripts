local file_info = debug.getinfo(1, "S")
local folder_file_splits = string.split(file_info.source, "\\")
out("Loading " .. folder_file_splits[#folder_file_splits])

local meso_political_states_config = {
	id = "meso_political_states",

	-- A trivial legitimacy war is one where only 1 faction remains as a pretender.
	trivial_legitimacy_war_turns = 3,
	legitimacy_war_start_turns = 12,
	legitimacy_war_max_total_turns = 36,
	new_pretender_additional_turns = 3,

	-- Whether the pretenders automatically declare war to each other when the legitimacy war starts or when a pretender joins the war.
	pretender_automatically_declare_war_on_legitimacy_war_join = false,

	-- The chance of a CAI faction to start or join a legitimacy war used from 0 to 100.
	chance_for_cai_to_start_legitimacy_war = 5,
	chance_for_cai_to_join_legitimacy_war = 15,
	cai_neutral_attitude_benchmark_value = 20,	-- ANY NUMBER EXCEPT ZERO!! (Can be negative)

	-- Variable for the CAI to be able to start a legitimacy war before Merneptah dies.
	cai_can_start_wars_before_scripted_war = true,

	-- Minimum number of turns between legitimacy wars
	legitimacy_war_cooldown = 12,

	-- Cannot start a legitimacy war before this turn
	first_possible_legitimacy_war_turn = 12,

	-- If we have multiple pretenders with the same highest legitimacy how many turns to wait for someone
	-- to beat the others. If after this many turns, there's still a draw, it will extend the war again by this number.
	-- This can cause the legitimacy war to exceed the legitimacy_war_max_total_turns set above
	emergency_tiebreaker_turns = 5,

	-- If this is true then "legitimacy_to_claim_crown" from bellow is ignored and will
	-- instead use "legitimacy_to_claim_crown_thresholds"
	use_threshold_legitimacy = true,

	-- Whether the pretenders who lost a legitimacy war become subjects of the new pharaoh.
	failed_pretenders_become_subjects_of_new_ruler = false,

	vassal_occupation_option_key = "occupation_decision_vassal_or_subject",

	ancient_legacy_group_key = "meso_legacies",

	-- NOTE this is disabled if "use_threshold_legitimacy" is set to true
	-- Legitimacy needed to claim crown and become a pretender
	-- These are keys from the campaign variables database table
	-- When the game starts the config is overwritten to have the number values instead of these keys
	-- E.G. meso_political_states_config.legitimacy_to_claim_crown.legitimacy_war
	-- will be 50 (or whatever number is set in the database)
	legitimacy_to_claim_crown = {
		legitimacy_war = "legitimacy_needed_to_join_meso_war",
		stable = "legitimacy_needed_to_start_meso_war",
	},

	-- NOTE this is disabled if "use_threshold_legitimacy" is set to false
	-- This is the same as legitimacy_to_claim_crown but instead of using hard numbers as thresholds a percentage
	-- of the current ruler's legitimacy is used.
	legitimacy_to_claim_crown_thresholds = {
		legitimacy_war = 0,
		stable = 0.75,
	},

	-- Minimum amount of legitimacy required to start or join a legitimacy war.
	minimum_legitimacy_to_claim_crown = 45,

	-- If starting_ruler_faction_key is commented then this legitimacy path will start with a legitimacy war at turn 1.

	starting_ruler_faction_key = "phar_map_assyria",

	-- If starting_ruler_faction_key is missing will start a legitimacy war on new game with this number of pretenders
	-- If this option is missing will default to 1
	--starting_war_min_num_pretenders = 1,

	-- this only applies for AI factions!
	starting_ruler_unlock_legacy = false,

	event_info = {
		-- This appears when a legitimacy war is started
		legitimacy_war_start = {
			title_key = "ui_text_replacements_localised_text_phar_main_event_feed_string_legitimacy_war_start_title",
			secondary_detail = "",
			text = "ui_text_replacements_localised_text_phar_map_event_feed_string_legitimacy_war_start_meso_secondary_detail",
			event_pic_index = 2140,
		},

		-- This appears when the player is able to start a new legitimacy war
		can_start_legitimacy_war = {
			title_key = "ui_text_replacements_localised_text_phar_main_event_feed_string_legitimacy_war_near_own_title",
			secondary_detail = "",
			text = "ui_text_replacements_localised_text_phar_main_event_feed_string_legitimacy_war_near_own_secondary_detail",
			event_pic_index = 2140,
		},

		-- This appears when a new pretender joins the legitimacy war
		legitimacy_war_pretender_joined = {
			event_key = "politics_legitimacy_pretender_other",
			event_pic_index = 2140,
		},

		-- This appears at the end of the legitimacy war and you won
		legitimacy_war_end = {
			title_key = "ui_text_replacements_localised_text_phar_main_event_feed_string_legitimacy_war_end_title",
			secondary_detail = "",
			text = "ui_text_replacements_localised_text_phar_map_event_feed_string_legitimacy_war_end_meso_secondary_detail",
			event_pic_index = 2140,
		},

		-- This appears at the end of the legitimacy war and you lost
		legitimacy_war_end_other = {
			title_key = "ui_text_replacements_localised_text_phar_main_event_feed_string_legitimacy_war_end_title",
			secondary_detail = "",
			text = "ui_text_replacements_localised_text_phar_map_event_feed_string_legitimacy_war_end_meso_other_secondary_detail",
			event_pic_index = 2140,
		},

		-- This appears when the player is able to join an ongoing legitimacy war
		can_join_legitimacy_war = {
			title_key = "ui_text_replacements_localised_text_phar_main_event_feed_string_legitimacy_war_join_title",
			secondary_detail = "",
			text = "ui_text_replacements_localised_text_phar_main_event_feed_string_legitimacy_war_join_secondary_detail",
			event_pic_index = 2140,
		},

		-- This appears for the player when on other paths and an Mesopotamian civil war breaks out
		notify_other_paths_of_legitimacy_war = {
			title_key = "ui_text_replacements_localised_text_phar_map_event_feed_string_mesopotamian_legitimacy_war_start_other_paths_title",
			secondary_detail = "",
			text = "ui_text_replacements_localised_text_phar_map_event_feed_string_mesopotamian_legitimacy_war_start_other_paths_secondary_detail",
			event_pic_index = 2141,
		},
	},

	-- movies
	max_times_legitimacy_war_movie_can_play = -1,	-- -1 means the movie will play every time, specify a positive number here to indicate the maximum times a legitimacy war movie should play
	-- use something like "troy_adi_ajax_win_movie.ca_vp8"
	legitimacy_war_start_movie_name = "phar_map_mesopotamia_legitimacy_war_start.ca_vp8",
	legitimacy_war_end_movie_name = "phar_map_mesopotamia_legitimacy_war_end.ca_vp8",
	--starting_ruler_death_movie_name = "",

	ui = {
		-- These are for the animation that plays in the middle of the screen when the corresponding event happens
		legitimacy_war_notification_name = "legitimacy_war_notification",
		legitimacy_war_notification_path = "UI/Campaign UI/legitimacy_war_notification",

		war_started_notification = {
			title_key = "ui_text_replacements_localised_text_meso_legitimacy_war_started_notification_title_key",
			text_key = "ui_text_replacements_localised_text_meso_legitimacy_war_started_notification_text_key",
			state = "meso_war",
		},

		war_joined_notification = {
			title_key = "ui_text_replacements_localised_text_meso_legitimacy_war_joined_notification_title_key",
			text_key = "ui_text_replacements_localised_text_meso_legitimacy_war_joined_notification_text_key",
			state = "meso_joined",
		},

		war_ended_notification = {
			title_key = "ui_text_replacements_localised_text_meso_legitimacy_war_ended_notification_title_key",
			text_key = "ui_text_replacements_localised_text_meso_legitimacy_war_ended_notification_text_key",
			state = "meso_peace",
		},

		court_leader_localized_name = "King of the Universe",
	},
}

meso_political_states = {
	config = meso_political_states_config,

	post_init = function(self)
		self.legitimacy_system = meso_legitimacy
		self.special_ancillary_system = meso_ancillaries
		self.powers_system = meso_powers
	end,
}

meso_political_states = crown:create_mechanic_from_type(political_states_system, meso_political_states)

return meso_political_states