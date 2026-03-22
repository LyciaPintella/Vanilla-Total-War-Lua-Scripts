out("Loading phar_court_ui.lua") 

-- main file phar.court.lua

court.ui =
{
	config = 
	{
		-- all components here will be automatically placed in the court.ui.components.referenced_components table with the same id
		-- this is done in init_referenced_components
		referenced_component_ids =
		{
			black_overlay = "black_overlay",
			-- this one is drawn later and hides more
			black_overlay_over_positions = "black_overlay_2",
			background = "background",
			intrigue_panel = "intrigue_panel",
			request_panel = "request_panel",
			request_holder = "request_holder",
			demand_panel = "demand_panel",
			demand_holder = "demand_holder",
			plots_panel = "plots_panel",
			plots_holder = "plots_holder",
			support_intrigue_holder = "support_intrigue_holder",
			plots_intrigue_holder = "plot_intrigue_holder",
			button_plots = "button_plots",
			court_log_content = "court_log_content",
			empty_log_element = "tx_log_no_actions",
			shemsu_hor_indicator = "turns_shemsu_hor",
			title_shemsu_hor = "title_shemsu_hor",
			title_year = "title_year",

			first_row_positions = "first_row_positions", -- position cards are displayed in two rows
			second_row_positions = "second_row_positions", -- position cards are displayed in two rows

			shemsu_hor_bar = "bar_progress",
			-- own faction elements
			your_faction_info = "your_faction_info",

			-- only visible to the pharaoh/high king, they are the only ones assigning characters instead of faction leaders to position
			unassigned_characters_panel = "unassigned_characters",
			unassigned_characters_holder = "unassigned_char_holder",
			available_characters_element = "unassigned_char_holder",
			no_characters_element = "tx_no_chars",

			-- panel with the data for the selected position
			position_info_panel = "character_actions_panel",
			character_information = "character_information",
			position_actions_holder = "actions_holder",

			intrigue_button = "intrigue_button",
			request_button = "request_button",
			demand_button = "request_button_dominance",
			plot_button = "plot_button",
			remove_btn_holder = "remove_button",
			claim_btn_holder = "claim_button",
			kick_btn_holder = "kick_button",
			available_characters_holder = "unassigned_char_holder",

			plots_list_button = "plots_list_button",
			plots_content = "plots_content",
			own_plots_holder = "your_plots_holder",
			plots_against_holder = "plots_against_holder",
			other_plots_holder = "other_plots_holder",
			plots_intrigue_button = "plots_intrigue_button",
			plots_intrigue_panel = "plots_buttons_holder",
			plots_intrigue_no_plot_selected_text = "tx_not_selected",

			own_plots_counter = "yours_number",
			plots_against_counter = "against_number",
			other_plots_counter = "other_number",

			no_own_plots_txt = "tx_your_none",
			no_plots_against_txt = "tx_against_none",
			no_other_plots_txt = "tx_other_none",

			-- treasurer discounts
			apply_discounts_dialogue = "apply_discounts_dialogue",

			-- the pharaoh is special and does not use the template for the positions
			ruler_component = "pharaoh_position_v2",
			pharaoh_portrait = "portrait_pharaoh",
			pharaoh_injured_indicator = "injured_holder",

			court_leader_title_parent = "pharaoh_position",

			actions_indicator = "actions_indicator",

			-- slots for the player's action log
			slot_1 = "slot_1",
			slot_2 = "slot_2",
			slot_3 = "slot_3",
			slot_4 = "slot_4",
			slot_5 = "slot_5",
			slot_6 = "slot_6",

			own_faction_overview = "overview_holder",
			unread_plots_notification = "new_plots_notification",
			upgrade_plots_holder = "upgrade_plots_holder",

			-- generic text info
			info_panel = "description_tx",

			character_limit_indicator = "unassigned_cap_holder",
			heir_container = "heir_container",

			court_description_text = "court_description_text",
		},

		-- all components here will be automatically placed in the court.ui.components.templates table with the same id
		-- this is done in init_ui_templates
		-- note: they need to be in a different format from referenced_component_ids and component_ids because the order they are iterated through matters
		-- if there are nested templates we need to find and handle the internal one before the external one
		-- otherwise when the external one is divorced form the parent we can't find the internal one, it is not part of the components tree
		template_component_ids = 
		{
			-- plot_indicator_template
			{
				id = "plot_indicator_template",
				name = "actor_target_template"
			}, -- this needs to be before court_position_template

			--court_position_template
			{
				id = "court_position_template",
				name = "court_position_template",
			},

			--available_character_template
			{
				id = "available_character_template",
				name = "unassigned_character_template",
			},

			--intrigue_plot_request_cost_template
			{
				id = "intrigue_plot_request_cost_template",
				name = "resource_template_icon",
			}, -- this needs to be before court_position_template

			--intrigue_request_template
			{
				id = "intrigue_request_template",
				name = "intrigue_request_template",
			},

			--turn_item_template
			{
				id = "turn_item_template",
				name = "turn_events_template",
			},

			-- plot_template
			{
				id = "plot_template",
				name = "plot_template"
			},

			-- plot intrigue template
			{
				id = "plot_intrigue_template",
				name = "plot_intrigue_template"
			},

			-- court_ability_template
			{
				id = "court_ability_template",
				name = "court_ability_template"
			},

			-- give_to_button_template
			{
				id = "give_to_button_template",
				name = "give_to_x_button"
			},
		},

		-- components we want to search for or use in a specific way, not simply as referenced or template components
		-- e.g. specific items in templates
		component_ids =
		{
			-- the elements in the HUD opening the panel
			court_panel_button = "button_phar_court",

			-- the elements in the court menu
			panel = "court",

			-- contained in court_position_template
			court_position_portrait = "portrait_pharaoh",
			court_heir_indicator = "heir_indicator",
			court_position_frame = "frame",

			-- status indicator icons in the position template
			discounts_icon = "discounts_icon", -- this one might be removed, need discussion with designers
			vacant_position_indicator = "indicator_empty",

			-- setup for the intrigue/request component
			resource_template = "resource_template",

			-- court log
			log_turn_indicator = "dy_turn_indicator",

			-- contained in the unassigned_character_template
			available_character_portrait = "character_portrait",

			-- plot template
			plot_portrait_left = "character_left",
			plot_flag_left = "left_emblem",
			plot_portrait_right = "character_right",
			plot_flag_right = "right_emblem",
			plot_target_status_icon = "plot_target_status",
			plotter_status_icon = "plotter_status",

			court_leader_title = "tx_position_title",
			expanding_plots_list = "expanding_list_items",

			own_plots_notification = "new_yours_notification",
			plots_against_notification = "new_against_notification",
			other_plots_notification = "new_other_notification",

			icon_alert = "court_alert_icon",
			court_actions_indicator = "court_actions_indicator",

			own_plots_list = "actor_holder_active",
			targeted_by_plots_list = "target_holder_active",

			-- this is child of the slot_[X] components in the player's actions log (action_slots_holder)
			action_indicator = "action_indicator",

			-- children of the court_ability_template element
			court_ability_interaction_component = "button_container",
			court_ability_icon_component = "button_round_basic",
			court_ability_text_component = "button_txt",

			-- inside intrigue_request_template
			intrigue_plot_request_cost_holder = "price_holder",

			-- children of court_position_template
			button_plots_owned = "btn_court_show_actors",
			button_plots_against = "btn_court_show_targets",
		},

		regard_icon_path = "ui/skins/default/court/icon_court_guile_slot.png",
		dominance_icon_path = "ui/Campaign UI/pooled_resources/icon_map_dominance_points_small.png",
		action_icon_path =  "ui/skins/default/court/icon_court_shemsu_hor_actions.png",
		kick_from_position_icon_path =  "ui/skins/default/court/intrigue_icons/icon_court_intrigue_scapegoat.png",
		default_position_path = "ui\\skins\\default\\court\\icon_court_position_ph.png",

		attitude_color_player = "alliance_player",
		attitude_colors = 
		{
			"dip_attitude_0",
			"dip_attitude_1",
			"dip_attitude_2",
			"dip_attitude_3",
			"dip_attitude_4",
			"dip_attitude_5",
			"dip_attitude_6",
		},

		localization_keys =
		{
			claim_position_confirmation_key = "ui_text_replacements_localised_text_phar_main_court_question_claiming_position",
			leave_position_confirmation_key = "ui_text_replacements_localised_text_phar_main_court_question_leaving_position",
			kick_from_position_confirmation_key = "ui_text_replacements_localised_text_phar_map_court_question_kick_from_position",
			kick_from_position_log_key = "ui_text_replacements_localised_text_phar_map_court_log_kick_from_position",
			risky_plot_confirmation_key = "ui_text_replacements_localised_text_phar_main_court_question_risky_plot",
			killed_by_plotter_key = "ui_text_replacements_localised_text_phar_main_court_killed_by_plotter", -- used for tooltips in the plot element
			killed_by_plotter_event_key = "phar_sea_event_event_feed_string_plot_fails_shereden_secondary_detail", -- used for the event message. in ui_text_replacements
			plot_invalid = "phar_main_court_plot_invalid",
			unrevealed_plot_tooltip_key = "ui_text_replacements_localised_text_phar_main_court_dont_know_plot_details", -- not used
			judge_dilemma_effect_info = "phar_main_court_judge_dilemma_effect",
			give_court_actions_effect_info = "phar_main_court_vizier_give_actions_effect",
			purchase_another_court_action = "phar_main_court_purchase_another_court_action",
			faction_court_actions_used_up = "phar_main_court_faction_court_actions_used_up",
			cant_use_requests_during_war = "phar_main_court_cant_use_requests_during_war", -- no longer in use
			cant_use_requests_to_empty_position = "phar_main_court_cant_use_requests_to_empty_position",
			cant_use_requests_to_own_position = "phar_main_court_cant_use_requests_to_own_position",
			not_enough_regard = "phar_main_court_not_enough_regard",
			not_enough_regard_with_position = "phar_map_court_not_enough_regard_with_position",
			request_already_used_this_shemsu_hor = "phar_main_court_request_already_used_this_shemsu_hor",
			ability_already_used_this_shemsu_hor = "phar_main_court_ability_already_used_this_shemsu_hor",
			cooldown_ends_X_turns = "phar_map_court_you_can_use_this_in_X_turns",
			can_claim_turn_X = "phar_map_court_you_can_claim_this_on_turn_X",
			faction_used_up_actions_for_request = "phar_main_court_faction_used_up_actions_for_request",
			position_has_maximum_fixed_amount = "phar_main_court_position_has_maximum_fixed_amount",
			can_not_claim_position_during_war = "phar_main_court_can_not_claim_position_during_war", -- no longer in use
			need_region_to_claim = "phar_map_court_need_region_to_claim",
			no_available_positions = "phar_map_court_no_available_positions_to_take",
			not_enough_legitimacy_to_claim_position = "phar_main_court_not_enough_legitimacy_to_claim_position", -- no longer in use
			claim_position_only_during_shemsu_hor = "phar_main_court_claim_position_only_during_shemsu_hor",
			leader_can_not_claim_position_directly = "phar_main_court_leader_can_not_claim_position_directly",
			can_not_afford_fees_for_position = "phar_main_court_can_not_afford_fees_for_position",
			can_not_afford_court_action = "phar_main_court_action_cannot_afford",
			no_vacant_positions = "phar_main_court_no_vacant_positions",
			cant_claim_character_wounded = "phar_main_court_can_not_claim_wounded",
			only_leader_can_appoint_character_to_position = "phar_main_court_only_leader_can_appoint_character_to_position", -- no longer in use
			leader_has_max_positions = "phar_main_court_leader_has_max_positions",
			no_available_characters = "phar_main_court_no_available_characters",
			cant_use_no_plot_to_counter = "phar_main_court_intrigue_counter_cant_use_no_plot_to_counter", -- no longer in use
			cant_use_no_plot_available = "phar_main_court_intrigue_cant_use_no_plot_available", -- no longer in use

			log_position_gained = "phar_main_court_log_position_gained",
			log_request_used = "phar_main_court_log_request_used",

			-- ACTION STRINGS ON TOOLTIP OF CHARACTER PORTRAIT:

			-- when not in claim position mode (the claim button is OFF) and the character is not selected
			select_character = "phar_main_court_select_character", -- random localization strings
			-- when not in claim position mode (the claim button is OFF) and the character is selected
			deselect_character = "phar_main_court_deselect_character", -- random localization strings
			-- when in claim position mode (the claim button is ON)
			assign_character_to_position = "phar_main_court_assign_character_to_position",
			-- when the character can not be assigned for some reason (reasons will be listed as parameter)
			cannot_assign_character_to_position = "phar_main_court_cannot_assign_character_to_position", -- this is a header, under it are listed conditions that prevent claiming a position

			-- ACTION STRINGS ON TOOLTIP OF CLAIM BUTTON:

			-- when the player is not a court leader and will claim the position for themselves
			claim_button_action_yourself = "phar_main_court_assign_character_to_position", -- random localization strings
			-- when the claim button is OFF and there is a character selected or there is a single character available (click will trigger confirmation popup)
			claim_button_action_char_selected = "phar_main_court_assign_character_to_position", -- random localization strings
			-- when the claim button is OFF and there is no character selected (click will highlight characters)
			claim_button_action_no_char_selected = "phar_main_court_assign_character_to_position",
			-- when the claim button is ON, will remove highlight from characters
			claim_button_action_deselect = "phar_main_court_assign_character_to_position",
			-- when the position can not be claimed for some reason (reasons will be listed as parameter)
			cannot_claim_position = "phar_main_court_cannot_assign_character_to_position",

			dilemma_is_active = "phar_main_court_cannot_use_when_active_dilemma",
			leader_claim_diplomatic_effect = "phar_map_court_claim_diplomatic_effect",
			leader_give_to_faction_effects = 
			{
				"phar_map_court_leader_give_to_faction_effects_1",
				"phar_map_court_leader_give_to_faction_effects_2",
				"phar_map_court_leader_give_to_faction_effects_3",
			},
			red_bullet_point = "[[img:phar_main_icon_bulletpoint]][[/img]][[col:red]]%s[[/col]]",

			type_intrigue = "phar_main_court_intrigue_type",
			type_plot = "phar_main_court_plot_type",
			type_request = "phar_main_court_request_type",
			click_for_action = "phar_main_court_click_action",

			-- keys used in the player icons action log and its tooltips:
			turn_X = "phar_main_court_turn_x",
			-- unlike plot_forbidden_during_shemsu_hor ("phar_main_court_plot_not_accessible_shemsu_hor") this is not an error message, just an explanation text
			can_not_start_plots_shemsu_hor = "phar_main_court_can_not_start_plots_shemsu_hor",
			requests_refresh_next_turn = "phar_main_court_requests_refresh_next_turn",
			available_court_actions = "phar_main_court_available_court_actions",
			using_court_action = "phar_main_court_using_court_actions",
			used_actions = "phar_main_court_used_actions",
			no_used_actions = "phar_main_court_no_used_actions",

			-- there is already a key like this, and it localizes. subject to change by design
			unknown_plot = "unknown",

			court_ability_title_trigger_dilemma = "phar_main_court_trigger_dilemma",
			court_ability_title_give_actions = "phar_main_court_give_actions",

			cost_param_key = "phar_main_cost",

			claim_position_key = "phar_main_court_claim_position",
			kick_from_position_key = "phar_map_court_kick_from_position",

			plot_unrevealed = "phar_main_court_unrevealed_plot", -- ui_text_replacements
			plot_reveal_by_gossip = "phar_main_court_warning_reveal_by_gossip", -- ui_text_replacements

			character_capacity_indicator_default = "phar_main_court_character_capacity_egyptian", -- ui_text_replacements
			-- these depend on the court
			character_capacity_indicator = 
			{
				egyptian_court = "phar_main_court_character_capacity_egyptian", -- ui_text_replacements
				hittite_court = "phar_main_court_character_capacity_hittite", -- ui_text_replacements
			},

			position_benefits_legitimacy = "phar_main_court_position_legitimacy_tooltip", -- ui_text_replacements
			civil_war_tooltip = "phar_main_court_legitimacy_war_active_tooltip", -- ui_text_replacements
			crown_equipped = "phar_main_court_pschent_equipped_tooltip", -- ui_text_replacements

			click_to_upgrade_plot = "phar_main_court_click_to_upgrade_plot",  -- ui_text_replacements

			success_chance_header = "phar_main_court_plot_chance_breakdown_header",  -- ui_text_replacements

			number_wrapper_negative = "phar_main_number_wrapper_negative",  -- ui_text_replacements
			number_wrapper_positive = "phar_main_number_wrapper_positive",  -- ui_text_replacements

			ability_tooltip_discounts_set_commander 	= "phar_main_court_set_discounts_commander_tooltip",  -- ui_text_replacements
			ability_tooltip_discounts_set_treasurer 	= "phar_main_court_set_discounts_treasurer_tooltip",  -- ui_text_replacements

			give_position_to_x 	= "phar_map_court_give_position_to_x",  -- ui_text_replacements

			dynasy_heir 		= "phar_map_dynasty_heir",  -- ui_text_replacements
			dynasy_heir_benefit	= "phar_map_dynasty_heir_benefit",  -- ui_text_replacements


			related_region				= "phar_map_court_related_region",		-- ui_text_replacements
			related_region_owned_by		= "phar_map_court_region_owned_by",		-- ui_text_replacements

			give_to_x					= "phar_map_court_give_position_to_x",	-- ui_text_replacements

			court_description			= "uied_component_texts_localised_string_court_description_text_hittite_Text_6018977a",
		},

		first_row_capacity = 2,

		tooltips =
		{
		},

		court_title_egyptian_state_name = "egyptian",
		court_title_hittite_state_name = "hittite",
		actions_counter_available_state_name = "default",
		actions_counter_unavailable_state_name = "no_actions",
		event_message_component_read_state_name = "read",
		event_message_component_unread_state_name = "unread",

		-- if the plot has % chance over this number, it is considered positive
		plot_percentage_positive = 75,
		-- if the plot has % chance over this number (but no more than plot_percentage_positive), it is considered neutral. otherwise - negative
		plot_percentage_neutral = 50,

		-- this refers to the number of elements in the layout. DO NOT CHANGE THIS unless you also change the elements in the UI
		log_items_slots = 6,

		-- intrigues that can be used on own plots
		plot_intrigues_own = {"undermine",},
		-- intrigues that can be used on plots against own positions
		plot_intrigues_against = {"counter", "flip", "cease", "dissolve_plot"},
		-- intrigues that can be used on plots between third parties
		plot_intrigues_other = {"discourage", "encourage", "assume", "cease"},

		-- right now the cost for intrigues, requests and plots is shown in the UI element
		-- this controls whether it is shown in the tooltip as well (for inclusiveness) or not (to avoid repetition)
		show_intrigue_request_plot_cost_in_tooltip = true,
		show_claim_position_cost_in_tooltip = true,

		resource_icons = {
			troy_food = "UI/Campaign UI/pooled_resources/icon_res_food_medium.png",
			troy_stones = "UI/Campaign UI/pooled_resources/icon_res_stone_medium.png",
			troy_gold = "UI/Campaign UI/pooled_resources/icon_res_gold_medium.png",
			troy_bronze = "UI/Campaign UI/pooled_resources/icon_res_bronze_medium.png",
			troy_wood = "UI/Campaign UI/pooled_resources/icon_res_wood_medium.png",
		},
	},

	components = 
	{
		-- specific components we get once and manipulate (hide/show) later
		-- filled from referenced_component_ids table and accessed by name
		referenced_components = {},

		-- a place to keep the original components we use to create multiple copies
		-- filled with items from template_component_ids and accessed by name
		templates = {},

		-- a place to keep the original parents of template components, in case we need them
		-- filled with items from template_component_ids plus "_parent" and accessed by name
		templates_original_parents = {},

		-- components instantiated from the templates - 
		-- no key used, just a list. used to delete them when refreshing data
		instantiated_templates = {},
		log_instantiated_templates = {},
		give_to_x_instantiated_templates = {},
		-- buttons for requests and intrigues, cleared when switching between them
		instantiated_requests_intrigues_templates = {},
		-- buttons for plots
		instantiated_plot_templates = {},
	},

	-- this is cached when panel is opened, and cleared when panel is closed
	data = 
	{
		court_ui_opened = nil, -- this is true when the panel is opened
		faction_court = nil, -- one of the courts listed in court.all_courts
		local_faction_key = nil, -- cached here so we can only request it once
		selected_position_key = nil, -- the key to the selected position
		selected_heir_obj = nil, -- the character script interface of the dynasty heir (think of caching it)
		hovered_position_key = nil, -- when we hover on a position and need to show the side info panel we need to cache it, so we don't execute a ton of stuff every frame
		hovered_heir_obj = nil, -- when we hover on the heir indicator we cache it
		position_components_by_key = nil, -- a list of all the UI component for positions, using the position name as the key
		selected_character_CQI = nil, -- the Command Queue Index of the selected charater - to give them an empty position
		shown_intrigues = nil, -- if true the intrigue panel is shown and may need to be hidden
		shown_requests = nil, -- if true the request panel is shown and may need to be hidden
		shown_plots = nil, -- if true the plots panel is shown and may need to be hidden
		discount_position = nil, -- when setting/influencing/viewing discounts, this is the position that provides them
		claim_position_mode = nil, -- when the claim position button is selected but no eligible character is selected (and more than 1 is available) the game enters in this mode so the claim prompt is called when the character is selected
		selected_plot_id = nil, -- when we select a plot we lock in the plot intrigues for it
		hovered_plot_id = nil, -- when we hover on a plot and need to show the side info panel we need to cache it, so we don't execute a ton of stuff every frame
	},

	-- this is not saved, but not cleared when panel is closed
	semi_permanent_data = 
	{
		-- keeps all the positions which have the panel with their own plots expanded
		own_plots_expanded = {},
		-- keeps all the positions which have the panel with plots against them expanded
		against_plots_expanded = {},
	},

	--///////////////////////////////////////////////
	-- initialization

	-- looks for components with names in court.ui.config.referenced_component_ids
	-- then and sets them in court.ui.components.referenced_components with the same name
	init_referenced_components = function()
		local panel_component = core:get_ui_root():SequentialFind(court.ui.config.component_ids.panel)

		if panel_component then
			court.ui.components.referenced_components.panel = panel_component
		else
			script_error("ERROR: Court " .. court.ui.config.component_ids.panel .. " not found!")
			-- with no root panel we can't do anything in this menu
			return
		end

		for component_id, component_name in dpairs(court.ui.config.referenced_component_ids) do
			local referenced_component = panel_component:SequentialFind(component_name)

			if referenced_component then
				court.ui.components.referenced_components[component_id] = referenced_component
			else
				script_error("ERROR: Court " .. component_id .. " not found!");
			end
		end
	end,

	-- looks for components with names in court.ui.config.template_component_ids
	-- then and sets them in court.ui.components.templates with the same name
	init_ui_templates = function()
		for _, component_config in ipairs(court.ui.config.template_component_ids) do
			local component_id = component_config.id
			local component_name = component_config.name
			-- if one component was set up, they all were
			if court.ui.components.templates[component_id] then
				return
			end

			local template_component = court.ui.components.referenced_components.panel:SequentialFind(component_name)

			if template_component then
				local parent_id = component_id .. "_parent"
				court.ui.components.templates_original_parents[parent_id] = UIComponent(template_component:Parent())
				template_component:DivorceFromParent()
				court.ui.components.templates[component_id] = template_component
			else
				script_error("ERROR: Court " .. component_id .. " not found!");
			end
		end
	end,

	delete_referenced_components = function()
		court.ui.components.referenced_components = {}
	end,

	delete_ui_templates = function()
		for name, template in dpairs(court.ui.components.templates) do
			template:Destroy()
		end
		court.ui.components.templates = {}
	end,

	delete_instanced_components = function(just_clear_tables)
		if not just_clear_tables then
			for name, instanced_template in dpairs(court.ui.components.instantiated_templates) do
				instanced_template:Destroy()
			end
		end
		court.ui.components.instantiated_templates = {}

		if not just_clear_tables then
			for name, instanced_template in dpairs(court.ui.components.log_instantiated_templates) do
				instanced_template:Destroy()
			end
		end
		court.ui.components.log_instantiated_templates = {}

		if not just_clear_tables then
			for name, instanced_template in dpairs(court.ui.components.give_to_x_instantiated_templates) do
				instanced_template:Destroy()
			end
		end
		court.ui.components.give_to_x_instantiated_templates = {}
	end,

	delete_instanced_requests_intrigues_components = function()
		for name, instanced_template in dpairs(court.ui.components.instantiated_requests_intrigues_templates) do
			instanced_template:Destroy()
		end
		court.ui.components.instantiated_requests_intrigues_templates = {}
	end,
	-- end of initialization
	--///////////////////////////////////////////////
	-- displaying data

	display_general_data = function(faction_court)
		local faction_key = court.ui.data.local_faction_key

		local court_description_key = court.ui.config.localization_keys.court_description
		local court_description_string = common.get_localised_string(court_description_key)
		local court_description_string_parametrised = common.string_safe_format(court_description_string, faction_court.config.court_legitimacy_text_icon)

		local court_description_text = court.ui.components.referenced_components.court_description_text
		court_description_text:SetText(court_description_string_parametrised)

		-- the main data is sent by using CcoCampaignCharacter - name, faction, portrait, icon, etc.
		local ruling_faction_obj = nil
		local ruling_faction_key = faction_court:ruling_faction()
		if ruling_faction_key then 
			ruling_faction_obj = cm:get_faction(ruling_faction_key)
		end

		local ruler_component = court.ui.components.referenced_components.ruler_component
		local ruling_position_str = faction_court.config.ruler_position
		local position_obj = court.util_functions.get_court_position(faction_court, ruling_position_str)

		local portrait_component = ruler_component:SequentialFind(court.ui.config.referenced_component_ids.pharaoh_portrait)
		if ruling_faction_obj then
			if portrait_component then
				portrait_component:SetProperty("script_id", position_obj.name)
			end

			local position_character_obj = ruling_faction_obj:faction_leader()
			if position_character_obj then
				local cqi_string = tostring(position_character_obj:command_queue_index())
				local cco_name = "CcoCampaignCharacter"
				ruler_component:SetContextObject(cco(cco_name, cqi_string))
				court.ui.interaction.set_show_leader_injured_indicator(position_character_obj:is_wounded())
			end
		end

		local cco_table = court.ui.get_court_position_card_table(position_obj)
		court.ui.set_up_portrait_actions(ruler_component, position_obj)
		ruler_component:SetProperty("script_id", position_obj.name)
		common.set_context_value(position_obj.name, cco_table)

		local faction_table = court.util_functions.get_faction_persistent_data(court.ui.data.local_faction_key)
		local have_unread_plots = court.log_functions.has_unread_notifications(faction_table)
		if have_unread_plots then
			local icon_alert_component = core:get_ui_root():SequentialFind(court.ui.config.component_ids.icon_alert)
			if icon_alert_component then
				icon_alert_component:SetVisible(true)
			end
		end

		local general_info_cco_table = {}
		general_info_cco_table.pschent_crown_equipped = court.util_functions.is_pschent_crown_equipped(faction_court)
		general_info_cco_table.pschent_crown_equipped_tooltip = get_localised_text_replacement(court.ui.config.localization_keys.crown_equipped)
		general_info_cco_table.is_in_legitimacy_war = court.util_functions.is_in_legitimacy_war(faction_court)
		general_info_cco_table.legitimacy_war_tooltip = get_localised_text_replacement(court.ui.config.localization_keys.civil_war_tooltip)
		general_info_cco_table.court_name = faction_court.court_name
		common.set_context_value("general_court_info", general_info_cco_table)
		if not court.ui.data.position_components_by_key then 
			court.ui.data.position_components_by_key = {}
		end
		court.ui.data.position_components_by_key[position_obj.name] = ruler_component

		local help_page_key = court.position_functions.get_position_help_page_key(position_obj, faction_court)
		if help_page_key then
			if portrait_component then
				portrait_component:SetProperty("help_page_key", help_page_key)
				portrait_component:SetProperty("help_page_cursor", 0)
				portrait_component:SetProperty("help_page_open_on_right_click", 1)
			end
		end

		local vacant_position_indicator = ruler_component:SequentialFind(court.ui.config.component_ids.vacant_position_indicator)
		if vacant_position_indicator then
			vacant_position_indicator:SetVisible(position_obj.persistent.current_holder == nil)
		end
	end,

	display_shemsu_hor_bar = function()
		local title_year = court.ui.components.referenced_components.title_year
		local title_shemsu_hor = court.ui.components.referenced_components.title_shemsu_hor
		local shemsu_hor_indicator = court.ui.components.referenced_components.shemsu_hor_indicator

		if not shemsu_hor.is_active then
			title_year:SetVisible(true)
			if title_shemsu_hor then
				title_shemsu_hor:SetVisible(false)
			end

			if title_year then
				title_year:SetVisible(true)
			end

			if shemsu_hor_indicator then
				shemsu_hor_indicator:SetVisible(false)
			end
			return
		end

		local turns_to_shemsu_hor = shemsu_hor.get_turns_to_shemsu_hor()
		common.set_context_value("turns_to_shemsu_hor", turns_to_shemsu_hor)

		local shemsu_hor_period = shemsu_hor.config.shemsu_hor_period
		local shemsu_hor_progression = (shemsu_hor_period - turns_to_shemsu_hor) / shemsu_hor_period

		local total_width, height = court.ui.components.referenced_components.shemsu_hor_bar:Dimensions()
		local dock_offset, y = court.ui.components.referenced_components.shemsu_hor_bar:GetDockOffset()
		dock_offset = total_width * shemsu_hor_progression
		court.ui.components.referenced_components.shemsu_hor_bar:SetDockOffset(dock_offset, y)

		local is_shemsu_hor = turns_to_shemsu_hor == 0
		if title_shemsu_hor then
			title_shemsu_hor:SetVisible(is_shemsu_hor)
		end

		if title_year then
			title_year:SetVisible(not is_shemsu_hor)
		end

		if shemsu_hor_indicator then
			shemsu_hor_indicator:SetVisible(true)
		end
	end,

	fill_actions_used_info = function(cco_table)
		local faction_key = court.ui.data.local_faction_key
		local actions_used_this_turn = court.util_functions.get_court_actions_used_this_turn(faction_key)
		local max_court_actions_per_turn = court.util_functions.max_court_actions_for_faction(faction_key)

		local can_purchase_actions = court.util_functions.get_property(faction_key, "can_purchase_court_actions")
		if can_purchase_actions then
			local purchase_cost_obj = court.util_functions.get_court_action_purchase_cost_obj(faction_key, 1)
			local faction_obj = cm:get_faction(faction_key)
			cco_table.can_purchase_action = faction_obj:can_afford_resource_cost_object(purchase_cost_obj)
			-- costs are transactions with negative costs. to display them we need to make them positive
			purchase_cost_obj:multiply_by(-1)
			local cost_string = purchase_cost_obj:to_string(faction_key)

			local localized_text, _ = get_localised_text_replacement_and_source_formatted(court.ui.config.localization_keys.purchase_another_court_action, cost_string)
			cco_table.purchase_actions_cost_string = localized_text
		else
			cco_table.purchase_actions_cost_string = ""
			cco_table.can_purchase_action = false
		end

		local actions_remaining = max_court_actions_per_turn - actions_used_this_turn
		cco_table.court_actions_this_turn = tostring(actions_remaining)
		cco_table.has_court_actions = actions_remaining > 0
	end,

	display_background = function()
		-- none of these show any different so far...
		if court.util_functions.is_in_legitimacy_war(court.ui.data.faction_court) then
			court.ui.components.referenced_components.background:SetState("civil_war")
			return
		end

		if shemsu_hor.is_shemsu_hor() then
			court.ui.components.referenced_components.background:SetState("shemsu_hor")
		else
			court.ui.components.referenced_components.background:SetState("default")
		end
	end,

	display_position_info_panel = function(position_key)
		if not position_key then
			court.output("Error: display_position_info_panel called without providing a position", 10)
			court.ui.components.referenced_components.position_info_panel:SetVisible(false)
			return
		end

		if court.ui.components.referenced_components.info_panel then
			-- if the position is not the selected one (most likely no selected one) - this is just hover, show the info panel
			-- if the position is selected - hide the info panel to avoid overlap
			court.ui.components.referenced_components.info_panel:SetVisible(position_key ~= court.ui.data.selected_position_key)
		end

		local position_info_panel = court.ui.components.referenced_components.position_info_panel
		local character_information = court.ui.components.referenced_components.character_information
		local position_actions_holder = court.ui.components.referenced_components.position_actions_holder
		local intrigue_button = court.ui.components.referenced_components.intrigue_button
		local request_button = court.ui.components.referenced_components.request_button
		local demand_button = court.ui.components.referenced_components.demand_button
		local plot_button = court.ui.components.referenced_components.plot_button
		local remove_btn_holder = court.ui.components.referenced_components.remove_btn_holder
		local claim_btn_holder = court.ui.components.referenced_components.claim_btn_holder

		position_info_panel:StallLayouts(true)
		position_info_panel:SetVisible(true)
		local position_obj = court.util_functions.get_court_position(court.ui.data.faction_court, position_key)
		local is_owned_position = (position_obj.persistent.current_holder_faction == court.ui.data.local_faction_key)
		local is_vacant_position = (not position_obj.persistent.current_holder)
		intrigue_button:SetVisible((not is_vacant_position) and (not is_owned_position))
		request_button:SetVisible((not is_vacant_position) and (not is_owned_position))

		local has_unlocked_legacy = ancient_legacy_common:faction_has_claimed_legacy(court.ui.data.local_faction_key, "phar_ancient_legacy_atreus") or false
		local demands_possible = (not is_vacant_position) and (not is_owned_position) and has_unlocked_legacy
		demand_button:SetVisible(demands_possible)
		plot_button:SetVisible((not is_vacant_position) and (not is_owned_position))
		local position_can_be_quit = is_owned_position and (not position_obj.position_config.quit_forbidden)
		remove_btn_holder:SetVisible(position_can_be_quit)

		local cco_table = court.ui.get_court_position_card_table(position_obj)
		local selected_position_script_id = "court_selected_position"
		common.set_context_value(selected_position_script_id, cco_table)
		character_information:SetProperty("script_id", selected_position_script_id)
		if cco_table.controlling_faction_key then
			local cco_holder_faction = cco("CcoCampaignFaction", cco_table.controlling_faction_key)
			character_information:SetContextObject(cco_holder_faction)
		end

		local position_can_be_claimed = is_vacant_position and (not position_obj.position_config.claim_forbidden)
		claim_btn_holder:SetVisible(position_can_be_claimed)

		if position_can_be_claimed then
			court.ui.setup_claim_position_button(position_obj)
		else
			-- we need to hide the buttons to give the positions
			court.ui.setup_give_to_x_buttons(position_obj)
		end

		-- this will show or hide the button as needed
		court.ui.setup_kick_position_button(position_obj)

		if court.ui.data.shown_intrigues then
			court.ui.hide_intrigues()
		end

		if court.ui.data.shown_requests or court.ui.data.shown_requests_dominance then
			court.ui.hide_requests()
		end

		if court.ui.data.shown_plots then
			court.ui.hide_plots()
		end

		-- we need to make sure the panel size is appropriate, depending on the sizes of character_information and the actions button holder
		local buttons_holder = claim_btn_holder:Parent()
		local buttons_holder_component = UIComponent(buttons_holder)
		buttons_holder_component:SetVisible(true)

		position_info_panel:StallLayouts(false)
		position_info_panel:Layout()

		court.ui.update_character_information_panel_height(character_information, buttons_holder_component)
	end,

	-- character_information_component is the panel that we need to resize
	-- buttons_holder_component is the one that can grow and shrink so we need to compensate for
	update_character_information_panel_height = function(character_information_component, buttons_holder_component)
		-- we must make sure the combined height of character_information_component and buttons_holder_component is no more than a set amount
		-- this is done by changing the height of character_information_component, as it has an optional scrollbar
		-- buttons_holder_component's height should not be changed

		local max_combined_height = 700
		local buttons_holder_height = buttons_holder_component:Height()
		local character_information_max_height = max_combined_height - buttons_holder_height

		-- we get the height of the list box inside the character component - this is the max size the component could possibly want
		local character_information_list_box = character_information_component:SequentialFind("list_box")
		local character_information_desired_height = character_information_list_box:Height()

		local width = character_information_component:Width()

		-- the height should be the lower of the two numbers, the height the component wants, and the one available in the parent
		local target_height = math.min(character_information_desired_height, character_information_max_height)
		character_information_component:Resize(width, target_height)
	end,

	display_heir_info_panel = function(heir_character_obj)
		if not heir_character_obj then
			court.output("Error: display_heir_info_panel called without providing a character", 10)
			court.ui.components.referenced_components.position_info_panel:SetVisible(false)
			return
		end

		if court.ui.components.referenced_components.info_panel then
			court.ui.components.referenced_components.info_panel:SetVisible(true)
		end

		local position_info_panel = court.ui.components.referenced_components.position_info_panel
		local character_information = court.ui.components.referenced_components.character_information
		local position_actions_holder = court.ui.components.referenced_components.position_actions_holder
		local intrigue_button = court.ui.components.referenced_components.intrigue_button
		local request_button = court.ui.components.referenced_components.request_button
		local demand_button = court.ui.components.referenced_components.demand_button
		local plot_button = court.ui.components.referenced_components.plot_button
		local remove_btn_holder = court.ui.components.referenced_components.remove_btn_holder
		local claim_btn_holder = court.ui.components.referenced_components.claim_btn_holder
		local kick_btn_holder = court.ui.components.referenced_components.kick_btn_holder

		position_info_panel:StallLayouts(true)
		position_info_panel:SetVisible(true)
		intrigue_button:SetVisible(false)
		request_button:SetVisible(false)
		demand_button:SetVisible(false)
		plot_button:SetVisible(false)
		remove_btn_holder:SetVisible(false)
		claim_btn_holder:SetVisible(false)
		kick_btn_holder:SetVisible(false)

		local cco_table = court.ui.get_court_heir_table(heir_character_obj)
		local selected_position_script_id = "heir_info"
		common.set_context_value(selected_position_script_id, cco_table)
		character_information:SetProperty("script_id", selected_position_script_id)

		local heir_faction = heir_character_obj:faction()
		local faction_key = heir_faction:name()
		local cco_holder_faction = cco("CcoCampaignFaction", faction_key)
		character_information:SetContextObject(cco_holder_faction)

		if court.ui.data.shown_intrigues then
			court.ui.hide_intrigues()
		end

		if court.ui.data.shown_requests or court.ui.data.shown_requests_dominance then
			court.ui.hide_requests()
		end

		if court.ui.data.shown_plots then
			court.ui.hide_plots()
		end

		-- we need to make sure the panel size is appropriate, depending on the sizes of character_information and the actions button holder (here it is empty as there are no actions towards the heir)
		local buttons_holder = claim_btn_holder:Parent()
		local buttons_holder_component = UIComponent(buttons_holder)
		buttons_holder_component:SetVisible(false)

		position_info_panel:StallLayouts(false)
		position_info_panel:Layout()

		court.ui.update_character_information_panel_height(character_information, buttons_holder_component)
	end,

	-- position_obj is optional, taking the selected positon (from court.ui.data.selected_position_key) as default
	setup_claim_position_button = function(position_obj)
		local faction_court = court.ui.data.faction_court
		if (not position_obj) and is_string(court.ui.data.selected_position_key) then
			position_obj = court.util_functions.get_court_position(faction_court, court.ui.data.selected_position_key)
		end
		local claim_btn_holder = court.ui.components.referenced_components.claim_btn_holder
		local faction_obj = court.ui.data.local_faction_obj
		local claim_button_cco = {}
		claim_button_cco.Title = get_localised_text_replacement(court.ui.config.localization_keys.claim_position_key)

		if court.ui.config.show_claim_position_cost_in_tooltip then
			local claim_cost_obj = court.position_functions.get_claim_position_cost_obj(faction_court, court.ui.data.local_faction_key)
			-- costs are negative transactions, multiply by -1 to display positive numbers
			claim_cost_obj:multiply_by(-1)
			local cost_string = claim_cost_obj:to_string(court.ui.data.local_faction_key)
			if cost_string == "0" then
				cost_string = ""
			end

			local court_action_cost_string = court.ui.get_court_action_cost_string(1)
			cost_string = cost_string .. court_action_cost_string
			claim_button_cco.Alert = cost_string
		end

		local local_ruling_faction = faction_court:ruling_faction()
		local is_faction_leader = local_ruling_faction == court.ui.data.local_faction_key
		local can_claim_position, error_message = nil, nil
		local available_characters = nil
		if is_faction_leader 
			or faction_court.config.any_faction_can_hold_multiple_positions
		then
			can_claim_position, error_message = court.util_functions.can_give_own_character_a_position(faction_court, court.ui.data.local_faction_key, position_obj)
			available_characters = court.util_functions.get_eligible_characters(faction_court, faction_obj)
		else
			can_claim_position, error_message = court.util_functions.can_claim_position_directly(faction_court, court.ui.data.local_faction_key, position_obj)
		end

		if can_claim_position then
			claim_btn_holder:SetState("active")
			local localization_key = nil
			if court.ui.data.claim_position_mode then
				localization_key = court.ui.config.localization_keys.claim_button_action_deselect
			elseif not is_faction_leader then
				localization_key = court.ui.config.localization_keys.claim_button_action_yourself
			elseif court.ui.data.selected_character_CQI or #available_characters < 2 then
				localization_key = court.ui.config.localization_keys.claim_button_action_char_selected
			else
				localization_key = court.ui.config.localization_keys.claim_button_action_no_char_selected
			end
			claim_button_cco.Action = get_localised_random_string(localization_key)
			if is_faction_leader then
				claim_button_cco.Alert = get_localised_text_replacement(court.ui.config.localization_keys.leader_claim_diplomatic_effect)
			end
		else
			claim_btn_holder:SetState("locked")
			local warning_key = court.ui.config.localization_keys.cannot_claim_position
			local warning_message, tooltip_source = get_localised_random_string_and_source_formatted(warning_key, error_message)
			claim_button_cco.Warning = warning_message
		end

		local script_id = "court_claim_button"
		claim_btn_holder:SetProperty("script_id", script_id)
		common.set_context_value(script_id, claim_button_cco)

		court.ui.setup_give_to_x_buttons(position_obj, is_faction_leader)
	end,

	setup_kick_position_button = function(position_obj)
		local faction_court = court.ui.data.faction_court 
		local kick_btn_holder = court.ui.components.referenced_components.kick_btn_holder
		if not kick_btn_holder then
			return
		end

		local player_faction_key = court.ui.data.local_faction_key
		local ruling_faction_key = faction_court:ruling_faction()
		local is_court_leader = (player_faction_key == ruling_faction_key)
		if (not is_court_leader)
			or (not position_obj)
			or position_obj.persistent.current_holder == nil
			or position_obj.persistent.current_holder_faction == court.ui.data.local_faction_key
			or position_obj.quit_forbidden
		then
			kick_btn_holder:SetVisible(false)
			return
		end

		kick_btn_holder:SetVisible(true)
		local ui_text, ui_source = get_localised_text_replacement_and_source(court.ui.config.localization_keys.kick_from_position_key)
		kick_btn_holder:SetText(ui_text, ui_source)

		local faction_obj = court.ui.data.local_faction_obj
		local kick_button_cco = {}
		kick_button_cco.Title = get_localised_text_replacement(court.ui.config.localization_keys.kick_from_position_key)


		local kick_cost_obj =  court.position_functions.get_kick_from_position_cost_obj(position_obj, faction_obj, faction_court)

		local cost_string = kick_cost_obj:to_string(court.ui.data.local_faction_key)
		if cost_string == "0" then
			cost_string = ""
		end
		-- costs are negative transactions, multiply by -1 to display positive numbers
		kick_cost_obj:multiply_by(-1)

		local court_action_cost_string = court.ui.get_court_action_cost_string(1)
		cost_string = cost_string .. court_action_cost_string
		kick_button_cco.Alert = cost_string

		local can_kick_from_position, error_message = court.position_functions.can_kick_from_position(position_obj, faction_obj, kick_cost_obj)

		if can_kick_from_position then
			kick_btn_holder:SetState("active")
			kick_button_cco.Action = get_localised_random_string(court.ui.config.localization_keys.click_for_action)
		else
			kick_btn_holder:SetState("locked")
			kick_button_cco.Warning = error_message
		end

		local script_id = "court_kick_button"
		kick_btn_holder:SetProperty("script_id", script_id)
		common.set_context_value(script_id, kick_button_cco)
	end,

	setup_give_to_x_buttons = function(position_obj, is_faction_leader)
		if not court.config.can_leader_give_position_to_factions then
			return
		end
		court.ui.data.position_contenders = {}
		local faction_court = court.ui.data.faction_court
		if (not is_faction_leader)
			or (not position_obj)
			or position_obj.persistent.current_holder ~= nil
		then
			for _, instanced_template in ipairs(court.ui.components.give_to_x_instantiated_templates) do
				instanced_template:SetVisible(false)
			end
			return
		end

		-- show buttons to give position to top claimants
		local valid_contender_scores = court.position_functions.get_valid_contender_scores(faction_court, 
			court.ui.data.local_faction_key, 
			court.config.claim_position_cost.min_valid_score_give_position_by_leader)
		valid_contender_scores = table_stable_sort(valid_contender_scores, function(a, b) return a.candidate_value > b.candidate_value end)

		local leader_holds_related_region, related_region_message = court.util_functions.does_faction_own_related_region(court.ui.data.local_faction_key, faction_court, position_obj)

		local number_of_top_contenders = math.min(#valid_contender_scores, court.config.claim_position_cost.top_contenders_to_sum)
		local top_candidates_sum = 0
		for index = 1, number_of_top_contenders do
			local instanced_template = nil
			if index <= #court.ui.components.give_to_x_instantiated_templates then
				instanced_template = court.ui.components.give_to_x_instantiated_templates[index]
			else
				local give_to_button_template = court.ui.components.templates.give_to_button_template
				local original_parent = court.ui.components.templates_original_parents.give_to_button_template_parent
				instanced_template = UIComponent(original_parent:CreateFromComponent(give_to_button_template:Address(), "give_to_" .. tostring(index)))
				table.insert(court.ui.components.give_to_x_instantiated_templates, instanced_template)
			end

			instanced_template:SetVisible(true)
			local contender = valid_contender_scores[index]
			-- we cache the contenders to avoid getting them again if the leader chooses a faction to give the position to 
			table.insert(court.ui.data.position_contenders, contender.faction_key)

			local give_to_localized_text, _ = get_localised_text_replacement_and_source(court.ui.config.localization_keys.give_to_x)
			local button_title = common.string_safe_format(give_to_localized_text, contender.faction_obj:localised_display_name())
			local give_to_x_cco = {}
			give_to_x_cco.Title = button_title
			local leader_give_to_faction_effects = court.ui.config.localization_keys.leader_give_to_faction_effects
			if index > #leader_give_to_faction_effects then
				-- we should not get here, but if we do - we get the last warning
				give_to_x_cco.Alert = get_localised_text_replacement(leader_give_to_faction_effects[#leader_give_to_faction_effects])
			else
				give_to_x_cco.Alert = get_localised_text_replacement(leader_give_to_faction_effects[index])
			end

			local can_give_away = true
			if not leader_holds_related_region then
				local contender_holds_related_region, related_region_message = court.util_functions.does_faction_own_related_region(contender.faction_key, faction_court, position_obj)
				if not contender_holds_related_region then
					give_to_x_cco.Warning = related_region_message
					can_give_away = false
				end
			end

			if can_give_away then
				instanced_template:SetState("active")
			else
				instanced_template:SetState("locked")
			end

			give_to_x_cco.faction_key = contender.faction_key
			give_to_x_cco.Action = get_localised_random_string(court.ui.config.localization_keys.click_for_action)
			instanced_template:SetText(button_title)


			local script_id = "give_to_x_" .. tostring(index)
			instanced_template:SetProperty("script_id", script_id)
			common.set_context_value(script_id, give_to_x_cco)
		end

		if number_of_top_contenders > #court.ui.components.give_to_x_instantiated_templates then
			-- there are fewer pretenders than there are instantiated prefabs - we need to hide the extra ones
			for index = number_of_top_contenders, #court.ui.components.give_to_x_instantiated_templates do
				local instanced_template = court.ui.components.give_to_x_instantiated_templates[index]
				instanced_template:SetVisible(false)
			end
		end
	end,

	hide_position_info_panel = function()
		if court.ui.components.referenced_components.position_info_panel then
			court.ui.components.referenced_components.position_info_panel:SetVisible(false)
		end

		-- we restore the info panel possibly hidden from selecting a position
		if court.ui.components.referenced_components.info_panel then
			court.ui.components.referenced_components.info_panel:SetVisible(true)
		end
	end,

	display_pharaoh_panel = function()
		local pharaoh_cqi = court.ui.data.selected_pharaoh_cqi
		court.ui.hide_all_panels(true)
		court.ui.data.selected_pharaoh_cqi = pharaoh_cqi

		if not court.ui.data.selected_pharaoh_cqi then
			return
		end

		local position_info_panel = court.ui.components.referenced_components.position_info_panel
		local character_information = court.ui.components.referenced_components.character_information
		local position_actions_holder = court.ui.components.referenced_components.position_actions_holder
		local intrigue_button = court.ui.components.referenced_components.intrigue_button
		local request_button = court.ui.components.referenced_components.request_button
		local remove_btn_holder = court.ui.components.referenced_components.remove_btn_holder
		local claim_btn_holder = court.ui.components.referenced_components.claim_btn_holder

		position_info_panel:SetVisible(true)
		
		position_actions_holder:SetVisible(true)

		intrigue_button:SetVisible(false)
		request_button:SetVisible(false)
		remove_btn_holder:SetVisible(false)
		claim_btn_holder:SetVisible(false)

		if court.ui.data.shown_intrigues then
			court.ui.hide_intrigues()
		end

		if court.ui.data.shown_requests or court.ui.data.shown_requests_dominance then
			court.ui.hide_requests()
		end
	end,

	display_own_faction_data = function()
		local faction_court = court.ui.data.faction_court
		local cco_table = {}

		local local_faction_key = court.ui.data.local_faction_key
		cco_table.DisplayName = common.get_localised_string("factions_screen_name_" .. local_faction_key)
		local faction_abilities_keys = court.util_functions.get_property(local_faction_key, "faction_abilities_strings") or {}
		cco_table.faction_abilities_keys = {}
		for _, ability_key in ipairs(faction_abilities_keys) do
			local node = {}
			node.localization = common.get_localised_string(ability_key)
			table.insert(cco_table.faction_abilities_keys, node)
		end

		cco_table.own_faction_legitimacy = faction_court.court_legitimacy():get_legitimacy(local_faction_key)

		cco_table.own_faction_legitimacy_tooltip = ""
		if not faction_court.court_legitimacy():can_use(local_faction_key) then
			cco_table.own_faction_legitimacy_tooltip = "LOCKED"
		end

		court.ui.fill_actions_used_info(cco_table)

		local faction_table = court.util_functions.get_faction_persistent_data(local_faction_key)
		local have_unread_plots = court.log_functions.has_unread_notifications(faction_table)
		court.ui.components.referenced_components.unread_plots_notification:SetVisible(have_unread_plots)
		cco_table.court_name = faction_court.court_name

		local player_faction_key = court.ui.data.local_faction_key
		local faction_obj = cm:get_faction(player_faction_key)
		local character_obj = faction_obj:faction_leader()
		local cco_character = cco("CcoCampaignCharacter", character_obj:command_queue_index())
		court.ui.components.referenced_components.your_faction_info:SetContextObject(cco_character)

		local ruling_faction_key = faction_court:ruling_faction()
		local is_court_leader = (player_faction_key == ruling_faction_key)
		if is_court_leader 
			or faction_court.config.any_faction_can_hold_multiple_positions
		then
			local indicator_component = court.ui.components.referenced_components.character_limit_indicator
			if not faction_court.config.any_faction_can_hold_multiple_positions then
				court.ui.display_character_limit_indicator(indicator_component, faction_table, cco_table)
			else
				if indicator_component then
					indicator_component:SetVisible(false)
				end
			end
			local ruler_position = court.util_functions.get_court_position(faction_court, faction_court.config.ruler_position)
			local current_turn = cm:model():turn_number()
			if ruler_position.persistent.turn_gained == current_turn then
				cco_table.became_leader_this_turn = true
			end

			court.ui.display_available_characters_data()
		else
			court.ui.hide_available_characters_data()
		end

		common.set_context_value("own_faction_info", cco_table)

		if shemsu_hor.is_active then
			court.ui.display_shemsu_hor_log()
		else
			court.ui.display_non_shemsu_hor_log()
		end

		court.ui.display_court_abilities_buttons()
	end,

	display_character_limit_indicator = function(indicator_component, faction_table, cco_table)
		local faction_court = court.ui.data.faction_court
		local owned_positions = 0
		if is_table(faction_table.owned_positions) then
			owned_positions = #faction_table.owned_positions
		end

		local faction_max_positions = faction_table.allowed_positions
		if not faction_max_positions then
			-- the court leader can have 1 extra position by default
			-- since the court leader itself is now also a position, we increase it by 1
			faction_max_positions = 2
		end

		-- we need to reduce both by 1 to leave only the characters, not the leader in the leader position
		owned_positions = owned_positions - 1
		faction_max_positions = faction_max_positions - 1
		cco_table.available_charactes_string = owned_positions .. "/" .. faction_max_positions
		local tooltip_string, tooltip_source = "", ""

		local character_capacity_indicator = ""
		if court.ui.config.localization_keys.character_capacity_indicator[faction_court.court_name] then
			character_capacity_indicator = court.ui.config.localization_keys.character_capacity_indicator[faction_court.court_name]
		else
			character_capacity_indicator = court.ui.config.localization_keys.character_capacity_indicator_default
		end
		tooltip_string, tooltip_source = get_localised_text_replacement_and_source(character_capacity_indicator)

		if indicator_component then
			indicator_component:SetVisible(true)
			indicator_component:SetTooltipText(tooltip_string, tooltip_source, true)
		end
	end,

	display_court_abilities_buttons = function()
		local local_faction_key = court.ui.data.local_faction_key

		for _, position_obj in ipairs(court.ui.data.faction_court.positions) do
			if court.discount_functions.can_position_give_discounts(position_obj) then
				court.ui.display_discount_abilities(position_obj, local_faction_key)
			end
		end

		-- judge-related abilities
		local judge_obj = court.util_functions.get_court_position(court.ui.data.faction_court, "high_judge", true)
		-- not all courts have high_judge, so an extra check is needed
		if judge_obj and judge_obj.persistent.current_holder_faction == local_faction_key then
			-- by design the court ability uses the icon from the associated request
			local icon_path = judge_obj.requests[1].ui_config.icon_path
			
			local tooltip = judge_obj.trigger_dilemma.get_effect_info(judge_obj, court.ui.data.faction_court)
			local is_action_accessibile, error_message = judge_obj.trigger_dilemma:can_call_ability(judge_obj, court.ui.data.faction_court)
			if not is_action_accessibile then
				-- can_call_ability should return the points as red bullet points, so we don't need to add them as such, just append them
				tooltip = court.util_functions.message_append(tooltip, error_message)
			end

			local remaining_cooldown = judge_obj.trigger_dilemma.get_ability_cooldown_remaining(judge_obj, local_faction_key)
			court.ui.add_court_ability_button("trigger_dilemma", court.ui.config.localization_keys.court_ability_title_trigger_dilemma, icon_path, tooltip, remaining_cooldown)
		end

		for _, position_obj in ipairs(court.ui.data.faction_court.positions) do
			if position_obj.give_court_actions_ability
				and position_obj.persistent.current_holder_faction == local_faction_key
			then
				-- by design the court ability uses the icon from the associated request
				local icon_path = court.common_requests.connections.ui_config.icon_path

				local tooltip = position_obj.give_court_actions_ability.get_effect_info(position_obj, court.ui.data.faction_court)
				local is_action_accessibile, error_message = position_obj.give_court_actions_ability:can_call_ability(position_obj, court.ui.data.faction_court)
				if not is_action_accessibile then
					-- give_court_actions_ability should return the points as red bullet points, so we don't need to add them as such, just append them
					tooltip = court.util_functions.message_append(tooltip, error_message)
				end

				local remaining_cooldown = position_obj.give_court_actions_ability.get_ability_cooldown_remaining(position_obj, local_faction_key)
				court.ui.add_court_ability_button("give_actions_ability", court.ui.config.localization_keys.court_ability_title_give_actions, icon_path, tooltip, remaining_cooldown)
			end
		end
	end,

	display_discount_abilities = function(position_obj, local_faction_key)
		local is_position_holder = position_obj.persistent.current_holder_faction == local_faction_key
		if is_position_holder then
			-- by design the court ability uses the icon from the associated request
			local icon_path = position_obj.requests[2].ui_config.icon_path
			local remaining_cooldown = court.discount_functions.get_choose_discounts_remaining_cooldown(position_obj)
			if remaining_cooldown <= 0 then
				local tooltip, _ = get_localised_text_replacement_and_source(position_obj.ability_tooltip_discounts_show)
				court.ui.add_court_ability_button("set_discounts:" .. position_obj.name, position_obj.ability_title_discounts_set, icon_path, tooltip)
			else
				local cooldown_remaining_str = tostring(remaining_cooldown)
				local tooltip = get_localised_text_replacement_and_source_safe_formatted(court.ui.config.localization_keys.cooldown_ends_X_turns, cooldown_remaining_str)
				local full_ability_string = "set_discounts:" .. position_obj.name
				court.ui.add_court_ability_button(full_ability_string, position_obj.ability_title_discounts_set, icon_path, tooltip, remaining_cooldown)
			end
		end

		local can_see_discounts_position = (not is_position_holder) 
			and court.position_functions.can_faction_see_discount_plans_position(position_obj, court.ui.data.faction_court, local_faction_key)

		if can_see_discounts_position then
			-- by design the court ability uses the icon from the associated request
			local icon_path = position_obj.requests[2].ui_config.icon_path
			local tooltip, _ = get_localised_text_replacement_and_source(position_obj.ability_tooltip_discounts_show)
			local full_ability_string = "show_discounts:" .. position_obj.name
			court.ui.add_court_ability_button(full_ability_string, position_obj.ability_title_discounts_show, icon_path, tooltip)
		end
	end,

	-- if remaining_cooldown is nil or non-positive the ability is considered enabled
	add_court_ability_button = function(court_ability, display_key, icon_path, tooltip_str, remaining_cooldown)
		local court_ability_template = court.ui.components.templates.court_ability_template
		local original_parent = court.ui.components.templates_original_parents.court_ability_template_parent

		local new_court_ability_button_component = UIComponent(original_parent:CreateFromComponent(court_ability_template:Address(), court_ability))
		table.insert(court.ui.components.instantiated_templates, new_court_ability_button_component)

		local container = new_court_ability_button_component:SequentialFind(court.ui.config.component_ids.court_ability_interaction_component)
		if container then
			container:SetProperty("court_ability", court_ability)
			if tooltip_str then 
				container:SetTooltipText(tooltip_str, true)
			end
		end

		local icon_comp = new_court_ability_button_component:SequentialFind(court.ui.config.component_ids.court_ability_icon_component)
		if icon_comp then
			if icon_path then
				icon_comp:SetImagePath(icon_path, 10)
			end
			-- this is also an interactable component, so we need to set the property here as well
			icon_comp:SetProperty("court_ability", court_ability)
			if tooltip_str then 
				icon_comp:SetTooltipText(tooltip_str, true)
			end
		end
		
		local text_comp = new_court_ability_button_component:SequentialFind(court.ui.config.component_ids.court_ability_text_component)
		if text_comp and display_key then
			local display_str = get_localised_text_replacement(display_key)
			local display_source = get_localised_text_replacement_source(display_key)
			text_comp:SetText(display_str, display_source)
		end

		local button = new_court_ability_button_component:SequentialFind("button_round_basic")
		if button then
			local turns_indicator = new_court_ability_button_component:SequentialFind("dy_turns")
			if is_number(remaining_cooldown) and remaining_cooldown > 0
			then
				button:SetState("inactive")
				if turns_indicator then
					UIComponent(turns_indicator:Parent()):SetVisible(true)
					turns_indicator:SetText(tostring(remaining_cooldown))
				end
			else
				button:SetState("active")
				if turns_indicator then
					UIComponent(turns_indicator:Parent()):SetVisible(false)
				end
			end
		end
		return new_court_ability_button_component
	end,

	display_overview = function()
		if not court.ui.components.referenced_components.own_faction_overview then
			return
		end
		court.ui.components.referenced_components.own_faction_overview:SetVisible(true)
		court.ui.data.shown_overview = true
		court.ui.hide_active_plots()
	end,

	hide_overview = function()
		if not court.ui.components.referenced_components.own_faction_overview then
			return
		end
		court.ui.components.referenced_components.own_faction_overview:SetVisible(false)
		court.ui.data.shown_overview = false
	end,

	display_shemsu_hor_log = function()
		local current_turn = cm:model():turn_number()
		local next_shemsu_hor_turn = current_turn + shemsu_hor.get_turns_to_shemsu_hor()
		local shemsu_hor_cycle_start_turn = next_shemsu_hor_turn - shemsu_hor.get_shemsu_hor_period()

		for shemsu_hor_turn = 1, shemsu_hor.get_shemsu_hor_period() do
			local component_name = "slot_" .. shemsu_hor_turn
			local slot_component = court.ui.components.referenced_components[component_name]
			if slot_component then
				local action_indicator_component = slot_component:SequentialFind(court.ui.config.component_ids.action_indicator)
				local cco_table = {}
				local display_name, _ = get_localised_random_string_and_source_formatted(court.ui.config.localization_keys.turn_X, shemsu_hor_turn)
				cco_table.DisplayName = display_name

				local logged_items_turn = shemsu_hor_cycle_start_turn + shemsu_hor_turn
				if current_turn >= logged_items_turn then
					-- this is the current or a past turn
					court.ui.display_passed_turn_action_log(cco_table, action_indicator_component, logged_items_turn, current_turn)
				else
					action_indicator_component:SetText(court.ui.get_roman_numerals_text(shemsu_hor_turn))
				end

				if shemsu_hor_turn == shemsu_hor.get_shemsu_hor_period() then
					cco_table.Alert = get_localised_random_string(court.ui.config.localization_keys.can_not_start_plots_shemsu_hor)
					cco_table.Alert = cco_table.Alert .. "\n"
					cco_table.Alert = cco_table.Alert .. get_localised_random_string(court.ui.config.localization_keys.requests_refresh_next_turn)
					cco_table.show_title_separator = true
				end

				local script_id = "player_indicator_turn" .. shemsu_hor_turn
				action_indicator_component:SetProperty("script_id", script_id)
				common.set_context_value(script_id, cco_table)
			end
		end
	end,

	display_non_shemsu_hor_log = function()
		local current_turn = cm:model():turn_number()
		-- there are a fixed number of slots in the UI.
		-- each slot can show multiple actions that happened on that turn in a tooltip
		local shown_log_slots = court.ui.config.log_items_slots
		local oldest_log_start_turn = current_turn - shown_log_slots

		for log_slot_index = 1, shown_log_slots do
			local component_name = "slot_" .. log_slot_index
			local slot_component = court.ui.components.referenced_components[component_name]
			if slot_component then
				local action_indicator_component = slot_component:SequentialFind(court.ui.config.component_ids.action_indicator)
				local cco_table = {}
				local logged_items_turn = current_turn + (- shown_log_slots + log_slot_index)
				local display_name, _ = get_localised_random_string_and_source_formatted(court.ui.config.localization_keys.turn_X, logged_items_turn)
				cco_table.DisplayName = display_name
				court.ui.display_passed_turn_action_log(cco_table, action_indicator_component, logged_items_turn, current_turn)

				local script_id = "player_indicator_turn" .. log_slot_index
				action_indicator_component:SetProperty("script_id", script_id)
				common.set_context_value(script_id, cco_table)
			end
		end
	end,

	-- log_turn is the turn we want to show info for
	display_passed_turn_action_log = function(cco_table, component, log_turn, current_turn)
		local turn_str = tostring(log_turn)
		local taken_actions = {}
		local faction_court = court.ui.data.faction_court
		local logged_items = court.persistent.court_log[turn_str]
		if logged_items then
			for _, logged_item in ipairs(logged_items) do
				-- this may or may not add logged_item to taken_actions in some form
				court.ui.set_up_logged_action(court.ui.data.local_faction_key, logged_item, taken_actions)
			end
		end

		local used_actions_num = #taken_actions
		cco_table.UsedActions = used_actions_num
		local available_actions = court.util_functions.get_available_court_actions(court.ui.data.local_faction_key)
		local used_all_actions = false
		component:SetText("")
		if log_turn == current_turn then
			if available_actions > 0 then
				local available_actions_str, _ = get_localised_random_string_and_source_formatted(court.ui.config.localization_keys.available_court_actions, available_actions)
				cco_table.Text = available_actions_str

				cco_table.Alert = get_localised_random_string(court.ui.config.localization_keys.using_court_action)
				component:SetState("available")
				component:SetText(available_actions)
			else
				cco_table.Text = get_localised_random_string(court.ui.config.localization_keys.used_actions)
				component:SetState("taken")
			end
		else
			if used_actions_num == 0 then
				cco_table.Text = get_localised_random_string(court.ui.config.localization_keys.no_used_actions)
				component:SetState("skipped")
			else
				cco_table.Text = get_localised_random_string(court.ui.config.localization_keys.used_actions)
				component:SetState("taken")
			end
		end

		-- we add a separator to all items except the last. 
		-- If there is an alert, we need to show the separator for the last as well
		for index, taken_action in ipairs(taken_actions) do
			if index ~= #taken_actions or cco_table.Alert then
				taken_action.show_separator = true
			end
		end
		cco_table.Actions = taken_actions
		cco_table.TakenActionsNumber = #taken_actions
		cco_table.TakenActionsNumberStr = "x" .. tostring(#taken_actions)
		if #taken_actions > 0 then
			local last_action = taken_actions[#taken_actions]
			local action_icon = last_action.action_icon
			cco_table.action_icon = action_icon
		end
		if #taken_actions > 0 or cco_table.Alert then
			cco_table.show_title_separator = true
		end
	end,

	set_up_logged_action = function(faction_key, logged_item, display_actions_list)
		if faction_key ~= logged_item.faction_key then
			return
		end

		local localized_position_name, position_icon, position_obj = nil, nil, nil
		local faction_court = court.ui.data.faction_court
		if logged_item.position_str and logged_item.position_str ~= "" then
			position_obj = court.util_functions.get_court_position(faction_court, logged_item.position_str)
		end

		if position_obj then
			localized_position_name, _ = court.position_functions.get_localized_position_name(position_obj, faction_court)
			position_icon = court.position_functions.get_position_icon(position_obj, faction_court)
		end

		local action = {}
		if logged_item.action_str == "position_gained" then
			local local_faction_display_str = common.get_localised_string("factions_screen_name_" .. faction_key)
			local localized_message_text, _ = get_localised_text_replacement_and_source_formatted(court.ui.config.localization_keys.log_position_gained, "", local_faction_display_str, "", localized_position_name)

			action.action_name = localized_message_text -- common.get_localised_string(court.ui.config.localization_keys.log_position_gained)
			action.action_icon = position_icon
		elseif logged_item.action_str == "intrigue_used" then
			local intrigue_str = logged_item.additional_params[1]
			local intrigue_obj = court.intrigues:get_by_name(intrigue_str)
			action.action_name = common.get_localised_string(intrigue_obj.localization_key)
			action.action_icon = intrigue_obj.icon_path
		elseif logged_item.action_str == "request_used" then
			local request_index = logged_item.additional_params[1]
			if not request_index and position_obj.requests[request_index] then
				return
			end
			local target_localization_key = court.ui.config.localization_keys.log_request_used
			action.action_name = common.get_localised_string(court.ui.config.localization_keys.log_request_used)
			local request_obj = position_obj.requests[request_index]
			action.action_name = court.position_functions.get_localized_request_name(request_obj)
			action.action_icon = request_obj.ui_config.icon_path
		elseif logged_item.action_str == "plot_created" then
			local plot_persistent_data = logged_item.additional_params[1]
			if not plot_persistent_data then
				return
			end
			local plot_config = court.plots:get_plot_config_by_key(plot_persistent_data.plot_key)
			action.action_name = court.plot_functions.get_localized_plot_name(plot_config, faction_court)
			action.action_icon = court.plot_functions.get_plot_icon_path(plot_config, faction_court)
		elseif logged_item.action_str == "dilemma_resolved" then
			local dilemma_type = logged_item.additional_params[1]
			local found_config = table_find(court.dilemma_generation.possible_dilemas, function(e) return e.court_ai_dilemma_type == dilemma_type end)
			if not found_config then
				found_config = court.judge_dilemmas.get_dilemma_by_db_key(dilemma_type)
				if not found_config then
					return
				end
			end

			if is_function(found_config.get_log_string) then
				action.action_name = found_config:get_log_string(logged_item)
			elseif found_config.log_localization_accept_key then
				action.action_name = get_localised_random_string(found_config.log_localization_accept_key)
			else
				local choice = logged_item.additional_params[2]
				-- the choice is 0-based!
				if choice == 0 and found_config.log_localization_choice_1_key then
					action.action_name = get_localised_random_string(found_config.log_localization_choice_1_key)
				elseif choice == 1 and found_config.log_localization_choice_2_key then
					action.action_name = get_localised_random_string(found_config.log_localization_choice_2_key)
				elseif choice == 2 then
					action.action_name = get_localised_random_string(court.judge_dilemmas.postpone)
				else
					return
				end
			end
			-- dilemmas do not show the position, though they may set it as a param for their string
			localized_position_name = nil
			position_icon = nil
		elseif logged_item.action_str == "position_kicked" then
			local kicked_faction = cm:get_faction(logged_item.additional_params[1])
			local faction_display_name = kicked_faction:localised_display_name()
			action.action_name = common.get_localised_string(court.ui.config.localization_keys.kick_from_position_log_key)
			local faction_icon_path = "[[img:" .. kicked_faction:flag_path() .. "\\mon_24.png]][[/img]]"
			action.target_name = localized_position_name .. faction_icon_path
			action.action_icon = court.ui.config.kick_from_position_icon_path
		else
			-- not an action we can log
			return
		end

		if not action.target_name then
			action.target_name = localized_position_name
		end
		action.target_icon = position_icon
		table.insert(display_actions_list, action)
	end,

	display_actions_counter = function()
		local available_actions_this_turn = court.util_functions.get_available_court_actions(court.ui.data.local_faction_key)

		local actions_indicator_component = court.ui.components.referenced_components.actions_indicator
		local state_name = nil
		if available_actions_this_turn <= 0 then
			state_name = court.ui.config.actions_counter_unavailable_state_name
		else
			state_name = court.ui.config.actions_counter_available_state_name
		end
		actions_indicator_component:SetState(state_name)
	end,

	display_available_characters_data = function()
		court.ui.components.referenced_components.unassigned_characters_panel:SetVisible(true)
		local faction_obj = court.ui.data.local_faction_obj
		local available_characters = court.util_functions.get_eligible_characters(court.ui.data.faction_court, faction_obj)

		court.ui.components.referenced_components.no_characters_element:SetVisible(#available_characters == 0)
		court.ui.components.referenced_components.available_characters_element:SetVisible(#available_characters ~= 0)

		if #available_characters == 0 then
			return
		end

		local available_character_template = court.ui.components.templates.available_character_template
		local available_characters_holder = court.ui.components.templates_original_parents.available_character_template_parent
		if (not available_character_template) or (not available_characters_holder) then
			return
		end

		available_characters_holder:DestroyChildren()

		for index, character_obj in ipairs(available_characters) do
			local available_character_component = UIComponent(available_characters_holder:CreateFromComponent(available_character_template:Address(), index))
			local character_cqi = character_obj:command_queue_index()
			local cqi_string = tostring(character_cqi)
			local cco_name = "CcoCampaignCharacter"
			local character_cco = cco(cco_name, cqi_string)
			available_character_component:SetContextObject(character_cco)

			local portrait_component = available_character_component:SequentialFind(court.ui.config.component_ids.available_character_portrait)
			local script_id = "court_available_character_" .. cqi_string
			portrait_component:SetProperty("script_id", script_id)

			local available_character_cco = court.ui.get_available_character_script_cco(character_obj, character_cco)
			common.set_context_value(script_id, available_character_cco)
			local can_give_position = available_character_cco.can_give_position
			if can_give_position == false then
				portrait_component:SetState("inactive")
			else
				portrait_component:SetState("active")
			end
		end
	end,

	-- refreshes the cco for the available character
	set_available_character_script_cco = function(character_obj)
		local available_character_cco = court.ui.get_available_character_script_cco(character_obj)
		local character_cqi = character_obj:command_queue_index()
		local script_id = "court_available_character_" .. tostring(character_cqi)
		common.set_context_value(script_id, available_character_cco)
	end,

	-- character_cco is optional, it creates one if not provided
	get_available_character_script_cco = function(character_obj, character_cco)
		local character_cqi = character_obj:command_queue_index()
		local cqi_string = tostring(character_cqi)
		local can_give_position, error_message = court.util_functions.can_give_own_character_a_position(court.ui.data.faction_court, court.ui.data.local_faction_key, nil, character_obj)

		local available_character_cco = {}
		available_character_cco.Title = character_obj:onscreen_name()

		local localization_key = nil
		if can_give_position then
			local is_selected_character = (court.ui.data.selected_character_CQI == cqi_string)

			if court.ui.data.claim_position_mode then
				localization_key = court.ui.config.localization_keys.assign_character_to_position
			elseif is_selected_character then
				localization_key = court.ui.config.localization_keys.deselect_character
			else
				localization_key = court.ui.config.localization_keys.select_character
			end

			local tooltip_text, tooltip_source = get_localised_random_string_and_source(localization_key)
			available_character_cco.Action = tooltip_text
		else
			local warning_key = court.ui.config.localization_keys.cannot_assign_character_to_position
			local warning_message, tooltip_source = get_localised_random_string_and_source_formatted(warning_key, error_message)
			available_character_cco.Warning = warning_message
		end

		available_character_cco.can_give_position = can_give_position
		if not character_cco then
			local cco_name = "CcoCampaignCharacter"
			character_cco = cco(cco_name, cqi_string)
		end
		available_character_cco.Text = character_cco:Call("CharacterTypeName")
		return available_character_cco
	end,

	hide_available_characters_data = function()
		court.ui.components.referenced_components.unassigned_characters_panel:SetVisible(false)
	end,

	--------------------------------------
	-- plot data - related to active plots

	display_active_plots = function()
		court.ui.hide_all_panels(true)
		court.ui.hide_overview()
		court.ui.data.shown_active_plots = true
		court.ui.data.selected_plot_id = nil
		court.ui.data.selected_plot_index_in_ui = nil
		court.ui.components.instantiated_plot_templates = {}
		court.ui.components.referenced_components.plots_intrigue_button:SetState("inactive")
		court.ui.components.referenced_components.plots_content:SetVisible(true)

		local local_faction = cm:get_local_faction_name(true)
		court.ui.data.own_plots = court.plot_functions:get_plots_owned_by_faction(local_faction)
		court.ui.components.referenced_components.upgrade_plots_holder:SetVisible(false)

		-- plots against the local faction
		court.ui.data.plots_agains_local_faction = {}
		court.ui.data.plots_agains_local_faction = court.plot_functions:get_plots_against_faction(local_faction)

		-- other revealed plots
		local revealed_plots = {}
		revealed_plots = court.plot_functions:get_plots_revealed_to_faction(local_faction)

		court.ui.data.other_plots = {}
		for _, plot_data in ipairs(revealed_plots) do
			-- we already displayed plots against us, so remove them
			if not table_find(court.ui.data.plots_agains_local_faction, plot_data) then
				table.insert(court.ui.data.other_plots, plot_data)
			end
		end

		-- we must also show the plots resolved this turn
		local current_turn = cm:model():turn_number()
		local turn_str = tostring(current_turn)
		local logged_items = court.persistent.court_log[turn_str]
		if logged_items then
			for _, logged_item in ipairs(logged_items) do
				court.ui.sort_logged_plot(local_faction, logged_item, court.ui.data.own_plots, court.ui.data.plots_agains_local_faction, court.ui.data.other_plots)
			end
		end

		local faction_table = court.util_functions.get_faction_persistent_data(local_faction)

		court.ui.display_plot_category(
			court.ui.data.own_plots,
			court.ui.components.referenced_components.own_plots_holder,
			court.ui.components.referenced_components.no_own_plots_txt,
			court.ui.components.referenced_components.own_plots_counter,
			court.ui.config.component_ids.own_plots_notification,
			nil
		)

		court.ui.display_plot_category(
			court.ui.data.plots_agains_local_faction,
			court.ui.components.referenced_components.plots_against_holder,
			court.ui.components.referenced_components.no_plots_against_txt,
			court.ui.components.referenced_components.plots_against_counter,
			court.ui.config.component_ids.plots_against_notification,
			faction_table.unread_log_against_plots_count
		)

		court.ui.display_plot_category(
			court.ui.data.other_plots,
			court.ui.components.referenced_components.other_plots_holder,
			court.ui.components.referenced_components.no_other_plots_txt,
			court.ui.components.referenced_components.other_plots_counter,
			court.ui.config.component_ids.other_plots_notification,
			faction_table.unread_log_other_plots_count
		)

		-- clear unseen plot notifications
		faction_table.unread_log_against_plots_count = 0
		faction_table.unread_log_against_plots_by_turn = {}
		faction_table.unread_log_other_plots_count = 0
		faction_table.unread_log_other_plots_by_turn = {}

		court.ui.components.referenced_components.unread_plots_notification:SetVisible(false)
		court.ui:update_court_button_visibility()
	end,

	display_conspire_plots = function()
		court.ui.data.shown_active_plots = true
		court.ui.hide_overview()
		court.ui.set_black_overlay_visibility(true, true)
		court.ui.data.selected_plot_id = nil
		court.ui.data.selected_plot_index_in_ui = nil
		court.ui.components.instantiated_plot_templates = {}
		court.ui.components.referenced_components.plots_intrigue_button:SetState("inactive")
		court.ui.components.referenced_components.plots_content:SetVisible(true)

		local local_faction = cm:get_local_faction_name(true)
		court.ui.data.own_plots = court.plot_functions:get_plots_owned_by_faction(local_faction)
		court.ui.components.referenced_components.upgrade_plots_holder:SetVisible(true)

		-- conspire needs only the plots which are not max level
		local max_level = court.plot_functions:get_plot_max_level(local_faction)
		local filtered_plots = {}
		for _ , plot in ipairs(court.ui.data.own_plots) do
			local plot_level = plot.plot_level
			if plot_level < max_level and plot.targeted_position ~= court.ui.data.selected_position_key then
				table.insert(filtered_plots, plot)
			end
		end

		court.ui.data.own_plots = filtered_plots

		court.ui.display_plot_category(
			court.ui.data.own_plots,
			court.ui.components.referenced_components.own_plots_holder,
			court.ui.components.referenced_components.no_own_plots_txt,
			court.ui.components.referenced_components.own_plots_counter,
			court.ui.config.component_ids.own_plots_notification,
			nil
		)

		if court.ui.components.referenced_components.plots_against_holder then
			court.ui.components.referenced_components.plots_against_holder:SetVisible(false)
		end

		if court.ui.components.referenced_components.other_plots_holder then
			court.ui.components.referenced_components.other_plots_holder:SetVisible(false)
		end
	end,

	sort_logged_plot = function(local_faction, logged_item, own_plots, plots_agains_local_faction, other_plots)
		if logged_item.action_str ~= "plot_succeeded" 
			and logged_item.action_str ~= "plot_failed"
			and logged_item.action_str ~= "plot_invalidated"
		then
			return -- not a logged plot, we do not sort it
		end

		local plot_persistent_data = logged_item.additional_params[1]
		if plot_persistent_data.target_court_name ~= court.ui.data.faction_court.court_name then
			return -- from another court, we do not sort it
		end

		if plot_persistent_data.plotting_faction == local_faction then
			table.insert(own_plots, plot_persistent_data)
			return
		end

		if plot_persistent_data.targeted_character_family_cqi then
			local family_member_script_interface = cm:get_family_member_by_cqi(plot_persistent_data.targeted_character_family_cqi)
			if family_member_script_interface then
				local character_details_script_interface = family_member_script_interface:character_details()
				if character_details_script_interface and (not character_details_script_interface:is_null_interface()) then
					local faction_obj = character_details_script_interface:faction()
					if faction_obj:name() == local_faction then
						table.insert(plots_agains_local_faction, plot_persistent_data)
						return
					end
				end
			end
		end

		table.insert(other_plots, plot_persistent_data)
	end,

	-- unread_plots_count may be nil
	display_plot_category = function(plot_data_list, plot_holder, no_plots_component, counter_component, notification_component_id, unread_plots_count)
		if not plot_holder then
			court.output("Error: Missing plot category component", 10)
			return
		end

		plot_holder:SetVisible(true)

		local plots_parent = plot_holder:SequentialFind(court.ui.config.component_ids.expanding_plots_list)
		if plots_parent then
			plots_parent:DestroyChildren()
		end

		local plot_template = court.ui.components.templates.plot_template

		for _, plot_data in ipairs(plot_data_list) do
			if plots_parent then
				local plot_component_name = "plot_component_"..plot_data.plot_id
				local new_plot_component = UIComponent(plots_parent:CreateFromComponent(plot_template:Address(), plot_component_name))
				court.ui.display_plot_data(new_plot_component, plot_data)
			end
		end

		if no_plots_component then
			no_plots_component:SetVisible(#plot_data_list == 0)
		end
		if counter_component then
			counter_component:SetStateText(#plot_data_list)
		end

		local notification_component = plot_holder:SequentialFind(notification_component_id)
		if notification_component then
			if is_number(unread_plots_count) and unread_plots_count > 0 then
				notification_component:SetVisible(true)
			else
				notification_component:SetVisible(false)
			end
		end
	end,

	display_plot_data = function(plot_component, plot_data)
		local cco_table = {}

		local local_faction = court.ui.data.local_faction_key
		local is_revealed = table_find(plot_data.revealed_to, local_faction)
		local is_resolved = plot_data.success ~= nil
		local are_details_known = plot_data.plotting_faction == local_faction
			or is_revealed 
			or is_resolved
			or plot_data.invalidated

		local should_show_upgraded = to_bool(court.ui.data.waiting_intrigue) and court.ui.data.hovered_plot_id == plot_data.plot_id
		if should_show_upgraded then
			plot_data = table_deep_copy(plot_data)
			local intrigue_config = court.intrigues:get_by_name(court.ui.data.waiting_intrigue)
			if intrigue_config and intrigue_config.plot_increment then
				local max_possible_level = court.plot_functions:get_plot_max_level(plot_data.plotting_faction)
				plot_data.plot_level = math.min(max_possible_level, plot_data.plot_level + intrigue_config.plot_increment)
			end

			if intrigue_config and intrigue_config.turns_advanced then
				plot_data.resolve_turn = math.max(cm:model():turn_number(), plot_data.resolve_turn - intrigue_config.turns_advanced)
			end

			cco_table.Action = get_localised_text_replacement(court.ui.config.localization_keys.click_to_upgrade_plot)
		end

		if plot_data.killed_plotter then
			-- in the future this icon may be used for many different statuses
			-- but right now the plotter status uses a skull image to indicate the plotter got killed
			-- so we don't have to change it, just show it
			local ploter_killed_icon = plot_component:SequentialFind(court.ui.config.component_ids.plotter_status_icon)
			if ploter_killed_icon then
				ploter_killed_icon:SetVisible(true)
			end
			local text, _ = get_localised_text_replacement_and_source(court.ui.config.localization_keys.killed_by_plotter_key)
			cco_table.Alert = text --"plotter leader was killed for plotting against the wrong person"
		end
		local portrait_left = plot_component:SequentialFind(court.ui.config.component_ids.plot_portrait_left)
		local portrait_right = plot_component:SequentialFind(court.ui.config.component_ids.plot_portrait_right)
		local targeted_faction = court.plot_functions:get_plot_targeted_faction(court.ui.data.faction_court, plot_data)
		if portrait_right and plot_data.targeted_character_family_cqi then
			-- the character might be dead after an assassination, so we use the family member instead
			local family_member_script_interface = cm:get_family_member_by_cqi(plot_data.targeted_character_family_cqi)
			if family_member_script_interface then
				cco_table.RightRoundPortaitPath = family_member_script_interface:round_portrait_path()
				local character_details_script_interface = family_member_script_interface:character_details()
				if character_details_script_interface and (not character_details_script_interface:is_null_interface()) then
					local faction_obj = character_details_script_interface:faction()
					local faction_key = faction_obj:name()
					cco_table.RightFactionKey = faction_key				
					local flag_right_component = plot_component:SequentialFind(court.ui.config.component_ids.plot_flag_right)
					if flag_right_component then
						flag_right_component:SetContextObject(cco("CcoCampaignFaction", faction_key))
					end
				end
			end
		end

		table.insert(court.ui.components.instantiated_plot_templates, plot_component)
		cco_table.PlotIndexInUI = #court.ui.components.instantiated_plot_templates
		cco_table.PlotId = plot_data.plot_id

		if are_details_known then
			court.ui.fill_known_plot_data(plot_component, cco_table, plot_data)
			if portrait_left then
				if plot_data.killed_plotter then
					portrait_left:SetState("killed")
				end
			end
		else
			cco_table.SuccessState = "unrevealed"
			cco_table.SuccessPercentage = "?"
			cco_table.PlotName = get_localised_random_string(court.ui.config.localization_keys.unknown_plot)
			cco_table.DisplayName = get_localised_text_replacement(court.ui.config.localization_keys.plot_unrevealed)
			cco_table.Warning = get_localised_text_replacement(court.ui.config.localization_keys.plot_reveal_by_gossip)

			if portrait_left then
				portrait_left:SetState("unrevealed")
			end
		end

		local script_id = "court_plots_" .. plot_data.plot_id
		-- if should_show_upgraded is true we just update the cco table, the component was already set up
		-- check if we can move this as else to the should_show_upgraded above
		if not should_show_upgraded then
			plot_component:SetTooltipText("{{tt:ui/common ui/tooltip_court_plots}}", "", true)
			plot_component:SetProperty("script_id", script_id)
		end
		common.set_context_value(script_id, cco_table)
	end,

	fill_known_plot_data = function(plot_component, cco_table, plot_data)
		local faction_court_obj = court.util_functions.get_faction_court_by_name(plot_data.target_court_name)
		local faction_obj = cm:get_faction(plot_data.plotting_faction)
		local target_position_obj = court.util_functions.get_court_position(faction_court_obj, plot_data.targeted_position)
		local leader_character_obj = faction_obj:faction_leader()

		local family_member = nil
		if leader_character_obj and not leader_character_obj:is_null_interface() then
			family_member = leader_character_obj:family_member()
		else
			-- the faction may be dead so faction_leader() will not return a valid character
			if plot_data.targeted_character_family_cqi then
				family_member = cm:get_family_member_by_cqi(plot_data.targeted_character_family_cqi)
			end
		end
		local is_resolved = plot_data.success ~= nil
		local icon_path = court.position_functions.get_position_icon(target_position_obj, court.ui.data.faction_court)
		local position_loc_key = court.position_functions.get_position_name_localization_key(target_position_obj, faction_court_obj)
		local plot_config = court.plots:get_plot_config_by_key(plot_data.plot_key)
		
		cco_table.LeftRoundPortaitPath = family_member:round_portrait_path()
		cco_table.LeftFactionKey = plot_data.plotting_faction
		cco_table.PlotName = court.plot_functions.get_localized_plot_name(plot_config, faction_court_obj)
		cco_table.DisplayName = cco_table.PlotName

		cco_table.Level = court.ui.get_roman_numerals_text(plot_data.plot_level)
		cco_table.Visibility = "revealed"
		cco_table.Own = plot_data.plotting_faction == court.ui.data.local_faction_key
		cco_table.RevealedCounter = #plot_data.revealed_to
		cco_table.PlottingFactionKey = plot_data.plotting_faction

		cco_table.IconPath = court.plot_functions.get_plot_icon_path(plot_config, faction_court_obj)
		cco_table.PositionName = common.get_localised_string(position_loc_key)
		cco_table.PlottingFaction = plot_data.plotting_faction
		cco_table.PositionIconPath = icon_path

		cco_table.DisplayType = get_localised_random_string(court.ui.config.localization_keys.type_plot)
		if plot_data.success then
			cco_table.Text, _ = get_localised_text_replacement_and_source_formatted(plot_config.localization_key_success, cco_table.PositionName)
			cco_table.SuccessState = "positive"
			plot_component:SetState("inactive")
		-- !plot_data.success could also be nil, so we can't simply use "if not plot_data.success then"!
		elseif plot_data.success == false then
			cco_table.Text, _ = get_localised_text_replacement_and_source_formatted(plot_config.localization_key_failed, cco_table.PositionName)
			cco_table.SuccessState = "negative"
			plot_component:SetState("inactive")
		elseif plot_data.invalidated then
			cco_table.Text = get_localised_random_string(court.ui.config.localization_keys.plot_invalid)
			cco_table.SuccessFailTooltip = get_localised_random_string(court.ui.config.localization_keys.plot_invalid)
			cco_table.SuccessState = "invalid"
			plot_component:SetState("inactive")
		else
			cco_table.Text = court.plot_functions.get_effect_info_for_existing_plot(plot_data)
			plot_component:SetState("default")
		end

		if (not is_resolved) and (not plot_data.invalidated) then
			court.ui.fill_known_active_plot_data(cco_table, plot_config, plot_data, target_position_obj)
		end

		local flag_left_component = plot_component:SequentialFind(court.ui.config.component_ids.plot_flag_left)
		if flag_left_component then
			flag_left_component:SetContextObject(cco("CcoCampaignFaction", faction_obj:name()))
		end
	end,

	fill_known_active_plot_data = function(cco_table, plot_config, plot_data, target_position_obj)
		local success_percentage, breakdown = court.plot_functions:calculate_chance(plot_config, plot_data, target_position_obj, true, true)
		cco_table.SuccessBreakdown, _ = get_localised_text_replacement_and_source(court.ui.config.localization_keys.success_chance_header)
		for _, breakdown_element in ipairs(breakdown) do
			cco_table.SuccessBreakdown = cco_table.SuccessBreakdown .. "\n " .. breakdown_element
		end
		if success_percentage > court.ui.config.plot_percentage_positive then
			cco_table.SuccessState = "positive"
		elseif success_percentage > court.ui.config.plot_percentage_neutral then
			cco_table.SuccessState = "neutral"
		else
			cco_table.SuccessState = "negative"
		end
		cco_table.SuccessPercentage = tostring(success_percentage) .. "%"

		if not shemsu_hor.is_active then
			-- display data for plot progression if it is not controlled using Shemsu Hor
			local current_turn = cm:model():turn_number()
			cco_table.create_turn = plot_data.create_turn or current_turn
			cco_table.end_turn = plot_data.resolve_turn or plot_data.create_turn + 1
			cco_table.Duration = cco_table.end_turn - current_turn
			cco_table.full_duration = cco_table.end_turn - cco_table.create_turn
			cco_table.DisplayName = cco_table.PlotName
		end
	end,

	hide_active_plots = function()
		court.ui.data.shown_active_plots = false
		court.ui.components.referenced_components.plots_content:SetVisible(false)
		if court.ui.data.waiting_intrigue then 
			court.ui.data.waiting_intrigue = nil
		end
	end,

	-- end plot data
	--------------------------------------
	-- position elements
	display_court_position_cards = function(faction_court)
		local position_card_template = court.ui.components.templates.court_position_template
		if not position_card_template then
			court.output("Error: missing position_card_template", 10)
			return
		end

		local first_row_positions_component = court.ui.components.referenced_components.first_row_positions
		first_row_positions_component:DestroyChildren()

		local second_row_positions_component = court.ui.components.referenced_components.second_row_positions
		second_row_positions_component:DestroyChildren()

		-- the ruling position os not counted, thus we can't use the default index and need a new one
		local non_ruler_index = 1
		for index, position_obj in ipairs(faction_court.positions) do
			if position_obj.name ~= faction_court.config.ruler_position then
				if non_ruler_index <= court.ui.config.first_row_capacity then
					court.ui.display_court_position_card(position_obj, first_row_positions_component)
				else
					court.ui.display_court_position_card(position_obj, second_row_positions_component)
				end
				non_ruler_index = non_ruler_index + 1
			end
		end

		court.ui.display_heir_indicator(faction_court)
	end,

	-- position_obj is the court position table
	-- row_component is the parent object of the position card
	-- works with positions using the template component NOT the pharaoh
	display_court_position_card = function(position_obj, row_component)
		if not court.ui.components.templates.court_position_template then
			return
		end

		local position_card_template = court.ui.components.templates.court_position_template

		local cco_table = court.ui.get_court_position_card_table(position_obj)
		common.set_context_value(position_obj.name, cco_table)
		position_card_template:SetProperty("script_id", position_obj.name)
		if not court.ui.data.position_data then
			court.ui.data.position_data = {}
		end
		court.ui.data.position_data[position_obj.name] = cco_table

		local portrait_component = position_card_template:SequentialFind(court.ui.config.component_ids.court_position_portrait)
		if portrait_component then
			portrait_component:SetProperty("script_id", position_obj.name)
		end

		local new_position_card_component = UIComponent(row_component:CreateFromComponent(position_card_template:Address(), string.format(position_obj.name)))
		table.insert(court.ui.components.instantiated_templates, new_position_card_component)
		if not court.ui.data.position_components_by_key then 
			court.ui.data.position_components_by_key = {}
		end
		court.ui.data.position_components_by_key[position_obj.name] = new_position_card_component

		if position_obj.persistent.current_holder ~= nil then
			local position_character_obj = cm:get_character(position_obj.persistent.current_holder)
			if position_character_obj then
				local cqi_string = tostring(position_character_obj:command_queue_index())
				local cco_name = "CcoCampaignCharacter"
				new_position_card_component:SetContextObject(cco(cco_name, cqi_string))
			end
		end

		court.ui.set_up_portrait_actions(new_position_card_component, position_obj)

		local help_page_key = court.position_functions.get_position_help_page_key(position_obj, court.ui.data.faction_court)
		if help_page_key then
			-- the previous portrait_component was from the template, we need the one from the new component
			portrait_component = new_position_card_component:SequentialFind(court.ui.config.component_ids.court_position_portrait)
			if portrait_component then
				portrait_component:SetProperty("help_page_key", help_page_key)
				portrait_component:SetProperty("help_page_cursor", 0)
				portrait_component:SetProperty("help_page_open_on_right_click", 1)
			end
		end

		local vacant_position_indicator = new_position_card_component:SequentialFind(court.ui.config.component_ids.vacant_position_indicator)
		if vacant_position_indicator then
			vacant_position_indicator:SetVisible(position_obj.persistent.current_holder == nil)
		end

		local heir_indicator_component = new_position_card_component:SequentialFind(court.ui.config.component_ids.court_heir_indicator)
		if heir_indicator_component then
			heir_indicator_component:SetVisible(to_bool(cco_table.is_dynasty_heir))
		end
	end,

	get_court_position_card_table = function(position_obj)
		local faction_court = court.ui.data.faction_court
		local cco_table = {}
		cco_table.name = position_obj.name
		cco_table.display_name = court.position_functions.get_localized_position_name(position_obj, faction_court)

		local icon_path = court.position_functions.get_position_icon(position_obj, faction_court)
		if icon_path ~= nil then
			cco_table.position_icon_path = icon_path
		else
			cco_table.position_icon_path = court.ui.config.default_position_path
		end

		local local_faction_key = court.ui.data.local_faction_key
		local regard_cost = court.util_functions.get_property(local_faction_key, "request_regard_cost")

		cco_table.vacant = position_obj.persistent.current_holder == nil
		if local_faction_key == position_obj.persistent.current_holder_faction then
			cco_table.regard = -1
			cco_table.owned = true
			cco_table.portrait_named_color = court.ui.config.attitude_color_player
		else
			local usable_regard, regard = court.position_functions.get_position_regard_data_towards_faction_by_obj(position_obj, local_faction_key)
			cco_table.owned = false
			cco_table.regard = regard
			cco_table.regard_string = tostring(math.floor(regard))
			cco_table.has_enough_regard = usable_regard >= regard_cost

			if position_obj.persistent.current_holder_faction ~= nil then
				local holder_faction_str = position_obj.persistent.current_holder_faction
				local holder_faction = cm:get_faction(holder_faction_str)
				local attitude_category = holder_faction:historical_attitude_category_with(local_faction_key)
				-- lua arrays start from 1 while diplomatic categories start from 0
				cco_table.portrait_named_color = court.ui.config.attitude_colors[attitude_category + 1]
			end
		end

		local position_character_obj = nil

		if position_obj.persistent.current_holder ~= nil then
			position_character_obj = cm:get_character(position_obj.persistent.current_holder)
		end

		local related_settlement_text = ""
		local court_specific_config = court.util_functions.get_position_config_from_court(faction_court, position_obj)
		if court_specific_config then
			local related_region_key = court_specific_config.related_region_key
			if related_region_key then
				local related_region_obj = cm:get_region(related_region_key)
				if related_region_obj and (not related_region_obj:is_null_interface()) then
					local region_localized_name = related_region_obj:localised_display_name()
					local region_localized_text, _ = get_localised_text_replacement_and_source(court.ui.config.localization_keys.related_region)
					related_settlement_text = common.string_safe_format(region_localized_text, region_localized_name, cco_table.display_name)

					local region_owner = related_region_obj:owning_faction()
					if region_owner 
						and (not region_owner:is_null_interface())
						and (not region_owner:is_rebel())
					then
						local owner_localized_text, _ = get_localised_text_replacement_and_source(court.ui.config.localization_keys.related_region_owned_by)
						local parametrised_text = common.string_safe_format(owner_localized_text, region_owner:localised_display_name())
						related_settlement_text = related_settlement_text .. ". \n " .. parametrised_text
					end
				end
			end
		end
		cco_table.related_settlement_text = related_settlement_text
		if position_character_obj == nil then
			cco_table.holding_character_lookup = ""
		else
			cco_table.holding_character_lookup = position_obj.persistent.current_holder
			cco_table.holding_character_obj = position_character_obj
			local character_name = position_character_obj:get_forename()
			cco_table.forename = common.get_localised_string(character_name)

			if cm:is_character_ruler_of_dynasty(position_character_obj) then
				cco_table.epithet = position_character_obj:get_epithet()
			end

			local controlling_faction_key = position_obj.persistent.current_holder_faction
			cco_table.controlling_faction_key = controlling_faction_key
			if cco_table.owned then
				local faction_obj = court.ui.data.local_faction_obj
				cco_table.faction_emblem_tooltip = faction_obj:localised_display_name()
			else
				cco_table.faction_emblem_tooltip = "{{tt:ui/campaign ui/tooltip_diplomacy_relationship}}"
			end
			local legitimacy = court.ui.data.faction_court.court_legitimacy():get_legitimacy(controlling_faction_key)
			cco_table.legitimacy = legitimacy

			local character_details = position_character_obj:character_details()
			if character_details then
				cco_table.is_dynasty_heir = character_details:is_dynasty_heir()
			end
		end

		local added_legitimacy = court.position_functions.get_position_legitimacy_gain(position_obj, local_faction_key)
		cco_table.granted_legitimacy = tostring(added_legitimacy)

		cco_table.description = court.position_functions.get_localized_position_description(position_obj, faction_court)
		cco_table.benefits = court.position_functions.get_localized_position_benefits(position_obj, faction_court, local_faction_key)

		if position_obj.persistent.name == faction_court.config.ruler_position then
			cco_table.can_claim = false
		else
			cco_table.can_claim = true
			local contenders = court.position_functions.get_valid_contender_scores(faction_court, court.ui.data.local_faction_key, court.config.claim_position_cost.min_valid_score_claim_price_calculation)
			contenders = table_stable_sort(contenders, function(a, b) return a.legitimacy > b.legitimacy end)

			-- truncate, we only show the top contenders in the UI
			for i = court.config.claim_position_cost.top_contenders_to_sum + 1, #contenders do
				table.remove(contenders, i)
			end
			cco_table.contender_factions = contenders
			cco_table.contender_number = #contenders

			local cost_obj = court.position_functions.get_claim_position_cost_obj(faction_court, court.ui.data.local_faction_key)
			cost_obj:multiply_by(-1)
			cco_table.cost = cost_obj:to_string()
			if cco_table.cost == "0" then
				cco_table.cost = ""
			end
			local court_action_cost_string = court.ui.get_court_action_cost_string(1)
			cco_table.cost = cco_table.cost .. court_action_cost_string
		end

		cco_table.OwnPlotsExpanded = court.ui.semi_permanent_data.own_plots_expanded[position_obj.name]
		cco_table.AgainstPlotsExpanded = court.ui.semi_permanent_data.against_plots_expanded[position_obj.name]
		return cco_table
	end,

	display_heir_indicator = function(faction_court)
		local heir_container = court.ui.components.referenced_components.heir_container
		if not heir_container then
			return
		end

		local ruling_faction_key = faction_court:ruling_faction()
		if not ruling_faction_key then
			heir_container:SetVisible(false)
			return
		end

		local ruling_faction_obj = cm:get_faction(ruling_faction_key)
		if not ruling_faction_obj then
			heir_container:SetVisible(false)
			return
		end

		local dynasty_heir = ruling_faction_obj:get_dynasty_heir()
		if (not dynasty_heir) or (dynasty_heir:is_null_interface()) then
			heir_container:SetVisible(false)
			return
		end

		-- we just want to know if the heir has a position or not, the order does not matter so dpairs works
		for _position_key, position_table in dpairs(court.ui.data.position_data) do
			if position_table.is_dynasty_heir then
				heir_container:SetVisible(false)
				return
			end
		end
		
		local cco_character = cco("CcoCampaignCharacter", dynasty_heir:command_queue_index())
		heir_container:SetContextObject(cco_character)
		local cco_table = court.ui.get_court_heir_table(dynasty_heir)
		local selected_position_script_id = "heir_info"
		common.set_context_value(selected_position_script_id, cco_table)
		heir_container:SetProperty("script_id", selected_position_script_id)
		heir_container:SetVisible(true)
	end,

	get_court_heir_table = function(heir_character_obj)
		local faction_court = court.ui.data.faction_court
		local heir_faction_obj = heir_character_obj:faction()
		local heir_faction_key = heir_faction_obj:name()

		local cco_table = {}
		cco_table.display_name = get_localised_text_replacement(court.ui.config.localization_keys.dynasy_heir)

		local icon_path = nil--court.position_functions.get_position_icon(position_obj, faction_court)
		if icon_path ~= nil then
			cco_table.position_icon_path = icon_path
		else
			cco_table.position_icon_path = court.ui.config.default_position_path
		end

		local local_faction_key = court.ui.data.local_faction_key

		cco_table.vacant = false
		if local_faction_key == heir_faction_key then
			cco_table.regard = -1
			cco_table.owned = true
			cco_table.portrait_named_color = court.ui.config.attitude_color_player
		else
			cco_table.owned = false
			cco_table.regard = -1
			local attitude_category = heir_faction_obj:historical_attitude_category_with(local_faction_key)
			-- lua arrays start from 1 while diplomatic categories start from 0
			cco_table.portrait_named_color = court.ui.config.attitude_colors[attitude_category + 1]
		end

		local family_member_cqi = heir_character_obj:family_member():command_queue_index()
		cco_table.holding_character_lookup = "family_member_cqi:"..family_member_cqi

		cco_table.holding_character_obj = heir_character_obj
		local character_name = heir_character_obj:get_forename()
		cco_table.forename = common.get_localised_string(character_name)

		cco_table.controlling_faction_key = heir_faction_key
		if cco_table.owned then
			local faction_obj = court.ui.data.local_faction_obj
			cco_table.faction_emblem_tooltip = faction_obj:localised_display_name()
		else
			cco_table.faction_emblem_tooltip = "{{tt:ui/campaign ui/tooltip_diplomacy_relationship}}"
		end
		local legitimacy = court.ui.data.faction_court.court_legitimacy():get_legitimacy(heir_faction_key)
		cco_table.legitimacy = legitimacy
		cco_table.is_dynasty_heir = true

		cco_table.benefits = {
			benefit_text = "[[img:phar_main_icon_bulletpoint]][[/img]] " .. get_localised_text_replacement(court.ui.config.localization_keys.dynasy_heir_benefit)
			--This character will Succeed the Supreme Leader after their death."
		}

		return cco_table
	end,

	set_up_portrait_actions = function(position_component, position_obj)
		local current_holder_faction_key = position_obj.persistent.current_holder_faction

		-- first we log the active plots
		local targeted_by_plots_list_component = position_component:SequentialFind(court.ui.config.component_ids.targeted_by_plots_list)
		targeted_by_plots_list_component:DestroyChildren()
		local own_plots_list_component = position_component:SequentialFind(court.ui.config.component_ids.own_plots_list)
		own_plots_list_component:DestroyChildren()
		local own_plots_num = 0
		local against_plots_num = 0
		if targeted_by_plots_list_component then
			local court_obj = court.ui.data.faction_court
			local plots_agains_position = court.plot_functions:get_plots_against_position(court_obj, position_obj)
			-- list plots targeting this position in targeted_by_plots_list_component
			for _, plot_persistent_data in ipairs(plots_agains_position) do
				court.ui.display_portrait_action(targeted_by_plots_list_component, plot_persistent_data, true)
			end
			against_plots_num = #plots_agains_position
		end
		local is_primary_position = false
		if current_holder_faction_key then
			local faction_table = court.util_functions.get_faction_persistent_data(current_holder_faction_key)
			is_primary_position = faction_table.owned_positions[1] == position_obj.name or faction_table.owned_positions[1] == position_obj.alt_name
			-- we only show the plots by the faction on its primary position
			if is_primary_position then
				local own_plots = court.plot_functions:get_plots_owned_by_faction(current_holder_faction_key)
				for _, plot_persistent_data in ipairs(own_plots) do
					court.ui.display_portrait_action(own_plots_list_component, plot_persistent_data, false)
				end
				own_plots_num = #own_plots
			end
		end

		-- then we show the plots which failed or succeeded on this turn
		local current_turn = cm:model():turn_number()
		local turn_str = tostring(current_turn)
		if court.persistent.court_log[turn_str] then
			local logged_items = court.persistent.court_log[turn_str]
			for _, logged_item in ipairs(logged_items) do
				if logged_item.action_str == "plot_succeeded" then
					local plot_persistent_data = logged_item.additional_params[1]
					if court.ui.data.faction_court.court_name == plot_persistent_data.target_court_name then
						if plot_persistent_data.plotting_faction == current_holder_faction_key and is_primary_position then
							if court.ui.display_portrait_action(own_plots_list_component, plot_persistent_data, false, true) then
								own_plots_num = own_plots_num + 1
							end
						elseif position_obj.name == plot_persistent_data.targeted_position then
							if court.ui.display_portrait_action(targeted_by_plots_list_component, plot_persistent_data, true, true) then
								against_plots_num = against_plots_num + 1
							end
						end
					end
				elseif logged_item.action_str == "plot_failed" then
					local plot_persistent_data = logged_item.additional_params[1]
					if court.ui.data.faction_court.court_name == plot_persistent_data.target_court_name then
						if plot_persistent_data.plotting_faction == current_holder_faction_key and is_primary_position then
							if court.ui.display_portrait_action(own_plots_list_component, plot_persistent_data, false, false) then
								own_plots_num = own_plots_num + 1
							end
						elseif position_obj.name == plot_persistent_data.targeted_position then
							if court.ui.display_portrait_action(targeted_by_plots_list_component, plot_persistent_data, true, false) then
								against_plots_num = against_plots_num + 1
							end
						end
					end
				elseif logged_item.action_str == "plot_invalidated" then
					local plot_persistent_data = logged_item.additional_params[1]
					if court.ui.data.faction_court.court_name == plot_persistent_data.target_court_name then
						if plot_persistent_data.plotting_faction == current_holder_faction_key and is_primary_position then
							if court.ui.display_portrait_action(own_plots_list_component, plot_persistent_data, false, false) then
								own_plots_num = own_plots_num + 1
							end
						elseif position_obj.name == plot_persistent_data.targeted_position then
							if court.ui.display_portrait_action(targeted_by_plots_list_component, plot_persistent_data, true, false) then
								against_plots_num = against_plots_num + 1
							end
						end
					end
				end
			end
		end

		local button_plots_owned = position_component:SequentialFind(court.ui.config.component_ids.button_plots_owned)
		button_plots_owned:SetVisible(own_plots_num > 0)
		button_plots_owned:SetText(tostring(own_plots_num))
		local button_plots_against = position_component:SequentialFind(court.ui.config.component_ids.button_plots_against)
		button_plots_against:SetVisible(against_plots_num > 0)
		button_plots_against:SetText(tostring(against_plots_num))
	end,

	--is_successful can be true or false for resolved plots, or nil for plots still ongoing
	display_portrait_action = function(plot_list_component, plot_data, is_target, is_successful)
		if not plot_list_component then 
			return false
		end

		local plot_indicator_template = court.ui.components.templates.plot_indicator_template
		if not plot_indicator_template then
			return false
		end

		plot_indicator_template:SetTooltipText("{{tt:ui/common ui/tooltip_court_plots}}", "", true)
		local new_plot_component = UIComponent(plot_list_component:CreateFromComponent(plot_indicator_template:Address(), plot_data.plot_id))
		table.insert(court.ui.components.instantiated_templates, new_plot_component)

		local cco_table = {}
		local local_faction = court.ui.data.local_faction_key
		local is_revealed = table_find(plot_data.revealed_to, local_faction)
		local is_known = plot_data.plotting_faction == local_faction or is_revealed
		local plot_config = court.plots:get_plot_config_by_key(plot_data.plot_key)

		if is_known or not is_nil(is_successful) then
			local court_obj = court.ui.data.faction_court
			cco_table.DisplayName = court.plot_functions.get_localized_plot_name(plot_config, court_obj)
			cco_table.IconPath = court.plot_functions.get_plot_icon_path(plot_config, court_obj)
			cco_table.DisplayType = get_localised_random_string(court.ui.config.localization_keys.type_plot)

			local target_position_obj = court.util_functions.get_court_position(court_obj, plot_data.targeted_position)
			local icon_path = court.position_functions.get_position_icon(target_position_obj, court.ui.data.faction_court)
			cco_table.PositionIconPath = icon_path
			local position_loc_key = court.position_functions.get_position_name_localization_key(target_position_obj, court_obj)
			cco_table.PositionName = common.get_localised_string(position_loc_key)

			cco_table.PlottingFactionKey = plot_data.plotting_faction

			if is_successful then
				-- these may be methods in the plot config, if they require specific parameters
				cco_table.Text, _ = get_localised_text_replacement_and_source_formatted(plot_config.localization_key_success, cco_table.PositionName)
				if is_target then
					new_plot_component:SetState("target_successful")
				else
					new_plot_component:SetState("actor_successful")
				end
			elseif is_successful == false then
				-- these may be methods in the plot config, if they require specific parameters
				cco_table.Text, _ = get_localised_text_replacement_and_source_formatted(plot_config.localization_key_failed, cco_table.PositionName)
				if is_target then
					new_plot_component:SetState("target_failed")
				else
					new_plot_component:SetState("actor_failed")
				end
			else
				local success_percentage = court.plot_functions:calculate_chance(plot_config, plot_data, target_position_obj, true)
				cco_table.SuccessPercentage = tostring(success_percentage) .. "%"

				cco_table.Text = court.plot_functions.get_effect_info_for_existing_plot(plot_data)
				if is_target then
					new_plot_component:SetState("target_default")
				else
					new_plot_component:SetState("actor_default")
				end
			end
		else
			cco_table.DisplayName = get_localised_text_replacement(court.ui.config.localization_keys.plot_unrevealed)
			cco_table.Warning = get_localised_text_replacement(court.ui.config.localization_keys.plot_reveal_by_gossip)
			if is_target then
				new_plot_component:SetState("target_unrevealed")
			else
				new_plot_component:SetState("actor_unrevealed")
			end
		end
		local script_id = "court_plots_action_" .. plot_data.plot_id
		new_plot_component:SetProperty("script_id", script_id)
		common.set_context_value(script_id, cco_table)
		return true
	end,

	-- this sets the state of the portrait and frame of the position elements
	-- if set_all_active is set to true, then we return them all to normal - active for portraits and default for frames
	set_position_objects_active_state = function(set_all_active)
		local faction_court = court.ui.data.faction_court
		if not faction_court then
			return
		end
		for index, position_obj in ipairs(faction_court.positions) do
			local position_component = court.ui.data.position_components_by_key[position_obj.name]

			if position_component then
				local portrait_component = position_component:SequentialFind(court.ui.config.component_ids.court_position_portrait)
				local state = "active"
				if not set_all_active then
					if position_obj.persistent.current_holder then
						state = "inactive"
					end
				end
				if portrait_component then
					portrait_component:SetState(state)
				end
				
				local portrait_frame = position_component:SequentialFind(court.ui.config.component_ids.court_position_frame)
				if portrait_frame then
					-- the frames have a bit different states than the portraits
					if set_all_active then
						portrait_frame:SetState("default")
					elseif state == "active" then
						portrait_frame:SetState(state)
					else
						portrait_frame:SetState(state)
					end
				end
			end
		end
	end,
	-- end of position elements
	---------------------------------

	-- position_key can be either "royal_treasurer" or "first_commander", depending on the position that is calling or being influenced
	-- panel_mode can be
	-- "set" when the faction owning the position wants to set the discounts
	-- "learn" when another faction can see the currently prepared discounts
	-- "influence" when another faction can set a single category to a set amount
	display_court_discounts = function(position_key, panel_mode, use_dominance)
		local court_obj = court.ui.data.faction_court
		local position_obj = court.util_functions.get_court_position(court_obj, position_key)
		local discounts = court.discount_functions.get_chosen_discounts(position_obj)
		local influenced_discounts = position_obj.persistent.influenced_discounts or {}

		local effects_list = { }
		for i = 1, #position_obj.position_config.shemsu_hor_possible_effects do
			local discount_effect_table = position_obj.position_config.shemsu_hor_possible_effects[i]

			local discount_amount = discounts[i] or 0
			local influenced_amount = influenced_discounts[i] or -1
			local is_free_to_change = influenced_amount < 0
			table.insert(effects_list, {key = discount_effect_table.effect_id, 
				value = discount_amount, 
				display_string = discount_effect_table.effect_display_name,
				category = discount_effect_table.category or "",
				free_to_change = is_free_to_change,
				})
		end

		local num_influenced_categories = court.discount_functions.get_number_of_categories_to_influence(position_obj, court_obj)
		local discount_sum = court.discount_functions.get_discounts_sum(position_obj, court_obj)
		local description_string = court.ui.parametrize_discount_description(court_obj, position_key, panel_mode, 
			num_influenced_categories, discount_sum,position_obj.position_config.max_discount)

		local panel_settings = 
		{
			faction_court = court_obj.court_name,
			discount_sum = discount_sum,
			num_influenced_categories = num_influenced_categories,
			description_string = description_string,
			max_discount = position_obj.position_config.max_discount,
			panel_mode = panel_mode,
			use_dominance = to_bool(use_dominance),
		}

		court.ui.components.referenced_components.apply_discounts_dialogue:InterfaceFunction("show_with_data", effects_list, panel_settings)
		court.ui.data.discount_position = position_key
	end,

	parametrize_discount_description = function(court_obj, position_key, panel_mode, num_influenced_categories, discount_sum, influenced_value)
		local description_string, description_source = "", ""
		if position_key == "royal_treasurer" then
			if panel_mode == "set" then
				local localized_string, _ = get_localised_text_replacement_and_source_formatted(court_obj.config.localization_keys.treasurer_set_discounts_description, discount_sum)
				description_string = localized_string
			elseif panel_mode == "learn" then
				description_string = get_localised_text_replacement(court_obj.config.localization_keys.treasurer_see_discounts_description)
			elseif panel_mode == "influence" then
				if num_influenced_categories == 1 then
					description_string, description_source = get_localised_text_replacement_and_source_formatted(court_obj.config.localization_keys.treasurer_influence_single_discount_description, influenced_value)
				else
					-- current strings do not have number parameter, but it will most likely be added
					-- we check for it so the parametrization will not crash when string is changed
					local localized_unformatted_string = get_localised_text_replacement(court_obj.config.localization_keys.treasurer_influence_discounts_description)
					local parameters_num = 0
					local next_occurence = 0
					--we use parameters_num as a sanity check to avoid infinite loops if something else breaks
					while to_bool(next_occurence) and parameters_num < 50 do
						next_occurence = string.find(localized_unformatted_string, "%%d", next_occurence + 1, false)
						if to_bool(next_occurence) then
							parameters_num = parameters_num + 1
						end
					end

					if parameters_num == 1 then
						description_string, description_source = get_localised_text_replacement_and_source_formatted(court_obj.config.localization_keys.treasurer_influence_discounts_description, influenced_value)
					elseif parameters_num == 2 then
						description_string, description_source = get_localised_text_replacement_and_source_formatted(court_obj.config.localization_keys.treasurer_influence_discounts_description, num_influenced_categories, influenced_value)
					else
						description_string, description_source = get_localised_text_replacement_and_source(court_obj.config.localization_keys.treasurer_influence_discounts_description)
					end
				end
			else
				court.output("ERROR: trying to use " .. panel_mode .. " mode, which is not supported", 10)
			end
		elseif position_key == "first_commander" then
			if panel_mode == "set" then
				description_string, description_source = get_localised_text_replacement_and_source_formatted(court_obj.config.localization_keys.commander_set_discounts_description, discount_sum)
			elseif panel_mode == "learn" then
				description_string = get_localised_text_replacement(court_obj.config.localization_keys.commander_see_discounts_description)
			elseif panel_mode == "influence" then
				if num_influenced_categories == 1 then
					description_string, description_source = get_localised_text_replacement_and_source_formatted(court_obj.config.localization_keys.commander_influence_single_discount_description, influenced_value)
				else
					-- current strings do not have number parameter, but it will most likely be added
					-- we check for it so the parametrization will not crash when string is changed
					local localized_unformatted_string = get_localised_text_replacement(court_obj.config.localization_keys.treasurer_influence_discounts_description)
					local param_num = string.gsub(localized_unformatted_string, " %%d", "")
					if param_num == 1 then
						description_string, description_source = get_localised_text_replacement_and_source_formatted(court_obj.config.localization_keys.commander_influence_discounts_description, influenced_value)
					else
						description_string, description_source = get_localised_text_replacement_and_source_formatted(court_obj.config.localization_keys.commander_influence_discounts_description, num_influenced_categories, influenced_value)
					end
				end
			else
				court.output("ERROR: trying to use " .. panel_mode .. " mode, which is not supported", 10)
			end
		else
			court.output("ERROR: trying to " .. panel_mode .. " discounts for position that does not support it: " .. position_key, 10)
		end

		return description_string, description_source
	end,
	-------------------------
	-- intrigues
	show_intrigues = function()
		if not court.ui.data.selected_position_key then
			court.output("Error:toggle_intrigues_visibility called when no position is selected")
			return
		end

		court.ui.hide_all_panels(false)
		court.ui.display_position_info_panel(court.ui.data.selected_position_key)

		if not court.ui.components.referenced_components.intrigue_panel then
			return
		end

		court.ui.components.referenced_components.intrigue_panel:SetVisible(true)
		court.ui.data.shown_intrigues = true
		if not court.ui.components.templates.intrigue_request_template then
			court.output("Error: intrigue request template not found")
			return
		end

		if not court.ui.data.selected_position_key then
			return
		end

		local selected_position_obj = court.util_functions.get_court_position(court.ui.data.faction_court, court.ui.data.selected_position_key)
		if not selected_position_obj then
			return
		end

		local available_intrigues_list = court.intrigue_functions.get_list_of_accessible_intrigues(court.ui.data.local_faction_key)

		local support_intrigues = {}
		for _, intrigue_str in ipairs(available_intrigues_list) do
			local intrigue_obj = court.intrigues:get_by_name(intrigue_str)
			if intrigue_obj then
				table.insert(support_intrigues, intrigue_obj)
			else
				court.output("Error: could not find intrigue '".. intrigue_str .. "'", 10)
			end
		end

		court.ui.delete_instanced_requests_intrigues_components()

		local support_intrigue_holder = court.ui.components.referenced_components.support_intrigue_holder
		support_intrigue_holder:DestroyChildren()

		for _, intrigue_obj in ipairs(support_intrigues) do
			if not intrigue_obj.targets_plot then
				local intrigue_component = UIComponent(support_intrigue_holder:CreateFromComponent(court.ui.components.templates.intrigue_request_template:Address(), intrigue_obj.name))
				court.ui.setup_intrigue(intrigue_component, intrigue_obj, selected_position_obj)
				table.insert(court.ui.components.instantiated_requests_intrigues_templates, intrigue_component)
			end
		end
	end,

	show_plot_intrigues = function(plot_id)
		if not plot_id then
			court.output("ERROR: show_plot_intrigues called when no plot is hovered/selected", 10)
			return
		end

		local plot_data = court.plot_functions:get_plot_persistent_data(court.ui.data.faction_court.court_name, plot_id)

		-- this is probably a resolved plot, not an active one - so no plot intrigues for it
		if not plot_data then
			court.ui.hide_plot_intrigues()
			return
		end
		if not court.ui.components.referenced_components.plots_intrigue_panel then
			court.output("ERROR: plots intrigues panel not found", 10)
			return
		end

		if not court.ui.components.templates.intrigue_request_template then
			court.output("ERROR: intrigue request template not found", 10)
			return
		end

		local available_intrigues_list = court.intrigue_functions.get_list_of_accessible_plot_intrigues(court.ui.data.local_faction_key, plot_id)

		local support_intrigues = {}
		for _, intrigue_str in ipairs(available_intrigues_list) do
			local intrigue_obj = court.intrigues:get_by_name(intrigue_str)
			if intrigue_obj then
				table.insert(support_intrigues, intrigue_obj)
			else
				court.output("Error: could not find intrigue '".. intrigue_str .. "'", 10)
			end
		end

		court.ui.delete_instanced_requests_intrigues_components()

		court.ui.components.referenced_components.plots_intrigue_panel:SetVisible(true)
		court.ui.components.referenced_components.plots_intrigue_no_plot_selected_text:SetVisible(false)
		court.ui.data.shown_plot_intrigues = true

		local plot_intrigue_holder = court.ui.components.referenced_components.plots_intrigue_holder
		for _, intrigue_obj in ipairs(support_intrigues) do
			local targeted_position_obj = court.util_functions.get_court_position(court.ui.data.faction_court, plot_data.targeted_position)
			if targeted_position_obj and court.ui.can_use_plot_intrigue(intrigue_obj.name, plot_id) then
				local plot_intrigues_holder = court.ui.components.templates_original_parents.plot_intrigue_template_parent
				local intrigue_component = UIComponent(plot_intrigues_holder:CreateFromComponent(court.ui.components.templates.plot_intrigue_template:Address(), intrigue_obj.name))
				court.ui.setup_plot_intrigue(intrigue_component, intrigue_obj, targeted_position_obj, plot_id)
				table.insert(court.ui.components.instantiated_requests_intrigues_templates, intrigue_component)
			end
		end
	end,

	can_use_plot_intrigue = function(intrigue_key, plot_id)
		if table_find(court.ui.data.own_plots, function(e) return e.plot_id == plot_id end) then
			if not table_find(court.ui.config.plot_intrigues_own, intrigue_key) then
				return false
			end
		elseif table_find(court.ui.data.plots_agains_local_faction, function(e) return e.plot_id == plot_id end) then
			if not table_find(court.ui.config.plot_intrigues_against, intrigue_key) then
				return false
			end
		elseif table_find(court.ui.data.other_plots, function(e) return e.plot_id == plot_id end) then
			if not table_find(court.ui.config.plot_intrigues_other, intrigue_key) then
				return false
			end
		else
			return false
		end

		return true
	end,

	setup_plot_intrigue = function(plot_intrigue_component, intrigue_obj, position_obj, plot_id)
		local player_faction_key = court.ui.data.local_faction_key
		local faction_court = court.ui.data.faction_court
		local intrigue_cco_table = {}

		-- these are system properties
		intrigue_cco_table.name = intrigue_obj.name
		intrigue_cco_table.type = "intrigue"

		-- these are display properties
		intrigue_cco_table.DisplayName = common.get_localised_string(intrigue_obj.localization_key)
		intrigue_cco_table.IconPath = intrigue_obj.icon_path
		intrigue_cco_table.Action = get_localised_random_string(court.ui.config.localization_keys.click_for_action)
		intrigue_cco_table.DisplayType = get_localised_random_string(court.ui.config.localization_keys.type_intrigue)

		local cost_obj = nil
		if is_function(intrigue_obj.get_custom_intrigue_cost_obj) then
			cost_obj = intrigue_obj:get_custom_intrigue_cost_obj(faction_court, position_obj, player_faction_key, plot_id)
		else
			cost_obj = court.intrigue_functions.get_intrigue_full_cost_obj(faction_court, intrigue_obj, player_faction_key, position_obj, nil, plot_id)
		end

		if cost_obj then
			-- we have to make sure to split the positive (gain) and negative (true cost) part
			local gain_obj = cm:create_new_custom_resource_cost()
			gain_obj = cost_obj:copy_cost()
			gain_obj:ensure_positive_resource_costs()
			cost_obj:multiply_by(-1)
			cost_obj:ensure_positive_resource_costs()
			local cost_string = cost_obj:to_string(player_faction_key)
			-- empty costs should be hidden
			if cost_string == "0" then 
				cost_string = ""
			end

			local court_actions_for_intrigue = court.intrigue_functions.get_intrigue_actions_needed(intrigue_obj, player_faction_key, faction_court)

			if is_number(court_actions_for_intrigue) and court_actions_for_intrigue > 0 then
				local court_action_cost_string = court.ui.get_court_action_cost_string(court_actions_for_intrigue)
				cost_string = cost_string .. court_action_cost_string
			end
			if cost_string ~= "" and court.ui.config.show_intrigue_request_plot_cost_in_tooltip then
				intrigue_cco_table.CostStr = cost_string
			end

			local gain_string = gain_obj:to_string(player_faction_key)
			if gain_string ~= "" and gain_string ~= "0" then
				intrigue_cco_table.GainStr = gain_string
			end

			local regard_cost = nil
			if is_function(intrigue_obj.get_regard_needed) then
				regard_cost = intrigue_obj:get_regard_needed(player_faction_key)
			else
				-- can still be nil, which is not a problem
				regard_cost = intrigue_obj.regard_cost
			end
			court.ui:display_intrigue_plot_request_cost(plot_intrigue_component, cost_obj, court_actions_for_intrigue, regard_cost)
		end

		-- intrigues can not go above level 1 under the new design, so we mark the level to be hidden
		intrigue_cco_table.level = -1

		local is_intrigue_accessible, requirements_text = court.intrigue_functions.can_faction_use_intrigue(court.ui.data.faction_court, player_faction_key, intrigue_obj.name, position_obj.name, plot_id)

		intrigue_cco_table.Action = get_localised_random_string(court.ui.config.localization_keys.click_for_action)
		if is_function(intrigue_obj.get_effect_info) then
			intrigue_cco_table.Text = intrigue_obj:get_effect_info(court.ui.data.faction_court, position_obj, player_faction_key, plot_id)

			if is_intrigue_accessible then
				plot_intrigue_component:SetState("default")
			else
				plot_intrigue_component:SetState("inactive")
				intrigue_cco_table.Warning = requirements_text
				-- a warning means the action can not be executed, so we need to hide the acion string
				intrigue_cco_table.Action = ""
			end
	
		else
			script_error("ERROR: Court intrigue not implemented!")
		end

		plot_intrigue_component:SetProperty("script_id", intrigue_obj.name)
		common.set_context_value(intrigue_obj.name, intrigue_cco_table)
	end,

	hide_intrigues = function()
		court.ui.components.referenced_components.intrigue_panel:SetVisible(false)
		court.ui.data.shown_intrigues = nil
		court.output("UI:hiding intrigues")
	end,

	hide_plot_intrigues = function()
		if court.ui.components.referenced_components.plots_intrigue_panel then
			court.ui.components.referenced_components.plots_intrigue_panel:SetVisible(false)
		end
		court.ui.delete_instanced_requests_intrigues_components()
		if court.ui.components.referenced_components.plots_intrigue_no_plot_selected_text then
			court.ui.components.referenced_components.plots_intrigue_no_plot_selected_text:SetVisible(true)
		end
		court.ui.data.shown_plot_intrigues = nil
	end,

	setup_intrigue = function(intrigue_component, intrigue_obj, position_obj)
		local player_faction_key = court.ui.data.local_faction_key
		local faction_court = court.ui.data.faction_court
		local intrigue_cco_table = {}

		-- these are system properties
		intrigue_cco_table.name = intrigue_obj.name
		intrigue_cco_table.type = "intrigue"

		-- these are display properties
		intrigue_cco_table.DisplayName = common.get_localised_string(intrigue_obj.localization_key)
		intrigue_cco_table.IconPath = intrigue_obj.icon_path
		intrigue_cco_table.Action = get_localised_random_string(court.ui.config.localization_keys.click_for_action)
		intrigue_cco_table.DisplayType = get_localised_random_string(court.ui.config.localization_keys.type_intrigue)

		local resource_template_component = intrigue_component:SequentialFind(court.ui.config.component_ids.resource_template)

		-- intrigues can not go above level 1 under the new design, so we mark the level to be hidden
		intrigue_cco_table.level = -1

		local cost_obj = nil
		if is_function(intrigue_obj.get_custom_intrigue_cost_obj) then
			cost_obj = intrigue_obj:get_custom_intrigue_cost_obj(faction_court, position_obj, player_faction_key, court.ui.data.selected_plot_id)
		else
			cost_obj = court.intrigue_functions.get_intrigue_full_cost_obj(faction_court, intrigue_obj, player_faction_key, position_obj)
		end
		cost_obj:multiply_by(-1)
		local court_actions_for_intrigue = court.intrigue_functions.get_intrigue_actions_needed(intrigue_obj, player_faction_key, faction_court)
		local regard_cost = nil
		if is_function(intrigue_obj.get_regard_needed) then
			regard_cost = intrigue_obj:get_regard_needed(player_faction_key)
		else
			-- can still be nil, which is not a problem
			regard_cost = intrigue_obj.regard_cost
		end
		court.ui:display_intrigue_plot_request_cost(intrigue_component, cost_obj, court_actions_for_intrigue, regard_cost)

		if resource_template_component then 
			resource_template_component:SetVisible(false)
		end

		local is_intrigue_accessible, requirements_text = court.intrigue_functions.can_faction_use_intrigue(court.ui.data.faction_court, player_faction_key, intrigue_obj.name, position_obj.name, court.ui.data.selected_plot_id)

		intrigue_cco_table.Action = get_localised_random_string(court.ui.config.localization_keys.click_for_action)
		if is_function(intrigue_obj.get_effect_info) then
			intrigue_cco_table.Text = intrigue_obj:get_effect_info(court.ui.data.faction_court, position_obj, player_faction_key)

			if is_intrigue_accessible then
				intrigue_component:SetState("default")
			else
				intrigue_component:SetState("locked")
				intrigue_cco_table.Warning = requirements_text
				-- a warning means the action can not be executed, so we need to hide the acion string
				intrigue_cco_table.Action = ""
			end
		else
			script_error("ERROR: Court intrigue not implemented!")
		end

		local cooldown_end_turn = court.position_functions.get_position_mark_value(position_obj, intrigue_obj.name, player_faction_key, "cooldown_end_turn")
		if is_number(cooldown_end_turn) then
			local current_turn = cm:model():turn_number()
			if current_turn < cooldown_end_turn then
				intrigue_cco_table.cooldown_remaining = cooldown_end_turn - current_turn
				intrigue_cco_table.cooldown_remaining_str = tostring(intrigue_cco_table.cooldown_remaining)
			end
		end

		intrigue_component:SetProperty("script_id", intrigue_obj.name)
		common.set_context_value(intrigue_obj.name, intrigue_cco_table)
	end,

	get_roman_numerals_text = function(level)
		if level == 1 then
			return "I"
		elseif level == 2 then
			return "II"
		elseif level == 3 then
			return "III"
		elseif level == 4 then
			return "IV"
		elseif level == 5 then
			return "V"
		elseif level == 6 then
			return "VI"
		elseif level == 7 then
			return "VII"
		elseif level == 8 then
			return "VIII"
		else
			return level
		end
		return ""
	end,
	-------------------------------
	-- requests
	show_requests = function(use_dominance)
		if not court.ui.data.selected_position_key then
			court.output("Error:toggle_requests_visibility called when no position is selected")
			return
		end

		court.ui.hide_all_panels(false)
		court.ui.display_position_info_panel(court.ui.data.selected_position_key)

		local panel = nil
		local holder = nil
		if use_dominance then
			panel = court.ui.components.referenced_components.demand_panel
			holder = court.ui.components.referenced_components.demand_holder
		else
			panel = court.ui.components.referenced_components.request_panel
			holder = court.ui.components.referenced_components.request_holder
		end


		if (not panel) or (not holder) then
			return
		end

		panel:SetVisible(true)
		if use_dominance then
			court.ui.data.shown_requests_dominance = true
		else
			court.ui.data.shown_requests = true
		end

		court.output(" showing requests for ".. court.ui.data.selected_position_key)

		if not court.ui.components.templates.intrigue_request_template then
			court.output("Error: intrigue request template not found")
			return
		end

		court.ui.delete_instanced_requests_intrigues_components()

		local court_position_obj = court.util_functions.get_court_position(court.ui.data.faction_court, court.ui.data.selected_position_key)

		-- adding available requests
		local small_request = UIComponent(holder:CreateFromComponent(court.ui.components.templates.intrigue_request_template:Address(), string.format("small_request")))
		table.insert(court.ui.components.instantiated_requests_intrigues_templates, small_request)

		court.ui.setup_request(small_request, 
			"small_request",
			court.developer_config.small_request_index,
			court_position_obj,
			use_dominance)

		local large_request = UIComponent(holder:CreateFromComponent(court.ui.components.templates.intrigue_request_template:Address(), string.format("large_request")))
		table.insert(court.ui.components.instantiated_requests_intrigues_templates, large_request)
		court.ui.setup_request(large_request,
			"large_request",
			court.developer_config.large_request_index,
			court_position_obj,
			use_dominance)
	end,

	hide_requests = function()
		if court.ui.data.shown_requests then
			court.ui.components.referenced_components.request_panel:SetVisible(false)
			court.ui.data.shown_requests = nil
		end

		if court.ui.data.shown_requests_dominance then
			court.ui.components.referenced_components.demand_panel:SetVisible(false)
			court.ui.data.shown_requests_dominance = nil
		end
		court.output("hiding requests")
	end,

	setup_request = function(request_component, name, request_index, court_position_obj, use_dominance)
		local request_cco_table = {}
		-- needed to hide the intrigue level indicator
		request_cco_table.level = -1

		-- system properties
		request_cco_table.name = name
		if use_dominance then
			request_cco_table.type = "request:true"
		else
			request_cco_table.type = "request:false"
		end

		local request_obj = court_position_obj.requests[request_index]
		local faction_key = court.ui.data.local_faction_key
		-- display properties
		local pre_localized_name = request_obj.request_name
		if request_obj.ui_config then
			if request_obj.ui_config.name_localization_key then
				pre_localized_name = request_obj.ui_config.name_localization_key
			end

			if request_obj.ui_config.icon_path then
				request_cco_table.IconPath = request_obj.ui_config.icon_path
			end
		end

		request_cco_table.DisplayName = common.get_localised_string(pre_localized_name)
		request_cco_table.Action = get_localised_random_string(court.ui.config.localization_keys.click_for_action)
		request_cco_table.DisplayType = get_localised_random_string(court.ui.config.localization_keys.type_request)

		local resource_template_component = request_component:SequentialFind(court.ui.config.component_ids.resource_template)
		if resource_template_component then
			resource_template_component:SetVisible(false)
		end

		local regard_cost = court.util_functions.get_property(faction_key, "request_regard_cost")
		local court_actions_needed = court.position_functions.get_request_actions_needed(request_obj, faction_key, court.ui.data.faction_court)

		local cost_obj = nil
		local autopurchase_request_actions = court.util_functions.get_property(faction_key, "can_purchase_court_actions") and court.config.autopurchase_requests
		if autopurchase_request_actions then
			local available_actions = court.util_functions.get_available_court_actions(faction_key)
			local extra_actions_needed = court_actions_needed - available_actions
			if extra_actions_needed > 0 then
				cost_obj = cm:create_new_custom_resource_cost()
				court.util_functions.add_court_action_purchase_cost(faction_key, cost_obj, extra_actions_needed)
				-- costs are transactions with negative resources, to display them we have to make them positive
				cost_obj:multiply_by(-1)
			end
		end

		local dominance_cost = 0
		if use_dominance then
			regard_cost = 0
			dominance_cost = court.config.demand_dominance_cost
		end
		court.ui:display_intrigue_plot_request_cost(request_component, cost_obj, court_actions_needed, regard_cost, dominance_cost)

		request_cco_table.Text = request_obj:get_effect_info(court.ui.data.faction_court, court_position_obj, faction_key)
		local request_accessibility, failure_reason = court.position_functions.can_faction_call_request(court.ui.data.faction_court, faction_key, request_index, court_position_obj.name, use_dominance)
		if request_accessibility then
			request_component:SetState("default")
		else
			request_component:SetState("locked")
			if request_accessibility == false then
				request_cco_table.Warning = failure_reason
				-- a warning means the action can not be executed, so we need to hide the acion string
				request_cco_table.Action = ""
			end
		end
		
		local court_specific_request_bonuses = court.position_functions.get_request_bonus_packs(court.ui.data.faction_court, court_position_obj, request_index)
		if is_table(court_specific_request_bonuses) and #court_specific_request_bonuses > 0 then
			-- the tooltip supports only one bundle, and by design there should be only one
			request_cco_table.EffectBundleKey = court_specific_request_bonuses[1]
		end

		local request_obj = court_position_obj.requests[request_index]
		local request_mark_str = "request_" .. request_index
		local cooldown_end_turn = court.position_functions.get_position_mark_value(court_position_obj, request_mark_str, faction_key, "cooldown_end_turn")
		if is_number(cooldown_end_turn) then
			local current_turn = cm:model():turn_number()
			if current_turn < cooldown_end_turn then
				request_cco_table.cooldown_remaining = cooldown_end_turn - current_turn
				request_cco_table.cooldown_remaining_str = tostring(request_cco_table.cooldown_remaining)
			end
		end
		request_component:SetProperty("script_id", name)
		common.set_context_value(name, request_cco_table)
	end,

	-------------------------------
	-- plots - these are related to buttons for creating new plots

	show_plots = function()
		if not court.ui.data.selected_position_key then
			court.output("Error:show_plots called when no position is selected")
			return
		end

		court.ui.hide_all_panels(false)
		court.ui.display_position_info_panel(court.ui.data.selected_position_key)

		if not court.ui.components.referenced_components.plots_panel then
			return
		end

		court.ui.components.referenced_components.plots_panel:SetVisible(true)
		court.ui.data.shown_plots = true
		if not court.ui.components.templates.intrigue_request_template then
			court.output("Error: intrigue request template not found")
			return
		end

		local selected_position_obj = court.util_functions.get_court_position(court.ui.data.faction_court, court.ui.data.selected_position_key)
		if not selected_position_obj then
			return
		end

		local available_plots_list = court.plot_functions.get_list_of_accessible_plots(court.ui.data.local_faction_key)

		court.ui.delete_instanced_requests_intrigues_components()

		local plots_holder = court.ui.components.referenced_components.plots_holder
		for _, plot_str in ipairs(available_plots_list) do
			local plot_component = UIComponent(plots_holder:CreateFromComponent(court.ui.components.templates.intrigue_request_template:Address(), plot_str))
			court.ui.setup_plot(plot_component, plot_str, selected_position_obj)
			table.insert(court.ui.components.instantiated_requests_intrigues_templates, plot_component)
		end
	end,

	setup_plot = function(plot_component, plot_str, position_obj)
		local plot_config = court.plots:get_plot_config_by_key(plot_str)

		local player_faction_key = court.ui.data.local_faction_key
		local plot_cco_table = {}
		-- system properties
		plot_cco_table.name = plot_config.plot_key
		plot_cco_table.type = "plot"

		-- display properties
		plot_cco_table.DisplayName = court.plot_functions.get_localized_plot_name(plot_config, court.ui.data.faction_court)
		plot_cco_table.IconPath = court.plot_functions.get_plot_icon_path(plot_config, court.ui.data.faction_court)
		plot_cco_table.Action = get_localised_random_string(court.ui.config.localization_keys.click_for_action)
		plot_cco_table.DisplayType = get_localised_random_string(court.ui.config.localization_keys.type_plot)

		local resource_template_component = plot_component:SequentialFind(court.ui.config.component_ids.resource_template)
		if resource_template_component then
			resource_template_component:SetVisible(false)
		end

		local cost_obj = court.plot_functions:get_plot_cost_obj(court.ui.data.faction_court, plot_config.plot_key, court.ui.data.local_faction_key, position_obj)
		cost_obj:multiply_by(-1)
		local cost_string = cost_obj:to_string(player_faction_key)
		-- empty costs should be hidden
		if cost_string == "0" then 
			cost_string = ""
		end

		local court_action_cost =  court.plot_functions.get_plot_actions_needed(court.ui.data.faction_court, plot_config, player_faction_key)
		court.ui:display_intrigue_plot_request_cost(plot_component, cost_obj, court_action_cost)

		if court_action_cost > 0 then
			local court_action_cost_string = court.ui.get_court_action_cost_string(court_action_cost)
			cost_string = cost_string .. court_action_cost_string
		end

		if cost_string ~= "" and court.ui.config.show_intrigue_request_plot_cost_in_tooltip then
			cost_string, _ = get_localised_random_string_and_source_formatted(court.ui.config.localization_keys.cost_param_key, cost_string)
			plot_cco_table.Alert = cost_string
		end

		local plot_accessibility, error_message = court.plot_functions.can_faction_use_plot(court.ui.data.faction_court, player_faction_key, plot_config.plot_key, court.ui.data.selected_position_key)

		plot_cco_table.Text = court.plot_functions.get_effect_info_for_new_plot(court.ui.data.faction_court, position_obj, player_faction_key, plot_config)
		if is_number(plot_config.plot_duration) then
			plot_cco_table.Duration = plot_config.plot_duration
		else
			plot_cco_table.Duration = court.plots.config.default_plot_duration
		end

		if plot_accessibility then
			plot_component:SetState("default")
		else
			plot_component:SetState("locked")
			if plot_accessibility == false then
				plot_cco_table.Warning = error_message
				-- a warning means the action can not be executed, so we need to hide the acion string
				plot_cco_table.Action = ""
			end
		end

		plot_component:SetProperty("script_id", plot_config.plot_key)
		common.set_context_value(plot_config.plot_key, plot_cco_table)
	end,

	hide_plots = function()
		court.ui.components.referenced_components.plots_panel:SetVisible(false)
		court.ui.data.shown_plots = nil
		court.output("UI:hiding plots")
	end,

	on_plot_selected = function(plot_index_in_ui, plot_id)
		if court.ui.data.selected_plot_index_in_ui 
			and court.ui.components.instantiated_plot_templates[court.ui.data.selected_plot_index_in_ui]
		then
			court.ui.components.instantiated_plot_templates[court.ui.data.selected_plot_index_in_ui]:SetState("default")
		end
		court.ui.data.selected_plot_index_in_ui = plot_index_in_ui
		court.ui.components.instantiated_plot_templates[plot_index_in_ui]:SetState("selected_hover")

		court.ui.data.selected_plot_id = plot_id

		court.ui.components.referenced_components.plots_intrigue_button:SetState("default")

		if court.ui.data.shown_plot_intrigues then
			court.ui.show_plot_intrigues(plot_id)
		end
	end,

	on_plot_deselected = function(plot_index_in_ui)
		court.ui.data.selected_plot_index_in_ui = nil
		if court.ui.components.instantiated_plot_templates[plot_index_in_ui] then
			court.ui.components.instantiated_plot_templates[plot_index_in_ui]:SetState("default")
		end
		court.ui.data.selected_plot_id = nil
	end,

	--------------------------------
	-- other

	-- force_show is used when the event for choosing legitimacy is called but the actual legitimacy is not yet updated
	update_court_button_visibility = function(self, force_show)
		local local_faction_key = cm:get_local_faction_name(true)
		if (not local_faction_key) or local_faction_key == "" then
			-- autotest, no visibility update needed
			return
		end

		if cm:model():is_start_turn_autosave_pending() and not cm:is_saving_disabled() then
			-- save is in progress, the button must be disabled
			cm:override_ui("disable_court", true);
			return
		end
		local feature_available = feature_unlock.is_feature_unlocked_for_faction(local_faction_key, feature_ids_config.court)
		-- we remove the cache to recalculate the result
		court.factions_court_cache[local_faction_key] = nil
		local court_obj = court.util_functions.get_faction_court_for_faction(local_faction_key)

		local court_unlocked = feature_available and (court_obj ~= nil) and court_obj ~= false
		if court_unlocked 
			and court_obj.config.locked_until_legitimacy_war_end
		then
			if court_obj.persistent.last_legitimacy_war_winner then
				court_unlocked = true
			else
				court_unlocked = false
			end
		end
		local should_show = force_show
			or court_unlocked
			or false -- of all the previous conditions return nil this forces it to be true/false

		local button_component_id = self.config.component_ids.court_panel_button
		local button_component = core:get_ui_root():SequentialFind(button_component_id)

		if not button_component then
			return
		end

		if should_show and court_obj then
			cm:override_ui("disable_court", false);
			local local_faction_name = cm:get_local_faction_name(true)
			if local_faction_name then
				local icon_alert_component = core:get_ui_root():SequentialFind(court.ui.config.component_ids.icon_alert)
				if icon_alert_component then
					local faction_table = court.util_functions.get_faction_persistent_data(local_faction_name)
					local have_unread_plots = court.log_functions.has_unread_notifications(faction_table)
					icon_alert_component:SetVisible(have_unread_plots)
				end

				self:update_court_button_actions_counter()
			end
		else
			cm:override_ui("disable_court", true);
		end
	end,

	update_court_button_actions_counter = function(self)
		local court_actions_indicator_component = core:get_ui_root():SequentialFind(court.ui.config.component_ids.court_actions_indicator)
		if not court_actions_indicator_component then
			return
		end

		local faction_key = cm:get_local_faction_name(true)
		if not faction_key then
			return
		end

		local available_actions = court.util_functions.get_available_court_actions(faction_key)
		if available_actions == 0 then
			court_actions_indicator_component:SetVisible(false)
			return
		end
		court_actions_indicator_component:SetVisible(true)
		local actions_string = tostring(available_actions)
		court_actions_indicator_component:SetText(actions_string)
	end,

	-- refresh data
	refresh_ui = function()
		court.output("UI: refreshing data")
		court.ui.components.referenced_components.panel:StallLayouts(true)
		court.ui.delete_instanced_components()

		court.ui.display_shemsu_hor_bar()
		court.ui.display_background()
		court.ui.display_general_data(court.ui.data.faction_court)
		court.ui.display_own_faction_data()
		court.ui.display_actions_counter()

		if court.ui.data.shown_active_plots then
			local button_plots = court.ui.components.referenced_components.button_plots
			button_plots:SimulateLClick()
		end

		court.ui.display_court_position_cards(court.ui.data.faction_court)
		if court.ui.data.selected_position_key then
			court.ui.display_position_info_panel(court.ui.data.selected_position_key)
		elseif court.ui.data.selected_pharaoh_cqi then
			court.ui.display_pharaoh_panel()
		else
			court.ui.hide_position_info_panel()
		end

		court.ui.components.referenced_components.panel:StallLayouts(false)
		court.ui.components.referenced_components.panel:Layout()
	end,

	hide_all_panels = function(deselect_position)
		if court.ui.data.shown_intrigues then
			court.ui.hide_intrigues()
		end

		if court.ui.data.shown_plot_intrigues then
			court.ui.hide_plot_intrigues()
		end

		if court.ui.data.shown_requests or court.ui.data.shown_requests_dominance then
			court.ui.hide_requests()
		end

		if deselect_position then
			court.ui.data.selected_position_key = nil
		end

		if court.ui.data.selected_plot_index_in_ui then
			court.ui.on_plot_deselected(court.ui.data.selected_plot_index_in_ui)
		end

		court.ui.data.selected_pharaoh_cqi = nil

		court.ui.hide_position_info_panel()

		-- we hide possible black overlays
		court.ui.set_black_overlay_visibility(false)
		court.ui.set_black_overlay_visibility(false, true)
	end,

	set_black_overlay_visibility = function(should_show, hide_positions)
		local black_overlay_component = court.ui.components.referenced_components.black_overlay
		if hide_positions then
			black_overlay_component = court.ui.components.referenced_components.black_overlay_over_positions
		end
		if black_overlay_component then
			black_overlay_component:SetVisible(should_show)
		end
	end,

	set_claim_position_mode = function(claim_position_mode)
		if court.ui.data.claim_position_mode == claim_position_mode then
			return
		end

		if court.ui.components.referenced_components.available_characters_holder then
			if claim_position_mode then
				court.ui.components.referenced_components.available_characters_holder:SetState("highlight")
			else
				court.ui.components.referenced_components.available_characters_holder:SetState("default")
			end
		end

		if claim_position_mode then
			court.ui.data.claim_position_mode = true
		else
			court.ui.data.claim_position_mode = nil
			if court.ui.components.referenced_components.claim_btn_holder then
				court.ui.components.referenced_components.claim_btn_holder:SetState("active")
			end
		end

		local local_ruling_faction = court.ui.data.faction_court:ruling_faction()
		if local_ruling_faction == court.ui.data.local_faction_key then
			local faction_obj = court.ui.data.local_faction_obj
			local available_characters = court.util_functions.get_eligible_characters(court.ui.data.faction_court, faction_obj)
			for index, character_obj in ipairs(available_characters) do
				court.ui.set_available_character_script_cco(character_obj)
			end
		end
	end,

	-- end of displaying data
	--///////////////////////////////////////////////
	-- handling user interaction with UI elements
	interaction = 
	{
		on_position_interacted = function(position_key)
			if court.ui.data.selected_character_CQI then
				local court_position_obj = court.util_functions.get_court_position(court.ui.data.faction_court, position_key)
				if not court_position_obj.persistent.current_holder then
					local character_obj = cm:get_character_by_cqi(court.ui.data.selected_character_CQI)
					local can_give_position, error_message = court.util_functions.can_give_own_character_a_position(court.ui.data.faction_court, court.ui.data.local_faction_key, court_position_obj, character_obj)

					if not can_give_position then
						return
					end
				else
					-- the position is occupied, select it and deselect the avaialble character
					-- or maybe do nothing, talk with designers
					court.ui.data.selected_character_CQI = nil
					court.ui.set_black_overlay_visibility(false)
				end
			end

			if position_key == court.ui.data.selected_position_key then
				court.ui.data.selected_position_key = nil
			else
				-- nil here is also valid for deselection
				court.ui.data.selected_position_key = position_key
				court.ui.data.selected_heir_obj = nil
			end

			if court.ui.data.selected_position_key then
				court.ui.display_position_info_panel(court.ui.data.selected_position_key)
			else
				court.ui.hide_position_info_panel()
			end
		end,

		on_related_region_interacted = function(position_key)
			local position_obj = court.util_functions.get_court_position(court.ui.data.faction_court, position_key)
			local court_specific_config = court.util_functions.get_position_config_from_court(court.ui.data.faction_court, position_obj)
			if not court_specific_config then
				return
			end

			local related_region_key = court_specific_config.related_region_key
			if not related_region_key then
				return
			end

			local related_region_obj = cm:get_region(related_region_key)
			if (not related_region_obj) or related_region_obj:is_null_interface() then
				return
			end

			court.ui.components.referenced_components.panel:InterfaceFunction("close_panel")
			cm:scroll_camera_to_settlement(related_region_key)
		end,

		on_heir_interacted = function()
			if court.ui.data.selected_character_CQI then
				court.ui.data.selected_character_CQI = nil
				court.ui.set_black_overlay_visibility(false)
			end

			if court.ui.data.selected_position_key then
				court.ui.data.selected_position_key = nil
			end

			if court.ui.data.selected_heir_obj then
				court.ui.data.selected_heir_obj = nil
			else
				local ruling_faction_key = court.ui.data.faction_court:ruling_faction()
				local ruling_faction_obj = cm:get_faction(ruling_faction_key)

				local dynasty_heir = ruling_faction_obj:get_dynasty_heir()
				if dynasty_heir and (not dynasty_heir:is_null_interface())then
					court.ui.data.selected_heir_obj = dynasty_heir
				end
			end

			if court.ui.data.selected_heir_obj then
				court.ui.display_heir_info_panel(court.ui.data.selected_heir_obj)
			else
				court.ui.hide_position_info_panel()
			end
		end,

		on_toggle_plot_expand_all_positions = function()
			-- first we check if there is at least one unexpanded - if so, we need to expand everything
			local everything_expanded = false
			for index, position_obj in ipairs(court.ui.data.faction_court.positions) do
				if ((not court.ui.semi_permanent_data.own_plots_expanded[position_obj.name])
					or (not court.ui.semi_permanent_data.against_plots_expanded[position_obj.name]))
				then
					-- we found something that needs expanding
					everything_expanded = true
					break
				end
			end

			-- then we go and set all of them to expand or contract
			for index, position_obj in ipairs(court.ui.data.faction_court.positions) do
				court.ui.interaction.on_toggle_plot_expand_position_interacted(position_obj.name, true, everything_expanded)
				court.ui.interaction.on_toggle_plot_expand_position_interacted(position_obj.name, false, everything_expanded)
			end
		end,

		-- if force_expand is true or false - this is the state that will be set
		-- if nil - we toggle from the current state
		on_toggle_plot_expand_position_interacted = function(position_key, own_plots, force_expand)
			if own_plots then
				if force_expand == true or force_expand == false then
					court.ui.semi_permanent_data.own_plots_expanded[position_key] = force_expand
				else
					local new_state = not court.ui.semi_permanent_data.own_plots_expanded[position_key]
					court.ui.semi_permanent_data.own_plots_expanded[position_key] = new_state
				end
			else
				if force_expand == true or force_expand == false then
					court.ui.semi_permanent_data.against_plots_expanded[position_key] = force_expand
				else
					local new_state = not court.ui.semi_permanent_data.against_plots_expanded[position_key]
					court.ui.semi_permanent_data.against_plots_expanded[position_key] = new_state
				end
			end

			local position_obj = court.util_functions.get_court_position(court.ui.data.faction_court, position_key)
			local cco_table = court.ui.get_court_position_card_table(position_obj)
			common.set_context_value(position_obj.name, cco_table)
		end,

		deselect_all = function()
			if court.ui.data.waiting_intrigue then
				court.ui.data.additional_plot_selection_id = nil
				court.ui.data.waiting_intrigue = nil
				court.ui.hide_all_panels(true)
				court.ui.refresh_ui()
			end

			if court.ui.data.selected_position_key and court.ui.data.position_components_by_key then
				local selected_pos_component = court.ui.data.position_components_by_key[court.ui.data.selected_position_key]
				if selected_pos_component then
					local portrait_component = selected_pos_component:SequentialFind(court.ui.config.component_ids.
					court_position_portrait)
					if not portrait_component then
						return
					end

					-- we simulate a click instead of setting court.ui.data.selected_position_key because the UI needs to have its state set back to default
					portrait_component:SimulateLClick()
					return
				end
			end

			court.ui.hide_all_panels(false)
		end,

		on_pharaoh_interacted = function(str_character_cqi)
			local character_cqi = tonumber(str_character_cqi)
			if character_cqi == court.ui.data.selected_pharaoh_cqi then
				court.ui.data.selected_pharaoh_cqi = nil
			else
				court.ui.data.selected_pharaoh_cqi = character_cqi
			end
			court.ui.display_pharaoh_panel()
		end,

		on_available_character_interacted = function(character_cqi)
			court.output("on_available_character_interacted" .. character_cqi)
			local character_obj = cm:get_character_by_cqi(character_cqi)

			if court.ui.data.selected_character_CQI == character_cqi then
				court.ui.data.selected_character_CQI = nil
				court.ui.set_position_objects_active_state(true)
				court.ui.set_black_overlay_visibility(false)
				court.ui.set_available_character_script_cco(character_obj)
				-- we must refresh the claim position button tooltip
				court.ui.setup_claim_position_button()
				return
			end

			local faction_court = court.ui.data.faction_court
			if court.ui.data.selected_position_key then 
				local court_position_obj = court.util_functions.get_court_position(faction_court, court.ui.data.selected_position_key)
				if court_position_obj.persistent.current_holder then
					-- the selected position is occupied, we deselect it
					court.ui.data.selected_position_key = nil
				else
					local can_give_position, error_message = court.util_functions.can_give_own_character_a_position(faction_court, court.ui.data.local_faction_key, court_position_obj, character_obj)

					if not can_give_position then
						return
					end

					court.ui.data.selected_character_CQI = character_cqi
					court.ui.set_position_objects_active_state(false)
					court.ui.set_black_overlay_visibility(true)

					if court.ui.data.claim_position_mode then
						local position_localization_key = court.position_functions.get_position_name_localization_key(court_position_obj, faction_court)
						local position_localized_string = common.get_localised_string(position_localization_key)
						local character_display_nasme = character_obj:onscreen_name()
						local confirmation_string, confirmation_source = get_localised_text_replacement_and_source_formatted(court.ui.config.localization_keys.claim_position_confirmation_key, character_display_nasme, position_localized_string)

						local title_string, title_source = get_localised_text_replacement_and_source(court.ui.config.localization_keys.claim_position_key, character_display_nasme, position_localized_string)
						create_confirmation_box_with_text_from_script(
							"court_claim_position_prompt",
							confirmation_string, confirmation_source,
							function()
								-- the selected position is vacant, we try to give it to the selected character
								local faction_court_name = faction_court.court_name
								local calling_faction_key = court.ui.data.local_faction_key
								local position_key = court.ui.data.selected_position_key

								local local_faction_obj = court.ui.data.local_faction_obj
								local local_faction_cqi = local_faction_obj:command_queue_index()

								local param_str = "court_action:give_position:" .. faction_court_name .. ":" .. calling_faction_key .. ":" .. position_key .. ":" .. character_cqi
								CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, param_str)
								court.ui.set_black_overlay_visibility(false)
							end,
							function()
								court.ui.set_claim_position_mode(false)
								local claim_btn_holder = court.ui.components.referenced_components.claim_btn_holder
								claim_btn_holder:SetState("active")
							end,
							nil,
							title_string,
							title_source
						)
						return
					else
						-- we must refresh the claim position button tooltip
						court.ui.setup_claim_position_button()
					end
				end
			else
				court.ui.data.selected_character_CQI = character_cqi
				court.ui.set_position_objects_active_state(false)
				court.ui.hide_all_panels(true)
			end

			court.ui.set_available_character_script_cco(character_obj)
			court.ui.set_black_overlay_visibility(true)
		end,

		-- all the methods below gather local parameters and sends them with an event to all players
		on_request_interacted = function(request_type, use_dominance)
			local faction_court_name = court.ui.data.faction_court.court_name
			local calling_faction_key = court.ui.data.local_faction_key
			local local_faction_obj = court.ui.data.local_faction_obj
			local local_faction_cqi = local_faction_obj:command_queue_index()

			local selected_position_str = court.ui.data.selected_position_key

			local faction_court = court.util_functions.get_faction_court_by_name(faction_court_name)
			local position_obj = court.util_functions.get_court_position(faction_court, selected_position_str)
			local target_character_obj = cm:get_character(position_obj.persistent.current_holder)

			local request_index = court.developer_config.small_request_index
			if request_type == "large_request" then
				request_index = court.developer_config.large_request_index
			end
			local request_accessibility, failure_reason = court.position_functions.can_faction_call_request(court.ui.data.faction_court,
				calling_faction_key,
				request_index,
				selected_position_str,
				use_dominance)
			if not request_accessibility then
				court.output("Error: trying to make request, but can't, due to : " .. failure_reason, 10)
				return
			end

			local position_obj = court.util_functions.get_court_position(faction_court, selected_position_str)
			local request_obj = position_obj.requests[request_index]
			if not request_obj then
				return
			end

			-- some requests require the player to pick a category to influence
			if request_obj.influence_discounts then
				court.ui.display_court_discounts(selected_position_str, "influence", use_dominance)
			else
				local param_str = "court_action:request:" .. request_type .. ":" .. faction_court_name .. ":" .. calling_faction_key .. ":" .. selected_position_str
				if use_dominance then
					param_str = param_str .. ":use_dominance"
				end
				CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, param_str)
				CampaignUI.TriggerCampaignCourtVO("campaign_vo_court_res_request", calling_faction_key, faction_court_name, target_character_obj:command_queue_index())
			end
		end,

		-- all discounts are a special case, could be treasurer court action or a large request towards treasurer
		on_discounts_interacted = function(discounts_action, params)
			local calling_faction_key = court.ui.data.local_faction_key
			local local_faction_obj = court.ui.data.local_faction_obj
			local local_faction_cqi = local_faction_obj:command_queue_index()

			local position_key = court.ui.data.discount_position
			court.ui.data.discount_position = nil
			local faction_court_name = court.ui.data.faction_court.court_name

			if discounts_action == "apply" then
				local discounts_str = ""
				for index, amount in ipairs(params) do
					discounts_str = discounts_str .. ":" .. amount
				end
				local param_str = "court_action:set_discounts:" .. faction_court_name .. ":" .. calling_faction_key .. ":" ..  position_key .. ":" .. discounts_str

				CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, param_str)
			elseif discounts_action == "influence" or discounts_action == "influence_dominance" then
				local use_dominance = discounts_action == "influence_dominance"
				local param_str = "court_action:request:large_request:" .. faction_court_name .. ":" .. calling_faction_key .. ":" .. position_key
				if use_dominance then
					param_str = param_str .. ":use_dominance"
				end
				-- large request by the treasurer/commander requires the player to pick a category to influence, so we call the normal request string and add the index(es)
				local royal_treasurer_obj = court.util_functions.get_court_position(court.ui.data.faction_court, position_key)
				local num_influenced_categories = court.discount_functions.get_number_of_categories_to_influence(royal_treasurer_obj, court.ui.data.faction_court)

				for i = 1, num_influenced_categories do
					local influenced_discount_index = tonumber(params[i])
					-- C++ indexes are 0 based, lua are 1 based
					influenced_discount_index = influenced_discount_index + 1
					param_str = param_str .. ":" .. influenced_discount_index
				end
				CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, param_str)
			else
				court.output("Error: unknown court action sent: '".. discounts_action .."'!", 10)
			end
		end,

		on_intrigue_interacted = function(intrigue_name)
			local faction_court_name = court.ui.data.faction_court.court_name
			local calling_faction_key = court.ui.data.local_faction_key
			local local_faction_obj = court.ui.data.local_faction_obj
			local local_faction_cqi = local_faction_obj:command_queue_index()
			local selected_position = court.ui.data.selected_position_key
			local selected_plot_id = court.ui.data.selected_plot_id

			local faction_court_obj = court.util_functions.get_faction_court_by_name(faction_court_name)

			local intrigue_obj = court.intrigues:get_by_name(intrigue_name)
			if not selected_plot_id and intrigue_obj.targets_plot then
				court.output("Error: faction '" .. calling_faction_key .. "' tried to use intrigue '" .. intrigue_name .. " but can't because target plot was not supplied", 10)
			end

			local position_obj
			if intrigue_obj.targets_plot then
				local plot_data = court.plot_functions:get_plot_persistent_data(faction_court_obj.court_name, selected_plot_id)
				position_obj = court.util_functions.get_court_position(faction_court_obj, plot_data.targeted_position)
				selected_position = position_obj.name
			elseif intrigue_obj.additional_plot_selection then
				if court.ui.data.additional_plot_selection_id then
					selected_plot_id = court.ui.data.additional_plot_selection_id
					court.ui.data.additional_plot_selection_id = nil
					position_obj = court.util_functions.get_court_position(faction_court_obj, selected_position)
				else
					court.ui.data.waiting_intrigue = intrigue_obj.name
					-- we may need other functions or parameters in the future if other intrigues need position and a plot, but for now it's only Conspire
					court.ui.display_conspire_plots()
					return
				end
			else
				position_obj = court.util_functions.get_court_position(faction_court_obj, selected_position)
			end
			local target_character_obj = cm:get_character(position_obj.persistent.current_holder)

			local is_intrigue_accessible = court.intrigue_functions.can_faction_use_intrigue(faction_court_obj, calling_faction_key, intrigue_name, selected_position, selected_plot_id)
			if not is_intrigue_accessible then
				return
			end

			local param_str = "court_action:intrigue:" .. intrigue_name .. ":" .. faction_court_name .. ":" .. calling_faction_key .. ":" .. selected_position
			if selected_plot_id then
				param_str = param_str .. ":" .. selected_plot_id
			end

			CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, param_str)
			CampaignUI.TriggerCampaignCourtVO("campaign_vo_court_res_intrigue", calling_faction_key, faction_court_name, target_character_obj:command_queue_index())
		end,

		on_plot_interacted = function(plot_key)
			local faction_court_name = court.ui.data.faction_court.court_name
			local calling_faction_key = court.ui.data.local_faction_key
			local local_faction_obj = court.ui.data.local_faction_obj
			local local_faction_cqi = local_faction_obj:command_queue_index()
			local selected_position = court.ui.data.selected_position_key
			local faction_court_obj = court.util_functions.get_faction_court_by_name(faction_court_name)

			local plot_accessibility, error_str = court.plot_functions.can_faction_use_plot(faction_court_obj, calling_faction_key, plot_key, selected_position)
			if not plot_accessibility then
				court.output("Error selecting plot: " .. error_str)
			end

			local selected_position_obj = court.util_functions.get_court_position(court.ui.data.faction_court, court.ui.data.selected_position_key)
			local position_holder_faction = selected_position_obj.persistent.current_holder_faction
			local kill_plotter_on_failure = court.util_functions.get_property(position_holder_faction, "kill_plotter_on_failure") or false
			if kill_plotter_on_failure then
				create_confirmation_box(
					"court_leave_position_prompt",
					court.ui.config.localization_keys.risky_plot_confirmation_key,
					function()
						local param_str = "court_action:plot:" .. plot_key .. ":" .. faction_court_name .. ":" .. calling_faction_key .. ":" .. selected_position
						CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, param_str)
					end
				)
			else
			local param_str = "court_action:plot:" .. plot_key .. ":" .. faction_court_name .. ":" .. calling_faction_key .. ":" .. selected_position
			CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, param_str)
			end
		end,

		on_trigger_dilemma_interacted = function()
			local faction_court_name = court.ui.data.faction_court.court_name
			local calling_faction_key = court.ui.data.local_faction_key
			local local_faction_obj = court.ui.data.local_faction_obj
			local local_faction_cqi = local_faction_obj:command_queue_index()

			local param_str = "court_action:trigger_dilemma:" .. faction_court_name .. ":" .. calling_faction_key
			CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, param_str)
		end,

		on_give_actions_ability_interacted = function()
			local faction_court_name = court.ui.data.faction_court.court_name
			local calling_faction_key = court.ui.data.local_faction_key
			local local_faction_obj = court.ui.data.local_faction_obj
			local local_faction_cqi = local_faction_obj:command_queue_index()

			local param_str = "court_action:give_actions_ability:" .. faction_court_name .. ":" .. calling_faction_key
			CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, param_str)
		end,

		on_purchase_action_interacted = function()
			local calling_faction_key = court.ui.data.local_faction_key
			if not calling_faction_key then
				court.output("Error: no local faction provided for on_purchase_action_interacted!", 10)
				return
			end

			local local_faction_obj = court.ui.data.local_faction_obj
			if not local_faction_obj then
				court.output("Error: local faction '" .. calling_faction_key .. "' not found!", 10)
				return
			end

			local local_faction_cqi = local_faction_obj:command_queue_index()

			local param_str = "court_action:purchase_action:" .. calling_faction_key
			CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, param_str)
		end,

		on_leave_position_interacted = function()
			create_confirmation_box(
				"court_leave_position_prompt",
				court.ui.config.localization_keys.leave_position_confirmation_key,
				function()
					local faction_court_name = court.ui.data.faction_court.court_name
					local calling_faction_key = court.ui.data.local_faction_key
					local local_faction_obj = court.ui.data.local_faction_obj
					local local_faction_cqi = local_faction_obj:command_queue_index()

					local selected_position = court.ui.data.selected_position_key
					local param_str = "court_action:leave_position:" .. faction_court_name .. ":" .. calling_faction_key .. ":" .. selected_position
					CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, param_str)
				end
			)
		end,

		on_kick_from_position_interacted = function()
			create_confirmation_box(
				"court_leave_position_prompt",
				court.ui.config.localization_keys.kick_from_position_confirmation_key,
				function()
					local faction_court_name = court.ui.data.faction_court.court_name
					local calling_faction_key = court.ui.data.local_faction_key
					local local_faction_obj = court.ui.data.local_faction_obj
					local local_faction_cqi = local_faction_obj:command_queue_index()


					local selected_position = court.ui.data.selected_position_key
					local param_str = "court_action:kick_from_position:" .. faction_court_name .. ":" .. calling_faction_key .. ":" .. selected_position
					CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, param_str)
				end
			)
		end,

		on_claim_position_interacted = function()
			if court.ui.data.claim_position_mode then
				court.ui.set_claim_position_mode(false)
				return
			end

			local faction_court = court.ui.data.faction_court
			local faction_obj = court.ui.data.local_faction_obj
			local local_ruling_faction = faction_court:ruling_faction()
			local is_faction_leader = local_ruling_faction == court.ui.data.local_faction_key
			local can_claim_position, error_message = nil, nil
			local character_obj = nil
			local position_obj = court.util_functions.get_court_position(faction_court, court.ui.data.selected_position_key)
			if is_faction_leader or court.ui.data.faction_court.config.any_faction_can_hold_multiple_positions then
				if not court.ui.data.selected_character_CQI then
					local available_characters = court.util_functions.get_eligible_characters(faction_court, faction_obj)
					if available_characters and #available_characters == 1 then
						-- there is a single available character, we try to select them and give them a position
						character_obj = available_characters[1]
					else
						court.ui.set_claim_position_mode(true)
						return
					end
				else
					character_obj = cm:get_character_by_cqi(court.ui.data.selected_character_CQI)
				end
				can_claim_position, error_message = court.util_functions.can_give_own_character_a_position(faction_court, court.ui.data.local_faction_key, position_obj, character_obj)
			else
				character_obj = faction_obj:faction_leader()
				can_claim_position, error_message = court.util_functions.can_claim_position(faction_court, court.ui.data.local_faction_key)
			end

			if not can_claim_position then 
				return
			end

			local position_localization_key = court.position_functions.get_position_name_localization_key(position_obj, faction_court)
			local position_localized_string = common.get_localised_string(position_localization_key)
			local character_display_nasme = character_obj:onscreen_name()
			local confirmation_string, confirmation_source = get_localised_text_replacement_and_source_formatted(court.ui.config.localization_keys.claim_position_confirmation_key, character_display_nasme, position_localized_string)

			local title_string, title_source = get_localised_text_replacement_and_source(court.ui.config.localization_keys.claim_position_key, character_display_nasme, position_localized_string)

			create_confirmation_box_with_text_from_script(
				"court_claim_position_prompt",
				confirmation_string, confirmation_source,
				function()
					local faction_court_name = court.ui.data.faction_court.court_name
					local calling_faction_key = court.ui.data.local_faction_key
					local local_faction_obj = court.ui.data.local_faction_obj
					local local_faction_cqi = local_faction_obj:command_queue_index()

					local selected_position = court.ui.data.selected_position_key
					local param_str = ""
					if is_faction_leader or court.ui.data.faction_court.config.any_faction_can_hold_multiple_positions then
						local character_cqi = character_obj:command_queue_index()
						local cqi_string = tostring(character_cqi)
						param_str = "court_action:give_position:" .. faction_court_name .. ":" .. calling_faction_key .. ":" .. selected_position .. ":" .. cqi_string
					else
						param_str = "court_action:claim_position:" .. faction_court_name .. ":" .. calling_faction_key .. ":" .. selected_position
					end
					CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, param_str)
					court.ui.set_black_overlay_visibility(false)
				end,
				function()
					court.ui.set_claim_position_mode(false)
				end,
				nil,
				title_string,
				title_source
			)
		end,

		on_give_to_x_interacted = function(faction_key)
			if not court.config.can_leader_give_position_to_factions then
				return
			end
			local faction_court = court.ui.data.faction_court
			local faction_obj = cm:get_faction(faction_key)
			local local_ruling_faction = faction_court:ruling_faction()
			local is_faction_leader = local_ruling_faction == court.ui.data.local_faction_key
			local can_claim_position, error_message = nil, nil
			local character_obj = nil
			local position_obj = court.util_functions.get_court_position(faction_court, court.ui.data.selected_position_key)

			local position_localization_key = court.position_functions.get_position_name_localization_key(position_obj, faction_court)
			local position_localized_string = common.get_localised_string(position_localization_key)
			local faction_display_nasme = faction_obj:localised_display_name()
			local confirmation_string, confirmation_source = get_localised_text_replacement_and_source_formatted(court.ui.config.localization_keys.claim_position_confirmation_key, faction_display_nasme, position_localized_string)

			local title_string, title_source = get_localised_text_replacement_and_source(court.ui.config.localization_keys.claim_position_key, character_display_nasme, position_localized_string)

			create_confirmation_box_with_text_from_script(
				"court_claim_position_prompt",
				confirmation_string, confirmation_source,
				function()
					local faction_court_name = court.ui.data.faction_court.court_name
					local calling_faction_key = court.ui.data.local_faction_key
					local local_faction_obj = court.ui.data.local_faction_obj
					local local_faction_cqi = local_faction_obj:command_queue_index()

					local selected_position = court.ui.data.selected_position_key
					local param_str = "court_action:give_position_to_x:" .. faction_court_name .. ":" .. calling_faction_key .. ":" .. selected_position .. ":" .. faction_key
					local contenders_count = #court.ui.data.position_contenders
					param_str = param_str .. ":" .. tostring(contenders_count)
					for _, contender_key in ipairs(court.ui.data.position_contenders) do
						param_str = param_str .. ":" .. contender_key
					end

					CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, param_str)
					court.ui.set_black_overlay_visibility(false)
				end,
				function()
					court.ui.set_claim_position_mode(false)
				end,
				nil,
				title_string,
				title_source
			)
		end,

		set_show_leader_injured_indicator = function(should_show)
			local pharaoh_injured_indicator_component = court.ui.components.referenced_components.pharaoh_injured_indicator
			pharaoh_injured_indicator_component:SetVisible(should_show)
		end,
	},

	-- these may be coming from other players
	model_changing_events = 
	{
		on_request_event = function(params)
			local request_type = 			params[1]
			local faction_court_name = 		params[2]
			local calling_faction_key = 	params[3]
			local selected_position_str = 	params[4]
			-- some requests have additional parameters, for most this is an empty table
			table.remove(params, 1)
			table.remove(params, 1)
			table.remove(params, 1)
			table.remove(params, 1)
			local use_dominance = false
			if params[1] == "use_dominance" then
				use_dominance = true
				table.remove(params, 1)
			end
			local additional_params =		params

			local faction_court = court.util_functions.get_faction_court_by_name(faction_court_name)
			court.output(request_type .. " called by '".. calling_faction_key .."' to ".. selected_position_str)
			if request_type == "small_request" then
				local result = court.position_functions.call_request(faction_court, calling_faction_key, selected_position_str, court.developer_config.small_request_index, use_dominance)
			elseif request_type == "large_request" then
				court.position_functions.call_request(faction_court, calling_faction_key, selected_position_str, court.developer_config.large_request_index, use_dominance, additional_params)
			else
				court.output("Unknown request called by '".. calling_faction_key .."' : ".. request_type)
			end

			if calling_faction_key == cm:get_local_faction_name(true)
				and court.ui.data.court_ui_opened 
			then
				court.ui.refresh_ui()
			end
		end,

		on_intrigue_event = function(params)
			local intrigue_type = 			params[1]
			local faction_court_name = 		params[2]
			local calling_faction_key = 	params[3]
			local selected_position_str = 	params[4]
			local selected_plot_id = 		tonumber(params[5])

			local faction_court = court.util_functions.get_faction_court_by_name(faction_court_name)

			local is_intrigue_accessible = court.intrigue_functions.can_faction_use_intrigue(faction_court, calling_faction_key, intrigue_type, selected_position_str, selected_plot_id)
			if is_intrigue_accessible then
				local used_successfully = court.intrigue_functions.use_intrigue(faction_court, calling_faction_key, intrigue_type, selected_position_str, selected_plot_id)
				if not used_successfully then
					return false
				end
				if calling_faction_key == cm:get_local_faction_name(true) 
					and court.ui.data.court_ui_opened 
				then
					court.ui.refresh_ui()
					if court.ui.data.waiting_intrigue then
						-- we just used an intrigue which did something to the plot
						-- we remove the temporary data and show the plot
						court.ui.data.additional_plot_selection_id = nil
						court.ui.data.waiting_intrigue = nil
						court.ui.show_plots()
					end
				end
				return true
			end
		end,

		on_plot_created_event = function(params)
			local plot_key =				params[1]
			local faction_court_name = 		params[2]
			local calling_faction_key = 	params[3]
			local court_position_str =		params[4]

			local plot_id = court.plot_functions.create_plot(faction_court_name, calling_faction_key, plot_key, court_position_str)
			if calling_faction_key == cm:get_local_faction_name(true)
				and court.ui.data.court_ui_opened 
			then
				court.ui.refresh_ui()
				local button_plots = court.ui.components.referenced_components.button_plots
				button_plots:SimulateLClick()
			end
		end,

		on_trigger_dilemma_event = function(params)
			local faction_court_name = 		params[1]
			local calling_faction_key = 	params[2]
			local selected_position_str = 	params[3]

			local faction_court = court.util_functions.get_faction_court_by_name(faction_court_name)

			local judge_obj = court.util_functions.get_court_position(faction_court, "high_judge", true)
			-- not all courts have high_judge, so an extra check is needed
			if not judge_obj then
				court.output("Error: on_trigger_dilemma_event received, but court '".. faction_court_name .. "' has no high_judge!", 10)
				return
			end

			if (not judge_obj.persistent.current_holder_faction) 
				or judge_obj.persistent.current_holder_faction == ""
			then
				court.output("Error: on_trigger_dilemma_event received, but high_judge  position is vacant!", 10)
				return
			end

			if judge_obj.persistent.current_holder_faction == calling_faction_key then
				judge_obj.trigger_dilemma:call_ability(judge_obj, faction_court)
			else
				court.output("Error: on_trigger_dilemma_event received, but calling faction '".. faction_court_name .. "' does not hold the position. it is '".. judge_obj.persistent.current_holder_faction .. "'!", 10)
			end
		end,

		on_give_actions_event = function(params)
			local faction_court_name = 		params[1]
			local calling_faction_key = 	params[2]
			local selected_position_str = 	params[3]

			local faction_court = court.util_functions.get_faction_court_by_name(faction_court_name)
			local acting_position_obj = nil
			if is_string(selected_position_str) then
				acting_position_obj = court.util_functions.get_court_position(faction_court,selected_position_str, true)
				if (not acting_position_obj.persistent.current_holder_faction) 
					or acting_position_obj.persistent.current_holder_faction == ""
				then
					court.output("Error: on_give_actions_event received, but high_judge  position is vacant!", 10)
					return
				end
			end

			if not acting_position_obj then
				for _, position_obj in ipairs(court.ui.data.faction_court.positions) do
					if position_obj.give_court_actions_ability
						and position_obj.persistent.current_holder_faction == calling_faction_key
					then
						acting_position_obj = position_obj
					end
				end
			end

			if acting_position_obj.persistent.current_holder_faction == calling_faction_key then
				acting_position_obj.give_court_actions_ability:call_ability(acting_position_obj, faction_court)
				if calling_faction_key == cm:get_local_faction_name(true)
					and court.ui.data.court_ui_opened 
				then
					court.ui.refresh_ui()
				end
			else
				court.output("Error: on_give_actions_event received, but calling faction '".. faction_court_name .. "' does not hold the position. it is '".. vizier_obj.persistent.current_holder_faction .. "'!", 10)
			end
		end,

		on_purchase_action_event = function(params)
			local calling_faction_key = 	params[1]
			court.util_functions.purchase_court_actions(calling_faction_key)

			if calling_faction_key == cm:get_local_faction_name(true)
				and court.ui.data.court_ui_opened 
			then
				court.ui.refresh_ui()
			end
		end,

		on_set_disounts_event = function(params)
			local faction_court_name = 		params[1]
			local calling_faction_key = 	params[2]
			local target_position_key = 	params[3]

			local faction_court = court.util_functions.get_faction_court_by_name(faction_court_name)

			local target_position_obj = court.util_functions.get_court_position(faction_court, target_position_key)

			if not target_position_obj then
				if target_position_key then
					court.output("Error: on_set_disounts_event received, but no '" .. target_position_key.. "' position found!", 10)
				else
					court.output("Error: on_set_disounts_event received, but no position key provided!", 10)
				end
				return
			end

			if target_position_obj.persistent.current_holder_faction ~= calling_faction_key then
				if target_position_obj.persistent.current_holder_faction then
					court.output("Error: on_set_disounts_event received for '" .. target_position_key .. "', but calling faction '".. calling_faction_key .. "' does not hold the position. it is '".. target_position_obj.persistent.current_holder_faction .. "'!", 10)
				else
					court.output("Error: on_set_disounts_event received for '" .. target_position_key .. "', but calling faction '".. calling_faction_key .. "' does not hold the position. it is  vacant!", 10)
				end
				return
			end

			local remaining_cooldown = court.discount_functions.get_choose_discounts_remaining_cooldown(target_position_obj)
			if remaining_cooldown > 0 then
				court.output("Error: on_set_disounts_event received for '" .. target_position_key .. "', but the ability is still on cooldown '".. remaining_cooldown .. "'!", 10)
				return
			end
			-- first 2 params are the court name and the faction key, we remove them
			table.remove(params, 1)
			table.remove(params, 1)

			-- now the only thing left in params is the discount amounts, we convert them to numbers and put them in a table
			local discounts_num = {}
			for index, amount in ipairs(params) do
				if is_string(params[index]) then
					table.insert(discounts_num, tonumber(params[index]))
				else
					court.output("Error: court discount param index [".. index .."] '".. params[index] .."' is not a number!", 10)
				end
			end

			court.discount_functions.choose_discount_amounts(target_position_obj, faction_court, discounts_num)
			if calling_faction_key == cm:get_local_faction_name(true)
				and court.ui.data.court_ui_opened 
			then
				court.ui.refresh_ui()
			end
		end,

		on_leave_position_event = function(params)
			local faction_court_name = 		params[1]
			local calling_faction_key = 	params[2]
			local selected_position_str = 	params[3]

			local faction_court = court.util_functions.get_faction_court_by_name(faction_court_name)

			court.position_functions.remove_character_from_position(faction_court, selected_position_str)
			-- I don't think this should take a court action, but if it does - use this instead of court.ui.refresh_ui()
			-- court.util_functions.increase_used_court_actions_for_faction(faction_court, calling_faction_key)
			if calling_faction_key == cm:get_local_faction_name(true)
				and court.ui.data.court_ui_opened 
			then
				court.ui.data.selected_position_key = nil
				court.ui.refresh_ui()
			end
		end,

		on_kick_from_position_event = function(params)
			local faction_court_name = 		params[1]
			local calling_faction_key = 	params[2]
			local position_str = 			params[3]

			local faction_court = court.util_functions.get_faction_court_by_name(faction_court_name)
			local faction_obj = cm:get_faction(calling_faction_key)
			local position_obj = court.util_functions.get_court_position(faction_court, position_str)


			local kick_cost_obj =  court.position_functions.get_kick_from_position_cost_obj(position_obj, faction_obj, faction_court)
			local can_kick_from_position, error_message = court.position_functions.can_kick_from_position(position_obj, faction_obj, kick_cost_obj)
			if not can_kick_from_position then
				script_error("ERROR: on_kick_from_position_event() called but kicking is impossible due to[" .. error_message .. "]");
				return
			end

			local faction_persistent_data = court.util_functions.get_faction_persistent_data(calling_faction_key)
			local current_turn = cm:model():turn_number()
			-- at this turn the faction will be able to kick again
			faction_persistent_data.kick_cooldown_end_turn = current_turn + court.config.position_kick_cooldown

			cm:faction_apply_resource_transaction(faction_obj, kick_cost_obj)
			cm:apply_dilemma_diplomatic_bonus(calling_faction_key, position_obj.persistent.current_holder_faction, court.config.position_kick_diplomatic_effect)

			court.log_functions.log_court_action("position_kicked", calling_faction_key, position_str, position_obj.persistent.current_holder_faction)
			-- the last parameter is 'true' because the removal is forced and the holding faction can't claim it again for a few turns
			court.position_functions.remove_character_from_position(faction_court, position_str, true)
			court.util_functions.increase_used_court_actions_for_faction(faction_court, calling_faction_key)

		end,

		on_claim_position_event = function(params)
			local faction_court_name = 		params[1]
			local calling_faction_key = 	params[2]
			local selected_position_str = 	params[3]

			local faction_court = court.util_functions.get_faction_court_by_name(faction_court_name)

			court.position_functions.claim_position(faction_court, calling_faction_key, selected_position_str)
			-- I don't think this should take a court action, but if it does - use this instead of court.ui.refresh_ui()
			-- court.util_functions.increase_used_court_actions_for_faction(faction_court, calling_faction_key)
			if calling_faction_key == cm:get_local_faction_name(true)
				and court.ui.data.court_ui_opened 
			then
				court.ui.data.selected_position_key = nil
				court.ui.set_claim_position_mode(false)
				court.ui.refresh_ui()
				court.ui.set_position_objects_active_state(true)
			end
		end,

		-- the court leader giving position to a character from his faction
		on_give_position_event = function(params)
			local faction_court_name = 		params[1]
			local calling_faction_key = 	params[2]
			local position_str = 			params[3]
			local character_CQI = 			tonumber(params[4])

			local faction_court = court.util_functions.get_faction_court_by_name(faction_court_name)
			local character_obj = cm:get_character_by_cqi(character_CQI)

			-- I don't think this should take a court action, but if it does - use this instead of court.ui.refresh_ui()
			-- court.util_functions.increase_used_court_actions_for_faction(faction_court, calling_faction_key)

			local result = court.position_functions.give_own_character_a_position(
				faction_court,
				calling_faction_key,
				character_obj,
				position_str
			)

			-- we apply diplomatic penalty with all the position contenders
			local valid_contender_scores = court.position_functions.get_valid_contender_scores(faction_court, calling_faction_key, court.config.claim_position_cost.min_valid_score_give_position_by_leader)
			valid_contender_scores = table_stable_sort(valid_contender_scores, function(a, b) return a.candidate_value > b.candidate_value end)
			local number_of_top_contenders = math.min(#valid_contender_scores, court.config.claim_position_cost.top_contenders_to_sum)
			for i = 1, number_of_top_contenders do
				local contender_score = valid_contender_scores[i]
				local contender_faction_key = contender_score.faction_key
				cm:apply_dilemma_diplomatic_bonus(calling_faction_key, contender_faction_key, -1)
			end

			if result and calling_faction_key == cm:get_local_faction_name(true)
				and court.ui.data.court_ui_opened 
			then
				court.ui.data.selected_position_key = nil
				court.ui.data.selected_character_CQI = nil
				court.ui.set_claim_position_mode(false)
				court.ui.set_black_overlay_visibility(false)
				court.ui.set_position_objects_active_state(true)
				court.ui.refresh_ui()
			end
		end,

		-- the court leader giving position to the leader of another faction
		on_give_position_to_x_event = function(params)
			if not court.config.can_leader_give_position_to_factions then
				return
			end
			local faction_court_name = 		params[1]
			local calling_faction_key = 	params[2]
			local position_str = 			params[3]
			local faction_given_to_key = 	params[4]



			local faction_court = court.util_functions.get_faction_court_by_name(faction_court_name)

			local result = nil
			if faction_court.config.any_faction_can_hold_multiple_positions then
				local faction_obj = cm:get_faction(faction_given_to_key)
				local leader_character_obj = faction_obj:faction_leader()
				result = court.position_functions.give_own_character_a_position(
					faction_court,
					faction_given_to_key,
					leader_character_obj,
					position_str,
					false,					-- we skip the eligibility checks
					true,					-- we skip the payment
					calling_faction_key		-- the court leader supports this action
				)
			else
				result = court.position_functions.claim_position(faction_court, faction_given_to_key, position_str, 
					true, 					-- we skip the eligibility checks
					true, 					-- we skip the payment
					calling_faction_key		-- the court leader supports this action
				)
			end

			if not result then
				script_error("on_give_position_to_x_event failed!!")
				return
			end

			-- we apply the diplomacy effects of this action between the court leader and the contenders
			local contenders_count_param  =	params[5]
			if contenders_count_param then
				local contenders_count = tonumber(contenders_count_param)
				if contenders_count then
					local contenders = {}
					local given_contender_index = -1
					for i = 1, contenders_count do
						local contender_faction_key = params[5 + i]
						table.insert(contenders, contender_faction_key)
						if contender_faction_key == faction_given_to_key then
							given_contender_index = i
						end
					end

					for i = 1, contenders_count do
						local contender_faction_key = contenders[i]
						-- the benefit/penalty scales with the deviation from the natural order (given_contender_index)
						-- giving the position to someone toward the bottom of the pack would make them more grateful, and the other contenders angrier
						-- the bonuses or penalties are defined in DaVE records so need to be clamped to within [-6, 6]
						local deviation = math.clamp(given_contender_index, 1, 6)
						if contender_faction_key == faction_given_to_key then
							cm:apply_dilemma_diplomatic_bonus(calling_faction_key, contender_faction_key, deviation)
						else
							cm:apply_dilemma_diplomatic_bonus(calling_faction_key, contender_faction_key, -deviation)
						end
					end
				end
			end

			-- I don't think this should take a court action, but if it does - use this instead of court.ui.refresh_ui()
			-- court.util_functions.increase_used_court_actions_for_faction(faction_court, calling_faction_key)
			if calling_faction_key == cm:get_local_faction_name(true)
				and court.ui.data.court_ui_opened 
			then
				court.ui.data.selected_position_key = nil
				court.ui.set_claim_position_mode(false)
				court.ui.refresh_ui()
				court.ui.set_position_objects_active_state(true)
			end
		end,
	},

	-- handling user interaction with Dev UI elements (cheat buttons)
	cheat_interaction = 
	{
		-- position cheats
		position_put_AI_as_leader = function(faction_court, position_key)
			if position_key == "vizier" then
				if faction_court == court.egyptian_court then
					court_cheat.positions.set_amemnesse_vizier()
				else
					court_cheat.positions.set_ancyra_vizier()
				end
			elseif position_key == "first_commander" then
				if faction_court == court.egyptian_court then
					court_cheat.positions.set_faiyum_commander()
				else
					court_cheat.positions.set_cibyra_high_commander()
				end
			elseif position_key == "royal_treasurer" then
				if faction_court == court.egyptian_court then
					court_cheat.positions.set_tausret_treasurer()
				else
					court_cheat.positions.set_kanesh_high_treasurer()
				end
			elseif position_key == "high_priest_of_amun" then
				court_cheat.positions.set_seti_priest()
			elseif position_key == "viceroy_of_kush" then
				court_cheat.positions.set_setnakhte_kush()
			elseif position_key == "high_judge" then
				court_cheat.positions.set_hubishna_high_judge()
			elseif position_key == "chief_of_royal_bodyguards" then
				court_cheat.positions.set_carchemish_bodyguard()
			end
		end,

		-- own position cheats
		add_legitmacy = function()
			court_cheat.add_legitimacy()
		end,

		remove_legitmacy = function()
			court_cheat.remove_legitimacy()
		end,

		-- other cheats
		force_shemsu_hor = function()
			cheat_force_shemsu_hor()
		end,

		reset_court_actions = function()
			court_cheat.clear_player_faction_turn_actions()
		end,

		clear_court = function()
			court_feature_tests.clear_court()
		end,

		make_player_court_leader = function()
			court_cheat.court_leaders.set_cheat_court_leader(court.ui.data.faction_court, court.ui.data.local_faction_key)
			common.set_context_value("hacked_court_leader", court.ui.data.local_faction_key)
		end,

		hack_plots_success = function()
			court_cheat.plots.force_success()
		end,

		hack_plots_fail = function()
			court_cheat.plots.force_fail()
		end,

		remove_plots_chance_hack = function()
			court_cheat.plots.remove_chance_hacks()
		end,

		remove_all_plots = function()
			court_cheat.plots.remove_all_plots()
		end,

		resolve_all_plots = function()
			court_cheat.plots.resolve_all_plots()
		end,

		reveal_all_plots = function()
			court_cheat.plots.reveal_all_plots(court.ui.data.faction_court, court.ui.data.local_faction)
		end,
	},

	display_intrigue_plot_request_cost = function(self, intrigue_plot_request_component, cost_obj, court_actions_needed, regard_needed, dominance_needed)
		local cost_element_template = court.ui.components.templates.intrigue_plot_request_cost_template
		local cost_parent_component = intrigue_plot_request_component:SequentialFind(court.ui.config.component_ids.intrigue_plot_request_cost_holder)

		if not cost_parent_component then
			return
		end
		if cost_obj then
			local resources = cost_obj:resources()
			for i = 1, #resources do
				if resources[i][2] ~= 0 then
				local new_cost_element = UIComponent(cost_parent_component:CreateFromComponent(cost_element_template:Address(), resources[i][1]))
				table.insert(self.components.instantiated_templates, new_cost_element)
				new_cost_element:SetVisible(true)
				new_cost_element:SetText(resources[i][2])
				local resource_name = resources[i][1]
				local icon_path = court.ui.config.resource_icons[resource_name]
				new_cost_element:SetImagePath(icon_path)
			end
		end
		end

		if regard_needed and regard_needed ~= 0 then
			local new_cost_element = UIComponent(cost_parent_component:CreateFromComponent(cost_element_template:Address(), "regard_needed"))
			table.insert(self.components.instantiated_templates, new_cost_element)
			new_cost_element:SetVisible(true)
			new_cost_element:SetText(regard_needed)
			new_cost_element:SetImagePath(court.ui.config.regard_icon_path)
		end

		if dominance_needed and dominance_needed ~= 0 then
			local new_cost_element = UIComponent(cost_parent_component:CreateFromComponent(cost_element_template:Address(), "dominance_needed"))
			table.insert(self.components.instantiated_templates, new_cost_element)
			new_cost_element:SetVisible(true)
			new_cost_element:SetText(dominance_needed)
			new_cost_element:SetImagePath(court.ui.config.dominance_icon_path)
		end

		if court_actions_needed and court_actions_needed ~= 0 then
			local new_cost_element = UIComponent(cost_parent_component:CreateFromComponent(cost_element_template:Address(), "court_actions"))
			table.insert(self.components.instantiated_templates, new_cost_element)
			new_cost_element:SetVisible(true)
			new_cost_element:SetText(court_actions_needed)
			new_cost_element:SetImagePath(court.ui.config.action_icon_path)
		end
	end,

	get_court_action_cost_string = function(regard_cost)
		local cost_string = "[[img:" .. court.ui.config.action_icon_path .. "]][[/img]] " .. tostring(regard_cost)
		return cost_string
	end,
}

-- PharCourt_PanelOpenedCampaign
core:add_listener (
	"PharCourt_PanelOpenedCampaign",
	"PanelOpenedCampaign",
	function(context) 
		return context.string == court.ui.config.component_ids.panel 
	end,
	function(context)
		court.ui.data.court_ui_opened = true
		court.ui.data.local_faction_key = cm:get_local_faction_name(true)
		court.ui.data.local_faction_obj = cm:get_faction(court.ui.data.local_faction_key)
		local local_faction_key = court.ui.data.local_faction_key
		court.ui.data.faction_court = court.util_functions.get_faction_court_for_faction(local_faction_key)

		if not court.ui.data.faction_court then
			return
		end

		court.ui.init_referenced_components()
		if court.ui.components.referenced_components.panel then
			court.ui.components.referenced_components.panel:StallLayouts(true)
		end
		court.ui.init_ui_templates()

		court.ui.display_shemsu_hor_bar()
		court.ui.display_background()
		court.ui.display_general_data(court.ui.data.faction_court)
		court.ui.display_own_faction_data()
		court.ui.display_court_position_cards(court.ui.data.faction_court)
		court.ui.display_actions_counter()

		-- in case something was left open from the last time the panel was opened
		court.ui.hide_all_panels()

		local event_id = "campaign_vo_court_open" 
		if shemsu_hor.is_shemsu_hor() then
			event_id = "campaign_vo_court_pharaoh_shemsu_hor"
		end

		if court.ui.components.referenced_components.panel then
			court.ui.components.referenced_components.panel:StallLayouts(false)
			court.ui.components.referenced_components.panel:Layout()
		end

		local faction_court = court.ui.data.faction_court
		local ruling_faction_key = faction_court:ruling_faction()
		-- if there is no court leader return
		if not ruling_faction_key then
			return
		end

		local ruling_faction_obj = cm:get_faction(ruling_faction_key)
		local ruler_character_obj = ruling_faction_obj:faction_leader()

		CampaignUI.TriggerCampaignCourtVO(event_id, local_faction_key, faction_court.court_name, ruler_character_obj:command_queue_index())
	end,
	true
)

-- PharCourt_PanelClosedCampaign
core:add_listener (
	"PharCourt_PanelClosedCampaign",
	"PanelClosedCampaign",
	function(context)
		return court.ui.data.court_ui_opened and context.string == court.ui.config.component_ids.panel
	end,
	function(context)
		court.ui.hide_all_panels()
		court.ui.delete_ui_templates()
		court.ui.delete_referenced_components()
		court.ui.delete_instanced_components(true)
		court.ui.data = {}
	end,
	true
)

--CourtButton_ContextTriggerEvent
-- interactions with menu buttons - local events, not model changes, so on need to be MP safe
core:add_listener (
	"CourtPosition_ContextTriggerEvent",
	"ContextTriggerEvent",
	function(context)
		return court.ui.data.court_ui_opened and context.string:split(":")[1] == "CourtButton"
	end,
	function(context)
		local params = context.string:split(":")
		local button_key = params[2]
		if button_key == "show_intrigues" then
			if court.ui.data.shown_intrigues then
				court.ui.hide_intrigues()
			else
				court.ui.show_intrigues()
			end
		elseif button_key == "show_plot_intrigues" then
			if court.ui.data.shown_plot_intrigues then
				court.ui.hide_plot_intrigues()
			else
				court.ui.show_plot_intrigues(court.ui.data.selected_plot_id)
			end
		elseif button_key == "show_requests" then
			if court.ui.data.shown_requests then
				court.ui.hide_requests()
			else
				court.ui.show_requests()
			end
		elseif button_key == "show_requests_dominance" then
			if court.ui.data.shown_requests_dominance then
				court.ui.hide_requests()
			else
				court.ui.show_requests(true)
			end
		elseif button_key == "show_plots" then
			if court.ui.data.shown_plots then
				court.ui.hide_plots()
			else
				court.ui.show_plots()
			end
		elseif button_key == "on_plot_selected" then
			local index_in_ui = tonumber(params[3])
			local plot_id = tonumber(params[4])
			if court.ui.data.waiting_intrigue then
				court.ui.data.additional_plot_selection_id = plot_id
				court.ui.interaction.on_intrigue_interacted(court.ui.data.waiting_intrigue)
			elseif court.ui.data.selected_plot_id ~= plot_id then
				court.ui.on_plot_selected(index_in_ui, plot_id)
				court.ui.show_plot_intrigues(court.ui.data.selected_plot_id)
			else
				court.ui.on_plot_deselected(index_in_ui)
			end
		elseif button_key == "on_plot_mouse_on" then
			if (not court.ui.data.selected_plot_id)
			then
				local index_in_ui = tonumber(params[3])
				local plot_id = tonumber(params[4])
				if court.ui.data.hovered_plot_id ~= plot_id then
					court.ui.data.hovered_plot_id = plot_id
					if court.ui.data.waiting_intrigue then
						local plot_component_name = "plot_component_"..plot_id
						local portrait_component = court.ui.components.referenced_components.panel:SequentialFind(plot_component_name)
						if portrait_component then
							local plot_data = court.plot_functions:get_plot_persistent_data(court.ui.data.faction_court.court_name, plot_id)
							court.ui.display_plot_data(portrait_component, plot_data)
						end
					else
						court.ui.show_plot_intrigues(plot_id)
					end
				end
			end
		elseif button_key == "on_plot_mouse_off" then
			local mouse_off_plot_id = court.ui.data.hovered_plot_id
			court.ui.data.hovered_plot_id = nil
			if court.ui.data.shown_plot_intrigues and 
				(not court.ui.data.selected_plot_id)
			then
				court.ui.hide_plot_intrigues()
			elseif court.ui.data.waiting_intrigue and mouse_off_plot_id then
				--display the plot without upgrade info
				local plot_component_name = "plot_component_"..mouse_off_plot_id
				local portrait_component = court.ui.components.referenced_components.panel:SequentialFind(plot_component_name)
				if portrait_component then
					local plot_data = court.plot_functions:get_plot_persistent_data(court.ui.data.faction_court.court_name, mouse_off_plot_id)
					court.ui.display_plot_data(portrait_component, plot_data)
				end
			end
		elseif button_key == "show_active_plots" then
			court.ui.hide_all_panels(true)
			court.ui.display_active_plots()
		elseif button_key == "show_overview" then
			court.ui.hide_all_panels(true)
			court.ui.display_overview()
		elseif button_key == "CourtPositionInteracted" then
			local position_key = params[3]
			court.ui.interaction.on_position_interacted(position_key)
		elseif button_key == "ZoomToRegion" then
			local position_key = params[3]
			court.ui.interaction.on_related_region_interacted(position_key)
		elseif button_key == "HeirContainerInteracted" then
			court.ui.interaction.on_heir_interacted()
		elseif button_key == "CourtPositionMouseOn" then
			if court.ui.data.selected_position_key == nil
				and court.ui.data.selected_heir_obj == nil
			then
				local position_key = params[3]
				if position_key ~= court.ui.data.hovered_position_key then
					court.ui.data.hovered_position_key = position_key
					court.ui.display_position_info_panel(position_key)
				end
			end
		elseif button_key == "HeirContainerMouseOff" then
			court.ui.data.hovered_heir_obj = nil
			if court.ui.data.selected_position_key == nil
				and court.ui.data.selected_heir_obj == nil
			then
				court.ui.hide_position_info_panel()
			end
		elseif button_key == "HeirContainerMouseOn" then
			if court.ui.data.selected_position_key == nil
				and court.ui.data.selected_heir_obj == nil
			then
				local ruling_faction_key = court.ui.data.faction_court:ruling_faction()
				local ruling_faction_obj = cm:get_faction(ruling_faction_key)
				local dynasty_heir = ruling_faction_obj:get_dynasty_heir()
				if dynasty_heir and (not dynasty_heir:is_null_interface())then
					court.ui.data.hovered_heir_obj = dynasty_heir
					court.ui.display_heir_info_panel(court.ui.data.hovered_heir_obj)
				end
			end
		elseif button_key == "CourtPositionMouseOff" then
			court.ui.data.hovered_position_key = nil
			if court.ui.data.selected_position_key == nil
				and court.ui.data.selected_heir_obj == nil
			then
				court.ui.hide_position_info_panel()
			end
		elseif button_key == "deselect_all" then
			court.ui.interaction.deselect_all()
		elseif button_key == "PharaohPositionInteracted" then
			local cqi = context.string:split(":")[3]
			court.ui.interaction.on_pharaoh_interacted(cqi)
		elseif button_key == "AvailableCharacterInteracted" then
			local character_cqi = context.string:split(":")[3]
			court.ui.interaction.on_available_character_interacted(character_cqi)
		elseif button_key == "request" then
			local use_dominance = params[3] == "true"
			local request_type = params[4]
			court.ui.interaction.on_request_interacted(request_type, use_dominance)
		elseif button_key == "court_discounts" then
			local discount_action = params[3]
			-- we remove all the params we used up, and pass on the remainder, if any
			table.remove(params, 1)
			table.remove(params, 1)
			table.remove(params, 1)
			court.ui.interaction.on_discounts_interacted(discount_action, params)
		elseif button_key == "intrigue" then
			local intrigue_name = params[3]
			court.ui.interaction.on_intrigue_interacted(intrigue_name)
		elseif button_key == "plot" then
			local plot_key = params[3]
			court.ui.interaction.on_plot_interacted(plot_key)
		elseif button_key == "purchase_action" then
			court.ui.interaction.on_purchase_action_interacted()
		elseif button_key == "leave_position" then
			court.ui.interaction.on_leave_position_interacted()
		elseif button_key == "kick_from_position" then
			court.ui.interaction.on_kick_from_position_interacted()
		elseif button_key == "claim_position" then
			court.ui.interaction.on_claim_position_interacted()
			court.ui.setup_claim_position_button()
		elseif button_key == "give_to_x" then
			local faction_key = params[3]
			court.ui.interaction.on_give_to_x_interacted(faction_key)
			court.ui.setup_claim_position_button()
		elseif button_key == "expand_all_plots" then
			court.ui.interaction.on_toggle_plot_expand_all_positions()
		elseif button_key == "toggle_expand_position_owned" then
			local position_key = context.string:split(":")[3]
			court.ui.interaction.on_toggle_plot_expand_position_interacted(position_key, true)
		elseif button_key == "toggle_expand_position_against" then
			local position_key = context.string:split(":")[3]
			court.ui.interaction.on_toggle_plot_expand_position_interacted(position_key, false)
		else
			court.output("Error: unknown button '".. button_key .. "'")
		end
	end,
	true
)

-- court_abilities_listener
core:add_listener(
	"court_abilities_listener",
	"ComponentLClickUp",
	function(context)
		return court.ui.data.court_ui_opened
	end,
	function(context)
		local component = UIComponent(context.component)
		local context_str = context.string
		local ability_property = component:GetProperty("court_ability")
		if not ability_property or ability_property == "" then 
			return
		end

		local court_ability_split = string.split(ability_property, ":")
		local court_ability = court_ability_split[1]

		if court_ability == "set_discounts" then
			local position_string = court_ability_split[2]
			local position_obj = court.util_functions.get_court_position(court.ui.data.faction_court, position_string)
			local remaining_cooldown = court.discount_functions.get_choose_discounts_remaining_cooldown(position_obj)
			if remaining_cooldown <= 0 then
				court.ui.display_court_discounts(position_string, "set")
			end
		elseif court_ability == "show_discounts" then
			local position_string = court_ability_split[2]
			court.ui.display_court_discounts(position_string, "learn")
		elseif court_ability == "trigger_dilemma" then
			court.ui.interaction.on_trigger_dilemma_interacted()
		elseif court_ability == "give_actions_ability" then
			court.ui.interaction.on_give_actions_ability_interacted()
		end
	end,
	true
)


--CourtButton_UITriggerScriptEvent
-- events from court actions - model-changing interactions that are sent to all machines
core:add_listener (
	"CourtPosition_UITriggerScriptEvent",
	"UITriggerScriptEvent",
	function(context)
		return context:trigger():split(":")[1] == "court_action"
	end,
	function(context)
		local params = context:trigger():split(":")
		local action_type = params[2]
		-- we remove all the params we used up, and pass on the remainder
		table.remove(params, 1)
		table.remove(params, 1)

		if action_type == "request" then
			court.ui.model_changing_events.on_request_event(params)
		elseif action_type == "intrigue" then
			court.ui.model_changing_events.on_intrigue_event(params)
		elseif action_type == "plot" then
			court.ui.model_changing_events.on_plot_created_event(params)
		elseif action_type == "trigger_dilemma" then
			court.ui.model_changing_events.on_trigger_dilemma_event(params)
		elseif action_type == "give_actions_ability" then
			court.ui.model_changing_events.on_give_actions_event(params)
		elseif action_type == "purchase_action" then
			court.ui.model_changing_events.on_purchase_action_event(params)
		elseif action_type == "set_discounts" then
			court.ui.model_changing_events.on_set_disounts_event(params)
		elseif action_type == "leave_position" then
			court.ui.model_changing_events.on_leave_position_event(params)
		elseif action_type == "claim_position" then
			court.ui.model_changing_events.on_claim_position_event(params)
		elseif action_type == "kick_from_position" then
			court.ui.model_changing_events.on_kick_from_position_event(params)
		elseif action_type == "give_position" then
			court.ui.model_changing_events.on_give_position_event(params)
		elseif action_type == "give_position_to_x" then
			court.ui.model_changing_events.on_give_position_to_x_event(params)
		else
			court.output("Error: unknown court action: '".. action_type .. "'")
		end
	end,
	true
)

--CourtUI_CourtActionTriggerScriptEvent
-- model-changing interactions that need to be sent to all machines
core:add_listener (
	"CourtUI_CourtActionTriggerScriptEvent",
	"CourtActionTriggerScriptEvent",
	function(context) 
		return context.stored_table and context.stored_table.acting_faction == cm:get_local_faction_name(true)
	end,
	function(context)
		if court.ui.data.court_ui_opened then
			court.ui.refresh_ui()
		end
		court.ui:update_court_button_actions_counter()
	end,
	true
)

--Court_legitimacy_unlocked
core:add_listener(
	"Court_legitimacy_unlocked",
	"LegitimacyPathUnlocked",
	true,
	function(context)
		local faction_key = context.stored_table.faction_key
		local local_faction_key = cm:get_local_faction_name(true)
		if faction_key == local_faction_key then
			-- this will clear the cached court result
			court.ui:update_court_button_visibility()
		else
			-- we need to clear the cache manually to recalculate the court belonging
			court.factions_court_cache[faction_key] = nil
		end
	end,
	true
)

--positions_FactionTurnStart
core:add_listener(
	"positions_FactionTurnStart",
	"FactionTurnStart",
	true,
	function(context)
		local faction_key = context:faction():name()
		local local_faction_key = cm:get_local_faction_name(true)
		if faction_key == local_faction_key then
			-- this will clear the cached court result
			court.ui:update_court_button_visibility()
		else
			-- we need to clear the cache manually to recalculate the court belonging
			court.factions_court_cache[faction_key] = nil
		end
	end,
	true
)

--court_TurnStartAutosaveFinished
core:add_listener(
	"court_TurnStartAutosaveFinished",
	"TurnStartAutosaveFinished",
	true,
	function(context)
		local local_faction_key = cm:get_local_faction_name(true)
		if local_faction_key then
			court.ui:update_court_button_visibility()
		end
	end,
	true
)

-- called on each game load and campaign start
cm:add_first_tick_callback(
	function(context)
		court.ui:update_court_button_visibility()
	end
)