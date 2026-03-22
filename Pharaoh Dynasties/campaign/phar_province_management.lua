out("Loading phar_province_management.lua")

-- This file is for various province tweaks or small mechanics. Create a new table object for each different one.

population_happiness = {
	config = {
		-- Which effect bundle to apply at specific population value. Leave nil for none or comment out.
		current_population_arrow_ui_component = { "pop_surplus", "surplus_arrow"},
		population_to_effect_bundle = {
			[0] =	{
						effect_bundle = "phar_main_effect_bundle_province_management_happiness_affected_by_growth_0",
						tt_ui_component = { "pop_surplus", "idle_tier_0" },
						ui_state = "tier_0"
					},
			[1] =	{
						effect_bundle = "phar_main_effect_bundle_province_management_happiness_affected_by_growth_1",
						tt_ui_component = { "pop_surplus", "idle_tier_1" },
						ui_state = "tier_1"
					},
			[2] =	{
						effect_bundle = "phar_main_effect_bundle_province_management_happiness_affected_by_growth_2",
						tt_ui_component = { "pop_surplus", "idle_tier_2" },
						ui_state = "tier_2"
					},
			[3] =	{
						effect_bundle = "phar_main_effect_bundle_province_management_happiness_affected_by_growth_3",
						tt_ui_component = { "pop_surplus", "idle_tier_3" },
						ui_state = "tier_3"
					},
			[4] =	{
						effect_bundle = "phar_main_effect_bundle_province_management_happiness_affected_by_growth_4",
						tt_ui_component = { "pop_surplus", "idle_tier_4" },
						ui_state = "tier_4"
					},
			[5] =	{
						effect_bundle = "phar_main_effect_bundle_province_management_happiness_affected_by_growth_5",
						tt_ui_component = { "pop_surplus", "idle_tier_5" },
						ui_state = "tier_5"
					},
			[6] =	{
						effect_bundle = "phar_main_effect_bundle_province_management_happiness_affected_by_growth_6",
						tt_ui_component = { "pop_surplus", "idle_tier_6" },
						ui_state = "tier_6"
					},
			[7] =	{
						effect_bundle = "phar_main_effect_bundle_province_management_happiness_affected_by_growth_7",
						tt_ui_component = { "pop_surplus", "idle_tier_7" },
						ui_state = "tier_7"
					},
			[8] =	{
						effect_bundle = "phar_main_effect_bundle_province_management_happiness_affected_by_growth_8",
						tt_ui_component = { "pop_surplus", "idle_tier_8" },
						ui_state = "tier_8"
					},
			--[2] = "positive_happiness_bundle",
			--[3] = "negative_happiness_bundle",
		},

		-- Will choose the highest number that is lower than or equal to the happiness
		-- In the example the first bundle will be applied between -100 and -51 happiness, the second between -50 and -1, etc
		current_happiness_ui_component = { "public_order", "icon_public_order"},
		happiness_to_effect_bundle = {
			[100] =	{
						effect_bundle = "phar_main_effect_bundle_province_management_growth_affected_by_happiness_9_of_9",
						tt_ui_component = { "public_order", "public_tier_9" },
						ui_state = "tier_9"
					},
			[80] =	{
						effect_bundle = "phar_main_effect_bundle_province_management_growth_affected_by_happiness_8_of_9",
						tt_ui_component = { "public_order", "public_tier_8" },
						ui_state = "tier_8"
					},
			[60] =	{
						effect_bundle = "phar_main_effect_bundle_province_management_growth_affected_by_happiness_7_of_9",
						tt_ui_component = { "public_order", "public_tier_7" },
						ui_state = "tier_7"
					},
			[40] =	{
						effect_bundle = "phar_main_effect_bundle_province_management_growth_affected_by_happiness_6_of_9",
						tt_ui_component = { "public_order", "public_tier_6" },
						ui_state = "tier_6"
					},
			[20] =	{
						effect_bundle = "phar_main_effect_bundle_province_management_growth_affected_by_happiness_5_of_9",
						tt_ui_component = { "public_order", "public_tier_5" },
						ui_state = "tier_5"
					},
			[0] =	{
						effect_bundle = "phar_main_effect_bundle_province_management_growth_affected_by_happiness_4_of_9",
						tt_ui_component = { "public_order", "public_tier_4" },
						ui_state = "tier_4"
					},
			[-50] =	{
						effect_bundle = "phar_main_effect_bundle_province_management_growth_affected_by_happiness_3_of_9",
						tt_ui_component = { "public_order", "public_tier_3" },
						ui_state = "tier_3"
					},
			[-70] =	{
						effect_bundle = "phar_main_effect_bundle_province_management_growth_affected_by_happiness_2_of_9",
						tt_ui_component = { "public_order", "public_tier_2" },
						ui_state = "tier_2"
					},
			[-100] = {
						effect_bundle = "phar_main_effect_bundle_province_management_growth_affected_by_happiness_1_of_9",
						tt_ui_component = { "public_order", "public_tier_1" },
						ui_state = "tier_1"
					},
			--[-50] = "negative_population_bundle_lesser",
			--[0] = nil,
			--[50] = "positive_population_bundle_lesser",
			--[100] = "positive_population_bundle_greater",
		},
	},

	apply_region_happiness_effect_bundle = function(faction_key, region)
		if faction_key == "rebels" then
			return
		end

		local target_happiness = -1000000
		local target_effect_bundle = nil

		local region_happiness = region:public_order()

		for happiness, v in pairs(population_happiness.config.happiness_to_effect_bundle) do
			if happiness > target_happiness and happiness <= region_happiness then
				target_happiness = happiness
				target_effect_bundle = v.effect_bundle
			end
		end

		if target_effect_bundle and not region:has_effect_bundle(target_effect_bundle) then
			local region_key = region:name()

			for _, v in dpairs(population_happiness.config.happiness_to_effect_bundle) do
				if target_effect_bundle ~= v.effect_bundle then
					cm:remove_effect_bundle_from_province(v.effect_bundle, region_key)
				end
			end

			cm:apply_effect_bundle_to_province(target_effect_bundle, region_key, 0)
		end
	end,

	apply_region_population_effect_bundle = function(faction_key, region)
		if faction_key == "rebels" then
			return
		end

		local region_pop = region:faction_province_development_points()
		local region_key = region:name()
		for population, v in dpairs(population_happiness.config.population_to_effect_bundle) do
			if population == region_pop then
				if v and v.effect_bundle then 
					cm:apply_effect_bundle_to_province(v.effect_bundle, region_key, 0)
				end
			else 
				if v and v.effect_bundle then 
					cm:remove_effect_bundle_from_province(v.effect_bundle, region_key)
				end
			end
		end
	end,

	on_first_tick = function(context)
		core:add_listener(
			"phar_resources_apply_region_population_and_happiness_effects_on_start_turn",
			"FactionTurnStart",
			true,
			function(context)
				local faction = context:faction()
				local num_regions = faction:num_regions()

				if num_regions == 0 then
					return
				end

				local regions = faction:region_list()
				local faction_key = faction:name()

				for i = 0, num_regions - 1 do
					local region = regions:item_at(i)
					population_happiness.apply_region_happiness_effect_bundle(faction_key, region)
					population_happiness.apply_region_population_effect_bundle(faction_key, region)
				end
			end,
			true
		)

		core:add_listener(
			"phar_resources_apply_region_population_and_happiness_effects_on_region_conquered",
			"RegionFactionChangeEvent",
			true,
			function(context)
				local region = context:region()
				local faction_key = region:owning_faction():name()

				-- If the owning faction is "rebels" then the region is not owned by anyone.
				if faction_key == "rebels" then
					return
				end

				-- Apply new ones
				population_happiness.apply_region_happiness_effect_bundle(faction_key, region)
				population_happiness.apply_region_population_effect_bundle(faction_key, region)
			end,
			true
		)
	end,

	on_new_game = function(context)
		local faction_list = cm:model():world():faction_list()
		for i = 0, faction_list:num_items() - 1 do
			local faction = faction_list:item_at(i)

			if not faction:is_dead() then
				local faction_regions = faction:region_list()

				for j = 0, faction_regions:num_items() - 1 do
					local region = faction_regions:item_at(j)
					local faction_key = faction:name()

					population_happiness.apply_region_happiness_effect_bundle(faction_key, region)
					population_happiness.apply_region_population_effect_bundle(faction_key, region)
				end
			end
		end
	end,
}

cm:add_first_tick_callback_new(population_happiness.on_new_game)
cm:add_first_tick_callback(population_happiness.on_first_tick)

-- OnInitProvinceInfo
core:add_listener (
	"PharProvinceManagment_OnInitProvinceInfo",
	"OnInitProvinceInfo",
	true,
	function(context)

		local province_information = UIComponent(context.component)

		local province = context:province()
		local faction_key = context:faction_key()
		

		-- Effect bundles for public order (a.k.a. happines)
		local target_happiness = -1000000
		local ui_state = "invalid"
		local province_public_order = province:public_order(faction_key)
		for happiness, happiness_value in pairs(population_happiness.config.happiness_to_effect_bundle) do
			if happiness > target_happiness and happiness <= province_public_order then
				target_happiness = happiness
				ui_state = happiness_value.ui_state
			end
			
			if happiness_value.tt_ui_component and happiness_value.effect_bundle then
				local icon = province_information:SequentialFind(unpack(happiness_value.tt_ui_component))
				if icon then
					icon:SetContextObject(cco("CcoEffectBundle", happiness_value.effect_bundle))
				end
			end
		end
		if ui_state then
			local happiness_uic = province_information:SequentialFind(unpack(population_happiness.config.current_happiness_ui_component))
			if happiness_uic then
				happiness_uic:SetState(ui_state)
			end
		end

		-- Effect bundles for pupulation
		local province_dev_points = province:development_points_for_faction(faction_key)
		for dev_points, population_value in pairs(population_happiness.config.population_to_effect_bundle) do
			if dev_points == province_dev_points and v and population_value.ui_state then
				local arrow_uic = province_information:SequentialFind(unpack(population_happiness.config.current_population_arrow_ui_component))
				if arrow_uic then
					arrow_uic:SetState(population_value.ui_state)
				end
			end

			if population_value.tt_ui_component and population_value.effect_bundle then
				local icon = province_information:SequentialFind(unpack(population_value.tt_ui_component))
				if icon then
					icon:SetContextObject(cco("CcoEffectBundle", population_value.effect_bundle))
				end
			end
		end
	end,
	true
)-- OnInitHordeForceInfo
