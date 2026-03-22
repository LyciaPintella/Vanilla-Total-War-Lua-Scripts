out("Loading phar_war_spoils_config.lua")


war_spoils_config = {
	resource_factor = "troy_resource_factor_faction",

	cooldown_for_resource_benefit = 0,
	cooldown_for_non_resource_benefit = 30,

	-- this table specifies the lower bound in amount of regions that a faction must own to qualify for that War Spoil level
	-- eg. to be of level 2 the faction must have at least 7 regions but less than 10 (if it had 10 it would be of level 1) etc.
	num_regions_lower_bound_for_level = {
		[1] = 10,
		[2] = 7,
		[3] = 4,
		[4] = 1,
		[5] = 0,
	},

	max_faction_level = 5,
	max_faction_level_override = {
		phar_sea_sherden = 6,
	},

	benefits = {
		resource_food = {
			ui = {	-- ui related configuration
				resource_localization_key = "ui_text_replacements_localised_text_hp_title_food",
				title_localization_key = "ui_text_replacements_localised_text_phar_sea_war_spoils_food",
				tooltip_localization_key = "ui_text_replacements_localised_text_phar_sea_war_spoils_resource_tooltip",
				icon_path = "UI/skins/default/sea_war_spoils/icon_food.png",
			},
			-- `levels` is a 2-dimensional table which specifies the amount of resource to provide for a particular faction war-spoils level as well as region's main building level
			-- eg. to get the amount of food resource granted for a faction with war spoils level equal to 3, and main building level equal to 4 use:
			-- resource_amount = war_spoils.config.benefits["resource_food"].levels[3][4]
			-- or
			-- resource_amount = war_spoils.config.benefits["resource_food"].levels[faction_level][region_main_building_level]
			levels = {
				{
					0, 0, 0, 0, 0,
				},
				{
					190, 475, 1330, 1900, 2375,
				},
				{
					380, 950, 2660, 3800, 4750,
				},
				{
					950, 2375, 6650, 9500, 11875,
				},
				{
					1140, 2850, 7980, 11400, 14250,
				},
				{
					1283, 3206, 8978, 12825, 16031,
				},
			},

			-- apply = function,

			resource_key = "troy_food",
		},

		resource_wood = {
			ui = {
				resource_localization_key = "ui_text_replacements_localised_text_hp_title_wood",
				title_localization_key = "ui_text_replacements_localised_text_phar_sea_war_spoils_wood",
				tooltip_localization_key = "ui_text_replacements_localised_text_phar_sea_war_spoils_resource_tooltip",
				icon_path = "UI/skins/default/sea_war_spoils/icon_wood.png",
			},
			levels = {
				{
					0, 0, 0, 0, 0,
				},
				{
					16, 40, 112, 160, 200,
				},
				{
					32, 80, 224, 320, 400,
				},
				{
					80, 200, 560, 800, 1000,
				},
				{
					96, 240, 672, 960, 1200,
				},
				{
					108, 270, 756, 1080, 1350,
				},
			},

			-- apply = function,

			resource_key = "troy_wood",
		},

		resource_stone = {
			ui = {
				resource_localization_key = "ui_text_replacements_localised_text_hp_title_stone",
				title_localization_key = "ui_text_replacements_localised_text_phar_sea_war_spoils_stone",
				tooltip_localization_key = "ui_text_replacements_localised_text_phar_sea_war_spoils_resource_tooltip",
				icon_path = "UI/skins/default/sea_war_spoils/icon_stone.png",
			},
			levels = {
				{
					0, 0, 0, 0, 0,
				},
				{
					40, 100, 280, 400, 500,
				},
				{
					80, 200, 560, 800, 1000,
				},
				{
					200, 500, 1400, 2000, 2500,
				},
				{
					240, 600, 1680, 2400, 3000,
				},
				{
					270, 675, 1890, 2700, 3375,
				},
			},

			-- apply = function,

			resource_key = "troy_stones",
		},

		resource_bronze = {
			ui = {
				resource_localization_key = "ui_text_replacements_localised_text_hp_title_bronze",
				title_localization_key = "ui_text_replacements_localised_text_phar_sea_war_spoils_bronze",
				tooltip_localization_key = "ui_text_replacements_localised_text_phar_sea_war_spoils_resource_tooltip",
				icon_path = "UI/skins/default/sea_war_spoils/icon_bronze.png",
			},
			levels = {
				{
					0, 0, 0, 0, 0,
				},
				{
					54, 135, 378, 540, 675,
				},
				{
					108, 270, 756, 1080, 1350,
				},
				{
					270, 675, 1890, 2700, 3375,
				},
				{
					324, 810, 2268, 3240, 4050,
				},
				{
					365, 911, 2552, 3645, 4556,
				},
			},

			-- apply = function,

			resource_key = "troy_bronze",
		},

		resource_gold = {
			ui = {
				resource_localization_key = "ui_text_replacements_localised_text_hp_title_gold",
				title_localization_key = "ui_text_replacements_localised_text_phar_sea_war_spoils_gold",
				tooltip_localization_key = "ui_text_replacements_localised_text_phar_sea_war_spoils_resource_tooltip",
				icon_path = "UI/skins/default/sea_war_spoils/icon_gold.png",
			},
			levels = {
				--[1] =
				{--	[1],[2],[3],[4],[5]
					0, 0, 0, 0, 0,
				},
				--[2] =
				{
					30, 75, 210, 300, 375,
				},
				--[3] =
				{
					60, 150, 420, 600, 750,
				},
				--[4] =
				{
					150, 375, 1050, 1500, 1875,
				},
				--[5] =
				{
					180, 450, 1260, 1800, 2250,
				},
				--[6] =
				{
					205, 505, 1420, 2025, 2530,
				},
			},

			-- apply = function,

			resource_key = "troy_gold",
		},

		vision = {
			ui = {
				title_localization_key = "ui_text_replacements_localised_text_phar_sea_war_spoils_vision",
				tooltip_localization_key = "ui_text_replacements_localised_text_phar_sea_war_spoils_tooltip_vision",
				icon_path = "UI/skins/default/sea_war_spoils/icon_vision.png",
			},
			levels = {	-- for how many turns to provide vision in the realm for, depending on the level
				[1] = 0,
				[2] = 2,
				[3] = 4,
				[4] = 6,
				[5] = 10,
				[6] = 12,
			},

			-- apply = function,

			effect_bundle_key = "effect_bundle_region_line_of_sight_bonus",
		},

		native_units = {
			ui = {
				title_localization_key = "ui_text_replacements_localised_text_phar_sea_war_spoils_native_units",
				tooltip_localization_key = "ui_text_replacements_localised_text_phar_sea_war_spoils_tooltip_native_units",
				icon_path = "UI/skins/default/sea_war_spoils/icon_native_units.png",
			},
			levels = {},	-- for this, `native_units` benefit, the levels table exists in each region config

			-- apply = function,
		},

		experience = {
			ui = {
				title_localization_key = "ui_text_replacements_localised_text_phar_sea_war_spoils_experience",
				tooltip_localization_key = "ui_text_replacements_localised_text_phar_sea_war_spoils_tooltip_experience",
				icon_path = "UI/skins/default/sea_war_spoils/icon_experience.png",
			},
			levels = {	-- how much experience to provide, depending on the level
				[1] = 0,
				[2] = 1500,
				[3] = 2500,
				[4] = 3500,
				[5] = 6000,
				[6] = 7000,
			},

			-- apply = function,
		},

		development_points = {
			ui = {
				title_localization_key = "ui_text_replacements_localised_text_phar_sea_war_spoils_development_points",
				tooltip_localization_key = "ui_text_replacements_localised_text_phar_sea_war_spoils_tooltip_development_points",
				icon_path = "UI/skins/default/sea_war_spoils/icon_horde_surplus.png",
			},
			levels = {	-- how many development points to grant to the army, depending on the level
				[1] = 0,
				[2] = 2,
				[3] = 4,
				[4] = 6,
				[5] = 10,
				[6] = 12,
			},

			-- apply = function,
		},

		ancillaries = {
			ui = {
				title_localization_key = "ui_text_replacements_localised_text_phar_sea_war_spoils_ancillaries",
				tooltip_localization_key = "ui_text_replacements_localised_text_phar_sea_war_spoils_tooltip_ancillaries",
				icon_path = "UI/skins/default/sea_war_spoils/icon_ancillary.png",
			},
			levels = {	-- {how many, and with what percentage} ancillaries to grant depending on their rarity and on the level; the specific rarity ancillaries themselves are chosen randomly from phar_campaign_ancillaries.lua
				[1] = {
					["common"] = {0,0},
					["rare" ]= {0,0},
					["unique"] = {0,0},
				},
				[2] = {
					["common"] = {1,100},
					["rare" ]= {0,0},
					["unique"] = {0,0},
				},
				[3] = {
					["common"] = {0,0},
					["rare" ]= {1,100},
					["unique"] = {0,0},
				},
				[4] = {
					["common"] = {0,0},
					["rare" ]= {2,100},
					["unique"] = {0,0},
				},
				[5] = {
					["common"] = {0,0},
					["rare" ]= {3,100},
					["unique"] = {1,15},
				},
				[6] = {
					["common"] = {0, 0},
					["rare" ]= {3, 100},
					["unique"] = {1, 50},
				},
			},

			-- apply = function,
		},

		effects = {
			ui = {
				title_localization_key = "ui_text_replacements_localised_text_phar_sea_war_spoils_buff_effects",
				tooltip_localization_key = "ui_text_replacements_localised_text_phar_sea_war_spoils_tooltip_buff_effects",
				icon_path = "UI/skins/default/sea_war_spoils/icon_army_supply.png",
			},
			levels = {	-- which effect bundle and for how many turns to apply it, depending on the level
						-- -1 indicates that the effect bundle will not be applied
				[1] = {"", -1},
				[2] = {"phar_sea_effect_bundle_war_spoils_army_supply_level_2", 2},
				[3] = {"phar_sea_effect_bundle_war_spoils_army_supply_level_3", 3},
				[4] = {"phar_sea_effect_bundle_war_spoils_army_supply_level_4", 4},
				[5] = {"phar_sea_effect_bundle_war_spoils_army_supply_level_5", 6},
				[6] = {"phar_sea_effect_bundle_war_spoils_army_supply_level_5", 8},
			},

			-- apply = function,
		},
	},-- war_spoils.config.benefits

	-- each region may provide one or more types of war spoil benefits (but only 1 of each type/benefit_key)
	-- for example the region entry "phar_main_asyut_asyut" below provides 2 benefits
	-- if you want to add additional benefits to a region then append more benefit entries as per the example
	--[[
		phar_main_asyut_asyut = {
			-- [1] =
			{
				benefit_key = "ancillaries",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},	-- the TW factions this region benefit is applicable to
				campaigns = {"phar_main"},								-- the TW campaigns this region benefit is applicable to
			},
			-- [2] =
			{
				benefit_key = "vision",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main"},
			},
		},
	--]]
	regions = {
		phar_main_asyut_asyut = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_asyut_kep_un = {
			{
				benefit_key = "vision",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_asyut_tem_khus = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_akhmim_akhmim = {	-- I used this region to test the implementation
			{
				benefit_key = "native_units",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
				levels = {
					[1] = {},
					[2] = { "phar_main_nat_upp_upper_egyptian_khopesh_warriors", },
					[3] = { "phar_main_nat_upp_upper_egyptian_khopesh_warriors", "phar_main_nat_upp_upper_egyptian_renowned_archers", },
					[4] = { "phar_main_nat_upp_egyptian_chariots", "phar_main_nat_upp_upper_egyptian_khopesh_warriors", "phar_main_nat_upp_upper_egyptian_renowned_archers", },
					[5] = { "phar_main_nat_upp_egyptian_chariots", "phar_main_nat_upp_upper_egyptian_khopesh_warriors", "phar_main_nat_upp_upper_egyptian_mace_axe_warriors", "phar_main_nat_upp_upper_egyptian_renowned_archers", },
					[6] = { "phar_main_nat_upp_egyptian_chariots", "phar_main_nat_upp_upper_egyptian_khopesh_warriors", "phar_main_nat_upp_upper_egyptian_mace_axe_warriors", "phar_main_nat_upp_upper_egyptian_renowned_archers", "phar_main_nat_upp_upper_egyptian_mace_axe_warriors", "phar_main_nat_upp_upper_egyptian_renowned_archers", },
				},
			},
		},
		phar_main_akhmim_mefka_qes = {
			{
				benefit_key = "ancillaries",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_akhmim_ur_men = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_saww_mefka_beh = {
			{
				benefit_key = "development_points",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_saww_saww = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_saww_sheps_uab = {
			{
				benefit_key = "experience",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_abydos_aakh_ner = {
			{
				benefit_key = "experience",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_abydos_abydos = {
			{
				benefit_key = "effects",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_abydos_tin = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_thebes_kha_ti = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_thebes_sma_ua = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_thebes_thebes = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_elephantine_elephantine = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_elephantine_hierakonpolis = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_elephantine_mes = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_elephantine_tep_hetem = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_kom_ombo_kha_sba = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_kom_ombo_kom_ombo = {
			{
				benefit_key = "native_units",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
				levels = {
					[1] = {},
					[2] = { "phar_main_nat_upp_upper_egyptian_khopesh_warriors", },
					[3] = { "phar_main_nat_upp_upper_egyptian_khopesh_warriors", "phar_main_nat_upp_upper_egyptian_renowned_archers", },
					[4] = { "phar_main_nat_upp_egyptian_chariots", "phar_main_nat_upp_upper_egyptian_khopesh_warriors", "phar_main_nat_upp_upper_egyptian_renowned_archers", },
					[5] = { "phar_main_nat_upp_egyptian_chariots", "phar_main_nat_upp_upper_egyptian_khopesh_warriors", "phar_main_nat_upp_upper_egyptian_mace_axe_warriors", "phar_main_nat_upp_upper_egyptian_renowned_archers", },
					[6] = { "phar_main_nat_upp_egyptian_chariots", "phar_main_nat_upp_upper_egyptian_khopesh_warriors", "phar_main_nat_upp_upper_egyptian_mace_axe_warriors", "phar_main_nat_upp_upper_egyptian_renowned_archers", "phar_main_nat_upp_upper_egyptian_mace_axe_warriors", "phar_main_nat_upp_upper_egyptian_renowned_archers", },
				},
			},
		},
		phar_main_kom_ombo_tchu_ua = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_pi_ramesses_per_amun = {
			{
				benefit_key = "vision",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_pi_ramesses_pi_ramesses = {
			{
				benefit_key = "native_units",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
				levels = {
					[1] = {},
					[2] = { "phar_main_nat_low_egyptian_chariots", },
					[3] = { "phar_main_nat_low_egyptian_chariots", "phar_main_nat_low_egyptian_chariots", },
					[4] = { "phar_main_nat_low_egyptian_chariots", "phar_main_nat_low_egyptian_chariots", "phar_main_nat_low_egyptian_chariots", },
					[5] = { "phar_main_nat_low_egyptian_chariots", "phar_main_nat_low_egyptian_chariots", "phar_main_nat_low_egyptian_chariots", "phar_main_nat_low_egyptian_chariots", },
					[6] = { "phar_main_nat_low_egyptian_chariots", "phar_main_nat_low_egyptian_chariots", "phar_main_nat_low_egyptian_chariots", "phar_main_nat_low_egyptian_chariots", "phar_main_nat_low_egyptian_chariots", "phar_main_nat_low_egyptian_chariots", },
				},
			},
		},
		phar_main_pi_ramesses_tjaru = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_heliopolis_heliopolis = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_heliopolis_qes = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_buto_buto = {
			{
				benefit_key = "experience",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_buto_paiuenamun = {
			{
				benefit_key = "development_points",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_buto_sais = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_rhacotis_khan_aha = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_rhacotis_qema = {
			{
				benefit_key = "vision",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_rhacotis_rhacotis = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_faiyum_dahshur = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_faiyum_faiyum = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_faiyum_khem = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_hermopolis_ti_ar = {
			{
				benefit_key = "experience",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_hermopolis_hermopolis = {
			{
				benefit_key = "ancillaries",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_amarna_amarna = {
			{
				benefit_key = "effects",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_hardai_hardai = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_hardai_tep_aha = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_hardai_ur_gem = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_herakleopolis_herakleopolis = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_herakleopolis_sheps_khu = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_memphis_helwan = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_memphis_memphis = {
			{
				benefit_key = "effects",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_memphis_petpeh = {
			{
				benefit_key = "development_points",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_amunia_amunia = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_amunia_met_usr = {
			{
				benefit_key = "vision",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_amunia_ner_neb = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_bahariya_oasis_bahariya_oasis = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_bahariya_oasis_mefka = {
			{
				benefit_key = "development_points",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_bahariya_oasis_set_neb = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_farafra_oasis_aakh_sa = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_farafra_oasis_farafra_oasis = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_farafra_oasis_msha_khefti = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_kharga_oasis_kharga_oasis = {
			{
				benefit_key = "native_units",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
				levels = {
					[1] = {},
					[2] = { "phar_main_nat_wes_libu_composite_bowmen", },
					[3] = { "phar_main_nat_wes_libu_desert_swords", "phar_main_nat_wes_libu_composite_bowmen", },
					[4] = { "phar_main_nat_wes_libu_desert_swords", "phar_main_nat_wes_libu_composite_bowmen", "phar_main_nat_wes_libu_composite_bowmen", },
					[5] = { "phar_main_nat_wes_libu_desert_swords", "phar_main_nat_wes_libu_desert_swords", "phar_main_nat_wes_libu_composite_bowmen", "phar_main_nat_wes_libu_composite_bowmen", },
					[6] = { "phar_main_nat_wes_libu_desert_swords", "phar_main_nat_wes_libu_desert_swords", "phar_main_nat_wes_libu_composite_bowmen", "phar_main_nat_wes_libu_composite_bowmen", "phar_main_nat_wes_libu_composite_bowmen", "phar_main_nat_wes_libu_composite_bowmen", },
				},
			},
		},
		phar_main_kharga_oasis_shesp_net = {
			{
				benefit_key = "development_points",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_kharga_oasis_tebh = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_dakhla_oasis_dakhla_oasis = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_dakhla_oasis_khesef = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_dakhla_oasis_tcham = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_kurkur_oasis_kurkur_oasis = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_kurkur_oasis_sen_hetem = {
			{
				benefit_key = "experience",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_kurkur_oasis_tcheba_ua = {
			{
				benefit_key = "ancillaries",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_dungul_oasis_dungul_asis = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_dungul_oasis_tem_pa = {
			{
				benefit_key = "native_units",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
				levels = {
					[1] = {},
					[2] = { "phar_main_nat_wes_libu_composite_bowmen", },
					[3] = { "phar_main_nat_wes_libu_desert_swords", "phar_main_nat_wes_libu_composite_bowmen", },
					[4] = { "phar_main_nat_wes_libu_desert_swords", "phar_main_nat_wes_libu_composite_bowmen", "phar_main_nat_wes_libu_composite_bowmen", },
					[5] = { "phar_main_nat_wes_libu_desert_swords", "phar_main_nat_wes_libu_desert_swords", "phar_main_nat_wes_libu_composite_bowmen", "phar_main_nat_wes_libu_composite_bowmen", },
					[6] = { "phar_main_nat_wes_libu_desert_swords", "phar_main_nat_wes_libu_desert_swords", "phar_main_nat_wes_libu_composite_bowmen", "phar_main_nat_wes_libu_composite_bowmen", "phar_main_nat_wes_libu_composite_bowmen", "phar_main_nat_wes_libu_composite_bowmen", },
				},
			},
		},
		phar_main_dungul_oasis_thes = {
			{
				benefit_key = "effects",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_dungul_oasis_utch = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_north_nubia_miam = {
			{
				benefit_key = "native_units",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
				levels = {
					[1] = {},
					[2] = { "phar_main_nat_nub_renowned_nubian_longbowmen", },
					[3] = { "phar_main_nat_nub_renowned_nubian_longbowmen", "phar_main_nat_nub_renowned_nubian_longbowmen", },
					[4] = { "phar_main_nat_nub_renowned_nubian_longbowmen", "phar_main_nat_nub_renowned_nubian_longbowmen", "phar_main_nat_nub_renowned_nubian_longbowmen", },
					[5] = { "phar_main_nat_nub_renowned_nubian_longbowmen", "phar_main_nat_nub_renowned_nubian_longbowmen", "phar_main_nat_nub_renowned_nubian_longbowmen", "phar_main_nat_nub_renowned_nubian_longbowmen", },
					[6] = { "phar_main_nat_nub_renowned_nubian_longbowmen", "phar_main_nat_nub_renowned_nubian_longbowmen", "phar_main_nat_nub_renowned_nubian_longbowmen", "phar_main_nat_nub_renowned_nubian_longbowmen", "phar_main_nat_nub_renowned_nubian_longbowmen", "phar_main_nat_nub_renowned_nubian_longbowmen", },
				},
			},
		},
		phar_main_north_nubia_mu_ua = {
			{
				benefit_key = "vision",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_north_nubia_res_pa = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_north_east_nubia_hetch_pa = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_north_east_nubia_utcha_uas = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_buhen_buhen = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_buhen_hap_au = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_buhen_her_hetem = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_buhen_shesp_ma = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_east_nubia_khefti_gehes = {
			{
				benefit_key = "ancillaries",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_east_nubia_tep_heb = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_east_nubia_ti_neb = {
			{
				benefit_key = "effects",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_per_ramesses_meri_amon_hap_sh = {
			{
				benefit_key = "development_points",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_per_ramesses_meri_amon_khet_pa = {
			{
				benefit_key = "vision",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_per_ramesses_meri_amon_per_ramesses_meri_amon = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_kerma_kerma = {
			{
				benefit_key = "effects",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_kerma_mu_sh = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_kerma_nu_abu = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_kerma_uab_khu = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_kawa_abu_ab = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_kawa_kawa = {
			{
				benefit_key = "native_units",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
				levels = {
					[1] = {},
					[2] = { "phar_main_nat_nub_renowned_kushite_archers", },
					[3] = { "phar_main_nat_nub_renowned_kushite_archers", "phar_main_nat_nub_renowned_kushite_archers", },
					[4] = { "phar_main_nat_nub_renowned_kushite_archers", "phar_main_nat_nub_renowned_kushite_archers", "phar_main_nat_nub_renowned_kushite_archers", },
					[5] = { "phar_main_nat_nub_renowned_kushite_archers", "phar_main_nat_nub_renowned_kushite_archers", "phar_main_nat_nub_renowned_kushite_archers", "phar_main_nat_nub_renowned_kushite_archers", },
					[6] = { "phar_main_nat_nub_renowned_kushite_archers", "phar_main_nat_nub_renowned_kushite_archers", "phar_main_nat_nub_renowned_kushite_archers", "phar_main_nat_nub_renowned_kushite_archers", "phar_main_nat_nub_renowned_kushite_archers", "phar_main_nat_nub_renowned_kushite_archers", },
				},
			},
		},
		phar_main_kawa_khus_qes = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_napata_hem_shema = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_napata_napata = {
			{
				benefit_key = "ancillaries",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_napata_res_khet = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_napata_res_tua = {
			{
				benefit_key = "experience",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_ashkelon_pel = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_north_sinai_azzati = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_north_sinai_neb_gehes = {
			{
				benefit_key = "effects",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_north_sinai_nekhel = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_north_sinai_sukkot = {
			{
				benefit_key = "vision",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_east_sinai_beersheba = {
			{
				benefit_key = "native_units",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
				levels = {
					[1] = {},
					[2] = { "phar_main_nat_sin_habiru_mercenaries", },
					[3] = { "phar_main_nat_sin_armoured_canaanite_chariots", "phar_main_nat_sin_habiru_mercenaries", },
					[4] = { "phar_main_nat_sin_armoured_canaanite_chariots", "phar_main_nat_sin_habiru_mercenaries", "phar_main_nat_sin_renowned_habiru_slingers", },
					[5] = { "phar_main_nat_sin_armoured_canaanite_chariots", "phar_main_nat_sin_armoured_canaanite_chariots", "phar_main_nat_sin_habiru_mercenaries", "phar_main_nat_sin_renowned_habiru_slingers", },
					[6] = { "phar_main_nat_sin_armoured_canaanite_chariots", "phar_main_nat_sin_armoured_canaanite_chariots", "phar_main_nat_sin_habiru_mercenaries", "phar_main_nat_sin_renowned_habiru_slingers", "phar_main_nat_sin_habiru_mercenaries", "phar_main_nat_sin_renowned_habiru_slingers", },
				},
			},
		},
		phar_main_east_sinai_khet_khefti = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_sinai_hetch = {
			{
				benefit_key = "ancillaries",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_sinai_tchu_am = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_sinai_tchu_sh = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_ashkelon_ashkelon = {
			{
				benefit_key = "effects",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_ashkelon_urushalim = {
			{
				benefit_key = "development_points",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_kadesh_kadesh = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_kadesh_sumur = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_tyre_byblos = {
			{
				benefit_key = "ancillaries",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_tyre_hazor = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_tyre_sidon = {
			{
				benefit_key = "native_units",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
				levels = {
					[1] = {},
					[2] = { "phar_main_nat_fen_armoured_syrian_archers", },
					[3] = { "phar_main_nat_fen_armoured_syrian_archers", "phar_main_nat_fen_renowned_canaanite_swordsmen", },
					[4] = { "phar_main_nat_fen_armoured_canaanite_chariots", "phar_main_nat_fen_armoured_syrian_archers", "phar_main_nat_fen_renowned_canaanite_swordsmen", },
					[5] = { "phar_main_nat_fen_armoured_canaanite_chariots", "phar_main_nat_fen_armoured_syrian_archers", "phar_main_nat_fen_renowned_canaanite_swordsmen", "phar_main_nat_fen_veteran_canaanite_shieldbearers", },
					[6] = { "phar_main_nat_fen_armoured_canaanite_chariots", "phar_main_nat_fen_armoured_syrian_archers", "phar_main_nat_fen_renowned_canaanite_swordsmen", "phar_main_nat_fen_veteran_canaanite_shieldbearers", "phar_main_nat_fen_renowned_canaanite_swordsmen", "phar_main_nat_fen_veteran_canaanite_shieldbearers", },
				},
			},
		},
		phar_main_tyre_tyre = {
			{
				benefit_key = "vision",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_megiddo_megiddo = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_megiddo_yapo = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_emar_emar = {
			{
				benefit_key = "ancillaries",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_emar_qatna = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_emar_teshub = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_damascus_damascus = {
			{
				benefit_key = "effects",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_damascus_jawa = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_damascus_sedad = {
			{
				benefit_key = "native_units",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
				levels = {
					[1] = {},
					[2] = { "phar_main_nat_sin_habiru_mercenaries", },
					[3] = { "phar_main_nat_sin_armoured_canaanite_chariots", "phar_main_nat_sin_habiru_mercenaries", },
					[4] = { "phar_main_nat_sin_armoured_canaanite_chariots", "phar_main_nat_sin_habiru_mercenaries", "phar_main_nat_sin_renowned_habiru_slingers", },
					[5] = { "phar_main_nat_sin_armoured_canaanite_chariots", "phar_main_nat_sin_armoured_canaanite_chariots", "phar_main_nat_sin_habiru_mercenaries", "phar_main_nat_sin_renowned_habiru_slingers", },
					[6] = { "phar_main_nat_sin_armoured_canaanite_chariots", "phar_main_nat_sin_armoured_canaanite_chariots", "phar_main_nat_sin_habiru_mercenaries", "phar_main_nat_sin_renowned_habiru_slingers", "phar_main_nat_sin_habiru_mercenaries", "phar_main_nat_sin_renowned_habiru_slingers", },
				},
			},
		},
		phar_main_damascus_tadmor = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_shechem_ammon = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_shechem_sakka = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_shechem_shechem = {
			{
				benefit_key = "vision",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_alashiya_alashiya = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_alashiya_kition = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_alashiya_paphos = {
			{
				benefit_key = "experience",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_ugarit_ebla = {
			{
				benefit_key = "native_units",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
				levels = {
					[1] = {},
					[2] = { "phar_main_nat_fen_veteran_canaanite_shieldbearers", },
					[3] = { "phar_main_nat_fen_armoured_syrian_archers", "phar_main_nat_fen_veteran_canaanite_shieldbearers", },
					[4] = { "phar_main_nat_fen_armoured_canaanite_chariots", "phar_main_nat_fen_armoured_syrian_archers", "phar_main_nat_fen_veteran_canaanite_shieldbearers", },
					[5] = { "phar_main_nat_fen_armoured_canaanite_chariots", "phar_main_nat_fen_armoured_syrian_archers", "phar_main_nat_fen_renowned_canaanite_swordsmen", "phar_main_nat_fen_veteran_canaanite_shieldbearers", },
					[6] = { "phar_main_nat_fen_armoured_canaanite_chariots", "phar_main_nat_fen_armoured_syrian_archers", "phar_main_nat_fen_renowned_canaanite_swordsmen", "phar_main_nat_fen_veteran_canaanite_shieldbearers", "phar_main_nat_fen_renowned_canaanite_swordsmen", "phar_main_nat_fen_veteran_canaanite_shieldbearers", },
				},
			},
		},
		phar_main_ugarit_ugarit = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_carchemish_carchemish = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_carchemish_harranu = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_carchemish_khantap = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_carchemish_tuba = {
			{
				benefit_key = "vision",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_aleppo_alalah = {
			{
				benefit_key = "ancillaries",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_aleppo_aleppo = {
			{
				benefit_key = "effects",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_tarsus_adana = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_tarsus_kyinda = {
			{
				benefit_key = "development_points",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_tarsus_tarsus = {
			{
				benefit_key = "effects",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_tuwana_cybistra = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_tuwana_hubishna = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_tuwana_kelenderis = {
			{
				benefit_key = "vision",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_tuwana_tuwana = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_south_hatti_cibyra = {
			{
				benefit_key = "native_units",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
				levels = {
					[1] = {},
					[2] = { "phar_main_nat_isu_heavy_anatolian_chariots", },
					[3] = { "phar_main_nat_isu_heavy_anatolian_chariots", "phar_main_nat_isu_armoured_anatolian_swordsmen", },
					[4] = { "phar_main_nat_isu_heavy_anatolian_chariots", "phar_main_nat_isu_renowned_isuwan_axemen", "phar_main_nat_isu_armoured_anatolian_swordsmen", },
					[5] = { "phar_main_nat_isu_heavy_anatolian_chariots", "phar_main_nat_isu_heavy_anatolian_chariots", "phar_main_nat_isu_renowned_isuwan_axemen", "phar_main_nat_isu_armoured_anatolian_swordsmen", },
					[6] = { "phar_main_nat_isu_heavy_anatolian_chariots", "phar_main_nat_isu_heavy_anatolian_chariots", "phar_main_nat_isu_renowned_isuwan_axemen", "phar_main_nat_isu_armoured_anatolian_swordsmen", "phar_main_nat_isu_renowned_isuwan_axemen", "phar_main_nat_isu_armoured_anatolian_swordsmen", },
				},
			},
		},
		phar_main_south_hatti_lystra = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_south_hatti_tarhuntassa = {
			{
				benefit_key = "ancillaries",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_parha_isaura = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_parha_parha = {
			{
				benefit_key = "experience",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_parha_sagalassos = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_central_hatti_koropissos = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_central_hatti_larawanda = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_central_hatti_pegella = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_north_hatti_andrapa = {
			{
				benefit_key = "experience",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_north_hatti_dadastana = {
			{
				benefit_key = "experience",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_north_hatti_dusae = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_north_hatti_krateia = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_ancyra_ancyra = {
			{
				benefit_key = "native_units",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
				levels = {
					[1] = {},
					[2] = { "phar_main_nat_hig_heavy_anatolian_chariots", },
					[3] = { "phar_main_nat_hig_heavy_anatolian_chariots", "phar_main_nat_hig_kaskian_raiders", },
					[4] = { "phar_main_nat_hig_heavy_anatolian_chariots", "phar_main_nat_hig_kaskian_raiders", "phar_main_nat_hig_renowned_phrygian_javelin_throwers", },
					[5] = { "phar_main_nat_hig_heavy_anatolian_chariots", "phar_main_nat_hig_heavy_anatolian_chariots", "phar_main_nat_hig_kaskian_raiders", "phar_main_nat_hig_renowned_phrygian_javelin_throwers", },
					[6] = { "phar_main_nat_hig_heavy_anatolian_chariots", "phar_main_nat_hig_heavy_anatolian_chariots", "phar_main_nat_hig_kaskian_raiders", "phar_main_nat_hig_renowned_phrygian_javelin_throwers", "phar_main_nat_hig_kaskian_raiders", "phar_main_nat_hig_renowned_phrygian_javelin_throwers", },
				},
			},
		},
		phar_main_ancyra_aspona = {
			{
				benefit_key = "development_points",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_ancyra_lagania = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_west_hatti_abrostola = {
			{
				benefit_key = "vision",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_west_hatti_dorylaion = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_west_hatti_gordion = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_west_hatti_pessinus = {
			{
				benefit_key = "development_points",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_purushanda_mokissos = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_purushanda_nyssa = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_purushanda_purushanda = {
			{
				benefit_key = "ancillaries",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_hattussa_ankuwa = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_hattussa_arinna = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_hattussa_corniaspa = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_hattussa_hattussa = {
			{
				benefit_key = "effects",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_zippalanda_amaseia = {
			{
				benefit_key = "ancillaries",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_zippalanda_nerik = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_zippalanda_sapinuwa = {
			{
				benefit_key = "development_points",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_zippalanda_zippalanda = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_malidiya_malidiya = {
			{
				benefit_key = "effects",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_malidiya_samuha = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_malidiya_tegarama = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_malidiya_zara = {
			{
				benefit_key = "native_units",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
				levels = {
					[1] = {},
					[2] = { "phar_main_nat_isu_renowned_isuwan_axemen", },
					[3] = { "phar_main_nat_isu_heavy_anatolian_chariots", "phar_main_nat_isu_renowned_isuwan_axemen", },
					[4] = { "phar_main_nat_isu_heavy_anatolian_chariots", "phar_main_nat_isu_renowned_isuwan_axemen", "phar_main_nat_isu_armoured_anatolian_swordsmen", },
					[5] = { "phar_main_nat_isu_heavy_anatolian_chariots", "phar_main_nat_isu_renowned_isuwan_axemen", "phar_main_nat_isu_renowned_isuwan_axemen", "phar_main_nat_isu_armoured_anatolian_swordsmen", },
					[6] = { "phar_main_nat_isu_heavy_anatolian_chariots", "phar_main_nat_isu_renowned_isuwan_axemen", "phar_main_nat_isu_renowned_isuwan_axemen", "phar_main_nat_isu_armoured_anatolian_swordsmen", "phar_main_nat_isu_renowned_isuwan_axemen", "phar_main_nat_isu_armoured_anatolian_swordsmen", },
				},
			},
		},
		phar_main_kanesh_kanesh = {
			{
				benefit_key = "vision",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_kanesh_kummanni = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_main_kanesh_saricha = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_aeolia_iolcos = {
			{
				benefit_key = "experience",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_aeolia_pharsalos = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_aeolia_pteleon = {
			{
				benefit_key = "native_units",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
				levels = {
					[1] = {},
					[2] = { "phar_map_nat_ach_argive_axemen", },
					[3] = { "phar_map_nat_ach_argive_axemen", "phar_map_nat_ach_shielded_spearmen", },
					[4] = { "phar_map_nat_ach_argive_axemen", "phar_map_nat_ach_argive_axemen", "phar_map_nat_ach_shielded_spearmen", },
					[5] = { "phar_map_nat_ach_argive_axemen", "phar_map_nat_ach_argive_axemen", "phar_map_nat_ach_shielded_spearmen", "phar_map_nat_ach_shielded_spearmen", },
					[6] = { "phar_map_nat_ach_argive_axemen", "phar_map_nat_ach_argive_axemen", "phar_map_nat_ach_argive_axemen", "phar_map_nat_ach_shielded_spearmen", "phar_map_nat_ach_shielded_spearmen", "phar_map_nat_ach_shielded_spearmen", },
				},
			},
		},
		phar_map_almopia_apsalos = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_almopia_dion = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_aranzah_assur = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_aranzah_karana = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_aranzah_nimrud = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_aranzah_nineveh = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_ashnunnak_der = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_ashnunnak_diniktum = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_ashnunnak_eshnunna = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_ashnunnak_tutub = {
			{
				benefit_key = "effects",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_ashtata_apane = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_ashtata_ashimon = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_ashtata_bukushe = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_ashtata_tuttul = {
			{
				benefit_key = "vision",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_attica_athens = {
			{
				benefit_key = "effects",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_attica_carystos = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_attica_eretria = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_azalzi_amasakku = {
			{
				benefit_key = "development_points",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_azalzi_kahat = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_azalzi_shudu = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_azalzi_zakhiku = {
			{
				benefit_key = "experience",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_balihu_eluhat = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_balihu_harbe = {
			{
				benefit_key = "native_units",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
				levels = {
					[1] = {},
					[2] = { "phar_map_nat_aber_aramean_elite", },
					[3] = { "phar_map_nat_aber_aramean_elite", "phar_map_nat_aber_ahlamu_raiders", },
					[4] = { "phar_map_nat_aber_aramean_elite", "phar_map_nat_aber_ahlamu_raiders", "phar_map_nat_aber_ahlamu_heavy_camelry", },
					[5] = { "phar_map_nat_aber_aramean_elite", "phar_map_nat_aber_aramean_elite", "phar_map_nat_aber_ahlamu_raiders", "phar_map_nat_aber_ahlamu_heavy_camelry", },
					[6] = { "phar_map_nat_aber_aramean_elite", "phar_map_nat_aber_aramean_elite", "phar_map_nat_aber_ahlamu_raiders", "phar_map_nat_aber_ahlamu_raiders", "phar_map_nat_aber_ahlamu_heavy_camelry", "phar_map_nat_aber_ahlamu_heavy_camelry", },
				},
			},
		},
		phar_map_balihu_irridu = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_balihu_zalpah = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_bit_peri_amurru_agade = {
			{
				benefit_key = "ancillaries",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_bit_peri_amurru_dur_kurigalzu = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_bit_peri_amurru_sur_marrati= {
			{
				benefit_key = "development_points",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_bithynia_apollonia = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_bithynia_cythoros = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_bithynia_pylae = {
			{
				benefit_key = "experience",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_boeotia_calydon = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_boeotia_cyparissos = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_boeotia_thebes = {
			{
				benefit_key = "vision",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_caria_halicarnassos = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_caria_knidos = {
			{
				benefit_key = "experience",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_cephallenia_hyrie = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_cephallenia_ithaca = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_cephallenia_lefcas = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_cyclades_andros = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_cyclades_melos = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_cyclades_minoa = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_cyclades_naxos = {
			{
				benefit_key = "development_points",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_hanigalbat_dur_katlimmu = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_hanigalbat_sangaritu = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_hanigalbat_shadikanni = {
			{
				benefit_key = "ancillaries",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_hanigalbat_washukanni = {
			{
				benefit_key = "vision",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_hapalla_arowanna = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_hapalla_hapalla = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_hapalla_kalasma = {
			{
				benefit_key = "native_units",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
				levels = {
					[1] = {},
					[2] = { "phar_map_nat_wil_heavy_trojan_spearmen", },
					[3] = { "phar_map_nat_wil_heavy_trojan_spearmen", "phar_map_nat_wil_armoured_lycian_archers", },
					[4] = { "phar_map_nat_wil_heavy_trojan_spearmen", "phar_map_nat_wil_armoured_lycian_archers", "phar_map_nat_wil_archer_chariots", },
					[5] = { "phar_map_nat_wil_heavy_trojan_spearmen", "phar_map_nat_wil_armoured_lycian_archers", "phar_map_nat_wil_archer_chariots", "phar_map_nat_wil_heavy_shock_spears", },
					[6] = { "phar_map_nat_wil_heavy_trojan_spearmen", "phar_map_nat_wil_heavy_trojan_spearmen", "phar_map_nat_wil_armoured_lycian_archers", "phar_map_nat_wil_armoured_lycian_archers", "phar_map_nat_wil_archer_chariots", "phar_map_nat_wil_heavy_shock_spears", },
				},
			},
		},
		phar_map_hapalla_pitassa = {
			{
				benefit_key = "vision",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_hayasa_azzi_aripsha = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_hayasa_azzi_hayasha = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_hayasa_azzi_upumu = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_ilion_adresteia = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_ilion_percote = {
			{
				benefit_key = "effects",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_ilion_troy = {
			{
				benefit_key = "ancillaries",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_ilion_zeleia = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_isthmos_cibyra = {
			{
				benefit_key = "effects",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_isthmos_kaunos = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_isthmos_mobolla = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_kadmuhu_kindari = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_kadmuhu_mardama = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_kadmuhu_shibaniba = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_kadmuhu_tushhap = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_kammanu_amidu = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_kammanu_kummaha = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_kammanu_melid = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_kammanu_uiram = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_kan_digirak_babylon = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_karduniash_ishtananu_lagash = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_karduniash_ishtananu_larak = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_karduniash_ishtananu_malgu = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_karduniash_ishtananu_nippur = {
			{
				benefit_key = "ancillaries",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_karduniash_shutaiu_borsippa = {
			{
				benefit_key = "native_units",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
				levels = {
					[1] = {},
					[2] = { "phar_map_nat_tamti_akkadian_armoured_archers", },
					[3] = { "phar_map_nat_tamti_akkadian_armoured_archers", "phar_map_nat_tamti_akkadian_armoured_archers", },
					[4] = { "phar_map_nat_tamti_akkadian_armoured_archers", "phar_map_nat_tamti_akkadian_armoured_archers", "phar_map_nat_tamti_akkadian_warriors", },
					[5] = { "phar_map_nat_tamti_akkadian_armoured_archers", "phar_map_nat_tamti_akkadian_armoured_archers", "phar_map_nat_tamti_akkadian_warriors", "phar_map_nat_tamti_akkadian_warriors", },
					[6] = { "phar_map_nat_tamti_akkadian_armoured_archers", "phar_map_nat_tamti_akkadian_armoured_archers", "phar_map_nat_tamti_akkadian_armoured_archers", "phar_map_nat_tamti_akkadian_armoured_archers", "phar_map_nat_tamti_akkadian_warriors", "phar_map_nat_tamti_akkadian_warriors", },
				},
			},
		},
		phar_map_karduniash_shutaiu_ur = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_karduniash_shutaiu_uruk = {
			{
				benefit_key = "development_points",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_kretes_knossos = {
			{
				benefit_key = "ancillaries",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_kretes_kydonia = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_kretes_phaestos = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_kretes_setaea = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_kuwaliya_appawiya = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_kuwaliya_kuwaliya = {
			{
				benefit_key = "ancillaries",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_kuwaliya_ninoe = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_kuwaliya_walna = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_lacedaemon_altis = {
			{
				benefit_key = "development_points",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_lacedaemon_cythera = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_lacedaemon_pylos = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_lacedaemon_sparta = {
			{
				benefit_key = "ancillaries",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_latmos_dolyche = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_maeonia_ephesos = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_latmos_samos = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_lycia_balbura = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_lycia_peraia = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_lycia_phellos = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_lycia_telmessos = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_macedonia_arnissa = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_macedonia_cassope = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_macedonia_dolopeis = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_maeonia_milethus = {
			{
				benefit_key = "native_units",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
				levels = {
					[1] = {},
					[2] = { "phar_map_nat_wil_heavy_shock_spears", },
					[3] = { "phar_map_nat_wil_heavy_shock_spears", "phar_map_nat_wil_armoured_lycian_archers", },
					[4] = { "phar_map_nat_wil_heavy_shock_spears", "phar_map_nat_wil_armoured_lycian_archers", "phar_map_nat_wil_archer_chariots", },
					[5] = { "phar_map_nat_wil_heavy_shock_spears", "phar_map_nat_wil_armoured_lycian_archers", "phar_map_nat_wil_archer_chariots", "phar_map_nat_wil_heavy_trojan_spearmen", },
					[6] = { "phar_map_nat_wil_heavy_shock_spears", "phar_map_nat_wil_heavy_shock_spears", "phar_map_nat_wil_armoured_lycian_archers", "phar_map_nat_wil_archer_chariots", "phar_map_nat_wil_archer_chariots", "phar_map_nat_wil_heavy_trojan_spearmen", },
				},
			},
		},
		phar_map_maeonia_erythrae = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_maeonia_eyanthia = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_mari_duara = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_mari_mari = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_mari_supru = {
			{
				benefit_key = "experience",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_mari_terqa = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_mycenaeca_aegion = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_mycenaeca_corinth = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_mycenaeca_mycenae = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_mycenaeca_tiryns = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_northern_elam_kabnak = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_northern_elam_madaktu = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_northern_elam_pashime = {
			{
				benefit_key = "native_units",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
				levels = {
					[1] = {},
					[2] = { "phar_map_nat_halt_elamite_veterans", },
					[3] = { "phar_map_nat_halt_elamite_veterans", "phar_map_nat_halt_elamite_veteran_archers", },
					[4] = { "phar_map_nat_halt_elamite_veterans", "phar_map_nat_halt_elamite_veteran_archers", "phar_map_nat_halt_elamite_veteran_vanguard", },
					[5] = { "phar_map_nat_halt_elamite_veterans", "phar_map_nat_halt_elamite_veteran_archers", "phar_map_nat_halt_elamite_veteran_vanguard", "phar_map_nat_halt_elamite_veteran_slingers", },
					[6] = { "phar_map_nat_halt_elamite_veterans", "phar_map_nat_halt_elamite_veterans", "phar_map_nat_halt_elamite_veteran_archers", "phar_map_nat_halt_elamite_veteran_archers", "phar_map_nat_halt_elamite_veteran_vanguard", "phar_map_nat_halt_elamite_veteran_slingers", },
				},
			},
		},
		phar_map_northern_elam_susa = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_parha_myra = {
			{
				benefit_key = "development_points",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_qutu_atlila = {
			{
				benefit_key = "development_points",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_qutu_halman = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_qutu_nisir = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_qutu_tumma = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_radanu_admannu = {
			{
				benefit_key = "effects",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_radanu_arrapha = {
			{
				benefit_key = "ancillaries",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_radanu_lubdu = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_rhodes_arcasia = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_rhodes_ialysos = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_rhodes_lindos = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_sinticobisaltia_olophyxos = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_sinticobisaltia_scione = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_sinticobisaltia_siris = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_suhum_elu_anat = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_suhum_elu_haradu = {
			{
				benefit_key = "native_units",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
				levels = {
					[1] = {},
					[2] = { "phar_map_nat_assur_akkadian_defenders", },
					[3] = { "phar_map_nat_assur_akkadian_defenders", "phar_map_nat_wil_heavy_shock_spears", },
					[4] = { "phar_map_nat_assur_akkadian_defenders", "phar_map_nat_assur_akkadian_defenders", "phar_map_nat_wil_heavy_shock_spears", },
					[5] = { "phar_map_nat_assur_akkadian_defenders", "phar_map_nat_assur_akkadian_defenders", "phar_map_nat_wil_heavy_shock_spears", "phar_map_nat_wil_heavy_shock_spears", },
					[6] = { "phar_map_nat_assur_akkadian_defenders", "phar_map_nat_assur_akkadian_defenders", "phar_map_nat_assur_akkadian_defenders", "phar_map_nat_wil_heavy_shock_spears", "phar_map_nat_wil_heavy_shock_spears", "phar_map_nat_wil_heavy_shock_spears", },
				},
			},
		},
		phar_map_suhum_elu_sapiratum = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_suhum_shaplu_idu = {
			{
				benefit_key = "experience",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_suhum_shaplu_rapiku = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_suhum_shaplu_sippar_amnamun = {
			{
				benefit_key = "vision",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_teythrania_eressos = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_teythrania_kyme = {
			{
				benefit_key = "development_points",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_teythrania_pelopia = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_teythrania_volissos = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_themiscyra_sinope = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_themiscyra_terme = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_themiscyra_zalpa = {
			{
				benefit_key = "ancillaries",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_thynia_athyra = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_thynia_salmydessos = {
			{
				benefit_key = "vision",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_thynia_sipte = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_tummanna_cromna = {
			{
				benefit_key = "effects",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_tummanna_sandaraca = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_tummanna_tummanna = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_uruatri_musasir = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_uruatri_tuali = {
			{
				benefit_key = "vision",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_uruatri_tuspa = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_zabu_kilizi = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_zabu_sussara = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_zabu_urbilim = {
			{
				benefit_key = "native_units",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
				levels = {
					[1] = {},
					[2] = { "phar_map_nat_zag_urartu_guard", },
					[3] = { "phar_map_nat_zag_urartu_guard", "phar_map_nat_zag_cimmerian_elite", },
					[4] = { "phar_map_nat_zag_urartu_guard", "phar_map_nat_zag_urartu_guard", "phar_map_nat_zag_cimmerian_elite", },
					[5] = { "phar_map_nat_zag_urartu_guard", "phar_map_nat_zag_urartu_guard", "phar_map_nat_zag_cimmerian_elite", "phar_map_nat_zag_cimmerian_elite", },
					[6] = { "phar_map_nat_zag_urartu_guard", "phar_map_nat_zag_urartu_guard", "phar_map_nat_zag_urartu_guard", "phar_map_nat_zag_cimmerian_elite", "phar_map_nat_zag_cimmerian_elite", "phar_map_nat_zag_cimmerian_elite", },
				},
			},
		},
		phar_map_zerynthia_nesoi_imbrasos = {
			{
				benefit_key = "resource_stone",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_zerynthia_nesoi_myrina = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_zerynthia_nesoi_skyros = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_zonaea_apsynthia = {
			{
				benefit_key = "native_units",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
				levels = {
					[1] = {},
					[2] = { "phar_map_nat_thr_thracian_guard", },
					[3] = { "phar_map_nat_thr_thracian_guard", "phar_map_nat_thr_thracian_archers", },
					[4] = { "phar_map_nat_thr_thracian_guard", "phar_map_nat_thr_thracian_archers", "phar_map_land_thr_mares_of_diomedes", },
					[5] = { "phar_map_nat_thr_thracian_guard", "phar_map_nat_thr_thracian_archers", "phar_map_land_thr_mares_of_diomedes", "phar_map_nat_thr_thorns_of_thrace", },
					[6] = { "phar_map_nat_thr_thracian_guard", "phar_map_nat_thr_thracian_guard", "phar_map_nat_thr_thracian_archers", "phar_map_land_thr_mares_of_diomedes", "phar_map_land_thr_mares_of_diomedes", "phar_map_nat_thr_thorns_of_thrace", },
				},
			},
		},
		phar_map_zonaea_ismaros = {
			{
				benefit_key = "resource_wood",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_zonaea_sestos = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_zonaea_thasos = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_zz_tjehenu_apesh = {
			{
				benefit_key = "effects",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_zz_tjehenu_khenti_qerer = {
			{
				benefit_key = "resource_gold",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_zz_tjehenu_sepa = {
			{
				benefit_key = "resource_food",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_zz_tjehenu_wehat_siwa = {
			{
				benefit_key = "ancillaries",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
		phar_map_zz_tummanna_kinik = {
			{
				benefit_key = "resource_bronze",
				factions = {"phar_sea_sherden", "phar_sea_peleset"},
				campaigns = {"phar_main", "phar_combi"},
			},
		},
	},-- war_spoils.config.regions

	ui = {
		panel_name = "sea_war_spoils",
		settlement_occupation_options_panel_name = "settlement_captured",

		effect_bundle_tooltip_layout_path = "ui/common ui/tooltip_effects_container",
		benefit_tooltip_layout_path = "ui/campaign ui/tooltip_sea_war_spoils",
		panel_rank_progress_bar_tooltip_layout_path = "ui/campaign ui/tooltip_sea_war_spoils_rank",

		-- order from left-to-right
		non_mre_benefit_button_order = {
			"ancillaries",
			"development_points",
			"native_units",
			"vision",
			"experience",
			"effects",
		},

		-- order from left-to-right
		mre_benefit_button_order = {
			"resource_food",
			"resource_wood",
			"resource_stone",
			"resource_bronze",
			"resource_gold",
		},

		component_ids = {
			war_spoils_faction_button_container = "fm_sea_war_spoils_container",

			-- components resident in "city_info_bar" layout
			settlement_nameplate_icon = "icon_war_spoils",
			settlement_cooldown = "cooldown_turns_tx",

			-- components resident in "sea_war_spoils" layout
			illustration_holder = "illustration_holder",
			leader_portrait = "leader_portrait",
			rank_bar_holder = "rank_bar_holder",
			rank_value = "rank_value",
			num_owned_settlements = "dy_value",
			progress_bar_fill =	"bar_fill",
			threshold_holder = "threshold_list",
			template_threshold = "template_threshold",

			non_mre_holder_parent = "non_resource_holder",
			non_mre_rank_template = "non_mre_rank_template",
			non_mre_rank_template_reward = "dy_reward",

			mre_holder_parent = "resource_holder",
			mre_rank_template = "mre_rank_template",
			spoils_button_prefix = "spoils_button_",
			mre_rank_mplate_mre_amount_lvl_prefix = "dy_lvl_template_",

			spoils_info = "spoils_info",
			spoils_info_spoil_name = "dy_name",
			spoils_info_spoil_icon = "dy_icon",
			mre_rank_holder = "info_table",
			mre_rank_template_rank = "dy_rank",
			mre_rank_template_separator = "separator",

			-- components resident in "tooltip_sea_war_spoils" layout
			tooltip_effect_bundle_holder = "effect_bundle_holder",

			-- components resident in "settlement_captured" layout
			settlement_captured_template_holder = "button_parent",
			settlement_captured_war_spoil_indicator = "war_spoil_indicator",
			settlement_captured_war_spoil_indicator_icon = "icon",
		},

		component_states = {
			illustration_holder = {
				"rank_1",
				"rank_2",
				"rank_3",
				"rank_4",
				"rank_5",
			},

			leader_portraits = {
				phar_sea_sherden = "iolaos",
				phar_sea_peleset = "walwetes",
			},

			default = "default",
			active = "active",
			selected = "selected",
			icon_default = "NewState",
			icon_greyed_out = "inactive",

			tooltip_info_warning = {
				when_settlement_is_razed = "cooldown",
				when_settled_army_is_selected = "settled_army",
			},
		},

		colour_codes = {
			white = "white",
			green = "green",
		},

		icons = {
			nameplate_cooldown_icon_path = "UI/skins/default/sea_war_spoils/ws_icon_ph.png",
		},

		localization_keys = {
			tooltip_rank_requirement_iolaos = "phar_sea_war_spoils_tooltip_rank_settlement_requirement_iolaos",
			tooltip_rank_requirement_one_or_more = "phar_sea_war_spoils_tooltip_rank_settlement_requirement_one_or_more",
			tooltip_rank_requirement_one_to_another = "phar_sea_war_spoils_tooltip_rank_settlement_requirement_one_to_another",
			tooltip_rank_requirement_zero = "phar_sea_war_spoils_tooltip_rank_settlement_requirement_zero",
			tooltip_warning_text = "phar_sea_war_spoils_tooltip_warning_text",
			tooltip_warning_cooldown_text = "phar_sea_war_spoils_tooltip_warning_cooldown_text",
			tooltip_warning_max_settlements_text = "phar_sea_war_spoils_tooltip_warning_max_settlements_text",
			tooltip_warning_ruins = "phar_sea_war_spoils_tooltip_warning_ruins",

			panel_reward_ancillary_none = "phar_sea_war_spoils_panel_spoil_reward_none",
			panel_reward_ancillary_common = "phar_sea_war_spoils_panel_spoil_reward_ancillaries_common",
			panel_reward_ancillary_uncommon = "phar_sea_war_spoils_panel_spoil_reward_ancillaries_uncommon",
			panel_reward_ancillary_unique = "phar_sea_war_spoils_panel_spoil_reward_ancillaries_unique_chance",
			panel_reward_development_points = "phar_sea_war_spoils_panel_reward_development_points",
			panel_reward_experience = "phar_sea_war_spoils_panel_reward_experience",
		},
	},--war_spoils_config.ui
}