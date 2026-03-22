


--
-- Data table related to loading tutorial battles from the frontend - loaded from frontend and in battle
--


-- !!!! Don't forget to update if necessary the functions unlock_all_tutorial_cards() and lock_all_tutorial_cards() when adding new entries to this table
phar_tutorial_battles = {
	battle_tutorial = {
		loading_screen = "",
		svr_bool = "immediately_load_basic_battle_tutorial",
		tweaker = "SCRIPTED_TWEAKER_25",
		xml_path = "script/battle/scripted_tours/battle_xmls/phar_basic_tutorial.xml",
		next_campaign = {
			campaign = "phar_combi",
			faction = "phar_main_ramesses",
			campaign_difficulty = 1, 
			battle_difficulty = 1
		}
	},
	advanced_battle_tutorial = {
		loading_screen = "",
		svr_bool = "immediately_load_advanced_battle_tutorial",
		tweaker = "SCRIPTED_TWEAKER_26",
		xml_path = "script/battle/scripted_tours/battle_xmls/phar_advanced_tutorial.xml",
	},
	siege_attack_tutorial = {
		loading_screen = "",
		svr_bool = "immediately_load_siege_attack_tutorial",
		tweaker = "SCRIPTED_TWEAKER_27",
		xml_path = "script/battle/scripted_tours/battle_xmls/major_settlement_attack_tutorial.xml",
	},
	siege_defense_tutorial = {
		loading_screen = "",
		svr_bool = "immediately_load_siege_defense_tutorial",
		tweaker = "SCRIPTED_TWEAKER_28",
		xml_path = "script/battle/scripted_tours/battle_xmls/major_settlement_defense_tutorial.xml",
	},
	minor_settlement_tutorial = {
		loading_screen = "",
		svr_bool = "immediately_load_minor_settlement_tutorial",
		tweaker = "SCRIPTED_TWEAKER_29",
		xml_path = "script/battle/scripted_tours/battle_xmls/minor_settlement_tutorial.xml",
	},
}

