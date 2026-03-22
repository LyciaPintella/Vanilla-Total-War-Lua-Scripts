out("Loading phar_courtesy_gifts.lua")

courtesy_gifts = {}

courtesy_gifts.is_enabled_in_multiplayer = false -- multiplayer is not supported. Something might not work if you change this variable
courtesy_gifts.resource_factor = "troy_resource_factor_faction"

-- Configuration for Courtesy Gifts when the player is ruler
-- When playing as a ruler, all vassals will make gifts to the ruler in the form of incidents every X turns
courtesy_gifts.ruler = {
	cooldown_per_vassal = 8,

	gifts = {
		resources = {
			incident_key = "phar_main_courtesy_gift_resources_received",
			weight = 50, -- weight for chosing this type of gift
			bonus_diplomatic_relations = 2, -- from -6 to +6 (-6 beeing give BIG CHUNK NEGATIVE BONUS, while +6 beeing give BIG CHUNK POSITIVE BONUS)

			list = {
				troy_food = {
					threshold = 2000,
					random_weight = 35, -- used when picking random resource
					percentage_from_vassal_to_give = 3.5, -- X% amount from the Vassal's treasury of this resource
				},
				troy_stones = {
					threshold = 1000,
					random_weight = 25, -- used when picking random resource
					percentage_from_vassal_to_give = 7.5, -- X% amount from the Vassal's treasury of this resource
				},
				troy_wood = {
					threshold = 400,
					random_weight = 25, -- used when picking random resource
					percentage_from_vassal_to_give = 7.5, -- X% amount from the Vassal's treasury of this resource
				},
				troy_bronze = {
					threshold = 400,
					random_weight = 10, -- used when picking random resource
					percentage_from_vassal_to_give = 7.5, -- X% amount from the Vassal's treasury of this resource
				},
				troy_gold = {
					threshold = 200,
					random_weight = 10, -- used when picking random resource
					percentage_from_vassal_to_give = 5, -- X% amount from the Vassal's treasury of this resource
				},
			}
		},

		units = {
			incident_key = "phar_main_courtesy_gift_units_received",
			weight = 50, -- weight for chosing this type of gift
			bonus_diplomatic_relations = 2, -- from -6 to +6 (-6 beeing give BIG CHUNK NEGATIVE BONUS, while +6 beeing give BIG CHUNK POSITIVE BONUS)
			num_units_to_give = { min = 1, max = 3 },

			-- List of units from which to choose randomly based on the vassal's culture
			list = {
				phar_main_clt_canaan = {
					"phar_main_nat_fen_armoured_canaanite_chariots",
					"phar_main_nat_fen_armoured_syrian_archers",
					"phar_main_nat_fen_canaanite_recruits",
					"phar_main_nat_fen_canaanite_rock_throwers",
					"phar_main_nat_fen_canaanite_sellswords",
					"phar_main_nat_fen_canaanite_shieldbearers",
					"phar_main_nat_fen_canaanite_skirmishers",
					"phar_main_nat_fen_light_syrian_archers",
					"phar_main_nat_fen_renowned_canaanite_swordsmen",
					"phar_main_nat_fen_veteran_canaanite_shieldbearers",
					"phar_main_nat_fen_veteran_canaanite_swordsmen",
					"phar_main_nat_sin_armoured_canaanite_chariots",
					"phar_main_nat_sin_habiru_archers",
					"phar_main_nat_sin_habiru_mercenaries",
					"phar_main_nat_sin_habiru_militia",
					"phar_main_nat_sin_habiru_raiders",
					"phar_main_nat_sin_habiru_skirmishers",
					"phar_main_nat_sin_renowned_habiru_slingers",
					"phar_main_nat_sin_shasu_archers",
					"phar_main_nat_sin_shasu_tribesmen",
					"phar_main_nat_sin_shasu_warriors",
				},
				phar_main_clt_hatti = {
					"phar_main_nat_hig_anatolian_militia",
					"phar_main_nat_hig_armoured_anatolian_spears",
					"phar_main_nat_hig_heavy_anatolian_chariots",
					"phar_main_nat_hig_kaskian_axemen",
					"phar_main_nat_hig_kaskian_chargers",
					"phar_main_nat_hig_kaskian_javelin_throwers",
					"phar_main_nat_hig_kaskian_raiders",
					"phar_main_nat_hig_kaskian_tribesmen",
					"phar_main_nat_hig_phrygian_skirmishers",
					"phar_main_nat_hig_phrygian_spearmen",
					"phar_main_nat_hig_renowned_phrygian_javelin_throwers",
					"phar_main_nat_isu_armoured_anatolian_spears",
					"phar_main_nat_isu_armoured_anatolian_swordsmen",
					"phar_main_nat_isu_armoured_hittite_skirmishers",
					"phar_main_nat_isu_heavy_anatolian_chariots",
					"phar_main_nat_isu_hittite_archers",
					"phar_main_nat_isu_isuwan_axemen",
					"phar_main_nat_isu_isuwan_militia",
					"phar_main_nat_isu_isuwan_slingers",
					"phar_main_nat_isu_luwian_spearmen",
					"phar_main_nat_isu_luwian_swordsmen",
					"phar_main_nat_isu_renowned_isuwan_axemen",
				},
				phar_main_clt_kemet = {
					"phar_main_nat_low_armoured_lower_egyptian_archers",
					"phar_main_nat_low_egyptian_chariots",
					"phar_main_nat_low_light_egyptian_chariots",
					"phar_main_nat_low_lower_egyptian_archers",
					"phar_main_nat_low_lower_egyptian_axe_conscripts",
					"phar_main_nat_low_lower_egyptian_militia",
					"phar_main_nat_low_lower_egyptian_militia_slingers",
					"phar_main_nat_low_lower_egyptian_spear_militia",
					"phar_main_nat_low_lower_egyptian_swordsmen_conscripts",
					"phar_main_nat_low_lower_egyptian_veteran_spearmen",
					"phar_main_nat_low_lower_egyptian_veteran_swordsmen",
					"phar_main_nat_wes_libu_composite_bowmen",
					"phar_main_nat_wes_libu_desert_runners",
					"phar_main_nat_wes_libu_desert_skirmishers",
					"phar_main_nat_wes_libu_desert_swords",
					"phar_main_nat_wes_libu_hunters",
					"phar_main_nat_wes_libu_raiders",
					"phar_main_nat_wes_libu_slingers",
					"phar_main_nat_wes_libu_tribe_spears",
					"phar_main_nat_wes_libu_tribesmen",
					"phar_main_nat_wes_libu_warriors",
					"phar_main_nat_upp_egyptian_chariots",
					"phar_main_nat_upp_upper_egyptian_archers",
					"phar_main_nat_upp_upper_egyptian_conscripted_axemen",
					"phar_main_nat_upp_upper_egyptian_javelin_throwers",
					"phar_main_nat_upp_upper_egyptian_khopesh_warriors",
					"phar_main_nat_upp_upper_egyptian_mace_axe_warriors",
					"phar_main_nat_upp_upper_egyptian_militia_clubmen",
					"phar_main_nat_upp_upper_egyptian_militia_slingers",
					"phar_main_nat_upp_upper_egyptian_renowned_archers",
					"phar_main_nat_upp_upper_egyptian_spearmen",
					"phar_main_nat_upp_upper_egyptian_swordsmen",
					"phar_main_nat_nub_kushite_archers",
					"phar_main_nat_nub_kushite_spearmen",
					"phar_main_nat_nub_kushite_spearmen_recruits",
					"phar_main_nat_nub_nubian_bowmen",
					"phar_main_nat_nub_nubian_clubmen",
					"phar_main_nat_nub_nubian_hunters",
					"phar_main_nat_nub_nubian_longbowmen",
					"phar_main_nat_nub_nubian_recruits",
					"phar_main_nat_nub_renowned_kushite_archers",
					"phar_main_nat_nub_renowned_nubian_longbowmen",
				},
			}
		},
	}
}

-- Configuration for Courtesy Gifts when the player is vassal
-- When playing as a vassal, the player will be given a dilemma every X turns to send gifts to the ruler
courtesy_gifts.vassal = {
	min_turn = 10,
	cooldown = { min = 5, max = 9 },

	gift_categories = { -- Please enumerate the gift categories that will be defined below in the gifts = {} table
		"resources",
		--"units",
	},

	gifts = {
		resources = {
			dilemma_key = "phar_main_courtesy_gift_dilemma_resources_required",
			dilemma_accept_choice_index = 0, -- index of the accept choice, counting from 0
			
			faction_leader_effect_bundle = { -- The player's faction leaders army will receive an effect bundle
				key = "phar_main_effect_bundle_modular_difficulty_movement_action_points",
				duration = 5
			},

			bonus_diplomatic_relations = 3, -- from -6 to +6 (-6 beeing give BIG CHUNK NEGATIVE BONUS, while +6 beeing give BIG CHUNK POSITIVE BONUS)
			reject_diplomatic_penalty = -3, -- from -6 to +6 (-6 beeing give BIG CHUNK NEGATIVE BONUS, while +6 beeing give BIG CHUNK POSITIVE BONUS)
			
			list = {
				troy_food = {
					min = 1000,
					max = 1500,
				},
				troy_stones = {
					min = 50,
					max = 200,
				},
				troy_wood = {
					min = 100,
					max = 300,
				},
				troy_bronze = {
					min = 100,
					max = 200,
				},
				troy_gold = {
					min = 50,
					max = 100,
				},
			}
		},

		units = {
			dilemma_key = "phar_main_courtesy_gift_dilemma_units_required",
			dilemma_accept_choice_index = 0, -- index of the accept choice, counting from 0

			faction_leader_effect_bundle = { -- The player's faction leaders army will receive an effect bundle
				key = "phar_main_effect_bundle_vassal_courtesy_gifts_morale", 
				duration = 4 
			},

			bonus_diplomatic_relations = 5, -- from -6 to +6 (-6 beeing give BIG CHUNK NEGATIVE BONUS, while +6 beeing give BIG CHUNK POSITIVE BONUS)
			reject_diplomatic_penalty = -5, -- from -6 to +6 (-6 beeing give BIG CHUNK NEGATIVE BONUS, while +6 beeing give BIG CHUNK POSITIVE BONUS)

			num_units_to_give = { min = 2, max = 4 }
		},
	}
}

courtesy_gifts.vo_events =
{
	"campaign_vo_vassals_dilemma_send",
	"campaign_vo_vassals_dilemma_refuse"
}

---------------------------------------------------------------------
----------------------- END OF CONFIGURATION! -----------------------
---------------------------------------------------------------------

courtesy_gifts.persistent = {
	master_to_vassal_cooldowns = {
		--[[ Example entry
			master_faction_key = {
				vassal1_faction_key = 1,
				vassal2_faction_key = 5
			}
		--]]
	},

	-- There can be only one human vassal but lets assume this could be enabled in multiplayer in the future
	vassal_dilemmas_cooldown_until_turn = {
		--[[ Example entry
			vassal_faction_key = 10, -- generating new dilemma will be possible on turn 11
		--]]
	}
}

function courtesy_gifts.is_enabled()
	return not cm:is_benchmark_mode() and (not cm:is_multiplayer() or courtesy_gifts.is_enabled_in_multiplayer)
end

---------------------------------------------------------------------
--------------- IMPLEMENTATION FOR PLAYING AS A RULER ---------------
---------------------------------------------------------------------

-- Construct weighted list with the different gifts based on the configuration for easy gift selection
do
	local courtesy_gifts_categories = {}
	for key, gift in pairs(courtesy_gifts.ruler.gifts) do
		table.insert(courtesy_gifts_categories, {item = key, weight = gift.weight})
	end
	-- The order doesn't really matter but we need to have the same order on all machines for multiplayer and this is not guarantied for associative tables so we need to sort
	table.sort(courtesy_gifts_categories, function(lhs, rhs) return lhs.item < rhs.item end)

	courtesy_gifts.categories_weight = weighted_list:new_from_pairs_list(courtesy_gifts_categories)
end

-- Construct weighted list with the different pooled resources based on the configuration for easy selection
do
	local resources_weights = {}
	for key, info in pairs(courtesy_gifts.ruler.gifts.resources.list) do
		table.insert(resources_weights, {item = key, weight = info.random_weight})
	end
	table.sort(resources_weights, function(lhs, rhs) return lhs.weight < rhs.weight end)

	courtesy_gifts.ruler.gifts.resources.weighted_list = weighted_list:new_from_pairs_list(resources_weights)
end

function courtesy_gifts.ruler.gifts.resources:generate_payload_string(master, vassal)
	local eligible_resources_keys = {}

	local resources = master:pooled_resources()
	for i = 0, resources:num_items() - 1 do
		local resource = resources:item_at(i)
		local resource_key = resource:key()
		local threshold = self.list[resource_key] and self.list[resource_key].threshold
		if threshold and resource:value() < threshold then
			table.insert(eligible_resources_keys, resource_key)
		end
	end

	local selected_resource_key = #eligible_resources_keys > 0 and table_get_random_element(eligible_resources_keys) or
		self.weighted_list:weighted_select()

	local subjects_courtesy_gift_mod = cm:get_factions_bonus_value(master, "subjects_courtesy_gift_mod")
	local percentage_from_vassal_to_give = self.list[selected_resource_key].percentage_from_vassal_to_give
	if subjects_courtesy_gift_mod ~= 0 then
		percentage_from_vassal_to_give = percentage_from_vassal_to_give + (percentage_from_vassal_to_give * (subjects_courtesy_gift_mod / 100))
	end

	local amount_to_give = math.ceil(vassal:pooled_resource(selected_resource_key):value() * percentage_from_vassal_to_give/100)

	return string.format("faction_pooled_resource_transaction{resource %s;factor %s;amount %d;}", 
		selected_resource_key, 
		courtesy_gifts.resource_factor, 
		amount_to_give)
end

function courtesy_gifts.ruler.gifts.units:generate_payload_string(master, vassal)
	local vassal_units = self.list[vassal:culture()]
	if not vassal_units then
		script_error(string.format("Courtesy Gifts: couldn't find a list of units for faction <%s> to chose for master <%s>", vassal:name(), master:name()))
		return ""
	end

	local num_units_to_give = cm:model():random_int(self.num_units_to_give.min, self.num_units_to_give.max);
	local units_to_give = cm:random_sort_copy(vassal_units)
	local payload_string = ""
	for i = 1, num_units_to_give do 
		local unit_key = units_to_give[i]
		local vassal_cqi = vassal:command_queue_index()

		self:add_unit_to_master_mercenary_pool_if_missing(master, vassal_cqi, unit_key)

		payload_string = payload_string .. string.format("add_mercenary_to_faction_pool{unit_key %s;amount 1;custom_id vassal_%d;}", unit_key, vassal_cqi)
	end

	return payload_string
end

function courtesy_gifts.ruler.gifts.units:add_unit_to_master_mercenary_pool_if_missing(master, vassal_cqi, unit_key)
	if cm:num_units_in_faction_mercenary_pool(master:command_queue_index(), unit_key, string.format("vassal_%d", vassal_cqi)) > 0 then
		return
	end

	local custom_unit = cm:create_custom_unit_from_key(unit_key, false)
	custom_unit:add_custom_id(string.format("vassal_%d", vassal_cqi))
	custom_unit:set_gifted_by_faction_cqi(vassal_cqi)
	custom_unit:set_can_be_recruited_in_foreign_territory(false)
	custom_unit:add_custom_recruitment_cost(cm:create_new_custom_resource_cost()) -- make recruitment cost zero
	custom_unit:add_mercenary_recruit_data(
											0, -- count
											0, -- replenish
											100, -- max_count
											0, -- max_replenish
											0, -- experience
											"", -- FACTION_RECORD faction_restricted_record
											"", -- SUBCULTURE_RECORD subculture_restricted_record
											"" -- TECHNOLOGY_RECORD tech_restricted_recor
										)
	cm:add_custom_unit_to_faction_mercenary_pool(master:name(), custom_unit)
end

function courtesy_gifts.ruler.gifts:add_diplomacy_payload_to_payload_string(payload_string, vassal_key, diplomacy_value)
	if #payload_string > 0 then
		return payload_string .. string.format("diplomacy_change{target_faction %s;amount %d;}", vassal_key, diplomacy_value)
	end

	return ""
end

function courtesy_gifts.ruler.can_master_receive_gifts_from_vassal_this_turn(master, vassal)
	return not courtesy_gifts.ruler.is_master_in_legitimacy_war(master) and
		courtesy_gifts.ruler.get_master_to_vassal_cooldown(master, vassal) == 0
end

function courtesy_gifts.ruler.is_master_in_legitimacy_war(master)
	local legitimacy_object = legitimacy_choice:get_unlocked_legitimacy(master:name())
	if not legitimacy_object then
		return false
	end

	return legitimacy_object.political_states_system:political_state() == "legitimacy_war"
end

function courtesy_gifts.ruler.get_master_to_vassal_cooldown(master, vassal)
	if not courtesy_gifts.persistent.master_to_vassal_cooldowns[master:name()] then
		return 0
	end

	return courtesy_gifts.persistent.master_to_vassal_cooldowns[master:name()][vassal:name()] or 0
end

function courtesy_gifts.ruler.receive_gifts_from_vassal(master, vassal)
	if not courtesy_gifts.ruler.can_master_receive_gifts_from_vassal_this_turn(master, vassal) then 
		script_error("courtesy_gifts.ruler.receive_gifts_from_vassal => Courtesy gifts are not allowed at the moment from this vassal")
		return
	end

	local chosen_category = courtesy_gifts.ruler.pick_random_weighted_gift_category()
	if not chosen_category then
		return
	end

	local payload_string = chosen_category:generate_payload_string(master, vassal)
	payload_string = courtesy_gifts.ruler.gifts:add_diplomacy_payload_to_payload_string(payload_string, vassal:name(), chosen_category.bonus_diplomatic_relations)

	-- By design we can pick some gift category and then don't be able to send any gift
	if #payload_string > 0 then
		payload_string = "payload{" .. payload_string .. "}"
		cm:trigger_custom_incident(master:name(), chosen_category.incident_key, true, payload_string)
	
		-- Set cooldown
		courtesy_gifts.persistent.master_to_vassal_cooldowns[master:name()] = courtesy_gifts.persistent.master_to_vassal_cooldowns[master:name()] or {}
		courtesy_gifts.persistent.master_to_vassal_cooldowns[master:name()][vassal:name()] = courtesy_gifts.ruler.cooldown_per_vassal

		
		--cm:apply_dilemma_diplomatic_bonus(master:name(), vassal:name(), chosen_category.bonus_diplomatic_relations)
	end
end

function courtesy_gifts.ruler.pick_random_weighted_gift_category()
	local category_name = courtesy_gifts.categories_weight:weighted_select()
	return courtesy_gifts.ruler.gifts[category_name] -- can be nil
end

function courtesy_gifts.ruler.advance_cooldowns()
	-- The order is not relevant because only the lua state is modified and this is why using pairs is fine here
	for master, vassals_map in pairs(courtesy_gifts.persistent.master_to_vassal_cooldowns) do
		for vassal, turns in pairs(vassals_map) do
			if turns <= 1 then
				vassals_map[vassal] = nil
			else
				vassals_map[vassal] = vassals_map[vassal] - 1
			end
		end
	end
end

cm:add_first_tick_callback(
	function()
		if not courtesy_gifts.is_enabled() then
			return
		end

		core:add_listener(
			"courtesy_gifts_ruler_round_start", 
			"RoundStart", 
			true,
			courtesy_gifts.ruler.advance_cooldowns, 
			true
		)

		core:add_listener(
			"courtesy_gifts_ruler_subject_turn_start", 
			"FactionTurnStart",
			function(context)
				local sovereign = context:faction():get_sovereign()
				return not sovereign:is_null_interface() and sovereign:is_human()
			end,
			function(context)
				local subject = context:faction()
				local sovereign = subject:get_sovereign()

				if not sovereign:is_null_interface() and courtesy_gifts.ruler.can_master_receive_gifts_from_vassal_this_turn(sovereign, subject) then
					courtesy_gifts.ruler.receive_gifts_from_vassal(sovereign, subject)
				end
			end, 
			true
		)
	end
);

---------------------------------------------------------------------
--------------- IMPLEMENTATION FOR PLAYING AS A VASSAL --------------
---------------------------------------------------------------------

function courtesy_gifts.vassal.is_in_cooldown(vassal_key)
	return courtesy_gifts.persistent.vassal_dilemmas_cooldown_until_turn[vassal_key] and
		courtesy_gifts.persistent.vassal_dilemmas_cooldown_until_turn[vassal_key] > cm:turn_number()
end

function courtesy_gifts.vassal.generate_gifts_dilemma(master, vassal)
	local chosen_category = courtesy_gifts.vassal.pick_random_gift_category()
	if not chosen_category then
		script_error("courtesy_gifts.vassal.generate_gifts_dilemma => Cannot find gift category")
		return
	end

	local accept_option_payload_string = chosen_category:generate_accept_payload_string(master, vassal)
	if #accept_option_payload_string > 0 then
		local accept_payload = "payload{" .. accept_option_payload_string .. "}"

		local reject_diplomacy_change = chosen_category.reject_diplomatic_penalty
		local reject_payload = "payload{" .. string.format("diplomacy_change{target_faction %s;amount %d;}", master:name(), reject_diplomacy_change) .. "}"
		
		cm:trigger_custom_dilemma(vassal:name(), chosen_category.dilemma_key, accept_payload, reject_payload)

		-- Set cooldown
		courtesy_gifts.persistent.vassal_dilemmas_cooldown_until_turn[vassal:name()] = cm:turn_number() + cm:model():random_int(courtesy_gifts.vassal.cooldown.min, courtesy_gifts.vassal.cooldown.max)

		-- Apply the effect bundle to the leader's army of the vassal after accepting
		core:add_listener(
			"courtesy_gifts_vassal_dilemma_choice",
			"DilemmaChoiceMadeEvent",
			function(context) return context:dilemma() == chosen_category.dilemma_key end,
			function(context)
				if context:choice() == chosen_category.dilemma_accept_choice_index then
					local faction_leader = vassal:faction_leader()
					if faction_leader:is_null_interface() or not faction_leader:has_military_force() then
						return
					end

					local leader_army_cqi = faction_leader:military_force():command_queue_index()
					cm:apply_effect_bundle_to_force(chosen_category.faction_leader_effect_bundle.key, leader_army_cqi, chosen_category.faction_leader_effect_bundle.duration)
				end
				
				CampaignUI.TriggerCampaignFactionVO(courtesy_gifts.vo_events[context:choice() + 1] ,vassal:name())
				core:remove_listener("courtesy_gifts_vassal_hide_dilemma")
			end,
			false)

		core:add_listener(
			"courtesy_gifts_vassal_hide_dilemma",
			"ComponentLClickUp",
			function(context) return context.string == "button_show_hide" end,
			function()
					CampaignUI.TriggerCampaignFactionVO("campaign_vo_vassals_dilemma_later" ,vassal:name())
			end,
			false)
	end
end

function courtesy_gifts.vassal.pick_random_gift_category()
	local category_index = cm:model():random_int(1, #courtesy_gifts.vassal.gift_categories)
	local category_name = courtesy_gifts.vassal.gift_categories[category_index]
	return courtesy_gifts.vassal.gifts[category_name]
end

function courtesy_gifts.vassal.gifts.resources:generate_accept_payload_string(master, vassal)
	local res, key = table_get_random_element(self.list)
	local amount_to_request = cm:model():random_int(res.min, res.max)

	local payload = string.format("faction_pooled_resource_transaction{resource %s;factor %s;amount %d;}", key, courtesy_gifts.resource_factor, -amount_to_request)
	payload = payload .. string.format("diplomacy_change{target_faction %s;amount %d;}", master:name(), self.bonus_diplomatic_relations)
	
	return payload
end

function courtesy_gifts.vassal.gifts.units:generate_accept_payload_string(master, vassal)
	local vassal_armies = vassal:military_force_list()

	local land_armies = {}
	for i = 0, vassal_armies:num_items() - 1 do
		local army = vassal_armies:item_at(i)
		if not army:is_armed_citizenry() then
			table.insert(land_armies, army)
		end
	end

	if land_armies == 0 then
		return "" -- will try next turn
	end

	local chosen_army_units = land_armies[cm:model():random_int(1, #land_armies)]:unit_list()

	-- Start from 1 in order to skip the general unit
	local all_units_cqi = {}
	for i = 1, chosen_army_units:num_items() - 1 do
		table.insert(all_units_cqi, chosen_army_units:item_at(i):command_queue_index())
	end
	all_units_cqi = cm:random_sort(all_units_cqi)

	local cqi_of_units_to_destroy = {}
	local max_units_to_destroy = math.min(#all_units_cqi, cm:model():random_int(self.num_units_to_give.min, self.num_units_to_give.max)) 
	for i = 1, max_units_to_destroy do
		table.insert(cqi_of_units_to_destroy, all_units_cqi[i])
	end

	local payload = ""
	for _, cqi in ipairs(cqi_of_units_to_destroy) do
		payload = payload .. string.format("destroy_unit{unit_cqi %d;}", cqi)
	end

	payload = payload .. string.format("diplomacy_change{target_faction %s;amount %d;}", master:name(), self.bonus_diplomatic_relations)

	return payload
end

cm:add_first_tick_callback(
	function()
		if not courtesy_gifts.is_enabled() then
			return
		end

		core:add_listener(
			"courtesy_gifts_playing_as_vassal_turn_start", 
			"FactionTurnStart",
			function(context)
				local subject = context:faction()
				local sovereign = subject:get_sovereign()
				return cm:turn_number() >= courtesy_gifts.vassal.min_turn and
					subject:is_human() and 
					not sovereign:is_null_interface() and
					not courtesy_gifts.vassal.is_in_cooldown(subject:name())
			end,
			function(context)
				local subject = context:faction()
				local sovereign = subject:get_sovereign()

				courtesy_gifts.vassal.generate_gifts_dilemma(sovereign, subject)
			end, 
			true
		)
	end
);

---------------------------------------------------------------------
----------------------------- SAVE / LOAD ---------------------------
---------------------------------------------------------------------

cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("PHAR_COURTESY_GIFTS_COOLDOWNS", courtesy_gifts.persistent.master_to_vassal_cooldowns, context)
		cm:save_named_value("PHAR_COURTESY_GIFTS_VASSAL_DILEMMAS_COOLDOWN", courtesy_gifts.persistent.vassal_dilemmas_cooldown_until_turn, context)
	
	end
)

cm:add_loading_game_callback(
	function(context)
		courtesy_gifts.persistent.master_to_vassal_cooldowns = cm:load_named_value("PHAR_COURTESY_GIFTS_COOLDOWNS", courtesy_gifts.persistent.master_to_vassal_cooldowns, context)
		courtesy_gifts.persistent.vassal_dilemmas_cooldown_until_turn = cm:load_named_value("PHAR_COURTESY_GIFTS_VASSAL_DILEMMAS_COOLDOWN", courtesy_gifts.persistent.vassal_dilemmas_cooldown_until_turn, context)
	end
)