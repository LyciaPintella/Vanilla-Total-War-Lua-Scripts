local file_info = debug.getinfo(1, "S")
local folder_file_splits = string.split(file_info.source, "\\")
out("Loading " .. folder_file_splits[#folder_file_splits])

legitimacy_system = {
	persistent = {
		min_sacred_lands_override = {
			--faction_key = 0,
		},

		num_sacred_lands = {
			--faction_key = 5
		},

		faction_researched_monument_technology = {
			--faction_key = true
		},

		-- Only used when the config option "enable_favoured_deity" is enabled
		favoured_deity_key = "",
	},

	script_ids = {
		legitimacy_sources_list = "pharaohs_crown_legitimacy_sources_list",
	},

	-- These shared states get a suffix applied to them of _<legitimacy_pooled_resource_key>
	-- e.g. legitimacy_to_start_war becomes:
	------- legitimacy_to_start_war_phar_legitimacy
	------- legitimacy_to_start_war_phar_hatti_legitimacy
	------- etc
	shared_states_suffixed = {
		legitimacy_enabled_for_faction = "legitimacy_enabled_for_faction",
	},

	--[[ These are applied in the config files for the different legitimacies
	powers_system = <powers object like egypt_powers>
	political_states_system = <political states object like egypt_political_states>
	sacred_lands = <sacred lands table like egypt_meso_lands>
	--]]

	events = {
		FactionTurnStart = function(self, context)
			local faction = context:faction()
			local faction_key = faction:name()

			-- We want to return when we've unlocked any other legitimacy. Before that we still calculate points
			if not self:can_use(faction_key) and legitimacy_choice:any_legitimacy_unlocked(faction_key) then
				return
			end

			cm:remove_script_state(faction, self.config.ui.shared_state_last_legitimacy_change_was_positive)

			self:process_decay(faction_key, true)	-- Perform the decay.
		end,

		PooledResourceTransactionEvent = function(self, context)
			local resource = context:resource()
			if resource:key() ~= self.config.resource_key then
				return
			end

			self:process_decay(context:faction():name(), false)	-- Only update the effect bundles, if such are used.
		end,

		RegionFactionChangeEvent = function(self, context)
			local region = context:region()
			local new_faction = region:owning_faction()
			local old_faction = context:previous_faction()
			local new_faction_key = new_faction:name()
			local old_faction_key = old_faction:name()

			if self.sacred_lands[region:name()] then
				self:add_legitimacy(new_faction_key, self.config.sacred_lands_factor, self.config.sources.sacred_region)
				self:add_legitimacy(old_faction_key, self.config.sacred_lands_factor, -self.config.sources.sacred_region)

				if self:num_sacred_regions(old_faction_key) < self:get_min_sacred_lands_for_faction(old_faction_key) then
					cm:set_script_state(old_faction, self.shared_states_suffixed.legitimacy_enabled_for_faction, false)
				end

				if self:num_sacred_regions(new_faction_key) >= self:get_min_sacred_lands_for_faction(new_faction_key) then
					cm:set_script_state(new_faction, self.shared_states_suffixed.legitimacy_enabled_for_faction, true)
				end
			end

			-- We want to return when we've unlocked any other legitimacy. Before that we still calculate points
			if not self:can_use(new_faction_key) and legitimacy_choice:any_legitimacy_unlocked(new_faction_key) then
				return
			end

			if region:num_buildings() < 1 then
				return
			end

			self:check_for_and_add_legitimacy_for_slots(region:slot_list(), old_faction_key, new_faction_key)
		end,

		RegionAboutToBeAbandoned = function(self, context)
			local region = context:region()
			local faction_key = region:owning_faction():name()

			-- We want to return when we've unlocked any other legitimacy. Before that we still calculate points
			if not self:can_use(faction_key) and legitimacy_choice:any_legitimacy_unlocked(faction_key) then
				return
			end

			self:check_for_and_add_legitimacy_for_slots(region:slot_list(), faction_key)
		end,

		BuildingCompleted = function(self, context)
			local faction_key = context:building():faction():name()

			-- We want to return when we've unlocked any other legitimacy. Before that we still calculate points
			if not self:can_use(faction_key) and legitimacy_choice:any_legitimacy_unlocked(faction_key) then
				return
			end

			self:check_for_and_add_legitimacy_for_buildings_wrapper(context, false)
		end,

		BuildingDemolished = function(self, context)
			local faction_key = context:building():faction():name()

			-- We want to return when we've unlocked any other legitimacy. Before that we still calculate points
			if not self:can_use(faction_key) and legitimacy_choice:any_legitimacy_unlocked(faction_key) then
				return
			end

			self:check_for_and_add_legitimacy_for_buildings_wrapper(context, true)
		end,

		CampaignBuildingDamaged = function(self, context)
			local garrison_residence = context:garrison_residence()
			if not garrison_residence:is_slot() then
				return
			end

			local slot = garrison_residence:slot_interface()
			local building = slot:building()
			local faction_key = building:faction():name()

			-- We want to return when we've unlocked any other legitimacy. Before that we still calculate points
			if not self:can_use(faction_key) and legitimacy_choice:any_legitimacy_unlocked(faction_key) then
				return
			end

			self:change_legitimacy_due_to_building_state_changed(faction_key, building, context:previous_state())
		end,

		CampaignBuildingRepaired = function(self, context)
			local garrison_residence = context:garrison_residence()
			if not garrison_residence:is_slot() then
				return
			end

			local slot = garrison_residence:slot_interface()
			local building = slot:building()
			local faction_key = building:faction():name()

			-- We want to return when we've unlocked any other legitimacy. Before that we still calculate points
			if not self:can_use(faction_key) and legitimacy_choice:any_legitimacy_unlocked(faction_key) then
				return
			end

			self:change_legitimacy_due_to_building_state_changed(faction_key, building, context:previous_state())
		end,

		ResearchCompleted = function(self, context)
			local faction_key = context:faction():name()

			-- We want to return when we've unlocked any other legitimacy. Before that we still calculate points
			if not self:can_use(faction_key) and legitimacy_choice:any_legitimacy_unlocked(faction_key) then
				return
			end

			local technology = context:technology()

			if string.find(technology, self.config.legitimacy_from_monument_technology_unlock_key) then
				local faction = context:faction()
				self:unlock_monument_legitimacy_technology(faction, technology)
			end
		end,

		BattleConflictFinished = function(self, context)
			local pending_battle = context:pending_battle()
			local battle_results = pending_battle:battle_results()
			local winner = battle_results:winning_faction_key()
			local loser = battle_results:losing_faction_key()

			if self.config.sources.battle_won and self:can_use(winner) then
				local attacker_strength = cm:pending_battle_cache_attacker_strength()
				local defender_strength = cm:pending_battle_cache_defender_strength()

				local attacker_is_winner = pending_battle:attacker_faction():name() == winner
				local winner_strength = (attacker_is_winner and attacker_strength) or defender_strength
				local loser_strength = (attacker_is_winner and defender_strength) or attacker_strength

				self.post_battle_legitimacy_won = self:calculate_legitimacy_from_battle(winner_strength, loser_strength)

				local multiplier = self:get_multiplier(winner, self.config.battle_factor)
				local winner_character = (attacker_is_winner and pending_battle:attacker()) or pending_battle:defender()
				local scripted_bonus_value_multiplier = self:get_character_battle_legitimacy_multiplier(winner_character)

				-- We want the multipliers to be additive with each other
				local final_multiplier = 1 + (multiplier - 1) + (scripted_bonus_value_multiplier - 1)
				self.post_battle_legitimacy_won = self.post_battle_legitimacy_won * final_multiplier

				cm:faction_add_post_battle_looted_resource(winner, self.config.resource_key, self.config.battle_factor, self.post_battle_legitimacy_won)

				self.post_battle_legitimacy_faction_update = winner
			end

			if self.config.sinks.battle_lost then
				self:add_legitimacy(loser,  self.config.battle_factor, -self.config.sinks.battle_lost)
			end
		end,

		BattleCompletedPostModelNotify = function(self, context)
			if self.post_battle_legitimacy_faction_update then
				local faction_key = self.post_battle_legitimacy_faction_update
				self.post_battle_legitimacy_faction_update = nil

				self.powers_system:update_powers_statuses(faction_key)

				if self.political_states_system:political_state() == "legitimacy_war" and self.political_states_system:is_ruler(faction_key) then
					self.political_states_system:update_best_pretender()
				end

				self.powers_system:check_for_new_power_event_message(faction_key, self.post_battle_legitimacy_won)
			end
		end,

		ContextTriggerEvent = function(self, context)

			local splits = context.string:split(":")
			if splits[1] == "tooltip_value_breakdown_set_legitimacy" then
				local resource_id = splits[2]
				if resource_id ~= self.config.resource_key then
					return
				end

				local tooltip_component = UIComponent(context.component)
				if not tooltip_component then
					return
				end

				local cco_id = self.config.ui.tooltip_value_breakdown_cco_id

				-- avoid refreshing the UI more than once
				if tooltip_component:GetProperty("script_id") == cco_id then
					return
				end

				tooltip_component:SetProperty("script_id", cco_id)

				local cco_table = self:create_tooltip_breakdown_cco(resource_id)
				common.set_context_value(cco_id, cco_table)
				-- this will refresh ContextPropagator with cco CcoCampaignResourcePool whose expression will end up using the new CcoScriptObject we just pushed
				common.send_ui_update_message("tooltip_value_breakdown_refresh")
			end
		end,

		CharacterCreated = function(self, context)
			local character = context:character()
			local faction_key = character:faction():name()

			-- If we haven't unlocked any legitimacy we want to calculate these points so that we
			-- don't have to recalculate them for every character if we do unlock this legitimacy
			if not self:can_use(faction_key) and legitimacy_choice:any_legitimacy_unlocked(faction_key) then
				return
			end

			if character:is_wounded() then
				return
			end

			-- Character rank is 0-based, but the table in the config is 1-based (like in the UI)
			local rank = character:rank() + 1

			local new_legitimacy = self:calculate_legitimacy_for_character_rank(rank)

			if new_legitimacy ~= 0 then
				local factor_key = self.config.heroes_factor
				self:add_legitimacy(faction_key, factor_key, new_legitimacy)
			end
		end,

		CharacterRankUp = function(self, context)
			local character = context:character()
			local faction_key = character:faction():name()

			-- If we haven't unlocked any legitimacy we want to calculate these points so that we
			-- don't have to recalculate them for every character if we do unlock this legitimacy
			if not self:can_use(faction_key) and legitimacy_choice:any_legitimacy_unlocked(faction_key) then
				return
			end

			if character:is_wounded() then
				return
			end

			-- Character rank is 0-based, but the table in the config is 1-based (like in the UI)
			local previous_rank = context:previous_rank() + 1
			local new_rank = context:new_rank() + 1

			local old_legitimacy = self:calculate_legitimacy_for_character_rank(previous_rank)
			local new_legitimacy = self:calculate_legitimacy_for_character_rank(new_rank)
			local difference = new_legitimacy - old_legitimacy

			if difference ~= 0 then
				local factor_key = self.config.heroes_factor
				self:add_legitimacy(faction_key, factor_key, difference)
			end
		end,

		FactionCharacterDiedOrWounded = function(self, context)
			local faction_key = context:faction():name()

			-- If we haven't unlocked any legitimacy we want to calculate these points so that we
			-- don't have to recalculate them for every character if we do unlock this legitimacy
			if not self:can_use(faction_key) and legitimacy_choice:any_legitimacy_unlocked(faction_key) then
				return
			end

			local family_member = context:family_member()
			-- Character rank is 0-based, but the table in the config is 1-based (like in the UI)
			local rank = family_member:rank() + 1

			local old_legitimacy = self:calculate_legitimacy_for_character_rank(rank)

			if old_legitimacy ~= 0 then
				local factor_key = self.config.heroes_factor
				self:add_legitimacy(faction_key, factor_key, -old_legitimacy)
			end
		end,

		ScriptEventWorshipGod = function(self, context)
			if not is_table(self.config.sources.local_deities) then
				return
			end

			local faction_key = context.stored_table.faction_key

			-- If we haven't unlocked any legitimacy we want to calculate these points so that we
			-- don't have to recalculate them for every character if we do unlock this legitimacy
			if not self:can_use(faction_key) and legitimacy_choice:any_legitimacy_unlocked(faction_key) then
				return
			end

			local old_god_key = context.stored_table.old_god_key
			--local new_god_key = context.stored_table.new_god_key

			if old_god_key then
				-- This is for when we replace a god in this worship slot. We remove the legitimacy gained from the old god
				local old_god_tier = context.stored_table.old_god_tier

				local old_legitimacy = self:calculate_legitimacy_for_local_deities_tier(faction_key, old_god_key, old_god_tier)
				if old_legitimacy ~= 0 then
					self:add_legitimacy(faction_key, self.config.local_deities_factor, -old_legitimacy)
				end
			end

			-- Legitimacy from new god is handled in the LocalDeitiesGodTotalFavourChanged event
			self:update_favoured_god(faction_key)
		end,

		LocalDeitiesGodTotalFavourChanged = function(self, context)
			if not is_table(self.config.sources.local_deities) then
				return
			end

			local faction_key = context.stored_table.faction_key

			-- If we haven't unlocked any legitimacy we want to calculate these points so that we
			-- don't have to recalculate them for every character if we do unlock this legitimacy
			if not self:can_use(faction_key) and legitimacy_choice:any_legitimacy_unlocked(faction_key) then
				return
			end

			local best_god, god_tier = self:get_highest_favour_relevant_god_for_faction(faction_key)

			if best_god == "" then
				return
			end

			local legitimacy_for_god = self:calculate_legitimacy_for_local_deities_tier(faction_key, best_god, god_tier)
			local current_deity_legitimacy = self:get_legitimacy_for_factor(faction_key, self.config.local_deities_factor)

			local difference = legitimacy_for_god - current_deity_legitimacy
			if difference ~= 0 then
				self:add_legitimacy(faction_key, self.config.local_deities_factor, difference)
			end

			self:update_favoured_god(faction_key)
		end,

		PanelOpenedCampaign = function(self, context)
			if context.string ~= crown.config.ui.crown_panel then
				return
			end

			local local_faction_key = cm:get_local_faction_name(true)

			if not legitimacy_choice:legitimacy_unlocked(self, local_faction_key) then
				return
			end

			self:create_legitimacy_sources_cco(local_faction_key)
		end,
	},

	event_add_condition = {
		CharacterCreated = function(self)
			return is_table(self.config.sources.heroes)
		end,

		CharacterRankUp = function(self)
			return is_table(self.config.sources.heroes)
		end,

		FactionCharacterDiedOrWounded = function(self)
			return is_table(self.config.sources.heroes)
		end,
	},

	post_init_generic = function(self)
		for _, decay_info in ipairs(self.config.legitimacy_decay) do
			if decay_info.shared_state_prefix then
				decay_info.shared_state_name = decay_info.shared_state_prefix .. "_" .. self.config.resource_key
			end
		end

		for k, v in pairs(self.shared_states_suffixed) do
			self.shared_states_suffixed[k] = v .. "_" .. self.config.resource_key
		end
	end,

	on_new_game_started = function(self, context)
		self:add_starting_legitimacy(self.sacred_lands)
		cm:set_script_state(self.config.ui.shared_state_sacred_region_legitimacy, self.config.sources.sacred_region)
		cm:set_script_state(self.config.ui.shared_state_sacred_regions_to_unlock_legitimacy, self.config.minimum_sacred_regions)
		self:setup_decay_shared_states()

		for faction_key, _ in dpairs(self.config.override_faction_minimum_sacred_regions) do
			local faction = cm:get_faction(faction_key)
			local shared_state = self.config.ui.shared_state_sacred_regions_to_unlock_legitimacy_for_faction
			cm:set_script_state(faction, shared_state, self:get_min_sacred_lands_for_faction(faction_key))
		end
	end,

	add_starting_legitimacy = function(self, sacred_regions_table)
		-- add starting faction legitimacy
		for _, v in ipairs(self.config.starting_amounts) do
			self:add_legitimacy(v.faction_key, self.config.starting_bonus_factor, v.starting_amount)
		end

		local sel_factor = self.config.sacred_lands_factor
		local building_factor = self.config.building_factor

		-- add legitimacy for owned sacred lands and buildings
		for i = 0, cm:model():world():faction_list():num_items() - 1 do
			local faction = cm:model():world():faction_list():item_at(i)
			local faction_key = faction:name()
			if not faction:is_dead() then
				if not faction:is_human() then
					self:add_legitimacy(faction_key, self.config.starting_bonus_factor, self.config.ai_bonus_starting_amount)
				end

				local faction_regions = faction:region_list()
				local num_of_sacred_regions = 0
				for j = 0, faction_regions:num_items()-1 do
					local region = faction_regions:item_at(j)

					if sacred_regions_table[region:name()] then
						self:add_legitimacy(faction_key, sel_factor, self.config.sources.sacred_region)
						num_of_sacred_regions = num_of_sacred_regions + 1
					end

					if building_factor then
						local total_legitimacy = self:get_slots_legitimacy(region:slot_list())
						for _, factor_value in ipairs(total_legitimacy) do
							if factor_value.value ~= 0 then
								self:add_legitimacy(faction_key, factor_value.factor, factor_value.value)
							end
						end
					end
				end
			end
		end
	end,

	on_first_tick = function(self, context)
		-- true: add listeners for my events table
		-- false: I'll handle my events by myself
		return true
	end,

	on_loading_game = function(self, context)
		if not self.persistent.faction_researched_monument_technology then
			self.persistent.faction_researched_monument_technology = {}
		end

		if not self.persistent.min_sacred_lands_override then
			self.persistent.min_sacred_lands_override = {}
		end
	end,

	-- Returns nil if there is no favoured god
	get_favoured_deity_key = function(self)
		return (self.persistent.favoured_deity_key == "" and nil) or self.persistent.favoured_deity_key
	end,

	override_min_sacred_regions_for_faction = function(self, faction_key, new_min)
		self.persistent.min_sacred_lands_override[faction_key] = new_min

		local shared_state = self.config.ui.shared_state_sacred_regions_to_unlock_legitimacy_for_faction
		cm:set_script_state(cm:get_faction(faction_key), shared_state, new_min)
	end,

	get_min_sacred_lands_for_faction = function(self, faction_key)
		return self.persistent.min_sacred_lands_override[faction_key]
			or self.config.override_faction_minimum_sacred_regions[faction_key]
			or self.config.minimum_sacred_regions
	end,

	num_sacred_regions = function(self, faction_key)
		return self.persistent.num_sacred_lands[faction_key] or 0
	end,

	can_use = function(self, faction_key)
		return legitimacy_choice:legitimacy_unlocked(self, faction_key)
	end,

	get_legitimacy = function(self, faction_key)
		if self:num_sacred_regions(faction_key) < self:get_min_sacred_lands_for_faction(faction_key) then
			return 0
		end

		if not legitimacy_choice:legitimacy_unlocked(self, faction_key) then
			return 0
		end

		local faction = cm:get_faction(faction_key)
		return (faction and faction:has_pooled_resource(self.config.resource_key) and faction:pooled_resource(self.config.resource_key):value()) or 0
	end,

	get_legitimacy_for_factor = function(self, faction_key, factor_key)
		if self:num_sacred_regions(faction_key) < self:get_min_sacred_lands_for_faction(faction_key) then
			return 0
		end

		if not legitimacy_choice:legitimacy_unlocked(self, faction_key) then
			return 0
		end

		local faction = cm:get_faction(faction_key)

		if not faction or faction:is_null_interface() or not faction:has_pooled_resource(self.config.resource_key) then
			return 0
		end

		local factors = faction:pooled_resource(self.config.resource_key):factors()
		local num_factors = factors:num_items()

		for i = 0, num_factors - 1 do
			local factor = factors:item_at(i)
			if factor:factor_key() == factor_key then
				return factor:value()
			end
		end

		return 0
	end,

	get_multiplier = function(self, faction_key, factor)
		local multiplier = 1

		local faction = cm:get_faction(faction_key)
		if not faction or faction:is_null_interface() then
			self:error_message("trying to get legitimacy multiplier for a non existing faction: " .. tostring(faction_key))
		elseif not faction:is_human() then
			local mod_difficulty_cai_multiplier = modular_difficulty_campaign.variables.cai_legitimacy_modifier_value or 0
			multiplier = multiplier * (self.config.ai_faction_legitimacy_multiplier + mod_difficulty_cai_multiplier)

			if is_number(self.config.ai_faction_multiplier_per_factor[factor]) then
				multiplier = multiplier * self.config.ai_faction_multiplier_per_factor[factor]
			end
		end

		local factor_multiplier = (self.config.faction_factor_multiplier[faction_key] and self.config.faction_factor_multiplier[faction_key][factor]) or 1

		multiplier = multiplier * factor_multiplier

		return multiplier
	end,

	get_character_battle_legitimacy_multiplier = function(self, character)
		if not character or character:is_null_interface() then
			return 1
		end

		local multiplier = cm:get_characters_bonus_value(character, self.config.battle_legitimacy_multiplier_scripted_bonus_value_id)
		-- 50 bonus value should be 50%, so dividing by 100 and adding 1 to turn into 1.5
		return 1 + (multiplier / 100)
	end,

	add_legitimacy_helper = function(self, faction_key, factor_key, amount)
		if faction_key == "rebels" then
			return false
		end

		if self.config.legitimacy_from_monument_technology_unlock_key
			and not self.persistent.faction_researched_monument_technology[faction_key]
			and factor_key == self.config.monument_ers_building_chain_key
		then
			return
		end

		local faction = cm:get_faction(faction_key)

		if not faction or faction:is_null_interface() then
			return false
		end

		local multiplier = self:get_multiplier(faction_key, factor_key)
		amount = amount * multiplier

		if faction and faction:has_pooled_resource(self.config.resource_key) then
			cm:faction_add_pooled_resource(faction_key, self.config.resource_key, factor_key, amount)

			if factor_key == self.config.sacred_lands_factor then
				if amount > 0 then
					self.persistent.num_sacred_lands[faction_key] = 1 + (self.persistent.num_sacred_lands[faction_key] or 0)
				elseif amount < 0 and (self.persistent.num_sacred_lands[faction_key] or 0) > 0 then
					self.persistent.num_sacred_lands[faction_key] = -1 + self.persistent.num_sacred_lands[faction_key]
				end
			end

			self.powers_system:update_powers_statuses(faction_key)

			cm:set_script_state(faction, self.config.ui.shared_state_last_legitimacy_change_was_positive, amount > 0)

			return true
		end

		return false
	end,

	-- model
	-- <legtimacy_object>:add_legitimacy("phar_main_ramesses", "phar_legitimacy_court_intrigue", 2)
	add_legitimacy = function(self, faction_key, factor_key, amount)
		if self:add_legitimacy_helper(faction_key, factor_key, amount) then
			if self.political_states_system:political_state() == "legitimacy_war" and self.political_states_system:is_ruler(faction_key) then
				self.political_states_system:update_best_pretender()
			end

			self.powers_system:check_for_new_power_event_message(faction_key, amount)
			self.powers_system:update_court_positions(faction_key)
		end
	end,

	get_building_legitimacy_and_factor = function(self, building, building_state)
		local factor = self:get_factor_from_building_chain_key(building:chain())

		local bonus_value = (factor == self.config.building_factor and self.config.legitimacy_from_buildings_scripted_bonus_value)
			or (factor == self.config.ers_factor and self.config.legitimacy_from_ers_scripted_bonus_value)
			or (self.config.legitimacy_from_monument_scripted_bonus_value)

		local building_legitimacy = 0

		local building_effects = nil
		if building_state then
			building_effects = building:effects_list_for_state(building_state)
		else
			building_effects = building:effects_list()
		end

		for i = 0, building_effects:num_items() - 1 do
			local curr_effect_bonus_values = building_effects:item_at(i):bonus_values()
			building_legitimacy = building_legitimacy + curr_effect_bonus_values:scripted_value(bonus_value, "value")
		end

		return building_legitimacy, factor
	end,

	get_slots_legitimacy = function(self, slot_list)
		local total_legitimacy = {
			{
				factor = self.config.building_factor,
				value = 0,
			},
			{
				factor = self.config.ers_factor,
				value = 0,
			},
			{
				factor = self.config.monument_factor,
				value = 0,
			}
		}

		local factor_to_legitimacy_data = {	}
		factor_to_legitimacy_data[self.config.building_factor] = total_legitimacy[1]
		factor_to_legitimacy_data[self.config.ers_factor]      = total_legitimacy[2]
		factor_to_legitimacy_data[self.config.monument_factor] = total_legitimacy[3]

		for j = 0, slot_list:num_items() - 1 do
			local slot = slot_list:item_at(j)
			if slot:has_building() then
				local building = slot:building()
				local legitimacy, factor = self:get_building_legitimacy_and_factor(building)
				factor_to_legitimacy_data[factor].value = legitimacy + factor_to_legitimacy_data[factor].value
			end
		end

		return total_legitimacy
	end,

	get_factor_from_building_chain_key = function(self, building_chain_key)
		return (string.find(building_chain_key, self.config.monument_ers_building_chain_key) and self.config.monument_factor)
			or ((string.find(building_chain_key, self.config.ers_building_chain_key) or string.find(building_chain_key, self.config.wonder_building_chain_key)) and self.config.ers_factor)
			or (self.config.building_factor)
	end,

	check_for_and_add_legitimacy_for_slots = function(self, slot_list, old_faction_key, new_faction_key)
		local total_legitimacy = self:get_slots_legitimacy(slot_list)
		for _, factor_value in ipairs(total_legitimacy) do
			if factor_value.value ~= 0 then
				-- abandoned regions don't have a new faction
				if new_faction_key then
					self:add_legitimacy(new_faction_key, factor_value.factor, factor_value.value)
				end
				self:add_legitimacy(old_faction_key, factor_value.factor, -factor_value.value)
			end
		end
	end,

	check_for_and_add_legitimacy_for_buildings_wrapper = function(self, context, demolished)
		local building = context:building()
		local faction_key = building:faction():name()

		local legitimacy, factor = self:get_building_legitimacy_and_factor(building)

		if legitimacy ~= 0 then
			self:add_legitimacy(faction_key, factor, (demolished and -legitimacy) or legitimacy)
		end
	end,

	unlock_monument_legitimacy_technology = function(self, faction, technology_key)
		self.persistent.faction_researched_monument_technology[faction:name()] = true
	end,

	setup_decay_effect_bundle = function(self, faction_key, decay_info, amount)
		local multiplier = self:get_multiplier(faction_key, decay_info.factor)
		if multiplier ~= 1 or amount ~= 1 then
			local bundle = cm:create_new_custom_effect_bundle(decay_info.effect_bundle)
			for i = 0, bundle:effects():num_items() - 1 do
				local effect = bundle:effects():item_at(i)
				bundle:set_effect_value(effect, effect:value() * multiplier * amount)
			end

			bundle:set_duration(1)

			cm:apply_custom_effect_bundle_to_faction(bundle, cm:get_faction(faction_key))
		else
			cm:apply_effect_bundle(decay_info.effect_bundle, faction_key, 1)
		end
	end,

	change_legitimacy_due_to_building_state_changed = function(self, faction_key, building, previous_state)
		-- remove legitimacy granted by effects of previous state
		local previous_legitimacy, previous_factor = self:get_building_legitimacy_and_factor(building, previous_state)
		if previous_legitimacy ~= 0 then
			self:add_legitimacy(faction_key, previous_factor, -previous_legitimacy)
		end

		-- add legitimacy for current state
		local current_legitimacy, current_factor = self:get_building_legitimacy_and_factor(building)
		if current_legitimacy ~= 0 then
			self:add_legitimacy(faction_key, current_factor, current_legitimacy)
		end
	end,

	-- TODO: This function has two purposes after calculating the decay per each factor - update the effect bundles, when a decay is using those, and applying the decay otherwise.
	-- 		 It is best to separate those two in separate functions, probably with a third common function for the decay calculation alone.
	-- 		 However, we don't have the time to do this now, so we'll leave it as is.
	process_decay = function(self, faction_key, perform_decay)
		local faction = cm:get_faction(faction_key)

		if not faction or not faction:has_pooled_resource(self.config.resource_key) then
			return
		end

		local pooled_resource = faction:pooled_resource(self.config.resource_key)
		local factors = pooled_resource:factors()

		cm:iterate(function(factor)
			for _, decay_info in ipairs(self.config.legitimacy_decay) do
				if (not decay_info.amount and not decay_info.portion)
					or not decay_info.factor
					or not decay_info.stop_at
				then
					self:error_message("Wrong configuration for legitimacy decay")
				elseif decay_info.factor == factor:factor_key() then
					local factor_value = factor:value()
					if factor_value ~= decay_info.stop_at then
						-- NOTE: The code and DB setup below probably won't work correctly if the stop_at value is not 0!
						local amount = math.abs(decay_info.amount or 1)
						if decay_info.portion then
							amount = math.ceil(math.abs(factor_value) * decay_info.portion)
						end
						local difference = factor_value - decay_info.stop_at
						amount = difference > 0 and math.min(amount, difference) or math.max(-amount, difference)

						if is_number(decay_info.ai_multiplier) and not faction:is_human() then
							amount = amount * decay_info.ai_multiplier
						end

						if decay_info.effect_bundle then
							-- NOTE: When using an effect bundle, the decay is handled by the effects system
							--		 So regardless of the value of the perform_decay parameter, we only update the bundle.
							self:setup_decay_effect_bundle(faction_key, decay_info, amount)
						elseif perform_decay then
							self:add_legitimacy(faction_key, decay_info.factor, amount)
						end
					end
					return
				end
			end
		end, factors)
	end,

	setup_decay_shared_states = function(self)
		for _, decay_info in ipairs(self.config.legitimacy_decay) do
			-- FIXME: Those shared states are not reworked to use decay as portion of current value,
			--		  as this is a bit more complicated and those are not used at the moment after reworking the legitimacy sources.
			if not decay_info.amount
				or not decay_info.factor
				or not decay_info.stop_at
			then
				self:error_message("Wrong configuration for legitimacy decay")
			else
				if decay_info.shared_state_name then
					cm:set_script_state(decay_info.shared_state_name, -decay_info.amount)
				end
			end
		end
	end,

	calculate_legitimacy_from_battle = function(self, winner_strength, loser_strength)
		local strength_base = self.config.sources.battle_won.defeated_army_strength_base
		local legitimacy_per_strength = self.config.sources.battle_won.legitimacy_per_strength_base
		local odds_multiplier

		if winner_strength < loser_strength then
			odds_multiplier = 0.7 + 0.3 * ((loser_strength / winner_strength) ^ 1.5)
		else
			odds_multiplier = 1.08 - 0.03 * ((winner_strength / loser_strength) ^ 1.6)
		end

		local legitimacy_won = math.sqrt(loser_strength / strength_base) * legitimacy_per_strength
		local max_odds = self.config.sources.battle_won.maximum_odds_multiplier
		legitimacy_won = legitimacy_won * math.min(max_odds, odds_multiplier)

		local min_legitimacy = self.config.sources.battle_won.minimum_legitimacy_from_battle
		local max_legitimacy = self.config.sources.battle_won.maximum_legitimacy_from_battle

		-- clamp between min_legitimacy and max_legitimacy
		return math.min(math.max(min_legitimacy, math.round(legitimacy_won)), max_legitimacy)
	end,

	create_tooltip_breakdown_cco = function(self, resource_id)
		local cco = {
			IsOverride = true,
			PositiveFactors = {}
		}

		local sum_factors = function(factors, factors_keys)
			local sum = 0
			for i = 0, factors:num_items() - 1 do
				local factor = factors:item_at(i)
				if table_contains(factors_keys, factor:factor_key()) then
					sum = sum + factor:value()
				end
			end

			return sum
		end

		local local_faction = cm:get_local_faction(true)
		local pooled_resource = local_faction:pooled_resource(resource_id)
		local factors = pooled_resource:factors()
		for _, source in ipairs(self.config.ui.sources) do
			table.insert(cco.PositiveFactors, { Name = common.get_localised_string(source.name_key), Value = sum_factors(factors, source.factors_keys), FormatType = "%d" })
		end

		return cco
	end,

	calculate_legitimacy_for_character_rank = function(self, character_rank)
		if not self.config.sources.heroes then
			return 0
		end

		local legitimacy = 0
		local highest_rank_so_far = 0

		for rank, legitimacy_for_rank in pairs(self.config.sources.heroes.hero_rank_to_legitimacy) do
			if character_rank >= rank and rank > highest_rank_so_far then
				legitimacy = legitimacy_for_rank
				highest_rank_so_far = rank
			end
		end

		return legitimacy
	end,

	calculate_legitimacy_for_local_deities_tier = function(self, faction_key, god_key, god_tier, override_favoured_god)
		local target_culture = deities.config.culture_for_legitimacy[self.config.id]
		local god_culture = deities.get_god(god_key).culture
		if god_culture ~= target_culture then
			return 0
		end

		local highest_tier = 0
		local legitimacy_to_gain = 0
		local bonus_value_extra_legitimacy = cm:get_factions_bonus_value(faction_key, self.config.sources.local_deities.extra_legitimacy_bonus_value)
		for tier, legitimacy in pairs(self.config.sources.local_deities.tier_to_legitimacy) do
			if god_tier >= tier and tier > highest_tier then
				highest_tier = tier
				legitimacy_to_gain = legitimacy
			end
		end

		local favoured_god_key = override_favoured_god or self.persistent.favoured_deity_key
		if self.config.sources.local_deities.enable_favoured_deity and god_key == favoured_god_key then
			legitimacy_to_gain = legitimacy_to_gain * (self.config.sources.local_deities.favoured_deity_legitimacy_multiplier or 1)
		end

		-- Bonus is added at the very end, therefore not affected by Patron Deity multiplier
		return legitimacy_to_gain + bonus_value_extra_legitimacy * highest_tier
	end,

	change_favoured_god = function(self, old_god_key, new_god_key)
		local factions = legitimacy_choice:get_factions_with_legitimacy_object(self)

		for faction_key, _ in dpairs(factions) do
			-- Old god will lose the multiplier and the new one will gain it, so
			-- we're recalculating the legitimacies for both gods before and after the change

			local calculate_legitimacy_difference_for_god_after_change = function(god_key)
				local god_slot = deities.get_god_slot(faction_key, god_key)
				if not god_slot then
					return 0
				end

				local god_tier = deities.get_tier(faction_key, god_key)
				local old_legitimacy = self:calculate_legitimacy_for_local_deities_tier(faction_key, god_key, god_tier, old_god_key)
				local new_legitimacy = self:calculate_legitimacy_for_local_deities_tier(faction_key, god_key, god_tier, new_god_key)
				return new_legitimacy - old_legitimacy
			end

			local legitimacy_to_add = calculate_legitimacy_difference_for_god_after_change(old_god_key)
									+ calculate_legitimacy_difference_for_god_after_change(new_god_key)

			if legitimacy_to_add ~= 0 then
				self:add_legitimacy(faction_key, self.config.local_deities_factor, legitimacy_to_add)
			end
		end

		self.persistent.favoured_deity_key = new_god_key
	end,

	get_highest_favour_relevant_god_for_faction = function(self, faction_key)
		local god_slots = deities.get_god_slots(faction_key)

		local highest_tier = 0
		local highest_favour = 0
		local highest_god = ""

		--[[
		Best god is chosen like this:
			1. choose highest tier
			2. if equal tiers check if either is a favoured god in this legitimacy path
			3. if equal tiers and neither is favoured then check highest favour for faction
		--]]

		local favoured_god = self.persistent.favoured_deity_key

		for _, god_slot in ipairs(god_slots) do
			if not is_nil(god_slot.god_key)
				and god_slot.favour.total_favour >= 0
				and (#self.config.sources.local_deities.relevant_favoured_deities == 0
					or table_find(self.config.sources.local_deities.relevant_favoured_deities, god_slot.god_key))
			then
				local tier = deities.get_tier(faction_key, god_slot.god_key)
				if tier > highest_tier
					or (tier == highest_tier and god_slot.god_key == favoured_god)
					or (tier == highest_tier and highest_god ~= favoured_god and god_slot.favour.total_favour > highest_favour)
				then
					highest_god = god_slot.god_key
					highest_favour = god_slot.favour.total_favour
					highest_tier = tier
				end
			end
		end

		return highest_god, highest_tier
	end,

	update_favoured_god = function(self, faction_key)
		if self.config.sources.local_deities.enable_favoured_deity
			and self.political_states_system:is_sitting_ruler(faction_key)
		then
			local new_favoured_god = self:get_highest_favour_relevant_god_for_faction(faction_key)
			if self.persistent.favoured_deity_key ~= new_favoured_god then
				self:change_favoured_god(self.persistent.favoured_deity_key, new_favoured_god)
				local event_data =
				{
					new_god_key = new_favoured_god,
					legitimacy_path_obj = self
				}
				core:trigger_event("ScriptEventFavouredGodUpdated", event_data)
			end
		end
	end,

	get_legitimacy_sources_for_battle = function(self, faction_key, source_table)
		return {}
	end,

	get_legitimacy_sources_for_sacred_lands = function(self, faction_key, source_table)
		local faction = cm:get_faction(faction_key)

		local sacred_lands_list = {
			--[[
			{
				amount = 5,
				display_text = "",
			}
			--]]
		}

		cm:iterate(function(region)
			local region_key = region:name()

			if self.sacred_lands[region_key] then
				local display_text = common.get_localised_string(source_table.item_display_text)
				display_text = string.gsub(display_text, "%%1%%", region:localised_display_name())
				display_text = string.gsub(display_text, "%%2%%", region:province():localised_display_name())

				table.insert(sacred_lands_list, {
					amount = self.config.sources.sacred_region,
					display_text = display_text,
				})
			end
		end, faction:region_list())

		return sacred_lands_list
	end,

	get_legitimacy_sources_for_building_by_bonus_value = function(self, faction_key, factor_key, display_text_function)
		local faction = cm:get_faction(faction_key)
		local buildings_list = {
			--[[
			{
				amount = 5,
				display_text = "",
			}
			--]]
		}

		cm:recursive_iterate(
			function(slot)
				if not slot:is_infrastructure_slot() or not slot:has_building() then
					return
				end

				local building = slot:building()
				local legitimacy, factor = self:get_building_legitimacy_and_factor(building)
				if factor ~= factor_key or legitimacy <= 0 then
					return
				end

				local display_text = display_text_function(slot)

				table.insert(buildings_list, {
					amount = legitimacy,
					display_text = display_text,
				})
			end,
			faction,
			{ "region_list", "slot_list" }
		)

		return buildings_list
	end,

	get_legitimacy_sources_for_monuments = function(self, faction_key, source_table)
		return self:get_legitimacy_sources_for_building_by_bonus_value(
			faction_key,
			self.config.monument_factor,
			function(slot)
				local display_text = common.get_localised_string(source_table.item_display_text)
				local building = slot:building()
				display_text = string.gsub(display_text, "%%1%%", building:localised_display_name())
				display_text = string.gsub(display_text, "%%2%%", building:region():province():localised_display_name())
				return display_text
			end
		)
	end,

	get_legitimacy_sources_for_buildings = function(self, faction_key, source_table)
		return self:get_legitimacy_sources_for_building_by_bonus_value(
			faction_key,
			self.config.building_factor,
			function(slot)
				local display_text = "%1%, %2%"
				local building = slot:building()
				display_text = string.gsub(display_text, "%%1%%", building:localised_display_name())
				display_text = string.gsub(display_text, "%%2%%", building:region():localised_display_name())
				return display_text
			end
		)
	end,

	get_legitimacy_sources_for_ERSes = function(self, faction_key, source_table)
		return self:get_legitimacy_sources_for_building_by_bonus_value(
			faction_key,
			self.config.ers_factor,
			function(slot)
				local display_text = "%1%, %2%"
				local building = slot:building()
				display_text = string.gsub(display_text, "%%1%%", building:localised_display_name())
				display_text = string.gsub(display_text, "%%2%%", building:region():localised_display_name())
				return display_text
			end
		)
	end,

	get_legitimacy_sources_for_starting_legitimacy = function(self, faction_key, source_table)
		local starting_amount_table = table_find(
			self.config.starting_amounts,
			function(t)
				return t.faction_key == faction_key
			end
		)

		local starting_amount = (starting_amount_table and starting_amount_table.starting_amount) or 0
		return {
			{
				amount = starting_amount,
				display_text = source_table.item_display_text,
			}
		}
	end,

	get_legitimacy_sources_for_ancillaries = function(self, faction_key, source_table)
		local ancillaries_list = {
			--[[
			{
				amount = 5,
				display_text = "",
			}
			--]]
		}

		local faction = cm:get_faction(faction_key)
		cm:recursive_iterate(function(ancillary)
			cm:iterate(function(effect)
				local bonus_values = effect:bonus_values()
				local bonus_value_key = self.political_states_system.special_ancillary_system.config.ancillary_legitimacy_scripted_bonus_value_id
				local legitimacy_bonus = bonus_values:scripted_value(bonus_value_key, "value")
				if legitimacy_bonus > 0 then
					table.insert(ancillaries_list, {
						amount = legitimacy_bonus,
						display_text = ancillary:onscreen_name(),
					})
				end
			end, ancillary:effects_list())
		end, faction, { "character_list", "ancillaries" })
		return ancillaries_list
	end,

	get_legitimacy_sources_for_court_positions = function(self, faction_key, source_table)
		local return_table = {}

		local court_object_for_faction = court.util_functions.get_faction_court_for_faction(faction_key)
		local faction_court_data = court.util_functions.get_faction_persistent_data(faction_key)
		local faction_positions = faction_court_data.owned_positions

		for _, position in ipairs(faction_positions or {}) do
			local position_object = court.util_functions.get_court_position(court_object_for_faction, position)
			local position_legitimacy = court.position_functions.get_position_legitimacy_gain(position_object, faction_key)

			if position_legitimacy > 0 then
				local position_localized_string, _ = court.position_functions.get_localized_position_name(position_object, court_object_for_faction)
				table.insert(return_table, {
					amount = position_legitimacy,
					display_text = position_localized_string,
				})
			end
		end

		return return_table
	end,

	get_legitimacy_sources_for_court_intrigues = function(self, faction_key, source_table)
		local return_table = {}
		local faction = cm:get_faction(faction_key)
		local resource = faction:pooled_resource(self.config.resource_key)
		local factors = resource:factors()
		cm:iterate(function(factor)
			if factor:factor_key() == self.config.court_plots_factor and factor:value() > 0 then
				return_table = {
					{
						amount = factor:value(),
						display_text = source_table.item_display_text,
					}
				}
				cm:iterate_break()
			end
		end, factors)
		return return_table
	end,

	get_legitimacy_sources_for_allies = function(self, faction_key, source_table)
		local faction = cm:get_faction(faction_key)
		local amount_per_alliance = cm:get_factions_bonus_value(faction, scripted_bonus_values.bonus_value_keys.legitimacy_from_allies)

		if amount_per_alliance <= 0 then
			return {}
		end

		local alliances_table = {
			--[[
			{
				amount = 5,
				display_text = "",
			}
			--]]
		}

		local base_display_text = source_table.item_display_text

		local add_alliance_to_table = function(ally_faction)
			table.insert(alliances_table, {
				amount = amount_per_alliance,
				display_text = base_display_text .. " " .. ally_faction:localised_display_name(),
			})
		end

		cm:iterate(add_alliance_to_table, faction:factions_defensive_alliance_with())
		cm:iterate(add_alliance_to_table, faction:factions_military_alliance_with())

		return alliances_table
	end,

	get_legitimacy_sources_for_gods = function(self, faction_key, source_table)
		local god_key = self:get_highest_favour_relevant_god_for_faction(faction_key)

		if god_key == "" then
			return {}
		end

		local god_tier = deities.get_tier(faction_key, god_key)
		local legitimacy_from_god = self:calculate_legitimacy_for_local_deities_tier(faction_key, god_key, god_tier)
		local god_table = deities.get_god(god_key)
		local god_name = common.get_localised_string("ui_text_replacements_localised_text_" .. god_table.localised_name)

		local display_text

		if god_key == self.persistent.favoured_deity_key then
			display_text = common.get_localised_string(source_table.item_display_text_favoured_god)
			display_text = display_text:gsub("%%1%%", god_name)
		else
			display_text = god_name
		end

		return {
			{
				amount = legitimacy_from_god,
				display_text = display_text,
			}
		}
	end,

	get_legitimacy_sources_for_heroes = function(self, faction_key, source_table)
		local return_table = {}
		local faction = cm:get_faction(faction_key)

		local characters = faction:character_list()
		for i = 0, characters:num_items() - 1 do
			local character = characters:item_at(i)
			local rank = character:rank()
			local legitimacy_contributed = self:calculate_legitimacy_for_character_rank(rank)

			if legitimacy_contributed > 0 then
				table.insert(return_table, {
					amount = legitimacy_contributed,
					display_text = character:onscreen_name(),
				})
			end
		end

		return return_table
	end,

	add_sources_for_factor_in_ui_table = function(self, faction_key, ui_table, factor_key, source_table)
		local factor_key_to_relevant_function = {
			[self.config.battle_factor]         = self.get_legitimacy_sources_for_battle,
			[self.config.sacred_lands_factor]   = self.get_legitimacy_sources_for_sacred_lands,
			[self.config.monument_factor]       = self.get_legitimacy_sources_for_monuments,
			[self.config.building_factor]       = self.get_legitimacy_sources_for_buildings,
			[self.config.ers_factor]            = self.get_legitimacy_sources_for_ERSes,
			[self.config.starting_bonus_factor] = self.get_legitimacy_sources_for_starting_legitimacy,
			[self.config.ancillaries_factor]    = self.get_legitimacy_sources_for_ancillaries,
			[self.config.court_position_factor] = self.get_legitimacy_sources_for_court_positions,
			[self.config.court_plots_factor] = self.get_legitimacy_sources_for_court_intrigues,
			[self.config.allies_factor]         = self.get_legitimacy_sources_for_allies,
			[self.config.local_deities_factor]  = self.get_legitimacy_sources_for_gods,
		}

		-- not all legitimacies use this factor
		if self.config.heroes_factor then
			factor_key_to_relevant_function[self.config.heroes_factor] = self.get_legitimacy_sources_for_heroes
		end

		local relevant_function = factor_key_to_relevant_function[factor_key]
		if not relevant_function then
			script_error("Tried to add sources for a factor that doesn't have a function associated with it: " .. tostring(factor_key))
			return
		end

		local factor_sources = relevant_function(self, faction_key, source_table)

		for _, source in ipairs(factor_sources) do
			table.insert(ui_table.sources, source)
		end
	end,

	create_legitimacy_sources_cco = function(self, faction_key)
		local faction = cm:get_faction(faction_key)
		if not faction
			or faction:is_null_interface()
			or faction:is_dead()
			or faction:is_rebel()
			or not faction:has_pooled_resource(self.config.resource_key)
		then
			return
		end

		local ui_sources_tables = {
			--[[
			{
				name_key = "",
				total = 10,
				decay = 5,
				active = false,
				sources = {
					{
						amount = 5,
						display_text = "",
					},
				},
			},
			--]]
		}

		local legitimacy_resource = faction:pooled_resource(self.config.resource_key)
		local factors = legitimacy_resource:factors()
		local sources = self.config.ui.sources

		for i = 0, factors:num_items() - 1 do
			local factor = factors:item_at(i)
			local factor_key = factor:factor_key()
			local source = table_find(sources, function(source)
				return table_contains(source.factors_keys, factor_key)
			end)

			if source then
				local matching_ui_table = source and table_find(ui_sources_tables, function(ui_table)
					return ui_table.name_key == source.name_key
				end)

				if not matching_ui_table then
					matching_ui_table = {
						name_key = source.name_key,
						total = 0,
						active = false,
						decay = 0,
						sources = { },
						tooltip_key = source.tooltip_key or "",
					}

					local decay_config = table_find(self.config.legitimacy_decay, function(decay_table) return decay_table.factor == factor_key end)
					if decay_config and factor:value() > decay_config.stop_at then
						matching_ui_table.decay = decay_config.amount
						if decay_config.portion then
							matching_ui_table.decay = math.ceil(decay_config.portion * factor:value())
						end
					end

					table.insert(ui_sources_tables, matching_ui_table)
				end

				matching_ui_table.total = matching_ui_table.total + factor:value()

				if matching_ui_table.total > 0 then
					matching_ui_table.active = true
				end

				self:add_sources_for_factor_in_ui_table(faction_key, matching_ui_table, factor_key, source)
			end
		end

		ui_sources_tables = table_stable_sort(ui_sources_tables, function(a, b)
			return a.total > b.total
		end)

		local script_id = self.script_ids.legitimacy_sources_list
		common.set_context_value(script_id, ui_sources_tables)
	end,

	id = crown.id,

	notify_mechanics = crown.notify_mechanics,

	send_message_event_to_paths_including = crown.send_message_event_to_paths_including,

	send_message_event_to_paths_excluding = crown.send_message_event_to_paths_excluding,

	error_message = crown.error_message,
}
