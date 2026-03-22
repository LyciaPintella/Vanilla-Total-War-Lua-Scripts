out("Loading phar_modular_difficulty.lua")


modular_difficulty_campaign.utility_functions =
{
	is_god_culture_excluded = function(god_culture_key)
		if god_culture_key == modular_difficulty_campaign.config.egyptian_culture_key then
			return (mdm.state["allow_egyptian_gods"] and mdm.state["allow_egyptian_gods"].value == 0)
		elseif god_culture_key == modular_difficulty_campaign.config.hatti_culture_key then
			return (mdm.state["allow_hatti_gods"] and mdm.state["allow_hatti_gods"].value == 0)
		elseif god_culture_key == modular_difficulty_campaign.config.canaan_culture_key then
			return (mdm.state["allow_canaan_gods"] and mdm.state["allow_canaan_gods"].value == 0)
		end

		return false
	end,

	setup_allowed_gods = function()
		if not cm:get_local_faction(true) then
			return
		end
		local local_faction_key = cm:get_local_faction(true):name()

		for _, god_data in ipairs(deities.gods) do
			if table.contains(modular_difficulty_campaign.variables.excluded_god_culture_keys, god_data.culture) then
				deities.prevent_god_discovery(local_faction_key, god_data.key)
			end
		end
	end,

	autodiscover_gods = function()
		if not cm:get_local_faction(true) then
			return
		end
		local local_faction_key = cm:get_local_faction(true):name()

		-- prevent sea gods from auto-discovery
		table.insert(modular_difficulty_campaign.variables.excluded_god_culture_keys, modular_difficulty_campaign.config.sea_peoples_culture_key)

		for _, god_data in ipairs(deities.gods) do
			if (not table.contains(modular_difficulty_campaign.variables.excluded_god_culture_keys, god_data.culture))
				and god_data.key ~= deities.config.aten_god_key
			then
				deities.discover_god(local_faction_key, god_data.key, god_data.culture)
			end
		end
	end,

	should_shuffle_commands = function()
		return (mdm.state["shuffle_commands"] and mdm.state["shuffle_commands"].value ~= 0)
	end,

	--- @function give_ancillaries_of_category
	--- @desc the function is used in the fully_equipped_generals modular difficulty
	--- @p ancillary_category a string which indicates the category of the ancillary: refer to modular_difficulty_campaign.config.fully_equipped_generals.ancillary_categories
	get_ancillary_category_index = function(ancillary_category)
		for i, element in ipairs(modular_difficulty_campaign.config.fully_equipped_generals.ancillary_categories) do
			if element.category == ancillary_category then
				return i
			end
		end

		script_error("Invalid ancillary category index '" .. tostring(ancillary_category) .. "'")
		return nil
	end,

	--- @function give_ancillaries_of_category
	--- @desc the function is used in the fully_equipped_generals modular difficulty. It gives one or more ancillaries of supplied `ancillary_category` to the supplied `character`
	--- @p ancillary_list a table of ancillary keys
	--- @p ancillary_category a string which indicates the category of the ancillary: refer to modular_difficulty_campaign.config.fully_equipped_generals.ancillary_categories
	give_ancillaries_of_category = function(character, ancillary_list, ancillary_category)
		if #ancillary_list <= 0 then
			return
		end

		local how_many = modular_difficulty_campaign.config.fully_equipped_generals.ancillary_categories[modular_difficulty_campaign.utility_functions.get_ancillary_category_index(ancillary_category)].amount_to_give

		local i = 0
		while i < how_many do
			for j = 1, #ancillary_list do
				-- pick a random ancillary from the table, to give
				local random_index = cm:model():random_int(1, #ancillary_list)
				local ancillary_key_selected = ancillary_list[random_index]
				if character:can_equip_ancillary(ancillary_key_selected) then
					cm:force_add_ancillary(cm:char_lookup_str(character), ancillary_key_selected)
					break
				end
			end
			
			i = i + 1
		end
	end,

	--- @function fully_equip_general
	--- @desc the function is used in the fully_equipped_generals modular difficulty
	--- @p character a CHARACTER_SCRIPT_INTERFACE object
	--- @p ancillaries_categorized an indexed table of key-value tables containing ancillary_keys separated by category (for "category" refer to modular_difficulty_campaign.config.fully_equipped_generals.ancillary_categories)
	fully_equip_general = function(character, ancillaries_categorized)
		if not character or character:is_null_interface() or not character:character_type("general") then
			return
		end

		local ancillary_categories = modular_difficulty_campaign.config.fully_equipped_generals.ancillary_categories

		if modular_difficulty_campaign.config.fully_equipped_generals.randomize_order_of_ancillary_assignment then
			-- generate random indices table
			local random_indices = {}
			for i = 1, #ancillary_categories do
				table.insert(random_indices, i)
			end
			random_indices = cm:random_sort(random_indices)

			for _, index in ipairs(random_indices) do
				local pair = ancillary_categories[index]
				local category_string = pair.category
				local ancillary_list = ancillaries_categorized[category_string]
				modular_difficulty_campaign.utility_functions.give_ancillaries_of_category(character, ancillary_list, category_string)
			end
		else
			for _, pair in ipairs(ancillary_categories) do
				local ancillary_list = ancillaries_categorized[pair.category]
				modular_difficulty_campaign.utility_functions.give_ancillaries_of_category(character, ancillary_list, pair.category)
			end
		end
	end,

	total_annihilation_execution = function(previous_faction)
		if not previous_faction:is_null_interface() and not previous_faction:confederation_in_progress() then 
			if previous_faction:region_list():num_items() == 0 then
				--collect all armies of the previous faction
				local force_list = previous_faction:military_force_list()
				if not modular_difficulty_campaign.variables.no_rebellions then 
					for i = 0, force_list:num_items() - 1 do 
						local force = force_list:item_at(i)

						cm:instantly_make_force_local_rebel(force)
					end
				end
			end
		end
	end,

	make_faction_leaders_mortal = function()
		local faction_keys_list = cm:get_factions_at_campaign_start()
		if is_table(faction_keys_list) then
			for _, faction_key in ipairs(faction_keys_list) do
				local faction_leader_character = cm:get_faction(faction_key):faction_leader()
				if faction_leader_character and not faction_leader_character:is_null_interface() then
					local character_cqi = faction_leader_character:command_queue_index()
					local character_lookup_string = "character_cqi:" .. tostring(character_cqi)
					cm:set_character_immortality(character_lookup_string, false)
					cm:set_ignore_immortality_by_trait(character_lookup_string, true)
					cm:remove_effect_bundle_from_character("effect_bundle_dummy_immortality", character_cqi)
				end
			end
		end
	end,
}

modular_difficulty_campaign.is_enabled = false

modular_difficulty_campaign.variables = {
	no_retreat = false,
	vanguard_deployment = false,
	sea_people_invasions = false,
	next_turn_flag = false,
	total_annihilation = false,
	no_rebellions = false,
	no_fog_of_war = false,
	maat_extra_disaster_chance = {},
	excluded_god_culture_keys = {},
	cai_legitimacy_modifier_value = 0,
}

mdm = modular_difficulty_manager:new()
local mdm_enabled = core:svr_load_bool("mdm_enabled")
if mdm_enabled then
	modular_difficulty_campaign.is_enabled = true
	mdm:load_state_from_svr()
end

core:add_listener(
	"campaign_ui_tmp",
	"UICreated",
	function()
		return modular_difficulty_campaign.is_enabled
	end,
	function(context)
		mdm:add_listeners()
	end,
	false
)

core:add_listener(
	"mdm_new_campaign_init",
	"NewCampaignStarted",
	function()
		return modular_difficulty_campaign.is_enabled
	end,
	function(context)
		for setting_name, data in pairs(mdm.state) do 
			if modular_difficulty_campaign.settings[setting_name] and is_function(modular_difficulty_campaign.settings[setting_name].callback_on_new_campaign_started_event) then
				modular_difficulty_campaign.settings[setting_name].callback_on_new_campaign_started_event()
			end
		end
	end,
	false
)

core:add_listener(
	"mdm_first_tick_new_campaign_init",
	"FirstTickAfterNewCampaignStarted",
	function()
		return modular_difficulty_campaign.is_enabled
	end,
	function(context)
		for setting_name,data in pairs(mdm.state) do 
			if modular_difficulty_campaign.settings[setting_name] and modular_difficulty_campaign.settings[setting_name].callback then
				modular_difficulty_campaign.settings[setting_name].callback()
			end
		end

		modular_difficulty_campaign.utility_functions.setup_allowed_gods()
		if (mdm.state["gods_autodiscovered"] and mdm.state["gods_autodiscovered"].value == 1) then
			modular_difficulty_campaign.utility_functions.autodiscover_gods()
		end
	end,
	false
)

core:add_listener(
	"mdm_state_update",
	"ScriptEventModularDifficultyManagerStateUpdated",
	function()
		return modular_difficulty_campaign.is_enabled and cm:is_game_running()
	end,
	function()
		for setting_name,data in pairs(mdm.state) do 
			local setting = modular_difficulty_campaign.settings[setting_name]
			if setting and 
				setting.callback and
				setting.ui and
				setting.ui.campaign_changeable
			then
				setting.callback(true)
			end
		end
		core:trigger_event("ScriptEventModularDifficultyStateCallbackFinished")
	end,
	true
)

core:add_listener(
	"total_annihilation_trigger",
	"RegionFactionChangeEvent",
	function(context)
		return modular_difficulty_campaign.is_enabled and modular_difficulty_campaign.variables.total_annihilation and cm:is_game_running()
	end,
	function(context)
		modular_difficulty_campaign.utility_functions.total_annihilation_execution(context:previous_faction())
	end,
	true
)

core:add_listener(
	"total_annihilation_setting_check",
	"ScriptEventModularDifficultyStateCallbackFinished",
	function(context) 
		return modular_difficulty_campaign.is_enabled and modular_difficulty_campaign.variables.total_annihilation and cm:is_game_running()
	end,
	function()
		local faction_list = cm:model():world():faction_list()
		local invading_factions = {}
		table_append(invading_factions, pillars_civilization.config.nomads_factions)
		table_append(invading_factions, pillars_civilization.config.sea_peoples_factions)

		for i = 0, faction_list:num_items() - 1 do
			local current_faction = faction_list:item_at(i);
			if current_faction:culture() ~= "phar_main_clt_sea_peoples" then
				if not table_contains(invading_factions, current_faction:name()) then
				modular_difficulty_campaign.utility_functions.total_annihilation_execution(current_faction)
			end
		end
	end
	end
)

core:add_listener(
	"next_turn_sea_people_flag",
	"RoundStart",
	function(context)
		return modular_difficulty_campaign.variables.next_turn_flag 
	end,
	function(context)
		local faction_list = cm:model():world():faction_list()
		--collect sea people 
		for i = 0, faction_list:num_items() - 1 do
			local curr_faction = faction_list:item_at(i)
			if curr_faction:culture() == "phar_main_clt_sea_peoples" and not curr_faction:is_major() then
				local owned_regions = curr_faction:region_list() 
				for i = 0, owned_regions:num_items() - 1 do 
					cm:set_region_abandoned(owned_regions:item_at(i):name())	
				end
				cm:kill_all_armies_for_faction(curr_faction)
			end
		end
		modular_difficulty_campaign.variables.next_turn_flag = false
	end,
	true
)

core:add_listener(
	"modular_difficulty_enable_no_retreat_on_round_start",
	"RoundStart",
	function(context)
		return modular_difficulty_campaign.variables and modular_difficulty_campaign.variables.no_retreat
	end,
	function(context)
		local faction_list = cm:model():world():faction_list()
		for i = 0, faction_list:num_items() - 1 do
			local fac = faction_list:item_at(i)
			local char_list = fac:character_list()
			for i = 0, char_list:num_items() - 1 do
				local curr_char = char_list:item_at(i)
				cm:set_force_has_retreated_this_turn(curr_char)
			end
		end
	end,
	true
)

core:add_listener(
	"modular_difficulty_update_no_retreat_on_faction_turn_start",
	"FactionTurnStart",
	function(context)
		return modular_difficulty_campaign.variables and modular_difficulty_campaign.variables.no_retreat
	end,
	function(context)
		local fac = context:faction()
		local char_list = fac:character_list()
		for i = 0, char_list:num_items() - 1 do
			local curr_char = char_list:item_at(i)
			cm:set_force_has_retreated_this_turn(curr_char)
		end
	end,
	true
)

core:add_listener(
	"modular_difficulty_update_no_retreat_on_character_created",
	"CharacterCreated",
	function(context)
		return modular_difficulty_campaign.variables and modular_difficulty_campaign.variables.no_retreat
	end,
	function(context)
		cm:set_force_has_retreated_this_turn(context:character())
	end,
	true
)

core:add_listener(
	"modular_difficulty_update_no_retreat_on_prebattle_ui",
	"PanelOpenedCampaign",
	function(context)
		return modular_difficulty_campaign.variables and modular_difficulty_campaign.variables.no_retreat and context.string == "popup_pre_battle"
	end,
	function(context)
		local retreat_button = core:get_ui_root():SequentialFind("popup_pre_battle", "button_retreat")
		retreat_button:SetInteractive(false)
	end,
	true
)

cm:add_first_tick_callback(
	function()
		core:trigger_event(mdm.update_trigger_event_name)
	end
)

-- Always override the modular difficulty manager's state with what we have in the save file, unless we start a new campaign,
-- since while processing the campaign (and making the initial save file), there is no frontend to setup some default modular difficulty settings.
local override_mdm_state = false

cm:add_saving_game_callback(
	function(context)
		cm:save_named_value("PHAR_MODULAR_DIFFICULTY_ENABLED", modular_difficulty_campaign.is_enabled, context)
		cm:save_named_value("PHAR_MODULAR_DIFFICULTY_OVERRIDE_STATE", override_mdm_state, context)
		cm:save_named_value("PHAR_MODULAR_DIFFICULTY_STATE", mdm.state, context)
	end
)

cm:add_loading_game_callback(
	function(context)
		modular_difficulty_campaign.is_enabled = cm:load_named_value("PHAR_MODULAR_DIFFICULTY_ENABLED", modular_difficulty_campaign.is_enabled, context) or modular_difficulty_campaign.is_enabled

		override_mdm_state = cm:load_named_value("PHAR_MODULAR_DIFFICULTY_OVERRIDE_STATE", override_mdm_state, context)
		if override_mdm_state then
			mdm.state = cm:load_named_value("PHAR_MODULAR_DIFFICULTY_STATE", mdm.state, context)
		end

		-- Support for old saves when we add new settings
		for setting_name, new_state in pairs(modular_difficulty_campaign.mdm_new_state) do
			if not mdm.state[setting_name] then
				mdm.state[setting_name] = {
					value = new_state.value
				}
			end
		end

		for setting_name,data in pairs(mdm.state) do 
			if modular_difficulty_campaign.settings[setting_name] 
				and is_function(modular_difficulty_campaign.settings[setting_name].on_load)
			then
				modular_difficulty_campaign.settings[setting_name].on_load()
			end
		end

		-- When we load the game once, we want to start overriding the modular difficulty manager's state
		-- (use the state the game was started with, instead of the state currently set in the frontend).
		override_mdm_state = true
	end
)