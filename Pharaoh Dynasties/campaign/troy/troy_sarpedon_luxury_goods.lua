out("Loading troy_sarpedon_luxury_goods.lua")

-- Constants and vars
sarpedon_faction = "troy_main_trj_lycia"
sarpedon_debug_str = "Sarpedon Luxury Goods: "
sarpedon_idols_favour_amount = 20
cost_per_region = 1.2
respawn_value = 100 -- when the total amount of any rare resource in the world hits this number, deposits for that resource are respawned
-- campaign variables
SARPEDON_LUXURY_GOODS_CV = {
	income_per_turn = 1, -- how much to mine from the resources each turn
	spawn_fill_until = 1, -- spawn deposits until they reach this number
	spawn_min_trigger = 5, -- if the number of deposits falls below this number, new should respawn.
}

-- db keys for Sarpedon's luxury resources
minerals_resource_key = "troy_rare_minerals"
metals_resource_key = "troy_rare_metals"
idols_resource_key = "troy_rare_idols"

--- ancillaries from Sarpedon resource usage
resource_ancillaries = {
	["troy_rare_minerals"] = {
		[1] = "troy_main_anc_item_white_granite_amulet",
		[2] = "troy_main_anc_weapon_white_granite_club",
		[3] = "troy_main_anc_item_white_granite_ring",
		[4] = "troy_main_anc_item_white_granite_mosaic"
	},
	["troy_rare_metals"] = {
		[1] = "troy_main_anc_weapon_celestial_iron_dagger",
		[2] = "troy_main_anc_armour_celestial_iron_graves",
		[3] = "troy_main_anc_weapon_celestial_iron_arrow_tips",
		[4] = "troy_main_anc_item_celestial_iron_flute"
	},
	["troy_rare_idols"] = {
		[1] = "troy_main_anc_item_minoan_royal_tablet",
		[2] = "troy_main_anc_item_minoan_necklace",
		[3] = "troy_main_anc_weapon_minoan_relic_axe",
		[4] = "troy_main_anc_item_minoan_relic_figurine"
	}
}

-- Table for restricting the ancillaries from Sarpedon resource usage from certain campaigns
restricted_resource_ancillaries_from_campaigns = 
{
	["troy_historical"] = {
		"troy_main_anc_weapon_celestial_iron_arrow_tips",
		"troy_main_anc_weapon_white_granite_club",
	},
}

function restrict_resource_ancillaries()
	local current_campaign = cm:get_campaign_name()
	if not is_table(restricted_resource_ancillaries_from_campaigns[current_campaign]) then
		return
	end
	for _, ancillaries_per_resource in pairs(resource_ancillaries) do
		for _, ancillary in ipairs(restricted_resource_ancillaries_from_campaigns[current_campaign]) do
			table_erase(ancillaries_per_resource, ancillary)
		end
	end
end

restrict_resource_ancillaries()

resource_icons = {
	troy_rare_minerals = { tooltip_key = "city_info_bar_luxury_good_minerals", icon_path = "UI/skins/default/sp_icon_white_marble.png" },
	troy_rare_metals   = { tooltip_key = "city_info_bar_luxury_good_metals",   icon_path = "UI/skins/default/sp_icon_celestial_iron.png" },
	troy_rare_idols	= { tooltip_key = "city_info_bar_luxury_good_idols",	icon_path = "UI/skins/default/sp_icon_minoan_relics.png" }
}

-- resource factor for resource income
luxury_resource_factor = "troy_mining"

-- config related to spending resource for effect_bundle
sarpedon_spend_resource = {
	using_minerals = false,
	using_metals = false,
	using_idols = false,
}

sarpedon_events = {
	initial_cost = 18,
	factor = "troy_resource_factor_faction",
	bundle_duration = 5,
	minerals_effect_bundle = "effect_bundle_fm_sarpedon_rare_minerals_bundle",
	metals_effect_bundle = "effect_bundle_fm_sarpedon_rare_metals_bundle",
	idols_effect_bundle = "effect_bundle_fm_sarpedon_rare_idols_bundle",
	minerals_incident = "troy_sar_rare_minerals_activated",
	metals_incident = "troy_sar_rare_metals_activated",
	idols_incident = "troy_sar_rare_idols_activated",
	has_enough_resources_incident = "troy_sar_rare_resource_available",
	used = {
		minerals = 0,
		metals = 0,
		idols = 0,
	},
}

-- config related to the resource offer dilemmas
sarpedon_dilemmas = {
	first = "troy_fm_sar_luxury_goods_dilemma_first", -- first dilemma key
	more = "troy_fm_sar_luxury_goods_dilemma_more", -- follow up dilemmas key
	interval = 10, -- interval between folloup dillemas
	start_turn = 20, -- turn on which to start firing the resouces dilemmas for other factions
	turns_passed = {} -- internal table holding a map for which faction, how much turns have passed since the dilemma trigger. Please DO NOT edit manually.
}

-- ui element names for the luxury goods ui
sarpedon_ui = {
	root_panel = "fm_sarpedon_luxury_goods_v2",
	minerals_tab = "icon_resource_1",
	metals_tab = "icon_resource_2",
	idols_tab = "icon_resource_3",
	spend_button = "button_use",
	spend_cost_text = "dy_cost",
	tab_amount = "dy_amount",
	minerals_panel = "dynamic_white_granite",
	metals_panel = "dynamic_celestial_iron",
	idols_panel = "dynamic_minoan_relics",
	cost_icon = "cost_icon"
}

-- internal table, used to track which factions have met sarpedon and check for trade agreements between them and sarpedon
sarpedon_factions_for_first_dilemma = {}
sarpedon_met_factions = {}

sarpedon_resource_incomes = {
	troy_rare_minerals = 0,
	troy_rare_metals = 0,
	troy_rare_idols = 0
}

sarpedon_resource_to_effect_bundle = {
	["troy_rare_minerals"] = "effect_bundle_fm_sarpedon_rare_minerals_bundle",
	["troy_rare_metals"] = "effect_bundle_fm_sarpedon_rare_metals_bundle",
	["troy_rare_idols"] = "effect_bundle_fm_sarpedon_rare_idols_bundle",
}

-- functions

-- hook to start po setup
function SarpedonLuxuryGoods_StartGameSetup()
	SarpedonLuxuryGoods_AddListeners()
	SarpedonLuxuryGoods_UpdateAllCiyInfoBars() -- Update city info bar icons since they do not persist through save/load
end

function shuffle(t)
	local retval = {};
	local table_size = #t;
	local n = 0;

	for i = 1, table_size do
		-- pick an entry from t, add it to retval, then remove it from t
		n = cm:model():random_int(0, #t);
		
		table.insert(retval, t[n]);
		table.remove(t, n);
	end;
	
	return retval;
end

function erase_table(t)
	local count = #t
	for i=0, count do t[i]=nil end
end

function UpdateCityInfoBars(province, resource_key)
	if cm:get_local_faction_name(true) ~= sarpedon_faction then return end 
	local regions_in_province = province:regions()
	if resource_key ~= nil and resource_key ~= "" then
		for i = 0, regions_in_province:num_items() - 1 do
			cm:set_custom_settlement_info_icon(regions_in_province:item_at(i):name(), "icon_luxury_goods", resource_icons[resource_key].icon_path,  resource_icons[resource_key].tooltip_key)
		end
	else
		for i = 0, regions_in_province:num_items() - 1 do
			cm:set_custom_settlement_info_icon_visibility(regions_in_province:item_at(i):name(), "icon_luxury_goods", false)
		end
	end
end

function SpawnPooledResources(province_list)
	out("SpawnPooledResources... ")

	local spawned_mineral = 0
	local spawned_metal = 0
	local spawned_idols = 0
	
	local total_mineral_in_world = 0
	local total_metal_in_world = 0
	local total_idols_in_world = 0

	local should_spawn_mineral = false
	local should_spawn_metal = false
	local should_spawn_idols = false

	for idx, province in ipairs(province_list) do
		total_mineral_in_world = total_mineral_in_world + province:depletable_resource_remaining_amount(minerals_resource_key, sarpedon_faction)
		total_metal_in_world = total_metal_in_world + province:depletable_resource_remaining_amount(metals_resource_key, sarpedon_faction)
		total_idols_in_world = total_idols_in_world + province:depletable_resource_remaining_amount(idols_resource_key, sarpedon_faction)
	end

	if total_mineral_in_world <= respawn_value then
		should_spawn_mineral = true
	end
	if total_metal_in_world <= respawn_value then
		should_spawn_metal = true
	end
	if total_idols_in_world <= respawn_value then
		should_spawn_idols = true
	end

	for idx, province in ipairs(province_list) do
		local left_mineral = province:depletable_resource_remaining_amount(minerals_resource_key, sarpedon_faction)
		local left_metal = province:depletable_resource_remaining_amount(metals_resource_key, sarpedon_faction)
		local left_idols = province:depletable_resource_remaining_amount(idols_resource_key, sarpedon_faction)
		out("Idx: " .. idx .. " " .. province:name() .. " left mineral " .. left_mineral .. "  left metal " .. left_metal .. " left idols " .. left_idols)

		if province:can_spawn_pooled_resource(minerals_resource_key) and left_mineral == 0 and should_spawn_mineral == true and spawned_mineral < 3 then
			cm:province_spawn_pooled_resource(province:name(), minerals_resource_key)
			out("Spawned some minerals. New amount: " .. province:depletable_resource_remaining_amount(minerals_resource_key, sarpedon_faction))
			spawned_mineral = spawned_mineral + 1
			UpdateCityInfoBars(province, minerals_resource_key)
		end

		if province:can_spawn_pooled_resource(metals_resource_key) and left_metal == 0 and should_spawn_metal == true and spawned_metal < 3 then
			cm:province_spawn_pooled_resource(province:name(), metals_resource_key)
			out("Spawned some metals. New amount: " .. province:depletable_resource_remaining_amount(metals_resource_key, sarpedon_faction))
			spawned_metal = spawned_metal + 1
			UpdateCityInfoBars(province, metals_resource_key)
		end

		if province:can_spawn_pooled_resource(idols_resource_key) and left_idols == 0 and should_spawn_idols == true and spawned_idols < 3 then
			cm:province_spawn_pooled_resource(province:name(), idols_resource_key)
			out("Spawned some idols. New amount: " .. province:depletable_resource_remaining_amount(idols_resource_key, sarpedon_faction))
			spawned_idols = spawned_idols + 1
			UpdateCityInfoBars(province, idols_resource_key)
		end
	end
	out("spawned_mineral: " .. spawned_mineral .. " spawned_metal: " .. spawned_metal .. " spawned_idols: " .. spawned_idols)
	if (spawned_mineral + spawned_metal + spawned_idols) ~= 0 then
		cm:show_message_event(
			sarpedon_faction, 
			"event_feed_strings_text_troy_main_fm_sarpedon_precious_resources_respawn_title", 
			"event_feed_strings_text_troy_main_fm_sarpedon_precious_resources_respawn_primary_details", 
			"event_feed_strings_text_troy_main_fm_sarpedon_precious_resources_respawn_secondary_details", -- handled in DB
			true, 
			1095, 
			nil, 
			nil, 
			true)
	end
end

function SarpedonLuxuryGoods_FarmLuxuryResource(province_key, resource_key)
	local income = 0
	for i = 0, province_key:regions():num_items() - 1 do
		local region = province_key:regions():item_at(i)
		if region:owning_faction():name() == sarpedon_faction then
			income = income + SARPEDON_LUXURY_GOODS_CV.income_per_turn
		end
		local building_list = region:settlement():building_list()
		for i = 0, building_list:num_items() - 1 do
			income = income + building_list:item_at(i):get_effect_value("troy_effect_building_exotic_goods")
		end
	end
	cm:faction_add_pooled_resource(sarpedon_faction, resource_key, luxury_resource_factor, income)
	cm:consume_pooled_resource(province_key:name(), resource_key, income)
	sarpedon_resource_incomes[resource_key] = sarpedon_resource_incomes[resource_key] + income
end

function SarpedonLuxuryGoods_FarmEntireResource(province_key, resource_key, amount)
	cm:faction_add_pooled_resource(sarpedon_faction, resource_key, luxury_resource_factor, amount)
	cm:consume_pooled_resource(province_key, resource_key, amount)
end

function SarpedonLuxuryGoods_UpdateAllCiyInfoBars()
	local all_provinces = cm:model():world():province_manager():province_list()
	for i = 0, all_provinces:num_items() - 1 do
		local province = all_provinces:item_at(i)
		local must_hide_icon = true
		if province:depletable_resource_remaining_amount(minerals_resource_key, sarpedon_faction) > 0 then
			UpdateCityInfoBars(province, minerals_resource_key)
			must_hide_icon = false
		end
		if province:depletable_resource_remaining_amount(metals_resource_key, sarpedon_faction) > 0 then
			UpdateCityInfoBars(province, metals_resource_key)
			must_hide_icon = false
		end
		if province:depletable_resource_remaining_amount(idols_resource_key, sarpedon_faction) > 0 then
			UpdateCityInfoBars(province, idols_resource_key)
			must_hide_icon = false
		end
		if must_hide_icon then
			UpdateCityInfoBars(province, nil)
		end
	end
end

function PollRareResources(province_list)
	out("PollRareResources")

	local deposits_info = {
		mineralDeposits = 0,
		metalDeposits = 0,
		idolsDeposits = 0
	}

	sarpedon_resource_incomes.troy_rare_minerals = 0
	sarpedon_resource_incomes.troy_rare_metals = 0
	sarpedon_resource_incomes.troy_rare_idols = 0

	out(sarpedon_debug_str .. " Checking provices for luxury resources...")
	for i = 0, province_list:num_items() - 1 do
		local province = province_list:item_at(i)
		local province_name = province:name()
		local must_hide_icon = true

		if province:depletable_resource_remaining_amount(minerals_resource_key, sarpedon_faction) > 0 then
			deposits_info.mineralDeposits = deposits_info.mineralDeposits + 1
			if province:can_province_provide_income_for_faction(sarpedon_faction) then
				SarpedonLuxuryGoods_FarmLuxuryResource(province, minerals_resource_key)
				--SarpedonLuxuryGoods_FarmEntireResource(province_name, minerals_resource_key, remaining_amounts[province_name][minerals_resource_key])
			end
			UpdateCityInfoBars(province, minerals_resource_key)
			must_hide_icon = false
		end

		if province:depletable_resource_remaining_amount(metals_resource_key, sarpedon_faction) > 0 then
			deposits_info.metalDeposits = deposits_info.metalDeposits + 1
			if province:can_province_provide_income_for_faction(sarpedon_faction) then
				SarpedonLuxuryGoods_FarmLuxuryResource(province, metals_resource_key)
				--SarpedonLuxuryGoods_FarmEntireResource(province_name, metals_resource_key, remaining_amounts[province_name][metals_resource_key])
			end
			UpdateCityInfoBars(province, metals_resource_key)
			must_hide_icon = false
		end

		if province:depletable_resource_remaining_amount(idols_resource_key, sarpedon_faction) > 0 then
			deposits_info.idolsDeposits = deposits_info.idolsDeposits + 1
			if province:can_province_provide_income_for_faction(sarpedon_faction) then
				SarpedonLuxuryGoods_FarmLuxuryResource(province, idols_resource_key)
				--SarpedonLuxuryGoods_FarmEntireResource(province_name, idols_resource_key, remaining_amounts[province_name][idols_resource_key])
			end
			UpdateCityInfoBars(province, idols_resource_key)
			must_hide_icon = false
		end

		if must_hide_icon then
			UpdateCityInfoBars(province, nil)
		end
	end
	out(sarpedon_debug_str .. " mineral deposits: ".. deposits_info.mineralDeposits .. " metal deposits: " .. deposits_info.metalDeposits .. " idols deposits: " .. deposits_info.idolsDeposits)

	local provinces = {};
	for i = 0, province_list:num_items() - 1 do
		provinces[i + 1] = province_list:item_at(i);
	end

	SpawnPooledResources(shuffle(provinces))
end

function SarpedonLuxuryGoods_SpendResource(resource_key)
	local function SpendResourceForEffectBundle(incident_key, resource_key, amount)
		cm:faction_add_pooled_resource(sarpedon_faction, resource_key, sarpedon_events.factor, amount)
		cm:trigger_incident(sarpedon_faction, incident_key, true)

		local ancillary_table = cm:random_sort_copy(resource_ancillaries[resource_key])
		local ancillary
		if #ancillary_table > 0 then
			ancillary = ancillary_table[1]
		else
			out("Error: resource_ancillaries["..resource_key.. "] is empty, no ancillary can be chosen!")
		end

		local sarp_anc_func_impl
		sarp_anc_func_impl = function()
			if ancillary then
				cm:add_ancillary_to_faction(sarpedon_faction, ancillary, true)
			end
		end

		cm:callback(
			sarp_anc_func_impl,
			0.2,
			"add_sarp_anc_impl"
		)

	end

	local faction = cm:get_faction(sarpedon_faction)
	local treasury = faction:pooled_resource(resource_key):value()
	local total_price = math.floor(sarpedon_events.initial_cost + (faction:region_list():num_items()*cost_per_region))
	if total_price <= treasury then
		if resource_key == minerals_resource_key then
			SpendResourceForEffectBundle(sarpedon_events.minerals_incident, resource_key, -total_price)
			sarpedon_events.used.minerals = sarpedon_events.used.minerals + 1
		elseif resource_key == metals_resource_key then
			SpendResourceForEffectBundle(sarpedon_events.metals_incident, resource_key, -total_price)
			sarpedon_events.used.metals = sarpedon_events.used.metals + 1
		elseif resource_key == idols_resource_key then
			SpendResourceForEffectBundle(sarpedon_events.idols_incident, resource_key, -total_price)
			sarpedon_events.used.idols = sarpedon_events.used.idols + 1
			-- we also do some favour shinenigans
			--[[local faction = cm:model():world():faction_by_key(sarpedon_faction)
			local gods = cm:model():world():god_manager():gods()
			for i=0,gods:num_items()-1 do
				if faction:has_pooled_resource(gods:item_at(i):resource_key()) then
					apply_transaction_conflict_and_spawn_event(faction,gods:item_at(i):resource_key(),gods_factors.faction,sarpedon_idols_favour_amount)
				end
			end]]
		end

		core:trigger_event("SarpedonInitiateResource", resource_key)
	end
end

function SarpedonLuxuryGoods_ComponentLClickUp(context, root_panel)
	local l_context = context

	local uic = UIComponent(l_context.component);
	local minerals_panel = find_uicomponent(root_panel, sarpedon_ui.minerals_tab)
	local metals_panel = find_uicomponent(root_panel, sarpedon_ui.metals_tab)
	local idols_panel = find_uicomponent(root_panel, sarpedon_ui.idols_tab)
	local spend_button = find_uicomponent(root_panel, sarpedon_ui.spend_button)
	local cost_icon = find_uicomponent(root_panel, sarpedon_ui.cost_icon)

	if uic:Id() == "icon_resource_1" then
		root_panel:InterfaceFunction('set_effect_bundle', sarpedon_events.minerals_effect_bundle)
		SarpedonLuxuryGoods_UpdateCost(root_panel, minerals_resource_key)
		spend_button:SetProperty("selected_tab", "icon_resource_1")
		minerals_panel:SetState("selected")
		metals_panel:SetState("active")
		idols_panel:SetState("active")
		cost_icon:SetState(minerals_resource_key)
	elseif uic:Id() == "icon_resource_2" then
		root_panel:InterfaceFunction('set_effect_bundle', sarpedon_events.metals_effect_bundle)
		SarpedonLuxuryGoods_UpdateCost(root_panel, metals_resource_key)
		spend_button:SetProperty("selected_tab", "icon_resource_2")
		minerals_panel:SetState("active")
		metals_panel:SetState("selected")
		idols_panel:SetState("active")
		cost_icon:SetState(metals_resource_key)
	elseif uic:Id() == "icon_resource_3" then
		root_panel:InterfaceFunction('set_effect_bundle', sarpedon_events.idols_effect_bundle)
		SarpedonLuxuryGoods_UpdateCost(root_panel, idols_resource_key)
		spend_button:SetProperty("selected_tab", "icon_resource_3")
		minerals_panel:SetState("active")
		metals_panel:SetState("active")
		idols_panel:SetState("selected")
		cost_icon:SetState(idols_resource_key)
	elseif uic:Id() == "button_tick" then
		local selected_tab = spend_button:GetProperty("selected_tab")
		CampaignUI.TriggerCampaignScriptEvent(cm:get_faction(sarpedon_faction):command_queue_index(), "SarpedonLuxuryGoods_Purchase," .. selected_tab)
	end
	SarpedonLuxuryGoods_UpdateUI(false)
end

function SarpedonLuxuryGoods_UpdateCost(panel, resource_key)
	if panel == nil then
		return
	end
	
	local spend_button = find_uicomponent(panel, sarpedon_ui.spend_button)
	local amount = find_uicomponent(panel, sarpedon_ui.spend_cost_text)
	local faction = cm:get_faction(sarpedon_faction)
	local treasury_amount = faction:pooled_resource(resource_key):value()
	local num_regions = faction:region_list():num_items();
	local total_price = math.floor(sarpedon_events.initial_cost + (num_regions*cost_per_region))

	if total_price > treasury_amount or 
		(resource_key == minerals_resource_key and sarpedon_spend_resource.using_minerals or false) or
		(resource_key == metals_resource_key and sarpedon_spend_resource.using_metals or false) or
		(resource_key == idols_resource_key and sarpedon_spend_resource.using_idols or false) then

		spend_button:SetState("inactive")
	else
		spend_button:SetState("active")
	end

	local display_text = tostring(total_price)
	-- local width, height, num_lines = amount:TextDimensionsForText(display_text)
	-- amount:ResizeTextResizingComponentToInitialSize(width, height)
	amount:SetStateText(display_text, "From troy_sarpedon_luxury_goods.lua - unlocalised text")
end

function SarpedonLuxuryGoods_HasEnoughToUseResource(resource_key)
	local faction = cm:get_faction(sarpedon_faction)
	local treasury_amount = faction:pooled_resource(resource_key):value()
	local num_regions = faction:region_list():num_items();
	local total_price = sarpedon_events.initial_cost + (num_regions*cost_per_region)
	if total_price > treasury_amount then
		return false, total_price, treasury_amount
	end
	return true, total_price, treasury_amount
end

function SetPanelAvaliabilityState(is_enough, panel)
	if is_enough then
		panel:SetState("enough");
	else
		panel:SetState("not_enough");
	end
end

function SarpedonLuxuryGoods_UpdateResourcePanels(panel)
	local minerals_panel = find_uicomponent(panel, sarpedon_ui.minerals_panel)
	local metals_panel = find_uicomponent(panel, sarpedon_ui.metals_panel)
	local idols_panel = find_uicomponent(panel, sarpedon_ui.idols_panel)

	local can_use_minerals,_,_ = SarpedonLuxuryGoods_HasEnoughToUseResource(minerals_resource_key)
	SetPanelAvaliabilityState(can_use_minerals, minerals_panel)
	local can_use_metals,_,_ = SarpedonLuxuryGoods_HasEnoughToUseResource(metals_resource_key)
	SetPanelAvaliabilityState(can_use_metals, metals_panel)
	local can_use_idols,_,_ = SarpedonLuxuryGoods_HasEnoughToUseResource(idols_resource_key)
	SetPanelAvaliabilityState(can_use_idols, idols_panel)

	if sarpedon_spend_resource.using_minerals then
		minerals_panel:SetState("being_used");
	end
	if sarpedon_spend_resource.using_metals then
		metals_panel:SetState("being_used");
	end
	if sarpedon_spend_resource.using_idols then
		idols_panel:SetState("being_used");
	end
end

function set_amount(root_panel, resource_key)
	local _,_,amount = SarpedonLuxuryGoods_HasEnoughToUseResource(resource_key)
	local dy_amount = find_uicomponent(root_panel, "dy_amount")

	local display_text = nil
	if resource_key == minerals_resource_key then
		display_text = tostring(amount)
		if sarpedon_resource_incomes.troy_rare_minerals > 0 then
			display_text = tostring(amount) .. " + " .. "[[col:yellow]]" .. tostring(sarpedon_resource_incomes.troy_rare_minerals) .. "[[/col]]"
		end
	elseif resource_key == metals_resource_key then
		display_text = tostring(amount)
		if sarpedon_resource_incomes.troy_rare_metals > 0 then
			display_text = tostring(amount) .. " + " .. "[[col:yellow]]" .. tostring(sarpedon_resource_incomes.troy_rare_metals) .. "[[/col]]"
		end
	else
		display_text = tostring(amount)
		if sarpedon_resource_incomes.troy_rare_idols > 0 then
			display_text = tostring(amount) .. " + " .. "[[col:yellow]]" .. tostring(sarpedon_resource_incomes.troy_rare_idols) .. "[[/col]]"
		end
	end

	-- local width, height, num_lines = dy_amount:TextDimensionsForText(display_text)
	-- dy_amount:ResizeTextResizingComponentToInitialSize(width, height)
	dy_amount:SetStateText(display_text, "From troy_sarpedon_luxury_goods.lua - unlocalised text")
end

function SarpedonLuxuryGoods_UpdateAmounts(panel)
	local minerals_panel = find_uicomponent(panel, sarpedon_ui.minerals_tab)
	local metals_panel = find_uicomponent(panel, sarpedon_ui.metals_tab)
	local idols_panel = find_uicomponent(panel, sarpedon_ui.idols_tab)

   set_amount(minerals_panel, minerals_resource_key)
   set_amount(metals_panel, metals_resource_key)
   set_amount(idols_panel, idols_resource_key)
end

function SarpedonLuxuryGoods_UpdateUI(reset)
	local panel = find_uicomponent(core:get_ui_root(), sarpedon_ui.root_panel)
	if panel and panel:Visible() then

		--local buttons = find_uicomponent(panel, "buttons")
		--buttons:RegisterTopMost()
		SarpedonLuxuryGoods_UpdateResourcePanels(panel)
		SarpedonLuxuryGoods_UpdateAmounts(panel)
		if reset then
			SarpedonLuxuryGoods_UpdateCost(panel, minerals_resource_key)
		end
	end
end

function update_met_factions(sarpedon)
	local met_factions = sarpedon:factions_met()
	for i = 0, met_factions:num_items() - 1 do
		local faction = met_factions:item_at(i)
		if not sarpedon_met_factions[faction:name()] and not sarpedon_dilemmas.turns_passed[faction:name()] then
			sarpedon_met_factions[faction:name()] = faction
			sarpedon_factions_for_first_dilemma[faction:name()] = true
		else
			sarpedon_met_factions[faction:name()] = faction
		end
	end
end

function first_turn_setup(sarpedon)
	if cm:model():turn_number() == 1 then
		local met_factions = sarpedon:factions_met()
		for i = 0, met_factions:num_items() - 1 do
			local faction = met_factions:item_at(i)
			sarpedon_met_factions[faction:name()] = faction
			sarpedon_factions_for_first_dilemma[faction:name()] = true
		end
	end
end



function process_dilemmas(faction)
	local world = cm:model():world()
	local sarpedon = cm:get_faction(sarpedon_faction)
	local faction_key = faction:name()

	-- regardless of the situation, we don't trigger the dilemma for horde factions as they can't benefit from it.
	if not faction:is_allowed_to_capture_territory() then 
		return
	end

	-- check if we reached the correct turn.
	if not (cm:model():turn_number() >= sarpedon_dilemmas.start_turn) then
		return
	end

	out(sarpedon_debug_str .. " Processing Dilemmas for " .. faction_key)
		-- progress dilemmas turn
	if sarpedon_dilemmas.turns_passed[faction_key] then
		sarpedon_dilemmas.turns_passed[faction_key] = sarpedon_dilemmas.turns_passed[faction_key] + 1
	end

	-- trigger first dilemmas
	if sarpedon_factions_for_first_dilemma[faction_key] and faction:is_human() then
		cm:trigger_dilemma(faction_key, sarpedon_dilemmas.first, nil)
		sarpedon_dilemmas.turns_passed[faction_key] = 0;
		sarpedon_factions_for_first_dilemma[faction_key] = nil
	end

	-- trigger secondary dilemmas
	if sarpedon_met_factions[faction_key] and faction:is_human() and sarpedon_dilemmas.turns_passed[faction_key] >= sarpedon_dilemmas.interval and sarpedon:has_trade_agreement_with(faction_key) then
		cm:trigger_dilemma(faction_key, sarpedon_dilemmas.more, nil)
		sarpedon_dilemmas.turns_passed[faction_key] = 0;
	end
end


-- triggers and listeners
function SarpedonLuxuryGoods_AddListeners()
	out("SarpedonLuxuryGoods_AddListeners()")
	-- start of turn listeners

	core:add_listener(
		"SarpedonLuxuryGoods_FactionTurnStart", 
		"FactionTurnStart",
		function(context)
			local faction = context:faction()
			return faction:name() ~= sarpedon_faction and faction:is_human()
		end,
		function(context)
			process_dilemmas(context:faction())
		end,
		true
	)

	core:add_listener(
		"SarpedonLuxuryGoods_FactionTurnStart", 
		"FactionTurnStart",
		function(context)
			return context:faction():name() == sarpedon_faction
		end,
		function(context)
			local sarpedon = cm:get_faction(sarpedon_faction)
			first_turn_setup(sarpedon)
			update_met_factions(sarpedon)

			local provinceList = context:faction():model():world():province_manager():province_list()
			PollRareResources(provinceList)

			if not sarpedon:has_effect_bundle(sarpedon_events.minerals_effect_bundle) then
				sarpedon_spend_resource.using_minerals = false
			end
			if not sarpedon:has_effect_bundle(sarpedon_events.metals_effect_bundle) then
				sarpedon_spend_resource.using_metals = false
			end
			if not sarpedon:has_effect_bundle(sarpedon_events.idols_effect_bundle) then
				sarpedon_spend_resource.using_idols = false
			end

			-- if sarpedon is AI
			if not sarpedon:is_human() then
				local can_use, total_price,_ = SarpedonLuxuryGoods_HasEnoughToUseResource(minerals_resource_key)
				if can_use and not sarpedon:has_effect_bundle(sarpedon_events.minerals_effect_bundle) then
					cm:faction_add_pooled_resource(sarpedon_faction, minerals_resource_key, sarpedon_events.factor, -total_price)
					cm:apply_effect_bundle(sarpedon_events.minerals_effect_bundle, sarpedon_faction, sarpedon_events.bundle_duration)
					out(sarpedon_debug_str .. "AI Sarpedon used rare minerals for effect bundle!")
				end

				can_use, total_price,_ = SarpedonLuxuryGoods_HasEnoughToUseResource(metals_resource_key)
				if can_use and not sarpedon:has_effect_bundle(sarpedon_events.metals_effect_bundle) then
					cm:faction_add_pooled_resource(sarpedon_faction, metals_resource_key, sarpedon_events.factor, -total_price)
					cm:apply_effect_bundle(sarpedon_events.metals_effect_bundle, sarpedon_faction, sarpedon_events.bundle_duration)
					out(sarpedon_debug_str .. "AI Sarpedon used rare metals for effect bundle!")
				end

				can_use, total_price,_ = SarpedonLuxuryGoods_HasEnoughToUseResource(idols_resource_key)
				if can_use and not sarpedon:has_effect_bundle(sarpedon_events.idols_effect_bundle) then
					cm:faction_add_pooled_resource(sarpedon_faction, idols_resource_key, sarpedon_events.factor, -total_price)
					cm:apply_effect_bundle(sarpedon_events.idols_effect_bundle, sarpedon_faction, sarpedon_events.bundle_duration)
					out(sarpedon_debug_str .. "AI Sarpedon used rare idols for effect bundle!")
				end
			end
		end,
		true
	)

	-- faction met other faction listener
	core:add_listener(
		"SarpedonLuxuryGoods_FactionEncounteredOtherFaction",
		"FactionEncountersOtherFaction",
		function(context)
			return context:faction():name() == sarpedon_faction end,
		function(context)
			local other_faction = context:other_faction()
			if not other_faction:is_dead() and
				not other_faction:is_rebel() and
				not other_faction:home_region():is_null_interface() and
				other_faction:is_human() and
				cm:model():turn_number() >= sarpedon_dilemmas.start_turn then

				sarpedon_factions_for_first_dilemma[other_faction:name()] = true
			end
		end,
		true
	)

	core:add_listener(
		"SarpedonLuxuryGoods_RegionFactionChangeEvent",
		"RegionFactionChangeEvent",
		function(context)
			if context:region():owning_faction():name() == sarpedon_faction or context:previous_faction():name() == sarpedon_faction then
				return true
			end
			return false
		end,
		function(context)
			sarpedon_resource_incomes.troy_rare_minerals = 0
			sarpedon_resource_incomes.troy_rare_metals = 0
			sarpedon_resource_incomes.troy_rare_idols = 0

			local province_list = context:previous_faction():model():world():province_manager():province_list()
			local remaining_amounts = {}
			out(sarpedon_debug_str .. " Checking provices for luxury resources for income")
			for i = 0, province_list:num_items() - 1 do
				local province = province_list:item_at(i)
				local province_name = province:name()

				if province:depletable_resource_remaining_amount(minerals_resource_key, sarpedon_faction) > 0 then
					if province:can_province_provide_income_for_faction(sarpedon_faction) then
						sarpedon_resource_incomes.troy_rare_minerals = sarpedon_resource_incomes.troy_rare_minerals + 1
					end
				end

				if  province:depletable_resource_remaining_amount(metals_resource_key, sarpedon_faction) > 0 then
					if province:can_province_provide_income_for_faction(sarpedon_faction) then
						sarpedon_resource_incomes.troy_rare_metals = sarpedon_resource_incomes.troy_rare_metals + 1
					end
				end

				if province:depletable_resource_remaining_amount(idols_resource_key, sarpedon_faction) > 0 then
					if province:can_province_provide_income_for_faction(sarpedon_faction) then
						sarpedon_resource_incomes.troy_rare_idols = sarpedon_resource_incomes.troy_rare_idols + 1
					end
				end
			end
		end,
		true
	)

	core:add_listener(
		"SarpedonLuxuryGoods_OtherFactionAncillariesFromDilemma",
		"DilemmaChoiceMadeEvent",
		function(context)
			if context:faction():name() ~= sarpedon_faction then
				return context:dilemma() == sarpedon_dilemmas.first or context:dilemma() == sarpedon_dilemmas.more
			end
		end,
		function(context)
			local faction = context:faction():name()
			local choice = context:choice() + 1
			local sarp_anc_func_impl
			local ancillary
			local resource_keys = { minerals_resource_key, idols_resource_key, metals_resource_key }
			if choice >= 1 and choice <= #resource_keys then
				if #resource_ancillaries[resource_keys[choice]] > 0 then
					local ancillary_table = cm:random_sort_copy(resource_ancillaries[resource_keys[choice]])
					ancillary = ancillary_table[1]
				else
					out("Error: resource_ancillaries["..resource_keys[choice].. "] is empty, no ancillary can be chosen!")
				end
			end

			if ancillary then
				sarp_anc_func_impl = function()
					cm:add_ancillary_to_faction(faction, ancillary, true)
				end
				cm:callback(
					sarp_anc_func_impl, 
					0.2, 
					"add_sarp_anc_impl"
				)
			end
		end,
		true
	)

	-- panel open
	core:add_listener(
		"SarpedonLuxuryGoods_PanelOpenedCampaign",
		"PanelOpenedCampaign",
		function(context) return context.string == sarpedon_ui.root_panel end,
		function(context)
			local panel = find_uicomponent(core:get_ui_root(), sarpedon_ui.root_panel)

			core:add_listener(
				"SarpedonLuxuryGoods_ComponentLClickUp",
				"ComponentLClickUp", 
				true,
				function(context)
					SarpedonLuxuryGoods_ComponentLClickUp(context, panel)
				end, 
				true
			);

			--SarpedonLuxuryGoods_UpdateUI(true)
			local minerals_panel = panel:SequentialFind(sarpedon_ui.minerals_tab)
			if minerals_panel then
				minerals_panel:SimulateLClick()
			end
		end,
		true
	)

	-- panel closed
	core:add_listener(
		"SarpedonLuxuryGoods_PanelClosedCampaign",
		"PanelClosedCampaign",
		function(context) return context.string == sarpedon_ui.root_panel end,
		function(context)
			core:remove_listener("SarpedonLuxuryGoods_ComponentLClickUp");
		end,
		true
	)
	
	core:add_listener(
		"SarpedonLuxuryGoods_Purchase_ScriptEvent",
		"UITriggerScriptEvent",
		function(context)
			local args = split_str(context:trigger(), ",")
			return args[1] == "SarpedonLuxuryGoods_Purchase"
		end,
		function(context)
			local args = split_str(context:trigger(), ",")
			local selected_tab = args[2]

			if selected_tab == "icon_resource_1" then
				out("spend minerals")
				sarpedon_spend_resource.using_minerals = true
				SarpedonLuxuryGoods_SpendResource(minerals_resource_key)
				SarpedonLuxuryGoods_UpdateCost(root_panel, minerals_resource_key)
			elseif selected_tab == "icon_resource_2" then
				out("spend metal")
				sarpedon_spend_resource.using_metals = true
				SarpedonLuxuryGoods_SpendResource(metals_resource_key)
				SarpedonLuxuryGoods_UpdateCost(root_panel, metals_resource_key)
			elseif selected_tab == "icon_resource_3"then
				out("spend idol")
				sarpedon_spend_resource.using_idols = true
				SarpedonLuxuryGoods_SpendResource(idols_resource_key)
				SarpedonLuxuryGoods_UpdateCost(root_panel, idols_resource_key)
			end
		end,
		true
	)
end

function sarpedon_faction_active(faction_name)
	return faction_name == sarpedon_faction
end

function sarpedon_available_resources()
	local faction = cm:get_faction(sarpedon_faction)
	local treshold = sarpedon_events.initial_cost + (faction:region_list():num_items()*cost_per_region)

	for _,resource_key in pairs( { minerals_resource_key, metals_resource_key, idols_resource_key} ) do
		local treasury = faction:pooled_resource(resource_key):value()
		if treasury >= treshold and not faction:has_effect_bundle(sarpedon_resource_to_effect_bundle[resource_key]) then
			return true
		end
	end

	return false
end
--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------

-- Faction scripting interfaces cannot be saved and loaded, so we save only the faction keys and remap them to interfaces again after loading.
function sarpedon_convert_met_factions_for_saving(faction_interface_list)
	local converted_list = {}
	for k, _ in pairs(faction_interface_list) do
		table.insert(converted_list, k)
	end
	return converted_list
end

function sarpedon_convert_met_factions_after_loading(faction_key_list)
	local converted_list = {}
	local world = cm:model():world()
	for _, v in ipairs(faction_key_list) do
		converted_list[v] = world:faction_by_key(v)
	end
	return converted_list
end

core:add_listener(
	"SarpedonLuxuryGoods_FirstTickAfterWorldCreated",
	"FirstTickAfterWorldCreated",
	true,
	function(context)
		-- While loading, there is still no WORLD object, so we have to remap the faction keys on the first tick after it is created.
		sarpedon_met_factions = {}
		local world = cm:model():world()
		for _, v in ipairs(sarpedon_met_factions_temp) do
			sarpedon_met_factions[v] = world:faction_by_key(v)
		end
	end,
	true
)

cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("TROY_SARPEDON_MET_FACTIONS", sarpedon_convert_met_factions_for_saving(sarpedon_met_factions), context)
		cm:save_named_value("TROY_SARPEDON_DILEMMAS_FACTIONS_TURNS_PASSED", sarpedon_dilemmas.turns_passed, context)
		cm:save_named_value("TROY_SARPEDON_RESOURCE_INCOMES", sarpedon_resource_incomes, context)
		cm:save_named_value("TROY_SARPEDON_RESOURCE_SPENDS", sarpedon_spend_resource, context)
		cm:save_named_value("TROY_SARPEDON_FACTIONS_FOR_FIRST_DILEMMA", sarpedon_factions_for_first_dilemma, context)
		cm:save_named_value("TROY_SARPEDON_RESOURCES_BUNDLES_ACTIVATED", sarpedon_events.used, context)

	end
)

cm:add_loading_game_callback(
	function(context)
		sarpedon_resource_incomes	   = cm:load_named_value("TROY_SARPEDON_RESOURCE_INCOMES", sarpedon_resource_incomes, context)
		sarpedon_spend_resource		 = cm:load_named_value("TROY_SARPEDON_RESOURCE_SPENDS", sarpedon_spend_resource, context)
		sarpedon_met_factions_temp	  = cm:load_named_value("TROY_SARPEDON_MET_FACTIONS", {}, context)
		sarpedon_dilemmas.turns_passed  = cm:load_named_value("TROY_SARPEDON_DILEMMAS_FACTIONS_TURNS_PASSED", sarpedon_dilemmas.turns_passed, context)
		sarpedon_events.used			= cm:load_named_value("TROY_SARPEDON_RESOURCES_BUNDLES_ACTIVATED", sarpedon_events.used, context)
		sarpedon_factions_for_first_dilemma = cm:load_named_value("TROY_SARPEDON_FACTIONS_FOR_FIRST_DILEMMA", sarpedon_factions_for_first_dilemma, context)
	end
)

