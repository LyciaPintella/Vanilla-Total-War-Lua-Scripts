out("Loading troy_mythic_monsters_cerberus.lua")

------------------------------------
--
--    troy_mythic_monsters_cerberus
--
------------------------------------

-- the cerberus is still in development and placeholder records are in use, so the logic is disabled for now:
-- if true then
-- 	out("troy_mythic_monsters_cerberus.lua - DEACTIVATED")
-- 	return nil
-- end

local dbg_print = function (str)
	out("cerberus - " .. str)
end
---------------------------
-- config
---------------------------
cerberus_config = {
	id = "MYTHIC_MONSTER_CERBERUS",
	key = "cerberus",
	agent_type = "wizard",
	agent_subtype = "troy_mth_agent_cerberus",
	settlement_panel = "settlement_panel",
	shade_labor = {
		provincial_initiative = {
			record = "troy_mth_edict_cerberus",
			building_dependency = nil, -- temple_of_hades.building_records
			episodic_restriction_building_required_key = "campaign_localised_strings_string_troy_mth_mythic_monsters_initiative_building_required",
			episodic_restriction_not_enough_resources_key = "campaign_localised_strings_string_troy_mth_mythic_monsters_initiative_not_enough_souls",
			cost_per_turn = { 
				troy_mth_souls = 50
			},
			cost_per_turn_skill_key = "troy_mth_agent_cerberus_skill_tier3_soul_economy_upgrade",
			cost_per_turn_amount_mod = 0.4,
		},
		agent_action = {

		}
	},
	temple_of_hades = {
		building_records = {
			[1] = "troy_mth_special_cerberus_3",
			[2] = "troy_mth_special_cerberus_5"
		},
	},
	resource_key = "troy_mth_souls",
	resource_tooltip_title = "troy_mth_cerberus_souls_tooltip_title",
	resource_tooltip_description = "troy_mth_cerberus_souls_tooltip_description",
	unit_key = "troy_mth_gen_myth_cerberus",
	panel_background = "cerberus",
	panel_flavour_text = "ui_text_replacements_localised_text_hp_desc_unit_cerberus",
	unit_category_icon = "UI/common ui/unit_category_icons/troy_mth_cerberus.png",
	monster_button_icon = "UI/skins/default/troy_mth_cerberus_button.png",
	agent_resource_cost = "troy_mythic_monster_cost",
	battle_skills = {
		[1] = "troy_mth_cerberus_fires_of_phlegethon",
		[2] = "troy_mth_cerberus_howl_of_the_underworld",
		[3] = "troy_mth_cerberus_summon_shades",
	},
	unlockable_units = {
		{ key = "troy_mth_gen_myth_wretched_shades", antagonist = { initial_count = 3, replenish_chance_perc = 50, }, },
		{ key = "troy_mth_gen_myth_bowmen_elysium", antagonist = { initial_count = 2, replenish_chance_perc = 25, }, },
		{ key = "troy_mth_gen_myth_spears_elysium", antagonist = { initial_count = 1, replenish_chance_perc = 15, }, },
		{ key = "troy_mth_gen_myth_shade_giants", antagonist = { initial_count = 1, replenish_chance_perc = 15, }, },
	},
	unlockable_buildings = {
		default = {
			[1] = {
				building_level_key = "troy_mth_special_cerberus_3",
				culture_variant_key = "troy_mth_special_cerberus_3",
			},
			[2] = {
				building_level_key = "troy_mth_special_cerberus_5",
				culture_variant_key = "troy_mth_special_cerberus_5",
			}
		},
		-- faction specific
		troy_amazons_trj_penthesilea = {
			[1] = {
				building_level_key = "troy_mth_horde_special_cerberus_3",
				culture_variant_key = "troy_mth_horde_special_cerberus_3",
			},
			[2] = {
				building_level_key = "troy_mth_horde_special_cerberus_5",
				culture_variant_key = "troy_mth_horde_special_cerberus_5",
			}
		},
		troy_rem_horde_aethiopians = {
			[1] = {
				building_level_key = "troy_mth_horde_special_cerberus_3",
				culture_variant_key = "troy_mth_horde_special_cerberus_3",
			},
			[2] = {
				building_level_key = "troy_mth_horde_special_cerberus_5",
				culture_variant_key = "troy_mth_horde_special_cerberus_5",
			}
		},
	},
	display_buildings = {
		default = {
			[1] = {
				building_level_key = "troy_mth_special_cerberus_3",
				culture_variant_key = "troy_mth_special_cerberus_3",
			},
		},
		-- faction specific
		troy_amazons_trj_penthesilea = {
			[1] = {
				building_level_key = "troy_mth_horde_special_cerberus_3",
				culture_variant_key = "troy_mth_horde_special_cerberus_3",
			},
		},
		troy_rem_horde_aethiopians = {
			[1] = {
				building_level_key = "troy_mth_horde_special_cerberus_3",
				culture_variant_key = "troy_mth_horde_special_cerberus_3",
			},
		},
	},
	overview_panel = {
		feature_1 = {
			title = "ui_text_replacements_localised_text_troy_mth_monster_selection_cerberus_feature_souls_title",
			infotext = "ui_text_replacements_localised_text_troy_mth_monster_selection_cerberus_feature_souls_long_desc",
		},
		feature_2 = {
			title = "ui_text_replacements_localised_text_troy_mth_monster_selection_cerberus_feature_shades_title",
			infotext = "ui_text_replacements_localised_text_troy_mth_monster_selection_cerberus_feature_shades_long_desc",
		},
		feature_3 = {
			title = "ui_text_replacements_localised_text_troy_mth_monster_selection_cerberus_feature_shade_labour_title",
			infotext = "ui_text_replacements_localised_text_troy_mth_monster_selection_cerberus_feature_shade_labour_long_desc",
		},
	},
	monster_progression = {
		default = {
			[1] = {
				node_id = "node_1",
				rank_req = 2,
				skills = {
					[1] = "troy_mth_agent_cerberus_skill_tier1_cerberus_workforce",
					[2] = "troy_mth_agent_cerberus_skill_tier1_shade_battlefield_healing",
					[3] = "troy_mth_agent_cerberus_skill_tier1_shade_explosion",
				},
			},
			[2] = {
				node_id = "node_2",
				rank_req = 3,
				skills = {
					[1] = "troy_mth_agent_cerberus_skill_tier2_summon_marksmen",
					[2] = "troy_mth_agent_cerberus_skill_tier2_summon_shade_giants",
					[3] = "troy_mth_agent_cerberus_skill_tier2_summon_spearmasters",
				},
			},
			[3] = {
				node_id = "node_3",
				rank_req = 4,
				skills = {
					[1] = "troy_mth_agent_cerberus_skill_tier3_all_abilities_cooldown",
					[2] = "troy_mth_agent_cerberus_skill_tier3_soul_economy_upgrade",
					[3] = "troy_mth_agent_cerberus_skill_tier3_damage_distribution",
				},
			},
			[4] = {
				node_id = "node_4",
				rank_req = 5,
				skills = {
					[1] = "troy_mth_agent_cerberus_skill_tier4_cerberus_battle_upgrade",
					[2] = "troy_mth_agent_cerberus_skill_tier4_global_ability_flames_of_phlegethon",
					[3] = "troy_mth_agent_cerberus_skill_tier4_unit_durability_upgrade",
				},
			},
		},
		-- skill set override for Penthesilea
		troy_amazons_trj_penthesilea = {
			[1] = {
				node_id = "node_1",
				rank_req = 2,
				skills = {
					[1] = "troy_mth_agent_cerberus_skill_tier1_horde_cerberus_workforce",
					[2] = "troy_mth_agent_cerberus_skill_tier1_shade_battlefield_healing",
					[3] = "troy_mth_agent_cerberus_skill_tier1_shade_explosion",
				},
			},
			[2] = {
				node_id = "node_2",
				rank_req = 3,
				skills = {
					[1] = "troy_mth_agent_cerberus_skill_tier2_summon_marksmen",
					[2] = "troy_mth_agent_cerberus_skill_tier2_summon_shade_giants",
					[3] = "troy_mth_agent_cerberus_skill_tier2_summon_spearmasters",
				},
			},
			[3] = {
				node_id = "node_3",
				rank_req = 4,
				skills = {
					[1] = "troy_mth_agent_cerberus_skill_tier3_all_abilities_cooldown",
					[2] = "troy_mth_agent_cerberus_skill_horde_tier3_soul_economy_upgrade",
					[3] = "troy_mth_agent_cerberus_skill_tier3_damage_distribution",
				},
			},
			[4] = {
				node_id = "node_4",
				rank_req = 5,
				skills = {
					[1] = "troy_mth_agent_cerberus_skill_tier4_cerberus_battle_upgrade",
					[2] = "troy_mth_agent_cerberus_skill_tier4_global_ability_flames_of_phlegethon",
					[3] = "troy_mth_agent_cerberus_skill_horde_tier4_unit_durability_upgrade",
				},
			},
		},
		troy_rem_horde_aethiopians = {
			[1] = {
				node_id = "node_1",
				rank_req = 2,
				skills = {
					[1] = "troy_mth_agent_cerberus_skill_tier1_horde_cerberus_workforce",
					[2] = "troy_mth_agent_cerberus_skill_tier1_shade_battlefield_healing",
					[3] = "troy_mth_agent_cerberus_skill_tier1_shade_explosion",
				},
			},
			[2] = {
				node_id = "node_2",
				rank_req = 3,
				skills = {
					[1] = "troy_mth_agent_cerberus_skill_tier2_summon_marksmen",
					[2] = "troy_mth_agent_cerberus_skill_tier2_summon_shade_giants",
					[3] = "troy_mth_agent_cerberus_skill_tier2_summon_spearmasters",
				},
			},
			[3] = {
				node_id = "node_3",
				rank_req = 4,
				skills = {
					[1] = "troy_mth_agent_cerberus_skill_tier3_all_abilities_cooldown",
					[2] = "troy_mth_agent_cerberus_skill_horde_tier3_soul_economy_upgrade",
					[3] = "troy_mth_agent_cerberus_skill_tier3_damage_distribution",
				},
			},
			[4] = {
				node_id = "node_4",
				rank_req = 5,
				skills = {
					[1] = "troy_mth_agent_cerberus_skill_tier4_cerberus_battle_upgrade",
					[2] = "troy_mth_agent_cerberus_skill_tier4_global_ability_flames_of_phlegethon",
					[3] = "troy_mth_agent_cerberus_skill_horde_tier4_unit_durability_upgrade",
				},
			},
		},

	},
	monster_effects = {
		effects_from_buildings = {
		},
		skill_effects = {
		},
		stance_effects = {
		},
	},
	block_cerberus_units_replenishment_effect = "troy_mth_cerberus_block_replenishment_to_faction_HIDDEN",
	
}

-- shade labor provincial initiative is depending of temple of hades building records
cerberus_config.shade_labor.provincial_initiative.building_dependency = cerberus_config.temple_of_hades.building_records

---------------------------
-- implementation
---------------------------
mythic_monster_cerberus = {
	---------------------------
	-- defines
	---------------------------
	config = cerberus_config,

	---------------------------
	-- data for save (need to be per faction)
	---------------------------
	persistent = {
		monster_cqi = false,
		last_pos = { region_name = "", province_name = "" },
		unlocked_tiers = {},
	},
	
	---------------------------
	-- events
	---------------------------
	events = {
		FactionTurnEnd = function(self, context)
			local faction = context:faction()
			local faction_name = faction:name()

			if self:is_locked(faction_name) then
				return
			end

			-- check enough faction resources ONLY for active initiatives
			local enough_resources,provinces_names,provinces_count = self:check_enough_faction_initiative_resources(faction_name, false)

			-- handle per turn functionality
			if provinces_count > 0 then
				if not enough_resources then
					-- cancelling the edicts
					for province_name, _ in pairs(provinces_names) do
						cm:clear_province_initiative(province_name, faction_name)
					end
				else
					-- let pay for the edicts
					self:province_initiative_payment(faction, false, provinces_count)
				end
			end
		end,

		FactionTurnStart = function(self, context)
			local faction_name = context:faction()
			if self:is_locked(faction_name) then return end

			self:province_initiative_restrictions_update(faction)
		end,

		-- model
		FactionLeaderIssuesEdict = function(self, context)
			local faction_id = context:faction():name()
			if self:is_locked(faction_id) then return end

			local edict_id = context:initiative_key()
			if not edict_id or edict_id ~= self.config.shade_labor.provincial_initiative.record then return end

			local province_id = context:province()
			
			cm:set_public_order_of_province_for_region(cm:model():world():province_manager():province_for_province_key(province_id):regions():item_at(0):name(), 0)
			cm:set_public_order_disabled_for_province(faction_id, province_id, true)
		end,

		-- model
		FactionLeaderRemovedEdict = function(self, context)
			local faction_id = context:faction():name()
			if self:is_locked(faction_id) then return end

			local edict_id = context:initiative_key()
			if not edict_id or edict_id ~= self.config.shade_labor.provincial_initiative.record then return end

			local province_id = context:province()

			cm:set_public_order_disabled_for_province(faction_id, province_id, false)
		end,

		-- temple of hades building completed
		BuildingCompleted = function(self, context)
			local building_record = context:building():name()
			local found = false
			for _, v in ipairs(self.config.shade_labor.provincial_initiative.building_dependency) do
				if v == building_record then
					found = true
					break
				end
			end

			if not found then
				return
			end

			local faction = context:building():faction()
			local faction_name = faction:name()
			local province_name = context:building():region():province_name()

			if self:is_locked(faction_name) then
				dbg_print("should not be able to build this building if the cerberus is Locked: " .. building_record .. " for faction " .. faction_name .. " in province " .. province_name)
				return
			end

			local has_resources = self:province_initiative_payment(faction, true)

			self:province_initiative_restriction_set(faction_name, province_name, has_resources, found)
		end,

		-- temple of hades building demolished
		BuildingDemolished = function(self, context)
			local building_record = context:building():name()
			local found = false
			for _, v in ipairs(self.config.shade_labor.provincial_initiative.building_dependency) do
				if v == building_record then
					found = true
					break
				end
			end

			if not found then
				return
			end

			local faction = context:building():faction()
			local faction_name = faction:name()
			local province = context:building():region():province()
			local building_region_name = context:building():region():name()
			local has_resources = self:province_initiative_payment(faction, true)
							
			-- let check if required building still exists in the province
			local regions = province:regions()
			found = false
			for j = 0, regions:num_items() - 1 do
				local region = regions:item_at(j)
				local owning_faction = region:owning_faction()
				if not owning_faction:is_null_interface()  and owning_faction:name() == faction_name and region:name() ~= building_region_name then
					for _,v in ipairs(self.config.shade_labor.provincial_initiative.building_dependency) do
						if region:building_exists(v) then
							found = true
							break
						end
					end
				end
			end

			self:province_initiative_restriction_set(faction_name, province:name(), has_resources, found)

			if not found then
				local region = context:building():region()
				if self:has_province_initiative_in_region(region, true) then
					cm:clear_province_initiative(province:name(), faction_name)
				end
			end
		end,

		-- region ownership change
		RegionFactionChangeEvent = function(self, context)
			local curr_faction = context:region():owning_faction()
			local prev_faction = context:previous_faction()

			self:province_initiative_restrictions_update_province(curr_faction, context:region():province())
			self:province_initiative_restrictions_update_province(prev_faction, context:region():province())
		end,

		PooledResourceTransactionEvent = function(self, context)
			
			local faction = context:faction()
			local faction_name = faction:name()
			if self:is_locked(faction_name) then
				return
			end

			-- is transaction is for any of the resources needed for the province initiative
			local res_key = context:resource():key()
			local costs = self.config.shade_labor.provincial_initiative.cost_per_turn
			local should_update = false
			for key, amount in pairs(costs) do
				if key == res_key then
					should_update = true
					break
				end
			end

			if should_update then

				-- immediately after some events like "BuildingDemolished" there is resource transaction.
				-- for "BuildingDemolished" building is still exists in the region, and the calculations for province inititative restrictions is not correct
				
				-- one tick delay will be enough for the method which is calling the problematic events to finish
				cm:callback(
					function()
						local faction_to_update = cm:get_faction(faction_name)
						if faction_to_update:is_null_interface() then
							dbg_print("Error : province_initiative_restrictions_update - could not found faction " .. faction_name)
							return
						end
						self:province_initiative_restrictions_update(faction_to_update)
					end, 
					0.1
				)
			end
		end,

		-- update recruitable units per province where the CERBERUS currently is
		CharacterFinishedMovingEvent = function(self, context)
			local character = context:character()
			if self:is_locked(character:faction():name()) then return end

			if character:character_subtype_key() == self.config.agent_subtype or self:has_cerberus_in_army(character) then
				self:update_recruitable_units(context:character():region(), character)
			end
		end,

		-- update recruitable units per province where the CERBERUS currently is
		CharacterCreated = function(self, context)
			local character = context:character()
			if self:is_locked(character:faction():name()) then return end

			if character:character_subtype_key() == self.config.agent_subtype then
				self:update_recruitable_units(context:character():region(), character)
			end
		end,

		-- update whether souls should be displayed in recruitment panels
		PanelOpenedCampaign = function(self, context)
			if not self:is_locked(cm:get_local_faction_name(true)) and (context.string == "units_recruitment" or context.string == "mercenary_recruitment") then
				self.display_total_souls(UIComponent(context.component))
			end
		end,
	},

	---------------------------
	-- events first handled by mythic_monsters_common
	---------------------------
	on_new_game_started = function(self, context)
		dbg_print("start_new_game_all_factions")

		-- restrict the specific provincial edict/initiative for all factions
		cm:add_event_restricted_province_initiative_record_for_faction(self.config.shade_labor.provincial_initiative.record, "", "")

		for _, v in ipairs(self.config.temple_of_hades.building_records) do
			cm:add_event_restricted_building_record(v)
		end

		-- true: add listeners for my events table
		-- false: I'll handle my events by myself
		return true
	end,

	on_first_tick = function(self, context)
	--remove edict text for horde
		local campaign_factions_list = cm:model():world():faction_list()
		for i = 0, campaign_factions_list:num_items() - 1 do 
			local faction = campaign_factions_list:item_at(i)
			local faction_key = campaign_factions_list:item_at(i):name()
			if (faction_key == "troy_amazons_trj_penthesilea" or faction_key == "troy_rem_horde_aethiopians") and not self:is_locked(faction_key) and faction:is_human() then
				self.config.overview_panel.feature_3 = nil
			end
		end
		return true
	end,

		-- monster panel is opened
	on_monster_panel_opened = function(self, context)
		local panel = core:get_ui_root():SequentialFind(context.string)

		local bar = panel:SequentialFind("bars_holder", "cerberus")
		if bar then
			local faction = cm:get_faction(cm:get_local_faction_name(true))
			local souls = faction:pooled_resource(self.config.resource_key)
			local text = bar:SequentialFind("txt_current_resource")
			local income = bar:SequentialFind("txt_income_resource")
			local res_template = bar:SequentialFind("res_template")

			text:SetText(souls:value())
			income:SetText(souls:income())
			bar:PropagateVisibility(true)
			
			if res_template then
				res_template:SetTooltipWithTitle(self.config.resource_tooltip_title, self.config.resource_tooltip_description, true)
			end
		end

		local background = panel:SequentialFind("background")
		if background then
			background:SetState(self.config.panel_background)
		end

		local flavour_text = panel:SequentialFind("dy_monster_flavour")
		if flavour_text then
			flavour_text:SetText(common.get_localised_string(self.config.panel_flavour_text))
		end
	end,

	on_monster_panel_closed = function(self, context)
	end,

	on_level_up = function(self, context)
		local character = context:character()
		local rank = character:rank()

		for _, node in ipairs(mythic_monsters_common:get_monster_progression_for_faction(character:faction(), self)) do
			if node.rank_req == rank then
				-- unlock skill tier
				if not is_table(self.persistent.unlocked_tiers) and self.persistent.unlocked_tiers == nil then
					self.persistent.unlocked_tiers = {}
				end
				table.insert(self.persistent.unlocked_tiers, rank, {state = "unlocked", node = node, skill = ""}) -- key is rank for skill, value is state from ui
				out("rank " .. rank .. "self.persistent.unlocked_tiers[rank] " .. tostring(self.persistent.unlocked_tiers) .. tostring(self.persistent.unlocked_tiers[rank].state))
			end
		end
	end,

	---------------------------
	-- methods
	---------------------------
	reset_persistent = function(self)
		self.persistent = {
			monster_cqi = false,
			last_pos = { region_name = "", province_name = "" },
			unlocked_tiers = {},
		}
	end,

	update_recruitable_units = function(self, region, character)
		local old_region_name = self.persistent.last_pos.region_name
		local new_region_name = (region and not region:is_null_interface() and region:name() or "")

		if old_region_name ~= new_region_name then

			self.persistent.last_pos.region_name = new_region_name
			
			local old_province_name = self.persistent.last_pos.province_name
			local new_province_name = (new_region_name ~= "" and region:province():name() or "")

			if old_province_name ~= new_province_name then

				self.persistent.last_pos.province_name = new_province_name
				
				-- remove old province recruitable units
				self:set_province_recruitable_units(old_region_name, false, character)

				-- set new province recruitable units
				self:set_province_recruitable_units(new_region_name, true, character)

			end
		
		end
	end,

	set_province_recruitable_units = function(self, region_name, add_units, character)
		if not region_name or region_name == "" then return end

		local region = cm:model():world():region_manager():region_by_key(region_name)
		if not region or region:is_null_interface() then return end

		for _, unit_data in pairs(self.config.unlockable_units) do
			local unit_id = unit_data.key
			if add_units then

				local count = 9
				local replenishment_chance_percentage = 100.0
				local max_units = 9
				local max_units_replenished_per_turn = 100.0
				local xp_level = 0
				local faction_restricted_record = character:faction():name()
				local subculture_restricted_record = "" 
				local tech_restricted_record = ""

				dbg_print("add recruitable unit "..unit_id.." in province "..region:province():name())

				cm:add_unit_to_province_mercenary_pool(region, unit_id, count, replenishment_chance_percentage, 
														max_units, max_units_replenished_per_turn, xp_level, 
														faction_restricted_record, subculture_restricted_record, tech_restricted_record)
			else

				local custom_id = ""

				dbg_print("remove recruitable unit "..unit_id.." from province "..region:province():name())

				cm:remove_unit_from_province_mercenary_pool(region, unit_id, custom_id)

			end

		end
	end,

	has_cerberus_in_army = function(self, character)
		if not character or character:is_null_interface() then return false end

		local military_force = character:has_military_force() and character:military_force()
		if not military_force or military_force:is_null_interface() then return false end

		local character_list = military_force:character_list()
		local character_count = character_list:num_items()
		for i = 0, character_count - 1 do
			local nth_character = character_list:item_at(i)
			if nth_character:character_subtype(self.config.agent_subtype) then
				return { cqi = nth_character:command_queue_index() }
			end
		end
	end,

	get_data_for_faction = function(self, faction_key, init_if_not_exist)
		if not self.persistent[faction_key] and init_if_not_exist then
			-- defining what to save for the monster per faction
			self.persistent[faction_key] = {
			}
		end
		return self.persistent[faction_key]
	end,

	is_locked = function(self, faction_key)
		return not mythic_monsters_common:is_monster_unlocked(self.config.id, faction_key)
	end,

	on_monster_unlocked = function(self, faction_key)
		dbg_print("on_monster_unlocked")
		--local data = self.get_data_for_faction(self, faction_key, true)
		
		-- just unlocked
		-- enable edict for the faction
		cm:remove_event_restricted_province_initiative_record_for_faction(self.config.shade_labor.provincial_initiative.record, faction_key)

		-- disable edict in all provinces for the faction until required building is completed
		local faction = cm:get_faction(faction_key)
		self:province_initiative_restrictions_update(faction)

		for _, v in ipairs(self.config.temple_of_hades.building_records) do
			cm:remove_event_restricted_building_record_for_faction(v, faction_key)
		end

		cm:apply_effect_bundle(self.config.block_cerberus_units_replenishment_effect, faction_key, 0)

		-- remove the edict text for penthesilea as she is a horde faction
		if faction_key == "troy_amazons_trj_penthesilea" then
			self.config.overview_panel.feature_3 = nil
		end
	end,

	on_monster_created = function(self, character)
	end,

	on_monster_recruited = function(self, character)
	end,

	province_initiative_payment = function(self, faction, check_only, _quantity)
		-- payment check
		local quantity = _quantity or 1
		local has_resources = true
		local costs = self.config.shade_labor.provincial_initiative.cost_per_turn
		for key,amount in pairs(costs) do
			if amount > 0 then
				local pooled_resource = faction:pooled_resource(key)
				if pooled_resource:is_null_interface() then
					dbg_print("Error: faction " .. faction:name() .. " doesn't have access to pooled resource: " .. key)
					has_resources = false
					break
				end

				local character_family_member = cm:model():family_member_for_command_queue_index(self.persistent.monster_cqi)
				local character
				if character_family_member and not character_family_member:is_null_interface() then 
					character = character_family_member:character()
				end
				
				if character and character:has_skill(self.config.shade_labor.provincial_initiative.cost_per_turn_skill_key) then
					amount = amount * self.config.shade_labor.provincial_initiative.cost_per_turn_amount_mod
				end

				local res_amount = pooled_resource:value()
				has_resources = (amount * quantity) <= res_amount
				if not has_resources then
					break
				end
			end
		end
	
		--transaction
		if has_resources and not check_only then
			for key,amount in pairs(costs) do
				if amount > 0 then
					cm:faction_add_pooled_resource(faction:name(), key, "troy_resource_factor_faction", -(amount * quantity))
				end
			end
		end

		return has_resources
	end,

	province_initiative_restriction_set = function(self, faction_name, province_name, has_resources, has_building)
		dbg_print("province_initiative_restriction_set( " .. faction_name .. " , " .. province_name .. " , " .. tostring(has_resources) .. " , " .. tostring(has_building) .. " )")

		local whose_turn_is_it = cm:model():world():whose_turn_is_it()
		if whose_turn_is_it:name() ~= faction_name then
			return
		end

		if has_resources and has_building then
			-- we have resources and required building to enable the edict
			cm:remove_event_restricted_province_initiative_record_for_province_for_faction(self.config.shade_labor.provincial_initiative.record, province_name, faction_name)
		else
			local reason
			if not has_building then
				-- we don't have required building
				reason = self.config.shade_labor.provincial_initiative.episodic_restriction_building_required_key
			end

			if not has_resources then
				-- we don't have enough resources
				if reason then
					reason = reason .. "," .. self.config.shade_labor.provincial_initiative.episodic_restriction_not_enough_resources_key
				else
					reason = self.config.shade_labor.provincial_initiative.episodic_restriction_not_enough_resources_key
				end
			end
			cm:add_event_restricted_province_initiative_record_for_province_for_faction(self.config.shade_labor.provincial_initiative.record, province_name, faction_name, reason)
		end
	end,

	province_initiative_restrictions_update_province = function(self, faction, province, _has_resources)
		local faction_name = faction:name()
		if self:is_locked(faction_name) then
			return
		end

		-- if we have resource shortage, we shouldn't be able to issue shade labor edict
		local has_resources = _has_resources
		if has_resources == nil then
			has_resources = self:province_initiative_payment(faction, true)
		end


		--check if temple of hades building exists in the province
		local regions = province:regions()
		local found = false
		for j = 0, regions:num_items() - 1 do
			local region = regions:item_at(j)
			local owning_faction = region:owning_faction()
			if not owning_faction:is_null_interface()  and owning_faction:name() == faction_name then
				for _,v in ipairs(self.config.shade_labor.provincial_initiative.building_dependency) do
					if region:building_exists(v) then
						found = true
						break
					end
				end
			end
		end

		self:province_initiative_restriction_set(faction_name, province:name(), has_resources, found)
	end,

	province_initiative_restrictions_update = function(self, faction)
		local faction_name = faction:name()
		if self:is_locked(faction_name) then
			return
		end

		-- if we have resource shortage, we shouldn't be able to issue shade labor edict
		local has_resources = self:province_initiative_payment(faction, true)
		local provinces = faction:province_list()
		for i = 0, provinces:num_items() - 1 do
			local province = provinces:item_at(i)			
			self:province_initiative_restrictions_update_province(faction, province, has_resources)
		end
	end,

	has_province_initiative_in_region = function(self, region, include_selected)
		-- is in second phase
		local is_edict_active = region:get_active_edict_key() == self.config.shade_labor.provincial_initiative.record
		if not include_selected or is_edict_active then
			return is_edict_active
		end

		-- is in first phase
		local is_edict_selected = region:get_selected_edict_key() == self.config.shade_labor.provincial_initiative.record
		return is_edict_selected
	end,

	check_enough_faction_initiative_resources = function(self, faction_name, include_selected_initiatives)
		local faction = cm:get_faction(faction_name)

		-- active or selected initiatives of our type per province count
		local provinces_count = 0
		local provinces_names = {}

		local regions = faction:region_list()
		for i = 0, regions:num_items() - 1 do
			local region = regions:item_at(i)
			if self:has_province_initiative_in_region(region, include_selected_initiatives) then
				local province_name = region:province_name()
				if not provinces_names[province_name] then
					provinces_count = provinces_count + 1
					provinces_names[province_name] = true
				end
			end
		end
		
		local enough = true
		if provinces_count > 0 then
			enough = self:province_initiative_payment(faction, true, provinces_count)
		end

		return enough, provinces_names, provinces_count
	end,

	display_total_souls = function(component)
		local total_souls = component:SequentialFind("total_souls")
		if total_souls then
			local local_faction = cm:get_faction(cm:get_local_faction_name(true))
			if local_faction:has_pooled_resource("troy_mth_souls") then
				total_souls:SetVisible(true)
				total_souls:SetStateText(tostring(local_faction:pooled_resource("troy_mth_souls"):value()))
			end
		end
	end
}

-- returns a simple or composite ID
mythic_monster_cerberus.id = function(self, suff) 
	return suff and suff ~= "" and self.config.id.."_"..suff or self.config.id 
end

mythic_montser_cerberus_check_faction_initiative_resources = function(faction_name)
	if mythic_monster_cerberus:is_locked(faction_name) then
		return true
	end

	local enough_resources,_,_ = mythic_monster_cerberus:check_enough_faction_initiative_resources(faction_name, true)
	return enough_resources
end


-------------------------------------------
-- 
--    debug/helper code - TO BE DELETED
--
-------------------------------------------

-- core:add_listener(
-- 	"mythic_monsters_character_created",
-- 	"CharacterCreated",
-- 	function(context)
-- 		return true
-- 	end,
-- 	function(context)
-- 		local subtype = context:character():character_subtype_key()
-- 		local faction_name = context:character():faction():name()
-- 		for _, v in ipairs(mythic_monsters_common.monsters) do
-- 			if is_table(v) and v.config and v.config.agent_sub_type and v.config.agent_sub_type == subtype then
-- 				dbg_print("mythic monster " .. subtype .. " unlocked for " .. faction_name)
-- 				if not mythic_monsters_common:is_monster_unlocked(v.config.id, faction_name) then
-- 					mythic_monsters_common:unlock_monster(v.config.id, faction_name)
-- 				end
-- 			end
-- 		end
-- 	end,
-- 	true
-- )

-- mythic_monsters_common:unlock_monster("MYTHIC_MONSTER_CERBERUS", cm:get_local_faction_name())
return mythic_monster_cerberus