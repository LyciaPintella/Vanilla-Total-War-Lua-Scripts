out("Loading troy_capture_bonuses_config.lua")

-- Factions that can use the capture bonuses system
capture_bonuses.factions = {
	troy_amazons_trj_penthesilea = true,
	troy_rem_horde_aethiopians = true,
}

capture_bonuses.ui_config = {
	background_states = {
		troy_amazons_trj_penthesilea = "default",
		troy_rem_horde_aethiopians = "rem"
	},
	mechanic_desc_states = {
		troy_amazons_trj_penthesilea = "NewState",
		troy_rem_horde_aethiopians = "desc_memnon",
	}
} 

-- Based on this table, the resources may or may not appear in the Faction mechanic panel
capture_bonuses.availability = {
	capture_bonus_gold = {
		campaigns = {"main_troy", "troy_historical", "troy_mythic"},
		factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
	},
	capture_bonus_food = {
		campaigns = {"main_troy", "troy_historical", "troy_mythic"},
		factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
	},
	capture_bonus_wood = {
		campaigns = {"main_troy", "troy_historical", "troy_mythic"},
		factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
	},
	capture_bonus_stones = {
		campaigns = {"main_troy", "troy_historical", "troy_mythic"},
		factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
	},
	capture_bonus_bronze = {
		campaigns = {"main_troy", "troy_historical", "troy_mythic"},
		factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
	},
	capture_bonus_momentum = {
		campaigns = {"main_troy", "troy_historical", "troy_mythic"},
		factions = {"troy_amazons_trj_penthesilea"},
	},
	capture_bonus_god_attitude_zeus = {
		campaigns = {"main_troy", "troy_historical", "troy_mythic"},
		factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
	},
	capture_bonus_god_attitude_poseidon = {
		campaigns = {"main_troy", "troy_historical", "troy_mythic"},
		factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
	},
	capture_bonus_god_attitude_hera = {
		campaigns = {"main_troy", "troy_historical", "troy_mythic"},
		factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
	},
	capture_bonus_god_attitude_athena = {
		campaigns = {"main_troy", "troy_historical", "troy_mythic"},
		factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
	},
	capture_bonus_god_attitude_ares = {
		campaigns = {"main_troy", "troy_historical", "troy_mythic"},
		factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
	},
	capture_bonus_god_attitude_apollo = {
		campaigns = {"main_troy", "troy_historical", "troy_mythic"},
		factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
	},
	capture_bonus_god_attitude_aphrodite = {
		campaigns = {"main_troy", "troy_historical", "troy_mythic"},
		factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
	},	
	capture_bonus_god_attitude_artemis = {
		campaigns = {"main_troy", "troy_historical", "troy_mythic"},
		factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
	},
	capture_bonus_god_attitude_hephaestus = {
		campaigns = {"main_troy", "troy_historical", "troy_mythic"},
		factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
	},
	capture_bonus_vision = {
		campaigns = {"main_troy", "troy_historical", "troy_mythic"},
		factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
	},
	capture_bonus_giants = {
		campaigns = {"main_troy", "troy_mythic"},
		factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
	},
	capture_bonus_centaurs = {
		campaigns = {"main_troy", "troy_mythic"},
		factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
	},
	capture_bonus_sirens = {
		campaigns = {"main_troy", "troy_mythic"},
		factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
	},
	capture_bonus_harpies = {
		campaigns = {"main_troy", "troy_mythic"},
		factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
	},
	capture_bonus_larger_buckets = {
		campaigns = {"main_troy", "troy_historical", "troy_mythic"},
		factions = {"troy_rem_horde_aethiopians"},
	},
}

-- Bonus resources from capture bonus will be received with this factor
capture_bonuses.resource_factor = "troy_resource_factor_faction"
capture_bonuses.favour_factor = "troy_god_attitude_factor_faction"
 
-- Capture bonus configuration for the different regions.
-- You can specify more than one bonus per region in order to apply filtering based on faction or campaign name
-- Note that if configured incorrectly and more than one bonus is applicable for given faction and campaign,
-- the used bonus will be the first entry for the region that meets the faction and campaign criteria
capture_bonuses.regions = {
	troy_main_adrastea_adresteia = {
		{
			bonus = "capture_bonus_god_attitude_zeus",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_adrastea_pericharaxis = {
		{
			bonus = "capture_bonus_stones",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 205, -- amount if the bonus is resource
			value_per_turn_modifier = 20,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_adrastea_practios = {
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		}
	},
	troy_main_adrastea_skepsis = {
		{
			bonus = "capture_bonus_wood",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2024, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_wood",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3024, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_aega_lyrnessos = {
		{
			bonus = "capture_bonus_god_attitude_athena",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_aega_pedasos = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8450, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6050, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_aega_porosilene = {
		{
			bonus = "capture_bonus_vision",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_aega_thebe_hypoplakia = {
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 5510, -- amount if the bonus is resource
			value_per_turn_modifier = 100,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3510, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_aegialeia_aegion = {
		{
			bonus = "capture_bonus_gold",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 98, -- amount if the bonus is resource
			value_per_turn_modifier = 10,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_aegialeia_aroe = {
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		}
	},
	troy_main_aegialeia_cleitor = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8600, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6250, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_aegialeia_olenos = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8400, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6350, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_aetolia_agrinion = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8470, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6150, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_aetolia_astakos = {
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 5478, -- amount if the bonus is resource
			value_per_turn_modifier = 100,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3510, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_aetolia_calydon = {
		{
			bonus = "capture_bonus_god_attitude_artemis",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_aetolia_palairos = {
		{
			bonus = "capture_bonus_vision",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_almopia_apsalos = {
		{
			bonus = "capture_bonus_god_attitude_artemis",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_almopia_ioron = {
		{
			bonus = "capture_bonus_wood",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2080, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_wood",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3024, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_almopia_morrylos = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8517, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6350, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_apaesos_pegaea = {
		{
			bonus = "capture_bonus_vision",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_apaesos_percote = {
		{
			bonus = "capture_bonus_god_attitude_artemis",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_apaesos_priapos = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8420, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6150, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		
	},
	troy_main_arachthos_ambracos = {
		{
			bonus = "capture_bonus_harpies",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"troy_historical"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"troy_historical"}
		}
	},
	troy_main_arachthos_cassope = {
		{
			bonus = "capture_bonus_god_attitude_aphrodite",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_arachthos_dolopeis = {
		{
			bonus = "capture_bonus_stones",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 213, -- amount if the bonus is resource
			value_per_turn_modifier = 20,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_arachthos_nekromanteion = {
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		}
	},
	troy_main_argolis_argos = {
		{
			bonus = "capture_bonus_god_attitude_athena",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_argolis_erchomenos = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8577, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_vision",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_argolis_thyrea = {
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3510, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_astraeos_achyraos = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8456, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6250, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_astraeos_acrassos = {
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		}
	},
	troy_main_astraeos_pelopia = {
		{
			bonus = "capture_bonus_centaurs",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = { "troy_historical"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = { "troy_historical"}
		}
	},
	troy_main_attica_athens = {
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 15000, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3820, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_attica_keos = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8539, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6550, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_attica_marathon = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8500, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6350, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_attica_thorikos = {
		{
			bonus = "capture_bonus_gold",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 107, -- amount if the bonus is resource
			value_per_turn_modifier = 10,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_boeotia_hyria = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8421, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6150, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_boeotia_oropos = {
		{
			bonus = "capture_bonus_vision",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_boeotia_thebes = {
		{
			bonus = "capture_bonus_god_attitude_hephaestus",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_boeotia_thisbe = {
		{
			bonus = "capture_bonus_stones",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 191, -- amount if the bonus is resource
			value_per_turn_modifier = 20,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_borreas_kypasis = {
		{
			bonus = "capture_bonus_vision",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_borreas_sipte = {
		{
			bonus = "capture_bonus_harpies",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"troy_historical"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"troy_historical"}
		}
	},
	troy_main_borreas_tzirallon = {
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 5560, -- amount if the bonus is resource
			value_per_turn_modifier = 100,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3510, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_bottiaea_atalanta = {
		{
			bonus = "capture_bonus_harpies",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"troy_historical"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"troy_historical"}
		}
	},
	troy_main_bottiaea_kalindoia = {
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			value_per_turn_modifier = 0,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		}
	},
	troy_main_bottiaea_kition = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8401, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6350, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_bottiaea_therme = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8432, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6250, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_bythynia_chele = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8602, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6350, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_bythynia_procerastis = {
		{
			bonus = "capture_bonus_sirens",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"troy_historical"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"troy_historical"}
		}
	},
	troy_main_bythynia_pylae = {
		{
			bonus = "capture_bonus_god_attitude_hera",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_caria_alabanda = {
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 5415, -- amount if the bonus is resource
			value_per_turn_modifier = 100,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3510, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_caria_alinda = {
		{
			bonus = "capture_bonus_wood",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2058, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_wood",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3024, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_caria_halicarnassos = {
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		}
	},
	troy_main_caria_mylasa = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8480, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6250, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_cephallenia_hyrie = {
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 5550, -- amount if the bonus is resource
			value_per_turn_modifier = 100,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3510, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_cephallenia_ithaca = {
		{
			bonus = "capture_bonus_god_attitude_poseidon",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_cephallenia_kranioi = {
		{
			bonus = "capture_bonus_stones",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 205, -- amount if the bonus is resource
			value_per_turn_modifier = 20,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_cephallenia_same = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8515, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6410, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_cephisos_alpenos = {
		{
			bonus = "capture_bonus_stones",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 223, -- amount if the bonus is resource
			value_per_turn_modifier = 20,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_cephisos_gla = {
		{
			bonus = "capture_bonus_god_attitude_hera",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_cephisos_opous = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8590, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6430, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_cibyratis_balbura = {
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 5614, -- amount if the bonus is resource
			value_per_turn_modifier = 100,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3510, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_cibyratis_cibyra = {
		{
			bonus = "capture_bonus_god_attitude_hera",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_cibyratis_tlos = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8418, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6420, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_cragos_arinna = {
		{
			bonus = "capture_bonus_god_attitude_apollo",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_cragos_myra = {
		{
			bonus = "capture_bonus_harpies",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"troy_historical"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"troy_historical"}
		}
	},
	troy_main_cragos_phellos = {
		{
			bonus = "capture_bonus_wood",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 1900, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_stones",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 224, -- amount if the bonus is resource
			value_per_turn_modifier = 20,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_cyclades_ios = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8554, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6230, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_cyclades_minoa = {
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		}
	},
	troy_main_cyclades_naxos = {
		{
			bonus = "capture_bonus_gold",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 114, -- amount if the bonus is resource
			value_per_turn_modifier = 10,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_cyclades_paros = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8500, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6100, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_dardania_abydos = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8665, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6410, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_dardania_arisbe = {
		{
			bonus = "capture_bonus_wood",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2205, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_wood",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3024, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_dardania_dardanos = {
		{
			bonus = "capture_bonus_god_attitude_apollo",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_dardania_pityoussa = {
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		}
	},
	troy_main_edonis_aesyme = {
		{
			bonus = "capture_bonus_stones",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 220, -- amount if the bonus is resource
			value_per_turn_modifier = 20,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_edonis_antissara = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8309, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6470, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_edonis_galepsos = {
		{
			bonus = "capture_bonus_gold",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 90, -- amount if the bonus is resource
			value_per_turn_modifier = 10,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_elis_aliphera = {
		{
			bonus = "capture_bonus_gold",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 110, -- amount if the bonus is resource
			value_per_turn_modifier = 10,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_elis_altis = {
		{
			bonus = "capture_bonus_giants",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"troy_historical"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"troy_historical"}
		}
	},
	troy_main_elis_myrsinos = {
		{
			bonus = "capture_bonus_wood",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2134, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_wood",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3024, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_ellopia_cerinthos = {
		{
			bonus = "capture_bonus_vision",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_ellopia_histiaea = {
		{
			bonus = "capture_bonus_god_attitude_apollo",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_epagris_andros = {
		{
			bonus = "capture_bonus_god_attitude_poseidon",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_epagris_hydroessa = {
		{
			bonus = "capture_bonus_wood",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2030, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_wood",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3024, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_epagris_mykonos = {
		{
			bonus = "capture_bonus_vision",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_epagris_syros = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8350, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6460, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_epirus_cichyros = {
		{
			bonus = "capture_bonus_god_attitude_apollo",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_epirus_dodona = {
		{
			bonus = "capture_bonus_gold",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 105, -- amount if the bonus is resource
			value_per_turn_modifier = 10,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_epirus_onchesmos = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8600, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6230, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_epirus_tekmon = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8570, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6110, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_erythraea_clazomenai = {
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 5420, -- amount if the bonus is resource
			value_per_turn_modifier = 100,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3510, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_erythraea_erythrae = {
		{
			bonus = "capture_bonus_god_attitude_poseidon",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_erythraea_kyssos = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8610, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6320, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_euboea_carystos = {
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		}
	},
	troy_main_euboea_chalcis = {
		{
			bonus = "capture_bonus_giants",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"troy_historical"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"troy_historical"}
		}
	},
	troy_main_euboea_eretria = {
		{
			bonus = "capture_bonus_god_attitude_athena",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_ida_gortys = {
		{
			bonus = "capture_bonus_wood",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 1910, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_wood",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3024, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_ida_knossos = {
		{
			bonus = "capture_bonus_god_attitude_poseidon",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_ida_lyttos = {
		{
			bonus = "capture_bonus_vision",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_ida_phaestos = {
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 5700, -- amount if the bonus is resource
			value_per_turn_modifier = 100,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2510, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_ide_antandros = {
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			value_per_turn_modifier = 0,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		}
	},
	troy_main_ide_gargara = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8300, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6550, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_ide_zeleia = {
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 5450, -- amount if the bonus is resource
			value_per_turn_modifier = 100,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3510, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_ilion_thymbra = {
		{
			bonus = "capture_bonus_god_attitude_hera",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			value_per_turn_modifier = 0,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_ilion_troy = {
		{
			bonus = "capture_bonus_god_attitude_poseidon",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_isthmos_kaunos = {
		{
			bonus = "capture_bonus_centaurs",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = { "troy_historical"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = { "troy_historical"}
		}
	},
	troy_main_isthmos_knidos = {
		{
			bonus = "capture_bonus_gold",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 122, -- amount if the bonus is resource
			value_per_turn_modifier = 10,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_god_attitude_athena",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_isthmos_physkos = {
		{
			bonus = "capture_bonus_stones",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 200, -- amount if the bonus is resource
			value_per_turn_modifier = 20,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_kaystros_claros = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8504, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6290, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_kaystros_colophon = {
		{
			bonus = "capture_bonus_vision",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_kaystros_ephesos = {
		{
			bonus = "capture_bonus_gold",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 110, -- amount if the bonus is resource
			value_per_turn_modifier = 10,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_korcyra_lefcas = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8550, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6310, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_korcyra_scheria = {
		{
			bonus = "capture_bonus_sirens",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"troy_historical"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"troy_historical"}
		}
	},
	troy_main_krapathos_arcasia = {
		{
			bonus = "capture_bonus_giants",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"troy_historical"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"troy_historical"}
		}
	},
	troy_main_krapathos_pylaea = {
		{
			bonus = "capture_bonus_gold",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 103, -- amount if the bonus is resource
			value_per_turn_modifier = 10,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_lacedaemon_boeae = {
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		}
	},
	troy_main_lacedaemon_cythera = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8570, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6340, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_lacedaemon_oitylon = {
		{
			bonus = "capture_bonus_stones",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 196, -- amount if the bonus is resource
			value_per_turn_modifier = 20,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_lacedaemon_sparta = {
		{
			bonus = "capture_bonus_god_attitude_ares",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_lasynthos_lato = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8705, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_stones",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 200, -- amount if the bonus is resource
			value_per_turn_modifier = 20,
			factions = { "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_lasynthos_setaea = {
		{
			bonus = "capture_bonus_god_attitude_artemis",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_latmos_heracleia = {
		{
			bonus = "capture_bonus_gold",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 98, -- amount if the bonus is resource
			value_per_turn_modifier = 10,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_latmos_milethus = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8614, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6690, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_latmos_priene = {
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 5490, -- amount if the bonus is resource
			value_per_turn_modifier = 100,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3510, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_lemnos_myrina = {
		{
			bonus = "capture_bonus_god_attitude_hera",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_lemnos_poliochne = {
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 5530, -- amount if the bonus is resource
			value_per_turn_modifier = 100,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3510, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_lesbos_eressos = {
		{
			bonus = "capture_bonus_harpies",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"troy_historical"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"troy_historical"}
		}
	},
	troy_main_lesbos_methymna = {
		{
			bonus = "capture_bonus_gold",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 92, -- amount if the bonus is resource
			value_per_turn_modifier = 10,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_lesbos_mytilene = {
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 5680, -- amount if the bonus is resource
			value_per_turn_modifier = 100,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3510, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_lycia_kalynda = {
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		}
	},
	troy_main_lycia_mobolla = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8403, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6210, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_lycia_telmessos = {
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 5449, -- amount if the bonus is resource
			value_per_turn_modifier = 100,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2510, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_macedonia_aeane = {
		{
			bonus = "capture_bonus_stones",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 206, -- amount if the bonus is resource
			value_per_turn_modifier = 20,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_macedonia_argos_orestikon = {
		{
			bonus = "capture_bonus_centaurs",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"troy_historical"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"troy_historical"}
		}
	},
	troy_main_macedonia_arnissa = {
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		}
	},
	troy_main_macedonia_celetron = {
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 5509, -- amount if the bonus is resource
			value_per_turn_modifier = 100,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3510, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_madares_aptera = {
		{
			bonus = "capture_bonus_god_attitude_ares",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_madares_kissamos = {
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 5566, -- amount if the bonus is resource
			value_per_turn_modifier = 100,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_wood",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3200, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_madares_kydonia = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8487, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6440, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_madares_lappa = {
		{
			bonus = "capture_bonus_gold",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 107, -- amount if the bonus is resource
			value_per_turn_modifier = 10,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_maeandros_anthea = {
		{
			bonus = "capture_bonus_gold",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 108, -- amount if the bonus is resource
			value_per_turn_modifier = 10,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_maeandros_eyanthia = {
		{
			bonus = "capture_bonus_god_attitude_zeus",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_maeonia_hyde = {
		{
			bonus = "capture_bonus_god_attitude_artemis",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_maeonia_hypaepa = {
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		}
	},
	troy_main_maeonia_sardis = {
		{
			bonus = "capture_bonus_stones",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 202, -- amount if the bonus is resource
			value_per_turn_modifier = 20,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_maeonia_thyaira = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8505, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6330, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_magnesia_iolcos = {
		{
			bonus = "capture_bonus_vision",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_magnesia_meliboea = {
		{
			bonus = "capture_bonus_centaurs",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"troy_historical"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"troy_historical"}
		}
	},
	troy_main_magnesia_olizon = {
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 5551, -- amount if the bonus is resource
			value_per_turn_modifier = 100,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3510, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_malis_oita = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8569, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6250, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_malis_trachis = {
		{
			bonus = "capture_bonus_god_attitude_athena",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_mariandynia_astacos = {
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 5430, -- amount if the bonus is resource
			value_per_turn_modifier = 100,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3510, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_mariandynia_cytoros = {
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		}
	},
	troy_main_megaris_aegina = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8476, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6350, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_megaris_megara = {
		{
			bonus = "capture_bonus_god_attitude_ares",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_megaris_salamis = {
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		}
	},
	troy_main_melamphylos_dolyche = {
		{
			bonus = "capture_bonus_giants",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"troy_historical"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"troy_historical"}
		}
	},
	troy_main_melamphylos_kalydnes = {
		{
			bonus = "capture_bonus_sirens",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"troy_historical"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"troy_historical"}
		}
	},
	troy_main_melamphylos_kos = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8423, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6150, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_melamphylos_samos = {
		{
			bonus = "capture_bonus_god_attitude_aphrodite",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_melas_pactya = {
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 5491, -- amount if the bonus is resource
			value_per_turn_modifier = 100,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3510, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_melas_sestos = {
		{
			bonus = "capture_bonus_god_attitude_athena",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_messenia_mantineia = {
		{
			bonus = "capture_bonus_vision",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		}
	},
	troy_main_messenia_messene = {
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 5670, -- amount if the bonus is resource
			value_per_turn_modifier = 100,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3510, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_messenia_pylos = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8658, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6250, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_messenia_tegea = {
		{
			bonus = "capture_bonus_centaurs",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"troy_historical"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"troy_historical"}
		}
	},
	troy_main_mycenaeca_corinth = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8610, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6310, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_mycenaeca_mycenae = {
		{
			bonus = "capture_bonus_god_attitude_hera",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_mycenaeca_stymphalos = {
		{
			bonus = "capture_bonus_stones",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 213, -- amount if the bonus is resource
			value_per_turn_modifier = 20,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_mysia_apollonia = {
		{
			bonus = "capture_bonus_god_attitude_ares",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_mysia_cyzicos = {
		{
			bonus = "capture_bonus_gold",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 115, -- amount if the bonus is resource
			value_per_turn_modifier = 10,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_mysia_myrleia = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8630, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6422, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_mysia_proconnesos = {
		{
			bonus = "capture_bonus_stones",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 196, -- amount if the bonus is resource
			value_per_turn_modifier = 20,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_ophioussa_volissos = {
		{
			bonus = "capture_bonus_gold",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 112, -- amount if the bonus is resource
			value_per_turn_modifier = 10,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_ophioussa_vrontados = {
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 5500, -- amount if the bonus is resource
			value_per_turn_modifier = 100,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3510, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_other = {
		{
			bonus = nil,
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_oylympos_dion = {
		{
			bonus = "capture_bonus_gold",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 108, -- amount if the bonus is resource
			value_per_turn_modifier = 10,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_oylympos_larissa = {
		{
			bonus = "capture_bonus_god_attitude_hephaestus",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_oylympos_leibethra = {
		{
			bonus = "capture_bonus_vision",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_ozolian_locris_amphissa = {
		{
			bonus = "capture_bonus_gold",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 109, -- amount if the bonus is resource
			value_per_turn_modifier = 10,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_ozolian_locris_cyparissos = {
		{
			bonus = "capture_bonus_wood",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2200, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_wood",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3024, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_ozolian_locris_elateia = {
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		}
	},
	troy_main_ozolian_locris_tolofon = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8330, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6410, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_perrhaebia_doris = {
		{
			bonus = "capture_bonus_stones",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 210, -- amount if the bonus is resource
			value_per_turn_modifier = 20,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_perrhaebia_oechalia = {
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 5600, -- amount if the bonus is resource
			value_per_turn_modifier = 100,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3510, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_perrhaebia_oloosson = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8400, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6420, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_perrhaebia_tricca = {
		{
			bonus = "capture_bonus_giants",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"troy_historical"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"troy_historical"}
		}
	},
	troy_main_phlegra_olophyxos = {
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			value_per_turn_modifier = 0,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		}
	},
	troy_main_phlegra_scione = {
		{
			bonus = "capture_bonus_god_attitude_zeus",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_phlegra_sermyle = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8550, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6330, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_phlegra_singos = {
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 5525, -- amount if the bonus is resource
			value_per_turn_modifier = 100,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3510, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_phrygia_ancore = {
		{
			bonus = "capture_bonus_gold",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 109, -- amount if the bonus is resource
			value_per_turn_modifier = 10,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_phrygia_medra = {
		{
			bonus = "capture_bonus_giants",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"troy_historical"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"troy_historical"}
		}
	},
	troy_main_phthia_alos = {
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		}
	},
	troy_main_phthia_pherae = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8575, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6280, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_phthia_pteleon = {
		{
			bonus = "capture_bonus_god_attitude_ares",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_rhodes_ialysos = {
		{
			bonus = "capture_bonus_god_attitude_athena",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", },
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_gold",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 122, -- amount if the bonus is resource
			value_per_turn_modifier = 10,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_rhodes_kameiros = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8425, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6461, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_rhodes_lindos = {
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 5450, -- amount if the bonus is resource
			value_per_turn_modifier = 100,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2310, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_sea_axeinos_pontos = {
		{
			bonus = nil,
			cooldown = 512, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_sea_deep = {
		{
			bonus = nil,
			cooldown = 512, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_sea_euboiki_thalassa = {
		{
			bonus = nil,
			cooldown = 512, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_sea_ikarion_pelagos = {
		{
			bonus = nil,
			cooldown = 512, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_sea_ionion_pelagos = {
		{
			bonus = nil,
			cooldown = 512, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_sea_korinthiakos_kolpos = {
		{
			bonus = nil,
			cooldown = 512, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_sea_kritikon_pelagos = {
		{
			bonus = nil,
			cooldown = 512, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_sea_lake = {
		{
			bonus = nil,
			cooldown = 512, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_sea_lykion_pelagos = {
		{
			bonus = nil,
			cooldown = 512, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_sea_mytroon_pelagos = {
		{
			bonus = nil,
			cooldown = 512, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_sea_onesea = {
		{
			bonus = nil,
			cooldown = 512, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_sea_propontis = {
		{
			bonus = nil,
			cooldown = 512, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_sea_thermaikos_kolpos = {
		{
			bonus = nil,
			cooldown = 512, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_sea_thrakikon_pelagos = {
		{
			bonus = nil,
			cooldown = 512, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_sea_troikos_pelagos = {
		{
			bonus = nil,
			cooldown = 512, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_sintice_berge = {
		{
			bonus = "capture_bonus_vision",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_sintice_heraclea_sintica = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8575, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6422, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_sintice_siris = {
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 5610, -- amount if the bonus is resource
			value_per_turn_modifier = 100,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3510, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_sipylos_maenomene = {
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 5410, -- amount if the bonus is resource
			value_per_turn_modifier = 100,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3510, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_sipylos_myrra = {
		{
			bonus = "capture_bonus_god_attitude_ares",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_sipylos_temnos = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8430, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6451, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_sporades_peparethos = {
		{
			bonus = "capture_bonus_sirens",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"troy_historical"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"troy_historical"}
		}
	},
	troy_main_sporades_skyros = {
		{
			bonus = "capture_bonus_god_attitude_aphrodite",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_syrmata_dryopis = {
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 5430, -- amount if the bonus is resource
			value_per_turn_modifier = 100,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3510, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_syrmata_melos = {
		{
			bonus = "capture_bonus_harpies",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"troy_historical"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"troy_historical"}
		}
	},
	troy_main_syrmata_meropia = {
		{
			bonus = "capture_bonus_stones",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 200, -- amount if the bonus is resource
			value_per_turn_modifier = 20,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_teythrania_cidaenis = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8500, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6512, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_teythrania_kyme = {
		{
			bonus = "capture_bonus_god_attitude_aphrodite",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_teythrania_pitane = {
		{
			bonus = "capture_bonus_wood",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2175, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_wood",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3024, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_thessaliotis_arne = {
		{
			bonus = "capture_bonus_vision",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_thessaliotis_crannon = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8440, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6312, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_thessaliotis_ctimene = {
		{
			bonus = "capture_bonus_wood",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2060, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_wood",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3024, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_thessaliotis_pharsalos = {
		{
			bonus = "capture_bonus_gold",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 100, -- amount if the bonus is resource
			value_per_turn_modifier = 10,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_thrace_abdera = {
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 5500, -- amount if the bonus is resource
			value_per_turn_modifier = 100,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3510, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_thrace_ismaros = {
		{
			bonus = "capture_bonus_centaurs",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"troy_historical"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"troy_historical"}
		}
	},
	troy_main_thrace_zerynthos = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8567, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6477, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_thrinacia_trinacria = {
		{
			bonus = "capture_bonus_gold",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 1200, -- amount if the bonus is resource
			value_per_turn_modifier = 5,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_thynia_athyra = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 4500, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6411, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_thynia_derkos = {
		{
			bonus = "capture_bonus_vision",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_thynia_salmydessos = {
		{
			bonus = "capture_bonus_god_attitude_apollo",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_troas_colonae = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8310, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6421, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_troas_hamaxitos = {
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		}
	},
	troy_main_troas_larisa = {
		{
			bonus = "capture_bonus_god_attitude_hephaestus",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_tyrinthia_epidayrus = {
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 5615, -- amount if the bonus is resource
			value_per_turn_modifier = 100,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_bronze",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 3510, -- amount if the bonus is resource
			value_per_turn_modifier = 50,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_tyrinthia_tiryns = {
		{
			bonus = "capture_bonus_god_attitude_zeus",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_tyrinthia_troizen = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8630, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6250, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_unknown_terrain = {
		{
			bonus = nil,
			cooldown = 512, -- remaining turns until capture bonus can be used again
			value = nil, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_zerynthia_nesoi_imbrasos = {
		{
			bonus = "capture_bonus_god_attitude_hera",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_zerynthia_nesoi_saos = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8370, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6350, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_zerynthia_nesoi_thasos = {
		{
			bonus = "capture_bonus_gold",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 104, -- amount if the bonus is resource
			value_per_turn_modifier = 10,
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_zonaea_aenos = {
		{
			bonus = "capture_bonus_god_attitude_hephaestus",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 450, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea", "troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
	troy_main_zonaea_apsynthia = {
		{
			bonus = "capture_bonus_momentum",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 230, -- amount if the bonus is resource
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_larger_buckets",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 2, -- amount if the bonus is resource
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		}
	},
	troy_main_zonaea_zorlanea = {
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 8490, -- amount if the bonus is resource
			value_per_turn_modifier = 200,
			factions = {"troy_amazons_trj_penthesilea"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
		{
			bonus = "capture_bonus_food",
			cooldown = 30, -- remaining turns until capture bonus can be used again
			value = 6412, -- amount if the bonus is resource
			value_per_turn_modifier = 80,
			factions = {"troy_rem_horde_aethiopians"},
			campaigns = {"main_troy", "troy_historical", "troy_mythic"}
		},
	},
}

--------------------------------------------------------------------------
-- Region-name myth-unit mapping table.							   	--
-- region_name = { 
--	  	building = 
--			campaign_name = { "myth_unit1_key" = number_to_give },		--
--		  other_campaign_name = { "myth_unit2_key" = number_to_give } --
--------------------------------------------------------------------------
capture_bonuses.regions_myth_unit_capture_bonuses = {
	troy_main_bythynia_procerastis = {
		troy_amazons_penthesilea_horde_scouts_2 = {
			main_troy 	= { troy_dlc1_myth_special_sirens = 6 },
			troy_mythic = { troy_mth_dlc1_gen_myth_sirens = 6}
		},
		troy_amazons_penthesilea_horde_scouts_4 = {
			main_troy 	= { troy_dlc1_myth_special_sirens = 10 },
			troy_mythic = { troy_mth_dlc1_gen_myth_sirens = 10}
		},
		troy_rem_aethiopia_horde_special_mythic_units_1 =  {
			main_troy 	= { troy_dlc1_myth_special_sirens = 5 },
			troy_mythic = { troy_mth_dlc1_gen_myth_sirens = 5}
		},
		troy_rem_aethiopia_horde_special_mythic_units_3 = {
			main_troy 	= { troy_dlc1_myth_special_sirens = 7 },
			troy_mythic = { troy_mth_dlc1_gen_myth_sirens = 7}
		},
		troy_rem_aethiopia_horde_special_mythic_units_4 = {
			main_troy 	= { troy_dlc1_myth_special_sirens = 10 },
			troy_mythic = { troy_mth_dlc1_gen_myth_sirens = 10}
		},
		default = {
			main_troy 	= { troy_dlc1_myth_special_sirens = 3 },
			troy_mythic = { troy_mth_dlc1_gen_myth_sirens = 3 }
		},
	},
	troy_main_melamphylos_kalydnes = {
		troy_amazons_penthesilea_horde_scouts_2 = {
			main_troy 	= { troy_dlc1_myth_special_sirens = 6 },
			troy_mythic = { troy_mth_dlc1_gen_myth_sirens = 6}
		},
		troy_amazons_penthesilea_horde_scouts_4 = {
			main_troy 	= { troy_dlc1_myth_special_sirens = 10 },
			troy_mythic = { troy_mth_dlc1_gen_myth_sirens = 10}
		},
		troy_rem_aethiopia_horde_special_mythic_units_1 =  {
			main_troy 	= { troy_dlc1_myth_special_sirens = 5 },
			troy_mythic = { troy_mth_dlc1_gen_myth_sirens = 5}
		},
		troy_rem_aethiopia_horde_special_mythic_units_3 = {
			main_troy 	= { troy_dlc1_myth_special_sirens = 7 },
			troy_mythic = { troy_mth_dlc1_gen_myth_sirens = 7}
		},
		troy_rem_aethiopia_horde_special_mythic_units_4 = {
			main_troy 	= { troy_dlc1_myth_special_sirens = 10 },
			troy_mythic = { troy_mth_dlc1_gen_myth_sirens = 10}
		},
		default = {
			main_troy 	= { troy_dlc1_myth_special_sirens = 3 },
			troy_mythic = { troy_mth_dlc1_gen_myth_sirens = 3}
		},
	},
	troy_main_sporades_peparethos = {
		troy_amazons_penthesilea_horde_scouts_2 = {
			main_troy 	= { troy_dlc1_myth_special_sirens = 6 },
			troy_mythic = { troy_mth_dlc1_gen_myth_sirens = 6}
		},
		troy_amazons_penthesilea_horde_scouts_4 = {
			main_troy 	= { troy_dlc1_myth_special_sirens = 10 },
			troy_mythic = { troy_mth_dlc1_gen_myth_sirens = 10}
		},
		troy_rem_aethiopia_horde_special_mythic_units_1 =  {
			main_troy 	= { troy_dlc1_myth_special_sirens = 5 },
			troy_mythic = { troy_mth_dlc1_gen_myth_sirens = 5}
		},
		troy_rem_aethiopia_horde_special_mythic_units_3 = {
			main_troy 	= { troy_dlc1_myth_special_sirens = 7 },
			troy_mythic = { troy_mth_dlc1_gen_myth_sirens = 7}
		},
		troy_rem_aethiopia_horde_special_mythic_units_4 = {
			main_troy 	= { troy_dlc1_myth_special_sirens = 10 },
			troy_mythic = { troy_mth_dlc1_gen_myth_sirens = 10}
		},
		default = {
			main_troy 	= { troy_dlc1_myth_special_sirens = 3 },
			troy_mythic = { troy_mth_dlc1_gen_myth_sirens = 3}
		},
	},
	troy_main_korcyra_scheria = {
		troy_amazons_penthesilea_horde_scouts_2 = {
			main_troy 	= { troy_dlc1_myth_special_sirens = 6 },
			troy_mythic = { troy_mth_dlc1_gen_myth_sirens = 6}
		},
		troy_amazons_penthesilea_horde_scouts_4 = {
			main_troy 	= { troy_dlc1_myth_special_sirens = 10 },
			troy_mythic = { troy_mth_dlc1_gen_myth_sirens = 10}
		},
		troy_rem_aethiopia_horde_special_mythic_units_1 =  {
			main_troy 	= { troy_dlc1_myth_special_sirens = 5 },
			troy_mythic = { troy_mth_dlc1_gen_myth_sirens = 5}
		},
		troy_rem_aethiopia_horde_special_mythic_units_3 = {
			main_troy 	= { troy_dlc1_myth_special_sirens = 7 },
			troy_mythic = { troy_mth_dlc1_gen_myth_sirens = 7}
		},
		troy_rem_aethiopia_horde_special_mythic_units_4 = {
			main_troy 	= { troy_dlc1_myth_special_sirens = 10 },
			troy_mythic = { troy_mth_dlc1_gen_myth_sirens = 10}
		},
		default = {
			main_troy 	= { troy_dlc1_myth_special_sirens = 3 },
			troy_mythic = { troy_mth_dlc1_gen_myth_sirens = 3}
		},
	}, -- EOF Sirens
	troy_main_perrhaebia_tricca = {
		troy_amazons_penthesilea_horde_military_1 = {
			main_troy 	= { troy_dlc1_myth_special_giant_vanguard = 2 },
			troy_mythic = { troy_mth_dlc1_giant_axe_shield = 2}
		},
		troy_amazons_penthesilea_horde_military_3 = {
			main_troy 	= { 
				troy_dlc1_myth_special_giant_vanguard = 3,
				troy_dlc1_myth_special_armoured_giant_spearmen = 2,
				troy_dlc1_myth_special_giant_bowmen = 2 
			},
			troy_mythic = {
				troy_mth_dlc1_giant_axe_shield = 3,
				troy_mth_dlc1_giant_spear_shield = 2,
				troy_mth_dlc1_giant_axe_bow = 2
			}
		},
		troy_amazons_penthesilea_horde_military_5 = {
			main_troy 	= {
				troy_dlc1_myth_special_giant_vanguard = 5,
				troy_dlc1_myth_special_armoured_giant_spearmen = 3,
				troy_dlc1_myth_special_giant_bowmen = 3,
				troy_dlc1_myth_special_giant_champions = 2,
			},
			troy_mythic = {
				troy_mth_dlc1_giant_axe_shield = 5,
				troy_mth_dlc1_giant_spear_shield = 3,
				troy_mth_dlc1_giant_axe_bow = 3,
				troy_mth_dlc1_giant_2haxe = 2
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_1 =  {
			main_troy 	= { troy_dlc1_myth_special_giant_vanguard = 2},
			troy_mythic = { troy_mth_dlc1_giant_axe_shield = 2}
		},
		troy_rem_aethiopia_horde_special_mythic_units_3 = {
			main_troy 	= { 
				troy_dlc1_myth_special_giant_vanguard = 3,
				troy_dlc1_myth_special_armoured_giant_spearmen = 2,
				troy_dlc1_myth_special_giant_bowmen = 2 
			},
			troy_mythic = {
				troy_mth_dlc1_giant_axe_shield = 3,
				troy_mth_dlc1_giant_spear_shield = 2,
				troy_mth_dlc1_giant_axe_bow = 2
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_4 = {
			main_troy 	= {
				troy_dlc1_myth_special_giant_vanguard = 5,
				troy_dlc1_myth_special_armoured_giant_spearmen = 3,
				troy_dlc1_myth_special_giant_bowmen = 3,
				troy_dlc1_myth_special_giant_champions = 2,
			},
			troy_mythic = {
				troy_mth_dlc1_giant_axe_shield = 5,
				troy_mth_dlc1_giant_spear_shield = 3,
				troy_mth_dlc1_giant_axe_bow = 3,
				troy_mth_dlc1_giant_2haxe = 2
			}
		},
		default = {
			main_troy 	= { troy_dlc1_myth_special_giant_vanguard = 2 },
			troy_mythic = { troy_mth_dlc1_giant_axe_shield = 2 }
		}
	},
	troy_main_elis_altis = {
		troy_amazons_penthesilea_horde_military_1 = {
			main_troy 	= { troy_dlc1_myth_special_giant_vanguard = 2},
			troy_mythic = { troy_mth_dlc1_giant_axe_shield = 2}
		},
		troy_amazons_penthesilea_horde_military_3 = {
			main_troy 	= { 
				troy_dlc1_myth_special_giant_vanguard = 3,
				troy_dlc1_myth_special_armoured_giant_spearmen = 2,
				troy_dlc1_myth_special_giant_bowmen = 2 
			},
			troy_mythic = {
				troy_mth_dlc1_giant_axe_shield = 3,
				troy_mth_dlc1_giant_spear_shield = 2,
				troy_mth_dlc1_giant_axe_bow = 2
			}
		},
		troy_amazons_penthesilea_horde_military_5 = {
			main_troy 	= {
				troy_dlc1_myth_special_giant_vanguard = 5,
				troy_dlc1_myth_special_armoured_giant_spearmen = 3,
				troy_dlc1_myth_special_giant_bowmen = 3,
				troy_dlc1_myth_special_giant_champions = 2,
			},
			troy_mythic = {
				troy_mth_dlc1_giant_axe_shield = 5,
				troy_mth_dlc1_giant_spear_shield = 3,
				troy_mth_dlc1_giant_axe_bow = 3,
				troy_mth_dlc1_giant_2haxe = 2
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_1 =  {
			main_troy 	= { troy_dlc1_myth_special_giant_vanguard = 2},
			troy_mythic = { troy_mth_dlc1_giant_axe_shield = 2}
		},
		troy_rem_aethiopia_horde_special_mythic_units_3 = {
			main_troy 	= { 
				troy_dlc1_myth_special_giant_vanguard = 3,
				troy_dlc1_myth_special_armoured_giant_spearmen = 2,
				troy_dlc1_myth_special_giant_bowmen = 2 
			},
			troy_mythic = {
				troy_mth_dlc1_giant_axe_shield = 3,
				troy_mth_dlc1_giant_spear_shield = 2,
				troy_mth_dlc1_giant_axe_bow = 2
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_4 = {
			main_troy 	= {
				troy_dlc1_myth_special_giant_vanguard = 5,
				troy_dlc1_myth_special_armoured_giant_spearmen = 3,
				troy_dlc1_myth_special_giant_bowmen = 3,
				troy_dlc1_myth_special_giant_champions = 2,
			},
			troy_mythic = {
				troy_mth_dlc1_giant_axe_shield = 5,
				troy_mth_dlc1_giant_spear_shield = 3,
				troy_mth_dlc1_giant_axe_bow = 3,
				troy_mth_dlc1_giant_2haxe = 2
			}
		},
		default = {
			main_troy 	= { troy_dlc1_myth_special_giant_vanguard = 2 },
			troy_mythic = { troy_mth_dlc1_giant_axe_shield = 2 }
		},
	},
	troy_main_krapathos_arcasia = {
		troy_amazons_penthesilea_horde_military_1 = {
			main_troy 	= { troy_dlc1_myth_special_giant_vanguard = 2 },
			troy_mythic = { troy_mth_dlc1_giant_axe_shield = 2}
		},
		troy_amazons_penthesilea_horde_military_3 = {
			main_troy 	= { 
				troy_dlc1_myth_special_giant_vanguard = 3,
				troy_dlc1_myth_special_armoured_giant_spearmen = 2,
				troy_dlc1_myth_special_giant_bowmen = 2 
			},
			troy_mythic = {
				troy_mth_dlc1_giant_axe_shield = 3,
				troy_mth_dlc1_giant_spear_shield = 2,
				troy_mth_dlc1_giant_axe_bow = 2
			}
		},
		troy_amazons_penthesilea_horde_military_5 = {
			main_troy 	= {
				troy_dlc1_myth_special_giant_vanguard = 5,
				troy_dlc1_myth_special_armoured_giant_spearmen = 3,
				troy_dlc1_myth_special_giant_bowmen = 3,
				troy_dlc1_myth_special_giant_champions = 2,
			},
			troy_mythic = {
				troy_mth_dlc1_giant_axe_shield = 5,
				troy_mth_dlc1_giant_spear_shield = 3,
				troy_mth_dlc1_giant_axe_bow = 3,
				troy_mth_dlc1_giant_2haxe = 2
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_1 =  {
			main_troy 	= { troy_dlc1_myth_special_giant_vanguard = 2},
			troy_mythic = { troy_mth_dlc1_giant_axe_shield = 2}
		},
		troy_rem_aethiopia_horde_special_mythic_units_3 = {
			main_troy 	= { 
				troy_dlc1_myth_special_giant_vanguard = 3,
				troy_dlc1_myth_special_armoured_giant_spearmen = 2,
				troy_dlc1_myth_special_giant_bowmen = 2 
			},
			troy_mythic = {
				troy_mth_dlc1_giant_axe_shield = 3,
				troy_mth_dlc1_giant_spear_shield = 2,
				troy_mth_dlc1_giant_axe_bow = 2
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_4 = {
			main_troy 	= {
				troy_dlc1_myth_special_giant_vanguard = 5,
				troy_dlc1_myth_special_armoured_giant_spearmen = 3,
				troy_dlc1_myth_special_giant_bowmen = 3,
				troy_dlc1_myth_special_giant_champions = 2,
			},
			troy_mythic = {
				troy_mth_dlc1_giant_axe_shield = 5,
				troy_mth_dlc1_giant_spear_shield = 3,
				troy_mth_dlc1_giant_axe_bow = 3,
				troy_mth_dlc1_giant_2haxe = 2
			}
		},
		default = {
			main_troy 	= { troy_dlc1_myth_special_giant_vanguard = 2 },
			troy_mythic = { troy_mth_dlc1_giant_axe_shield = 2 }
		}
	},
	troy_main_phrygia_medra = {
		troy_amazons_penthesilea_horde_military_1 = {
			main_troy 	= { troy_dlc1_myth_special_giant_vanguard = 2 },
			troy_mythic = { troy_mth_dlc1_giant_axe_shield = 2}
		},
		troy_amazons_penthesilea_horde_military_3 = {
			main_troy 	= { 
				troy_dlc1_myth_special_giant_vanguard = 3,
				troy_dlc1_myth_special_armoured_giant_spearmen = 2,
				troy_dlc1_myth_special_giant_bowmen = 2 
			},
			troy_mythic = {
				troy_mth_dlc1_giant_axe_shield = 3,
				troy_mth_dlc1_giant_spear_shield = 2,
				troy_mth_dlc1_giant_axe_bow = 2
			}
		},
		troy_amazons_penthesilea_horde_military_5 = {
			main_troy 	= {
				troy_dlc1_myth_special_giant_vanguard = 5,
				troy_dlc1_myth_special_armoured_giant_spearmen = 3,
				troy_dlc1_myth_special_giant_bowmen = 3,
				troy_dlc1_myth_special_giant_champions = 2,
			},
			troy_mythic = {
				troy_mth_dlc1_giant_axe_shield = 5,
				troy_mth_dlc1_giant_spear_shield = 3,
				troy_mth_dlc1_giant_axe_bow = 3,
				troy_mth_dlc1_giant_2haxe = 2
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_1 =  {
			main_troy 	= { troy_dlc1_myth_special_giant_vanguard = 2 },
			troy_mythic = { troy_mth_dlc1_giant_axe_shield = 2}
		},
		troy_rem_aethiopia_horde_special_mythic_units_3 = {
			main_troy 	= { 
				troy_dlc1_myth_special_giant_vanguard = 3,
				troy_dlc1_myth_special_armoured_giant_spearmen = 2,
				troy_dlc1_myth_special_giant_bowmen = 2 
			},
			troy_mythic = {
				troy_mth_dlc1_giant_axe_shield = 3,
				troy_mth_dlc1_giant_spear_shield = 2,
				troy_mth_dlc1_giant_axe_bow = 2
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_4 = {
			main_troy 	= {
				troy_dlc1_myth_special_giant_vanguard = 5,
				troy_dlc1_myth_special_armoured_giant_spearmen = 3,
				troy_dlc1_myth_special_giant_bowmen = 3,
				troy_dlc1_myth_special_giant_champions = 2,
			},
			troy_mythic = {
				troy_mth_dlc1_giant_axe_shield = 5,
				troy_mth_dlc1_giant_spear_shield = 3,
				troy_mth_dlc1_giant_axe_bow = 3,
				troy_mth_dlc1_giant_2haxe = 2
			}
		},
		default = {
			main_troy 	= { troy_dlc1_myth_special_giant_vanguard = 2 },
			troy_mythic = { troy_mth_dlc1_giant_axe_shield = 2 }
		}
	},
	troy_main_euboea_chalcis = {
		troy_amazons_penthesilea_horde_military_1 = {
			main_troy 	= { troy_dlc1_myth_special_giant_vanguard = 2 },
			troy_mythic = { troy_mth_dlc1_giant_axe_shield = 2}
		},
		troy_amazons_penthesilea_horde_military_3 = {
			main_troy 	= { 
				troy_dlc1_myth_special_giant_vanguard = 3,
				troy_dlc1_myth_special_armoured_giant_spearmen = 2,
				troy_dlc1_myth_special_giant_bowmen = 2 
			},
			troy_mythic = {
				troy_mth_dlc1_giant_axe_shield = 3,
				troy_mth_dlc1_giant_spear_shield = 2,
				troy_mth_dlc1_giant_axe_bow = 2
			}
		},
		troy_amazons_penthesilea_horde_military_5 = {
			main_troy 	= {
				troy_dlc1_myth_special_giant_vanguard = 5,
				troy_dlc1_myth_special_armoured_giant_spearmen = 3,
				troy_dlc1_myth_special_giant_bowmen = 3,
				troy_dlc1_myth_special_giant_champions = 2,
			},
			troy_mythic = {
				troy_mth_dlc1_giant_axe_shield = 5,
				troy_mth_dlc1_giant_spear_shield = 3,
				troy_mth_dlc1_giant_axe_bow = 3,
				troy_mth_dlc1_giant_2haxe = 2
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_1 =  {
			main_troy 	= { troy_dlc1_myth_special_giant_vanguard = 2 },
			troy_mythic = { troy_mth_dlc1_giant_axe_shield = 2}
		},
		troy_rem_aethiopia_horde_special_mythic_units_3 = {
			main_troy 	= { 
				troy_dlc1_myth_special_giant_vanguard = 3,
				troy_dlc1_myth_special_armoured_giant_spearmen = 2,
				troy_dlc1_myth_special_giant_bowmen = 2 
			},
			troy_mythic = {
				troy_mth_dlc1_giant_axe_shield = 3,
				troy_mth_dlc1_giant_spear_shield = 2,
				troy_mth_dlc1_giant_axe_bow = 2
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_4 = {
			main_troy 	= {
				troy_dlc1_myth_special_giant_vanguard = 5,
				troy_dlc1_myth_special_armoured_giant_spearmen = 3,
				troy_dlc1_myth_special_giant_bowmen = 3,
				troy_dlc1_myth_special_giant_champions = 2,
			},
			troy_mythic = {
				troy_mth_dlc1_giant_axe_shield = 5,
				troy_mth_dlc1_giant_spear_shield = 3,
				troy_mth_dlc1_giant_axe_bow = 3,
				troy_mth_dlc1_giant_2haxe = 2
			}
		},
		default = {
			main_troy 	= { troy_dlc1_myth_special_giant_vanguard = 2 },
			troy_mythic = { troy_mth_dlc1_giant_axe_shield = 2 }
		}
	},
	troy_main_melamphylos_dolyche = {
		troy_amazons_penthesilea_horde_military_1 = {
			main_troy 	= { troy_dlc1_myth_special_giant_vanguard = 2 },
			troy_mythic = { troy_mth_dlc1_giant_axe_shield = 2}
		},
		troy_amazons_penthesilea_horde_military_3 = {
			main_troy 	= { 
				troy_dlc1_myth_special_giant_vanguard = 3,
				troy_dlc1_myth_special_armoured_giant_spearmen = 2,
				troy_dlc1_myth_special_giant_bowmen = 2 
			},
			troy_mythic = {
				troy_mth_dlc1_giant_axe_shield = 3,
				troy_mth_dlc1_giant_spear_shield = 2,
				troy_mth_dlc1_giant_axe_bow = 2
			}
		},
		troy_amazons_penthesilea_horde_military_5 = {
			main_troy 	= {
				troy_dlc1_myth_special_giant_vanguard = 5,
				troy_dlc1_myth_special_armoured_giant_spearmen = 3,
				troy_dlc1_myth_special_giant_bowmen = 3,
				troy_dlc1_myth_special_giant_champions = 2,
			},
			troy_mythic = {
				troy_mth_dlc1_giant_axe_shield = 5,
				troy_mth_dlc1_giant_spear_shield = 3,
				troy_mth_dlc1_giant_axe_bow = 3,
				troy_mth_dlc1_giant_2haxe = 2
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_1 =  {
			main_troy 	= { troy_dlc1_myth_special_giant_vanguard = 2 },
			troy_mythic = { troy_mth_dlc1_giant_axe_shield = 2}
		},
		troy_rem_aethiopia_horde_special_mythic_units_3 = {
			main_troy 	= { 
				troy_dlc1_myth_special_giant_vanguard = 3,
				troy_dlc1_myth_special_armoured_giant_spearmen = 2,
				troy_dlc1_myth_special_giant_bowmen = 2 
			},
			troy_mythic = {
				troy_mth_dlc1_giant_axe_shield = 3,
				troy_mth_dlc1_giant_spear_shield = 2,
				troy_mth_dlc1_giant_axe_bow = 2
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_4 = {
			main_troy 	= {
				troy_dlc1_myth_special_giant_vanguard = 5,
				troy_dlc1_myth_special_armoured_giant_spearmen = 3,
				troy_dlc1_myth_special_giant_bowmen = 3,
				troy_dlc1_myth_special_giant_champions = 2,
			},
			troy_mythic = {
				troy_mth_dlc1_giant_axe_shield = 5,
				troy_mth_dlc1_giant_spear_shield = 3,
				troy_mth_dlc1_giant_axe_bow = 3,
				troy_mth_dlc1_giant_2haxe = 2
			}
		},
		default = {
			main_troy 	= { troy_dlc1_myth_special_giant_vanguard = 2 },
			troy_mythic = { troy_mth_dlc1_giant_axe_shield = 2 }
		}
	}, -- EOF Giants
	troy_main_macedonia_argos_orestikon = {	 
		troy_amazons_penthesilea_horde_cavalry_3 = {
			main_troy 	= {
				troy_dlc1_myth_special_centaur_scouts = 4,
				troy_dlc1_myth_special_armoured_centaur_warriors = 3,
			},
			troy_mythic = {
				troy_mth_dlc1_centaurs_sword_and_shield_javelin = 4,
				troy_mth_dlc1_centaurs_spear = 3
			}
		},
		troy_amazons_penthesilea_horde_cavalry_5 = {
			main_troy 	= {
				troy_dlc1_myth_special_centaur_scouts = 5,
				troy_dlc1_myth_special_armoured_centaur_warriors = 4,
				troy_dlc1_myth_special_centaur_elders = 1,
				troy_dlc1_myth_special_centaur_champions = 1,
			},
			troy_mythic = {
				troy_mth_dlc1_centaurs_sword_and_shield_javelin = 4,
				troy_mth_dlc1_centaurs_spear = 3,
				troy_mth_dlc1_centaurs_sword_and_bow_elite = 1,
				troy_mth_dlc1_centaurs_spear_shield_elite = 1
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_1 =  {
			main_troy 	= {
				troy_dlc1_myth_special_centaur_scouts = 4,
				troy_dlc1_myth_special_armoured_centaur_warriors = 3,
			},
			troy_mythic = {
				troy_mth_dlc1_centaurs_sword_and_shield_javelin = 4,
				troy_mth_dlc1_centaurs_spear = 3
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_3 = {
			main_troy 	= {
				troy_dlc1_myth_special_centaur_scouts = 5,
				troy_dlc1_myth_special_armoured_centaur_warriors = 4,
			},
			troy_mythic = {
				troy_mth_dlc1_centaurs_sword_and_shield_javelin = 5,
				troy_mth_dlc1_centaurs_spear = 4
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_4 = {
			main_troy 	= {
				troy_dlc1_myth_special_centaur_scouts = 5,
				troy_dlc1_myth_special_armoured_centaur_warriors = 4,
				troy_dlc1_myth_special_centaur_elders = 1,
				troy_dlc1_myth_special_centaur_champions = 1,
			},
			troy_mythic = {
				troy_mth_dlc1_centaurs_sword_and_shield_javelin = 5,
				troy_mth_dlc1_centaurs_spear = 4,
				troy_mth_dlc1_centaurs_sword_and_bow_elite = 1,
				troy_mth_dlc1_centaurs_spear_shield_elite = 1
			}
		},
		default = {
			main_troy 	= { troy_dlc1_myth_special_centaur_scouts = 3 },
			troy_mythic = { troy_mth_dlc1_centaurs_sword_and_shield_javelin = 3}
		},
	},
	troy_main_astraeos_pelopia = {	 
		troy_amazons_penthesilea_horde_cavalry_3 = {
			main_troy 	= {
				troy_dlc1_myth_special_centaur_scouts = 4,
				troy_dlc1_myth_special_armoured_centaur_warriors = 3,
			},
			troy_mythic = {
				troy_mth_dlc1_centaurs_sword_and_shield_javelin = 4,
				troy_mth_dlc1_centaurs_spear = 3
			}
		},
		troy_amazons_penthesilea_horde_cavalry_5 = {
			main_troy 	= {
				troy_dlc1_myth_special_centaur_scouts = 5,
				troy_dlc1_myth_special_armoured_centaur_warriors = 4,
				troy_dlc1_myth_special_centaur_elders = 1,
				troy_dlc1_myth_special_centaur_champions = 1,
			},
			troy_mythic = {
				troy_mth_dlc1_centaurs_sword_and_shield_javelin = 4,
				troy_mth_dlc1_centaurs_spear = 3,
				troy_mth_dlc1_centaurs_sword_and_bow_elite = 1,
				troy_mth_dlc1_centaurs_spear_shield_elite = 1
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_1 =  {
			main_troy 	= {
				troy_dlc1_myth_special_centaur_scouts = 4,
				troy_dlc1_myth_special_armoured_centaur_warriors = 3,
			},
			troy_mythic = {
				troy_mth_dlc1_centaurs_sword_and_shield_javelin = 4,
				troy_mth_dlc1_centaurs_spear = 3
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_3 = {
			main_troy 	= {
				troy_dlc1_myth_special_centaur_scouts = 5,
				troy_dlc1_myth_special_armoured_centaur_warriors = 4,
			},
			troy_mythic = {
				troy_mth_dlc1_centaurs_sword_and_shield_javelin = 5,
				troy_mth_dlc1_centaurs_spear = 4
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_4 = {
			main_troy 	= {
				troy_dlc1_myth_special_centaur_scouts = 5,
				troy_dlc1_myth_special_armoured_centaur_warriors = 4,
				troy_dlc1_myth_special_centaur_elders = 1,
				troy_dlc1_myth_special_centaur_champions = 1,
			},
			troy_mythic = {
				troy_mth_dlc1_centaurs_sword_and_shield_javelin = 5,
				troy_mth_dlc1_centaurs_spear = 4,
				troy_mth_dlc1_centaurs_sword_and_bow_elite = 1,
				troy_mth_dlc1_centaurs_spear_shield_elite = 1
			}
		},
		default = {
			main_troy 	= { troy_dlc1_myth_special_centaur_scouts = 3 },
			troy_mythic = { troy_mth_dlc1_centaurs_sword_and_shield_javelin = 3}
		},
	},
	troy_main_thrace_ismaros = {	 
		troy_amazons_penthesilea_horde_cavalry_3 = {
			main_troy 	= {
				troy_dlc1_myth_special_centaur_scouts = 4,
				troy_dlc1_myth_special_armoured_centaur_warriors = 3,
			},
			troy_mythic = {
				troy_mth_dlc1_centaurs_sword_and_shield_javelin = 4,
				troy_mth_dlc1_centaurs_spear = 3
			}
		},
		troy_amazons_penthesilea_horde_cavalry_5 = {
			main_troy 	= {
				troy_dlc1_myth_special_centaur_scouts = 5,
				troy_dlc1_myth_special_armoured_centaur_warriors = 4,
				troy_dlc1_myth_special_centaur_elders = 1,
				troy_dlc1_myth_special_centaur_champions = 1,
			},
			troy_mythic = {
				troy_mth_dlc1_centaurs_sword_and_shield_javelin = 4,
				troy_mth_dlc1_centaurs_spear = 3,
				troy_mth_dlc1_centaurs_sword_and_bow_elite = 1,
				troy_mth_dlc1_centaurs_spear_shield_elite = 1
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_1 =  {
			main_troy 	= {
				troy_dlc1_myth_special_centaur_scouts = 4,
				troy_dlc1_myth_special_armoured_centaur_warriors = 3,
			},
			troy_mythic = {
				troy_mth_dlc1_centaurs_sword_and_shield_javelin = 4,
				troy_mth_dlc1_centaurs_spear = 3
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_3 = {
			main_troy 	= {
				troy_dlc1_myth_special_centaur_scouts = 5,
				troy_dlc1_myth_special_armoured_centaur_warriors = 4,
			},
			troy_mythic = {
				troy_mth_dlc1_centaurs_sword_and_shield_javelin = 5,
				troy_mth_dlc1_centaurs_spear = 4
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_4 = {
			main_troy 	= {
				troy_dlc1_myth_special_centaur_scouts = 5,
				troy_dlc1_myth_special_armoured_centaur_warriors = 4,
				troy_dlc1_myth_special_centaur_elders = 1,
				troy_dlc1_myth_special_centaur_champions = 1,
			},
			troy_mythic = {
				troy_mth_dlc1_centaurs_sword_and_shield_javelin = 5,
				troy_mth_dlc1_centaurs_spear = 4,
				troy_mth_dlc1_centaurs_sword_and_bow_elite = 1,
				troy_mth_dlc1_centaurs_spear_shield_elite = 1
			}
		},
		default = {
			main_troy 	= { troy_dlc1_myth_special_centaur_scouts = 3 },
			troy_mythic = { troy_mth_dlc1_centaurs_sword_and_shield_javelin = 3}
		},
	},
	troy_main_magnesia_meliboea = {	 
		troy_amazons_penthesilea_horde_cavalry_3 = {
			main_troy 	= {
				troy_dlc1_myth_special_centaur_scouts = 4,
				troy_dlc1_myth_special_armoured_centaur_warriors = 3,
			},
			troy_mythic = {
				troy_mth_dlc1_centaurs_sword_and_shield_javelin = 4,
				troy_mth_dlc1_centaurs_spear = 3
			}
		},
		troy_amazons_penthesilea_horde_cavalry_5 = {
			main_troy 	= {
				troy_dlc1_myth_special_centaur_scouts = 5,
				troy_dlc1_myth_special_armoured_centaur_warriors = 4,
				troy_dlc1_myth_special_centaur_elders = 1,
				troy_dlc1_myth_special_centaur_champions = 1,
			},
			troy_mythic = {
				troy_mth_dlc1_centaurs_sword_and_shield_javelin = 4,
				troy_mth_dlc1_centaurs_spear = 3,
				troy_mth_dlc1_centaurs_sword_and_bow_elite = 1,
				troy_mth_dlc1_centaurs_spear_shield_elite = 1
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_1 =  {
			main_troy 	= {
				troy_dlc1_myth_special_centaur_scouts = 4,
				troy_dlc1_myth_special_armoured_centaur_warriors = 3,
			},
			troy_mythic = {
				troy_mth_dlc1_centaurs_sword_and_shield_javelin = 4,
				troy_mth_dlc1_centaurs_spear = 3
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_3 = {
			main_troy 	= {
				troy_dlc1_myth_special_centaur_scouts = 5,
				troy_dlc1_myth_special_armoured_centaur_warriors = 4,
			},
			troy_mythic = {
				troy_mth_dlc1_centaurs_sword_and_shield_javelin = 5,
				troy_mth_dlc1_centaurs_spear = 4
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_4 = {
			main_troy 	= {
				troy_dlc1_myth_special_centaur_scouts = 5,
				troy_dlc1_myth_special_armoured_centaur_warriors = 4,
				troy_dlc1_myth_special_centaur_elders = 1,
				troy_dlc1_myth_special_centaur_champions = 1,
			},
			troy_mythic = {
				troy_mth_dlc1_centaurs_sword_and_shield_javelin = 5,
				troy_mth_dlc1_centaurs_spear = 4,
				troy_mth_dlc1_centaurs_sword_and_bow_elite = 1,
				troy_mth_dlc1_centaurs_spear_shield_elite = 1
			}
		},
		default = {
			main_troy 	= { troy_dlc1_myth_special_centaur_scouts = 3 },
			troy_mythic = { troy_mth_dlc1_centaurs_sword_and_shield_javelin = 3}
		},
	},
	troy_main_messenia_tegea = {	 
		troy_amazons_penthesilea_horde_cavalry_3 = {
			main_troy 	= {
				troy_dlc1_myth_special_centaur_scouts = 4,
				troy_dlc1_myth_special_armoured_centaur_warriors = 3,
			},
			troy_mythic = {
				troy_mth_dlc1_centaurs_sword_and_shield_javelin = 4,
				troy_mth_dlc1_centaurs_spear = 3
			}
		},
		troy_amazons_penthesilea_horde_cavalry_5 = {
			main_troy 	= {
				troy_dlc1_myth_special_centaur_scouts = 5,
				troy_dlc1_myth_special_armoured_centaur_warriors = 4,
				troy_dlc1_myth_special_centaur_elders = 1,
				troy_dlc1_myth_special_centaur_champions = 1,
			},
			troy_mythic = {
				troy_mth_dlc1_centaurs_sword_and_shield_javelin = 4,
				troy_mth_dlc1_centaurs_spear = 3,
				troy_mth_dlc1_centaurs_sword_and_bow_elite = 1,
				troy_mth_dlc1_centaurs_spear_shield_elite = 1
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_1 =  {
			main_troy 	= {
				troy_dlc1_myth_special_centaur_scouts = 4,
				troy_dlc1_myth_special_armoured_centaur_warriors = 3,
			},
			troy_mythic = {
				troy_mth_dlc1_centaurs_sword_and_shield_javelin = 4,
				troy_mth_dlc1_centaurs_spear = 3
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_3 = {
			main_troy 	= {
				troy_dlc1_myth_special_centaur_scouts = 5,
				troy_dlc1_myth_special_armoured_centaur_warriors = 4,
			},
			troy_mythic = {
				troy_mth_dlc1_centaurs_sword_and_shield_javelin = 5,
				troy_mth_dlc1_centaurs_spear = 4
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_4 = {
			main_troy 	= {
				troy_dlc1_myth_special_centaur_scouts = 5,
				troy_dlc1_myth_special_armoured_centaur_warriors = 4,
				troy_dlc1_myth_special_centaur_elders = 1,
				troy_dlc1_myth_special_centaur_champions = 1,
			},
			troy_mythic = {
				troy_mth_dlc1_centaurs_sword_and_shield_javelin = 5,
				troy_mth_dlc1_centaurs_spear = 4,
				troy_mth_dlc1_centaurs_sword_and_bow_elite = 1,
				troy_mth_dlc1_centaurs_spear_shield_elite = 1
			}
		},
		default = {
			main_troy 	= { troy_dlc1_myth_special_centaur_scouts = 3 },
			troy_mythic = { troy_mth_dlc1_centaurs_sword_and_shield_javelin = 3}
		},
	},
	troy_main_isthmos_kaunos = {	 
		troy_amazons_penthesilea_horde_cavalry_3 = {
			main_troy 	= {
				troy_dlc1_myth_special_centaur_scouts = 4,
				troy_dlc1_myth_special_armoured_centaur_warriors = 3,
			},
			troy_mythic = {
				troy_mth_dlc1_centaurs_sword_and_shield_javelin = 4,
				troy_mth_dlc1_centaurs_spear = 3
			}
		},
		troy_amazons_penthesilea_horde_cavalry_5 = {
			main_troy 	= {
				troy_dlc1_myth_special_centaur_scouts = 5,
				troy_dlc1_myth_special_armoured_centaur_warriors = 4,
				troy_dlc1_myth_special_centaur_elders = 1,
				troy_dlc1_myth_special_centaur_champions = 1,
			},
			troy_mythic = {
				troy_mth_dlc1_centaurs_sword_and_shield_javelin = 4,
				troy_mth_dlc1_centaurs_spear = 3,
				troy_mth_dlc1_centaurs_sword_and_bow_elite = 1,
				troy_mth_dlc1_centaurs_spear_shield_elite = 1
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_1 =  {
			main_troy 	= {
				troy_dlc1_myth_special_centaur_scouts = 4,
				troy_dlc1_myth_special_armoured_centaur_warriors = 3,
			},
			troy_mythic = {
				troy_mth_dlc1_centaurs_sword_and_shield_javelin = 4,
				troy_mth_dlc1_centaurs_spear = 3
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_3 = {
			main_troy 	= {
				troy_dlc1_myth_special_centaur_scouts = 5,
				troy_dlc1_myth_special_armoured_centaur_warriors = 4,
			},
			troy_mythic = {
				troy_mth_dlc1_centaurs_sword_and_shield_javelin = 5,
				troy_mth_dlc1_centaurs_spear = 4
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_4 = {
			main_troy 	= {
				troy_dlc1_myth_special_centaur_scouts = 5,
				troy_dlc1_myth_special_armoured_centaur_warriors = 4,
				troy_dlc1_myth_special_centaur_elders = 1,
				troy_dlc1_myth_special_centaur_champions = 1,
			},
			troy_mythic = {
				troy_mth_dlc1_centaurs_sword_and_shield_javelin = 5,
				troy_mth_dlc1_centaurs_spear = 4,
				troy_mth_dlc1_centaurs_sword_and_bow_elite = 1,
				troy_mth_dlc1_centaurs_spear_shield_elite = 1
			}
		},
		default = {
			main_troy 	= { troy_dlc1_myth_special_centaur_scouts = 3 },
			troy_mythic = { troy_mth_dlc1_centaurs_sword_and_shield_javelin = 3}
		}
	}, -- EOF Centaurs
	troy_main_bottiaea_atalanta = {	 
		troy_amazons_penthesilea_horde_missile_1 = {
			main_troy 	= { troy_dlc1_myth_special_harpies = 5 },
			troy_mythic = { troy_mth_dlc1_gen_myth_harpy = 5}
		},
		troy_amazons_penthesilea_horde_missile_3 = {
			main_troy 	= {
				troy_dlc1_myth_special_harpies = 5,
				troy_dlc1_myth_special_harpies_daimones = 1
			},
			troy_mythic = {
				troy_mth_dlc1_gen_myth_harpy = 5,
				troy_mth_dlc1_gen_myth_harpy_elite = 1
			}
		},
		troy_amazons_penthesilea_horde_missile_5 = {
			main_troy  = {
				troy_dlc1_myth_special_harpies = 6,
				troy_dlc1_myth_special_harpies_daimones = 3
			},
			troy_mythic = {
				troy_mth_dlc1_gen_myth_harpy = 6,
				troy_mth_dlc1_gen_myth_harpy_elite = 3
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_1 =  {
			main_troy 	= { troy_dlc1_myth_special_harpies = 5 },
			troy_mythic = { troy_mth_dlc1_gen_myth_harpy = 5}
		},
		troy_rem_aethiopia_horde_special_mythic_units_3 = {
			main_troy 	= {
				troy_dlc1_myth_special_harpies = 5,
				troy_dlc1_myth_special_harpies_daimones = 1
			},
			troy_mythic = {
				troy_mth_dlc1_gen_myth_harpy = 5,
				troy_mth_dlc1_gen_myth_harpy_elite = 1
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_4 = {
			main_troy  = {
				troy_dlc1_myth_special_harpies = 6,
				troy_dlc1_myth_special_harpies_daimones = 3
			},
			troy_mythic = {
				troy_mth_dlc1_gen_myth_harpy = 6,
				troy_mth_dlc1_gen_myth_harpy_elite = 3
			}
		},
		default = {
			main_troy 	= { troy_dlc1_myth_special_harpies = 3 },
			troy_mythic = { troy_mth_dlc1_gen_myth_harpy = 3 }
		},
	},
	troy_main_borreas_sipte = {	 
		troy_amazons_penthesilea_horde_missile_1 = {
			main_troy 	= { troy_dlc1_myth_special_harpies = 5 },
			troy_mythic = { troy_mth_dlc1_gen_myth_harpy = 5}
		},
		troy_amazons_penthesilea_horde_missile_3 = {
			main_troy 	= {
				troy_dlc1_myth_special_harpies = 5,
				troy_dlc1_myth_special_harpies_daimones = 1
			},
			troy_mythic = {
				troy_mth_dlc1_gen_myth_harpy = 5,
				troy_mth_dlc1_gen_myth_harpy_elite = 1
			}
		},
		troy_amazons_penthesilea_horde_missile_5 = {
			main_troy  = {
				troy_dlc1_myth_special_harpies = 6,
				troy_dlc1_myth_special_harpies_daimones = 3
			},
			troy_mythic = {
				troy_mth_dlc1_gen_myth_harpy = 6,
				troy_mth_dlc1_gen_myth_harpy_elite = 3
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_1 =  {
			main_troy 	= { troy_dlc1_myth_special_harpies = 5 },
			troy_mythic = { troy_mth_dlc1_gen_myth_harpy = 5}
		},
		troy_rem_aethiopia_horde_special_mythic_units_3 = {
			main_troy 	= {
				troy_dlc1_myth_special_harpies = 5,
				troy_dlc1_myth_special_harpies_daimones = 1
			},
			troy_mythic = {
				troy_mth_dlc1_gen_myth_harpy = 5,
				troy_mth_dlc1_gen_myth_harpy_elite = 1
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_4 = {
			main_troy  = {
				troy_dlc1_myth_special_harpies = 6,
				troy_dlc1_myth_special_harpies_daimones = 3
			},
			troy_mythic = {
				troy_mth_dlc1_gen_myth_harpy = 6,
				troy_mth_dlc1_gen_myth_harpy_elite = 3
			}
		},
		default = {
			main_troy 	= { troy_dlc1_myth_special_harpies = 3 },
			troy_mythic = { troy_mth_dlc1_gen_myth_harpy = 3 }
		},
	},
	troy_main_syrmata_melos = {	 
		troy_amazons_penthesilea_horde_missile_1 = {
			main_troy 	= { troy_dlc1_myth_special_harpies = 5 },
			troy_mythic = { troy_mth_dlc1_gen_myth_harpy = 5}
		},
		troy_amazons_penthesilea_horde_missile_3 = {
			main_troy 	= {
				troy_dlc1_myth_special_harpies = 5,
				troy_dlc1_myth_special_harpies_daimones = 1
			},
			troy_mythic = {
				troy_mth_dlc1_gen_myth_harpy = 5,
				troy_mth_dlc1_gen_myth_harpy_elite = 1
			}
		},
		troy_amazons_penthesilea_horde_missile_5 = {
			main_troy  = {
				troy_dlc1_myth_special_harpies = 6,
				troy_dlc1_myth_special_harpies_daimones = 3
			},
			troy_mythic = {
				troy_mth_dlc1_gen_myth_harpy = 6,
				troy_mth_dlc1_gen_myth_harpy_elite = 3
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_1 =  {
			main_troy 	= { troy_dlc1_myth_special_harpies = 5},
			troy_mythic = { troy_mth_dlc1_gen_myth_harpy = 5}
		},
		troy_rem_aethiopia_horde_special_mythic_units_3 = {
			main_troy 	= {
				troy_dlc1_myth_special_harpies = 5,
				troy_dlc1_myth_special_harpies_daimones = 1
			},
			troy_mythic = {
				troy_mth_dlc1_gen_myth_harpy = 5,
				troy_mth_dlc1_gen_myth_harpy_elite = 1
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_4 = {
			main_troy  = {
				troy_dlc1_myth_special_harpies = 6,
				troy_dlc1_myth_special_harpies_daimones = 3
			},
			troy_mythic = {
				troy_mth_dlc1_gen_myth_harpy = 6,
				troy_mth_dlc1_gen_myth_harpy_elite = 3
			}
		},
		default = {
			main_troy 	= { troy_dlc1_myth_special_harpies = 3 },
			troy_mythic = { troy_mth_dlc1_gen_myth_harpy = 3 }
		},
	},
	troy_main_arachthos_ambracos = {	 
		troy_amazons_penthesilea_horde_missile_1 = {
			main_troy 	= { troy_dlc1_myth_special_harpies = 5 },
			troy_mythic = { troy_mth_dlc1_gen_myth_harpy = 5}
		},
		troy_amazons_penthesilea_horde_missile_3 = {
			main_troy 	= {
				troy_dlc1_myth_special_harpies = 5,
				troy_dlc1_myth_special_harpies_daimones = 1
			},
			troy_mythic = {
				troy_mth_dlc1_gen_myth_harpy = 5,
				troy_mth_dlc1_gen_myth_harpy_elite = 1
			}
		},
		troy_amazons_penthesilea_horde_missile_5 = {
			main_troy  = {
				troy_dlc1_myth_special_harpies = 6,
				troy_dlc1_myth_special_harpies_daimones = 3
			},
			troy_mythic = {
				troy_mth_dlc1_gen_myth_harpy = 6,
				troy_mth_dlc1_gen_myth_harpy_elite = 3
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_1 =  {
			main_troy 	= { troy_dlc1_myth_special_harpies = 5},
			troy_mythic = { troy_mth_dlc1_gen_myth_harpy = 5}
		},
		troy_rem_aethiopia_horde_special_mythic_units_3 = {
			main_troy 	= {
				troy_dlc1_myth_special_harpies = 5,
				troy_dlc1_myth_special_harpies_daimones = 1
			},
			troy_mythic = {
				troy_mth_dlc1_gen_myth_harpy = 5,
				troy_mth_dlc1_gen_myth_harpy_elite = 1
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_4 = {
			main_troy  = {
				troy_dlc1_myth_special_harpies = 6,
				troy_dlc1_myth_special_harpies_daimones = 3
			},
			troy_mythic = {
				troy_mth_dlc1_gen_myth_harpy = 6,
				troy_mth_dlc1_gen_myth_harpy_elite = 3
			}
		},
		default = {
			main_troy 	= { troy_dlc1_myth_special_harpies = 3 },
			troy_mythic = { troy_mth_dlc1_gen_myth_harpy = 3 }
		}
	},
	troy_main_cragos_myra = {	 
		troy_amazons_penthesilea_horde_missile_1 = {
			main_troy 	= { troy_dlc1_myth_special_harpies = 5 },
			troy_mythic = { troy_mth_dlc1_gen_myth_harpy = 5}
		},
		troy_amazons_penthesilea_horde_missile_3 = {
			main_troy 	= {
				troy_dlc1_myth_special_harpies = 5,
				troy_dlc1_myth_special_harpies_daimones = 1
			},
			troy_mythic = {
				troy_mth_dlc1_gen_myth_harpy = 5,
				troy_mth_dlc1_gen_myth_harpy_elite = 1
			}
		},
		troy_amazons_penthesilea_horde_missile_5 = {
			main_troy  = {
				troy_dlc1_myth_special_harpies = 6,
				troy_dlc1_myth_special_harpies_daimones = 3
			},
			troy_mythic = {
				troy_mth_dlc1_gen_myth_harpy = 6,
				troy_mth_dlc1_gen_myth_harpy_elite = 3
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_1 =  {
			main_troy 	= { troy_dlc1_myth_special_harpies = 5 },
			troy_mythic = { troy_mth_dlc1_gen_myth_harpy = 5}
		},
		troy_rem_aethiopia_horde_special_mythic_units_3 = {
			main_troy 	= {
				troy_dlc1_myth_special_harpies = 5,
				troy_dlc1_myth_special_harpies_daimones = 1
			},
			troy_mythic = {
				troy_mth_dlc1_gen_myth_harpy = 5,
				troy_mth_dlc1_gen_myth_harpy_elite = 1
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_4 = {
			main_troy  = {
				troy_dlc1_myth_special_harpies = 6,
				troy_dlc1_myth_special_harpies_daimones = 3
			},
			troy_mythic = {
				troy_mth_dlc1_gen_myth_harpy = 6,
				troy_mth_dlc1_gen_myth_harpy_elite = 3
			}
		},
		default = {
			main_troy 	= { troy_dlc1_myth_special_harpies = 3 },
			troy_mythic = { troy_mth_dlc1_gen_myth_harpy = 3 }
		},
	},
	troy_main_lesbos_eressos = {	 
		troy_amazons_penthesilea_horde_missile_1 = {
			main_troy 	= { troy_dlc1_myth_special_harpies = 5 },
			troy_mythic = { troy_mth_dlc1_gen_myth_harpy = 5}
		},
		troy_amazons_penthesilea_horde_missile_3 = {
			main_troy 	= {
				troy_dlc1_myth_special_harpies = 5,
				troy_dlc1_myth_special_harpies_daimones = 1
			},
			troy_mythic = {
				troy_mth_dlc1_gen_myth_harpy = 5,
				troy_mth_dlc1_gen_myth_harpy_elite = 1
			}
		},
		troy_amazons_penthesilea_horde_missile_5 = {
			main_troy  = {
				troy_dlc1_myth_special_harpies = 6,
				troy_dlc1_myth_special_harpies_daimones = 3
			},
			troy_mythic = {
				troy_mth_dlc1_gen_myth_harpy = 6,
				troy_mth_dlc1_gen_myth_harpy_elite = 3
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_1 =  {
			main_troy 	= { troy_dlc1_myth_special_harpies = 5 },
			troy_mythic = { troy_mth_dlc1_gen_myth_harpy = 5}
		},
		troy_rem_aethiopia_horde_special_mythic_units_3 = {
			main_troy 	= {
				troy_dlc1_myth_special_harpies = 5,
				troy_dlc1_myth_special_harpies_daimones = 1
			},
			troy_mythic = {
				troy_mth_dlc1_gen_myth_harpy = 5,
				troy_mth_dlc1_gen_myth_harpy_elite = 1
			}
		},
		troy_rem_aethiopia_horde_special_mythic_units_4 = {
			main_troy  = {
				troy_dlc1_myth_special_harpies = 6,
				troy_dlc1_myth_special_harpies_daimones = 3
			},
			troy_mythic = {
				troy_mth_dlc1_gen_myth_harpy = 6,
				troy_mth_dlc1_gen_myth_harpy_elite = 3
			}
		},
		default = {
			main_troy 	= { troy_dlc1_myth_special_harpies = 3 },
			troy_mythic = { troy_mth_dlc1_gen_myth_harpy = 3 }
		},
	}, -- EOF Harpies
}

-- Character skills which modify applied capture bonus value
capture_bonuses.skill_mod = {
	resource = {
		["troy_dlc1_hero_campaign_razing_spec_capture_bonus_resources"] = 10,--%
	},

	attitude = {
		["troy_dlc1_hero_campaign_razing_spec_capture_bonus_favour"] = 15--%
	}
}

capture_bonuses.effects_mod = {
	capture_bonus_gold = {
		"troy_hep_amazons_capture_bonus_gold_bronze_dummy",
		"troy_dlc1_hero_campaign_razing_spec_capture_bonus_resources_dummy",
		"troy_mth_amazons_capture_bonus_gold_dummy"
	},
	capture_bonus_bronze = {
		"troy_hep_amazons_capture_bonus_gold_bronze_dummy",
		"troy_dlc1_hero_campaign_razing_spec_capture_bonus_resources_dummy"
	},
	capture_bonus_food = {
 		"troy_rem_memnon_capture_bonus_food_dummy",
		"troy_dlc1_hero_campaign_razing_spec_capture_bonus_resources_dummy",
	},
	capture_bonus_wood = {
		"troy_dlc1_hero_campaign_razing_spec_capture_bonus_resources_dummy",
	},
	capture_bonus_stones = {
		"troy_dlc1_hero_campaign_razing_spec_capture_bonus_resources_dummy",
	},
	-- capture_bonus_momentum = { 
	--	 "troy_dlc1_hero_campaign_razing_spec_capture_bonus_resources_dummy", -- This effect shouldn't affect momentum and no effect is designed to do it currently.
	-- },
	capture_bonus_god_attitude_zeus = {
		"troy_dlc1_hero_campaign_razing_spec_capture_bonus_favour_dummy",
	},
	capture_bonus_god_attitude_poseidon = {
		"troy_dlc1_hero_campaign_razing_spec_capture_bonus_favour_dummy",
	},
	capture_bonus_god_attitude_hera = {
		"troy_dlc1_hero_campaign_razing_spec_capture_bonus_favour_dummy",
	},
	capture_bonus_god_attitude_athena = {
		"troy_dlc1_hero_campaign_razing_spec_capture_bonus_favour_dummy",
	},
	capture_bonus_god_attitude_ares = {
		"troy_dlc1_hero_campaign_razing_spec_capture_bonus_favour_dummy",
	},
	capture_bonus_god_attitude_apollo = {
		"troy_dlc1_hero_campaign_razing_spec_capture_bonus_favour_dummy",
	},
	capture_bonus_god_attitude_aphrodite = {
		"troy_dlc1_hero_campaign_razing_spec_capture_bonus_favour_dummy",
	},	
	capture_bonus_god_attitude_artemis = {
		"troy_dlc1_hero_campaign_razing_spec_capture_bonus_favour_dummy",
	},
	capture_bonus_god_attitude_hephaestus = {
		"troy_dlc1_hero_campaign_razing_spec_capture_bonus_favour_dummy",
	},
}

capture_bonuses.kabeiros = {
	-- numbers are for percentages
	resource = 25,
	attitude = 15,
	vision = 25,
	myth_unit = 25,
}