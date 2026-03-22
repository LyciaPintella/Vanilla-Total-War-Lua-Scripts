local file_info = debug.getinfo(1, "S")
local folder_file_splits = string.split(file_info.source, "\\")
out("Loading " .. folder_file_splits[#folder_file_splits])

political_states_system = {
	persistent = {
		political_state = "", -- either "stable" or "legitimacy_war"
		legitimacy_war_turns_left = 0,
		start_turn_of_legitimacy_war = -1,
		emergency_tiebreaker_turns = 0,
		min_turn_for_next_war = 0,

		-- If only one pretender is left and the political state is stable then the first faction is the true pharaoh
		pretenders = {
			--[[
			faction_key1,
			faction_key2,
			--]]
		},

		player_factions_informed_to_start_war = {},
		player_factions_informed_to_join_war = {},

		current_ruling_faction_key = "",

		times_legitimacy_war_start_movie_has_played = 0,

		played_ruler_death_movie = false,

		legitimacy_to_claim_crown = {
			stable = 0,
			legitimacy_war = 0,
		},

		max_pretenders = 0,
	},

	-- These shared states get a suffix applied to them of _<legitimacy_pooled_resource_key>
	-- e.g. legitimacy_to_start_war becomes:
	------- legitimacy_to_start_war_phar_legitimacy
	------- legitimacy_to_start_war_phar_hatti_legitimacy
	------- etc
	shared_states_suffixed = {
		legitimacy_to_start_war = "legitimacy_to_start_war",
		legitimacy_to_join_war = "legitimacy_to_join_war",
		sitting_ruler = "sitting_ruler_faction",
		ruler_or_best_pretender = "ruler_or_leading_pretender_faction",
		ruler_runner_up = "ruler_runner_up_faction",
		legitimacy_war = "in_legitimacy_war",
		legitimacy_war_turns = "legitimacy_war_turns_left",
		legitimacy_war_emergency_turns = "legitimacy_war_emergency_turns_left",
		minimum_turn_for_next_war = "minimum_turn_for_next_legitimacy_war",
		max_pretenders = "legitimacy_war_max_pretenders",
		num_pretenders = "legitimacy_war_num_pretenders",
	},

	-- These shared states do not get a suffix applied to them
	shared_states = {
		is_sitting_ruler = "is_sitting_ruler",
		is_ruler_or_pretender = "is_ruler_or_pretender",
		court_leader_name_localized = "court_leader_position_held_localized",
	},

	faction_becomes_ruler_event = "phar_faction_announces_for_ruler",

	events = {
		UITriggerScriptEvent = function(self, context)
			if context:trigger() == self.faction_becomes_ruler_event then
				local faction_cqi = context:faction_cqi()
				local faction = cm:model():faction_for_command_queue_index(faction_cqi)
				local faction_key = faction:name()

				if not legitimacy_choice:legitimacy_unlocked(self.legitimacy_system, faction_key) then
					return
				end

				if self.persistent.min_turn_for_next_war > cm:turn_number() then
					script_error("Trying to start a legitimacy war from UI before the cooldown is over. Game will be fine but there is some kind of bug in the UI.")
					return
				end

				self:announce_faction_for_pretender(faction_key)

				-- Enable the egyptian pharaoh crowns mechanic
				self.special_ancillary_system:unlock_crowns(faction_key)

				-- Close the panel when a human enters a legitimacy war
				-- In multiplayer this will close both people's panel, is this fine?
				-- An event message will appear for both people, so it won't feel like the panel randomly closed itself
				-- for the second player.
				local ui_root = core:get_ui_root()
				local phar_panel = ui_root:SequentialFind("pharaohs_crown")
				if phar_panel then
					phar_panel:InterfaceFunction("close_panel")
				end
			end
		end,

		RoundStart = function(self, context)
			if self:political_state() == "legitimacy_war" then
				local turns_left = self.persistent.legitimacy_war_turns_left

				if self:get_num_pretenders() == 1 and turns_left > self.config.trivial_legitimacy_war_turns then
					turns_left = math.min(turns_left, self.config.trivial_legitimacy_war_turns)
				else
					turns_left = turns_left - 1
				end

				self.persistent.legitimacy_war_turns_left = turns_left
				cm:set_script_state(self.shared_states_suffixed.legitimacy_war_turns, turns_left)

				if self.persistent.legitimacy_war_turns_left <= 0 then
					-- Process emergency turns if we have any. If we have 1 left, we know we're done
					if self.persistent.emergency_tiebreaker_turns > 1 then
						-- Decrement the emergency turns and return nothing, wait to run out of emergency turns before evaluating
						self.persistent.emergency_tiebreaker_turns = self.persistent.emergency_tiebreaker_turns - 1
						cm:set_script_state(self.shared_states_suffixed.legitimacy_war_emergency_turns, self.persistent.emergency_tiebreaker_turns)
					else
						local new_pharaoh_key = self:get_best_pretender()
						if new_pharaoh_key then
							self:update_court_leader_shared_states(new_pharaoh_key)
	
							-- If get_best_pretender() does not return anything it means we have a draw and are waiting for
							-- a tiebreaker. If the draw continues for self.config.emergency_tiebreaker_turns then
							-- we randomly choose a new pharaoh from the ones with the highest legitimacy.
							self:announce_faction_for_ruler(new_pharaoh_key, true)
						else
							-- We're in a tiebreaker situation. If we're out of emergency turns and still have a draw then reset emergency turns
							self.persistent.emergency_tiebreaker_turns = self.config.emergency_tiebreaker_turns
							cm:set_script_state(self.shared_states_suffixed.legitimacy_war_emergency_turns, self.persistent.emergency_tiebreaker_turns)
						end
					end
				end
			end

			-- NOTE: The code below is not in use for the Combined map (turned off via the config, by design request).
			--		 It is NOT properly working in the context of the Combined map and its mortal characters. If it is to be reenabled, it needs reworking.
			--		 First, the starting ruler character might have died before this turn comes, so the code would kill the current faction leader instead.
			--		 Second, if the starting ruler has been killed, now there is logic for who inherits the throne (dynasty heir), so forcing a Legitimacy war is not correct.
			--		 Third, forcing that Legitimacy war might fail anyway, if the dynasty heir is from another faction (as is the case with Merneptah and Seti).
			-- Scripted starting ruler death.
			if context:model():turn_number() == (self.config.starting_faction_leader_death_turn or -1) then
				local starting_ruler_faction = cm:get_faction(self.config.starting_ruler_faction_key)
				if starting_ruler_faction and not starting_ruler_faction:is_dead() then
					-- Crowns use the ancillary system and we give them to the faction leader. During
					-- this scripted event this faction changes its faction leader (something that virtually never
					-- happens), so we need to remove the old crowns from the old faction leader and add re-add them
					-- to the new faction leader. A shortcut for this is to simply lock the crown system for the starting ruler and
					-- unlock it again after his death.
					self.special_ancillary_system:lock_ancillaries(self.config.starting_ruler_faction_key)

					local character = starting_ruler_faction:faction_leader()
					local char_lookup = cm:char_lookup_str(character)
					cm:set_character_immortality(char_lookup, false)
					cm:set_ignore_immortality_by_trait(char_lookup, true)
					cm:kill_character_and_commanded_unit_with_dt(char_lookup, false, "ASSASSINATED")

					if self:political_state() == "stable" and self:is_sitting_ruler(self.config.starting_ruler_faction_key) then
						self.persistent.min_turn_for_next_war = 1
						self:announce_faction_for_pretender(self.config.starting_ruler_faction_key)
					end

					self.special_ancillary_system:unlock_ancillaries(self.config.starting_ruler_faction_key)
					self.config.cai_can_start_wars = true
				end
			end

			self:check_if_players_can_initiate_legitimacy_war()
		end,

		FactionDestroyed = function(self, context)
			local faction_key = context:faction():name()

			self:remove_pretender(faction_key)

			if faction_key == self.config.starting_ruler_faction_key
				and cm:model():turn_number() < (self.config.starting_faction_leader_death_turn or -1)
				and self:political_state() == "stable"
				and self:is_sitting_ruler(self.config.starting_ruler_faction_key)
			then
				self:force_start_legitimacy_war()

				self.config.cai_can_start_wars = true
			end
		end,

		FactionTurnStart = function(self, context)
			local faction = context:faction()
			local faction_key = faction:name()
			if self:political_state() ~= "legitimacy_war" then
				if self:is_ruler(faction_key) or legitimacy_choice:legitimacy_unlocked(self.legitimacy_system, faction_key) then
					self:update_legitimacy_war_thresholds()
				end

				-- Update this shared state only for human factions since it's only used in UI
				if faction:is_human() then
					self:setup_stable_state_runner_up()
				end

				local is_tutorial = cm:get_saved_value("bool_is_tutorial_mode") or core:svr_load_bool("sbool_player_selected_first_turn_intro_on_frontend")
				local is_ai_faction = not faction:is_human()
				local cai_can_start_war = self.config.cai_can_start_wars_before_scripted_war or cm:turn_number() >= (self.config.starting_faction_leader_death_turn or -1)
				if is_ai_faction and cai_can_start_war and not is_tutorial then
					if self:check_if_cai_can_participate_legitimacy_war(faction, true) then
						self:announce_faction_for_pretender(faction_key)
						self.special_ancillary_system:unlock_crowns(faction_key)
					end
				end
			elseif not faction:is_human() and self:political_state() == "legitimacy_war" then
				if self:check_if_cai_can_participate_legitimacy_war(faction) then
					self:announce_faction_for_pretender(faction_key)
					self.special_ancillary_system:unlock_crowns(faction_key)
				end
			end
		end,

		FactionCharacterDiedOrWounded = function(self, context)
			local family_member = context:family_member()
			-- If starting_ruler_family_member_cqi is nil, the following check will fail.
			if self.persistent.starting_ruler_family_member_cqi == family_member:command_queue_index() and not family_member:is_alive() then
				self:play_starting_ruler_death_movie()	-- This includes check that it wasn't played before.
			end
		end,

		DynastyRulerChanged = function(self, context)
			local dynasty_line = context:dynasty_line_key()

			if self.legitimacy_system.config.dynasty_line_key ~= dynasty_line then
				return
			end

			local new_ruler = context:new_ruler()

			if new_ruler and not new_ruler:is_null_interface() then
				local character = new_ruler:character()
				local faction_key = character:faction():name()
				local old_ruler = self.persistent.current_ruling_faction_key

				if faction_key == old_ruler then
					return
				end

				if self:political_state() == "legitimacy_war" then
					if old_ruler then
						self:remove_pretender(old_ruler)
					end

					self:announce_faction_for_pretender(faction_key, true)
					self.special_ancillary_system:unlock_crowns(faction_key)
					self:change_sitting_ruler(faction_key)

					for _, pretender_key in ipairs(self.persistent.pretenders) do
						if pretender_key ~= faction_key then
							self:force_war_with_pretenders(pretender_key)
						end
					end
				else
					self:announce_faction_for_ruler(faction_key, false)
				end

				local event_data =
				{
					political_states = self,
					new_ruler_faction_key = faction_key,
					old_ruler_faction_key = old_ruler,
				}
				core:trigger_event("ScriptEventRulerChanged", event_data)
			else
				self:force_start_legitimacy_war()
			end
		end,

		DynastyAppointedHeirChanged = function(self, context)
			local dynasty_line = context:dynasty_line_key()

			if self.legitimacy_system.config.dynasty_line_key ~= dynasty_line then
				return
			end

			local old_heir = context:old_heir()

			if is_familymember(old_heir) and self:political_state() == "legitimacy_war" then
				local faction_key = old_heir:faction():name()
				local is_pretender = table_contains(self.persistent.pretenders, faction_key)
				local sitting_ruler = self.persistent.current_ruling_faction_key

				-- Heir faction is immune to war with the ruling faction. Peace declaration with the new heir faction is handled in C++
				if is_pretender and sitting_ruler and sitting_ruler ~= "" and faction_key ~= sitting_ruler then
					cm:force_declare_war(
						faction_key,
						sitting_ruler,
						true,
						true,
						true
					)

					cm:force_diplomacy(
							"faction:"..faction_key,
							"faction:"..sitting_ruler,
							"peace",
							false,
							false,
							true
					)
				end
			end
		end,
	},

	event_add_condition = {
		FactionTurnStart = function(self)
			return self.config.use_threshold_legitimacy
		end,
	},

	post_init_generic = function(self)
		for k, v in pairs(self.shared_states_suffixed) do
			self.shared_states_suffixed[k] = v .. "_" .. self.legitimacy_system.config.resource_key
		end
	end,

	check_if_players_can_initiate_legitimacy_war = function(self)
		if self:political_state() == "stable" then
			self.persistent.player_factions_informed_to_join_war = {}
		end

		local player_factions = cm:get_human_factions() or {}
		for _, player_faction_name in ipairs(player_factions) do
			if self:is_eligible_to_participate_in_legitimacy_war(player_faction_name) then
				local current_political_state = self:political_state()

				if current_political_state == "legitimacy_war" and not table_contains(self.persistent.player_factions_informed_to_join_war, player_faction_name) then
					-- present message to join a war
					local msg = self.config.event_info.can_join_legitimacy_war
					cm:show_message_event(player_faction_name, msg.title_key, msg.secondary_detail, msg.text, true, msg.event_pic_index, nil, nil, true)
					table.insert(self.persistent.player_factions_informed_to_join_war, player_faction_name)
				elseif current_political_state == "stable" and not table_contains(self.persistent.player_factions_informed_to_start_war, player_faction_name)
				 	and feature_unlock.is_feature_unlocked_for_faction(player_faction_name, "pharaohs_crown")
				then
					-- present message to start a war
					local msg = self.config.event_info.can_start_legitimacy_war
					cm:show_message_event(player_faction_name, msg.title_key, msg.secondary_detail, msg.text, true, msg.event_pic_index, nil, nil, true)
					table.insert(self.persistent.player_factions_informed_to_start_war, player_faction_name)
				end
			end
		end
	end,

	check_if_cai_can_participate_legitimacy_war = function(self, faction, start_the_war)
		local faction_key = faction:name()
		if not cm:get_bool_script_state(faction, self.shared_states.is_ruler_or_pretender) then
			if self:is_eligible_to_participate_in_legitimacy_war(faction_key) and
				cm:get_float_script_state(self.shared_states_suffixed.num_pretenders) < cm:get_float_script_state(self.shared_states_suffixed.max_pretenders)
			then

				local chance_for_cai = self:calculate_cai_wilingness_to_participate_in_legitimacy_war(faction, start_the_war)
				local rand_chance = cm:model():random_int(1, 100) 
				return rand_chance <= chance_for_cai
			end
		end

		return false
	end,

	calculate_cai_wilingness_to_participate_in_legitimacy_war = function(self, faction, start_the_war)
		local faction_key = faction:name()
		local ruling_faction_key = cm:get_string_script_state(self.shared_states_suffixed.sitting_ruler)
		local base_chance_for_cai = (start_the_war and self.config.chance_for_cai_to_start_legitimacy_war) or self.config.chance_for_cai_to_join_legitimacy_war

		-- To calculate additional modifiers, we use the ratio between the looked at faction and the sitting ruler
		-- The idea is that we get the legitimacy of the faction we're looking at and divide it by the legitimacy of the ruling/best pretender faction
		-- If the looked at faction has more legitimacy than the sitting ruler, the bigger the modifier is(ie. More likely it is that it'll join/start the war)
		-- Ruler_legitimacy is clamped to a min. This is so that when the sitting ruler dies during a Civil War Factions don't compare their Legitimacy to 0 to decide to join
		-- cm:get_string_script_state() returns "" when a ruling faction is not set, which usually happens when it's dead
		local ruler_legitimacy = (ruling_faction_key == "" and 0) or self.legitimacy_system:get_legitimacy(ruling_faction_key)
		ruler_legitimacy = math.max(self.config.minimum_legitimacy_to_claim_crown, ruler_legitimacy)
		local curr_faction_legitimacy = self.legitimacy_system:get_legitimacy(faction_key)
		local legitimacy_ratio = curr_faction_legitimacy / (ruler_legitimacy == 0 and 1 or ruler_legitimacy)
		-- Used to smooth out the scale of change as per the designer's math for balance
		-- Below 0.75 ratio of legitimacy, y smoothly goes towards 0 at x = 0.3 (instead of linearly becoming 0 at x == 0.5)
		-- Math.min and Math.max are used to clamp the modifier's value between 0 and 20
		local legitimacy_modifier = math.min(20, math.max(0, (math.exp(1.8 * (legitimacy_ratio - 0.4))-0.9)))
		-- We get the diplomatic attitude of the looked at faction towards the sitting ruler
		-- The lower their attitude towards the ruling faction, the higher the chance there is for that faction to join/start a war, and vice-versa. Safeguarding also if the sitting ruler is missing
		local attitude_ratio = (ruling_faction_key == "" and self.config.cai_neutral_attitude_benchmark_value) or (faction:diplomatic_attitude_towards(ruling_faction_key) / self.config.cai_neutral_attitude_benchmark_value)
		-- Used to smooth out the scale of change as per the designer's math for balance.
		local attitude_modifier = math.max(0, (2 + (-1 / (0.5 + math.exp(-(0.2*(attitude_ratio + 2.5)))))))
		-- Crowdedness modifier is used to make it so during a Legitimacy War factions are a bit more likely to join when there are few pretenders, and less likely when there are too many
		-- This is a soft-cap though and depends on other modifiers above, so is not guaranteed, but the aim is that between 2-5 pretenders (outside of ruler) should join each war
		-- One nice secondary effect is also that factions will tend to join earlier the war, instead of their joining being evenly being spread over the course of a war
		function crowdedness_modifier()
			local crowdedness_modifiers_table = {
				{ num_pretenders = 1, result = (start_the_war and 1) or 5 },		-- This becomes "neutral" (1) when #pretenders = 1 (so: outside of Legitimacy War), or 5 if Civil War with #pretenders = 1
				{ num_pretenders = 2, result = 5 },		-- If there is just 1 pretender (so: #pretenders = 2), we want to increase the chance of a second faction to join
				{ num_pretenders = 3, result = 2 },
				{ num_pretenders = 4, result = 1 },		-- Modifier neutral on #pretenders = 4 or 5 (3 or 4 pretenders + ruler)
				{ num_pretenders = 5, result = 1 },
			}

			local num_pretenders = #self.persistent.pretenders
		
			for i, entry in ipairs(crowdedness_modifiers_table) do
				if entry.num_pretenders == num_pretenders then
					return entry.result
				end
			end

			local value = math.exp(-((num_pretenders - 4.75) * 0.9))			-- Starting at #pretenders = 6 (5 pretenders + ruler) or above we don't want factions to join, but without hard-capping
			return math.max(value, 0)
		end

		local final_result = base_chance_for_cai * legitimacy_modifier * attitude_modifier * crowdedness_modifier()
		if final_result <= 1 then
			return 0
		else
			return final_result
		end
	end,

	activate_button = function(self, button_to_activate, click_button)
		for container, button in pairs(pharaoh_mechanics) do
			local button_component = core:get_ui_root():SequentialFind(button)
			if button == button_to_activate then
				local slot_component = core:get_ui_root():SequentialFind(container)
				if slot_component then
					slot_component:SetVisible(true)
				end

				if button_component then
					button_component:SetVisible(true)

					if click_button then
						button_component:SimulateLClick()
					end
				end
			else
				if button_component then
					button_component:SetVisible(false)
				end

				if slot_component then
					slot_component:SetVisible(false)
				end
			end
		end
	end,

	load_legitimacy_war_thresholds = function(self)
		-- The if checks are because on_new_game_started is called before on_first_tick, but we want to also call this
		-- method in on_first_tick.
		if is_string(self.config.legitimacy_to_claim_crown.stable) then
			self.config.legitimacy_to_claim_crown.stable = cm:model():get_campaign_variable_by_name(self.config.legitimacy_to_claim_crown.stable)
		end

		if is_string(self.config.legitimacy_to_claim_crown.legitimacy_war) then
			self.config.legitimacy_to_claim_crown.legitimacy_war = cm:model():get_campaign_variable_by_name(self.config.legitimacy_to_claim_crown.legitimacy_war)
		end
	end,

	on_new_game_started = function(self, context)
		local random_start_pos_enabled = (mdm.state["random_startpos"] and mdm.state["random_startpos"].value == 1) and true or false
		
		self.persistent.current_ruling_faction_key = self.config.starting_ruler_faction_key

		if core:svr_load_bool("sbool_player_selected_first_turn_intro_on_frontend") or cm:get_saved_value("bool_is_tutorial_mode") then
			cm:set_script_state(self.shared_states_suffixed.minimum_turn_for_next_war, 99)
		end
		self:load_legitimacy_war_thresholds()

		self.persistent.political_state = "stable"
		self.persistent.pretenders = { self.config.starting_ruler_faction_key }

		if self.config.starting_ruler_faction_key then
			legitimacy_choice:unlock_legitimacy(self.legitimacy_system, self.config.starting_ruler_faction_key)
		end

		self:disable_vassal_occupation_option_restriction()

		local ruler_faction

		if self.config.starting_ruler_faction_key then
			ruler_faction = cm:get_faction(self.config.starting_ruler_faction_key)
			if not ruler_faction and cm:is_benchmark_mode() then
				-- prevent crashes specifically in benchmark mode
				return
			end

			cm:remove_forced_occupation_decision_restrictions_for_faction(ruler_faction)
			if ruler_faction:is_human() then
				ancient_legacy_common:faction_unlock_legacy_group(self.config.starting_ruler_faction_key, self.config.ancient_legacy_group_key)
			elseif self.config.starting_ruler_unlock_legacy then
				ancient_legacy_common:ai_get_random_legacy(self.config.starting_ruler_faction_key, self.config.ancient_legacy_group_key)
			end

			if not random_start_pos_enabled then
				self.special_ancillary_system:unlock_ancillaries(self.config.starting_ruler_faction_key, true)
			end

			-- Disable being confederated or subjugated when you're the ruler and allow making subjects.
			-- That is normally done when becoming a pretender but we need this setup for the starting ruler too.
			-- Put in inside a callback because it will be overriden by apply_default_diplomacy()
			cm:callback(
				function()
					cm:force_diplomacy("faction:"..self.config.starting_ruler_faction_key, "all", "subjugate", true, false, false)
					cm:force_diplomacy("faction:"..self.config.starting_ruler_faction_key, "all", "become subject", false, true, false)
					local can_confederate = faction_should_be_able_to_confederate(cm:get_faction(self.config.starting_ruler_faction_key))
					cm:force_diplomacy("faction:"..self.config.starting_ruler_faction_key, "all", "form confederation", can_confederate, false, false)
				end,
				0.1)

			-- Shared state setup for UI
			cm:set_script_state(self.shared_states_suffixed.sitting_ruler, self.config.starting_ruler_faction_key)
			cm:set_script_state(self.shared_states_suffixed.ruler_or_best_pretender, self.config.starting_ruler_faction_key)
			cm:set_script_state(ruler_faction, self.shared_states.is_sitting_ruler, true)
			cm:set_script_state(ruler_faction, self.shared_states.is_ruler_or_pretender, true)

			-- Remember the starting ruler family member so they can be tracked.
			local ruler_character = ruler_faction:faction_leader()
			if ruler_character and not ruler_character:is_null_interface() then
				local ruler_family_member_cqi = ruler_character:family_member():command_queue_index()
				self.persistent.starting_ruler_family_member_cqi = ruler_family_member_cqi
			end
		end

		cm:set_script_state(self.shared_states_suffixed.legitimacy_war, false)
		cm:set_script_state(self.shared_states_suffixed.legitimacy_war_turns, 0)
		cm:set_script_state(self.shared_states_suffixed.legitimacy_war_emergency_turns, 0)

		if self.config.use_threshold_legitimacy then
			self:update_legitimacy_war_thresholds()
		else
			cm:set_script_state(self.shared_states_suffixed.legitimacy_to_start_war, self.config.legitimacy_to_claim_crown.stable)
			cm:set_script_state(self.shared_states_suffixed.legitimacy_to_join_war, self.config.legitimacy_to_claim_crown.legitimacy_war)
		end

		if cm:get_float_script_state(self.shared_states_suffixed.max_pretenders) <= 0 then
			cm:set_script_state(self.shared_states_suffixed.max_pretenders, 999)
		end

		if self.config.first_possible_legitimacy_war_turn and self.config.first_possible_legitimacy_war_turn > 1 then
			self.persistent.min_turn_for_next_war = self.config.first_possible_legitimacy_war_turn
			cm:set_script_state(self.shared_states_suffixed.minimum_turn_for_next_war, self.config.first_possible_legitimacy_war_turn)
		end

		if not self.config.starting_ruler_faction_key then
			-- This is in a callback because there's a race condition between this "on_new_game_started" and legitimacy_choice.on_new_game_started
			cm:callback(function()
				self:force_start_legitimacy_war()
				if (self.config.starting_war_min_num_pretenders or 1) > 1 then
					for i = 2, self.config.starting_war_min_num_pretenders do
						self:force_join_pretender_to_war()
					end
				end
			end, 0.1)
		end
	end,

	on_first_tick = function(self, context)
		self:load_legitimacy_war_thresholds()

		if self.persistent.legitimacy_to_claim_crown.stable == 0 and self.config.use_threshold_legitimacy then
			self:update_legitimacy_war_thresholds()
		end

		return true
	end,

	on_loading_game = function(self, context)
		if self.persistent.political_state == "" then
			self.persistent.political_state = "stable"
		end

		if not self.persistent.player_factions_informed_to_start_war then
			self.persistent.player_factions_informed_to_start_war = {}
		end

		if not self.persistent.player_factions_informed_to_join_war then
			self.persistent.player_factions_informed_to_join_war = {}
		end

		if not self.persistent.min_turn_for_next_war then
			self.persistent.min_turn_for_next_war = 0
		end

		self.persistent.times_legitimacy_war_start_movie_has_played = self.persistent.times_legitimacy_war_start_movie_has_played or (self.persistent.played_legitimacy_war_start_movie and 1 or 0)
		self.persistent.played_ruler_death_movie = self.persistent.played_ruler_death_movie or false

		if not self.persistent.legitimacy_to_claim_crown then
			self.persistent.legitimacy_to_claim_crown = {
				stable = 0,
				legitimacy_war = 0,
			}
		end

		if not self.persistent.max_pretenders then
			self.persistent.max_pretenders = 0
		end
	end,

	update_legitimacy_war_thresholds = function(self)
		local ruler_faction_key = self:get_ruler_faction()
		if not ruler_faction_key then
			return
		end

		local num_legitimacy = self.legitimacy_system:get_legitimacy(ruler_faction_key)

		local stable_multiplier = self.config.legitimacy_to_claim_crown_thresholds.stable
		local legitimacy_war_multiplier = self.config.legitimacy_to_claim_crown_thresholds.legitimacy_war

		local stable_threshold = math.max(stable_multiplier * num_legitimacy, self.config.minimum_legitimacy_to_claim_crown)
		local legitimacy_war_threshold = math.max(legitimacy_war_multiplier * num_legitimacy, self.config.minimum_legitimacy_to_claim_crown)

		self.persistent.legitimacy_to_claim_crown = {
			stable = stable_threshold,
			legitimacy_war = legitimacy_war_threshold,
		}

		cm:set_script_state(self.shared_states_suffixed.legitimacy_to_start_war, stable_threshold)
		cm:set_script_state(self.shared_states_suffixed.legitimacy_to_join_war, legitimacy_war_threshold)
	end,

	get_legitimacy_war_thresholds = function(self)
		return (self.config.use_threshold_legitimacy and self.persistent.legitimacy_to_claim_crown) or self.config.legitimacy_to_claim_crown
	end,

	change_political_state = function(self, new_state, ruler_faction_key)
		local old_state = self.persistent.political_state

		if old_state ~= new_state then
			self.persistent.political_state = new_state

			if new_state == "legitimacy_war" then
				self.persistent.start_turn_of_legitimacy_war = cm:turn_number()
				self.persistent.emergency_tiebreaker_turns = 0
				if self:get_num_pretenders() == 1 then
					self.persistent.legitimacy_war_turns_left = self.config.trivial_legitimacy_war_turns
				else
					self.persistent.legitimacy_war_turns_left = self.config.legitimacy_war_start_turns
				end

				cm:set_script_state(self.shared_states_suffixed.legitimacy_war, true)
				cm:set_script_state(self.shared_states_suffixed.legitimacy_war_turns, self.persistent.legitimacy_war_turns_left)

				self:play_legitimacy_war_start_movie()

				self:play_legitimacy_war_event_animation(self.config.ui.war_started_notification)

				if self.config.event_info.notify_other_paths_of_legitimacy_war then
					self:send_message_event_to_other_paths(self.config.event_info.notify_other_paths_of_legitimacy_war, true)
				end
			else
				cm:set_script_state(self.shared_states_suffixed.legitimacy_war, false)

				local min_turn_for_next_war = cm:turn_number() + self.config.legitimacy_war_cooldown
				self.persistent.min_turn_for_next_war = min_turn_for_next_war

				cm:set_script_state(self.shared_states_suffixed.minimum_turn_for_next_war, min_turn_for_next_war)

				local local_faction_key = cm:get_local_faction_name(true)
				-- play the end-war movie and animation-notification only if the local player is the winner of the legitimacy war
				if local_faction_key and local_faction_key == ruler_faction_key then
					self:play_legitimacy_war_end_movie()
					self:play_legitimacy_war_event_animation(self.config.ui.war_ended_notification)
				end
			end
		end
	end,

	political_state = function(self)
		return self.persistent.political_state
	end,

	get_ruler_faction = function(self)
		return self.persistent.political_state == "stable" and self.persistent.pretenders[1]
	end,

	-- Almost the same as "is_ruler", but during legitimacy war will only return true for the faction that was
	-- the ruler before the legitimacy war started.
	is_sitting_ruler = function(self, faction_key)
		return faction_key == self.persistent.current_ruling_faction_key
	end,

	-- Returns whether the faction is the sitting ruler during peace, and whether it's a pretender during legitimacy war.
	is_ruler = function(self, faction_key)
		for _, pharaoh_key in ipairs(self.persistent.pretenders) do
			if pharaoh_key == faction_key then
				return true
			end
		end

		return false
	end,

	get_num_pretenders = function(self)
		return (self:political_state() == "legitimacy_war" and #self.persistent.pretenders) or 0
	end,

	get_best_pretender = function(self)
		local best_pretenders = {}
		local runner_up = nil
		local best_pretender_legitimacy = -1
		local runner_up_legitimacy = -1

		if #self.persistent.pretenders == 0 then
			return nil, nil
		end

		for _, pretender_key in ipairs(self.persistent.pretenders) do
			local pretender_legitimacy = self.legitimacy_system:get_legitimacy(pretender_key)
			if pretender_legitimacy > best_pretender_legitimacy then
				runner_up = best_pretenders[1]
				runner_up_legitimacy = best_pretender_legitimacy
				best_pretenders = { pretender_key }
				best_pretender_legitimacy = pretender_legitimacy
			elseif pretender_legitimacy == best_pretender_legitimacy then
				table.insert(best_pretenders, pretender_key)
				runner_up = pretender_key
				runner_up_legitimacy = pretender_legitimacy
			elseif pretender_legitimacy > runner_up_legitimacy then
				runner_up = pretender_key
				runner_up_legitimacy = pretender_legitimacy
			end
		end

		if #best_pretenders == 1 then
			return best_pretenders[1], runner_up
		end

		-- We have a draw so return nothing, no new ruler this turn
		return nil
	end,

	best_non_pretender = function(self)
		local best_faction = nil
		local best_faction_legitimacy = -1

		local factions = legitimacy_choice:get_factions_with_legitimacy_object(self.legitimacy_system)

		for unlocked_legitimacy_faction_key, _ in dpairs(factions) do
			local num_legitimacy = self.legitimacy_system:get_legitimacy(unlocked_legitimacy_faction_key)
			if num_legitimacy > best_faction_legitimacy
				and not cm:get_faction(unlocked_legitimacy_faction_key):is_dead()
				and not self:is_ruler(unlocked_legitimacy_faction_key)
			then
				best_faction = unlocked_legitimacy_faction_key
				best_faction_legitimacy = num_legitimacy
			end
		end

		return best_faction
	end,

	force_start_legitimacy_war = function(self)
		local best_faction = self:best_non_pretender()

		if best_faction then
			self.persistent.min_turn_for_next_war = 1
			self:announce_faction_for_pretender(best_faction)
			self.special_ancillary_system:unlock_crowns(best_faction)
		end
	end,

	force_join_pretender_to_war = function(self)
		if self:political_state() ~= "legitimacy_war" then
			return
		end

		local best_faction = self:best_non_pretender()
		if best_faction then
			self:announce_faction_for_pretender(best_faction)
			self.special_ancillary_system:unlock_crowns(best_faction)
		end
	end,

	change_sitting_ruler = function(self, faction_key)
		cm:set_script_state(self.shared_states_suffixed.sitting_ruler, faction_key)
		cm:set_script_state(self.shared_states_suffixed.ruler_or_best_pretender, faction_key)
		cm:remove_script_state(self.shared_states_suffixed.ruler_runner_up)
		cm:set_script_state(cm:get_faction(faction_key), self.shared_states.is_sitting_ruler, true)

		if self.persistent.current_ruling_faction_key then
			cm:remove_script_state(cm:get_faction(self.persistent.current_ruling_faction_key), self.shared_states.is_sitting_ruler)
		end

		self.persistent.current_ruling_faction_key = faction_key

		cm:force_diplomacy("faction:"..faction_key, "all", "subjugate", true, false, false)
		cm:force_diplomacy("faction:"..faction_key, "all", "become subject", false, true, false)
		local can_confederate = faction_should_be_able_to_confederate(cm:get_faction(faction_key))
		cm:force_diplomacy("faction:"..faction_key, "all", "form confederation", can_confederate, false, false)
	end,

	announce_faction_for_ruler_helper = function(self, faction_key)
		local was_pretender = self:is_ruler(faction_key)
		if not was_pretender then
			cm:force_diplomacy("faction:"..faction_key, "all", "subjugate", true, false, false)
			cm:force_diplomacy("faction:"..faction_key, "all", "become subject", false, true, false)
			local can_confederate = faction_should_be_able_to_confederate(cm:get_faction(faction_key))
			cm:force_diplomacy("faction:"..faction_key, "all", "form confederation", can_confederate, false, false)
		end

		-- Allow pretenders to be confederated and subjugated again
		self:allow_pretenders_to_be_subjugated_and_confederated(faction_key)

		-- Allow pretenders to engage in diplomacy between each other
		self:restore_diplomacy_between_pretenders()

		for _, pretender_key in ipairs(self.persistent.pretenders) do
			if pretender_key ~= faction_key then
				local pretender = cm:get_faction(pretender_key)
				cm:set_script_state(pretender, self.shared_states.is_ruler_or_pretender, false)
				cm:remove_script_state(pretender, self.shared_states.is_sitting_ruler)
				if not self.special_ancillary_system.config.ancillaries_always_unlocked then
					self.special_ancillary_system:lock_ancillaries(pretender_key)
				end
			end
		end

		if faction_key then
			-- The new ruler subjugates all of the pretenders
			if self.config.failed_pretenders_become_subjects_of_new_ruler then
				self:force_pretenders_subjugation(faction_key)
			end
			self.persistent.pretenders = { faction_key }
			cm:set_script_state(self.shared_states_suffixed.sitting_ruler, faction_key)
			cm:set_script_state(self.shared_states_suffixed.ruler_or_best_pretender, faction_key)
			cm:remove_script_state(self.shared_states_suffixed.ruler_runner_up)
			cm:set_script_state(cm:get_faction(faction_key), self.shared_states.is_sitting_ruler, true)
			cm:set_script_state(cm:get_faction(faction_key), self.shared_states.is_ruler_or_pretender, true)
		else
			self.persistent.pretenders = { }
			cm:remove_script_state(self.shared_states_suffixed.sitting_ruler)
			cm:remove_script_state(self.shared_states_suffixed.ruler_or_best_pretender)
			cm:remove_script_state(self.shared_states_suffixed.ruler_runner_up)
			-- TODO For some reason we have no pretenders to become a pharaoh. They were wiped out by non-pretenders?
			-- In any case, we need some message event here? Ask design
		end

		self:change_political_state("stable", faction_key)

		local unlocked_legitimacy = legitimacy_choice:get_unlocked_legitimacy(faction_key)
		local event_data =
		{
			previous_ruling_faction_key = self.persistent.current_ruling_faction_key,
			new_ruling_faction_key = faction_key,
			legitimacy_path_id = unlocked_legitimacy and unlocked_legitimacy.config.id or ""
		}
		self.persistent.current_ruling_faction_key = faction_key
		core:trigger_event("ScriptEventLegitimacyWarEnded", event_data)

		if self:political_state() == "legitimacy_war" then
			local political_state_id = self.config.id -- "political_states" or "hatti_political_states"
			cm:notify_legitimacy_war_ended(faction_key, self.persistent.start_turn_of_legitimacy_war, cm:turn_number() - self.persistent.start_turn_of_legitimacy_war, political_state_id)
		end

		-- remove occupation option restrictions for ruling faction.
		cm:remove_forced_occupation_decision_restrictions_for_faction(cm:get_faction(faction_key))

		-- apply occupation option restrictions for old ruler.
		-- remove the vassals as only a ruling faction can have vassals
		if event_data.previous_ruling_faction_key and event_data.previous_ruling_faction_key ~= event_data.new_ruling_faction_key then
			local previous_ruler = cm:get_faction(event_data.previous_ruling_faction_key)
			if previous_ruler and not previous_ruler:is_dead() then
				
				cm:disallow_faction_occupation_decision(previous_ruler, self.config.vassal_occupation_option_key)

				local subjects = previous_ruler:factions_sovereign_of()
				for i = 0, subjects:num_items() - 1 do
					local curr_subject = subjects:item_at(i)
					cm:force_break_alliance(event_data.previous_ruling_faction_key, curr_subject:name(), true)
				end
			end
		end

		if was_pretender then
			self.special_ancillary_system:try_to_unlock_sitting_ruler_ancillaries(faction_key)
		else
			-- The new ruler was never a pretender, which means ancillaries were never unlocked; so we're calling this function instead.
			-- This can happen when a dynasty ruler dies and the faction that takes over the dynasty and becomes the ruler faction was not a pretender prior to the old ruler dying.
			self.special_ancillary_system:unlock_ancillaries(faction_key)
		end
	end,

	is_eligible_to_participate_in_legitimacy_war = function(self, faction_key)
		return self:faction_can_claim_crown(faction_key)
			and self.legitimacy_system:num_sacred_regions(faction_key) >= self.legitimacy_system:get_min_sacred_lands_for_faction(faction_key)
			and not self:is_ruler(faction_key)
			and legitimacy_choice:legitimacy_unlocked(self.legitimacy_system, faction_key)
	end,

	announce_faction_for_ruler = function(self, faction_key, should_update_dynasty)
		local political_state = self:political_state()
		if self.persistent.current_ruling_faction_key == faction_key 
			and political_state ~= "legitimacy_war"
		then
			return
		end

		self:update_court_leader_shared_states(faction_key)

		local won_legitimacy_war = political_state == "legitimacy_war"

		self:announce_faction_for_ruler_helper(faction_key)

		local faction = cm:get_faction(faction_key)
		if not faction:is_human() then
			local legacy_type = self.config.ancient_legacy_group_key

			ancient_legacy_common:ai_get_random_legacy(faction_key, legacy_type)
			if won_legitimacy_war then
				self:send_message_event(self.config.event_info.legitimacy_war_end_other, true)
			end
		else
			if won_legitimacy_war then
				self:send_message_event(self.config.event_info.legitimacy_war_end, true)
			end
		end

		if should_update_dynasty then
			cm:change_dynasty_ruler(self.legitimacy_system.config.dynasty_line_key, faction_key, won_legitimacy_war)
		end

		self.powers_system:update_court_positions(faction_key)
	end,

	update_court_leader_shared_states = function(self, faction_key)
		if self.persistent.current_ruling_faction_key == faction_key then
			return
		end

		if self.persistent.current_ruling_faction_key then
			local old_ruling_faction = cm:get_faction(self.persistent.current_ruling_faction_key)
			if old_ruling_faction and not old_ruling_faction:is_dead() then
				local old_court_leader_character_obj = old_ruling_faction:faction_leader()
				if old_court_leader_character_obj and not old_court_leader_character_obj:is_null_interface() then
					cm:set_script_state(old_court_leader_character_obj, self.shared_states.court_leader_name_localized, "")
				end
			end
		end

		local new_court_leader_faction = cm:get_faction(faction_key)
		if new_court_leader_faction and not new_court_leader_faction:is_dead() then 
			local new_court_leader_character_obj = new_court_leader_faction:faction_leader()
			if new_court_leader_character_obj and not new_court_leader_character_obj:is_null_interface() then
				local localised_string = common.get_localised_string(self.config.ui.court_leader_localized_name)
				cm:set_script_state(new_court_leader_character_obj, self.shared_states.court_leader_name_localized, localised_string)
			end
		end
	end,

	set_max_pretenders = function(self, new_max_pretenders)
		self.persistent.max_pretenders = new_max_pretenders
		cm:set_script_state(self.shared_states_suffixed.max_pretenders, new_max_pretenders)
	end,

	announce_faction_for_pretender = function(self, faction_key, ignore_max_pretenders --[[opt=false]])
		if not is_boolean(ignore_max_pretenders) then
			ignore_max_pretenders = false
		end

		if not ignore_max_pretenders and self.persistent.max_pretenders > 0 and #self.persistent.pretenders >= self.persistent.max_pretenders then
			self:error_message("pretender trying to join legitimacy war even though we've already reached max pretenders.")
			return
		end

		local local_faction_key = cm:get_local_faction_name(true)
		local is_local_player_faction
		if local_faction_key then
			is_local_player_faction = local_faction_key == faction_key
		end

		local was_trivial_legitimacy_war = 1 == #self.persistent.pretenders
		local new_pretender = true

		if self:political_state() ~= "legitimacy_war" and self.persistent.min_turn_for_next_war > cm:turn_number() then
			self:error_message("trying to start a legitimacy war before the cooldown is over.")
			return
		end

		if not self:is_ruler(faction_key) then
			self:force_war_with_pretenders(faction_key)
			table.insert(self.persistent.pretenders, faction_key)

			-- Disable being confederated or subjugated if you're a pharaoh pretender/pharaoh
			cm:force_diplomacy("faction:"..faction_key, "all", "subjugate", true, false, false)
			cm:force_diplomacy("faction:"..faction_key, "all", "become subject", false, true, false)
			local can_confederate = faction_should_be_able_to_confederate(cm:get_faction(faction_key))
			cm:force_diplomacy("faction:"..faction_key, "all", "form confederation", can_confederate, false, false)

			-- Clear diplomacy panel cached in memory because it will not have the updated information
			if PanelManager.GetCachedComponentId() == "diplomacy_dropdown" then
				PanelManager.ClearCachedComponent()
			end

			local faction = cm:get_faction(faction_key)
			local best_pretender_key, runner_up_key = self:get_best_pretender()
			cm:set_script_state(self.shared_states_suffixed.ruler_or_best_pretender, best_pretender_key)
			if runner_up_key then
				cm:set_script_state(self.shared_states_suffixed.ruler_runner_up, runner_up_key)
			else
				cm:remove_script_state(self.shared_states_suffixed.ruler_runner_up)
			end
			cm:set_script_state(faction, self.shared_states.is_ruler_or_pretender, true)
			cm:set_script_state(self.shared_states_suffixed.num_pretenders, #self.persistent.pretenders)

			local sovereign = faction:get_sovereign()

			-- If the faction is a subject of another faction liberate it, as pretenders are not supposed to be subjects
			if sovereign and not sovereign:is_null_interface() then
				cm:force_break_alliance(faction_key, sovereign:name(), true)
			end
		end

		if self:political_state() ~= "legitimacy_war" then
			new_pretender = false
			self:change_political_state("legitimacy_war", faction_key)
			self:send_message_event(self.config.event_info.legitimacy_war_start, true)

			local event_data =
			{
				previous_ruling_faction_key = self.persistent.current_ruling_faction_key,
			}
			core:trigger_event("ScriptEventLegitimacyWarStart", event_data)
			cm:set_script_state(self.shared_states_suffixed.num_pretenders, #self.persistent.pretenders)

			if is_local_player_faction and previous_ruling_faction_key ~= faction_key then
				self:play_legitimacy_war_event_animation(self.config.ui.war_joined_notification)
			end

			self:notify_legitimacy_war_updated_helper(faction_key, "started_war")
		else
			if was_trivial_legitimacy_war then
				self.persistent.legitimacy_war_turns_left = self.config.legitimacy_war_start_turns
				cm:set_script_state(self.shared_states_suffixed.legitimacy_war_turns, self.persistent.legitimacy_war_turns_left)
			else
				local turns_after_addition = self.persistent.legitimacy_war_turns_left + self.config.new_pretender_additional_turns
				local turns_until_now = cm:turn_number() - self.persistent.start_turn_of_legitimacy_war - 1	-- Decrease by one due to the current turn being still played.
				self.persistent.legitimacy_war_turns_left = math.min(turns_after_addition, self.config.legitimacy_war_max_total_turns - turns_until_now)
				cm:set_script_state(self.shared_states_suffixed.legitimacy_war_turns, self.persistent.legitimacy_war_turns_left)
			end
		end

		if new_pretender then
			local event_info = {
				event_key = self.config.event_info.legitimacy_war_pretender_joined.event_key,
				event_pic_index = self.config.event_info.legitimacy_war_pretender_joined.event_pic_index,
				str_param1 = faction_key,
			}

			self:send_message_event(event_info, true)

			if is_local_player_faction then
				self:play_legitimacy_war_event_animation(self.config.ui.war_joined_notification)
			end

			self:notify_legitimacy_war_updated_helper(faction_key, "joined_war")
		end

		local pretender_faction = cm:get_faction(faction_key)
		for _, ancillary_data in ipairs(self.special_ancillary_system.config.ancillaries) do
			for _, region in ipairs(ancillary_data.regions_needed or {}) do
				cm:cai_add_region_hint(pretender_faction, region)
			end
		end
	end,

	remove_pretender = function(self, faction_key)
		local faction = cm:get_faction(faction_key)
		local old_best_pretender = self:get_best_pretender()

		for i = 1, #self.persistent.pretenders do
			if self.persistent.pretenders[i] == faction_key then
				table.remove(self.persistent.pretenders, i)

				cm:set_script_state(faction, self.shared_states.is_ruler_or_pretender, false)
				break
			end
		end

		if faction_key == self.persistent.current_ruling_faction_key then
			self.persistent.current_ruling_faction_key = nil
			cm:remove_script_state(self.shared_states_suffixed.sitting_ruler)
			cm:remove_script_state(faction, self.shared_states.is_sitting_ruler)
		end

		if old_best_pretender ~= faction_key then
			return
		end

		self:notify_legitimacy_war_updated_helper(faction_key, "left_war")

		local best_pretender, runner_up = self:get_best_pretender()

		if best_pretender then
			cm:set_script_state(self.shared_states_suffixed.ruler_or_best_pretender, best_pretender)
			if runner_up then
				cm:set_script_state(self.shared_states_suffixed.ruler_runner_up, runner_up)
			else
				cm:remove_script_state(self.shared_states_suffixed.ruler_runner_up)
			end
		else
			-- This could only happen outside of legitimacy war
			cm:remove_script_state(self.shared_states_suffixed.ruler_or_best_pretender)
			cm:set_script_state(self.shared_states_suffixed.legitimacy_to_start_war, 0)
			cm:set_script_state(self.shared_states_suffixed.legitimacy_to_join_war, 0)
		end

		if faction and not faction:is_null_interface() and not faction:is_dead() then
			cm:force_diplomacy("faction:"..faction_key, "all", "subjugate", false, true, false)
			cm:force_diplomacy("faction:"..faction_key, "all", "become subject", true, false, false)
			local can_confederate = faction_should_be_able_to_confederate(cm:get_faction(faction_key))
			cm:force_diplomacy("faction:"..faction_key, "all", "form confederation", can_confederate, true, false)

			for _, pretender in ipairs(self.persistent.pretenders) do
				cm:force_diplomacy("faction:"..faction_key, "faction:"..pretender, "peace", true, true, true)
			end
		end
	end,

	update_best_pretender = function(self)
		local best_pretender_key, runner_up_key = self:get_best_pretender()
		cm:set_script_state(self.shared_states_suffixed.ruler_or_best_pretender, best_pretender_key)
		if runner_up_key then
			cm:set_script_state(self.shared_states_suffixed.ruler_runner_up, runner_up_key)
		else
			cm:remove_script_state(self.shared_states_suffixed.ruler_runner_up)
		end
	end,

	faction_can_claim_crown = function(self, faction_key)
		return self.legitimacy_system:get_legitimacy(faction_key) >= self:legitimacy_needed_to_claim_crown() and
			not cm:get_faction(faction_key):faction_leader():character_details():is_dynasty_heir()
	end,

	legitimacy_needed_to_claim_crown = function(self)
		return self:get_legitimacy_war_thresholds()[self:political_state()]
	end,

	-- Forces war between pretenders and the specified faction and disable all diplomacy between them
	force_war_with_pretenders = function(self, faction_key)
		local sitting_ruler = self.persistent.current_ruling_faction_key
		local faction = cm:get_faction(faction_key)
		if not self.config.pretender_automatically_declare_war_on_legitimacy_war_join then
			if not faction:is_human() then
				for _, pretender_key in ipairs(self.persistent.pretenders) do
					if pretender_key ~= faction_key then
						if not sitting_ruler or sitting_ruler ~= pretender_key then
							cm:cai_strategic_stance_manager_block_all_stances_but_that_specified_towards_target_faction(faction_key, pretender_key, "CAI_STRATEGIC_STANCE_UNFRIENDLY")
						end
					end
				end
			end

			if sitting_ruler and sitting_ruler ~= "" and not faction:faction_leader():character_details():is_dynasty_heir() then
				cm:force_declare_war(
						faction_key,
						sitting_ruler,
						true,
						true,
						true
				)

				cm:force_diplomacy(
						"faction:"..faction_key,
						"faction:"..sitting_ruler,
						"peace",
						false,
						false,
						true
				)
				if not faction:is_human() then
					cm:cai_strategic_stance_manager_block_all_stances_but_that_specified_towards_target_faction(faction_key, sitting_ruler, "CAI_STRATEGIC_STANCE_VERY_UNFRIENDLY")
				end
			end

			return
		end

		for _, pretender_key in ipairs(self.persistent.pretenders) do
			if pretender_key ~= faction_key then
				cm:force_declare_war(
						faction_key,
						pretender_key,
						true,
						true,
						true
				)

				cm:force_diplomacy(
						"faction:"..faction_key,
						"faction:"..pretender_key,
						"peace",
						false,
						false,
						true
				)
				
				if not faction:is_human() then
					if sitting_ruler and sitting_ruler == pretender_key then
						cm:cai_strategic_stance_manager_block_all_stances_but_that_specified_towards_target_faction(faction_key, sitting_ruler, "CAI_STRATEGIC_STANCE_VERY_UNFRIENDLY")
					else
						cm:cai_strategic_stance_manager_block_all_stances_but_that_specified_towards_target_faction(faction_key, pretender_key, "CAI_STRATEGIC_STANCE_UNFRIENDLY")
					end
				end
			end
		end
	end,

	force_pretenders_subjugation = function(self, new_ruler_key)
		for _, pretender_key in ipairs(self.persistent.pretenders) do
			if pretender_key ~= new_ruler_key then
				cm:force_make_subject(new_ruler_key, pretender_key, true)
			end
		end
	end,

	-- Restores regular diplomacy settings for factions that were pretenders
	allow_pretenders_to_be_subjugated_and_confederated = function(self, new_ruler_key)
		for _, pretender_key in ipairs(self.persistent.pretenders) do
			if pretender_key ~= new_ruler_key then
				cm:force_diplomacy("faction:"..pretender_key, "all", "subjugate", false, true, false)
				cm:force_diplomacy("faction:"..pretender_key, "all", "become subject", true, false, false)
				local can_confederate = faction_should_be_able_to_confederate(cm:get_faction(pretender_key))
				cm:force_diplomacy("faction:"..pretender_key, "all", "form confederation", can_confederate, true, false)
			end
		end
	end,

	-- Restores all diplomacy between all pretenders. Done at the end of a legitimacy war.
	-- Also forces peace since they're all subjects of the ruler now.
	restore_diplomacy_between_pretenders = function(self)
		local old_ruler_key = self.persistent.current_ruling_faction_key
		for idx1, pretender1 in ipairs(self.persistent.pretenders) do
			-- Pretenders always force declare war on the sitting ruler which is why we have this here instead of just the bellow for loop
			if old_ruler_key and pretender1 ~= old_ruler_key then
				cm:force_diplomacy(
					"faction:"..pretender1,
					"faction:"..old_ruler_key,
					"peace",
					true,
					true,
					true
				)

				cm:force_make_peace(pretender1, old_ruler_key, true)
			end

			if not self.config.pretender_automatically_declare_war_on_legitimacy_war_join then
				for idx2, pretender2 in ipairs(self.persistent.pretenders) do
					if idx1 ~= idx2 and pretender2 ~= old_ruler_key then
						cm:force_diplomacy(
							"faction:"..pretender1,
							"faction:"..pretender2,
							"peace",
							true,
							true,
							true
						)

						cm:force_make_peace(pretender1, pretender2, true)
					end
				end
			end
		end
	end,

	play_legitimacy_war_event_animation = function(self, notification_info)
		local faction_key = cm:get_local_faction_name(true)
		if legitimacy_choice:legitimacy_unlocked(self.legitimacy_system, faction_key) then
			local uic = core:get_or_create_component(self.config.ui.legitimacy_war_notification_name, self.config.ui.legitimacy_war_notification_path)
			if uic then
				local title = uic:SequentialFind("dy_title")
				if title then
					title:SetStateText(common.get_localised_string(notification_info.title_key))
				end

				local text = uic:SequentialFind("dy_text")
				if text then
					text:SetStateText(common.get_localised_string(notification_info.text_key))
				end

				local state_image = uic:SequentialFind("state_image")
				if state_image then
					state_image:SetStateText(notification_info.state)
				end
			end
		end
	end,

	play_legitimacy_war_start_movie = function(self)
		if self.config.max_times_legitimacy_war_movie_can_play == -1 or self.persistent.times_legitimacy_war_start_movie_has_played < self.config.max_times_legitimacy_war_movie_can_play then
			if is_string(self.config.legitimacy_war_start_movie_name) and self.config.legitimacy_war_start_movie_name ~= "" then
				cm:register_instant_movie(self.config.legitimacy_war_start_movie_name)
				local movie_key = string.gsub(self.config.legitimacy_war_start_movie_name, ".ca_vp8", "")
				core:svr_save_registry_bool(movie_key, true)
			end
			self.persistent.times_legitimacy_war_start_movie_has_played = self.persistent.times_legitimacy_war_start_movie_has_played + 1
		end
	end,

	play_legitimacy_war_end_movie = function(self)
		if self.config.max_times_legitimacy_war_movie_can_play == -1 or self.persistent.times_legitimacy_war_start_movie_has_played <= self.config.max_times_legitimacy_war_movie_can_play then-- we use <= because we count the number of start movies played and this is for the last allowed start movie
			if is_string(self.config.legitimacy_war_end_movie_name) and self.config.legitimacy_war_end_movie_name ~= "" then
				cm:register_instant_movie(self.config.legitimacy_war_end_movie_name)
				local movie_key = string.gsub(self.config.legitimacy_war_end_movie_name, ".ca_vp8", "")
				core:svr_save_registry_bool(movie_key, true)
			end
		end
	end,

	play_starting_ruler_death_movie = function(self)
		if self.persistent.played_ruler_death_movie == false then
			if is_string(self.config.starting_ruler_death_movie_name) and self.config.starting_ruler_death_movie_name ~= "" then
				cm:register_instant_movie(self.config.starting_ruler_death_movie_name)
				local movie_key = string.gsub(self.config.starting_ruler_death_movie_name, ".ca_vp8", "")
				core:svr_save_registry_bool(movie_key, true)
			end
			self.persistent.played_ruler_death_movie = true
		end
	end,

	disable_vassal_occupation_option_restriction = function(self)
		local faction_list = cm:model():world():faction_list()
		for i = 0, faction_list:num_items() - 1 do
			local curr_faction = faction_list:item_at(i)
			if curr_faction then
				cm:disallow_faction_occupation_decision(curr_faction, self.config.vassal_occupation_option_key)
			end
		end
	end,

	notify_legitimacy_war_updated_helper = function(self, faction_key, war_event_state)
		local faction = cm:get_faction(faction_key)
		local attitude_towards_ruler = faction:diplomatic_attitude_towards(self.persistent.current_ruling_faction_key)

		local comma_separated_pretenders = ""
		for _, pretender in ipairs(self.persistent.pretenders) do
			comma_separated_pretenders = comma_separated_pretenders .. pretender .. ","
		end

		local political_state_id = self.config.id -- "political_states" or "hatti_political_states"
		local legitimacy_obj = self.legitimacy_system

		cm:notify_legitimacy_war_updated(faction_key,
										 self.persistent.current_ruling_faction_key,
										 war_event_state,
                                         self.persistent.start_turn_of_legitimacy_war,
										 legitimacy_obj:get_legitimacy(faction_key),
										 legitimacy_obj:get_legitimacy(self.persistent.current_ruling_faction_key),
										 attitude_towards_ruler,
										 comma_separated_pretenders,
										 political_state_id)
	end,

	setup_stable_state_runner_up = function(self)
		local runner_up
		local runner_up_legitimacy = -1

		for faction_key, _ in pairs(legitimacy_choice:get_factions_with_legitimacy_object(self.legitimacy_system)) do
			if not self:is_sitting_ruler(faction_key) and self.legitimacy_system:get_legitimacy(faction_key) > runner_up_legitimacy then
				runner_up = faction_key
				runner_up_legitimacy = self.legitimacy_system:get_legitimacy(faction_key)
			end
		end

		if runner_up then
			cm:set_script_state(self.shared_states_suffixed.ruler_runner_up, runner_up)
		else
			cm:remove_script_state(self.shared_states_suffixed.ruler_runner_up)
		end
	end,

	send_message_event = function(self, message_event_data, is_persistent)
		self:send_message_event_to_paths_including(message_event_data, is_persistent, { [self.legitimacy_system.config.id] = true })
	end,

	send_message_event_to_other_paths = function(self, message_event_data, is_persistent)
		self:send_message_event_to_paths_excluding(message_event_data, is_persistent, { [self.legitimacy_system.config.id] = true })
	end,

	id = crown.id,

	notify_mechanics = crown.notify_mechanics,

	send_message_event_to_paths_including = crown.send_message_event_to_paths_including,

	send_message_event_to_paths_excluding = crown.send_message_event_to_paths_excluding,

	error_message = crown.error_message,
}
