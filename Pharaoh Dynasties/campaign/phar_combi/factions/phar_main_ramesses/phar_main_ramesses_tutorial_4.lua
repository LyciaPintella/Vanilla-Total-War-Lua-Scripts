

out("phar_main_ramesses_tutorial_4 loaded")

t4_listeners_triggered = 
{
	sukkot_proposed_peace = cm:get_saved_value("sukkot_proposed_peace"),
}


--------------------------------------------------------------------------------------------------
-- CHECKPOINT 400: Turn 4 start
--------------------------------------------------------------------------------------------------

local checkpoint_400_str = "4 " .. common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_start")

cm:add_checkpoint( 
	400,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		core:progress_on_loading_screen_dismissed(t4_turn_start)
	end,
	false,													-- call function when checkpoint reached
	checkpoint_400_str										-- opt string name
)

cm:add_checkpoint_setup_callback(
	400,														-- checkpoint id to add setup callback
	function(is_loading_game, checkpoint_id)				-- setup function
		t4_start_turn_setup()
	end,
	false													-- call function when checkpoint reached
)

function t4_start_turn_setup()
	tut_skip_sukhot_faction_turns(true)
	uim:override("recruit_units"):unlock()
	uim:override("recruit_units"):set_allowed(true);
	-- the recruitment advice disables cancel_recruitment because we don't want the player to be able to do it at that point. Now we enable it again.
	uim:override("cancel_recruitment"):set_allowed(true)
	uim:override("hide_pre_battle_autoresolve"):unlock()
	-- Unsuppresses warnings for: 	Siege construction available, 	Damaged building, Building available, 	Imminent rebellion
	uim:suppress_end_turn_warning("all", true)
	uim:suppress_end_turn_warning("siege construction available,damaged building,building available,imminent rebellion,hero ap available,garrison army ap available,army ap available", false)

	t4_enable_some_major_cai_factions()

	local visible_regions_table = {"phar_main_north_sinai_sukkot"}
	cm:make_regions_visible_in_shroud_for_faction(cm:get_local_faction_name(), visible_regions_table)
end

function t4_enable_some_major_cai_factions()
	tut_set_skip_faction_turns(tut.tausret_faction_key, false)
	tut_set_skip_faction_turns(tut.amenmesse_faction_key, false)
	tut_set_skip_faction_turns(tut.kurunta_faction_key, false)
	tut_set_skip_faction_turns(tut.suppiluliuma_faction_key , false)	
end

function t4_start_listener()
	core:add_listener(
		"FTUE_FactionTurnStart_4",
		"FactionTurnStart",
		function(context) return context:faction():name() == tut.player_faction_key and cm:turn_number() == 4 end,
		function(context)
			cm:checkpoint_reached(
				400,														-- checkpoint id
				function()		
					t4_start_turn_setup()										-- post-update callback
					t4_turn_start()
				end,
				tut.SHOULD_SAVE_EVERY_CHECKPOINT_START_END,				-- should save game
				tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or true				-- always generate named savegame, rather than autosaving
			)
		end
	)
end


function t4_turn_start()

	highlight_component(false, false, "hud_campaign", "button_end_turn")
	cm:dismiss_advice()
	cm:clear_infotext()
	uim:override("end_turn"):lock()
	uim:override("hide_faction_buttons_docker"):lock()

	local ramesses = cm:get_character_by_fm_cqi(tut.player_faction_leader_fm_cqi)
	local ramesses_cqi = ramesses:command_queue_index()
	local sukkot_hero_2 = cm:get_character_by_fm_cqi(tut.sukkot_hero_2_fm_cqi)
	local sukkot_hero_3 = cm:get_character_by_fm_cqi(tut.sukkot_hero_3_fm_cqi)

	cm:enable_movement_for_character(cm:char_lookup_str_fm(tut.player_faction_leader_fm_cqi))
	if sukkot_hero_2 and not sukkot_hero_2:is_null_interface() and sukkot_hero_2:has_military_force() then
		cm:set_force_has_retreated_this_turn(sukkot_hero_2)
	end
	if sukkot_hero_3 and not sukkot_hero_3:is_null_interface() and sukkot_hero_3:has_military_force() then
		cm:set_force_has_retreated_this_turn(sukkot_hero_3)
	end

	local ramesses_unit = ramesses:commanded_unit()
	if not ramesses_unit:is_null_interface() then 
		--heal Ramesses to full hp
		cm:set_unit_soldiers_or_hitpoints(ramesses_unit, 999999)
	end

	if sukkot_hero_3 and not sukkot_hero_3:is_null_interface() and sukkot_hero_3:family_member():is_alive() then 
		local sukkot_hero_3_cqi = sukkot_hero_3:command_queue_index()
		local sa = intro_campaign_select_and_attack_advice:new(
			ramesses_cqi,
			sukkot_hero_3_cqi,
			tut.advisor_texts.turn_4.v2_continue_the_attack_mern.advice_key,
			tut.advisor_texts.turn_4.v2_continue_the_attack_mern.selection_objective,
			nil, -- no attack advice
			tut.advisor_texts.turn_4.v2_continue_the_attack_mern.attack_objective,
			function()
				
			end
		)
		--sa:set_camera_position_override()
		sa:add_initial_infotext(unpack(tut.advisor_texts.turn_4.v2_continue_the_attack_mern.infotext))
		sa:start()	
	elseif sukkot_hero_2 and not sukkot_hero_2:is_null_interface() and sukkot_hero_2:family_member():is_alive() then
		local sukkot_hero_2_cqi = sukkot_hero_2:command_queue_index()
		local sa = intro_campaign_select_and_attack_advice:new(
			ramesses_cqi,
			sukkot_hero_2_cqi,
			tut.advisor_texts.turn_4.v2_continue_the_attack_mern.advice_key,
			tut.advisor_texts.turn_4.v2_continue_the_attack_mern.selection_objective,
			nil, -- no attack advice
			tut.advisor_texts.turn_4.v2_continue_the_attack_mern.attack_objective,
			function()
				
			end
		)
		--sa:set_camera_position_override()
		sa:add_initial_infotext(unpack(tut.advisor_texts.turn_4.v2_continue_the_attack_mern.infotext))
		--sa:add_attack_infotext(unpack(tut.advisor_texts.turn_4.ramesses_battle_advanced_2.infotext))
		
		sa:start()
	else
		script_error("ERROR: All armies of Sukhot are null interface")
	end

	t4_start_sukkot_army_pre_battle_advice_listener()
end


function t4_start_sukkot_army_pre_battle_advice_listener()
	core:add_listener(
		"FTUE_ReachSukhotArmies",
		"PanelOpenedCampaign",
		function(context)
			return context.string == "popup_pre_battle" and cm:turn_number() == 4
		end,
		function(context)		
			cm:checkpoint_reached(
				410,														-- checkpoint id
				function()												-- post-update callback
					cm:clear_infotext()
					t4_sukkot_army_3_pre_battle_panel_opened()
				end,
				tut.SHOULD_SAVE_EVERY_CHECKPOINT_MID,				-- should save game
				tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or false			-- always generate named savegame, rather than autosaving
			)
		end,
		false
	)
end



--------------------------------------------------------------------------------------------------
-- CHECKPOINT 410: pre battle panel open
--------------------------------------------------------------------------------------------------

local checkpoint_410_str = common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_before_battle")

cm:add_checkpoint( 
	410,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		core:progress_on_loading_screen_dismissed(t4_sukkot_army_3_pre_battle_panel_opened)
	end,
	false,													-- call function when checkpoint reached
	checkpoint_410_str									-- opt string name
)


function t4_get_balance_of_power_component()
	return find_uicomponent(core:get_ui_root(), "popup_pre_battle", "killometer")
end


function t4_highlight_balance_of_power(uic_bop, should_highlight)
	uic_bop = uic_bop or t4_get_balance_of_power_component()
	if uic_bop then
		uic_bop:Highlight(should_highlight, true)
	end
end


function t4_sukkot_army_3_pre_battle_panel_opened()
	cm:callback(
		function()
			local balance_of_power = t4_get_balance_of_power_component()
			if balance_of_power and balance_of_power:Visible() then
				local ap = active_pointer:new(
					"show_balance_of_power",
					"bottomright",
					balance_of_power,
					"ui_text_replacements_localised_text_phar_text_pointer_balance_of_power_description",
					0.5,
					0,
					nil,
					true
				)
			
				ap:add_hide_callback(
					function()
						t4_highlight_balance_of_power(balance_of_power, false)
					end
				);
				ap:set_auto_hide_time(tut.TEXT_POINTER_DURATION_S)

				cm:callback(
					function()
						if balance_of_power and balance_of_power:Visible() then
							ap:show_when_ready()
							t4_highlight_balance_of_power(balance_of_power, true)
						end
					end,
					tut.NEXT_ADVICE_DELAY_S
				)
			end
		end,
		2
	)
	cm:callback(
		function()
			cm:show_advice(
				tut.advisor_texts.turn_4.v2_auto_resolve_pract.advice_key,
				false,
				false,
				function ()
					cm:hide_advisor_without_infotexts()
				end,
				tut.ADVICE_DURATION_S,
				3
			)
		end,
		1
	)
	cm:callback(
		function()
			t4_highlight_balance_of_power(nil, false)
			cm:callback(
				function()
					tut_highlight_pre_battle_autoresolve(true)
				end,
				0.5
			)
		end,
		8
	)

	core:add_listener(
		"FTUE_popup_battle_results_opened",
		"PanelOpenedCampaign",
		function(context) return context.string == "popup_battle_results" end,
		function(context)
			cm:dismiss_advice()
			cm:progress_on_post_battle_panel_visible(
				function()								
					uim:highlight_post_battle_options(true)
					cm:clear_infotext()
				end,
				2
			)
		end,
		false
	)

	t4_start_sukkot_army_3_battle_completed_sequence()
end;


function t4_start_sukkot_army_3_battle_completed_sequence()
	uim:override("saving"):lock()
	core:add_listener(
		"FTUE_advanced_tutorial_battle_completed",
		"BattleCompletedPostModelNotify",
		function(context)
			local char_ramesses = cm:get_character_by_fm_cqi(tut.player_faction_leader_fm_cqi)
			return cm:pending_battle_cache_char_is_attacker(char_ramesses) and cm:turn_number() == 4
		end,
		function(context)
			cm:dismiss_advice()

			if context:pending_battle():attacker_won() then		
				-- a salute to our 420 checkpoint, lost to the battle with prickly bugs									
				t4_post_battle_victory()
			else
				script_error("ERROR: attacker lost the advanced battle tutorial")
			end
		end,
		false
	)
end


function t4_post_battle_victory()
	local sukkot_hero_2 = cm:char_lookup_str_fm(tut.sukkot_hero_2_fm_cqi)
	if sukkot_hero_2 then
		cm:kill_character_and_commanded_unit(sukkot_hero_2, true)
	end
	local sukkot_hero_3 = cm:char_lookup_str_fm(tut.sukkot_hero_3_fm_cqi)
	if sukkot_hero_3 then
		cm:kill_character_and_commanded_unit(sukkot_hero_3, true)
	end
	--cm:scroll_camera_from_current(true, tut.SCROLL_CAMERA_DURATION_S, {430.787933, 680.765808, 15.732786, -0.311119, 9.501221})
	local ramesses_cqi = cm:get_character_by_fm_cqi(tut.player_faction_leader_fm_cqi):command_queue_index()
	cm:disable_movement_for_character("character_cqi:" .. ramesses_cqi)
	
	cm:show_advice(
		tut.advisor_texts.turn_4.v2_capture_region_ambition_1_mern.advice_key,
		false,
		false,
		function ()
			cm:hide_advisor_without_infotexts()
			cm:show_advice(
				tut.advisor_texts.turn_4.v2_capture_region_ambition_2_pract.advice_key,
				false,
				false,
				function ()
					cm:hide_advisor_without_infotexts()
					t4_ambitions()
				end,
				tut.ADVICE_DURATION_S
			)
		end,
		tut.ADVICE_DURATION_S
	)
end

--
-- Ambition Issued
--

function t4_ambitions()
	cm:show_advice(
		tut.advisor_texts.turn_4.v2_capture_region_3_mern.advice_key,
		false,
		false,
		function ()
			cm:hide_advisor_without_infotexts()
		end,
		tut.ADVICE_DURATION_S
	)
	tut_add_infotext(tut.advisor_texts.turn_4.v2_capture_region_3_mern.infotext)

	ambitions.generate_specific_ambitions_with_intervention(tut.player_faction_key, {"phar_tutorial_ambition_2_capture_sukkot"})
	
	tut_ambitions_highlight("FTUE_T4_Ambition_Highlight_Wait")

	core:add_listener(
		"FTUE_AmbitionSelected_2",
		"MissionIssued",
		function(context)
			return context:mission():mission_record_key() == "phar_tutorial_ambition_2_capture_sukkot"
		end,
		function()
			t4_capture_settlement_objective()
		end,
		false
	)
end

function t4_capture_settlement_objective()
	uim:override("end_turn"):lock()
	--Needed since ambitions override saving
	cm:callback(
		function()
			--uim:set_all_overrides_allowed()
			uim:override("saving"):set_allowed(true);
			uim:override("saving"):lock()

			uim:override("end_turn"):lock()
		end,
		0.1
	)
	local ramesses_cqi = cm:get_character_by_fm_cqi(tut.player_faction_leader_fm_cqi):command_queue_index()
	--cm:disable_movement_for_character("character_cqi:" .. ramesses_cqi)
	t4_settlement_attacked_listener()
	cm:set_objective(tut.advisor_texts.turn_4.v2_capture_region_3_mern.capture_sukkot_objective)

	local ramesses = cm:get_character_by_fm_cqi(tut.player_faction_leader_fm_cqi)
	if not uim:is_char_selected(ramesses) then
		uim:highlight_character_for_selection(
			ramesses,
			function()
				t4_highlight_enemy_setttlement()
			end
		)
	else
		t4_highlight_enemy_setttlement()
	end
end

function t4_highlight_enemy_setttlement()
	uim:highlight_settlement(
		"settlement:" .. tut.sukkot,
		"move_to_vfx"
	)
	local ramesses_cqi = cm:get_character_by_fm_cqi(tut.player_faction_leader_fm_cqi):command_queue_index()
	cm:enable_movement_for_character("character_cqi:" .. ramesses_cqi)
	cm:notify_on_character_movement(
		"Notify Ramesses movement turn 4",
		ramesses_cqi,
		function()
			uim:unhighlight_settlement("settlement:" .. tut.sukkot, true)
			cm:attack_region("character_cqi:" .. ramesses_cqi, tut.sukkot)
			cm:disable_movement_for_character("character_cqi:" .. ramesses_cqi)
		end
	)
	
end


function t4_settlement_attacked_listener()
	core:add_listener(
		"FTUE_FirstSettlementAttacked",
		"PanelOpenedCampaign",
		function(context) 
			local pending_battle = cm:model():pending_battle()
			return --not tn_listeners_triggered.major_settlement_attacked.occured and
			context.string == "popup_pre_battle"
			and	pending_battle:attacker():faction():name() == tut.player_faction_key
			and pending_battle:has_contested_garrison()
			and not pending_battle:is_major_settlement_battle()
		end,
		function()
			cm:callback(
				function()
					tut_highlight_pre_battle_attack(true)
					tut_highlight_pre_battle_autoresolve(true)
				end,
				1
			)
			cm:checkpoint_reached(
				430,														-- checkpoint id
				function()												-- post-update callback
					t4_start_sukkot_pre_battle_checkpoint()
				end,
				tut.SHOULD_SAVE_EVERY_CHECKPOINT_MID,				-- should save game
				tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or false			-- always generate named savegame, rather than autosaving
			)
		end,
		false
	)
end

--------------------------------------------------------------------------------------------------
-- CHECKPOINT 430: Turn 4 Battle for Sukhot
--------------------------------------------------------------------------------------------------

local checkpoint_430_str = common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_settlement")

cm:add_checkpoint( 
	430,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		core:progress_on_loading_screen_dismissed(t4_start_sukkot_pre_battle_checkpoint)
	end,
	false,													-- call function when checkpoint reached
	checkpoint_430_str							-- opt string name
)

function t4_start_sukkot_pre_battle_checkpoint()
	core:add_listener(
		"FTUE_PanelSettlementCapturedOpened",
		"PanelOpenedCampaign",
		function(context) return context.string == "settlement_captured" end,
		function(context)
			cm:set_saved_value("settlement_occupation_option_have_triggered", true)
			cm:clear_infotext()
			-- Caution the line below is for highlighting settlement occupation options
			highlight_visible_component(true, true, "settlement_captured", "button_parent", "1484042895", "option_button")
			cm:show_advice(
				tut.advisor_texts.turn_4.v2_settlement_captured_pract.advice_key,
				false,
				false,
				function()
					cm:hide_advisor_without_infotexts()
				end,
				tut.ADVICE_DURATION_S,
				2
			)
			tut_add_infotext(tut.advisor_texts.turn_4.v2_settlement_captured_pract.infotext)
			cm:complete_objective(tut.advisor_texts.turn_4.v2_capture_region_3_mern.capture_sukkot_objective)
		end,
		false
	)
	core:add_listener(
		"FTUE_SukkotSettlementCaptured",
		"BattleCompletedPostModelNotify",
		function(context)
			local char_ramesses = cm:get_character_by_fm_cqi(tut.player_faction_leader_fm_cqi)
			return cm:pending_battle_cache_char_is_attacker(char_ramesses) and cm:turn_number() == 4
		end,
		function(context)
			uim:override("saving"):unlock()
			cm:stop_notify_on_character_movement("Notify Ramesses movement turn 4")
			-- callback is needed, otherwise this advice doesn't trigger
			cm:callback(
				function()
					cm:show_advice(
						tut.advisor_texts.turn_4.v2_sukhot_army_2_battle_won_pract.advice_key,
						false,
						false,
						function()
							cm:hide_advisor_without_infotexts()
						end,
						tut.ADVICE_DURATION_S
					)
					tut_add_infotext(tut.advisor_texts.turn_1.v2_end_turn_pract.infotext)
				end,
				2
			)
			
			cm:callback(
				function()
					cm:remove_objective(tut.advisor_texts.turn_4.v2_capture_region_3_mern.capture_sukkot_objective)
				end,
				4
			)

			local ramesses_cqi = cm:get_character_by_fm_cqi(tut.player_faction_leader_fm_cqi):command_queue_index()
			cm:enable_movement_for_character("character_cqi:" .. ramesses_cqi)
			
			t4_start_sukkot_settlement_captured_checkpoint()
		end,
		false
	)
end

function t4_start_sukkot_settlement_captured_checkpoint()
	cm:checkpoint_reached(
		440,														-- checkpoint id
		function()												-- post-update callback
			t4_end_turn_setup_sukkot_diplomacy_listener()
			t4_end_turn()
		end,
		tut.SHOULD_SAVE_EVERY_CHECKPOINT_START_END,				-- should save game
		tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or true			-- always generate named savegame, rather than autosaving
	)
end

--------------------------------------------------------------------------------------------------
-- CHECKPOINT 440: Sukkot Conquered
--------------------------------------------------------------------------------------------------

local checkpoint_440_str = common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_settlement_captured")

cm:add_checkpoint( 
	440,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		core:progress_on_loading_screen_dismissed(t4_end_turn)
	end,
	false,													-- call function when checkpoint reached
	checkpoint_440_str							-- opt string name
)

cm:add_checkpoint_setup_callback(
	440,														-- checkpoint id to add setup callback
	function(is_loading_game, checkpoint_id)				-- setup function
		t4_end_turn_setup_sukkot_diplomacy_listener()
	end,
	false													-- call function when checkpoint reached
)


function t4_end_turn_setup_sukkot_diplomacy_listener()
	if not t4_listeners_triggered.sukkot_proposed_peace then
		core:add_listener(
			"Sukkot_DiplomacyNegotiationInitialised",
			"DiplomacyNegotiationInitialised",
			function(context)
				local peace_offer_uic = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown", "offers_panel", "offers_list_panel", "common_offers", "common_list", "list_clip", "list_box", "diplomatic_option_peace")
				return context.string == tut.sukhot_faction_key and peace_offer_uic
			end,
			function(context)
				local turn = cm:turn_number()
				cm:set_saved_value("sukkot_proposed_peace", turn)

				cm:callback(
					function()
						cm:show_advice(
							tut.advisor_texts.turn_4.v2_diplomatic_offer_1_ram.advice_key,
							false,
							false,
							function()
								cm:hide_advisor_without_infotexts()
								cm:show_advice(
									tut.advisor_texts.turn_4.v2_diplomatic_offer_2_mern.advice_key,
									false,
									false,
									function()
										cm:hide_advisor_without_infotexts()
										local accept_decline_buttons_uic = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown", "offers_panel", "offers_list_panel", "offers_submenu", "offers_buttons_list_1")
										if accept_decline_buttons_uic then
											accept_decline_buttons_uic:Highlight(true, true)
											
											core:add_listener(
												"FTUE_CancelHighlight",
												"DiplomacyNegotiationInitialised",
												function(context)
													return true
												end,
												function(context)
													local accept_decline_buttons_uic = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown", "offers_panel", "offers_list_panel", "offers_submenu", "offers_buttons_list_1")
													if accept_decline_buttons_uic then
														accept_decline_buttons_uic:Highlight(false, false)
													end
												end,
												false
											)

											-- Uncomment and delete above listener incase we want to immediately remove the highlight
											--[[ core:add_listener(
												"FTUE_RemoveHighlight_PeaceDeclined",
												"DiplomaticOfferRejected",
												function(context)
													return true
												end,
												function(context)
													core:remove_listener("FTUE_RemoveHighlight_PeaceAccepted")
													local accept_decline_buttons_uic = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown", "offers_panel", "offers_list_panel", "offers_submenu", "offers_buttons_list_1")
													if accept_decline_buttons_uic then
														accept_decline_buttons_uic:Highlight(false, false)
													end
												end,
												false
											)
											core:add_listener(
												"FTUE_RemoveHighlight_PeaceAccepted",
												"PositiveDiplomaticEvent",
												function(context)
													return true
												end,
												function(context)
													core:remove_listener("FTUE_RemoveHighlight_PeaceDeclined")
													local accept_decline_buttons_uic = find_uicomponent(core:get_ui_root(), "diplomacy_dropdown", "offers_panel", "offers_list_panel", "offers_submenu", "offers_buttons_list_1")
													if accept_decline_buttons_uic then
														accept_decline_buttons_uic:Highlight(false, false)
													end
												end,
												false
											) ]]
										end
									end,
									tut.ADVICE_DURATION_S
								)
							end,
							tut.ADVICE_DURATION_S
						)
						tut_add_infotext(tut.advisor_texts.turn_4.v2_diplomatic_offer_1_ram.infotext)
					end,
					1
				)
				
			end, 
			false
		)
	end
end


function t4_end_turn()
	-- decrease player's movement speed to not enable them to reach neb_gehes.
	local ramesses = cm:get_character_by_cqi(tut.player_faction_leader_fm_cqi)
	local bundle_key = "phar_main_effect_bundle_tutorial_campaign_movement"
	local effect_value = -33
	local effect_key = "troy_effect_hero_campaign_campaign_movement" 
	local bundle = cm:create_new_custom_effect_bundle(bundle_key)
	bundle:add_effect(effect_key, "general_to_force_own", effect_value)

	--Apply bonus just for the current turn, in case an introduces an issue in the following steps of the tutorial
	bundle:set_duration(3)
	cm:apply_custom_effect_bundle_to_character(bundle, ramesses)

	cm:callback(
		function()
			cm:instantly_dismantle_building_in_region(
				tut.sukkot,
				2,
				true,
				true
			)
			cm:instantly_dismantle_building_in_region(
				tut.sukkot,
				3,
				true,
				true
			)
			cm:instantly_dismantle_building_in_region(
				tut.sukkot,
				4,
				true,
				true
			)
		end,
		1
	)

	cm:dismiss_advice()
	cm:clear_infotext()

	cm:callback(
		function()
			end_turn_highlight()
		end,
		4
	)
	
	core:add_listener(
		"FTUE_FactionTurnEnd_4",
		"FactionTurnEnd",
		function(context) return context:faction():name() == tut.player_faction_key and cm:turn_number() == 4 end,
		function(context)
			-- cm:create_force_with_general(
			-- 	tut.sukhot_faction_key,
			-- 	"phar_main_nat_wes_libu_tribesmen",
			-- 	"phar_main_east_sinai_beersheba",
			-- 	570,
			-- 	933,
			-- 	"general",
			-- 	"phar_main_general_canaan",
			-- 	"names_name_1970331280",
			-- 	"",
			-- 	"",
			-- 	"",
			-- 	false,
			-- 	function(cqi)
			-- 		local character = cm:get_character_by_cqi(cqi)
			-- 		local fm_cqi = character:family_member():command_queue_index()
			-- 		cm:set_saved_value("sukkot_hero_5_fm_cqi", fm_cqi)
			-- 		tut.sukkot_hero_5_fm_cqi = fm_cqi

			-- 		cm:add_unit_model_overrides(cm:char_lookup_str_fm(tut.sukkot_hero_5_fm_cqi), "phar_main_bodyguard_hero_can_gen_khopesh_medium_small")
			-- 		local general_unit_cqi = character:commanded_unit():command_queue_index()
			-- 		cm:upgrade_unit(general_unit_cqi, "phar_main_bodyguard_can_gen_khopesh_medium_small")
			-- 	end
			-- )
			tut_skip_sukhot_faction_turns(false)
		end,
		false
	)

	-- core:add_listener(
	-- 	"FTUE_SukhotFactionTurnStart_4",
	-- 	"FactionBeginTurnPhaseNormal",
	-- 	function(context) return context:faction():name() == tut.sukhot_faction_key and cm:turn_number() == 4 end,
	-- 	function(context)
			
	-- 	end,
	-- 	false
	-- )
	
	cm:force_change_cai_faction_personality(tut.sukhot_faction_key, "phar_main_tutorial_peace")
	cm:disable_movement_for_faction(tut.sukhot_faction_key)
	t5_start_listener()
end