local file_info = debug.getinfo(1, "S")
local folder_file_splits = string.split(file_info.source, "\\")
out("Loading " .. folder_file_splits[#folder_file_splits])

crown_ancillary_system = {
	persistent = {
		ancillaries_unlocked_for_faction = {
		--[[
			faction_key1 = true,
			faction_key2 = true,
		--]]
		},

		permanently_unlocked_ancillaries = {
		--[[
			faction_key = {
			    crown_key_1 = true,
			    crown_key_2 = true,
			}
		--]]
		},

		character_legitimacy_values = {
		--[[
			character_cqi = legitimacy_value
		--]]
		},

		cai_last_ancillary_to_wear_data = {
		--[[
			faction_key = last_crown_config_table
		]]
		},
	},

	temporary = {
		character_legitimacy_to_be_updated = {
			--[[
			char_cqi = true,
			--]]
		},
	},

	-- Regions that we will track for this mechanic, populated on initialization at the bottom of this file
	special_regions = { },

	-- These shared states get a suffix applied to them of _<legitimacy_pooled_resource_key>
	-- e.g. legitimacy_to_start_war becomes:
	------- legitimacy_to_start_war_phar_legitimacy
	------- legitimacy_to_start_war_phar_hatti_legitimacy
	------- etc
	shared_states_suffixed = {
		-- This is a list of ancillary keys for this legitimacy path separated by semicolon. Example:
		-- phar_main_crown_nemes;phar_main_crown_khepresh;phar_main_crown_hedjet
		ancillaries_list = "legitimacy_path_ancillaries",
	},

	--[[ These are filled out in the config files of the different legitimacies
	legitimacy_system = <legitimacy object, like egypt_legitimacy>,
	political_states_system = <political states object, like egypt_political_states>,
	--]]

	events = {
		RegionFactionChangeEvent = function(self, context)
			local region_key = context:region():name()

			if not self.special_regions[region_key] then
				return
			end

			local new_faction_key = context:region():owning_faction():name()
			local previous_faction_key = context:previous_faction():name()

			if self.persistent.ancillaries_unlocked_for_faction[new_faction_key] then
				self:try_to_add_ancillaries_after_gaining_region(new_faction_key, region_key)
			end

			if self.persistent.ancillaries_unlocked_for_faction[previous_faction_key] then
				self:try_to_remove_ancillaries_after_losing_region(previous_faction_key, region_key)
			end
		end,

		CharacterAncillaryEquipped = function(self, context)
			local character_cqi = context:character():command_queue_index()

			-- Updating legitimacy later in the CharacterTurnStart event because bonus values
			-- for the character are not yet updated for the newly equipped ancillary
			self.temporary.character_legitimacy_to_be_updated[character_cqi] = true
		end,

		CharacterAncillaryGained = function(self, context)
			local gained_ancillary = context:ancillary()

			for _, ancillary in ipairs(self.config.ancillaries) do
				if ancillary.ancillary_key == gained_ancillary then
					common.send_ui_update_message(self.config.ui_event_on_equip)
					break
				end
			end
		end,

		CharacterAncillaryLost = function(self, context)
			local character = context:character()
			self:update_character_legitimacy(character)

			local gained_ancillary = context:ancillary()

			for _, ancillary in ipairs(self.config.ancillaries) do
				if ancillary.ancillary_key == gained_ancillary then
					common.send_ui_update_message(self.config.ui_event_on_equip)
					break
				end
			end
		end,

		CharacterTurnStart = function(self, context)
			local character = context:character()
			local character_cqi = character:command_queue_index()

			if self.temporary.character_legitimacy_to_be_updated[character_cqi] then
				self:update_character_legitimacy(character)
				self.temporary.character_legitimacy_to_be_updated[character_cqi] = nil
			end
		end,

		ScriptEventCourtFactionGainedCourtPosition = function(self, context)
			local faction_key = context.stored_table.faction_key

			if not self.legitimacy_system:can_use(faction_key) then
				return
			end

			local court_position_key = context.stored_table.court_position_key
			self:try_to_add_ancillaries_after_gaining_court_position(faction_key, court_position_key, false)
		end,

		ScriptEventCourtFactionLostCourtPosition = function(self, context)
			local faction_key = context.stored_table.faction_key

			if not self.legitimacy_system:can_use(faction_key) then
				return
			end

			local court_position_key = context.stored_table.court_position_key
			self:try_to_remove_ancillaries_after_losing_court_position(faction_key, court_position_key)
		end,

		FactionCharacterDiedOrWounded = function(self, context)
			local family_member = context:family_member()
			local character = family_member:character()
			local faction = character:faction()
			local faction_key = faction:name()

			-- If our faction leader dies and is not wounded we want to unequip from him so that they're not lost with
			-- the death and are available for the new faction leader that will come up in CharacterBecomesFactionLeader
			if not character
				or character:is_null_interface()
				or not self.legitimacy_system:can_use(faction_key)
				or not character:is_faction_leader()
				or character:is_wounded()
			then
				return
			end

			self:unequip_ancillaries_for_character(character)
		end,

		CharacterBecomesFactionLeader = function(self, context)
			local character = context:character()
			local faction = character:faction()
			local faction_key = faction:name()

			if not character
				or character:is_null_interface()
				or not self.legitimacy_system:can_use(faction_key)
			then
				return
			end

			-- Add skill for new faction leader in a bit after he's fully initialized
			cm:callback(function()
				self:unlock_ancillary_skill_for_character(character)
			end, 0.1)
		end,
	},

	post_init_generic = function(self)
		for k, v in pairs(self.shared_states_suffixed) do
			self.shared_states_suffixed[k] = v .. "_" .. self.legitimacy_system.config.resource_key
		end
	end,

	unlock_ancillaries = function(self, faction_key, is_new_game)
		local faction = cm:get_faction(faction_key)

		if not faction then
			self:error_message("trying to unlock ancillary for a faction that does not exist: "..tostring(faction_key))
			return
		end

		if not self.persistent.ancillaries_unlocked_for_faction[faction_key] then
			self.persistent.ancillaries_unlocked_for_faction[faction_key] = true

			if not self.persistent.permanently_unlocked_ancillaries[faction_key] then
				self.persistent.permanently_unlocked_ancillaries[faction_key] = {}
			end

			local faction_leader = faction:faction_leader()
			local char_lookup_str = nil

			if faction_leader and not faction_leader:is_null_interface() then
				char_lookup_str = cm:char_lookup_str(faction_leader:command_queue_index())
			end

			if not char_lookup_str then
				self:error_message("trying to unlock ancillary for a faction that does not have a leader?: "..tostring(faction_key))
				return
			end

			cm:force_add_skill(char_lookup_str, self.config.ancillary_skill, true, false)

			for _, crown_data in ipairs(self.config.ancillaries) do
				if (not crown_data.permanent_unlock
						or not self:has_faction_permanently_unlocked_ancillary(faction_key, crown_data.ancillary_key))
					and self:check_ancillary_pretender_availability(faction_key, crown_data)
				then
					local regions_needed = crown_data.regions_needed or {}
					local num_regions_needed = (crown_data.num_regions_needed or #regions_needed)
					local num_regions_have = 0

					for _, region_key in ipairs(regions_needed) do
						if self:check_region_ownership(faction_key, region_key) then
							num_regions_have = 1 + num_regions_have
						end
					end

					if num_regions_have >= num_regions_needed then
						self:unlock_specific_ancillary(crown_data, faction, faction_key, char_lookup_str, is_new_game)
					end
				end
			end
		end
	end,

	unlock_crowns = function(self, ancillary_key, is_new_game)
		return self:unlock_ancillaries(ancillary_key, is_new_game)
	end,

	unequip_ancillaries_for_character = function(self, character)
		local char_lookup_str = cm:char_lookup_str(character:command_queue_index())
		local return_to_pool = true
		local remove_from_faction = false

		for _, ancillary_data in ipairs(self.config.ancillaries) do
			local ancillary_key = ancillary_data.ancillary_key

			if character:has_ancillary_equipped(ancillary_key) then
				cm:force_remove_ancillary(char_lookup_str, ancillary_key, return_to_pool, remove_from_faction)
			end
		end
	end,

	unlock_ancillary_skill_for_character = function(self, character)
		if not character or character:is_null_interface() then
			self:error_message("trying to unlock ancillary skill for non existing character")
			return
		end

		local char_lookup_str = cm:char_lookup_str(character:command_queue_index())
		if not char_lookup_str then
			self:error_message("trying to unlock ancillary skill for non existing character")
			return
		end

		cm:force_add_skill(char_lookup_str, self.config.ancillary_skill, true, false)
	end,

	lock_ancillaries = function(self, faction_key)
		local faction = cm:get_faction(faction_key)

		if not faction then
			self:error_message("trying to lock ancillary for a faction that does not exist: "..tostring(faction_key))
			return
		end

		if self.persistent.ancillaries_unlocked_for_faction[faction_key] then
			for _, crown_data in ipairs(self.config.ancillaries) do
				if not crown_data.permanent_unlock then
					cm:force_remove_ancillary_from_faction(faction_key, crown_data.ancillary_key, true)
				end
			end
		end

		self.persistent.ancillaries_unlocked_for_faction[faction_key] = nil
	end,

	lock_crowns = function(self, faction_key)
		if not self.config.ancillaries_always_unlocked then
			self:lock_ancillaries(faction_key)
		end
	end,

	try_to_add_ancillaries_after_gaining_region = function(self, faction_key, region_key)
		if faction_key == "rebels" then
			return
		end

		local faction = cm:get_faction(faction_key)

		if not faction or faction:is_dead() then
			self:error_message("trying to add ancillaries after taking a region for a faction that doesn't exist or is dead: "..tostring(faction_key))
			return
		end

		local ancillaries_unlocked_for_faction = self.persistent.ancillaries_unlocked_for_faction[faction_key]

		if not ancillaries_unlocked_for_faction then
			return
		end

		local char_lookup_str = cm:char_lookup_str(faction:faction_leader():command_queue_index())

		for _, ancillary_data in ipairs(self.config.ancillaries) do
			if (not ancillary_data.permanent_unlock
					or not self:has_faction_permanently_unlocked_ancillary(faction_key, ancillary_data.ancillary_key))
				and self:check_ancillary_pretender_availability(faction_key, ancillary_data)
				and not faction:ancillary_exists(ancillary_data.ancillary_key)
			then
				if self:check_regions_needed_for_ancillary(faction_key, ancillary_data) then
					self:unlock_specific_ancillary(ancillary_data, faction, faction_key, char_lookup_str)
				end
			end
		end
	end,

	check_regions_needed_for_ancillary = function(self, faction_key, ancillary_data)
		local num_of_owned_regions = 0

		-- Loop through the regions list
		for _, needed_region in ipairs(ancillary_data.regions_needed or {}) do				
			-- Just in case one of the other regions in the list is relevant, 
			-- Increment owned counter if we own the current region
			if self:check_region_ownership(faction_key, needed_region) then
				num_of_owned_regions = num_of_owned_regions + 1
			end
		end

		-- By default, make no regions within the list optional
		local min_regions = 0
		if ancillary_data.regions_needed ~= nil then
			min_regions = #ancillary_data.regions_needed
		end

		-- Though this assumption can be overridden by using num_regions_needed
		min_regions = ancillary_data.num_regions_needed or min_regions

		return num_of_owned_regions >= min_regions
	end,

	try_to_remove_ancillaries_after_losing_region = function(self, faction_key, region_key)
		if faction_key == "rebels" then
			return
		end

		local faction = cm:get_faction(faction_key)

		if not faction or faction:is_dead() then
			self:error_message("trying to add ancillaries after taking a region for a faction that doesn't exist or is dead: "..tostring(faction_key))
			return
		end

		local ancillaries_unlocked_for_faction = self.persistent.ancillaries_unlocked_for_faction[faction_key]

		if not ancillaries_unlocked_for_faction then
			return
		end

		for _, crown_data in ipairs(self.config.ancillaries) do
			if not crown_data.permanent_unlock then
				

				if not self:check_regions_needed_for_ancillary(faction_key, crown_data) then
					cm:force_remove_ancillary_from_faction(faction_key, crown_data.ancillary_key, true)

					-- Hack fix. The CAI does not have any ability to equip or un-equip ancillaries
					-- so we remove previously gotten ancillaries and re-add them so they get equipped
					if not faction:is_human() then
						self:lock_ancillaries(faction_key)
						self:unlock_ancillaries(faction_key)
						break
					end
				end
			end
		end
	end,

	try_to_unlock_sitting_ruler_ancillaries = function(self, faction_key)
		local faction = cm:get_faction(faction_key)
		local char_lookup_str = cm:char_lookup_str(faction:faction_leader():command_queue_index())

		for _, crown_data in ipairs(self.config.ancillaries) do
			if (not crown_data.permanent_unlock
				or not self:has_faction_permanently_unlocked_ancillary(faction_key, crown_data.ancillary_key))
				and crown_data.available_to_pretenders == false -- Not checking for nil on purpose
			then
				if self:check_regions_needed_for_ancillary(faction_key, crown_data) then
					self:unlock_specific_ancillary(crown_data, faction, faction_key, char_lookup_str)
				end
			end
		end
	end,

	try_to_add_ancillaries_after_gaining_court_position = function(self, faction_key, court_position_key, is_new_game)
		local ancillaries_unlocked_for_faction = self.persistent.ancillaries_unlocked_for_faction[faction_key]

		if not ancillaries_unlocked_for_faction then
			return
		end

		local faction = cm:get_faction(faction_key)
		local char_lookup_str = cm:char_lookup_str(faction:faction_leader():command_queue_index())

		for _, crown_data in ipairs(self.config.ancillaries) do
			if (not crown_data.permanent_unlock
				or not self:has_faction_permanently_unlocked_ancillary(faction_key, crown_data.ancillary_key))
				and crown_data.available_to_pretenders == false -- Not checking for nil on purpose
				and crown_data.court_position_needed == court_position_key
			then
				self:unlock_specific_ancillary(crown_data, faction, faction_key, char_lookup_str, is_new_game)
			end
		end
	end,

	try_to_remove_ancillaries_after_losing_court_position = function(self, faction_key, court_position_key)
		local faction = cm:get_faction(faction_key)

		if not faction or faction:is_dead() then
			self:error_message("trying to add ancillaries after taking a region for a faction that doesn't exist or is dead: "..tostring(faction_key))
			return
		end

		local ancillaries_unlocked_for_faction = self.persistent.ancillaries_unlocked_for_faction[faction_key]

		if not ancillaries_unlocked_for_faction then
			return
		end

		for _, crown_data in ipairs(self.config.ancillaries) do
			if not crown_data.permanent_unlock and crown_data.court_position_needed == court_position_key then
				cm:force_remove_ancillary_from_faction(faction_key, crown_data.ancillary_key, true)

				-- Hack fix. The CAI does not have any ability to equip or un-equip ancillaries
				-- so we remove previously gotten ancillaries and re-add them so they get equipped
				if not faction:is_human() then
					self:lock_ancillaries(faction_key)
					self:unlock_ancillaries(faction_key)
					break
				end
			end
		end
	end,

	unlock_specific_ancillary = function(self, crown_data, faction, faction_key, char_lookup_str, is_new_game)
		if crown_data.permanent_unlock then
			if not self.persistent.permanently_unlocked_ancillaries[faction_key] then
				self.persistent.permanently_unlocked_ancillaries[faction_key] = {}
			end
			self.persistent.permanently_unlocked_ancillaries[faction_key][crown_data.ancillary_key] = true
		end

		if faction:is_human() then
			if crown_data.ancillary_key == "NONE" then
				return
			end

			if not is_new_game then
				cm:force_add_ancillary(char_lookup_str, crown_data.ancillary_key)
			elseif crown_data.auto_equip_on_new_game then
				cm:force_add_and_equip_ancillary(char_lookup_str, crown_data.ancillary_key)
			else
				cm:add_ancillary_to_faction(faction_key, crown_data.ancillary_key, false)
			end
		else
			self:add_or_equip_ancillary_for_cai(crown_data, faction_key, char_lookup_str)
		end
	end,

	add_or_equip_ancillary_for_cai = function(self, crown_data, faction_key, char_lookup_str)
		if not crown_data.cai_priority_to_wear then
			script_error("ERROR: add_or_equip_ancillary_for_cai called, but the crown " ..crown_data.ancillary_key.. " doesn't have CAI priority setup!\n CAI Will NEVER WEAR THIS!!")
			return
		end

		local cai_priority_to_wear = crown_data.cai_priority_to_wear
		local last_ancillary_to_wear_priority = 0

		if crown_data.override_priority_setup and  crown_data.override_priority_setup[faction_key] then
			cai_priority_to_wear = crown_data.override_priority_setup[faction_key]
		end
		
		if self.persistent.cai_last_ancillary_to_wear_data[faction_key] then
			if self.persistent.cai_last_ancillary_to_wear_data[faction_key].override_priority_setup and self.persistent.cai_last_ancillary_to_wear_data[faction_key].override_priority_setup[faction_key]  then
				last_ancillary_to_wear_priority = self.persistent.cai_last_ancillary_to_wear_data[faction_key].override_priority_setup[faction_key]
			else
				last_ancillary_to_wear_priority = self.persistent.cai_last_ancillary_to_wear_data[faction_key].cai_priority_to_wear
			end
		end
	
		if not is_table(self.persistent.cai_last_ancillary_to_wear_data[faction_key]) then
			if crown_data.ancillary_key ~= "NONE" then
				cm:force_add_and_equip_ancillary(char_lookup_str, crown_data.ancillary_key)
			end
			self.persistent.cai_last_ancillary_to_wear_data[faction_key] = crown_data
		elseif cai_priority_to_wear > (last_ancillary_to_wear_priority or 0) then
			if crown_data.ancillary_key ~= "NONE" then
				cm:force_add_and_equip_ancillary(char_lookup_str, crown_data.ancillary_key)
			end
			self.persistent.cai_last_ancillary_to_wear_data[faction_key] = crown_data
		elseif cai_priority_to_wear == last_ancillary_to_wear_priority and crown_data.ancillary_key ~= self.persistent.cai_last_ancillary_to_wear_data[faction_key].ancillary_key then
			local rand_crown_table = 
			{
				crown_data.ancillary_key,
				self.persistent.cai_last_ancillary_to_wear_data[faction_key].ancillary_key
			}

			local rand_chosen_crown = rand_crown_table[cm:model():random_int(1, #rand_crown_table)]

			if rand_chosen_crown ~= "NONE" then
				cm:force_add_ancillary(char_lookup_str, rand_crown_table[cm:model():random_int(1, #rand_crown_table)])
			end
		end
	end,

	check_ancillary_pretender_availability = function(self, faction_key, crown_data)
		return is_nil(crown_data.available_to_pretenders)
			or crown_data.available_to_pretenders
			or self.political_states_system:is_sitting_ruler(faction_key)
	end,

	check_region_ownership = function(self, faction_key, region_key)
		local region = cm:get_region(region_key)
		return region and region:owning_faction():name() == faction_key
	end,

	has_faction_permanently_unlocked_ancillary = function(self, faction_key, ancillary_key)
		local faction_unlocked_ancillaries = self.persistent.permanently_unlocked_ancillaries[faction_key]
		if not is_table(faction_unlocked_ancillaries) then
			return false
		end

		return to_bool(faction_unlocked_ancillaries[ancillary_key])
	end,

	update_character_legitimacy = function(self, character)
		local char_cqi = character:command_queue_index()
		local old_legitimacy = self.persistent.character_legitimacy_values[char_cqi] or 0
		local new_legitimacy = cm:get_characters_bonus_value(character, self.config.ancillary_legitimacy_scripted_bonus_value_id)

		local legitimacy_to_add = new_legitimacy - old_legitimacy

		if legitimacy_to_add == 0 then
			return
		end

		if new_legitimacy == 0 then
			self.persistent.character_legitimacy_values[char_cqi] = nil
		else
			self.persistent.character_legitimacy_values[char_cqi] = new_legitimacy
		end

		self.legitimacy_system:add_legitimacy(character:faction():name(), self.legitimacy_system.config.ancillaries_factor, legitimacy_to_add)
	end,

	on_new_game_started = function(self, context)
		local ancillary_list_string = ""

		for _, ancillary_data in ipairs(self.config.ancillaries) do
			local ancillary_key = ancillary_data.ancillary_key
			if ancillary_key ~= "NONE" then
				if ancillary_list_string ~= "" then
					ancillary_list_string = ancillary_list_string .. ";"
				end
				ancillary_list_string = ancillary_list_string .. ancillary_key
			end
		end

		cm:set_script_state(self.shared_states_suffixed.ancillaries_list, ancillary_list_string)

		-- NOTE: We want to grant the regalia ancillaries unlocked by owning a court position.
		--		 However, due to order of execution, at this point the methods of the same name in legitimacy choice and court won't be executed,
		--		 neither the ancillaries will be unlocked due to ancillaries_always_unlocked config, nor the court positions would have been given.
		--		 Therefore we do a kind of postponed "on first tick processing only after a new game start" thing.
		self.do_postponed_on_first_tick_after_new_game_started = true	-- No need to serialize this.
	end,

	on_first_tick = function(self, context)
		if self.do_postponed_on_first_tick_after_new_game_started then
			-- Grant the regalia ancillaries unlocked by owning a court position.
			local legitimacy_court = nil
			for _, court in ipairs(court.all_courts) do
				if court.court_legitimacy() == self.legitimacy_system then
					legitimacy_court = court
					break
				end
			end

			for _, ancillary_data in ipairs(self.config.ancillaries) do
				if is_string(ancillary_data.court_position_needed) then
					local court_position_obj = court.util_functions.get_court_position(legitimacy_court, ancillary_data.court_position_needed)
					local holder_faction_key = court_position_obj.persistent.current_holder_faction
					self:try_to_add_ancillaries_after_gaining_court_position(holder_faction_key, ancillary_data.court_position_needed, true)
				end
			end

			self.do_postponed_on_first_tick_after_new_game_started = nil
		end

		return true
	end,

	on_loading_game = function(self, context)
		for _, ancillary_data in ipairs(self.config.ancillaries) do
			for _, region in ipairs(ancillary_data.regions_needed or {}) do
				if not self.special_regions[region] then
					self.special_regions[region] = true
				end
			end
		end

		if not self.persistent.ancillaries_unlocked_for_faction then
			self.persistent.ancillaries_unlocked_for_faction = self.persistent.crowns_unlocked_for_faction or {}
			self.persistent.crowns_unlocked_for_faction = nil
		end

		if not self.persistent.permanently_unlocked_ancillaries then
			self.persistent.permanently_unlocked_ancillaries = {}

			if self.persistent.permanently_unlocked_crowns then
				self.persistent.permanently_unlocked_ancillaries = self.persistent.permanently_unlocked_crowns
				self.persistent.permanently_unlocked_crowns = nil
			else
				for faction_key, _ in pairs(self.persistent.ancillaries_unlocked_for_faction) do
					self.persistent.permanently_unlocked_ancillaries[faction_key] = {}
				end
			end
		end

		if not self.persistent.character_legitimacy_values then
			self.persistent.character_legitimacy_values = {}
		end

		if not self.persistent.cai_last_ancillary_to_wear_data then
			self.persistent.cai_last_ancillary_to_wear_data = self.persistent.cai_last_crown_to_wear_data or {}
			self.persistent.cai_last_crown_to_wear_data = nil
		end
	end,

	id = crown.id,

	notify_mechanics = crown.notify_mechanics,

	send_message_event_to_paths_including = crown.send_message_event_to_paths_including,

	send_message_event_to_paths_excluding = crown.send_message_event_to_paths_excluding,

	error_message = crown.error_message,
}
