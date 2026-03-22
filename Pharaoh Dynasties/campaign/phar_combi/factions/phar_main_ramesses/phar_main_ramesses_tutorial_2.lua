

out("phar_main_ramesses_tutorial_2 loaded")

--------------------------------------------------------------------------------------------------
-- CHECKPOINT 200: start of turn two
--------------------------------------------------------------------------------------------------

local checkpoint_200_str = "2 " .. common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_start")

cm:add_checkpoint( 
	200,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		core:progress_on_loading_screen_dismissed(t2_turn_start)
	end,
	false,													-- call function when checkpoint reached
	checkpoint_200_str										-- opt string name
)

function t2_start_listener()
	core:add_listener(
		"FTUE_FactionTurnStart_2",
		"FactionTurnStart",
		function(context) return context:faction():name() == tut.player_faction_key and cm:turn_number() == 2 end,
		function(context)
			cm:checkpoint_reached(
				200,														-- checkpoint id
				function()												-- post-update callback
					t2_turn_start()
				end,											-- post-update callback
				tut.SHOULD_SAVE_EVERY_CHECKPOINT_START_END or false,											-- should save game
				tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or true			-- always generate named savegame, rather than autosaving
			)
		end,
		false
	)
end



function t2_turn_start()
	local ram_lookup_str_fm = cm:char_lookup_str_fm(tut.player_faction_leader_fm_cqi)
	cm:zero_action_points(ram_lookup_str_fm)
	cm:replenish_action_points(ram_lookup_str_fm,0,0.75)

	highlight_component(false, false, "hud_campaign", "button_end_turn")
	uim:override("end_turn"):lock()
	uim:override("hide_faction_buttons_docker"):lock()
	uim:override("army_panel_visible"):lock()

	cm:add_garrison_residence_vfx(
		cm:get_region(tut.nekhel):garrison_residence():command_queue_index(),
		"settlement_disaster",
		true,
		true,
		true
	)
		
	local ramesses_cqi = cm:get_character_by_fm_cqi(tut.player_faction_leader_fm_cqi):command_queue_index()			
	cm:disable_movement_for_character("character_cqi:" .. ramesses_cqi)

	cm:grant_unit_to_character("character_cqi:" .. ramesses_cqi, false, "phar_main_fac_ram_archer_chariots")
	cm:grant_unit_to_character("character_cqi:" .. ramesses_cqi, false, "phar_main_nat_sin_habiru_raiders")
	cm:remove_unit_from_character("character_cqi:" .. ramesses_cqi, "phar_main_fac_ram_sherden_raiders")
	
	local sukkot_hero_2 = cm:get_character_by_fm_cqi(tut.sukkot_hero_2_fm_cqi)
	local sukkot_hero_3 = cm:get_character_by_fm_cqi(tut.sukkot_hero_3_fm_cqi)

	local sukkot_hero_2_x = sukkot_hero_2:logical_position_x()
	local sukkot_hero_2_y = sukkot_hero_2:logical_position_y()
	local sukkot_hero_3_x = sukkot_hero_3:logical_position_x()
	local sukkot_hero_3_y = sukkot_hero_3:logical_position_y()

	cm:character_forced_invisible(cm:char_lookup_str_fm(tut.sukkot_hero_2_fm_cqi), true)
	cm:character_forced_invisible(cm:char_lookup_str_fm(tut.sukkot_hero_3_fm_cqi), true)

	cm:add_scripted_composite_scene_to_logical_position(
		"nekhel_under_siege_csc_02",
		"phar_main_nekhel_siege_02",
		sukkot_hero_2_x,
		sukkot_hero_2_y,
		sukkot_hero_2_x,
		sukkot_hero_2_y,
		false,
		true,
		true,
		sukkot_hero_2:bearing()
	)
	cm:add_scripted_composite_scene_to_logical_position(
		"nekhel_under_siege_csc_01",
		"phar_main_nekhel_siege_01",
		sukkot_hero_3_x,
		sukkot_hero_3_y,
		sukkot_hero_3_x,
		sukkot_hero_3_y,
		false,
		true,
		true,
		sukkot_hero_3:bearing()
	)

	--uim:override("saving"):lock() --TBD
	--cm:dismiss_advice()
	--cm:modify_advice(false, false)
	cm:clear_infotext()
	cm:scroll_camera_from_current(false, 4, {600.764343, 675.477844, 15.533713, -1.019229, 9.343366})
	--cm:scroll_camera_from_current(false, 4, {417.164948, 672.609619, 13.767456, 0.496845, 8.0})
	cm:callback(
		function()
			cm:show_advice(
				tut.advisor_texts.turn_2.v2_camera_controls_1_mern.advice_key,
				false,
				false,
				function()
					cm:show_advice(
						tut.advisor_texts.turn_2.v2_camera_controls_2_ram.advice_key,
						false,
						false,
						function()
							cm:show_advice(
								tut.advisor_texts.turn_2.v2_camera_controls_3_mern.advice_key,
								false,
								false,
								function()
									cm:show_advice(
										tut.advisor_texts.turn_2.v2_camera_controls_4_pract.advice_key,
										false,
										false,
										function()
											cm:hide_advisor_without_infotexts()
										end,
										tut.ADVICE_DURATION_S
									)
								end,
								tut.ADVICE_DURATION_S
							)
						end,
						tut.ADVICE_DURATION_S
					)
					
					tut_add_infotext(tut.advisor_texts.turn_2.v2_camera_controls_2_ram.infotext)

					t2_show_camera_controls_cheat_sheet()

					uim:highlight_settlement(
						"settlement:"..tut.nekhel,
						"move_to"
					)
					cm:set_objective(tut.advisor_texts.turn_2.v2_camera_controls_2_ram.objective_key)
					cm:repeat_real_callback( 
						function()
							local camera_x, camera_y, camera_distance = cm:get_camera_position()
							local settlement_x, settlement_y = cm:settlement_display_pos("settlement:"..tut.nekhel)
							local target_distance = distance_squared(camera_x,camera_y, settlement_x, settlement_y)
							if camera_distance < 1000 and target_distance < 200 then
								cm:remove_real_callback("Nekhel focused") 
							
								cm:clear_infotext()
								cm:complete_objective(tut.advisor_texts.turn_2.v2_camera_controls_2_ram.objective_key)
								uim:unhighlight_settlement(
									"settlement:"..tut.nekhel,
									true
								)
								t2_start_city_in_distress()
							end
						end,
						0.5,
						"Nekhel focused"
					)
				end,
				tut.ADVICE_DURATION_S
			)
		end,
		4
	)

end

function t2_show_camera_controls_cheat_sheet()
	show_campaign_controls_cheat_sheet(true)
end

function t2_start_city_in_distress()
	-- cm:scroll_camera_from_current(false, 1.5, {432.572113, 700.58844, 10.49783, 0.030014, 5.749389})
	
	--ADD RELEVANT COMPOSITE SCENE HERE
	local cutscene_intro = campaign_cutscene:new_from_cindyscene(
		"intro_cutscene",
		function()
			t2_start_hero_movement_to_nekhel()
			tut_add_infotext(tut.advisor_texts.turn_2.v2_city_in_distress_1_pract.infotext)
		end,
		"script/campaign/phar_combi/factions/phar_camp_tutorial/scenes/phar_camp_tutorial_sq01_1.CindyScene",
		10,
		10,
		nil 	-- fade to picture duration when cindyscene starts
	)

	-- cutscene_intro:set_debug();
	cutscene_intro:set_skippable(true)
	cutscene_intro:set_disable_settlement_labels(true)
	cutscene_intro:set_dismiss_advice_on_end(false)
	-- cutscene_intro:set_disable_shroud(true)
	-- cutscene_intro:set_restore_shroud(true)
	cutscene_intro:set_restore_camera(3, 595.523804, 678.970947, 10, 0, 8)
	cutscene_intro:set_fade_on_skip(true, 1, 1)

	cutscene_intro:action(
		function()
			cm:show_advice(
				tut.advisor_texts.turn_2.v2_city_in_distress_1_pract.advice_key,
				false,
				false,
				function()
					cm:callback(
						function()
							cm:show_advice(
								tut.advisor_texts.turn_2.v2_city_in_distress_1_1_pract.advice_key,
								false,
								false,
								function()
									cutscene_intro:dismiss_advice()
								end,
								4
							)
						end,
						1
					)
				end,
				4
			)
		end,
		1
	)
	cutscene_intro:action(
		function()
			tut_add_infotext(tut.advisor_texts.turn_2.v2_city_in_distress_1_pract.infotext)
		end,
		2
	)

	cutscene_intro:start()
end

function t2_start_hero_movement_to_nekhel()
	--Removing selection because otherwise the cutscene enables the army panel on finishing
	uim:override("army_panel_visible"):lock()
	CampaignUI.ClearSelection()

	uim:unhighlight_settlement("settlement:phar_main_east_sinai_khet_khefti", true)

	local ramesses_cqi = cm:get_character_by_fm_cqi(tut.player_faction_leader_fm_cqi):command_queue_index()
	cm:enable_movement_for_character("character_cqi:" .. ramesses_cqi)
	
	local hero_movement_advice = intro_campaign_movement_advice:new(
		ramesses_cqi,
		tut.advisor_texts.turn_2.v2_city_in_distress_2_mern.advice_key,
		tut.advisor_texts.turn_2.v2_city_in_distress_2_mern.selection_objective_key,
		nil,
		tut.advisor_texts.turn_2.v2_city_in_distress_2_mern.movement_objective_key,
		933,
		890,
		function()
			cm:checkpoint_reached(
				210,														-- checkpoint id
				t2_hero_arrives_at_nekhel,								-- post-update callback
				tut.SHOULD_SAVE_EVERY_CHECKPOINT_MID or false,				-- should save game
				tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or false			-- always generate named savegame, rather than autosaving
			)
		end
	)
	hero_movement_advice:start()
end


--------------------------------------------------------------------------------------------------
-- CHECKPOINT 210: hero arrives at Nekhel
--------------------------------------------------------------------------------------------------

local chekpoint_210_str = common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_nekhel")

cm:add_checkpoint( 
	210,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		core:progress_on_loading_screen_dismissed(t2_hero_arrives_at_nekhel)
	end,
	false,													-- call function when checkpoint reached
	chekpoint_210_str						-- opt string name
)

cm:add_checkpoint_setup_callback(
	210,										
	function(is_loading_game, checkpoint_id)		
		t2_perma_show_labels()
	end,
	false								
)


function t2_perma_show_labels()
	uim:override("settlement_labels"):unlock()
end



function t2_hero_arrives_at_nekhel()
	cm:character_forced_invisible(cm:char_lookup_str_fm(tut.sukkot_hero_2_fm_cqi), true)
	cm:character_forced_invisible(cm:char_lookup_str_fm(tut.sukkot_hero_3_fm_cqi), true)
	
	cm:scroll_camera_from_current(true, 5, {623.881226, 693.364258, 10.648074, 0.097234, 5.846888})		
	show_campaign_controls_cheat_sheet(false)							
	cm:show_advice(
		tut.advisor_texts.turn_2.v2_city_in_distress_3_pract.advice_key,
		false,
		false,
		function ()
			cm:hide_advisor_without_infotexts()
			cm:callback(
				function()
					cm:set_objective(tut.advisor_texts.turn_1.v2_end_turn_pract.objective_key)
					end_turn_highlight(true)
				end,
				0.5
			)
		end,
		2.5
	)

	-- Set the next battle that loads to immediately start the advanced battle tutorial behaviour
	core:svr_save_bool("immediately_load_advanced_battle_tutorial", true)
	
	t2_start_non_player_end_turn_listeners()
	t3_start_listener()
end

--------------------------------------------------------------------------------------------------
-- CHECKPOINT 220: mid-end turn sequence
--------------------------------------------------------------------------------------------------

local checkpoint_220_str = "2 " .. common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_end")

cm:add_checkpoint( 
	220,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		if cm:whose_turn_is_it() == tut.sukhot_faction_key and cm:model():pending_battle():is_active() then
			-- We have loaded in mid-end-turn and the pending battle against the player is active, so show the pre-battle advice

			local is_returning_from_manual_battle = cm:model():pending_battle():conflict_completed()
			core:progress_on_loading_screen_dismissed(function() t2_pre_sukkot_advanced_battle(is_returning_from_manual_battle) end)
		else
			-- Otherwise, wait for the battle to occur
			t2_start_non_player_end_turn_listeners()
			cm:dismiss_advice()
		end
		t3_start_listener()
	end,
	false,													-- call function when checkpoint reached
	checkpoint_220_str						-- opt string name
)
cm:add_checkpoint_setup_callback(
	220,														-- checkpoint id to add setup callback
	function(is_loading_game, checkpoint_id)				-- setup function
		t2_setup_pre_sukkot_advanced_battle()
	end,
	false													-- call function when checkpoint reached
)


function t2_start_non_player_end_turn_listeners()
	core:add_listener(
		"FTUE_SukhotFactionTurnStart_2",
		"FactionBeginTurnPhaseNormal",
		function(context) return context:faction():name() == tut.sukhot_faction_key and cm:turn_number() == 2 end,
		function(context)
			cm:remove_scripted_composite_scene("nekhel_under_siege_csc_01")
			cm:remove_scripted_composite_scene("nekhel_under_siege_csc_02")
			cm:character_forced_invisible(cm:char_lookup_str_fm(tut.sukkot_hero_2_fm_cqi), false)
			cm:character_forced_invisible(cm:char_lookup_str_fm(tut.sukkot_hero_3_fm_cqi), false)

			cm:complete_objective(tut.advisor_texts.turn_1.v2_end_turn_pract.objective_key)
			cm:remove_objective(tut.advisor_texts.turn_1.v2_end_turn_pract.objective_key)


			cm:enable_movement_for_faction(tut.sukhot_faction_key)
			if not tut.sukkot_hero_1_fm_cqi then
				script_error("ERROR: sukkot_hero_1_fm_cqi not set! Player will not be attacked.")
				return
			end

			local ramesses_cqi = cm:get_character_by_fm_cqi(tut.player_faction_leader_fm_cqi):command_queue_index()
			local sukkot_hero_1 = cm:get_character_by_fm_cqi(tut.sukkot_hero_1_fm_cqi)
			local sukkot_hero_1_cqi = sukkot_hero_1:command_queue_index()
			local sukkot_hero_2 = cm:get_character_by_fm_cqi(tut.sukkot_hero_2_fm_cqi)
			local sukkot_hero_2_cqi = sukkot_hero_2:command_queue_index()
			local sukkot_hero_3 = cm:get_character_by_fm_cqi(tut.sukkot_hero_3_fm_cqi)
			local sukkot_hero_3_cqi = sukkot_hero_3:command_queue_index()
			
			--cm:disable_movement_for_character("character_cqi:" .. sukkot_hero_1_cqi)

			t2_setup_pre_sukkot_advanced_battle()
			-- cm:move_to("character_cqi:" .. sukkot_hero_2_cqi, 654, 922)
			-- cm:move_to("character_cqi:" .. sukkot_hero_3_cqi, 654, 938)
			cm:set_force_has_retreated_this_turn(sukkot_hero_1)
			cm:attack("character_cqi:" .. sukkot_hero_1_cqi, "character_cqi:" .. ramesses_cqi)
			-- cm:callback(
			-- 	function()
			-- 		--cm:enable_movement_for_character("character_cqi:" .. sukkot_hero_1_cqi)
			-- 		cm:attack("character_cqi:" .. sukkot_hero_1_cqi, "character_cqi:" .. ramesses_cqi)
			-- 	end,
			-- 	6
			-- )
			cm:cai_disable_movement_for_character("character_cqi:" .. sukkot_hero_2_cqi)
			cm:cai_disable_movement_for_character("character_cqi:" .. sukkot_hero_3_cqi)

		end,
		false
	)
	core:add_listener(
		"FTUE_SukhotAttack",
		"PendingBattle",
		function(context) return context:pending_battle():attacker_faction():name() == tut.sukhot_faction_key and cm:turn_number() == 2 end,
		function(context)
			cm:checkpoint_reached(
				220,														-- checkpoint id
				t2_pre_sukkot_advanced_battle(false),													-- post-update callback
				tut.SHOULD_SAVE_EVERY_CHECKPOINT_START_END or false,											-- should save game
				tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or true			-- always generate named savegame, rather than autosaving
			)
		end,
		false
	)
end

function t2_setup_pre_sukkot_advanced_battle()
	uim:override("army_panel_visible"):unlock()
	uim:override("hide_pre_battle_retreat"):lock()
	core:svr_save_bool("tut_make_player_general_invincible", true)
	local get_tweaker_autoresolve_allowed = core:is_tweaker_set("SCRIPTED_TWEAKER_10") or common.is_autotest()
	if not get_tweaker_autoresolve_allowed then
		uim:override("hide_pre_battle_autoresolve"):lock()
	else
		uim:override("hide_pre_battle_autoresolve"):unlock()
	end
end


function t2_pre_sukkot_advanced_battle(is_returning_from_manual_battle)
	if not is_returning_from_manual_battle then
		cm:callback(
			function()
				cm:show_advice(
					tut.advisor_texts.turn_2.v2_pre_advanced_tutorial_mern.advice_key,
					false,
					false,
					function()
						cm:hide_advisor_without_infotexts()
					end,
					5
				)
				tut_highlight_pre_battle_attack(true)
			end,
			1
		)
	end

	-- cm:callback(
	-- 	function()
	-- 		local pre_battle_options_ui = find_uicomponent(core:get_ui_root(), "popup_pre_battle")
	-- 		if pre_battle_options_ui and pre_battle_options_ui:Visible() then
	-- 			uim:highlight_pre_battle_options(true)
	-- 		end
	-- 	end,
	-- 	10
	-- )

	core:add_listener(
		"FTUE_popup_battle_results_opened",
		"PanelOpenedCampaign",
		function(context) return context.string == "popup_battle_results" end,
		function(context)
			cm:dismiss_advice()
			cm:progress_on_post_battle_panel_visible(
				function()
					--TO DO: add post-battle options supression before advice is finished
					cm:show_advice(
						tut.advisor_texts.turn_2.v2_post_advanced_tutorial_1_mern.advice_key,
						false,
						false,
						function()
							if cm:turn_number() == 2 then
								cm:show_advice(
									tut.advisor_texts.turn_2.v2_post_advanced_tutorial_2_pract.advice_key,
									false,
									false,
									function()
										cm:hide_advisor_without_infotexts()
									end,
									tut.ADVICE_DURATION_S
								)
							end
						end,
						tut.ADVICE_DURATION_S
					)
					tut_add_infotext(tut.advisor_texts.turn_2.v2_post_advanced_tutorial_1_mern.infotext)
					
					uim:highlight_post_battle_options(true)

				end,
				0
			)
		end,
		false
	)

	core:add_listener(
		"FTUE_battle_1_ended",
		"CharacterPostBattleCaptiveOptionSelected",
		true,
		function(context)
			cm:cancel_progress_on_post_battle_panel_visible()
			cm:dismiss_advice()

			local sukkot_hero_2_cqi = cm:get_character_by_fm_cqi(tut.sukkot_hero_2_fm_cqi):command_queue_index()
			local sukkot_hero_3_cqi = cm:get_character_by_fm_cqi(tut.sukkot_hero_3_fm_cqi):command_queue_index()
			cm:enable_movement_for_character("character_cqi:" .. sukkot_hero_2_cqi)
			cm:enable_movement_for_character("character_cqi:" .. sukkot_hero_3_cqi)

			cm:move_to(
				"character_cqi:" .. sukkot_hero_2_cqi,
				945,
				922,
				false,
				false,
				function()
					cm:callback(
						function()
							cm:end_turn()
						end,
						0.2
					)
				end
			)
			cm:move_to(
				"character_cqi:" .. sukkot_hero_3_cqi,
				945,
				938,
				false,
				false,
				function()
					cm:callback(
						function()
							cm:end_turn()
						end,
						0.2
					)
				end
			)

			cm:disable_movement_for_faction(tut.sukhot_faction_key)
		end,
		false
	)
	if is_returning_from_manual_battle then
		cm:progress_on_battle_completed(
			"FTUE_battle_1_ended", 
			function(context)
				cm:dismiss_advice()

				local sukkot_hero_1 = cm:char_lookup_str_fm(tut.sukkot_hero_1_fm_cqi)
				cm:kill_character_and_commanded_unit(sukkot_hero_1, true)
			end,
			0
		)
	end
end
