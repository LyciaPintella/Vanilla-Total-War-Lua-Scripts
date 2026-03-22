out("phar_main_ramesses_tutorial_5 loaded")

t5_listeners_triggered = 
{
	happiness_building_constructed = cm:get_saved_value("happiness_building_constructed"),
}

tut.happiness_building_chain = "phar_main_happiness_type_b"
tut.happiness_objective_chain = "increase_happiness"
tut.happiness_building_in_construction = false

--------------------------------------------------------------------------------------------------
-- CHECKPOINT 500: start of turn 5
--------------------------------------------------------------------------------------------------

local checkpoint_500_str = "5 " .. common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_start")

cm:add_checkpoint( 
	500,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		core:progress_on_loading_screen_dismissed(t5_turn_start)
	end,
	false,													-- call function when checkpoint reached
	checkpoint_500_str										-- opt string name
)


cm:add_checkpoint_setup_callback(
	500,														-- checkpoint id to add setup callback
	function(is_loading_game, checkpoint_id)				-- setup function
		t5_unlock_overrides()
		t5_allow_management_buildings()
	end,
	false													-- call function when checkpoint reached
)

	
function t5_start_listener()
	core:add_listener(
		"FTUE_FactionTurnStart_5",
		"FactionTurnStart",
		function(context) return context:faction():name() == tut.player_faction_key and cm:turn_number() == 5 end,
		function(context)
			cm:checkpoint_reached(
				500,														-- checkpoint id
				function()												-- post-update callback
					t5_unlock_overrides()
					t5_allow_management_buildings()
					t5_turn_start()
					cm:fade_scene(0, 1)
				end,
				tut.SHOULD_SAVE_EVERY_CHECKPOINT_START_END,				-- should save game
				tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or true				-- always generate named savegame, rather than autosaving
			)
		end
	)
end

function t5_unlock_overrides()
	cm:set_saved_value("unlock_hide_faction_widget_buttons", true)
	uim:override("hide_province_info_panel"):unlock()
	--Also allow some battle options, since the player is free to roam now
	uim:override("maintain_siege"):unlock()
	uim:override("hide_pre_battle_retreat"):unlock()
	uim:override("diplomacy"):unlock()

	tut_set_skip_faction_turns(tut.buhen_faction_key, false)
	tut_set_skip_faction_turns(tut.kawa_faction_key, false)
	tut_set_skip_faction_turns(tut.mes_faction_key, false)
	
	local visible_regions_table = {"phar_main_memphis_memphis", "phar_main_heliopolis_heliopolis", "phar_main_memphis_helwan"}
	cm:make_regions_visible_in_shroud_for_faction(cm:get_local_faction_name(), visible_regions_table)
end

function t5_allow_management_buildings()
	--tut_skip_sukhot_faction_turns(true)
	uim:override("diplomacy"):unlock()
	uim:override("faction_button"):unlock()

	cm:restrict_building_chains_for_faction(
		tut.player_faction_key,
		{
			tut.happiness_building_chain,
			"phar_main_growth_type_b"
		},
		false
	)
end

function t5_turn_start()
	uim:override("army_panel_visible"):lock()

	cm:disable_movement_for_faction(tut.player_faction_key)
	cm:clear_infotext()
	lock_end_turn()
	-- Disable player action here
	--cm:set_camera_position(438.272614, 736.308105, 14.13, -0.195453, 5.660384)
	--cm:set_camera_position(402.839874, 728.70343, 16.35038, -0.249755, 10.042378)

	--Sukkoti general waiving fist composite scene
	-- local sukkot_hero_5 = cm:get_character_by_fm_cqi(tut.sukkot_hero_5_fm_cqi)
	-- local sukkot_hero_5_x = sukkot_hero_5:logical_position_x()
	-- local sukkot_hero_5_y = sukkot_hero_5:logical_position_y()
	-- local sukkot_hero_5_lookup = cm:char_lookup_str(sukkot_hero_5)
	-- cm:character_forced_invisible(sukkot_hero_5_lookup, true)

	-- cm:add_scripted_composite_scene_to_logical_position(
	-- 	"empty_threats_csc",
	-- 	"phar_main_empty_threats",
	-- 	sukkot_hero_5_x,
	-- 	sukkot_hero_5_y,
	-- 	sukkot_hero_5_x,
	-- 	sukkot_hero_5_y,
	-- 	false,
	-- 	true,
	-- 	true,
	-- 	-1.70
	-- )

	--Merneptah composite scene
	local merneptah = cm:get_faction(tut.merneptah_faction_key):faction_leader()
	local merneptah_x = merneptah:logical_position_x()
	local merneptah_y = merneptah:logical_position_y()
	local merneptah_lookup = cm:char_lookup_str(merneptah)
	cm:character_forced_invisible(merneptah_lookup, true)
	-- cm:add_scripted_composite_scene_to_logical_position(
	-- 	"merneptah_showcase_csc",
	-- 	"phar_main_merneptah_showcase",
	-- 	merneptah_x,
	-- 	merneptah_y,
	-- 	merneptah_x,
	-- 	merneptah_y,
	-- 	false,
	-- 	true,
	-- 	true,
	-- 	-1.70
	-- )

	--Pi-Ramesses composite scene
	local pi_ramesses = cm:get_faction(tut.pi_ramesses_faction_key):faction_leader()
	local pi_ramesses_x = pi_ramesses:logical_position_x()
	local pi_ramesses_y = pi_ramesses:logical_position_y()
	local pi_ramesses_lookup = cm:char_lookup_str(pi_ramesses)
	cm:character_forced_invisible(pi_ramesses_lookup, true)
	cm:add_scripted_composite_scene_to_logical_position(
		"pi_ramesses_showcase_csc",
		"phar_main_pi_ramesses_showcase",
		pi_ramesses_x,
		pi_ramesses_y,
		pi_ramesses_x,
		pi_ramesses_y,
		false,
		true,
		true,
		pi_ramesses:bearing()
	)
	
	local tutorial_turn_5_cutscene_offset = {}	--in seconds
	tutorial_turn_5_cutscene_offset[1] = 2
	tutorial_turn_5_cutscene_offset[2] = tutorial_turn_5_cutscene_offset[1] + 15.8
	tutorial_turn_5_cutscene_offset[3] = tutorial_turn_5_cutscene_offset[2] + 4
	tutorial_turn_5_cutscene_offset[4] = tutorial_turn_5_cutscene_offset[3] + 12.3
	tutorial_turn_5_cutscene_offset[5] = tutorial_turn_5_cutscene_offset[4] + 0.5
	tutorial_turn_5_cutscene_offset[6] = tutorial_turn_5_cutscene_offset[5] + 10.6
	tutorial_turn_5_cutscene_offset[7] = tutorial_turn_5_cutscene_offset[6] + 3.4

	local merneptah_cutscene = campaign_cutscene:new(
		"merneptah_cutscene",
		tutorial_turn_5_cutscene_offset[7] + 2,
		function()
			cm:fade_scene(1, 1)
			cm:callback(
				function()
					t5_province_management_start()
				end,
				5
			)
			cm:remove_scripted_composite_scene("empty_threats_csc")
			cm:remove_scripted_composite_scene("merneptah_showcase_csc")
			cm:remove_scripted_composite_scene("pi_ramesses_showcase_csc")

			--cm:character_forced_invisible(sukkot_hero_5_lookup, false)
			cm:character_forced_invisible(merneptah_lookup, false)
			cm:character_forced_invisible(pi_ramesses_lookup, false)
			uim:override("settlement_labels"):unlock()
			uim:override("army_panel_visible"):unlock()
		end
	)

	
	--merneptah_cutscene:set_debug();
	merneptah_cutscene:set_skippable(false)
	merneptah_cutscene:set_disable_settlement_labels(true)
	merneptah_cutscene:set_dismiss_advice_on_end(false)
	merneptah_cutscene:set_restore_shroud(true)

	merneptah_cutscene:action(
		function()
			cm:make_regions_visible_in_shroud_for_faction(cm:get_local_faction_name(), {
				"phar_main_memphis_memphis",
				"phar_main_memphis_petpeh",
				"phar_main_memphis_helwan",
				"phar_main_heliopolis_heliopolis",
				"phar_main_heliopolis_qes",
				"phar_main_rhacotis_qema",
				"phar_main_faiyum_khem",
				"phar_main_sea_nile",
				"phar_main_sea_nile_delta",
				"phar_main_pi_ramesses_per_amun",
				"phar_main_pi_ramesses_pi_ramesses",
				"phar_main_pi_ramesses_tjaru",
				"phar_main_north_sinai_nekhel",
				"phar_main_north_sinai_sukkot",
				"phar_main_buto_sais",
				"phar_main_buto_paiuenamun",
				"phar_main_buto_buto",
			})
		end,
		0
	)
	merneptah_cutscene:action(
		function()
			merneptah_cutscene:cindy_playback("script/campaign/phar_combi/factions/phar_camp_tutorial/scenes/phar_camp_tutorial_sq05.CindyScene", 0.5, 2);
		end,
		1
	)
	merneptah_cutscene:action(
		function()
			cm:fade_scene(1, 1)
			cm:show_advice(
				tut.advisor_texts.turn_5.v2_enemy_born_mern.advice_key,
				true,
				false,
				function()
					merneptah_cutscene:dismiss_advice()
				end,
				tut.ADVICE_DURATION_S
			)
			merneptah_cutscene:wait_for_advisor()
		end,
		tutorial_turn_5_cutscene_offset[1]
	)
	merneptah_cutscene:action(
		function()
			cm:show_advice(
				tut.advisor_texts.turn_5.v2_no_trust_mern.advice_key,
				false,
				false,
				function()
					merneptah_cutscene:dismiss_advice()
				end,
				tut.ADVICE_DURATION_S
			)
		end,
		tutorial_turn_5_cutscene_offset[2]
	)
	merneptah_cutscene:action(
		function()
			merneptah_cutscene:wait_for_advisor()
			cm:remove_scripted_composite_scene("pi_ramesses_showcase_csc")
		end,
		tutorial_turn_5_cutscene_offset[3]
	)
	merneptah_cutscene:action(
		function()
			cm:show_advice(
				tut.advisor_texts.turn_5.v2_pi_ramesses_mern.advice_key,
				true,
				false,
				function()
					merneptah_cutscene:dismiss_advice()
				end,
				tut.ADVICE_DURATION_S + 2
			)
		end,
		tutorial_turn_5_cutscene_offset[4]
	)
	merneptah_cutscene:action(
		function()
			--merneptah_cutscene:wait_for_advisor()
			cm:add_scripted_composite_scene_to_logical_position(
				"pi_ramesses_showcase_csc",
				"phar_main_pi_ramesses_showcase",
				pi_ramesses_x,
				pi_ramesses_y,
				pi_ramesses_x,
				pi_ramesses_y,
				false,
				true,
				true,
				pi_ramesses:bearing()
			)
		end,
		tutorial_turn_5_cutscene_offset[5]
	)
	merneptah_cutscene:action(
		function()
			cm:show_advice(
				tut.advisor_texts.turn_5.v2_worry_mern.advice_key,
				true,
				false,
				function()
					merneptah_cutscene:dismiss_advice()
				end,
				tut.ADVICE_DURATION_S + 2
			)
			merneptah_cutscene:wait_for_advisor()
		end,
		tutorial_turn_5_cutscene_offset[6]
	)
	merneptah_cutscene:action(
		function()
			cm:show_advice(
				tut.advisor_texts.turn_5.v2_worry_not_ram.advice_key,
				true,
				false,
				function()
					merneptah_cutscene:dismiss_advice()
				end,
				tut.ADVICE_DURATION_S + 2
			)
		end,
		tutorial_turn_5_cutscene_offset[7]
	)
	merneptah_cutscene:start()

	core:add_listener(
		"FTUE_happiness_building_construction_started_prematurely",
		"BuildingConstructionStarted",
		function(context) return context:building_chain() == tut.happiness_building_chain end,
		function(context)
			tut.happiness_building_in_construction = true
		end,
		true
	)
	core:add_listener(
		"FTUE_happiness_building_construction_canceled_prematurely",
		"BuildingConstructionCanceled",
		function(context) return context:building_chain() == tut.happiness_building_chain end,
		function(context)
			tut.happiness_building_in_construction = false
		end,
		true
	)
end


function t5_province_management_start()
	--uim:highlight_all_settlements_for_faction(tut.player_faction_key, true, "select_vfx")
	core:call_once(
		"province_management_advice",
		function()
			cm:show_advice(
				tut.advisor_texts.turn_5.v2_province_management_pract.advice_key,
				true,
				false,
				function()
					cm:hide_advisor_without_infotexts()
				end,
				tut.ADVICE_DURATION_S
			)
		end
	)
	
	if not uim:is_settlement_selected("settlement:" .. tut.sukkot) then
		cm:set_objective(tut.advisor_texts.turn_5.v2_province_management_pract.open_province_panel_objective)
		uim:highlight_settlement_for_selection(
			"settlement:" .. tut.sukkot,
			tut.north_sinai_province,
			function()
				t5_happiness()
			end
		)
	else
		t5_happiness()
	end
end

local function t5_get_happiness_component()
	return find_uicomponent(core:get_ui_root(), "panel", "province_info_holder", "province_details_holder", "public_order")
end

function t5_happiness()
	cm:complete_objective(tut.advisor_texts.turn_5.v2_province_management_pract.open_province_panel_objective)
	cm:set_objective(tut.advisor_texts.turn_5.v2_province_management_pract.check_province_management_objective)
	common.enable_info_overlays(false)
	--cm:remove_objective(tut.advisor_texts.turn_5.v2_province_management_pract.open_province_panel_objective)
	core:call_once(
		"happiness_advice",
		function()
			cm:show_advice(
				tut.advisor_texts.turn_5.v2_province_management_happiness_pract.advice_key,
				true,
				false,
				function()
					cm:hide_advisor_without_infotexts()
				end,
				tut.ADVICE_DURATION_S
			)
		end
	)

	local happiness = t5_get_happiness_component()
	if happiness then
		happiness:Highlight(true, true, 0, true)
	end

	local ap = active_pointer:new(
		"show_happinesss",
		"bottomleft",
		function()
			return happiness
		end,
		"ui_text_replacements_localised_text_phar_text_pointer_show_happiness",
		0.5,
		0,
		nil,
		true
	)
	ap:set_auto_hide_time(tut.TEXT_POINTER_DURATION_S)
	ap:add_hide_callback(t5_happiness_closed)
	ap:set_highlight_close_button(15, true)
	
	cm:callback(
		function()
			if happiness and happiness:Visible() and uim:is_settlement_selected("settlement:" .. tut.sukkot) then
				ap:show_when_ready()
			else
				t5_province_management_start()
			end
		end,
		1.5
	)
end

function t5_happiness_closed()
	local selected_region = cm:model():world():region_manager():region_by_key(uim:get_selected_settlement_region()) 
	local is_selected_region_valid = selected_region and not selected_region:is_null_interface()
	if is_selected_region_valid and selected_region:province_name() == tut.north_sinai_province then
		t5_workforce()
	else
		cm:set_objective(tut.advisor_texts.turn_5.v2_province_management_pract.open_province_panel_objective)
		uim:highlight_settlement_for_selection(
			"settlement:" .. tut.sukkot,
			tut.north_sinai_province,
			function()
				cm:complete_objective(tut.advisor_texts.turn_5.v2_province_management_pract.open_province_panel_objective)
				t5_workforce()
			end
		)
	end
end

function t5_get_workforce_component()
	return find_uicomponent(core:get_ui_root(), "panel", "province_info_holder", "province_details_holder", "workforce")
end

function t5_workforce()
	local happiness = t5_get_happiness_component()
	if happiness then
		happiness:Highlight(false, false)
	end
	core:hide_all_text_pointers()

	core:call_once(
		"workforce_advice",
		function()
			cm:show_advice(
				tut.advisor_texts.turn_5.v2_province_management_workforce_pract.advice_key,
				true,
				false,
				function()
					cm:hide_advisor_without_infotexts()
				end,
				tut.ADVICE_DURATION_S
			)
		end
	)

	local workforce = t5_get_workforce_component()
	if workforce then
		highlight_all_visible_children(workforce)
	end

	local ap = active_pointer:new(
		"show_workforce",
		"bottomleft",
		function()
			return workforce
		end,
		"ui_text_replacements_localised_text_phar_text_pointer_show_workforce",
		0.5,
		0,
		nil,
		true
	)
	ap:set_auto_hide_time(tut.TEXT_POINTER_DURATION_S)
	ap:add_hide_callback(t5_workforce_closed)
	ap:set_highlight_close_button(15, true)

	cm:callback(
		function()
			if workforce and workforce:Visible() and uim:is_settlement_selected("settlement:" .. tut.sukkot) then
				ap:show_when_ready()
			else
				t5_happiness_closed()
			end
		end,
		1.5
	)
end

function t5_workforce_closed()
	unhighlight_all_visible_children()
	local selected_region = cm:model():world():region_manager():region_by_key(uim:get_selected_settlement_region()) 
	local is_selected_region_valid = selected_region and not selected_region:is_null_interface()
	if is_selected_region_valid and selected_region:province_name() == tut.north_sinai_province then
		t5_production()
	else
		cm:set_objective(tut.advisor_texts.turn_5.v2_province_management_pract.open_province_panel_objective)
		uim:highlight_settlement_for_selection(
			"settlement:" .. tut.sukkot,
			tut.north_sinai_province,
			function()
				cm:complete_objective(tut.advisor_texts.turn_5.v2_province_management_pract.open_province_panel_objective)
				t5_production()
			end
		)
	end
end

function t5_get_production_component()
	return find_uicomponent(core:get_ui_root(), "hud_campaign", "BL_parent", "info_panel_holder", "primary_info_panel_holder", "info_panel_background", "ProvinceInfoPopup", "panel", "province_info_holder", "province_details_holder", "production")
end

function t5_get_production_header_component()
	return find_uicomponent(core:get_ui_root(), "hud_campaign", "BL_parent", "info_panel_holder", "primary_info_panel_holder", "info_panel_background", "ProvinceInfoPopup", "panel", "province_info_holder", "production", "header_production")
end

function t5_production()
	local workforce = t5_get_workforce_component()
	core:hide_all_text_pointers()

	core:call_once(
		"production_advice",
		function()
			cm:show_advice(
				tut.advisor_texts.turn_5.v2_province_management_production_pract.advice_key,
				true,
				false,
				function()
					cm:hide_advisor_without_infotexts()
				end,
				tut.ADVICE_DURATION_S
			)
		end
	)

	local production = t5_get_production_component()
	local production_header = t5_get_production_header_component()
	if production then
		highlight_all_visible_children(production)
	end

	local ap = active_pointer:new(
		"show_production",
		"bottomleft",
		function()
			return production_header
		end,
		"ui_text_replacements_localised_text_phar_text_pointer_show_production",
		0.5,
		0,
		nil,
		true
	)
	ap:add_hide_callback(t5_ambition)
	ap:set_auto_hide_time(tut.TEXT_POINTER_DURATION_S)
	ap:set_highlight_close_button(15, true)

	cm:callback(
		function()
			if production and production:Visible() and uim:is_settlement_selected("settlement:" .. tut.sukkot) then
				ap:show_when_ready()
			else
				t5_workforce_closed()
			end
		end,
		1.5
	)
end

function t5_ambition()
	cm:complete_objective(tut.advisor_texts.turn_5.v2_province_management_pract.check_province_management_objective)
	common.enable_info_overlays(true)
	unhighlight_all_visible_children()
	local production = t5_get_production_component()

	ambitions.generate_specific_ambitions_with_intervention(tut.player_faction_key, {"phar_tutorial_ambition_2_positive_happiness_in_one_settlement"})
	
	tut_ambitions_highlight("FTUE_T5_Ambition_Highlight_Wait")
	
	cm:show_advice(
		tut.advisor_texts.turn_5.v2_ambition_increase_happiness_pract.advice_key,
		true,
		false,
		function()
			cm:hide_advisor_without_infotexts()
		end,
		4
	)
	core:add_listener(
		"FTUE_AmbitionSelected_2",
		"MissionIssued",
		function(context)
			return context:mission():mission_record_key() == "phar_tutorial_ambition_2_positive_happiness_in_one_settlement"
		end,
		function()
			cm:checkpoint_reached(
				510,														-- checkpoint id
				function()												-- post-update callback
					t5_happiness_increase_setup_listener()
					t5_happiness_increase()
				end,
				tut.SHOULD_SAVE_EVERY_CHECKPOINT_MID,				-- should save game
				tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or false			-- always generate named savegame, rather than autosaving
			)		
			uim:override("end_turn"):lock()
			cm:callback(
				function()
					uim:override("end_turn"):lock()
				end,
				0.1
			)
		end,
		false
	)

end

local checkpoint_510_str = common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_settlement_happiness")

cm:add_checkpoint( 
	510,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		core:progress_on_loading_screen_dismissed(t5_happiness_increase)
	end,
	false,													-- call function when checkpoint reached
	checkpoint_510_str										-- opt string name
)

cm:add_checkpoint_setup_callback(
	510,														-- checkpoint id to add setup callback
	function(is_loading_game, checkpoint_id)				-- setup function
		t5_happiness_increase_setup_listener()
	end,
	false													-- call function when checkpoint reached
)

function t5_happiness_increase_setup_listener()
	uim:override("radar_rollout_buttons"):unlock()

	if not t5_listeners_triggered.happiness_building_constructed then
		if tut.happiness_building_in_construction then
			cm:activate_objective_chain(tut.happiness_objective_chain, tut.advisor_texts.turn_5.v2_ambition_increase_happiness_pract.increase_happiness_objective)
		end

		-- Uncomment this is we want a happiness building highlight
		-- core:add_listener(
		-- 	"FTUE_building_rollout_displayed",
		-- 	"ConstructionPopupDisplayed",
		-- 	function(context) return uim:is_settlement_selected("settlement:" .. tut.sukkot) end,
		-- 	function(context)						
		-- 		cm:repeat_callback(
		-- 			function()
		-- 				local happiness_building_uic = find_uicomponent(core:get_ui_root(), "second_construction_popup","list_holder","building_tree", "phar_main_all_province_management_happiness_type_b_1")
		-- 				if happiness_building_uic then
		-- 					happiness_building_uic:Highlight(true, true)
		-- 					cm:remove_callback("highlight_happiness_building")
		-- 				end
		-- 			end,
		-- 			1,
		-- 			"highlight_happiness_building"
		-- 		)
		-- 		cm:callback(
		-- 			function()
		-- 				cm:remove_callback("highlight_happiness_building")
		-- 			end,
		-- 			60
		-- 		)
		-- 	end,
		-- 	false
		-- )
		core:add_listener(
			"FTUE_HappinessIncreaseCheck",
			"BuildingCompleted",
			function(context)
				return context:building():get_effect_value("phar_main_province_management_happiness_building") > 0 
				and context:building():faction():name() == tut.player_faction_key
			end,
			function()
				cm:set_saved_value("happiness_building_constructed", cm:turn_number())

				cm:complete_objective(tut.advisor_texts.turn_5.v2_ambition_increase_happiness_pract.increase_happiness_objective)
				cm:callback(
					function()
						cm:end_objective_chain(tut.happiness_objective_chain)
					end,
					tut.OBJECTIVE_REMOVE_DELAY
				)

				-- Uncomment this is we want a happiness building highlight
				-- core:add_listener(
				-- 	"FTUE_building_rollout_stop_highlight",
				-- 	"ConstructionPopupDisplayed",
				-- 	function(context) return uim:is_settlement_selected("settlement:" .. tut.nekhel) end,
				-- 	function(context)					
				-- 		cm:repeat_callback(
				-- 			function()
				-- 				local happiness_building_uic = find_uicomponent(core:get_ui_root(), "second_construction_popup","list_holder","building_tree", "slot_parent", "phar_main_all_province_management_happiness_type_b_1")
				-- 				if happiness_building_uic then
				-- 					happiness_building_uic:Highlight(false, true)
				-- 					cm:remove_callback("unhighlight_happiness_building")
				-- 				end
				-- 			end,
				-- 			1,
				-- 			"unhighlight_happiness_building"
				-- 		)
				-- 		cm:callback(
				-- 			function()
				-- 				cm:remove_callback("unhighlight_happiness_building")
				-- 			end,
				-- 			60
				-- 		)
				-- 	end,
				-- 	false
				-- )
			end,
			false
		)
	end
end

function t5_happiness_increase()	
	if not t5_listeners_triggered.happiness_building_constructed then
				
		if not tut.happiness_building_in_construction then
			local selected_region = cm:model():world():region_manager():region_by_key(uim:get_selected_settlement_region()) 
			local is_selected_region_valid = selected_region and not selected_region:is_null_interface()
			if is_selected_region_valid and selected_region:province_name() == tut.north_sinai_province then
				t5_highlight_region_slots(true)
			else
				tut_add_infotext_clear(tut.advisor_texts.turn_5.v2_ambition_increase_happiness_pract.infotext)
				cm:activate_objective_chain(tut.happiness_objective_chain, tut.advisor_texts.turn_5.v2_hero_recruitment_1_mern.select_settlement_objective)
				select_settlement_for_construction()
			end
			
		end

		core:remove_listener("FTUE_happiness_building_construction_started_prematurely")
		core:remove_listener("FTUE_happiness_building_construction_canceled_prematurely")
		
		t5_start_happiness_building_construction_listener()
		t5_start_happiness_building_cancelled_listener()
	end
end

function select_settlement_for_construction()
	core:add_listener(
		"FTUE_building_rollout_displayed_happiness",
		"ConstructionPopupDisplayed",
		function(context) return true end,
		function(context)
			slot_highlight_recurrence()
			t5_highlight_region_slots(false)
		end,
		true
	)

	uim:highlight_settlement_for_selection(
		"settlement:" .. tut.sukkot,
		tut.north_sinai_province,
		function()
			t5_highlight_region_slots(true)
		end
	)
end

function slot_highlight_recurrence()
	cm:repeat_real_callback(
		function()
			local uic = find_uicomponent("construction_popup", "list_holder", "category_icons", "phar_main_resource_production")
			local happiness_building_uic = find_uicomponent("settlement_panel", "main_settlement_panel", "phar_main_all_province_management_happiness_type_b_1phar_main_clt_kemet")
			if uic and uic:Visible(true) and is_fully_onscreen(uic) then
				
			elseif not happiness_building_uic then
				t5_highlight_region_slots(true)
				cm:remove_real_callback("t3_highlight_happiness_repeat")
			end
		end,
		100,
		"t3_highlight_happiness_repeat"
	)
end

function t5_highlight_region_slots(highlight)

	if highlight then
		cm:activate_objective_chain(tut.happiness_objective_chain, tut.advisor_texts.turn_5.v2_ambition_increase_happiness_pract.increase_happiness_objective)
		cm:update_objective_chain(tut.happiness_objective_chain, tut.advisor_texts.turn_5.v2_ambition_increase_happiness_pract.increase_happiness_objective)
	end

	cm:callback(
		function()
			local uic_settlement_root = find_uicomponent("settlement_panel", "main_settlement_panel");
			if not uic_settlement_root then
				return
			end
			local uic_settlements_list = {
				[1] = find_uicomponent(UIComponent(uic_settlement_root:Find(1)), "settlement_1");
				[2] = find_uicomponent(UIComponent(uic_settlement_root:Find(2)), "settlement_1");
			};

			for	i, _ in ipairs(uic_settlements_list) do
				for y = 1, (uic_settlements_list[i]:ChildCount() - 1) - 1 do
					local uic_settlement_nekhel_child = find_uicomponent(UIComponent(uic_settlements_list[i]:Find(y)), "button_expand_slot")
					if uic_settlement_nekhel_child:Visible() == true then
						uic_settlement_nekhel_child:Highlight(highlight, true)
					end
				end
			end
		end,
		0.5,
		"highlight_building_slots"
	)
		
end


function t5_start_happiness_building_construction_listener(second_time)
	if tut.happiness_building_in_construction then 
		cm:checkpoint_reached(
			520,														-- checkpoint id
			function()												-- post-update callback
				t5_end_turn()
			end,
			tut.SHOULD_SAVE_EVERY_CHECKPOINT_START_END,				-- should save game
			tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or true			-- always generate named savegame, rather than autosaving
		)
	else
		core:add_listener(
			"FTUE_happiness_building_construction_started",
			"BuildingConstructionStarted",
			function(context) return context:building_chain() == tut.happiness_building_chain end,
			function(context)
				if second_time then
					cm:dismiss_advice()
					cm:remove_real_callback("t3_highlight_happiness_repeat")
					core:remove_listener("turn_5_building_construction")
					end_turn_highlight()
					t5_start_happiness_building_cancelled_listener()
				else
					cm:checkpoint_reached(
						520,														-- checkpoint id
						function()												-- post-update callback
							t5_enable_end_turn_warnings()
							t5_end_turn()
							cm:remove_real_callback("t3_highlight_happiness_repeat")
							core:remove_listener("turn_5_building_construction")
						end,
						tut.SHOULD_SAVE_EVERY_CHECKPOINT_START_END,				-- should save game
						tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or true			-- always generate named savegame, rather than autosaving
					)
				end
			end,
			false
		)

		core:add_listener(
			"turn_5_building_construction",
			"SettlementDeselected",
			true,
			function()
				select_settlement_for_construction()
			end,
			true
		)
	end
end

function t5_start_happiness_building_cancelled_listener()
	core:add_listener(
		"FTUE_happiness_building_construction_canceled",
		"BuildingConstructionCanceled",
		function(context) 
			return context:building_chain() == tut.happiness_building_chain 
				and context:garrison_residence():faction():name() == tut.player_faction_key
		end,
		function(context)
			lock_end_turn()
			tut.happiness_building_in_construction = false
			t5_start_happiness_building_construction_listener(true)
			t5_happiness_increase()
		end,
		false
	)
end


local checkpoint_520_str = "5 " .. common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_end")

cm:add_checkpoint( 
	520,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		core:progress_on_loading_screen_dismissed(t5_end_turn)
	end,
	false,													-- call function when checkpoint reached
	checkpoint_520_str										-- opt string name
)

cm:add_checkpoint_setup_callback( 
	520,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		t5_enable_end_turn_warnings()
	end,
	false												-- call function when checkpoint reached							-- opt string name
)

function t5_enable_end_turn_warnings()
	--Unsuppress additional feature warnings on load (this will come in handy when loading further down the line)
	if cm:get_saved_value("unlock_character_details") then
		uim:suppress_end_turn_warning("phar_unequipped_ancillaries", false)
		uim:suppress_end_turn_warning("character upgrade available", false)
	end
	if cm:get_saved_value("unlock_local_deities") then
		uim:suppress_end_turn_warning("phar_deity_slot_available", false)
		uim:suppress_end_turn_warning("phar_local_deities_devoted_hero_available", false)
	end
	if cm:get_saved_value("court_advice_monitors_completed") then
		uim:suppress_end_turn_warning("phar_court_unused_intrigue", false)
		uim:suppress_end_turn_warning("phar_court_posiion_available", false)
	end
	if tn_listeners_triggered.legitimacy_onboarding 
			and tn_listeners_triggered.legitimacy_onboarding >= cm:turn_number() then
		uim:suppress_end_turn_warning("phar_pharaohs_crown_path_not_selected", false)
		uim:suppress_end_turn_warning("phar_pharaohs_power_available", false)
		uim:suppress_end_turn_warning("phar_ancient_legacy_available", false)
		uim:suppress_end_turn_warning("phar_hatshepsut_expedition_ready_to_move", false)
		uim:suppress_end_turn_warning("phar_khufu_wonder_stage_available", false)
		uim:suppress_end_turn_warning("phar_thutmose_action_available", false)
		uim:suppress_end_turn_warning("phar_aten_devoted_hero_available", false)
		uim:suppress_end_turn_warning("phar_aten_unlockable_available", false)
	end
	
	--Unlock any unsuppressed warnings
	uim:override("end_of_turn_warnings"):unlock()
end

function t5_end_turn()
	cm:disable_movement_for_faction(tut.sukhot_faction_key)
	cm:enable_movement_for_faction(tut.player_faction_key)
	-- --cm:scroll_camera_from_current(true, 10, {438.528748, 716.034241, 10.438147, -0.101003, 5.710803})
	-- uim:suppress_end_turn_warning("all", true)
	-- uim:suppress_end_turn_warning("siege construction available,damaged building,building available,imminent rebellion", false)				
	cm:dismiss_advice()

	local reminders_clicked = false
	cm:callback(
		function()
			if not reminders_clicked then
			end_turn_highlight()
			end
		end,
		2
	)

	core:add_listener(
		"FTUE_warnings_clicked",
		"ComponentLClickUp",
		function(context) 
			return context.string == "button_end_turn"
		end,
		function(context)
			reminders_clicked = true
			uim:override("end_turn"):lock()
			end_turn_button = find_uicomponent(core:get_ui_root(), "hud_campaign", "faction_buttons_docker","end_turn_docker", "button_end_turn")
			if end_turn_button then
				pulse_uicomponent(end_turn_button, false)
				highlight_component(false, true, "faction_buttons_docker","end_turn_docker", "button_end_turn")
			end
			
			local reminders_panel = find_uicomponent(core:get_ui_root(), "dropdown_lists_parent", "dropdown_notifications", "panel", "panel_clip")
			cm:callback(
				function()
					reminders_panel:Highlight(true, true, 0, true)
				end,
				4
			)

			cm:show_advice(
				tut.advisor_texts.turn_4.v2_rest_of_turn_1_mern.advice_key,
				true,
				false,
				function()
					cm:hide_advisor_without_infotexts()
					cm:show_advice(
						tut.advisor_texts.turn_4.v2_rest_of_turn_2_ram.advice_key,
						true,
						false,
						function()
							cm:hide_advisor_without_infotexts()
							cm:show_advice(
								tut.advisor_texts.turn_4.v2_rest_of_turn_3_mern.advice_key,
								true,
								false,
								function()
									cm:hide_advisor_without_infotexts()
									uim:override("end_turn"):unlock()
									
									reminders_panel:Highlight(false, true, 0, true)
									
									cm:callback(
										function()
											if end_turn_button then
												pulse_uicomponent(end_turn_button, true)
												highlight_component(true, true, "faction_buttons_docker","end_turn_docker", "button_end_turn")
											end
										end,
										2
									)
								end,
								tut.ADVICE_DURATION_S
							)
						end,
						tut.ADVICE_DURATION_S
					)
				end,
				tut.ADVICE_DURATION_S
			)
			tut_add_infotext_clear(tut.advisor_texts.turn_4.v2_rest_of_turn_1_mern.infotext)
		end,
		false
	)

	t6_start_listener()
end






--Commented for next turns
--[[ function t5_turn_start()
	tut_skip_sukhot_faction_turns(true)
	highlight_component(false, false, "hud_campaign", "button_end_turn")
	
	cm:dismiss_advice()
	cm:clear_infotext()
	--uim:override("end_turn"):lock()
	--uim:override("hide_faction_buttons_docker"):lock()

	local technology_advice_scripted = intro_campaign_technology_advice:new(
		tut.advisor_texts.turn_5.merneptah_royal_decrees.advice_key,
		tut.advisor_texts.turn_5.merneptah_royal_decrees.tech_panel_open_objective,
		tut.advisor_texts.turn_5.merneptah_royal_decrees.tech_objective,
		tut.advisor_texts.turn_5.merneptah_royal_decrees.completion_advice,
		function()
			cm:checkpoint_reached(
				510,														-- checkpoint id
				function()												-- post-update callback
					t5_allow_diplomacy()
					t5_start_diplomacy_advice()
				end,
				tut.SHOULD_SAVE_EVERY_CHECKPOINT_MID,				-- should save game
				tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or false			-- always generate named savegame, rather than autosaving
			)
		end
	)

	technology_advice_scripted:start()
end


function t5_allow_technology()
	uim:override("technology"):unlock()
	uim:override("hide_faction_widget_buttons"):unlock()
end










--------------------------------------------------------------------------------------------------
-- CHECKPOINT 510: diplomacy
--------------------------------------------------------------------------------------------------

local checkpoint_510_str = common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_diplomacy")

cm:add_checkpoint( 
	510,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		core:progress_on_loading_screen_dismissed(t5_start_diplomacy_advice)
	end,
	false,													-- call function when checkpoint reached
	checkpoint_510_str									-- opt string name
)


cm:add_checkpoint_setup_callback(
	510,														-- checkpoint id to add setup callback
	function(is_loading_game, checkpoint_id)				-- setup function
		t5_allow_diplomacy()
	end,
	false													-- call function when checkpoint reached
)


function t5_start_diplomacy_advice()
	cm:show_advice(
		tut.advisor_texts.turn_5.ramesses_diplomacy.advice_key,
		true,
		false,
		function ()
			t5_highlight_diplomacy_button()
		end,
		2
	)
end


function t5_allow_diplomacy()
	uim:override("diplomacy"):unlock()
end

function t5_highlight_diplomacy_button()
	--cm:set_objective(tut.advisor_texts.turn_5.ramesses_diplomacy.diplomacy_chain_name)
	cm:activate_objective_chain(
		tut.advisor_texts.turn_5.ramesses_diplomacy.diplomacy_chain_name,
		tut.advisor_texts.turn_5.ramesses_diplomacy.diplomacy_panel_open_objective
	)
	highlight_component(true, false, "hud_campaign", "faction_widget_list", "button_diplomacy")

	core:add_listener(
		tut.advisor_texts.turn_5.ramesses_diplomacy.diplomacy_chain_name,
		"PanelOpenedCampaign",
		function(context) return context.string == "diplomacy_dropdown" end,
		function()
			t5_diplomacy_panel_opened()
		end,
		false
	)
end;

function t5_diplomacy_panel_opened()
	highlight_component(false, false, "hud_campaign", "faction_widget_list", "button_diplomacy")
	cm:update_objective_chain(
		tut.advisor_texts.turn_5.ramesses_diplomacy.diplomacy_chain_name,
		tut.advisor_texts.turn_5.practical_advisor_diplomacy_info_overlay.diplomacy_info_overlay_objective
	)
	cm:dismiss_advice()
	cm:show_advice(
		tut.advisor_texts.turn_5.practical_advisor_diplomacy_info_overlay.advice_key,
		true,
		false,
		function ()
			info_overlay_cheat_sheet_and_highlight(nil, t5_end_diplomacy_objective_chain)
		end,
		2
	)
end

function t5_end_diplomacy_objective_chain()
	cm:end_objective_chain(
		tut.advisor_texts.turn_5.ramesses_diplomacy.diplomacy_chain_name
	)
	t5_restore_end_turn_ui()

	cm:checkpoint_reached(
		520,														-- checkpoint id
		function()												-- post-update callback
			
		end,
		tut.SHOULD_SAVE_EVERY_CHECKPOINT_MID,				-- should save game
		tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or false			-- always generate named savegame, rather than autosaving
	)
end


core:add_listener(
	"FTUE_FactionTurnEnd_5",
	"FactionTurnEnd",
	function(context) return context:faction():name() == tut.player_faction_key and cm:turn_number() == 5 end,
	function(context)
		-- this is where we enable all other faction turns
		tut_skip_all_but_player_turns(false)
	end
)

local checkpoint_520_str = common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_diplomacy_later")

cm:add_checkpoint( 
	520,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		
	end,
	false,													-- call function when checkpoint reached
	checkpoint_520_str									-- opt string name
)

cm:add_checkpoint_setup_callback(
	520,														-- checkpoint id to add setup callback
	function(is_loading_game, checkpoint_id)				-- setup function
		t5_restore_end_turn_ui()
	end,
	false													-- call function when checkpoint reached
)

function t5_restore_end_turn_ui()
	uim:override("hide_faction_buttons_docker"):unlock()
	uim:override("end_turn"):unlock()
end

-- core:add_listener(
-- 	"FTUE_Entire_Province_Conquered",
-- 	"GarrisonOccupiedEvent",
-- 	function(context)
-- 		if not context:character():faction():name() == tut.player_faction_key then
-- 			return false
-- 		end
-- 		local regions_in_province_list =  context:garrison_residence():region():province():regions()
-- 		local num_regions_in_province = regions_in_province_list:num_items()
-- 		local owned_regions_in_province = 0
-- 		for i=1, num_regions_in_province do
-- 			if regions_in_province_list:item_at(i):owning_faction():name() == tut.player_faction_key then
-- 				owned_regions_in_province = owned_regions_in_province + 1
-- 			end
-- 		end
-- 		if owned_regions_in_province == num_regions_in_province then
-- 			return true
-- 		else
-- 			return false
-- 		end
-- 	end,
-- 	function(context) 

-- 	end,
-- 	false
-- ) ]]