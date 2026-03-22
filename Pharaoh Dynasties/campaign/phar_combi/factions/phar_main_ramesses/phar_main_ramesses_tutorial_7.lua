out("phar_main_ramesses_tutorial_7 loaded")


--------------------------------------------------------------------------------------------------
-- CHECKPOINT 700: start of turn 7
--------------------------------------------------------------------------------------------------

local checkpoint_700_str = "7 " .. common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_start")

cm:add_checkpoint( 
	700,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		core:progress_on_loading_screen_dismissed(t7_turn_start)
	end,
	false,													-- call function when checkpoint reached
	checkpoint_700_str										-- opt string name
)


cm:add_checkpoint_setup_callback(
	700,														-- checkpoint id to add setup callback
	function(is_loading_game, checkpoint_id)				-- setup function
		t7_unlock_overrides()
	end,
	false													-- call function when checkpoint reached
)

	
function t7_start_listener()
	core:add_listener(
		"FTUE_FactionTurnStart_7",
		"FactionTurnStart",
		function(context) return context:faction():name() == tut.player_faction_key and cm:turn_number() == 7 end,
		function(context)
			cm:checkpoint_reached(
				700,														-- checkpoint id
				function()												-- post-update callback
					t7_unlock_overrides()
					t7_turn_start()
				end,
				tut.SHOULD_SAVE_EVERY_CHECKPOINT_START_END,				-- should save game
				tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or true				-- always generate named savegames, rather than autosaving
			)
		end,
		false
	)
end

function t7_unlock_overrides()
	--uim:override("diplomacy"):unlock()
	--uim:override("hide_sidemenu"):unlock()
	--uim:override("hide_faction_widget_buttons"):unlock()
	--uim:override("journal"):unlock()

	uim:override("end_turn"):lock()
	uim:override("hide_faction_widget_buttons"):unlock()
	uim:override("hide_pre_battle_retreat"):unlock()
	uim:override("maintain_siege"):unlock()
	cm:force_diplomacy("faction:" .. tut.player_faction_key, "all", "trade agreement", true, true, true)
	cm:force_diplomacy("faction:" .. tut.player_faction_key, "all", "single barters", true, true, true)
	cm:force_diplomacy("faction:" .. tut.player_faction_key, "all", "barter agreements", true, true, true)
	
	uim:override("recruit_units"):lock()
	uim:override("recruit_units"):set_allowed(false);
	--uim:override("cancel_recruitment"):set_allowed(false)

	-- enabling concede option for battles from this turn on
	core:svr_save_bool("sbool_replace_concede_with_skip_button", false)

	--Allow declarations of war
	cm:force_diplomacy("faction:" .. tut.player_faction_key, "all", "war", true, true, true)
	cm:force_diplomacy("faction:" .. tut.player_faction_key, "faction:" .. tut.merneptah_faction_key, "war", false, false, true)
	if not cm:get_saved_value("legitimacy_war") then
		cm:force_diplomacy("faction:" .. tut.seti_faction_key, "faction:" .. tut.player_faction_key, "war", false, true, false)
		cm:force_diplomacy("faction:" .. tut.tausret_faction_key, "faction:" .. tut.player_faction_key, "war", false, true, false)
end
end



function t7_turn_start()
	--cm:complete_recruitment_and_contruction_in_region(tut.nekhel)
	
	t7_colonize_neb_gehes_start()
	local ramesses_cqi = cm:get_character_by_fm_cqi(tut.player_faction_leader_fm_cqi):command_queue_index()
	cm:disable_movement_for_character("character_cqi:" .. ramesses_cqi)
	cm:enable_movement_for_faction(tut.sukhot_faction_key)

	--Make diplomatic relations with Pi Ramesses plummet
	cm:apply_dilemma_diplomatic_bonus(tut.player_faction_key, tut.pi_ramesses_faction_key, -6)
	cm:apply_dilemma_diplomatic_bonus(tut.player_faction_key, tut.pi_ramesses_faction_key, -6)
	cm:apply_dilemma_diplomatic_bonus(tut.player_faction_key, tut.pi_ramesses_faction_key, -6)
	cm:apply_dilemma_diplomatic_bonus(tut.player_faction_key, tut.pi_ramesses_faction_key, -6)
	
	--Kill off all Azati forces so they don't attack Sukhot if you go to Per Amun
	local sukhot = cm:get_faction(tut.sukhot_faction_key)
	local sukhot_characters = sukhot:character_list()
	if sukhot_characters then
		for i = 0, sukhot_characters:num_items() - 1 do
			local sukhot_character = sukhot_characters:item_at(i)
			if sukhot_character and sukhot_character:region():name() == tut.azzati 
					and not (sukhot_character:has_garrison_residence() and sukhot_character:command_queue_index() == sukhot_character:garrison_residence():garrison_army():general_character():command_queue_index()) then
				local sukhot_character_lookup_str = cm:char_lookup_str(sukhot_character)
				cm:kill_character_and_commanded_unit(sukhot_character_lookup_str, true)
			end
		end
	end
	--Remove workforce, so that they don't have extra recruitment slots
	local azzati = cm:get_region(tut.azzati)
	if azzati and not azzati:is_null_interface() and azzati:owning_faction():name() == tut.sukhot_faction_key then
		local azzati_workforce = azzati:province():development_points_for_faction(tut.sukhot_faction_key)
		cm:add_development_points_to_region(tut.azzati, -azzati_workforce)
	end
end


function t7_colonize_neb_gehes_start()
	tut.add.start_resource_advice_listeners()

	ambitions.generate_specific_ambitions_with_intervention(tut.player_faction_key, {"phar_tutorial_ambition_3_colonize_neb_gehes"})

	-- remove past confirm button highlights on start, as this action can't be execute on ambition dimissal
	cm:repeat_real_callback(
		function()
			local ambitions_background = find_uicomponent("ambitions")
			if ambitions_background then
				-- remove past confirm button highlights on start, as this action can't be execute on ambition dimissal
	local button_select = find_uicomponent(core:get_ui_root(), "ambitions","button_select_ambition")
	if button_select then
		button_select:Highlight(false, true)
					cm:remove_real_callback("FTUE_Ambition_Button_Stop")
	end
			end;
		end,
		100,
		"FTUE_Ambition_Button_Stop"
	)

	-- increasing player's movement speed to enable them to reach neb_gehes.
	local recruited_general = cm:get_character_by_cqi(tut.player_faction_recruited_hero_cqi)
	local bundle_key = "phar_main_effect_bundle_tutorial_campaign_movement"
	local effect_value = 50
	local effect_key = "troy_effect_hero_campaign_campaign_movement" 
	local bundle = cm:create_new_custom_effect_bundle(bundle_key)
	bundle:add_effect(effect_key, "general_to_force_own", effect_value)

	--Apply bonus just for the current turn, in case an introduces an issue in the following steps of the tutorial
	bundle:set_duration(1)
	cm:apply_custom_effect_bundle_to_character(bundle, recruited_general)
	cm:replenish_action_points(cm:char_lookup_str(tut.player_faction_recruited_hero_cqi),0,effect_value)

	core:add_listener(
		"FTUE_AmbitionSelected_3",
		"MissionIssued",
		function(context)
			return context:mission():mission_record_key() == "phar_tutorial_ambition_3_colonize_neb_gehes"
		end,
		function()
			cm:checkpoint_reached(
				710,														-- checkpoint id
				function()												-- post-update callback
					t7_advice()
				end,
				tut.SHOULD_SAVE_EVERY_CHECKPOINT_MID,				-- should save game
				tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or false				-- always generate named savegames, rather than autosaving
			)	
		end,
		false
	)
end

--------------------------------------------------------------------------------------------------
-- CHECKPOINT 710: Turn 7 Ambition issued
--------------------------------------------------------------------------------------------------

local checkpoint_710_str = common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_ambitions")

cm:add_checkpoint( 
	710,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		core:progress_on_loading_screen_dismissed(t7_advice)
	end,
	false,													-- call function when checkpoint reached
	checkpoint_710_str										-- opt string name
)

function t7_advice()

	cm:scroll_camera_from_current(true, 5, {618.306854, 693.483398, 12.466051, -1.907741, 7.070293})
	
	--Callback needed to bypass after ambition override canceling
	cm:callback(
		function()
			local ramesses_cqi = cm:get_character_by_fm_cqi(tut.player_faction_leader_fm_cqi):command_queue_index()
			cm:disable_movement_for_character("character_cqi:" .. ramesses_cqi)
			uim:override("end_turn"):lock()
			uim:override("recruit_units"):lock()
			uim:override("recruit_units"):set_allowed(false);
		end,
		0.1
	)
	
	-- No idea why this ended up being locked and I don't want to know - just unlocking it
	cm:override_ui("disable_giving_orders", false)

	local recruited_hero = cm:get_character_by_cqi(tut.player_faction_recruited_hero_cqi)
	uim:highlight_character_for_selection(
		recruited_hero,
		function() 
			uim:highlight_settlement("settlement:" .. tut.neb_gehes, "move_to_vfx")
			cm:set_objective(tut.advisor_texts.turn_6.v2_crossing_the_desert_mern.colonize_neb_gehes_objective)
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
	)
	cm:disallow_faction_occupation_decision(
		cm:get_faction(tut.player_faction_key),
		"occupation_decision_do_nothing"
	)
	core:add_listener(
		"FTUE_SettlementCapturedPanelOpen",
		"PanelOpenedCampaign",
		function(context) 
			return context.string == "settlement_captured"
		end,
		function()
			local do_nothing_uic = core:get_ui_root():SequentialFind("settlement_captured", "button_parent", "1286225483", "option_button")
			if do_nothing_uic then
				do_nothing_uic:SetState("inactive")
			end
		end,
		false
	);

	local resources_uic
	core:add_listener(
		"FTUE_AmbitionCompleted_3",
		"MissionSucceeded",
		function(context)
			return context:mission():mission_record_key() == "phar_tutorial_ambition_3_colonize_neb_gehes"
		end,
		function()
			tut_complete_and_remove_objective(tut.advisor_texts.turn_6.v2_crossing_the_desert_mern.colonize_neb_gehes_objective)
			uim:unhighlight_settlement("settlement:" .. tut.neb_gehes, true)
			
			resources_uic = find_uicomponent(core:get_ui_root(), "hud_campaign", "faction_widget_holder",  "faction_widget", "faction_widget_list", "resources_container_holder", "resources_container")
			resources_uic:Highlight(true, true, 0, true)
			cm:callback(
				function()
					resources_uic:Highlight(false)
				end,
				2
			)

			core:add_listener(
				"FTUE_show_repair_ruins",
				"PanelOpenedCampaign",
				function(context) return context.string == "settlement_panel" end,
				function() 
					cm:callback(
						function()
							local major_sinai_ruin_uic = find_uicomponent(core:get_ui_root(), "settlement_panel", "main_settlement_panel", "capital", "settlement_capital", "building_slot_1", "phar_main_all_province_management_main_building_major_sinai_ruin")
							if major_sinai_ruin_uic and major_sinai_ruin_uic:Visible() then
								core:remove_listener("FTUE_show_repair_ruins")
								local ap = active_pointer:new(
									"show_repair_ruins",
									"bottomleft",
									function()
										return major_sinai_ruin_uic
									end,
									"ui_text_replacements_localised_text_phar_main_tech_civil_17_construction_time_when_region_occupied", --reusing the text since time for localization is over and is going to be available for the next dlc
									0.5,
									0,
									nil,
									true
								)
								ap:set_auto_hide_time(tut.TEXT_POINTER_DURATION_S)
								ap:show_when_ready()
							end
						end,
						1
					)
				end,
				true
			);
		end,
		false
	)
	
	cm:show_advice(
		tut.advisor_texts.turn_6.v2_crossing_the_desert_mern.advice_key,
		true,
		false,
		function()
			cm:show_advice(
				tut.advisor_texts.turn_6.v2_resurrecting_neb_gehes_ram.advice_key,
				true,
				false,
				function()
			cm:show_advice(
				tut.advisor_texts.turn_6.v2_great_idea_mern.advice_key,
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

	cm:notify_on_character_movement(
		"Notify Recruited general movement turn 7",
		tut.player_faction_recruited_hero_cqi,
		function()
			uim:unhighlight_settlement("settlement:" .. tut.neb_gehes, true)
			cm:attack_region("character_cqi:" .. tut.player_faction_recruited_hero_cqi, tut.neb_gehes)
			cm:disable_movement_for_character("character_cqi:" .. tut.player_faction_recruited_hero_cqi)
		end
	)
end






--------------------------------------------------------------------------------------------------
-- CHECKPOINT 720: Neb-Gehes Colonized
--------------------------------------------------------------------------------------------------

local checkpoint_720_str = common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_colonisation")

cm:add_checkpoint( 
	720,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		core:progress_on_loading_screen_dismissed(t7_neb_gehes_colonized)
	end,
	false,													-- call function when checkpoint reached
	checkpoint_720_str										-- opt string name
)


cm:add_checkpoint_setup_callback(
	720,														-- checkpoint id to add setup callback
	function(is_loading_game, checkpoint_id)				-- setup function
		t7_neb_gehes_colonized_overrides()
	end,
	false													-- call function when checkpoint reached
)


function t7_neb_gehes_colonized_overrides()
	uim:override("journal"):unlock()
	uim:override("hide_faction_buttons_docker"):unlock()

	uim:override("recruit_units"):unlock()
	uim:override("recruit_units"):set_allowed(true);
	uim:override("cancel_recruitment"):set_allowed(true)

--	uim:override("hide_resource_troy_bronze"):unlock()
--	uim:override("hide_resource_troy_gold"):unlock()	

	--Unlock Per-Amun's turn so that they can defend themself from an assault
	tut_set_skip_faction_turns(tut.per_amun_faction_key, false)
end



function t7_neb_gehes_colonized()
	tut.add.start_resource_advice_intervention(true);
end

--------------------------------------------------------------------------------------------------
-- CHECKPOINT 730: Turn 7 End turn
--------------------------------------------------------------------------------------------------

local checkpoint_730_str = "7 " .. common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_end")

cm:add_checkpoint( 
	730,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		core:progress_on_loading_screen_dismissed(t7_end_turn)
	end,
	false,													-- call function when checkpoint reached
	checkpoint_730_str										-- opt string name
)


cm:add_checkpoint_setup_callback(
	730,														-- checkpoint id to add setup callback
	function(is_loading_game, checkpoint_id)				-- setup function
		t7_end_turn_overrides()
	end,
	false													-- call function when checkpoint reached
)

function t7_end_turn_overrides()
	uim:override("end_turn"):unlock()
	uim:override("disable_skip_button"):unlock()
end

function t7_end_turn()
	local ramesses_cqi = cm:get_character_by_fm_cqi(tut.player_faction_leader_fm_cqi):command_queue_index()
	cm:enable_movement_for_character("character_cqi:" .. ramesses_cqi)
	cm:dismiss_advice()
	cm:callback(
		function()
			cm:show_advice(
				tut.advisor_texts.turn_6.v2_end_turn_warnings_1_mern.advice_key,
				true,
				false,
				function()
					cm:show_advice(
						tut.advisor_texts.turn_6.v2_end_turn_warnings_2_ram.advice_key,
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
		1
	)

	t8_start_listener()
end
