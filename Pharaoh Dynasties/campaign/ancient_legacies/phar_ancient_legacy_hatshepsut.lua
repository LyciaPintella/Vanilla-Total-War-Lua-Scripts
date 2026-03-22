out("Loading phar_ancient_legacy_hatshepsut.lua")

local function output(str)
	if str then
		out("<<>> _ANCIENT LEGACY HATSHEPSUT <<>>: " .. str)
	end
end

hatshepsut_config = {
	ui = {
		panel_name = "legacy_hatshepsut",
		resource_icons = {
			troy_food = "UI/Campaign UI/pooled_resources/icon_res_food_medium.png",
			troy_stones = "UI/Campaign UI/pooled_resources/icon_res_stone_medium.png",
			troy_gold = "UI/Campaign UI/pooled_resources/icon_res_gold_medium.png",
			troy_bronze = "UI/Campaign UI/pooled_resources/icon_res_bronze_medium.png",
			troy_wood = "UI/Campaign UI/pooled_resources/icon_res_wood_medium.png",
		},

		merchant_bazaar_component_extension = "_trade_merchant_bazaar_component",
		cart_bazaar_component_extension = "_trade_expedition_item_bazaar_component",

		confirm_deal_prompt = "campaign_localised_strings_string_phar_main_al_hatshepsut_confirm_deal_prompt",
		send_expedition_prompt = "campaign_localised_strings_string_phar_main_al_hatshepsut_send_expedition_prompt",
		send_to_capital_prompt = "campaign_localised_strings_string_phar_main_al_hatshepsut_send_to_capital_prompt",
		cancel_expedition_prompt = "campaign_localised_strings_string_phar_main_al_hatshepsut_cancel_expedition_prompt",
		finish_expedition_prompt = "campaign_localised_strings_string_phar_main_al_hatshepsut_send_to_capital_prompt",
		cash_out_prompt = "campaign_localised_strings_string_phar_main_al_hatshepsut_cash_out_prompt",
		confirm_ancillary_pick = "campaign_localised_strings_string_phar_main_al_hatshepsut_ancillary_unequip_prompt",
		turns_to_reach_selected_destionation = "campaign_localised_strings_string_phar_main_al_hatshepsut_turns_to_reach",
		turns_to_return_to_capital_from_selected_destination = "campaign_localised_strings_string_phar_main_al_hatshepsut_turns_to_return",

	},

	stop_at_every_node = false,

	bonus_diplomatic_relations = 2,-- from -6 to +6 (-6 beeing give BIG CHUNK NEGATIVE BONUS, while +6 beeing give BIG CHUNK POSITIVE BONUS)
	inactive_trade_button_giveaway_tooltip = "campaign_localised_strings_string_phar_main_al_hatshepsut_turns_to_return",
	default_item_effect_bundle_duration = 6,
	item_mre_cashout_effect_scope = "faction_to_faction_own_unseen",
	allow_ancillary_without_generals = true,
	suggested_value_expedition_start = 200,
	trade_text_negative_max = -100,
	expedition_idle_notification_tooltip_key = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_expedition_idle_notification_tooltip",
	expedition_reached_notification_tooltip_key = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_expedition_reached_notification_tooltip",
	expedition_reached_capital_notification_tooltip_key = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_expedition_reached_capital_notification_tooltip",
	trade_panel_conclude_dealings_text = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trading_button_conclude",
	trade_panel_exit_deal_text = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trading_button_exit",
	no_generals_cashout_tooltip = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_no_available_generals_tooltip",
	no_regions_cashout_tooltip = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_no_capital_tooltip",
	province_effects_horde_alert = "ui_text_replacements_localised_text_phar_sea_province_effects_horde_alert",

--[[
--example
	region_key  = {
			"item_key"
		},
]]
	starting_items_per_region = {
		--Lower Egypt
		phar_main_heliopolis_heliopolis = {
			"egyptian_rope",
		},
		phar_main_memphis_memphis = {
			"delta_wheat",
		},
		--Upper Egypt
		phar_main_elephantine_elephantine = {
			"cattle_herd",
		},
		phar_main_abydos_abydos = {
			"egyptian_rope",
		},
		--Western Desert
		phar_main_amunia_ner_neb = {
			"copper_ore",
		},
		phar_main_kurkur_oasis_kurkur_oasis = {
			"oasis_fruit",
		},
		--Nubia
		phar_main_buhen_buhen = {
			"cattle_herd",
		},
		phar_main_north_east_nubia_hetch_pa = {
			"gold_ore",
		},
		--Kush
		phar_main_kawa_kawa = {
			"kush_bows_basic",
		},
		phar_main_per_ramesses_meri_amon_per_ramesses_meri_amon = {
			"oasis_fruit",
		},
		--Sinai
		phar_main_sinai_tchu_am = {
			"stone_blocks",
		},
		phar_main_east_sinai_khet_khefti = {
			"figs",
		},
		--Fenkhu
		phar_main_megiddo_yapo = {
			"dried_fish",
		},
		phar_main_tyre_byblos = {
			"cedar_basic",
		},
		--Retjennu
		phar_main_emar_emar = {
			"canaan_wheat",
		},
		phar_main_damascus_damascus = {
			"cedar_basic",
		},
		--Yamhad
		phar_main_alashiya_alashiya = {
			"olive_oil_jars",
		},
		phar_main_ugarit_ugarit = {
			"bronze_ingots",
		},
		--Isuwa
		phar_main_malidiya_samuha = {
			"cattle_herd",
		},
		phar_main_zippalanda_nerik = {
			"stone_blocks",
		},
		--Lowlands
		phar_main_south_hatti_tarhuntassa = {
			"hunters_haul",
		},
		phar_main_tarsus_tarsus = {
			"cedar_basic",
		},
		--Highlands
		phar_main_hattussa_hattussa = {
			"hunters_haul",
		},
		phar_main_north_hatti_krateia = {
			"stone_blocks",
		},
		--Achaea
		phar_map_mycenaeca_mycenae = {
			"olive_amphoras",
		},
		phar_map_kretes_knossos = {
			"stone_blocks",
		},
		--Thrace
		phar_map_sinticobisaltia_siris = {
			"salted_game",
		},
		phar_map_thynia_salmydessos = {
			"pine_logs",
		},
		--Assuwa
		phar_map_maeonia_milethus = {
			"dried_fish",
		},
		phar_map_ilion_troy = {
			"assuwan_jewelry",
		},
		--Aber Nahra
		phar_map_balihu_irridu = {
			"stone_idols",
		},
		phar_map_ashtata_tuttul = {
			"gold_ore",
		},
		--Mat-Assur
		phar_map_aranzah_assur = {
			"assyrian_barley",
		},
		phar_map_hanigalbat_dur_katlimmu = {
			"bronze_ingots",
		},
		--Mat-tamti
		phar_map_kan_digirak_babylon = {
			"marshland_wheat",
		},
		phar_map_bit_peri_amurru_dur_kurigalzu = {
			"poplar_logs",
		},
		--Zagros
		phar_map_uruatri_musasir = {
			"salted_game",
		},
		phar_map_kadmuhu_tushhap = {
			"stone_blocks",
		},
		--Elam
		phar_map_northern_elam_pashime = {
			"marshland_wheat",
		},
		phar_map_northern_elam_susa = {
			"gold_statuettes",
		},
	},

--[[
--example
	egyptian_lower_egypt_realm = {
			delta_wheat = {
				unlock_region = "region_key"
			},
			egyptian_beer = {
				unlock_region = "region_key"
			},
			egypt_acacia_timber = {
				unlock_region = "region_key"
			},
		},
]]

	faction_starting_items = {
		egyptian_lower_egypt_realm = {
			delta_wheat = true,
			egyptian_rope = true,
		},
		egyptian_upper_egypt_realm = {
			cattle_herd = true,
			egyptian_rope = true,
		},
		egyptian_western_desert_realm = {
			oasis_fruit = true,
			copper_ore = true,
		},
		egyptian_nubia_realm = {
			cattle_herd = true,
			gold_ore = true,
		},
		egyptian_kush_realm = {
			oasis_fruit = true,
			kush_bows_basic = true,
		},
		canaanite_sinai_realm = {
			figs = true,
			stone_blocks = true,
		},
		canaanite_fenkhu_realm = {
			dried_fish = true,
			cedar_basic = true,
		},
		canaanite_retjenu_realm = {
			canaan_wheat = true,
			cedar_basic = true,
		},
		canaanite_yamhad_realm = {
			olive_oil_jars = true,
			bronze_ingots = true,
		},
		hittite_isuwa_realm = {
			cattle_herd = true,
			stone_blocks = true,
		},
		hittite_lowlands_realm = {
			hunters_haul = true,
			cedar_basic = true,
		},
		hittite_highlands_realm = {
			hunters_haul = true,
			stone_blocks = true,
		},
		aegean_achaea_realm = {
			olive_amphoras = true,
			stone_blocks = true,
		},
		aegean_assuwa_realm = {
			dried_fish = true,
			assuwan_jewelry = true,
		},
		aegean_thrace_realm = {
			salted_game = true,
			pine_logs = true,
		},
		mesopotamia_aber_nahra_realm = {
			stone_idols = true,
			gold_ore = true,
		},
		mesopotamia_mat_assur_realm = {
			assyrian_barley = true,
			bronze_ingots = true,
		},
		mesopotamia_zagros_realm = {
			salted_game = true,
			stone_blocks = true,
		},
		mesopotamia_mat_tamti_realm = {
			marshland_wheat = true,
			poplar_logs = true,
		},
		mesopotamia_haltamti_realm = {
			marshland_wheat = true,
			gold_statuettes = true,
		},
	},

	trade_items = {
		-- delta_wheat = { --item_key
		-- 	display_name = "campaign_locasition_styringd", -- key to a localised name of the item
		--  item_description = "campaign_locasition_styringd" -- key to localised desc text of the item 
		-- 	trade_value = 2, -- the items trade value
		-- 	cost = { -- the item cost in MRE
		-- 		troy_food = 20,
		-- 		troy_gold = 20,
		-- 	},
		-- 	cash_out = { -- the item's cash out confid
		-- 		resource_factor = "faction",
		-- 		resource_bundle = "phar_main_al_hatshepsut_myrrh_seedlings_bundle", -- resource bundle used to visualize in tooltip
		-- 		mre = { -- how much it cashes out for in MRE (if it does)
		-- 			food = 20,
		-- 		},
		-- 		region_bundle = "phar_main_effect_bundle_kumarbi_shrine_03", -- what bundle it gives (if any)
		-- 		ancillary = "troy_adi_anc_armour_glaucus_golden_armour", --artefact -- make all optional -- what ancillary it gives (if any)
		-- 	},
		-- 	bundle_duration = 5, -- duration of any bundles provided by this item.
		--	requirements = "building_key", -- key of a required building to unlock this
		-- },

		--Food Items--
		--Basic Starter Items--
		delta_wheat = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_wheat_from_the_delta",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_food_wheat.png",
			trade_value = 15,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_wheat_from_the_delta",
			cost = {
				{"troy_food", 500},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_food", 500, "phar_main_dummy_al_hatshepsut_food_reward"},
				},
			},
			requirements = "building_key",
		},

		cattle_herd = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_herd_of_cattle",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_food_cattle.png",
			trade_value = 15,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_herd_of_cattle",
			cost = {
				{"troy_food", 800},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_food", 800, "phar_main_dummy_al_hatshepsut_food_reward"},
				},
			},
			requirements = "building_key",
		},

		oasis_fruit = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_oasis_fruit",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_food_oasis_fruit.png",
			trade_value = 10,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_oasis_fruit",
			cost = {
				{"troy_food", 400},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_food", 400, "phar_main_dummy_al_hatshepsut_food_reward"},
				},
			},
			requirements = "building_key",
		},

		figs = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_figs",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_food_figs.png",
			trade_value = 10,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_figs",
			cost = {
				{"troy_food", 400},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_food", 400, "phar_main_dummy_al_hatshepsut_food_reward"},
				},
			},
			requirements = "building_key",
		},

		dried_fish = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_dried_fish",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_food_dried_fish.png",
			trade_value = 10,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_dried_fish",
			cost = {
				{"troy_food", 400},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_food", 400, "phar_main_dummy_al_hatshepsut_food_reward"},
				},
			},
			requirements = "building_key",
		},

		canaan_wheat = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_canaan_wheat",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_food_wheat_canaan.png",
			trade_value = 10,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_canaan_wheat",
			cost = {
				{"troy_food", 400},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_food", 400, "phar_main_dummy_al_hatshepsut_food_reward"},
				},
			},
			requirements = "building_key",
		},

		hunters_haul = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_hunters_haul",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_hatshepsut_icon_hunters_haul.png",
			trade_value = 10,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_hunters_haul",
			cost = {
				{"troy_food", 500},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_food", 500, "phar_main_dummy_al_hatshepsut_food_reward"},
				},
			},
			requirements = "building_key",
		},

		olive_oil_jars = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_olive_oil_jars",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_jar_oil.png",
			trade_value = 20,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_olive_oil_jars",
			cost = {
				{"troy_food", 1000},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_food", 1000, "phar_main_dummy_al_hatshepsut_food_reward"},
				},
				--region_bundle = "phar_main_al_hatshepsut_olive_oil_jars_bundle",
			},
			requirements = "building_key",
		},
		olive_amphoras = {
			display_name = "ui_text_replacements_localised_text_phar_map_trade_hatshepsut_olive_amphoras_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_olive_amphora.png",
			trade_value = 10,
			item_flavour = "ui_text_replacements_localised_text_phar_map_trade_hatshepsut_olive_amphoras_desc",
			cost = {
				{"troy_food", 300},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_food", 300, "phar_main_dummy_al_hatshepsut_food_reward"},
				},
			},
			requirements = "building_key",
		},
		salted_game = {
			display_name = "ui_text_replacements_localised_text_phar_map_trade_hatshepsut_salted_game_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_salted_game.png",
			trade_value = 15,
			item_flavour = "ui_text_replacements_localised_text_phar_map_trade_hatshepsut_salted_game_desc",
			cost = {
				{"troy_food", 800},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_food", 800, "phar_main_dummy_al_hatshepsut_food_reward"},
				},
			},
			requirements = "building_key",
		},
		assyrian_barley = {
			display_name = "ui_text_replacements_localised_text_phar_map_trade_hatshepsut_assyrian_barley_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_assyrian_barley.png",
			trade_value = 15,
			item_flavour = "ui_text_replacements_localised_text_phar_map_trade_hatshepsut_assyrian_barley_desc",
			cost = {
				{"troy_food", 800},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_food", 800, "phar_main_dummy_al_hatshepsut_food_reward"},
				},
			},
			requirements = "building_key",
		},
		marshland_wheat = {
			display_name = "ui_text_replacements_localised_text_phar_map_trade_hatshepsut_marshland_wheat_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_marshland_wheat.png",
			trade_value = 15,
			item_flavour = "ui_text_replacements_localised_text_phar_map_trade_hatshepsut_marshland_wheat_desc",
			cost = {
				{"troy_food", 700},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_food", 700, "phar_main_dummy_al_hatshepsut_food_reward"},
				},
			},
			requirements = "building_key",
		},

		--End of Basic Starter Items--

		egyptian_beer = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_egyptian_beer",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_egyptian_beer.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_egyptian_beer",
			cost = {
				{"troy_food", 1000},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_food", 1000, "phar_main_dummy_al_hatshepsut_food_reward"},
				},
				ancillary = "phar_main_rare_31", --artefact
			},
			requirements = "building_key",
		},

		canaan_beer = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_canaan_beer",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_food_canaan_beer.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_canaan_beer",
			cost = {
				{"troy_food", 1000},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_food", 1000, "phar_main_dummy_al_hatshepsut_food_reward"},
				},
				region_bundle = "phar_main_al_hatshepsut_canaan_beer_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},

		fisherman_bounty = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_fisherman_bounty",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_dried_fish.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_fisherman_bounty",
			cost = {
				{"troy_food", 4000},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_food", 4000, "phar_main_dummy_al_hatshepsut_food_reward"},
				},
				ancillary = "phar_main_rare_27", --artefact -- make all optional
			},
			requirements = "building_key",
		},

		wine_jars = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_wine_jars",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_food_wine_jugs.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_wine_jars",
			cost = {
				{"troy_food", 1500},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_food", 1500, "phar_main_dummy_al_hatshepsut_food_reward"},
				},
				region_bundle = "phar_main_al_hatshepsut_wine_jars_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},

		cinnamon_plants = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_cinnamon_plants",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_cinnamon_plants.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_cinnamon_plants",
			cost = {
				{"troy_food", 5000},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_food", 5000, "phar_main_dummy_al_hatshepsut_food_reward"},
				},
				region_bundle = "phar_main_al_hatshepsut_cinnamon_plants_bundle",
				ancillary = "phar_main_rare_51", --artefact -- make all optional
			},
			bundle_duration = 12,
			requirements = "building_key",
		},

		giraffes = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_giraffes",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_animal_giraffe.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_giraffes",
			cost = {
				{"troy_food", 4000},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_food", 4000, "phar_main_dummy_al_hatshepsut_food_reward"},
				},
				region_bundle = "phar_main_al_hatshepsut_giraffes_bundle",
				ancillary = "phar_main_rare_47", --follower -- make all optional
			},
			bundle_duration = 6,
			requirements = "building_key",
		},

		baboons = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_baboons",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_animal_baboon.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_baboons",
			cost = {
				{"troy_food", 4000},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_food", 4000, "phar_main_dummy_al_hatshepsut_food_reward"},
				},
				region_bundle = "phar_main_al_hatshepsut_baboons_bundle",
				ancillary = "phar_main_rare_45", --follower -- make all optional
			},
			bundle_duration = 6,
			requirements = "building_key",
		},

		lions = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_lions",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_animal_lion.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_lions",
			cost = {
				{"troy_food", 4000},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_food", 4000, "phar_main_dummy_al_hatshepsut_food_reward"},
				},
				region_bundle = "phar_main_al_hatshepsut_lions_bundle",
				ancillary = "phar_main_rare_46", --follower -- make all optional
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		leopards = {
			display_name = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_item_leopards_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_leopards.png",
			trade_value = 40,
			item_flavour = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_item_leopards_desc",
			cost = {
				{"troy_food", 3000},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_food", 3000, "phar_main_dummy_al_hatshepsut_food_reward"},
				},
				region_bundle = "phar_map_al_hatshepsut_theban_leopards_bundle",
				ancillary = "phar_map_hatshepsut_leopards", --follower -- make all optional
			},
			bundle_duration = 12,
			requirements = "building_key",
		},
		camels = {
			display_name = "ui_text_replacements_localised_text_phar_map_bundle_hatshepsut_camels_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_camels.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_map_bundle_hatshepsut_camels_desc",
			cost = {
				{"troy_food", 4000},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_food", 4000, "phar_main_dummy_al_hatshepsut_food_reward"},
				},
				region_bundle = "phar_map_al_hatshepsut_camels_bundle",
			},
			bundle_duration = 12,
			requirements = "building_key",
		},
		bags_of_sesame = {
			display_name = "ui_text_replacements_localised_text_phar_map_bundle_hatshepsut_bags_sesame_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_bags_sesame.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_map_bundle_hatshepsut_bags_sesame_desc",
			cost = {
				{"troy_food", 1000},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_food", 1000, "phar_main_dummy_al_hatshepsut_food_reward"},
				},
				region_bundle = "phar_map_al_hatshepsut_bags_sesame_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},

		--Wood Items--
		--Basic Starter Items--

		egyptian_rope = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_egyptian_ropes",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_papyrus_rope.png",
			trade_value = 10,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_egyptian_ropes",
			cost = {
				{"troy_wood", 20},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_wood", 20, "phar_main_dummy_al_hatshepsut_wood_reward"},
				},
			},
			requirements = "building_key",
		},

		cedar_basic = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_cedar_basic",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_wood_cedar.png",
			trade_value = 10,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_cedar_basic",
			cost = {
				{"troy_wood", 30},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_wood", 30, "phar_main_dummy_al_hatshepsut_wood_reward"},
				},
			},
			requirements = "building_key",
		},

		kush_bows_basic = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_kush_bows_basic",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_hatshepsut_icon_kush_bows_basic.png",
			trade_value = 10,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_kush_bows_basic",
			cost = {
				{"troy_wood", 30},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_wood", 30, "phar_main_dummy_al_hatshepsut_wood_reward"},
				},
			},
			requirements = "building_key",
		},
		pine_logs = {
			display_name = "ui_text_replacements_localised_text_phar_map_trade_hatshepsut_pine_logs_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_pine_logs.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_map_trade_hatshepsut_pine_logs_desc",
			cost = {
				{"troy_wood", 100},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_wood", 100, "phar_main_dummy_al_hatshepsut_wood_reward"},
				},
			},
			requirements = "building_key",
		},
		poplar_logs = {
			display_name = "ui_text_replacements_localised_text_phar_map_trade_hatshepsut_poplar_logs_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_poplar_logs.png",
			trade_value = 15,
			item_flavour = "ui_text_replacements_localised_text_phar_map_trade_hatshepsut_poplar_logs_desc",
			cost = {
				{"troy_wood", 50},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_wood", 50, "phar_main_dummy_al_hatshepsut_wood_reward"},
				},
			},
			requirements = "building_key",
		},

		--End of Basic Starter Items--

		egypt_acacia_timber = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_egyptian_acacia_timber",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_wood_gen.png",
			trade_value = 20,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_egyptian_acacia_timber",
			cost = {
				{"troy_wood", 60},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_wood", 60, "phar_main_dummy_al_hatshepsut_wood_reward"},
				},
			},
			requirements = "building_key",
		},

		egypt_acacia_boats = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_egyptian_acacia_boats",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_wood_boat.png",
			trade_value = 40,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_egyptian_acacia_boats",
			cost = {
				{"troy_wood", 100},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_wood", 100, "phar_main_dummy_al_hatshepsut_wood_reward"},
				},
				region_bundle = "phar_main_al_hatshepsut_egypt_acacia_boats_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},

		--[[
		prayer_scrolls = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_prayer_scrolls",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_papyrus_scroll.png",
			trade_value = 20,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_prayer_scrolls",
			cost = {
				{"troy_wood", 50},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_wood", 50, "phar_main_dummy_al_hatshepsut_wood_reward"},
				},
				region_bundle = "phar_main_al_hatshepsut_prayer_scrolls_bundle",
			},
			requirements = "building_key",
		},
		]]

		heavy_ropes = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_heavy_ropes",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_heavy_ropes.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_heavy_ropes",
			cost = {
				{"troy_wood", 100},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_wood", 100, "phar_main_dummy_al_hatshepsut_wood_reward"},
				},
				region_bundle = "phar_main_al_hatshepsut_heavy_ropes_bundle",
				ancillary = "phar_main_rare_40", --artefact
			},
			bundle_duration = 6,
			requirements = "building_key",
		},

		ebony_logs = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_logs_of_ebony",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_ebony_logs.png",
			trade_value = 40,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_logs_of_ebony",
			cost = {
				{"troy_wood", 200},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_wood", 300, "phar_main_dummy_al_hatshepsut_wood_reward"},
				},
			},
			requirements = "building_key",
		},

		kush_bows = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_kushite_bows",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_hatshepsut_icon_kush_bows.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_kushite_bows",
			cost = {
				{"troy_wood", 60},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_wood", 60, "phar_main_dummy_al_hatshepsut_wood_reward"},
				},
				region_bundle = "phar_main_al_hatshepsut_kush_bows_bundle",
				ancillary = "phar_main_rare_equipment_bows_4", --artefact
			},
			bundle_duration = 6,
			requirements = "building_key",
		},

		cedar_timber = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_cedar_timber",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_cedar_timber.png",
			trade_value = 40,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_cedar_timber",
			cost = {
				{"troy_wood", 200},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_wood", 200, "phar_main_dummy_al_hatshepsut_wood_reward"},
				},
			},
			requirements = "building_key",
		},

		cedar_seedlings = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_cedar_seedlings",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_food_seedlings.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_cedar_seedlings",
			cost = {
				{"troy_wood", 200},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_wood", 200, "phar_main_dummy_al_hatshepsut_wood_reward"},
				},
				region_bundle = "phar_main_al_hatshepsut_cedar_seedlings_bundle",
			},
			bundle_duration = 12,
			requirements = "building_key",
		},

		cedar_chairs = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_cedar_chairs",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_cedar_chairs.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_cedar_chairs",
			cost = {
				{"troy_wood", 60},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_wood", 60, "phar_main_dummy_al_hatshepsut_wood_reward"},
				},
				region_bundle = "phar_main_al_hatshepsut_cedar_chairs_bundle",
				ancillary = "phar_main_rare_20", --artefact
			},
			bundle_duration = 12,
			requirements = "building_key",
		},

		cedar_boats = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_cedar_boats",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_cedar_boats.png",
			trade_value = 40,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_cedar_boats",
			cost = {
				{"troy_wood", 100},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_wood", 100, "phar_main_dummy_al_hatshepsut_wood_reward"},
				},
				region_bundle = "phar_main_al_hatshepsut_cedar_boats_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},

		cedar_chariots = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_cedar_chariots",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_hatshepsut_icon_cedar_chariots.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_cedar_chariots",
			cost = {
				{"troy_wood", 60},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_wood", 60, "phar_main_dummy_al_hatshepsut_wood_reward"},
				},
				region_bundle = "phar_main_al_hatshepsut_cedar_chariots_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},

		--[[
		ritual_boats = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_ritual_boats",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/icon_trade_item_wood.png",
			trade_value = 20,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_ritual_boats",
			cost = {
				{"troy_wood", 50},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_wood", 50, "phar_main_dummy_al_hatshepsut_wood_reward"},
				},
				region_bundle = "phar_main_al_hatshepsut_ritual_boats_bundle",
			},
			requirements = "building_key",
		},
		]]

		double_sarcophagi = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_double_sarcophagi",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_double_sarcophagi.png",
			trade_value = 20,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_double_sarcophagi",
			cost = {
				{"troy_wood", 30},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_wood", 30, "phar_main_dummy_al_hatshepsut_wood_reward"},
				},
				ancillary = "phar_main_rare_34", --artefact
			},
			requirements = "building_key",
		},

		frankincense_seedlings = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_frankincense_seedlings",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_hatshepsut_icon_frankincense_seedlings.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_frankincense_seedlings",
			cost = {
				{"troy_wood", 300},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_wood", 300, "phar_main_dummy_al_hatshepsut_wood_reward"},
				},
				region_bundle = "phar_main_al_hatshepsut_frankincense_seedlings_bundle",
			},
			bundle_duration = 12,
			requirements = "building_key",
		},

		myrrh_seedlings = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_myrrh_seedlings",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_hatshepsut_icon_myrrh_seedlings.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_myrrh_seedlings",
			cost = {
				{"troy_wood", 300},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_wood", 300, "phar_main_dummy_al_hatshepsut_wood_reward"},
				},
				region_bundle = "phar_main_al_hatshepsut_myrrh_seedlings_bundle",
			},
			bundle_duration = 12,
			requirements = "building_key",
		},

		--Stone Items--
		--Basic Starter Items--

		stone_blocks = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_stone_blocks",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_stone_blocks.png",
			trade_value = 20,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_stone_blocks",
			cost = {
				{"troy_stones", 400},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_stones", 400, "phar_main_dummy_al_hatshepsut_stones_reward"},
				},
			},
			requirements = "building_key",
		},
		stone_idols = {
			display_name = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_item_stone_idols_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_stone_idols.png",
			trade_value = 20,
			item_flavour = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_item_stone_idols_desc",
			cost = {
				{"troy_stones", 200},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_stones", 200, "phar_main_dummy_al_hatshepsut_stones_reward"},
				},
				ancillary = "phar_map_hatshepsut_stone_idols",
			},
			requirements = "building_key",
		},

		--End of Basic Starter Items--

		stone_statue_big = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_stone_statue_big",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_stone_statue_big.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_stone_statue_big",
			cost = {
				{"troy_stones", 300},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_stones", 300, "phar_main_dummy_al_hatshepsut_stones_reward"},
				},
				region_bundle = "phar_main_al_hatshepsut_stone_statue_big_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},

		stone_statues_small = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_stone_statues_small",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_stone_statue_small.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_stone_statues_small",
			cost = {
				{"troy_stones", 200},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_stones", 200, "phar_main_dummy_al_hatshepsut_stones_reward"},
				},
				ancillary = "phar_main_rare_44", --artefact
			},
			requirements = "building_key",
		},

		lamasu_statue_big = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_lamasu_statue",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_lamasu_statue_big.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_lamasu_statue",
			cost = {
				{"troy_stones", 300},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_stones", 300, "phar_main_dummy_al_hatshepsut_stones_reward"},
				},
				region_bundle = "phar_main_al_hatshepsut_lamasu_statue_big_bundle",
			},
			bundle_duration = 12,
			requirements = "building_key",
		},

		hittite_statue_big = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_hittite_statue_big",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_hatshepsut_icon_hittite_statue_big.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_hittite_statue_big",
			cost = {
				{"troy_stones", 300},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_stones", 300, "phar_main_dummy_al_hatshepsut_stones_reward"},
				},
				region_bundle = "phar_main_al_hatshepsut_hittite_statue_big_bundle",
			},
			bundle_duration = 12,
			requirements = "building_key",
		},

		granite_blocks = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_granite_blocks",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_stone_blocks_rare.png",
			trade_value = 40,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_granite_blocks",
			cost = {
				{"troy_stones", 1200},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_stones", 1200, "phar_main_dummy_al_hatshepsut_stones_reward"},
				},
				region_bundle = "phar_main_al_hatshepsut_granite_blocks_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		marble_statues = {
			display_name = "ui_text_replacements_localised_text_phar_map_bundle_hatshepsut_marble_statues_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_marble_statues.png",
			trade_value = 25,
			item_flavour = "ui_text_replacements_localised_text_phar_map_bundle_hatshepsut_marble_statues_desc",
			cost = {
				{"troy_stones", 500},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				region_bundle = "phar_map_al_hatshepsut_marble_statues_bundle",
				mre = {
					{"troy_stones", 500, "phar_main_dummy_al_hatshepsut_stones_reward"},
				},
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		teracotta_statue = {
			display_name = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_item_teracotta_statue_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_teracotta_statue.png",
			trade_value = 20,
			item_flavour = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_item_teracotta_statue_desc",
			cost = {
				{"troy_stones", 300},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_stones", 300, "phar_main_dummy_al_hatshepsut_stones_reward"},
				},
				region_bundle = "phar_map_al_hatshepsut_teracotta_statue_bundle",
				ancillary = "phar_map_hatshepsut_teracotta_statue",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		granite_stele = {
			display_name = "ui_text_replacements_localised_text_phar_map_bundle_hatshepsut_granite_stele_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_granite_stele.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_map_bundle_hatshepsut_granite_stele_desc",
			cost = {
				{"troy_stones", 900},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_stones", 900, "phar_main_dummy_al_hatshepsut_stones_reward"},
				},
				region_bundle = "phar_map_al_hatshepsut_granite_stele_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},

		--Bronze Items--
		--Basic Starter Items--

		bronze_ingots = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_bronze_ingots",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_bronze_ingot.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_bronze_ingots",
			cost = {
				{"troy_bronze", 200},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_bronze", 200, "phar_main_dummy_al_hatshepsut_bronze_reward"},
				},
				--ancillary = "troy_adi_anc_armour_glaucus_golden_armour", --artefact -- make all optional
			},
			requirements = "building_key",
		},

		copper_ore = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_copper_ore",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_copper_ore.png",
			trade_value = 20,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_copper_ore",
			cost = {
				{"troy_bronze", 100},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_bronze", 100, "phar_main_dummy_al_hatshepsut_bronze_reward"},
				},
			},
			requirements = "building_key",
		},

		--End of Basic Starter Items--

		kush_weapons = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_kushite_bronze_weapons",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_bronze_weapon.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_kushite_bronze_weapons",
			cost = {
				{"troy_bronze", 150},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_bronze", 150, "phar_main_dummy_al_hatshepsut_bronze_reward"},
				},
				region_bundle = "phar_main_al_hatshepsut_kush_weapons_bundle",
				ancillary = "phar_main_rare_equipment_axes_1", --artefact -- make all optional
			},
			bundle_duration = 6,
			requirements = "building_key",
		},

		assyrian_bronzework = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_assyrian_bronzework",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_assyrian_bronzework.png",
			trade_value = 40,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_assyrian_bronzework",
			cost = {
				{"troy_bronze", 300},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_bronze", 300, "phar_main_dummy_al_hatshepsut_bronze_reward"},
				},
				ancillary = "phar_main_rare_26", --artefact -- make all optional
			},
			requirements = "building_key",
		},

		minoan_bronzework = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_minoan_bronzework",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_minoan_bronzework.png",
			trade_value = 40,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_minoan_bronzework",
			cost = {
				{"troy_bronze", 300},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_bronze", 300, "phar_main_dummy_al_hatshepsut_bronze_reward"},
				},
				ancillary = "phar_main_rare_equipment_spears_1", --artefact -- make all optional
			},
			requirements = "building_key",
		},

		anatolian_bronzework = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_anatolian_bronzework",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_anatolian_bronzework.png",
			trade_value = 40,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_anatolian_bronzework",
			cost = {
				{"troy_bronze", 300},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_bronze", 300, "phar_main_dummy_al_hatshepsut_bronze_reward"},
				},
				ancillary = "phar_main_rare_equipment_swords_2", --artefact -- make all optional
			},
			requirements = "building_key",
		},

		bronze_statues_small = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_bronze_statues_small",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_bronze_statuettes.png",
			trade_value = 20,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_bronze_statues_small",
			cost = {
				{"troy_bronze", 100},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_bronze", 100, "phar_main_dummy_al_hatshepsut_bronze_reward"},
				},
				region_bundle = "phar_main_al_hatshepsut_bronze_statues_small_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},

		canaan_tools_mine = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_canaan_mining_tools",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_tools_mining.png",
			trade_value = 20,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_canaan_mining_tools",
			cost = {
				{"troy_bronze", 100},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_bronze", 100, "phar_main_dummy_al_hatshepsut_bronze_reward"},
				},
				region_bundle = "phar_main_al_hatshepsut_canaan_tools_mine_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},

		anatolian_tools = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_quality_anatolian_tools",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_anatolian_tools.png",
			trade_value = 20,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_quality_anatolian_tools",
			cost = {
				{"troy_bronze", 100},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_bronze", 100, "phar_main_dummy_al_hatshepsut_bronze_reward"},
				},
				region_bundle = "phar_main_al_hatshepsut_anatolian_tools_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		sacrificial_cauldron = {
			display_name = "ui_text_replacements_localised_text_phar_map_bundle_hatshepsut_sacrificial_cauldron_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_artefact_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_sacrificial_cauldron.png",
			trade_value = 25,
			item_flavour = "ui_text_replacements_localised_text_phar_map_bundle_hatshepsut_sacrificial_cauldron_desc",
			cost = {
				{"troy_bronze", 200},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_bronze", 200, "phar_main_dummy_al_hatshepsut_bronze_reward"},
				},
				region_bundle = "phar_map_al_hatshepsut_sacrificial_cauldron_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},

		--Gold Items--
		--Basic Starter Items--

		gold_ore = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_gold_ore",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_gold_ore.png",
			trade_value = 20,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_gold_ore",
			cost = {
				{"troy_gold", 100},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_gold", 100, "phar_main_dummy_al_hatshepsut_gold_reward"},
				},
			},
			requirements = "building_key",
		},
		assuwan_jewelry = {
			display_name = "ui_text_replacements_localised_text_phar_map_bundle_hatshepsut_assuwan_jewelry_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_assuwan_jewelry.png",
			trade_value = 20,
			item_flavour = "ui_text_replacements_localised_text_phar_map_bundle_hatshepsut_assuwan_jewelry_desc",
			cost = {
				{"troy_gold", 100},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				region_bundle = "phar_map_al_hatshepsut_theban_assuwan_jewelry_bundle",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_gold", 100, "phar_main_dummy_al_hatshepsut_gold_reward"},
				},
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		gold_statuettes = {
			display_name = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_item_gold_statuettes_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_gold_statuettes.png",
			trade_value = 20,
			item_flavour = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_item_gold_statuettes_desc",
			cost = {
				{"troy_gold", 150},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_gold", 150, "phar_main_dummy_al_hatshepsut_gold_reward"},
				},
				ancillary = "phar_map_hatshepsut_gold_statuettes",
			},
			requirements = "building_key",
		},

		--End of Basic Starter Items--

		golden_scarabs = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_golden_scarabs",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_golden_scarabs.png",
			trade_value = 40,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_golden_scarabs",
			cost = {
				{"troy_gold", 300},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_gold", 300, "phar_main_dummy_al_hatshepsut_gold_reward"},
				},
				ancillary = "phar_main_rare_24", --artefact -- make all optional
			},
			requirements = "building_key",
		},

		nubian_jewelry = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_nubian_jewelry",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_nubian_jewelry.png",
			trade_value = 40,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_nubian_jewelry",
			cost = {
				{"troy_gold", 200},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_gold", 200, "phar_main_dummy_al_hatshepsut_gold_reward"},
				},
				region_bundle = "phar_main_al_hatshepsut_nubian_jewelry_bundle",
				ancillary = "phar_main_rare_30", --artefact -- make all optional
			},
			bundle_duration = 6,
			requirements = "building_key",
		},

		kerma_jewelry = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_kerma_jewelry",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_kerma_jewelry.png",
			trade_value = 40,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_kerma_jewelry",
			cost = {
				{"troy_gold", 200},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_gold", 200, "phar_main_dummy_al_hatshepsut_gold_reward"},
				},
				region_bundle = "phar_main_al_hatshepsut_kerma_jewelry_bundle",
				ancillary = "phar_main_rare_43", --artefact -- make all optional
			},
			bundle_duration = 6,
			requirements = "building_key",
		},

		turq_jewelry = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_turq_jewelry",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_turq_jewelry.png",
			trade_value = 40,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_turq_jewelry",
			cost = {
				{"troy_gold", 200},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_gold", 200, "phar_main_dummy_al_hatshepsut_gold_reward"},
				},
				region_bundle = "phar_main_al_hatshepsut_turq_jewelry_bundle",
				ancillary = "phar_main_rare_38", --artefact -- make all optional
			},
			bundle_duration = 6,
			requirements = "building_key",
		},

		elamite_jewelry = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_elamite_jewelry",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_faience_bejeweled.png",
			trade_value = 40,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_elamite_jewelry",
			cost = {
				{"troy_gold", 200},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_gold", 200, "phar_main_dummy_al_hatshepsut_gold_reward"},
				},
				region_bundle = "phar_main_al_hatshepsut_elamite_jewelry_bundle",
				--ancillary = "troy_adi_anc_armour_glaucus_golden_armour", --artefact -- make all optional
			},
			bundle_duration = 6,
			requirements = "building_key",
		},

		malachite_jewelry = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_malachite_jewelry",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_malachite_jewelry.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_malachite_jewelry",
			cost = {
				{"troy_gold", 500},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_gold", 500, "phar_main_dummy_al_hatshepsut_gold_reward"},
				},
				ancillary = "phar_main_rare_49", --artefact -- make all optional
			},
			requirements = "building_key",
		},

		palace_incense = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_palace_incense",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_incense_pot.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_palace_incense",
			cost = {
				{"troy_gold", 100},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_gold", 100, "phar_main_dummy_al_hatshepsut_gold_reward"},
				},
				region_bundle = "phar_main_al_hatshepsut_palace_incense_bundle",
				ancillary = "phar_main_common_general_14",
			},
			bundle_duration = 12,
			requirements = "building_key",
		},

		--[[
		ritual_incense = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_ritual_incense",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/icon_trade_item_gold.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_ritual_incense",
			cost = {
				{"troy_gold", 100},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_gold", 100, "phar_main_dummy_al_hatshepsut_gold_reward"},
				},
				region_bundle = "phar_main_al_hatshepsut_ritual_incense_bundle",
			},
			requirements = "building_key",
		},
		]]

		ceremonial_sword = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_ceremonial_sword",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_artefact_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_ceremonial_sword.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_ceremonial_sword",
			cost = {
				{"troy_gold", 400},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_gold", 400, "phar_main_dummy_al_hatshepsut_gold_reward"},
				},
				ancillary = "phar_main_unique_26", --artefact -- make all optional
			},
			requirements = "building_key",
		},
		fine_chlamys = {
			display_name = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_item_fine_chlamys_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_artefact_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_fine_chlamys.png",
			trade_value = 15,
			item_flavour = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_item_fine_chlamys_desc",
			cost = {
				{"troy_gold", 50},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_gold", 50, "phar_main_dummy_al_hatshepsut_gold_reward"},
				},
				ancillary = "phar_map_hatshepsut_fine_chlamys", --artefact -- make all optional
			},
			requirements = "building_key",
		},
		thracian_bracelets = {
			display_name = "ui_text_replacements_localised_text_phar_map_bundle_hatshepsut_thracian_bracelets_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_thracian_bracelets.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_map_bundle_hatshepsut_thracian_bracelets_desc",
			cost = {
				{"troy_gold", 250},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_gold", 250, "phar_main_dummy_al_hatshepsut_gold_reward"},
				},
				region_bundle = "phar_map_al_hatshepsut_thracian_bracelets_bundle",
			},
			bundle_duration = 12,
			requirements = "building_key",
		},
		alabaster_figurines = {
			display_name = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_item_alabaster_figurines_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_alabaster_figurines.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_item_alabaster_figurines_desc",
			cost = {
				{"troy_gold", 150},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_gold", 150, "phar_main_dummy_al_hatshepsut_gold_reward"},
				},
				region_bundle = "phar_map_al_hatshepsut_alabaster_figurines_bundle",
				ancillary = "phar_map_hatshepsut_alabaster_figurines", --artefact -- make all optional
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		cylinder_seal = {
			display_name = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_item_cylinder_seal_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_artefact_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_cylinder_seal.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_item_cylinder_seal_desc",
			cost = {
				{"troy_gold", 150},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_gold", 150, "phar_main_dummy_al_hatshepsut_gold_reward"},
				},
				region_bundle = "phar_map_al_hatshepsut_cylinder_seal_bundle",
				ancillary = "phar_map_hatshepsut_cylinder_seal", --artefact -- make all optional
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		silver_chalice = {
			display_name = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_item_silver_chalice_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_artefact_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_silver_chalice.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_item_silver_chalice_desc",
			cost = {
				{"troy_gold", 300},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_gold", 300, "phar_main_dummy_al_hatshepsut_gold_reward"},
				},
				ancillary = "phar_map_hatshepsut_silver_chalice", --artefact -- make all optional
			},
			requirements = "building_key",
		},
		elamite_pottery = {
			display_name = "ui_text_replacements_localised_text_phar_map_bundle_hatshepsut_elamite_pottery_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_elamite_pottery.png",
			trade_value = 15,
			item_flavour = "ui_text_replacements_localised_text_phar_map_bundle_hatshepsut_elamite_pottery_desc",
			cost = {
				{"troy_gold", 40},
			},
			cash_out = {
				resource_factor = "troy_resource_factor_faction",
				resource_bundle = "phar_main_al_hatshepsut_mre_reward_dummy",
				mre = {
					{"troy_gold", 40, "phar_main_dummy_al_hatshepsut_gold_reward"},
				},
				region_bundle = "phar_map_al_hatshepsut_elamite_pottery_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},


		--No Resource Items--
		
		--[[amulet_cobra = {
			display_name = "campaign_localised_strings_string_phar_main_al_hatshepsut_trade_item_name_amulet_cobra",
			ui_icon = "UI/skins/default/legacy_hatchepsut/troy_anc_mirror.png",
			trade_value = 11,
			cost = {
			},
			cash_out = {
				ancillary = "troy_adi_anc_armour_glaucus_golden_armour", --artefact -- make all optional
			},
			requirements = "building_key",
		},]]
		
		assyrian_mercenary = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_assyrian_mercenary",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_assyrian_mercenary.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_assyrian_mercenary",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_assyrian_mercenary_bundle",
				ancillary = "phar_main_rare_5", --follower -- make all optional
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		
		assyrian_veils = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_assyrian_veils",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/icon_ancillary_hittite_consort.png",
			trade_value = 20,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_assyrian_veils",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_assyrian_veils_bundle",
				--ancillary = "troy_adi_anc_armour_glaucus_golden_armour", --artefact -- make all optional
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		
		bitumen_jugs = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_bitumen_jugs",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_jar_oil.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_bitumen_jugs",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_bitumen_jugs_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		
		canaan_builders = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_canaan_builders",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_canaan_builders.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_canaan_builders",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_canaan_builders_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		
		canaan_craftsmen = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_canaan_craftsmen",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_canaan_craftsmen.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_canaan_craftsmen",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_canaan_craftsmen_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		
		canaan_craftsmen_unique_ship = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_canaan_craftsmen_unique_ship",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/icon_ancillary_itthobaal_the_shipwright.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_canaan_craftsmen_unique_ship",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_canaan_craftsmen_unique_ship_bundle",
				ancillary = "phar_main_unique_16", --follower -- make all optional
			},
			bundle_duration = 12,
			requirements = "building_key",
		},
		
		canaan_craftsmen_unique_wood = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_canaan_craftsmen_unique_wood",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/icon_ancillary_tanni_the_woodworker.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_canaan_craftsmen_unique_wood",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_canaan_craftsmen_unique_wood_bundle",
				ancillary = "phar_main_unique_14", --follower -- make all optional
			},
			bundle_duration = 12,
			requirements = "building_key",
		},
		
		canaan_farmers = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_canaan_farmers",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_canaan_farmers.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_canaan_farmers",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_canaan_farmers_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		
		canaan_fishermen = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_canaan_fishermen",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_canaan_fishermen.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_canaan_fishermen",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_canaan_fishermen_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		
		canaan_fishermen_unique = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_canaan_fishermen_unique",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/icon_ancillary_danel_the_angler.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_canaan_fishermen_unique",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_canaan_fishermen_unique_bundle",
				ancillary = "phar_main_unique_15", --follower -- make all optional
			},
			bundle_duration = 12,
			requirements = "building_key",
		},
		
		canaan_miners = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_canaan_miners",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_canaan_miners.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_canaan_miners",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_canaan_miners_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},

		cedarwood_oil = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_cedarwood_oil",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_hatshepsut_icon_item_cedarwood_oil.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_cedarwood_oil",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_cedarwood_oil_bundle",
				ancillary = "phar_main_rare_21", --artefact -- make all optional
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		
		cyprian_fishermen = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_cyprian_fishermen",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_canaan_fishermen.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_cyprian_fishermen",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_cyprian_fishermen_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		
		cyprian_fishermen_unique = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_cyprian_fishermen_unique",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_canaan_fishermen.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_cyprian_fishermen_unique",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_cyprian_fishermen_unique_bundle",
				ancillary = "phar_main_unique_19", --follower -- make all optional
			},
			bundle_duration = 12,
			requirements = "building_key",
		},
		
		cyprian_miners = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_cyprian_miners",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_cyprian_miners.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_cyprian_miners",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_cyprian_miners_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		
		dagger_celestial_iron = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_dagger_celestial_iron",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_artefact_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_dagger_celestial_iron.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_dagger_celestial_iron",
			cost = {
			},
			cash_out = {
				ancillary = "phar_main_rare_36", --artefact -- make all optional
			},
			requirements = "building_key",
		},
		
		dancing_dwarf = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_dancing_dwarf",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_dwarf.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_dancing_dwarf",
			cost = {
			},
			cash_out = {
				ancillary = "phar_main_rare_48", --follower -- make all optional
			},
			requirements = "building_key",
		},
		
		egyptian_builders = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_egyptian_builders",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_canaan_builders.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_egyptian_builders",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_egyptian_builders_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		
		egyptian_builders_unique = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_egyptian_builders_unique",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/icon_ancillary_hothu_the_foreman.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_egyptian_builders_unique",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_egyptian_builders_unique_bundle",
				ancillary = "phar_main_unique_25", --follower -- make all optional
			},
			bundle_duration = 12,
			requirements = "building_key",
		},
		
		egyptian_craftsmen = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_egyptian_craftsmen",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_egyptian_craftsmen_unique_sculptor.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_egyptian_craftsmen",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_egyptian_craftsmen_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		
		egyptian_craftsmen_unique_rope = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_egyptian_craftsmen_unique_rope",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/icon_ancillary_djedeni_the_ropemaker.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_egyptian_craftsmen_unique_rope",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_egyptian_craftsmen_unique_rope_bundle",
				ancillary = "phar_main_unique_23", --follower -- make all optional
			},
			bundle_duration = 12,
			requirements = "building_key",
		},
		
		egyptian_craftsmen_unique_sculptor = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_egyptian_craftsmen_unique_sculptor",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_egyptian_craftsmen_unique_sculptor.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_egyptian_craftsmen_unique_sculptor",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_egyptian_craftsmen_unique_sculptor_bundle",
				ancillary = "phar_main_unique_20", --follower -- make all optional
			},
			bundle_duration = 12,
			requirements = "building_key",
		},
		
		egyptian_farmers = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_egyptian_farmers",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_egyptian_farmers.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_egyptian_farmers",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_egyptian_farmers_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		
		egyptian_farmers_unique = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_egyptian_farmers_unique",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/icon_ancillary_nefankhui_the_farmer.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_egyptian_farmers_unique",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_egyptian_farmers_unique_bundle",
				ancillary = "phar_main_unique_24", --follower -- make all optional
			},
			bundle_duration = 12,
			requirements = "building_key",
		},
		
		egyptian_healer = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_egyptian_healer",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_egyptian_healer.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_egyptian_healer",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_egyptian_healer_bundle",
				ancillary = "phar_main_rare_2", --follower -- make all optional
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		
		egyptian_miners = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_egyptian_miners",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_egyptian_miners.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_egyptian_miners",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_egyptian_miners_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		
		egyptian_miners_unique = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_egyptian_miners_unique",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/icon_ancillary_pamuna_the_digger.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_egyptian_miners_unique",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_egyptian_miners_unique_bundle",
				ancillary = "phar_main_unique_17", --follower -- make all optional
			},
			bundle_duration = 12,
			requirements = "building_key",
		},
		
		egyptian_scribes = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_egyptian_scribes",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/icon_ancillary_wise_nobleman.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_egyptian_scribes",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_egyptian_scribes_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		
		epic_gilgamesh = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_epic_gilgamesh",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_artefact_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/icon_ancillary_epic_of_gilgamesh.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_epic_gilgamesh",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_epic_gilgamesh_bundle",
				ancillary = "phar_main_unique_27", --artefact -- make all optional
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		
		healer_babylonian = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_healer_babylonian",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/icon_ancillary_healer.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_healer_babylonian",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_healer_babylonian_bundle",
				ancillary = "phar_main_rare_6", --follower -- make all optional
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		
		hittite_blacksmiths = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_hittite_blacksmiths",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_hittite_blacksmiths.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_hittite_blacksmiths",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_hittite_blacksmiths_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		
		hittite_blacksmiths_unique = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_hittite_blacksmiths_unique",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/icon_ancillary_armanani_the_artisan.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_hittite_blacksmiths_unique",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_hittite_blacksmiths_unique_bundle",
				ancillary = "phar_main_unique_13", --follower -- make all optional
			},
			bundle_duration = 12,
			requirements = "building_key",
		},
		
		hittite_woodworkers = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_hittite_woodworkers",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_hittite_woodworkers.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_hittite_woodworkers",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_hittite_woodworkers_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		
		ivory_tusks = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_ivory_tusks",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_ivory.png",
			trade_value = 40,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_ivory_tusks",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_ivory_tusks_bundle",
				ancillary = "phar_main_rare_41", --artefact -- make all optional
			},
			bundle_duration = 12,
			requirements = "building_key",
		},
		
		kush_guards = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_kushite_guards",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/icon_ancillary_kushite_guards.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_kushite_guards",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_kush_guards_bundle",
				ancillary = "phar_main_rare_4", --follower -- make all optional
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		
		kush_guide = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_kushite_guide",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/icon_ancillary_scout.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_kushite_guide",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_kush_guide_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		
		kush_guide_unique = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_kush_guide_unique",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/icon_ancillary_nebaendjau_the_traveller.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_kush_guide_unique",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_kush_guide_unique_bundle",
				ancillary = "phar_main_unique_21", --follower -- make all optional
			},
			bundle_duration = 12,
			requirements = "building_key",
		},
		
		kush_miners = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_kushite_miners",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_nubian_miners.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_kushite_miners",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_kush_miners_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		
		libu_tracker = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_libu_tracker",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/icon_ancillary_libu_tracker.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_libu_tracker",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_libu_tracker_bundle",
				ancillary = "phar_main_rare_1", --follower -- make all optional
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		
		miner_hammer = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_miner_hammer",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_artefact_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_tools_mining.png",
			trade_value = 20,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_miner_hammer",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_miner_hammer_bundle",
				ancillary = "phar_main_rare_32", --artefact -- make all optional
			},
			bundle_duration = 12,
			requirements = "building_key",
		},
		
		minoan_pottery = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_minoan_pottery",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/icon_ancillary_minoan_pottery.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_minoan_pottery",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_minoan_pottery_bundle",
				ancillary = "phar_main_rare_37", --artefact -- make all optional
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		
		mitanni_horse_trainer = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_mitanni_horse_trainer",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/icon_ancillary_mitanni_horse_trainer.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_mitanni_horse_trainer",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_mitanni_horse_trainer_bundle",
				ancillary = "phar_main_rare_3", --follower -- make all optional
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		
		nubian_craftsmen = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_nubian_craftsmen",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_nubian_craftsmen.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_nubian_craftsmen",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_nubian_craftsmen_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		
		nubian_craftsmen_unique = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_nubian_craftsmen_unique",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/icon_ancillary_karepe_the_ivoryworker.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_nubian_craftsmen_unique",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_nubian_craftsmen_unique_bundle",
				ancillary = "phar_main_unique_18", --follower -- make all optional
			},
			bundle_duration = 12,
			requirements = "building_key",
		},
		
		nubian_miners = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_nubian_miners",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_nubian_miners.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_nubian_miners",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_nubian_miners_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		
		nubian_miners_unique = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_nubian_miners_unique",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/icon_ancillary_pamuna_the_digger.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_nubian_miners_unique",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_nubian_miners_unique_bundle",
				ancillary = "phar_main_unique_22", --follower -- make all optional
			},
			bundle_duration = 12,
			requirements = "building_key",
		},
		
		nubian_perfume = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_nubian_perfume",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/icon_ancillary_nubian_perfume.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_nubian_perfume",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_nubian_perfume_bundle",
				ancillary = "phar_main_rare_39", --artefact -- make all optional
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		
		obsidian_tools = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_obsidian_tools",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_obsidian_tools.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_obsidian_tools",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_obsidian_tools_bundle",
				ancillary = "phar_main_rare_50", --artefact -- make all optional
			},
			bundle_duration = 12,
			requirements = "building_key",
		},
		
		ritual_ankhs = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_ritual_ankhs",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_gold_ankh.png",
			trade_value = 20,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_ritual_ankhs",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_ritual_ankhs_bundle",
				ancillary = "phar_main_rare_28", --artefact -- make all optional
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		
		senet_game = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_senet_game",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_board_game.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_senet_game",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_senet_game_bundle",
				ancillary = "phar_main_rare_42", --artefact -- make all optional
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		
		tablet_construction = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_tablet_construction",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_artefact_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/icon_ancillary_babylonian_tablet_of_construction.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_tablet_construction",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_tablet_construction_bundle",
				ancillary = "phar_main_rare_29", --artefact -- make all optional
			},
			bundle_duration = 12,
			requirements = "building_key",
		},
		
		tablet_farming = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_tablet_farming",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_artefact_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/icon_ancillary_babylonian_tablet_of_farming.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_tablet_farming",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_tablet_farming_bundle",
				ancillary = "phar_main_rare_23", --artefact -- make all optional
			},
			bundle_duration = 12,
			requirements = "building_key",
		},
		
		tablet_healing = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_tablet_healing",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_artefact_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/icon_ancillary_babylonian_tablet_of_healing.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_tablet_healing",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_tablet_healing_bundle",
				ancillary = "phar_main_rare_22", --artefact -- make all optional
			},
			bundle_duration = 12,
			requirements = "building_key",
		},
		
		tablet_mining = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_tablet_mining",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_artefact_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/icon_ancillary_babylonian_tablet_of_mining.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_tablet_mining",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_tablet_mining_bundle",
				ancillary = "phar_main_rare_33", --artefact -- make all optional
			},
			bundle_duration = 12,
			requirements = "building_key",
		},
		
		tablet_survival = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_tablet_survival",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_artefact_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/icon_ancillary_babylonian_tablet_of_survival.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_tablet_survival",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_tablet_survival_bundle",
				ancillary = "phar_main_rare_25", --artefact -- make all optional
			},
			bundle_duration = 12,
			requirements = "building_key",
		},
		
		wheat_scythes = {
			display_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_name_wheat_scythes",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_tools_farming.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_trade_item_desc_wheat_scythes",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_main_al_hatshepsut_wheat_scythes_bundle",
				ancillary = "phar_main_rare_35", 
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		aegean_fishermen = {
			display_name = "ui_text_replacements_localised_text_phar_map_bundle_hatshepsut_aegean_fishermen_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_aegean_fishermen.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_map_bundle_hatshepsut_aegean_fishermen_desc",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_map_al_hatshepsut_aegean_fishermen_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		theban_veteran = {
			display_name = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_follower_theban_veteran_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_theban_veteran.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_follower_theban_veteran_desc",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_map_al_hatshepsut_theban_veteran_bundle",
				ancillary = "phar_map_hatshepsut_theban_veteran", 
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		theban_veteran_unique = {
			display_name = "ui_text_replacements_localised_text_phar_map_ancillaries_unique_follower_alcmaeon_the_sellsword_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_theban_veteran_unique.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_map_ancillaries_unique_follower_alcmaeon_the_sellsword_desc",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_map_al_hatshepsut_theban_veteran_unique_bundle",
				ancillary = "phar_map_hatshepsut_theban_veteran_unique", 
			},
			bundle_duration = 12,
			requirements = "building_key",
		},
		ornate_lyre = {
			display_name = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_item_ornate_lyre_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_artefact_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_ornate_lyre.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_item_ornate_lyre_desc",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_map_al_hatshepsut_theban_ornate_lyre_bundle",
				ancillary = "phar_map_hatshepsut_ornate_lyre", 
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		embroidered_kithon = {
			display_name = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_item_embroidered_kithon_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_artefact_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_embroidered_kithon.png",
			trade_value = 20,
			item_flavour = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_item_embroidered_kithon_desc",
			cost = {
			},
			cash_out = {
				ancillary = "phar_map_hatshepsut_embroidered_kithon", 
			},
			requirements = "building_key",
		},
		aegean_fishermen_unique = {
			display_name = "ui_text_replacements_localised_text_phar_map_ancillaries_unique_follower_phainos_the_fisherman_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_aegean_fishermen_unique.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_map_ancillaries_unique_follower_phainos_the_fisherman_desc",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_map_al_hatshepsut_theban_aegean_fishermen_unique_bundle",
				ancillary = "phar_map_hatshepsut_aegean_fishermen_unique", 
			},
			bundle_duration = 12,
			requirements = "building_key",
		},
		thracian_syrinx = {
			display_name = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_item_thracian_syrinx_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_artefact_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_thracian_syrinx.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_item_thracian_syrinx_desc",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_map_al_hatshepsut_thracian_syrinx_bundle",
				ancillary = "phar_map_hatshepsut_thracian_syrinx", 
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		thracian_horn = {
			display_name = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_item_thracian_horn_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_artefact_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_thracian_horn.png",
			trade_value = 40,
			item_flavour = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_item_thracian_horn_desc",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_map_al_hatshepsut_thracian_horn_bundle",
				ancillary = "phar_map_hatshepsut_thracian_horn", 
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		thracian_forresters = {
			display_name = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_follower_thracian_forresters_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_thracian_forresters.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_follower_thracian_forresters_desc",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_map_al_hatshepsut_thracian_forresters_bundle",
				ancillary = "phar_map_hatshepsut_thracian_forresters", 
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		thracian_forresters_unique = {
			display_name = "ui_text_replacements_localised_text_phar_map_ancillaries_unique_follower_amadocus_the_wheelwright_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_thracian_forresters_unique.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_map_ancillaries_unique_follower_amadocus_the_wheelwright_desc",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_map_al_hatshepsut_thracian_forresters_unique_bundle",
				ancillary = "phar_map_hatshepsut_thracian_forresters_unique", 
			},
			bundle_duration = 12,
			requirements = "building_key",
		},
		bear_furs = {
			display_name = "ui_text_replacements_localised_text_phar_map_bundle_hatshepsut_bear_furs_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_trade_item_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_bear_furs.png",
			trade_value = 15,
			item_flavour = "ui_text_replacements_localised_text_phar_map_bundle_hatshepsut_bear_furs_desc",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_map_al_hatshepsut_bear_furs_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		ahlamu_scout = {
			display_name = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_follower_ahlamu_scout_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_ahlamu_scout.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_follower_ahlamu_scout_desc",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_map_al_hatshepsut_ahlamu_scout_bundle",
				ancillary = "phar_map_hatshepsut_ahlamu_scout", 
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		ahlamu_scout_unique = {
			display_name = "ui_text_replacements_localised_text_phar_map_ancillaries_unique_follower_tabrimmon_the_wayfarer_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_ahlamu_scout_unique.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_map_ancillaries_unique_follower_tabrimmon_the_wayfarer_desc",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_map_al_hatshepsut_ahlamu_scout_unique_bundle",
				ancillary = "phar_map_hatshepsut_ahlamu_scout_unique", 
			},
			bundle_duration = 12,
			requirements = "building_key",
		},
		assyrian_mercenary_unique = {
			display_name = "ui_text_replacements_localised_text_phar_map_ancillaries_unique_follower_nutesh_the_warrior_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_assyrian_mercenary_unique.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_map_ancillaries_unique_follower_nutesh_the_warrior_desc",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_map_al_hatshepsut_assyrian_mercenary_unique_bundle",
				ancillary = "phar_map_hatshepsut_assyrian_mercenary_unique", 
			},
			bundle_duration = 12,
			requirements = "building_key",
		},
		assyrian_mason = {
			display_name = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_follower_assyrian_mason_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_assyrian_mason.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_follower_assyrian_mason_desc",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_map_al_hatshepsut_assyrian_mason_bundle",
				ancillary = "phar_map_hatshepsut_assyrian_mason", 
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		assyrian_builders = {
			display_name = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_follower_assyrian_builders_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_assyrian_builders.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_map_ancillaries_rare_follower_assyrian_builders_desc",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_map_al_hatshepsut_assyrian_builders_bundle",
				ancillary = "phar_map_hatshepsut_assyrian_builders", 
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		assyrian_builders_unique = {
			display_name = "ui_text_replacements_localised_text_phar_map_ancillaries_unique_follower_zuuthusu_the_brickmaker_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_assyrian_builders_unique.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_map_ancillaries_unique_follower_zuuthusu_the_brickmaker_desc",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_map_al_hatshepsut_assyrian_builders_unique_bundle",
				ancillary = "phar_map_hatshepsut_assyrian_builders_unique", 
			},
			bundle_duration = 12,
			requirements = "building_key",
		},
		babylon_merchant_unique = {
			display_name = "ui_text_replacements_localised_text_phar_map_ancillaries_unique_follower_ea_nasir_the_merchant_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_al_hatshepsut_icon_item_tools_farming.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_map_ancillaries_unique_follower_ea_nasir_the_merchant_desc",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_map_al_hatshepsut_babylon_merchant_unique_bundle",
				ancillary = "phar_map_hatshepsut_babylon_merchant_unique", 
			},
			bundle_duration = 12,
			requirements = "building_key",
		},
		urartu_craftsmen = {
			display_name = "ui_text_replacements_localised_text_phar_map_bundle_hatshepsut_urartu_craftsmen_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_urartu_craftsmen.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_map_bundle_hatshepsut_urartu_craftsmen_desc",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_map_al_hatshepsut_urartu_craftsmen_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		urartu_craftsmen_unique = {
			display_name = "ui_text_replacements_localised_text_phar_map_ancillaries_unique_follower_aramu_the_bonecarver_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_urartu_craftsmen_unique.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_map_ancillaries_unique_follower_aramu_the_bonecarver_desc",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_map_al_hatshepsut_urartu_craftsmen_unique_bundle",
				ancillary = "phar_map_hatshepsut_urartu_craftsmen_unique", 
			},
			bundle_duration = 12,
			requirements = "building_key",
		},
		elamite_goldsmith = {
			display_name = "ui_text_replacements_localised_text_phar_map_bundle_hatshepsut_elamite_goldsmith_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_elamite_goldsmith.png",
			trade_value = 30,
			item_flavour = "ui_text_replacements_localised_text_phar_map_bundle_hatshepsut_elamite_goldsmith_desc",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_map_al_hatshepsut_elamite_goldsmith_bundle",
			},
			bundle_duration = 6,
			requirements = "building_key",
		},
		elamite_goldsmith_unique = {
			display_name = "ui_text_replacements_localised_text_phar_map_ancillaries_unique_follower_hishur_the_metalworker_title",
			item_description = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_gen_employ_desc",
			ui_icon = "UI/skins/default/legacy_hatchepsut/phar_map_icon_ancillary_elamite_goldsmith_unique.png",
			trade_value = 50,
			item_flavour = "ui_text_replacements_localised_text_phar_map_ancillaries_unique_follower_hishur_the_metalworker_desc",
			cost = {
			},
			cash_out = {
				region_bundle = "phar_map_al_hatshepsut_elamite_goldsmith_unique_bundle",
				ancillary = "phar_map_hatshepsut_elamite_goldsmith_unique", 
			},
			bundle_duration = 12,
			requirements = "building_key",
		},

	},

	trade_destinations = {

		--[[
		egyptian_western_desert_realm = { --realm name
			unlock = "", -- unlock conditions(currently unused)
			localised_name = "random_localisation_strings_string_realm_western_desert", -- key to db record with the localised name
			num_items_to_show = 3, --how many items it will show in the ui from the bundles
			ai_effect_bundle = "", -- effect bundle the ai receives from this realm
			item_bundles = { -- this is an array of tables, each holding a bundle of wants/offers
				{ --Western Desert 1 - rich on stone, poor on bronze
					offering = {
						items = {
							{ "copper_ore" , 3 }, -- first item is the item, second one is amount
							{ "stone_blocks" , 5 },
							{ "stone_statues_small" , 2 },
							{ "granite_blocks" , 1 },
						},
						trade_value_change = {
							copper_ore = -5,
							stone_blocks = -5,
							stone_statues_small = -5,
							granite_blocks = -5,
						},
					},
					buying = {
						items = {
							{ "egyptian_beer" },
							{ "heavy_ropes" },
							{ "bronze_statues_small" },
						},
						trade_value_change = {
							egyptian_beer = 5,
							canaan_beer = 5,
							heavy_ropes = 5,
							bronze_statues_small = 5,
							copper_ore = -5,
							stone_blocks = -5,
							stone_statues_small = -5,
							bronze_ingots = -5,
							granite_blocks = -5,
						},
					},
				},
			},
		}
		]]

		egyptian_lower_egypt_realm = {
			bazaar_strings = {
				good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_1_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_2_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_1_lower_egypt_desc",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_2_lower_egypt_desc",
				},
				not_good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_1_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_2_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_1_lower_egypt_desc",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_2_lower_egypt_desc",
 				},
				bad_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_1_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_2_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_1_lower_egypt_desc",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_2_lower_egypt_desc",
				},
			},
			unlock = "",
			localised_name = "random_localisation_strings_string_egyptian_lower_egypt_realm",
			num_items_to_show = 5,
			item_bundles = {
				{ --Lower Egypt 1 - rich wheat harvest and ropes, no wood
					offering = {
						items = {
							{ "delta_wheat", 6 },
							{ "dried_fish", 5 },
							{ "egyptian_beer", 3 },
							{ "egypt_acacia_timber", 2 },
							{ "heavy_ropes", 1 },
							{ "egypt_acacia_boats", 0 },												
							{ "egyptian_builders", 2 },
							{ "egyptian_builders_unique", 1 },
							{ "egyptian_farmers", 0 },
							{ "egyptian_farmers_unique", 0 },
							{ "senet_game", 3 },
							{ "wheat_scythes", 0 },
						},
						trade_value_change = {
							delta_wheat = -5,
							dried_fish = -5,
							egyptian_beer = -10,
							egypt_acacia_timber = -5,
							heavy_ropes = -10,
							egypt_acacia_boats = -10,							
							egyptian_builders = -10,
							egyptian_builders_unique = 0,
							egyptian_farmers = -10,
							egyptian_farmers_unique = 0,
							senet_game = -10,
							wheat_scythes = -10,
						},
					},
					buying = {
						items = {
							{ "bronze_ingots" },
							{ "cedar_basic" },
							{ "cedar_timber" },
							{ "assyrian_bronzework" },
							{ "anatolian_bronzework" },
						},
						trade_value_change = {
							bronze_ingots = 5,
							cedar_basic = 5,							
							cedar_timber = 5,
							assyrian_bronzework = 5,
							anatolian_bronzework = 5,
							delta_wheat = -5,
							dried_fish = -5,
							egyptian_beer = -10,
							egypt_acacia_timber = -5,
							heavy_ropes = -10,
							egypt_acacia_boats = -10,							
							egyptian_builders = -10,
							egyptian_builders_unique = 0,
							egyptian_farmers = -10,
							egyptian_farmers_unique = 0,
							senet_game = -10,
							wheat_scythes = -10,
						},
					},
				},
				{ --Lower Egypt 2 - mix of wheat and wood, no ropes
					offering = {
						items = {
							{ "delta_wheat", 3 },
							{ "dried_fish", 1 },
							{ "egyptian_beer", 2 },
							{ "egypt_acacia_timber", 8 },
							{ "heavy_ropes", 1 },
							{ "egypt_acacia_boats", 3 },							
							{ "egyptian_builders", 0 },
							{ "egyptian_builders_unique", 0 },
							{ "egyptian_farmers", 2 },
							{ "egyptian_farmers_unique", 1 },
							{ "senet_game", 1 },
							{ "wheat_scythes", 2 },
						},
						trade_value_change = {
							delta_wheat = -5,
							dried_fish = -5,
							egyptian_beer = -10,
							egypt_acacia_boats = -10,
							egypt_acacia_timber = -5,
							heavy_ropes = -10,
							egyptian_builders = -10,
							egyptian_builders_unique = 0,
							egyptian_farmers = -10,
							egyptian_farmers_unique = 0,
							senet_game = -10,
							wheat_scythes = -10,
						},
					},
					buying = {
						items = {
							{ "bronze_ingots" },
							{ "cedar_basic" },
							{ "cedar_timber" },
							{ "assyrian_bronzework" },
							{ "anatolian_bronzework" },
						},
						trade_value_change = {
							bronze_ingots = 5,
							cedar_basic = 5,							
							cedar_timber = 5,
							assyrian_bronzework = 5,
							anatolian_bronzework = 5,
							delta_wheat = -5,
							dried_fish = -5,
							egyptian_beer = -10,
							egypt_acacia_timber = -5,
							heavy_ropes = -10,
							egypt_acacia_boats = -10,							
							egyptian_builders = -10,
							egyptian_builders_unique = 0,
							egyptian_farmers = -10,
							egyptian_farmers_unique = 0,
							senet_game = -10,
							wheat_scythes = -10,
						},
					},
				},
				{ --Lower Egypt 3 - no harvest, wood and ropes
					offering = {
						items = {
							{ "delta_wheat", 10 },
							{ "dried_fish", 3 },
							{ "egyptian_beer", 5 },
							{ "egypt_acacia_timber", 1 },
							{ "heavy_ropes", 2 },
							{ "egypt_acacia_boats", 2 },
							{ "egyptian_builders", 0 },
							{ "egyptian_builders_unique", 0 },
							{ "egyptian_farmers", 2 },
							{ "egyptian_farmers_unique", 0 },
							{ "senet_game", 3 },
							{ "wheat_scythes", 3 },
						},
						trade_value_change = {
							delta_wheat = -5,
							dried_fish = -5,
							egyptian_beer = -10,
							egypt_acacia_timber = -5,
							heavy_ropes = -10,
							egypt_acacia_boats = -10,							
							egyptian_builders = -10,
							egyptian_builders_unique = 0,
							egyptian_farmers = -10,
							egyptian_farmers_unique = 0,
							senet_game = -10,
							wheat_scythes = -10,
						},
					},
					buying = {
						items = {
							{ "bronze_ingots" },
							{ "cedar_basic" },
							{ "cedar_timber" },
							{ "assyrian_bronzework" },
							{ "anatolian_bronzework" },
						},
						trade_value_change = {
							bronze_ingots = 5,
							cedar_basic = 5,							
							cedar_timber = 5,
							assyrian_bronzework = 5,
							anatolian_bronzework = 5,
							delta_wheat = -5,
							dried_fish = -5,
							egyptian_beer = -10,
							egypt_acacia_timber = -5,
							heavy_ropes = -10,
							egypt_acacia_boats = -10,							
							egyptian_builders = -10,
							egyptian_builders_unique = 0,
							egyptian_farmers = -10,
							egyptian_farmers_unique = 0,
							senet_game = -10,
							wheat_scythes = -10,
						},
					},
				},
			},
		},

		egyptian_upper_egypt_realm = {
			bazaar_strings = {
				good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_2_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_1_upper_egypt",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_2_upper_egypt",
				},
				not_good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_2_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_1_upper_egypt",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_2_upper_egypt",
 				},
				bad_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_2_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_1_upper_egypt",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_2_upper_egypt",
				},
			},
			unlock = "",
			localised_name = "random_localisation_strings_string_egyptian_upper_egypt_realm",
			num_items_to_show = 5,
			item_bundles = {
				{ --Upper Egypt 1 - scrolls and incense, lots of gold, no cows
					offering = {
						items = {
							{ "cattle_herd", 6 },
							{ "egyptian_rope", 4 },
							{ "heavy_ropes", 2 },
							{ "egypt_acacia_timber", 6 },
							{ "golden_scarabs", 4 },
							{ "egypt_acacia_boats", 0 },
							{ "egyptian_builders", 1 }, 
							{ "egyptian_craftsmen", 1 }, 
							{ "egyptian_healer", 0 }, 
							{ "egyptian_scribes", 0 },
							{ "stone_statue_big", 1 },						
							{ "egyptian_craftsmen_unique_rope", 1 }, 
							{ "egyptian_craftsmen_unique_sculptor", 0 }, 
						},
						trade_value_change = {
							cattle_herd = -5,
							egyptian_rope = -5,
							heavy_ropes = -10,
							egypt_acacia_timber = -10,
							golden_scarabs = -10,
							egypt_acacia_boats = -10,
							egyptian_builders = -10,
							egyptian_craftsmen = -10,
							egyptian_healer = -10,
							egyptian_scribes = -10,	
							stone_statue_big = -10,					
							egyptian_craftsmen_unique_rope = 0,
							egyptian_craftsmen_unique_sculptor = 0,
						},
					},
					buying = {
						items = {
							{ "stone_blocks" },
							{ "granite_blocks" },
							{ "cedar_timber" },
							{ "elamite_jewelry" },
							{ "turq_jewelry" },
						},
						trade_value_change = {
							stone_blocks = 5,
							granite_blocks = 5,
							cedar_timber = 5,
							elamite_jewelry = 5,
							turq_jewelry = 5,
							cattle_herd = -5,
							egyptian_rope = -5,
							heavy_ropes = -10,
							egypt_acacia_timber = -10,
							golden_scarabs = -10,
							egypt_acacia_boats = -10,
							egyptian_builders = -10,
							egyptian_craftsmen = -10,
							egyptian_healer = -10,
							egyptian_scribes = -10,	
							stone_statue_big = -10,					
							egyptian_craftsmen_unique_rope = 0,
							egyptian_craftsmen_unique_sculptor = 0,
						},
					},
				},
				{ --Upper Egypt 2 - no gold, cows, scrolls and boats
					offering = {
						items = {
							{ "cattle_herd", 8 },
							{ "egyptian_rope", 5 },
							{ "heavy_ropes", 1 },
							{ "egypt_acacia_timber", 4 },
							{ "golden_scarabs", 6 },
							{ "egypt_acacia_boats", 2 },
							{ "egyptian_builders", 0 }, 
							{ "egyptian_craftsmen", 2 }, 
							{ "egyptian_healer", 0 }, 
							{ "egyptian_scribes", 2 },
							{ "stone_statue_big", 1 }, 							
							{ "egyptian_craftsmen_unique_rope", 0 }, 
							{ "egyptian_craftsmen_unique_sculptor", 1 }, 
						},
						trade_value_change = {
							cattle_herd = -5,
							egyptian_rope = -5,
							heavy_ropes = -10,
							egypt_acacia_timber = -10,
							golden_scarabs = -10,
							egypt_acacia_boats = -10,
							egyptian_builders = -10,
							egyptian_craftsmen = -10,
							egyptian_healer = -10,
							egyptian_scribes = -10,		
							stone_statue_big = -10,					
							egyptian_craftsmen_unique_rope = 0,
							egyptian_craftsmen_unique_sculptor = 0,
						},
					},
					buying = {
						items = {
							{ "stone_blocks" },
							{ "granite_blocks" },
							{ "cedar_timber" },
							{ "elamite_jewelry" },
							{ "turq_jewelry" },
						},
						trade_value_change = {
							stone_blocks = 5,
							granite_blocks = 5,
							cedar_timber = 5,
							elamite_jewelry = 5,
							turq_jewelry = 5,
							cattle_herd = -5,
							egyptian_rope = -5,
							heavy_ropes = -10,
							egypt_acacia_timber = -10,
							golden_scarabs = -10,
							egypt_acacia_boats = -10,
							egyptian_builders = -10,
							egyptian_craftsmen = -10,
							egyptian_healer = -10,
							egyptian_scribes = -10,	
							stone_statue_big = -10,					
							egyptian_craftsmen_unique_rope = 0,
							egyptian_craftsmen_unique_sculptor = 0,
						},
					},
				},
				{ --Upper Egypt 3 - gold, cows, incense, no scrolls, no boats
					offering = {
						items = {
							{ "cattle_herd", 7 },
							{ "egyptian_rope", 3 },
							{ "heavy_ropes", 4 },
							{ "egypt_acacia_timber", 4 },
							{ "golden_scarabs", 9 },
							{ "egypt_acacia_boats", 3 },
							{ "egyptian_builders", 2 }, 
							{ "egyptian_craftsmen", 0 }, 
							{ "egyptian_healer", 2 }, 
							{ "egyptian_scribes", 1 }, 
							{ "stone_statue_big", 1 },						
							{ "egyptian_craftsmen_unique_rope", 0 }, 
							{ "egyptian_craftsmen_unique_sculptor", 0 }, 
						},
						trade_value_change = {
							cattle_herd = -5,
							egyptian_rope = -5,
							heavy_ropes = -10,
							egypt_acacia_timber = -10,
							golden_scarabs = -10,
							egypt_acacia_boats = -10,
							egyptian_builders = -10,
							egyptian_craftsmen = -10,
							egyptian_healer = -10,
							egyptian_scribes = -10,
							stone_statue_big = -10,
							egyptian_craftsmen_unique_rope = 0,
							egyptian_craftsmen_unique_sculptor = 0,
						},
					},
					buying = {
						items = {
							{ "stone_blocks" },
							{ "granite_blocks" },
							{ "cedar_timber" },
							{ "elamite_jewelry" },
							{ "turq_jewelry" },
						},
						trade_value_change = {
							stone_blocks = 5,
							granite_blocks = 5,
							cedar_timber = 5,
							elamite_jewelry = 5,
							turq_jewelry = 5,
							cattle_herd = -5,
							egyptian_rope = -5,
							heavy_ropes = -10,
							egypt_acacia_timber = -10,
							golden_scarabs = -10,
							egypt_acacia_boats = -10,
							egyptian_builders = -10,
							egyptian_craftsmen = -10,
							egyptian_healer = -10,
							egyptian_scribes = -10,	
							stone_statue_big = -10,					
							egyptian_craftsmen_unique_rope = 0,
							egyptian_craftsmen_unique_sculptor = 0,
						},
					},
				},
			},
		},

		egyptian_western_desert_realm = {
			bazaar_strings = {
				good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_4_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_1_western_desert",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_2_western_desert",
				},
				not_good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_4_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_1_western_desert",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_2_western_desert",
 				},
				bad_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_4_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_1_western_desert",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_2_western_desert",
				},
			},
			unlock = "",
			localised_name = "random_localisation_strings_string_egyptian_western_desert_realm",
			num_items_to_show = 5,
			ai_effect_bundle = "",
			item_bundles = {
				{ --Western Desert 1 - rich on stone, poor on bronze
					offering = {
						items = {
							{ "stone_blocks" , 6 },
							{ "bronze_ingots" , 2 },
							{ "copper_ore" , 6 },
							{ "stone_statues_small" , 3 },
							{ "granite_blocks" , 2 },
							{ "miner_hammer" , 0 },	
							{ "egyptian_miners" , 1 },
							{ "oasis_fruit" , 7 },
							{ "libu_tracker" , 1 },							
							{ "dagger_celestial_iron" , 1 },
							{ "egyptian_miners_unique" , 0 },
						},
						trade_value_change = {
							stone_blocks = -5,
							bronze_ingots = -5,
							copper_ore = -5,
							stone_statues_small = -10,
							granite_blocks = -10,
							dagger_celestial_iron = 0,
							egyptian_miners = -10,
							oasis_fruit = -5,
							egyptian_miners_unique = 0,
							libu_tracker = -10,
							miner_hammer = -10,
						},
					},
					buying = {
						items = {
							{ "delta_wheat" },
							{ "cattle_herd" },
							{ "egyptian_beer" },
							{ "canaan_beer" },
							{ "wine_jars" },
						},
						trade_value_change = {
							delta_wheat = 5,
							cattle_herd = 5,
							egyptian_beer = 5,
							canaan_beer = 5,
							wine_jars = 5,
							stone_blocks = -5,
							bronze_ingots = -5,
							copper_ore = -5,
							stone_statues_small = -10,
							granite_blocks = -10,
							dagger_celestial_iron = 0,
							egyptian_miners = -10,
							oasis_fruit = -5,
							egyptian_miners_unique = 0,
							libu_tracker = -10,
							miner_hammer = -10,
						},
					},
				},
				{ --Western Desert 2 - poor on stone, rich on bronze
					offering = {
						items = {
							{ "stone_blocks" , 3 },
							{ "bronze_ingots" , 6 },
							{ "copper_ore" , 10 },							
							{ "stone_statues_small" , 2 },		
							{ "granite_blocks" , 1 },					
							{ "miner_hammer" , 2 },	
							{ "egyptian_miners" , 2 },
							{ "oasis_fruit" , 4 },
							{ "libu_tracker" , 1 },							
							{ "dagger_celestial_iron" , 0 },
							{ "egyptian_miners_unique" , 1 },
						},
						trade_value_change = {
							stone_blocks = -5,
							bronze_ingots = -5,
							copper_ore = -5,
							stone_statues_small = -10,
							granite_blocks = -10,
							dagger_celestial_iron = 0,
							egyptian_miners = -10,
							oasis_fruit = -5,
							egyptian_miners_unique = 0,
							libu_tracker = -10,
							miner_hammer = -10,
						},
					},
					buying = {
						items = {
							{ "delta_wheat" },
							{ "cattle_herd" },
							{ "egyptian_beer" },
							{ "canaan_beer" },
							{ "wine_jars" },
						},
						trade_value_change = {
							delta_wheat = 5,
							cattle_herd = 5,
							egyptian_beer = 5,
							canaan_beer = 5,
							wine_jars = 5,
							stone_blocks = -5,
							bronze_ingots = -5,
							copper_ore = -5,
							stone_statues_small = -10,
							granite_blocks = -10,
							dagger_celestial_iron = 0,
							egyptian_miners = -10,
							oasis_fruit = -5,
							egyptian_miners_unique = 0,
							libu_tracker = -10,
							miner_hammer = -10,
						},
					},
				},
				{ --Western Desert 3 - double granite, poor on basic items
					offering = {
						items = {
							{ "stone_blocks" , 8 },
							{ "bronze_ingots" , 5 },
							{ "copper_ore" , 8 },							
							{ "stone_statues_small" , 4 },
							{ "granite_blocks" , 7 },
							{ "miner_hammer" , 1 },	
							{ "egyptian_miners" , 1 },
							{ "oasis_fruit" , 0 },
							{ "libu_tracker" , 1 },							
							{ "dagger_celestial_iron" , 1 },
							{ "egyptian_miners_unique" , 0 },
						},
						trade_value_change = {
							stone_blocks = -5,
							bronze_ingots = -5,
							copper_ore = -5,
							stone_statues_small = -10,
							granite_blocks = -10,
							dagger_celestial_iron = 0,
							egyptian_miners = -10,
							oasis_fruit = -5,
							egyptian_miners_unique = 0,
							libu_tracker = -10,
							miner_hammer = -10,
						},
					},
					buying = {
						items = {
							{ "delta_wheat" },
							{ "cattle_herd" },
							{ "egyptian_beer" },
							{ "canaan_beer" },
							{ "wine_jars" },
						},
						trade_value_change = {
							delta_wheat = 5,
							cattle_herd = 5,
							egyptian_beer = 5,
							canaan_beer = 5,
							wine_jars = 5,
							stone_blocks = -5,
							bronze_ingots = -5,
							copper_ore = -5,
							stone_statues_small = -10,
							granite_blocks = -10,
							dagger_celestial_iron = 0,
							egyptian_miners = -10,
							oasis_fruit = -5,
							egyptian_miners_unique = 0,
							libu_tracker = -10,
							miner_hammer = -10,
						},
					},
				},
			},
		},

		egyptian_nubia_realm = {
			bazaar_strings = {
				good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_1_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_4_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_1_nubia",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_2_nubia",
				},
				not_good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_1_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_4_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_1_nubia",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_2_nubia",
 				},
				bad_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_1_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_4_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_1_nubia",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_2_nubia",
				},
			},
			unlock = "",
			localised_name = "random_localisation_strings_string_egyptian_nubia_realm",
			num_items_to_show = 5,
			item_bundles = {
				{ --Nubia 1 - lots of gold, ebony, no incense
					offering = {
						items = {
							{ "gold_ore", 5 },
							{ "cattle_herd", 4 },
							{ "ebony_logs", 1 },
							{ "golden_scarabs", 2 },
							{ "kerma_jewelry", 2 },
							{ "palace_incense", 0 },
							{ "nubian_craftsmen", 2 }, 
							{ "nubian_miners", 0 }, 
							{ "nubian_jewelry", 3 }, 
							{ "nubian_perfume", 1 }, 							
							{ "ivory_tusks", 2 }, 
							{ "nubian_craftsmen_unique", 1 }, 
							{ "nubian_miners_unique", 0 }, 
						},
						trade_value_change = {
							gold_ore = -5,
							cattle_herd = -5,
							ebony_logs = -10,
							golden_scarabs = -10,
							kerma_jewelry = -10,
							palace_incense = -10,
							nubian_craftsmen = -10,
							nubian_miners = -10,
							nubian_jewelry = -10,
							nubian_perfume = -10,							
							ivory_tusks = -10,
							nubian_craftsmen_unique = 0,
							nubian_miners_unique = 0,
						},
					},
					buying = {
						items = {
							{ "egyptian_beer" },
							{ "canaan_beer" },
							{ "stone_statues_small" },
							{ "bronze_statues_small" },
							{ "egypt_acacia_boats" },
						},
						trade_value_change = {
							egyptian_beer = 5,
							canaan_beer = 5,
							stone_statues_small = 5,
							bronze_statues_small = 5,
							egypt_acacia_boats = 5,
							gold_ore = -5,
							cattle_herd = -5,
							ebony_logs = -10,
							golden_scarabs = -10,
							kerma_jewelry = -10,
							palace_incense = -10,
							nubian_craftsmen = -10,
							nubian_miners = -10,
							nubian_jewelry = -10,
							nubian_perfume = -10,							
							ivory_tusks = -10,
							nubian_craftsmen_unique = -50,
							nubian_miners_unique = -50,
						},
					},
				},
				{ --Nubia 2 - less gold, bronze, incense, no ebony
					offering = {
						items = {
							{ "gold_ore", 2 },
							{ "cattle_herd", 4 },
							{ "ebony_logs", 5 },
							{ "golden_scarabs", 1 },
							{ "kerma_jewelry", 4 },
							{ "palace_incense", 3 },
							{ "nubian_craftsmen", 0 }, 
							{ "nubian_miners", 2 },
							{ "nubian_jewelry", 1 }, 
							{ "nubian_perfume", 2 },
							{ "ivory_tusks", 0 }, 
							{ "nubian_craftsmen_unique", 0 }, 
							{ "nubian_miners_unique", 1 }, 
						},
						trade_value_change = {
							gold_ore = -5,
							cattle_herd = -5,
							ebony_logs = -10,
							golden_scarabs = -10,
							kerma_jewelry = -10,
							palace_incense = -10,
							nubian_craftsmen = -10,
							nubian_miners = -10,
							nubian_jewelry = -10,
							nubian_perfume = -10,
							ivory_tusks = -10,
							nubian_craftsmen_unique = 0,
							nubian_miners_unique = 0,
						},
					},
					buying = {
						items = {
							{ "egyptian_beer" },
							{ "canaan_beer" },
							{ "stone_statues_small" },
							{ "bronze_statues_small" },
							{ "egypt_acacia_boats" },
						},
						trade_value_change = {
							egyptian_beer = 5,
							canaan_beer = 5,
							stone_statues_small = 5,
							bronze_statues_small = 5,
							egypt_acacia_boats = 5,
							gold_ore = -5,
							cattle_herd = -5,
							ebony_logs = -10,
							golden_scarabs = -10,
							kerma_jewelry = -10,
							palace_incense = -10,
							nubian_craftsmen = -10,
							nubian_miners = -10,
							nubian_jewelry = -10,
							nubian_perfume = -10,							
							ivory_tusks = -10,
							nubian_craftsmen_unique = -50,
							nubian_miners_unique = -50,
						},
					},
				},
				{ --Nubia 3 - no gold, bronze, incense and ebony
					offering = {
						items = {
							{ "gold_ore", 4 },
							{ "cattle_herd", 6 },
							{ "ebony_logs", 3 },
							{ "golden_scarabs", 5 },
							{ "kerma_jewelry", 2 },
							{ "palace_incense", 2 },
							{ "nubian_craftsmen", 3 }, 
							{ "nubian_miners", 0 }, 
							{ "nubian_jewelry", 0 }, 
							{ "nubian_perfume", 1 }, 							
							{ "ivory_tusks", 3 }, 
							{ "nubian_craftsmen_unique", 0 }, 
							{ "nubian_miners_unique", 0 }, 
						},
						trade_value_change = {
							gold_ore = -5,
							cattle_herd = -5,
							ebony_logs = -10,
							golden_scarabs = -10,
							kerma_jewelry = -10,
							palace_incense = -10,
							nubian_craftsmen = -10,
							nubian_miners = -10,
							kerma_jewelry = -10,
							nubian_perfume = -10,
							ivory_tusks = -10,
							nubian_craftsmen_unique = 0,
							nubian_miners_unique = 0,
						},
					},
					buying = {
						items = {
							{ "egyptian_beer" },
							{ "canaan_beer" },
							{ "stone_statues_small" },
							{ "bronze_statues_small" },
							{ "egypt_acacia_boats" },
						},
						trade_value_change = {
							egyptian_beer = 5,
							canaan_beer = 5,
							stone_statues_small = 5,
							bronze_statues_small = 5,
							egypt_acacia_boats = 5,
							gold_ore = -5,
							cattle_herd = -5,
							ebony_logs = -10,
							golden_scarabs = -10,
							kerma_jewelry = -10,
							palace_incense = -10,
							nubian_craftsmen = -10,
							nubian_miners = -10,
							nubian_jewelry = -10,
							nubian_perfume = -10,							
							ivory_tusks = -10,
							nubian_craftsmen_unique = -50,
							nubian_miners_unique = -50,
						},
					},
				},
			},
		},

		egyptian_kush_realm = {
			bazaar_strings = {
				good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_2_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_4_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_1_kush_desc",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_2_kush_desc",
				},
				not_good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_2_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_4_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_1_kush_desc",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_2_kush_desc",
 				},
				bad_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_2_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_4_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_1_kush_desc",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_2_kush_desc",
				},
			},
			unlock = "",
			localised_name = "random_localisation_strings_string_egyptian_kush_realm",
			num_items_to_show = 5,
			item_bundles = {
				{ --Kush 1 - jewelry, ebony, some bronze, no weapons
					offering = {
						items = {							
							{ "dried_fish", 3 },
							{ "oasis_fruit", 4 },
							{ "copper_ore", 5 },
							{ "ebony_logs", 4 },
							{ "kush_weapons", 1 },
							{ "kush_bows", 2 },
							{ "kush_bows_basic", 4 },
							{ "kush_guards", 0 }, 
							{ "kush_guide", 1 }, 
							{ "kush_miners", 1 }, 
							{ "kerma_jewelry", 2 },
							{ "ivory_tusks", 2 }, 
							{ "kush_guide_unique", 0 }, 
						},
						trade_value_change = {							
							dried_fish = -5,
							oasis_fruit = -5,
							copper_ore = -5,
							ebony_logs = -10,
							kush_weapons = -10,
							kush_bows = -10,
							kush_bows_basic = -5,
							kush_guards = -10,
							kush_guide = -10,
							kush_miners = -10,
							kerma_jewelry = -10,
							ivory_tusks = -10,
							kush_guide_unique = 0,
						},
					},
					buying = {
						items = {
							{ "delta_wheat" },
							{ "canaan_wheat" },
							{ "bronze_ingots" },
							{ "egypt_acacia_boats" },
							{ "cedar_boats" },
						},
						trade_value_change = {
							delta_wheat = 5,
							oasis_fruit = -5,
							canaan_wheat = 5,
							bronze_ingots = 5,
							egypt_acacia_boats = 5,
							cedar_boats = 5,
							dried_fish = -5,
							copper_ore = -5,
							ebony_logs = -10,
							kush_weapons = -10,
							kush_bows = -10,
							kush_bows_basic = -5,
							kush_guards = -10,
							kush_guide = -10,
							kush_miners = -10,
							kerma_jewelry = -10,
							ivory_tusks = -10,
							kush_guide_unique = -50,
						},
					},
				},
				{ --Kush 2 - no jewelry, ebony, weapons
					offering = {
						items = {							
							{ "dried_fish", 8 },
							{ "oasis_fruit", 2 },
							{ "copper_ore", 1 },
							{ "ebony_logs", 2 },
							{ "kush_weapons", 5 },
							{ "kush_bows", 3 },
							{ "kush_bows_basic", 3 },
							{ "kush_guards", 2 }, 
							{ "kush_guide", 0 }, 
							{ "kush_miners", 2 }, 
							{ "kerma_jewelry", 4 },
							{ "ivory_tusks", 0 }, 
							{ "kush_guide_unique", 1 }, 
						},
						trade_value_change = {
							dried_fish = -5,
							oasis_fruit = -5,
							copper_ore = -5,
							ebony_logs = -10,
							kush_weapons = -10,
							kush_bows = -10,
							kush_bows_basic = -5,
							kush_guards = -10,
							kush_guide = -10,
							kush_miners = -10,
							kerma_jewelry = -10,
							ivory_tusks = -10,
							kush_guide_unique = 0,
						},
					},
					buying = {
						items = {
							{ "delta_wheat" },
							{ "canaan_wheat" },
							{ "bronze_ingots" },
							{ "egypt_acacia_boats" },
							{ "cedar_boats" },
						},
						trade_value_change = {
							delta_wheat = 5,
							oasis_fruit = -5,
							canaan_wheat = 5,
							bronze_ingots = 5,
							egypt_acacia_boats = 5,
							cedar_boats = 5,
							dried_fish = -5,
							copper_ore = -5,
							ebony_logs = -10,
							kush_weapons = -10,
							kush_bows = -10,
							kush_bows_basic = -5,
							kush_guards = -10,
							kush_guide = -10,
							kush_miners = -10,
							kerma_jewelry = -10,
							ivory_tusks = -10,
							kush_guide_unique = -50,
						},
					},
				},
				{ --Kush 3 - a lot of jewelry, no ebony, fewer weapons
					offering = {
						items = {							
							{ "dried_fish", 2 },
							{ "oasis_fruit", 4 },
							{ "copper_ore", 4 },
							{ "ebony_logs", 5 },
							{ "kush_weapons", 4 },
							{ "kush_bows", 4 },
							{ "kush_bows_basic", 2 },
							{ "kush_guards", 2 }, 
							{ "kush_guide", 0 }, 
							{ "kush_miners", 0 }, 
							{ "kerma_jewelry", 6 },
							{ "ivory_tusks", 4 }, 
							{ "kush_guide_unique", 0 }, 
						},
						trade_value_change = {
							dried_fish = -5,
							oasis_fruit = -5,
							copper_ore = -5,
							ebony_logs = -10,
							kush_weapons = -10,
							kush_bows = -10,
							kush_bows_basic = -5,
							kush_guards = -10,
							kush_guide = -10,
							kush_miners = -10,
							kerma_jewelry = -10,
							ivory_tusks = -10,
							kush_guide_unique = 0,
						},
					},
					buying = {
						items = {
							{ "delta_wheat" },
							{ "canaan_wheat" },
							{ "bronze_ingots" },
							{ "egypt_acacia_boats" },
							{ "cedar_boats" },
						},
						trade_value_change = {
							delta_wheat = 5,
							oasis_fruit = -5,
							canaan_wheat = 5,
							bronze_ingots = 5,
							egypt_acacia_boats = 5,
							cedar_boats = 5,
							dried_fish = -5,
							copper_ore = -5,
							ebony_logs = -10,
							kush_weapons = -10,
							kush_bows = -10,
							kush_bows_basic = -5,
							kush_guards = -10,
							kush_guide = -10,
							kush_miners = -10,
							kerma_jewelry = -10,
							ivory_tusks = -10,
							kush_guide_unique = -50,
						},
					},
				},
			},
		},

		canaanite_sinai_realm = {
			bazaar_strings = {
				good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_1_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_1_sinai",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_2_sinai",
				},
				not_good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_1_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_1_sinai",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_2_sinai",
 				},
				bad_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_1_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_1_sinai",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_2_sinai",
				},
			},
			unlock = "",
			localised_name = "random_localisation_strings_string_canaanite_sinai_realm",
			num_items_to_show = 5,
			item_bundles = {
				{ --Sinai 1 - stone and beer, less bronze, no tools, no jewelry
					offering = {
						items = {
							{ "stone_blocks", 8 },
							{ "bronze_ingots", 2 },
							{ "figs", 6 },
							{ "canaan_beer", 4 },
							{ "granite_blocks", 2 }, 
							{ "copper_ore", 4 },
							{ "canaan_tools_mine", 0 },
							{ "senet_game", 2 },
							{ "canaan_builders", 1 },  
							{ "canaan_miners", 0 }, 							
							{ "turq_jewelry", 0 },
						},
						trade_value_change = {
							stone_blocks = -5,
							bronze_ingots = -5,
							figs = -5,
							canaan_beer = -10,
							copper_ore = -5,
							canaan_tools_mine = -10,
							senet_game = -10,
							canaan_builders = -10,
							canaan_miners = -10,
							granite_blocks = -10,
							turq_jewelry = -10,
						},
					},
					buying = {
						items = {
							{ "cattle_herd" },
							{ "heavy_ropes" },							
							{ "wine_jars" },
							{ "stone_statues_small" },
							{ "bronze_statues_small" },
						},
						trade_value_change = {
							cattle_herd = 5,
							heavy_ropes = 5,
							wine_jars = 5,
							stone_statues_small = 5,
							bronze_statues_small = 5,
							stone_blocks = -5,
							bronze_ingots = -5,
							figs = -5,
							canaan_beer = -10,
							copper_ore = -5,
							canaan_tools_mine = -10,
							senet_game = -10,
							canaan_builders = -10,
							canaan_miners = -10,
							granite_blocks = -10,
							turq_jewelry = -10,
						},
					},
				},
				{ --Sinai 2 - no beer, stone and bronze, tools
					offering = {
						items = {
							{ "stone_blocks", 5 },
							{ "bronze_ingots", 4 },
							{ "figs", 2 },
							{ "canaan_beer", 1 },
							{ "granite_blocks", 4 }, 
							{ "copper_ore", 3 },
							{ "canaan_tools_mine", 2 },
							{ "senet_game", 1 },
							{ "canaan_builders", 1 },  
							{ "canaan_miners", 1 }, 							
							{ "turq_jewelry", 4 },
						},
						trade_value_change = {
							stone_blocks = -5,
							bronze_ingots = -5,
							figs = -5,
							canaan_beer = -10,
							copper_ore = -5,
							canaan_tools_mine = -10,
							senet_game = -10,
							canaan_builders = -10,
							canaan_miners = -10,
							granite_blocks = -10,
							turq_jewelry = -10,
						},
					},
					buying = {
						items = {
							{ "cattle_herd" },
							{ "heavy_ropes" },							
							{ "wine_jars" },
							{ "stone_statues_small" },
							{ "bronze_statues_small" },
						},
						trade_value_change = {
							cattle_herd = 5,
							heavy_ropes = 5,
							wine_jars = 5,
							stone_statues_small = 5,
							bronze_statues_small = 5,
							stone_blocks = -5,
							bronze_ingots = -5,
							figs = -5,
							canaan_beer = -10,
							copper_ore = -5,
							canaan_tools_mine = -10,
							senet_game = -10,
							canaan_builders = -10,
							canaan_miners = -10,
							granite_blocks = -10,
							turq_jewelry = -10,
						},
					},
				},
				{ --Sinai 3 - beer, jewelry, poor on stone, no bronze
					offering = {
						items = {
							{ "stone_blocks", 3 },
							{ "bronze_ingots", 2 },
							{ "figs", 6 },
							{ "canaan_beer", 4 },
							{ "granite_blocks", 3 }, 
							{ "copper_ore", 3 },
							{ "canaan_tools_mine", 2 },
							{ "senet_game", 3 },
							{ "canaan_builders", 1 },  
							{ "canaan_miners", 2 }, 							
							{ "turq_jewelry", 6 },
						},
						trade_value_change = {
							stone_blocks = -5,
							bronze_ingots = -5,
							figs = -5,
							canaan_beer = -10,
							copper_ore = -5,
							canaan_tools_mine = -10,
							senet_game = -10,
							canaan_builders = -10,
							canaan_miners = -10,
							granite_blocks = -10,
							turq_jewelry = -10,
						},
					},
					buying = {
						items = {
							{ "cattle_herd" },
							{ "heavy_ropes" },							
							{ "wine_jars" },
							{ "stone_statues_small" },
							{ "bronze_statues_small" },
						},
						trade_value_change = {
							cattle_herd = 5,
							heavy_ropes = 5,
							wine_jars = 5,
							stone_statues_small = 5,
							bronze_statues_small = 5,
							stone_blocks = -5,
							bronze_ingots = -5,
							figs = -5,
							canaan_beer = -10,
							copper_ore = -5,
							canaan_tools_mine = -10,
							senet_game = -10,
							canaan_builders = -10,
							canaan_miners = -10,
							granite_blocks = -10,
							turq_jewelry = -10,
						},
					},
				},
			},
		},

		canaanite_fenkhu_realm = {
			bazaar_strings = {
				good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_1_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_2_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_1_fenkhu_desc",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_2_fenkhu_desc",
				},
				not_good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_1_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_2_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_1_fenkhu_desc",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_2_fenkhu_desc",
 				},
				bad_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_1_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_2_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_1_fenkhu_desc",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_2_fenkhu_desc",
				},
			},
			unlock = "",
			localised_name = "random_localisation_strings_string_canaanite_fenkhu_realm",
			num_items_to_show = 5,
			item_bundles = {
				{ --Fenkhu 1 - lots of cedar, less food, no jewelry
					offering = {
						items = {
							{ "olive_oil_jars", 4 },
							{ "cedar_timber", 6 },
							{ "canaan_beer", 2 },
							{ "cedar_seedlings", 2 },
							{ "turq_jewelry", 2 },
							{ "dried_fish", 2 },							
							{ "cedar_basic", 8 },							
							{ "cattle_herd", 4 },
							{ "fisherman_bounty", 1 },
							{ "double_sarcophagi", 0 },							
							{ "cedar_chairs", 2 },
							{ "cedar_boats", 2 },
							{ "canaan_craftsmen", 0 },
							{ "canaan_fishermen", 2 },
							{ "cedarwood_oil", 2 },
							{ "elamite_jewelry", 0 },
							{ "canaan_craftsmen_unique_ship", 1 },
							{ "canaan_craftsmen_unique_wood", 0 },
							{ "canaan_fishermen_unique", 0 },
						},
						trade_value_change = {
							olive_oil_jars = -10,
							cedar_timber = -10,
							canaan_beer = -10,
							cedar_seedlings = -10,
							turq_jewelry = -10,
							dried_fish = -5,							
							cedar_basic = -5,							
							cattle_herd = -5,
							fisherman_bounty = -10,
							double_sarcophagi = -5,							
							cedar_chairs = -10,
							cedar_boats = -10,
							canaan_craftsmen = -10,
							canaan_fishermen = -10,
							cedarwood_oil = -10,
							elamite_jewelry = -10,
							canaan_craftsmen_unique_ship = 0,
							canaan_craftsmen_unique_wood = 0,
							canaan_fishermen_unique = 0,
						},
					},
					buying = {
						items = {
							{ "wine_jars" },
							{ "granite_blocks" },
							{ "bronze_ingots" },
							{ "golden_scarabs" },
							{ "kerma_jewelry" },
						},
						trade_value_change = {
							wine_jars = 5,
							granite_blocks = 5,
							bronze_ingots = 5,
							golden_scarabs = 5,
							kerma_jewelry = 5,
							olive_oil_jars = -10,
							cedar_timber = -10,
							canaan_beer = -10,
							cedar_seedlings = -10,
							turq_jewelry = -10,
							dried_fish = -5,							
							cedar_basic = -5,							
							cattle_herd = -5,
							fisherman_bounty = -10,
							double_sarcophagi = -5,							
							cedar_chairs = -10,
							cedar_boats = -10,
							canaan_craftsmen = -10,
							canaan_fishermen = -10,
							cedarwood_oil = -10,
							elamite_jewelry = -10,
							canaan_craftsmen_unique_ship = -50,
							canaan_craftsmen_unique_wood = -50,
							canaan_fishermen_unique = -50,
						},
					},
				},
				{ --Fenkhu 2 - almost no cedar, lots of food, some jewelry
					offering = {
						items = {
							{ "olive_oil_jars", 4 },
							{ "cedar_timber", 2 },
							{ "canaan_beer", 2},
							{ "cedar_seedlings", 1 },
							{ "turq_jewelry", 5 },
							{ "dried_fish", 8 },							
							{ "cedar_basic", 4 },							
							{ "cattle_herd", 6 },
							{ "fisherman_bounty", 2 },
							{ "double_sarcophagi", 2 },							
							{ "cedar_chairs", 0 },
							{ "cedar_boats", 1 },
							{ "canaan_craftsmen", 2 },
							{ "canaan_fishermen", 0 },
							{ "cedarwood_oil", 0 },
							{ "elamite_jewelry", 5 },
							{ "canaan_craftsmen_unique_ship", 0 },
							{ "canaan_craftsmen_unique_wood", 1 },
							{ "canaan_fishermen_unique", 0 },
						},
						trade_value_change = {
							olive_oil_jars = -10,
							cedar_timber = -10,
							canaan_beer = -10,
							cedar_seedlings = -10,
							turq_jewelry = -10,
							dried_fish = -5,							
							cedar_basic = -5,							
							cattle_herd = -5,
							fisherman_bounty = -10,
							double_sarcophagi = -5,							
							cedar_chairs = -10,
							cedar_boats = -10,
							canaan_craftsmen = -10,
							canaan_fishermen = -10,
							cedarwood_oil = -10,
							elamite_jewelry = -10,
							canaan_craftsmen_unique_ship = 0,
							canaan_craftsmen_unique_wood = 0,
							canaan_fishermen_unique = 0,
						},
					},
					buying = {
						items = {
							{ "wine_jars" },
							{ "granite_blocks" },
							{ "bronze_ingots" },
							{ "golden_scarabs" },
							{ "kerma_jewelry" },
						},
						trade_value_change = {
							wine_jars = 5,
							granite_blocks = 5,
							bronze_ingots = 5,
							golden_scarabs = 5,
							kerma_jewelry = 5,
							olive_oil_jars = -10,
							cedar_timber = -10,
							canaan_beer = -10,
							cedar_seedlings = -10,
							turq_jewelry = -10,
							dried_fish = -5,							
							cedar_basic = -5,							
							cattle_herd = -5,
							fisherman_bounty = -10,
							double_sarcophagi = -5,							
							cedar_chairs = -10,
							cedar_boats = -10,
							canaan_craftsmen = -10,
							canaan_fishermen = -10,
							cedarwood_oil = -10,
							elamite_jewelry = -10,
							canaan_craftsmen_unique_ship = -50,
							canaan_craftsmen_unique_wood = -50,
							canaan_fishermen_unique = -50,
						},
					},
				},
				{ --Fenkhu 3 - cedar, almost no food, some jewelry
					offering = {
						items = {
							{ "olive_oil_jars", 4 },
							{ "cedar_timber", 6 },
							{ "canaan_beer", 6 },
							{ "cedar_seedlings", 2 },
							{ "turq_jewelry", 3 },
							{ "dried_fish", 2 },							
							{ "cedar_basic", 5 },							
							{ "cattle_herd", 4 },
							{ "fisherman_bounty", 5 },
							{ "double_sarcophagi", 1 },							
							{ "cedar_chairs", 1 },
							{ "cedar_boats", 1 },
							{ "canaan_craftsmen", 1 },
							{ "canaan_fishermen", 1 },
							{ "cedarwood_oil", 2 },
							{ "elamite_jewelry", 6 },
							{ "canaan_craftsmen_unique_ship", 0 },
							{ "canaan_craftsmen_unique_wood", 0 },
							{ "canaan_fishermen_unique", 1 },
						},
						trade_value_change = {
							olive_oil_jars = -10,
							cedar_timber = -10,
							canaan_beer = -10,
							cedar_seedlings = -10,
							turq_jewelry = -10,
							dried_fish = -5,							
							cedar_basic = -5,							
							cattle_herd = -5,
							fisherman_bounty = -10,
							double_sarcophagi = -5,							
							cedar_chairs = -10,
							cedar_boats = -10,
							canaan_craftsmen = -10,
							canaan_fishermen = -10,
							cedarwood_oil = -10,
							elamite_jewelry = -10,
							canaan_craftsmen_unique_ship = 0,
							canaan_craftsmen_unique_wood = 0,
							canaan_fishermen_unique = 0,
						},
					},
					buying = {
						items = {
							{ "wine_jars" },
							{ "granite_blocks" },
							{ "bronze_ingots" },
							{ "golden_scarabs" },
							{ "kerma_jewelry" },
						},
						trade_value_change = {
							wine_jars = 5,
							granite_blocks = 5,
							bronze_ingots = 5,
							golden_scarabs = 5,
							kerma_jewelry = 5,
							olive_oil_jars = -10,
							cedar_timber = -10,
							canaan_beer = -10,
							cedar_seedlings = -10,
							turq_jewelry = -10,
							dried_fish = -5,							
							cedar_basic = -5,							
							cattle_herd = -5,
							fisherman_bounty = -10,
							double_sarcophagi = -5,							
							cedar_chairs = -10,
							cedar_boats = -10,
							canaan_craftsmen = -10,
							canaan_fishermen = -10,
							cedarwood_oil = -10,
							elamite_jewelry = -10,
							canaan_craftsmen_unique_ship = -50,
							canaan_craftsmen_unique_wood = -50,
							canaan_fishermen_unique = -50,
						},
					},
				},
			},
		},

		canaanite_retjenu_realm = {
			bazaar_strings = {
				good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_4_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_1_retjennu",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_2_retjennu",
				},
				not_good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_4_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_1_retjennu",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_2_retjennu",
 				},
				bad_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_4_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_1_retjennu",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_2_retjennu",
				},
			},
			unlock = "",
			localised_name = "random_localisation_strings_string_canaanite_retjenu_realm",
			num_items_to_show = 5,
			item_bundles = {
				{ --Retjennu 1 - equal mix of cedar and food
					offering = {
						items = {
							{ "canaan_wheat", 8 },
							{ "cedar_basic", 8 },
							{ "canaan_beer", 2 },
							{ "cattle_herd", 4 },
							{ "cedar_timber", 1 },
							{ "double_sarcophagi", 1 },
							{ "canaan_tools_mine", 2 },
							{ "senet_game", 1 },
							{ "cedar_chairs", 2 },
							{ "assyrian_mercenary", 1 },
							{ "canaan_farmers", 0 },
							{ "healer_babylonian", 1 },							
							{ "mitanni_horse_trainer", 0 },
						},
						trade_value_change = {
							canaan_wheat = -5,
							cedar_basic = -5,
							canaan_beer = -10,
							cattle_herd = -5,
							cedar_timber = -10,
							double_sarcophagi = -5,
							canaan_tools_mine = -10,
							senet_game = -10,
							cedar_chairs = -10,
							assyrian_mercenary = -10,
							canaan_farmers =  -10,
							healer_babylonian = 0,							
							mitanni_horse_trainer = 0,
						},
					},
					buying = {
						items = {
							{ "bronze_ingots" },
							{ "heavy_ropes" },
							{ "kush_weapons" },
							{ "assyrian_bronzework" },
							{ "anatolian_bronzework" },
						},
						trade_value_change = {
							bronze_ingots = 5,
							heavy_ropes = 5,
							kush_weapons = 5,
							assyrian_bronzework = 5,
							anatolian_bronzework = 5,
							canaan_wheat = -5,
							cedar_basic = -5,
							canaan_beer = -10,
							cattle_herd = -5,
							cedar_timber = -10,
							double_sarcophagi = -5,
							canaan_tools_mine = -10,
							senet_game = -10,
							cedar_chairs = -10,
							assyrian_mercenary = -10,
							canaan_farmers =  -10,
							healer_babylonian = -50,							
							mitanni_horse_trainer = -50,
						},
					},
				},
				{ --Retjennu 2 - more cedar than food
					offering = {
						items = {
							{ "canaan_wheat", 3 },
							{ "cedar_basic", 10 },
							{ "canaan_beer", 5 },
							{ "cattle_herd", 3 },
							{ "cedar_timber", 2 },
							{ "double_sarcophagi", 2 },
							{ "canaan_tools_mine", 0 },
							{ "senet_game", 1 },
							{ "cedar_chairs", 3 },
							{ "assyrian_mercenary", 0 },
							{ "canaan_farmers", 2 },
							{ "healer_babylonian", 0 },							
							{ "mitanni_horse_trainer", 1 },
						},
						trade_value_change = {
							canaan_wheat = -5,
							cedar_basic = -5,
							canaan_beer = -10,
							cattle_herd = -5,
							cedar_timber = -10,
							double_sarcophagi = -5,
							canaan_tools_mine = -10,
							senet_game = -10,
							cedar_chairs = -10,
							assyrian_mercenary = -10,
							canaan_farmers =  -10,
							healer_babylonian = 0,
							mitanni_horse_trainer = 0,
						},
					},
					buying = {
						items = {
							{ "bronze_ingots" },
							{ "heavy_ropes" },
							{ "kush_weapons" },
							{ "assyrian_bronzework" },
							{ "anatolian_bronzework" },
						},
						trade_value_change = {
							bronze_ingots = 5,
							heavy_ropes = 5,
							kush_weapons = 5,
							assyrian_bronzework = 5,
							anatolian_bronzework = 5,
							canaan_wheat = -5,
							cedar_basic = -5,
							canaan_beer = -10,
							cattle_herd = -5,
							cedar_timber = -10,
							double_sarcophagi = -5,
							canaan_tools_mine = -10,
							senet_game = -10,
							cedar_chairs = -10,
							assyrian_mercenary = -10,
							canaan_farmers =  -10,
							healer_babylonian = -50,							
							mitanni_horse_trainer = -50,
						},
					},
				},
				{ --Retjennu 3 - more food than cedar
					offering = {
						items = {
							{ "canaan_wheat", 12 },
							{ "cedar_basic", 4 },
							{ "canaan_beer", 8 },
							{ "cattle_herd", 8 },
							{ "cedar_timber", 6 },
							{ "double_sarcophagi", 0 },
							{ "canaan_tools_mine", 0 },
							{ "senet_game", 2 },
							{ "cedar_chairs", 2 },
							{ "assyrian_mercenary", 1 },
							{ "canaan_farmers", 1 },
							{ "healer_babylonian", 1 },							
							{ "mitanni_horse_trainer", 1 },
						},
						trade_value_change = {
							canaan_wheat = -5,
							cedar_basic = -5,
							canaan_beer = -10,
							cattle_herd = -5,
							cedar_timber = -10,
							double_sarcophagi = -5,
							canaan_tools_mine = -10,
							senet_game = -10,
							cedar_chairs = -10,
							assyrian_mercenary = -10,
							canaan_farmers =  -10,
							healer_babylonian = 0,
							mitanni_horse_trainer = 0,
						},
					},
					buying = {
						items = {
							{ "bronze_ingots" },
							{ "heavy_ropes" },
							{ "kush_weapons" },
							{ "assyrian_bronzework" },
							{ "anatolian_bronzework" },
						},
						trade_value_change = {
							bronze_ingots = 5,
							heavy_ropes = 5,
							kush_weapons = 5,
							assyrian_bronzework = 5,
							anatolian_bronzework = 5,
							canaan_wheat = -5,
							cedar_basic = -5,
							canaan_beer = -10,
							cattle_herd = -5,
							cedar_timber = -10,
							double_sarcophagi = -5,
							canaan_tools_mine = -10,
							senet_game = -10,
							cedar_chairs = -10,
							assyrian_mercenary = -10,
							canaan_farmers =  -10,
							healer_babylonian = -50,							
							mitanni_horse_trainer = -50,
						},
					},
				},
			},
		},

		canaanite_yamhad_realm = {
			bazaar_strings = {
				good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_2_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_1_yamhad",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_2_yamhad",
				},
				not_good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_2_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_1_yamhad",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_2_yamhad",
 				},
				bad_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_2_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_1_yamhad",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_2_yamhad",
				},
			},
			unlock = "",
			localised_name = "random_localisation_strings_string_canaanite_yamhad_realm",
			num_items_to_show = 5,
			item_bundles = {
				{ --Yamhad 1 - olive oil, bronze
					offering = {
						items = {
							{ "olive_oil_jars", 3 },
							{ "bronze_ingots", 5 },
							{ "dried_fish", 5 },
							{ "assyrian_bronzework", 2 },
							{ "bronze_statues_small", 2 },
							{ "cedar_timber", 0 },
							{ "minoan_bronzework", 2 },							
							{ "elamite_jewelry", 0 },
							{ "cyprian_fishermen", 2 },
							{ "cyprian_fishermen_unique", 0 },
							{ "cyprian_miners", 2 },
							{ "minoan_pottery", 3 },
							{ "tablet_construction", 1 },
							{ "tablet_farming", 1 },
							{ "tablet_healing", 0 },
							{ "tablet_mining", 0 },
							{ "tablet_survival", 0 },
						},
						trade_value_change = {
							olive_oil_jars = -10,
							cedar_timber = -10,
							bronze_ingots = -5,
							dried_fish = -5,
							assyrian_bronzework = -10,
							minoan_bronzework = -10,
							bronze_statues_small = -10,
							elamite_jewelry = -10,
							cyprian_fishermen = -10,
							cyprian_fishermen_unique = 0,
							cyprian_miners = -10,
							minoan_pottery = -10,
							tablet_construction = -10,
							tablet_farming = -10,
							tablet_healing = -10,
							tablet_mining = -10,
							tablet_survival = -10,
						},
					},
					buying = {
						items = {
							{ "delta_wheat" },
							{ "granite_blocks" },
							{ "egyptian_beer" },
							{ "canaan_beer" },
							{ "golden_scarabs" },							
						},
						trade_value_change = {
							delta_wheat = 5,
							granite_blocks = 5,
							egyptian_beer = 5,
							canaan_beer = 5,
							golden_scarabs = 5,
							olive_oil_jars = -10,
							cedar_timber = -10,
							bronze_ingots = -5,
							dried_fish = -5,
							assyrian_bronzework = -10,
							minoan_bronzework = -10,
							bronze_statues_small = -10,
							elamite_jewelry = -10,
							cyprian_fishermen = -10,
							cyprian_fishermen_unique = 0,
							cyprian_miners = -10,
							minoan_pottery = -10,
							tablet_construction = -10,
							tablet_farming = -10,
							tablet_healing = -10,
							tablet_mining = -10,
							tablet_survival = -10,
						},
					},
				},
				{ --Yamhad 2 - less bronzeworks, a lot of other things
					offering = {
						items = {
							{ "olive_oil_jars", 5 },							
							{ "bronze_ingots", 2 },
							{ "dried_fish", 3 },
							{ "assyrian_bronzework", 1 },						
							{ "bronze_statues_small", 1 },
							{ "minoan_bronzework", 1 },
							{ "cedar_timber", 6 },
							{ "elamite_jewelry", 4 },
							{ "cyprian_fishermen", 0 },
							{ "cyprian_fishermen_unique", 1 },
							{ "cyprian_miners", 1 },
							{ "minoan_pottery", 3 },
							{ "tablet_construction", 0 },
							{ "tablet_farming", 0 },
							{ "tablet_healing", 0 },
							{ "tablet_mining", 1 },
							{ "tablet_survival", 1 },
						},
						trade_value_change = {
							olive_oil_jars = -10,							
							bronze_ingots = -5,
							dried_fish = -5,
							assyrian_bronzework = -10,							
							bronze_statues_small = -10,
							minoan_bronzework = -10,
							cedar_timber = -10,
							elamite_jewelry = -10,
							cyprian_fishermen = -10,
							cyprian_fishermen_unique = 0,
							cyprian_miners = -10,
							minoan_pottery = -10,
							tablet_construction = -10,
							tablet_farming = -10,
							tablet_healing = -10,
							tablet_mining = -10,
							tablet_survival = -10,
						},
					},
					buying = {
						items = {
							{ "delta_wheat" },
							{ "granite_blocks" },
							{ "egyptian_beer" },
							{ "canaan_beer" },
							{ "golden_scarabs" },							
						},
						trade_value_change = {
							delta_wheat = 5,
							granite_blocks = 5,
							egyptian_beer = 5,
							canaan_beer = 5,
							golden_scarabs = 5,
							olive_oil_jars = -10,
							cedar_timber = -10,
							bronze_ingots = -5,
							dried_fish = -5,
							assyrian_bronzework = -10,
							minoan_bronzework = -10,
							bronze_statues_small = -10,
							elamite_jewelry = -10,
							cyprian_fishermen = -10,
							cyprian_fishermen_unique = 0,
							cyprian_miners = -10,
							minoan_pottery = -10,
							tablet_construction = -10,
							tablet_farming = -10,
							tablet_healing = -10,
							tablet_mining = -10,
							tablet_survival = -10,
						},
					},
				},
				{ --Yamhad 3 - lots of bronzeworks and nothing else
					offering = {
						items = {
							{ "olive_oil_jars", 2 },							
							{ "bronze_ingots", 8 },
							{ "dried_fish", 8 },
							{ "assyrian_bronzework", 4 },							
							{ "bronze_statues_small", 3 },
							{ "cedar_timber", 1 },
							{ "minoan_bronzework", 4 },
							{ "elamite_jewelry", 0 },
							{ "cyprian_fishermen", 1 },
							{ "cyprian_fishermen_unique", 0 },
							{ "cyprian_miners", 0 },
							{ "minoan_pottery", 1 },
							{ "tablet_construction", 1 },
							{ "tablet_farming", 1 },
							{ "tablet_healing", 1 },
							{ "tablet_mining", 1 },
							{ "tablet_survival", 1 },
						},
						trade_value_change = {
							olive_oil_jars = -10,							
							bronze_ingots = -5,
							dried_fish = -5,
							assyrian_bronzework = -10,							
							bronze_statues_small = -10,
							cedar_timber = -10,
							minoan_bronzework = -10,
							elamite_jewelry = -10,
							cyprian_fishermen = -10,
							cyprian_fishermen_unique = 0,
							cyprian_miners = -10,
							minoan_pottery = -10,
							tablet_construction = -10,
							tablet_farming = -10,
							tablet_healing = -10,
							tablet_mining = -10,
							tablet_survival = -10,
						},
					},
					buying = {
						items = {
							{ "delta_wheat" },
							{ "granite_blocks" },
							{ "egyptian_beer" },
							{ "canaan_beer" },
							{ "golden_scarabs" },							
						},
						trade_value_change = {
							delta_wheat = 5,
							granite_blocks = 5,
							egyptian_beer = 5,
							canaan_beer = 5,
							golden_scarabs = 5,
							olive_oil_jars = -10,
							cedar_timber = -10,
							bronze_ingots = -5,
							dried_fish = -5,
							assyrian_bronzework = -10,
							minoan_bronzework = -10,
							bronze_statues_small = -10,
							elamite_jewelry = -10,
							cyprian_fishermen = -10,
							cyprian_fishermen_unique = 0,
							cyprian_miners = -10,
							minoan_pottery = -10,
							tablet_construction = -10,
							tablet_farming = -10,
							tablet_healing = -10,
							tablet_mining = -10,
							tablet_survival = -10,
						},
					},
				},
			},
		},

		hittite_isuwa_realm = {
			bazaar_strings = {
				good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_1_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_1_isuwa_desc",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_2_isuwa_desc",
				},
				not_good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_1_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_1_isuwa_desc",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_2_isuwa_desc",
 				},
				bad_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_1_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_1_isuwa_desc",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_2_isuwa_desc",
				},
			},
			unlock = "",
			localised_name = "random_localisation_strings_string_hittite_isuwa_realm",
			num_items_to_show = 5,
			item_bundles = {
				{ --Isuwa 1 - statues and wine
					offering = {
						items = {
							{ "cattle_herd", 3 },
							{ "stone_blocks", 2 },
							{ "wine_jars", 5 },							
							{ "stone_statues_small", 3 },
							{ "assyrian_bronzework", 2 },
							{ "lamasu_statue_big", 3 },
							{ "elamite_jewelry", 0 },
							{ "ceremonial_sword", 0 },
							{ "assyrian_mercenary", 2 },
							{ "assyrian_veils", 1 },
							{ "epic_gilgamesh", 0 },
							{ "tablet_construction", 0 },
							{ "tablet_farming", 1 },
							{ "tablet_healing", 0 },
							{ "tablet_mining", 1 },
							{ "tablet_survival", 0 },
						},
						trade_value_change = {
							cattle_herd = -5,
							stone_blocks = -5,
							wine_jars = -10,							
							stone_statues_small = -10,
							assyrian_bronzework = -10,
							lamasu_statue_big = -10,
							elamite_jewelry = -10,
							ceremonial_sword = -10,
							assyrian_mercenary = -10,
							assyrian_veils = -10,
							epic_gilgamesh = -10,
							tablet_construction = -10,
							tablet_farming = -10,
							tablet_healing = -10,
							tablet_mining = -10,
							tablet_survival = -10,
						},
					},
					buying = {
						items = {
							{ "delta_wheat" },
							{ "egypt_acacia_boats" },
							{ "cedar_boats" },
							{ "golden_scarabs" },
							{ "kerma_jewelry" },
						},
						trade_value_change = {
							delta_wheat = 5,
							egypt_acacia_boats = 5,
							cedar_boats = 5,
							golden_scarabs = 5,
							kerma_jewelry = 5,
							cattle_herd = -5,
							stone_blocks = -5,
							wine_jars = -10,							
							stone_statues_small = -10,
							assyrian_bronzework = -10,
							lamasu_statue_big = -10,
							elamite_jewelry = -10,
							ceremonial_sword = -10,
							assyrian_mercenary = -10,
							assyrian_veils = -10,
							epic_gilgamesh = -10,
							tablet_construction = -10,
							tablet_farming = -10,
							tablet_healing = -10,
							tablet_mining = -10,
							tablet_survival = -10,
						},
					},
				},
				{ --Isuwa 2 - less statues and wine, more bronzeworks and jewelry
					offering = {
						items = {
							{ "cattle_herd", 2 },
							{ "stone_blocks", 4 },
							{ "wine_jars", 2 },							
							{ "stone_statues_small", 1 },
							{ "assyrian_bronzework", 3 },
							{ "lamasu_statue_big", 0 },
							{ "elamite_jewelry", 3 },
							{ "ceremonial_sword", 1 },
							{ "assyrian_mercenary", 1 },
							{ "assyrian_veils", 0 },
							{ "epic_gilgamesh", 0 },
							{ "tablet_construction", 1 },
							{ "tablet_farming", 0 },
							{ "tablet_healing", 1 },
							{ "tablet_mining", 0 },
							{ "tablet_survival", 1 },
						},
						trade_value_change = {
							cattle_herd = -5,
							stone_blocks = -5,
							wine_jars = -10,							
							stone_statues_small = -10,
							assyrian_bronzework = -10,
							lamasu_statue_big = -10,
							elamite_jewelry = -10,
							ceremonial_sword = -10,
							assyrian_mercenary = -10,
							assyrian_veils = -10,
							epic_gilgamesh = -10,
							tablet_construction = -10,
							tablet_farming = -10,
							tablet_healing = -10,
							tablet_mining = -10,
							tablet_survival = -10,
						},
					},
					buying = {
						items = {
							{ "delta_wheat" },
							{ "egypt_acacia_boats" },
							{ "cedar_boats" },
							{ "golden_scarabs" },
							{ "kerma_jewelry" },
						},
						trade_value_change = {
							delta_wheat = 5,
							egypt_acacia_boats = 5,
							cedar_boats = 5,
							golden_scarabs = 5,
							kerma_jewelry = 5,
							cattle_herd = -5,
							stone_blocks = -5,
							wine_jars = -10,							
							stone_statues_small = -10,
							assyrian_bronzework = -10,
							lamasu_statue_big = -10,
							elamite_jewelry = -10,
							ceremonial_sword = -10,
							assyrian_mercenary = -10,
							assyrian_veils = -10,
							epic_gilgamesh = -10,
							tablet_construction = -10,
							tablet_farming = -10,
							tablet_healing = -10,
							tablet_mining = -10,
							tablet_survival = -10,
						},
					},
				},
				{ --Isuwa 3 - no wine, statues and jewelry
					offering = {
						items = {
							{ "cattle_herd", 5 },
							{ "stone_blocks", 5 },
							{ "wine_jars", 2 },							
							{ "stone_statues_small", 1 },
							{ "assyrian_bronzework", 5 },
							{ "lamasu_statue_big", 2 },
							{ "elamite_jewelry", 3 },
							{ "ceremonial_sword", 1 },
							{ "assyrian_mercenary", 0 },
							{ "assyrian_veils", 2 },
							{ "epic_gilgamesh", 1 },
							{ "tablet_construction", 1 },
							{ "tablet_farming", 1 },
							{ "tablet_healing", 1 },
							{ "tablet_mining", 1 },
							{ "tablet_survival", 1 },
						},
						trade_value_change = {
							cattle_herd = -5,
							stone_blocks = -5,
							wine_jars = -10,							
							stone_statues_small = -10,
							assyrian_bronzework = -10,
							lamasu_statue_big = -10,
							elamite_jewelry = -10,
							ceremonial_sword = -10,
							assyrian_mercenary = -10,
							assyrian_veils = -10,
							epic_gilgamesh = -10,
							tablet_construction = -10,
							tablet_farming = -10,
							tablet_healing = -10,
							tablet_mining = -10,
							tablet_survival = -10,
						},
					},
					buying = {
						items = {
							{ "delta_wheat" },
							{ "egypt_acacia_boats" },
							{ "cedar_boats" },
							{ "golden_scarabs" },
							{ "kerma_jewelry" },
						},
						trade_value_change = {
							delta_wheat = 5,
							egypt_acacia_boats = 5,
							cedar_boats = 5,
							golden_scarabs = 5,
							kerma_jewelry = 5,
							cattle_herd = -5,
							stone_blocks = -5,
							wine_jars = -10,							
							stone_statues_small = -10,
							assyrian_bronzework = -10,
							lamasu_statue_big = -10,
							elamite_jewelry = -10,
							ceremonial_sword = -10,
							assyrian_mercenary = -10,
							assyrian_veils = -10,
							epic_gilgamesh = -10,
							tablet_construction = -10,
							tablet_farming = -10,
							tablet_healing = -10,
							tablet_mining = -10,
							tablet_survival = -10,
						},
					},
				},
			},
		},

		hittite_lowlands_realm = {
			bazaar_strings = {
				good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_2_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_4_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_1_lowlands_desc",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_2_lowlands_desc",
				},
				not_good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_2_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_4_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_1_lowlands_desc",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_2_lowlands_desc",
 				},
				bad_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_2_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_4_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_1_lowlands_desc",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_2_lowlands_desc",
				},
			},
			unlock = "",
			localised_name = "random_localisation_strings_string_hittite_lowlands_realm",
			num_items_to_show = 5,
			item_bundles = {
				{ --Lowlands 1 - no cedar, lots of everything else
					offering = {
						items = {
							{ "hunters_haul", 5 },
							{ "olive_oil_jars", 4 },
							{ "cedar_seedlings", 1 },
							{ "cedar_boats", 2 },
							{ "bronze_statues_small", 2 },
							{ "cedar_timber", 2 },
							{ "dried_fish", 6 },
							{ "cedar_basic", 3 },
							{ "cedar_chariots", 0 },
							{ "anatolian_bronzework", 3 },							
							{ "anatolian_tools", 2 },
							{ "hittite_blacksmiths", 0 },
							{ "hittite_blacksmiths_unique", 0 },
							{ "hittite_woodworkers", 2 },
						},
						trade_value_change = {
							hunters_haul = -5,
							olive_oil_jars = -10,
							cedar_seedlings = -10,
							cedar_boats = -10,
							bronze_statues_small = -10,
							cedar_timber = -10,
							dried_fish = -5,
							cedar_basic = -5,
							cedar_chariots = -10,							
							anatolian_bronzework = -10,
							anatolian_tools = -10,
							hittite_blacksmiths = -10,
							hittite_blacksmiths_unique = 0,
							hittite_woodworkers = -10,
						},
					},
					buying = {
						items = {
							{ "egyptian_beer" },
							{ "canaan_beer" },
							{ "kerma_jewelry" },
							{ "elamite_jewelry" },
							{ "golden_scarabs" },
						},
						trade_value_change = {
							egyptian_beer = 5,
							canaan_beer = 5,
							kerma_jewelry = 5,
							elamite_jewelry = 5,
							golden_scarabs = 5,
							hunters_haul = -5,
							olive_oil_jars = -10,
							cedar_seedlings = -10,
							cedar_boats = -10,
							bronze_statues_small = -10,
							cedar_timber = -10,
							dried_fish = -5,
							cedar_basic = -5,
							cedar_chariots = -10,							
							anatolian_bronzework = -10,
							anatolian_tools = -10,
							hittite_blacksmiths = -10,
							hittite_blacksmiths_unique = -50,
							hittite_woodworkers = -10,
						},
					},
				},
				{ --Lowlands 2 - cedar and food, poor on bronze
					offering = {
						items = {
							{ "hunters_haul", 3 },
							{ "olive_oil_jars", 2 },
							{ "cedar_seedlings", 2 },
							{ "cedar_boats", 1 },
							{ "bronze_statues_small", 1 },
							{ "cedar_timber", 6 },
							{ "dried_fish", 2 },
							{ "cedar_basic", 5 },
							{ "cedar_chariots", 2 },							
							{ "anatolian_bronzework", 0 },
							{ "anatolian_tools", 1 },
							{ "hittite_blacksmiths", 1 },
							{ "hittite_blacksmiths_unique", 1 },
							{ "hittite_woodworkers", 0 },
						},
						trade_value_change = {
							hunters_haul = -5,
							olive_oil_jars = -10,
							cedar_seedlings = -10,
							cedar_boats = -10,
							bronze_statues_small = -10,
							cedar_timber = -10,
							dried_fish = -5,
							cedar_basic = -5,
							cedar_chariots = -10,							
							anatolian_bronzework = -10,
							anatolian_tools = -10,
							hittite_blacksmiths = -10,
							hittite_blacksmiths_unique = 0,
							hittite_woodworkers = -10,
						},
					},
					buying = {
						items = {
							{ "egyptian_beer" },
							{ "canaan_beer" },
							{ "kerma_jewelry" },
							{ "elamite_jewelry" },
							{ "golden_scarabs" },
						},
						trade_value_change = {
							egyptian_beer = 5,
							canaan_beer = 5,
							kerma_jewelry = 5,
							elamite_jewelry = 5,
							golden_scarabs = 5,
							hunters_haul = -5,
							olive_oil_jars = -10,
							cedar_seedlings = -10,
							cedar_boats = -10,
							bronze_statues_small = -10,
							cedar_timber = -10,
							dried_fish = -5,
							cedar_basic = -5,
							cedar_chariots = -10,							
							anatolian_bronzework = -10,
							anatolian_tools = -10,
							hittite_blacksmiths = -10,
							hittite_blacksmiths_unique = -50,
							hittite_woodworkers = -10,
						},
					},
				},
				{ --Lowlands 3 - cedar and bronze, no food
					offering = {
						items = {
							{ "hunters_haul", 2 },
							{ "olive_oil_jars", 0 },
							{ "cedar_seedlings", 1 },
							{ "cedar_boats", 2 },
							{ "bronze_statues_small", 4 },
							{ "cedar_timber", 8 },
							{ "dried_fish", 0 },
							{ "cedar_basic", 10 },
							{ "cedar_chariots", 2 },							
							{ "anatolian_bronzework", 4 },
							{ "anatolian_tools", 0 },
							{ "hittite_blacksmiths", 1 },
							{ "hittite_blacksmiths_unique", 0 },
							{ "hittite_woodworkers", 1 },
						},
						trade_value_change = {
							hunters_haul = -5,
							olive_oil_jars = -10,
							cedar_seedlings = -10,
							cedar_boats = -10,
							bronze_statues_small = -10,
							cedar_timber = -10,
							dried_fish = -5,
							cedar_basic = -5,
							cedar_chariots = -10,							
							anatolian_bronzework = -10,
							anatolian_tools = -10,
							hittite_blacksmiths = -10,
							hittite_blacksmiths_unique = 0,
							hittite_woodworkers = -10,
						},
					},
					buying = {
						items = {
							{ "egyptian_beer" },
							{ "canaan_beer" },
							{ "kerma_jewelry" },
							{ "elamite_jewelry" },
							{ "golden_scarabs" },
						},
						trade_value_change = {
							egyptian_beer = 5,
							canaan_beer = 5,
							kerma_jewelry = 5,
							elamite_jewelry = 5,
							golden_scarabs = 5,
							hunters_haul = -5,
							olive_oil_jars = -10,
							cedar_seedlings = -10,
							cedar_boats = -10,
							bronze_statues_small = -10,
							cedar_timber = -10,
							dried_fish = -5,
							cedar_basic = -5,
							cedar_chariots = -10,							
							anatolian_bronzework = -10,
							anatolian_tools = -10,
							hittite_blacksmiths = -10,
							hittite_blacksmiths_unique = -50,
							hittite_woodworkers = -10,
						},
					},
				},
			},
		},

		hittite_highlands_realm = {
			bazaar_strings = {
				good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_1_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_4_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_1_highlands_desc",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_2_highlands_desc",
				},
				not_good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_1_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_4_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_1_highlands_desc",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_2_highlands_desc",
 				},
				bad_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_1_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_4_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_1_highlands_desc",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_2_highlands_desc",
				},
			},
			unlock = "",
			localised_name = "random_localisation_strings_string_hittite_highlands_realm",
			num_items_to_show = 5,
			item_bundles = {
				{ --Highlands 1 - wine and stone
					offering = {
						items = {
							{ "hunters_haul", 3 },
							{ "cedar_timber", 1 },
							{ "granite_blocks", 4 },
							{ "wine_jars", 4 },
							{ "anatolian_bronzework", 4 },
							{ "cedar_chariots", 0 },
							{ "stone_blocks", 6 },
							{ "hittite_statue_big", 2 },
							{ "ceremonial_sword", 0 },
							{ "bitumen_jugs", 2 },
							{ "hittite_blacksmiths", 0 },
							{ "hittite_woodworkers", 1 },
						},
						trade_value_change = {
							hunters_haul = -5,
							cedar_timber = -10,
							granite_blocks = -10,
							wine_jars = -10,
							anatolian_bronzework = -10,
							cedar_chariots = -10,
							stone_blocks = -5,
							hittite_statue_big = -10,
							ceremonial_sword = -10,
							bitumen_jugs = -10,
							hittite_blacksmiths = -10,
							hittite_woodworkers = -10,
						},
					},
					buying = {
						items = {
							{ "delta_wheat" },
							{ "bronze_ingots" },
							{ "kerma_jewelry" },
							{ "elamite_jewelry" },
							{ "golden_scarabs" },
						},
						trade_value_change = {
							delta_wheat = 5,
							bronze_ingots = 5,
							kerma_jewelry = 5,
							elamite_jewelry = 5,
							golden_scarabs = 5,
							hunters_haul = -5,
							cedar_timber = -10,
							granite_blocks = -10,
							wine_jars = -10,
							anatolian_bronzework = -10,
							cedar_chariots = -10,
							stone_blocks = -5,
							hittite_statue_big = -10,
							ceremonial_sword = -10,
							bitumen_jugs = -10,
							hittite_blacksmiths = -10,
							hittite_woodworkers = -10,
						},
					},
				},
				{ --Highlands 2 - poor on stone, good on everything else
					offering = {
						items = {
							{ "hunters_haul", 6 },
							{ "cedar_timber", 4 },
							{ "granite_blocks", 2 },
							{ "wine_jars", 3 },
							{ "anatolian_bronzework", 6 },
							{ "cedar_chariots", 2 },
							{ "stone_blocks", 4 },
							{ "hittite_statue_big", 0 },
							{ "ceremonial_sword", 1 },
							{ "bitumen_jugs", 0 },
							{ "hittite_blacksmiths", 1 },
							{ "hittite_woodworkers", 0 },
						},
						trade_value_change = {
							hunters_haul = -5,
							cedar_timber = -10,
							granite_blocks = -10,
							wine_jars = -10,
							anatolian_bronzework = -10,
							cedar_chariots = -10,
							stone_blocks = -5,
							hittite_statue_big = -10,
							ceremonial_sword = -10,
							bitumen_jugs = -10,
							hittite_blacksmiths = -10,
							hittite_woodworkers = -10,
						},
					},
					buying = {
						items = {
							{ "delta_wheat" },
							{ "bronze_ingots" },
							{ "kerma_jewelry" },
							{ "elamite_jewelry" },
							{ "golden_scarabs" },
						},
						trade_value_change = {
							delta_wheat = 5,
							bronze_ingots = 5,
							kerma_jewelry = 5,
							elamite_jewelry = 5,
							golden_scarabs = 5,
							hunters_haul = -5,
							cedar_timber = -10,
							granite_blocks = -10,
							wine_jars = -10,
							anatolian_bronzework = -10,
							cedar_chariots = -10,
							stone_blocks = -5,
							hittite_statue_big = -10,
							ceremonial_sword = -10,
							bitumen_jugs = -10,
							hittite_blacksmiths = -10,
							hittite_woodworkers = -10,
						},
					},
				},
				{ --Highlands 3 - stone and bronze, no wine
					offering = {
						items = {
							{ "hunters_haul", 8 },
							{ "cedar_timber", 6 },
							{ "granite_blocks", 4 },
							{ "wine_jars", 5 },
							{ "anatolian_bronzework", 3 },
							{ "cedar_chariots", 1 },
							{ "stone_blocks", 4 },
							{ "hittite_statue_big", 2 },
							{ "ceremonial_sword", 1 },
							{ "bitumen_jugs", 0 },
							{ "hittite_blacksmiths", 1 },
							{ "hittite_woodworkers", 1 },
						},
						trade_value_change = {
							hunters_haul = -5,
							cedar_timber = -10,
							granite_blocks = -10,
							wine_jars = -10,
							anatolian_bronzework = -10,
							cedar_chariots = -10,
							stone_blocks = -5,
							hittite_statue_big = -10,
							ceremonial_sword = -10,
							bitumen_jugs = -10,
							hittite_blacksmiths = -10,
							hittite_woodworkers = -10,
						},
					},
					buying = {
						items = {
							{ "delta_wheat" },
							{ "bronze_ingots" },
							{ "kerma_jewelry" },
							{ "elamite_jewelry" },
							{ "golden_scarabs" },
						},
						trade_value_change = {
							delta_wheat = 5,
							bronze_ingots = 5,
							kerma_jewelry = 5,
							elamite_jewelry = 5,
							golden_scarabs = 5,
							hunters_haul = -5,
							cedar_timber = -10,
							granite_blocks = -10,
							wine_jars = -10,
							anatolian_bronzework = -10,
							cedar_chariots = -10,
							stone_blocks = -5,
							hittite_statue_big = -10,
							ceremonial_sword = -10,
							bitumen_jugs = -10,
							hittite_blacksmiths = -10,
							hittite_woodworkers = -10,
						},
					},
				},
			},
		},

		punt = {
			bazaar_strings = {
				good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_1_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_1_punt",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_2_punt",
				},
				not_good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_1_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_1_punt",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_2_punt",
 				},
				bad_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_1_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_1_punt",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_2_punt",
				},
			},
			unlock = "",
			localised_name = "random_localisation_strings_string_realm_punt",
			num_items_to_show = 5,
			item_bundles = {
				{ --Punt 1 - more food
					offering = {
						items = {
							{ "gold_ore", 4 },
							{ "copper_ore", 4 },
							{ "ebony_logs", 2 },
							{ "obsidian_tools", 1 },
							{ "myrrh_seedlings", 1 },
							{ "malachite_jewelry", 5 },
							{ "lions", 3 },
							{ "giraffes", 3 },
							{ "frankincense_seedlings", 1 },
							{ "dancing_dwarf", 1 },
							{ "cinnamon_plants", 5 },
							{ "baboons", 2 },
						},
						trade_value_change = {
							gold_ore = -5,
							copper_ore = -5,
							ebony_logs = -10,
							obsidian_tools = -10,
							myrrh_seedlings = -10,
							malachite_jewelry = -10,
							lions = -10,
							giraffes = -10,
							frankincense_seedlings = -10,
							dancing_dwarf = -10,
							cinnamon_plants = -10,
							baboons = -10,
						},
					},
					buying = {
						items = {
							{ "delta_wheat" },
							{ "cedar_timber" },
							{ "bronze_ingots" },
							{ "stone_statues_small" },
							{ "bronze_statues_small" },
						},
						trade_value_change = {
							delta_wheat = 5,
							cedar_timber = 5,
							bronze_ingots = 5,
							stone_statues_small = 5,
							bronze_statues_small = 5,
							gold_ore = -5,
							copper_ore = -5,
							ebony_logs = -10,
							obsidian_tools = -10,
							myrrh_seedlings = -10,
							malachite_jewelry = -10,
							lions = -10,
							giraffes = -10,
							frankincense_seedlings = -10,
							dancing_dwarf = -10,
							cinnamon_plants = -10,
							baboons = -10,
						},
					},
				},
				{ --Punt 2 - more trees
					offering = {
						items = {
							{ "gold_ore", 8 },
							{ "copper_ore", 8 },
							{ "ebony_logs", 6 },
							{ "obsidian_tools", 2 },
							{ "myrrh_seedlings", 2 },
							{ "malachite_jewelry", 3 },
							{ "lions", 2 },
							{ "giraffes", 2 },
							{ "frankincense_seedlings", 2 },
							{ "dancing_dwarf", 0 },
							{ "cinnamon_plants", 6 },
							{ "baboons", 1 },
						},
						trade_value_change = {
							gold_ore = -5,
							copper_ore = -5,
							ebony_logs = -10,
							obsidian_tools = -10,
							myrrh_seedlings = -10,
							malachite_jewelry = -10,
							lions = -10,
							giraffes = -10,
							frankincense_seedlings = -10,
							dancing_dwarf = -10,
							cinnamon_plants = -10,
							baboons = -10,
						},
					},
					buying = {
						items = {
							{ "delta_wheat" },
							{ "cedar_timber" },
							{ "bronze_ingots" },
							{ "stone_statues_small" },
							{ "bronze_statues_small" },
						},
						trade_value_change = {
							delta_wheat = 5,
							cedar_timber = 5,
							bronze_ingots = 5,
							stone_statues_small = 5,
							bronze_statues_small = 5,
							gold_ore = -5,
							copper_ore = -5,
							ebony_logs = -10,
							obsidian_tools = -10,
							myrrh_seedlings = -10,
							malachite_jewelry = -10,
							lions = -10,
							giraffes = -10,
							frankincense_seedlings = -10,
							dancing_dwarf = -10,
							cinnamon_plants = -10,
							baboons = -10,
						},
					},
				},
				{ --Punt 3 - more ore
					offering = {
						items = {
							{ "gold_ore", 6 },
							{ "copper_ore", 6 },
							{ "ebony_logs", 4 },
							{ "obsidian_tools", 1 },
							{ "myrrh_seedlings", 2 },
							{ "malachite_jewelry", 6 },
							{ "lions", 5 },
							{ "giraffes", 5 },
							{ "frankincense_seedlings", 2 },
							{ "dancing_dwarf", 1 },
							{ "cinnamon_plants", 8 },
							{ "baboons", 3 },
						},
						trade_value_change = {
							gold_ore = -5,
							copper_ore = -5,
							ebony_logs = -10,
							obsidian_tools = -10,
							myrrh_seedlings = -10,
							malachite_jewelry = -10,
							lions = -10,
							giraffes = -10,
							frankincense_seedlings = -10,
							dancing_dwarf = -10,
							cinnamon_plants = -10,
							baboons = -10,
						},
					},
					buying = {
						items = {
							{ "delta_wheat" },
							{ "cedar_timber" },
							{ "bronze_ingots" },
							{ "stone_statues_small" },
							{ "bronze_statues_small" },
						},
						trade_value_change = {
							delta_wheat = 5,
							cedar_timber = 5,
							bronze_ingots = 5,
							stone_statues_small = 5,
							bronze_statues_small = 5,
							gold_ore = -5,
							copper_ore = -5,
							ebony_logs = -10,
							obsidian_tools = -10,
							myrrh_seedlings = -10,
							malachite_jewelry = -10,
							lions = -10,
							giraffes = -10,
							frankincense_seedlings = -10,
							dancing_dwarf = -10,
							cinnamon_plants = -10,
							baboons = -10,
						},
					},
				},
			},
		},
		aegean_achaea_realm = {
			bazaar_strings = {
				good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_4_all_purpose",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_green_1_achaea",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_green_2_achaea",
				},
				not_good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_4_all_purpose",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_almost_green_1_achaea",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_almost_green_2_achaea",
 				},
				bad_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_4_all_purpose",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_in_red_1_achaea",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_in_red_2_achaea",
				},
			},
			unlock = "",
			localised_name = "random_localisation_strings_string_aegean_achaea_realm",
			num_items_to_show = 5,
			item_bundles = {
				{ --Achaea 1 - good stone, poor food
					offering = {
						items = {
							{ "olive_amphoras", 3 },
							{ "figs", 2 },
							{ "stone_blocks", 6 },
							{ "olive_oil_jars", 2 },
							{ "marble_statues", 5 },
							{ "wine_jars", 2 },
							{ "minoan_bronzework", 1 },
							{ "aegean_fishermen", 2 },
							{ "theban_veteran", 1 },
							{ "theban_veteran_unique", 1 },
							{ "ornate_lyre", 1 },							
							{ "minoan_pottery", 1 },
							{ "embroidered_kithon", 1 },
						},
						trade_value_change = {
							olive_amphoras = -5,
							stone_blocks = -5,
							wine_jars = -10,
							minoan_bronzework = -10,
							minoan_pottery = -10,
							marble_statues = -5,
							aegean_fishermen = -10,
							theban_veteran = -10,
							theban_veteran_unique = -10,
							ornate_lyre = -10,
							embroidered_kithon =  -5,
							figs = -5,							
							olive_oil_jars = -5,
						},
					},
					buying = {
						items = {
							{ "egyptian_beer" },
							{ "granite_blocks" },
							{ "bronze_statues_small" },
							{ "heavy_ropes" },
							{ "gold_ore" },
						},
						trade_value_change = {
							egyptian_beer = 5,
							granite_blocks = 5,
							bronze_statues_small = 5,
							heavy_ropes = 5,
							gold_ore = 5,
							olive_amphoras = -5,
							stone_blocks = -5,
							wine_jars = -10,
							minoan_bronzework = -10,
							minoan_pottery = -10,
							marble_statues = -5,
							aegean_fishermen = -10,
							theban_veteran = -10,
							theban_veteran_unique = -10,
							ornate_lyre = -10,
							embroidered_kithon =  -5,
							figs = -5,							
							olive_oil_jars = -5,
						},
					},
				},
				{ --Achaea 2 - Good Food, poor stone
					offering = {
						items = {
							{ "olive_amphoras", 7 },
							{ "figs", 4 },
							{ "stone_blocks", 2 },
							{ "olive_oil_jars", 4 },
							{ "marble_statues", 2 },
							{ "wine_jars", 4 },
							{ "minoan_bronzework", 2 },
							{ "aegean_fishermen", 3 },
							{ "theban_veteran", 2 },
							{ "theban_veteran_unique", 0 },
							{ "ornate_lyre", 2 },							
							{ "minoan_pottery", 2 },
							{ "embroidered_kithon", 2 },
						},
						trade_value_change = {
							olive_amphoras = -5,
							stone_blocks = -5,
							wine_jars = -10,
							minoan_bronzework = -10,
							minoan_pottery = -10,
							marble_statues = -5,
							aegean_fishermen = -10,
							theban_veteran = -10,
							theban_veteran_unique = -10,
							ornate_lyre = -10,
							embroidered_kithon =  -5,
							figs = -5,							
							olive_oil_jars = -5,
						},
					},
					buying = {
						items = {
							{ "egyptian_beer" },
							{ "granite_blocks" },
							{ "bronze_statues_small" },
							{ "heavy_ropes" },
							{ "gold_ore" },
						},
						trade_value_change = {
							egyptian_beer = 5,
							granite_blocks = 5,
							bronze_statues_small = 5,
							heavy_ropes = 5,
							gold_ore = 5,
							olive_amphoras = -5,
							stone_blocks = -5,
							wine_jars = -10,
							minoan_bronzework = -10,
							minoan_pottery = -10,
							marble_statues = -5,
							aegean_fishermen = -10,
							theban_veteran = -10,
							theban_veteran_unique = -10,
							ornate_lyre = -10,
							embroidered_kithon =  -5,
							figs = -5,							
							olive_oil_jars = -5,
						},
					},
				},
				{ --Achaea 3 - poor food and bronze, good other stuff
					offering = {
						items = {
							{ "olive_amphoras", 3 },
							{ "figs", 2 },
							{ "stone_blocks", 4 },
							{ "olive_oil_jars", 2 },
							{ "marble_statues", 2 },
							{ "wine_jars", 2 },
							{ "minoan_bronzework", 5 },
							{ "aegean_fishermen", 1 },
							{ "theban_veteran", 1 },
							{ "theban_veteran_unique", 0 },
							{ "ornate_lyre", 5 },							
							{ "minoan_pottery", 4 },
							{ "embroidered_kithon", 3 },
						},
						trade_value_change = {
							olive_amphoras = -5,
							stone_blocks = -5,
							wine_jars = -10,
							minoan_bronzework = -10,
							minoan_pottery = -10,
							marble_statues = -5,
							aegean_fishermen = -10,
							theban_veteran = -10,
							theban_veteran_unique = -10,
							ornate_lyre = -10,
							embroidered_kithon =  -5,
							figs = -5,							
							olive_oil_jars = -5,
						},
					},
					buying = {
						items = {
							{ "egyptian_beer" },
							{ "granite_blocks" },
							{ "bronze_statues_small" },
							{ "heavy_ropes" },
							{ "gold_ore" },
						},
						trade_value_change = {
							egyptian_beer = 5,
							granite_blocks = 5,
							bronze_statues_small = 5,
							heavy_ropes = 5,
							gold_ore = 5,
							olive_amphoras = -5,
							stone_blocks = -5,
							wine_jars = -10,
							minoan_bronzework = -10,
							minoan_pottery = -10,
							marble_statues = -5,
							aegean_fishermen = -10,
							theban_veteran = -10,
							theban_veteran_unique = -10,
							ornate_lyre = -10,
							embroidered_kithon =  -5,
							figs = -5,							
							olive_oil_jars = -5,
						},
					},
				},
			},
		},
		aegean_assuwa_realm = {
			bazaar_strings = {
				good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_4_all_purpose",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_green_1_assuwa",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_green_2_assuwa",
				},
				not_good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_4_all_purpose",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_almost_green_1_assuwa",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_almost_green_2_assuwa",
 				},
				bad_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_4_all_purpose",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_in_red_1_assuwa",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_in_red_2_assuwa",
				},
			},
			unlock = "",
			localised_name = "random_localisation_strings_string_aegean_assuwa_realm",
			num_items_to_show = 5,
			item_bundles = {
				{ --Assuwa 1 - good food
					offering = {
						items = {
							{ "dried_fish", 8 },
							{ "assuwan_jewelry", 1 },
							{ "cedar_chariots", 1 },
							{ "fine_chlamys", 1 },
							{ "bronze_statues_small", 2 },
							{ "aegean_fishermen", 5 },
							{ "ornate_lyre", 1 },
							{ "aegean_fishermen_unique", 1 },
							{ "cedar_boats", 2 },
							{ "leopards", 3 },
							{ "cedar_timber", 2 },							
						},
						trade_value_change = {
							dried_fish = -5,
							assuwan_jewelry = -5,
							cedar_chariots = -10,
							fine_chlamys = -5,
							bronze_statues_small = -5,
							aegean_fishermen = -10,
							ornate_lyre = -10,
							aegean_fishermen_unique = -10,
							cedar_boats = -10,
							leopards = -10,
							cedar_timber =  -10,
						},
					},
					buying = {
						items = {
							{ "egypt_acacia_timber" },
							{ "bear_furs" },
							{ "gold_statuettes" },
							{ "figs" },
							{ "cedarwood_oil" },
						},
						trade_value_change = {
							egypt_acacia_timber = 5,
							bear_furs = 5,
							gold_statuettes = 5,
							figs = 5,
							cedarwood_oil = 5,
							dried_fish = -5,
							assuwan_jewelry = -5,
							cedar_chariots = -10,
							fine_chlamys = -5,
							bronze_statues_small = -5,
							aegean_fishermen = -10,
							ornate_lyre = -10,
							aegean_fishermen_unique = -10,
							cedar_boats = -10,
							leopards = -10,
							cedar_timber =  -10,
						},
					},
				},
				{ --Assuwa 2 - Good wood
					offering = {
						items = {
							{ "dried_fish", 2 },
							{ "assuwan_jewelry", 3 },
							{ "cedar_chariots", 6 },
							{ "fine_chlamys", 2 },
							{ "bronze_statues_small", 2 },
							{ "aegean_fishermen", 2 },
							{ "ornate_lyre", 1 },
							{ "aegean_fishermen_unique", 0 },
							{ "cedar_boats", 4 },
							{ "leopards", 0 },
							{ "cedar_timber", 5 },							
						},
						trade_value_change = {
							dried_fish = -5,
							assuwan_jewelry = -5,
							cedar_chariots = -10,
							fine_chlamys = -5,
							bronze_statues_small = -5,
							aegean_fishermen = -10,
							ornate_lyre = -10,
							aegean_fishermen_unique = -10,
							cedar_boats = -10,
							leopards = -10,
							cedar_timber =  -10,
						},
					},
					buying = {
						items = {
							{ "egypt_acacia_timber" },
							{ "bear_furs" },
							{ "gold_statuettes" },
							{ "figs" },
							{ "cedarwood_oil" },
						},
						trade_value_change = {
							egypt_acacia_timber = 5,
							bear_furs = 5,
							gold_statuettes = 5,
							figs = 5,
							cedarwood_oil = 5,
							dried_fish = -5,
							assuwan_jewelry = -5,
							cedar_chariots = -10,
							fine_chlamys = -5,
							bronze_statues_small = -5,
							aegean_fishermen = -10,
							ornate_lyre = -10,
							aegean_fishermen_unique = -10,
							cedar_boats = -10,
							leopards = -10,
							cedar_timber =  -10,
						},
					},
				},
				{ --Assuwa 3 - Good Gold and Bronze
					offering = {
						items = {
							{ "dried_fish", 2 },
							{ "assuwan_jewelry", 6 },
							{ "cedar_chariots", 2 },
							{ "fine_chlamys", 4 },
							{ "bronze_statues_small", 8 },
							{ "aegean_fishermen", 2 },
							{ "ornate_lyre", 5 },
							{ "aegean_fishermen_unique", 0 },
							{ "cedar_boats", 3 },
							{ "leopards", 2 },
							{ "cedar_timber", 3 },							
						},
						trade_value_change = {
							dried_fish = -5,
							assuwan_jewelry = -5,
							cedar_chariots = -10,
							fine_chlamys = -5,
							bronze_statues_small = -5,
							aegean_fishermen = -10,
							ornate_lyre = -10,
							aegean_fishermen_unique = -10,
							cedar_boats = -10,
							leopards = -10,
							cedar_timber =  -10,
						},
					},
					buying = {
						items = {
							{ "egypt_acacia_timber" },
							{ "bear_furs" },
							{ "gold_statuettes" },
							{ "figs" },
							{ "cedarwood_oil" },
						},
						trade_value_change = {
							egypt_acacia_timber = 5,
							bear_furs = 5,
							gold_statuettes = 5,
							figs = 5,
							cedarwood_oil = 5,
							dried_fish = -5,
							assuwan_jewelry = -5,
							cedar_chariots = -10,
							fine_chlamys = -5,
							bronze_statues_small = -5,
							aegean_fishermen = -10,
							ornate_lyre = -10,
							aegean_fishermen_unique = -10,
							cedar_boats = -10,
							leopards = -10,
							cedar_timber =  -10,
						},
					},
				},
			},
		},
		aegean_thrace_realm = {
			bazaar_strings = {
				good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_4_all_purpose",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_green_1_thrace",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_green_2_thrace",
				},
				not_good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_4_all_purpose",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_almost_green_1_thrace",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_almost_green_2_thrace",
 				},
				bad_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_4_all_purpose",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_in_red_1_thrace",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_in_red_2_thrace",
				},
			},
			unlock = "",
			localised_name = "random_localisation_strings_string_aegean_thrace_realm",
			num_items_to_show = 5,
			item_bundles = {
				{ -- Thrace 1 good food
					offering = {
						items = {
							{ "salted_game", 7 },
							{ "pine_logs", 2 },
							{ "wine_jars", 5 },
							{ "hunters_haul", 3 },
							{ "bear_furs", 1 },
							{ "gold_ore", 0 },
							{ "thracian_syrinx", 1 },
							{ "thracian_horn", 4 },
							{ "thracian_bracelets", 0 },
							{ "thracian_forresters", 3 },
							{ "thracian_forresters_unique", 1 },						
						},
						trade_value_change = {
							salted_game = -5,
							pine_logs = -10,
							wine_jars = -10,
							hunters_haul = -5,
							gold_ore = -5,
							bear_furs = -5,
							thracian_syrinx = -10,
							thracian_horn = -10,
							thracian_bracelets = -10,
							thracian_forresters = -10,
							thracian_forresters_unique = -10,
						},
					},
					buying = {
						items = {
							{ "ornate_lyre" },
							{ "bags_of_sesame" },
							{ "marshland_wheat" },
							{ "delta_wheat" },
							{ "stone_statues_small" },
						},
						trade_value_change = {
							ornate_lyre = 5,
							bags_of_sesame = 5,
							marshland_wheat = 5,
							delta_wheat = 5,
							stone_statues_small = 5,
							salted_game = -5,
							pine_logs = -10,
							wine_jars = -10,
							hunters_haul = -5,
							bear_furs = -5,
							gold_ore = -5,
							thracian_syrinx = -10,
							thracian_horn = -10,
							thracian_bracelets = -10,
							thracian_forresters = -10,
							thracian_forresters_unique = -10,
						},
					},
				},
				{ --Thrace 2 - Good Gold
					offering = {
						items = {
							{ "salted_game", 2 },
							{ "pine_logs", 3 },
							{ "wine_jars", 2 },
							{ "hunters_haul", 2 },
							{ "bear_furs", 2 },
							{ "gold_ore", 6 },
							{ "thracian_syrinx", 4 },
							{ "thracian_horn", 2 },
							{ "thracian_bracelets", 5 },
							{ "thracian_forresters", 4 },
							{ "thracian_forresters_unique", 0 },						
						},
						trade_value_change = {
							salted_game = -5,
							pine_logs = -10,
							wine_jars = -10,
							hunters_haul = -5,
							bear_furs = -5,
							gold_ore = -5,
							thracian_syrinx = -10,
							thracian_horn = -10,
							thracian_bracelets = -10,
							thracian_forresters = -10,
							thracian_forresters_unique = -10,
						},
					},
					buying = {
						items = {
							{ "ornate_lyre" },
							{ "bags_of_sesame" },
							{ "marshland_wheat" },
							{ "delta_wheat" },
							{ "stone_statues_small" },
						},
						trade_value_change = {
							ornate_lyre = 5,
							bags_of_sesame = 5,
							marshland_wheat = 5,
							delta_wheat = 5,
							stone_statues_small = 5,
							salted_game = -5,
							pine_logs = -10,
							wine_jars = -10,
							hunters_haul = -5,
							bear_furs = -5,
							gold_ore = -5,
							thracian_syrinx = -10,
							thracian_horn = -10,
							thracian_bracelets = -10,
							thracian_forresters = -10,
							thracian_forresters_unique = -10,
						},
					},
				},
				{ --Thrace 3 - Good Items
					offering = {
						items = {
							{ "salted_game", 2 },
							{ "pine_logs", 3 },
							{ "wine_jars", 2 },
							{ "hunters_haul", 1 },
							{ "bear_furs", 6 },
							{ "gold_ore", 7 },
							{ "thracian_syrinx", 4 },
							{ "thracian_horn", 2 },
							{ "thracian_bracelets", 3 },
							{ "thracian_forresters", 3 },
							{ "thracian_forresters_unique", 1 },						
						},
						trade_value_change = {
							salted_game = -5,
							pine_logs = -10,
							wine_jars = -10,
							hunters_haul = -5,
							bear_furs = -5,
							gold_ore = -5,
							thracian_syrinx = -10,
							thracian_horn = -10,
							thracian_bracelets = -10,
							thracian_forresters = -10,
							thracian_forresters_unique = -10,
						},
					},
					buying = {
						items = {
							{ "ornate_lyre" },
							{ "bags_of_sesame" },
							{ "marshland_wheat" },
							{ "delta_wheat" },
							{ "stone_statues_small" },
						},
						trade_value_change = {
							ornate_lyre = 5,
							bags_of_sesame = 5,
							marshland_wheat = 5,
							delta_wheat = 5,
							stone_statues_small = 5,
							salted_game = -5,
							pine_logs = -10,
							wine_jars = -10,
							hunters_haul = -5,
							bear_furs = -5,
							gold_ore = -5,
							thracian_syrinx = -10,
							thracian_horn = -10,
							thracian_bracelets = -10,
							thracian_forresters = -10,
							thracian_forresters_unique = -10,
						},
					},
				},
			},
		},
		mesopotamia_aber_nahra_realm = {
			bazaar_strings = {
				good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_4_all_purpose",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_green_1_aber_nahra",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_green_2_aber_nahra",
				},
				not_good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_4_all_purpose",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_almost_green_1_aber_nahra",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_almost_green_2_aber_nahra",
 				},
				bad_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_4_all_purpose",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_in_red_1_aber_nahra",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_in_red_2_aber_nahra",
				},
			},
			unlock = "",
			localised_name = "random_localisation_strings_string_mesopotamia_aber_nahra_realm",
			num_items_to_show = 5,
			item_bundles = {
				{ -- Aber Nahra 1 good Gold
					offering = {
						items = {
							{ "gold_ore", 8 },
							{ "stone_idols", 2 },
							{ "figs", 3 },
							{ "copper_ore", 5 },
							{ "granite_blocks", 2 },
							{ "dagger_celestial_iron", 2 },
							{ "miner_hammer", 3 },
							{ "ahlamu_scout", 2 },
							{ "ahlamu_scout_unique", 0 },
							{ "camels", 2 },					
						},
						trade_value_change = {
							gold_ore = -5,
							stone_idols = -5,
							figs = -5,
							copper_ore = -5,
							granite_blocks = -10,
							dagger_celestial_iron = -10,
							miner_hammer = -5,
							ahlamu_scout = -10,
							ahlamu_scout_unique = -10,
							camels = -10,
						},
					},
					buying = {
						items = {
							{ "pine_logs" },
							{ "thracian_bracelets" },
							{ "canaan_beer" },
							{ "cylinder_seal" },
							{ "assyrian_veils" },
						},
						trade_value_change = {
							pine_logs = 5,
							thracian_bracelets = 5,
							canaan_beer = 5,
							cylinder_seal = 5,
							assyrian_veils = 5,
							gold_ore = -5,
							stone_idols = -5,
							figs = -5,
							copper_ore = -5,
							granite_blocks = -10,
							dagger_celestial_iron = -10,
							miner_hammer = -5,
							ahlamu_scout = -10,
							ahlamu_scout_unique = -10,
							camels = -10,
						},
					},
				},
				{ --Aber Nahra 2 - Good Food
					offering = {
						items = {
							{ "gold_ore", 2 },
							{ "stone_idols", 1 },
							{ "figs", 6 },
							{ "copper_ore", 2 },
							{ "granite_blocks", 1 },
							{ "dagger_celestial_iron", 0 },
							{ "miner_hammer", 1 },
							{ "ahlamu_scout", 2 },
							{ "ahlamu_scout_unique", 1 },
							{ "camels", 5 },					
						},
						trade_value_change = {
							gold_ore = -5,
							stone_idols = -5,
							figs = -5,
							copper_ore = -5,
							granite_blocks = -10,
							dagger_celestial_iron = -10,
							miner_hammer = -5,
							ahlamu_scout = -10,
							ahlamu_scout_unique = -10,
							camels = -10,
						},
					},
					buying = {
						items = {
							{ "pine_logs" },
							{ "thracian_bracelets" },
							{ "canaan_beer" },
							{ "cylinder_seal" },
							{ "assyrian_veils" },
						},
						trade_value_change = {
							pine_logs = 5,
							thracian_bracelets = 5,
							canaan_beer = 5,
							cylinder_seal = 5,
							assyrian_veils = 5,
							gold_ore = -5,
							stone_idols = -5,
							figs = -5,
							copper_ore = -5,
							granite_blocks = -10,
							dagger_celestial_iron = -10,
							miner_hammer = -5,
							ahlamu_scout = -10,
							ahlamu_scout_unique = -10,
							camels = -10,
						},
					},
				},
				{ --Aber Nahra 3 - Good Stone and Bronze
					offering = {
						items = {
							{ "gold_ore", 2 },
							{ "stone_idols", 8 },
							{ "figs", 3 },
							{ "copper_ore", 7 },
							{ "granite_blocks", 6 },
							{ "dagger_celestial_iron", 2 },
							{ "miner_hammer", 2 },
							{ "ahlamu_scout", 2 },
							{ "ahlamu_scout_unique", 0 },
							{ "camels", 3 },						
						},
						trade_value_change = {
							gold_ore = -5,
							stone_idols = -5,
							figs = -5,
							copper_ore = -5,
							granite_blocks = -10,
							dagger_celestial_iron = -10,
							miner_hammer = -5,
							ahlamu_scout = -10,
							ahlamu_scout_unique = -10,
							camels = -10,
						},
					},
					buying = {
						items = {
							{ "pine_logs" },
							{ "thracian_bracelets" },
							{ "canaan_beer" },
							{ "cylinder_seal" },
							{ "assyrian_veils" },
						},
						trade_value_change = {
							pine_logs = 5,
							thracian_bracelets = 5,
							canaan_beer = 5,
							cylinder_seal = 5,
							assyrian_veils = 5,
							gold_ore = -5,
							stone_idols = -5,
							figs = -5,
							copper_ore = -5,
							granite_blocks = -10,
							dagger_celestial_iron = -10,
							miner_hammer = -5,
							ahlamu_scout = -10,
							ahlamu_scout_unique = -10,
							camels = -10,
						},
					},
				},
			},
		},
		mesopotamia_mat_assur_realm = {
			bazaar_strings = {
				good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_4_all_purpose",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_green_1_mat_assur",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_green_2_mat_assur",
				},
				not_good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_4_all_purpose",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_almost_green_1_mat_assur",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_almost_green_2_mat_assur",
 				},
				bad_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_4_all_purpose",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_in_red_1_mat_assur",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_in_red_2_mat_assur",
				},
			},
			unlock = "",
			localised_name = "random_localisation_strings_string_mesopotamia_mat_assur_realm",
			num_items_to_show = 5,
			item_bundles = {
				{ -- Mat-Assur 1 good Bronze
					offering = {
						items = {
							{ "assyrian_barley", 2 },
							{ "bronze_ingots", 7 },
							{ "assyrian_bronzework", 6 },
							{ "assyrian_veils", 2 },
							{ "alabaster_figurines", 1 },
							{ "assyrian_mercenary", 1 },
							{ "lamasu_statue_big", 2 },
							{ "assyrian_mercenary_unique", 0 },
							{ "assyrian_mason", 1 },
							{ "assyrian_builders", 1 },
							{ "assyrian_builders_unique", 0 },					
						},
						trade_value_change = {
							assyrian_barley = -5,
							bronze_ingots = -10,
							assyrian_bronzework = -10,
							assyrian_veils = -5,
							alabaster_figurines = -10,
							assyrian_mercenary = -10,
							lamasu_statue_big = -10,
							assyrian_mercenary_unique = -5,
							assyrian_mason = -10,
							assyrian_builders = -10,
							assyrian_builders_unique = -10,
						},
					},
					buying = {
						items = {
							{ "stone_idols" },
							{ "marshland_wheat" },
							{ "poplar_logs" },
							{ "elamite_pottery" },
							{ "bronze_statues_small" },
						},
						trade_value_change = {
							stone_idols = 5,
							marshland_wheat = 5,
							poplar_logs = 5,
							elamite_pottery = 5,
							bronze_statues_small = 5,
							assyrian_barley = -5,
							bronze_ingots = -10,
							assyrian_veils = -5,
							alabaster_figurines = -10,
							assyrian_bronzework = -10,
							assyrian_mercenary = -10,
							lamasu_statue_big = -10,
							assyrian_mason = -10,
							assyrian_mercenary_unique = -10,
							assyrian_builders = -10,
							assyrian_builders_unique = -10,
						},
					},
				},
				{ --Mat-Assur 2 - Good Gold
					offering = {
						items = {
							{ "assyrian_barley", 3 },
							{ "bronze_ingots", 4 },
							{ "assyrian_bronzework", 2 },
							{ "assyrian_veils", 2 },
							{ "alabaster_figurines", 8 },
							{ "assyrian_mercenary", 2 },
							{ "lamasu_statue_big", 5 },
							{ "assyrian_mercenary_unique", 0 },
							{ "assyrian_mason", 3 },
							{ "assyrian_builders", 2 },
							{ "assyrian_builders_unique", 1 },							
						},
						trade_value_change = {
							assyrian_barley = -5,
							bronze_ingots = -10,
							assyrian_bronzework = -10,
							assyrian_veils = -5,
							alabaster_figurines = -10,
							assyrian_mercenary = -10,
							lamasu_statue_big = -10,
							assyrian_mercenary_unique = -5,
							assyrian_mason = -10,
							assyrian_builders = -10,
							assyrian_builders_unique = -10,
						},
					},
					buying = {
						items = {
							{ "stone_idols" },
							{ "marshland_wheat" },
							{ "poplar_logs" },
							{ "elamite_pottery" },
							{ "bronze_statues_small" },
						},
						trade_value_change = {
							stone_idols = 5,
							marshland_wheat = 5,
							poplar_logs = 5,
							elamite_pottery = 5,
							bronze_statues_small = 5,
							assyrian_barley = -5,
							bronze_ingots = -10,
							assyrian_veils = -5,
							alabaster_figurines = -10,
							assyrian_bronzework = -10,
							assyrian_mercenary = -10,
							lamasu_statue_big = -10,
							assyrian_mason = -10,
							assyrian_mercenary_unique = -10,
							assyrian_builders = -10,
							assyrian_builders_unique = -10,
						},
					},
				},
				{ --Mat-Assur 3 - Good Items
					offering = {
						items = {
							{ "assyrian_barley", 5 },
							{ "bronze_ingots", 2 },
							{ "assyrian_bronzework", 4 },
							{ "assyrian_veils", 8 },
							{ "alabaster_figurines", 4 },
							{ "assyrian_mercenary", 2 },
							{ "lamasu_statue_big", 7 },
							{ "assyrian_mercenary_unique", 1 },
							{ "assyrian_mason", 3 },
							{ "assyrian_builders", 4 },
							{ "assyrian_builders_unique", 1 },								
						},
						trade_value_change = {
							assyrian_barley = -5,
							bronze_ingots = -10,
							assyrian_bronzework = -10,
							assyrian_veils = -5,
							alabaster_figurines = -10,
							assyrian_mercenary = -10,
							lamasu_statue_big = -10,
							assyrian_mercenary_unique = -5,
							assyrian_mason = -10,
							assyrian_builders = -10,
							assyrian_builders_unique = -10,
						},
					},
					buying = {
						items = {
							{ "stone_idols" },
							{ "marshland_wheat" },
							{ "poplar_logs" },
							{ "elamite_pottery" },
							{ "bronze_statues_small" },
						},
						trade_value_change = {
							stone_idols = 5,
							marshland_wheat = 5,
							poplar_logs = 5,
							elamite_pottery = 5,
							bronze_statues_small = 5,
							assyrian_barley = -5,
							bronze_ingots = -10,
							assyrian_veils = -5,
							alabaster_figurines = -10,
							assyrian_bronzework = -10,
							assyrian_mercenary = -10,
							lamasu_statue_big = -10,
							assyrian_mason = -10,
							assyrian_mercenary_unique = -10,
							assyrian_builders = -10,
							assyrian_builders_unique = -10,
						},
					},
				},
			},
		},
		mesopotamia_zagros_realm = {
			bazaar_strings = {
				good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_4_all_purpose",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_green_1_zagros",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_green_2_zagros",
				},
				not_good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_4_all_purpose",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_almost_green_1_zagros",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_almost_green_2_zagros",
 				},
				bad_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_4_all_purpose",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_in_red_1_zagros",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_in_red_2_zagros",
				},
			},
			unlock = "",
			localised_name = "random_localisation_strings_string_mesopotamia_zagros_realm",
			num_items_to_show = 5,
			item_bundles = {
				{ -- Zagros 1 good food
					offering = {
						items = {
							{ "stone_blocks", 3 },
							{ "salted_game", 7 },
							{ "cattle_herd", 5 },
							{ "bronze_ingots", 2 },
							{ "bronze_statues_small", 1 },
							{ "ceremonial_sword", 3 },
							{ "miner_hammer", 1 },
							{ "bags_of_sesame", 7 },
							{ "sacrificial_cauldron", 1 },
							{ "urartu_craftsmen", 1 },
							{ "urartu_craftsmen_unique", 0 },						
						},
						trade_value_change = {
							stone_blocks = -5,
							salted_game = -5,
							cattle_herd = -5,
							bronze_ingots = -10,
							bronze_statues_small = -5,
							ceremonial_sword = -10,
							miner_hammer = -5,
							bags_of_sesame = -10,
							sacrificial_cauldron = -5,
							urartu_craftsmen = -10,
							urartu_craftsmen_unique = -10,
						},
					},
					buying = {
						items = {
							{ "dried_fish" },
							{ "olive_amphoras" },
							{ "marshland_wheat" },
							{ "stone_idols" },
							{ "bear_furs" },
						},
						trade_value_change = {
							dried_fish = 5,
							olive_amphoras = 5,
							bronze_ingots = 5,
							stone_idols = 5,
							bear_furs = 5,
							stone_blocks = -5,
							salted_game = -5,
							cattle_herd = -5,
							bronze_ingots = -10,
							bronze_statues_small = -5,
							ceremonial_sword = -10,
							miner_hammer = -5,
							bags_of_sesame = -10,
							sacrificial_cauldron = -5,
							urartu_craftsmen = -10,
							urartu_craftsmen_unique = -10,
						},
					},
				},
				{ --Zagros 2 - Good Bronze
					offering = {
						items = {
							{ "stone_blocks", 3 },
							{ "salted_game", 2 },
							{ "cattle_herd", 4 },
							{ "bronze_ingots", 8 },
							{ "bronze_statues_small", 8 },
							{ "ceremonial_sword", 6 },
							{ "miner_hammer", 0 },
							{ "bags_of_sesame", 2 },
							{ "sacrificial_cauldron", 5 },
							{ "urartu_craftsmen", 3 },
							{ "urartu_craftsmen_unique", 1 },						
						},
						trade_value_change = {
							stone_blocks = -5,
							salted_game = -5,
							cattle_herd = -5,
							bronze_ingots = -10,
							bronze_statues_small = -5,
							ceremonial_sword = -10,
							miner_hammer = -5,
							bags_of_sesame = -10,
							sacrificial_cauldron = -5,
							urartu_craftsmen = -10,
							urartu_craftsmen_unique = -10,
						},
					},
					buying = {
						items = {
							{ "dried_fish" },
							{ "olive_amphoras" },
							{ "marshland_wheat" },
							{ "stone_idols" },
							{ "bear_furs" },
						},
						trade_value_change = {
							dried_fish = 5,
							olive_amphoras = 5,
							bronze_ingots = 5,
							stone_idols = 5,
							bear_furs = 5,
							stone_blocks = -5,
							salted_game = -5,
							cattle_herd = -5,
							marshland_wheat = -10,
							bronze_statues_small = -5,
							ceremonial_sword = -10,
							miner_hammer = -5,
							bags_of_sesame = -10,
							sacrificial_cauldron = -5,
							urartu_craftsmen = -10,
							urartu_craftsmen_unique = -10,
						},
					},
				},
				{ --Zagros 3 - Good Items
					offering = {
						items = {
							{ "stone_blocks", 7 },
							{ "salted_game", 2 },
							{ "cattle_herd", 4 },
							{ "bronze_ingots", 2 },
							{ "bronze_statues_small", 2 },
							{ "ceremonial_sword", 7 },
							{ "miner_hammer", 8 },
							{ "bags_of_sesame", 1 },
							{ "sacrificial_cauldron", 7 },
							{ "urartu_craftsmen", 0 },
							{ "urartu_craftsmen_unique", 0 },						
						},
						trade_value_change = {
							stone_blocks = -5,
							salted_game = -5,
							cattle_herd = -5,
							bronze_ingots = -10,
							bronze_statues_small = -5,
							ceremonial_sword = -10,
							miner_hammer = -5,
							bags_of_sesame = -10,
							sacrificial_cauldron = -5,
							urartu_craftsmen = -10,
							urartu_craftsmen_unique = -10,
						},
					},
					buying = {
						items = {
							{ "dried_fish" },
							{ "olive_amphoras" },
							{ "marshland_wheat" },
							{ "stone_idols" },
							{ "bear_furs" },
						},
						trade_value_change = {
							dried_fish = 5,
							olive_amphoras = 5,
							marshland_wheat = 5,
							stone_idols = 5,
							bear_furs = 5,
							stone_blocks = -5,
							salted_game = -5,
							cattle_herd = -5,
							bronze_ingots = -10,
							bronze_statues_small = -5,
							ceremonial_sword = -10,
							miner_hammer = -5,
							bags_of_sesame = -10,
							sacrificial_cauldron = -5,
							urartu_craftsmen = -10,
							urartu_craftsmen_unique = -10,
						},
					},
				},
			},
		},
		mesopotamia_mat_tamti_realm = {
			bazaar_strings = {
				good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_4_all_purpose",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_green_1_mat_tamti",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_green_2_mat_tamti",
				},
				not_good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_4_all_purpose",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_almost_green_1_mat_tamti",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_almost_green_2_mat_tamti",
 				},
				bad_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_4_all_purpose",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_in_red_1_mat_tamti",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_in_red_2_mat_tamti",
				},
			},
			unlock = "",
			localised_name = "random_localisation_strings_string_mesopotamia_mat_tamti_realm",
			num_items_to_show = 5,
			item_bundles = {
				{ -- Mat-tamti 1 good Tablets
					offering = {
						items = {
							{ "marshland_wheat", 2 },
							{ "poplar_logs", 3 },
							{ "tablet_farming", 2 },
							{ "cylinder_seal", 2 },
							{ "teracotta_statue", 1 },
							{ "tablet_construction", 2 },
							{ "tablet_healing", 2 },
							{ "tablet_mining", 2 },
							{ "tablet_survival", 2 },
							{ "epic_gilgamesh", 0 },
							{ "healer_babylonian", 0 },
							{ "babylon_merchant_unique", 0 },							
						},
						trade_value_change = {
							marshland_wheat = -5,
							poplar_logs = -5,
							tablet_farming = -10,
							cylinder_seal = -10,
							teracotta_statue = -5,
							tablet_construction = -10,
							tablet_healing = -10,
							tablet_mining = -10,
							tablet_survival = -10,
							epic_gilgamesh = -10,
							healer_babylonian = -10,
							babylon_merchant_unique = -10,
						},
					},
					buying = {
						items = {
							{ "salted_game" },
							{ "bags_of_sesame" },
							{ "olive_oil_jars" },
							{ "fine_chlamys" },
							{ "pine_logs" },
						},
						trade_value_change = {
							salted_game = 5,
							bags_of_sesame = 5,
							olive_oil_jars = 5,
							fine_chlamys = 5,
							pine_logs = 5,
							marshland_wheat = -5,
							poplar_logs = -5,
							tablet_farming = -10,
							cylinder_seal = -10,
							teracotta_statue = -5,
							tablet_construction = -10,
							tablet_healing = -10,
							tablet_mining = -10,
							tablet_survival = -10,
							epic_gilgamesh = -10,
							healer_babylonian = -10,
							babylon_merchant_unique = -10,
						},
					},
				},
				{ --Mat-tamti 2 - Good Followers
					offering = {
						items = {
							{ "marshland_wheat", 6 },
							{ "poplar_logs", 6 },
							{ "tablet_farming", 1 },
							{ "cylinder_seal", 2 },
							{ "teracotta_statue", 3 },
							{ "tablet_construction", 0 },
							{ "tablet_healing", 1 },
							{ "tablet_mining", 0 },
							{ "tablet_survival", 0 },
							{ "epic_gilgamesh", 0 },
							{ "healer_babylonian", 4 },
							{ "babylon_merchant_unique", 1 },						
						},
						trade_value_change = {
							marshland_wheat = -5,
							poplar_logs = -5,
							tablet_farming = -10,
							cylinder_seal = -10,
							teracotta_statue = -5,
							tablet_construction = -10,
							tablet_healing = -10,
							tablet_mining = -10,
							tablet_survival = -10,
							epic_gilgamesh = -10,
							healer_babylonian = -10,
							babylon_merchant_unique = -10,
						},
					},
					buying = {
						items = {
							{ "salted_game" },
							{ "bags_of_sesame" },
							{ "olive_oil_jars" },
							{ "fine_chlamys" },
							{ "pine_logs" },
						},
						trade_value_change = {
							salted_game = 5,
							bags_of_sesame = 5,
							olive_oil_jars = 5,
							fine_chlamys = 5,
							pine_logs = 5,
							marshland_wheat = -5,
							poplar_logs = -5,
							tablet_farming = -10,
							cylinder_seal = -10,
							teracotta_statue = -5,
							tablet_construction = -10,
							tablet_healing = -10,
							tablet_mining = -10,
							tablet_survival = -10,
							epic_gilgamesh = -10,
							healer_babylonian = -10,
							babylon_merchant_unique = -10,
						},
					},
				},
				{ --Mat-tamti 3 - Good Gold
					offering = {
						items = {
							{ "marshland_wheat", 5 },
							{ "poplar_logs", 7 },
							{ "tablet_farming", 1 },
							{ "cylinder_seal", 8 },
							{ "teracotta_statue", 8 },
							{ "tablet_construction", 1 },
							{ "tablet_healing", 1 },
							{ "tablet_mining", 1 },
							{ "tablet_survival", 1 },
							{ "epic_gilgamesh", 1 },
							{ "healer_babylonian", 2 },
							{ "babylon_merchant_unique", 0 },						
						},
						trade_value_change = {
							marshland_wheat = -5,
							poplar_logs = -5,
							tablet_farming = -10,
							cylinder_seal = -10,
							teracotta_statue = -5,
							tablet_construction = -10,
							tablet_healing = -10,
							tablet_mining = -10,
							tablet_survival = -10,
							epic_gilgamesh = -10,
							healer_babylonian = -10,
							babylon_merchant_unique = -10,
						},
					},
					buying = {
						items = {
							{ "salted_game" },
							{ "bags_of_sesame" },
							{ "olive_oil_jars" },
							{ "fine_chlamys" },
							{ "pine_logs" },
						},
						trade_value_change = {
							salted_game = 5,
							bags_of_sesame = 5,
							olive_oil_jars = 5,
							fine_chlamys = 5,
							pine_logs = 5,
							marshland_wheat = -5,
							poplar_logs = -5,
							tablet_farming = -10,
							cylinder_seal = -10,
							teracotta_statue = -5,
							tablet_construction = -10,
							tablet_healing = -10,
							tablet_mining = -10,
							tablet_survival = -10,
							epic_gilgamesh = -10,
							healer_babylonian = -10,
							babylon_merchant_unique = -10,
						},
					},
				},
			},
		},
		mesopotamia_haltamti_realm = {
			bazaar_strings = {
				good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_green_4_all_purpose",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_green_1_haltamti",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_green_2_haltamti",
				},
				not_good_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_almost_green_4_all_purpose",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_almost_green_1_haltamti",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_almost_green_2_haltamti",
 				},
				bad_deal = {
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_3_all_purpose",
					"ui_text_replacements_localised_text_phar_main_al_hatshepsut_deal_in_red_4_all_purpose",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_in_red_1_haltamti",
					"ui_text_replacements_localised_text_phar_map_al_hatshepsut_deal_in_red_2_haltamti",
				},
			},
			unlock = "",
			localised_name = "random_localisation_strings_string_mesopotamia_haltamti_realm",
			num_items_to_show = 5,
			item_bundles = {
				{ -- Elam 1 good Gold
					offering = {
						items = {
							{ "gold_statuettes", 7 },
							{ "marshland_wheat", 2 },
							{ "cylinder_seal", 7 },
							{ "dried_fish", 2 },
							{ "poplar_logs", 1 },
							{ "elamite_jewelry", 5 },
							{ "silver_chalice", 7 },
							{ "granite_stele", 0 },
							{ "elamite_pottery", 0 },
							{ "elamite_goldsmith", 5 },
							{ "elamite_goldsmith_unique", 0 },							
						},
						trade_value_change = {
							gold_statuettes = -5,
							marshland_wheat = -5,
							cylinder_seal = -10,
							dried_fish = -5,
							poplar_logs = -5,
							elamite_jewelry = -10,
							silver_chalice = -10,
							granite_stele = -10,
							elamite_pottery = -5,
							elamite_goldsmith = -10,
							elamite_goldsmith_unique = -10,
						},
					},
					buying = {
						items = {
							{ "olive_amphoras" },
							{ "stone_blocks" },
							{ "bags_of_sesame" },
							{ "copper_ore" },
							{ "assuwan_jewelry" },
						},
						trade_value_change = {
							olive_amphoras = 5,
							stone_blocks = 5,
							bags_of_sesame = 5,
							copper_ore = 5,
							assuwan_jewelry = 5,
							gold_statuettes = -5,
							marshland_wheat = -5,
							cylinder_seal = -10,
							dried_fish = -5,
							poplar_logs = -5,
							elamite_jewelry = -10,
							silver_chalice = -10,
							granite_stele = -10,
							elamite_pottery = -5,
							elamite_goldsmith = -10,
							elamite_goldsmith_unique = -10,
						},
					},
				},
				{ --Elam 2 - Good Food
					offering = {
						items = {
							{ "gold_statuettes", 1 },
							{ "marshland_wheat", 8 },
							{ "cylinder_seal", 1 },
							{ "dried_fish", 8 },
							{ "poplar_logs", 3 },
							{ "elamite_jewelry", 5 },
							{ "silver_chalice", 2 },
							{ "granite_stele", 5 },
							{ "elamite_pottery", 2 },
							{ "elamite_goldsmith", 1 },
							{ "elamite_goldsmith_unique", 1 },						
						},
						trade_value_change = {
							gold_statuettes = -5,
							marshland_wheat = -5,
							cylinder_seal = -10,
							dried_fish = -5,
							poplar_logs = -5,
							elamite_jewelry = -10,
							silver_chalice = -10,
							granite_stele = -10,
							elamite_pottery = -5,
							elamite_goldsmith = -10,
							elamite_goldsmith_unique = -10,
						},
					},
					buying = {
						items = {
							{ "olive_amphoras" },
							{ "stone_blocks" },
							{ "bags_of_sesame" },
							{ "copper_ore" },
							{ "assuwan_jewelry" },
						},
						trade_value_change = {
							olive_amphoras = 5,
							stone_blocks = 5,
							bags_of_sesame = 5,
							copper_ore = 5,
							assuwan_jewelry = 5,
							gold_statuettes = -5,
							marshland_wheat = -5,
							cylinder_seal = -10,
							dried_fish = -5,
							poplar_logs = -5,
							elamite_jewelry = -10,
							silver_chalice = -10,
							granite_stele = -10,
							elamite_pottery = -5,
							elamite_goldsmith = -10,
							elamite_goldsmith_unique = -10,
						},
					},
				},
				{ --Elam 3 - Good Stone and Wood
					offering = {
						items = {
							{ "gold_statuettes", 3 },
							{ "marshland_wheat", 2 },
							{ "cylinder_seal", 8 },
							{ "dried_fish", 3 },
							{ "poplar_logs", 8 },
							{ "elamite_jewelry", 2 },
							{ "silver_chalice", 4 },
							{ "granite_stele", 8 },
							{ "elamite_pottery", 5 },
							{ "elamite_goldsmith", 6 },
							{ "elamite_goldsmith_unique", 0 },						
						},
						trade_value_change = {
							gold_statuettes = -5,
							marshland_wheat = -5,
							cylinder_seal = -10,
							dried_fish = -5,
							poplar_logs = -5,
							elamite_jewelry = -10,
							silver_chalice = -10,
							granite_stele = -10,
							elamite_pottery = -5,
							elamite_goldsmith = -10,
							elamite_goldsmith_unique = -10,
						},
					},
					buying = {
						items = {
							{ "olive_amphoras" },
							{ "stone_blocks" },
							{ "bags_of_sesame" },
							{ "copper_ore" },
							{ "assuwan_jewelry" },
						},
						trade_value_change = {
							olive_amphoras = 5,
							stone_blocks = 5,
							bags_of_sesame = 5,
							copper_ore = 5,
							assuwan_jewelry = 5,
							gold_statuettes = -5,
							marshland_wheat = -5,
							cylinder_seal = -10,
							dried_fish = -5,
							poplar_logs = -5,
							elamite_jewelry = -10,
							silver_chalice = -10,
							granite_stele = -10,
							elamite_pottery = -5,
							elamite_goldsmith = -10,
							elamite_goldsmith_unique = -10,
						},
					},
				},
			},
		},
	},

	ancillaries_as_items = {

		default_trade_value = 25,

		value_overrides = {
			phar_main_rare_31 = 30,
			phar_main_rare_27 = 50,
			phar_main_rare_51 = 50,
			phar_main_rare_47 = 50,
			phar_main_rare_45 = 50,
			phar_main_rare_46 = 50,
			phar_main_rare_40 = 30,
			phar_main_rare_equipment_bows_4 = 30,
			phar_main_rare_20 = 30,
			phar_main_rare_34 = 20,
			phar_main_rare_44 = 30,
			phar_main_rare_equipment_axes_1 = 30,
			phar_main_rare_26 = 40,
			phar_main_rare_equipment_spears_1 = 40,
			phar_main_rare_equipment_swords_2 = 40,
			phar_main_rare_24 = 40,
			phar_main_rare_30 = 40,
			phar_main_rare_43 = 40,
			phar_main_rare_38 = 40,
			phar_main_rare_49 = 50,
			phar_main_common_general_14 = 30,
			phar_main_unique_26 = 50,
			phar_main_rare_5 = 30,
			phar_main_unique_16 = 50,
			phar_main_unique_14 = 50,
			phar_main_unique_15 = 50,
			phar_main_rare_21 = 30,
			phar_main_unique_19 = 50,
			phar_main_rare_36 = 50,
			phar_main_rare_48 = 50,
			phar_main_unique_25 = 50,
			phar_main_unique_23 = 50,
			phar_main_unique_20 = 50,
			phar_main_unique_24 = 50,
			phar_main_rare_2 = 30,
			phar_main_unique_17 = 50,
			phar_main_unique_27 = 50,
			phar_main_rare_6 = 50,
			phar_main_unique_13 = 50,
			phar_main_rare_41 = 40,
			phar_main_rare_4 = 30,
			phar_main_unique_21 = 50,
			phar_main_rare_1 = 30,
			phar_main_rare_32 = 20,
			phar_main_rare_37 = 30,
			phar_main_rare_3 = 50,
			phar_main_unique_18 = 50,
			phar_main_unique_22 = 50,
			phar_main_rare_39 = 30,
			phar_main_rare_50 = 50,
			phar_main_rare_28 = 20,
			phar_main_rare_42 = 30,
			phar_main_rare_29 = 50,
			phar_main_rare_23 = 50,
			phar_main_rare_22 = 50,
			phar_main_rare_33 = 50,
			phar_main_rare_25 = 50,
			phar_main_rare_35 = 30,
		},
	},

	travel_paths = {
		-- 	a = { --realm index 
		-- 	realm = "egyptian_western_desert_realm", -- realm_name(this is the realm key from the tables above)
		-- 	avaliable_destinations = { -- this is the avaliable paths from this node and the distances to them
		-- 		c = 3,
		-- 		e = 3,
		-- 		d = 3,
		-- 		b = 3,
		-- 		f = 3,
		-- 	},
		-- },
		-- NOTE: please note that the graph is double connected. i.e if there is a path from a to b, then there is the same path -> b to a
		western_desert = {
			realm = "egyptian_western_desert_realm",
			avaliable_destinations = {
				lower_egypt = 1,
				upper_egypt = 1,
				kush = 2,
			},
		},

		kush = {
			realm = "egyptian_kush_realm",
			avaliable_destinations = {
				western_desert = 2,

				nubia = 1,
				punt = 2,
			},
		},

		nubia = {
			realm = "egyptian_nubia_realm",
			avaliable_destinations = {
				kush = 1,

				upper_egypt = 1,
				punt = 2,
			},
		},

		upper_egypt = {
			realm = "egyptian_upper_egypt_realm",
			avaliable_destinations = {
				western_desert = 1,
				nubia = 1,
				lower_egypt = 1,

			},
		},

		lower_egypt = {
			realm = "egyptian_lower_egypt_realm",
			avaliable_destinations = {
				western_desert = 1,
				upper_egypt = 1,
				sinai = 1,
			},
		},

		sinai = {
			realm = "canaanite_sinai_realm",
			avaliable_destinations = {
				lower_egypt = 1,

				fenkhu = 1,
			},
		},

		fenkhu = {
			realm = "canaanite_fenkhu_realm",
			avaliable_destinations = {
				sinai = 1,

				retjenu = 1,
				yamhad = 1,
			},
		},

		retjenu = {
			realm = "canaanite_retjenu_realm",
			avaliable_destinations = {
				fenkhu = 1,

				yamhad = 1,
				aber_nahra = 1,
			},
		},

		yamhad = {
			realm = "canaanite_yamhad_realm",
			avaliable_destinations = {
				retjenu = 1,
				fenkhu = 1,

				isuwa = 1,
				aber_nahra = 1,
			},
		},

		isuwa = {
			realm = "hittite_isuwa_realm",
			avaliable_destinations = {
				yamhad = 1,

				highlands = 1,
				lowlands = 1,
				mat_assur = 2,
			},
		},

		lowlands = {
			realm = "hittite_lowlands_realm",
			avaliable_destinations = {
				isuwa = 1,

				highlands = 1,
				assuwa = 1,
			},
		},

		highlands = {
			realm = "hittite_highlands_realm",
			avaliable_destinations = {
				isuwa = 1,
				lowlands = 1,
				assuwa = 2,
			},
		},

		punt = {
			realm = "punt",
			avaliable_destinations = {
				kush = 2,
				nubia = 2,
			},
		},
		assuwa = {
			realm = "aegean_assuwa_realm",
			avaliable_destinations = {
				highlands = 2,
				lowlands = 1,
				thrace = 1,
				achaea = 1,
			},
		},
		thrace = {
			realm = "aegean_thrace_realm",
			avaliable_destinations = {
				assuwa = 1,
				achaea = 1,
			},
		},
		achaea = {
			realm = "aegean_achaea_realm",
			avaliable_destinations = {
				assuwa = 1,
				thrace = 1,
			},
		},
		aber_nahra = {
			realm = "mesopotamia_aber_nahra_realm",
			avaliable_destinations = {
				yamhad = 1,
				retjenu = 1,
				mat_assur = 1,
			},
		},
		mat_assur = {
			realm = "mesopotamia_mat_assur_realm",
			avaliable_destinations = {
				isuwa = 2,
				zagros = 1,
				aber_nahra = 1,
				mat_tamti = 1,
			},
		},
		zagros = {
			realm = "mesopotamia_zagros_realm",
			avaliable_destinations = {
				mat_assur = 1,
				mat_tamti = 1,
			},
		},
		mat_tamti = {
			realm = "mesopotamia_mat_tamti_realm",
			avaliable_destinations = {
				mat_assur = 1,
				haltamti = 1,
				zagros = 1,
			},
		},
		haltamti = {
			realm = "mesopotamia_haltamti_realm",
			avaliable_destinations = {
				mat_tamti = 1,
			},
		},
	},

	ai = {
		expeditions_start_turn = 3,
		expedition_wait_turns = 2,
		dilemma_cooldown = 5,
		dilemma_base_chance = 100,
		dilemma_relations_coeff = 0.8, -- the diplomatic attitude will be multiplied by this and added to the base chance
		dilemmas = {
			"troy_fm_sar_luxury_goods_dilemma_more",
		},

		destinations = {
			egyptian_western_desert_realm = {
				cash_out_resources = {
					{"troy_gold", 20},
					{"troy_food", 20},
				},
				cash_out_bundle = "effect_bundle_fm_paris_fm_helen_happy",
				bundle_regions = {
					"phar_main_memphis_petpeh",
				},
				bundle_duration = 5,
			},

			egyptian_kush_realm = {
				cash_out_resources = {
					{"troy_gold", 20},
					{"troy_food", 20},
				},
				cash_out_bundle = "effect_bundle_fm_paris_fm_helen_happy",
				bundle_regions = {
					"phar_main_memphis_petpeh",
				},
			},

			egyptian_nubia_realm = {
				cash_out_resources = {
					{"troy_gold", 20},
					{"troy_food", 20},
				},
				cash_out_bundle = "effect_bundle_fm_paris_fm_helen_happy",
				bundle_regions = {
					"phar_main_memphis_petpeh",
				},
			},

			egyptian_upper_egypt_realm = {
				cash_out_resources = {
					{"troy_gold", 20},
					{"troy_food", 20},
				},
				cash_out_bundle = "effect_bundle_fm_paris_fm_helen_happy",
				bundle_regions = {
					"phar_main_memphis_petpeh",
				},
			},

			egyptian_lower_egypt_realm = {
				cash_out_resources = {
					{"troy_gold", 20},
					{"troy_food", 20},
				},
				cash_out_bundle = "effect_bundle_fm_paris_fm_helen_happy",
				bundle_regions = {
					"phar_main_memphis_petpeh",
				},
			},

			canaanite_sinai_realm = {
				cash_out_resources = {
					{"troy_gold", 20},
					{"troy_food", 20},
				},
				cash_out_bundle = "effect_bundle_fm_paris_fm_helen_happy",
				bundle_regions = {
					"phar_main_memphis_petpeh",
				},
			},

			canaanite_fenkhu_realm = {
				cash_out_resources = {
					{"troy_gold", 20},
					{"troy_food", 20},
				},
				cash_out_bundle = "effect_bundle_fm_paris_fm_helen_happy",
				bundle_regions = {
					"phar_main_memphis_petpeh",
				},
			},

			canaanite_retjenu_realm = {
				cash_out_resources = {
					{"troy_gold", 20},
					{"troy_food", 20},
				},
				cash_out_bundle = "effect_bundle_fm_paris_fm_helen_happy",
				bundle_regions = {
					"phar_main_memphis_petpeh",
				},
			},

			canaanite_yamhad_realm = {
				cash_out_resources = {
					{"troy_gold", 20},
					{"troy_food", 20},
				},
				cash_out_bundle = "effect_bundle_fm_paris_fm_helen_happy",
				bundle_regions = {
					"phar_main_memphis_petpeh",
				},
			},

			hittite_isuwa_realm = {
				cash_out_resources = {
					{"troy_gold", 20},
					{"troy_food", 20},
				},
				cash_out_bundle = "effect_bundle_fm_paris_fm_helen_happy",
				bundle_regions = {
					"phar_main_memphis_petpeh",
				},
			},

			hittite_lowlands_realm = {
				cash_out_resources = {
					{"troy_gold", 20},
					{"troy_food", 20},
				},
				cash_out_bundle = "effect_bundle_fm_paris_fm_helen_happy",
				bundle_regions = {
					"phar_main_memphis_petpeh",
				},
			},

			hittite_highlands_realm = {
				cash_out_resources = {
					{"troy_gold", 20},
					{"troy_food", 20},
				},
				cash_out_bundle = "effect_bundle_fm_paris_fm_helen_happy",
				bundle_regions = {
					"phar_main_memphis_petpeh",
				},
			},

			punt = {
				cash_out_resources = {
					{"troy_gold", 20},
					{"troy_food", 20},
				},
				cash_out_bundle = "effect_bundle_fm_paris_fm_helen_happy",
				bundle_regions = {
					"phar_main_memphis_petpeh",
				},
			},
		},
	},

	events = {
		node_on_route_reached = {
			title_key = "ui_text_replacements_localised_text_phar_main_ph_al_hatshepsut_node_on_route_reached_title",
			secondary_detail = "ui_text_replacements_localised_text_phar_main_ph_al_hatshepsut_node_on_route_reached_subtitle",
			text = "ui_text_replacements_localised_text_phar_main_ph_al_hatshepsut_node_on_route_reached_desc",
			event_pic_index = 2133,
		},
		add_post_trade_diplomacy = {
			title_key = "ui_text_replacements_localised_text_phar_main_ph_al_hatshepsut_add_post_trade_diplomacy_title",
			secondary_detail = "ui_text_replacements_localised_text_phar_main_ph_al_hatshepsut_add_post_trade_diplomacy_subtitle",
			text = "ui_text_replacements_localised_text_phar_main_ph_al_hatshepsut_add_post_trade_diplomacy_desc",
			event_pic_index = 2134,
		},
		expedition_started_event = {
			event_key = "ancient_legacy_hatshepsut_started",
		},
		expedition_arrived_event = {
			event_key = "ancient_legacy_hatshepsut_arrived",
		},
		expedition_returned_event = {
			event_key = "ancient_legacy_hatshepsut_returned",
		},
	},

	excluded_ancillary_categories_from_trading = {
		crown = true,
		title = true,
		character_skin = true,
		bodyguard_skin = true
	},
}

local dijkstra_state = {
	current = "",
	distance = 0,
	heap_size = 0,
	heap = {},
}

	-- receiving the information about adjacent vertex
local function fill_neighbour_data(neighbour, distance, shortest_path_graph)
	local new_distance = dijkstra_state.distance + distance
	local neighbour_data = shortest_path_graph[neighbour]
	local current_position = nil
	if neighbour_data then
		if new_distance < neighbour_data.total_distance then
			neighbour_data.total_distance = new_distance
			neighbour_data.prev_node = dijkstra_state.current
			current_position = neighbour_data.heap_index
		else
			return
		end
	else
		neighbour_data = {
			total_distance = new_distance,
			prev_node = dijkstra_state.current,
			heap_index = 0
		}
		shortest_path_graph[neighbour] = neighbour_data
		dijkstra_state.heap_size = dijkstra_state.heap_size + 1
		current_position = dijkstra_state.heap_size
	end

	--shift up in the heap
	while current_position > 1 do
		local parent_pos = (current_position - current_position % 2) / 2
		local parent = dijkstra_state.heap[parent_pos]
		local parent_info = shortest_path_graph[parent]
		if new_distance < parent_info.total_distance then
			dijkstra_state.heap[current_position] = parent
			parent_info.heap_index = pos
			current_position = parent_pos
		else
			break
		end
	end
	dijkstra_state.heap[current_position] = neighbour
	neighbour_data.heap_index = current_position
end

local function traverse_graph(shortest_path_graph)
	dijkstra_state.current = dijkstra_state.heap[1] -- go to top of heap

	--remove back
	local parent = dijkstra_state.heap[dijkstra_state.heap_size]
	dijkstra_state.heap[dijkstra_state.heap_size] = nil
	dijkstra_state.heap_size = dijkstra_state.heap_size - 1

	if dijkstra_state.heap_size > 0 then -- while q not empty
		local current_idx = 1
		local last_node_idx = dijkstra_state.heap_size / 2

		while current_idx <= last_node_idx do
			local next_node_idx = current_idx * 2 -- left child
			local next_node = dijkstra_state.heap[next_node_idx]
			local next_node_info = shortest_path_graph[next_node]

			if next_node_idx < dijkstra_state.heap_size then
				local right_child = dijkstra_state.heap[next_node_idx + 1] -- right child
				local right_child_info = shortest_path_graph[right_child]

				if right_child_info.total_distance < next_node_info.total_distance then
					next_node_idx = next_node_idx + 1
					next_node = right_child
					next_node_info = right_child_info
				end
			end

			if next_node_info.total_distance < shortest_path_graph[parent].total_distance then -- compare with back node
				dijkstra_state.heap[current_idx] = next_node
				next_node_info.heap_index = current_idx
				current_idx = next_node_idx
			else
				break -- pick the back node
			end
		end
		dijkstra_state.heap[current_idx] = parent
		shortest_path_graph[parent].heap_index = current_idx
	end

	local current_info = shortest_path_graph[dijkstra_state.current]
	current_info.heap_index = nil
	dijkstra_state.distance = current_info.total_distance

	return dijkstra_state.current
end

local function dijkstra(graph, start, destination)
	dijkstra_state = {
		current = "",
		distance = 0,
		heap_size = 0,
		heap = {},
	}
	local shortest_path_graph = {}
	shortest_path_graph[start] = { total_distance = 0 }

	local current = start
	while current and current ~= destination do
		for adjacent_vertex, edge_length in pairs(graph[current].avaliable_destinations) do
			fill_neighbour_data(adjacent_vertex, edge_length, shortest_path_graph)
		end
		current = traverse_graph(shortest_path_graph)
	end

	if current then
		local full_distance = shortest_path_graph[current].total_distance
		local path = current
		local array_path = {current}
		while current ~= "" do
			current = shortest_path_graph[current].prev_node
			if current then
				path = current.." "..path
				table.insert(array_path, 1, current)
			end
		end
		return full_distance, path, array_path
	else
		script_error("Path not found! start " .. start .. " destination " .. destination)
		return nil, nil, nil
	end
end

ancient_legacies_hatshepsut = {
	config = hatshepsut_config,
	temp = {
		ui = {
			-- holds templates temporarily
		},
		cash_out_data = {
			mre_data = {},
		},
		cart_data = {
			character_ancillaries = {},
			items = {},
		},
		trade_data = {
			our = {items = {}, character_ancillaries = {}},
			merchant = {items = {}, character_ancillaries = {}},
		},
	},
	persistent = {
		faction_capital_realm_new = "", -- used to temporarily store the new realm for a delayed faction realm changed
		faction_capital_realm  = "",
		active_faction = "",
		active_faction_cqi = "",
		trade_cart = {
			items = {
				-- [trade_item] = {
				--     amount = 2,
				--     cash_out_for = "",
				-- }
			},
			ancillary_items = {

			},
		},
		destination_data = {
			egyptian_western_desert_realm = 1,
			egyptian_kush_realm = 1,
			canaanite_sinai_realm = 1,
			canaanite_yamhad_realm = 1,
			egyptian_upper_egypt_realm = 1,
			egyptian_lower_egypt_realm = 1,
			canaanite_retjenu_realm = 1,
			punt = 1,
			canaanite_fenkhu_realm = 1,
			hittite_isuwa_realm = 1,
			hittite_highlands_realm = 1,
			hittite_lowlands_realm = 1,
			egyptian_nubia_realm = 1,
			aegean_assuwa_realm = 1,
			aegean_thrace_realm = 1,
			aegean_achaea_realm = 1,
			mesopotamia_aber_nahra_realm = 1,
			mesopotamia_mat_assur_realm = 1,
			mesopotamia_zagros_realm = 1,
			mesopotamia_mat_tamti_realm = 1,
			mesopotamia_haltamti_realm = 1,
		},
		expedition_start_return_turn = 0,
		expedition_start_turn = 0,
		total_path_duration = 0,
		current_segment_duration = 0,
		turns_spent_traveling = 0,
		return_turns = 0, -- this indicates the return turns (dynamic) to return to capital
		return_distance = 0, -- this indicates the amount of turns required to return from the "current location" to the capital. (static in the sense it does not change each turn)
		path = {},
		selected_destination = "",
		final_destination = "",
		current_location = hatshepsut_config.capital_realm,
		expedition_traveling = false,
		expedition_returning = false,
		expedition_returned_to_cash_out = false,
		expedition_entered_destined_bazaar = false,
		expedition_entered_bazaar_on_route = false,
		new_path_data = {
			ui = {},
		},
		ui = {
			selected_pin = "",
			visited_pins = {
			},
		},
		ai = {
			last_dilemma_turn = 0,
			trigger_data = {

			},
		},
	},

	on_legacy_claimed = function(self, faction_key)
		-- this is placeholder for now, and reachable only by UI
		self.persistent.active_faction = faction_key
		-- set faction realm
		local faction = cm:get_faction(faction_key)
		self.persistent.active_faction_cqi = faction:command_queue_index()

		local capital_realm = nil
		if not faction:home_region():is_null_interface() then
			capital_realm = phar_realms.get_realm_for_region(faction:home_region():name())
		end

		self.persistent.faction_capital_realm = capital_realm
		self.persistent.current_location = self.persistent.faction_capital_realm
		local turns_comp = core:get_ui_root():SequentialFind("fm_phar_hatchepsut_container", "turns_icon")
		if turns_comp then
			turns_comp:SetVisible(false)
		end

		local local_faction = cm:get_local_faction_name(true)
		if (faction_key == local_faction) then
			local has_capital_realm = not is_nil(capital_realm)
			egypt_political_states:activate_button("button_fm_phar_hatchepsut", has_capital_realm)

			cm:override_ui("disable_hatshepsut_fm_button", not has_capital_realm)
		end
 	end,

	find_path = function(self, start, dest)
		output("start : " .. start .. " end " .. dest)
		return dijkstra(self.config.travel_paths, start, dest)
	end,

	get_random_destination_realm = function(self)
		if #phar_realms.realms <= 0 or (#phar_realms.realms == 1 and phar_realms.realms[0].name == self.persistent.faction_capital_realm) then
			script_error("Insufficient number of realms configured")
			return ""
		end
		local capital_index = 0

		for i, realm in ipairs(phar_realms.realms) do
			if realm.name == self.persistent.faction_capital_realm then
				capital_index = i
			end
		end
		local rand = 0
		repeat -- make sure we are not picking our capital
			rand = cm:model():random_int(1, #phar_realms.realms)
		until(rand ~= capital_index and rand ~= 0)
		return phar_realms.realms[rand].name
	end,

	trigger_ai_random_dilemma_with_chance = function(self, player_faction, chance)
		local rand = cm:model():random_int(1, #self.config.ai.dilemmas)
		local dilemma_key = self.config.ai.dilemmas[rand]

		rand = cm:model():random_int(0, 100)
		if rand <= chance then
			self.persistent.ai.last_dilemma_turn = turn_number
			self.persistent.ai.trigger_data[player_faction] = dilemma_key
		end
	end,

	get_child_template = function(self, template, save_key)
		if template then
			self.temp.ui[save_key] = template
			local item_template_parent = UIComponent(self.temp.ui[save_key]:Parent())
			item_template_parent:Divorce(self.temp.ui[save_key]:Address())
			return self.temp.ui[save_key]
		end
		return nil
	end,

	fill_items_from_bundle_to_holder_with_icon_and_name = function(self, holder, template, items, destination_config, realm, name_extenstion)
		holder:DestroyChildren()

		for idx, item_data in ipairs(items) do
			local item = item_data[1]
			if idx <= destination_config.num_items_to_show then
				local entry = UIComponent(holder:CreateFromComponent(template:Address(), item .. name_extenstion))
				if entry then
					local icon = entry:SequentialFind("dy_bonus_icon")
					if icon then
						icon:SetImagePath(self.config.trade_items[item].ui_icon)
					end

					local text = entry:SequentialFind("dy_ancillary_name")
					if text then
						local loc_name = self.config.trade_items[item].display_name
						text:SetText(common.get_localised_string(loc_name), loc_name)
					end
				end
			end
		end
	end,

	fill_capital_pin_tooltip = function(self, panel)
		local capital_pin = panel:SequentialFind("capital_pin")
		local capital_realm_pin = panel:SequentialFind(self.persistent.faction_capital_realm .. "_pin")

		local pin_tooltip = capital_pin:SequentialFind("capital_pin_tooltip")
		if not pin_tooltip then
			capital_pin:InterfaceFunction("set_tooltip_path", "UI/Campaign UI/tooltip_hatshepsut_region.twui.xml")
			pin_tooltip = capital_pin:SequentialFind("capital_pin_tooltip")
		end

		local destination_config = self.config.trade_destinations[self.persistent.faction_capital_realm]

		local realm_plate = capital_realm_pin:SequentialFind("realm_plate")
		local realm_plate_name = capital_realm_pin:SequentialFind("realm_plate", "realm_name")

		local name = pin_tooltip:SequentialFind("title_list", "dy_realm_name")
		if name and realm_plate then
			local loc_name = destination_config.localised_name
			name:SetText(common.get_localised_string(loc_name), loc_name)
			realm_plate:DivorceFromParent()
			capital_pin:Adopt(realm_plate:Address())
			realm_plate:SetVisible(true)
			realm_plate:SetState("selected")
			realm_plate_name:SetState("selected")
		end

		local type_comp = pin_tooltip:SequentialFind("title_list", "dy_type")
		if type_comp then
			type_comp:SetState("capital")
		end

		local current_node = nil
		local capital_node = nil
		for k, v in pairs(self.config.travel_paths) do
			if v.realm == self.persistent.current_location then
				current_node = k
			end
			if v.realm == self.persistent.faction_capital_realm then
				capital_node = k
			end
		end

		local turns_to_reach_comp = pin_tooltip:SequentialFind("turns_template")
		turns_to_reach_comp:SetVisible(false)

		local offerings_list_item = pin_tooltip:SequentialFind("list_categories")
		offerings_list_item:SetVisible(false)

		local turns_to_return = pin_tooltip:SequentialFind("turns_template_capital", "dy_detail_value")
		turns_to_return:SetVisible(capital_node ~= current_node)

		if capital_node ~= current_node then
			local return_distance = self:find_path(current_node, capital_node)
			turns_to_return:SetText(tostring(return_distance))
		end
	end,

	fill_pin_tooltip = function(self, pin_component, pin_realm)
		local pin_tooltip = pin_component:SequentialFind(pin_component:Id().."_tooltip")
		if not pin_tooltip then
			pin_component:InterfaceFunction("set_tooltip_path", "UI/Campaign UI/tooltip_hatshepsut_region.twui.xml")
			pin_tooltip = pin_component:SequentialFind(pin_component:Id().."_tooltip")
		end
		local destination_config = self.config.trade_destinations[pin_realm]
		local name = pin_tooltip:SequentialFind("title_list", "dy_realm_name")
		if name then
			local loc_name = destination_config.localised_name
			name:SetText(common.get_localised_string(loc_name), loc_name)
		end

		local type_comp = pin_tooltip:SequentialFind("title_list", "dy_type")
		if type_comp then
			if realm == self.persistent.faction_capital_realm then
				type_comp:SetState("capital")
			else
				type_comp:SetState("default")
			end
		end

		local start_node = nil
		local destination_node = nil
		local capital_node = nil
		for k, v in pairs(self.config.travel_paths) do
			if v.realm == self.persistent.current_location then
				start_node = k
			end
			if v.realm == self.persistent.faction_capital_realm then
				capital_node = k
			end
			if v.realm == pin_realm then
				destination_node = k
			end
		end

		local turns_to_reach_comp = pin_tooltip:SequentialFind("turns_template")
		turns_to_reach_comp:SetVisible(start_node ~= destination_node and not self.persistent.ui.visited_pins[pin_component:Id()])

		if start_node ~= destination_node then
			local distance = self:find_path(start_node, destination_node)
			local turns_to_reach_comp = pin_tooltip:SequentialFind("turns_template", "dy_detail_value")
			turns_to_reach_comp:SetText(tostring(distance))
			turns_to_reach_comp:SetVisible(not self.persistent.ui.visited_pins[pin_component:Id()])
		end

		if capital_node ~= destination_node then
			local return_distance = self:find_path(destination_node, capital_node)
			local turns_to_return_comp = pin_tooltip:SequentialFind("turns_template_capital", "dy_detail_value")
			turns_to_return_comp:SetText(tostring(return_distance))
			turns_to_return_comp:SetVisible(not self.persistent.ui.visited_pins[pin_component:Id()])
		end

		local destination_config = self.config.trade_destinations[pin_realm]

		local selling_row_item = pin_tooltip:SequentialFind("list_content", "offers", "name_template")
		local offers_holder = UIComponent(selling_row_item:Parent())
		local offer_template = self:get_child_template(selling_row_item, pin_realm .. "_selling_item_row")

		if offer_template and offers_holder then
			local offering_bundle_id = self.persistent.destination_data[pin_realm]
			local offering_bundle = destination_config.item_bundles[offering_bundle_id].offering
			self:fill_items_from_bundle_to_holder_with_icon_and_name(offers_holder, offer_template, offering_bundle.items, destination_config, pin_realm, pin_realm .. "_selling_tooltip")
		end

		local buying_row_item = pin_tooltip:SequentialFind("list_content", "interested_in", "name_template")
		local buying_holder = UIComponent(buying_row_item:Parent())
		local buying_template = self:get_child_template(buying_row_item, pin_realm .. "_buying_item_row")

		if buying_template and buying_holder then
			local buying_bundle_id = self.persistent.destination_data[pin_realm]
			local buying_bundle = destination_config.item_bundles[buying_bundle_id].buying
			self:fill_items_from_bundle_to_holder_with_icon_and_name(buying_holder, buying_template, buying_bundle.items, destination_config, pin_realm, pin_realm .. "_buying_tooltip")
		end
	end,

	update_turns_button_component = function(self)
		local turns_comp = core:get_ui_root():SequentialFind("fm_phar_hatchepsut_container", "turns_icon")
		local notification = core:get_ui_root():SequentialFind("fm_phar_hatchepsut_slot", "holder_alert_icon")

		turns_comp:SetVisible(false)
		notification:SetVisible(true)

		if self.persistent.current_location == self.persistent.selected_destination then
			return
		end

		if self.persistent.expedition_traveling then
			local remain = self.persistent.total_path_duration - (cm:model():turn_number() - self.persistent.expedition_start_turn)
			if turns_comp then
				if remain > 0 then
					turns_comp:SetText(remain)
					turns_comp:SetVisible(true)
					notification:SetVisible(false)
				else
					turns_comp:SetVisible(false)
					notification:SetVisible(true)
					notification:SetTooltipText(common.get_localised_string(self.config.expedition_reached_notification_tooltip_key), self.config.expedition_reached_notification_tooltip_key, true)
				end
			end

			if self.persistent.expedition_returning then
				local remain = self.persistent.return_turns - (cm:model():turn_number() - self.persistent.expedition_start_return_turn)
				if turns_comp then
					if remain > 0 then
						turns_comp:SetText(remain)
						turns_comp:SetVisible(true)
						notification:SetVisible(false)
					else
						turns_comp:SetVisible(false)
						notification:SetVisible(true)
						notification:SetTooltipText(common.get_localised_string(self.config.expedition_reached_capital_notification_tooltip_key), self.config.expedition_reached_capital_notification_tooltip_key, true)
					end
				end
			end
		end
	end,

	get_listeners = function(self)
		output("ANCIENT LEGACIES HATSHEPSUT ADD LISTENERS()")

		return {
			{
				event = "FactionTurnStart",
				auto_check_faction = true,
				condition = function(self, context)
					local faction = context:faction()
					return not faction:is_human()
				end,
				callback = function(self, context)
					local turn_number = cm:model():turn_number()

					--if its not time yet, its not time yet
					if turn_number < self.config.ai.expeditions_start_turn then
						return
					end

					--reached destination
					if turn_number == self.persistent.expedition_start_turn + self.persistent.total_path_duration then
						output("AI expedition reached destination!")
						-- give the ai stuff
						local destination_data = self.config.ai.destinations[self.persistent.final_destination]

						for idx, cost in ipairs(destination_data.cash_out_resources) do
							output("AI expedition cash out for " .. self.persistent.final_destination .. ". Receiving " .. cost[1] .. " " .. cost[2])
							cm:faction_add_pooled_resource(self.persistent.active_faction, cost[1], "troy_resource_factor_faction", cost[2])
						end

						if destination_data.cash_out_bundle ~= "" then
							local region = destination_data.bundle_regions[cm:model():random_int(1, #destination_data.bundle_regions)]
							local duration = destination_data.bundle_duration or self.config.default_item_effect_bundle_duration
							cm:apply_effect_bundle_to_region(destination_data.cash_out_bundle, region, duration)
						end
						return
					end

					-- check if has returned and the cooldown has passed
					if turn_number <= self.persistent.expedition_start_turn + (self.persistent.total_path_duration * 2) + self.config.ai.expedition_wait_turns then
						return
					end

					-- pick random path
					local destination_realm = self:get_random_destination_realm()
					local start_node = nil
					local destination_node = nil
					for k, v in pairs(self.config.travel_paths) do
						if v.realm == self.persistent.faction_capital_realm then
							start_node = k
						end
						if v.realm == destination_realm then
							destination_node = k
						end
					end

					if not start_node  then
						script_error("hatshepsut ai expedition missing start!")
						return
					end

					if not destination_node then
						script_error("hatshepsut ai expedition missing destination!")
					end

					local distance, path, array_path = self:find_path(start_node, destination_node)

					self.persistent.total_path_duration = distance
					self.persistent.expedition_start_turn = turn_number
					self.persistent.final_destination = destination_realm

					output("AI: Starting expedition ! " .. turn_number .. " #turn " .. "start: " .. self.persistent.faction_capital_realm .. " end: " .. destination_realm .. " distance " .. distance .. " path " .. path)

					--dilemmas
					if self.persistent.ai.last_dilemma_turn ~= 0 and turn_number < self.persistent.ai.last_dilemma_turn + self.config.ai.dilemma_cooldown then
						-- dilemma on cd
						return
					end

					local player_factions = cm:get_human_factions()

					if player_factions then
						for _, player_faction_key in ipairs(player_factions) do
							local chance = self.config.ai.dilemma_base_chance
							local relations = context:faction():attitude_with("phar_main_bay")

							if relations > 100 then
								relations = 100
							end

							if relations <= 0 then
								self:trigger_ai_random_dilemma_with_chance(player_faction_key, chance)
							end

							if relations > 0 then
								local bonus_chance = relations * self.config.ai.dilemma_relations_coeff
								self:trigger_ai_random_dilemma_with_chance(player_faction_key, math.floor(chance + bonus_chance))
							end
						end
					end
				end,
			},

			{
				event = "FactionTurnStart",
				auto_check_faction = true,
				condition = function(self, context)
					local faction = context:faction()
					return faction:is_human() and self.persistent.ai.trigger_data[faction:name()]
				end,
				callback = function(self, context)
					local faction_name = context:faction():name()
					cm:trigger_dilemma(faction_name, self.persistent.ai.trigger_data[faction_name], nil)
					self.persistent.ai.trigger_data[faction_name] = nil
				end,
			},

			{
				event = "FirstTickAfterWorldCreated",
				condition = true,
				callback = function(self, context)
					self:update_turns_button_component()
				end
			},

			{
				event = "FactionTurnStart",
				auto_check_faction = true,
				condition = true,
				callback = function(self, context)
					self:update_turns_button_component()
					-- progress the travel
					if self.persistent.expedition_traveling then
						self.persistent.turns_spent_traveling = self.persistent.turns_spent_traveling + 1

						if self.persistent.expedition_returning then

							self.persistent.current_segment_duration = self.persistent.current_segment_duration - 1
							if self.persistent.current_segment_duration <= 0 then
								self:node_reached_returning()
							end

							--check if we have returned
							if self.persistent.expedition_start_return_turn + self.persistent.return_turns == cm:model():turn_number() then
								self:return_expedition()
							end
						else
							self.persistent.current_segment_duration = self.persistent.current_segment_duration - 1
							if self.persistent.current_segment_duration <= 0 then
								self:node_reached()
								return
							end
						end
						self.persistent.node_reached = ""
					end
				end,
			},

			{
				event = "FactionChangesHomeRegion",
				auto_check_faction = true,
				condition = true,
				callback = function(self, context)
					-- if we don't have a home region then best we stay with previous capital realm otherwise we won't be able to start expedition 
					local home_region = context:faction():home_region()
					if not home_region:is_null_interface() then
						local capital_realm = phar_realms.get_realm_for_region(home_region:name())
						if not self.persistent.expedition_traveling and self.persistent.current_location == self.persistent.faction_capital_realm then
							output("Faction capital changed! Changing home realm to:" .. home_region:name())
							self.persistent.faction_capital_realm = capital_realm
							self.persistent.faction_capital_realm_new = ""
							if not self.persistent.expedition_traveling then
								self.persistent.current_location = capital_realm
							end
						else
							output("Faction capital changed! Delaying change until expedition finishes.New home realm:" .. home_region:name())
							self.persistent.faction_capital_realm_new = capital_realm
						end
					end

					self:cancel_expedition(cm:model():turn_number())

					if context:faction():name() == self.persistent.active_faction then
						cm:override_ui("disable_hatshepsut_fm_button", home_region:is_null_interface())
					end
				end
			},

			{
				event = "PanelOpenedCampaign",
				auto_check_faction = true,
				condition = function(self, context)
				-- the pre-battle panel can be opened before loading is finished
					if not cm.game_is_running then
						return false
					end
					-- all the factions with the legacy get this event, but we need this sent only to the player
					local local_faction_name = cm:get_local_faction_name(true)
					if self.persistent.active_faction ~= local_faction_name then
						return false
					end
					return context.string == hatshepsut_config.ui.panel_name
				end,
				callback = function(self, context)
					local panel = UIComponent(context.component)
					if not panel then
						script_error("UI panel " .. hatshepsut_config.ui.panel_name .. " not found!")
						return
					end

					local capital_pin = panel:SequentialFind("capital_pin")
					local faction_capital_pin = panel:SequentialFind(self.persistent.faction_capital_realm .. "_pin")
					if faction_capital_pin and capital_pin then
						capital_pin:MoveTo(faction_capital_pin:Position())
						faction_capital_pin:SetVisible(false)
						faction_capital_pin:SetInteractive(false)
						capital_pin:SetInteractive(true)
						capital_pin:SetState("selected")
					end

					self.temp = {
						ui = {},
						cash_out_data = {
							mre_data = {},
							region_effect_data = {},
							ancillary_data = {},
						},
						cart_data = {},
						trade_data = {
							our = {items = {}, character_ancillaries = {}},
							merchant = {items = {}, character_ancillaries = {}},
						},
					}

					local cart_item = panel:SequentialFind("cart_holder", "cart", "template_ancillary")
					self:get_child_template(cart_item, "cart_item_template")

					local inventory_item = panel:SequentialFind("cart_holder", "inventory", "template_ancillary")
					self:get_child_template(inventory_item, "inventory_item_template")

					local row_item = panel:SequentialFind("cashing_out", "inventory", "row_template")
					self:get_child_template(row_item, "cash_out_row_template")

					local trade_cart_item = panel:SequentialFind("trading", "expedition_cart_holder", "template_ancillary")
					self:get_child_template(trade_cart_item, "trade_inventory_template")

					local trade_merchant_item = panel:SequentialFind("trading", "merchant_holder", "template_ancillary")
					self:get_child_template(trade_merchant_item, "trade_merchant_template")

					local offering_item = panel:SequentialFind("selected_realm_info", "marketplace_items", "item_template")
					self:get_child_template(offering_item, "offering_item_template")

					local buying_item = panel:SequentialFind("selected_realm_info", "interested_in_items", "item_template")
					self:get_child_template(buying_item, "buying_item_template")

					local select_realm_cart_item = panel:SequentialFind("selected_realm_info", "expedition_cart_info", "item_template")
					self:get_child_template(select_realm_cart_item, "select_realm_cart_item_template")

					local cash_out_resource_item = panel:SequentialFind("cashing_out", "gained_resources_holder", "gained_resource_template")
					self:get_child_template(cash_out_resource_item, "cash_out_resource_template")

					local expedition_cost_item = panel:SequentialFind("cart_holder", "expedition_price_holder", "resource_cost_template")
					self:get_child_template(expedition_cost_item, "expedition_cost_resource_template")

					local expedition_cart_item = panel:SequentialFind("expedition_state", "expedition_cart_info", "icons_holder", "item_template")
					self:get_child_template(expedition_cart_item, "expedition_cart_item")

					local starting_cart_item = panel:SequentialFind("selected_realm_info", "starter_items", "icons_list", "item_template")
					self:get_child_template(starting_cart_item, "starting_cart_item")

					local legend = panel:SequentialFind("legend")
					if legend then
						legend:SetVisible(false)
					end

					for pin, _ in pairs(self.persistent.ui.visited_pins) do
						local pin_component = panel:SequentialFind(pin)
						if pin_component then
							pin_component:SetState("inactive")
						end
					end

					for id, pin_data in pairs(self.config.travel_paths) do
						local pin_component = panel:SequentialFind(pin_data.realm .. "_pin")
						self:fill_pin_tooltip(pin_component, pin_data.realm)
					end
					self:fill_capital_pin_tooltip(panel)

					self:add_on_click_route_listener(panel)
					self:add_on_click_pin_fill_destination(panel)
					self:add_on_button_click_listener(panel)
					self:add_trade_click_listener(panel)
					self:add_cart_click_listener(panel)
					self:add_selected_destination_item_click_listener(panel)

					if self.config.stop_at_every_node and self.persistent.current_location ~= self.persistent.selected_destination and self.persistent.node_reached and self.persistent.node_reached ~= "" and self.persistent.expedition_traveling then
						if self.persistent.expedition_entered_bazaar_on_route then
							output("FILL POST TRADE NOT DESTINATION")
							self:fill_post_trade_node(panel)
						else
							output("FILL NODE REACHED NOT DESTINATION")
							self:fill_node_reached(panel)
						end
						return
					end

					--fill in traveling
					if self.persistent.expedition_traveling then
						self:fill_expedition_traveling(panel)
						self:highlight_path(panel, true)
						self:scroll_map_to_capital(panel)
						return
					end

					self:highlight_path(panel, false)

					-- fill destination_reached
					if self.persistent.expedition_returned_to_cash_out == true then
						self:fill_capital_reached(panel)
						self:scroll_map_to_capital(panel)
					elseif self.persistent.current_location == self.persistent.selected_destination and not self.persistent.expedition_traveling then

						if self.persistent.expedition_entered_destined_bazaar then
							output("FILL POST TRADE DESTINATION")
							self:fill_post_trade_node(panel)
						else
							output("FILL DESTINATION REACHED")
							self:fill_node_reached(panel)
						end

						self:scroll_map_to_capital(panel)
						return
					elseif self.persistent.current_location ~= self.persistent.selected_destination and not self.persistent.expedition_traveling then
						output("FILL SELECT_REGION")
						self:fill_select_region(panel)
						self:scroll_map_to_capital(panel)
						return
					end
				end,
			},

			{
				event = "PanelClosedCampaign",
				condition = function(self, context)
					return context.string == hatshepsut_config.ui.panel_name
				end,
				callback = function(self, context)
					core:remove_listener("hatshepsut_panel_clicked_on_node")
					core:remove_listener("hatshepsut_panel_clicked_on_node_fill_destination")
					core:remove_listener("hatshepsut_panel_clicked_on_button")
					core:remove_listener("hatshepsut_panel_clicked_on_button_in_trade_panel_merchant")
					core:remove_listener("hatshepsut_panel_clicked_on_button_in_trade_panel_expedition_cart")
					core:remove_listener("hatshepsut_add_to_inventory_click")
					core:remove_listener("hatshepsut_remove_from_inventory_click")
					core:remove_listener("hatshepsut_panel_selected_destination_item_click_listener")

					local panel =  core:get_ui_root():SequentialFind(context.string)
					if not panel then
						script_error("UI panel " .. hatshepsut_config.ui.panel_name .. " not found!")
						return
					end

					for k, v in pairs(self.temp.ui) do
						v:Destroy()
					end

					local local_faction_cqi = cm:get_local_faction(true):command_queue_index()
					CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "hatshepsut_complete_cash_out_reset")

					self.temp = {
						ui = {},
						cash_out_data = {
							mre_data = {},
							region_effect_data = {},
							ancillary_data = {},
						},
						cart_data = {},
						trade_data = {
							our = {items = {}, character_ancillaries = {}},
							merchant = {items = {}, character_ancillaries = {}},
						},
					}
				end,
			},

			{
				event = "UITriggerScriptEvent",
				auto_check_faction = true,
				condition = function(self, context) return string.find(context:trigger(), "hatshepsut_find_path_") ~= nil end,
				callback = function(self, context)
					local text_data = string.gsub(context:trigger(), "hatshepsut_find_path_", "", 1)
					local event_data = {}
					for w in (text_data .. ";"):gmatch("([^;]*);") do
						table.insert(event_data, w)
					end

					local start_node = event_data[1]
					local destination_node = event_data[2]
					output("Find path " .. start_node .. " -> " .. destination_node)
					local distance, path, array_path = self:find_path(start_node, destination_node)
					output("Directed: distance " .. distance .. " path " .. path)

					table.remove(array_path, 1)
					for k, v in ipairs(array_path) do
						output("path idx " .. k .. " node " .. v)
					end

					self.persistent.new_path_data = { ui = {}}
					self.persistent.new_path_data.total_path_duration = distance
					self.persistent.new_path_data.current_segment_duration = self.config.travel_paths[start_node].avaliable_destinations[array_path[1]]
					self.persistent.new_path_data.path = array_path
					self.persistent.new_path_data.selected_destination = self.config.travel_paths[array_path[1]].realm
					self.persistent.new_path_data.final_destination = self.config.travel_paths[destination_node].realm
					self.persistent.new_path_data.ui.selected_pin = self.persistent.new_path_data.selected_destination .. "_pin"
					local panel =  core:get_ui_root():SequentialFind(hatshepsut_config.ui.panel_name)
					if not panel then
						script_error("Panel not found!")
						return
					end

					local eta_holder = panel:SequentialFind("eta_holder")
					if not eta_holder then
						script_error("Missing component from panel!")
						return
					end

					local capital_node = nil
					for k, v in pairs(self.config.travel_paths) do
						if v.realm == self.persistent.faction_capital_realm then
							capital_node = k
							break
						end
					end
					-- find the return path from the new node.
					local return_distance = self:find_path(capital_node, destination_node)
					self.persistent.new_path_data.new_return_distance = return_distance;
					local turns_to_reach = eta_holder:SequentialFind("turns_to_reach_holder", "dy_number")
					local turns_to_return = eta_holder:SequentialFind("turns_to_return", "dy_number")

					if turns_to_reach and turns_to_return then
						turns_to_reach:SetText(tostring(distance))
						turns_to_return:SetText(tostring(return_distance))
					end

					local realm_name = eta_holder:SequentialFind("current_location_holder", "dy_name")
					if realm_name then
						local loc_name = self.config.trade_destinations[self.persistent.current_location].localised_name
						realm_name:SetText(common.get_localised_string(loc_name), loc_name)
					end

					eta_holder:SetVisible(true)
				end,
			},

			{
				event = "UITriggerScriptEvent",
				auto_check_faction = true,
				condition = function(self, context) return string.find(context:trigger(), "add_character_ancillary_to_cart") ~= nil end,
				callback = function(self, context)
					local event_data = context:trigger():split(";")

					--first element will be the event name
					table.remove(event_data, 1)

					self:add_to_cart(event_data[1])

					output("Removing character ancillary as cost " .. event_data[1])
					cm:force_remove_ancillary(cm:char_lookup_str(event_data[2]), event_data[1], false)
				end
			},

			{
				event = "UITriggerScriptEvent",
				auto_check_faction = true,
				condition = function(self, context) return string.find(context:trigger(), "hatshepsut_start_expedition") ~= nil end,
				callback = function(self, context)
					local event_data = context:trigger():split(";")

					--first element will be the event name
					table.remove(event_data, 1)

					self.persistent.expedition_traveling = true
					self.persistent.expedition_start_turn = cm:model():turn_number()
					self.persistent.expedition_entered_destined_bazaar = false

					if self.config.stop_at_every_node then
						self.persistent.expedition_entered_bazaar_on_route = false
					end
					-- apply new path
					self.persistent.total_path_duration = self.persistent.new_path_data.total_path_duration
					self.persistent.current_segment_duration = self.persistent.new_path_data.current_segment_duration
					self.persistent.path = self.persistent.new_path_data.path
					self.persistent.selected_destination = self.persistent.new_path_data.selected_destination
					self.persistent.final_destination = self.persistent.new_path_data.final_destination
					self.persistent.ui.selected_pin = self.persistent.new_path_data.ui.selected_pin
					self.persistent.return_distance = self.persistent.new_path_data.new_return_distance

					--event data is present only when starting from capital.
					if #event_data > 0 then
						for _, item in ipairs(event_data) do
							self:add_to_cart(item)
						end

						for idx, data in ipairs(self.persistent.trade_cart.items) do
							local item = data.item
							if self.config.trade_items[item] then
								local cost_data = self.config.trade_items[item].cost
								for idx, v in ipairs(cost_data) do
									output("Applying cost for  item " .. item .. " for " .. v[1] .. " " .. v[2])
									cm:faction_add_pooled_resource(self.persistent.active_faction, v[1], "troy_resource_factor_faction", -v[2])
								end
							else
								output("Removing pool ancillary as cost " .. item .. " faction " .. self.persistent.active_faction)
								cm:force_remove_ancillary_from_faction(tostring(self.persistent.active_faction), tostring(item), false, false)
							end
						end
					end

					local destination_config = self.config.trade_destinations[self.persistent.final_destination]
					output("Started expedition!")
					cm:add_event_feed_event(
						self.config.events.expedition_started_event.event_key,
						self.persistent.active_faction,
						0,
						destination_config.localised_name or ""
					)

					-- all the factions with the legacy get this event, but we need this sent only to the player
					if self.persistent.active_faction == cm:get_local_faction_name(true) then
						self:update_turns_button_component()
						cm:notify_hatshepsut_expedition_started(self.persistent.active_faction, self.persistent.final_destination)
					end
				end,
			},

			{
				event = "UITriggerScriptEvent",
				auto_check_faction = true,
				condition = function(self, context) return context:trigger() == "hatshepsut_cancel_expedition" end,
				callback = function(self, context)
					self:cancel_expedition(cm:model():turn_number())
					output("hatshepsut_cancel_expedition! Canceled and recalled expedition!")
				end,
			},

			{
				event = "UITriggerScriptEvent",
				auto_check_faction = true,
				condition = function(self, context) return context:trigger() == "hatshepsut_recall_expedition" end,
				callback = function(self, context)
					self:recall_expedition(cm:model():turn_number())
					output("hatshepsut_recall_expedition! Recalled expedition!")
					local local_faction_name = cm:get_local_faction_name(true)
					if self.persistent.active_faction == local_faction_name then
						self:update_turns_button_component()
					end
				end,
			},

			{
				event = "UITriggerScriptEvent",
				auto_check_faction = true,
				condition = function(self, context) return context:trigger() == "hatshepsut_enter_capital" end,
				callback = function(self, context)
					output("hatshepsut_enter_capital_event")
				end,
			},

			{
				event = "UITriggerScriptEvent",
				auto_check_faction = true,
				condition = function(self, context) return string.find(context:trigger(), "hatshepsut_sell_item_") ~= nil end,
				callback = function(self, context)
					local event_data = context:trigger():split(";")
					local selected_item = event_data[2]
					local idx = tonumber(event_data[3])
					output("Selling item " .. selected_item)

					self.persistent.trade_cart.items[idx].cash_out_for = "mre"

					local local_faction_name = cm:get_local_faction_name(true)
					if self.persistent.active_faction == local_faction_name then
						self:refresh_cash_out_button()
						self:refresh_cash_out_reward()
					end
				end,
			},

			{
				event = "UITriggerScriptEvent",
				auto_check_faction = true,
				condition = function(self, context) return string.find(context:trigger(), "hatshepsut_item_convert_to_effect_bundle_") ~= nil end,
				callback = function(self, context)
					local event_data = context:trigger():split(";")
					local selected_item = event_data[2]
					local idx = tonumber(event_data[3])
					local effect_bundle = self.config.trade_items[selected_item].cash_out.region_bundle
					output("Setting item " .. selected_item .. " with index ".. idx .. " to apply effect bundle " .. effect_bundle)

					self.persistent.trade_cart.items[idx].cash_out_for = "region_bundle"

					local local_faction_name = cm:get_local_faction_name(true)
					if self.persistent.active_faction == local_faction_name then
						self:refresh_cash_out_button()
						self:refresh_cash_out_reward()
					end
				end,
			},

			{
				event = "UITriggerScriptEvent",
				auto_check_faction = true,
				condition = function(self, context) return string.find(context:trigger(), "hatshepsut_tranfer_item_as_ancillary_") ~= nil end,
				callback = function(self, context)
					local event_data = context:trigger():split(";")
					local selected_item = event_data[2]
					local idx = tonumber(event_data[3])
					output("Setting item " .. selected_item .. " with index ".. idx .. "to convert to ancillary")

					local data = self.persistent.trade_cart.items[idx]
					if data then
						self.persistent.trade_cart.items[idx].cash_out_for = "ancillary"
					end

					local local_faction_name = cm:get_local_faction_name(true)
					if self.persistent.active_faction == local_faction_name then
						self:refresh_cash_out_button()
						self:refresh_cash_out_reward()
					end
				end,
			},

			{
				event = "UITriggerScriptEvent",
				auto_check_faction = true,
				condition = function(self, context) return context:trigger() == "hatshepsut_complete_cash_out_reset" end,
				callback = function(self, context)
					for idx, data in ipairs(self.persistent.trade_cart.items) do
						local item = data.item
						self.persistent.trade_cart.items[idx].cash_out_for = ""
					end

					for idx, data in ipairs(self.persistent.trade_cart.ancillary_items) do
						self.persistent.trade_cart.ancillary_items[idx].cash_out_for = ""
					end
				end,
			},

			{
				event = "UITriggerScriptEvent",
				auto_check_faction = true,
				condition = function(self, context) return context:trigger() == "hatshepsut_complete_cash_out_mre_and_finalise" end,
				callback = function(self, context)
					for idx, data in ipairs(self.persistent.trade_cart.items) do
						local item = data.item
						if data.cash_out_for == "mre" then
							local cash_out_data = self.config.trade_items[item].cash_out
							for k, v in ipairs(cash_out_data.mre) do
								output("Setting item " .. item .. " for selling: " .. v[1] .. " " .. v[2])
								cm:faction_add_pooled_resource(self.persistent.active_faction, v[1], cash_out_data.resource_factor, v[2])

								if self.persistent.active_faction == cm:get_local_faction_name(true) then
									cm:notify_hatshepsut_expedition_resource_cashed_out(self.persistent.active_faction, v[1], v[2])
								end
							end
						end
					end
					self.persistent.trade_cart.items = {}
					self.persistent.expedition_returned_to_cash_out = false
				end,
			},

			{
				event = "UITriggerScriptEvent",
				auto_check_faction = true,
				condition = function(self, context) return string.find(context:trigger(), "hatshepsut_complete_cash_out_ancillary_") ~= nil end,
				callback = function(self, context)
					local event_data = context:trigger():split(";")

					local ancillary = event_data[2]
					local char_cqi = tonumber(event_data[3])
					cm:force_add_ancillary(cm:char_lookup_str(char_cqi), ancillary)

					core:trigger_event("ScriptEventHatshepsutCashOutAncillary", { faction_name = self.persistent.active_faction })
				end,
			},

			{
				event = "UITriggerScriptEvent",
				auto_check_faction = true,
				condition = function(self, context) return string.find(context:trigger(), "hatshepsut_complete_cash_out_pool_ancillary_") ~= nil end,
				callback = function(self, context)
					local event_data = context:trigger():split(";")

					local ancillary = event_data[2]
					cm:add_ancillary_to_faction(self.persistent.active_faction, ancillary, true)

					core:trigger_event("ScriptEventHatshepsutCashOutAncillary", { faction_name = self.persistent.active_faction })
				end,
			},

			{
				event = "UITriggerScriptEvent",
				auto_check_faction = true,
				condition = function(self, context) return string.find(context:trigger(), "hatshepsut_complete_cash_out_region_bundle_") ~= nil end,
				callback = function(self, context)
					local event_data = context:trigger():split(";")

					local bundle = event_data[2]
					local region_key = event_data[3]
					local duration = tonumber(event_data[4])
					cm:apply_effect_bundle_to_region(bundle, region_key, duration)

					core:trigger_event("ScriptEventHatshepsutCashOutEffectBundle", { faction_name = self.persistent.active_faction })
				end,
			},

			{
				event = "UITriggerScriptEvent",
				auto_check_faction = true,
				condition = function(self, context) return string.find(context:trigger(), "hatshepsut_complete_trading_deal_buying_") ~= nil end,
				callback = function(self, context)
					output("Completing trade deal, buying theirs...")
					local event_data = context:trigger():split(";")

					--first element will be the event name
					table.remove(event_data, 1)

					--- add from vendor
					for _, item in ipairs(event_data) do
						self:add_to_cart(item)
					end
					if self.config.stop_at_every_node then
						self.persistent.expedition_entered_bazaar_on_route = true
					end

					if self.persistent.current_location == self.persistent.final_destination then
						self.persistent.expedition_entered_destined_bazaar = true
					end

					local local_faction_name = cm:get_local_faction_name(true)
					if self.persistent.active_faction == local_faction_name then
						local inventory_holder = core:get_ui_root():SequentialFind(hatshepsut_config.ui.panel_name, "expedition_state", "expedition_cart_info", "icons_holder", "icons_list")
						if self.temp.ui.expedition_cart_item and inventory_holder then
							self:fill_inventory_overview_part(inventory_holder, self.temp.ui.expedition_cart_item, "_expedition_cart_item_component")
						end
					end
				end,
			},

			{
				event = "UITriggerScriptEvent",
				auto_check_faction = true,
				condition = function(self, context) return string.find(context:trigger(), "hatshepsut_complete_trading_deal_selling_") ~= nil end,
				callback = function(self, context)
					output("Completing trade deal, selling ours...")
					local event_data = context:trigger():split(";")

					--first element will be the event name
					table.remove(event_data, 1)

					--- remove from cart
					for _, item in ipairs(event_data) do
						self:remove_from_cart(item)
					end

					if self.config.stop_at_every_node then
						self.persistent.expedition_entered_bazaar_on_route = true
					end

					if self.persistent.current_location == self.persistent.final_destination then
						self.persistent.expedition_entered_destined_bazaar = true
					end

					local local_faction_name = cm:get_local_faction_name(true)
					if self.persistent.active_faction == local_faction_name then
						local inventory_holder = core:get_ui_root():SequentialFind(hatshepsut_config.ui.panel_name, "expedition_state", "expedition_cart_info", "icons_holder", "icons_list")
						if self.temp.ui.expedition_cart_item and inventory_holder then
							self:fill_inventory_overview_part(inventory_holder, self.temp.ui.expedition_cart_item, "_expedition_cart_item_component")
						end
					end
				end,
			},

			{
				event = "UITriggerScriptEvent",
				auto_check_faction = true,
				condition = function(self, context) return string.find(context:trigger(), "hatshepsut_complete_trading_deal_selling_character_ancillary_") ~= nil end,
				callback = function(self, context)
					output("Completing trade deal, selling our character ancillaries...")
					local event_data = context:trigger():split(";")

					--first element will be the event name
					table.remove(event_data, 1)

					--- remove from cart
					self:remove_character_ancillary_from_cart(event_data[1], event_data[2])
				end,
			},

			{
				event = "UITriggerScriptEvent",
				auto_check_faction = true,
				condition = function(self, context) return context:trigger() == "hatshepsut_change_destination_bundle" end,
				callback = function(self, context)
					local num_bundles = #self.config.trade_destinations[self.persistent.current_location].item_bundles
					local destination_bundle = self.persistent.destination_data[self.persistent.current_location]

					self.persistent.destination_data[self.persistent.current_location] = destination_bundle % num_bundles + 1
					self.persistent.node_reached = ""
				end,
			},

			{
				event = "FirstTickAfterWorldCreated",
				auto_check_faction = false,
				condition = function(self, context) 
								local local_faction = cm:get_local_faction_name(true)
								return local_faction == self.persistent.active_faction
							end,
				callback = function(self, context)
					egypt_political_states:activate_button("button_fm_phar_hatchepsut")

					local faction = cm:get_faction(self.persistent.active_faction)
					cm:override_ui("disable_hatshepsut_fm_button", faction:home_region():is_null_interface())
				end,
			},
		}
	end,

	find_item_cart_index = function(self, selected_item, cash_out_for)
		local idx_to_use = nil
		for idx, data in ipairs(self.persistent.trade_cart.items) do
			if data.item == selected_item and data.cash_out_for == "" then
				idx_to_use = idx
				break
			end
		end

		if not idx_to_use then
			for idx, data in ipairs(self.persistent.trade_cart.items) do
				if data.item == selected_item and data.cash_out_for ~= cash_out_for then
					idx_to_use = idx
					break
				end
			end
		end
		return idx_to_use
	end,

	is_item_in_cart = function(self, item)
		for idx, data in ipairs(self.persistent.trade_cart.items) do
			local cart_item = data.item
			if item == cart_item then
				return true
			end
		end
		return false
	end,

	highlight_segment = function(self, panel, start_node, end_node, highlight)
		local component_name = start_node .. "_" .. end_node .. "_path"
		local path_component = panel:SequentialFind(component_name)
		if not path_component then
			component_name = end_node .. "_" .. start_node .. "_path"
			path_component = panel:SequentialFind(component_name)
		end
		if not path_component then
			script_error("path component " .. component_name .. " not found!")
			return
		end
		if highlight then
			path_component:SetState("selected")
		else
			path_component:SetState("default")
		end
	end,

	highlight_path = function(self, panel, highlight)
		-- if no path, stop all highlights
		if #self.persistent.path == 0 then
			local map = panel:SequentialFind("map")
			if not map then
				script_error("Component not found!")
				return
			end
			for i = 0, map:ChildCount() - 1 do
				local child = UIComponent(map:Find(i))
				if string.find(child:Id(), "_path") ~= nil then
					child:SetState("default")
				end
			end
			return
		end

		--highlight first
		local start_node = nil
		for k, v in pairs(self.config.travel_paths) do
			if v.realm == self.persistent.current_location then
				start_node = k
			end
		end

		self:highlight_segment(panel, start_node, self.persistent.path[1], highlight)

		--then others
		for idx, node in ipairs(self.persistent.path) do
			if not self.persistent.path[idx + 1] then
				return
			end

			local next_node = self.persistent.path[idx + 1]

			self:highlight_segment(panel, node, next_node, highlight)
		end
	end,

	scroll_map_to_capital = function(self, panel)
		local map_listview = panel:SequentialFind("map_holder", "listview")
		local capital_pin = panel:SequentialFind("capital_pin")
		if not (map_listview and capital_pin) then
			return
		end

		map_listview:InterfaceFunction("scroll_to_component", capital_pin:Address(), true)
	end,

	get_trade_cart_default_value = function(self)
		local total_item_value = 0 --sum of initial trade item values
		if self.persistent.trade_cart.items then
			for idx, data in ipairs(self.persistent.trade_cart.items) do
				local trade_item = self.config.trade_items[data.item]
				if trade_item then
					total_item_value = total_item_value + trade_item.trade_value
				else
					total_item_value = total_item_value + self.config.ancillaries_as_items.default_trade_value 
				end
			end
		end

		return total_item_value
	end,

	fill_capital_reached = function(self, panel)
		local realm_info = panel:SequentialFind("selected_realm_info")
		if realm_info then
			realm_info:SetVisible(false)
		end

		local expedition_state = panel:SequentialFind("expedition_state")
		if not expedition_state then
			script_error("Key component missing from panel!")
			return
		end
		expedition_state:SetVisible(true)

		local text = expedition_state:SequentialFind("expedition_txt")
		if text then
			text:SetState("at_capital")
		end

		local end_text = expedition_state:SequentialFind("finished_txt")
		if end_text then
			end_text:SetVisible(false)
		end

		local capital_pin = panel:SequentialFind("capital_pin")
		if capital_pin then
			capital_pin:SetInteractive(false)
		end

		local illustration = expedition_state:SequentialFind("illustration")
		if illustration then
			illustration:SetVisible(true)
		end

		local destination_info = expedition_state:SequentialFind("destination_info")
		if destination_info then
			destination_info:SetVisible(false)
		end

		local button_cancel_holder = expedition_state:SequentialFind("button_cancel_holder")
		if button_cancel_holder then
			button_cancel_holder:SetVisible(false)
		end

		local button_enter_bazaar_holder = expedition_state:SequentialFind("button_enter_bazaar_holder")
		if button_enter_bazaar_holder then
			button_enter_bazaar_holder:SetVisible(false)
		end

		local button_enter_capital_holder = expedition_state:SequentialFind("button_enter_capital_holder")
		if button_enter_capital_holder then
			button_enter_capital_holder:SetVisible(true)
		end

		local button_finish_holder = expedition_state:SequentialFind("button_finish_holder")
		if button_finish_holder then
			button_finish_holder:SetVisible(false)
		end

		local inventory_holder = expedition_state:SequentialFind("expedition_cart_info", "icons_holder", "icons_list")
		if self.temp.ui.expedition_cart_item then
			self:fill_inventory_overview_part(inventory_holder, self.temp.ui.expedition_cart_item, "_component_expedition_cart_item")
		end

		local item_value = expedition_state:SequentialFind("value_holder", "value")
		if item_value then
			item_value:SetText(self:get_trade_cart_default_value())
		end
	end,

	fill_expedition_traveling = function(self, panel)
		local realm_info = panel:SequentialFind("selected_realm_info")
		if realm_info then
			realm_info:SetVisible(false)
		end

		local capital_pin = panel:SequentialFind("capital_pin")
		if capital_pin then
			capital_pin:SetInteractive(false)
		end

		local expedition_state = panel:SequentialFind("expedition_state")
		if expedition_state then
			expedition_state:SetVisible(true)
			if self.persistent.expedition_returning then
				local illustration = expedition_state:SequentialFind("illustration")
				if illustration then
					illustration:SetState("returning")
					illustration:SetVisible(true)
				end

				local text_state = expedition_state:SequentialFind("expedition_txt")
				if text_state then
					text_state:SetState("returning")
				end

				local turns = expedition_state:SequentialFind("remaining_turns_holder", "dy_number")
				local remain = self.persistent.return_turns - (cm:model():turn_number() - self.persistent.expedition_start_return_turn)
				if turns then
					turns:SetText(remain)
				end

				local button_cancel_holder = expedition_state:SequentialFind("button_cancel_holder")
				if button_cancel_holder then
					button_cancel_holder:SetVisible(true)
				end

				local button_enter_bazaar_holder = expedition_state:SequentialFind("button_enter_bazaar_holder")
				if button_enter_bazaar_holder then
					button_enter_bazaar_holder:SetVisible(false)
				end

				local button_enter_capital_holder = expedition_state:SequentialFind("button_enter_capital_holder")
				if button_enter_capital_holder then
					button_enter_capital_holder:SetVisible(false)
				end

				local button_finish_holder = expedition_state:SequentialFind("button_finish_holder")
				if button_finish_holder then
					button_finish_holder:SetVisible(false)
				end

				local destination_info = expedition_state:SequentialFind("destination_info")
				if destination_info then
					destination_info:SetVisible(true)
					destination_info:SetState("returning")
				end

			else
				local illustration = expedition_state:SequentialFind("illustration")
				if illustration then
					illustration:SetState("in_progress")
					illustration:SetVisible(true)
				end

				local text_state = expedition_state:SequentialFind("expedition_txt")
				if text_state then
					text_state:SetState("in_progress")
				end
				
				local remain = self.persistent.total_path_duration - (cm:model():turn_number() - self.persistent.expedition_start_turn)
				local turns = expedition_state:SequentialFind("remaining_turns_holder", "dy_number")
				if turns then
					turns:SetText(remain)
				end

				local button_cancel_holder = expedition_state:SequentialFind("button_cancel_holder")
				if button_cancel_holder then
					button_cancel_holder:SetVisible(true)
				end


				local button_enter_bazaar_holder = expedition_state:SequentialFind("button_enter_bazaar_holder")
				if button_enter_bazaar_holder then
					button_enter_bazaar_holder:SetVisible(false)
				end

				local button_enter_capital_holder = expedition_state:SequentialFind("button_enter_capital_holder")
				if button_enter_capital_holder then
					button_enter_capital_holder:SetVisible(false)
				end

				local button_finish_holder = expedition_state:SequentialFind("button_finish_holder")
				if button_finish_holder then
					button_finish_holder:SetVisible(false)
				end

				local destination_info = expedition_state:SequentialFind("destination_info")
				if destination_info then
					destination_info:SetVisible(true)
					destination_info:SetState("in_progress")
				end
			end

			local finished_txt = expedition_state:SequentialFind("finished_txt")
			if finished_txt then
				finished_txt:SetVisible(false)
			end

			local button_recall_holder = expedition_state:SequentialFind("button_recall")
			if button_recall_holder then
				button_recall_holder:SetVisible(false)
			end

			local start = expedition_state:SequentialFind("starting_location_holder", "dy_name")
			if start then
				local loc_name = self.config.trade_destinations[self.persistent.current_location].localised_name
				start:SetText(common.get_localised_string(loc_name), loc_name)
			end

			local dest = expedition_state:SequentialFind("destination_holder", "dy_name")
			if dest then
				dest:SetVisible(true)
				local loc_name = self.config.trade_destinations[self.persistent.final_destination].localised_name
				dest:SetText(common.get_localised_string(loc_name), loc_name)
			end

			local inventory_holder = expedition_state:SequentialFind("expedition_cart_info", "icons_holder", "icons_list")
			if self.temp.ui.expedition_cart_item then
				self:fill_inventory_overview_part(inventory_holder, self.temp.ui.expedition_cart_item, "_expedition_cart_item_traveling_component")
			end

			for id, pin_data in pairs(self.config.travel_paths) do
				local pin_component = panel:SequentialFind(pin_data.realm .. "_pin")
				if pin_component then
					pin_component:SetState("inactive_normal")
				end
			end

			local item_value = expedition_state:SequentialFind("value_holder", "value")
			if item_value then
				item_value:SetText(self:get_trade_cart_default_value())
			end
		end
	end,

	fill_inventory_overview_part = function(self, inventory_holder, template, component_name_extension)
		inventory_holder:DestroyChildren()
		local cart_items = self:get_cart_items_stacked()
		for _, data in ipairs(cart_items) do
			local item = data.item
			local amount = data.amount
			if self.config.trade_items[item] then
				local entry = UIComponent(inventory_holder:CreateFromComponent(template:Address(), item .. component_name_extension))
				if entry then
					self:add_tooltip_item(entry, item)
					entry:SetImagePath(self.config.trade_items[item].ui_icon)
					local count = entry:SequentialFind("dy_count")
					if count then
						count:SetText(amount)
					end
				end
			else
				local entry = self:create_pool_ancillary_item_entry(item, inventory_holder, template, component_name_extension)
				local count = entry:SequentialFind("dy_count")
				if count then
					count:SetText(amount)
				end
			end
		end
	end,

	fill_starter_items_list = function(self, inventory_holder, template, component_name_extension)
		inventory_holder:DestroyChildren()
		local our_faction = cm:get_faction(self.persistent.active_faction)

		local all_items = {}

		-- faction specific starting items
		local items = self.config.faction_starting_items[self.persistent.faction_capital_realm] or {}
		for item, _ in pairs(items) do
			table.insert(all_items, item)
		end

		 -- items from owned regions
		for i = 0, our_faction:region_list():num_items() - 1 do
			local region = our_faction:region_list():item_at(i)
			local region_unlocked_items = self.config.starting_items_per_region[region:name()] or {}
			for _, item in ipairs(region_unlocked_items) do
				table_add_unique(all_items, item)
			end
		end

		for _, item in ipairs(all_items) do
			if self.config.trade_items[item] then
				local entry = UIComponent(inventory_holder:CreateFromComponent(template:Address(), item .. component_name_extension))
				if entry then
					entry:SetVisible(true) -- just in case
					self:add_tooltip_item(entry, item)
					entry:SetImagePath(self.config.trade_items[item].ui_icon)
				end
			end
		end
	end,

	fill_node_reached = function(self, panel)
		local realm_info = panel:SequentialFind("selected_realm_info")
		if realm_info then
			realm_info:SetVisible(false)
		end

		local expedition_state = panel:SequentialFind("expedition_state")
		if not expedition_state then
			script_error("Key component missing from panel!")
			return
		end
		expedition_state:SetVisible(true)

		local pin = panel:SequentialFind(self.persistent.current_location .. "_pin")
		if pin then
			pin:SetState("here")
		end
		local capital_pin = panel:SequentialFind("capital_pin")
		if capital_pin then
			capital_pin:SetInteractive(false)
		end

		local text = expedition_state:SequentialFind("expedition_txt")
		if text then
			text:SetState("finished")
		end

		local end_text = expedition_state:SequentialFind("finished_txt")
		if end_text then
			end_text:SetVisible(true)
		end

		local illustration = expedition_state:SequentialFind("illustration")
		if illustration then
			illustration:SetVisible(true)
		end

		local destination_info = expedition_state:SequentialFind("destination_info")
		if destination_info then
			destination_info:SetVisible(false)
		end

		local button_cancel_holder = expedition_state:SequentialFind("button_cancel_holder")
		if button_cancel_holder then
			button_cancel_holder:SetVisible(false)
		end

		local button_enter_bazaar_holder = expedition_state:SequentialFind("button_enter_bazaar_holder")
		if button_enter_bazaar_holder then
			button_enter_bazaar_holder:SetVisible(true)
		end

		local button_enter_capital_holder = expedition_state:SequentialFind("button_enter_capital_holder")
		if button_enter_capital_holder then
			button_enter_capital_holder:SetVisible(false)
		end

		local button_finish_holder = expedition_state:SequentialFind("button_finish_holder")
		if button_finish_holder then
			button_finish_holder:SetVisible(false)
		end

		local inventory_holder = expedition_state:SequentialFind("expedition_cart_info", "icons_holder", "icons_list")
		if self.temp.ui.expedition_cart_item then
			self:fill_inventory_overview_part(inventory_holder, self.temp.ui.expedition_cart_item, "_expedition_cart_item_component")
		end

		local item_value = expedition_state:SequentialFind("value_holder", "value")
		if item_value then
			item_value:SetText(self:get_trade_cart_default_value())
		end

		self:fill_trade_panel(panel)
	end,

	fill_select_region = function(self, panel)
		local expedition_finished_info = panel:SequentialFind("expedition_state")
		if expedition_finished_info then
			expedition_finished_info:SetVisible(false)
		end

		local market = panel:SequentialFind("selected_realm_info", "marketplace_items")
		if market then
			market:SetVisible(false)
		end

		local buying = panel:SequentialFind("selected_realm_info", "interested_in_items")
		if buying then
			buying:SetVisible(false)
		end

		local cart = panel:SequentialFind("selected_realm_info", "expedition_cart_info")
		if cart then
			cart:SetVisible(false)
		end

		local eta_holder = panel:SequentialFind("eta_holder")
		if eta_holder then
			eta_holder:SetVisible(false)
		end

		local button_holder = panel:SequentialFind("selected_realm_info", "button_holder")
		if button_holder then
			button_holder:SetVisible(false)
		end

		local realm_name = panel:SequentialFind("realm_name")
		local loc_key = self.config.trade_destinations[self.persistent.faction_capital_realm].localised_name
		if realm_name  and loc_key then
			realm_name:SetText(common.get_localised_string(loc_key), loc_key)
		end

		local start_item_list = panel:SequentialFind("selected_realm_info", "starter_items", "icons_list")
		local start_items = panel:SequentialFind("selected_realm_info", "starter_items")
		if self.temp.ui.starting_cart_item and start_item_list then
			self:fill_starter_items_list(start_item_list, self.temp.ui.starting_cart_item, "_selected_dest_item_comp")
			start_items:SetVisible(true)
		end

		local item_value = panel:SequentialFind("selected_realm_info", "value_holder", "value")
		if item_value then
			item_value:SetText(self:get_trade_cart_default_value())
		end
	end,

	fill_cash_out = function(self, panel)
		local expedition_state = panel:SequentialFind("expedition_state")
		if not expedition_state then
			script_error("Key component missing from panel!")
			return
		end
		expedition_state:SetVisible(false)

		local cash_out = panel:SequentialFind("cashing_out")
		if not cash_out then
			script_error("Key component missing from panel!")
			return
		end
		cash_out:SetVisible(true)

		local cash_out_button = cash_out:SequentialFind("cash_out_button_holder", "button_text_primary")
		if not cash_out_button then
			script_error("Key component missing from panel!")
			return
		end

		if self.temp.ui.cash_out_row_template then
			local container = panel:SequentialFind("cashing_out", "inventory", "list_box")
			local l_faction = cm:get_local_faction(true)
			local entry = nil
			for idx, data in ipairs(self.persistent.trade_cart.items) do
				local item = data.item
				if self.config.trade_items[item] then -- normal item
					entry = UIComponent(container:CreateFromComponent(self.temp.ui.cash_out_row_template:Address(), item .. "_cash_out_row_component"))
					if entry then
						entry:SetProperty("item_idx", idx)
						local dropdown = entry:SequentialFind("dropdown")
						if dropdown then
							dropdown:SetVisible(false)
						end
						local icon = entry:SequentialFind("dy_icon")
						if icon then
							icon:SetImagePath(self.config.trade_items[item].ui_icon)
						end

						local icon_parent = UIComponent(icon:Parent())
						if icon_parent then
							self:add_tooltip_item(icon_parent, item)
							icon_parent:SetDisabled(true)
							icon_parent:SetInteractive(true)
						end

						local button = entry:SequentialFind("convert_button")
						if button then
							if not self.config.trade_items[item].cash_out.mre then
								button:SetState("inactive")
							else
								local tooltip_temp_str = ""
								for k, v in ipairs(self.config.trade_items[item].cash_out.mre) do
									tooltip_temp_str = tooltip_temp_str .. v[1] .. " " .. v[2] .. "; "
								end
								self:add_tooltip_item(button, item, "mre")
							end
						end

						local button = entry:SequentialFind("settlement_button")
						if button then
							if not self.config.trade_items[item].cash_out.region_bundle then
								button:SetState("inactive")
							else
								entry:InterfaceFunction("create_region_list_dropdown", l_faction:region_list())
								if button:GetProperty("empty_no_provinces") ~= "" then
									button:SetState("inactive")
									self:add_tooltip(button, common.get_localised_string(self.config.no_regions_cashout_tooltip))
								else
								self:add_tooltip_item(button, item, "bundle")
							end
						end
						end

						local ancillary_button = entry:SequentialFind("transfer_button")
						if ancillary_button then
							if not self.config.trade_items[item].cash_out.ancillary then
								ancillary_button:SetState("inactive")
							else
								entry:InterfaceFunction("create_character_list_dropdown", l_faction:military_force_list())
								if ancillary_button:GetProperty("empty_no_chars") ~= "" and not self.config.allow_ancillary_without_generals then
									ancillary_button:SetState("inactive")
									self:add_tooltip(ancillary_button, common.get_localised_string(self.config.no_generals_cashout_tooltip))
								else
									self:add_tooltip_item(ancillary_button, self.config.trade_items[item].cash_out.ancillary, "ancillary")
								end
							end
						end

						local cash_out_options = 0
						local option = "" -- to be used only when options are equal to 1
						for k, _ in pairs(self.config.trade_items[item].cash_out) do
							if k == "ancillary" or k == "mre" or k == "region_bundle" then
								cash_out_options = cash_out_options + 1
								option = k
							end
						end

						if cash_out_options == 1 then
							local event_data = ";" .. item .. ";" .. idx ..";"
							if option == "ancillary" then
								CampaignUI.TriggerCampaignScriptEvent(l_faction:command_queue_index(), "hatshepsut_tranfer_item_as_ancillary_" .. event_data)
								self:cash_out_button_click(l_faction, "transfer_button", entry, item)
							elseif option == "region_bundle" then
								CampaignUI.TriggerCampaignScriptEvent(l_faction:command_queue_index(), "hatshepsut_item_convert_to_effect_bundle_" .. event_data)
								self:cash_out_button_click(l_faction, "settlement_button", entry, item)
							elseif option == "mre" then
								CampaignUI.TriggerCampaignScriptEvent(l_faction:command_queue_index(), "hatshepsut_sell_item_" .. event_data)
								self:cash_out_button_click(l_faction, "convert_button", entry, item)
							end
						end
					end
				else -- ancillary
					entry = self:create_pool_ancillary_item_entry(item, container, self.temp.ui.cash_out_row_template, "_cash_out_row_component")
					if entry then
						entry:SetProperty("item_idx", idx)
						local dropdown = entry:SequentialFind("dropdown")
						if dropdown then
							dropdown:SetVisible(false)
						end

						local icon = entry:SequentialFind("dy_icon")
						local icon_parent = UIComponent(icon:Parent())
						if icon_parent then
							self:add_tooltip_item(icon_parent, item)
						end

						local button = entry:SequentialFind("convert_button")
						if button then
							button:SetState("inactive")
						end

						button = entry:SequentialFind("settlement_button")
						if button then
							button:SetState("inactive")
						end

						button = entry:SequentialFind("transfer_button")
						if button then
							local event_data = ";" .. item .. ";" .. idx ..";"
							self:add_tooltip_item(button, item, "ancillary")
							CampaignUI.TriggerCampaignScriptEvent(l_faction:command_queue_index(), "hatshepsut_tranfer_item_as_ancillary_" .. event_data)
							self:cash_out_button_click(l_faction, "transfer_button", entry, item)
						end
					end
				end
			end
		end
		self:refresh_cash_out_button()
	end,

	fill_post_trade_node = function(self, panel)
		local realm_info = panel:SequentialFind("selected_realm_info")
		if realm_info then
			realm_info:SetVisible(false)
		end

		local trade_panel = panel:SequentialFind("trading")
		if trade_panel then
			trade_panel:SetVisible(false)
		end

		local expedition_state = panel:SequentialFind("expedition_state")
		if not expedition_state then
			script_error("Key component missing from panel!")
			return
		end
		expedition_state:SetVisible(true)

		for pin, _ in pairs(self.persistent.ui.visited_pins) do
			local pin_component = panel:SequentialFind(pin)
			if pin_component then
				pin_component:SetState("inactive")
			end
		end

		local pin = panel:SequentialFind(self.persistent.current_location .. "_pin")
		if pin then
			pin:SetState("here")
		end

		local capital_pin = panel:SequentialFind("capital_pin")
		if capital_pin then
			capital_pin:SetInteractive(true)
		end

		local text = expedition_state:SequentialFind("expedition_txt")
		if text then
			text:SetState("finished")
		end

		local end_text = expedition_state:SequentialFind("finished_txt")
		if end_text then
			end_text:SetVisible(true)
		end

		local illustration = expedition_state:SequentialFind("illustration")
		if illustration then
			illustration:SetVisible(true)
		end

		local destination_info = expedition_state:SequentialFind("destination_info")
		if destination_info then
			destination_info:SetVisible(false)
		end

		local button_cancel_holder = expedition_state:SequentialFind("button_cancel_holder")
		if button_cancel_holder then
			button_cancel_holder:SetVisible(false)
		end

		local button_enter_bazaar_holder = expedition_state:SequentialFind("button_enter_bazaar_holder")
		if button_enter_bazaar_holder then
			button_enter_bazaar_holder:SetVisible(false)
		end

		local button_enter_capital_holder = expedition_state:SequentialFind("button_enter_capital_holder")
		if button_enter_capital_holder then
			button_enter_capital_holder:SetVisible(false)
		end

		local button_finish_holder = expedition_state:SequentialFind("button_finish_holder")
		if button_finish_holder then
			button_finish_holder:SetVisible(false)
		end

		local inventory_holder = expedition_state:SequentialFind("expedition_cart_info", "icons_holder", "icons_list")

		if self.temp.ui.expedition_cart_item then
			self:fill_inventory_overview_part(inventory_holder, self.temp.ui.expedition_cart_item, "_expedition_cart_item_post_trade_component")
		end

		local item_value = expedition_state:SequentialFind("value_holder", "value")
		if item_value then
			item_value:SetText(self:get_trade_cart_default_value())
		end
	end,

	fill_trading_trade_cart = function(self, panel)
		local bundle_id = self.persistent.destination_data[self.persistent.current_location]
		local buying_bundle = self.config.trade_destinations[self.persistent.current_location].item_bundles[bundle_id].buying

		local trade_cart_holder = panel:SequentialFind("trading", "expedition_cart_holder", "cart_items")
		if self.temp.ui.trade_inventory_template then
			trade_cart_holder:DestroyChildren()

			local cart_items = self:get_cart_items_stacked()
			for _, data in ipairs(cart_items) do
				local item = data.item
				local amount = data.amount
				if self.config.trade_items[item] then
					local entry = UIComponent(trade_cart_holder:CreateFromComponent(self.temp.ui.trade_inventory_template:Address(), item .. self.config.ui.cart_bazaar_component_extension))
					if entry then
						local trade_change = 0
						if buying_bundle.trade_value_change[item] then
							trade_change = buying_bundle.trade_value_change[item]
						end

						local icon = entry:SequentialFind("dy_icon")
						if icon then
							icon:SetImagePath(self.config.trade_items[item].ui_icon)
						end

						local evaluation = self.config.trade_items[item].trade_value + trade_change
						local eval = entry:SequentialFind("evaluation")
						if eval then
							eval:SetText(evaluation)
							if trade_change > 0 then
								eval:SetState("positive")
							elseif trade_change < 0 then
								eval:SetState("negative")
							else
								eval:SetState("default")
							end
						end
						entry:SetProperty("trade_value", tostring(evaluation))
						entry:SetProperty("item_type", "cart_item")
						entry:SetProperty("amount", tostring(amount))

						local count = entry:SequentialFind("dy_count")
						if count then
							count:SetText(amount)
						end

						self:add_tooltip_item(entry, item)
					end
				else
					local entry = self:create_pool_ancillary_item_entry(item, trade_cart_holder, self.temp.ui.trade_inventory_template, self.config.ui.cart_bazaar_component_extension)
					if entry then
						local trade_change = 0
						if self.config.ancillaries_as_items.value_overrides[item] then
							trade_change = self.config.ancillaries_as_items.value_overrides[item]
						end

						local evaluation = self.config.ancillaries_as_items.default_trade_value + trade_change
						local eval = entry:SequentialFind("evaluation")
						if eval then
							eval:SetText(evaluation)
							if trade_change > 0 then
								eval:SetState("positive")
							elseif trade_change < 0 then
								eval:SetState("negative")
							else
								eval:SetState("default")
							end
						end
						entry:SetProperty("trade_value", tostring(evaluation))
						entry:SetProperty("item_type", "cart_item")
						entry:SetProperty("amount", tostring(amount))

						local count = entry:SequentialFind("dy_count")
						if count then
							count:SetText(amount)
						end
					end
				end
			end
		end
	end,

	fill_trading_merchant_cart = function(self, panel)
		local bundle_id = self.persistent.destination_data[self.persistent.current_location]
		local offering_bundle = self.config.trade_destinations[self.persistent.current_location].item_bundles[bundle_id].offering

		local merchant_cart_holder = panel:SequentialFind("trading", "merchant_holder", "cart_items")
		if self.temp.ui.trade_merchant_template then
			merchant_cart_holder:DestroyChildren()

			for idx, item_data in ipairs(offering_bundle.items) do
				local item = item_data[1]
				local amount = item_data[2]
				if amount > 0 then
					local entry = UIComponent(merchant_cart_holder:CreateFromComponent(self.temp.ui.trade_merchant_template:Address(), item .. self.config.ui.merchant_bazaar_component_extension))
					if entry then
						local trade_change = 0
						if offering_bundle.trade_value_change[item] then
							trade_change = offering_bundle.trade_value_change[item]
						end

						local icon = entry:SequentialFind("dy_icon")
						if icon then
							icon:SetImagePath(self.config.trade_items[item].ui_icon)
						end

						local evaluation = self.config.trade_items[item].trade_value + trade_change
						local eval = entry:SequentialFind("evaluation")
						if eval then
							eval:SetText(evaluation)
							if trade_change > 0 then
								eval:SetState("positive")
							elseif trade_change < 0 then
								eval:SetState("negative")
							else
								eval:SetState("default")
							end
						end
						entry:SetProperty("item_type", tostring("merchant_item"))
						entry:SetProperty("trade_value", tostring(evaluation))
						entry:SetProperty("amount", amount)
						local count = entry:SequentialFind("dy_count")
						if count then
							count:SetText(amount)
						end
						self:add_tooltip_item(entry, item)
					end
				end
			end
		end
	end,

	fill_trade_panel = function(self, panel)
		local trade_panel = panel:SequentialFind("trading")
		if not trade_panel then
			script_error("Missing key component from panel!")
			return
		end

		trade_panel:SetVisible(true)

		self.temp.trade_data.trade_changes = {}

		self:fill_trading_trade_cart(panel)
		self:fill_trading_merchant_cart(panel)
		local trade_value = trade_panel:SequentialFind("success_value")
		local trade_txt = trade_panel:SequentialFind("button_text_primary", "button_txt")
		if trade_value then
			self:refresh_trade_value(panel)
		end

		local location_data = self.config.trade_destinations[self.persistent.current_location]
		if not location_data then
			script_error("MISSING LOCATION DATA FOR " .. self.persistent.current_location)
			return
		end
		local info_txt = trade_panel:SequentialFind("info_txt")
		if info_txt then
			local choice = math.random(1, #location_data.bazaar_strings.good_deal)
			info_txt:SetText(common.get_localised_string(location_data.bazaar_strings.good_deal[choice]), location_data.bazaar_strings.good_deal[choice])
		end

		local button_cancel = trade_panel:SequentialFind("both_group_trading", "button_cancel")
		if #self.temp.trade_data.trade_changes == 0 then
			button_cancel:SetState("inactive")
		end
	end,

	add_trading_merchant_item = function(self, panel, item, evaluation, eval_state, item_type)
		local merchant_cart_holder = panel:SequentialFind("trading", "merchant_holder", "cart_items")
		if self.temp.ui.trade_merchant_template then
			local entry = nil
			if self.config.trade_items[item] then
				entry = UIComponent(merchant_cart_holder:CreateFromComponent(self.temp.ui.trade_merchant_template:Address(), item .. self.config.ui.merchant_bazaar_component_extension))
				if entry then

					local icon = entry:SequentialFind("dy_icon")
					if icon then
						icon:SetImagePath(self.config.trade_items[item].ui_icon)
					end

					local eval = entry:SequentialFind("evaluation")
					if eval then
						eval:SetText(evaluation)
						eval:SetState(eval_state)
					end
					entry:SetProperty("trade_value", tostring(evaluation))
					entry:SetProperty("item_type", item_type)
					self:add_tooltip_item(entry, item)
					return entry
				end
			else -- if not char ancillary or a trade item -> must be a pool ancillary
				entry = self:create_pool_ancillary_item_entry(item, merchant_cart_holder, self.temp.ui.trade_merchant_template, self.config.ui.merchant_bazaar_component_extension)
				if entry then
					local trade_change = 0
					if self.config.ancillaries_as_items.value_overrides[item] then
						trade_change = self.config.ancillaries_as_items.value_overrides[item]
					end

					local evaluation = self.config.ancillaries_as_items.default_trade_value + trade_change
					local eval = entry:SequentialFind("evaluation")
					if eval then
						eval:SetText(evaluation)
						if trade_change > 0 then
							eval:SetState("positive")
						elseif trade_change < 0 then
							eval:SetState("negative")
						else
							eval:SetState("default")
						end
					end
					entry:SetProperty("trade_value", tostring(evaluation))
					entry:SetProperty("item_type", "cart_item")
					return entry
				end
			end
			return nil
		end
	end,

	add_trading_cart_item = function(self, panel, item, evaluation, eval_state, item_type)
		local trade_cart_holder = panel:SequentialFind("trading", "expedition_cart_holder", "cart_items")
		if self.temp.ui.trade_inventory_template then
			local entry = nil
			if self.config.trade_items[item] then
				entry = UIComponent(trade_cart_holder:CreateFromComponent(self.temp.ui.trade_inventory_template:Address(), item .. self.config.ui.cart_bazaar_component_extension))
				if entry then

					local icon = entry:SequentialFind("dy_icon")
					if icon then
						icon:SetImagePath(self.config.trade_items[item].ui_icon)
					end

					local eval = entry:SequentialFind("evaluation")
					if eval then
						eval:SetText(evaluation)
						eval:SetState(eval_state)
					end

					entry:SetProperty("trade_value", tostring(evaluation))
					entry:SetProperty("item_type", item_type)
					self:add_tooltip_item(entry, item)
					return entry
				end
			else -- if not char ancillary or a trade item -> must be a pool ancillary
				entry = self:create_pool_ancillary_item_entry(item, trade_cart_holder, self.temp.ui.trade_inventory_template, self.config.ui.cart_bazaar_component_extension)
				if entry then
					local trade_change = 0
					if self.config.ancillaries_as_items.value_overrides[item] then
						trade_change = self.config.ancillaries_as_items.value_overrides[item]
					end

					local evaluation = self.config.ancillaries_as_items.default_trade_value + trade_change
					local eval = entry:SequentialFind("evaluation")
					if eval then
						eval:SetText(evaluation)
						if trade_change > 0 then
							eval:SetState("positive")
						elseif trade_change < 0 then
							eval:SetState("negative")
						else
							eval:SetState("default")
						end
					end
					entry:SetProperty("trade_value", tostring(evaluation))
					entry:SetProperty("item_type", "cart_item")
					return entry
				end
			end
			return nil
		end
	end,

	add_trade_click_listener = function(self, panel)
		--clicked on merchant item(buying)
		core:add_listener(
			"hatshepsut_panel_clicked_on_button_in_trade_panel_merchant",
			"ComponentLClickUp",
			function(context)
				return string.find(context.string, self.config.ui.merchant_bazaar_component_extension)
			end,
			function(context)
				local component = UIComponent(context.component)
				local item = context.string:gsub("%" .. self.config.ui.merchant_bazaar_component_extension, "")
				local local_faction_cqi = cm:get_local_faction(true):command_queue_index()
				local evaluation = 0
				if component:GetProperty("trade_value") ~= "" then
					evaluation = tonumber(component:GetProperty("trade_value"))
				end

				local eval_state = "default"
				local eval = component:SequentialFind("evaluation")
				if eval then
					eval_state = eval:CurrentState()
				end

				if component:GetProperty("item_type") == nil then
					script_error("TRADE ITEM MISSING property 'item_type'!")
					return
				end

				local item_type = component:GetProperty("item_type")

				local current_amount = tonumber(component:GetProperty("amount")) - 1
				if current_amount <= 0 then
					component:Destroy()
				else
					component:SetProperty("amount", current_amount)
					local count = component:SequentialFind("dy_count")
					if count then
						count:SetText(current_amount)
					end
				end

				local cart_entry = panel:SequentialFind("trading", "expedition_cart_holder", "cart_items", item .. self.config.ui.cart_bazaar_component_extension)
				local current_amount = 0
				if not cart_entry then
					cart_entry = self:add_trading_cart_item(panel, item, evaluation, eval_state, item_type)
					cart_entry:SetProperty("amount", 1)
					current_amount = 1
				else
					current_amount = tonumber(cart_entry:GetProperty("amount")) + 1
				end
				cart_entry:SetProperty("amount", current_amount)
				local count = cart_entry:SequentialFind("dy_count")
				if count then
					count:SetText(current_amount)
				end

				-- add buy
				if self.temp.trade_data.trade_changes[item] then
					self.temp.trade_data.trade_changes[item].amount = self.temp.trade_data.trade_changes[item].amount + 1
				else
					self.temp.trade_data.trade_changes[item] = {amount = 1, evaluation = evaluation }
				end

				self:refresh_trade_value(panel)
			end,
			true
		)

		--clicked on our item (selling)
		core:add_listener(
			"hatshepsut_panel_clicked_on_button_in_trade_panel_expedition_cart",
			"ComponentLClickUp",
			function(context)
				return string.find(context.string, self.config.ui.cart_bazaar_component_extension)
			end,
			function(context)
				local component = UIComponent(context.component)
				local item = context.string:gsub("%" .. self.config.ui.cart_bazaar_component_extension, "")
				local local_faction_cqi = cm:get_local_faction(true):command_queue_index()
				local evaluation = 0
				if component:GetProperty("trade_value") ~= "" then
					evaluation = tonumber(component:GetProperty("trade_value"))
				end

				local eval_state = "default"
				local eval = component:SequentialFind("evaluation")
				if eval then
					eval_state = eval:CurrentState()
				end

				if component:GetProperty("item_type") == nil then
					script_error("TRADE ITEM MISSING property 'item_type'!")
					return
				end

				local item_type = component:GetProperty("item_type")

				local current_amount = tonumber(component:GetProperty("amount")) - 1
				if current_amount <= 0 then
					component:Destroy()
				else
					component:SetProperty("amount", current_amount)
					local count = component:SequentialFind("dy_count")
					if count then
						count:SetText(current_amount)
					end
				end

				local cart_entry = panel:SequentialFind("trading", "merchant_holder", "cart_items", item .. self.config.ui.merchant_bazaar_component_extension)
				local current_amount = 0
				if not cart_entry then
					cart_entry = self:add_trading_merchant_item(panel, item, evaluation, eval_state, item_type)
					cart_entry:SetProperty("amount", 1)
					current_amount = 1
				else
					current_amount = tonumber(cart_entry:GetProperty("amount")) + 1
				end
				cart_entry:SetProperty("amount", current_amount)
				local count = cart_entry:SequentialFind("dy_count")
				if count then
					count:SetText(current_amount)
				end

				-- add sell
				if self.temp.trade_data.trade_changes[item] then
					self.temp.trade_data.trade_changes[item].amount = self.temp.trade_data.trade_changes[item].amount - 1
				else
					self.temp.trade_data.trade_changes[item] = {amount = -1, evaluation = evaluation }
				end

				self:refresh_trade_value(panel)
			end,
			true
		)
	end,

	fill_capital_clicked = function(self, panel)
		output("fill_capital_clicked: Capital clicked")

		local selected_realm_info = panel:SequentialFind("selected_realm_info")
		if selected_realm_info then
			selected_realm_info:SetVisible(true)
		end

		local market = panel:SequentialFind("selected_realm_info", "marketplace_items")
		if market then
			market:SetVisible(false)
		end

		local buying = panel:SequentialFind("selected_realm_info", "interested_in_items")
		if buying then
			buying:SetVisible(false)
		end

		local cart = panel:SequentialFind("selected_realm_info", "expedition_cart_info")
		if cart then
			cart:SetVisible(true)
		end

		local loc_name = self.config.trade_destinations[self.persistent.faction_capital_realm].localised_name
		local realm_name = panel:SequentialFind("selected_realm_info", "realm_name")
		if realm_name and loc_name then
			realm_name:SetText(common.get_localised_string(loc_name), loc_name)
		end

		local inventory_holder = panel:SequentialFind("selected_realm_info", "expedition_cart_info", "icons_list")
		if self.temp.ui.select_realm_cart_item_template then
			self:fill_inventory_overview_part(inventory_holder, self.temp.ui.select_realm_cart_item_template, "_component_expedition_cart_item")
		end

		local start_item_list = panel:SequentialFind("selected_realm_info", "starter_items", "icons_list")
		local start_items = panel:SequentialFind("selected_realm_info", "starter_items")
		if self.temp.ui.starting_cart_item and start_item_list then
			self:fill_starter_items_list(start_item_list, self.temp.ui.starting_cart_item, "_selected_dest_item_comp")
			start_items:SetVisible(true)
		end

		local item_value = selected_realm_info:SequentialFind("value_holder", "value")
		if item_value then
			item_value:SetText(self:get_trade_cart_default_value())
		end

		local button_holder = panel:SequentialFind("selected_realm_info", "button_holder")
		if not button_holder then
			script_error("Missing components from panel!")
		end

		local send_to_capital_button = button_holder:SequentialFind("send_to_capital_button")
		local send_expedition_button = button_holder:SequentialFind("send_expedition_button")
		local prepare_cart_button = button_holder:SequentialFind("prepare_cart_button")
		if not send_to_capital_button or not send_expedition_button or not prepare_cart_button then
			script_error("Missing components from panel!")
		end
		send_to_capital_button:SetVisible(true)
		send_expedition_button:SetVisible(false)
		prepare_cart_button:SetVisible(false)
	end,

	get_item_values_in_realms = function(self, item)
		local result = { who_wants_this = {}, who_sells_this = {}}
		for realm, bundle_id in pairs(self.persistent.destination_data) do
			local offering_bundle = self.config.trade_destinations[realm].item_bundles[bundle_id].offering
			local selling_item_value_change = offering_bundle.trade_value_change[item]
			if selling_item_value_change then
				result.who_sells_this[realm] = selling_item_value_change
			end

			local buying_bundle = self.config.trade_destinations[realm].item_bundles[bundle_id].buying
			local buying_item_value_change = buying_bundle.trade_value_change[item]
			if buying_item_value_change then
				result.who_wants_this[realm] = buying_item_value_change
			end
		end
		return result
	end,

	add_selected_destination_item_click_listener = function(self, panel)
		core:add_listener(
			"hatshepsut_panel_selected_destination_item_click_listener",
			"ComponentLClickUp",
			function(context)
				local condition = string.find(context.string, "_selected_dest_item_comp") and not self.persistent.expedition_traveling
				if condition then
					return true
				end
				for id, pin_data in pairs(self.config.travel_paths) do
					local pin_component = panel:SequentialFind(pin_data.realm .. "_pin")
					local colour = pin_component:SequentialFind("colour_variation")
					colour:SetVisible(false)
				end
				return false
			end,
			function(context)
				local clicked_item = context.string:gsub("%_selected_dest_item_comp", "")
				local item_value_data = self:get_item_values_in_realms(clicked_item)

				local uic = UIComponent(context.component)
				local uic_parent = UIComponent(uic:Parent())
				for i = 0, uic_parent:ChildCount() - 1 do
					local uic_child = UIComponent(uic_parent:Find(i))
					if uic_child:Id() ~= clicked_item then
						uic_child:SetState("active")
					end
				end

				uic:SetState("selected")

				local legend = panel:SequentialFind("legend")
				if legend then
					legend:SetVisible(true)
				end

				for id, pin_data in pairs(self.config.travel_paths) do
					local pin_component = panel:SequentialFind(pin_data.realm .. "_pin")
					local colour = pin_component:SequentialFind("colour_variation")
					colour:SetVisible(false)

					local pin_tooltip = pin_component:SequentialFind(pin_component:Id().."_tooltip")
					if item_value_data.who_wants_this[pin_data.realm] then
						local value_change = item_value_data.who_wants_this[pin_data.realm]
						if value_change > 0 then
							colour:SetState("red")
						else
							colour:SetState("red_green")
						end
						colour:SetVisible(true)
					end
					if item_value_data.who_sells_this[pin_data.realm] then
						local value_change = item_value_data.who_sells_this[pin_data.realm]
						if value_change < 0 then
							colour:SetState("green")
						else
							colour:SetState("red_green")
						end
						colour:SetVisible(true)
					end

					local buying_item = pin_tooltip:SequentialFind(clicked_item .. pin_data.realm .. "_selling_tooltip")
					if buying_item then
						local holder = UIComponent(buying_item:Parent())
						if holder then
							for i = 0, holder:ChildCount() - 1 do
								local uic_child = UIComponent(holder:Find(i))
								uic_child:SetState("default")
							end
						end
						buying_item:SetState("selected")
					else
						local buying_holder = pin_tooltip:SequentialFind("offers", "item_holder")
						if buying_holder then
							for i = 0, buying_holder:ChildCount() - 1 do
								local uic_child = UIComponent(buying_holder:Find(i))
								uic_child:SetState("default")
							end
						end
					end

					local selling_item = pin_tooltip:SequentialFind(clicked_item .. pin_data.realm .. "_buying_tooltip")
					if selling_item then
						local holder = UIComponent(selling_item:Parent())
						if holder then
							for i = 0, holder:ChildCount() - 1 do
								local uic_child = UIComponent(holder:Find(i))
								uic_child:SetState("default")
							end
						end
						selling_item:SetState("selected")
					else
						local selling_holder = pin_tooltip:SequentialFind("interested_in", "item_holder")
						if selling_holder then
							for i = 0, selling_holder:ChildCount() - 1 do
								local uic_child = UIComponent(selling_holder:Find(i))
								uic_child:SetState("default")
							end
						end
					end
				end
			end,
			true
		)
	end,

	fill_clicked_pin_data = function(self, panel, context_string)
		local destination_realm = context_string:gsub("%_pin", "")
		if destination_realm == "capital" and self.persistent.current_location ~= self.persistent.faction_capital_realm then
			self:fill_capital_clicked(panel)
			return
		elseif destination_realm == "capital" and self.persistent.current_location == self.persistent.faction_capital_realm then
			self:fill_select_region(panel)
			local trade_cart = panel:SequentialFind("cart_holder")
			trade_cart:SetVisible(false)
			return
		elseif destination_realm == "capital" and  self.persistent.current_location == self.persistent.faction_capital_realm then
			local trade_cart = panel:SequentialFind("cart_holder")
			if trade_cart then
				trade_cart:SetVisible(false)
			end
			return
		end

		if self.persistent.current_location == destination_realm and ((self.config.stop_at_every_node and self.persistent.expedition_entered_bazaar_on_route) or self.persistent.expedition_entered_destined_bazaar) then
			output("FILL POST TRADE DESTINATION")
			self:fill_post_trade_node(panel)
			return
		end

		local marketplace_items = panel:SequentialFind("selected_realm_info", "marketplace_items")
		if not marketplace_items then
			script_error("Missing component from panel!")
			return
		end
		local destination_config = self.config.trade_destinations[destination_realm]

		marketplace_items:SetVisible(true)
		local marketplace_items_holder = panel:SequentialFind("selected_realm_info", "marketplace_items", "icons_holder", "icons_list")
		marketplace_items_holder:DestroyChildren()

		local offering_bundle_id = self.persistent.destination_data[destination_realm]
		local offering_bundle = destination_config.item_bundles[offering_bundle_id].offering

		local items_from_regions = {}
		for region, items in pairs(self.config.starting_items_per_region) do
			for _, item in ipairs(items) do
				if not is_table(items_from_regions[item]) then
					items_from_regions[item] = {}
				end
				table.insert(items_from_regions[item], region)
			end
		end

		for idx, item_data in ipairs(offering_bundle.items) do
			local item = item_data[1]
			if idx <= destination_config.num_items_to_show then
				local entry = UIComponent(marketplace_items_holder:CreateFromComponent(self.temp.ui.offering_item_template:Address(), item .. "_selected_dest_item_comp"))
				if entry then
					self:add_tooltip_item(entry, item)
					entry:SetImagePath(self.config.trade_items[item].ui_icon)

					local counter = entry:SequentialFind("counter")
					if counter then
						counter:SetVisible(false)
					end

					local in_inventory = entry:SequentialFind("in_inventory")
					if in_inventory and items_from_regions[item] then
						in_inventory:SetVisible(true)

						local from_region_tooltip = entry:SequentialFind(in_inventory:Id().."_tooltip")
						if not from_region_tooltip then
							in_inventory:InterfaceFunction("set_tooltip_path", "UI/Campaign UI/tooltip_hatshepsut_produced_item.twui.xml")
							from_region_tooltip = entry:SequentialFind(in_inventory:Id().."_tooltip")
						end
						local tooltip_title = from_region_tooltip:SequentialFind("dy_title")
						if tooltip_title then
							local loc_name = self.config.trade_items[item].display_name
							tooltip_title:SetText(common.get_localised_string(loc_name), loc_name)
						end

						local region_list = from_region_tooltip:SequentialFind("regions_holder", "region_list")
						local region_list_item = from_region_tooltip:SequentialFind("regions_holder", "region_list", "region_template")
						local region_list_template = nil
						if region_list_item then
							region_list_template = self:get_child_template(region_list_item, entry:Id() .. item .. "_region_list_item")
						else
							region_list_template = self.temp.ui[entry:Id() .. item .. "_region_list_item"]
						end

						for _, region in ipairs(items_from_regions[item]) do
							local region_entry = UIComponent(region_list:CreateFromComponent(region_list_template:Address(), region .. "_from_region_tooltip_entry"))
							local region_interface = cm:get_region(region)
							region_entry:SetText(region_interface:localised_display_name())
						end
					end
				end
			end
		end

		local buying_items = panel:SequentialFind("selected_realm_info", "interested_in_items")
		if not buying_items then
			script_error("Missing component from panel!")
			return
		end

		buying_items:SetVisible(true)
		local buying_items_holder = panel:SequentialFind("selected_realm_info", "interested_in_items", "icons_holder", "icons_list")
		buying_items_holder:DestroyChildren()

		local buying_bundle_id = self.persistent.destination_data[destination_realm]
		local buying_bundle = destination_config.item_bundles[buying_bundle_id].buying

		for idx, item_data in ipairs(buying_bundle.items) do
			local item = item_data[1]
			if idx <= destination_config.num_items_to_show then
				local entry = UIComponent(buying_items_holder:CreateFromComponent(self.temp.ui.buying_item_template:Address(), item .. "_selected_dest_item_comp"))
				if entry then
					self:add_tooltip_item(entry, item)
					entry:SetImagePath(self.config.trade_items[item].ui_icon)

					local counter = entry:SequentialFind("counter")
					if counter then
						counter:SetVisible(false)
					end
				end
			end
		end

		local start_items = panel:SequentialFind("selected_realm_info", "starter_items")
		if start_items then
			start_items:SetVisible(false)
		end

		local button_holder = panel:SequentialFind("selected_realm_info", "button_holder")
		local send_to_capital_button = button_holder:SequentialFind("send_to_capital_button")
		local send_expedition_button = button_holder:SequentialFind("send_expedition_button")
		local prepare_cart_button = button_holder:SequentialFind("prepare_cart_button")
		if not button_holder or not send_to_capital_button or not send_expedition_button or not prepare_cart_button then
			script_error("Missing components from panel!")
		end

		if self.persistent.current_location == self.persistent.faction_capital_realm then
			button_holder:SetVisible(true)
			send_to_capital_button:SetVisible(false)
			send_expedition_button:SetVisible(false)
			prepare_cart_button:SetVisible(false)
		else
			button_holder:SetVisible(true)
			send_to_capital_button:SetVisible(false)
			send_expedition_button:SetVisible(true)
			prepare_cart_button:SetVisible(false)
		end

		if self.persistent.expedition_entered_destined_bazaar then
			local selected_realm_panel = panel:SequentialFind("selected_realm_info")
			local current_panel = panel:SequentialFind("expedition_state")
			if selected_realm_panel and current_panel then
				selected_realm_panel:SetVisible(true)
				current_panel:SetVisible(true)
			end
		end

		if self.persistent.current_location == self.persistent.faction_capital_realm then
			self:prepare_cart(panel)
		else
			local trade_cart = panel:SequentialFind("cart_holder")
			if trade_cart then
				trade_cart:SetVisible(false)
			end
		end
	end,

	add_on_click_pin_fill_destination = function(self, panel)
		core:add_listener(
			"hatshepsut_panel_clicked_on_node_fill_destination",
			"ComponentLClickUp",
			function(context)
				return string.find(context.string, "_pin") and not self.persistent.expedition_traveling and not self.persistent.expedition_returned_to_cash_out
			end,
			function(context)
				self:fill_clicked_pin_data(panel, context.string)
			end,
			true
		)
	end,

	add_on_button_click_listener = function(self, panel)
		core:add_listener(
			"hatshepsut_panel_clicked_on_button",
			"ComponentLClickUp",
			function(context)
				return string.match(context.string, "button")
			end,
			function(context)
				local l_faction = cm:get_local_faction(true)
				local local_faction_cqi = l_faction:command_queue_index()
				local uic = UIComponent(context.component)
				local uic_parent = UIComponent(uic:Parent())

				if context.string == "button_close" and uicomponent_descended_from(uic, hatshepsut_config.ui.panel_name) then
					panel:InterfaceFunction("close_panel")
					return
				end

				if context.string == "prepare_cart_button" then
					self:prepare_cart(panel)
					return
				end

				if context.string == "convert_button" and uic:CurrentState() ~= "selected"then
					local item = uic_parent:Id():gsub("%_cash_out_row_component", "")
					local idx = uic_parent:GetProperty("item_idx")
					local event_data = ";" .. item .. ";" .. idx ..";"
					CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "hatshepsut_sell_item_" .. event_data)
					self:cash_out_button_click(l_faction, "convert_button", uic_parent, item)
					return
				elseif context.string == "settlement_button" and uic:CurrentState() ~= "selected" then
					local item = uic_parent:Id():gsub("%_cash_out_row_component", "")
					local idx = uic_parent:GetProperty("item_idx")
					local event_data = ";" .. item .. ";" .. idx ..";"
					CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "hatshepsut_item_convert_to_effect_bundle_" .. event_data)
					self:cash_out_button_click(l_faction, "settlement_button", uic_parent, item)
					return
				elseif context.string == "transfer_button" and uic:CurrentState() ~= "selected"then
					local item = uic_parent:Id():gsub("%_cash_out_row_component", "")
					local idx = uic_parent:GetProperty("item_idx")
					local event_data = ";" .. item .. ";" .. idx ..";"
					CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "hatshepsut_tranfer_item_as_ancillary_" .. event_data)
					self:cash_out_button_click(l_faction, "transfer_button", uic_parent, item)
					return
				end

				if context.string == "button_text_primary" and uic_parent:Id() == "both_group_trading" then
					-- make deal
					create_confirmation_box(
						"confirm_deal_hatshepsut_confirmation",
						self.config.ui.confirm_deal_prompt or "",
						function()
							-- this should be 0. There is NO WAY to "buy" a character ancillary.
							if #self.temp.trade_data.merchant.character_ancillaries > 0 then
								script_error("There is a 'bought' character ancillary. This is not possible.")
								return
							end

							-- Trigger an event for making a deal.
							if (#self.temp.trade_data.our.items + #self.temp.trade_data.our.character_ancillaries + #self.temp.trade_data.merchant.items) > 0 then
								core:trigger_event("ScriptEventHatshepsutTradeMade", { faction = l_faction, realm_name = self.persistent.final_destination })
							end

							local sell_info = ";"
							for _, item in ipairs(self.temp.trade_data.our.items) do --what we sell
								sell_info = sell_info .. item[1] .. ";"
							end
							CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "hatshepsut_complete_trading_deal_selling_" .. sell_info)

							for _, item in ipairs(self.temp.trade_data.our.character_ancillaries) do --what we sell
								local data = ";" .. item[1] .. ";" .. item[3] .. ";"
								CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "hatshepsut_complete_trading_deal_selling_character_ancillary_" .. data)
							end

							local buy_info = ";"
							for _, item in ipairs(self.temp.trade_data.merchant.items) do -- what we buy
								buy_info = buy_info .. item[1] .. ";"
							end
							CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "hatshepsut_complete_trading_deal_buying_" .. buy_info)
							CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "hatshepsut_change_destination_bundle")
							CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "hatshepsut_add_post_trade_diplomacy")
							self:fill_post_trade_node(panel)
						end
					)

					return
				end

				--cancel trading button
				if context.string == "button_cancel" and uic_parent:Id() == "both_group_trading" then
					local trading = panel:SequentialFind("trading")
					trading:SetVisible(false)
					local info_txt = trading:SequentialFind("info_txt")
					if info_txt:Visible() then
						info_txt:SetVisible(false)
					end

					self.temp.trade_data.our = {items = {}, character_ancillaries = {}}
					self.temp.trade_data.merchant = {items = {}, character_ancillaries = {}}
					self:fill_node_reached(panel)
					return
				end

				if context.string == "button_text_primary" and uic_parent:Id() == "button_holder_send_expedition" then
					local cart_data = self.temp.cart_data
					local prompt = self.config.ui.send_expedition_prompt
					if #self.temp.cart_data.character_ancillaries > 0 then
						for _, data in ipairs(self.temp.cart_data.character_ancillaries) do
							if data["character_cqi"] then
								prompt = self.config.ui.confirm_ancillary_pick
								break
							end
						end
					end

					create_confirmation_box(
						"confirm_send_hatshepsut_confirmation",
						prompt or "",
						function()
							local character_ancillaries = {}
							local start_cart_info = ";"
							if self.temp.cart_data.items then
								for item, data in pairs(self.temp.cart_data.items) do -- what we buy
									for i = 1, data.amount do
										start_cart_info = start_cart_info .. item .. ";"
									end
								end
							end

							if self.temp.cart_data.character_ancillaries then
								for _, data in ipairs(self.temp.cart_data.character_ancillaries) do -- what we buy
									if data["key"] then
										CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "add_character_ancillary_to_cart;" .. data.key .. ";" .. data.character_cqi .. ";")
									end
								end
							end
							CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "hatshepsut_start_expedition" .. start_cart_info)
							panel:InterfaceFunction("close_panel")
						end,
						function()
							local expedition_state = panel:SequentialFind("expedition_state")
							expedition_state:SetVisible(false)

							local info = panel:SequentialFind("selected_realm_info")
							info:SetVisible(true)
							local trading = panel:SequentialFind("trading")
							trading:SetVisible(false)
							self:prepare_cart(panel)
							return
						end
					)
				end

				if context.string == "send_expedition_button" then
					create_confirmation_box(
						"confirm_send_expedition_hatshepsut",
						self.config.ui.send_expedition_prompt or "",
						function()
							CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "hatshepsut_start_expedition")
							panel:InterfaceFunction("close_panel")
						end,
						function()
							self:fill_post_trade_node(panel)
						end
					)
				end

				if context.string == "send_to_capital_button" then
					create_confirmation_box(
						"confirm_send_to_capital_hatshepsut",
						self.config.ui.send_to_capital_prompt or "",
						function()
							CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "hatshepsut_recall_expedition")
							panel:InterfaceFunction("close_panel")
						end
					)
				end

				if context.string == "button_recall" and uic_parent:Id() == "buttons_holder" then
					create_confirmation_box(
						"confirm_recall_expedition_hatshepsut",
						self.config.ui.send_to_capital_prompt or "",
						function()
							CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "hatshepsut_recall_expedition")
							panel:InterfaceFunction("close_panel")
						end
					)
				end

				if context.string == "button_cancel" and uic_parent:Id() == "buttons_holder" then
					create_confirmation_box(
						"confirm_cancel_expedition_hatshepsut",
						self.config.ui.cancel_expedition_prompt or "",
						function()
							CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "hatshepsut_cancel_expedition")
							panel:InterfaceFunction("close_panel")
							local turns_comp = core:get_ui_root():SequentialFind("fm_phar_hatchepsut_container", "turns_icon")
							turns_comp:SetVisible(false)
						end,
						function()
							self:fill_expedition_traveling(panel)
							local trading = panel:SequentialFind("trading")
							trading:SetVisible(false)
							return
						end
					)
				end

				if context.string == "button_text_primary" and uic_parent:Id() == "button_enter_bazaar_holder" then
					self:fill_trade_panel(panel)
					return
				end

				if context.string == "button_text_primary" and uic_parent:Id() == "button_enter_capital_holder" then
					CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "hatshepsut_enter_capital")
					self:fill_cash_out(panel)
					return
				end

				if context.string == "button_text_primary" and uic_parent:Id() == "button_finish_holder" then
					create_confirmation_box(
						"confirm_finish_hatshepsut",
						self.config.ui.finish_expedition_prompt or "",
						function()
							CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "hatshepsut_recall_expedition")
							panel:InterfaceFunction("close_panel")
						end
					)
				end

				if context.string == "button_text_primary" and uic_parent:Id() == "cash_out_button_holder" then
					create_confirmation_box(
						"confirm_cash_out_hatshepsut",
						self.config.ui.cash_out_prompt or "",
						function()
							self:complete_cash_out(local_faction_cqi, panel)
							panel:InterfaceFunction("close_panel")
						end,
						function()
							local trading = panel:SequentialFind("trading")
							trading:SetVisible(false)
						end
					)
				end
			end,
			true
		)
	end,

	add_on_click_route_listener = function(self, panel)
		core:add_listener(
			"hatshepsut_panel_clicked_on_node",
			"ComponentLClickUp",
			function(context)
				return string.find(context.string, "_pin") and not self.persistent.expedition_traveling
			end,
			function(context)
				local destination_realm = context.string:gsub("%_pin", "")
				local eta_holder = panel:SequentialFind("eta_holder")
				if not eta_holder then
					script_error("Missing component from panel!")
					return
				end

				if self.persistent.ui.selected_pin ~= context.string then
					for k, v in pairs (self.config.trade_destinations) do
						local other_pin = panel:SequentialFind(k .. "_pin")
						if other_pin then
							other_pin:SetState("active")
						end
					end
					local this_pin = UIComponent(context.component)
					if this_pin then
						this_pin:SetState("selected")
					end
					for pin, _ in pairs(self.persistent.ui.visited_pins) do
						local pin_component = panel:SequentialFind(pin)
						if pin_component then
							pin_component:SetState("inactive")
						end
					end
					local pin = panel:SequentialFind(self.persistent.current_location .. "_pin")
					if pin then
						pin:SetState("here")
					end
				end

				local start_node = nil
				local destination_node = nil
				local capital_node = nil

				for k, v in pairs(self.config.travel_paths) do
					if v.realm == self.persistent.current_location then
						start_node = k
					end
					if v.realm == destination_realm then
						destination_node = k
					end
					if v.realm == self.persistent.faction_capital_realm then
						capital_node = k
					end
				end

				if not start_node  then
					script_error("Missing start!")
					return
				end

				if destination_realm == "capital" and capital_node then
					local loc_name = self.config.trade_destinations[self.persistent.current_location].localised_name
					local realm_name = panel:SequentialFind("current_location_holder", "dy_name")
					if realm_name and loc_name then
						realm_name:SetText(common.get_localised_string(loc_name), loc_name)
					end
					eta_holder:SetVisible(true)
					local return_txt = eta_holder:SequentialFind("turns_to_return")
					if return_txt then
						return_txt:SetVisible(false)
					end

					local going_holder = eta_holder:SequentialFind("turns_to_reach_holder")
					local going_turns = eta_holder:SequentialFind("turns_to_reach_holder", "dy_number")
					if going_turns then
						if start_node == capital_node then
							going_holder:SetVisible(false)
							return
						end
						going_holder:SetVisible(true)
						local return_distance = self:find_path(start_node, capital_node)
						going_turns:SetText(tostring(return_distance))
					end
					return
				end

				local going_txt = eta_holder:SequentialFind("turns_to_reach_holder", "turns_txt")
				if going_txt then
					local loc_name = self.config.trade_destinations[destination_realm].localised_name
					local realm_name = common.get_localised_string(loc_name)
					going_txt:SetText(common.get_localised_string(self.config.ui.turns_to_reach_selected_destionation) .. " " .. realm_name, self.config.ui.turns_to_reach_selected_destionation)
				end

				local return_txt = eta_holder:SequentialFind("turns_to_return", "turns_txt")
				if return_txt then
					local loc_name = self.config.trade_destinations[destination_realm].localised_name
					local realm_name = common.get_localised_string(loc_name)
					return_txt:SetText(common.get_localised_string(self.config.ui.turns_to_return_to_capital_from_selected_destination) .. " " .. realm_name, self.config.ui.turns_to_reach_selected_destionation)
				end

				if not destination_node then
					script_error("Missing destination_node!")
					return
				end

				if start_node == destination_node then
					return
				end

				local loc_name = self.config.trade_destinations[self.config.travel_paths[destination_node].realm]
				local realm_name = panel:SequentialFind("realm_name")
				if realm_name and loc_name then
					realm_name:SetText(common.get_localised_string(loc_name.localised_name), loc_name.localised_name)
				end

				local info = start_node .. ";" .. destination_node
				local local_faction_cqi = cm:get_faction(cm:get_local_faction_name(true)):command_queue_index()
				CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "hatshepsut_find_path_" .. info)
			end,
			true
		)
	end,

	add_cart_click_listener = function(self, panel)
		core:add_listener(
			"hatshepsut_add_to_inventory_click",
			"ComponentLClickUp",
			function(context)
				return string.find(context.string, "_item_component")
			end,
			function(context)
				local item = context.string:gsub("%_item_component", "")
				local item_component = UIComponent(context.component)
				item_component:SetState("active")
				local local_faction_cqi = cm:get_faction(cm:get_local_faction_name(true)):command_queue_index()
				local cart_item_list = panel:SequentialFind("cart_holder", "cart", "list_clip", "list_box")
				if not cart_item_list then
					cart_item_list = core:get_ui_root():SequentialFind(hatshepsut_config.ui.panel_name, "cart_holder", "cart", "list_clip", "list_box")
				end

				if not self.temp.cart_data then
					self.temp.cart_data = {character_ancillaries = {}, items = {}}
				end

				local component_ancillary_type = (item_component:GetProperty("character_ancillary") ~= "" and "character_ancillary") or (item_component:GetProperty("from_ancillary_pool") ~= "" and "from_ancillary_pool")
				if component_ancillary_type  == "character_ancillary" then
					local char_ancillary_key = item_component:GetProperty("character_ancillary")
					local char_cqi = item_component:GetProperty("character_cqi")
					local filter = char_ancillary_key .. "_" .. char_cqi .. "_"
					local uid = item:gsub(filter, "") -- the item string is in format of <ancillary>_<cqi>_<uid> . here we strip the first part
					local entry = self:create_character_ancillary_item_entry(char_ancillary_key, cart_item_list, self.temp.ui.cart_item_template, uid .. "_cart_component", item_component:GetProperty("character_cqi"))

					if not self.temp.cart_data.character_ancillaries then
						self.temp.cart_data["character_ancillaries"] = {}
					end
					table.insert(self.temp.cart_data.character_ancillaries,{
						key = char_ancillary_key,
						character_cqi = char_cqi,
					})
					entry:SetProperty("cart_index", tostring(#self.temp.cart_data.character_ancillaries))

					item_component:Destroy()

					local start_button = panel:SequentialFind("cart_holder", "button_holder_send_expedition", "button_text_primary")
					if start_button then
						if cart_item_list:ChildCount() > 0 then
							start_button:SetState("active")
						else
							start_button:SetState("inactive")
						end
					end

					self:refresh_cart_cost()
				elseif component_ancillary_type  == "from_ancillary_pool" then
					local ancillary_key = item_component:GetProperty("from_ancillary_pool")

					local entry = cart_item_list:SequentialFind(ancillary_key .. "_cart_component_pool")
					if not entry then
						entry = self:create_pool_ancillary_item_entry(ancillary_key, cart_item_list, self.temp.ui.cart_item_template, "_cart_component_pool")
					end
					if entry then
						local count = entry:SequentialFind("dy_count")
						if not self.temp.cart_data.items then
							self.temp.cart_data["items"] = {}
						end
						if not self.temp.cart_data.items[ancillary_key] then
							self.temp.cart_data.items[ancillary_key] = {
								amount = 1,
								resources = {},
							}
							if count then
								count:SetText(self.temp.cart_data.items[ancillary_key].amount)
							end
							local eval = entry:SequentialFind("evaluation")
							if eval then
								eval:SetText(self.config.ancillaries_as_items.default_trade_value)
							end
							local current_amount = tonumber(item_component:GetProperty("current_amount"))
							if current_amount - 1 <= 0 then
								item_component:Destroy()
							else
								item_component:SetProperty("current_amount", current_amount - 1)
								local item_count = item_component:SequentialFind("dy_count")
								if item_count then
									item_count:SetText(current_amount - 1)
								end
							end
						else
							self.temp.cart_data.items[ancillary_key].amount = self.temp.cart_data.items[ancillary_key].amount + 1
							if count then
								count:SetText(self.temp.cart_data.items[ancillary_key].amount)
							end
							local current_amount = tonumber(item_component:GetProperty("current_amount"))
							if current_amount - 1 <= 0 then
								item_component:Destroy()
							else
								item_component:SetProperty("current_amount", current_amount - 1)
								local item_count = item_component:SequentialFind("dy_count")
								if item_count then
									item_count:SetText(current_amount - 1)
								end

								local eval = entry:SequentialFind("evaluation")
								if eval then
									eval:SetText(self.config.ancillaries_as_items.default_trade_value)
								end
							end
						end
					end
				else
					local entry = cart_item_list:SequentialFind(item .. "_cart_component")
					if not entry then
						entry = UIComponent(cart_item_list:CreateFromComponent(self.temp.ui.cart_item_template:Address(), item .. "_cart_component"))
					end

					if entry then
						local count = entry:SequentialFind("dy_count")
						if not self.temp.cart_data.items then
							self.temp.cart_data["items"] = {}
						end
						if not self.temp.cart_data.items[item] then
							self.temp.cart_data.items[item] = {
								amount = 1,
								resources = self.config.trade_items[item].cost
							}
							if count then
								count:SetText("1")
							end
						else
							self.temp.cart_data.items[item].amount = self.temp.cart_data.items[item].amount + 1
							if count then
								count:SetText(self.temp.cart_data.items[item].amount)
							end
						end
						self:add_tooltip_item(entry, item, "", true)

						local icon = entry:SequentialFind("dy_icon")
						if icon then
							icon:SetImagePath(self.config.trade_items[item].ui_icon)
						end

						local eval = entry:SequentialFind("evaluation")
						if eval then
							eval:SetText(self.config.trade_items[item].trade_value)
						end

						local frame = entry:SequentialFind("icon_assigned")
						if frame then
							frame:SetVisible(false)
						end
					end
				end

				local start_button = panel:SequentialFind("cart_holder", "button_holder_send_expedition", "button_text_primary")
				if start_button then
					if cart_item_list:ChildCount() > 0 then
						start_button:SetState("active")
					else
						start_button:SetState("inactive")
					end
				end

				self:refresh_cart_cost()
			end,
			true
		)

		core:add_listener(
			"hatshepsut_remove_from_inventory_click",
			"ComponentLClickUp",
			function(context)
				return string.find(context.string, "_cart_component")
			end,
			function(context)
				local item = context.string:gsub("%_cart_component", "")
				local item_component = UIComponent(context.component)
				local parent = UIComponent(item_component:Parent())
				local local_faction_cqi = cm:get_faction(cm:get_local_faction_name(true)):command_queue_index()
				local inventory_items_list = panel:SequentialFind("cart_holder", "inventory", "list_clip", "list_box")
				if not inventory_items_list then
					inventory_items_list = core:get_ui_root():SequentialFind(hatshepsut_config.ui.panel_name, "cart_holder", "inventory", "list_clip", "list_box")
				end

				local component_ancillary_type = (item_component:GetProperty("character_ancillary") ~= "" and "character_ancillary") or (item_component:GetProperty("from_ancillary_pool") ~= "" and "from_ancillary_pool")
				if component_ancillary_type  == "character_ancillary" then
					local char_ancillary_key = item_component:GetProperty("character_ancillary")
					local char_cqi = item_component:GetProperty("character_cqi")
					local filter = char_ancillary_key .. "_" .. char_cqi .. "_"
					local uid = item:gsub(filter, "") -- the item string is in format of <ancillary>_<cqi>_<uid> . here we strip the first part
					local entry = self:create_character_ancillary_item_entry(item_component:GetProperty("character_ancillary"), inventory_items_list, self.temp.ui.inventory_item_template, uid .. "_item_component", item_component:GetProperty("character_cqi"))
				elseif component_ancillary_type  == "from_ancillary_pool" then
					local ancillary_key = item_component:GetProperty("from_ancillary_pool")
					local entry = inventory_items_list:SequentialFind(ancillary_key .. "_item_component_pool")
					if entry then
						local count = entry:SequentialFind("dy_count")
						if count then
							count:SetText(tonumber(entry:GetProperty("current_amount")) + 1)
							entry:SetProperty("current_amount", tonumber(entry:GetProperty("current_amount")) + 1)
						end
					else
						entry = self:create_pool_ancillary_item_entry(item_component:GetProperty("from_ancillary_pool"), inventory_items_list, self.temp.ui.inventory_item_template, "_item_component_pool")
						local count = entry:SequentialFind("dy_count")
						if count then
							count:SetText(entry:GetProperty("current_amount"))
						end

						local eval = entry:SequentialFind("evaluation")
						if eval then
							eval:SetText(self.config.ancillaries_as_items.default_trade_value)
						end
					end
					item = ancillary_key
				end

				local start_button = panel:SequentialFind("cart_holder", "button_holder_send_expedition", "button_text_primary")
				if start_button then
					if parent:ChildCount() > 0 then
						start_button:SetState("active")
					else
						start_button:SetState("inactive")
					end
				end

				if component_ancillary_type  == "character_ancillary" then
					local idx = tonumber(item_component:GetProperty("cart_index"))
					self.temp.cart_data.character_ancillaries[idx] = {} -- set empty in order not to invalidate indices
					item_component:Destroy()
				else
					if self.temp.cart_data.items[item] then
						self.temp.cart_data.items[item].amount = self.temp.cart_data.items[item].amount - 1
						local count = item_component:SequentialFind("dy_count")
						if count then
							count:SetText(self.temp.cart_data.items[item].amount)
						end
						if self.temp.cart_data.items[item].amount <= 0 then
							item_component:Destroy()
							self.temp.cart_data.items[item] = nil
						end
					end
				end

				self:refresh_cart_cost()
			end,
			true
		)
	end,

	complete_cash_out = function(self, local_faction_cqi, panel)
		local cash_out_row_holder = panel:SequentialFind("cashing_out", "inventory", "listview", "list_box")
		if not cash_out_row_holder then
			script_error("Missing key component!")
			return
		end
		for i = 0, cash_out_row_holder:ChildCount() - 1 do
			local row = UIComponent(cash_out_row_holder:Find(i))
			local row_dropdown = row:SequentialFind("dropdown")
			if not row_dropdown then
				script_error("Missing row dropdown!")
				return
			end
			local item = row:Id():gsub("%_cash_out_row_component", "")
			local cqi_type = row:GetProperty("type")
			local cqi = row_dropdown:GetProperty("cqi")

			if self.persistent.trade_cart.items[i + 1].cash_out_for == "mre" then
				-- Skip 
			elseif cqi_type == "character" then
				local ancillary_key = ""
				if not self.config.trade_items[item] then
					ancillary_key = item
				else
					ancillary_key = self.config.trade_items[item].cash_out.ancillary
				end

				local character = cm:model():character_for_command_queue_index(tonumber(cqi))
				if character:is_null_interface() then
					output("Missing character for cqi " .. cqi .. " sent to pool")
					local event_data = ";" .. ancillary_key .. ";"
					CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "hatshepsut_complete_cash_out_pool_ancillary_" .. event_data)
				else
					local event_data = ";" .. ancillary_key .. ";" .. cqi ..";"
					CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "hatshepsut_complete_cash_out_ancillary_" .. event_data)
				end
			elseif cqi_type == "region" then
				local region = cm:model():region_for_command_queue_index(tonumber(cqi))
				if region:is_null_interface() then
					output("Missing region for cqi " .. cqi .. " do nothing")
				else
					local bundle = self.config.trade_items[item].cash_out.region_bundle
					local duration = self.config.trade_items[item].bundle_duration or self.config.default_item_effect_bundle_duration
					local event_data = ";" .. bundle .. ";" .. region:name() ..";" .. tostring(duration)
					CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "hatshepsut_complete_cash_out_region_bundle_" .. event_data)
				end
			end
		end

		CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "hatshepsut_complete_cash_out_mre_and_finalise")
	end,

	setup_trade_data = function(self, item_type_check, out_trade_data)
		local total = 0
		-- iterate our cart

		for item, data in pairs(self.temp.trade_data.trade_changes) do
			if item_type_check == "buying" and data.amount > 0 then
				for i = 1, data.amount do
					table.insert(out_trade_data.items, {item, data.evaluation})
				end
				total = total + (data.evaluation * data.amount)
			elseif item_type_check == "selling" and data.amount < 0 then
				for i = -1, data.amount, -1 do
					table.insert(out_trade_data.items, {item, data.evaluation})
				end
				total = total + (data.evaluation * (-1) * data.amount)
			end
		end
		return total
	end,

	refresh_trade_flavour_text = function(self, info_txt, value)
		local location_data = self.config.trade_destinations[self.persistent.current_location]
		if not location_data then
			script_error("MISSING LOCATION DATA FOR " .. self.persistent.current_location)
			return
		end

		if value >= 0 then
			local choice = math.random(1, #location_data.bazaar_strings.good_deal)
			info_txt:SetText(common.get_localised_string(location_data.bazaar_strings.good_deal[choice]), location_data.bazaar_strings.good_deal[choice])
		elseif value > self.config.trade_text_negative_max then
			local choice = math.random(1, #location_data.bazaar_strings.not_good_deal)
			info_txt:SetText(common.get_localised_string(location_data.bazaar_strings.not_good_deal[choice]), location_data.bazaar_strings.not_good_deal[choice])
		else
			local choice = math.random(1, #location_data.bazaar_strings.bad_deal)
			info_txt:SetText(common.get_localised_string(location_data.bazaar_strings.bad_deal[choice]), location_data.bazaar_strings.bad_deal[choice])
		end

		if not info_txt:VisibleFromRoot() then
			info_txt:SetVisible(true)
		end
	end,

	refresh_trade_value = function(self, panel)
		local trade_panel = panel:SequentialFind("trading")
		if not trade_panel then
			script_error("Missing key component from panel!")
			return
		end

		local our_cart_holder = panel:SequentialFind("trading", "expedition_cart_holder", "cart_items")
		local merchant_cart_holder = panel:SequentialFind("trading", "merchant_holder", "cart_items")

		if not merchant_cart_holder or not our_cart_holder then
			script_error("Missing key component from panel!")
		end

		self.temp.trade_data.our = {items = {}, character_ancillaries = {}}
		self.temp.trade_data.merchant = {items = {}, character_ancillaries = {}}

		local merchant_total = self:setup_trade_data("buying", self.temp.trade_data.merchant)

		local our_total = self:setup_trade_data("selling", self.temp.trade_data.our)

		local trade_value = trade_panel:SequentialFind("success_value")
		local trade_value_parent = UIComponent(trade_value:Parent())
		local trade_button = trade_panel:SequentialFind("button_text_primary")
		local trade_txt = trade_panel:SequentialFind("button_text_primary", "button_txt")
		local info_txt = trade_panel:SequentialFind("info_txt")
		local button_cancel = trade_panel:SequentialFind("both_group_trading", "button_cancel")

		if not button_cancel or not trade_value or not trade_value_parent or not trade_button or not info_txt then
			script_error("Missing key component from panel!")
		end

		self.temp.current_trade_value = 0

		if merchant_total == 0 and our_total == 0 then
			self:refresh_trade_flavour_text(info_txt, self.temp.current_trade_value)
			trade_value:SetText("0")
			trade_value_parent:SetState("positive")
			trade_button:SetState("active")
			trade_txt:SetText(common.get_localised_string(self.config.trade_panel_exit_deal_text), self.config.trade_panel_exit_deal_text)
			button_cancel:SetState("inactive")
			return
		end

		if our_total == 0 and merchant_total > 0 then
			self.temp.current_trade_value = self.temp.current_trade_value - merchant_total
			self:refresh_trade_flavour_text(info_txt, self.temp.current_trade_value)
			trade_value:SetText(tostring(self.temp.current_trade_value))
			trade_value_parent:SetState("negative")
			trade_button:SetState("inactive")
			button_cancel:SetState("active")
			trade_txt:SetText(common.get_localised_string(self.config.trade_panel_conclude_dealings_text), self.config.trade_panel_conclude_dealings_text)
			return
		end

		if merchant_total == 0 and our_total > 0 then
			self.temp.current_trade_value = self.temp.current_trade_value + our_total
			self:refresh_trade_flavour_text(info_txt, self.temp.current_trade_value)
			trade_value:SetText(tostring(self.temp.current_trade_value))
			trade_value_parent:SetState("positive")
			trade_button:SetState("inactive")
			button_cancel:SetState("active")
			trade_txt:SetText(common.get_localised_string(self.config.trade_panel_conclude_dealings_text), self.config.trade_panel_conclude_dealings_text)
			trade_button:SetTooltipText(common.get_localised_string(self.config.inactive_trade_button_giveaway_tooltip), self.config.inactive_trade_button_giveaway_tooltip, false)
			return
		end

		local diff = our_total - merchant_total
		output("TRADE FRACTION " .. diff .. " our " .. our_total .. " merchant " .. merchant_total)
		if diff >= 0 then
			trade_value_parent:SetState("positive")
			trade_button:SetState("active")
			trade_txt:SetText(common.get_localised_string(self.config.trade_panel_conclude_dealings_text), self.config.trade_panel_conclude_dealings_text)
		else
			trade_value_parent:SetState("negative")
			trade_txt:SetText(common.get_localised_string(self.config.trade_panel_conclude_dealings_text), self.config.trade_panel_conclude_dealings_text)
			trade_button:SetState("inactive")
		end
		button_cancel:SetState("active")
		self.temp.current_trade_value = diff
		trade_value:SetText(tostring(self.temp.current_trade_value))
		self:refresh_trade_flavour_text(info_txt, self.temp.current_trade_value)
	end,

	refresh_cart_cost = function(self)
		local resource_holder = core:get_ui_root():SequentialFind(hatshepsut_config.ui.panel_name, "cart_holder", "expedition_price_holder")
		resource_holder:DestroyChildren()
		local total_costs = {}
		local total_item_value = 0 --sum of initial trade item values
		if self.temp.cart_data.items then
			for item, data in pairs(self.temp.cart_data.items) do
				local trade_item = self.config.trade_items[item]
				if trade_item then
					total_item_value = total_item_value + (trade_item.trade_value * data.amount)
				else
					total_item_value = total_item_value + (self.config.ancillaries_as_items.default_trade_value * data.amount)
				end
				if data.resources and trade_item then
					for idx, resource_data in ipairs(data.resources) do
						local resource = resource_data[1]
						local value = resource_data[2]
						if total_costs[resource] then
							total_costs[resource] = total_costs[resource] + (value * data.amount)
						else
							total_costs[resource] = (value * data.amount)
						end
					end
				end
			end
		end

		if self.temp.cart_data.character_ancillaries then
			for idx, data in ipairs(self.temp.cart_data.character_ancillaries) do
				if data["key"] ~= nil then
					total_item_value = total_item_value + self.config.ancillaries_as_items.default_trade_value
				end
			end
		end

		local value_comp = core:get_ui_root():SequentialFind(hatshepsut_config.ui.panel_name, "cart_holder", "value_holder", "value")
		if value_comp then
			value_comp:SetText(total_item_value)
		end

		local price_check = {}
		for resource, amount in pairs(total_costs) do
			local entry = UIComponent(resource_holder:CreateFromComponent(self.temp.ui.expedition_cost_resource_template:Address(), resource .. "_expedition_cost_resource_component"))
			if entry then
				local price = entry:SequentialFind("price_txt")
				if price then
					price:SetText(amount)
				end
				local icon = entry:SequentialFind("resource_icon")
				if icon then
					icon:SetImagePath(self.config.ui.resource_icons[resource])
				end
			end
			table.insert(price_check, {resource, amount})
		end

		local start_button = core:get_ui_root():SequentialFind(hatshepsut_config.ui.panel_name, "cart_holder", "button_holder_send_expedition", "button_text_primary")
		if not start_button then
			script_error("Missing component from panel!")
			return
		end

		local cart_item_list = core:get_ui_root():SequentialFind(hatshepsut_config.ui.panel_name, "cart_holder", "cart", "list_clip", "list_box")

		if cart_item_list and cart_item_list:ChildCount() > 0 then
			start_button:SetState("active")
		else
			start_button:SetState("inactive")
		end

		if not cm:faction_can_afford_resource_cost(cm:get_faction(self.persistent.active_faction), price_check) then
			start_button:SetState("inactive")
		end

		local enough_items_text = core:get_ui_root():SequentialFind(hatshepsut_config.ui.panel_name, "cart_holder", "suggested_value_txt")
		if enough_items_text and cart_item_list then
			if cart_item_list:ChildCount() > 0 then
				if total_item_value < self.config.suggested_value_expedition_start then
					enough_items_text:SetState("below_suggested")
				else
					enough_items_text:SetState("above_suggested")
				end
			else
				enough_items_text:SetState("default")
			end
		end
	end,

	refresh_cash_out_button = function(self)
		local cash_out = core:get_ui_root():SequentialFind(hatshepsut_config.ui.panel_name, "cashing_out")
		local cash_out_button = cash_out:SequentialFind("cash_out_button_holder", "button_text_primary")
		local container = cash_out:SequentialFind("inventory", "list_box")

		local our_faction = cm:get_faction(self.persistent.active_faction)
		if our_faction:region_list():num_items() == 0 then
			--add notification tooltip, but allow cashout (per design)
			self:add_tooltip(cash_out_button, common.get_localised_string(self.config.no_regions_cashout_tooltip))
		end

		if #self.persistent.trade_cart.items == 0 then
			cash_out_button:SetState("active")
			return
		end

		for idx, data in ipairs(self.persistent.trade_cart.items) do
			if data.cash_out_for == "" then
				cash_out_button:SetState("inactive")
				return
			end
		end

		for idx, data in ipairs(self.persistent.trade_cart.ancillary_items) do
			if data.cash_out_for == "" then
				cash_out_button:SetState("inactive")
				return
			end
		end
		cash_out_button:SetState("active")

		-- check for the property of no chars and set tooltip.
		-- if an item has only ancillary setup, it wont be avaliabe and this wont be reached.
		for i = 0, container:ChildCount() - 1 do
			local row = UIComponent(container:Find(i))
			local button = row:SequentialFind("transfer_button")
			if button:GetProperty("empty_no_chars") ~= "" and not self.config.allow_ancillary_without_generals then
				self:add_tooltip(cash_out_button, common.get_localised_string(self.config.no_generals_cashout_tooltip))
			end
		end
	end,

	add_tooltip = function(self, component, text)
		component:SetTooltipText(text, "Script", true)
	end,

	prepare_cart = function(self, panel)
		local trade_cart = panel:SequentialFind("cart_holder")
		local cart_holder = trade_cart:SequentialFind("cart", "list_box")
		if not trade_cart or not cart_holder then
			script_error("Missing component from panel!")
			return
		end

		self.temp.cart_data = {character_ancillaries = {}, items = {}}
		cart_holder:DestroyChildren()

		self:refresh_cart_cost()
		trade_cart:SetVisible(true)
		self:setup_inventory(panel)
		local start_button = trade_cart:SequentialFind("button_holder_send_expedition", "button_text_primary")
		if start_button and cart_holder then
			if cart_holder:ChildCount() > 0 then
				start_button:SetState("active")
			else
				start_button:SetState("inactive")
			end
		end
	end,

	create_pool_ancillary_item_entry = function(self, ancillary_key, parent_list, template, component_name_extension)
		local icon_path = cm:model():get_ancillary_icon_from_record(ancillary_key)
		local entry = UIComponent(parent_list:CreateFromComponent(template:Address(), ancillary_key .. component_name_extension))
		if entry then
			entry:SetProperty("from_ancillary_pool", ancillary_key)
			entry:SetProperty("ancillary_icon", icon_path)
			entry:SetProperty("current_amount", 1)
			self:add_tooltip_ancillary_item(entry, ancillary_key)
			local icon = entry:SequentialFind("dy_icon")
			if icon then
				icon:SetImagePath(icon_path)
			else
				entry:SetImagePath(icon_path)
			end
			local frame = entry:SequentialFind("icon_assigned")
			if frame then
				frame:SetVisible(false)
			end
		end
		return entry
	end,

	create_character_ancillary_item_entry = function(self, ancillary_key, parent_list, template, component_name_extension, character_cqi)
		local character = cm:get_character_by_cqi(character_cqi)
		local icon_path = cm:model():get_ancillary_icon_from_record(ancillary_key)
		local entry_id = ancillary_key .. "_" .. tostring(character_cqi) .. "_" .. component_name_extension
		local entry = UIComponent(parent_list:CreateFromComponent(template:Address(), entry_id))
		if entry then
			entry:SetProperty("character_ancillary", ancillary_key)
			entry:SetProperty("character_cqi", tostring(character_cqi))
			entry:SetProperty("ancillary_icon", icon_path)
			self:add_tooltip_ancillary_item(entry, ancillary_key)
			local icon = entry:SequentialFind("dy_icon")
			if icon then
				icon:SetImagePath(icon_path)
			else
				entry:SetImagePath(icon_path)
			end
			local amount = entry:SequentialFind("counter")
			if amount then
				amount:SetVisible(false)
			end
			local frame = entry:SequentialFind("icon_assigned")
			if frame then
				frame:SetVisible(true)
			end
			local panel = core:get_ui_root():SequentialFind(hatshepsut_config.ui.panel_name)
			if not panel then
				script_error("Panel not found!")
				return
			end

			local eval = entry:SequentialFind("evaluation")
			if eval then
				local value = self.config.ancillaries_as_items.default_trade_value
				if self.config.ancillaries_as_items.value_overrides[ancillary_key] then
					value = self.config.ancillaries_as_items.value_overrides[ancillary_key]
				end
				eval:SetText(value)
			end
			CampaignUI.FillAgentCard(tonumber(character_cqi), panel:Id(), entry_id);
		end
		return entry
	end,

	setup_inventory = function(self, panel)
		local inventory_items_list = panel:SequentialFind("cart_holder", "inventory", "list_clip", "list_box")
		inventory_items_list:DestroyChildren()

		local our_faction = cm:get_faction(self.persistent.active_faction)

		local all_items = {}

		-- faction specific starting items
		local items = self.config.faction_starting_items[self.persistent.faction_capital_realm] or {}
		for item, _ in pairs(items) do
			all_items[item] = true
		end

		 -- items from owned regions
		for i = 0, our_faction:region_list():num_items() - 1 do
			local region = our_faction:region_list():item_at(i)
			local region_unlocked_items = self.config.starting_items_per_region[region:name()] or {}
			for _, item in ipairs(region_unlocked_items) do
				all_items[item] = true
			end
		end

		for item, _ in pairs(all_items) do
			local entry = UIComponent(inventory_items_list:CreateFromComponent(self.temp.ui.inventory_item_template:Address(), item .. "_item_component"))
			if entry then
				self:add_tooltip_item(entry, item, "", true)
				local icon = entry:SequentialFind("dy_icon")
				if icon then
					icon:SetImagePath(self.config.trade_items[item].ui_icon)
				end
				local amount = entry:SequentialFind("dy_count")
				if amount then
					amount:SetState("infinite")
				end
				local assigned = entry:SequentialFind("icon_assigned")
				if assigned then
					assigned:SetVisible(false)
				end
				local eval = entry:SequentialFind("evaluation")
				if eval then
					eval:SetText(self.config.trade_items[item].trade_value)
				end
			end
		end

		-- pool_ancillaries as items
		local show_from_pool = {}
		local pool_ancillaries = our_faction:ancillary_pool()
		for i = 0, pool_ancillaries:num_items() - 1 do
			local pool_anciilary = pool_ancillaries:item_at(i)
			if not self.config.excluded_ancillary_categories_from_trading[pool_anciilary:category()] then
				local key = pool_anciilary:ancillary_key()
				if show_from_pool[key] then
					show_from_pool[key] = show_from_pool[key] + 1
					local entry = inventory_items_list:SequentialFind(key .. "_item_component_pool")
					if entry then
						local amount = entry:SequentialFind("dy_count")
						if amount then
							amount:SetText(show_from_pool[key])
						end
						entry:SetProperty("current_amount", show_from_pool[key])
					end
				else
					local entry = UIComponent(inventory_items_list:CreateFromComponent(self.temp.ui.inventory_item_template:Address(), key .. "_item_component_pool"))
					if entry then
						show_from_pool[key] = 1
						entry:SetProperty("from_ancillary_pool", key)
						entry:SetProperty("ancillary_icon", pool_anciilary:icon_path())
						self:add_tooltip_ancillary_item(entry, key)

						local icon = entry:SequentialFind("dy_icon")
						if icon then
							icon:SetImagePath(pool_anciilary:icon_path())
						end
						local amount = entry:SequentialFind("dy_count")
						if amount then
							amount:SetText(show_from_pool[key])
						end
						local frame = entry:SequentialFind("icon_assigned")
						if frame then
							frame:SetVisible(false)
						end
						entry:SetProperty("current_amount", show_from_pool[key])

						local eval = entry:SequentialFind("evaluation")
						if eval then
							eval:SetText(self.config.ancillaries_as_items.default_trade_value)
						end
					end
				end
			end
		end

		--character ancillaries as items
		local char_list = our_faction:character_list()
		for i = 0, char_list:num_items() - 1 do
			local character = char_list:item_at(i)
			local can_use_character_ancillaries = not character:character_details():is_civilian() and not character:is_replaced_starting_general()
			if can_use_character_ancillaries then
				local char_ancillaries = character:ancillaries()
				for i = 0, char_ancillaries:num_items() - 1 do
					local anc = char_ancillaries:item_at(i)
					if not self.config.excluded_ancillary_categories_from_trading[anc:category()] then
						local key = anc:ancillary_key()
						local entry_id = key .. "_" .. tostring(character:command_queue_index()) .. "_" .. i .. "_item_component"
						local entry = UIComponent(inventory_items_list:CreateFromComponent(self.temp.ui.inventory_item_template:Address(), entry_id))
						if entry then
							entry:SetProperty("character_ancillary", key)
							entry:SetProperty("character_cqi", tostring(character:command_queue_index()))
							entry:SetProperty("ancillary_icon", anc:icon_path())
							self:add_tooltip_ancillary_item(entry, key)
							local icon = entry:SequentialFind("dy_icon")
							if icon then
								icon:SetImagePath(anc:icon_path())
							end
							local amount = entry:SequentialFind("counter")
							if amount then
								amount:SetVisible(false)
							end
							local frame = entry:SequentialFind("icon_assigned")
							if frame then
								frame:SetVisible(true)
							end

							local eval = entry:SequentialFind("evaluation")
							if eval then
								local value = self.config.ancillaries_as_items.default_trade_value
								if self.config.ancillaries_as_items.value_overrides[key] then
									value = self.config.ancillaries_as_items.value_overrides[key]
								end
								eval:SetText(value)
							end
							CampaignUI.FillAgentCard(tonumber(character:command_queue_index()), panel:Id(), entry_id);
						end
					end
				end
			end
		end
	end,

	add_tooltip_ancillary_item = function(self, item_component, ancillary)
		local item_tooltip = item_component:SequentialFind(item_component:Id() .. "_tooltip")
		if not item_tooltip then
			item_component:InterfaceFunction("set_tooltip_path", "UI/Campaign UI/tooltip_hatshepsut_item.twui.xml")
			item_tooltip = item_component:SequentialFind(item_component:Id() .. "_tooltip")
		end

		if item_component:GetProperty("character_cqi") ~= "" then
			local icon = item_component:SequentialFind("icon_assigned")
			if icon then
				local character = cm:get_character_by_cqi(tonumber(item_component:GetProperty("character_cqi")))
				icon:SetTooltipText(character:onscreen_name(), "Script", true)
			end
		end

		local resource_cost_holder = item_tooltip:SequentialFind("resource_cost_holder")
		if resource_cost_holder then
			resource_cost_holder:SetVisible(false)
		end

		local ancillary_cco = cco("CcoAncillaryRecord", ancillary)

		local item_name = item_tooltip:SequentialFind("ancillary_header", "dy_title")
		if item_name then
			item_name:SetText(ancillary_cco:Call("OnscreenName()"), "Script")
		end

		local item_image = item_tooltip:SequentialFind("ancillary_header", "icon_ancillary")
		if item_image then
			item_image:SetImagePath(ancillary_cco:Call("IconPath()"))
		end

		local item_type = item_tooltip:SequentialFind("ancillary_header", "dy_type")
		if item_type then
			item_type:SetText(ancillary_cco:Call("RarityName()"), "Script")
		end

		local category_section = item_tooltip:SequentialFind("province_bundle")
		if category_section then
			category_section:SetVisible(false)
		end

		local resource_section = item_tooltip:SequentialFind("resource_bundle")
		if resource_section then
			resource_section:SetVisible(false)
		end

		local cost_holder = item_tooltip:SequentialFind("cost_holder")
		if cost_holder then
			cost_holder:SetVisible(false)
		end

		local flavour_comp = item_tooltip:SequentialFind("list_bottom", "dy_flavor")
		if flavour_comp then
			flavour_comp:SetText(ancillary_cco:Call("ColourText()"), "Script")
		end

		local ancillary_section = item_tooltip:SequentialFind("ancillary_bundle")
		if ancillary_section then
			ancillary_section:SetContextObject(ancillary_cco)
			local top_sep = item_tooltip:SequentialFind("sep_or_template_top")
			local bot_sep = item_tooltip:SequentialFind("sep_or_template_bot")
			bot_sep:SetVisible(false)
			top_sep:SetVisible(false)
		end
	end,

	-- optional_show_only_type can be "mre", "bundle", "ancillary"
	add_tooltip_item = function(self, item_component, item, optional_show_only_type, show_cost)
		if not self.config.trade_items[item] then
			self:add_tooltip_ancillary_item(item_component, item)
			return
		end

		local alerts = {}

		local item_tooltip = item_component:SequentialFind(item_component:Id() .. "_tooltip")
		if not item_tooltip then
			item_component:InterfaceFunction("set_tooltip_path", "UI/Campaign UI/tooltip_hatshepsut_item.twui.xml")
			item_tooltip = item_component:SequentialFind(item_component:Id() .. "_tooltip")
		end

		local item_name = item_tooltip:SequentialFind("ancillary_header", "dy_title")
		if item_name then
			local loc_name = self.config.trade_items[item].display_name
			item_name:SetText(common.get_localised_string(loc_name), loc_name)
		end

		local item_image = item_tooltip:SequentialFind("ancillary_header", "icon_ancillary")
		if item_image then
			item_image:SetImagePath(self.config.trade_items[item].ui_icon)
		end

		local item_type = item_tooltip:SequentialFind("ancillary_header", "dy_type")
		if item_type then
			local loc_name = self.config.trade_items[item].item_description
			if loc_name then
				item_type:SetText(common.get_localised_string(loc_name), loc_name)
			end
		end

		local flavour_comp = item_tooltip:SequentialFind("list_bottom", "dy_flavor")
		local item_flavour = self.config.trade_items[item].item_flavour
		if flavour_comp and item_flavour then
			flavour_comp:SetText(common.get_localised_string(item_flavour), item_flavour)
		end

		local cash_out_data = self.config.trade_items[item].cash_out
		local ancillary_section = item_tooltip:SequentialFind("ancillary_bundle")
		if cash_out_data.ancillary then
			ancillary_section:SetVisible(true)
			if ancillary_section then
				ancillary_section:SetContextObject(cco("CcoAncillaryRecord", cash_out_data.ancillary))
			end
		else
			ancillary_section:SetVisible(false)
		end

		local category_section = item_tooltip:SequentialFind("province_bundle")
		if cash_out_data.region_bundle then
			category_section:SetVisible(true)
			category_section:SetContextObject(cco("CcoEffectBundle", cash_out_data.region_bundle))

			local duration = category_section:SequentialFind("effect_duration", "turns_counter")
			if duration then
				duration:SetText(self.config.trade_items[item].bundle_duration or self.config.default_item_effect_bundle_duration)
			end
		else
			category_section:SetVisible(false)
		end

		local resource_section = item_tooltip:SequentialFind("resource_bundle")
		if cash_out_data.mre and cash_out_data.resource_bundle then
			local custom_effect_bundle = cm:create_new_custom_effect_bundle(cash_out_data.resource_bundle)
			if not custom_effect_bundle:is_null_interface() then
				for _, resource_item in ipairs(cash_out_data.mre) do
					local resource = resource_item[1]
					local amount = resource_item[2]
					if #resource_item > 2 then -- can be removed after full configuration
						local resource_effect = resource_item[3]
						custom_effect_bundle:add_effect(resource_effect, self.config.item_mre_cashout_effect_scope, amount)
					end
				end
				resource_section:InterfaceFunction("set_cco_effect_bundle_from_custom_bundle", custom_effect_bundle)
				resource_section:SetVisible(true)
			end
		else
			resource_section:SetVisible(false)
		end

		local resource_cost_holder = item_tooltip:SequentialFind("resource_cost_holder")
		local resource_cost_template = resource_cost_holder:SequentialFind("resource_cost_template")
		if resource_cost_template then
			self:get_child_template(resource_cost_template, "resource_cost_template")
		end

		local cost = self.config.trade_items[item].cost
		if #cost == 0 or not show_cost then
			local cost_holder = item_tooltip:SequentialFind("cost_holder")
			if cost_holder then
				cost_holder:SetVisible(false)
			end
		else
			resource_cost_holder:DestroyChildren()
			for _, data in ipairs(cost) do
				local resource = data[1]
				local amount = data[2]
				local entry = UIComponent(resource_cost_holder:CreateFromComponent(self.temp.ui.resource_cost_template:Address(), item .. resource .. "_tooltip_cost_component"))
				if entry then
					local price = entry:SequentialFind("price_txt")
					if price then
						price:SetText(amount)
					end
					local icon = entry:SequentialFind("resource_icon")
					if icon then
						icon:SetImagePath(self.config.ui.resource_icons[resource])
					end
				end
			end
		end

		local top_sep = item_tooltip:SequentialFind("sep_or_template_top")
		local bot_sep = item_tooltip:SequentialFind("sep_or_template_bot")

		if cash_out_data.mre and cash_out_data.region_bundle and cash_out_data.ancillary then
			bot_sep:SetVisible(true)
			top_sep:SetVisible(true)
		elseif cash_out_data.mre and cash_out_data.region_bundle and not cash_out_data.ancillary then
			bot_sep:SetVisible(false)
			top_sep:SetVisible(true)
		elseif not cash_out_data.mre and cash_out_data.region_bundle and cash_out_data.ancillary then
			bot_sep:SetVisible(true)
			top_sep:SetVisible(false)
		elseif cash_out_data.mre and not cash_out_data.region_bundle and cash_out_data.ancillary then
			bot_sep:SetVisible(true)
			top_sep:SetVisible(false)
		else
			bot_sep:SetVisible(false)
			top_sep:SetVisible(false)
		end

		if optional_show_only_type ~= "" then
			bot_sep:SetVisible(false)
			top_sep:SetVisible(false)
			if optional_show_only_type == "mre" then
				category_section:SetVisible(false)
				ancillary_section:SetVisible(false)
			elseif optional_show_only_type == "bundle" then
				resource_section:SetVisible(false)
				ancillary_section:SetVisible(false)
			elseif optional_show_only_type == "ancillary" then
				resource_section:SetVisible(false)
				category_section:SetVisible(false)
			end
		end

		local faction = cm:get_faction(cm:get_local_faction_name(true))
		local faction_leader = faction and faction:faction_leader() or nil
		local leader_force = faction_leader and not faction_leader:is_null_interface() and faction_leader:military_force()
		local is_horde_faction = leader_force and not leader_force:is_null_interface() and leader_force:is_horde()

		if category_section:Visible() and is_horde_faction then
			table_add_unique(alerts, common.get_localised_string(self.config.province_effects_horde_alert))
		end

		if #alerts > 0 then
			local alert_comp = item_tooltip:SequentialFind("dy_alert")
			alert_comp:SetText(table.concat(alerts, "\n"))
			alert_comp:SetVisible(true)
		end
	end,

	remove_item_from_mre_cash_out = function(self, item)
		if self.temp.cash_out_data.mre_data[item] then
			self.temp.cash_out_data.mre_data[item].amount = self.temp.cash_out_data.mre_data[item].amount - 1
			if self.temp.cash_out_data.mre_data[item].amount <= 0 then
				self.temp.cash_out_data.mre_data[item] = nil
			end
		end
	end,

	add_item_for_mre_cash_out = function(self, item)
		if not self.temp.cash_out_data.mre_data[item] and self.config.trade_items[item].cash_out.mre then
			self.temp.cash_out_data.mre_data[item] = {
				amount = 1,
				resources = self.config.trade_items[item].cash_out.mre
			}
		else
			self.temp.cash_out_data.mre_data[item].amount = self.temp.cash_out_data.mre_data[item].amount + 1
		end
	end,

	check_item_cash_out_for = function (self, item, cash_out_type)
		if self.config.trade_items[item] and self.config.trade_items[item].cash_out[cash_out_type] then
			return true
		end
		return false
	end,

	cash_out_button_click = function(self, local_faction, clicked, entry, item)
		local transfer = entry:SequentialFind("transfer_button")
		local sell = entry:SequentialFind("convert_button")
		local bundle_btn = entry:SequentialFind("settlement_button")
		local dropdown = entry:SequentialFind("dropdown")

		if transfer and sell and bundle_btn and dropdown then
			if not self.temp.cash_out_data.mre_data then
				self.temp.cash_out_data.mre_data = {}
			end

			if clicked == transfer:Id() then -- ancillary
				if self:check_item_cash_out_for(item, "region_bundle") then
					entry:InterfaceFunction("create_region_list_dropdown", local_faction:region_list())
					if bundle_btn:GetProperty("empty_no_provinces") ~= "" then
						bundle_btn:SetState("inactive")
					else
						bundle_btn:SetState("active")
					end
				end
				if self:check_item_cash_out_for(item, "mre") then
					sell:SetState("active")
				end
				transfer:SetState("selected")
				dropdown:SetVisible(true)
				entry:InterfaceFunction("create_character_list_dropdown", local_faction:military_force_list())
				self:remove_item_from_mre_cash_out(item)
			elseif clicked == sell:Id() and string.match(sell:CurrentState(),"selected") then
				sell:SetState("selected")
			elseif clicked == sell:Id() and not string.match(sell:CurrentState(),"selected") then	-- mre
				dropdown:SetVisible(false)
				if self:check_item_cash_out_for(item, "region_bundle") then
					entry:InterfaceFunction("create_region_list_dropdown", local_faction:region_list())
					if bundle_btn:GetProperty("empty_no_provinces") ~= "" then
						bundle_btn:SetState("inactive")
					else
						bundle_btn:SetState("active")
					end
				end
				if self:check_item_cash_out_for(item, "ancillary") then
					entry:InterfaceFunction("create_character_list_dropdown", local_faction:military_force_list())
					if transfer:GetProperty("empty_no_chars") ~= "" and not self.config.allow_ancillary_without_generals then
						transfer:SetState("inactive")
					else
						transfer:SetState("active")
					end
				end
				sell:SetState("selected")
				self:add_item_for_mre_cash_out(item)
			else
				if self:check_item_cash_out_for(item, "mre") then
					sell:SetState("active")
				end
				if self:check_item_cash_out_for(item, "ancillary") then
					entry:InterfaceFunction("create_character_list_dropdown", local_faction:military_force_list())
					if transfer:GetProperty("empty_no_chars") ~= "" and not self.config.allow_ancillary_without_generals then
						transfer:SetState("inactive")
					else
						transfer:SetState("active")
					end
				end
				bundle_btn:SetState("selected")
				dropdown:SetVisible(true)
				entry:InterfaceFunction("create_region_list_dropdown", local_faction:region_list())
				self:remove_item_from_mre_cash_out(item)
			end
			self:refresh_cash_out_button()
			self:refresh_cash_out_reward()
		end
	end,

	refresh_cash_out_reward = function(self)
		local resource_holder = core:get_ui_root():SequentialFind(hatshepsut_config.ui.panel_name, "cashing_out", "gained_resources_holder")
		resource_holder:DestroyChildren()
		local total_costs = {}
		for item, data in pairs(self.temp.cash_out_data.mre_data) do
			if data.resources then
				for id, resource_data in pairs(data.resources) do
					if total_costs[resource_data[1]] then
						total_costs[resource_data[1]] = total_costs[resource_data[1]] + (resource_data[2] * data.amount)
					else
						total_costs[resource_data[1]] = (resource_data[2] * data.amount)
					end
				end
			end
		end

		for resource, amount in pairs(total_costs) do
			output("Adding resource " .. resource .. " amount " .. amount)
			local entry = UIComponent(resource_holder:CreateFromComponent(self.temp.ui.cash_out_resource_template:Address(), resource .. "_resource_gained_component"))
			if entry then
				local price = entry:SequentialFind("price_txt")
				if price then
					price:SetText(amount)
				end
				local icon = entry:SequentialFind("resource_icon")
				if icon then
					icon:SetImagePath(self.config.ui.resource_icons[resource])
				end
			end
		end
	end,

	node_reached = function(self)
		-- trigger event ph
		output("NODE REACHED")
		self.persistent.current_location =  self.config.travel_paths[self.persistent.path[1]].realm

		-- check if destination_reached
		if self.persistent.current_location == self.persistent.final_destination then
			self:destination_reached()
			return
		end
		self.persistent.node_reached = self.persistent.path[1];
		out("WE HAVE REACHED NODE " .. self.persistent.node_reached)
		self.persistent.current_segment_duration = self.config.travel_paths[self.persistent.path[1]].avaliable_destinations[self.persistent.path[2]]
		table.remove(self.persistent.path, 1)
		self.persistent.selected_destination = self.config.travel_paths[self.persistent.path[1]].realm
		self.persistent.ui.selected_pin = self.persistent.selected_destination .. "_pin"

		if self.config.stop_at_every_node then
			self.persistent.expedition_entered_bazaar_on_route = false

			cm:show_message_event(self.persistent.active_faction,
				self.config.events.node_on_route_reached.title_key,
				self.config.events.node_on_route_reached.secondary_detail,
				self.config.events.node_on_route_reached.text, true,
				self.config.events.node_on_route_reached.event_pic_index, nil, nil, true)
		end
	end,

	node_reached_returning = function(self)
		output("NODE REACHED RETURNING " .. self.persistent.path[1])
		self.persistent.current_location = self.config.travel_paths[self.persistent.path[1]].realm
		self.persistent.current_segment_duration = self.config.travel_paths[self.persistent.path[1]].avaliable_destinations[self.persistent.path[2]]
		table.remove(self.persistent.path, 1)

		-- used for campaign interventions.
		core:trigger_event("ScriptedEventHatshepsutExpeditionReturned")
	end,

	destination_reached = function(self)
		output("DESTINATION REACHED")
		self.persistent.current_location = self.persistent.selected_destination
		self.persistent.current_segment_duration = 0
		self.persistent.expedition_traveling = false
		self.persistent.ui.visited_pins[self.persistent.current_location .. "_pin"] = true
		self.persistent.path = {}

		local destination_config = self.config.trade_destinations[self.persistent.final_destination]
		cm:add_event_feed_event(
			self.config.events.expedition_arrived_event.event_key,
			self.persistent.active_faction,
			0,
			destination_config.localised_name or ""
		)

		-- used for campaign interventions.
		core:trigger_event("ScriptedEventHatshepsutDestinationReached")
	end,

	cancel_expedition = function(self, return_turn_number)
		self.persistent.canceled = true
		self:return_expedition()
	end,

	recall_expedition = function(self, return_turn_number)
		self.persistent.expedition_returning = true
		self.persistent.expedition_traveling = true

		if self.persistent.current_location ~= self.persistent.final_destination then
			self.persistent.return_turns = self.persistent.return_distance
		end

		if self.persistent.turns_spent_traveling == 0 then
			self:return_expedition()
			return
		else
			local start_node = nil
			local destination_node = nil
			for k, v in pairs(self.config.travel_paths) do
				if v.realm == self.persistent.faction_capital_realm then
					destination_node = k
				end
				if v.realm == self.persistent.current_location then
					start_node = k
				end
			end

			if not start_node  then
				script_error("hatshepsut return expedition missing start!")
				return
			end

			if not destination_node then
				script_error("hatshepsut return expedition missing destination!")
			end

			local distance, path, array_path = self:find_path(start_node, destination_node)
			table.remove(array_path, 1)
			self.persistent.path = array_path
			self.persistent.current_segment_duration = self.config.travel_paths[start_node].avaliable_destinations[self.persistent.path[1]]
			output("RETURN TURNS " .. distance .. " " .. self.persistent.current_segment_duration)
			self.persistent.return_turns = distance
		end

		self.persistent.selected_destination = self.persistent.faction_capital_realm
		self.persistent.final_destination = self.persistent.faction_capital_realm
		self.persistent.expedition_start_return_turn = return_turn_number
		self.persistent.turns_spent_traveling = 0
		self.persistent.expedition_entered_destined_bazaar = false

		if self.config.stop_at_every_node then
			self.persistent.expedition_entered_bazaar_on_route = false
		end
	end,

	return_expedition = function(self)
		if not self.persistent.canceled then
			local destination_config = self.config.trade_destinations[self.persistent.faction_capital_realm]
			cm:add_event_feed_event(
				self.config.events.expedition_returned_event.event_key,
				self.persistent.active_faction,
				0,
				destination_config.localised_name or ""
			)
		end

		self.persistent.expedition_start_turn = 0
		self.persistent.total_path_duration = 0
		self.persistent.current_segment_duration = 0
		self.persistent.turns_spent_traveling = 0
		self.persistent.return_turns = 0
		self.persistent.return_distance = 0
		self.persistent.path = {}
		self.persistent.selected_destination = ""
		self.persistent.final_destination = ""
		self.persistent.expedition_traveling = false
		self.persistent.expedition_returning = false
		self.persistent.ui.visited_pins = {}

		if self.persistent.canceled then
			self.persistent.trade_cart.items = {}
			self.persistent.expedition_returned_to_cash_out = false
			self.persistent.expedition_entered_destined_bazaar = false
		else
			self.persistent.expedition_returned_to_cash_out = true
		end
		self.persistent.canceled = false

		if self.persistent.faction_capital_realm_new and self.persistent.faction_capital_realm_new ~= "" then
			output("Faction capital has changed during the expedition! Setting new capital now...")
			self.persistent.faction_capital_realm = self.persistent.faction_capital_realm_new
			self.persistent.current_location = self.persistent.faction_capital_realm_new
			self.persistent.faction_capital_realm_new= ""
		end
		self.persistent.current_location = self.persistent.faction_capital_realm
		output("Expedition returned to capital !")
	end,

	add_to_cart = function(self, item)
		table.insert(self.persistent.trade_cart.items, {
			item = item,
			cash_out_for = ""
		})
		output("Added " .. item .. " to cart.")
		return
	end,

	get_cart_items_stacked = function(self)
		local stacked_cart = {}
		for idx, item_data in ipairs(self.persistent.trade_cart.items) do
			local item = item_data.item
			if stacked_cart[item] then
				stacked_cart[item] = stacked_cart[item] + 1
			else
				stacked_cart[item] = 1
			end
		end
		local i = 1
		local result = {}
		for key, amount in pairs(stacked_cart) do
			table.insert(result, i, { item = key, amount = amount })
			i = i + 1
		end
		return result
	end,

	remove_from_cart = function(self, item)
		for idx, item_data in ipairs(self.persistent.trade_cart.items) do
			if item_data.item == item then
				table.remove(self.persistent.trade_cart.items, idx)
				output("Removed " .. item .. " from cart.")
				return
			end
		end
	end,

	remove_character_ancillary_from_cart = function(self, item, character_cqi)
		for idx, item_data in ipairs(self.persistent.trade_cart.ancillary_items) do
			if item_data.item == item and item_data.character_cqi == character_cqi then
				table.remove(self.persistent.trade_cart.ancillary_items, idx)
				output("Removed character ancillary" .. item .. " from cart.")
				return
			end
		end
	end,

	-- persistent data is already loaded by ancient_legacy_common, we are just informed we are loaded
	on_loading_game = function(self, faction_title)
	end,

	can_cart_move_after_trade = function(self)
		if self.persistent.current_location ~= self.persistent.final_destination then
			return false
		end

		if self.persistent.expedition_returning or self.persistent.expedition_travelling then
			return false
		end

		if not self.persistent.expedition_entered_destined_bazaar then
			return false
		end

		return true
	end,

	can_send_expedition = function(self)
		-- body
		if self.persistent.expedition_traveling then
			return false
		end

		if self.persistent.current_location == self.persistent.selected_destination then
			return false
		end

		if self.persistent.expedition_returned_to_cash_out then
			return false
		end

		return true
	end,
}

return ancient_legacies_hatshepsut