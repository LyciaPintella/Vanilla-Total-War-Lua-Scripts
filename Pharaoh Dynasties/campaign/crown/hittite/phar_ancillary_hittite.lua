local file_info = debug.getinfo(1, "S")
local folder_file_splits = string.split(file_info.source, "\\")
out("Loading " .. folder_file_splits[#folder_file_splits])

local great_kings_regalia_config = {
	id = "great_kings_regalia",

	-- The character skill that allows using hittite regalia
	-- Will be added and removed from faction leaders of great king/pretender factions
	ancillary_skill = "phar_main_hero_self_hittite_regalia",

	-- OPTIONAL, if set to true, all factions will have the ancillaries unlocked upon entering entering the path
	ancillaries_always_unlocked = false,

	ancillary_legitimacy_scripted_bonus_value_id = "scripted_legitimacy_from_ancillaries",

	ancillaries = {
--[[
		{
			-- REQUIRED, the ancillary key of the regalia
			ancillary_key = "ancillary_key_for_the_regalia",

			-- OPTIONAL, which regions are needed to unlock the regalia
			-- NOTE: Fulfilling this requirement is sufficient for unlocking the crown, effectively ignoring court_position_needed config option.
			regions_needed = {
				"region1",
				"region2",
			},

			-- OPTIONAL, which court position is needed to unlock this crown.
			-- NOTE: Fulfilling this requirement is sufficient for unlocking the crown, effectively ignoring regions needed config option.
			court_position_needed = "",

			-- OPTIONAL, How many regions of the specified are needed to unlock the regalia.
			-- If this is missing will assume all the regions are needed.
			num_regions_needed = 1,

			-- OPTIONAL, Whether the regalia is available to pretenders in the legitimacy war.
			-- If this is missing will assume that the regalia is available.
			available_to_pretenders = true,

			-- OPTIONAL, Whether the regalia will forever stay available to the faction once unlocked the first time
			-- If this is missing will assume that the unlock is not permanent
			permanent_unlock = false,

			-- REQUIRED, priority for the CAI to equip this regalia. The higher the number, the higher the priorty.
			cai_priority_to_wear = 3,

			-- OPTIONAL, faction specific setup for priority to wear
			override_priority_setup = {
				["faction_key"] = 3,
			}

			-- OPTIONAL, if the player has this ancillary unlocked on new game started, should it auto equip it
			-- NOTE: Only one ancillary should have this option.
			auto_equip_on_new_game = true,
		},
--]]
		-- ancillary_key = "NONE" - this is specifically for CAI.
		-- the setup is like the other ancillaries and can have overrides for the priority per faction.
		-- if the priority is high, and this "ancillary" is chosen, the CAI won't have a regalia.
		{
			ancillary_key = "NONE",
			cai_priority_to_wear = 0,
		},

		{
			ancillary_key = "phar_main_hittite_regalia_axe",
			available_to_pretenders = false,
			cai_priority_to_wear = 1,
		},
		{
			ancillary_key = "phar_main_hittite_regalia_spear",
			regions_needed = {
				"phar_main_hattussa_hattussa",
			},
			cai_priority_to_wear = 1,
			override_priority_setup = {
				["phar_main_suppiluliuma"] = 2,
			},
			auto_equip_on_new_game = true,
		},
		{
			ancillary_key = "phar_main_hittite_regalia_bow",
			regions_needed = {
				"phar_main_south_hatti_tarhuntassa",
			},
			cai_priority_to_wear = 1,
		},
	},

	-- Needed to properly update the UI when equipping/unequipping regalia
	ui_event_on_equip = "great_king_regalia_equipped",
}

great_kings_regalia = {
	config = great_kings_regalia_config,

	post_init = function(self)
		self.legitimacy_system = hatti_legitimacy
		self.political_states_system = hatti_political_states
	end,
}

great_kings_regalia = crown:create_mechanic_from_type(crown_ancillary_system, great_kings_regalia)

return great_kings_regalia
