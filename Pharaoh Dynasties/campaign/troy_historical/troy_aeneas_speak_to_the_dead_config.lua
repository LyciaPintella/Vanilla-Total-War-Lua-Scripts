out("Loading troy_aeneas_speak_to_the_dead_config.lua -> troy_historical")

speak_to_the_dead_default_entries = {
	[1] = {
		name = "names_name_476952033", 
		art_set = "troy_achilles",
		image = "data/ui/portraits/speak_with_the_dead_portraits/dardanus_dead.png",
		locked_tooltip_key = "speak_with_dead_locked_tooltip_generic",
		cooldown = 7,
		initial_cd = 7,
		incident_key = "troy_main_incident_speak_dead_dardanus",
		bundles = {		   
			[1] = {
				key = "effect_bundle_fm_speak_dead_favour_dummy",
				duration = 0
			},
			[2] = {
				key = "effect_bundle_fm_speak_dead_happiness_dardanus",
				duration = 2
			},
			[3] = {
				key = "effect_bundle_fm_speak_dead_dardanus_food_dummy",
				duration = 0
			},	
			[4] = {
				key = "effect_bundle_fm_speak_dead_dardanus",
				duration = 6
			}
		}
	},
	[2] = {
		name = "names_name_1854377642", 
		art_set = "troy_achilles",
		image = "data/ui/portraits/speak_with_the_dead_portraits/ilus_dead.png",
		locked_tooltip_key = "speak_with_dead_locked_tooltip_generic",
		cooldown = 7,
		initial_cd = 7,
		incident_key = "troy_main_incident_speak_dead_illus",
		bundles = {
			[1] = {
				key = "effect_bundle_fm_speak_dead_favour_dummy",
				duration = 0
			},
			[2] = {
				key = "effect_bundle_fm_speak_dead_happiness_illus",
				duration = 2
			},
			[3] = {
				key = "effect_bundle_fm_speak_dead_illus",
				duration = 6
			}
		}
	},
	[3] = {
		name = "names_name_935626723", 
		art_set = "troy_achilles",
		image = "data/ui/portraits/speak_with_the_dead_portraits/assaracus_dead.png",
		locked_tooltip_key = "speak_with_dead_locked_tooltip_generic",
		cooldown = 7,
		initial_cd = 7,
		incident_key = "troy_main_incident_speak_dead_assaracus",
		bundles = {
			[1] = {
				key = "effect_bundle_fm_speak_dead_favour_dummy",
				duration = 0
			},
			[2] = {
				key = "effect_bundle_fm_speak_dead_happiness_assaracus",
				duration = 2
			},
			[3] = {
				key = "effect_bundle_fm_speak_dead_assaracus",
				duration = 6
			}
		}
	},
}

speak_to_the_dead_default_bundle = {
	key = "troy_main_speak_dead_all",
	duration = 2
}

speak_to_the_dead_regions = {
	troy_main_magnesia_iolcos = {
		name = "names_name_1972408865",		-- ID from names table
		art_set = "troy_achilles",  -- Art set ID
		image = "data/ui/portraits/speak_with_the_dead_portraits/jason_dead.png",
		locked_tooltip_key = "speak_with_dead_locked_tooltip_jason",
		cooldown = 14,
		incident_key = {
			[1] = "troy_main_incident_speak_dead_jason_1",		-- These incidents should spawn one after the other, until incident 5 is triggered. From then on only incident 5 should be triggered.
			[2] = "troy_main_incident_speak_dead_jason_2",
			[3] = "troy_main_incident_speak_dead_jason_3",
			[4] = "troy_main_incident_speak_dead_jason_4",
			[5] = "troy_main_incident_speak_dead_jason_5"
		},
		available_incident_key = "troy_main_incident_speak_dead_jason_available",	   
		bundles = {
			[1] = {
				key = "effect_bundle_fm_speak_dead_favour_dummy",
				duration = 0
			},
			[2] = {
				key = "effect_bundle_fm_speak_dead_happiness_jason",
				duration = 2
			},
			[3] = {
				key = "effect_bundle_fm_speak_dead_treasures_dummy",
				duration = 0
			},
			[4] = {
				key = "effect_bundle_fm_speak_dead_jason",
				duration = 7
			}
		}
	}, 
	troy_main_cragos_arinna = {
		name = "names_name_861692463",		-- ID from names table
		art_set = "troy_achilles",  -- Art set ID
		image = "data/ui/portraits/speak_with_the_dead_portraits/bellerophon_dead.png",
		cooldown = 14,
		locked_tooltip_key = "speak_with_dead_locked_tooltip_bellerophon",
		incident_key = {
			[1] = "troy_main_incident_speak_dead_bellerophon_1",		-- These incidents should spawn one after the other, until incident 5 is triggered. From then on only incident 5 should be triggered.
			[2] = "troy_main_incident_speak_dead_bellerophon_2",
			[3] = "troy_main_incident_speak_dead_bellerophon_3",
			[4] = "troy_main_incident_speak_dead_bellerophon_4",
			[5] = "troy_main_incident_speak_dead_bellerophon_5"
		},
		available_incident_key = "troy_main_incident_speak_dead_bellerophon_available",
		bundles = {
			[1] = {
				key = "effect_bundle_fm_speak_dead_favour_dummy",
				duration = 0
			},
			[2] = {
				key = "effect_bundle_fm_speak_dead_happiness_bellerophon",
				duration = 2
			},
			[3] = {
				key = "effect_bundle_fm_speak_dead_treasures_dummy",
				duration = 0
			},
			[4] = {
				key = "effect_bundle_fm_speak_dead_bellerophon",
				duration = 7
			}
		}		
	},
	troy_main_ida_knossos = {
		name = "names_name_1310926332",		-- ID from names table
		art_set = "troy_achilles",  -- Art set ID
		image = "data/ui/portraits/speak_with_the_dead_portraits/daedalus_dead.png",
		locked_tooltip_key = "speak_with_dead_locked_tooltip_daedalus",
		cooldown = 8,
		incident_key = "troy_main_incident_speak_dead_daedalus",
		available_incident_key = "troy_main_incident_speak_dead_daedalus_available",
		bundles = {
			[1] = {
				key = "effect_bundle_fm_speak_dead_favour_dummy",
				duration = 0
			},
			[2] = {
				key = "effect_bundle_fm_speak_dead_happiness_daedalus",
				duration = 2
			},
			[3] = {
				key = "effect_bundle_fm_speak_dead_daedalus",
				duration = 6
			}
		}		
	},
	troy_main_thrace_ismaros = {
		name = "names_name_82002783",		-- ID from names table
		art_set = "troy_achilles",  -- Art set ID
		image = "data/ui/portraits/speak_with_the_dead_portraits/orpheus_dead.png",
		locked_tooltip_key = "speak_with_dead_locked_tooltip_orpheus",
		cooldown = 9,
		incident_key = "troy_main_incident_speak_dead_orpheus",
		available_incident_key = "troy_main_incident_speak_dead_orpheus_available",
  		bundles = {
			[1] = {
				key = "effect_bundle_fm_speak_dead_favour_dummy",
				duration = 0
			},
			[2] = {
				key = "effect_bundle_fm_speak_dead_happiness_orpheus",
				duration = 2
			},
			[3] = {
				key = "effect_bundle_fm_speak_dead_orpheus",
				duration = 6
			}
		}
	}
}

speak_to_the_dead_unit_classes = {
	chariot = {
		name = "names_name_672109850",		-- ID from names table
		art_set = "troy_achilles",  -- Art set ID
		image = "data/ui/portraits/speak_with_the_dead_portraits/trochilus_dead.png",
		locked_tooltip_key = "speak_with_dead_locked_tooltip_trochilus",
		cooldown = 15,
		incident_key = "troy_main_incident_speak_dead_trochilus",
		available_incident_key = "troy_main_incident_speak_dead_trochilus_available",
		bundles = {
			[1] = {
				key = "effect_bundle_fm_speak_dead_favour_dummy",
				duration = 0
			},
			[2] = {
				key = "effect_bundle_fm_speak_dead_happiness_trochilus",
				duration = 2
			},
			[3] = {
				key = "effect_bundle_fm_speak_dead_trochilus_dummy",
				duration = 0
			},
			[4] = {
				key = "effect_bundle_fm_speak_dead_trochilus",
				duration = 8
			}
		}
	}
}

speak_to_the_dead_character_subtypes = {
	-- Perseus is not available for the Historical campaign.
	--[[
	troy_agent_gorgon = {
		name = "names_name_473644104",		-- ID from names table
		art_set = "troy_achilles",  -- Art set ID
		image = "data/ui/portraits/speak_with_the_dead_portraits/dardanus_perseus.png",
		locked_tooltip_key = "speak_with_dead_locked_tooltip_perseus",
		cooldown = 8,
		incident_key = "troy_main_incident_speak_dead_perseus",
		available_incident_key = "troy_main_incident_speak_dead_perseus_available",
		bundles = {
			[1] = {
				key = "effect_bundle_fm_speak_dead_favour_dummy",
				duration = 0
			},
			[2] = {
				key = "effect_bundle_fm_speak_dead_happiness_perseus",
				duration = 2
			},
			[3] = {
				key = "effect_bundle_fm_speak_dead_perseus",
				duration = 6
			}
		}
	}
	]]
}

speak_to_the_dead_faction_leader_ranks = {
	[25] = {
		name = "names_name_544865827",		-- ID from names table
		art_set = "troy_achilles",  -- Art set ID
		image = "data/ui/portraits/speak_with_the_dead_portraits/heracles_dead.png",
		locked_tooltip_key = "speak_with_dead_locked_tooltip_heracles",
		cooldown = 12,
		incident_key = "troy_main_incident_speak_dead_heracles",
		available_incident_key = "troy_main_incident_speak_dead_heracles_available",
 		bundles = {
			[1] = {
				key = "effect_bundle_fm_speak_dead_favour_dummy",
				duration = 0
			},
			[2] = {
				key = "effect_bundle_fm_speak_dead_happiness_heracles",
				duration = 2
			},
			[3] = {
				key = "effect_bundle_fm_speak_dead_heracles",
				duration = 6
			}
		}
	}
}

speak_to_the_dead_buildings = { -- supports both by chain and by building level
	troy_main_religion_athens_4 = {
		name = "names_name_486346677",		-- ID from names table
		art_set = "troy_achilles",  -- Art set ID
		image = "data/ui/portraits/speak_with_the_dead_portraits/perdix_dead.png",
		locked_tooltip_key = "speak_with_dead_locked_tooltip_perdix",
		cooldown = 14,
		incident_key = "troy_main_incident_speak_dead_perdix",
		available_incident_key = "troy_main_incident_speak_dead_perdix_available",
		bundles = {
			[1] = {
				key = "effect_bundle_fm_speak_dead_favour_dummy",
				duration = 0
			},
			[2] = {
				key = "effect_bundle_fm_speak_dead_happiness_perdix",
				duration = 2
			},
			[3] = {
				key = "effect_bundle_fm_speak_dead_perdix",
				duration = 7
			}
		}
	},
	troy_main_port_3 = {
		name = "names_name_584489490",		-- ID from names table
		art_set = "troy_achilles",  -- Art set ID
		image = "data/ui/portraits/speak_with_the_dead_portraits/theseus_dead.png",
		locked_tooltip_key = "speak_with_dead_locked_tooltip_theseus",
		cooldown = 10,
		incident_key = "troy_main_incident_speak_dead_theseus",
		available_incident_key = "troy_main_incident_speak_dead_theseus_available",
		bundles = {
			[1] = {
				key = "effect_bundle_fm_speak_dead_favour_dummy",
				duration = 0
			},
			[2] = {
				key = "effect_bundle_fm_speak_dead_happiness_theseus",
				duration = 2
			},
			[3] = {
				key = "effect_bundle_fm_speak_dead_theseus",
				duration = 6
			}
		}
	},
}

faction_leader_entries = {
	[1] = {
		faction = "troy_main_dan_achilles",
		trait = "",
		image = "data/ui/portraits/speak_with_the_dead_portraits/achilles_dead.png",
		locked_tooltip_key = "speak_with_dead_locked_tooltip_generic_male",
		cooldown = 9,
		incident_key = "troy_main_incident_speak_dead_achilles",
		available_incident_key = "troy_main_incident_speak_dead_achilles_available",
		bundles = {
			[1] = {
				key = "effect_bundle_fm_speak_dead_favour_dummy",
				duration = 0
			},
			[2] = {
				key = "effect_bundle_fm_speak_dead_happiness_achilles",
				duration = 2
			},
			[3] = {
				key = "effect_bundle_fm_speak_dead_achilles",
				duration = 6
			}
		}
	},
	[2] = {
		faction = "troy_main_trj_hector",
		trait = "",
		cooldown = 8,
		locked_tooltip_key = "speak_with_dead_locked_tooltip_generic_male",
		image = "data/ui/portraits/speak_with_the_dead_portraits/hector_dead.png",
		incident_key = "troy_main_incident_speak_dead_hector",
		available_incident_key = "troy_main_incident_speak_dead_hector_available",
		bundles = {
			[1] = {
				key = "effect_bundle_fm_speak_dead_favour_dummy",
				duration = 0
			},
			[2] = {
				key = "effect_bundle_fm_speak_dead_happiness_hector",
				duration = 2
			},
			[3] = {
				key = "effect_bundle_fm_speak_dead_hector",
				duration = 6
			}
		}
	},
	[3] = {
		faction = "troy_main_trj_paris",
		trait = "",
		cooldown = 9,
		locked_tooltip_key = "speak_with_dead_locked_tooltip_generic_male",
		image = "data/ui/portraits/speak_with_the_dead_portraits/paris_dead.png",
		incident_key = "troy_main_incident_speak_dead_paris",
		available_incident_key = "troy_main_incident_speak_dead_paris_available",
		bundles = {
			[1] = {
				key = "effect_bundle_fm_speak_dead_favour_dummy",
				duration = 0
			},
			[2] = {
				key = "effect_bundle_fm_speak_dead_happiness_paris",
				duration = 2
			},
			[3] = {
				key = "effect_bundle_fm_speak_dead_paris",
				duration = 6
			}
		}
	},
	[4] = {
		faction = "troy_main_dan_mycenae",
		trait = "",
		cooldown = 9,
		locked_tooltip_key = "speak_with_dead_locked_tooltip_generic_male",
		image = "data/ui/portraits/speak_with_the_dead_portraits/agamemnon_dead.png",
		incident_key = "troy_main_incident_speak_dead_agamemnon",
		available_incident_key = "troy_main_incident_speak_dead_agamemnon_available",
		bundles = {
			[1] = {
				key = "effect_bundle_fm_speak_dead_favour_dummy",
				duration = 0
			},
			[2] = {
				key = "effect_bundle_fm_speak_dead_happiness_agamemnon",
				duration = 2
			},
			[3] = {
				key = "effect_bundle_fm_speak_dead_agamemnon",
				duration = 6
			}
		}
	},
	[5] = {
		faction = "troy_main_dan_sparta",
		trait = "",
		cooldown = 9,
		locked_tooltip_key = "speak_with_dead_locked_tooltip_generic_male",
		image = "data/ui/portraits/speak_with_the_dead_portraits/menelaus_dead.png",
		incident_key = "troy_main_incident_speak_dead_menelaus",
		available_incident_key = "troy_main_incident_speak_dead_menelaus_available",
		bundles = {
			[1] = {
				key = "effect_bundle_fm_speak_dead_favour_dummy",
				duration = 0
			},
			[2] = {
				key = "effect_bundle_fm_speak_dead_happiness_menelaus",
				duration = 2
			},
			[3] = {
				key = "effect_bundle_fm_speak_dead_menelaus",
				duration = 6
			}
		}
	},
	[6] = {
		faction = "troy_main_dan_ithaca",
		trait = "",
		cooldown = 9,
		locked_tooltip_key = "speak_with_dead_locked_tooltip_generic_male",
		image = "data/ui/portraits/speak_with_the_dead_portraits/odysseus_dead.png",
		incident_key = "troy_main_incident_speak_dead_odysseus",
		available_incident_key = "troy_main_incident_speak_dead_odysseus_available",
		bundles = {
			[1] = {
				key = "effect_bundle_fm_speak_dead_favour_dummy",
				duration = 0
			},
			[2] = {
				key = "effect_bundle_fm_speak_dead_happiness_odysseus",
				duration = 2
			},
			[3] = {
				key = "effect_bundle_fm_speak_dead_odysseus",
				duration = 6
			}
		}
	},
	[7] = {
		faction = "troy_main_trj_lycia",
		trait = "",
		cooldown = 9,
		locked_tooltip_key = "speak_with_dead_locked_tooltip_generic_male",
		image = "data/ui/portraits/speak_with_the_dead_portraits/sarpedon_dead.png",
		incident_key = "troy_main_incident_speak_dead_sarpedon",
		available_incident_key = "troy_main_incident_speak_dead_sarpedon_available",
		bundles = {
			[1] = {
				key = "effect_bundle_fm_speak_dead_favour_dummy",
				duration = 0
			},
			[2] = {
				key = "effect_bundle_fm_speak_dead_happiness_sarpedon",
				duration = 2
			},
			[3] = {
				key = "effect_bundle_fm_speak_dead_sarpedon",
				duration = 6
			}
		}
	},
	[8] = {
		faction = "troy_amazons_trj_hippolyta",
		trait = "",
		cooldown = 9,
		locked_tooltip_key = "speak_with_dead_locked_tooltip_generic_female",
		image = "data/ui/portraits/speak_with_the_dead_portraits/hippolyta_dead.png",
		incident_key = "troy_main_incident_speak_dead_hippolyta",
		available_incident_key = "troy_main_incident_speak_dead_hippolyta_available",
		bundles = {
			[1] = {
				key = "effect_bundle_fm_speak_dead_favour_dummy",
				duration = 0
			},
			[2] = {
				key = "effect_bundle_fm_speak_dead_happiness_hippolyta",
				duration = 2
			},
			[3] = {
				key = "effect_bundle_fm_speak_dead_hippolyta",
				duration = 6
			}
		}
	},
	[9] = {
		faction = "troy_amazons_trj_penthesilea",
		trait = "",
		cooldown = 9,
		locked_tooltip_key = "speak_with_dead_locked_tooltip_generic_female",
		image = "data/ui/portraits/speak_with_the_dead_portraits/penthesilea_dead.png",
		incident_key = "troy_main_incident_speak_dead_penthesilea",
		available_incident_key = "troy_main_incident_speak_dead_penthesilea_available",
		bundles = {
			[1] = {
				key = "effect_bundle_fm_speak_dead_favour_dummy",
				duration = 0
			},
			[2] = {
				key = "effect_bundle_fm_speak_dead_happiness_penthesilea",
				duration = 2
			},
			[3] = {
				key = "effect_bundle_fm_speak_dead_penthesilea",
				duration = 6
			}
		}
	},
	[10] = {
		faction = "troy_main_dan_salamis",
		trait = "",
		cooldown = 9,
		locked_tooltip_key = "speak_with_dead_locked_tooltip_generic_male",
		image = "data/ui/portraits/speak_with_the_dead_portraits/ajax_dead.png",
		incident_key = "troy_adi_incident_speak_dead_ajax",
		available_incident_key = "troy_adi_incident_speak_dead_ajax_available",
		bundles = {
			[1] = {
				key = "effect_bundle_fm_speak_dead_favour_dummy",
				duration = 0
			},
			[2] = {
				key = "effect_bundle_fm_speak_dead_happiness_adi_ajax",
				duration = 2
			},
			[3] = {
				key = "effect_bundle_fm_speak_dead_adi_ajax",
				duration = 6
			}
		}
	},
	[11] = {
		faction = "troy_main_dan_argos",
		trait = "",
		cooldown = 9,
		locked_tooltip_key = "speak_with_dead_locked_tooltip_generic_male",
		image = "data/ui/portraits/speak_with_the_dead_portraits/diomedes_dead.png",
		incident_key = "troy_adi_incident_speak_dead_diomedes",
		available_incident_key = "troy_adi_incident_speak_dead_diomedes_available",
		bundles = {
			[1] = {
				key = "effect_bundle_fm_speak_dead_favour_dummy",
				duration = 0
			},
			[2] = {
				key = "effect_bundle_fm_speak_dead_happiness_adi_diomedes",
				duration = 2
			},
			[3] = {
				key = "effect_bundle_fm_speak_dead_adi_diomedes",
				duration = 6
			}
		}
	},
	[12] = {
		faction = "troy_rem_horde_aethiopians",
		trait = "",
		cooldown = 9,
		locked_tooltip_key = "speak_with_dead_locked_tooltip_generic_male",
		image = "data/ui/portraits/speak_with_the_dead_portraits/memnon_dead.png",
		incident_key = "troy_rem_incident_speak_dead_memnon",
		available_incident_key = "troy_rem_incident_speak_dead_memnon_available",
		bundles = {
			[1] = {
				key = "effect_bundle_fm_speak_dead_favour_dummy",
				duration = 0
			},
			[2] = {
				key = "effect_bundle_fm_speak_dead_rem_memnon",
				duration = 2
			},
			[3] = {
				key = "effect_bundle_fm_speak_dead_happiness_rem_memnon",
				duration = 6
			}
		}
	},
	[13] = {
		faction = "troy_rem_trj_thrace",
		trait = "",
		cooldown = 9,
		locked_tooltip_key = "speak_with_dead_locked_tooltip_generic_male",
		image = "data/ui/portraits/speak_with_the_dead_portraits/rhesus_dead.png",
		incident_key = "troy_rem_incident_speak_dead_rhesus",
		available_incident_key = "troy_rem_incident_speak_dead_rhesus_available",
		bundles = {
			[1] = {
				key = "effect_bundle_fm_speak_dead_favour_dummy",
				duration = 0
			},
			[2] = {
				key = "effect_bundle_fm_speak_dead_rem_rhesus",
				duration = 2
			},
			[3] = {
				key = "effect_bundle_fm_speak_dead_happiness_rem_rhesus",
				duration = 6
			}
		}
	}
}


speak_to_the_dead_favour_cost = -10
