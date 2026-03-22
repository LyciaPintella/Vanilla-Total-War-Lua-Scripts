local file_info = debug.getinfo(1, "S")
local folder_file_splits = string.split(file_info.source, "\\")
out("Loading " .. folder_file_splits[#folder_file_splits])

local aegean_ancillaries_config = {
	id = "aegean_ancillaries",

	-- The character skill that allows using pharaoh crowns
	-- Will be added and removed from faction leaders of pharaoh/pretender factions
	ancillary_skill = "phar_map_hero_self_aegea_regalia",--"todo ancillary skill for aegeans",

	-- OPTIONAL, if set to true, all factions will have the ancillaries unlocked upon entering entering the path
	ancillaries_always_unlocked = false,

	ancillary_legitimacy_scripted_bonus_value_id = "scripted_legitimacy_from_ancillaries",

	ancillaries = {
--[[
		{
			-- REQUIRED, the ancillary key of the crown
			ancillary_key = "ancillary_key_for_the_crown",

			-- OPTIONAL, which regions are needed to unlock the crown
			-- NOTE: Fulfilling this requirement is sufficient for unlocking the crown, effectively ignoring court_position_needed config option.
			regions_needed = {
				"region1",
				"region2",
			},

			-- OPTIONAL, which court position is needed to unlock this crown.
			-- NOTE: Fulfilling this requirement is sufficient for unlocking the crown, effectively ignoring regions needed config option.
			court_position_needed = "",

			-- OPTIONAL, How many regions of the specified are needed to unlock the crown.
			-- If this is missing will assume all the regions are needed.
			num_regions_needed = 1,

			-- OPTIONAL, Whether the crown is available to pretenders in the legitimacy war.
			-- If this is missing will assume that the crown is available.
			available_to_pretenders = true,

			-- OPTIONAL, Whether the crown will forever stay available to the faction once unlocked the first time
			-- If this is missing will assume that the unlock is not permanent
			permanent_unlock = false,

			-- REQUIRED, priority for the CAI to equip this crown. The higher the number, the higher the priorty.
			cai_priority_to_wear = 3,

			-- OPTIONAL, faction specific setup for priority to wear
			override_priority_setup = {
				["faction_key"] = 3,
			}
			
			-- OPTIONAL, if the player has this ancillary unlocked on new game started, should it auto equip it.
			-- NOTE: Only one ancillary should have this option.
			auto_equip_on_new_game = true,
		},
--]]

		-- ancillary_key = "NONE" - this is specifically for CAI.
		-- the setup is like the other ancillaries and can have overrides for the priority per faction.
		-- if the priority is high, and this "ancillary" is chosen, the CAI won't wear a crown.
		{
			ancillary_key = "NONE",
			cai_priority_to_wear = 0,
		},

		{
			ancillary_key = "phar_map_aegean_regalia_hephaestean_shield",
			available_to_pretenders = true,
			permanent_unlock = false,
			cai_priority_to_wear = 1,
		},
		{
			ancillary_key = "phar_map_aegean_regalia_athenas_aegis",
			available_to_pretenders = false,
			cai_priority_to_wear = 3,
		},
		{
			ancillary_key = "phar_map_aegean_regalia_ares_aspis",
			available_to_pretenders = true,
			regions_needed = {
				"phar_map_mycenaeca_mycenae",
			},
			cai_priority_to_wear = 2,
		},
	},

	-- Needed to properly update the UI when equipping/unequipping ancillaries
	ui_event_on_equip = "aegean_ancillary_equipped",
}

aegean_ancillaries = {
	config = aegean_ancillaries_config,

	post_init = function(self)
		self.legitimacy_system = aegean_legitimacy
		self.political_states_system = aegean_political_states
	end,
}

aegean_ancillaries = crown:create_mechanic_from_type(crown_ancillary_system, aegean_ancillaries)

return aegean_ancillaries
