local file_info = debug.getinfo(1, "S")
local folder_file_splits = string.split(file_info.source, "\\")
out("Loading " .. folder_file_splits[#folder_file_splits])

local great_king_powers_config = {
	id = "great_king_config",

	max_powers_per_tier = {
		[1] = 2,
		[2] = 1,
		[3] = 1,
		[4] = 1,
	},

	tier_legitimacy_requirement = {
		[1] = 150,
		[2] = 230,
		[3] = 320,
		[4] = 400,
	},

	-- Only the true ruler has access to powers. Consequently this means powers are inaccessible during legitimacy wars
	only_sitting_ruler_has_access_to_powers = true,

	-- Whether to refund points if you unlock a higher tier of a power you've already unlocked
	refund_lower_tier_of_same_power_when_unlocking = true,

	-- Whether to stop the power from working when your legitimacy is bellow
	-- the required legitimacy to unlock that power.
	lock_power_when_legitimacy_bellow_requirement = true,

	lose_legitimacy_when_unlocking_power = false,
	bought_power_factor = "phar_hatti_legitimacy_bought_power",

	forced_annexation = {
		tiers = {
			[1] = {
				cooldown = 12,
				min_number_of_regions = 1,
				max_number_of_regions = 1,
			},
			[2] = {
				cooldown = 18,
				min_number_of_regions = 1,
				max_number_of_regions = 2,
			},
			[3] = {
				cooldown = 14,
				min_number_of_regions = 1,
				max_number_of_regions = 2,
			},
			[4] = {
				cooldown = 18,
				min_number_of_regions = 1,
				max_number_of_regions = 3,
			},
		},
	},

	court_positions = {
		tiers = {
			[1] = {
				positions = 2,
			},
			[2] = {
				positions = 3,
			},
			[3] = {
				positions = 4,
			},
			[4] = {
				positions = 5,
			},
		},
	},

	raise_resources = {
		tiers = {
			[1] = {
				cooldown = 12,
				duration = 6,
				effect_bundle_key = "phar_main_great_king_powers_raise_resources_tier_1",
			},
			[2] = {
				cooldown = 12,
				duration = 6,
				effect_bundle_key = "phar_main_great_king_powers_raise_resources_tier_2",
			},
			[3] = {
				cooldown = 12,
				duration = 6,
				effect_bundle_key = "phar_main_great_king_powers_raise_resources_tier_3",
			},
			[4] = {
				cooldown = 12,
				duration = 6,
				effect_bundle_key = "phar_main_great_king_powers_raise_resources_tier_4",
			},
		},
	},

	raise_armies = {
		tiers = {
			[1] = {
				cooldown = 12,
				duration = 3,
				effect_bundle_key = "phar_main_great_king_powers_raise_armies_tier_1",
			},
			[2] = {
				cooldown = 12,
				duration = 6,
				effect_bundle_key = "phar_main_great_king_powers_raise_armies_tier_2",
			},
			[3] = {
				cooldown = 12,
				duration = 6,
				effect_bundle_key = "phar_main_great_king_powers_raise_armies_tier_3",
			},
			[4] = {
				cooldown = 12,
				duration = 9,
				effect_bundle_key = "phar_main_great_king_powers_raise_armies_tier_4",
			},
		}
	},

	competency_points = {
		tiers = {
			[1] = {
				cooldown = 12,
				num_points = 1,
			},
			[2] = {
				cooldown = 10,
				num_points = 2,
			},
			[3] = {
				cooldown = 8,
				num_points = 3,
			},
			[4] = {
				cooldown = 6,
				num_points = 4,
			},
		},
	},
}

local great_king_powers_ui_config = {
	-- This is filled out automatically
	--mechanic = great_king_powers,
	--panel_is_opened = false,

	tooltip_tier_string_prefix = "campaign_localised_strings_string_tooltip_tier_prefix_",

	script_id_prefix = "great_king_power_",
	power_type = "hittite",

	powers = {
		--[[
		Each power has these filled out automatically for it:
			config = pharaohs_powers_config.power_config,
			power_string = "power_string"

		Example for forced_annexation:
			config = pharaohs_powers_config.forced_annexation,
			power_string = "forced_annexation"
		--]]

		forced_annexation = {
			icon_path = "UI/skins/default/pharaohs_crown/powers/power_great_king_forced_annexation.png",
			tooltip_title_prefix = "campaign_localised_strings_string_forced_annexation_tooltip_title_",
			tooltip_info_key_prefix = "campaign_localised_strings_string_forced_annexation_tooltip_info_",
			tooltip_tier_effect_prefix = "campaign_localised_strings_string_forced_annexation_tooltip_effect_",
			tooltip_flavour_prefix = "campaign_localised_strings_string_forced_annexation_tooltip_flavour_",
		},
		court_positions = {
			icon_path = "UI/skins/default/pharaohs_crown/powers/power_great_king_court.png",
			tooltip_title_prefix = "campaign_localised_strings_string_court_positions_tooltip_title_",
			tooltip_info_key_prefix = "campaign_localised_strings_string_court_positions_tooltip_info_",
			tooltip_tier_effect_prefix = "campaign_localised_strings_string_court_positions_tooltip_effect_",
			tooltip_flavour_prefix = "campaign_localised_strings_string_court_positions_tooltip_flavour_",
		},
		raise_resources = {
			icon_path = "UI/skins/default/pharaohs_crown/powers/power_great_king_raise_resources.png",
			tooltip_title_prefix = "campaign_localised_strings_string_raise_resources_tooltip_title_",
			tooltip_info_key_prefix = "campaign_localised_strings_string_raise_resources_tooltip_info_",
			tooltip_tier_effect_prefix = "campaign_localised_strings_string_raise_resources_tooltip_effect_",
			tooltip_flavour_prefix = "campaign_localised_strings_string_raise_resources_tooltip_flavour_",
		},
		raise_armies = {
			icon_path = "UI/skins/default/pharaohs_crown/powers/power_great_king_armies.png",
			tooltip_title_prefix = "campaign_localised_strings_string_raise_armies_tooltip_title_",
			tooltip_info_key_prefix = "campaign_localised_strings_string_raise_armies_tooltip_info_",
			tooltip_tier_effect_prefix = "campaign_localised_strings_string_raise_armies_tooltip_effect_",
			tooltip_flavour_prefix = "campaign_localised_strings_string_raise_armies_tooltip_flavour_",
		},
		competency_points = {
			icon_path = "UI/skins/default/pharaohs_crown/powers/power_great_king_competency.png",
			tooltip_title_prefix = "campaign_localised_strings_string_competency_points_tooltip_title_",
			tooltip_info_key_prefix = "campaign_localised_strings_string_competency_points_tooltip_info_",
			tooltip_tier_effect_prefix = "campaign_localised_strings_string_competency_points_tooltip_effect_",
			tooltip_flavour_prefix = "campaign_localised_strings_string_competency_points_tooltip_flavour_",
		},
	},
}

great_king_powers = {
	config = great_king_powers_config,
	ui_config = great_king_powers_ui_config,

	get_relevant_court = function()
		return court.hittite_court
	end,

	post_init = function(self)
		self.legitimacy_system = hatti_legitimacy
		self.political_states_system = hatti_political_states
	end,
}

great_king_powers = crown:create_mechanic_from_type(powers_system, great_king_powers)

return great_king_powers
