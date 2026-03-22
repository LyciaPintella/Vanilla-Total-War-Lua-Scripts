-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	CAMPAIGN SCRIPT
--	This file gets loaded before any of the faction scripts
--
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

-- require a file in the factions subfolder that matches the name of our local faction. The model will be set up by the time
-- the ui is created, so we wait until this event to query who the local faction is. This is why we defer loading of our
-- faction scripts until this time.

-------------------------------------------------------
--	load in faction scripts when the game is created
-------------------------------------------------------

cm:add_pre_first_tick_callback(
	function()
		-- only load faction scripts if we have a local faction
		if not cm:get_local_faction_name(true) then
			return
		end

		-- load the legendary lord and rite unlock listeners when the ui is loaded
		--rite_unlock_listeners();

		-- if the tweaker to force the campaign prelude is set, then set the sbool value as if the tickbox had been ticked on the frontend
		if core:is_tweaker_set("FORCE_FULL_CAMPAIGN_PRELUDE") then
			core:svr_save_bool("sbool_player_selected_first_turn_intro_on_frontend", true)
		end

		-- if the tweaker to force the campaign prelude to the main section is set, then set the corresponding savegame value
		if core:is_tweaker_set("FORCE_CAMPAIGN_PRELUDE_TO_SECOND_PART") then
			core:svr_save_bool("sbool_player_selected_first_turn_intro_on_frontend", true)
			cm:set_saved_value("bool_first_turn_intro_completed", true)
		end

		local should_prelude = core:svr_load_bool("sbool_player_selected_first_turn_intro_on_frontend")
		if not (should_prelude or cm:get_saved_value("bool_is_ftue_mode")) then
			--clear up registry variables that have set specifically for tutorial
			core:svr_save_bool("sbool_replace_concede_with_skip_button", false)
			core:svr_save_bool("sbool_disable_advisor_for_tutorial_battles", false)
		end


		-- load the faction scripts
		-- loads the file in script/campaigns/<campaign_name>/factions/<faction_name>/<faction_name>_start.lua
		cm:load_local_faction_script("_start")
	end
)

ftue_active_ui_overrides = {}
ftue_event_overrides = true
ftue_listeners_saved_values = {
	end_turn = 0,
	counter_offer = 0
}
ftue_random_active_overrides = {
	research_override = true,
	offices_override = true,
	end_turn_shortcut_override = true,
	character_settlement_override = true,
	faction_leader_blacklist = true,
	divine_will_override = true,
}

cm:add_loading_game_callback(
	function(context)
		ftue_active_ui_overrides = cm:load_named_value("FTUE_ACTIVE_UI_OVERRIDES", ftue_active_ui_overrides, context)
		ftue_listeners_saved_values = cm:load_named_value("FTUE_ACTIVE_TP_LISTENERS", ftue_listeners_saved_values, context)
		ftue_random_active_overrides = cm:load_named_value("FTUE_RANDOM_ACTIVE_OVERRIDES", ftue_random_active_overrides, context)
		ftue_event_overrides = cm:load_named_value("FTUE_EVENT_OVERRIDES", ftue_event_overrides, context)
	end
)

function update_city_infobars_with_sacred_lands()
	local icon = sacred_egypt_lands_settlement_bar_icon
	for _, region_key in ipairs(sacred_egypt_lands) do
		cm:set_custom_settlement_info_icon(region_key, icon.icon_id, icon.icon_path, icon.tooltip_key)
	end

	icon = sacred_hatti_lands_settlement_bar_icon
	for _, region_key in ipairs(sacred_hatti_lands) do
		cm:set_custom_settlement_info_icon(region_key, icon.icon_id, icon.icon_path, icon.tooltip_key)
	end

	icon = sacred_meso_lands_settlement_bar_icon
	for _, region_key in ipairs(sacred_meso_lands) do
		cm:set_custom_settlement_info_icon(region_key, icon.icon_id, icon.icon_path, icon.tooltip_key)
	end

	icon = sacred_aeg_lands_settlement_bar_icon
	for _, region_key in ipairs(sacred_aeg_lands) do
		cm:set_custom_settlement_info_icon(region_key, icon.icon_id, icon.icon_path, icon.tooltip_key)
	end

	CampaignUI.UpdateSettlementEffectIcons()
end

function setup_sacred_regions_in_model()
	for _, region_key in ipairs(sacred_egypt_lands) do
		cm:set_is_sacred_egyptian_region(region_key, true)
	end

	for _, region_key in ipairs(sacred_hatti_lands) do
		cm:set_is_sacred_hatti_region(region_key, true)
	end

	for _, region_key in ipairs(sacred_aeg_lands) do
		cm:set_is_sacred_aeg_region(region_key, true)
	end

	for _, region_key in ipairs(sacred_meso_lands) do
		cm:set_is_sacred_meso_region(region_key, true)
	end
end

function setup_pillar_of_civilization_regions_in_model()
	for _, region_key in ipairs(pillars_civilization.config.regions) do
		cm:set_is_pillar_of_civilization_region(region_key, true)
	end
end

-------------------------------------------------------
--	functions to call when the first tick occurs
-------------------------------------------------------

cm:add_first_tick_callback_new(function() start_new_game_all_factions() end);
cm:add_first_tick_callback(function() start_game_all_factions() end);


-- Called when a new campaign game is started.
-- Put things here that need to be initialised only once, at the start 
-- of the first turn, but for all factions
-- This is run before start_game_all_factions()
function start_new_game_all_factions()
	out("start_new_game_all_factions() called")

	apply_default_diplomacy()

	if cm:is_multiplayer() then
		modular_difficulty_campaign.utility_functions.make_faction_leaders_mortal()
	end
end




-- Called each time a game is started/loaded.
-- Put things here that need to be initialised each time the game/script is
-- loaded here. This is run after start_new_game_all_factions()
function start_game_all_factions()
	out("start_game_all_factions() called")
	out.inc_tab()

	update_city_infobars_with_sacred_lands()

	setup_sacred_regions_in_model()
	setup_pillar_of_civilization_regions_in_model()
	
	local info_overlay = get_info_overlay()
	info_overlay:set_data_table(_information_overlays)
	info_overlay:set_tours_table(_scripted_tours)
	info_overlay:create_overlays()
	info_overlay:start_listeners()

	-- Commenting out the call to apply_default_diplomacy() in start_game_all_factions() because the diplomacy settings 
	-- are saved in the savefile and applying default diplomacy on every load resets changes made by some mechanics
	-- apply_default_diplomacy()

	-- listen for end of early game personalities
	if not cm:get_saved_value("ai_personalities_changed") then
		switch_ai_personality_listener()
	end

	out.dec_tab()

	uim:override("hide_gods_and_favour_container"):lock()
	
	--add_tutorial_menu_listeners()
	blood_markers_add_listeners()

	if phar_royal_decrees_methods then 
		phar_royal_decrees_methods.add_listeners()
	end

	if scripted_bonus_values then
		scripted_bonus_values.add_listeners()
	end

	if sea_scripted_titles then
		sea_scripted_titles.add_listeners()
	end

	if is_function(supply_points_add_listeners) then
		supply_points_add_listeners()
	end

	diplomacy_allowed_post_load_fixup()
end

-- switch the ai personalities at a point in the game
function switch_ai_personality_listener()
	core:add_listener(
		"ai_personalities",
		"RoundStart",
		function(context)
			return context:model():turn_number() == 71
		end,
		function()
			force_personality_change_in_all_factions()
		end,
		false
	)
end

function force_personality_change_in_all_factions()	
	out.design("force_personality_change_in_all_factions() called")

	cm:set_saved_value("ai_personalities_changed", true)
	
	local faction_list = cm:model():world():faction_list()

	for i = 0, faction_list:num_items() - 1 do
		local faction = faction_list:item_at(i)

		if not faction:is_human() then
			cm:cai_force_personality_change(faction:name())
		end
	end
end

core:add_listener(
	"default_diplomacy_listener",
	"ScriptEventAllDiplomacyEnabled",
	true,
	function()
		apply_default_diplomacy()
	end,
	true
)

core:add_listener(
	"ScriptEventIntroCutsceneFinished",
	"ScriptEventIntroCutsceneFinished",
	true,
	function()
		show_advisor_progress_buttons(true);
	end,
	false
);

-----------------------------------------------------------
-----------------New Phar default diplomacy----------------
-----------------------------------------------------------

function faction_should_be_able_to_confederate(faction)
	-- Allow major factions to propose confederations
	return faction:is_major()
end

function apply_default_diplomacy() 
	out("apply_default_diplomacy() called")
	-- Allow for all factions to access region trading
	-- We are still doing this here :(
	cm:force_diplomacy("all", "all", "regions" , true, true, false)
	-- Disallow legacy trade agreements, have been replaced by barter agreements
	cm:force_diplomacy("all", "all", "trade agreement" , false, false, false)
	-- Disallow legacy payments, have been replaced by single barters
	cm:force_diplomacy("all", "all", "payments", false, false, false)
	-- Disallow legacy marriages, they have been replaced by political and diplomatic marriage
	cm:force_diplomacy("all", "all", "marriage" , false, false, false)

	-- Lock out all factions from creating Vassals 
	cm:force_diplomacy("all", "all", "vassal", false, true, false)
	-- And subjects
	cm:force_diplomacy("all", "all", "subjugate" , false, true, false)
	cm:force_diplomacy("all", "all", "become subject" , true, false, false)

	-- Lock out all factions from granting diplomatic gifts, have been replaced by single barters
	cm:force_diplomacy("all", "all", "diplomatic gift", false, true, false)

	-- Lock out all factions from using dominance in diplomacy.
	cm:force_diplomacy("all", "all", "dominance", false, true, false)

	local factions_list = cm:model():world():faction_list()

	for i=0,factions_list:num_items() -1 do 
		local current_faction = factions_list:item_at(i)
		cm:force_diplomacy("faction:"..current_faction:name(),"all","form confederation", faction_should_be_able_to_confederate(current_faction), true, false)
	end
end

function diplomacy_allowed_post_load_fixup()
	-- Default diplomacy
	cm:force_diplomacy("all", "all", "subjugate" , false, true, false)
	cm:force_diplomacy("all", "all", "become subject" , true, false, false)

	for _, legitimacy_object in ipairs(legitimacy_choice.legitimacy_objects) do
		local political_states_object = legitimacy_object.political_states_system
		if political_states_object:political_state() == "legitimacy_war" then
			local pretenders = political_states_object.persistent.pretenders
			for _, pretender_key in ipairs(pretenders) do
				cm:force_diplomacy("faction:"..pretender_key, "all", "subjugate", true, false, false)
				cm:force_diplomacy("faction:"..pretender_key, "all", "become subject", false, true, false)
				local can_confederate = faction_should_be_able_to_confederate(cm:get_faction(pretender_key))
				cm:force_diplomacy("faction:"..pretender_key, "all", "form confederation", can_confederate, false, false)
			end
		elseif political_states_object:get_ruler_faction() then
			local ruler = political_states_object:get_ruler_faction()
			cm:force_diplomacy("faction:"..ruler, "all", "subjugate", true, false, false)
			cm:force_diplomacy("faction:"..ruler, "all", "become subject", false, true, false)
		end
	end
end

-- function add_tutorial_menu_listeners()
-- 	for k, v in pairs(tutorial_battles) do
-- 		core:add_listener (
-- 			v.button_listener_id,
-- 			"ComponentLClickUp",
-- 			function(context) return context.string == v.button_id end,
-- 			function(context)
-- 				start_tutorial_battle(k, false)
-- 			end,
-- 			true
-- 		)
-- 	end
-- end

-- function start_tutorial_battle(battle_id, is_from_campaign_tutorial)
-- 	local tutorial_menu = find_uicomponent(core:get_ui_root(), "options_tutorial_menu")
-- 	local battle = tutorial_battles[battle_id]

-- 	local string_id = "intro_battle_" .. battle_id

-- 	local start_the_battle = function()
-- 		if tutorial_menu:Visible() then	tutorial_menu:InterfaceFunction("toggle_tutorial_menu") end

-- 		if common.pref_as_integer("ui_unit_banner_description") == 0 then
-- 			common.set_pref_integer("ui_unit_banner_description", 2)
-- 			core:svr_save_bool("disable_unit_banner_description_on_battle_end", true)
-- 		end

-- 		core:svr_save_bool(string_id .. "_started", true)
-- 		common.set_custom_loading_screen_key(battle.loading_screen)
-- 		cm:add_custom_battlefield(
-- 			string_id,														-- string identifier
-- 			0,																-- x co-ord
-- 			0,																-- y co-ord
-- 			0,																-- radius around position
-- 			false,															-- will campaign be dumped
-- 			"",																-- loading override
-- 			"",																-- script override
-- 			battle.xml_path,												-- entire battle override
-- 			0,																-- human alliance when battle override
-- 			true,															-- launch battle immediately
-- 			true,															-- is land battle (only for launch battle immediately)
-- 			false,															-- force application of autoresolver result
-- 			false,															-- force a siege battle to be fought outside the settlement as a land battle
-- 			false															-- disable fortification towers (for siege battles)
-- 		)
-- 	end

-- 	if is_from_campaign_tutorial then
-- 		start_the_battle()
-- 	else
-- 		create_confirmation_box(string_id .. "_box", battle.confirmation_loc_key, start_the_battle)
-- 	end
-- end

-- core:add_listener(
-- 	"temp_fist_campaign_panel",
-- 	"FirstTickAfterNewCampaignStarted",
-- 	function(context)
-- 		--return true
-- 		-- temp fix so the window doesn't open in other campaigns and doesn't show on saves after turn 1.
-- 		local model = context:model()
-- 		return model:campaign_name("phar_main") and model:turn_number() <= 1
-- 	end,
-- 	function(context)
-- 		if cm:is_benchmark_mode() then
-- 			return
-- 		end
-- 		local uic = core:get_or_create_component("new_game_panel", "UI/Campaign UI/phar_new_game_panel")
-- 		if uic then
-- 			local text = core:get_ui_root():SequentialFind("dy_flavour_text")
-- 			if text then
-- 				 -- change text for panel here
-- 				text:SetText(common.get_localised_string("ui_text_replacements_localised_text_phar_main_playable_campaign_instructions_plah"))
-- 			end
-- 		end
-- 	end,
-- 	true
-- )


core:add_ui_created_callback(
	function()
		core:add_listener(
			"temp_campaign_explain",
			"ComponentLClickUp",
			function(context)
				return uicomponent_descended_from(UIComponent(context.component), "new_game_panel")
			end,
			function(context)
				local comp = UIComponent(context.component)
				local comp = core:get_ui_root():SequentialFind("new_game_panel")
				if comp and context.string == "button_ok" then
					comp:Destroy()
					core:remove_listener("temp_campaign_explain")
				end
			end,
			true
		)
	end
)


local additional_victory_regions = {
	["phar_main_bay"] = {
		"phar_main_tyre_hazor",
		"phar_main_tyre_byblos",
		"phar_main_alashiya_alashiya",
		"phar_main_alashiya_kition",
		"phar_main_alashiya_paphos",
	},
	["phar_main_suppiluliuma"] = {
		"phar_main_hattussa_arinna",
	},
}

cm:add_first_tick_callback_sp_new(
	function()
		local faction_list = cm:model():world():faction_list()
		for i = 0, faction_list:num_items() - 1 do
			local curr_faction = faction_list:item_at(i)
			local curr_faction_name = curr_faction:name()
			
			-- adding unique victory region hints for specific factions
			-- these hints are added on top of the existing ones in the databse, which are shared for entire cultures
			if additional_victory_regions[curr_faction_name] then
				for _,region_key in pairs(additional_victory_regions[curr_faction_name]) do
					cm:cai_add_region_hint(curr_faction, region_key)
				end
			end
		end
	end
);