out("Loading phar_refugee_camps.lua")

refugee_camps = {
	config = {
		-- Percent chance per turn for each Refugee Camp to spawn a unit. High/normal/low chance (used with pillars state)
		spawn_chances = { 30, 30, 30 },

		-- Chance to roll attribute
		chance_to_roll_attribute = 100,

		-- Weight for veterancy level roll once attribute is given
		weight_for_rolling_veterancy = {
			veterancy_1 = 50,
			veterancy_2 = 25,
			veterancy_3 = 15,
			veterancy_4 = 10,
		},

		-- The dummy attribute used in UI to mark this unit as coming from a Refugee Camp
		refugee_attribute = "refugee",

		-- Attributes randomly given to the spawned units
		attribute_pool = {
			"armour_breaker",
			"breakthrough_charge",
			"causes_dread",
			"causes_fear",
			"disciplined",
			"encourages",
			"expendable",
			"fatigue_res",
			"fatigue_weakness",
			"flanking_attack_improved",
			"flanking_defence_improved",
			"furious_charge",
			"guerrilla_deploy",
			"ignore_forest_penalties",
			"immune_to_psychology",
			"rear_defence",
			"resist_heat",
			"scare_immune",
			"storm_warriors",
			"unspottable",
		},

		spawn_refugee_units_enabled_shared_state_id = "refugee_camps_spawn_refugee_units_enabled",

		-- Unit rosters for each zone
		-- <template name> = {
		--     provinces = {...}, -- Provinces in this zone
		--     units = {{ unit_key = "phar_xyz", weight = 123 },...}      -- Units that will be randomly spawned in the refugee camps built at ERSes in the regions of those provinces
		-- }

		unit_templates = {
			anatolia = {
				provinces = {
					"phar_main_ancyra",
					"phar_main_central_hatti",
					"phar_main_hattusa",
					"phar_main_kanesh",
					"phar_main_malidiya",
					"phar_main_north_hatti",
					"phar_main_purushanda",
					"phar_main_west_hatti",
					"phar_main_zippalanda",
					"phar_map_kammanu",
				},
				units = {
					-- Tier 4
					{ unit_key = "phar_main_nat_hig_heavy_anatolian_chariots"				, weight = 4 },
					{ unit_key = "phar_main_nat_hig_kaskian_raiders"						, weight = 4 },
					{ unit_key = "phar_main_nat_hig_renowned_phrygian_javelin_throwers"		, weight = 4 },
					{ unit_key = "phar_main_sea_aegean_armoured_raiders"					, weight = 4 },
					-- Tier 3
					{ unit_key = "phar_main_nat_hig_armoured_anatolian_spears"				, weight = 4 },
					{ unit_key = "phar_main_nat_hig_kaskian_chargers"						, weight = 4 },
					{ unit_key = "phar_main_nat_hig_phrygian_skirmishers"					, weight = 4 },
					{ unit_key = "phar_main_sea_aegean_light_archers"						, weight = 4 },
					{ unit_key = "phar_main_sea_aegean_spear_chargers"						, weight = 4 },
					-- Tier 2
					{ unit_key = "phar_main_nat_hig_kaskian_axemen"							, weight = 10 },
					{ unit_key = "phar_main_nat_hig_phrygian_spearmen"						, weight = 10 },
					{ unit_key = "phar_main_nat_hig_anatolian_militia"						, weight = 10 },
					-- Tier 1
					{ unit_key = "phar_main_nat_hig_kaskian_javelin_throwers"				, weight = 18 },
					{ unit_key = "phar_main_nat_hig_kaskian_tribesmen"						, weight = 18 },
				}
			},
			coastal = {
				provinces = {
					"phar_main_abydos",
					"phar_main_akhmim",
					"phar_main_alashiya",
					"phar_main_aleppo",
					"phar_main_amarna",
					"phar_main_amunia",
					"phar_main_ashkelon",
					"phar_main_asyut",
					"phar_main_buhen",
					"phar_main_buto",
					"phar_main_elephantine",
					"phar_main_faiyum",
					"phar_main_hardai",
					"phar_main_heliopolis",
					"phar_main_herakleopolis",
					"phar_main_hermopolis",
					"phar_main_kadesh",
					"phar_main_kawa",
					"phar_main_kerma",
					"phar_main_kom_ombo",
					"phar_main_megiddo",
					"phar_main_memphis",
					"phar_main_napata",
					"phar_main_north_nubia",
					"phar_main_north_sinai",
					"phar_main_parha",
					"phar_main_per_ramesses_meri_amon",
					"phar_main_pi_ramesses",
					"phar_main_rhacotis",
					"phar_main_saww",
					"phar_main_south_hatti",
					"phar_main_tarsus",
					"phar_main_thebes",
					"phar_main_tuwana",
					"phar_main_tyre",
					"phar_main_ugarit",
					"phar_map_achaea",
					"phar_map_aetolia",
					"phar_map_attica",
					"phar_map_boreas_nesoi",
					"phar_map_caria",
					"phar_map_cephallenia",
					"phar_map_cyclades",
					"phar_map_epirus",
					"phar_map_kaftiu",
					"phar_map_karkisha",
					"phar_map_laconia",
					"phar_map_lycia",
					"phar_map_mira",
					"phar_map_mygdonia",
					"phar_map_pala",
					"phar_map_peonia",
					"phar_map_rhodes",
					"phar_map_seha",
					"phar_map_thessaly",
					"phar_map_thrace",
					"phar_map_thynia",
					"phar_map_tjehenu",
					"phar_map_wilusha",
					"phar_map_zalpuwa",
					"phar_map_lazpa",
				},
				units = {
					-- Tier 5
					{ unit_key = "phar_main_sea_aegean_armoured_archers"					, weight = 2 },
					{ unit_key = "phar_main_sea_aegean_panoply_spearmen"					, weight = 2 },
					{ unit_key = "phar_main_sea_islander_raiders"							, weight = 2 },
					{ unit_key = "phar_main_sea_renowned_seafaring_raiders"					, weight = 2 },
					-- Tier 4
					{ unit_key = "phar_main_sea_aegean_armoured_javelin_throwers"			, weight = 2 },
					{ unit_key = "phar_main_sea_aegean_armoured_raiders"					, weight = 2 },
					{ unit_key = "phar_main_sea_marauder_slingers"							, weight = 2 },
					{ unit_key = "phar_main_sea_marauding_axe_chargers"						, weight = 2 },
					{ unit_key = "phar_main_sea_roving_khopesh_warriors"					, weight = 2 },
					-- Tier 3
					{ unit_key = "phar_main_sea_aegean_light_archers"						, weight = 4 },
					{ unit_key = "phar_main_sea_aegean_spear_chargers"						, weight = 4 },
					{ unit_key = "phar_main_sea_islander_heavy_axemen"						, weight = 4 },
					{ unit_key = "phar_main_sea_seafaring_javelinmen"						, weight = 4 },
					{ unit_key = "phar_main_sea_seafaring_raiders"							, weight = 4 },
					-- Tier 2
					{ unit_key = "phar_main_sea_aegean_fameseekers"							, weight = 10 },
					{ unit_key = "phar_main_sea_islander_swordsmen"							, weight = 10 },
					{ unit_key = "phar_main_sea_seafaring_slings"							, weight = 10 },
					-- Tier 1
					{ unit_key = "phar_main_sea_islander_young_spears"						, weight = 15 },
					{ unit_key = "phar_main_sea_seafaring_clubmen"							, weight = 15 },
				}
			},
			levant = {
				provinces = {
					"phar_main_carchemish",
					"phar_main_damascus",
					"phar_main_east_sinai",
					"phar_main_emar",
					"phar_main_shechem",
					"phar_main_sinai",
				},
				units = {
					-- Tier 5
					{ unit_key = "phar_main_sea_renowned_seafaring_raiders"					, weight = 10 },
					-- Tier 4
					{ unit_key = "phar_main_nat_fen_armoured_canaanite_chariots"			, weight = 4 },
					{ unit_key = "phar_main_nat_sin_habiru_mercenaries"						, weight = 4 },
					{ unit_key = "phar_main_nat_sin_renowned_habiru_slingers"				, weight = 4 },
					-- Tier 3
					{ unit_key = "phar_main_nat_sin_habiru_skirmishers"						, weight = 4 },
					{ unit_key = "phar_main_nat_sin_shasu_archers"							, weight = 4 },
					{ unit_key = "phar_main_nat_sin_shasu_warriors"							, weight = 4 },
					{ unit_key = "phar_main_sea_seafaring_javelinmen"						, weight = 4 },
					{ unit_key = "phar_main_sea_seafaring_raiders"							, weight = 4 },
					-- Tier 2
					{ unit_key = "phar_main_nat_sin_habiru_raiders"							, weight = 15 },
					{ unit_key = "phar_main_nat_sin_shasu_tribesmen"						, weight = 15 },
					-- Tier 1
					{ unit_key = "phar_main_nat_sin_habiru_archers"							, weight = 15 },
					{ unit_key = "phar_main_nat_sin_habiru_militia"							, weight = 15 },
				}
			},
			nubia = {
				provinces = {
					"phar_main_east_nubia",
					"phar_main_north_east_nubia",
				},
				units = {
					-- Tier 4
					{ unit_key = "phar_main_nat_nub_renowned_kushite_archers"				, weight = 5 },
					{ unit_key = "phar_main_nat_nub_renowned_nubian_longbowmen"				, weight = 5 },
					{ unit_key = "phar_main_sea_roving_khopesh_warriors"					, weight = 5 },
					-- Tier 3
					{ unit_key = "phar_main_nat_nub_kushite_spearmen"						, weight = 7 },
					{ unit_key = "phar_main_nat_nub_nubian_clubmen"							, weight = 7 },
					{ unit_key = "phar_main_nat_nub_nubian_longbowmen"						, weight = 7 },
					-- Tier 2
					{ unit_key = "phar_main_nat_nub_kushite_archers"						, weight = 10 },
					{ unit_key = "phar_main_nat_nub_kushite_spearmen_recruits"				, weight = 10 },
					{ unit_key = "phar_main_sea_islander_swordsmen"							, weight = 10 },
					-- Tier 1
					{ unit_key = "phar_main_nat_nub_nubian_bowmen"							, weight = 12 },
					{ unit_key = "phar_main_nat_nub_nubian_hunters"							, weight = 12 },
					{ unit_key = "phar_main_nat_nub_nubian_recruits"						, weight = 12 },
				}
			},
			western_desert = {
				provinces = {
					"phar_main_bahariya_oasis",
					"phar_main_dakhla_oasis",
					"phar_main_dungul_oasis",
					"phar_main_farafra_oasis",
					"phar_main_kharga_oasis",
					"phar_main_kurkur_oasis",
				},
				units = {
					-- Tier 4
					{ unit_key = "phar_main_nat_wes_libu_composite_bowmen"					, weight = 4 },
					{ unit_key = "phar_main_nat_wes_libu_desert_swords"						, weight = 4 },
					{ unit_key = "phar_main_sea_marauder_slingers"							, weight = 4 },
					{ unit_key = "phar_main_sea_marauding_axe_chargers"						, weight = 4 },
					-- Tier 3
					{ unit_key = "phar_main_nat_wes_libu_desert_skirmishers"				, weight = 5 },
					{ unit_key = "phar_main_nat_wes_libu_tribe_spears"						, weight = 5 },
					{ unit_key = "phar_main_nat_wes_libu_warriors"							, weight = 5 },
					{ unit_key = "phar_main_sea_islander_heavy_axemen"						, weight = 5 },
					-- Tier 2
					{ unit_key = "phar_main_nat_wes_libu_desert_runners"					, weight = 10 },
					{ unit_key = "phar_main_nat_wes_libu_hunters"							, weight = 10 },
					{ unit_key = "phar_main_nat_wes_libu_raiders"							, weight = 10 },
					-- Tier 1
					{ unit_key = "phar_main_nat_wes_libu_slingers"							, weight = 18 },
					{ unit_key = "phar_main_nat_wes_libu_tribesmen"							, weight = 18 },
				}
			},
			assuwa = {
				provinces = {
					"phar_map_arzawa",
					"phar_map_isthmos",
					"phar_map_masha",
				},
				units = {
					-- Tier 5
					{ unit_key = "phar_main_sea_aegean_panoply_spearmen"					, weight = 10 },
					-- Tier 4
					{ unit_key = "phar_map_nat_wil_archer_chariots"	              			, weight = 2 },
					{ unit_key = "phar_map_nat_wil_armoured_lycian_archers"					, weight = 2 },
					{ unit_key = "phar_map_nat_wil_heavy_shock_spears"						, weight = 2 },
					{ unit_key = "phar_map_nat_wil_heavy_trojan_spearmen"					, weight = 2 },
					{ unit_key = "phar_main_sea_aegean_armoured_javelin_throwers"			, weight = 2 },
					-- Tier 3
					{ unit_key = "phar_map_nat_wil_anatolian_swords"						, weight = 5 },
					{ unit_key = "phar_map_nat_wil_trojan_chariots"							, weight = 5 },
					{ unit_key = "phar_map_nat_wil_veteran_trojan_slingers"					, weight = 5 },
					{ unit_key = "phar_main_sea_aegean_spear_chargers"						, weight = 5 },
					-- Tier 2
					{ unit_key = "phar_map_nat_wil_coastal_club_fighters"					, weight = 8 },
					{ unit_key = "phar_map_nat_wil_eastern_spearmen"						, weight = 8 },
					{ unit_key = "phar_map_nat_wil_trojan_archers"							, weight = 8 },
					{ unit_key = "phar_main_sea_aegean_fameseekers"							, weight = 8 },
					-- Tier 1
					{ unit_key = "phar_map_nat_wil_trojan_slingers"							, weight = 15 },
					{ unit_key = "phar_map_nat_wil_trojan_warriors"							, weight = 15 },
				}
			},
			northern_mesopotamia = {
				provinces = {
					"phar_map_aranzah",
					"phar_map_ashtata",
					"phar_map_azalzi",
					"phar_map_balihu",
					"phar_map_hanigalbat",
					"phar_map_hayasa_azzi",
					"phar_map_kadmuhu",
					"phar_map_mari",
					"phar_map_qutu",
					"phar_map_radanu",
					"phar_map_suhum_elu",
					"phar_map_uruatri",
					"phar_map_zabu",					
				},
				units = {
					-- Tier 5
					{ unit_key = "phar_map_nat_zag_cimmerian_elite"							, weight = 10 },
					{ unit_key = "phar_main_sea_islander_raiders"							, weight = 10 },				
					-- Tier 4
					{ unit_key = "phar_map_nat_aber_ahlamu_heavy_camelry"					, weight = 3 },
					{ unit_key = "phar_map_nat_aber_ahlamu_raiders"							, weight = 3 },
					{ unit_key = "phar_map_nat_aber_aramean_elite"							, weight = 3 },
					{ unit_key = "phar_map_nat_assur_akkadian_defenders"					, weight = 3 },
					{ unit_key = "phar_map_nat_wil_heavy_shock_spears"						, weight = 3 },
					{ unit_key = "phar_map_nat_zag_urartu_guard"							, weight = 3 },
					{ unit_key = "phar_main_sea_roving_khopesh_warriors"					, weight = 3 },
					-- Tier 3
					{ unit_key = "phar_map_nat_aber_aramean_skirmishers"					, weight = 3 },
					{ unit_key = "phar_map_nat_aber_aramean_warriors"						, weight = 3 },
					{ unit_key = "phar_map_nat_assur_akkadian_chargers"						, weight = 3 },
					{ unit_key = "phar_map_nat_assur_akkadian_clubmen"						, weight = 3 },
					{ unit_key = "phar_map_nat_assur_akkadian_horsemen"						, weight = 3 },
					{ unit_key = "phar_map_nat_assur_akkadian_skirmishers"					, weight = 3 },
					{ unit_key = "phar_map_nat_zag_cimmerian_horse_archers"					, weight = 3 },
					{ unit_key = "phar_map_nat_zag_cimmerian_mounted_warriors"				, weight = 3 },
					{ unit_key = "phar_map_nat_zag_urartu_archers"							, weight = 3 },
					{ unit_key = "phar_map_nat_zag_urartu_defenders"						, weight = 3 },
					{ unit_key = "phar_map_nat_zag_urartu_warriors"							, weight = 3 },
					{ unit_key = "phar_main_sea_seafaring_raiders"							, weight = 3 },
					-- Tier 2
					{ unit_key = "phar_map_nat_aber_ahlamu_archers"							, weight = 10 },
					{ unit_key = "phar_map_nat_aber_ahlamu_camel_riders"					, weight = 10 },
					{ unit_key = "phar_map_nat_assur_akkadian_militia"						, weight = 10 },
					{ unit_key = "phar_map_nat_assur_akkadian_militia_spearmen"				, weight = 10 },
					{ unit_key = "phar_map_nat_zag_cimmerian_scouts"						, weight = 10 },
					{ unit_key = "phar_main_sea_islander_swordsmen"							, weight = 10 },
					-- Tier 1
					{ unit_key = "phar_map_nat_aber_ahlamu_nomads"							, weight = 9 },
					{ unit_key = "phar_map_nat_aber_ahlamu_pack_camels"						, weight = 9 },
					{ unit_key = "phar_map_nat_aber_aramean_tribesmen"						, weight = 9 },
					{ unit_key = "phar_map_nat_assur_akkadian_farmers"						, weight = 9 },
					{ unit_key = "phar_map_nat_assur_akkadian_hunters"						, weight = 9 },
					{ unit_key = "phar_map_nat_zag_urartu_hunters"							, weight = 9 },
					{ unit_key = "phar_map_nat_zag_urartu_tribesmen"						, weight = 9 },
				}
			},
			southern_mesopotamia = {
				provinces = {
					"phar_map_ashnunnak",
					"phar_map_bit_peri_amurru",
					"phar_map_kan_digirak",
					"phar_map_karduniash_ishtananu",
					"phar_map_karduniash_shutaiu",
					"phar_map_northern_elam",
					"phar_map_suhum_shaplu",					
				},
				units = {
					-- Tier 5
					{ unit_key = "phar_main_sea_renowned_seafaring_raiders"					, weight = 20 },
					-- Tier 4
					{ unit_key = "phar_map_nat_halt_elamite_veteran_archers"	   			, weight = 3 },
					{ unit_key = "phar_map_nat_halt_elamite_veteran_slingers"				, weight = 3 },
					{ unit_key = "phar_map_nat_halt_elamite_veteran_vanguard"				, weight = 3 },
					{ unit_key = "phar_map_nat_halt_elamite_veterans"						, weight = 3 },
					{ unit_key = "phar_map_nat_tamti_akkadian_armoured_archers"				, weight = 3 },
					{ unit_key = "phar_main_sea_marauding_axe_chargers"						, weight = 3 },
					-- Tier 3
					{ unit_key = "phar_map_nat_halt_elamite_vanguard"						, weight = 8 },
					{ unit_key = "phar_map_nat_tamti_akkadian_axemen"						, weight = 8 },
					{ unit_key = "phar_map_nat_tamti_akkadian_horsemen"						, weight = 8 },
					{ unit_key = "phar_map_nat_tamti_akkadian_warriors"						, weight = 8 },
					{ unit_key = "phar_main_sea_seafaring_javelinmen"						, weight = 8 },
					-- Tier 2
					{ unit_key = "phar_map_nat_halt_elamite_bowmen"							, weight = 8 },
					{ unit_key = "phar_map_nat_halt_elamite_defenders"						, weight = 8 },
					{ unit_key = "phar_map_nat_halt_elamite_slingers"						, weight = 8 },
					{ unit_key = "phar_map_nat_halt_elamite_warriors"						, weight = 8 },
					{ unit_key = "phar_map_nat_tamti_akkadian_archers"						, weight = 8 },
					{ unit_key = "phar_map_nat_tamti_akkadian_militia"						, weight = 8 },
					{ unit_key = "phar_map_nat_tamti_akkadian_militia_spearmen"				, weight = 8 },
					-- Tier 1
					{ unit_key = "phar_map_nat_halt_elamite_hillmen"						, weight = 20 },
					{ unit_key = "phar_map_nat_tamti_akkadian_farmers"						, weight = 20 },
					{ unit_key = "phar_main_sea_seafaring_clubmen"							, weight = 20 },
				}
			}
		}
	}
}

-- A province-indexed copy of the unit templates for easier access with weighted lists
refugee_camps.unit_templates_by_province = {}
for template_name, unit_template_data in pairs(refugee_camps.config.unit_templates) do
	-- Create a new weighted list for this template
	local weighted_list_for_template = weighted_list:new()

	-- Populate the weighted list with unit candidates
	for _, unit_data in ipairs(unit_template_data.units) do
		weighted_list_for_template:add_item(unit_data.unit_key, unit_data.weight)
	end

	-- Cache this weighted list for all provinces in this template
	for _, province_key in ipairs(unit_template_data.provinces) do
		refugee_camps.unit_templates_by_province[province_key] = weighted_list_for_template
	end
end

local function contained_units_count(slot)
	local garrison_residence = slot:garrison_residence()
	local garrison_army = garrison_residence and not garrison_residence:is_null_interface() and slot:garrison_residence():garrison_army()
	local garrison_army_num_units = garrison_army and not garrison_army:is_null_interface() and garrison_army:unit_list():num_items() or -1
	return garrison_army_num_units
end

function refugee_camps:spawn_refugee_units_for_faction(faction)
	local faction_regions = faction:region_list()

	for i = 0, faction_regions:num_items() - 1 do
		local region = faction_regions:item_at(i)
		local chance_to_spawn

		if cm:get_bool_script_state(region, refugee_camps.config.spawn_refugee_units_enabled_shared_state_id) then
			local slots = region:slot_list()
			for j = 0, slots:num_items() - 1 do
				local slot = slots:item_at(j)

				if slot:is_refugee_camp() then
					local unit_count = contained_units_count(slot)

					-- Determine the chance to spawn a unit
					local pillars_index = pillars_civilization.current_level_index
					-- Force high chance to spawn if too few units
					if unit_count <= 1 then
						pillars_index = 1 
					end
					-- Otherwise chance to spawn depends on pillars level
					local chance_to_spawn = refugee_camps.config.spawn_chances[pillars_index]

					-- Check if a unit should be spawned
					if (unit_count < slot:max_garrison_units()) and cm:model():random_percent(chance_to_spawn) then
						local weighted_unit_list = refugee_camps.unit_templates_by_province[region:province_name()]

						-- Select a unit based on weight
						local rolled_unit = weighted_unit_list:weighted_select()

						-- Rolls for adding properties to spawned unit
						if rolled_unit then
							local new_unit_cqi = cm:grant_unit_at_garrison(slot:slot_key(), rolled_unit)
							if new_unit_cqi then
								local new_unit = cm:model():unit_for_command_queue_index(new_unit_cqi)

								cm:add_unit_custom_attribute(new_unit_cqi, refugee_camps.config.refugee_attribute)

								-- Roll for attribute & veterancy
								if cm:model():random_percent(refugee_camps.config.chance_to_roll_attribute) then
									local new_unit_current_attributes = new_unit:get_all_attributes()
									local attribute_key = table_get_random_element(refugee_camps.config.attribute_pool)
									
								-- If the unit already has the attribute, re-roll it
									while table_find(new_unit_current_attributes, attribute_key, true) do
										attribute_key = table_get_random_element(refugee_camps.config.attribute_pool)
									end

									cm:add_unit_custom_attribute(new_unit_cqi, attribute_key)

									-- Veterancy roll: initialize and populate veterancy_weight_list here
									local veterancy_weight_list = weighted_list:new()
									veterancy_weight_list:add_item(1, refugee_camps.config.weight_for_rolling_veterancy["veterancy_1"])
									veterancy_weight_list:add_item(2, refugee_camps.config.weight_for_rolling_veterancy["veterancy_2"])
									veterancy_weight_list:add_item(3, refugee_camps.config.weight_for_rolling_veterancy["veterancy_3"])
									veterancy_weight_list:add_item(4, refugee_camps.config.weight_for_rolling_veterancy["veterancy_4"])

									local veterancy_level_roll = veterancy_weight_list:weighted_select()
									cm:add_experience_to_unit(new_unit_cqi, veterancy_level_roll)
								else
									-- No action needed
								end
								cm:notify_refugee_camp_unit_spawned(faction:command_queue_index())
							end
						end
					else
						-- No action needed
					end
				end
			end
		end
	end
end

core:add_listener(
	"RefugeeCamps_FactionTurnStart",
	"FactionTurnStart",
	function(context)
		return not context:faction():is_rebel()
	end,
	function(context)
		refugee_camps:spawn_refugee_units_for_faction(context:faction())
	end,
	true
)

core:add_listener(
	"RefugeeCamps_FirstTickAfterWorldCreated",
	"FirstTickAfterWorldCreated",
	true,
	function(context)
		-- existing saves won't have the shared state, so we give it a default value
		local region_list = cm:model():world():region_manager():region_list()
		local region_list_size = region_list:num_items() - 1
		for i = 0, region_list_size do
			local region = region_list:item_at(i)
			if not cm:has_bool_script_state(region, refugee_camps.config.spawn_refugee_units_enabled_shared_state_id) then
				cm:set_script_state(region, refugee_camps.config.spawn_refugee_units_enabled_shared_state_id, true)
			end
		end
	end,
	true
)

core:add_listener(
	"RefugeeCamps_RegionFactionChangeEvent",
	"RegionFactionChangeEvent",
	true,
	function(context)
		-- by design we need to change back to default value after the region has changed ownership
		cm:set_script_state(context:region(), refugee_camps.config.spawn_refugee_units_enabled_shared_state_id, true)
	end,
	true
)