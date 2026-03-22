out("Loading phar_court_ai.lua") 

-- this file immitates the Faction AIs from C++, intended for generating dilemmas, plots and other actions for the Court 
-- main file phar.court.lua

court.dilemma_generation = 
{
	dilemma_config = 
	{
		-- this is actually how much the chance increases each turn
		chance_to_generate_per_turn = 10,
		-- dilemmas without explicit weight use this one
		default_weight = 1,
		get_dilemmas_without_positions = true,
	},

	possible_dilemas = 
	{
		--gold_for_action
		{
			court_ai_dilemma_type = "gold_for_action",
			actions_required = 1,
			-- default name, if accessed without a specific court, or the court does not have an override
			db_dilemma_key = "phar_main_court_dilemma_gold_for_action_egypt",
			-- some courts can have different dilemma keys than the default
			-- map court_name to dilemma key - as this dilemma has different setup (DB strings) for different courts
			-- you can have the same dilemma key for different courts
			override_dilemma_keys = 
			{
				egyptian_court = "phar_main_court_dilemma_gold_for_action_egypt",
				hittite_court = "phar_main_court_dilemma_gold_for_action_hatti",
				aegean_court = "phar_map_court_dilemma_gold_for_action_aegean",
				mesopotamian_court = "phar_map_court_dilemma_gold_for_action_meso",
			},
			log_localization_accept_key = "phar_main_court_dilemma_gold_for_action_log_accept",
			accept_key = "dummy_phar_court_gold_for_action_accept",
			weight = 2,
			gain_resource_record = "phar_main_court_dilemma_gold_for_action",

			can_have_dilemma = function(self, faction_key, called_from_active_dilemma)
				if not court.util_functions.can_use_court_actions(faction_key, self.actions_required) then
					return false
				end
				return true
			end,

			on_dilemma_generated = function(self, faction_key)
				-- this is the general text for accepting the dilemma
				local accept_payload = "payload{text_display{ lookup " .. self.accept_key
				accept_payload = accept_payload .. ";}"

				accept_payload = accept_payload .. "faction_pooled_resource_transaction{"
				accept_payload = accept_payload .. "resource_cost ".. self.gain_resource_record
				accept_payload = accept_payload .. ";}}"

				-- rejecting the dilemma does nothing so we send an empty payload
				local reject_payload = "payload{}"
				return accept_payload, reject_payload
			end,

			on_dilemma_resolved = function(self, context)
				local choice = context:choice()
				if choice ~= 0 then
					-- by design, for this dilemma only the first choice does something
					return
				end
				court.output("Dilemma '" .. self.court_ai_dilemma_type .. "' resolved selling a court action")
				local faction_interface = context:faction()
				local faction_key = faction_interface:name()
				local court_obj = court.util_functions.get_faction_court_for_faction(faction_key)
				if not court.util_functions.can_use_court_actions(faction_key, self.actions_required) then
					-- not enough actions
					court.output("Error: not enough court actions for gold_for_action dilemma", 10)
					return
				end

				court.util_functions.increase_used_court_actions_for_faction(court_obj, faction_key, self.actions_required)
				-- the gold for the reward is given by the payload, we don't have to do it manually here
				court.log_functions.log_court_action("dilemma_resolved", faction_key, "", self.court_ai_dilemma_type, choice)
			end,
		},

		-- plot_suggestion
		{
			court_ai_dilemma_type = "plot_suggestion",
			-- default name, if accessed without a specific court, or the court does not have an override
			db_dilemma_key = "phar_main_court_dilemma_plot_suggest_egypt",
			-- some courts can have different dilemma keys than the default
			-- map court_name to dilemma key - as this dilemma has different setup (DB strings) for different courts
			-- you can have the same dilemma key for different courts
			override_dilemma_keys = 
			{
				egyptian_court = "phar_main_court_dilemma_plot_suggest_egypt",
				hittite_court = "phar_main_court_dilemma_plot_suggest_hatti",
				aegean_court = "phar_map_court_dilemma_plot_suggest_aegean",
				mesopotamian_court = "phar_map_court_dilemma_plot_suggest_meso",
			},
			accept_key = "dummy_phar_court_plot_suggest_accept",
			accept_key2 = "dummy_phar_court_plot_suggest_accept2",
			actions_required = 1,
			-- the dilemma is available if the number of own plots are no more than this
			max_own_plots = 1,
			-- by design same as gold_for_action
			gain_resource_record = "phar_main_court_dilemma_gold_for_action",
			weight = 1,

			plots_suggested = 
			{
				{
					plot_suggested = "threaten",
					plot_weight = 4,
				},
				{
					plot_suggested = "assassinate",
					plot_weight = 1,
				},
				{
					plot_suggested = "embezzle",
					plot_weight = 1,
				},
				{
					plot_suggested = "discredit",
					plot_weight = 4,
				},
				{
					plot_suggested = "blackmail",
					plot_weight = 4,
				},
			},

			-- if called_from_active_dilemma is nil, we are checking if we can trigger it
			-- if called_from_active_dilemma is true, we are checking while resolving this dilemma (and is still considered active), so should ignore all conditions of not allowing during an active dilemma
			can_have_dilemma = function(self, faction_key, called_from_active_dilemma)
				-- need at least self.actions_required free actions
				if not court.util_functions.can_use_court_actions(faction_key, self.actions_required) then
					return false
				end
				-- we can have no more than max_own_plots to allow this dilemma
				local owned_plots = court.plot_functions:get_plots_owned_by_faction(faction_key)
				if #owned_plots > self.max_own_plots then
					return false
				end

				local court_obj = court.util_functions.get_faction_court_for_faction(faction_key)

				local plot_suggested, valid_position = self:get_valid_plot_and_target(court_obj, faction_key, called_from_active_dilemma)
				if (not plot_suggested) or (not valid_position) then
					return false
				end
				return true
			end,

			-- returns a plot_key and position_name that can be used by this faction
			-- or nil, if there are none possible
			get_valid_plot_and_target = function(self, court_obj, faction_key, called_from_dilemma)
				local accessible_plots = court.plot_functions.get_list_of_accessible_plots(faction_key)
				local weighted_plots = weighted_list:new()
				for _, plot_table in ipairs(self.plots_suggested) do
					if table_find(accessible_plots, plot_table.plot_suggested) then
						weighted_plots:add_item(plot_table.plot_suggested, plot_table.plot_weight)
					end
				end

				while #weighted_plots.items > 0 do
					local plot_key, index = weighted_plots:weighted_select()
					local valid_position = court.plot_functions.get_valid_plot_target(court_obj, faction_key, plot_key, called_from_dilemma)
					if valid_position then
						return plot_key, valid_position
					end

					-- this position could not be targeted by this plot, removing it and trying again until none remain
					weighted_plots:remove_item(index)
				end
				return nil
			end,

			on_dilemma_generated = function(self, faction_key)
				local court_obj = court.util_functions.get_faction_court_for_faction(faction_key)
				local faction_table = court.util_functions.get_faction_persistent_data(faction_key)
				local plot_suggested, target_position_obj = self:get_valid_plot_and_target(court_obj, faction_key, true)
				faction_table.plot_suggested_target = target_position_obj.name
				faction_table.plot_suggested = plot_suggested

				local plot_config = court.plots:get_plot_config_by_key(plot_suggested)
				local plot_localization_key = plot_config.localization_key
				local position_localization_key = court.position_functions.get_position_name_localization_key(target_position_obj, court_obj)

				local accept_payload = "payload{text_display{ lookup " .. self.accept_key
				-- we add the parameters for the dilemma acceptance payload
				local plot_name_source = court.plot_functions.get_plot_name_source(plot_config, court_obj)
				accept_payload = accept_payload .. "#text:" .. plot_name_source
				accept_payload = accept_payload .. "#text:".. position_localization_key
				accept_payload = accept_payload .. "#faction:".. target_position_obj.persistent.current_holder_faction
				accept_payload = accept_payload .. ";}"

				accept_payload = accept_payload .. "text_display{ lookup " .. self.accept_key2 .. ";}"

				accept_payload = accept_payload .. "faction_pooled_resource_transaction{"
				accept_payload = accept_payload .. "resource_cost ".. self.gain_resource_record
				accept_payload = accept_payload .. ";}}"

				-- rejecting the dilemma does nothing so we send an empty payload
				local reject_payload = "payload{}"
				return accept_payload, reject_payload
			end,

			on_dilemma_resolved = function(self, context)
				local faction_interface = context:faction()
				local faction_key = faction_interface:name()

				local faction_table = court.util_functions.get_faction_persistent_data(faction_key)
				local court_position_str = faction_table.plot_suggested_target
				local plot_suggested = faction_table.plot_suggested
				faction_table.plot_suggested_target = nil
				faction_table.plot_suggested = nil

				local choice = context:choice()
				if choice ~= 0 then
					-- by design, for this dilemma only the first choice does something
					return
				end

				if not self:can_have_dilemma(faction_key, true) then
					court.output("Error: not enough court actions for gold_for_action dilemma", 10)
					return
				end

				local court_obj = court.util_functions.get_faction_court_for_faction(faction_key)
				local plot_id = court.plot_functions.create_plot(court_obj.court_name, faction_key, plot_suggested, court_position_str, true, true)
				if plot_id then
				court.log_functions.log_court_action("dilemma_resolved", faction_key, "", self.court_ai_dilemma_type, choice)
				court.output("Dilemma '" .. self.court_ai_dilemma_type .. "' resolved creating plot id: ".. plot_id)
				else
					court.output("ERROR:Dilemma '" .. self.court_ai_dilemma_type .. "' failed to create a plot!", 100)
				end
			end,
		},

		-- offer_gossip
		{
			court_ai_dilemma_type = "offer_gossip",
			-- default name, if accessed without a specific court, or the court does not have an override
			db_dilemma_key = "phar_main_court_dilemma_gossip_offer_egypt",
			-- some courts can have different dilemma keys than the default
			-- map court_name to dilemma key - as this dilemma has different setup (DB strings) for different courts
			-- you can have the same dilemma key for different courts
			override_dilemma_keys = 
			{
				egyptian_court = "phar_main_court_dilemma_gossip_offer_egypt",
				hittite_court = "phar_main_court_dilemma_gossip_offer_hatti",
				aegean_court = "phar_map_court_dilemma_gossip_offer_aegean",
				mesopotamian_court = "phar_map_court_dilemma_gossip_offer_meso",
			},
			log_localization_accept_key = "phar_main_court_dilemma_offer_gossip_log_accept",
			accept_key = "dummy_phar_court_gossip_offer_accept",
			accept_key2 = "dummy_phar_court_gossip_offer_accept2",
			actions_required = 1,
			weight = 1,

			can_have_dilemma = function(self, faction_key, called_from_active_dilemma)
				-- need at least self.actions_required free actions
				if not court.util_functions.can_use_court_actions(faction_key, self.actions_required) then
					return false
				end
				-- need at least 1 plot that can be revealed the faction (not owned by it and not revealed to it)
				local court_obj = court.util_functions.get_faction_court_for_faction(faction_key)
				for plot_resolve_turn, plots_by_resolve_turn in dpairs(court_obj.persistent.plots_persistent_data_by_resolve_turn) do
					for plot_key, plots_by_key in dpairs(plots_by_resolve_turn) do
						for plot_index, plot_persistent_data in ipairs(plots_by_key) do
							if plot_persistent_data.plotting_faction ~= faction_key
								and (not table_find(plot_persistent_data.revealed_to, faction_key))
							then
								return true
							end
						end
					end
				end
				return false
			end,

			on_dilemma_generated = function(self, faction_key)
				-- this is the general text for accepting the dilemma
				local accept_payload = "payload{text_display{ lookup " .. self.accept_key
				accept_payload = accept_payload .. ";}"

				accept_payload =  accept_payload .. "text_display{ lookup " .. self.accept_key2 .. ";}}"

				-- rejecting the dilemma does nothing so we send an empty payload
				local reject_payload = "payload{}"
				return accept_payload, reject_payload
			end,

			on_dilemma_resolved = function(self, context)
				local choice = context:choice()
				if choice ~= 0 then
					-- by design, for this dilemma only the first choice does something
					return
				end

				court.output("Dilemma '" .. self.court_ai_dilemma_type .. "' resolved accepting gossip")
				local faction_key = context:faction():name()
				if not court.util_functions.can_use_court_actions(faction_key, self.actions_required) then
					-- not enough actions
					court.output("Error: not enough court actions for gold_for_action dilemma", 10)
					return
				end

				local court_obj = court.util_functions.get_faction_court_for_faction(faction_key)
				court.util_functions.increase_used_court_actions_for_faction(court_obj, faction_key, self.actions_required)

				-- we reveal all plots to the faction
				for plot_resolve_turn, plots_by_resolve_turn in dpairs(court_obj.persistent.plots_persistent_data_by_resolve_turn) do
					for plot_key, plots_of_type in dpairs(plots_by_resolve_turn) do
						for plot_index, plot_persistent_data in ipairs(plots_of_type) do
							if plot_persistent_data.plotting_faction ~= faction_key
								and (not table_find(plot_persistent_data.revealed_to, faction_key))
							then
								court.plot_functions:reveal_plot_to_faction(court_obj.court_name, faction_key, plot_persistent_data.plot_id)
							end
						end
					end
				end

				court.log_functions.log_court_action("dilemma_resolved", faction_key, "", self.court_ai_dilemma_type, choice)
			end,
		},

		-- discourage_plot
		{
			court_ai_dilemma_type = "discourage_plot",
			-- default name, if accessed without a specific court, or the court does not have an override
			db_dilemma_key = "phar_main_court_dilemma_discourage_offer_hatti",
			-- some courts can have different dilemma keys than the default
			-- map court_name to dilemma key - as this dilemma has different setup (DB strings) for different courts
			-- you can have the same dilemma key for different courts
			override_dilemma_keys = 
			{
				egyptian_court = "phar_main_court_dilemma_discourage_offer_egypt",
				hittite_court = "phar_main_court_dilemma_discourage_offer_hatti",
				aegean_court = "phar_map_court_dilemma_discourage_offer_aegean",
				mesopotamian_court = "phar_map_court_dilemma_discourage_offer_meso",
			},
			log_localization_accept_key = "phar_main_court_dilemma_discourage_plot_log_accept",
			accept_key = "dummy_phar_court_discourage_plot_accept",
			accept_key2 = "dummy_phar_court_discourage_plot_accept2",
			reject_key = "dummy_phar_court_discourage_plot_reject",
			regard_change_on_accept = 60,
			regard_change_on_decline = -60,
			gain_resource_record = "phar_main_court_dilemma_discourage_plot",
			weight = 4,

			can_have_dilemma = function(self, faction_key, called_from_active_dilemma)
				local owned_plots = court.plot_functions:get_plots_owned_by_faction(faction_key)
				if #owned_plots <= 0 then
					return false
				end
				return true
			end,

			on_dilemma_generated = function(self, faction_key)
				local court_obj = court.util_functions.get_faction_court_for_faction(faction_key)
				local faction_table = court.util_functions.get_faction_persistent_data(faction_key)
				local owned_plots = court.plot_functions:get_plots_owned_by_faction(faction_key)

				local random_index = cm:model():random_int(1, #owned_plots)
				local random_plot = owned_plots[random_index]
				faction_table.targeted_plot_id = random_plot.plot_id

				local targeted_position_str = random_plot.targeted_position
				local position_obj = court.util_functions.get_court_position(court_obj, targeted_position_str)
				local holder_faction_key = position_obj.persistent.current_holder_faction
				local plot_config = court.plots:get_plot_config_by_key(random_plot.plot_key)
				local plot_name_source = court.plot_functions.get_plot_name_source(plot_config, court_obj)
				local position_localization_key = court.position_functions.get_position_name_localization_key(position_obj, court_obj)

				-- this is the general text for accepting the dilemma
				local accept_payload = "payload{text_display{ lookup " .. self.accept_key
				-- we add the parameters for the dilemma acceptance payload
				accept_payload = accept_payload .. "#text:" ..  plot_name_source
				accept_payload = accept_payload .. "#text:".. position_localization_key
				accept_payload = accept_payload .. "#faction:".. holder_faction_key
				accept_payload = accept_payload .. ";}"

				accept_payload =  accept_payload .. "text_display{ lookup " .. self.accept_key2
				accept_payload = accept_payload .. "#text:".. position_localization_key
				accept_payload = accept_payload .. "#faction:".. holder_faction_key
				accept_payload = accept_payload .. "#text:".. self.regard_change_on_accept
				accept_payload =  accept_payload .. ";}"

				accept_payload = accept_payload .. "faction_pooled_resource_transaction{"
				accept_payload = accept_payload .. "resource_cost ".. self.gain_resource_record
				accept_payload = accept_payload .. ";}}"

				local reject_payload = "payload{text_display{ lookup " .. self.reject_key
				reject_payload = reject_payload .. "#text:".. position_localization_key
				reject_payload = reject_payload .. "#faction:".. holder_faction_key
				reject_payload = reject_payload .. "#text:".. (-self.regard_change_on_decline)

				reject_payload = reject_payload .. ";}}"
				return accept_payload, reject_payload
			end,

			on_dilemma_resolved = function(self, context)
				local faction_key = context:faction():name()
				local court_obj = court.util_functions.get_faction_court_for_faction(faction_key)
				local faction_table = court.util_functions.get_faction_persistent_data(faction_key)
				local targeted_plot_id = faction_table.targeted_plot_id
				faction_table.targeted_plot_id = nil
				local target_court_name = court_obj.court_name
				local plot_persistent_data = court.plot_functions:get_plot_persistent_data(target_court_name, targeted_plot_id)
				local targeted_position_str = plot_persistent_data.targeted_position
				local choice = context:choice()
				if choice ~= 0 then
					court.position_functions.change_regard_towards_faction_by_name(court_obj, targeted_position_str, faction_key, self.regard_change_on_decline)
					return
				end

				court.position_functions.change_regard_towards_faction_by_name(court_obj, targeted_position_str, faction_key, self.regard_change_on_accept)
				court.plot_functions:remove_plot(target_court_name, targeted_plot_id)
				court.log_functions.log_court_action("dilemma_resolved", faction_key, targeted_position_str, self.court_ai_dilemma_type, plot_persistent_data)
				court.output("Dilemma '" .. self.court_ai_dilemma_type .. "' resolved removing plot")
			end,

			get_dilemma_reward_obj = function(self)
				local base_reward_obj = cm:create_new_custom_resource_cost()
				if self.gain_resource_record then
					base_reward_obj:get_cost_from_record(self.gain_resource_record)
				end
				return base_reward_obj
			end,

			get_log_string = function(self, logged_item)
				-- this is the data for the plot the dilemma cancelled
				local plot_cancelled_data = logged_item.additional_params[2]
				local plot_key = plot_cancelled_data.plot_key
				local plot_config = court.plots:get_plot_config_by_key(plot_key)
				local court_obj = court.util_functions.get_faction_court_by_name(plot_cancelled_data.target_court_name)
				local plot_localized_name = court.plot_functions.get_localized_plot_name(plot_config, court.ui.data.faction_court)
				local position_obj = court.util_functions.get_court_position(court_obj, plot_cancelled_data.targeted_position)
				local position_localized_name, _ = court.position_functions.get_localized_position_name(position_obj, court_obj)
				local localized_message_text, _ = get_localised_random_string_and_source_formatted(self.log_localization_accept_key, plot_localized_name, position_localized_name)
				return localized_message_text
			end,
		},
	},

	on_turn_start = function(faction_obj)
		if (not faction_obj) or (not faction_obj:is_human()) then
			return
		end

		local faction_name = faction_obj:name()
		local court_obj = court.util_functions.get_faction_court_for_faction(faction_name)
		-- no court - no court dilemmas
		if not court_obj then
			return
		end

		local feature_available = feature_unlock.is_feature_unlocked_for_faction(faction_name, feature_ids_config.court)
		if not feature_available then
			-- the faction has not unlocked the court, it should not get dilemmas
			return
		end

		local faction_table = court.util_functions.get_faction_persistent_data(faction_name)
		-- a config controls if we get dilemmas without positions
		-- if it is not set, we check for positions
		if (not court.dilemma_generation.dilemma_config.get_dilemmas_without_positions)
			and ((not faction_table.owned_positions)
				or #faction_table.owned_positions <= 0)
		then
			return
		end

		local should_generate_for_faction = court.dilemma_generation.should_generate_dilemma(faction_table)
		if not should_generate_for_faction then
			local chance_to_generate = faction_table.chance_to_get_dilemma or 0
			faction_table.chance_to_get_dilemma = chance_to_generate + court.dilemma_generation.dilemma_config.chance_to_generate_per_turn
			return
		end
		if court.dilemma_generation.generate_dilema(faction_table, court_obj) then
			faction_table.chance_to_get_dilemma = 0
		end
	end,

	get_dilemma_by_court_ai_type = function(court_ai_dilemma_type, supress_output)
		-- this will need to be rewritten if we have several dilemmas of the same type
		local found_dilemma = table_find(court.dilemma_generation.possible_dilemas, function(e) return e.court_ai_dilemma_type == court_ai_dilemma_type end)

		if (not found_dilemma) and (not supress_output) then
			court.output("Error - court_ai_dilemma_type '" .. court_ai_dilemma_type .. "' not found!", 10)
		end
		return found_dilemma
	end,

	get_dilemma_by_db_key = function(db_dilemma_key)

		local found_dilemma = table_find(court.dilemma_generation.possible_dilemas, 
			function(dilemma)
				if dilemma.db_dilemma_key == db_dilemma_key then 
					return true
				end
				for court_name, dilemma_key in dpairs(dilemma.override_dilemma_keys) do
					if db_dilemma_key == dilemma_key then
						return true
					end
				end
				return false
			end
		)
		return found_dilemma
	end,

	-- sees if we need to generate a dilemma for the faction
	should_generate_dilemma = function(faction_table)
		local has_pending_dilemma = court.util_functions.is_dilemma_active()
		if has_pending_dilemma then
			return false
		end
		if court_cheat.force_humans_generate_dilemma then
			court_cheat.force_humans_generate_dilemma = nil
			return true
		end
		local chance_to_generate = faction_table.chance_to_get_dilemma or 0
		local random_chance = cm:model():random_int(1, 100)
		local should_generate = random_chance < chance_to_generate
		return should_generate
	end,

	-- tries to generate and trigger a dilemma for the faction
	generate_dilema = function(faction_table, court_obj)
		if #court.dilemma_generation.possible_dilemas == 0 then
			court.output("Error: no possible ai dilemmas found", 10)
			return false
		end

		local dilemma_config
		if court_cheat.ai_dilemmas.forced_dilemma then
			dilemma_config = court.dilemma_generation.get_dilemma_by_court_ai_type(court_cheat.ai_dilemmas.forced_dilemma)
			if not dilemma_config then
				script_error(" no AI dilemma found with key " .. court_cheat.ai_dilemmas.forced_dilemma)
				return
			end
		else
			local weighted_dilemmas = weighted_list:new()
			for _, dilemma in ipairs(court.dilemma_generation.possible_dilemas) do
				if (not is_function(dilemma.can_have_dilemma))
					or dilemma:can_have_dilemma(faction_table.faction_key)
				then
					local weight = dilemma.weight or court.dilemma_generation.dilemma_config.default_weight
					weighted_dilemmas:add_item(dilemma, weight)
				end
			end

			if #weighted_dilemmas.items <= 0 then
				court.output("No valid ai dilemmas to generate")
				return false
			end

			dilemma_config, _ = weighted_dilemmas:weighted_select()
		end

		local accept_payload = nil
		local reject_payload = nil
		if (is_function(dilemma_config.on_dilemma_generated)) then
			accept_payload, reject_payload = dilemma_config:on_dilemma_generated(faction_table.faction_key)
		end

		court.output("generated ai dilemma:" .. dilemma_config.court_ai_dilemma_type)
		local db_dilemma_key
		if dilemma_config.override_dilemma_keys and dilemma_config.override_dilemma_keys[court_obj.court_name] then
			db_dilemma_key = dilemma_config.override_dilemma_keys[court_obj.court_name]
		else
			db_dilemma_key = dilemma_config.db_dilemma_key
		end

		local has_pending_dilemma = court.util_functions.is_dilemma_active()
		if has_pending_dilemma then
			court.output("court ai dilemma not triggered, there already is a dilemma active!", 10)
			return false
		end

		if accept_payload and reject_payload then
			-- we must cache the dilemma, because the player may reload the autosave and we must create it anew
			court.util_functions.add_pending_dilemma(faction_table.faction_key, db_dilemma_key, accept_payload, reject_payload)
			cm:trigger_custom_dilemma(faction_table.faction_key, db_dilemma_key, accept_payload, reject_payload)
			return true
		end

		local faction_obj = cm:get_faction(faction_table.faction_key)
		cm:trigger_dilemma_with_targets(faction_obj:command_queue_index(), db_dilemma_key, 0, 0, 0, 0, 0, 0, nil, 0)
		return true
	end,
}

court.plot_generation = 
{
	plot_generation_config = 
	{
		-- these values are for each turn that we attempt to generate plots, not per Shemsu Hor
		-- you can override them in the data in plot_generation_turns
		plots_generated_min = 1,
		plots_generated_max = 2,
		-- special access plots are unlocked by requests, this is the chance in % for the AI to have access to them
		chance_to_unlock_special_access_plots = 10,
		plot_generation_turn_start = 13,

		-- this contains the turns-to-shemsu-hor when the plots are generated
		plot_generation_turns = 
		{
			-- DO NOT SET PLOTS TO BE CREATED 0, the system will try to generate them on Shemsu Hor and fail, plots are not allowed on Shemsu Hor

			-- 5, so 1 turn after Shemsu Hor
			{
				turns_to_shemsu_hor = 5,
				max_plot_level = 3,
				-- you can override the numbers here, like:
				-- plots_generated_min = 1,
				-- plots_generated_max = 1,
			},
			-- 3,since the Shemsu Hor period is 6 turns, this is 3 turns after the last Shemsu Hor
			{
				turns_to_shemsu_hor = 3,
				max_plot_level = 5,
			},
		},
		one_year_turn_plot_generation = 
		{
			plot_generation_cooldown = 3,
			max_plot_level = 5,
		},
	},

	-- checks if we need to generate plots this turn, and rolls for a number
	get_plot_generation_data = function(court_obj)
		if court_cheat.plots.force_against_pos then
			return court.plot_generation.plot_generation_config.one_year_turn_plot_generation
		end
		if shemsu_hor.is_active then
			local turns_to_shmesu_hor = shemsu_hor.get_turns_to_shemsu_hor()
			local generation_data = table_find(court.plot_generation.plot_generation_config.plot_generation_turns, function(e) return e.turns_to_shemsu_hor == turns_to_shmesu_hor end)
			return generation_data
		end

		-- there is no Shemsu hor, plot generation uses cooldown
		local next_plot_generation_turn = court_obj.persistent.next_plot_generation_turn
		local current_turn = cm:model():turn_number()
		if is_number(next_plot_generation_turn) and current_turn < next_plot_generation_turn then
			-- fewer than [plot_generation_cooldown] turns passed since the last plot generation, no plots this turn
			return nil
		end
		return court.plot_generation.plot_generation_config.one_year_turn_plot_generation
	end,

	-- sees if we need to generate a plot
	generate_ai_plots = function(court_obj)
		if court_cheat.plots.stop_generation then
			return
		end

		local turn = cm:model():turn_number()
		if court.plot_generation.plot_generation_config.plot_generation_turn_start
			and turn < court.plot_generation.plot_generation_config.plot_generation_turn_start
			and court_cheat.plots.force_against_pos == nil -- a cheat may skip the turn settings
		then
			return
		end

		local plot_generation_data = court.plot_generation.get_plot_generation_data(court_obj)
		if not plot_generation_data then 
			return 
		end
		local min_plots = plot_generation_data.plots_generated_min or court.plot_generation.plot_generation_config.plots_generated_min
		local max_plots = plot_generation_data.plots_generated_max or court.plot_generation.plot_generation_config.plots_generated_max
		local plots_to_generate_num = cm:model():random_int(min_plots, max_plots)

		local plots_generated = false
		local positions_trying_to_plot = true
		for i = 1, plots_to_generate_num do
			local new_plot_id = -1
			-- we try to generate plots from the positions first 
			if positions_trying_to_plot then
				new_plot_id = court.plot_generation.generate_plot_from_positions(court_obj, plot_generation_data)
			end
			-- if they are unable, try the positionless factions
			if new_plot_id < 0 then
				-- we mark the positions as unable to generate a plot - we don't try them next time
				positions_trying_to_plot = false
				new_plot_id = court.plot_generation.generate_plot_from_positionless_factions(court_obj, plot_generation_data)
			end

			if new_plot_id < 0 then
				-- no valid plot can be generated by anyone, there is no point trying again
				break
			else
				plots_generated = true
			end
		end

		if plots_generated then
			local plot_generation_cooldown = court.plot_generation.plot_generation_config.one_year_turn_plot_generation.plot_generation_cooldown
			court_obj.persistent.next_plot_generation_turn = cm:model():turn_number() + plot_generation_cooldown
		end
	end,

	-- tries to generate a plot by any position against any position
	generate_plot_from_positions = function(court_obj, plot_generation_data)
		-- we gather the position objects that can start a plot - so no empty positions
		local valid_plotter_factions = {}
		for _, position_obj in ipairs(court_obj.positions) do
			if position_obj.persistent.current_holder_faction then
				local faction_obj = cm:get_faction(position_obj.persistent.current_holder_faction)
				-- holder factions should not be nil or null interface, we do it just in case
				-- and we should definitely not generate on behalf of human factions
				if faction_obj
					and (not faction_obj:is_null_interface())
					and (not faction_obj:is_human())
				then
					table.insert(valid_plotter_factions, position_obj.persistent.current_holder_faction)
				end
			end
		end
		
		local result = court.plot_generation.generate_plot_by_any(court_obj, valid_plotter_factions)
		return result
	end,

	generate_plot_from_positionless_factions = function(court_obj, plot_generation_data)
		-- we gather the factions that can start a plot - so in the same court and without a position
		local valid_plotter_factions = {}
		local faction_list = cm:model():world():faction_list();
		for i = 0, faction_list:num_items() - 1 do
		local faction_obj = faction_list:item_at(i);
			if faction_obj
				and (not faction_obj:is_null_interface())
				and (not faction_obj:is_human())
			then
				local faction_key = faction_obj:name()
				local faction_court = court.util_functions.get_faction_court_for_faction(faction_key)
				if faction_court == court_obj then
					local faction_table = court.util_functions.get_faction_persistent_data(faction_key)
					if (not faction_table.owned_positions)
						or #faction_table.owned_positions <= 0
					then
						table.insert(valid_plotter_factions, faction_key)
					end
				end
			end
		end
		
		local result = court.plot_generation.generate_plot_by_any(court_obj, valid_plotter_factions, plot_generation_data)
		return result
	end,

	generate_plot_by_any = function(court_obj, valid_plotter_factions, plot_generation_data)
		while #valid_plotter_factions > 0 do
			local plotter_position_index = cm:model():random_int(1, #valid_plotter_factions)
			local plotter_faction_key = valid_plotter_factions[plotter_position_index]
			local new_plot_id = court.plot_generation.generate_plot_by(court_obj, plotter_faction_key, plot_generation_data)
			if new_plot_id >= 0 then
				return new_plot_id
			end

			-- this position could not generate plots, removing it and trying again until none remain
			table.remove(valid_plotter_factions, plotter_position_index)
		end

		return -1
	end,

	-- tries to generate a plot by the specified faction against any position
	generate_plot_by = function(court_obj, plotting_faction_key, plot_generation_data)
		local weighted_targets_list = weighted_list:new()
		for _, position in ipairs(court_obj.positions) do
			local holder_faction = position.persistent.current_holder_faction
			if holder_faction then
				local faction_obj = cm:get_faction(holder_faction)
				if faction_obj then
					local feature_available = feature_unlock.is_feature_unlocked_for_faction(holder_faction, feature_ids_config.court)
					-- only plots against filled positions, that are from another faction
					-- this also covers the case where the plotter and target are the same (same holder faction)
					if holder_faction 
						and holder_faction ~= plotting_faction_key
						and feature_available
					then
						if court_cheat.plots.force_against_pos == nil -- no cheat
							or court_cheat.plots.force_against_pos == position.name -- cheat against this position
						then
							local faction_target_weight = court.util_functions.get_property(holder_faction, "ai_plot_target_weight") or 1
							weighted_targets_list:add_item(position, faction_target_weight)
						end
					end
				end
			end
		end

		while #weighted_targets_list.items > 0 do
			local target_position, index = weighted_targets_list:weighted_select()
			local skip_payment= false
			local ignore_court_actions = false
			if court_cheat.plots.force_against_pos then
				skip_payment = true
				ignore_court_actions = true
			end
			local new_plot_id = court.plot_generation.generate_plot_against(court_obj, plotting_faction_key, target_position, skip_payment, plot_generation_data, ignore_court_actions)
			if new_plot_id >= 0 then
				return new_plot_id
			end

			-- this position could not be targeted by plots, removing it and trying again until none remain
			weighted_targets_list:remove_item(index)
		end

		return -1
	end,

	-- tries to generate a plot by the specified faction against another specified position
	generate_plot_against = function(court_obj, plotting_faction, target_position, skip_payment, plot_generation_data, ignore_court_actions)
		local special_access_chance = court.plot_generation.plot_generation_config.chance_to_unlock_special_access_plots
		local accessible_plots = court.plot_functions.get_list_of_accessible_plots(plotting_faction, special_access_chance)
		while #accessible_plots > 0 do
			local plot_id_index = cm:model():random_int(1, #accessible_plots)
			local plot_id = accessible_plots[plot_id_index]
			local plot_config = court.plots:get_plot_config_by_key(plot_id)
			local plot_can_be_used, _ = court.plot_functions.can_faction_use_plot(court_obj, plotting_faction, plot_config.plot_key, target_position.name, skip_payment, false, ignore_court_actions)

			if plot_can_be_used then
				local new_plot_id, plot_persistent_data  = court.plot_functions.create_plot(court_obj.court_name, 
					plotting_faction, 
					plot_config.plot_key, 
					target_position.name,
					skip_payment,
					false,
					ignore_court_actions
				)

				if plot_persistent_data then
					local starting_level = court.plot_functions:get_plot_starting_level(court_obj, plotting_faction, plot_config)
					local max_level = court.plot_functions:get_plot_max_level(plotting_faction)
					-- plot_generation_data may be nil if called from the provoke/insult intrigue. otherwise the normal plot generation may limit the max level of the plot
					if plot_generation_data 
						and plot_generation_data.max_plot_level
						and plot_generation_data.max_plot_level < max_level
					then
						max_level = plot_generation_data.max_plot_level
					end
					local plot_level = cm:model():random_int(starting_level, max_level)
					plot_persistent_data.plot_level = plot_level
					return new_plot_id
				end
			end

			-- this plot did not work out, removing it and trying again until none remain
			table.remove(accessible_plots, plot_id_index)
		end

		return -1
	end,
}

court.ai_position_claims = 
{
	ai_position_claims_turn_start = 13,
	process_ai_claims = function()
		for _, court_obj in ipairs(court.all_courts) do
			court.ai_position_claims.process_ai_claims_for_court(court_obj)
		end
	end,

	process_ai_claims_for_court = function(court_obj)
		local current_turn = cm:model():turn_number()
		if current_turn < court.ai_position_claims.ai_position_claims_turn_start then
			return
		end

		local candidate_factions = {}
		local faction_list = cm:model():world():faction_list()
		for i = 0, faction_list:num_items() - 1 do
			local faction_obj = faction_list:item_at(i)
			local eligible_character, claim_directly = court.ai_position_claims.get_faction_character_to_claim_position(court_obj, faction_obj)
			if eligible_character then
				local candidate_value = court.position_functions.get_faction_claim_candidate_value(court_obj, faction_obj:name())
				if (not is_number(court.config.claim_position_cost.min_valid_score_ai_claim)) 
					or candidate_value >= court.config.claim_position_cost.min_valid_score_ai_claims
				then
					local candidate_table = {
						faction_obj = faction_obj,
						candidate_value = candidate_value,
						character_obj = eligible_character,
						claim_directly = claim_directly,
					}
					table.insert(candidate_factions, candidate_table)
				end
			end
		end

		candidate_factions = table_stable_sort(candidate_factions, function(a, b) return a.candidate_value > b.candidate_value end)
		-- give vacant positions in order of score
		for _, position_obj in ipairs(court_obj.positions) do
			if table.is_empty(candidate_factions) then
				break
			end

			local candidate_table, index = court.ai_position_claims.get_valid_contender_for_court(court_obj, position_obj, candidate_factions)
			if candidate_table then
				local faction_obj = candidate_table.faction_obj
				local faction_key = faction_obj:name()
				local success = nil
				if candidate_table.claim_directly then
					-- the last parameter here indicates the faction does not pay for the position
					success = court.position_functions.claim_position(court_obj, 
						faction_key, 
						position_obj.name,
						false,
						true)
				else
					success = court.position_functions.give_own_character_a_position(
						court_obj,
						faction_key,
						candidate_table.character_obj,
						position_obj.name,
						false, -- skip_checks
						true -- skip_payment
					)
				end

				if success then
					table.remove(candidate_factions, index)
					court.output("faction '".. faction_key .. "' claimed a position automatically")
				else
					court.output("faction '".. faction_key .. "' could not claim position")
				end
			end
		end
	end,

	-- returns the most suitable element in candidate_factions
	-- second return value is the index in candidate_factions
	get_valid_contender_for_court = function(court_obj, position_obj, candidate_factions)
		if position_obj.persistent.current_holder then
			-- occupied positions can't be claimed
			return nil
		end

		if position_obj.position_config.claim_forbidden then
			-- some positions (court leaders) can't be claimed from the court
			return nil
		end

		local related_region_obj = court.position_functions.get_position_related_region_obj(court_obj, position_obj)
		if related_region_obj then
			local region_owner = related_region_obj:owning_faction()
			if region_owner 
				and (not region_owner:is_null_interface())
				and (not region_owner:is_rebel())
			then
				local owner_faction_name = region_owner:name()
				local index = table_find(candidate_factions, function(e) return e.faction_obj:name() == owner_faction_name end, true)
				if index then
					local contender_table = candidate_factions[index]
					if contender_table then
						return contender_table, index
					end
				end
			end
		end

		local candidate_table = candidate_factions[1]
		return candidate_table, 1
	end,

	-- returns two values, 
	-- the first is the character that should get the position, 
	-- the second is if it should be claimed directly (true => position_functions.claim_position) or given to ( false => position_functions.give_own_character_a_position)
	get_faction_character_to_claim_position = function(court_obj, faction_obj)
		if faction_obj:is_dead() then
			return nil
		end

		-- we don't claim positions on behalf of human factions, they do it manually
		if faction_obj:is_human() then
			return nil
		end

		-- rebels don't claim positions. even if (for some bizarre reason) they are the pharaoh's allies.
		if faction_obj:is_rebel() then
			return nil
		end

		local faction_name = faction_obj:name()
		-- if they don't have a court, or are in the other court, they can't claim a position in this one
		local faction_court = court.util_functions.get_faction_court_for_faction(faction_name)
		if faction_court ~= court_obj then
			return nil
		end

		local feature_available = feature_unlock.is_feature_unlocked_for_faction(faction_name, feature_ids_config.court)
		if not feature_available then
			return nil
		end

		local faction_persistent_data = court.util_functions.get_faction_persistent_data(faction_name)
		local is_leader = (faction_name == court_obj:ruling_faction())
		-- most courts have non-leader faction claim positions directly
		if (not court_obj.config.any_faction_can_hold_multiple_positions)
			and (not is_leader)
		then
			if faction_persistent_data.owned_positions and #faction_persistent_data.owned_positions > 0 then
				return nil
			end

			local faction_leader_character_obj = faction_obj:faction_leader()
			if (not faction_leader_character_obj)
				or faction_leader_character_obj:is_null_interface()
				or (not court.util_functions.is_character_eligible(court_obj, faction_leader_character_obj))
			then
				return nil
			end
			
			return faction_leader_character_obj, true
		end

		-- for court leaders and special courts (Mesopotamia) any character can get a position
		-- we just have to find a character which isn't already holding a position
		local available_characters = court.util_functions.get_eligible_characters(faction_court, faction_obj)
		if #available_characters <= 0 then
			return nil
		end

		return available_characters[1], false
	end,
}

-- dilemmas_FactionTurnStart
core:add_listener(
	"dilemmas_FactionTurnStart",
	"FactionTurnStart",
	true,
	function(context)
		court.dilemma_generation.on_turn_start(context:faction())
	end,
	true
)

-- court_ai_DilemmaChoiceMadeEvent
core:add_listener(
	"court_ai_DilemmaChoiceMadeEvent",
	"DilemmaChoiceMadeEvent",
	true,
	function(context)
		local db_dilemma_key = context:dilemma()
		local dilemma_config = court.dilemma_generation.get_dilemma_by_db_key(db_dilemma_key)
		if not dilemma_config then
			-- this is not a court AI dilemma
			return
		end

		dilemma_config:on_dilemma_resolved(context)
	end,
	true
)