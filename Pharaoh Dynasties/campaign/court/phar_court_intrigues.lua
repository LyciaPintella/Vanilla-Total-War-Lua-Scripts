out("Loading phar_court_intrigues.lua") 

-- main file phar.court.lua

-- a list of all possible intrigues, used as templates to fill [X].positions for courts in court.all_courts
court.intrigues =
{
	get_by_name = function(self, intrigue_name)
		for _, intrigue in ipairs(self) do
			if intrigue.name == intrigue_name then
				return intrigue
			end
		end

		return nil
	end,

	localization_text_keys = {
		-- reasons why intrigues can not be used
		not_accessible_to_faction = "phar_main_court_intrigue_not_accessible_to_faction",
		position_is_vacant = "phar_main_court_intrigue_position_is_vacant",
		cant_use_with_position = "phar_main_court_intrigue_cant_use_with_position",
		faction_actions_used_up_turn = "phar_main_court_intrigue_faction_actions_used_up_turn",
		faction_cannot_afford_it = "phar_main_court_intrigue_faction_cannot_afford_it",
		already_used_shemsu_hor = "phar_main_court_intrigue_already_used_shemsu_hor",
		faction_has_regard_for_position = "phar_main_court_intrigue_faction_has_regard_for_position",
		didnt_find_plot_targeted = "phar_main_court_intrigue_didnt_find_plot_targeted",
		cannot_use_on_plot_target_self = "phar_main_court_intrigue_faction_cannot_use_it_on_plot_target_self",
		cannot_use_on_plot_not_targeting_self = "phar_main_court_intrigue_faction_cannot_use_it_on_plot_not_targeting_self",
		cannot_use_on_own_plot = "phar_main_court_intrigue_faction_cannot_use_on_own_plot",
		cannot_use_on_unrevealed_plot = "phar_main_court_intrigue_faction_cannot_use_on_unrevealed_plot",
		cannot_use_on_max_level_plot = "phar_main_court_intrigue_faction_cannot_use_on_max_level_plot",
		can_only_use_on_own_plot = "phar_main_court_intrigue_faction_can_only_use_on_own_plot",
		not_enough_regard_for_plot_intrigue = "phar_main_court_intrigue_plot_not_enough_regard",
		not_enough_regard_with_plotter = "phar_main_court_intrigue_plot_not_enough_regard_with_plotter",
		not_enough_regard_for_conspire = "phar_main_court_intrigue_not_enough_regard_for_conspire",
		no_plot_for_conspire = "phar_main_court_intrigue_need_plot_to_conspire",
		can_not_conspire_with_target = "phar_main_court_intrigue_can_not_conspire_with_target", -- we do not need this one for now, it should not be visible in normal operation
		no_suitable_position = "phar_main_court_no_suitable_position",
		forbidden_during_shemsu_hor = "phar_main_court_action_not_accessible_shemsu_hor",
		need_court_position = "phar_main_court_need_court_position",
		need_regard_with_other_position = "phar_main_court_need_regard_with_other_position",
	},

	-- possible resources for intrigue costs
	--	troy_food = 1000,
	--	troy_wood = 400,
	--	troy_stones = 150,
	--	troy_bronze = 150,
	--	troy_gold = 100,
	--	phar_legitimacy = 10,
	--	phar_hatti_legitimacy = 10,

	----------------------------------------------------
	-- COMMON INTRIGUES - used by almost all factions

	-- assist
	{
		name = "assist",
		-- IMPORTANT: for this intrigue, the cost is per point of regard gained!!
		resource_costs_record = "phar_main_court_intrigue_assist_1",
		cost = 
		{
			{"troy_gold", -350},
		},
		-- the faction will have this amount of regard after the intrigue
		regard_target = 120,
		localization_key = "random_localisation_strings_string_phar_main_court_intrigue_name_assist",
		effect_info = "phar_main_court_intrigue_assist_effect_info",
		icon_path = "ui\\skins\\default\\court\\intrigue_icons\\icon_court_intrigue_assist.png",

		-- this is for intrigue-specific restrictions, common restrictions are in can_faction_use_intrigue
		-- returns bool for succes and the reason it can't be used in case of failure
		can_use_intrigue = function(self, court_obj, position_obj, faction_key)
			local result = ""

			local localized_name = get_localised_random_string(self.localization_key)

			local regard_for_faction = court.position_functions.get_position_regard_towards_faction_by_obj(position_obj, faction_key)
			if self.regard_target <= regard_for_faction then
				local localized_faction_name = common.get_localised_string("factions_screen_name_" .. faction_key)
				local text, _ = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.faction_has_regard_for_position, localized_faction_name, self.regard_target)
				result = court.util_functions.append_as_red_bullet_point(result, text)
			end

			if result ~= "" then
				return false, result
			end

			return true, ""
		end,

		get_effect_info = function(self, faction_court, position_obj, faction_key)
			local position_localized_string, _ = court.position_functions.get_localized_position_name(position_obj, faction_court)
			local holder_str = ""
			if position_obj then 
				holder_str = position_obj.persistent.current_holder_faction
			end

			local regard_for_faction = court.position_functions.get_position_regard_towards_faction_by_obj(position_obj, faction_key)
			local regard_change = self.regard_target - regard_for_faction
			if regard_change < 0 then
				regard_change = 0
			end
			local ui_info, ui_info_source = get_localised_text_replacement_and_source_formatted(self.effect_info, regard_change, position_localized_string)
			return ui_info, ui_info_source
		end,

		get_custom_intrigue_cost_obj = function(self, faction_court, position_obj, faction_key)
			local regard_for_faction = court.position_functions.get_position_regard_towards_faction_by_obj(position_obj, faction_key)
			local regard_change = self.regard_target - regard_for_faction
			if regard_change < 0 then
				regard_change = 0
			end
			local cost_obj = court.intrigue_functions.get_intrigue_base_cost_obj(faction_court, self, faction_key, position_obj)
			-- we want only the base_cost to be affected by the regard change
			cost_obj:multiply_by(regard_change)
			cost_obj = court.intrigue_functions.get_intrigue_full_cost_obj(faction_court, self, faction_key, position_obj, cost_obj)
			return cost_obj
		end,

		use = function(self, faction_court, court_position_str, faction_key)
			court.output("Faction '" .. faction_key .. "' used intrigue '" .. self.name .. "' to " .. court_position_str)
			local position_obj = court.util_functions.get_court_position(faction_court, court_position_str)

			local regard_for_faction = court.position_functions.get_position_regard_towards_faction_by_obj(position_obj, faction_key)
			local regard_change = self.regard_target - regard_for_faction

			-- we could also just set the regard to regard_for_faction
			court.position_functions.change_regard_towards_faction_by_obj(position_obj, faction_key, regard_change)
		end,

		get_cooldown_end_turn = function(self)
			-- this returns the next Shemsu Hor turn, or if disabled, the turn after one Shemsu Hor period
			local cooldown_end_turn = court.shemsu_hor.get_cooldown_end_turn()
			return cooldown_end_turn
		end,
	},

	-- conspire
	{
		name = "conspire",
		resource_costs_record = "phar_main_court_plot_dummy",
		cost = 
		{
			{"troy_gold", -350},
		},
		plot_increment = 1,
		additional_plot_selection = true,
		regard_cost = 20,
		localization_key = "random_localisation_strings_string_phar_main_court_intrigue_name_conspire",
		effect_info = "phar_main_court_intrigue_conspire_effect_info",
		icon_path = "ui\\skins\\default\\court\\intrigue_icons\\icon_court_intrigue_judge.png",

		get_effect_info = function(self, faction_court, position_obj, faction_key)
			local ui_info, ui_info_source = get_localised_text_replacement_and_source(self.effect_info)
			return ui_info, ui_info_source
		end,

		get_regard_needed = function(self, faction_key)
			local regard_needed = self.regard_cost
			local conspire_regard_cost_multiplier = court.util_functions.get_property(faction_key, "conspire_regard_cost_multiplier") or 1
			if conspire_regard_cost_multiplier ~= 1 then
				regard_needed = regard_needed * conspire_regard_cost_multiplier
			end
			return regard_needed
		end,

		get_custom_intrigue_cost_obj = function(self, faction_court, position_obj, faction_key)
			local cost_obj = court.intrigue_functions.get_intrigue_base_cost_obj(faction_court, self, faction_key, position_obj)
			local conspire_additional_cost = court.util_functions.get_property(faction_key, "conspire_additional_cost")
			if conspire_additional_cost then
				local additional_cost_obj = cm:create_new_custom_resource_cost()
				additional_cost_obj:get_cost_from_record(conspire_additional_cost)
				cost_obj:add(additional_cost_obj)
			end

			return cost_obj
		end,

		can_use_intrigue = function(self, court_obj, position_obj, faction_key, plot_id)
			local result = ""

			local usable_regard, _ = court.position_functions.get_position_regard_data_towards_faction_by_obj(position_obj, faction_key)
			local regard_needed = self:get_regard_needed(faction_key)
			if usable_regard < regard_needed then
				local text, _ = get_localised_text_replacement_and_source(court.intrigues.localization_text_keys.not_enough_regard_for_conspire)
				result = court.util_functions.append_as_red_bullet_point(result, text)
			end

			if plot_id then
				local plot_persistent_data = court.plot_functions:get_plot_persistent_data(court_obj.court_name, plot_id)
				if plot_persistent_data and plot_persistent_data.targeted_position == position_obj.name then
					local text, _ = get_localised_text_replacement_and_source(court.intrigues.localization_text_keys.can_not_conspire_with_target)
					result = court.util_functions.append_as_red_bullet_point(result, text)
				end
			else
				-- get list of plots for the faction. it needs at least one which is NOT against this position or at max level
				local max_level = court.plot_functions:get_plot_max_level(faction_key)
				local faction_plots = court.plot_functions:get_plots_owned_by_faction(faction_key)
				local found_suitable_plot = false
				for _ , plot in ipairs(faction_plots) do
					if plot.targeted_position ~= position_obj.name and plot.plot_level < max_level then
						found_suitable_plot = true
						break
					end
				end

				if not found_suitable_plot then
					local text, _ = get_localised_text_replacement_and_source(court.intrigues.localization_text_keys.no_plot_for_conspire)
					result = court.util_functions.append_as_red_bullet_point(result, text)
				end
			end

			if result ~= "" then
				return false, result
			end

			return true, ""
		end,

		use = function(self, faction_court, court_position_str, faction_key, plot_id)
			local position_obj = court.util_functions.get_court_position(faction_court, court_position_str)
			local regard_needed = self:get_regard_needed(faction_key)
			court.position_functions.change_regard_towards_faction_by_obj(position_obj, faction_key, -regard_needed)

			-- increase level of plot
			court.plot_functions:change_plot_level(faction_court.court_name, plot_id, self.plot_increment)
			-- we reveal it to the faction
			local holder_faction = position_obj.persistent.current_holder_faction
			court.plot_functions:reveal_plot_to_faction(faction_court.court_name, holder_faction, plot_id)
			local faction_table = court.util_functions.get_faction_persistent_data(faction_key)
			if not faction_table.conspirators then
				faction_table.conspirators = {}
			end
			if not table_find(faction_table.conspirators, court_position_str) then
				table.insert(faction_table.conspirators, court_position_str)
			end
		end,


		get_cooldown_end_turn = function(self)
			-- this returns the next Shemsu Hor turn, or if disabled, the turn after one Shemsu Hor period
			local cooldown_end_turn = court.shemsu_hor.get_cooldown_end_turn()
			return cooldown_end_turn
		end,
	},

	-- gossip
	{
		name = "gossip",
		resource_costs_record = "phar_main_court_plot_dummy",
		cost = 
		{
			{"troy_food", -250},
		},
		caller_regard_gain = 20,
		localization_key = "random_localisation_strings_string_phar_main_court_intrigue_name_gossip",
		effect_info = "phar_main_court_intrigue_gossip_effect_info",
		icon_path = "ui\\skins\\default\\court\\intrigue_icons\\icon_court_intrigue_gossip.png",

		get_effect_info = function(self, faction_court, position_obj, faction_key)
			local position_localized_string, _ = court.position_functions.get_localized_position_name(position_obj, faction_court)
			local regard_gained = self:get_regard_gained(faction_key, position_obj)
			local ui_info, ui_info_source = get_localised_text_replacement_and_source_formatted(self.effect_info, regard_gained, position_localized_string)
			return ui_info, ui_info_source
		end,

		use = function(self, faction_court, court_position_str, faction_key)
			court.output("Faction '" .. faction_key .. "' used intrigue '" .. self.name .. "' to " .. court_position_str)

			local position_obj = court.util_functions.get_court_position(faction_court, court_position_str)
			local regard_gained = self:get_regard_gained(faction_key, position_obj)
			if regard_gained > 0 then
				court.position_functions.change_regard_towards_faction_by_obj(position_obj, faction_key, regard_gained)
			end

			local viable_plot_ids = self:get_viable_gossip_plots(faction_court, court_position_str, position_obj.persistent.current_holder_faction, faction_key)
			if #viable_plot_ids > 0 then
				local gossip_reveals_all_plots = court.util_functions.get_property(faction_key, "gossip_reveals_all_plots")
				if gossip_reveals_all_plots then
					for plot_index, plot_id in ipairs(viable_plot_ids) do
						court.plot_functions:reveal_plot_to_faction(faction_court.court_name, faction_key, plot_id)
					end
				else
					local random_index = cm:model():random_int(1, #viable_plot_ids)
					local random_id = viable_plot_ids[random_index]
					court.plot_functions:reveal_plot_to_faction(faction_court.court_name, faction_key, random_id)
				end
			end
		end,

		get_regard_gained = function(self, faction_key, position_obj)
			if not self.caller_regard_gain then
				return 0
			end

			local faction_regard_multiplier = court.util_functions.get_property(faction_key, "gossip_regard_gain_multiplier") or 1
			local diplomacy_regard_multiplier = position_obj and court.position_functions.get_diplomacy_regard_change_multiplier(position_obj, faction_key) or 1
			local regard_gained = self.caller_regard_gain * faction_regard_multiplier * diplomacy_regard_multiplier
			return regard_gained
		end,

		get_viable_gossip_plots = function(self, faction_court_obj, court_position_str, position_holder_faction_name, request_making_faction_key)
			local viable_plots = {}
			for plot_resolve_turn, plots_by_resolve_turn in dpairs(faction_court_obj.persistent.plots_persistent_data_by_resolve_turn) do
				for plot_key, plots_of_type in dpairs(plots_by_resolve_turn) do
					for plot_index, plot in ipairs(plots_of_type) do
						-- we find all plots started by the faction or targeting it
						if plot.plotting_faction == position_holder_faction_name or plot.targeted_position == court_position_str then
							-- we don't really need plots that we created, or know about already
							local found_already = table_find(plot.revealed_to, request_making_faction_key)
							if plot.plotting_faction ~= request_making_faction_key 
								and (not found_already)
								and (not plot.invalidated)
							then
								table.insert(viable_plots, plot.plot_id)
							end
						end
					end
				end
			end
			return viable_plots
		end,
	},

	-- plot intrigues - only usable on plots:

	-- counter
	{
		name = "counter",
		-- IMPORTANT: for this intrigue, the cost is per level of the targeted plot!!
		resource_costs_record = "phar_main_court_intrigue_counter",
		cost = 
		{
			{"troy_gold", -350},
		},
		targets_plot = true,
		localization_key = "random_localisation_strings_string_phar_main_court_intrigue_name_counter",
		effect_info = "phar_main_court_intrigue_counter_effect_info",
		icon_path = "ui\\skins\\default\\court\\intrigue_icons\\icon_court_intrigue_counter.png",

		can_use_intrigue = function(self, court_obj, position_obj, faction_key, plot_id)
			local localized_name = get_localised_random_string(self.localization_key)

			-- there can be no plot_id when called by can_faction_use_intrigue
			if plot_id then
				local result = ""
				local plot_persistent_data = court.plot_functions:get_plot_persistent_data(court_obj.court_name, plot_id)
				if not plot_persistent_data then
					local text, _ = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.didnt_find_plot_targeted, plot_id, localized_name)
					result = court.util_functions.append_as_red_bullet_point(result, text)
				end

				local plot_target_position_obj = court.util_functions.get_court_position(court_obj, plot_persistent_data.targeted_position)
				if plot_target_position_obj.persistent.current_holder_faction ~= faction_key then
					local text, _ = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.cannot_use_on_plot_not_targeting_self, localized_name)
					result = court.util_functions.append_as_red_bullet_point(result, text)
				end

				if result ~= "" then
					return false, result
				end

				return true, ""
			end

			local error_text, _ = get_localised_random_string_and_source_formatted(court.ui.config.localization_keys.cant_use_no_plot_to_counter, localized_name)
			return false, error_text
		end,

		get_custom_intrigue_cost_obj = function(self, faction_court, position_obj, faction_key, plot_id)
			if plot_id then
				local plot_persistent_data = court.plot_functions:get_plot_persistent_data(faction_court.court_name, plot_id)
				if not plot_persistent_data then
					return nil
				end

				local level = plot_persistent_data.plot_level
				if not table_find(plot_persistent_data.revealed_to, faction_key) then
					level = court.plot_functions:get_plot_max_level(plot_persistent_data.plotting_faction)
				end

				local cost_obj = court.intrigue_functions.get_intrigue_base_cost_obj(faction_court, self, faction_key, position_obj)
				-- we want only the base_cost to be affected by the plot level
				cost_obj:multiply_by(level)
				cost_obj = court.intrigue_functions.get_intrigue_full_cost_obj(faction_court, self, faction_key, position_obj, cost_obj, plot_id)

				return cost_obj
			end

			return nil
		end,

		get_effect_info = function(self, faction_court, position_obj, faction_key)
			local ui_info, ui_info_source = get_localised_text_replacement_and_source(self.effect_info)
			return ui_info, ui_info_source
		end,

		use = function(self, faction_court, court_position_str, faction_key, plot_id)
			court.plot_functions:remove_plot(faction_court.court_name, plot_id)
		end,
	},

	-- encourage
	{
		name = "encourage",
		resource_costs_record = "phar_main_court_plot_dummy",
		cost = 
		{
			{"troy_gold", -350},
		},
		regard_gain = 30,
		plot_level_increase = 1,
		targets_plot = true,
		localization_key = "random_localisation_strings_string_phar_main_court_intrigue_name_encourage",
		effect_info = "phar_main_court_intrigue_encourage_effect_info",
		icon_path = "ui\\skins\\default\\court\\request_icons\\icon_court_request_scheme.png",

		can_use_intrigue = function(self, court_obj, position_obj, faction_key, plot_id)
			local localized_name = get_localised_random_string(self.localization_key)

			if not plot_id then
				-- there can be no plot_id when called by can_faction_use_intrigue
				local error_text, _ = get_localised_random_string_and_source_formatted(court.ui.config.localization_keys.cant_use_no_plot_available, localized_name)
				return false, error_text
			end

			local result = ""
			local plot_persistent_data = court.plot_functions:get_plot_persistent_data(court_obj.court_name, plot_id)
			if not plot_persistent_data then
				local text, _ = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.didnt_find_plot_targeted, plot_id, localized_name)
				result = court.util_functions.append_as_red_bullet_point(result, text)
			end

			if plot_persistent_data.plotting_faction == faction_key then
				local text, _ = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.cannot_use_on_own_plot, localized_name)
				result = court.util_functions.append_as_red_bullet_point(result, text)
			elseif not table_find(plot_persistent_data.revealed_to, faction_key) then
				local text, _ = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.cannot_use_on_unrevealed_plot, localized_name)
				result = court.util_functions.append_as_red_bullet_point(result, text)
			end

			local plot_target_position_obj = court.util_functions.get_court_position(court_obj, plot_persistent_data.targeted_position)
			if plot_target_position_obj.persistent.current_holder_faction == faction_key then
				local text, _ = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.cannot_use_on_plot_target_self, localized_name)
				result = court.util_functions.append_as_red_bullet_point(result, text)
			end

			if plot_persistent_data.plot_level == court.plot_functions:get_plot_max_level(plot_persistent_data.plotting_faction) then
				local text, _ = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.cannot_use_on_max_level_plot, localized_name)
				result = court.util_functions.append_as_red_bullet_point(result, text)
			end

			if result ~= "" then
				return false, result
			end

			return true, ""
		end,

		get_effect_info = function(self, faction_court, position_obj, faction_key, plot_id)
			local plotting_faction_key = court.plot_functions.get_plot_plotting_faction(faction_court.court_name, plot_id)
			local regard_gained = self:get_regard_gained(faction_key, plotting_faction_key)
			local ui_info, ui_info_source = get_localised_text_replacement_and_source_formatted(self.effect_info, self.plot_level_increase, regard_gained)
			return ui_info, ui_info_source
		end,

		use = function(self, faction_court, court_position_str, faction_key, plot_id)
			-- this will take care of checking if we go above the max level
			court.plot_functions:change_plot_level(faction_court.court_name, plot_id, self.plot_level_increase, true)

			local plotting_faction_key = court.plot_functions.get_plot_plotting_faction(faction_court.court_name, plot_id)
			local faction_table = court.util_functions.get_faction_persistent_data(plotting_faction_key)
			if (not faction_table.owned_positions)
				or #faction_table.owned_positions <= 0
			then
				-- no position to give regard to
				return
			end

			local regard_gained = self:get_regard_gained(faction_key, plotting_faction_key)

			if #faction_table.owned_positions == 1 then
				court.position_functions.change_regard_towards_faction_by_name(faction_court, faction_table.owned_positions[1], faction_key, regard_gained)
			else
				court.position_functions.change_regard_towards_faction_by_name(faction_court, faction_court.config.ruler_position, faction_key, regard_gained)
			end
		end,

		get_regard_gained = function(self, faction_key, plotting_faction_key)
			if not self.regard_gain then
				return 0
			end

			local regard_multiplier = court.util_functions.get_property(faction_key, "encourage_regard_gain_multiplier") or 1
			local diplomacy_multiplier = court.position_functions.get_diplomacy_regard_change_multiplier_between_factions(faction_key, plotting_faction_key)
			local regard_gained = self.regard_gain * regard_multiplier * diplomacy_multiplier
			return regard_gained
		end,
	},

	-- discourage
	{
		name = "discourage",
		resource_costs_record = "phar_main_court_plot_dummy",
		cost = 
		{
			{"troy_gold", -350},
		},
		regard_gain = 30,
		plot_level_decrease = 1,
		targets_plot = true,
		localization_key = "random_localisation_strings_string_phar_main_court_intrigue_name_discourage",
		effect_info = "phar_main_court_intrigue_discourage_effect_info",
		icon_path = "ui\\skins\\default\\court\\intrigue_icons\\icon_court_intrigue_discredit.png",

		can_use_intrigue = function(self, court_obj, position_obj, faction_key, plot_id)
			local localized_name = get_localised_random_string(self.localization_key)

			-- there can be no plot_id when called by can_faction_use_intrigue
			if not plot_id then
				local error_text, _ = get_localised_random_string_and_source_formatted(court.ui.config.localization_keys.cant_use_no_plot_available, localized_name)
				return false, error_text
			end

			local result = ""
			local plot_persistent_data = court.plot_functions:get_plot_persistent_data(court_obj.court_name, plot_id)
			if not plot_persistent_data then
				local text, _ = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.didnt_find_plot_targeted, plot_id, localized_name)
				result = court.util_functions.append_as_red_bullet_point(result, text)
			end

			if plot_persistent_data.plotting_faction == faction_key then
				local text, _ = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.cannot_use_on_own_plot, localized_name)
				result = court.util_functions.append_as_red_bullet_point(result, text)
			elseif not table_find(plot_persistent_data.revealed_to, faction_key) then
				local text, _ = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.cannot_use_on_unrevealed_plot, localized_name)
				result = court.util_functions.append_as_red_bullet_point(result, text)
			end

			if result ~= "" then
				return false, result
			end
			return true, ""
		end,

		get_custom_intrigue_cost_obj = function(self, faction_court, position_obj, faction_key, plot_id)
			if not plot_id then
				return nil
			end

			local plot_persistent_data = court.plot_functions:get_plot_persistent_data(faction_court.court_name, plot_id)
			if not plot_persistent_data then
				return nil
			end

			local discourage_gold_gain = court.util_functions.get_property(faction_key, "discourage_gold_gain")
			if not discourage_gold_gain then
				-- no special cost change for this faction
				local cost_obj = court.intrigue_functions.get_intrigue_full_cost_obj(faction_court, self, faction_key, position_obj, nil, plot_id)
				return cost_obj
			end

			local level = plot_persistent_data.plot_level
			local gold_gain = 0
			if #discourage_gold_gain >= level then
				-- the table has exact value for this level
				gold_gain = discourage_gold_gain[level]
			elseif #discourage_gold_gain > 0 then
				-- we use the highest level available
				gold_gain = discourage_gold_gain[#discourage_gold_gain]
			end


			local cost_obj = court.intrigue_functions.get_intrigue_base_cost_obj(faction_court, self, faction_key, position_obj)
			if gold_gain ~= 0 then
				cost_obj:add_resource_cost("troy_gold", court.config.court_resource_factor, gold_gain)
			end
			cost_obj = court.intrigue_functions.get_intrigue_full_cost_obj(faction_court, self, faction_key, position_obj, cost_obj, plot_id)

			return cost_obj

		end,

		get_effect_info = function(self, faction_court, position_obj, faction_key)
			local regard_gained = self:get_regard_gained(faction_key, position_obj)
			local ui_info, ui_info_source = get_localised_text_replacement_and_source_formatted(self.effect_info, self.plot_level_decrease, regard_gained)
			return ui_info, ui_info_source
		end,

		use = function(self, faction_court, court_position_str, faction_key, plot_id)
			local targeted_postion_str = court.plot_functions.get_plot_targeted_position(faction_court.court_name, plot_id)
			local targeted_postion_obj = court.util_functions.get_court_position(faction_court, targeted_postion_str)
			local regard_gained = self:get_regard_gained(faction_key, targeted_postion_obj)
			court.position_functions.change_regard_towards_faction_by_obj(targeted_postion_obj, faction_key, regard_gained)

			-- this will take care of destroying the plot if it falls below level 1
			court.plot_functions:change_plot_level(faction_court.court_name, plot_id, -self.plot_level_decrease, true)
		end,

		get_regard_gained = function(self, faction_key, position_obj)
			if not self.regard_gain then
				return 0
			end

			local regard_multiplier = court.util_functions.get_property(faction_key, "discourage_regard_gain_multiplier") or 1
			local diplomacy_regard_multiplier = position_obj and court.position_functions.get_diplomacy_regard_change_multiplier(position_obj, faction_key) or 1
			local regard_gained = self.regard_gain * regard_multiplier * diplomacy_regard_multiplier
			return regard_gained
		end,
	},

	-- undermine
	{
		name = "undermine",
		resource_costs_record = "phar_main_court_plot_dummy",
		cost = 
		{
			{"troy_gold", -350},
		},
		regard_cost = 30,
		plot_level_increase = 2,
		targets_plot = true,
		localization_key = "random_localisation_strings_string_phar_main_court_intrigue_name_undermine",
		effect_info = "phar_main_court_intrigue_undermine_effect_info",
		icon_path = "ui\\skins\\default\\court\\intrigue_icons\\icon_court_intrigue_tamper.png",

		can_use_intrigue = function(self, court_obj, position_obj, faction_key, plot_id)
			local localized_name = get_localised_random_string(self.localization_key)

			-- there can be no plot_id when called by can_faction_use_intrigue
			if not plot_id then
				local error_text, _ = get_localised_random_string_and_source_formatted(court.ui.config.localization_keys.cant_use_no_plot_available, localized_name)
				return false, error_text
			end

			local result = ""
			local plot_persistent_data = court.plot_functions:get_plot_persistent_data(court_obj.court_name, plot_id)
			if not plot_persistent_data then
				local text, _ = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.didnt_find_plot_targeted, plot_id, localized_name)
				result = court.util_functions.append_as_red_bullet_point(result, text)
			end

			if plot_persistent_data.plotting_faction ~= faction_key then
				local text, _ = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.can_only_use_on_own_plot, localized_name)
				result = court.util_functions.append_as_red_bullet_point(result, text)
			end

			local targeted_position_obj = court.util_functions.get_court_position(court_obj, plot_persistent_data.targeted_position)
			local local_regard = court.position_functions.get_position_regard_towards_faction_by_obj(targeted_position_obj, faction_key)
			local min_regard = court.position_functions.get_min_regard_for_faction(faction_key)
			local usable_regard = local_regard - min_regard
			if usable_regard < self.regard_cost then
				local text, _ = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.not_enough_regard_for_plot_intrigue, min_regard + self.regard_cost)
				result = court.util_functions.append_as_red_bullet_point(result, text)
			end

			if plot_persistent_data.plot_level == court.plot_functions:get_plot_max_level(plot_persistent_data.plotting_faction) then
				local text, _ = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.cannot_use_on_max_level_plot, localized_name)
				result = court.util_functions.append_as_red_bullet_point(result, text)
			end

			if result ~= "" then
				return false, result
			end
			return true, ""
		end,

		get_effect_info = function(self, faction_court, position_obj, faction_key)
			local ui_info, ui_info_source = get_localised_text_replacement_and_source_formatted(self.effect_info, self.plot_level_increase, self.regard_cost)
			return ui_info, ui_info_source
		end,

		use = function(self, faction_court, court_position_str, faction_key, plot_id)
			-- this will take care of checking if we go above the max level
			court.plot_functions:change_plot_level(faction_court.court_name, plot_id, self.plot_level_increase, true)

			local targeted_postion = court.plot_functions.get_plot_targeted_position(faction_court.court_name, plot_id)
			court.position_functions.change_regard_towards_faction_by_name(faction_court, targeted_postion, faction_key, -self.regard_cost)
		end,
	},

	-- end of COMMON INTRIGUES

	-- start of FACTION SPECIFIC INTRIGUES

	-- assume
	{
		name = "assume",
		resource_costs_record = "phar_main_court_plot_dummy",
		cost = 
		{
			{"troy_gold", -350},
		},
		regard_cost = 60,
		targets_plot = true,
		localization_key = "random_localisation_strings_string_phar_main_court_intrigue_name_assume",
		effect_info = "phar_main_court_intrigue_assume_effect_info",
		icon_path = "ui\\skins\\default\\court\\request_icons\\icon_court_request_connections.png",

		can_use_intrigue = function(self, court_obj, position_obj, faction_key, plot_id)
			local localized_name = get_localised_random_string(self.localization_key)

			-- there can be no plot_id when called by can_faction_use_intrigue
			local result = ""
			if plot_id then
				local plot_persistent_data = court.plot_functions:get_plot_persistent_data(court_obj.court_name, plot_id)
				if not plot_persistent_data then
					local text, _ = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.didnt_find_plot_targeted, plot_id, localized_name)
					result = court.util_functions.append_as_red_bullet_point(result, text)
				end

				local plot_target_position_obj = court.util_functions.get_court_position(court_obj, plot_persistent_data.targeted_position)
				if plot_target_position_obj.persistent.current_holder_faction == faction_key then
					local text, _ = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.cannot_use_on_plot_target_self, localized_name)
					result = court.util_functions.append_as_red_bullet_point(result, text)
				end

				if plot_persistent_data.plotting_faction == faction_key then
					local text, _ = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.cannot_use_on_own_plot, localized_name)
					result = court.util_functions.append_as_red_bullet_point(result, text)
				end

				local suitable_positions = self:get_plotter_suitable_position(court_obj, faction_key, plot_id)
				if #suitable_positions == 0 then
					local text, _ = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.not_enough_regard_with_plotter, self.regard_cost)
					result = court.util_functions.append_as_red_bullet_point(result, text)
				end
			end

			if result ~= "" then
				return false, result
			end

			return true, ""
		end,

		get_plotter_suitable_position = function(self, court_obj, faction_key, plot_id)
			if not plot_id then
				return {}
			end

			local plot_persistent_data = court.plot_functions:get_plot_persistent_data(court_obj.court_name, plot_id)
			if not plot_persistent_data then
				return {}
			end

			-- find all positions filled by the plotting faction with the required regard
			local suitable_positions = {}
			local plotting_faction = plot_persistent_data.plotting_faction
			for _, position_obj in ipairs(court_obj.positions) do
				if position_obj.persistent.current_holder_faction == plotting_faction then
					local usable_regard, _ = court.position_functions.get_position_regard_data_towards_faction_by_obj(position_obj, faction_key)
					if usable_regard >= self.regard_cost then
						table.insert(suitable_positions, position_obj)
					end
				end
			end

			return suitable_positions
		end,

		get_effect_info = function(self, faction_court, position_obj, faction_key)
			local ui_info, ui_info_source = get_localised_text_replacement_and_source(self.effect_info)
			return ui_info, ui_info_source
		end,

		use = function(self, court_obj, court_position_str, faction_key, plot_id)
			local suitable_positions = self:get_plotter_suitable_position(court_obj, faction_key, plot_id)
			court.position_functions.change_regard_towards_faction_by_obj(suitable_positions[1], faction_key, -self.regard_cost)

			-- take ownership of the plot, this must come second as it effectively changes the plot
			court.plot_functions:change_plotting_faction(court_obj.court_name, plot_id, faction_key)
		end,
	},

	-- flip
	{
		name = "flip",
		-- IMPORTANT: the cost here is per level of the plot
		resource_costs_record = "phar_main_court_intrigue_flip",
		cost = 
		{
			{"troy_gold", -100},
		},
		targets_plot = true,
		localization_key = "random_localisation_strings_string_phar_main_court_intrigue_name_flip",
		effect_info = "phar_main_court_intrigue_assume_effect_info",
		icon_path = "ui\\skins\\default\\court\\request_icons\\icon_court_request_connections.png",

		can_use_intrigue = function(self, court_obj, position_obj, faction_key, plot_id)
			local localized_name = get_localised_random_string(self.localization_key)

			-- there can be no plot_id when called by can_faction_use_intrigue
			local result = ""
			if plot_id then
				local plot_persistent_data = court.plot_functions:get_plot_persistent_data(court_obj.court_name, plot_id)
				if not plot_persistent_data then
					local text, _ = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.didnt_find_plot_targeted, plot_id, localized_name)
					result = court.util_functions.append_as_red_bullet_point(result, text)
				end

				local plot_target_position_obj = court.util_functions.get_court_position(court_obj, plot_persistent_data.targeted_position)
				if plot_persistent_data.plotting_faction == faction_key then
					local text, _ = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.cannot_use_on_own_plot, localized_name)
					result = court.util_functions.append_as_red_bullet_point(result, text)
				elseif plot_target_position_obj.persistent.current_holder_faction ~= faction_key then
					local text, _ = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.cannot_use_on_plot_not_targeting_self, localized_name)
					result = court.util_functions.append_as_red_bullet_point(result, text)

				-- Flip can't be used against plots by the ruling faction
				elseif plot_persistent_data.plotting_faction == court_obj:ruling_faction() then
					local ruling_position_name = court_obj.config.ruler_position
					local court_ruler_position_obj = court.util_functions.get_court_position(court_obj, ruling_position_name)
					local position_localized_string, _ = court.position_functions.get_localized_position_name(court_ruler_position_obj, court_obj)
					local text, _ = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.cant_use_with_position, localized_name, position_localized_string)
					result = court.util_functions.append_as_red_bullet_point(result, text)
				end

				--intrigue_immunity
				local suitable_positions = self:get_plotter_suitable_position(court_obj, faction_key, plot_id)
				if #suitable_positions == 0 then
					local text, _ = get_localised_text_replacement_and_source(court.intrigues.localization_text_keys.no_suitable_position)
					result = court.util_functions.append_as_red_bullet_point(result, text)
				end
			end

			if result ~= "" then
				return false, result
			end

			return true, ""
		end,

		get_custom_intrigue_cost_obj = function(self, faction_court, position_obj, faction_key, plot_id)
			if not plot_id then
				return nil
			end

			local plot_persistent_data = court.plot_functions:get_plot_persistent_data(faction_court.court_name, plot_id)
			if not plot_persistent_data then
				return nil
			end

			local level = plot_persistent_data.plot_level
			if not table_find(plot_persistent_data.revealed_to, faction_key) then
				level = court.plot_functions:get_plot_max_level(plot_persistent_data.plotting_faction)
			end

			local cost_obj = court.intrigue_functions.get_intrigue_full_cost_obj(faction_court, self, faction_key, position_obj, nil, plot_id)
			cost_obj:multiply_by(level)
			return cost_obj
		end,

		get_plotter_suitable_position = function(self, court_obj, faction_key, plot_id)
			if not plot_id then
				return {}
			end

			local plot_persistent_data = court.plot_functions:get_plot_persistent_data(court_obj.court_name, plot_id)
			if not plot_persistent_data then
				return {}
			end

			-- find all positions filled by the plotting faction
			local suitable_positions = {}
			local plotting_faction = plot_persistent_data.plotting_faction
			for _, position_obj in ipairs(court_obj.positions) do
				if position_obj.persistent.current_holder_faction == plotting_faction then
					table.insert(suitable_positions, position_obj)
				end
			end

			return suitable_positions
		end,

		get_effect_info = function(self, court_obj, position_obj, faction_key)
			local ui_info, ui_info_source = get_localised_text_replacement_and_source(self.effect_info)
			return ui_info, ui_info_source
		end,

		use = function(self, court_obj, court_position_str, faction_key, plot_id)
			local suitable_positions = self:get_plotter_suitable_position(court_obj, faction_key, plot_id)
			local position_obj = suitable_positions[1]

			court.plot_functions:change_plotting_faction(court_obj.court_name, plot_id, faction_key)

			court.plot_functions:change_target_position(court_obj.court_name, plot_id, position_obj, faction_key)
		end,
	},

	-- endorse
	{
		name = "endorse",
		resource_costs_record = "phar_main_court_intrigue_endorse",
		-- this is placeholder cost used only for testing when resource_costs_record is commented
		cost = 
		{
			{"troy_gold", -100},
		},
		localization_key = "random_localisation_strings_string_phar_main_court_intrigue_name_endorse",
		effect_info = "phar_main_court_intrigue_endorse_effect_info",
		icon_path = "ui\\skins\\default\\court\\intrigue_icons\\icon_court_intrigue_endorse.png",

		can_use_intrigue = function(self, court_obj, position_obj, faction_key)
			local result = ""

			local regard_moved = self:get_usable_regard_with_all_other_positions(court_obj, position_obj, faction_key)
			if regard_moved <= 0 then
				local text, _ = get_localised_text_replacement_and_source(court.intrigues.localization_text_keys.need_regard_with_other_position)
				result = court.util_functions.append_as_red_bullet_point(result, text)
			end

			if result ~= "" then
				return false, result
			end

			return true, ""
		end,

		get_usable_regard_with_all_other_positions = function(self, court_obj, targeted_position_obj, faction_key)
			-- find the sum of the regard on all the positions, excluding the targeted position
			local regard_sum = 0
			for _, position_obj in ipairs(court_obj.positions) do
				if position_obj ~= targeted_position_obj
					and position_obj.persistent.current_holder_faction
					and position_obj.persistent.current_holder_faction ~= faction_key
				then
					local usable_regard, _ = court.position_functions.get_position_regard_data_towards_faction_by_obj(position_obj, faction_key)
					regard_sum = regard_sum + usable_regard
				end
			end

			return regard_sum
		end,

		get_effect_info = function(self, faction_court, position_obj, faction_key)
			local ui_info, ui_info_source = get_localised_text_replacement_and_source(self.effect_info)
			return ui_info, ui_info_source
		end,

		use = function(self, faction_court, court_position_str, faction_key, plot_id)
			local targeted_position_obj = court.util_functions.get_court_position(faction_court, court_position_str)
			local regard_moved = self:get_usable_regard_with_all_other_positions(faction_court, targeted_position_obj, faction_key)
			court.position_functions.change_regard_towards_faction_by_obj(targeted_position_obj, faction_key, regard_moved)

			for _, position_obj in ipairs(faction_court.positions) do
				if position_obj ~= targeted_position_obj
				and position_obj.persistent.current_holder_faction
				and position_obj.persistent.current_holder_faction ~= faction_key
			then
					local regard_for_faction = court.position_functions.get_position_regard_towards_faction_by_obj(position_obj, faction_key)
					court.position_functions.change_regard_towards_faction_by_obj(position_obj, faction_key, -regard_for_faction)
				end
			end
		end,
	},

	-- provoke
	{
		name = "provoke",
		resource_costs_record = "phar_main_court_intrigue_provoke",
		-- this is placeholder cost used only for testing when resource_costs_record is commented
		cost = 
		{
			{"troy_gold", -100},
		},
		localization_key = "random_localisation_strings_string_phar_main_court_intrigue_name_provoke",
		effect_info = "phar_main_court_intrigue_provoke_effect_info",
		icon_path = "ui\\skins\\default\\court\\intrigue_icons\\icon_court_intrigue_provoke.png",

		can_use_intrigue = function(self, court_obj, position_obj, faction_key)
			local result = ""
			local localized_name = get_localised_random_string(self.localization_key)
			local is_court_leader = position_obj.name == court_obj.config.ruler_position
			if is_court_leader then
				local court_ruler_position_obj = court.util_functions.get_court_position(court_obj, court_obj.config.ruler_position)
				local position_localized_string, _ = court.position_functions.get_localized_position_name(court_ruler_position_obj, court_obj)

				local text, _ = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.cant_use_with_position, localized_name, position_localized_string)
					result = court.util_functions.append_as_red_bullet_point(result, text)
				result = court.util_functions.append_as_red_bullet_point(result, text)
			end

			-- no need to check if Shemsu Hor system is active - if it is disabled it is never Shemsu Hor
			if shemsu_hor.is_shemsu_hor() then
				local text, _ = get_localised_text_replacement_and_source(court.intrigues.localization_text_keys.forbidden_during_shemsu_hor)
				result = court.util_functions.append_as_red_bullet_point(result, text)
			end

			local faction_table = court.util_functions.get_faction_persistent_data(faction_key)
			if (not faction_table.owned_positions)
				or #faction_table.owned_positions <= 0
			then
				local text, _ = get_localised_text_replacement_and_source(court.intrigues.localization_text_keys.need_court_position)
				result = court.util_functions.append_as_red_bullet_point(result, text)
			end

			if result ~= "" then
				return false, result
			end

			return true, ""
		end,

		get_effect_info = function(self, court_obj, position_obj, faction_key)
			local ui_info, ui_info_source = get_localised_text_replacement_and_source(self.effect_info)
			return ui_info, ui_info_source
		end,

		use = function(self, court_obj, court_position_str, faction_key, plot_id)
			-- the holder of court_position_str should start a plot against faction_key
			local faction_table = court.util_functions.get_faction_persistent_data(faction_key)
			if (not faction_table.owned_positions)
				or #faction_table.owned_positions <= 0
			then
				return false
			end

			local plot_target_position_obj = court.util_functions.get_court_position(court_obj, faction_table.owned_positions[1])
			local plotter_position_obj = court.util_functions.get_court_position(court_obj, court_position_str)
			local plotter_faction = plotter_position_obj.persistent.current_holder_faction
			local new_plot_id = court.plot_generation.generate_plot_against(court_obj, plotter_faction, plot_target_position_obj)
			if (not is_number(new_plot_id)) or new_plot_id < 0 then
				-- we tried to create a plot and failed. we try again, this time skippig payment
				new_plot_id = court.plot_generation.generate_plot_against(court_obj, plotter_faction, plot_target_position_obj, true)
			end

			if is_number(new_plot_id) and new_plot_id >= 0 then
				court.plot_functions:reveal_plot_to_faction(court_obj.court_name, faction_key, new_plot_id)
			end
		end,
	},

	-- insult (player-facing name is Royal Invective)
	{
		name = "insult",
		resource_costs_record = "phar_map_court_intrigue_insult",
		-- this is placeholder cost used only for testing when resource_costs_record is commented
		-- cost = 
		-- {
		-- 	{"troy_gold", -100},
		-- },
		diplomatic_effect = -3,
		localization_key = "random_localisation_strings_string_phar_map_court_intrigue_name_insult",
		effect_info = "phar_map_court_intrigue_insult_effect_info",
		icon_path = "ui\\skins\\default\\court\\intrigue_icons\\icon_court_intrigue_royal_invective.png",

		can_use_intrigue = function(self, court_obj, position_obj, faction_key)
			local result = ""
			local localized_name = get_localised_random_string(self.localization_key)

			-- no need to check if Shemsu Hor system is active - if it is disabled it is never Shemsu Hor
			if shemsu_hor.is_shemsu_hor() then
				local text, _ = get_localised_text_replacement_and_source(court.intrigues.localization_text_keys.forbidden_during_shemsu_hor)
				result = court.util_functions.append_as_red_bullet_point(result, text)
			end

			local faction_table = court.util_functions.get_faction_persistent_data(faction_key)
			if (not faction_table.owned_positions)
				or #faction_table.owned_positions <= 0
			then
				local text, _ = get_localised_text_replacement_and_source(court.intrigues.localization_text_keys.need_court_position)
				result = court.util_functions.append_as_red_bullet_point(result, text)
			end

			if result ~= "" then
				return false, result
			end

			return true, ""
		end,

		get_effect_info = function(self, court_obj, position_obj, faction_key)
			local ui_info, ui_info_source = get_localised_text_replacement_and_source(self.effect_info)
			return ui_info, ui_info_source
		end,

		use = function(self, court_obj, court_position_str, faction_key, plot_id)
			-- the holder of court_position_str should start a plot against faction_key
			local faction_table = court.util_functions.get_faction_persistent_data(faction_key)
			if (not faction_table.owned_positions)
				or #faction_table.owned_positions <= 0
			then
				return false
			end

			local position_obj = court.util_functions.get_court_position(court_obj, court_position_str)
			local targeted_faction = position_obj.persistent.current_holder_faction
			local plots_by_faction = court.plot_functions:get_plots_owned_by_faction(targeted_faction)
			local plot_number = #plots_by_faction
			for _ , plot_persistent_data in ipairs(plots_by_faction) do
				plot_persistent_data.force_failure = true
				court.plot_functions:resolve_plot(court_obj, plot_persistent_data)
			end

			-- we need to generate a new plot against the intrigue user - one for each of the failed plots
			-- this is the position of the user of the intrigue, so the target of the new plots
			local plot_target_position_obj = court.util_functions.get_court_position(court_obj, faction_table.owned_positions[1])
			-- this is the target position of the intrigue, so the instigator of the new plots
			local plotter_position_obj = court.util_functions.get_court_position(court_obj, court_position_str)
			for i = 1, plot_number do
				-- the plots generated by this intrigue should be free in both resources and court actions
				local new_plot_id = court.plot_generation.generate_plot_against(court_obj, targeted_faction, plot_target_position_obj, true, nil, true)
				if is_number(new_plot_id) and new_plot_id >= 0 then
					court.plot_functions:reveal_plot_to_faction(court_obj.court_name, faction_key, new_plot_id)
				end
			end
		end,
	},

	-- collude
	{
		-- a lot of it is copied of the conspire with different config settings. the difference is it also advances the plot and possibly resolves it
		name = "collude",
		resource_costs_record = "phar_main_court_plot_dummy",
		cost = 
		{
			{"troy_gold", -350},
		},
		plot_increment = 2,
		turns_advanced = 1,
		additional_plot_selection = true,
		regard_cost = 40,

		localization_key = "random_localisation_strings_string_phar_map_court_intrigue_name_collude",
		effect_info = "phar_map_court_intrigue_collude_effect_info",
		icon_path = "ui\\skins\\default\\court\\intrigue_icons\\icon_court_intrigue_collude.png",

		get_effect_info = function(self, faction_court, position_obj, faction_key)
			local ui_info, ui_info_source = get_localised_text_replacement_and_source(self.effect_info)
			return ui_info, ui_info_source
		end,

		get_regard_needed = function(self, faction_key)
			local regard_needed = self.regard_cost
			local conspire_regard_cost_multiplier = court.util_functions.get_property(faction_key, "conspire_regard_cost_multiplier") or 1
			if conspire_regard_cost_multiplier ~= 1 then
				regard_needed = regard_needed * conspire_regard_cost_multiplier
			end
			return regard_needed
		end,

		get_custom_intrigue_cost_obj = function(self, faction_court, position_obj, faction_key)
			local cost_obj = court.intrigue_functions.get_intrigue_base_cost_obj(faction_court, self, faction_key, position_obj)
			local conspire_additional_cost = court.util_functions.get_property(faction_key, "conspire_additional_cost")
			if conspire_additional_cost then
				local additional_cost_obj = cm:create_new_custom_resource_cost()
				additional_cost_obj:get_cost_from_record(conspire_additional_cost)
				cost_obj:add(additional_cost_obj)
			end

			return cost_obj
		end,

		can_use_intrigue = function(self, court_obj, position_obj, faction_key, plot_id)
			local result = ""
			local usable_regard, _ = court.position_functions.get_position_regard_data_towards_faction_by_obj(position_obj, faction_key)
			local regard_needed = self:get_regard_needed(faction_key)
			if usable_regard < regard_needed then
				local text, _ = get_localised_text_replacement_and_source(court.intrigues.localization_text_keys.not_enough_regard_for_conspire)
				result = court.util_functions.append_as_red_bullet_point(result, text)
			end

			if plot_id then
				local plot_persistent_data = court.plot_functions:get_plot_persistent_data(court_obj.court_name, plot_id)
				if plot_persistent_data and plot_persistent_data.targeted_position == position_obj.name then
					local text, _ = get_localised_text_replacement_and_source(court.intrigues.localization_text_keys.can_not_conspire_with_target)
					result = court.util_functions.append_as_red_bullet_point(result, text)
				end
			else
				-- get list of plots for the faction. it needs at least one which is NOT against this position or at max level
				local max_level = court.plot_functions:get_plot_max_level(faction_key)
				local faction_plots = court.plot_functions:get_plots_owned_by_faction(faction_key)
				local found_suitable_plot = false
				for _ , plot in ipairs(faction_plots) do
					if plot.targeted_position ~= position_obj.name and plot.plot_level < max_level then
						found_suitable_plot = true
						break
					end
				end

				if not found_suitable_plot then
					local text, _ = get_localised_text_replacement_and_source(court.intrigues.localization_text_keys.no_plot_for_conspire)
					result = court.util_functions.append_as_red_bullet_point(result, text)
				end
			end

			if result ~= "" then
				return false, result
			end

			return true, ""
		end,

		use = function(self, faction_court, court_position_str, faction_key, plot_id)
			local position_obj = court.util_functions.get_court_position(faction_court, court_position_str)
			local regard_needed = self:get_regard_needed(faction_key)
			court.position_functions.change_regard_towards_faction_by_obj(position_obj, faction_key, -regard_needed)

			-- increase level of plot
			court.plot_functions:change_plot_level(faction_court.court_name, plot_id, self.plot_increment)

			-- we reveal it to the faction
			local holder_faction = position_obj.persistent.current_holder_faction
			court.plot_functions:reveal_plot_to_faction(faction_court.court_name, holder_faction, plot_id)
			local faction_table = court.util_functions.get_faction_persistent_data(faction_key)
			if not faction_table.conspirators then
				faction_table.conspirators = {}
			end
			if not table_find(faction_table.conspirators, court_position_str) then
				table.insert(faction_table.conspirators, court_position_str)
			end
			-- we advance it. this will automatically resolve it if the resolve turn becomes this turn or lower
			local plot_persistent_data = court.plot_functions:get_plot_persistent_data(faction_court.court_name, plot_id)

			court.plot_functions:advance_plot(faction_court, plot_persistent_data, self.turns_advanced)
		end,

		get_cooldown_end_turn = function(self)
			-- this returns the next Shemsu Hor turn, or if disabled, the turn after one Shemsu Hor period
			local cooldown_end_turn = court.shemsu_hor.get_cooldown_end_turn()
			return cooldown_end_turn
		end,
	},

	-- end of FACTION SPECIFIC INTRIGUES

	-- start of POSITION SPECIFIC INTRIGUES

	-- cease
	{
		name = "cease",
		resource_costs_record = "phar_main_court_plot_dummy",
		cost = 
		{
			{"troy_gold", -350},
		},
		targets_plot = true,

		accessible_to_positions = {"chief_of_royal_bodyguards", "king_of_elam"},
		localization_key = "random_localisation_strings_string_phar_main_court_intrigue_name_cease",
		effect_info = "phar_main_court_intrigue_cease_effect_info",
		icon_path = "ui\\skins\\default\\court\\request_icons\\icon_court_request_protection.png",

		-- access to this intrigue is not given by the factions_config
		-- it has a special way of allowing access (being visible in the menu)
		has_special_access = function(self, faction_key)
			local faction_table = court.util_functions.get_faction_persistent_data(faction_key)

			if faction_table.owned_positions then
				for _, owned_position in ipairs(faction_table.owned_positions) do
					if table_find(self.accessible_to_positions, owned_position) then
						return true
					end
				end
			end

			if faction_table.has_cease_request then
				return true
			end

			return false
		end,

		-- faction_court is not used here, but it is used for the plots, and I want the functions to be matching
		court_actions_needed_override = function(self, faction_court, faction_key)
			local faction_table = court.util_functions.get_faction_persistent_data(faction_key)
			if faction_table.has_cease_request then
				return 0
			end
			return court.config.intrigues_court_actions_needed
		end,

		can_use_intrigue = function(self, court_obj, position_obj, faction_key, plot_id)
			local localized_name = get_localised_random_string(self.localization_key)

			local result = ""
			-- there can be no plot_id when called by can_faction_use_intrigue
			if plot_id then
				local plot_persistent_data = court.plot_functions:get_plot_persistent_data(court_obj.court_name, plot_id)
				if not plot_persistent_data then
					local text, _ = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.didnt_find_plot_targeted, plot_id, localized_name)
					result = court.util_functions.append_as_red_bullet_point(result, text)
				end

				local plot_target_position_obj = court.util_functions.get_court_position(court_obj, plot_persistent_data.targeted_position)
				if plot_target_position_obj.persistent.current_holder_faction == faction_key then
					local text, _ = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.cannot_use_on_plot_target_self, localized_name)
					result = court.util_functions.append_as_red_bullet_point(result, text)
				end

				if plot_persistent_data.plotting_faction == faction_key then
					local text, _ = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.cannot_use_on_own_plot, localized_name)
					result = court.util_functions.append_as_red_bullet_point(result, text)
				end
			end

			if result ~= "" then
				return false, result
			end

			return true, ""
		end,

		get_effect_info = function(self, faction_court, position_obj, faction_key)
			local ui_info, ui_info_source = get_localised_text_replacement_and_source(self.effect_info)
			return ui_info, ui_info_source
		end,

		use = function(self, faction_court, court_position_str, faction_key, plot_id)
			court.plot_functions:remove_plot(faction_court.court_name, plot_id)
			-- if the intrigue was given access via request for a one-time-use we remove the access
			local faction_table = court.util_functions.get_faction_persistent_data(faction_key)
			faction_table.has_cease_request = nil
		end,
	},

	-- end of POSITION SPECIFIC INTRIGUES

	-- start of ANCIENT LEGACY SPECIFIC INTRIGUES

	-- discuss_law
	{
		name = "discuss_law",
		regard_cost = 20,
		justice_points_gained = 2,
		justice_points_gained_factor = "troy_resource_factor_faction",
		localization_key = "ui_text_replacements_localised_text_phar_map_court_intrigue_name_discuss_law",
		effect_info = "phar_map_court_intrigue_effect_info_discuss_law",
		icon_path = "ui\\skins\\default\\court\\intrigue_icons\\icon_court_intrigue_discuss_law.png",

		get_effect_info = function(self, faction_court, position_obj, faction_key)
			local ui_info, ui_info_source = get_localised_text_replacement_and_source_safe_formatted(self.effect_info, self.justice_points_gained)
			return ui_info, ui_info_source
		end,

		-- this is for intrigue-specific restrictions, common restrictions are in can_faction_use_intrigue
		-- returns bool for succes and the reason it can't be used in case of failure
		can_use_intrigue = function(self, court_obj, position_obj, faction_key, plot_id)
			local result = ""

			local usable_regard, _ = court.position_functions.get_position_regard_data_towards_faction_by_obj(position_obj, faction_key)
			if usable_regard < self.regard_cost then
				local text, _ = get_localised_text_replacement_and_source(court.ui.config.localization_keys.not_enough_regard_with_position)
				result = court.util_functions.append_as_red_bullet_point(result, text)
			end

			if result ~= "" then
				return false, result
			end

			return true, ""
		end,

		use = function(self, faction_court, court_position_str, faction_key, plot_id)
			cm:faction_add_pooled_resource(faction_key, ancient_legacy_hammurabi_config.resource_key, self.justice_points_gained_factor, self.justice_points_gained)
			court.position_functions.change_regard_towards_faction_by_name(faction_court, court_position_str, faction_key, -self.regard_cost)
		end,

		-- access to this intrigue is not given by the factions_config
		-- it has a special way of allowing access (being visible in the menu)
		has_special_access = function(self, faction_key)
			local has_unlocked_hammurabi = ancient_legacy_common:faction_has_claimed_legacy(faction_key, "phar_ancient_legacy_hammurabi")
			return has_unlocked_hammurabi
		end,
	},

	-- also a plot intrigue
	-- dissolve_plot
	{
		name = "dissolve_plot",
		--resource_costs_record = "phar_main_court_plot_dummy",
		cost = 
		{
			{ancient_legacy_atreus_config.resource_key, -50},
		},
		required_legacy = "phar_ancient_legacy_atreus",
		targets_plot = true,

		localization_key = "ui_text_replacements_localised_text_phar_map_court_intrigue_name_dissolve_plot",
		effect_info = "phar_map_court_intrigue_effect_info_dissolve_plot",
		icon_path = "ui/skins/default/court/intrigue_icons/icon_court_intrigue_dissolve_plot.png",

		get_effect_info = function(self, faction_court, position_obj, faction_key)
			local ui_info, ui_info_source = get_localised_text_replacement_and_source(self.effect_info)
			return ui_info, ui_info_source
		end,

		can_use_intrigue = function(self, court_obj, position_obj, faction_key, plot_id)
			local localized_name = common.get_localised_string(self.localization_key)

			local result = ""
			-- there can be no plot_id when called by can_faction_use_intrigue
			if plot_id then
				local plot_persistent_data = court.plot_functions:get_plot_persistent_data(court_obj.court_name, plot_id)
				if not plot_persistent_data then
					local text, _ = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.didnt_find_plot_targeted, plot_id, localized_name)
					result = court.util_functions.append_as_red_bullet_point(result, text)
				end

				local plot_target_position_obj = court.util_functions.get_court_position(court_obj, plot_persistent_data.targeted_position)
				if plot_target_position_obj.persistent.current_holder_faction ~= faction_key then
					local text, _ = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.cannot_use_on_plot_not_targeting_self, localized_name)
					result = court.util_functions.append_as_red_bullet_point(result, text)
				end

				if plot_persistent_data.plotting_faction == faction_key then
					local text, _ = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.cannot_use_on_own_plot, localized_name)
					result = court.util_functions.append_as_red_bullet_point(result, text)
				end
			end

			if result ~= "" then
				return false, result
			end

			return true, ""
		end,

		use = function(self, faction_court, court_position_str, faction_key, plot_id)
			court.plot_functions:remove_plot(faction_court.court_name, plot_id)
		end,

		-- access to this intrigue is not given by the factions_config
		-- it has a special way of allowing access (being visible in the menu)
		has_special_access = function(self, faction_key)
			local has_unlocked_legacy = ancient_legacy_common:faction_has_claimed_legacy(faction_key, self.required_legacy)
			return has_unlocked_legacy
		end,
	},
	-- end of ANCIENT LEGACY SPECIFIC INTRIGUES
}

court.intrigue_functions =
{
	-------------------------------------------------------------------------------------
	-- EXTERNAL METHODS: meant to be called from outside this file, for UI or AI purposes

	--- @function get_list_of_accessible_intrigues
	--- @desc Returns a list of all intrigues the faction has access to
	--- @p string faction_key - the faction key
	--- @return table of strings with the names of the intrigues
	get_list_of_accessible_intrigues = function(faction_key)
		-- there is a potential to cache this if it becomes a performance issue
		-- we make a copy, so we can modify it without changing the original
		local available_intrigues = table_deep_copy(court.factions_config.default.available_intrigues)
		if court.factions_config[faction_key] then
			if is_table(court.factions_config[faction_key].unavailable_intrigues) then
				for _, intrigue in ipairs(court.factions_config[faction_key].unavailable_intrigues) do
					table_erase(available_intrigues, intrigue)
				end
			end

			if is_table(court.factions_config[faction_key].additional_intrigues) then
				table_append(available_intrigues, court.factions_config[faction_key].additional_intrigues)
			end
		end

		for _, intrigue in ipairs(court.intrigues) do
			if is_function(intrigue.has_special_access) 
				and intrigue.name
				and (not table_find(available_intrigues, intrigue.name))
			then
				if intrigue:has_special_access(faction_key) then
					table.insert(available_intrigues, intrigue.name)
				end
			end
		end
		return available_intrigues
	end,

	--- @function get_list_of_accessible_plot_intrigues
	--- @desc Returns a list of all intrigues (that target plots) the faction has access to
	--- @p string faction_key - the faction key
	--- @p number plot_id - the id of the plot (persistent data)
	--- @return table of strings with the names of the intrigues
	get_list_of_accessible_plot_intrigues = function(faction_key, plot_id)
		local all_available_intrigues = court.intrigue_functions.get_list_of_accessible_intrigues(faction_key)
		local result = {}

		local faction_court_obj = court.util_functions.get_faction_court_for_faction(faction_key)
		local plot_data = court.plot_functions:get_plot_persistent_data(faction_court_obj.court_name, plot_id)
		local targeted_position_obj = court.util_functions.get_court_position(faction_court_obj, plot_data.targeted_position)

		for _, intrigue_key in ipairs(all_available_intrigues) do
			local intrigue_obj = court.intrigues:get_by_name(intrigue_key)
			if intrigue_obj and intrigue_obj.targets_plot then
				table.insert(result, intrigue_key)
			end
		end
		return result
	end,

	--- @function use_intrigue
	--- @desc Attempts to have the faction use the intrigue on the target court position
	--- @p object faction_court - one of the courts listed in court.all_courts
	--- @p string faction_key - the faction key
	--- @p string intrigue_str - the name of the intrigue
	--- @p string court_position_str - the court position targeted by the intrigue
	--- @return boolean - if the intrigue was successfully used
	use_intrigue = function(faction_court, faction_key, intrigue_str, court_position_str, ...)
		local is_intrigue_accessible, error_message = court.intrigue_functions.can_faction_use_intrigue(faction_court, faction_key, intrigue_str, court_position_str, unpack(arg))
		if not is_intrigue_accessible then
			court.output("Error: faction '" .. faction_key .. "' tried to use intrigue '" .. intrigue_str .. "'  to position '" .. court_position_str .. "' but can't due to '".. error_message .. "'", 10)
			return false
		end
		local intrigue = court.intrigues:get_by_name(intrigue_str)

		if not intrigue then
			court.output("Error: intrigue '" .. intrigue_str .. "' not found!", 10)
			return false
		end

		local court_position_obj = court.util_functions.get_court_position(faction_court, court_position_str)
		court.intrigue_functions.pay_for_intrigue(faction_court, faction_key, intrigue, court_position_obj, unpack(arg))

		if is_number(intrigue.diplomatic_effect) then
			local position_obj = court.util_functions.get_court_position(faction_court, court_position_str)
			cm:apply_dilemma_diplomatic_bonus(faction_key, position_obj.persistent.current_holder_faction, intrigue.diplomatic_effect)
		end

		-- we need to get the needed court actions before using the intrigue, as using it may change things (like mark a free-use as used up)
		local court_actions_for_intrigue = court.intrigue_functions.get_intrigue_actions_needed(intrigue, faction_key, faction_court)

		intrigue:use(faction_court, court_position_str, faction_key, unpack(arg))

		local faction_table = court.util_functions.get_faction_persistent_data(faction_key)
		court.util_functions.increase_used_court_actions_for_faction_by_table(faction_table, court_actions_for_intrigue)

		-- most intrigues have a standard cooldown
		local cooldown_end_turn = cm:model():turn_number() + court.config.intrigue_cooldown
		-- but if this particular one is special, we take itss cooldown instead
		if is_function(intrigue.get_cooldown_end_turn) then
			cooldown_end_turn = intrigue:get_cooldown_end_turn()
		end

		-- some intrigues may have some other logic and may not want to put the standard cooldown at all
		if is_number(cooldown_end_turn) then
			-- we mark the turn the cooldown ends and we can use the intrigue against this position again 
			court.position_functions.mark_position_with_value(court_position_obj, cooldown_end_turn, intrigue_str, faction_key, "cooldown_end_turn")
		end

		court.log_functions.log_court_action("intrigue_used", faction_key, court_position_str, intrigue_str, unpack(arg))
		core:trigger_event("ScriptEventCourtIntrigueUsed", { faction = cm:get_faction(faction_key), court_name = faction_court.court_name, intrigue_name = intrigue_str})
		return true
	end,

	--- @function can_faction_use_intrigue
	--- @desc Checks if the factions can use a specific intrigue right now
	--- @p object faction_court - one of the courts listed in court.all_courts
	--- @p string faction_key - the faction key
	--- @p string intrigue_str - the name of the intrigue
	--- @p string court_position_str - the name of the position we're interested in
	--- @p [opt=nil] number plot_id - the id of the plot (persistent data)
	--- @return boolean, string : whether giving the position is possible, message why it is impossible
	can_faction_use_intrigue = function(faction_court, faction_key, intrigue_str, court_position_str, plot_id)
		if not is_string(intrigue_str) then
			return false, " intrigue_str passed is not a string"
		elseif not is_string(faction_key) then
			return false, " faction_key passed is not a string"
		elseif not faction_court then
			return false, " no faction_court passed"
		end

		local intrigue = court.intrigues:get_by_name(intrigue_str)
		local localized_intrigue_name = get_localised_random_string(intrigue.localization_key)

		local result = ""

		local has_pending_dilemma = court.util_functions.is_dilemma_active()
		if has_pending_dilemma then
			local localized_error, _ = get_localised_random_string_and_source(court.ui.config.localization_keys.dilemma_is_active)
			result = court.util_functions.append_as_red_bullet_point(result, localized_error)
		end

		if not court.intrigue_functions.faction_has_access_to_intrigue(faction_key, intrigue_str) then
			local faction_screen_name = common.get_localised_string("factions_screen_name_" .. faction_key)
			local localized_error = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.not_accessible_to_faction, localized_intrigue_name, faction_screen_name)
			result = court.util_functions.append_as_red_bullet_point(result, localized_error)
		end

		local court_position_obj = court.util_functions.get_court_position(faction_court, court_position_str)
		if not court_position_obj.persistent.current_holder then
			local position_localized_string, _ = court.position_functions.get_localized_position_name(court_position_obj, faction_court)
			local localized_error = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.position_is_vacant, position_localized_string)
			result = court.util_functions.append_as_red_bullet_point(result, localized_error)
		end

		if court_position_obj.position_config.intrigue_immunity 
			and table_find(court_position_obj.position_config.intrigue_immunity, intrigue_str)
		then
			local position_localized_string, _ = court.position_functions.get_localized_position_name(court_position_obj, faction_court)
			local localized_error = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.cant_use_with_position, localized_intrigue_name, position_localized_string)
			result = court.util_functions.append_as_red_bullet_point(result, localized_error)
		end

		local court_actions_needed = court.intrigue_functions.get_intrigue_actions_needed(intrigue, faction_key, faction_court)
		local max_court_actions_per_turn = court.util_functions.max_court_actions_for_faction(faction_key)
		local court_actions_used_this_turn = court.util_functions.get_court_actions_used_this_turn(faction_key)
		local autopurchase_intrigue_actions = court.util_functions.get_property(faction_key, "can_purchase_court_actions") and court.config.autopurchase_intrigue_actions
		if max_court_actions_per_turn < court_actions_used_this_turn + court_actions_needed
			and not autopurchase_intrigue_actions
		then
			local localized_error = get_localised_text_replacement_and_source_formatted(court.intrigues.localization_text_keys.faction_actions_used_up_turn, max_court_actions_per_turn)
			result = court.util_functions.append_as_red_bullet_point(result, localized_error)
		end

		if not court.intrigue_functions.can_faction_afford_intrigue(faction_court, faction_key, intrigue, court_position_obj, plot_id) then
			local localized_error = get_localised_text_replacement_and_source(court.intrigues.localization_text_keys.faction_cannot_afford_it)
			result = court.util_functions.append_as_red_bullet_point(result, localized_error)
		end

		local cooldown_end_turn = court.position_functions.get_position_mark_value(court_position_obj, intrigue_str, faction_key, "cooldown_end_turn")
		if cooldown_end_turn then
			local current_turn = cm:model():turn_number()
			if current_turn < cooldown_end_turn then
				local cooldown_remaining = cooldown_end_turn - current_turn
				local cooldown_remaining_str = tostring(cooldown_remaining)
				local formatter_text, _ = get_localised_text_replacement_and_source_safe_formatted(court.ui.config.localization_keys.cooldown_ends_X_turns, cooldown_remaining_str)
				result = court.util_functions.append_as_red_bullet_point(result, formatter_text)
			end
		end

		-- some intrigues have specific restrictions
		if intrigue.can_use_intrigue then
			local faction_specific, requirements_txt = intrigue:can_use_intrigue(faction_court, court_position_obj, faction_key, plot_id)
			if not faction_specific then
				-- can_use_intrigue should return the points as red bullet points, so we don't need to add them as such, just append them
				result = court.util_functions.message_append(result, requirements_txt)
			end
		end

		if result == "" then
			return true, ""
		end

		return false, result
	end,

	has_faction_intrigue_available = function(faction_name)
		local faction_court = court.util_functions.get_faction_court_for_faction(faction_name)
		if not faction_court then
			return
		end

		local available_actions = court.util_functions.get_available_court_actions(faction_name)
		if available_actions <= 0 then
			return false
		end

		local accessible_intrigues = court.intrigue_functions.get_list_of_accessible_intrigues(faction_name)
		for _, position_obj in ipairs(faction_court.positions) do
			for __, intrigue_string in ipairs(accessible_intrigues) do
				local can_use = court.intrigue_functions.can_faction_use_intrigue(faction_court, faction_name, intrigue_string, position_obj.name)
				if can_use then
					return true
				end
			end
		end
		return false
	end,

	-------------------------------------------------------------------
	-- INTERNAL METHODS - meant to only be called from inside this file

	--- @function faction_has_access_to_intrigue
	--- @desc Checks if the factions could theoretically access the intrigue (unlike can_faction_use_intrigue does not check affordability or similar temporary restrictions)
	--- @p string faction_key - the faction key
	--- @p string intrigue_str - the name of the intrigue
	--- @return boolean - the intrigue accessibility
	faction_has_access_to_intrigue = function(faction_key, intrigue_str)
		local available_intrigues = court.intrigue_functions.get_list_of_accessible_intrigues(faction_key)
		for _, value in ipairs(available_intrigues) do
			if value == intrigue_str then
				return true
			end
		end
		return false
	end,

	can_faction_afford_intrigue = function(faction_court, faction_key, intrigue_obj, position_obj, plot_id)
		local intrigue_cost_obj = nil
		-- some intrigues have custom way to calculate the cost
		if is_function(intrigue_obj.get_custom_intrigue_cost_obj) then
			intrigue_cost_obj = intrigue_obj:get_custom_intrigue_cost_obj(faction_court, position_obj, faction_key, plot_id)
		else
			intrigue_cost_obj = court.intrigue_functions.get_intrigue_full_cost_obj(faction_court, intrigue_obj, faction_key, position_obj, nil, plot_id)
		end
		local faction_obj = cm:get_faction(faction_key)

		local can_afford = faction_obj:can_afford_resource_cost_object(intrigue_cost_obj)
		return can_afford
	end,

	get_intrigue_actions_needed = function(intrigue_obj, faction_key, faction_court)
		local court_actions_needed = court.config.intrigues_court_actions_needed
		if is_function(intrigue_obj.court_actions_needed_override) then
			court_actions_needed = intrigue_obj:court_actions_needed_override(faction_court, faction_key)
		end

		return court_actions_needed
	end,

	get_intrigue_base_cost_obj = function(faction_court, intrigue_obj, faction_key, position_obj)
		local base_cost_obj = cm:create_new_custom_resource_cost()

		-- this is the main way to set up costs
		if intrigue_obj.resource_costs_record then
			base_cost_obj:get_cost_from_record(intrigue_obj.resource_costs_record)
		elseif intrigue_obj.cost then
			-- this is meant for testing, only used if the main cost is removed or commented
			if intrigue_obj.cost then
				for _, resource_info in ipairs(intrigue_obj.cost) do
					base_cost_obj:add_resource_cost(resource_info[1], court.config.court_resource_factor, resource_info[2])
				end
			end
		end

		local legitimacy_corrected_cost_obj = cm:create_new_custom_resource_cost()

		local all_legitimacy_resource_keys = {}
		for _, court_obj in ipairs(court.all_courts) do
			local legitimacy_resource = court_obj.court_legitimacy()
			if legitimacy_resource then
				table.insert(all_legitimacy_resource_keys, legitimacy_resource.config.resource_key)
			end
		end

		-- check for incompatible legitimacy resource and remove it
		local resources = base_cost_obj:resources()
		for i = 1, #resources do
			local resource_name = resources[i][1]
			local resource_amount = resources[i][2]

			if not table.contains(all_legitimacy_resource_keys, resource_name) or faction_court.court_legitimacy().config.resource_key == resource_name then
				legitimacy_corrected_cost_obj:add_resource_cost(resource_name, court.config.court_resource_factor, resource_amount)
			end
		end

		return legitimacy_corrected_cost_obj
	end,

	get_intrigue_full_cost_obj = function(faction_court, intrigue_obj, faction_key, position_obj, input_cost_obj, plot_id)
		local cost_obj = nil
		if input_cost_obj then
			cost_obj = input_cost_obj
		else
			cost_obj = court.intrigue_functions.get_intrigue_base_cost_obj(faction_court, intrigue_obj, faction_key, position_obj)
		end

		-- intrigues against the court leader are more expensive - unless they are intrigues against plots, which are not affected
		if plot_id == nil and faction_court.config.ruler_position == position_obj.name then
			court.util_functions.add_court_leader_extra_cost(cost_obj)
		end

		if not faction_key then
			return cost_obj
		end

		-- some factions may purchase court actions
		local autopurchase_intrigue_actions = court.util_functions.get_property(faction_key, "can_purchase_court_actions") and court.config.autopurchase_intrigue_actions
		if autopurchase_intrigue_actions then
			local actions_needed = court.intrigue_functions.get_intrigue_actions_needed(intrigue_obj, faction_key, faction_court)
			local available_actions = court.util_functions.get_available_court_actions(faction_key)
			local extra_actions_needed = actions_needed - available_actions
			if extra_actions_needed > 0 then
				court.util_functions.add_court_action_purchase_cost(faction_key, cost_obj, extra_actions_needed)
			end
		end

		-- check for bonuses decreasing intrigue_cost (Vizier/Tuhkanti)
		-- reduce cost accordingly, if needed
		local faction_obj = cm:get_faction(faction_key)
		local price_change_perc = faction_obj:bonus_values():scripted_value("court_discount_mod", "value")
		if price_change_perc == 0 then
			return cost_obj
		end

		local discounted_cost_obj = cm:create_new_custom_resource_cost()

		local resources = cost_obj:resources()
		for i = 1, #resources do
			local price_change = (resources[i][2] * price_change_perc ) / 100
			local new_price = resources[i][2] + price_change

			if new_price > 0 then
				script_error("intrigue prices should use negative resources, but cost for ".. intrigue_obj.name .. " has positive numbers!")
			end
			discounted_cost_obj:add_resource_cost(resources[i][1], court.config.court_resource_factor, new_price)
		end

		return discounted_cost_obj
	end,

	pay_for_intrigue = function(faction_court, faction_key, intrigue_obj, position_obj, plot_id)
		local cost_obj = nil
		if is_function(intrigue_obj.get_custom_intrigue_cost_obj) then
			cost_obj = intrigue_obj:get_custom_intrigue_cost_obj(faction_court, position_obj, faction_key, plot_id)
		else 
			cost_obj = court.intrigue_functions.get_intrigue_full_cost_obj(faction_court, intrigue_obj, faction_key, position_obj, nil, plot_id)
		end
		local faction_obj = cm:get_faction(faction_key)
		cm:faction_apply_resource_transaction(faction_obj, cost_obj)

		local available_actions = court.util_functions.get_available_court_actions(faction_key)
		local court_actions_for_intrigue = court.intrigue_functions.get_intrigue_actions_needed(intrigue_obj, faction_key, faction_court)
		local extra_actions_needed = court_actions_for_intrigue - available_actions
		local can_autopurchase_intrigue_actions = court.util_functions.get_property(faction_key, "can_purchase_court_actions") and court.config.autopurchase_intrigue_actions
		-- the action is first paid for, then used up, and this is why if the two are equal we need one more
		if extra_actions_needed > 0
			and can_autopurchase_intrigue_actions
		then
			-- the action was already purchased, its cost is included in get_intrigue_full_cost_obj
			court.util_functions.add_court_extra_actions_for_faction(faction_key, extra_actions_needed)
		end
	end,
} -- court.intrigue_functions