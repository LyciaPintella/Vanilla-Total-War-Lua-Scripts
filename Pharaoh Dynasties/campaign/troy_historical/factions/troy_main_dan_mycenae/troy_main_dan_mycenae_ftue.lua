out("===========================================================")
out("======================= Loading FTUE ======================")
out("========== troy_main_dan_mycenae_ftue.lua Loaded ==========")
out("===========================================================")

advisor_texts = {
	first_turn = {
		camera_advice = {
			advice_key = "troy_tutorial_camp_agamemnon_camera_01",--Almighty Agamemnon, take a look around your rich lands.
			objective_key = nil,
			info_text = {
				"troy_tutorial_camp_agamemnon_camera_info_01",--Experiment with camera movement..
				"troy_tutorial_camp_agamemnon_camera_info_02"--Look around using the WASD keys.
			},
		},
		move_hero_advice = {
			advice_key = "troy_tutorial_camp_agamemnon_army_select_01",--March north-west, warlike king Agamemnon, for in that direction lie the lands of the Corinthians who plot your demise..
			selection_objective_key = "troy_tutorial_camp_agamemnon_army_select_obj_01",--Select your army.
			movement_objective_key = "troy_tutorial_camp_agamemnon_army_select_obj_02",--Move your army to the designated location.
			info_text = {
				"troy_tutorial_camp_agamemnon_army_select_info_01",--Left-click on your army to select it.
				"troy_tutorial_camp_agamemnon_army_select_info_02"--Right-click on the ground to move your army there.
			},
		},
		start_basic_battle_advice = {
			advice_key = "troy_tutorial_camp_agamemnon_tutorial_battles_01",--Before we continue, I shall entertain you with tales from the turbulent youth of worthy Nestor, before he became the king of sandy Pylos.
			objective_key = "troy_tutorial_camp_agamemnon_tutorial_battles_obj_01",--Play the tutorial battles.
			info_text = {
				"troy_tutorial_camp_agamemnon_tutorial_battles_info_01", -- Click the highlighted button to open the advisor menu
				"troy_tutorial_camp_agamemnon_tutorial_battles_info_02" -- Click the Basic Battle Button
			},
		},

		-- intro battles completed

		acknowledge_tutorial_battles = {
			advice_key = "troy_tutorial_camp_agamemnon_tutorial_battles_02",--Undoubtedly, your own feats will eclipse the ones of young Nestor, oh Agamemnon, master of the warcry!
			info_text = {
				"troy_tutorial_camp_agamemnon_tutorial_battles_info_03",--You can play the Tutorial Battles again at any point during your campaign.
				"troy_tutorial_camp_agamemnon_tutorial_battles_info_04"--Tutorial battles will be available again on turn 4.
			}
		},
		-- TODO: @design DELETE WH2 COMMENTS BELOW after assigning correct advices / objectives
		unit_recruitment_advice = {
			start_advice = "troy_tutorial_camp_agamemnon_recruitment_01", -- Your future is fraught with bloody battles, oh Agamemnon, king of men. It will be prudent to summon more warriors to join your troops.
			selection_objective = "troy_tutorial_camp_agamemnon_army_select_obj_01", -- Select your army.
			panel_objective = "troy_tutorial_camp_agamemnon_recruitment_obj_01", -- Open the Recruitment panel.
			recruitment_objective = "troy_tutorial_camp_agamemnon_recruitment_obj_02", -- Recruit additional Units
			recruitment_limit = 3,
			end_advice = "troy_tutorial_camp_agamemnon_recruitment_02", -- A most excellent choice! These brave men will serve you well. They will need time to arrive and in the meantime your army will be unable to move away..
			initial_infotext = {
				"troy_tutorial_camp_agamemnon_recruitment_info_01",--You will need additional units.
				"troy_tutorial_camp_agamemnon_recruitment_info_02"--You can order your army to recruit them.
			},
			unit_card_infotext = {
				"troy_tutorial_camp_agamemnon_recruitment_info_03",--These are the units available for recruitment.
				"troy_tutorial_camp_agamemnon_recruitment_info_04"--Left-click on a unit card to recruit the unit.
			}
		},
		end_turn_advice = {
			advice_key = "troy_tutorial_camp_agamemnon_end_turn_01", --The new warriors will need time to arrive. Right now, there is little left to do but move on.
			objective_key = "troy_tutorial_camp_agamemnon_end_turn_obj_01", -- Click the End Turn button.
			info_text = {
				"troy_tutorial_camp_agamemnon_end_turn_info_01"--When you click End Turn, other factions will play a turn before your next one.
			},
		}
	},
	second_turn = {
		attacking_advice = {
			initial_advice = "troy_tutorial_camp_agamemnon_missions_01",--There are Corinthian enemies nearby, almighty king. The people of Mycenae demand you crush them.
			initial_infotext = {
				"troy_tutorial_camp_agamemnon_info_missions_01",--Occasionally you will be given missions such as this one.
				"troy_tutorial_camp_agamemnon_info_missions_02"--Complete missions for rewards.
			},
			selection_objective = "troy_tutorial_camp_agamemnon_army_select_obj_01", -- Select your army.
			attack_advice = "troy_tutorial_camp_agamemnon_attack_01",-- Using your newly mustered troops, smite at the Corinthians, oh great king. Crush them and they will fear you.
			attack_infotext = {
				"troy_tutorial_camp_agamemnon_attack_info_01" -- With your army selected, right click on a foreign army to attack them.
			},
			attack_objective = "troy_tutorial_camp_agamemnon_attack_obj_01", -- Right click on the Corinthian army.
		},
		pre_battle_advice = {
			advice_key = "troy_tutorial_camp_agamemnon_field_battle_01",--Your army is about to face the Corinthian forces in an open field battle. Have no fear, Athena will watch over you!
			info_text = {
				"troy_tutorial_camp_agamemnon_field_battle_info_01",--You will fight an enemy army in a real-time battle.
				"troy_tutorial_camp_agamemnon_field_battle_info_02"--Click the Manual Battle button.
			},
		},
		post_battle_advice = {
			win_advice_key = "troy_tutorial_camp_agamemnon_victory_01",--You have scored a magnificent victory. Now you must decide what destiny awaits the captured enemies.
			win_info_text = {
				"troy_tutorial_camp_agamemnon_victory_info_01",--After battle you gain loot and experience for your commanding hero.
				"troy_tutorial_camp_agamemnon_victory_info_02",--You also need to decide what will happen to the captured enemies.
				--"troy.battle.intro.info_028"
			},
			loose_advice_key = "troy_tutorial_camp_agamemnon_defeat_01",--As luck would have it, you have lost. Fear not, this is but a temporary setback. Recruit more Mycenaeans and strike again!
			loose_info_text = {
				"troy_tutorial_camp_agamemnon_defeat_info_01"--Should you lose a battle, rebuild your forces and try to defeat your enemies again.
			}
		},
		level_up_advice = {
			selection_objective = "troy_tutorial_camp_agamemnon_army_select_obj_01", -- Select your army.
			info_text = {
				"troy_tutorial_camp_agamemnon_skill_info_01", --You have gained experience, leveled up and can now spend  a skill point.
			}
		},
		-- TODO: @design delete old comments
		end_turn_advice = {
			advice_key = "troy_tutorial_camp_agamemnon_end_turn_01",--You have resolved the most pressing matters, oh illustrious Agamemnon. Right now, there is little left to do but move on.
			objective_key = "troy_tutorial_camp_agamemnon_end_turn_obj_01",--Click the End Turn button.
			info_text = {
				"troy_tutorial_camp_agamemnon_end_turn_info_01",--When you click End Turn, other factions will play a turn before your next one.
			},
		},
	},
	third_turn = {
		buildings_construction_advice = {
			start_advice = "troy_tutorial_camp_agamemnon_construct_01", -- The glorious city of Mycenae nees to be expanded if its citizens are to thrive. Order your masons to begin constructing a building of your choice.
			start_objective = "troy_tutorial_camp_agamemnon_construct_obj_01", -- Select the city of Mycenae.
			initial_infotext = {
				"troy_tutorial_camp_agamemnon_construct_info_01",--Buildings are a major way to develop your kingdom.
				"troy_tutorial_camp_agamemnon_construct_info_02",--They are built in settlements and can be upgraded.
				"troy_tutorial_camp_agamemnon_construct_info_03"-- Military buildings provide unit for recruitment in their province.
			},

			build_objective = "troy_tutorial_camp_agamemnon_construct_choose_obj_01",--Order building construction.
			build_infotext = {
				"troy_tutorial_camp_agamemnon_construct_choose_info_01"--Click on an empty building slot and select a building for construction.
			},

			end_advice = "troy_tutorial_camp_agamemnon_construct_chosen_01", -- Splendid decision, oh king of men! The workers will require some time to complete their tasks but once they are done a new edifice will stand in sunlit Mycenae. 
			end_infotext = {
				"troy_tutorial_camp_agamemnon_construct_chosen_info_01"--Buildings take a few turns to be completed.  
			}
		},
		end_turn_advice = {
			advice_key = "troy_tutorial_camp_agamemnon_end_turn_01",--You have resolved the most pressing matters, oh illustrious Agamemnon. Right now, there is little left to do but move on.
			objective_key = "troy_tutorial_camp_agamemnon_end_turn_obj_01",--Click the End Turn button.
			info_text = {
				"troy_tutorial_camp_agamemnon_end_turn_info_01",--When you click End Turn, other factions will play a turn before your next one.
			},
		},
	},
}

advisor_infotext_state_overrides = {
	-- if override_text is true, the infotext entry will use the localised text from the infotext record in db.
	-- otherwise it will use the standard text of the specified state

	["troy_tutorial_camp_agamemnon_camera_info_01"] = {
		new_state = "prelude_controls_battle_camera",
		override_text = true
	},
	["troy_tutorial_camp_agamemnon_army_select_info_01"] = {
		new_state = "prelude_controls_battle_selection",
		override_text = true
	}
}

local NEXT_ADVICE_DELAY_S = 1
local POST_LOAD_ADVICE_DELAY_S = 6

local agamemnon_faction_key = "troy_main_dan_mycenae"
local enemy_faction_key = "troy_main_dan_corinthians"

local starting_camera_position = {

215.48,
223.66,
5.92,
0.17,
6.65 


}

local turn_2_camera_position = {
	215.90,
	233.10,
	14.92,
	0.17,
	7.00 
}

local second_turn_faction_leader_position = {x = 309, y = 294}
local second_turn_enemy_leader_position = {x = 334, y = 294}

local itm = get_infotext_manager()

function start_tutorial()
	set_infotext_state_overrides()

	enable_tutorial_battles_buttons(cm:turn_number() >= 4)

	if cm:turn_number() >= 3 then
		uim:override("saving"):unlock()
	else
		uim:override("saving"):lock()
	end

	-- Check current progress of the ftue tutorial
	-- Fresh start of the  tutorial
	if core:svr_load_bool("sbool_player_selected_first_turn_intro_on_frontend") and not cm:get_saved_value("bool_is_ftue_mode") then
		core:svr_save_bool("sbool_player_selected_first_turn_intro_on_frontend", false)

		cm:set_saved_value("bool_is_ftue_mode", true);

		core:add_listener(
			"end_intro_cinematic_listener",
			"ScriptEventIntroCutsceneFinished",
			function() return cm:get_local_faction_name(true) == "troy_main_dan_mycenae" end,
			function()
				first_turn_ui_and_selection_overrides()
				cm:callback(
					function()
						cm:scroll_camera_from_current(true, 2, starting_camera_position)
						cm:callback(start_camera_advice, 5)
					end, 
					2
				)
			end,
			false
		)
		
		-- Time to override some personalities
		local faction_list = cm:model():world():faction_list()
		for i = 0, faction_list:num_items() - 1 do
			local curr_faction = faction_list:item_at(i)
			if not curr_faction:is_human() and curr_faction:is_allowed_to_capture_territory() then
				cm:force_change_cai_faction_personality(curr_faction:name(), "troy_survivor_early_easy")
			end
		end

	-- we have loaded into first turn. restore progress
	elseif cm:turn_number() == 1 then
		-- If player just completed the basic tutorial battle:
		if cm:get_saved_value("bool_first_turn_basic_tutorial_battle_started") then
			out("Intro Battle finished")
			cm:set_saved_value("bool_first_turn_basic_tutorial_battle_started", false)

			-- Ask the player to play the advanced battle.
			cm:callback(
				function()
					create_confirmation_box("play_advanced_battle_prompt", "campaign_localised_strings_string_troy_advanced_tutorial_battle_prompt", 
						function()
							cm:set_saved_value("bool_first_turn_advanced_tutorial_battle_started", true)
							start_tutorial_battle("ADVANCED", true)
						end,
						function()
							start_acknowledge_tutorial_battles_advice()
						end
					)
				end,
				POST_LOAD_ADVICE_DELAY_S
			)
		-- If player just completed the advanced tutorial battle:
		elseif cm:get_saved_value("bool_first_turn_advanced_tutorial_battle_started") then
			cm:set_saved_value("bool_first_turn_advanced_tutorial_battle_started", false)
			start_acknowledge_tutorial_battles_advice()
		elseif cm:get_saved_value("bool_first_turn_all_steps_completed") then
			cm:callback(start_first_turn_end_turn_advice, POST_LOAD_ADVICE_DELAY_S)
		end

	elseif cm:turn_number() == 2 then
		if cm:get_saved_value("bool_second_turn_battle_started") then
			add_second_turn_battle_completed_listener()
		elseif cm:get_saved_value("bool_second_turn_all_steps_completed") then
			cm:callback(start_second_turn_end_turn_advice, POST_LOAD_ADVICE_DELAY_S)
		end
	elseif cm:turn_number() == 3 then
		if cm:get_saved_value("bool_third_turn_all_steps_completed") then
			cm:callback(start_third_turn_end_turn_advice, POST_LOAD_ADVICE_DELAY_S)
		end
	end
	
	-- Ugly, disgusting hack that I really didn't want to do, but I don't have time to be smart
	core:remove_listener("troy_story_dilemma_initial_trigger")
	core:remove_listener("troy_story_dilemma_choice_third")
	core:remove_listener("troy_story_dilemma_choice_log_player_choice")
	core:remove_listener("troy_story_dilemma_attacking_faithful_ally")
	core:remove_listener("troy_story_dilemma_secondary_trigger")
end

function set_infotext_state_overrides()
	for infotext_key, override in pairs(advisor_infotext_state_overrides) do
		itm:set_state_override(infotext_key, override.new_state, override.override_text)
	end
end

function apply_active_ui_overrides_on_load()
	for key, _ in pairs(ftue_active_ui_overrides) do
		uim:override(key):lock()
	end

	core:add_listener(
		"FTUE_ui_override_lock_change",
		"UITriggerScriptEvent",
		function(context)
			local args = string.split(context:trigger(), ",")
			return args[1] == "ui_override_unlock" or args[1] == "ui_override_lock"
		end,
		function(context)
			local args = string.split(context:trigger(), ",")
			local lock_key = args[2]

			if args[1] == "ui_override_lock" then
				ftue_active_ui_overrides[lock_key] = true
			else
				ftue_active_ui_overrides[lock_key] = nil
			end
		end,
		true
	)
end

function apply_random_active_overrides_on_load()
	if ftue_random_active_overrides.research_override == true then
		uim:suppress_end_turn_warning("research available", true) -- research
	end
	if ftue_random_active_overrides.offices_override == true then
		uim:suppress_end_turn_warning("agamemnon_office_can_be_filled", true) -- Office slot available
	end
	if ftue_random_active_overrides.end_turn_shortcut_override == true then
		cm:disable_shortcut("button_end_turn", "end_turn", true)
		cm:disable_shortcut("button_end_turn", "end_turn_skip_warnings", true)
	end
	if ftue_random_active_overrides.character_settlement_override == true and ftue_random_active_overrides.faction_leader_blacklist == true then
		uim:enable_character_selection_whitelist()
		uim:enable_settlement_selection_whitelist()
	elseif ftue_random_active_overrides.character_settlement_override == true and ftue_random_active_overrides.faction_leader_blacklist == false then
		local hero_cqi = cm:get_faction(agamemnon_faction_key):faction_leader():command_queue_index()
		uim:enable_character_selection_whitelist()
		uim:enable_settlement_selection_whitelist()
		cm:get_campaign_ui_manager():add_character_selection_whitelist(hero_cqi);
	end
end

apply_active_ui_overrides_on_load()
apply_random_active_overrides_on_load()

---------------------------------------------------------------
-- Agamemnon First Turn
---------------------------------------------------------------
function first_turn_ui_and_selection_overrides()
	local faction = cm:get_faction(agamemnon_faction_key)
	cm:set_skip_all_but_faction(faction, true)
	cm:kill_all_armies_for_faction(cm:get_faction("troy_main_dan_tiryns"))
	cm:transfer_region_to_faction("troy_main_megaris_aegina", "troy_main_dan_corinthians")
	cm:make_region_seen_in_shroud("troy_main_dan_mycenae", "troy_main_megaris_aegina")
	cm:instantly_dismantle_building_in_region("troy_main_mycenaeca_mycenae", 1)
	cm:apply_effect_bundle("troy_tutorial_dan_agamemnon_immortality", agamemnon_faction_key , 10)
	cm:faction_add_pooled_resource(agamemnon_faction_key , "troy_food", "troy_resource_factor_events", 1000)
	cm:force_diplomacy("faction:"..agamemnon_faction_key, "all", "war", false, false)
	uim:override("hide_resources_bar"):lock()
	uim:override("hide_faction_widget_buttons"):lock()
	uim:override("hide_faction_widget"):lock()
	uim:override("hide_faction_buttons_docker"):lock()
	uim:override("diplomacy"):lock()
	uim:override("technology"):lock()
	uim:override("objectives_screen"):lock()
	uim:override("hide_divine_will_button"):lock()
	uim:override("hide_fm_offices_container"):lock()
	uim:override("hide_fm_demand_tribute_container"):lock()
	uim:override("recruit_units"):lock()
	uim:override("hide_settlement_panel_recruit_hero"):lock()
	uim:override("hide_settlement_panel_recruit_lord"):lock()
	uim:override("character_details"):lock()
	uim:override("end_of_turn_warnings"):lock()
	uim:override("stances"):lock()
end

function start_camera_advice()
	--first_turn_ui_and_selection_overrides()
	cm:dismiss_advice()
	cm:modify_advice(false, false)
	cm:clear_infotext()

	cm:show_advice(
		advisor_texts.first_turn.camera_advice.advice_key,  -- advice key
		false,											  -- show progress button
		false,											  -- highlight progress button
		function()										  -- end callback
			cm:modify_advice(true, true)
			cm:progress_on_advice_dismissed(
				"start_camera_advice",
				function()
					cm:modify_advice(false, false)
					start_hero_movement_advice()
				end,
				NEXT_ADVICE_DELAY_S
			)
		end,
		5												  -- min advice duration
	)

	if #advisor_texts.first_turn.camera_advice.info_text >= 1 then
		cm:add_infotext(unpack(advisor_texts.first_turn.camera_advice.info_text))
	end

	show_campaign_controls_cheat_sheet()
end

function start_hero_movement_advice()
	cm:scroll_camera_from_current(true, 3, starting_camera_position)
	cm:clear_infotext()

	local ma = intro_campaign_movement_advice:new(
		cm:get_faction(agamemnon_faction_key):faction_leader():cqi(),
		advisor_texts.first_turn.move_hero_advice.advice_key,
		advisor_texts.first_turn.move_hero_advice.selection_objective_key,
		nil,
		advisor_texts.first_turn.move_hero_advice.movement_objective_key,
		second_turn_faction_leader_position.x,
		second_turn_faction_leader_position.y,
		function() cm:callback(function() start_basic_battle_advice() end, NEXT_ADVICE_DELAY_S) end
	)
	
	ma:add_selection_infotext(1, unpack(advisor_texts.first_turn.move_hero_advice.info_text))
		
	ma:start()
end

function start_basic_battle_advice()
	local sa = intro_start_tutorial_battle_advice:new(
		"BASIC",
		advisor_texts.first_turn.start_basic_battle_advice.advice_key,
		advisor_texts.first_turn.start_basic_battle_advice.objective_key,
		function()
			cm:set_saved_value("bool_first_turn_basic_tutorial_battle_started", true)
		end
	);
	
	sa:add_infotext(unpack(advisor_texts.first_turn.start_basic_battle_advice.info_text))
	
	sa:start();
end


---------------------------------------------------------------
-- After Tutorial Battles Completed
---------------------------------------------------------------

function start_acknowledge_tutorial_battles_advice()
	cm:show_advice(
		advisor_texts.first_turn.acknowledge_tutorial_battles.advice_key,  -- advice key
		false,											  -- show progress button
		false,											  -- highlight progress button
		function()										  -- end callback
			cm:modify_advice(true, true)
			cm:progress_on_advice_dismissed(
				"acknowledge_tutorial_battles",
				function()
					cm:modify_advice(false, false)
					start_unit_recruitment_advice()
					cm:faction_add_pooled_resource(agamemnon_faction_key, "troy_god_attitude_athena", "troy_god_attitude_factor_faction", 70)
				end,
				NEXT_ADVICE_DELAY_S
			)
		end,
		5												  -- min advice duration
	)

	if #advisor_texts.first_turn.acknowledge_tutorial_battles.info_text >= 1 then
		cm:add_infotext(unpack(advisor_texts.first_turn.acknowledge_tutorial_battles.info_text))
	end
end

function start_unit_recruitment_advice()
	local hero_cqi = cm:get_faction(agamemnon_faction_key):faction_leader():command_queue_index()
	cm:get_campaign_ui_manager():add_character_selection_whitelist(hero_cqi);
	cm:force_add_and_equip_ancillary(cm:char_lookup_str(cm:get_faction(agamemnon_faction_key):faction_leader()), "troy_main_anc_item_prometheus_oil")
	ftue_random_active_overrides.faction_leader_blacklist = false
	local ra = intro_campaign_recruitment_advice:new(
		hero_cqi,
		advisor_texts.first_turn.unit_recruitment_advice.start_advice,
		advisor_texts.first_turn.unit_recruitment_advice.selection_objective,
		advisor_texts.first_turn.unit_recruitment_advice.panel_objective,
		advisor_texts.first_turn.unit_recruitment_advice.recruitment_objective,
		advisor_texts.first_turn.unit_recruitment_advice.recruitment_limit,
		advisor_texts.first_turn.unit_recruitment_advice.end_advice,
		function()
			cm:set_saved_value("bool_first_turn_all_steps_completed", true)
			start_disbanding_tp()
			start_first_turn_end_turn_advice() 
		end
	);
	
	ra:add_initial_infotext(unpack(advisor_texts.first_turn.unit_recruitment_advice.initial_infotext));
	ra:add_unit_card_infotext(unpack(advisor_texts.first_turn.unit_recruitment_advice.unit_card_infotext));
	
	ra:start();
end

function start_disbanding_tp()
	local uic_first_unit = find_uicomponent(core:get_ui_root(), "units_panel","main_units_panel","units")
	if uic_first_unit and uic_first_unit:Visible() then 
		local disbanding_text_pointer = text_pointer:new_from_component(
			"disbanding_text_pointer",
			"bottom",
			100,
			uic_first_unit,
			0.5,
			0
		)

		disbanding_text_pointer:add_component_text("text", "random_localisation_strings_string_army_details_overlay_subtitle_3")
		disbanding_text_pointer:set_style("semitransparent")
		disbanding_text_pointer:set_topmost(true)
		disbanding_text_pointer:set_show_close_button(true)
		disbanding_text_pointer:set_hide_on_close_button_clicked()
		disbanding_text_pointer:show()
		core:add_listener(
			"FTUE_char_deselected_tp_cleanup", 
			"PanelClosedCampaign",
			true,
			function(context)
				disbanding_text_pointer:hide(true, true)
			end,
			false
		)
	end
end

function start_first_turn_end_turn_advice()
	uim:override("recruit_units"):unlock()
	uim:override("hide_faction_buttons_docker"):unlock()
	uim:override("saving"):unlock()

	cm:callback(function() cm:get_campaign_ui_manager():display_faction_buttons(true) end, 1);
	
	local ea = intro_campaign_end_turn_advice:new(
		advisor_texts.first_turn.end_turn_advice.advice_key,
		advisor_texts.first_turn.end_turn_advice.objective_key,
		function()
			second_turn_preparations()
		end
	);
	
	ea:add_infotext(unpack(advisor_texts.first_turn.end_turn_advice.info_text))
	
	ea:start();
end

---------------------------------------------------------------
-- Agamemnon Second Turn
---------------------------------------------------------------

function second_turn_preparations()
	uim:override("end_turn"):lock() 
	-- failsafe: if the player's army is not in the correct location, teleport it
	local char_player = cm:get_faction(agamemnon_faction_key):faction_leader()
	
	local player_lord_x = char_player:logical_position_x()
	local player_lord_y = char_player:logical_position_y()
	
	if player_lord_x ~= second_turn_faction_leader_position.x or player_lord_y ~= second_turn_faction_leader_position.y then
		script_error("WARNING: player's lord is at [" .. player_lord_x .. ", " .. player_lord_y .. "], should be at [" .. second_turn_faction_leader_position.x .. ", " .. second_turn_faction_leader_position.y .. "], performing failsafe teleportation")
		cm:teleport_to(cm:char_lookup_str(char_player),  second_turn_faction_leader_position.x, second_turn_faction_leader_position.y)
	end

	local char_enemy = cm:get_faction(enemy_faction_key):faction_leader()
	
	if not char_enemy then
		script_error("ERROR: enemy_faction_starts_turn() couldn't find the enemy lord")
	else
		cm:teleport_to(cm:char_lookup_str(char_enemy), second_turn_enemy_leader_position.x, second_turn_enemy_leader_position.y)
		cm:set_force_has_retreated_this_turn(char_enemy)
	end

	if cm:whose_turn_is_it() == agamemnon_faction_key and cm:turn_number() == 2 then
		cm:callback(wait_start_attacking_advice, 0.5)
	else
		core:add_listener(
			"FTUE_FactionTurnStart", 
			"FactionTurnStart",
			function(context) return context:faction():name() == agamemnon_faction_key end,
			function(context) cm:callback(wait_start_attacking_advice, 0.5) end,
			false
		)
	end
	if char_player:military_force():active_stance() == "MILITARY_FORCE_ACTIVE_STANCE_TYPE_MUSTER" then
		uim:override("cancel_recruitment"):set_allowed(true);
	end
end;

-- workaround for not needed interventions. remove when fixed
function wait_start_attacking_advice()
	cm:repeat_callback(
		 function() 
			 local im = cm:get_intervention_manager()

			 if not im:get_active_intervention() then
				cm:remove_callback("ftue_check_for_active_interventions")
				uim:override("saving"):lock()
				start_attacking_advice()
			 end
		 end,
		 0.2,
		 "ftue_check_for_active_interventions"
	 )
end

function start_attacking_advice()
	local enemy_cqi = cm:get_faction(enemy_faction_key):faction_leader():cqi()
	
	local sa = intro_campaign_select_and_attack_advice:new(
		-- player_cqi, enemy_cqi, initial_advice, selection_objective, attack_advice, attack_objective, end_callback
		cm:get_faction(agamemnon_faction_key):faction_leader():cqi(),
		enemy_cqi,
		advisor_texts.second_turn.attacking_advice.initial_advice,
		advisor_texts.second_turn.attacking_advice.selection_objective,
		advisor_texts.second_turn.attacking_advice.attack_advice,
		advisor_texts.second_turn.attacking_advice.attack_objective,
		function() attack_initiated_advice() end
	);
	
	sa:set_camera_position_override(unpack(turn_2_camera_position))
	
	-- infotext
	sa:add_initial_infotext(unpack(advisor_texts.second_turn.attacking_advice.initial_infotext))

	sa:add_attack_infotext(unpack(advisor_texts.second_turn.attacking_advice.attack_infotext))
	
	sa:start();
end

function add_second_turn_battle_completed_listener()
	core:add_listener(
		"ftue_second_turn_battle_completed",
		"CharacterCompletedBattle",
		function(context) 
			return context:character() == cm:get_faction(agamemnon_faction_key):faction_leader()
		end,
		function(context)
			cm:set_saved_value("bool_second_turn_battle_started", false)
			-- due to priority lock, the advice is greyed out in post battle panel. We need to higher his priority
			core:cache_and_set_advisor_priority(2000, true);
			
			if context:character():won_battle() then
				start_post_battle_won_advice()
			else
				start_post_battle_lost_advice()
			end
		end, 
		false
	)
	core:add_listener(
		"ftue_second_turn_battle_completed_but_died",
		"FactionCharacterDiedOrWounded",
		function(context)
			return context:family_member():character() == cm:get_faction(agamemnon_faction_key):faction_leader()
		end,
		function(context)
			cm:set_saved_value("bool_second_turn_battle_started", false)
			-- due to priority lock, the advice is greyed out in post battle panel. We need to higher his priority
			core:cache_and_set_advisor_priority(2000, true);

			core:add_listener(
				"ftue_popup_battle_results_closed",
				"PanelClosedCampaign",
				function(context) return context.string == "popup_battle_results" end,
				function(context)
					cm:callback(start_second_turn_end_turn_advice, 2)
				end,
				false
			)
		end, 
		false
	)
end


function attack_initiated_advice()
	local button_attack = core:get_ui_root():SequentialFind("button_set_attack", "button_attack")
  
	uim:override("autoresolve"):lock()
	uim:override("retreat"):lock()

	cm:callback(
		function()
			cm:show_advice(advisor_texts.second_turn.pre_battle_advice.advice_key);
			if #advisor_texts.second_turn.pre_battle_advice.info_text >= 1 then
				cm:add_infotext(unpack(advisor_texts.second_turn.pre_battle_advice.info_text))
			end

			button_attack:Highlight(true, true, 0)
			
		end,
		1
	);

	cm:set_saved_value("bool_second_turn_battle_started", true)
	add_second_turn_battle_completed_listener()
	
	-- listen for button being clicked
	core:add_listener(
		"attack_button_listener",
		"ComponentLClickUp",
		function(context) return context.string == "button_attack" --[[TODO: DEV ONLY. Delete this check--]]or context.string == "button_autoresolve" --[[/TODO--]]end,
		function()
			cm:dismiss_advice()
			button_attack:Highlight(false, true, 0)
			uim:override("autoresolve"):unlock()
			uim:override("retreat"):unlock()
		end,
		false
	)
end

function start_post_battle_won_advice()
	core:add_listener(
		"ftue_popup_battle_results_opened",
		"PanelOpenedCampaign",
		function(context) return context.string == "popup_battle_results" end,
		function(context)
			local button_set_win_holder = core:get_ui_root():SequentialFind("button_set_win_holder")
			local button_dismiss_holder = core:get_ui_root():SequentialFind("button_dismiss_holder")
			local button_dismiss_button = find_uicomponent(core:get_ui_root(), "button_dismiss")

			if button_dismiss_button and button_dismiss_button:Visible() then
				button_dismiss_holder:Highlight(true, true, 0)
			else
				button_set_win_holder:Highlight(true, true, 0)
			end

			cm:show_advice(advisor_texts.second_turn.post_battle_advice.win_advice_key);
			if #advisor_texts.second_turn.post_battle_advice.win_info_text >= 1 then
				cm:add_infotext(unpack(advisor_texts.second_turn.post_battle_advice.win_info_text))
			end

			core:add_listener(
				"ftue_popup_battle_results_closed",
				"PanelClosedCampaign",
				function(context) return context.string == "popup_battle_results" end,
				function(context)
					CampaignUI.ClearSelection();
					cm:callback(start_char_select_for_level_up_advice, 2)
				end,
				false
			)
		end,
		false
	)
end

function start_post_battle_lost_advice()
	core:add_listener(
		"ftue_popup_battle_results_opened",
		"PanelOpenedCampaign",
		function(context) return context.string == "popup_battle_results" end,
		function(context)
			local button_dismiss_holder = core:get_ui_root():SequentialFind("button_dismiss_holder")

			button_dismiss_holder:Highlight(true, true, 0)

			cm:show_advice(advisor_texts.second_turn.post_battle_advice.loose_advice_key);
			if #advisor_texts.second_turn.post_battle_advice.loose_info_text >= 1 then
				cm:add_infotext(unpack(advisor_texts.second_turn.post_battle_advice.loose_info_text))
			end

			core:add_listener(
				"ftue_popup_battle_results_closed",
				"PanelClosedCampaign",
				function(context) return context.string == "popup_battle_results" end,
				function(context)
					cm:callback(start_second_turn_end_turn_advice, 2)
					cm:get_campaign_ui_manager():clear_character_selection_whitelist()
				end,
				false
			)
		end,
		false
	)
end

function start_char_select_for_level_up_advice()
	local player_char = cm:get_faction(agamemnon_faction_key):faction_leader()
	cm:position_camera_at_primary_military_force(agamemnon_faction_key)
	core:restore_advisor_priority();
	cm:clear_infotext()
	cm:set_objective("troy_tutorial_camp_agamemnon_army_select_obj_01")
	cm:add_infotext(unpack(advisor_texts.second_turn.level_up_advice.info_text))
	uim:highlight_character_for_selection(player_char, function() cm:callback(start_level_up_advice, 0.5) uim:override("character_details"):unlock()  end)
end

function start_level_up_advice()
	cm:complete_objective("troy_tutorial_camp_agamemnon_army_select_obj_01")
	cm:remove_objective("troy_tutorial_camp_agamemnon_army_select_obj_01")
	local uic_skill_button = find_uicomponent(core:get_ui_root(), "CharacterInfoPopup", "rank", "skills", "skill_button")
	pulse_uicomponent(uic_skill_button, 2, 8)
	local level_up_text_pointer_1 = text_pointer:new_from_component(
		"level_up_text_pointer_1",
		"left",
		100,
		uic_skill_button,
		1,
		0.5
	)

	level_up_text_pointer_1:add_component_text("text", "ui_text_replacements_localised_text_troy_tutorial_tp_xp_button")
	level_up_text_pointer_1:set_style("semitransparent")
	level_up_text_pointer_1:set_topmost(true)
	level_up_text_pointer_1:set_close_button_callback(
		function()
			uim:override("end_of_turn_warnings"):lock()
		end
	)
	level_up_text_pointer_1:set_highlight_close_button(2)
	level_up_text_pointer_1:show()
	core:add_listener(
		"FTUE_char_level_screen_opened", 
		"ComponentLClickUp",
		function(context)
			if cm:get_local_faction_name(true) == agamemnon_faction_key then
				return  context.string == "skill_button" or context.string == "skills"
			end
		end,
		function(context) 
			cm:callback(available_skills_text_pointer, 0.2)
			level_up_text_pointer_1:hide(true, true)
			pulse_uicomponent(uic_skill_button, false)
			cm:dismiss_advice()
		end,
		false
	)
	core:add_listener(
		"ftue_character_deselection_listener",
		"CharacterDeselected", 
		true,
		function()
			core:remove_listener(ftue_character_deselection_listener);
			level_up_text_pointer_1:hide(true, true)
			pulse_uicomponent(uic_skill_button, false)
			uim:highlight_character_for_selection(cm:get_faction(agamemnon_faction_key):faction_leader(), function() cm:callback(start_level_up_advice, 0.5) uim:override("character_details"):unlock()  end);
		end, 
		false
	)
	core:add_listener(
		"FTUE_char_level_screen_opened", 
		"ComponentLClickUp",
		function(context)
			if cm:get_local_faction_name(true) == agamemnon_faction_key then
				return  context.string == "button_general" 
			end
		end,
		function(context)
			level_up_text_pointer_1:hide(true, true)
			pulse_uicomponent(uic_skill_button, false)
			cm:dismiss_advice()
		end,
		false
	)
	
end

function available_skills_text_pointer()
	local uic_skills = find_uicomponent(core:get_ui_root(), "character_details_panel", "hero_info", "sidepanel_skills", "skills_subpanel", "listview", "list_clip", "list_box", "skill_tier_2")
	pulse_uicomponent(uic_skills, 2, 8)
	local skills_text_pointer = text_pointer:new_from_component(
		"skills_text_pointer",
		"right",
		100,
		uic_skills,
		0,
		0.5
	)

	skills_text_pointer:add_component_text("text", "ui_text_replacements_localised_text_troy_st_char_screen_9")
	skills_text_pointer:set_style("semitransparent")
	skills_text_pointer:set_topmost(true)
	skills_text_pointer:set_close_button_callback(
		function()
			uim:override("end_of_turn_warnings"):lock()
			pulse_uicomponent(uic_skills, false)
		end
	)
	skills_text_pointer:set_highlight_close_button(2)
	skills_text_pointer:show()
	core:add_listener(
		"FTUE_char_panel_closed", 
		"PanelClosedCampaign",
		function(context)
			 return cm:get_local_faction_name(true) == agamemnon_faction_key and context.string == "character_details_panel"
		end,
		function(context)
			cm:callback(start_second_turn_end_turn_advice, 0.5)
			skills_text_pointer:hide(true, true)
			pulse_uicomponent(uic_skills, false)
		end,
		false
	)
end

function start_second_turn_end_turn_advice()
   -- uim:override("end_of_turn_warnings"):lock()
   	core:remove_listener("ftue_character_deselection_listener")
	cm:set_saved_value("bool_second_turn_all_steps_completed", true)
	uim:override("end_turn"):unlock()
	uim:override("saving"):unlock()
	cm:callback(function() cm:get_campaign_ui_manager():display_faction_buttons(true) end, 1);
	
	local ea = intro_campaign_end_turn_advice:new(
		advisor_texts.second_turn.end_turn_advice.advice_key,
		advisor_texts.second_turn.end_turn_advice.objective_key,
		function()
			uim:override("end_of_turn_warnings"):unlock()
		end
	);
	
	ea:add_infotext(unpack(advisor_texts.second_turn.end_turn_advice.info_text))
	
	ea:start();
end

---------------------------------------------------------------
-- Agamemnon Third Turn
---------------------------------------------------------------


core:add_listener(
	"FTUE_FactionTurnStart_3", 
	"FactionTurnStart",
	function(context) return context:faction():name() == agamemnon_faction_key and cm:turn_number() == 3 end,
	function(context) 
		cm:callback(start_building_advice, 0.5)
		cm:scroll_camera_from_current(true, 2, starting_camera_position)
		uim:override("end_turn"):lock()
		uim:override("saving"):lock()
		uim:override("recruit_units"):set_allowed(true)
		uim:override("recruit_units"):unlock()
		uim:override("stances"):unlock()
		-- the recruitment advice disables cancel_recruitment because we don't want the player to be able to do it at that point. Now we enable it again.
		uim:override("cancel_recruitment"):set_allowed(true)
	end,
	false
)

function start_building_advice()
	-- Restore advisor priority like it was before post battle
	--core:restore_advisor_priority();

	-- region_name, province_name, start_advice, start_objective, base_building_card, upgrade_building_card, upgrade_objective, end_advice, end_callback
	local ba = intro_campaign_building_construction_advice:new(
		"troy_main_mycenaeca_mycenae",
		cm:get_region("troy_main_mycenaeca_mycenae"):province_name(),
		advisor_texts.third_turn.buildings_construction_advice.start_advice,
		advisor_texts.third_turn.buildings_construction_advice.start_objective,
		"building_slot_2",
		nil,
		nil,
		advisor_texts.third_turn.buildings_construction_advice.build_objective,
		advisor_texts.third_turn.buildings_construction_advice.end_advice,
		function()
			cm:set_saved_value("bool_third_turn_all_steps_completed", true)
			start_third_turn_end_turn_advice() 
		end
	);
	
	ba:add_initial_infotext(unpack(advisor_texts.third_turn.buildings_construction_advice.initial_infotext));
	ba:add_rollout_infotext(unpack(advisor_texts.third_turn.buildings_construction_advice.build_infotext));
	ba:add_completion_infotext(unpack(advisor_texts.third_turn.buildings_construction_advice.end_infotext));
	
	ba:start();
end

function start_third_turn_end_turn_advice()
	-- uim:override("end_of_turn_warnings"):lock()
	 uim:override("end_turn"):unlock()
	 uim:override("saving"):unlock()
	 cm:callback(function() cm:get_campaign_ui_manager():display_faction_buttons(true) end, 1);
	 
	 local ea = intro_campaign_end_turn_advice:new(
		 advisor_texts.third_turn.end_turn_advice.advice_key,
		 advisor_texts.third_turn.end_turn_advice.objective_key,
		 function()
			uim:disable_character_selection_whitelist()
			uim:disable_settlement_selection_whitelist()
			ftue_random_active_overrides.character_settlement_override = false
			--uim:override("end_of_turn_warnings"):unlock()
		 end
	 );
	 
	 ea:add_infotext(unpack(advisor_texts.third_turn.end_turn_advice.info_text))
	 
	 ea:start();
 end

 function recruit_hero_highlight()
	local uic_hero_button = find_uicomponent(core:get_ui_root(), "button_group_settlement", "button_create_army")
	uic_hero_button:Highlight(true, true, 0)
	core:add_listener(
		"FTUE_hero_button_selected", 
		"PanelOpenedCampaign",
		function(context) return context.string == "character_panel" end,
		function(context)
			uic_hero_button:Highlight(false, false, 0)
		end,
		false
	)
 end

 function happiness_highlight()
	local uic_province = find_uicomponent(core:get_ui_root(), "ProvinceInfoPopup")
	uic_province:Highlight(true, true, 0)
	local uic_population_surplus = find_uicomponent(core:get_ui_root(), "ProvinceInfoPopup", "pop_surplus")
	local population_surplus_tp = text_pointer:new_from_component(
		"population_surplus_tp",
		"left",
		100,
		uic_population_surplus,
		1,
		0.5
	)

	population_surplus_tp:add_component_text("text", "ui_text_replacements_localised_text_population_surplus_tooltip")
	population_surplus_tp:set_style("semitransparent")
	population_surplus_tp:set_topmost(true)
	population_surplus_tp:set_show_close_button(true)
	population_surplus_tp:set_hide_on_close_button_clicked()
	population_surplus_tp:show()
	core:add_listener(
		"FTUE_happiness_highlight", 
		"PanelClosedCampaign",
		function(context) return context.string == "settlement_panel" end,
		function(context)
			uic_province:Highlight(false, false, 0)
			population_surplus_tp:hide()
		end,
		false
	)
 end

 function mission_text_pointer()
	local uic_missions_button = core:get_ui_root():SequentialFind("tab_missions")
	local missions_button_tp = text_pointer:new_from_component(
		"missions_button_tp",
		"right",
		100,
		uic_missions_button,
		0,
		0.5
	)

	missions_button_tp:add_component_text("text", "ui_text_replacements_localised_text_troy_tutorial_tp_missions_button")
	missions_button_tp:set_style("semitransparent")
	missions_button_tp:set_topmost(true)
	missions_button_tp:set_show_close_button(true)
	missions_button_tp:set_hide_on_close_button_clicked()
	missions_button_tp:show()
	core:add_listener(
		"FTUE_missions_tp_cleanup_1", 
		"PanelOpenedCampaign",
		function(context) return context.string == "diplomacy_dropdown" or context.string == "esc_menu_campaign" or context.string == "clan" or context.string == "technology_panel" or context.string == "gods_and_favor" or context.string == "building_browser" end,
		function(context)
			missions_button_tp:hide()
		end,
		false
	) 
	core:add_listener(
		"FTUE_missions_tp_cleanup_2", 
		"ScriptEventPlayerFactionTurnEnd",
		true,
		function(context)
			missions_button_tp:hide()
		end,
		true
	) 
 end


--------------------------------------------------------------- 
--unlocking ui elements per turn ---
---------------------------------------------------------------
core:add_listener(
	"FTUE_FactionTurnStart_4", 
	"FactionTurnStart",
	function(context) return context:faction():name() == agamemnon_faction_key and cm:turn_number() == 4 end,
	function(context) 
		uim:override("hide_faction_widget"):unlock() 
		uim:override("hide_resources_bar"):unlock()
		cm:force_diplomacy("faction:"..agamemnon_faction_key, "all", "war", true, true)
		enable_tutorial_battles_buttons(true)
		local settlement_corinth = "troy_main_mycenaeca_corinth"
		local province_mycenae = "troy_main_mycenaeca"
		if  cm:is_region_owned_by_faction(settlement_corinth, agamemnon_faction_key) then
			uim:highlight_settlement_for_selection("settlement:".. settlement_corinth, province_mycenae, function() end)
		end
	end,
	false
)

core:add_listener(
	"FTUE_FactionTurnStart_6", 
	"FactionTurnStart",
	function(context) return context:faction():name() == agamemnon_faction_key and cm:turn_number() == 6 end,
	function(context)
		uim:override("hide_faction_widget_buttons"):unlock()
		uim:override("diplomacy"):unlock()
		mission_text_pointer()
	end,
	false
)

core:add_listener(
	"FTUE_FactionTurnStart_7", 
	"FactionTurnStart",
	function(context) return context:faction():name() == agamemnon_faction_key and cm:turn_number() == 7 end,
	function(context)
		cm:set_skip_all_but_faction(context:faction(), false)
		ftue_event_overrides = false
	end,
	false
)

core:add_listener(
	"FTUE_FactionTurnStart_12", 
	"FactionTurnStart",
	function(context) return context:faction():name() == agamemnon_faction_key and cm:turn_number() == 12 end,
	function(context) 
		uim:override("technology"):unlock()
		uim:suppress_end_turn_warning("research available", false) -- research
		ftue_random_active_overrides.research_override = false
		mission_text_pointer()
	end,
	false
)

core:add_listener(
	"FTUE_FactionTurnStart_14", 
	"FactionTurnStart",
	function(context) return context:faction():name() == agamemnon_faction_key and cm:turn_number() == 14 end,
	function(context) 
		local settlement = "troy_main_mycenaeca_mycenae"
		local province = "troy_main_mycenaeca"
		uim:override("hide_settlement_panel_recruit_lord"):unlock()
		uim:highlight_settlement_for_selection("settlement:".. settlement, province, function() cm:callback(recruit_hero_highlight, 0.5) end)
		core:add_listener(
			"FTUE_hero_backup_cleanup", 
			"NewCharacterRecruited",
			function(context) return context:character():faction():name() == agamemnon_faction_key end,
			function(context)
				uim:unhighlight_settlement_for_selection("settlement:".. settlement, province, function() end)
			end,
			false
		)
	end,
	false
)

core:add_listener(
	"FTUE_FactionTurnStart_15", 
	"FactionTurnStart",
	function(context) return context:faction():name() == agamemnon_faction_key and cm:turn_number() == 15 end,
	function(context) 
		uim:override("hide_divine_will_button"):unlock()
	end,
	false
)

core:add_listener(
	"FTUE_FactionTurnStart_18", 
	"FactionTurnStart",
	function(context) return context:faction():name() == agamemnon_faction_key and cm:turn_number() == 18 end,
	function(context)
		mission_text_pointer()
	end,
	false
)

core:add_listener(
	"FTUE_FactionTurnStart_22", 
	"FactionTurnStart",
	function(context) return context:faction():name() == agamemnon_faction_key and cm:turn_number() == 22 end,
	function(context)
		uim:override("hide_fm_offices_container"):unlock()
		uim:override("hide_fm_demand_tribute_container"):unlock()
		uim:suppress_end_turn_warning("agamemnon_office_can_be_filled", false)
		ftue_random_active_overrides.offices_override = false
	end,
	false
)

core:add_listener(
	"FTUE_FactionTurnStart_26", 
	"FactionTurnStart",
	function(context) return context:faction():name() == agamemnon_faction_key and cm:turn_number() == 26 end,
	function(context)
		local settlement = "troy_main_mycenaeca_mycenae"
		local province = "troy_main_mycenaeca"
		uim:highlight_settlement_for_selection("settlement:".. settlement, province, function() cm:callback(happiness_highlight, 0.5) end)
	end,
	false
)

core:add_listener(
	"FTUE_FactionTurnStart_32", 
	"FactionTurnStart",
	function(context) return context:faction():name() == agamemnon_faction_key and cm:turn_number() == 32 end,
	function(context) 
		uim:override("objectives_screen"):unlock()
	end,
	false
)

core:add_listener(
	"FTUE_Agent_building_constructed", 
	"BuildingCompleted",
	function(context) return context:building():faction():name() == agamemnon_faction_key and (string.find(context:building():superchain(), "troy_main_religion") or context:building():name() == "troy_main_influence_2" or context:building():name() == "troy_main_happiness_2" ) end,
	function(context) 
		uim:override("hide_settlement_panel_recruit_hero"):unlock()
	end,
	false
)

core:add_listener(
	"FTUE_dummy_proof_listener", 
	"PanelClosedCampaign",
	function(context) return context.string == "appoint_new_general" end,
	function(context)
		if cm:turn_number() >= 2 then
			uim:override("character_details"):unlock()
			uim:override("hide_settlement_panel_recruit_lord"):unlock()
		end
		uim:disable_character_selection_whitelist()
	end,
	false
)

---------------------------------------------------------------------
----- Text pointer listeners ----------
---------------------------------------------------------------------
	

	core:add_listener(
	"FTUE_pre_battle_quick_save", 
	"PanelOpenedCampaign",
	function(context) return context.string == "popup_pre_battle" and cm:turn_number() >= 8 end,
	function(context)
		local button_quick_save = core:get_ui_root():SequentialFind("button_save")
		if button_quick_save:CurrentState() == "active" then 
			local quick_save_text_pointer = text_pointer:new_from_component(
				"quick_save_text_pointer",
				"bottom",
				100,
				button_quick_save,
				0.5,
				0
			)

			quick_save_text_pointer:add_component_text("text", "ui_text_replacements_localised_text_troy_tutorial_tp_quick_save")
			quick_save_text_pointer:set_style("semitransparent")
			quick_save_text_pointer:set_topmost(true)
			quick_save_text_pointer:set_show_close_button(true)
			quick_save_text_pointer:set_hide_on_close_button_clicked()
			quick_save_text_pointer:show()

			core:add_listener(
			"FTUE_pre_battle_quick_save_cleanup", 
			"PanelClosedCampaign",
			function(context) return context.string == "popup_pre_battle" end,
			function(context) 
				quick_save_text_pointer:hide()
			end,
			false
			)
		end
	end,
	true
)

core:add_listener(
	"FTUE_end_turn_tp", 
	"ScriptEventPlayerFactionTurnEnd",
	function(context) return cm:turn_number() >= 7 and ftue_listeners_saved_values.end_turn < 2 end,
	function(context)
		
		cm:callback(
			function()
				local button_ai_controls = core:get_ui_root():SequentialFind("button_pause")
				if button_ai_controls then 
					local ai_turn_controls_text_pointer = text_pointer:new_from_component(
						"ai_turn_controls_text_pointer",
						"top",
						100,
						button_ai_controls,
						0.5,
						1
					)
					ai_turn_controls_text_pointer:add_component_text("text", "ui_text_replacements_localised_text_troy_tutorial_tp_end_turn_controls")
					ai_turn_controls_text_pointer:set_style("semitransparent")
					ai_turn_controls_text_pointer:set_topmost(true)
					ai_turn_controls_text_pointer:set_show_close_button(true)
					ai_turn_controls_text_pointer:set_close_button_callback(
						function()
							if ftue_listeners_saved_values.end_turn ~= nil then
								ftue_listeners_saved_values.end_turn = ftue_listeners_saved_values.end_turn + 1
								core:remove_listener("FTUE_FactionTurnStart_tp_cleanup")
								core:remove_listener("FTUE_FactionTurnStart_tp_cleanup_diplomacy")
								if ftue_listeners_saved_values.end_turn >= 2 then
									core:remove_listener("FTUE_end_turn_tp")
								end
							end
						end
					)
					ai_turn_controls_text_pointer:show()

					core:add_listener(
						"FTUE_FactionTurnStart_tp_cleanup", 
						"FactionTurnStart",
						function(context) return context:faction():name() == agamemnon_faction_key end,
						function(context) 
							if ai_turn_controls_text_pointer then 
								ai_turn_controls_text_pointer:hide()
								if ftue_listeners_saved_values.end_turn ~= nil then
									ftue_listeners_saved_values.end_turn = ftue_listeners_saved_values.end_turn + 1
									if ftue_listeners_saved_values.end_turn >= 2 then
										core:remove_listener("FTUE_end_turn_tp")
									end
								end
							end
						end,
						false
					)

					core:add_listener(
						"FTUE_FactionTurnStart_tp_cleanup_diplomacy", 
						"PanelOpenedCampaign",
						function(context) return context.string == "diplomacy_dropdown" end,
						function(context) 
							if ai_turn_controls_text_pointer then 
								ai_turn_controls_text_pointer:hide()
								if ftue_listeners_saved_values.end_turn ~= nil then
									ftue_listeners_saved_values.end_turn = ftue_listeners_saved_values.end_turn + 1
									if ftue_listeners_saved_values.end_turn >= 2 then
										core:remove_listener("FTUE_end_turn_tp")
									end
								end
							end
						end,
						false
					)
				end
			end, 
			1
		)

	end,
	true
)

core:add_listener(
	"FTUE_counter_offer_tp", 
	"PanelOpenedCampaign",
	function(context) return context.string == "diplomacy_dropdown" and cm:whose_turn_is_it() ~= agamemnon_faction_key and ftue_listeners_saved_values.counter_offer < 3 end,
	function(context) 
		cm:callback(
			function()
				local button_counter_offer = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown", "offers_panel", "offers_list_panel", "offers_submenu", "offers_buttons_list_1","button_counter_offer")
				if button_counter_offer and button_counter_offer:CurrentState() == "active" then 
					local counter_offer_text_pointer = text_pointer:new_from_component(
						"counter_offer_text_pointer",
						"bottom",
						100,
						button_counter_offer,
						0.5,
						-1
					)
					counter_offer_text_pointer:add_component_text("text", "ui_text_replacements_localised_text_troy_tutorial_tp_counter_offer")
					counter_offer_text_pointer:set_style("semitransparent")
					counter_offer_text_pointer:set_topmost(true)
					counter_offer_text_pointer:set_show_close_button(true)
					counter_offer_text_pointer:set_close_button_callback(
					function()
						if ftue_listeners_saved_values.counter_offer ~= nil then
							ftue_listeners_saved_values.counter_offer = ftue_listeners_saved_values.counter_offer + 1
							core:remove_listener("FTUE_tp_cleanup_counter_1")
							core:remove_listener("FTUE_tp_cleanup_counter_2")
							if ftue_listeners_saved_values.counter_offer >= 3 then
								core:remove_listener("FTUE_counter_offer_tp")
							end
						end
					end
					)
					counter_offer_text_pointer:show()

					core:add_listener(
						"FTUE_tp_cleanup_counter_1", 
						"PanelClosedCampaign",
						function(context) return context.string == "diplomacy_dropdown" end,
						function(context) 
							if counter_offer_text_pointer then 
								counter_offer_text_pointer:hide()
								if ftue_listeners_saved_values.counter_offer ~= nil then
									ftue_listeners_saved_values.counter_offer = ftue_listeners_saved_values.counter_offer + 1
									if ftue_listeners_saved_values.counter_offer >= 3 then
										core:remove_listener("FTUE_counter_offer_tp")
									end
								end
							end
						end,
						false
					)

					core:add_listener(
						"FTUE_tp_cleanup_counter_2", 
						"ComponentLClickUp",
						function(context) return context.string == "button_counter_offer" or context.string == "button_decline" or context.string == "button_agree" end,
						function(context) 
							if counter_offer_text_pointer then 
								counter_offer_text_pointer:hide()
								if ftue_listeners_saved_values.counter_offer ~= nil then
									ftue_listeners_saved_values.counter_offer = ftue_listeners_saved_values.counter_offer + 1
									if ftue_listeners_saved_values.counter_offer >= 3 then
										core:remove_listener("FTUE_counter_offer_tp")
									end
								end
							end
						end,
						false
					)
				end
			end, 
			2
		)
	end,
	true
)

core:add_listener(
	"FTUE_motivation_tp", 
	"ComponentLClickUp",
	function(context) return context.string == "button_create_army" end,
	function(context) 
		cm:callback(
			function()
				local uic_motivation_trait = find_uicomponent(core:get_ui_root(), "character_panel", "general_selection_panel", "character_list_parent", "character_list", "loyalty")
				
				if uic_motivation_trait and uic_motivation_trait:Visible() then 
					local motivation_text_pointer = text_pointer:new_from_component(
						"motivation_text_pointer",
						"bottom",
						100,
						uic_motivation_trait,
						0.5,
						0
					)
					motivation_text_pointer:add_component_text("text", "ui_text_replacements_localised_text_troy_tutorial_tp_motivation")
					motivation_text_pointer:set_style("semitransparent")
					motivation_text_pointer:set_topmost(true)
					motivation_text_pointer:set_show_close_button(true)
					motivation_text_pointer:show()

					core:add_listener(
						"FTUE_motivation_tp_cleanup_1", 
						"PanelClosedCampaign",
						function(context) return context.string == "character_panel" end,
						function(context) 
							if motivation_text_pointer then 
								motivation_text_pointer:hide()
							end
						end,
						false
					)

					core:add_listener(
						"FTUE_motivation_tp_cleanup_2", 
						"PanelOpenedCampaign",
						function(context) return context.string == "units_panel" end,
						function(context) 
							if motivation_text_pointer then 
								motivation_text_pointer:hide()
							end
						end,
						false
					)

				end
			end, 
			2
		)
	end,
	false
)

core:add_listener(
	"FTUE_end_turn_notifications_tp", 
	"FactionTurnStart",
	function(context) 
		local uic_notification_button_check = core:get_ui_root():SequentialFind("tab_notifications")
		if context:faction():name() == agamemnon_faction_key and cm:turn_number() >= 3 then
			if uic_notification_button_check then
				if uic_notification_button_check:CurrentState() == "active" then
					return true
				end
			else
				return false
			end
		end
	end,
	function(context) 
		local uic_notification_button = core:get_ui_root():SequentialFind("tab_notifications")
		if uic_notification_button then 
			local end_notification_text_pointer = text_pointer:new_from_component(
				"end_notification_text_pointer",
				"right",
				100,
				uic_notification_button,
				0,
				0.5
			)
			end_notification_text_pointer:add_component_text("text", "ui_text_replacements_localised_text_troy_tutorial_tp_notifications_button")
			end_notification_text_pointer:set_style("semitransparent")
			end_notification_text_pointer:set_topmost(true)
			end_notification_text_pointer:set_show_close_button(true)
			end_notification_text_pointer:set_close_button_callback(
					function()
						core:remove_listener("FTUE_notification_tp_cleanup")
					end
				)
			end_notification_text_pointer:show()
			core:add_listener(
				"FTUE_notification_tp_cleanup", 
				"PanelOpenedCampaign",
				function(context) return context.string ~= "events" and context.string ~= "units_panel" end,
				function(context)
					end_notification_text_pointer:hide()
				end,
				true
			) 
			core:add_listener(
				"FTUE_notification_tp_cleanup", 
				"ScriptEventPlayerFactionTurnEnd",
				true,
				function(context)
					end_notification_text_pointer:hide()
				end,
				true
			) 
		end
	end,
	false
)
---------------------------------------------------------------
-- Personality overrides
---------------------------------------------------------------

core:add_listener(
	"ftue_personality_overrides_turn_35", 
	"FactionTurnStart", 
	function(context) 
		return context:faction():name() == agamemnon_faction_key and cm:turn_number() == 35
	end,
	function(context)
		-- Time to override some personalities
		local faction_list = cm:model():world():faction_list()
		for i = 0, faction_list:num_items() - 1 do
			local curr_faction = faction_list:item_at(i)
			if not curr_faction:is_human() and curr_faction:is_allowed_to_capture_territory() then
				cm:force_change_cai_faction_personality(curr_faction:name(), "troy_survivor_early_easy")
			end
		end
	end,
	false
)

core:add_listener(
	"ftue_personality_overrides_turn_70", 
	"FactionTurnStart", 
	function(context) 
		return context:faction():name() == agamemnon_faction_key and cm:turn_number() == 70
	end,
	function(context)
		-- Time to override some personalities
		local faction_list = cm:model():world():faction_list()
		for i = 0, faction_list:num_items() - 1 do
			local curr_faction = faction_list:item_at(i)
			if not curr_faction:is_human() and curr_faction:is_allowed_to_capture_territory() then
				cm:force_change_cai_faction_personality(curr_faction:name(), "troy_survivor_easy")
			end
		end
	end,
	false
)

core:add_listener(
	"ftue_personality_overrides_turn_100", 
	"FactionTurnStart", 
	function(context) 
		return context:faction():name() == agamemnon_faction_key and cm:turn_number() == 100
	end,
	function(context)
		-- Time to override some personalities
		local faction_list = cm:model():world():faction_list()
		for i = 0, faction_list:num_items() - 1 do
			local curr_faction = faction_list:item_at(i)
			if not curr_faction:is_human() and curr_faction:is_allowed_to_capture_territory() then
				cm:force_change_cai_faction_personality(curr_faction:name(), "troy_survivor_easy")
			end
		end
	end,
	false
)

core:add_listener(
	"ftue_personality_overrides_turn_150", 
	"FactionTurnStart", 
	function(context) 
		return context:faction():name() == agamemnon_faction_key and cm:turn_number() == 150
	end,
	function(context)
		-- Time to override some personalities
		local faction_list = cm:model():world():faction_list()
		for i = 0, faction_list:num_items() - 1 do
			local curr_faction = faction_list:item_at(i)
			if not curr_faction:is_human() and curr_faction:is_allowed_to_capture_territory() then
				cm:force_change_cai_faction_personality(curr_faction:name(), "troy_survivor_easy")
			end
		end
	end,
	false
)



---------------------------------------------------------------
-- Start Tutorial
---------------------------------------------------------------

cm:add_first_tick_callback(start_tutorial)
cm:add_first_tick_callback(
function() 
	if cm:get_saved_value("bool_is_ftue_mode") then
		if ftue_event_overrides then
			cm:suppress_all_event_feed_event_types(true)

			core:add_listener(
			"ftue_turn_7_event_override_cleanup_check", 
			"FactionTurnStart",
			function(context) return context:faction():name() == agamemnon_faction_key and cm:turn_number() >= 7 and ftue_event_overrides end,
			function(context)
				ftue_event_overrides = false
			end,
			false
		)
		end
		core:add_listener(
			"turn_2_start_war", 
			"FactionTurnStart",
			function(context) return context:faction():name() == agamemnon_faction_key and cm:turn_number() == 2 end,
			function(context)
				cm:force_declare_war(
					"troy_main_dan_corinthians", 
					agamemnon_faction_key, 
					false, 
					false, 
					false
				)
			end,
			false
		)
	end
end
)

-- SAVE ACTIVE UI OVERRIDES
cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("FTUE_ACTIVE_UI_OVERRIDES", ftue_active_ui_overrides, context)
		cm:save_named_value("FTUE_ACTIVE_TP_LISTENERS", ftue_listeners_saved_values, context)
		cm:save_named_value("FTUE_RANDOM_ACTIVE_OVERRIDES", ftue_random_active_overrides, context)
		cm:save_named_value("FTUE_EVENT_OVERRIDES", ftue_event_overrides, context)
	end
)


core:add_listener(
	"ftue_handle_global_interventions",
	"RoundStart",
	true,
	function(context)
		if EVENT_CHAINS_has_advice_this_turn() then
			cm.campaign_intervention_max_cost_points_per_session = 0
		else
			cm.campaign_intervention_max_cost_points_per_session = 100
		end
	end,
	true
)

