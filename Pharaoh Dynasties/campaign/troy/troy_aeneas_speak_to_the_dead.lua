require("troy_aeneas_speak_to_the_dead_config")
out("Loading troy_aeneas_speak_to_the_dead.lua")

speak_to_the_dead_entries = {
	--[[ [1] = {
		family_member = 0, -- put family member object here
		cooldown = 5, -- cooldown for speaking to this particular person
		initial_cd = 5, -- number to be set for cooldown after usage
		incident_key = "troy_main_incident_speak_dead_dardanus", -- incident key (string or table) to be triggered when said entry is clicked
		available_incident_key = "troy_main_incident_speak_dead_dardanus", -- incident key (string only!) to be triggered when entry is added
		bundles = {
			[1] = {
				key = "effect_bundle_agent_actor_placeholder",
				duration = 0
			},
			[2] = {
				key = "effect_bundle_agent_actor_placeholder",
				duration = 0
			}
		}
	} ]]
}
is_initialised = false

function tprint (tbl, indent)
  if not indent then indent = 0 end
  for k, v in pairs(tbl) do
	formatting = string.rep("  ", indent) .. k .. ": "
	if type(v) == "table" then
	  print(formatting)
	  tprint(v, indent+1)
	elseif type(v) == 'boolean' then
	  print(formatting .. tostring(v))	  
	else
	  print(formatting .. v)
	end
  end
end

local speak_with_the_dead_current_page = 1
local speak_with_the_dead_num_items_per_page = 8

function aeneas_speak_to_the_dead_update_ui(is_from_open_panel)
	local panel = find_uicomponent(core:get_ui_root(), "fm_speak_with_dead")
	if panel and panel:Visible() then

		-- entries per page
		if is_from_open_panel then
			speak_with_the_dead_current_page = 1		
		end

		-- num pages
		local num_pages = math.ceil(#speak_to_the_dead_entries/speak_with_the_dead_num_items_per_page)
		--out("FM_SwD: num_pages -> " .. tostring(num_pages))

		-- clamping current page
		if speak_with_the_dead_current_page < 1 then
			speak_with_the_dead_current_page = 1
		elseif speak_with_the_dead_current_page > num_pages then
			speak_with_the_dead_current_page = num_pages
		end

		local uic_page_up = find_uicomponent(panel, "page_up")
		if uic_page_up then
			uic_page_up:SetVisible(num_pages > 1)
			uic_page_up:SetState(speak_with_the_dead_current_page > 1 and "active" or "inactive")
		end

		local uic_page_down = find_uicomponent(panel, "page_down")
		if uic_page_down then
			uic_page_down:SetVisible(num_pages > 1)
			uic_page_down:SetState(speak_with_the_dead_current_page < num_pages and "active" or "inactive")
		end

		local current_page_entries = {}
		local first_index = (speak_with_the_dead_current_page - 1) * speak_with_the_dead_num_items_per_page + 1
		local end_index = first_index + speak_with_the_dead_num_items_per_page - 1
		
		--out("FM_SwD: speak_with_the_dead_current_page -> " .. tostring(speak_with_the_dead_current_page))
		for i = first_index, end_index, 1 do
			local entry = speak_to_the_dead_entries[i]
			if entry then
				--out("FM_SwD: entry_idx -> " .. tostring(i))
				table.insert(current_page_entries, entry)
			end
		end





		local param = {
			family_members = current_page_entries, --speak_to_the_dead_entries,
			global_bundle = speak_to_the_dead_default_bundle
		}

		--tprint(speak_to_the_dead_entries)
		
		panel:InterfaceFunction("set_data", param)

		local dead_heroes_list_box = find_uicomponent(panel,"dead_heroes_list","list_clip","list_box")

		for k,v in pairs(speak_to_the_dead_entries) do 
			if (v.cooldown == 0) and find_uicomponent(dead_heroes_list_box, "dead_hero_" .. v.family_member) then 
				find_uicomponent(dead_heroes_list_box, "dead_hero_" .. v.family_member,"cooldown_display"):SetStateText(v.initial_cd, "From troy_aeneas_speak_to_the_dead.lua - unlocalised text.")
			end
		end
	end
end

function aeneas_speak_to_the_dead_component_lclickup(context)
	local uic = UIComponent(context.component)

	--out("aeneas_speak_to_the_dead_component_lclickup(".. uic:Id() ..")")

	if string.find(uic:Id(), "dead_hero_") ~= nil then
		local _, j = string.find(uic:Id(), "dead_hero_")
		local cqi = string.sub(uic:Id(), j + 1) -- because the j is on the "_" of the substring, we do + 1 to skip it
		local panel = core:get_ui_root():SequentialFind("fm_speak_with_dead")
		create_confirmation_box("speak_with_dead_dialogue_box", "campaign_localised_strings_string_speak_with_dead_dialogue_box_msg", 
			function(context)
				local faction = cm:model():world():faction_by_key(Aeneas_faction)
				CampaignUI.TriggerCampaignScriptEvent(faction:command_queue_index(), "AeneasSpeakToTheDead_ResolveLeftClick_".. cqi)
				if panel and panel:Visible() then
					panel:InterfaceFunction("close_panel")
				end
			end,
			nil,
			panel
		)
	end

	if not uicomponent_descended_from(uic, "fm_speak_with_dead") then
		return
	end

	if uic:Id() == "page_up" then
		speak_with_the_dead_current_page = speak_with_the_dead_current_page - 1
		aeneas_speak_to_the_dead_update_ui()
	elseif uic:Id() == "page_down" then
		speak_with_the_dead_current_page = speak_with_the_dead_current_page + 1
		aeneas_speak_to_the_dead_update_ui()
	end
end


function aeneas_speak_to_the_dead_spawn_family_member(name, art_set)
	local cqi = cm:spawn_character_into_family_tree(
			Aeneas_faction,
			name, 
			"", 
			"", 
			"", 
			18, 
			true, 
			"", 
			"", 
			false, 
			art_set,
			false
		)
	return cqi
end

function aeneas_speak_to_the_dead_add_start_pos_entries()
	-- default unlocked entries
	for k,v in pairs(speak_to_the_dead_default_entries) do
		local cqi = aeneas_speak_to_the_dead_spawn_family_member(v.name, v.art_set)
		aeneas_speak_to_the_dead_add_family_member_to_entries(cqi, v, false)
	end

	-- region entries
	for k,v in pairs(speak_to_the_dead_regions) do
		local cqi = aeneas_speak_to_the_dead_spawn_family_member(v.name, v.art_set)
		aeneas_speak_to_the_dead_add_family_member_to_entries(cqi, v, true)
	end

	-- unit class
	for k,v in pairs(speak_to_the_dead_unit_classes) do
		local cqi = aeneas_speak_to_the_dead_spawn_family_member(v.name, v.art_set)
		aeneas_speak_to_the_dead_add_family_member_to_entries(cqi, v, true)
	end

	-- buildings
	for k,v in pairs(speak_to_the_dead_buildings) do
		local cqi = aeneas_speak_to_the_dead_spawn_family_member(v.name, v.art_set)
		aeneas_speak_to_the_dead_add_family_member_to_entries(cqi, v, true)
	end

	-- character subtypes
	for k,v in pairs(speak_to_the_dead_character_subtypes) do
		local cqi = aeneas_speak_to_the_dead_spawn_family_member(v.name, v.art_set)
		aeneas_speak_to_the_dead_add_family_member_to_entries(cqi, v, true)
	end

	-- faction leader rank
	for k,v in pairs(speak_to_the_dead_faction_leader_ranks) do
		local cqi = aeneas_speak_to_the_dead_spawn_family_member(v.name, v.art_set)
		aeneas_speak_to_the_dead_add_family_member_to_entries(cqi, v, true)
	end

	-- factions
	for k,v in pairs(faction_leader_entries) do
		if cm:model():world():faction_exists(v.faction) then
			local faction = cm:model():world():faction_by_key(v.faction)
			local faction_leader = faction:faction_leader()
			if not faction_leader:is_null_interface() then
				local family_member = faction_leader:family_member()
				if not family_member:is_null_interface() then
					local cqi = family_member:command_queue_index()
					aeneas_speak_to_the_dead_add_family_member_to_entries(cqi, v, true)
				end
			end
		end
	end

	is_initialised = true
end

function aeneas_speak_to_the_dead_entry_from_cqi(cqi)
	for k,v in pairs(speak_to_the_dead_entries) do
		if v.family_member == cqi then
			return v
		end
	end
end

function aeneas_speak_to_the_dead_entry_from_name(name)
	for k,v in pairs(speak_to_the_dead_entries) do
		if v.name == name then
			return v
		end
	end
end


function aeneas_speak_to_the_dead_reset_entry_cooldown(cqi)
	local entry = aeneas_speak_to_the_dead_entry_from_cqi(cqi)
	if entry then
		entry.cooldown = entry.initial_cd
	end
end

function aeneas_speak_to_the_dead_add_family_member_to_entries(cqi, entry_table, locked)
	-- initial cd to be removed
	local initial_cd
	if entry_table.initial_cd == nil then 
		entry_table.initial_cd = entry_table.cooldown
	end 
	local entry = {
		family_member = cqi,
		cooldown = 0, --entry_table.cooldown, all new entries now start off cooldown - by design 
		initial_cd = entry_table.initial_cd,
		bundle = entry_table.bundle,
		bundles = entry_table.bundles,
		incident_key = entry_table.incident_key,
		available_incident_key = entry_table.available_incident_key,
		image = entry_table.image,
		locked = locked,
		name = entry_table.name,
		locked_tooltip_key = entry_table.locked_tooltip_key or ""
	}
	table.insert(speak_to_the_dead_entries, entry)
	--local faction = cm:model():world():faction_by_key(Aeneas_faction)
	--CampaignUI.TriggerCampaignScriptEvent(faction:command_queue_index(), "AeneasSpeakToTheDead_NewEntryAdded_"..tostring(cqi));
end

function aeneas_speak_to_the_dead_set_family_member_lock_cqi(cqi, locked)
	local entry = aeneas_speak_to_the_dead_entry_from_cqi(cqi)
	if entry then
		entry.locked = locked

		local faction = cm:model():world():faction_by_key(Aeneas_faction)
		CampaignUI.TriggerCampaignScriptEvent(faction:command_queue_index(), "AeneasSpeakToTheDead_NewEntryAdded_"..tostring(cqi))

		if not locked then
			achievements.speak_to_the_dead.func_entry_unlocked()
		end
	end
end

function aeneas_speak_to_the_dead_set_family_member_lock_name(name, locked)
	local entry = aeneas_speak_to_the_dead_entry_from_name(name)
	if entry then
		entry.locked = locked

		local faction = cm:model():world():faction_by_key(Aeneas_faction)
		CampaignUI.TriggerCampaignScriptEvent(faction:command_queue_index(), "AeneasSpeakToTheDead_NewEntryAdded_"..tostring(entry.family_member))
		
		if not locked then
			achievements.speak_to_the_dead.func_entry_unlocked()
		end
	end
end

function aeneas_speak_to_the_dead_apply_favour_cost()
	local faction = cm:model():world():faction_by_key(Aeneas_faction)
	local gods = cm:model():world():god_manager():gods()
	for i=0,gods:num_items()-1 do
		if faction:has_pooled_resource(gods:item_at(i):resource_key()) then
			apply_transaction_conflict_and_spawn_event(faction,gods:item_at(i):resource_key(),gods_factors.faction,speak_to_the_dead_favour_cost)
		end
	end
end


function deep_copy(obj, seen)
  -- Handle non-tables and previously-seen tables.
  if type(obj) ~= 'table' then return obj end
  if seen and seen[obj] then return seen[obj] end

  -- New table; mark it as seen an copy recursively.
  local s = seen or {}
  local res = setmetatable({}, getmetatable(obj))
  s[obj] = res
  for k, v in pairs(obj) do res[deep_copy(k, s)] = deep_copy(v, s) end
  return res
end


function aeneas_speak_to_the_dead_add_listeners()
	out("Listeners for Aeneas' speak to the dead started")
	
	-- panel opened
	core:add_listener (
		"AeneasSpeakToTheDead_PanelOpenedCampaign",
		"PanelOpenedCampaign",
		function(context) return context.string == "fm_speak_with_dead" end,
		function(context)
			core:add_listener(
				"aeneas_speak_to_the_dead_component_lclickup",
				"ComponentLClickUp", 
				true,
				function(context) aeneas_speak_to_the_dead_component_lclickup(context) end, 
				true
			)

			aeneas_speak_to_the_dead_update_ui(true)
		end,
		true
	)
	
	-- panel closed
	core:add_listener(
		"AeneasSpeakToTheDead_PanelClosedCampaign",
		"PanelClosedCampaign",
		function(context) return context.string == "fm_speak_with_dead" end,
		function(context)
			core:remove_listener("aeneas_speak_to_the_dead_component_lclickup")
		end,
		true
	)

	core:add_listener (
		"AeneasSpeakToTheDead_Add_Start_Pos_Entries",
		"FactionTurnStart",
		function(context)
			if context:faction():name() == Aeneas_faction and not is_initialised then
				return true
			end
			return false
		end,
		aeneas_speak_to_the_dead_add_start_pos_entries,
		false
	)
	
	core:add_listener(
		"AeneasSpeakToTheDead_Add_Entry_From_Region_Captured",
		"RegionFactionChangeEvent",
		function(context) 
			if context:region():owning_faction():name() == Aeneas_faction and speak_to_the_dead_regions[context:region():name()] then
				--return true
				local entry = aeneas_speak_to_the_dead_entry_from_name(speak_to_the_dead_regions[context:region():name()].name)
				return entry and entry.locked or false
			end
			return false
		end,
		function(context)
--			local cqi = cm:spawn_character_into_family_tree(
--				Aeneas_faction,
--				speak_to_the_dead_regions[context:region():name()].name, 
--				"", 
--				"", 
--				"", 
--				18, 
--				true, 
--				"", 
--				"", 
--				false, 
--				speak_to_the_dead_regions[context:region():name()].art_set,
--				false
--			)
--			
--			aeneas_speak_to_the_dead_add_family_member_to_entries(cqi,speak_to_the_dead_regions[context:region():name()])
			aeneas_speak_to_the_dead_set_family_member_lock_name(speak_to_the_dead_regions[context:region():name()].name, false)
			speak_to_the_dead_regions[context:region():name()] = nil
		end,
		true
	)

	core:add_listener(
		"AeneasSpeakToTheDead_Add_Entry_From_Unit_Created",
		"UnitCreated",
		function(context) 
			local unit = context:unit()
			if unit:faction():name() == Aeneas_faction and speak_to_the_dead_unit_classes[unit:unit_class()] then
				--return true
				local entry = aeneas_speak_to_the_dead_entry_from_name(speak_to_the_dead_unit_classes[unit:unit_class()].name)
				return entry and entry.locked or false
			end
			return false
		end,
		function(context)
			local unit = context:unit()
--			local cqi = cm:spawn_character_into_family_tree(
--				Aeneas_faction,
--				speak_to_the_dead_unit_classes[unit:unit_class()].name, 
--				"", 
--				"", 
--				"", 
--				18, 
--				true, 
--				"", 
--				"", 
--				false, 
--				speak_to_the_dead_unit_classes[unit:unit_class()].art_set,
--				false
--			)
--			aeneas_speak_to_the_dead_add_family_member_to_entries(cqi, speak_to_the_dead_unit_classes[unit:unit_class()])
			aeneas_speak_to_the_dead_set_family_member_lock_name(speak_to_the_dead_unit_classes[unit:unit_class()].name, false)
			speak_to_the_dead_unit_classes[unit:unit_class()] = nil
		end,
		true
	)
	
	core:add_listener(
		"AeneasSpeakToTheDead_Add_Entry_From_Building_Chain",
		"BuildingCompleted",
		function(context) 
			if context:garrison_residence():faction():name() == Aeneas_faction and speak_to_the_dead_buildings[context:building():chain()] then
				--return true
				local entry = aeneas_speak_to_the_dead_entry_from_name(speak_to_the_dead_buildings[context:building():chain()].name)
				return entry and entry.locked or false
			end
			return false
		end,
		function(context)
--			local cqi = cm:spawn_character_into_family_tree(
--				Aeneas_faction,
--				speak_to_the_dead_buildings[context:building():chain()].name, 
--				"", 
--				"", 
--				"", 
--				18, 
--				true, 
--				"", 
--				"", 
--				false, 
--				speak_to_the_dead_buildings[context:building():chain()].art_set,
--				false
--			)
--			aeneas_speak_to_the_dead_add_family_member_to_entries(cqi,speak_to_the_dead_buildings[context:building():chain()])
			aeneas_speak_to_the_dead_set_family_member_lock_name(speak_to_the_dead_buildings[context:building():chain()].name, false)
			speak_to_the_dead_buildings[context:building():chain()] = nil
		end,
		true
	)

	core:add_listener(
		"AeneasSpeakToTheDead_Add_Entry_From_Building_Chain_2",
		"RegionFactionChangeEvent",
		function(context)
			if context:region():owning_faction():name() == Aeneas_faction then
			local buildings = context:region():settlement():building_list()
				for i = 0, buildings:num_items() - 1 do
					local curr_building =  buildings:item_at(i)
					if  speak_to_the_dead_buildings[curr_building:chain()] then
						--return true
						local entry = aeneas_speak_to_the_dead_entry_from_name(speak_to_the_dead_buildings[curr_building:chain()].name)
						return entry and entry.locked or false
					end
				end
			end
			return false
		end,
		function(context)
--			local cqi = cm:spawn_character_into_family_tree(
--				Aeneas_faction,
--				speak_to_the_dead_buildings[context:building():chain()].name, 
--				"", 
--				"", 
--				"", 
--				18, 
--				true, 
--				"", 
--				"", 
--				false, 
--				speak_to_the_dead_buildings[context:building():chain()].art_set,
--				false
--			)
--			aeneas_speak_to_the_dead_add_family_member_to_entries(cqi,speak_to_the_dead_buildings[context:building():chain()])
			local buildings = context:region():settlement():building_list()
			for i = 0, buildings:num_items() - 1 do
				local curr_building =  buildings:item_at(i)
				if  speak_to_the_dead_buildings[curr_building:name()] then
				aeneas_speak_to_the_dead_set_family_member_lock_name(speak_to_the_dead_buildings[curr_building:chain()].name, false)
				speak_to_the_dead_buildings[curr_building:chain()] = nil
				end
			end
		end,
		true
	)

	
	core:add_listener(
		"AeneasSpeakToTheDead_Add_Entry_From_Building_Level",
		"BuildingCompleted",
		function(context) 
			if context:garrison_residence():faction():name() == Aeneas_faction and speak_to_the_dead_buildings[context:building():name()] then
				--return true
				local entry = aeneas_speak_to_the_dead_entry_from_name(speak_to_the_dead_buildings[context:building():name()].name)
				return entry and entry.locked or false
			end
			return false
		end,
		function(context)
--			local cqi = cm:spawn_character_into_family_tree(
--				Aeneas_faction,
--				speak_to_the_dead_buildings[context:building():name()].name, 
--				"", 
--				"", 
--				"", 
--				18, 
--				true, 
--				"", 
--				"", 
--				false, 
--				speak_to_the_dead_buildings[context:building():name()].art_set,
--				false
--			)
--			aeneas_speak_to_the_dead_add_family_member_to_entries(cqi,speak_to_the_dead_buildings[context:building():name()])
			aeneas_speak_to_the_dead_set_family_member_lock_name(speak_to_the_dead_buildings[context:building():name()].name, false)
			speak_to_the_dead_buildings[context:building():name()] = nil
		end,
		true
	)

	core:add_listener(
		"AeneasSpeakToTheDead_Add_Entry_From_Building_level_2",
		"RegionFactionChangeEvent",
		function(context)
			if context:region():owning_faction():name() == Aeneas_faction then
			local buildings = context:region():settlement():building_list()
				for i = 0, buildings:num_items() - 1 do
					local curr_building =  buildings:item_at(i)
					if  speak_to_the_dead_buildings[curr_building:name()] then
						--return true
						local entry = aeneas_speak_to_the_dead_entry_from_name(speak_to_the_dead_buildings[curr_building:name()].name)
						return entry and entry.locked or false
					end
				end
			end
			return false
		end,
		function(context)
--			local cqi = cm:spawn_character_into_family_tree(
--				Aeneas_faction,
--				speak_to_the_dead_buildings[context:building():chain()].name, 
--				"", 
--				"", 
--				"", 
--				18, 
--				true, 
--				"", 
--				"", 
--				false, 
--				speak_to_the_dead_buildings[context:building():chain()].art_set,
--				false
--			)
--		   	 aeneas_speak_to_the_dead_add_family_member_to_entries(cqi,speak_to_the_dead_buildings[context:building():chain()])
			local buildings = context:region():settlement():building_list()
			for i = 0, buildings:num_items() - 1 do
				local curr_building =  buildings:item_at(i)
				if  speak_to_the_dead_buildings[curr_building:name()] then
				aeneas_speak_to_the_dead_set_family_member_lock_name(speak_to_the_dead_buildings[curr_building:name()].name, false)
				speak_to_the_dead_buildings[curr_building:name()] = nil
				end
			end
		end,
		true
	)

	core:add_listener(
		"AeneasSpeakToTheDead_Add_Entry_From_Character_Subtype_Recruited",
		"CharacterCreated",
		function(context) 
			if context:character():faction():name() == Aeneas_faction and speak_to_the_dead_character_subtypes[context:character():character_subtype_key()] then
				--return true
				local entry = aeneas_speak_to_the_dead_entry_from_name(speak_to_the_dead_character_subtypes[context:character():character_subtype_key()].name)
				return entry and entry.locked or false
			end
			return false
		end,
		function(context)
--			local cqi = cm:spawn_character_into_family_tree(
--				Aeneas_faction,
--				speak_to_the_dead_character_subtypes[context:character():character_subtype_key()].name, 
--				"", 
--				"", 
--				"", 
--				18, 
--				true, 
--				"", 
--				"", 
--				false, 
--				speak_to_the_dead_character_subtypes[context:character():character_subtype_key()].art_set,
--				false
--			)
--			aeneas_speak_to_the_dead_add_family_member_to_entries(cqi,speak_to_the_dead_character_subtypes[context:character():character_subtype_key()])
			aeneas_speak_to_the_dead_set_family_member_lock_name(speak_to_the_dead_character_subtypes[context:character():character_subtype_key()].name, false)
			speak_to_the_dead_character_subtypes[context:character():character_subtype_key()] = nil
		end,
		true
	)

	core:add_listener (
		"AeneasSpeakToTheDead_Add_Entry_Faction_Leader_Rank_Up",
		"CharacterRankUp",
		function(context)
			if context:character():is_faction_leader() and context:character():faction():name() == Aeneas_faction then
				--return true
				local rank = context:character():rank()

				if speak_to_the_dead_faction_leader_ranks[rank] then
					local entry = aeneas_speak_to_the_dead_entry_from_name(speak_to_the_dead_faction_leader_ranks[rank].name)
					return entry and entry.locked or false
				end

				return false
			end
			return false
		end,
		function(context)
			local rank = context:character():rank()
			if speak_to_the_dead_faction_leader_ranks[rank] ~= nil then
--				local cqi = cm:spawn_character_into_family_tree(
--					Aeneas_faction,
--					speak_to_the_dead_faction_leader_ranks[rank].name, 
--					"", 
--					"", 
--					"", 
--					18, 
--					true, 
--					"", 
--					"", 
--					false, 
--					speak_to_the_dead_faction_leader_ranks[rank].art_set,
--					false
--				)
--				aeneas_speak_to_the_dead_add_family_member_to_entries(cqi,speak_to_the_dead_faction_leader_ranks[rank])
				aeneas_speak_to_the_dead_set_family_member_lock_name(speak_to_the_dead_faction_leader_ranks[rank].name, false)
				speak_to_the_dead_faction_leader_ranks[rank] = nil
			end
		end,
		true
	)

	core:add_listener (
		"AeneasSpeakToTheDead_Add_Entry_Faction_Leader",
		"FactionCharacterDiedOrWounded",
		function(context)
			return context:family_member():character():faction():is_dead()			   
		end,
		function(context)
			for i=1,#faction_leader_entries do
				if faction_leader_entries[i].faction == context:faction():name() then --and context:family_member():has_trait(faction_leader_entries[i].trait) then
					aeneas_speak_to_the_dead_set_family_member_lock_cqi(context:family_member():command_queue_index(), false)
					--aeneas_speak_to_the_dead_add_family_member_to_entries(context:family_member():command_queue_index(),faction_leader_entries[i])
				end
			end
		end,
		true
	)

	core:add_listener (
		"AeneasSpeakToTheDead_Cooldown_All_Entries_Tick",
		"FactionTurnStart",
		function(context)
			if context:faction():name() == Aeneas_faction and not cm:is_new_game() then
				return true
			end
			return false
		end,
		function(context)
			for k,v in pairs(speak_to_the_dead_entries) do
				if not v.locked and v.cooldown ~= nil and v.cooldown > 0 then 
					v.cooldown = v.cooldown - 1
				end
			end
		end,
		true
	)

	core:add_listener(
		"CCQ_AeneasSpeakToTheDead_ResolveLeftClick",
		"UITriggerScriptEvent",
		function(context) 
			return string.find(context:trigger(), "AeneasSpeakToTheDead_ResolveLeftClick_") ~= nil
		end,
		function(context)
			local s,e = string.find(context:trigger(), "AeneasSpeakToTheDead_ResolveLeftClick_")
			local family_member_cqi_as_string = string.sub(context:trigger(), e + 1)
			out("AeneasSpeakToTheDead_ResolveLeftClick_: family_member_cqi_as_string = " .. family_member_cqi_as_string)
			local family_member_cqi = tonumber(family_member_cqi_as_string)
			-- tigger incident
			local entry = aeneas_speak_to_the_dead_entry_from_cqi(family_member_cqi)
			if entry and is_table(entry.incident_key) then
				if #entry.incident_key > 1 then
					cm:trigger_incident(Aeneas_faction, entry.incident_key[1], true)
					table.remove(entry.incident_key,1)
				else
					cm:trigger_incident(Aeneas_faction, entry.incident_key[1], true)
				end
			elseif entry and entry.incident_key then
				cm:trigger_incident(Aeneas_faction, entry.incident_key, true)
			end
			-- time to set the cooldown to initial cd value again
			aeneas_speak_to_the_dead_apply_favour_cost()
			cm:apply_effect_bundle(speak_to_the_dead_default_bundle.key,Aeneas_faction,speak_to_the_dead_default_bundle.duration)
			aeneas_speak_to_the_dead_reset_entry_cooldown(family_member_cqi)
			aeneas_speak_to_the_dead_update_ui()

			local faction = cm:model():world():faction_by_key(Aeneas_faction)
			core:trigger_event("ScriptedEventSpeakToTheDead", faction, family_member_cqi_as_string)

			--[[ 
			if entry ~= nil then
				achievements.speak_to_the_dead.func_speak_completed(cm:model():world():faction_by_key(Aeneas_faction), family_member_cqi)
			end
				]]		 

		end,
		true
	)
	
	core:add_listener(
		"CCQ_AeneasSpeakToTheDead_IncidentOnNewEntryAdded",
		"UITriggerScriptEvent",
		function(context) 
			return string.find(context:trigger(), "AeneasSpeakToTheDead_NewEntryAdded_") ~= nil
		end,
		function(context)
			local s,e = string.find(context:trigger(), "AeneasSpeakToTheDead_NewEntryAdded_")
			local family_member_cqi_as_string = string.sub(context:trigger(), e + 1)
			out("AeneasSpeakToTheDead_NewEntryAdded_: family_member_cqi_as_string = " .. family_member_cqi_as_string)
			local family_member_cqi = tonumber(family_member_cqi_as_string)
			-- tigger incident
			local entry = aeneas_speak_to_the_dead_entry_from_cqi(family_member_cqi)
			if entry and entry.available_incident_key then
				cm:trigger_incident(Aeneas_faction, entry.available_incident_key, true)
			end
		end,
		true
	)
end

--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------

cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("SPEAK_TO_THE_DEAD_ENTRIES",speak_to_the_dead_entries,context)
		cm:save_named_value("SPEAK_TO_THE_DEAD_IS_INITIALISED", is_initialised, context)
	end
)

cm:add_loading_game_callback(
	function(context)
		speak_to_the_dead_entries = cm:load_named_value("SPEAK_TO_THE_DEAD_ENTRIES",speak_to_the_dead_entries,context) 
		is_initialised = cm:load_named_value("SPEAK_TO_THE_DEAD_IS_INITIALISED", is_initialised, context)
	end
)