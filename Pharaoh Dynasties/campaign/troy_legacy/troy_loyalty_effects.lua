-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
--
--	EFFECTS FROM LOYALTY
--	This script implements effects, based on a character's loyalty.
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------
out("Loading troy_loyalty_effects.lua")

local loyalty_level_to_effects = {
	[10] = {
		bundle = "effect_bundle_loyalty_positive",
		effects = {
			[1] = {
				effect_key = "troy_effect_hero_self_morale",
				scope_key = "character_to_force_own_unseen",
				value = 20
			},
			[2] = {
				effect_key = "troy_effect_hero_rage_mod",
				scope_key = "character_to_character_own",
				value = 50
			},
			[3] = {
				effect_key = "troy_effect_army_campaign_movement_range",
				scope_key = "general_to_force_own",
				value = 10
			},
			[4] = {
				effect_key = "troy_effect_hero_campaign_influence",
				scope_key = "character_to_province_own_unseen",
				value = 5
			},
			[5] = {
				effect_key = "troy_effect_hero_campaign_happiness",
				scope_key = "character_to_province_own",
				value = 3
			}
		}
	},
	[9] = {
		bundle = "effect_bundle_loyalty_positive",
		effects = {
			[1] = {
				effect_key = "troy_effect_hero_self_morale",
				scope_key = "character_to_force_own_unseen",
				value = 18
			},
			[2] = {
				effect_key = "troy_effect_hero_rage_mod",
				scope_key = "character_to_character_own",
				value = 30
			},
			[3] = {
				effect_key = "troy_effect_army_campaign_movement_range",
				scope_key = "general_to_force_own",
				value = 5
			},
			[4] = {
				effect_key = "troy_effect_hero_campaign_influence",
				scope_key = "character_to_province_own_unseen",
				value = 4
			},
			[5] = {
				effect_key = "troy_effect_hero_campaign_happiness",
				scope_key = "character_to_province_own",
				value = 2
			}
		}
	},
	[8] = {
		bundle = "effect_bundle_loyalty_positive",
		effects = {
			[1] = {
				effect_key = "troy_effect_hero_self_morale",
				scope_key = "character_to_force_own_unseen",
				value = 15
			},
			[2] = {
				effect_key = "troy_effect_hero_rage_mod",
				scope_key = "character_to_character_own",
				value = 20
			},
			[3] = {
				effect_key = "troy_effect_army_campaign_movement_range",
				scope_key = "general_to_force_own",
				value = 5
			},
			[4] = {
				effect_key = "troy_effect_hero_campaign_influence",
				scope_key = "character_to_province_own_unseen",
				value = 4
			},
			[5] = {
				effect_key = "troy_effect_hero_campaign_happiness",
				scope_key = "character_to_province_own",
				value = 2
			}
		}
	},
	[7] = {
		bundle = "effect_bundle_loyalty_positive",
		effects = {
			[1] = {
				effect_key = "troy_effect_hero_self_morale",
				scope_key = "character_to_force_own_unseen",
				value = 15
			},
			[2] = {
				effect_key = "troy_effect_hero_rage_mod",
				scope_key = "character_to_character_own",
				value = 20
			},
			[3] = {
				effect_key = "troy_effect_hero_campaign_influence",
				scope_key = "character_to_province_own_unseen",
				value = 3
			},
			[4] = {
				effect_key = "troy_effect_hero_campaign_happiness",
				scope_key = "character_to_province_own",
				value = 2
			}
		}
	},
	[6] = {
		bundle = "effect_bundle_loyalty_positive",
		effects = {
			[1] = {
				effect_key = "troy_effect_hero_self_morale",
				scope_key = "character_to_force_own_unseen",
				value = 12
			},
			[2] = {
				effect_key = "troy_effect_hero_rage_mod",
				scope_key = "character_to_character_own",
				value = 10
			},
			[3] = {
				effect_key = "troy_effect_hero_campaign_influence",
				scope_key = "character_to_province_own_unseen",
				value = 3
			},
			[4] = {
				effect_key = "troy_effect_hero_campaign_happiness",
				scope_key = "character_to_province_own",
				value = 1
			}
		}
	},
	[5] = {
		bundle = "effect_bundle_loyalty_positive",
		effects = {
			[1] = {
				effect_key = "troy_effect_hero_self_morale",
				scope_key = "character_to_force_own_unseen",
				value = 12
			},
			[2] = {
				effect_key = "troy_effect_hero_rage_mod",
				scope_key = "character_to_character_own",
				value = 5
			},
			[3] = {
				effect_key = "troy_effect_hero_campaign_influence",
				scope_key = "character_to_province_own_unseen",
				value = 2
			},
			[4] = {
				effect_key = "troy_effect_hero_campaign_happiness",
				scope_key = "character_to_province_own",
				value = 1
			}
		}
	},
	[4] = {
		bundle = "effect_bundle_loyalty_positive",
		effects = {
			[1] = {
				effect_key = "troy_effect_hero_self_morale",
				scope_key = "character_to_force_own_unseen",
				value = 10
			},
			[2] = {
				effect_key = "troy_effect_hero_rage_mod",
				scope_key = "character_to_character_own",
				value = 5
			},
			[3] = {
				effect_key = "troy_effect_hero_campaign_influence",
				scope_key = "character_to_province_own_unseen",
				value = 2
			}
		}
	},
	[3] = {
		bundle = "effect_bundle_loyalty_positive",
		effects = {
			[1] = {
				effect_key = "troy_effect_hero_self_morale",
				scope_key = "character_to_force_own_unseen",
				value = 10
			},
			[2] = {
				effect_key = "troy_effect_hero_campaign_influence",
				scope_key = "character_to_province_own_unseen",
				value = 1
			}
		}
	},
	[2] = {
		bundle = "effect_bundle_loyalty_positive",
		effects = {
			[1] = {
				effect_key = "troy_effect_hero_self_morale",
				scope_key = "character_to_force_own_unseen",
				value = 5
			}
		}
	},
	[1] = {
		bundle = "effect_bundle_loyalty_positive",
		effects = {
			[1] = {
				effect_key = "troy_effect_hero_self_morale",
				scope_key = "character_to_force_own_unseen",
				value = 5
			}
		}
	},
	[0] = {
		bundle = "effect_bundle_loyalty_neutral",
		effects = {
				--Nothing but raw, unfiltered mediocrity.
				}
	},
	[-1] = {
		bundle = "effect_bundle_loyalty_negative",
		effects = {
			[1] = {
				effect_key = "troy_effect_hero_self_morale",
				scope_key = "character_to_force_own_unseen",
				value = -5
			},
			[2] = {
				effect_key = "troy_effect_hero_rage_mod",
				scope_key = "character_to_character_own",
				value = -5
			},
			[3] = {
				effect_key = "troy_effect_hero_campaign_happiness",
				scope_key = "character_to_province_own",
				value = -1
			}
		}
	},
	[-2] = {
		bundle = "effect_bundle_loyalty_negative",
		effects = {
			[1] = {
				effect_key = "troy_effect_hero_self_morale",
				scope_key = "character_to_force_own_unseen",
				value = -5
			},
			[2] = {
				effect_key = "troy_effect_hero_rage_mod",
				scope_key = "character_to_character_own",
				value = -10
			},
			[3] = {
				effect_key = "troy_effect_hero_campaign_happiness",
				scope_key = "character_to_province_own",
				value = -2
			}
		}
	},
	[-3] = {
		bundle = "effect_bundle_loyalty_negative",
		effects = {
			[1] = {
				effect_key = "troy_effect_hero_self_morale",
				scope_key = "character_to_force_own_unseen",
				value = -5
			},
			[2] = {
				effect_key = "troy_effect_hero_rage_mod",
				scope_key = "character_to_character_own",
				value = -15
			},
			[3] = {
				effect_key = "troy_effect_hero_campaign_influence",
				scope_key = "character_to_province_own_unseen",
				value = -3
			},
			[4] = {
				effect_key = "troy_effect_hero_campaign_happiness",
				scope_key = "character_to_province_own",
				value = -3
			}
		}
	},
	[-4] = {
		bundle = "effect_bundle_loyalty_negative",
		effects = {
			[1] = {
				effect_key = "troy_effect_hero_self_morale",
				scope_key = "character_to_force_own_unseen",
				value = -10
			},
			[2] = {
				effect_key = "troy_effect_hero_rage_mod",
				scope_key = "character_to_character_own",
				value = -20
			},
			[3] = {
				effect_key = "troy_effect_hero_campaign_influence",
				scope_key = "character_to_province_own_unseen",
				value = -2
			},
			[4] = {
				effect_key = "troy_effect_hero_campaign_happiness",
				scope_key = "character_to_province_own",
				value = -4
			}
		}
	},
	[-5] = {
		bundle = "effect_bundle_loyalty_negative",
		effects = {
			[1] = {
				effect_key = "troy_effect_hero_self_morale",
				scope_key = "character_to_force_own_unseen",
				value = -10
			},
			[2] = {
				effect_key = "troy_effect_hero_rage_mod",
				scope_key = "character_to_character_own",
				value = -25
			},
			[3] = {
				effect_key = "troy_effect_hero_campaign_influence",
				scope_key = "character_to_province_own_unseen",
				value = -3
			},
			[4] = {
				effect_key = "troy_effect_hero_campaign_happiness",
				scope_key = "character_to_province_own",
				value = -4
			}
		}
	},
	[-6] = {
		bundle = "effect_bundle_loyalty_negative",
		effects = {
			[1] = {
				effect_key = "troy_effect_hero_self_morale",
				scope_key = "character_to_force_own_unseen",
				value = -20
			},
			[2] = {
				effect_key = "troy_effect_hero_rage_mod",
				scope_key = "character_to_character_own",
				value = -30
			},
			[3] = {
				effect_key = "troy_effect_hero_campaign_influence",
				scope_key = "character_to_province_own_unseen",
				value = -5
			},
			[4] = {
				effect_key = "troy_effect_hero_campaign_happiness",
				scope_key = "character_to_province_own",
				value = -5
			}
		}
	},
	[-7] = {
		bundle = "effect_bundle_loyalty_negative",
		effects = {
			[1] = {
				effect_key = "troy_effect_hero_self_morale",
				scope_key = "character_to_force_own_unseen",
				value = -20
			},
			[2] = {
				effect_key = "troy_effect_hero_rage_mod",
				scope_key = "character_to_character_own",
				value = -40
			},
			[3] = {
				effect_key = "troy_effect_army_campaign_movement_range",
				scope_key = "general_to_force_own",
				value = -10
			},
			[4] = {
				effect_key = "troy_effect_hero_campaign_influence",
				scope_key = "character_to_province_own_unseen",
				value = -8
			},
			[5] = {
				effect_key = "troy_effect_hero_campaign_happiness",
				scope_key = "character_to_province_own",
				value = -5
			}
		}
	},
	[-8] = {
		bundle = "effect_bundle_loyalty_negative",
		effects = {
			[1] = {
				effect_key = "troy_effect_hero_self_morale",
				scope_key = "character_to_force_own_unseen",
				value = -25
			},
			[2] = {
				effect_key = "troy_effect_hero_rage_mod",
				scope_key = "character_to_character_own",
				value = -45
			},
			[3] = {
				effect_key = "troy_effect_army_campaign_movement_range",
				scope_key = "general_to_force_own",
				value = -15
			},
			[4] = {
				effect_key = "troy_effect_hero_campaign_influence",
				scope_key = "character_to_province_own_unseen",
				value = -10
			},
			[5] = {
				effect_key = "troy_effect_hero_campaign_happiness",
				scope_key = "character_to_province_own",
				value = -5
			}
		}
	},
	[-9] = {
		bundle = "effect_bundle_loyalty_negative",
		effects = {
			[1] = {
				effect_key = "troy_effect_hero_self_morale",
				scope_key = "character_to_force_own_unseen",
				value = -25
			},
			[2] = {
				effect_key = "troy_effect_hero_rage_mod",
				scope_key = "character_to_character_own",
				value = -50
			},
			[3] = {
				effect_key = "troy_effect_army_campaign_movement_range",
				scope_key = "general_to_force_own",
				value = -20
			},
			[4] = {
				effect_key = "troy_effect_hero_campaign_influence",
				scope_key = "character_to_province_own_unseen",
				value = -12
			},
			[5] = {
				effect_key = "troy_effect_hero_campaign_happiness",
				scope_key = "character_to_province_own",
				value = -7
			}
		}
	},
	[-10] = {
		bundle = "effect_bundle_loyalty_negative",
		effects = {
			[1] = {
				effect_key = "troy_effect_hero_self_morale",
				scope_key = "character_to_force_own_unseen",
				value = -30
			},
			[2] = {
				effect_key = "troy_effect_hero_rage_mod",
				scope_key = "character_to_character_own",
				value = -60
			},
			[3] = {
				effect_key = "troy_effect_army_campaign_movement_range",
				scope_key = "general_to_force_own",
				value = -30
			},
			[4] = {
				effect_key = "troy_effect_hero_campaign_influence",
				scope_key = "character_to_province_own_unseen",
				value = -15
			},
			[5] = {
				effect_key = "troy_effect_hero_campaign_happiness",
				scope_key = "character_to_province_own",
				value = -8
			}
		}
	}
} 

effect_bundles_for_removal = {
	"effect_bundle_loyalty_negative",
	"effect_bundle_loyalty_neutral",
	"effect_bundle_loyalty_positive"
}

function apply_loyalty_effects(context)
	local character 
	if is_character(context) then
		character = context
	else
		character = context:character()
	end

	if not is_character(character) then
		script_error("SCRIPT ERROR: apply_loyalty_effects called, but extracting a character for supplied context failed!")
		return
	end

	if character:is_null_interface() then
		script_error("SCRIPT ERROR: apply_loyalty_effects called, but was supplied with null interface character")
		return
	end

	if not character:character_type("general") then
		return
	end
	
	local character_loyalty = character:loyalty()
	local loyalty_level_effects = loyalty_level_to_effects[character_loyalty]
	local bundle_data = loyalty_level_to_effects[character_loyalty].bundle
	local loyalty_bundle = cm:create_new_custom_effect_bundle(bundle_data)
	for _,info in pairs(loyalty_level_effects.effects) do
		loyalty_bundle:add_effect(info.effect_key,info.scope_key,info.value)
	end
	loyalty_apply_bundle(loyalty_bundle,character)
end

function loyalty_apply_bundle(loyalty_bundle,character)
	for i=1,#effect_bundles_for_removal do 
		cm:remove_effect_bundle_from_character(effect_bundles_for_removal[i],character:command_queue_index())
	end

	if character:is_loyalty_applicable() then
		cm:apply_custom_effect_bundle_to_character(loyalty_bundle,character)
	end
end

function start_pos_loyalty_effects()
	local faction_list = cm:model():world():faction_list()
	for i = 0, faction_list:num_items() - 1 do
		local character_list = faction_list:item_at(i):character_list()
		for i = 0, character_list:num_items() - 1 do
			if character_list:item_at(i):is_faction_leader() == true then
				return
			else
				apply_loyalty_effects(character_list:item_at(i))
			end
		end
	end
end

function add_loyalty_effect_listeners()
	out("add_loyalty_effect_listeners")
	
	core:add_listener(
		"LoyaltyEffectsOnLoyaltyChange", 
		"CharacterLoyaltyChanged",
		function(context)
			return not context:character():is_faction_leader()
		end,
		apply_loyalty_effects,
		true
	)

	core:add_listener(
		"LoyaltyEffectsOnCharacterCreated", 
		"CharacterCreated",
		function(context)
			return not context:character():is_faction_leader()
		end,
		apply_loyalty_effects,
		true
	)

	core:add_listener(
		"LoyaltyEffectsOnConfederation",
		"FactionJoinsConfederation",
		true,
		apply_loyalty_effects_post_confederation,
		true
	)

	core:add_listener(
		"SetLoyaltyCustomBundleToComponent", 
		"GetLoyaltyCustomBundle",
		true,
		function(context)
			local component = UIComponent(context.component)

			local create_loyalty_bundle = function(loyalty_amount)
				local loyalty_level_effects = loyalty_level_to_effects[loyalty_amount]
				local bundle_effects_data = {}
				for _,info in pairs(loyalty_level_effects.effects) do
					table.insert(bundle_effects_data, { effect_key = info.effect_key, scope_key = info.scope_key, effect_value = info.value })
				end

				return bundle_effects_data
			end

			local character = context:character()
			local character_loyalty = character:loyalty()
			local loyalty_bundles = {}

			table.insert(loyalty_bundles, {
				loyalty = character_loyalty,
				bundle_effects = create_loyalty_bundle(character_loyalty)
			})

			-- if character_loyalty + 1 <= 10 then
			-- 	table.insert(loyalty_bundles, {
			-- 		loyalty = character_loyalty + 1,
			-- 		bundle_effects = create_loyalty_bundle(character_loyalty + 1)
			-- 	})
			-- end
			-- if (character_loyalty - 1 >= -10) then
			-- 	table.insert(loyalty_bundles, {
			-- 		loyalty = character_loyalty - 1,
			-- 		bundle_effects = create_loyalty_bundle(character_loyalty - 1)
			-- 	})
			-- end

			component:InterfaceFunction("set_loyalty_bundles", loyalty_bundles)
		end,
		true
	)
end

function apply_loyalty_effects_post_confederation(context)
	local character_list = context:confederation():character_list()
	for i = 0, character_list:num_items() - 1 do
		if not character_list:item_at(i):is_null_interface() then
			apply_loyalty_effects(character_list:item_at(i))
		end
	end
end