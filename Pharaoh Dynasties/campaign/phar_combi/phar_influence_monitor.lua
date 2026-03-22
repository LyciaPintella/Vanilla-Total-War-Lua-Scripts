--
--	Region Influence monitor
--	monitors influence of the regions and applies regional effect bundles accordingly
--


phar_influence_monitor = {}

phar_influence_monitor.variables = {
	influence_tiers_disabled = false,
	current_influence_arrow_ui_component = { "influence", "influence_arrow"},
	tiers = {
		[1] = { 
			upper_bound = 0.2, 
			bundle_key = "phar_main_influence_upper_bound_020",
			tt_ui_component = { "influence", "idle_tier_1" },
			ui_state = "tier_1"
		},
		[2] = { 
			upper_bound = 0.40, 
			bundle_key = "phar_main_influence_upper_bound_040",
			tt_ui_component = { "influence", "idle_tier_2" },
			ui_state = "tier_2"
		},
		[3] = { 
			upper_bound = 0.6, 
			bundle_key = "phar_main_influence_upper_bound_060",
			tt_ui_component = { "influence", "idle_tier_3" },
			ui_state = "tier_3"
		},
		[4] = { 
			upper_bound = 0.8, 
			bundle_key = "phar_main_influence_upper_bound_080",
			tt_ui_component = { "influence", "idle_tier_4" },
			ui_state = "tier_4"
		},
		[5] = { 
			upper_bound = 1, 
			bundle_key = "phar_main_influence_upper_bound_100",
			tt_ui_component = { "influence", "idle_tier_5" },
			ui_state = "tier_5"
		},
	}
}

phar_influence_monitor.setup_region_monitor = function()
	-- if the influence manager is dissabled at the frontend, we don't apply the bonuses and add the listeners.
	if not phar_influence_monitor.variables.influence_tiers_disabled then 
		-- iterate through all regions and apply influence bundles
		phar_influence_monitor.determin_influence_all_regions()	

		-- recalculate influence at the start of a human turn
		core:add_listener(
			"influence_monitor_turn_start",
			"FactionTurnStart",
			function(context) return context:faction():is_human() and not phar_influence_monitor.variables.influence_tiers_disabled end,
			function()
				phar_influence_monitor.determin_influence_all_regions()
			end,
			true
		)

		core:add_listener(
			"influence_monitor_region_faction_changed",
			"RegionFactionChangeEvent",
			function(context) return not context:region():owning_faction():is_rebel() and not phar_influence_monitor.variables.influence_tiers_disabled end,
			function(context)
				local region = context:region()
				
				phar_influence_monitor.determin_influence(region)
			end,
			true
		)
	end

	core:add_listener(
		"influence_monitor_modular_difficulty_changed",
		"ScriptedEventInfluenceManagerStateChanged",
		true,
		function(context)
			-- if the modular difficulty is changed durring campaign, we remove all influence effects.
			if phar_influence_monitor.variables.influence_tiers_disabled then
				local region_list = cm:model():world():region_manager():region_list()
				for i = 0, region_list:num_items() - 1 do
					local current_region = region_list:item_at(i):name()
					phar_influence_monitor.remove_influence_effect_bundles(current_region)
				end
			else
				-- if the modular difficulty is enabled, we reapply all the listeners and apply the bundles.
				phar_influence_monitor.setup_region_monitor()
			end
		end,
		true
	)

end

phar_influence_monitor.determin_influence_all_regions = function()
	local region_list = cm:model():world():region_manager():region_list()
	for i = 0, region_list:num_items() - 1 do
		local current_region = region_list:item_at(i)
		
		phar_influence_monitor.determin_influence(current_region)
	end 
end

phar_influence_monitor.determin_influence = function(region)
	local owning_faction = region:owning_faction()
	local owner_influence_type = owning_faction:state_religion()
	local owner_influence_proportion = region:religion_proportion(owner_influence_type)
	if not owning_faction:is_rebel() then 
		local bundle_to_apply = {}
		for _, tier in ipairs(phar_influence_monitor.variables.tiers) do
			if owner_influence_proportion <= tier.upper_bound then
				if bundle_to_apply and bundle_to_apply.upper_bound then
					if bundle_to_apply.upper_bound > tier.upper_bound then  
						bundle_to_apply = tier
					end
				else
					bundle_to_apply = tier
				end
			end	
		end

		
		phar_influence_monitor.apply_influence_effect_bundle(region, bundle_to_apply.bundle_key)
	end
end

phar_influence_monitor.apply_influence_effect_bundle = function(region, bundle_key)	

	local faction_key = region:owning_faction():name()

	if faction_key == "rebels" then
		return
	end

	-- clean up the previous tier
	phar_influence_monitor.remove_influence_effect_bundles(region)

	local custom_bundle = cm:clone_or_create_custom_effect_bundle(faction_key, bundle_key)

	custom_bundle:set_duration(0)
	cm:apply_custom_effect_bundle_to_faction_province(custom_bundle, region)

end


phar_influence_monitor.remove_influence_effect_bundles = function(region)
	-- efficiency saving - access the game interface directly
	local game_interface = cm:get_game_interface();

	for i, tier in ipairs(phar_influence_monitor.variables.tiers) do
		local current_effect_bundle = tier.bundle_key
		
		game_interface:remove_effect_bundle_from_faction_province(current_effect_bundle, region)
	end
end

cm:add_first_tick_callback(
	function()
		phar_influence_monitor.setup_region_monitor()
	end
)


-- OnInitProvinceInfo
core:add_listener (
	"PharProvinceManagment_OnInitProvinceInfo",
	"OnInitProvinceInfo",
	true,
	function(context)

		local province_information = UIComponent(context.component)

		local province = context:province()
		local faction_key = context:faction_key()
		local owning_faction = cm:get_faction(faction_key)


		local owner_influence_type = owning_faction:state_religion()
		local owner_influence_proportion = province:religion_proportion(owner_influence_type)


		local current_tier = nil
		for _, tier in ipairs(phar_influence_monitor.variables.tiers) do
			if owner_influence_proportion <= tier.upper_bound then
				if current_tier and current_tier.upper_bound then
					if current_tier.upper_bound > tier.upper_bound then  
						current_tier = tier
					end
				else
					current_tier = tier
				end
			end

			if tier.tt_ui_component and tier.bundle_key then
				local icon = province_information:SequentialFind(unpack(tier.tt_ui_component))
				if icon then
					icon:SetContextObject(cco("CcoEffectBundle", tier.bundle_key))
				end
			end
		end

		if current_tier then
			local influence_uic = province_information:SequentialFind(unpack(phar_influence_monitor.variables.current_influence_arrow_ui_component))
			if influence_uic then
				influence_uic:SetState(current_tier.ui_state)
			end
		end
	end,
	true
)