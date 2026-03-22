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
		if should_prelude or cm:get_saved_value("bool_is_ftue_mode") then
			if cm:load_local_faction_script("_ftue") then
				disable_onboarding_missions()
			end
		end
		-- load the faction scripts
		-- loads the file in script/campaigns/<campaign_name>/factions/<faction_name>/<faction_name>_start.lua
		cm:load_local_faction_script("_start")

		if CharacterSkillsScriptedEffectsInit then
			CharacterSkillsScriptedEffectsInit()
		end
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

	CampaignUI.UpdateSettlementEffectIcons()
end

function setup_sacred_regions_in_model()
	for _, region_key in ipairs(sacred_egypt_lands) do
		cm:set_is_sacred_egyptian_region(region_key, true)
	end

	for _, region_key in ipairs(sacred_hatti_lands) do
		cm:set_is_sacred_hatti_region(region_key, true)
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

	populate_port_markers()
	out("populate_port_markers()")
	-- put the camera at the player's faction leader at the start of a new game
	--cm:position_camera_at_primary_military_force(cm:get_local_faction_name(true));

	-- Hack : Set Helen objective for Paris to completed by default 
		cm:complete_scripted_mission_objective(
			"troy_main_personal_victory_paris",
			"troy_main_trj_paris_personal_objective_control_helen",
			true
		)

	--add_very_hard_armies();
	cm:set_can_autoresolve_settlement_battle("settlement:troy_main_ilion_troy", false, "ui_text_replacements_localised_text_troy_garrison_autoresolve")
	out("Set settlement troy_main_ilion_troy to be unable to autoresolve battles")

	if modular_cinematics then
		local human_factions = cm:get_human_factions()
		for i = 1, #human_factions do
			modular_cinematics:add_faction(human_factions[i])
		end
	end
	AchillesGreatest_StartPosSetup()
	AchillesHotBlooded_StartPosSetup()

	if ambitions then
		ambitions.new_game_initialization()
	end

	if campaign_traits then
		campaign_traits.new_game_initialization()
	end
end




-- Called each time a game is started/loaded.
-- Put things here that need to be initialised each time the game/script is
-- loaded here. This is run after start_new_game_all_factions()
function start_game_all_factions()
	out("start_game_all_factions() called")
	out.inc_tab()

	-- start the character loyalty traits script for Troy
	--setup_loyalty_traits()
	--start_pos_loyalty_effects()
	update_city_infobars_with_sacred_lands()

	setup_sacred_regions_in_model()

	-- start all scripted behaviours that should apply across all campaigns
	setup_troy_campaign()
	local info_overlay = get_info_overlay()
	info_overlay:set_data_table(_information_overlays)
	info_overlay:set_tours_table(_scripted_tours)
	info_overlay:create_overlays()
	info_overlay:start_listeners()

	-- time to populate the table of effects related to Gods and Favour

	local gods = cm:model():world():god_manager():gods()
	for i=0,gods:num_items()-1 do
		local effect_key = gods:item_at(i):resource_key()
		effect_key = string.gsub(effect_key,"troy_god_attitude_","troy_effect_gods_favour_mod_")
		table.insert(gods_effects,effect_key)
	end

	apply_default_diplomacy()

	-- listen for end of early game personalities
	if not cm:get_saved_value("ai_personalities_changed") then
		switch_ai_personality_listener()
	end

	out.dec_tab()

	if modular_cinematics then
		modular_cinematics:add_listeners()
	end

	Add_Realms_Listeners()
	add_favour_listeners()
	add_taunt_listeners()
	if cm:get_campaign_name() ~= "phar_main" then
		add_favour_level_listeners()
	else
		uim:override("hide_gods_and_favour_container"):lock()
	end

	if campaign_traits then
		campaign_traits.start_background_trait_listeners()
		campaign_traits.setup_phar_traits_listeners()
	end
	--add_loyalty_effect_listeners()
	-- add_loyalty_ancillary_listeners()
	king_of_men_add_listeners()
	Add_Odyssey_War_Listeners()
	achilles_hot_blooded_add_listeners()
	achilles_greatest_add_listeners()
	aeneas_divine_missions_add_listeners()
	add_sacrifices_and_rituals_listeners()
	epic_agent_recruitment_and_actions_add_listeners()
	aeneas_speak_to_the_dead_add_listeners()
	--SarpedonLuxuryGoods_StartGameSetup()
	--SarpedonTradeGuild_AddListeners()
	--PenthesileaMomentum_AddListeners()
	capture_bonuses.add_listeners()
	--HippolytaCulture_AddListeners()
	military_strategy_add_listeners()
	ParisHelen_StartGameSetup()
	Add_Hector_Trojan_Alliance_Listeners()
	blood_markers_add_listeners()
	add_menelaus_reliable_friend_listeners()
	dio_champions_add_listeners()

	add_tutorial_menu_listeners()
	EventChainsProcessing_AddListeners()
	--troy_adi_ajax_renown_init()
	
	horde_cannot_reinforce_bundle_application_and_save_buildings()
	supply_points_add_listeners()
	if thracian_rituals then
		thracian_rituals.add_listeners()
	end
	if pharaohs_servant then
		pharaohs_servant.add_listeners()
	end
	if countless_host then
		countless_host.add_listeners()
	end
	if exotic_strategist then
		exotic_strategist.add_listeners()
	end
	if memnon_disable_recruit_button then
		memnon_disable_recruit_button()
	end
	if ambitions then
		ambitions.add_listeners()
	end

	if phar_royal_decrees_methods then 
		phar_royal_decrees_methods.add_listeners()
	end

	if scripted_bonus_values then
		scripted_bonus_values.add_listeners()
	end

	cm:set_can_autoresolve_settlement_battle("settlement:troy_main_ilion_troy", false, "ui_text_replacements_localised_text_troy_garrison_autoresolve")
	out("Set settlement troy_main_ilion_troy to be unable to autoresolve battles")

	setup_island_regions()
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

core:add_listener(
	"Remove_odysseus_agent_for_AI",
	"FactionTurnStart",
	true,
	function(context)
		local ithaca = cm:get_faction("troy_main_dan_ithaca")
		if ithaca and ithaca:is_human() == false then
			local faction_char_list = ithaca:character_list()
			local spy
			for i=0, faction_char_list:num_items() -1 do
				if faction_char_list:item_at(i):character_subtype("troy_agent_spy") then 
					spy = faction_char_list:item_at(i)
				end
			end
			if spy then
				cm:force_character_to_leave(spy:command_queue_index())
			end
		end
	end,
	false
);

core:add_listener(
	"ensure_troy_armies_do_not_move",
	"CharacterTurnStart",
	function(context)
		local char = context:character()
		return char:faction():name() == "troy_main_trj_troy" and char:get_forename() == "names_name_1108988864"
	end,
	function(context)
		cm:cai_disable_movement_for_character(cm:char_lookup_str(context:character()))
	end,
	true
)

-----------------------------------------------------------
-----------------New Troy default diplomacy----------------
-----------------------------------------------------------
function apply_default_diplomacy() 
	out("apply_default_diplomacy() called")
	-- Allow for all factions to access region trading
	-- We are still doing this here :(
	cm:force_diplomacy("all", "all", "regions" , true, true, false)
	cm:force_diplomacy("all", "all", "trade agreement" , false, false, false)
	cm:force_diplomacy("all", "all", "payments", false, false, false)

	-- Lock out all factions from creating Vassals (now implemented as subjects)
	cm:force_diplomacy("all", "all", "subjugate", false, true, false)
	cm:force_diplomacy("all", "all", "become subject", true, false, false)
	-- Allow Agamenmon's faction to create Vassals (now implemented as subjects)
	cm:force_diplomacy("faction:troy_main_dan_mycenae","all","subjugate", true, false, false)
	cm:force_diplomacy("faction:troy_main_dan_mycenae","all","become subject", false, true, false)

	-- Lock out all factions from granting diplomatic gifts 
	cm:force_diplomacy("all", "all", "diplomatic gift", false, true, false)

	-- Lock out all factions from using dominance in diplomacy, except for Diomedes.
	cm:force_diplomacy("all", "all", "dominance", false, true, false)
	cm:force_diplomacy("faction:troy_main_dan_argos", "all" ,"dominance", true, true, false)

	local factions_list = cm:model():world():faction_list()

	for i=0,factions_list:num_items() -1 do 
		local current_faction = factions_list:item_at(i)
		if not current_faction:is_major() then
			cm:force_diplomacy("faction:"..current_faction:name(),"all","form confederation", true, false, false)
		end
		if current_faction:name() == "troy_main_trj_paris" and current_faction:is_human() then
			cm:force_diplomacy("all","faction:troy_main_trj_hector","form confederation", false, false, false)
		elseif current_faction:name() == "troy_main_trj_hector" and current_faction:is_human() then
			cm:force_diplomacy("all","faction:troy_main_trj_paris","form confederation", false, false, false)
		end
	end

	-- Blcok Paris and Hector from confederating
	cm:force_diplomacy("faction:troy_main_trj_hector","faction:troy_main_trj_paris","form confederation", false, false, true)

	-- This is ugly but I couldn't come up with a smarter solution 
	if antagonist.current ~= "" then
		cm:force_diplomacy("all", "faction:"..antagonist.current, "form confederation", false, true, false)
	end
	if antagonist.current ~= "" and antagonist.revealed_to_player then
		cm:force_diplomacy(
			"faction:"..antagonist.current,
			"faction:"..cm:get_local_faction_name(),
			"all",
			false,
			false,
			true,
			true
		)
	end
end

function add_tutorial_menu_listeners()
	for k, v in pairs(tutorial_battles) do
		core:add_listener (
			v.button_listener_id,
			"ComponentLClickUp",
			function(context) return context.string == v.button_id end,
			function(context)
				start_tutorial_battle(k, false)
			end,
			true
		)
	end
end

function start_tutorial_battle(battle_id, is_from_campaign_tutorial)
	local tutorial_menu = find_uicomponent(core:get_ui_root(), "options_tutorial_menu")
	local battle = tutorial_battles[battle_id]

	local string_id = "intro_battle_" .. battle_id

	local start_the_battle = function()
		if tutorial_menu:Visible() then	tutorial_menu:InterfaceFunction("toggle_tutorial_menu") end

		if common.pref_as_integer("ui_unit_banner_description") == 0 then
			common.set_pref_integer("ui_unit_banner_description", 2)
			core:svr_save_bool("disable_unit_banner_description_on_battle_end", true)
		end

		core:svr_save_bool(string_id .. "_started", true)
		common.set_custom_loading_screen_key(battle.loading_screen)
		cm:add_custom_battlefield(
			string_id,														-- string identifier
			0,																-- x co-ord
			0,																-- y co-ord
			0,																-- radius around position
			false,															-- will campaign be dumped
			"",																-- loading override
			"",																-- script override
			battle.xml_path,												-- entire battle override
			0,																-- human alliance when battle override
			true,															-- launch battle immediately
			true,															-- is land battle (only for launch battle immediately)
			false,															-- force application of autoresolver result
			false,															-- force a siege battle to be fought outside the settlement as a land battle
			false															-- disable fortification towers (for siege battles)
		)
	end

	if is_from_campaign_tutorial then
		start_the_battle()
	else
		create_confirmation_box(string_id .. "_box", battle.confirmation_loc_key, start_the_battle)
	end
end

function merc()
	local fac = cm:get_faction(cm:get_local_faction_name())
	cm:add_unit_to_faction_mercenary_pool(fac, "troy_myth_minotaur", 2, 0, 5, 0, 0, "", "", "")
end

function disable_onboarding_missions()
	start_early_game_shared_missions = function()
		return
	end
	start_early_game_missions_agamemnon = function() 
		return
	end
end

end_turn_file_name = nil
function province_buildings_round_summary_start()
	out("Starting province_buildings_round_summary dump...")
	core:add_listener(
		"provice_round_summary_listener",
		"RoundStart",
		function(context)
			return true
		end,
		function(context)
			local end_turn_file = nil
			if not end_turn_file_name then
				end_turn_file_name = "../working_data/script/end_turn_building_logs/end_turn_buildings_" .. os.date("%Y_%m_%d_%H_%M_%S") .. ".txt"
				end_turn_file = io.open(end_turn_file_name, "w")
				if not end_turn_file then
					out("Failed to open file " .. end_turn_file_name .. " . Stopping...")
					province_buildings_round_summary_stop()
					do return end
				end
				end_turn_file:write("Owning Faction key,Region key,Slot key,Slot Type,Building key,Turn\n")
			else
				end_turn_file = io.open(end_turn_file_name, "a")
				if not end_turn_file then
					out("Failed to open file " .. end_turn_file_name .. " . Stopping...")
					province_buildings_round_summary_stop()
					do return end
				end
			end

			log_provices_buildings(end_turn_file, context:model():world():province_manager():province_list())

			end_turn_file:write("\n")
			end_turn_file:close()
		end,
		true
	)
end

function log_provices_buildings(file, provinces)
	for i = 0, provinces:num_items() - 1 do
		local province = provinces:item_at(i)
		for j = 0, province:regions():num_items() - 1 do
			local region = province:regions():item_at(j)
			local slot_string = ""
			for m = 0, region:slot_list():num_items() - 1 do
				local slot = region:slot_list():item_at(m)
				if not slot:building():is_null_interface() then
					file:write(region:name() .. "," .. region:owning_faction():name() .. "," .. slot:name() .. "," .. slot:type() .. "," .. slot:building():name() .. "," .. cm:model():turn_number() .. "\n")
				end
			end
		end
	end
end

function province_buildings_round_summary_for_turn(turn_number)
	out("Starting province_buildings_round_summary_for_turn listener...")
	core:add_listener(
		"province_round_summary_for_turn_listener",
		"RoundStart",
		function(context)
			return true
		end,
		function(context)
			if cm:model():turn_number() == turn_number then
				local end_turn_file_name = "../working_data/script/end_turn_building_logs/end_turn_buildings_turn_".. turn_number .. "_" .. os.date("%Y_%m_%d_%H_%M_%S") .. ".txt"
				local end_turn_file = io.open(end_turn_file_name, "w")
				if not end_turn_file then
					out("Failed to open file " .. end_turn_file_name .. " . Stopping...")
					core:remove_listener("province_round_summary_for_turn_listener")
					do return end
				end
				end_turn_file:write("Owning Faction key,Region key,Slot key,Slot Type,Building key,Turn\n")
				log_provices_buildings(end_turn_file, context:model():world():province_manager():province_list())
				end_turn_file:close()
				core:remove_listener("province_round_summary_for_turn_listener")
			end
		end,
		true
	)
end

function province_buildings_round_summary_stop()
	out("Stopping province_buildings_round_summary dump...")
	core:remove_listener("provice_round_summary_listener")
	end_turn_file_name = nil
end

function get_camera_pos()
	local x,y,d,b,h = cm:get_camera_position()
	out(x)
	out(y)
	out(d)
	out(b)
	out(h)
end

function get_camera_pos_cindy()
	local posx, posy, posz, tarx, tary, tarz = cm:get_camera_position_cindy_format()
	out("POSITION")
	out(posx)
	out(posy)
	out(posz)

	out("TARGET")
	out(tarx)
	out(tary)
	out(tarz)
end

-- Adding the dummy effect bundle to all of Penthesilea and Memnon armies so they appear in the pre-battle screen.
function horde_cannot_reinforce_bundle_application_and_save_buildings()
	local factions_to_apply_cannot_reinforce_bundle = {
		[1] = {
			faction_key = "troy_amazons_trj_penthesilea",
			bundle_key = "effect_bundle_dummy_cannot_reinforce",
			save_buildings = true
		},
		[2] = {
			faction_key = "troy_rem_horde_aethiopians",
			bundle_key = "troy_rem_effect_bundle_dummy_cannot_reinforce",
			save_buildings = false
		},
	}

	for _, entry in ipairs(factions_to_apply_cannot_reinforce_bundle) do
		local faction = cm:get_faction(entry.faction_key)

		if not faction or faction:is_null_interface() then
			return
		end

		local force_list = faction:military_force_list()
		for i=0, force_list:num_items() - 1 do
			cm:apply_effect_bundle_to_force(entry.bundle_key, force_list:item_at(i):command_queue_index(), 0)
			--#MILITARY_FORCE_TYPE_INTEGRATION_TODO: This should be handled by the force type. You could make an override method if you like too.
			--if entry.save_buildings then 
				--cm:set_horde_save_buildings(cm:char_lookup_str(force_list:item_at(i):general_character()), true)
			--end
		end

		core:add_listener(
		"horde_force_created_cannot_reinforce_bundle_listener_for_" .. entry.faction_key,
		"MilitaryForceCreated",
		function(context) return context:military_force_created():faction() == faction end,
		function(context)
			cm:apply_effect_bundle_to_force(entry.bundle_key, context:military_force_created():command_queue_index(), 0)
		end,
		false
		);
	end
end

-- Functionality for testing - spawning champion rogue armies
function spawn_champions()
	for _,data in pairs(rogue_armies_info) do
		-- spawn army
		cm:spawn_rogue_army(data.faction_key, data.spawn_x, data.spawn_y)
	
		-- commander level & skills setup
		if is_table(data.skills) or is_number(data.level) then
			local forces = cm:get_faction(data.faction_key):military_force_list()
			if forces then
				local last_force = forces:item_at(forces:num_items() - 1)
				if last_force then
					local cqi = last_force:general_character():command_queue_index()
					local character_lookup_string = "faction:"..data.faction_key..",cqi:"..tostring(cqi)
					
					-- level
					if is_number(data.level) then
						local level = math.clamp(data.level, 1, #cm.character_xp_per_level)
						local xp = last_force:general_character():experience_required_for_rank(level)
						if xp > 0 then
							cm:add_agent_experience(character_lookup_string, xp);
						end
					end
					
					-- skills
					if is_table(data.skills) then
						for _,skill_id in ipairs(data.skills) do
							cm:force_add_skill(character_lookup_string, skill_id, true)
						end
					end

				end
			end
		end

	end
end
function memnon_disable_recruit_button()
	if cm:get_local_faction_name(true) == "troy_rem_horde_aethiopians" then
		if cm:get_campaign_name() ~= "troy_mythic" then
			uim:override("hide_units"):lock(true)
		end
		uim:override("show_mercenaries"):lock(true)
	end
end
--temp season display
core:add_listener(
	"temp_season_display",
	"FactionTurnStart",
	function(context)
		return context:faction():name() == cm:get_local_faction_name()
	end,
	function()
		local hud = core:get_ui_root():SequentialFind("hud_campaign")
		local uic = core:get_or_create_component("temp_season_display", "UI/templates/cycle_text_button", hud)
		local dy_txt = UIComponent(uic:Find(0))
		uic:SetMoveable(true)
		local size_x, size_y = core:get_ui_root():Dimensions()
		uic:MoveTo(50, size_y / 2 + 100)
		uic:SetMoveable(false)
		dy_txt:SetStateText(cm:model():current_season_name(), "ph")
	end,
	true
)

cm:add_first_tick_callback_new(function()
	
end);

core:add_listener(
	"temp_fist_campaign_panel",
	"FirstTickAfterNewCampaignStarted",
	function(context)
		--return true
		-- temp fix so the window doesn't open in other campaigns and doesn't show on saves after turn 1.
		local model = context:model()
		return model:campaign_name("phar_main") and model:turn_number() <= 1
	end,
	function(context)
		if cm:is_benchmark_mode() then
			return
		end
		local uic = core:get_or_create_component("new_game_panel", "UI/Campaign UI/phar_new_game_panel")
		if uic then
			local text = core:get_ui_root():SequentialFind("dy_flavour_text")
			if text then
				 -- change text for panel here
				text:SetText(common.get_localised_string("ui_text_replacements_localised_text_phar_main_playable_campaign_instructions_plah"))
			end
		end
	end,
	true
)

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