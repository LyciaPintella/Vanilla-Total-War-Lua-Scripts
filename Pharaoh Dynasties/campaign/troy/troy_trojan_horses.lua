out("Loading troy_trojan_horses.lua")
loading_screen_shown = true
local num_units_in_horse_saved = 0
wrath_of_posseidon_earthquake_config = {
	repair_listeners = {
		{
			health = 25,
		},
		{
			health = 50,
		},
		{
			health = 75,
		},
		{
			health = 100,
		},
	},
	repair_turn_offset = 1,
	current_repair = 1,
	last_turn_repair = -1
}

function trigger_incident_in_round_start(listener_name, incident_key)
	local faction_list = cm:model():world():faction_list()
	for i = 0, faction_list:num_items() - 1 do
		local faction = faction_list:item_at(i)
		if faction:is_human() then -- add listener
			core:add_listener(
				listener_name .. faction:name(),
				"FactionTurnStart",
				function(context)
					return context:faction():name() == faction:name()
				end,
				function(context)
					cm:callback(function() cm:trigger_incident(faction:name(), incident_key, true, true) end, 0.1);
				end,
				false
			)
		end
	end
end

function add_restrict_building_on_faction_change()
	out("Adding add_restrict_building_on_faction_change listeners...")
	core:add_listener(
		"troy_wrath_of_posseidon_earthquake_event_restrict_on_change",
		"RegionFactionChangeEvent",
		function(context)
			-- check correct region and EARTHQUAKE
			local region = context:region()
			return wrath_of_posseidon_earthquake_incident_has_fired and region:name() == wrath_of_posseidon_earthquake_incident_target_region
		end,
		function(context)
			--restrict
			cm:set_building_can_repair(wrath_of_posseidon_earthquake_incident_target_region, wrath_of_posseidon_earthquake_incident_target_building, false)
		end,
		true
	)
end

function reschedule_earthquake()
	local turn_num = cm:model():turn_number()
	local wrath_of_posseidon_earthquake_incident_turn_cached = wrath_of_posseidon_earthquake_incident_turn

	if wrath_of_posseidon_earthquake_incident_has_fired then
		out("WE UNRESTRICT THE BUILDING")
		cm:set_building_can_repair(wrath_of_posseidon_earthquake_incident_target_region,wrath_of_posseidon_earthquake_incident_target_building, true)
		cm:remove_effect_bundle_from_region(wrath_of_posseidon_earthquake_incident_target_effect_bundle, wrath_of_posseidon_earthquake_incident_target_region)
		core:remove_listener("troy_wrath_of_posseidon_earthquake_event_restrict_on_change")

		out("WE UNSET set_battle_details_override_for_region ")
		cm:set_battle_details_override_for_region(wrath_of_posseidon_earthquake_incident_target_region, "settlement_unfortified", "", "", "")
		cm:set_battle_details_override_for_region(wrath_of_posseidon_earthquake_incident_target_region, "settlement_sally", "", "", "")
		cm:set_battle_details_override_for_region(wrath_of_posseidon_earthquake_incident_target_region, "settlement_relief", "", "", "")
		cm:set_battle_details_override_for_region(wrath_of_posseidon_earthquake_incident_target_region, "land_normal", "", "", "")
		cm:set_battle_details_override_for_region(wrath_of_posseidon_earthquake_incident_target_region, "land_ambush", "", "", "")
	end

	out("TIME TO SET NEXT EVENT PARAMS")
	wrath_of_posseidon_earthquake_incident_turn = 
		wrath_of_posseidon_earthquake_incident_turn_cached + 
		cm:model():random_int(wrath_of_posseidon_earthquake_incident_turn_low_bound, wrath_of_posseidon_earthquake_incident_turn_high_bound)

	out("WRATH OF POSSEIDON NEXT EARTHQUAKE TURN WILL BE: " .. tostring(wrath_of_posseidon_earthquake_incident_turn))

	wrath_of_posseidon_warning_incident_turn = 
		wrath_of_posseidon_earthquake_incident_turn_cached +
		cm:model():random_int(wrath_of_posseidon_warning_incident_turn_low_bound, wrath_of_posseidon_warning_incident_turn_high_bound)

	out("WRATH OF POSSEIDON NEXT WARNING TURN WILL BE: " .. tostring(wrath_of_posseidon_warning_incident_turn))
end


function start_wrath_of_posseidon_listeners()
	out("STARTING WRAHT OF POSEIDON LISTENERS...")

	if wrath_of_posseidon_earthquake_incident_turn == 0 and wrath_of_posseidon_warning_incident_turn == 0 then
		reschedule_earthquake()
	end

	if wrath_of_posseidon_earthquake_incident_has_fired then
		add_restrict_building_on_faction_change()
		cm:set_building_can_repair(wrath_of_posseidon_earthquake_incident_target_region, wrath_of_posseidon_earthquake_incident_target_building, false)
	end

	if cm:model():world():region_manager():region_by_key(wrath_of_posseidon_earthquake_incident_target_region):is_null_interface() then
		return
	end
	local troy_garrison_residence = cm:model():world():region_manager():region_by_key(wrath_of_posseidon_earthquake_incident_target_region):garrison_residence()

	core:add_listener(
		"troy_wrath_of_posseidon_earthquake_event_auto_repair",
		"RoundStart",
		function(context)
			return wrath_of_posseidon_earthquake_incident_has_fired
			and not troy_garrison_residence:faction():is_rebel()
			and cm:model():turn_number() >= wrath_of_posseidon_earthquake_previous_incident_turn + wrath_of_posseidon_earthquake_config.repair_turn_offset
		end,
		function(context)
			local turn_number = cm:model():turn_number()
			if troy_garrison_residence:is_under_siege() then
				out("WRATH OF POSEIDON REPAIR LISTENER: TROY IS UNDER SIEGE SKIPPING...")
				return
			end

			if wrath_of_posseidon_earthquake_config.last_turn_repair == turn_number then
				out("WRATH OF POSEIDON REPAIR LISTENER: WE HAVE ALREADY REPAIRED THIS TURN. SKIPPING...")
				return
			end

			local repair_data = wrath_of_posseidon_earthquake_config.repair_listeners[wrath_of_posseidon_earthquake_config.current_repair]
			cm:instant_set_building_health_percent(wrath_of_posseidon_earthquake_incident_target_region, wrath_of_posseidon_earthquake_incident_target_building, repair_data.health)
			if repair_data.health == 100 then
				cm:remove_effect_bundle_from_region(wrath_of_posseidon_earthquake_incident_target_effect_bundle, wrath_of_posseidon_earthquake_incident_target_region)

				trigger_incident_in_round_start("troy_wrath_of_posseidon_earthquake_event_remove_restiction_turn_", wrath_of_posseidon_earthquake_incident_over_key)
				reschedule_earthquake()
				wrath_of_posseidon_earthquake_incident_has_fired = false

			end
			wrath_of_posseidon_earthquake_config.last_turn_repair = turn_number
			wrath_of_posseidon_earthquake_config.current_repair = wrath_of_posseidon_earthquake_config.current_repair + 1
			if wrath_of_posseidon_earthquake_config.current_repair > #wrath_of_posseidon_earthquake_config.repair_listeners then
				out("WRATH OF POSEIDON REPAIR LISTENER: REPAIRS RE DONE. REMOVING AND RESETING.. ")
				wrath_of_posseidon_earthquake_config.current_repair = 1
			end
		end,
		true
	)

	core:add_listener(
		"troy_wrath_of_posseidon_flavour_event_round",
		"RoundStart",
		function(context)
			return (cm:model():turn_number() == wrath_of_posseidon_flavour_incident_turn)
		end,
		function(context)
			trigger_incident_in_round_start("troy_wrath_of_posseidon_flavour_event_turn_", wrath_of_posseidon_flavour_incident_key)
		end,
		true
	)

	core:add_listener(
		"troy_wrath_of_posseidon_warning_event_round",
		"RoundStart",
		function(context)
			local troy_garrison_residence = cm:model():world():region_manager():region_by_key(wrath_of_posseidon_earthquake_incident_target_region):garrison_residence()
			return (cm:model():turn_number() == wrath_of_posseidon_warning_incident_turn) and not troy_garrison_residence:faction():is_rebel()
		end,
		function(context)
			trigger_incident_in_round_start("troy_wrath_of_posseidon_warning_event_turn_", wrath_of_posseidon_warning_incident_key)
		end,
		true
	)

	core:add_listener(
		"troy_wrath_of_posseidon_earthquake_event",
		"RoundStart",
		function(context)
			return (cm:model():turn_number() == wrath_of_posseidon_earthquake_incident_turn)
		end,
		function(context)
			local current_turn = cm:model():turn_number()
			local troy_garrison_residence = cm:model():world():region_manager():region_by_key(wrath_of_posseidon_earthquake_incident_target_region):garrison_residence()
			local buildings_list = troy_garrison_residence:settlement_interface():building_list()
			local is_troy_under_construction = nil
			for i = 0, buildings_list:num_items() - 1 do
				local slot = buildings_list:item_at(i):slot()
				if slot:type() == "primary" and slot:is_there_construction() then
					is_troy_under_construction = true
				else
					is_troy_under_construction = false
				end
			end
			if (troy_garrison_residence:is_under_siege() and odysseus_ruse_is_active) or troy_garrison_residence:faction():is_rebel() or is_troy_under_construction then
				reschedule_earthquake()
				return
			end
			
			cm:apply_effect_bundle_to_region(wrath_of_posseidon_earthquake_incident_target_effect_bundle, wrath_of_posseidon_earthquake_incident_target_region, 0)
			cm:set_battle_details_override_for_region(wrath_of_posseidon_earthquake_incident_target_region, "settlement_unfortified", wrath_of_posseidon_earthquake_incident_target_battle_override, "catchment_02", "")
			cm:set_battle_details_override_for_region(wrath_of_posseidon_earthquake_incident_target_region, "settlement_sally", wrath_of_posseidon_earthquake_incident_target_battle_override, "catchment_03", "")
			cm:set_battle_details_override_for_region(wrath_of_posseidon_earthquake_incident_target_region, "settlement_relief", wrath_of_posseidon_earthquake_incident_target_battle_override, "catchment_03", "")
			cm:set_battle_details_override_for_region(wrath_of_posseidon_earthquake_incident_target_region, "land_normal", wrath_of_posseidon_earthquake_incident_target_battle_override_suffix, "suffix", "")
			cm:set_battle_details_override_for_region(wrath_of_posseidon_earthquake_incident_target_region, "land_ambush", wrath_of_posseidon_earthquake_incident_target_battle_override_suffix, "suffix", "")


			if troy_garrison_residence:is_under_siege() then
				cm:force_remove_siege_equipment(troy_garrison_residence:sieging_force())
			end

			trigger_incident_in_round_start("troy_wrath_of_posseidon_earthquake_event_turn_", wrath_of_posseidon_earthquake_incident_key)

			if not wrath_of_posseidon_earthquake_incident_has_fired then
				-- Time to damage some buildings
				local buildings_list = troy_garrison_residence:settlement_interface():building_list()
				for i = 0, buildings_list:num_items() - 1 do
					cm:instant_set_building_health_percent(wrath_of_posseidon_earthquake_incident_target_region, buildings_list:item_at(i):name(), 75)
				end

				cm:instant_set_building_health_percent(wrath_of_posseidon_earthquake_incident_target_region, wrath_of_posseidon_earthquake_incident_target_building, 1)
				cm:damage_garrison_units(wrath_of_posseidon_earthquake_incident_target_region, wrath_of_posseidon_earthquake_incident_garrison_damage_amount)
				cm:set_building_can_repair(wrath_of_posseidon_earthquake_incident_target_region, wrath_of_posseidon_earthquake_incident_target_building, false)

				add_restrict_building_on_faction_change()
				wrath_of_posseidon_earthquake_previous_incident_turn = wrath_of_posseidon_earthquake_incident_turn
				wrath_of_posseidon_earthquake_incident_has_fired = true
			end
		end,
		true
	)

	core:add_listener(
		"troy_wrath_of_poseidon_faction_region_change_event",
		"RegionFactionChangeEvent",
		function(context)
			return (context:region():name() == wrath_of_posseidon_earthquake_incident_target_region) and
			wrath_of_posseidon_earthquake_incident_has_fired and
			context:region():owning_faction():is_human()
		end,
		function(context)
			cm:apply_effect_bundle_to_region(wrath_of_posseidon_earthquake_incident_target_effect_bundle, wrath_of_posseidon_earthquake_incident_target_region, 0)
		end,
		true
	)

	core:add_listener(
		"troy_wrath_of_posseidon_troy_is_razed_event",
		"CharacterRazedSettlement",
		function(context)
			return context:garrison_residence():region():name() == wrath_of_posseidon_earthquake_incident_target_region and wrath_of_posseidon_earthquake_incident_has_fired
		end,
		function(context)
			out("TROY HAS BEEN RAZED. Clearing up repair listeners and reseting...")
			reschedule_earthquake()
			wrath_of_posseidon_earthquake_incident_has_fired = false
			wrath_of_posseidon_earthquake_config.current_repair = 1
			core:remove_listener("troy_wrath_of_posseidon_earthquake_event_remove_restiction")
		end,
		true
	)
end

function start_odysseus_ruse_listeners()
	out("Adding RUSE listeners...")
	core:add_listener(
		"troy_odysseus_ruse_hint_event",
		"FactionTurnStart",
		function(context)
			local fac = context:faction()
			return fac:is_human() and fac:name() == odysseus_faction and cm:turn_number() > 1 and not odysseus_ruse_hint_incident_shown_bool
		end,
		function(context)
			cm:trigger_incident(odysseus_faction, odysseus_ruse_hint_incident_key, true, true)
			odysseus_ruse_hint_incident_shown_bool = true
		end,
		false
	)

	core:add_listener(
		"troy_odysseus_ruse_hint_confederation_event",
		"FactionJoinsConfederation",
		function(context)
			local fac = context:faction()
			return context:confederation():is_human() and fac:name() == odysseus_faction and not odysseus_ruse_hint_confederation_shown_bool
		end,
		function(context)
			cm:trigger_incident(context:confederation():name(), odysseus_ruse_hint_confederation_key, true, true)
			odysseus_ruse_hint_confederation_shown_bool = true
		end,
		false
	)

	core:add_listener(
		"troy_odysseus_ruse_troy_maintain_siege",
		"CharacterMaintainsSiege",
		function(context)
			return context:region():name() == odysseus_ruse_target_region and not odysseus_ruse_is_active and not wrath_of_posseidon_earthquake_incident_has_fired
		end,
		function(context)
			local char = context:character()
			local char_list = char:faction():character_list()
			for i=0, char_list:num_items() -1 do
				if char_list:item_at(i):character_subtype(odysseus_subtype) then
					odysseus_ruse_mf_cqi = char:military_force():command_queue_index()
					if odysseus_ruse_hint_confederation_shown_bool then
						cm:trigger_dilemma(char:faction():name(), odysseus_ruse_dilemma_key_confederated)
					else
						cm:trigger_dilemma(char:faction():name(), odysseus_ruse_dilemma_key)
					end
				end
			end
		end,
		true
	)

	core:add_listener(
		"troy_odysseus_ruse_maintain_siege_with_ruse",
		"CharacterMaintainsSiege",
		function(context)
			return context:region():name() == odysseus_ruse_target_region and odysseus_ruse_is_active and not wrath_of_posseidon_earthquake_incident_has_fired
		end,
		function(context)
			num_units_in_horse_saved = 0
		end,
		true
	)

	core:add_listener(
		"troy_odysseus_ruse_break_siege",
		"CharacterEndsBesiegingSettlement",
		function(context)
			return context:region():name() == odysseus_ruse_target_region and not wrath_of_posseidon_earthquake_incident_has_fired and odysseus_ruse_is_active
		end,
		function(context)
			odysseus_ruse_faction_name = nil
			odysseus_ruse_is_active = false
			odysseus_ruse_mf_cqi = nil
			num_units_in_horse_saved = 0
			cm:remove_effect_bundle_from_region(odysseus_ruse_target_debuff_bundle, odysseus_ruse_target_region)
		end,
		true
	)

	core:add_listener(
		"troy_odysseus_ruse_dilemma_choice_made_event",
		"DilemmaChoiceMadeEvent",
		function(context)
			local dilemma = context:dilemma()
			return (dilemma == odysseus_ruse_dilemma_key or dilemma == odysseus_ruse_dilemma_key_confederated) and context:choice() == 0 and not odysseus_ruse_is_active
		end,
		function(context)
			odysseus_ruse_faction_name = context:faction():name()
			odysseus_ruse_turn_to_allow = cm:model():turn_number() + 1
			odysseus_ruse_is_active = true
			out("TURN TO ALLOW IS : " .. tostring(odysseus_ruse_turn_to_allow))
		end,
		true
	)

	core:add_listener(
		"troy_odysseus_ruse_dilemma_choice_followup_event",
		"FactionTurnStart",
		function(context)
			return context:faction():name() == odysseus_ruse_faction_name and cm:model():turn_number() >= odysseus_ruse_turn_to_allow
		end,
		function(context)
			local ruse_char = cm:model():military_force_for_command_queue_index(odysseus_ruse_mf_cqi):general_character()

			if ruse_char
			and not ruse_char:is_null_interface()
			and ruse_char:is_besieging()
			and ruse_char:has_region()
			and ruse_char:region():name() == odysseus_ruse_target_region
			then
				cm:trigger_incident(odysseus_ruse_faction_name, odysseus_ruse_notification_incident_key, true)
				odysseus_ruse_should_show_ui = true
			else
				out("Ruse military force is no longer siegeing, not showing UI or incident.")
				odysseus_ruse_faction_name = nil
				odysseus_ruse_turn_to_allow = 0
				odysseus_ruse_is_active = false
				odysseus_ruse_mf_cqi = 0
				odysseus_ruse_should_show_ui = false
			end
		end,
		true
	)

	core:add_listener(
		"troy_odysseus_ruse_restore_stuff_after_battle",
		"CharacterCompletedBattle",
		function(context)
			return context:character():military_force():command_queue_index() == odysseus_ruse_mf_cqi
		end,
		function(context)
			cm:set_battle_details_override_for_region(wrath_of_posseidon_earthquake_incident_target_region, "settlement_standard", "", "", "")
			cm:remove_custom_battlefield("ruse")
			add_battle_script_override()
		end,
		false
	)

	core:add_listener(
		"troy_odysseus_ruse_restore_stuff_after_battle_2",
		"CharacterTurnStart",
		function(context)
			local char = context:character()
			return cm:char_is_general_with_army(char) and char:military_force():command_queue_index() == odysseus_ruse_mf_cqi and not char:is_besieging()
		end,
		function(context)
			odysseus_ruse_should_show_ui = false
			odysseus_ruse_faction_name = nil
			odysseus_ruse_turn_to_allow = 0
			odysseus_ruse_mf_cqi = 0
			odysseus_ruse_is_active = false
			cm:set_battle_details_override_for_region(wrath_of_posseidon_earthquake_incident_target_region, "settlement_standard", "", "", "")
		end,
		false
	)

	core:add_listener(
		"troy_odysseus_ruse_night_battle_scripted_event",
		"UITriggerScriptEvent",
		function(context) return context:trigger() == "ruse_night_battle_event" end,
		function(context)
			cm:force_night_battle(true)

			local units_list = find_uicomponent(core:get_ui_root(), "popup_pre_battle" , "allies_combatants_panel" , "army" , "units_and_banners_parent" , "units_window" , "listview" , "list_clip" , "list_box" , "commander_header_0" , "units")
			local units_list_id = units_list:Id()

			for i=0, units_list:ChildCount() - 1 do
				local child = UIComponent(units_list:Find(i))
				local horse_avail = UIComponent(child:Find("trojan_horse_availability"))
				local unit_interface = cm:model():unit_for_command_queue_index(tonumber(string.sub(child:Id(), 6)))
				local unit_class = unit_interface:unit_class()
				if  unit_class ~= "chariot" and unit_class ~= "spcl" then
					horse_avail:SetVisible(true)
				end
			end

			local deployment_extras = find_uicomponent(core:get_ui_root(),"popup_pre_battle","mid","battle_deployment","regular_deployment","list","deployment_extras")
			deployment_extras:PropagateVisibility(false)
		end,
		true
	)

	-- Ugly hack to work around esc menu 
	core:add_listener(
		"troy_odysseus_ruse_fixup_on_escape_menu",
		"PanelClosedCampaign",
		function(context)
			return odysseus_ruse_should_show_ui and context.string == "popup_pre_battle"
		end,
		function(context)
			cm:steal_escape_key(false)
		end,
		true
	)

end


core:add_listener(
	"troy_odysseus_ruse_prebattle_ui_loading",
	"UICreated",
	true,
	function()
		core:progress_on_loading_screen_dismissed(
			function()
				loading_screen_shown = false
			end,
			false
		)
	end,
	false
);

core:add_listener(
	"troy_odysseus_ruse_prebattle_ui",
	"PanelOpenedCampaign",
	function(context)
		local pb = cm:model():pending_battle()
		local pb_attacker = pb:attacker()
		return context.string == "popup_pre_battle"
		and odysseus_ruse_should_show_ui
		and pb:battle_type() == "settlement_standard"
		and odysseus_ruse_faction_name
		and cm:pending_battle_cache_faction_is_involved(odysseus_ruse_faction_name)
		and pb_attacker:faction():name() == odysseus_ruse_faction_name
		and pb_attacker:military_force():command_queue_index() == odysseus_ruse_mf_cqi
		and odysseus_ruse_is_active
		and cm:model():turn_number() >= odysseus_ruse_turn_to_allow
	end,
	function(context)
		out("PREBATTLE OPENED")
		check_loading_screen(context)
		cm:apply_effect_bundle_to_region(odysseus_ruse_target_debuff_bundle, odysseus_ruse_target_region, 0)
	end,
	true
)

function check_loading_screen(ctx)
	local context = ctx
	out(" check_loading_screen CALLED " .. tostring(loading_screen_shown))
	if loading_screen_shown then
		cm:callback(function()
				check_loading_screen(context)
			end,
			0.5,
			"check_loading_screen_callback"
		)
	else
		setup_ruse_ui(context)
		cm:remove_callback("check_loading_screen_callback")
	end
end


function setup_ruse_ui(ctx)
	local context = ctx
	cm:steal_escape_key(true)
	local ui_root = core:get_ui_root()
	out("SETUP RUSE UI CALLED")
	local ody_faction = cm:model():world():faction_by_key(odysseus_ruse_faction_name)
	CampaignUI.TriggerCampaignScriptEvent(ody_faction:command_queue_index(), "ruse_night_battle_event")

	loading_screen_shown = false
	local btn_attack = find_uicomponent(ui_root, "popup_pre_battle" , "mid" , "battle_deployment" , "regular_deployment" , "button_set_siege" , "button_attack")
	local btn_horse = find_uicomponent(ui_root, "popup_pre_battle" , "mid" , "battle_deployment" , "regular_deployment" , "button_set_siege" , "button_trojan_horse")
	local btn_retreat = find_uicomponent(ui_root, "popup_pre_battle" , "mid" , "battle_deployment" , "regular_deployment" , "button_set_siege" , "button_retreat")
	local horse_overlay = find_uicomponent(ui_root,"battle_deployment","regular_deployment","siege_information_panel","trojan_horse_overlay")
	local units_count = find_uicomponent(horse_overlay, "dy_units")
	local info_ui = find_uicomponent(horse_overlay, "tx_battle_desc")
	local num_units_in_horse = 0
	local max_num_units_in_horse = 6
	units_count:SetStateText(tostring(num_units_in_horse) .. "/" .. tostring(max_num_units_in_horse), "From troy_campaign_setup.lua - unlocalised text")
	horse_overlay:SetVisible(true)
	btn_attack:SetVisible(false)
	btn_horse:SetVisible(true)

	local _width,_height, lines = info_ui:TextDimensionsForText(common.get_localised_string("random_localisation_strings_string_troy_trojan_horse_odysseus_ruse_desc"))
	info_ui:ResizeTextResizingComponentToInitialSize(_width,_height)
	info_ui:SetStateText(
		common.get_localised_string("random_localisation_strings_string_troy_trojan_horse_odysseus_ruse_desc"),
		"random_localisation_strings_string_troy_trojan_horse_odysseus_ruse_desc"
	)

	-- local autoresolve_btn = find_uicomponent(ui_root, "popup_pre_battle","mid","battle_deployment","regular_deployment","button_set_siege","button_autoresolve")
	-- autoresolve_btn:PropagateVisibility(false)
	local tt_text = common.get_localised_string("random_localisation_strings_string_troy_ruse_retreat")
	btn_retreat:SetTooltipWithTitle("troy_ruse_retreat_title", "troy_ruse_retreat", true)

	units_count:SetStateText(tostring(num_units_in_horse_saved) .. "/" .. tostring(max_num_units_in_horse), "From troy_campaign_setup.lua - unlocalised text")

	local units_list = find_uicomponent(ui_root, "popup_pre_battle" , "allies_combatants_panel" , "army" , "units_and_banners_parent" , "units_window" , "listview" , "list_clip" , "list_box" , "commander_header_0" , "units")
	local units_list_id = units_list:Id()
	if num_units_in_horse_saved ~= 0 then
		num_units_in_horse = num_units_in_horse_saved
	end
	core:add_listener(
		"troy_odysseus_ruse_horse_avail_clicked",
		"ComponentLClickUp",
		function(context)
			return uicomponent_descended_from(UIComponent(context.component), units_list_id)
		end,
		function(context)
			-- something was happening and the units_list ui_component from  above as beeing ivalidated between the two calls. may not be the best but this ensures it uses a valid compoent.
			local units_list = find_uicomponent(ui_root, "popup_pre_battle" , "allies_combatants_panel" , "army" , "units_and_banners_parent" , "units_window" , "listview" , "list_clip" , "list_box" , "commander_header_0" , "units")

			local clicked_avail = UIComponent(context.component)
			local clicked_unit = UIComponent(clicked_avail:Parent())

			-- Due to ComponentLClickUp beeing fired before the state of the componet actually gets updated to the new one,
			-- the current component state is actually the previous one(i.e. component was just clicked, one would expect state to be `selected`, but its actually still `not selected` or the default).
			-- The state will get updated after this function finishes.
			if clicked_avail:CurrentState() == "selected" then -- "unclicked state. selected ->avaliable"
				num_units_in_horse = num_units_in_horse - 1
				num_units_in_horse_saved = num_units_in_horse
				units_count:SetStateText(tostring(num_units_in_horse) .. "/" .. tostring(max_num_units_in_horse), "From troy_campaign_setup.lua - unlocalised text")
			elseif clicked_avail:CurrentState() == "available" then -- "clicked state. avaliable ->selected"
				num_units_in_horse = num_units_in_horse + 1
				num_units_in_horse_saved = num_units_in_horse
				units_count:SetStateText(tostring(num_units_in_horse) .. "/" .. tostring(max_num_units_in_horse), "From troy_campaign_setup.lua - unlocalised text")
			end
			if num_units_in_horse == max_num_units_in_horse then
				for i=0, units_list:ChildCount() - 1 do
					local child_ = UIComponent(units_list:Find(i))
					local horse_avail_ = UIComponent(child_:Find("trojan_horse_availability"))
					if horse_avail_:CurrentState() == "available" then
						horse_avail_:SetInteractive(false)
					end
				end
				clicked_avail:SetInteractive(true) -- due to the problem with states above, the last component we click has to be taken special care of.
			elseif num_units_in_horse < max_num_units_in_horse then
				for i=0, units_list:ChildCount() - 1 do
					local child_ = UIComponent(units_list:Find(i))
					local horse_avail_ = UIComponent(child_:Find("trojan_horse_availability"))
					horse_avail_:SetInteractive(true)
				end
			end
		end,
		true
	)

	core:add_listener(
		"troy_odysseus_ruse_horse_button_attack",
		"ComponentLClickUp",
		function(context)
			return context.string == "button_trojan_horse" end,
		function(context)
			local btn_horse = UIComponent(context.component)
			local selected_cqis_as_string = ""
			local units_list = find_uicomponent(ui_root, "popup_pre_battle" , "allies_combatants_panel" , "army" , "units_and_banners_parent" , "units_window" , "listview" , "list_clip" , "list_box" , "commander_header_0" , "units")

			for i=0, units_list:ChildCount() - 1 do
				local child = UIComponent(units_list:Find(i))
				local horse_avail = UIComponent(child:Find("trojan_horse_availability"))
				if horse_avail:CurrentState() == "selected" then 
					if selected_cqis_as_string == "" then 
						selected_cqis_as_string = selected_cqis_as_string .. string.sub(child:Id(), 6)
					else
						selected_cqis_as_string = selected_cqis_as_string .. " " .. string.sub(child:Id(), 6)
					end
					out(string.sub(child:Id(), 6))
				end
			end

			core:svr_save_string("ruse_unit_cqis", tostring(selected_cqis_as_string))

			local confirmation_box_id = context.string .. "_confirmation_box"
			local confirmation_box = UIComponent(ui_root:CreateComponent(confirmation_box_id, "ui/Common UI/dialogue_box"))
			confirmation_box:RegisterTopMost()
			confirmation_box:SetVisible(true)
			confirmation_box:LockPriority()
			find_child_uicomponent(confirmation_box, "ok_group"):SetVisible(false)
			-- set text here
			local dy_text = find_uicomponent(confirmation_box, "DY_text")
			dy_text:SetStateText(common.get_localised_string("ui_text_replacements_localised_text_trojan_horse_battle_confirmation_prompt"), "ui_text_replacements_localised_text_trojan_horse_battle_confirmation_prompt")
			core:add_listener(
				"ruse_confirmation_box_yes",
				"ComponentLClickUp",
				function(context)
					return context.string == "button_tick" and uicomponent_descended_from(UIComponent(context.component), confirmation_box_id)
				end,
				function(context)
					confirmation_box:RemoveTopMost()
					confirmation_box:UnLockPriority()
					cm:force_remove_siege_equipment(cm:get_military_force_by_cqi(odysseus_ruse_mf_cqi))
					cm:remove_custom_battlefield("generic")
					out("SHOULD START")
					if cm:get_campaign_name() == "troy_mythic" then
						cm:set_battle_details_override_for_region(wrath_of_posseidon_earthquake_incident_target_region, "settlement_standard", odysseus_ruse_target_battle_override, "catchment_06", odysseus_ruse_target_battle_time_of_day)
					else
						cm:set_battle_details_override_for_region(wrath_of_posseidon_earthquake_incident_target_region, "settlement_standard", odysseus_ruse_target_battle_override, "catchment_05", odysseus_ruse_target_battle_time_of_day)
					end
					cm:add_custom_battlefield(
						"ruse",												-- string identifier
						0,													-- x co-ord
						0,													-- y co-ord
						5000,												-- radius around position
						false,												-- will campaign be dumped
						"",													-- loading override
						"script/battle/campaign_battle/odysseus_ruse.lua",	-- script override
						"",													-- entire battle override
						0,													-- human alliance when battle override
						false,												-- launch battle immediately
						true,												-- is land battle (only for launch battle immediately)
						false,												-- force application of autoresolver result
						false,												-- force a siege battle to be fought outside the settlement as a land battle
						false												-- disable fortification towers (for siege battles)
					)

					local btn_attack = find_uicomponent(ui_root, "popup_pre_battle" , "mid" , "battle_deployment" , "regular_deployment" , "button_set_siege" , "button_attack")
					btn_attack:SetVisible(true)
					btn_attack:SetInteractive(true)
					btn_attack:SetDisabled(false)
					btn_attack:SimulateLClick()

					core:remove_listener("ruse_confirmation_box_yes")
				end,
				true
			)

			core:add_listener(
				"ruse_confirmation_box_no",
				"ComponentLClickUp",
				function(context)
					return context.string == "button_cancel" and uicomponent_descended_from(UIComponent(context.component), confirmation_box_id)
				end,
				function(context)
					confirmation_box:RemoveTopMost()
					confirmation_box:UnLockPriority()
					confirmation_box:Destroy()
				end,
				false
			)
		end,
		true
	)

	core:add_listener(
		"troy_odysseus_ruse_prebattle_ui_closed",
		"PanelClosedCampaign",
		function(context)
			return context.string == "popup_pre_battle"
		end,
		function(context)
			core:remove_listener("troy_odysseus_ruse_horse_avail_clicked")
			core:remove_listener("troy_odysseus_ruse_horse_button_attack")
			local horse_overlay = find_uicomponent(core:get_ui_root(),"battle_deployment","regular_deployment","siege_information_panel","trojan_horse_overlay")
			horse_overlay:SetVisible(true)
		end,
		false
	)

end
--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------

cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("WRATH_OF_POSSEIDON_QUAKE_INCIDENT_TURN",wrath_of_posseidon_earthquake_incident_turn,context)
		cm:save_named_value("WRATH_OF_POSSEIDON_QUAKE_PREVIOUS_INCIDENT_TURN",wrath_of_posseidon_earthquake_previous_incident_turn,context)
		cm:save_named_value("WRATH_OF_POSSEIDON_QUAKE_INCIDENT_BOOL",wrath_of_posseidon_earthquake_incident_has_fired,context)
		cm:save_named_value("WRATH_OF_POSSEIDON_WARNING_INCIDENT_TURN",wrath_of_posseidon_warning_incident_turn,context)
		cm:save_named_value("WRATH_OF_POSSEIDON_EQ_CURRENT_REPAIR", wrath_of_posseidon_earthquake_config.current_repair,context)
		cm:save_named_value("WRATH_OF_POSSEIDON_EQ_LAST_TURN_WITH_REPAIR", wrath_of_posseidon_earthquake_config.last_turn_repair,context)

		cm:save_named_value("ODYSSEUS_RUSE_UI_BOOL",odysseus_ruse_should_show_ui,context)
		cm:save_named_value("ODYSSEUS_RUSE_FACTION_KEY",odysseus_ruse_faction_name,context)
		cm:save_named_value("ODYSSEUS_RUSE_TURN_NUM",odysseus_ruse_turn_to_allow,context)
		cm:save_named_value("ODYSSEUS_RUSE_MF_CQI",odysseus_ruse_mf_cqi,context)
		cm:save_named_value("ODYSSEUS_RUSE_HINT_SHOWN_BOOL",odysseus_ruse_hint_incident_shown_bool,context)
		cm:save_named_value("ODYSSEUS_RUSE_HINT_CONF_SHOWN_BOOL",odysseus_ruse_hint_confederation_shown_bool,context)
		cm:save_named_value("ODYSSEUS_RUSE_IS_ACTIVE_BOOL", odysseus_ruse_is_active, context)
	end
)

cm:add_loading_game_callback(
	function(context)
		wrath_of_posseidon_earthquake_incident_turn = cm:load_named_value("WRATH_OF_POSSEIDON_QUAKE_INCIDENT_TURN",wrath_of_posseidon_earthquake_incident_turn,context)
		wrath_of_posseidon_earthquake_previous_incident_turn = cm:load_named_value("WRATH_OF_POSSEIDON_QUAKE_PREVIOUS_INCIDENT_TURN",wrath_of_posseidon_earthquake_previous_incident_turn,context)
		wrath_of_posseidon_earthquake_incident_has_fired = cm:load_named_value("WRATH_OF_POSSEIDON_QUAKE_INCIDENT_BOOL",wrath_of_posseidon_earthquake_incident_has_fired,context)
		wrath_of_posseidon_warning_incident_turn = cm:load_named_value("WRATH_OF_POSSEIDON_WARNING_INCIDENT_TURN",wrath_of_posseidon_warning_incident_turn,context)
		wrath_of_posseidon_earthquake_config.current_repair = cm:load_named_value("WRATH_OF_POSSEIDON_EQ_CURRENT_REPAIR", wrath_of_posseidon_earthquake_config.current_repair,context)
		wrath_of_posseidon_earthquake_config.last_turn_repair =  cm:load_named_value("WRATH_OF_POSSEIDON_EQ_LAST_TURN_WITH_REPAIR", wrath_of_posseidon_earthquake_config.last_turn_repair,context)

		odysseus_ruse_should_show_ui = cm:load_named_value("ODYSSEUS_RUSE_UI_BOOL",odysseus_ruse_should_show_ui,context)
		odysseus_ruse_faction_name = cm:load_named_value("ODYSSEUS_RUSE_FACTION_KEY",odysseus_ruse_faction_name,context)
		odysseus_ruse_turn_to_allow = cm:load_named_value("ODYSSEUS_RUSE_TURN_NUM",odysseus_ruse_turn_to_allow,context)
		odysseus_ruse_mf_cqi = cm:load_named_value("ODYSSEUS_RUSE_MF_CQI",odysseus_ruse_mf_cqi,context)
		odysseus_ruse_hint_incident_shown_bool = cm:load_named_value("ODYSSEUS_RUSE_HINT_SHOWN_BOOL",odysseus_ruse_hint_incident_shown_bool,context)
		odysseus_ruse_hint_confederation_shown_bool = cm:load_named_value("ODYSSEUS_RUSE_HINT_CONF_SHOWN_BOOL",odysseus_ruse_hint_confederation_shown_bool,context)
		odysseus_ruse_is_active = cm:load_named_value("ODYSSEUS_RUSE_IS_ACTIVE_BOOL",false,context)
	end
)
