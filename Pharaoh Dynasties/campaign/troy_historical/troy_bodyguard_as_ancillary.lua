out("Loading troy_bodyguard_as_ancillary.lua")

bodyguard_as_ancillary_setup = {
	preff = "BodyguardAsAncillary",
	character_details_panel = "character_details_panel",

	mount_category_item_location = { "character_details_panel", "ancillary_equipment" },
	mount_category_item_tooltip = "tooltip_bodyguards_as_mounts",

	none_list_item_id = "blank",
	none_list_item_location = { "character_details_panel", "ancillary_selector", "list_box" },

	historical_ancillary_type = "troy_hist_anc_bodyguard",

	-- link_table[hero_subtype][hero_subculture] = "bodyguard/ancillary_key"
	link_table = 
	{
		-- ARCHERS -----------------------------------------------------------------------------------------
		troy_archer_teucer = 
		{
			factions =
			{
				troy_main_dan_salamis = "troy_hist_anc_bodyguard_adi_salamis_archer_teucer_achaean_bowmen",
			},
		},
		
		troy_archer_skirmisher = 
		{
			factions =
			{
				troy_main_dan_mycenae = "troy_hist_anc_bodyguard_ach_mycenae_archer_skirmisher_achaean_bowmen",
				troy_main_dan_achilles = "troy_hist_anc_bodyguard_ach_achilles_archer_skirmisher_achaean_bowmen",
				troy_main_trj_dardania = "troy_hist_anc_bodyguard_trj_dardania_archer_skirmisher_light_skirmishers",
				troy_main_trj_paris = "troy_hist_anc_bodyguard_trj_paris_archer_skirmisher_trojan_archers",
				troy_main_dan_ithaca = "troy_hist_anc_bodyguard_ach_ithaca_archer_skirmisher_achaean_bowmen",
				troy_main_trj_lycia = "troy_hist_anc_bodyguard_trj_lycia_archer_skirmisher_light_skirmishers",
				troy_main_dan_salamis = "troy_hist_anc_bodyguard_adi_salamis_archer_skirmisher_achaean_bowmen",
			},
			subcultures = 
			{
				troy_main_sbc_trojan_thracians	= "troy_hist_anc_bodyguard_ach_achilles_archer_skirmisher_achaean_bowmen",
				troy_main_sbc_trojan_pelasgians = "troy_hist_anc_bodyguard_trj_paris_archer_skirmisher_trojan_archers",
				troy_main_sbc_trojan_maeonians 	= "troy_hist_anc_bodyguard_trj_paris_archer_skirmisher_trojan_archers",
				troy_main_sbc_trojan_leleges 	= "troy_hist_anc_bodyguard_trj_lycia_archer_skirmisher_light_skirmishers",
				troy_main_sbc_danaan_ionians 	= "troy_hist_anc_bodyguard_ach_achilles_archer_skirmisher_achaean_bowmen",
				troy_main_sbc_danaan_dorians 	= "troy_hist_anc_bodyguard_ach_achilles_archer_skirmisher_achaean_bowmen",
				troy_main_sbc_danaan_aeolians 	= "troy_hist_anc_bodyguard_ach_achilles_archer_skirmisher_achaean_bowmen",
				troy_main_sbc_danaan_achaeans 	= "troy_hist_anc_bodyguard_ach_achilles_archer_skirmisher_achaean_bowmen",
				troy_amazons_sbc_horde_amazons 	= "troy_hist_anc_bodyguard_ama_penthesilea_archer_skirmisher_toxares",
				troy_amazons_sbc_trojan_amazons = "troy_hist_anc_bodyguard_ama_hippolyta_archer_skirmisher_amazon_archers",
			},
		},

		troy_archer_trickster = 
		{
			factions =
			{
				troy_main_dan_mycenae = "troy_hist_anc_bodyguard_ach_mycenae_archer_trickster_achaean_bowmen",
				troy_main_dan_achilles = "troy_hist_anc_bodyguard_ach_achilles_archer_trickster_achaean_bowmen",
				troy_main_trj_dardania = "troy_hist_anc_bodyguard_trj_dardania_archer_trickster_light_skirmishers",
				troy_main_trj_paris = "troy_hist_anc_bodyguard_trj_paris_archer_trickster_trojan_archers",
				troy_main_dan_ithaca = "troy_hist_anc_bodyguard_ach_ithaca_archer_trickster_achaean_bowmen",
				troy_main_trj_lycia = "troy_hist_anc_bodyguard_trj_lycia_archer_trickster_light_skirmishers",
				troy_main_dan_salamis = "troy_hist_anc_bodyguard_adi_salamis_archer_trickster_achaean_bowmen",
			},
			subcultures = 
			{
				troy_main_sbc_trojan_thracians	= "troy_hist_anc_bodyguard_ach_achilles_archer_trickster_achaean_bowmen",
				troy_main_sbc_trojan_pelasgians = "troy_hist_anc_bodyguard_trj_paris_archer_trickster_trojan_archers",
				troy_main_sbc_trojan_maeonians 	= "troy_hist_anc_bodyguard_trj_paris_archer_trickster_trojan_archers",
				troy_main_sbc_trojan_leleges 	= "troy_hist_anc_bodyguard_trj_lycia_archer_trickster_light_skirmishers",
				troy_main_sbc_danaan_ionians 	= "troy_hist_anc_bodyguard_ach_achilles_archer_trickster_achaean_bowmen",
				troy_main_sbc_danaan_dorians 	= "troy_hist_anc_bodyguard_ach_achilles_archer_trickster_achaean_bowmen",
				troy_main_sbc_danaan_aeolians 	= "troy_hist_anc_bodyguard_ach_achilles_archer_trickster_achaean_bowmen",
				troy_main_sbc_danaan_achaeans 	= "troy_hist_anc_bodyguard_ach_achilles_archer_trickster_achaean_bowmen",
				troy_amazons_sbc_horde_amazons 	= "troy_hist_anc_bodyguard_ama_penthesilea_archer_trickster_toxares",
				troy_amazons_sbc_trojan_amazons = "troy_hist_anc_bodyguard_ama_hippolyta_archer_trickster_amazon_archers",
			},
		},

		-- DEFENDERS -----------------------------------------------------------------------------------------
		troy_defender_aggro = 
		{
			factions =
			{
				troy_main_dan_sparta = "troy_hist_anc_bodyguard_ach_sparta_defender_veteran_armoured_axemen",
				troy_main_dan_mycenae = "troy_hist_anc_bodyguard_ach_mycenae_defender_veteran_achaean_spearmen",
				troy_main_dan_achilles = "troy_hist_anc_bodyguard_ach_achilles_defender_veteran_achaean_spearmen",
				troy_main_trj_hector = "troy_hist_anc_bodyguard_trj_hector_defender_veteran_trojan_swordsmen",
				troy_main_trj_paris = "troy_hist_anc_bodyguard_trj_paris_defender_veteran_phrygian_axemen",
				troy_main_trj_lycia = "troy_hist_anc_bodyguard_trj_lycia_defender_veteran_lycian_axemen",
				troy_main_dan_salamis = "troy_hist_anc_bodyguard_adi_salamis_defender_veteran_island_spearmen",
				troy_main_dan_argos = "troy_hist_anc_bodyguard_adi_argos_defender_veteran_achaean_spearmen",
			},
			subcultures = 
			{
				troy_main_sbc_trojan_thracians	= "troy_hist_anc_bodyguard_ach_mycenae_defender_veteran_achaean_spearmen",
				troy_main_sbc_trojan_pelasgians = "troy_hist_anc_bodyguard_trj_hector_defender_veteran_trojan_swordsmen",
				troy_main_sbc_trojan_maeonians 	= "troy_hist_anc_bodyguard_trj_lycia_defender_veteran_lycian_axemen",
				troy_main_sbc_trojan_leleges 	= "troy_hist_anc_bodyguard_trj_lycia_defender_veteran_lycian_axemen",
				troy_main_sbc_danaan_ionians 	= "troy_hist_anc_bodyguard_ach_mycenae_defender_veteran_achaean_spearmen",
				troy_main_sbc_danaan_dorians 	= "troy_hist_anc_bodyguard_ach_mycenae_defender_veteran_achaean_spearmen",
				troy_main_sbc_danaan_aeolians 	= "troy_hist_anc_bodyguard_ach_mycenae_defender_veteran_achaean_spearmen",
				troy_main_sbc_danaan_achaeans 	= "troy_hist_anc_bodyguard_ach_mycenae_defender_veteran_achaean_spearmen",
				troy_amazons_sbc_horde_amazons 	= "troy_hist_anc_bodyguard_trj_lycia_defender_companion_lycian_axemen",
				troy_amazons_sbc_trojan_amazons = "troy_hist_anc_bodyguard_trj_lycia_defender_companion_lycian_axemen",
			},
		},

		troy_defender_quick = 
		{
			factions =
			{
				troy_main_dan_sparta = "troy_hist_anc_bodyguard_ach_sparta_defender_companion_armoured_axemen",
				troy_main_dan_mycenae = "troy_hist_anc_bodyguard_ach_mycenae_defender_companion_achaean_spearmen",
				troy_main_dan_achilles = "troy_hist_anc_bodyguard_ach_achilles_defender_companion_achaean_spearmen",
				troy_main_trj_hector = "troy_hist_anc_bodyguard_trj_hector_defender_companion_trojan_swordsmen",
				troy_main_trj_paris = "troy_hist_anc_bodyguard_trj_paris_defender_companion_phrygian_axemen",
				troy_main_trj_lycia = "troy_hist_anc_bodyguard_trj_lycia_defender_companion_lycian_axemen",
				troy_main_dan_salamis = "troy_hist_anc_bodyguard_adi_salamis_defender_companion_island_spearmen",
				troy_main_dan_argos = "troy_hist_anc_bodyguard_adi_argos_defender_companion_achaean_spearmen",
			},
			subcultures = 
			{
				troy_main_sbc_trojan_thracians	= "troy_hist_anc_bodyguard_ach_mycenae_defender_companion_achaean_spearmen",
				troy_main_sbc_trojan_pelasgians = "troy_hist_anc_bodyguard_trj_hector_defender_companion_trojan_swordsmen",
				troy_main_sbc_trojan_maeonians 	= "troy_hist_anc_bodyguard_trj_lycia_defender_companion_lycian_axemen",
				troy_main_sbc_trojan_leleges 	= "troy_hist_anc_bodyguard_trj_lycia_defender_companion_lycian_axemen",
				troy_main_sbc_danaan_ionians 	= "troy_hist_anc_bodyguard_ach_mycenae_defender_companion_achaean_spearmen",
				troy_main_sbc_danaan_dorians 	= "troy_hist_anc_bodyguard_ach_mycenae_defender_companion_achaean_spearmen",
				troy_main_sbc_danaan_aeolians 	= "troy_hist_anc_bodyguard_ach_mycenae_defender_companion_achaean_spearmen",
				troy_main_sbc_danaan_achaeans 	= "troy_hist_anc_bodyguard_ach_mycenae_defender_companion_achaean_spearmen",
				troy_amazons_sbc_horde_amazons 	= "troy_hist_anc_bodyguard_trj_lycia_defender_companion_lycian_axemen",
				troy_amazons_sbc_trojan_amazons = "troy_hist_anc_bodyguard_trj_lycia_defender_companion_lycian_axemen",
			},
		},

		troy_defender_tank = 
		{
			factions =
			{
				troy_main_dan_sparta = "troy_hist_anc_bodyguard_ach_sparta_defender_protector_armoured_axemen",
				troy_main_dan_mycenae = "troy_hist_anc_bodyguard_ach_mycenae_defender_protector_achaean_spearmen",
				troy_main_dan_achilles = "troy_hist_anc_bodyguard_ach_achilles_defender_protector_achaean_spearmen",
				troy_main_trj_hector = "troy_hist_anc_bodyguard_trj_hector_defender_protector_trojan_swordsmen",
				troy_main_trj_paris = "troy_hist_anc_bodyguard_trj_paris_defender_protector_phrygian_axemen",
				troy_main_trj_lycia = "troy_hist_anc_bodyguard_trj_lycia_defender_protector_lycian_axemen",
				troy_main_dan_salamis = "troy_hist_anc_bodyguard_adi_salamis_defender_protector_island_spearmen",
				troy_main_dan_argos = "troy_hist_anc_bodyguard_adi_argos_defender_protector_achaean_spearmen",
			},
			subcultures = 
			{
				troy_main_sbc_trojan_thracians	= "troy_hist_anc_bodyguard_ach_mycenae_defender_protector_achaean_spearmen",
				troy_main_sbc_trojan_pelasgians = "troy_hist_anc_bodyguard_trj_hector_defender_protector_trojan_swordsmen",
				troy_main_sbc_trojan_maeonians 	= "troy_hist_anc_bodyguard_trj_lycia_defender_protector_lycian_axemen",
				troy_main_sbc_trojan_leleges 	= "troy_hist_anc_bodyguard_trj_lycia_defender_protector_lycian_axemen",
				troy_main_sbc_danaan_ionians 	= "troy_hist_anc_bodyguard_ach_mycenae_defender_protector_achaean_spearmen",
				troy_main_sbc_danaan_dorians 	= "troy_hist_anc_bodyguard_ach_mycenae_defender_protector_achaean_spearmen",
				troy_main_sbc_danaan_aeolians 	= "troy_hist_anc_bodyguard_ach_mycenae_defender_protector_achaean_spearmen",
				troy_main_sbc_danaan_achaeans 	= "troy_hist_anc_bodyguard_ach_mycenae_defender_protector_achaean_spearmen",
				troy_amazons_sbc_horde_amazons 	= "troy_hist_anc_bodyguard_trj_lycia_defender_protector_lycian_axemen",
				troy_amazons_sbc_trojan_amazons = "troy_hist_anc_bodyguard_trj_lycia_defender_protector_lycian_axemen",
			},
		},

		-- FIGHTERS -----------------------------------------------------------------------------------------
		troy_fighter_balanced = 
		{
			factions =
			{
				troy_main_dan_sparta = "troy_hist_anc_bodyguard_ach_sparta_fighter_champion_laconian_axemen",
				troy_main_dan_achilles = "troy_hist_anc_bodyguard_ach_achilles_fighter_champion_light_swordsmen",
				troy_main_trj_dardania = "troy_hist_anc_bodyguard_trj_dardania_fighter_champion_anatolian_swords",
				troy_main_trj_hector = "troy_hist_anc_bodyguard_trj_hector_fighter_champion_trojan_swordsmen",
				troy_main_trj_paris = "troy_hist_anc_bodyguard_trj_paris_fighter_champion_phrygian_axemen",
				troy_main_dan_ithaca = "troy_hist_anc_bodyguard_ach_ithaca_fighter_champion_swordsmen_skirmishers",
				troy_main_dan_salamis = "troy_hist_anc_bodyguard_adi_salamis_fighter_champion_island_spearmen",
				troy_main_dan_argos = "troy_hist_anc_bodyguard_adi_argos_fighter_champion_argive_swordsmen",
			},
			subcultures = 
			{
				troy_main_sbc_trojan_thracians	= "troy_hist_anc_bodyguard_ach_achilles_fighter_champion_light_swordsmen",
				troy_main_sbc_trojan_pelasgians = "troy_hist_anc_bodyguard_trj_hector_fighter_champion_trojan_swordsmen",
				troy_main_sbc_trojan_maeonians 	= "troy_hist_anc_bodyguard_trj_hector_fighter_champion_trojan_swordsmen",
				troy_main_sbc_trojan_leleges 	= "troy_hist_anc_bodyguard_trj_dardania_fighter_champion_anatolian_swords",
				troy_main_sbc_danaan_ionians 	= "troy_hist_anc_bodyguard_ach_achilles_fighter_champion_light_swordsmen",
				troy_main_sbc_danaan_dorians 	= "troy_hist_anc_bodyguard_ach_achilles_fighter_champion_light_swordsmen",
				troy_main_sbc_danaan_aeolians 	= "troy_hist_anc_bodyguard_ach_achilles_fighter_champion_light_swordsmen",
				troy_main_sbc_danaan_achaeans 	= "troy_hist_anc_bodyguard_ach_achilles_fighter_champion_light_swordsmen",
				troy_amazons_sbc_horde_amazons 	= "troy_hist_anc_bodyguard_trj_lycia_defender_veteran_heavy_lycian_axemen",
				troy_amazons_sbc_trojan_amazons = "troy_hist_anc_bodyguard_trj_lycia_defender_veteran_heavy_lycian_axemen",
			},
		},

		troy_fighter_disruptor = 
		{
			factions =
			{
				troy_main_dan_sparta = "troy_hist_anc_bodyguard_ach_sparta_fighter_ravager_laconian_axemen",
				troy_main_dan_achilles = "troy_hist_anc_bodyguard_ach_achilles_fighter_ravager_light_swordsmen",
				troy_main_trj_dardania = "troy_hist_anc_bodyguard_trj_dardania_fighter_ravager_anatolian_swords",
				troy_main_trj_hector = "troy_hist_anc_bodyguard_trj_hector_fighter_ravager_trojan_swordsmen",
				troy_main_trj_paris = "troy_hist_anc_bodyguard_trj_paris_fighter_ravager_phrygian_axemen",
				troy_main_dan_ithaca = "troy_hist_anc_bodyguard_ach_ithaca_fighter_ravager_swordsmen_skirmishers",
				troy_main_dan_salamis = "troy_hist_anc_bodyguard_adi_salamis_fighter_ravager_island_spearmen",
				troy_main_dan_argos = "troy_hist_anc_bodyguard_adi_argos_fighter_ravager_argive_swordsmen",
			},
			subcultures = 
			{
				troy_main_sbc_trojan_thracians	= "troy_hist_anc_bodyguard_ach_achilles_fighter_ravager_light_swordsmen",
				troy_main_sbc_trojan_pelasgians = "troy_hist_anc_bodyguard_trj_hector_fighter_ravager_trojan_swordsmen",
				troy_main_sbc_trojan_maeonians 	= "troy_hist_anc_bodyguard_trj_hector_fighter_ravager_trojan_swordsmen",
				troy_main_sbc_trojan_leleges 	= "troy_hist_anc_bodyguard_trj_dardania_fighter_ravager_anatolian_swords",
				troy_main_sbc_danaan_ionians 	= "troy_hist_anc_bodyguard_ach_achilles_fighter_ravager_light_swordsmen",
				troy_main_sbc_danaan_dorians 	= "troy_hist_anc_bodyguard_ach_achilles_fighter_ravager_light_swordsmen",
				troy_main_sbc_danaan_aeolians 	= "troy_hist_anc_bodyguard_ach_achilles_fighter_ravager_light_swordsmen",
				troy_main_sbc_danaan_achaeans 	= "troy_hist_anc_bodyguard_ach_achilles_fighter_ravager_light_swordsmen",
				troy_amazons_sbc_horde_amazons 	= "troy_hist_anc_bodyguard_trj_lycia_defender_veteran_heavy_lycian_axemen",
				troy_amazons_sbc_trojan_amazons = "troy_hist_anc_bodyguard_trj_lycia_defender_veteran_heavy_lycian_axemen",
			},
		},

		troy_fighter_killer = 
		{
			factions =
			{
				troy_main_dan_sparta = "troy_hist_anc_bodyguard_ach_sparta_fighter_vanquisher_laconian_axemen",
				troy_main_dan_achilles = "troy_hist_anc_bodyguard_ach_achilles_fighter_vanquisher_light_swordsmen",
				troy_main_trj_dardania = "troy_hist_anc_bodyguard_trj_dardania_fighter_vanquisher_anatolian_swords",
				troy_main_trj_hector = "troy_hist_anc_bodyguard_trj_hector_fighter_vanquisher_trojan_swordsmen",
				troy_main_trj_paris = "troy_hist_anc_bodyguard_trj_paris_fighter_vanquisher_phrygian_axemen",
				troy_main_dan_ithaca = "troy_hist_anc_bodyguard_ach_ithaca_fighter_vanquisher_swordsmen_skirmishers",
				troy_main_dan_salamis = "troy_hist_anc_bodyguard_adi_salamis_fighter_vanquisher_island_spearmen",
				troy_main_dan_argos = "troy_hist_anc_bodyguard_adi_argos_fighter_vanquisher_argive_swordsmen",
			},
			subcultures = 
			{
				troy_main_sbc_trojan_thracians	= "troy_hist_anc_bodyguard_ach_achilles_fighter_vanquisher_light_swordsmen",
				troy_main_sbc_trojan_pelasgians = "troy_hist_anc_bodyguard_trj_hector_fighter_vanquisher_trojan_swordsmen",
				troy_main_sbc_trojan_maeonians 	= "troy_hist_anc_bodyguard_trj_hector_fighter_vanquisher_trojan_swordsmen",
				troy_main_sbc_trojan_leleges 	= "troy_hist_anc_bodyguard_trj_dardania_fighter_vanquisher_anatolian_swords",
				troy_main_sbc_danaan_ionians 	= "troy_hist_anc_bodyguard_ach_achilles_fighter_vanquisher_light_swordsmen",
				troy_main_sbc_danaan_dorians 	= "troy_hist_anc_bodyguard_ach_achilles_fighter_vanquisher_light_swordsmen",
				troy_main_sbc_danaan_aeolians 	= "troy_hist_anc_bodyguard_ach_achilles_fighter_vanquisher_light_swordsmen",
				troy_main_sbc_danaan_achaeans 	= "troy_hist_anc_bodyguard_ach_achilles_fighter_vanquisher_light_swordsmen",
				troy_amazons_sbc_horde_amazons 	= "troy_hist_anc_bodyguard_trj_lycia_defender_veteran_heavy_lycian_axemen",
				troy_amazons_sbc_trojan_amazons = "troy_hist_anc_bodyguard_trj_lycia_defender_veteran_heavy_lycian_axemen",
			},
		},

		-- WARLORDS -----------------------------------------------------------------------------------------
		troy_warlord_tactician = 
		{
			factions =
			{
				troy_main_dan_sparta = "troy_hist_anc_bodyguard_ach_sparta_warlord_commander_armoured_axemen",
				troy_main_dan_mycenae = "troy_hist_anc_bodyguard_ach_mycenae_warlord_commander_club_warriors_large_shields",
				troy_main_trj_dardania = "troy_hist_anc_bodyguard_trj_dardania_warlord_commander_anatolian_swords",
				troy_main_trj_hector = "troy_hist_anc_bodyguard_trj_hector_warlord_commander_trojan_swordsmen",
				troy_main_dan_ithaca = "troy_hist_anc_bodyguard_ach_ithaca_warlord_commander_achaean_islanders",
				troy_main_trj_lycia = "troy_hist_anc_bodyguard_trj_lycia_warlord_commander_heavy_lycian_axemen",
				troy_main_dan_argos = "troy_hist_anc_bodyguard_adi_argos_warlord_commander_argive_swordsmen",
			},
			subcultures = 
			{
				troy_main_sbc_trojan_thracians	= "troy_hist_anc_bodyguard_ach_sparta_warlord_commander_armoured_axemen",
				troy_main_sbc_trojan_pelasgians = "troy_hist_anc_bodyguard_trj_hector_warlord_commander_trojan_swordsmen",
				troy_main_sbc_trojan_maeonians 	= "troy_hist_anc_bodyguard_trj_lycia_warlord_commander_heavy_lycian_axemen",
				troy_main_sbc_trojan_leleges 	= "troy_hist_anc_bodyguard_trj_lycia_warlord_commander_heavy_lycian_axemen",
				troy_main_sbc_danaan_ionians 	= "troy_hist_anc_bodyguard_ach_sparta_warlord_commander_armoured_axemen",
				troy_main_sbc_danaan_dorians 	= "troy_hist_anc_bodyguard_ach_sparta_warlord_commander_armoured_axemen",
				troy_main_sbc_danaan_aeolians 	= "troy_hist_anc_bodyguard_ach_sparta_warlord_commander_armoured_axemen",
				troy_main_sbc_danaan_achaeans 	= "troy_hist_anc_bodyguard_ach_sparta_warlord_commander_armoured_axemen",
				troy_amazons_sbc_horde_amazons 	= "troy_hist_anc_bodyguard_trj_lycia_defender_veteran_heavy_lycian_axemen",
				troy_amazons_sbc_trojan_amazons = "troy_hist_anc_bodyguard_trj_lycia_defender_veteran_heavy_lycian_axemen",
			},
		},

		troy_warlord_utility = 
		{
			factions =
			{
				troy_main_dan_sparta = "troy_hist_anc_bodyguard_ach_sparta_warlord_mentor_armoured_axemen",
				troy_main_dan_mycenae = "troy_hist_anc_bodyguard_ach_mycenae_warlord_mentor_club_warriors_large_shields",
				troy_main_trj_dardania = "troy_hist_anc_bodyguard_trj_dardania_warlord_mentor_anatolian_swords",
				troy_main_trj_hector = "troy_hist_anc_bodyguard_trj_hector_warlord_mentor_trojan_swordsmen",
				troy_main_dan_ithaca = "troy_hist_anc_bodyguard_ach_ithaca_warlord_mentor_achaean_islanders",
				troy_main_trj_lycia = "troy_hist_anc_bodyguard_trj_lycia_warlord_mentor_heavy_lycian_axemen",
				troy_main_dan_argos = "troy_hist_anc_bodyguard_adi_argos_warlord_mentor_argive_swordsmen",
			},
			subcultures = 
			{
				troy_main_sbc_trojan_thracians	= "troy_hist_anc_bodyguard_ach_sparta_warlord_mentor_armoured_axemen",
				troy_main_sbc_trojan_pelasgians = "troy_hist_anc_bodyguard_trj_hector_warlord_mentor_trojan_swordsmen",
				troy_main_sbc_trojan_maeonians 	= "troy_hist_anc_bodyguard_trj_lycia_warlord_mentor_heavy_lycian_axemen",
				troy_main_sbc_trojan_leleges 	= "troy_hist_anc_bodyguard_trj_lycia_warlord_mentor_heavy_lycian_axemen",
				troy_main_sbc_danaan_ionians 	= "troy_hist_anc_bodyguard_ach_sparta_warlord_mentor_armoured_axemen",
				troy_main_sbc_danaan_dorians 	= "troy_hist_anc_bodyguard_ach_sparta_warlord_mentor_armoured_axemen",
				troy_main_sbc_danaan_aeolians 	= "troy_hist_anc_bodyguard_ach_sparta_warlord_mentor_armoured_axemen",
				troy_main_sbc_danaan_achaeans 	= "troy_hist_anc_bodyguard_ach_sparta_warlord_mentor_armoured_axemen",
				troy_amazons_sbc_horde_amazons 	= "troy_hist_anc_bodyguard_trj_lycia_defender_veteran_heavy_lycian_axemen",
				troy_amazons_sbc_trojan_amazons = "troy_hist_anc_bodyguard_trj_lycia_defender_veteran_heavy_lycian_axemen",
			},
		},

		troy_warlord_warmonger = 
		{
			factions =
			{
				troy_main_dan_sparta = "troy_hist_anc_bodyguard_ach_sparta_warlord_warmonger_armoured_axemen",
				troy_main_dan_mycenae = "troy_hist_anc_bodyguard_ach_mycenae_warlord_warmonger_club_warriors_large_shields",
				troy_main_trj_dardania = "troy_hist_anc_bodyguard_trj_dardania_warlord_warmonger_anatolian_swords",
				troy_main_trj_hector = "troy_hist_anc_bodyguard_trj_hector_warlord_warmonger_trojan_swordsmen",
				troy_main_dan_ithaca = "troy_hist_anc_bodyguard_ach_ithaca_warlord_warmonger_achaean_islanders",
				troy_main_trj_lycia = "troy_hist_anc_bodyguard_trj_lycia_warlord_warmonger_heavy_lycian_axemen",
				troy_main_dan_argos = "troy_hist_anc_bodyguard_adi_argos_warlord_warmonger_argive_swordsmen",
			},
			subcultures = 
			{
				troy_main_sbc_trojan_thracians	= "troy_hist_anc_bodyguard_ach_sparta_warlord_warmonger_armoured_axemen",
				troy_main_sbc_trojan_pelasgians = "troy_hist_anc_bodyguard_trj_hector_warlord_warmonger_trojan_swordsmen",
				troy_main_sbc_trojan_maeonians 	= "troy_hist_anc_bodyguard_trj_lycia_warlord_warmonger_heavy_lycian_axemen",
				troy_main_sbc_trojan_leleges 	= "troy_hist_anc_bodyguard_trj_lycia_warlord_warmonger_heavy_lycian_axemen",
				troy_main_sbc_danaan_ionians 	= "troy_hist_anc_bodyguard_ach_sparta_warlord_warmonger_armoured_axemen",
				troy_main_sbc_danaan_dorians 	= "troy_hist_anc_bodyguard_ach_sparta_warlord_warmonger_armoured_axemen",
				troy_main_sbc_danaan_aeolians 	= "troy_hist_anc_bodyguard_ach_sparta_warlord_warmonger_armoured_axemen",
				troy_main_sbc_danaan_achaeans 	= "troy_hist_anc_bodyguard_ach_sparta_warlord_warmonger_armoured_axemen",
				troy_amazons_sbc_horde_amazons 	= "troy_hist_anc_bodyguard_trj_lycia_defender_veteran_heavy_lycian_axemen",
				troy_amazons_sbc_trojan_amazons = "troy_hist_anc_bodyguard_trj_lycia_defender_veteran_heavy_lycian_axemen",
			},
		},
		troy_dlc1_pen_archer_skirmisher =
		{
			factions =
			{
				troy_amazons_trj_hippolyta = "troy_hist_anc_bodyguard_ama_hippolyta_archer_skirmisher_amazon_archers",
				troy_amazons_trj_penthesilea = "troy_hist_anc_bodyguard_ama_penthesilea_archer_skirmisher_toxares",
			}
		},
		troy_dlc1_pen_archer_trickster =
		{
			factions =
			{
				troy_amazons_trj_hippolyta = "troy_hist_anc_bodyguard_ama_hippolyta_archer_trickster_amazon_archers",
				troy_amazons_trj_penthesilea = "troy_hist_anc_bodyguard_ama_penthesilea_archer_trickster_toxares",
			}
		},
		troy_dlc1_pen_fighter_balanced =
		{
			factions =
			{
				troy_amazons_trj_hippolyta = "troy_hist_anc_bodyguard_ama_hippolyta_fighter_champion_amazon_swordswomen",
				troy_amazons_trj_penthesilea = "troy_hist_anc_bodyguard_ama_penthesilea_fighter_champion_warband",
			}
		},
		troy_dlc1_pen_fighter_disruptor =
		{
			factions =
			{
				troy_amazons_trj_hippolyta = "troy_hist_anc_bodyguard_ama_hippolyta_fighter_ravager_amazon_swordswomen",
				troy_amazons_trj_penthesilea = "troy_hist_anc_bodyguard_ama_penthesilea_fighter_ravager_warband",
			}
		},
		troy_dlc1_pen_fighter_killer =
		{
			factions =
			{
				troy_amazons_trj_hippolyta = "troy_hist_anc_bodyguard_ama_hippolyta_fighter_vanquisher_amazon_swordswomen",
				troy_amazons_trj_penthesilea = "troy_hist_anc_bodyguard_ama_penthesilea_fighter_vanquisher_warband",
			}
		},
		troy_dlc1_pen_warlord_tactician =
		{
			factions =
			{
				troy_amazons_trj_hippolyta = "troy_hist_anc_bodyguard_ama_hippolyta_warlord_commander_oathsworn",
				troy_amazons_trj_penthesilea = "troy_hist_anc_bodyguard_ama_penthesilea_warlord_commander_warband",
			}
		},
		troy_dlc1_pen_warlord_utility =
		{
			factions =
			{
				troy_amazons_trj_hippolyta = "troy_hist_anc_bodyguard_ama_hippolyta_warlord_mentor_oathsworn",
				troy_amazons_trj_penthesilea = "troy_hist_anc_bodyguard_ama_penthesilea_warlord_mentor_warband",
			}
		},
		troy_dlc1_pen_warlord_warmonger =
		{
			factions =
			{
				troy_amazons_trj_hippolyta = "troy_hist_anc_bodyguard_ama_hippolyta_warlord_warmonger_oathsworn",
				troy_amazons_trj_penthesilea = "troy_hist_anc_bodyguard_ama_penthesilea_warlord_warmonger_warband",
			}
		},
		troy_dlc1_hip_archer_skirmisher =
		{
			factions =
			{
				troy_amazons_trj_hippolyta = "troy_hist_anc_bodyguard_ama_hippolyta_archer_skirmisher_amazon_archers",
				troy_amazons_trj_penthesilea = "troy_hist_anc_bodyguard_ama_penthesilea_archer_skirmisher_toxares",
			}
		},
		troy_dlc1_hip_archer_trickster =
		{
			factions =
			{
				troy_amazons_trj_hippolyta = "troy_hist_anc_bodyguard_ama_hippolyta_archer_trickster_amazon_archers",
				troy_amazons_trj_penthesilea = "troy_hist_anc_bodyguard_ama_penthesilea_archer_trickster_toxares",
			}
		},
		troy_dlc1_hip_fighter_balanced =
		{
			factions =
			{
				troy_amazons_trj_hippolyta = "troy_hist_anc_bodyguard_ama_hippolyta_fighter_champion_amazon_swordswomen",
				troy_amazons_trj_penthesilea = "troy_hist_anc_bodyguard_ama_penthesilea_fighter_champion_warband",
			}
		},
		troy_dlc1_hip_fighter_disruptor =
		{
			factions =
			{
				troy_amazons_trj_hippolyta = "troy_hist_anc_bodyguard_ama_hippolyta_fighter_ravager_amazon_swordswomen",
				troy_amazons_trj_penthesilea = "troy_hist_anc_bodyguard_ama_penthesilea_fighter_ravager_warband",
			}
		},
		troy_dlc1_hip_fighter_killer =
		{
			factions =
			{
				troy_amazons_trj_hippolyta = "troy_hist_anc_bodyguard_ama_hippolyta_fighter_vanquisher_amazon_swordswomen",
				troy_amazons_trj_penthesilea = "troy_hist_anc_bodyguard_ama_penthesilea_fighter_vanquisher_warband",
			}
		},
		troy_dlc1_hip_warlord_tactician =
		{
			factions =
			{
				troy_amazons_trj_hippolyta = "troy_hist_anc_bodyguard_ama_hippolyta_warlord_commander_oathsworn",
				troy_amazons_trj_penthesilea = "troy_hist_anc_bodyguard_ama_penthesilea_warlord_commander_warband",
			}
		},
		troy_dlc1_hip_warlord_utility =
		{
			factions =
			{
				troy_amazons_trj_hippolyta = "troy_hist_anc_bodyguard_ama_hippolyta_warlord_mentor_oathsworn",
				troy_amazons_trj_penthesilea = "troy_hist_anc_bodyguard_ama_penthesilea_warlord_mentor_warband",
			}
		},
		troy_dlc1_hip_warlord_warmonger =
		{
			factions =
			{
				troy_amazons_trj_hippolyta = "troy_hist_anc_bodyguard_ama_hippolyta_warlord_warmonger_oathsworn",
				troy_amazons_trj_penthesilea = "troy_hist_anc_bodyguard_ama_penthesilea_warlord_warmonger_warband",
			}
		},

		troy_rem_rhesus_archer_skirmisher = 
		{
			factions =
			{
				troy_rem_trj_thrace = "troy_hist_hero_rem_rhesus_archer_skirmisher_bodyguard_forest_skirmishers",

			},
			subcultures = 
			{
				troy_rem_sbc_thracophrygian_phrygians = "troy_hist_hero_rem_thracian_archer_skirmisher_bodyguard_forest_skirmishers",
				troy_rem_sbc_thracophrygian_thracians = "troy_hist_hero_rem_thracian_archer_skirmisher_bodyguard_forest_skirmishers",
				troy_rem_sbc_hordes_aethiopians = "troy_hist_hero_rem_memnon_archer_skirmisher_bodyguard_egyptian_slingers",
			},
		},

		troy_rem_rhesus_archer_trickster = 
		{
			factions =
			{
				troy_rem_trj_thrace = "troy_hist_hero_rem_rhesus_archer_trickster_bodyguard_forest_skirmishers",

			},
			subcultures = 
			{
				troy_rem_sbc_thracophrygian_phrygians = "troy_hist_hero_rem_thracian_archer_trickster_bodyguard_forest_skirmishers",
				troy_rem_sbc_thracophrygian_thracians = "troy_hist_hero_rem_thracian_archer_trickster_bodyguard_forest_skirmishers",
				troy_rem_sbc_hordes_aethiopians = "troy_hist_hero_rem_memnon_archer_trickster_bodyguard_aethiopian_hunters",
			},
		},

		troy_rem_rhesus_defender_aggro = 
		{
			factions =
			{
				troy_rem_trj_thrace = "troy_hist_hero_rem_rhesus_defender_veteran_bodyguard_plainsmen",

			},
			subcultures = 
			{
				troy_rem_sbc_thracophrygian_phrygians = "troy_hist_hero_rem_thracian_defender_veteran_bodyguard_plainsmen",
				troy_rem_sbc_thracophrygian_thracians = "troy_hist_hero_rem_thracian_defender_veteran_bodyguard_plainsmen",
			},		
		},

		troy_rem_rhesus_defender_quick = 
		{
			factions =
			{
				troy_rem_trj_thrace = "troy_hist_hero_rem_rhesus_defender_companion_bodyguard_plainsmen",

			},
			subcultures = 
			{
				troy_rem_sbc_thracophrygian_phrygians = "troy_hist_hero_rem_thracian_defender_companion_bodyguard_plainsmen",
				troy_rem_sbc_thracophrygian_thracians = "troy_hist_hero_rem_thracian_defender_companion_bodyguard_plainsmen",
			},
		},

		troy_rem_rhesus_defender_tank = 
		{
			factions =
			{
				troy_rem_trj_thrace = "troy_hist_hero_rem_rhesus_defender_protector_bodyguard_plainsmen",

			},
			subcultures = 
			{
				troy_rem_sbc_thracophrygian_phrygians = "troy_hist_hero_rem_thracian_defender_protector_bodyguard_plainsmen",
				troy_rem_sbc_thracophrygian_thracians = "troy_hist_hero_rem_thracian_defender_protector_bodyguard_plainsmen",
			},
		},

		troy_rem_rhesus_fighter_balanced = 
		{
			factions =
			{
				troy_rem_trj_thrace = "troy_hist_hero_rem_rhesus_fighter_champion_bodyguard_woodsmen",

			},
			subcultures = 
			{
				troy_rem_sbc_thracophrygian_phrygians = "troy_hist_hero_rem_thracian_fighter_champion_bodyguard_woodsmen",
				troy_rem_sbc_thracophrygian_thracians = "troy_hist_hero_rem_thracian_fighter_champion_bodyguard_woodsmen",
				troy_rem_sbc_hordes_aethiopians = "troy_hist_hero_rem_memnon_fighter_champion_bodyguard_aethiopian_spearmen",
			},
		},

		troy_rem_rhesus_fighter_disruptor = 
		{
			factions =
			{
				troy_rem_trj_thrace = "troy_hist_hero_rem_rhesus_fighter_ravager_bodyguard_woodsmen",

			},
			subcultures = 
			{
				troy_rem_sbc_thracophrygian_phrygians = "troy_hist_hero_rem_thracian_fighter_ravager_bodyguard_woodsmen",
				troy_rem_sbc_thracophrygian_thracians = "troy_hist_hero_rem_thracian_fighter_ravager_bodyguard_woodsmen",
				troy_rem_sbc_hordes_aethiopians = "troy_hist_hero_rem_memnon_fighter_ravager_bodyguard_aethiopian_spearmen",
			},
		},

		troy_rem_rhesus_fighter_killer = 
		{
			factions =
			{
				troy_rem_trj_thrace = "troy_hist_hero_rem_rhesus_fighter_vanquisher_bodyguard_woodsmen",

			},
			subcultures = 
			{
				troy_rem_sbc_thracophrygian_phrygians = "troy_hist_hero_rem_thracian_fighter_vanquisher_bodyguard_woodsmen",
				troy_rem_sbc_thracophrygian_thracians = "troy_hist_hero_rem_thracian_fighter_vanquisher_bodyguard_woodsmen",
				troy_rem_sbc_hordes_aethiopians = "troy_hist_hero_rem_memnon_fighter_vanquisher_bodyguard_aethiopian_spearmen",
			},
		},


		troy_rem_rhesus_warlord_tactician = 
		{
			factions =
			{
				troy_rem_trj_thrace = "",

			},
			subcultures = 
			{
				troy_rem_sbc_hordes_aethiopians = "troy_hist_hero_rem_memnon_warlord_commander_bodyguard_manfyt_infantry",
			},
		},

		troy_rem_rhesus_warlord_utility = 
		{
			factions =
			{

			},
			subcultures = 
			{
				troy_rem_sbc_hordes_aethiopians = "troy_hist_hero_rem_memnon_warlord_mentor_bodyguard_manfyt_infantry",
			},
		},
		
		troy_rem_rhesus_warlord_warmonger = 
		{
			factions =
			{

			},
			subcultures = 
			{
				troy_rem_sbc_thracophrygian_phrygians = " ",
				troy_rem_sbc_thracophrygian_thracians = " ",
				troy_rem_sbc_hordes_aethiopians = "troy_hist_hero_rem_memnon_warlord_warmonger_bodyguard_manfyt_infantry",
			},
		},
		troy_rem_mem_archer_skirmisher = 
		{
			factions =
			{
				troy_rem_horde_aethiopians = "troy_hist_hero_rem_memnon_archer_skirmisher_bodyguard_egyptian_slingers",

			},
			
		},

		troy_rem_mem_archer_trickster = 
		{
			factions =
			{
				troy_rem_horde_aethiopians = "troy_hist_hero_rem_memnon_archer_trickster_bodyguard_aethiopian_hunters",

			},
			
		},

		troy_rem_mem_fighter_balanced = 
		{
			factions =
			{
				troy_rem_horde_aethiopians = "troy_hist_hero_rem_memnon_fighter_champion_bodyguard_aethiopian_spearmen",

			},
		
			
		},

		troy_rem_mem_fighter_disruptor = 
		{
			factions =
			{
				troy_rem_horde_aethiopians = "troy_hist_hero_rem_memnon_fighter_ravager_bodyguard_aethiopian_spearmen",

			},
			
		},

		troy_rem_mem_fighter_killer = 
		{
			factions =
			{
				troy_rem_horde_aethiopians = "troy_hist_hero_rem_memnon_fighter_vanquisher_bodyguard_aethiopian_spearmen",

			},

		},


		troy_rem_mem_warlord_tactician = 
		{
			factions =
			{
				troy_rem_horde_aethiopians = "troy_hist_hero_rem_memnon_warlord_commander_bodyguard_manfyt_infantry",

			},
		},

		troy_rem_mem_warlord_utility = 
		{
			factions =
			{
				troy_rem_horde_aethiopians = "troy_hist_hero_rem_memnon_warlord_mentor_bodyguard_manfyt_infantry",

			},
		},
		
		troy_rem_mem_warlord_warmonger = 
		{
			factions =
			{
				troy_rem_horde_aethiopians = "troy_hist_hero_rem_memnon_warlord_warmonger_bodyguard_manfyt_infantry",

			},
		},

		-- START POS UNIQUE GENERALS  ----------------------------------------------------------------------
		-- Those are listed here in order to mark them as not needing a bodyguard ancillary, as their basic bodyguard ancillaries are already given to them by the start pos.
		troy_achilles = {
			no_script_ancillary = true,
			default_ancillary_after_confederation = "troy_hist_anc_bodyguard_achilles_basic_spearmen",
		},
		troy_agamemnon = {
			no_script_ancillary = true,
			default_ancillary_after_confederation = "troy_hist_anc_bodyguard_agamemnon_shielded_clubmen",
		},
		troy_menelaus = {
			no_script_ancillary = true,
			default_ancillary_after_confederation = "troy_hist_anc_bodyguard_menelaus_laconian_axemen",
		},
		troy_odysseus = {
			no_script_ancillary = true,
			default_ancillary_after_confederation = "troy_hist_anc_bodyguard_odysseus_bowmen",
		},
		troy_hector = {
			no_script_ancillary = true,
			default_ancillary_after_confederation = "troy_hist_anc_bodyguard_hector_renowned_swordsmen",
		},
		troy_paris = {
			no_script_ancillary = true,
			default_ancillary_after_confederation = "troy_hist_anc_bodyguard_paris_trojan_archers",
		},
		troy_aeneas = {
			no_script_ancillary = true,
			default_ancillary_after_confederation = "troy_hist_anc_bodyguard_aeneas_anatolian_swords",
		},
		troy_sarpedon = {
			no_script_ancillary = true,
			default_ancillary_after_confederation = "troy_hist_anc_bodyguard_sarpedon_heavy_axe_warriors",
		},
		troy_hippolyta = {
			no_script_ancillary = true,
			default_ancillary_after_confederation = "troy_hist_anc_bodyguard_hippolyta_amazon_archers",
		},
		troy_penthesilea = {
			no_script_ancillary = true,
			default_ancillary_after_confederation = "troy_hist_anc_bodyguard_penthesilea_oathsworn",
		},
		troy_adi_ajax = {
			no_script_ancillary = true,
			default_ancillary_after_confederation = "troy_hist_anc_bodyguard_ajax_island_spearmen",
		},
		troy_adi_diomedes = {
			no_script_ancillary = true,
			default_ancillary_after_confederation = "troy_hist_anc_bodyguard_diomedes_argive_swordsmen",
		},
	}	
}

-- ================================================================================================================================================ 
-- ================================================================== SCRIPTING ===================================================================
-- ================================================================================================================================================ 

-- local helper functions
local DEBUG = true
local debug_preff = "BODYGUARD AS ANCILLARY: "

local function output(str, force_out)
	if DEBUG or force_out then
		out(debug_preff..(str or "nil"))
	end
end

local function err(str)
	output("ERROR - "..(str or "unknown"), true)
end

-- listeners
core:add_listener(
	bodyguard_as_ancillary_setup.preff.."_FirstTickAfterWorldCreated",
	"FirstTickAfterWorldCreated",
	true,
	function(context)
		output("add listeners")
		
		-- add bodyguard ancillary to newly recruited heroes
		core:add_listener (
			bodyguard_as_ancillary_setup.preff.."_NewCharacterRecruited",
			"NewCharacterRecruited",
			function(context)
				local character = context:character()
				return character:has_military_force()
			end,
			function(context)
				bodyguard_as_ancillary_setup:add_bodyguard_as_ancillary(context)
			end,
			true
		)

		core:add_listener (
			bodyguard_as_ancillary_setup.preff.."CharacterCreated",
			"CharacterCreated",
			function(context)
				local character = context:character()
				return character:has_military_force()
			end,
			function(context)
				bodyguard_as_ancillary_setup:add_bodyguard_as_ancillary(context)
			end,
			true
		)

		core:add_listener(
			bodyguard_as_ancillary_setup.preff.."FactionJoinsConfederationBeforeReassign",
			"FactionJoinsConfederationBeforeReassign",
			true,
			function(context)
				local joining_faction = context:faction()
				local forces = joining_faction:military_force_list()
				local num_forces = forces:num_items()

				for i = 0, num_forces - 1 do
					local general = forces:item_at(i):general_character()

					if not general:is_null_interface() then
						cm:force_remove_all_ancillaries_of_type(cm:char_lookup_str(general), bodyguard_as_ancillary_setup.historical_ancillary_type)
						table_erase(bodyguard_as_ancillary_setup.double_add_bodyguard_as_ancillary_prevention, general:family_member():command_queue_index())
						bodyguard_as_ancillary_setup:add_bodyguard_as_ancillary(nil, general, true)
					end
				end
			end,
			true
		)

	end,
	true
)

-- In some cases "NewCharacterRecruited" is called immediately after "CharacterCreated" and "add_bodyguard_as_ancillary" is called twice.
-- Additionally, if a general gets rehired, they would be given their base bodyguard ancillary again.
-- Here is a simple solution to prevent this. All characters that were already given the base bodyguard ancillary are noted here by their family member CQI.
bodyguard_as_ancillary_setup.double_add_bodyguard_as_ancillary_prevention = {}

function bodyguard_as_ancillary_setup:has_added_ancillary(character_family_member_cqi)
	return table_contains(self.double_add_bodyguard_as_ancillary_prevention, character_family_member_cqi)
end

function bodyguard_as_ancillary_setup:set_added_ancillary(character_family_member_cqi)
	table.insert(self.double_add_bodyguard_as_ancillary_prevention, character_family_member_cqi)
end

-- This function adds the ancillary which provides a bodyguard unit to a character.
-- The main object needed is a character. Either provide a character or a context with a direct access to the character.
function bodyguard_as_ancillary_setup:add_bodyguard_as_ancillary(context, char, is_confederation --[[optional--]]) 
	local ancillary = ""
	local character = nil
	if context then
		character = char or context:character() 
	end

	if not character then
		err("bodyguard_as_ancillary_setup:add_bodyguard_as_ancillary called but neither the context provided has access to a character, nor a character interface is provided!")
		return
	end

	-- Colonels are garrison commanders. They're setup in Dave as part of the armed citizanry setup to use the bodyguard unit. No need to give them the ancillary.
	if character:character_type_key() == "colonel" then 
		return
	end

	local faction_name = character:faction():name()
	local subtype = character:character_subtype_key()
	local rebel_subculture = character:rebel_general_subculture()
	local subculture = (rebel_subculture ~= "") and rebel_subculture or character:faction():subculture()

	local link_table = faction_name ~= "" and subtype ~= "" and subculture ~= "" and self.link_table or nil

	if is_table(link_table) and is_table(link_table[subtype]) then
		if is_confederation and link_table[subtype].default_ancillary_after_confederation then
			ancillary = link_table[subtype].default_ancillary_after_confederation
		elseif link_table[subtype].no_script_ancillary then
			return	-- Nothing to be done here, as this general does not require an ancillary to be given via this script.
		end
		
		if is_table(link_table[subtype].factions) and link_table[subtype].factions[faction_name] and link_table[subtype].factions[faction_name] ~= "" then

			ancillary = link_table[subtype].factions[faction_name]

		elseif is_table(link_table[subtype].subcultures) and is_string(link_table[subtype].subcultures[subculture]) and link_table[subtype].subcultures[subculture] ~= "" then

			ancillary = link_table[subtype].subcultures[subculture]

		end

	end

	if ancillary and ancillary ~= "" then
		local family_member_cqi = character:family_member():command_queue_index()
		if not bodyguard_as_ancillary_setup:has_added_ancillary(family_member_cqi) then
			bodyguard_as_ancillary_setup:set_added_ancillary(family_member_cqi)
			cm:force_add_and_equip_ancillary(cm:char_lookup_str(character), ancillary)
		end
	else
		err("Missing 'ANCILLARY KEY' to add to character("..character:get_forename()..", "..character:command_queue_index()..") with faction("..faction_name..") and subtype("..subtype..") and subculture("..subculture..")")
	end
end

--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------

cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("TROY_BODYGUARD_AS_ANCILLARY_DOUBLE_ADD_PREVENTION", bodyguard_as_ancillary_setup.double_add_bodyguard_as_ancillary_prevention, context)
	end
)

cm:add_loading_game_callback(
	function(context)
		bodyguard_as_ancillary_setup.double_add_bodyguard_as_ancillary_prevention = cm:load_named_value("TROY_BODYGUARD_AS_ANCILLARY_DOUBLE_ADD_PREVENTION", bodyguard_as_ancillary_setup.double_add_bodyguard_as_ancillary_prevention, context)
	end
)