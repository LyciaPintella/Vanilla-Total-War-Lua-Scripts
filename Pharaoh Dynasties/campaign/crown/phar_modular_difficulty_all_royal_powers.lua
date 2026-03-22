local file_info = debug.getinfo(1, "S")
local folder_file_splits = string.split(file_info.source, "\\")
out("Loading " .. folder_file_splits[#folder_file_splits])

-- If this option is enabled in modular difficulty then the player will get the powers they usually get
-- from their legitimacy path + the powers defined here. These do not overwrite the original ones.
-- E.g. player picks egyptian legitimacy path:
--		- player will have access to egyptian corvee labour and other powers, even if hittite ones are defined here
--		- player will also have access to any other power that is defined here.
all_royal_powers_config = {
	powers_config = {
		corvee_labour = pharaohs_powers.config.corvee_labour,
		forced_annexation = pharaohs_powers.config.forced_annexation,
		growth_migration = pharaohs_powers.config.growth_migration,
		--court_positions = aegean_powers.config.court_positions,
		competency_points = great_king_powers.config.competency_points,
		raise_resources = great_king_powers.config.raise_resources,
		raise_armies = meso_powers.config.raise_armies,
		foment_dissent = meso_powers.config.foment_dissent,
		bribe_force = meso_powers.config.bribe_force,
		remote_colonisation = aegean_powers.config.remote_colonisation,
		war_games = aegean_powers.config.war_games,
	},

	ui_config = {
		corvee_labour = pharaohs_powers.ui_config.powers.corvee_labour,
		forced_annexation = pharaohs_powers.ui_config.powers.forced_annexation,
		growth_migration = pharaohs_powers.ui_config.powers.growth_migration,
		--court_positions = aegean_powers.ui_config.powers.court_positions,
		competency_points = great_king_powers.ui_config.powers.competency_points,
		raise_resources = great_king_powers.ui_config.powers.raise_resources,
		raise_armies = meso_powers.ui_config.powers.raise_armies,
		foment_dissent = meso_powers.ui_config.powers.foment_dissent,
		bribe_force = meso_powers.ui_config.powers.bribe_force,
		remote_colonisation = aegean_powers.ui_config.powers.remote_colonisation,
		war_games = aegean_powers.ui_config.powers.war_games,
	},
}

