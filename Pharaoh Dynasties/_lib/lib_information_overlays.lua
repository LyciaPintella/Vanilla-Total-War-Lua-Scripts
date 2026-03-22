----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
--
--	INFORMATION OVERLAY
--
--- loaded_in_battle
--- loaded_in_campaign
--- class info_overlay info_overlay Information overlay
--- desc The Information Overlay is a toggleable interface that highlights parts of the UI and provides contextual tooltips, intended to provide more information about the hovered component.
--- desc The Information Overlay object is automatically created in Campaign and Battle and can be accessed using a ShortCut key (default F2). This can be changed by calling info_overlay:default_key(<string key ID>). Valid key ID's can be found in default_keys.xml under Scripted Shortcuts.
--
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------

-- definition
info_overlay = {
	ui_root = nil,
	name = "info_overlay",
	width = 0,
	height = 0,
	pos_x = 0,
	pos_y = 0,
	layout_full_path = "UI/Common UI/info_overlay",
	child_layout_full_path = "UI/Common UI/info_overlay_child",
	tour_button_full_path = "UI/Common UI/button_scripted_tour",
	overlays_info_path = {
		default = {"menu_bar", "buttongroup", "holder_help_overlay", "button_overlay_info"},
		diplomacy = {"diplomacy_dropdown", "diplomacy_hud_overlays", "button_overlay_info"}
	},
	buttons_data = {
		button_help_overlay = {
			path = {"menu_bar", "button_help_overlay"},
			apply_priority_lock = true,
		},
		button_help_overlay_diplomacy = {
			path = {"diplomacy_dropdown", "diplomacy_hud_overlays", "button_help_overlay_diplomacy"},
			apply_priority_lock = false,
		},
	},
	uic = false,
	shortcut_listener_name = "info_overlay_shortcut_toggle",
	shortcut_keys = {
		script_F1_button_overlays = true,
		script_F1_char_panel = true,
		script_F1_local_deities = true,
	},
	component_overlays = {},
	callback_functions = {},
	data_table = {},
	tours_table = {},
	unique_num = 0,
	auto_toggle_on_first_time_open_panel = {
		["fm_achilles_hotblooded"] = true,
		["fm_achilles_greatestwarrior"] = true,
		["offices"] = true,
		["fm_demand_tribute"] = true,
		["odysseus_supply_bases"] = true,
		["reliable_friend"] = true,
		["spartan_settlers"] = true,
		["fm_trojan_alliance"] = true,
		["fm_priams_benevolence"] = true,
		["fm_helen"] = true,
		["fm_divine_missions"] = true,
		["fm_speak_with_dead"] = true,
		["fm_sarpedon_luxury_goods_v2"] = true,
		["fm_lycian_trade_guild"] = true,
		["fm_amazon_kingdom_milestones"] = true,
		["unit_upgrades_panel"] = true,
		["fm_blood_oath"] = true,
		["fm_capture_bonus"] = true,
		--["technology_panel"] = true,
		["gods_and_favor"] = true,
		["fm_dio_1"] = true,
		["fm_dio_2"] = true, 
		["fm_ajaxs_champion_challenge"] = true,
		["fm_ajax_renown"] = true, 
	},
	component_overlay_priority = 2102,
	uic_priority = 2000,
	advice_interface_priority = 2200,
	start_tour_button_priority = 2200,
	overlays_info_priority = 2001,
	overlays_buttons_priority = 1000
}

__info_overlay = nil


-- set info_overlay to be of custom type TYPE_INFO_OVERLAY
set_class_custom_type_and_tostring(info_overlay, TYPE_INFO_OVERLAY);


-- contstruction - automatically called, not for external use



function info_overlay:new()

	if __info_overlay then
		return __info_overlay
	end

	local io = {}
	
	-- set 'ioc' to derive from self ('info_overlay')
	set_object_class(io, self);

	io:initialize()

	io.name = name
	io.component_overlays = self.component_overlays
	io.callback_functions = self.callback_functions
	io.data_table = self.data_table
	io.tours_table = self.tours_table

	__info_overlay = io

	core:add_listener(
		"BattleManagerCreatedListener",
		"ScriptEventGlobalBattleManagerCreated",
		true,
		function()
			bm:register_phase_change_callback(
				"Complete",
				function()
					if io.uic and is_uicomponent(io.uic) and io.uic:Visible() then 
						toggle_info_overlays()
					end
					common.enable_info_overlays(false)
				end
			);
		end,
		false
	)

	return io

end

function info_overlay:next_unique_number()
	self.unique_num = self.unique_num + 1
	return self.unique_num
end

-- This method is for internal use only. Called by the constructor or on UIReloaded
function info_overlay:initialize()
	self.ui_root = core:get_ui_root()
	self.width , self.height = self.ui_root:Dimensions()
	self.pos_x = self.pos_x
	self.pos_y = self.pos_y

	self.uic = core:get_or_create_component(self.name, self.layout_full_path)
	self.uic:SetCanResizeWidth(true)
	self.uic:SetCanResizeHeight(true)
	self.uic:Resize(self.width,self.height, true)
	self.uic:MoveTo(self.pos_x,self.pos_y)
	self.uic:SetMoveable(false)
	self.uic:PropagatePriority(self.uic_priority)
	--self.uic:PropagateOpacity(40)
	self.uic:SetVisible(false)
	-- don't forget to add opacity
end

local function handle_tooltip(component, tbl_param)
	local _params = {}
	_params.title = tbl_param.tooltip_params.title
	_params.description = tbl_param.tooltip_params.description
	_params.list = {}
	if tbl_param.tooltip_params.list and type(tbl_param.tooltip_params.list) == "table" then
		for idx,data in ipairs(tbl_param.tooltip_params.list) do
			_params.list[idx] = {}
			_params.list[idx].text = data.text
			if type(data.img) == "string" then 
				_params.list[idx].img = data.img
			elseif type(data.img) == "function" then
				_params.list[idx].img = data.img()
			else
				script_error("Unexpected data type in img data for overlay " .. tostring(component) .. ". Must be string or function.")
			end
		end
	end
	component:InterfaceFunction("set_tt_data", _params)
end
function info_overlay:start_listeners()

	core:add_listener(
		"ui_info_overlays_close",
		"ScriptEventCloseInfoOverlays",
		true,
		function(context)
			close_info_overlays()
		end,
		true
	)

	core:add_listener(
		"ui_info_overlays_prebattle_screen_guard",
		"PanelOpenedCampaign",
		function(context)
			return context.string == "popup_pre_battle"
		end,
		function(context)
			close_info_overlays()
		end,
		true
	)

	core:add_listener(
		self.shortcut_listener_name,
		"ShortcutPressed",
		function(context)
			return self.shortcut_keys[context.string]
		end,
		function(context)
			toggle_info_overlays()
		end,
		true
	)

	core:add_listener(
		"ui_info_overlays_button_pressed",
		"ComponentLClickUp",
		function(context) return self.buttons_data[context.string] end,
		function(context)
			toggle_info_overlays()
		end,
		true
	)

	core:add_listener(
		"ui_reloaded_info_overlays",
		"UIReloaded",
		true,
		function(context)
			self:initialize()
		end,
		true
	)

	core:add_listener(
		"first_time_openning_panel_auto_toggle_overlays",
		"PanelOpenedCampaign",
		function(context) return self.auto_toggle_on_first_time_open_panel[context.string] end,
		function(context)
			local history_string = "first_time_open_" .. context.string
			if not common.get_advice_history_string_seen(history_string) then
				if not core:is_advice_level_high() then
					cm:callback(toggle_info_overlays, 1)
				end

				common.set_advice_history_string_seen(history_string)
			end
		end,
		true
	)

	core:add_listener(
		"info_overlays_enabled_or_disabled",
		"InfoOverlaysEnabledOrDisabled",
		true,
		function(context)
			if core:is_ui_created() then
				state = context.are_enabled and "active" or "inactive"

				for _, data in pairs(self.buttons_data) do
					local overlays_button = core:get_ui_root():SequentialFind(unpack(data.path))

					if overlays_button then
						overlays_button:SetState(state)
					end
				end
			end
		end,
		true
	)

    core:add_listener(
        "info_overlays_refresh_requested",
        "RefreshOverlaysRequested",
        true,
        function(context)
            if core:is_ui_created() then
                local io = get_info_overlay()
                if io.uic and is_uicomponent(io.uic) and io.uic:Visible() then
                    toggle_info_overlays()
                    toggle_info_overlays()
                end
            end
        end,
        true
    )

	return
end

-- Close the info overlay if it are open
function close_info_overlays()
	local io = get_info_overlay()

	if io.uic and is_uicomponent(io.uic) and io.uic:Visible() then
		toggle_info_overlays()
	end
end;

function toggle_info_overlays()
	if not common.are_info_overlays_enabled() then
		return
	end

    local io = get_info_overlay()
    local advice_interface = core:get_ui_root():SequentialFind("advice_interface")
	local is_enabled = false

    if io.uic and is_uicomponent(io.uic) and (not io.uic:Visible()) then
        for k,v in pairs(io.callback_functions) do
            v()
        end
        io.uic:PropagateVisibility(true)
        io.uic:RegisterTopMost()

        if advice_interface then
            advice_interface:PropagatePriority(io.advice_interface_priority)
            advice_interface:RegisterTopMost()
        end

        if core:is_campaign() then
            cm:steal_escape_key_with_callback("info_overlays_escape_pressed_listener", toggle_info_overlays)
        elseif core:is_battle() then
            bm:steal_escape_key_with_callback("info_overlays_escape_pressed_listener", toggle_info_overlays)
        else
            script_error("lib_information_overlays - currently this is working only in campaign or battle")
        end

        io:show_overlays_info(true)
        io:update_overlays_buttons(true)
		is_enabled = true
    elseif io.uic and is_uicomponent(io.uic) and io.uic:Visible() then
        io.uic:PropagateVisibility(false)
        io.uic:DestroyChildren()

        if advice_interface then
            advice_interface:RemoveTopMost()
        end

        if core:is_campaign() then
            cm:release_escape_key_with_callback("info_overlays_escape_pressed_listener")
        elseif core:is_battle() then
            bm:release_escape_key_with_callback("info_overlays_escape_pressed_listener")
        else
            script_error("lib_information_overlays - currently this is working only in campaign or battle")
        end

        io:show_overlays_info(false)
        io:update_overlays_buttons(false)
		is_enabled = false
    else
        script_error("ERROR: start_listeners() called but info_overlay is missing it's UIC. How can this be? ") 
    end
	core:trigger_custom_event("ScriptEventInfoOverlayToggled", {is_enabled})
end


function info_overlay:is_really_visible(uic)
    if not uic:Visible() or uic:Opacity() < 10 then
        return false
    end

    if uic == self.ui_root then
        return true
    end

    return self:is_really_visible(UIComponent(uic:Parent()))

end
--- function add_component_overlay()
--- desc Adds a new component overlay 
--- return nil
function info_overlay:add_component_overlay(tbl_param)

	local cb_func = function()

		local target_uic = tbl_param.target_uic
		local tooltip_text = tbl_param.tooltip_text
		local tar_uic

		if tbl_param.path_is_not_exact then
			tar_uic = self.ui_root:SequentialFind(unpack(target_uic))
		else
			tar_uic = find_uicomponent(self.ui_root, unpack(target_uic))
		end

		if not is_uicomponent(tar_uic) then --or (not tar_uic:Visible(true)) then
			--script_error("ERROR: add_component_overlay() called but " .. tostring(target_uic) .. " is not a UIComponent.")
			return
		end

		-- if there is an opened full screen panel and the uic is not inside it, we don't want to show it
		local is_uic_outside_of_opened_fullscreen_panel = false
		if core:is_campaign() then
			local panel = uim:get_open_fullscreen_panel()
			if panel ~= false then
				is_uic_outside_of_opened_fullscreen_panel = (not uicomponent_descended_from(tar_uic, panel))
			end
		end

		local show_condition = true
		if tbl_param.show_condition then
			local status, retval = pcall(tbl_param.show_condition)
			show_condition = status and retval or false
		end

		if not show_condition or not self:is_really_visible(tar_uic) or is_uic_outside_of_opened_fullscreen_panel then --tar_parent:Visible(true) then
			--script_error("ERROR: add_component_overlay() called but " .. tostring(target_uic) .. " is not a UIComponent.")
			return
		end

		local component_overlay = {}
		component_overlay.parent = tar_uic
		component_overlay.name = tar_uic:Id() .. "_overlay" .. tostring(self:next_unique_number())
		local component = core:get_or_create_component(component_overlay.name, self.child_layout_full_path,self.uic)
		if tbl_param.tooltip_params then
			handle_tooltip(component, tbl_param)
		end
		
		component_overlay.uic = component
		component:SetCanResizeWidth(true)
		component:SetCanResizeHeight(true)
		component:Resize(tar_uic:Width(),tar_uic:Height(), true)
		component:MoveTo(tar_uic:Position())
		component:SetMoveable(false)
		--component:PropagateOpacity(140)
		component:PropagateVisibility(true)

		if tbl_param.priority_override then
			component:PropagatePriority(tbl_param.priority_override)
		else
			component:PropagatePriority(self.component_overlay_priority)
		end

		local animation__func = function()
				local shoud_show_overlay = true
				local did_target_position_changed = false

				-- check if target uic was destroyed or hidden in the meantime
				if not (tar_uic:IsValid() and component:IsValid() and self:is_really_visible(tar_uic)) then
					shoud_show_overlay = false
				end

				if shoud_show_overlay then
					local new_x, new_y = tar_uic:Position()
					local x, y = component:Position()
					did_target_position_changed = new_x ~= x or new_y ~= y

					if did_target_position_changed then
						component:MoveTo(new_x, new_y)
					end
				else
					if component:IsValid() then
						component:SetVisible(false)
					end
				end

				if not (shoud_show_overlay and did_target_position_changed) then
					if __game_mode == __lib_type_campaign then
						cm:remove_callback("animation_" .. component_overlay.name)
					elseif __game_mode == __lib_type_battle then
						bm:remove_process("animation_" .. component_overlay.name)
					end
				end
			end

		if __game_mode == __lib_type_campaign then
			cm:repeat_callback(
				animation__func,
				0.2,
				"animation_" .. component_overlay.name
			)
		elseif __game_mode == __lib_type_battle then
			bm:repeat_callback(
				animation__func,
				200,
				"animation_" .. component_overlay.name
			)
		end

		if tooltip_text and tooltip_text ~= "" then
			component:SetTooltipText(common.get_localised_string(tooltip_text), tooltip_text, true)
		end

		component:RegisterTopMost()
		for k,v in pairs(self.component_overlays) do 
			if v.name == component_overlay.name then 
				return 
			end	
		end
		table.insert(self.component_overlays,component_overlay)
	end

	table.insert(self.callback_functions,cb_func)

	return
end


function info_overlay:add_component_overlay_with_tour(tbl_param,tour_ref)

	local cb_func = function()

		local target_uic = tbl_param.target_uic
		local tooltip_text = tbl_param.tooltip_text

		local tar_uic = find_uicomponent(self.ui_root, unpack(target_uic))

		if not is_uicomponent(tar_uic) then
			--script_error("ERROR: add_component_overlay() called but " .. tostring(target_uic) .. " is not a UIComponent.")
			return
		end

		-- if there is an opened full screen panel and the uic is not inside it, we don't want to show it
		local is_uic_outside_of_opened_fullscreen_panel = false
		if core:is_campaign() then
			local panel = uim:get_open_fullscreen_panel()
			if panel ~= false then
				is_uic_outside_of_opened_fullscreen_panel = (not uicomponent_descended_from(tar_uic, panel))
			end
		end

		local show_condition = true
		if tbl_param.show_condition then
			local status, retval = pcall(tbl_param.show_condition)
			show_condition = status and retval or false
		end

		if not show_condition or not self:is_really_visible(tar_uic) or is_uic_outside_of_opened_fullscreen_panel then --tar_parent:Visible(true) then
			--script_error("ERROR: add_component_overlay() called but " .. tostring(target_uic) .. " is not a UIComponent.")
			return
		end

		local component_overlay = {}
		component_overlay.parent = tar_uic
		component_overlay.name = tar_uic:Id() .. "_overlay" .. tostring(self:next_unique_number())
		local component = core:get_or_create_component(component_overlay.name, self.child_layout_full_path,self.uic)
		if tbl_param.tooltip_params then
			handle_tooltip(component, tbl_param)
		end

		component_overlay.uic = component
		component_overlay.listener_started = false
		component:SetCanResizeWidth(true)
		component:SetCanResizeHeight(true)
		component:Resize(tar_uic:Width(),tar_uic:Height(), true)
		component:MoveTo(tar_uic:Position())
		component:SetMoveable(false)
		--component:PropagateOpacity(140)
		component:PropagateVisibility(true)
		
		if tbl_param.priority_override then
			component:PropagatePriority(tbl_param.priority_override)
		else
			component:PropagatePriority(self.component_overlay_priority)
		end

		local animation__func = function()
				local shoud_show_overlay = true
				local did_target_position_changed = false

				-- check if target uic was destroyed or hidden in the meantime
				if not (tar_uic:IsValid() and component:IsValid() and self:is_really_visible(tar_uic)) then
					shoud_show_overlay = false
				end

				if shoud_show_overlay then
					local new_x, new_y = tar_uic:Position()
					local x, y = component:Position()
					did_target_position_changed = new_x ~= x or new_y ~= y

					if did_target_position_changed then
						component:MoveTo(new_x, new_y)
					end
				else
					if component:IsValid() then
						component:SetVisible(false)
					end
				end

				if not (shoud_show_overlay and did_target_position_changed) then
					if __game_mode == __lib_type_campaign then
						cm:remove_callback("animation_" .. component_overlay.name)
					elseif __game_mode == __lib_type_battle then
						bm:remove_process("animation_" .. component_overlay.name)
					end
				end
			end

		if __game_mode == __lib_type_campaign then
			cm:repeat_callback(
				animation__func,
				0.2,
				"animation_" .. component_overlay.name
			)
		elseif __game_mode == __lib_type_battle then
			bm:repeat_callback(
				animation__func,
				200,
				"animation_" .. component_overlay.name
			)
		end

		if tooltip_text and tooltip_text ~= "" then
			component:SetTooltipText(common.get_localised_string(tooltip_text), tooltip_text, true)
		end

		component:RegisterTopMost()

		local start_tour_button = core:get_or_create_component(component_overlay.name .. "_tour_button", self.tour_button_full_path,component)

		if __game_mode == __lib_type_campaign and cm:is_multiplayer() and cm:model():world():whose_turn_is_it():name() ~= cm:get_local_faction_name(true) then
			start_tour_button:SetVisible(false)
		else
			start_tour_button:SetVisible(true)
			start_tour_button:RegisterTopMost()
			start_tour_button:SetDockingPoint(5)
			start_tour_button:PropagatePriority(self.start_tour_button_priority)
			if not tour_ref.check() then
				if tour_ref.tooltip_ref and type(tour_ref.tooltip_ref) == "function" then
					--start_tour_button:SetDisabled(true)
					local tooltip_ref = tour_ref.tooltip_ref()
					if start_tour_button:SetState("inactive") then
					start_tour_button:SetTooltipText(common.get_localised_string(tooltip_ref), tooltip_ref, false)
					else
						script_error("ERROR: SetState() called but provided [" .. tostring(self.tour_button_full_path) .. "] component does not have such a state")
						return
					end
				else 
					script_error("ERROR: Incomplete data. Scipted tour tried to get a tooltip text when unavailable and no such text was found")
					return
				end
			else
				if start_tour_button:SetState("active") then
				start_tour_button:SetTooltipText(common.get_localised_string("random_localisation_strings_string_scripted_tour_tooltip_start"), "random_localisation_strings_string_scripted_tour_tooltip_start", true)
				else
					script_error("ERROR: SetState() called but provided [" .. tostring(self.tour_button_full_path) .. "] component does not have such a state")
					return
				end
			end
		end

		if not component_overlay.listener_started then 
			core:add_listener(
				component_overlay.name .. "tour_button_lclickup",
				"ComponentLClickUp", 
				function(context) return UIComponent(context.component) == start_tour_button end,
				function(context)  
					-- Info overlays are now disabled by the tour starting
					-- toggle_info_overlays()
					tour_ref.exec()
				end,
				true
			)
			component_overlay.listener_started = true
		end

		for k,v in pairs(self.component_overlays) do 
			if v.name == component_overlay.name then 
				return 
			end	
		end
		table.insert(self.component_overlays,component_overlay)
	end

	table.insert(self.callback_functions,cb_func)

	return
end


function get_info_overlay()
	return info_overlay:new()
end

function info_overlay:create_overlays()
	for k,v in pairs(self.data_table) do
		if v.target_uic then
			if v.is_battle and core:is_battle() then
				self:add_component_overlay(v)
			elseif core:is_campaign() then
				if v.has_scripted_tour and self.tours_table[v.target_uic[#v.target_uic]] then
					local scripted_tour_show_condition = true
					if v.scripted_tour_show_condition then
						local status, retval = pcall(v.scripted_tour_show_condition)
						scripted_tour_show_condition = status and retval or false
					end

					if not scripted_tour_show_condition then
						self:add_component_overlay(v)
					else
						self:add_component_overlay_with_tour(v, self.tours_table[v.target_uic[#v.target_uic]])
					end

				else 
					self:add_component_overlay(v)
				end
			end
		end
	end
	return
end

function info_overlay:set_data_table(data_table)
	if not is_table(data_table) then
		script_error("ERROR: info_overlay:set_data_table() called but " .. tostring(data_table) .. " is not a Table.")
		return
	end
	self.data_table = data_table
end

function info_overlay:set_tours_table(tours_table)
	if not is_table(tours_table) then
		script_error("ERROR: info_overlay:set_tours_table() called but " .. tostring(tours_table) .. " is not a Table.")
		return
	end
	self.tours_table = tours_table
end

function info_overlay:show_overlays_info(should_show)
	for _, path in pairs(self.overlays_info_path) do
		local uic = core:get_ui_root():SequentialFind(unpack(path))

		if uic then
			if should_show then
				uic:SetVisible(true)
				uic:PropagatePriority(self.overlays_info_priority)
				uic:SetText(
					string.format(
						common.get_localised_string("random_localisation_strings_string_info_overlays_toggle_info"),
						common.get_shortcut_key_string("script_F1_button_overlays")
					),
					"random_localisation_strings_string_info_overlays_toggle_info"
				)
				uic:RegisterTopMost()
			else
				uic:SetVisible(false)
				uic:RemoveTopMost()
			end
		end
	end
end

function info_overlay:update_overlays_buttons(is_selected)
	for _, data in pairs(self.buttons_data) do
		local overlays_button = core:get_ui_root():SequentialFind(unpack(data.path))

		if overlays_button then
			if is_selected then
				overlays_button:SetState("selected")
				overlays_button:PropagatePriority(self.overlays_buttons_priority)
				if data.apply_priority_lock then
					overlays_button:LockPriority()
				end
			else
				overlays_button:SetState("active")
				if data.apply_priority_lock then
					overlays_button:UnLockPriority()
				end
			end
		end
	end
end