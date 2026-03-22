out("Loading troy_rem_memnon_exotic_strategist.lua")

---------------------------------------------------------------
------------------------ CONSTANTS ----------------------------
---------------------------------------------------------------


exotic_strategist = {}
exotic_strategist.faction_key = "troy_rem_horde_aethiopians"
exotic_strategist.resource_factor = "troy_resource_factor_faction"
exotic_strategist.religion_buildings_keyword = "religion"
exotic_strategist.vo_event = "campaign_vo_cs_rem_memnon_fm_exotic_strategist"

-- The amount of action points that will be restored to the faction after it razes a settlement.
-- This is not directly related to Exotic Strategist but it is too small to be separated into another file.
exotic_strategist.action_points_after_raze = 0.3

exotic_strategist.follower_effects = {
	-- Passive Effects
	passive = {
		bundle_to_force = function(effect_bundle_key)
			return {
				type = "passive",
				effect_bundle_key = effect_bundle_key,
				activate = function(our_force_cqi)
					cm:apply_effect_bundle_to_force(effect_bundle_key, our_force_cqi, 0)
				end,
				deactivate = function(our_force_cqi)
					cm:remove_effect_bundle_from_force(effect_bundle_key, our_force_cqi)
				end,
			}
		end,
		favour_to_god_for_local_temple = function(effect_bundle_key, amount)
			return {
				type = "passive",
				effect_bundle_key = effect_bundle_key,
				activate = function(our_force_cqi)
					table.insert(exotic_strategist.favour_to_god_armies, {cqi = our_force_cqi, resource_amount = amount})
				end,
				deactivate = function(our_force_cqi)
					table_erase_if_first_only(
						exotic_strategist.favour_to_god_armies, 
						function(elem)
							return elem.cqi == our_force_cqi and elem.resource_amount == amount
						end
					)
				end,
			}
		end,
	},

	-- Active Effects
	-- NOTE to coders: Keep in mind when you implement new type of active follower, that the army may no longer exist in the deactivate() function 
	-- but in most cases we still need to call deactivate(), for example for removing the custom battlefield after autoresolve (no reload)
	active = {
		disable_towers = function(effect_bundle_key) 
			return {
				type = "active",
				effect_bundle_key = effect_bundle_key,
				activate = function()
					cm:remove_custom_battlefield("generic")
					cm:add_custom_battlefield(
						"exotic_strategist_disable_towers",				 -- string identifier
						0,												  -- x co-ord
						0,												  -- y co-ord
						5000,											   -- radius around position
						false,											  -- will campaign be dumped
						"",												 -- loading override
						"script/battle/campaign_battle/battle_start.lua",   -- script override
						"",												 -- entire battle override
						0,												  -- human alliance when battle override
						false,											  -- launch battle immediately
						true,											   -- is land battle (only for launch battle immediately)
						false,											  -- force application of autoresolver result
						false,											  -- force a siege battle to be fought outside the settlement as a land battle
						true												-- disable fortification towers (for siege battles)
					)
				end,
				deactivate = function()
					cm:remove_custom_battlefield("exotic_strategist_disable_towers")
					add_battle_script_override() -- restore generic battle override
				end,
				can_be_used_in_current_battle = function()
					return cm:model():pending_battle():is_major_settlement_battle(), 
						exotic_strategist.ui.prebattle.followers.tooltip.not_available.info.states.major_settlement_only
				end
			}
		end,
		reveal_enemy = function(effect_bundle_key) 
			return {
				type = "active",
				effect_bundle_key = effect_bundle_key,
				activate = function()
					cm:remove_custom_battlefield("generic")

					local enemy_alliance_index = 0
					if cm:model():pending_battle():attacker_faction():name() == exotic_strategist.faction_key then
						enemy_alliance_index = 1
					end
					core:svr_save_string("exotic_strategist_reveal_enemy_alliance_index", tostring(enemy_alliance_index))

					cm:add_custom_battlefield(
						"exotic_strategist_reveal_enemy",				   -- string identifier
						0,												  -- x co-ord
						0,												  -- y co-ord
						5000,											   -- radius around position
						false,											  -- will campaign be dumped
						"",												 -- loading override
						"script/battle/campaign_battle/exotic_strategist_reveal_enemy.lua",   -- script override
						"",												 -- entire battle override
						0,												  -- human alliance when battle override
						false,											  -- launch battle immediately
						true,											   -- is land battle (only for launch battle immediately)
						false,											  -- force application of autoresolver result
						false,											  -- force a siege battle to be fought outside the settlement as a land battle
						false											   -- disable fortification towers (for siege battles)
					)
				end,
				deactivate = function()
					cm:remove_custom_battlefield("exotic_strategist_reveal_enemy")
					add_battle_script_override() -- restore generic battle override
				end,
				can_be_used_in_current_battle = function()
					return true
				end
			}
		end,
		sally_enemy = function(effect_bundle_key) 
			return {
				type = "active",
				effect_bundle_key = effect_bundle_key,
				activate = function(our_force_cqi)
					cm:remove_custom_battlefield("generic")
					cm:add_custom_battlefield(
						"exotic_strategist_sally_enemy",					-- string identifier
						0,												  -- x co-ord
						0,												  -- y co-ord
						5000,											   -- radius around position
						false,											  -- will campaign be dumped
						"",												 -- loading override
						"script/battle/campaign_battle/battle_start.lua",   -- script override
						"",												 -- entire battle override
						0,												  -- human alliance when battle override
						false,											  -- launch battle immediately
						true,											   -- is land battle (only for launch battle immediately)
						false,											  -- force application of autoresolver result
						true,											   -- force a siege battle to be fought outside the settlement as a land battle
						false											   -- disable fortification towers (for siege battles)
					)

					local force = cm:model():military_force_for_command_queue_index(our_force_cqi)
					if not force:is_null_interface() then
						cm:force_remove_siege_equipment(force)
					end
				end,
				deactivate = function()
					cm:remove_custom_battlefield("exotic_strategist_sally_enemy")
					add_battle_script_override() -- restore generic battle override
				end,
				can_be_used_in_current_battle = function()
					return cm:model():pending_battle():is_minor_settlement_battle(), 
						exotic_strategist.ui.prebattle.followers.tooltip.not_available.info.states.minor_settlement_only
				end
			}
		end,
		enemy_tired = function(effect_bundle_key) 
			return {
				type = "active",
				effect_bundle_key = effect_bundle_key,
				activate = function()
					cm:remove_custom_battlefield("generic")

					local enemy_alliance_index = 0
					if cm:model():pending_battle():attacker_faction():name() == exotic_strategist.faction_key then
						enemy_alliance_index = 1
					end
					core:svr_save_string("exotic_strategist_make_enemy_tired_alliance_index", tostring(enemy_alliance_index))

					cm:add_custom_battlefield(
						"exotic_strategist_make_enemy_tired",			   -- string identifier
						0,												  -- x co-ord
						0,												  -- y co-ord
						5000,											   -- radius around position
						false,											  -- will campaign be dumped
						"",												 -- loading override
						"script/battle/campaign_battle/exotic_strategist_make_enemy_tired.lua",   -- script override
						"",												 -- entire battle override
						0,												  -- human alliance when battle override
						false,											  -- launch battle immediately
						true,											   -- is land battle (only for launch battle immediately)
						false,											  -- force application of autoresolver result
						false,											  -- force a siege battle to be fought outside the settlement as a land battle
						false											   -- disable fortification towers (for siege battles)
					)
				end,
				deactivate = function()
					cm:remove_custom_battlefield("exotic_strategist_make_enemy_tired")
					add_battle_script_override() -- restore generic battle override
				end,
				can_be_used_in_current_battle = function()
					return true
				end
			}
		end,
		reduce_enemy_general_hp = function(effect_bundle_key, amount) 
			return {
				type = "active",
				effect_bundle_key = effect_bundle_key,
				activate = function(our_force_cqi)
					local general = exotic_strategist.get_pending_battle_general_for_enemy_faction()
					local general_unit = general:military_force():unit_list():item_at(0)
					local start_hp = general_unit:start_soldiers_or_hitpoints()

					cm:set_unit_soldiers_or_hitpoints(general_unit, math.floor(start_hp * amount + 0.5))
				end,
				deactivate = function(our_force_cqi)
					-- We don't need to do anything here. The effect is instantaneous and it is applied no sooner than the battle start command.
					-- If in the future active followers are redesigned to be activated earlier, before the actual battle,
					-- we should cache the current hp in activate() and restore it here
				end,
				can_be_used_in_current_battle = function()
					local general = exotic_strategist.get_pending_battle_general_for_enemy_faction()
					local general_unit = general:military_force():unit_list():item_at(0)
					local start_hp = general_unit:start_soldiers_or_hitpoints()
					local current_hp = general_unit:num_soldiers_or_hitpoints()

					return current_hp > math.floor(start_hp * amount + 0.5), 
						exotic_strategist.ui.prebattle.followers.tooltip.not_available.info.states.low_hp
				end
			}
		end,
	}
}

-- DESIGN AREA HERE
exotic_strategist.regions = {"egypt", "aethiopia", "canaan", "susa"}

-- Please add here every follower from exotic_strategist.followers
exotic_strategist.follower_list = {
	"lotus_merchant",
	"outrider_scout",
	"master_tactician",
	"disguised_trader",
	"egyptian_assassin",
	"egyptian_healer",
	"memphis_scribe",
	"egyptian_cook",
	"aethiopian_musician",
	"aethiopian_runner",
	"aethiopian_dancers",
	"servant_of_the_divine",
	"rumormonger",
	"skirmish_party",
	"marauders",
	"shipwright",
	"canaan_guards",
	"canaan_infiltrator",
}

-- Note: when adding new follower, don't forget to add it in exotic_strategist.follower_list as well
exotic_strategist.followers = {
	lotus_merchant = {
		region = "egypt", -- must be one of exotic_strategist.regions
		recruit_cost = {
			{"troy_gold", 155},
		   
		},
		activation_cost = {
			{"troy_gold", 80}
		},
		effect = exotic_strategist.follower_effects.active.disable_towers("troy_rem_memnon_exotic_strategist_lotus_merchant"),
		required_technology = "troy_tech_rem_horde_memnon_6_unlocks_thebes",
	
		ui_icon_path = "ui/skins/default/mem_lotus_merchant.png",
		ui_name = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_lotus_merchant_title",
		ui_description = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_lotus_merchant_description",
		ui_order = 40
	},

	outrider_scout = {
		region = "aethiopia", -- must be one of exotic_strategist.regions
		recruit_cost = {
			{"troy_gold", 40}
		},
		activation_cost = {
			{"troy_gold", 20}
		},
		effect = exotic_strategist.follower_effects.active.reveal_enemy("troy_rem_memnon_exotic_strategist_outrider_scout"),
		required_technology = false,

		ui_icon_path = "ui/skins/default/mem_outrider_scout.png",
		ui_name = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_outrider_scout_title",
		ui_description = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_outrider_scout_description",
		ui_order = 50
	},

	master_tactician = {
		region = "canaan", -- must be one of exotic_strategist.regions
		recruit_cost = {
			{"troy_bronze", 800}
		},
		activation_cost = {
			{"troy_bronze", 400}
		},
		effect = exotic_strategist.follower_effects.active.sally_enemy("troy_rem_memnon_exotic_strategist_master_tactician"),
		required_technology = "troy_tech_rem_horde_memnon_5_unlocks_megiddo",

		ui_icon_path = "ui/skins/default/mem_master_tactician.png",
		ui_name = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_master_tactician_title",
		ui_description = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_master_tactician_description",
		ui_order = 40
	},

	disguised_trader = {
		region = "susa", -- must be one of exotic_strategist.regions
		recruit_cost = {
			{"troy_food", 6000}
		},
		activation_cost = {
			{"troy_food", 2500}
		},
		effect = exotic_strategist.follower_effects.active.enemy_tired("troy_rem_memnon_exotic_strategist_disguised_trader"),
		required_technology = "troy_tech_rem_horde_memnon_8_unlocks_susa",

		ui_icon_path = "ui/skins/default/mem_disguised_trader.png",
		ui_name = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_disguised_trader_title",
		ui_description = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_disguised_trader_description",
		ui_order = 40
	},

	egyptian_assassin = {
		region = "egypt", -- must be one of exotic_strategist.regions
		recruit_cost = {
			{"troy_gold", 80}
		},
		activation_cost = {
			{"troy_gold", 40}
		},
		effect = exotic_strategist.follower_effects.active.reduce_enemy_general_hp("troy_rem_memnon_exotic_strategist_egyptian_assassin", 0.5),
		required_technology = false,

		ui_icon_path = "ui/skins/default/mem_egyptian_assassin.png",
		ui_name = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_egyptian_assassin_title",
		ui_description = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_egyptian_assassin_description",
		ui_order = 50
	},

	egyptian_healer = {
		region = "egypt", -- must be one of exotic_strategist.regions
		recruit_cost = {
			{"troy_food", 2000}
		},
		effect = exotic_strategist.follower_effects.passive.bundle_to_force("troy_rem_memnon_exotic_strategist_egyptian_healer"),
		required_technology = false,

		ui_icon_path = "ui/skins/default/mem_egyptian_healer.png",
		ui_name = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_egyptian_healer_title",
		ui_description = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_egyptian_healer_description",
		ui_order = 10
	},

	memphis_scribe = {
		region = "egypt", -- must be one of exotic_strategist.regions
		recruit_cost = {
			{"troy_bronze", 1500}
		},
		effect = exotic_strategist.follower_effects.passive.bundle_to_force("troy_rem_memnon_exotic_strategist_memphis_scribe"),
		required_technology = "troy_tech_rem_horde_memnon_6_unlocks_thebes",

		ui_icon_path = "ui/skins/default/mem_memphis_scribe.png",
		ui_name = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_memphis_scribe_title",
		ui_description = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_memphis_scribe_description",
		ui_order = 20

	},

	egyptian_cook = {
		region = "egypt", -- must be one of exotic_strategist.regions
		recruit_cost = {
			{"troy_food", 6000}
		},
		effect = exotic_strategist.follower_effects.passive.bundle_to_force("troy_rem_memnon_exotic_strategist_egyptian_cook"),
		required_technology = "troy_tech_rem_horde_memnon_6_unlocks_thebes",

		ui_icon_path = "ui/skins/default/mem_egyptian_cook.png",
		ui_name = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_egyptian_cook_title",
		ui_description = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_egyptian_cook_description",
		ui_order = 30

	},

	aethiopian_musician = {
		region = "aethiopia", -- must be one of exotic_strategist.regions
		recruit_cost = {
			{"troy_gold", 50}
		},
		effect = exotic_strategist.follower_effects.passive.bundle_to_force("troy_rem_memnon_exotic_strategist_aethiopian_musician"),
		required_technology = "troy_tech_rem_horde_memnon_1_unlocks_yeha",

		ui_icon_path = "ui/skins/default/mem_aethiopian_musician.png",
		ui_name = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_aethiopian_musician_title",
		ui_description = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_aethiopian_musician_description",
		ui_order = 30

	},

	aethiopian_runner = {
		region = "aethiopia", -- must be one of exotic_strategist.regions
		recruit_cost = {
			{"troy_food", 2500}
		},
		effect = exotic_strategist.follower_effects.passive.bundle_to_force("troy_rem_memnon_exotic_strategist_aethiopian_runner"),
		required_technology = "troy_tech_rem_horde_memnon_1_unlocks_yeha",

		ui_icon_path = "ui/skins/default/mem_aethiopian_runner.png",
		ui_name = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_aethiopian_runner_title",
		ui_description = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_aethiopian_runner_description",
		ui_order = 20

	},

	aethiopian_dancers = {
		region = "aethiopia", -- must be one of exotic_strategist.regions
		recruit_cost = {
			{"troy_food", 3500}
		},
		effect = exotic_strategist.follower_effects.passive.bundle_to_force("troy_rem_memnon_exotic_strategist_aethiopian_dancers"),
		required_technology = false,

		ui_icon_path = "ui/skins/default/mem_aethiopian_dancers.png",
		ui_name = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_aethiopian_dancers_title",
		ui_description = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_aethiopian_dancers_description",
		ui_order = 10

	},

	servant_of_the_divine = {
		region = "aethiopia", -- must be one of exotic_strategist.regions
		recruit_cost = {
			{"troy_food", 6000}
		},
		effect = exotic_strategist.follower_effects.passive.favour_to_god_for_local_temple("troy_rem_memnon_exotic_strategist_servant_of_the_divine", 1),
		required_technology = "troy_tech_rem_horde_memnon_1_unlocks_yeha",

		ui_icon_path = "ui/skins/default/mem_servant_of_the_divine.png",
		ui_name = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_servant_of_the_divine_title",
		ui_description = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_servant_of_the_divine_description",
		ui_order = 40

	},

	rumormonger = {
		region = "susa", -- must be one of exotic_strategist.regions
		recruit_cost = {
			{"troy_food", 1000}
		},
		effect = exotic_strategist.follower_effects.passive.bundle_to_force("troy_rem_memnon_exotic_strategist_rumormonger"),
		required_technology = false,

		ui_icon_path = "ui/skins/default/mem_rumormonger.png",
		ui_name = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_rumormonger_title",
		ui_description = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_rumormonger_description",
		ui_order = 10

	},

	skirmish_party = {
		region = "susa", -- must be one of exotic_strategist.regions
		recruit_cost = {
			{"troy_gold", 100}
		},
		effect = exotic_strategist.follower_effects.passive.bundle_to_force("troy_rem_memnon_exotic_strategist_skirmish_party"),
		required_technology = "troy_tech_rem_horde_memnon_8_unlocks_susa",

		ui_icon_path = "ui/skins/default/mem_skirmish_party.png",
		ui_name = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_skirmish_party_title",
		ui_description = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_skirmish_party_description",
		ui_order = 20

	},

	marauders = {
		region = "susa", -- must be one of exotic_strategist.regions
		recruit_cost = {
			{"troy_gold", 80}
		},
		effect = exotic_strategist.follower_effects.passive.bundle_to_force("troy_rem_memnon_exotic_strategist_marauders"),
		required_technology = "troy_tech_rem_horde_memnon_8_unlocks_susa",

		ui_icon_path = "ui/skins/default/mem_marauders.png",
		ui_name = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_marauders_title",
		ui_description = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_marauders_description",
		ui_order = 30

	},

	shipwright = {
		region = "canaan", -- must be one of exotic_strategist.regions
		recruit_cost = {
			{"troy_wood", 1000}
		},
		effect = exotic_strategist.follower_effects.passive.bundle_to_force("troy_rem_memnon_exotic_strategist_shipwright"),
		required_technology = false,

		ui_icon_path = "ui/skins/default/mem_shipwright.png",
		ui_name = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_shipwright_title",
		ui_description = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_shipwright_description",
		ui_order = 10

	},

	canaan_guards = {
		region = "canaan", -- must be one of exotic_strategist.regions
		recruit_cost = {
			{"troy_bronze", 500}
		},
		effect = exotic_strategist.follower_effects.passive.bundle_to_force("troy_rem_memnon_exotic_strategist_canaan_guards"),
		required_technology = "troy_tech_rem_horde_memnon_5_unlocks_megiddo",

		ui_icon_path = "ui/skins/default/mem_canaan_guards.png",
		ui_name = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_canaan_guards_title",
		ui_description = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_canaan_guards_description",
		ui_order = 20

	},

	canaan_infiltrator = {
		region = "canaan", -- must be one of exotic_strategist.regions
		recruit_cost = {
			{"troy_gold", 80}
		},
		effect = exotic_strategist.follower_effects.passive.bundle_to_force("troy_rem_memnon_exotic_strategist_canaan_infiltrator"),
		required_technology = "troy_tech_rem_horde_memnon_5_unlocks_megiddo",

		ui_icon_path = "ui/skins/default/mem_canaan_infiltrator.png",
		ui_name = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_canaan_infiltrator_title",
		ui_description = "ui_text_replacements_localised_text_troy_rem_fm_memnon_exotic_strategist_canaan_infiltrator_description",
		ui_order = 30

	},
}

-- Effects that modify the recruitment cost of all Followers based on their value
exotic_strategist.follower_recruit_cost_mod_faction_effects = {
	"troy_effect_rem_memnon_camp_follower_cost_dummy"
}

-- Bonus damage to all units in the army if the building is present
exotic_strategist.buildings_bonus = {
	buildings = {
		troy_rem_aethiopia_horde_special_exotic_servant_2 = {
			bonus_dmg_per_follower = 1   
		},
		troy_rem_aethiopia_horde_special_exotic_servant_4 = {
			bonus_dmg_per_follower = 2   
		}
	},
	effect_bundle_key = "troy_rem_effect_bundle_memnon_camp_followers_damage_dummy",
	effects = {
		"troy_rem_effect_army_melee_damage_all", 
		"troy_effect_army_missile_damage_mod"
	},
	bonus_dmg_cap = 20 -- the bonus damage can't exceed this value
}

exotic_strategist.localisation_strings = {
	purchase_follower_confirmation_text_key = "ui_text_replacements_localised_text_troy_rem_exotic_strategist_purchase_follower_confirmation",
	tooltip_remove_selected_follower = "ui_text_replacements_localised_text_troy_rem_exotic_strategist_cancel_follower", -- todo
}

exotic_strategist.character_skills = {
	{
		key = "troy_rem_hero_campaign_active_camp_followers_cost",
		follower_action_cost_modifier = -0.15
	},
	{
		key = "troy_rem_hero_campaign_active_camp_followers_cost_spec_cost",
		follower_action_cost_modifier = -0.15
	},
	{
		key = "troy_rem_agent_griffin_skill_horde_tier3_griffin_gold_economy",
		follower_action_cost_modifier = -0.15
	},
}

-- UI CFG
exotic_strategist.ui = {}
exotic_strategist.ui.panel = {
	id = "fm_memnon_2",

	armies = {
		template = "army_template",
		card = "portrait_card",
		holder = {"armies_holder", "list_box"},
		hero_name = "tx_hero_name"
	},

	followers = {
		template_active = "active_follower_template",
		template_passive = "passive_follower_template",
		holder = {
			egypt = "egypt_holder",
			aethiopia = "aethiopia_holder",
			canaan = "canaan_holder",
			susa = "susa_holder"
		},
		portrait = {
			id = "portrait",
			states = {
				purchased = "purchased",
				available = "available",
				locked = "locked",
				selected = "selected"
			}
		},
		tooltip = {
			path = "UI/Campaign UI/tooltip_fm_memnon_2",
			type = {
				id = "tx_follower_type",
				states = {
					active = "active",
					passive = "passive"
				}
			},
			status = {
				id = "status",
				states = {
					locked = "locked",
					unlocked = "unlocked",
					recruited = "assigned"
				}
			},
			name = "dy_follower_name",
			description = "dy_follower_description",
			effect_bundle = "effect_bundle_template",
			cost = "recruit_cost_price",
			cost_separator = "cost_separator",
			activation_cost = {
				id = "action_cost",
				value = "action_cost_price"
			},
			unlock = "txt_unlock"
		}
	},

	button_purchase = {
		id = "btn_purchase_follower",
		states = {
			available = "active",
			select_follower = "inactive",
			no_resources = "inactive_no_resources"
		}
	},

	total_cost = {
		panel_id = "total_cost_followers",
		resource_template = "template_resource_cost",
		resource_holder = "resource_cost_container",
		resoruce_state_negative = "negative"
	},

	followers_purchased_path = "UI/Campaign UI/camp_follower_assigned_notification",

	v = {
		panel = nil,
		btn_purchase = nil,
		army_template = nil,
		txt_hero_name = nil,
		follower_template = nil,
		followers_holder = {
			egypt = nil,
			aethiopia = nil,
			canaan = nil,
			susa = nil
		},
		cost_panel = nil,
		resource_holder = nil,
		resource_template = nil,

		selected_force_cqi = nil,
		selected_followers = {},
		template_components = {}
	},
}

local ui_panel = exotic_strategist.ui.panel

exotic_strategist.ui.panel.listeners = {
	{
		name = "exotic_strategist_panel_lclick",
		event = "ComponentLClickUp",
		condition = function(context)
			return uicomponent_descended_from(UIComponent(context.component), ui_panel.id)
		end,
		callback = function(context)
			local uic = UIComponent(context.component)

			local follower_key = uic:GetProperty("follower_key")
			if follower_key then
				if string.find(uic:CurrentState(), ui_panel.followers.portrait.states.available) then
					ui_panel.on_follower_clicked(follower_key, uic, true)
				elseif string.find(uic:CurrentState(), ui_panel.followers.portrait.states.selected) then
					ui_panel.on_follower_clicked(follower_key, uic, false)
				end
				return
			end

			local force_cqi = uic:GetProperty("force_cqi")
			if force_cqi then
				ui_panel.on_army_selected(tonumber(force_cqi), uic)
				return
			end

			if context.string == ui_panel.button_purchase.id then
				ui_panel.on_button_purchase_clicked()
				return			
			end
		end,
		is_persistent = true
	}
}

exotic_strategist.ui.prebattle = {
	id = "popup_pre_battle",

	button_flyout = {
		id = "button_follower_flyout",
		states = {
			active = "active",
			inactive = "inactive"
		},
		parent_siege = "button_set_siege",
		parent_land = "button_set_attack"
	},

	flyout = "follower_flyout",

	followers = {
		template = "follower_template",
		portrait = {
			id = "portrait",
			states = {
				available = "flyout_available",
				locked = "flyout_locked",
				selected = "flyout_selected",
			}
		},
		tooltip = {
			path = "UI/Campaign UI/tooltip_fm_memnon_2",
			type = {
				id = "tx_follower_type",
				states = {
					active = "active",
					passive = "passive"
				}
			},
			name = "dy_follower_name",
			description = "dy_follower_description",
			effect_bundle = "effect_bundle_template",
			cost = "recruit_cost",
			activation_cost = {
				id = "action_cost",
				value = "action_cost_price"
			},
			unlock = "txt_unlock",
			not_available = {
				id = "follower_not_suitable",
				info = {
					id = "txt_info",
					states = {
						-- siege_only = "siege_only",
						major_settlement_only = "major_settlement_only",
						minor_settlement_only = "minor_settlement_only",
						low_hp = "low_hp"
					}
				},
				no_resources = "txt_no_resources"
			},
			available = {
				id = "follower_info_text",
				available = "txt_available",
				selected = "txt_selected",
			},
			status_component = "status",
		}
	},

	selected_follower = {
		panel = "selected_follower_panel",
		name = "tx_follower_name",
		follower_holder = "follower_template_holder",
		effect_bundle = "effect_bundle_template",
		cancel_button_id = "button_cancel_follower",
	},

	v = {
		force_cqi = nil,
		selected_follower_key = nil, -- Store the selected active follower. The effect is activated when the battle starts
		
		panel = nil,
		button_flyout = nil,
		flyout = nil,
		follower_template_active = nil,
		follower_template_passive = nil,

		selected_follower_panel = nil,
		selected_follower_name = nil,
		selected_follower_bundle = nil,
		selected_follower_holder = nil,
		selected_follower_portrait = nil,
	}
}

local ui_battle = exotic_strategist.ui.prebattle

exotic_strategist.ui.prebattle.listeners = {
	{
		name = "exotic_strategist_prebattle_lclick",
		event = "ComponentLClickUp",
		condition = function(context)
			return uicomponent_descended_from(UIComponent(context.component), ui_battle.id)
		end,
		callback = function(context)
			local uic = UIComponent(context.component)

			if context.string == ui_battle.button_flyout.id then
				ui_battle.v.flyout:SetVisible(not ui_battle.v.flyout:Visible())
			end

			local follower_key = uic:GetProperty("follower_key")
			if follower_key then
				ui_battle.on_follower_selected(follower_key, uic)
				ui_battle.close_flyout()
				return
			end

			-- clear selected follower
			if uic:GetProperty("selected_follower") or context.string == ui_battle.selected_follower.cancel_button_id then
				ui_battle.on_follower_selected(nil, nil)
				ui_battle.close_flyout()
				return
			end
		end,
		is_persistent = true
	},
	{
		name = "exotic_strategist_lclick_start_battle",
		event = "ComponentLClickUp",
		condition = function(context)
			return (context.string == "button_attack" or context.string == "button_autoresolve")
		end,
		callback = function(context)
			if ui_battle.v.selected_follower_key then
				CampaignUI.TriggerCampaignScriptEvent(
					cm:get_faction(exotic_strategist.faction_key):command_queue_index(),
					string.format("ExoticStrategistFollowerActionActivated:%s:%d", ui_battle.v.selected_follower_key, ui_battle.v.force_cqi)
				)
			end

			common.notify_memnon_started_battle(ui_battle.v.selected_follower_key or "")
		end,
		is_persistent = true
	},
	{
		name = "exotic_strategist_prebattle_close_on_click_outside",
		event = "ComponentLClickUp",
		condition = function(context)
			return not uicomponent_descended_from(UIComponent(context.component), ui_battle.flyout)
					and UIComponent(context.component):Id() ~= ui_battle.flyout
					and context.string ~= ui_battle.button_flyout.id
		end,
		callback = function(context)
			ui_battle.close_flyout()
		end,
		is_persistent = true
	},
}

---------------------------------------------------------------
------------------------ VARIABLES ----------------------------
---------------------------------------------------------------

-- Map with all the armies of our faction, keeping track of all the followers in each army
exotic_strategist.army_followers = {
	-- force_cqi = {"egyptian_healer", "disguised_trader"}
}

-- The following table contains an entry in the format {cqi = x, resource_amount = y} for each
-- follower with effect favour_to_god_for_local_temple in a military force
-- A military force can appear more than once, if for example there are 2 followers with this effect in the force
exotic_strategist.favour_to_god_armies = {
	-- {cqi = x, resource_amount = y}
}

---------------------------------------------------------------
---------------------- IMPLEMENTATION -------------------------
---------------------------------------------------------------

function exotic_strategist.get_follower(follower_key)
	return exotic_strategist.followers[follower_key]
end

function exotic_strategist.get_follower_key_from_follower(follower)
	for key, follower_data in pairs(exotic_strategist.followers) do
		if follower_data == follower then
			return key
		end
	end
end

-- Add the newly reacruited army to the map
function exotic_strategist.on_army_created(force_cqi)
	exotic_strategist.army_followers[force_cqi] = {}
end

-- Cleanup destroyed armies data
function exotic_strategist.on_army_destroyed(force_cqi)

	if exotic_strategist.has_army_any_recruited_followers(force_cqi) then
		local mf = cm:get_military_force_by_cqi(force_cqi)
		local mf_faction = mf:faction()
		core:trigger_event("TROY_REM_MEMNON_ARMY_WITH_FOLLOWERS_DESTROYED", mf_faction, mf )
	end

	exotic_strategist.cleanup_active_followers_effects(force_cqi)

	exotic_strategist.army_followers[force_cqi] = nil

	table_erase_if(
		exotic_strategist.favour_to_god_armies,
		function(elem)
			return elem.cqi == force_cqi
		end
	)
end

-- Helper function that returns a list with all recruited followers for this military force
function exotic_strategist.get_army_followers(force_cqi)
	return exotic_strategist.army_followers[force_cqi]
end

function exotic_strategist.get_max_army_followers_count()
	local max_count = 0
	for _, v in pairs(exotic_strategist.army_followers) do
		if #v > max_count then
			max_count = #v
		end
	end
	return max_count
end

-- Returns a list of only the active followers of this military force
function exotic_strategist.get_army_active_followers(force_cqi)
	local followers = exotic_strategist.get_army_followers(force_cqi)

	local active_followers = {}
	for _, follower_key in ipairs(followers) do
		local follower = exotic_strategist.get_follower(follower_key)

		if exotic_strategist.is_follower_type_active(follower) then
			table.insert(active_followers, follower_key)
		end
	end

	return active_followers
end

function exotic_strategist.has_army_any_recruited_followers(force_cqi)
	return #exotic_strategist.get_army_followers(force_cqi) > 0
end

function exotic_strategist.is_follower_type_active(follower)
	return follower.effect.type == "active"
end

-- Check if all of the conditions for recruiting the given follower are met
function exotic_strategist.can_army_recruit_follower(follower_key, force_cqi)
	return exotic_strategist.is_follower_unlocked(follower_key) and
		not exotic_strategist.has_army_follower_of_type(follower_key, force_cqi) and
		exotic_strategist.can_afford_follower_recruitment(follower_key)
end

-- Check required technologies for this follower
function exotic_strategist.is_follower_unlocked(follower_key)
	local follower = exotic_strategist.get_follower(follower_key)
	local faction = cm:get_faction(exotic_strategist.faction_key)

	return not follower.required_technology or faction:has_technology(follower.required_technology)
end

-- Check if we already have a follower of this type in the force. You can have only unique followers in the army
function exotic_strategist.has_army_follower_of_type(follower_key, force_cqi)
	local followers = exotic_strategist.get_army_followers(force_cqi)
	return table_contains(followers, follower_key)
end

function exotic_strategist.can_afford_follower_recruitment(follower_key)
	local faction = cm:get_faction(exotic_strategist.faction_key)
	local recruit_cost = exotic_strategist.get_follower_recruitment_cost(follower_key)

	return faction:can_afford_custom_resource_cost(recruit_cost)
end

function exotic_strategist.get_follower_recruitment_cost(follower_key, is_for_ui --[[optional, default = nil--]])
	local follower = exotic_strategist.get_follower(follower_key)
	local cost = cm:create_new_custom_resource_cost()

	for _, resource in ipairs(follower.recruit_cost) do
		cost:add_resource_cost(resource[1], "troy_resource_factor_faction", -resource[2])
	end

	local faction = cm:get_faction(exotic_strategist.faction_key)
	local cost_mod = 1
	for _, effect_key in ipairs(exotic_strategist.follower_recruit_cost_mod_faction_effects) do
		cost_mod = cost_mod + faction:get_effect_value(effect_key) / 100
	end

	cost:multiply_by(cost_mod)
	if is_for_ui then
		cost:multiply_by(-1)
	end
	return cost
end

-- If allowed, add this follower to the military force and apply its effect is the follower's type is passive
function exotic_strategist.recruit_follower(follower_key, force_cqi)
	local follower = exotic_strategist.get_follower(follower_key)

	if not follower or not exotic_strategist.can_army_recruit_follower(follower_key, force_cqi) then
		script_error("ERROR: exotic_strategist.recruit_follower Trying to recruit " .. follower_key .. " in the force with cqi " .. 
			tostring(force_cqi) .." but there is no such follower type or it can't be recruited")
		return false
	end

	table.insert(exotic_strategist.army_followers[force_cqi], follower_key)

	local faction = cm:get_faction(exotic_strategist.faction_key)

	-- Apply cost transactions
	local recruit_cost = exotic_strategist.get_follower_recruitment_cost(follower_key)
	cm:faction_apply_resource_transaction(faction, recruit_cost)

	-- Apply passive follower effect
	if follower.effect.type == "passive" then
		follower.effect.activate(force_cqi)
	end

	-- Update buildings bonuses
	exotic_strategist.reevaluate_bonus_from_buildings_for_force(force_cqi)
	core:trigger_event("ScriptEventMemnonExoticStrategistFollowerRecruited", force_cqi, follower_key)
end

function exotic_strategist.get_pending_battle_general_for_our_faction()
	local pending_battle = cm:model():pending_battle()
	local general = nil

	if pending_battle:has_attacker() and pending_battle:attacker():faction():name() == exotic_strategist.faction_key then
		general = pending_battle:attacker()
	elseif pending_battle:has_defender() and pending_battle:defender():faction():name() == exotic_strategist.faction_key then
		general = pending_battle:defender()
	end

	return general
end

function exotic_strategist.is_battle_against_another_player()
	if not exotic_strategist.is_battle_with_our_faction() then
		return false
	end

	local enemy_character = nil
	local secondary_enemy_characters = nil

	local pending_battle = cm:model():pending_battle()
	if pending_battle:has_attacker() and pending_battle:attacker():faction():name() ~= exotic_strategist.faction_key then
		enemy_character = pending_battle:attacker()
		secondary_enemy_characters = pending_battle:secondary_attackers()
	elseif pending_battle:has_defender() and pending_battle:defender():faction():name() ~= exotic_strategist.faction_key then
		enemy_character = pending_battle:defender()
		secondary_enemy_characters = pending_battle:secondary_defenders()
	end

	if enemy_character and enemy_character:faction():is_human() then
		return true
	end
	if secondary_enemy_characters then
		for i = 0, secondary_enemy_characters:num_items() - 1 do
			if secondary_enemy_characters:item_at(i):faction():is_human() then
				return true
			end
		end
	end

	return false
end

function exotic_strategist.get_pending_battle_general_for_enemy_faction()
	local pending_battle = cm:model():pending_battle()
	local general = nil

	if pending_battle:has_attacker() and pending_battle:attacker():faction():name() ~= exotic_strategist.faction_key then
		general = pending_battle:attacker()
	elseif pending_battle:has_defender() and pending_battle:defender():faction():name() ~= exotic_strategist.faction_key then
		general = pending_battle:defender()
	end

	return general
end

function exotic_strategist.is_battle_with_our_faction()
	if cm:model():pending_battle():attacker_faction():name() == exotic_strategist.faction_key or
		cm:model():pending_battle():defender_faction():name() == exotic_strategist.faction_key then
		return true
	end

	return false
end

-- Update buildings effects for all military forces
function exotic_strategist.reevaluate_bonus_from_buildings()
	local military_force_list = cm:get_faction(exotic_strategist.faction_key):military_force_list()
	local num_forces = military_force_list:num_items()

	for i = 0, num_forces - 1 do
		local force_cqi = military_force_list:item_at(i):command_queue_index()
		exotic_strategist.reevaluate_bonus_from_buildings_for_force(force_cqi)
	end
end

function exotic_strategist.reevaluate_bonus_from_buildings_for_force(force_cqi)
	local military_force = cm:model():military_force_for_command_queue_index(force_cqi)

	if military_force:has_effect_bundle(exotic_strategist.buildings_bonus.effect_bundle_key) then
		cm:remove_effect_bundle_from_force(exotic_strategist.buildings_bonus.effect_bundle_key, force_cqi)
	end

	local num_followers_in_force = #exotic_strategist.get_army_followers(force_cqi)
	local effect_value = 0
	local buildings = military_force:buildings()

	for i = 0, buildings:num_items() - 1 do
		local building_key = buildings:item_at(i):name()

		if exotic_strategist.buildings_bonus.buildings[building_key] then
			effect_value = effect_value + exotic_strategist.buildings_bonus.buildings[building_key].bonus_dmg_per_follower * num_followers_in_force
		end
	end

	if effect_value > 0 then
		effect_value = math.min(effect_value, exotic_strategist.buildings_bonus.bonus_dmg_cap)

		local effect_bundle = cm:create_new_custom_effect_bundle(
			exotic_strategist.buildings_bonus.effect_bundle_key)

		for _, effect in ipairs(exotic_strategist.buildings_bonus.effects) do
			effect_bundle:add_effect(effect, "force_to_force_own", effect_value)
		end
		cm:apply_custom_effect_bundle_to_force(effect_bundle, military_force)
	end
end

function exotic_strategist.apply_active_follower_effect(follower_key, force_cqi)
	local follower = exotic_strategist.get_follower(follower_key)
	local faction = cm:get_faction(exotic_strategist.faction_key)

	if not exotic_strategist.has_army_follower_of_type(follower_key, force_cqi) then
		script_error("ERROR: exotic_strategist.apply_active_follower_effect() Trying to activate the effect of follower " .. 
			follower_key .. " but the military force with cqi " .. tostring(force_cqi) .. " hasn't recruited this follower yet.")
		return false
	end

	if follower.effect.type ~= "active" then
		script_error("ERROR: exotic_strategist.apply_active_follower_effect() Trying to activate the effect of follower " .. 
			follower_key .. " but this is not an active follower.")
		return false
	end

	local activation_cost = exotic_strategist.get_active_follower_action_cost(follower, force_cqi, true --[[should_apply_skills_mod--]])

	if not faction:can_afford_custom_resource_cost(activation_cost) then
		script_error("ERROR: exotic_strategist.apply_active_follower_effect() Trying to activate the effect of follower " .. 
			follower_key .. " without having enough resources")
		return false
	end

	follower.effect.activate(force_cqi)

	-- Activation cost
	cm:faction_apply_resource_transaction(faction, activation_cost)
end

function exotic_strategist.get_active_follower_action_cost(follower, force_cqi, should_apply_skills_mod)
	local cost = cm:create_new_custom_resource_cost()

	if not exotic_strategist.is_follower_type_active(follower) then
		script_error("ERROR: exotic_strategist.get_active_follower_action_cost() Trying to get the action cost of a PASSIVE follower")
		return
	end

	if not follower.activation_cost then 
		return cost
	end

	for _, resource in ipairs(follower.activation_cost) do
		cost:add_resource_cost(resource[1], "troy_resource_factor_faction", -resource[2])
	end

	if not should_apply_skills_mod or not force_cqi then
		return cost
	end

	local military_force = cm:model():military_force_for_command_queue_index(force_cqi)
	local character_list = military_force:character_list()

	local skill_mod = 1
	for i = 0, character_list:num_items() - 1 do
		local curr_character =  character_list:item_at(i)
		for _, skill_info in ipairs(exotic_strategist.character_skills) do
			if curr_character:has_skill(skill_info.key) and skill_info.follower_action_cost_modifier then
				skill_mod = skill_mod + skill_info.follower_action_cost_modifier
			end
		end
	end

	skill_mod = math.max(0, skill_mod)
	cost:multiply_by(skill_mod)

	return cost
end

-- Called after every battle to remove any active effects
function exotic_strategist.cleanup_active_followers_effects(force_cqi)
	local active_followers = exotic_strategist.get_army_active_followers(force_cqi)

	for _, follower_key in ipairs(active_followers) do
		local follower = exotic_strategist.get_follower(follower_key)
		follower.effect.deactivate(force_cqi)
	end	
end
---------------------------------------------------------------
------------------------ LISTENERS ----------------------------
---------------------------------------------------------------

core:add_listener(
	"exotic_strategist_NewCampaignStarted",
	"NewCampaignStarted",
	true,
	function(context)
		if cm:get_faction(exotic_strategist.faction_key) then
			local military_force_list = cm:get_faction(exotic_strategist.faction_key):military_force_list()
			local num_forces = military_force_list:num_items()

			for i = 0, num_forces - 1 do
				local force_cqi = military_force_list:item_at(i):command_queue_index()
				exotic_strategist.on_army_created(force_cqi)
			end
		end
		
	end,
	false
)

function exotic_strategist.add_listeners()
	core:add_listener(
		"exotic_strategist_army_created",
		"MilitaryForceCreated",
		function(context) return context:military_force_created():faction():name() == exotic_strategist.faction_key end,
		function(context)
			exotic_strategist.on_army_created(context:military_force_created():command_queue_index())
		end,
		true
	)

	core:add_listener(
		"exotic_strategist_army_destroyed",
		"MilitaryForceDestroyed",
		function(context)
			return not not exotic_strategist.army_followers[context:cqi()]
		end,
		function(context)
			exotic_strategist.on_army_destroyed(context:cqi())
		end,
		true
	)

	core:add_listener(
		"exotic_strategist_battle_completed",
		"CharacterCompletedBattle",
		function(context)
			return context:character():faction():name() == exotic_strategist.faction_key
		end,
		function(context)
			local force = context:character():military_force()

			if not force:is_null_interface() then
				exotic_strategist.cleanup_active_followers_effects(force:command_queue_index())
			end
		end,
		true
	)

	-- Buildings
	core:add_listener (
		"exotic_strategist_building_completed",
		"CharacterMilitaryForceBuildingCompleted",
		function(context)
			return context:building():faction():name() == exotic_strategist.faction_key and 
				exotic_strategist.buildings_bonus.buildings[context:building():name()]
		end,
		function(context)
			exotic_strategist.reevaluate_bonus_from_buildings_for_force(context:building():military_force():command_queue_index())
		end,
		true
	)

	core:add_listener (
		"exotic_strategist_building_demolished",
		"BuildingDemolishedPostOutcomeApplication",
		function(context)
			return context:faction():name() == exotic_strategist.faction_key
		end,
		function(context)
			exotic_strategist.reevaluate_bonus_from_buildings()
		end,
		true
	)

	-- Implementation of follower effect: favour_to_god_for_local_temple
	core:add_listener (
		"exotic_strategist_turn_start_favour_to_god_for_local_temple",
		"FactionTurnStart",
		function(context)
			return context:faction():name() == exotic_strategist.faction_key
		end,
		function(context)
			local faction = context:faction()

			for _, elem in ipairs(exotic_strategist.favour_to_god_armies) do
				local military_force = cm:model():military_force_for_command_queue_index(elem.cqi)
				local buildings = military_force:buildings()

				for i = 0, buildings:num_items() - 1 do 
					local building = buildings:item_at(i)
					local is_temple = string.find(building:chain(), exotic_strategist.religion_buildings_keyword)

					if is_temple then
						for _, effect_key in pairs(gods_effects) do
							local amount = building:get_effect_value(effect_key)

							if amount ~= 0 then
								local target_god_resource = string.gsub(effect_key, "troy_effect_gods_favour_mod_","troy_god_attitude_")

								if faction:has_pooled_resource(target_god_resource) then
									cm:faction_add_pooled_resource(faction:name(), target_god_resource, gods_factors.faction, elem.resource_amount)
								end

								break
							end
						end

						break -- break the buildings loop. We only have one religion building per settlement
					end
				end
			end
		end,
		true
	)

	-- The amount of action points that will be restored to the faction after it razes a settlement.
	-- This is not directly related to Exotic Strategist but it is too small to be separated into another file.
	core:add_listener(
		"troy_rem_horde_aethiopians_restore_ap_after_raze",
		"CharacterPerformsSettlementOccupationDecision",
		function(context)
			return context:character():faction():name() == exotic_strategist.faction_key
		end,
		function(context)
			cm:replenish_action_points(cm:char_lookup_str(context:character():command_queue_index()), exotic_strategist.action_points_after_raze)
		end,
		true
	)

	core:add_listener(
		"exotic_strategist_panel_opened",
		"PanelOpenedCampaign",
		function(context) return context.string == ui_panel.id end,
		ui_panel.on_fm_panel_opened,
		true
	)

	core:add_listener(
		"exotic_strategist_panel_closed",
		"PanelClosedCampaign",
		function(context) return context.string == ui_panel.id end,
		ui_panel.on_fm_panel_closed,
		true
	)

	core:add_listener(
		"exotic_strategist_ui_purchase_follower",
		"UITriggerScriptEvent",
		function(context)
			return context:trigger():split(":")[1] == "exotic_strategist_ui_purchase_follower"
		end,
		function(context)
			local params = context:trigger():split(":") 
			local force_cqi = tonumber(params[2])

			for i = 3, #params do
				local follower_idx = tonumber(params[i])
				local follower_key = exotic_strategist.follower_list[follower_idx]
				exotic_strategist.recruit_follower(follower_key, force_cqi)
			end
		end,
		true
	)

	core:add_listener(
		"exotic_strategist_prebattle_panel_closed",
		"PanelClosedCampaign",
		function(context) return context.string == ui_battle.id end,
		ui_battle.on_panel_closed,
		true
	)

	core:add_listener(
		"exotic_strategist_ui_follower_action_activated",
		"UITriggerScriptEvent",
		function(context)
			return context:trigger():split(":")[1] == "ExoticStrategistFollowerActionActivated"
		end,
		function(context)
			local follower_key = context:trigger():split(":")[2]
			local force_cqi = tonumber(context:trigger():split(":")[3])

			exotic_strategist.apply_active_follower_effect(follower_key, force_cqi)
		end,
		true
	)

	-- This is not related to Exotic strategist FM. Putting it here to not create another file just for that
	core:add_listener(
		"memnon_unit_created",
		"UnitCreated",
		function(context)
			return context:unit():faction():name() == exotic_strategist.faction_key
		end,
		function(context)
			achievements.memnon.func_memnon_unit_created(context:unit())
		end,
		true
	)
end

-- prebattle screen
-- Move out of exotic_strategist.add_listeners() because it won't work when loading directly into pre-battle screen
core:add_listener(
	"exotic_strategist_prebattle_panel_opened",
	"PanelOpenedCampaign",
	function(context) return context.string == ui_battle.id end,
	function(context) ui_battle.on_panel_opened(context) end,
	true
)

---------------------------------------------------------------
--------------------------- UI --------------------------------
---------------------------------------------------------------

function ui_panel.on_fm_panel_opened(context)
	ui_panel.v.panel = UIComponent(context.component)

	ui_panel.v.btn_purchase = ui_panel.v.panel:SequentialFind(ui_panel.button_purchase.id)

	ui_panel.v.army_template = ui_panel.get_child_template(ui_panel.armies.template)
	ui_panel.v.armies_holder = ui_panel.v.panel:SequentialFind(unpack(ui_panel.armies.holder))
	ui_panel.v.txt_hero_name = ui_panel.v.panel:SequentialFind(ui_panel.armies.hero_name)

	ui_panel.v.follower_template_active = ui_panel.get_child_template(ui_panel.followers.template_active)
	ui_panel.v.follower_template_passive = ui_panel.get_child_template(ui_panel.followers.template_passive)

	ui_panel.v.followers_holder = {}
	ui_panel.v.followers_holder.egypt = ui_panel.v.panel:SequentialFind(ui_panel.followers.holder.egypt)
	ui_panel.v.followers_holder.aethiopia = ui_panel.v.panel:SequentialFind(ui_panel.followers.holder.aethiopia)
	ui_panel.v.followers_holder.canaan = ui_panel.v.panel:SequentialFind(ui_panel.followers.holder.canaan)
	ui_panel.v.followers_holder.susa = ui_panel.v.panel:SequentialFind(ui_panel.followers.holder.susa)

	ui_panel.v.selected_followers = {}

	ui_panel.v.cost_panel = ui_panel.v.panel:SequentialFind(ui_panel.total_cost.panel_id)
	ui_panel.v.resource_holder = ui_panel.v.panel:SequentialFind(ui_panel.total_cost.resource_holder)
	ui_panel.v.resource_template = ui_panel.get_child_template(ui_panel.total_cost.resource_template)

	ui_panel.add_listeners()
	ui_panel.create_armies()
end

function ui_panel.on_fm_panel_closed()
	-- Destroy template components
	for _, component in ipairs(ui_panel.v.template_components) do
		component:Destroy()
	end

	ui_panel.v = {}

	for _, listener in ipairs(ui_panel.listeners) do
		core:remove_listener(listener.name)
	end
end

function ui_panel.add_listeners()
	for _, listener in ipairs(ui_panel.listeners) do
		core:add_listener(
			listener.name,
			listener.event,
			listener.condition,
			listener.callback,
			listener.is_persistent
		)
	end
end

function ui_panel.create_armies()
	ui_panel.on_army_selected(nil, nil)
	ui_panel.v.armies_holder:DestroyChildren()

	local military_force_list = cm:get_faction(exotic_strategist.faction_key):military_force_list()
	local num_forces = military_force_list:num_items()

	for i = 0, num_forces - 1 do
		local force = military_force_list:item_at(i)
		local general_cqi = force:general_character():command_queue_index()

		-- create army portrait
		local army = UIComponent(ui_panel.v.armies_holder:CreateFromComponent(ui_panel.v.army_template:Address(), 
			string.format("army_portrait_%d", general_cqi)))

		-- initialise army portrait
		local army_card = army:SequentialFind(ui_panel.armies.card)
		army_card:InterfaceFunction("initialise", general_cqi)
		army_card:SetProperty("force_cqi", tostring(force:command_queue_index()))

		-- select the first army
		if i == 0 then
			army_card:SimulateLClick()
		end
	end
end

function ui_panel.create_followers(force_cqi)
	ui_panel.v.selected_followers = {}
	ui_panel.update_button_purchase()
	ui_panel.update_total_cost_panel()

	for _, holder in pairs(ui_panel.v.followers_holder) do
		holder:DestroyChildren()
	end

	for follower_key, follower in pairs(exotic_strategist.followers) do
		local template_to_use = follower.effect.type == "active" and ui_panel.v.follower_template_active:Address() or 
			ui_panel.v.follower_template_passive:Address()
		-- create follower component
		local follower_component = ui_panel.v.followers_holder[follower.region]:CreateFromComponent(
			template_to_use, 
			string.format("follower_%s", follower_key)
		)
		follower_component = UIComponent(follower_component)
		follower_component:SetVisible(true)
		follower_component:SetProperty("ui_order", tostring(follower.ui_order or 0))

		-- set active or passive follower
		-- follower_component:SetState(follower.effect.type)

		-- set "follower_key" property to the portrait_card. The player will click on this
		local portrait = follower_component:SequentialFind(ui_panel.followers.portrait.id)
		portrait:SetProperty("follower_key", follower_key)

		-- set the correct follower icon
		local image_index = tonumber(portrait:GetProperty("image_index")) or 1
		portrait:SetImagePath(follower.ui_icon_path, image_index)

		-- set follower state (locked / purchased / available)
		ui_panel.update_follower_portrait_state(portrait, follower_key, force_cqi)

		-- initialise tooltip
		ui_panel.set_follower_tooltip(portrait, follower, force_cqi)
	end

	for _, holder in pairs(ui_panel.v.followers_holder) do
		holder:SortChildrenByProperties({"ui_order", true})
	end
end

-- Update follower state (locked / purchased / available)
function ui_panel.update_follower_portrait_state(portrait, follower_key, force_cqi)
	if exotic_strategist.has_army_follower_of_type(follower_key, force_cqi) then
		portrait:SetState(ui_panel.followers.portrait.states.purchased)
	elseif not exotic_strategist.is_follower_unlocked(follower_key) then
		portrait:SetState(ui_panel.followers.portrait.states.locked)
	else
		portrait:SetState(ui_panel.followers.portrait.states.available)
	end
end

function ui_panel.set_follower_tooltip(portrait, follower, force_cqi)
	portrait:InterfaceFunction("set_tooltip_path", ui_panel.followers.tooltip.path)
	local tooltip = portrait:SequentialFind(portrait:Id() .. "_tooltip")

	local follower_type = tooltip:SequentialFind(ui_panel.followers.tooltip.type.id)
	follower_type:SetState(ui_panel.followers.tooltip.type.states[follower.effect.type])

	local follower_name = tooltip:SequentialFind(ui_panel.followers.tooltip.name)
	local localised_name = common.get_localised_string(follower.ui_name)
	follower_name:SetText(localised_name, follower.ui_name)

	local follower_description = tooltip:SequentialFind(ui_panel.followers.tooltip.description)
	local localised_description = common.get_localised_string(follower.ui_description)
	follower_description:SetText(localised_description, follower.ui_description)

	local effect_bundle = tooltip:SequentialFind(ui_panel.followers.tooltip.effect_bundle)
	effect_bundle:InterfaceFunction("set_effect_bundle_record", follower.effect.effect_bundle_key)

	local should_hide_cost_separator = true
	-- cost
	local follower_key = exotic_strategist.get_follower_key_from_follower(follower)
	local faction = cm:get_faction(exotic_strategist.faction_key)
	local is_recruited = exotic_strategist.has_army_follower_of_type(follower_key, force_cqi) 

	local cost = exotic_strategist.get_follower_recruitment_cost(follower_key, true--[[is_for_ui--]])
	local cost_component = portrait:SequentialFind(ui_panel.followers.tooltip.cost)
	if is_recruited then
		UIComponent(cost_component:Parent()):SetVisible(false)
	else
		cost_component:SetText(cost:to_string(faction), "troy_rem_memnon_exotic_strategist.lua")
		should_hide_cost_separator = false
	end

	-- activation cost
	local cost_holder = tooltip:SequentialFind(ui_panel.followers.tooltip.activation_cost.id)
	if exotic_strategist.is_follower_type_active(follower) then
		cost_holder:SetVisible(true)
		should_hide_cost_separator = false

		local activation_cost = exotic_strategist.get_active_follower_action_cost(follower, nil, false --[[should_apply_skills_mod--]])
		activation_cost:multiply_by(-1)
		local cost_value = cost_holder:SequentialFind(ui_panel.followers.tooltip.activation_cost.value)
		cost_value:SetText(activation_cost:to_string(faction), "troy_rem_memnon_exotic_strategist.lua")
	else
		cost_holder:SetVisible(false)
	end

	if should_hide_cost_separator then
		tooltip:SequentialFind(ui_panel.followers.tooltip.cost_separator):SetVisible(false)
	end

	-- set follower status
	local is_unlocked = exotic_strategist.is_follower_unlocked(follower_key)

	local state = ui_panel.followers.tooltip.status.states.locked
	if is_recruited then
		state = ui_panel.followers.tooltip.status.states.recruited
	elseif is_unlocked then
		state = ui_panel.followers.tooltip.status.states.unlocked
	end
	local status = tooltip:SequentialFind(ui_panel.followers.tooltip.status.id)
	status:SetState(state)

	-- unlocked by technology component
	local unlock = portrait:SequentialFind(ui_panel.followers.tooltip.unlock)
	if is_unlocked then
		unlock:SetVisible(false)
	else
		local technology_localised_name = common.get_localised_string(
			"technologies_onscreen_name_" .. follower.required_technology)
		unlock:SetText(
			string.format(unlock:GetStateText(), technology_localised_name),
			"UIED + technologies table"
		)
	end
end

function ui_panel.update_button_purchase()
	if #ui_panel.v.selected_followers > 0 then
		local can_afford = true

		for _, follower_key in ipairs(ui_panel.v.selected_followers) do
			can_afford = can_afford and exotic_strategist.can_afford_follower_recruitment(follower_key)
		end
		
		local state = can_afford and ui_panel.button_purchase.states.available or ui_panel.button_purchase.states.no_resources
		ui_panel.v.btn_purchase:SetState(state)
	else
		ui_panel.v.btn_purchase:SetState(ui_panel.button_purchase.states.select_follower)
	end
end

function ui_panel.update_total_cost_panel()
	ui_panel.v.cost_panel:SetVisible(#ui_panel.v.selected_followers > 0)

	if #ui_panel.v.selected_followers == 0 then 
		return 
	end

	local faction = cm:get_faction(exotic_strategist.faction_key)

	local cost = cm:create_new_custom_resource_cost()
	for _, follower_key in ipairs(ui_panel.v.selected_followers) do
		local current_cost = exotic_strategist.get_follower_recruitment_cost(follower_key, true--[[is_for_ui--]])
		cost:add(current_cost)
	end
	local resources = cost:resources()

	ui_panel.v.resource_holder:DestroyChildren()

	for _, res in ipairs(resources) do
		local c_cost = UIComponent(ui_panel.v.resource_holder:CreateFromComponent(ui_panel.v.resource_template:Address(), res[1]))
		c_cost:SetImagePath(res[3])
		c_cost:SetTooltipText(common.get_localised_string("pooled_resources_display_name_" .. res[1]), "pooled_resource_display_name", true)

		c_cost:SetText(tostring(res[2]), "troy_rem_memnon_exotic_strategist.lua")
		if not cm:faction_can_afford_resource_cost(faction, {res}) then
			c_cost:SetState(ui_panel.total_cost.resoruce_state_negative)
		end
	end
end

function ui_panel.on_army_selected(force_cqi, component)
	-- normally there will always be a selected army. The only exception is before / during the construction of the army portraits
	ui_panel.v.selected_force_cqi = force_cqi

	if force_cqi and component then
		ui_panel.v.txt_hero_name:SetText(component:GetTooltipText())
		ui_panel.create_followers(force_cqi)
	end
end

function ui_panel.on_follower_clicked(follower_key, portrait, should_select)
	if portrait then
		local state = should_select and ui_panel.followers.portrait.states.selected
			or ui_panel.followers.portrait.states.available
		portrait:SetState(state)
	end

	if should_select then
		table.insert(ui_panel.v.selected_followers, follower_key)
	else
		table_erase(ui_panel.v.selected_followers, follower_key)
	end

	ui_panel.update_button_purchase()
	ui_panel.update_total_cost_panel()
end

function ui_panel.on_button_purchase_clicked()
	if #ui_panel.v.selected_followers > 0 and ui_panel.v.selected_force_cqi then
		local faction_cqi = cm:get_faction(exotic_strategist.faction_key):command_queue_index()

		local text = common.get_localised_string(exotic_strategist.localisation_strings.purchase_follower_confirmation_text_key)

		local cost = cm:create_new_custom_resource_cost()
		for _, follower_key in ipairs(ui_panel.v.selected_followers) do
			local current_cost = exotic_strategist.get_follower_recruitment_cost(follower_key, true--[[is_for_ui--]])
			cost:add(current_cost)
		end
		text = string.format(text, cost:to_string())

		create_confirmation_box_with_text_from_script(
			"exotic_strategist_purchase_follower", 
			text,
			exotic_strategist.localisation_strings.purchase_follower_confirmation_text_key,
			function()
				local event_string = string.format("exotic_strategist_ui_purchase_follower:%d", ui_panel.v.selected_force_cqi)
				for _, follower_key in ipairs(ui_panel.v.selected_followers) do
					local idx = table_find(exotic_strategist.follower_list, follower_key, true)
					if idx then
						event_string = event_string .. ":" .. idx
					end
				end

				CampaignUI.TriggerCampaignScriptEvent(
					faction_cqi, 
					event_string
				)
				CampaignUI.TriggerCampaignVO(exotic_strategist.vo_event, exotic_strategist.faction_key)
				ui_panel.v.panel:InterfaceFunction("close_panel")
				core:get_ui_root():CreateComponent("follower_purchased", ui_panel.followers_purchased_path)
			end, 
			nil,
			ui_panel.v.panel
		)
	end
end

function ui_panel.get_child_template(id)
	local component = ui_panel.v.panel:SequentialFind(id)
	if not component then return nil end

	UIComponent(component:Parent()):Divorce(component:Address())

	-- Add the template to this list on order to be destroyed on PanelClosedCampaign
	-- Otherwise it will be destroyed only after the UI is destroyed
	ui_panel.v.template_components = ui_panel.v.template_components or {}
	table.insert(ui_panel.v.template_components, component)

	return component
end

-- prebattle
function ui_battle.on_panel_opened(context)
	local general = exotic_strategist.get_pending_battle_general_for_our_faction()
	if not general or not general:model():faction_is_local(exotic_strategist.faction_key) then 
		return
	end

	local pending_battle = cm:model():pending_battle()
	-- Active followers cannot be used against another players or in quest battles
	if exotic_strategist.is_battle_against_another_player() or pending_battle:is_quest_battle() then
		return
	end

	local is_already_opened_and_initialized = ui_battle.v.panel ~= nil
	if is_already_opened_and_initialized then
		return
	end

	ui_battle.v.force_cqi = general:military_force():command_queue_index()

	ui_battle.v.panel = UIComponent(context.component)

	local is_siege_battle = cm:model():pending_battle():seige_battle()
	local button_parent_id = is_siege_battle and ui_battle.button_flyout.parent_siege
		or ui_battle.button_flyout.parent_land

	ui_battle.v.button_flyout = ui_battle.v.panel:SequentialFind(button_parent_id, ui_battle.button_flyout.id)
	
	ui_battle.v.flyout = ui_battle.v.panel:SequentialFind(ui_battle.flyout)
	ui_battle.v.follower_template = ui_battle.v.panel:SequentialFind(ui_battle.followers.template)

	ui_battle.v.selected_follower_panel = ui_battle.v.panel:SequentialFind(ui_battle.selected_follower.panel)
	ui_battle.v.selected_follower_name = ui_battle.v.selected_follower_panel:SequentialFind(ui_battle.selected_follower.name)
	ui_battle.v.selected_follower_bundle = ui_battle.v.selected_follower_panel:SequentialFind(ui_battle.selected_follower.effect_bundle)
	ui_battle.v.selected_follower_holder = ui_battle.v.selected_follower_panel:SequentialFind(ui_battle.selected_follower.follower_holder)

	ui_battle.initialise_button_flyout()
	ui_battle.populate_followers_list()

	ui_battle.add_listeners()
end

function ui_battle.on_panel_closed(context)
	ui_battle.v = {}

	for _, listener in ipairs(ui_battle.listeners) do
		core:remove_listener(listener.name)
	end
end

function ui_battle.add_listeners()
	for _, listener in ipairs(ui_battle.listeners) do
		core:add_listener(
			listener.name,
			listener.event,
			listener.condition,
			listener.callback,
			listener.is_persistent
		)
	end
end

function ui_battle.initialise_button_flyout()
	ui_battle.v.button_flyout:SetVisible(true)

	local num_active_followers = #exotic_strategist.get_army_active_followers(ui_battle.v.force_cqi)
	if num_active_followers <= 0 then
		ui_battle.v.button_flyout:SetState(ui_battle.button_flyout.states.inactive)
	else
		ui_battle.v.button_flyout:SetState(ui_battle.button_flyout.states.active)
		core:trigger_event("TROY_REM_MEMNON_FOLLOWERS_BUTTON_IS_ACTIVE", ui_battle.v.force_cqi)
	end
end

function ui_battle.populate_followers_list(active_followers)
	local active_followers = exotic_strategist.get_army_active_followers(ui_battle.v.force_cqi)

	ui_battle.v.flyout:DestroyChildren()
	for _, follower_key in ipairs(active_followers) do
		-- create follower component
		local follower_component = ui_battle.v.flyout:CreateFromComponent(
			ui_battle.v.follower_template:Address(), 
			string.format("follower_%s", follower_key)
		)
		follower_component = UIComponent(follower_component)
		follower_component:SetVisible(true)

		-- set "follower_key" property to the portrait_card. The player will click on this
		local portrait = follower_component:SequentialFind(ui_panel.followers.portrait.id)
		portrait:SetProperty("follower_key", follower_key)

		ui_battle.initialise_follower(follower_key, portrait, false)
	end
end

function ui_battle.initialise_follower(follower_key, portrait, is_in_selected_panel)
	local follower = exotic_strategist.get_follower(follower_key)
	local faction = cm:get_faction(exotic_strategist.faction_key)

	-- set the correct follower icon
	local image_index = tonumber(portrait:GetProperty("image_index")) or 1
	portrait:SetImagePath(follower.ui_icon_path, image_index)

	-- set follower state (locked / available)
	local activation_cost = exotic_strategist.get_active_follower_action_cost(follower, ui_battle.v.force_cqi, true --[[should_apply_skills_mod--]])
	local is_locked = not follower.effect.can_be_used_in_current_battle()
		or not faction:can_afford_custom_resource_cost(activation_cost)

	if is_in_selected_panel then
		portrait:SetState(ui_battle.followers.portrait.states.selected)
	else
		portrait:SetState(is_locked and ui_battle.followers.portrait.states.locked
			or ui_battle.followers.portrait.states.available)
	end

	if is_in_selected_panel then
		local tooltip = common.get_localised_string(exotic_strategist.localisation_strings.tooltip_remove_selected_follower)
		portrait:SetTooltipText(tooltip, exotic_strategist.localisation_strings.tooltip_remove_selected_follower, true)
	else
		ui_battle.set_follower_tooltip(portrait, follower, is_in_selected_panel)
	end
end

function ui_battle.set_follower_tooltip(portrait, follower, selected)
	local faction = cm:get_faction(exotic_strategist.faction_key)

	portrait:InterfaceFunction("set_tooltip_path", ui_battle.followers.tooltip.path)
	local tooltip = portrait:SequentialFind(portrait:Id() .. "_tooltip")

	local follower_type = tooltip:SequentialFind(ui_battle.followers.tooltip.type.id)
	follower_type:SetState(ui_battle.followers.tooltip.type.states[follower.effect.type])

	local follower_name = tooltip:SequentialFind(ui_battle.followers.tooltip.name)
	local localised_name = common.get_localised_string(follower.ui_name)
	follower_name:SetText(localised_name, follower.ui_name)

	local follower_description = tooltip:SequentialFind(ui_battle.followers.tooltip.description)
	local localised_description = common.get_localised_string(follower.ui_description)
	follower_description:SetText(localised_description, follower.ui_description)

	local effect_bundle = tooltip:SequentialFind(ui_battle.followers.tooltip.effect_bundle)
	effect_bundle:InterfaceFunction("set_effect_bundle_record", follower.effect.effect_bundle_key)

	-- recruit cost
	local recruit_cost = tooltip:SequentialFind(ui_battle.followers.tooltip.cost)
	recruit_cost:SetVisible(false)

	-- activation cost
	local activation_cost = exotic_strategist.get_active_follower_action_cost(follower, ui_battle.v.force_cqi, true --[[should_apply_skills_mod--]])
	local cost_holder = tooltip:SequentialFind(ui_battle.followers.tooltip.activation_cost.id)
	cost_holder:SetVisible(true)
	local cost_value = cost_holder:SequentialFind(ui_battle.followers.tooltip.activation_cost.value)
	activation_cost:multiply_by(-1)
	cost_value:SetText(activation_cost:to_string(faction), "troy_rem_memnon_exotic_strategist.lua")

	-- unlocked by technology component
	local unlock = tooltip:SequentialFind(ui_battle.followers.tooltip.unlock)
	unlock:SetVisible(false)

	local can_be_used, info_state = follower.effect.can_be_used_in_current_battle()
	local can_afford = faction:can_afford_custom_resource_cost(activation_cost)
	local is_locked = not can_be_used or not can_afford

	if is_locked then
		local not_available = tooltip:SequentialFind(ui_battle.followers.tooltip.not_available.id)
		not_available:SetVisible(true)

		local not_available_info = not_available:SequentialFind(ui_battle.followers.tooltip.not_available.info.id)
		not_available_info:SetVisible(not can_be_used)
		if info_state then
			not_available_info:SetState(info_state)
		end

		local no_resources = not_available:SequentialFind(ui_battle.followers.tooltip.not_available.no_resources)
		no_resources:SetVisible(not can_afford)
	else
		local available = portrait:SequentialFind(ui_battle.followers.tooltip.available.id)
		available:SetVisible(true)

		local available_txt = portrait:SequentialFind(ui_battle.followers.tooltip.available.available)
		available_txt:SetVisible(true)

		local selected_txt = portrait:SequentialFind(ui_battle.followers.tooltip.available.selected)
		selected_txt:SetVisible(false)
	end

	-- hide follower status in prebattle screen
	local status = tooltip:SequentialFind(ui_battle.followers.tooltip.status_component)
	status:SetVisible(false)
end

function ui_battle.on_follower_selected(follower_key, portrait)
	if portrait == ui_battle.v.selected_follower_portrait then
		return
	end

	ui_battle.setup_selected_follower_tooltip(portrait)

	if portrait then
		portrait:SetState(ui_battle.followers.portrait.states.selected)
	end

	if ui_battle.v.selected_follower_portrait then
		ui_battle.v.selected_follower_portrait:SetState(ui_battle.followers.portrait.states.available)
	end
	ui_battle.v.selected_follower_portrait = portrait

	ui_battle.v.selected_follower_key = follower_key

	if not follower_key then
		ui_battle.v.selected_follower_panel:SetVisible(false)
		return
	end

	ui_battle.v.selected_follower_panel:SetVisible(true)

	local follower = exotic_strategist.get_follower(follower_key)

	local localised_name = common.get_localised_string(follower.ui_name)
	ui_battle.v.selected_follower_name:SetText(localised_name, follower.ui_name)

	local localised_description = common.get_localised_string(follower.ui_description)
	ui_battle.v.selected_follower_bundle:InterfaceFunction("set_effect_bundle_record", follower.effect.effect_bundle_key)

	ui_battle.v.selected_follower_holder:DestroyChildren()
	local follower_component = ui_battle.v.selected_follower_holder:CreateFromComponent(
		ui_battle.v.follower_template:Address(), 
		string.format("selected_follower_%s", follower_key)
	)
	follower_component = UIComponent(follower_component)
	follower_component:SetVisible(true)
	local portrait = follower_component:SequentialFind(ui_panel.followers.portrait.id)
	portrait:SetProperty("selected_follower", follower_key)
	ui_battle.initialise_follower(follower_key, portrait, true)
	portrait:SetState(ui_battle.followers.portrait.states.selected)
end

function ui_battle.close_flyout()
	if ui_battle.v.panel then
		ui_battle.v.flyout:SetVisible(false)
	end
	ui_battle.initialise_button_flyout()
end

function ui_battle.setup_selected_follower_tooltip(portrait)
	if portrait then
		local available = portrait:SequentialFind(ui_battle.followers.tooltip.available.id)
		available:SetVisible(true)

		local available_txt = portrait:SequentialFind(ui_battle.followers.tooltip.available.available)
		available_txt:SetVisible(false)

		local selected_txt = portrait:SequentialFind(ui_battle.followers.tooltip.available.selected)
		selected_txt:SetVisible(true)
	end

	if ui_battle.v.selected_follower_portrait then
		local previous_available = ui_battle.v.selected_follower_portrait:SequentialFind(ui_battle.followers.tooltip.available.id)
		previous_available:SetVisible(true)

		local previous_available_txt = previous_available:SequentialFind(ui_battle.followers.tooltip.available.available)
		previous_available_txt:SetVisible(true)

		local previous_selected_txt = previous_available:SequentialFind(ui_battle.followers.tooltip.available.selected)
		previous_selected_txt:SetVisible(false)
	end
end

---------------------------------------------------------------
----------------------- SAVING / LOADING ----------------------
---------------------------------------------------------------

cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("EXOTIC_STRATEGIST_ARMY_FOLLOWERS", exotic_strategist.army_followers, context)
		cm:save_named_value("EXOTIC_STRATEGIST_FAVOUR_TO_GOD_ARMIES", exotic_strategist.favour_to_god_armies, context)
	end
)

cm:add_loading_game_callback(
	function(context)
		exotic_strategist.army_followers = cm:load_named_value("EXOTIC_STRATEGIST_ARMY_FOLLOWERS", exotic_strategist.army_followers, context)
		exotic_strategist.favour_to_god_armies = cm:load_named_value("EXOTIC_STRATEGIST_FAVOUR_TO_GOD_ARMIES", exotic_strategist.favour_to_god_armies, context)
	end
)
