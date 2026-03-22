output_uicomponent_on_click();
bm:out("Battle main loaded")

local ADVANCED_BATTLE_DEBUG_ENABLED = false
local hidden_tp_text = "ui_text_replacements_localised_text_troy_intro_battle_hidden"
local rage_tp_text = "ui_text_replacements_localised_text_troy_tutorial_battle_rage_pointer"
local group_number_tp_text = "ui_text_replacements_localised_text_troy_tutorial_tp_group_number"
local time_controls_tp_text = "ui_text_replacements_localised_text_troy_tutorial_tp_time_controls"
local time_controls_2_tp_text = "ui_text_replacements_localised_text_troy_tutorial_tp_time_controls_2"


advisor_texts = {
	first_step = {
		deployment_advice = {
			advice_key_debug = "I.0: What is deployment?",
			advice_key = "troy_battle_advisor_deployment_001",
			info_text = {
				"troy_battle_info_deployment_02"
			},
		},
		locate_enemy_army = {
			advice_key_debug = "I.1: Locate the enemy army",
			advice_key = "troy_tut_battle_adv_scout_01",
			objective_key = "troy.battle.intro.camera_advice.001",
			info_text = {
				"troy.battle.intro.info_038",
			},
		},
		forest_advice = {
			advice_key_debug = "I.2: Learn about forest, uphill movement and line of sight",
			advice_key = "troy_tut_battle_adv_forest_01",
			info_text = {},
		}
	},
	second_step = {
		select_javelins = {
			advice_key_debug = "II.1: Select all Light Javelins",
			advice_key = "troy_tut_battle_adv_javelinmen_01",
			objective_key = "troy.battle.intro.general_selection_advice.007",
			info_text = {
				"troy.battle.intro.info_036",
				"troy.battle.intro.info_024",
				"troy.battle.intro.info_006"
			},
		},
		vanguard_deployment_advice = {
			advice_key_debug = "II.2: Listen to advisor (vanguard deployment)",
			advice_key = "troy_tut_battle_adv_vanguard_01",
			info_text = {},
		},
		javelins_deployment_advice = {
			advice_key_debug = "II.3-4: Deploy your Light Javelins on the left and right flanks (in forest)",
			advice_key = "troy_tut_battle_adv_vanguard_02",
			info_text = {
				"troy.battle.intro.info_037",
				"troy.battle.intro.info_042"
			},
		},
		first_javelin_deployment = {
			objective_key = "troy.battle.intro.chariot_deployment.001",
		},
		second_javelin_deployment = {
			objective_key = "troy.battle.intro.chariot_deployment.002",
		},
		ack_hidden_status_advice = {
			advice_key_debug = "II.5: Acknowledge \"hidden\" status",
			advice_key = "troy_tut_battle_adv_forest_hide_01",
			info_text = {},
		}
	},
	third_step = {
		army_selection_advice = {
			advice_key_debug = "III.1-2: Listen to advisor (terrain deployment). Obj: Select all remaining units.",
			advice_key = "troy_tut_battle_adv_basic_battle_01",
			objective_key = "troy.battle.intro.general_selection_advice.007",
			info_text = {"troy.battle.intro.info_021"},
		},
		group_units_advice = {
			advice_key_debug = "III.2: Group selected units. Press Ctrl + G",
			advice_key = "troy_tut_battle_adv_formation_01",
			objective_key = "troy.battle.intro.general_selection_advice.002",
			info_text = {
				-- "troy.battle.intro.info_003",
				"troy.battle.intro.info_004"
			},
		},
		initiate_battle_advice = {
			advice_key_debug = "III: Press the Start battle button",
			advice_key = "troy_tut_battle_adv_start_battle_01",
			info_text = {},
		}
	},
	fourth_step = {
		army_selection_advice = {
			advice_key_debug = "IV.2: Select all remaining units.",
			advice_key = "troy_tut_battle_adv_march_01",
			objective_key = "troy.battle.intro.general_selection_advice.003",
			info_text = {"troy.battle.intro.info_003"},
		},
		activate_guard_mode = {
			advice_key_debug = "IV.3: Press \"Guard mode\" on the army in position",
			advice_key = "troy_tut_battle_adv_guard_mode_01",
			info_text ={
				"troy.battle.intro.info_007",
				"troy.battle.intro.info_008"
			},
			objective_key = "troy.battle.intro.guard_mode.001",
		},
		guard_mode_advice = {
			advice_key_debug = "IV.4: Listen to advisor (guard mode)",
			advice_key = "troy_tut_battle_adv_guard_mode_02",
			info_text = {},
		},
		advance_army = {
			advice_key_debug = "IV.5: Advance towards the enemy and scout",
			advice_key = "troy_tut_battle_adv_march_02",
			objective_key = "troy.battle.intro.movement_advice.001",
			info_text = {
				"troy.battle.intro.info_022",
				-- "troy.battle.intro.info_013"
			},
		}
	},
	fifth_step = {
		flanking_advice = {
			advice_key_debug = "V.1-2: Select the Light Javelins and Move them behind the army like the cheriots right now",
			advice_key = "troy_tut_battle_adv_flank_01",
			objective_key = "troy.battle.intro.attack_advice.002", 
			javelin_1_infotext = {
				"troy.battle.intro.info_040",
				"troy.battle.intro.info_042"
			},
			javelin_2_infotext = {
				"troy.battle.intro.info_041",
				"troy.battle.intro.info_042"
			}
		},
		attack_enemy_advice = {
			advice_key_debug = "V.3: Listen to advisor (flanking, rear charge). Objective: Initiate flanking attack",
			advice_key = "troy_tut_battle_adv_flank_02",
			objective_key = "troy.battle.intro.attack_advice.003", 
			info_text = {
			"troy.battle.intro.info_014",
			"troy.battle.intro.info_015",
			"troy.battle.intro.info_016"
			},
		},
		morale_penalty_advice = {
			advice_key_debug = "V.4: Acknowledge morale penalty from flanking and charging",
			advice_key = "troy_tut_battle_adv_flank_03",
			objective_key = "troy.battle.intro.attack_advice.004", 
			info_text = {},
		}
	},
	sixth_step = {
		select_hero_advice = {
			advice_key_debug = "VI.1: Select the hero",
			advice_key = "troy_tut_battle_adv_hero_ability_01",
			objective_key = "troy.battle.intro.general_selection_advice.005",
			info_text = {
				"troy.battle.intro.info_009",
				"troy.battle.intro.info_010"
			}
		},
		special_ability_advice = {
			advice_key_debug = "VI.2-3: Hero abilities and role in battle. Obj: Trigger Favour of Asclepius",
			advice_key = "troy_tut_battle_adv_hero_rage_01",
			objective_key = "troy.battle.intro.attack_advice.006",
			info_text = {
				"troy.battle.intro.info_039"
			},
		},
	},
	seventh_step = {
		win_battle_advice = {
			advice_key_debug = "VII.1: Win using the provided battle setup",
			advice_key = "troy_tut_battle_adv_hero_to_victory_01",
			info_text = {
				-- "troy.battle.intro.info_024",
				-- "troy.battle.intro.info_025",
				-- "troy.battle.intro.info_005"
			},
		},
		acknowledge_victory_advice = {
			enemy_routs_advice_debug = "VII.2: Acknowledge victory (scripted): ENEMY ROUTS",
			player_routs_advice_debug = "VII.2: Acknowledge victory (scripted): PLAYER ROUTS",

			enemy_routs_advice = "troy_tut_battle_basic_victory_01",
			enemy_info_text = {
				"troy.battle.intro.info_043",
				"troy.battle.intro.info_044"
			},

			player_routs_advice = "troy_tut_battle_basic_friend_routing_01",
			player_info_text = {}
		}
	},

	objective_complete_infotext = {
		"troy.battle.intro.info_obejctive_complete_01",
		"troy.battle.intro.info_obejctive_complete_02"
	},
	advice_without_obj_complete_infotext = {
		"troy.battle.intro.info_obejctive_complete_02"
	}
}

MIN_ADVICE_DURATION_MS = 3000

get_objectives_manager():set_debug()

bm:register_phase_change_callback(
	"Deployment",
	function()
		show_advisor_progress_buttons(false)
		-- show the cutscene borders immediately
		bm:enable_cinematic_ui(true, true, true)
		show_advisor_progress_buttons(false);

		-- Hide the Start Battle button, fade the screen to black immediately, and start the intro cutscene once the loading screen has dismissed
		bm:show_start_battle_button(false);
		bm:camera():fade(true, 0);
		core:progress_on_loading_screen_dismissed(function() advanced_battle_intro_scene:start() end, "battle")
	end
);

function show_speed_up_controls(should_show)
	local button_fwd = core:get_ui_root():SequentialFind("hud_battle", "radar_holder", "speed_controls", "speed_buttons", "fwd")
	local button_ffwd = core:get_ui_root():SequentialFind("hud_battle", "radar_holder", "speed_controls", "speed_buttons", "ffwd")

	if button_fwd then
		button_fwd:SetVisible(not not should_show)
	end
	if button_ffwd then
		button_ffwd:SetVisible(not not should_show)
	end
end

function override_loading_screen_on_skip_end()

	-- button clicks without confirmation box
	core:add_listener(
		"skip_end_battle_listener_no_confirmation",
		"ComponentLClickUp",
		function(context) return context.string == "button_end_battle" end,
		override_loading_screen,
		false
	)

	bm:register_phase_change_callback(
		"Complete",
		override_loading_screen
	)

	-- button clicks which opens confirmation box
	core:add_listener(
		"skip_end_battle_listener_confirmation_box",
		"ComponentLClickUp",
		function(context) return context.string == "button_quit" end,
		function()
			core:add_listener(
				"skip_end_battle_listener_confirmation_box_accept",
				"ComponentLClickUp",
				function(context)
					return context.string == "button_tick"
				end,
				function(context)
					core:remove_listener("skip_end_battle_listener_confirmation_box_accept")
					core:remove_listener("skip_end_battle_listener_confirmation_box_cancel")
					override_loading_screen()
				end,
				false
			)

			core:add_listener(
				"skip_end_battle_listener_confirmation_box_cancel",
				"ComponentLClickUp",
				function(context)
					return context.string == "button_cancel"
				end,
				function(context)
					core:remove_listener("skip_end_battle_listener_confirmation_box_accept")
					core:remove_listener("skip_end_battle_listener_confirmation_box_cancel")
				end,
				false
			)
		end,
		true
	)
end

function override_loading_screen()
	bm:out("Overriding loading screen");
	common.set_custom_loading_screen_key("troy_main_intro_battle_2_quote_1");
end

function disable_ui_buttons()
	out("disable_ui_buttons")
	local slow_mo = find_uicomponent(core:get_ui_root(), "speed_buttons", "slow_mo")
	if slow_mo then
		slow_mo:SetState("inactive")
	end

	local fwd = find_uicomponent(core:get_ui_root(), "speed_buttons", "fwd")
	if fwd then
		fwd:SetState("inactive")
	end

	local ffwd = find_uicomponent(core:get_ui_root(), "speed_buttons", "ffwd")
	if ffwd then
		ffwd:SetState("inactive")
	end

	local pause = find_uicomponent(core:get_ui_root(), "speed_buttons", "pause")
	if pause then
		pause:SetState("inactive")
	end

	local paused_panel = find_uicomponent(core:get_ui_root(), "deployment_end_sp")
	if paused_panel then
		paused_panel:PropagateVisibility(false)
	end

	local button = find_uicomponent(core:get_ui_root(), "button_battle_start")
	if button then
		button:SetInteractive(false)
		button:PropagateVisibility(false)
	end

end

function disable_unit_buttons()
	out("disable_unit_buttons")
	local button_movespeed = find_uicomponent(core:get_ui_root(), "buttons_holder", "button_movespeed")
	button_movespeed:SetState("inactive")

	local button_melee = find_uicomponent(core:get_ui_root(), "buttons_holder", "button_melee")
	button_melee:SetState("inactive")

	local button_halt = find_uicomponent(core:get_ui_root(), "buttons_holder", "button_halt")
	button_halt:SetState("inactive")

	local button_group = find_uicomponent(core:get_ui_root(), "buttons_holder", "button_group")
	button_group:SetState("inactive")

	local button_guard = find_uicomponent(core:get_ui_root(), "buttons_holder", "button_guard")
	button_guard:SetState("inactive")

	local button_alt_attack = find_uicomponent(core:get_ui_root(), "buttons_holder", "button_alt_attack")
	button_alt_attack:SetState("inactive")

	local button_toggle_formations = find_uicomponent(core:get_ui_root(), "buttons_holder", "button_toggle_formations")
	button_toggle_formations:SetState("inactive")

	local behaviour = find_uicomponent(core:get_ui_root(), "buttons_holder", "behaviour_parent")
	behaviour:PropagateVisibility(false)

	local button_ability1 = find_uicomponent(core:get_ui_root(), "buttons_holder", "button_ability_one")
	button_ability1:SetState("inactive")

	local button_ability2 = find_uicomponent(core:get_ui_root(), "buttons_holder", "button_ability_two")
	button_ability2:SetState("inactive")

	-- local holder = find_uicomponent(core:get_ui_root(), "buttons_holder")
	-- holder:PropagateVisibility(false)
end

function show_guard_button()
	out("show_guard_button")
	local holder = find_uicomponent(core:get_ui_root(), "buttons_holder")
	holder:SetVisible(true)

	local behaviour = find_uicomponent(core:get_ui_root(), "buttons_holder", "behaviour_parent")
	behaviour:PropagateVisibility(false)

	local button_melee = find_uicomponent(core:get_ui_root(), "buttons_holder", "button_melee")
	button_melee:SetState("inactive")
	button_melee:SetVisible(true)

	local button_guard = find_uicomponent(core:get_ui_root(), "buttons_holder", "button_guard")
	button_guard:SetState("active")
	button_guard:SetVisible(true)
end

function show_formation_button()
	local holder = find_uicomponent(core:get_ui_root(), "buttons_holder")
	holder:SetVisible(true)

	local behaviour = find_uicomponent(core:get_ui_root(), "buttons_holder", "behaviour_parent")
	behaviour:PropagateVisibility(false)

	local button_melee = find_uicomponent(core:get_ui_root(), "buttons_holder", "button_melee")
	button_melee:SetState("inactive")
	button_melee:SetVisible(true)

	local button_toggle_formations = find_uicomponent(core:get_ui_root(), "buttons_holder", "button_toggle_formations")
	button_toggle_formations:SetState("active")
	button_toggle_formations:SetVisible(true)
end

function script_units_change_behaviour_active(script_units, behaviour, should_enable)
	for _, unit in pairs(script_units.sunit_list) do
		unit.uc:change_behaviour_active(behaviour, should_enable)
	end;
end

function start_battle()
	show_speed_up_controls(false)
	bm:disable_shortcut("cycle_battle_speed", true)
	bm:disable_shortcut("cycle_battle_speed_back", true)

	-- override_loading_screen();
	override_loading_screen_on_skip_end()
	
	bm:set_close_queue_advice(false)
	show_advisor_progress_buttons(false)
	
	bm:disable_shortcut("show_allied_units_proxies", true)

	disable_ui_buttons()
	disable_unit_buttons()
	bm:callback(function() start_deployment_advice() end, 500)

	local hero_ability_button = core:get_ui_root():SequentialFind("porthole_parent", "ability_parent", "button_slot1", "button_ability1")
	if hero_ability_button then
		hero_ability_button:SetDisabled(true)
	end

	script_units_change_behaviour_active(sunits_enemy_missile, "skirmish", false)
end

function start_deployment_advice()
	sunits_player_all:take_control()

	bm:queue_advisor(
		advisor_texts.first_step.deployment_advice["advice_key" .. (ADVANCED_BATTLE_DEBUG_ENABLED and "_debug" or "")],
		MIN_ADVICE_DURATION_MS,
		ADVANCED_BATTLE_DEBUG_ENABLED,
		function ()
			if #advisor_texts.first_step.deployment_advice.info_text >= 1 then
				bm:add_infotext(unpack(advisor_texts.first_step.deployment_advice.info_text))
			end

			bm:watch(
				function()
					return bm:advice_finished()
				end,
				0,
				function()
					show_advisor_progress_buttons(true);
					highlight_advisor_progress_button(true);
					bm:add_infotext(unpack(advisor_texts.advice_without_obj_complete_infotext))
				end
			);

			-- proceed when the advisor is dismisseds
			core:add_listener(
				"wait_deployment_advice",
				"AdviceDismissed",
				true,
				function()
					highlight_advisor_progress_button(false);
					bm:callback(
						function() 
							show_advisor_progress_buttons(false);
							start_vanguard_deployment_advice()
						end,
						500
					);
				end,
				false
			);
		end,
		0
	)
end

function start_vanguard_deployment_advice()
	sunit_player_javelin_01:highlight_unit_card(false)
	sunits_player_all:take_control()

	bm:queue_advisor(
		advisor_texts.second_step.vanguard_deployment_advice["advice_key" .. (ADVANCED_BATTLE_DEBUG_ENABLED and "_debug" or "")],
		MIN_ADVICE_DURATION_MS,
		ADVANCED_BATTLE_DEBUG_ENABLED,
		function ()
			if #advisor_texts.second_step.vanguard_deployment_advice.info_text >= 1 then
				bm:add_infotext(unpack(advisor_texts.second_step.vanguard_deployment_advice.info_text))
			end

			local archer_01_card = core:get_ui_root():SequentialFind("hud_battle", "battle_orders", "review_DY", "1015", "icon_guerrilla")
			local archer_02_card = core:get_ui_root():SequentialFind("hud_battle", "battle_orders", "review_DY", "1016", "icon_guerrilla")
			local javelin_01_card = core:get_ui_root():SequentialFind("hud_battle", "battle_orders", "review_DY", "1014", "icon_guerrilla")

			archer_01_card:Highlight(true, true, 0)
			archer_02_card:Highlight(true, true, 0)
			javelin_01_card:Highlight(true, true, 0)

			bm:watch(
				function()
					return bm:advice_finished()
				end,
				0,
				function()
					show_advisor_progress_buttons(true);
					highlight_advisor_progress_button(true);
					bm:add_infotext(unpack(advisor_texts.advice_without_obj_complete_infotext))
				end,
				"wait_vanguard_deployment_advice"
			);

			-- proceed when the advisor is dismisseds
			core:add_listener(
				"wait_vanguard_deployment_advice",
				"AdviceDismissed",
				true,
				function()
					highlight_advisor_progress_button(false);
					archer_01_card:Highlight(false, true, 0)
					archer_02_card:Highlight(false, true, 0)
					javelin_01_card:Highlight(false, true, 0)

					bm:remove_process("wait_vanguard_deployment_advice");

					bm:callback(
						function() 
							show_advisor_progress_buttons(false);
							start_javelins_deployment_advice()
						end,
						500
						);
				end,
				false
			);
		end,
		0
	)
end

function start_javelins_deployment_advice()
	sunits_player_all:release_control()

	bm:queue_advisor(advisor_texts.second_step.javelins_deployment_advice["advice_key" .. (ADVANCED_BATTLE_DEBUG_ENABLED and "_debug" or "")], MIN_ADVICE_DURATION_MS, ADVANCED_BATTLE_DEBUG_ENABLED,
		function()
			if #advisor_texts.second_step.javelins_deployment_advice.info_text >= 1 then
				bm:add_infotext(unpack(advisor_texts.second_step.javelins_deployment_advice.info_text))
				bm:callback(function() start_first_javelin_depl() end, 500);
			end
		end
	)
end

function start_first_javelin_depl()
	sunits_player_all:take_control()
	sunit_player_javelin_01:release_control(true)
	sunit_player_javelin_01:highlight_unit_card(true)

	bm:set_locatable_objective(
		advisor_texts.second_step.first_javelin_deployment.objective_key,
		first_javelin_deployment_objective_cam_pos,
		first_javelin_deployment_objective_cam_target,
		2
	);

	bm:camera():move_to(v(-115.239647, 1383.110962, -286.642548), v(-142.15007, 1288.844604, -91.08432), 3.5, false, 0)

	-- show markers
	bm:callback(
		function()
			bm:add_ping_icon(first_javelin_deployment_pin_pos:get_x(), first_javelin_deployment_pin_pos:get_y(), first_javelin_deployment_pin_pos:get_z(), 13, false)
		end,
		1000,
		"javelin_marker_1"
	);

	bm:watch(
		function()
			return javelin_area_1:number_in_area(sunit_player_javelin_01) == 1;
		end,
		0,
		function()
			bm:out("Deployed first javelin in proper area")

			bm:complete_objective(advisor_texts.second_step.first_javelin_deployment.objective_key)
			bm:callback(function() bm:remove_objective(advisor_texts.second_step.first_javelin_deployment.objective_key) end, 500)
			sunit_player_javelin_01:highlight_unit_card(false)
			bm:remove_ping_icon(first_javelin_deployment_pin_pos:get_x(), first_javelin_deployment_pin_pos:get_y(), first_javelin_deployment_pin_pos:get_z())

			bm:callback(start_ack_hidden_status_advice, 100)
		end
	);
end

function start_ack_hidden_status_advice()
	sunits_player_all:take_control()

	bm:queue_advisor(
		advisor_texts.second_step.ack_hidden_status_advice["advice_key" .. (ADVANCED_BATTLE_DEBUG_ENABLED and "_debug" or "")],
		MIN_ADVICE_DURATION_MS,
		ADVANCED_BATTLE_DEBUG_ENABLED,
		function()
			if #advisor_texts.second_step.ack_hidden_status_advice.info_text >= 1 then
				bm:add_infotext(unpack(advisor_texts.second_step.ack_hidden_status_advice.info_text))
			end

			bm:watch(
				function()
					return bm:advice_finished()
				end,
				0,
				function()
					show_advisor_progress_buttons(true);
					highlight_advisor_progress_button(true);
					bm:add_infotext(unpack(advisor_texts.advice_without_obj_complete_infotext))
				end,
				"wait_ack_hidden_status_advice"
			);

			local javelin_01_card = core:get_ui_root():SequentialFind("hud_battle", "battle_orders", "review_DY", "1014", "hidden")

			javelin_01_card:Highlight(true, true, 0)

			show_hidden_units_text_pointer(javelin_01_card)
		
			-- proceed when the advisor is dismisseds
			core:add_listener(
				"ack_hidden_status_advice_dismissed",
				"AdviceDismissed",
				true,
				function()
					highlight_advisor_progress_button(false);
					javelin_01_card:Highlight(false, true, 0)

					bm:remove_process("wait_ack_hidden_status_advice");

					bm:callback(
						function() 
							show_advisor_progress_buttons(false);
							start_army_selection_advice_third_step()
						end,
						500
						);
				end,
				false
			);
		end,
		0
	)
end

function show_hidden_units_text_pointer(javelin_01_card)
	local hidden_icon_tp = text_pointer:new_from_component(
		"hidden_icon_tp",
		"bottom",
		100,
		javelin_01_card,
		0.5,
		-0.5
	)

	hidden_icon_tp:add_component_text("text", hidden_tp_text)
	hidden_icon_tp:set_style("semitransparent")
	hidden_icon_tp:set_topmost(true)
	hidden_icon_tp:set_show_close_button(true)
	hidden_icon_tp:set_hide_on_close_button_clicked()
	hidden_icon_tp:show()
	core:add_listener(
	"advanced_battle_adviser_dismissed", 
		"AdviceDismissed",
		true,
		function(context)
			hidden_icon_tp:hide(true, true)
		end,
		false
	)
end

function show_rage_bar_text_pointer(rage_bar_uic) -- UIC of the ragebar has to be supplied in the expression
	local rage_bar_tp = text_pointer:new_from_component(
		"rage_bar_tp",
		"left",
		100,
		rage_bar_uic, --UIC of the ragebar goes here
		1,
		0.1
	)

	rage_bar_tp:add_component_text("text", rage_tp_text)
	rage_bar_tp:set_style("semitransparent")
	rage_bar_tp:set_topmost(true)
	rage_bar_tp:set_show_close_button(true)
	rage_bar_tp:set_hide_on_close_button_clicked()
	rage_bar_tp:show()
	core:add_listener(						--- this can be tweaked to listen to anything else so we hide the text pointer and not rely solely on the closebutton.
	"advanced_battle_adviser_dismissed", 
		"AdviceDismissed",
		true,
		function(context)
			rage_bar_tp:hide(true, true)
		end,
		false
	)
end

function show_grouping_text_pointer()
	local group_number = find_uicomponent(core:get_ui_root(), "battle_orders", "battle_orders_pane", "card_panel_docker", "cards_panel", "tab_group_under_card", "top_parent", "dy_number")
	local group_number_tp = text_pointer:new_from_component(
		"group_number_tp",
		"bottom",
		100,
		group_number, --UIC of the ragebar goes here
		0.5,
		0
	)

	group_number_tp:add_component_text("text", group_number_tp_text)
	group_number_tp:set_style("semitransparent")
	group_number_tp:set_topmost(true)
	group_number_tp:set_show_close_button(true)
	group_number_tp:set_hide_on_close_button_clicked()
	group_number_tp:show()
	core:add_listener(						--- this can be tweaked to listen to anything else so we hide the text pointer and not rely solely on the closebutton.
	"advanced_battle_adviser_dismissed_2", 
		"AdviceDismissed",
		true,
		function(context)
			group_number_tp:hide(true, true)
		end,
		false
	)
	core:add_listener(
		"group_text_pointer_listener",
		"ComponentLClickUp",
		function(context) return context.string == "button_guard" end,
		function(context) group_number_tp:hide(true, true) end,
		false
	)

end

function show_time_text_pointer()
	local time_controls = find_uicomponent(core:get_ui_root(), "radar_holder", "radar_group", "speed_controls", "speed_buttons", "play")
	local time_controls_tp = text_pointer:new_from_component(
		"time_controls_tp",
		"right",
		100,
		time_controls,
		0,
		0.5
	)

	time_controls_tp:add_component_text("text", time_controls_tp_text)
	time_controls_tp:set_style("semitransparent")
	time_controls_tp:set_topmost(true)
	time_controls_tp:set_show_close_button(true)
	time_controls_tp:set_hide_on_close_button_clicked()
	time_controls_tp:show()
	core:add_listener(						--- this can be tweaked to listen to anything else so we hide the text pointer and not rely solely on the closebutton.
	"advanced_battle_adviser_dismissed_2", 
		"AdviceDismissed",
		true,
		function(context)
			time_controls_tp:hide(true, true)
		end,
		false
	)

end

function show_time_2_text_pointer()
	local time_controls_2 = find_uicomponent(core:get_ui_root(), "radar_holder", "radar_group", "speed_controls", "speed_buttons", "slow_mo")
	local time_controls_2_tp = text_pointer:new_from_component(
		"time_controls_2_tp",
		"right",
		100,
		time_controls_2,
		0,
		0.5
	)

	time_controls_2_tp:add_component_text("text", time_controls_2_tp_text)
	time_controls_2_tp:set_style("semitransparent")
	time_controls_2_tp:set_topmost(true)
	time_controls_2_tp:set_show_close_button(true)
	time_controls_2_tp:set_hide_on_close_button_clicked()
	time_controls_2_tp:show()
	core:add_listener(						--- this can be tweaked to listen to anything else so we hide the text pointer and not rely solely on the closebutton.
	"advanced_battle_adviser_dismissed_2", 
		"AdviceDismissed",
		true,
		function(context)
			time_controls_2_tp:hide(true, true)
		end,
		false
	)

end

function start_army_selection_advice_third_step()
	local cam = bm:camera();
	local cam_pos = cam:position();
	local cam_targ = cam:target();

	local sa = intro_battle_selection_advice:new(
		advisor_texts.third_step.army_selection_advice["advice_key" .. (ADVANCED_BATTLE_DEBUG_ENABLED and "_debug" or "")],
		v(-33.31332, 1377.125732, -331.554352),
		v(-21.404419, 1312.215698, -125.424026),
		suints_player_non_javelins,
		advisor_texts.third_step.army_selection_advice.objective_key,
		function()
			buim:enable_selection_change(false)
			suints_player_rest:highlight_unit_cards(false, nil ,true)
			bm:callback(function()
					bm:clear_infotext()
					start_group_units_advice() 
				end, 
				500
			)
		end,
		0
	)
	sa.is_debug_enabled = ADVANCED_BATTLE_DEBUG_ENABLED

	for i = 1, #advisor_texts.third_step.army_selection_advice.info_text do
		sa:add_infotext(advisor_texts.third_step.army_selection_advice.info_text[i])
	end

	sa:set_all_player_sunits(sunits_player_all)
	sa:set_should_enable_unit_cards(false)
	sa:set_should_disable_camera(true)
	-- sa:set_enable_orders_on_end(true)
	sa:set_disable_orders_on_end(true)
	suints_player_non_javelins:highlight_unit_cards(true, nil ,true)
	append_selection_controls_to_cheat_sheet()
	sa:start();
end

function start_group_units_advice()
	suints_player_non_javelins:highlight_unit_cards(false, nil ,true)

	bm:queue_advisor(
		advisor_texts.third_step.group_units_advice["advice_key" .. (ADVANCED_BATTLE_DEBUG_ENABLED and "_debug" or "")], 
		MIN_ADVICE_DURATION_MS, 
		ADVANCED_BATTLE_DEBUG_ENABLED,
		function()
			bm:set_objective(advisor_texts.third_step.group_units_advice.objective_key)
			bm:camera():move_to(v(-33.31332, 1377.125732, -331.554352), v(-21.404419, 1312.215698, -125.424026), 3.5, false, 0)

			if #advisor_texts.third_step.group_units_advice.info_text >= 1 then
				bm:add_infotext(unpack(advisor_texts.third_step.group_units_advice.info_text))
			end

			local button_group = find_uicomponent(core:get_ui_root(), "button_group")
			local button_group_priority = button_group:Priority()

			-- If the player selects the units and very quickly presses Ctrl + G, the tutorial will freeze until you remove the grouping
			if string.find(button_group:CurrentState(), "selected") then
				bm:callback(function()
						bm:remove_objective(advisor_texts.third_step.group_units_advice.objective_key)
						bm:clear_infotext()
						bm:stop_advisor_queue()
						wait_initiate_battle()
					end, 
					500
				)

				return
			end

			bm:callback(function()
					button_group:PropagatePriority(1000)
					button_group:LockPriority(1000, false)
					button_group:SetInteractive(false)
					bm:disable_orders(false)
				end, 
				500
			)

			core:add_listener(
				"ToggleLockedGroupKeyListener",
				"ShortcutPressed",
				function(context) return context.string == "toggle_locked_group" end,
				function(context)
					bm:complete_objective(advisor_texts.third_step.group_units_advice.objective_key)
					bm:callback(
						function() 
							bm:remove_objective(advisor_texts.third_step.group_units_advice.objective_key)
							bm:clear_infotext()
							bm:stop_advisor_queue()

							bm:watch(
								function()
									return bm:advice_finished()
								end,
								0,
								function()
									start_guard_mode_objective()
								end,
								"wait_group_units_advice"
							)
						end, 
						500
					)

					bm:disable_orders(true)
					button_group:PropagatePriority(button_group_priority)
					button_group:UnLockPriority()
					button_group:SetInteractive(true)
				end,
				false
			)
		end
	)
end

function start_guard_mode_objective()
	-- sunits_player_javelins:take_control()

	bm:queue_advisor(
		advisor_texts.fourth_step.activate_guard_mode["advice_key" .. (ADVANCED_BATTLE_DEBUG_ENABLED and "_debug" or "")], 
		MIN_ADVICE_DURATION_MS, 
		ADVANCED_BATTLE_DEBUG_ENABLED,
		function()
			bm:set_objective(advisor_texts.fourth_step.activate_guard_mode.objective_key)
			bm:camera():move_to(v(-33.31332, 1377.125732, -331.554352), v(-21.404419, 1312.215698, -125.424026), 3.5, false, 0)

			if #advisor_texts.fourth_step.activate_guard_mode.info_text >= 1 then
				bm:add_infotext(unpack(advisor_texts.fourth_step.activate_guard_mode.info_text))
			end

			local guard_button = find_uicomponent(core:get_ui_root(), "button_guard")
			local guard_button_priority = guard_button:Priority()
			guard_button:Highlight(true, true, 0)
			pulse_uicomponent(guard_button, true)
			show_guard_button()
			show_grouping_text_pointer()
			bm:callback(function()
					guard_button:PropagatePriority(1000)
					guard_button:LockPriority(1000, false)
					bm:disable_orders(false)
				end, 
				500
			)

			local guard_mode_activated = function(context)
				core:remove_listener("ToggleGuardModeButtonLClickListener")
				core:remove_listener("ToggleGuardModeKeyListener")

				bm:complete_objective(advisor_texts.fourth_step.activate_guard_mode.objective_key)
				bm:remove_objective(advisor_texts.fourth_step.activate_guard_mode.objective_key)
				bm:stop_advisor_queue()
				bm:callback(function() bm:clear_infotext() end, 500)

				local guard_button = find_uicomponent(core:get_ui_root(), "button_guard")
				guard_button:Highlight(false, false, 0)
				pulse_uicomponent(guard_button, false)

				bm:watch(
					function()
						return bm:advice_finished()
					end,
					0,
					function()
						guard_button:PropagatePriority(guard_button_priority)
						guard_button:UnLockPriority()
						bm:disable_orders(true)
						start_guard_mode_advice()
					end,
					"wait_guard_mode_objective"
				)
			end

			core:add_listener(
				"ToggleGuardModeButtonLClickListener",
				"ComponentLClickUp",
				function(context) return context.string == "button_guard" end,
				guard_mode_activated,
				false
			)

			core:add_listener(
				"ToggleGuardModeKeyListener",
				"ShortcutPressed",
				function(context) return context.string == "battle_land_toggle_guard" end,
				guard_mode_activated,
				false
			)
		end
	)
end

function start_guard_mode_advice()
	-- sunits_player_all:take_control()

	bm:queue_advisor(
		advisor_texts.fourth_step.guard_mode_advice["advice_key" .. (ADVANCED_BATTLE_DEBUG_ENABLED and "_debug" or "")],
		MIN_ADVICE_DURATION_MS,
		ADVANCED_BATTLE_DEBUG_ENABLED,
		function ()
			if #advisor_texts.fourth_step.guard_mode_advice.info_text >= 1 then
				bm:add_infotext(unpack(advisor_texts.fourth_step.guard_mode_advice.info_text))
			end

			bm:watch(
				function()
					return bm:advice_finished()
				end,
				0,
				function()
					wait_initiate_battle()
				end,
				"wait_guard_mode_advice"
			);
		end,
		0
	)
end

function wait_initiate_battle()
	bm:queue_advisor(
		advisor_texts.third_step.initiate_battle_advice["advice_key" .. (ADVANCED_BATTLE_DEBUG_ENABLED and "_debug" or "")], 
		MIN_ADVICE_DURATION_MS, 
		ADVANCED_BATTLE_DEBUG_ENABLED,
		function()
			buim:enable_selection_change(true)
			buim:deselect_all()

			if #advisor_texts.third_step.initiate_battle_advice.info_text >= 1 then
				bm:add_infotext(unpack(advisor_texts.third_step.initiate_battle_advice.info_text))
			end

			local button = find_uicomponent(core:get_ui_root(), "button_battle_start")
			local start_button_panel = find_uicomponent(core:get_ui_root(), "deployment_end_sp")
			local old_button = find_uicomponent(start_button_panel, "button_battle_start_dark")
			local dark_button = find_uicomponent(start_button_panel, "button_battle_start_old")

			start_button_panel:PropagateVisibility(true)
			old_button:PropagateVisibility(false)
			dark_button:PropagateVisibility(false)
			button:Highlight(true, true, 0)
			button:SetInteractive(true)
			button:PropagateVisibility(true)
			pulse_uicomponent(button, true)
			show_time_text_pointer()
		end
	)
end

enemy_ai_planner = script_ai_planner:new("enemy_ai_planner", sunits_enemy_start, true)

bm:register_phase_change_callback(
	"Deployed",
	function()
		bm:out('STARTING BATTLE')
		local button = find_uicomponent(core:get_ui_root(), "button_battle_start")
		button:Highlight(false, false, 0)
		pulse_uicomponent(button, false)
		uc_enemy_01_all:take_control()
		uc_enemy_01_all:halt()
		uc_enemy_01_all:set_invisible_to_all(false)

		bm:stop_advisor_queue();
		bm:clear_infotext();

		play_guard_mode_cutscene()
	end
)

function start_army_selection_advice_advice()
		bm:disable_orders(false)
		local cam = bm:camera();
		local cam_pos = cam:position();
		local cam_targ = cam:target();

		local sa = intro_battle_selection_advice:new(
			advisor_texts.fourth_step.army_selection_advice["advice_key" .. (ADVANCED_BATTLE_DEBUG_ENABLED and "_debug" or "")],
			v(-33.31332, 1377.125732, -331.554352),
			v(-21.404419, 1312.215698, -125.424026),
			suints_player_non_javelins,
			advisor_texts.fourth_step.army_selection_advice.objective_key,
			function()
				suints_player_rest:highlight_unit_cards(false, nil ,true)
				bm:callback(function()
						bm:clear_infotext()
						wait_army_selection_advice()
					end,
					500
				)
			end
		)
		sa.is_debug_enabled = ADVANCED_BATTLE_DEBUG_ENABLED

		if #advisor_texts.fourth_step.army_selection_advice.info_text >= 1 then
			sa:add_infotext(unpack(advisor_texts.fourth_step.army_selection_advice.info_text))
		end

		sa:set_all_player_sunits(suints_player_rest)
		sa:set_should_enable_unit_cards(false)
		sa:set_should_disable_camera(true)
		sa:set_enable_orders_on_end(true)
		suints_player_non_javelins:highlight_unit_cards(true, nil ,true)
		sa:start();
end

function wait_army_selection_advice()
	bm:watch(
		function()
			return bm:advice_finished()
		end,
		0,
		function()
			suints_player_non_javelins:highlight_unit_cards(false, nil ,true)
			start_advance_army_advice()
		end,
		"wait_army_selection"
	)
end

function start_advance_army_advice()
	-- sunits_player_all:release_control()
	-- sunits_player_javelins:take_control()
	
	local ma = intro_battle_movement_advice:new(
		advisor_texts.fourth_step.advance_army["advice_key" .. (ADVANCED_BATTLE_DEBUG_ENABLED and "_debug" or "")],
		advance_army_pos,
		suints_player_non_javelins,
		advisor_texts.fourth_step.advance_army.objective_key,
		function()
			-- enemy_ai_planner:defend_position(v(-17, 66, -18.3), 90)
			bm:clear_infotext()

			bm:watch(
				function()
					return bm:advice_finished()
				end,
				0,
				function()
					bm:callback(
						function()
							initiate_flanking_advice()
						end,
						500
					)
				end,
				"wait_advance_army_advice"
			);
		end
	)
	ma.is_debug_enabled = ADVANCED_BATTLE_DEBUG_ENABLED
	
	ma:set_allow_orders_on_advice_delivery(true)
	ma:set_prevent_orders_after_movement(false)
	--ma:set_should_disable_camera(true);
	ma:set_advisor_delay(500)
	ma:set_end_on_marker_reached(true)
	ma:set_remove_marker_on_end(true)
	
	if #advisor_texts.fourth_step.advance_army.info_text >= 1 then
		ma:add_infotext(unpack(advisor_texts.fourth_step.advance_army.info_text))
	end

	ma:start()
	bm:callback(function() append_movement_controls_to_cheat_sheet() end, 500);

	suints_player_non_javelins:cache_location()
	bm:watch(
		function()
			return suints_player_non_javelins:have_any_moved(nil, 3)
		end,
		0,
		function()
			buim:deselect_all()
			bm:disable_orders(true);
			bm:callback(
				function()
					suints_player_non_javelins:goto_start_location_offset(0, 140, true, nil, true)
				end,
				100,
				"units_interrupt_watch"
			)
		end,
		"ensure_units_are_moving_to_position"
	)
end

function initiate_flanking_advice()
	bm:remove_process("units_interrupt_watch")
	sunit_player_javelin_01:release_control()
	sunit_player_javelin_01:highlight_unit_card(true, nil ,true)
	buim:deselect_all()
	bm:disable_orders(false);

	bm:camera():move_to(v(-168.331039, 1388.440063, -214.617142), v(-152.275482, 1307.996094, -6.474731), 4, false, 0)

	local ma = intro_battle_movement_advice:new(
		advisor_texts.fifth_step.flanking_advice.advice_key,
		javelins_flank_left_ping_pos,
		sunits_player_javelins,
		advisor_texts.fifth_step.flanking_advice.objective_key,
		function()
			bm:callback(monitor_for_javelin_combat, 3000) 
		end
	)
	
	ma:set_allow_orders_on_advice_delivery(true)
	ma:set_prevent_orders_after_movement(false)
	--ma:set_should_disable_camera(true);
	ma:set_advisor_delay(500)
	ma:set_end_on_marker_reached(true)
	ma:set_remove_marker_on_end(true)
	
	if #advisor_texts.fifth_step.flanking_advice.javelin_1_infotext >= 1 then
		ma:add_infotext(unpack(advisor_texts.fifth_step.flanking_advice.javelin_1_infotext))
	end
	
	ma:start()

	sunit_player_javelin_01:cache_location()

	bm:watch(
		function()
			return sunit_player_javelin_01:has_moved()
		end,
		0,
		function()
			bm:repeat_callback(
				function()
					-- this takes control of the unit
					sunit_player_javelin_01.uc:goto_location(javelins_flank_left_ping_pos, true)
				end,
				100,
				"javelin_one_interrupt_watch"
			)

			bm:callback(function() uc_enemy_01_all:release_control() end, 2500)
			bm:callback(bring_enemy_units, 200)
		end,
		"ensure_javelins_are_moving_to_position"
	)
end

function bring_enemy_units()
	sunits_enemy_start:attack_enemy_scriptunits(suints_player_non_javelins, true)
	bm:callback(function() suints_player_non_javelins:release_control() end, 100)

	for i = 1, sunits_player_all:count() do
		local sunit = sunits_player_all:item(i)
		sunit:morale_behavior_fearless()
	end

	sunit_player_javelin_01:max_casualties(0.7, true)

	start_kill_aura_watch()
end

function start_kill_aura_watch()
	bm:watch(
		function()
			return sunits_player_all:is_under_attack()
		end,
		100,
		function()
			sunits_player_all:start_kill_aura(sunits_enemy_start, 40, 0.02)
		end,
		"kill_aura_watch"
	)
end

function monitor_for_javelin_combat()
	bm:remove_process("javelin_one_interrupt_watch")
	bm:queue_advisor(
		advisor_texts.fifth_step.attack_enemy_advice["advice_key" .. (ADVANCED_BATTLE_DEBUG_ENABLED and "_debug" or "")],
		MIN_ADVICE_DURATION_MS,
		ADVANCED_BATTLE_DEBUG_ENABLED,
		function()
			if #advisor_texts.fifth_step.attack_enemy_advice.info_text >= 1 then
				bm:add_infotext(unpack(advisor_texts.fifth_step.attack_enemy_advice.info_text))
			end

			bm:set_locatable_objective(
				advisor_texts.fifth_step.attack_enemy_advice.objective_key,
				javelins_combat_cam_pos,
				javelins_combat_cam_target,
				2
			);

			sunits_player_javelins:release_control()

			bm:out("MONITOR FOR CHARIOT COMBAT!!!")
			bm:watch(
				function()
					return sunits_player_javelins:are_all_firing_missiles()
				end,
				0,
				function()
					bm:remove_process("javelin_flanking_combat")

					bm:complete_objective(advisor_texts.fifth_step.attack_enemy_advice.objective_key)
					bm:remove_objective(advisor_texts.fifth_step.attack_enemy_advice.objective_key)
					bm:stop_advisor_queue()
					bm:clear_infotext()

					sunits_player_javelins:highlight_unit_cards(false, nil ,true)

					bm:watch(
						function()
							return bm:advice_finished()
						end,
						0,
						function()
							highlight_advisor_progress_button(false)
							show_morale_penalty_advice()
						end,
						"wait_javelin_combat"
					);
				end,
				"javelin_flanking_combat"
			);
		end
	)
end

function show_morale_penalty_advice()
	bm:out('MORALE PENALTY ADVICE')
	bm:queue_advisor(
		advisor_texts.fifth_step.morale_penalty_advice["advice_key" .. (ADVANCED_BATTLE_DEBUG_ENABLED and "_debug" or "")],
		MIN_ADVICE_DURATION_MS,
		ADVANCED_BATTLE_DEBUG_ENABLED,
		function()
			if #advisor_texts.fifth_step.morale_penalty_advice.info_text >= 1 then
				bm:add_infotext(unpack(advisor_texts.fifth_step.morale_penalty_advice.info_text))
			end
			bm:watch(
				function()
					return bm:advice_finished()
				end,
				0,
				function()
					bm:callback(
						function()
							start_hero_selection_advice()
						end,
						500
					);
					bm:callback(
						function()
							show_time_2_text_pointer()
						end,
						5000
					);
				end,
				"wait_morale_advice"
			);
		end,
		0
	)
end

function start_hero_selection_advice()
	local cam = bm:camera();
	local cam_pos = cam:position();
	local cam_targ = cam:target();

	local sa = intro_battle_selection_advice:new(
		advisor_texts.sixth_step.select_hero_advice["advice_key" .. (ADVANCED_BATTLE_DEBUG_ENABLED and "_debug" or "")],
		v_offset(sunit_player_general.unit:position(), -4.5, 14, -21),
		v_offset(sunit_player_general.unit:position(), -3.5, 13, -17),
		sunits_player_general,
		advisor_texts.sixth_step.select_hero_advice.objective_key,
		function() 
			bm:clear_infotext()
			local hero_ability_button = core:get_ui_root():SequentialFind("porthole_parent", "ability_parent", "button_slot1", "button_ability1")
			hero_ability_button:SetDisabled(true)

			bm:watch(
				function()
					return bm:advice_finished()
				end,
				0,
				function()
					start_special_ability_advice() 
				end,
				"wait_hero_selection_advice"
			);
		end
	)
	sa.is_debug_enabled = ADVANCED_BATTLE_DEBUG_ENABLED
	
	if #advisor_texts.sixth_step.select_hero_advice.info_text >= 1 then
		sa:add_infotext(unpack(advisor_texts.sixth_step.select_hero_advice.info_text))
	end
	
	-- sa:set_all_player_sunits(sunits_player_all)
	sa:set_all_player_sunits(sunits_player_general) -- this will prevent the script from taking control of other units. There is a bug with groups and taking control of units.
	sa:set_should_enable_unit_cards(false)
	sa:set_should_disable_camera(false)
	sa:set_enable_orders_on_end(true)
	sa:set_marker_position(v_offset(sunit_player_general.unit:position(), 0, 2, 0))
	sunit_player_general:highlight_unit_card(true)
	sa:start();
	bm:callback(function() bm:modify_battle_speed(0.5) end, sa.camera_pan_duration)
end

function start_special_ability_advice()
	bm:queue_advisor(
		advisor_texts.sixth_step.special_ability_advice["advice_key" .. (ADVANCED_BATTLE_DEBUG_ENABLED and "_debug" or "")],
		MIN_ADVICE_DURATION_MS,
		ADVANCED_BATTLE_DEBUG_ENABLED,
		function()
			local hero_ability_button = core:get_ui_root():SequentialFind("porthole_parent", "ability_parent", "button_slot1", "button_ability1")
			hero_ability_button:SetDisabled(false)
			pulse_uicomponent(hero_ability_button, true, 9)
			hero_ability_button:Highlight(true, false, 0)

			if #advisor_texts.sixth_step.special_ability_advice.info_text >= 1 then
				bm:add_infotext(unpack(advisor_texts.sixth_step.special_ability_advice.info_text))
			end

			bm:set_objective(
				advisor_texts.sixth_step.special_ability_advice.objective_key
			);

			local uic_rage_bar = core:get_ui_root():SequentialFind("hud_battle", "rage_bar")
			if uic_rage_bar then
				show_rage_bar_text_pointer(uic_rage_bar)
			end

			core:add_listener(
				"HeroUsedSpecialAbility",
				"BattleSpecialAbilityDispatched",
				function(context) return context.ability_key == "troy_main_hero_defender_ability_care_for_fallen_spec_heal" end,
				function(context)
					bm:restore_battle_speed()

					bm:complete_objective(advisor_texts.sixth_step.special_ability_advice.objective_key)
					bm:remove_objective(advisor_texts.sixth_step.special_ability_advice.objective_key)
					bm:stop_advisor_queue()
					bm:clear_infotext()

					local hero_ability_button = core:get_ui_root():SequentialFind("porthole_parent", "ability_parent", "button_slot1", "button_ability1")
					pulse_uicomponent(hero_ability_button, false, 9)
					hero_ability_button:Highlight(false, false, 0)

					bm:watch(
						function()
							return bm:advice_finished()
						end,
						0,
						function()
							start_win_battle_advice()
						end,
						"wait_abilities_advice"
					);
				end,
				false
			)
		end
	)
end

function start_win_battle_advice()
	bm:queue_advisor(
		advisor_texts.seventh_step.win_battle_advice["advice_key" .. (ADVANCED_BATTLE_DEBUG_ENABLED and "_debug" or "")],
		MIN_ADVICE_DURATION_MS,
		ADVANCED_BATTLE_DEBUG_ENABLED,
		function ()
			if #advisor_texts.seventh_step.win_battle_advice.info_text >= 1 then
				bm:add_infotext(unpack(advisor_texts.seventh_step.win_battle_advice.info_text))
			end

			bm:watch(
				function()
					return bm:advice_finished()
				end,
				0,
				function()
					bm:stop_advisor_queue(true);
					monitor_for_routing()
				end,
				"wait_win_battle_advice"
			);
		end,
		0
	)
end

function monitor_for_routing()
	-- -- make the player's units vulnerable to damage if they are spread out (i.e. the player has engaged piecemeal)
	-- make_army_vulnerable_if_separated(
	-- 	sunits_player_start,			-- player's sunits
	-- 	sunits_enemy_start, 			-- enemy sunits
	-- 	50,								-- threshold distance
	-- 	0.7,							-- max number of casualties the player's forces can take when all are close to enemy
	-- 	30000							-- also begin to kill the enemy units over this amount of time if the player's forces are together
	-- );
	 
	local ra = intro_battle_routing_advice:new(
		sunits_player_all,
		sunits_enemy_start,
		advisor_texts.seventh_step.acknowledge_victory_advice["enemy_routs_advice" .. (ADVANCED_BATTLE_DEBUG_ENABLED and "_debug" or "")], -- advice for if enemy units start to rout
		advisor_texts.seventh_step.acknowledge_victory_advice["player_routs_advice" .. (ADVANCED_BATTLE_DEBUG_ENABLED and "_debug" or "")], -- advice for if the players units start to rout
		function() sunits_player_all:release_control() end,		-- function to call when all enemy sunits rout
		function() end			-- function that routs the player army (over time)		
	);
	ra.is_debug_enabled = ADVANCED_BATTLE_DEBUG_ENABLED

	if #advisor_texts.seventh_step.acknowledge_victory_advice.enemy_info_text >= 1 then
		ra:add_enemy_routs_infotext(1, unpack(advisor_texts.seventh_step.acknowledge_victory_advice.enemy_info_text))
	end
	
	if #advisor_texts.seventh_step.acknowledge_victory_advice.player_info_text >= 1 then
		ra:add_player_routs_infotext(1, unpack(advisor_texts.seventh_step.acknowledge_victory_advice.player_info_text))
	end
	
	ra:set_enemy_units_routing_treshold(sunits_enemy_start:count())
	ra:set_player_units_routing_treshold(10000)
	
	ra:start();
end
