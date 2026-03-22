out("Loading phar_court_plots.lua") 

-- main file phar.court.lua

-- plots work like intrigues (they were intrigues, once), but have delayed execution, chance to succeed or fail, and can be modified by intrigues
court.plots =
{
	get_plot_config_by_key = function(self, plot_key)
		for _, plot in ipairs(self) do
			if plot.plot_key == plot_key then
				return plot
			end
		end

		return nil
	end,

	localization_keys = {
		-- reasons why a plot can not be used
		threaten_cant_use_against_leader = "phar_main_court_plot_threaten_cant_use_against_leader",
		plot_not_accessible_to_faction = "phar_main_court_plot_not_accessible_to_faction",
		-- unlike can_not_start_plots_shemsu_hor = "phar_main_court_can_not_start_plots_shemsu_hor" this is an error message, not just an explanation text
		plot_forbidden_during_shemsu_hor = "phar_main_court_plot_not_accessible_shemsu_hor",
		position_is_vacant = "phar_main_court_position_is_vacant",
		cant_use_plot_against_position = "phar_main_court_cant_use_plot_against_position",
		faction_out_of_court_actions = "phar_main_court_faction_out_of_court_actions",
		faction_cant_afford_plot = "phar_main_court_faction_cant_afford_plot",
		faction_already_has_plot = "phar_main_court_faction_already_has_plot_against_position",

		-- strings to show how a plot's chance of success is done
		plot_chance_base = "phar_main_court_plot_chance_breakdown_base",
		plot_chance_legitimacy_own = "phar_main_court_plot_chance_breakdown_own_legitimacy",
		plot_chance_legitimacy_target = "phar_main_court_plot_chance_breakdown_target_legitimacy",
		plot_chance_legitimacy_ruler = "phar_main_court_plot_chance_breakdown_target_is_court_ruler",
		plot_chance_against_position = "phar_main_court_plot_chance_breakdown_target_position",

		plot_chance_region = "phar_map_court_plot_chance_factor_region",
		success_chance_accessible_both_sources_key = "phar_map_court_plot_chance_factor_two_sources",
		plot_chance_level = "phar_main_court_plot_chance_breakdown_level",
		plot_chance_war = "phar_main_court_plot_chance_breakdown_legitimacy_war",
		plot_chance_strongarm = "phar_main_court_plot_chance_breakdown_strongarm",
	},

	config = 
	{
		-- plots will resolve in this order
		priority_list = {"threaten", "assassinate", "embezzle", "discredit", "blackmail" },
		-- when a plot fails, the plotting faction loses this amount of legitimacy for EACH faction the plot was revealed to
		-- the targeted faction gains this much legitimacy
		-- I check that no faction loses more legitimacy than it has
		legitimacy_lost_on_failure_per_revealed = 3,

		-- base cost, multiplied by the level of the plot
		cost_to_remove_plot = "phar_main_court_intrigue_assist_1",
		-- how much the success chance is reduced when against the court leader (in %)
		court_leader_chance_penalty = 20,
		default_plot_duration = 5,
	},

	-- plots all use the same persistent data in the form of 
	-- plot_persistent_data = {
	-- 	plot_id = court.persistent.plot_last_id,
	-- 	plot_key = plot_key,
	-- 	plotting_faction = faction_key,
	-- 	target_court_name = faction_court_name,
	-- 	targeted_position = court_position_str,
	-- 	targeted_character_family_cqi - used when the character is removed from the position, but we need to show them in the log
	-- 	plot_level = starting_level,
	-- 	revealed_to = {},
	-- 	invalidated, -- if not nil, indicates the plot target was removed before the plot was resolved, and therefore this one is no longer valid
	-- }
	----------------------------------------------------
	-- COMMON PLOTS - used by almost all factions

	-- threaten
	{
		plot_key = "threaten",
		resource_costs_record = "",

		-- only used for testing and only if resource_costs_record is not found
		test_cost = 
		{
			{"troy_gold", -350},
		},

		-- success chance contributors
		-- formula is (BASE_CHANCE + (IMPROVEMENT_PER_LEVEL * (level - 1) + (PLOTTER_LEGITIMACY_MULTIPLIER * PLOTTER_LEGITIMACY) + (TARGET_LEGITIMACY_MULTIPLIER * TARGET_LEGITIMACY))
		success_chance_base = 50,
		success_chance_increase_per_level = 15,
		success_chance_plotter_legitimacy_multiplier = 0.2,
		success_chance_target_legitimacy_multiplier = -0.6,
		actions_restored_on_success = 1,

		legitimacy_lost_on_failure_base = 2,
		-- this is the value added to legitimacy_lost_on_failure_base during a legitimacy war
		additional_legitimacy_lost_on_failure_war = 2,

		--this setting is only used for non-court-ruler factions
		should_automatically_occupy_position_on_success = true,

		plot_localization_key = "random_localisation_strings_string_phar_main_court_plot_name_theaten",
		-- info texts shown before plot is resolved
		chance_key = "phar_main_court_plot_threaten_chance",
		success_key = "phar_main_court_plot_threaten_success",
		success_extra_key = "phar_main_court_plot_threaten_success_extra",
		success_warning_key = "phar_main_court_plot_threaten_success_warning",
		failure_key = "phar_main_court_plot_threaten_failure",

		-- flavor texts shown after plot is resolved
		localization_key_success = "phar_main_court_plot_threaten_on_success_info",
		localization_key_failed = "phar_main_court_plot_threaten_on_failure_info",

		plot_icon_path = "ui\\skins\\default\\court\\intrigue_icons\\icon_court_intrigue_threaten.png",
		-- some courts (the Mesopotamian) have alternative displays
		court_ui_overrides = 
		{
			mesopotamian_court = 
			{
				plot_localization_key = "ui_text_replacements_localised_text_phar_intrigue_depose",
				success_key = "phar_map_court_plot_depose_success_extra",
				plot_icon_path = "ui\\skins\\default\\court\\intrigue_icons\\icon_court_intrigue_delegitimize.png",
			},
		},

		target_effect_on_success = "effect_bundle_agent_priestess_target_sacrifice_bad_omens_01",
		target_effect_duration = 5,
		get_effect_info_for_level = function(self, faction_court_obj, position_obj, faction_key, plot_level)
			local display_chance = court.plot_functions:calculate_chance_for_level(self, faction_court_obj, faction_key, position_obj, plot_level, true)
			local position_character_obj = cm:get_character(position_obj.persistent.current_holder)
			local display_name = position_character_obj:onscreen_name()

			local localized_position_name, _ = court.position_functions.get_localized_position_name(position_obj, faction_court_obj)
			local ui_info, _ = get_localised_text_replacement_and_source_formatted(self.chance_key, display_chance, self.success_chance_base, display_name, localized_position_name)

			local on_success_key = court.plot_functions.get_plot_on_success_key(self, faction_court_obj)
			local on_success_str, _ = get_localised_text_replacement_and_source_formatted(on_success_key, display_name, localized_position_name)
			local is_leader_threatening = (faction_court_obj:ruling_faction() == faction_key)
			local will_occupy = false
			-- the ruling faction leader is the Pharaoh, and they can't directly gain new positions
			-- everyone else who succeeds in threatening a position gains the position
			if (not is_leader_threatening) 
				and self.should_automatically_occupy_position_on_success 
				and (not faction_court_obj.config.any_faction_can_hold_multiple_positions)
			then
				local faction_obj = cm:get_faction(faction_key)
				local leader_character_obj = faction_obj:faction_leader()
				local plotter_display_name = leader_character_obj:onscreen_name()
				local localized_text, _ = get_localised_text_replacement_and_source_formatted(self.success_extra_key, plotter_display_name, localized_position_name)
				on_success_str = localized_text
				will_occupy = true
			end

			ui_info = court.util_functions.message_append(ui_info, on_success_str)

			--[[ Threaten no longer requires payment, so the warning for payment is commented out
			if will_occupy then
				local on_success_warning, _ = get_localised_text_replacement_and_source(self.success_warning_key)
				ui_info = court.util_functions.message_append(ui_info, on_success_warning)
			end
			]]

			local legitimacy_lost_per_revealed = court.plots.config.legitimacy_lost_on_failure_per_revealed
			local legitimacy_lost = self.legitimacy_lost_on_failure_base
			if self.additional_legitimacy_lost_on_failure_war and court.util_functions.is_in_legitimacy_war(faction_court_obj) then
				legitimacy_lost = legitimacy_lost + self.additional_legitimacy_lost_on_failure_war
			end

			local on_failure_str, _ = get_localised_text_replacement_and_source_safe_formatted(self.failure_key,
				legitimacy_lost, 
				faction_court_obj.config.court_legitimacy_text_icon,
				legitimacy_lost_per_revealed)

			ui_info = court.util_functions.message_append(ui_info, on_failure_str)

			return ui_info
		end,

		--- @return boolean, string : whether giving the position is possible, message why it is impossible
		can_use_plot = function(self, faction_court_table, court_position_obj)
			local result = ""
			if court_position_obj.name == faction_court_table.config.ruler_position then
				local text, _ = get_localised_text_replacement_and_source(court.plots.localization_keys.threaten_cant_use_against_leader)
				result = court.util_functions.append_as_red_bullet_point(result, text)
			end

			if result ~= "" then
				return false, result
			end

			return true, ""
		end,

		on_success = function(self, plot_persistent_data)
			local faction_court_name = plot_persistent_data.target_court_name
			local faction_court_obj = court.util_functions.get_faction_court_by_name(faction_court_name)
			local position_str = plot_persistent_data.targeted_position
			local court_position = court.util_functions.get_court_position(faction_court_obj, position_str)

			local holding_character_str = court_position.persistent.current_holder
			local holding_character_obj = cm:get_character(court_position.persistent.current_holder)
			local character_cqi = holding_character_obj:command_queue_index()
			cm:apply_effect_bundle_to_character(self.target_effect_on_success, character_cqi, self.target_effect_duration)

			court.position_functions.remove_character_from_position(faction_court_obj, position_str, true)

			local plotting_faction = plot_persistent_data.plotting_faction
			court.util_functions.add_court_extra_actions_for_faction(plotting_faction, self.actions_restored_on_success)
			local faction_table = court.util_functions.get_faction_persistent_data(plotting_faction)

			if faction_court_obj:ruling_faction() ~= plotting_faction
				and self.should_automatically_occupy_position_on_success
				and (not faction_court_obj.config.any_faction_can_hold_multiple_positions)
				and ((not faction_table.owned_positions) or #faction_table.owned_positions <= 0)
			then
				court.position_functions.claim_position(faction_court_obj, plotting_faction, position_str, false, true)
			end
		end,
	},
	-- end of threaten

	-- discredit
	{
		plot_key = "discredit",

		resource_costs_record = "",

		-- success chance contributors
		-- formula is (BASE_CHANCE + (0 or success_chance_war if at war) + (IMPROVEMENT_PER_LEVEL * (level - 1) + (PLOTTER_LEGITIMACY_MULTIPLIER * PLOTTER_LEGITIMACY) + (TARGET_LEGITIMACY_MULTIPLIER * TARGET_LEGITIMACY))
		success_chance_base = 50,
		-- this is the added value during a legitimacy war
		success_chance_war = 10,
		success_chance_increase_per_level = 15,
		success_chance_plotter_legitimacy_multiplier = 0.2,
		success_chance_target_legitimacy_multiplier = -0.5,

		legitimacy_stolen_base = 10,
		-- this is the value added to legitimacy_stolen_base during a legitimacy war
		additional_legitimacy_stolen_war = 5,
		legitimacy_stolen_increase_per_level = 2,
		-- placeholder value for testing
		-- plot_duration = 3,

		plot_localization_key = "random_localisation_strings_string_phar_main_court_plot_name_discredit",

		-- info texts shown before plot is resolved
		chance_key = "phar_main_court_plot_discredit_chance",
		success_key = "phar_main_court_plot_discredit_success",
		failure_key = "phar_main_court_plot_discredit_failure",

		-- flavor texts shown after plot is resolved
		localization_key_success = "phar_main_court_plot_discredit_on_success_info",
		localization_key_failed = "phar_main_court_plot_discredit_on_failure_info",

		plot_icon_path = "ui\\skins\\default\\court\\intrigue_icons\\icon_court_intrigue_scapegoat.png",

		get_effect_info_for_level = function(self, faction_court_obj, position_obj, faction_key, plot_level)
			local legitimacy_stolen =  self:get_legitimacy_stolen(faction_court_obj, plot_level, faction_key)
			local display_chance = court.plot_functions:calculate_chance_for_level(self, faction_court_obj, faction_key, position_obj, plot_level, true)

			local localized_position_name, _ = court.position_functions.get_localized_position_name(position_obj, faction_court_obj)

			local ui_info, _ = get_localised_text_replacement_and_source_formatted(self.chance_key, display_chance, self.success_chance_base, localized_position_name)

			local targeted_faction_display_str = common.get_localised_string("factions_screen_name_" .. position_obj.persistent.current_holder_faction)

			local on_success_key = court.plot_functions.get_plot_on_success_key(self, faction_court_obj)
			local on_success_str, _ = get_localised_text_replacement_and_source_safe_formatted(on_success_key, 
				legitimacy_stolen,
				faction_court_obj.config.court_legitimacy_text_icon,
				targeted_faction_display_str)

			ui_info = court.util_functions.message_append(ui_info, on_success_str)

			local legitimacy_lost_per_revealed = court.plots.config.legitimacy_lost_on_failure_per_revealed
			local on_failure_str, _ = get_localised_text_replacement_and_source_safe_formatted(self.failure_key,
				legitimacy_lost_per_revealed, 
				faction_court_obj.config.court_legitimacy_text_icon)
			ui_info = court.util_functions.message_append(ui_info, on_failure_str)

			return ui_info
		end,

		get_legitimacy_stolen = function(self, faction_court_obj, plot_level, faction_key)
			local legitimacy_stolen = self.legitimacy_stolen_base
			if self.additional_legitimacy_stolen_war and court.util_functions.is_in_legitimacy_war(faction_court_obj) then
				legitimacy_stolen = legitimacy_stolen + self.additional_legitimacy_stolen_war
			end

			local faction_config = court.util_functions.get_faction_config(faction_key)
			if faction_config 
				and faction_config.additional_legitimacy_plots
				and is_number(faction_config.additional_legitimacy_plots[self.plot_key])
			then
				legitimacy_stolen = legitimacy_stolen + faction_config.additional_legitimacy_plots[self.plot_key]
			end

			legitimacy_stolen = legitimacy_stolen + ((plot_level - 1) * self.legitimacy_stolen_increase_per_level)
			return legitimacy_stolen
		end,

		on_success = function(self, plot_persistent_data)
			local faction_court_name = plot_persistent_data.target_court_name
			local faction_court_obj = court.util_functions.get_faction_court_by_name(faction_court_name)
			local position_str = plot_persistent_data.targeted_position
			local position_obj = court.util_functions.get_court_position(faction_court_obj, position_str)

			local target_faction_key = position_obj.persistent.current_holder_faction

			local legitimacy_stolen = self:get_legitimacy_stolen(faction_court_obj, plot_persistent_data.plot_level, plot_persistent_data.plotting_faction)
			court.plot_functions:transfer_legitimacy(faction_court_obj, legitimacy_stolen, target_faction_key, plot_persistent_data.plotting_faction)

			court.output(plot_persistent_data.plotting_faction .. " has stolen " .. legitimacy_stolen .. " legitimacy from " .. target_faction_key .. "!")
		end,

		on_failure = function(self, plot_persistent_data)
			-- no failure action besides the base effect on failure - transferring legitimacy for each faction the plot is revealed to
			-- but this is done in execute_effects_of_failed_plot and resolve_threaten_plots_against_position
		end,
	}, 
	-- end of discredit

	-- blackmail
	{
		plot_key = "blackmail",

		resource_costs_record = "",

		-- success chance contributors
		-- formula is (BASE_CHANCE + (0 or success_chance_war if at war) + (IMPROVEMENT_PER_LEVEL * (level - 1) + (PLOTTER_LEGITIMACY_MULTIPLIER * PLOTTER_LEGITIMACY) + (TARGET_LEGITIMACY_MULTIPLIER * TARGET_LEGITIMACY))
		success_chance_base = 50,
		-- this is the value added during a legitimacy war
		success_chance_war = 30,
		success_chance_increase_per_level = 15,
		success_chance_plotter_legitimacy_multiplier = 0.2,
		success_chance_target_legitimacy_multiplier = -0.3,

		regard_gained_base = 60,
		-- this is the value added to regard_gained_base during a legitimacy war
		additional_regard_gained_war = 60,
		regard_gained_increase_per_level = 20,
		gold_gained_multiplier = 0.2,

		plot_localization_key = "random_localisation_strings_string_phar_main_court_plot_name_blackmail",

		-- info texts shown before plot is resolved
		chance_key = "phar_main_court_plot_blackmail_chance",
		success_key = "phar_main_court_plot_blackmail_success",
		failure_key = "phar_main_court_plot_blackmail_failure",

		-- flavor texts shown after plot is resolved
		localization_key_success = "phar_main_court_plot_blackmail_on_success_info",
		localization_key_failed = "phar_main_court_plot_blackmail_on_failure_info",
		plot_icon_path = "ui\\skins\\default\\court\\intrigue_icons\\icon_court_intrigue_false_promise.png",

		get_effect_info_for_level = function(self, faction_court_obj, position_obj, faction_key, plot_level)
			local regard_gained = self:get_regard_gained(faction_court_obj, plot_level)
			local holder_faction_key = position_obj.persistent.current_holder_faction
			local gold_gained = self:get_gold_gained(faction_court_obj, plot_level, holder_faction_key)
			local display_chance = court.plot_functions:calculate_chance_for_level(self, faction_court_obj, faction_key, position_obj, plot_level, true)

			local targeted_faction_display_str = common.get_localised_string("factions_screen_name_" .. holder_faction_key)
			local localized_position_name, _ = court.position_functions.get_localized_position_name(position_obj, faction_court_obj)

			local ui_info, _ = get_localised_text_replacement_and_source_formatted(self.chance_key, display_chance, self.success_chance_base, localized_position_name)

			local on_success_key = court.plot_functions.get_plot_on_success_key(self, faction_court_obj)
			local on_success_str, _ = get_localised_text_replacement_and_source_safe_formatted(on_success_key, regard_gained, gold_gained, targeted_faction_display_str)
			ui_info = court.util_functions.message_append(ui_info, on_success_str)

			local legitimacy_lost_per_revealed = court.plots.config.legitimacy_lost_on_failure_per_revealed
			local on_failure_str, _ = get_localised_text_replacement_and_source_safe_formatted(self.failure_key,
				faction_court_obj.config.court_legitimacy_text_icon,
				legitimacy_lost_per_revealed)

			ui_info = court.util_functions.message_append(ui_info, on_failure_str)

			return ui_info
		end,

		on_success = function(self, plot_persistent_data)
			local faction_court_name = plot_persistent_data.target_court_name
			local faction_court_obj = court.util_functions.get_faction_court_by_name(faction_court_name)
			local position_str = plot_persistent_data.targeted_position
			local position_obj = court.util_functions.get_court_position(faction_court_obj, position_str)

			local target_faction_key = position_obj.persistent.current_holder_faction

			local plot_level = plot_persistent_data.plot_level
			-- we give the regard from the plot
			local regard_gained = self:get_regard_gained(faction_court_obj, plot_level)
			court.position_functions.change_regard_towards_faction_by_obj(position_obj, plot_persistent_data.plotting_faction, regard_gained)

			-- we give the gold from the plot
			local plotter_faction_key = plot_persistent_data.plotting_faction
			local plotting_faction_obj = cm:get_faction(plotter_faction_key)
			local gold_gained = self:get_gold_gained(faction_court_obj, plot_level, target_faction_key)
			local reward_obj = cm:create_new_custom_resource_cost()
			reward_obj:add_resource_cost("troy_gold", court.config.court_resource_factor, gold_gained)
			cm:faction_apply_resource_transaction(plotting_faction_obj, reward_obj)
		end,

		on_failure = function(self, plot_persistent_data)
			-- no failure action besides the base effect on failure - transferring legitimacy for each faction the plot is revealed to
			-- but this is done in execute_effects_of_failed_plot and resolve_threaten_plots_against_position
		end,

		get_regard_gained = function(self, faction_court_obj, plot_level)
			local regard_gained = self.regard_gained_base
			if self.additional_regard_gained_war and court.util_functions.is_in_legitimacy_war(faction_court_obj) then
				regard_gained = regard_gained + self.additional_regard_gained_war
			end

			regard_gained = regard_gained + (plot_level - 1) * self.regard_gained_increase_per_level
			return regard_gained
		end,

		get_gold_gained = function(self, faction_court_obj, plot_level, target_faction_key)
			local target_legitimacy = faction_court_obj.court_legitimacy():get_legitimacy(target_faction_key)
			local gold_gained = plot_level * target_legitimacy * self.gold_gained_multiplier
			gold_gained = math.floor(gold_gained)
			return gold_gained
		end,
	},
	-- end of blackmail

	-- end of COMMON PLOTS

	-- start of FACTION SPECIFIC PLOTS

	-- end of FACTION SPECIFIC PLOTS

	-- start of POSITION SPECIFIC PLOTS

	-- assassinate_plot
	{
		plot_key = "assassinate",

		resource_costs_record = "",

		-- success chance contributors
		-- formula is (BASE_CHANCE + (0 or success_chance_war if at war) + (IMPROVEMENT_PER_LEVEL * (level - 1)) + (PLOTTER_LEGITIMACY_MULTIPLIER * PLOTTER_LEGITIMACY) + (TARGET_LEGITIMACY_MULTIPLIER * TARGET_LEGITIMACY)
		success_chance_base = 30,
		-- this is the value added during a legitimacy war
		success_chance_war = 20,
		success_chance_increase_per_level = 15,
		success_chance_plotter_legitimacy_multiplier = 0.2,
		success_chance_target_legitimacy_multiplier = -0.5,

		-- this plot is normally accessible from a position (accessible_to_positions), but if the faction already has access to it - it gains this additional chance in %
		success_chance_accessible_both_sources = 5,

		extra_starting_level_pschent_crown = 1,

		accessible_to_positions = {"vizier", "tuhkanti", "king_of_hanigalbat",},

		legitimacy_lost_on_failure_base = 3,
		-- this is the value added to legitimacy_lost_on_failure_base during a legitimacy war
		additional_legitimacy_lost_on_failure_war = 3,
		-- the base failure already removes court.plots.config.legitimacy_lost_on_failure_per_revealed of legitimacy for each revealed faction
		-- for this plot we remove a bit more
		legitimacy_lost_on_failure_per_revealed = 2,

		-- the bonuses or penalties are defined in DaVE records so need to be clamped to within [-6, 6]
		diplomatic_effect_success = -6,
		diplomatic_effect_failure = -4,
		plot_localization_key = "random_localisation_strings_string_phar_main_court_plot_name_assassinate",

		-- info texts shown before plot is resolved
		chance_key = "phar_main_court_plot_assassinate_chance",
		success_key = "phar_main_court_plot_assassinate_success",
		success_extra_key = "phar_main_court_plot_assassinate_success_extra",
		failure_key = "phar_main_court_plot_assassinate_failure",

		-- flavor texts shown after plot is resolved
		localization_key_success = "phar_main_court_plot_assassinate_on_success_info",
		localization_key_failed = "phar_main_court_plot_assassinate_on_failure_info",
		plot_icon_path = "ui\\skins\\default\\court\\intrigue_icons\\icon_court_intrigue_conspire.png",

		-- access to this plot is not given by the factions_config
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

			if faction_table.has_assassinate_request then
				return true
			end

			return false
		end,

		get_extra_starting_level = function(self, court_obj)
			if court.util_functions.is_pschent_crown_equipped(court_obj) then
				return self.extra_starting_level_pschent_crown
			end
			return 0
		end,

		-- optional method, the default value is court.config.plots_court_actions_needed (1) when no such method
		court_actions_needed_override = function(self, faction_court, faction_key)
			local faction_table = court.util_functions.get_faction_persistent_data(faction_key)
			if faction_table.has_assassinate_request then
				return 0
			end
			return court.config.plots_court_actions_needed
		end,

		get_effect_info_for_level = function(self, faction_court_obj, position_obj, faction_key, plot_level)
			local display_chance = court.plot_functions:calculate_chance_for_level(self, faction_court_obj, faction_key, position_obj, plot_level, true)

			local character_obj = cm:get_character(position_obj.persistent.current_holder)
			local display_name = character_obj:onscreen_name()
			local ui_info, _ = get_localised_text_replacement_and_source_formatted(self.chance_key, display_chance, self.success_chance_base, display_name)

			local on_success_key = court.plot_functions.get_plot_on_success_key(self, faction_court_obj)
			local on_success_str = get_localised_text_replacement_and_source_formatted(on_success_key, display_name)
			ui_info = court.util_functions.message_append(ui_info, on_success_str)
			if faction_court_obj.config.ruler_position == position_obj.name then
				on_success_str, _ = get_localised_text_replacement_and_source(self.success_extra_key)
				ui_info = court.util_functions.message_append(ui_info, on_success_str)
			end

			local legitimacy_lost_per_revealed = self.legitimacy_lost_on_failure_per_revealed + court.plots.config.legitimacy_lost_on_failure_per_revealed
			local legitimacy_lost = self.legitimacy_lost_on_failure_base
			if self.additional_legitimacy_lost_on_failure_war and court.util_functions.is_in_legitimacy_war(faction_court_obj) then
				legitimacy_lost = legitimacy_lost + self.additional_legitimacy_lost_on_failure_war
			end
			local on_failure_str, _ = get_localised_text_replacement_and_source_safe_formatted(self.failure_key,
				legitimacy_lost, 
				faction_court_obj.config.court_legitimacy_text_icon,
				legitimacy_lost_per_revealed)

			ui_info = court.util_functions.message_append(ui_info, on_failure_str)

			return ui_info
		end,

		on_created = function(self, plot_persistent_data)
			local faction_table = court.util_functions.get_faction_persistent_data(plot_persistent_data.plotting_faction)
			if faction_table.has_assassinate_request then
				faction_table.has_assassinate_request = nil
			end
		end,

		on_success = function(self, plot_persistent_data)
			local faction_court_name = plot_persistent_data.target_court_name
			local faction_court_obj = court.util_functions.get_faction_court_by_name(faction_court_name)
			local position_str = plot_persistent_data.targeted_position
			local position_obj = court.util_functions.get_court_position(faction_court_obj, position_str)
			local is_leader_assassinated = (faction_court_obj.config.ruler_position == position_str)

			local target_faction_key = position_obj.persistent.current_holder_faction
			local char_lookup = position_obj.persistent.current_holder

			local target_character_obj = cm:get_character(char_lookup)
			if (not target_character_obj)
				or target_character_obj:is_null_interface()
			then
				court.output("Error: '" .. self.plot_key .. "' used against '" .. position_str .. "' but current holder character could not be found!")
				return
			end

			if not is_leader_assassinated then
				court.position_functions.remove_character_from_position(faction_court_obj, position_str)
			end

			cm:kill_character_and_commanded_unit_with_dt(char_lookup, false, "ASSASSINATED")
			-- if the faction managed to assassinate the pharaoh, they should declare for pretender (if eligible)
			local political_states = faction_court_obj.political_states()
			if is_leader_assassinated
				and political_states:is_eligible_to_participate_in_legitimacy_war(plot_persistent_data.plotting_faction)
				and (not court.util_functions.is_in_legitimacy_war(faction_court_obj))
			then
				political_states:announce_faction_for_pretender(plot_persistent_data.plotting_faction)
			end
		end,
	},
	-- end of assassinate_plot

	-- embezzle_plot
	{
		plot_key = "embezzle",

		resource_costs_record = "",
		base_reward_record = "phar_main_court_plot_embezzle",
		reward_multiplier_increase_per_level = 0.25,
		-- formula is: base_reward_record + base_reward_record * (lv - 1) * reward_multiplier_increase_per_level
		-- e.g. with reward_multiplier_increase_per_level == 1, lv5 gives 5 times more than lv 1 (1 base, plus 4 from lv increase)
		-- with reward_multiplier_increase_per_level == 0.25, lv 5 gives 2 times more than lv 1 (1 base, plus 1 from lv increase)

		-- success chance contributors
		-- formula is (BASE_CHANCE + (0 or success_chance_war if at war) + (IMPROVEMENT_PER_LEVEL * (level - 1)) + (PLOTTER_LEGITIMACY_MULTIPLIER * PLOTTER_LEGITIMACY) + (TARGET_LEGITIMACY_MULTIPLIER * TARGET_LEGITIMACY)
		success_chance_base = 30,
		-- this is the added value during a legitimacy war
		success_chance_war = 20,
		success_chance_increase_per_level = 15,
		success_chance_plotter_legitimacy_multiplier = 0.2,
		success_chance_target_legitimacy_multiplier = -0.6,
		extra_starting_level_pschent_crown = 1,

		legitimacy_stolen_base = 5,
		-- this is the value added during a legitimacy war
		additional_legitimacy_stolen_war = 5,
		-- by current design, legitimacy stolen does not scale with plot lv, but it could change
		legitimacy_stolen_increase_per_level = 2,

		legitimacy_lost_on_failure_base = 3,
		-- this is the value added to legitimacy_lost_on_failure_base during a legitimacy war
		additional_legitimacy_lost_on_failure_war = 3,
		-- the base failure already removes court.plots.config.legitimacy_lost_on_failure_per_revealed of legitimacy for each revealed faction
		-- for this plot we remove a bit more
		legitimacy_lost_on_failure_per_revealed = 3,

		accessible_to_positions = {"royal_treasurer", "lawgiver", "king_of_assur", "grand_telestas"},

		plot_localization_key = "random_localisation_strings_string_phar_main_court_plot_name_embezzle",

		-- info texts shown before plot is resolved
		chance_key = "phar_main_court_plot_embezzle_chance",
		success_key = "phar_main_court_plot_embezzle_success",
		failure_key = "phar_main_court_plot_embezzle_failure",

		-- flavor texts shown after plot is resolved
		localization_key_success = "phar_main_court_plot_embezzle_on_success_info",
		localization_key_failed = "phar_main_court_plot_embezzle_on_failure_info",
		plot_icon_path = "ui\\skins\\default\\court\\intrigue_icons\\icon_court_intrigue_bribe.png",

		-- access to this plot is not given by the factions_config
		-- it has a special way of allowing access (being visible in the menu)
		-- effectively same as in 'assassinate', think about pulling them in a common method
		has_special_access = function(self, faction_key)
			local faction_table = court.util_functions.get_faction_persistent_data(faction_key)

			if faction_table.owned_positions then
				for _, owned_position in ipairs(faction_table.owned_positions) do
					if table_find(self.accessible_to_positions, owned_position) then
						return true
					end
				end
			end

			if faction_table.has_embezzle_request then
				return true
			end

			return false
		end,

		get_extra_starting_level = function(self, court_obj)
			if court.util_functions.is_pschent_crown_equipped(court_obj) then
				return self.extra_starting_level_pschent_crown
			end
			return 0
		end,

		-- optional method, the default value is court.config.plots_court_actions_needed (1) when no such method
		court_actions_needed_override = function(self, faction_court, faction_key)
			local faction_table = court.util_functions.get_faction_persistent_data(faction_key)
			if faction_table.has_embezzle_request then
				return 0
			end
			return court.config.plots_court_actions_needed
		end,

		get_effect_info_for_level = function(self, faction_court_obj, position_obj, faction_key, plot_level)
			local reward_obj = self:get_reward_obj_for_lv(plot_level)
			local reward_str = reward_obj:to_string()
			local legitimacy_stolen = self:get_legitimacy_stolen(faction_court_obj, plot_level, faction_key)
			local display_chance = court.plot_functions:calculate_chance_for_level(self, faction_court_obj, faction_key, position_obj, plot_level, true)

			local localized_position_name, _ = court.position_functions.get_localized_position_name(position_obj, faction_court_obj)

			local ui_info, _ = get_localised_text_replacement_and_source_formatted(self.chance_key, display_chance, self.success_chance_base, localized_position_name)

			local targeted_faction_display_str = common.get_localised_string("factions_screen_name_" .. position_obj.persistent.current_holder_faction)
			local on_success_key = court.plot_functions.get_plot_on_success_key(self, faction_court_obj)
			local on_success_str, _ = get_localised_text_replacement_and_source_safe_formatted(on_success_key,
				reward_str,
				legitimacy_stolen,
				faction_court_obj.config.court_legitimacy_text_icon,
				targeted_faction_display_str)

			ui_info = court.util_functions.message_append(ui_info, on_success_str)

			local legitimacy_lost_per_revealed = self.legitimacy_lost_on_failure_per_revealed + court.plots.config.legitimacy_lost_on_failure_per_revealed
			local legitimacy_lost = self.legitimacy_lost_on_failure_base
			if self.additional_legitimacy_lost_on_failure_war and court.util_functions.is_in_legitimacy_war(faction_court_obj) then
				legitimacy_lost = legitimacy_lost + self.additional_legitimacy_lost_on_failure_war
			end

			local on_failure_str, _ = get_localised_text_replacement_and_source_safe_formatted(self.failure_key,
				legitimacy_lost, 
				faction_court_obj.config.court_legitimacy_text_icon,
				legitimacy_lost_per_revealed)

			ui_info = court.util_functions.message_append(ui_info, on_failure_str)

			return ui_info
		end,

		on_created = function(self, plot_persistent_data)
			local faction_table = court.util_functions.get_faction_persistent_data(plot_persistent_data.plotting_faction)
			if faction_table.has_embezzle_request then
				faction_table.has_embezzle_request = nil
			end
		end,

		on_success = function(self, plot_persistent_data)
			local faction_court_name = plot_persistent_data.target_court_name
			local faction_court_obj = court.util_functions.get_faction_court_by_name(faction_court_name)
			local position_str = plot_persistent_data.targeted_position
			local position_obj = court.util_functions.get_court_position(faction_court_obj, position_str)
			local target_faction_key = position_obj.persistent.current_holder_faction

			local plotter_faction_key = plot_persistent_data.plotting_faction
			local plotting_faction_obj = cm:get_faction(plotter_faction_key)

			local plot_level = plot_persistent_data.plot_level

			-- get reward and give it
			local reward_obj = self:get_reward_obj_for_lv(plot_level)
			cm:faction_apply_resource_transaction(plotting_faction_obj, reward_obj)

			-- steal legitimacy, indicating we framed a faction for the theft
			local legitimacy_stolen = self:get_legitimacy_stolen(faction_court_obj, plot_level, plotter_faction_key)
			court.plot_functions:transfer_legitimacy(faction_court_obj, legitimacy_stolen, target_faction_key, plotter_faction_key)
		end,

		get_legitimacy_stolen = function(self, faction_court_obj, plot_level, faction_key)
			local legitimacy_stolen = self.legitimacy_stolen_base
			if self.additional_legitimacy_stolen_war and court.util_functions.is_in_legitimacy_war(faction_court_obj) then
				legitimacy_stolen = legitimacy_stolen + self.additional_legitimacy_stolen_war
			end

			local faction_config = court.util_functions.get_faction_config(faction_key)
			if faction_config 
				and faction_config.additional_legitimacy_plots
				and is_number(faction_config.additional_legitimacy_plots[self.plot_key])
			then
				legitimacy_stolen = legitimacy_stolen + faction_config.additional_legitimacy_plots[self.plot_key]
			end
			legitimacy_stolen = legitimacy_stolen + ((plot_level - 1) * self.legitimacy_stolen_increase_per_level)
			return legitimacy_stolen
		end,

		get_reward_obj_for_lv = function(self, plot_level)
			local reward = cm:create_new_custom_resource_cost()
			reward:get_cost_from_record(self.base_reward_record)

			local multiplier = 1 + ((plot_level - 1) * self.reward_multiplier_increase_per_level)
			reward:multiply_by(multiplier)
			return reward
		end,
	},
	-- end of embezzle_plot

	-- end of POSITION SPECIFIC PLOTS
}

court.plot_functions =
{
	-------------------------------------------------------------------------------------
	-- EXTERNAL METHODS: meant to be called from outside this file, for UI or AI purposes

	--- @function get_list_of_accessible_plots
	--- @desc Returns a list of all plot ids the faction has access to
	--- @p string faction_key - the faction key
	--- @p int special_access_chance - a chance in % to gain special access to a plot even if not otherwise allowed - used in AI plot generation
	--- @return table of strings with the names of the plots
	get_list_of_accessible_plots = function(faction_key, special_access_chance)
		local default_plots = court.util_functions.get_property(faction_key, "available_plots")

		-- we make a copy, so we can modify it without changing the original
		local available_plots = table_deep_copy(default_plots)
		if court.factions_config[faction_key] then
			if is_table(court.factions_config[faction_key].additional_plots) then
				table_append(available_plots, court.factions_config[faction_key].additional_plots)
			end
		end

		for _, plot in ipairs(court.plots) do
			if is_function(plot.has_special_access) 
				and plot.plot_key
				and (not table_find(available_plots, plot.plot_key))
			then
				if plot:has_special_access(faction_key) then
					table.insert(available_plots, plot.plot_key)
				elseif is_number(special_access_chance) then
					local rand_int = cm:model():random_int(1, 100)
					if rand_int < special_access_chance then
						table.insert(available_plots, plot.plot_key)
					end
				end
			end
		end
		return available_plots
	end,

	get_plot_starting_level = function(self, court_obj, faction_key, plot_config)
		local result = court.util_functions.get_property(faction_key, "starting_plot_level")
		if plot_config and is_function(plot_config.get_extra_starting_level) then
			result = result + plot_config:get_extra_starting_level(court_obj)
		end
		return result
	end,

	get_plot_max_level = function(self, faction_key)
		local result = court.util_functions.get_property(faction_key, "max_plot_level")
		return result
	end,

	get_effect_info_for_existing_plot = function(plot_persistent_data)
		local faction_court_name = plot_persistent_data.target_court_name
		local faction_court_obj = court.util_functions.get_faction_court_by_name(faction_court_name)
		local position_str = plot_persistent_data.targeted_position
		local faction_key = plot_persistent_data.plotting_faction

		--court.output("Faction '" .. faction_key .. "' has plot '" .. plot_persistent_data.plot_key .. "' against " .. position_str)
		local position_obj = court.util_functions.get_court_position(faction_court_obj, position_str)

		local local_level = plot_persistent_data.plot_level
		local plot_config = court.plots:get_plot_config_by_key(plot_persistent_data.plot_key)
		local ui_info = plot_config:get_effect_info_for_level(faction_court_obj, position_obj, faction_key, local_level)
		return ui_info
	end,

	get_effect_info_for_new_plot = function(faction_court_obj, targeted_position_obj, plotting_faction_key, plot_config)
		local level = court.plot_functions:get_plot_starting_level(faction_court_obj, plotting_faction_key, plot_config)
		return plot_config:get_effect_info_for_level(faction_court_obj, targeted_position_obj, plotting_faction_key, level)
	end,

	-- add check plot is available
	-- skip_payment is optional, should be nil for normal use
	-- returns int, table: the id of the plot, and the plot persistent data, or nil if unable
	create_plot = function(faction_court_name, faction_key, plot_key, court_position_str, skip_payment, ignore_active_dilemma, ignore_court_actions)
		local plot_config = court.plots:get_plot_config_by_key(plot_key)
		if not plot_config then
			court.output("Error: no plot config found for plot key '" .. plot_key .. "'!", 10)
			return nil
		end

		local faction_court_obj = court.util_functions.get_faction_court_by_name(faction_court_name)
		local plot_accessibility, failure_reason = court.plot_functions.can_faction_use_plot(faction_court_obj, faction_key, plot_key, court_position_str, skip_payment, ignore_active_dilemma)
		if not plot_accessibility then
			court.output("Error: faction '" .. faction_key .. "' tried to use create plot '" .. plot_key .. "', but can't, due to : \n ".. failure_reason, 10)
			return nil
		end

		local target_position_obj = court.util_functions.get_court_position(faction_court_obj, court_position_str)
		if not skip_payment then
			court.plot_functions.pay_for_plot(faction_court_obj, faction_key, plot_key, target_position_obj)
		end

		local starting_level = court.plot_functions:get_plot_starting_level(faction_court_obj, faction_key, plot_config)
		local targeted_character = cm:get_character(target_position_obj.persistent.current_holder)
		local family_member_cqi = targeted_character:family_member():command_queue_index()
		local create_turn = cm:model():turn_number()
		local resolve_turn = create_turn
		if shemsu_hor.is_active then
			-- if Shemsu Hor is active, the resolve turn is the next Shemsu Hor
			if shemsu_hor:is_shemsu_hor() then
				resolve_turn = resolve_turn + shemsu_hor:get_shemsu_hor_period()
			else
				resolve_turn = resolve_turn + shemsu_hor:get_turns_to_shemsu_hor()
			end
		else
			-- if Shemsu Hor is not active, the resolve turn depends on the duration of the plot
			if is_number(plot_config.plot_duration) then
				resolve_turn = resolve_turn + plot_config.plot_duration
			else
				resolve_turn = resolve_turn + court.plots.config.default_plot_duration
			end
		end

		local plot_persistent_data = {
			plot_id = court.persistent.plot_last_id,
			plot_key = plot_key,
			plotting_faction = faction_key,
			target_court_name = faction_court_name,
			targeted_position = court_position_str,
			targeted_character_family_cqi = family_member_cqi,
			plot_level = starting_level,
			create_turn = create_turn,
			resolve_turn = resolve_turn,
			revealed_to = {},
		}

		local plots_with_same_resolve_turn = faction_court_obj.persistent.plots_persistent_data_by_resolve_turn[resolve_turn]
		if not plots_with_same_resolve_turn then
			faction_court_obj.persistent.plots_persistent_data_by_resolve_turn[resolve_turn] = {}
			plots_with_same_resolve_turn = faction_court_obj.persistent.plots_persistent_data_by_resolve_turn[resolve_turn]
		end

		if not plots_with_same_resolve_turn[plot_key] then
			plots_with_same_resolve_turn[plot_key] = {}
		end

		table.insert(plots_with_same_resolve_turn[plot_key], plot_persistent_data)

		court.persistent.plot_last_id = court.persistent.plot_last_id + 1

		local plotting_faction = cm:get_faction(faction_key)
		if plotting_faction and not plotting_faction:is_null_interface() and not plotting_faction:is_human() then
			for current_faction_key, faction_data in dpairs(court.factions_config) do
				if current_faction_key ~= "default"
					and court.util_functions.get_property(current_faction_key, "reveal_plots")
					and court.util_functions.get_faction_court_for_faction(current_faction_key) == faction_court_obj
				then
					court.plot_functions:reveal_plot_to_faction(faction_court_name, current_faction_key, plot_persistent_data.plot_id)
				end
			end

			local targeted_faction_key = target_position_obj.persistent.current_holder_faction
			if target_position_obj.persistent.current_holder_faction
				and court.util_functions.get_property(targeted_faction_key, "reveal_targeting_plots")
			then
				court.plot_functions:reveal_plot_to_faction(faction_court_name, targeted_faction_key, plot_persistent_data.plot_id)
			end
		end

		if court_cheat.plots.force_reveal then
			local player_faction_key = cm:get_local_faction_name(true)
			court.plot_functions:reveal_plot_to_faction(faction_court_name, player_faction_key, plot_persistent_data.plot_id)
		end

		if not ignore_court_actions then
			local court_actions_for_plot = court.plot_functions.get_plot_actions_needed(faction_court_obj, plot_config, faction_key)
			local faction_table = court.util_functions.get_faction_persistent_data(faction_key)
			court.util_functions.increase_used_court_actions_for_faction_by_table(faction_table, court_actions_for_plot)
		end

		-- this needs to be called after all costs have been paid and actions needed increased
		-- otherwise things that should be free are suddenly paid for
		if is_function(plot_config.on_created) then
			plot_config:on_created(plot_persistent_data)
		end

		local persistent_copy = table_deep_copy(plot_persistent_data)
		court.log_functions.log_court_action("plot_created", faction_key, court_position_str, persistent_copy)
		return plot_persistent_data.plot_id, plot_persistent_data
	end,

	-- resolve_methods = 
	-- {
		resolve_plots = function(self, faction_court_obj, resolve_turn)
			if not resolve_turn then
				resolve_turn = cm:model():turn_number()
			end
			local plots_to_resolve_this_turn = faction_court_obj.persistent.plots_persistent_data_by_resolve_turn[resolve_turn]
			if not plots_to_resolve_this_turn then
				-- no plots to resolve
				return
			end

			for _, plot_key in ipairs(court.plots.config.priority_list) do
				-- design says only one threaten should resolve (the highest)
				-- others are in order of player turns
				-- maybe we can change this?
				local plots_with_this_key = plots_to_resolve_this_turn[plot_key]
				if plots_with_this_key then
					if plot_key == "threaten" then
						self:resolve_threaten_plots(faction_court_obj, plots_with_this_key)
					else
						for _, plot_table in ipairs(plots_with_this_key) do
							self:resolve_plot(faction_court_obj, plot_table)
						end
					end
				end
			end


			faction_court_obj.persistent.plots_persistent_data_by_resolve_turn[resolve_turn] = nil
		end,

		-- threaten plots resolve differently from all others, since they have the biggest payoff (you get the position)
		resolve_threaten_plots = function(self, faction_court_obj, threaten_plots)
			-- we need to group the plots by target
			local threaten_plots_by_target = {}
			for _, plot_table in ipairs(threaten_plots) do
				if not threaten_plots_by_target[plot_table.targeted_position] then
					threaten_plots_by_target[plot_table.targeted_position] = {}
				end
				table.insert(threaten_plots_by_target[plot_table.targeted_position], plot_table)
			end

			-- we need to sort the keys by alphabetical order and place them in a helper table so we can iterate using ipairs deterministically
			local keyset = {}
			for k in pairs(threaten_plots_by_target) do
				table.insert(keyset, k)
			end
			keyset = table_stable_sort(keyset, function(a, b) return tostring(a) < tostring(b) end)

			for _, key in ipairs(keyset) do
				local plots_by_target = threaten_plots_by_target[key]
				self:resolve_threaten_plots_against_position(faction_court_obj, plots_by_target)
			end
		end,

		resolve_threaten_plots_against_position = function(self, faction_court_obj, threaten_plots)
			-- we check all threatens against a single target for success
			-- but even among all the successful ones - only one may resolve - the one with the highest level
			-- if there are several with the highest level - we pick at random

			local threaten_config = court.plots:get_plot_config_by_key("threaten")
			local highest_level = -1
			local highest_level_list = {}
			local failed_list = {}
			for _, plot_table in ipairs(threaten_plots) do
				if not plot_table.invalidated then
					if self:roll_for_success(threaten_config, plot_table) then
						-- if we have a new maximum we discard all the lower ones
						if plot_table.plot_level > highest_level then
							highest_level = plot_table.plot_level
							highest_level_list = {}
						end

						-- if we are at least matching the current max we add ourselves to the list
						if plot_table.plot_level >= highest_level then
							table.insert(highest_level_list, plot_table)
						end
					else
						table.insert(failed_list, plot_table)
					end
				end
			end

			if #highest_level_list > 0 then
				-- if at least one plot succeeds we resolve it
				-- all the others get a free pass
				local successful_plot_persistent_data = highest_level_list[1]
				if #highest_level_list > 1 then
					local random_index = cm:model():random_int(1, #highest_level_list)
					successful_plot_persistent_data = highest_level_list[random_index]
				end
				court.event_message_functions.send_court_plot_succeeds_event(faction_court_obj, successful_plot_persistent_data)
				successful_plot_persistent_data.success = true
				-- we need a copy for the court log, because it would otherwise change the log entry as the plot changes
				local persistent_copy = table_deep_copy(successful_plot_persistent_data)
				local plotter_faction_key = successful_plot_persistent_data.plotting_faction
				court.log_functions.log_court_action("plot_succeeded", plotter_faction_key, successful_plot_persistent_data.targeted_position, persistent_copy)
				-- on_success needs to be last, because it removes the position holder, and we need to log them first
				threaten_config:on_success(successful_plot_persistent_data)
				local regard_gained_with_conspirators = court.util_functions.get_property(plotter_faction_key, "regard_gained_with_conspirators")
				if regard_gained_with_conspirators then
					court.util_functions.gain_regard_with_conspirators(faction_court_obj, plotter_faction_key, regard_gained_with_conspirators)
				end
			else
				-- if none of them succeeds, they all get the penalty
				for _, plot_table in ipairs(failed_list) do
					self:execute_effects_of_failed_plot(threaten_config, plot_table)

					plot_table.success = false
					-- we need a copy for the court log, because it would otherwise change the log entry as the plot changes
					local persistent_copy = table_deep_copy(plot_table)
					court.log_functions.log_court_action("plot_failed", plot_table.plotting_faction, plot_table.targeted_position, persistent_copy)
					court.event_message_functions.send_court_plot_failed_event(faction_court_obj, plot_table)
				end
			end
		end,

		resolve_plot = function(self, faction_court_obj, plot_persistent_data)
			if plot_persistent_data.invalidated then
				-- plot was invalidated, most likely by the targeted position being vacated
				return
			end

			local plot_config = court.plots:get_plot_config_by_key(plot_persistent_data.plot_key)
			if not plot_config then
				court.output("Error: no plot config found for plot key '" .. plot_persistent_data.plot_key .. "'!", 10)
				return
			end

			local is_plot_successful = self:roll_for_success(plot_config, plot_persistent_data)
			plot_persistent_data.success = is_plot_successful
			-- we need a copy for the court log, because it would otherwise change the log entry as the plot changes
			local persistent_copy = table_deep_copy(plot_persistent_data)
			if is_plot_successful then
				court.log_functions.log_court_action("plot_succeeded", plot_persistent_data.plotting_faction, plot_persistent_data.targeted_position, persistent_copy)
				court.event_message_functions.send_court_plot_succeeds_event(faction_court_obj, plot_persistent_data)
				if is_number(plot_config.diplomatic_effect_success) then
					local targeted_position_obj = court.util_functions.get_court_position(faction_court_obj, plot_persistent_data.targeted_position)
					local targeted_faction_key = targeted_position_obj.persistent.current_holder_faction
					cm:apply_dilemma_diplomatic_bonus(plot_persistent_data.plotting_faction, targeted_faction_key, plot_config.diplomatic_effect_success)
				end
				-- on_success needs to be last, because it may remove the position holder, and we need to log them first
				plot_config:on_success(plot_persistent_data)
				local regard_gained_with_conspirators = court.util_functions.get_property(plot_persistent_data.plotting_faction, "regard_gained_with_conspirators")
				if regard_gained_with_conspirators then
					court.util_functions.gain_regard_with_conspirators(faction_court_obj, plot_persistent_data.plotting_faction, regard_gained_with_conspirators)
				end
			else
				self:execute_effects_of_failed_plot(plot_config, plot_persistent_data)
				persistent_copy.killed_plotter = plot_persistent_data.killed_plotter
				court.log_functions.log_court_action("plot_failed", plot_persistent_data.plotting_faction, plot_persistent_data.targeted_position, persistent_copy)
				court.event_message_functions.send_court_plot_failed_event(faction_court_obj, plot_persistent_data)
			end
		end,

		-- returns if the plot was successful
		roll_for_success = function(self, plot_config, plot_persistent_data)
			if plot_persistent_data.force_failure then
				court.output(plot_config.plot_key .. " failed due to being forced to")
				return false
			end

			if plot_persistent_data.court_leader_support then
				court.output(plot_config.plot_key .. " passed due to leader support")
				return true
			end

			local forced_result = court_cheat.plots.force_result
			if forced_result ~= nil then
				court.output(plot_config.plot_key .. " plot cheat forced: " .. tostring(forced_result))
				return forced_result
			end

			local position_str = plot_persistent_data.targeted_position
			court.output("Faction '" .. plot_persistent_data.plotting_faction .. "' used plot '" .. plot_config.plot_key .. "' to " .. position_str)
			local faction_court_name = plot_persistent_data.target_court_name
			local faction_court_obj = court.util_functions.get_faction_court_by_name(faction_court_name)
			local position_obj = court.util_functions.get_court_position(faction_court_obj, position_str)

			local success_chance_perc = self:calculate_chance(plot_config, plot_persistent_data, position_obj)
			local random_result = cm:model():random_int(1, 100)

			local success = (random_result <= success_chance_perc)
			if success then 
				court.output(plot_config.plot_key .. " successful! chance was:".. success_chance_perc)
			else
				court.output(plot_config.plot_key .. " failed! chance was:".. success_chance_perc)
			end

			return success
		end,

		-- returns the chance for success, in percentages
		-- if return_breakdown is sent we give a list of localized strings with the factors for the chance
		calculate_chance = function(self, plot_config, plot_persistent_data, position_obj, needed_for_display, return_breakdown)
			local faction_court_obj = court.util_functions.get_faction_court_by_name(plot_persistent_data.target_court_name)

			if plot_persistent_data.force_failure then
				-- this should not generally return a breakdown, setting force_failure should resolve the plot without allowing it to be displayed
				return 0
			end

			if plot_persistent_data.court_leader_support then
				if return_breakdown then
					local strongarm_text, _ = get_localised_text_replacement(court.plots.localization_keys.plot_chance_strongarm)
					local breakdown = {}
					table.insert(breakdown, strongarm_text)
					return 100, breakdown
				end
				return 100
			end

			local chance, breakdown = self:calculate_chance_for_level(plot_config, 
				faction_court_obj,
				plot_persistent_data.plotting_faction,
				position_obj,
				plot_persistent_data.plot_level,
				needed_for_display,
				return_breakdown)
			return chance, breakdown
		end,

		-- returns the chance for success, in percentages
		calculate_chance_for_level = function(self, plot_config, faction_court_obj, plotting_faction, position_obj, plot_level, needed_for_display, return_breakdown)
			local chance_base = plot_config.success_chance_base

			local chance_war = 0
			if court.util_functions.is_in_legitimacy_war(faction_court_obj) then
				chance_war = plot_config.success_chance_war or 0
			end

			local chance_improvement = plot_config.success_chance_increase_per_level * (plot_level - 1)

			local plotter_legitimacy = faction_court_obj.court_legitimacy():get_legitimacy(plotting_faction)
			local chance_plotter_legitimacy = (plot_config.success_chance_plotter_legitimacy_multiplier or 0) * plotter_legitimacy

			local target_faction_key = position_obj.persistent.current_holder_faction
			local target_legitimacy = faction_court_obj.court_legitimacy():get_legitimacy(target_faction_key)
			local chance_target_legitimacy = (plot_config.success_chance_target_legitimacy_multiplier or 0) * target_legitimacy

			local target_faction_specific_change = court.util_functions.get_property(target_faction_key, "plot_against_faction_chance_change") or 0

			local court_specific_config = court.util_functions.get_position_config_from_court(faction_court_obj, position_obj)

			local region_influence, related_region_obj = self.get_region_influence_factor(plot_config, faction_court_obj, plotting_faction, position_obj)

			-- some plots can be both faction-specific and have special access
			-- they can have an additional chance if accessible from both sources (just assassinate as of writing this code)
			local both_sources_influence = 0
			if is_function(plot_config.has_special_access) 
				and is_number(plot_config.success_chance_accessible_both_sources)
				and court.factions_config[plotting_faction] 
				and is_table(court.factions_config[plotting_faction].additional_plots)
			then
				local additional_plots = court.factions_config[plotting_faction].additional_plots
				if table_find(additional_plots, plot_config.plot_key) 
					and plot_config:has_special_access(plotting_faction)
				then
					both_sources_influence = plot_config.success_chance_accessible_both_sources
				end
			end

			local target_court_leader = 0
			if faction_court_obj.config.ruler_position == position_obj.name then
				target_court_leader = - court.plots.config.court_leader_chance_penalty
			end

			local chance = chance_base + chance_war + chance_improvement + chance_plotter_legitimacy + chance_target_legitimacy + target_court_leader + target_faction_specific_change + region_influence + both_sources_influence
			if needed_for_display then
				-- since the chance can now be a fraction, we round it
				chance = math.round(chance)
				chance = math.clamp(chance, 0, 100)

				if return_breakdown then
					local wrap_chance_function = function(number, localization_key, breakdown)
						if (not number) or number == 0 then
							return
						end
						number = math.round(number)
						local wrapped_string = court.util_functions.wrap_number_to_string(number)
						local chance_text, _ = get_localised_text_replacement_and_source_formatted(localization_key, wrapped_string)
						table.insert(breakdown, chance_text)
					end

					local breakdown = {}
					wrap_chance_function(chance_base, court.plots.localization_keys.plot_chance_base, breakdown)
					wrap_chance_function(chance_improvement, court.plots.localization_keys.plot_chance_level, breakdown)
					wrap_chance_function(chance_war, court.plots.localization_keys.plot_chance_war, breakdown)
					wrap_chance_function(chance_plotter_legitimacy, court.plots.localization_keys.plot_chance_legitimacy_own, breakdown)
					wrap_chance_function(chance_target_legitimacy, court.plots.localization_keys.plot_chance_legitimacy_target, breakdown)
					wrap_chance_function(target_court_leader, court.plots.localization_keys.plot_chance_legitimacy_ruler, breakdown)

					if both_sources_influence ~= 0 then
						local localized_text = get_localised_text_replacement(court.plots.localization_keys.success_chance_accessible_both_sources_key)
						local faction_obj = cm:get_faction(plotting_faction)
						local faction_name = faction_obj:localised_display_name()
						local both_sources_influence_string = court.util_functions.wrap_number_to_string(both_sources_influence)
						local parametrised_text = common.string_safe_format(localized_text, both_sources_influence_string, faction_name)
						table.insert(breakdown, parametrised_text)
					end

					if region_influence ~= 0 then
						local localized_text = get_localised_text_replacement(court.plots.localization_keys.plot_chance_region)
						local region_influence_string = court.util_functions.wrap_number_to_string(region_influence)
						local region_name = related_region_obj:localised_display_name()
						local faction_name = related_region_obj:owning_faction():localised_display_name()
						local parametrised_text = common.string_safe_format(localized_text, region_influence_string, faction_name, region_name)
						table.insert(breakdown, parametrised_text)
					end
					return chance, breakdown
				end
			end
			return chance
		end,

		execute_effects_of_failed_plot = function(self, plot_config, plot_persistent_data)
			-- remove legitimacy
			local faction_court_name = plot_persistent_data.target_court_name
			local faction_court_obj = court.util_functions.get_faction_court_by_name(faction_court_name)

			local position_str = plot_persistent_data.targeted_position
			local position_obj = court.util_functions.get_court_position(faction_court_obj, position_str)
			local targeted_faction = position_obj.persistent.current_holder_faction

			-- some plots lose extra legitimacy on failure
			local legitimacy_lost = plot_config.legitimacy_lost_on_failure_base or 0
			if plot_config.additional_legitimacy_lost_on_failure_war and court.util_functions.is_in_legitimacy_war(faction_court_obj) then
				legitimacy_lost = legitimacy_lost + plot_config.additional_legitimacy_lost_on_failure_war
			end
			-- some plots lose extra legitimacy per faction they were revealed to
			local legitimacy_lost_from_revealed = court.plots.config.legitimacy_lost_on_failure_per_revealed + (plot_config.legitimacy_lost_on_failure_per_revealed or 0)
			local transfered_legitimacy = legitimacy_lost + (legitimacy_lost_from_revealed * #plot_persistent_data.revealed_to)

			local plotting_faction = plot_persistent_data.plotting_faction
			-- we lose some legitimacy and the targeted faction gains the same amount
			court.plot_functions:transfer_legitimacy(faction_court_obj, transfered_legitimacy, plotting_faction, targeted_faction)

			if is_number(plot_config.diplomatic_effect_failure) then
				cm:apply_dilemma_diplomatic_bonus(plotting_faction, targeted_faction, plot_config.diplomatic_effect_failure)
			end

			-- some factions kill the plotting faction leader on failed plots
			local kill_plotter_on_failure = court.util_functions.get_property(targeted_faction, "kill_plotter_on_failure") or false
			if kill_plotter_on_failure then
				local faction_table = court.util_functions.get_faction_persistent_data(plotting_faction)
				if is_table(faction_table.owned_positions) and #faction_table.owned_positions == 1 then
					-- only the leader has more than 1 position, and we can't kick them out of the position anyway
					local owned_position = faction_table.owned_positions[1]
					if faction_court_obj.config.ruler_position ~= owned_position then
						court.position_functions.remove_character_from_position(faction_court_obj, owned_position)
					end
				end
				plot_persistent_data.killed_plotter = court.util_functions.kill_faction_leader(plotting_faction)
			end

			local gain_court_action_on_plot_failed = court.util_functions.get_property(targeted_faction, "gain_court_action_on_plot_failed")
			if gain_court_action_on_plot_failed then
				court.util_functions.add_court_extra_actions_for_faction(targeted_faction, 1)
			end
		end,

		get_region_influence_factor = function(plot_config, faction_court_obj, plotting_faction, position_obj)
			local related_region_obj = court.position_functions.get_position_related_region_obj(faction_court_obj, position_obj)
			if not related_region_obj then
				return 0
			end

			local court_specific_config = court.util_functions.get_position_config_from_court(faction_court_obj, position_obj)
			if not court_specific_config then
				return 0
			end

			if not is_table(court_specific_config.related_region_plot_success_chance_modifier) then
				return 0
			end

			local potential_influence = court_specific_config.related_region_plot_success_chance_modifier[plot_config.plot_key]
			if not is_number(potential_influence) then
				return 0
			end

			local region_owner = related_region_obj:owning_faction()
			if (not region_owner) or region_owner:is_null_interface() then
				return 0
			end

			local owner_key = region_owner:name()
			local target_faction_key = position_obj.persistent.current_holder_faction
			if owner_key == target_faction_key then
				return -potential_influence, related_region_obj
			elseif owner_key == plotting_faction then
				return potential_influence, related_region_obj
			end

			return 0
		end,
	-- }

	-- takes legitimacy_amount from faction_key_taken and gives it to faction_key_given
	-- but checks faction_key_taken is not left with negative legitimacy
	transfer_legitimacy = function(self, faction_court_obj, legitimacy_amount, faction_key_taken, faction_key_given)
		local legitimacy_source = faction_court_obj.court_legitimacy()
		-- if the amount is negative we reverse it, along with faction_key_taken and faction_key_given
		if legitimacy_amount < 0 then
			self:transfer_legitimacy(faction_court_obj, -legitimacy_amount, faction_key_given, faction_key_taken)
			return
		end

		-- we check that we don't take more legitimacy that faction_key_taken owns
		local owned_legitimacy = legitimacy_source:get_legitimacy(faction_key_taken)
		if legitimacy_amount > owned_legitimacy then
			legitimacy_amount = owned_legitimacy
		end
		if legitimacy_amount == 0 then
			return
		end

		legitimacy_source:add_legitimacy(faction_key_taken, court.config.court_legitimacy_decay_factor_key, -legitimacy_amount)

		legitimacy_source:add_legitimacy(faction_key_given, court.config.court_legitimacy_decay_factor_key, legitimacy_amount)
	end,

	-- removing_plots = 
	--{
		get_cost_obj_to_remove_plot = function(self, faction_court_key, paying_faction_key, plot_id)
			local plot_persistent_data = self:get_plot_persistent_data(faction_court_key, plot_id)
			local plot_level = plot_persistent_data.plot_level
			-- if the plot is not revealed, it is considered to be max level
			local revealed_to_faction = table_find(plot_persistent_data.revealed_to, paying_faction_key)
			if not revealed_to_faction then
				plot_level = court.plot_functions:get_plot_max_level(plot_persistent_data.plotting_faction)
			end

			local base_cost_obj = cm:create_new_custom_resource_cost()
			base_cost_obj:get_cost_from_record(court.plots.config.cost_to_remove_plot)
			base_cost_obj:multiply_by(plot_level)
			return base_cost_obj
		end,

		-- skip_payment is meant for cheats only
		pay_to_remove_plot = function(self, faction_court_key, paying_faction_key, plot_id, skip_payment)
			if not plot_id then
				court.output("ERROR:no plot id to remove provided!")
				return
			end

			if not skip_payment then
				local cost_obj = self:get_cost_obj_to_remove_plot(faction_court_key, paying_faction_key, plot_id)
				local faction_obj = cm:get_faction(paying_faction_key)
				local can_afford = faction_obj:can_afford_resource_cost_object(cost_obj)
				if not can_afford then
					court.output("ERROR: faction '".. paying_faction_key .."' could not afford to remove plot: ".. plot_id .."!")
					return
				end
				cm:faction_apply_resource_transaction(faction_obj, cost_obj)
			end

			self:remove_plot(faction_court_key, plot_id)
		end,

		remove_plot = function(self, faction_court_key, plot_id)
			local faction_court_obj = court.util_functions.get_faction_court_by_name(faction_court_key)
			for plot_resolve_turn, plots_by_type in dpairs(faction_court_obj.persistent.plots_persistent_data_by_resolve_turn) do
				for plot_key, plots_of_type in dpairs(plots_by_type) do
					local plot_persistent_index = table_find(plots_of_type, function(e) return e.plot_id == plot_id end, true)
					if plot_persistent_index then
							table.remove(plots_of_type, plot_persistent_index)
						return true
					end
				end
			end

			return false
		end,
	--}

	-- plot generation helpers = 
	--{
		-- returns a position name that can be targeted by this plot, or nil, if none is found
		get_valid_plot_target = function(court_obj, plotting_faction, plot_key, ignore_active_dilemma)
			local weighted_targets_list = weighted_list:new()
			for _, position in ipairs(court_obj.positions) do
				local holder_faction = position.persistent.current_holder_faction
				-- only plots against filled positions, that are from another faction
				-- this also covers the case where the plotter and target are the same (same holder faction)
				if holder_faction 
					and holder_faction ~= plotting_faction
				then
					local faction_target_weight = court.util_functions.get_property(holder_faction, "ai_plot_target_weight") or 1
					weighted_targets_list:add_item(position, faction_target_weight)
				end
			end

			while #weighted_targets_list.items > 0 do
				local target_position, index = weighted_targets_list:weighted_select()
				local plot_can_be_used, _ = court.plot_functions.can_faction_use_plot(court_obj, plotting_faction, plot_key, target_position.name, false, ignore_active_dilemma)

				if plot_can_be_used then
					return target_position
				end

				-- this position could not be targeted by plots, removing it and trying again until none remain
				weighted_targets_list:remove_item(index)
			end

			return nil
		end,

		-- returns a position name that can be targeted by this plot, or nil, if none is found
		get_valid_plot_target_name = function(court_obj, plotting_faction, plot_key)
			local valid_position = court.plot_functions.get_valid_plot_target(court_obj, plotting_faction, plot_key)
			if valid_position then
				return valid_position.name
			end
			return nil
		end,
	--} -- end of plot generation helpers

	get_plot_plotting_faction = function(faction_court_str, plot_id)
		local plot_persistent_data = court.plot_functions:get_plot_persistent_data(faction_court_str, plot_id)
		if not plot_persistent_data then
			return nil
		end 
		return plot_persistent_data.plotting_faction
	end,

	get_plot_level = function(faction_court_str, plot_id)
		local plot_persistent_data = court.plot_functions:get_plot_persistent_data(faction_court_str, plot_id)
		if not plot_persistent_data then
			return nil
		end 
		return plot_persistent_data.plot_level
	end,

	get_plot_targeted_position = function(faction_court_str, plot_id)
		local plot_persistent_data = court.plot_functions:get_plot_persistent_data(faction_court_str, plot_id)
		if not plot_persistent_data then
			return nil
		end 
		return plot_persistent_data.targeted_position
	end,

	get_factions_plot_is_revealed_to = function(self, faction_court_str, plot_id)
		local plot_persistent_data = self:get_plot_persistent_data(faction_court_str, plot_id)
		if not plot_persistent_data then
			return nil
		end 
		return plot_persistent_data.revealed_to
	end,

	reveal_plot_to_faction = function(self, faction_court_str, faction_str, plot_id)
		local plot_persistent_data = self:get_plot_persistent_data(faction_court_str, plot_id)
		if not plot_persistent_data then
			return nil
		end
		local already_revealed = table_find(plot_persistent_data.revealed_to, faction_str)
		if already_revealed then
			return nil
		end

		local persistent_copy = table_deep_copy(plot_persistent_data)
		court.log_functions.log_court_action("plot_revealed", faction_str, plot_persistent_data.targeted_position, persistent_copy)
		return table.insert(plot_persistent_data.revealed_to, faction_str)
	end,

	get_plots_owned_by_faction = function(self, faction_key)
		local faction_court_obj = court.util_functions.get_faction_court_for_faction(faction_key)

		local plots = {}
		if not faction_court_obj then
			return plots
		end

		for plot_resolve_turn, plots_by_type in dpairs(faction_court_obj.persistent.plots_persistent_data_by_resolve_turn) do
			for plot_key, plots_of_type in dpairs(plots_by_type) do
				for plot_index, plot_persistent_data in ipairs(plots_of_type) do
					if plot_persistent_data.plotting_faction == faction_key 
						and (not plot_persistent_data.invalidated)
						and plot_persistent_data.success == nil
					then
						table.insert(plots, plot_persistent_data)
					end
				end
			end
		end

		return plots
	end,

	get_plot_targeted_faction = function(self, faction_court_obj, plot_persistent_data)
		local targeted_position_key = plot_persistent_data.targeted_position
		local targeted_position_obj = court.util_functions.get_court_position(faction_court_obj, targeted_position_key)

		return targeted_position_obj.persistent.current_holder_faction
	end,

	get_plots_against_faction = function(self, faction_key)
		local faction_court_obj = court.util_functions.get_faction_court_for_faction(faction_key)

		local plots = {}
		for plot_resolve_turn, plots_by_type in dpairs(faction_court_obj.persistent.plots_persistent_data_by_resolve_turn) do
			for plot_key, plots_of_type in dpairs(plots_by_type) do
				for plot_index, plot_persistent_data in ipairs(plots_of_type) do
					local targeted_faction = court.plot_functions:get_plot_targeted_faction(faction_court_obj, plot_persistent_data)

					if targeted_faction == faction_key 
						and (not plot_persistent_data.invalidated)
						and plot_persistent_data.success == nil
					then
						table.insert(plots, plot_persistent_data)
					end
				end
			end
		end
		return plots
	end,

	get_plots_against_position = function(self, faction_court_obj, position_obj)
		local plots = {}
		for plot_resolve_turn, plots_by_type in dpairs(faction_court_obj.persistent.plots_persistent_data_by_resolve_turn) do
			for plot_key, plots_of_type in dpairs(plots_by_type) do
				for plot_index, plot_persistent_data in ipairs(plots_of_type) do
				if (not plot_persistent_data.invalidated)
					and plot_persistent_data.success == nil
				then
					if plot_persistent_data.targeted_position == position_obj.name
						or plot_persistent_data.targeted_position == position_obj.alt_name 
					then
						table.insert(plots, plot_persistent_data)
					end
				end
			end
		end
		end

		return plots
	end,

	get_plots_revealed_to_faction = function(self, faction_key)
		local faction_court_obj = court.util_functions.get_faction_court_for_faction(faction_key)

		local plots = {}
		for plot_resolve_turn, plots_by_type in dpairs(faction_court_obj.persistent.plots_persistent_data_by_resolve_turn) do
			for plot_key, plots_of_type in dpairs(plots_by_type) do
				for plot_index, plot_persistent_data in ipairs(plots_of_type) do
				if (not plot_persistent_data.invalidated)
					and plot_persistent_data.success == nil
					and is_table(plot_persistent_data.revealed_to)
					and table_find(plot_persistent_data.revealed_to, faction_key)
					and plot_persistent_data.plotting_faction ~= faction_key
				then
					table.insert(plots, plot_persistent_data)
				end
			end
		end
		end

		return plots
	end,

	get_plot_name_source = function(plot_config, court_obj)
		if is_table(plot_config.court_ui_overrides)
			and plot_config.court_ui_overrides[court_obj.court_name]
			and plot_config.court_ui_overrides[court_obj.court_name].plot_localization_key
		then
			return plot_config.court_ui_overrides[court_obj.court_name].plot_localization_key
		end

		return plot_config.plot_localization_key
	end,

	get_localized_plot_name = function(plot_config, court_obj)
		local source = court.plot_functions.get_plot_name_source(plot_config, court_obj)
		local result = common.get_localised_string(source)
		return result
	end,

	get_plot_on_success_key = function(plot_config, court_obj)
		if is_table(plot_config.court_ui_overrides)
			and plot_config.court_ui_overrides[court_obj.court_name]
			and plot_config.court_ui_overrides[court_obj.court_name].success_key
		then
			return plot_config.court_ui_overrides[court_obj.court_name].success_key
		end

		return plot_config.success_key
	end,

	get_plot_icon_path = function(plot_config, court_obj)
		if is_table(plot_config.court_ui_overrides)
			and plot_config.court_ui_overrides[court_obj.court_name]
			and plot_config.court_ui_overrides[court_obj.court_name].plot_icon_path
		then
			return plot_config.court_ui_overrides[court_obj.court_name].plot_icon_path
		end

		return plot_config.plot_icon_path
	end,

	--- @function can_faction_use_plot
	--- @desc Checks if the factions can use a specific plot right now
	--- @p object faction_court_table - one of the courts listed in court.all_courts
	--- @p string faction_key - the faction key
	--- @p string plot_key - the name of the plot
	--- @p string court_position_str - the name of the position we're interested in
	--- @p [opt=nil] bool skip_payment - if we should check for payment
	--- @p [opt=nil] bool ignore_active_dilemma - if we should check for active dilemma - true when the active dilemma tries to start a plot
	--- @return boolean or nil, string : return nil if there is a programming error xor boolean to determine whether giving the position is possible, message why it is impossible (the message may be localized for gameplay reasons
	can_faction_use_plot = function(faction_court_table, faction_key, plot_key, court_position_str, skip_payment, ignore_active_dilemma, ignore_court_action)
		if not is_string(plot_key) then
			return nil, " plot_key passed is not a string"
		elseif not is_string(faction_key) then
			return nil, " faction_key passed is not a string"
		elseif not faction_court_table then
			return nil, " no faction_court_table passed"
		end

		local result = ""

		if not ignore_active_dilemma then
			local has_pending_dilemma = court.util_functions.is_dilemma_active()
			if has_pending_dilemma then
				local localized_error, _ = get_localised_random_string_and_source(court.ui.config.localization_keys.dilemma_is_active)
				result = court.util_functions.append_as_red_bullet_point(result, localized_error)
			end
		end

		local plot_config = court.plots:get_plot_config_by_key(plot_key)
		local plot_localized_name = court.plot_functions.get_localized_plot_name(plot_config, faction_court_table)

		local accessible_plots = court.plot_functions.get_list_of_accessible_plots(faction_key)
		local is_plot_accessible = table_find(accessible_plots, plot_key)
		if not is_plot_accessible then
			local faction_screen_name = common.get_localised_string("factions_screen_name_" .. faction_key)
			local text, _ = get_localised_text_replacement_and_source_formatted(court.plots.localization_keys.plot_not_accessible_to_faction, plot_localized_name, faction_screen_name)
			result = court.util_functions.append_as_red_bullet_point(result, text)
		end

		-- no need to check if Shemsu Hor system is active - if it is disabled it is never Shemsu Hor
		if shemsu_hor.is_shemsu_hor() then
			local text, _ = get_localised_text_replacement_and_source(court.plots.localization_keys.plot_forbidden_during_shemsu_hor)
			result = court.util_functions.append_as_red_bullet_point(result, text)
		end

		local court_position_obj = court.util_functions.get_court_position(faction_court_table, court_position_str)
		local localized_position_name, _ = court.position_functions.get_localized_position_name(court_position_obj, faction_court_table)

		if not court_position_obj.persistent.current_holder then
			local text, _ = get_localised_text_replacement_and_source_formatted(court.plots.localization_keys.position_is_vacant, localized_position_name)
			result = court.util_functions.append_as_red_bullet_point(result, text)
		end

		if court_position_obj.position_config.plots_immunity 
			and table_find(court_position_obj.position_config.plots_immunity, plot_key)
		then
			local text, _ = get_localised_text_replacement_and_source_formatted(court.plots.localization_keys.cant_use_plot_against_position, plot_localized_name, localized_position_name)
			result = court.util_functions.append_as_red_bullet_point(result, text)
		end

		if not ignore_court_action then
			local max_court_actions_per_turn = court.util_functions.max_court_actions_for_faction(faction_key)
			local court_actions_used_this_turn = court.util_functions.get_court_actions_used_this_turn(faction_key)
			local actions_needed = court.plot_functions.get_plot_actions_needed(faction_court_table, plot_config, faction_key)

			local autopurchase_plot_actions = court.util_functions.get_property(faction_key, "can_purchase_court_actions") and court.config.autopurchase_plot_actions
			if max_court_actions_per_turn < court_actions_used_this_turn + actions_needed
				and not autopurchase_plot_actions
			then
				local text, _ = get_localised_text_replacement_and_source_formatted(court.plots.localization_keys.faction_out_of_court_actions, max_court_actions_per_turn)
				result = court.util_functions.append_as_red_bullet_point(result, text)
			end
		end

		if (not skip_payment) 
			and (not court.plot_functions:can_faction_afford_plot(faction_court_table, plot_key, faction_key, court_position_obj))
		then
			local text, _ = get_localised_text_replacement_and_source(court.plots.localization_keys.faction_cant_afford_plot)
			result = court.util_functions.append_as_red_bullet_point(result, text)
		end

		for plot_resolve_turn, plots_by_type in dpairs(faction_court_table.persistent.plots_persistent_data_by_resolve_turn) do
			for plot_key_for_group, plots_of_type in dpairs(plots_by_type) do
			if plot_key_for_group == plot_key then
					for _, plot_persistent_data in ipairs(plots_of_type) do
					if plot_persistent_data.plotting_faction == faction_key 
						and (not plot_persistent_data.invalidated)
						and plot_persistent_data.success == nil
					then
						local text, _ = get_localised_text_replacement(court.plots.localization_keys.faction_already_has_plot)
						result = court.util_functions.append_as_red_bullet_point(result, text)
						break
					end
				end
			end
		end
		end

		-- some plots have specific restrictions
		if plot_config.can_use_plot then
			local can_use_result, can_use_reason = plot_config:can_use_plot(faction_court_table, court_position_obj)
			if not can_use_result then
				-- can_use_plot should return the points as red bullet points, so we don't need to add them as such, just append them
				result = court.util_functions.message_append(result, can_use_reason)
			end
		end

		if result == "" then
			return true, ""
		end

		return false, result
	end,

	-------------------------------------------------------------------
	-- INTERNAL METHODS - meant to only be called from inside this file

	-- all plots against this position are invalidated - most likely the position was vacated
	invalidate_plots = function(faction_court_key, position_key)
		local faction_court_obj = court.util_functions.get_faction_court_by_name(faction_court_key)
		for plot_resolve_turn, plots_by_type in dpairs(faction_court_obj.persistent.plots_persistent_data_by_resolve_turn) do
			for plot_key, plots_of_type in dpairs(plots_by_type) do
			for _, plot_table in ipairs(plots_of_type) do
				if plot_table.target_court_name == faction_court_key
					and plot_table.targeted_position == position_key
					and plot_table.success == nil
					and not plot_table.invalidated
				then
					plot_table.invalidated = true
					local persistent_copy = table_deep_copy(plot_table)
					court.log_functions.log_court_action("plot_invalidated", plot_table.plotting_faction, plot_table.targeted_position, persistent_copy)
				end
			end
		end
		end
	end,

	get_plot_persistent_data = function(self, faction_court_key, plot_id)
		local faction_court_obj = court.util_functions.get_faction_court_by_name(faction_court_key)
		for plot_resolve_turn, plots_by_type in dpairs(faction_court_obj.persistent.plots_persistent_data_by_resolve_turn) do
			for plot_key, plots_of_type in dpairs(plots_by_type) do
				local plot_persistent_data = table_find(plots_of_type, function(e) return e.plot_id == plot_id end)
				if plot_persistent_data then
					return plot_persistent_data
				end
			end
		end

		return nil
	end,

	get_plot_actions_needed = function(faction_court, plot_config, faction_key)
		local court_actions_needed = court.config.plots_court_actions_needed
		if is_function(plot_config.court_actions_needed_override) then
			court_actions_needed = plot_config:court_actions_needed_override(faction_court, faction_key)
		end

		return court_actions_needed
	end,

	-- plot_cost_methods = 
	-- {
		get_plot_cost_obj = function(self, faction_court_obj, plot_key, faction_key, position_obj)
			local plot_config = court.plots:get_plot_config_by_key(plot_key)
			if not plot_config then
				court.output("Error: no plot config found for plot key '" .. plot_key .. "'!", 10)
				return nil
			end

			local cost_obj = self:get_plot_cost_obj_for_config(faction_court_obj, plot_config, faction_key, position_obj)
			local faction_specific_addition = court.util_functions.get_property(faction_key, "plot_additional_cost")
			if faction_specific_addition then
				local additional_cost_obj = cm:create_new_custom_resource_cost()
				additional_cost_obj:get_cost_from_record(faction_specific_addition)
				cost_obj:add(additional_cost_obj)
			end
			return cost_obj
		end,

		-- this assumes you checked plot_config is not nil!
		get_plot_cost_obj_for_config = function(self, faction_court_obj, plot_config, faction_key, position_obj)
			local base_cost_obj = cm:create_new_custom_resource_cost()

			-- this is the main way to set up costs
			if plot_config.resource_costs_record then
				base_cost_obj:get_cost_from_record(plot_config.resource_costs_record)
			elseif plot_config.test_cost then
				-- this is meant for testing, only used if the main cost is removed or commented
				for _, resource_info in ipairs(plot_config.test_cost) do
					base_cost_obj:add_resource_cost(resource_info[1], court.config.court_resource_factor, resource_info[2])
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

				if not table.contains(all_legitimacy_resource_keys, resource_name) or faction_court_obj.court_legitimacy().config.resource_key == resource_name then
					legitimacy_corrected_cost_obj:add_resource_cost(resource_name, court.config.court_resource_factor, resource_amount)
				end
			end

			-- plots against the court leader are more expensive
			if faction_court_obj.config.ruler_position == position_obj.name then
				court.util_functions.add_court_leader_extra_cost(legitimacy_corrected_cost_obj)
			end

			if not faction_key then
				return legitimacy_corrected_cost_obj
			end

			-- some factions may purchase court actions
			local autopurchase_plot_actions = court.util_functions.get_property(faction_key, "can_purchase_court_actions") and court.config.autopurchase_plot_actions
			if autopurchase_plot_actions then
				local actions_needed = court.plot_functions.get_plot_actions_needed(faction_court_obj, plot_config, faction_key)
				local available_actions = court.util_functions.get_available_court_actions(faction_key)
				local extra_actions_needed = actions_needed - available_actions

				if extra_actions_needed > 0 then
					court.util_functions.add_court_action_purchase_cost(faction_key, legitimacy_corrected_cost_obj, extra_actions_needed)
				end
			end

			local faction_obj = cm:get_faction(faction_key)
			local price_change_perc = faction_obj:bonus_values():scripted_value("court_discount_mod", "value")
			if price_change_perc == 0 then
				return legitimacy_corrected_cost_obj
			end

			local discounted_cost_obj = cm:create_new_custom_resource_cost()
			-- check for bonuses decreasing intrigue_cost (Vizier/Tuhkanti)
			-- reduce cost accordingly
			local resources = legitimacy_corrected_cost_obj:resources()
			for i = 1, #resources do
				local price_change = (resources[i][2] * price_change_perc ) / 100
				local new_price = resources[i][2] + price_change

				if new_price > 0 then
					script_error("plot prices should use negative resources, but cost for ".. plot_config.plot_key .. " has positive numbers!")
				end
				discounted_cost_obj:add_resource_cost(resources[i][1], court.config.court_resource_factor, new_price)
			end

			return discounted_cost_obj
		end,

		can_faction_afford_plot = function(self, faction_court_obj, plot_key, faction_key, target_position_obj)
			local plot_cost_obj = court.plot_functions:get_plot_cost_obj(faction_court_obj, plot_key, faction_key, target_position_obj)
			if not plot_cost_obj then 
				-- something is wrong, but get_plot_cost_obj should have logged the error already
				return nil
			end
			local faction_obj = cm:get_faction(faction_key)
			if not faction_obj or faction_obj:is_null_interface() then
				court.output("Error: no valid faction key provided to can_faction_afford_plot: '" .. faction_key .. "'!", 10)
			end
			local can_afford = faction_obj:can_afford_resource_cost_object(plot_cost_obj)
			return can_afford
		end,

		pay_for_plot = function(faction_court_obj, faction_key, plot_key, target_position_obj)
			local cost_obj = court.plot_functions:get_plot_cost_obj(faction_court_obj, plot_key, faction_key, target_position_obj)
			local faction_obj = cm:get_faction(faction_key)
			cm:faction_apply_resource_transaction(faction_obj, cost_obj)

			local plot_config = court.plots:get_plot_config_by_key(plot_key)
			local court_actions_for_plot = court.plot_functions.get_plot_actions_needed(faction_court_obj, plot_config, faction_key)
			local max_court_actions_per_turn = court.util_functions.max_court_actions_for_faction(faction_key)
			local court_actions_used_this_turn = court.util_functions.get_court_actions_used_this_turn(faction_key)
			local autopurchase_plot_actions = court.util_functions.get_property(faction_key, "can_purchase_court_actions") and court.config.autopurchase_plot_actions
			if court_actions_used_this_turn + court_actions_for_plot > max_court_actions_per_turn 
				and autopurchase_plot_actions
			then
				-- the actions were already purchased, their cost is included in get_plot_cost_obj
				local actions_to_add = court_actions_used_this_turn + court_actions_for_plot - max_court_actions_per_turn
				court.util_functions.add_court_extra_actions_for_faction(faction_key, actions_to_add)
			end
		end,
	-- }

	change_plot_level = function(self, faction_court_name, plot_id, level_change, suppress_cap_output)
		local plot_persistent_data = self:get_plot_persistent_data(faction_court_name, plot_id)
		if not plot_persistent_data then
			return false
		end

		local new_level = plot_persistent_data.plot_level + level_change
		if new_level < 1 then
			court.output("plot id '".. plot_id .. "' removed from being reduced below lv 1")
			self:remove_plot(faction_court_name, plot_id)
			return true
		end

		local plot_max_level = self:get_plot_max_level(plot_persistent_data.plotting_faction)
		if new_level > plot_max_level then
			court.output("plot id '".. plot_id .. "' capped to level" .. plot_max_level)
			new_level = plot_max_level
		end

		plot_persistent_data.plot_level = new_level
		return true
	end,

	advance_plot = function(self, faction_court_obj, plot_persistent_data, level_change)
		-- we need to remove it from one subtable of faction_court_obj.persistent.plots_persistent_data_by_resolve_turn to another one
		-- first we find the original resolve turn and remove it from there
		local original_resolve_turn = -1
		local plot_key = plot_persistent_data.plot_key
		for plot_resolve_turn, plots_by_type in dpairs(faction_court_obj.persistent.plots_persistent_data_by_resolve_turn) do
			local plots_of_same_type = plots_by_type[plot_key]
			if plots_of_same_type then
				local plot_persistent_index = table_find(plots_of_same_type, 
					function(e) return e.plot_id == plot_persistent_data.plot_id end,
					true) -- this parameters indicates we want the index, so we can remove it
				if is_number(plot_persistent_index) and plot_persistent_index >= 0 then
					original_resolve_turn = plot_resolve_turn
					table.remove(plots_of_same_type, plot_persistent_index)
					break
				end
			end
		end

		if original_resolve_turn < 1 then
			return
		end

		local final_resolve_turn = original_resolve_turn - level_change
		local current_turn = cm:model():turn_number()
		if current_turn > final_resolve_turn then
			-- it can resolve in this turn, but we can't advance it so far back it resolves in the past
			final_resolve_turn = current_turn
		end

		local plots_with_same_resolve_turn = faction_court_obj.persistent.plots_persistent_data_by_resolve_turn[final_resolve_turn]
		if not plots_with_same_resolve_turn then
			faction_court_obj.persistent.plots_persistent_data_by_resolve_turn[final_resolve_turn] = {}
			plots_with_same_resolve_turn = faction_court_obj.persistent.plots_persistent_data_by_resolve_turn[final_resolve_turn]
		end
		if not plots_with_same_resolve_turn[plot_key] then
			plots_with_same_resolve_turn[plot_key] = {}
		end

		table.insert(plots_with_same_resolve_turn[plot_key], plot_persistent_data)
		plot_persistent_data.resolve_turn = final_resolve_turn
		if current_turn >= final_resolve_turn then
			self:resolve_plot(faction_court_obj, plot_persistent_data)
		end
		return true
	end,

	change_plotting_faction = function(self, faction_court_name, plot_id, new_plotting_faction_key)
		local plot_persistent_data = self:get_plot_persistent_data(faction_court_name, plot_id)
		if not plot_persistent_data then
			return false
		end

		local revealed_index = table_find(plot_persistent_data.revealed_to, new_plotting_faction_key, true)
		if revealed_index then
			table.remove(plot_persistent_data.revealed_to, revealed_index)
		end

		table.insert(plot_persistent_data.revealed_to, plot_persistent_data.plotting_faction)

		plot_persistent_data.plotting_faction = new_plotting_faction_key
		return true
	end,

	change_target_position = function(self, faction_court_name, plot_id, new_position_target_obj)
		local plot_persistent_data = self:get_plot_persistent_data(faction_court_name, plot_id)
		if not plot_persistent_data then
			return false
		end

		plot_persistent_data.targeted_position = new_position_target_obj.name
		local new_targeted_character = cm:get_character(new_position_target_obj.persistent.current_holder)
		plot_persistent_data.targeted_character_family_cqi = new_targeted_character:family_member():command_queue_index()
		return true
	end,
}