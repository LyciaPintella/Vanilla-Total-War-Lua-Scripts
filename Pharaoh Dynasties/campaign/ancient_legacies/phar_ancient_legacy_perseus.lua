out("Loading phar_ancient_legacy_perseus.lua")

-- TODO: probably will need to move these to separate files
--require("phar_ancient_legacy_perseus_config")
--require("phar_ancient_legacy_perseus_ui")

perseus_config = {
	unity = {
		unity_resource_key = "phar_map_perseus_unity",

		-- These are the factor keys used for transactions with the unity resource pool.
		unity_resource_factor_vassals = "phar_map_perseus_unity_vassals",
		unity_resource_factor_defensive_allies = "phar_map_perseus_unity_defensive_allies",
		unity_resource_factor_military_allies = "phar_map_perseus_unity_military_allies",
		unity_resource_factor_game_events = "phar_map_perseus_unity_games",
		
		-- These are the factor/resource junction unique_ids used to check the current values of the factors.
		unity_resource_factor_junction_vassals = "phar_map_unity_vassals",
		unity_resource_factor_junction_defensive_allies = "phar_map_unity_defensive_allies",
		unity_resource_factor_junction_military_allies = "phar_map_unity_military_allies",
		unity_resource_factor_junction_game_events = "phar_map_unity_games",

		unity_effect_bundle_prefix = "phar_map_al_perseus_unity_",

		unity_per_vassal_owned_region = 1,
		unity_per_defensive_ally_owned_region = 2,
		unity_per_military_ally_owned_region = 3,

		unity_for_ongoing_games = 10,

		-- The unity tier effect bundles are defined in the database. Their names are used in the UI as the name of the tier.
		-- The happiness bonus is expected to be defined as a separate effect bundle set in the database, see the host_games section further below for its prefix.
		tiers = {
			-- Sample entry
			-- {
			-- 	unity_threshold = 25,         -- The inclusive upper limit of the tier
			-- 	available_cultures = {        -- The list of cultures that can be invited to the games when the faction hosting the games reaches the respective Unity tier
			-- 		"troy_main_clt_danaans",
			-- 		"troy_main_clt_trojans",
			-- 	},
			-- 	games_gift = {                -- The amount of each resource that the host faction receives from the participants when the games are hosted at the respective tier
			-- 		troy_food = 1000,         -- The type of the resource from each faction is selected automatically.
			-- 		troy_wood = 400,          -- The resources are just spawned, they are not taken from the participants.
			-- 		troy_stones = 150,
			-- 		troy_bronze = 150,
			-- 		troy_gold = 100,
			-- 	},
			-- 	diplomatic_relations_bonus_size = 5, -- The size (not direct value!) of the bonus to diplomatic relations with the participants
			--                                       -- when the games are hosted at the respective tier. Correct values are 1..6. See the note below.
			-- },

			-- NOTE: The diplomatic system does not support direct values for relation bonuses and penalties. It supports a set of predefined diplomatic events,
			-- from DILEMMA_BONUS_SMALL to DILEMMA_BONUS_XXXLARGE (see the cai_personality_diplomatic_events table). The actual values of these events are set
			-- in the cai_variables table, with keys from CAI_VARIABLE_DILEMMA_BONUS_SMALL to CAI_VARIABLE_DILEMMA_BONUS_XXXLARGE. There are also negative events
			-- (_PENALTY_ instead of _BONUS_), so payloads and the apply_dilemma_payloads function can use values from -6 to 6 to refer to the predefined events.

			-- The Aegean Bloc
			{
				unity_threshold = 25,
				available_cultures = {
					"troy_main_clt_danaans",
					"troy_main_clt_trojans",
				 },
				 games_gift = {
					troy_food =		1500,
					troy_wood =		600,
					troy_stones =	250,
					troy_bronze =	250,
					troy_gold =		150,
				},
				diplomatic_relations_bonus_size = 1, -- small
			},
			-- The Aegean Coalition
			{
				unity_threshold = 50,
				available_cultures = {
					 "troy_main_clt_danaans",
					 "troy_main_clt_trojans",
					 "troy_rem_clt_thraco_phrygians",
				},
				games_gift = {
					troy_food =		2500,
					troy_wood =		1000,
					troy_stones =	350,
					troy_bronze =	350,
					troy_gold =		250,
				},
				diplomatic_relations_bonus_size = 2, -- medium
			},
			-- The Aegean Alliance
			{
				unity_threshold = 75,
				available_cultures = {
					"troy_main_clt_danaans",
					"troy_main_clt_trojans",
					"troy_rem_clt_thraco_phrygians",
					"phar_main_clt_hatti",
				},
				games_gift = {
					troy_food =		4000,
					troy_wood =		1500,
					troy_stones =	500,
					troy_bronze =	500,
					troy_gold =		400,
				},
				diplomatic_relations_bonus_size = 3, -- large
			},
			-- The Aegean League
			{
				unity_threshold = 100,
				available_cultures = {
					"troy_main_clt_danaans",
					"troy_main_clt_trojans",
					"troy_rem_clt_thraco_phrygians",
					"phar_main_clt_hatti",
					"phar_main_clt_canaan",
					"phar_map_clt_mesopotamian",
				},
				games_gift = {
					troy_food =		5500,
					troy_wood =		2200,
					troy_stones =	700,
					troy_bronze =	700,
					troy_gold =		600,
				},
				diplomatic_relations_bonus_size = 4, -- xlarge
			},
			-- The Aegean Union
			{
				unity_threshold = 9999,
				available_cultures = {
					"troy_main_clt_danaans",
					"troy_main_clt_trojans",
					"troy_rem_clt_thraco_phrygians",
					"phar_main_clt_hatti",
					"phar_main_clt_canaan",
					"phar_map_clt_mesopotamian",
					"phar_main_clt_kemet",
					"phar_main_clt_sea_peoples",
				},
				games_gift = {
					troy_food =		8000,
					troy_wood =		3000,
					troy_stones =	1000,
					troy_bronze =	1000,
					troy_gold =		900,
				},
				diplomatic_relations_bonus_size = 5, -- xxlarge
			},
		},

		messages = {
			unity_new_tier = {
				title = "event_feed_strings_text_troy_adi_fm_ajax_unity_message_title",
				primary_detail = "event_feed_strings_text_troy_adi_fm_ajax_unity_message_tier_reached_primary_details",
				secondary_detail = "event_feed_strings_text_troy_adi_fm_ajax_unity_message_tier_reached_secondary_details",
				index = 1101,
			},
	
			unity_max_tier = {
				title = "event_feed_strings_text_troy_adi_fm_ajax_unity_message_title",
				primary_detail = "event_feed_strings_text_troy_adi_fm_ajax_unity_message_max_tier_primary_details",
				secondary_detail = "event_feed_strings_text_troy_adi_fm_ajax_unity_message_max_tier_secondary_details",
				index = 1102,
			},		
		}
	},

	host_games = {
		-- The initial prizes that spawn when the ancient legacy is claimed to allow immediately hosting the games if no other ancillaries are available
		games_initial_prizes = {
			"phar_main_common_general_13", 
			"phar_main_common_general_27",
			"phar_main_rare_32",
		},

		-- The maximum number of factions that can be selected for the games
		games_max_factions = 3,
		games_duration = 4,     -- This is the duration of the forced peace after the games and the happiness bonus
		games_cooldown = 12,	-- This is the cooldown period after the games until new games can be hosted

		games_effect_bundle_prefix = "phar_map_al_perseus_games_", -- TODO: setup the actual happiness bundles, currently only placeholder bundles in the DB
		games_pooled_resource_factor = "troy_resource_factor_faction", -- TODO: setup a new factor for this

		games_incident = "phar_map_al_perseus_games_incident", -- TODO: setup a new incident for this
	},
}

-- NOTE: The UI components related to global recruitment are handled in C++. The Lua code handles the Unity resource and hosting Games.
perseus_ui = {
	config = {
		panel_name = "map_legacy_perseus",
		legacy_panel_button_id = "button_fm_phar_perseus",

		component_ids = {
			unity_tiers_holder = "unity_tiers_holder",
			unity_info = "unity_info",

			host_games_subpanel = "host_games_subpanel",

			games_button = "button_host",
			games_holder = "host_games_holder",

			ancillary_selector = "ancillary_selector",
			ancillaries_list = "ancillaries",
			ancillary_template = "ancillary_slot_",
			ancillary_select_button = "ancillary_select_button",

			outcome_peace_factions_list = "outcome_factions_list",
			outcome_peace_faction_template = "outcome_faction_template",
			outcome_peace_header = "outcome_peace_header",
			outcome_resources_list = "outcome_resources_list",
			outcome_resource_template = "outcome_resource_template",
			outcome_resource_separator_template = "outcome_resource_separator_template",
			outcome_effects_bundle_template = "outcome_effects_bundle_template",
		},

		unity_tier_tooltip_layout_path = "ui/campaign ui/tooltip_map_al_perseus_unity_tiers",

		games_confirmation_dlg_id = "troy_adi_ajax_renowncelebration_confirmation_dlg_id", 
		games_confirmation_dlg_description = "campaign_localised_strings_string_phar_map_al_perseus_host_games_confirmation_description",

		games_button_tooltip_description = "campaign_localised_strings_string_phar_map_al_perseus_host_games_description",
		games_button_tooltip_not_match_description = "campaign_localised_strings_string_phar_map_al_perseus_host_games_not_match_description",
		games_button_tooltip_games_ongoing = "campaign_localised_strings_string_phar_map_al_perseus_host_games_ongoing_description",
		games_button_tooltip_cooldown_description = "campaign_localised_strings_string_phar_map_al_perseus_host_games_cooldown_description",
		games_button_tooltip_select_at_least_one_description = "campaign_localised_strings_string_phar_map_al_perseus_host_games_select_at_least_one_description",

		games_ancillary_button_tooltip_nothing_to_select = "campaign_localised_strings_string_troy_adi_ajax_renown_celebration_ancillary_nothing_to_select_description",
		games_ancillary_button_tooltip_no_faction = "ui_tooltip_components_localised_text_tooltip_ancillary_perseus_inactivedy_warning",

		games_text_display_key = "dummy_troy_adi_ajax_renown_ancillary_spent",
		games_text_resource_display_key = "dummy_troy_adi_ajax_renown_faction_gifts_resources",
		games_text_peace_display_key = "dummy_troy_adi_peace_from_ajax_celebration",
	},

	-- Transient UI data, used for transferring data between script and UI
	-- ancillaries = {
	-- 	[1] = {
	-- 		component =					- ancillary slot component
	-- 		callback_component =		- component with the CharacterAncillaryCategory callback class
	-- 		button_component =			- ancilary selection button component
	-- 		ancillary = id or nil
	-- 		character = cqi or nil
	-- 	},
	-- 	[2] = {...
	-- 	},
	-- 	[3] = {...
	-- 	},
	-- },
	-- selected_ancillary = nil,
	-- factions = {
	-- 	faction_key_1,
	-- 	faction_key_2,
	-- 	...
	-- },
}

ancient_legacy_perseus = {
	config = perseus_config,
	ui = perseus_ui,

	persistent = {
		-- This is the persistent data that will be saved and loaded
		-- from the campaign file.
		active_faction = false,

		-- The table below exists only when the games are ongoing
		-- current_games = {
		-- 	factions = { "faction_key_1", "faction_key_2", "faction_key_3" },
		-- },

		last_games_turn = nil, -- The starting turn when the last games were hosted
	},

	on_legacy_claimed = function(self, faction_key)
		out("Perseus: ancient_legacy_perseus:on_legacy_claimed for " .. tostring(faction_key))

		local faction = cm:get_faction(faction_key)
		if (not faction) or faction:is_null_interface() then
			script_error("Perseus: Trying to claim legacy on a non-existing faction: " .. tostring(faction_key))
			return
		end
		
		self.persistent.active_faction = faction_key

		-- Can recruit units available in any province of the faction anywhere in its territory
		cm:faction_override_campaign_feature(faction_key, "factionwide_recruitment", true)

		-- Can recruit units available to allies and vassals
		cm:faction_override_campaign_feature(faction_key, "factionwide_shared_recruitment", true)

		-- Apply the background global recruitment penalties
		cm:apply_effect_bundle("phar_map_al_perseus_global_recruitment_penalties", faction_key, -1)

		-- Apply the unity effect bundle for the current tier
		self:update_unity()

		-- Give the initial ancillaries to the faction to allow hosting the games immediately
		for _, ancillary in ipairs(self.config.host_games.games_initial_prizes) do
			cm:add_ancillary_to_faction(faction_key, ancillary, true)
		end

		-- Activate the button in the UI
		local local_faction = cm:get_local_faction_name(true)
		if (faction_key == local_faction) then
			egypt_political_states:activate_button(self.ui.config.legacy_panel_button_id, true)
		end
	end,

	on_turn_start = function(self)
		self:update_unity()
	end,

	update_unity = function(self)
		local faction_key = self.persistent.active_faction
		local faction = cm:get_faction(faction_key)

		-- Calculate the current amount of unity
		local unity_amount = 0
		local regions_owned_by_vassals = 0
		local regions_owned_by_defensive_allies = 0
		local regions_owned_by_military_allies = 0

		local vassals = faction:factions_sovereign_of()
		for i = 0, vassals:num_items() - 1 do
			local vassal = vassals:item_at(i)
			regions_owned_by_vassals = regions_owned_by_vassals + vassal:region_list():num_items()
		end

		local defensive_allies = faction:factions_defensive_alliance_with()
		for i = 0, defensive_allies:num_items() - 1 do
			local ally = defensive_allies:item_at(i)
			regions_owned_by_defensive_allies = regions_owned_by_defensive_allies + ally:region_list():num_items()
		end

		local military_allies = faction:factions_military_alliance_with()
		for i = 0, military_allies:num_items() - 1 do
			local ally = military_allies:item_at(i)
			regions_owned_by_military_allies = regions_owned_by_military_allies + ally:region_list():num_items()
		end

		-- Add the unity amounts to the pool using the respective factors
		local current_turn = cm:model():turn_number()
		local old_tier = self:get_current_tier()
		
		local are_games_ongoing = self:are_games_ongoing()

		local unity_from_vassals = regions_owned_by_vassals * self.config.unity.unity_per_vassal_owned_region
		local unity_from_defensive_allies = regions_owned_by_defensive_allies * self.config.unity.unity_per_defensive_ally_owned_region
		local unity_from_military_allies = regions_owned_by_military_allies * self.config.unity.unity_per_military_ally_owned_region
		local unity_from_game_events = are_games_ongoing and self.config.unity.unity_for_ongoing_games or 0

		local unity_pool = faction:pooled_resource(self.config.unity.unity_resource_key)
		local unity_factors = unity_pool:factors()
		local unity_factors_current_values = {}

		for i = 0, unity_factors:num_items() - 1 do
			local factor = unity_factors:item_at(i)
			unity_factors_current_values[factor:factor_id()] = factor:value()
		end

		cm:faction_add_pooled_resource(faction_key, faction_key, self.config.unity.unity_resource_key, self.config.unity.unity_resource_factor_vassals, unity_from_vassals - (unity_factors_current_values[self.config.unity.unity_resource_junction_factor_vassals] or 0))
		cm:faction_add_pooled_resource(faction_key, faction_key, self.config.unity.unity_resource_key, self.config.unity.unity_resource_factor_defensive_allies, unity_from_defensive_allies - (unity_factors_current_values[self.config.unity.unity_resource_factor_junction_defensive_allies] or 0))
		cm:faction_add_pooled_resource(faction_key, faction_key, self.config.unity.unity_resource_key, self.config.unity.unity_resource_factor_military_allies, unity_from_military_allies - (unity_factors_current_values[self.config.unity.unity_resource_factor_junction_military_allies] or 0))
		cm:faction_add_pooled_resource(faction_key, faction_key, self.config.unity.unity_resource_key, self.config.unity.unity_resource_factor_game_events, unity_from_game_events - (unity_factors_current_values[self.config.unity.unity_resource_factor_junction_game_events] or 0))

		local new_tier = self:get_current_tier()
		
		-- Update the effect bundle for the current tier
		local new_tier_bundle_key = self.config.unity.unity_effect_bundle_prefix .. tostring(new_tier)
		if new_tier ~= old_tier then
			cm:remove_effect_bundle(self.config.unity.unity_effect_bundle_prefix .. tostring(old_tier), faction_key)
			cm:apply_effect_bundle(new_tier_bundle_key, faction_key, -1)
		elseif not faction:has_effect_bundle(new_tier_bundle_key) then
			cm:apply_effect_bundle(new_tier_bundle_key, faction_key, -1)
		end
	end,

	get_current_tier = function(self)
		local faction_key = self.persistent.active_faction
		local faction = cm:get_faction(faction_key)
		local unity = faction:pooled_resource(self.config.unity.unity_resource_key):value()
		local tier = 1
		for i = 1, #self.config.unity.tiers do
			if unity < self.config.unity.tiers[i].unity_threshold then
				break
			end
			tier = i + 1
		end
		return tier, self.config.unity.tiers[tier]
	end,

	for_each_game_participant_pair = function(self, binary_function)
		if not self.persistent.current_games or not self.persistent.current_games.factions then
			return
		end
		for i = 1, #self.persistent.current_games.factions do
			for j = i + 1, #self.persistent.current_games.factions do
				binary_function(self.persistent.current_games.factions[i], self.persistent.current_games.factions[j])
			end
		end
	end,

	disable_war = function(self)
		self:for_each_game_participant_pair(function(faction1, faction2)
			cm:force_diplomacy("faction:" .. faction1, "faction:" .. faction2, "war", false, false, false)
		end)
	end,

	enable_war = function(self)
		self:for_each_game_participant_pair(function(faction1, faction2)
			cm:force_diplomacy("faction:" .. faction1, "faction:" .. faction2, "war", true, true, false)
		end)
	end,

	are_games_ongoing = function(self)
		local current_turn = cm:model():turn_number()
		return self.persistent.last_games_turn and (current_turn - self.persistent.last_games_turn < self.config.host_games.games_duration)
	end,

	are_games_on_cooldown = function(self)
		return self:get_games_cooldown() > 0
	end,

	get_games_cooldown = function(self)
		if not self.persistent.last_games_turn then
			return 0
		end
		local current_turn = cm:model():turn_number()
		return math.max(0, self.config.host_games.games_cooldown - (current_turn - self.persistent.last_games_turn))
	end,

	---------------------
	-- UI related functions
	---------------------
	
	show_message_event = function(event_id, param1, param2, param3)
		local event_data = self.config.unity.messages[event_id]
		if event_data ~= nil then
			cm:show_configurable_message_event(self.persistent.active_faction, event_data.title, event_data.primary_detail, event_data.secondary_detail, event_data.index, param1 or 0, param2 or 0, param3 or 0)
		end
	end,

	get_template = function(self, template_id)
		local template = self.ui.panel:SequentialFind(template_id)
		if template == nil then
			script_error("Perseus: missing template: " .. template_id)
			return nil
		end
		template:DivorceFromParent()
		return template
	end,

	init_panel = function(self)
		local faction_key = self.persistent.active_faction
		local faction = cm:get_faction(faction_key)
		local tier = self:get_current_tier()

		-- Retrieve template components
		self.ui.outcome_peace_faction_template = self:get_template(self.ui.config.component_ids.outcome_peace_faction_template)
		self.ui.outcome_resource_template = self:get_template(self.ui.config.component_ids.outcome_resource_template)
		self.ui.outcome_resource_separator_template = self:get_template(self.ui.config.component_ids.outcome_resource_separator_template)
		self.ui.outcome_effects_bundle_template = self:get_template(self.ui.config.component_ids.outcome_effects_bundle_template)

		-- Initialize the panel with the current unity tier and related effects
		self:refresh_panel()

		-- Initialize the panel with the current games state
		local games_script_data = {
			games_ongoing = self:are_games_ongoing(),
			games_on_cooldown = self:are_games_on_cooldown(),
		}
		table_print(games_script_data, 0, 10)
		common.set_context_value(self.ui.config.component_ids.games_holder, games_script_data)

		-- Initialize the ancillaries list
		if self.ui.ancillaries == nil then
			self.ui.ancillaries = {}
		end

		self.ui.selected_ancillary = nil

		local ancillaries_list = self.ui.panel:SequentialFind(self.ui.config.component_ids.host_games_subpanel, self.ui.config.component_ids.ancillaries_list)
		if ancillaries_list == nil then
			script_error("Perseus: UI: missing ancillaries list component: " .. self.ui.config.component_ids.ancillaries_list)
			return
		end
		
		-- The three ancillary slots are currently hardcoded in the UI layout, no dynamic templates are used. Keeping the relevant code JIC.
		-- local ancillary_template = ancillaries_list:SequentialFind(self.ui.config.component_ids.ancillary_template)
		-- if ancillary_template == nil then
		-- 	script_error("Perseus: UI: missing ancillary template: " .. self.ui.config.component_ids.ancillary_template)
		-- 	return
		-- end
		
		for i = 1, self.config.host_games.games_max_factions do
			if self.ui.ancillaries[i] == nil then
				self.ui.ancillaries[i] = {}
			end

			--local ancillary = ancillary_template:CopyComponent(self.ui.config.component_ids.ancillary_template .. "_" .. tostring(i))
			local ancillary = ancillaries_list:SequentialFind(self.ui.config.component_ids.ancillary_template .. tostring(i))
			if ancillary == nil then
				script_error("Perseus: UI: missing ancillary slot: " .. self.ui.config.component_ids.ancillary_template .. tostring(i))
				return
			end

			local ancillary_callback_component = uicomponent_find_down(ancillary, 
				function (component) 
					-- check for callback
					if component:CallbackId() == "CharacterAncillaryCategory" then return component end
				end)

			local button = ancillary:SequentialFind(self.ui.config.component_ids.ancillary_select_button)
			if button == nil then
				script_error("Perseus: UI: missing button component in the ancillary slot: " .. ancillary:Id())
				return
			end

			self.ui.ancillaries[i].component = ancillary
			self.ui.ancillaries[i].callback_component = ancillary_callback_component
			self.ui.ancillaries[i].button_component = button

			if self.ui.ancillaries[i].ancillary and ancillary_callback_component then
				ancillary_callback_component:InterfaceFunction("show", self.ui.ancillaries[i].ancillary, self.ui.ancillaries[i].character)
			else
				ancillary_callback_component:InterfaceFunction("show", nil, nil)
			end
		end

		self:update_ancillary_buttons()

		if self.ui.factions == nil then
			self.ui.factions = {}
		end

		self:update_games_button(faction_key)
	end,
	
	refresh_panel = function(self)
		local faction_key = self.persistent.active_faction
		local faction = cm:get_faction(faction_key)
		local tier = self:get_current_tier()

		-- Set the context for the unity tiers holder
		-- The name of the tier is the name of the respective effect bundle
		local tier_name = "effect_bundles_localised_title_" .. self.config.unity.unity_effect_bundle_prefix .. tostring(self:get_current_tier())
		local localised_tier_name = common.get_localised_string(tier_name)
		local unity_script_data = {
			tier = tier,
			tier_name = localised_tier_name,
			tier_state = "tier_" .. tostring(tier),
			unity_threshold_max = self.config.unity.tiers[#self.config.unity.tiers - 1].unity_threshold,
			unity = faction:pooled_resource(self.config.unity.unity_resource_key):value(),
		}
		table_print(unity_script_data, 0, 10)
		common.set_context_value(self.ui.config.component_ids.unity_tiers_holder, unity_script_data)

		-- Set the context for the unity related effects
		local effects_list = self.ui.panel:Find("effects_list")
		UIComponent(effects_list):SetContextObject(cco("CcoEffectBundle", self.config.unity.unity_effect_bundle_prefix .. tostring(tier)))

		-- Set the data about allowed cultures when hosting games and any ongoing games
		local current_turn = cm:model():turn_number()
		local host_games_data = {
			max_selected_factions = self.config.host_games.games_max_factions,
			allowed_cultures = self.config.unity.tiers[tier].available_cultures,
			ongoing_games = self:are_games_ongoing(),
			wait_turns = self:get_games_cooldown(),
			selected_factions = self.persistent.current_games and self.persistent.current_games.factions or {},
			unity_per_vassal_owned_region = self.config.unity.unity_per_vassal_owned_region,
			unity_per_defensive_ally_owned_region = self.config.unity.unity_per_defensive_ally_owned_region,
			unity_per_military_ally_owned_region = self.config.unity.unity_per_military_ally_owned_region,
		}
		table_print(host_games_data, 0, 10)
		self.ui.panel:InterfaceFunction("set_data", host_games_data)

		-- Update the Unity tier tooltips
		for i = 1, #self.config.unity.tiers do
			-- The tooltip text is used to specify the tooltip layout
			local tier_tooltip = "{{tt:" .. self.ui.config.unity_tier_tooltip_layout_path .. "}}"
			local tier_component = self.ui.panel:SequentialFind("tier_" .. tostring(i), "foreground")
			if tier_component then
				tier_component:SetTooltipText(tier_tooltip, "layout path", true)
				tier_component:SetInteractive(true)
				tier_component:SetContextObject(cco("CcoEffectBundle", self.config.unity.unity_effect_bundle_prefix .. tostring(i)))
			end
		end
	end,

	get_exclude_ancillaries_table = function(self, current_ancillary_id)
		-- Create a table with the ancillaries that are already selected for the games
		local exclude_ancillaries = {}
		for index, ancillary_data in ipairs(self.ui.ancillaries or {}) do
			if ancillary_data.ancillary then
				table.insert(exclude_ancillaries, {
					ancillary = ancillary_data.ancillary,
					character = ancillary_data.character,
					current = current_ancillary_id == index,
				})
			end
		end
		return exclude_ancillaries
	end,

	update_ancillary_buttons = function(self)
		local ancillary_selector = core:get_ui_root():SequentialFind(self.ui.config.panel_name, self.ui.config.component_ids.ancillary_selector)
		if ancillary_selector == nil then
			script_error("Perseus: missing ancillary selector: " .. self.ui.config.component_ids.ancillary_selector)
			return
		end

		local number_of_selected_factions = self.ui.factions and #self.ui.factions or 0
		--out("Perseus: update_ancillary_buttons for " .. tostring(number_of_selected_factions) .. " factions")
	
		if self.ui ~= nil and self.ui.ancillaries ~= nil then
			for i = 1, self.config.host_games.games_max_factions do
				local empty = ancillary_selector:InterfaceFunction("empty", self:get_exclude_ancillaries_table(i))

				if i > number_of_selected_factions then
					self.ui.ancillaries[i].ancillary = nil
					self.ui.ancillaries[i].character = nil
					self.ui.ancillaries[i].callback_component:InterfaceFunction("show", nil, nil)
					self.ui.ancillaries[i].button_component:SetState("inactive") -- Must be after the show callback to enforce the correct state
					self.ui.ancillaries[i].button_component:SetTooltipText(common.get_localised_string(self.ui.config.games_ancillary_button_tooltip_no_faction), self.ui.config.games_ancillary_button_tooltip_no_faction, true)
				elseif empty then
					self.ui.ancillaries[i].button_component:SetState("inactive")	
					self.ui.ancillaries[i].button_component:SetTooltipText(common.get_localised_string(self.ui.config.games_ancillary_button_tooltip_nothing_to_select), self.ui.config.games_ancillary_button_tooltip_nothing_to_select, true)
				else
					self.ui.ancillaries[i].button_component:SetState("active")
					self.ui.ancillaries[i].button_component:SetTooltipText("", true)
				end
			end
		end
	end,

	update_outcome = function(self)
		if not self.ui.factions then
			return
		end

		local faction_key = self.persistent.active_faction
		local faction = cm:get_faction(faction_key)
		local tier, tier_data = self:get_current_tier()
		local games_gift = (tier_data and tier_data.games_gift) or {}

		-- Find the factions that are currently at war with each other and will be at peace after the games.
		-- Also, collect the resources that will be gifted to the host faction by the participants.
		-- Use the UI list because the persistent list is not updated yet.
		local show_peace_header = false
		local factions_at_war = {}
		local gained_resources = {}
		for i, invited_faction_key_1 in pairs(self.ui.factions) do
			local invited_faction_1 = cm:get_faction(invited_faction_key_1)
			if invited_faction_1:at_war_with(faction) then
				factions_at_war[invited_faction_key_1] = invited_faction_1
				factions_at_war[faction_key] = faction
				show_peace_header = true
			end
			local resource = cm:get_random_desired_resource_from_faction(invited_faction_key_1, false, true)
			local amount = games_gift[resource] or 0
			if amount > 0 then
				gained_resources[resource] = (gained_resources[resource] or 0) + amount
			end
			for j = i + 1, #self.ui.factions do
				local invited_faction_2 = cm:get_faction(self.ui.factions[j])
				if invited_faction_1:at_war_with(invited_faction_2) then
					factions_at_war[invited_faction_key_1] = invited_faction_1
					factions_at_war[self.ui.factions[j]] = invited_faction_2
					show_peace_header = true
				end
			end
		end
		
		-- table_print(factions_at_war, 0, 10)
		-- table_print(gained_resources, 0, 10)

		-- List the factions that will be at peace after the games
		local outcome_peace_faction_list = self.ui.panel:SequentialFind(self.ui.config.component_ids.outcome_peace_factions_list)
		if outcome_peace_faction_list == nil then
			script_error("Perseus: UI: missing outcome peace faction list: " .. self.ui.config.component_ids.outcome_peace_factions_list)
			return
		end	

		outcome_peace_faction_list:DestroyChildren()
		for peace_faction_key, _ in pairs(factions_at_war) do
			local outcome_peace_faction = UIComponent(outcome_peace_faction_list:CreateFromComponent(self.ui.outcome_peace_faction_template:Address(), "faction_" .. peace_faction_key))
			outcome_peace_faction:SetContextObject(cco("CcoCampaignFaction", peace_faction_key))
		end

		local outcome_peace_header = (self.ui.panel:SequentialFind(self.ui.config.component_ids.outcome_peace_header))
		if outcome_peace_header == nil then
			script_error("Perseus: UI: missing outcome peace header: " .. self.ui.config.component_ids.outcome_peace_header)
			return
		end

		outcome_peace_header:SetVisible(show_peace_header)

		-- List the resources that will be gifted to the host faction by the participants
		local outcome_resource_list = self.ui.panel:SequentialFind(self.ui.config.component_ids.outcome_resources_list)

		if outcome_resource_list == nil then
			script_error("Perseus: UI: missing outcome resource list: " .. self.ui.config.component_ids.outcome_resources_list)
			return
		end

		outcome_resource_list:DestroyChildren()
		for resource_key, amount in pairs(gained_resources) do
			if outcome_resource_list:ChildCount() > 0 then
				local separator = UIComponent(outcome_resource_list:CreateFromComponent(self.ui.outcome_resource_separator_template:Address(), "separator_" .. resource_key))
				separator:SetVisible(true)
			end
			local outcome_resource = UIComponent(outcome_resource_list:CreateFromComponent(self.ui.outcome_resource_template:Address(), "gain_" .. resource_key))
			outcome_resource:SetContextObject(cco("CcoPooledResourceRecord", resource_key))
			outcome_resource:SequentialFind("dy_value"):SetStateText(tostring(amount))
		end

		-- Show the happiness bonus
		if outcome_resource_list:ChildCount() > 0 then
			local separator = UIComponent(outcome_resource_list:CreateFromComponent(self.ui.outcome_resource_separator_template:Address(), "separator_bundle"))
			separator:SetVisible(true)
		end

		local outcome_happiness = UIComponent(outcome_resource_list:CreateFromComponent(self.ui.outcome_effects_bundle_template:Address(), "gain_bundle"))
		outcome_happiness:SequentialFind("dy_value"):SetVisible(false)
		outcome_happiness:SequentialFind("icon"):SetContextObject(cco("CcoEffectBundle", self.config.host_games.games_effect_bundle_prefix .. tostring(tier)))
		outcome_happiness:SequentialFind("dy_duration"):SetStateText(tostring(self.config.host_games.games_duration), "number")
	end,

	update_games_button = function(self, faction_key)
		local games_button = self.ui.panel:SequentialFind(self.ui.config.component_ids.games_button)

		if games_button == nil then
			script_error("Perseus: Could not find the games button in the UI.")
			return
		end

		-- Check if the number of factions is the same as the number of ancillaries
		local num_factions = self.ui.factions and #self.ui.factions or 0
		local num_ancillaries = 0

		for index, ancillary_data in pairs(self.ui.ancillaries) do
			if ancillary_data.ancillary then
				num_ancillaries = num_ancillaries + 1
			end
		end

		local state = "active"
		local tooltip = self.ui.config.games_button_tooltip_description
		if self:are_games_ongoing() then
			tooltip = self.ui.config.games_button_tooltip_games_ongoing
			state = "inactive"
		elseif self:are_games_on_cooldown() then
			tooltip = self.ui.config.games_button_tooltip_cooldown_description
			state = "inactive"
		elseif num_factions < 1 then
			tooltip = self.ui.config.games_button_tooltip_select_at_least_one_description
			state = "inactive"
		elseif num_factions ~= num_ancillaries then
			tooltip = self.ui.config.games_button_tooltip_not_match_description
			state = "inactive"
		end

		out("Perseus: update_games_button: factions: " .. num_factions .. ", ancillaries: " .. num_ancillaries .. ", state: " .. state .. ", toltip: " .. tooltip)
		games_button:SetState(state)
		games_button:SetTooltipText("{{tr:" .. tooltip .. "}}", tooltip, true)

		self:update_outcome()
	end,

	on_ancillary_selection_button_clicked = function(self, context)
		local uic = UIComponent(context.component)
		out("Perseus: panel component clicked: " .. uic:Id())
		local ancillary_slot = uicomponent_find_up(uic, 
			function (component) 
				-- Check for a numbered ancillary slot name
				local ancillary_number = string.match(component:Id(), "^" .. self.ui.config.component_ids.ancillary_template .. "(%d)")
				if ancillary_number then return tonumber(ancillary_number) end
			end
		)

		if ancillary_slot == nil then
			script_error("Perseus: missing ancillary slot for the ancillary selection button.")
			return
		end

		local ancillary_number = tonumber(string.match((ancillary_slot):Id(), "^" .. self.ui.config.component_ids.ancillary_template .. "(%d)"))

		if ancillary_number then
			out("Perseus: showing the ancillary selector for slot: " .. tostring(ancillary_number))

			-- Deselect the previous slot
			if self.ui.selected_ancillary then 
				self.ui.ancillaries[self.ui.selected_ancillary].button_component:SetState("active")
			end

			-- Select the slot that was clicked
			if self.ui.selected_ancillary ~= ancillary_number then
				self.ui.selected_ancillary = ancillary_number
				self.ui.ancillaries[ancillary_number].button_component:SetState("selected")
			else
				self.ui.selected_ancillary = nil
			end

			-- Show the ancillary selector
			local ancillary_selector = core:get_ui_root():SequentialFind(self.ui.config.panel_name, self.ui.config.component_ids.ancillary_selector)
			if ancillary_selector ~= nil then
				if self.ui.selected_ancillary then
					ancillary_selector:InterfaceFunction("show", self.ui.selected_ancillary, self:get_exclude_ancillaries_table(self.ui.selected_ancillary))
				else
					ancillary_selector:InterfaceFunction("hide")
				end
			end
		end
	end,

	on_ancillary_selected = function(self, args)
		local ancillary = nil 
		local character_cqi = nil
		if #args > 1 then 
			ancillary = args[2]
		end
	
		if #args > 2 then 
			character_cqi = tonumber(args[3])
		end

		out("Perseus: ancillary selector closed, selection: " .. (ancillary or "") .. " for character (cqi): " .. (character_cqi or ""))

		if self.ui.selected_ancillary ~= nil and self.ui.selected_ancillary <= #self.ui.ancillaries then

			self.ui.ancillaries[self.ui.selected_ancillary].ancillary = ancillary
			self.ui.ancillaries[self.ui.selected_ancillary].character = character_cqi

			local component = self.ui.ancillaries[self.ui.selected_ancillary].callback_component
			if component ~= nil then
				component:InterfaceFunction("show", ancillary, character_cqi)
			else
				script_error("Perseus: no component found for " .. self.ui.selected_ancillary)
			end

			-- Deselect the slot
			self.ui.ancillaries[self.ui.selected_ancillary].button_component:SetState("active")
			self.ui.selected_ancillary = nil

			self:update_games_button()
			self:update_ancillary_buttons()
		else
			script_error("Perseus: no selected ancillary or index is bigger than self.ui.ancillaries: " .. (self.ui.selected_ancillary or "nil") .. ", " .. #self.ui.ancillaries)
		end
	end,

	on_host_games_button_clicked = function(self, context)
		out("Perseus: clicked the Host Game button")

		create_confirmation_box(self.ui.config.games_confirmation_dlg_id, self.ui.config.games_confirmation_dlg_description,
			function()
				local faction = cm:get_faction(self.persistent.active_faction)
				if faction == nil then return end

				if self.ui.factions == nil or #self.ui.factions < 1 then
					script_error("Perseus: didn't trigger games, no selected factions")
					return
				end

				local param = ""
				local faction_index = 0

				for index, ancillary_data in ipairs(self.ui.ancillaries or {}) do
					if ancillary_data.ancillary ~= nil then
						faction_index = faction_index + 1

						if faction_index <= #self.ui.factions then
							local faction_param
							if ancillary_data.character ~= nil then
								faction_param = self.ui.factions[faction_index] .. "," .. ancillary_data.ancillary .. "," .. ancillary_data.character
							else
								faction_param = self.ui.factions[faction_index] .. "," .. ancillary_data.ancillary .. "," .. "0"
							end

							param = param .. "," .. faction_param
						else
							script_error("Perseus: there are more ancillaries selected than factions.")
							param = nil
							break
						end
					end
				end

				if param ~= nil then
					out("Perseus: triggering script event PerseusHostGames with param: " .. param)
					CampaignUI.TriggerCampaignScriptEvent(faction:command_queue_index(), "PerseusHostGames" .. param)
				else
					script_error("Perseus: didn't trigger games, no selected ancillaries / factions")
				end
			end)
	end,

	trigger_games = function(self, args)		
		out("Perseus: triggering games for " .. ((#args - 1) / 3) .. " faction / ancillary pairs")
		
		if self.persistent.current_games == nil then
			self.persistent.current_games = {}
		end
		
		-- Clear the faction list and insert the participants and host faction
		self.persistent.current_games.factions = {}
		table.insert(self.persistent.current_games.factions, self.persistent.active_faction)
		
		-- Take care of the pooled resources to be received from the participants
		local faction = cm:get_faction(self.persistent.active_faction)
		local tier, tier_data  = self:get_current_tier()
		local games_gift = (tier_data and tier_data.games_gift) or {}

		local param_index = 1
		local payload = "payload{"

		while #args >= param_index + 3  do
			local faction = args[param_index + 1]
			local ancillary = args[param_index + 2]
			local character = tonumber(args[param_index + 3])
			local resource = cm:get_random_desired_resource_from_faction(faction, false, true)

			out("Perseus: processing faction: " .. faction .. ", ancillary: " .. ancillary .. ", character: " .. character .. ", resource: " .. (resource or ""))

			-- Remove the prize from the host faction and give it to the respective participant
			if character == 0 then
				cm:force_remove_ancillary_from_faction(self.persistent.active_faction, ancillary, false)
			else
				cm:force_remove_ancillary("character_cqi:"..character, ancillary, false)
			end

			cm:add_ancillary_to_faction(faction, ancillary, true)
			table.insert(self.persistent.current_games.factions, faction)

			param_index = param_index + 3
			
			-- ancillary gone
			-- Currently, we don't want to show the ancillaries won as prizes in the event because for three participants, its subentries are quite numerous anyway.
			-- payload = payload .. "text_display{" .. "lookup " .. self.ui.config.games_text_display_key .. "#ancillary:" .. ancillary .. "#faction:" .. faction ..  ":icon:name" .. ";}"
					
			-- resource
			if resource ~= nil and games_gift[resource] ~= nil then
				payload = payload .. "text_display{" .. "lookup " .. self.ui.config.games_text_resource_display_key .. "#pooled_resource:" .. resource .. ":name#pooled_resource:".. resource ..":icon:".. games_gift[resource] .. "#faction:" .. faction .. ":icon:name" ..  ";}"

				-- make transaction
				cm:faction_add_pooled_resource(self.persistent.active_faction, resource, self.config.host_games.games_pooled_resource_factor, games_gift[resource])
			else
				script_error("Perseus: unable to get resource: " .. (resource or ""))
			end
		end

		-- Enforce peace between the factions
		local diplomatic_relations_bonus_size = tier_data.diplomatic_relations_bonus_size
		out("Perseus: enforcing peace between the factions with a bonus of " .. diplomatic_relations_bonus_size)

		self:for_each_game_participant_pair(function(faction1, faction2)
			cm:force_make_peace(faction1, faction2, true)
			cm:force_diplomacy("faction:" .. faction1, "faction:" .. faction2, "war", false, false, false)
			if faction1 == self.persistent.active_faction then 
				-- diplomatic relation between the game host and the other faction
				payload = payload .. "diplomacy_change { target_faction " ..  faction2 .. ";amount " .. diplomatic_relations_bonus_size .. ";}"
			else
				-- diplomatic relation
				-- Currently, we setup the diplomatic relation bonuses not involving the host faction separately to avoid too many entries in the event's payload.
				-- payload = payload .. "diplomacy_change { target_faction " .. faction1 .. ";target_secondary_faction " .. faction2 .. ";amount " .. diplomatic_relations_bonus_size .. ";}"
				cm:apply_dilemma_diplomatic_bonus(faction1, faction2, diplomatic_relations_bonus_size)
			end
		end)

		-- Add the games effect bundle to the host faction
		payload = payload .. "effect_bundle{bundle_key " .. self.config.host_games.games_effect_bundle_prefix .. tostring(tier) .. ";turns " .. self.config.host_games.games_duration .. ";}"
			
		payload = payload .. "text_display{lookup " .. self.ui.config.games_text_peace_display_key .. "#faction:" .. self.persistent.active_faction .. ":icon#faction:" .. self.persistent.active_faction ..  ":name;}"
		payload = payload .. "}"

		cm:trigger_custom_incident(self.persistent.active_faction, self.config.host_games.games_incident, true, payload)

		-- Set cooldown
		self.persistent.current_games.start_turn = cm:turn_number()
		self.persistent.last_games_turn = self.persistent.current_games.start_turn

		self:update_unity()

		-- Clear the UI
		local panel = core:get_ui_root():SequentialFind(self.ui.config.panel_name)
		if panel ~= nil and panel:Visible() then
			-- Clear the selected ancillaries
			for index, ancillary_data in ipairs(self.ui.ancillaries or {}) do
				ancillary_data.ancillary = nil
				ancillary_data.character = nil

				if ancillary_data.callback_component ~= nil then
					ancillary_data.callback_component:InterfaceFunction("show", nil, nil)
				end
			end

			-- Clear the selected factions in the UI, then notify it about the games being hosted
			self.ui.factions = {}
			panel:InterfaceFunction("set_data", 
			{
				selected_factions = self.ui.factions, 
			})

			panel:InterfaceFunction("host_games", 
			{
				factions = self.persistent.current_games.factions, 
			})

			self:update_games_button()

			-- Close the panel
			out("Perseus: closing the panel: " .. tostring(panel))
			panel:InterfaceFunction("close_panel")
		end
	end,

	get_listeners = function(self)

		local listeners = {
			-- Initialize the legacy when the world is created: activate the button (local), update Unity and disable war between game participants (model)
			{
				event = "FirstTickAfterWorldCreated",
				auto_check_faction = false,
				condition = true,
				callback = function(self, context)
					if cm:get_local_faction_name(true) == self.persistent.active_faction then
						-- activating the button should at some point be a common code for all ancient legacies
						egypt_political_states:activate_button(self.ui.config.legacy_panel_button_id, false)
					end

					self:update_unity()

					-- If there are ongoing games, disable war between the participants
					if self:are_games_ongoing() then
						self:disable_war()
					end
				end,
			},
			
			-- Update Unity when the turn starts (model)
			{
				event = "FactionTurnStart",
				auto_check_faction = true,
				condition = true,
				callback = function(self, context)
					self:on_turn_start()
				end,
			},

			-- Reenable war between participants when the games end (model)
			{
				event = "FactionTurnEnd",
				auto_check_faction = true,
				condition = true,
				callback = function(self, context)
					-- If the games are ongoing, check if they have ended
					if self.persistent.current_games then
						local current_turn = cm:model():turn_number()
						if current_turn - self.persistent.last_games_turn >= self.config.host_games.games_duration then
							self:enable_war()
							self.persistent.current_games = nil
						end
					end
				end,
			},

			-- Update Unity when gaining an ally (model)
			{
				event = "PositiveDiplomaticEvent",
				auto_check_faction = true,
				condition = function(self, context)
					return context:is_alliance()
				end,
				callback = function(self, context)
					cm:callback(function() self:update_unity() end, 0.1)
				end,
			},

			-- Update Unity when losing an ally (model)
			{
				event = "NegativeDiplomaticEvent",
				auto_check_faction = true,
				condition = function(self, context)
					return context:was_alliance()
				end,
				callback = function(self, context)
					cm:callback(function() self:update_unity() end, 0.1)
				end,
			},

			-- This listener is used to update the UI when the game is reloaded (local).
			{
				event = "UIReloaded",
				auto_check_faction = true,
				condition = true,
				callback = function(self, context)
					local local_faction_name = cm:get_local_faction_name(true)
					if (self.persistent.active_faction == local_faction_name) then
						egypt_political_states:activate_button("button_fm_phar_perseus", true)
					end
				end,
			},

			-- Setup panel controls when the panel is opened (local)
			{
				event = "PanelOpenedCampaign",
				auto_check_faction = true,
				condition = function(self, context)
					return context.string == self.ui.config.panel_name and cm:get_local_faction_name(true) == self.persistent.active_faction
				end,
				callback = function(self, context)
					self.ui.panel = UIComponent(context.component)
					self:init_panel()
				end,
			},

			-- Unlink the panel when it is closed (local)
			{
				event = "PanelClosedCampaign",
				auto_check_faction = true,
				condition = function(self, context)
					return context.string == self.ui.config.panel_name and cm:get_local_faction_name(true) == self.persistent.active_faction
				end,
				callback = function(self, context)
					self.ui.panel = nil
				end,
			},

			-- React to UITriggerScriptEvent (local, except for triggering games which is model)
			{
				event = "UITriggerScriptEvent",
				auto_check_faction = true,
				condition = function(self, context)
					local args = context:trigger():split(",")
					return
						args[1] == "CharacterAncillarySelector" or
						args[1] == "AncientLegacyPerseusHoldGamesFactionList" or
						args[1] == "CharacterAncillarySelectorClose" or
						args[1] == "PerseusHostGames"
				end,
				callback = function(self, context)
					local is_panel_open = cm:get_campaign_ui_manager():is_panel_open(self.ui.config.panel_name)
					local is_local_faction = cm:get_local_faction_name(true) == self.persistent.active_faction
					local args = context:trigger():split(",")

					if args[1] == "CharacterAncillarySelectorClose" and is_local_faction and is_panel_open then
						out("Perseus: ancillary selector closed, deselecting the ancillary slot.")
						if self.ui.selected_ancillary then
							self.ui.ancillaries[self.ui.selected_ancillary].button_component:SetState("active")
							self.ui.selected_ancillary = nil
						end
					elseif args[1] == "CharacterAncillarySelector" and is_local_faction and is_panel_open then
						self:on_ancillary_selected(args)
					elseif args[1] == "AncientLegacyPerseusHoldGamesFactionList" and is_local_faction and is_panel_open then
						self.ui.factions = args
						table.remove(self.ui.factions, 1)
						self:update_games_button()
						self:update_ancillary_buttons()
						out("Perseus: selected factions to participate in games: " .. table.concat(self.ui.factions, ", "))
					elseif args[1] == "PerseusHostGames" then
						self:trigger_games(args) -- model change
					end
				end,
			},

			-- React to left clicking a component (local)
			{
				event = "ComponentLClickUp",
				auto_check_faction = true,
				condition = function(self, context)
					return self.ui.panel and cm:get_local_faction_name(true) == self.persistent.active_faction and
						(context.string == self.ui.config.component_ids.games_button or context.string == self.ui.config.component_ids.ancillary_select_button)
				end,
				callback = function(self, context)
					if context.string == self.ui.config.component_ids.games_button then
						self:on_host_games_button_clicked(context)
					elseif context.string == self.ui.config.component_ids.ancillary_select_button then
						self:on_ancillary_selection_button_clicked(context)
					end
				end,
			},

			-- Fill in the custom parts of the unity tier tooltips (local)
			{
				event = "ComponentOnTooltipShow",
				auto_check_faction = true,
				condition = function(self, context)
					local component = UIComponent(context.component)
					local tooltip_component = UIComponent(context:tooltip_object())
					return self.ui.panel and component:Id() == "foreground" and cm:get_local_faction_name(true) == self.persistent.active_faction
				end,
				callback = function(self, context)
					local component = UIComponent(context.component)
					local tier_component = UIComponent(component:Parent())
					local tooltip_component = UIComponent(context:tooltip_object())

					-- Check if the tooltip has been already filled
					if tooltip_component:SequentialFind("culture_1") then
						return
					end

					local tier = tonumber(string.match(tier_component:Id(), "tier_(%d+)"))
					local tier_data = self.config.unity.tiers[tier]
					local previous_tier_threshold = (tier > 1) and self.config.unity.tiers[tier - 1].unity_threshold or 0
					tooltip_component:SequentialFind("active_state_tx"):SetState((tier == self:get_current_tier()) and "active" or "inactive")
					if tier < 5 then
						tooltip_component:SequentialFind("dy_unity_threshold"):SetStateText(tostring(previous_tier_threshold) .. "-" .. tostring(tier_data.unity_threshold - 1), "script")
					else
						tooltip_component:SequentialFind("dy_unity_threshold"):SetStateText(tostring(previous_tier_threshold) .. "+", "script")
					end

					-- List the allowed cultures for Hold Games (currently done using dummy effects, so commenting it here)
					-- local cultures_list = tooltip_component:SequentialFind("list_bottom")
					-- local culture_entry_template = cultures_list:SequentialFind("dy_culture")
					-- for i, culture in ipairs(tier_data.available_cultures) do
					-- 	local culture_component = UIComponent(culture_entry_template:CopyComponent("culture_" .. tostring(i)))
					-- 	local culture_key = "cultures_name_" .. culture
					-- 	local culture_name = common.get_localised_string(culture_key)
					-- 	culture_component:SetStateText(culture_name, culture_key)
					-- 	culture_component:SetVisible(true)
					-- end
				end,
			}
		}

		return listeners
	end,

	on_loading_game = function(self)
		out("ancient_legacy_perseus:on_loading_game")
	end,

	on_saving_game = function(self)
		out("ancient_legacy_perseus:on_saving_game")
	end,
}

return ancient_legacy_perseus
