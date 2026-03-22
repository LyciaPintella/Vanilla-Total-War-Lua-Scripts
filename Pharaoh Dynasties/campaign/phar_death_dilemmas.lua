out("Loading phar_death_dilemmas.lua")

local function output(str)
	if str then
		out("*** phar_death_dilemmas ***: " .. str)
	end
end


death_dilemmas =
{
	config =
	{
		death_types = {
			character_battle_death = "character_battle_death",
			faction_leader_battle_death = "faction_leader_battle_death",
			character_natural_death = "character_natural_death",
			faction_leader_natural_death = "faction_leader_natural_death",
			character_assassinated = "character_assassinated",
		},

		dilemmas =
		{
			--[[
			{
				-- this serves as a template dilemma entry

				death_type = "character_battle_death",				-- has to be a string defined in the table death_dilemmas.config.death_types
				key = "phar_comb_dilemma_character_battle_death_1",	-- dilemma database key
				applicable_cultures =								-- this dilemmas will only be viable for factions of the following cultures:
				{
					"phar_main_clt_kemet",
					"phar_main_clt_sea_peoples",
				},
				weight = 1,											-- the weight of the dilemma

				-- The following 3 functions can be optionally defined for each dilemma entry separately, to customize its behavior:
				get_payloads = function(self, faction),
				trigger = function(self, faction),
				on_resolve = function(self, choice, faction),
				-- Otherwise the default functions get_dilemma_payloads, trigger_dilemma and on_dilemma_resolved respectively, defined below the config table, will be used instead.
			},
			--]]

			-- character_battle_death
			{
				death_type = "character_battle_death",
				key = "phar_map_gen_character_battle_death_aegean_1",
				applicable_cultures =
				{
					"troy_main_clt_danaans",
					"troy_main_clt_trojans",
					"troy_rem_clt_thraco_phrygians",
				},
				weight = 1,
			},
			{
				death_type = "character_battle_death",
				key = "phar_map_gen_character_battle_death_aegean_2",
				applicable_cultures =
				{
					"troy_main_clt_danaans",
					"troy_main_clt_trojans",
					"troy_rem_clt_thraco_phrygians",
				},
				weight = 1,
			},
			{
				death_type = "character_battle_death",
				key = "phar_map_gen_character_battle_death_aegean_3",
				applicable_cultures =
				{
					"troy_main_clt_danaans",
					"troy_main_clt_trojans",
					"troy_rem_clt_thraco_phrygians",
				},
				weight = 1,
			},
			{
				death_type = "character_battle_death",
				key = "phar_map_gen_character_battle_death_meso_1",
				applicable_cultures =
				{
					"phar_map_clt_mesopotamian",
				},
				weight = 1,
			},
			{
				death_type = "character_battle_death",
				key = "phar_map_gen_character_battle_death_meso_2",
				applicable_cultures =
				{
					"phar_map_clt_mesopotamian",
				},
				weight = 1,
			},
			{
				death_type = "character_battle_death",
				key = "phar_map_gen_character_battle_death_meso_3",
				applicable_cultures =
				{
					"phar_map_clt_mesopotamian",
				},
				weight = 1,
			},
			{
				death_type = "character_battle_death",
				key = "phar_map_gen_character_battle_death_hittite_1",
				applicable_cultures =
				{
					"phar_main_clt_hatti",
					"phar_main_clt_canaan"
				},
				weight = 1,
			},
			{
				death_type = "character_battle_death",
				key = "phar_map_gen_character_battle_death_hittite_2",
				applicable_cultures =
				{
					"phar_main_clt_hatti",
					"phar_main_clt_canaan"
				},
				weight = 1,
			},
			{
				death_type = "character_battle_death",
				key = "phar_map_gen_character_battle_death_hittite_3",
				applicable_cultures =
				{
					"phar_main_clt_hatti",
					"phar_main_clt_canaan"
				},
				weight = 1,
			},
			{
				death_type = "character_battle_death",
				key = "phar_map_gen_character_battle_death_kemet_1",
				applicable_cultures =
				{
					"phar_main_clt_kemet"
				},
				weight = 1,
			},
			{
				death_type = "character_battle_death",
				key = "phar_map_gen_character_battle_death_kemet_2",
				applicable_cultures =
				{
					"phar_main_clt_kemet"
				},
				weight = 1,
			},
			{
				death_type = "character_battle_death",
				key = "phar_map_gen_character_battle_death_kemet_3",
				applicable_cultures =
				{
					"phar_main_clt_kemet"
				},
				weight = 1,
			},
			{
				death_type = "character_battle_death",
				key = "phar_map_gen_character_battle_death_sea_peoples_1",
				applicable_cultures =
				{
					"phar_main_clt_sea_peoples"
				},
				weight = 1,
			},
			{
				death_type = "character_battle_death",
				key = "phar_map_gen_character_battle_death_sea_peoples_2",
				applicable_cultures =
				{
					"phar_main_clt_sea_peoples"
				},
				weight = 1,
			},
			{
				death_type = "character_battle_death",
				key = "phar_map_gen_character_battle_death_sea_peoples_3",
				applicable_cultures =
				{
					"phar_main_clt_sea_peoples"
				},
				weight = 1,
			},

			-- faction_leader_battle_death
			{
				death_type = "faction_leader_battle_death",
				key = "phar_map_leader_character_battle_death_aegean_1",
				applicable_cultures =
				{
					"troy_main_clt_danaans",
					"troy_main_clt_trojans",
					"troy_rem_clt_thraco_phrygians",
				},
				weight = 1,
			},
			{
				death_type = "faction_leader_battle_death",
				key = "phar_map_leader_character_battle_death_meso_1",
				applicable_cultures =
				{
					"phar_map_clt_mesopotamian",
				},
				weight = 1,
			},
			{
				death_type = "faction_leader_battle_death",
				key = "phar_map_leader_character_battle_death_hittite_1",
				applicable_cultures =
				{
					"phar_main_clt_hatti",
					"phar_main_clt_canaan"
				},
				weight = 1,
			},
			{
				death_type = "faction_leader_battle_death",
				key = "phar_map_leader_character_battle_death_kemet_1",
				applicable_cultures =
				{
					"phar_main_clt_kemet"
				},
				weight = 1,
			},
			{
				death_type = "faction_leader_battle_death",
				key = "phar_map_leader_character_battle_death_sea_peoples_1",
				applicable_cultures =
				{
					"phar_main_clt_sea_peoples"
				},
				weight = 1,
			},

			-- character_natural_death
			{
				death_type = "character_natural_death",
				key = "phar_map_gen_character_natural_aegean_1",
				applicable_cultures =
				{
					"troy_main_clt_danaans",
					"troy_main_clt_trojans",
					"troy_rem_clt_thraco_phrygians",
				},
				weight = 1,
			},
			{
				death_type = "character_natural_death",
				key = "phar_map_gen_character_natural_aegean_2",
				applicable_cultures =
				{
					"troy_main_clt_danaans",
					"troy_main_clt_trojans",
					"troy_rem_clt_thraco_phrygians",
				},
				weight = 1,
			},
			{
				death_type = "character_natural_death",
				key = "phar_map_gen_character_natural_aegean_3",
				applicable_cultures =
				{
					"troy_main_clt_danaans",
					"troy_main_clt_trojans",
					"troy_rem_clt_thraco_phrygians",
				},
				weight = 1,
			},
			{
				death_type = "character_natural_death",
				key = "phar_map_gen_character_natural_meso_1",
				applicable_cultures =
				{
					"phar_map_clt_mesopotamian",
				},
				weight = 1,
			},
			{
				death_type = "character_natural_death",
				key = "phar_map_gen_character_natural_meso_2",
				applicable_cultures =
				{
					"phar_map_clt_mesopotamian",
				},
				weight = 1,
			},
			{
				death_type = "character_natural_death",
				key = "phar_map_gen_character_natural_meso_3",
				applicable_cultures =
				{
					"phar_map_clt_mesopotamian",
				},
				weight = 1,
			},
			{
				death_type = "character_natural_death",
				key = "phar_map_gen_character_natural_hittite_seas_peaple_kemet_1",
				applicable_cultures =
				{
					"phar_main_clt_hatti",
					"phar_main_clt_canaan",
					"phar_main_clt_kemet",
					"phar_main_clt_sea_peoples"
				},
				weight = 1,
			},
			{
				death_type = "character_natural_death",
				key = "phar_map_gen_character_natural_hittite_seas_peaple_kemet_2",
				applicable_cultures =
				{
					"phar_main_clt_hatti",
					"phar_main_clt_canaan",
					"phar_main_clt_kemet",
					"phar_main_clt_sea_peoples"
				},
				weight = 1,
			},
			{
				death_type = "character_natural_death",
				key = "phar_map_gen_character_natural_hittite_seas_peaple_kemet_3",
				applicable_cultures =
				{
					"phar_main_clt_hatti",
					"phar_main_clt_canaan",
					"phar_main_clt_kemet",
					"phar_main_clt_sea_peoples"
				},
				weight = 1,
			},

			-- faction_leader_natural_death
			{
				death_type = "faction_leader_natural_death",
				key = "phar_map_leader_character_natural_aegean_1",
				applicable_cultures =
				{
					"troy_main_clt_danaans",
					"troy_main_clt_trojans",
					"troy_rem_clt_thraco_phrygians",
				},
				weight = 1,
			},
			{
				death_type = "faction_leader_natural_death",
				key = "phar_map_leader_character_natural_meso_1",
				applicable_cultures =
				{
					"phar_map_clt_mesopotamian",
				},
				weight = 1,
			},
			{
				death_type = "faction_leader_natural_death",
				key = "phar_map_leader_character_natural_hittite_seas_peaple_kemet_1",
				applicable_cultures =
				{
					"phar_main_clt_hatti",
					"phar_main_clt_canaan",
					"phar_main_clt_kemet",
					"phar_main_clt_sea_peoples"
				},
				weight = 1,
			},

			-- character_assassinated
			{
				death_type = "character_assassinated",
				key = "phar_map_common_character_assassinated_aegean_1",
				applicable_cultures =
				{
					"troy_main_clt_danaans",
					"troy_main_clt_trojans",
					"troy_rem_clt_thraco_phrygians",
				},
				weight = 1,
			},
			{
				death_type = "character_assassinated",
				key = "phar_map_common_character_assassinated_meso_1",
				applicable_cultures =
				{
					"phar_map_clt_mesopotamian",
				},
				weight = 1,
			},
			{
				death_type = "character_assassinated",
				key = "phar_map_common_character_assassinatedl_hittite_seas_peaple_kemet_1",
				applicable_cultures =
				{
					"phar_main_clt_hatti",
					"phar_main_clt_canaan",
					"phar_main_clt_kemet",
					"phar_main_clt_sea_peoples"
				},
				weight = 1,
			},
		},
	},


	-------------
	--- FUNCTIONS

	get_dilemma_by_key = function(dilemma_key)
		return table_find(death_dilemmas.config.dilemmas, function(element) return element.key == dilemma_key end)
	end,

	get_dilemma_index_by_key = function(dilemma_key)
		return table_find(death_dilemmas.config.dilemmas, function(element) return element.key == dilemma_key end, true)
	end,

	is_valid_dilemma = function(dilemma_key)
		return death_dilemmas.get_dilemma_by_key(dilemma_key) ~= nil
	end,

	-- unused
	get_dilemmas_of_type = function(dilemma_type)
		local dilemmas = {}
		for _, dilemma_config in ipairs(death_dilemmas.config.dilemmas) do
			if dilemma_config.death_type == dilemma_type then
				table.insert(dilemmas, dilemma_config)
			end
		end

		return dilemmas
	end,

	get_dilemmas_of_type_for_culture = function(dilemma_type, culture_key)
		local dilemmas = {}
		for _, dilemma_config in ipairs(death_dilemmas.config.dilemmas) do
			if dilemma_config.death_type == dilemma_type and table_contains(dilemma_config.applicable_cultures, culture_key) then
				table.insert(dilemmas, dilemma_config)
			end
		end

		return dilemmas
	end,

	select_dilemma = function(dilemma_type, culture_key)
		local dilemmas = death_dilemmas.get_dilemmas_of_type_for_culture(dilemma_type, culture_key)

		local weighted_dilemmas = weighted_list:new()
		for _, dilemma_config in ipairs(dilemmas) do
			weighted_dilemmas:add_item(dilemma_config, dilemma_config.weight)
		end

		if #weighted_dilemmas.items <= 0 then
			return nil
		end

		local dilemma_config, _ = weighted_dilemmas:weighted_select()
		return dilemma_config
	end,

	has_payloads = function(payloads)
		if not is_table(payloads) or table.is_empty(payloads) then
			return false
		end

		for i, payload in ipairs(payloads) do
			if not is_string(payload) or payload == "" or (i == 1 and payload == "payload{}") then
				return false
			end
		end

		return true
	end,

	get_dilemma_payloads = function(dilemma_config, faction)
		-- TODO: add payloads or remove method
		local option1_payload = "payload{}"
		local option2_payload = "payload{}"

		return {
			option1_payload,
			option2_payload,
		}
	end,

	trigger_dilemma = function(dilemma_config, faction)
		return cm:trigger_dilemma_with_targets(faction:command_queue_index(), dilemma_config.key, 0, 0, 0, 0, 0, 0, nil, 0)
	end,

	-- the choices are 0-indexed
	on_dilemma_resolved = function(dilemma_config, choice, faction)
		output("faction '" .. faction:name() .. "' made choice " .. tostring(choice) .. " for dilemma '" .. dilemma_config.key .. "'.")
	end,
}


-------------
--- LISTENERS

-- FACTION_CHARACTER_DIED_OR_WOUNDED (C++)
core:add_listener(
	"phar_death_dilemmas_FactionCharacterDiedOrWounded",
	"FactionCharacterDiedOrWounded",
	true,
	function(context)
		local family_member = context:family_member()
		local character = family_member:character()
		if not character or character:is_null_interface() or character:character_details():is_civilian() then
			return
		end

		local faction = character:faction()
		if not faction:is_human() then
			return
		end

		local is_obedience_general = character:is_obedience_character()
		if is_obedience_general then
			return
		end

		get_death_type = function(death_id, is_faction_leader_death)
			local tbl = {
				--[[DEATH_TYPE_KILLED_IN_ACTION]]
				[1] = is_faction_leader_death and death_dilemmas.config.death_types.faction_leader_battle_death or death_dilemmas.config.death_types.character_battle_death,

				--[[DEATH_TYPE_ASSASSINATED]]
				[2] = death_dilemmas.config.death_types.character_assassinated,

				--[[DEATH_TYPE_OLD_AGE]]
				[3] = is_faction_leader_death and death_dilemmas.config.death_types.faction_leader_natural_death or death_dilemmas.config.death_types.character_natural_death,

				--[[DEATH_TYPE_EXECUTED]]
				[5] = death_dilemmas.config.death_types.character_assassinated,

				--[[DEATH_TYPE_HUNTED_DOWN]]
				[10] = is_faction_leader_death and death_dilemmas.config.death_types.faction_leader_battle_death or death_dilemmas.config.death_types.character_battle_death,

				--[[DEATH_TYPE_DIED_AT_SEA]]
				[12] = is_faction_leader_death and death_dilemmas.config.death_types.faction_leader_battle_death or death_dilemmas.config.death_types.character_battle_death,

				--[[DEATH_TYPE_FAMILY_CHARACTER_CLEAN_UP]]
				[16] = is_faction_leader_death and death_dilemmas.config.death_types.faction_leader_battle_death or death_dilemmas.config.death_types.character_battle_death,
			}
			return tbl[death_id]
		end

		local death_type = get_death_type(context:death_type(), character:is_faction_leader())
		if not is_string(death_type) then
			output("Invalid death_id=" .. tostring(death_id) .. " for death dilemma selection.")
			return
		end

		local dilemma_config = death_dilemmas.select_dilemma(death_type, faction:culture())
		if not dilemma_config then
			output("Missing dilemma config for death_type:" .. death_type .. " and faction culture:" .. faction:culture())
			return
		end
		local has_custom_payload = dilemma_config and is_function(dilemma_config.get_payloads)
		local payloads = has_custom_payload and dilemma_config:get_payloads(faction) or death_dilemmas.get_dilemma_payloads(dilemma_config, faction)
		-- TODO: uncomment the following lines when the dilemmas have been setup in the db:
		local result = death_dilemmas.has_payloads(payloads) and dilemma_config:trigger(faction) or cm:trigger_dilemma_with_targets(faction:command_queue_index(), dilemma_config.key, 0, 0, 0, 0, 0, 0, nil, family_member:command_queue_index())
		if not result then
			script_error("character death dilemma dispatch failed!")
			return
		end
	end,
	true
)

-- DILEMMA_CHOICE_MADE_EVENT (C++)
core:add_listener(
	"phar_death_dilemmas_DilemmaChoiceMadeEvent",
	"DilemmaChoiceMadeEvent",
	true,
	function(context)
		local dilemma_key = context:dilemma()
		local dilemma_config = death_dilemmas.get_dilemma_by_key(dilemma_key)
		if not dilemma_config then
			return
		end

		local has_custom_resolve = dilemma_config and is_function(dilemma_config.on_resolve)
		local faction = context:faction()
		local choice = context:choice()
		local result = has_custom_resolve and dilemma_config:on_resolve(choice, faction) or death_dilemmas.on_dilemma_resolved(dilemma_config, choice, faction)
	end,
	true
)