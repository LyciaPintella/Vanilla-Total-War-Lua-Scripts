

-------------------------------------------------------
-------------------------------------------------------
--	UI Override
--	Allows creation of a set of functions that
--	allows/disallows access to certain ui features.
--	Also allows these features to be locked/unlocked -
--	this is useful for sections of modal script that
--	turn off the whole ui to direct the player's
--	attention
-------------------------------------------------------
-------------------------------------------------------


ui_override = {
	name = "",
	cm = nil,
	currently_locked = false,
	is_allowed = true,
	cached_locked = nil,
	cached_allowed = nil,
	lock_func = nil,
	unlock_func = nil
};


-- set ui_override to be of custom type TYPE_UI_OVERRIDE, with a custom tostring() response
set_class_custom_type(ui_override, TYPE_UI_OVERRIDE);
set_class_tostring(
	ui_override, 
	function(obj)
		return TYPE_UI_OVERRIDE .. "_" .. obj.name
	end
);


function ui_override:new(name, lock_func, unlock_func, lock_with_lock_ui)
	if not is_string(name) then
		script_error("ERROR: trying to create ui_override but name [" .. tostring(k_func) .. "] is not a function");
		return;
	end;

	if not is_function(lock_func) then
		script_error(name .. " ERROR: trying to create ui_override but supplied lock function [" .. tostring(lock_func) .. "] is not a function");
		return;
	end;
	if not is_function(unlock_func) then
		script_error(name .. " ERROR: trying to create ui_override but supplied unlock function [" .. tostring(unlock_func) .. "] is not a function");
		return;
	end;

	if lock_with_lock_ui ~= false then
		lock_with_lock_ui = true;
	end;

	local ui = {};

	ui.name = name;

	-- set 'ui' to derive from self ('ui_override')
	set_object_class(ui, self);

	ui.cm = get_cm();
	ui.lock_func = lock_func;
	ui.unlock_func = unlock_func;
	ui.lock_with_lock_ui = lock_with_lock_ui;

	return ui;
end;


-- sets whether a ui override is allowed or not. It can still be locked, which temporarily disables it.
function ui_override:set_allowed(value, silent)
	self.is_allowed = value;

	if value then
		if core:is_ui_created() then
			if not silent then
				out.ui("\t++ Allowing UI override [" .. self.name .. "]");
			end;
			self:unlock(true, silent);
		elseif not silent then
			out.ui("\t++ Allowing UI override [" .. self.name .. "] but not unlocking as ui is not yet initialised");
		end;
	else
		if core:is_ui_created() then
			if not silent then
				out.ui("\t++ Disallowing UI override [" .. self.name .. "]");
			end;
			self:lock(true, silent);
		elseif not silent then
			out.ui("\t++ Disallowing UI override [" .. self.name .. "] but not locking as ui is not yet initialised");
		end;
	end;
end;


function ui_override:get_allowed()
	return self.is_allowed;
end;


-- locks a ui override, turning it off. It will be turned on again if unlocked, assuming that it's allowed.
function ui_override:lock(force, silent, from_lock_ui)
	if not force then
		if self.currently_locked then
			return;
		end;
	end;

	-- don't lock if we're locking the whole ui and this override is marked to not lock at this time
	if from_lock_ui and not self.lock_with_lock_ui then
		return;
	end;

	self.currently_locked = true;

	if not silent then
		out.ui("\t++ Locking UI override [" .. self.name .. "]");
	end;
	
	if ui_override.trigger_campaign_ui_script_event then
		self:trigger_campaign_ui_script_event("ui_override_lock,");
	end;

	self.lock_func();
end;


-- unlocks a ui override, turning it on - assuming it's allowed
function ui_override:unlock(force, silent)
	if not force then
		if not self.currently_locked or not self.is_allowed then
			out.ui("\t++ NOT Unlocking UI override: " .. self.name .. ", currently_locked: " .. tostring(self.currently_locked) .. ", is_allowed: " .. tostring(self.is_allowed));
			return;
		end;
	end;

	self.currently_locked = false;

	if not silent then
		out.ui("\t++ Unlocking UI override [" .. self.name .. "]");
	end;

	if ui_override.trigger_campaign_ui_script_event then
		self:trigger_campaign_ui_script_event("ui_override_unlock,");
	end;
	
	self.unlock_func();
end;


function ui_override:is_locked()
	return self.currently_locked;
end;


function ui_override:is_cached()
	return is_boolean(self.cached_locked);
end;


function ui_override:cache()
	self.cached_locked = self.currently_locked;
	self.cached_allowed = self.is_allowed;
	out.ui("\t++ Caching settings for UI override [" .. self.name .. "], override is " .. (self.cached_allowed and "" or "not ") .. "allowed and " .. (self.cached_locked and "" or "un") .. "locked");
end;


function ui_override:cache_if_not_cached()
	if not self:is_cached() then
		self:cache();
	end;
end;


function ui_override:restore()
	if is_boolean(self.cached_locked) then
		out.ui("\t++ Restoring UI override [" .. self.name .. "] to be " .. (self.cached_allowed and "" or "not ") .. "allowed and " .. (self.cached_locked and "" or "un") .. "locked");

		if self.cached_allowed ~= self.is_allowed then
			self:set_allowed(self.cached_allowed, true);
		end;

		if self.currently_locked and not self.cached_locked then
			self:unlock(true, true);
		end;

		self.cached_locked = nil;
		self.cached_allowed = nil;
	end;
end;


-- Triggering campaign script events
-- UI overrides can be set to trigger UI script events when they are locked/unlocked, which sends a message over the network that client script can receive by listening for the UITriggerScriptEvent event.
-- This allows ui overrides activated on one machine in a multiplayer game to be picked up and reflected on others.
-- This behaviour is now disabled by default, by assigning trigger_campaign_ui_script_event to be nil. Client scripts may activate the enabled version of this function by calling 
-- campaign_ui_manager:set_ui_overrides_should_trigger_campaign_ui_script_events(true)

function ui_override:trigger_campaign_ui_script_event_enabled(message)
	CampaignUI.TriggerCampaignScriptEvent(0, message .. self.name)
end;


-- Set the disabled version of this function to be nil
ui_override.trigger_campaign_ui_script_event = nil;






function campaign_ui_manager:load_ui_overrides()
	local cm = self.cm;

	local ui_overrides = {};
	-- list of all ui_overrides:
		-- toggle_movement_speed
		-- saving
		-- radar_rollout_buttons
		-- incentives
		-- stances
		-- province_details
		-- character_details
		-- force_details
		-- raise_army
		-- replace_general
		-- recruit_units
		-- hide_units
		-- enlist_agent
		-- recruit_mercenaries
		-- show_mercenaries
		-- hide_faction_button
		-- faction_button
		-- missions
		-- cancel_mission
		-- finance
		-- technology
		-- technology_disabled
		-- rituals
		-- diplomacy
		-- tactical_map
		-- enlist_navy
		-- events_rollout
		-- events_panel
		-- end_turn
		-- tax_exemption
		-- autoresolve
		-- autoresolve_for_advice
		-- maintain_siege
		-- prebattle_attack
		-- prebattle_attack_for_advice
		-- cancel_siege_weapons
		-- retreat
		-- dismantle_building
		-- disband_unit
		-- repair_building
		-- cancel_construction
		-- cancel_recruitment
		-- construction_site
		-- cost_display
		-- dismiss_advice_end_turn
		-- advice_navigation
		-- toggle_move_speed
		-- end_of_turn_warnings
		-- windowed_movies
		-- upgrade_unit
		-- sally_forth_button
		-- subjugation_button
		-- occupy_button
		-- raze_button
		-- loot_button
		-- sack_button
		-- settlement_renaming
		-- food_display
		-- abandon_settlements
		-- building_upgrades
		-- non_city_building_upgrades
		-- convert_religion
		-- public_order_display
		-- intrigue_actions
		-- seek_wife
		-- large_info_panels
		-- building_browser
		-- migration
		-- migration_cancel
		-- prebattle_save
		-- resettle
		-- diplomacy_audio
		-- book_of_grudges
		-- offices
		-- grudges
		-- diplomacy_double_click
		-- giving_orders
		-- ping_clicks
		-- spell_browser
		-- advice_settings_button
		-- selection_change
		-- camera_settings
		-- army_panel_help_button
		-- province_overview_panel_help_button
		-- help_page_link_highlighting
		-- garrison_details
		-- end_turn_options
		-- esc_menu
		-- help_panel_button
		-- mortuary_cult
		-- regiments_of_renown
		-- army_panel_visible
		-- province_overview_panel_visible
		-- hide_diplomacy
		-- hide_missions
		-- hide_character_details
		-- hide_advice
		-- hide_occupy_conquest
		-- disable_public_order_display
		-- hide_province_panel_public_order
		-- hide_settlement_panel_recruit_hero
		-- hide_settlement_panel_recruit_lord
		-- hide_settlement_panel_building_browser
		-- hide_settlement_bar_public_order
		-- hide_settlement_bar_garrison
		-- hide_pre_battle_save
		-- hide_pre_battle_autoresolve
		-- hide_abandon_settlement
		-- hide_pre_battle_retreat
		-- hide_character_details_panel_replace_lord
		-- hide_divine_will_button
		-- hide_fm_offices_container
		-- hide_fm_demand_tribute_container
		-- hide_gods_and_favour_container
		-- hide_local_deities
		-- disable_local_deities
		-- hide_demolish_button
		-- hide_building_browser_public_order
		-- disable_skip_button
		-- settlement_labels
		-- settlement_selection
		-- hide_province_info_panel
		-- hide_campaign_customization_button
		-- hide_court
		-- hide_ruling_family_dynasty
		-- hide_ancient_legacies
		-- hide_power_of_the_crown

	-------------------------------
	-- toggle_movement_speed
	-------------------------------
	ui_overrides.toggle_movement_speed = ui_override:new(
		"toggle_movement_speed",
		function()
			cm:disable_shortcut("root", "toggle_movement_speed", true);
		end,
		function()
			cm:disable_shortcut("root", "toggle_movement_speed", false);
		end
	);

	-------------------------------
	-- saving
	-------------------------------
	ui_overrides.saving = ui_override:new(
		"saving",
		function()
			cm:disable_saving_game(true);
		end,
		function()
			cm:disable_saving_game(false);
		end
	);

	-------------------------------
	-- radar_rollout_buttons
	-------------------------------
	ui_overrides.radar_rollout_buttons = ui_override:new(
		"radar_rollout_buttons",
		function()
			local ui_root = core:get_ui_root();
			local uic_parent = find_uicomponent(ui_root, "panel_buttons_tab_sidemenu");
			set_component_active_with_parent(false, uic_parent, "tab_units");
			set_component_active_with_parent(false, uic_parent, "tab_regions");
			set_component_active_with_parent(false, uic_parent, "tab_factions");
		end,
		function()
			local ui_root = core:get_ui_root();
			local uic_parent = find_uicomponent(ui_root, "panel_buttons_tab_sidemenu");
			set_component_active_with_parent(true, uic_parent, "tab_units");
			set_component_active_with_parent(true, uic_parent, "tab_regions");
			set_component_active_with_parent(true, uic_parent, "tab_factions");
		end
	);

	-------------------------------
	-- incentives
	-------------------------------
	ui_overrides.incentives = ui_override:new(
		"incentives",
		function()
			cm:override_ui("disable_incentives_stack", true);
		end,
		function()
			cm:override_ui("disable_incentives_stack", false);
		end
	);

	-------------------------------
	-- stances
	-------------------------------
	ui_overrides.stances = ui_override:new(
		"stances",
		function()
			cm:override_ui("disable_stances_stack", true);
		end,
		function()
			-- forceably clear selection if a character is selected as the stances do not refresh properly until the character is reselected
			if uim:get_char_selected_cqi() then
				CampaignUI.ClearSelection();
			end;

			cm:override_ui("disable_stances_stack", false);
		end
	);

	-------------------------------
	-- province_details
	-------------------------------
	ui_overrides.province_details = ui_override:new(
		"province_details",
		function()
			cm:override_ui("disable_province_details", true);
			local ui_root = core:get_ui_root();
			set_component_active_with_parent(false, ui_root, "info_panel_holder", "button_province_details");
		end,
		function()
			local ui_root = core:get_ui_root();
			set_component_active_with_parent(true, ui_root, "info_panel_holder", "button_province_details");
			cm:override_ui("disable_province_details", false);
		end
	);

	-------------------------------
	-- character_details
	-------------------------------
	ui_overrides.character_details = ui_override:new(
		"character_details",
		function()
			cm:override_ui("disable_character_details_panel", true);
		end,
		function()
			cm:override_ui("disable_character_details_panel", false);
			local uic_character_details_button = find_uicomponent("hud_campaign", "BL_parent", "info_panel_holder", "primary_info_panel_holder", "info_panel_background", "CharacterInfoPopup", "nameplate_bg", "info_button_list", "button_general")
			if uic_character_details_button then
				set_component_active_action(true, uic_character_details_button);
			end;
		end
	);

	-------------------------------
	-- tutorial_battles
	-------------------------------
	ui_overrides.tutorial_battles = ui_override:new(
		"tutorial_battles",
		function()
			set_component_active_with_parent(false, core:get_ui_root(), "options_tutorial_menu", "tutorial_battle_1");
			set_component_active_with_parent(false, core:get_ui_root(), "options_tutorial_menu", "tutorial_battle_2");
		end,
		function()
			set_component_active_with_parent(not cm:is_multiplayer(), core:get_ui_root(), "options_tutorial_menu", "tutorial_battle_1");
			set_component_active_with_parent(not cm:is_multiplayer(), core:get_ui_root(), "options_tutorial_menu", "tutorial_battle_2");
		end
	);
	-------------------------------
	-- force_details
	-------------------------------
	ui_overrides.force_details = ui_override:new(
		"force_details",
		function()
			cm:override_ui("disable_force_details_panel", true);
		end,
		function()
			cm:override_ui("disable_force_details_panel", false);
		end
	);

	-------------------------------
	-- raise_army
	-------------------------------
	ui_overrides.raise_army = ui_override:new(
		"raise_army",
		function()
			cm:override_ui("disable_enlist_general", true);
			local ui_root = core:get_ui_root();
			set_component_active_with_parent(false, ui_root, "button_group_settlement", "button_create_army");
		end,
		function()
			local ui_root = core:get_ui_root();
			set_component_active_with_parent(true, ui_root, "button_group_settlement", "button_create_army");
			cm:override_ui("disable_enlist_general", false);
		end
	);

	-------------------------------
	-- replace_general
	-------------------------------
	ui_overrides.replace_general = ui_override:new(
		"replace_general",
		function()
			cm:override_ui("disable_replace_general", true);
		end,
		function()
			cm:override_ui("disable_replace_general", false);
		end
	);

	-------------------------------
	-- recruit_units
	-------------------------------
	ui_overrides.recruit_units = ui_override:new(
		"recruit_units",
		function()
			local ui_root = core:get_ui_root();
			set_component_active_with_parent(false, ui_root, "button_group_army", "button_recruitment");
			cm:override_ui("disable_recruit_units", true);

			-- a hack to close the recruitment panel if it is open - find the recruitment panel minimise button and simulate a click on it if it's visible
			local uic_button_minimise = find_uicomponent(ui_root, "units_panel", "main_units_panel", "recruitment_docker", "recruitment_options", "button_minimise");
			if uic_button_minimise and is_fully_onscreen(uic_button_minimise) then
				uic_button_minimise:SimulateLClick();
			end;
		end,
		function()
			local ui_root = core:get_ui_root();
			set_component_active_with_parent(true, ui_root, "button_group_army", "button_recruitment");
			cm:override_ui("disable_recruit_units", false);
		end
	);

	-------------------------------
	-- hide_units
	-------------------------------
	ui_overrides.hide_units = ui_override:new(
			"hide_units",
			function()
				local ui_root = core:get_ui_root();
				set_component_visible_with_parent(false, ui_root, "button_group_army", "button_recruitment");
				cm:override_ui("hide_recruit_units", true);
			end,
			function()
				local ui_root = core:get_ui_root();
				set_component_visible_with_parent(true, ui_root, "button_group_army", "button_recruitment");
				cm:override_ui("hide_recruit_units", false);
			end
	);

	-------------------------------
	-- enlist_agent
	-------------------------------
	ui_overrides.enlist_agent = ui_override:new(
		"enlist_agent",
		function()
			local ui_root = core:get_ui_root();
			set_component_active_with_parent(false, ui_root, "button_group_settlement", "button_agents");
			cm:override_ui("disable_enlist_agent", true);
		end,
		function()
			cm:override_ui("disable_enlist_agent", false);
			local ui_root = core:get_ui_root();
			set_component_active_with_parent(true, ui_root, "button_group_settlement", "button_agents");
		end
	);

	-------------------------------
	-- recruit_mercenaries
	-------------------------------
	ui_overrides.recruit_mercenaries = ui_override:new(
		"recruit_mercenaries",
		function()
			local ui_root = core:get_ui_root();
			set_component_active_with_parent(false, ui_root, "button_group_army", "button_mercenaries");
			cm:override_ui("disable_recruit_mercenaries", true);
		end,
		function()
			local ui_root = core:get_ui_root();
			set_component_active_with_parent(true, ui_root, "button_group_army", "button_mercenaries");
			cm:override_ui("disable_recruit_mercenaries", false);
		end
	);

	-------------------------------
	-- show_mercenaries
	-------------------------------
	ui_overrides.show_mercenaries = ui_override:new(
			"show_mercenaries",
			function()
				local ui_root = core:get_ui_root();
				set_component_visible_with_parent(true, ui_root, "button_group_army", "button_mercenaries");
				cm:override_ui("show_recruit_mercenaries", true);
			end,
			function()
				local ui_root = core:get_ui_root();
				set_component_visible_with_parent(false, ui_root, "button_group_army", "button_mercenaries");
				cm:override_ui("show_recruit_mercenaries", false);
			end
	);

	-------------------------------
	-- hide_faction_button
	-------------------------------
	ui_overrides.hide_faction_button = ui_override:new(
		"hide_faction_button",
		function()
			local ui_root = core:get_ui_root();
			set_component_active_with_parent(false, ui_root, "button_group_management", "button_factions");
			set_component_visible_with_parent(false, ui_root, "faction_widget", "main_buttons", "button_factions_holder");
			cm:override_ui("disable_clan_button", true);
		end,
		function()
			local ui_root = core:get_ui_root();
			set_component_active_with_parent(true, ui_root, "button_group_management", "button_factions");
			set_component_visible_with_parent(true, ui_root, "faction_widget", "main_buttons", "button_factions_holder");
			cm:override_ui("disable_clan_button", false);
		end
	);

	-------------------------------
	-- faction_button
	-------------------------------
	ui_overrides.faction_button = ui_override:new(
		"faction_button",
		function()
			local ui_root = core:get_ui_root();
			set_component_active_with_parent(false, ui_root, "button_group_management", "button_factions");
			cm:override_ui("disable_clan_button", true);
		end,
		function()
			local ui_root = core:get_ui_root();
			set_component_active_with_parent(true, ui_root, "button_group_management", "button_factions");
			cm:override_ui("disable_clan_button", false);
		end
	);

	-------------------------------
	-- missions
	-------------------------------
	ui_overrides.missions = ui_override:new(
		"missions",
		function()
			cm:disable_shortcut("button_missions", "show_objectives", true);
			cm:override_ui("disable_missions_button", true);
			local ui_root = core:get_ui_root();
			set_component_active_with_parent(false, ui_root, "button_missions");
		end,
		function()
			cm:disable_shortcut("button_missions", "show_objectives", false);
			cm:override_ui("disable_missions_button", false);
			local ui_root = core:get_ui_root();
			set_component_active_with_parent(true, ui_root, "button_missions");
		end
	);

	-------------------------------
	-- cancel_mission
	-------------------------------
	ui_overrides.cancel_mission = ui_override:new(
		"cancel_mission",
		function()
			cm:override_ui("cancel_mission", true);
		end,
		function()
			cm:override_ui("cancel_mission", false);
		end
	);	

	-------------------------------
	-- finance
	-------------------------------
	ui_overrides.finance = ui_override:new(
		"finance",
		function()
			cm:disable_shortcut("button_finance", "show_finance", true);
			cm:override_ui("disable_finance_button", true);
			local ui_root = core:get_ui_root();
			set_component_active_with_parent(false, ui_root, "button_finance");
		end,
		function()
			cm:disable_shortcut("button_finance", "show_finance", false)
			cm:override_ui("disable_finance_button", false);
			local ui_root = core:get_ui_root();
			set_component_active_with_parent(true, ui_root, "button_finance");
		end
	);

	-------------------------------
	-- technology
	-------------------------------
	ui_overrides.technology = ui_override:new(
		"technology",
		function()
			cm:disable_shortcut("button_technology", "show_technologies", true)
			cm:override_ui("disable_tech_button", true);
			local ui_root = core:get_ui_root();
			set_component_visible_with_parent(false, ui_root, "faction_widget", "technology_container");
		end,
		function()
			cm:disable_shortcut("button_technology", "show_technologies", false)
			cm:override_ui("disable_tech_button", false);
			local ui_root = core:get_ui_root();
			set_component_visible_with_parent(true, ui_root, "faction_widget", "technology_container");
			set_component_active_with_parent(true, ui_root, "faction_widget", "technology_container", "button_technology");
			if core:is_ui_created() then
				CampaignUI.UpdateTechButton();
			end;
		end
	);

	-------------------------------
	-- technology_disabled
	-- It only disables the tech, without hiding it. 
	-------------------------------
	ui_overrides.technology_disabled = ui_override:new(
		"technology_disabled",
		function()
			cm:disable_shortcut("button_technology", "show_technologies", true)
			cm:override_ui("disable_tech_button", true);
			uim:suppress_end_turn_warning("research available", true)
		end,
		function()
			cm:disable_shortcut("button_technology", "show_technologies", false)
			cm:override_ui("disable_tech_button", false);
			uim:suppress_end_turn_warning("research available", false)
			local ui_root = core:get_ui_root();
			set_component_active_with_parent(true, ui_root, "faction_widget", "technology_container", "button_technology");
			if core:is_ui_created() then
				CampaignUI.UpdateTechButton();
			end;
		end
	);

	-------------------------------
	-- objectives_screen
	-------------------------------
	ui_overrides.objectives_screen = ui_override:new(
		"objectives_screen",
		function()
			cm:disable_shortcut("button_missions", "show_objectives", true)
			cm:override_ui("disable_objectives_screen", true);
			-- #Phar hide "objectives" / "missions" button since Pharaoh has an alternative custom screen called Journal
			-- set_component_visible_with_parent(false, core:get_ui_root(), "faction_widget", "missions_container");
		end,
		function()
			cm:disable_shortcut("button_missions", "show_objectives", false)
			cm:override_ui("disable_objectives_screen", false);
			-- #Phar hide "objectives" / "missions" button since Pharaoh has an alternative custom screen called Journal
			-- set_component_visible_with_parent(true, core:get_ui_root(), "faction_widget", "missions_container");
		end
	);
	-------------------------------
	-- journal
	-------------------------------
	ui_overrides.journal = ui_override:new(
		"journal",
		function()
			cm:disable_shortcut("button_phar_journal", "show_journal", true)
			cm:override_ui("disable_journal", true);
			set_component_visible_with_parent(false, core:get_ui_root(), "faction_widget", "phar_journal_container");
		end,
		function()
			cm:disable_shortcut("button_phar_journal", "show_journal", false)
			cm:override_ui("disable_journal", false);
			set_component_visible_with_parent(true, core:get_ui_root(), "faction_widget", "phar_journal_container");
		end
	);
	-------------------------------
	-- rituals
	-------------------------------
	ui_overrides.rituals = ui_override:new(
		"rituals",
		function()
			cm:override_ui("disable_rituals", true);
			local ui_root = core:get_ui_root();
			set_component_active_with_parent(false, ui_root, "faction_buttons_docker", "button_rituals");
		end,
		function()
			cm:override_ui("disable_rituals", false);
			local ui_root = core:get_ui_root();
			set_component_active_with_parent(true, ui_root, "faction_buttons_docker", "button_rituals");
		end
	);

	-------------------------------
	-- diplomacy
	-------------------------------
	ui_overrides.diplomacy = ui_override:new(
		"diplomacy",
		function()
			cm:disable_shortcut("button_diplomacy", "show_diplomacy", true);
			cm:override_ui("disable_diplomacy", true);
			set_component_visible_with_parent(false, core:get_ui_root(), "diplomacy_container");
			uim:override("diplomacy_double_click"):lock()
		end,
		function()
			cm:disable_shortcut("button_diplomacy", "show_diplomacy", false);
			cm:override_ui("disable_diplomacy", false);
			set_component_visible_with_parent(true, core:get_ui_root(), "diplomacy_container");
			uim:override("diplomacy_double_click"):unlock()
		end
	);

	-------------------------------
	-- tactical_map
	-------------------------------
	ui_overrides.tactical_map = ui_override:new(
		"tactical_map",
		function()
			cm:disable_shortcut("camera", "show_tactical_map", true);
			cm:override_ui("disable_campaign_tactical_map", true);
			local ui_root = core:get_ui_root();
			set_component_active_with_parent(false, ui_root, "bar_small_top", "button_tactical_map");
		end,
		function()
			cm:disable_shortcut("camera", "show_tactical_map", false);
			cm:override_ui("disable_campaign_tactical_map", false);
			local ui_root = core:get_ui_root();
			set_component_active_with_parent(true, ui_root, "bar_small_top", "button_tactical_map");
		end
	);

	-------------------------------
	-- enlist_navy
	-------------------------------
	ui_overrides.enlist_navy = ui_override:new(
		"enlist_navy",
		function()
			cm:override_ui("disable_enlist_navy", true);
		end,
		function()
			cm:override_ui("disable_enlist_navy", false);
		end
	);

	-------------------------------
	-- events_rollout
	-------------------------------
	ui_overrides.events_rollout = ui_override:new(
		"events_rollout",
		function()
			local ui_root = core:get_ui_root();
			local uic_events_rollout = find_uicomponent(ui_root, "dropdown_events", "panel");
			if uic_events_rollout then
				if uic_events_rollout:Visible() or uic_events_rollout:CurrentAnimationId() == "show" then
					uic_events_rollout:TriggerAnimation("hide");
				end;
			else
				script_error("Couldn't find uic_events_rollout");
			end;

			--cm:override_ui("disable_campaign_dropdowns", true);
			cm:override_ui("disable_events_dropdown_button", true);
		end,
		function()
			-- cm:override_ui("disable_campaign_dropdowns", false);
			cm:override_ui("disable_events_dropdown_button", false);
		end
	);

	-------------------------------
	-- events_panel
	-------------------------------
	ui_overrides.events_panel = ui_override:new(
		"events_panel",
		function()
			cm:override_ui("disable_event_panel_auto_open", true);
		end,
		function()
			cm:override_ui("disable_event_panel_auto_open", false);
		end
	);

	-------------------------------
	-- events_panel
	-------------------------------
	ui_overrides.disable_ers = ui_override:new(
		"disable_ers",
		function()
			cm:override_ui("disable_ers", true);
		end,
		function()
			cm:override_ui("disable_ers", false);
		end
	);

	-------------------------------
	-- hide_sidemenu
	-------------------------------
	ui_overrides.hide_sidemenu = ui_override:new(
		"hide_sidemenu",
		function()
			cm:override_ui("hide_sidemenu", true);
		end,
		function()
			cm:override_ui("hide_sidemenu", false);
		end
	);

	-------------------------------
	-- hide_pillars_tracker
	-------------------------------
	ui_overrides.hide_pillars_tracker = ui_override:new(
		"hide_pillars_tracker",
		function()
			cm:override_ui("hide_pillars_tracker", true);
		end,
		function()
			cm:override_ui("hide_pillars_tracker", false);
		end
	);

	-------------------------------
	-- hide_tribes_privileges
	-------------------------------
	ui_overrides.hide_tribes_privileges = ui_override:new(
		"hide_tribes_privileges",
		function()
			cm:override_ui("hide_tribes_privileges", true);
		end,
		function()
			cm:override_ui("hide_tribes_privileges", false);
		end
	)

	-------------------------------
	-- hide_eminence
	-------------------------------
	ui_overrides.hide_resource_phar_eminence = ui_override:new(
		"hide_resource_phar_eminence",
		function()
			cm:override_ui("hide_resource_phar_eminence", true);
		end,
		function()
			cm:override_ui("hide_resource_phar_eminence", false);
		end
	);

	-------------------------------
	-- hide_war_spoils
	-------------------------------
	ui_overrides.hide_war_spoils = ui_override:new(
		"hide_war_spoils",
		function()
			cm:override_ui("hide_war_spoils", true);
		end,
		function()
			cm:override_ui("hide_war_spoils", false);
		end
	)

		-------------------------------
	-- hide_resource_phar_sea_blades_points
	-------------------------------
	ui_overrides.hide_resource_phar_sea_blades_points = ui_override:new(
		"hide_resource_phar_sea_blades_points",
		function()
			cm:override_ui("hide_resource_phar_sea_blades_points", true);
		end,
		function()
			cm:override_ui("hide_resource_phar_sea_blades_points", false);
		end
	)

		-------------------------------
	-- hide_resource_phar_sea_dwelling_points
	-------------------------------
	ui_overrides.hide_resource_phar_sea_dwelling_points = ui_override:new(
		"hide_resource_phar_sea_dwelling_points",
		function()
			cm:override_ui("hide_resource_phar_sea_dwelling_points", true);
		end,
		function()
			cm:override_ui("hide_resource_phar_sea_dwelling_points", false);
		end
	)

	-------------------------------
	-- hide_resource_troy_dominance
	-------------------------------
	ui_overrides.hide_resource_troy_dominance = ui_override:new(
		"hide_resource_troy_dominance",
		function()
			cm:override_ui("hide_resource_troy_dominance", true);
		end,
		function()
			cm:override_ui("hide_resource_troy_dominance", false);
		end
	)

	-------------------------------
	-- end_turn
	-------------------------------
	ui_overrides.end_turn = ui_override:new(
		"end_turn",
		function()
			cm:disable_shortcut("button_end_turn", "end_turn", true);
			cm:override_ui("disable_end_turn", true);
		end,
		function()
			cm:disable_shortcut("button_end_turn", "end_turn", false);
			cm:override_ui("disable_end_turn", false);
		end
	);

	-------------------------------
	-- tax_exemption
	-------------------------------
	ui_overrides.tax_exemption = ui_override:new(
		"tax_exemption",
		function()
			set_component_active(false, "province_details_panel", "checkbox_tax_exempt");
			cm:override_ui("disable_tax_exempt", true);
		end,
		function()
			cm:override_ui("disable_tax_exempt", false);
			set_component_active(true, "province_details_panel", "checkbox_tax_exempt");
		end
	);

	-------------------------------
	-- autoresolve
	-------------------------------
	ui_overrides.autoresolve = ui_override:new(
		"autoresolve",
		function()
			cm:override_ui("disable_prebattle_autoresolve", true);
		end,
		function()
			-- only actually unlock if the "autoresolve_for_advice" ui override is also unlocked
			if ui_overrides.autoresolve_for_advice:get_allowed() and not ui_overrides.autoresolve_for_advice:is_locked() then
				cm:override_ui("disable_prebattle_autoresolve", false);
			end;
		end
	);

	-------------------------------
	-- autoresolve_for_advice
	-------------------------------
	ui_overrides.autoresolve_for_advice = ui_override:new(
		"autoresolve_for_advice",
		function()
			-- set up a callback to set the tooltip on autoresolve buttons
			local function set_autoresolve_button_tooltip()
				local ui_root = core:get_ui_root();

				-- button_set_siege
				local uic_button = find_uicomponent(ui_root, "popup_pre_battle", "mid", "regular_deployment", "button_set_siege", "button_autoresolve");
				if uic_button then
					core:cache_and_set_tooltip_for_component_state(uic_button, "inactive", "campaign_localised_strings_string_attack_button_locked_for_advice");
				end;

				-- button_set_attack
				uic_button = find_uicomponent(ui_root, "popup_pre_battle", "mid", "regular_deployment", "button_set_attack", "button_autoresolve");
				if uic_button then
					core:cache_and_set_tooltip_for_component_state(uic_button, "inactive", "campaign_localised_strings_string_attack_button_locked_for_advice");
				end;
			end;

			-- call callback immediately
			set_autoresolve_button_tooltip();

			-- call callback again if pre-battle panel opened
			core:add_listener(
				"autoresolve_for_advice_ui_override",
				"PanelOpenedCampaign",
				function(context)
					return context.string == "popup_pre_battle"
				end,
				function()
					set_autoresolve_button_tooltip();
				end,
				true
			);

		end,
		function()
			-- only actually unlock if the "autoresolve" ui override is also unlocked
			if ui_overrides.autoresolve:get_allowed() and not ui_overrides.autoresolve:is_locked() then
				cm:override_ui("disable_prebattle_autoresolve", false);
			end;

			-- restore the tooltips on the buttons
			local ui_root = core:get_ui_root();

			-- button_set_siege
			local uic_button = find_uicomponent(ui_root, "popup_pre_battle", "mid", "regular_deployment", "button_set_siege", "button_autoresolve");
			if uic_button then
				core:restore_tooltip_for_component_state(uic_button, "inactive", "campaign_localised_strings_string_attack_button_locked_for_advice");
			end;

			-- button_set_attack
			uic_button = find_uicomponent(ui_root, "popup_pre_battle", "mid", "regular_deployment", "button_set_attack", "button_autoresolve");
			if uic_button then
				core:restore_tooltip_for_component_state(uic_button, "inactive", "campaign_localised_strings_string_attack_button_locked_for_advice");
			end;

			core:remove_listener("autoresolve_for_advice_ui_override");
		end
	);

	-------------------------------
	-- maintain_siege
	-------------------------------
	ui_overrides.maintain_siege = ui_override:new(
		"maintain_siege",
		function()
			cm:override_ui("disable_prebattle_continue", true);

			local ui_root = core:get_ui_root();
			set_component_active_with_parent(false, ui_root, "button_set_siege", "button_continue_siege");
			set_component_active_with_parent(false, ui_root, "button_set_attack", "button_maintain_blockade");
		end,
		function()
			local ui_root = core:get_ui_root();
			set_component_active_with_parent(true, ui_root, "button_set_attack", "button_maintain_blockade");
			set_component_active_with_parent(true, ui_root, "button_set_siege", "button_continue_siege");

			cm:override_ui("disable_prebattle_continue", false);
		end
	);

	-------------------------------
	-- prebattle_attack
	-------------------------------
	ui_overrides.prebattle_attack = ui_override:new(
		"prebattle_attack",
		function()
			cm:override_ui("disable_prebattle_attack", true);
		end,
		function()
			cm:override_ui("disable_prebattle_attack", false);
		end
	);

	-------------------------------
	-- prebattle_attack_for_advice
	-------------------------------
	ui_overrides.prebattle_attack_for_advice = ui_override:new(
		"prebattle_attack_for_advice",
		function()
			cm:override_ui("disable_prebattle_attack", true);

			-- set up a callback to set the tooltip on autoresolve buttons
			local function set_attack_button_tooltip()
				local ui_root = core:get_ui_root();

				-- button_set_siege
				local uic_button = find_uicomponent(ui_root, "popup_pre_battle", "mid", "regular_deployment", "button_set_siege", "button_attack");
				if uic_button then
					core:cache_and_set_tooltip_for_component_state(uic_button, "inactive", "campaign_localised_strings_string_attack_button_locked_for_advice");
				end;

				-- button_set_attack
				uic_button = find_uicomponent(ui_root, "popup_pre_battle", "mid", "regular_deployment", "button_set_attack", "button_attack");
				if uic_button then
					core:cache_and_set_tooltip_for_component_state(uic_button, "inactive", "campaign_localised_strings_string_attack_button_locked_for_advice");
				end;
			end;

			-- call callback immediately
			set_attack_button_tooltip();

			-- call callback again if pre-battle panel opened
			core:add_listener(
				"attack_for_advice_ui_override",
				"PanelOpenedCampaign",
				function(context)
					return context.string == "popup_pre_battle"
				end,
				function()
					set_attack_button_tooltip();
				end,
				true
			);
		end,
		function()
			cm:override_ui("disable_prebattle_attack", false);

			-- restore the tooltips on the buttons
			local ui_root = core:get_ui_root();

			-- button_set_siege
			local uic_button = find_uicomponent(ui_root, "popup_pre_battle", "mid", "regular_deployment", "button_set_siege", "button_attack");
			if uic_button then
				core:restore_tooltip_for_component_state(uic_button, "inactive", "campaign_localised_strings_string_attack_button_locked_for_advice");
			end;

			-- button_set_attack
			uic_button = find_uicomponent(ui_root, "popup_pre_battle", "mid", "regular_deployment", "button_set_attack", "button_attack");
			if uic_button then
				core:restore_tooltip_for_component_state(uic_button, "inactive", "campaign_localised_strings_string_attack_button_locked_for_advice");
			end;

			core:remove_listener("attack_for_advice_ui_override");
		end
	);

	-------------------------------
	-- cancel_siege_weapons
	-------------------------------
	ui_overrides.cancel_siege_weapons = ui_override:new(
		"cancel_siege_weapons",
		function()
			cm:override_ui("disable_cancel_siege_equipment", true);
		end,
		function()
			cm:override_ui("disable_cancel_siege_equipment", false);
		end
	);

	-------------------------------
	-- retreat
	-------------------------------
	ui_overrides.retreat = ui_override:new(
		"retreat",
		function()
			-- override disabled - if uncommenting for future projects, have the UI guys add a listener for when the override gets switched so they can
			-- recalculate the state of the retreat button rather than us setting it directly (script calls that previously did this have been removed)
			cm:override_ui("disable_prebattle_retreat", true);
		end,
		function()
			cm:override_ui("disable_prebattle_retreat", false);
		end
	);

	-------------------------------
	-- dismantle_building
	-------------------------------
	ui_overrides.dismantle_building = ui_override:new(
		"dismantle_building",
		function()
			cm:override_ui("disable_dismantle_building", true);
		end,
		function()
			cm:override_ui("disable_dismantle_building", false);
		end
	);

	-------------------------------
	-- disband_unit
	-------------------------------
	ui_overrides.disband_unit = ui_override:new(
		"disband_unit",
		function()
			cm:override_ui("disable_disband_unit", true);
		end,
		function()
			cm:override_ui("disable_disband_unit", false);
		end
	);

	-------------------------------
	-- repair_building
	-------------------------------
	ui_overrides.repair_building = ui_override:new(
		"repair_building",
		function()
			cm:override_ui("disable_repair_building", true);
		end,
		function()
			cm:override_ui("disable_repair_building", false);
		end
	);

	-------------------------------
	-- cancel_construction
	-------------------------------
	ui_overrides.cancel_construction = ui_override:new(
		"cancel_construction",
		function()
			cm:override_ui("disable_cancel_construction", true);
		end,
		function()
			cm:override_ui("disable_cancel_construction", false);
		end
	);

	-------------------------------
	-- cancel_recruitment
	-------------------------------
	ui_overrides.cancel_recruitment = ui_override:new(
		"cancel_recruitment",
		function()
			cm:override_ui("disable_cancel_recruitment", true);
		end,
		function()
			cm:override_ui("disable_cancel_recruitment", false);
		end
	);

	-------------------------------
	-- construction_site
	-------------------------------
	ui_overrides.construction_site = ui_override:new(
		"construction_site",
		function()
			cm:override_ui("disable_construction_site", true);
		end,
		function()
			cm:override_ui("disable_construction_site", false);
		end
	);

	-------------------------------
	-- cost_display
	-------------------------------
	ui_overrides.cost_display = ui_override:new(
		"cost_display",
		function()
			cm:override_ui("disable_cost_display", true);
		end,
		function()
			cm:override_ui("disable_cost_display", false);
		end,
		false
	);

	-------------------------------
	-- dismiss_advice_end_turn
	-------------------------------
	ui_overrides.dismiss_advice_end_turn = ui_override:new(
		"dismiss_advice_end_turn",
		function()
			cm:override_ui("disable_dismiss_advice_end_turn", true);
		end,
		function()
			cm:override_ui("disable_dismiss_advice_end_turn", false);
		end,
		false
	);

	-------------------------------
	-- advice_navigation
	-------------------------------
	ui_overrides.advice_navigation = ui_override:new(
		"advice_navigation",
		function()
			cm:override_ui("disable_advice_changes", true);
		end,
		function()
			cm:override_ui("disable_advice_changes", false);
		end,
		false
	);

	-------------------------------
	-- toggle_move_speed
	-------------------------------
	ui_overrides.toggle_move_speed = ui_override:new(
		"toggle_move_speed",
		function()
			cm:disable_shortcut("root", "toggle_move_speed", true);
		end,
		function()
			cm:disable_shortcut("root", "toggle_move_speed", false);
		end
	);

	-------------------------------
	-- end_of_turn_warnings
	-------------------------------
	ui_overrides.end_of_turn_warnings = ui_override:new(
		"end_of_turn_warnings",
		function()
			cm:override_ui("disable_end_of_turn_warnings", true);
			set_component_active_with_parent(false, core:get_ui_root(), "panel_buttons_tab_sidemenu", "tab_notifications");
		end,
		function()
			cm:override_ui("disable_end_of_turn_warnings", false);
			set_component_active_with_parent(true, core:get_ui_root(), "panel_buttons_tab_sidemenu", "tab_notifications");
		end
	);

	-------------------------------
	-- windowed_movies
	-------------------------------
	ui_overrides.windowed_movies = ui_override:new(
		"windowed_movies",
		function()
			cm:override_ui("disable_windowed_movies", true);
		end,
		function()
			cm:override_ui("disable_windowed_movies", false);
		end
	);

	-------------------------------
	-- upgrade_unit
	-------------------------------
	ui_overrides.upgrade_unit = ui_override:new(
		"upgrade_unit",
		function()
			cm:override_ui("disable_upgrade_unit", true);
		end,
		function()
			cm:override_ui("disable_upgrade_unit", false);
		end
	);

	-------------------------------
	-- sally_forth_button
	-------------------------------
	ui_overrides.sally_forth_button = ui_override:new(
		"sally_forth_button",
		function()
			cm:override_ui("disable_sally_forth_button", true);
		end,
		function()
			cm:override_ui("disable_sally_forth_button", false);
		end
	);

	-------------------------------
	-- subjugation_button
	-------------------------------
	ui_overrides.subjugation_button = ui_override:new(
		"subjugation_button",
		function()
			cm:override_ui("disable_postbattle_subjugation_button", true);
		end,
		function()
			cm:override_ui("disable_postbattle_subjugation_button", false);
		end
	);

	-------------------------------
	-- occupy_button
	-------------------------------
	ui_overrides.occupy_button = ui_override:new(
		"occupy_button",
		function()
			cm:override_ui("disable_postbattle_occupy_button", true);
		end,
		function()
			cm:override_ui("disable_postbattle_occupy_button", false);
		end
	);

	-------------------------------
	-- raze_button
	-------------------------------
	ui_overrides.raze_button = ui_override:new(
		"raze_button",
		function()
			cm:override_ui("disable_postbattle_raze_button", true);
		end,
		function()
			cm:override_ui("disable_postbattle_raze_button", false);
		end
	);

	-------------------------------
	-- loot_button
	-------------------------------
	ui_overrides.loot_button = ui_override:new(
		"loot_button",
		function()
			cm:override_ui("disable_postbattle_loot_button", true);
		end,
		function()
			cm:override_ui("disable_postbattle_loot_button", false);
		end
	);

	-------------------------------
	-- sack_button
	-------------------------------
	ui_overrides.sack_button = ui_override:new(
		"sack_button",
		function()
			cm:override_ui("disable_postbattle_sack_button", true);
		end,
		function()
			cm:override_ui("disable_postbattle_sack_button", false);
		end
	);

	-------------------------------
	-- settlement_renaming
	-------------------------------
	ui_overrides.settlement_renaming = ui_override:new(
		"settlement_renaming",
		function()
			cm:override_ui("disable_settlement_renaming", true);
		end,
		function()
			cm:override_ui("disable_settlement_renaming", false);
		end
	);

	-------------------------------
	-- food_display
	-------------------------------
	ui_overrides.food_display = ui_override:new(
		"food_display",
		function()
			cm:override_ui("disable_food_display", true);
		end,
		function()
			cm:override_ui("disable_food_display", false);
		end,
		false
	);

	-------------------------------
	-- abandon_settlements
	-------------------------------
	ui_overrides.abandon_settlements = ui_override:new(
		"abandon_settlements",
		function()
			cm:override_ui("disable_abandon_settlements", true);
		end,
		function()
			cm:override_ui("disable_abandon_settlements", false);
		end
	);

	-------------------------------
	-- building_upgrades
	-------------------------------
	ui_overrides.building_upgrades = ui_override:new(
		"building_upgrades",
		function()
			cm:override_ui("disable_building_upgrades", true);
		end,
		function()
			cm:override_ui("disable_building_upgrades", false);
		end
	);

	-------------------------------
	-- non_city_building_upgrades
	-------------------------------
	ui_overrides.non_city_building_upgrades = ui_override:new(
		"non_city_building_upgrades",
		function()
			cm:override_ui("disable_non_city_building_upgrades", true);
		end,
		function()
			cm:override_ui("disable_non_city_building_upgrades", false);
		end
	);

	-------------------------------
	-- convert_religion
	-------------------------------
	ui_overrides.convert_religion = ui_override:new(
		"convert_religion",
		function()
			cm:override_ui("disable_convert_religion", true);
		end,
		function()
			cm:override_ui("disable_convert_religion", false);
		end
	);

	-------------------------------
	-- public_order_display
	-------------------------------
	ui_overrides.public_order_display = ui_override:new(
		"public_order_display",
		function()
			cm:override_ui("disable_public_order_display", true);
		end,
		function()
			cm:override_ui("disable_public_order_display", false);
		end,
		false
	);

	-------------------------------
	-- seek_wife
	-------------------------------
	ui_overrides.seek_wife = ui_override:new(
		"seek_wife",
		function()
			cm:override_ui("disable_seek_wife", true);
		end,
		function()
			cm:override_ui("disable_seek_wife", false);
		end
	);

	-------------------------------
	-- large_info_panels
	-------------------------------
	ui_overrides.large_info_panels = ui_override:new(
		"large_info_panels",
		function()
			cm:override_ui("disable_large_info_panels", true);
		end,
		function()
			cm:override_ui("disable_large_info_panels", false);
		end,
		false
	);

	-------------------------------
	-- building_browser
	-------------------------------
	ui_overrides.building_browser = ui_override:new(
		"building_browser",
		function()
			cm:override_ui("disable_building_browser", true);
		end,
		function()
			cm:override_ui("disable_building_browser", false);
		end
	);

	-------------------------------
	-- migration
	-------------------------------
	ui_overrides.migration = ui_override:new(
		"migration",
		function()
			cm:override_ui("disable_migrate_button", true);
		end,
		function()
			cm:override_ui("disable_migrate_button", false);
		end
	);

	-------------------------------
	-- migration_cancel
	-------------------------------
	ui_overrides.migration_cancel = ui_override:new(
		"migration_cancel",
		function()
			cm:override_ui("disable_cancel_migration", true);
		end,
		function()
			cm:override_ui("disable_cancel_migration", false);
		end
	);

	-------------------------------
	-- prebattle_save
	-------------------------------
	ui_overrides.prebattle_save = ui_override:new(
		"prebattle_save",
		function()
			cm:override_ui("disable_prebattle_save", true);
		end,
		function()
			cm:override_ui("disable_prebattle_save", false);
		end
	);

	-------------------------------
	-- resettle
	-------------------------------
	ui_overrides.resettle = ui_override:new(
		"resettle",
		function()
			cm:override_ui("disable_resettle", true);
		end,
		function()
			cm:override_ui("disable_resettle", false);
		end
	);

	-------------------------------
	-- diplomacy_audio
	-------------------------------
	ui_overrides.diplomacy_audio = ui_override:new(
		"diplomacy_audio",
		function()
			cm:override_ui("disable_diplomacy_audio", true);
		end,
		function()
			cm:override_ui("disable_diplomacy_audio", false);
		end
	);

	-------------------------------
	-- book_of_grudges
	-------------------------------
	ui_overrides.book_of_grudges = ui_override:new(
		"book_of_grudges",
		function()
			set_component_active(false, "faction_buttons_docker", "button_grudges");
		end,
		function()
			set_component_active(true, "faction_buttons_docker", "button_grudges");
		end
	);

	-------------------------------
	-- offices
	-------------------------------
	ui_overrides.offices = ui_override:new(
		"offices",
		function()
			set_component_active(false, "faction_buttons_docker", "button_offices");
			cm:override_ui("disable_office_button", true);
		end,
		function()
			cm:override_ui("disable_office_button", false);
			set_component_active(true, "faction_buttons_docker", "button_offices");
		end
	);

	-------------------------------
	-- grudges
	-------------------------------
	ui_overrides.grudges = ui_override:new(
		"grudges",
		function()
			set_component_active(false, "faction_buttons_docker", "button_grudges");
			cm:override_ui("disable_grudge_button", true);
		end,
		function()
			cm:override_ui("disable_grudge_button", false);
			set_component_active(true, "faction_buttons_docker", "button_grudges");
		end
	);

	-------------------------------
	-- diplomacy_double_click
	-------------------------------
	ui_overrides.diplomacy_double_click = ui_override:new(
		"diplomacy_double_click",
		function()
			cm:override_ui("disable_diplomacy_double_click", true);
		end,
		function()
			cm:override_ui("disable_diplomacy_double_click", false);
		end
	);

	-------------------------------
	-- giving_orders
	-------------------------------
	ui_overrides.giving_orders = ui_override:new(
		"giving_orders",
		function()
			cm:override_ui("disable_giving_orders", true);
		end,
		function()
			cm:override_ui("disable_giving_orders", false);
		end
	);

	-------------------------------
	-- ping_clicks
	-------------------------------
	ui_overrides.ping_clicks = ui_override:new(
		"ping_clicks",
		function()
			cm:override_ui("disable_ping_clicks", true);
		end,
		function()
			cm:override_ui("disable_ping_clicks", false);
		end
	);

	-------------------------------
	-- spell_browser
	-------------------------------
	ui_overrides.spell_browser = ui_override:new(
		"spell_browser",
		function()
			set_component_active_with_parent(false, core:get_ui_root(), "menu_bar", "button_spell_browser");
		end,
		function()
			set_component_active_with_parent(true, core:get_ui_root(), "menu_bar", "button_spell_browser");
		end
	);

	-------------------------------
	-- advice_settings_button
	-------------------------------
	ui_overrides.advice_settings_button = ui_override:new(
		"advice_settings_button",
		function()
			set_component_active_with_parent(false, core:get_ui_root(), "advice_interface", "button_toggle_options");
		end,
		function()
			set_component_active_with_parent(true, core:get_ui_root(), "advice_interface", "button_toggle_options");
		end
	);

	-------------------------------
	-- selection_change
	-------------------------------
	ui_overrides.selection_change = ui_override:new(
		"selection_change",
		function()
			cm:override_ui("disable_selection_change", true);
		end,
		function()
			cm:override_ui("disable_selection_change", false);
		end
	);

	-------------------------------
	-- camera_settings
	-------------------------------
	ui_overrides.camera_settings = ui_override:new(
		"camera_settings",
		function()
			set_component_active_with_parent(false, core:get_ui_root(), "menu_bar", "button_settings");
		end,
		function()
			set_component_active_with_parent(true, core:get_ui_root(), "menu_bar", "button_settings");
		end
	);

	-------------------------------
	-- army_panel_help_button
	-------------------------------
	ui_overrides.army_panel_help_button = ui_override:new(
		"army_panel_help_button",
		function()
			local disable_func = function()
				-- disable the ? button on the army panel
				local uic_main_units_panel = find_uicomponent(core:get_ui_root(), "main_units_panel");
				if uic_main_units_panel then
					local uic_info_button = find_child_uicomponent(uic_main_units_panel, "button_info");
					if uic_info_button then
						uic_info_button:SetState("inactive");
					end;

					-- also disable the ? button on the recruitment panel
					uic_info_button = find_uicomponent(uic_main_units_panel, "recruitment_options", "button_info");
					if uic_info_button then
						uic_info_button:SetState("inactive");
					end;
				end;
			end;

			disable_func();
			core:add_listener(
				"ui_override_army_panel_help_button",
				"PanelOpenedCampaign",
				function(context) return context.string == "units_panel" end,
				function()
					disable_func()
				end,
				true
			);
		end,
		function()
			core:remove_listener("ui_override_army_panel_help_button");


			-- enable the ? button on the army panel
			local uic_main_units_panel = find_uicomponent(core:get_ui_root(), "main_units_panel");
			if uic_main_units_panel then
				local uic_info_button = find_child_uicomponent(uic_main_units_panel, "button_info");
				if uic_info_button then
					uic_info_button:SetState("active");
				end;

				-- also disable the ? button on the recruitment panel
				uic_info_button = find_uicomponent(uic_main_units_panel, "recruitment_options", "button_info");
				if uic_info_button then
					uic_info_button:SetState("active");
				end;
			end;
		end
	);

	-------------------------------
	-- pre_battle_panel_help_button
	-------------------------------
	ui_overrides.pre_battle_panel_help_button = ui_override:new(
		"pre_battle_panel_help_button",
		function()
			set_component_active_with_parent(false, core:get_ui_root(), "popup_pre_battle", "mid", "regular_deployment", "button_info");
			core:add_listener(
				"ui_override_pre_battle_panel_help_button",
				"PanelOpenedCampaign",
				function(context) return context.string == "popup_pre_battle" end,
				function() set_component_active_with_parent(false, core:get_ui_root(), "popup_pre_battle", "mid", "regular_deployment", "button_info") end,
				true
			);
		end,
		function()
			set_component_active_with_parent(true, core:get_ui_root(), "popup_pre_battle", "mid", "regular_deployment", "button_info");
			core:remove_listener("ui_override_pre_battle_panel_help_button");
		end
	);

	-------------------------------
	-- province_overview_panel_help_button
	-------------------------------
	ui_overrides.province_overview_panel_help_button = ui_override:new(
		"province_overview_panel_help_button",
		function()
			set_component_active_with_parent(false, core:get_ui_root(), "settlement_panel", "button_info");
			core:add_listener(
				"ui_override_province_overview_panel_help_button",
				"PanelOpenedCampaign",
				function(context) return context.string == "settlement_panel" end,
				function() set_component_active_with_parent(false, core:get_ui_root(), "settlement_panel", "button_info") end,
				true
			);
		end,
		function()
			set_component_active_with_parent(true, core:get_ui_root(), "settlement_panel", "button_info");
			core:remove_listener("ui_override_province_overview_panel_help_button");
		end
	);

	-------------------------------
	-- help_page_link_highlighting
	-------------------------------
	ui_overrides.help_page_link_highlighting = ui_override:new(
		"help_page_link_highlighting",
		function()
			self.help_page_link_highlighting_permitted = false;
		end,
		function()
			self.help_page_link_highlighting_permitted = true;
		end
	);

	-------------------------------
	-- garrison_details
	-------------------------------
	ui_overrides.garrison_details = ui_override:new(
		"garrison_details",
		function()
			local ui_root = core:get_ui_root();
			set_component_active_with_parent(false, ui_root, "hud_center", "small_bar", "button_group_settlement", "button_show_garrison");
			cm:override_ui("disable_garrison_details", true);
		end,
		function()
			cm:override_ui("disable_garrison_details", false);
			local ui_root = core:get_ui_root();
			set_component_active_with_parent(true, ui_root, "hud_center", "small_bar", "button_group_settlement", "button_show_garrison");
		end
	);

	-------------------------------
	-- end_turn_options
	-------------------------------
	ui_overrides.end_turn_options = ui_override:new(
		"end_turn_options",
		function()
			local ui_root = core:get_ui_root();
			set_component_active_with_parent(false, ui_root, "faction_buttons_docker", "button_notification_settings");
		end,
		function()
			local ui_root = core:get_ui_root();
			set_component_active_with_parent(true, ui_root, "faction_buttons_docker", "button_notification_settings");
		end
	);

	-------------------------------
	-- esc_menu
	-------------------------------
	ui_overrides.esc_menu = ui_override:new(
		"esc_menu",
		function()
			local ui_root = core:get_ui_root();
			set_component_active_with_parent(false, ui_root, "menu_bar", "button_menu");
			cm:disable_shortcut("root", "escape_menu", true);
		end,
		function()
			local ui_root = core:get_ui_root();
			set_component_active_with_parent(true, ui_root, "menu_bar", "button_menu");
			cm:disable_shortcut("root", "escape_menu", false);
		end
	);

	-------------------------------
	-- help_panel_button
	-------------------------------
	ui_overrides.help_panel_button = ui_override:new(
		"help_panel_button",
		function()
			local ui_root = core:get_ui_root();
			set_component_active_with_parent(false, ui_root, "menu_bar", "button_help_panel");

			-- hide the panel
			get_help_page_manager():show_panel(false);
		end,
		function()
			local ui_root = core:get_ui_root();
			set_component_active_with_parent(true, ui_root, "menu_bar", "button_help_panel");
		end
	);

	-------------------------------
	-- mortuary_cult
	-------------------------------
	ui_overrides.mortuary_cult = ui_override:new(
		"mortuary_cult",
		function()
			set_component_active_with_parent(false, core:get_ui_root(), "faction_buttons_docker", "button_mortuary_cult");
		end,
		function()
			set_component_active_with_parent(true, core:get_ui_root(), "faction_buttons_docker", "button_mortuary_cult");
		end
	);

	-------------------------------
	-- regiments_of_renown
	-------------------------------
	ui_overrides.regiments_of_renown = ui_override:new(
		"regiments_of_renown",
		function()
			cm:override_ui("disable_renown_button", true);
		end,
		function()
			cm:override_ui("disable_renown_button", false);
		end
	);

	-------------------------------
	-- army_panel_visible
	-------------------------------
	ui_overrides.army_panel_visible = ui_override:new(
		"army_panel_visible",
		function()
			if self:is_panel_open("units_panel") then
				set_component_visible_with_parent(false, core:get_ui_root(), "units_panel");
				set_component_visible_with_parent(false, core:get_ui_root(), "hud_center_docker");
			end;

			core:add_listener(
				"army_panel_visible_ui_override",
				"PanelOpenedCampaign",
				function(context) return context.string == "units_panel" end,
				function(context)
					set_component_visible_with_parent(false, core:get_ui_root(), "units_panel");
					set_component_visible_with_parent(false, core:get_ui_root(), "hud_center_docker");
				end,
				true
			);

			core:add_listener(
				"army_panel_visible_ui_override",
				"PanelOpenedCampaign",
				function(context) return context.string == "settlement_panel" end,
				function(context)
					if not self:override("province_overview_panel_visible"):is_locked() then
						set_component_visible_with_parent(true, core:get_ui_root(), "hud_center_docker");
					end;
				end,
				true
			);
		end,
		function()
			local uim = cm:get_campaign_ui_manager()
			if uim:is_panel_open("units_panel") then
				set_component_visible_with_parent(true, core:get_ui_root(), "units_panel");
				set_component_visible_with_parent(true, core:get_ui_root(), "hud_center_docker");
			end;
			core:remove_listener("army_panel_visible_ui_override");
		end
	);

	-------------------------------
	-- province_overview_panel_visible
	-------------------------------
	ui_overrides.province_overview_panel_visible = ui_override:new(
		"province_overview_panel_visible",
		function()
			if self:is_panel_open("settlement_panel") then
				set_component_visible_with_parent(false, core:get_ui_root(), "settlement_panel");
				set_component_visible_with_parent(false, core:get_ui_root(), "hud_center_docker");
			end;

			core:add_listener(
				"province_overview_panel_visible_ui_override",
				"PanelOpenedCampaign",
				function(context) return context.string == "settlement_panel" end,
				function(context)
					set_component_visible_with_parent(false, core:get_ui_root(), "settlement_panel");
					set_component_visible_with_parent(false, core:get_ui_root(), "hud_center_docker");
				end,
				true
			);

			core:add_listener(
				"province_overview_panel_visible_ui_override",
				"PanelOpenedCampaign",
				function(context) return context.string == "units_panel" end,
				function(context)
					if not self:override("army_panel_visible"):is_locked() then
						set_component_visible_with_parent(true, core:get_ui_root(), "hud_center_docker");
					end;
				end,
				true
			);
		end,
		function()
			local uim = cm:get_campaign_ui_manager()
			if uim:is_panel_open("settlement_panel") then
				set_component_visible_with_parent(true, core:get_ui_root(), "settlement_panel");
				set_component_visible_with_parent(true, core:get_ui_root(), "hud_center_docker");
			end;
			core:remove_listener("province_overview_panel_visible_ui_override");
		end
	);

	-------------------------------
	-- hide_diplomacy
	-------------------------------
	ui_overrides.hide_diplomacy = ui_override:new(
		"hide_diplomacy",
		function()
			set_component_visible_with_parent(false, core:get_ui_root(), "faction_buttons_docker", "button_diplomacy");
			cm:override_ui("disable_diplomacy", true);
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "faction_buttons_docker", "button_diplomacy");
			cm:override_ui("disable_diplomacy", false);
		end
	);
	
	-------------------------------
	-- hide_rituals
	-------------------------------
	ui_overrides.hide_rituals = ui_override:new(
		"hide_rituals",
		function()
			set_component_visible_with_parent(false, core:get_ui_root(), "faction_buttons_docker", "button_rituals");
			cm:override_ui("disable_rituals", true);
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "faction_buttons_docker", "button_rituals");
			cm:override_ui("disable_rituals", false);
		end
	);

	-------------------------------
	-- hide_faction_widget
	-------------------------------
	ui_overrides.hide_faction_widget = ui_override:new(
		"hide_faction_widget",
		function()
			set_component_visible_with_parent(false, core:get_ui_root(), "faction_widget");
			cm:override_ui("hide_faction_widget", true);
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "faction_widget");
			cm:override_ui("hide_faction_widget", false);
		end
	);

	-------------------------------
	-- hide_faction_buttons_docker
	-------------------------------
	ui_overrides.hide_faction_buttons_docker = ui_override:new(
		"hide_faction_buttons_docker",
		function()
			set_component_visible_with_parent(false, core:get_ui_root(), "faction_buttons_docker");
			set_component_visible_with_parent(false, core:get_ui_root(), "hud_campaign", "dropdown_parent_2");
			cm:override_ui("hide_faction_buttons_docker", true);

			-- TODO m_dropdown_parent->SetVisible(m_faction_buttons_docker->IsVisible());
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "faction_buttons_docker");
			cm:override_ui("hide_faction_buttons_docker", false);
		end
	);

	-------------------------------
	-- hide_radar
	-------------------------------
	ui_overrides.hide_radar = ui_override:new(
		"hide_radar",
		function()
			set_component_visible_with_parent(false, core:get_ui_root(), "radar_things");
			set_component_visible_with_parent(false, core:get_ui_root(), "lid");
			cm:override_ui("hide_radar", true);
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "radar_things");
			set_component_visible_with_parent(true, core:get_ui_root(), "lid");
			cm:override_ui("hide_radar", false);
		end
	);
			
	-------------------------------
	-- hide_commandments
	-------------------------------
	ui_overrides.hide_commandments = ui_override:new(
		"hide_commandments",
		function()
			set_component_visible_with_parent(false, core:get_ui_root(), "stack_incentives");
			cm:override_ui("hide_commandments_button", true);
			
			-- set up a PanelOpenedCampaign listener and reapply the override once the panel is opened
			core:add_listener(
				"hide_commandments_ui_override",
				"PanelOpenedCampaign",
				function(context) 
					return context.string == "settlement_panel" 
				end,
				function()
					cm:callback(
						function() 
							set_component_visible_with_parent(false, core:get_ui_root(), "stack_incentives");
							cm:override_ui("hide_commandments_button", true);
						end, 
						0.1
					);
				end,
				true
			);
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "stack_incentives", "button_default");
			cm:override_ui("hide_commandments_button", false);
			core:remove_listener("hide_commandments_ui_override")
		end
	);
	
	-------------------------------
	-- hide_character_details
	-------------------------------
	ui_overrides.hide_character_details = ui_override:new(
		"hide_character_details",
		function()
			set_component_visible_with_parent(false, core:get_ui_root(), "info_panel_holder", "button_general");
			cm:override_ui("disable_character_details_panel", true);

			-- set up a PanelOpenedCampaign listener and reapply the override once the panel is opened
			core:add_listener(
				"hide_character_details_ui_override",
				"PanelOpenedCampaign",
				function(context)
					return context.string == "units_panel"
				end,
				function()
					set_component_visible_with_parent(false, core:get_ui_root(), "info_panel_holder", "button_general");
					cm:override_ui("disable_character_details_panel", true);
				end,
				true
			);
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "info_panel_holder", "button_general");
			cm:override_ui("disable_character_details_panel", false);
			core:remove_listener("hide_character_details_ui_override");
		end
	);
	
	-------------------------------
	-- hide_resources_bar
	-------------------------------
	ui_overrides.hide_resources_bar = ui_override:new(
		"hide_resources_bar",
		function()
			set_component_visible_with_parent(false, core:get_ui_root(), "hud_campaign", "faction_widget_holder", "faction_widget", "faction_widget_list", "resources_container_holder");
			cm:override_ui("hide_resources_bar", true);
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "hud_campaign", "faction_widget_holder", "faction_widget", "faction_widget_list", "resources_container_holder");
			cm:override_ui("hide_resources_bar", false);
		end
	);

	-------------------------------
	-- hide_food_bar
	-------------------------------
	ui_overrides.hide_resource_troy_food = ui_override:new(
		"hide_resource_troy_food",
		function()
			set_component_visible_with_parent(false, core:get_ui_root(), "hud_campaign", "faction_widget_holder", "faction_widget", "faction_widget_list", "resources_container_holder", "res_troy_food");
			cm:override_ui("hide_resource_troy_food", true);
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "hud_campaign", "faction_widget_holder", "faction_widget", "faction_widget_list", "resources_container_holder", "res_troy_food");
			cm:override_ui("hide_resource_troy_food", false);
		end
	);

	-------------------------------
	-- hide_wood_bar
	-------------------------------
	ui_overrides.hide_resource_troy_wood = ui_override:new(
		"hide_resource_troy_wood",
		function()
			set_component_visible_with_parent(false, core:get_ui_root(), "hud_campaign", "faction_widget_holder", "faction_widget", "faction_widget_list", "resources_container_holder", "res_troy_wood");
			cm:override_ui("hide_resource_troy_wood", true);
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "hud_campaign", "faction_widget_holder", "faction_widget", "faction_widget_list", "resources_container_holder", "res_troy_wood");
			cm:override_ui("hide_resource_troy_wood", false);
		end
	);

	-------------------------------
	-- hide_stones_bar
	-------------------------------
	ui_overrides.hide_resource_troy_stones = ui_override:new(
		"hide_resource_troy_stones",
		function()
			set_component_visible_with_parent(false, core:get_ui_root(), "hud_campaign", "faction_widget_holder", "faction_widget", "faction_widget_list", "resources_container_holder", "res_troy_stones");
			cm:override_ui("hide_resource_troy_stones", true);
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "hud_campaign", "faction_widget_holder", "faction_widget", "faction_widget_list", "resources_container_holder", "res_troy_stones");
			cm:override_ui("hide_resource_troy_stones", false);
		end
	);

	-------------------------------
	-- hide_bronze_bar
	-------------------------------
	ui_overrides.hide_resource_troy_bronze = ui_override:new(
		"hide_resource_troy_bronze",
		function()
			set_component_visible_with_parent(false, core:get_ui_root(), "hud_campaign", "faction_widget_holder", "faction_widget", "faction_widget_list", "resources_container_holder", "res_troy_bronze");
			cm:override_ui("hide_resource_troy_bronze", true);
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "hud_campaign", "faction_widget_holder", "faction_widget", "faction_widget_list", "resources_container_holder", "res_troy_bronze");
			cm:override_ui("hide_resource_troy_bronze", false);
		end
	);

	-------------------------------
	-- hide_gold_bar
	-------------------------------
	ui_overrides.hide_resource_troy_gold = ui_override:new(
		"hide_resource_troy_gold",
		function()
			set_component_visible_with_parent(false, core:get_ui_root(), "hud_campaign", "faction_widget_holder", "faction_widget", "faction_widget_list", "resources_container_holder", "res_troy_gold");
			cm:override_ui("hide_resource_troy_gold", true);
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "hud_campaign", "faction_widget_holder", "faction_widget", "faction_widget_list", "resources_container_holder", "res_troy_gold");
			cm:override_ui("hide_resource_troy_gold", false);
		end
	);

	-------------------------------
	-- hide_resource_phar_legitimacy
	-------------------------------
	ui_overrides.hide_resource_phar_legitimacy = ui_override:new(
		"hide_resource_phar_legitimacy",
		function()
			set_component_visible_with_parent(false, core:get_ui_root(), "hud_campaign", "faction_widget_holder", "faction_widget", "faction_widget_list", "resources_container_holder", "res_phar_legitimacy");
			cm:override_ui("hide_resource_phar_legitimacy", true);
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "hud_campaign", "faction_widget_holder", "faction_widget", "faction_widget_list", "resources_container_holder", "res_phar_legitimacy");
			cm:override_ui("hide_resource_phar_legitimacy", false);
		end
	);

	-------------------------------
	-- hide_resource_phar_hatti_legitimacy
	-------------------------------
	ui_overrides.hide_resource_phar_hatti_legitimacy = ui_override:new(
		"hide_resource_phar_hatti_legitimacy",
		function()
			set_component_visible_with_parent(false, core:get_ui_root(), "hud_campaign", "faction_widget_holder", "faction_widget", "faction_widget_list", "resources_container_holder", "res_phar_hatti_legitimacy");
			cm:override_ui("hide_resource_phar_hatti_legitimacy", true);
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "hud_campaign", "faction_widget_holder", "faction_widget", "faction_widget_list", "resources_container_holder", "res_phar_hatti_legitimacy");
			cm:override_ui("hide_resource_phar_hatti_legitimacy", false);
		end
	);

	-------------------------------
	-- hide_resource_phar_map_aegean_legitimacy
	-------------------------------
	ui_overrides.hide_resource_phar_map_aegean_legitimacy = ui_override:new(
		"hide_resource_phar_map_aegean_legitimacy",
		function()
			set_component_visible_with_parent(false, core:get_ui_root(), "hud_campaign", "faction_widget_holder", "faction_widget", "faction_widget_list", "resources_container_holder", "res_phar_map_aegean_legitimacy");
			cm:override_ui("hide_resource_phar_map_aegean_legitimacy", true);
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "hud_campaign", "faction_widget_holder", "faction_widget", "faction_widget_list", "resources_container_holder", "res_phar_map_aegean_legitimacy");
			cm:override_ui("hide_resource_phar_map_aegean_legitimacy", false);
		end
	);

	-------------------------------
	-- hide_resource_phar_map_mesopotamian_legitimacy
	-------------------------------
	ui_overrides.hide_resource_phar_map_mesopotamian_legitimacy = ui_override:new(
		"hide_resource_phar_map_mesopotamian_legitimacy",
		function()
			set_component_visible_with_parent(false, core:get_ui_root(), "hud_campaign", "faction_widget_holder", "faction_widget", "faction_widget_list", "resources_container_holder", "res_phar_map_mesopotamian_legitimacy");
			cm:override_ui("hide_resource_phar_map_mesopotamian_legitimacy", true);
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "hud_campaign", "faction_widget_holder", "faction_widget", "faction_widget_list", "resources_container_holder", "res_phar_map_mesopotamian_legitimacy");
			cm:override_ui("hide_resource_phar_map_mesopotamian_legitimacy", false);
		end
	);

	-------------------------------
	-- hide_faction_widget_buttons
	-------------------------------
	ui_overrides.hide_faction_widget_buttons = ui_override:new(
		"hide_faction_widget_buttons",
		function()
			set_component_visible_with_parent(false, core:get_ui_root(), "faction_widget", "main_buttons");
			cm:override_ui("hide_faction_widget_buttons", true);
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "faction_widget", "main_buttons");
			cm:override_ui("hide_faction_widget_buttons", false);
		end
	);
	-------------------------------
	-- hide_stances
	-------------------------------
	ui_overrides.hide_stances = ui_override:new(
		"hide_stances",
		function()
			set_component_visible_with_parent(false, core:get_ui_root(), "land_stance_button_stack");
			cm:override_ui("hide_stances_button", true);
			
			-- set up a PanelOpenedCampaign listener and reapply the override once the panel is opened
			core:add_listener(
				"hide_stances_ui_override",
				"PanelOpenedCampaign",
				function(context) 
					return context.string == "units_panel" 
				end,
				function()
					cm:callback(
						function() 
							set_component_visible_with_parent(false, core:get_ui_root(), "land_stance_button_stack");
							cm:override_ui("hide_stances_button", true);
						end,
						0.1
					);
				end,
				true
			);
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "land_stance_button_stack");
			cm:override_ui("hide_stances_button", false);
			core:remove_listener("hide_stances_ui_override");
		end
	);

	-------------------------------
	-- hide_occupy_conquest
	-------------------------------
	ui_overrides.hide_occupy_conquest = ui_override:new(
		"hide_occupy_conquest",
		function()
			core:add_listener(
				"hide_occupy_conquest_ui_override",
				"PanelOpenedCampaign",
				function(context)
					return context.string == "settlement_captured"
				end,
				function()
					set_component_visible_with_parent(false, core:get_ui_root(), "settlement_captured", "dy_conquest");
					cm:override_ui("disable_postbattle_occupy_button", true);
				end,
				true
			);
			set_component_visible_with_parent(false, core:get_ui_root(), "settlement_captured", "dy_conquest");
			cm:override_ui("disable_postbattle_occupy_button", true);
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "settlement_captured", "dy_conquest");
			cm:override_ui("disable_postbattle_occupy_button", false);
			core:remove_listener("hide_occupy_conquest_ui_override")
		end
	);

	-------------------------------
	-- hide_units_panel_small_bar
	-------------------------------
--	ui_overrides.hide_units_panel_small_bar = ui_override:new(
--		"hide_units_panel_small_bar",
--		function()
--			core:add_listener(
--				"hide_units_panel_small_bar_ui_override",
--				"PanelOpenedCampaign",
--				function(context)
--					return context.string == "units_panel"
--				end,
--				function()
--					set_component_visible_with_parent(false, core:get_ui_root(), "hud_center_docker", "small_bar");
--					cm:override_ui("hide_units_panel_small_bar", true);
--				end,
--				true
--			);
--			set_component_visible_with_parent(false, core:get_ui_root(), "hud_center_docker", "small_bar");
--			cm:override_ui("hide_units_panel_small_bar", true);
--		end,
--		function()
--			set_component_visible_with_parent(true, core:get_ui_root(), "hud_center_docker", "small_bar");
--			cm:override_ui("hide_units_panel_small_bar", false);
--			core:remove_listener("hide_units_panel_small_bar_ui_override")
--		end
--	);

	-------------------------------
	-- hide_province_panel_public_order
	-------------------------------
	ui_overrides.hide_province_panel_public_order = ui_override:new(
		"hide_province_panel_public_order",
		function()
			core:add_listener(
				"hide_province_panel_public_order_ui_override",
				"PanelOpenedCampaign",
				function(context)
					return context.string == "settlement_panel"
				end,
				function()
					set_component_visible_with_parent(false, core:get_ui_root(), "info_panel_holder", "public_order_holder");
					cm:override_ui("disable_public_order_display", true);
				end,
				true
			);
			set_component_visible_with_parent(false, core:get_ui_root(), "info_panel_holder", "public_order_holder");
			cm:override_ui("disable_public_order_display", true);
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "info_panel_holder", "public_order_holder");
			cm:override_ui("disable_public_order_display", false);
			core:remove_listener("hide_province_panel_public_order_ui_override")
		end
	);

	-------------------------------
	-- hide_settlement_panel_recruit_hero
	-------------------------------
	ui_overrides.hide_settlement_panel_recruit_hero = ui_override:new(
		"hide_settlement_panel_recruit_hero",
		function()
			core:add_listener(
				"hide_settlement_panel_recruit_hero_ui_override",
				"PanelOpenedCampaign",
				function(context)
					return context.string == "settlement_panel"
				end,
				function()
					set_component_visible_with_parent(false, core:get_ui_root(), "hud_center_docker", "button_agents");
					cm:override_ui("disable_enlist_agent", true);
				end,
				true
			);
			set_component_visible_with_parent(false, core:get_ui_root(), "hud_center_docker", "button_agents");
			cm:override_ui("disable_enlist_agent", true);
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "hud_center_docker", "button_agents");
			cm:override_ui("disable_enlist_agent", false);
			core:remove_listener("hide_settlement_panel_recruit_hero_ui_override")
		end
	);

	-------------------------------
	-- hide_settlement_panel_recruit_lord
	-------------------------------
	ui_overrides.hide_settlement_panel_recruit_lord = ui_override:new(
		"hide_settlement_panel_recruit_lord",
		function()
			cm:override_ui("hide_recruit_lord_button", true);
			cm:override_ui("disable_replace_general", true);
		end,
		function()
			cm:override_ui("hide_recruit_lord_button", false);
			cm:override_ui("disable_replace_general", false);
		end
	);

	-------------------------------
	-- hide_settlement_panel_building_browser
	-------------------------------
	ui_overrides.hide_settlement_panel_building_browser = ui_override:new(
		"hide_settlement_panel_building_browser",
		function()
			core:add_listener(
				"hide_settlement_panel_building_browser_ui_override",
				"PanelOpenedCampaign",
				function(context)
					return context.string == "settlement_panel"
				end,
				function()
					set_component_visible_with_parent(false, core:get_ui_root(), "hud_center_docker", "button_building_browser");
					cm:override_ui("disable_building_browser", true);
				end,
				true
			);
			set_component_visible_with_parent(false, core:get_ui_root(), "hud_center_docker", "button_building_browser");
			cm:override_ui("disable_building_browser", true);
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "hud_center_docker", "button_building_browser");
			cm:override_ui("disable_building_browser", false);
			core:remove_listener("hide_settlement_panel_building_browser_ui_override")
		end
	);

	-------------------------------
	-- hide_settlement_bar_public_order
	-------------------------------
	ui_overrides.hide_settlement_bar_public_order = ui_override:new(
		"hide_settlement_bar_public_order",
		function()
			set_component_visible_with_parent(false, core:get_ui_root(), "3d_ui_parent", "info_bar");
			cm:override_ui("disable_public_order_display", true);
			cm:override_ui("hide_info_bar", true);

			--[[local uic_settlements = find_uicomponent(uic_browser, "main_settlement_panel");
		if uic_settlements then
			for i = 0, uic_settlements:ChildCount() - 1 do
				local uic_button = find_uicomponent(UIComponent(uic_settlements:Find(i)), "button_zoom");
				if uic_button then
					pulse_uicomponent(uic_button, value, pulse_strength);
				end;
			end;
		end;]]


		--[[core:add_listener(
		"hide_info_bar_prologue",
		"PanelOpenedCampaign",
		function(context)
			return context.string == "settlement_panel"
		end,
		function()
			set_component_visible_with_parent(false, core:get_ui_root(), "3d_ui_parent", "info_bar");
			cm:override_ui("hide_info_bar", true);

			out("DOING IT")
			set_component_visible_with_parent(false, core:get_ui_root(), "3d_ui_parent", "info_bar", "dy_public_order");
			set_component_visible_with_parent(false, core:get_ui_root(), "info_bar", "dy_public_order");

			local uic_settlement_label = find_uicomponent(core:get_ui_root(), "3d_ui_parent");
			print_all_uicomponent_children(uic_settlement_label)
			if uic_settlement_label then
				for i = 0, uic_settlement_label:ChildCount() - 1 do
					out("Found child: "..i)
					local uic_settlement_label_child = find_uicomponent(UIComponent(uic_settlement_label:Find(i)));
					--out(tostring(uic_settlement_label_child))
					if uic_settlement_label_child then
						out("FOUND CHILDREN")
						set_component_visible_with_parent(false, core:get_ui_root(), uic_settlement_label, uic_settlement_label_child);
						set_component_visible_with_parent(false, core:get_ui_root(), "3d_ui_parent", "label_settlement:wh3_test_talabecland", "dy_public_order");
					end;
				end
			end
		end,
		true
	); ]]



			--[[repeat

			if uic_settlement_label then
				for i = 0, uic_settlement_label:ChildCount() - 1 do
					local uic_settlement_label_child = find_uicomponent(UIComponent(uic_settlement_label:Find(i)), "dy_public_order");

					if uic_button then
						set_component_visible_with_parent(false, core:get_ui_root(), uic_settlement_label, uic_settlement_label_child);
					end;
				end
			end


				--set_component_visible_with_parent(false, core:get_ui_root(), "3d_ui_parent", "info_bar", "dy_public_order");
			until (barracks_mission == true)]]

		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "info_bar", "dy_public_order");
			cm:override_ui("disable_public_order_display", false);
		end
	);

	-------------------------------
	-- hide_settlement_bar_garrison
	-------------------------------
	ui_overrides.hide_settlement_bar_garrison = ui_override:new(
		"hide_settlement_bar_garrison",
		function()
			set_component_visible_with_parent(false, core:get_ui_root(), "info_bar", "dy_garrison");
			cm:override_ui("disable_garrison_details", true);
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "info_bar", "dy_garrison");
			cm:override_ui("disable_garrison_details", false);
		end
	);

	-------------------------------
	-- hide_pre_battle_save
	-------------------------------
	ui_overrides.hide_pre_battle_save = ui_override:new(
		"hide_pre_battle_save",
		function()
			core:add_listener(
				"hide_pre_battle_save_ui_override",
				"PanelOpenedCampaign",
				function(context)
					return context.string == "popup_pre_battle"
				end,
				function()
					set_component_visible_with_parent(false, core:get_ui_root(), "popup_pre_battle", "button_save");
					cm:override_ui("disable_prebattle_save", true);
				end,
				true
			);
			set_component_visible_with_parent(false, core:get_ui_root(), "popup_pre_battle", "button_save");
			cm:override_ui("disable_prebattle_save", true);
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "popup_pre_battle", "button_save");
			cm:override_ui("disable_prebattle_save", false);
			core:remove_listener("hide_pre_battle_save_ui_override")
		end
	);

	-------------------------------
	-- hide_pre_battle_autoresolve
	-------------------------------
	ui_overrides.hide_pre_battle_autoresolve = ui_override:new(
		"hide_pre_battle_autoresolve",
		function()
			core:add_listener(
				"hide_pre_battle_autoresolve_ui_override",
				"PanelOpenedCampaign",
				function(context)
					return context.string == "popup_pre_battle"
				end,
				function()
					set_component_visible_with_parent(false, core:get_ui_root(), "popup_pre_battle", "button_set_attack", "button_autoresolve");
					cm:override_ui("disable_prebattle_autoresolve", true);
				end,
				true
			);
			set_component_visible_with_parent(false, core:get_ui_root(), "popup_pre_battle", "button_set_attack", "button_autoresolve");
			cm:override_ui("disable_prebattle_autoresolve", true);
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "popup_pre_battle", "button_set_attack", "button_autoresolve");
			cm:override_ui("disable_prebattle_autoresolve", false);
			core:remove_listener("hide_pre_battle_autoresolve_ui_override")
		end
	);

	-------------------------------
	-- hide_abandon_settlement
	-------------------------------
	ui_overrides.hide_abandon_settlement = ui_override:new(
		"hide_abandon_settlement",
		function()
			set_component_visible_with_parent(false, core:get_ui_root(), "hud_campaign", "button_group_settlement", "button_abandon");
			cm:override_ui("hide_abandon_settlement", true);
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "hud_campaign", "button_group_settlement", "button_abandon");
			cm:override_ui("hide_abandon_settlement", false);
		end
	);

	-------------------------------
	-- hide_pre_battle_retreat
	-------------------------------
	ui_overrides.hide_pre_battle_retreat = ui_override:new(
		"hide_pre_battle_retreat",
		function()
			core:add_listener(
				"hide_pre_battle_retreat_ui_override",
				"PanelOpenedCampaign",
				function(context)
					return context.string == "popup_pre_battle"
				end,
				function()
					set_component_visible_with_parent(false, core:get_ui_root(), "popup_pre_battle", "button_set_attack", "button_retreat");
					cm:override_ui("disable_prebattle_retreat", true);
				end,
				true
			);
			set_component_visible_with_parent(false, core:get_ui_root(), "popup_pre_battle", "button_set_attack", "button_retreat");
			cm:override_ui("disable_prebattle_retreat", true);
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "popup_pre_battle", "button_set_attack", "button_retreat");
			cm:override_ui("disable_prebattle_retreat", false);
			core:remove_listener("hide_pre_battle_retreat_ui_override")
		end
	);

	-------------------------------
	-- hide_character_details_panel_replace_lord
	-------------------------------
	ui_overrides.hide_character_details_panel_replace_lord = ui_override:new(
		"hide_character_details_panel_replace_lord",
		function()
			core:add_listener(
				"hide_character_details_replace_lord_ui_override",
				"PanelOpenedCampaign",
				function(context)
					return context.string == "character_details_panel"
				end,
				function()
					set_component_visible_with_parent(false, core:get_ui_root(), "character_details_panel", "button_replace_general");
					cm:override_ui("disable_replace_general", true);
				end,
				true
			);
			set_component_visible_with_parent(false, core:get_ui_root(), "character_details_panel", "button_replace_general");
			cm:override_ui("disable_replace_general", true);
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "character_details_panel", "button_replace_general");
			cm:override_ui("disable_replace_general", false);
			core:remove_listener("hide_character_details_replace_lord_ui_override")
		end
	);

	-------------------------------
	-- hide_divine_will_button
	-------------------------------
	ui_overrides.hide_divine_will_button = ui_override:new(
		"hide_divine_will_button",
		function()
			set_component_visible_with_parent(false, core:get_ui_root(), "faction_widget", "main_buttons", "gods_and_favour_container");
			cm:disable_event_feed_events(true, "", "troy_event_subcategory_god_action")
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "faction_widget", "main_buttons", "gods_and_favour_container");
			cm:disable_event_feed_events(false, "", "troy_event_subcategory_god_action")
		end
	);

	-------------------------------
	-- hide_fm_offices_container
	-------------------------------
	ui_overrides.hide_fm_offices_container = ui_override:new(
		"hide_fm_offices_container",
		function()
			cm:override_ui("hide_fm_offices_container", true);

			local this = ui_overrides.hide_fm_offices_container
			local king_of_men_button = core:get_ui_root():SequentialFind("faction_widget", "main_buttons", "fm_offices_container")
			if king_of_men_button then
				-- This is necesary because we need to show this button only for the specific faction. cm:get_local_faction_name() is not working the first time this is called, so we need something like this.
				this.was_visible_in_the_first_place = this.was_visible_in_the_first_place or king_of_men_button:Visible()
				king_of_men_button:SetVisible(false)
			end
		end,
		function()
			cm:override_ui("hide_fm_offices_container", false);

			local this = ui_overrides.hide_fm_offices_container
			if this.was_visible_in_the_first_place then
				set_component_visible_with_parent(true, core:get_ui_root(), "faction_widget", "main_buttons", "fm_offices_container");
				core:remove_listener("hide_fm_offices_container_override")
			end
		end
	);

	-------------------------------
	-- hide_fm_demand_tribute_container
	-------------------------------
	ui_overrides.hide_fm_demand_tribute_container = ui_override:new(
		"hide_fm_demand_tribute_container",
		function()
			local this = ui_overrides.hide_fm_demand_tribute_container
			local lions_share_button = core:get_ui_root():SequentialFind("faction_widget", "main_buttons", "fm_demand_tribute_container")
			if lions_share_button then
				-- This is necesary because we need to show this button only for the specific faction. cm:get_local_faction_name() is not working the first time this is called, so we need something like this.
				this.was_visible_in_the_first_place = this.was_visible_in_the_first_place or lions_share_button:Visible()
				lions_share_button:SetVisible(false)
			end
		end,
		function()
			local this = ui_overrides.hide_fm_demand_tribute_container
			if this.was_visible_in_the_first_place then
				set_component_visible_with_parent(true, core:get_ui_root(), "faction_widget", "main_buttons", "fm_demand_tribute_container");
			end
		end
	);

	-------------------------------
	-- hide_gods_and_favour_container
	-------------------------------
	ui_overrides.hide_gods_and_favour_container = ui_override:new(
		"hide_gods_and_favour_container",
		function()
			cm:override_ui("disable_gods_and_favor", true)
			cm:disable_shortcut("button_gods_and_favour", "show_divine_will", true)

			local this = ui_overrides.hide_gods_and_favour_container
			local gods_and_favour_container = core:get_ui_root():SequentialFind("faction_widget", "main_buttons", "gods_and_favour_container")
			if gods_and_favour_container then
				-- This is necesary because we need to show this button only for the specific faction. cm:get_local_faction_name() is not working the first time this is called, so we need something like this.
				this.was_visible_in_the_first_place = this.was_visible_in_the_first_place or gods_and_favour_container:Visible()
				gods_and_favour_container:SetVisible(false)
			end
		end,
		function()
			cm:override_ui("disable_gods_and_favor", false)
			cm:disable_shortcut("button_gods_and_favour", "show_divine_will", false)
			
			local this = ui_overrides.hide_gods_and_favour_container
			if this.was_visible_in_the_first_place then
				set_component_visible_with_parent(true, core:get_ui_root(), "faction_widget", "main_buttons", "gods_and_favour_container")
			end
		end
	);
	
	-------------------------------
	-- hide_local_deities
	-------------------------------
	ui_overrides.hide_local_deities = ui_override:new(
		"hide_local_deities",
		function()
			cm:override_ui("disable_local_deities", true);
			set_component_visible_with_parent(false, core:get_ui_root(), "faction_widget", "main_buttons", "local_deities_container");
		end,
		function()
			cm:override_ui("disable_local_deities", false);
			set_component_active_with_parent(true, core:get_ui_root(), "faction_widget", "main_buttons", "local_deities_container", "button_local_deities");
			set_component_visible_with_parent(true, core:get_ui_root(), "faction_widget", "main_buttons", "local_deities_container");
		end
	);

	-------------------------------
	-- disable_local_deities
	-------------------------------
	ui_overrides.disable_local_deities = ui_override:new(
		"disable_local_deities",
		function()
			cm:override_ui("disable_local_deities", true);
		end,
		function()
			cm:override_ui("disable_local_deities", false);
			set_component_active_with_parent(true, core:get_ui_root(), "faction_widget", "main_buttons", "local_deities_container", "button_local_deities");
		end
	);

	-------------------------------
	-- hide_demolish_button
	-------------------------------
	ui_overrides.hide_demolish_button = ui_override:new(
		"hide_demolish_button",
		function()
			core:add_listener(
				"hide_demolish_button_ui_override",
				"PanelOpenedCampaign",
				function(context)
					return context.string == "construction_popup"
				end,
				function()
					cm:callback(
						function()
							set_component_visible_with_parent(false, core:get_ui_root(), "construction_popup", "options_buttons");
							cm:override_ui("disable_dismantle_building", true);
						end,
						0.1
					);
				end,
				true
			);
			set_component_visible_with_parent(false, core:get_ui_root(), "construction_popup", "options_buttons");
			cm:override_ui("disable_dismantle_building", true);
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "construction_popup", "options_buttons");
			cm:override_ui("disable_dismantle_building", false);
			core:remove_listener("hide_demolish_button_ui_override")
		end
	);

	-------------------------------
	-- hide_building_browser_public_order
	-------------------------------
	ui_overrides.hide_building_browser_public_order = ui_override:new(
		"hide_building_browser_public_order",
		function()
			core:add_listener(
				"hide_building_browser_public_order_ui_override",
				"PanelOpenedCampaign",
				function(context)
					return context.string == "building_browser"
				end,
				function()
					set_component_visible_with_parent(false, core:get_ui_root(), "building_browser", "public_order");
					cm:override_ui("disable_public_order_display", true);
				end,
				true
			);
			set_component_visible_with_parent(false, core:get_ui_root(), "building_browser", "public_order");
			cm:override_ui("disable_public_order_display", true);
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "building_browser", "public_order");
			cm:override_ui("disable_public_order_display", false);
			core:remove_listener("hide_building_browser_public_order_ui_override")
		end
	);

	-------------------------------
	-- disable_skip_button
	-------------------------------
	ui_overrides.disable_skip_button = ui_override:new(
		"disable_skip_button",
		function()
			cm:override_ui("disable_skip_button", true)
		end,
		function()
			cm:override_ui("disable_skip_button", false)
		end
	);

	-------------------------------
	-- settlement_labels
	-------------------------------
	ui_overrides.settlement_labels = ui_override:new(
		"settlement_labels",
		function()
			cm:override_ui("disable_settlement_labels", true)
		end,
		function()
			cm:override_ui("disable_settlement_labels", false)
		end
	);

	-------------------------------
	-- settlement_selection
	-------------------------------
	ui_overrides.settlement_selection = ui_override:new(
		"settlement_selection",
		function()
			cm:override_ui("disable_settlement_selection", true)
		end,
		function()
			cm:override_ui("disable_settlement_selection", false)
		end
	);

	-------------------------------
	-- hide_province_info_panel
	-------------------------------
	ui_overrides.hide_province_info_panel = ui_override:new(
		"hide_province_info_panel",
		function()
			cm:override_ui("hide_province_info_panel", true)
		end,
		function()
			cm:override_ui("hide_province_info_panel", false)
		end
	);

	-------------------------------
	-- hide_campaign_customization_button
	-------------------------------
	ui_overrides.hide_campaign_customization_button = ui_override:new(
		"hide_campaign_customization_button",
		function()
			cm:override_ui("hide_campaign_customization_button", true)
		end,
		function()
			cm:override_ui("hide_campaign_customization_button", false)
		end
	);

	-------------------------------
	-- hide_campaign_space_bar_options
	-------------------------------
	ui_overrides.hide_campaign_space_bar_options = ui_override:new(
		"hide_campaign_space_bar_options",
		function()
			cm:override_ui("hide_campaign_space_bar_options", true)
		end,
		function()
			cm:override_ui("hide_campaign_space_bar_options", false)
		end
	);

	-------------------------------
	-- hide_court
	-------------------------------

	ui_overrides.hide_court = ui_override:new(
		"hide_court",
		function()
			set_component_visible_with_parent(false, core:get_ui_root(), "faction_widget", "main_buttons", "phar_court_container");
			cm:override_ui("disable_court", true);
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "faction_widget", "main_buttons", "phar_court_container");
			cm:override_ui("disable_court", false);
		end
	)

	-------------------------------
	-- hide_ruling_family_dynasty
	-------------------------------

	ui_overrides.hide_ruling_family_dynasty = ui_override:new(
		"hide_ruling_family_dynasty",
		function()
			set_component_visible_with_parent(false, core:get_ui_root(), "faction_widget", "main_buttons", "fm_comb_ruling_family_container");
			-- cm:override_ui("disable_hide_ruling_family_dynasty", true); -- Not needed and not implemented for the moment
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "faction_widget", "main_buttons", "fm_comb_ruling_family_container");
			-- cm:override_ui("disable_hide_ruling_family_dynasty", false); -- Not needed and not implemented for the moment
		end
	)

	-------------------------------
	-- hide_ancient_legacies
	-------------------------------

	ui_overrides.hide_ancient_legacies = ui_override:new(
		"hide_ancient_legacies",
		function()
			set_component_visible_with_parent(false, core:get_ui_root(), "faction_widget", "main_buttons", "fm_phar_ancient_legacies_container");
			cm:override_ui("disable_legacies", true);
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "faction_widget", "main_buttons", "fm_phar_ancient_legacies_container");
			cm:override_ui("disable_legacies", false);
		end
	)
	
	-------------------------------
	-- hide_power_of_the_crown
	-------------------------------

	ui_overrides.hide_power_of_the_crown = ui_override:new(
		"hide_power_of_the_crown",
		function()
			set_component_visible_with_parent(false, core:get_ui_root(), "faction_widget", "main_buttons", "fm_phar_pharaoh_crown_container");
			cm:override_ui("disable_crown", true);
		end,
		function()
			set_component_visible_with_parent(true, core:get_ui_root(), "faction_widget", "main_buttons", "fm_phar_pharaoh_crown_container");
			cm:override_ui("disable_crown", false);
		end
	)

	-- load in the contents of the ui_overrides table that we've just declared
	for override_name, override in pairs(ui_overrides) do
		self:register_override(override_name, override);
	end;
end;


function campaign_ui_manager:register_override(override_name, override)
	if not is_string(override_name) then
		script_error("ERROR: register_override() called but supplied override name [" .. tostring(override_name) .. "] is not a string");
		return false;
	end;

	if not is_uioverride(override) then
		script_error("ERROR: register_override() called but supplied override [" .. tostring(override) .. "] is not a ui override");
		return false;
	end;

	-- check that we don't already have this override
	if self.override_list[override_name] then
		script_error("WARNING: register_override() called but supplied override [" .. tostring(override_name) .. "] is already registered");
		return false;
	end;

	self.override_list[override_name] = override;
end;


function campaign_ui_manager:override(override_name, silent)
	local retval = self.override_list[override_name];

	if not retval and not silent then
		script_error("ERROR: override() called but supplied override name [" .. tostring(override_name) .. "] could not be found");
	end;

	return retval;
end;


function campaign_ui_manager:print_override_list()
	local override_list = self.override_list;

	out.ui("***********************");
	out.ui("Printing override list:");
	out.ui("***********************");

	local count = 0;

	for override_name, override in pairs(override_list) do
		count = count + 1;
		out.ui("\t" .. override_name);
	end;

	out.ui("***********************");
	if count == 1 then
		out.ui("Printed 1 override");
	else
		out.ui("Printed " .. count .. " overrides");
	end;
	out.ui("***********************");
end;

