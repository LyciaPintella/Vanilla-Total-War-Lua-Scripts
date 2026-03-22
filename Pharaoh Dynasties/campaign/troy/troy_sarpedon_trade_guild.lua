-- define sarpedon religion key
local sarpedon_religion = "troy_main_inf_lelegan"

-- define sarpedon max actions per faction per turn
local max_actions_per_faction = 1

-- define sarpedon gain exotic good params
local gain_exotic_goods_per_deposit = 5
local price_exotic_goods_per_deposit = 20

-- define trade cost resource
local trade_cost_key = "troy_gold"

-- define sarpedon agreement actions
local break_agreement_base_price = 20
local break_agreement_per_region_price = 1
local steal_agreement_base_price = 20
local steal_agreement_per_region_price = 1

-- define adding influence to other provinces
local sarpedon_influence_value = 4
local sarpedon_influence_per_barter_units = 20
local single_barter_duration = 2

-- define adding influence bundle data: influence effect, bundle time
local sarpedon_influence_bundle_effect = "troy_effect_fm_lelegan_religion_influence"
local sarpedon_influence_bundle_duration = 8

-- define faction list average influence levels
-- the values determine component string states: "5_to_10"...
local faction_influnce_levels = { 5, 10, 20, 30 }

-- used to determine when to restore barters between two factions, after we have forced them off
local force_barters_off_duration = 5
--table for saving and loading data, required to restore barters between two factions
save_data_barters = {}

---------------------------------------------------------------------------------------------------
--
---------------------------------------------------------------------------------------------------

local selected_faction = ""

-- influnced by sarpedon religion factions
local faction_data = {}

-- actions per faction for current turn
-- the table clears every start of turn
local actions_per_faction = {}

function dump_tbl(o)
	if type(o) == 'table' then
		local s = '{ '
		local skip_comma = true
		for k,v in pairs(o) do
			if skip_comma then skip_comma = false else s = s..', ' end
			if type(k) ~= 'number' then k = '"'..k..'"' end
			s = s..'['..k..'] = '..dump(v)
		end
		return s .. '} '
	else
		return tostring(o)
	end
end

function achilles_best_buds()
	cm:cai_strategic_stance_manager_block_all_stances_but_that_specified_towards_target_faction("troy_main_trj_lycia", "troy_main_dan_achilles", "CAI_STRATEGIC_STANCE_BEST_FRIENDS")
	cm:cai_strategic_stance_manager_block_all_stances_but_that_specified_towards_target_faction("troy_main_dan_achilles", "troy_main_trj_lycia", "CAI_STRATEGIC_STANCE_BEST_FRIENDS")
	cm:cai_strategic_stance_manager_force_stance_update_between_factions("yes","troy_main_dan_achilles", "troy_main_trj_lycia")
end

-- generate a state string for a faction list item
function get_state_by_influence(influence)
	for i=1, #faction_influnce_levels do
		local ii = (i < #faction_influnce_levels and i+1 or nil)
		if influence >= faction_influnce_levels[i] and (ii == nil or influence < faction_influnce_levels[ii]) then
			return faction_influnce_levels[i]..(ii and "_to_" or "")..(ii and faction_influnce_levels[ii] or "_and_higher"),i
		end
	end

	return "inactive", 0
end

function fill_influenced_factions_list()
	out("FILL FACTION LIST")

	faction_data = {}
	selected_faction = ""

	local panel = core:get_ui_root():SequentialFind("fm_lycian_trade_guild")
	if not panel then
		return
	end

	local component_list = panel:SequentialFind("sortable_list_factions", "list_box")
	if not component_list then
		return
	end

	local component_template = component_list:SequentialFind("row")
	if not component_template then
		return
	end

	component_list:Divorce(component_template:Address())

	component_list:StallLayouts(true)

	local faction_list = cm:model():world():faction_list()

	local first_entry

	for i = 0, faction_list:num_items() - 1 do
		local faction = faction_list:item_at(i)
		local faction_name = faction:name()

		local available = panel:InterfaceFunction("can_negotiate_with", faction_name, true)

		if faction_name ~= sarpedon_faction and available then

			local influence = faction:average_religion_proportion(sarpedon_religion)
			faction_data[faction_name] = influence

			if influence and influence.current and influence.current >= faction_influnce_levels[1] then

				if selected_faction == "" then
					selected_faction = faction_name
				end

				local faction_entry = UIComponent(component_list:CreateFromComponent(component_template:Address(), "faction_entry_"..i))

				if first_entry == nil then
					first_entry = faction_entry
				end

				faction_entry:SetProperty("faction", faction_name)

				local com = faction_entry:SequentialFind("influence")
				if com then
					local state,_ = get_state_by_influence(influence.current)
					com:SetState(state)

					local val = com:SequentialFind("influence_value")
					if val then
						val:SetText(string.format("%.1f", influence.current).."%")
					end
				end

				com = faction_entry:SequentialFind("name")
				if com then
					local screen_name = common.get_localised_string("factions_screen_name_" .. faction_name)
					com:SetText(screen_name)
				end

				com = faction_entry:SequentialFind("mon")
				if com then
					com:SetImagePath(faction:flag_path().."\\mon_24.png")
				end

				com = faction_entry:SequentialFind("attitude")
				if com then
					com:SetState(faction:attitude_category_with(sarpedon_faction))
					com:SetProperty("sort_value", faction:attitude_with(sarpedon_faction))
					com:InterfaceFunction("set_faction", faction_name)
				end

				faction_entry:SetVisible(true)
			end
		end
	end

	component_list:StallLayouts(false)
	component_list:Layout()
	component_list:SetVisible(selected_faction ~= "")

	local no_factions = panel:SequentialFind("sortable_list_factions", "tx_info_if_empty")
	if no_factions then
		no_factions:SetVisible(selected_faction == "")
	end

	local options_list = panel:SequentialFind("options_list")
	if options_list then
		options_list:SetVisible(selected_faction ~= "")
	end

	if first_entry then
		first_entry:SimulateLClick()
	end
end

function fill_selected_faction_options(faction_name)
	out("FILL SELECTED FACTION DATA FOR: "..faction_name)

	local panel = core:get_ui_root():SequentialFind("fm_lycian_trade_guild")
	if not panel then
		return
	end

	-- exotic goods
	local faction = cm:get_faction(faction_name)
	local multi_disabled = faction:is_human()

	local goods = faction and faction:exotic_goods() or nil

	local resources = panel:SequentialFind("resources")
	if resources then
		local com = resources:SequentialFind("resource_1", "dy_amount")
		if com then
			com:SetText(goods and goods.minerals or "0")
		end

		com = resources:SequentialFind("resource_2", "dy_amount")
		if com then
			com:SetText(goods and goods.metals or "0")
		end

		com = resources:SequentialFind("resource_3", "dy_amount")
		if com then
			com:SetText(goods and goods.idols or "0")
		end
	end

	-- ask for exotic goods
	local ask_row = panel:SequentialFind("luxury_res_button_row")
	if ask_row then
		local deposits = (goods and goods.minerals > 0 and goods.mineral_deposits or 0) +
						 (goods and goods.metals > 0 and goods.metal_deposits or 0) +
						 (goods and goods.idols > 0 and  goods.idol_deposits or 0)

		local price = deposits * price_exotic_goods_per_deposit

		local com = ask_row:SequentialFind("dy_cost")
		if com then
			com:SetText(price)
			com:SetProperty("price", price)
		end

		com = ask_row:SequentialFind("mine_deposits_button")
		if com then
			com:SetProperty("faction", faction_name)
			com:SetProperty("price", price)

			-- minerals
			local minerals = goods and goods.minerals > 0 and math.min(goods.minerals, goods.mineral_deposits * gain_exotic_goods_per_deposit) or 0
			com:SetProperty("minerals", minerals)
			-- metals
			local metals = goods and goods.metals > 0 and math.min(goods.metals, goods.metal_deposits * gain_exotic_goods_per_deposit) or 0
			com:SetProperty("metals", metals)
			--idols
			local idols = goods and goods.idols > 0 and math.min(goods.idols, goods.idol_deposits * gain_exotic_goods_per_deposit) or 0
			com:SetProperty("idols", idols)
		end

		ask_row:SetVisible(price > 0)
	end

	-- barter agreements
	local barter_list = panel:SequentialFind("barter_agreement_listview", "list_box")
	local barter_template = panel:SequentialFind("barter_agreement_listview", "barter_agreement_block_template")

	if barter_list and barter_template then
		barter_template:SetVisible(false)
		barter_list:DestroyChildren()

		local valid_barters = 0
		local all_faction_barters = faction and faction:barter_agreements("_medium") or {}

		out("\n\nSARPEDON TRADE GUILD: agreements: \n"..dump_tbl(all_faction_barters).."\n")

		barter_list:StallLayouts(true)

		for bfaction_name, bfaction_barters in pairs(all_faction_barters) do

			local barter_faction = cm:get_faction(bfaction_name)

			for index, barter in pairs(bfaction_barters) do
				valid_barters = valid_barters + 1
				
				local barter_entry = UIComponent(barter_list:CreateFromComponent(barter_template:Address(), "barter_"..bfaction_name.."_"..index))

				local com = barter_entry:SequentialFind("dy_faction_name")
				if com then
					local screen_name = common.get_localised_string("factions_screen_name_" .. bfaction_name)
					com:SetText(screen_name)
				end

				com = barter_entry:SequentialFind("mon")
				if com then
					com:SetImagePath(barter_faction:flag_path().."\\mon_24.png")
				end

				com = barter_entry:SequentialFind("dy_turns_value")
				if com then
					com:SetText(barter.turns or "0")
				end

				-- exports
				local column_sold = barter_entry:SequentialFind("exports_column_template")
				if column_sold then
					local sold_template = column_sold:SequentialFind("resource_row_template")
					if sold_template then
						column_sold:Divorce(sold_template:Address())

						column_sold:StallLayouts(true)

						for i,sold in ipairs(barter.sold) do
							local sold_entry = UIComponent(column_sold:CreateFromComponent(sold_template:Address(), sold.resource))

							local com = sold_entry:SequentialFind("icon_resource")
							if com then
								com:SetImagePath(sold.icon)
								if bfaction_name == sarpedon_faction then
									com:SetState("no_tooltip")
								end
							end

							com = sold_entry:SequentialFind("dy_resource")
							if com then
								com:SetText(sold.value)
							end
						end

						column_sold:StallLayouts(false)
						column_sold:Layout()
					end
				end

				-- imports
				local column_bought = barter_entry:SequentialFind("imports_column_template")
				if column_bought then
					local bought_template = column_bought:SequentialFind("resource_row_template")
					if bought_template then
						column_bought:Divorce(bought_template:Address())

						column_bought:StallLayouts(true)

						for i,bought in ipairs(barter.bought) do
							local bought_entry = UIComponent(column_bought:CreateFromComponent(bought_template:Address(), bought.resource))

							local com = bought_entry:SequentialFind("icon_resource")
							if com then
								com:SetImagePath(bought.icon)
								if bfaction_name == sarpedon_faction then
									com:SetState("no_tooltip")
								end
							end

							com = bought_entry:SequentialFind("dy_resource")
							if com then
								com:SetText(bought.value)
							end
						end

						column_bought:StallLayouts(false)
						column_bought:Layout()
					end
				end
				
				if next(barter.sold) == nil or next(barter.bought) == nil then
					com = barter_entry:SequentialFind("tx_for")
					com:SetState("gift")
				end

				if bfaction_name == sarpedon_faction then
					local break_barter_row = barter_entry:SequentialFind("break_button_row")
					if break_barter_row then
						break_barter_row:SetVisible(false)
					end

					local steal_barter_row = barter_entry:SequentialFind("steal_button_row")
					if steal_barter_row then
						steal_barter_row:SetVisible(false)
					end
				else
					local num_regions = faction:num_regions()
					local attitude = faction:attitude_with(sarpedon_faction)

					-- break price
					local bprice = break_agreement_base_price + (num_regions * break_agreement_per_region_price)
					if attitude < 0 then
						bprice = bprice * 2
					end

					local break_price = barter_entry:SequentialFind("break_button_row", "dy_cost")
					if break_price then
						break_price:SetText(bprice)
						break_price:SetProperty("price", bprice)
						--actions disabled and price not visible for human player factions
						if multi_disabled or barter_faction:is_human() then
							break_price:SetVisible(false)
						end
					end

					-- break button
					local break_barter_btn = barter_entry:SequentialFind("break_button_row", "break_agreement_button")
					if break_barter_btn then
						break_barter_btn:SetProperty("faction", faction_name)
						break_barter_btn:SetProperty("barter_faction", bfaction_name)
						break_barter_btn:SetProperty("barter_index", barter.index)
						break_barter_btn:SetProperty("price", bprice)
						--actions disabled and price not visible for human player factions
						if multi_disabled or barter_faction:is_human() then
							break_barter_btn:SetProperty("multi_disabled", "true")
						end
						
					end

					-- steal price
					local sprice = steal_agreement_base_price + (num_regions * steal_agreement_per_region_price)
					if attitude < 0 then
						sprice = sprice * 2
					end

					local steal_price = barter_entry:SequentialFind("steal_button_row", "dy_cost")
					if steal_price then
						steal_price:SetText(sprice)
						steal_price:SetProperty("price", sprice)
						--actions disabled and price not visible for human player factions
						if multi_disabled or barter_faction:is_human() then
							steal_price:SetVisible(false)
						end
					end

					-- steal button
					local steal_barter_btn = barter_entry:SequentialFind("steal_button_row", "steal_agreement_button")
					if steal_barter_btn then
						steal_barter_btn:SetProperty("faction", faction_name)
						steal_barter_btn:SetProperty("barter_faction", bfaction_name)
						steal_barter_btn:SetProperty("barter_index", barter.index)
						steal_barter_btn:SetProperty("price", sprice)
						--actions disabled and price not visible for human player factions
						if multi_disabled or barter_faction:is_human() then
							steal_barter_btn:SetProperty("multi_disabled", "true")
						end
					end
				end

				barter_entry:SetVisible(true)
			end

		end

		barter_list:StallLayouts(false)
		barter_list:Layout()

		out("VALID BARTERS: "..valid_barters)

		local com = panel:SequentialFind("options_list", "barter_agreement_list_title")
		if com then
			com:SetVisible(valid_barters > 0)
		end

		com = panel:SequentialFind("barter_agreement_listview", "tx_when_empty")
		if com then
			com:SetVisible(valid_barters == 0)
		end
	end

	update_available_actions(faction_name)
end

function on_action_exotic_goods(faction_name, price)
	out("ON ACTION EXOTIC GOODS")

	if not available_actions_for(faction_name) then
		return
	end

	local cost = tonumber(price)
	if cost <= 0 then
		return
	end

	local treasury = cm:get_faction(sarpedon_faction):pooled_resource(trade_cost_key):value()
	if treasury < cost then
		return
	end

	-- sarpedon pays
	cm:faction_add_pooled_resource(sarpedon_faction, trade_cost_key, "trade", -cost)

	-- goods exchange
	local gain_minerals = 0
	local gain_metals = 0
	local gain_idols = 0

	-- subtract from deposits and sum for sarpedon gaining
	local faction = cm:get_faction(faction_name)
	local provinces = faction:province_list()
	for i = 0, provinces:num_items() - 1 do
		local province = provinces:item_at(i)

		local minerals = math.min(gain_exotic_goods_per_deposit, province:depletable_resource_remaining_amount(minerals_resource_key, faction_name))
		if minerals > 0 then
			cm:consume_pooled_resource(province:name(), minerals_resource_key, minerals)
			gain_minerals = gain_minerals + minerals
		end

		local metals = math.min(gain_exotic_goods_per_deposit, province:depletable_resource_remaining_amount(metals_resource_key, faction_name))
		if metals > 0 then
			cm:consume_pooled_resource(province:name(), metals_resource_key, metals)
			gain_metals = gain_metals + metals
		end

		local idols = math.min(gain_exotic_goods_per_deposit, province:depletable_resource_remaining_amount(idols_resource_key, faction_name))
		if idols > 0 then
			cm:consume_pooled_resource(province:name(), idols_resource_key, idols)
			gain_idols = gain_idols + idols
		end
	end

	local eventid = 2063
	local num_parameters = 0

	local params = {
		{},
		{},
		{}
	}
	
	-- add to sarpedon resources
	if gain_minerals > 0 then
		cm:faction_add_pooled_resource(sarpedon_faction, minerals_resource_key, "troy_resource_factor_faction", gain_minerals)
		
		local key = "pooled_resources_display_name_" .. minerals_resource_key
		num_parameters = num_parameters + 1
		params[num_parameters] = {
			n = gain_minerals,
			s = key
		}
	end

	if gain_metals > 0 then
		cm:faction_add_pooled_resource(sarpedon_faction, metals_resource_key, "troy_resource_factor_faction", gain_metals)
		
		local key = "pooled_resources_display_name_" .. metals_resource_key
		num_parameters = num_parameters + 1
		params[num_parameters] = {
			n = gain_metals,
			s = key
		}
	end

	if gain_idols > 0 then
		cm:faction_add_pooled_resource(sarpedon_faction, idols_resource_key, "troy_resource_factor_faction", gain_idols)
		
		local key = "pooled_resources_display_name_" .. idols_resource_key
		num_parameters = num_parameters + 1
		params[num_parameters] = {
			n = gain_idols,
			s = key
		}
	end

	add_action_for(faction_name)
	
	if numnum_parameters == 0 then
		eventid = 2063
	elseif num_parameters == 1 then
		eventid = 2064
	elseif num_parameters == 2 then
		eventid = 2065
	elseif num_parameters == 3 then
		eventid = 2066
	end

	cm:show_configurable_message_event(
		sarpedon_faction,
		"event_feed_strings_text_troy_main_fm_lycian_guild_title",
		"event_feed_strings_text_troy_main_fm_lycian_guild_exotic_goods_title",
		"event_feed_strings_text_troy_main_fm_lycian_guild_exotic_goods_desc_additional",
		eventid,
		params[1].n,
		params[2].n,
		params[3].n,
		params[1].s,
		params[2].s,
		params[3].s
	)

	fill_selected_faction_options(faction_name)
end

function on_action_barter(action, faction, barter_faction, barter_index, price)
	out("ON ACTION BARTER: "..action)

	if not available_actions_for(faction) then
		return
	end

	cm:faction_add_pooled_resource(sarpedon_faction, trade_cost_key, "trade", -tonumber(price))

	cm:force_diplomacy("faction:"..faction,"faction:"..barter_faction,"single barters", false, false, true, false)
	cm:force_diplomacy("faction:"..faction,"faction:"..barter_faction,"barter agreements", false, false, true, false)

	local data_to_insert = {
		faction_name = faction,
		barter_faction_name = barter_faction,
		turn = cm:model():turn_number() + force_barters_off_duration
	}
	table.insert(save_data_barters, data_to_insert)

	if action == "action_break_agreement" then
		
		cm:cancel_barter_agreement(faction, barter_faction, tonumber(barter_index), true)

		cm:show_configurable_message_event(
			sarpedon_faction,
			"event_feed_strings_text_troy_main_fm_lycian_guild_title",
			"event_feed_strings_text_troy_main_fm_lycian_guild_break_agreement_title",
			"",
			2067,
			nil,
			nil,
			nil,
			"factions_screen_name_" .. faction,
			"factions_screen_name_" .. barter_faction
		)

		--
		achievements.barters.func_barter_interrupted(cm:get_faction(sarpedon_faction), false)

	elseif action == "action_steal_agreement" then
		cm:force_diplomacy("faction:"..faction,"faction:"..sarpedon_faction,"cancel barters", false, false, false, false)

		cm:steal_barter_agreement(faction, barter_faction, sarpedon_faction, tonumber(barter_index))

		cm:show_configurable_message_event(
			sarpedon_faction,
			"event_feed_strings_text_troy_main_fm_lycian_guild_title",
			"event_feed_strings_text_troy_main_fm_lycian_guild_steal_agreement_title",
			"",
			2068,
			nil,
			nil,
			nil,
			"factions_screen_name_" .. faction,
			"factions_screen_name_" .. barter_faction
		)

		local steal_faction = cm:get_faction(sarpedon_faction)

		core:trigger_event("StealBarterAgreement", steal_faction)

		achievements.barters.func_barter_interrupted(steal_faction, true)
	else
		return

	end

	add_action_for(faction)

	-- refresh the state via 'NegativeDiplomaticEvent'
end

function update_available_actions(faction_name)
	local available_actions = available_actions_for(faction_name)

	out("ON UPDATE AVAILABLE ACTIONS FOR: "..faction_name)

	local panel = core:get_ui_root():SequentialFind("fm_lycian_trade_guild")
	if not panel then
		return
	end

	local influence = faction_data[faction_name]
	local _,state_value = get_state_by_influence(influence and influence.current or 0)
	local treasury = cm:get_faction(sarpedon_faction):pooled_resource(trade_cost_key):value()

	-- ask for exotic goods
	local ask_row = panel:SequentialFind("luxury_res_button_row")
	if ask_row then

		local ask_btn = ask_row:SequentialFind("mine_deposits_button")
		if ask_btn then
			local price = tonumber(ask_btn:GetProperty("price") or "0")
			local state = available_actions and state_value > 1 and treasury >= price and "active" or "inactive"

			ask_btn:SetState(state)

			if not available_actions then
				ask_btn:SetTooltipText(common.get_localised_string("campaign_localised_strings_string_troy_main_fm_lycian_trade_guild_button_tooltip_used_this_turn"), "troy_main_fm_lycian_trade_guild_button_tooltip_used_this_turn", true)
			elseif state_value <= 1 then
				ask_btn:SetTooltipText(common.get_localised_string("campaign_localised_strings_string_troy_main_fm_lycian_trade_guild_button_tooltip_no_influence"), "troy_main_fm_lycian_trade_guild_button_tooltip_no_influence", true)
			elseif price > treasury then
				ask_btn:SetTooltipText(common.get_localised_string("campaign_localised_strings_string_troy_main_fm_lycian_trade_guild_button_tooltip_no_gold"), "troy_main_fm_lycian_trade_guild_button_tooltip_no_gold", true)
			else
				local goods = {}
				local faction = cm:get_faction(faction_name)

				local minerals = tonumber(ask_btn:GetProperty("minerals") or "0")
				if minerals > 0 then
					table.insert(goods, { ["value"] = minerals, ["name"] =  faction:pooled_resource_display_name(minerals_resource_key) } )
				end

				local metals = tonumber(ask_btn:GetProperty("metals") or "0")
				if metals > 0 then
					table.insert(goods, { ["value"] = metals, ["name"] =  faction:pooled_resource_display_name(metals_resource_key) } )
				end

				local idols = tonumber(ask_btn:GetProperty("idols") or "0")
				if idols > 0 then
					table.insert(goods, { ["value"] = idols, ["name"] =  faction:pooled_resource_display_name(idols_resource_key) } )
				end

				if #goods > 0 then
					local table_key = "campaign_localised_strings_string_"
					local key = "troy_main_fm_lycian_trade_guild_button_exotic_goods_"..#goods
					local tooltip_raw = common.get_localised_string(table_key..key)

					if tooltip_raw then
						local tooltip = string.gsub(tooltip_raw, "%%(%d)%%", "%%s")

						if #goods == 1 then
							tooltip = string.format(tooltip, goods[1].value.." "..goods[1].name)
						elseif #goods == 2 then
							tooltip = string.format(tooltip, goods[1].value.." "..goods[1].name, goods[2].value.." "..goods[2].name)
						elseif #goods == 3 then
							tooltip = string.format(tooltip, goods[1].value.." "..goods[1].name, goods[2].value.." "..goods[2].name, goods[3].value.." "..goods[3].name)
						end

						ask_btn:SetTooltipText(tooltip, tooltip, true)
					end
				end
			end
		end

		local com = ask_row:SequentialFind("dy_cost")
		if com then
			local price = tonumber(com:GetProperty("price") or "0")
			com:SetState(treasury >= price and "active" or "not_enough")
		end
	end

	-- barter agreements
	local barter_list = panel:SequentialFind("barter_agreement_listview", "list_box")
	if barter_list then
		for i = 0, barter_list:ChildCount() - 1 do

			local barter_entry = UIComponent(barter_list:Find(i))

			-- break barter
			local break_btn = barter_entry:SequentialFind("break_agreement_button")
			if break_btn then
				--actions disabled and price not visible for human player factions
				if break_btn:GetProperty("multi_disabled") == "true" then
					break_btn:SetState("inactive")
					break_btn:SetTooltipText(common.get_localised_string("campaign_localised_strings_string_troy_mth_sar_multi_disabled_button_tooltip"), "troy_mth_sar_multi_disabled_button_tooltip", true)
				else
					local price = tonumber(break_btn:GetProperty("price") or "0")
					local state = available_actions and state_value > 2 and treasury >= price and "active" or "inactive"
					break_btn:SetState(state)

					if not available_actions then
						break_btn:SetTooltipText(common.get_localised_string("campaign_localised_strings_string_troy_main_fm_lycian_trade_guild_button_tooltip_used_this_turn"), "troy_main_fm_lycian_trade_guild_button_tooltip_used_this_turn", true)
					elseif state_value <= 2 then
						break_btn:SetTooltipText(common.get_localised_string("campaign_localised_strings_string_troy_main_fm_lycian_trade_guild_button_tooltip_no_influence"), "troy_main_fm_lycian_trade_guild_button_tooltip_no_influence", true)
					elseif price > treasury then
						break_btn:SetTooltipText(common.get_localised_string("campaign_localised_strings_string_troy_main_fm_lycian_trade_guild_button_tooltip_no_gold"), "troy_main_fm_lycian_trade_guild_button_tooltip_no_gold", true)
					else
						break_btn:SetTooltipText(common.get_localised_string("campaign_localised_strings_string_troy_main_fm_lycian_trade_guild_button_break_agreement"), "troy_main_fm_lycian_trade_guild_button_tooltip_break_agreement", true)
					end
				end
			end

			local break_price = barter_entry:SequentialFind("break_button_row", "dy_cost")
			if break_price then
				local price = tonumber(break_price:GetProperty("price") or "0")
				break_price:SetState(treasury >= price and "active" or "not_enough")
			end

			-- steal barter
			local steal_btn = barter_entry:SequentialFind("steal_agreement_button")
			if steal_btn then
				if steal_btn:GetProperty("multi_disabled") == "true" then
					steal_btn:SetState("inactive")
					steal_btn:SetTooltipText(common.get_localised_string("campaign_localised_strings_string_troy_mth_sar_multi_disabled_button_tooltip"), "troy_mth_sar_multi_disabled_button_tooltip", true)
				else
					local price = tonumber(steal_btn:GetProperty("price") or "0")
					local state = available_actions and state_value > 3 and treasury >= price and "active" or "inactive"
					steal_btn:SetState(state)

					if not available_actions then
						steal_btn:SetTooltipText(common.get_localised_string("campaign_localised_strings_string_troy_main_fm_lycian_trade_guild_button_tooltip_used_this_turn"), "troy_main_fm_lycian_trade_guild_button_tooltip_used_this_turn", true)
					elseif state_value <= 3 then
						steal_btn:SetTooltipText(common.get_localised_string("campaign_localised_strings_string_troy_main_fm_lycian_trade_guild_button_tooltip_no_influence"), "troy_main_fm_lycian_trade_guild_button_tooltip_no_influence", true)
					elseif price > treasury then
						steal_btn:SetTooltipText(common.get_localised_string("campaign_localised_strings_string_troy_main_fm_lycian_trade_guild_button_tooltip_no_gold"), "troy_main_fm_lycian_trade_guild_button_tooltip_no_gold", true)
					else
						steal_btn:SetTooltipText(common.get_localised_string("campaign_localised_strings_string_troy_main_fm_lycian_trade_guild_button_tooltip_steal_agreement"), "troy_main_fm_lycian_trade_guild_button_tooltip_steal_agreement", true)
					end
				end
			end

			local steal_price = barter_entry:SequentialFind("steal_button_row", "dy_cost")
			if steal_price then
				local price = tonumber(steal_price:GetProperty("price") or "0")
				steal_price:SetState(treasury >= price and "active" or "not_enough")
			end
		end
	end
end

function add_action_for(faction_name)
	out("ON ADD ACTION FOR: "..faction_name)

	if actions_per_faction[faction_name] then
		actions_per_faction[faction_name] = actions_per_faction[faction_name] + 1
	else
		actions_per_faction[faction_name] = 1
	end
end

function available_actions_for(faction_name)
	return (actions_per_faction[faction_name] == nil or (actions_per_faction[faction_name] and actions_per_faction[faction_name] < max_actions_per_faction)) and true or false
end

---------------------------------------------------------------------------------------------------
--
---------------------------------------------------------------------------------------------------

function SarpedonTradeGuild_UpdateUI()
	local panel = core:get_ui_root():SequentialFind("fm_lycian_trade_guild")
	if panel and panel:Visible() then
		if selected_faction and selected_faction ~= "" then
			fill_selected_faction_options(selected_faction)
		end
	end
end

function SarpedonTradeGuild_ComponentLDBLClickUp(context)
	local l_context = context
	local uic = UIComponent(l_context.component)
	local com_id = uic:Id()
	out("LEFT DBL_CLICK UP: "..com_id)

	local panel = core:get_ui_root():SequentialFind("fm_lycian_trade_guild")

	if panel and string.sub(com_id, 1, 14) == "faction_entry_" then
		selected_faction = uic:GetProperty("faction")
		panel:InterfaceFunction("open_diplomacy_with", selected_faction)
	end
end

function SarpedonTradeGuild_ComponentLClickUp(context)
	local l_context = context
	local uic = UIComponent(l_context.component)

	local com_id = uic:Id()
	out("LEFT CLICK UP: "..com_id)

	if string.sub(com_id, 1, 14) == "faction_entry_" then
		selected_faction = uic:GetProperty("faction")
		fill_selected_faction_options(selected_faction)

	elseif com_id == "mine_deposits_button" then
		local faction_name = uic:GetProperty("faction")
		local price = tonumber(uic:GetProperty("price") or "0")

		CampaignUI.TriggerCampaignScriptEvent(
			cm:get_faction(sarpedon_faction):command_queue_index(), 
			"SarpedonTradeGuild_OnActionExoticGoods," .. 
			faction_name .. "," .. 
			price
		)

	elseif com_id == "break_agreement_button" then
		local p_faction = uic:GetProperty("faction")
		local b_faction = uic:GetProperty("barter_faction")
		local b_index = uic:GetProperty("barter_index")
		local price = tonumber(uic:GetProperty("price") or "0")

		CampaignUI.TriggerCampaignScriptEvent(
			cm:get_faction(sarpedon_faction):command_queue_index(), 
			"SarpedonTradeGuild_OnActionBreakAgreement," .. 
			p_faction .. "," ..
			b_faction .. "," ..
			b_index .. "," ..
			price
		)

	elseif com_id == "steal_agreement_button" then
		local p_faction = uic:GetProperty("faction")
		local b_faction = uic:GetProperty("barter_faction")
		local b_index = uic:GetProperty("barter_index")
		local price = tonumber(uic:GetProperty("price") or "0")

		CampaignUI.TriggerCampaignScriptEvent(
			cm:get_faction(sarpedon_faction):command_queue_index(), 
			"SarpedonTradeGuild_OnActionStealAgreement," ..
			p_faction .. "," ..
			b_faction .. "," ..
			b_index .. "," ..
			price
		)

	end
end

function SarpedonTradeGuild_AddListeners()
	out("SarpedonTradeGuild_AddListeners()")

	core:add_listener(
		"SarpedonLuxuryGoods_FactionTurnStart",
		"FactionTurnStart",
		function(context)
			return context:faction():name() == sarpedon_faction
		end,
		function(context)
			actions_per_faction = {}
			--check if it is time to enable barter agreements for factions we've previously forced to disable them
			for i = 1, #save_data_barters do
				if save_data_barters[i].turn == cm:model():turn_number() then
					cm:force_diplomacy("faction:"..save_data_barters[i].faction_name,"faction:"..save_data_barters[i].barter_faction_name,"single barters", true, true, true, false)
					cm:force_diplomacy("faction:"..save_data_barters[i].faction_name,"faction:"..save_data_barters[i].barter_faction_name,"barter agreements", true, true, true, false)
					table.remove(save_data_barters, i)
				end
			end
		end,
		true
	)

	core:add_listener(
		"SarpedonTradeGuild_UITriggerScriptEvent",
		"UITriggerScriptEvent",
		true,
		function(context)
			local args = split_str(context:trigger(), ",")

			if args[1] == "SarpedonTradeGuild_OnActionExoticGoods" then
				on_action_exotic_goods(args[2], args[3])
			elseif args[1] == "SarpedonTradeGuild_OnActionBreakAgreement" then
				on_action_barter("action_break_agreement", args[2], args[3], args[4], args[5])
			elseif args[1] == "SarpedonTradeGuild_OnActionStealAgreement" then
				on_action_barter("action_steal_agreement", args[2], args[3], args[4], args[5])
			end
		end,
		true
	)

	-- refresh TradeGuild FM window
	core:add_listener (
		"SarpedonTradeGuild_NegativeDiplomaticEvent",
		"NegativeDiplomaticEvent",
		true,
		function(context)
			if selected_faction and selected_faction ~= "" then
				local proposer = context:proposer():name()
				--local recipient = context:recipient():name()

				if context:was_barter_agreement() and proposer == selected_faction then
					fill_selected_faction_options(selected_faction)
				end
			end
		end,
		true
	)

	core:add_listener (
		"SarpedonTradeGuild_PositiveDiplomaticEvent",
		"PositiveDiplomaticEvent",
		function(context)
			return context:character():faction():name() == sarpedon_faction
		end,
		function(context)
			local proposer = context:proposer():name()
			local recipient = context:recipient():name()

			if (context:is_barter_agreement() or context:is_single_barter()) and (proposer == sarpedon_faction or recipient == sarpedon_faction) then

				local sarpedon_regions_number
				if proposer == sarpedon_faction then
					sarpedon_regions_number = math.floor(context:proposer():num_regions()/4)
				else
					sarpedon_regions_number = math.floor(context:recipient():num_regions()/4)
				end
				local influence = sarpedon_influence_value + sarpedon_regions_number
				local bundle_duration = context:barter_agreement_duration() ~= 0 and math.max(context:barter_agreement_duration(), single_barter_duration) or single_barter_duration
				local existing_influence_higher = false
				local existing_duration_higher = false
				local faction_to_check

				if proposer == sarpedon_faction then
					faction_to_check = context:recipient()
				elseif recipient == sarpedon_faction then
					faction_to_check = context:proposer()
				end

				-- Hordes do not use the influence mechanic so no point in them getting this bundle.
				if not faction_to_check:is_allowed_to_capture_territory() then 
					return
				end

				if faction_to_check:has_effect_bundle("effect_bundle_fm_sarpedon_influence_from_barter") then
					local existing_bundle = faction_to_check:get_effect_bundle("effect_bundle_fm_sarpedon_influence_from_barter")
					if existing_bundle:duration() >= bundle_duration then
						bundle_duration = existing_bundle:duration()
						existing_duration_higher = true
						end
					local effects = existing_bundle:effects()
					for i= 0, effects:num_items() - 1 do
						local effect = effects:item_at(i)
						if effect:key() == sarpedon_influence_bundle_effect then
							if effect:value() >= influence then
								influence = effect:value()
								existing_influence_higher = true
								break
							end
						end
					end
				end

				if existing_influence_higher and existing_duration_higher then
					return
				end

				if influence > 0 then
					out("SARPEDON INFLUENCE FROM BARTER !!!")

					local bundle = cm:create_new_custom_effect_bundle("effect_bundle_fm_sarpedon_influence_from_barter")
					local effects = bundle:effects()

					for i= 0, effects:num_items() - 1 do
						local effect = effects:item_at(i)

						if effect:key() == sarpedon_influence_bundle_effect then
							bundle:set_effect_value(effect, influence)

							local duration = bundle_duration
							if context:recipient():is_human() then
								duration = duration + 1
							end

							bundle:set_duration(duration)

							cm:apply_custom_effect_bundle_to_faction(bundle, proposer == sarpedon_faction and context:recipient() or context:proposer())
							break
						end
					end
				end
			end
		end,
		true
	)

	-- panel open
	core:add_listener(
		"SarpedonTradeGuild_PanelOpenedCampaign",
		"PanelOpenedCampaign",
		function(context) return context.string == "fm_lycian_trade_guild" end,
		function(context)
			core:add_listener(
				"SarpedonTradeGuild_ComponentLClickUp",
				"ComponentLClickUp",
				true,
				function(context)
					SarpedonTradeGuild_ComponentLClickUp(context)
				end,
				true
			)

			core:add_listener(
				"SarpedonTradeGuild_ComponentLDBLClickUp",
				"ComponentLDBLClickUp",
				true,
				function(context)
					SarpedonTradeGuild_ComponentLDBLClickUp(context)
				end,
				true
			)

			fill_influenced_factions_list()
		end,
		true
	)

	-- panel closed
	core:add_listener(
		"SarpedonTradeGuild_PanelClosedCampaign",
		"PanelClosedCampaign",
		function(context) return context.string == "fm_lycian_trade_guild" end,
		function(context)
			core:remove_listener("SarpedonTradeGuild_ComponentLClickUp");
			core:remove_listener("SarpedonTradeGuild_ComponentLDBLClickUp")
		end,
		true
	)
end

--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------

cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("TROY_SARPEDON_ACTIONS_PER_FACTION", actions_per_faction, context)
		cm:save_named_value("save_data_barters", save_data_barters, context)
	end
)

cm:add_loading_game_callback(
	function(context)
		actions_per_faction = cm:load_named_value("TROY_SARPEDON_ACTIONS_PER_FACTION", actions_per_faction, context)
		save_data_barters = cm:load_named_value("save_data_barters", save_data_barters, context)
	end
)
