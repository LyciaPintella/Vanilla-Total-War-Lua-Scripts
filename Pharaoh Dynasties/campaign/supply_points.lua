out("Loading troy_campaign_supply_points.lua")

-- TODO: delete setsp(sp)
-- 		This is a debug function for setting the SP of the local faction
-- 		To be deleted later and also don't use it in multiplayer or the game will desync
function setsp(sp)
	-- early exit to prevent lua errors during autoruns.
	local faction_name = cm:get_local_faction_name(true)
	if not faction_name then
		return
	end

	SUPPLY_POINTS_DATA[faction_name] = sp
	supply_points.ui.update_ui()
end

supply_points = {
	bounds = {
		[1] = {
			lower_bound = 0,
			effect_bundles = {
				["phar_main_clt_kemet"] = "phar_map_effect_bundle_supply_points_egypt_01",
				["phar_main_clt_hatti"] = "phar_map_effect_bundle_supply_points_hittite_01",
				["phar_main_clt_canaan"] = "phar_map_effect_bundle_supply_points_canaan_01",
				["phar_main_clt_sea_peoples"] = "phar_map_effect_bundle_supply_points_sea_peoples_01",
				["troy_main_clt_danaans"] = "phar_map_effect_bundle_supply_points_aegea_01",
				["troy_main_clt_trojans"] = "phar_map_effect_bundle_supply_points_aegea_01",
				["troy_rem_clt_thraco_phrygians"] = "phar_map_effect_bundle_supply_points_aegea_01",
				["phar_map_clt_mesopotamian"] = "phar_map_effect_bundle_supply_points_mesopotamia_01",
			},
			--[[ effects = {
				{effect_key = "troy_effect_fm_lelegan_religion_influence",scope_key = "faction_to_faction_own",value = 15},
				{effect_key = "troy_effect_army_recruitment_cost_mod_all_army_units",scope_key = "faction_to_faction_own",value = 15}
			} ]]
		},
		[2] = {
			lower_bound = 55,
			effect_bundles = {
				["phar_main_clt_kemet"] = "phar_map_effect_bundle_supply_points_egypt_02",
				["phar_main_clt_hatti"] = "phar_map_effect_bundle_supply_points_hittite_02",
				["phar_main_clt_canaan"] = "phar_map_effect_bundle_supply_points_canaan_02",
				["phar_main_clt_sea_peoples"] = "phar_map_effect_bundle_supply_points_sea_peoples_02",
				["troy_main_clt_danaans"] = "phar_map_effect_bundle_supply_points_aegea_02",
				["troy_main_clt_trojans"] = "phar_map_effect_bundle_supply_points_aegea_02",
				["troy_rem_clt_thraco_phrygians"] = "phar_map_effect_bundle_supply_points_aegea_02",
				["phar_map_clt_mesopotamian"] = "phar_map_effect_bundle_supply_points_mesopotamia_02",
			},
		},
		[3] = {
			lower_bound = 110,
			effect_bundles = {
				["phar_main_clt_kemet"] = "phar_map_effect_bundle_supply_points_egypt_03",
				["phar_main_clt_hatti"] = "phar_map_effect_bundle_supply_points_hittite_03",
				["phar_main_clt_canaan"] = "phar_map_effect_bundle_supply_points_canaan_03",
				["phar_main_clt_sea_peoples"] = "phar_map_effect_bundle_supply_points_sea_peoples_03",
				["troy_main_clt_danaans"] = "phar_map_effect_bundle_supply_points_aegea_03",
				["troy_main_clt_trojans"] = "phar_map_effect_bundle_supply_points_aegea_03",
				["troy_rem_clt_thraco_phrygians"] = "phar_map_effect_bundle_supply_points_aegea_03",
				["phar_map_clt_mesopotamian"] = "phar_map_effect_bundle_supply_points_mesopotamia_03",
			},
		},
		[4] = {
			lower_bound = 160,
			effect_bundles = {
				["phar_main_clt_kemet"] = "phar_map_effect_bundle_supply_points_egypt_04",
				["phar_main_clt_hatti"] = "phar_map_effect_bundle_supply_points_hittite_04",
				["phar_main_clt_canaan"] = "phar_map_effect_bundle_supply_points_canaan_04",
				["phar_main_clt_sea_peoples"] = "phar_map_effect_bundle_supply_points_sea_peoples_04",
				["troy_main_clt_danaans"] = "phar_map_effect_bundle_supply_points_aegea_04",
				["troy_main_clt_trojans"] = "phar_map_effect_bundle_supply_points_aegea_04",
				["troy_rem_clt_thraco_phrygians"] = "phar_map_effect_bundle_supply_points_aegea_04",
				["phar_map_clt_mesopotamian"] = "phar_map_effect_bundle_supply_points_mesopotamia_04",
			},
		},
		[5] = {
			lower_bound = 215,
			effect_bundles = {
				["phar_main_clt_kemet"] = "phar_map_effect_bundle_supply_points_egypt_05",
				["phar_main_clt_hatti"] = "phar_map_effect_bundle_supply_points_hittite_05",
				["phar_main_clt_canaan"] = "phar_map_effect_bundle_supply_points_canaan_05",
				["phar_main_clt_sea_peoples"] = "phar_map_effect_bundle_supply_points_sea_peoples_05",
				["troy_main_clt_danaans"] = "phar_map_effect_bundle_supply_points_aegea_05",
				["troy_main_clt_trojans"] = "phar_map_effect_bundle_supply_points_aegea_05",
				["troy_rem_clt_thraco_phrygians"] = "phar_map_effect_bundle_supply_points_aegea_05",
				["phar_map_clt_mesopotamian"] = "phar_map_effect_bundle_supply_points_mesopotamia_05",
			},
		},
		[6] = {
			lower_bound = 270,
			effect_bundles = {
				["phar_main_clt_kemet"] = "phar_map_effect_bundle_supply_points_egypt_06",
				["phar_main_clt_hatti"] = "phar_map_effect_bundle_supply_points_hittite_06",
				["phar_main_clt_canaan"] = "phar_map_effect_bundle_supply_points_canaan_06",
				["phar_main_clt_sea_peoples"] = "phar_map_effect_bundle_supply_points_sea_peoples_06",
				["troy_main_clt_danaans"] = "phar_map_effect_bundle_supply_points_aegea_06",
				["troy_main_clt_trojans"] = "phar_map_effect_bundle_supply_points_aegea_06",
				["troy_rem_clt_thraco_phrygians"] = "phar_map_effect_bundle_supply_points_aegea_06",
				["phar_map_clt_mesopotamian"] = "phar_map_effect_bundle_supply_points_mesopotamia_06",
			},
		},
		[7] = {
			lower_bound = 330,
			effect_bundles = {
				["phar_main_clt_kemet"] = "phar_map_effect_bundle_supply_points_egypt_07",
				["phar_main_clt_hatti"] = "phar_map_effect_bundle_supply_points_hittite_07",
				["phar_main_clt_canaan"] = "phar_map_effect_bundle_supply_points_canaan_07",
				["phar_main_clt_sea_peoples"] = "phar_map_effect_bundle_supply_points_sea_peoples_07",
				["troy_main_clt_danaans"] = "phar_map_effect_bundle_supply_points_aegea_07",
				["troy_main_clt_trojans"] = "phar_map_effect_bundle_supply_points_aegea_07",
				["troy_rem_clt_thraco_phrygians"] = "phar_map_effect_bundle_supply_points_aegea_07",
				["phar_map_clt_mesopotamian"] = "phar_map_effect_bundle_supply_points_mesopotamia_07",
			},
		},
		[8] = {
			lower_bound = 390,
			effect_bundles = {
				["phar_main_clt_kemet"] = "phar_map_effect_bundle_supply_points_egypt_08",
				["phar_main_clt_hatti"] = "phar_map_effect_bundle_supply_points_hittite_08",
				["phar_main_clt_canaan"] = "phar_map_effect_bundle_supply_points_canaan_08",
				["phar_main_clt_sea_peoples"] = "phar_map_effect_bundle_supply_points_sea_peoples_08",
				["troy_main_clt_danaans"] = "phar_map_effect_bundle_supply_points_aegea_08",
				["troy_main_clt_trojans"] = "phar_map_effect_bundle_supply_points_aegea_08",
				["troy_rem_clt_thraco_phrygians"] = "phar_map_effect_bundle_supply_points_aegea_08",
				["phar_map_clt_mesopotamian"] = "phar_map_effect_bundle_supply_points_mesopotamia_08",
			},
		},
		[9] = {
			lower_bound = 455,
			effect_bundles = {
				["phar_main_clt_kemet"] = "phar_map_effect_bundle_supply_points_egypt_09",
				["phar_main_clt_hatti"] = "phar_map_effect_bundle_supply_points_hittite_09",
				["phar_main_clt_canaan"] = "phar_map_effect_bundle_supply_points_canaan_09",
				["phar_main_clt_sea_peoples"] = "phar_map_effect_bundle_supply_points_sea_peoples_09",
				["troy_main_clt_danaans"] = "phar_map_effect_bundle_supply_points_aegea_09",
				["troy_main_clt_trojans"] = "phar_map_effect_bundle_supply_points_aegea_09",
				["troy_rem_clt_thraco_phrygians"] = "phar_map_effect_bundle_supply_points_aegea_09",
				["phar_map_clt_mesopotamian"] = "phar_map_effect_bundle_supply_points_mesopotamia_09",
			},
		},
		[10] = {
			lower_bound = 520,
			effect_bundles = {
				["phar_main_clt_kemet"] = "phar_map_effect_bundle_supply_points_egypt_10",
				["phar_main_clt_hatti"] = "phar_map_effect_bundle_supply_points_hittite_10",
				["phar_main_clt_canaan"] = "phar_map_effect_bundle_supply_points_canaan_10",
				["phar_main_clt_sea_peoples"] = "phar_map_effect_bundle_supply_points_sea_peoples_10",
				["troy_main_clt_danaans"] = "phar_map_effect_bundle_supply_points_aegea_10",
				["troy_main_clt_trojans"] = "phar_map_effect_bundle_supply_points_aegea_10",
				["troy_rem_clt_thraco_phrygians"] = "phar_map_effect_bundle_supply_points_aegea_10",
				["phar_map_clt_mesopotamian"] = "phar_map_effect_bundle_supply_points_mesopotamia_10",
			},
		},
		[11] = {
			lower_bound = 590,
			effect_bundles = {
				["phar_main_clt_kemet"] = "phar_map_effect_bundle_supply_points_egypt_11",
				["phar_main_clt_hatti"] = "phar_map_effect_bundle_supply_points_hittite_11",
				["phar_main_clt_canaan"] = "phar_map_effect_bundle_supply_points_canaan_11",
				["phar_main_clt_sea_peoples"] = "phar_map_effect_bundle_supply_points_sea_peoples_11",
				["troy_main_clt_danaans"] = "phar_map_effect_bundle_supply_points_aegea_11",
				["troy_main_clt_trojans"] = "phar_map_effect_bundle_supply_points_aegea_11",
				["troy_rem_clt_thraco_phrygians"] = "phar_map_effect_bundle_supply_points_aegea_11",
				["phar_map_clt_mesopotamian"] = "phar_map_effect_bundle_supply_points_mesopotamia_11",
			},
		},
		[12] = {
			lower_bound = 660,
			effect_bundles = {
				["phar_main_clt_kemet"] = "phar_map_effect_bundle_supply_points_egypt_12",
				["phar_main_clt_hatti"] = "phar_map_effect_bundle_supply_points_hittite_12",
				["phar_main_clt_canaan"] = "phar_map_effect_bundle_supply_points_canaan_12",
				["phar_main_clt_sea_peoples"] = "phar_map_effect_bundle_supply_points_sea_peoples_12",
				["troy_main_clt_danaans"] = "phar_map_effect_bundle_supply_points_aegea_12",
				["troy_main_clt_trojans"] = "phar_map_effect_bundle_supply_points_aegea_12",
				["troy_rem_clt_thraco_phrygians"] = "phar_map_effect_bundle_supply_points_aegea_12",
				["phar_map_clt_mesopotamian"] = "phar_map_effect_bundle_supply_points_mesopotamia_12",
			},
		},
	},

	ui = {
		supply_points_max_value = 730, -- the bar will not expand above this value

		component_ids = {
			admin_bar = "admin_cost_container",
			treshold_template = "treshold_template",
			treshold_line = "threshold_line",
			tresholds_holder = "tresholds_holder",
			bar_empty = "bar_empty",
			bar_fill = "bar_fill",
			admin_icon = "admin_icon"
		},

		tooltip_path = "UI/Campaign UI/tooltip_admin_bar_icon",
		tooltip_admin_tier_path = "UI/Campaign UI/tooltip_admin_tier",
		province_admin_component_path = {"province_details_holder", "province_details" , "admin_cost", "dy_admin"}
	},

	-- external flag for message event generation
	show_message_events = true,

	version = 1,
}

supply_points_building_effect_key = "troy_effect_building_administration_cost"
supply_points_factors = {
	characters = "factor_characters",
	units = "factor_units",
	settlements = "factor_settlements"
}

SUPPLY_POINTS_DATA = {
	-- data stored per breakdown factor
	-- ["faction_name"] = {
	--	factor_characters = 0,
	--	factor_units = 0,
	--	factor_settlements = 0
	-- }
}

---------------------------------------------------------------
------------------------ Listeners ----------------------------
---------------------------------------------------------------

core:add_listener(
	"supply_points_new_campaign_started",
	"NewCampaignStarted",
	true,
	function()
		supply_points_start_pos_setup()
		supply_points.init()
	end,
	false
)

core:add_listener(
	"supply_points_ui_created",
	"UICreated",
	true,
	function()
		cm:add_first_tick_callback(supply_points.first_tick_init)
	end,
	true
)

core:add_listener(
	"supply_points_ui_reloaded",
	"UIReloaded",
	true,
	function()
		supply_points.ui.init_ui()
	end,
	true
)

cm:add_pre_first_tick_callback(
	function() 
		-- if SUPPLY_POINTS_DATA is an empty table here, we assume that this is an older save file
		if not next(SUPPLY_POINTS_DATA) then
			supply_points_start_pos_setup()
			supply_points.init()
		end

		-- if SUPPLY_POINTS_DATA contains numbers, instead of tables that means it's an old version, so we need to fix up stuff
		if type(SUPPLY_POINTS_DATA[next(SUPPLY_POINTS_DATA)]) == "number" then
			supply_points_start_pos_setup()
			supply_points.init()
		end
	end
)

function supply_points_add_listeners()
	out("Listeners for supply points started")

	core:add_listener(
		"supply_points_unit_created",
		"UnitCreated",
		function(context)
			-- because the unit does not have a military force yet, we don't know if it is a garrison (armed citizenry)
			-- this is why this piece of code should only handle bodyguard units
			-- most units will be handled by UnitTrained. in cases when the army is spawned, the script that spawns it should manually udpate the supply
			-- Note that autocreated colonels of both settlements and forts (all ERSs) do not have a commander at that point, so they get filtered by this criteria.
			local unit = context:unit()
			local faction = unit:faction()
			local has_commander = unit:has_unit_commander()
			return (not faction:is_rebel()) 
				and (not faction:is_dead()) 
				and has_commander
				and (not context:is_bodyguard_swap())
		end,
		function(context)
			local unit = context:unit()
			supply_points.update_supply_points_for_unit(unit, true, supply_points_factors.characters)
			supply_points.apply_effects_for_faction(unit:faction():name())
			-- and update the UI
			supply_points.ui.update_ui()
		end,
		true
	)

	core:add_listener(
		"supply_points_unit_trained",
		"UnitTrained",
		function(context)
			-- Bodyguard units, for both generals and colonels, are not trained and therefore handled by the UnitCreated event.
			return is_supply_points_applicable(context:unit():faction())
		end,
		function(context)
			local unit = context:unit()
			supply_points.update_supply_points_for_unit(unit, true, supply_points_factors.units)
			supply_points.apply_effects_for_faction(unit:faction():name())
			-- and update the UI
			supply_points.ui.update_ui()
		end,
		true
	)

	core:add_listener(
		"supply_points_unit_disbanded",
		"UnitDisbanded",
		function(context)
			-- General and colonel units can't be disbanded, so this event only applies to normal units.
			local unit = context:unit()
			local is_settlement_garrison = supply_points.is_settlement_garrison(unit:military_force())
			return is_supply_points_applicable(unit:faction()) and not is_settlement_garrison
		end,
		function(context)
			local unit = context:unit()
			local factor = (unit:has_unit_commander() and supply_points_factors.characters) or supply_points_factors.units
			supply_points.update_supply_points_for_unit(unit, false, factor)
			supply_points.apply_effects_for_faction(unit:faction():name())
			-- and update the UI
			supply_points.ui.update_ui()
		end,
		true
	)

	core:add_listener(
		"supply_points_unit_merged_and_destroyed",
		"UnitMergedAndDestroyed",
		function(context)
			-- General and colonel units can't be merged, so this event only applies to normal units.
			return is_supply_points_applicable(context:unit():faction())
		end,
		function(context)
			local unit = context:unit()
			local factor = (unit:has_unit_commander() and supply_points_factors.characters) or supply_points_factors.units
			supply_points.update_supply_points_for_unit(unit, false, factor)
			supply_points.apply_effects_for_faction(unit:faction():name())
			-- and update the UI
			supply_points.ui.update_ui()
		end,
		true
	)

	core:add_listener(
		"supply_points_unit_destroyed",
		"UnitDestroyed",
		function(context)
			local unit = context:unit()
			-- Check for ex agent units - they are a special case, since their administration is calculated when they spawn
			-- We do not need to calculate them again here, because this falsely triggers when they exit a military force
			local was_embedded_agent = context:was_embedded_agent()

			local mf =  unit:military_force()
			local is_settlement_garrison = false
			local is_armed_citizenry_colonel = false
			if not mf:is_null_interface() then
				is_settlement_garrison = supply_points.is_settlement_garrison(mf)
				is_armed_citizenry_colonel = mf:is_armed_citizenry() and unit:unit_class() == "com"
			end
			return not is_settlement_garrison
				and not is_armed_citizenry_colonel
				and not was_embedded_agent
				and not context:was_bodyguard_swap()
				and is_supply_points_applicable(unit:faction())
		end,
		function(context)
			local unit = context:unit()
			local factor = ((unit:unit_class() == "com") and supply_points_factors.characters) or supply_points_factors.units
			supply_points.update_supply_points_for_unit(unit, false, factor)
			supply_points.apply_effects_for_faction(unit:faction():name())
			-- and update the UI
			supply_points.ui.update_ui()
		end,
		true
	)

	core:add_listener(
		"supply_points_test",
		"ScriptEventPlayerFactionTurnStart",
		true,
		function()
			-- and update the UI
			supply_points.ui.update_ui()
		end,
		true
	)

	core:add_listener(
		"supply_points_on_region_faction_change",
		"RegionFactionChangeEvent",
		true,
		function(context)
			local region = context:region()
			local previous_faction = context:previous_faction()
			local new_faction = region:owning_faction()

			if is_supply_points_applicable(previous_faction) then
				supply_points.update_faction_supply_points_for_region(previous_faction:name(), region, false)
				supply_points.apply_effects_for_faction(previous_faction:name())
			end

			-- Means that the region was abandoned, recalculate the points since all buildings were destroyed
			if new_faction:name() == "rebels" then
				supply_points.update_supply_points_for_region(region)
			end

			--[[ if is_supply_points_applicable(new_faction) then
				supply_points.update_faction_supply_points_for_region(new_faction:name(), region, true)
				supply_points.apply_effects_for_faction(new_faction:name())
			end ]]
			-- and update the UI
			supply_points.ui.update_ui()
		end,
		true
	)

	core:add_listener(
		"supply_points_on_region_about_to_be_abandoned",
		"RegionAboutToBeAbandoned",
		true,
		function(context)
			local region = context:region()
			local owning_faction = region:owning_faction()

			if is_supply_points_applicable(owning_faction) then
				supply_points.update_faction_supply_points_for_region(owning_faction:name(), region, false)
				supply_points.apply_effects_for_faction(owning_faction:name())
			end

			supply_points.ui.update_ui()
		end,
		true
	)

	core:add_listener(
		"supply_points_on_region_faction_change_post_building_conversion",
		"RegionFactionChangePostBuildingConversionEvent",
		true,
		function(context)
			local region = context:region()
			--local previous_faction = context:previous_faction()
			local new_faction = region:owning_faction()

			--[[ if is_supply_points_applicable(previous_faction) then
				supply_points.update_faction_supply_points_for_region(previous_faction:name(), region, false)
				supply_points.apply_effects_for_faction(previous_faction:name())
			end ]]

			if is_supply_points_applicable(new_faction) then
				supply_points.update_faction_supply_points_for_region(new_faction:name(), region, true)
				supply_points.apply_effects_for_faction(new_faction:name())
			end
			-- and update the UI
			supply_points.ui.update_ui()
		end,
		true
	)

	core:add_listener(
		"supply_points_on_confederation",
		"FactionJoinsConfederationBeforeReassign",
		function(context)
			return is_supply_points_applicable(context:confederation())
		end,
		function(context)
			local fac = context:faction()
			local conf_name = context:confederation():name()
			-- Time to go over all forces
			local mf_list = fac:military_force_list()
			for i = 0, mf_list:num_items() - 1 do
					-- We don't count garrisons - settlement garrisons don't contribute towards administration by design, while fort garrisons are destroyed upon confederation.
				local military_force = mf_list:item_at(i)
				if not military_force:is_armed_citizenry() then
					local unit_list = military_force:unit_list()
					for j = 0, unit_list:num_items() - 1 do
						local curr_unit = unit_list:item_at(j)
						local factor = (curr_unit:has_unit_commander() and supply_points_factors.characters) or supply_points_factors.units
						supply_points.update_supply_points_for_unit(curr_unit, true, factor, conf_name)
					end
				end
			end

			supply_points.apply_effects_for_faction(conf_name)
			-- and update the UI
			supply_points.ui.update_ui()
		end,
		true
	)

	core:add_listener(
		"supply_points_update_on_building_constructed",
		"BuildingCompleted",
		true,
		function(context)
			local region = context:garrison_residence():region()
			local change = supply_points.get_supply_points_for_region(region) - region:supply_points()
			local faction_name = region:owning_faction():name()
			supply_points.update_supply_points_for_faction(faction_name, change, supply_points_factors.settlements)
			supply_points.apply_effects_for_faction(faction_name)
			supply_points.update_supply_points_for_region(region)
			supply_points.ui.update_ui()
		end,
		true
	)

	core:add_listener(
		"supply_points_update_on_building_demolished",
		"BuildingDemolished",
		true,
		function(context)
			local region = context:garrison_residence():region()
			local change = supply_points.get_supply_points_for_region(region) - region:supply_points()
			local faction_name = region:owning_faction():name()
			supply_points.update_supply_points_for_faction(faction_name, change, supply_points_factors.settlements)
			supply_points.apply_effects_for_faction(faction_name)
			supply_points.update_supply_points_for_region(region)
			supply_points.ui.update_ui()
		end,
		true
	)

	core:add_listener(
		"supply_points_update_province_info_ui", 
		"OnInitProvinceInfo", 
		true, 
		function()
			supply_points.ui.update_province_info_ui()
		end, 
		true
	)
end
---------------------------------------------------------------
--------------------- Implementation --------------------------
---------------------------------------------------------------

function supply_points_start_pos_setup()
	local region_list = cm:model():world():region_manager():region_list()
	local num_regions = region_list:num_items()

	for i = 0, num_regions - 1 do
		local region = region_list:item_at(i)
		supply_points.update_supply_points_for_region(region)
	end
end

function is_supply_points_applicable(faction)
	local is_tutorial_mode_from_savegame = cm:get_saved_value("bool_is_tutorial_mode")
	local is_tutorial_mode_from_frontend = core:svr_load_bool("sbool_player_selected_first_turn_intro_on_frontend")
	local is_tutorial = is_tutorial_mode_from_frontend or is_tutorial_mode_from_savegame 

	return not faction:is_rebel() and not faction:is_dead() and faction:is_supply_points_feature_available() and not is_tutorial
end

function supply_points.is_settlement_garrison(military_force)
	if military_force:is_armed_citizenry()
		and military_force:garrison_residence()
		and (not military_force:garrison_residence():is_null_interface())
		and military_force:garrison_residence():is_settlement()
	then
		return true
	end

	return false
end

function supply_points.first_tick_init()
	if (not is_number(SUPPLY_POINTS_DATA.version))
		or SUPPLY_POINTS_DATA.version < supply_points.version
	then
		-- there was some change in the system, we need to recalculate the supply of all factions
		supply_points.init()
		SUPPLY_POINTS_DATA.version = supply_points.version
	end

	supply_points.ui.init_ui()
end

function supply_points.init()
	-- Initalize supply points when a new campaign is started
	local factions_list = cm:model():world():faction_list()
	for i = 0, factions_list:num_items() - 1 do
		local faction = factions_list:item_at(i)
		local faction_name = faction:name()

		-- Set the faction's supply points to zeroes for all factors for now
		SUPPLY_POINTS_DATA[faction_name] = {}
		for short_name,factor in pairs(supply_points_factors) do
			SUPPLY_POINTS_DATA[faction_name][factor] = 0
		end

		if is_supply_points_applicable(faction) then
			-- We don't need to bother with supply points for rebels or dead factions any further here
		
			-- Time to go over all forces
			local mf_list = faction:military_force_list()
			for k = 0, mf_list:num_items() - 1 do
				local military_force = mf_list:item_at(k)
				-- We don't count settlement garrisons.
				if not supply_points.is_settlement_garrison(military_force) then
					local is_armed_citizenry = military_force:is_armed_citizenry()
					local unit_list = military_force:unit_list()
					for j = 0, unit_list:num_items() - 1 do
						local unit = unit_list:item_at(j)
						local has_commander = unit:has_unit_commander()
						-- We don't count fort colonels.
						if not has_commander or not is_armed_citizenry then
							local factor = (has_commander and supply_points_factors.characters) or supply_points_factors.units
							local unit_supply_cost = unit:supply_points()
							SUPPLY_POINTS_DATA[faction_name][factor] = SUPPLY_POINTS_DATA[faction_name][factor] + unit_supply_cost
						end
					end
				end
			end

			-- And all regions
			local region_list = faction:region_list()
			for k = 0, region_list:num_items() -1 do
				local region = region_list:item_at(k)
				SUPPLY_POINTS_DATA[faction_name][supply_points_factors.settlements] = SUPPLY_POINTS_DATA[faction_name][supply_points_factors.settlements] + region:supply_points()
			end

			-- and apply effects
			supply_points.apply_effects_for_faction(faction_name)
		end
	end
end

function supply_points.apply_effects_for_faction(faction_name)

	-- early out if faction does not have the feature
	if not is_supply_points_applicable(cm:get_faction(faction_name)) then return end

	-- get new bundle
	local effect_bundle = supply_points.current_bound_effect_bundle(faction_name)

	-- get currently active effect bundle
	local curr_effect_bundle, old_tier_index = supply_points.current_active_effect_bundle(faction_name)
	local __, current_tier_index = supply_points.determine_bound_for_faction(faction_name)

	if curr_effect_bundle and (effect_bundle:key() ~= curr_effect_bundle:key()) then
		if supply_points.should_show_message_events() then
			cm:show_message_event(
				faction_name,
				"event_feed_strings_text_troy_event_feed_string_administration_milestone_changed_title",
				"event_feed_strings_text_troy_event_feed_string_administration_milestone_changed_primary_detail",
				"event_feed_strings_text_troy_event_feed_string_all_null",
				true,
				1114,
				nil,
				0,
				false,
				current_tier_index,
				old_tier_index
			)
		end

		-- First we need to remove all previous supply effects
		supply_points.remove_effects_from_faction(faction_name)
		-- and now we apply
		core:trigger_event("ScriptEventAdministrationTierChange", faction_name)
		cm:apply_custom_effect_bundle_to_faction(effect_bundle, cm:get_faction(faction_name))
	else
		-- in case we have no current effect bundle we just apply
		cm:apply_custom_effect_bundle_to_faction(effect_bundle, cm:get_faction(faction_name))
	end

end

function supply_points.get_bound_effect_bundle_key(faction_name, bound)
	if not is_table(bound) then
		script_error("Supply Points: Missing bound table")
		return nil
	end

	local faction = cm:get_faction(faction_name)
	local culture_key = faction:culture()
	local effect_bundle_key = bound.effect_bundles[culture_key]
	if not effect_bundle_key then
		script_error("Supply Points: Missing effect bundle for culture " .. culture_key)

		-- just get first effect bundle to avoid crash
		for _, it_effect_bundle_key in dpairs(bound) do
			effect_bundle_key = it_effect_bundle_key
			break
		end
	end

	return effect_bundle_key
end

function supply_points.current_bound_effect_bundle(faction_name)
	-- Now we need to find the correct list of effects and add it to the bundle
	local bound_table = supply_points.determine_bound_for_faction(faction_name)
	local effect_bundle_key = supply_points.get_bound_effect_bundle_key(faction_name, bound_table)
	local effect_bundle = cm:create_new_custom_effect_bundle(effect_bundle_key)
	--[[ for _, effect_info in ipairs(bound_table.effects) do
		effect_bundle:add_effect(effect_info.effect_key, effect_info.scope_key, effect_info.value)
	end ]]
	return effect_bundle
end

function supply_points.current_active_effect_bundle(faction_name)
	-- We have to go over all bundles and find the active one
	local faction = cm:get_faction(faction_name)
	for idx, bound in ipairs(supply_points.bounds) do
		local effect_bundle_key = supply_points.get_bound_effect_bundle_key(faction_name, bound)
		if faction:has_effect_bundle(effect_bundle_key) then
			return cm:create_new_custom_effect_bundle(effect_bundle_key), idx
		end
	end
	return false
end

function supply_points.supply_points_for_faction(faction_name)
	local total = 0
	for short_name,factor in pairs(supply_points_factors) do
		total = total + SUPPLY_POINTS_DATA[faction_name][factor]
	end
	return total
end

function supply_points.remove_effects_from_faction(faction_name)
	for _, bound in ipairs(supply_points.bounds) do
		local effect_bundle_key = supply_points.get_bound_effect_bundle_key(faction_name, bound)
		cm:remove_effect_bundle(effect_bundle_key, faction_name)
	end
end

function supply_points.determine_bound_for_faction(faction_name)
	local current_supply_points = supply_points.supply_points_for_faction(faction_name)
	local idx = #supply_points.bounds
	local candidate = supply_points.bounds[idx]
	for i, bound in ipairs(supply_points.bounds) do 
		if current_supply_points >= bound.lower_bound then
			candidate = bound
			idx = i
		end
	end
	return candidate, idx
end

function supply_points.update_supply_points_for_unit(unit, is_recruit, factor, override_faction)
	local faction_name = override_faction or unit:faction():name()
	local unit_supply_cost = unit:supply_points()
	if is_recruit then
		SUPPLY_POINTS_DATA[faction_name][factor] = SUPPLY_POINTS_DATA[faction_name][factor] + unit_supply_cost
	else
		SUPPLY_POINTS_DATA[faction_name][factor] = SUPPLY_POINTS_DATA[faction_name][factor] - unit_supply_cost
	end
end

function supply_points.update_faction_supply_points_for_region(faction_name, region, is_occupy)
	local region_supply_cost = supply_points.get_supply_points_for_region(region)
	local factor = supply_points_factors.settlements

	if is_occupy then
		SUPPLY_POINTS_DATA[faction_name][factor] = SUPPLY_POINTS_DATA[faction_name][factor] + region_supply_cost
	else
		SUPPLY_POINTS_DATA[faction_name][factor] = SUPPLY_POINTS_DATA[faction_name][factor] - region_supply_cost
	end
end

function supply_points.get_supply_points_for_region(region)
	local buildings_list = region:garrison_residence():buildings()
	local supply_cost = 0
	for i = 0, buildings_list:num_items() -1 do
		supply_cost = supply_cost + buildings_list:item_at(i):get_effect_value(supply_points_building_effect_key)
	end
	return supply_cost
end

function supply_points.update_supply_points_for_region(region)
	local region_supply_cost = supply_points.get_supply_points_for_region(region)
	cm:set_region_supply_points(region:name(), region_supply_cost)
end

function supply_points.supply_points_from_regions_for_faction(faction_name)
	local region_list = cm:get_faction(faction_name):region_list()
	local total = 0
	for i = 0, region_list:num_items() - 1 do 
		total = total + region_list:item_at(i):supply_points()
	end
	return total
end

function supply_points.supply_points_from_units_and_generals_for_faction(faction_name)
	local unit_total = 0
	local general_total = 0
	local military_force_list = cm:get_faction(faction_name):military_force_list()
	for i = 0, military_force_list:num_items() - 1 do 
		local curr_force = military_force_list:item_at(i)
		local is_settlement_garrison = supply_points.is_settlement_garrison(curr_force)
		if not is_settlement_garrison then
			local is_armed_citizenry = curr_force:is_armed_citizenry()
			local unit_list = curr_force:unit_list()
			for j = 0, unit_list:num_items() - 1 do 
				local curr_unit = unit_list:item_at(j)
				if curr_unit:has_unit_commander() then
					if not is_armed_citizenry then
						general_total = general_total + curr_unit:supply_points()
					end
				else
					unit_total = unit_total + curr_unit:supply_points()
				end
			end
		end
	end

	return unit_total, general_total
end

-- Use this function to directly change the supply points for a faction. Use with caution!
function supply_points.update_supply_points_for_faction(faction_name, change, factor)
	
	-- early out if faction does not have the feature
	if not is_supply_points_applicable(cm:get_faction(faction_name)) then return end

	SUPPLY_POINTS_DATA[faction_name][factor] = SUPPLY_POINTS_DATA[faction_name][factor] + change
end

function supply_points.set_show_message_events(should_show)
	supply_points.show_message_events = should_show
end

function supply_points.should_show_message_events()
	return supply_points.show_message_events
end

function supply_points.ui.init_ui()
	local faction_name = cm:get_local_faction_name(true)

	-- early exit to prevent lua errors during autoruns.
	if not faction_name then 
		return
	end

	-- early out if faction does not have the feature
	if not is_supply_points_applicable(cm:get_faction(faction_name)) then return end

	local current_supply_points = supply_points.supply_points_for_faction(faction_name)
	local current_bundle = supply_points.current_bound_effect_bundle(faction_name)

	local admin_bar = core:get_ui_root():SequentialFind(supply_points.ui.component_ids.admin_bar)
	local treshold_template = admin_bar:SequentialFind(supply_points.ui.component_ids.treshold_template)
	local tresholds_holder = admin_bar:SequentialFind(supply_points.ui.component_ids.tresholds_holder)
	local bar_empty = admin_bar:SequentialFind(supply_points.ui.component_ids.bar_empty)

	local max_value = supply_points.ui.supply_points_max_value
	local pixels_per_point = bar_empty:Width() / max_value -- multiplier for filling and offsetting the tiers and the bar

	---------------------------------------------------
	-- Create tiers
	---------------------------------------------------
	tresholds_holder:DestroyChildren()

	for i, tier in ipairs(supply_points.bounds) do
		-- Create tier entry
		local tier_entry = UIComponent(tresholds_holder:CreateFromComponent(treshold_template:Address(), string.format("tier_%d", i)))
		tier_entry:SetVisible(true)

		-- last tier line should be invisible because we don't really have max value for supply points
		if i == #supply_points.bounds then 
			tier_entry:SequentialFind(supply_points.ui.component_ids.treshold_line):SetVisible(false)
		end

		-- Offset and resize the current tier entry
		local tier_max_supply_points = i < #supply_points.bounds and supply_points.bounds[i + 1].lower_bound or max_value
		tier_entry:SetCanResizeWidth(true)
		tier_entry:Resize(pixels_per_point * (tier_max_supply_points - tier.lower_bound), tier_entry:Height())
		tier_entry:SetCanResizeWidth(false)

		local x, y = tier_entry:GetDockOffset()
		tier_entry:SetDockOffset(pixels_per_point * tier.lower_bound, y)

		tier_entry:InterfaceFunction("set_tiers_bundles", cm:create_new_custom_effect_bundle(tier.effect_bundle), current_bundle)
	end

	---------------------------------------------------
	-- Create admin icon
	---------------------------------------------------
	local admin_icon = admin_bar:SequentialFind("admin_icon")
	admin_icon:InterfaceFunction("set_tooltip_path", supply_points.ui.tooltip_path)
	local tooltip = admin_icon:SequentialFind(admin_icon:Id() .. "_tooltip")
	if tooltip then
		tooltip:SequentialFind("tooltip_value_breakdown", "dy_value"):SetText(tostring(current_supply_points))
		tooltip:SequentialFind("effect_bundle_holder"):InterfaceFunction("set_cco_effect_bundle_from_custom_bundle", current_bundle)
	end

	supply_points.ui.update_ui()
end

function supply_points.ui.update_ui()
	if not core.ui_is_created then
		return
	end

	local faction_name = cm:get_local_faction_name(true)

	-- early exit to prevent lua errors during autoruns.
	if not faction_name then 
		return
	end

	-- early out if faction does not have the feature
	if not is_supply_points_applicable(cm:get_faction(faction_name)) then return end

	local current_supply_points = supply_points.supply_points_for_faction(faction_name)
	local current_bundle = supply_points.current_bound_effect_bundle(faction_name)
	local _, current_tier_index = supply_points.determine_bound_for_faction(faction_name)

	local admin_bar = core:get_ui_root():SequentialFind(supply_points.ui.component_ids.admin_bar)
	local admin_icon = admin_bar:SequentialFind("admin_icon")
	local bar_empty = admin_bar:SequentialFind(supply_points.ui.component_ids.bar_empty)
	local bar_fill = admin_bar:SequentialFind(supply_points.ui.component_ids.bar_fill)
	local tresholds_holder = admin_bar:SequentialFind(supply_points.ui.component_ids.tresholds_holder)

	---------------------------------------------------
	-- Expand bar fill
	---------------------------------------------------
	local max_value = supply_points.ui.supply_points_max_value
	local modifier = bar_empty:Width() / max_value -- multiplier for filling and offsetting the tiers and the bar
	local current_value_px = current_supply_points > max_value and bar_empty:Width() or modifier * current_supply_points
	bar_fill:Resize(current_value_px, bar_fill:Height())

	---------------------------------------------------
	-- Update admin icon
	---------------------------------------------------
	local admin_icon = admin_bar:SequentialFind("admin_icon")
	local tooltip = admin_icon:SequentialFind(admin_icon:Id() .. "_tooltip")
	tooltip:SequentialFind("tooltip_value_breakdown", "current_value", "dy_value"):SetText(tostring(current_supply_points))
	tooltip:SequentialFind("effect_bundle_holder"):InterfaceFunction("set_cco_effect_bundle_from_custom_bundle", current_bundle)

	---------------------------------------------------
	-- Update breakdown
	---------------------------------------------------

	local breakdown_factor_regions = tooltip:SequentialFind("tooltip_value_breakdown", "settlements_value" , "dy_value")
	local breakdown_factor_units = tooltip:SequentialFind("tooltip_value_breakdown" , "units_value" , "dy_value")
	local breakdown_factor_generals = tooltip:SequentialFind("tooltip_value_breakdown" , "generals_value" , "dy_value")
	local region_burden = SUPPLY_POINTS_DATA[faction_name][supply_points_factors.settlements]
	local unit_burden = SUPPLY_POINTS_DATA[faction_name][supply_points_factors.units]
	local character_burden = SUPPLY_POINTS_DATA[faction_name][supply_points_factors.characters]

	breakdown_factor_regions:SetText(tostring(region_burden))
	breakdown_factor_units:SetText(tostring(unit_burden))
	breakdown_factor_generals:SetText(tostring(character_burden))

	---------------------------------------------------
	-- Update tresholds
	---------------------------------------------------
	for i, tier in ipairs(supply_points.bounds) do
		local tier_entry = tresholds_holder:SequentialFind(string.format("tier_%d", i))
		tier_entry:SequentialFind(supply_points.ui.component_ids.treshold_line):SetState(current_tier_index > i and "active" or "inactive")

		local effect_bundle_key = supply_points.get_bound_effect_bundle_key(faction_name, tier)
		tier_entry:InterfaceFunction("set_tiers_bundles", cm:create_new_custom_effect_bundle(effect_bundle_key), current_bundle)
	end
end

function supply_points.ui.update_province_info_ui()
	local supply_points_component = core:get_ui_root():SequentialFind(unpack(supply_points.ui.province_admin_component_path))
	if not supply_points_component then
		script_error("supply_points.ui.update_province_details_ui() was unable to find the admin cost component.")
		return
	end
	local selected_region = cm:get_campaign_ui_manager():get_selected_settlement_region()
	local selected_region_from_selected_slot = cm:get_campaign_ui_manager():get_selected_region_slot()
	if selected_region ~= "" or selected_region_from_selected_slot ~= "" then
		local region_interface = cm:get_region(selected_region ~= "" and selected_region or selected_region_from_selected_slot)
		local province_regions = region_interface:province():regions()
		local total = 0
		for i=0, province_regions:num_items() - 1 do
			local curr_region = province_regions:item_at(i)
			-- Only add up the supply cost of regions we own
			if curr_region:owning_faction() == cm:get_local_faction(true) then
				total = total + supply_points.get_supply_points_for_region(curr_region)
			end
		end
		supply_points_component:SetText(tostring(total), "Unlocalized number, campaign/supply_points.lua , supply_points.ui.update_province_details_ui()")
	else
		script_error("supply_points.ui.update_province_details_ui(), but no region or region slot is selected.")
	end
end

--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------

cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("SUPPLY_POINTS_DATA", SUPPLY_POINTS_DATA, context)
	end
)

cm:add_loading_game_callback(
	function(context)
		SUPPLY_POINTS_DATA = cm:load_named_value("SUPPLY_POINTS_DATA", {}, context)
	end
)