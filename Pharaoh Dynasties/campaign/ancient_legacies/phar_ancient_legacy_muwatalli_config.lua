out("Loading phar_ancient_legacy_muwatalli_config.lua")

muwatalli_config = {
	resource_key = "phar_muwatalli_gratitude",
	resource_factor_reward = "troy_resource_factor_faction",
	resource_factor_consumed_by_action = "troy_resource_factor_faction",
	starting_gratitude = 50,

	gratitude_spent_event = {
		event_key = "ancient_legacy_muwatalli_gratitude_spend"
	},

	public_order_gratitude_thresholds = {
		-- if thresholds change so they may contain negative public order we should change function get_public_order_gratitude_threshold_index
		-- TODO enter real values
		{ 
			public_order_lower_bound = -100,
			gratitude = 0,
			title_key = "troy_main_fm_helen_state_unhappy", -- TODO: place actual localisation key
		},
		{ 
			public_order_lower_bound = 1,
			gratitude = 2,
			title_key = "troy_main_fm_helen_state_unhappy", -- TODO: place actual localisation key
		},
		{
			public_order_lower_bound = 10,
			gratitude = 4,
			title_key = "troy_main_fm_helen_state_happy", -- TODO: place actual localisation key
		},
		{
			public_order_lower_bound = 20,
			gratitude = 6,
			title_key = "troy_main_fm_helen_state_happy", -- TODO: place actual localisation key
		},
		{
			public_order_lower_bound = 40,
			gratitude = 8,
			title_key = "troy_main_fm_helen_state_happy", -- TODO: place actual localisation key
		},
		{
			public_order_lower_bound = 60,
			gratitude = 10,
			title_key = "troy_main_fm_helen_state_happy", -- TODO: place actual localisation key
		},
		{
			public_order_lower_bound = 80,
			gratitude = 20,
			title_key = "troy_main_fm_helen_state_happy", -- TODO: place actual localisation key
		},
	},

	vassal_gratitude_thresholds = {
		-- TODO enter real values
		{ 
			attitude_lower_bound = 0,
			gratitude = 0
		},
		{
			attitude_lower_bound = 50,
			gratitude = 3
		},
		{
			attitude_lower_bound = 100,
			gratitude = 5
		},
		{
			attitude_lower_bound = 150,
			gratitude = 10
		},
	},

	gratitude_thresholds = {
		-- TODO enter real values
		{ 
			lower_bound = 0,
			effect_bundle_key = "phar_main_muwatalli_gratitude_vassal_gifts_1",
			title_key = "phar_main_al_muwatalli_gratitude_threshold_1_title",
			icon_path = "UI/Campaign UI/Effect_bundles/icon_effect_gratitude.png",
			
		},
		{ 
			lower_bound = 20,
			effect_bundle_key = "phar_main_muwatalli_gratitude_vassal_gifts_2",
			title_key = "phar_main_al_muwatalli_gratitude_threshold_2_title",
			icon_path = "UI/Campaign UI/Effect_bundles/icon_effect_gratitude.png",
		},
		{
			lower_bound = 40,
			effect_bundle_key = "phar_main_muwatalli_gratitude_vassal_gifts_3",
			title_key = "phar_main_al_muwatalli_gratitude_threshold_3_title",
			icon_path = "UI/Campaign UI/Effect_bundles/icon_effect_gratitude.png",
		},
		{
			lower_bound = 60,
			effect_bundle_key = "phar_main_muwatalli_gratitude_vassal_gifts_4",
			title_key = "phar_main_al_muwatalli_gratitude_threshold_4_title",
			icon_path = "UI/Campaign UI/Effect_bundles/icon_effect_gratitude.png",
		},
		{
			lower_bound = 80,
			effect_bundle_key = "phar_main_muwatalli_gratitude_vassal_gifts_5",
			title_key = "phar_main_al_muwatalli_gratitude_threshold_5_title",
			icon_path = "UI/Campaign UI/Effect_bundles/icon_effect_gratitude.png",
		},
	},

	-- tokens of gratitude ( actions )
	actions = {
		-- "Expert Builders" token
		{
			id = "free_instant_construction",
			cost = -20, -- cost is in gratitude resource
			amount_gained_per_use = 1,

			ui_data = {
				title_key = "phar_main_al_muwatalli_expert_builders_title",
				description_key = "phar_main_al_muwatalli_expert_builders_description",
				flavour_key = "phar_main_al_muwatalli_expert_builders_flavour",
				icon_path = "UI/skins/default/legacy_muwatalli/icon_token_expert_builders.png"
			},
		},

		-- "Strong Blacksmiths" token
		{
			id = "gain_ancillary",
			cost = -10, -- cost is in gratitude resource
			ancillaries_list = {
				-- TODO enter real values
				{
					key = "phar_main_rare_equipment_axes_3",
					weight = 5
				},
				{
					key = "phar_main_rare_equipment_axes_4",
					weight = 5
				},
				{
					key = "phar_main_rare_equipment_axes_5",
					weight = 5
				},
				{
					key = "phar_main_rare_equipment_axes_6",
					weight = 5
				},
				{
					key = "phar_main_rare_equipment_bows_4",
					weight = 10
				},
				{
					key = "phar_main_rare_equipment_bows_5",
					weight = 10
				},
				{
					key = "phar_main_rare_equipment_chariots_1",
					weight = 10
				},
				{
					key = "phar_main_rare_equipment_chariots_2",
					weight = 10
				},
				{
					key = "phar_main_rare_equipment_chariots_4",
					weight = 10
				},
				{
					key = "phar_main_rare_equipment_chariots_5",
					weight = 10
				},
				{
					key = "phar_main_rare_equipment_bows_3",
					weight = 5
				},
				{
					key = "phar_main_rare_equipment_clubs_1",
					weight = 5
				},
				{
					key = "phar_main_rare_equipment_clubs_3",
					weight = 5
				},
				{
					key = "phar_main_rare_equipment_clubs_5",
					weight = 5
				},
				{
					key = "phar_main_rare_equipment_heavy_armour_1",
					weight = 5
				},
				{
					key = "phar_main_rare_equipment_heavy_armour_2",
					weight = 5
				},
				{
					key = "phar_main_rare_equipment_heavy_armour_3",
					weight = 5
				},
				{
					key = "phar_main_rare_equipment_heavy_armour_4",
					weight = 5
				},
				{
					key = "phar_main_rare_equipment_heavy_armour_5",
					weight = 5
				},
				{
					key = "phar_main_rare_equipment_heavy_armour_6",
					weight = 5
				},
				{
					key = "phar_main_rare_equipment_heavy_armour_7",
					weight = 5
				},
				{
					key = "phar_main_rare_equipment_large_shield_1",
					weight = 7
				},
				{
					key = "phar_main_rare_equipment_large_shield_2",
					weight = 7
				},
				{
					key = "phar_main_rare_equipment_large_shield_3",
					weight = 7
				},
				{
					key = "phar_main_rare_equipment_large_shield_5",
					weight = 7
				},
				{
					key = "phar_main_rare_equipment_large_shield_6",
					weight = 7
				},
				{
					key = "phar_main_rare_equipment_medium_armour_1",
					weight = 5
				},
				{
					key = "phar_main_rare_equipment_medium_armour_3",
					weight = 5
				},
				{
					key = "phar_main_rare_equipment_medium_armour_4",
					weight = 5
				},
				{
					key = "phar_main_rare_equipment_medium_armour_5",
					weight = 5
				},
				{
					key = "phar_main_rare_equipment_medium_shield_1",
					weight = 7
				},
				{
					key = "phar_main_rare_equipment_medium_shield_3",
					weight = 7
				},
				{
					key = "phar_main_rare_equipment_medium_shield_4",
					weight = 7
				},
				{
					key = "phar_main_rare_equipment_medium_shield_5",
					weight = 7
				},
				{
					key = "phar_main_rare_equipment_spears_1",
					weight = 5
				},
				{
					key = "phar_main_rare_equipment_spears_2",
					weight = 5
				},
				{
					key = "phar_main_rare_equipment_spears_3",
					weight = 5
				},
				{
					key = "phar_main_rare_equipment_spears_6",
					weight = 5
				},
				{
					key = "phar_main_rare_equipment_swords_1",
					weight = 5
				},
				{
					key = "phar_main_rare_equipment_swords_2",
					weight = 5
				},
				{
					key = "phar_main_rare_equipment_swords_3",
					weight = 5
				},
				{
					key = "phar_main_rare_equipment_swords_5",
					weight = 5
				},
			},
			
			ui_data = {
				title_key = "phar_main_al_muwatalli_strong_blacksmiths_title",
				description_key = "phar_main_al_muwatalli_strong_blacksmiths_description",
				flavour_key = "phar_main_al_muwatalli_strong_blacksmiths_flavour",
				icon_path = "UI/skins/default/legacy_muwatalli/icon_token_skilled_craftsmen.png"
			},
		},

		-- "Hidden Scouts" token
		{
			id = "free_embed_informant",
			cost = -10, -- cost is in gratitude resource
			amount_gained_per_use = 1,

			ui_data = {
				title_key = "phar_main_al_muwatalli_hidden_scouts_title",
				description_key = "phar_main_al_muwatalli_hidden_scouts_description",
				flavour_key = "phar_main_al_muwatalli_hidden_scouts_flavour",
				icon_path = "UI/skins/default/legacy_muwatalli/icon_token_hidden_scouts.png"
			},
		},

		-- "Court Attendants" token
		{
			id = "extra_court_action",
			cost = -20, -- cost is in gratitude resource
			amount_gained_per_use = 1,

			ui_data = {
				title_key = "phar_main_al_muwatalli_court_attendants_title",
				description_key = "phar_main_al_muwatalli_court_attendants_description",
				flavour_key = "phar_main_al_muwatalli_court_attendants_flavour",
				icon_path = "UI/skins/default/legacy_muwatalli/icon_token_court_attendants.png"
			},
		},

		-- "unit_experience" token
		{
			id = "unit_experience",
			cost = -10, -- cost is in gratitude resource
			effect_bundle_duration = 1, -- increment effect bundle duration with that amount, if it doesn't exist yet then this is the starting duration
			effect_bundle_key = "phar_main_muwatalli_unit_experience",
			
			ui_data = {
				title_key = "phar_main_al_muwatalli_unit_experience_legacy_title",
				description_key = "phar_main_al_muwatalli_unit_experience_description",
				flavour_key = "phar_main_al_muwatalli_unit_experience_flavour",
				icon_path = "UI/skins/default/legacy_muwatalli/icon_token_xp_boost.png"
			},
		},
	},
}

for _, action in ipairs(muwatalli_config.actions) do
	muwatalli_config.actions[action.id] = action
end