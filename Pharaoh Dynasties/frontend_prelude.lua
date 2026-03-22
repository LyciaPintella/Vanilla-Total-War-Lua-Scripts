require "script.campaign.phar_modular_difficulty_config"



--
-- 	Scripted behaviour for launching the prelude
--



-- custom loading screens used when the "intro" option is checked on the frontend
--[[ custom_loading_screens_with_intro = {
} ]]


-- custom loading screens used when the "intro" option is NOT checked on the frontend
custom_loading_screens_no_intro = {
	--Troy campaign
	--[[ ["125989674"] = "troy_main_dan_sparta",
	["295030245"] = "troy_main_trj_paris",
	["1391922313"] = "troy_main_trj_hector",
	["2030329467"] = "troy_main_dan_mycenae",
	["549090102"] = "troy_main_trj_dardania",
	["816408556"] = "troy_main_dan_achilles",
	["796350648"] = "troy_main_dan_ithaca",
	["1723529625"] = "troy_main_trj_lycia" ]]
	["troy_main_dan_sparta"] 	= true,
	["troy_main_trj_paris"] 	= true,
	["troy_main_trj_hector"] 	= true,
	["troy_main_dan_mycenae"] 	= true,
	["troy_main_trj_dardania"] 	= true,
	["troy_main_dan_achilles"] 	= true,
	["troy_main_dan_ithaca"] 	= true,
	["troy_main_trj_lycia"] 	= true,
	["troy_amazons_trj_hippolyta"]	= true,
	["troy_amazons_trj_penthesilea"]	= true,
	["troy_main_dan_salamis"] = true,
	["troy_main_dan_argos"] = true,
	["troy_rem_trj_thrace"] = true,
	["troy_rem_horde_aethiopians"] = true,
	["phar_main_tausret"] = true,
	["phar_main_amenmesse"] = true,
	["phar_main_bay"] = true,
	["phar_main_irsu"] = true,
	["phar_main_ramesses"] = true,
	["phar_main_suppiluliuma"] = true,
	["phar_main_kurunta"] = true,
	["phar_main_seti"] = true,
	["phar_map_babylon"] = true,
	["phar_map_ninurta"] = true,
	["troy_main_trj_troy"] = true,



}

custom_loading_screens_intro_movies = {
	--Troy campaign
	--[[ ["125989674"] = "troy_main_dan_sparta",
	["295030245"] = "troy_main_trj_paris",
	["1391922313"] = "troy_main_trj_hector",
	["2030329467"] = "troy_main_dan_mycenae",
	["549090102"] = "troy_main_trj_dardania",
	["816408556"] = "troy_main_dan_achilles",
	["796350648"] = "troy_main_dan_ithaca",
	["1723529625"] = "troy_main_trj_lycia" ]]
	["troy_main_dan_sparta"] 	= "camp_intro_ach",
	["troy_main_trj_paris"] 	= "camp_intro_trj",
	["troy_main_trj_hector"] 	= "camp_intro_trj",
	["troy_main_dan_mycenae"] 	= "camp_intro_ach",
	["troy_main_trj_dardania"] 	= "camp_intro_trj",
	["troy_main_dan_achilles"] 	= "camp_intro_ach",
	["troy_main_dan_ithaca"] 	= "camp_intro_ach",
	["troy_main_trj_lycia"] 	= "camp_intro_trj",
	["troy_amazons_trj_hippolyta"]	= "camp_intro_trj",
	["troy_amazons_trj_penthesilea"]	= "camp_intro_trj",
	["troy_main_dan_salamis"] = "camp_intro_ach",
	["troy_main_dan_argos"] = "camp_intro_ach",
	["troy_rem_trj_thrace"]	= "camp_intro_trj",
	["troy_rem_horde_aethiopians"]	= "camp_intro_trj",
}

--	load script libraries
load_script_libraries()

-- need this for the victory objectives on faction selection screen
require "script.campaign.victory_objectives"
-- now that victory condition configs are split per campaign we need to load the appropriate config for the selected campaign
core:add_listener(
	"frontend_transition_to_faction_selection",
	"FrontendScreenTransition",
	function(context) return context.string == "sp_grand_campaign" end,
	function(context)
		local uic_grand_campaign = find_uicomponent("sp_grand_campaign")
			
		if not uic_grand_campaign then
			script_error("ERROR: start_new_campaign_listener() couldn't find uic_grand_campaign, how can this be?")
			return false
		end
		
		local campaign_key = uic_grand_campaign:GetProperty("campaign_key")
		if campaign_key then
			-- this should be okay, because force_require unloads the module before requiring it 
			-- since these files share the same name it will unload properly, regardless of which campaign has been loaded previously
			force_require("script.campaign." .. campaign_key .. ".victory_objectives_config")
		end
	end,
	true	
)

-- need this for tutorial_battles
require "script.battle.intro_battles.troy_all.troy_tutorial_battles"

require "script.campaign.constants"

require "script.campaign.phar_faction_summary"
-- attempt to generate documentation if we haven't already this game session
do	
	-- Should documentation generation happen by default. Setting this to true is the same as setting the GENERATE_SCRIPT_DOCGEN tweaker.
	local generate_by_default = true;
	
	if vfs.exists("script/docgen.lua") and not common.is_autotest() then

		local potentially_generate = generate_by_default or core:is_tweaker_set("GENERATE_SCRIPT_DOCGEN");
		local always_generate = core:is_tweaker_set("ALWAYS_GENERATE_SCRIPT_DOCGEN");

		local svr = ScriptedValueRegistry:new();

		if always_generate or (potentially_generate and svr:LoadPersistentBool("autodoc_generated") ~= true) then
			require("script.docgen");
			
			if generate_documentation() then
				svr:SavePersistentBool("autodoc_generated", true);
			end;

			package.loaded["script.docgen"] = nil;
		end;
	end;
end


--	set the default campaign launch mode to not launch the prelude battle by default
--core:svr_save_bool("sbool_player_selected_first_turn_intro_on_frontend", false)
core:svr_save_bool("sbool_tutorial_battle_selected_from_frontend", false)



core:add_listener(
	"frontend_ui_created_listener",
	"UICreated",
	true,
	function(context)		
		--start_new_campaign_listener()
		start_campaign_launch_listener()

		output_uicomponent_on_click()

		-- go to the credits screen immediately if this saved value is set
		if core:svr_load_bool("sbool_frontend_play_credits_immediately") then
			core:svr_save_bool("sbool_frontend_play_credits_immediately", false)

			local uic_button_credits = find_uicomponent("button_credits")
			if uic_button_credits then
				uic_button_credits:SimulateLClick()
			end
		end

		--[[ if core:is_tweaker_set("UNLOCK_FRONTEND_MOVIES") then
			unlock_campaign_movies()
		end ]]		
	end,
	false
)

-- Sets the parameters of Victory conditions in Faction Selection screen
core:add_listener(
	"FactionSelectionScreen_ScriptedObjectiveAdded",
	"ObjectivesPanelScriptedObjectiveAddedFrontend",
	true,
	function(context)
		local item = UIComponent(context.component)
		if item:Id() == "condition" then
			item = item:SequentialFind("dy_condition")
		end

		local scripted_key = context.string
		local current_text = item:GetStateText()
		current_text = current_text:gsub("%%n", "%%d")

		for faction_key,faction_table in pairs(victory_conditions_data) do
			for _,entry in pairs(faction_table) do
				if entry.script_key == scripted_key then
					local new_text
					if entry.extra_param then
						new_text = string.format(current_text, entry.extra_param, entry.progress_current, entry.progress_max)
					else
						new_text = string.format(current_text, entry.progress_current, entry.progress_max)
					end

					item:SetText(new_text, "frontend_prelude.lua: " .. debug.getinfo(1).currentline)
					return
				end
			end
		end
	end,
	true
)

--	listen for the singleplayer grand campaign screen being opened and
--	work out if we should check the 'start prelude' checkbox by default
--[[ function start_new_campaign_listener()
	core:add_listener(
		"start_new_campaign_listener",
		"FrontendScreenTransition",
		function(context) return context.string == "sp_grand_campaign" end,
		function(context)
			local uic_grand_campaign = find_uicomponent("sp_grand_campaign")
				
			if not uic_grand_campaign then
				script_error("ERROR: start_new_campaign_listener() couldn't find uic_grand_campaign, how can this be?")
				return false
			end
				
			if uic_grand_campaign:GetProperty("campaign_key") == "" and should_check_start_prelude_by_default() then
				out("Checking prelude checkbox as player has not listened to any startup advice")
				
				uic_grand_campaign:InterfaceFunction("SetupForFirstTime")
			end 
		end,
		true	
	)
end ]]


--	listen for the 'start campaign' button being clicked and work out if we should
--	start the prelude battle based on the value of the 'start prelude' checkbox
function start_campaign_launch_listener()
	core:add_listener(
		"start_campaign_button_listener",
		"ComponentLClickUp",
		function(context) return context.string == "button_start_campaign" end,
		function(context)			
			-- work out if we have to load the full intro
			local uic_prelude = find_uicomponent("checkbox_start_prelude")
			-- out("ICON PRELUDE STATE: " .. uic_prelude:CurrentState())
			intro_enabled = (uic_prelude and uic_prelude:CurrentState() == "selected") or core:is_tweaker_set("FORCE_FULL_CAMPAIGN_PRELUDE")

			-- try and set a custom loading screen
			-- only if we're not continuing a campaign trough the front end
			local header_submenu = find_uicomponent("sp_grand_campaign" , "header_container" , "header_submenu")
			if header_submenu then 
				set_custom_loading_screen(false)
			end

			if intro_enabled then
				-- this value will be read by the campaign script to decide what to do
				core:svr_save_bool("sbool_player_selected_first_turn_intro_on_frontend", true)
			end 
		end,
		true
	)
end







function set_custom_loading_screen(intro_enabled)
	-- Find the header submenu listing the current culture's available Heroes
	local header_submenu = find_uicomponent("sp_grand_campaign" , "header_container" , "header_submenu")
	if header_submenu then 
		for i=0, header_submenu:ChildCount() - 1 do 
			local uic_child = UIComponent(header_submenu:Find(i))
			if uic_child and uic_child:CurrentState() == "selected" and custom_loading_screens_no_intro[uic_child:Id()] then 
				common.set_custom_loading_screen_key(uic_child:Id())
				unlock_movies_for_faction(uic_child:Id())
				break
			end
		end
	else
		script_error("ERROR: set_custom_loading_screen() called but couldn't find the header submenu. Has the layout changed ?")
	end
end

function unlock_movies_for_faction(faction_key)
	if custom_loading_screens_intro_movies[faction_key] then
		core:svr_save_registry_bool(custom_loading_screens_intro_movies[faction_key], true)
	end
end

--[[ 
function unlock_campaign_movies()
	local movies_to_unlock = {
	}
	
	for i = 1, #movies_to_unlock do
		core:svr_save_registry_bool(movies_to_unlock[i], true)
	end
end ]]

--[[
core:add_listener(
	"frontend_ui_created_listener",
	"ComponentLClickUp",
	true,
	function(context)
		if find_uicomponent("preview") then
			local btn_hector = find_uicomponent("info_container" , "btn_hector")
			local btn_achilles = find_uicomponent("info_container" , "btn_achilles")
			if btn_hector and btn_hector:CurrentState() == "selected" then 
				common.set_custom_loading_screen_key("troy_main_trj_hector")
				out("1")
			elseif btn_achilles and btn_achilles:CurrentState() == "selected" then 
				common.set_custom_loading_screen_key("troy_main_dan_achilles")
				out("2")
			else
				common.set_custom_loading_screen_key("troy_preview")
				out("3")
			end
		end
	end,
	false
)
--]]

-- =============================================================================================
--                                         TUTORIAL BATTLES LISTENERS
-- =============================================================================================

-- Load in phar_tutorial_battles table
require("script.frontend_battle_tutorial_data")

core:add_listener (
	"start_tutorial_battles_listener",
	"ContextTriggerEvent",
	function(context) 
		return context.string == "StartTutorialBattle"
	end,
	function(context)
		local battle_to_start = core:svr_load_string("tutorial_battle_to_start");			-- Value written in code
		out("Starting tutorial battle: " .. battle_to_start)

		local battle_table = phar_tutorial_battles[battle_to_start]
		if not battle_table then
			core:get_ui_root():SequentialFind("tutorial_menu"):InterfaceFunction("close_panel") -- will not be needed once implemented
			create_confirmation_box_with_text_from_script("TutorialBattlesMessage", "[PH] This tutorial battle is not yet implemented!", "lua")
		else
			if common.pref_as_integer("ui_unit_banner_description") == 0 then
				common.set_pref_integer("ui_unit_banner_description", 2)
				core:svr_save_bool("disable_unit_banner_description_on_battle_end", true)
			end

			core:svr_save_bool(battle_table.svr_bool, true)
			core:svr_save_bool("sbool_tutorial_battle_selected_from_frontend", true)

			if battle_table.loading_screen then
				common.set_custom_loading_screen_key(battle_table.loading_screen)
			end

			if battle_table.next_campaign then
				frontend.start_xml_battle(battle_table.xml_path, battle_table.next_campaign)
			else
				frontend.start_xml_battle(battle_table.xml_path)
			end
		end
	end,
	true
)

-- =============================================================================================
--                                         FTUE QUESTION
-- =============================================================================================

campaign_difficulty_index = {
	easy = 0,
	normal = 1,
	hard = 2,
	very_hard = 3,
	legendary = 4
}

battle_difficulty_index = {
	easy = 0,
	normal = 1,
	hard = 2,
	very_hard = 3
}

advice_level_index = {
	minimal = 0,
	low = 1,
	high = 2
}

unit_baner_description_state = {
	ON = {
		func = function()
				common.set_pref_integer("ui_unit_banner_description", 2)
			end
	},
	FIRST_BATTLE_ONLY = {
		func = function()
				common.set_pref_integer("ui_unit_banner_description", 2)
				core:svr_save_bool("disable_unit_banner_description_on_battle_end", true)
			end
	},
	OFF = {
		func = function()
				common.set_pref_integer("ui_unit_banner_description", 0)
			end
	}
}

ftue_question = {
	layout_path = "ui/Frontend UI/ftue_question",
	ui_buttons_to_level_mapping = {
		["btn_novice"] = "novice",
		["btn_adept"] = "adept",
		["btn_veteran"] = "veteran"
	},
	player_level = nil, -- this will be set by the FTUE Question and player's answer
	level_settings = {
		novice = {
			["difficulty_campaign"] = "easy",
			["difficulty_battle"] = "easy",
			["advice_level"] = "high",
			["select_faction"] = nil,
			["highlight_faction"] = nil,
			["shoud_enable_intro"] = false,
			["unit_banner"] = unit_baner_description_state.ON,
			["level_number"] = 0, -- used for setting the integer preference ftue_question_player_level
			["unlock_all_tutorial_cards"] = false
		},
		adept = {
			["difficulty_campaign"] = "normal",
			["difficulty_battle"] = "normal",
			["advice_level"] = "low",
			["select_faction"] = nil,
			["highlight_faction"] = "phar_main_ramesses",
			["shoud_enable_intro"] = false,
			["unit_banner"] = unit_baner_description_state.FIRST_BATTLE_ONLY,
			["level_number"] = 1, -- used for setting the integer preference ftue_question_player_level
			["unlock_all_tutorial_cards"] = true
		},
		veteran = {
			["difficulty_campaign"] = "hard",
			["difficulty_battle"] = "hard",
			["advice_level"] = "minimal",
			["select_faction"] = nil,
			["highlight_faction"] = nil,
			["shoud_enable_intro"] = false,
			["unit_banner"] = unit_baner_description_state.OFF,
			["level_number"] = 2, -- used for setting the integer preference ftue_question_player_level
			["unlock_all_tutorial_cards"] = true
		},
	},
	campaign_type_components = {
		--"troy_historical", -- Historical campaign
		--"main_troy", -- Truth Behind the Myth campaign
		--"troy_mythic" -- Mythical campaign
		"phar_main", -- Pharaoh main campaign
	}
}

function show_ftue_question()

	if common.tweaker_value("ENABLE_FTUE_QUESTION") == "0" then
		common.set_advice_history_string_seen("player_has_started_the_game");
		return
	end


	local uic_ftue_question = core:get_or_create_component("ftue_question_box", ftue_question.layout_path)
	uic_ftue_question:SetVisible(true)
	uic_ftue_question:LockPriority()

	core:add_listener(
		"ftue_question_button_clicked",
		"ComponentLClickUp",
		function(context)
			return ftue_question.ui_buttons_to_level_mapping[context.string] ~= nil
		end,
		function(context)
			uic_ftue_question:Destroy()
			common.set_advice_history_string_seen("player_has_started_the_game");

			ftue_question.player_level = ftue_question.ui_buttons_to_level_mapping[context.string]
			common.notify_first_time_player_choice(ftue_question.player_level)

			local selected_level = ftue_question.level_settings[ftue_question.player_level]
			common.set_pref_integer("ftue_question_player_level", selected_level.level_number)
			selected_level.unit_banner.func()

			if selected_level.unlock_all_tutorial_cards then
				unlock_all_tutorial_cards()
			end

			-- Immediately apply advice level, so that it can be modified in Options before heading to Campaign
			local uic_sp_frame = core:get_ui_root():SequentialFind("sp_frame")
			if uic_sp_frame then
				uic_sp_frame:InterfaceFunction("set_advice_level", advice_level_index[selected_level.advice_level])
			end

			if ftue_question.player_level == "novice" then
				core:set_boolean_preference("incremental_autosave_enabled", true)

				local ui_root = core:get_ui_root()
				local btn_tutorials = ui_root:SequentialFind("container_main_btns" , "button_tutorials")
				btn_tutorials:SimulateLClick()
				
				local btn_confirm = get_confirm_button() 
				btn_confirm:Highlight(true, true, 0, true)

				--Incase the user transitions to the options menu we stop the highlight and then we listen for the return to the tutorial menu, starting them again. After transitioning we need to listen for every options menu item clicked, since for some reason the button highlight starts anew otherwise
				core:add_listener(
					"frontend_prelude_select_tutorials",
					"FrontendScreenTransition",
					function(context) return context.string == "options_menu" end,
					function(context)
						core:add_listener(
							"options_clicked",
							"ComponentLClickUp",
							function(context)
								local curr_uic = UIComponent(context.component)
								return uicomponent_descended_from(curr_uic, "options_list") and context.string ~= "button_tutorials"
							end,
							function(context)
								tm:callback(
									function()
										local btn_confirm = get_confirm_button()
										btn_confirm:Highlight(false, true, 0, true)
									end,
									1
								)
							end, 
							true
						)
						core:add_listener(
							"options_clicked",
							"ComponentLClickUp",
							function(context)
								return context.string == "button_tutorials"
							end,
							function(context)
								tm:callback(
									function()
										local btn_confirm = get_confirm_button()
										btn_confirm:Highlight(true, true, 0, true)
									end,
									1
								)
							end, 
							true
						)
					end,
					false
				)
			end

			-- set phar_main as ftue campaign so campaign select screen would show confirmation dialog if player selects something else 
			core:add_listener(
				"ftue_question_campaign_select_opened_listener",
				"FrontendScreenTransition",
				function(context) return context.string == "campaign_select" end,
				function(context)
					local uic_campaign_select = core:get_ui_root():SequentialFind("campaign_select")
					uic_campaign_select:InterfaceFunction("set_first_time_campaign", "phar_main")
				end,
				true
			)

			if ftue_question.player_level == "adept" then
				-- highlight or select faction when faction selection screen is opened and chosen campaign is phar_main
				core:add_listener(
					"ftue_question_campaign_selection_highlight_listener", 
					"FrontendScreenTransition",
					function(context) return context.string == "sp_grand_campaign" end,
					function(context)
						local uic_faction_selection = core:get_ui_root():SequentialFind("sp_grand_campaign")
						local is_main_campaign_selected = uic_faction_selection:InterfaceFunction("get_campaign_key") == "phar_main"
						if selected_level.select_faction and is_main_campaign_selected then
							uic_faction_selection:InterfaceFunction("select_faction", selected_level.select_faction)
						elseif selected_level.highlight_faction then
							local uic_faction = find_uicomponent(uic_faction_selection, "main_container", "clip_heroes_strip", "list_box", selected_level.highlight_faction)
							if uic_faction then
								uic_faction:Highlight(is_main_campaign_selected, true, 0)
							end
						end
					end,
					true
				)

				if simulate_main_menu_new_campaign_button_click() then
					core:set_boolean_preference("incremental_autosave_enabled", true)

					local button_phar_main = core:get_ui_root():SequentialFind("phar_main")
					if button_phar_main then
						button_phar_main:Highlight(true, true, 0)
					end
				end
			end

			-- Always set the appropriate campaign parameters
			core:add_listener(
				"ftue_question_campaign_selection_listener",
				"FrontendScreenTransition",
				function(context) return context.string == "sp_grand_campaign" end,
				function(context)
					set_campaign_parameters_per_difficulty_selected(selected_level)
				end,
				false
			)
		end,
		false
	)
	
end

function get_confirm_button()
--:root:main:dockercontainer:tutorial_menu:panel:bottom_buttons:button_ok
	return find_uicomponent("button_ok") 
end

core:add_listener(
	"frontend_ui_created_ftue_question_listener",
	"ContextTriggerEvent",
	function(context) return string.find(context.string, "RequestFTUE") end,
	function(context)
		local ui_root = core:get_ui_root()
		local dlc_layout_name = ui_root:InterfaceFunction("LatestWhatsNewUILayoutName")
		if not dlc_layout_name then
			script_error("no LatestWhatsNewUILayoutName was specified")
		end

		if core:get_ui_root():SequentialFind(dlc_layout_name) then
			core:add_listener(
				"ftue_question_wait_whats_new_to_close",
				"WhatsNewPanelDestroyed",
				true,
				show_ftue_question,
				false
			)
		else
			show_ftue_question()
		end
	end,
	false
)

--------------------------------------------------------
--                                                    --
--                    WHATS NEW                       --
--                                                    --
--------------------------------------------------------

local whats_new_defines = {
	-- Dynasties
	whats_new_dynasties = {
		patch_notes = "https://news.totalwar.com/pharaoh-latest-update",
		pages = {
			-- agamemnons' page
			page_2 = {
				unit_lists = {
					{
						list_component_name = {"agamemnon_units_holder", "units_list"},
						{"phar_map_fac_myc_laconian_militia", "troy_main_dan_mycenae"},
						{"phar_map_fac_myc_armoured_axemen", "troy_main_dan_mycenae"},
						{"phar_map_fac_myc_renowned_argive_axemen", "troy_main_dan_mycenae"},
						{"phar_map_fac_myc_veteran_laconian_axemen", "troy_main_dan_mycenae"},
						{"phar_map_fac_myc_dendra_spearmen", "troy_main_dan_mycenae"},
						{"phar_map_fac_myc_heavy_shielded_spearmen", "troy_main_dan_mycenae"},
						{"phar_map_fac_myc_argive_raiders", "troy_main_dan_mycenae"},
						{"phar_map_fac_myc_heavy_islander_skirmishers", "troy_main_dan_mycenae"},
						{"phar_map_fac_myc_islander_skirmishers", "troy_main_dan_mycenae"},
						{"phar_map_fac_myc_heavy_mycenaen_bowmen", "troy_main_dan_mycenae"},
						{"phar_map_fac_myc_heavy_reinforced_chariots", "troy_main_dan_mycenae"},
						{"phar_map_fac_myc_skirmish_chariots", "troy_main_dan_mycenae"},
					},
				}
			},			
			-- priams' page
			page_3 = {
				unit_lists = {
					{
						list_component_name = {"priam_units_holder", "units_list"},
						{"phar_map_fac_troy_dardanian_mob", "troy_main_trj_troy"},
						{"phar_map_fac_troy_trojan_swordsmen", "troy_main_trj_troy"},
						{"phar_map_fac_troy_veteran_trojan_swordsmen", "troy_main_trj_troy"},
						{"phar_map_fac_troy_guards_of_troy", "troy_main_trj_troy"},
						{"phar_map_fac_troy_heavy_dardanian_zealots", "troy_main_trj_troy"},
						{"phar_map_fac_troy_par_trojan_nobles", "troy_main_trj_troy"},
						{"phar_map_fac_troy_trojan_spearmen", "troy_main_trj_troy"},
						{"phar_map_fac_troy_elite_trojan_slingers", "troy_main_trj_troy"},
						{"phar_map_fac_troy_trojan_stoneslingers", "troy_main_trj_troy"},
						{"phar_map_fac_troy_veteran_trojan_archers", "troy_main_trj_troy"},
						{"phar_map_fac_troy_heavy_trojan_chariots", "troy_main_trj_troy"},
						{"phar_map_fac_troy_trojan_noble_chariots", "troy_main_trj_troy"},
					},
				}
			},
			-- ninurtas' page
			page_4 = {
				unit_lists = {
					{
						list_component_name = {"ninurta_units_holder", "units_list"},
						{"phar_map_fac_ash_assur_levies", "phar_map_ninurta"},
						{"phar_map_fac_ash_assur_militia", "phar_map_ninurta"},
						{"phar_map_fac_ash_kalhu_chargers", "phar_map_ninurta"},
						{"phar_map_fac_ash_kalhu_elite", "phar_map_ninurta"},
						{"phar_map_fac_ash_nineveh_defenders", "phar_map_ninurta"},
						{"phar_map_fac_ash_nineveh_spearmen", "phar_map_ninurta"},
						{"phar_map_fac_ash_assur_horsemen", "phar_map_ninurta"},
						{"phar_map_fac_ash_assur_horse_archers", "phar_map_ninurta"},
						{"phar_map_fac_ash_harran_archers", "phar_map_ninurta"},
						{"phar_map_fac_ash_assur_levy_archers", "phar_map_ninurta"},
						{"phar_map_fac_ash_assur_chariots", "phar_map_ninurta"},
						{"phar_map_fac_ash_assyrian_sappers", "phar_map_ninurta"},
					},
				}
			},
			-- adads' page
			page_5 = {
				unit_lists = {
					{
						list_component_name = {"adad_units_holder", "units_list"},
						{"phar_map_fac_bab_siraku_levies", "phar_map_babylon"},
						{"phar_map_fac_bab_siluhlu_swords", "phar_map_babylon"},
						{"phar_map_fac_bab_armoured_siluhlu_swords", "phar_map_babylon"},
						{"phar_map_fac_bab_armoured_siluhlu_spears", "phar_map_babylon"},
						{"phar_map_fac_bab_siluhlu_spears", "phar_map_babylon"},
						{"phar_map_fac_bab_babylonian_nobles", "phar_map_babylon"},
						{"phar_map_fac_bab_babylonian_royal_guard", "phar_map_babylon"},
						{"phar_map_fac_bab_siluhlu_slingers", "phar_map_babylon"},
						{"phar_map_fac_bab_babylonian_archers", "phar_map_babylon"},
						{"phar_map_fac_bab_siraku_archers", "phar_map_babylon"},
						{"phar_map_fac_bab_babylonian_chariots", "phar_map_babylon"},
					},
				}
			},
		},
	}
}

function WhatsNewSetup(whats_new_screen, id)
	local dlc_def = whats_new_defines[id]
	
	-- if there is no def then we rely everything to be set up in leyaout
	if not dlc_def then
		return
	end

	-- patch notes button
	if dlc_def.patch_notes then
		whats_new_screen:InterfaceFunction("set_patch_notes_url", dlc_def.patch_notes)
	end

	-- setup pages
	local pages = dlc_def.pages
	if pages then
		for page_id, page_def in pairs(pages) do
			local page_uic = find_uicomponent(whats_new_screen, page_id)
			if page_uic then
				if page_def.unit_lists then
					for _, unit_list in pairs(page_def.unit_lists) do
						local list_uic = page_uic:SequentialFind(unpack(unit_list.list_component_name))
						if list_uic then
							for _, unit_def in ipairs(unit_list) do
								list_uic:InterfaceFunction("add_unit", unit_def[1], unit_def[2])
							end
						end
					end
				end
				
				if page_def.execute then
					page_def.execute(page_uic)
				end
			end
		end
	end
end

core:add_listener(
	"frontend_ui_created_whats_new_unit_init",
	"WhatsNewPanelCreated",
	function(context) return true end,
	function(context)
		
		local dlc_layout_name = context.string

		if not dlc_layout_name then
			script_error("no WhatsNewUILayoutName was specified")
		end
		
		local whats_new_screen = find_uicomponent(dlc_layout_name)
		if whats_new_screen then
			WhatsNewSetup(whats_new_screen, dlc_layout_name)			
		end
	end,
	true
)


-- Show FTUE question if the history is cleared in the frontend
core:add_listener(
	"frontend_ui_advice_history_cleared",
	"AdviceCleared",
	true,
	function()
		core:get_ui_root():InterfaceFunction("click_home_button_till_main_menu")
		show_ftue_question()
		lock_all_tutorial_cards()
	end,
	true
)



function has_player_ever_started_campaign()
	if _G.is_autotest then
		out("This is an autorun so not checking prelude checkbox")
		return true
	end
	
	if core:is_tweaker_set("PRELUDE_BATTLE_DISABLED_BY_DEFAULT") then
		out("Tweaker PRELUDE_BATTLE_DISABLED_BY_DEFAULT is set so not checking prelude checkbox")
		return true
	end

	if common.get_advice_history_string_seen("player_has_started_campaign") then
		return true
	end
	
	return false
end

function has_player_ever_started_the_game()
	if _G.is_autotest then
		out("This is an autorun so not checking prelude checkbox")
		return true
	end
	
	if core:is_tweaker_set("PRELUDE_BATTLE_DISABLED_BY_DEFAULT") then
		out("Tweaker PRELUDE_BATTLE_DISABLED_BY_DEFAULT is set so not checking prelude checkbox")
		return true
	end

	if common.get_advice_history_string_seen("player_has_started_the_game") then
		return true
	end
	
	return false
end

-- Opens campaign selection screen or faction selection screen if there is only one campaign configured
function simulate_main_menu_new_campaign_button_click()
	local button_new_campaign = core:get_ui_root():SequentialFind("button_new_campaign")

	if button_new_campaign then
		button_new_campaign:SimulateLClick()
		return true
	end

	return false
end

function set_campaign_parameters_per_difficulty_selected(selected_level)
	if not selected_level then 
		script_error("set_campaign_parameters_per_difficulty_selected() called but no selected_level was provided!")
		return 
	end

	local uic_faction_selection = core:get_ui_root():SequentialFind("sp_grand_campaign")
	uic_faction_selection:InterfaceFunction("set_campaign_difficulty", campaign_difficulty_index[selected_level.difficulty_campaign])
	uic_faction_selection:InterfaceFunction("set_battle_difficulty", battle_difficulty_index[selected_level.difficulty_battle])
	uic_faction_selection:InterfaceFunction("enable_intro", selected_level.shoud_enable_intro)
	--Advice level is set immediately upon ftue_question_button_clicked
	--uic_faction_selection:InterfaceFunction("set_advice_level", advice_level_index[selected_level.advice_level])
end

_overrides = {
	["1033641350"] = "497692916",
	["477904191"] = "868715471",
	["249604551"] = "1148386703",
	["2053315671"] = "566356178",
	["1723650505"] = "2099413990",
	["357939825"] = "236320086",
	["1154423499"] = "182680394",
	["302034517"] = "764006510",
	["1032897401"] = "261138039",
	["938313108"] = "886462899",
	["280926281"] = "226842486",
	["184604424"] = "627853346",
	["358102304"] = "1725813119",
	["415915845"] = "1373694830",
	["1768392347"] = "2122827850",
	["1693321878"] = "1060386154",
	["296770083"] = "1841034897",
	["57923546"] = "376977546",
	["71939408"] = "1197184806",
	["1134846761"] = "539659044",
	["1671426948"] = "1315420545",
	["2094962747"] = "551637148",
	["63514379"] = "226915069",
	["1503768187"] = "1241341102",
	["18843848"] = "682968877",
	["2074688640"] = "1916580841",
	["1062723029"] = "952380765",
	["1530200703"] = "297909287",
	["596103899"] = "1458419479",
	["1920017209"] = "549523298",
	["1115719845"] = "1165140606",
	["1172615865"] = "1630190837",
	["130945493"] = "2009559644",
	["516273009"] = "1782033752",
	["1207480602"] = "1886008600",
	["405970313"] = "1900762992",
	["246276585"] = "1545418784",
	["816153632"] = "1050586142",
	["95127196"] = "1389003213",
	["956757710"] = "387066695",
	["1014939466"] = "1962095916",
	["1290327900"] = "982289505",
	["1758593199"] = "1518964790",
	["2120847296"] = "1815292113",
	["2059739229"] = "1145425879",
	["679994938"] = "351789978",
	["1587162720"] = "1858166723",
	["2029314215"] = "1779962876",
	["1766625053"] = "226297836",
	["935730873"] = "1250478781",
	["1594033795"] = "12416045",
	["1630338446"] = "616937766",
	["1907804678"] = "1293668647",
	["153410115"] = "1254063974",
	["689257026"] = "1078642173",
	["746472019"] = "1050591239",
	["1129077917"] = "1773463261",
	["2028321172"] = "404599317",
	["61483325"] = "155835387",
	["2004102363"] = "627297785",
	["1379542886"] = "1007823100",
	["1490801005"] = "1031606454",
	["1911529186"] = "258058555",
	["376473635"] = "1743841186",
	["795801048"] = "645262368",
	["686151609"] = "791983943",
	["1286827912"] = "1441637556",
	["125071084"] = "2069238612",
	["434890109"] = "399762597",
	["690643363"] = "974669109",
	["1654164092"] = "1172463050",
	["66185603"] = "1425190282",
	["958720996"] = "2020220880",
	["2107591931"] = "1626655613",
	["572152044"] = "850437526",
	["1291442189"] = "1859873656",
	["1379799121"] = "746800253",
	["1723526401"] = "601228033",
	["828275172"] = "1375019850",
	["366623547"] = "535392774",
	["1512549184"] = "1407424414",
	["220150403"] = "59367850",
	["361582983"] = "355497530",
	["985165402"] = "40922462",
	["929806208"] = "969063345",
	["1786656138"] = "721118656",
	["730276936"] = "649608699",
	["556323066"] = "646840870",
	["602800093"] = "275596921",
	["1167282586"] = "2031306424",
	["1929415845"] = "902567237",
	["303332526"] = "947414191",
	["536667326"] = "667109227",
	["1054171868"] = "546185421",
	["883448433"] = "920103738",
	["2008264826"] = "785117889",
	["1139837227"] = "1975268978",
	["1780495428"] = "1636392828",
	["1806415420"] = "1054425499",
	["1742558304"] = "1462177553",
	["532872112"] = "1083376386",
	["2098902947"] = "884763891",
	["646254778"] = "547038128",
	["242291326"] = "815188244",
	["1223400698"] = "452017645",
	["1074556227"] = "1899965131",
	["606983806"] = "1093524466",
	["838424135"] = "1838202526",
	["78850308"] = "147418032",
	["572512981"] = "1027830236",
	["1734378621"] = "80062974",
	["1916101175"] = "515619883",
	["1554097485"] = "311401041",
	["324626617"] = "1841331679",
	["1169968877"] = "1323595726",
	["369895064"] = "2077798043",
	["772456150"] = "1997585121",
	["1437189398"] = "1698930368",
	["317598146"] = "516277699",
	["334522813"] = "1949916636",
	["173436857"] = "2069089461",
	["896679971"] = "2103086162",
	["1322550358"] = "392348611",
	["1684685720"] = "1755381618",
	["251404737"] = "1307559825",
	["2146317706"] = "100175625",
	["1386492150"] = "1385373402",
	["1796774141"] = "1549449469",
	["2086144733"] = "2012492282",
	["376234304"] = "1888861190",
	["1535670727"] = "134343563",
	["183715659"] = "1681048170",
	["1724533161"] = "616020828",
	["479588536"] = "1044131133",
	["614480114"] = "1761874201",
	["1366385053"] = "890739470",
	["903255409"] = "343109490",
	["940418997"] = "1691257416",
	["1959401373"] = "1832468589",
	["140804943"] = "706405023",
	["726287445"] = "1755290899",
	["350628858"] = "1175606157",
	["50446880"] = "885117656",
	["502238007"] = "1211266796",
	["317916190"] = "516361335",
	["1732102291"] = "127265590",
	["641407155"] = "1025409734",
	["178246247"] = "1579851288",
	["815314749"] = "1838260674",
	["1124022640"] = "1559318229",
	["1092811069"] = "335216383",
	["155443560"] = "882195522",
	["1280750190"] = "1483420593",
	["125115772"] = "415271406",
	["1407967467"] = "121494187",
	["117297335"] = "339638048",
	["69626573"] = "1592487642",
	["428709472"] = "617557718",
	["547067689"] = "1780550148",
	["356450898"] = "974269740",
	["471085092"] = "1892170740",
	["783806255"] = "517549271",
	["1397218540"] = "1594424243",
	["1501403750"] = "509852305",
	["521500591"] = "1809667130",
	["193673903"] = "1756773538",
	["434448315"] = "644235182",
	["989104377"] = "1594155561",
	["1283851588"] = "1475864462",
	["884716220"] = "1122769516",
	["293815228"] = "2057844635",
	["1691797265"] = "773785251",
	["2002661815"] = "1858457911",
	["1463600138"] = "864064183",
	["1444242746"] = "1228601533",
	["349806718"] = "1793577781",
	["909499839"] = "1041530461",
	["1504276161"] = "485965123",
	["1163537522"] = "710725701",
	["1605965804"] = "854209223",
	["1159256159"] = "377143354",
	["1120872065"] = "418109508",
	["1031474320"] = "1756772489",
	["1032386269"] = "890821973",
	["912526649"] = "900706741",
	["288045429"] = "1433103995",
	["1439340127"] = "1319172830",
	["173345797"] = "1887259057",
	["1994490066"] = "548204821",
	["1726494126"] = "1895218106",
	["1426496443"] = "1160410492",
	["277264971"] = "845730380",
	["718556071"] = "2117985383",
	["150239887"] = "1844284030",
	["1492341901"] = "506320720",
	["862325721"] = "1887481694",
	["1880347318"] = "827471159",
	["1223191488"] = "1352762632",
	["9216699"] = "1463225913",
	["119118779"] = "332827389",
	["2038537542"] = "1378884603",
	["1231003793"] = "1581692347",
	["1083998721"] = "1968829032",
	["1092418046"] = "681480796",
	["1989925649"] = "935903422",
	["43195206"] = "1035734351",
	["975422674"] = "629976549",
	["250597027"] = "895055386",
	["1040241584"] = "1607699724",
	["1871224614"] = "158902147",
	["2113346458"] = "27709497",
	["284793605"] = "1759646557",
	["326348128"] = "2032548625",
	["422335479"] = "1944049118",
	["603280366"] = "2099977591",
	["2045357845"] = "235516774",
	["1232651737"] = "975916812",
	["589404178"] = "147974213",
	["1051746776"] = "647550660",
	["2044261085"] = "300093343",
	["444394012"] = "22395006",
	["1450009899"] = "1522137768",
	["1038454417"] = "908231835",
	["745064824"] = "554625258",
	["1281240031"] = "603510627",
	["257399489"] = "1673669343",
	["1490353459"] = "1604262108",
	["1419501428"] = "1171638412",
	["1209811840"] = "225559440",
	["1080436848"] = "195872080",
	["614123315"] = "828543309",
	["409216326"] = "419885519",
	["679293629"] = "1242529929",
	["772841950"] = "1046871296",
	["170335788"] = "321113963",
	["935411890"] = "708949275",
	
}

function do_csv()
	local source_path = "T:/region_religions.csv"
	local source = io.open(source_path, "r")
	local dest_path = "T:/region_religions_new.csv"
	local dest = io.open(dest_path, "w+")
	for line in io.lines(source_path) do
		for k,v in pairs(_overrides) do
			local string, sub_count = string.gsub(line, k, v)
			if sub_count == 1 then
				dest:write(string)
				dest:write("\n")
			end
		end
	end
	source:close()
	dest:close()
end

mdm_presets = {
	["option0"] = { -- easy
		["ironman"] = 0, 
		["player_unit_upkeep"] = "None",
		["ai_unit_upkeep"] = "None",
		["player_budget"] = "None",
		["ai_budget"] = "None",
		["ai_building_cost"] = "None",
		["player_replenishment"] = "None",
		["ai_replenishment"] = "None",
		["enslave_sack_no_replenish"] = 0,
		["no_retreat"] = 0,
		["vanguard_deployment"] = "None",
		["adjust_player_public_order"] = "None",
		["adjust_ai_public_order"] = "None",
		["recruitment_capacity_player"] = "None",
		["sea_people_intensity"] = "None",
		["total_annihilation"] = 0,
		["ranged_unit_ammo"] = "None",
		["no_alliances"] = 0,
		["no_rebellions"] = 0,
		["no_influence_manager"] = 0,
		["no_fog_of_war"] = 0,
		["no_ai_trade_offers"] = 0,
		["random_personalities"] = 0,
		["no_auto_resolve"] = 0,
		["no_trading"] = 0,
		["trespassing_diplomatic_penalty_disabled"] = 0,
		["diplomatic_requirements_thresholds"] = "None",
		["diplomatic_deal_distance_penalties_for_war"] = "High",
		["army_size"] = "Low",
		["random_startpos"] = 0,
		["shuffle_commands"] = 0,
		["allow_egyptian_gods"] = 1,
		["allow_hatti_gods"] = 1,
		["allow_canaan_gods"] = 1,
		["gods_autodiscovered"] = 0,
		["toggle_maat"] = 1,
		["maat_disaster_intensity"] = "None",
		["maat_visual_override"] = "None",
		["cai_legitimacy_modifier"] = "Medium",
		["royal_decrees_research_rate"] = "Low",
		["fully_leveled_generals"] = 0,
		["movement_action_points"] = "None",
		["resource_availability"] = "None",
		["recruitment_points_ai"] = "None",
		["rebellion_threshold"] = "None",
		["fully_equipped_generals"] = 0,
		["ai_behavior"] = "Low",
		["unbreakable_units"] = "None",
		["list_of_maat_disasters_earthquake"] = 1,
		["list_of_maat_disasters_flood"] = 1,
		["list_of_maat_disasters_plague"] = 1,
		["list_of_maat_disasters_drought"] = 1,
		["max_pretenders_to_the_throne"] = "None",
		["all_royal_powers_available"] = 0,
		["battle_weather_effects_mod"] = "Medium",
		["flanking_morale_penalties_mod"] = "Medium",
		["battle_terrain_effects_mod"] = "Medium",
		["immortal_faction_leaders"] = 0,
		["general_xp_gain"] = "Medium",
		["character_aging"] = "High",
		["turns_per_year"] = "Medium",
		["seasons"] = "Low",
		["feature_gating"] = 1,
	},
	["option1"] = { -- normal
		["ironman"] = 0, 
		["player_unit_upkeep"] = "None",
		["ai_unit_upkeep"] = "None",
		["player_budget"] = "None",
		["ai_budget"] = "None",
		["ai_building_cost"] = "None",
		["player_replenishment"] = "None",
		["ai_replenishment"] = "None",
		["enslave_sack_no_replenish"] = 0,
		["no_retreat"] = 0,
		["vanguard_deployment"] = "None",
		["adjust_player_public_order"] = "None",
		["adjust_ai_public_order"] = "None",
		["recruitment_capacity_player"] = "None",
		["sea_people_intensity"] = "None",
		["total_annihilation"] = 0,
		["ranged_unit_ammo"] = "None",
		["no_alliances"] = 0,
		["no_rebellions"] = 0,
		["no_influence_manager"] = 0,
		["no_fog_of_war"] = 0,
		["no_ai_trade_offers"] = 0,
		["random_personalities"] = 0,
		["no_auto_resolve"] = 0,
		["no_trading"] = 0,
		["trespassing_diplomatic_penalty_disabled"] = 0,
		["diplomatic_requirements_thresholds"] = "None",
		["diplomatic_deal_distance_penalties_for_war"] = "High",
		["army_size"] = "Low",
		["random_startpos"] = 0,
		["shuffle_commands"] = 0,
		["allow_egyptian_gods"] = 1,
		["allow_hatti_gods"] = 1,
		["allow_canaan_gods"] = 1,
		["gods_autodiscovered"] = 0,
		["toggle_maat"] = 1,
		["maat_disaster_intensity"] = "None",
		["maat_visual_override"] = "None",
		["cai_legitimacy_modifier"] = "Medium",
		["royal_decrees_research_rate"] = "Low",
		["fully_leveled_generals"] = 0,
		["movement_action_points"] = "None",
		["resource_availability"] = "None",
		["recruitment_points_ai"] = "None",
		["rebellion_threshold"] = "None",
		["fully_equipped_generals"] = 0,
		["ai_behavior"] = "Low",
		["unbreakable_units"] = "None",
		["list_of_maat_disasters_earthquake"] = 1,
		["list_of_maat_disasters_flood"] = 1,
		["list_of_maat_disasters_plague"] = 1,
		["list_of_maat_disasters_drought"] = 1,
		["max_pretenders_to_the_throne"] = "None",
		["all_royal_powers_available"] = 0,
		["battle_weather_effects_mod"] = "Medium",
		["flanking_morale_penalties_mod"] = "Medium",
		["battle_terrain_effects_mod"] = "Medium",
		["immortal_faction_leaders"] = 0,
		["general_xp_gain"] = "Medium",
		["character_aging"] = "High",
		["turns_per_year"] = "Medium",
		["seasons"] = "Low",
		["feature_gating"] = 1,
	},
	["option2"] = { -- hard
		["ironman"] = 0, 
		["player_unit_upkeep"] = "None",
		["ai_unit_upkeep"] = "None",
		["player_budget"] = "None",
		["ai_budget"] = "None",
		["ai_building_cost"] = "None",
		["player_replenishment"] = "None",
		["ai_replenishment"] = "None",
		["enslave_sack_no_replenish"] = 0,
		["no_retreat"] = 0,
		["vanguard_deployment"] = "None",
		["adjust_player_public_order"] = "None",
		["adjust_ai_public_order"] = "None",
		["recruitment_capacity_player"] = "None",
		["sea_people_intensity"] = "None",
		["total_annihilation"] = 0,
		["ranged_unit_ammo"] = "None",
		["no_alliances"] = 0,
		["no_rebellions"] = 0,
		["no_influence_manager"] = 0,
		["no_fog_of_war"] = 0,
		["no_ai_trade_offers"] = 0,
		["random_personalities"] = 0,
		["no_auto_resolve"] = 0,
		["no_trading"] = 0,
		["trespassing_diplomatic_penalty_disabled"] = 0,
		["diplomatic_requirements_thresholds"] = "None",
		["diplomatic_deal_distance_penalties_for_war"] = "High",
		["army_size"] = "Low",
		["random_startpos"] = 0,
		["shuffle_commands"] = 0,
		["allow_egyptian_gods"] = 1,
		["allow_hatti_gods"] = 1,
		["allow_canaan_gods"] = 1,
		["gods_autodiscovered"] = 0,
		["toggle_maat"] = 1,
		["maat_disaster_intensity"] = "None",
		["maat_visual_override"] = "None",
		["cai_legitimacy_modifier"] = "Medium",
		["royal_decrees_research_rate"] = "Low",
		["fully_leveled_generals"] = 0,
		["movement_action_points"] = "None",
		["resource_availability"] = "None",
		["recruitment_points_ai"] = "None",
		["rebellion_threshold"] = "None",
		["fully_equipped_generals"] = 0,
		["ai_behavior"] = "Low",
		["unbreakable_units"] = "None",
		["list_of_maat_disasters_earthquake"] = 1,
		["list_of_maat_disasters_flood"] = 1,
		["list_of_maat_disasters_plague"] = 1,
		["list_of_maat_disasters_drought"] = 1,
		["max_pretenders_to_the_throne"] = "None",
		["all_royal_powers_available"] = 0,
		["battle_weather_effects_mod"] = "Medium",
		["flanking_morale_penalties_mod"] = "Medium",
		["battle_terrain_effects_mod"] = "Medium",
		["immortal_faction_leaders"] = 0,
		["general_xp_gain"] = "Medium",
		["character_aging"] = "High",
		["turns_per_year"] = "Medium",
		["seasons"] = "Low",
		["feature_gating"] = 1,
	},
	["option3"] = { -- veteran
		["ironman"] = 0, 
		["player_unit_upkeep"] = "None",
		["ai_unit_upkeep"] = "None",
		["player_budget"] = "None",
		["ai_budget"] = "None",
		["ai_building_cost"] = "None",
		["player_replenishment"] = "None",
		["ai_replenishment"] = "None",
		["enslave_sack_no_replenish"] = 0,
		["no_retreat"] = 0,
		["vanguard_deployment"] = "None",
		["adjust_player_public_order"] = "None",
		["adjust_ai_public_order"] = "None",
		["recruitment_capacity_player"] = "None",
		["sea_people_intensity"] = "None",
		["total_annihilation"] = 0,
		["ranged_unit_ammo"] = "None",
		["no_alliances"] = 0,
		["no_rebellions"] = 0,
		["no_influence_manager"] = 0,
		["no_fog_of_war"] = 0,
		["no_ai_trade_offers"] = 0,
		["random_personalities"] = 0,
		["no_auto_resolve"] = 0,
		["no_trading"] = 0,
		["trespassing_diplomatic_penalty_disabled"] = 0,
		["diplomatic_requirements_thresholds"] = "None",
		["diplomatic_deal_distance_penalties_for_war"] = "High",
		["army_size"] = "Low",
		["random_startpos"] = 0,
		["shuffle_commands"] = 0,
		["allow_egyptian_gods"] = 1,
		["allow_hatti_gods"] = 1,
		["allow_canaan_gods"] = 1,
		["gods_autodiscovered"] = 0,
		["toggle_maat"] = 1,
		["maat_disaster_intensity"] = "None",
		["maat_visual_override"] = "None",
		["cai_legitimacy_modifier"] = "Medium",
		["royal_decrees_research_rate"] = "Low",
		["fully_leveled_generals"] = 0,
		["movement_action_points"] = "None",
		["resource_availability"] = "None",
		["recruitment_points_ai"] = "None",
		["rebellion_threshold"] = "None",
		["fully_equipped_generals"] = 0,
		["ai_behavior"] = "Low",
		["unbreakable_units"] = "None",
		["list_of_maat_disasters_earthquake"] = 1,
		["list_of_maat_disasters_flood"] = 1,
		["list_of_maat_disasters_plague"] = 1,
		["list_of_maat_disasters_drought"] = 1,
		["max_pretenders_to_the_throne"] = "None",
		["all_royal_powers_available"] = 0,
		["battle_weather_effects_mod"] = "Medium",
		["flanking_morale_penalties_mod"] = "Medium",
		["battle_terrain_effects_mod"] = "Medium",
		["immortal_faction_leaders"] = 0,
		["general_xp_gain"] = "Medium",
		["character_aging"] = "High",
		["turns_per_year"] = "Medium",
		["seasons"] = "Low",
		["feature_gating"] = 1,
	},
	["option4"] = { -- legendary
		["ironman"] = 1, 
		["player_unit_upkeep"] = "None",
		["ai_unit_upkeep"] = "None",
		["player_budget"] = "None",
		["ai_budget"] = "None",
		["ai_building_cost"] = "None",
		["player_replenishment"] = "None",
		["ai_replenishment"] = "None",
		["enslave_sack_no_replenish"] = 0,
		["no_retreat"] = 0,
		["vanguard_deployment"] = "None",
		["adjust_player_public_order"] = "None",
		["adjust_ai_public_order"] = "None",
		["recruitment_capacity_player"] = "None",
		["sea_people_intensity"] = "None",
		["total_annihilation"] = 0,
		["ranged_unit_ammo"] = "None",
		["no_alliances"] = 0,
		["no_rebellions"] = 0,
		["no_influence_manager"] = 0,
		["no_fog_of_war"] = 0,
		["no_ai_trade_offers"] = 0,
		["random_personalities"] = 0,
		["no_auto_resolve"] = 0,
		["no_trading"] = 0,
		["trespassing_diplomatic_penalty_disabled"] = 0,
		["diplomatic_requirements_thresholds"] = "None",
		["diplomatic_deal_distance_penalties_for_war"] = "High",
		["army_size"] = "Low",
		["random_startpos"] = 0,
		["shuffle_commands"] = 0,
		["allow_egyptian_gods"] = 1,
		["allow_hatti_gods"] = 1,
		["allow_canaan_gods"] = 1,
		["gods_autodiscovered"] = 0,
		["toggle_maat"] = 1,
		["maat_disaster_intensity"] = "None",
		["maat_visual_override"] = "None",
		["cai_legitimacy_modifier"] = "Medium",
		["royal_decrees_research_rate"] = "Low",
		["fully_leveled_generals"] = 0,
		["movement_action_points"] = "None",
		["resource_availability"] = "None",
		["recruitment_points_ai"] = "None",
		["rebellion_threshold"] = "None",
		["fully_equipped_generals"] = 0,
		["ai_behavior"] = "Low",
		["unbreakable_units"] = "None",
		["list_of_maat_disasters_earthquake"] = 1,
		["list_of_maat_disasters_flood"] = 1,
		["list_of_maat_disasters_plague"] = 1,
		["list_of_maat_disasters_drought"] = 1,
		["max_pretenders_to_the_throne"] = "None",
		["all_royal_powers_available"] = 0,
		["battle_weather_effects_mod"] = "Medium",
		["flanking_morale_penalties_mod"] = "Medium",
		["battle_terrain_effects_mod"] = "Medium",
		["immortal_faction_leaders"] = 0,
		["general_xp_gain"] = "Medium",
		["character_aging"] = "High",
		["turns_per_year"] = "Medium",
		["seasons"] = "Low",
		["feature_gating"] = 1,
	},
}

mdm = modular_difficulty_manager:new()
mdm:set_state(modular_difficulty_campaign.mdm_new_state)

core:add_listener(
	"frontend_ui_tmp",
	"UICreated",
	true,
	function(context)
		local cached_campaign_difficulty_option_index = 1 - core:get_integer_preference("campaign_difficulty")
		mdm:apply_campaign_difficulty_preset(mdm_presets["option" .. cached_campaign_difficulty_option_index])
		mdm:add_listeners()
	end,
	false
)

core:add_listener(
	"mdm_frontend_difficulty_changed",
	"ComponentLClickUp",
	function(context)
		local curr_uic = UIComponent(context.component)
		return uicomponent_descended_from(curr_uic, "difficulty_bg") and uicomponent_descended_from(curr_uic, "dropdown_campaign") and string.find(context.string, "option")
	end,
	function(context)
		mdm:apply_campaign_difficulty_preset(mdm_presets[context.string])
	end, 
	true
)

function toggle_modular_difficulty(is_enabled)
	if is_enabled then
		mdm:set_state(modular_difficulty_campaign.mdm_new_state)
	else
		mdm:set_state({})
	end
end

core:svr_save_bool("mdm_enabled", false)

core:add_listener(
	"start_campaign_button_listener",
	"ComponentLClickUp",
	function(context) return context.string == "button_start_campaign" end,
	function(context)
		local mdm_enabled = next(mdm.state) and true or false
		core:svr_save_bool("mdm_enabled", mdm_enabled)

		if mdm_enabled then
			for setting_name, data in pairs(mdm.state) do 
				if modular_difficulty_campaign.settings[setting_name] and is_function(modular_difficulty_campaign.settings[setting_name].callback_pre_campaign_start) then
					modular_difficulty_campaign.settings[setting_name].callback_pre_campaign_start()
				end
			end
		end
	end,
	true
)

-- Enable Modular difficulty for Tutorial campaign
core:add_listener (
	"start_tutorial_campaign_listener",
	"ContextTriggerEvent",
	function(context) 
		return context.string == "CampaignTutorialAboutToStart"
	end,
	function(context)
		mdm:set_state(modular_difficulty_campaign.mdm_new_state)

		mdm:modify_setting("allow_hatti_gods", 0, false)
		mdm:modify_setting("allow_canaan_gods", 0, true)

		core:svr_save_bool("mdm_enabled", true)
	end,
	false
)