out("Loading phar_feature_unlock_config.lua")

feature_ids_config = 
{
	pillars_of_civilization = "pillars_of_civilization",
	royal_decrees = "royal_decrees",
	local_deities = "local_deities",
	commands = "commands",
	legitimacy_path = "legitimacy_path",
	court = "court",
	ancient_legacy = "ancient_legacy",
	pharaohs_crown = "pharaohs_crown",
}

local feature_unlock_prefabs = {
	common_use_setup = {
		{ feature = feature_ids_config.royal_decrees, unlock_turn = 1 },
		{ feature = feature_ids_config.local_deities, unlock_turn = 3 },
		{ feature = feature_ids_config.pillars_of_civilization, unlock_turn = 3 },
		{ feature = feature_ids_config.commands, unlock_turn = 6 },
		{ feature = feature_ids_config.court, unlock_turn = 9 },
		{ feature = feature_ids_config.legitimacy_path, unlock_turn = 9 },
		{ feature = feature_ids_config.pharaohs_crown, unlock_turn = 9 },
		{ feature = feature_ids_config.ancient_legacy, unlock_turn = 9 },
	},
	early_court_setup = {
		{ feature = feature_ids_config.royal_decrees, unlock_turn = 1 },
		{ feature = feature_ids_config.local_deities, unlock_turn = 3 },
		{ feature = feature_ids_config.pillars_of_civilization, unlock_turn = 3 },
		{ feature = feature_ids_config.commands, unlock_turn = 6 },
		{ feature = feature_ids_config.court, unlock_turn = 6 },
		-- { feature = feature_ids_config.legitimacy_path, unlock_turn = 9 }, -- By commenting out, faction starts as part of Royal Tradition it has a Court Position in.
		{ feature = feature_ids_config.pharaohs_crown, unlock_turn = 9 },
		{ feature = feature_ids_config.ancient_legacy, unlock_turn = 9 },
	}
}

feature_unlock = {}

feature_unlock.config = 
{
	-- MAJOR FACTIONS - EGYPT
	["phar_main_ramesses"] = feature_unlock_prefabs.common_use_setup,

	["phar_main_seti"] = feature_unlock_prefabs.early_court_setup,

	["phar_main_tausret"] = feature_unlock_prefabs.early_court_setup,

	["phar_main_amenmesse"] = feature_unlock_prefabs.early_court_setup,
	
	-- MINOR FACTIONS - EGYPT
	["phar_main_merneptah"] = feature_unlock_prefabs.early_court_setup,
	
	["phar_main_setnakhte"] = feature_unlock_prefabs.common_use_setup,
	
	["phar_main_napata"] = feature_unlock_prefabs.common_use_setup,
	
	["phar_main_dungul"] = feature_unlock_prefabs.common_use_setup,
	
	["phar_main_bahariya"] = feature_unlock_prefabs.common_use_setup,
	
	-- MAJOR FACTIONS - CANAAN
	["phar_main_irsu"] = feature_unlock_prefabs.common_use_setup,
	
	["phar_main_bay"] = feature_unlock_prefabs.common_use_setup,
	
	-- MINOR FACTIONS - CANAAN
	["phar_main_ugarit"] = feature_unlock_prefabs.common_use_setup,
	
	["phar_main_ashkelon"] = feature_unlock_prefabs.common_use_setup,
	
	["phar_main_byblos"] = feature_unlock_prefabs.common_use_setup,
	
	["phar_main_damascus"] = feature_unlock_prefabs.common_use_setup,
	
	["phar_main_emar"] = feature_unlock_prefabs.common_use_setup,
	
	-- MAJOR FACTIONS - HATTI
	["phar_main_suppiluliuma"] = feature_unlock_prefabs.early_court_setup,
	
	["phar_main_kurunta"] = feature_unlock_prefabs.common_use_setup,
	
	-- MINOR FACTIONS - HATTI
	["phar_main_carchemish"] = feature_unlock_prefabs.common_use_setup,
	
	["phar_main_alashiya"] = feature_unlock_prefabs.common_use_setup,
	
	["phar_main_malidiya"] = feature_unlock_prefabs.common_use_setup,
	
	["phar_map_sangarian_phrygians"] = feature_unlock_prefabs.common_use_setup,
	
	["troy_amazons_trj_hippolyta"] = feature_unlock_prefabs.common_use_setup,
	
	-- FACTIONS - SEA PEOPLE
	["phar_sea_sherden"] = feature_unlock_prefabs.common_use_setup,
	
	["phar_sea_peleset"] = feature_unlock_prefabs.common_use_setup,
	
	-- MAJOR FACTIONS - MESOPOTAMIA
	["phar_map_ninurta"] = feature_unlock_prefabs.early_court_setup,
	
	["phar_map_babylon"] = feature_unlock_prefabs.early_court_setup,
	
	-- MINOR FACTIONS - MESOPOTAMIA
	["phar_map_assyria"] = feature_unlock_prefabs.early_court_setup,
	
	["phar_map_igihalkid"] = feature_unlock_prefabs.early_court_setup,
	
	["phar_map_sutu"] = feature_unlock_prefabs.common_use_setup,
	
	["phar_map_lullubi"] = feature_unlock_prefabs.common_use_setup,
	
	["phar_map_shubru"] = feature_unlock_prefabs.common_use_setup,
	
	-- MAJOR FACTIONS - AEGEA
	["troy_main_dan_mycenae"] = feature_unlock_prefabs.early_court_setup,
	
	["troy_main_trj_troy"] = feature_unlock_prefabs.early_court_setup,
	
	-- MINOR FACTIONS - AEGEA
	["troy_main_dan_achilles"] = feature_unlock_prefabs.common_use_setup,
	
	["troy_main_dan_ithaca"] = feature_unlock_prefabs.common_use_setup,
	
	["troy_main_dan_boeotians"] = feature_unlock_prefabs.common_use_setup,
	
	["troy_main_trj_lycia"] = feature_unlock_prefabs.common_use_setup,
	
	["troy_rem_trj_thrace"] = feature_unlock_prefabs.common_use_setup,
	
}

feature_unlock.shemsu_hor_localised_strings = 
{
	[feature_ids_config.pillars_of_civilization] = "campaign_localised_strings_string_phar_main_shemsu_hor_feature_unlock_pillars_of_civilization",
	[feature_ids_config.royal_decrees] = "campaign_localised_strings_string_phar_main_shemsu_hor_feature_unlock_royal_decrees",
	[feature_ids_config.local_deities] = "campaign_localised_strings_string_phar_main_shemsu_hor_feature_unlock_local_deities",
	[feature_ids_config.commands] = "campaign_localised_strings_string_phar_main_shemsu_hor_feature_unlock_commands",
	[feature_ids_config.legitimacy_path] = "campaign_localised_strings_string_phar_main_shemsu_hor_feature_unlock_legitimacy_path",
	[feature_ids_config.court] = "campaign_localised_strings_string_phar_main_shemsu_hor_feature_unlock_court",
	[feature_ids_config.ancient_legacy] = "campaign_localised_strings_string_phar_main_shemsu_hor_feature_unlock_ancient_legacy",
	[feature_ids_config.pharaohs_crown] = "campaign_localised_strings_string_phar_main_shemsu_hor_feature_unlock_pharaohs_crown",
}

feature_unlock.shemsu_hor_feature_icons = 
{
	[feature_ids_config.pillars_of_civilization] = "UI/skins/default/shemsu_hor_notification/icon_poc_early_legacy_selection.png",
	[feature_ids_config.royal_decrees] = "UI/skins/default/faction_widget/phar_fw_icon_local_decrees.png",
	[feature_ids_config.local_deities] = "UI/skins/default/faction_widget/phar_fw_icon_local_deities.png",
	[feature_ids_config.commands] = 
	{
		["phar_main_ramesses"] = "UI/skins/default/faction_summary/icons/phar_summary_icon_commands_ramesses.png",
		["phar_main_seti"] = "UI/skins/default/faction_summary/icons/phar_summary_icon_commands_seti.png",
		["phar_main_tausret"] = "UI/skins/default/faction_summary/icons/phar_summary_icon_commands_tausret.png",
		["phar_main_amenmesse"] = "UI/skins/default/faction_summary/icons/phar_summary_icon_commands_amenmesse.png",
		["phar_main_irsu"] = "UI/skins/default/faction_summary/icons/phar_summary_icon_commands_irsu.png",
		["phar_main_bay"] = "UI/skins/default/faction_summary/icons/phar_summary_icon_commands_bay.png",
		["phar_main_suppiluliuma"] = "UI/skins/default/faction_summary/icons/phar_summary_icon_commands_suppiluliuma.png",
		["phar_main_kurunta"] = "UI/skins/default/faction_summary/icons/phar_summary_icon_commands_kurunta.png",
		["phar_sea_sherden"] = "UI/skins/default/faction_summary/icons/icon_commands_iolaos.png",
		["phar_sea_peleset"] = "UI/skins/default/faction_summary/icons/icon_commands_walwetes.png",
		["phar_map_ninurta"] = "UI/skins/default/faction_summary/icons/phar_map_summary_icon_commands_assyria.png",
		["phar_map_babylon"] = "UI/skins/default/faction_summary/icons/phar_map_summary_icon_commands_babilim.png",
		["troy_main_dan_mycenae"] = "UI/skins/default/faction_summary/icons/phar_map_summary_icon_commands_mycenae.png",
		["troy_main_trj_troy"] = "UI/skins/default/faction_summary/icons/phar_map_summary_icon_commands_troy.png",
	},
	[feature_ids_config.legitimacy_path] = "UI/skins/default/shemsu_hor_notification/icon_royal_traditions_early_legacy_selection.png",
	[feature_ids_config.court] = "UI/skins/default/faction_widget/phar_fw_icon_local_court.png",
	[feature_ids_config.ancient_legacy] = "UI/skins/default/faction_widget/phar_fw_icon_local_legacy_selection.png",
	[feature_ids_config.pharaohs_crown] = "UI/skins/default/faction_widget/phar_fw_icon_crown.png",
}

feature_unlock.feature_unlocked_alert_icons = 
{
	{ feature = feature_ids_config.royal_decrees, component_id = "technology_alert_icon_unlocked", button_id = "button_technology", panel_id = "technology_panel"},
	{ feature = feature_ids_config.local_deities, component_id = "local_deities_alert_icon_unlocked", button_id = "button_local_deities", panel_id = "local_deities"},
	{ feature = feature_ids_config.court, component_id = "court_alert_icon_unlocked", button_id = "button_phar_court", panel_id = "court"},
	{ feature = feature_ids_config.ancient_legacy, component_id = "ancient_legacy_alert_icon_unlocked", button_id = "button_fm_phar_ancient_legacies", panel_id = "legacy_selection"},
	{ feature = feature_ids_config.pharaohs_crown, component_id = "crown_alert_icon_unlocked", button_id = "button_fm_phar_pharaoh_crown", panel_id = "pharaohs_crown" }
}

feature_unlock.get_feature_unlock_turn_for_faction = function(faction_key, feature_id)
	if modular_difficulty_campaign.variables.all_features_unlocked then
		return 1
	end
	local features_for_faction = feature_unlock.config[faction_key] or {}
	for index, feature_table in ipairs(features_for_faction) do
		if feature_table.feature == feature_id then
			return feature_table.unlock_turn or 1
		end
	end
	return 1
end

feature_unlock.is_feature_unlocked_for_faction = function(faction_key, feature_id)
	if modular_difficulty_campaign.variables.all_features_unlocked then
		return true
	end
	local turn_number = cm:model():turn_number()
	local unlock_turn = feature_unlock.get_feature_unlock_turn_for_faction(faction_key, feature_id)
	local is_unlocked = turn_number >= unlock_turn
	return is_unlocked
end

feature_unlock.unlock_everything_for_everyone = function()
	for faction_key, faction_features in dpairs(feature_unlock.config) do
		for _index, feature_table in ipairs(faction_features) do
			local event_data =
			{
				faction_key = faction_key,
				feature_unlocked = feature_table.feature,
			}

			core:trigger_event("faction_feature_unlocked", event_data)
		end
	end

	local local_faction_key = cm:get_local_faction_name(true)
	if local_faction_key and local_faction_key ~= "" then
		-- ui overrides are unlocked in TurnStart too, so wait a little bit
		cm:callback(feature_unlock.update_feature_unlocked_alerts, 0.2)
	end
end

feature_unlock.update_feature_unlocked_alerts = function()
	if not cm:has_local_faction() then
		if not common.is_autotest() then
			script_error("ERROR: No local faction available")
		end
 		return
 	end

	local local_faction_cqi = cm:get_local_faction(true):command_queue_index()

	for _, alert_icon_data in ipairs(feature_unlock.feature_unlocked_alert_icons) do

		local alert = core:get_ui_root():SequentialFind("faction_widget", alert_icon_data.component_id)
		if alert then
			local hud_button = core:get_ui_root():SequentialFind("faction_widget", alert_icon_data.button_id)
			local is_really_unlocked = hud_button and hud_button:Visible() and not string.find(hud_button:CurrentState(), "inactive")

			alert:SetVisible(is_really_unlocked and not cm:get_saved_value(tostring(local_faction_cqi) .. "unlock_alert" .. alert_icon_data.feature))
		end
	end
end

-- cheat intended for local testing, and does not persist in the save
-- use responsibly
feature_unlock.cheat_unlock_feature = function(faction_key, feature_id)
	local features_for_faction = feature_unlock.config[faction_key] or {}
	for index, feature_table in ipairs(features_for_faction) do
		if feature_table.feature == feature_id then
			feature_table.unlock_turn = 1

			local faction = cm:get_faction(faction_key)
			if faction and not faction:is_null_interface() then
				cm:set_script_state(faction, "faction_feature_unlocked_" .. feature_table.feature, true)
			end

			if faction_key == cm:get_local_faction_name(true) then
				common.send_ui_update_message("new_feature_unlocked")
			end

			return
		end
	end
end

--feature_unlock_FactionTurnStart
core:add_listener(
	"feature_unlock_FactionTurnStart",
	"FactionTurnStart",
	true,
	function(context)
		local faction_key = context:faction():name()
		local features_for_faction = feature_unlock.config[faction_key]
		if not features_for_faction then
			return
		end

		local turn_number = cm:model():turn_number()
		local any_unlocked = false
		for index, feature_table in ipairs(features_for_faction) do
			if feature_table.unlock_turn == turn_number then
				local event_data =
				{
					faction_key = faction_key,
					feature_unlocked = feature_table.feature,
				}

				core:trigger_event("faction_feature_unlocked", event_data)
				any_unlocked = true

				cm:set_script_state(context:faction(), "faction_feature_unlocked_" .. feature_table.feature, true)
			end
		end

		if any_unlocked and faction_key == cm:get_local_faction_name(true) then
			-- ui overrides are unlocked in TurnStart too, so wait a little bit
			cm:callback(feature_unlock.update_feature_unlocked_alerts, 0.2)

			common.send_ui_update_message("new_feature_unlocked")
		end
	end,
	true
)

core:add_listener(
	"feature_unlock_FactionTurnStart_FirstTickAfterWorldCreated",
	"FirstTickAfterWorldCreated",
	true,
	function(context)
		-- On the first tick the ui overrides are not initialized, so wait a little bit
		cm:callback(feature_unlock.update_feature_unlocked_alerts, 0.2)
	end,
	false
)

core:add_listener(
	"feature_unlock_PanelOpenedCampaign",
	"PanelOpenedCampaign",
	true,
	function(context)
		local local_faction = cm:get_local_faction(true)
		if not local_faction then
			return
		end
		for _, alert_icon_data in ipairs(feature_unlock.feature_unlocked_alert_icons) do
			local local_faction_cqi = local_faction:command_queue_index()
			if alert_icon_data.panel_id == context.string and not cm:get_saved_value(tostring(local_faction_cqi) .. "unlock_alert" .. alert_icon_data.feature) then
				CampaignUI.TriggerCampaignScriptEvent(local_faction_cqi, "feature_alert_seen:" .. alert_icon_data.feature)
				return
			end
		end
	end,
	true
)

core:add_listener(
		"feature_unlock_UITriggerScriptEvent",
		"UITriggerScriptEvent",
		true,
		function(context)
			local params = context:trigger():split(":")
			if params[1] ~= "feature_alert_seen" then
				return
			end

			local faction_cqi = context:faction_cqi()
			local feature_id = params[2]

			cm:set_saved_value(tostring(faction_cqi) .. "unlock_alert" .. feature_id, true)

			local local_faction = cm:get_local_faction(true)
			if local_faction and faction_cqi == local_faction:command_queue_index() then
				feature_unlock.update_feature_unlocked_alerts()
		end
	end,
	true
)