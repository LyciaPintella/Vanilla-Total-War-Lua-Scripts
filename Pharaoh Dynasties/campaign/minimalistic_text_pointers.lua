

out("Loading minimalistic_text_pointers.lua");

-- boilerplate setup for the minimalistic text pointers
-- have variables to stop the execution of them during the FTUE campaign
-- have a variable to enable them in the FTUE

minimalistic_text_pointers = {
	persistent = {
		bool_is_ftue_mode = false,			-- will be reset when savegame is loaded
		bool_show_mtp_in_ftue_mode = false
	}
}

function minimalistic_text_pointers.start_listeners()
	-- listen when we should start in the FTUE campaign
	core:add_listener(
		"minimalistic_text_pointers_ftue_mode_listener",
		"ScriptEventStartMTPinFTUE",
		true,
		function(context)
			minimalistic_text_pointers.persistent.bool_show_mtp_in_ftue_mode = true
			minimalistic_text_pointers.load_minimalistic_text_pointers()
		end,
		true
	)

	-- save and load the needed data
	cm:add_saving_game_callback(
		function(context)
			cm:save_named_value("MTP_PERSISTENT", minimalistic_text_pointers.persistent, context)
		end
	)

	cm:add_loading_game_callback(
		function(context)
			-- first ensure we've loaded the saved data
			local is_ftue_mode = is_tutorial_mode()
			minimalistic_text_pointers.persistent = cm:load_named_value("MTP_PERSISTENT", minimalistic_text_pointers.persistent, context)
			minimalistic_text_pointers.persistent.bool_is_ftue_mode = minimalistic_text_pointers.persistent.bool_is_ftue_mode or is_ftue_mode
			-- actually start the text pointers.
			minimalistic_text_pointers.start_minimalistic_text_pointers()
		end
	)
end

function minimalistic_text_pointers.start_minimalistic_text_pointers()
	-- actually add the text pointers we need at the appropriate time
	if core:get_advice_level() == 0 then
		out("Advice level too low. NO MINIMALISTIC TEXT POINTERS ADDED!")
		return
	elseif minimalistic_text_pointers.persistent.bool_is_ftue_mode and minimalistic_text_pointers.persistent.bool_show_mtp_in_ftue_mode ~= true then
		out("NO MINIMALISTIC TEXT POINTERS ADDED. CRITERIA NOT MET")
		return
	else
		out("ADDING MINIMALISTIC TEXT POINTERS! CRITERIA MET")
		minimalistic_text_pointers.load_minimalistic_text_pointers()
	end
end

-- Code blocks of each text pointer we want.
function minimalistic_text_pointers.load_minimalistic_text_pointers()

	-------------------------------------------------------------
	-- diplomacy_list
	-------------------------------------------------------------



	do
		local ap = active_pointer:new(
			"diplomacy_list",
			"bottomright",
			function()
				local uic_list_box = core:get_ui_root():SequentialFind( "diplomacy_dropdown", "faction_panel", "sortable_list_factions", "list_clip", "list_box");
				if uic_list_box then
					return UIComponent(uic_list_box:Find(1));
				end;
			end,
			"ui_text_replacements_localised_text_troy_mtp_campaign_diplomacy_panel_list",
			0.85,
			0.4
		);

		ap:show_on_event(
			"DiplomacyPanelFactionListPopulated"
		);
	end;


	-------------------------------------------------------------
	-- diplomacy_button_quick_deal
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"diplomacy_button_quick_deal",
			"bottomleft",
			function()
				return core:get_ui_root():SequentialFind( "diplomacy_dropdown", "main_button_bar", "menu_buttons", "button_quick_deal");
			end,
			"ui_text_replacements_localised_text_troy_mtp_campaign_diplomacy_panel_quick_deal",
			0.75,
			0.25
		);

		ap:wait_for_active_pointer("diplomacy_list");

		ap:show_on_event(
			"DiplomacyPanelFactionListPopulated"
		);
	end;


	-------------------------------------------------------------
	-- diplomacy_quick_deal_treaty_types
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"diplomacy_quick_deal_treaty_types",
			"bottomright",
			function()
				local uic_quick_deal_submenu = core:get_ui_root():SequentialFind( "diplomacy_dropdown", "bottom_submenu", "quick_deal_submenu");
				if uic_quick_deal_submenu and uic_quick_deal_submenu:ChildCount() > 0 then
					return UIComponent(uic_quick_deal_submenu:Find(0));
				end;
			end,
			"ui_text_replacements_localised_text_troy_mtp_campaign_diplomacy_panel_quick_deal_treaty_types",
			0.5,
			0.25
		);

		ap:wait_for_active_pointer("diplomacy_list");

		ap:show_on_event(
			"DiplomacyPanelQuickDealListPopulated",
			true
		);
	end;


	-------------------------------------------------------------
	-- ap_diplomacy_quick_deal_opinions
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"diplomacy_quick_deal_opinions",
			"bottomright",
			function()
				local uic_list_box = core:get_ui_root():SequentialFind( "diplomacy_dropdown", "faction_panel", "sortable_list_factions", "list_clip", "list_box");
				if uic_list_box then
					local uic_row_entry = UIComponent(uic_list_box:Find(0));
					if uic_row_entry then
						local uic_quick_deal = find_uicomponent(uic_row_entry, "quick_deal");
						if uic_quick_deal then
							return uic_quick_deal;
						end;
					end;
				end;
			end,
			"ui_text_replacements_localised_text_troy_mtp_campaign_diplomacy_panel_quick_deal_opinions",
			0.5,
			0.25
		);

		ap:wait_for_active_pointer("diplomacy_quick_deal_treaty_types");

		ap:show_on_event(
			"ScriptEventDiplomacyQuickDealButtonClicked",
			true
		);
	end;


	-------------------------------------------------------------
	-- ap_diplomacy_panel_offers_and_demands
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"diplomacy_panel_offers_and_demands",
			"bottomright",
			function()
				local uic_negotiate_submenu = core:get_ui_root():SequentialFind( "diplomacy_dropdown", "bottom_submenu", "negotiate_submenu");
				if uic_negotiate_submenu and uic_negotiate_submenu:ChildCount() > 0 then
					return UIComponent(uic_negotiate_submenu:Find(0));
				end;
			end,
			"ui_text_replacements_localised_text_troy_mtp_campaign_diplomacy_panel_offers_and_demands",
			0.25,
			0.25
		);

		ap:show_after_active_pointer("diplomacy_list");

		ap:show_on_event(
			"ComponentLDBLClickUp",
			function(context) 
				local uic = UIComponent(context.component);			
				return uicomponent_descended_from(uic, "sortable_list_factions") or uicomponent_descended_from(uic, "faction_icons_parent");
			end
		);
	end;

	-------------------------------------------------------------
	-- ap_diplomacy_panel_vassalize_unlocked
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"diplomacy_panel_vassalize_unlocked",
			"bottomright",
			function()
				return core:get_ui_root():SequentialFind( "diplomacy_dropdown", "bottom_submenu", "negotiate_submenu", "diplomatic_deal_holder", "diplomac_action_possible_15" );
			end,
			"ui_text_replacements_localised_text_phar_main_mtp_campaign_diplomacy_panel_vassalize_unlocked",
			0.5,
			0
		);

		core:add_listener(
			"diplomacy_panel_vassalize_unlocked_start_listeners", 
			"PanelOpenedCampaign", 
			function(context) 
				return  context.string == "diplomacy_dropdown" 
			end, 
			function(context)
				core:add_listener(
					"ap_vassalize_unlocked_click_button_negotiate", 
					"ComponentLClickUp", 
					function(context) 
						return  context.string == "button_negotiate" 
					end, 
					function(context) 
						cm:callback(
							function()
								local uic_vassalize = core:get_ui_root():SequentialFind( "diplomacy_dropdown", "bottom_submenu", "negotiate_submenu", "diplomatic_deal_holder", "diplomac_action_possible_15" );
								if uic_vassalize and uic_vassalize:VisibleFromRoot() and (egypt_political_states:is_pharaoh(cm:get_local_faction_name(true)) or hatti_political_states:is_great_king(cm:get_local_faction_name(true))) then
									ap:show()
								end
							end, 
						2)
					end,
					true)
				core:add_listener(
					"ap_vassalize_unlocked_dblclick", 
					"ComponentLDBLClickUp", 
					true, 
					function(context)
						cm:callback(
							function()
								local uic_vassalize = core:get_ui_root():SequentialFind( "diplomacy_dropdown", "bottom_submenu", "negotiate_submenu", "diplomatic_deal_holder", "diplomac_action_possible_15" );
								if uic_vassalize and uic_vassalize:VisibleFromRoot() and (egypt_political_states:is_pharaoh(cm:get_local_faction_name(true)) or hatti_political_states:is_great_king(cm:get_local_faction_name(true))) then
									ap:show()
								end
							end, 
						2)
					end,
					true)
			end,
			true)

			core:add_listener(
			"diplomacy_panel_vassalize_unlocked_stop_listeners", 
			"PanelClosedCampaign", 
			function(context) 
				return  context.string == "diplomacy_dropdown" 
			end, 
			function(context) 
				core:remove_listener("ap_vassalize_unlocked_dblclick")
				core:remove_listener("ap_vassalize_unlocked_click_button_negotiate")
			end,
			true)
			
	end;


	-------------------------------------------------------------
	-- ap_settlement_side_buttons
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"settlement_side_buttons",
			"bottomright",
			function()	
				return core:get_ui_root():SequentialFind( "settlement_panel", "settlement_panel_title_bar", "form_tabs_icons","button_show_province" )
			end,
			"ui_text_replacements_localised_text_phar_main_mtp_campaign_settlement_side_buttons",
			0.5,
			0
		);

		core:add_listener(
			"ap_settlement_side_buttons", 
			"PanelOpenedCampaign", 
			function(context) 
				return  context.string == "settlement_panel" 
			end, 
			function(context) 
				cm:callback(
					function()
						ap:show()
					end, 
					0.5
				)
			end,
			true)
	end;

	-------------------------------------------------------------
	-- ap_campaign_info_overlay_button
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"campaign_info_overlay_button",
			"topleft",
			function()
				return core:get_ui_root():SequentialFind( "menu_bar", "buttongroup", "holder_help_overlay", "button_help_overlay" );	
			end,
			"ui_text_replacements_localised_text_phar_main_mtp_campaign_info_overlay_button",
			0.5,
			1
		);

		ap:add_hide_on_event_record(
			"PanelOpenedCampaign", 
			function(context) 
				return context.string == "esc_menu_campaign"
			end)

		core:add_listener(
			"campaign_info_overlay_button", 
			"FactionTurnStart", 
			function(context) 
				return context:faction():is_human() and cm:turn_number() >= 10 
			end, 
			function(context) 
				cm:callback(
					function()
						ap:show()
					end, 
					2
				)
			end,
			true)
	end;


	-------------------------------------------------------------
	-- ap_commands_button
	-------------------------------------------------------------
	do
		local ap = active_pointer:new(
			"ap_commands_button",
			"toprightedge",
			function()
				return core:get_ui_root():SequentialFind( "frame_command");	
			end,
			"ui_text_replacements_localised_text_phar_main_mtp_campaign_commands_button",
			0,
			0.5,
			350,
			true
		);

		ap:add_hide_on_event_record(
			"PanelOpenedCampaign", 
			function(context) 
				return context.string == "esc_menu_campaign"
			end)

		core:add_listener(
			"ap_commands_button_listener", 
			"FactionTurnStart", 
			function(context) 
				return context:faction():is_human() and cm:turn_number() == 6
			end, 
			function(context) 
				cm:callback(
					function()
						ap:show()
					end, 
					2
				)
			end,
			true)
	end;

-------------------------------------------------------------
	-- ap_stones_negative_income
	-------------------------------------------------------------
	do
		local ap = active_pointer:new(
			"ap_stones_negative_income",
			"topright",
			function()
				return core:get_ui_root():SequentialFind("hud_campaign", "faction_widget_holder", "faction_widget", "faction_widget_list", "resources_container_holder", "resources_container", "res_troy_stones" );	
			end,
			"ui_text_replacements_localised_text_phar_main_mtp_campaign_stones_negative_income",
			0.5,
			0.5,
			350
		);

		ap:add_hide_on_event_record(
			"PanelOpenedCampaign", 
			function(context) 
				return context.string == "esc_menu_campaign"
			end)

		core:add_listener(
			"ap_stones_negative_income_listener", 
			"FactionTurnStart", 
			function(context) 
				return context:faction():is_human() and cm:turn_number() >= 8 and context:faction():pooled_resource("troy_stones"):income() <= 0
			end, 
			function(context) 
				cm:callback(
					function()
						ap:show()
					end, 
					2
				)
			end,
			true)
	end;

	-------------------------------------------------------------
	-- ap_settlement_corvee_labour
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"settlement_corvee_labour",
			"bottomright",
			function()
				return core:get_ui_root():SequentialFind( "settlement_panel", "settlement_panel_title_bar", "button_corvee_labour" );	
			end,
			"ui_text_replacements_localised_text_phar_main_mtp_campaign_settlement_corvee_labour",
			0.5,
			0
		);

		core:add_listener(
			"ap_settlement_corvee_labour", 
			"PanelOpenedCampaign", 
			function(context) 
				local uic_crv_labour = core:get_ui_root():SequentialFind( "settlement_panel", "settlement_panel_title_bar", "button_corvee_labour")
				return  context.string == "settlement_panel" and uic_crv_labour
			end, 
			function(context) 
				local uic_crv_labour = core:get_ui_root():SequentialFind( "settlement_panel", "settlement_panel_title_bar", "button_corvee_labour")
				cm:callback(
					function()
						if uic_crv_labour:CurrentState() == "active" then
							ap:show()
						end
					end, 
					0.5
				)
			end,
			true)
	end;

	-------------------------------------------------------------
	-- ap_settlement_growth_migration
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"settlement_growth_migration",
			"bottomleft",
			function()
				return core:get_ui_root():SequentialFind( "settlement_panel", "settlement_panel_title_bar", "button_growth_migration" );	
			end,
			"ui_text_replacements_localised_text_phar_main_mtp_campaign_settlement_growth_migration",
			0.5,
			0
		);

		core:add_listener(
			"ap_settlement_growth_migration", 
			"PanelOpenedCampaign", 
			function(context) 
				local uic_gr_mig = core:get_ui_root():SequentialFind( "settlement_panel", "settlement_panel_title_bar", "button_growth_migration")
				return  context.string == "settlement_panel" and uic_gr_mig
			end, 
			function(context) 
				local uic_gr_mig = core:get_ui_root():SequentialFind( "settlement_panel", "settlement_panel_title_bar", "button_growth_migration")
				cm:callback(
					function()
						if uic_gr_mig:CurrentState() == "active" then
							ap:show()
						end
					end, 
					0.5
				)
			end,
			true)
	end;

	-------------------------------------------------------------
	-- ap_settlement_abandon_button
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"settlement_abandon_button",
			"bottomleft",
			function()
				return core:get_ui_root():SequentialFind( "settlement_panel", "main_settlement_panel", "capital", "button_abandon" );	
			end,
			"ui_text_replacements_localised_text_phar_main_mtp_campaign_settlement_abandon_button",
			0.5,
			0
		);
		
		ap:show_after_active_pointer("settlement_side_buttons");

		core:add_listener(
			"ap_settlement_abandon_button", 
			"PanelOpenedCampaign", 
			function(context) 
				local uic_abandon = core:get_ui_root():SequentialFind( "settlement_panel", "main_settlement_panel", "capital", "button_abandon" )
				return  context.string == "settlement_panel" and uic_abandon
			end, 
			function(context) 
				local uic_abandon = core:get_ui_root():SequentialFind( "settlement_panel", "main_settlement_panel", "capital", "button_abandon" )
				cm:callback(
					function()
						if uic_abandon:CurrentState() == "active" and uic_abandon:Visible() then
							ap:show()
						end
					end, 
					0.5
				)
			end,
			true)
	end;

	-------------------------------------------------------------
	-- ap_settlement_deposits
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"settlement_deposits",
			"bottomleft",
			function()
				return core:get_ui_root():SequentialFind( unpack(province_info_panel_ui_component_path), "production", "header_deposits" );	
			end,
			"ui_text_replacements_localised_text_phar_main_mtp_campaign_settlement_deposits",
			0.5,
			0
		);

		ap:show_after_active_pointer("settlement_abandon_button");

		core:add_listener(
			"ap_settlement_deposits", 
			"PanelOpenedCampaign", 
			function(context) 
				local uic_deposits = core:get_ui_root():SequentialFind( unpack(province_info_panel_ui_component_path), "production", "header_deposits" )
				return context.string == "settlement_panel" and uic_deposits:VisibleFromRoot()
			end, 
			function(context) 
				cm:callback(
					function()
						ap:show()
					end, 
					0.5
				)
			end,
			true)
	end;

	-------------------------------------------------------------
	-- ap_royal_decrees_search
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"royal_decrees_search",
			"topright",
			function()
				return core:get_ui_root():SequentialFind( "technology_panel", "listview", "form_text_input" );	
			end,
			"ui_text_replacements_localised_text_phar_main_mtp_campaign_royal_decrees_search",
			0.5,
			1
		);

		core:add_listener(
			"ap_royal_decrees_search", 
			"PanelOpenedCampaign", 
			function(context) 
				return  context.string == "technology_panel"
			end, 
			function(context) 
				cm:callback(
					function()
						ap:show()
					end, 
					0.5
				)
			end,
			true)
	end;


	-------------------------------------------------------------
	-- ap_pharaoh_power_available - one for each court
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"kings_power_available",
			"bottomright",
			function()
				return core:get_ui_root():SequentialFind( "pharaohs_crown", "kings_screen", "crowns_and_powers_holder", "powers", "powers_buttons_holder", "tier_1_powers_holder", "slots_holder", "tier_slot" );	
			end,
			"ui_text_replacements_localised_text_phar_main_mtp_campaign_pharaoh_power_available",
			0.5,
			0
		);

		core:add_listener(
			"ap_kings_power_available", 
			"PanelOpenedCampaign", 
			function(context) 
				return  context.string == "pharaohs_crown" and legitimacy_choice:hatti_legitimacy_unlocked(cm:get_local_faction_name())
			end, 
			function(context) 
				local uic_power = core:get_ui_root():SequentialFind("pharaohs_crown", "kings_screen", "crowns_and_powers_holder", "powers", "powers_buttons_holder", "tier_1_powers_holder", "slots_holder", "tier_slot" )
				cm:callback(
					function()
						if uic_power and uic_power:CurrentState() == "active" then
							ap:show()
						end
					end, 
					0.1
				)
			end,
			true)
	end;

	do
		local ap = active_pointer:new(
			"pharaoh_power_available",
			"bottomright",
			function()
				return core:get_ui_root():SequentialFind( "pharaohs_crown", "pharaoh_screen", "crowns_and_powers_holder", "powers", "powers_buttons_holder", "tier_1_powers_holder", "slots_holder", "tier_slot" );	
			end,
			"ui_text_replacements_localised_text_phar_main_mtp_campaign_pharaoh_power_available",
			0.5,
			0
		);

		core:add_listener(
			"ap_pharaoh_power_available", 
			"PanelOpenedCampaign", 
			function(context) 
				return  context.string == "pharaohs_crown" and legitimacy_choice:egyptian_legitimacy_unlocked(cm:get_local_faction_name())
			end, 
			function(context) 
				local uic_power = core:get_ui_root():SequentialFind("pharaohs_crown", "pharaoh_screen", "crowns_and_powers_holder", "powers", "powers_buttons_holder", "tier_1_powers_holder", "slots_holder", "tier_slot" )
				cm:callback(
					function()
						if uic_power and uic_power:CurrentState() == "active" then
							ap:show()
						end
					end, 
					0.1
				)
			end,
			true)
	end;

	-------------------------------------------------------------
	-- ap_crown_available
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"crown_available",
			"topright",
			function()
				return core:get_ui_root():SequentialFind( "pharaohs_crown", "pharaoh_screen", "crowns_and_powers_holder", "crowns", "crowns_buttons_holder", "nemes" );	
			end,
			"ui_text_replacements_localised_text_phar_main_mtp_campaign_crown_available",
			0.5,
			1
		);

		core:add_listener(
			"ap_crown_available", 
			"PanelOpenedCampaign", 
			function(context) 
				return  context.string == "pharaohs_crown" 
			end, 
			function(context)
				-- TODO fix for new layout PHAR-40247
				local uic_crown = core:get_ui_root():SequentialFind( "pharaohs_crown", "pharaoh_screen", "crowns_and_powers_holder", "crowns", "crowns_buttons_holder", "nemes" )
				if not uic_crown then
					return
				end
				cm:callback(
					function()
						if uic_crown:CurrentState() == "available" or uic_crown:CurrentState() == "equiped" then
							ap:show()
						end
					end, 
					0.1
				)
			end,
			true)
	end;

	-------------------------------------------------------------
	-- ap_legitimacy_war_available
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"legitimacy_war_available",
			"bottomright",
			function()
				return core:get_ui_root():SequentialFind( "pharaohs_crown", "your_legitimacy_holder", "button_start_war" );	
			end,
			"ui_text_replacements_localised_text_phar_main_mtp_campaign_legitimacy_war_available",
			0.5,
			0
		);
		core:add_listener(
			"ap_legitimacy_war_available", 
			"PanelOpenedCampaign", 
			function(context) 
				return  context.string == "pharaohs_crown" 
			end, 
			function(context)
				local uic_panel = core:get_ui_root():SequentialFind( "pharaohs_crown" )
				local uic_panel_choice = core:get_ui_root():SequentialFind( "pharaohs_crown" , "legitimacy_choice" )
				local uic_button_legitimacy_war = core:get_ui_root():SequentialFind( "pharaohs_crown", "your_legitimacy_holder", "button_start_war" )
				cm:callback(
					function()
						if uic_panel and uic_panel_choice:Visible() == false and uic_button_legitimacy_war:VisibleFromRoot() and uic_button_legitimacy_war:CurrentState() == "active" then
							ap:show()
						end
					end, 
					0.1
				)
			end,
			true)
	end;

	-------------------------------------------------------------
	-- ap_competence_point_can_assign
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"competence_point_can_assign",
			"bottomright",
			function()
				return core:get_ui_root():SequentialFind( "character_details_panel", "hero_info", "sidepanel_info_traits", "titles_panel", "competences_list", "authority_competence", "authority_icon");	
			end,
			"ui_text_replacements_localised_text_phar_main_mtp_campaign_competence_point_can_assign",
			0.5,
			0,
			400
		);

		core:add_listener(
			"ap_competence_point_can_assign_panel_opened", 
			"PanelOpenedCampaign", 
			function(context) 
				return  context.string == "character_details_panel" 
			end, 
			function(context) 
				core:add_listener(
					"ap_competence_point_can_assign_component_lclick", 
					"ComponentLClickUp", 
					function(context) 
						return  context.string == "titles_button" 
					end, 
					function(context) 
						local uic_assign_point = core:get_ui_root():SequentialFind( "character_details_panel", "hero_info", "sidepanel_info_traits", "titles_panel", "competences_list", "authority_competence", "button_round_secondary_toggle")
						cm:callback(
							function()
								if uic_assign_point and uic_assign_point:CurrentState() == "active" then
									ap:show()
								end
							end, 
							0.1
						)
					end,
					true
				)
				local uic_assign_point = core:get_ui_root():SequentialFind( "character_details_panel", "hero_info", "sidepanel_info_traits", "titles_panel", "competences_list", "authority_competence", "button_round_secondary_toggle")
				local uic_titles_tab = core:get_ui_root():SequentialFind( "character_details_panel", "tabs_holder", "details_titles_tab", "titles_button")
				cm:callback(
					function()
						if uic_assign_point:CurrentState() == "active" and uic_titles_tab:CurrentState() == "selected" then
							ap:show()
							core:remove_listener("ap_competence_point_can_assign_component_lclick")
						end
					end, 
					0.1
				)
			end,
			true);

		core:add_listener(
			"ap_competence_point_can_assign_panel_closed", 
			"PanelClosedCampaign", 
			function(context) 
				return  context.string == "character_details_panel" 
			end, 
			function(context) 
				core:remove_listener("ap_competence_point_can_assign_component_lclick")
			end,
			true)	
			
	end;

	-------------------------------------------------------------
	-- ap_title_can_assign
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"ap_title_can_assign",
			"bottomright",
			function()
				local uic_title_list = core:get_ui_root():SequentialFind( "character_details_panel", "hero_info", "sidepanel_info_traits", "titles_panel", "unassigned_titles_holder", "unassigned_titles_list_view", "list_clip", "list_box");
				if uic_title_list then
					local uic_first_title = UIComponent(uic_title_list:Find(0));
					if uic_first_title then
						return uic_first_title
					end;
				end;
			end,
			"ui_text_replacements_localised_text_phar_main_mtp_campaign_title_can_assign",
			0.5,
			0
		);

			core:add_listener(
			"ap_title_can_assign_panel_opened", 
			"PanelOpenedCampaign", 
			function(context) 
				return  context.string == "character_details_panel" 
			end, 
			function(context) 
				core:add_listener(
					"ap_title_can_assign_component_lclick", 
					"ComponentLClickUp", 
					function(context) 
						return  context.string == "titles_button" 
					end, 
					function(context) 
						local uic_title_list = core:get_ui_root():SequentialFind( "character_details_panel", "hero_info", "sidepanel_info_traits", "titles_panel", "unassigned_titles_holder", "unassigned_titles_list_view", "list_clip", "list_box");
						cm:callback(
							function()
								if uic_title_list then
									local uic_first_title = UIComponent(uic_title_list:Find(0));
									if uic_first_title and ( uic_first_title:CurrentState() == "available" or uic_first_title:CurrentState() == "assigned" ) then
										ap:show()
									end
								end
							end, 
							0.1
						)
					end,
					true)

				local uic_title_list = core:get_ui_root():SequentialFind( "character_details_panel", "hero_info", "sidepanel_info_traits", "titles_panel", "unassigned_titles_holder", "unassigned_titles_list_view", "list_clip", "list_box");
				local uic_titles_tab = core:get_ui_root():SequentialFind( "character_details_panel", "tabs_holder", "details_titles_tab", "titles_button")
				cm:callback(
					function()
						if uic_title_list then
							local uic_first_title = UIComponent(uic_title_list:Find(0));
							if uic_first_title and ( uic_first_title:CurrentState() == "available" or uic_first_title:CurrentState() == "assigned" ) and uic_titles_tab:CurrentState() == "selected" then
								ap:show()
								core:remove_listener("ap_title_can_assign_component_lclick")
							end
						end
					end,
					0.1
				)
			end,
			true)
			
			core:add_listener(
			"ap_title_can_assign_panel_closed", 
			"PanelClosedCampaign", 
			function(context) 
				return  context.string == "character_details_panel" 
			end, 
			function(context) 
				core:remove_listener("ap_title_can_assign_component_lclick")
			end,
			true)
	end;


	-------------------------------------------------------------
	-- ap_character_background
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"character_background",
			"bottomright",
			function()
				return core:get_ui_root():SequentialFind( "character_details_panel", "hero_info", "sidepanel_info_traits", "details_panel", "list_clip", "list_box", "details", "info_list", "background", "background_name");	
			end,
			"ui_text_replacements_localised_text_phar_main_mtp_campaign_character_background",
			0.05,
			0
		);

			core:add_listener(
			"ap_competence_point_can_assign_panel_opened", 
			"PanelOpenedCampaign", 
			function(context) 
				return  context.string == "character_details_panel" 
			end, 
			function(context) 
				core:add_listener(
					"ap_character_background", 
					"ComponentLClickUp", 
					function(context) 
						local uic_panel = core:is_ui_created() and core:get_ui_root():SequentialFind( "character_details_panel" )
						return  context.string == "button_template" and uic_panel
					end, 
					function(context) 
						local uic_details_tab = core:get_ui_root():SequentialFind( "character_details_panel", "tabs_holder", "details_titles_tab", "button_template")
						cm:callback(
							function()
								if uic_details_tab:CurrentState() == "selected" then
									ap:show()
								end
							end, 
							0.1
						)
					end,
					true)

				local uic_details_tab = core:get_ui_root():SequentialFind( "character_details_panel", "tabs_holder", "details_titles_tab", "button_template")
				cm:callback(
					function()
						if uic_details_tab:CurrentState() == "selected" then
							ap:show()
							core:remove_listener("ap_character_background")
						end
					end, 
					0.1
				)
			end,
			true)

			core:add_listener(
			"ap_title_can_assign_panel_closed", 
			"PanelClosedCampaign", 
			function(context) 
				return  context.string == "character_details_panel" 
			end, 
			function(context) 
				core:remove_listener("ap_character_background")
			end,
			true)
			
	end;


	-------------------------------------------------------------
	-- ap_crown_can_be_equipped
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"crown_can_be_equipped",
			"topleft",
			function()
				return core:get_ui_root():SequentialFind( "character_details_panel", "hero_info", "template_candidate_frame", "portrait_parent", "ancillary_parent", "ancillary_crown", "crown_slot", "crown_0", "ancillary_select_button" );	
			end,
			"ui_text_replacements_localised_text_phar_main_mtp_campaign_crown_can_be_equipped",
			0.5,
			1
		);

		core:add_listener(
			"ap_crown_can_be_equipped", 
			"PanelOpenedCampaign", 
			function(context) 
				return  context.string == "character_details_panel" 
			end, 
			function(context) 
				core:add_listener(
					"ap_crown_can_be_equipped_component_lclick", 
					"ComponentLClickUp", 
					function(context) 
						local uic_character_panel = core:get_ui_root():SequentialFind("character_details_panel")
						return uic_character_panel and uic_character_panel:VisibleFromRoot() and ( context.string == "button_cycle_left" or context.string == "button_cycle_right" )
					end, 
					function(context) 
						local uic_assign_point = core:get_ui_root():SequentialFind( "character_details_panel", "hero_info", "template_candidate_frame", "portrait_parent", "ancillary_parent", "ancillary_crown", "crown_slot", "crown_0", "ancillary_select_button" )
						cm:callback(
							function()
								if uic_assign_point and uic_assign_point:CurrentState() == "active" then
									ap:show()
								end
							end, 
							0.1
						)
					end,
					true)
				
				local uic_crown_holder = core:get_ui_root():SequentialFind( "character_details_panel", "hero_info", "template_candidate_frame", "portrait_parent", "ancillary_parent", "ancillary_crown", "crown_slot", "crown_0", "ancillary_select_button" )
				cm:callback(
					function()
						if uic_crown_holder:CurrentState() == "active" or uic_crown_holder:CurrentState() == "selected" then
							ap:show()
							core:remove_listener("ap_crown_can_be_equipped_component_lclick")
						end
					end, 
					0.1
				)
			end,
			true
		)
			
		core:add_listener(
			"ap_title_can_assign_panel_closed", 
			"PanelClosedCampaign", 
			function(context) 
				return  context.string == "character_details_panel" 
			end, 
			function(context) 
				core:remove_listener("ap_crown_can_be_equipped_component_lclick")
			end,
			true
		)
			

	end;

	-------------------------------------------------------------
	-- ap_local_deities_second_god_available
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"local_deities_second_god_available",
			"bottomleft",
			function()
				return core:get_ui_root():SequentialFind( "local_deities", "worshipped_gods", "god_slot2", "god_portrait")
			end,
			"ui_text_replacements_localised_text_phar_main_mtp_campaign_local_deities_second_god_available",
			0.5,
			0.1
		);

		core:add_listener(
			"ap_local_deities_second_god_available", 
			"PanelOpenedCampaign", 
			function(context) 
				return  context.string == "local_deities" 
			end, 
			function(context) 
				local uic_second_godslot = core:get_ui_root():SequentialFind( "local_deities", "worshipped_gods", "god_slot2", "god_portrait")
				cm:callback(
					function()
						if uic_second_godslot and uic_second_godslot:CurrentState() == "available" then
							ap:show()
						end
					end, 
					0.1
				)
			end,
			true)

	end;

	-------------------------------------------------------------
	-- ap_local_deities_third_god_available
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"local_deities_third_god_available",
			"bottomleft",
			function()
				return core:get_ui_root():SequentialFind( "local_deities", "worshipped_gods", "god_slot3", "god_portrait")
			end,
			"ui_text_replacements_localised_text_phar_main_mtp_campaign_local_deities_third_god_available",
			0.5,
			0.1
		);

		core:add_listener(
			"ap_local_deities_third_god_available", 
			"PanelOpenedCampaign", 
			function(context) 
				return  context.string == "local_deities" 
			end, 
			function(context) 
				local uic_third_godslot = core:get_ui_root():SequentialFind( "local_deities", "worshipped_gods", "god_slot3", "god_portrait")
				cm:callback(
					function()
						if uic_third_godslot and uic_third_godslot:CurrentState() == "available" then
							ap:show()
						end
					end, 
					0.1
				)
			end,
			true)

	end;

	-------------------------------------------------------------
	-- ap_local_deities_devoted_army_1_available
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"local_deities_devoted_army_1_available",
			"bottomleft",
			function()
				return core:get_ui_root():SequentialFind( "local_deities", "worshipped_gods", "god_slot1", "army_favour_holder", "army_holder", "devoted_general_1")
			end,
			"ui_text_replacements_localised_text_phar_main_mtp_campaign_local_deities_devoted_army_available",
			0.5,
			0.1
		);

		core:add_listener(
			"ap_local_deities_devoted_army_1_available", 
			"PanelOpenedCampaign", 
			function(context) 
				return  context.string == "local_deities" 
			end, 
			function(context) 
				local uic_devoted_army = core:get_ui_root():SequentialFind( "local_deities", "worshipped_gods", "god_slot1", "army_favour_holder", "army_holder", "devoted_general_1")
				cm:callback(
					function()
						if uic_devoted_army and uic_devoted_army:CurrentState() == "available" then
							ap:show()
						end
					end, 
					0.1
				)
			end,
			true)

	end;

	-------------------------------------------------------------
	-- ap_local_deities_devoted_army_2_available
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"local_deities_devoted_army_2_available",
			"bottomleft",
			function()
				return core:get_ui_root():SequentialFind( "local_deities", "worshipped_gods", "god_slot2", "army_favour_holder", "army_holder", "devoted_general_1")
			end,
			"ui_text_replacements_localised_text_phar_main_mtp_campaign_local_deities_devoted_army_available",
			0.5,
			0.1
		);

		core:add_listener(
			"ap_local_deities_devoted_army_2_available", 
			"PanelOpenedCampaign", 
			function(context) 
				return  context.string == "local_deities" 
			end, 
			function(context) 
				local uic_devoted_army = core:get_ui_root():SequentialFind( "local_deities", "worshipped_gods", "god_slot2", "army_favour_holder", "army_holder", "devoted_general_1")
				cm:callback(
					function()
						if uic_devoted_army and uic_devoted_army:CurrentState() == "available" then
							ap:show()
						end
					end, 
					0.1
				)
			end,
			true)

	end;

	-------------------------------------------------------------
	-- ap_local_deities_devoted_army_3_available
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"local_deities_devoted_army_3_available",
			"bottomleft",
			function()
				return core:get_ui_root():SequentialFind( "local_deities", "worshipped_gods", "god_slot3", "army_favour_holder", "army_holder", "devoted_general_1")
			end,
			"ui_text_replacements_localised_text_phar_main_mtp_campaign_local_deities_devoted_army_available",
			0.5,
			0.1
		);

		core:add_listener(
			"ap_local_deities_devoted_army_1_available", 
			"PanelOpenedCampaign", 
			function(context) 
				return  context.string == "local_deities" 
			end, 
			function(context) 
				local uic_devoted_army = core:get_ui_root():SequentialFind( "local_deities", "worshipped_gods", "god_slot3", "army_favour_holder", "army_holder", "devoted_general_1")
				cm:callback(
					function()
						if uic_devoted_army and uic_devoted_army:CurrentState() == "available" then
							ap:show()
						end
					end, 
					0.1
				)
			end,
			true)

	end;

	-------------------------------------------------------------
	-- ap_local_deities_rededication_button
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"local_deities_rededication_button",
			"bottomright",
			function()
				return core:get_ui_root():SequentialFind("local_deities", "worshipped_all_gods_panel", "worshipped_gods_holder", "worshipped_gods", "god_slot1", "shrines_button" )
			end,
			"ui_text_replacements_localised_text_phar_main_mtp_campaign_local_deities_rededication_button",
			0.5,
			0.1
		);

		core:add_listener(
			"ap_local_deities_rededication_button", 
			"PanelOpenedCampaign", 
			function(context) 
				return  context.string == "local_deities" 
			end, 
			function(context) 
				local uic_shrines = core:get_ui_root():SequentialFind("local_deities", "worshipped_all_gods_panel", "worshipped_gods_holder", "worshipped_gods", "god_slot1", "shrines_button" )
				cm:callback(
					function()
						if uic_shrines and uic_shrines:VisibleFromRoot() then
							ap:show()
						end
					end, 
					1
				)
			end,
			true)

	end;

	-------------------------------------------------------------
	-- ap_local_deities_tier_1_icon
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"local_deities_tier_1_icon",
			"bottomleft",
			function()
				return core:get_ui_root():SequentialFind( "local_deities", "selected_god_template", "left_side_holder", "bar_holder", "tier_holder", "lock_1" )
			end,
			"ui_text_replacements_localised_text_phar_main_mtp_campaign_local_deities_tier_1_icon",
			0.5,
			0
		);

		core:add_listener(
			"ap_local_deities_tier_1_icon_panel_open",
			"PanelOpenedCampaign",
			function(context)
				return  context.string == "local_deities"
			end,
			function(context)
				core:add_listener(
					"ap_local_deities_tier_1_icon", 
					"ComponentLClickUp", 
					function(context) 
						local uic_panel = core:is_ui_created() and core:get_ui_root():SequentialFind( "local_deities" )
						return context.string == "btn_god_portrait" and uic_panel
					end, 
					function(context) 
						local uic_panel = core:get_ui_root():SequentialFind( "local_deities" )
						cm:callback(
							function()
								if uic_panel:Visible() then
									ap:show()
								end
							end, 
							0.1
						)
					end,
					true
				)
			end,
			true
		)

		core:add_listener(
			"ap_local_deities_tier_1_icon_panel_open",
			"PanelClosedCampaign",
			function(context)
				return  context.string == "local_deities"
			end,
			function(context)
				core:remove_listener("ap_local_deities_tier_1_icon")
			end,
			true
		)

	end;

	-------------------------------------------------------------
	-- ap_al_khufu_icons_speed_up
	-------------------------------------------------------------
	--[[
	do
		local ap = active_pointer:new(
			"al_khufu_icons_speed_up",
			"bottomleft",
			function()
				return core:get_ui_root():SequentialFind( "legacy_khufu", "selected_wonder", "tab_child", "left_panel", "wonder_stages", "list_clip", "list_box", "stage_foundation", "icon_container" )
			end,
			"ui_text_replacements_localised_text_phar_main_mtp_campaign_al_khufu_icons_speed_up",
			0.5,
			0
		);

		core:add_listener(
			"ap_al_khufu_icons_speed_up_panel_open",
			"PanelOpenedCampaign",
			function(context)
				return  context.string == "legacy_khufu"
			end,
			function(context)
				core:add_listener(
					"ap_al_khufu_icons_speed_up", 
					"ComponentLClickUp", 
					function(context) 
						local uic_panel_al_khufu = core:is_ui_created() and core:get_ui_root():SequentialFind( "legacy_khufu" )
						return  context.string == "button_view_details" and uic_panel_al_khufu:Visible()
					end, 
					function(context) 
						local uic_button_1 = core:get_ui_root():SequentialFind( "legacy_khufu", "selected_wonder", "tab_child", "left_panel", "wonder_stages", "list_clip", "list_box", "stage_foundation", "button_foundation" )
						local uic_button_2 = core:get_ui_root():SequentialFind( "legacy_khufu", "selected_wonder", "tab_child", "left_panel", "wonder_stages", "list_clip", "list_box", "stage_embelishment_1", "button_foundation" )
						local uic_button_3 = core:get_ui_root():SequentialFind( "legacy_khufu", "selected_wonder", "tab_child", "left_panel", "wonder_stages", "list_clip", "list_box", "stage_embelishment_2", "button_foundation" )
						local uic_button_4 = core:get_ui_root():SequentialFind( "legacy_khufu", "selected_wonder", "tab_child", "left_panel", "wonder_stages", "list_clip", "list_box", "stage_embelishment_3", "button_foundation" )
						cm:callback(
							function()
								if not ( uic_button_1 and uic_button_2 and uic_button_3 and uic_button_4 ) then
									ap:show()
								end
							end, 
							0.5
						)
					end,
					true
				)
			end,
			true
		)

		core:add_listener(
			"ap_al_khufu_icons_speed_up_panel_close",
			"PanelClosedCampaign",
			function(context)
				return  context.string == "legacy_khufu"
			end,
			function(context)
				core:remove_listener("ap_al_khufu_icons_speed_up")
			end,
			true
		)

	end;
	]]
	-------------------------------------------------------------
	-- ap_al_hatshepsut_items_marketplace
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"al_hatshepsut_items_marketplace",
			"bottomleft",
			function()
				return core:get_ui_root():SequentialFind( "legacy_hatshepsut", "selected_realm_info", "marketplace_items" )
			end,
			"ui_text_replacements_localised_text_phar_main_mtp_campaign_al_hatshepsut_items_marketplace",
			0.5,
			0,
			350
		);

		core:add_listener(
			"ap_al_hatshepsut_items_marketplace_panel_open",
			"PanelOpenedCampaign",
			function(context)
				return  context.string == "legacy_hatshepsut"
			end,
			function(context)
				core:add_listener(
					"ap_al_hatshepsut_items_marketplace", 
					"ComponentLClickUp", 
					function(context) 
						local uic_hatshepsut_panel = core:is_ui_created() and core:get_ui_root():SequentialFind( "legacy_hatshepsut" )
						return string.match(context.string, "pin") and uic_hatshepsut_panel and uic_hatshepsut_panel:Visible()
					end, 
					function(context) 
						cm:callback(
							function()
								ap:show()
							end, 
							0.5
						)
					end,
					true
				)
			end,
			true
		)

		core:add_listener(
			"ap_al_hatshepsut_items_marketplace_panel_close",
			"PanelClosedCampaign",
			function(context)
				return  context.string == "legacy_hatshepsut"
			end,
			function(context)
				core:remove_listener("ap_al_hatshepsut_items_marketplace")
			end,
			true
		)

	end;

	-------------------------------------------------------------
	-- ap_al_thutmose_sabotage
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"al_thutmose_sabotage",
			"bottomright",
			function()
				return core:get_ui_root():SequentialFind( "legacy_thutmose", "support_counters", "counters_holder", "sabotage_counter", "tiers_holder", "tier_1" )
			end,
			"ui_text_replacements_localised_text_phar_main_mtp_campaign_al_thutmose_sabotage",
			0.5,
			0
		);

		core:add_listener(
			"ap_al_thutmose_sabotage", 
			"PanelOpenedCampaign", 
			function(context) 
				return  context.string == "legacy_thutmose" 
			end, 
			function(context) 
				cm:callback(
					function()
						local uic_sabotage_1 = core:get_ui_root():SequentialFind( "legacy_thutmose", "support_counters", "counters_holder", "sabotage_counter", "tiers_holder", "tier_1" )
						if uic_sabotage_1 and uic_sabotage_1:CurrentState() == "selected" then 
							ap:show()
						end
					end, 
					0.5
				)
			end,
			true)

	end;

	-------------------------------------------------------------
	-- ap_al_thutmose_support
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"al_thutmose_support",
			"bottomleft",
			function()
				return core:get_ui_root():SequentialFind( "legacy_thutmose", "support_counters", "counters_holder", "native_counter", "tiers_holder", "tier_1" )
			end,
			"ui_text_replacements_localised_text_phar_main_mtp_campaign_al_thutmose_support",
			0.5,
			0
		);

		core:add_listener(
			"ap_al_thutmose_support", 
			"PanelOpenedCampaign", 
			function(context) 
				return  context.string == "legacy_thutmose" 
			end, 
			function(context) 
				cm:callback(
					function()
						local uic_support_1 = core:get_ui_root():SequentialFind( "legacy_thutmose", "support_counters", "counters_holder", "native_counter", "tiers_holder", "tier_1" )
						if uic_support_1 and uic_support_1:CurrentState() == "selected" then 
							ap:show()
						end
					end, 
					0.5
				)
			end,
			true)

	end;

	-------------------------------------------------------------
	-- ap_al_thutmose_culmination_ready
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"al_thutmose_culmination_ready",
			"bottomright",
			function()
				return core:get_ui_root():SequentialFind( "legacy_thutmose", "conquest_actions", "progression_bar", "conquest_culmination_button" )
			end,
			"ui_text_replacements_localised_text_phar_main_mtp_campaign_al_thutmose_culmination_ready",
			0.5,
			0
		);

		core:add_listener(
			"ap_al_thutmose_culmination_ready", 
			"PanelOpenedCampaign", 
			function(context) 
				return  context.string == "legacy_thutmose" 
			end, 
			function(context) 
				cm:callback(
					function()
						local uic_culmination = core:get_ui_root():SequentialFind( "legacy_thutmose", "conquest_actions", "progression_bar", "conquest_culmination_button" )
						if uic_culmination and uic_culmination:CurrentState() == "unlocked_available" then 
							ap:show()
						end
					end, 
					0.5
				)
			end,
			true)

	end;

	-------------------------------------------------------------
	-- ap_horde_army_buildings_tabs
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"horde_army_buildings_tabs",
			"bottomright",
			function()
				return core:get_ui_root():SequentialFind( "units_panel", "main_units_panel", "tabgroup" )
			end,
			"ui_text_replacements_localised_text_phar_sea_mtp_campaign_buttons_horde_buildings_units",
			0.5,
			0
		);

		core:add_listener(
			"horde_army_buildings_tabs", 
			"PanelOpenedCampaign", 
			function(context) 
				return  context.string == "units_panel" 
			end, 
			function(context) 
				cm:callback(
					function()
						local uic_army_buildings_tabs = core:get_ui_root():SequentialFind( "units_panel", "main_units_panel", "tabgroup" )
						if uic_army_buildings_tabs and uic_army_buildings_tabs:Visible() == true then 
							ap:show()
						end
					end, 
					0.5
				)
			end,
			true)
	end;

	-------------------------------------------------------------
	-- ap_achish_ceremony
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"achish_ceremony",
			"bottomleftedge",
			function()
				return core:get_ui_root():SequentialFind( "sea_tribes_privileges", "strategic_map", "achish_ceremony_button" )
			end,
			"ui_text_replacements_localised_text_phar_sea_mtp_campaign_tribes_privileges_achish_ceremony",
			1,
			0.5
		);

		core:add_listener(
			"tribes_privileges_open", 
			"PanelOpenedCampaign", 
			function(context) 
				return  context.string == "sea_tribes_privileges" 
			end, 
			function(context) 
				cm:callback(
					function()
						ap:show()
					end, 
					0.5
				)
			end,
			true)
	end;

	-------------------------------------------------------------
	-- ap_eminence_pre_battle_options_available
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"eminence_pre_battle_options",
			"bottomleft",
			function()
				return core:get_ui_root():SequentialFind( "popup_pre_battle", "mid", "battle_deployment", "regular_deployment", "buttons_list", "eminence_section" )
			end,
			"ui_text_replacements_localised_text_phar_sea_mtp_campaign_eminence_pre_battle_options",
			0.5,
			0
		);

		core:add_listener(
			"eminence_pre_battle_available", 
			"PanelOpenedCampaign", 
			function(context) 
				return  context.string == "popup_pre_battle" 
			end, 
			function(context) 
				cm:callback(
					function()
						local uic_button_obedience = core:get_ui_root():SequentialFind( "popup_pre_battle", "mid", "battle_deployment", "regular_deployment", "buttons_list", "eminence_section", "button_obedience" )
						local uic_button_change_allegiance = core:get_ui_root():SequentialFind( "popup_pre_battle", "mid", "battle_deployment", "regular_deployment", "buttons_list", "eminence_section", "button_change_allegiance" )
						local uic_button_display_of_power = core:get_ui_root():SequentialFind( "popup_pre_battle", "mid", "battle_deployment", "regular_deployment", "buttons_list", "eminence_section", "button_display_of_power" )
						if uic_button_obedience and  uic_button_obedience:CurrentState() == "active" or
						uic_button_change_allegiance and uic_button_change_allegiance:CurrentState() == "active" or 
						uic_button_display_of_power and uic_button_display_of_power:CurrentState() == "active" then
							ap:show_when_ready()
						end
					end, 
					0.5
				)
			end,
			true
		)
	end;

	-------------------------------------------------------------
	-- ap_eminence_gained_eminence_points
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"eminence_points_pooled_resource",
			"topleft",
			function()
				return core:get_ui_root():SequentialFind( "faction_widget_holder", "faction_widget", "faction_widget_list", "resources_container_holder", "resources_container", "res_phar_eminence" )
			end,
			"ui_text_replacements_localised_text_phar_sea_mtp_campaign_eminence_resource",
			0.5,
			1
		);

		ap:add_hide_on_event_record(
			"PanelOpenedCampaign", 
			function(context) 
				return context.string == "esc_menu_campaign"
			end
		)
		
		core:add_listener(
			"ap_eminence_gained_listener", 
			"FactionTurnStart", 
			function(context)
				return context:faction():is_human() and context:faction():has_pooled_resource("phar_eminence") and context:faction():pooled_resource("phar_eminence"):value() > 0
			end, 
			function(context)
				cm:callback(
					function()
							ap:show_when_ready()
					end, 
					0.5
				)
			end,
			true
		)
	end;

	-------------------------------------------------------------
	-- ap_eminence_post_battle_option_available
	-------------------------------------------------------------

	do
		local valid_options_table = {
					"916602205",
					"1048514992",
					"1535967553",
					"753800715",
				};
		local ap = active_pointer:new(
			"eminence_post_battle_option",
			"bottomright",
			function()
				local uic_post_battle_options = core:get_ui_root():SequentialFind ( "settlement_captured", "button_parent" )
                        for i = 0, uic_post_battle_options:ChildCount() - 1 do 
                            local curr_option = UIComponent(uic_post_battle_options:Find(i))
                            local curr_option_id = curr_option:Id() 
                            for _, val_option in ipairs(valid_options_table) do
                                if curr_option_id == val_option then
                                    return curr_option
								end
							end
						end
			end,
			"ui_text_replacements_localised_text_phar_sea_mtp_campaign_eminence_post_battle_options",
			0.5,
			0
		);

		core:add_listener(
            "ap_eminence_post_battle_option_available", 
            "PanelOpenedCampaign", 
            function(context) 
                return  context.string == "settlement_captured" 
            end, 
            function(context) 
                cm:callback(
                    function()
                        local uic_post_battle_options = core:get_ui_root():SequentialFind ( "settlement_captured", "button_parent" )
                        for i = 0, uic_post_battle_options:ChildCount() - 1 do 
                            local curr_option = UIComponent(uic_post_battle_options:Find(i))
                            local curr_option_id = curr_option:Id() 
                            for _, val_option in ipairs(valid_options_table) do
                                if curr_option_id == val_option then
                                    for j = 0, curr_option:ChildCount() - 1 do
                                        local curr_child_option = UIComponent(curr_option:Find(j))
                                        local curr_child_option_id = curr_child_option:Id()
                                        if curr_child_option_id == "option_button" then
                                            if curr_child_option:CurrentState() == "active" then
                                                ap:show()
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end,
                    0.5
                )
            end,
            true
        )
	end;

	-------------------------------------------------------------
	-- ap_eminence_menu_available
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"eminence_button_available",
			"topleft",
			function()
				return core:get_ui_root():SequentialFind( "faction_widget_holder", "faction_widget", "faction_widget_list", "main_buttons", "main_buttons_container", "fm_sea_eminence_container" )
			end,
			"ui_text_replacements_localised_text_phar_sea_mtp_campaign_eminence_button",
			0.5,
			1
		);

		ap:add_hide_on_event_record(
			"PanelOpenedCampaign", 
			function(context) 
				return context.string == "esc_menu_campaign"
			end
		)
		
		core:add_listener(
			"ap_eminence_button_available", 
			"FactionTurnStart", 
			function(context) 
				return context:faction():is_human()
			end,
			function(context)
				cm:callback(
					function()
						local uic_eminence_button = core:get_ui_root():SequentialFind("faction_widget_holder", "faction_widget", "faction_widget_list", "main_buttons", "main_buttons_container", "fm_sea_eminence_container")
						if uic_eminence_button and  uic_eminence_button:CurrentState() == "active" then
							ap:show()
						end
					end, 
					0.5
				)
			end,
			true
		)
	end;

	-------------------------------------------------------------
	-- ap_eminence_domination_available
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"eminence_domination_panel",
			"bottomleftedge",
			function()
				return core:get_ui_root():SequentialFind( "sea_eminence_panel", "obedience_section", "expandable_obedience_menu", "header" )
			end,
			"ui_text_replacements_localised_text_phar_sea_mtp_campaign_eminence_obedience_panel",
			1,
			0.5
		);
		
		core:add_listener(
			"ap_eminence_domination_available", 
			"PanelOpenedCampaign",
			function(context)
				return  context.string == "sea_eminence_panel"
			end,
			function(context)
				cm:callback(
					function()
						local uic_dominated_armies = core:get_ui_root():SequentialFind("sea_eminence_panel", "obedience_section", "expandable_obedience_menu", "spawned_armies_list", "list_holder", "list_clip", "list_box")
						if uic_dominated_armies and uic_dominated_armies:ChildCount() > 0 then
							ap:show()
						end
					end, 
					0.5
				)
			end,
			true
		)
	end;

	-------------------------------------------------------------
	-- ap_eminence_units_available
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"eminence_units_panel",
			"bottomrightedge",
			function()
				return core:get_ui_root():SequentialFind( "sea_eminence_panel", "change_allegiance_section", "expandable_change_allegiance_menu", "header" )
			end,
			"ui_text_replacements_localised_text_phar_sea_mtp_campaign_eminence_change_allegiance_panel",
			0,
			0.5
		);
		
		core:add_listener(
			"ap_eminence_units_available", 
			"PanelOpenedCampaign",
			function(context)
				return  context.string == "sea_eminence_panel"
			end,
			function(context)
				cm:callback(
					function()
						local uic_eminence_units = core:get_ui_root():SequentialFind("sea_eminence_panel", "change_allegiance_section", "expandable_change_allegiance_menu", "bribed_units", "list_holder", "list_clip", "list_box")
						if uic_eminence_units and uic_eminence_units:ChildCount() > 0 then
							ap:show()
						end
					end, 
					0.5
				)
			end,
			true
		)
	end;

	-------------------------------------------------------------
	-- ap_war_spoils_non_resource_rewards
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"war_spoils_non_resource_rewards",
			"topleftedge",
			function()
				return core:get_ui_root():SequentialFind( "sea_war_spoils", "panel_campaign_bg", "illustration_holder", "non_resource_holder" )
			end,
			"ui_text_replacements_localised_text_phar_sea_mtp_campaign_war_spoils_non_resource_rewards",
			1,
			0.5
		);
		
		core:add_listener(
			"ap_non_resource_war_spoils", 
			"PanelOpenedCampaign",
			function(context)
				return  context.string == "sea_war_spoils"
			end,
			function(context)
				cm:callback(
					function()
						local uic_non_resource_war_spoils = core:get_ui_root():SequentialFind("sea_war_spoils", "panel_campaign_bg", "illustration_holder", "non_resource_holder")
						if uic_non_resource_war_spoils then
							ap:show()
						end
					end, 
					0.5
				)
			end,
			true
		)
	end;

	-------------------------------------------------------------
	-- ap_war_spoils_resource_rewards
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"war_spoils_resource_rewards",
			"toprightedge",
			function()
				return core:get_ui_root():SequentialFind( "sea_war_spoils", "panel_campaign_bg", "illustration_holder", "resource_holder" )
			end,
			"ui_text_replacements_localised_text_phar_sea_mtp_campaign_war_spoils_resource_rewards",
			0,
			0.5
		);
		
		core:add_listener(
			"ap_resource_war_spoils", 
			"PanelOpenedCampaign",
			function(context)
				return  context.string == "sea_war_spoils"
			end,
			function(context)
				cm:callback(
					function()
						local uic_resource_war_spoils = core:get_ui_root():SequentialFind("sea_war_spoils", "panel_campaign_bg", "illustration_holder", "resource_holder")
						if uic_resource_war_spoils then
							ap:show()
						end
					end, 
					0.5
				)
			end,
			true
		)

		ap:wait_for_active_pointer("war_spoils_non_resource_rewards");

	end;

	-------------------------------------------------------------
	-- ap_war_spoils_rewards_find_closest
	-------------------------------------------------------------

	do
        local ap = active_pointer:new(
            "war_spoils_find_closest",
            "topleft",
            function()
                local closest_non_resource = core:get_ui_root():SequentialFind( "sea_war_spoils", "panel_campaign_bg", "illustration_holder", "non_resource_holder", "spoils_info", "buttons_holder", "btn_redirect" )
                local closest_resource = core:get_ui_root():SequentialFind( "sea_war_spoils", "panel_campaign_bg", "illustration_holder", "resource_holder", "spoils_info", "mre_buttons_holder" )
                if  closest_non_resource and closest_non_resource:Visible(true) then
                    return closest_non_resource
                end
                if closest_resource and closest_resource:Visible(true) then
                    return closest_resource
                end
            end,
            "ui_text_replacements_localised_text_phar_sea_mtp_campaign_war_spoils_closest_settlement_button",
            0.5,
            1
        );
        
        core:add_listener(
            "ap_war_spoils_find_closest_btn", 
            "PanelOpenedCampaign",
            function(context)
                return  context.string == "sea_war_spoils"
            end,
            function(context)
                core:add_listener(
                    "war_spoils_rewards_panel_expanded",
                    "ComponentLClickUp",
                    function(context)
                        return string.find(context.string, "spoils_button_")
                    end,
                    function(context)
                        cm:callback(
                            function()
                                local uic_closest_non_resource_war_spoils = core:get_ui_root():SequentialFind("sea_war_spoils","panel_campaign_bg","illustration_holder","non_resource_holder","spoils_info")
                                local uic_closest_resource_war_spoils = core:get_ui_root():SequentialFind("sea_war_spoils","panel_campaign_bg","illustration_holder","resource_holder","spoils_info")
                                if uic_closest_non_resource_war_spoils and uic_closest_non_resource_war_spoils:Visible() or uic_closest_resource_war_spoils and uic_closest_resource_war_spoils:Visible()  then
                                    ap:show()
                                end
                            end, 
                            0.5
                        )
                    end,
                    true
                )

            end
        )

		ap:wait_for_active_pointer("war_spoils_resource_rewards");

    end;

	-------------------------------------------------------------
	-- ap_horde_buildings_idols
	-------------------------------------------------------------

	do
		local ap = active_pointer:new(
			"horde_buildings_idols",
			"topright",
			function()
				local uic_building_list = core:get_ui_root():SequentialFind( "building_tree", "category_parent" );
				if uic_building_list then
					local uic_horde_idols = UIComponent(uic_building_list:Find(3));
					if uic_horde_idols then
						return uic_horde_idols
					end;
				end;
			end,
			"ui_text_replacements_localised_text_phar_sea_mtp_campaign_horde_buildings_idols",
			0.5,
			1
		);
		
		core:add_listener(
			"ap_horde_idols_category_exists", 
			"PanelOpenedCampaign",
			function(context)
				return  context.string == "building_browser"
			end,
			function(context)
				cm:callback(
					function()
						local uic_horde_buildings_parent = core:get_ui_root():SequentialFind("building_browser", "panel", "horde_parent")
						if uic_horde_buildings_parent and uic_horde_buildings_parent:Visible() then
							ap:show()
						end
					end, 
					0.5
				)
			end,
			true
		)
	end;

	-------------------------------------------------------------
    -- ap_tribes_privileges_menu_button
    -------------------------------------------------------------

    do
        local ap = active_pointer:new(
            "tribes_privileges_menu_button",
            "topleft",
            function()
				return core:get_ui_root():SequentialFind( "faction_widget_holder", "faction_widget", "faction_widget_list", "main_buttons", "main_buttons_container", "fm_sea_tribes_privileges_container" )
            end,
            "ui_text_replacements_localised_text_phar_sea_mtp_campaign_tribes_privileges_button",
            0.5,
            1
        );

		ap:add_hide_on_event_record(
			"PanelOpenedCampaign", 
			function(context) 
				return context.string == "esc_menu_campaign"
			end
		)
        
        core:add_listener(
            "ap_blades_dwelling_changes", 
            "PooledResourceTransactionEvent",
            function(context)
                local resource_key = context:resource():key()
                return context:faction():is_human() and (resource_key == "phar_sea_blades_points" or resource_key == "phar_sea_dwelling_points") and context:amount() ~= 0
            end,
			function(context)
				local uic_tribes_privileges_button = core:get_ui_root():SequentialFind( "faction_widget_holder", "faction_widget", "faction_widget_list", "main_buttons", "main_buttons_container", "fm_sea_tribes_privileges_container")
				if uic_tribes_privileges_button and uic_tribes_privileges_button:Visible() then
					ap:show()
				end
            end
        )
    end;

end

minimalistic_text_pointers.start_listeners()

