out("Loading troy_king_of_men.lua")

---------------------------- DESIGN
local king_of_men_bundles = {

	--Lawagetas
	[1] = {

		-- no posts
		[1] = {
			bundle = "effect_bundle_fm_king_of_men_lawagetas_0",
			effects = {
				-- TODO: Add more
			}			
		},

		-- 1 post
		[2] = {
			bundle = "effect_bundle_fm_king_of_men_lawagetas_1",
			effects = {
				[1] = {
					effect_key = "troy_effect_faction_diplomacy_achaeans",
					scope_key = "faction_to_faction_own",
					value = 10
				},
				[2] = {
					effect_key = "troy_effect_building_recruitment_rank_all",
					scope_key = "faction_to_province_own_factionwide",
					value = 2
				}				
				-- TODO: Add more
			}			
		},
	},

	--Telestas
	[2] = {

		-- no posts
		[1] = {
			bundle = "effect_bundle_fm_king_of_men_telestas_0",
			effects = {
				-- TODO: Add more
			}			
		},

		-- 1 post
		[2] = {
			bundle = "effect_bundle_fm_king_of_men_telestas_1",
			effects = {
				[1] = {
					effect_key = "troy_effect_building_cost_mod_temple_buildings",
					scope_key = "faction_to_region_own",
					value = -10
				},
				[2] = {
					effect_key = "troy_effect_agent_priestess_cost_of_actions",
					scope_key = "faction_to_character_own_unseen",
					value = -5
				},	
				-- TODO: Add more
			}			
		},

		-- 2 posts
		[3] = {
			bundle = "effect_bundle_fm_king_of_men_telestas_2",
			effects = {
				[1] = {
					effect_key = "troy_effect_building_cost_mod_temple_buildings",
					scope_key = "faction_to_region_own",
					value = -20
				},
				[2] = {
					effect_key = "troy_effect_agent_priestess_cost_of_actions",
					scope_key = "faction_to_character_own_unseen",
					value = -10
				},	
				-- TODO: Add more
			}			
		},


		-- 3 posts
		[4] = {
			bundle = "effect_bundle_fm_king_of_men_telestas_3",
			effects = {
				[1] = {
					effect_key = "troy_effect_building_cost_mod_temple_buildings",
					scope_key = "faction_to_region_own",
					value = -30
				},
				[2] = {
					effect_key = "troy_effect_agent_priestess_cost_of_actions",
					scope_key = "faction_to_character_own_unseen",
					value = -15
				},	
				-- TODO: Add more
			}			
		},
	},

	--Heqetas
	[3] = {

		-- no posts
		[1] = {
			bundle = "effect_bundle_fm_king_of_men_heqetas_0",
			effects = {
				-- TODO: Add more
			}			
		},

		-- 1 post
		[2] = {
			bundle = "effect_bundle_fm_king_of_men_heqetas_1",
			effects = {
				[1] = {
					effect_key = "troy_effect_faction_diplomacy_achaeans",
					scope_key = "faction_to_faction_own",
					value = 3
				},
				[2] = {
					effect_key = "troy_effect_army_recruitment_cost_mod_all_army_units",
					scope_key = "faction_to_province_own",
					value = -5
				},
				-- TODO: Add more
			}			
		},

		-- 2 posts
		[3] = {
			bundle = "effect_bundle_fm_king_of_men_heqetas_2",
			effects = {
				[1] = {
					effect_key = "troy_effect_faction_diplomacy_achaeans",
					scope_key = "faction_to_faction_own",
					value = 5
				},
				[2] = {
					effect_key = "troy_effect_army_recruitment_cost_mod_all_army_units",
					scope_key = "faction_to_province_own",
					value = -10
				},
				-- TODO: Add more
			}			
		},


		-- 3 posts
		[4] = {
			bundle = "effect_bundle_fm_king_of_men_heqetas_3",
			effects = {
				[1] = {
					effect_key = "troy_effect_faction_diplomacy_achaeans",
					scope_key = "faction_to_faction_own",
					value = 8
				},
				[2] = {
					effect_key = "troy_effect_army_recruitment_cost_mod_all_army_units",
					scope_key = "faction_to_province_own",
					value = -15
				},
				-- TODO: Add more
			}			
		},

		-- 4 posts
		[5] = {
			bundle = "effect_bundle_fm_king_of_men_heqetas_4",
			effects = {
				[1] = {
					effect_key = "troy_effect_faction_diplomacy_achaeans",
					scope_key = "faction_to_faction_own",
					value = 10
				},
				[2] = {
					effect_key = "troy_effect_army_recruitment_cost_mod_all_army_units",
					scope_key = "faction_to_province_own",
					value = -20
				},
				-- TODO: Add more
			}			
		},


		-- 5 posts
		[6] = {
			bundle = "effect_bundle_fm_king_of_men_heqetas_5",
			effects = {
				[1] = {
					effect_key = "troy_effect_faction_diplomacy_achaeans",
					scope_key = "faction_to_faction_own",
					value = 15
				},
				[2] = {
					effect_key = "troy_effect_army_recruitment_cost_mod_all_army_units",
					scope_key = "faction_to_province_own",
					value = -25
				},
				-- TODO: Add more
			}			
		},
	},
}


---------------------------- CODE IMPLEMENTATION ---------------------------- 
local function output_debug_string(string)
	--out(string)
end

local king_of_men_panel = "offices"
local king_of_men_offices_panel = "offices_panel"
local agamemnon_faction = "troy_main_dan_mycenae"


-- create lower tier bundle from table definition
local function king_of_men_create_lower_tier_bundle(bundle)
	local effect_bundle = cm:create_new_custom_effect_bundle(bundle.bundle)

	for _, effect in ipairs(bundle.effects) do
		effect_bundle:add_effect(effect.effect_key, effect.scope_key, effect.value)
	end

	return effect_bundle
end

local function character_in_office(char)
	return char:ministerial_position() ~= "" or char:is_faction_leader() or char:has_assigned_office_this_round()
end

function agamemnon_faction_active(faction_name)
	return faction_name == agamemnon_faction
end

function king_of_men_free_office_slots()
	local faction = cm:get_faction(agamemnon_faction)
	local open_tier_1_slots = cm:politics_get_ministerial_posts(agamemnon_faction, 1, false)
	local open_tier_2_slots = cm:politics_get_ministerial_posts(agamemnon_faction, 2, false)
	local open_tier_3_slots = cm:politics_get_ministerial_posts(agamemnon_faction, 3, false)
	local minimum_level = -1

	-- These hardcoded numbers have to be updated in case the mechanic's ranks are changed in the database. Currently hardcoded
	-- because it will take awhile to implement functions to get these numbers from the database.
	if open_tier_3_slots > 0 then
		minimum_level = 3
	elseif open_tier_2_slots > 0 then
		minimum_level = 5
	elseif open_tier_1_slots > 0 then
		minimum_level = 8
	end

	local characters = faction:character_list()
	local characters_num = characters:num_items()

	for i = 0, characters_num - 1 do
		local char = characters:item_at(i)
		if cm:char_is_general(char) then
			if char:rank() >= minimum_level and not character_in_office(char) then
				return true
			end
		end
	end

	return false
end

--
local function king_of_men_ui_refresh()
	local panel = find_uicomponent(core:get_ui_root(), king_of_men_panel)
	local offices_panel = panel and find_uicomponent(panel, king_of_men_offices_panel)
	if offices_panel then
		output_debug_string("king_of_men_ui_refresh - visible offices_panel")
		offices_panel:InterfaceFunction("refresh")
	end
end


-- initial bundles creation
local function king_of_men_ui_init_bundles(context)
	local panel = core:get_ui_root() and core:get_ui_root():SequentialFind(king_of_men_panel)
	if panel and panel:Visible() then
		output_debug_string("king_of_men_ui_init_bundles - visible panel")
		local offices_panel = panel:SequentialFind(king_of_men_offices_panel)

		--
		if offices_panel then 
			for i, top_tier_bundle in ipairs(king_of_men_bundles) do
				output_debug_string("processing top tier bundle: " .. i)

				-- not created
				--if find_uicomponent(panel, "office_text_parent_tier_" .. i) == nil then
					for j, lower_tier_bundle in ipairs(top_tier_bundle) do
						output_debug_string("processing lower tier bundle: " .. j .. ": " .. lower_tier_bundle.bundle)
						offices_panel:InterfaceFunction("create_bundle", i - 1, j - 1, king_of_men_create_lower_tier_bundle(lower_tier_bundle))
					end
				--end
			end

			king_of_men_ui_refresh()
		end
	end
end


local function king_of_men_update_bundles(context)
	local faction = context:faction()
	local faction_name = faction:name()

	if not cm:politics_enabled(faction_name) then return end

	output_debug_string("king_of_men_update_bundles: " .. faction_name)

	--
	for i, top_tier_bundle in ipairs(king_of_men_bundles) do
		local posts = cm:politics_get_ministerial_posts(faction_name, i, true)

		for j, lower_tier_bundle in ipairs(top_tier_bundle) do

			if faction:has_effect_bundle(lower_tier_bundle.bundle) then
				-- remove
				if posts ~= j - 1 then
					cm:remove_effect_bundle(king_of_men_bundles[i][j].bundle, faction_name)
				end
			else
				-- create
				if posts == j - 1 then
					local effect_bundle = king_of_men_create_lower_tier_bundle(lower_tier_bundle)
					cm:apply_custom_effect_bundle_to_faction(effect_bundle, faction)
				end
			end
		end
	end

	--
	king_of_men_ui_refresh()
end


function king_of_men_add_listeners()
	out("king_of_men_add_listeners")

	core:add_listener(
		"king_of_men_turn_start",
		"FactionTurnStart",
		function(context) 
			return cm:model():turn_number() == 1
		end,

		king_of_men_update_bundles,
		true)

	core:add_listener(
		"king_of_men_faction_ministerial_posts_changed", 
		"FactionMinisterialPostsChanged", 
		true, 
		king_of_men_update_bundles, 
		true)

	core:add_listener(
		"king_of_men_faction_character_died",
		"FactionCharacterDiedOrWounded",
		function(context)
			return context:faction():name() == agamemnon_faction and not context:family_member():is_alive()
		end,
		king_of_men_update_bundles,
		true
	)

	core:add_listener(
		"king_of_men_panel_opened_campaign", 
		"PanelOpenedCampaign", 
		function(context) return context.string == king_of_men_panel end,
		king_of_men_ui_init_bundles,
		true
	)
	core:add_listener(
		"king_of_men_loyalty_for_position", 
		"CharacterMinisterialPositionChanged", 
		function(context) 
			return context:character():faction():name() == "troy_main_dan_mycenae"
		end,
		function(context)
			local char = context:character()
			local old_position = context:old_post()
			local new_position = context:new_post()
			if ministerial_positions_loyalty[old_position] then 
				cm:apply_character_loyalty_change(context:character():command_queue_index(), -ministerial_positions_loyalty[old_position])
			end
			if ministerial_positions_loyalty[new_position] then 
				cm:apply_character_loyalty_change(context:character():command_queue_index(), ministerial_positions_loyalty[new_position])
			end
		end,
		true
	)
end

ministerial_positions_loyalty = {
	["troy_main_minister_mycenae_heqetas_1"] = 1,
	["troy_main_minister_mycenae_heqetas_2"] = 1,
	["troy_main_minister_mycenae_heqetas_3"] = 1,
	["troy_main_minister_mycenae_heqetas_4"] = 1,
	["troy_main_minister_mycenae_heqetas_5"] = 1,
	["troy_main_minister_mycenae_telestas_1"] = 2,
	["troy_main_minister_mycenae_telestas_2"] = 2,
	["troy_main_minister_mycenae_telestas_3"] = 2,
	["troy_main_minister_mycenae_lawagetas"] = 3
}

