out("Loading phar_ancient_legacy_sargon.lua")

local sargon_config = {
	-- Ambitions
	ambition_pool_to_draw_ambitions_from = "recurrent",
	grand_ambition_pool_to_draw_ambitions_from = "sargon_grand_ambitions",

	max_amount_of_ambitions = 2,

	ambition_draw_cooldown = 3,
	ambition_draw_resource_cost = {
		["troy_gold"] = -100,
	},
	ambition_draw_resource_factor = "troy_resource_factor_missions",

	-- Extending ambitions is unlocked once you have tier two of the total domains unlocked.
	-- What this does is when the player presses the "extend ambition" button
	-- in the UI the ambition expiration will be pushed back by the specified amount of turns
	ambition_extend_additional_duration = 3,
	ambition_extend_cooldown = 5,
	ambition_extend_duration_required_tier = 2,

	----------------------
	------- Scribes ------
	----------------------

	max_scribes = 1,
	scribe_default_duration = 5,
	scribe_default_weight = 100,
	num_scribes_to_generate = 3,
	scribe_generate_cost_factor = "troy_resource_factor_missions",
	scribe_generate_cost = {
		["troy_gold"] = -50,
	},
	scribe_choose_cost_factor = "troy_resource_factor_missions",
	scribe_choose_cost = {
		["troy_gold"] = -100,
	},
	-- Changes after this amount will cost the above amount
	free_scribe_changes = 1,

	scribe_hires_per_turn = 1,

	default_num_scribe_forced_domain_missions_during_generation = 1,

	scribe_types = {
		--[[
		{
			-- This is just a name, can be anything. Changing can break save files
			type = "scribe_type1",

			-- Optional, this overrides the default scribe duration set above
			duration_override = 2,

			-- Optional, "default" by default
			-- "default" means that it will generate at least X ambitions from the specified domains, if able.
				-- E.g. if we have Warrior and Overseer domains for this scribe then it will generate at least X Warrior or X Overseer missions
			-- "combined" means that it will generate at least X ambition that has all the specified domains, if able.
				-- E.g. if we have Warrior and Overseer domains for this scribe then it will generate at least X ambitions that are both Warrior and Overseer
			generation_type = "default",

			-- Optional, 1 by default.
			-- When generating ambitions will force at least this many ambitions to be from the required domain or domains
			num_forced_domain_missions_during_generation = 1,

			-- Optional, scribe domains. Empty by default
			-- When generating ambition will try to generate at least X ambitions with these domains
			domains = {
				"conqueror",
				"strategist",
			},

			-- Optional. Default is setup above in the config
			-- Scribe weight. Lower means more rare, higher means more common.
			-- A scribe with 50 weight is half as likely to show up as a scribe with 100 weight.
			weight = 100,

			-- Required
			-- NOTE to get a text replacement string:
				-- right click on a localized string in DaVE -> Copy -> Copy text replacement string
			ui = {
				icon = "ui/skins/default/map_legacy_sargon/map_portrait_scribe_type.png",
				name = "{{tr:campaign_localised_strings_string_map_ancient_legacy_sargon_scribe_name_strategist}}",
				effects = {
					"{{tr:campaign_localised_strings_string_map_ancient_legacy_sargon_scribe_effect_strategist}}",
					"effect2_text_replacement_string",
				},
			},
		},
		--]]

		{
			type = "scribe_conqueror",
			domains = {
				"conqueror",
			},
			ui = {
				icon = "ui/skins/default/map_legacy_sargon/scribes_art/phar_map_mes_sargon_conqueror_scribe.png",
				name = "{{tr:campaign_localised_strings_string_map_ancient_legacy_sargon_scribe_name_conqueror}}",
				effects = {
					"{{tr:campaign_localised_strings_string_map_ancient_legacy_sargon_scribe_effect_conqueror}}",
				},
			},
		},

		{
			type = "scribe_strategist",
			domains = {
				"strategist",
			},
			ui = {
				icon = "ui/skins/default/map_legacy_sargon/scribes_art/phar_map_mes_sargon_strategist_scribe.png",
				name = "{{tr:campaign_localised_strings_string_map_ancient_legacy_sargon_scribe_name_strategist}}",
				effects = {
					"{{tr:campaign_localised_strings_string_map_ancient_legacy_sargon_scribe_effect_strategist}}",
				},
			},
		},

		-- {
		-- 	type = "scribe_diplomat",
		-- 	domains = {
		-- 		"diplomat",
		-- 	},
		-- 	ui = {
		-- 		icon = "ui/skins/default/map_legacy_sargon/map_portrait_scribe_type.png",
		-- 		name = "{{tr:campaign_localised_strings_string_map_ancient_legacy_sargon_scribe_name_diplomat}}",
		-- 		effects = {
		-- 			"{{tr:campaign_localised_strings_string_map_ancient_legacy_sargon_scribe_effect_diplomat}}",
		-- 		},
		-- 	},
		-- },

		{
			type = "scribe_raider",
			domains = {
				"raider",
			},
			ui = {
				icon = "ui/skins/default/map_legacy_sargon/scribes_art/phar_map_mes_sargon_raider_scribe.png",
				name = "{{tr:campaign_localised_strings_string_map_ancient_legacy_sargon_scribe_name_raider}}",
				effects = {
					"{{tr:campaign_localised_strings_string_map_ancient_legacy_sargon_scribe_effect_raider}}",
				},
			},
		},

		{
			type = "scribe_overseer",
			domains = {
				"overseer",
			},
			ui = {
				icon = "ui/skins/default/map_legacy_sargon/scribes_art/phar_map_mes_sargon_overseer_scribe.png",
				name = "{{tr:campaign_localised_strings_string_map_ancient_legacy_sargon_scribe_name_overseer}}",
				effects = {
					"{{tr:campaign_localised_strings_string_map_ancient_legacy_sargon_scribe_effect_overseer}}",
				},
			},
		},

		{
			type = "scribe_builder",
			domains = {
				"builder",
			},
			ui = {
				icon = "ui/skins/default/map_legacy_sargon/scribes_art/phar_map_mes_sargon_builder_scribe.png",
				name = "{{tr:campaign_localised_strings_string_map_ancient_legacy_sargon_scribe_name_builder}}",
				effects = {
					"{{tr:campaign_localised_strings_string_map_ancient_legacy_sargon_scribe_effect_builder}}",
				},
			},
		},
		
		{
			type = "scribe_warlike",
			domains = {
				"warlike",
			},
			ui = {
				icon = "ui/skins/default/map_legacy_sargon/scribes_art/phar_map_mes_sargon_warlike_scribe.png",
				name = "{{tr:campaign_localised_strings_string_map_ancient_legacy_sargon_scribe_name_warlike}}",
				effects = {
					"{{tr:campaign_localised_strings_string_map_ancient_legacy_sargon_scribe_effect_warlike}}",
				},
			},
		},
	},

	----------------------
	------- Domains-------
	----------------------

	-- The maximum amount of domains that can be active at a time. Will use the domains with the most amount of points.
	max_active_domains = 3,

	-- Default domain tiers. Tier on the left and amount of domain points needed on the right
	domain_tiers = {
		[1] = 2,
		[2] = 5,
		[3] = 8,
	},

	-- Domain tiers for a specific domain
	domain_tiers_override = {
		--[[
		domain = {
			[1] = 322,
			[2] = 666,
			[3] = 1337,
		},
		--]]
	},

	domain_tier_effect_bundles = {
		builder = {
			[1] = "phar_map_effect_bundle_sargon_domain_ability_builder_t1",
			[2] = "phar_map_effect_bundle_sargon_domain_ability_builder_t2",
			[3] = "phar_map_effect_bundle_sargon_domain_ability_builder_t3",
		},
		conqueror = {
			[1] = "phar_map_effect_bundle_sargon_domain_ability_conqueror_t1",
			[2] = "phar_map_effect_bundle_sargon_domain_ability_conqueror_t2",
			[3] = "phar_map_effect_bundle_sargon_domain_ability_conqueror_t3",
		},
		-- diplomat = { -- Removed from ambitions for a lack of available content diversity
		-- 	[1] = "phar_map_effect_bundle_sargon_domain_ability_diplomat_t1",
		-- 	[2] = "phar_map_effect_bundle_sargon_domain_ability_diplomat_t2",
		-- 	[3] = "phar_map_effect_bundle_sargon_domain_ability_diplomat_t3",
		-- },
		raider = {
			[1] = "phar_map_effect_bundle_sargon_domain_ability_raider_t1",
			[2] = "phar_map_effect_bundle_sargon_domain_ability_raider_t2",
			[3] = "phar_map_effect_bundle_sargon_domain_ability_raider_t3",
		},
		overseer = {
			[1] = "phar_map_effect_bundle_sargon_domain_ability_overseer_t1",
			[2] = "phar_map_effect_bundle_sargon_domain_ability_overseer_t2",
			[3] = "phar_map_effect_bundle_sargon_domain_ability_overseer_t3",
		},
		strategist = {
			[1] = "phar_map_effect_bundle_sargon_domain_ability_strategist_t1",
			[2] = "phar_map_effect_bundle_sargon_domain_ability_strategist_t2",
			[3] = "phar_map_effect_bundle_sargon_domain_ability_strategist_t3",
		},
		warlike = {
			[1] = "phar_map_effect_bundle_sargon_domain_ability_warrior_t1",
			[2] = "phar_map_effect_bundle_sargon_domain_ability_warrior_t2",
			[3] = "phar_map_effect_bundle_sargon_domain_ability_warrior_t3",
		},
	},

	-- 0 means infinite
	domain_effect_bundle_default_duration = 0,

	domain_tier_effect_bundle_duration_override = {
		strategist = {
			[1] = 4,
			[2] = 4,
			[3] = 4,
		},
	},

	-- If this is true then the effect bundle will not be applied right away.
	-- E.g. we don't want the strategist bundle to be on by default, we want to apply it when a player recruits a new military force.
	domain_tier_effect_bundle_disabled_by_default = {
		strategist = {
			[1] = true,
			[2] = true,
			[3] = true,
		}
	},

	conqueror_tier_happiness_bundle_key = {
		[1] = nil,
		[2] = nil,
		[3] = "phar_map_effect_bundle_sargon_conqueror_happiness",
	},

	conqueror_tier_happiness_bundle_duration = {
		[1] = 10,
		[2] = 10,
		[3] = 10,
	},

	-- This is a percentage. 0.5 means 50% more, 1 means 100% more.
	overseer_tier_treasurer_multiplier = {
		[1] = 0.5,
		[2] = 0.75,
		[3] = 1,
	},

	-- Tiers for rewards that are given for total domain points
	any_domain_tiers = {
		[1] = 4,
		[2] = 12,
		[3] = 20,
	},

	-- These are applied when we reach one of the tiers from above. The rewards are exclusive,
	-- meaning tier 2 will only get the tier 2 effect bundle and not the tier 1 one.
	any_domain_effect_bundles = {
		[1] = "phar_map_effect_bundle_sargon_domain_ability_any_t1",
		[2] = "phar_map_effect_bundle_sargon_domain_ability_any_t2",
		[3] = "phar_map_effect_bundle_sargon_domain_ability_any_t3",
	},

	-- These are applied when we reach one of the tiers from above. The rewards are NOT exclusive,
	-- meaning tier 2 will get both the tier 2 AND tier 1 ancillaries. These are ancillary skills from the ancillaries table.
	any_domain_ancillaries = {
		[1] = nil,
		[2] = nil,
		[3] = "phar_map_sargon_title_the_great",
	},

	-- These are applied when we reach one of the tiers from above. The rewards are NOT exclusive,
	-- meaning tier 2 will get both the tier 2 AND tier 1 skills. These are skill keys from the character_skills table.
	any_domain_faction_leader_skills = {
		[1] = nil,
		[2] = nil,
		[3] = "phar_map_sargon_title_the_great",
	},

	any_domain_tier_to_unlock_grand_ambitions = 1,

	----------------------
	--------- UI ---------
	----------------------

	shared_states = {
		overseer_treasurer_multiplier = "treasurer_multiplier",
	},

	ui = {
		panel_name = "map_legacy_sargon",

		active_scribe_script_id = "sargon_active_scribe_info",
		scribe_shop_script_id = "sargon_scribe_shop",
		scribe_shop_refresh_button_script_id = "sargon_scribe_shop_refresh_button",
		scribe_shop_hire_button_script_id = "sargon_scribe_shop_hire_button",
		all_categories_bar_script_id = "sargon_all_categories_bar",
		active_domains_script_id = "sargon_active_domains_list",
		inactive_domains_script_id = "sargon_inactive_domains_list",
		ambitions_script_id = "sargon_ambition_keys",
		ambition_extension_info_script_id = "sargon_ambition_duration_extension_info",
		add_ambition_button_tooltip_script_id = "add_ambition_button_tooltip",

		events = {
			dismiss_active_scribe = "sargon_dismiss_active_scribe",
			purchase_scribe = "sargon_purchase_scribe",
			buy_new_ambition = "sargon_buy_new_ambition",
			buy_refresh_scribes = "sargon_buy_refresh_scribes",

			cheat_add_all_categories_domain_points = "sargon_cheat_add_all_categories_points",
			cheat_add_specific_category_domain_points = "sargon_cheat_add_domain_points",
			cheat_force_grand_ambition = "sargon_cheat_choose_grand_ambition",
		},
	},
}

ancient_legacies_sargon = {
	config = sargon_config,

	persistent = {
		--[[
		faction_key = "fgh",
		scribe_changes_this_turn = 0,
		ambition_draw_cooldown = 0,
		ambition_extend_duration_cooldown = 0,
		available_free_scribe_choices = 1,
		available_scribe_hires = 0,
		scribes = {
			{ type = "scribe_type1", duration = 5 },
			{ type = "scribe_type2", duration = 3 },
		},
		domain_points = {
			["conqueror"] = 5,
			["strategist"] = 3,
		},
		active_domains = {
			"domain1",
			"domain2",
			"domain3",
		},
		available_to_hire_scribes = {
			"scribe_type1",
			"scribe_type2",
		},
		--]]
	},

	shared_states = {
		has_active_scribe = "legacy_sargon_faction_has_scribe",
	},

	--------------------------------------------------------------------
	-------------------------- Public Methods --------------------------
	------------ These methods have parameter error checking -----------
	--------- Or are meant to be called from outside the script --------
	--------------------------------------------------------------------

	get_active_scribes = function(self)
		local scribes = {}

		for _, scribe in ipairs(self.persistent.scribes) do
			table.insert(scribes, {
				type = scribe.type,
				duration = scribe.duration,
				config = self.get_scribe_config_table(scribe.type),
			})
		end

		return scribes
	end,

	get_total_domain_points = function(self)
		local all_points = 0

		for _, points in pairs(self.persistent.domain_points) do
			all_points = points + all_points
		end

		return all_points
	end,

	get_total_permanent_domain_points = function(self)
		local all_points = 0

		for domain, _ in pairs(self.persistent.domain_points) do
			all_points = self:get_specific_domain_permanent_points(domain) + all_points
		end

		return all_points
	end,

	get_total_excess_domain_points = function(self)
		local all_points = 0

		for domain, _ in pairs(self.persistent.domain_points) do
			all_points = self:get_specific_domain_excess_points(domain) + all_points
		end

		return all_points
	end,

	get_specific_domain_points = function(self, domain)
		for _domain, _ in pairs(self.config.domain_tier_effect_bundles) do
			if _domain == domain then
				return self.persistent.domain_points[domain] or 0
			end
		end

		script_error("Sargon: Trying to get domain points for a domain that doesn't exist: " .. tostring(domain) .. ". Returning 0 to prevent crash")
		return 0
	end,

	get_specific_domain_permanent_points = function(self, domain)
		local total_points = self:get_specific_domain_points(domain)
		if total_points == 0 then
			return 0
		end

		local tier = self:get_domain_tier_from_points(domain, total_points)
		if tier == 0 then
			return 0
		end

		local tier_points = (self.config.domain_tiers_override[domain]
								and self.config.domain_tiers_override[domain][tier])
							or self.config.domain_tiers[tier]

		return tier_points
	end,

	get_specific_domain_excess_points = function(self, domain)
		local total_points = self:get_specific_domain_points(domain)
		if total_points == 0 then
			return 0
		end

		local tier = self:get_domain_tier_from_points(domain, total_points)
		if tier == 0 then
			return total_points
		end

		local tier_points = (self.config.domain_tiers_override[domain]
			and self.config.domain_tiers_override[domain][tier])
			or self.config.domain_tiers[tier]

		return total_points - tier_points
	end,

	get_specific_domain_max_points = function(self, domain)
		for _domain, _ in pairs(self.config.domain_tier_effect_bundles) do
			if _domain == domain then
				local tiers = self.config.domain_tiers_override[domain] or self.config.domain_tiers
				local max_points = 0

				for _, points in pairs(tiers) do
					max_points = math.max(max_points, points)
				end

				return max_points
			end
		end

		script_error("Sargon: Trying to get domain max points for a domain that doesn't exist: " .. tostring(domain) .. ". Returning 0 to prevent crash")
		return 0
	end,

	ambition_duration_extension_available = function(self)
		local any_domain_tier = self:get_any_domain_tier_from_points(self:get_total_domain_points())
		return any_domain_tier >= self.config.ambition_extend_duration_required_tier
	end,

	grand_ambitions_are_unlocked = function(self)
		local points = self:get_total_domain_points()
		local tier = self:get_any_domain_tier_from_points(points)
		return tier >= self.config.any_domain_tier_to_unlock_grand_ambitions
	end,

	get_domain_bundle_duration = function(self, domain, tier)
		local override = self.config.domain_tier_effect_bundle_duration_override[domain]
		return (override and override[tier]) or self.config.domain_effect_bundle_default_duration
	end,

	is_domain_tier_bundle_enabled_by_default = function(self, domain, tier)
		local enabled_table = self.config.domain_tier_effect_bundle_disabled_by_default[domain]
		return not enabled_table or not enabled_table[tier]
	end,

	--------------------------------------------------------------------
	-------------------------- Static Methods --------------------------
	------------ These methods have parameter error checking -----------
	--------- Or are meant to be called from outside the script --------
	----------- And should be called without a "self" object -----------
	--------------------------------------------------------------------

	get_scribe_config_table = function(scribe_type)
		for _, scribe_config in ipairs(sargon_config.scribe_types) do
			if scribe_config.type == scribe_type then
				return scribe_config
			end
		end

		return nil
	end,

	get_scribe_duration_from_scribe_type = function(scribe_type)
		local scribe_config = ancient_legacies_sargon.get_scribe_config_table(scribe_type)
		return ancient_legacies_sargon.get_scribe_duration(scribe_config)
	end,

	get_scribe_duration = function(scribe_config)
		return (scribe_config and scribe_config.duration_override) or sargon_config.scribe_default_duration
	end,

	scribe_type_matches_ambition = function(scribe_config, ambition_config)
		if is_nil(scribe_config.generation_type) or scribe_config.generation_type == "default" then
			for _, domain in ipairs(scribe_config.domains or {}) do
				if table_contains(ambition_config.tags, domain) then
					return true
				end
			end

			return false
		elseif scribe_config.generation_type == "combined" then
			for _, domain in ipairs(scribe_config.domains or {}) do
				if not table_contains(ambition_config.tags, domain) then
					return false
				end
			end

			return true
		end

		return false
	end,

	get_number_of_forced_missions_for_scribe = function(scribe_config)
		return scribe_config.num_forced_domain_missions_during_generation or sargon_config.default_num_scribe_forced_domain_missions_during_generation
	end,

	--------------------------------------------------------------------
	------------------------- Private Methods --------------------------
	-------- These methods do NOT have parameter error checking --------
	------ Or aren't meant to be called from outside this script -------
	--------------------------------------------------------------------

	-- If index is a number then will replace the scribe at that location if there is one
	choose_scribe = function(self, scribe_type, scribe_index)
		if scribe_index and scribe_index > #self.persistent.scribes then
			scribe_index = nil
		end

		local generated_scribe_index = table_find(self.persistent.available_to_hire_scribes, scribe_type, true)
		if not generated_scribe_index then
			script_error("Sargon: Trying to choose a scribe that was never generated! scribe_type = " .. scribe_type)
			return
		end

		if self.persistent.available_scribe_hires <= 0 then
			script_error("Sargon: No available scribe hires for this turn")
			return
		end

		local faction = cm:get_faction(self.persistent.faction_key)

		if self.persistent.available_free_scribe_choices <= 0 then
			local resource_cost_object = self:create_cost_for_hire_a_scribe()
			if not faction:can_afford_resource_cost_object(resource_cost_object) then
				script_error("Sargon: Faction does not have enough resources to generate scribes. Faction = " .. self.persistent.faction_key)
				return
			end

			cm:faction_apply_resource_transaction(faction, resource_cost_object)
		else
			self.persistent.available_free_scribe_choices = self.persistent.available_free_scribe_choices - 1
		end

		self.persistent.available_scribe_hires = self.persistent.available_scribe_hires - 1

		local scribe_data = { type = scribe_type, duration = self.get_scribe_duration_from_scribe_type(scribe_type) }

		if scribe_index then
			self.persistent.scribes[scribe_index] = scribe_data
		else
			table.insert(self.persistent.scribes, scribe_data)
		end

		table.remove(self.persistent.available_to_hire_scribes, generated_scribe_index)
		if #self.persistent.available_to_hire_scribes == 0 then
			self:generate_scribes()
		end

		cm:set_script_state(faction, self.shared_states.has_active_scribe, true)

		if self.persistent.faction_key == cm:get_local_faction_name(true) then
			self:setup_active_scribe_info()
			self:setup_scribe_shop_info()
		end
	end,

	create_cost_for_hire_a_scribe = function(self)
		local resource_cost_object = cm:create_new_custom_resource_cost()
		for resource_key, resource_amount in dpairs(self.config.scribe_choose_cost) do
			resource_cost_object:add_resource_cost(resource_key, self.config.scribe_choose_cost_factor, resource_amount)
		end

		return resource_cost_object
	end,

	generate_scribes = function(self, pay_cost)
		if pay_cost then
			local resource_cost_object = self:create_cost_for_generating_scribes()
			local faction = cm:get_faction(self.persistent.faction_key)

			if not faction:can_afford_resource_cost_object(resource_cost_object) then
				script_error("Sargon: Faction does not have enough resources to generate scribes. Faction = " .. self.persistent.faction_key)
				return
			end

			cm:faction_apply_resource_transaction(faction, resource_cost_object)
		end

		self.persistent.available_to_hire_scribes = {}

		local scribe_types = self.config.scribe_types
		local num_to_generate = self.config.num_scribes_to_generate
		local generated_scribes = {}

		local scribe_weighted_list = weighted_list:new()

		for _, scribe_type in ipairs(scribe_types) do
			scribe_weighted_list:add_item(scribe_type, scribe_type.weight or self.config.scribe_default_weight)
		end

		while num_to_generate > 0 do
			local picked_scribe, picked_index = scribe_weighted_list:weighted_select()
			if picked_scribe then
				num_to_generate = num_to_generate - 1
				table.insert(generated_scribes, picked_scribe.type)
				scribe_weighted_list:remove_item(picked_index)
			else
				script_error("Sargon: Could not generate the necessary amount of scribes. Num to generated = " .. tostring(num_to_generate) .. ", number of scribes = " .. tostring(#scribe_types))
				break
			end
		end

		self.persistent.available_to_hire_scribes = generated_scribes

		if self.persistent.faction_key == cm:get_local_faction_name(true) then
			self:setup_active_scribe_info()
			self:setup_scribe_shop_info()
		end
	end,

	create_cost_for_generating_scribes = function(self)
		local resource_cost_object = cm:create_new_custom_resource_cost()
		for resource_key, resource_amount in dpairs(self.config.scribe_generate_cost) do
			resource_cost_object:add_resource_cost(resource_key, self.config.scribe_generate_cost_factor, resource_amount)
		end

		return resource_cost_object
	end,

	remove_scribe = function(self, scribe_type)
		for i, scribe in ipairs(self.persistent.scribes) do
			if scribe.type == scribe_type then
				table.remove(self.persistent.scribes, i)
				break
			end
		end

		local faction = cm:get_faction(self.persistent.faction_key)

		cm:set_script_state(faction, self.shared_states.has_active_scribe, false)

		if self.persistent.faction_key == cm:get_local_faction_name(true) then
			self:setup_active_scribe_info()
			self:setup_scribe_shop_info()
		end
	end,

	reduce_scribe_duration = function(self)
		local scribes = self.persistent.scribes

		-- Removing in backwards order so indexes don't change for scribes we're about to remove
		for i = #scribes, 1, -1 do
			scribes[i].duration = scribes[i].duration - 1
			if scribes[i].duration == 0 then
				table.remove(scribes, i)
			end
		end

		if #scribes == 0 then
			local faction = cm:get_faction(self.persistent.faction_key)
			cm:set_script_state(faction, self.shared_states.has_active_scribe, false)
		end
	end,

	create_scribes_table = function(self)
		local return_table = {}

		for _, scribe in ipairs(self.persistent.scribes) do
			table.insert(return_table, self.get_scribe_config_table(scribe.type))
		end

		return return_table
	end,

	get_any_domain_tier_from_points = function(self, points)
		local max_tier = 0

		for tier, points_needed in pairs(self.config.any_domain_tiers) do
			if tier > max_tier and points >= points_needed then
				max_tier = tier
			end
		end

		return max_tier
	end,

	get_domain_tier_from_points = function(self, domain, points)
		local max_tier = 0

		for tier, points_needed in pairs(self.config.domain_tiers_override[domain] or self.config.domain_tiers) do
			if tier > max_tier and points >= points_needed then
				max_tier = tier
			end
		end

		return max_tier
	end,

	setup_additional_domain_options = function(self, domain, tier, enable)
		if domain == "overseer" then
			local shared_state = self.config.shared_states.overseer_treasurer_multiplier
			local faction = cm:get_faction(self.persistent.faction_key)

			local tier_to_value = self.config.overseer_tier_treasurer_multiplier

			if enable and tier_to_value[tier] then
				cm:set_script_state(faction, shared_state, tier_to_value[tier])
			else
				cm:remove_script_state(faction, shared_state)
			end
		end
	end,

	update_active_domains = function(self)
		-- Adding all domains tier 1 and above to "new_active_domains" and then sorting by tier and then by the amount
		-- of excess points. Then removing all tables above the max_active_domains config option.
		-- Only the top that many are active.

		local new_active_domains = {}
		local new_active_domain_tiers = {}
		local new_active_domain_excess_points = {}
		local max_active_domains = self.config.max_active_domains
		local total_points = 0

		local sort_active_domains = function()
			local compare_domains = function(a, b)
				return new_active_domain_tiers[a] > new_active_domain_tiers[b]
					or (new_active_domain_tiers[a] == new_active_domain_tiers[b]
						and new_active_domain_excess_points[a] > new_active_domain_excess_points[b])
			end
			new_active_domains = table_stable_sort(new_active_domains, compare_domains)
		end

		for domain, points in dpairs(self.persistent.domain_points) do
			if points > 0 then
				local tier = self:get_domain_tier_from_points(domain, points)
				local excess_points = self:get_specific_domain_excess_points(domain)

				if tier > 0 then
					table.insert(new_active_domains, domain)
					new_active_domain_tiers[domain] = tier
					new_active_domain_excess_points[domain] = excess_points
					sort_active_domains()

					if #new_active_domains > max_active_domains then
						table.remove(new_active_domains, #new_active_domains)
					end
				end

				total_points = points + total_points
			end
		end

		-- Remove bundles from old domains
		for _, domain_id in ipairs(self.persistent.active_domains) do
			if not table_contains(new_active_domains, domain_id) then
				local points = self.persistent.domain_points[domain_id] or 0
				local tier = self:get_domain_tier_from_points(domain_id, points)

				local bundle_enabled_by_default = self:is_domain_tier_bundle_enabled_by_default(domain_id, tier)

				if tier > 0 and bundle_enabled_by_default then
					local effect_bundle = self.config.domain_tier_effect_bundles[domain_id][tier]
					cm:remove_effect_bundle(effect_bundle, self.persistent.faction_key)
					self:setup_additional_domain_options(domain_id, tier, false)
				end
			end
		end

		-- Add bundles from new domains
		for _, domain_id in ipairs(new_active_domains) do
			if not table_contains(self.persistent.active_domains, domain_id) then
				local points = self.persistent.domain_points[domain_id] or 0
				local tier = self:get_domain_tier_from_points(domain_id, points)

				local bundle_enabled_by_default = self:is_domain_tier_bundle_enabled_by_default(domain_id, tier)

				if tier > 0 and bundle_enabled_by_default then
					local effect_bundle = self.config.domain_tier_effect_bundles[domain_id][tier]
					local duration = self:get_domain_bundle_duration(domain_id, tier)
					cm:apply_effect_bundle(effect_bundle, self.persistent.faction_key, duration)
					self:setup_additional_domain_options(domain_id, tier, true)
				end
			end
		end

		self.persistent.active_domains = new_active_domains
	end,

	update_specific_domain_abilities = function(self, domain, old_tier, new_tier)
		local domain_is_active = table_contains(self.persistent.active_domains, domain)
		if not domain_is_active then
			self:update_active_domains()
		else
			local bundle_enabled_by_default = self:is_domain_tier_bundle_enabled_by_default(domain_id, tier)

			if bundle_enabled_by_default then
				local old_effect_bundle = self.config.domain_tier_effect_bundles[domain][old_tier]
				local new_effect_bundle = self.config.domain_tier_effect_bundles[domain][new_tier]
				local duration = self:get_domain_bundle_duration(domain, tier)
				cm:remove_effect_bundle(old_effect_bundle, self.persistent.faction_key)
				cm:apply_effect_bundle(new_effect_bundle, self.persistent.faction_key, duration)
				self:setup_additional_domain_options(domain, old_tier, false)
				self:setup_additional_domain_options(domain, new_tier, true)
			end
		end
	end,

	update_domains_from_completed_ambition = function(self, ambition_data)
		local old_total_points = self:get_total_domain_points()

		for _, domain in ipairs(ambition_data.tags or {}) do
			local old_amount = (self.persistent.domain_points[domain] or 0)
			local new_amount = 1 + old_amount
			self.persistent.domain_points[domain] = new_amount

			local old_tier = self:get_domain_tier_from_points(domain, old_amount)
			local new_tier = self:get_domain_tier_from_points(domain, new_amount)

			if new_tier > old_tier then
				self:update_specific_domain_abilities(domain, old_tier, new_tier)
			end
		end

		local new_total_points = self:get_total_domain_points()
		local old_tier = self:get_any_domain_tier_from_points(old_total_points)
		local new_tier = self:get_any_domain_tier_from_points(new_total_points)

		if old_tier < new_tier then
			local faction = cm:get_faction(self.persistent.faction_key)
			local faction_leader = faction:has_faction_leader() and faction:faction_leader()

			for tier = 1, new_tier do
				local effect_bundle = self.config.any_domain_effect_bundles[tier]
				local ancillary = self.config.any_domain_ancillaries[tier]
				local skill = self.config.any_domain_faction_leader_skills[tier]

				if tier <= new_tier then
					if ancillary and not faction:ancillary_exists(ancillary) then
						cm:add_ancillary_to_faction(self.persistent.faction_key, ancillary, true)
					end

					if faction_leader and skill then
						local char_lookup_str = cm:char_lookup_str(faction_leader:command_queue_index())
						cm:force_add_skill(char_lookup_str, skill, true, false)
					end
				end

				if tier == new_tier then
					if effect_bundle and not faction:has_effect_bundle(effect_bundle) then
						cm:apply_effect_bundle(effect_bundle, self.persistent.faction_key, 0)
					end
				else
					if effect_bundle and faction:has_effect_bundle(effect_bundle) then
						cm:remove_effect_bundle(effect_bundle, self.persistent.faction_key)
					end
				end
			end
		end
	end,

	on_legacy_claimed = function(self, faction_key)
		self.persistent = {
			faction_key = faction_key,
			scribe_changes_this_turn = 0,
			ambition_draw_cooldown = 0,
			ambition_extend_duration_cooldown = 0,
			available_free_scribe_choices = self.config.free_scribe_changes,
			available_scribe_hires = self.config.scribe_hires_per_turn,
			scribes = {},
			domain_points = {},
			active_domains = {},
			available_to_hire_scribes = {},
		}

		self:generate_scribes()

		local faction = cm:get_faction(faction_key)

		cm:set_script_state(faction, self.shared_states.has_active_scribe, false)

		if cm:get_local_faction_name(true) == faction_key then
			meso_political_states:activate_button("button_fm_phar_sargon", true)
		end
	end,

	generate_ambitions = function(self)
		if self.persistent.ambition_draw_cooldown > 0 then
			script_error("Sargon: Trying to draw ambitions when the cooldown is still up. Cooldown = " .. tostring(self.persistent.ambition_draw_cooldown) .. ", faction = " .. self.persistent.faction_key)
			return
		end

		local resource_cost_object = cm:create_new_custom_resource_cost()
		for resource_key, resource_amount in dpairs(self.config.ambition_draw_resource_cost) do
			resource_cost_object:add_resource_cost(resource_key, self.config.ambition_draw_resource_factor, resource_amount)
		end

		local faction = cm:get_faction(self.persistent.faction_key)

		if not faction:can_afford_resource_cost_object(resource_cost_object) then
			script_error("Sargon: Faction does not have enough resources to generate ambitions. Faction = " .. self.persistent.faction_key)
			return
		end

		local pool = ambitions.get_pool_from_name(self.config.ambition_pool_to_draw_ambitions_from)

		if not pool then
			script_error("Sargon: The pool name configuration is wrong in ancient legacy sargon!")
			return
		end

		cm:faction_apply_resource_transaction(faction, resource_cost_object)

		local scribes = self:create_scribes_table()
		ambitions.generate_ambitions(self.persistent.faction_key, pool, scribes)
		self.persistent.ambition_draw_cooldown = self.config.ambition_draw_cooldown

		if self.persistent.faction_key == cm:get_local_faction_name(true) then
			-- No need to call with intervention here since we can't press the new ambition button during a dilemma choice
			ambitions.ui.open_panel_asap()
		end
	end,

	get_listeners = function(_)
		return {
			{
				event = "ScriptEventAmbitionSuccessful",
				auto_check_faction = true,
				condition = true,
				callback = function(self, context)
					local ambition_key = context.stored_table.ambition_key

					if not ambition_key then
						script_error("Sargon: Got a ScriptEventAmbitionSuccessful but ambition_key is nil, something is wrong!")
						return
					end

					local ambition_data = ambitions.get_ambition_table(ambition_key, self.config.ambition_pool_to_draw_ambitions_from, true)
					if not ambition_data then
						return
					end

					self:update_domains_from_completed_ambition(ambition_data)
					self:reduce_scribe_duration()
				end,
			},

			{
				event = "FactionTurnStart",
				auto_check_faction = true,
				condition = true,
				callback = function(self, context)
					self.persistent.ambition_draw_cooldown = math.max(0, self.persistent.ambition_draw_cooldown - 1)
					self.persistent.ambition_extend_duration_cooldown = math.max(0, self.persistent.ambition_extend_duration_cooldown - 1)
					self.persistent.available_scribe_hires = self.config.scribe_hires_per_turn
				end,
			},

			{
				event = "PanelOpenedCampaign",
				auto_check_faction = false,
				condition = function(self, context) return context.string == self.config.ui.panel_name end,
				callback = function(self, context)
					self:setup_active_scribe_info()
					self:setup_scribe_shop_info()
					self:setup_all_categories_bar()
					self:setup_active_domains()
					self:setup_inactive_domains()
					self:setup_ambitions()
					self:setup_ambition_extend_duration()
				end,
			},

			{
				event = "UITriggerScriptEvent",
				auto_check_faction = false,
				condition = function(self, context)
					local faction_cqi = context:faction_cqi()
					local faction = cm:model():faction_for_command_queue_index(faction_cqi)

					if not faction or faction:is_null_interface() then
						return false
					end

					local faction_key = faction:name()

					return faction_key == self.persistent.faction_key
				end,
				callback = function(self, context)
					local splits = context:trigger():split(":")
					local event = splits[1]

					local event_to_callback = {
						[self.config.ui.events.dismiss_active_scribe] = self.ui_dismiss_active_scribe,
						[self.config.ui.events.purchase_scribe] = self.ui_purchase_scribe,
						[self.config.ui.events.buy_new_ambition] = self.ui_buy_new_ambition,
						[self.config.ui.events.buy_refresh_scribes] = self.ui_buy_refresh_scribes,

						[self.config.ui.events.cheat_add_all_categories_domain_points] = self.cheat_add_all_categories_domain_points,
						[self.config.ui.events.cheat_add_specific_category_domain_points] = self.cheat_add_specific_category_domain_points,
						[self.config.ui.events.cheat_force_grand_ambition] = self.cheat_force_grand_ambition,
					}

					local callback = event_to_callback[event] or function(_, _) end
					callback(self, splits)
				end,
			},

			{
				event = "FirstTickAfterWorldCreated",
				auto_check_faction = false,
				condition = function(self, context)
					return self.persistent.faction_key == cm:get_local_faction_name(true)
				end,
				callback = function(self, context)
					meso_political_states:activate_button("button_fm_phar_sargon")
				end
			},

			{
				event = "UIReloaded",
				auto_check_faction = false,
				condition = function(self, context)
					return self.persistent.faction_key == cm:get_local_faction_name(true)
				end,
				callback = function(self, context)
					meso_political_states:activate_button("button_fm_phar_sargon")
				end
			},

			{
				event = "ScriptEventAmbitionStarted",
				auto_check_faction = false,
				condition = function(self, context)
					return self.persistent.faction_key == cm:get_local_faction_name(true)
						and context:faction():name() == self.persistent.faction_key
				end,
				callback = function(self, context)
					self:setup_ambitions()
				end
			},

			{
				event = "ScriptEventAmbitionSuccessful",
				auto_check_faction = false,
				condition = function(self, context)
					return self.persistent.faction_key == cm:get_local_faction_name(true)
						and context:faction():name() == self.persistent.faction_key
				end,
				callback = function(self, context)
					self:setup_ambitions()
				end
			},

			{
				event = "ScriptEventAmbitionCancelled",
				auto_check_faction = false,
				condition = function(self, context)
					return self.persistent.faction_key == cm:get_local_faction_name(true)
						and context:faction():name() == self.persistent.faction_key
				end,
				callback = function(self, context)
					self:setup_ambitions()
				end
			},

			{
				event = "ScriptEventAmbitionExpired",
				auto_check_faction = false,
				condition = function(self, context)
					return self.persistent.faction_key == cm:get_local_faction_name(true)
						and context:faction():name() == self.persistent.faction_key
				end,
				callback = function(self, context)
					self:setup_ambitions()
				end
			},

			{
				event = "ScriptEventAmbitionFailed",
				auto_check_faction = false,
				condition = function(self, context)
					return self.persistent.faction_key == cm:get_local_faction_name(true)
						and context:faction():name() == self.persistent.faction_key
				end,
				callback = function(self, context)
					self:setup_ambitions()
				end
			},

			{
				event = "MissionExtended",
				auto_check_faction = false,
				condition = true,
				callback = function(self, context)
					if self.persistent.faction_key == context:faction():name() then
						self.persistent.ambition_extend_duration_cooldown = self.config.ambition_extend_cooldown

						if self.persistent.faction_key == cm:get_local_faction_name(true) then
							self:setup_ambitions()
							self:setup_ambition_extend_duration()
						end
					end
				end
			},

			{
				event = "NewCharacterRecruited",
				auto_check_faction = false,
				condition = function(self, context)
					local character = context:character()
					local is_own_character = character:faction():name() == self.persistent.faction_key
					local strategist_is_active = table_contains(self.persistent.active_domains, "strategist")
					return is_own_character and strategist_is_active
				end,
				callback = function(self, context)
					local character = context:character()
					local region = character:region()
					if region:is_null_interface() then
						return
					end

					local domain = "strategist"
					local strategist_points = self:get_specific_domain_points(domain)
					local tier = self:get_domain_tier_from_points(domain, strategist_points)
					local effect_bundle = self.config.domain_tier_effect_bundles.strategist[tier]
					if effect_bundle then
						local duration = self:get_domain_bundle_duration(domain, tier)
						cm:apply_effect_bundle_to_province(effect_bundle, region:name(), duration)
					end
				end,
			},

			{
				event = "RegionFactionChangeEvent",
				auto_check_faction = false,
				condition = function(self, context)
					return context:region():owning_faction():name() == self.persistent.faction_key
				end,
				callback = function(self, context)
					local domain = "conqueror"
					local conqueror_is_active = table_find(self.persistent.active_domains, domain)

					if not conqueror_is_active then
						return
					end

					local points = self:get_specific_domain_points(domain)
					local tier = self:get_domain_tier_from_points(domain, points)
					local bundle = self.config.conqueror_tier_happiness_bundle_key[tier]
					local duration = self.config.conqueror_tier_happiness_bundle_duration[tier]
					if not bundle or not duration then
						return
					end

					local province = context:region():province()
					local regions = province:regions()
					local num_regions = regions:num_items()

					for i = 0, num_regions - 1 do
						local region = regions:item_at(i)
						if region:owning_faction():name() ~= self.persistent.faction_key then
							return
						end
					end

					cm:apply_effect_bundle_to_province(bundle, context:region():name(), duration)
				end,
			},

			{
				event = "ScriptEventAttemptingToGenerateAmbitions",
				auto_check_faction = false,
				condition = function(self, context)
					return context.stored_table.faction_key == self.persistent.faction_key
				end,
				callback = function(self, context)
					local scribes = self:create_scribes_table()
					table_append(context.stored_table.scribes, scribes)
				end
			},

			{
				event = "CharacterBecomesFactionLeader",
				auto_check_faction = false,
				condition = function(self, context)
					local faction_leader = context:character()
					return faction_leader:faction():name() == self.persistent.faction_key
				end,
				callback = function(self, context)
					for domain, points in dpairs(self.persistent.domain_points) do
						local excess_points = self:get_specific_domain_excess_points(domain)
						local total_points = self:get_specific_domain_points(domain)
						self.persistent.domain_points[domain] = total_points - excess_points
					end
				end
			},

			{
				event = "ContextTriggerEvent",
				auto_check_faction = false,
				condition = true,
				callback = function(self, context)
					local event_type = context.string:split(":")[1]
					if event_type == "SargonAddAmbitionButtonCreateCcoTooltip" then
						local component = UIComponent(context.component)
						local cco_id = self.config.ui.add_ambition_button_tooltip_script_id
						self:create_add_ambition_button_tooltip_cco(cco_id)
						component:SetProperty("script_id", cco_id)
					end
				end
			},

			{
				event = "UIScriptEventDisplayAmbitionTags",
				auto_check_faction = false,
				condition = function(self, context)
					return context.stored_table.faction_key == self.persistent.faction_key
				end,
				callback = function(self, context)
					local scribes = self:create_scribes_table()
					table_append(context.stored_table.scribes, scribes)
				end
			},

			{
				event = "CharacterBecomesFactionLeader",
				auto_check_faction = false,
				condition = true,
				callback = function(self, context)
					local character = context:character()
					local faction = character:faction()

					if faction:name() ~= self.persistent.faction_key
						or not character
						or character:is_null_interface()
					then
						return
					end

					local all_domains_points = self:get_total_domain_points()
					local all_domains_tier = self:get_any_domain_tier_from_points(all_domains_points)

					for tier = 1, all_domains_tier do
						local skill = self.config.any_domain_faction_leader_skills[tier]

						if skill then
							local char_lookup_str = cm:char_lookup_str(character:command_queue_index())
							cm:force_add_skill(char_lookup_str, skill, true, false)
						end
					end
				end
			},
		}
	end,

	-- persistent data is already loaded by ancient_legacy_common, we are just informed we are loaded
	on_loading_game = function(self, faction_key)
		if not self.persistent.active_domains then
			self.persistent.active_domains = {}
		end

		if not self.persistent.ambition_extend_duration_cooldown then
			self.persistent.ambition_extend_duration_cooldown = 0
		end

		if not self.persistent.available_scribe_hires then
			self.persistent.available_scribe_hires = self.config.scribe_hires_per_turn
		end
	end,

	--------------------------------------------------------------------
	---------------------------- UI STUFF ------------------------------
	---- UI setup functions that are called when the panel is opened ---
	----------------------- PanelOpenedCampaign ------------------------
	--------------------------------------------------------------------

	get_scribe_ui_table = function(self, scribe)
		local ui_table = {
			type = scribe.config.type,
			icon = scribe.config.ui.icon or "ui/skins/default/map_legacy_sargon/map_portrait_scribe_type.png",
			name = scribe.config.ui.name or "Scribe of type \"" .. scribe.config.type .. "\" does not have a name setup in the config!",
			effects = scribe.config.ui.effects or {},
			duration = scribe.duration or self.get_scribe_duration(scribe.config),
			domains = scribe.config.domains or {},
		}

		return ui_table
	end,

	get_domain_ui_table = function(self, domain, active)
		local name = (ambitions.tags[domain] and ambitions.tags[domain].localised_name_key) or "domain " .. tostring(domain) .. " localised name missing"
		local max_points = self:get_specific_domain_max_points(domain)
		local total_points = self:get_specific_domain_points(domain)

		local ui_table = {
			name = common.get_localised_string(name),
			type = domain,
			total_points = total_points,
			permanent_points = self:get_specific_domain_permanent_points(domain),
			excess_points = self:get_specific_domain_excess_points(domain),
			max_points = max_points,
			active = to_bool(active),
			tiers = {
				--[[
				{
					tier = 1,
					threshold = 10,
					-- Same max_points as above, putting it here to make it a bit easier to use in UI
					max_points = 50,
					effect_bundle = "",
					active = false,
				}
				--]]
			}
		}

		local tiers = self.config.domain_tiers_override[domain] or self.config.domain_tiers

		for tier, points in pairs(tiers) do
			table.insert(ui_table.tiers, {
				tier = tier,
				threshold = points,
				max_points = max_points,
				effect_bundle = self.config.domain_tier_effect_bundles[domain][tier],
				active = total_points >= points,
			})
		end

		return ui_table
	end,

	setup_active_scribe_info = function(self)
		local active_scribes = self:get_active_scribes()

		if #active_scribes <= 0 then
			return
		end

		-- NOTE currently UI only supports 1 active scribe and by design currently it should only be possible to have
		-- only 1 active scribe, so we're just getting the first one here. If UI and design ever get updated then this
		-- code would need to be updated too
		local active_scribe = active_scribes[1]

		local scribe_ui_table = self:get_scribe_ui_table(active_scribe)

		local script_id = self.config.ui.active_scribe_script_id
		common.set_context_value(script_id, scribe_ui_table)
	end,

	setup_scribe_shop_info = function(self)
		local shop_info = {
			scribes = {
				--[[
				type = <type>,
				domains = { <domain1>, <domain2> },
				icon = <icon>,
				name = <name>,
				effects = { <effect1>, <effect2> },
				duration = <duration>,
				--]]
			},
		}

		for _, scribe_type in ipairs(self.persistent.available_to_hire_scribes) do
			local scribe_ui_table = self:get_scribe_ui_table({
				type = scribe_type,
				config = self.get_scribe_config_table(scribe_type),
			})

			table.insert(shop_info.scribes, scribe_ui_table)
		end

		local script_id = self.config.ui.scribe_shop_script_id
		common.set_context_value(script_id, shop_info)

		local faction = cm:get_faction(self.persistent.faction_key)
		local generating_scribes_cost_object = self:create_cost_for_generating_scribes()
		local refresh_button_cco = {
			CanAfford = faction:can_afford_resource_cost_object(generating_scribes_cost_object),
			ResourcesCostString = generating_scribes_cost_object:to_string(faction, true),
		}

		common.set_context_value(self.config.ui.scribe_shop_refresh_button_script_id, refresh_button_cco)

		local hire_is_free = self.persistent.available_free_scribe_choices > 0
		local hire_scribe_cost_object = self:create_cost_for_hire_a_scribe()
		local hire_button_cco = {
			CanAfford = hire_is_free or faction:can_afford_resource_cost_object(hire_scribe_cost_object),
			IsAvailable = self.persistent.available_scribe_hires > 0,
			ResourcesCostString = hire_scribe_cost_object:to_string(faction, true),
			IsFree = hire_is_free,
		}

		common.set_context_value(self.config.ui.scribe_shop_hire_button_script_id, hire_button_cco)
	end,

	setup_all_categories_bar = function(self)
		local total_domain_points = self:get_total_domain_points()
		local total_permanent_domain_points = self:get_total_permanent_domain_points()
		local total_excess_domain_points = self:get_total_excess_domain_points()

		local tiers = self.config.any_domain_tiers
		local effect_bundles = self.config.any_domain_effect_bundles

		local max_points = 0
		for _, points in ipairs(tiers) do
			max_points = math.max(max_points, points)
		end

		local all_categories_ui_table = {
			total_points = total_domain_points,
			permanent_points = total_permanent_domain_points,
			excess_points = total_excess_domain_points,
			max_points = max_points,
			tiers = {
				--[[
				{
					tier = 1,
					threshold = 10,
					-- Same max_points as above, putting it here to make it a bit easier to use in UI
					max_points = 50,
					effect_bundle = "",
					active = false,
				}
				--]]
			}
		}

		for i = 1, #tiers do
			table.insert(all_categories_ui_table.tiers,
				{
					tier = i,
					threshold = tiers[i],
					max_points = max_points,
					effect_bundle = effect_bundles[i],
					active = total_domain_points >= tiers[i],
				}
			)
		end

		local script_id = self.config.ui.all_categories_bar_script_id
		common.set_context_value(script_id, all_categories_ui_table)
	end,

	setup_active_domains = function(self)
		local used_domains = {}
		local ui_table = {
			active_domains = { },
		}

		local active_domains = self.persistent.active_domains

		for _, domain in ipairs(active_domains) do
			local domain_ui_table = self:get_domain_ui_table(domain, true)
			table.insert(ui_table.active_domains, domain_ui_table)
			used_domains[domain] = true
		end

		-- We want the active domains list to always fill up to 3, so we add the
		-- top inactive domains and give them the inactive state in UI
		local num_additional_inactive_domains = self.config.max_active_domains - #ui_table.active_domains
		while num_additional_inactive_domains > 0 do
			local top_unused_domain = nil
			local top_unused_domain_points = -1
			for domain, _ in dpairs(self.config.domain_tier_effect_bundles) do
				local points = self:get_specific_domain_points(domain)
				if not used_domains[domain] and points > top_unused_domain_points then
					top_unused_domain = domain
					top_unused_domain_points = points
				end
			end

			if top_unused_domain then
				local domain_ui_table = self:get_domain_ui_table(top_unused_domain, false)
				table.insert(ui_table.active_domains, domain_ui_table)
				used_domains[top_unused_domain] = true
			else
				break
		end

			num_additional_inactive_domains = num_additional_inactive_domains - 1
		end

		local script_id = self.config.ui.active_domains_script_id
		common.set_context_value(script_id, ui_table)
	end,

	setup_inactive_domains = function(self)
		local ui_table = {
			inactive_domains = { },
		}

		for domain, _ in pairs(self.config.domain_tier_effect_bundles) do
			if not table_contains(self.persistent.active_domains, domain) then
				local domain_ui_table = self:get_domain_ui_table(domain, false)
				table.insert(ui_table.inactive_domains, domain_ui_table)
			end
		end

		local script_id = self.config.ui.inactive_domains_script_id
		common.set_context_value(script_id, ui_table)
	end,

	setup_ambitions = function(self)

		local resource_cost_object = cm:create_new_custom_resource_cost()
		for resource_key, resource_amount in dpairs(self.config.ambition_draw_resource_cost) do
			resource_cost_object:add_resource_cost(resource_key, self.config.ambition_draw_resource_factor, resource_amount)
		end

		local faction = cm:get_faction(self.persistent.faction_key)
		local can_afford = faction:can_afford_resource_cost_object(resource_cost_object)

		local ui_table = {
			ambitions = {},
			grand_ambition = "",
			can_afford = can_afford,
			current_cooldown = self.persistent.ambition_draw_cooldown,
		}

		local active_ambitions = ambitions.get_active_ambitions_for_faction(self.persistent.faction_key)

		for _, ambition_data in ipairs(active_ambitions) do
			if ambition_data.pool_name == self.config.ambition_pool_to_draw_ambitions_from then
				table.insert(ui_table.ambitions, ambition_data.ambition_key)
			elseif ambition_data.pool_name == self.config.grand_ambition_pool_to_draw_ambitions_from then
				ui_table.grand_ambition = ambition_data.ambition_key
			end
		end

		for i = #ui_table.ambitions, self.config.max_amount_of_ambitions - 1 do
			-- Adding empty ambitions so that the list is populated with the "start new ambition" button.
			table.insert(ui_table.ambitions, "")
		end

		local script_id = self.config.ui.ambitions_script_id
		common.set_context_value(script_id, ui_table)
	end,

	setup_ambition_extend_duration = function(self)
		local ui_table = {
			extension_available = self:ambition_duration_extension_available(),
			additional_duration = self.config.ambition_extend_additional_duration,
			cooldown = self.config.ambition_extend_cooldown,
			current_cooldown = self.persistent.ambition_extend_duration_cooldown,
		}

		local script_id = self.config.ui.ambition_extension_info_script_id
		common.set_context_value(script_id, ui_table)
	end,

	create_add_ambition_button_tooltip_cco = function(self, cco_id)
		local resource_cost_object = cm:create_new_custom_resource_cost()
		for resource_key, resource_amount in dpairs(self.config.ambition_draw_resource_cost) do
			resource_cost_object:add_resource_cost(resource_key, self.config.ambition_draw_resource_factor, resource_amount)
		end

		local faction = cm:get_faction(self.persistent.faction_key)
		local can_afford = faction:can_afford_resource_cost_object(resource_cost_object)
		common.set_context_value(cco_id, {
			resources_cost_string = resource_cost_object:to_string(faction, true),
			current_cooldown = self.persistent.ambition_draw_cooldown,
			can_afford = can_afford,
		})
	end,

	--------------------------------------------------------------------
	---------------------------- UI STUFF ------------------------------
	--- UI functions that are called when the player presses buttons ---
	----------------------- UITriggerScriptEvent -----------------------
	--------------------------------------------------------------------

	ui_dismiss_active_scribe = function(self, splits)
		local scribe_index = (#splits > 1 and splits[2]) or 1

		if scribe_index > #self.persistent.scribes then
			script_error("Sargon: Trying to dismiss a scribe with index " .. tostring(scribe_index) .. " when we only have " .. tostring(#self.persistent.scribes) .. " active scribes!")
			return
		end

		local scribe = self.persistent.scribes[scribe_index]

		if not scribe then
			script_error("Sargon: Trying to dismiss a non-existing scribe with index " .. tostring(scribe_index) .. ". We have " .. tostring(#self.persistent.scribes) .. " active scribes. Something is wrong.")
			return
		end

		self:remove_scribe(scribe.type)
	end,

	ui_purchase_scribe = function(self, splits)
		if #splits ~= 2 then
			local splits_string = (_debug and _debug.to_str(splits)) or tostring(splits)
			script_error("Sargon: Trying to purchase a scribe with wrong event data. Splits = " .. splits_string)
			return
		end

		local scribe_type = splits[2]

		-- NOTE currently UI only supports 1 active scribe and by design currently it should only be possible to have
		-- only 1 active scribe, so we're forcibly replacing the first scribe when purchasing a new one. If UI and
		-- design ever get updated then this code would need to be updated too
		self:choose_scribe(scribe_type, 1)
	end,

	ui_buy_new_ambition = function(self, splits)
		self:generate_ambitions()
	end,

	ui_buy_refresh_scribes = function(self, splits)
		self:generate_scribes(true)
	end,

	--------------------------------------------------------------------
	----------------------------- CHEATS -------------------------------
	------------------------- used for testing -------------------------
	--------------------------------------------------------------------

	cheat_add_all_categories_domain_points = function(self, splits)
		if #splits ~= 2 then
			local splits_string = (_debug and _debug.to_str(splits)) or tostring(splits)
			script_error("Sargon: Bad data for cheat_add_all_categories_domain_points. Splits = " .. splits_string)
			return
		end

		local num_points = tonumber(splits[2])
		local num_domains = table_size(self.config.domain_tier_effect_bundles)
		local points_per_domain = math.floor(num_points / num_domains)
		local leftover_points = num_points - (points_per_domain * num_domains)

		for domain, _ in dpairs(self.config.domain_tier_effect_bundles) do
			self.persistent.domain_points[domain] = points_per_domain + (self.persistent.domain_points[domain] or 0)
			if leftover_points > 0 then
				self:update_domains_from_completed_ambition({ tags = { domain } })
				leftover_points = leftover_points - 1
			end
		end

		self:update_active_domains()

		if self.persistent.faction_key == cm:get_local_faction_name(true) then
			self:setup_all_categories_bar()
			self:setup_active_domains()
			self:setup_inactive_domains()
		end
	end,

	cheat_add_specific_category_domain_points = function(self, splits)
		if #splits ~= 3 then
			local splits_string = (_debug and _debug.to_str(splits)) or tostring(splits)
			script_error("Sargon: Bad data for cheat_add_specific_category_domain_points. Splits = " .. splits_string)
			return
		end

		local num_points = tonumber(splits[2])
		local domain = splits[3]

		if not self.config.domain_tier_effect_bundles[domain] then
			local splits_string = (_debug and _debug.to_str(splits)) or tostring(splits)
			script_error("Sargon: Bad data for cheat_add_specific_category_domain_points. Splits = " .. splits_string)
			return
		end

		for _ = 1, num_points do
			self:update_domains_from_completed_ambition({ tags = { domain } })
		end

		self:update_active_domains()

		if self.persistent.faction_key == cm:get_local_faction_name(true) then
			self:setup_all_categories_bar()
			self:setup_active_domains()
			self:setup_inactive_domains()
		end
	end,

	cheat_force_grand_ambition = function(self, splits)
		local pool = ambitions.get_pool_from_name(self.config.grand_ambition_pool_to_draw_ambitions_from)
		ambitions.generate_ambitions(self.persistent.faction_key, pool)

		if self.persistent.faction_key == cm:get_local_faction_name(true) then
			ambitions.ui.open_panel_asap()
			self:setup_ambitions()
		end
	end,
}

return ancient_legacies_sargon

--[[
                           ______
                     _.-*'"      "`*-._
                _.-*'                  `*-._
             .-'                            `-.
  /`-.    .-'                  _.              `-.
 :    `..'                  .-'_ .                `.
 |    .'                 .-'_.' \ .                 \
 |   /                 .' .*     ;               .-'"
 :   L                    `.     | ;          .-'
  \.' `*.          .-*"*-.  `.   ; |        .'
  /      \        '       `.  `-'  ;      .'
 : .'"`.  .       .-*'`*-.  \     .      (_
 |              .'        \  .             `*-.
 |.     .      /           ;                   `-.
 :    db      '       d$b  |                      `-.
 .   :PT;.   '       :P"T; :                         `.
 :   :bd;   '        :b_d; :                           \
 |   :$$; `'         :$$$; |                            \
 |    TP              T$P  '                             ;
 :                        /.-*'"`.                       |
.sdP^T$bs.               /'       \
$$$._.$$$$b.--._      _.'   .--.   ;
`*$$$$$$P*'     `*--*'     '  / \  :
   \                        .'   ; ;   [bug]
    `.                  _.-'    ' /
      `*-.                      .'
          `*-._            _.-*'
               `*=--..--=*'
--]]





