out("Loading phar_military_force_management.lua")

-- This file is for various military force tweaks or small mechanics. Create a new table object for each different one.

military_force_management = {
	config = {
		-- Which effect bundle to apply at specific population value. Leave nil for none or comment out.
		current_population_arrow_ui_component = { "pop_surplus", "surplus_arrow"},
		population_to_effect_bundle = {
			[0] =	{
						effect_bundle = "phar_sea_effect_bundle_horde_dev_point_threshold_1",
						tt_ui_component = { "pop_surplus", "idle_tier_0" },
						ui_state = "tier_0"
					},
			[1] =	{
						effect_bundle = "phar_sea_effect_bundle_horde_dev_point_threshold_1",
						tt_ui_component = { "pop_surplus", "idle_tier_1" },
						ui_state = "tier_1"
					},
			[2] =	{
						effect_bundle = "phar_sea_effect_bundle_horde_dev_point_threshold_1",
						tt_ui_component = { "pop_surplus", "idle_tier_2" },
						ui_state = "tier_2"
					},
			[3] =	{
						effect_bundle = "phar_sea_effect_bundle_horde_dev_point_threshold_1",
						tt_ui_component = { "pop_surplus", "idle_tier_3" },
						ui_state = "tier_3"
					},
			[4] =	{
						effect_bundle = "phar_sea_effect_bundle_horde_dev_point_threshold_2",
						tt_ui_component = { "pop_surplus", "idle_tier_4" },
						ui_state = "tier_4"
					},
			[5] =	{
						effect_bundle = "phar_sea_effect_bundle_horde_dev_point_threshold_2",
						tt_ui_component = { "pop_surplus", "idle_tier_5" },
						ui_state = "tier_5"
					},
			[6] =	{
						effect_bundle = "phar_sea_effect_bundle_horde_dev_point_threshold_2",
						tt_ui_component = { "pop_surplus", "idle_tier_6" },
						ui_state = "tier_6"
					},
			[7] =	{
						effect_bundle = "phar_sea_effect_bundle_horde_dev_point_threshold_3",
						tt_ui_component = { "pop_surplus", "idle_tier_7" },
						ui_state = "tier_7"
					},
			[8] =	{
						effect_bundle = "phar_sea_effect_bundle_horde_dev_point_threshold_3",
						tt_ui_component = { "pop_surplus", "idle_tier_8" },
						ui_state = "tier_8"
					},
			[9] =	{
						effect_bundle = "phar_sea_effect_bundle_horde_dev_point_threshold_3",
						tt_ui_component = { "pop_surplus", "idle_tier_9" },
						ui_state = "tier_9"
					},
			[10] =	{
						effect_bundle = "phar_sea_effect_bundle_horde_dev_point_threshold_4",
						tt_ui_component = { "pop_surplus", "idle_tier_10" },
						ui_state = "tier_10"
					},
			[11] =	{
						effect_bundle = "phar_sea_effect_bundle_horde_dev_point_threshold_4",
						tt_ui_component = { "pop_surplus", "idle_tier_11" },
						ui_state = "tier_11"
					},
			[12] =	{
						effect_bundle = "phar_sea_effect_bundle_horde_dev_point_threshold_4",
						tt_ui_component = { "pop_surplus", "idle_tier_12" },
						ui_state = "tier_12"
					},
			[13] =	{
						effect_bundle = "phar_sea_effect_bundle_horde_dev_point_threshold_5",
						tt_ui_component = { "pop_surplus", "idle_tier_13" },
						ui_state = "tier_13"
					},
			[14] =	{
						effect_bundle = "phar_sea_effect_bundle_horde_dev_point_threshold_5",
						tt_ui_component = { "pop_surplus", "idle_tier_14" },
						ui_state = "tier_14"
					},
			[15] =	{
						effect_bundle = "phar_sea_effect_bundle_horde_dev_point_threshold_6",
						tt_ui_component = { "pop_surplus", "idle_tier_15" },
						ui_state = "tier_15"
					},					
		},
	},

	apply_effects_for_faction = function(faction_obj)
		local faction_key = faction_obj:name()

		if faction_key == "rebels" or faction_obj:is_dead() then
			return
		end

		local military_force_list = faction_obj:military_force_list()
		local last_force_index = military_force_list:num_items() - 1
		for j = 0, last_force_index do
			local military_force = military_force_list:item_at(j)
			military_force_management.apply_military_force_population_effect_bundle(faction_key, military_force)
		end
	end,

	apply_military_force_population_effect_bundle = function(faction_key, military_force)
		if not military_force:is_horde() then
			return
		end
		local horde_dev_points = military_force:get_horde_development_points(faction_key)
		local new_effect_data = military_force_management.config.population_to_effect_bundle[horde_dev_points]

		if (not new_effect_data) or (not new_effect_data.effect_bundle) or new_effect_data.effect_bundle == "" then
			return
		end

		local general = military_force:general_character()
		if (not general) or general:is_null_interface() then
			return
		end
		local general_cqi = general:command_queue_index()
		-- we remove all the other bundles
		for population, effect_data in dpairs(military_force_management.config.population_to_effect_bundle) do
			if effect_data and effect_data.effect_bundle and new_effect_data.effect_bundle ~= effect_data.effect_bundle then
				cm:remove_effect_bundle_from_character(effect_data.effect_bundle, general_cqi)
			end
		end

		-- only then we add the new one
		cm:apply_effect_bundle_to_character(new_effect_data.effect_bundle, general_cqi, 1)
	end,

	on_first_tick = function(context)
		core:add_listener(
			"phar_apply_military_force_effects_on_start_turn",
			"FactionTurnStart",
			true,
			function(context)
				local faction = context:faction()
				military_force_management.apply_effects_for_faction(faction)
			end,
			true
		)

		core:add_listener(
			"phar_apply_military_force_effects_on_military_force_created",
			"MilitaryForceCreated",
			true,
			function(context)
				local military_force = context:military_force_created()
				local faction = military_force:faction()
				local faction_key = faction:name()
				military_force_management.apply_military_force_population_effect_bundle(faction_key, military_force)
			end,
			true
		)
	end,

	on_new_game = function(context)
		local faction_list = cm:model():world():faction_list()
		for i = 0, faction_list:num_items() - 1 do
			local faction = faction_list:item_at(i)
			military_force_management.apply_effects_for_faction(faction)
		end
	end,

	------------------------
	-- cheats 

	cheat_make_settled = function()
		local player_faction_key = cm:get_local_faction_name(true)
		local player_leader_char = cm:get_faction(player_faction_key):faction_leader()
		cm:convert_force_to_type(player_leader_char,"ARMY")
	end,
	
	cheat_make_horde = function()
		local player_faction_key = cm:get_local_faction_name(true)
		local player_leader_char = cm:get_faction(player_faction_key):faction_leader()
		cm:convert_force_to_type(player_leader_char,"HORDE")
	end,
}

cm:add_first_tick_callback_new(military_force_management.on_new_game)
cm:add_first_tick_callback(military_force_management.on_first_tick)

-- PharMilitaryForce_OnInitHordeForceInfo - sets up the bundle tooltips on the UI
core:add_listener (
	"PharMilitaryForce_OnInitHordeForceInfo",
	"OnInitHordeForceInfo",
	true,
	function(context)
		local horde_building_frame_component = UIComponent(context.component)
		local horde_force = context:horde_force()
		local faction_key = context:faction_key()

		if not horde_force:is_horde() then
			return
		end

		-- Effect bundles for population
		local horde_dev_points = horde_force:get_horde_development_points(faction_key)
		for dev_points, population_value in pairs(military_force_management.config.population_to_effect_bundle) do
			if dev_points == horde_dev_points and population_value and population_value.ui_state then
				local arrow_uic = horde_building_frame_component:SequentialFind(unpack(military_force_management.config.current_population_arrow_ui_component))
				if arrow_uic then
					arrow_uic:SetState(population_value.ui_state)
				end
			end

			if population_value.tt_ui_component and population_value.effect_bundle then
				local icon = horde_building_frame_component:SequentialFind(unpack(population_value.tt_ui_component))
				if icon then
					icon:SetContextObject(cco("CcoEffectBundle", population_value.effect_bundle))
				end
			end
		end
	end,
	true
)

core:add_listener(
	"PharMilitaryForce_MilitaryForceHordeStatusAboutToChange",
	"MilitaryForceHordeStatusAboutToChange",
	true,
	function(context)
		local military_force = context:military_force()
		if not military_force or military_force:is_null_interface() then
			return
		end

		local from_type = context:from_type()
		local from_horde = tribes_privileges.is_horde_type_string(from_type)
		local to_type = context:to_type()
		local to_settled = not tribes_privileges.is_horde_type_string(to_type)

		-- *only* handle changing from horde to settled
		local from_horde_to_settled = from_horde and to_settled
		if not from_horde_to_settled then
			return
		end

		local general = military_force:general_character()
		if (not general) or general:is_null_interface() then
			return
		end
		local general_cqi = general:command_queue_index()
		-- since this will stop being a horde we need to remove all possible bundles from it
		for population, effect_data in dpairs(military_force_management.config.population_to_effect_bundle) do
			cm:remove_effect_bundle_from_character(effect_data.effect_bundle, general_cqi)
		end
	end,
	true
)

core:add_listener(
	"PharMilitaryForce_MilitaryForceHordeStatusChanged",
	"MilitaryForceHordeStatusChanged",
	true,
	function(context)
		local military_force = context:military_force()
		if not military_force or military_force:is_null_interface() then
			return
		end

		local from_type = context:from_type()
		local from_settled = not tribes_privileges.is_horde_type_string(from_type)
		local to_type = context:to_type()
		local to_horde = tribes_privileges.is_horde_type_string(to_type)

		-- *only* handle changing from settled to horde
		local from_settled_to_horde = from_settled and to_horde
		if not from_settled_to_horde then
			return
		end

		-- since this is now a horde we need to set its bundle
		local faction_key = military_force:faction():name()
		military_force_management.apply_military_force_population_effect_bundle(faction_key, military_force)
	end,
	true
)

