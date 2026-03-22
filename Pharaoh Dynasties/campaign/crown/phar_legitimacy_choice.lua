local file_info = debug.getinfo(1, "S")
local folder_file_splits = string.split(file_info.source, "\\")
out("Loading " .. folder_file_splits[#folder_file_splits])

local legitimacy_choice_config = {
	id = "legitimacy_choice",

	enable_legitimacy_choice_system = true,
	enable_self_proclamation_system = false,

	ui = {
		shared_state_unlocked_legitimacy_resource_key = "unlocked_legitimacy",

		egyptian_legitimacy_unlock_prompt = "campaign_localised_strings_string_phar_main_egyptian_legitimacy_unlock_prompt",
		hatti_legitimacy_unlock_prompt = "campaign_localised_strings_string_phar_main_hatti_legitimacy_unlock_prompt",

		legitimacy_unlock_event_to_id = {
			["phar_crown_choose_egyptian_legitimacy"] = egypt_legitimacy.config.id,
			["phar_crown_choose_hittite_legitimacy"] = hatti_legitimacy.config.id,
			["phar_crown_choose_aegean_legitimacy"] = aegean_legitimacy.config.id,
			["phar_crown_choose_mesopotamian_legitimacy"] = meso_legitimacy.config.id,
		},

		crown_button_id = "button_fm_phar_pharaoh_crown",
		crown_button_container = "fm_phar_pharaoh_crown_container",
	},
}

legitimacy_choice = {
	config = legitimacy_choice_config,

	persistent = {
		unlocked_legitimacies = {
			--[[
			legitimacy_id1 = {
				faction1_key,
				faction2_key,
			},
			legitimacy_id2 = {
				faction3_key,
				faction4_key,
			},
			--]]
		},

		self_proclamations = {
			--[[
			faction_key = {
				legitimacy_id1 = true,
			},
			--]]
		},
	},

	events = {
		UITriggerScriptEvent = function(self, context)
			local message = context:trigger()

			local legitimacy_id = self.config.ui.legitimacy_unlock_event_to_id[message]
			if legitimacy_id then
				local legitimacy_object = self:get_legitimacy_object_from_id(legitimacy_id)
				local faction_key = cm:model():faction_for_command_queue_index(context:faction_cqi()):name()
				self:unlock_legitimacy(legitimacy_object, faction_key)
			end
		end,

		FactionTurnStart = function(self, context)
			if not self.config.enable_legitimacy_choice_system then
				return
			end

			local faction = context:faction()
			local faction_key = faction:name()
			if not faction:is_human()
				or not self.config.enable_self_proclamation_system
			then
				return
			end

			for _, legitimacy_object in ipairs(self.legitimacy_objects) do
				if not self:legitimacy_unlocked(legitimacy_object, faction_key)
					and not self.persistent.self_proclamations[faction_key][legitimacy_object.config.id]
					and self:is_self_proclaimed_ruler_helper(faction_key, legitimacy_object.config.num_sacred_regions_to_conquer, legitimacy_object.sacred_lands)
				then
					self.persistent.self_proclamations[faction_key][legitimacy_object.config.id] = true
					ancient_legacy_common:faction_unlock_legacy_group(faction_key, legitimacy_object.political_states_system.config.ancient_legacy_group_key)
				end
			end
		end,

		RegionFactionChangeEvent = function(self, context)
			local region = context:region()
			local new_owner = region:owning_faction()
			local new_owner_key = new_owner:name()

			if new_owner:is_human()
				or new_owner:is_dead()
				or new_owner:is_rebel()
				or self:any_legitimacy_unlocked(new_owner_key)
			then
				return
			end

			local region_key = context:region():name()

			for _, legitimacy_object in ipairs(self.legitimacy_objects) do
				local sacred_lands = legitimacy_object.sacred_lands
				if sacred_lands[region_key] then
					self:unlock_legitimacy(legitimacy_object, new_owner_key)
					break
				end
			end
		end,

		ContextTriggerEvent = function(self, context)
			local splits = context.string:split(":")
			local uic = context.component

			if not uic then
				return
			end

			uic = UIComponent(uic)

			local legitimacy_type_to_object = {
				["egyptian"] = egypt_legitimacy,
				["hittite"] = hatti_legitimacy,
				["aegean"] = aegean_legitimacy,
				["meso"] = meso_legitimacy,
			}

			if splits[1] == "pharaohs_crown_set_state_if_can_afford_legitimacy" then
				local legitimacy_type = splits[2]
				local can_afford_state = splits[3]
				local cannot_afford_state = splits[4]

				local legitimacy_object = (legitimacy_type == "egyptian" and egypt_legitimacy) or hatti_legitimacy
				local faction_key = cm:get_local_faction_name(true)
				local can_afford = self:can_afford_legitimacy(legitimacy_object, faction_key)

				uic:SetState((can_afford and can_afford_state) or cannot_afford_state)
				return
			end

			if splits[1] == "pharaohs_crown_set_state_if_have_enough_sacred_regions" then
				local legitimacy_type = splits[2]
				local have_enough_regions_state = splits[3]
				local have_not_enough_regions_state = splits[4]

				local legitimacy_object = legitimacy_type_to_object[legitimacy_type]
				local faction_key = cm:get_local_faction_name(true)
				local have_enough_regions = self:have_enough_sacred_regions_for_legitimacy(legitimacy_object, faction_key)

				uic:SetState((have_enough_regions and have_enough_regions_state) or have_not_enough_regions_state)
				return
			end

			if splits[1] == "pharaohs_crown_set_state_if_can_unlock_legitimacy" then
				local legitimacy_type = splits[2]
				local can_unlock_state = splits[3]
				local cannot_unlock_state = splits[4]

				local legitimacy_object = legitimacy_type_to_object[legitimacy_type]
				local faction_key = cm:get_local_faction_name(true)
				local can_unlock = self:can_unlock_legitimacy(legitimacy_object, faction_key)

				uic:SetState((can_unlock and can_unlock_state) or cannot_unlock_state)
				return
			end

			if splits[1] == "pharaohs_crown_hide_if_no_legitimacy_cost" then
				local legitimacy_type = splits[2]

				local legitimacy_object = legitimacy_type_to_object[legitimacy_type]
				local faction_key = cm:get_local_faction_name(true)

				uic:SetVisible(to_bool(self:get_resource_cost_table_for_legitimacy(legitimacy_object, faction_key)))
				return
			end

			if splits[1] == "pharaohs_crown_setup_resource_costs" then
				local legitimacy_type = splits[2]
				local legitimacy_object = legitimacy_type_to_object[legitimacy_type]

				local faction_key = cm:get_local_faction_name(true)

				self:setup_resource_costs_ui(uic, legitimacy_object, faction_key)
				return
			end
		end,
	},

	on_first_tick = function(self, context)
		local human_factions = cm:get_human_factions();
		for _, faction_key in ipairs(human_factions) do
			if not self.persistent.self_proclamations[faction_key] then
				self.persistent.self_proclamations[faction_key] = {}
			end
		end

		local local_faction_key = cm:get_local_faction_name(true)

		for _, legitimacy_object in ipairs(self.legitimacy_objects) do
			local resource_override = uim:override("hide_resource_" .. legitimacy_object.config.resource_key)
			if resource_override then
				if self:legitimacy_unlocked(legitimacy_object, local_faction_key) then
					resource_override:unlock(true)
				else
					resource_override:lock(true)
				end
			end
		end

		cm:iterate_factions(function(faction)
			if faction:is_rebel() or faction:is_dead() then
				return
			end

			local faction_key = faction:name()

			for _, legitimacy_object in ipairs(self.legitimacy_objects) do
				-- re-apply building restrictions
				if not self:legitimacy_unlocked(legitimacy_object, faction_key) then
					cm:restrict_building_chains_for_faction(faction_key, legitimacy_object.config.building_chain_restrictions, true)
				end
			end
		end)

		legitimacy_choice:update_crown_button_tooltip()

		-- true: add listeners for my events table
		-- false: I'll handle my events by myself
		return true
	end,

	legitimacy_objects = {
		-- Automatically filled
		--[[
		egypt_legitimacy,
		hatti_legitimacy,
		aegean_legitimacy,
		meso_legitimacy,
		--]]
	},

	register_legitimacy_object = function(self, legitimacy_object)
		table.insert(self.legitimacy_objects, legitimacy_object)
	end,

	get_legitimacy_object_from_id = function(self, id)
		for _, legitimacy_object in ipairs(self.legitimacy_objects) do
			if legitimacy_object.config.id == id then
				return legitimacy_object
			end
		end
	end,

	num_regions_to_unlock_legitimacy = function(self, legitimacy_object, faction_key)
		if is_function(legitimacy_object.get_min_sacred_lands_for_faction) then
			return legitimacy_object:get_min_sacred_lands_for_faction(faction_key)
		end

		self:error_message("Trying to get num regions to unlock a legitimacy for an incorrect legitimacy object?? id = " .. tostring(legitimacy_object.config.id))

		return 0
	end,

	get_resource_cost_table_for_legitimacy = function(self, legitimacy_object, faction_key)
		return legitimacy_object.config.override_faction_resource_cost[faction_key] or legitimacy_object.config.resource_cost
	end,

	get_resource_cost_for_legitimacy = function(self, legitimacy_object, faction_key)
		local resource_cost_table = self:get_resource_cost_table_for_legitimacy(legitimacy_object, faction_key)
		if not resource_cost_table then
			return nil
		end

		local cost_obj = cm:create_new_custom_resource_cost()

		for resource_key, resource_amount in pairs(resource_cost_table) do
			cost_obj:add_resource_cost(resource_key, legitimacy_object.config.resource_cost_factor, resource_amount)
		end

		return cost_obj
	end,

	can_afford_legitimacy = function(self, legitimacy_object, faction_key)
		local resource_cost = self:get_resource_cost_for_legitimacy(legitimacy_object, faction_key)
		if not resource_cost then
			-- We have no resource cost for this faction
			-- If we need EITHER resource or sacred lands then return false, otherwise there will be no requirement
			-- If we need BOTH resource and sacred lands then return true, otherwise it will be impossible to complete the requirement
			return not legitimacy_object.config.resource_cost_can_replace_minimum_sacred_regions_requirement
		end

		local faction = cm:get_faction(faction_key)

		if not faction then
			legitimacy_object:error_message("trying to check if an invalid faction can pay for " .. legitimacy_object:id() .. "?" .. tostring(faction_key))
			return false
		end

		return faction:can_afford_resource_cost_object(resource_cost)
	end,

	have_enough_sacred_regions_for_legitimacy = function(self, legitimacy_object, faction_key)
		local num_sacred_regions = legitimacy_object:num_sacred_regions(faction_key)
		local num_regions_needed = self:num_regions_to_unlock_legitimacy(legitimacy_object, faction_key)
		return num_sacred_regions >= num_regions_needed
	end,

	can_unlock_legitimacy = function(self, legitimacy_object, faction_key)
		local turn_number = cm:model():turn_number()
		local feature_turn = feature_unlock.get_feature_unlock_turn_for_faction(faction_key, feature_ids_config.legitimacy_path)
		local feature_available_turn = turn_number >= feature_turn
		local have_enough_sacred_regions = self:have_enough_sacred_regions_for_legitimacy(legitimacy_object, faction_key)

		if legitimacy_object.config.resource_cost_can_replace_minimum_sacred_regions_requirement then
			return feature_available_turn and (have_enough_sacred_regions or self:can_afford_legitimacy(legitimacy_object, faction_key))
		end

		return feature_available_turn and have_enough_sacred_regions and self:can_afford_legitimacy(legitimacy_object, faction_key)
	end,

	get_unlocked_legitimacy = function(self, faction_key)
		for _, legitimacy_object in ipairs(self.legitimacy_objects) do
			if self:legitimacy_unlocked(legitimacy_object, faction_key) then
				return legitimacy_object
			end
		end

		return nil
	end,

	get_factions_with_legitimacy_object = function(self, legitimacy_object)
		return (self.persistent.unlocked_legitimacies[legitimacy_object.config.id]) or {}
	end,

	legitimacy_unlocked = function(self, legitimacy_object, faction_key)
		if not self.config.enable_legitimacy_choice_system then
			return true
		end

		local factions_who_have_unlocked_relevant_legitimacy = self:get_factions_with_legitimacy_object(legitimacy_object)

		return to_bool(factions_who_have_unlocked_relevant_legitimacy[faction_key])
	end,

	any_legitimacy_unlocked = function(self, faction_key)
		return self:get_unlocked_legitimacy(faction_key) ~= nil
	end,

	egyptian_legitimacy_unlocked = function(self, faction_key)
		return self:legitimacy_unlocked(egypt_legitimacy, faction_key)
	end,

	hatti_legitimacy_unlocked = function(self, faction_key)
		return self:legitimacy_unlocked(hatti_legitimacy, faction_key)
	end,

	-- ignore_checks is used from the Court to force unlock legitimacy for some AI factions
	-- they need to have it to access the court, but must not be able to unlock the other legitimacy later when they capture land
	unlock_legitimacy = function(self, legitimacy_object, faction_key, ignore_checks)
		if not ignore_checks and not self:can_unlock_legitimacy(legitimacy_object, faction_key) then
			return
		end

		local legitimacy_id = legitimacy_object.config.id

		if not self.persistent.unlocked_legitimacies[legitimacy_id] then
			self.persistent.unlocked_legitimacies[legitimacy_id] = {}
		end

		self.persistent.unlocked_legitimacies[legitimacy_id][faction_key] = true

		local faction = cm:get_faction(faction_key)
		cm:set_script_state(faction, self.config.ui.shared_state_unlocked_legitimacy_resource_key, legitimacy_object.config.resource_key)

		if not legitimacy_object.config.resource_cost_can_replace_minimum_sacred_regions_requirement
			or not self:have_enough_sacred_regions_for_legitimacy(legitimacy_object, faction_key)
		then
			local resource_object = self:get_resource_cost_for_legitimacy(legitimacy_object, faction_key)
			cm:faction_apply_resource_transaction(faction, resource_object)
		end

		if is_function(legitimacy_object.political_states_system.update_legitimacy_war_thresholds) then
			legitimacy_object.political_states_system:update_legitimacy_war_thresholds()
		end

		local unlock_event = legitimacy_object.config.unlock_event
		local localised_key = "campaign_localised_strings_string_" .. unlock_event.localised_name_key
		local faction_leader = faction:faction_leader()
		if faction_leader and not faction_leader:is_null_interface() then
			local faction_leader_cqi = faction_leader:command_queue_index()
			cm:add_event_feed_event(
				unlock_event.event_key,
				faction_key,
				0,
				localised_key,
				cm:char_lookup_str(faction_leader_cqi)
			)
		end

		core:trigger_event("LegitimacyPathUnlocked", { faction_key = faction_key, path_id = legitimacy_object.config.id })

		if faction_key == cm:get_local_faction_name(true) then
			local ui_override = uim:override("hide_resource_" .. legitimacy_object.config.resource_key)
			if ui_override then
				ui_override:unlock(true)
			end
			legitimacy_choice:update_crown_button_tooltip()
		end

		cm:restrict_building_chains_for_faction(faction_key, legitimacy_object.config.building_chain_restrictions, false)

		if legitimacy_object.special_ancillary_system.config.ancillaries_always_unlocked then
			legitimacy_object.special_ancillary_system:unlock_ancillaries(faction_key)
		end

		if faction:is_human() then
			-- Human players unlock an Ancient Legacy upon choosing a legitimacy path (while CAIs do when they become ruler).
			ancient_legacy_common:faction_unlock_legacy_group(faction_key, legitimacy_object.political_states_system.config.ancient_legacy_group_key)

			common.send_ui_update_message(legitimacy_object.powers_system.update_powers_ui_event)
		end
	end,

	setup_ruler_button_helper = function(self, button, label, can_unlock, num_regions_needed, cannot_unlock_suffix)
		if can_unlock then
			button:SetState("active")
			button:SetProperty("state", "unlock")
			label:SetStateText("Click here to unlock legitimacy!", "placeholder")
		else
			button:SetState("inactive")
			button:SetProperty("state", "locked")
			label:SetStateText("You need "..num_regions_needed..cannot_unlock_suffix, "placeholder")
		end
	end,

	setup_pharaoh_button = function(self, faction_key, button, label)
		if not self.config.enable_legitimacy_choice_system then
			button:PropagateVisibility(false)
			return
		end

		if self:hatti_legitimacy_unlocked(faction_key) then
			button:SetState("inactive")
			button:SetProperty("state", "locked")
			label:SetStateText("Egyptian legitimacy locked forever.", "placeholder")
			return
		end

		local can_unlock = self:can_unlock_legitimacy(egypt_legitimacy, faction_key)
		local num_sacred_regions = egypt_legitimacy:num_sacred_regions(faction_key)
		local num_regions_needed_total = self:num_regions_to_unlock_legitimacy(egypt_legitimacy, faction_key)
		local sels_needed = num_regions_needed_total - num_sacred_regions

		self:setup_ruler_button_helper(button, label, can_unlock, sels_needed, " more SELs to unlock egyptian legitimacy!")
	end,

	update_crown_button_tooltip = function(self)
		local local_faction_name = cm:get_local_faction_name(true)
		if not is_string(local_faction_name) then
			return
		end
		local crown_button_component = core:get_ui_root():SequentialFind(legitimacy_choice_config.ui.crown_button_container, legitimacy_choice_config.ui.crown_button_id)
		if not crown_button_component then
			return
		end
		for _, legitimacy_object in ipairs(self.legitimacy_objects) do
			if legitimacy_choice:legitimacy_unlocked(legitimacy_object, local_faction_name) then
				crown_button_component:SetTooltipText(legitimacy_object.config.ui.legacy_button_tooltip, true)
				break
			end
		end
	end,

	setup_great_king_button = function(self, faction_key, button, label)
		if not self.config.enable_legitimacy_choice_system then
			button:PropagateVisibility(false)
			return
		end

		if self:egyptian_legitimacy_unlocked(faction_key) then
			button:SetState("inactive")
			button:SetProperty("state", "locked")
			label:SetStateText("Hittite legitimacy locked forever.", "placeholder")
			return
		end

		local can_unlock = self:can_unlock_legitimacy(hatti_legitimacy, faction_key)
		local num_sacred_regions = hatti_legitimacy:num_sacred_regions(faction_key)
		local num_regions_needed_total = self:num_regions_to_unlock_legitimacy(hatti_legitimacy, faction_key)
		local shls_needed = num_regions_needed_total - num_sacred_regions

		self:setup_ruler_button_helper(button, label, can_unlock, shls_needed, " more SHLs to unlock hittite legitimacy!")
	end,

	is_self_proclaimed_ruler_helper = function(self, faction_key, num_sacred_regions_needed, sacred_regions_table)
		local faction = cm:get_faction(faction_key)
		local num_regions = faction:num_regions()

		if num_regions == 0 then
			return false
		end

		local regions = faction:region_list()
		local num_sacred_regions = 0

		for i = 0, num_regions-1 do
			local region_key = regions:item_at(i):name()
			if sacred_regions_table[region_key] then
				num_sacred_regions = 1 + num_sacred_regions
				if num_sacred_regions > num_sacred_regions_needed then
					return true
				end
			end
		end

		return false
	end,

	on_new_game_started = function(self)
		cm:iterate_factions(function(faction)
			if faction:is_rebel() or faction:is_dead() then
				return
			end

			local faction_key = faction:name()

			if faction:is_human() then
				self.persistent.self_proclamations[faction_key] = {}
			end
		end)

		cm:recursive_iterate(function(region)
			local faction = region:owning_faction()

			if faction:is_human() or faction:is_rebel() or faction:is_dead() then
				-- If the faction is either of these things skip to the next one
				cm:iterate_break()
				return
			end

			local faction_key = faction:name()
			local region_key = region:name()

			for _, legitimacy_object in ipairs(self.legitimacy_objects) do
				local sacred_lands = legitimacy_object.sacred_lands
				if sacred_lands[region_key] then
					self:unlock_legitimacy(legitimacy_object, faction_key)
					return
				end
			end

			-- Go to the next faction
			cm:iterate_break()
		end, cm:model():world(), { "faction_list", "region_list" });
	end,

	has_faction_legitimacy_choice_available = function(self, faction_key)
		local feature_available_turn = feature_unlock.get_feature_unlock_turn_for_faction(faction_key, feature_ids_config.pharaohs_crown)
		if cm:turn_number() < feature_available_turn then
			return false
		end

		local can_unlock_a_legitimacy = false

		for _, legitimacy_object in ipairs(self.legitimacy_objects) do
			if self:legitimacy_unlocked(legitimacy_object, faction_key) then
				return false
			end

			can_unlock_a_legitimacy = can_unlock_a_legitimacy or self:can_unlock_legitimacy(legitimacy_object, faction_key)
		end

		return can_unlock_a_legitimacy
	end,

	setup_resource_costs_ui = function(self, uic, legitimacy_object, faction_key)
		local resource_cost = self:get_resource_cost_for_legitimacy(legitimacy_object, faction_key)

		if not resource_cost then
			uic:SetVisible(false)
			return
		end

		local resources_table = resource_cost:resources()

		local resource_template = uic:SequentialFind("resource_template")

		if not resource_template then
			self:error_message("could not find resource_template!")
			return
		end

		resource_template:SetVisible(false)

		for _, resource_data in ipairs(resources_table) do
			local resource_key = resource_data[1]
			local resource_uic = uic:CreateFromComponent(resource_template:Address(), resource_key)
			resource_uic = UIComponent(resource_uic)

			resource_uic:SetVisible(true)

			local resource_value_uic = resource_uic:SequentialFind("dy_value")
			if resource_value_uic then
				local resource_value = resource_data[2]
				resource_value_uic:SetText(-resource_value)
			end

			local resource_icon_uic = resource_uic:SequentialFind("icon_resource")
			if resource_icon_uic then
				local resource_icon = resource_data[3]
				resource_icon_uic:SetImagePath(resource_icon)
			end
		end
	end,

	on_loading_game = function(self)
		if not self.persistent.unlocked_legitimacies then
			self.persistent.unlocked_legitimacies = {}
		end

		if not self.persistent.self_proclamations then
			self.persistent.self_proclamations = {}
		end
	end,

	id = crown.id,

	notify_mechanics = crown.notify_mechanics,

	send_message_event_to_paths_including = crown.send_message_event_to_paths_including,

	send_message_event_to_paths_excluding = crown.send_message_event_to_paths_excluding,

	error_message = crown.error_message,
}

--------------------------------------------------------------
------------------- Test functions and calls. ----------------
--------------------------------------------------------------

legitimacy_choice.test = {}
legitimacy_choice.test.unlock_legitimacy = function(legitimacy_object, faction_key)
	if not faction_key then
		faction_key = cm:get_local_faction_name(true)
	end

	local faction_obj = cm:get_faction(faction_key)
	if not faction_obj or faction_obj:is_null_interface() then
		out("No faction with key " .. faction_key)
		return
	end

	local sacred_lands_list = legitimacy_object.sacred_lands
	if #sacred_lands_list <= 0 then
		out("Sacred lands list is empty!")
	end

	local num_regions_needed = legitimacy_choice:num_regions_to_unlock_legitimacy(legitimacy_object, faction_key)
	local num_sacred_regions = legitimacy_object:num_sacred_regions(faction_key)
	for i = 1, #sacred_lands_list do
		if num_sacred_regions >= num_regions_needed then
			break
		end

		cm:change_region_owner(sacred_lands_list[i], faction_key)
		num_sacred_regions = legitimacy_object:num_sacred_regions(faction_key)
	end

	legitimacy_choice:unlock_legitimacy(legitimacy_object, faction_key)
end

legitimacy_choice.test.unlock_egyptian_legitimacy = function(faction_key)
	legitimacy_choice.test.unlock_legitimacy(egypt_legitimacy, faction_key)
end

legitimacy_choice.test.unlock_hatti_legitimacy = function(faction_key)
	legitimacy_choice.test.unlock_legitimacy(hatti_legitimacy, faction_key)
end

legitimacy_choice.test.unlock_aegean_legitimacy = function(faction_key)
	legitimacy_choice.test.unlock_legitimacy(aegean_legitimacy, faction_key)
end

legitimacy_choice.test.unlock_meso_legitimacy = function(faction_key)
	legitimacy_choice.test.unlock_legitimacy(meso_legitimacy, faction_key)
end

legitimacy_choice.test.get_enough_sacred_lands_to_self_proclaim = function(faction_key, legitimacy_object)
	if not faction_key then
		faction_key = cm:get_local_faction_name(true)
	end

	if not legitimacy_object then
		for _, _legitimacy_object in ipairs(legitimacy_choice.legitimacy_objects) do
			if not legitimacy_choice:legitimacy_unlocked(_legitimacy_object, faction_key) then
				legitimacy_object = _legitimacy_object
				break
			end
		end
	end

	if not legitimacy_object or legitimacy_choice:legitimacy_unlocked(legitimacy_object, faction_key) then
		out("we've unlocked legitimacy " .. tostring(legitimacy_object.config.id) .. " so this test function will have no effect.")
		return
	end

	local num_regions_needed = legitimacy_object.config.num_sacred_regions_to_conquer
	local num_sacred_regions = legitimacy_object:num_sacred_regions(faction_key)
	local sacred_lands_list = legitimacy_object.sacred_lands
	for i = 1, #sacred_lands_list do
		if num_sacred_regions >= num_regions_needed then
			break
		end

		cm:change_region_owner(sacred_lands_list[i], faction_key)
		num_sacred_regions = legitimacy_object:num_sacred_regions(faction_key)
	end

	out("end turn to get new ancient legacy")
end

return legitimacy_choice
