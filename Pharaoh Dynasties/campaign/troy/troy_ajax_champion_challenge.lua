out("Loading troy_ajax_champion_challenge.lua")

local DEBUG = true
local debug_preff = "AJAX CHAMPION CHALLENGE: "

local function output(str, force_out)
	if DEBUG or force_out then
		out(debug_preff..(str or "nil"))
	end
end

require("troy_ajax_champion_challenge_config")

-------------------------------------------------------------------------------------------------------------------------------------------
-- FM scripting
-------------------------------------------------------------------------------------------------------------------------------------------
-- visible in UI to challenge champion_faction_name list - [champion_faction_name = true]
_ajax_challenge_available_champions = {}

-- visible on map, alive, challenged champion_faction_name list - [champion_faction_name = force CQI]
_ajax_challenge_challenged_champions = {}

-- defeated, visible on special recruitment pool list - [main unit record = champion_faction_name]
_ajax_challenge_recruitment_pool_champions = {}

-- visible on map, alive, recruited list - [main unit record = champion_faction_name]
_ajax_challenge_recruited_champions = {}

-- recruited, dead, awaiting 'n' turns to enter recruitment pool again - [champion_faction_name = 'n']
_ajax_challenge_awaitng_pool_champions = {}

-- global table populated only by the champion faction name to be referenced by other scripts
_ajax_defeated_champions_global = {}

-- global table populated by the turn a champion (by unit record key) was defeated to be referenced by other scripts
_ajax_defeated_champions_turns_global = {}

-- UI, get_local_faction - update the region info bars
function ajax_challenge_update_city_infobar(champion_faction_name, visible)
	if cm:get_local_faction_name(true) ~= ajax_challenge_cofiguration.faction_name then return end

	local champ = _ajax_challenge_existing_champions[champion_faction_name]
	if not champ or not is_table(champ) then return end

	cm:set_custom_settlement_info_icon(champ.spawn_settlement_name, "icon_adi_champion", ajax_challenge_cofiguration.settlement_icon_path, ajax_challenge_cofiguration.settlement_icon_tooltip_key)

	if not visible then
		cm:set_custom_settlement_info_icon_visibility(champ.spawn_settlement_name, "icon_adi_champion", false)
	end

	CampaignUI.UpdateSettlementEffectIcons()
end


function ajax_add_champion_to_recruitment_pool(champion_faction_name)
	output("add_champion_to_recruitment_pool: "..champion_faction_name)

	local champion_data = is_table(_ajax_challenge_existing_champions) and is_table(_ajax_challenge_existing_champions[champion_faction_name]) and _ajax_challenge_existing_champions[champion_faction_name]
	if not is_table(champion_data) then
		return
	end

	_ajax_challenge_recruitment_pool_champions[champion_data.reward_main_unit_record] = champion_faction_name

	if is_table(_ajax_challenge_available_champions) and _ajax_challenge_available_champions[champion_faction_name] then
		_ajax_challenge_available_champions[champion_faction_name] = nil
	end
	if is_table(_ajax_challenge_challenged_champions) and _ajax_challenge_challenged_champions[champion_faction_name] then
		_ajax_challenge_challenged_champions[champion_faction_name] = nil
	end
	if is_table(_ajax_challenge_recruited_champions) and _ajax_challenge_recruited_champions[champion_data.reward_main_unit_record] then
		_ajax_challenge_recruited_champions[champion_data.reward_main_unit_record] = nil
	end
	if is_table(_ajax_challenge_awaitng_pool_champions) and _ajax_challenge_awaitng_pool_champions[champion_faction_name] then
		_ajax_challenge_awaitng_pool_champions[champion_faction_name] = nil
	end

	local custom_unit = cm:create_custom_unit_from_key(champion_data.reward_main_unit_record, false)
	if custom_unit:is_null_interface() then
		output("Failed to create custom unit for " .. champion_data.reward_main_unit_record .. " key")
		return
	end
	
	custom_unit:add_mercenary_recruit_data(
		1, -- count
		0, -- replenish
		1, -- max_count
		0, -- max_replenish
		0, -- experience
		"", -- FACTION_RECORD faction_restricted_record
		"", -- SUBCULTURE_RECORD subculture_restricted_record
		"" -- TECHNOLOGY_RECORD tech_restricted_recor
	)
	custom_unit:set_champion_flag()


	cm:add_custom_unit_to_faction_mercenary_pool(
		ajax_challenge_cofiguration.faction_name,
		custom_unit
	)
	core:trigger_event("ScriptEventAjaxChampionAddedToMercenaryPool")
end

function ajax_challenge_payment(champion_faction_name, check_only)
	local champion_data = is_table(_ajax_challenge_existing_champions) and is_table(_ajax_challenge_existing_champions[champion_faction_name]) and is_table(_ajax_challenge_existing_champions[champion_faction_name].challenge_cost) and _ajax_challenge_existing_champions[champion_faction_name]
	if not is_table(champion_data) then
		return false
	end

	local ajax_faction = cm:get_faction(ajax_challenge_cofiguration.faction_name)

	local renown_res = ajax_faction:pooled_resource(ajax_challenge_cofiguration.renown_key)
	local renown_amount = renown_res and not renown_res:is_null_interface() and renown_res:value() or 0

	local has_renown = _ajax_challenge_existing_champions[champion_faction_name].demanding_renown <= renown_amount
	
	local has_resources = true
	for _,cost in ipairs(champion_data.challenge_cost) do
		if cost.amount > 0 then
			local res_amount = ajax_faction:pooled_resource(cost.key):value()
			has_resources = cost.amount <= res_amount
			if not has_resources then
				break
			end
		end
	end

	if has_resources and not check_only then
		for _,cost in ipairs(champion_data.challenge_cost) do
			if cost.amount > 0 then
				cm:faction_add_pooled_resource(ajax_challenge_cofiguration.faction_name, cost.key, "troy_resource_factor_faction", -cost.amount)
			end
		end

		-- renown should not be subtracted from pool
		--cm:faction_add_pooled_resource(ajax_challenge_cofiguration.faction_name, ajax_challenge_cofiguration.renown_key, "troy_resource_factor_faction", -_ajax_challenge_existing_champions[champion_faction_name].demanding_renown)
	end

	return has_resources, has_renown
end


function ajax_challenge_spawn_champion(champion_faction_name)
	output("challenge_spawn_champion "..champion_faction_name)

	if not is_string(champion_faction_name) or champion_faction_name == "" then
		return
	end

	local champion_data = is_table(_ajax_challenge_existing_champions) and is_table(_ajax_challenge_existing_champions[champion_faction_name]) and _ajax_challenge_existing_champions[champion_faction_name]

	if not is_table(champion_data) then
		return
	end

	-- make resource payment
	local has_resources, has_renown = ajax_challenge_payment(champion_faction_name, true)
	if not has_resources or not has_renown then
		return
	end

	ajax_challenge_payment(champion_faction_name)

	-- making sure the spawning location is viable
	local safe_x, safe_y = cm:find_valid_spawn_location_for_character_from_position(
		champion_faction_name,
		champion_data.spawn_pos.x,
		champion_data.spawn_pos.y,
		true
	)

	-- spawn challenged champion army
	cm:spawn_rogue_army(champion_faction_name, safe_x, safe_y)

	-- make ajax faction to be the only enemy of all champion factions
	cm:force_declare_war(ajax_challenge_cofiguration.faction_name, champion_faction_name, false , false, true)
	cm:force_diplomacy("all", "faction:"..champion_faction_name, "all", false, false, true, true)

	-- make zero agent success vs champion faction armies
	cm:apply_effect_bundle(ajax_challenge_cofiguration.champion_faction_bundle_zero_agent_success, champion_faction_name, ajax_challenge_cofiguration.champion_faction_bundle_zero_agent_success_turns)

	local champion
	local champion_cqi
	local champion_force
	local champion_lookup_string = ""

	local forces = cm:get_faction(champion_faction_name):military_force_list()
	if forces and forces:num_items() > 0 then
		champion_force = forces:item_at(forces:num_items() - 1)
		if champion_force then
			champion = champion_force:general_character()
			champion_cqi = champion:command_queue_index()
			champion_lookup_string = "faction:"..champion_faction_name..",cqi:"..tostring(champion_cqi)
		end
	end
			   
	-- force created !!!
	_ajax_challenge_available_champions[champion_faction_name] = nil
	_ajax_challenge_challenged_champions[champion_faction_name] = champion_cqi

	-- champion is immortal and immovable
	if champion_lookup_string ~= "" then
		cm:cai_disable_movement_for_character(champion_lookup_string)
		cm:set_character_immortality(champion_lookup_string, true)
		cm:set_force_has_retreated_this_turn(champion_lookup_string)
	end

	-- champion level & skills setup
	if is_table(champion_data.spawn_skills) or is_number(champion_data.spawn_level) and champion_lookup_string ~= "" then
		-- level
		if is_number(champion_data.spawn_level) then
			local level = math.clamp(champion_data.spawn_level, 1, #cm.character_xp_per_level)
			local xp = champion_force:general_character():experience_required_for_rank(level)
			if xp > 0 then
				cm:add_agent_experience(champion_lookup_string, xp);
			end
		end
		
		-- skills
		if is_table(champion_data.spawn_skills) then
			for _,skill_id in ipairs(champion_data.spawn_skills) do
				cm:force_add_skill(champion_lookup_string, skill_id, true, true)
			end
		end
	end

	-- show champion spawned event
	if ajax_challenge_cofiguration.champion_spawned_event_index > 0 then
		cm:show_message_event(
			ajax_challenge_cofiguration.faction_name,
			ajax_challenge_cofiguration.champion_spawned_event_title, 
			ajax_challenge_cofiguration.champion_spawned_event_descr, 
			"event_feed_strings_text_troy_event_feed_string_all_null",
			true, 
			ajax_challenge_cofiguration.champion_spawned_event_index,
			nil, 
			nil, 
			true)
	end

	cm:make_region_visible_in_shroud(ajax_challenge_cofiguration.faction_name, champion_data.spawn_settlement_name)

	-- UI, get_local_faction - if we are the Ajax faction zoom to champion
	if cm:get_local_faction_name(true) == ajax_challenge_cofiguration.faction_name then
		local panel = core:get_ui_root():SequentialFind(ajax_challenge_cofiguration.fm_panel)
		if panel and panel:Visible() then
			panel:InterfaceFunction("zoom_to_character", champion_cqi)
			--panel:InterfaceFunction("close_panel")
		end

		panel = core:get_ui_root():SequentialFind(ajax_challenge_cofiguration.settlement_panel_champion)
		if panel and panel:Visible() then
			panel:InterfaceFunction("zoom_to_character", champion_cqi)
			--panel:InterfaceFunction("close_settlement_panel")
		end
	end
end

function ajax_challenge_update_visible_champions()
	output("update_visible_champions")

	for champion_faction_name,_ in pairs(_ajax_challenge_existing_champions) do
		if ajax_challenge_check_add_to_available_champions(champion_faction_name) then
			_ajax_challenge_available_champions[champion_faction_name] = true
		end
	end
end

function ajax_challenge_check_add_to_available_champions(champion_faction_name)
	-- already there check
	if is_table(_ajax_challenge_available_champions) and _ajax_challenge_available_champions[champion_faction_name] then
		return false
	end

	if is_table(_ajax_challenge_challenged_champions) and _ajax_challenge_challenged_champions[champion_faction_name] then
		return false
	end

	if is_table(_ajax_challenge_recruited_champions) then
		for _,champion_faction in pairs(_ajax_challenge_recruited_champions) do
			if champion_faction_name == champion_faction then
				return false
			end
		end
	end

	if is_table(_ajax_challenge_recruitment_pool_champions) then
		for _,champion_faction in pairs(_ajax_challenge_recruitment_pool_champions) do
			if champion_faction_name == champion_faction then
				return false
			end
		end
	end

	if is_table(_ajax_challenge_awaitng_pool_champions) and _ajax_challenge_awaitng_pool_champions[champion_faction_name] then
		return false
	end

	local region_is_seen = cm:is_region_seen_in_shroud(ajax_challenge_cofiguration.faction_name, _ajax_challenge_existing_champions[champion_faction_name].spawn_settlement_name)
	
	return region_is_seen
end

-------------------------------------------------------------------------------------------------------------------------------------------
-- UI
-------------------------------------------------------------------------------------------------------------------------------------------
function add_available_champion_to_list(champion_faction_name, panel, component_id, available_template, champions_list, component)
	local champion_component = component and component or UIComponent(champions_list:CreateFromComponent(available_template:Address(), component_id))

	-- sort properties
	champion_component:SetProperty("level", _ajax_challenge_existing_champions[champion_faction_name].spawn_level)
	champion_component:SetProperty("renown", _ajax_challenge_existing_champions[champion_faction_name].demanding_renown)

	-- location
	com = champion_component:SequentialFind("dy_location")
	if com and _ajax_challenge_existing_champions[champion_faction_name].spawn_settlement_name then
		local loc_key = "regions_onscreen_".._ajax_challenge_existing_champions[champion_faction_name].spawn_settlement_name
		com:SetText(common.get_localised_string(loc_key), loc_key)
	end

	local has_resources, has_renown = ajax_challenge_payment(champion_faction_name, true)

	-- required renown
	com = champion_component:SequentialFind("required_renown", "text")
	if com and _ajax_challenge_existing_champions[champion_faction_name].demanding_renown then
		com:SetText(_ajax_challenge_existing_champions[champion_faction_name].demanding_renown, _ajax_challenge_existing_champions[champion_faction_name].demanding_renown)
		com:SetState(has_renown and "enough" or "not_enough")
	end

	-- flavour_text
	com = champion_component:SequentialFind("flavour_text")
	if com and _ajax_challenge_existing_champions[champion_faction_name].champion_flavour_text then
		local loc_key = "random_localisation_strings_string_".._ajax_challenge_existing_champions[champion_faction_name].champion_flavour_text
		com:SetText(common.get_localised_string(loc_key), loc_key)
	end

	-- rank
	com = champion_component:SequentialFind("skills", "dy_rank")
	if com and _ajax_challenge_existing_champions[champion_faction_name].spawn_level then
		com:SetText(_ajax_challenge_existing_champions[champion_faction_name].spawn_level, _ajax_challenge_existing_champions[champion_faction_name].spawn_level)
	end

	if component then
		local bodyguard_unit = _ajax_challenge_existing_champions[champion_faction_name].bodyguard_unit or ""
		component:InterfaceFunction("set_champion_info", { faction_id = champion_faction_name, settlement_id = _ajax_challenge_existing_champions[champion_faction_name].spawn_settlement_name, bodyguard_id = bodyguard_unit })
		component:InterfaceFunction("set_champion_info_cost", { cost = _ajax_challenge_existing_champions[champion_faction_name].challenge_cost })
	else
		local bodyguard_unit = _ajax_challenge_existing_champions[champion_faction_name].bodyguard_unit or ""
		panel:InterfaceFunction("set_available_champion", champion_faction_name, _ajax_challenge_existing_champions[champion_faction_name].spawn_settlement_name, bodyguard_unit, component_id)
		panel:InterfaceFunction("set_challenge_cost", { cost = _ajax_challenge_existing_champions[champion_faction_name].challenge_cost, component_id = component_id })
	end

	-- challenge button
	com = champion_component:SequentialFind("challenge_button")
	if com then
		if not has_resources or not has_renown then
			com:SetState("inactive")
		else
			com:SetState("active")
			com:SetProperty("faction", champion_faction_name)
		end
	end

	if not component then	 
		champion_component:SetVisible(true)
	end
end

function add_challenged_champion_to_list(panel, champion_cqi, champion_faction_name, component_template, champions_list, component_id)
	local champion_component = UIComponent(champions_list:CreateFromComponent(component_template:Address(), component_id))
	local bodyguard_unit = _ajax_challenge_existing_champions[champion_faction_name].bodyguard_unit or ""
	panel:InterfaceFunction("set_challenged_champion", champion_cqi, component_id, bodyguard_unit)

	-- sort properties
	champion_component:SetProperty("level", _ajax_challenge_existing_champions[champion_faction_name].spawn_level)
	champion_component:SetProperty("renown", _ajax_challenge_existing_champions[champion_faction_name].demanding_renown)
	
	-- location
	com = champion_component:SequentialFind("dy_location")
	if com then
		local loc_text = "regions_onscreen_".._ajax_challenge_existing_champions[champion_faction_name].spawn_settlement_name
		com:SetText(common.get_localised_string(loc_text), loc_text)
	end

	-- flavour_text
	com = champion_component:SequentialFind("flavour_text")
	if com and _ajax_challenge_existing_champions[champion_faction_name].champion_flavour_text then
		local loc_text = "random_localisation_strings_string_".._ajax_challenge_existing_champions[champion_faction_name].champion_flavour_text
		com:SetText(common.get_localised_string(loc_text), loc_text)
	end

	-- rank
	com = champion_component:SequentialFind("skills", "dy_rank")
	if com and _ajax_challenge_existing_champions[champion_faction_name].spawn_level then
		com:SetText(_ajax_challenge_existing_champions[champion_faction_name].spawn_level, _ajax_challenge_existing_champions[champion_faction_name].spawn_level)
	end

	-- HIDDEN

	local function hide(id)
		com = champion_component:SequentialFind(id)
		if com then
			com:SetVisible(false)
		end
	end

	hide("required_renown")
	hide("separator")
	hide("resource_cost_holder")
	hide("buttons_holder")

	champion_component:SetVisible(true)
end

function add_defeated_champion_to_list(champion_faction_name, panel, component_id, available_template, champions_list)
	local champion_component = UIComponent(champions_list:CreateFromComponent(available_template:Address(), component_id))

	-- sort properties
	champion_component:SetProperty("level", _ajax_challenge_existing_champions[champion_faction_name].spawn_level)
	champion_component:SetProperty("renown", _ajax_challenge_existing_champions[champion_faction_name].demanding_renown)

	-- flavour_text
	com = champion_component:SequentialFind("flavour_text")
	if com and _ajax_challenge_existing_champions[champion_faction_name].champion_flavour_text then
		local loc_text = "random_localisation_strings_string_".._ajax_challenge_existing_champions[champion_faction_name].champion_flavour_text
		com:SetText(common.get_localised_string(loc_text), loc_text)
	end

	-- icon
	local bodyguard_unit = _ajax_challenge_existing_champions[champion_faction_name].bodyguard_unit or ""
	panel:InterfaceFunction("set_available_champion", champion_faction_name, _ajax_challenge_existing_champions[champion_faction_name].spawn_settlement_name, bodyguard_unit, component_id)	

	local function hide(id)
		com = champion_component:SequentialFind(id)
		if com then
			com:SetVisible(false)
		end
	end

	hide("required_renown")
	hide("separator")
	hide("resource_cost_holder")
	hide("buttons_holder")
	hide("button_zoom_location")
	hide("location")
	hide("garrison_strenght")

	champion_component:SetVisible(true)
end

function ajax_challenge_fm_panel_update()
	output("fm_panel_update")

	local panel = core:get_ui_root():SequentialFind(ajax_challenge_cofiguration.fm_panel)
	if not panel or not panel:Visible() then
		return
	end

	local ajax_faction = cm:get_faction(ajax_challenge_cofiguration.faction_name)

	-- renown bar
	local renown_bar = panel:SequentialFind(ajax_challenge_cofiguration.fm_renown_bar)
	local renown_res = ajax_faction:pooled_resource(ajax_challenge_cofiguration.renown_key)
	if renown_res and not renown_res:is_null_interface() and renown_bar then
		local renown_amount = renown_res:value();
		local renown_max_value = renown_res:maximum_value()

		-- tooltip
		local tooltip = panel:SequentialFind(ajax_challenge_cofiguration.fm_renown_bar_tooltip)
		if tooltip then
			tooltip:InterfaceFunction("set_data",  troy_adi_ajax_renown_export_data.functions.get_renown_bar_data_per_renown_amount(renown_amount))

			if troy_adi_ajax_renown_export_data.progress.with_trojans ~= nil and troy_adi_ajax_renown_export_data.progress.with_trojans == true then
				tooltip:InterfaceFunction("set_ajax_side_description_key", troy_adi_ajax_renown_export_data.defs.ui.renown_bar_tooltip_trojan_text)
			else
				tooltip:InterfaceFunction("set_ajax_side_description_key", troy_adi_ajax_renown_export_data.defs.ui.renown_bar_tooltip_danaan_text)
			end
			-- tiers
			local renown_bar_tier_template = tooltip:SequentialFind(ajax_challenge_cofiguration.fm_renown_bar_tier_template)
			local renown_bar_tier_parent = tooltip:SequentialFind(ajax_challenge_cofiguration.fm_renown_bar_tier_parent)

			troy_adi_ajax_renown_export_data.functions.create_renown_bar_tiers(renown_bar_tier_parent, renown_bar_tier_template, renown_max_value, false)
			if renown_bar_tier_template ~= nil then
				renown_bar_tier_template:SetVisible(false)
			end		
		end

		-- fill bar
		local width = (renown_amount / renown_max_value) * renown_bar:Width()
		renown_bar:Resize(width, renown_bar:Height())
		renown_bar:SetVisible(width>0)
	end
	
	local champions_list = panel:SequentialFind("champions_list", "list_box")
	if not champions_list then
		return
	end

	-- templates
	local unknown_template = champions_list:SequentialFind("champion_template_unknown")
	if not unknown_template then
		return
	end
	champions_list:Divorce(unknown_template:Address())

	local available_template = champions_list:SequentialFind("champion_template_available")
	if not available_template then
		return
	end
	champions_list:Divorce(available_template:Address())

	local challenged_template = champions_list:SequentialFind("champion_template_challenged")
	if not challenged_template then
		return
	end
	champions_list:Divorce(challenged_template:Address())

	local defeated_template = champions_list:SequentialFind("champion_template_defeated")
	if not defeated_template then
		return
	end
	champions_list:Divorce(defeated_template:Address())

	-- fill the list with champions
	champions_list:DestroyChildren()
	champions_list:StallLayouts(true)

	local listed = 0

	-- available - can interact/challenge with them
	for champion_faction_name,_ in pairs(_ajax_challenge_available_champions) do
		listed = listed + 1
		local component_id = "champion_entry_"..listed
		add_available_champion_to_list(champion_faction_name, panel, component_id, available_template, champions_list)
	end

	-- challenged - cant interact with them, show info
	for champion_faction_name,champion_cqi in pairs(_ajax_challenge_challenged_champions) do
		listed = listed + 1
		local component_id = "champion_entry_"..listed
		add_challenged_champion_to_list(panel, champion_cqi, champion_faction_name, challenged_template, champions_list, component_id)
	end

	-- defeated - cant interact with them, show info
	for _,champion_faction_name in pairs(_ajax_challenge_recruitment_pool_champions) do
		listed = listed + 1
		local component_id = "champion_entry_"..listed
		add_defeated_champion_to_list(champion_faction_name, panel, component_id, defeated_template, champions_list)
	end

	-- recruited - cant interact with them, show info
	for _,champion_faction_name in pairs(_ajax_challenge_recruited_champions) do
		listed = listed + 1
		local component_id = "champion_entry_"..listed
		add_defeated_champion_to_list(champion_faction_name, panel, component_id, defeated_template, champions_list)
	end

	-- disbanded - cant interact with them, show info
	for champion_faction_name,_ in pairs(_ajax_challenge_awaitng_pool_champions) do
		listed = listed + 1
		local component_id = "champion_entry_"..listed
		add_defeated_champion_to_list(champion_faction_name, panel, component_id, defeated_template, champions_list)
	end

	champions_list:StallLayouts(false)
	champions_list:Layout()
	champions_list:SetVisible(listed > 0)

	panel:InterfaceFunction("champion_list_done")
end

-- UI, get_local_faction - which faction clicked buttn challenge
function ajax_challenge_fm_panel_lclickup(context)
	local l_context = context
	local uic = UIComponent(l_context.component)
	local com_id = uic:Id()

	if com_id == "challenge_button" then
		local champion_faction_name = uic:GetProperty("faction")

		create_confirmation_box(ajax_challenge_cofiguration.confirmation_dlg_id, ajax_challenge_cofiguration.confirmation_dlg_description,
			function()
				local local_faction_cqi = cm:get_faction(cm:get_local_faction_name(true)):command_queue_index()
				CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "ajax_challenge_SPAWN_CHAMPION:" .. champion_faction_name)
			end
		)
	end
end

function ajax_challenge_settlement_panel_update(champion_faction_name)
	output("settlement_panel_update "..(champion_faction_name or "nil"))

	local panel = core:get_ui_root():SequentialFind(ajax_challenge_cofiguration.settlement_panel)
	if not panel or not panel:Visible() then
		return
	end

	local champion_holder = panel:SequentialFind(ajax_challenge_cofiguration.settlement_panel_holder)
	if not champion_holder then
		return
	end 

	local champion_component = champion_holder:SequentialFind(ajax_challenge_cofiguration.settlement_panel_champion)
	if not champion_component then
		return
	end 

	local holder_visible = champion_faction_name and champion_faction_name ~= "" and _ajax_challenge_available_champions[champion_faction_name]

	if holder_visible then
		add_available_champion_to_list(champion_faction_name, panel, ajax_challenge_cofiguration.settlement_panel_champion, nil, nil, champion_component)

		local challenge_button = champion_component:SequentialFind("challenge_button")
		if challenge_button then
			challenge_button:SetProperty("faction", champion_faction_name)
		end
	end

	ajax_challenge_settlement_champion_info_show(champion_holder, champion_component, holder_visible)

	champion_holder:SetVisible(holder_visible)
end

-- UI, get_local_faction - which faction is clicked challenge button
function ajax_challenge_settlement_panel_lclickup(context)
	local panel = core:get_ui_root():SequentialFind(ajax_challenge_cofiguration.settlement_panel)
	if not panel or not panel:Visible() then
		return
	end

	local l_context = context
	local uic = UIComponent(l_context.component)
	local com_id = uic:Id()

	output("settlement_panel_lclickup: "..com_id)

	if com_id == "minimise_button" then

		local champion_holder = panel:SequentialFind(ajax_challenge_cofiguration.settlement_panel_holder)
		if champion_holder then
			local champion_component = champion_holder:SequentialFind(ajax_challenge_cofiguration.settlement_panel_champion)
			if champion_component then
				local set_visible = not champion_component:Visible()
				ajax_challenge_settlement_champion_info_show(champion_holder, champion_component, set_visible)
			end
		end

	elseif com_id == "challenge_button" then

		local champion_faction_name = uic:GetProperty("faction")
		create_confirmation_box(ajax_challenge_cofiguration.confirmation_dlg_id, ajax_challenge_cofiguration.confirmation_dlg_description,
			function()
				local local_faction_cqi = cm:get_faction(cm:get_local_faction_name(true)):command_queue_index()
				CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "ajax_challenge_SPAWN_CHAMPION:" .. champion_faction_name)
			end
		)
	end

end

function ajax_challenge_settlement_champion_info_show(champion_holder, champion_component, set_visible)
	if not champion_holder or not champion_component then return end

	if champion_component:Visible() ~= set_visible then 
		-- show before the last frame of animation
		if set_visible then
			champion_component:SetVisible(true)	
		end
		-- shows/hides champion_component on the last frame of animation
		champion_holder:TriggerAnimation(set_visible and "show" or "hide")
	end

	local minimise_button = champion_holder:SequentialFind("minimise_button")
	if minimise_button then
		minimise_button:SetState(set_visible and "selected" or "active")
	end
end


function ajax_challenge_immovable_challenged()
	if not is_table(_ajax_challenge_challenged_champions) then
		return
	end

	for champion_faction_name,champion_cqi in pairs(_ajax_challenge_challenged_champions) do
		local champion_lookup_string = "faction:"..champion_faction_name..",cqi:"..tostring(champion_cqi)
		cm:set_force_has_retreated_this_turn(champion_lookup_string)
	end

	output("All challenged champions updated to no retreat this turn")
end

-- UI, get_local_faction - setup region plates
function ajax_challenge_init_settlement_nameplate_champion_icons()
	if cm:get_local_faction_name(true) ~= ajax_challenge_cofiguration.faction_name then return end

	for champion_faction_name,data in pairs(_ajax_challenge_existing_champions) do
		local champion_defeated = table_find(_ajax_defeated_champions_global, champion_faction_name)
		ajax_challenge_update_city_infobar(champion_faction_name, not champion_defeated)	
	end
end

function check_Ajax_faction_is_alive_human()
	local faction = cm:get_faction(ajax_challenge_cofiguration.faction_name)
	return faction and not faction:is_null_interface() and faction:is_human() and not faction:is_dead()
end

function ajax_challenge_show_message_battle_won(defeated_champ_faction_name)
	if ajax_challenge_cofiguration.champion_battle_win_event_index > 0 then
		output("ajax_challenge_show_message_battle_won ")
		cm:show_message_event(
				ajax_challenge_cofiguration.faction_name,
				ajax_challenge_cofiguration.champion_battle_win_event_title,
				ajax_challenge_cofiguration.champion_battle_win_event_descr,
				"event_feed_strings_text_troy_event_feed_string_all_null",
				true,
				ajax_challenge_cofiguration.champion_battle_win_event_index,
				nil,
				nil,
				true,
				troy_adi_ajax_renown_export_data.defs.champion_defeated_renown_reward[defeated_champ_faction_name])
	end
end

function ajax_challenge_show_message_battle_lost()
	if ajax_challenge_cofiguration.champion_battle_lost_event_index > 0 then
		output("ajax_challenge_show_message_battle_lost")
		cm:show_message_event(
				ajax_challenge_cofiguration.faction_name,
				ajax_challenge_cofiguration.champion_battle_lost_event_title,
				ajax_challenge_cofiguration.champion_battle_lost_event_descr,
				"event_feed_strings_text_troy_event_feed_string_all_null",
				true,
				ajax_challenge_cofiguration.champion_battle_lost_event_index,
				nil,
				nil,
				true)
	end
end

function ajax_challenge_add_champion_to_recruitment_pool(champion_faction_name)
	output("ajax_challenge_add_champion_to_recruitment_pool")
	ajax_add_champion_to_recruitment_pool(champion_faction_name)
end

function ajax_challenge_champion_defeated(lose_faction_name)
	output("ajax_challenge_champion_defeated")
	cm:kill_all_armies_for_faction(cm:get_faction(lose_faction_name))
	core:trigger_event("ScriptEventAjaxDefeatedChampion", lose_faction_name)
	table_add_unique(_ajax_defeated_champions_global, lose_faction_name)
	if is_table(_ajax_challenge_existing_champions) and is_table(_ajax_challenge_existing_champions[lose_faction_name]) then
		_ajax_defeated_champions_turns_global[_ajax_challenge_existing_champions[lose_faction_name].reward_main_unit_record] = cm:model():turn_number()
	end
	ajax_challenge_update_city_infobar(lose_faction_name, false)
	achievements.ajax.func_challenge_champion_defeated()
end

-------------------------------------------------------------------------------------------------------------------------------------------
-- listeners
-------------------------------------------------------------------------------------------------------------------------------------------
function add_ajax_champion_challange_listeners()
	out("Listeners for Ajax Champion Challange started")

	-- set the initial game state (visible/hidden) for settlement infobar champion icons
	ajax_challenge_init_settlement_nameplate_champion_icons()

	-- FM panel open
	-- UI, get_local_faction - chack Ajax faction is opening the panel
	core:add_listener(
		"AjaxChampionChallenge_PanelOpenedCampaignFM",
		"PanelOpenedCampaign",
		function(context) return context.string == ajax_challenge_cofiguration.fm_panel and cm:get_local_faction_name(true) == ajax_challenge_cofiguration.faction_name end,
		function(context)
			ajax_challenge_update_visible_champions()

			ajax_challenge_fm_panel_update()

			core:add_listener(
				"AjaxChampionChallenge_ComponentLClickUp",
				"ComponentLClickUp",
				true,
				function(context)
					ajax_challenge_fm_panel_lclickup(context)
				end,
				true
			)

		end,
		true
	)

	-- FM panel closed
	-- UI, get_local_faction - chack Ajax faction is closeing the panel
	core:add_listener(
		"AjaxChampionChallenge_PanelClosedCampaignFM",
		"PanelClosedCampaign",
		function(context) return context.string == ajax_challenge_cofiguration.fm_panel and cm:get_local_faction_name(true) == ajax_challenge_cofiguration.faction_name end,
		function(context)
			core:remove_listener("AjaxChampionChallenge_ComponentLClickUp");
			core:remove_listener("AjaxChampionChallenge_ComponentLDBLClickUp");
		end,
		true
	)

	-- when a region is selected - handle settlement champion challenge
	-- UI, get_local_faction - chack Ajax faction is selecting the settlement
	local selected_settlement_champion_faction_name = ""
	core:add_listener(
		"AjaxChampionChallenge_SettlementSelected",
		"SettlementSelected",
		function(context)
			if cm:get_local_faction_name(true) == ajax_challenge_cofiguration.faction_name then
				selected_settlement_champion_faction_name = ""

				local settlement_name = context:garrison_residence():region():name()
				for champion_faction_name,data in pairs(_ajax_challenge_existing_champions) do
					if data.spawn_settlement_name == settlement_name then

						ajax_challenge_update_visible_champions()

						if _ajax_challenge_available_champions[champion_faction_name] then
							selected_settlement_champion_faction_name = champion_faction_name
						end
						
						break
					end
				end
				return true
			end

			return false
		end,
		function(context)
			ajax_challenge_settlement_panel_update(selected_settlement_champion_faction_name)
		end,
		true
	)

	-- Settlement info panel open
	-- UI, get_local_faction - chack Ajax faction is opening the panel	
	core:add_listener(
		"AjaxChampionChallenge_PanelOpenedCampaignSettlement",
		"PanelOpenedCampaign",
		function(context) return context.string == ajax_challenge_cofiguration.settlement_panel and cm:get_local_faction_name(true) == ajax_challenge_cofiguration.faction_name end,
		function(context)

			ajax_challenge_settlement_panel_update(selected_settlement_champion_faction_name)
			
			core:add_listener(
				"AjaxChampionChallenge_ComponentLClickUp",
				"ComponentLClickUp",
				true,
				function(context)
					ajax_challenge_settlement_panel_lclickup(context)
				end,
				true
			)
		end,
		true
	)

	-- Settlement info panel closed
	-- UI, get_local_faction - chack Ajax faction is closeing the panel	
	core:add_listener(
		"AjaxChampionChallenge_PanelClosedCampaignSettlement",
		"PanelClosedCampaign",
		function(context) return context.string == ajax_challenge_cofiguration.settlement_panel and cm:get_local_faction_name(true) == ajax_challenge_cofiguration.faction_name end,
		function(context)
			output("settlement panel closed")
			--selected_settlement_champion_faction_name = ""
			core:remove_listener("AjaxChampionChallenge_ComponentLClickUp");
		end,
		true
	)

	-- when a challenged champion is defeated
	core:add_listener(
		"AjaxChampionChallenge_BattleCompleted",
		"BattleCompleted",

		function(context)
			if not check_Ajax_faction_is_alive_human() then return false end

			local battle = context:pending_battle()
			if battle:is_null_interface() then return false end
			local battle_results = battle:battle_results()
			if battle_results:is_null_interface() then return false end

			return battle:attacker_faction():name() == ajax_challenge_cofiguration.faction_name and is_table(_ajax_challenge_challenged_champions) and _ajax_challenge_challenged_champions[battle:defender_faction():name()]
		end,

		function(context) 
			local battle_results = context:pending_battle():battle_results()

			local win_faction_name = battle_results:winning_faction_key()
			local lose_faction_name = battle_results:losing_faction_key()

			output("challenge battle completed: "..win_faction_name.." wins!")

			if win_faction_name == ajax_challenge_cofiguration.faction_name then

				ajax_challenge_show_message_battle_won(lose_faction_name)
				ajax_challenge_add_champion_to_recruitment_pool(lose_faction_name)
				ajax_challenge_champion_defeated(lose_faction_name)

			elseif lose_faction_name == ajax_challenge_cofiguration.faction_name then

				ajax_challenge_show_message_battle_lost()

			end

		end,

		true
	)

	-- when a champion is recruited
	core:add_listener(
		"AjaxChampionChallenge_UnitTrained",
		"UnitTrained",

		function(context)
			if not check_Ajax_faction_is_alive_human() then return false end

			local unit = context:unit()
			local champion_faction_name = is_table(_ajax_challenge_recruitment_pool_champions) and _ajax_challenge_recruitment_pool_champions[unit:unit_key()]

			return champion_faction_name and unit:military_force():faction():name() == ajax_challenge_cofiguration.faction_name
		end,

		function(context)
			local unit = context:unit()
			local key = unit:unit_key()
			local champion_faction_name = _ajax_challenge_recruitment_pool_champions[key]

			_ajax_challenge_recruited_champions[key] = champion_faction_name
			_ajax_challenge_recruitment_pool_champions[key] = nil

			output("Reward unit recruited: "..key..", "..champion_faction_name)
		end,

		true
	)
	
	-- when a recruited champion unit is destroyed
	core:add_listener(
		"AjaxChampionChallenge_UnitDestroyed",
		"UnitDestroyed",

		function(context)
			if not check_Ajax_faction_is_alive_human() then return false end

			local unit = context:unit()
			local champion_faction_name = is_table(_ajax_challenge_recruited_champions) and _ajax_challenge_recruited_champions[unit:unit_key()]

			return champion_faction_name and unit:military_force():faction():name() == ajax_challenge_cofiguration.faction_name
		end,

		function(context)
			local unit = context:unit()
			local key = unit:unit_key()
			local champion_faction_name = _ajax_challenge_recruited_champions[key]

			ajax_challenge_add_champion_to_recruitment_pool(champion_faction_name)

			output("Reward unit destroyed, added to pool again: "..key..", "..champion_faction_name)
		end,
		true
	)

	-- when a champion is disbanded
	core:add_listener(
		"AjaxChampionChallenge_UnitDisbanded",
		"UnitDisbanded",

		function(context)
			if not check_Ajax_faction_is_alive_human() then return false end

			local unit = context:unit()
			local champion_faction_name = is_table(_ajax_challenge_recruited_champions) and _ajax_challenge_recruited_champions[unit:unit_key()]

			return champion_faction_name and unit:military_force():faction():name() == ajax_challenge_cofiguration.faction_name
		end,

		function(context)
			local unit = context:unit()
			local key = unit:unit_key()
			local champion_faction_name = _ajax_challenge_recruited_champions[key]

			_ajax_challenge_awaitng_pool_champions[champion_faction_name] = ajax_challenge_cofiguration.wait_turns_after_disband
			_ajax_challenge_recruited_champions[key] = nil

			output("Reward unit disbanded: "..key..", "..champion_faction_name)
		end,

		true
	)

	
	-- handle Human Ajax: awaiting to enter recruitment pool champions 
	-- handle AI Ajax: add units to recruitment pool
	core:add_listener(
		"AjaxChampionChallenge_FactionTurnStart",
		"FactionTurnStart",

		function(context) 
			local faction = context:faction()
			return faction and not faction:is_null_interface() and not faction:is_dead() and faction:name() == ajax_challenge_cofiguration.faction_name 
		end,

		function(context) 
			ajax_challenge_immovable_challenged()

			local faction = context:faction()

			if faction:is_human() then

				ajax_challenge_update_visible_champions()

				for champion_faction_name, turns in pairs(_ajax_challenge_awaitng_pool_champions) do
					local wait = math.max(turns - 1, 0)
					_ajax_challenge_awaitng_pool_champions[champion_faction_name] = wait 

					if wait == 0 then
						local faction_cqi = faction:command_queue_index()
						ajax_challenge_add_champion_to_recruitment_pool(champion_faction_name)
					end
				end

			else
			
				local turn = cm:turn_number()

				if is_table(ajax_challenge_ai_units) and is_table(ajax_challenge_ai_units[turn]) then
					local index = cm:model():random_int(1, #ajax_challenge_ai_units[turn])
					local unit_record_to_add = ajax_challenge_ai_units[turn][index]

					local custom_unit = cm:create_custom_unit_from_key(unit_record_to_add, false)
					if custom_unit:is_null_interface() then
						output("Failed to create custom unit for " .. unit_record_to_add .. " key")
						return
					end
					custom_unit:add_mercenary_recruit_data(
						1, -- count
						0, -- replenish
						1, -- max_count
						0, -- max_replenish
						0, -- experience
						"", -- FACTION_RECORD faction_restricted_record
						"", -- SUBCULTURE_RECORD subculture_restricted_record
						"" -- TECHNOLOGY_RECORD tech_restricted_recor
					)
					custom_unit:set_champion_flag()

					cm:add_custom_unit_to_faction_mercenary_pool(
						ajax_challenge_cofiguration.faction_name,
						custom_unit
					)
					output("Unit added to Ajax faction AI unit recruitment pool: "..unit_record_to_add)

				end
			end
		end,
		true
	)

	core:add_listener(
		"AjaxChampionChallenge_SpawnChampion",
		"UITriggerScriptEvent",
		function(context) 
			local args = context:trigger():split(":")
			return #args >= 1 and string.find(args[1], "ajax_challenge_")
		end,
		function(context)
			local event = context:trigger():split(":")[1]

			if event == "ajax_challenge_SPAWN_CHAMPION" then
	
				local champion_faction_name = context:trigger():split(":")[2]
				output("script event: "..event..", param: "..champion_faction_name)
				ajax_challenge_spawn_champion(champion_faction_name)

			end
		end,
		true
	)

end

-- add champion challenge listeners
core:add_listener(
	"AjaxChampionChallenge_FirstTickAfterWorldCreated",
	"FirstTickAfterWorldCreated",
	true,
	function(context)
		add_ajax_champion_challange_listeners(context)
	end,
	true
)

-------------------------------------------------------------------------------------------------------------------------------------------
-- saving/loading
-------------------------------------------------------------------------------------------------------------------------------------------
cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("troy_ajax_champion_challenge_available_champions", _ajax_challenge_available_champions, context)
		cm:save_named_value("troy_ajax_champion_challenge_challenged_champions", _ajax_challenge_challenged_champions, context)
		cm:save_named_value("troy_ajax_champion_challenge_recruitment_pool_champions", _ajax_challenge_recruitment_pool_champions, context)
		cm:save_named_value("troy_ajax_champion_challenge_recruited_champions", _ajax_challenge_recruited_champions, context)
		cm:save_named_value("troy_ajax_champion_challenge_awaitng_pool_champions", _ajax_challenge_awaitng_pool_champions, context)
		cm:save_named_value("troy_ajax_cmapion_challenge_ajax_defeated_champions_global", _ajax_defeated_champions_global, context)
		cm:save_named_value("troy_ajax_cmapion_challenge_ajax_defeated_champions_turns_global", _ajax_defeated_champions_turns_global, context)
	end
)

cm:add_loading_game_callback(
	function(context)
		_ajax_challenge_available_champions = cm:load_named_value("troy_ajax_champion_challenge_available_champions", _ajax_challenge_available_champions, context)
		_ajax_challenge_challenged_champions = cm:load_named_value("troy_ajax_champion_challenge_challenged_champions", _ajax_challenge_challenged_champions, context)
		_ajax_challenge_recruitment_pool_champions = cm:load_named_value("troy_ajax_champion_challenge_recruitment_pool_champions", _ajax_challenge_recruitment_pool_champions, context)
		_ajax_challenge_recruited_champions = cm:load_named_value("troy_ajax_champion_challenge_recruited_champions", _ajax_challenge_recruited_champions, context)
		_ajax_challenge_awaitng_pool_champions = cm:load_named_value("troy_ajax_champion_challenge_awaitng_pool_champions", _ajax_challenge_awaitng_pool_champions, context)
		_ajax_defeated_champions_global = cm:load_named_value("troy_ajax_cmapion_challenge_ajax_defeated_champions_global", _ajax_defeated_champions_global, context)
		_ajax_defeated_champions_turns_global = cm:load_named_value("troy_ajax_cmapion_challenge_ajax_defeated_champions_turns_global", _ajax_defeated_champions_turns_global, context)
	end
)
