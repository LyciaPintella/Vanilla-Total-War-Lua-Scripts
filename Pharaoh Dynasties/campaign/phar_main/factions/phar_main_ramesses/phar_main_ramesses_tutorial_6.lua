out("phar_main_ramesses_tutorial_6 loaded")


--------------------------------------------------------------------------------------------------
-- CHECKPOINT 600: start of turn 6
--------------------------------------------------------------------------------------------------

local checkpoint_600_str = "6 " .. common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_start")

cm:add_checkpoint( 
	600,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		core:progress_on_loading_screen_dismissed(t6_turn_start)
	end,
	false,													-- call function when checkpoint reached
	checkpoint_600_str										-- opt string name
)


cm:add_checkpoint_setup_callback(
	600,														-- checkpoint id to add setup callback
	function(is_loading_game, checkpoint_id)				-- setup function
		t6_unlock_overrides()
	end,
	false													-- call function when checkpoint reached
)

	
function t6_start_listener()
	core:add_listener(
		"FTUE_FactionTurnStart_6",
		"FactionTurnStart",
		function(context) return context:faction():name() == tut.player_faction_key and cm:turn_number() == 6 end,
		function(context)
			cm:checkpoint_reached(
				600,														-- checkpoint id
				function()												-- post-update callback
					t6_unlock_overrides()
					t6_turn_start()
				end,
				tut.SHOULD_SAVE_EVERY_CHECKPOINT_START_END,				-- should save game
				tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or true				-- always generate named savegames, rather than autosaving
			)
		end
	)
end

function t6_unlock_overrides()
	cm:set_saved_value("unlock_hide_faction_widget_buttons", true)
	lock_end_turn()
	--uim:override("end_turn"):lock()
	uim:override("hide_settlement_panel_recruit_lord"):unlock()
	uim:override("diplomacy"):unlock()

	uim:override("hide_faction_widget_buttons"):unlock()
	uim:override("journal"):unlock()
	uim:override("hide_faction_buttons_docker"):unlock()
	uim:override("recruit_units"):lock()
	uim:override("recruit_units"):set_allowed(false);
	

	cm:restrict_building_chains_for_faction(
		tut.player_faction_key,
		cm:get_local_faction():all_available_building_chains(),
		false
	)
	-- Properly restrict temples and shrines
	local factions_list = cm:model():world():faction_list()
	deities.set_all_religious_buildings_chain_restrictions(factions_list)
end

function t6_turn_start()
	cm:clear_infotext()
	lock_end_turn()
	cm:force_change_cai_faction_personality(tut.sukhot_faction_key, "phar_main_nomad_normal")
	t6_hero_recruitment()
end




function t6_hero_recruitment()
	cm:show_advice(
		tut.advisor_texts.turn_5.v2_hero_recruitment_1_mern.advice_key,
		true,
		false,
		function()
			cm:hide_advisor_without_infotexts()
		end,
		5
	)
	
	if not uim:is_settlement_selected("settlement:" .. tut.sukkot) then
		cm:callback(
			function()
				cm:set_objective(tut.advisor_texts.turn_5.v2_hero_recruitment_1_mern.select_settlement_objective)
			end,
			tut.OBJECTIVE_REMOVE_DELAY + 0.2
		)
		uim:highlight_settlement_for_selection(
			"settlement:" .. tut.sukkot,
			tut.north_sinai_province,
			function()
				t6_on_hero_recruitment_click()
			end
		)
	else
		t6_on_hero_recruitment_click()
	end
end

function t6_on_hero_recruitment_click()
	cm:callback(
		function()
			cm:complete_objective(tut.advisor_texts.turn_5.v2_hero_recruitment_1_mern.select_settlement_objective)
			uim:highlight_hero_recruitment_button(true, 10)
			uim:highlight_hero_recruitment_button(true, false)
			cm:set_objective(tut.advisor_texts.turn_5.v2_hero_recruitment_2_pract.open_list_of_heroes_objective)
		end,
		1
	)
	core:add_listener(
		"FTUE_HeroRecruitmentClicked",
		"PanelOpenedCampaign",
		function(context) 
			return context.string == "character_panel"
		end,
		function(context)
			cm:complete_objective(tut.advisor_texts.turn_5.v2_hero_recruitment_2_pract.open_list_of_heroes_objective)
			uim:highlight_hero_recruitment_button(false, false)

			cm:callback(
				function()
					uim:highlight_hero_recruitment_panel(true)
					cm:callback(
						function()
							cm:set_objective(tut.advisor_texts.turn_5.v2_hero_recruitment_3_pract.recruit_hero_objective)
						end,
						1
					)
					cm:show_advice(
						tut.advisor_texts.turn_5.v2_hero_recruitment_2_pract.advice_key,
						true,
						false,
						function()
							cm:hide_advisor_without_infotexts()
						end,
						5
					)
					cm:callback(
						function()
							uim:highlight_hero_recruitment_panel(false)
							local button_raise = find_uicomponent(core:get_ui_root(), "settlement_panel", "character_panel", "general_selection_panel", "character_list", "button_raise")
							if button_raise then
								button_raise:Highlight(true, true, 0, true)
							end
							
						end,
						2,
						"HighlightHeroRecruitButton"
					)
				end,
				0.1
			)
			core:add_listener(
				"FTUE_HeroSelectedForRecruitment",
				"NewCharacterRecruited",
				function(context) 
					return true
				end,
				function(context)
					cm:dismiss_advice()

					local button_raise = find_uicomponent(core:get_ui_root(), "settlement_panel", "character_panel", "general_selection_panel", "character_list", "button_raise")
					if button_raise then
						button_raise:Highlight(true, true, 0, true)
					end
					uim:highlight_hero_recruitment_panel(false)
					cm:remove_callback("HighlightHeroRecruitButton")
					cm:complete_objective(tut.advisor_texts.turn_5.v2_hero_recruitment_3_pract.recruit_hero_objective)

					local recruited_cqi = context:character():command_queue_index()
					cm:set_saved_value("player_faction_recruited_hero_cqi", recruited_cqi)
					tut.player_faction_recruited_hero_cqi = recruited_cqi

					-- teleport newly recruited character to Nekhel 
					local x,y = cm:find_valid_spawn_location_for_character_from_settlement(tut.player_faction_key, "phar_main_north_sinai_nekhel",false, true)
					cm:teleport_to(cm:char_lookup_str(recruited_cqi), x, y)

					-- Move the camera to focus on the character
					cm:scroll_camera_to_character(recruited_cqi, 2)

					cm:show_advice(
						tut.advisor_texts.turn_5.v2_hero_recruitment_3_pract.advice_key,
						true,
						false,
						function()
							cm:hide_advisor_without_infotexts()
							cm:remove_objective(tut.advisor_texts.turn_5.v2_hero_recruitment_3_pract.recruit_hero_objective)
							cm:remove_objective(tut.advisor_texts.turn_5.v2_hero_recruitment_2_pract.open_list_of_heroes_objective)
							cm:remove_objective(tut.advisor_texts.turn_5.v2_hero_recruitment_1_mern.select_settlement_objective)
							cm:remove_objective(tut.advisor_texts.turn_5.v2_province_management_pract.check_province_management_objective)
							cm:remove_objective(tut.advisor_texts.turn_5.v2_province_management_pract.open_province_panel_objective)
						end,
						5
					)
					cm:checkpoint_reached(
						610,
						function()
							t6_start_royal_decrees_override()				
									t6_start_royal_decrees()
								end,
						tut.SHOULD_SAVE_EVERY_CHECKPOINT_MID,
						tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or false
					)	
				end,
				false
			)
		end,
		false
	)
end 


--------------------------------------------------------------------------------------------------
-- CHECKPOINT 610: Turn 6 Royal Decrees
--------------------------------------------------------------------------------------------------

local checkpoint_610_str = common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_decrees")

cm:add_checkpoint( 
	610,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		core:progress_on_loading_screen_dismissed(t6_start_royal_decrees)
	end,
	false,													-- call function when checkpoint reached
	checkpoint_610_str										-- opt string name
)


cm:add_checkpoint_setup_callback(
	610,														-- checkpoint id to add setup callback
	function(is_loading_game, checkpoint_id)				-- setup function
		t6_start_royal_decrees_override()
	end,
	false													-- call function when checkpoint reached
)

function t6_start_royal_decrees_override()
	uim:override("recruit_units"):lock()
	uim:override("recruit_units"):set_allowed(false);
	--uim:override("cancel_recruitment"):set_allowed(false)

	uim:override("technology"):unlock()
	uim:override("end_turn"):lock()
	uim:suppress_end_turn_warning("research available", false)
end

function t6_start_royal_decrees()

	--uim:override("hide_faction_widget_buttons"):unlock()
	cm:callback(
		function()
			ambitions.generate_specific_ambitions_with_intervention(tut.player_faction_key, {"phar_tutorial_ambition_5_technology"})
			tut_ambitions_highlight("FTUE_T6_Ambition_Highlight_Wait")
			uim:override("end_turn"):lock()
		end,
		3
	)
	
	core:add_listener(
		"FTUE_AmbitionSelected_5",
		"MissionIssued",
		function(context)
			return context:mission():mission_record_key() == "phar_tutorial_ambition_5_technology"
		end,
		function()
			uim:override("end_turn"):lock()
			t6_royal_decrees_advice()
		end,
		false
	)
end

function t6_royal_decrees_advice()
	uim:override("end_turn"):lock()
	local technology_advice_scripted = intro_campaign_technology_advice:new(
		tut.advisor_texts.turn_7.v2_technology_select_mern.advice_key,
		tut.advisor_texts.turn_7.v2_technology_select_mern.tech_panel_open_objective,
		tut.advisor_texts.turn_7.v2_technology_chosen_pract.tech_objective,
		nil,
		function()
			cm:checkpoint_reached(
				620,													
				function()
					t6_close_tech_advice()
				end,
				tut.SHOULD_SAVE_EVERY_CHECKPOINT_MID,
				tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or false
			)
		end
	)

	core:add_listener(
		"FTUE_DecreeIssued",
		"ResearchStarted",
		function(context)
			return true
		end,
		function()
			cm:show_advice(
				tut.advisor_texts.turn_7.v2_technology_chosen_pract.advice_key,
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

	technology_advice_scripted:start()
	uim:override("end_turn"):lock()
	uim:override("recruit_units"):lock()
	uim:override("recruit_units"):set_allowed(false);

	--Callback needed to bypass after ambition override canceling
	cm:callback(
		function()
			uim:override("end_turn"):lock()
			uim:override("recruit_units"):lock()
			uim:override("recruit_units"):set_allowed(false);
		end,
		0.1
	)
end


--------------------------------------------------------------------------------------------------
-- CHECKPOINT 620: Turn 6 Royal Decree issued
--------------------------------------------------------------------------------------------------

local checkpoint_620_str = common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_decrees_issued")

cm:add_checkpoint( 
	620,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		core:progress_on_loading_screen_dismissed(t6_close_tech_advice)
	end,
	false,													-- call function when checkpoint reached
	checkpoint_620_str										-- opt string name
)

function t6_close_tech_advice()
	--Callback needed to bypass after tech intro override canceling
	uim:override("recruit_units"):lock()
	uim:override("recruit_units"):set_allowed(false);
	cm:callback(
		function()
			uim:override("recruit_units"):lock()
			uim:override("recruit_units"):set_allowed(false);
		end,
		0.1
	)
	cm:show_advice(
		tut.advisor_texts.turn_7.v2_technology_close_mern.advice_key,
		true,
		false,
		function()
			cm:dismiss_advice()
			cm:checkpoint_reached(
				630,														-- checkpoint id
				function()												-- post-update callback
					t6_end_turn_overrides()
					t6_end_turn()
				end,
				tut.SHOULD_SAVE_EVERY_CHECKPOINT_START_END,				-- should save game
				tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or true				-- always generate named savegame, rather than autosaving
			)
		end
	)
end


--------------------------------------------------------------------------------------------------
-- CHECKPOINT 630: Turn 6 End
--------------------------------------------------------------------------------------------------

local checkpoint_630_str = "6 " .. common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_end")

cm:add_checkpoint( 
	630,
	function(is_loading_game, checkpoint_id)
		core:progress_on_loading_screen_dismissed(t6_end_turn)
	end,
	false,
	checkpoint_630_str
)


cm:add_checkpoint_setup_callback(
	630,														
	function(is_loading_game, checkpoint_id)				
		t6_end_turn_overrides()			
	end,
	false													
)

function t6_end_turn_overrides()
	uim:override("end_turn"):unlock()
	uim:override("journal"):unlock()
	uim:override("hide_faction_buttons_docker"):unlock()
end

function t6_end_turn()
	--Callback needed to bypass after tech intro override canceling
	uim:override("recruit_units"):lock()
	uim:override("recruit_units"):set_allowed(false);
	cm:callback(
		function()
			uim:override("recruit_units"):lock()
			uim:override("recruit_units"):set_allowed(false);
		end,
		0.1
	)
	cm:disable_movement_for_faction(tut.sukhot_faction_key)
	end_turn_highlight()
	t7_start_listener()
end
