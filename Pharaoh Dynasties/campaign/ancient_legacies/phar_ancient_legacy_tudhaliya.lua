out("Loading phar_ancient_legacy_tudhaliya.lua")

local tudhaliya_config = {
	num_prince_slots_start = 1,
	num_prince_slots_bonus_from_vassal = 1,
	max_num_prince_slots = 5,

	-- Effect bundle to be applied to princes. Leave as "" or nil to ignore
	prince_effect_bundle_key = "",
	-- Effect bundle to be applied to princes with vassals assigned to them. Leave as "" or nil to ignore
	promoted_prince_effect_bundle_key = "",

	-- This is a passive amount of diplomatic factors that will be applied to the vassal/subject assigned to the prince
	-- It will constantly be active
	passive_diplomatic_relations = {
		-- This is applied to the vassal/subject faction to increase diplomatic relations with
		-- their sovereign/master faction.
		faction_effect_bundle_key = "phar_main_tudhaliya_diplomatic_relations_faction",

		-- This is applied to the prince and is purely visual. It does nothing for diplomatic relations
		prince_effect_bundle_key = "phar_main_tudhaliya_diplomatic_relations_prince_dummy",

		-- Will choose the highest number that is lower than or equal to the character's rank
		-- In the example the first relation amount will be applied between character rank 1 and 4,
		-- the second between 5 and 9, and the 3rd from 10 upwards
		character_rank_to_diplomatic_relations = {
			[1] = 5,
			[5] = 10,
			[10] = 15,
		},
	},

	-- This is an active amount of diplomatic factors that will be applied to the vassal/subject that will drop off in time
	active_diplomatic_relations = {
		-- These bonuses are setup in cai_personality_diplomatic_events
		-- Each one will have a comment on which event it correspond to. To change the amount of
		-- attitude they give you will have to modify the cai_personality_diplomatic_event_values table.

		-- This bonus is activated when the prince idles in the territory of the vassal/subject they have assigned to them
		idle_in_vassal_territory = {
			-- TUDHALIYA_PRINCE_IDLE_IN_VASSAL_BONUS
			turns_should_be_consecutive = true,
			turns_to_activate = 2,
		},

		-- This bonus is activated when the prince idles in a territory not
		-- owned by the vassal/subject they have assigned to them
		idle_in_other_territory = {
			-- TUDHALIYA_PRINCE_IDLE_OUTSIDE_VASSAL_BONUS
			turns_should_be_consecutive = true,
			turns_to_activate = 2,
		},

		-- This bonus is activated when the prince wins battles and for the vassal/subject they have assigned to them
		winning_battles = {
			-- TUDHALIYA_PRINCE_WON_BATTLE_BONUS
			battles_to_activate = 2,
		},

		-- This bonus is activated when the prince loses battles and for the vassal/subject they have assigned to them
		losing_battles = {
			-- TUDHALIYA_PRINCE_LOST_BATTLE_BONUS
			battles_to_activate = 2,
		},
	},

	titles = {
		-- Skill required to equip these titles
		skill_key = "phar_main_hero_self_prince_title",
		title_keys = {
			"phar_main_prince_title_demon_of_the_night",
			"phar_main_prince_title_glorious_warrior",
			"phar_main_prince_title_inspiration_incarnate",
			"phar_main_prince_title_man_of_the_people",
			"phar_main_prince_title_peacemaker",
			"phar_main_prince_title_royal_steward",
		},
	},

	upgraded_titles = {
		-- Skill required to equip these titles
		skill_key = "phar_main_hero_self_prince_upgraded_title",
		title_keys = {
			"phar_main_prince_title_demon_of_the_night_upgraded",
			"phar_main_prince_title_glorious_warrior_upgraded",
			"phar_main_prince_title_inspiration_incarnate_upgraded",
			"phar_main_prince_title_man_of_the_people_upgraded",
			"phar_main_prince_title_peacemaker_upgraded",
			"phar_main_prince_title_royal_steward_upgraded",
		},
	},

	title_to_upgraded_title_key = {
		phar_main_prince_title_demon_of_the_night    = "phar_main_prince_title_demon_of_the_night_upgraded",
		phar_main_prince_title_glorious_warrior      = "phar_main_prince_title_glorious_warrior_upgraded",
		phar_main_prince_title_inspiration_incarnate = "phar_main_prince_title_inspiration_incarnate_upgraded",
		phar_main_prince_title_man_of_the_people     = "phar_main_prince_title_man_of_the_people_upgraded",
		phar_main_prince_title_peacemaker            = "phar_main_prince_title_peacemaker_upgraded",
		phar_main_prince_title_royal_steward         = "phar_main_prince_title_royal_steward_upgraded",
	},

	shared_states = {
		-- Assigned to characters
		is_prince = "tudhaliya_is_prince",
		vassal_faction = "tudhaliya_vassal_faction",

		-- Assigned to faction
		num_princes = "tudhaliya_num_princes",
		max_princes = "tudhaliya_max_princes",
		max_possible_princes = "tudhaliya_max_possible_princes",
		assigned_prince_char_cqi = "tudhaliya_assigned_prince",
	},
}

-- NOTE We use family member CQIs everywhere for princes instead of character CQIs

ancient_legacies_tudhaliya = {
	config = tudhaliya_config,
	persistent = {
		--[[
		faction_key = "asd",
		max_princes = 322,
		assigned_princes = { indexed table of character family member CQIs },
		prince_vassal_map = { char_family_member_cqi = faction_key },
		num_won_battles = { char_family_member_cqi = 1 },
		num_lost_battles = { char_family_member_cqi = 3 },
		turns_idled_in_vassal_territory = { char_family_member_cqi = 3 },
		turns_idled_in_other_territory = { char_family_member_cqi = 7 },
		--]]
	},

	--------------------------------------------------------------------
	-------------------------- Public Methods --------------------------
	------------ These methods have parameter error checking -----------
	--------- Or are meant to be called from outside the script --------
	--------------------------------------------------------------------

	is_prince = function(self, char_family_member_cqi)
		return table_contains(self.persistent.assigned_princes, char_family_member_cqi)
	end,

	num_princes = function(self)
		return #self.persistent.assigned_princes
	end,

	num_max_princes = function(self)
		return self.persistent.max_princes
	end,

	get_prince_assigned_to_vassal = function(self, faction_key)
		for prince_cqi, vassal_key in pairs(self.persistent.prince_vassal_map) do
			if faction_key == vassal_key then
				return prince_cqi
			end
		end

		return nil
	end,

	get_vassal_assigned_to_prince = function(self, char_family_member_cqi)
		return self.persistent.prince_vassal_map[char_family_member_cqi]
	end,

	assign_prince = function(self, char_family_member_cqi)
		local num_princes = self:num_princes()
		if num_princes >= self:num_max_princes() then
			script_error("Tudhaliya: Trying to assign a prince when we already have the max number of princes."
				.. " char_family_member_cqi=" .. tostring(char_family_member_cqi)
				.. ", num_princes=" .. tostring(self:num_princes())
				.. ", num_max_princes=" .. tostring(self:num_max_princes()))
			return
		end

		local faction_leader = cm:get_faction(self.persistent.faction_key):faction_leader()
		if faction_leader and not faction_leader:is_null_interface() and faction_leader:family_member():command_queue_index() == char_family_member_cqi then
			script_error("Tudhaliya: Trying to assign a faction leader to be a prince"
				.. " char_family_member_cqi=" .. tostring(char_family_member_cqi))
			return
		end

		local family_member = cm:get_family_member_by_cqi(char_family_member_cqi)
		local character_details = family_member:character_details()
		if character_details:is_null_interface() then
			script_error("Tudhaliya: No character details attached to family member"
			.. " char_family_member_cqi=" .. tostring(char_family_member_cqi))
			return
		end

		if not character_details:is_male() then
			script_error("Tudhaliya: Trying to assign a non male character to be a prince"
			.. " char_family_member_cqi=" .. tostring(char_family_member_cqi))
			return
		end

		if self:is_prince(char_family_member_cqi) then
			script_error("Tudhaliya: Trying to assign a character to be a prince when he already is a prince"
				.. " char_family_member_cqi=" .. tostring(char_family_member_cqi))
			return
		end

		table.insert(self.persistent.assigned_princes, char_family_member_cqi)

		self:apply_effect_bundle_to_prince(char_family_member_cqi, self.config.prince_effect_bundle_key)
		self:add_titles_to_prince(char_family_member_cqi, self.config.titles)

		local character = family_member:character()
		if character and not character:is_null_interface() then
			cm:set_script_state(character, self.config.shared_states.is_prince, true)
			cm:remove_script_state(character, self.config.shared_states.vassal_faction)
		end

		local faction = cm:get_faction(self.persistent.faction_key)
		cm:set_script_state(faction, self.config.shared_states.num_princes, num_princes + 1)

		core:trigger_event("ScriptEventTudhaliyaPrinceAssigned", { faction = faction, num_princes = num_princes + 1 })

		cm:add_event_feed_event(
			"ancient_legacy_tudhaliya_prince_selected",
			faction:name(),
			0,
			"",
			"",
			"",
			character:command_queue_index()
		)
	end,

	unassign_prince = function(self, char_family_member_cqi)
		local prince_idx = table_find(self.persistent.assigned_princes, char_family_member_cqi, true)

		if not prince_idx then
			script_error("Tudhaliya: Trying to unassign a prince but the character is already not a prince"
				.. " char_family_member_cqi=" .. tostring(char_family_member_cqi))
			return
		end

		local titles_to_remove = self.config.titles
		local bundle_to_remove = self.config.prince_effect_bundle_key

		if self:prince_is_promoted(char_family_member_cqi) then
			titles_to_remove = self.config.upgraded_titles
			bundle_to_remove = self.config.promoted_prince_effect_bundle_key

			local vassal_key = self.persistent.prince_vassal_map[char_family_member_cqi]
			if vassal_key then
				local vassal = cm:get_faction(vassal_key)
				cm:remove_script_state(vassal, self.config.shared_states.assigned_prince_char_cqi)
			end

			self.persistent.prince_vassal_map[char_family_member_cqi] = nil
		end

		self:remove_titles_from_prince(char_family_member_cqi, titles_to_remove)
		self:remove_effect_bundle_from_prince(char_family_member_cqi, bundle_to_remove)

		table.remove(self.persistent.assigned_princes, prince_idx)

		local character = cm:get_family_member_by_cqi(char_family_member_cqi):character()
		if character and not character:is_null_interface() then
			cm:remove_script_state(character, self.config.shared_states.is_prince)
			cm:remove_script_state(character, self.config.shared_states.vassal_faction)
		end

		local num_princes = self:num_princes()
		local faction = cm:get_faction(self.persistent.faction_key)
		cm:set_script_state(faction, self.config.shared_states.num_princes, num_princes)
	end,

	assign_vassal_to_prince = function(self, prince_cqi, vassal_key)
		if not self:is_prince(prince_cqi) then
			script_error("Tudhaliya: Trying to assign a vassal to a character that is not a prince. "
				.. " character_cqi=" .. tostring(prince_cqi)
				.. ", vassal_key=" .. tostring(vassal_key))
			return
		end

		local faction = cm:get_faction(self.persistent.faction_key)
		local vassal = cm:get_faction(vassal_key)

		if not vassal:is_vassal_of(faction) and not vassal:is_subject_of(faction) then
			script_error("Tudhaliya: Trying to assign a faction to a prince but the faction is not a vassal. "
				.. " character_cqi=" .. tostring(prince_cqi)
				.. ", vassal_key=" .. tostring(vassal_key)
				.. ", faction_key=" .. tostring(self.persistent.faction_key))
			return
		end

		-- Demote prince if it currently has another vassal assigned
		if self.persistent.prince_vassal_map[prince_cqi] then
			self:demote_prince(prince_cqi)
		end

		local vassals_previous_prince_cqi = self:get_prince_assigned_to_vassal(vassal_key)

		self.persistent.prince_vassal_map[prince_cqi] = vassal_key

		if vassals_previous_prince_cqi then
			self:demote_prince(vassals_previous_prince_cqi)
		end

		self:promote_prince(prince_cqi, vassal_key)

		core:trigger_event("TudhaliyaPrinceAssignedToVassal", { faction = faction, prince_cqi = prince_cqi })
	end,

	unassign_vassal_from_prince = function(self, prince_cqi)
		if not self:is_prince(prince_cqi) then
			script_error("Tudhaliya: Trying to unassign a vassal from a character that is not a prince. "
				.. " character_cqi=" .. tostring(prince_cqi))
			return
		end

		local vassal_key = self:get_vassal_assigned_to_prince(prince_cqi)

		if not vassal_key then
			script_error("Tudhaliya: Trying to unassign a vassal from a prince but the prince has no vassal. "
				.. " character_cqi=" .. tostring(prince_cqi))
			return
		end

		self:demote_prince(prince_cqi)

		local faction = cm:get_faction(self.persistent.faction_key)
		core:trigger_event("TudhaliyaPrinceUnassignedFromVassal", { faction = faction, prince_cqi = prince_cqi })
	end,

	--------------------------------------------------------------------
	------------------------- Private Methods --------------------------
	-------- These methods do NOT have parameter error checking --------
	------ Or aren't meant to be called from outside this script -------
	--------------------------------------------------------------------

	on_legacy_claimed = function(self, faction_key)
		local local_faction_name = cm:get_local_faction_name(true)

		local faction = cm:get_faction(faction_key)

		if not faction or faction:is_null_interface() then
			script_error("Tudhaliya: Trying to claim legacy on a non existing faction: " .. tostring(faction_key))
			return
		end

		self.persistent = {
			faction_key = faction_key,
			max_princes = 0,
			assigned_princes = {},
			prince_vassal_map = {},
			num_won_battles = {},
			num_lost_battles = {},
			turns_idled_in_vassal_territory = {},
			turns_idled_in_other_territory = {},
		}

		self:recalculate_max_princes(faction)
		cm:set_script_state(faction, self.config.shared_states.num_princes, 0)
		cm:set_script_state(self.config.shared_states.max_possible_princes, self.config.max_num_prince_slots)

		if local_faction_name == faction_key then
			egypt_political_states:activate_button("button_fm_phar_tudhaliya", true)
		end
	end,

	get_equipped_title = function(self, prince_cqi, titles_table)
		local prince = cm:get_character_by_fm_cqi(prince_cqi)
		local title_keys = titles_table.title_keys

		if not prince or prince:is_null_interface() then
			return nil
		end

		for _, title_key in ipairs(title_keys) do
			if prince:has_ancillary(title_key) then
				return title_key
			end
		end

		return nil
	end,

	add_titles_to_prince = function(self, prince_cqi, titles_table, title_to_upgrade)
		local skill_key = titles_table.skill_key
		local title_keys = titles_table.title_keys
		local char_lookup_str = "family_member_cqi:"..tostring(prince_cqi)

		local character = cm:get_family_member_by_cqi(prince_cqi):character()
		local faction_key = character:faction():name()

		cm:force_add_skill(char_lookup_str, skill_key, true, false)

		for _, title_key in ipairs(title_keys) do
			if is_string(title_to_upgrade) then
				if self.config.title_to_upgraded_title_key[title_to_upgrade] == title_key
					or self.config.title_to_upgraded_title_key[title_key] == title_to_upgrade
				then
					-- If we're upgrading or downgrading a title then we auto-equip it
					cm:force_add_and_equip_ancillary(char_lookup_str, title_key, true)
				else
					-- otherwise we add it to the faction
					cm:add_ancillary_to_faction(faction_key, title_key, false)
				end
			else
				---- And if we're not auto upgrading then we just equip the first one available if there's a slot available
				--cm:force_add_ancillary(char_lookup_str, title_key, true)

				-- We no longer want to automatically equip the title in this situation by design, so we add it to the faction
				cm:add_ancillary_to_faction(faction_key, title_key, false)
			end
		end
	end,

	remove_titles_from_prince = function(self, prince_cqi, titles_table)
		local skill_key = titles_table.skill_key
		local title_keys = titles_table.title_keys

		if not prince_cqi then
			for _, title_key in ipairs(title_keys) do
				cm:force_remove_ancillary_from_faction(self.persistent.faction_key, title_key, false, false)
			end
		else
			local char_lookup_str = "family_member_cqi:"..tostring(prince_cqi)

			for _, title_key in ipairs(title_keys) do
				cm:force_remove_ancillary(char_lookup_str, title_key, false, true)
			end

			cm:force_remove_skill(char_lookup_str, skill_key, false)
		end
	end,

	demote_prince = function(self, prince_cqi)
		self:remove_passive_relations_bonus_to_vassal(prince_cqi)

		self:remove_effect_bundle_from_prince(prince_cqi, self.config.promoted_prince_effect_bundle_key)
		self:apply_effect_bundle_to_prince(prince_cqi, self.config.prince_effect_bundle_key)

		local equipped_title = self:get_equipped_title(prince_cqi, self.config.upgraded_titles)

		self:remove_titles_from_prince(prince_cqi, self.config.upgraded_titles)
		self:add_titles_to_prince(prince_cqi, self.config.titles, equipped_title)

		local vassal = cm:get_faction(self.persistent.prince_vassal_map[prince_cqi])
		cm:remove_script_state(vassal, self.config.shared_states.assigned_prince_char_cqi)

		self.persistent.prince_vassal_map[prince_cqi] = nil

		local character = cm:get_family_member_by_cqi(prince_cqi):character()
		if character and not character:is_null_interface() then
			cm:remove_script_state(character, self.config.shared_states.vassal_faction)
		end
	end,

	promote_prince = function(self, prince_cqi, vassal_key)
		self:apply_passive_relations_bonus_to_vassal(prince_cqi)

		self:remove_effect_bundle_from_prince(prince_cqi, self.config.prince_effect_bundle_key)
		self:apply_effect_bundle_to_prince(prince_cqi, self.config.promoted_prince_effect_bundle_key)

		local equipped_title = self:get_equipped_title(prince_cqi, self.config.titles)

		self:remove_titles_from_prince(prince_cqi, self.config.titles)
		self:add_titles_to_prince(prince_cqi, self.config.upgraded_titles, equipped_title)

		local character = cm:get_family_member_by_cqi(prince_cqi):character()
		if character and not character:is_null_interface() then
			cm:set_script_state(character, self.config.shared_states.vassal_faction, vassal_key)

			local vassal = cm:get_faction(vassal_key)
			cm:set_script_state(vassal, self.config.shared_states.assigned_prince_char_cqi, character:command_queue_index())
		end

	end,

	prince_is_promoted = function(self, prince_cqi)
		return to_bool(self.persistent.prince_vassal_map[prince_cqi])
	end,

	apply_effect_bundle_to_prince = function(self, prince_cqi, bundle_key)
		local family_member = cm:get_family_member_by_cqi(prince_cqi)
		local character = family_member:character()
		if character and not character:is_null_interface() and is_string(bundle_key) and bundle_key ~= "" then
			cm:apply_effect_bundle_to_character(bundle_key, character:command_queue_index(), 0)
		end
	end,

	remove_effect_bundle_from_prince = function(self, prince_cqi, bundle_key)
		local family_member = cm:get_family_member_by_cqi(prince_cqi)
		local character = family_member:character()
		if character and not character:is_null_interface() and is_string(bundle_key) and bundle_key ~= "" then
			cm:remove_effect_bundle_from_character(bundle_key, character:command_queue_index())
		end
	end,

	get_passive_relations_value = function(self, prince_cqi)
		local family_member = cm:get_family_member_by_cqi(prince_cqi)
		local rank = family_member:rank()
		local rank_to_relation_table = self.config.passive_diplomatic_relations.character_rank_to_diplomatic_relations
		local best_relation_rank = 0

		for req_rank, _ in pairs(rank_to_relation_table) do
			if rank >= req_rank and req_rank > best_relation_rank then
				best_relation_rank = req_rank
			end
		end

		return rank_to_relation_table[best_relation_rank] or 0
	end,

	apply_passive_relations_bonus_to_vassal = function(self, prince_cqi)
		self:apply_effect_bundle_to_prince(prince_cqi, self.config.passive_diplomatic_relations.prince_effect_bundle_key)

		local relations_bonus = self:get_passive_relations_value(prince_cqi)

		if relations_bonus == 0 then
			return
		end

		local vassal_key = self:get_vassal_assigned_to_prince(prince_cqi)
		local diplomacy_bonus = self.config.passive_diplomatic_relations.faction_effect_bundle_key
		local custom_bundle = cm:clone_or_create_custom_effect_bundle(vassal_key, diplomacy_bonus)

		custom_bundle:set_duration(0)

		local effects = custom_bundle:effects()
		for i = 0, effects:num_items() - 1 do
			local effect = effects:item_at(i)
			custom_bundle:set_effect_value(effect, relations_bonus)
		end

		cm:apply_custom_effect_bundle_to_faction(custom_bundle, cm:get_faction(vassal_key))
	end,

	remove_passive_relations_bonus_to_vassal = function(self, prince_cqi)
		local vassal_key = self:get_vassal_assigned_to_prince(prince_cqi)
		cm:remove_effect_bundle(self.config.passive_diplomatic_relations.faction_effect_bundle_key, vassal_key)
		self:remove_effect_bundle_from_prince(prince_cqi, self.config.passive_diplomatic_relations.prince_effect_bundle_key)
	end,

	recalculate_max_princes = function(self, faction)
		if not faction then
			faction = cm:get_faction(self.persistent.faction_key)
		end

		local start_princes = self.config.num_prince_slots_start
		local num_vassals = faction:factions_master_of():num_items() + faction:factions_sovereign_of():num_items()
		local bonus_for_each_vassal = self.config.num_prince_slots_bonus_from_vassal
		local max = self.config.max_num_prince_slots

		self.persistent.max_princes = math.min(max, start_princes + num_vassals * bonus_for_each_vassal)

		cm:set_script_state(faction, self.config.shared_states.max_princes, self.persistent.max_princes)
	end,

	check_for_prince_idle_relation_bonus = function(self, prince_cqi, vassal_key)
		local family_member = cm:get_family_member_by_cqi(prince_cqi)

		if not family_member:is_alive() or family_member:is_convalescing() then
			return
		end

		local region = family_member:character():region()

		if not region or region:is_null_interface() then
			-- Happens when the character finished convalescence and is
			-- not recruited currently or when the character is on water
			if self.config.active_diplomatic_relations.idle_in_vassal_territory.turns_should_be_consecutive then
				self.persistent.turns_idled_in_vassal_territory[prince_cqi] = nil
			end
			return
		end

		local region_faction = region:owning_faction()

		if not region_faction or region_faction:is_null_interface() then
			return
		end

		local config_table
		local turn_counter_table
		local inside_vassal_territory

		if region_faction:name() == vassal_key then
			config_table = self.config.active_diplomatic_relations.idle_in_vassal_territory
			turn_counter_table = self.persistent.turns_idled_in_vassal_territory
			inside_vassal_territory = true

			if self.config.active_diplomatic_relations.idle_in_other_territory.turns_should_be_consecutive then
				self.persistent.turns_idled_in_other_territory[prince_cqi] = nil
			end
		else
			config_table = self.config.active_diplomatic_relations.idle_in_other_territory
			turn_counter_table = self.persistent.turns_idled_in_other_territory
			inside_vassal_territory = false

			if self.config.active_diplomatic_relations.idle_in_vassal_territory.turns_should_be_consecutive then
				self.persistent.turns_idled_in_vassal_territory[prince_cqi] = nil
			end
		end

		local turns_idled = 1 + (turn_counter_table[prince_cqi] or 0)

		if turns_idled > config_table.turns_to_activate then
			turns_idled = nil

			cm:apply_prince_idle_diplomatic_bonus(self.persistent.faction_key, vassal_key, inside_vassal_territory)
		end

		turn_counter_table[prince_cqi] = turns_idled
	end,

	check_for_prince_battle_relation_bonus = function(self, prince_cqi, battle_won)
		local config_table
		local counter_table

		if battle_won then
			config_table = self.config.active_diplomatic_relations.winning_battles
			counter_table = self.persistent.num_won_battles
		else
			config_table = self.config.active_diplomatic_relations.losing_battles
			counter_table = self.persistent.num_lost_battles
		end

		local num_battles = 1 + (counter_table[prince_cqi] or 0)

		if num_battles >= config_table.battles_to_activate then
			num_battles = nil

			local vassal_key = self.persistent.prince_vassal_map[prince_cqi]

			cm:apply_prince_battle_diplomatic_bonus(self.persistent.faction_key, vassal_key, battle_won)
		end
		counter_table[prince_cqi] = num_battles
	end,

	-- Checks if the faction is a vassal assigned to a prince and demotes the prince if so
	demote_prince_if_faction_is_vassal = function(self, faction_key)
		for prince_cqi, vassal_key in pairs(self.persistent.prince_vassal_map) do
			if vassal_key == faction_key then
				self:demote_prince(prince_cqi)
				return
			end
		end
	end,

	get_listeners = function(_)
		return {
			{
				event = "FactionCharacterDiedOrWounded",
				auto_check_faction = true,
				condition = true,
				callback = function(self, context)
					local family_member = context:family_member()
					local character = family_member:character()

					if not character or character:is_null_interface() or character:is_wounded() then
						return
					end

					local prince_cqi = family_member:command_queue_index()
					local prince_idx = table_find(self.persistent.assigned_princes, prince_cqi, true)

					if not prince_idx then
						return
					end

					table.remove(self.persistent.assigned_princes, prince_idx)
					cm:set_script_state(character:faction(), self.config.shared_states.num_princes, #self.persistent.assigned_princes)
					-- Used for campaign interventions
					core:trigger_event("ScriptEventPrinceDied", character:faction())

					if self:prince_is_promoted(prince_cqi) then
						local vassal = cm:get_faction(self.persistent.prince_vassal_map[prince_cqi])
						cm:remove_effect_bundle(self.config.passive_diplomatic_relations.faction_effect_bundle_key, vassal:name())
						cm:remove_script_state(vassal, self.config.shared_states.assigned_prince_char_cqi)
						self.persistent.prince_vassal_map[prince_cqi] = nil
						self:remove_titles_from_prince(nil, self.config.upgraded_titles)
					else
						self:remove_titles_from_prince(nil, self.config.titles)
					end
				end,
			},

			{
				event = "CharacterCreated",
				auto_check_faction = false,
				condition = function(self, context)
					return self:is_prince(context:character():family_member():command_queue_index())
				end,
				callback = function(self, context)
					local prince = context:character()
					local prince_cqi = prince:family_member():command_queue_index()
					if self:prince_is_promoted(prince_cqi) then
						self:apply_effect_bundle_to_prince(prince_cqi, self.config.promoted_prince_effect_bundle_key)
						self:apply_effect_bundle_to_prince(prince_cqi, self.config.passive_diplomatic_relations.prince_effect_bundle_key)
					else
						self:apply_effect_bundle_to_prince(prince_cqi, self.config.prince_effect_bundle_key)
					end

					cm:set_script_state(prince, self.config.shared_states.is_prince, true)

					local vassal_key = self:get_vassal_assigned_to_prince(prince_cqi)
					if vassal_key then
						cm:set_script_state(prince, self.config.shared_states.vassal_faction, vassal_key)

						local vassal = cm:get_faction(vassal_key)
						cm:set_script_state(vassal, self.config.shared_states.assigned_prince_char_cqi, prince:command_queue_index())
					else
						cm:remove_script_state(prince, self.config.shared_states.vassal_faction)
					end
				end,
			},

			{
				event = "FactionBecomesVassal",
				auto_check_faction = false,
				condition = function(self, context)
					local vassal = context:faction()
					local faction = cm:get_faction(self.persistent.faction_key)
					return vassal:is_vassal_of(faction)
				end,
				callback = function(self, context)
					-- While in this event the faction:num_vassals() function does not return the correct amount of vassals
					-- so we call "recalculate_max_princes()" as soon as possible in a callback
					cm:callback(
						function() self:recalculate_max_princes() end,
						0.1
					)
				end,
			},

			{
				event = "FactionBecomesSubject",
				auto_check_faction = false,
				condition = function(self, context)
					local vassal = context:faction()
					local faction = cm:get_faction(self.persistent.faction_key)
					return vassal:is_subject_of(faction)
				end,
				callback = function(self, context)
					-- While in this event the faction:num_vassals() function does not return the correct amount of vassals
					-- so we call "recalculate_max_princes()" as soon as possible in a callback
					cm:callback(
						function() self:recalculate_max_princes() end,
						0.1
					)
				end,
			},

			-- Check whether a faction breaks their subjugation or vassalage and recalculates the max princes if so
			{
				event = "NegativeDiplomaticEvent",
				auto_check_faction = false,
				condition = function(self, context)
					return (context:was_vassalage() or context:was_subjugation())
							and (context:proposer():name() == self.persistent.faction_key
								or context:recipient():name() == self.persistent.faction_key)
				end,
				callback = function(self, context)
					self:recalculate_max_princes()

					local proposer = context:proposer():name()
					local recipient = context:recipient():name()
					local faction_to_check = (proposer == self.persistent.faction_key and recipient) or proposer

					self:demote_prince_if_faction_is_vassal(faction_to_check)
				end,
			},

			{
				event = "FactionDestroyed",
				auto_check_faction = false,
				condition = true,
				callback = function(self, context)
					self:recalculate_max_princes()
					self:demote_prince_if_faction_is_vassal(context:faction():name())
				end,
			},

			{
				event = "FactionTurnStart",
				auto_check_faction = true,
				condition = true,
				callback = function(self, context)
					for _, prince_cqi in ipairs(self.persistent.assigned_princes) do
						local vassal_key = self.persistent.prince_vassal_map[prince_cqi]
						if vassal_key then
							self:check_for_prince_idle_relation_bonus(prince_cqi, vassal_key)
						end
					end
				end,
			},

			{
				event = "BattleConflictFinished",
				auto_check_faction = false,
				condition = true,
				callback = function(self, context)
					local pending_battle = context:pending_battle()
					if not pending_battle:has_been_fought() then
						return
					end

					local check_character = function(character, is_winner)
						local family_member_cqi = character:family_member():command_queue_index()

						if not character or character:is_null_interface() or not self:is_prince(family_member_cqi) then
							return
						end

						self:check_for_prince_battle_relation_bonus(family_member_cqi, is_winner)
						-- Used for campaign interventions.
						core:trigger_custom_event("ScriptEventPrinceFoughtBattle", {is_winner, faction = character:faction()})
					end

					local attacker = pending_battle:attacker()
					local attacker_is_winner = attacker:won_battle()

					check_character(attacker, attacker_is_winner)
					cm:iterate(function(character)
						check_character(character, attacker_is_winner)
					end, pending_battle:secondary_attackers())

					check_character(pending_battle:defender(), not attacker_is_winner)
					cm:iterate(function(character)
						check_character(character, not attacker_is_winner)
					end, pending_battle:secondary_defenders())
				end,
			},

			{
				event = "CharacterRankUp",
				auto_check_faction = false,
				condition = function(self, context)
					return self:is_prince(context:character():family_member():command_queue_index())
				end,
				callback = function(self, context)
					local prince = context:character()
					local prince_cqi = prince:family_member():command_queue_index()
					local prince_rank = prince:rank()

					for rank, _ in pairs(self.config.passive_diplomatic_relations.character_rank_to_diplomatic_relations) do
						if prince_rank == rank and self:prince_is_promoted(prince_cqi) then
							-- We reached a new threshold, remove old and apply new bonus
							self:remove_passive_relations_bonus_to_vassal(prince_cqi)
							self:apply_passive_relations_bonus_to_vassal(prince_cqi)
						end
					end
				end,
			},

			{
				event = "CharacterAncillaryGained",
				auto_check_faction = false,
				condition = function(self, context)
					return self:is_prince(context:character():family_member():command_queue_index())
						and (table_find(self.config.titles.title_keys, context:ancillary())
							or table_find(self.config.upgraded_titles.title_keys, context:ancillary()))
				end,
				callback = function(self, context)
					local prince = context:character()
					cm:add_event_feed_event(
						"ancient_legacy_tudhaliya_prince_title_gained",
						prince:faction():name(),
						0,
						"",
						"",
						"",
						prince:command_queue_index()
					)

					if cm:get_local_faction_name(true) == prince:faction():name() then
						cm:notify_tudhaliya_title_assigned_to_prince(prince:faction():name(), context:ancillary())
					end
				end,
			},

			{
				event = "UITriggerScriptEvent",
				auto_check_faction = false,
				condition = function(self, context)
					local faction = cm:model():faction_for_command_queue_index(context:faction_cqi())
					return faction and not faction:is_null_interface() and self.persistent.faction_key == faction:name()
				end,
				callback = function(self, context)
					local trigger = context:trigger():split(":")

					if #trigger == 0 then
						return
					end

					if trigger[1] == "tudhaliya_assign_prince" then
						local char_cqi = tonumber(trigger[2])
						local family_member_cqi = cm:get_character_by_cqi(char_cqi):family_member():command_queue_index()

						self:assign_prince(family_member_cqi)
					elseif trigger[1] == "tudhaliya_promote_prince" then
						local char_cqi = tonumber(trigger[2])
						local family_member_cqi = cm:get_character_by_cqi(char_cqi):family_member():command_queue_index()

						local faction_cqi = tonumber(trigger[3])
						local faction_key = cm:model():faction_for_command_queue_index(faction_cqi):name()

						self:assign_vassal_to_prince(family_member_cqi, faction_key)
					elseif trigger[1] == "tudhaliya_unassign_prince" then
						local char_cqi = tonumber(trigger[2])
						local family_member_cqi = cm:get_character_by_cqi(char_cqi):family_member():command_queue_index()

						self:unassign_prince(family_member_cqi)
					elseif trigger[1] == "tudhaliya_demote_prince" then
						local char_cqi = tonumber(trigger[2])
						local family_member_cqi = cm:get_character_by_cqi(char_cqi):family_member():command_queue_index()

						self:unassign_vassal_from_prince(family_member_cqi)
					else
						return
					end

					local local_faction_key = cm:get_local_faction_name(true)
					-- Only update the UI for the local player since there's no point in doing it for the other one
					if local_faction_key == cm:model():faction_for_command_queue_index(context:faction_cqi()):name() then
						local tudhaliya_ui = core:get_ui_root():SequentialFind("legacy_tudhaliya")

						-- Setting the faction CCO on the topmost component will automatically refresh everything
						-- in the Tudhaliya UI because everything uses the faction CCO
						if tudhaliya_ui then
							tudhaliya_ui:SetContextObject(cco("CcoCampaignFaction", local_faction_key))
						end
					end
				end,
			},

			{
				event = "FirstTickAfterWorldCreated",
				auto_check_faction = false,
				condition = function(self, context)
					return self.persistent.faction_key == cm:get_local_faction_name(true)
				end,
				callback = function(self, context)
					egypt_political_states:activate_button("button_fm_phar_tudhaliya")
				end
			},

			{
				event = "ComponentLClickUp",
				auto_check_faction = false,
				condition = function(self, context)
					local uic = UIComponent(context.component)
					return uic:Id() == "change_title_btn" and uicomponent_descended_from(uic, "legacy_tudhaliya")
				end,
				callback = function(self, context)
					local tudhaliya_ui = core:get_ui_root():SequentialFind("legacy_tudhaliya")
					if tudhaliya_ui then
						tudhaliya_ui:InterfaceFunction("close_panel")
					end
				end,
			},
		}
	end,

	-- persistent data is already loaded by ancient_legacy_common, we are just informed we are loaded
	on_loading_game = function(self, faction_key)
	end,

	debug_helpers = {
		add_titles_to_character = function(char_cqi)
			if not char_cqi then
				char_cqi = cm:get_local_faction(true):faction_leader():command_queue_index()
			end

			local skill_key = tudhaliya_config.titles.skill_key
			local title_keys = tudhaliya_config.titles.title_keys
			local char_lookup_str = cm:char_lookup_str(char_cqi)

			cm:force_add_skill(char_lookup_str, skill_key, true, false)

			for _, title_key in ipairs(title_keys) do
				cm:force_add_ancillary(char_lookup_str, title_key, true)
			end
		end,

		remove_titles_from_character = function(char_cqi)
			local faction
			if not char_cqi then
				faction = cm:get_local_faction(true)
				char_cqi = faction:faction_leader():command_queue_index()
			else
				faction = cm:get_character(char_cqi):faction()
			end

			local skill_key = tudhaliya_config.titles.skill_key
			local title_keys = tudhaliya_config.titles.title_keys
			local char_lookup_str = cm:char_lookup_str(char_cqi)

			for _, title_key in ipairs(title_keys) do
				cm:force_remove_ancillary(char_lookup_str, title_key, false, true)
			end

			cm:force_remove_skill(char_lookup_str, skill_key, false)
		end,
	},
}

return ancient_legacies_tudhaliya
