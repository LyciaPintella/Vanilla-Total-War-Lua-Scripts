out("Loading phar_ancient_legacy_common.lua")

local function output(str)
	if str then
		out("*** _ANCIENT LEGACY COMMON_ ***: " .. str)
	end
end

if common.get_build_type() == "build_type_6" then
	ancient_legacy_files = {
		egyptian_legacies = {
			-- Pharaoh legacies
			"phar_ancient_legacy_khufu",
			"phar_ancient_legacy_akhenaten",
		},
		hittite_legacies = {
			-- Great King of Hatti legacies
			"phar_ancient_legacy_tudhaliya",
			"phar_ancient_legacy_muwatalli",
		},
	}
else
	ancient_legacy_files = {
		egyptian_legacies = {
			-- Pharaoh legacies
			"phar_ancient_legacy_khufu",
			"phar_ancient_legacy_akhenaten",
			"phar_ancient_legacy_hatshepsut",
			"phar_ancient_legacy_thutmose",
		},
		hittite_legacies = {
			-- Great King of Hatti legacies
			"phar_ancient_legacy_tudhaliya",
			"phar_ancient_legacy_muwatalli",
		},
		aegean_legacies = {
			-- Aegean legacies
			"phar_ancient_legacy_perseus",
			"phar_ancient_legacy_atreus",
		},
		meso_legacies = {
			-- King of the Universe legacies
			"phar_ancient_legacy_hammurabi",
			"phar_ancient_legacy_sargon",
		},
	}
end

ancient_legacy_ui_data = {
	phar_ancient_legacy_khufu = {
		localised_name = "ui_text_replacements_localised_text_phar_main_al_khufu_selection_title",
		action_text = "ui_text_replacements_localised_text_phar_main_al_khufu_selection_action",
		main_header = "ui_text_replacements_localised_text_phar_main_al_selection_preview",
		sub_header = "ui_text_replacements_localised_text_phar_main_al_khufu_selection_action",
		sneak_peek_text = "ui_text_replacements_localised_text_phar_main_al_khufu_selection_sneak_peek",
		preview_images_and_text = {
			[1] = {
				image ="UI/skins/default/legacy_selection/legacies_previews/khufu_preview_1_legacy_selection.png",
				text = "ui_text_replacements_localised_text_phar_main_al_khufu_selection_desc_1",
			},
			[2] = {
				image ="UI/skins/default/legacy_selection/legacies_previews/khufu_preview_2_legacy_selection.png",
				text = "ui_text_replacements_localised_text_phar_main_al_khufu_selection_desc_2",
			},
			[3] = {
				image ="UI/skins/default/legacy_selection/legacies_previews/khufu_preview_3_legacy_selection.png",
				text = "ui_text_replacements_localised_text_phar_main_al_khufu_selection_desc_3",
			},
		},
		mechanic_image = "UI/skins/default/legacy_selection/phar_legacy_selection_khufu.png",
		panel_name = "legacy_khufu",
	},

	phar_ancient_legacy_akhenaten = {
		localised_name = "ui_text_replacements_localised_text_phar_main_al_akhenaten_selection_title",
		action_text = "ui_text_replacements_localised_text_phar_main_al_akhenaten_selection_action",
		main_header = "ui_text_replacements_localised_text_phar_main_al_selection_preview",
		sub_header = "ui_text_replacements_localised_text_phar_main_al_akhenaten_selection_action",
		sneak_peek_text = "ui_text_replacements_localised_text_phar_main_al_akhenaten_selection_sneak_peek",
		preview_image = "UI/skins/default/legacy_selection/phar_legacy_selection_akhenaten_preview.png",
		preview_images_and_text = {
			[1] = {
				image ="UI/skins/default/legacy_selection/legacies_previews/akhenaten_preview_1_legacy_selection.png",
				text = "ui_text_replacements_localised_text_phar_main_al_akhenaten_selection_desc_1",
			},
			[2] = {
				image ="UI/skins/default/legacy_selection/legacies_previews/akhenaten_preview_2_legacy_selection.png",
				text = "ui_text_replacements_localised_text_phar_main_al_akhenaten_selection_desc_2",
			},
			[3] = {
				image ="UI/skins/default/legacy_selection/legacies_previews/akhenaten_preview_3_legacy_selection.png",
				text = "ui_text_replacements_localised_text_phar_main_al_akhenaten_selection_desc_3",
			},
		},
		mechanic_image = "UI/skins/default/legacy_selection/phar_legacy_selection_akhenaten.png",
		panel_name = "akhenaten",
	},

	phar_ancient_legacy_hatshepsut = {
		localised_name = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_selection_title",
		action_text = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_selection_action",
		main_header = "ui_text_replacements_localised_text_phar_main_al_selection_preview",
		sub_header = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_selection_action",
		sneak_peek_text = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_selection_sneak_peek",
		preview_image = "UI/skins/default/legacy_selection/phar_legacy_selection_hatshepsut_preview.png",
		preview_images_and_text = {
			[1] = {
				image ="UI/skins/default/legacy_selection/legacies_previews/hatshepsut_preview_1_legacy_selection.png",
				text = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_selection_desc_1",
			},
			[2] = {
				image ="UI/skins/default/legacy_selection/legacies_previews/hatshepsut_preview_2_legacy_selection.png",
				text = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_selection_desc_2",
			},
			[3] = {
				image ="UI/skins/default/legacy_selection/legacies_previews/hatshepsut_preview_3_legacy_selection.png",
				text = "ui_text_replacements_localised_text_phar_main_al_hatshepsut_selection_desc_3",
			},
		},
		mechanic_image = "UI/skins/default/legacy_selection/phar_legacy_selection_hatshepsut.png",
		panel_name = "legacy_hatshepsut",
	},

	phar_ancient_legacy_thutmose = {
		localised_name = "ui_text_replacements_localised_text_phar_main_al_thutmose_selection_title",
		action_text = "ui_text_replacements_localised_text_phar_main_al_thutmose_selection_action",
		main_header = "ui_text_replacements_localised_text_phar_main_al_selection_preview",
		sub_header = "ui_text_replacements_localised_text_phar_main_al_thutmose_selection_action",
		sneak_peek_text = "ui_text_replacements_localised_text_phar_main_al_thutmose_selection_sneak_peek",
		preview_image = "UI/skins/default/legacy_selection/phar_legacy_selection_thutmose_preview.png",
		preview_images_and_text = {
			[1] = {
				image ="UI/skins/default/legacy_selection/legacies_previews/thutmose_preview_1_legacy_selection.png",
				text = "ui_text_replacements_localised_text_phar_main_al_thutmose_selection_desc_1",
			},
			[2] = {
				image ="UI/skins/default/legacy_selection/legacies_previews/thutmose_preview_2_legacy_selection.png",
				text = "ui_text_replacements_localised_text_phar_main_al_thutmose_selection_desc_2",
			},
			[3] = {
				image ="UI/skins/default/legacy_selection/legacies_previews/thutmose_preview_3_legacy_selection.png",
				text = "ui_text_replacements_localised_text_phar_main_al_thutmose_selection_desc_3",
			},
		},
		mechanic_image = "UI/skins/default/legacy_selection/phar_legacy_selection_thutmose.png",
		panel_name = "legacy_thutmose",
	},

	phar_ancient_legacy_tudhaliya = {
		localised_name = "ui_text_replacements_localised_text_phar_main_al_tudhaliya_selection_title",
		action_text = "ui_text_replacements_localised_text_phar_main_al_tudhaliya_selection_action",
		main_header = "ui_text_replacements_localised_text_phar_main_al_selection_preview",
		sub_header = "ui_text_replacements_localised_text_phar_main_al_tudhaliya_selection_action",
		sneak_peek_text = "ui_text_replacements_localised_text_phar_main_al_tudhaliya_selection_sneak_peek",
		preview_image = "UI/skins/default/legacy_selection/phar_legacy_selection_tudhaliya_preview.png",
		preview_images_and_text = {
			[1] = {
				image ="UI/skins/default/legacy_selection/legacies_previews/tudhaliya_preview_1_legacy_selection.png",
				text = "ui_text_replacements_localised_text_phar_main_al_tudhaliya_selection_desc_1",
			},
			[2] = {
				image ="UI/skins/default/legacy_selection/legacies_previews/tudhaliya_preview_2_legacy_selection.png",
				text = "ui_text_replacements_localised_text_phar_main_al_tudhaliya_selection_desc_2",
			},
			[3] = {
				image ="UI/skins/default/legacy_selection/legacies_previews/tudhaliya_preview_3_legacy_selection.png",
				text = "ui_text_replacements_localised_text_phar_main_al_tudhaliya_selection_desc_3",
			},
		},
		mechanic_image = "UI/skins/default/legacy_selection/phar_legacy_selection_tudhaliya.png",
		panel_name = "legacy_tudhaliya",
	},

	phar_ancient_legacy_muwatalli = {
		localised_name = "ui_text_replacements_localised_text_phar_main_al_muwatalli_selection_title",
		action_text = "ui_text_replacements_localised_text_phar_main_al_muwatalli_selection_action",
		main_header = "ui_text_replacements_localised_text_phar_main_al_selection_preview",
		sub_header = "ui_text_replacements_localised_text_phar_main_al_muwatalli_selection_action",
		sneak_peek_text = "ui_text_replacements_localised_text_phar_main_al_muwatalli_selection_sneak_peek",
		preview_image = "UI/skins/default/legacy_selection/phar_legacy_selection_muwatalli_preview.png",
		preview_images_and_text = {
			[1] = {
				image ="UI/skins/default/legacy_selection/legacies_previews/muwatalli_preview_1_legacy_selection.png",
				text = "ui_text_replacements_localised_text_phar_main_al_muwatalli_selection_desc_1",
			},
			[2] = {
				image ="UI/skins/default/legacy_selection/legacies_previews/muwatalli_preview_2_legacy_selection.png",
				text = "ui_text_replacements_localised_text_phar_main_al_muwatalli_selection_desc_2",
			},
			[3] = {
				image ="UI/skins/default/legacy_selection/legacies_previews/muwatalli_preview_3_legacy_selection.png",
				text = "ui_text_replacements_localised_text_phar_main_al_muwatalli_selection_desc_3",
			},
		},
		mechanic_image = "UI/skins/default/legacy_selection/phar_legacy_selection_muwatalli.png",
		panel_name = "legacy_muwatalli",
	},

	phar_ancient_legacy_perseus = {
		localised_name = "ui_text_replacements_localised_text_phar_map_al_perseus_selection_title",
		action_text = "ui_text_replacements_localised_text_phar_map_al_perseus_selection_action",
		main_header = "ui_text_replacements_localised_text_phar_main_al_selection_preview",
		sub_header = "ui_text_replacements_localised_text_phar_map_al_perseus_selection_action",
		sneak_peek_text = "ui_text_replacements_localised_text_phar_map_al_perseus_selection_sneak_peek",
		preview_image = "UI/skins/default/legacy_selection/phar_legacy_selection_perseus_preview.png",
		preview_images_and_text = {
			[1] = {
				image ="UI/skins/default/legacy_selection/legacies_previews/perseus_preview_1_legacy_selection.png",
				text = "ui_text_replacements_localised_text_phar_map_al_perseus_selection_desc_1",
			},
			[2] = {
				image ="UI/skins/default/legacy_selection/legacies_previews/perseus_preview_2_legacy_selection.png",
				text = "ui_text_replacements_localised_text_phar_map_al_perseus_selection_desc_2",
			},
			[3] = {
				image ="UI/skins/default/legacy_selection/legacies_previews/perseus_preview_3_legacy_selection.png",
				text = "ui_text_replacements_localised_text_phar_map_al_perseus_selection_desc_3",
			},
		},
		mechanic_image = "UI/skins/default/legacy_selection/phar_legacy_selection_perseus.png",
		panel_name = "map_legacy_perseus",
	},

	phar_ancient_legacy_atreus = {
		localised_name = "ui_text_replacements_localised_text_phar_map_al_atreus_selection_title",
		action_text = "ui_text_replacements_localised_text_phar_map_al_atreus_selection_action",
		main_header = "ui_text_replacements_localised_text_phar_main_al_selection_preview",
		sub_header = "ui_text_replacements_localised_text_phar_map_al_atreus_selection_action",
		sneak_peek_text = "ui_text_replacements_localised_text_phar_map_al_atreus_selection_sneak_peek",
		preview_image = "UI/skins/default/legacy_selection/phar_legacy_selection_atreus_preview.png",
		preview_images_and_text = {
			[1] = {
				image ="UI/skins/default/legacy_selection/legacies_previews/atreus_preview_1_legacy_selection.png",
				text = "ui_text_replacements_localised_text_phar_map_al_atreus_selection_desc_1",
			},
			[2] = {
				image ="UI/skins/default/legacy_selection/legacies_previews/atreus_preview_2_legacy_selection.png",
				text = "ui_text_replacements_localised_text_phar_map_al_atreus_selection_desc_2",
			},
			[3] = {
				image ="UI/skins/default/legacy_selection/legacies_previews/atreus_preview_3_legacy_selection.png",
				text = "ui_text_replacements_localised_text_phar_map_al_atreus_selection_desc_3",
			},
		},
		mechanic_image = "UI/skins/default/legacy_selection/phar_legacy_selection_atreus.png",
		panel_name = "map_legacy_atreus",
	},

	phar_ancient_legacy_hammurabi = {
		localised_name = "ui_text_replacements_localised_text_phar_map_al_hammurabi_selection_title",
		action_text = "ui_text_replacements_localised_text_phar_map_al_hammurabi_selection_action",
		main_header = "ui_text_replacements_localised_text_phar_main_al_selection_preview",
		sub_header = "ui_text_replacements_localised_text_phar_map_al_hammurabi_selection_action",
		--sneak_peek_text = "ui_text_replacements_localised_text_phar_map_al_hammurabi_selection_sneak_peek", --not used
		preview_image = "UI/skins/default/legacy_selection/phar_legacy_selection_hammurabi_preview.png",
		preview_images_and_text = {
			[1] = {
				image ="UI/skins/default/legacy_selection/legacies_previews/hammurabi_preview_1_legacy_selection.png",
				text = "ui_text_replacements_localised_text_phar_map_al_hammurabi_selection_desc_1",
			},
			[2] = {
				image ="UI/skins/default/legacy_selection/legacies_previews/hammurabi_preview_2_legacy_selection.png",
				text = "ui_text_replacements_localised_text_phar_map_al_hammurabi_selection_desc_2",
			},
			[3] = {
				image ="UI/skins/default/legacy_selection/legacies_previews/hammurabi_preview_3_legacy_selection.png",
				text = "ui_text_replacements_localised_text_phar_map_al_hammurabi_selection_desc_3",
			},
		},
		mechanic_image = "UI/skins/default/legacy_selection/phar_legacy_selection_hammurabi.png",
		panel_name = "map_legacy_hammurabi",
	},

	phar_ancient_legacy_sargon = {
		localised_name = "ui_text_replacements_localised_text_phar_map_al_sargon_selection_title",
		action_text = "ui_text_replacements_localised_text_phar_map_al_sargon_selection_action",
		main_header = "ui_text_replacements_localised_text_phar_main_al_selection_preview",
		sub_header = "ui_text_replacements_localised_text_phar_map_al_sargon_selection_action",
		sneak_peek_text = "ui_text_replacements_localised_text_phar_map_al_sargon_selection_sneak_peek",
		preview_image = "UI/skins/default/legacy_selection/phar_legacy_selection_sargon_preview.png",
		preview_images_and_text = {
			[1] = {
				image ="UI/skins/default/legacy_selection/legacies_previews/phar_map_meso_sargon_preview_1_legacy_selection.png",
				text = "ui_text_replacements_localised_text_phar_map_al_sargon_selection_desc_1",
			},
			[2] = {
				image ="UI/skins/default/legacy_selection/legacies_previews/phar_map_meso_sargon_preview_2_legacy_selection.png",
				text = "ui_text_replacements_localised_text_phar_map_al_sargon_selection_desc_2",
			},
			[3] = {
				image ="UI/skins/default/legacy_selection/legacies_previews/phar_map_meso_sargon_preview_3_legacy_selection.png",
				text = "ui_text_replacements_localised_text_phar_map_al_sargon_selection_desc_3",
			},
		},
		mechanic_image = "UI/skins/default/legacy_selection/phar_map_meso_legacy_selection_sargon.png",
		panel_name = "map_legacy_sargon",
	},
}

ancient_legacy_ai_config = {
	ai_akhenaten_bordered_region = "phar_main_amarna_amarna",
}

ancient_legacy_ai_list = {
	egyptian_legacies = {
		-- Pharaoh legacies
		{
			legacy = "phar_ancient_legacy_khufu",
			weight = 8,
			condition_bonus = 2,
			condition = function(faction_key)
				local wonders = ancient_legacy_common:get_wonder_keys_owned_by_faction(faction_key)
				return #wonders
			end,
		},
		{
			legacy = "phar_ancient_legacy_akhenaten",
			weight = 2,
			condition_bonus = 1,
			condition = function(faction_key)
				local akhenaten_bordered_region = cm:get_region(ancient_legacy_ai_config.ai_akhenaten_bordered_region);
				local akhenaten_adjacent_regions = akhenaten_bordered_region:adjacent_region_list()
				local owned_regions_around_akhenaten_bordered_region = 0
				for i = 0, akhenaten_adjacent_regions:num_items() - 1 do
					local region = akhenaten_adjacent_regions:item_at(i)

					if region:owning_faction():name() == faction_key then
						owned_regions_around_akhenaten_bordered_region = owned_regions_around_akhenaten_bordered_region + 1
					end
				end
				return owned_regions_around_akhenaten_bordered_region
			end
		},
	},

	hittite_legacies = {
		-- Great King of Hatti legacies
		{
			legacy = "phar_ancient_legacy_tudhaliya",
			weight = 1,
			condition_bonus = 0,
			condition = function(faction_key) return 1 end,
		},
		{
			legacy = "phar_ancient_legacy_muwatalli",
			weight = 0, -- AI can't use Muwatalli
			condition_bonus = 0,
			condition = function(faction_key) return 0 end,
		},
	},

	aegean_legacies = {
		{
			legacy = "phar_ancient_legacy_atreus",
			weight = 1,
			condition_bonus = 0,
			condition = function(faction_key) return 1 end,
		},
	},

	meso_legacies = {
		{
			legacy = "phar_ancient_legacy_hammurabi",
			weight = 1,
			condition_bonus = 0,
			condition = function(faction_key) return 1 end,
		},
	},
}

ancient_legacy_common =
{
	-- autogenerated by require_files using ancient_legacy_files.egyptian_legacies, .hittite_legacies, .aegean_legacies and .meso_legacies
	-- only used as templates, the actual legacies are in legacies created using :new_legacy!
	legacies = {
		-- [legacy_file as string] = [template script]
	},

	require_files = function()
		for legacy_group_key, legacy_group in pairs(ancient_legacy_files) do
			for _, legacy_file_name in ipairs(legacy_group) do
				local legacy_def = require(legacy_file_name)
				if legacy_def and is_table(legacy_def) then
					ancient_legacy_common.legacies[legacy_file_name] = legacy_def
				end
			end
		end
	end,

	config = {
		ui = 
		{
			ancient_legacy_panel = "legacy_selection",
			ancient_legacy_select_button = "button_select_legacy",
			legacy_panel_button = "button_fm_phar_ancient_legacies",
			legacy_panel_button_container = "fm_phar_ancient_legacies_container",
			legacy_button_disabled_tooltip = "{{tr:ui_text_replacements_localised_text_phar_main_fac_sum_ancient_legacy_title}}||{{tr:ui_text_replacements_localised_text_button_phar_feature_locked_ancient_legacy}}",
			legacy_button_enabled_tooltip = "{{tr:uied_component_texts_localised_string_button_fm_phar_ancient_legacies_Tooltip_c312be08}}",
			legacy_select_ui_title = "ui_text_replacements_localised_text_phar_sea_al_selection_title",
			legacy_select_ui_confirm = "ui_text_replacements_localised_text_phar_main_al_selection_prompt",
			legacy_select_ui_confirm_sea = "ui_text_replacements_localised_text_phar_sea_al_selection_prompt_sea",
			legacy_select_ui_confirm_dwellings = "ui_text_replacements_localised_text_phar_map_al_selection_prompt_dwellings",
			legacy_select_ui_confirm_refund = "ui_text_replacements_localised_text_phar_map_al_selection_prompt_refund",
			legacy_select_alert_icon = "ancient_legacy_alert_icon",
		},
		events = {
			legacy_chosen = {
				event_key = "ancient_legacy_selected",
			},
		},
	},

	-- only this gets saved, so don't put info that is not autogenerated and you need after reload anywhere else!
	persistent = {
		-- autogenerated by choose_legacy, chosen legacies per faction, 
		claimed = {
			-- [faction_key] = { [legacy_file as string] = legacy, }
		},

		-- this contains data that legacies can share between their instances, 
		-- e.g. phar_ancient_legacy_khufu can have once place for all wonders
		common_persistent = 
		{
			-- [legacy_file as string] = { shared data }
		},

		-- autogenerated by faction_unlock_legacy_group, unlocked group of legacies (egyptian or hittite) per faction, 
		legacy_groups = {
			-- if [legacy_group] is nil means the legacy group is not unlocked
			-- if it is true it means the group is unlocked (if the faction has claimed a legacy from the group it is still unlocked but they will be unable to claim another)
			-- [faction_key] = { [legacy_group (egyptian or hittite for now)] = true/nil,}
		},

		-- autogenerated by choose_legacy, which factions have a legacy. Used to iterate with ipairs to not multiplayer desync 
		factions_with_a_legacy = {
			-- faction_key1
			-- faction_key2,
		},
	},

	-- unlocking legacies
	--{
		--- @function faction_unlock_legacy_group
		--- @desc marks that a faction has access to the ancient legacies from a culture group
		--- @p table self - the ancient_legacy_common table
		--- @p string faction_key - the key for the faction
		--- @p string legacy_group_key - one of the subtables of ancient_legacy_files, either egyptian_legacies, hittite_legacies, aegean_legacies or meso_legacies for now
		faction_unlock_legacy_group = function(self, faction_key, legacy_group_key)
			if not self.persistent.legacy_groups[faction_key] then
				self.persistent.legacy_groups[faction_key] = {}
			end
			local faction_table = self.persistent.legacy_groups[faction_key]

			-- the faction already has this legacy group, we don't need to do anything
			if faction_table[legacy_group_key] then
				return
			end

			-- allow any legacy if campain difficulty setting is true
			-- else, only unlock the legacy group passed as parameter 
			if mdm.state["any_ancient_legacy"].value == 1 then 
				for legacy_group_key, legacy_group in pairs(ancient_legacy_files) do
					faction_table[legacy_group_key] = true
				end
			else 
				faction_table[legacy_group_key] = true
			end

			local local_faction_name = cm:get_local_faction_name(true)
			if local_faction_name == faction_key then
				ancient_legacy_common:update_legacies_button_visibility(true)
			end
		end,

		--- @function faction_can_claim_from_legacies_group
		--- @desc a faction can claim a legacy from a group if they have unlocked a legacy group but have not claimed from it yet
		--- @p table self - the ancient_legacy_common table
		--- @p string faction_key - the key for the faction
		--- @p string legacy_group_key - one of the subtables of ancient_legacy_files, either egyptian_legacies, hittite_legacies, aegean_legacies or meso_legacies for now
		--- @return boolean - true if the faction can claim a legacy, false otherwise
		faction_can_claim_from_legacies_group = function(self, faction_key, legacy_group_key)
			if not is_table(self.persistent) or not is_table(self.persistent.legacy_groups) then
				return false
			end

			local faction_table = self.persistent.legacy_groups[faction_key]
			if not is_table(faction_table) then
				return false
			end

			if not faction_table[legacy_group_key] then
				return false
			end

			-- if the faction has claimed a legacy from this group, it can't claim any more
			local legacies_in_group = ancient_legacy_files[legacy_group_key]
			for _, legacy_file_name in ipairs(legacies_in_group) do
				if self:faction_has_claimed_legacy(faction_key, legacy_file_name) then
					return false
				end
			end

			return true
		end,

		--- @function faction_can_claim_any_legacy
		--- @desc checks if a faction can claim any legacy from any group
		--- @p table self - the ancient_legacy_common table
		--- @p string faction_key - the key for the faction
		--- @return boolean - true if the faction can claim a legacy, false otherwise
		faction_can_claim_any_legacy = function(self, faction_key)
			local turn_number = cm:turn_number()
			local has_active_legacy = is_table(self.persistent.claimed[faction_key])
			for legacy_group_key, legacy_group in pairs(ancient_legacy_files) do
				if self:faction_can_claim_from_legacies_group(faction_key, legacy_group_key) then
					if turn_number >= feature_unlock.get_feature_unlock_turn_for_faction(faction_key, feature_ids_config.pharaohs_crown) 
						and turn_number >= feature_unlock.get_feature_unlock_turn_for_faction(faction_key, feature_ids_config.ancient_legacy)
						and (not has_active_legacy)
					then
						return true
					end
				end
			end
			return false
		end,
	--}

	-- ai methods
	--{

		get_wonder_keys_owned_by_faction = function(self, owning_faction)
			local result = {}

			for _, wonder in ipairs(khufu_config.wonders) do
				local region = cm:get_region(wonder.region_key)
				if not region or region:is_null_interface() then
					script_error("Could not find region " .. wonder.region_key)
					return result
				end
				if region:owning_faction():name() == owning_faction then
					table.insert(result, wonder.key)
				end
			end

			return result
		end,

		ai_get_random_legacy = function(self, faction_key, legacy_type)
			if self.persistent.claimed[faction_key] then
				return
			end

			if not is_table(ancient_legacy_ai_list[legacy_type]) then
				return
			end

			local legacies_weights = {}
			local total_weight = 0
			for idx, data in ipairs(ancient_legacy_ai_list[legacy_type]) do
				table.insert(legacies_weights, data.weight + data.condition(faction_key) * data.condition_bonus)
				total_weight = total_weight + legacies_weights[idx]
			end

			local random_number = cm:model():random_int(1, total_weight)

			for idx, data in ipairs(ancient_legacy_ai_list[legacy_type]) do
				local current_weight = legacies_weights[idx]

				random_number = random_number - current_weight

				if random_number <= 0 then
					output("Picking legacy " .. data.legacy .. " for faction " .. faction_key)
					self:choose_legacy(data.legacy, faction_key)
					return
				end
			end
		end,
	--}

	-- generic methods
	--{
		--- @function refresh_claimed_legacies
		--- @desc deletes all the legacies claimed by destroyed factions
		refresh_claimed_legacies = function(self)
			for faction_key, data in pairs(self.persistent.claimed) do
				local faction = cm:get_faction(faction_key)
				if faction:is_dead() then
					self.persistent.claimed[faction_key] = nil
					for idx, key in ipairs(self.persistent.factions_with_a_legacy) do
						if faction_key == key then
							table.remove(self.persistent.factions_with_a_legacy, idx)
							break
						end
					end

					self.persistent.legacy_groups[faction_key] = nil
				end
			end
		end,

		--- @function faction_has_claimed_legacy
		--- @desc checks if a specific faction has claimed a specific legacy
		--- @p string faction_key - the key for the faction
		--- @p string legacy_file_name - the file name for the legacy
		--- @return boolean - true if the faction has claimed the legacy, false otherwise
		faction_has_claimed_legacy = function(self, faction_key, legacy_file_name)
			if not is_table(self.persistent) or not is_table(self.legacies) then
				return false
			end
			if not is_table(self.persistent.claimed[faction_key]) then
				return false
			end

			local all_legacies_by_faction = self.persistent.claimed[faction_key]

			local result = all_legacies_by_faction[legacy_file_name]
			-- "return result and true" does the same thing and is shorter, but a touch harder to debug 
			if result then 
				return true
			else
				return false
			end
		end,

		--- @function faction_claimed_legacies
		--- @desc returns the table of claimed legacies for the given faction
		--- @p string faction_key - the key for the faction
		--- @return table - table containing the legacies claimed by the faction or nil
		faction_claimed_legacies = function(self, faction_key)
			if not is_table(self.persistent) or not is_table(self.legacies) then
				return nil
			end

			local faction_legacies = self.persistent.claimed[faction_key]

			if not is_table(faction_legacies) then
				return nil
			end

			return faction_legacies
		end,

		--- @function get_faction_legacy_object
		--- @desc returns the instance of the ancient legacy by faction and filename
		--- @p object self - the ancient_legacy_common object
		--- @p string faction_key - the name of the faction we're interested in
		--- @p string legacy_file_name - the legacy we're interested in
		--- @return object legacy_obj - the object for the ancient legacy for the provided faction, or nil if none was found
		get_faction_legacy_object = function(self, faction_key, legacy_file_name)
			if (not is_table(self.persistent))
				or (not is_table(self.persistent.claimed))
				or (not is_table(self.legacies)) then
				return nil
			end

			local all_legacies_by_faction = self.persistent.claimed[faction_key]
			if not is_table(all_legacies_by_faction) then
				return nil
			end

			local result = all_legacies_by_faction[legacy_file_name]
			return result
		end,

		--- @function are_listeners_installed
		--- @desc checks if listeners have been installed for a legacy mechanic
		--- @return boolean - true if listeners were installed, false otherwise
		are_listeners_installed = function(self, legacy_file_name)
			for faction_key, faction_data in pairs(self.persistent.claimed) do
				if faction_data[legacy_file_name] then
					return true
				end
			end

			return false
		end,
		
		run_listeners_for_legacy = function(self, context, legacy_file_name, listener_data)
			local check_function = function(legacy_obj)
				local condition = listener_data.condition
				return (is_function(condition) and listener_data.condition(legacy_obj, context)) or (is_boolean(condition) and condition)
			end

			local event_faction = is_function(context.faction) and context:faction()
			local event_faction_cqi = is_function(context.faction_cqi) and context:faction_cqi()
			if not event_faction and event_faction_cqi then
				event_faction = cm:model():faction_for_command_queue_index(event_faction_cqi)
			end

			-- auto_check_faction is used to check if the event is relevant to the faction
			-- without having to write it in every condition for every listener
			if not listener_data.auto_check_faction or not event_faction or event_faction:is_null_interface() then
				for _, faction_key in ipairs(self.persistent.factions_with_a_legacy) do
					local legacy_obj = self.persistent.claimed[faction_key][legacy_file_name]
					if legacy_obj and check_function(legacy_obj) then
						listener_data.callback(legacy_obj, context)
					end
				end

				return
			end

			local event_faction_key = event_faction:name()
			for _, faction_key in ipairs(self.persistent.factions_with_a_legacy) do
				local legacy_obj = self.persistent.claimed[faction_key][legacy_file_name]
				if legacy_obj and faction_key == event_faction_key and check_function(legacy_obj) then
					listener_data.callback(legacy_obj, context)
				end
			end
		end,

		--- @function add_listeners_for_legacy
		--- @desc creates listeners for an ancient legacy object
		--- @p object self - the ancient_legacy_common object
		--- @p string legacy_file_name - the name of the file used for this legacy
		--- @p object legacy_obj - the object for the ancient legacy
		add_listeners_for_legacy = function(self, legacy_file_name, legacy_obj)
			local listeners_to_install = (is_function(legacy_obj.get_listeners) and legacy_obj:get_listeners()) or {}

			for index, listener_data in ipairs(listeners_to_install) do
				core:add_listener(
						legacy_file_name .. listener_data.event .. tostring(index),
						listener_data.event,
						true,
						function(context)
							self:run_listeners_for_legacy(context, legacy_file_name, listener_data)
						end,
						listener_data.persistent ~= false
				)
			end
		end,

		--- @function choose_legacy
		--- @desc creates an ancient legacy object and sets it as claimed by the  faction. Looks for the data in ancient_legacy_common.legacies by key
		--- @p object self - the ancient_legacy_common object
		--- @p string legacy_file_name - the name of the file used for this legacy
		--- @p string faction_key - the name of the faction claiming this ancient legacy
		choose_legacy = function(self, legacy_file_name, faction_key)
			if not is_table(self.persistent) or not is_table(self.legacies) then
				return
			end
			
			self:refresh_claimed_legacies()

			if not is_table(self.persistent.claimed[faction_key]) then
				self.persistent.claimed[faction_key] = {}
				table.insert(self.persistent.factions_with_a_legacy, faction_key)
			end

			local new_legacy_obj = self:create_legacy_object(legacy_file_name)

			if not self:are_listeners_installed(legacy_file_name) then
				self:add_listeners_for_legacy(legacy_file_name, new_legacy_obj)
			end

			local all_legacies_by_faction = self.persistent.claimed[faction_key]
			all_legacies_by_faction[legacy_file_name] = new_legacy_obj
			new_legacy_obj:on_legacy_claimed(faction_key)

			local faction = cm:get_faction(faction_key)
			cm:set_script_state(faction, "legacy_claimed_" .. legacy_file_name, true)

			local comma_separated_legacies_claimed = ""
			for legacy, _ in pairs(self.persistent.claimed[faction_key]) do
				comma_separated_legacies_claimed = comma_separated_legacies_claimed .. legacy .. ","
			end

			cm:set_script_state(faction, "legacies_claimed", comma_separated_legacies_claimed)

			core:trigger_event("AncientLegacyClaimed", { faction = faction, ancient_legacy_name = legacy_file_name })
			local legacy_warning = core:get_ui_root():SequentialFind(self.config.ui.legacy_panel_button_container, self.config.ui.legacy_select_alert_icon)
			if legacy_warning then
				legacy_warning:SetVisible(false)
			end
		end,

		--- @function create_legacy_object
		--- @desc creates an ancient legacy object. used for brand new objects or for loading from save file
		--- @p object self - the ancient_legacy_common object
		--- @p string legacy_file_name - the name of the file used to create this legacy
		--- @p [opt] object o - data from the save file, if we are loading
		--- @return object - the new legacy object, or nil if there was an error
		create_legacy_object = function(self, legacy_file_name, o)
			-- copied from invasion:new(o), but done as a factory method

			local script_template =  self.legacies[legacy_file_name]
			if not is_table(script_template) then
				output("Error: the given ancient legacy '" .. legacy_file_name .. "' is not among the provided ones from ancient_legacy_common.ancient_legacy_files!")
				return nil
			end
			
			o = o or {persistent = table_deep_copy(script_template.persistent)}
			
			setmetatable(o, script_template)
			script_template.__index = script_template
			return o
		end,

		get_legacy_common_persistent = function(self, legacy_file_name)
			-- for save migration
			if not self.persistent.common_persistent then
				self.persistent.common_persistent = {}
			end

			if not self.persistent.common_persistent[legacy_file_name] then
				self.persistent.common_persistent[legacy_file_name] = {}
			end

			return self.persistent.common_persistent[legacy_file_name]
		end,
	--}

	-- UI methods
	--{
		-- hides and shows the button to choose a legacy
		update_legacies_button_visibility = function(self, simulate_click_on_show)
			local button_container_id = self.config.ui.legacy_panel_button_container
			local button_container_component = core:get_ui_root():SequentialFind(button_container_id)
			if not button_container_component then
				return
			end

			local local_faction_name = cm:get_local_faction_name(true)

			local has_active_legacy = is_table(self.persistent.claimed[local_faction_name])
			local has_forge_own_path = forge_path.is_any_system_unlocked(local_faction_name)
			local show_button = (not has_active_legacy) and (not has_forge_own_path)

			button_container_component:SetVisible(show_button)

			local button_id = self.config.ui.legacy_panel_button
			local button_component = button_container_component:SequentialFind(button_id)
			local warning_component = button_container_component:SequentialFind(self.config.ui.legacy_select_alert_icon)
			if not (button_component and warning_component) then
				return
			end

			local enable_button = self:faction_can_claim_any_legacy(local_faction_name)
			if enable_button then
				cm:override_ui("disable_legacies", false);
				warning_component:SetVisible(true)
				if simulate_click_on_show then
					button_component:SimulateLClick()
				end
				button_component:SetTooltipText(self.config.ui.legacy_button_enabled_tooltip, true)
			else
				cm:override_ui("disable_legacies", true);
				warning_component:SetVisible(false)
				button_component:SetTooltipText(self.config.ui.legacy_button_disabled_tooltip, true)
			end
		end,

		--fills a card with the legacy stuff
		fill_legacy_card = function(self, card, legacy)
			local text_data = ancient_legacy_ui_data[legacy]

			local legacy_name = card:SequentialFind("dy_legacy")
			legacy_name:SetText(common.get_localised_string(text_data.localised_name), text_data.localised_name)

			local action_title = card:SequentialFind("dy_call_to_action_title")
			action_title:SetText(common.get_localised_string(text_data.action_text), text_data.action_text)

			local mechanic_image = card:SequentialFind("legacy_art")
			mechanic_image:SetImagePath(text_data.mechanic_image)

			if legacy == "phar_ancient_legacy_hatshepsut" then
				local button_read_more = card:SequentialFind("button_read_more")
				if button_read_more then
					local local_faction = cm:get_local_faction(true)
					button_read_more:SetState(local_faction:home_region():is_null_interface() and "inactive" or "active")
				end
			end
		end,

		-- fills the selected card screen for a mechanic
		fill_selected_mechanic = function(self, card, legacy)
			local text_data = ancient_legacy_ui_data[legacy]

			local legacy_name = card:SequentialFind("dy_legacy")
			legacy_name:SetText(common.get_localised_string(text_data.localised_name), text_data.localised_name)

			local main_header = card:SequentialFind("main_header")
			main_header:SetText(common.get_localised_string(text_data.main_header), text_data.main_header)

			local sub_header = card:SequentialFind("sub_header")
			sub_header:SetText(common.get_localised_string(text_data.sub_header), text_data.sub_header)

			for idx, data in ipairs(text_data.preview_images_and_text) do
				local info_card = card:SequentialFind("info_card_" .. idx)
				if info_card then
					local text = info_card:SequentialFind("card_text")
					if text then
						text:SetText(common.get_localised_string(data.text), data.text)
					end

					local card_image = info_card:SequentialFind("legacy_art")
					if card_image then
						card_image:SetImagePath(data.image)
					end
				end
			end
		end,

		-- fills the legacy panel with elements
		generate_legacy_ui_elements = function(self)
			local local_faction_name = cm:get_local_faction_name(true)
			local panel = core:get_ui_root():SequentialFind(self.config.ui.ancient_legacy_panel)
			for legacy_group_key, legacy_group in pairs(ancient_legacy_files) do
				if self:faction_can_claim_from_legacies_group(local_faction_name, legacy_group_key) then
					for _, legacy_file_name in ipairs(legacy_group) do
						self:generate_legacy_ui_element(legacy_file_name, legacy_group_key)
					end
				end
			end
		end,

		-- initializes an UI element for a legacy - quite placeholder for now
		generate_legacy_ui_element = function(self, legacy_file_name, legacy_group)
			-- this should actually instantiate the template
			local panel = core:get_ui_root():SequentialFind(self.config.ui.ancient_legacy_panel)
			panel:InterfaceFunction("create_mechanic_card", legacy_file_name)
			local card = panel:SequentialFind(legacy_file_name)
			if not card then
				return
			end

			self:fill_legacy_card(card, legacy_file_name)
		end,

		-- listeners for the choose legacy panel - they should only be attached while the panel is opened
		-- removed by AncientLegaciesCommon_PanelClosedCampaign
		add_click_listeners = function(self, context)
			--ancient_legacies_common_ComponentLClickUp_select
			core:add_listener(
				"ancient_legacies_common_ComponentLClickUp_select",
				"ComponentLClickUp",
				function(ctx)
					local comp = UIComponent(ctx.component)
					return uicomponent_descended_from(comp, self.config.ui.ancient_legacy_panel) and ctx.string == "button_read_more"
				end,
				function(ctx)
					local comp = UIComponent(ctx.component)
					local panel = core:get_ui_root():SequentialFind(self.config.ui.ancient_legacy_panel)

					local card_component_id = comp:GetProperty("mechanic")
					local clicked_card = panel:SequentialFind(card_component_id)
					local card_containter = UIComponent(clicked_card:Parent())

					local num_images = #ancient_legacy_ui_data[card_component_id].preview_images_and_text
					panel:InterfaceFunction("select_mechanic", card_component_id, num_images)

					local selected_card_component = panel:SequentialFind("selected_card")
					self:fill_selected_mechanic(selected_card_component, card_component_id)
				end,
				true
			)

			--ancient_legacies_common_ComponentLClickUp_unselect
			core:add_listener(
				"ancient_legacies_common_ComponentLClickUp_unselect",
				"ComponentLClickUp",
				function(ctx)
					local comp = UIComponent(ctx.component)
					return uicomponent_descended_from(comp, self.config.ui.ancient_legacy_panel) and ctx.string == "back_button"
				end,
				function(ctx)
					local comp = UIComponent(ctx.component)
					local panel = core:get_ui_root():SequentialFind(self.config.ui.ancient_legacy_panel)

					panel:InterfaceFunction("unselect_mechanic")
				end,
				true
			)

			--ancient_legacies_common_ComponentLClickUp_change_selection_left
			core:add_listener(
				"ancient_legacies_common_ComponentLClickUp_change_selection_left",
				"ComponentLClickUp",
				function(ctx)
					local comp = UIComponent(ctx.component)
					return uicomponent_descended_from(comp, self.config.ui.ancient_legacy_panel) and comp and ctx.string == "previous_button"
				end,
				function(ctx)
					local comp = UIComponent(ctx.component)
					local panel = core:get_ui_root():SequentialFind(self.config.ui.ancient_legacy_panel)

					local current_mechanic = comp:GetProperty("mechanic")
					local card_index = panel:InterfaceFunction("get_mechanic_card_index", current_mechanic)
					local prev_idx = 0
					if card_index == 0 then
						prev_idx = panel:InterfaceFunction("get_total_mechanic_cards_count") - 1
					else
						prev_idx = card_index - 1
					end

					local prev_mechanic = panel:InterfaceFunction("get_mechanic_name_for_card_index", prev_idx)
					local num_images = #ancient_legacy_ui_data[prev_mechanic].preview_images_and_text
					panel:InterfaceFunction("change_selection", prev_mechanic, num_images)

					local selected_card_component = panel:SequentialFind("selected_card")
					self:fill_selected_mechanic(selected_card_component, prev_mechanic)
				end,
				true
			)

			--ancient_legacies_common_ComponentLClickUp_change_selection_right
			core:add_listener(
				"ancient_legacies_common_ComponentLClickUp_change_selection_right",
				"ComponentLClickUp",
				function(ctx)
					local comp = UIComponent(ctx.component)
					return uicomponent_descended_from(comp, self.config.ui.ancient_legacy_panel) and comp and ctx.string == "next_button"
				end,
				function(ctx)
					local comp = UIComponent(ctx.component)
					local panel = core:get_ui_root():SequentialFind(self.config.ui.ancient_legacy_panel)

					local current_mechanic = comp:GetProperty("mechanic")
					local card_index = panel:InterfaceFunction("get_mechanic_card_index", current_mechanic)
					local next_idx = 0
					if card_index == panel:InterfaceFunction("get_total_mechanic_cards_count") - 1 then
						next_idx = 0
					else
						next_idx = card_index + 1
					end

					local next_mechanic = panel:InterfaceFunction("get_mechanic_name_for_card_index", next_idx)
					local num_images = #ancient_legacy_ui_data[next_mechanic].preview_images_and_text
					panel:InterfaceFunction("change_selection", next_mechanic, num_images)

					local selected_card_component = panel:SequentialFind("selected_card")
					self:fill_selected_mechanic(selected_card_component, next_mechanic)
				end,
				true
			)

			--ancient_legacies_common_pick_legacy_ComponentLClickUp
			core:add_listener(
				"ancient_legacies_common_pick_legacy_ComponentLClickUp",
				"ComponentLClickUp",
				function(ctx)
					local comp = UIComponent(ctx.component)
					return comp and ctx.string == self.config.ui.ancient_legacy_select_button
				end,
				function(ctx)
					local comp = UIComponent(ctx.component)

					local panel = core:get_ui_root():SequentialFind(self.config.ui.ancient_legacy_panel)
					local card = panel:SequentialFind("selected_card")
					local selected_mechanic = card:GetProperty("mechanic")

					local text_key = self.config.ui.legacy_select_ui_confirm
					local localised_text = common:get_localised_string(text_key)
					local local_faction_key = cm:get_local_faction_name(true)
					-- display a special message for Akhenaten in some cases
					if selected_mechanic == "phar_ancient_legacy_akhenaten" then
						local additional_text = ""
						local total_refund = nil
						if is_sea_playable_faction(local_faction_key) then
							text_key = self.config.ui.legacy_select_ui_confirm_sea
							additional_text = common:get_localised_string(text_key)
							total_refund = deities.get_idol_refund_cost(local_faction_key)
						end
						if deities.faction_has_dwelling_gods(local_faction_key) then
							text_key = self.config.ui.legacy_select_ui_confirm_dwellings
							additional_text = additional_text .. common:get_localised_string(text_key)
							local dwelling_refund = deities.get_dwellings_refund_cost(local_faction_key)
							if not total_refund then
								total_refund = dwelling_refund
							else
								total_refund:add(dwelling_refund)
							end
						end
						if total_refund then
							additional_text = additional_text .. common:get_localised_string(self.config.ui.legacy_select_ui_confirm_refund) .. total_refund:to_string()
						end
						localised_text = common.string_safe_format(localised_text, additional_text)
					end

					create_confirmation_box_with_text_from_script(
						"confirm_select_ancient_legacy",
						localised_text,
						text_key,
						--Confirm
						function()
							local calling_faction_key = cm:get_local_faction_name(true)
							local faction = cm:get_faction(calling_faction_key)
							local faction_cqi = faction:command_queue_index()
							local param_str = "legacy_claim:" .. selected_mechanic .. ":" .. calling_faction_key
							CampaignUI.TriggerCampaignScriptEvent(faction_cqi, param_str)
							panel:InterfaceFunction("close_panel")
						end,
						--Cancel,
						nil,
						panel,
						common:get_localised_string(self.config.ui.legacy_select_ui_title),
						self.config.ui.legacy_select_ui_title
					)
				end,
				true
			)

			--ancient_legacies_common_close_ComponentLClickUp
			core:add_listener(
				"ancient_legacies_common_close_ComponentLClickUp",
				"ComponentLClickUp",
				function(ctx)
					local comp = UIComponent(ctx.component)
					return uicomponent_descended_from(comp, self.config.ui.ancient_legacy_panel) and comp and ctx.string == "button_close"
				end,
				function(ctx)
					local panel = core:get_ui_root():SequentialFind(self.config.ui.ancient_legacy_panel)
					panel:InterfaceFunction("close_panel")
				end,
				true
			)
		end,
	--},
}

ancient_legacy_common.require_files()

--------------------------------------------------------------
----------------------- SAVING / LOADING ---------------------
--------------------------------------------------------------

function save_ancient_legacies(context)
	cm:save_named_value("Ancient_Legacies", ancient_legacy_common.persistent, context)
end

function load_ancient_legacies(context)
	local loaded_persistent = cm:load_named_value("Ancient_Legacies", ancient_legacy_common.persistent, context)
	out.savegame("\t"..tostring(loaded_persistent))
	output("Loaded legacies common")
	
	if loaded_persistent == nil or next(loaded_persistent.claimed) == nil then
		out.savegame("\tThere are no saved claimed legacies")
		output("\tThere are no saved claimed legacies")
	end
	
	local listeners_loaded = {}
	for faction_key, legacies_for_faction in pairs(loaded_persistent.claimed) do
		out.savegame("\t\tKey: "..tostring(faction_key)..", Value: "..tostring(legacies_for_faction))
		output("\t\tKey: "..tostring(faction_key)..", Value: "..tostring(legacies_for_faction))

		if not is_table(ancient_legacy_common.persistent.claimed[faction_key]) then
			ancient_legacy_common.persistent.claimed[faction_key] = {}
		end 

		local all_legacies_by_faction = {}
		for legacy_file_name, legacy_value in pairs(legacies_for_faction) do
			local loaded_legacy = ancient_legacy_common:create_legacy_object(legacy_file_name, legacy_value)

			if loaded_legacy ~= nil then
				all_legacies_by_faction[legacy_file_name] = loaded_legacy
				loaded_legacy:on_loading_game(faction_key)

				if not listeners_loaded[legacy_file_name] then
					listeners_loaded[legacy_file_name] = true
					ancient_legacy_common:add_listeners_for_legacy(legacy_file_name, loaded_legacy)
				end
			end
		end

		ancient_legacy_common.persistent.claimed[faction_key] = all_legacies_by_faction
		table.insert(ancient_legacy_common.persistent.factions_with_a_legacy, faction_key)
	end

	ancient_legacy_common.persistent.legacy_groups = loaded_persistent.legacy_groups
	-- for save compatibility
	if not ancient_legacy_common.persistent.legacy_groups then
		ancient_legacy_common.persistent.legacy_groups = {}
	end

	if not ancient_legacy_common.persistent.unlocked then
		ancient_legacy_common.persistent.unlocked = {}
	end

	ancient_legacy_common.persistent.common_persistent = loaded_persistent.common_persistent
end

cm:add_saving_game_callback(function(context) save_ancient_legacies(context) end)
cm:add_loading_game_callback(function(context) load_ancient_legacies(context) end)

-- should be safe for MP
legacies_cheat = 
{
	choose_legacy = function(self, legacy_file_name, faction_key)
		local faction_cqi = nil
		if faction_key then
			local faction_obj = cm:get_faction(faction_key)
			if faction_obj then
				faction_cqi = faction_obj:command_queue_index()
			else
				output("Cannot use the cheat on faction key: " .. faction_key .. ", cannot find the faction")
				return
			end
		else
			local local_faction = cm:get_local_faction_name(true)
			local local_faction_obj = cm:get_faction(local_faction)
			faction_cqi = local_faction_obj:command_queue_index()
		end

		local param_str = "legacy_claim:" .. legacy_file_name .. ":"
		CampaignUI.TriggerCampaignScriptEvent(faction_cqi, param_str)
	end,

	choose_khufu = function(self, faction_key)
		legacies_cheat:choose_legacy("phar_ancient_legacy_khufu", faction_key)
	end,

	choose_hatshepsut = function(self, faction_key)
		legacies_cheat:choose_legacy("phar_ancient_legacy_hatshepsut", faction_key)
	end,

	choose_akhenaten = function(self, faction_key)
		legacies_cheat:choose_legacy("phar_ancient_legacy_akhenaten", faction_key)
	end,

	choose_thutmose = function(self, faction_key)
		legacies_cheat:choose_legacy("phar_ancient_legacy_thutmose", faction_key)
	end,

	choose_muwatalli = function(self, faction_key)
		legacies_cheat:choose_legacy("phar_ancient_legacy_muwatalli", faction_key)
	end,

	choose_tudhaliya = function(self, faction_key)
		legacies_cheat:choose_legacy("phar_ancient_legacy_tudhaliya", faction_key)
	end,

	choose_perseus = function(self, faction_key)
		legacies_cheat:choose_legacy("phar_ancient_legacy_perseus", faction_key)
	end,

	choose_atreus = function(self, faction_key)
		legacies_cheat:choose_legacy("phar_ancient_legacy_atreus", faction_key)
	end,

	choose_hammurabi = function(self, faction_key)
		legacies_cheat:choose_legacy("phar_ancient_legacy_hammurabi", faction_key)
	end,

	choose_sargon = function(self, faction_key)
		legacies_cheat:choose_legacy("phar_ancient_legacy_sargon", faction_key)
	end,
}

-- model listeners
--{
	-- called on each game load
	cm:add_first_tick_callback(
		function(context)
			ancient_legacy_common:update_legacies_button_visibility(false)
		end
	)

	-- AncientLegaciesCommon_LegacyClaims_UITriggerScriptEvent
	core:add_listener (
		"AncientLegaciesCommon_UITriggerScriptEvent",
		"UITriggerScriptEvent",
		function(context)
			return context:trigger():split(":")[1] == "legacy_claim"
		end,
		function(context)
			local params = context:trigger():split(":")
			local legacy_file = params[2]

			--local event_faction = is_function(context.faction) and context:faction()
			local faction_cqi = context:faction_cqi()
			local faction = cm:model():faction_for_command_queue_index(faction_cqi)
			local faction_key = faction:name()
			ancient_legacy_common:choose_legacy(legacy_file, faction_key)
			local local_faction_name = cm:get_local_faction_name(true)
			if local_faction_name == faction_key then
				ancient_legacy_common:update_legacies_button_visibility()
			end

			if not faction:faction_leader():is_null_interface() then
				cm:add_event_feed_event(
					ancient_legacy_common.config.events.legacy_chosen.event_key,
					faction_key,
					0,
					ancient_legacy_ui_data[legacy_file].localised_name or "",
					cm:char_lookup_str(faction:faction_leader():command_queue_index())
				)
			end
		end,
		true
	)

	-- AncientLegaciesCommon_FactionTurnStart
	core:add_listener (
		"AncientLegaciesCommon_FactionTurnStart",
		"FactionTurnStart",
		true,
		function(context)
			local faction = context:faction()
			local faction_key = faction:name()

			if faction_key == cm:get_local_faction_name(true) then
				ancient_legacy_common:update_legacies_button_visibility(false)
			end
		end,
		true
	)
--}

-- UI listeners
--{
	-- AncientLegaciesCommon_PanelOpenedCampaign
	core:add_listener (
		"AncientLegaciesCommon_PanelOpenedCampaign",
		"PanelOpenedCampaign",
		function(context) 
			return context.string == ancient_legacy_common.config.ui.ancient_legacy_panel
		end,
		function(context)
			ancient_legacy_common:generate_legacy_ui_elements()
			ancient_legacy_common:add_click_listeners()
		end,
		true
	)

	-- AncientLegaciesCommon_PanelClosedCampaign
	core:add_listener (
		"AncientLegaciesCommon_PanelClosedCampaign",
		"PanelClosedCampaign",
		function(context) 
			return context.string == ancient_legacy_common.config.ui.ancient_legacy_panel
		end,
		function(context)
			core:remove_listener("ancient_legacies_common_ComponentLClickUp_change_selection_left")
			core:remove_listener("ancient_legacies_common_ComponentLClickUp_change_selection_right")
			core:remove_listener("ancient_legacies_common_ComponentLClickUp_unselect")
			core:remove_listener("ancient_legacies_common_ComponentLClickUp_select")
			core:remove_listener("ancient_legacies_common_close_ComponentLClickUp")
			core:remove_listener("ancient_legacies_common_hover_pick_legacy_ComponentMouseOn")
			core:remove_listener("ancient_legacies_common_hover_pick_legacy_ComponentMouseOff")
			core:remove_listener("ancient_legacies_common_pick_legacy_ComponentLClickUp")
		end,
		true
	)
--}

return ancient_legacy_common