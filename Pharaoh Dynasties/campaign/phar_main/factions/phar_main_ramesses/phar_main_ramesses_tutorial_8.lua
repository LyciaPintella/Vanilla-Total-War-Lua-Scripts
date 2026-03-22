out("phar_main_ramesses_tutorial_8 loaded")

t8_listeners_triggered = 
{
	friendly_ers_passed = cm:get_saved_value("friendly_ers_passed"),
	enemy_ers_passed = cm:get_saved_value("enemy_ers_passed"),
	cadmean_victory = cm:get_saved_value("cadmean_victory"),
}


--------------------------------------------------------------------------------------------------
-- CHECKPOINT 800: start of turn 8
--------------------------------------------------------------------------------------------------

local checkpoint_800_str = "8 " .. common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_start")

cm:add_checkpoint( 
	800,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		core:progress_on_loading_screen_dismissed(t8_turn_start)
	end,
	false,													-- call function when checkpoint reached
	checkpoint_800_str										-- opt string name
)


cm:add_checkpoint_setup_callback(
	800,														-- checkpoint id to add setup callback
	function(is_loading_game, checkpoint_id)				-- setup function
		t8_add_listeners()
	end,
	false													-- call function when checkpoint reached
)


	
function t8_start_listener()
	core:add_listener(
		"FTUE_FactionTurnStart_8",
		"FactionTurnStart",
		function(context) return context:faction():name() == tut.player_faction_key and cm:turn_number() == 8 end,
		function(context)
			cm:checkpoint_reached(
				800,														-- checkpoint id
				function()												-- post-update callback
					t8_add_listeners()
					t8_turn_start()
				end,
				tut.SHOULD_SAVE_EVERY_CHECKPOINT_START_END,				-- should save game
				tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or true				-- always generate named savegames, rather than autosaving
			)
		end
	)
end

function t8_enable_more_cai_factions()
	tut_set_skip_faction_turns(tut.seti_faction_key, false)
	tut_set_skip_faction_turns(tut.beersheba_faction_key, false)
	tut_set_skip_faction_turns(tut.timna_faction_key, false)
	tut_set_skip_faction_turns(tut.hetch_faction_key, false)
end

function t8_add_listeners()
	t8_enable_more_cai_factions()

	core:svr_save_bool("tut_make_player_general_invincible", false)
	uim:override("hide_settlement_panel_building_browser"):unlock()
	uim:override("disable_ers"):unlock()
	uim:override("disband_unit"):unlock()
	uim:override("hide_radar"):unlock()
	uim:override("radar_rollout_buttons"):unlock()
	uim:override("hide_demolish_button"):unlock()

	--Unsuppress warnings:
	uim:suppress_end_turn_warning("low funds,commandment available,settlement upgrade available,unfulfillable_barter_agreement", false)
	
	if not t8_listeners_triggered.friendly_ers_passed then
		local max_distance = 10
		local region_slot_number = nil
		core:add_listener(
			"FTUE_StartFreindlyERSOnboarding",
			"CharacterFinishedMovingEvent",
			function(context)
				if not context:character():has_region() then
					return false
				end

				local character = context:character()
				local region = character:region()
				if region:is_null_interface() then
					return false
				end

				local owning_faction = region:owning_faction()
				if owning_faction:is_null_interface() then
					return false
				end

				if not (cm:turn_number() >= 7
						--Uncomment if we want Ramesses only to trigger event
						--and context:character():family_member():command_queue_index() == tut.player_faction_leader_fm_cqi
						and character:faction():name() == tut.player_faction_key
						and owning_faction:name() == tut.player_faction_key) then
					return false
				end

				local slot_list = region:slot_list()
				for i=0, slot_list:num_items() - 1 do
					local slot = slot_list:item_at(i)
					if not slot:is_null_interface() and slot:is_infrastructure_slot() then
						local distance = (slot:logical_position_x() - character:logical_position_x()) * (slot:logical_position_x() - character:logical_position_x())
						+ (slot:logical_position_y() - character:logical_position_y()) * (slot:logical_position_y() - character:logical_position_y())
						
						if distance < max_distance * max_distance then -- workaround not using square root 
							region_slot_number = i
							return true
						end
					end
				end
				return false
			end,
			function(context)
				cm:set_saved_value("friendly_ers_passed", cm:turn_number())
				if region_slot_number == nil then
					script_error("ERROR: region_slot within distance but it's index is nil")
				end

				local slot_key = context:character():region():slot_list():item_at(region_slot_number):slot_key()
				uim:highlight_region_slot_for_selection(
					slot_key,
					function()
						cm:clear_infotext()
						cm:show_advice(
							tut.advisor_texts.turn_8.v2_friendly_ers_pract.advice_key,
							true,
							false,
							function()
								cm:hide_advisor_without_infotexts()
							end,
							tut.ADVICE_DURATION_S
						)
						tut_add_infotext(tut.advisor_texts.turn_8.v2_friendly_ers_pract.infotext)
					end
				)
			end,
			false
		)
	end

	if not t8_listeners_triggered.enemy_ers_passed then
		local max_distance = 10
		local region_slot_number = nil
		core:add_listener(
			"FTUE_StartEnemyERSOnboarding",
			"CharacterFinishedMovingEvent",
			function(context)
				if not context:character():has_region() then
					return false
				end

				local character = context:character()
				local region = character:region()
				if region:is_null_interface() then
					return false
				end
				local owning_faction = region:owning_faction()
				
				local character_faction = character:faction()

				if owning_faction:is_null_interface() then
					return false
				end

				if cm:turn_number() < 8
				--Uncomment if we want Ramesses only to trigger event
				--or context:character():family_member():command_queue_index() == tut.player_faction_leader_fm_cqi
				or character_faction:name() ~= tut.player_faction_key
				or owning_faction:name() == tut.player_faction_key
				or not owning_faction:at_war_with(character_faction) then
					return false
				end

				local slot_list = region:slot_list()
				for i=0, slot_list:num_items() - 1 do
					local slot = slot_list:item_at(i)
					if not slot:is_null_interface() and slot:is_infrastructure_slot() and slot:has_building() then
						local distance = (slot:logical_position_x() - character:logical_position_x()) * (slot:logical_position_x() - character:logical_position_x())
										+ (slot:logical_position_y() - character:logical_position_y()) * (slot:logical_position_y() - character:logical_position_y())
						if distance < max_distance * max_distance then -- workaround not using square root 
							region_slot_number = i
							return true
						end
					end
				end
				return false
			end,
			function(context)
				cm:set_saved_value("enemy_ers_passed", cm:turn_number())
				if region_slot_number == nil then
					script_error("ERROR: region_slot within distance but it's index is nil")
				end

				local slot_key = context:character():region():slot_list():item_at(region_slot_number):slot_key()
				uim:highlight_region_slot(
					slot_key,
					"move_to_vfx"
				)
				cm:clear_infotext()
				cm:show_advice(
					tut.advisor_texts.turn_8.v2_enemy_ers_pract.advice_key,
					true,
					false,
					function()
						cm:hide_advisor_without_infotexts()
					end,
					tut.ADVICE_DURATION_S
				)
				tut_add_infotext(tut.advisor_texts.turn_8.v2_enemy_ers_pract.infotext)
				cm:callback(
					function()
						uim:unhighlight_region_slot(
							slot_key,
							true
						)
					end,
					15
				)
			end,
			false
		)
	end

	if not t8_listeners_triggered.cadmean_victory then
		core:add_listener(
			"FTUE_FirstCadmeanVictory",
			"BattleCompleted",
			function(context)
				local pb = context:model():pending_battle()
				local is_cadmean_victory = false
				local region = pb:region()
				local is_in_player_territory = is_region(region) and region:owning_faction():name() == tut.player_faction_key

				if pb:attacker_faction():name() == tut.player_faction_key then
					is_cadmean_victory = pb:attacker_battle_result() == "pyrrhic_victory" or pb:attacker_battle_result() == "close_victory"
				elseif pb:defender_faction():name() == tut.player_faction_key then
					is_cadmean_victory = pb:defender_battle_result() == "pyrrhic_victory" or pb:defender_battle_result() == "close_victory"
				else
					return false
				end

				return is_cadmean_victory and not is_in_player_territory
			end,
			function(context)
				cm:set_saved_value("cadmean_victory", cm:turn_number())
				cm:clear_infotext()
				cm:show_advice(
					tut.advisor_texts.turn_8.v2_cadmean_victory_pract.advice_key,
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
	end
end

function t8_turn_start()
	egypt_legitimacy:add_legitimacy("phar_main_ramesses", "phar_legitimacy_court_intrigue", -20)
end
