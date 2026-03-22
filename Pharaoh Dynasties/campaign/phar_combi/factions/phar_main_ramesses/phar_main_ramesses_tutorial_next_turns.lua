tn_listeners_triggered = {
	colonize_settlement_2 = cm:get_saved_value("colonize_settlement_2"),
	settlement_conquered = cm:get_saved_value("minor_settlement_conquered"),
	major_settlement_attacked = cm:get_saved_value("major_settlement_attacked"),
	major_settlement_conquered = cm:get_saved_value("major_settlement_occupation_option_performed"),
	hero_recruited = cm:get_saved_value("hero_recruited"),
	legitimacy_onboarding = cm:get_saved_value("legitimacy_onboarding"),
	legitimacy_onboarding_ended = cm:get_saved_value("legitimacy_onboarding_ended"),
	legitimacy_war = cm:get_saved_value("legitimacy_war"),
	legitimacy_war_ended = cm:get_saved_value("legitimacy_war_ended"),
	friendly_ers_passed = cm:get_saved_value("friendly_ers_passed"),
	ramesses_died = cm:get_saved_value("ramesses_died"),
	per_amun_conquered = cm:get_saved_value("per_amun_conquered"),
	siege_equipment_in_construction = cm:get_saved_value("siege_equipment_in_construction"),
	court_unlocked = cm:get_saved_value("court_unlocked")
}

--------------------------------------------------------------------------------------------------
-- CHECKPOINT 1000: Legitimacy onboarding start
--------------------------------------------------------------------------------------------------

local checkpoint_1000_str = common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_legitimacy")

cm:add_checkpoint( 
	1000,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		if not tn_listeners_triggered.legitimacy_onboarding then
			return
		end
		if cm:turn_number() == tn_listeners_triggered.legitimacy_onboarding then
			core:progress_on_loading_screen_dismissed(tn_legitimacy_onboarding_start_intervention)
		end
	end,
	false,													-- call function when checkpoint reached
	checkpoint_1000_str										-- opt string name
)


cm:add_checkpoint_setup_callback(
	1000,														-- checkpoint id to add setup callback
	function(is_loading_game, checkpoint_id)				-- setup function
		tn_legitimacy_onboarding_start_setup()
	end,
	false													-- call function when checkpoint reached
)

--------------------------------------------------------------------------------------------------
-- CHECKPOINT 1010: Own multiple regions
--------------------------------------------------------------------------------------------------

local checkpoint_1010_str = common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_regions")

cm:add_checkpoint( 
	1010,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		tn_own_multiple_settlements_start()
	end,
	false,													-- call function when checkpoint reached
	checkpoint_1010_str										-- opt string name
)


cm:add_checkpoint_setup_callback(
	1010,														-- checkpoint id to add setup callback
	function(is_loading_game, checkpoint_id)				-- setup function
		tn_own_multiple_settlements()
	end,
	false													-- call function when checkpoint reached
)

--------------------------------------------------------------------------------------------------
-- CHECKPOINT 1020: Vast ambition of conquest
--------------------------------------------------------------------------------------------------

local checkpoint_1020_str = common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_vast_ambitions")

cm:add_checkpoint(
	1020,														
	function(is_loading_game, checkpoint_id)
		tn_own_multiple_settlements_advice_next_checkpoint_on_load()
	end,
	false,
	checkpoint_1020_str
)

--------------------------------------------------------------------------------------------------
-- CHECKPOINT 1100: Legitimacy war start
--------------------------------------------------------------------------------------------------

local checkpoint_1100_str = common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_war_start")

cm:add_checkpoint( 
	1100,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		tn_legitimacy_war_onboarding_start_intervention()
	end,
	false,													-- call function when checkpoint reached
	checkpoint_1100_str										-- opt string name
)


cm:add_checkpoint_setup_callback(
	1100,														-- checkpoint id to add setup callback
	function(is_loading_game, checkpoint_id)				-- setup function
		tn_legitimacy_war_onboarding_1()
	end,
	false													-- call function when checkpoint reached
)

local checkpoint_1110_str = common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_war_join")

cm:add_checkpoint( 
	1110,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		
	end,
	false,													-- call function when checkpoint reached
	checkpoint_1110_str										-- opt string name
)

local checkpoint_1120_str = common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_war_end")

cm:add_checkpoint( 
	1120,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		
	end,
	false,													-- call function when checkpoint reached
	checkpoint_1120_str										-- opt string name
)

--TODO: Add an on-load sequence adding listeners based on the saved_values


function tn_add_relevant_listeners_on_load()
	core:add_listener(
		"FTUE_PlayAllFactionTurns",
		"FactionTurnStart",
		function(context)
			return context:faction():name() == tut.player_faction_key
			and cm:turn_number() >= 20
		end,
		function(context)
			tut_skip_all_but_player_turns(false)
			tut_set_skip_faction_turns(tut.merneptah_faction_key, true)
		end,
		false
	)

	if not tn_listeners_triggered.major_settlement_attacked then
		core:add_listener(
			"FTUE_FirstMajorSettlementAttacked",
			"PanelOpenedCampaign",
			function(context) 
				local pending_battle = cm:model():pending_battle()
				return --not tn_listeners_triggered.major_settlement_attacked and
				context.string == "popup_pre_battle"
				and	pending_battle:battle_type() == "settlement_standard" 
				and	pending_battle:attacker():faction():name() == tut.player_faction_key
				and pending_battle:has_contested_garrison()
				and pending_battle:is_major_settlement_battle()
			end,
			function(context)
				local pending_battle = cm:model():pending_battle()
				local region = pending_battle:region():name()
				local turn = cm:turn_number()

				cm:set_saved_value("major_settlement_attacked_name", region)
				tn_listeners_triggered.major_settlement_attacked_name = region

				cm:set_saved_value("major_settlement_attacked", turn)
				tn_listeners_triggered.major_settlement_attacked = turn

				cm:clear_infotext()
				cm:show_advice(
					tut.advisor_texts.next_turns.v2_practical_advisor_siege.advice_key,
					true,
					false,
					function ()
						cm:hide_advisor_without_infotexts()
						tn_show_labour()
					end,
					tut.ADVICE_DURATION_S
				)
				core:add_listener(
					"FTUE_SiegeEquipmentInConstruction",
					"ComponentLClickUp",
					function(context) 
						return uicomponent_descended_from(UIComponent(context.component), "construction_options")
					end,
					function(context)
						local turn = cm:turn_number()
						tn_listeners_triggered.siege_equipment_in_construction = turn
						cm:set_saved_value("siege_equipment_in_construction", turn)
						tn_start_siege_equipment_in_construction_advice()
					end,
					false
				)
				
			end,
			false
		)
	end

	local turn = cm:turn_number()
	if not tn_listeners_triggered.major_settlement_attacked or
	(tn_listeners_triggered.major_settlement_attacked and 
	 tn_listeners_triggered.major_settlement_attacked + 1 >= turn) then
		core:add_listener(
			"FTUE_FactionTurnStartAfterSiegeIsInitiated",
			"FactionTurnStart",
			function(context) return tn_listeners_triggered.major_settlement_attacked and context:faction():name() == tut.player_faction_key and cm:turn_number() == tn_listeners_triggered.major_settlement_attacked + 1 end,
			function(context)
				tn_highlight_character_to_attack_settlement()
			end,
			false
		)
		if tn_listeners_triggered.major_settlement_attacked and core:is_loading_screen_visible()
				and turn == tn_listeners_triggered.major_settlement_attacked + 1 then
			core:progress_on_loading_screen_dismissed(
				function()
					tn_highlight_character_to_attack_settlement()
				end
			)
		end

		core:add_listener(
			"FTUE_FirstMajorSettlementAttacked_2",
			"PanelOpenedCampaign",
			function(context) 
				local pending_battle = cm:model():pending_battle()
				return context.string == "popup_pre_battle"
				and tn_listeners_triggered.major_settlement_attacked
				and cm:turn_number() == tn_listeners_triggered.major_settlement_attacked + 1
				and	pending_battle:battle_type() == "settlement_standard" 
				and	pending_battle:attacker():faction():name() == tut.player_faction_key
				and pending_battle:is_major_settlement_battle()
				and pending_battle:has_contested_garrison()
				and pending_battle:contested_garrison():can_assault()
			end,
			function(context)
				tut_highlight_pre_battle_attack(true)
				tut_highlight_pre_battle_autoresolve(true)
				local button_attack = find_uicomponent(core:get_ui_root(), "popup_pre_battle", "battle_deployment", "button_attack")
				local ap = active_pointer:new(
					"show_attack_button",
					"bottomright",
					function()
						return button_attack
					end,
					"ui_text_replacements_localised_text_phar_text_pointer_show_attack_button",
					0.5,
					0,
					nil,
					true
				)
				ap:set_auto_hide_time(tut.TEXT_POINTER_DURATION_S)
				cm:callback(
					function()
						local pre_battle_panel = find_uicomponent(core:get_ui_root(), "popup_pre_battle")
						if pre_battle_panel and pre_battle_panel:Visible() then
							ap:show_when_ready()
						end
					end,
					tut.NEXT_ADVICE_DELAY_S
				)
				
			end,
			false
		)
	end

	if not tn_listeners_triggered.major_settlement_conquered then
		core:add_listener(
			"FTUE_MajorSettlementCaptured",
			"CharacterPerformsSettlementOccupationDecision",
			function(context) 
				return context:garrison_residence():model():pending_battle():is_major_settlement_battle()
				and context:character():faction():name() == tut.player_faction_key 
			end,
			function(context)
				cm:set_saved_value("major_settlement_occupation_option_performed", cm:turn_number())
				-- We can add stuff here potentially
			end,
			false
		)
	end
	if not tn_listeners_triggered.colonize_settlement_2  then
		--EXISTS IN SCRIPTED PART OF TUTORIAL. MAYBE REMOVE?
		core:add_listener(
			"FTUE_panel_settlement_colonization_opened",
			"PanelOpenedCampaign",
			function(context)
				if not context.string == "settlement_captured" then
					return false
				end
				local uic_colonize = find_uicomponent(core:get_ui_root(), "settlement_captured", "button_parent",  "1594293392")
				return uic_colonize and cm:turn_number() >= 8 end,
			function(context)
				cm:set_saved_value("colonize_settlement_2", cm:turn_number())
				cm:dismiss_advice()
				cm:clear_infotext()
				cm:show_advice(
					tut.advisor_texts.next_turns.v2_colonize_1_mern.advice_key,
					true,
					false,
					function()
						cm:show_advice(
							tut.advisor_texts.next_turns.v2_colonize_2_pract.advice_key,
							true,
							false,
							function()
								cm:hide_advisor_without_infotexts()
							end,
							tut.ADVICE_DURATION_S
						)
					end,
					tut.ADVICE_DURATION_S,
					2
				)
				core:add_listener(
					"FTUE_SettlementColonized",
					"CharacterPerformsSettlementOccupationDecision",
					function(context) 
						return context:occupation_decision_option() == "occupation_decision_colonise"
							and context:character():faction():name() == tut.player_faction_key 
					end,
					function(context)
						cm:show_advice(
							tut.advisor_texts.next_turns.v2_colonize_3_ram.advice_key,
							true,
							false,
							function()
								cm:hide_advisor_without_infotexts()
							end,
							tut.ADVICE_DURATION_S
						)
					end,
					false
				)
				
			end,
			false
		)
	end
	if not tn_listeners_triggered.settlement_conquered then
		core:add_listener(
			"FTUE_SettlementCaptured",
			"CharacterPerformsSettlementOccupationDecision",
			function(context)
				return context:character():faction():name() == tut.player_faction_key 
				and cm:turn_number() >= 8
				and not context:garrison_residence():model():pending_battle():is_major_settlement_battle()
			end,
			function(context)
				cm:set_saved_value("minor_settlement_conquered", cm:turn_number())
				cm:clear_infotext()
				cm:show_advice(
					tut.advisor_texts.next_turns.v2_merneptah_conquered_first_settlement.advice_key,
					true,
					false,
					function()
						cm:hide_advisor_without_infotexts()
						--After this advice tut.add.start_competency_points_advice_listeners() triggers in tutorial_additional
					end,
					tut.ADVICE_DURATION_S,
					2
				)
			end,
			false
		)
	end


	if not tn_listeners_triggered.legitimacy_onboarding then
		core:add_listener(
			"FTUE_SEL_Aquired",
			"RegionFactionChangeEvent", -- change with completetion of relevant ambition
			function(context)
				local region = context:region()
				if region:province_name() == tut.north_sinai_province then
					return
				end
				return region:owning_faction():name() == tut.player_faction_key 
					and sacred_egypt_lands[region:name()]
			end,
			function(context)
				local legitimacy_onboarding_turn = cm:turn_number() + 1
				if legitimacy_onboarding_turn < 12 then
					legitimacy_onboarding_turn = 12
				end
				tut_set_legitimacy_onboarding_turn_for_tutorial(legitimacy_onboarding_turn)
				tn_listeners_triggered.legitimacy_onboarding = legitimacy_onboarding_turn
				cm:set_saved_value("legitimacy_onboarding", legitimacy_onboarding_turn)
			end,
			false
		)

		tn_set_legitimacy_onboarding_listener()
	elseif tn_listeners_triggered.legitimacy_onboarding >= cm:turn_number() then
		tn_set_legitimacy_onboarding_listener()
	end

	if tn_listeners_triggered.court_unlocked then
		uim:override("hide_court"):unlock()
		uim:override("hide_ruling_family_dynasty"):unlock()
	end


	if not tn_listeners_triggered.legitimacy_war then
		core:add_listener(
            "FTUE_FactionTurnStartLegitimacyWar",
            "FactionTurnStart",
            function(context) 
				return cm:get_bool_script_state(egypt_political_states.shared_states_suffixed.legitimacy_war)
					and context:faction():name() == tut.player_faction_key
			end,
			function(context)
				cm:checkpoint_reached(
					1100,														-- checkpoint id
					function()												-- post-update callback
						tn_legitimacy_war_onboarding_start_intervention()
					end,
					tut.SHOULD_SAVE_EVERY_CHECKPOINT_MID,				-- should save game
					tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or false			-- always generate named savegame, rather than autosaving
				)
				
			end,
			false
		)
	end

	if tn_listeners_triggered.legitimacy_war then
		tn_legitimacy_war_end_listener()
	end
	if tn_listeners_triggered.legitimacy_war_ended then
		core:remove_listener("FTUE_FactionTurnStartLegitimacyWarEnd")
		pillars_civilization.set_is_hidden_by_ui_override(false);
	end

	if not tn_listeners_triggered.ramesses_died then
		core:add_listener(
			"FTUE_Ramesses_Killed",
			"FactionCharacterDiedOrWounded",
			function(context) return context:family_member():command_queue_index() == tut.player_faction_leader_fm_cqi end,
			function(context)
				cm:set_saved_value("ramesses_died", cm:turn_number())
				local ramesses = cm:get_character_by_fm_cqi(tut.player_faction_leader_fm_cqi)
		
				local died_x = ramesses:logical_position_x()
				local died_y = ramesses:logical_position_y()
		
				-- Wait a second before attempting to respawn the character, as respawning him now, as he's being destroyed, will cause a crash
				cm:callback(
					function()
						local ramesses = cm:get_character_by_fm_cqi(tut.player_faction_leader_fm_cqi);
						local ramesses_str = cm:char_lookup_str(ramesses);
		
						local new_x, new_y = cm:find_valid_spawn_location_for_character_from_position(
							tut.player_faction_key,
							died_x,
							died_y,
							true,
							5
						)
						cm:respawn_convalescing_agent(
							tut.player_faction_key,
							new_x,
							new_y,
							ramesses_str,
							function()
								
							end
						)
						local region_died_name = cm:model():world():region_data_at_position(new_x, new_y):region():name()
						
						core:add_listener(
							"FTUE_Ramesses_Respawned_After_Death",
							"BattleCompleted",
							function(context) 
								return cm:pending_battle_cache_faction_is_involved(tut.player_faction_key)
							end,
							function(context)
								local ramesses = cm:get_character_by_fm_cqi(tut.player_faction_leader_fm_cqi)
								cm:scroll_camera_to_character(ramesses:command_queue_index(), 5)
								cm:clear_infotext()
								cm:show_advice(
									tut.advisor_texts.next_turns.phar_main_tutorial_v2_ramesses_respawned_ram.advice_key,
									true,
									false,
									function()
										cm:hide_advisor_without_infotexts()
									end,
									tut.ADVICE_DURATION_S
								)
								
								local pb = context:model():pending_battle()
								local player_faction_key = tut.player_faction_key
								local is_the_entire_ramesses_army_annihilated = 
									(cm:pending_battle_cache_faction_is_attacker(player_faction_key) and pb:percentage_of_attacker_killed() == 1) 
									or (cm:pending_battle_cache_faction_is_defender(player_faction_key) and pb:percentage_of_defender_killed() == 1) 

								if is_the_entire_ramesses_army_annihilated then
									cm:create_force_with_existing_general(
										ramesses_str,
										tut.player_faction_key,
										"phar_main_fac_ram_medjai_archers",
										region_died_name,
										new_x,
										new_y,
										function(cqi)
											--mf_cqi = cqi
										end
									)
								end
							end,
							false
						)
						-- Add a listener for advice when Ramesses is wounded
					end,
					1
				)
			end,
			true
		)
	end

	if not tn_listeners_triggered.per_amun_conquered then
		core:add_listener(
			"FTUE_PlayerConqueredPerAmun",
			"RegionFactionChangeEvent",
			function(context)
				local region = context:region()
				return region:name() == tut.per_amun
				and region:owning_faction():name() == tut.player_faction_key
			end,
			function(context)
				local turn = cm:turn_number()
				tn_listeners_triggered.per_amun_conquered = turn
				cm:set_saved_value("per_amun_conquered", turn)

				local player_faction = cm:get_faction(tut.player_faction_key)
				cm:remove_forced_occupation_decision_restrictions_for_faction(player_faction)

				tut_set_skip_faction_turns(tut.pi_ramesses_faction_key, false)
				tn_enable_all_canaanite_factions()
			end,
			false
		)
	else
		local player_faction = cm:get_faction(tut.player_faction_key)
		cm:remove_forced_occupation_decision_restrictions_for_faction(player_faction)
	end
end


tut.all_canaanites_faction_keys = {
	"phar_main_alashiya",
	"phar_main_aleppo",
	"phar_main_amurru",
	"phar_main_ashkelon",
	"phar_main_bay",
	"phar_main_bay_separatists",
	"phar_main_beersheba",
	"phar_main_byblos",
	"phar_main_canaan_rebels",
	"phar_main_damascus",
	"phar_main_emar",
	"phar_main_habiru",
	"phar_main_hazor",
	"phar_main_hetch",
	"phar_main_irsu",
	"phar_main_irsu_separatists",
	"phar_main_megiddo",
	"phar_main_sakka",
	"phar_main_schechem",
	"phar_main_sukhot",
	"phar_main_timna",
	"phar_main_ugarit",
	"phar_main_urushalim",
}

function tn_enable_all_canaanite_factions()
	for i=1 ,#tut.all_canaanites_faction_keys do
		tut_set_skip_faction_turns(tut.all_canaanites_faction_keys[i], false)
	end
end


function tn_legitimacy_war_end_listener()
	core:add_listener(
		"FTUE_FactionTurnStartLegitimacyWarEnd",
		"FactionTurnStart",
		function(context) return cm:get_bool_script_state(egypt_political_states.shared_states_suffixed.legitimacy_war) == false end,
		function(context)
			cm:checkpoint_reached(
				1120,														-- checkpoint id
				function()												-- post-update callback
					tn_legitimacy_war_end_advice()
				end,
				tut.SHOULD_SAVE_EVERY_CHECKPOINT_MID,				-- should save game
				tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or false			-- always generate named savegame, rather than autosaving
			)
			
		end
	)
end

function tn_legitimacy_war_end_advice()
	local turn = cm:turn_number()
	tn_listeners_triggered.legitimacy_war_ended = turn
	cm:set_saved_value("legitimacy_war_ended", turn)
	pillars_civilization.set_is_hidden_by_ui_override(false);

	-- TODO: add legitimacy war end content
end


function tn_legitimacy_war_onboarding_start_intervention()
	cm:trigger_transient_intervention(
		"tn_legitimacy_war_onboarding",				-- name
		function(inv)
			tn_legitimacy_war_onboarding_advice()
		end,										-- callback
		true,										-- debug output
		function(inv)
		end											-- config callback
	);
end


function tn_legitimacy_war_onboarding_advice()
	cm:callback(
		function()
			cm:clear_infotext()
			cm:show_advice(
				tut.advisor_texts.next_turns.practical_advisor_legitimacy_war_1.advice_key,
				true,
				false,
				function()
					cm:show_advice(
						tut.advisor_texts.next_turns.ramesses_legitimacy_war_2.advice_key,
						true,
						false,
						function()
							cm:show_advice(
								tut.advisor_texts.next_turns.practical_advisor_legitimacy_war_3.advice_key,
								true,
								false,
								function()
									cm:show_advice(
										tut.advisor_texts.next_turns.ramesses_legitimacy_war_4.advice_key,
										true,
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
				end,
				tut.ADVICE_DURATION_S
			)
		end,
		1
	)
	tn_legitimacy_war_onboarding_1()
end

function tn_legitimacy_war_onboarding_1()
	if not tn_listeners_triggered.legitimacy_war then
		egypt_legitimacy:add_legitimacy("phar_main_ramesses", "phar_legitimacy_court_intrigue", 80)
		local button_crown = find_uicomponent(core:get_ui_root(), "hud_campaign", "faction_widget_holder", "main_buttons", "button_fm_phar_pharaoh_crown")
		if button_crown then
			pulse_uicomponent(button_crown, true, 10)
		end
		cm:set_objective(tut.advisor_texts.next_turns.practical_advisor_legitimacy_war_1.open_crown_panel_objective)
		core:add_listener(
			"FTUE_LegitimacyPanelOpened",
			"PanelOpenedCampaign",
			function(context) 
				return context.string == "pharaohs_crown"
			end,
			function(context)
				local button_crown = find_uicomponent(core:get_ui_root(), "hud_campaign", "faction_widget_holder", "main_buttons", "button_fm_phar_pharaoh_crown")
				if button_crown then
					pulse_uicomponent(button_crown, false, 0, false, "active")
				end
				cm:complete_objective(tut.advisor_texts.next_turns.practical_advisor_legitimacy_war_1.open_crown_panel_objective)
				cm:remove_objective(tut.advisor_texts.next_turns.practical_advisor_legitimacy_war_1.open_crown_panel_objective)
		
				tn_legitimacy_war_onboarding_2()
			end,
			false
		)
	end
end

function tn_legitimacy_war_onboarding_2()
	local button_join_war = find_uicomponent(core:get_ui_root(), "pharaohs_crown", "pharaoh_screen", "your_legitimacy_holder", "button_join_war")
	if button_join_war then
		pulse_uicomponent(button_join_war, true)
	end
	cm:set_objective(tut.advisor_texts.next_turns.ramesses_legitimacy_war_2.join_legitimacy_war_objective)

	if cm:get_bool_script_state(cm:get_faction(tut.player_faction_key), egypt_political_states.shared_states.is_ruler_or_pretender) then
		cm:complete_objective(tut.advisor_texts.next_turns.ramesses_legitimacy_war_2.join_legitimacy_war_objective)
		cm:remove_objective(tut.advisor_texts.next_turns.ramesses_legitimacy_war_2.join_legitimacy_war_objective)

		cm:checkpoint_reached(
			1110,														-- checkpoint id
			function()												-- post-update callback
				
			end,
			tut.SHOULD_SAVE_EVERY_CHECKPOINT_MID,				-- should save game
			tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or false			-- always generate named savegame, rather than autosaving
		)
		local turn = cm:turn_number()
		cm:set_saved_value("legitimacy_war", turn)
		tn_listeners_triggered.legitimacy_war = turn

		cm:force_diplomacy("faction:" .. tut.seti_faction_key, "faction:" .. tut.player_faction_key, "war", true, true, true)
		cm:force_diplomacy("faction:" .. tut.tausret_faction_key, "faction:" .. tut.player_faction_key, "war", true, true, true)
		
		tn_legitimacy_war_end_listener()
		tut_complete_active_intervention()
	else
		core:add_listener(
			"FTUE_LegitimacyPicked",
			"ComponentLClickUp",
			function(context)
				return context.string == "button_join_war"
			end,
			function(context)
				cm:complete_objective(tut.advisor_texts.next_turns.ramesses_legitimacy_war_2.join_legitimacy_war_objective)
				cm:remove_objective(tut.advisor_texts.next_turns.ramesses_legitimacy_war_2.join_legitimacy_war_objective)
				local button_join_war = find_uicomponent(core:get_ui_root(), "pharaohs_crown", "pharaoh_screen", "your_legitimacy_holder", "button_join_war")
				if button_join_war then
					pulse_uicomponent(button_join_war, false, 0, false, "active")
				end
				cm:checkpoint_reached(
					1110,														-- checkpoint id
					function()												-- post-update callback
						
					end,
					tut.SHOULD_SAVE_EVERY_CHECKPOINT_MID,				-- should save game
					tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or false			-- always generate named savegame, rather than autosaving
				)
				local turn = cm:turn_number()
				cm:set_saved_value("legitimacy_war", turn)
				tn_listeners_triggered.legitimacy_war = turn

				cm:force_diplomacy("faction:" .. tut.seti_faction_key, "faction:" .. tut.player_faction_key, "war", true, true, true)
				cm:force_diplomacy("faction:" .. tut.tausret_faction_key, "faction:" .. tut.player_faction_key, "war", true, true, true)
				
				tn_legitimacy_war_end_listener()
				tut_complete_active_intervention()
			end,
			false
		)
	end
end

function tn_set_legitimacy_onboarding_listener()
	core:add_listener(
		"FTUE_StartLegitimacyOnboarding",
		"FactionTurnStart", -- change with completetion of relevant ambition
		function(context)
			return cm:turn_number() == tn_listeners_triggered.legitimacy_onboarding
		end,
		function(context)
			cm:checkpoint_reached(
				1000,														-- checkpoint id
				function()												-- post-update callback
					tn_legitimacy_onboarding_start_setup()
					tn_legitimacy_onboarding_start_intervention()
				end,
				tut.SHOULD_SAVE_EVERY_CHECKPOINT_MID,				-- should save game
				tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or false			-- always generate named savegame, rather than autosaving
			)
			
		end,
		false
	)
end

function tn_legitimacy_onboarding_start_setup()
	-- if tut.player_faction_key == cm:get_local_faction_name(true) then
	-- 	local crown_mechanic_button = find_uicomponent("fm_phar_pharaoh_crown_container")
	-- 	if crown_mechanic_button then
	-- 		crown_mechanic_button:SetVisible(true)
	-- 	end
	-- end
	uim:override("hide_power_of_the_crown"):unlock()
	local al_button = find_uicomponent(core:get_ui_root(), "hud_campaign", "faction_widget_holder", "faction_widget", "faction_widget_list", "main_buttons", "main_buttons_container", "fm_phar_ancient_legacies_container", "fm_phar_ancient_legacies_slot")
	al_button:SetVisible(true)

	--Unsuppress all the end turn warninges for the crown
	uim:suppress_end_turn_warning("phar_pharaohs_crown_path_not_selected", false)
	uim:suppress_end_turn_warning("phar_pharaohs_power_available", false)
	uim:suppress_end_turn_warning("phar_ancient_legacy_available", false)
	uim:suppress_end_turn_warning("phar_hatshepsut_expedition_ready_to_move", false)
	uim:suppress_end_turn_warning("phar_khufu_wonder_stage_available", false)
	uim:suppress_end_turn_warning("phar_thutmose_action_available", false)
	uim:suppress_end_turn_warning("phar_aten_devoted_hero_available", false)
	uim:suppress_end_turn_warning("phar_aten_unlockable_available", false)
end

function tn_legitimacy_onboarding_start_intervention()
	cm:callback(
		function()
			local crown_mechanic_button = find_uicomponent("fm_phar_pharaoh_crown_container")
			if crown_mechanic_button and not tn_listeners_triggered.legitimacy_onboarding_ended then
				crown_mechanic_button:SetVisible(false)
			end
		end,
		0.1
	)
	
	cm:trigger_transient_intervention(
		"tn_legitimacy_onboarding",					-- name
		function(inv)
			tn_legitimacy_onboarding_1()
		end,										-- callback
		true,										-- debug output
		function(inv)
		end											-- config callback
	);
end

function tn_legitimacy_onboarding_1()
	core:call_once(
		"legitimacy_advice_1",
		function()
			local crown_mechanic_button = find_uicomponent("fm_phar_pharaoh_crown_container")
			if crown_mechanic_button then
				crown_mechanic_button:SetVisible(false)
			end

			egypt_legitimacy:add_legitimacy("phar_main_ramesses", "phar_legitimacy_court_intrigue", -30)
			cm:set_saved_value("legitimacy_onboarding", cm:turn_number())

			local panel_opened = false
			cm:clear_infotext()

			local confirm_button_shemsu_hor
			cm:callback(
				function()
					confirm_button_shemsu_hor = find_uicomponent(core:get_ui_root(), "shemsu_hor_notification", "rectangle_plate", "button_confirm")
					if not confirm_button_shemsu_hor or not confirm_button_shemsu_hor:IsValid() then
						cm:callback(
							function()
								confirm_button_shemsu_hor = find_uicomponent(core:get_ui_root(), "shemsu_hor_notification", "rectangle_plate", "button_confirm")
								if not confirm_button_shemsu_hor or not confirm_button_shemsu_hor:IsValid() then
									core:remove_listener("FTUE_shemsu_hor_panel_confirm_button_clicked")
									tn_legitimacy_onboarding_1_display_advice_and_infotext()
								end
							end,
							1
						)
					end
				end,
				0.5
			)
			cm:callback(
				function()
					if confirm_button_shemsu_hor and confirm_button_shemsu_hor:IsValid() then
						confirm_button_shemsu_hor:Highlight(true, true)
					end
				end,
				15
			)
		
	
			core:add_listener(
				"FTUE_shemsu_hor_panel_confirm_button_clicked",
				"ComponentLClickUp",
				function(context)
					return true
				end,
				function(context)
					if not confirm_button_shemsu_hor or not confirm_button_shemsu_hor:IsValid() then
						return
					elseif context.string == confirm_button_shemsu_hor:Id() then
						tn_legitimacy_onboarding_1_display_advice_and_infotext(panel_opened)
					end
				end,
				false
			)
		end
	)
	
	core:add_listener(
		"FTUE_LegitimacyPanelOpened",
		"PanelOpenedCampaign",
		function(context) 
			return context.string == "pharaohs_crown"
		end,
		function(context)
			panel_opened = true
			local button_crown = find_uicomponent(core:get_ui_root(), "hud_campaign", "faction_widget_holder", "main_buttons", "button_fm_phar_pharaoh_crown")
			if button_crown then
				button_crown:Highlight(false,false)
				pulse_uicomponent(button_crown, false, 0, false, "active")
			end
			cm:complete_objective(tut.advisor_texts.next_turns.merneptah_advisor_legitimacy_1.open_legitimacy_objective)
			cm:remove_objective(tut.advisor_texts.next_turns.merneptah_advisor_legitimacy_1.open_legitimacy_objective)
	
			tn_legitimacy_onboarding_2()

			core:add_listener(
				"FTUE_LegitimacyPanelClosed",
				"PanelClosedCampaign",
				function(context) 
					return context.string == "pharaohs_crown"
				end,
				function(context)
					panel_opened = false
					local button_crown = find_uicomponent(core:get_ui_root(), "hud_campaign", "faction_widget_holder", "main_buttons", "button_fm_phar_pharaoh_crown")
					if button_crown then
						button_crown:Highlight(true,false)
						pulse_uicomponent(button_crown, true, 0, false, "active")
					end

					tn_legitimacy_onboarding_1()
				end,
				false
			)
		end,
		false
	)
	
end

function tn_legitimacy_onboarding_1_display_advice_and_infotext(panel_opened)
	
	cm:show_advice(
		tut.advisor_texts.next_turns.merneptah_advisor_legitimacy_1.advice_key,
		true,
		false,
		function()
			cm:hide_advisor_without_infotexts()
			local crown_mechanic_button = find_uicomponent("fm_phar_pharaoh_crown_container")
			if crown_mechanic_button then
				crown_mechanic_button:SetVisible(true)
			end
			local button_crown = find_uicomponent(core:get_ui_root(), "hud_campaign", "faction_widget_holder", "main_buttons", "button_fm_phar_pharaoh_crown")
			if button_crown and not panel_opened then
				button_crown:Highlight(true,false,0,true)
				pulse_uicomponent(button_crown, true, 10)
			end
			cm:set_objective(tut.advisor_texts.next_turns.merneptah_advisor_legitimacy_1.open_legitimacy_objective)
		end,
		tut.ADVICE_DURATION_S
	)

	tut_add_infotext(tut.advisor_texts.next_turns.merneptah_advisor_legitimacy_1.info_text);
end

function tn_legitimacy_onboarding_2()
	core:call_once(
		"legitimacy_advice_2",
		function()
			cm:show_advice(
				tut.advisor_texts.next_turns.merneptah_advisor_legitimacy_2.advice_key,
				true,
				false,
				function()
					cm:hide_advisor_without_infotexts()
				end,
				tut.ADVICE_DURATION_S
			)
		end
	)
	
	cm:set_objective(tut.advisor_texts.next_turns.merneptah_advisor_legitimacy_2.choose_legitimacy_objective)

	local forge_path = find_uicomponent(core:get_ui_root(), "pharaohs_crown", "legitimacy_choice", "cards_holder", "forge_path_card")
	if forge_path then
		forge_path:SetDisabled(true)
		forge_path:SetVisible(false)
	end

	local egyptian_land_ui = find_uicomponent(core:get_ui_root(), "pharaohs_crown", "legitimacy_choice", "lands_group_holder", "egypt_land")
	
	if egyptian_land_ui then
		egyptian_land_ui:Highlight(true, true)
		pulse_uicomponent(egyptian_land_ui, true)

		core:add_listener(
			"FTUE_power_of_crown_egyptian_land_selected",
			"ComponentLClickUp",
			function(context) 
				return context.string == egyptian_land_ui:Id() 
			end,
			function(context)
				egyptian_land_ui = find_uicomponent(core:get_ui_root(), "pharaohs_crown", "legitimacy_choice", "lands_group_holder", "egypt_land")
				egyptian_land_ui:Highlight(false, true)
				pulse_uicomponent(egyptian_land_ui, false)

				tn_legitimacy_onboarding_2_read_more()
			end,
			true
		)
		local hittite_land_ui = find_uicomponent(core:get_ui_root(), "pharaohs_crown", "legitimacy_choice", "lands_group_holder", "hittite_land")
		if hittite_land_ui then
			local read_more_button = find_uicomponent(core:get_ui_root(), "pharaohs_crown", "legitimacy_choice", "cards_holder", "hatti_card_front", "hatti_read_more_btn")
			read_more_button:SetDisabled(true)
			read_more_button:SetVisible(false)
		end
	else
		script_error("ERROR: Cannot find egypt_land component")
		tn_legitimacy_onboarding_2_read_more()
	end
end

function tn_legitimacy_onboarding_2_read_more()
	core:remove_listener("FTUE_power_of_crown_egyptian_land_selected")
	local read_more_button = find_uicomponent(core:get_ui_root(), "pharaohs_crown", "legitimacy_choice", "cards_holder", "egypt_card_front", "egypt_read_more_btn")
	
	if read_more_button then
		read_more_button:Highlight(true, true)
		pulse_uicomponent(read_more_button, true)

		core:add_listener(
			"FTUE_power_of_crown_read_more_button",
			"ComponentLClickUp",
			function(context) 
				return context.string == read_more_button:Id() 
			end,
			function(context)
				read_more_button:Highlight(false, true)
				pulse_uicomponent(read_more_button, false)

				tn_legitimacy_onboarding_2_choose_path()
			end,
			false
		)
		core:add_listener(
			"FTUE_power_of_crown_hatti_land_selected",
			"ComponentLClickUp",
			function(context) 
				return context.string == "hittite_land" 
			end,
			function(context)
				core:remove_listener("FTUE_power_of_crown_read_more_button")
				tn_legitimacy_onboarding_2()
			end,
			false
		)
	else
		script_error("ERROR: Cannot find egypt_read_more_btn component")
		tn_legitimacy_onboarding_2_choose_path()
	end
end

function tn_legitimacy_onboarding_2_choose_path()
	core:remove_listener("FTUE_power_of_crown_button_choose_path")
	local button_choose_path = find_uicomponent(core:get_ui_root(), "pharaohs_crown", "legitimacy_choice", "egypt_detailed_info", "button_choose_path")
	
	if button_choose_path then
		button_choose_path:Highlight(true, true)
		pulse_uicomponent(button_choose_path, true)

		core:add_listener(
			"FTUE_power_of_crown_button_choose_path",
			"ComponentLClickUp",
			function(context) 
				return context.string == button_choose_path:Id() 
			end,
			function(context)
				button_choose_path:Highlight(false, true)
				pulse_uicomponent(button_choose_path, false)

				tn_legitimacy_onboarding_2_button_confirm()
			end,
			false
		)
	else
		script_error("ERROR: Cannot find button_choose_path component")
		core:remove_listener("FTUE_power_of_crown_button_choose_path")
		tn_legitimacy_onboarding_2_button_confirm()
	end
end

function tn_legitimacy_onboarding_2_button_confirm()
	--Callback needed because cannot find the confirm button in the pop-up prompt before it pops-up
	cm:callback(
		function()
			local button_confirm = find_uicomponent(core:get_ui_root(), "popup_message_box", "buttons_holder", "both_group", "button_tick")
			if button_confirm then
				button_confirm:Highlight(true, true)
				pulse_uicomponent(button_confirm, true)
			else
				script_error("ERROR: Cannot find button_choose_path component")
				core:remove_listener("FTUE_power_of_crown_button_choose_path")
				tn_legitimacy_onboarding_2_button_confirm()
			end
		end,
		0.1
	)
	
	core:add_listener(
		"FTUE_LegitimacyPickedConfirmation",
		"ComponentLClickUp",
		function(context)
			return (context.string == "button_tick" or context.string == "button_cancel") and uicomponent_descended_from(UIComponent(context.component), "popup_message_box")
		end,
		function(context)
			if context.string == "button_cancel" then
				tn_legitimacy_onboarding_2_choose_path()
			else
			core:remove_listener("FTUE_power_of_crown_hatti_land_selected")
			cm:complete_objective(tut.advisor_texts.next_turns.merneptah_advisor_legitimacy_2.choose_legitimacy_objective)
			cm:remove_objective(tut.advisor_texts.next_turns.merneptah_advisor_legitimacy_2.choose_legitimacy_objective)
			tn_legitimacy_onboarding_3()

			-- Start advice listeners for the Court feature now that a legitimacy path is chosen
			tut.add.start_court_advice_listeners();
			tn_listeners_triggered.court_unlocked = cm:set_saved_value("court_unlocked", cm:turn_number())
			uim:override("hide_court"):unlock()
			uim:override("hide_ancient_legacies"):unlock()
			end
		end,
		false
	)
end

function tn_legitimacy_onboarding_3()
	core:remove_listener("FTUE_LegitimacyPanelClosed")
	--We dehighlight the button just in case it has remained highlighted
	local button_crown = find_uicomponent(core:get_ui_root(), "hud_campaign", "faction_widget_holder", "main_buttons", "button_fm_phar_pharaoh_crown")
	if button_crown then
		button_crown:Highlight(false,false)
		pulse_uicomponent(button_crown, false, 0, false, "active")
	end
	tn_listeners_triggered.legitimacy_onboarding_ended = cm:set_saved_value("legitimacy_onboarding_ended", cm:turn_number())

	cm:show_advice(
		tut.advisor_texts.next_turns.practical_advisor_legitimacy_info_overlay.advice_key,
		true,
		false,
		function() 
			cm:hide_advisor_without_infotexts()
		end,
		tut.ADVICE_DURATION_S
	)
	info_overlay_cheat_sheet_and_highlight(nil, tn_legitimacy_onboarding_end)
end

function tn_legitimacy_onboarding_end()
	tut_complete_active_intervention()
	
	cm:checkpoint_reached(
		1010,														-- checkpoint id
		function()												-- post-update callback
			tn_own_multiple_settlements_start()
		end,
		tut.SHOULD_SAVE_EVERY_CHECKPOINT_MID,				-- should save game
		tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or false			-- always generate named savegame, rather than autosaving
	)
end


function tn_own_multiple_settlements_start()
	tn_own_multiple_settlements_advice()
	tn_own_multiple_settlements()
end

function tn_own_multiple_settlements_advice()
	cm:show_advice(
		tut.advisor_texts.next_turns.v2_merneptah_advisor_own_settlements.advice_key,
		true,
		false,
		function()
			cm:hide_advisor_without_infotexts()
			cm:checkpoint_reached(
				1020,
				function()
					-- This checkpoint is meant to remove the intervention and soft-locks from loading future autosaves before the next checkpoint
				end,
				tut.SHOULD_SAVE_EVERY_CHECKPOINT_MID,				-- should save game
				tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or false			-- always generate named savegame, rather than autosaving
			)
		end,
		tut.ADVICE_DURATION_S
	)
end

--This is meant to only call the conquest advice without the intervention on the next load
function tn_own_multiple_settlements_advice_next_checkpoint_on_load()
	core:progress_on_loading_screen_dismissed(
		function()
			cm:show_advice(
				tut.advisor_texts.next_turns.v2_merneptah_advisor_own_settlements.advice_key,
				true,
				false,
				function()
					cm:dismiss_advice()
				end,
				tut.ADVICE_DURATION_S
			)
		end
	)
end
	
function tn_own_multiple_settlements()
	core:call_once(
		"Own 8 settlements objective",
	 	function()
			if cm:get_faction(tut.player_faction_key):num_regions() < 8 then
				cm:set_objective(tut.advisor_texts.next_turns.v2_merneptah_advisor_own_settlements.own_settlements_objective)
				core:add_listener(
					"FTUE_SettlementCaptured",
					"CharacterPerformsSettlementOccupationDecision",
					function(context)
						return context:character():faction():name() == tut.player_faction_key
						and context:character():faction():num_regions() >= 8
					end,
					function(context)
						cm:callback(
							function()
								tut_complete_and_remove_objective(tut.advisor_texts.next_turns.v2_merneptah_advisor_own_settlements.own_settlements_objective)
							end,
							2
						)
					end
				)
			end
		end
	)
end

function tn_show_labour()
	local labour_frame_uic = find_uicomponent(core:get_ui_root(), "popup_pre_battle", "siege_information_panel", "labour_frame")
	if labour_frame_uic then
		labour_frame_uic:Highlight(true, true, 0, true)
	
		local ap = active_pointer:new(
			"tn_show_labour",
			"bottomright",
			function()
				return labour_frame_uic
			end,
			"ui_text_replacements_localised_text_phar_text_pointer_show_labour",
			0.5,
			0,
			nil,
			true
		)
		ap:add_hide_callback(tn_show_siege_equipment, 0.5)
		ap:set_auto_hide_time(15)

		cm:callback(
			function()
				local labour_frame_uic = find_uicomponent(core:get_ui_root(), "popup_pre_battle", "siege_information_panel", "labour_frame")
				if labour_frame_uic then
					ap:show_when_ready()
					labour_frame_uic:Highlight(false)
				end
			end,
			1
		)
	else
		tn_show_siege_equipment()
	end
end

function tn_show_siege_equipment()
	local siege_equipment_uic = find_uicomponent(core:get_ui_root(), "popup_pre_battle", "siege_information_panel", "equipment_frame")
	if siege_equipment_uic then
		siege_equipment_uic:Highlight(true, true, 0, true)
	
		local siege_ladder_uic = UIComponent(siege_equipment_uic:Find(0))
		local ap = active_pointer:new(
			"siege_equipment",
			"bottomright",
			function()
				return siege_ladder_uic
			end,
			"ui_text_replacements_localised_text_phar_text_pointer_siege_equipment",
			0.25,
			0,
			nil,
			true
		)
		ap:set_auto_hide_time(tut.TEXT_POINTER_DURATION_S)

		cm:callback(
			function()
				local siege_equipment_uic = find_uicomponent(core:get_ui_root(), "popup_pre_battle", "siege_information_panel", "equipment_frame")
				if siege_equipment_uic then
					ap:show_when_ready()
					siege_equipment_uic:Highlight(false)
				end
			end,
			1
		)
	end
end

function tn_start_siege_equipment_in_construction_advice()
	core:hide_all_text_pointers(true)
	uim:unhighlight_all_for_tooltips(true)
	cm:show_advice(
		tut.advisor_texts.next_turns.v2_practical_advisor_siege_equipment_in_construction_advice.advice_key,
		true,
		false,
		function ()
			cm:hide_advisor_without_infotexts()
			local button_continue_siege = find_uicomponent(core:get_ui_root(), "popup_pre_battle", "button_continue_siege")
			cm:callback(
				function()
					if button_continue_siege and button_continue_siege:Visible() then
						highlight_component(true, false, "popup_pre_battle", "button_continue_siege")
					end
				end,
				5
			)
			core:add_listener(
				"FTUE_HeroContinuesSiege",
				"CharacterMaintainsSiege",
				function(context) return true end,
				function(context)
					if button_continue_siege and button_continue_siege:Visible() then
						highlight_component(false, false, "popup_pre_battle", "button_continue_siege")
					end

					end_turn_highlight(true, 2, 10)
				end,
				false
			)
		end,
		tut.ADVICE_DURATION_S
	)
end

function tn_highlight_character_to_attack_settlement()
	if not tn_listeners_triggered.major_settlement_attacked_name then
		return false
	end

	local region = cm:get_region(tn_listeners_triggered.major_settlement_attacked_name)
	local settlement = region:settlement()
	local x = settlement:logical_position_x()
	local y = settlement:logical_position_y()

	local general = cm:get_closest_character_to_position_from_faction(
		tut.player_faction_key,
		x,
		y,
		true
	)
	if not general or general:is_null_interface() or not general:has_military_force() then
		return false
	end
	local military_force = general:military_force()
	local siege = military_force:get_siege()
	if not siege or siege:is_null_interface() then
		return false
	end

	if siege:get_garrison_residence_under_siege():region():name() == tn_listeners_triggered.major_settlement_attacked_name
			and siege:can_assault() then
		uim:highlight_character_for_selection(
			general,
			function()
				cm:callback(
					function()
						uim:highlight_settlement(
							"settlement:"..tn_listeners_triggered.major_settlement_attacked_name,
							"move_to_vfx"
						)
						core:add_listener(
							"FTUE_remove_settlement_highlight",
							"BattleCompleted",
							function(context) 
								return cm:pending_battle_cache_faction_is_involved(tut.player_faction_key)
							end,
							function(context)
								uim:unhighlight_settlement("settlement:"..tn_listeners_triggered.major_settlement_attacked_name, true)
							end
						)
					end,
					0.7
				)
			end
		)
	end
end

--In case the campaign intervention for Settlement desrtuction gets removed for some reason
-- core:add_listener(
-- 	"FTUE_HeroMaintainsSiege",
-- 	"CharacterMaintainsSiege",
-- 	function(context) return true end,
-- 	function(context)
-- 		cm:clear_infotext()
-- 		cm:show_advice(
-- 			"phar_campaign_advisor_settlement_destruction", -- add it to campaign_interventions instead?
-- 			true,
-- 			false,
-- 			function ()
--				cm:hide_advisor_without_infotexts()
-- 			end,
-- 			tut.ADVICE_DURATION_S
-- 		)
		
-- 	end,
-- 	false
-- )


-- call the big blob of listeners after declaring them
tn_add_relevant_listeners_on_load()