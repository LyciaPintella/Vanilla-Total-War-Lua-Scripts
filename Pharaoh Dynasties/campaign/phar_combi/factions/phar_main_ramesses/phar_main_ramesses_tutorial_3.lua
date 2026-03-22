

out("phar_main_ramesses_tutorial_3 loaded")

local t3_building_construction_has_been_issued = false

--------------------------------------------------------------------------------------------------
-- CHECKPOINT 300: Turn 3 start
--------------------------------------------------------------------------------------------------

local checkpoint_300_str = "3 " .. common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_start")

cm:add_checkpoint( 
	300,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		core:progress_on_loading_screen_dismissed(t3_turn_start)
	end,
	false,													-- call function when checkpoint reached
	checkpoint_300_str										-- opt string name
)

cm:add_checkpoint_setup_callback(
	300,														-- checkpoint id to add setup callback
	function(is_loading_game, checkpoint_id)				-- setup function
		t3_turn_start_setup()
	end,
	false													-- call function when checkpoint reached
)



function t3_start_listener()
	core:add_listener(
		"FTUE_FactionTurnStart_3",
		"FactionTurnStart",
		function(context) return context:faction():name() == tut.player_faction_key and cm:turn_number() == 3 end,
		function(context)			
			cm:checkpoint_reached(
				300,														-- checkpoint id
				function()												-- post-update callback
					t3_turn_start_setup()
					t3_turn_start()
				end,
				tut.SHOULD_SAVE_EVERY_CHECKPOINT_START_END,											-- should save game
				tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or true			-- always generate named savegame, rather than autosaving
			)
		end,
		false
	)
end




function t3_turn_start_setup()
	uim:override("end_turn"):lock()
	uim:override("army_panel_visible"):unlock()
	uim:override("hide_faction_buttons_docker"):lock()
	--uim:override("saving"):lock()
	--uim:override("recruit_units"):lock()
end



function t3_turn_start()
	cm:remove_garrison_residence_vfx(
		cm:get_region(tut.nekhel):garrison_residence():command_queue_index(),
		"settlement_disaster"
	)
	local sukkot_hero_1 = cm:get_character_by_fm_cqi(tut.sukkot_hero_1_fm_cqi) 
	if sukkot_hero_1 and not sukkot_hero_1:is_null_interface() then
		cm:kill_character_and_commanded_unit(cm:char_lookup_str_fm(tut.sukkot_hero_1_fm_cqi), true)
	end
	cm:callback(
		function()
			local sukkot_hero_1 = cm:get_character_by_fm_cqi(tut.sukkot_hero_1_fm_cqi) 
			if sukkot_hero_1 and not sukkot_hero_1:is_null_interface() then
				cm:kill_character_and_commanded_unit(cm:char_lookup_str_fm(tut.sukkot_hero_1_fm_cqi), true)
				local ramesses_fm_cqi = cm:char_lookup_str_fm(tut.player_faction_leader_fm_cqi)
				local ramesses_cqi = cm:get_character_by_fm_cqi(tut.player_faction_leader_fm_cqi):command_queue_index()
				cm:move_character(
					ramesses_cqi,
					936, 
					901,
					true,
					true,
					function()
						cm:replenish_action_points(ramesses_fm_cqi)
						cm:disable_movement_for_character(ramesses_fm_cqi)
					end
				)
				cm:disable_movement_for_character(ramesses_fm_cqi)
			end
		end,
		0.3
	)
	highlight_component(false, false, "hud_campaign", "button_end_turn")
	cm:clear_infotext()
	local ramesses_fm_cqi = cm:char_lookup_str_fm(tut.player_faction_leader_fm_cqi)
	local ramesses_cqi = cm:get_character_by_fm_cqi(tut.player_faction_leader_fm_cqi):command_queue_index()
	cm:move_character(
		ramesses_cqi,
		936, 
		901,
		true,
		true,
		function()
			cm:replenish_action_points(ramesses_fm_cqi)
			cm:disable_movement_for_character(ramesses_fm_cqi)
		end
	)
	--disable movement interface for player, so he cannot stirr the movement in another direction in mid movement
	cm:disable_movement_for_character(ramesses_fm_cqi)

	cm:scroll_camera_from_current(true, 5, {625.865356, 703.797058, 16.346525, -0.029993, 10.282562})
	cm:instantly_upgrade_building_in_region(
		tut.nekhel,
		1,
		"phar_main_all_province_management_main_building_minor_sinai_bronze_3"
	)
	local slot_number = 2
	cm:instantly_dismantle_building_in_region(
		tut.nekhel,
		slot_number,
		true,
		true
	)
	slot_number = 3
	cm:instantly_dismantle_building_in_region(
		tut.nekhel,
		slot_number,
		true,
		true
	)
	slot_number = 1
	cm:instantly_build_building_in_region(
		tut.nekhel,
		slot_number,
		"phar_main_kemet_military_administration_garrison_type_b_1",
		true
	)
	cm:instant_set_building_health_percent(tut.nekhel, "phar_main_kemet_military_administration_garrison_type_b_1", 50)
	
	-- local slot_number = 2
	-- cm:instantly_dismantle_building_in_region(
	-- 	tut.sukkot,
	-- 	slot_number
	-- )

	cm:show_advice(
		tut.advisor_texts.turn_3.v2_sukhot_army_2_flee_ram.advice_key,
		false,
		false,
		function()
			cm:show_advice(
				tut.advisor_texts.turn_3.v2_city_restoration_1_ram.advice_key,
				false,
				false,
				function()
					cm:show_advice(
						tut.advisor_texts.turn_3.v2_city_restoration_2_mern.advice_key,
						false,
						false,
						function()
							cm:hide_advisor_without_infotexts()
							
							cm:checkpoint_reached(
								310,														-- checkpoint id
								function()	
									t3_setup_unlock_province_panel()
									t3_perform_setup_of_nekhel()
									t3_buildings_restoration()
								end,													-- post-update callback
								tut.SHOULD_SAVE_EVERY_CHECKPOINT_MID,				-- should save game
								tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or false			-- always generate named savegame, rather than autosaving
							)
						end,
						tut.ADVICE_DURATION_S
					)
				end,
				5
			)
		end,
		tut.ADVICE_DURATION_S
	)
end

--------------------------------------------------------------------------------------------------
-- CHECKPOINT 310: building restoration
--------------------------------------------------------------------------------------------------

local checkpoint_310_str = common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_repair")

cm:add_checkpoint( 
	310,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		core:progress_on_loading_screen_dismissed(t3_buildings_restoration)
		
	end,
	false,													-- call function when checkpoint reached
	checkpoint_310_str							-- opt string name
)

cm:add_checkpoint_setup_callback(
	310,														-- checkpoint id to add setup callback
	function(is_loading_game, checkpoint_id)				-- setup function
		t3_setup_unlock_province_panel()
		t3_perform_setup_of_nekhel()
	end,
	false													-- call function when checkpoint reached
)

function t3_setup_unlock_province_panel()
	uim:override("province_overview_panel_visible"):unlock()
end

-- Customise the player's first city. It's important that this function is only called once during the lifetime of the campaign
function t3_perform_setup_of_nekhel()
	cm:add_development_points_to_region(tut.nekhel, 3)
	cm:restrict_building_chains_for_faction(
		tut.player_faction_key,
		cm:get_local_faction():all_available_building_chains(),
		true
	)
	cm:restrict_building_chains_for_faction(
		tut.player_faction_key,
		{
			"phar_main_farm_type_a_nile",
			"phar_main_farm_type_b_nile",
			"phar_main_farm_type_c_nile",
			"phar_main_farm_type_a_canaan",
			"phar_main_major_main_building",
			"phar_main_major_main_building_sinai",
			"phar_main_minor_main_building_sinai",
			"phar_main_minor_main_building_sinai_bronze",
			"phar_main_minor_main_building_sinai_food",
			"phar_main_kemet_military_garrison_type_b",
			"phar_main_bronze_mine",
			"phar_main_port_coast",
			"phar_main_port_coast_derivative_type_a",
		},
		false
	)
end


function t3_buildings_restoration()
	cm:disable_movement_for_character(cm:char_lookup_str_fm(tut.player_faction_leader_fm_cqi))

	core:add_listener(
		"FTUE_building_construction_started_prematurely",
		"BuildingConstructionStarted",
		function(context)
			return context:building_chain() == "phar_main_bronze_mine"
		end,
		function(context)
			t3_building_construction_has_been_issued = true
		end,
		false
	)
	cm:show_advice(
		tut.advisor_texts.turn_3.v2_city_restoration_3_ram.advice_key,
		false,
		false,
		function()
			cm:show_advice(
				tut.advisor_texts.turn_3.v2_city_repair_pract.advice_key,
				false,
				false,
				function ()
					cm:hide_advisor_without_infotexts()
				end,
				5,
				tut.NEXT_ADVICE_DELAY_S
			)
		end,
		tut.NEXT_ADVICE_DELAY_S,
		2
	)
	tut_add_infotext(tut.advisor_texts.turn_3.v2_city_restoration_3_ram.infotext)
	
	t3_city_select()
end

function t3_city_select()
	if not uim:is_settlement_selected("settlement:" .. tut.nekhel) then
		cm:set_objective(tut.advisor_texts.turn_3.v2_city_restoration_3_ram.select_nekhel_objective)
		uim:highlight_settlement_for_selection(
			"settlement:" .. tut.nekhel,
			tut.north_sinai_province,
			function()
				t3_city_repair()
			end
		)
	else
		t3_city_repair()
	end
end


function t3_city_repair()
	cm:complete_objective(tut.advisor_texts.turn_3.v2_city_restoration_3_ram.select_nekhel_objective)
	cm:set_objective(tut.advisor_texts.turn_3.v2_city_restoration_3_ram.repair_building_objective)

	local slot_number = 2
	cm:callback(
		function()
			if find_uicomponent(core:get_ui_root(), "settlement_panel") then
				local nekhel = cm:get_region(tut.nekhel)
				for i = slot_number, 3 do
					if nekhel:slot_list():item_at(slot_number):active() then
						--slot_number = slot_number + 1
						break
					else
						slot_number = slot_number + 1
					end
				end
				highlight_component(true, true, "settlement_panel", "main_settlement_panel", "settlement_1", "building_slot_" .. slot_number)
			end
		end,
		2,
		"find_building_to_repair"
	)

	core:add_listener(
		"FTUE_settlement_deselected",
		"SettlementDeselected",
		true,
		function()
			core:remove_listener("FTUE_building_rollout_displayed")
			core:remove_listener("FTUE_building_repair_started")
			cm:remove_callback("find_building_to_repair")
			cm:remove_real_callback("t3_highlight_building_repeat")

			t3_city_select()
		end,
		false
	)

	core:add_listener(
        "FTUE_building_rollout_displayed",
        "ConstructionPopupDisplayed",
        function(context) return true end,
        function(context)
			cm:repeat_real_callback(
				function()
					local building_uic = find_uicomponent("settlement_panel","main_settlement_panel", "settlement_1", "building_slot_"..slot_number)
					local repair_building_uic = find_uicomponent("construction_popup","list_holder","options_buttons","options_list","button_repair")
					if building_uic and building_uic:Visible(true) then
						if repair_building_uic and repair_building_uic:Visible(true) then
							building_uic:Highlight(false,false)
							repair_building_uic:Highlight(true, false)
						else
							building_uic:Highlight(true, true)
						end				
					end
        end,
				100,
				"t3_highlight_building_repeat"
			)
			--highlight_component(false, true, "settlement_panel","main_settlement_panel", "settlement_1", "building_slot_"..slot_number)	
			--highlight_component(true, false, "construction_popup","list_holder","options_buttons","options_list","button_repair")	
        end,
       	false
    )
	core:add_listener(
		"FTUE_building_repair_started",
		"ComponentLClickUp",
		function(context)
			return context.string == "button_repair"
		end,
		function(context)
			--Dehighlighting the slot just in case the player insta clicked the repair
			cm:remove_callback("find_building_to_repair")
			core:remove_listener("FTUE_settlement_deselected")
			core:remove_listener("FTUE_building_rollout_displayed")
			cm:remove_real_callback("t3_highlight_building_repeat")
			
			cm:complete_objective(tut.advisor_texts.turn_3.v2_city_restoration_3_ram.repair_building_objective)
			highlight_component(false, true, "settlement_panel","main_settlement_panel", "settlement_1", "building_slot_"..slot_number)
			highlight_component(false, false, "construction_popup","list_holder","options_buttons","options_list","button_repair")
			common.enable_info_overlays(false)
			
			cm:checkpoint_reached(
				315,														-- checkpoint id
				function()	
					cm:callback(
						function()
							t3_city_repair_started()
						end,
						2
					)
				end,													-- post-update callback
				tut.SHOULD_SAVE_EVERY_CHECKPOINT_MID,				-- should save game
				tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or false			-- always generate named savegame, rather than autosaving
			)
		end,
		false
	)
	-- core:add_listener(
    --     "FTUE_building_repaired",
    --     "CampaignBuildingRepaired",
    --     function(context) return context:garrison_residence():region():name() == tut.nekhel end,
    --     function(context)
	-- 		-- ADD LOOP USING THE LISTENER BELOW
	-- 		core:remove_listener("neb_gehes_selected")			
    --     end,
    --    	false
    -- )
end

--------------------------------------------------------------------------------------------------
-- CHECKPOINT 315: building repair started
--------------------------------------------------------------------------------------------------

local checkpoint_315_str = common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_repair_after")

cm:add_checkpoint( 
 	315,																	-- checkpoint id
 	function(is_loading_game, checkpoint_id)								-- checkpoint function
 		core:progress_on_loading_screen_dismissed(t3_city_repair_started)
 	end,
 	false,																	-- call function when checkpoint reached
 	checkpoint_315_str									-- opt string name
)

function t3_city_repair_started()
	cm:clear_infotext()
	cm:show_advice(
		tut.advisor_texts.turn_3.v2_resource_panel_1_pract.advice_key,
		false,
		false,
		function ()
			cm:dismiss_advice()
		end,
		5,
		tut.NEXT_ADVICE_DELAY_S
	)
	cm:callback(
		function()
			t3_reveal_mre_food_wood()
		end,
		5
	)
end

function t3_reveal_mre_food_wood()
	uim:override("journal"):lock()
	uim:override("hide_resources_bar"):unlock()
	uim:override("hide_faction_widget_buttons"):unlock()
	--
	-- attempted to attach it to override, but not working properly
	set_component_visible_with_parent(false, core:get_ui_root(), "faction_widget", "main_buttons", "fm_phar_ancient_legacies_container");
	set_component_visible_with_parent(false, core:get_ui_root(), "faction_widget", "main_buttons", "fm_phar_pharaoh_crown_container");

	local mre = find_uicomponent(core:get_ui_root(), "hud_campaign", "faction_widget", "resources_container")
	if mre then
		--pulse_uicomponent(mre, true, 10)
		mre:Highlight(true, true, 0, true)
	end

	local ap = active_pointer:new(
		"show_resource_bar",
		"topright",
		function()
			return mre
		end,
		"ui_text_replacements_localised_text_phar_text_pointer_show_mre",
		0.5,
		1,
		nil,
		true
	)
	ap:add_hide_callback(t3_city_construction_1, 0)
	ap:set_auto_hide_time(tut.TEXT_POINTER_DURATION_S)

	local process_name = "t3_reveal_mre_food_food_wait_for_component"
	local count = 0
	local count_limit = 5

	cm:repeat_callback(
		function()
			count = count + 1

			if mre and mre:Visible() and mre:CurrentAnimationId() == "" then
				cm:remove_callback(process_name)
				ap:show_when_ready()
			elseif count >= count_limit then
				script_error("WARNING: t3_reveal_mre_food_wood() could not find display action pointer after " .. count_limit .. " attempts, proceeding");
				cm:remove_callback(process_name)
				t3_city_construction_1();
			end
		end,
		1,
		process_name
	)	
end

function t3_city_construction_1()
	local mre = find_uicomponent(core:get_ui_root(), "hud_campaign", "faction_widget", "resources_container")
	if mre and mre:Visible() then
		--pulse_uicomponent(mre, false)
		mre:Highlight(false, true)
	end
	common.enable_info_overlays(true)
	cm:show_advice(
		tut.advisor_texts.turn_3.v2_resource_panel_2_ram.advice_key,
		false,
		false,
		function()
			cm:show_advice(
				tut.advisor_texts.turn_3.v2_city_construction_1_pract.advice_key,
				false,
				false,
				function ()
					cm:hide_advisor_without_infotexts()
					t3_city_construction_2()
				end,
				6,
				0
			)
			tut_add_infotext(tut.advisor_texts.turn_3.v2_city_construction_1_pract.infotext)
		end,
		4,
		tut.NEXT_ADVICE_DELAY_S
	)

end

function t3_city_construction_2()
	if not uim:is_settlement_selected("settlement:" .. tut.nekhel) and not t3_building_construction_has_been_issued then
		cm:reset_objective_chain(tut.advisor_texts.turn_3.v2_city_restoration_3_ram.select_nekhel_objective)
		cm:set_objective(tut.advisor_texts.turn_3.v2_city_restoration_3_ram.select_nekhel_objective)
		uim:highlight_settlement_for_selection(
			"settlement:" .. tut.nekhel,
			tut.north_sinai_province,
			function()
				cm:complete_objective(tut.advisor_texts.turn_3.v2_city_restoration_3_ram.select_nekhel_objective)
				t3_city_construction_3()
			end
		)
	else
		t3_city_construction_3()
	end
end

function t3_city_construction_3()
	cm:set_objective(tut.advisor_texts.turn_3.v2_city_construction_1_pract.build_objective)

	if not t3_building_construction_has_been_issued then
		-- Start a polling process to highlight the empty slot, building category or building
		t3_building_construction_start_highlighting_poll(1, 4, "phar_main_resource_production", "phar_main_all_resource_production_bronze_mine_1")

		-- Listen for building being constructed
		core:add_listener(
			"FTUE_building_construction",
			"BuildingConstructionStarted",
			function(context)
				return context:building_chain() == "phar_main_bronze_mine"
			end,
			function(context)
				core:remove_listener("FTUE_building_construction")

				t3_building_construction_stop_highlighting_poll()

				t3_building_construction_has_been_issued = true
				t3_building_contruction_started()
			end,
			false
		)

		-- Listen for settlement being deselected
		core:add_listener(
			"FTUE_building_construction",
			"SettlementDeselected",
			true,
			function()
				core:remove_listener("FTUE_building_construction")

				t3_building_construction_stop_highlighting_poll()

				t3_city_construction_2()
			end,
			false
		)

	else
		t3_building_contruction_started()
	end
end


local t3_building_construction_highlight_process_name = "t3_building_construction_highlight"
local t3_building_construction_highlighted_uicomponent = false


-- Get free slot uicomponent, if one is visible/onscreen, for building construction highlighting
function t3_building_construction_get_visible_slot_icon(settlement_num_on_panel, first_free_slot_num)
	local uic = find_uicomponent("settlement_panel", "main_settlement_panel", "settlement_" .. settlement_num_on_panel, "building_slot_" .. first_free_slot_num)
	if uic and uic:Visible(true) and is_fully_onscreen(uic) then
		return uic
	end
end


-- Get building category uicomponent, if one is visible/onscreen, for building construction highlighting
function t3_building_construction_get_visible_building_category_icon(category)
	local uic = find_uicomponent("construction_popup", "list_holder", "category_icons", category)
	if uic and uic:Visible(true) and is_fully_onscreen(uic) then
		return uic
	end
end


-- Get building uicomponent, if one is visible/onscreen, for building construction highlighting
function t3_building_construction_get_visible_building_icon(building_name)
	local uic = find_uicomponent("second_construction_popup", "list_holder", "building_tree", "slot_parent", building_name)
	if uic and uic:Visible(true) and is_fully_onscreen(uic) then
		return uic
	end
end


-- Set up a repeating realtime process to query the ui every 100ms looking for building/category/slot icons to highlight
function t3_building_construction_start_highlighting_poll(settlement_num_on_panel, first_free_slot_num, building_category, building_name)
	cm:repeat_real_callback(
		function()
			local uic_to_highlight;

			-- Try to find a building icon, then building category icon, then free slot icon, in that order
			local uic_building_icon = t3_building_construction_get_visible_building_icon(building_name)
			if uic_building_icon then
				uic_to_highlight = uic_building_icon
			else
				local uic_building_category_icon = t3_building_construction_get_visible_building_category_icon(building_category)
				if uic_building_category_icon then
					uic_to_highlight = uic_building_category_icon
				else
					local uic_slot_icon = t3_building_construction_get_visible_slot_icon(settlement_num_on_panel, first_free_slot_num)
					if uic_slot_icon then
						uic_to_highlight = uic_slot_icon
					end
				end
			end

			if uic_to_highlight then
				-- We have found a uicomponent to highlight, but only perform the highlighting operation if we're not currently highlighting it
				if t3_building_construction_highlighted_uicomponent ~= uic_to_highlight then
					-- We're changing what we're highlighting - unhighlight the old thing, highlight the new thing, and record what we're now highlighting
					if t3_building_construction_highlighted_uicomponent and t3_building_construction_highlighted_uicomponent:IsValid() then
						t3_building_construction_highlighted_uicomponent:Highlight(false, true)
					end
					t3_building_construction_highlighted_uicomponent = uic_to_highlight
					uic_to_highlight:Highlight(true, true)
				end
			else
				-- We haven't found anything to highlight on this pass, so make sure we also unhighlight any previously-highlighted component, assuming it's still valid in memory
				if t3_building_construction_highlighted_uicomponent then
					if t3_building_construction_highlighted_uicomponent:IsValid() then
						t3_building_construction_highlighted_uicomponent:Highlight(false, true)
					end
					t3_building_construction_highlighted_uicomponent = false
				end
			end
		end,
		100,
		t3_building_construction_highlight_process_name
	)
end


-- Stop any repeating process set up by the function above, and unhighlight any component it may have highlighted
function t3_building_construction_stop_highlighting_poll()
	cm:remove_real_callback(t3_building_construction_highlight_process_name);
		
	if t3_building_construction_highlighted_uicomponent then
		if t3_building_construction_highlighted_uicomponent:IsValid() then
			t3_building_construction_highlighted_uicomponent:Highlight(false, true);
		end
		t3_building_construction_highlighted_uicomponent = false
	end
end


function t3_building_contruction_started()
	cm:clear_infotext()
	cm:complete_objective(tut.advisor_texts.turn_3.v2_city_construction_1_pract.build_objective)
	cm:remove_objective(tut.advisor_texts.turn_3.v2_city_restoration_3_ram.select_nekhel_objective)
	cm:remove_objective(tut.advisor_texts.turn_3.v2_city_restoration_3_ram.repair_building_objective)
	cm:remove_objective(tut.advisor_texts.turn_3.v2_city_construction_1_pract.build_objective)
	
	cm:callback(
		function()
			CampaignUI.ClearSelection();
		end,
		tut.OBJECTIVE_REMOVE_DELAY
	)

	local bronze_building_uic = find_uicomponent(core:get_ui_root(), "second_construction_popup","list_holder","building_tree", "phar_main_all_resource_production_bronze_mine_1")
	if bronze_building_uic then
		bronze_building_uic:Highlight(false, false);
	end
	cm:checkpoint_reached(
		320,														-- checkpoint id
		function()												-- post-update callback
			cm:callback(
				function()
					t3_city_construction_4()
				end,
				1
			)
		end,
		tut.SHOULD_SAVE_EVERY_CHECKPOINT_MID,				-- should save game
		tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or false			-- always generate named savegame, rather than autosaving
	)
end
--------------------------------------------------------------------------------------------------
-- CHECKPOINT 320: City construction started
--------------------------------------------------------------------------------------------------

local checkpoint_320_str = common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_construction")

cm:add_checkpoint( 
	320,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		core:progress_on_loading_screen_dismissed(t3_city_construction_4)
	end,
	false,													-- call function when checkpoint reached
	checkpoint_320_str							-- opt string name
)

cm:add_checkpoint_setup_callback(
	320,														-- checkpoint id to add setup callback
	function(is_loading_game, checkpoint_id)				-- setup function
		t3_set_army_panel_visible()
	end,
	false													-- call function when checkpoint reached
)

function t3_set_army_panel_visible()
	uim:override("army_panel_visible"):unlock()
	--make sure these do not change their state
	uim:override("journal"):lock()
	uim:override("hide_resources_bar"):unlock()
	uim:override("hide_faction_widget_buttons"):unlock()
	set_component_visible_with_parent(false, core:get_ui_root(), "faction_widget", "main_buttons", "fm_phar_ancient_legacies_container");
	set_component_visible_with_parent(false, core:get_ui_root(), "faction_widget", "main_buttons", "fm_phar_pharaoh_crown_container");
end

function t3_city_construction_4()
	cm:disable_movement_for_character(cm:char_lookup_str_fm(tut.player_faction_leader_fm_cqi))
	cm:show_advice(
		tut.advisor_texts.turn_3.v2_city_construction_2_pract.advice_key,
		false,
		false,
		function()
			cm:hide_advisor_without_infotexts()
			t3_threat_elimination()
		end,
		5
	)
end

function t3_threat_elimination()
	cm:show_advice(
		tut.advisor_texts.turn_3.v2_threat_elimination_ram.advice_key,
		false,
		false,
		function()
			cm:hide_advisor_without_infotexts()
			t3_ambitions()
		end,
		5
	)
end

function t3_ambitions()
	cm:show_advice(
		tut.advisor_texts.turn_3.v2_ambitions_mern.advice_key,
		false,
		false,
		function()
			cm:hide_advisor_without_infotexts()
		end,
		5
	)
	tut_add_infotext(tut.advisor_texts.turn_3.v2_ambitions_mern.infotext)
	
	ambitions.generate_specific_ambitions_with_intervention(tut.player_faction_key, {"phar_tutorial_ambition_1_threat_elimination"})
	
	tut_ambitions_highlight("FTUE_T3_Ambition_Highlight_Wait")
	
	core:add_listener(
		"FTUE_AmbitionSelected_1",
		"MissionIssued",
		function(context)
			return context:mission():mission_record_key() == "phar_tutorial_ambition_1_threat_elimination"
		end,
		function()
			t3_attack_sukkot_army()
		end,
		false
	)
end

function t3_attack_sukkot_army()

	-- Re-apply the end turn lock when the intervention sequence is finished
	core:add_listener(
		"FTUE_AmbitionInterventionCompleted",
		"ScriptEventInterventionSequenceCompleted",
		true,
		function()
			uim:override("end_turn"):lock();
		end,
		false
	)

	cm:enable_movement_for_character(cm:char_lookup_str_fm(tut.player_faction_leader_fm_cqi))
	t3_sukkot_army_2_behaviour_listeners()

	t3_unlock_sidemenu()

	local ramesses_cqi = cm:get_character_by_fm_cqi(tut.player_faction_leader_fm_cqi):command_queue_index()
	local sukkot_hero_2 = cm:get_character_by_fm_cqi(tut.sukkot_hero_2_fm_cqi)
	local sukkot_hero_2_cqi = sukkot_hero_2:command_queue_index()
	cm:set_force_has_retreated_this_turn(sukkot_hero_2)
	local sa = intro_campaign_select_and_attack_advice:new(
		-- player_cqi, enemy_cqi, initial_advice, selection_objective, attack_advice, attack_objective, end_callback
		ramesses_cqi,
		sukkot_hero_2_cqi,
		tut.advisor_texts.turn_3.v2_chase_the_enemy_1_ram.advice_key,
		tut.advisor_texts.turn_3.v2_chase_the_enemy_1_ram.selection_objective,
		tut.advisor_texts.turn_3.v2_chase_the_enemy_2_pract.advice_key,
		tut.advisor_texts.turn_3.v2_chase_the_enemy_2_pract.eliminate_general_objective,
		function()
			
		end
	)
	cm:scroll_camera_from_current(true, 10, {440.206207, 707.880188, 10.903116, 2.479991, 6.013581})
	--sa:set_camera_position_override(434.154938, 699.388794, 15.813412, 1.155996, 13.715659)
	--sa:add_initial_infotext(unpack(tut.advisor_texts.turn_2.attacking_advice.initial_infotext))
	sa:add_attack_infotext(unpack(tut.advisor_texts.turn_3.v2_chase_the_enemy_2_pract.infotext))
	sa:start()
end

function t3_sukkot_army_2_behaviour_listeners()
	core:add_listener(
		"FTUE_SukhotArmy2StandsGround",
		"PanelOpenedCampaign",
		function(context)
			return cm:turn_number() == 3 and context.string == "popup_pre_battle" 
		end,
		function(context)
			core:remove_listener("FTUE_SukhotArmy2Retreats")

			cm:clear_infotext()
			cm:callback(
				function()
					--uim:highlight_pre_battle_options(true)
					tut_highlight_pre_battle_attack(true)
				end,
				0.2
			)

			cm:show_advice(
				tut.advisor_texts.turn_3.v2_sukkot_army_2_stands_their_ground_ram.advice_key,
				false,
				false,
				function()
					cm:dismiss_advice()
				end,
				5
			)
			cm:checkpoint_reached(
				330,	
				function()													-- checkpoint id
					t3_battle_entered_checkpoint()
					t3_sukkot_army_post_battle_listener()
				end,													-- post-update callback
				tut.SHOULD_SAVE_EVERY_CHECKPOINT_MID,				-- should save game
				tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or false			-- always generate named savegame, rather than autosaving
			)
		end,
		false
	)

	core:add_listener(
		"FTUE_SukhotArmy2Retreats",
		"CharacterWithdrewFromBattle",
		function(context)
			return cm:turn_number() == 3 and context:character():family_member():command_queue_index() == tut.sukkot_hero_2_fm_cqi
		end,
		function(context)
			core:remove_listener("FTUE_SukhotArmy2StandsGround")
			cm:show_advice(
				tut.advisor_texts.turn_3.v2_sukhot_army_2_flee_ram.advice_key,
				false,
				false,
				function()
					cm:dismiss_advice()
				end,
				5
			)

			cm:disable_movement_for_character(cm:char_lookup_str_fm(tut.player_faction_leader_fm_cqi))
			cm:reset_objective_chain(tut.advisor_texts.turn_3.v2_chase_the_enemy_2_pract.eliminate_general_objective)
			cm:set_objective(tut.advisor_texts.turn_3.v2_chase_the_enemy_2_pract.eliminate_general_objective)
			cm:callback(
				function()
					t3_start_recruitment_mandatory_checkpoint()
					core:remove_listener("FTUE_popup_battle_results_opened")
				end,
				10
			)
		end,
		false
	)
	local ramesses_cqi = cm:get_character_by_fm_cqi(tut.player_faction_leader_fm_cqi):command_queue_index()
	cm:disable_movement_for_character("character_cqi:" .. ramesses_cqi)
end

function t3_sukkot_army_post_battle_listener()
	core:add_listener(
		"FTUE_popup_battle_results_opened",
		"PanelOpenedCampaign",
		function(context) return context.string == "popup_battle_results" end,
		function(context)
			cm:progress_on_post_battle_panel_visible(
				function()								
					uim:highlight_post_battle_options(true)
				end,
				1
			)
		end,
		false
	)
end

--------------------------------------------------------------------------------------------------
-- CHECKPOINT 330: Battle Entered
--------------------------------------------------------------------------------------------------

local checkpoint_330_str = common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_battle")

cm:add_checkpoint( 
	330,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		core:progress_on_loading_screen_dismissed(t3_battle_entered_checkpoint)
	end,
	false,													-- call function when checkpoint reached
	checkpoint_330_str							-- opt string name
)

cm:add_checkpoint_setup_callback(
	330,
	function(is_loading_game, checkpoint_id)				-- setup function
		t3_unlock_sidemenu()
	end,
	false
)

function t3_unlock_sidemenu()
	uim:override("hide_sidemenu"):unlock()
	local al_button = find_uicomponent(core:get_ui_root(), "hud_campaign", "faction_widget_holder", "faction_widget", "faction_widget_list", "main_buttons", "main_buttons_container", "fm_phar_ancient_legacies_container", "fm_phar_ancient_legacies_slot")
	al_button:SetVisible(false)
	local power_of_the_crown = find_uicomponent(core:get_ui_root(), "hud_campaign", "faction_widget_holder", "faction_widget", "faction_widget_list", "main_buttons", "main_buttons_container", "fm_phar_pharaoh_crown_container")
	power_of_the_crown:SetVisible(false)
end

function t3_battle_entered_checkpoint()
	core:add_listener(
		"FTUE_SukhotArmy2StandsPostBattle",
		"BattleCompletedPostModelNotify",
		function(context)
			local ramesses = cm:get_character_by_fm_cqi(tut.player_faction_leader_fm_cqi)
			return cm:pending_battle_cache_char_is_attacker(ramesses) and cm:turn_number() == 3
		end,
		function(context)
			local ramesses = cm:get_character_by_fm_cqi(tut.player_faction_leader_fm_cqi)
			local ramesses_mf = ramesses:military_force() -- this should never be nil in the tutorial unless Ramesses is dead
			local ramesses_units = ramesses_mf:unit_list():num_items()

			local sukkot_hero_3 = cm:get_character_by_fm_cqi(tut.sukkot_hero_3_fm_cqi)
			if sukkot_hero_3 then
				local sukkot_hero_3_units = sukkot_hero_3:military_force():unit_list():num_items()
				
				local min_army_difference_needed_to_increase_enemy_army = 3
				local increase_enemy_army_amount =  ramesses_units - sukkot_hero_3_units - min_army_difference_needed_to_increase_enemy_army
				for i=0, increase_enemy_army_amount do
					cm:grant_unit_to_character(cm:char_lookup_str(sukkot_hero_3), false, "phar_main_nat_wes_libu_tribesmen")
				end
			end
			
			local sukkot_hero_2 = cm:get_character_by_fm_cqi(tut.sukkot_hero_2_fm_cqi)
			if not sukkot_hero_2 or (sukkot_hero_2 and sukkot_hero_2:is_null_interface()) then
				cm:create_force(
					tut.sukhot_faction_key,
					"phar_main_nat_wes_libu_tribesmen",
					"phar_main_east_sinai_beersheba",
					657,
					941,
					false,
					function(cqi)
						local fm_cqi = cm:get_character_by_cqi(cqi):family_member():command_queue_index()
						cm:set_saved_value("sukkot_hero_4_fm_cqi", fm_cqi)
						tut.sukkot_hero_4_fm_cqi = fm_cqi
					end
				)
			end
			
			cm:clear_infotext()

			cm:disable_movement_for_character(cm:char_lookup_str_fm(tut.player_faction_leader_fm_cqi))
			
			local ambitions_panel_opened = false 
			core:add_listener(
				"FTUE_AmbitionsPanelOpened",
				"PanelOpenedCampaign",
				function(context)
					return context.string == "events" and cm:turn_number() == 3
				end,
				function(context)		
					ambitions_panel_opened = true
					t3_close_ambition_highlight()
				end,
				false
			)

			core:add_listener(
				"FTUE_AmbitionCompleted_1",
				"MissionSucceeded",
				function(context)
					return context:mission():mission_record_key() == "phar_tutorial_ambition_1_threat_elimination"
				end,
				function()
					cm:callback(
						function()
							if not ambitions_panel_opened then
								core:remove_listener("FTUE_AmbitionsPanelOpened")
								t3_start_recruitment_mandatory_checkpoint()
							end
						end,
						7
					)
				end,
				false
			)
			--t3_start_recruitment_mandatory_checkpoint()			
		end,
		false
	)
end


function t3_close_ambition_highlight()
	local close_ambitions_button_uic = find_uicomponent(core:get_ui_root(), "panel_manager", "events", "event_mission", "quest_details","ambition_event_message", "button_set", "accept", "button_accept")
	if close_ambitions_button_uic then
		close_ambitions_button_uic:Highlight(true, false, 0, true)
	end

	core:add_listener(
        "FTUE_AmbitionClosed",
        "PanelClosedCampaign",
        function(context) 
			return context.string == "events"
		end,
        function(context)
	 		t3_start_recruitment_mandatory_checkpoint()
        end,
        false
    )
end


function t3_start_recruitment_mandatory_checkpoint()
	cm:checkpoint_reached(
		340,	
		function()													-- checkpoint id
			t3_start_recruitment_mandatory()
		end,													-- post-update callback
		tut.SHOULD_SAVE_EVERY_CHECKPOINT_MID,				-- should save game
		tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or false			-- always generate named savegame, rather than autosaving
	)
end

------------------------------------------------------------------------------------------------
-- CHECKPOINT 340: Pre recruitment
------------------------------------------------------------------------------------------------

local checkpoint_340_str = common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_recruitment")

cm:add_checkpoint( 
	340,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		core:progress_on_loading_screen_dismissed(t3_start_recruitment_mandatory)
	end,
	false,													-- call function when checkpoint reached
	checkpoint_340_str							-- opt string name
)

cm:add_checkpoint_setup_callback(
	340,														-- checkpoint id to add setup callback
	function(is_loading_game, checkpoint_id)				-- setup function
		t3_disable_cancel_recruitment()
	end,
	false													-- call function when checkpoint reached
)

function t3_disable_cancel_recruitment()
	-- the recruitment advice disables cancel_recruitment because we don't want the player to be able to do it at that point. Now we enable it again.
	uim:override("cancel_recruitment"):set_allowed(false)
	uim:override("recruit_units"):unlock()
	--uim:override("hide_sidemenu"):unlock()
end
	

function t3_start_recruitment_mandatory()
	local ramesses = cm:get_character_by_fm_cqi(tut.player_faction_leader_fm_cqi)
	local ramesses_cqi = ramesses:command_queue_index()

	--cm:disable_movement_for_character(cm:char_lookup_str_fm(tut.player_faction_leader_fm_cqi))
	cm:zero_action_points(cm:char_lookup_str_fm(tut.player_faction_leader_fm_cqi))

	local recruitment_slots = 2 -- default value
	if ramesses:has_region() then
		recruitment_slots = ramesses:region():province():bonus_values_for_faction(tut.player_faction_key):basic_value("recruitment_points")
	end
	
	tut.advisor_texts.turn_3.v2_recruitment_pract.recruitment_limit = recruitment_slots

	local recruitment_advice_scripted = intro_campaign_recruitment_advice:new(
		ramesses_cqi,
		tut.advisor_texts.turn_3.v2_recruitment_pract.advice_key,
		tut.advisor_texts.turn_3.v2_recruitment_pract.selection_objective,
		tut.advisor_texts.turn_3.v2_recruitment_pract.panel_objective,
		tut.advisor_texts.turn_3.v2_recruitment_pract.recruitment_objective,
		tut.advisor_texts.turn_3.v2_recruitment_pract.recruitment_limit,
		"",
		function()
			
		end
	);
	--recruitment_advice_scripted:add_initial_infotext(unpack(tut.advisor_texts.turn_3.v2_recruitment_pract.initial_infotext));
	recruitment_advice_scripted:add_initial_infotext(unpack(tut.advisor_texts.turn_3.v2_recruitment_pract.infotext));
	--recruitment_advice_scripted:add_unit_card_infotext(unpack(tut.advisor_texts.turn_3.v2_recruitment_pract.unit_card_infotext));

	recruitment_advice_scripted:set_all_units_recruited_callback(
		function()
			cm:callback(
				function()
					cm:end_objective_chain("recruitment_tutorial")
					cm:dismiss_advice()
				end,
				2
			)
			cm:checkpoint_reached(
				350,														-- checkpoint id
				function()													-- checkpoint id
					cm:callback(
						function()
							t3_show_existence_of_recruitment_scripted_tour()
						end,
						3
					)
				end,													-- post-update callback
				tut.SHOULD_SAVE_EVERY_CHECKPOINT_MID,				-- should save game
				tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or false			-- always generate named savegame, rather than autosaving
			)
		end
	)
	
	--cm:scroll_camera_from_current(true, 10, {440.206207, 707.880188, 10.903116, 2.479991, 6.013581})
	recruitment_advice_scripted:start();
end

--To add to recrtuitment scripted tour
-- local uicomponent_upkeep_cost = find_uicomponent(core:get_ui_root(), "units_panel", "main_units_panel", "dy_upkeep")
-- core:show_fullscreen_highlight_around_components(
-- 	0,
-- 	nil,
-- 	false,
-- 	uicomponent_upkeep_cost
-- )

--------------------------------------------------------------------------------------------------
-- CHECKPOINT 350: player has ended turn
--------------------------------------------------------------------------------------------------

local checkpoint_350_str = common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_recruitment_end")

cm:add_checkpoint( 
	350,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		t3_show_existence_of_recruitment_scripted_tour()
	end,
	false,													-- call function when checkpoint reached
	checkpoint_350_str						-- opt string name
)


function t3_show_existence_of_recruitment_scripted_tour()
	cm:show_advice(tut.advisor_texts.turn_3.v2_scripter_tours_pract.advice_key,
		false,
		false,
		function()
			cm:hide_advisor_without_infotexts()
		end,
		tut.ADVICE_DURATION_S
	)
	tut_add_infotext(tut.advisor_texts.turn_3.v2_scripter_tours_pract.infotext)

	local ramesses = cm:get_character_by_fm_cqi(tut.player_faction_leader_fm_cqi)
	if not uim:is_char_selected(ramesses) then
		cm:set_objective(tut.advisor_texts.turn_1.v2_hero_selection_ram.objective_key)
		uim:highlight_character_for_selection(
			ramesses,
			function()
				cm:complete_objective(tut.advisor_texts.turn_1.v2_hero_selection_ram.objective_key)
				cm:set_objective(tut.advisor_texts.turn_3.v2_scripter_tours_pract.overlay_objective)
				info_overlay_cheat_sheet_and_highlight(t3_info_overlay_opened_callback, t3_info_overlay_completion_callback)
			end
		)
	else
		cm:set_objective(tut.advisor_texts.turn_3.v2_scripter_tours_pract.overlay_objective)
		cm:callback(
			function()
				info_overlay_cheat_sheet_and_highlight(t3_info_overlay_opened_callback, t3_info_overlay_completion_callback)
			end,
			4
		)
	end
	
	
	--recently added
	--uim:override("recruit_units"):set_allowed(true);
end

function t3_info_overlay_opened_callback()
	cm:callback(
		function()
			for i=0, 10 do
				local scripted_tour_hero_uic = find_uicomponent(core:get_ui_root(), "info_overlay", "character_content_overlay"..i, "character_content_overlay"..i.."_tour_button")
				if scripted_tour_hero_uic then
					scripted_tour_hero_uic:SetVisible(false)
				end
				local units_tour_uic = find_uicomponent(core:get_ui_root(), "info_overlay", "units_overlay"..i.."_tour_button")
				if units_tour_uic then
					units_tour_uic:Highlight(true, false, 0, true)
				end
			end
		end,
		0.1
	)
end

function t3_info_overlay_completion_callback()
	local scripted_tour_hero = find_uicomponent(core:get_ui_root(), "info_overlay", "character_content_overlay3", "character_content_overlay3_tour_button")
	if scripted_tour_hero then
		scripted_tour_hero:SetVisible(true)
	end
	cm:callback(
		function()
			core:hide_fullscreen_highlight()
		end,
		0.2
	)

	cm:checkpoint_reached(
		360,														-- checkpoint id
		function()													-- checkpoint id
			tut_complete_and_remove_objective(tut.advisor_texts.turn_1.v2_hero_selection_ram.objective_key)
			tut_complete_and_remove_objective(tut.advisor_texts.turn_3.v2_scripter_tours_pract.overlay_objective)
			t3_end_turn()
		end,													-- post-update callback
		tut.SHOULD_SAVE_EVERY_CHECKPOINT_START_END,				-- should save game
		tut.ALWAYS_GENERATE_NAMED_SAVEGAMES or true			-- always generate named savegame, rather than autosaving
	)
end

local checkpoint_360_str = "3 " .. common.get_localised_string("ui_text_replacements_localised_text_phar_main_tutorial_save_end")

cm:add_checkpoint( 
	360,														-- checkpoint id
	function(is_loading_game, checkpoint_id)				-- checkpoint function
		t3_end_turn()
	end,
	false,													-- call function when checkpoint reached
	checkpoint_360_str						-- opt string name
)

function t3_end_turn()
	--cm:scroll_camera_from_current(true, 10, {438.528748, 716.034241, 10.438147, -0.101003, 5.710803})
							
	cm:dismiss_advice()
	cm:show_advice(
		tut.advisor_texts.turn_3.v2_end_turn_3_pract.advice_key,
		false,
		false,
		function ()
			cm:hide_advisor_without_infotexts()
			end_turn_highlight(true)
		end,
		tut.ADVICE_DURATION_S
	)
	tut_add_infotext(tut.advisor_texts.turn_1.v2_end_turn_pract.infotext)

	core:add_listener(
		"FTUE_SukhotFactionTurnStart_3",
		"FactionBeginTurnPhaseNormal",
		function(context) return context:faction():name() == tut.sukhot_faction_key and cm:turn_number() == 3 end,
		function(context)
			local sukkot_hero_4 
			if tut.sukkot_hero_4_fm_cqi then
				sukkot_hero_4 = cm:get_character_by_fm_cqi(tut.sukkot_hero_4_fm_cqi)
			end
			if sukkot_hero_4 and not sukkot_hero_4:is_null_interface() then
				cm:disable_movement_for_character("character_cqi:" .. sukkot_hero_4:command_queue_index())
			end

			local sukkot_hero_2 = cm:get_character_by_fm_cqi(tut.sukkot_hero_2_fm_cqi)
			if sukkot_hero_2 and not sukkot_hero_2:is_null_interface() then
				local sukkot_hero_2_cqi = sukkot_hero_2:command_queue_index()
				--cm:enable_movement_for_faction(tut.sukhot_faction_key)
				cm:move_character(
					sukkot_hero_2_cqi,
					945,
					941,
					true,
					false,
					function()
						cm:disable_movement_for_faction(tut.sukhot_faction_key)
					end
				)
			end
			local sukkot_hero_3_cqi = cm:get_character_by_fm_cqi(tut.sukkot_hero_3_fm_cqi):command_queue_index()
			--cm:enable_movement_for_faction(tut.sukhot_faction_key)
			cm:move_character(
				sukkot_hero_3_cqi,
				945,
				936,
				true,
				false,
				function()
					cm:disable_movement_for_faction(tut.sukhot_faction_key)
				end
			)
		end,
		false
	)
	--t3_start_non_player_end_turn_listeners()
	t4_start_listener()
end






-- function t3_start_disbanding_tp()
-- 	local uic_first_unit = find_uicomponent(core:get_ui_root(), "units_panel","main_units_panel","units")
-- 	if uic_first_unit and uic_first_unit:Visible() then 
-- 		local disbanding_text_pointer = text_pointer:new_from_component(
-- 			"disbanding_text_pointer",
-- 			"bottom",
-- 			100,
-- 			uic_first_unit,
-- 			0.5,
-- 			0
-- 		)

-- 		disbanding_text_pointer:add_component_text("text", "random_localisation_strings_string_army_details_overlay_subtitle_3")
-- 		disbanding_text_pointer:set_style("semitransparent")
-- 		disbanding_text_pointer:set_topmost(true)
-- 		disbanding_text_pointer:set_show_close_button(true)
-- 		disbanding_text_pointer:set_hide_on_close_button_clicked()
-- 		disbanding_text_pointer:show()
-- 		core:add_listener(
-- 			"FTUE_char_deselected_tp_cleanup", 
-- 			"PanelClosedCampaign",
-- 			true,
-- 			function(context)
-- 				disbanding_text_pointer:hide(true, true)
-- 			end,
-- 			false
-- 		)
-- 	end
-- end






-- function t3_start_surplus_points_advice()
-- 	local ap = active_pointer:new(
--         "show_population_surplus",
--         "bottomright",
--         function()
--             return find_uicomponent(core:get_ui_root(), "settlement_panel", "province_details", "pop_surplus");
--         end,
--         "ui_text_replacements_localised_text_phar_text_pointer_population_surplus",
--         0.25,
--         0.6,
-- 		nil,
-- 		true
--     )

-- 	cm:show_advice(
-- 		tut.advisor_texts.turn_3.practical_advisor_surplus_points.advice_key,
-- 		false,
-- 		false,
-- 		function ()
-- 			cm:progress_on_advice_dismissed(
-- 				"t3_start_military_buildings_advice",
-- 				function()
-- 					ap:hide()
-- 				end,
-- 				tut.NEXT_ADVICE_DELAY_S + 1
-- 			)
-- 		end,
-- 		5,
-- 		tut.NEXT_ADVICE_DELAY_S
-- 	)

-- 	ap:add_hide_callback(t3_start_military_buildings_advice, 0, true)
--     cm:callback(
-- 		function()
-- 			local province_details_ui =  find_uicomponent(core:get_ui_root(), "settlement_panel", "province_details")
-- 			if province_details_ui and province_details_ui:Visible() then
-- 				ap:show_when_ready()
-- 				highlight_component(true, false, "settlement_panel", "province_details", "pop_surplus")
-- 			end
-- 		end,
-- 		tut.NEXT_ADVICE_DELAY_S
-- 	)
-- end