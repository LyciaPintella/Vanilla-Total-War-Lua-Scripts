sea_peoples_nomad_outposts = {
	config = {
		-- The table below defines which Sea Peoples faction has access to which type of nomad outposts. The outpost types are organised
		-- in sets of three building chains used respectively when the faction owns the region, when the region belongs to another faction,
		-- and when the region is razed. When a region changes owners, any nomad outposts in it are automatically converted to the correct chain
		-- and the latter is made exclusively available for building for the respective faction. Some outposts also have separate versions per realm.
		-- This setup exists because we want the camps to have different effects according to the current status of the region they are in and,
		-- for some types of outposts, different models depending on the realm.
		nomad_outpost_types = {
			nurage_camps_lowlands = {
				faction_keys = { "phar_sea_sherden" },
				realm_name = "hittite_lowlands_realm",
				building_chains = {
					own_region = "phar_sea_ers_nomad_sherden_lowlands_own_region",
					razed_region = "phar_sea_ers_nomad_sherden_lowlands_razed_region",
					foreign_region = "phar_sea_ers_nomad_sherden_lowlands_foreign_region"
				},
			},
			nurage_camps_highlands = {
				faction_keys = { "phar_sea_sherden" },
				realm_name = "hittite_highlands_realm",
				building_chains = {
					own_region = "phar_sea_ers_nomad_sherden_highlands_own_region",
					razed_region = "phar_sea_ers_nomad_sherden_highlands_razed_region",
					foreign_region = "phar_sea_ers_nomad_sherden_highlands_foreign_region"
				},
			},
			nurage_camps_isuwa = {
				faction_keys = { "phar_sea_sherden" },
				realm_name = "hittite_isuwa_realm",
				building_chains = {
					own_region = "phar_sea_ers_nomad_sherden_isuwa_own_region",
					razed_region = "phar_sea_ers_nomad_sherden_isuwa_razed_region",
					foreign_region = "phar_sea_ers_nomad_sherden_isuwa_foreign_region"
				},
			},
			nurage_camps_yahmad = {
				faction_keys = { "phar_sea_sherden" },
				realm_name = "canaanite_yamhad_realm",
				building_chains = {
					own_region = "phar_sea_ers_nomad_sherden_yamhad_own_region",
					razed_region = "phar_sea_ers_nomad_sherden_yamhad_razed_region",
					foreign_region = "phar_sea_ers_nomad_sherden_yamhad_foreign_region"
				},
			},
			nurage_camps_retjenu = {
				faction_keys = { "phar_sea_sherden" },
				realm_name = "canaanite_retjenu_realm",
				building_chains = {
					own_region = "phar_sea_ers_nomad_sherden_retjennu_own_region",
					razed_region = "phar_sea_ers_nomad_sherden_retjennu_razed_region",
					foreign_region = "phar_sea_ers_nomad_sherden_retjennu_foreign_region"
				},
			},
			nurage_camps_fenkhu = {
				faction_keys = { "phar_sea_sherden" },
				realm_name = "canaanite_fenkhu_realm",
				building_chains = {
					own_region = "phar_sea_ers_nomad_sherden_fenkhu_own_region",
					razed_region = "phar_sea_ers_nomad_sherden_fenkhu_razed_region",
					foreign_region = "phar_sea_ers_nomad_sherden_fenkhu_foreign_region"
				},
			},
			nurage_camps_sinai = {
				faction_keys = { "phar_sea_sherden" },
				realm_name = "canaanite_sinai_realm",
				building_chains = {
					own_region = "phar_sea_ers_nomad_sherden_sinai_own_region",
					razed_region = "phar_sea_ers_nomad_sherden_sinai_razed_region",
					foreign_region = "phar_sea_ers_nomad_sherden_sinai_foreign_region"
				},
			},
			nurage_camps_lower_egypt = {
				faction_keys = { "phar_sea_sherden" },
				realm_name = "egyptian_lower_egypt_realm",
				building_chains = {
					own_region = "phar_sea_ers_nomad_sherden_lower_egypt_own_region",
					razed_region = "phar_sea_ers_nomad_sherden_lower_egypt_razed_region",
					foreign_region = "phar_sea_ers_nomad_sherden_lower_egypt_foreign_region"
				},
			},
			nurage_camps_upper_egypt = {
				faction_keys = { "phar_sea_sherden" },
				realm_name = "egyptian_upper_egypt_realm",
				building_chains = {
					own_region = "phar_sea_ers_nomad_sherden_upper_egypt_own_region",
					razed_region = "phar_sea_ers_nomad_sherden_upper_egypt_razed_region",
					foreign_region = "phar_sea_ers_nomad_sherden_upper_egypt_foreign_region"
				},
			},
			nurage_camps_western_desert = {
				faction_keys = { "phar_sea_sherden" },
				realm_name = "egyptian_western_desert_realm",
				building_chains = {
					own_region = "phar_sea_ers_nomad_sherden_western_desert_own_region",
					razed_region = "phar_sea_ers_nomad_sherden_western_desert_razed_region",
					foreign_region = "phar_sea_ers_nomad_sherden_western_desert_foreign_region"
				},
			},
			nurage_camps_nubia = {
				faction_keys = { "phar_sea_sherden" },
				realm_name = "egyptian_nubia_realm",
				building_chains = {
					own_region = "phar_sea_ers_nomad_sherden_nubia_own_region",
					razed_region = "phar_sea_ers_nomad_sherden_nubia_razed_region",
					foreign_region = "phar_sea_ers_nomad_sherden_nubia_foreign_region"
				},
			},
			nurage_camps_kush = {
				faction_keys = { "phar_sea_sherden" },
				realm_name = "egyptian_kush_realm",
				building_chains = {
					own_region = "phar_sea_ers_nomad_sherden_kush_own_region",
					razed_region = "phar_sea_ers_nomad_sherden_kush_razed_region",
					foreign_region = "phar_sea_ers_nomad_sherden_kush_foreign_region"
				},
			},
			nurage_camps_assuwa = {
				faction_keys = { "phar_sea_sherden" },
				realm_name = "aegean_assuwa_realm",
				building_chains = {
					own_region = "phar_map_ers_nomad_sherden_assuwa_own_region",
					razed_region = "phar_map_ers_nomad_sherden_assuwa_razed_region",
					foreign_region = "phar_map_ers_nomad_sherden_assuwa_foreign_region"
				},
			},
			nuraghe_camps_thrace = {
				faction_keys = { "phar_sea_sherden" },
				realm_name = "aegean_thrace_realm",
				building_chains = {
					own_region = "phar_map_ers_nomad_sherden_thrace_own_region",
					razed_region = "phar_map_ers_nomad_sherden_thrace_razed_region",
					foreign_region = "phar_map_ers_nomad_sherden_thrace_foreign_region"
				},
			},
			nuraghe_camps_achaea = {
				faction_keys = { "phar_sea_sherden" },
				realm_name = "aegean_achaea_realm",
				building_chains = {
					own_region = "phar_map_ers_nomad_sherden_achaea_own_region",
					razed_region = "phar_map_ers_nomad_sherden_achaea_razed_region",
					foreign_region = "phar_map_ers_nomad_sherden_achaea_foreign_region"
				},
			},
			nuraghe_camps_haltamti = {
				faction_keys = { "phar_sea_sherden" },
				realm_name = "mesopotamia_haltamti_realm",
				building_chains = {
					own_region = "phar_map_ers_nomad_sherden_haltamti_own_region",
					razed_region = "phar_map_ers_nomad_sherden_haltamti_razed_region",
					foreign_region = "phar_map_ers_nomad_sherden_haltamti_foreign_region"
				},
			},
			nuraghe_camps_mat_assur = {
				faction_keys = { "phar_sea_sherden" },
				realm_name = "mesopotamia_mat_assur_realm",
				building_chains = {
					own_region = "phar_map_ers_nomad_sherden_mat_assur_own_region",
					razed_region = "phar_map_ers_nomad_sherden_mat_assur_razed_region",
					foreign_region = "phar_map_ers_nomad_sherden_mat_assur_foreign_region"
				},
			},
			nuraghe_camps_mat_tamti = {
				faction_keys = { "phar_sea_sherden" },
				realm_name = "mesopotamia_mat_tamti_realm",
				building_chains = {
					own_region = "phar_map_ers_nomad_sherden_mat_tamti_own_region",
					razed_region = "phar_map_ers_nomad_sherden_mat_tamti_razed_region",
					foreign_region = "phar_map_ers_nomad_sherden_mat_tamti_foreign_region"
				},
			},
			nuraghe_camps_zagros = {
				faction_keys = { "phar_sea_sherden" },
				realm_name = "mesopotamia_zagros_realm",
				building_chains = {
					own_region = "phar_map_ers_nomad_sherden_zagros_own_region",
					razed_region = "phar_map_ers_nomad_sherden_zagros_razed_region",
					foreign_region = "phar_map_ers_nomad_sherden_zagros_foreign_region"
				},
			},
			nuraghe_camps_aber_nahra = {
				faction_keys = { "phar_sea_sherden" },
				realm_name = "mesopotamia_aber_nahra_realm",
				building_chains = {
					own_region = "phar_map_ers_nomad_sherden_aber_nahra_own_region",
					razed_region = "phar_map_ers_nomad_sherden_aber_nahra_razed_region",
					foreign_region = "phar_map_ers_nomad_sherden_aber_nahra_foreign_region"
				},
			},

			peleset_villages = {
				faction_keys = { "phar_sea_peleset" },
				building_chains = {
					own_region = "phar_sea_ers_nomad_peleset_own_region",
					razed_region = "phar_sea_ers_nomad_peleset_razed_region",
					foreign_region = "phar_sea_ers_nomad_peleset_foreign_region"
				},
				spawned_force_on_abandon = "phar_sea_fac_pel_aspiring_peleset_raiders"
					.. ",phar_sea_fac_pel_aspiring_peleset_raiders"
					.. ",phar_sea_fac_pel_aspiring_peleset_raiders,"
					.. ",phar_sea_fac_pel_peleset_slingers"
					.. ",phar_sea_fac_pel_peleset_slingers",

				spawned_force_on_razed = "phar_sea_fac_pel_aspiring_peleset_raiders"
					.. ",phar_sea_fac_pel_aspiring_peleset_raiders"
					.. ",phar_sea_fac_pel_aspiring_peleset_raiders,"
					.. ",phar_sea_fac_pel_peleset_slingers"
					.. ",phar_sea_fac_pel_peleset_slingers",
			},

			sea_peoples_villages_aegean_sea_raiders = {
				faction_keys = {
					"phar_sea_denyen",
					"phar_sea_ekwesh",
					"phar_sea_weshesh",			
				},
				building_chains = {		
					own_region = "phar_sea_ers_nomad_non_playable_aegean_sea_raiders_own_region",
					razed_region = "phar_sea_ers_nomad_non_playable_aegean_sea_raiders_razed_region",
					foreign_region = "phar_sea_ers_nomad_non_playable_aegean_sea_raiders_foreign_region"
				},
				spawned_force_on_abandon = "phar_main_sea_seafaring_raiders"
					.. ",phar_main_sea_seafaring_raiders"
					.. ",phar_main_sea_seafaring_raiders"
					.. ",phar_main_sea_aegean_light_archers"
					.. ",phar_main_sea_aegean_light_archers",

				spawned_force_on_razed = "phar_main_sea_seafaring_raiders"
					.. ",phar_main_sea_seafaring_raiders"
					.. ",phar_main_sea_seafaring_raiders"
					.. ",phar_main_sea_aegean_light_archers"
					.. ",phar_main_sea_aegean_light_archers",
			},

			sea_peoples_villages_western_islanders = {
				faction_keys = {
					"phar_sea_shekelesh",		
				},
				building_chains = {		
					own_region = "phar_sea_ers_nomad_non_playable_western_islanders_own_region",
					razed_region = "phar_sea_ers_nomad_non_playable_western_islanders_razed_region",
					foreign_region = "phar_sea_ers_nomad_non_playable_western_islanders_foreign_region"
				},
				spawned_force_on_abandon = "phar_main_sea_seafaring_clubmen"
					.. ",phar_main_sea_seafaring_clubmen"
					.. ",phar_main_sea_seafaring_clubmen"
					.. ",phar_main_sea_seafaring_slings"
					.. ",phar_main_sea_seafaring_slings",

				spawned_force_on_razed = "phar_main_sea_seafaring_clubmen"
					.. ",phar_main_sea_seafaring_clubmen"
					.. ",phar_main_sea_seafaring_clubmen"
					.. ",phar_main_sea_seafaring_slings"
					.. ",phar_main_sea_seafaring_slings",
			},

			sea_peoples_villages_sea_wanderers = {
				faction_keys = {
					"phar_sea_lukka",
					"phar_sea_teresh",
					"phar_sea_tjeker",			
				},
				building_chains = {		
					own_region = "phar_sea_ers_nomad_non_playable_sea_wanderers_own_region",
					razed_region = "phar_sea_ers_nomad_non_playable_sea_wanderers_razed_region",
					foreign_region = "phar_sea_ers_nomad_non_playable_sea_wanderers_foreign_region"
				},
				spawned_force_on_abandon = "phar_main_sea_roving_khopesh_warriors"
					.. ",phar_main_sea_roving_khopesh_warriors"
					.. ",phar_main_sea_roving_khopesh_warriors"
					.. ",phar_main_sea_seafaring_javelinmen"
					.. ",phar_main_sea_seafaring_javelinmen",

				spawned_force_on_razed = "phar_main_sea_roving_khopesh_warriors"
					.. ",phar_main_sea_roving_khopesh_warriors"
					.. ",phar_main_sea_roving_khopesh_warriors"
					.. ",phar_main_sea_seafaring_javelinmen"
					.. ",phar_main_sea_seafaring_javelinmen",
			}
		},
	}
}

-- Used to prevent building demolished code to be executed while we update the building level
sea_peoples_nomad_outposts.slot_cqi_currently_being_updated = nil

-- Remember which faction's villages spawn which forces when demolished, for convenience.
sea_peoples_nomad_outposts.spawned_forces_on_abandon = {}
sea_peoples_nomad_outposts.spawned_forces_on_razed = {}
for _, outpost_type_data in pairs(sea_peoples_nomad_outposts.config.nomad_outpost_types) do
	for _, faction_key in ipairs(outpost_type_data.faction_keys) do
		if is_string((outpost_type_data.spawned_force_on_abandon)) then
			sea_peoples_nomad_outposts.spawned_forces_on_abandon[faction_key] = outpost_type_data.spawned_force_on_abandon
		end
		if is_string((outpost_type_data.spawned_force_on_razed)) then
			sea_peoples_nomad_outposts.spawned_forces_on_razed[faction_key] = outpost_type_data.spawned_force_on_razed
		end
	end
end


-- Returns the level and building chain key, and building chain set of a building if it is a nomad outpost, nil otherwise.
function sea_peoples_nomad_outposts:nomad_outpost_level_and_chain(building_chain, building_level, region_name)
	local realm_name = phar_realms.get_realm_for_region(region_name)
	for _, outpost_type_data in pairs(self.config.nomad_outpost_types) do
		if outpost_type_data.realm_name == nil or outpost_type_data.realm_name == realm_name then
			for _, chain in pairs(outpost_type_data.building_chains) do
				if chain == building_chain then
					return building_level, building_chain
				end
			end
		end
	end
	return nil
end


-- If there is a nomad outpost in the slot, check if it needs to be converted and if yes, convert it.
function sea_peoples_nomad_outposts:update_slot(slot, index, correct_chains)
	local constructing_outpost_level = 0
	local outpost_level = 0
	local outpost_chain = ""

	if slot:is_there_construction() then
		constructing_outpost_level, outpost_chain = self:nomad_outpost_level_and_chain(slot:construction_building_chain_key(), slot:construction_building_level_record_level(), slot:region():name())
	end

	if slot:has_building() then
		outpost_level, outpost_chain = self:nomad_outpost_level_and_chain(slot:building():chain(), slot:building():level(), slot:region():name())
	end

	if not (is_number(outpost_level) and is_string(outpost_chain)) then
		return
	end

	local correct_chain = correct_chains[slot:faction():name()]
	if outpost_chain == correct_chain then
		return
	end

	local new_building_level = cm:get_building_from_building_chain(correct_chain, outpost_level)
	local constructing_building_level = ""
	if slot:is_there_construction() and is_number(constructing_outpost_level) then
		constructing_building_level = cm:get_building_from_building_chain(correct_chain, constructing_outpost_level)
	end
	out("Nomad outposts: slot " .. slot:slot_key() .. ": replacing " .. tostring(outpost_chain) .. " with " .. tostring(correct_chain))

	sea_peoples_nomad_outposts.slot_cqi_currently_being_updated = slot:command_queue_index()
	cm:replace_building_in_region_slot(slot:region():name(), index + 1, new_building_level, constructing_building_level) -- Here index is 1-based.
	sea_peoples_nomad_outposts.slot_cqi_currently_being_updated = nil
end


-- Convert the nomad outposts in the region to the correct building chains and enforce the correct available building chain for each faction.
function sea_peoples_nomad_outposts:update_region(region)
	-- Determine the current status of the region: razed, owned, or foreign to each Sea People faction, and select the corresponding building chain.
	local correct_chains = {}
	local region_name = region:name()
	local realm_name = phar_realms.get_realm_for_region(region_name)
	local is_abandoned = region:is_abandoned()
	local owning_faction = region:owning_faction()
	local owning_faction_key = owning_faction and not owning_faction:is_null_interface() and owning_faction:name()

	for _, outpost_type_data in dpairs(sea_peoples_nomad_outposts.config.nomad_outpost_types) do
		if outpost_type_data.realm_name == nil or outpost_type_data.realm_name == realm_name then
			for _, faction_key in ipairs(outpost_type_data.faction_keys) do
				local region_status = is_abandoned and "razed_region" or (faction_key == owning_faction_key) and "own_region" or "foreign_region"
				correct_chains[faction_key] = outpost_type_data.building_chains[region_status]
				--out("Nomad outposts: region " .. region:name() .. " in realm " .. realm_name .. " has status " .. region_status .. " for faction " .. faction_key .. ".")
		
				-- Enable only the correct chain for this faction and disable the others.
				for _, chain in dpairs(outpost_type_data.building_chains) do
					if chain == correct_chains[faction_key] then
						cm:remove_event_restricted_building_chain_record_for_region(chain, region_name, faction_key)
					else
						cm:add_event_restricted_building_chain_record_for_region(chain, region_name, faction_key, "")
					end
				end
			end
		end
	end

	-- Loop through the region slots and convert any nomad outposts in them to the correct chain.
	local slots = region:slot_list()
	for i = 0, slots:num_items() - 1 do
		local slot = slots:item_at(i)
		if slot:has_building() or slot:is_there_construction() then
			self:update_slot(slot, i, correct_chains) -- Slots do not know their indices, so pass them together with the slot interface.
		end
	end
end

function sea_peoples_nomad_outposts:spawn_nomad_outpost_force_from_abandon(region_slot)
	sea_peoples_nomad_outposts:spawn_nomad_outpost_force(region_slot, sea_peoples_nomad_outposts.spawned_forces_on_abandon)
end

function sea_peoples_nomad_outposts:spawn_nomad_outpost_force_from_razed(region_slot)
	sea_peoples_nomad_outposts:spawn_nomad_outpost_force(region_slot, sea_peoples_nomad_outposts.spawned_forces_on_razed)
end

function sea_peoples_nomad_outposts:spawn_nomad_outpost_force(region_slot, spawned_forces_table)
	if not region_slot or region_slot:is_null_interface() then
		script_error("ERROR: trying to spawn a force after demolishing or razing an eligible nomad outpost but the garrison residence is invalid.")
		return
	end

	local faction_name = region_slot:faction():name()
	local region_slot_x = region_slot:logical_position_x()
	local region_slot_y = region_slot:logical_position_y()
	local spawn_x, spawn_y = cm:find_nearest_valid_position(faction_name, region_slot_x, region_slot_y, true, 5, 100)
	cm:create_force(
		faction_name,
		spawned_forces_table[faction_name],
		region_slot:region():name(),
		spawn_x, spawn_y,
		true,
		nil
	)
end

function sea_peoples_nomad_outposts:setup_building_variation_tooltips(faction, region, slot, building_chain_key, building_key, level_index, component)
	-- This event basically means an icon is shown for a building that exists, is being built, or is available for construction in an ERS.
	-- Check if the building is a part of an owned_region/foreign_region/razed_region building triple for this faction.
	-- If yes, prepare a set of three tooltips, one for each variation of the building. The component initiating the event should have holders for these tooltips.
	local tooltip_holders_container = component:SequentialFind("variations_list")
	local faction_key = faction:name()

	for _, outpost_type_data in pairs(sea_peoples_nomad_outposts.config.nomad_outpost_types) do
		if table_contains(outpost_type_data.faction_keys, faction_key) then
			for variation_key, chain_key in pairs(outpost_type_data.building_chains) do
				if building_chain_key == chain_key then
					-- We found the chain of the building shown on the icon in the chain list of this outpost type.
					-- Create tooltips for all three variations.
					for tooltip_variation_key, tooltip_chain_key in pairs(outpost_type_data.building_chains) do
						-- out(tooltip_variation_key .. " variant is " .. tooltip_chain_key)
						-- Holder component id is the same as the variation key ("owned_region", etc.).
						local tooltip_building_key = cm:get_building_from_building_chain(tooltip_chain_key, level_index)
						local tooltip_ownership_label_state = tooltip_variation_key
						local tooltip_status_label_state = (tooltip_variation_key == variation_key) and "active" or "inactive"					
						local tooltip_holder = tooltip_holders_container:SequentialFind(tooltip_variation_key)
						tooltip_holder:InterfaceFunction("set_info", slot, tooltip_building_key, tooltip_ownership_label_state, tooltip_status_label_state)
					end
					-- Show the container of the tooltip holders.
					tooltip_holders_container:SetVisible(true)
					break
				end
			end
		end
	end
end


-- On first tick, update the available Nuraghe building chains for all regions.
core:add_listener(
	"NomadOutposts_FirstTickAfterWorldCreated",
	"FirstTickAfterWorldCreated",
	true,
	function(context)
		cm:iterate_regions(
			function(region)
				sea_peoples_nomad_outposts:update_region(region)
			end
		)
	end,
	true
)


-- A region has changed owners:
core:add_listener(
	"NomadOutposts_RegionFactionChange",
	"RegionFactionChangeEvent",
	true,
	function(context)
		sea_peoples_nomad_outposts:update_region(context:region())
	end,
	true
)


-- A settlement has been razed:
core:add_listener(
	"NomadOutposts_CharacterRazedSettlement",
	"CharacterRazedSettlement",
	true,
	function(context)
		sea_peoples_nomad_outposts:update_region(context:garrison_residence():region())
	end,
	true
)


-- A building has been demolished:
core:add_listener(
	"PelesetVillages_BuildingDemolished",
	"BuildingDemolished",
	function(context)
		-- Should a force be spawned?
		local slot = context:garrison_residence():slot_interface()
		if not slot or slot:is_null_interface() or slot:command_queue_index() == sea_peoples_nomad_outposts.slot_cqi_currently_being_updated then
			return
		end

		local outpost_level, outpost_chain = sea_peoples_nomad_outposts:nomad_outpost_level_and_chain(slot:building():chain(), slot:building():level(), slot:region():name())
		if not (is_number(outpost_level) and is_string(outpost_chain)) then
			return
		end

		return sea_peoples_nomad_outposts.spawned_forces_on_abandon[context:garrison_residence():faction():name()] ~= nil
	end,
	function(context)
		-- Spawn a force.
		sea_peoples_nomad_outposts:spawn_nomad_outpost_force_from_abandon(context:garrison_residence():slot_interface())
	end,
	true
)

core:add_listener(
	"PelesetVillages_CharacterPerformsRegionSlotOccupationDecision",
	"CharacterPerformsRegionSlotOccupationDecisionBeforeOutcomeApplication",
	function(context)
		if context:occupation_decision_option() ~= "occupation_decision_ers_raze_without_occupy" then
			return false
		end

		local slot = context:region_slot()
		local building = slot:building()

		if not building or building:is_null_interface() then
			return false
		end

		local outpost_level, outpost_chain = sea_peoples_nomad_outposts:nomad_outpost_level_and_chain(building:chain(), building:level(), slot:region():name())
		if not (is_number(outpost_level) and is_string(outpost_chain)) then
			return false
		end

		return sea_peoples_nomad_outposts.spawned_forces_on_razed[slot:faction():name()] ~= nil
	end,
	function(context)
		sea_peoples_nomad_outposts:spawn_nomad_outpost_force_from_razed(context:region_slot())
	end,
	true
)

core:add_listener(
	"NomadOutposts_BuildingIconCreated",
	"OnBuildingIconCreated",
	true,
	function(context)
		sea_peoples_nomad_outposts:setup_building_variation_tooltips(
			context:faction(), context:region(), context:region_slot(), context:building_chain_key(), context:building_key(), context:building_level(), UIComponent(context.component))
	end,
	true
)