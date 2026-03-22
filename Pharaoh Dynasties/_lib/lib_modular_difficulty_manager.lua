----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
--
--	MODULAR DIFFICULTY MANAGER
--
--- @set_environment campaign
--- @set_environment frontend
--- @class modular_difficulty_manager Modular difficulty manager
--- @desc The modular difficulty manager handles the state of the user's preferences for how they'd like their diffiuclty.
--- @desc This manager handles the UI, state and communcation around modular difficulty.
--
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------

-- definition
modular_difficulty_manager = {
	state = {
		--["setting_name"] = { 
		--	value = 0,
		--	ui = {
		--		type = "checkbox",
		--	},
		--}, 
	},
	svr_string_name = "mdm_state",
	update_trigger_event_name = "ScriptEventModularDifficultyManagerStateUpdated",
	modular_difficulty_localised_strings_table = "modular_difficulty_localised_strings",
	-- used as a flag to bypass checking if achievement is awarded, mainly for testing purposes
	skip_achievement_unlocked_checks = true,
	-- internally the options of the dropdowns are always equated to one of these, check s_dropdown_string_options in OptionsModularDifficulty.cpp
	-- The default dropdown UI component has 4 options only - None, Low, Medium, High. If you need to use different number of options or custom text, 
	--    the options should be defined using dropdown_options = {} in the modular difficulty config. Check <army_size> modular difficulty for example. 
	dropdown_string_options = {
		"None",
		"Low",
		"Medium",
		"High",
		"Option4",
		"Option5",
		"Option6",
		"Option7",
		"Option8",
		"Option9",
	},
	-- used to keep track if we have any options changed from their current values in state in order to activate the "apply" button at the necessary time
	temp_state = {}
}


-- set modular_difficulty_manager to be of custom type TYPE_MODULAR_DIFFICULTY_MANAGER
set_class_custom_type_and_tostring(modular_difficulty_manager, TYPE_MODULAR_DIFFICULTY_MANAGER);


__modular_difficulty_manager = nil

----------------------------------------------------------------------------
--- @section Creation
--- @desc The modular difficulty manager is automatically created when the script libraries are loaded in campaign or front-end.
----------------------------------------------------------------------------

--- @function new
--- @desc Creates and returns a modular difficulty manager. If one has already been created it returns the existing modular difficulty manager.
--- @return modular_difficulty_manager modular difficulty manager
function modular_difficulty_manager:new()
	
	-- see if a modular difficulty manager has already been created, if yes - return it 
	if __modular_difficulty_manager then
		return __modular_difficulty_manager
	end

	-- time to set up the object
	local _mdm = {}
	
	-- set '_mdm' to derive from self ('modular_difficulty_manager')
	set_object_class(_mdm, self);

	_mdm.state = self.state

	__modular_difficulty_manager = _mdm
	
	return _mdm
end

----------------------------------------------------------------------------
--- @section State
--- @desc The modular difficulty manager contains a state of the user's desired settings.
--- @desc The manager supports saving and loading the state on demand.
----------------------------------------------------------------------------

-- internal function, this is more or less a copy of cm:process_table_save
function modular_difficulty_manager:process_table_save(tab, _savestring)
	local savestring = _savestring or "";
	local key, val = next(tab, nil);

	while key do	
		if type(val) == "table" then
			if type(key) == "string" then
				savestring = savestring.."[\""..key.."\"]={";
			else
				savestring = savestring.."["..key.."]={";
			end

			savestring = self:process_table_save(val, savestring);
			savestring = savestring.."},";
		elseif type(val) ~= "function" then
			local pref = "";
			
			if type(key) == "string" then
				if tab[key] == nil then
					pref = key.."=";
				else
					pref = "[\""..key.."\"]=";
				end
			elseif type(key) == "number" then
				if tab[key] == nil then
					pref = key.."=";
				else
					pref = "["..key.."]=";
				end
			end
			
			if type(val) == "string" then
				savestring = savestring..pref.."\""..val.."\",";
			else
				savestring = savestring..pref..tostring(val)..",";
			end
		end

		key, val = next(tab, key);
	end
	return savestring;
end

--- @function save_state_to_svr
--- @desc Serializes and saves the modular difficulty manager state to the svr.
function modular_difficulty_manager:save_state_to_svr()
	local state_table_as_string = "return {" .. self:process_table_save(self.state) .. "}"
	core:svr_save_string(self.svr_string_name,state_table_as_string)
end

--- @function load_state_from_svr
--- @desc Loads a previously saved state from the svr.
function modular_difficulty_manager:load_state_from_svr()
	local state_table_as_string = core:svr_load_string(self.svr_string_name)
	if state_table_as_string then
		local table_func = loadstring(state_table_as_string)
		if is_function(table_func) then
			local loaded_state = table_func()
			self.state = loaded_state
		end
	else
		script_error("modular_difficulty_manager:load_state_from_svr() called, but no saved state was found in the svr")
	end
end

function modular_difficulty_manager:update_state_from_ui()
	local panel = core:get_or_create_component(modular_difficulty_campaign.ui_panel.name, modular_difficulty_campaign.ui_panel.layout_path)

	for setting_name, setting_data in pairs(modular_difficulty_campaign.settings) do 
		if (self.state[setting_name] ~= nil and setting_data.ui ~= nil) then
			local setting_component = panel:SequentialFind(setting_name)
			if (setting_component) then
				local dropdown_first_option_idx = 0
				if setting_data.ui.component_type == modular_difficulty_campaign.ui_panel.settings_component_types.dropdown then
					if setting_data.ui.dropdown_first_option_idx then
						dropdown_first_option_idx = setting_data.ui.dropdown_first_option_idx
					end
				end

				local setting_value_from_component = panel:InterfaceFunction("get_value_for_component", setting_name, dropdown_first_option_idx)
				self.state[setting_name].value = setting_value_from_component
			end
		end
	end

	core:trigger_event(self.update_trigger_event_name)
	self:save_state_to_svr()
end

--- @function modular_difficulty_manager.modify_setting
--- @desc Changes the specified modular difficulty setting
--- @p @string setting_name, Name of the modular difficulty setting
--- @p @any new_value, The new value of the setting
--- @p [opt=true] @boolean apply_changes, Whether to apply the changes immediately or just update the value. Set this to false if you are updating several settings at once and set it to true for the last one
function modular_difficulty_manager:modify_setting(setting_name, new_value, apply_changes)
	apply_changes = apply_changes ~= false

	if self.state[setting_name] ~= nil and self.state[setting_name].value ~= new_value then
		self.state[setting_name].value = new_value
	end

	if apply_changes then
		core:trigger_event(self.update_trigger_event_name)
		self:save_state_to_svr()
	end
end

function modular_difficulty_manager:update_ui_from_state()
	local panel = core:get_or_create_component(modular_difficulty_campaign.ui_panel.name, modular_difficulty_campaign.ui_panel.layout_path)

	for setting_name, setting_data in pairs(modular_difficulty_campaign.settings) do 
 		if (self.state[setting_name] ~= nil and setting_data.ui ~= nil) then
			local setting_component = panel:SequentialFind(setting_name)
			if (setting_component) then
				local dropdown_first_option_idx = 0
				if setting_data.ui.component_type == modular_difficulty_campaign.ui_panel.settings_component_types.dropdown then
					if setting_data.ui.dropdown_first_option_idx then
						dropdown_first_option_idx = setting_data.ui.dropdown_first_option_idx
					end
				end
				panel:InterfaceFunction("set_value_for_component", self.state[setting_name].value, setting_name, dropdown_first_option_idx)
			end
		end
	end

end

function modular_difficulty_manager:add_listeners()
	core:add_listener(
		"mdm_update_state_from_ui_event_on_ContextTriggerEvent",
		"ContextTriggerEvent", 
		function(context)
			return context.string == "ScriptModularDifficultyStateUpdate"
		end,
		function(context)
			self:update_state_from_ui()
		end, 
		true
	)

	-- this event is used if we are updating the panel inside of a campaign
	core:add_listener(
		"mdm_update_state_from_ui_event_on_UITriggerScriptEvent",
		"UITriggerScriptEvent", 
		function(context)
			return context:trigger() == "ScriptModularDifficultyStateUpdate"
		end,
		function(context)
			self:update_state_from_ui()
		end, 
		true
	)

	core:add_listener (
		"mdm_panel_opened_frontend",
		"ContextTriggerEvent",
		function(context) 
			return context.string == "ScriptModularDifficultyPanelOpenedFrontend"
		end,
		function(context)
			local panel = core:get_or_create_component(modular_difficulty_campaign.ui_panel.name, modular_difficulty_campaign.ui_panel.layout_path)
			local is_from_frontend = true
			self.temp_state = table_deep_copy(self.state)

			self:init_ui_components()
			self:update_ui_from_state()
			self:reset_settings_to_default_state()
			-- self:update_icon_states({}, is_from_frontend)

			local modified_settings = self:get_modified_settings_against_default_values(self.state)
			self:mark_modified_settings(modified_settings)
			self:update_component_states(is_from_frontend)
			panel:SetProperty("script_setting_modified", "0")
		end,
		true
	)

	core:add_listener(
		"mdm_panel_opened_campaign",
		"ContextTriggerEvent", 
		function(context)
			return context.string == "ScriptModularDifficultyPanelOpenedCampaign"
		end,
		function(context)
			local panel = core:get_or_create_component(modular_difficulty_campaign.ui_panel.name, modular_difficulty_campaign.ui_panel.layout_path)
			self.temp_state = table_deep_copy(self.state)

			self:init_ui_components()
			self:update_ui_from_state()
			self:reset_settings_to_default_state()
			-- self:update_icon_states()

			local modified_settings = self:get_modified_settings_against_default_values(self.state)
			self:mark_modified_settings(modified_settings)
			self:update_component_states()
			panel:SetProperty("script_setting_modified", "0")
		end, 
		true
	)

	core:add_listener(
		"mdm_preset_save",
		"ContextTriggerEvent",
		function(context)
			return context.string == "ScriptModularDifficultyPresetSave"
		end,
		function(context)
			local panel = core:get_or_create_component(modular_difficulty_campaign.ui_panel.name, modular_difficulty_campaign.ui_panel.layout_path)
			self:update_state_from_ui()
			
			local state_to_string = "return {" .. self:process_table_save(self.state) .. "}"
			panel:InterfaceFunction("write_modular_difficulty_state_to_file", state_to_string)
			self:reset_settings_to_default_state()
			panel:SetProperty("script_setting_modified", "0")

			local modified_settings = self:get_modified_settings_against_default_values(self.state)
			self:mark_modified_settings(modified_settings)
			self:update_apply_button_state()
		end,
		true
	)

	core:add_listener(
		"mdm_preset_load",
		"ContextTriggerEvent",
		function(context)
			return string.find(context.string, "ScriptModularDifficultyPresetLoad")
		end,
		function(context)
			local split_string = string.split(context.string, ":")
			local state_read = split_string[2]
			if (state_read == "") then
				return
			end

			-- we only can load/save presets before campaign start
			local is_from_frontend = true
			local table_func = loadstring(state_read)
			if is_function(table_func) then
				local state_table = table_func()
				self:fill_missing_settings_from_loaded_settings(state_table)
				local modified_settings = self:get_modified_settings_against_default_values(state_table)

				self:set_state(state_table)
				self:update_ui_from_state()
				-- self:update_icon_states(modified_settings, is_from_frontend)
				self:update_component_states(is_from_frontend)
				self:reset_settings_to_default_state()
				self:mark_modified_settings(modified_settings)

				local panel = core:get_or_create_component(modular_difficulty_campaign.ui_panel.name, modular_difficulty_campaign.ui_panel.layout_path)
				panel:SetProperty("script_setting_modified", "0")
				self:update_apply_button_state()
			end
		end,
		true
	)

	-- here we listen for any changes in the dynamically created options of the panel so we can set the state of that option to "modified" and set the apply button to "active"
	core:add_listener(
		"option_changed_listener", 
		"ComponentLClickUp",
		function(context)
			return UIComponent(context.component):FindParentCallbacks("InfoInvokerCallback") ~= nil and
				(string.find(UIComponent(context.component):Id(), "option") or UIComponent(context.component):Id() == "checkbox_menu")
		end,
		function(context)
			local info_invoker_component = UIComponent(context.component):FindParentCallbacks("InfoInvokerCallback")
			if self.state[UIComponent(info_invoker_component):Id()] == nil then
				return
			end

			-- no need to do anything when we're just clicking on the dropdown component itself (to display the options), we only care about when we've clicked on one of the dropdown's options which is handled below
			if string.find(UIComponent(context.component):Id(), "dropdown_menu") then
				return
			end

			local panel = core:get_or_create_component(modular_difficulty_campaign.ui_panel.name, modular_difficulty_campaign.ui_panel.layout_path)

			local setting_data = modular_difficulty_campaign.settings[UIComponent(info_invoker_component):Id()]
			local dropdown_first_option_idx = 0
			if setting_data.ui.component_type == modular_difficulty_campaign.ui_panel.settings_component_types.dropdown then
				if setting_data.ui.dropdown_first_option_idx then
					dropdown_first_option_idx = setting_data.ui.dropdown_first_option_idx
				end
			end

			local setting_value_from_component = panel:InterfaceFunction("get_value_for_component", UIComponent(info_invoker_component):Id(), dropdown_first_option_idx)
			local setting_value_from_state = self.state[UIComponent(info_invoker_component):Id()].value

			-- if we've pressed one of the dropdown options (which are always named "option1", "option2" etc.) we check if it's different than what we currently have selected for that setting
			-- we need to check this way for dropdowns since this listener will trigger before the value for the dropdown is actually updated
			if string.find(UIComponent(context.component):Id(), "option") then
				-- this will give us the index of the dropdown option being clicked
				local split_string = string.split(context.string, "option")
				-- we do +1 because lua indexing starts from 1, 
				local option_clicked_index = split_string[2] + 1 + dropdown_first_option_idx
				-- in the case when we've clicked on a dropdown we set the setting_value_from_component to be the option we've clicked on
				setting_value_from_component = modular_difficulty_manager.dropdown_string_options[option_clicked_index]
			end
			
			self.temp_state[UIComponent(info_invoker_component):Id()].value = setting_value_from_component
			local modified_settings = self:get_modified_settings_against_current_values(self.temp_state)
			local script_setting_modified = table.is_empty(modified_settings) and "0" or "1"
			panel:SetProperty("script_setting_modified", script_setting_modified)
			
			self:update_apply_button_state()

			local is_setting_modified = setting_value_from_component ~= modular_difficulty_campaign.settings[UIComponent(info_invoker_component):Id()].default_value
			UIComponent(info_invoker_component):SetState(is_setting_modified and "modified" or "default")
		end, 
		true
	)

	-- if we've clicked on the "ironman" checkbox we update the env var immediately since that restricts other settings from being changed (currently battle realism mode and incremental auto-saves)
	core:add_listener(
		"ironman_changed_listener", 
		"ComponentLClickUp",
		function(context)
			local info_invoker_component = UIComponent(context.component):FindParentCallbacks("InfoInvokerCallback")
			return info_invoker_component ~= nil and UIComponent(info_invoker_component):Id() == "ironman"
		end,
		function(context)
			local info_invoker_component = UIComponent(context.component):FindParentCallbacks("InfoInvokerCallback")
			if self.state[UIComponent(info_invoker_component):Id()] == nil then
				return
			end

			local panel = core:get_or_create_component(modular_difficulty_campaign.ui_panel.name, modular_difficulty_campaign.ui_panel.layout_path)
			local setting_data = modular_difficulty_campaign.settings[UIComponent(info_invoker_component):Id()]
			local dropdown_first_option_idx = 0
			if setting_data.ui.component_type == modular_difficulty_campaign.ui_panel.settings_component_types.dropdown then
				if setting_data.ui.dropdown_first_option_idx then
					dropdown_first_option_idx = setting_data.ui.dropdown_first_option_idx
				end
			end
			local setting_value_from_component = panel:InterfaceFunction("get_value_for_component", UIComponent(info_invoker_component):Id(), dropdown_first_option_idx)

			core:cache_and_set_boolean_preference("ironman_modular_difficulty_enabled", setting_value_from_component == 1)
			panel:InterfaceFunction("update_restricted_settings")
		end,
		true
	)

	core:add_listener(
		"mdm_reset_settings_to_default_value_frontend",
		"ContextTriggerEvent", 
		function(context)
			return context.string == "ScriptModularDifficultyResetSettingsToDefaultValueFrontend"
		end,
		function(context)
			local is_from_frontend = true
			self:reset_settings_to_default_value(is_from_frontend)
		end, 
		true
	)

	-- this event is used if we are resetting the settings from inside of a campaign
	core:add_listener(
		"mdm_reset_settings_to_default_value_campaign",
		"ContextTriggerEvent", 
		function(context)
			return context.string == "ScriptModularDifficultyResetSettingsToDefaultValue"
		end,
		function(context)
			self:reset_settings_to_default_value()
			-- if we are resetting state from inside of campaign pre-campaign only settings should still get marked as modified since they cannot be changed once campaign has started and their value will not be reset
			local modified_settings = self:get_modified_settings_against_default_values(self.state)
			self:mark_modified_settings(modified_settings)
		end, 
		true
	)

	-- Triggers Scripted Tour for Campaign Customization
	core:add_listener(
		"scripted_tour_campaign_customization_launch",
		"ComponentLClickUp", 
		function(context) 		
			local uic_button_tour = core:is_ui_created() and core:get_ui_root():SequentialFind("modular_difficulty_panel", modular_difficulty_campaign.ui_panel.tutorial_button);
			return uic_button_tour and UIComponent(context.component) == uic_button_tour 
		end,
		function(context)  
			_scripted_tours.button_tutorial.exec()
		end,
		true
	)
end

function modular_difficulty_manager:set_state(new_state)
	self.state = new_state
	core:trigger_event(self.update_trigger_event_name)
	self:save_state_to_svr()
end

function modular_difficulty_manager:create_setting_component_from_template(setting_name, setting_data, list_component)
	local entry_template
	local panel = core:get_or_create_component(modular_difficulty_campaign.ui_panel.name, modular_difficulty_campaign.ui_panel.layout_path)
	local should_set_custom_dropdown_options = false

	if (setting_data.ui.component_type == modular_difficulty_campaign.ui_panel.settings_component_types.dropdown) then
		entry_template = modular_difficulty_campaign.ui_panel.templates.dropdown.component
		if is_table(setting_data.ui.dropdown_options) and not table.is_empty(setting_data.ui.dropdown_options) then
			should_set_custom_dropdown_options = true
		end
	elseif (setting_data.ui.component_type == modular_difficulty_campaign.ui_panel.settings_component_types.checkbox) then
		entry_template = modular_difficulty_campaign.ui_panel.templates.checkbox.component
	elseif (setting_data.ui.component_type == modular_difficulty_campaign.ui_panel.settings_component_types.slider) then
		entry_template = modular_difficulty_campaign.ui_panel.templates.slider.component
	end

	if (entry_template) then
		local entry = UIComponent(list_component:CreateFromComponent(entry_template:Address(), setting_name))
		local localised_string_key = self.modular_difficulty_localised_strings_table .. "_string_" .. setting_name
		UIComponent(entry:Find("label_txt")):SetText(common.get_localised_string(localised_string_key))
		entry:SetCallbackUserProperty("InfoInvokerCallback", "option_name", setting_name)
		entry:SetVisible(true)
		if should_set_custom_dropdown_options then
			panel:InterfaceFunction("set_options_for_dropdown", setting_data.ui.dropdown_options, setting_name)
		end
	end
end

function modular_difficulty_manager:init_template_components()
	local panel = core:get_or_create_component(modular_difficulty_campaign.ui_panel.name, modular_difficulty_campaign.ui_panel.layout_path)

	for name,data in pairs(modular_difficulty_campaign.ui_panel.templates) do
		local template_component = panel:SequentialFind(data.component_name)
		if template_component then
			template_component:DivorceFromParent()
			data.component = template_component
		end
	end
end

function modular_difficulty_manager:destroy_template_components()
	for _,data in pairs(modular_difficulty_campaign.ui_panel.templates) do
		if (data.component) then
			data.component:Destroy()
			data.component = nil
		end
	end
end

function modular_difficulty_manager:init_ui_components()
	local panel = core:get_or_create_component(modular_difficulty_campaign.ui_panel.name, modular_difficulty_campaign.ui_panel.layout_path)
	local campaign_tab_component = panel:SequentialFind("panel_campaign")
	local battle_tab_component = panel:SequentialFind("panel_battle")
	local ai_tab_component = panel:SequentialFind("panel_ai")

	local template_achievement = panel:SequentialFind("template_achievement")
	if template_achievement and not self.skip_achievement_unlocked_checks then
		template_achievement:SetProperty("show_achievement_info", "true")
	end

	self:init_template_components()

	local ui_ordered_settings = {}
	for setting_name, setting_data in pairs(modular_difficulty_campaign.settings) do
		if setting_data.ui and setting_data.ui.ui_order then
			table.insert(ui_ordered_settings, {name = setting_name, order = setting_data.ui.ui_order})
		end
	end

	table.sort(ui_ordered_settings, function(lhs, rhs) return lhs.order < rhs.order end)
	
	for _, setting in ipairs(ui_ordered_settings) do
		local setting_name = setting.name
		local setting_data = modular_difficulty_campaign.settings[setting_name]
		if (setting_data.ui) then
			if (campaign_tab_component and setting_data.ui.category == modular_difficulty_campaign.ui_panel.settings_category_tabs.campaign) then

				local list_component = nil
				if setting_data.ui.component_parent then
					local list_component_parent = campaign_tab_component:SequentialFind("pre_campaign_parent", setting_data.ui.component_parent)
					list_component = list_component_parent:SequentialFind(setting_data.ui.component_parent, modular_difficulty_campaign.ui_panel.list_component_name)
				else
					list_component = campaign_tab_component:SequentialFind("pre_campaign_parent", modular_difficulty_campaign.ui_panel.list_component_name)
				end

				if (setting_data.ui.campaign_changeable) then
					list_component = campaign_tab_component:SequentialFind("during_campaign_parent", modular_difficulty_campaign.ui_panel.list_component_name)
				end
				self:create_setting_component_from_template(setting_name, setting_data, list_component)
			elseif (battle_tab_component and setting_data.ui.category == modular_difficulty_campaign.ui_panel.settings_category_tabs.battle) then
				local list_component = battle_tab_component:SequentialFind("pre_campaign_parent", modular_difficulty_campaign.ui_panel.list_component_name)
				if (setting_data.ui.campaign_changeable) then
					list_component = battle_tab_component:SequentialFind("during_campaign_parent", modular_difficulty_campaign.ui_panel.list_component_name)
				end
				self:create_setting_component_from_template(setting_name, setting_data, list_component)
			elseif (ai_tab_component and setting_data.ui.category == modular_difficulty_campaign.ui_panel.settings_category_tabs.ai) then
				local list_component = ai_tab_component:SequentialFind("pre_campaign_parent", modular_difficulty_campaign.ui_panel.list_component_name)
				if (setting_data.ui.campaign_changeable) then
					list_component = ai_tab_component:SequentialFind("during_campaign_parent", modular_difficulty_campaign.ui_panel.list_component_name)
				end
				self:create_setting_component_from_template(setting_name, setting_data, list_component)
			end
		end
	end

	self:destroy_template_components()
end

function modular_difficulty_manager:update_component_states(is_from_frontend)
	local is_from_frontend = not not is_from_frontend
	local panel = core:get_or_create_component(modular_difficulty_campaign.ui_panel.name, modular_difficulty_campaign.ui_panel.layout_path)

	for setting_name, setting_data in pairs(modular_difficulty_campaign.settings) do 
		local setting_component = panel:SequentialFind(setting_name)
		if (setting_component) then
			local locked_by_achievement = not self.skip_achievement_unlocked_checks and setting_data.is_locked
			if (setting_data.ui and ((not setting_data.ui.campaign_changeable and not is_from_frontend) or locked_by_achievement)) then
				local menu_component = nil
				if (setting_data.ui.component_type == modular_difficulty_campaign.ui_panel.settings_component_types.dropdown) then
					menu_component = setting_component:Find("dropdown_menu")
					UIComponent(menu_component):SetState("selected_inactive")
				elseif (setting_data.ui.component_type == modular_difficulty_campaign.ui_panel.settings_component_types.checkbox) then
					menu_component = setting_component:Find("checkbox_menu")
					local state_name = "inactive"
					if (self.state[setting_name] and self.state[setting_name].value == 1) then
						state_name = "selected_inactive"
					end
					UIComponent(menu_component):SetState(state_name)
				else
					menu_component = setting_component:Find("hslider_menu")
					UIComponent(menu_component):SetState("inactive")
				end
				UIComponent(setting_component:Find("label_txt")):SetState("inactive")
			end
		end
	end
end

-- function modular_difficulty_manager:update_icon_states(modified_settings, is_from_frontend)
-- 	local modified_settings = modified_settings or {}
-- 	local is_from_frontend = not not is_from_frontend
-- 	local panel = core:get_or_create_component(modular_difficulty_campaign.ui_panel.name, modular_difficulty_campaign.ui_panel.layout_path)

-- 	for setting_name, setting_data in pairs(modular_difficulty_campaign.settings) do 
-- 		local setting_component = panel:Find(setting_name)
-- 		if (setting_component) then
-- 			local icons_state_component = UIComponent(setting_component):Find("icons_state")
-- 			if (icons_state_component) then
-- 				UIComponent(icons_state_component):SetState("default")
-- 			end

-- 			-- this check makes sure we don't update the states of pre-campaign-only settings inside of campaign
-- 			if (is_from_frontend or setting_data.ui.campaign_changeable) then
-- 				local achievement_key_for_setting = setting_data.achievement_key
-- 				if ((not self.skip_achievement_unlocked_checks) and achievement_key_for_setting and achievement_key_for_setting ~= "") then
-- 					if (common.is_achievement_awarded(achievement_key_for_setting)) then
-- 						setting_data.is_locked = false
-- 						if (setting_data.was_previously_locked) then
-- 							setting_data.was_previously_locked = false
-- 							UIComponent(icons_state_component):SetState("unlocked")
-- 						end
-- 					else
-- 						setting_data.is_locked = true
-- 						setting_data.was_previously_locked = true
-- 						UIComponent(icons_state_component):SetState("locked")
-- 					end
-- 				end

-- 				if ((not table.is_empty(modified_settings) and modified_settings[setting_name])) then
-- 					UIComponent(icons_state_component):SetState("modified")
-- 				end
-- 			end
-- 		end
-- 	end
-- end

function modular_difficulty_manager:get_modified_settings_against_current_values(new_state)
	local modified_settings = {}
	for setting_name, setting_data in pairs(modular_difficulty_campaign.settings) do
		if self.state[setting_name].value ~= new_state[setting_name].value then
			modified_settings[setting_name] = setting_data
		end
	end
	return modified_settings
end


function modular_difficulty_manager:get_modified_settings_against_default_values(new_state)
	local modified_settings = {}
	for setting_name, setting_data in pairs(modular_difficulty_campaign.settings) do
		if setting_data.default_value ~= new_state[setting_name].value then
			modified_settings[setting_name] = setting_data
		end
	end
	return modified_settings
end

function modular_difficulty_manager:mark_modified_settings(modified_settings)
	local modified_settings = modified_settings or {}
	local panel = core:get_or_create_component(modular_difficulty_campaign.ui_panel.name, modular_difficulty_campaign.ui_panel.layout_path)

	for setting_name, setting_data in pairs(modular_difficulty_campaign.settings) do 
		local setting_component = panel:Find(setting_name)
		if (setting_component) then
			if ((not table.is_empty(modified_settings) and modified_settings[setting_name])) then
				UIComponent(setting_component):SetState("modified")
			end
		end
	end
end

function modular_difficulty_manager:reset_settings_to_default_state()
	local panel = core:get_or_create_component(modular_difficulty_campaign.ui_panel.name, modular_difficulty_campaign.ui_panel.layout_path)
	for setting_name, setting_data in pairs(modular_difficulty_campaign.settings) do 
		local setting_component = panel:Find(setting_name)
		if (setting_component) then
			UIComponent(setting_component):SetState("default")
		end
	end
end

function modular_difficulty_manager:fill_missing_settings_from_loaded_settings(settings)
	for setting_name, setting_data in pairs(modular_difficulty_campaign.settings) do
		if not is_table(settings[setting_name]) then
			settings[setting_name] = { value = setting_data.default_value }
		end
	end
end

function modular_difficulty_manager:reset_settings_to_default_value(is_from_frontend)
	local panel = core:get_or_create_component(modular_difficulty_campaign.ui_panel.name, modular_difficulty_campaign.ui_panel.layout_path)
	local is_from_frontend = not not is_from_frontend
	for setting_name, setting_data in pairs(modular_difficulty_campaign.settings) do
		local is_setting_pre_campaign_only = not setting_data.ui.campaign_changeable and not is_from_frontend
		if not is_setting_pre_campaign_only then
			self.state[setting_name].value = setting_data.default_value
		end
	end
	self:update_ui_from_state()
	self:reset_settings_to_default_state()
	self:update_component_states(is_from_frontend)
	panel:SetProperty("script_setting_modified", "0")
	self:update_apply_button_state()

	--after updating state we actually update all the settings to use the default value
	core:trigger_event(self.update_trigger_event_name)
	self:save_state_to_svr()
end
function modular_difficulty_manager:apply_campaign_difficulty_preset(selected_preset)
	for setting, preset_value in pairs(selected_preset) do 
		if mdm.state[setting] then 
			mdm.state[setting].value = preset_value
			if setting == "ironman" then
				core:cache_and_set_boolean_preference("ironman_modular_difficulty_enabled", preset_value ~= 0)
			end
		end
	end
	core:trigger_event(mdm.update_trigger_event_name)
	mdm:save_state_to_svr()
end
function modular_difficulty_manager:update_apply_button_state()
	local panel = core:get_or_create_component(modular_difficulty_campaign.ui_panel.name, modular_difficulty_campaign.ui_panel.layout_path)
	local layout_setting_modified = panel:GetProperty("layout_setting_modified") == "1"
	local script_setting_modified = panel:GetProperty("script_setting_modified") == "1"

	if layout_setting_modified or script_setting_modified then
		UIComponent(panel:Find(modular_difficulty_campaign.ui_panel.apply_button)):SetState("active")
	else
		UIComponent(panel:Find(modular_difficulty_campaign.ui_panel.apply_button)):SetState("inactive")
	end
end